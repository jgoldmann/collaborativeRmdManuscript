#!/bin/bash

AUTHORNAME="Jakbot"

AUTHOREMAIL="jakob.goldmann@mail.de"

GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"

git config --global user.name $AUTHORNAME
git config --global user.email $AUTHOREMAIL

git remote set-url origin $GITURL
git pull
git checkout master


echo "---- Starting to build Rmd doument ----"
R CMD BATCH './build.R'

echo "---- Deploying build document to Github ----"
git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
