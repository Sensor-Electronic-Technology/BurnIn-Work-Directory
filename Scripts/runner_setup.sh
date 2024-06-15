#!/bin/bash

# Variables (replace these with your specific values)
REPO_URL="https://github.com/Sensor-Electronic-Technology" # GitHub repository URL
RUNNER_NAME="setiburnin-dev" # Name of the runner
RUNNER_LABELS="self-hosted,Linux,X64," # Labels for the runner
GITHUB_TOKEN="AD5XOVYNBMT5POO753IVZWTGNW4D2" # GitHub token (generate from your repo's settings)
RUNNER_GROUP="burn-in-runners"

# Directory to install the runner
INSTALL_DIR="~/actions-runner"

# Create the installation directory
mkdir  $INSTALL_DIR

# Navigate to the installation directory
cd $INSTALL_DIR

# Download the latest runner package
echo "Downloading GitHub runner..."
curl -o actions-runner-linux-arm64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-arm64-2.317.0.tar.gz

# Extract the runner package
echo "Extracting GitHub runner..."
tar xzf ./actions-runner-linux-arm64-2.317.0.tar.gz

# Remove the downloaded package to save space
rm -f actions-runner-linux-arm64-2.317.0.tar.gz

# Configure the runner
echo "Configuring GitHub runner..."
./config.sh --url $REPO_URL --token $GITHUB_TOKEN --name $RUNNER_NAME --group $RUNNER_GROUP  --labels $RUNNER_LABELS --unattended

echo "Runnning"
./run.sh

echo "Installing service"
sudo ./svc.sh install
echo "GitHub runner installation and service setup complete."