# Git Workflow Automation Script

This bash script provides a streamlined workflow for committing and pushing changes to a Git repository while managing GitHub Actions workflow runs. It allows you to make commits, push changes, and interact with GitHub Actions, maintaining a clean log history.

## Features

- Creates a new commit with a default message or amends the previous commit with a specified message.
- Pushes changes to the remote repository.
- Uses the GitHub CLI (`gh`) to cancel the last workflow run before starting a new one, keeping the log history clean.
- Customizable: Specify a commit message using the `-m` flag.

## Prerequisites

- Git installed on your machine
- GitHub CLI (`gh`) installed and authenticated

## Installation

1. Copy the script content from [commit_and_push.sh](commit_and_push.sh) to a file named `commit_and_push.sh`.
2. Make the script executable: `chmod +x commit_and_push.sh`
3. Optionally, move the script to a directory included in your `$PATH` to use it as a global command.

## Usage

### Basic Usage

```bash
./commit_and_push.sh
```

This will create a new commit with a default message and push the changes. It will also manage GitHub Actions workflow runs.

## Specify a Commit Message
```bash
./commit_and_push.sh -m "Your commit message here"
```

## Using as a Function Alias in Shell Configuration Files

You can add the following line to your shell configuration file (e.g., `.bashrc`, `.zshrc`) to use the script as a function alias:
```bash
alias commit_and_push="/path/to/commit_and_push.sh"
```

Replace `/path/to/commit_and_push.sh` with the actual path to the script. After adding this line, you can use `commit_and_push` as a command in your terminal.

## Notes

- Ensure that the GitHub CLI (gh) is installed and authenticated.
- Customize the workflow file and branch name in the script as per your repository.

## License

This project is licensed under the Apache License - See the LICENSE for details.

