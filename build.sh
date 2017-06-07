#!/bin/bash

AUTHORNAME="Jakbot via Travis-CI"

AUTHOREMAIL="jakob.goldmann@mail.de"

GITURL="https://$GITHUB_PAT@github.com/$TRAVIS_REPO_SLUG.git"

git remote set-url origin $GITURL

git pull

git checkout master

git config --global user.name $AUTHORNAME

git config --global user.email $AUTHOREMAIL


R CMD BATCH './build.R'


git commit -am "[ci skip] Documents produced in clean environment via Travis $TRAVIS_BUILD_NUMBER"
git push -u  --quiet origin master
