#!/usr/bash

# 1. get a GitHub personal token. Create one using this info: https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token
# 2. then create an env variable:
#    export GH_TOKEN=YOUR_GITHUB_PAT

wget --header "Authorization: token ${GH_TOKEN}" -O dataset.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset.shex
wget --header "Authorization: token ${GH_TOKEN}" -O dataset.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset.rq
wget --header "Authorization: token ${GH_TOKEN}" -O dataset_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset_count.rq
