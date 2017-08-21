#!/bin/bash -e
# USAGE: repo-sync.sh <commit-changes?>

log () {
  echo -e "\033[0;33m$(date "+%H:%M:%S")\033[0;37m ==> $1."
}

travis_setup_git() {
  git config user.email "travis@travis-ci.org"
  git config user.name "Travis CI"
  COMMIT_MSG="Updating chart repository, travis build #$TRAVIS_BUILD_NUMBER"
  git remote add upstream "https://$GH_TOKEN@github.com/buildkite/charts.git"
}

show_important_vars() {
    echo "  REPO_URL: $REPO_URL"
    echo "  BUILD_DIR: $BUILD_DIR"
    echo "  REPO_DIR: $REPO_DIR"
    echo "  TRAVIS: $TRAVIS"
    echo "  COMMIT_CHANGES: $COMMIT_CHANGES"
}

COMMIT_CHANGES="${1}"
: ${COMMIT_CHANGES:=false}
: ${TRAVIS:=false}
REPO_URL=https://buildkite.github.com/charts
BUILD_DIR=$(mktemp -d)
# Current directory
REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
COMMIT_MSG="Updating chart repository"

show_important_vars

if [ $TRAVIS != "false" ]; then
  log "Configuring git for Travis-ci"
  travis_setup_git
else
  git remote add upstream git@github.com:buildkite/charts.git || true
fi

git fetch upstream
git checkout master

log "Initializing build directory with existing charts index"
if [ -f docs/index.yaml ]; then
  cp docs/index.yaml $BUILD_DIR
fi

# Package all charts and update index in temporary buildDir
log "Packaging charts from source code"
pushd $BUILD_DIR
  for dir in `ls $REPO_DIR/charts`;do
    log "Packaging $dir"
    helm dep update $REPO_DIR/charts/$dir
    helm package $REPO_DIR/charts/$dir
  done

  log "Indexing repository"
  if [ -f docs/index.yaml ]; then
    helm repo index --url ${REPO_URL} --merge index.yaml .
  else
    mkdir -p $REPO_DIR/docs
    helm repo index --url ${REPO_URL} .
  fi
popd

#git reset upstream/gh-pages
cp -f $BUILD_DIR/* $REPO_DIR/docs

# Commit changes are not enabled during PR
if [ $COMMIT_CHANGES != "false" ]; then
  log "Commiting changes to master branch"
  git add docs/*.tgz docs/index.yaml
  git commit --message "$COMMIT_MSG"
  git push -q upstream HEAD:master
fi
