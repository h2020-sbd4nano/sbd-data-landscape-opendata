#!/usr/bash

wget -O dataset.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/void.shex
wget -O dataset.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/void.rq

wget -O source.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/source.shex

wget -O dataset.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset.shex
wget -O dataset.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset.rq
wget -O dataset_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/dataset_count.rq

wget -O model.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/model.shex
wget -O model.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/model.rq
wget -O model_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/model_count.rq

wget -O database.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/database.shex
wget -O database.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/database.rq
wget -O database_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/database_count.rq

wget -O assertion.shex https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/assertion.shex
wget -O assertion.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/assertion.rq
wget -O assertion_count.rq https://raw.githubusercontent.com/h2020-sbd4nano/sbd-data-landscape/master/shapes/assertion_count.rq

echo "LIMIT 5" >> assertion.rq
echo "LIMIT 5" >> dataset.rq
echo "LIMIT 5" >> model.rq
echo "LIMIT 5" >> database.rq
