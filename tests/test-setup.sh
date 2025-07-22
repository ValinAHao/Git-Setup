#!/bin/bash

# Test if Git is installed
if command -v git &> /dev/null
then
    echo "Git is installed."
else
    echo "Git is not installed."
fi

# Test if the aliases are set in the global .gitconfig
ALIAS_CHECK=$(git config --global --get-regexp '^(co|br|ci)')

if [[ -n "$ALIAS_CHECK" ]]; then
    echo "Aliases are set in the global .gitconfig."
else
    echo "Aliases are not set in the global .gitconfig."
fi

# Check if the aliases.config file exists
if [[ -f "../src/aliases.config" ]]; then
    echo "aliases.config file exists."
else
    echo "aliases.config file does not exist."
fi