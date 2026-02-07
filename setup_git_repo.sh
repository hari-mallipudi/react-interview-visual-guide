#!/bin/bash

# React Interview Mastery - Git Repository Setup Script
# This script helps you set up your React learning repository on GitHub

echo "🚀 React Interview Mastery - Git Setup"
echo "========================================"
echo ""

# Step 1: Create directory structure
echo "📁 Step 1: Creating directory structure..."
mkdir -p react-interview-mastery
cd react-interview-mastery

mkdir -p diagrams/interactive
mkdir -p diagrams/pdf
mkdir -p docs
mkdir -p interview-prep
mkdir -p code-examples/hooks-examples
mkdir -p code-examples/patterns-examples
mkdir -p code-examples/performance-examples
mkdir -p code-examples/state-management-examples
mkdir -p projects
mkdir -p notes

echo "✅ Directory structure created"
echo ""

# Step 2: Copy your generated files
echo "📄 Step 2: Copy your learning materials..."
echo "Please manually copy these files:"
echo "  - react_concept_map.html → diagrams/interactive/"
echo "  - React_Concepts_Interview_Guide.pdf → diagrams/pdf/"
echo "  - React_Study_Guide_Logical_Connections.md → docs/study-guide.md"
echo "  - Quick_Reference_Cheat_Sheet.md → interview-prep/quick-reference.md"
echo "  - README.md → ./"
echo "  - .gitignore → ./"
echo ""
read -p "Press Enter when files are copied..."

# Step 3: Initialize Git
echo "🔧 Step 3: Initializing Git repository..."
git init
git branch -M main

echo "✅ Git initialized"
echo ""

# Step 4: First commit
echo "💾 Step 4: Creating initial commit..."
git add .
git commit -m "Initial commit: React Interview Mastery learning materials

- Added interactive concept map (HTML)
- Added comprehensive study guide (PDF)
- Added text study guide with logical connections
- Added quick reference cheat sheet
- Added complete README with learning path
- Set up directory structure for future content"

echo "✅ Initial commit created"
echo ""

# Step 5: Connect to GitHub
echo "🌐 Step 5: Connect to GitHub..."
echo ""
echo "Choose your method:"
echo "  1. GitHub CLI (recommended if installed)"
echo "  2. Manual setup"
echo ""
read -p "Enter choice (1 or 2): " choice

if [ "$choice" = "1" ]; then
    echo ""
    echo "Creating repository with GitHub CLI..."
    read -p "Make repository public or private? (public/private): " visibility
    
    if [ "$visibility" = "public" ]; then
        gh repo create react-interview-mastery --public --source=. --remote=origin --push
    else
        gh repo create react-interview-mastery --private --source=. --remote=origin --push
    fi
    
    echo "✅ Repository created and pushed to GitHub!"
else
    echo ""
    echo "📝 Manual Setup Instructions:"
    echo "1. Go to https://github.com/new"
    echo "2. Repository name: react-interview-mastery"
    echo "3. Description: Complete React.js interview preparation with visual diagrams and study guides"
    echo "4. Choose Public or Private"
    echo "5. DO NOT initialize with README (you already have one)"
    echo "6. Click 'Create repository'"
    echo ""
    read -p "Enter your GitHub username: " username
    echo ""
    echo "Run these commands after creating the repository:"
    echo "  git remote add origin https://github.com/$username/react-interview-mastery.git"
    echo "  git push -u origin main"
    echo ""
    read -p "Press Enter to add remote and push..."
    
    git remote add origin "https://github.com/$username/react-interview-mastery.git"
    git push -u origin main
    
    echo "✅ Repository pushed to GitHub!"
fi

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "Next steps:"
echo "  1. Visit your repository on GitHub"
echo "  2. Add topics/tags: react, reactjs, interview-preparation, javascript, hooks"
echo "  3. Consider enabling GitHub Pages for the interactive diagram"
echo "  4. Start your learning journey!"
echo ""
echo "Your repository: https://github.com/$username/react-interview-mastery"
echo ""
echo "Happy learning! 🚀"
