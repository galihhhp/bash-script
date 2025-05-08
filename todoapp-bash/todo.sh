#!/usr/bin/bash

file="todos.txt"
current_date=$(date +%Y-%m-%d)
current_time=$(date +"%H:%M:%S")

check_file() {
  # if file not found, create new file
  [ -f "$file" ] || touch "$file"
}

add() {
  echo "[ONPROGRESS] [$current_date] [$current_time] $1" >>"$file"
  echo "[ONPROGRESS] [$current_date] [$current_time] $1 - Created Successfully"
}

remove() {
  nl -w1 -s'. ' $file

  read -r line
  task=$(awk -v num="$line" 'NR==num { print $0 }' $file)
  sed -i "${line}d" "$file"
  echo "$task - Deleted Successfully"
}

edit() {
  nl -w1 -s'. ' $file

  read -r line
  read -r new_task
  awk -v n="$line" -v new="[ONPROGRESS] [$current_date] [$current_time] $new_task" 'NR==n{$0=new}1' "$file" >tmp && mv tmp "$file"
}

completed() {
  nl -w1 -s'. ' $file

  read -r line
  task=$(awk -v num="$line" 'NR==num { print $4 }' $file)
  awk -v n="$line" -v new="[DONE] [$current_date] [$current_time] $task" 'NR==n{$0=new}1' "$file" >tmp && mv tmp "$file"
}

update() {
  PS3='Please enter your choice: '
  options=("Edit" "Remove" "Done" "Quit")
  select opt in "${options[@]}"; do
    case $opt in
    "Edit")
      edit
      break
      ;;
    "Done")
      completed
      break
      ;;
    "Remove")
      remove
      break
      ;;
    "Quit")
      break
      ;;
    *) echo "invalid option $REPLY" ;;
    esac
  done
}

list() {
  nl -w1 -s'. ' $file
}

help() {
  echo "Usage: todo [command] [options]"
  echo "Commands:"
  echo "add <task>       Add a new task"
  echo "remove           Remove a task"
  echo "update           Update a task"
  echo "list             List all tasks"
  echo "help             Show this help message"
}

check_file

case "$1" in
add) add "$2" ;;
update) update ;;
list) list ;;
help | *) help ;;
esac
