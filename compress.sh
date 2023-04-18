#!/bin/bash

# Prompt user for the file or directory to compress
read -p "Enter the path to the file or directory to compress: " input_path

# Set the archive name and format
archive_name="compressed"
archive_format="tar.gz"

# Create the archive
tar -czf "${archive_name}.${archive_format}" "${input_path}"

# Output a message to confirm completion
echo "Compression completed successfully."
