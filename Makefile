TTLS  := ${shell cat open.txt | grep -v open.ttl | grep -v node_modules }
VALIDS := ${shell cat open.txt | grep -v open.ttl | grep -v node_modules | sed -e 's/ttl/txt/' }
JSONS := ${shell cat open.txt | grep -v open.ttl | grep -v node_modules | sed -e 's/ttl/json/' }

# assumes Groovy >4.0.4 to be installed, see the README
SHEXVALIDATE=groovy validate.groovy

.PRECIOUS: %.uris %.json

all: open.txt open.ttl dataset.json model.json assertion.json database.json void.json

open.txt:
	@bash fetchData.sh

validation: ${VALIDS}

%.txt: %.ttl
	@echo "Validating $<"
	@cat $< | rapper -i turtle -t -q - . > /dev/null

clean:
	# deletes computed files
	@rm -f *.json
	@rm -Rf sbd4nano nanosolveit smartnanotox wikidata wp1 wp2 assertions diamonds aop nanocommons vhp4safety ambit nanowiki

distclean: clean
	# also deletes downloaded files
	@rm -Rf dataset.* wikidata/ wp1/ nanowiki/

%.json:
	@echo "Validating the $*s"
	${SHEXVALIDATE} Resource open.ttl $* > $@

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
