#!/bin/bash

show_help() {
    echo "Usage: $0 <URL> <output format: pdf or png> [JSON file]"
    exit 1
}

# Check the number of arguments
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    show_help
fi

# Assign values to parameters
url=$1
output_format=$2
json_file=$3

# Check if the output format is valid
if [ "$output_format" != "pdf" ] && [ "$output_format" != "png" ]; then
    echo "Invalid output format. Use 'pdf' or 'png'."
    show_help
fi

# Build the base command for conversion
if [ "$output_format" = "pdf" ]; then
    base_command="wkhtmltopdf"
    # Add specific options for PDF, if necessary
    base_command="$base_command $url output.$output_format"
elif [ "$output_format" = "png" ]; then
    base_command="wkhtmltoimage"
    # Add specific options for PNG, if necessary
    base_command="$base_command $url output.$output_format"
fi

# Add JSON parameters, if provided
# --- working / testing ...
if [ -n "$json_file" ]; then
    json_params=$(cat "$json_file" | tr -d '\n' | sed 's/"/\\"/g')
    base_command="$base_command --custom-header \"X-JSON-Params: $json_params\""
fi

# Execute the command
$base_command

echo "Completed. Output saved in output.$output_format"
