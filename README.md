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

Install the Debian/Ubuntu packages with:

```shell
sudo apt install wget rasqal-utils jq npm
```

Install the npm shexjs module with:

```shell
npm install @shexjs/cli
```

Install ROBOT:

```shell
wget https://github.com/ontodev/robot/releases/download/v1.7.0/robot.jar
curl https://raw.githubusercontent.com/ontodev/robot/master/bin/robot > robot
```

Get a copy of the eNanoMapper ontology and convert it with ROBOT to Turtle:

```shell
wget https://github.com/enanomapper/ontologies/releases/download/v9.0/enanomapper-full.owl
sh ./robot convert --input enanomapper-full.owl --output enanomapper-full.ttl
```

## How to run

First, read the `fetchData.sh` file and get a GitHub Personal Access Token (PAT).
Set the latter with:

```shell
export GH_TOKEN=YOUR_GITHUB_PAT
```

Then, run these commands:

```shell
sh fetchData.sh
make validation
sh fetchShapes.sh
make statistics
make | tee shexValidation.log
```

## Make the all.ttl and open.ttl
Run the `fetchData.sh` file to download all data. This script also defines the files that are "open" and which ones are not. 
Next, run the following commands to create the `open.ttl` and `all.ttl` respectively:
```shell
make open.ttl
make all.ttl
```
