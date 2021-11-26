# sbd-data-landscape-data

CONFIDENTIAL. NEVER TO BE SHARED. CONTAINS PROPRIETARY DATA. NOT EVEN FINAL. 

THIS IS JUST A CACHE FOR CONVENIENCE. NOT TO BE SHARED UNDER ANY SITUATION OUTSIDE BIGCAT.

SCREAM. ALERT.


## Requirements

A Ubuntu or Debian system, e.g. with the Windows Linux Subsystem.

* wget
* roqet
* jq
* npm

Install the npm shex module with:

```shell
npm install shex
```

## How to run

First, read the `fetchData.sh` file and get a GitHub Personal Access Token (PAT).
Then, run these commands:

```shell
sh fetchData.sh
make validation
sh fetchShapes.sh
make statistics
make | tee shexValidation.log
```
