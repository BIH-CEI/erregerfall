Profile: Profil_Abstrichserie
Parent: DiagnosticReport
Id: sd-abstrichserie
Title: "Profil - Abstrichserie"
Description: "Eine Abstrichserie besteht aus einem oder mehreren Befunden, die für einen bestimmten Erreger relevant sind und als Grundlage für eine medizinische Entscheidung dienen"
* extension contains
    // http://hl7.org/fhir/StructureDefinition/workflow-reasonCode named reasonCode 0..1 MS and
    http://hl7.org/fhir/StructureDefinition/diagnosticReport-summaryOf named summaryOf 0..* MS
// * extension[reasonCode]
// * extension[reasonCode] ^short = "Fragestellung"
// * extension[reasonCode].valueCodeableConcept from VS_Mikrobiologischer_Befund_MRE_Klasse (required)
* extension[summaryOf] MS
* extension[summaryOf] ^short = "weitere Befunde"
* extension[summaryOf] ^definition = "Liste von Auftragsnummern mit zu der Abstrichserie zugehörigen Befunden"
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains Abstrichseriennummer 1..1
* identifier[Abstrichseriennummer] ^short = "Abstrichseriennummer"
* identifier[Abstrichseriennummer] ^definition = "Eindeutige Abstrichseriennummer innerhalb des Patienten"
* identifier[Abstrichseriennummer].type 1.. MS
* identifier[Abstrichseriennummer].type = $v2-0203#LACSN
* identifier[Abstrichseriennummer].type.coding MS
* identifier[Abstrichseriennummer].system 1.. MS
* identifier[Abstrichseriennummer].value 1.. MS
* identifier[Abstrichseriennummer].assigner MS
* basedOn MS
* basedOn ^short = "Verweis auf Auftragsnummer"
* basedOn ^definition = "Enthält die Referenzen auf die Aufträge in Form von ServiceRequests"
* code MS
* code = $loinc#78258-1 "Infectious disease Diagnostic study note"
* subject MS
* subject only Reference(Patient)
* subject.identifier MS
* subject.identifier ^short = "primäre Patientennummer im lokalen KIS"
* effective[x] only dateTime
* effective[x] MS
* specimen MS
* specimen only Reference($SpecimenBio)
* result MS
* result ^short = "Verweis auf Laborergebnisse"
* result ^definition = "Enthält die Referenzen auf die Laborergbenisse in Form von Observations"
//* result ^slicing.discriminator[+].type = #value
//* result ^slicing.discriminator[=].path = "resolve()"
//* result ^slicing.rules = #open
//* result contains erreger-nachweis 0..* MS and mre-klasse 0..* MS
//* result[erreger-nachweis] only Reference(Profil_ErregerNachweis)
//* result[mre-klasse] only Reference(Profil_MREKlasse)
* conclusionCode ^slicing.discriminator.type = #pattern
* conclusionCode ^slicing.discriminator.path = "$this"
* conclusionCode ^slicing.rules = #open
* conclusionCode contains result-code 0..* MS and not-countable-reason 0..1 MS
* conclusionCode[result-code] from vs-abstrichserie-ergbenis (required)
* conclusionCode[not-countable-reason] from vs-nicht-zaehlbar-grund (required)

Profile: Untersuchungsauftrag
Parent: $ServiceRequestLab
Id: untersuchungsauftrag
Title: "Untersuchungsauftrag"
Description: "tbd"
* reasonCode MS
* reasonCode from VS_Mikrobiologischer_Befund_MRE_Klasse (required)

Instance: example-abstrichserie
InstanceOf: sd-abstrichserie
Usage: #example
Title: "Beispiel Abstrichserie"
Description: "Beispiel einer Abstrichserie"
// * extension[reasonCode].valueCodeableConcept = $SCT#115329001 "Methicillin resistant Staphylococcus aureus (organism)"
// * extension[reasonCode].valueCodeableConcept.text = "MRSA"
* extension[summaryOf].valueReference = Reference(example-erregerfall-mrsa)
* extension[summaryOf].valueReference.identifier.system = "https://www.charite.de/fhir/sid/erregerfaelle"
* extension[summaryOf].valueReference.identifier.value = "0123456789"
* identifier[Abstrichseriennummer].type = $v2-0203#LACSN
* identifier[Abstrichseriennummer].system = "https://www.charite.de/fhir/sid/abstrichserien"
* identifier[Abstrichseriennummer].value = "0123456789"
* basedOn = Reference(example-fragestellung)
* status = #final
* code = $loinc#78258-1 "Infectious disease Diagnostic study note"
* subject = Reference(Patient/example-patient)
* conclusionCode[result-code] = $SCT#10828004 "Positive (qualifier value)"

Instance: example-fragestellung
InstanceOf: untersuchungsauftrag
Usage: #example
Title: "example-fragestellung"
Description: "Beispiel eines Untersuchungsauftrags inkl. Fragestellung"
* identifier[anforderung].system = "https://www.charite.de/fhir/sid/anforderung-lab-identifier"
* identifier[anforderung].value = "1234567890"
* identifier[anforderung].assigner = Reference(Organization/Charite)
* status = #completed
* intent = #order
* category.coding[laboratory] = $obs-category#laboratory
* code = $loinc#79447-9
* subject = Reference(Patient/example-patient)
* authoredOn = "2021-01-01"
* reasonCode = $SCT#115329001 "Methicillin resistant Staphylococcus aureus (organism)"
* reasonCode.text = "MRSA"