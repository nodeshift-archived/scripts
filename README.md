# scripts

This repository contains scripts to help to update and release the examples.

Since each example has between 2 and 3 branches, these scripts help automate simple tasks.

## Audit-fix script

The `audit-fix.sh` script goes through all examples applying `npm install` and `npm audit fix`. 

This is useful to:

1. Automate dependency remediation to remove vulnerability warnings.
2. Reduce the time taken by the `release.sh` script.

This script is good to use when we start to notice a good amount of warnings reported by npm audit.

### How to use

```console
$ git clone git@github.com:nodeshift-starters/scripts.git
$ cd scripts
$ ./audit-fix.sh

WARNING: Please be sure you are running this script
inside an empty directory. This script will try to 
remove the 'repositories' directory before to start 
the process.

Continue (y/n)? y
```

Wait until finish.

## Update script

The `update.sh` script goes through all examples changing the `package.json` with the respective version of dependency informed
inside the script.

This is useful to:

1. Automate dependency updates.
2. Have a central point to configure the same version of `foo` dependency across the examples.
3. Avoid to have different examples using different versions of `foo` dependency.

This script is good to use when [greenkeeper](https://greenkeeper.io/) send a pull request to update a specific version to specific example
on master branch and/or when we know a dependency needs to be updated for some reason. The script will update all the examples and branches
to keep them consistent.

### How to use

```console
$ git clone git@github.com:nodeshift-starters/scripts.git
$ cd scripts
```

Edit the script by changing only the numbers of the dependency you want, then commit and push the changes using the following message pattern:

```console
$ chore: update to nodeshift 3.1.1
```

Run the script:

```console
$ ./update.sh

WARNING: Please be sure you are running this script
inside an empty directory. This script will try to 
remove the 'repositories' directory before to start 
the process.

Continue (y/n)? y
```

Wait until finish.

## Release script

The `release.sh` script goes through all examples, or specific example (your choice) changing the version and creating tags for each branch. 

This is useful to:

1. Automate the release processes.

### How to use

( Example of nodejs-messaging-work-queue release )

```console
$ git clone git@github.com:nodeshift-starters/scripts.git
$ cd scripts
$ ./release.sh

WARNING: Please be sure you are running this script
inside an empty directory. This script will try to 
remove the 'repositories' directory before to start 
the process.

Continue (y/n)? y
Removing 'repositories' directory if exist...
Done.
Release all the examples (y/n)? n
Release nodejs-cache (y/n)? n
Release nodejs-circuit-breaker (y/n)? n
Release nodejs-istio-tracing (y/n)? n
Release nodejs-messaging-work-queue (y/n)? y

You are in .../nodejs-messaging-work-queue
The current version for branch 8.x is: 1.1.1
What is the new version number?
1.1.2
```

Answer the questions and wait until finish.

It's always good to run `audit-fix.sh` before to use the `release.sh`.
