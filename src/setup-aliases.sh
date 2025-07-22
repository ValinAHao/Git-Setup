#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Read alias definitions from aliases.config and apply them to global .gitconfig
ALIAS_FILE="$SCRIPT_DIR/aliases.config"

if [ ! -f "$ALIAS_FILE" ]; then
  echo "Alias configuration file not found: $ALIAS_FILE"
  exit 1
fi

while IFS= read -r line; do
  # Skip empty lines and comments
  if [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]]; then
    continue
  fi
  
  # Parse the line and trim whitespace
  alias_name=$(echo "$line" | cut -d= -f1 | xargs)
  git_command=$(echo "$line" | cut -d= -f2- | xargs)
  
  if [ -n "$alias_name" ] && [ -n "$git_command" ]; then
    echo "Setting up alias: $alias_name = $git_command"
    git config --global alias."$alias_name" "$git_command"
  fi
done < "$ALIAS_FILE"

echo "Git aliases have been set up successfully."