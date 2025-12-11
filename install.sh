#!/bin/bash

set -e

PLUGIN_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/claude"
REPO_URL="https://github.com/wakefun/omz-claude.git"

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

echo ""
echo "Installation complete!"
echo ""
echo "Add 'claude' to your plugins in ~/.zshrc:"
echo "  plugins=(... claude)"
echo ""
echo "Then reload your shell:"
echo "  source ~/.zshrc"
