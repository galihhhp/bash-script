#!/bin/bash

# root only, bcs this script need to do system level ops. example: useradd, chpasswd, stc
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root."
  exit 1
fi

read -p "CSV file: " csv_file

if [[ ! -f "$csv_file" ]]; then
  echo "File not found."
  exit 1
fi

row_number=1
error_messages=()

while IFS=',' read -r username password group; do
  # check if have empty field
  if [[ -z "$username" ]]; then
    error_messages+=("Row $row_number: username field is missing")
    continue
  fi
  if [[ -z "$password" ]]; then
    error_messages+=("Row $row_number: password field is missing")
    continue
  fi
  if [[ -z "$group" ]]; then
    error_messages+=("Row $row_number: group field is missing")
    continue
  fi

  # check user
  # &>/dev/null, go to trash
  if ! id "$username" &>/dev/null; then
    useradd "$username"
    echo "$username:$password" | chpasswd
    echo "User $username created successfully" | tee -a user-management.log
    # check group
    if ! getent group "$group" &>/dev/null; then
      groupadd "$group"
    fi
    usermod --append --groups "$group" "$username"
  else
    echo "User $username already created" | tee -a user-management.log
  fi
done < <(tail -n +2 "$csv_file")

if ((${#error_messages[@]} > 0)); then
  echo "Validation errors found:"
  for msg in "${error_messages[@]}"; do
    echo "$msg"
  done
fi
