#!/bin/bash

# Variables
REPO_URL="git@github.com:simon-p-altmann/lambda-s3-node-ts.git"
CLONE_DIR="repository"
DEPLOY_DIR="deploy"
DIST_DIR="$CLONE_DIR/dist"
ZIP_FILE_NAME="lambda.zip"

# Remove the build directory if it exists
if [ -d "$CLONE_DIR" ]; then
  echo "Removing existing clone directory : $CLONE_DIR ..."
  rm -rf "$CLONE_DIR"
fi

# Remove the deploy directory if it exists
if [ -d "$DEPLOY_DIR" ]; then
  echo "Removing existing deploy directory : $DEPLOY_DIR ..."
  rm -rf "$DEPLOY_DIR"
fi

mkdir -p "$CLONE_DIR"
mkdir -p "$DEPLOY_DIR"

# Clone the repository
echo "Cloning the repository : $REPO_URL ..."
git clone "$REPO_URL" "$CLONE_DIR"

# Change to the repository directory
cd "$CLONE_DIR" || exit

# Install dependencies and build the project
echo "Installing dependencies and building the project..."
npm install
npm run build

# Change back to the root directory
cd ..

# Zip the build directory
echo "Zipping $DIST_DIR..."
zip -rj "$DEPLOY_DIR/$ZIP_FILE_NAME" "$DIST_DIR"

echo "Script completed successfully."
