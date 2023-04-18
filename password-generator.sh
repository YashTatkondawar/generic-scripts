#!/bin/bash

# Prompt user for password length
read -p "Enter password length: " password_length

# Define the characters to be used in the password
password_chars="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{};:,./<>?"

# Generate random password
password=$(dd if=/dev/urandom bs=1 count=${password_length} 2>/dev/null | tr -dc $password_chars | head -c ${password_length})

# Output the password
echo "Your new password is: $password"
