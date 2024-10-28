SETUP

# Update and upgrade Termux packages
pkg update -y
pkg upgrade -y

# Install required packages
pkg install curl -y
pkg install jq -y
pkg install git -y

# Clone your repository (replace 'yourusername' and 'yourrepository' with actual names)
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository

# Make the main script executable
chmod +x quote.sh
