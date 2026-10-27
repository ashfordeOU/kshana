# docs--kind-constellation-design: translations (nl)

seg-e27476e37522 = Aarde

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Scenariokind van de engine v{ $version }, familie <a1>Constellaties, dekking en geometrie</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-a4f1e7d2041e = Familiepagina: <a1>Constellaties, dekking en geometrie</a1>

seg-670191cf797f = Onderwerppagina: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Bron: <c1/>

seg-f708c26a5139 = <c1/> (scenariokind)

seg-de173c9f4034 = Constellatieontwerp op schaal: Walker-DELTA- en Walker-STAR-patronen in de i: T/P/F-conventie (knopen verdeeld over { "360" } of { "180" } deg, onderlinge afstand in het baanvlak { "360" }<em>P/T, faseverschuiving tussen vlakken { "360" }</em>F/T), expliciete elementenlijsten en ontwerpen met meerdere schillen, meerdere constellaties in één run, rond de Aarde, de Maan, Mars of een andere planeet, Pluto of een grote maan met de constanten in de module body (dezelfde die de kinds solar-system en body-pnt gebruiken). VOORINSTELLINGEN uit gepubliceerde nominale elementen: gps-baseline en gps-expandable (de { "24" } slots en de zes voor/achter uitbreidbare paren van de GPS Standard Positioning Service Performance Standard, 5th edition { "2020" }, Tables 3.2-1 to 3.2-3), galileo (Walker 24/3/1 op { "29 599.801" } km en { "56" } deg, Galileo Open Service Service Definition Document issue { "1.1" } Tables { "1" } and { "23" }), beidou en beidou-meo (Walker 24/3/1 op { "21 528" } km en { "55" } deg plus drie geostationaire satellieten op { "80" }, { "110.5" } en { "140" } deg E en drie hellende geosynchrone satellieten op { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } section { "4.1" }; de MEO-fase en de doorgang van de hellende geosynchrone baan op { "118" } deg E zijn gemodelleerd omdat de standaard ze niet vermeldt) en glonass (24/3/1 op { "19 100" } km en { "64.8" } deg uit de slotformule van de GLONASS Interface Control Document edition { "5.1" } section { "5.2" }). DEKKING EN VERDUNNING VAN PRECISIE: over een breedte-/lengteraster en een bemonsterd venster met een elevatiemasker, het aantal satellieten in zicht, GDOP, PDOP, HDOP en VDOP per cel, de beschikbaarheid (een positiebepaling met PDOP op of onder een drempel, standaard { "6" }) per cel, globaal (oppervlaktegewogen) en op de slechtste locatie, met één ontvangerklok per constellatie tenzij clock = "common". Het schaalt naar duizenden satellieten: zichtbaarheid is een inwendig product met de dekkingshalfhoek van elke satelliet, en satellieten worden per tijdstip in banden ingedeeld op breedte van het subsatellietpunt zodat een rasterrij alleen die test die in zicht kunnen zijn; het rapport telt de bespaarde paartests. De JSON bevat de rasterkaarten en gedownsamplede grondsporen per satelliet. VALIDATED: de Walker-generator tegen Galileo OS SDD Table { "23" } en de slotformule van de GLONASS ICD, de GPS-voorinstelling tegen de gepubliceerde kolom met equatordoorgangen van SPS PS Table 3.2-1, en de globale HDOP-verdeling van de GPS-basislijn tegen SPS PS Appendix B (mediaan { "0.94" }, { "95" }% { "1.25" }, gemiddelde { "0.96" }, tolerantie { "0.03" }). MODELLED: tweelichamenbanen met optionele seculaire J2, een bolvormig lichaam, alleen geometrische zichtbaarheid (geen signaalvermogen, gezondheid of terrein), en de relatieve fase tussen verschillende systemen, die geen momentopname van een echte datum is.

seg-21fbd84bfba1 = Eén run van <c1/> vat samen als: constellation-design: { "5000" } satellieten (LEO-PNT) rond de Aarde; beschikbaarheid { "99.22" }% (PDOP <= { "3" } bij { "20" } deg masker), slechtste locatie { "0.00" }%, mediane PDOP { "1.11" }, gemiddeld { "39.4" } in zicht; { "648" } rasterpunten x { "12" } tijdstippen (MODELLED)

seg-af572ce1fd89 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Het voorbeeld <c1/> stelt onder meer in:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Resultaatlabel (van de engine): MODELLED - tweelichamen-Keplerbanen (optionele seculaire J2) rond een bolvormig lichaam, geometrische zichtbaarheid boven een elevatiemasker, all-in-view-verdunning van precisie met één ontvangerklok per constellatie tenzij clock = "common"; geen signaalvermogen, gezondheid of terrein. De Walker-geometrie en de gepubliceerde

