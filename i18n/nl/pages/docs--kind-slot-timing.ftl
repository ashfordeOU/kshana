# docs--kind-slot-timing: translations (nl)

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariokind van de engine v{ $version }, familie <a1>Klokken, tijdsynchronisatie en holdover</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-849c08d3ce70 = Familiepagina: <a1>Klokken, tijdsynchronisatie en holdover</a1>

seg-09644e40e2d8 = Bron: <c1/>

seg-ec92d03eaa6c = <c1/> (scenariosoort)

seg-1b61962464c5 = Slot-tijdsynchronisatie: seconden tot een vrijlopende klok de guard verlaat van een routerings- of taakslot dat op tijd is geïndexeerd (de grootste absolute tijdfout die het slot verdraagt), de bijdrage van elke term op dat moment met de dominante term benoemd (onzekerheid van de positiebepaling, witte fase-ruis, witte, flicker-, random-walk- en random-run-frequentieruis, resterende frequentie-offset, temperatuur, veroudering), de tijd die resteert sinds de laatste positiebepaling, en het grootste interval tussen positiebepalingen dat de klok binnen het slot houdt, na aftrek van de latentie van de positiebepaling. De oscillator is een KLASSE-standaard (csac, uso, dsac, tcxo, ocxo of rafs: één aangehaalde Allan-deviatie van één seconde en een aangenomen rode-ruisondergrens), een DATABLAD-VOORINSTELLING voor telecom-tijdsynchronisatie of een inline DATABLAD (maxima van de Allan-deviatie gefit als envelop, plus veroudering en een temperatuurcoëfficiënt), of een inline MEASURED-FASEREGISTRATIE (de overlappende Allan-deviatie daarvan gefit met gewogen kleinste kwadraten in de basis van witte fase en IEEE Std { "1139" }-frequentiemodulatie, zodat de rode-ruisondergrens wordt gemeten in plaats van aangenomen). Een overschrijding voorbij de langste middelingstijd die het datablad of de registratie ondersteunt, wordt als geëxtrapoleerd gemarkeerd. Een optionele sectie voor spoofing voegt het beschermingsniveau voor tijdsynchronisatie toe voor een ontvanger in een baan: baansnelheid en -periode, hoe lang één grondspoofer de satelliet per passage kan bereiken, de ondergrens van de klokondersteunde monitor en de CUSUM-detectielatentie, de voorwaardelijke grens, de afwijking die een spoofer bij een vermelde maximale rampsnelheid opbouwt voordat de satelliet buiten bereik raakt of een onafhankelijke controle draait, en of elke controle via grondcontact of crosslink onafhankelijk is van die spoofer. VALIDATED: de holdover-inversie uit een gefitte registratie, achtergehouden op een echte cesiumklok gemeten tegen een waterstofmaser (tests/slot_timing_cs5071a_holdout.rs, afhankelijk van beschikbare data); bij een gemeten kristaloscillator is de achtergehouden voorspelling conservatief maar niet binnen de drempel, dus het kristalgeval is MODELLED. MODELLED: klasse- en databladbronnen, de deterministische termen en de beoordeling van spoofing.

seg-1284cfee51f0 = Eén run van <c1/> vat samen als: slot-timing (databladbron): guard { "100.0" } ns bij k={ "3" } bezwijkt { "650.8" } s na een positiebepaling ({ "50.8" } s resterend); positiebepaling minstens elke { "645.8" } s ({ "133.80" } per dag); dominante term: random-walk-frequentieruis

seg-97e12e763be3 = Verplichte velden: <c1/>, <c2/>

seg-6b75ef50497a = Optionele velden: <c1/>

seg-8c4662736bc0 = Het voorbeeld <c1/> stelt onder meer in:

seg-8aee75a55007 = ocxo

seg-df4ca2d859ff = 1/s^{ "3" }

seg-1a282dc35742 = datasheet

seg-c13396b4e57b = Resultaatlabel (van de engine): MODELLED — tijd tot een vrijlopende klok de guard van een routeringsslot verlaat, en de cadans van positiebepalingen die haar binnen het slot houdt, uit een stationair machtswetklokmodel. Een databladbron is een envelop van de maxima daarvan, geen meting van een enkele eenheid; een klassebron berust op een aangenomen rode-ruisondergrens.

seg-97a91c8a60cd = De grafiek die de engine schrijft voor scenarios/slot-timing-ocxo-leo.toml, soort slot-timing

