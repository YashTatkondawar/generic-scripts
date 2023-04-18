#!/bin/bash

# Prompt user for source and destination directories
read -p "Enter source directory: " source_dir
read -p "Enter destination directory: " destination_dir

# Set the date format for the backup file name
date_format=$(date +%Y-%m-%d_%H-%M-%S)

# Create a compressed archive of the source directory
archive_name="backup_${date_format}.tar.gz"
tar -czf "${archive_name}" "${source_dir}"

# Copy the archive to the destination directory
rsync -avz --delete "${archive_name}" "${destination_dir}"

# Remove the local backup archive
rm "${archive_name}"

# Output a message to confirm completion
echo "Backup completed successfully."
