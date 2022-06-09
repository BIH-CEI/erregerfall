// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: ErregerFall
Parent: DiagnosticReport
Id: sd-erregerfall
Title: "ErregerFall"
Description: "tbd"
* code MS
* code = $loinc#96161-5 "Infectious disease Evaluation note"
* subject MS
* specimen MS
* specimen only Reference($Specimen)
* result MS
* result ^slicing.discriminator[+].type = #value
* result ^slicing.discriminator[=].path = "resolve()"
* result ^slicing.rules = #open
* result contains erreger-nachweis 0..* MS and mre-klasse 0..* MS
* result[erreger-nachweis] only Reference(Profile_ErregerNachweis)
* result[mre-klasse] only Reference(Profile_MREKlasse)
* conclusionCode MS

Instance: example-erregerfall-1
InstanceOf: sd-erregerfall
Usage: #example
Title: "example-erregerfall-1"
Description: "Beispiel eines Erregerfalls"
* status = #final
* code = $loinc#96161-5 "Infectious disease Evaluation note"
* subject = Reference(Patient/example-patient)

Profile: Profile_MREKlasse
Parent: $ObservationLab
Id: sd-mre-klasse
Title: "Profile - MRE Klasse"
* category.coding 3..
* category.coding contains loinc-microbiology-studies 1..1
* category.coding[loinc-microbiology-studies] = $loinc#18725-2
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains loinc 1..1 MS
* code.coding[loinc] = $loinc#99780-9
* value[x] only CodeableConcept
* value[x] from VS_Mikrobiologischer_Befund_MRE_Klasse_LOINC_SNOMED_CT (required)
* specimen only Reference($Specimen)

ValueSet: VS_Mikrobiologischer_Befund_MRE_Klasse_LOINC_SNOMED_CT
Id: VS-Mikrobiologischer-Befund-MRE-Klasse
Title: "VS Mikrobiologischer Befund MRE Klasse [LOINC, SNOMED CT]"
Description: "Bezeichnungen für Klassen von Multiresistenten Erregern (MRE)."
* SNOMED_CT#115329001 "MRSA"
* SNOMED_CT#113727004 "VRE"
* SNOMED_CT#838511009 "LVRE"
* SNOMED_CT#838510005 "LRE"
* $loinc#LA33214-0 "2MRGN"
* $loinc#LA33215-7 "3MRGN"
* $loinc#LA33216-5 "4MRGN"
// IsolatAttributShortName
// 2MRGN_NEOPAED
// CARB_RES
// ESBL
// PVL
// TOXINBILDEND

Instance: example-mre-klasse
InstanceOf: sd-mre-klasse
Usage: #example
Title: "example-mre-klasse"
Description: "Beispiel MRE Klasse"
* status = #final
* identifier[analyseBefundCode].type.coding[observationInstanceV2] = http://terminology.hl7.org/CodeSystem/v2-0203#OBI
* identifier[analyseBefundCode].system = "https://exmaple.org/fhir/sid/test-lab-results"
* identifier[analyseBefundCode].value = "59826-8_1234567890"
* identifier[analyseBefundCode].assigner = Reference(Organization/example)
//* identifier[analyseBefundCode].assigner.identifier.system = "https://www.medizininformatik-initiative.de/fhir/core/CodeSystem/core-location-identifier"
//* identifier[analyseBefundCode].assigner.identifier.value = "DIZ-ID"
* category = $loinc#18725-2
* code = $loinc#99780-9
* subject = Reference(Patient/example-patient)
* effectiveDateTime = "2022-05-31"
* value[x] = $SCT#115329001


ValueSet: ErregerStatus
Id: ErregerStatus
Title: "ErregerStatus"
Description: "tbd"
* $SCT#10828004 "Positive (qualifier value)"
* $SCT#260385009 "Negative (qualifier value)"
* $SCT#410513005 "In the past (qualifier value)"
* $SCT#24932003 "Exposure to (contextual qualifier) (qualifier value)"
* $SCT#419099009 "Dead (finding)"


