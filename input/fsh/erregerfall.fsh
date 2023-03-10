Profile: Profil_ErregerFall
Parent: DiagnosticReport
Id: sd-erregerfall
Title: "Profil - ErregerFall"
Description: "Ein Erreger-Fall beschreibt den Verlauf des Status eines Patienten in Bezug auf einen bestimmten Erreger. In der Regel entsteht ein Erreger-Fall als Reaktion auf eine positive oder grenzwertige Abstrichserie."
* extension contains
    http://hl7.org/fhir/StructureDefinition/diagnosticReport-summaryOf named summaryOf 0..* MS
* extension[summaryOf] MS
* extension[summaryOf] ^short = "weitere Befunde"
* extension[summaryOf] ^definition = "Liste von Auftragsnummern mit zu der Abstrichserie zugehörigen Befunden"
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains ErregerFallNummer 1..1
* identifier[ErregerFallNummer] ^short = "Erregerfallnummer"
* identifier[ErregerFallNummer] ^definition = "Eindeutige ErregerFall-Nummer innerhalb des Patienten"
* identifier[ErregerFallNummer].type 1.. MS
* identifier[ErregerFallNummer].type = $v2-0203#LACSN
* identifier[ErregerFallNummer].type.coding MS
* identifier[ErregerFallNummer].system 1.. MS
* identifier[ErregerFallNummer].value 1.. MS
* identifier[ErregerFallNummer].assigner MS
* basedOn MS
* basedOn ^short = "Verweis auf Auftragsnummer"
* basedOn ^definition = "Enthält die Referenzen auf die Aufträge in Form von ServiceRequests"
* code MS
* code = $loinc#96161-5 "Infectious disease Evaluation note"
* subject 1.. MS
* subject.identifier MS
* subject.identifier ^short = "primäre Patientennummer im lokalen KIS"
* subject only Reference(Patient)
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
* conclusionCode MS
* conclusionCode ^short = "Erregerstatus"
* conclusionCode from VS_ErregerStatus (required)

Profile: Profil_MREKlasse
Parent: $ObservationLab
Id: sd-mre-klasse
Title: "Profil - MRE Klasse"
* category.coding 3..
* category.coding contains loinc-microbiology-studies 1..1
* category.coding[loinc-microbiology-studies] = $loinc#18725-2
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains loinc 1..1 MS
* code.coding[loinc] = $loinc#99780-9
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #open
* value[x] only CodeableConcept
* value[x] from VS_Mikrobiologischer_Befund_MRE_Klasse (required)
* specimen only Reference($SpecimenBio)

Profile: Profil_ErregerNachweis
Parent: $ObservationLab
Id: sd-erregernachweis
Title: "Profil - Erreger Nachweis"
* category.coding 3..
* category.coding contains loinc-microbiology-studies 1..1
* category.coding[loinc-microbiology-studies] = $loinc#18725-2
* code MS
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains loinc-microorganism 1..1 MS
* code.coding[loinc-microorganism] = $loinc#11475-1
* value[x] ^slicing.discriminator.type = #type
* value[x] ^slicing.discriminator.path = "$this"
* value[x] ^slicing.rules = #open
* value[x] only CodeableConcept
* value[x] from VS_Erregernachweis_Qualifier (required)
* specimen 1..
* specimen only Reference($SpecimenBio)
// * hasMember only Reference($Keimzahl or $Virulenzfaktor or $Resistenzmechanismus or $AntibiogrammPanel)
* hasMember MS
* component MS
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component contains
    NachweisBakterien 0..1 MS and
    NachweisPilze 0..1 MS and
    NachweisVirus 0..1 MS and
    Erstnachweisdatum 0..1 MS and
    Nachweisort 0..1 MS
* component[NachweisBakterien]
  * code 1.. MS
  * code = $loinc#6463-4
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * valueCodeableConcept from VS_Erreger_Bakterien (required)
* component[NachweisPilze]
  * code 1.. MS
  * code = $loinc#42805-2
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * valueCodeableConcept from VS_Erreger_Pilze (required)
* component[NachweisVirus]
  * code 1.. MS
  * code = $loinc#6584-7
  * value[x] 1.. MS
  * value[x] only CodeableConcept
  * valueCodeableConcept from VS_Erreger_Viren (required)
