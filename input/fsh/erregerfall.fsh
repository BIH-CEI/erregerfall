// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: ErregerFall
Parent: DiagnosticReport
Id: ErregerFall
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

Profile: Profile_MREKlasse
Parent: $ObservationLab
Id: Profile-MREKlasse
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
* valueQuantity ..0
* valueQuantity ^sliceName = "valueQuantity"
* valueCodeableConcept from VS_Mikrobiologischer_Befund_MRE_Klasse_LOINC_SNOMED_CT (required)
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
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
Id: profile-erregerNachweis
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
* value[x] only CodeableConcept or Quantity
* valueQuantity ..0
* valueQuantity ^sliceName = "valueQuantity"
* valueCodeableConcept 1..
* valueCodeableConcept from VS_Detection_Qualifier_SNOMED_CT (required)
* valueCodeableConcept ^sliceName = "valueCodeableConcept"
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


ValueSet: VS_Detection_Qualifier_SNOMED_CT
Id: vs-detection-qualifier-snomed-ct
Title: "VS Detection Qualifier [SNOMED CT]"
Description: "A set of codes representing the result of a test as detected, not detected, or inconclusive."
* SNOMED_CT#260373001 "Detected (qualifier value)"
* SNOMED_CT#260415000 "Not detected (qualifier value)"
* SNOMED_CT#419984006 "Inconclusive (qualifier value)"

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