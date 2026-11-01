# docs--kind-lunar-surface: translations (nl)

seg-f942b36a11c4 = Nog niet op GitHub

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken deze soort; de andere staan in <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariosoort van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Bewijs van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-6a26b9ab59fe = Onderwerppagina: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultaatlabel (van de engine): MODELLED

seg-626ab55f0424 = MODELLED (resultaat <c1/>)

seg-e66e2ca31e54 = Onderwerppagina: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Adviserende software, geen gecertificeerde navigat

seg-feea03a2c628 = Bron: <c1/>

seg-6c0eff9f9211 = <c1/> (scenariosoort)

seg-6c7d25f672fb = MODELLED beschikbaarheid van positiebepaling en tijdsynchronisatie op het oppervlak per locatie en seizoen voor locaties bij de zuidpool in Artemis-klasse. Voor elke locatie en elk seizoen (een epoche en een venster daarna) rapporteert het positiebepaling met relais (vier of meer relais van een ILLUSTRATIVE constellatie van LCNS-klasse in zicht en PDOP onder een drempel, uit dezelfde functies als moonlight-service-volume en, met een terreinsectie, de met ray-marching bepaalde horizon van het terrein van lunar-station-coverage), of de aarde en de zon boven de horizon van de locatie staan (analytische zon, maan en maanoriëntatie, libratie inbegrepen, wat met het seizoen verandert), en de beschikbaarheid van tijdsynchronisatie (een relais of de aarde in zicht) met de langste periode van geen van beide, de holdover die een oppervlakteklok moet overbruggen. Een resultaat voor één locatie is bitgelijk aan dat van moonlight-service-volume. MODELLED: illustratieve Kepler-relaisset op een maan met gemiddelde rotatie; het cijfer voor de relais verandert niet met het seizoen; het terrein is de LOLA-uitsnede van { "1200" } m. Niet door een ruimtevaartorganisatie onderschreven; adviserende software, geen gecertificeerde navigatieapparatuur.

seg-3c13aefe4093 = Eén run van <c1/> vat samen als: lunar-surface | { "4" } locaties x { "4" } seizoenen | positiebepaling { "41" }% tot { "41" }% | slechtste beschikbaarheid van tijdsynchronisatie { "100.0" }% | langste gat in tijdsynchronisatie { "0.0" } h (MODELLED)

seg-02bc245c436e = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = Het voorbeeld <c1/> stelt onder meer in:

seg-0ceb87f45323 = zuidpool { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = gaat ongewijzigd door

seg-94b84de6c958 = De grafiek die de engine schrijft voor scenarios/lunar-surface.toml, soort lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> De soort en fase <c1/>: beschikbaarheid van relais en PDOP, zicht op aarde en zon en een gestuurde oppervlakteklok voor elke locatie en elk seizoen, met de terreinhorizon van <c2/>; een run voor één locatie is gelijk aan die van die soort

seg-70f63c99a478 = <b>MODELLED</b> De soort en fase <c1/>: beschikbaarheid van relais en PDOP, zicht op aarde en zon en een gestuurde oppervlakteklok voor elke locatie en elk seizoen, met de terr. Onafhankelijke referentie (ReferenceImpl): Exacte gelijkheid met de bestaande soort voor één locatie, en monotoniciteitscontroles, in de tests. De relaisset is ILLUSTRATIVE en er wordt geen oppervlaktemeting vergeleken

seg-ab29e0e308d0 = MODELLED beschikbaarheid van positiebepaling en tijdsynchronisatie op het oppervlak per locatie en seizoen voor locaties bij de zuidpool in Artemis-klasse. (soortencatalogus (<c1/>))

seg-3f948092eba6 = MODELLED: illustratieve Kepler-relaisset op een maan met gemiddelde rotatie; het cijfer voor de relais verandert niet met het seizoen; het terrein is de LOLA-uitsnede van { "1200" } m. (soortencatalogus (<c1/>))

seg-5b217c0bb606 = EERLIJKHEID: MODELLED. De relaisset is illustratief en Kepler, waarbij de maan voor de relais met de gemiddelde snelheid draait (geen libratie) zoals in moonlight-service-volume; de aarde en de zon gebruiken de analytische oriëntatie, dus de twee stelsels verschillen door die weglating. Het cijfer voor positiebepaling met relais verandert in dit model niet met het seizoen; de cijfers voor aarde en zon wel. Er wordt geen overeenstemming met enige echte dienst of locatie beweerd. Adv (commentaar in het scenariobestand, regels { "11" } tot { "15" })

seg-958f00c2d647 = Beschikbaarheid van positiebepaling en tijdsynchronisatie op het oppervlak per locatie en seizoen bij de maanpolen (<c1/>) is MODELLED, niet gevalideerd: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Vorige</s1>lunar-station-coverage

seg-625c1973128e = <s1>Volgende</s1>lunar-time-budget
