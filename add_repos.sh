#!/bin/bash

# Directory containing repository files
REPOS_DIR="./repos"

# Check if the repos directory exists
if [ ! -d "$REPOS_DIR" ]; then
  echo "Error: Directory '$REPOS_DIR' does not exist."
  exit 1
fi

# Iterate through all files in the repos directory
for repo_file in "$REPOS_DIR"/*; do
  # Skip if no files are found
  if [ ! -e "$repo_file" ]; then
    echo "No repository files found in '$REPOS_DIR'."
    exit 0
  fi

  # Copy the repository file to /etc/yum.repos.d/
  echo "Adding repository from file: $repo_file"
  cp "$repo_file" /etc/yum.repos.d/
done

echo "All repositories have been processed."
