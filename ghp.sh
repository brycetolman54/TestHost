#!/bin/bash

# 1. Build the project
echo "Building..."
cp -r web/* dist/
sleep 5

# 2. Copy the files into the web branch
git checkout web
rm -rf *
git checkout main -- dist/
cp -rf dist/* .
rm -rf dist/

# 3. Commit and push the changes
git add .
git commit -m "Deploy to GitHub Pages"
git push origin web

# 4. Return to main
git checkout main
