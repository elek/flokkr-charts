#!/usr/bin/env bash
set -x 

helm package ozone/ -d ./charts-repo
helm package flokkr/ -d ./charts-repo
helm repo index ./charts-repo --merge ./charts-repo/index.yaml

cd ./charts-repo
git add .
git commit -m "update with the latest build"
git push origin gh-pages
cd -
