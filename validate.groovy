@Grab(group='io.github.egonw.bacting', module='managers-rdf', version='1.0.0')

import org.apache.jena.shex.ShexStatus

workspaceRoot = ".."
rdf = new net.bioclipse.managers.RDFManager(workspaceRoot);

type = args[2]
if (type == "void") {
  clazz = "http://rdfs.org/ns/void#DatasetDescription"
} else {
  clazz = "https://www.sbd4nano.eu/rdf/#" + type.substring(0,1).toUpperCase() + type.substring(1)
}
file = args[1]
shape = args[0]

store = rdf.createInMemoryStore(true);
store = rdf.importFile(store, "/sbd-data-landscape-opendata/${file}", "TURTLE")
report = rdf.validateAllOfType(
  store,
  "/sbd-data-landscape-opendata/${type}.shex",
  "https://www.sbd4nano.eu/shapes/#${shape}",
  clazz
)

println "{"
println "  \"target\": \"${clazz}\","
println "  \"conformant\": ["
report.forEachReport { reportEntry ->
  status = reportEntry.status
  reason = reportEntry.reason
  focusNode = reportEntry.focus

  switch (status) {
    case ShexStatus.conformant :
      println "    {\n      \"class\":  \"${focusNode}\",\n      \"status\": \"${status}\"\n    },"
  }
}
println "    {}"
println "  ],"
println "  \"nonconformant\": ["
report.forEachReport { reportEntry ->
  status = reportEntry.status
  reason = reportEntry.reason
  focusNode = reportEntry.focus

  switch (status) {
    case ShexStatus.nonconformant :
      println "    {\n      \"class\":  \"${focusNode}\",\n      \"status\": \"${status}\",\n      \"reason\": \"${reason}\"\n    },"
  }
}
println "    {}"
println "  ]"
println "}"
