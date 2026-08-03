#!/bin/bash

set -euo pipefail

OMZ_DIR="${ZSH:-$HOME/.oh-my-zsh}"
CUSTOM_DIR="${ZSH_CUSTOM:-$OMZ_DIR/custom}"
PLUGIN_DIR="$CUSTOM_DIR/plugins/ai-profile"
REPO_URL="https://github.com/wakefun/omz-ai-profile.git"
ZSHRC="$HOME/.zshrc"

if [ ! -d "$OMZ_DIR" ] || [ ! -d "$CUSTOM_DIR" ]; then
  echo "Error: oh-my-zsh is not installed."
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required to install or update this plugin."
  exit 1
fi

tmpdir=""
cleanup() {
  if [ -n "${tmpdir:-}" ] && [ -d "$tmpdir" ]; then
    rm -rf "$tmpdir"
  fi
}
trap cleanup EXIT

clone_and_copy() {
  tmpdir="$(mktemp -d)"
  git clone --depth=1 "$REPO_URL" "$tmpdir/omz-ai-profile"
  mkdir -p "$PLUGIN_DIR"
  rm -f "$PLUGIN_DIR/_claude" "$PLUGIN_DIR/_codex" "$PLUGIN_DIR/ai-profile.plugin.zsh"
  cp -r "$tmpdir/omz-ai-profile/ai-profile/." "$PLUGIN_DIR/"
}

if [ -d "$PLUGIN_DIR/.git" ] && [ -f "$PLUGIN_DIR/_claude" ] && [ -f "$PLUGIN_DIR/_codex" ] && [ -f "$PLUGIN_DIR/ai-profile.plugin.zsh" ]; then
  echo "Updating existing installation..."
  git -C "$PLUGIN_DIR" pull --ff-only
else
  if [ -d "$PLUGIN_DIR" ]; then
    echo "Updating existing installation..."
  else
    echo "Installing omz-ai-profile plugin..."
  fi
  clone_and_copy
fi

# Add ai-profile to plugins in .zshrc if not already present
if [ -f "$ZSHRC" ]; then
  if awk '
    /^[[:space:]]*plugins=\(/ && $0 !~ /^[[:space:]]*#/ {
      if ($0 ~ /(^|[[:space:](])ai-profile([[:space:])]|$)/) found=1
    }
    END { exit found ? 0 : 1 }
  ' "$ZSHRC"; then
    echo "Plugin 'ai-profile' already in .zshrc"
  elif grep -Eq '^[[:space:]]*plugins=\(' "$ZSHRC"; then
    echo "Adding 'ai-profile' to plugins in .zshrc..."
    zshrc_tmp="$(mktemp)"
    awk '
      BEGIN{added=0}
      /^[[:space:]]*plugins=\(/ && $0 !~ /^[[:space:]]*#/ && added==0 {
        if ($0 ~ /(^|[[:space:](])ai-profile([[:space:])]|$)/) {
          print
        } else if ($0 ~ /\)/) {
          sub(/\)/, " ai-profile)")
          print
        } else {
          print $0 " ai-profile"
        }
        added=1
        next
      }
      {print}
    ' "$ZSHRC" > "$zshrc_tmp"
    backup="$ZSHRC.omz-ai-profile.bak"
    cp "$ZSHRC" "$backup"
    mv "$zshrc_tmp" "$ZSHRC"
  else
    echo "Could not find a plugins=(...) line in $ZSHRC."
    echo "Please add 'ai-profile' to your plugins manually."
  fi
else
  echo "Warning: $ZSHRC not found."
  echo "Please add 'ai-profile' to your plugins manually, then reload your shell."
fi

echo ""
echo "Installation complete! Please reload your shell:"
echo "  source ~/.zshrc"
