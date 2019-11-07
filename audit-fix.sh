#!/bin/bash
#: Title       : RHOAR Node.js npm audit fix automation
#: Date        : 2019-08-22
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.0.1
#: Description : Script to automate npm audit fix for RHOAR examples

git_commit() {
  git add .
  git commit -m "chore: npm audit fix"
}

audit_fix() {
  npm install
  npm audit fix
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
  git clone git@github.com:nodeshift-starters/nodejs-cache.git
  git clone git@github.com:nodeshift-starters/nodejs-cache-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-circuit-breaker.git
  git clone git@github.com:nodeshift-starters/nodejs-circuit-breaker-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-configmap.git
  git clone git@github.com:nodeshift-starters/nodejs-configmap-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-health-check.git
  git clone git@github.com:nodeshift-starters/nodejs-health-check-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-messaging-work-queue.git
  git clone git@github.com:nodeshift-starters/nodejs-messaging-work-queue-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-rest-http-crud.git
  git clone git@github.com:nodeshift-starters/nodejs-rest-http-crud-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-rest-http.git
  git clone git@github.com:nodeshift-starters/nodejs-rest-http-redhat.git
  git clone git@github.com:nodeshift-starters/nodejs-rest-http-secured.git
  git clone git@github.com:nodeshift-starters/nodejs-rest-http-secured-redhat.git
}

info() {
  printf "\n"
  printf "%s\n" "WARNING: Please be sure you are running this script"
  printf "%s\n" "inside an empty directory. This script will try to "
  printf "%s\n" "remove the 'repositories' directory before to start "
  printf "%s\n" "the process."
  printf "\n"
}

start_process() {
  read -p "Continue (y/n)? " C
  if [ "$C" = "y" ]; then
    cleanup
    git_clone

    singleproject=(
      nodejs-configmap
      nodejs-health-check
      nodejs-rest-http
      nodejs-rest-http-crud
      nodejs-rest-http-secured
    )

    singleprojectrh=(
      nodejs-configmap-redhat
      nodejs-health-check-redhat
      nodejs-rest-http-redhat
      nodejs-rest-http-crud-redhat
      nodejs-rest-http-secured-redhat
    )

    for i in "${singleproject[@]}"; do
      cd $i
      audit_fix
      git_commit
      git push origin master
      git checkout 10.x
      audit_fix
      git_commit
      git push origin 10.x
      cd .. # back to repositories
    done

    for i in "${singleprojectrh[@]}"; do
      cd $i
      audit_fix
      git_commit
      git push origin master
      cd .. # back to repositories
    done

    cd nodejs-cache/cute-name-service/
    audit_fix
    cd ../greeting-service/
    audit_fix
    cd ..
    git_commit
    git push origin master
    git checkout 10.x
    cd cute-name-service/
    audit_fix
    cd ../greeting-service/
    audit_fix
    cd ..
    git_commit
    git push origin 10.x

    cd .. # back to repositories

    cd nodejs-cache-redhat/cute-name-service/
    audit_fix
    cd ../greeting-service/
    audit_fix
    cd ..
    git_commit
    git push origin master

    cd .. # back to repositories

    cd nodejs-circuit-breaker/greeting-service/
    audit_fix
    cd ../name-service/
    audit_fix
    cd ..
    git_commit
    git push origin master
    git checkout 10.x
    cd greeting-service
    audit_fix
    cd ../name-service
    audit_fix
    cd ..
    git_commit
    git push origin 10.x

    cd .. # back to repositories

    cd nodejs-circuit-breaker-redhat/greeting-service/
    audit_fix
    cd ../name-service/
    audit_fix
    cd ..
    git_commit
    git push origin master

    cd .. # back to repositories

    cd nodejs-messaging-work-queue/frontend/
    audit_fix
    cd ../worker/
    audit_fix
    cd ..
    git_commit
    git push origin master
    git checkout 10.x
    cd frontend
    audit_fix
    cd ../worker
    audit_fix
    cd ..
    git_commit
    git push origin 10.x

    cd .. # back to repositories

    cd nodejs-messaging-work-queue-redhat/frontend/
    audit_fix
    cd ../worker/
    audit_fix
    cd ..
    git_commit
    git push origin master

    cd .. # back to repositories

    pwd

    exit 0
  else
    exit 0
  fi
}

info
start_process
