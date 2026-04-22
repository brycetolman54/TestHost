#!/bin/bash

# 1. Build the project
echo "Building..."
cp -r web/* dist/

# 2. Copy the files into the web branch
git stash > /dev/null
git checkout web

ls
sleep 5

rm -rf *.html *.js *.css

git checkout main -- dist/
cp -rf dist/* .

rm -rf dist/

# 3. Commit and push the changes
git add *.html *.js *.css
git commit -am "Deploy to GitHub Pages"
git push origin web

# 4. Return to main
git checkout main
git stash pop > /dev/null

