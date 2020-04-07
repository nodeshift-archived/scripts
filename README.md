# scripts

This repository contains scripts to help to update and release the examples.

Since each example has more than one branch, these scripts help automate simple tasks.

## Audit-fix script

The `audit-fix.sh` script goes through all examples applying `npm install` and `npm audit fix`. 

This is useful to automate dependency remediation to remove vulnerability warnings.

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

> Some dependencies are not covered by this script like `standard-version` and `xo`, because both has extra configuration inside `package.json`.

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

