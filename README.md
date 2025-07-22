# Git Alias Setup

## Purpose
This project provides a script to automate the installation of Git and the setup of Git aliases in your global `.gitconfig` file. By using this project, you can ensure that Git is installed on your system and easily configure your Git environment with custom aliases that enhance your workflow.

## Prerequisites
- A Unix-like operating system (Linux, macOS, etc.)
- Basic knowledge of using the command line

## Installation
1. Download the project files from the repository.
2. Navigate to the project directory in your terminal.
3. Run the installation script to set up Git and aliases:

```bash
bash src/git-alias-setup.sh
```

## Usage
The installation script will check if Git is installed. If it is not, it will install Git using the appropriate package manager for your operating system. After ensuring Git is installed, it will read the alias definitions from the `src/aliases.config` file and apply them to your global `.gitconfig`.

## Configuration
The `aliases.config` file contains the alias definitions. Each alias should be defined in the following format:

```
alias_name = git_command
```

For example:

```
co = checkout
br = branch
ci = commit
```

## Examples
After running the script, you can use the defined aliases in your Git commands. For instance:

- Instead of `git checkout <branch>`, you can use `git co <branch>`.
- Instead of `git commit -m "message"`, you can use `git ci -m "message"`.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.