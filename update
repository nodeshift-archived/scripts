#!/bin/bash
#: Title       : RHOAR Node.js dependency update automation
#: Date        : 2019-08-20
#: Author      : "Helio Frota" <00hf11 at gmail dot com>
#: Version     : 0.0.1
#: Description : Script to automate RHOAR examples dependency updates

# Change only the numbers of the versions you want to update

axios="\"^0.19.0\""
bodyparser="\"~1.19.0\""
cors="\"~2.8.4\""
debug="\"^4.0.1"\"
express="\"~4.17.1\""
infinispan="\"~0.6.0\""
istanbul="\"~0.4.5\""
jsyaml="\"^3.13.1"\"
keycloakconnect="\"^6.0.1"\"
kubeprobe="\"~0.3.2\""
licensereporter="\"~1.2.0\""
nodeshift="\"~3.0.1\""
nyc="\"~14.1.1\""
opossum="\"~1.11.1"\"
pg="\"^7.8.2"\"
pino="\"~5.13.0"\"
projectnamegenerator="\"~2.1.7\""
proxyquire="\"~2.1.3\""
rhea="\"^1.0.0"\"
rhoaster="\"^0.2.0"\"
sinon="\"^7.2.4"\"
supertest="\"~4.0.2\""
tape="\"~4.11.0\""
tapspec="\"~5.0.0\""
ws="\"~6.2.0"\"

jsonfiles=(
  nodejs-cache/cute-name-service/package.json
  nodejs-cache/greeting-service/package.json
  nodejs-circuit-breaker/greeting-service/package.json
  nodejs-circuit-breaker/name-service/package.json
  nodejs-configmap/package.json
  nodejs-health-check/package.json
  nodejs-messaging-work-queue/frontend/package.json
  nodejs-messaging-work-queue/worker/package.json
  nodejs-rest-http-crud/package.json
  nodejs-rest-http/package.json
  nodejs-rest-http-secured/package.json
  nodejs-istio-tracing/cute-name-service/package.json
  nodejs-istio-tracing/greeting-service/package.json
)

jsonfilesrh=(
  nodejs-cache-redhat/cute-name-service/package.json
  nodejs-cache-redhat/greeting-service/package.json
  nodejs-circuit-breaker-redhat/greeting-service/package.json
  nodejs-circuit-breaker-redhat/name-service/package.json
  nodejs-configmap-redhat/package.json
  nodejs-health-check-redhat/package.json
  nodejs-messaging-work-queue-redhat/frontend/package.json
  nodejs-messaging-work-queue-redhat/worker/package.json
  nodejs-rest-http-crud-redhat/package.json
  nodejs-rest-http-redhat/package.json
  nodejs-rest-http-secured-redhat/package.json
  nodejs-istio-tracing-redhat/cute-name-service/package.json
  nodejs-istio-tracing-redhat/greeting-service/package.json
)

git_commit() {
  npm install --silent
  git add .
  git commit -m "chore: dependency update"
}

