#!/bin/bash

# Go into customer notebooks repo
echo "Running git-sync for ${CUSTOMER_NAME}"
cd /notebooks

# Commit and push changes
git add --all
git commit -m "auto-sync"
git push
echo "Sync complete for ${CUSTOMER_NAME}"

