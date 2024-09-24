#!/bin/bash

# Set the path to your project directory
PROJECT_DIR=YOUR-PATH

# Use the tree command to print the project structure, omitting node_modules
tree -d -I 'node_modules' $PROJECT_DIR > project_structure.txt