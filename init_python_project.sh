#!/bin/bash
#
# init_python_project.sh
#
# Quickly scaffolds a new Python project by:
# - Creating a project folder and Python virtual environment
# - Setting up starter files: main.py, README.md, .gitignore, requirements.txt
# - Activating the virtual environment
# - Opening the project in VS Code (if installed)
#
# Usage:
#   ./init_python_project.sh my-project-name

# Get the project name from the first argument
PROJECT_NAME=$1

# Check if the user provided a name
if [ -z "$PROJECT_NAME" ]; then
  echo "❌ Project name required."
  echo "Usage: ./init_python_project.sh project-name"
  exit 1
fi

# Create the project directory and navigate into it
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || {
  echo "❌ Failed to enter project directory."
  exit 1
}

# Create the virtual environment
python3 -m venv venv
if [ ! -d "venv" ]; then
  echo "❌ Failed to create virtual environment. Is 'python3-venv' installed?"
  exit 1
fi
echo "✅ Virtual environment created."

# Activate the virtual environment
source venv/bin/activate
echo "✅ Virtual environment activated."

# Create common starter files
touch main.py README.md requirements.txt .gitignore

# Add 'venv/' to .gitignore
echo "venv/" > .gitignore

# (Optional) Initialize Git
git init > /dev/null 2>&1 && echo "✅ Git repository initialized."

# Open in VS Code if available
if command -v code &> /dev/null; then
  code .
  echo "🖥️  Project opened in VS Code."
fi

# Final status message
echo ""
echo "🚀 Project '$PROJECT_NAME' is ready!"


