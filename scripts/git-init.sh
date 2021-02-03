#!/bin/bash

## Connect to GitHub with buildextendederp token
if [ -f "/root/.ssh/known_hosts"]; then
    echo "GitHub credentials already added"
else
    mkdir -p /root/.ssh
    echo "${GIT_SSH_TOKEN}" > /root/.ssh/id_rsa
    chmod 400 /root/.ssh/id_rsa
    # Make sure the github domain is accepted
    touch /root/.ssh/known_hosts
    ssh-keyscan github.com >> /root/.ssh/known_hosts
    echo "GitHub credentials added"
fi

## Initialize git in notebooks folder and sync to GitHub
if [ -d "/notebooks/.git"]; then
    echo "Git repository already created"
else
    cd /notebooks
    git init
    git config --global user.email "${CUSTOMER_NAME}@extendederp.com"
    git config --global user.name "${CUSTOMER_NAME}-bot"
    echo "${DEPLOYMENT}-${CUSTOMER_NAME}" >> README.md
    git add README.md
    git commit -m 'first commit'
    git branch -M main
    git remote add origin git@github.com:Extended-ERP/${DEPLOYMENT}-${CUSTOMER_NAME}.git
    git push -u origin main
    echo "GitHub Connection Successful"
fi
