#!/bin/bash

# Progress bar function
progress_bar() {
  local duration=$1
  local already_done=0
  local total_tics=30

  while [ $already_done -lt $duration ]; do
    already_done=$((already_done+1))
    done_tics=$((already_done*total_tics/duration))
    left_tics=$((total_tics-done_tics))

    done_bar=$(printf "%${done_tics}s")
    left_bar=$(printf "%${left_tics}s")

    printf "\rProgress : [${done_bar// /#}${left_bar// /-}] ${already_done}/${duration}"
    sleep 0.01
  done
  echo ""
}

git init
git add .
progress_bar 20
read -p "Commit message: " msg
git commit -m "$msg"
progress_bar 20
git push -u origin main