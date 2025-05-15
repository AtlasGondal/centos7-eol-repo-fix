#!/bin/bash

# CentOS 7 EOL Repo Fix Automation Script

# Function to check if command executed successfully
check_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1 failed"
        exit 1
    else
        echo "$1 completed successfully"
    fi
}

# Step 1: Backup Existing Repo Files
echo "Step 1: Backing up existing repo files..."
sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
check_status "Repo file backup"

# Step 2: Download the Updated Repository File
echo -e "\nStep 2: Downloading updated repository file..."

# Check which download tool is available (curl or wget)
if command -v curl &> /dev/null; then
    echo "Using curl to download the repo file..."
    sudo curl -fsSL https://raw.githubusercontent.com/AtlasGondal/centos7-eol-repo-fix/main/CentOS-Base.repo -o /etc/yum.repos.d/CentOS-Base.repo
elif command -v wget &> /dev/null; then
    echo "Using wget to download the repo file..."
    sudo wget -O /etc/yum.repos.d/CentOS-Base.repo https://raw.githubusercontent.com/AtlasGondal/centos7-eol-repo-fix/main/CentOS-Base.repo
else
    echo "Error: Neither curl nor wget is available. Please install one of them."
    exit 1
fi

check_status "Repo file download"

# Step 3: Clean YUM Cache
echo -e "\nStep 3: Cleaning YUM cache..."
sudo yum clean all
check_status "YUM clean all"

echo "Creating new YUM cache..."
sudo yum makecache
check_status "YUM makecache"

# Step 4: Update Your System
echo -e "\nStep 4: Updating system..."
sudo yum update -y
check_status "System update"

echo -e "\nAll steps completed successfully!"
