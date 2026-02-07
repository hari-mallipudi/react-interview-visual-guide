# Git Setup - Simple Command Reference

## Quick Setup (Copy-Paste Commands)

### Option 1: Using GitHub CLI (Easiest)

```bash
# Create directory and navigate
mkdir react-interview-mastery
cd react-interview-mastery

# Create folder structure
mkdir -p diagrams/interactive diagrams/pdf docs interview-prep code-examples projects notes

# Copy your files (do this manually):
# - react_concept_map.html → diagrams/interactive/
# - React_Concepts_Interview_Guide.pdf → diagrams/pdf/
# - React_Study_Guide_Logical_Connections.md → docs/study-guide.md
# - Quick_Reference_Cheat_Sheet.md → interview-prep/quick-reference.md
# - README.md → ./
# - .gitignore → ./

# Initialize git
git init
git branch -M main

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: React Interview Mastery learning materials"

# Create GitHub repo and push (public)
gh repo create react-interview-mastery --public --source=. --remote=origin --push

# OR for private repo
gh repo create react-interview-mastery --private --source=. --remote=origin --push
```

---

### Option 2: Manual GitHub Setup

```bash
# Create directory and navigate
mkdir react-interview-mastery
cd react-interview-mastery

# Create folder structure
mkdir -p diagrams/interactive diagrams/pdf docs interview-prep code-examples projects notes

# Copy your files (do this manually - see above)

# Initialize git
git init
git branch -M main

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: React Interview Mastery learning materials"

# NOW: Go to GitHub.com and create new repository
# Repository name: react-interview-mastery
# Description: Complete React.js interview preparation with visual diagrams and study guides
# Public or Private: Your choice
# DO NOT initialize with README

# After creating on GitHub, run these commands:
# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/react-interview-mastery.git
git push -u origin main
```

---

## Files You Need to Copy

From your downloads/outputs folder, copy these files:

```
Source File                                  → Destination
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
react_concept_map.html                       → diagrams/interactive/concept-map.html
React_Concepts_Interview_Guide.pdf           → diagrams/pdf/React-Concepts-Guide.pdf
React_Study_Guide_Logical_Connections.md     → docs/study-guide.md
Quick_Reference_Cheat_Sheet.md               → interview-prep/quick-reference.md
README.md                                    → README.md (root)
.gitignore                                   → .gitignore (root)
```

---

## After Pushing to GitHub

### Add Topics/Tags
1. Go to your repository on GitHub
2. Click "⚙️ Settings" or find "About" section (right side)
3. Click "⚙️" next to About
4. Add topics:
   ```
   react
   reactjs
   interview-preparation
   javascript
   hooks
   interview-questions
   frontend
   web-development
   learning-resources
   study-guide
   ```

### Enable GitHub Pages (Optional)
1. Go to Settings → Pages
2. Source: Deploy from branch → main → /docs or root
3. Save
4. Your site: `https://YOUR_USERNAME.github.io/react-interview-mastery/`

---

## Common Git Commands for Updates

```bash
# Check status
git status

# Add new files
git add .

# Commit changes
git commit -m "Add: description of what you added"

# Push to GitHub
git push

# Example commits:
git commit -m "Add: useCallback code example"
git commit -m "Update: study guide with useEffect notes"
git commit -m "Complete: todo app project"
```

---

## Branching Strategy (Optional)

```bash
# Create branch for new learning topic
git checkout -b learning/hooks-deep-dive

# Work on files, then commit
git add .
git commit -m "Add: detailed useEffect notes"

# Merge back to main when done
git checkout main
git merge learning/hooks-deep-dive

# Push
git push
```

---

## Troubleshooting

### If you get "remote already exists"
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/react-interview-mastery.git
```

### If you get permission denied
```bash
# Set up SSH key or use personal access token
# For HTTPS, GitHub will prompt for token instead of password
```

### If you need to undo last commit (not pushed)
```bash
git reset --soft HEAD~1
```

### If you accidentally committed large files
```bash
# Remove from git but keep locally
git rm --cached large-file.zip
echo "large-file.zip" >> .gitignore
git commit -m "Remove large file"
```

---

## Daily Learning Workflow

```bash
# Morning: Pull latest (if working from multiple devices)
git pull

# Study and add notes
# ... work on files ...

# Evening: Commit progress
git add .
git commit -m "Progress: completed Phase 2 Hooks"
git push
```

---

## Quick Check: Is Everything Set Up?

Run these commands to verify:

```bash
# Should show your repository URL
git remote -v

# Should show your commits
git log --oneline

# Should show clean working directory (after commits)
git status
```

---

## Next Steps After Setup

1. ✅ Star your own repository (bookmark it)
2. ✅ Add repository description on GitHub
3. ✅ Enable GitHub Pages if you want to share
4. ✅ Start learning with Phase 1!

---

## Need Help?

- Git basics: https://git-scm.com/book/en/v2
- GitHub guides: https://guides.github.com/
- GitHub CLI: https://cli.github.com/manual/

---

**Happy coding! 🚀**