Profile: Profile_ErregerNachweis
Parent: $ObservationLab
Id: sd-erregernachweis
Title: "Profile - Erreger Nachweis"
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
* value[x] only CodeableConcept
* value[x] from VS_Detection_Qualifier_SNOMED_CT (required)
* specimen 1..
* specimen only Reference($Specimen)
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
    erstnachweisdatum 0..1 MS
* component[NachweisBakterien].code 1.. MS
* component[NachweisBakterien].code = $loinc#6463-4
* component[NachweisBakterien].value[x] 1.. MS
* component[NachweisBakterien].value[x] only CodeableConcept
* component[NachweisBakterien].valueCodeableConcept 1.. MS
* component[NachweisBakterien].valueCodeableConcept only CodeableConcept
* component[NachweisBakterien].valueCodeableConcept from VS_Erreger_Bakterien (required)
* component[NachweisBakterien].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* component[NachweisPilze].code 1.. MS
* component[NachweisPilze].code = $loinc#42805-2
* component[NachweisPilze].value[x] 1.. MS
* component[NachweisPilze].value[x] only CodeableConcept
* component[NachweisPilze].valueCodeableConcept 1.. MS
* component[NachweisPilze].valueCodeableConcept only CodeableConcept
* component[NachweisPilze].valueCodeableConcept from VS_Erreger_Pilze (required)
* component[NachweisPilze].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* component[NachweisVirus].code 1.. MS
* component[NachweisVirus].code = $loinc#6584-7
* component[NachweisVirus].value[x] 1.. MS
* component[NachweisVirus].value[x] only CodeableConcept
* component[NachweisVirus].valueCodeableConcept 1.. MS
* component[NachweisVirus].valueCodeableConcept only CodeableConcept
* component[NachweisVirus].valueCodeableConcept from VS_Erreger_Viren (required)
* component[NachweisVirus].valueCodeableConcept ^sliceName = "valueCodeableConcept"
* component[erstnachweisdatum].code 1.. MS
* component[erstnachweisdatum].code = $loinc#99350-1
* component[erstnachweisdatum].value[x] 1.. MS
* component[erstnachweisdatum].value[x] only dateTime

Instance: example-erregernachweis
InstanceOf: sd-erregernachweis
Usage: #example
Title: "example-erregernachweis"
Description: "Beispiel für Erregernachweis"
* status = #final
* identifier[analyseBefundCode].type.coding[observationInstanceV2] = http://terminology.hl7.org/CodeSystem/v2-0203#OBI
* identifier[analyseBefundCode].system = "https://exmaple.org/fhir/sid/test-lab-results"
* identifier[analyseBefundCode].value = "59826-8_1234567890"
* identifier[analyseBefundCode].assigner = Reference(Organization/example)
* category.coding[loinc-microbiology-studies] = $loinc#18725-2
* code.coding[loinc-microorganism] = $loinc#11475-1
* subject = Reference(Patient/example-patient)
* effectiveDateTime = "2022-05-31"
* specimen = Reference(Specimen/example)
* value[x] = $SCT#260373001 "Detected (qualifier value)"

ValueSet: VS_Detection_Qualifier_SNOMED_CT
Id: vs-detection-qualifier-snomed-ct
Title: "VS Detection Qualifier [SNOMED CT]"
Description: "A set of codes representing the result of a test as detected, not detected, or inconclusive."
* $SCT#260373001 "Detected (qualifier value)"
* $SCT#260415000 "Not detected (qualifier value)"
* $SCT#419984006 "Inconclusive (qualifier value)"

ValueSet: VS_Erreger_Pilze
Id: vs-erreger-pilze
Title: "VS Erreger Pilze"
Description: "tbd"
* include codes from system $SCT where concept descendent-of #414561005

ValueSet: VS_Erreger_Bakterien
Id: vs-erreger-bakterien
Title: "VS Erreger Bakterien"
Description: "tbd"
* include codes from system $SCT where concept descendent-of #409822003 

ValueSet: VS_Erreger_Viren
Id: vs-erreger-viren
Title: "VS Erreger Viren"
Description: "tbd"
* include codes from system $SCT where concept descendent-of #49872002 

// TODO: Examples