* component[Erstnachweisdatum]
  * code 1.. MS
  * code = $loinc#99350-1
  * value[x] 1.. MS
  * value[x] only dateTime
* component[Nachweisort]
  * code 1.. MS 
  * code = $loinc#81267-7 "Setting of exposure to illness"
  * value[x] 1.. MS
  * value[x] only string

// TODO: Examples

Instance: example-erregernachweis-mrsa
InstanceOf: sd-erregernachweis
Usage: #example
Title: "Beispiel Erregernachweis MRSA"
Description: "Beispiel für Erregernachweis von MRSA"
* status = #final
* identifier[analyseBefundCode].type.coding[observationInstanceV2] = $v2-0203#OBI
* identifier[analyseBefundCode].system = "https://charite.de/fhir/sid/lab-tests"
* identifier[analyseBefundCode].value = "59826-8_1234567890"
* identifier[analyseBefundCode].assigner = Reference(example-organization-charite)
* category.coding[loinc-microbiology-studies] = $loinc#18725-2
* code.coding[loinc-microorganism] = $loinc#11475-1
* subject = Reference(example-patient)
* effectiveDateTime = "2022-05-31"
* specimen = Reference(example-specimen)
* valueCodeableConcept = $SCT#260373001 "Detected (qualifier value)"
* component[NachweisBakterien].code = $loinc#6463-4 "Bacteria identified in Specimen by Culture"
* component[NachweisBakterien].valueCodeableConcept = $SCT#115329001 "Methicillin resistant Staphylococcus aureus (organism)"
* component[Erstnachweisdatum].code = $loinc#99350-1 "Date of first infection onset"
* component[Erstnachweisdatum].valueDateTime = "2022-05-31"
* component[Nachweisort].code = $loinc#81267-7 "Setting of exposure to illness"
* component[Nachweisort].valueString = "CBF Station 12"

Instance: example-mre-klasse-mrsa
InstanceOf: sd-mre-klasse
Usage: #example
Title: "Beispiel - MRE Klasse MRSA"
Description: "Beispiel für MRE Klasse MRSA"
* status = #final
* identifier[analyseBefundCode].type.coding[observationInstanceV2] = http://terminology.hl7.org/CodeSystem/v2-0203#OBI
* identifier[analyseBefundCode].system = "https://laborberlin.com/fhir/sid/test-lab-results"
* identifier[analyseBefundCode].value = "59826-8_1234567890"
* identifier[analyseBefundCode].assigner = Reference(example-organization-labor)
//* identifier[analyseBefundCode].assigner.identifier.system = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
//* identifier[analyseBefundCode].assigner.identifier.value = "DIZ-ID"
* category.coding[loinc-microbiology-studies] = $loinc#18725-2 "Microbiology studies (set)"
* code = $loinc#99780-9 "Multidrug resistant gram-negative organism classification [Type]"
* subject = Reference(example-patient)
* effectiveDateTime = "2022-05-31"
* valueCodeableConcept = $SCT#115329001 "Methicillin resistant Staphylococcus aureus (organism)"

Instance: example-erregerfall-mrsa
InstanceOf: sd-erregerfall
Usage: #example
Title: "Beispiel Erregerfall MRSA"
Description: "Beispiel eines Erregerfalls MRSA"
* extension[summaryOf].valueReference = Reference(DiagnosticReport/example)
* identifier[ErregerFallNummer].type = $v2-0203#LACSN
* identifier[ErregerFallNummer].system = "https://charite.de/fhir/sid/erregerfaelle"
* identifier[ErregerFallNummer].value = "0123456789"
* basedOn = Reference(ServiceRequest/example)
* status = #final
* code = $loinc#96161-5 "Infectious disease Evaluation note"
* subject = Reference(example-patient)
//* result[erreger-nachweis] = Reference(example-erregernachweis-mrsa)
//* result[mre-klasse] = Reference(example-mre-klasse-mrsa)
* result[+] = Reference(example-erregernachweis-mrsa)
* result[+] = Reference(example-mre-klasse-mrsa)
* conclusionCode = $SCT#10828004 "Positive (qualifier value)"

