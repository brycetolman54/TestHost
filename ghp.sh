#!/bin/bash

set -e

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

# Build
echo -e "${BLUE}Building...${NC}"

rm -rf dist
mkdir -p dist
cp -r web/* dist/ || { echo -e "  ${RED}Build failed${NC}"; exit 1; }

# Switch branches
echo -e "${BLUE}Switching branches...${NC}"

git stash > /dev/null 2>&1
git checkout web > /dev/null 2>&1 || { echo -e "  ${RED}web branch missing${NC}"; exit 1; }

# Replace files
echo -e "${BLUE}Replacing old files...${NC}"

rm -f *.html *.js *.css
cp -rf dist/* . || { echo -e "  ${RED}No dist files${NC}"; exit 1; }

# Commit and push
echo -e "${BLUE}Committing and pushing...${NC}"

git add .
if git diff --cached --quiet; then
  echo -e "  ${GREEN}Nothing to commit${NC}"
else
  git commit -m "Deploy to GitHub Pages"
  git push origin web > /dev/null 2>&1 || { echo -e "  ${RED}Push failed${NC}"; exit 1; }
fi

# Return to main
echo -e "${BLUE}Returning to main...${NC}"

git checkout main > /dev/null 2>&1 || { echo -e "  ${RED}Failed to return to main${NC}"; exit 1; }

git stash pop > /dev/null 2>&1 || true

echo -e "${GREEN}Done${NC}"
