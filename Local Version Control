# Step by step of Git usage with useful commands for local operations

# Git for Ubunto - open terminal and enter "sudo apt install git"
# Git for Windows - after installing, look for "git bash"

# Basic Bash commands
pwd # Present work directory - where we are right now
ls # List directory contents
ls-l # Detailed list
ls-lt # List sorted by modification date
ls--help # Documentation of "ls" command
ls-a # Show hidden files
clear # Clear terminal (or Ctrl + L)
mkdir # Create new directory
touch # Create new file
cd.. #go up directory
cd../.. #go up two directories

# Setting up Git
git--help # Git documentaion
git config --global user.name "Felipe Leite"
git config --global user.email "felipe.nog.leite@gmail.com"
git config -l # Check settings
git confir --global init.defaultBranch main # Set default branch to main
git branch-m main # Change the current branch to main
git init #stating git in the current directory
ls-a #checking the hidden folder called .git
ls-.git #checking files within .git folder

# Repository Inicialization
cd <directory name> # Set directory
git init
mkdir ml_new_project
cd ml_new_project/ #accessing the new directory
touch ml_new_project.txt
# Up arrow key select previous commands

# Working on and Commiting files
touch ml_new_project.txt
git status # Check working tree status
git add ml_new_project.txt # Stage specific file. change the status from untracked to modified.
git status
git commit -m "First Commit" # Commit staged file with comment
#This commit has been done in the main branch
git status

#Commiting updates and new files in the Main Branch
touch ml_project_part2.txt
# Update both files
git status # Show the first file as modified(green) and the second one as untracked(red)
git add ml_project_part2.txt
git status # Both files are green and ready to be commited (modified and new file)
git commit -m "New file and instructions" # Show 2 files changed, X insertions
git log # Historic of all commits
git log -- oneline # Shorter version

git add . # Stage all files in directory
git reset # Pull files from stage to anterior status
git add *.txt # Stage only the .txt extension files
git status # Check if additions worked as intendend

# Creating branches and maneging commit
git checkout -b second_version #Create the new branch
touch ml_project_part3.txt
git add ml_project_part3.txt
git commit -m "project part 3 test"
git status # Confirm if it's commited
git branch # Checking the branches
# The Seconday Branch works like a copy of the Main, allowing updates without loosing the Main Branch code version
git checkout main # Back to the Main Branch
# Never use jupter notebook/CSV files on Git. They are binary files, git don't see it as a text file.
git diff ml_project_part3.txt # Check alterations line by line
# Cannot swift branches wihtout commiting modifications from the previvious one. If it changed, it has to commited
git merge second_version # Merge the secondary branch into the main branch

# Creating a new brach for a new feature with a sufix
git checkout -b feat/new_feature #Note the prefix feat/
touch new_feature.py
git add new_feature.py
git status
git commit -m "1st version of new feature"
git merge feat/new_feature
git branch -D feat/new_feature # Delete the branch after it was merged to the main branch
git branch # Seconday branch was fully integrated with Main Branch and does not exist anymore

#Resetting unplublished commits
git reset 117add09 # Soft reset (unstage changes)
git reset --hard 117add9 # Hard reset (discard changes)
