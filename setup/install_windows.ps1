# Requires running in an Admin PowerShell window

Write-Output "Installing Neovim and Git with Chocolatey..."

choco install neovim git -y

# Create symlink (adjust paths if needed)
$source = "$PWD"
$dest = "$env:LOCALAPPDATA\nvim"

if (Test-Path $dest) {
    Remove-Item $dest -Recurse -Force
}

New-Item -ItemType SymbolicLink -Path $dest -Target $source

# Bootstrap lazy.nvim
$lazyPath = "$env:LOCALAPPDATA\nvim-data\lazy\lazy.nvim"
if (-Not (Test-Path $lazyPath)) {
    git clone https://github.com/folke/lazy.nvim $lazyPath
}

Write-Output "Setup complete. Run 'nvim' from a new terminal."

