#!/bin/bash

# 1. Build the project
echo "Building..."
cp -r web/* dist/

branch=$(git branch --show-current)
if [ "$branch" != "main" ]; then
    echo "On Web"
else
    echo "not on web"
fi

# 2. Copy the files into the web branch
git checkout web
rm -rf *.html *.js *.css
git checkout main -- dist/
cp -rf dist/* .
rm -rf dist/

# 3. Commit and push the changes
git add .
git commit -am "Deploy to GitHub Pages"
git push origin web

# 4. Return to main
git checkout main
