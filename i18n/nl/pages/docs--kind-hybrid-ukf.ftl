# docs--kind-hybrid-ukf: translations (nl)

seg-debc2f07db78 = true

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-451a304052c4 = <b>MODELLED</b> Koudeatoom-interferometeraccelerometer uit eerste principes (k_eff·T², QPN). Onafhankelijke referentie (ExternalDataset): Gepubliceerde numerieke vectoren uit primaire CAI-artikelen (Cheinet { "2008" }-overdrachtsfunctie; Peters/Freier-gevoeligheid): k_eff·T² exact gereproduceerd, shotruis-ASD een eenzijdige ondergrens binnen ~{ "2" }× van elk gepubliceerd instrument (echte apparaten hebben technische ruis boven de kwantumondergrens). Een bandbreedte, geen gelijkwaardigheid. { "0.30" } ronde { "2" } (vooraf vastgelegd fcb9ac64), een bevinding (blijft MODELLED): de alleen-QPN-rotatieruis tegenover de gemeten Gauguet et al.

seg-9955b1b1c018 = De prestaties van een kwantuminertiaalsensor zijn MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15-toestanden-error-state-EKF, los gekoppeld (gevalideerd op een echte IMU/GNSS-rit tegen NaveGo); een strak gekoppelde pseudorange/Doppler-UKF en een gekoppelde klok+pos. Onafhankelijke referentie (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, als hulpmiddel uitgevoerd onder GNU Octave, nooit gelinkt): zijn los gekoppelde ins_gnss op zijn eigen echte Ekinox-IMU/GNSS-rit met een landvoertuig, beide oplossingen gescoord tegen het Ekinox-referentietraject. Beide filters lezen dezelfde { "20" } Hz-float32-invoer, en de configuratie van Kshana is mechanisch afgeleid van de gepubliceerde parameters van de dataset. De horizontale en verticale positie-RMS van Kshana en zijn

seg-4b84d9846715 = Bron: <c1/>

seg-d8da1a3f1798 = <c1/> (scenariosoort)

seg-c6edf89eb8d4 = Hybride kwantum+klassieke strak gekoppelde GNSS/INS-UKF met 17 toestanden (MODELLED): { "15" } INS-foutentoestanden + een door CAI afgeleide correctie van de accelerometerbias + een klok met 2 toestanden (fase+frequentie) uit de klokengine met q-parameters, aangedreven door het ingekaderde CAI-foutmodel. De kwaliteitsmaat is de zelfconsistentie van het filter (NEES + innovatiewitheid tegen χ²-grenzen): een uitspraak over zelfconsistentie, GEEN garantie voor nauwkeurigheid in de praktijk. Alleen simulatie; geen TRL>{ "3" }, geen vluchterfgoed, geen externe validatie.

seg-d43a562eb9c2 = Eén run van <c1/> vat samen als: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Het voorbeeld <c1/> stelt onder meer in:

seg-5e9c8b22ed24 = Koudeatoom- (Rb-87 D2) interferometrische accelerometer; ingekaderd

seg-4c8e2caeba5b = Ultrastabiele/optische oscillatorklasse aan boord, white-FM sigm

seg-2968660fa880 = De grafiek die de engine schrijft voor scenarios/hybrid-ukf.toml, soort hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Ingekaderde (beste/nominale/conservatieve) prestaties van een koudeatoom-interferometer: biasinstabiliteit, random walk van snelheid/hoek, stabiliteit van de schaalfactor, interrogatie. Onafhankelijke referentie (InternalConsistency): Interne consistentie: de aangehaalde VRW-bandbreedte gecontroleerd tegen de fysica van CaiAccelerometer::accel_asd + het ruwe dynamisch bereik berekend uit de fringe-ambiguïteitsgrens; de getallen zijn MODELLED bandbreedtes uit een literatuuroverzicht (needs_source_confirmation), geen enkel apparaat is getoetst aan een externe referentie, geen validatiehalo

seg-8632967dc5f8 = MODELLED SIMULATIE. Zelfconsistentie van het filter (NEES + innovatiewitheid) onder ingekaderde CAI- en klokruisinvoer: een uitspraak over zelfconsistentie, GEEN garantie voor nauwkeurigheid in de praktijk. Geen veld-/vluchtresultaten; geen TRL>{ "3" }, geen vluchterfgoed, geen externe validatie. De CAI-hardware is eigendom van de partner. (resultaat <c1/>)

seg-e55c8e2bc619 = Hybride kwantum+klassieke strak gekoppelde GNSS/INS-UKF met 17 toestanden (MODELLED): { "15" } INS-foutentoestanden + een door CAI afgeleide correctie van de accelerometerbias + een klok met 2 toestanden (fase+frequentie) uit de klokengine met q-parameters, aangedreven door het ingekaderde CAI-foutmodel. (soortencatalogus (<c1/>))

seg-b06538ca3a8c = Hybride kwantum + klassieke strak gekoppelde GNSS/INS-UKF met 17 toestanden (MODELLED). (opmerking in het scenariobestand, regel { "1" })

seg-b5fc96916b4e = KWALITEITSMAAT — zelfconsistentie van het filter (NEES + innovatiewitheid), het enige wat een simulatie eerlijk over een schatter kan beweren. Over een Monte-Carlo-ensemble waarvan de referentiewaarheid wordt gegenereerd uit precies de ruis die het filter aanneemt, moeten de gepoolde gemiddelden van NIS (witheid) en NEES binnen hun { "95" }%-chikwadraatbanden vallen. Dit is een uitspraak over ZELFCONSISTENTIE, GEEN garantie voor nauwkeurigheid in de praktijk. (opmerking in het scenariobestand, regels { "21" } tot { "25" })

seg-91afdc2d3ee2 = TRANSPARANTIE: alles hier is MODELLED / SIMULATIE. De CAI- en klokinvoer zijn ingekaderde, representatieve waarden uit de literatuur, geen gemeten hardware; de CAI-hardware en de sleutelpersoon blijven eigendom van de partner. Geen TRL>{ "3" }, geen vluchterfgoed, geen externe validatie. (opmerking in het scenariobestand, regels { "27" } tot { "29" })

seg-9b94bd3ce7df = Monte-Carlo-seeds waarover de consistentiereferentie poolt, en de verstemmingsvermenigvuldigers van het filter. { "24" } seeds geven run-gebaseerde chikwadraat-NEES-banden ({ "8" }*{ "24" } DOF) die strak genoeg zijn om een afgestemd van een verstemd filter te onderscheiden en de run toch goedkoop te houden. Zet q_factor / r_factor weg van { "1.0" } om het filter te verstemmen en te zien dat de consistentiepoort het afwijst (q_factor schaalt de aangenomen procesruis, r_factor de aangenomen meetruis (opmerking in het scenariobestand, regels { "44" } tot { "48" })

seg-496b17a8d3b9 = Onderwerppagina: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Onderwerppagina: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Vorige</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Volgende</s1>hybrid
