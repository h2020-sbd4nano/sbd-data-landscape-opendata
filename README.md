[![Update the Open SbD4Nano Cache](https://github.com/h2020-sbd4nano/sbd-data-landscape-opendata/actions/workflows/validate.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-landscape-opendata/actions/workflows/validate.yml)

# sbd-data-landscape-opendata

This repository is about SbD4Nano Landscape data from openly licensed resources.
Internally, the project has a larger collection of data, including data that cannot
be shared. This repository are the tools needed to collect the RDF behind our
public SPARQL endpoint and the basis of an eBook:

* SPARQL endpoint: https://sbd4nanolandscape.rdf.bigcat-bioinformatics.org/
* eBook: https://h2020-sbd4nano.github.io/sbd-data-book/

## Requirements

A Ubuntu or Debian system, e.g. with the Windows Linux Subsystem.

* wget
* roqet
* jq
* npm
* Groovy 4.x (not available as Debian/Ubuntu package)

Install the Debian/Ubuntu packages with:

```shell
sudo apt install wget rasqal-utils jq
```


Install ROBOT:

```shell
wget https://github.com/ontodev/robot/releases/download/v1.9.3/robot.jar
curl https://raw.githubusercontent.com/ontodev/robot/master/bin/robot > robot
```

Get a copy of the eNanoMapper ontology and convert it with ROBOT to Turtle:

```shell
wget https://github.com/enanomapper/ontologies/releases/download/v9.0/enanomapper-full.owl
sh ./robot convert --input enanomapper-full.owl --output enanomapper-full.ttl
```

## How to run

First, check the `fetchData.sh` file in this repository. Then, run these commands:

```shell
sh fetchData.sh
make validation
sh fetchShapes.sh
make statistics
make | tee shexValidation.log
```

## Make the open.ttl

Run the `fetchData.sh` file to download all data. This script also defines the files
that are open-licensed and which ones are not. Next, run the following commands to create the `open.ttl`:

```shell
make open.ttl
```

## Status

The following repositories use GitHub Actions to collect data. Here are their status badges:

* [h2020-sbd4nano/sbd-data-ambit](https://github.com/h2020-sbd4nano/sbd-data-ambit) [![Extract Bioschemas](https://github.com/h2020-sbd4nano/sbd-data-ambit/actions/workflows/extractBioschemas.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-ambit/actions/workflows/extractBioschemas.yml)
* [h2020-sbd4nano/sbd-data-aopwiki](https://github.com/h2020-sbd4nano/sbd-data-aopwiki) [![Update AOP models](https://github.com/h2020-sbd4nano/sbd-data-aopwiki/actions/workflows/updateData.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-aopwiki/actions/workflows/updateData.yml)
* [h2020-sbd4nano/sbd-data-elixir-biotools](https://github.com/h2020-sbd4nano/sbd-data-elixir-biotools) [![Extract Toxicology Tools from bio.tools](https://github.com/h2020-sbd4nano/sbd-data-elixir-biotools/actions/workflows/extract.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-elixir-biotools/actions/workflows/extract.yml)
* [h2020-sbd4nano/sbd-data-fdp](https://github.com/h2020-sbd4nano/sbd-data-fdp) [![Extract from FAIR Data Point](https://github.com/h2020-sbd4nano/sbd-data-fdp/actions/workflows/extract.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-fdp/actions/workflows/extract.yml)
* [h2020-sbd4nano/sbd-data-nanocommons](https://github.com/h2020-sbd4nano/sbd-data-nanocommons) [![Extract Bioschemas](https://github.com/h2020-sbd4nano/sbd-data-nanocommons/actions/workflows/extractBioschemas.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-nanocommons/actions/workflows/extractBioschemas.yml)
* [h2020-sbd4nano/sbd-data-nanowiki](https://github.com/h2020-sbd4nano/sbd-data-nanowiki) [![Validation](https://github.com/h2020-sbd4nano/sbd-data-nanowiki/actions/workflows/validate.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-nanowiki/actions/workflows/validate.yml)
* [h2020-sbd4nano/sbd-data-riskgone](https://github.com/h2020-sbd4nano/sbd-data-riskgone) [![Extract Bioschemas](https://github.com/h2020-sbd4nano/sbd-data-riskgone/actions/workflows/extractBioschemas.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-riskgone/actions/workflows/extractBioschemas.yml)
* [h2020-sbd4nano/sbd-data-vhp4safety](https://github.com/h2020-sbd4nano/sbd-data-vhp4safety) [![Extract Bioschemas](https://github.com/h2020-sbd4nano/sbd-data-vhp4safety/actions/workflows/extractBioschemas.yml/badge.svg)](https://github.com/h2020-sbd4nano/sbd-data-vhp4safety/actions/workflows/extractBioschemas.yml)

