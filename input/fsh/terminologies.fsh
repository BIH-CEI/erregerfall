ValueSet: VS_Mikrobiologischer_Befund_MRE_Klasse
Id: vs-mikrobiologischer-befund-mre-klasse
Title: "ValueSet - Mikrobiologischer Befund MRE Klasse [LOINC, SNOMED CT]"
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

ValueSet: VS_ErregerStatus
Id: vs-erreger-status
Title: "ValueSet - ErregerStatus [SNOMED CT]"
Description: "Das ValueSet enthält Codes für den Erregerstatus eines Patienten."
* $SCT#10828004 "Positive (qualifier value)"
* $SCT#260385009 "Negative (qualifier value)"
* $SCT#410513005 "In the past (qualifier value)"
* $SCT#24932003 "Exposure to (contextual qualifier) (qualifier value)"
* $SCT#419099009 "Dead (finding)"

ValueSet: VS_Erregernachweis_Qualifier
Id: vs-erregernachweis-qualifier
Title: "ValueSet - Erregernachweis Qualifier [SNOMED CT]"
Description: "Das ValueSet enthält Codes zur Beschreibung des Testergebnisses eines Erregernachweises."
* $SCT#260373001 "Detected (qualifier value)"
* $SCT#260415000 "Not detected (qualifier value)"
* $SCT#419984006 "Inconclusive (qualifier value)"

ValueSet: VS_Erreger_Pilze
Id: vs-erreger-pilze
Title: "ValueSet - Erreger Pilze [SNOMED CT]"
Description: "Das ValueSet enthält Codes für Pilze aus SNOMED CT."
* include codes from system $SCT where concept descendent-of #414561005

ValueSet: VS_Erreger_Bakterien
Id: vs-erreger-bakterien
Title: "ValueSet - Erreger Bakterien [SNOMED CT]"
Description: "Das ValueSet enthält Codes für Bakterien aus SNOMED CT."
* include codes from system $SCT where concept descendent-of #409822003 

ValueSet: VS_Erreger_Viren
Id: vs-erreger-viren
Title: "ValueSet - Erreger Viren [SNOMED CT]"
Description: "Das ValueSet enthält Codes für Viren aus SNOMED CT."
* include codes from system $SCT where concept descendent-of #49872002 

ValueSet: VS_Abstrichserie_Ergebnis
Id: vs-abstrichserie-ergbenis
Title: "ValueSet - Abstrichserie Ergebnis [SNOMED CT]"
Description: "Das ValueSet enthält Codes für Ergebnisse einer Abstrichserie."
* $SCT#10828004 "Positive (qualifier value)"
* $SCT#260405006 "Trace (qualifier value)"
* $SCT#260385009 "Negative (qualifier value)"
* $SCT#260415000 "Not detected (qualifier value)"

CodeSystem: CS_Nicht_Zaehlbar_Grund
Id: cs-nicht-zaehlbar-grund
Title: "CS Nicht Zaehlbar Grund"
Description: "tbd"
* #keine-relevanz "Keine Relevanz"
* #dekolonisation "Dekolonisation"
* #abstand-zu-kurz "Abstand zu kurz"

ValueSet: VS_Nicht_Zaehlbar_Grund
Id: vs-nicht-zaehlbar-grund
Title: "VS Nicht Zaehlbar Grund"
Description: "tbd"
* include codes from system cs-nicht-zaehlbar-grund
* $SCT#281789004 "Antibiotic therapy (procedure)" // Antibiose
* $SCT#74964007 "other" // Andere

