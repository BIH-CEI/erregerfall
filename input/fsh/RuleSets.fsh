RuleSet: Bundle(resource, url)
* entry[+].fullUrl = "https://charite.de/fhir/erregerfall/{resource}"
* entry[=].resource = {resource}
* entry[=].request.method = #PUT
* entry[=].request.url = "{url}/{resource}"
