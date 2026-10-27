# docs--kind-acm-link: translations (nl)

seg-a686bcdc6cc9 = Bron: <c1/>

seg-a53e57719a74 = <c1/> (scenariotype)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-cb9447893c7f = Eén satelliet boven één station: de schuine afstand, elevatie en Es/N0 van elke passage langs de passage, de DVB-S2-MODCOD die bij elke stap is gekozen (drempels van ETSI EN { "302" } 307-1 Table { "13" } plus een implementatiemarge) en het datavolume dat ACM verplaatst tegen de basislijn met constante codering die bij het masker sluit. MODELLED.

seg-1ab30ff9616a = Eén run van <c1/> vat samen als: acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

seg-54e2159e532d = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c7d1b4b1f247 = Het voorbeeld <c1/> stelt onder meer in:

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-b77b8420b4f5 = Mbit

seg-37d29d8303fe = km

seg-eeaa777e4301 = 8PSK 3/4

seg-d62795b9fdc0 = Resultaatlabel (dat van de engine): MODELLED — adaptieve codering en modulatie van DVB-S2 over de passages van één satelliet bij één station: Es/N0 bij heldere hemel langs elke zichtbare passage, de efficiëntste MODCOD die zijn drempel van ETSI EN { "302" } 307-1 Table { "13" } plus een marge haalt, tegen de MODCOD met constante codering die bij het masker sluit; geen regenv

seg-046f69293874 = De grafiek die de engine schrijft voor scenarios/acm-link.toml, type acm-link

seg-0f4c2ab525ac = <b>MODELLED</b> Downlink-Es/N0 langs elke passage van één satelliet boven één station (EIRP, vrijeruimteverlies, atmosferisch verlies volgens de cosecanswet, overige verliezen, G/T, de constante van Boltzmann, symbolsnelheid), de efficiëntste DVB-S2-MODCOD die zijn ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Zichtbaarheidspassages (AOS, TCA, LOS, maximale schijnbare elevatie, duur) van een SGP4-elementenset boven een WGS-84-station op het getoetste aardbaanpad (IAU { "2006" }. Onafhankelijke referentie (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) met Hipparchus { "4.0.3" }: TLEPropagator op dezelfde elementensets in een TEME die Orekit opbouwt volgens de vermelde definitie (zijn IERS { "2010" } TOD, geroteerd met GAST - GMST), ElevationDetector en ElevationExtremumDetector met en zonder ITURP834AtmosphericRefraction, en AngularAzEl met AngularRadioRefractionModifier voor het lichttijdgeval, waarbij doorgangen en maximum door Hipparchus worden opgelost; { "60" } gevallen (f

seg-35588ca8e9bb = <b>MODELLED</b> Downlink-Es/N0 langs elke passage van één satelliet boven één station (EIRP, vrije-ruimteverlies, atmosferisch verlies volgens de cosecanswet, overige verliezen, G/T, de constante van Boltzmann,. Onafhankelijke referentie (InternalConsistency): Interne consistentie: de spectrale efficiëntie, in gesloten vorm berekend uit Table 5a K_bch en de framelengtes, komt overeen met de efficiënties die Table { "13" } afdrukt (een transcriptiecontrole op de drempeltabel); de onderdelen van het linkbudget komen overeen met hun gesloten vormen; de selectie is monotoon in Es/N0 en houdt rekening met de marge; ACM verplaatst minstens het volume van de constante codering. De passagegeometrie komt uit het afzonderlijke VALIDATED a

seg-02e9f2e87410 = MODELLED — DVB-S2 adaptieve codering en modulatie over de passages van één satelliet bij één station: Es/N0 bij onbewolkte hemel langs elke schijnbare passage, de meest efficiënte MODCOD die de drempel van ETSI EN { "302" } 307-1 Table { "13" } plus een marge haalt, tegenover de MODCOD met constante codering die bij het masker sluit; geen regenfading of puntverlies langs de passage (resultaat <c1/>)

seg-cd04f5662884 = MODELLED. (kindcatalogus (<c1/>))

seg-a2cdc7dff1e3 = Elk getal hieronder is ILLUSTRATIVE: geen baan, station of linkbudget van een operator. MODELLED. (opmerking in het scenariobestand, regel { "8" })

seg-7f8667e8d8fe = DVB-S2 adaptieve codering en modulatie langs een LEO-downlinkpassage is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-72fd0321e4af = Onderwerppagina: <a1>CONTACT-SCHEDULING.md</a1>

seg-1f67ae89028b = <s1>Volgende</s1>aocs
