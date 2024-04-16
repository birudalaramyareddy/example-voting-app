#!/bin/bash

set -x

REPO_URL="https://dev.azure.com/azuredevopsramya0096/voting-app/_git/voting-app"

git clone "$REPO_URL" /tmp/temp_repo

cd /tmp/temp_repo

sed -i "s|image:.*|image: votingsampleapp.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yml

git add .

git commit -m "update kubernetes manifest"

git push

rm -rf /tmp/temp_repo