#!/bin/bash

# 1. Build the project
echo "Building..."
cp -r web/* dist/

# 2. Copy the files into the web branch
git stash > /dev/null
git checkout web > /dev/null

rm -f *.html *.js *.css 2> /dev/null
cp -rf dist/* .

# 3. Commit and push the changes
git add *.html 2> /dev/null
git add *.js 2> /dev/null
git add *.css 2> /dev/null

git commit -am "Deploy to GitHub Pages"
git push origin web

# 4. Return to main
git checkout main > /dev/null
git stash pop > /dev/null

