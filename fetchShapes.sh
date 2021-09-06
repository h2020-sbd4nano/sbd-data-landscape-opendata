#!/usr/bash

# 1. get a GitHub personal token. Create one using this info: https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token
# 2. then create an env variable:
#    export GH_TOKEN=YOUR_GITHUB_PAT

wget --header "Authorization: token ${GH_TOKEN}" -O source.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/source.shex

wget --header "Authorization: token ${GH_TOKEN}" -O dataset.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset.shex
wget --header "Authorization: token ${GH_TOKEN}" -O dataset.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset.rq
wget --header "Authorization: token ${GH_TOKEN}" -O dataset_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset_count.rq

wget --header "Authorization: token ${GH_TOKEN}" -O model.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/model.shex
wget --header "Authorization: token ${GH_TOKEN}" -O model.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/model.rq
wget --header "Authorization: token ${GH_TOKEN}" -O model_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/model_count.rq

wget --header "Authorization: token ${GH_TOKEN}" -O database.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/database.shex
wget --header "Authorization: token ${GH_TOKEN}" -O database.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/database.rq
wget --header "Authorization: token ${GH_TOKEN}" -O database_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/database_count.rq

wget --header "Authorization: token ${GH_TOKEN}" -O assertion.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/assertion.shex
wget --header "Authorization: token ${GH_TOKEN}" -O assertion.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/assertion.rq
wget --header "Authorization: token ${GH_TOKEN}" -O assertion_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/assertion_count.rq
