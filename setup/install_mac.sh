#!/usr/bin/env bash

set -e

echo "Installing Neovim and dependencies..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Neovim
brew install neovim git

# Create config symlink
mkdir -p ~/.config
ln -sf "$(pwd)" ~/.config/nvim

# Bootstrap lazy.nvim
LAZY_PATH=~/.local/share/nvim/lazy/lazy.nvim
if [ ! -d "$LAZY_PATH" ]; then
    git clone https://github.com/folke/lazy.nvim "$LAZY_PATH"
fi

echo "Setup complete. Run 'nvim' to start."

