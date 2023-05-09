TTLS  := ${shell cat open.txt | grep -v open.ttl | grep -v node_modules }
VALIDS := ${shell cat open.txt | grep -v open.ttl | grep -v node_modules | sed -e 's/ttl/txt/' }
JSONS := ${shell cat open.txt | grep -v open.ttl | grep -v node_modules | sed -e 's/ttl/json/' }

# assumes @shexjs to be installed, see the README
SHEXVALIDATE="./node_modules/@shexjs/cli/bin/validate"

.PRECIOUS: %.uris %.json

all: open.ttl dataset.json model.json assertion.json database.json void.json

open.txt:
	@bash fetchData.sh

validation: ${VALIDS}

%.txt: %.ttl
	@echo "Validating $<"
	@cat $< | rapper -i turtle -t -q - . > /dev/null

clean:
	# deletes computed files
	@rm -f *.json *.uris open.ttl open.txt
	@rm -Rf sbd4nano nanosolveit smartnanotox wikidata wp1 wp2 assertions diamonds aop nanocommons vhp4safety

distclean: clean
	# also deletes downloaded files
	@rm -Rf dataset.* wikidata/ wp1/ nanowiki/

%.uris: %.rq
	@# roqet -q -r csv $< -D open.ttl | grep http | head -2 > $@
	@#roqet -q -r csv $< -D open.ttl | grep http > $@
	@roqet -q -r csv $< -D open.ttl | tail -n +2 > $@
	@touch $@

%.json: %.uris
	@echo "Validating the $*s"
	@echo "{ \"results\": [" > $@
	@for RESOURCE in `cat $< | sed 's/\\r//'` ; do \
		echo "  Running ShEx for $$RESOURCE" ; \
		${SHEXVALIDATE} -s resource -d open.ttl -x $*.shex -n $$RESOURCE > tmp.json ; \
		echo "    Errors: " `cat tmp.json | jq '.errors | length'` ; \
		cat tmp.json >> $@ ; \
		echo "," >> $@ ; \
	done
	@echo "{}" >> $@
	@echo "]}" >> $@
	@echo "  Summary: " `cat $@ | jq '.results[] .errors | length'` ; \

open.ttl: ${TTLS} validation
	@cat ${TTLS} > open.ttl

statistics:
	@echo "Calculating statistics"
	@for ttl in ${TTLS}; do \
		echo "  Running for $$ttl" ; \
		roqet -q -r csv dataset_count.rq -D $$ttl | grep "Total" ; \
		roqet -q -r csv database_count.rq -D $$ttl | grep "Total" ; \
		roqet -q -r csv model_count.rq -D $$ttl | grep "Total" ; \
		roqet -q -r csv assertion_count.rq -D $$ttl | grep "Total" ; \
		echo -n "" ; \
	done
