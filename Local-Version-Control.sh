#!/bin/bash
# ============================================================
# GIT LOCAL VERSION CONTROL — Step-by-step command reference
# ============================================================
# Installation:
#   Ubuntu:  sudo apt install git
#   Windows: install Git for Windows, then open "Git Bash"
# ============================================================


# ------------------------------------------------------------
# 1. BASIC BASH NAVIGATION
# ------------------------------------------------------------
pwd           # Print working directory — shows where you are
ls            # List directory contents
ls -l         # Detailed list (permissions, size, date)
ls -lt        # Detailed list sorted by modification date
ls -a         # Show hidden files (e.g. .git)
ls --help     # Documentation for the ls command
clear         # Clear the terminal (or Ctrl + L)
mkdir         # Create a new directory
touch         # Create a new empty file
cd ..         # Go up one directory
cd ../..      # Go up two directories


# ------------------------------------------------------------
# 2. GIT SETUP (run once per machine)
# ------------------------------------------------------------
git --help    # Git documentation and command list

git config --global user.name  "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main   # Set default branch to main
git config -l                                 # Verify all settings


# ------------------------------------------------------------
# 3. REPOSITORY INITIALIZATION
# ------------------------------------------------------------
mkdir ml_new_project
cd ml_new_project        # Enter the new directory
git init                 # Start Git tracking in the current directory
ls -a                    # Confirm the hidden .git folder was created
ls .git                  # Inspect the files inside the .git folder


# ------------------------------------------------------------
# 4. .GITIGNORE — keep unwanted files out of version control
# Jupyter notebooks and CSVs are binary or data files —
# Git can't diff them meaningfully. Always ignore them.
# ------------------------------------------------------------
touch .gitignore

# Add common exclusions to .gitignore:
echo "*.ipynb"           >> .gitignore   # Jupyter notebooks
echo "*.csv"             >> .gitignore   # Data files
echo "*.xlsx"            >> .gitignore   # Spreadsheets
echo "__pycache__/"      >> .gitignore   # Python cache
echo ".env"              >> .gitignore   # Environment variables / secrets
echo "venv/"             >> .gitignore   # Virtual environments

git add .gitignore
git commit -m "Add .gitignore"


# ------------------------------------------------------------
# 5. STAGING AND COMMITTING
# Use arrow keys to navigate previous commands in the terminal.
# ------------------------------------------------------------
touch ml_project.txt
git status                        # Shows ml_project.txt as untracked (red)

git add ml_project.txt            # Stage specific file
git status                        # Now shows as staged (green)
git commit -m "First commit"      # Commit with a descriptive message
git status                        # Clean working tree

# Staging options:
git add .                         # Stage ALL files in the directory
git add *.txt                     # Stage only .txt files
git reset                         # Unstage all files (non-destructive)

# Commit history:
git log                           # Full commit history
git log --oneline                 # Compact one-line-per-commit view
git log --oneline --graph         # Visual branch and merge history


# ------------------------------------------------------------
# 6. COMMITTING UPDATES ACROSS MULTIPLE FILES
# ------------------------------------------------------------
touch ml_project_part2.txt
# (make edits to both files)

git status    # ml_project.txt = modified (green), part2 = untracked (red)
git add ml_project_part2.txt
git status    # Both files staged and ready to commit
git commit -m "Add part 2 and update instructions"

git diff ml_project.txt           # Review changes line by line before staging


# ------------------------------------------------------------
# 7. BRANCHING
# Branches let you develop features without touching the main
# codebase. Use prefixes (feat/, fix/, chore/) to stay organized.
# ------------------------------------------------------------
git branch                         # List all branches
git checkout -b feat/new_feature   # Create and switch to a new branch

touch new_feature.py
git add new_feature.py
git commit -m "First version of new feature"

git branch                         # Confirm you're on feat/new_feature
git log --oneline --graph          # Visualize branch diverging from main


# ------------------------------------------------------------
# 8. STASHING — save work without committing
# You cannot switch branches with uncommitted changes.
# git stash lets you set them aside temporarily and come back.
# ------------------------------------------------------------
# (make some edits to new_feature.py without finishing them)
git stash                          # Stash uncommitted changes
git checkout main                  # Now safe to switch branches

git checkout feat/new_feature      # Return to feature branch
git stash pop                      # Restore the stashed changes


# ------------------------------------------------------------
# 9. MERGING AND CLEANING UP
# Always merge into main from the main branch.
# Delete feature branches after merging to keep the repo tidy.
# ------------------------------------------------------------
git checkout main
git merge feat/new_feature         # Merge feature into main
git log --oneline --graph          # Confirm the merge commit

git branch -d feat/new_feature     # Safe delete (only works if merged)
git branch -D feat/new_feature     # Force delete (use with caution)
git branch                         # Confirm branch is gone


# ------------------------------------------------------------
# 10. RESETTING AND REVERTING COMMITS
# git reset  = rewrite history (use ONLY on unpublished commits)
# git revert = safe undo for commits already pushed to remote
# ------------------------------------------------------------

# -- Soft reset: unstages the commit but keeps your file changes
git reset <commit-hash>

# -- Hard reset: discards the commit AND all file changes (destructive!)
git reset --hard <commit-hash>

# -- Safe undo for published commits (creates a new "undo" commit)
# Use this instead of reset when the commit has already been pushed.
git revert <commit-hash>
