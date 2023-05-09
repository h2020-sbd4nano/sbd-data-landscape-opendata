#!/usr/bash

rm -f open.txt
touch open.txt

mkdir -p sbd4nano
wget -O sbd4nano/qsar_models.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/qsar_models.ttl
echo "sbd4nano/qsar_models.ttl" >> open.txt

mkdir -p nanosolveit
wget -O nanosolveit/tools.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-nanosolveit/main/tools.ttl
echo "nanosolveit/tools.ttl" >> open.txt

mkdir -p smartnanotox
wget -O smartnanotox/datasets.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-smartnanotox/main/datasets.ttl
echo "smartnanotox/datasets.ttl" >> open.txt

#mkdir -p wikidata
#wget -O wikidata/nanosafety_databases.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/nanosafety_databases.ttl

mkdir -p ambit
wget -O ambit/open-licensed.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-ambit/master/open-licensed.ttl
echo "ambit/open-licensed.ttl" >> open.txt

mkdir -p nanowiki
wget -O nanowiki/nanowiki.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-nanowiki/main/nanowiki.ttl
echo "nanowiki/nanowiki.ttl" >> open.txt

mkdir -p wp2
wget -O wp2/urv-qsar.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-wp2/main/urv-qsar.ttl
echo "wp2/urv-qsar.ttl" >> open.txt

mkdir -p assertions
wget -O assertions/wp1_bel.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-wp1/main/wp1_bel.ttl
wget -O assertions/outp.ttl https://raw.githubusercontent.com/h2020-sbd4nano/relationship_network/main/outp.ttl
echo "assertions/outp.ttl" >> open.txt

mkdir -p diamonds
wget -O diamonds/diamonds-models.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-diamonds/main/diamonds-models.ttl

mkdir -p aop
wget -O aop/aopwiki-datasets.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-aopwiki/main/aopwiki-datasets.ttl
echo "aop/aopwiki-datasets.ttl" >> open.txt
wget -O aop/aops.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-aopwiki/main/aops.ttl
echo "aop/aops.ttl" >> open.txt
wget -O aop/kers.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-aopwiki/main/aopwiki-relationships.ttl
echo "aop/kers.ttl" >> open.txt

mkdir -p nanocommons
wget -O nanocommons/datasets.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-nanocommons/main/datasets.ttl
echo "nanocommons/datasets.ttl" >> open.txt

mkdir -p vhp4safety
wget -O vhp4safety/cloud.ttl https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-vhp4safety/main/cloud.ttl
echo "vhp4safety/cloud.ttl" >> open.txt
