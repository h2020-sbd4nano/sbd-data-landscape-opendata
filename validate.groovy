@Grab(group='io.github.egonw.bacting', module='managers-rdf', version='0.3.2')

import org.apache.jena.shex.ShexStatus

workspaceRoot = ".."
rdf = new net.bioclipse.managers.RDFManager(workspaceRoot);

type = args[2]
clazz = type.substring(0,1).toUpperCase() + type.substring(1)
file = args[1]
shape = args[0]

store = rdf.createInMemoryStore(true);
store = rdf.importFile(store, "/sbd-data-landscape-opendata/${file}", "TURTLE")
report = rdf.validateAllOfType(
  store,
  "/sbd-data-landscape-opendata/${type}.shex",
  "https://www.sbd4nano.eu/shapes/#${shape}",
  "https://www.sbd4nano.eu/rdf/#${clazz}"
)

println "{"
report.forEachReport { reportEntry ->
  target = reportEntry.strTarget()
  status = reportEntry.status
  reason = reportEntry.reason
  focusNode = reportEntry.focus

  switch (status) {
    case ShexStatus.conformant :
      // println "  {  \"class\":  \"${focusNode}\",\n     \"status\": \"${status}\"\n  },"
      break
    case ShexStatus.nonconformant :
      println "  {  \"class\":  \"${focusNode}\",\n     \"status\": \"${status}\",\n     \"reason\": \"${reason}\"\n  },"
      break
  }
}
println "  {}"
println "}"

System.exit(0)

/*
-       @echo "{ \"results\": [" > $@
-       @for RESOURCE in `cat $< | sed 's/\\r//'` ; do \
-               echo "  Running ShEx for $$RESOURCE" ; \
-               ${SHEXVALIDATE} -s resource -d open.ttl -x $*.shex -n $$RESOURCE > tmp.json ; \
-               echo "    Errors: " `cat tmp.json | jq '.errors | length'` ; \
-               cat tmp.json >> $@ ; \
-               echo "," >> $@ ; \
-       done
-       @echo "{}" >> $@
-       @echo "]}" >> $@
-       @echo "  Summary: " `cat $@ | jq '.results[] .errors | length'` ; \
*/
