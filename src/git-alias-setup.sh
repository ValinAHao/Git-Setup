#!/bin/bash

# Function to check if Git is installed
check_git_installed() {
    if command -v git &> /dev/null; then
        echo "Git is already installed."
        return 0
    else
        echo "Git is not installed. Installing..."
        return 1
    fi
}

# Function to install Git
install_git() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &> /dev/null; then
            sudo apt update
            sudo apt install -y git
        elif command -v yum &> /dev/null; then
            sudo yum install -y git
        else
            echo "Unsupported package manager. Please install Git manually."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if command -v brew &> /dev/null; then
            brew install git
        else
            echo "Homebrew is not installed. Please install Git manually."
            exit 1
        fi
    else
        echo "Unsupported operating system. Please install Git manually."
        exit 1
    fi
}

# Main script execution
check_git_installed
if [[ $? -ne 0 ]]; then
    install_git
fi

# Call the setup aliases script
bash src/setup-aliases.sh