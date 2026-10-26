# docs--kind-space-weather: translations (nl)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenariokind van de engine v{ $version }, familie <a1>GNSS-metingen, positiebepaling en integriteit</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f6b7ca020692 = Familiepagina: <a1>GNSS-metingen, positiebepaling en integriteit</a1>

seg-95f8bd8e0078 = Bron: <c1/>

seg-24c21b5b0cc3 = <c1/> (scenariosoort)

seg-5f25c5b71f0c = Ruimteweermodel van de omgeving: zonne- (F10.7/F10.7a) en geomagnetische (Kp, met de definitionele tabel Kp↔ap) activiteitsindices, de exosferische temperatuur volgens Jacchia-1971 die zij aansturen (getoetst tegen gepubliceerde waarden voor zonneminimum/gemiddelde/zonnemaximum), en de neutrale thermosferische dichtheid volgens Jacchia-1971 bij de dagelijks gemiddelde exosferische temperatuur tegenover het activiteitsvrije statische profiel op een reeks hoogten — de afhankelijkheid van de dichtheid van de zonnecyclus die de statische atmosfeer weglaat. MODELLED: de dichtheid komt overeen met uit accelerometers afgeleide dichtheden (TOLEOS CHAMP en GRACE) binnen een factor { "2" } bij zonnemaximum, maar is ongeveer 1.7x te dicht in het zonneminimum van { "2008" }.

seg-f2c2860db799 = Eén run van <c1/> vat samen als: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; dichtheid x1.49 op { "300" } km (MODELLED)

seg-6bb05c41eba2 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-c367f1aacd0b = Het voorbeeld <c1/> stelt onder meer in:

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = Resultaatlabel (van de engine): MODELLED — zonne-/geomagnetische indices, exosferische temperatuur volgens Jacchia-71 en statische dichtheid volgens Jacchia-71 bij de dagelijks gemiddelde temperatuur

seg-c1c6f2f73fb5 = De grafiek die de engine schrijft voor scenarios/space-weather.toml, soort space-weather

seg-15587da59e8e = <b>MODELLED</b> Zonne-/geomagnetische indices (definitionele tabel Kp↔ap), de exosferische temperatuur volgens Jacchia-1971 en de thermosferische dichtheid volgens Jacchia { "1971" } (SAO Special Report { "332" }: statische diffusieprofielen die de Tabel { "7" } ervan reproduceren, met de dagelijkse, geomagne

seg-f8eef6eabfb2 = <b>MODELLED</b> Zonne-/geomagnetische indices (definitionele tabel Kp↔ap), de exosferische temperatuur volgens Jacchia-1971 en de thermosferische dichtheid volgens Jacchia { "1971" } (SAO Special Report { "33" }. Onafhankelijke referentie (ExternalDataset): definitionele tabel Kp↔ap + gesloten vorm van de exosferische temperatuur volgens Jacchia-1971 (overeenkomend tot <{ "1" } K met de gepubliceerde ankerwaarden, tests/space_weather_reference.rs); de dichtheid is gekarakteriseerd tegen pymsis NRLMSISE-00 (een onafhankelijk NRL-model): de zonnecyclusschommeling op { "800" } km is 10.4x tegenover 13.6x bij NRLMSISE-00. Herziening { "0.30" }: de gekalibreerde activiteitsfactor van de eerste orde is vervangen door Jacchia { "1971" } (dichtheid van het standaardscenario op { "40" }

seg-72979b637644 = MODELLED — zonne-/geomagnetische indices, exosferische temperatuur volgens Jacchia-71 en statische dichtheid volgens Jacchia-71 bij de dagelijks gemiddelde temperatuur (resultaat <c1/>)

seg-0306ee022298 = MODELLED: de dichtheid komt overeen met uit accelerometers afgeleide dichtheden (TOLEOS CHAMP en GRACE) binnen een factor { "2" } bij zonnemaximum, maar is ongeveer 1.7x te dicht in het zonneminimum van { "2008" }. (soortencatalogus (<c1/>))

seg-b86a312077b5 = EERLIJKE REIKWIJDTE: MODELLED. De omrekening Kp<->ap is de definitionele IAGA-tabel en de exosferische temperatuur is getoetst aan gepubliceerde groottes voor zonneminimum/gemiddelde/zonnemaximum, maar de dichtheidscorrectie is een GEKALIBREERDE koppeling van de EERSTE ORDE met de schaalhoogte — zij geeft het juiste teken, de juiste monotoniciteit en de juiste orde van grootte, NIET de absolute nauwkeurigheid van een met data getoetste atmosfeer (NRLMSISE-00). Run: kshana scenarios/space-weath (opmerking in het scenariobestand, regels { "10" } tot { "15" })

seg-10cf16c12a2a = De ruimteweeromgeving en de door activiteit gestuurde thermosferische dichtheid zijn MODELLED, niet getoetst: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>Vorige</s1>space-packet

seg-ff9d9a41692b = <s1>Volgende</s1>spectrum
