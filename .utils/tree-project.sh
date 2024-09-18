#!/bin/bash

# Set the path to your project directory
PROJECT_DIR=/home/autmarisella/.[code]/.node/CLI/cy-hybrid-cli

# Use the tree command to print the project structure, omitting node_modules
tree -d -I 'node_modules' $PROJECT_DIR > project_structure.txt