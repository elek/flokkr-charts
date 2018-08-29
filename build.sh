#!/usr/bin/env bash
set -x 

helm package ozone/ -d ./charts-repo
helm package freon/ -d ./charts-repo
helm package hdfs/ -d ./charts-repo
helm package grafana/ -d ./charts-repo

helm repo index ./charts-repo --merge ./charts-repo/index.yaml

cd ./charts-repo
git add .
git commit -m "update with the latest build"
git push origin gh-pages
cd -
