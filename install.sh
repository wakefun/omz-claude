#!/bin/bash

set -e

PLUGIN_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/claude"
REPO_URL="https://github.com/wakefun/omz-claude.git"
ZSHRC="$HOME/.zshrc"

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}" ]; then
  echo "Error: oh-my-zsh is not installed."
  exit 1
fi

if [ -d "$PLUGIN_DIR" ]; then
  echo "Updating existing installation..."
  cd "$PLUGIN_DIR" && git pull
else
  echo "Installing omz-claude plugin..."
  git clone --depth=1 "$REPO_URL" /tmp/omz-claude
  mkdir -p "$PLUGIN_DIR"
  cp -r /tmp/omz-claude/claude/* "$PLUGIN_DIR/"
  rm -rf /tmp/omz-claude
fi

# Add claude to plugins in .zshrc if not already present
if grep -q "plugins=.*claude" "$ZSHRC" 2>/dev/null; then
  echo "Plugin 'claude' already in .zshrc"
else
  echo "Adding 'claude' to plugins in .zshrc..."
  sed -i.bak 's/^plugins=(\(.*\))/plugins=(\1 claude)/' "$ZSHRC"
  rm -f "$ZSHRC.bak"
fi

echo ""
echo "Installation complete! Please reload your shell:"
echo "  source ~/.zshrc"
