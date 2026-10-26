# docs--kind-impairment-eval: translations (nl)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-2e6b437f3e99 = Bron: <c1/>

seg-134407946837 = <c1/> (scenariosoort)

seg-304496607bd7 = Scenariosoort van de engine v{ $version }, familie <a1>Jamming, spoofing en het spectrum</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-98e740d32860 = Testomgeving voor de evaluatie van detectie van RF-verstoringen met machine learning ({ "13494" }): genereer een gelabeld, op parameters gegrond SYNTHETISCH corpus (nominal/jamming/spoof-time/spoof-position/multipath), scoor een detector (energy|agc|sqm|parity|fused) met het detectoronafhankelijke harnas, en rapporteer AUC/ROC/confusion + Pd per klasse bij een doel-Pfa, plus de optimismekloof tussen in- en uit-de-verdeling. Alleen MODELLED werkkarakteristieken: nooit veld-/IQ-data, geen goed/slecht-oordeel.

seg-41c3f9559282 = Eén run van <c1/> vat samen als: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Het voorbeeld <c1/> stelt onder meer in:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out gebruikt een subtielere out-of-tuning-reg

seg-667d26b3a2fe = Resultaatlabel (van de engine): MODELLED — synthetisch, op parameters gegrond corpus (nooit veld-/IQ-data); alleen werkkarakteristieken, geen goed/slecht-oordeel

seg-7e7b07bc5545 = De grafiek die de engine schrijft voor scenarios/impairment-eval.toml, soort impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, gelijke waarden ½), confusiematrix bij drempel, P_d/P_md/P_fa/precisie/nauwkeurigheid/F1 Tests: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC-AUC + bootstrap-BI dat echte gelabelde anomalieën scheidt; transparante detector (reproduceert de labels) Tests: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Gelabeld synthetisch verstoringscorpus + detectoronafhankelijk ROC/AUC/confusion/Pfa-Pmd-harnas; lekbescherming, gestratificeerde splitsing, rapport over optimisme bij verdelingsverschuiving (in- tegenover uit-regime).

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, gelijke waarden ½), confusiematrix bij drempel, P_d/P_md/P_fa/precisie/nauwkeurigheid/F1. Onafhankelijke referentie (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — onafhankelijke bibliotheek, exacte overeenkomst

seg-c719d4060e1a = <b>MODELLED</b> Gelabeld synthetisch verstoringscorpus + detectoronafhankelijk ROC/AUC/confusion/Pfa-Pmd-harnas; lekbescherming, gestratificeerde splitsing, verdelingsverschuiving (in- tegenover uit-het-regi. Onafhankelijke referentie (InternalConsistency): Gesloten-vormgrenzen voor AUC (Mann–Whitney) + een detector met perfecte referentie; het corpus is SYNTHETISCH (op parameters gegrond, geen veld-/IQ-data)

seg-5565108cc4d1 = MODELLED — synthetisch, op parameters gegrond corpus (nooit veld-/IQ-data); alleen werkkarakteristieken, geen goed/slecht-oordeel (resultaat <c1/>)

seg-d2a9f35ea8cc = MODELLED alleen werkkarakteristieken: nooit veld-/IQ-data, geen goed/slecht-oordeel. (soortencatalogus (<c1/>))

seg-376f86fbdcb7 = EERLIJKE REIKWIJDTE: alleen MODELLED werkkarakteristieken. Het corpus is synthetisch en op parameters gegrond (samengesteld uit de jamming-/AGC-/SQM-/pariteitsmodellen van Kshana): nooit veldopnamen of ruwe IQ. Het harnas is een scheidsrechter; het rapporteert karakteristieken en geeft geen goed/slecht-oordeel. Uitvoeren: kshana scenarios/impairment-eval.toml (opmerking in het scenariobestand, regels { "9" } tot { "12" })

seg-882d67b9474f = Evaluatie van detectie van RF-verstoringen met machine learning ({ "13494" }) is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Familiepagina: <a1>Jamming, spoofing en het spectrum</a1>

seg-6cf4bb2d7f7a = Onderwerppagina: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Vorige</s1>hybrid

seg-1e68310f2dc6 = <s1>Volgende</s1>inertial
