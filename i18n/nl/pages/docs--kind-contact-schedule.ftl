# docs--kind-contact-schedule: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Downlink-Es/N0 langs elke passage van één satelliet boven één station (EIRP, vrijeruimteverlies, atmosferisch verlies volgens de cosecanswet, overige verliezen, G/T, de constante van Boltzmann, symbolsnelheid), de efficiëntste DVB-S2-MODCOD die zijn ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Zichtbaarheidspassages (AOS, TCA, LOS, maximale schijnbare elevatie, duur) van een SGP4-elementenset boven een WGS-84-station op het gevalideerde aardbaanpad (IAU { "2006" }. Onafhankelijke referentie (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) met Hipparchus { "4.0.3" }: TLEPropagator op dezelfde elementensets in een TEME die Orekit opbouwt volgens de vermelde definitie (zijn IERS { "2010" } TOD, geroteerd met GAST - GMST), ElevationDetector en ElevationExtremumDetector met en zonder ITURP834AtmosphericRefraction, en AngularAzEl met AngularRadioRefractionModifier voor het lichttijdgeval, waarbij doorgangen en maximum door Hipparchus worden opgelost; { "60" } gevallen (f

seg-35588ca8e9bb = <b>MODELLED</b> Downlink-Es/N0 langs elke passage van één satelliet boven één station (EIRP, vrije-ruimteverlies, atmosferisch verlies volgens de cosecanswet, overige verliezen, G/T, de constante van Boltzmann,. Onafhankelijke referentie (InternalConsistency): Interne consistentie: de spectrale efficiëntie, in gesloten vorm berekend uit Table 5a K_bch en de framelengtes, komt overeen met de efficiënties die Table { "13" } afdrukt (een transcriptiecontrole op de drempeltabel); de onderdelen van het linkbudget komen overeen met hun gesloten vormen; de selectie is monotoon in Es/N0 en houdt rekening met de marge; ACM verplaatst minstens het volume van de constante codering. De passagegeometrie komt uit het afzonderlijke VALIDATED a

seg-cd04f5662884 = MODELLED. (kindcatalogus (<c1/>))

seg-7f8667e8d8fe = DVB-S2 adaptieve codering en modulatie langs een LEO-downlinkpassage is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-72fd0321e4af = Onderwerppagina: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Bron: <c1/>

seg-040d160b3fdd = <c1/> (scenariokind)

seg-be4e928a5865 = Planning van grondcontacten voor meerdere satellieten boven meerdere stations: schijnbare toegangsvensters (SGP4, aardvast frame IAU 2006/2000A, refractie ITU-R P.834, lichttijd), het DVB-S2-ACM-datavolume van elke passage (drempels van ETSI EN { "302" } 307-1 Table { "13" }) en een conflictvrij schema (één satelliet per antenne met een omschakeltijd, één station per satelliet, prioriteitsgewogen aflevering begrensd tot elke achterstand) door een greedy-methode op marginale waarde, een first-come-basislijn en een exacte branch-and-bound op kleine verzamelingen, met de optimaliteitskloof van de greedy-methode. MODELLED.

seg-7a3fad06a9fc = Eén run van <c1/> vat samen als: contact-schedule: { "3" } satellieten x { "3" } stations over { "12" } h -> { "31" } kandidaatcontacten, { "22" } ingepland; { "797266" } van { "860000" } Mbit afgeleverd (MODELLED)

seg-a03d83f5866a = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Het voorbeeld <c1/> stelt onder meer in:

seg-cade59b5a371 = Resultaatlabel (van de engine): MODELLED — contactplan voor meerdere satellieten en meerdere stations: schijnbare toegangsvensters (SGP4, IAU 2006/2000A, refractie ITU-R P.834, lichttijd), DVB-S2-ACM-datavolume per passage uit een linkbudget bij onbewolkte hemel (drempels van ETSI EN { "302" } 307-1 Table { "13" }), en conflictoplossing (één satelliet per antenne met om

seg-e26b549579e2 = De grafiek die de engine schrijft voor scenarios/contact-schedule.toml, kind contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Kandidaatcontacten uit elke satelliet-stationpassage met haar ACM-datavolume; conflicten waarbij één antenne twee satellieten zou bedienen binnen haar omschakeltijd of één satelliet naar twee stations tegelijk zou downlinken; een prioriteitsgewogen aflevering

seg-60431931082a = <b>MODELLED</b> Kandidaatcontacten uit elke satelliet-stationpassage met haar ACM-datavolume; conflicten waarbij één antenne twee satellieten zou bedienen binnen haar omschakeltijd of ée. Onafhankelijke referentie (InternalConsistency): Interne consistentie: de exacte branch-and-bound komt overeen met brute-force-opsomming op kleine willekeurige verzamelingen, elk plan wordt gecontroleerd op haalbaarheid tegen de conflictregels, en de greedy-methode verslaat het exacte optimum nooit. WAT NIET: er is geen externe planner of operationeel plan vergeleken; contacten worden als geheel genomen (geen splitsing), de achterstand ligt vast bij het begin van het venster, slewtijd boven de vaste omschakeltijd en boordopslag

seg-9941b9f6d4a8 = MODELLED — contactplan voor meerdere satellieten en meerdere stations: schijnbare toegangsvensters (SGP4, IAU 2006/2000A, refractie ITU-R P.834, lichttijd), DVB-S2-ACM-datavolume per passage uit een linkbudget bij onbewolkte hemel (drempels van ETSI EN { "302" } 307-1 Table { "13" }), en conflictoplossing (één satelliet per antenne met omschakeltijd, één station per satelliet) door een greedy-methode op marginale waarde, gecontroleerd tegen een exacte branch-and-bound; geen regenfading, (resultaat <c1/>)

seg-f8ef88bc82b5 = Elk getal hieronder is ILLUSTRATIVE: geen banen, stations of linkbudget van een operator. MODELLED: de planner wordt gecontroleerd tegen zijn eigen exacte oplosser, niet tegen een extern hulpmiddel. (opmerking in het scenariobestand, regels { "11" } tot { "12" })

seg-fe2b4799b397 = Grondcontactplanning voor meerdere satellieten en meerdere stations met conflictoplossing is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Vorige</s1>constellation-design

seg-3784be57d6df = <s1>Volgende</s1>earth-gnss-lunar
