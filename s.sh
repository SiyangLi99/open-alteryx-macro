#!/bin/bash

# Change to your project's directory
cd /c/Users/flyku/Documents/GitHub/open-alteryx-macro


# Get the current date as the number of seconds since 1970-01-01 00:00:00 UTC
now=$(date +%s)

# Two years ago in seconds
two_years_ago=$(date -d"2 years ago" +%s)

# Number of commits to make
num_commits=100

for ((i=0; i<$num_commits; i++)); do
  # Select a random file in the repository
  file=$(find . -type f | shuf -n 1)

  # Append a random string to the file
  echo "Random string $(date +%N)" >> "$file"

  # Stage the file for commit
  git add "$file"

  # Generate a random date between now and two years ago
  commit_date=$(date -d"@$((RANDOM % (now - two_years_ago) + two_years_ago))" --iso-8601=seconds)

  # Commit the change with the random date
  GIT_AUTHOR_DATE="$commit_date" GIT_COMMITTER_DATE="$commit_date" git commit -m "Random commit"

done

# Push the changes to the remote repository
git push origin master