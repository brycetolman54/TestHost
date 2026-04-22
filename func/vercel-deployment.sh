#!/bin/bash

set -e

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

# Build
echo -e "${BLUE}Building...${NC}"

cp -r server/* dists/ || { echo -e "  ${RED}Build failed${NC}"; exit 1; }

# Commit main before switching
echo -e "${BLUE}Committing main branch...${NC}"

git add .
if ! git diff --cached --quiet; then
  git commit -am "Deploying Vercel" > /dev/null 2>&1 || {
    echo -e "  ${RED}Main commit failed${NC}"
    exit 1
  }
  git push > /dev/null 2>&1 || {
    echo -e "  ${RED}Main push failed${NC}"
    exit 1
  }
else
    echo -e "  ${GREEN}Nothing to commit on main${NC}"
fi

# Switch branches
echo -e "${BLUE}Switching branches...${NC}"

git checkout server > /dev/null 2>&1 || {
  echo -e "  ${RED}server branch missing${NC}"
  exit 1
}

# Replace files
echo -e "${BLUE}Replacing old files...${NC}"


cp -rf dists/* . || {
  echo -e "  ${RED}No dists files${NC}"
  exit 1
}

# Commit and push
echo -e "${BLUE}Committing and pushing...${NC}"

git add .
if git diff --cached --quiet; then
  echo -e "  ${GREEN}Nothing to commit on server${NC}"
else
  git commit -m "Deploying Vercel" > /dev/null 2>&1 || {
    echo -e "  ${RED}Commit failed${NC}"
    exit 1
  }

  git push > /dev/null 2>&1 || {
    echo -e "  ${RED}Server push failed${NC}"
    exit 1
  }
fi

# Return to main
echo -e "${BLUE}Returning to main...${NC}"

git checkout main > /dev/null 2>&1 || {
  echo -e "  ${RED}Failed to return to main${NC}"
  exit 1
}

echo -e "${GREEN}Done${NC}"
