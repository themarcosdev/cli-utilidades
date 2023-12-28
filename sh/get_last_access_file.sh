#!/bin/bash

# Checks if the parameter was provided
if [ -z "$1" ]; then
  echo "The path of the file is required."
  exit 1
fi

# Checks the current system language
if [ "$LANG" = "C.UTF-8" ]; then
  # Gets the file access date (C.UTF-8 language)
  access_date=$(stat "$1" | grep Access | awk 'NR==2')
elif [ "$LANG" = "pt_BR.UTF-8" ]; then
  # Gets the file access date (pt_BR.UTF-8 language)
  access_date=$(stat "$1" | grep Acesso | awk 'NR==2')
else
  echo "Unsupported OS language."
  exit 1
fi

# Displays the access date
echo "$access_date"