seg-8461cb5b7863 = MODELLED { "2" } · VALIDATED { "1" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-e84e4b49fee0 = <b>VALIDATED</b> Het pad met gemeten registratie van de soort <c1/>: de overlappende Allan-deviatie van een faseregistratie, gefit met edf-gewogen niet-negatieve kleinste kwadraten in de basis van witte fase en IEEE Std { "1139" }-frequentiemodulatie (slot_timing::fit_weighted), Tests: <a1>slot_timing_cs5071a_holdout.rs</a1>.

seg-26ccdbd07a46 = <b>MODELLED</b> De soort <c1/>: de voorspelde fout E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² omgekeerd voor de overschrijding, de resterende tijd, het hersynchronisatie-interval na aftrek van de latentie van de positiebepaling en positiebepalingen per dag, elke term uitgesplitst met de Tests: <a1>slot_timing_igs_holdout.rs</a1>.

seg-35ac4dddc39f = <b>MODELLED</b> orbital_timing::orbital_timing, bereikbaar als de spoofing-sectie van de soort <c1/>: snelheid en periode in een cirkelbaan, de langste tijd dat een grondspoofer de satelliet per passage kan bereiken, de ondergrens van de klokondersteunde monitor en de CUSUM-detectie l

seg-8dbc28c3398f = <b>MODELLED</b> De soort <c1/>: de voorspelde fout E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² omgekeerd voor de overschrijding, de resterende tijd, de hersynchronisat. Onafhankelijke referentie (InternalConsistency): gesloten vormen voor elke term afzonderlijk en de onafhankelijke nulpuntszoeker holdover::holdover_seconds; de cijfers van het datablad zijn de genoemde documenten (docs/SLOT-TIMING.md). Een klassestandaard berust op een aangenomen rode-ruisondergrens en een databladbron is een envelop van maxima, dus geen van beide is een meting van een enkele eenheid

seg-fabde8dddf68 = <b>MODELLED</b> orbital_timing::orbital_timing, bereikbaar als de spoofing-sectie van de soort <c1/>: snelheid en periode in een cirkelbaan, de langste tijd dat een grondspoofer de s. Onafhankelijke referentie (InternalConsistency): reductie tot het bestaande beschermingsniveau voor tijdsynchronisatie en de gesloten vormen voor zichtbaarheid bij een cirkelbaan en een bolvormige Aarde. Voorwaardelijk op detectie, één terrestrische spoofer bij een vermelde rampsnelheid, een passage recht boven het station op een niet-roterende Aarde; niet getoetst op een gespoofde ontvanger in een baan

seg-29af1ec87672 = frequentiesprongen, stralingseffecten en relativistische frequentie-offsets (resultaat <c1/>)

seg-89f90cdab1db = een thermisch model: de temperatuurexcursie wordt als een stap toegepast bij de positiebepaling (resultaat <c1/>)

seg-cb3887ccae22 = het synchronisatieprotocol zelf: een positiebepaling zet de fout terug op fix_sigma_ns (resultaat <c1/>)

seg-b96fceda31df = tegen welke wandelmaat een routeringsslot moet worden geaccepteerd; zie docs/SLOT-TIMING.md (resultaat <c1/>)

seg-b101457241f2 = MODELLED — tijd tot een vrijlopende klok de guard van een routeringsslot verlaat, en de cadans van positiebepalingen die haar binnen het slot houdt, uit een stationair machtswetklokmodel. Een databladbron is een envelop van de maxima daarvan, geen meting van een enkele eenheid; een klassebron berust op een aangenomen rode-ruisondergrens. (resultaat <c1/>)

seg-8e3d910f22ed = De oscillator is een KLASSE-standaard (csac, uso, dsac, tcxo, ocxo of rafs: één aangehaalde Allan-deviatie van één seconde en een aangenomen rode-ruisondergrens), een DATABLAD-VOORINSTELLING voor telecom-tijdsynchronisatie of een inline DATABLAD (maxima van de Allan-deviatie gefit als envelop, plus veroudering en een temperatuurcoëfficiënt), of een inline MEASURED-FASEREGISTRATIE (de overlappende Allan-deviatie daarvan gefit met gewogen kleinste kwadraten in de basis van witte fase en IEEE S (soortencatalogus (<c1/>))

seg-f6a831727890 = VALIDATED: de holdover-inversie uit een gefitte registratie, achtergehouden op een echte cesiumklok gemeten tegen een waterstofmaser (tests/slot_timing_cs5071a_holdout.rs, afhankelijk van beschikbare data); bij een gemeten kristaloscillator is de achtergehouden voorspelling conservatief maar niet binnen de drempel, dus het kristalgeval is MODELLED. (soortencatalogus (<c1/>))

seg-1cf85cbedffa = MODELLED: klasse- en databladbronnen, de deterministische termen en de beoordeling van spoofing. (soortencatalogus (<c1/>))

seg-1a72034c1343 = Themapagina: <a1>DECEIVED-TIME.md</a1>

seg-10e6cd8ce00c = <s1>Vorige</s1>reentry

seg-b8ec9e10ee84 = <s1>Volgende</s1>solar-system
