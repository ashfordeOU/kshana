# docs--kind-body-pnt: translations (nl)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-02b8d1f1b7df = Bron: <c1/>

seg-e28ba749a2a1 = <c1/> (scenariokind)

seg-11e8c29ecb45 = Scenariokind van de engine v{ $version }, familie <a1>Constellaties, dekking en geometrie</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-e7dad1a1ecba = Positiebepaling rond elk lichaam in het zonnestelsel: een orbiter of een lander op het oppervlak rond een centraal lichaam dat bij naam wordt gekozen (Mars, de Maan, Europa, Ganymedes, Titan en de rest van de zonnestelselcatalogus), die navigeert met eenweg-pseudoafstanden van een kleine Walker-navigatieconstellatie rond het lichaam (tweelichamenbanen met de eigen seculaire J2-drift van het lichaam, een onbekende gebruikersklok) en optioneel met een klokvrije deep-space-tweewegafstand vanaf de Aarde, waarvan richting en afstand bij elk tijdstip uit de analytische zonnestelselefemeride komen. Zichtlijnen worden geblokkeerd door de gemiddelde bol van het lichaam, en een gebruiker op het oppervlak heeft ook het elevatiemasker nodig. Per tijdstip: relays in zicht, of de Aarde boven de rand staat, de GDOP en PDOP met alleen de constellatie (geometrische en positionele verdunning van precisie), de formele positieonzekerheid van één sigma met en zonder de Aarderij, en de fout van een geseede Gauss-Newton-kleinstekwadratenpositiebepaling in beide gevallen; over de run: beschikbaarheid, zichtbaarheid van de Aarde, mediane PDOP, RMS-fout en mediane formele sigma, plus de lichttijd Aarde-lichaam, de heen-en-terugreis, de Shapiro-vertraging en de Zonshoek op dat tijdstip. MODELLED: de relaybanen, de ruisniveaus en het instantane meetmodel zijn modelleringskeuzes, niet extern getoetst aan de navigatiedata van een missie; de lichaamsconstanten zijn de gepubliceerde waarden die in body.rs worden aangehaald, en de Aardegeometrie erft de labels van de zonnestelselefemeride.

seg-c90c1a79f88b = Eén run van <c1/> vat samen als: Positiebepaling rond Mars — orbitergebruiker, { "12" } relays op { "10000" } km, { "296" } tijdstippen Lichttijd Aarde { "338.3" } s enkele reis, { "676.6" } s heen en terug; hoek Zon-Aarde-lichaam { "175.4" } deg beschikbaarheid: { "1.000" } alleen constellatie, { "1.000" } met de Aardeafstand (Aarde in zicht { "0.811" }) mediane PDOP { "1.375" } ; RMS-fout { "1.883" } m alleen constellatie, { "1.629" } m met de Aardeafstand mediane formele sigma { "1.375" } m alleen constellatie, { "1.304" } m met de Aardeafstand

seg-31bacf177d9c = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Het voorbeeld <c1/> stelt onder meer in:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Resultaatlabel (van de engine): MODELLED: tweelichamen-relaybanen met seculaire J2-drift, geometrische zichtbaarheid, gaussiaanse afstandsruis en een instantaan meetmodel rond een lichaam uit de gepubliceerde constanten; niet extern getoetst aan de navigatiedata van een missie. De geometrie Aarde-lichaam erft het label van de zonnestelselefemeride

seg-6f341acbe994 = De grafiek die de engine schrijft voor scenarios/mars-orbit-pnt.toml, kind body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> De newtoniaanse eenweg-lichttijd van een willekeurig lichaam naar een ander, ontvangen op een tijdstip, opgelost met de radiometrische vastepunt-lichttijdoplosser (radiometric::light_time_solution, zender op zijn vertraagde positie) via solar_system::link_o Tests: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Het kind <c1/>: een orbiter of een lander op het oppervlak rond een bij naam gekozen lichaam navigeert met eenweg-pseudoafstanden van een Walker-navigatieconstellatie rond het lichaam (tweelichamenbanen met de seculaire J2-drift van het lichaam, een onbekende gebruikersk

seg-5c3f8ac041d3 = <b>MODELLED</b> Het kind <c1/>: een orbiter of een lander op het oppervlak rond een bij naam gekozen lichaam navigeert met eenweg-pseudoafstanden van een Walker-navigatieconstellatie rond het li. Onafhankelijke referentie (InternalConsistency): Gesloten vormen en zelfconsistentie: de derde wet van Kepler voor de relayperiode, de baanstraal en de oppervlaktestraal die over de run constant blijven, een toegevoegde meting die de formele onzekerheid nooit vergroot, en de geseede fouten die met de covariantie overeenkomen. De relaybanen negeren derde lichamen (de aantrekking van Jupiter op relays rond Europa is niet gemodelleerd), de ruis is gaussiaans op vermelde niveaus en het meetmodel is instanta

seg-64920deda9cd = MODELLED: tweelichamen-relaybanen met seculaire J2-drift, geometrische zichtbaarheid, gaussiaanse afstandsruis en een instantaan meetmodel rond een lichaam uit de gepubliceerde constanten; niet extern getoetst aan de navigatiedata van een missie. De geometrie Aarde-lichaam erft de labels van de zonnestelselefemeride. (resultaat <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: de relaybanen, de ruisniveaus en het instantane meetmodel zijn modelleringskeuzes, niet extern getoetst aan de navigatiedata van een missie; de lichaamsconstanten zijn de gepubliceerde waarden die in body.rs worden aangehaald, en de Aardegeometrie erft de labels van de zonnestelselefemeride. (kindcatalogus (<c1/>))

seg-04cd882741e2 = MODELLED. De relaybanen, de afstandsruis van { "1" } m en het instantane meetmodel zijn modelleringskeuzes; niets hier is extern getoetst aan de navigatiedata van een missie. De Mars-constanten zijn de gepubliceerde waarden die in src/body.rs worden aangehaald. (opmerking in het scenariobestand, regels { "20" } tot { "22" })

seg-df6bae4c422e = Positiebepaling rond elk lichaam in het zonnestelsel met een lokale constellatie en een deep-space-link vanaf de Aarde is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Familiepagina: <a1>Constellaties, dekking en geometrie</a1>

seg-670191cf797f = Onderwerppagina: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Onderwerppagina: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Vorige</s1>attitude-budget

seg-96170e5c8e3f = <s1>Volgende</s1>campaign