seg-899e728ad9bd = De grafiek die de engine schrijft voor scenarios/leo-pnt-mega-shell.toml, kind constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-602493ac6987 = <b>VALIDATED</b> De generatoren van het kind <c1/>: Walker-delta- en -starpatronen in de T/P/F-conventie (knoopafstand 360/P of 180/P, onderlinge afstand in het baanvlak { "360" }·P/T, faseverschuiving tussen vlakken { "360" }·F/T), en de GPS-basislijn en uitbreidbare 24-slot, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> De dekkingsengine van het kind <c1/> op de GPS-basislijnvoorinstelling met 24 slots onder de voorwaarden van Appendix B van de GPS Standard Positioning Service Performance Standard (SPS PS) (één siderische dag, { "287" } stappen van vijf minuten, een globaal raster van { "4" } x { "4" } deg met

seg-1272200ad4f2 = <b>MODELLED</b> Het kind <c1/> buiten de twee vastgezette gevallen: expliciete ontwerpen en ontwerpen met meerdere schillen, meerdere constellaties per run met één ontvangerklok per constellatie, de Aarde, de Maan en Mars uit de lichaamsconstanten, de BeiDou-voorinstelling Tests: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> De generatoren van het kind <c1/>: Walker-delta- en -starpatronen in de T/P/F-conventie (knoopafstand 360/P of 180/P, onderlinge afstand in het baanvlak { "360" }·P/T, int. Onafhankelijke referentie (ExternalDataset): Gepubliceerde documenten van instanties: Galileo Open Service Service Definition Document issue { "1.1" } (European GNSS Service Centre) Tables { "1" } and { "23" }, de referentieconstellatie op 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edition { "5.1" } ({ "2008" }) section { "5.2" }, de slotformule voor knooplengte en breedteargument; GPS Standard Positioning Service Performance Standard 5th edition (April { "2020" }) Tables 3.2-1, 3.2-2 and

seg-87c4e19dc780 = <b>VALIDATED</b> De dekkingsengine van het kind <c1/> op de GPS-basislijnvoorinstelling met 24 slots onder de voorwaarden van de GPS Standard Positioning Service Performance Standard (SPS PS) Appendix . Onafhankelijke referentie (ExternalDataset): GPS SPS PS 5th edition (April { "2020" }) Appendix B sections B.3.2.2 and B.3.2.3, de gepubliceerde globaal gemiddelde HDOP-verdeling van de volledig bezette basislijnconstellatie met 24 slots (mediaan { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, gemiddelde { "0.96" }), Table 3.8-1 (PDOP availability) en Table B.3-1 (ensemble PDOP of a degraded constellation, alleen als bovengrens gebruikt), plus een met de hand afgeleide gesloten vorm voor één tijdstip. De VDOP en PD

seg-04289f7252cd = <b>MODELLED</b> Het kind <c1/> buiten de twee vastgezette gevallen: expliciete ontwerpen en ontwerpen met meerdere schillen, meerdere constellaties per run met één ontvangerklok per conste. Onafhankelijke referentie (InternalConsistency): Interne consistentie: de brute-force-elevatiescan, de met de hand berekende reducties en die van orbit::dop, en de gesloten-vorm-Walker- en geosynchrone geometrie. Tweelichamenbanen met een optionele seculaire J2, een bolvormig lichaam met de lokale verticaal langs de straal, alleen geometrische zichtbaarheid (geen signaalvermogen, satellietgezondheid, terrein of derdelichamenverstoring), en de relatieve fase tussen systemen genomen uit verschillende re

seg-00fa65d44cbd = MODELLED - tweelichamen-Keplerbanen (optionele seculaire J2) rond een bolvormig lichaam, geometrische zichtbaarheid boven een elevatiemasker, all-in-view-verdunning van precisie met één ontvangerklok per constellatie tenzij clock = "common"; geen signaalvermogen, gezondheid of terrein. De Walker-geometrie en de gepubliceerde presets worden gecontroleerd tegen de slottabellen van de Galileo OS SDD, de GLONASS ICD en de GPS SPS Performance Standard, a (resultaat <c1/>)

seg-62f0fc16a247 = MODELLED: tweelichamenbanen met optionele seculaire J2, een bolvormig lichaam, alleen geometrische zichtbaarheid (geen signaalvermogen, gezondheid of terrein), en de relatieve fase tussen verschillende systemen, die geen momentopname van een echte datum is. (kindcatalogus (<c1/>))

seg-3ef4276dd40b = Wat de run beantwoordt: satellieten in zicht, PDOP/HDOP/VDOP/GDOP per cel van { "10" } deg, en het aandeel van de tijd met PDOP op of onder { "3" } boven een masker van { "20" } deg over twee uur. De zwakke plek die de kaart toont zijn de poolkappen: geen enkele schil reikt boven ongeveer { "82" } deg breedte, dus een gebruiker bij een pool ziet elke satelliet aan één kant van de hemel en de verticale geometrie verslechtert. MODELLED: een illustratief ontwerp, tweelichamenbanen met J2, een bol (opmerking in het scenariobestand, regels { "17" } tot { "21" })

seg-c333d3fe22cd = Dekkings- en verdunningskaarten van precisie voor willekeurige multiconstellatieontwerpen op schaal, rond elk centraal lichaam, is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-436504a8b26f = <s1>Vorige</s1>conflict-resilience

seg-cba188459c80 = <s1>Volgende</s1>contact-schedule
