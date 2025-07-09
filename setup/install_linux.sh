#!/usr/bin/env bash

set -e

echo "Installing Neovim and dependencies..."

# Install Neovim if not installed
if ! command -v nvim &> /dev/null; then
    sudo apt update
    sudo apt install -y neovim git curl
fi

# Create config symlink
mkdir -p ~/.config
ln -sf "$(pwd)" ~/.config/nvim

# Bootstrap lazy.nvim if needed
LAZY_PATH=~/.local/share/nvim/lazy/lazy.nvim
if [ ! -d "$LAZY_PATH" ]; then
    git clone https://github.com/folke/lazy.nvim "$LAZY_PATH"
fi

echo "Setup complete. Run 'nvim' to start."

