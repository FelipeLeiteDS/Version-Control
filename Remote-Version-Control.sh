# Clone and update the repository with/ new code
cd <correct directory>
git clone git@github.com:FelipeLeiteDS/Version-Control.git	# Cloning repository
git checkout -b feature/remote-version-control
ls	# Check files
notepad Remote-Version-Control.txt	# Update app
git status	# Show an untracked file
git add Remote-Version-Control.txt	# Adding file
git status	# Show the staged file
git commit -m "Add Remote Version Control code"
git push origin feature/remote-version-control	# push the update to the remote repo
# Approve the pull request on GitHub
# Delete the branch feature/remote-version-control from GitHub
git checkout main	# Go back to the main branch
git merge feature/remote-version-control # Merge the feat branch to the main branch
git branch -D feature/remote-version-control # Finish the cicle by deleting the feat branch

# Update an existing repository
cd <correct directory>
git fetch	# update repo keeping secondary branches
notepad Remote-Version-Control.txt	# Update application/code
git status	# Show an untracked file
git add Remote-Version-Control.txt	# Adding file
git status	# Show the staged file
git commit -m "Add Remote Version Control code"
git push origin feature/remote-version-control	# push the update to the remote repo
# Approve the pull request on GitHub
# Delete the branch feature/remote-version-control from GitHub
git checkout main	# Go back to the main branch
git merge feature/remote-version-control # Merge the feat branch to the main branch
git branch -D feature/remote-version-control # Finish the cicle by deleting the feat branch

# Link existing local repository to GitHub
# Create the Remote repository on GitHub
cd <folder with your new repository>
git init # Create the .git file
git remote add origin git@github.com:FelipeLeiteDS/Version-Control.git # Connecting local rep to remote rep

# Creating a fork and proposing updates on a remote repository
# Fork (Create a clone of the rep on GitHub)
# Chose the owner and repository name (It creates a copy of the rep on your GitHub profile)
# Create a new feat branch
# Deploy your feature
# Merge with your main
# Pull request to the main of the original rep.