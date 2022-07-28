#!/bin/bash
# setting up prerequisites

echo "# Installing required plugins #"
bin/elasticsearch-plugin remove analysis-icu
bin/elasticsearch-plugin install analysis-icu

bin/elasticsearch-plugin remove analysis-kuromoji
bin/elasticsearch-plugin install analysis-kuromoji

bin/elasticsearch-plugin remove analysis-smartcn
bin/elasticsearch-plugin install analysis-smartcn

bin/elasticsearch-plugin remove analysis-stempel
bin/elasticsearch-plugin install analysis-stempel
echo "# Done."

exec /usr/local/bin/docker-entrypoint.sh elasticsearch