Instance: example-erregerfall-mrsa-contained
InstanceOf: sd-erregerfall
Usage: #example
Title: "Beispiel Erregerfall MRSA"
Description: "Beispiel eines Erregerfalls MRSA"
* meta.tag = https://charite.de/fhir/tags#erregerfall
* contained[0] = example-erregernachweis-mrsa
* contained[1] = example-mre-klasse-mrsa
//* extension[summaryOf].valueReference = Reference(DiagnosticReport/example)
* identifier[ErregerFallNummer].type = $v2-0203#LACSN
* identifier[ErregerFallNummer].system = "https://charite.de/fhir/sid/erregerfaelle"
* identifier[ErregerFallNummer].value = "0123456789"
//* basedOn = Reference(ServiceRequest/example)
* status = #final
* code = $loinc#96161-5 "Infectious disease Evaluation note"
* subject = Reference(example-patient)
//* result[erreger-nachweis] = Reference(example-erregernachweis-mrsa)
//* result[mre-klasse] = Reference(example-mre-klasse-mrsa)
* result[+] = Reference(example-erregernachweis-mrsa)
* result[+] = Reference(example-mre-klasse-mrsa)
* conclusionCode = $SCT#10828004 "Positive (qualifier value)"

Instance: example-patient
InstanceOf: Patient
Usage: #example
* identifier[0].use = #usual
* identifier[=].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[=].system = "https://charite.de/fhir/sid/patienten"
* identifier[=].value = "146314909"
* identifier[=].assigner = Reference(example-organization-charite)
* identifier[+].use = #official
* identifier[=].type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
* identifier[=].system = "http://fhir.de/sid/gkv/kvid-10"
* identifier[=].value = "Z900211002"
* identifier[=].assigner.identifier.use = #official
* identifier[=].assigner.identifier.value = "104943020"
* identifier[=].assigner.identifier.system = "http://fhir.de/sid/arge-ik/iknr"
* name[0].use = #official
* name[=].family = "Hirsch"
* name[=].given[0] = "Rahel"
* gender = #female
* birthDate = "1870-09-15"
* deceasedBoolean = true
* address.type = #both
* address.line = "Charitépl. 1"
* address.city = "Berlin"
* address.state = "DE-BE"
* address.postalCode = "10117"
* address.country = "DE"

Instance: example-organization-charite
InstanceOf: Organization
Usage: #example
* identifier[0].type = http://terminology.hl7.org/CodeSystem/v2-0203#XX
* identifier[=].system = "http://fhir.de/sid/arge-ik/iknr"
* identifier[=].value = "261101015"
* type.coding = http://ihe-d.de/CodeSystems/PatientBezogenenGesundheitsversorgung#KHS
* name = "Charité-Universitätsmedizin Berlin, Campus Charité Mitte"
* telecom.system = #phone
* telecom.value = "03045050"
* address.type = #both
* address.line = "Charitéplatz 1"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "1"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Charitéplatz"
* address.city = "Berlin"
* address.postalCode = "10117"

Instance: example-organization-labor
InstanceOf: Organization
Usage: #example
* name = "Labor Berlin - Charité Vivantes GmbH"
* telecom.system = #phone
* telecom.value = "+49 (30) 405 026-800"
* address.type = #both
* address.line = "Sylter Straße 2"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "2"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "Sylter Straße"
* address.city = "Berlin"
* address.postalCode = "13353"

Instance: example-specimen
InstanceOf: Specimen
Usage: #example
* type = $SCT#258500001 "Nasopharyngeal swab (specimen)"
* collection.collectedDateTime = "2022-05-30T12:44:00+01:00"
* collection.bodySite = $SCT#71836000 "Nasopharyngeal structure (body structure)"
* identifier.system = "https://biobank.charite.de/fhir/sid/proben"
* identifier.value = "5432"
* status = #available
* subject = Reference(example-patient)

Instance: example-erregerfall-mrsa-bundle
InstanceOf: Bundle
Usage: #example
Title: "Example Erregerfall MRSA Bundle"
Description: "Beispiel eines Erregerfalls MRSA als Transaction Bundle"
* type = #transaction
* timestamp = "2023-03-10T12:09:00+01:00"
* insert Bundle(example-patient, Patient)
* insert Bundle(example-erregerfall-mrsa-contained, DiagnosticReport)
* insert Bundle(example-erregernachweis-mrsa, Observation)
* insert Bundle(example-mre-klasse-mrsa, Observation)
* insert Bundle(example-organization-charite, Organization)
* insert Bundle(example-organization-labor, Organization)
* insert Bundle(example-specimen, Specimen)