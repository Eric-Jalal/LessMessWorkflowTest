function commit_and_push() {
  local commit_message=""
  local amend=false

  # Parse command line options
  while getopts "m:" opt; do
    case $opt in
      m)
        commit_message="$OPTARG"
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        return 1
        ;;
    esac
  done

  # If -m flag is provided, amend the previous commit with the new message
  if [ -n "$commit_message" ]; then
    git commit --amend -m "$commit_message"
    amend=true
  else
    git commit -m "WIP: Work in progress"
  fi

  # Push the changes
  git push origin HEAD

  # If amending, use gh cli to remove the last workflow run
  if [ "$amend" = true ]; then
    branch_name=$(git branch --show-current)
    last_run=$(gh run list -R -B $branch_name | head -n 1 | awk '{print $1}')
    
    if [ -n "$last_run" ]; then
      gh run cancel $last_run
    fi
  fi

  # Start a new workflow run
  gh workflow run -f <your_workflow_file.yml> -B <your_branch_name>
}

