#!/bin/bash

echo "Environment Variables"
echo "REPO: ${REPO}"
echo "USERNAME: ${USERNAME}"

if [ "${GITHUB_REF}" = "master" ]
then
GITHUB_REF = "sandbox"
fi

echo "GITHUB_REF: ${GITHUB_REF}"
echo "GITHUB_SHA: ${GITHUB_SHA}"

echo "Configuring git"
git config --global hub.protocol "https"
git config --global url."https://${USERNAME}:${TOKEN}@github.com".insteadOf "https://github.com"
git config --global user.email "${EMAIL}"
git config --global user.name "${USER}"
ls
echo "Initialize GIT"
git init
echo pwd
echo "Cloning repo ${REPO}"
git clone https://github.com/${REPO}.git 
echo pwd
echo "Adding remote for repo ${REPO}"
git remote add origin https://github.com/${REPO}.git

echo "Checking out branch"
git fetch
git checkout $GITHUB_REF

echo "Deploying Gateway"
serverless config credentials --provider aws --key "${AWS_ACCESS_KEY}" --secret "${AWS_SECRET_ACCESS_KEY}"
sls --msg "${GITHUB_REF}-${GITHUB_SHA}" --stage "${GITHUB_REF}" --debug