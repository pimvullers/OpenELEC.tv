#!/bin/sh

if [ `git rev-parse --abbrev-ref HEAD` != "master" ]; then
  git checkout master
fi

git pull --all
git merge upstream/master
