#!/bin/bash
#: Title       : RHOAR examples release automation
#: Date        : 2019-08-21
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.0.1
#: Description : Script to automate RHOAR examples release

CACHE=""
CIRCUIT=""
ISTIO=""
MESSAGING=""

info() {
  printf "\n"
  printf "%s\n" "WARNING: Please be sure you are running this script"
  printf "%s\n" "inside an empty directory. This script will try to "
  printf "%s\n" "remove the 'repositories' directory before to start "
  printf "%s\n" "the process."
  printf "\n"
}

cleanup() {
  printf "%s\n" "Removing 'repositories' directory if exist..."
  if [ -d "repositories" ]; then
    rm -Rf repositories
  fi
  printf "%s\n" "Done."
}

git_clone() {
  mkdir repositories
  cd repositories
  read -p "Release all the examples (y/n)? " C
  if [ "$C" = "y" ]; then
    git clone git@github.com:nodeshift-starters/nodejs-cache.git
    git clone git@github.com:nodeshift-starters/nodejs-cache-redhat.git
    git clone git@github.com:nodeshift-starters/nodejs-circuit-breaker.git
    git clone git@github.com:nodeshift-starters/nodejs-circuit-breaker-redhat.git
    git clone git@github.com:nodeshift-starters/nodejs-istio-tracing.git
    git clone git@github.com:nodeshift-starters/nodejs-istio-tracing-redhat.git
    git clone git@github.com:nodeshift-starters/nodejs-messaging-work-queue.git
    git clone git@github.com:nodeshift-starters/nodejs-messaging-work-queue-redhat.git
  else
    read -p "Release nodejs-cache (y/n)? " C
    if [ "$C" = "y" ]; then
      CACHE="1"
      git clone git@github.com:nodeshift-starters/nodejs-cache.git
      git clone git@github.com:nodeshift-starters/nodejs-cache-redhat.git
    fi
    read -p "Release nodejs-circuit-breaker (y/n)? " C
    if [ "$C" = "y" ]; then
      CIRCUIT="1"
      git clone git@github.com:nodeshift-starters/nodejs-circuit-breaker.git
      git clone git@github.com:nodeshift-starters/nodejs-circuit-breaker-redhat.git
    fi
    read -p "Release nodejs-istio-tracing (y/n)? " C
    if [ "$C" = "y" ]; then
      ISTIO="1"
      git clone git@github.com:nodeshift-starters/nodejs-istio-tracing.git
      git clone git@github.com:nodeshift-starters/nodejs-istio-tracing-redhat.git
    fi
    read -p "Release nodejs-messaging-work-queue (y/n)? " C
    if [ "$C" = "y" ]; then
      MESSAGING="1"
      git clone git@github.com:nodeshift-starters/nodejs-messaging-work-queue.git
      git clone git@github.com:nodeshift-starters/nodejs-messaging-work-queue-redhat.git
    fi
  fi
}

update_cache() {
  sed -i "0,$1/s/$1/$2/" cute-name-service/package.json
  sed -i "0,$1/s/$1/$2/" greeting-service/package.json
  sed -i "0,$1/s/$1/$2/" cute-name-service/.openshiftio/application.yaml
  sed -i "0,$1/s/$1/$2/" greeting-service/.openshiftio/application.yaml
  cd cute-name-service
  npm install --silent
  npm audit fix
  cd ..
  cd greeting-service
  npm install --silent
  npm audit fix
  cd ..
}

read_new() {
  BR=$(git rev-parse --abbrev-ref HEAD)
  printf "%s\n" "The current version for node-cache $BR is: $1"
  printf "%s\n" "What is the new version number?"
  read NEW
}

update_version() {
  if [ ! -z $CACHE ]; then
    cd nodejs-cache
    git checkout 8.x
    local CURR=$( (sed -n '3p' cute-name-service/package.json | cut -c 15- | rev | cut -c 3- | rev))
    read_new $CURR
    update_cache $CURR $NEW
    git add .
    git commit -m "chore: $NEW release"
    local LASTCOMMIT=$(git log -1 --pretty=format:"%h")
    git tag v$NEW $LASTCOMMIT -m "chore: $NEW release"
    # git push origin v$NEW
    # git push origin 8.x

    cd ../nodejs-cache-redhat
    git checkout 8.x
    update_cache $CURR $NEW
    git add .
    git commit -m "chore: $NEW release"
    LASTCOMMIT=$(git log -1 --pretty=format:"%h")
    git tag v$NEW $LASTCOMMIT -m "chore: $NEW release"
    # git push origin v$NEW
    # git push origin 8.x

    cd ../nodejs-cache
    git checkout 10.x
    CURR=$( (sed -n '3p' cute-name-service/package.json | cut -c 15- | rev | cut -c 3- | rev))
    read_new $CURR
    update_cache $CURR $NEW
    git add .
    git commit -m "chore: $NEW release"
    LASTCOMMIT=$(git log -1 --pretty=format:"%h")
    git tag v$NEW $LASTCOMMIT -m "chore: $NEW release"
    # git push origin v$NEW
    # git push origin 10.x

    cd ../nodejs-cache-redhat
    git checkout master
    update_cache $CURR $NEW
    git add .
    git commit -m "chore: $NEW release"
    LASTCOMMIT=$(git log -1 --pretty=format:"%h")
    git tag v$NEW $LASTCOMMIT -m "chore: $NEW release"
    # git push origin v$NEW
    # git push origin master

    cd ../nodejs-cache
    git checkout master
    CURR=$( (sed -n '3p' cute-name-service/package.json | cut -c 15- | rev | cut -c 3- | rev))
    read_new $CURR
    update_cache $CURR $NEW
    git add .
    git commit -m "chore: $NEW release"
    LASTCOMMIT=$(git log -1 --pretty=format:"%h")
    git tag v$NEW $LASTCOMMIT -m "chore: $NEW release"
    # git push origin v$NEW
    # git push origin master
    cd .. # back to repositories
  fi
}

start_process() {
  read -p "Continue (y/n)? " C
  if [ "$C" = "y" ]; then
    cleanup
    git_clone
    update_version
    pwd
    exit 0
  else
    exit 0
  fi
}

info
start_process
