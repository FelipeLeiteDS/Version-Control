# Clone and update the repository with/ new code
cd <correct directory>
git clone git@github.com:FelipeLeiteDS/Version-Control.git	# Cloning repository
ls	# Checking files
git checkout -b feature/remote-version-control
touch Remote-Version-Control.txt	# Creating a new file
ls	# Checking the new file
notepad Remote-Version-Control.txt	# Update code
git status	# Show an untracked file
git add Remote-Version-Control.txt	# Adding file
git status	# Show the staged file

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
