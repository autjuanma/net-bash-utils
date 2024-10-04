#!/bin/bash

# Set the project directory path (hardcoded)
PROJECT_DIR="/home/autmarisella/.[code]/.manage/octokit-node-crud/"

# Set the output file path (hardcoded)
OUTPUT_FILE=".data/output/octo-tree_$(date +%Y-%m-%d_%H-%M-%S).txt"

# Create the output directory if it doesn't exist
mkdir -p .data/output

# Use the tree command to print the project structure, omitting node_modules
tree -d -I 'node_modules' "$PROJECT_DIR" > "$OUTPUT_FILE"