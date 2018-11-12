#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

 log() {
   # shellcheck disable=SC1117
   echo -e "\033[0;33m$(date "+%H:%M:%S")\033[0;37m ==> $1."
 }

show_important_vars() {
     echo "  REPO_URL: $REPO_URL"
     echo "  BUILD_DIR: $BUILD_DIR"
     echo "  REPO_DIR: $REPO_DIR"
 }

 REPO_URL=https://buildkite.github.io/charts
 BUILD_DIR=$(mktemp -d)
 REPO_DIR="$( pwd )"
 COMMIT_MSG="Updating chart repository"

 show_important_vars

 git remote add upstream git@github.com:buildkite/charts.git || true

 git fetch upstream
 git checkout gh-pages

 log "Initializing build directory with existing charts index"
 if [ -f index.yaml ]; then
   cp index.yaml "$BUILD_DIR"
 fi

 git checkout master

 # Package all charts and update index in temporary buildDir
 log "Packaging charts from source code"
 pushd "$BUILD_DIR"
   # shellcheck disable=SC2045
   for dir in $(ls "$REPO_DIR"/stable); do
     log "Packaging $dir"
     helm dep update "$REPO_DIR"/stable/"$dir" || true
     helm package "$REPO_DIR"/stable/"$dir"
   done

   log "Indexing repository"
   if [ -f index.yaml ]; then
     helm repo index --url ${REPO_URL} --merge index.yaml .
   else
     helm repo index --url ${REPO_URL} .
   fi
 popd

 git reset upstream/gh-pages
 cp "$BUILD_DIR"/* "$REPO_DIR"
 rm -fr .github

 log "Commiting changes to gh-pages branch"
 # shellcheck disable=SC2035
 git add *.tgz index.yaml
 git commit --message "$COMMIT_MSG"
 git push -q upstream HEAD:gh-pages
 
 log "Repository cleanup and reset"
 git reset --hard upstream/master
 git clean -df .