version_update() {

  for i in "${jsonfiles[@]}"; do
    local CURR=$( (sed -n '/\"axios\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"axios\":/ s/$CURR/\ $axios/" $i

    CURR=$( (sed -n '/\"body-parser\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"body-parser\":/ s/$CURR/\ $bodyparser/" $i

    CURR=$( (sed -n '/\"cors\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"cors\":/ s/$CURR/\ $cors/" $i

    CURR=$( (sed -n '/\"debug\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"debug\":/ s/$CURR/\ $debug/" $i

    CURR=$( (sed -n '/\"express\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"express\":/ s/$CURR/\ $express/" $i

    CURR=$( (sed -n '/\"infinispan\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"infinispan\":/ s/$CURR/\ $infinispan/" $i

    CURR=$( (sed -n '/\"istanbul\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"istanbul\":/ s/$CURR/\ $istanbul/" $i

    CURR=$( (sed -n '/\"js-yaml\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"js-yaml\":/ s/$CURR/\ $jsyaml/" $i

    CURR=$( (sed -n '/\"keycloak-connect\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"keycloak-connect\":/ s/$CURR/\ $keycloakconnect/" $i

    CURR=$( (sed -n '/\"kube-probe\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"kube-probe\":/ s/$CURR/\ $kubeprobe/" $i

    CURR=$( (sed -n '/\"license-reporter\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"license-reporter\":/ s/$CURR/\ $licensereporter/" $i

    CURR=$( (sed -n '/\"nodeshift\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"nodeshift\":/ s/$CURR/\ $nodeshift/" $i

    CURR=$( (sed -n '/\"nyc\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"nyc\":/ s/$CURR/\ $nyc/" $i

    CURR=$( (sed -n '/\"opossum\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"opossum\":/ s/$CURR/\ $opossum/" $i

    CURR=$( (sed -n '/\"pg\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"pg\":/ s/$CURR/\ $pg/" $i

    CURR=$( (sed -n '/\"pino\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"pino\":/ s/$CURR/\ $pino/" $i

    CURR=$( (sed -n '/\"project-name-generator\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"project-name-generator\":/ s/$CURR/\ $projectnamegenerator/" $i

    CURR=$( (sed -n '/\"proxyquire\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"proxyquire\":/ s/$CURR/\ $proxyquire/" $i

    CURR=$( (sed -n '/\"rhea\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"rhea\":/ s/$CURR/\ $rhea/" $i

    CURR=$( (sed -n '/\"rhoaster\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"rhoaster\":/ s/$CURR/\ $rhoaster/" $i

    CURR=$( (sed -n '/\"sinon\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"sinon\":/ s/$CURR/\ $sinon/" $i

    CURR=$( (sed -n '/\"supertest\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"supertest\":/ s/$CURR/\ $supertest/" $i

    CURR=$( (sed -n '/\"tap-spec\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"tap-spec\":/ s/$CURR/\ $tapspec/" $i

    CURR=$( (sed -n '/\"tape\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"tape\":/ s/$CURR/\ $tape/" $i

    CURR=$( (sed -n '/\"ws\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"ws\":/ s/$CURR/\ $ws/" $i
  done
}

version_updaterh() {

  for i in "${jsonfilesrh[@]}"; do
    local CURR=$( (sed -n '/\"axios\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"axios\":/ s/$CURR/\ $axios/" $i

    CURR=$( (sed -n '/\"body-parser\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"body-parser\":/ s/$CURR/\ $bodyparser/" $i

    CURR=$( (sed -n '/\"cors\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"cors\":/ s/$CURR/\ $cors/" $i

    CURR=$( (sed -n '/\"debug\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"debug\":/ s/$CURR/\ $debug/" $i

    CURR=$( (sed -n '/\"express\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"express\":/ s/$CURR/\ $express/" $i

    CURR=$( (sed -n '/\"infinispan\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"infinispan\":/ s/$CURR/\ $infinispan/" $i

    CURR=$( (sed -n '/\"istanbul\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"istanbul\":/ s/$CURR/\ $istanbul/" $i

    CURR=$( (sed -n '/\"js-yaml\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"js-yaml\":/ s/$CURR/\ $jsyaml/" $i

    CURR=$( (sed -n '/\"keycloak-connect\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"keycloak-connect\":/ s/$CURR/\ $keycloakconnect/" $i

    CURR=$( (sed -n '/\"kube-probe\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"kube-probe\":/ s/$CURR/\ $kubeprobe/" $i

    CURR=$( (sed -n '/\"license-reporter\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"license-reporter\":/ s/$CURR/\ $licensereporter/" $i

    CURR=$( (sed -n '/\"nodeshift\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"nodeshift\":/ s/$CURR/\ $nodeshift/" $i

    CURR=$( (sed -n '/\"nyc\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"nyc\":/ s/$CURR/\ $nyc/" $i

    CURR=$( (sed -n '/\"opossum\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"opossum\":/ s/$CURR/\ $opossum/" $i

    CURR=$( (sed -n '/\"pg\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"pg\":/ s/$CURR/\ $pg/" $i

    CURR=$( (sed -n '/\"pino\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"pino\":/ s/$CURR/\ $pino/" $i

    CURR=$( (sed -n '/\"project-name-generator\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"project-name-generator\":/ s/$CURR/\ $projectnamegenerator/" $i

    CURR=$( (sed -n '/\"proxyquire\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"proxyquire\":/ s/$CURR/\ $proxyquire/" $i

    CURR=$( (sed -n '/\"rhea\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"rhea\":/ s/$CURR/\ $rhea/" $i

    CURR=$( (sed -n '/\"rhoaster\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"rhoaster\":/ s/$CURR/\ $rhoaster/" $i

    CURR=$( (sed -n '/\"sinon\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"sinon\":/ s/$CURR/\ $sinon/" $i

    CURR=$( (sed -n '/\"supertest\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"supertest\":/ s/$CURR/\ $supertest/" $i

    CURR=$( (sed -n '/\"tap-spec\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"tap-spec\":/ s/$CURR/\ $tapspec/" $i

    CURR=$( (sed -n '/\"tape\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"tape\":/ s/$CURR/\ $tape/" $i

    CURR=$( (sed -n '/\"ws\":/p' $i | cut -d':' -f2))
    CURR=${CURR//,/}
    sed -i "/\"ws\":/ s/$CURR/\ $ws/" $i
  done
}

cleanup() {
  printf "%s\n" "Removing repositories if exist..."
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
  git clone git@github.com:nodeshift-starters/nodejs-istio-tracing.git
  git clone git@github.com:nodeshift-starters/nodejs-istio-tracing-redhat.git
  cd ..
}

info() {
  printf "\n"
  printf "%s\n" "WARNING: Please be sure you are running this script"
  printf "%s\n" "inside an empty directory. This script will try to "
  printf "%s\n" "remove the examples before to start the process."
  printf "\n"
}

start_process() {
  read -p "Continue (y/n)? " C
  if [ "$C" = "y" ]; then
    cleanup
    git_clone

    cd repositories
    version_update # updates all the master (12.x) branches

    cd nodejs-cache
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-circuit-breaker
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-configmap
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-health-check
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-messaging-work-queue
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-rest-http-crud
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-rest-http
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-rest-http-secured
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-istio-tracing
    git_commit
    # git push origin master
    git checkout 8.x

    cd ..          # back to repositories directory
    version_update # updates all the 8x branches

    cd nodejs-cache
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-circuit-breaker
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-configmap
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-health-check
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-messaging-work-queue
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-rest-http-crud
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-rest-http
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-rest-http-secured
    git_commit
    # git push origin 8.x
    git checkout 10.x
    cd ../nodejs-istio-tracing
    git_commit
    # git push origin 8.x
    git checkout 10.x

    cd ..          # back to repositories directory
    version_update # updates all the 10x branches

    cd nodejs-cache
    git_commit
    # git push origin 10.x
    cd ../nodejs-circuit-breaker
    git_commit
    # git push origin 10.x
    cd ../nodejs-configmap
    git_commit
    # git push origin 10.x
    cd ../nodejs-health-check
    git_commit
    # git push origin 10.x
    cd ../nodejs-messaging-work-queue
    git_commit
    # git push origin 10.x
    cd ../nodejs-rest-http-crud
    git_commit
    # git push origin 10.x
    cd ../nodejs-rest-http
    git_commit
    # git push origin 10.x
    cd ../nodejs-rest-http-secured
    git_commit
    # git push origin 10.x
    cd ../nodejs-istio-tracing
    git_commit
    # git push origin 10.x

    cd ..            # back to repositories directory
    version_updaterh # updates all the master (10.x) branches

    cd nodejs-cache-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-circuit-breaker-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-configmap-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-health-check-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-messaging-work-queue-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-rest-http-crud-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-rest-http-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-rest-http-secured-redhat
    git_commit
    # git push origin master
    git checkout 8.x
    cd ../nodejs-istio-tracing-redhat
    git_commit
    # git push origin master
    git checkout 8.x

    cd ..            # back to repositories directory
    version_updaterh # updates all the 8.x branches

    cd nodejs-cache-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-circuit-breaker-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-configmap-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-health-check-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-messaging-work-queue-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-rest-http-crud-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-rest-http-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-rest-http-secured-redhat
    git_commit
    # git push origin 8.x
    cd ../nodejs-istio-tracing-redhat
    git_commit
    # git push origin 8.x
    cd .. # back to repositories directory
    exit 0
  else
    exit 0
  fi
}

info
start_process
