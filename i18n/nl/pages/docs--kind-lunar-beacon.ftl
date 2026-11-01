# docs--kind-lunar-beacon: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-3c4e3d725bb6 = Bron: <c1/>

seg-5e402fc935cb = <c1/> (scenariosoort)

seg-142ad48fe422 = Aanvulling van een navigatiedienst in een maanbaan met bakens op het oppervlak, als een uitvoerbare voor-en-natabel. Een gebruiker bij de zuidpool ziet een dunne baanset in een smalle strook hemel, waardoor de afstandsmeetgeometrie slecht geconditioneerd is; enkele OPGEMETEN OPPERVLAKTEBAKENS leveren de zichtlijnrijen met lage elevatie en brede azimut die een geheel bovenhoofdse set mist, en de horizontale verdunning van precisie stort in. Het scenario rapporteert drie configuraties op één epoch — alleen satellieten, satellieten plus de zichtbare bakens, en een grotere constellatie als alternatieve route naar dezelfde geometrie — elk met zijn aantallen zichtbare bronnen, zijn volledige DOP en de gerealiseerde 1-sigmanauwkeurigheid in METERS, verkregen door te vermenigvuldigen met een user-equivalent ranging error per baken die is samengesteld als de wortel uit de som van de kwadraten van klok-synchronisatie-, multipad- en opmetingstermen. De zichtbaarheid van bakens is de geometrische horizon op twee hoogten voor de luchtloze Maan (geen atmosfeer, dus de grens is exact), en de DOP-samenstelling is dezelfde kernel die in tests/dop_reference.rs is gecontroleerd aan gnss_lib_py. WAAROM DEZE SOORT BESTAAT: de module erachter zit al sinds L08/L09 in de engine en is gecontroleerd aan een onafhankelijk DOP-pad, maar was niet bereikbaar vanuit een run — geen soort, geen dispatch-arm, geen meegeleverd bestand. De README maakte reclame voor de mogelijkheid en de verificatiematrix bevatte er GEEN enkele rij voor, zodat ze tegelijk in proza werd geclaimd en in het register niet werd geclaimd, terwijl ze in de engine onbereikbaar was. De standaardwaarden zijn de geometrie die al een vastgelegd golden-bestand heeft (een gebruiker op -80 deg met een antenne van { "2" } m, drie bakens op -80/0, -79/+{ "60" } en -79/-60 op { "2" } km, een illustratieve LCNS-momentopname met zes satellieten op t={ "0" }, een masker van { "5" } deg), zodat een kale run een tabel reproduceert die een onafhankelijke referentie al dekt in plaats van nieuwe getallen te verzinnen. MODELLED: het constellatieontwerp, de plaatsing van de bakens en elke grootte in het foutbudget zijn illustratieve invoer, geen in gebruik zijnde opmeting of gemeten link; alleen de DOP-rekenkunde, de gesloten vorm van de horizon en de relatie sigma = DOP x sigma_URE zijn extern verankerd. Geen toezegging over serviceprestaties.

seg-22ea11fcf367 = Eén run van <c1/> vat zich samen als: Aanvulling met bakens op het maanoppervlak — masker { "5.0" } deg, epoch +{ "0" } s, sigma_URE per baken { "1.1576" } m { "6" } satellieten, geen bakens sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } gerealiseerde 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satellieten + { "1" } zichtbare bakens sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } gerealiseerde 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satellieten, geen bakens sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } gerealiseerde 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m bakens verbeteren de PDOP met 2.355x; in plaats daarvan een grotere constellatie, 4.002x MODELLED: de constellatie, de plaatsing van de bakens en het foutbudget zijn illustratieve invoer. De DOP-kernel eronder is die welke aan gnss_lib_py is getoetst en de horizon van de bakens is de gesloten vorm L01.

seg-25522022cf9a = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-acfef3f325e4 = Het voorbeeld <c1/> stelt onder meer in:

seg-a53e353706f6 = De grafiek die de engine schrijft voor scenarios/lunar-beacon.toml, soort lunar-beacon

seg-89e2f6bb2540 = <b>MODELLED</b> Door bakens aangevulde verdunning van precisie voor een gebruiker op het maanoppervlak: de zichtlijnrijen van de zichtbare satellieten en de afstandsrijen van de zichtbare oppervlaktebakens worden samengevoegd tot één ontwerpmatrix en geëvalueerd via de gedeelde DOP-kernel, en t Tests: <a1>validate_p2_beacon_before_after_table.rs</a1>.

seg-654a3554b1e3 = <b>MODELLED</b> Door bakens aangevulde verdunning van precisie voor een gebruiker op het maanoppervlak: de zichtlijnrijen van de zichtbare satellieten en de afstandsrijen van de zichtbare oppervlaktebakens worden samengevoegd. Onafhankelijke referentie (ReferenceImpl): De DOP-rekenkunde is de kernel crate::orbit::dop, afzonderlijk extern getoetst aan gnss_lib_py in tests/dop_reference.rs; deze rij leent de status van die rij niet opnieuw. De zichtbaarheidshorizon van de bakens is de gesloten vorm L01, en sigma = DOP x sigma_URE is de gangbare GNSS-relatie (Kaplan and Hegarty, Understanding GPS/GNSS, section { "7" }). Binnen deze rij wordt de aanvulling zelf gecontroleerd aan een onafhankelijke

seg-4d1fc06e907b = MODELLED: het constellatieontwerp, de plaatsing van de bakens en elke grootte in het foutbudget zijn illustratieve invoer, geen in gebruik zijnde opmeting of gemeten link; alleen de DOP-rekenkunde, de gesloten vorm van de horizon en de relatie sigma = DOP x sigma_URE zijn extern verankerd. (soortencatalogus (<c1/>))

seg-aaafed663400 = WAT IS VERANKERD EN WAT NIET Verankerd: de DOP-samenstelling is de kernel die in tests/dop_reference.rs is gecontroleerd aan gnss_lib_py; de zichtbaarheid van bakens is de gesloten vorm van de geometrische horizon op twee hoogten voor de luchtloze Maan (geen atmosfeer, dus er is geen refractieve verlenging en de grens is exact); en sigma = DOP x sigma_URE is de gangbare relatie (Kaplan & Hegarty, Understanding GPS/GNSS, section { "7" }). NIET verankerd — MODELL (commentaar in het scenariobestand, regels { "40" } tot { "49" })

seg-2516c4208769 = De DOP-aanvulling met bakens op het maanoppervlak is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-ebb9724de60a = <s1>Vorige</s1>lunar-attack-surface

seg-ca9b68783354 = <s1>Volgende</s1>lunar-differential-pnt

seg-b81e98467952 = <s1>Volgende</s1>lunar-descent
