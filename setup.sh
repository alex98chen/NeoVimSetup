#!/usr/bin/env bash

OS="$(uname -s)"
case "$OS" in
    Linux*)     ./setup/install_linux.sh ;;
    Darwin*)    ./setup/install_mac.sh ;;
    MINGW*|MSYS*|CYGWIN*) echo "Run the Windows PowerShell script instead: setup/install_windows.ps1" ;;
    *)          echo "Unsupported OS: $OS" ;;
esac

