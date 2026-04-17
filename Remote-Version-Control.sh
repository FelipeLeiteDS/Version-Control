#!/bin/bash
# ============================================================
# GIT REMOTE VERSION CONTROL — Step-by-step command reference
# ============================================================
# Assumes Git is installed and SSH key is configured on GitHub.
# To generate an SSH key:
#   ssh-keygen -t ed25519 -C "your.email@example.com"
#   cat ~/.ssh/id_ed25519.pub   # Copy this key into GitHub Settings > SSH Keys
# ============================================================


# ------------------------------------------------------------
# 1. CLONE AN EXISTING REMOTE REPOSITORY
# SSH cloning is the professional standard — no password
# prompts and more secure than HTTPS.
# ------------------------------------------------------------
cd <target directory>
git clone git@github.com:YourUsername/your-repo.git
cd your-repo
ls                                       # Confirm files were cloned


# ------------------------------------------------------------
# 2. FEATURE BRANCH WORKFLOW (clone → branch → PR → sync)
# Never commit directly to main. Always work on a feature
# branch, open a Pull Request on GitHub, and sync locally
# after the PR is merged.
# ------------------------------------------------------------

# -- Step 1: Create and switch to a feature branch
git checkout -b feature/remote-version-control

# -- Step 2: Make your changes
code Remote-Version-Control.txt          # Open file in editor and make changes

# -- Step 3: Stage, commit, and push
git status                               # Confirm which files changed
git add Remote-Version-Control.txt       # Stage the file
git status                               # Confirm file is staged (green)
git commit -m "Add remote version control notes"
git push origin feature/remote-version-control   # Push branch to remote

# -- Step 4: Open a Pull Request on GitHub and get it reviewed/merged

# -- Step 5: Sync local main AFTER the PR is merged on GitHub
# A merged PR updates the remote main — pull it down to stay in sync.
git checkout main
git pull origin main                     # Sync local main with remote main

# -- Step 6: Clean up the local feature branch
git branch -d feature/remote-version-control     # Safe delete (already merged)
git branch                               # Confirm the branch is gone


# ------------------------------------------------------------
# 3. UPDATE AN EXISTING LOCAL REPOSITORY
# Use fetch + merge (or pull) to bring in remote changes
# before starting new work — avoids merge conflicts later.
# ------------------------------------------------------------
cd <target directory>

# -- Option A: fetch then inspect before merging (safer)
git fetch                                # Download remote changes, don't apply yet
git log HEAD..origin/main --oneline      # Preview what's incoming
git merge origin/main                    # Apply the remote changes to local main

# -- Option B: pull (fetch + merge in one step)
git pull origin main

# -- Option C: pull with rebase (cleaner linear history, common in teams)
git pull --rebase origin main

# -- Now create your feature branch and continue as in section 2
git checkout -b feature/your-next-feature
# (make changes, stage, commit, push, PR, sync — same pattern as above)


# ------------------------------------------------------------
# 4. LINK AN EXISTING LOCAL REPOSITORY TO GITHUB
# Use this when you started a project locally and want to
# push it to a new remote repository.
# ------------------------------------------------------------

# -- Step 1: Create an empty repository on GitHub (no README, no .gitignore)

# -- Step 2: Initialize locally if not already done
cd <folder with your local repository>
git init
git add .
git commit -m "First commit"

# -- Step 3: Connect local repo to the remote
git remote add origin git@github.com:YourUsername/your-repo.git
git remote -v                            # Verify the remote URL was set correctly

# -- Step 4: Push and set the upstream tracking branch
git push -u origin main                  # -u sets origin/main as the default upstream
# After this, plain `git push` and `git pull` work without specifying remote/branch


# ------------------------------------------------------------
# 5. FORK WORKFLOW — contributing to someone else's repository
# A fork creates your own copy of a repo on GitHub so you can
# propose changes without write access to the original.
# ------------------------------------------------------------

# -- Step 1: Fork on GitHub
# Go to the original repo → click Fork → choose your account.
# This creates: github.com/YourUsername/original-repo

# -- Step 2: Clone YOUR fork locally
git clone git@github.com:YourUsername/original-repo.git
cd original-repo

# -- Step 3: Add the original repo as "upstream" remote
# This lets you pull in future changes from the source project.
git remote add upstream git@github.com:OriginalOwner/original-repo.git
git remote -v                            # Should show both origin and upstream

# -- Step 4: Create a feature branch and make your changes
git checkout -b feature/my-contribution
# (make changes, stage, commit)
git push origin feature/my-contribution

# -- Step 5: Open a Pull Request on GitHub
# Go to your fork → click "Compare & pull request" → target the ORIGINAL repo's main

# -- Step 6: Keep your fork in sync with the original repo
git checkout main
git fetch upstream                       # Download latest from original repo
git merge upstream/main                  # Apply it to your local main
git push origin main                     # Push synced main back to your fork
