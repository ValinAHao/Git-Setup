#!/bin/bash

# Function to install Git on Debian-based systems
install_git_debian() {
    sudo apt update
    sudo apt install -y git
}

# Function to install Git on macOS
install_git_macos() {
    brew install git
}

# Function to check if Git is installed
check_git_installed() {
    if command -v git &> /dev/null; then
        echo "Git is already installed."
        return 0
    else
        echo "Git is not installed."
        return 1
    fi
}

# Main script logic
if ! check_git_installed; then
    echo "Installing Git..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [[ -f /etc/debian_version ]]; then
            install_git_debian
        else
            echo "Unsupported Linux distribution. Please install Git manually."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        install_git_macos
    else
        echo "Unsupported operating system. Please install Git manually."
        exit 1
    fi
fi

echo "Git installation completed."