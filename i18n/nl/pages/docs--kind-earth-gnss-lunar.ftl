# docs--kind-earth-gnss-lunar: translations (nl)

seg-37d29d8303fe = km

seg-b054c73f22e5 = geen waarde

seg-59afd80736c5 = <b>PARTNER</b> Niet geleverd — Kshana modelleert signaalprestaties, geen payload- of antennehardware. Onafhankelijke referentie (NoneKind): geen: een discipline die van de partner is, met opzet zonder module en zonder test

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-9a399fed06c4 = Bron: <c1/>

seg-886b3796afaa = <c1/> (scenariokind)

seg-c8a8be4b8894 = Ontvangst van Aarde-GNSS op maanafstand, de zwaksignaallaag die het conflict-resilience-paper noemt en waarvoor de engine geen model had. Een GNSS-satelliet richt zijn antenne op de Aarde; een ontvanger bij de Maan zit ongeveer vijftien keer de baanstraal verderop, dus drie dingen spelen tegelijk. De Aarde BEDEKT DE BORESIGHT: vanaf { "26,560" } km beslaat ze een halve hoek van { "13.9" } deg, dus elke straal naar de Maan moet de zender minstens zover van nadir verlaten, wat de piek van de bundel wegneemt voordat er enig vermogen wordt berekend. Wat overblijft is de RAND VAN DE HOOFDLOB EN DE ZIJLOBBEN, het regime waarin de LuGRE-payload in { "2025" } daadwerkelijk werkte. En het vrije-ruimteverlies is ongeveer { "208" } dB bij L1, grofweg { "25" } dB meer dan een aardse gebruiker betaalt. Het rapport geeft één rij per satelliet (hoek buiten de boresight, aardbedekking, afstand, padverlies, zendversterking bij die hoek, ontvangen vermogen, draaggolf-ruisdichtheid) en aggregeert alleen de links die de volgdrempel halen. HET RAPPORTEERT OOK DE CONDITIONERING, omdat die deze laag definieert: elke zichtbare satelliet ligt binnen een kegel van een paar graden breed gezien vanaf de Maan, dus de zichtlijnen zijn bijna evenwijdig, de verdunning van precisie is enorm, en een Aarde-GNSS-positiebepaling op maanafstand is veel meer een waarneming van TIJDSYNCHRONISATIE-kwaliteit dan van positiekwaliteit. MODELLED, en het zendpatroon is de reden: de versterking bij een hoek is een uniform cirkelvormige apertuur (Airy), terwijl een echte GPS-L1-antenne een helixarray van twaalf elementen is met een gevormde hoofdlob en niet-Airy-zijlobben. Gemeten patronen bestaan en zijn hier niet gevendord, dus rangordes en ordes van grootte zijn zinvol terwijl de dB van één enkele satelliet dat niet is. Bewust AFWEZIG, elk met als gevolg een optimistisch budget: geen ionosferisch of troposferisch verlies op de langs de rand scherende stralen, geen polarisatie-, richt- of implementatieverlies, en een bolvormige Aarde zonder refractieve uitbreiding. De positie van de Maan is een INVOER (afstand plus inertiële richting) in plaats van een efemeridenopzoeking, omdat de onderzochte grootheid de link en de bundelgeometrie is. Om deze rij naar extern getoetst te verhogen zijn een gemeten zendpatroon en LuGRE-normaalpunten nodig; geen van beide staat in de repository en geen van beide wordt hier verzonnen.

seg-75b6814c0091 = Eén run van <c1/> vat samen als: Aarde-GNSS op maanafstand — { "24" } satellieten, ontvanger op { "384400" } km Aarderand vanaf de constellatie: { "13.90" } deg buiten nadir — elke straal naar de Maan moet dit overschrijden { "22" } van { "24" } niet bedekt; { "0" } halen de volgdrempel van { "25.0" } dB-Hz geen enkele link haalt de drempel minder dan twee volgbare links; geen hoekspreiding te rapporteren minder dan vier volgbare links, of een singuliere geometrie: geen DOP SWEEP over { "64" } tijdstippen / { "43082" } s: signaalbeschikbaarheid { "0.375" }, POSITIEBEPALINGSbeschikbaarheid { "0.000" } volgbare links gemiddeld { "0.75" }, max { "2" }; beste C/N0 { "30.93" } dB-Hz; beste PDOP geen Neem de beschikbaarheid van de positiebepaling als prior van deze laag, niet de signaalbeschikbaarheid: één link is een klokwaarneming, vier zijn een positie. MODELLED: de zendversterking is een stand-in met uniforme apertuur (Airy), geen gemeten GPS-bundel, en er wordt geen atmosferisch, polarisatie- of implementatieverlies toegepast — dus het budget hier is optimistisch. Ordes van grootte en rangordes zijn zinvol; de dB van een individuele satelliet is dat niet.

seg-6c0897da2efa = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Het voorbeeld <c1/> stelt onder meer in:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = De grafiek die de engine schrijft voor scenarios/earth-gnss-lunar.toml, kind earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Ontvangst van Aarde-GNSS op maanafstand: de zwaksignaallaag die P7 Table { "1" } noemt en waarvoor de engine geen model had.

seg-9531f6b14fc8 = <b>MODELLED</b> Ontvangst van Aarde-GNSS op maanafstand: de zwaksignaallaag die P7 Table { "1" } noemt en waarvoor de engine geen model had. Per satelliet en per tijdstip berekent het de off-. Onafhankelijke referentie (InternalConsistency): Gesloten-vorm-identiteiten en interne consistentie; GEEN externe referentie wordt beweerd. De halve randhoek wordt gecontroleerd tegen asin(R_earth/r_orbit) en de geometrie daartegen; het vrije-ruimteverlies, de DOP-kernel en de SGP4-propagatie die dit samenstelt zijn elk extern getoetst in hun eigen rijen en deze rij leent hun status niet. WAAROM MODELLED, en het is het zendpatroon: de versterking bij een hoek is een uniform verlichte

seg-6dfc5503f58f = MODELLED, en het zendpatroon is de reden: de versterking bij een hoek is een uniform cirkelvormige apertuur (Airy), terwijl een echte GPS-L1-antenne een helixarray van twaalf elementen is met een gevormde hoofdlob en niet-Airy-zijlobben. (kindcatalogus (<c1/>))

seg-c40d3fd8c12e = WAT MODELLED IS, EN WAAROM HET NIET VALIDATED IS De zendversterking bij een hoek is een uniform verlichte cirkelvormige apertuur — een Airy-patroon. Een echte GPS-L1-antenne is een helixarray van twaalf elementen waarvan het gemeten patroon een gevormde hoofdlob heeft, bewust buiten de boresight gepiekt om het vermogen over de Aardschijf gelijk te trekken, en zijlobben die helemaal niet Airy zijn. Gemeten patronen zijn gepubliceerd; ze zijn niet in deze re (opmerking in het scenariobestand, regels { "29" } tot { "35" })

seg-01fa469abd95 = Aarde-GNSS op maanafstand is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Vorige</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Volgende</s1>entry-heating

seg-a349aa76b0ed = PARTNER
