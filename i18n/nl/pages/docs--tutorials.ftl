# docs--tutorials: translations (nl)

seg-3a0e724a8a2b = Tier

seg-835df2d05f2a = GNSS-meetdomein

seg-501402fc366f = Klok-holdover

seg-cae10fb9bff8 = Scenario

seg-a0b63210b807 = Meer lezen

seg-a7cfe6f135f1 = Baan en geometrie

seg-28e87f407a10 = Domein

seg-d6476863f862 = Mogelijkheid

seg-029de6b99be0 = Inertiële koppelnavigatie

seg-9ef8f99ca6e4 = Tijdoverdracht

seg-b03d56f501c3 = Type

seg-ec26df467b88 = Gezamenlijke Kalman-sensorfusie voor PNT op dezelfde hybride invoer.

seg-4f19d4fb1341 = Generieke N-D-sweep over elk pakket via TOML-sleutels met punten / JSON-metriekpaden.

seg-e7ab7b55c969 = 1-D-sweep voor een afwegingsstudie over een parameter van een klokpakket.

seg-e43910de5fd8 = Notebooks

seg-d78822583c64 = Notebook

seg-3959aefa12be = Bron: <c1/>

seg-a5ebe4befda8 = Praktische, uitgewerkte voorbeelden die u meenemen van “draai een meegeleverd scenario” naar “kwantificeer en verdedig een resultaat.” Elk getal in de drie tutorials is een echte uitvoer van de engine, verankerd aan een externe (niet-circulaire) gezaghebbende onafhankelijke referentie, en <b>vastgelegd door een integratietest</b> (<c1/>), zodat een tutorial nooit ongemerkt kan afwijken van wat de engine werkelijk doet. Als een tutorial zegt dat de optische klok { "6600" } s volhoudt, laat de test de build falen op de dag dat dat niet langer waar is.

seg-1c045624a6be = { -brand } is een simulator voor positiebepaling, navigatie en tijdsynchronisatie (PNT). De tutorials gebruiken nog een paar afkortingen, elk uitgeschreven waar ze voor het eerst voorkomen: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (command-line interface) en TOML (Tom's Obvious Minimal Language, het formaat van scenariobestanden).

seg-7a84a80b57d5 = Nieuw bij het project? Lees eerst de <a1>conceptenintroductie</a1> en de <a2>verklarende woordenlijst</a2> en kom dan hier terug.

seg-b4cd44590347 = De drie uitgewerkte voorbeelden

seg-eebeab9693b2 = Tutorial

seg-a0bc6e585d71 = Wat u leert

seg-b6cc01b76947 = Scenariosoort

seg-429bab0a0e05 = Moeilijkheid

seg-0e188f9c0f65 = ~Tijd

seg-bcf40448e55d = Mijn eerste baan: waar zijn de GPS-satellieten

seg-de1032024a69 = een echte GPS-constellatie propageren, beschikbaarheid, position dilution of precision (PDOP) en positienauwkeurigheid lezen, en exporteren waar de satellieten werkelijk zijn (SP3-formaat voor nauwkeurige banen)

seg-e7b6c262333e = beginner

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Klok-holdover: hoelang kunt u doorlopen

seg-0e9c77468fb2 = een klok-holdover zonder GNSS draaien, de kwaliteitsmaat voor tijdsynchronisatie lezen en de groeiwet √(q_wf·T) erachter begrijpen

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Quantum tegenover klassieke GNSS-veerkracht

seg-4d8036091b37 = het sluitstuk: een spoofingdetector (<c1/>) en een volledige gefuseerde PNT-suite (<c2/>), en hoe u beveiliging, integriteit en dead-reckoning samen leest

seg-1b39d4927602 = gevorderd

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Uitvoerbare Jupyter-notebooks, op synthetische gegevens en openbare elementensets die alleen in de repository worden bewaard, staan in <a1><c1/></a1>:

seg-9aae3a4e10dc = Vaartuigvertrouwen en training

seg-1d680d635c6d = een synthetische NMEA-stroom van de brug genereren met een gescripte gebeurtenis en die scoren met de vertrouwensmonitors voor vaartuigen (adviserend, geen typegoedgekeurde navigatieapparatuur)

seg-739f8f5a9082 = waar navigatiegegevens verslechterd leken en hoeveel van een route daardoor wordt geraakt

seg-443c908ff49b = Compliance-mapping en test-bench-export

seg-0d639065192a = voor welke rijen van openbare raamwerken een reeks runs bewijs levert (nooit dat een raamwerk is gehaald), en de beweging en gebeurtenissen van een scenario als tekst geëxporteerd voor een GNSS-simulator in een laboratorium (er wordt geen signaal geschreven)

seg-981a3238794d = Quantum tegenover klassieke GDOP

seg-228ce150ee80 = dezelfde constellatiegeometrie met een quantumsensor en een klassieke sensor, vergeleken op dilution of precision

seg-4b82b5edd4ff = Hemelgeometrie onder een skyline

seg-1186b6cd6149 = de satellieten die een locatie ziet onder de skyline van een straat of kade, hun DOP en foutellips, een gedateerde hemel uit elementensets en een geseede Monte Carlo tegen de covariantie (MODELLED)

seg-d9d06cb8e237 = Een tutorial draaien

seg-ffc4ddfc9426 = Elke tutorial draait hetzelfde scenario op drie manieren; kies wat bij u past. Ze roepen allemaal <em>dezelfde</em> engine aan, dus de getallen zijn identiek (volgt de sectie <a1>Usage</a1> van de README).

seg-e7ba76a06aa6 = <b>Opdrachtregel.</b> De CLI schakelt op het veld <c1/> van het scenario en schrijft <c2/>, <c3/>, <c4/> en <c5/> naast de invoer (JSON is JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Enkele soorten publiceren ook een reproduceerbaarheidstabel als <c6/> (door komma's gescheiden waarden): <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, en <c12/> wanneer een exportlocatie is ingesteld. Geen van de drie tutorials is er een van, dus u ziet dat bestand hier niet.

seg-5ee6f15d3b08 = <c1/> bouwt de CLI uit deze checkout. Met een geïnstalleerd binair bestand (<c2/>) is dezelfde opdracht <c3/>. Zonder checkout zijn de meeste meegeleverde scenario's in het binaire bestand opgenomen: <c4/> somt ze op (en noemt de enkele die niet zijn opgenomen, met de reden), en <c5/> schrijft er één uit: de kopie van <c6/> waarmee het binaire bestand is gebouwd.

seg-1b7e851749d5 = <b>Python.</b> Bouw de extensie eenmalig uit deze checkout met maturin, binnen een actieve virtuele omgeving, en roep dan <c1/> aan:

seg-3aa10d551694 = <c1/> installeert in plaats daarvan het gepubliceerde wheel. Dat kan achterlopen op deze checkout: <c2/> vertelt u welke scenariosoorten uw build heeft.

seg-333b7956b06b = <b>Playground in de browser.</b> Zonder installatie: open de <a1>Studio</a1>, kies een scenario, pas de parameters aan en lees het resultaat. Er wordt niets geüpload; de engine draait aan de clientzijde als WebAssembly.

seg-2cd8bbd1e7f0 = De tutorials noemen de <b>CLI</b>, maar elke opdracht heeft hierboven het equivalent in Python en in de playground. Elk resultaat is reproduceerbaar uit <c1/>: draai het twee keer en u krijgt bitidentieke uitvoer.

seg-d497caeb889a = Geannoteerde leerscenario's

seg-c966709a600d = Voor elk mogelijkhedendomein is er één rijkelijk becommentarieerd <c1/> onder <a1><c2/></a1>: een <em>leerversie</em> van een canoniek scenario met elk veld inline toegelicht, de aangehaalde onafhankelijke referentie genoemd en de verwachte samenvatting van één regel vastgelegd als commentaar <c3/>. De veldwaarden zijn identiek aan die van het origineel in de map <c4/> op het hoogste niveau van de repo (<c5/> vergelijkt de geparseerde TOML), zodat de gedocumenteerde uitvoer klopt. De golden hashes blijven ook ongewijzigd: commentaar verandert nooit een scenariohash.

seg-871fcecc5ee1 = Leerbestand

seg-4e852a6a1581 = Afgeleid van

seg-e74e1c9b387e = Integriteit (RAIM, receiver autonomous integrity monitoring)

seg-95b6cceb76e6 = Beveiliging (spoofing)

seg-dab48471c270 = Hybride PNT

seg-c889e5e77121 = Het leerbestand voor <b>beveiliging</b> gebruikt <c1/> binnenin: de kwaliteitsmaat voor beveiliging (<c2/>, één min de kans op gemiste detectie) wordt geproduceerd door het spoofpakket. De bestandsnaam volgt de <em>mogelijkheid</em> (beveiliging), de <c3/> volgt het <em>pakket</em> (spoof). De kop van dat bestand wijst hierop.

seg-89fef83a9d54 = De volledige catalogus van scenariosoorten

seg-0f744a3a7193 = Klok-holdover tegenover specificatie; optioneel Monte-Carlo-ensemble (<c1/>).

seg-9a2564fdc86a = 1-DOF (één vrijheidsgraad) inertiële dead-reckoning tijdens een GNSS-uitval.

seg-62f0400581b3 = GNSS-beschikbaarheid + dilution of precision (DOP) uit een constellatie (Walker / two-line elements / RINEX, het Receiver Independent Exchange-formaat).

seg-59fc8330ba12 = Snapshot / solution-separation / ARAIM (advanced RAIM) met horizontale en verticale beschermingsniveaus (HPL/VPL) + Stanford-diagram.

seg-22c598d57e77 = ARAIM-passage met beschermingsniveaus op de zuidpool van de maan tegenover een set LunaNet-relays.

seg-f97d8fb3b6fa = Optische tegenover radiofrequente (RF) tweewegs tijd-/frequentieoverdracht.

seg-8af1c652d854 = Sluitstuk hybride PNT: klok + inertiële meeteenheid (IMU) + ondersteuning met tijdoverdracht.

seg-d24a9596f53e = Losjes en strak gekoppeld GNSS/INS (inertial navigation system) extended Kalman-filter met foutstatus.

seg-3c915870476a = Pseudorange-simulatie in het meetdomein (Klobuchar-ionosfeer, Saastamoinen/Niell-troposfeer) + RAIM.

seg-72284bad54e4 = Jamming met linkbudget: jammer-to-signal ratio (J/S) → effectieve draaggolf-ruisdichtheid (C/N₀) → verlies van lock.

seg-2ead4d42b427 = Stochastische detector voor tijdspoofing (Neyman–Pearson / χ²₁) met Monte-Carlo-kansen op vals alarm en gemiste detectie (P_fa/P_md).

seg-5f2f9e63093a = Voorbij de tutorials: nieuwere mogelijkheden

seg-3d6a8fd31402 = De drie tutorials blijven bij de klassieke pakketten voor klok, baan en beveiliging. De engine is daar ver bovenuit gegroeid. Elke rij hieronder is een meegeleverd scenario dat u ongewijzigd kunt draaien (<c1/> of <c2/>); de samenvatting is de eerste regel die kshana { "0.35.0" } er op 2026-10-10 voor afdrukte. Anders dan de cijfers uit de tutorials zijn deze regels de vastlegging van één run en niet vastgelegd door <c3/>: draai het scenario opnieuw voor de actuele waarde. Resultaten vermelden hun eigen reikwijdte (de meeste hebben een <c4/>), en de <a1>verificatiematrix</a1> vermeldt welke mogelijkheden VALIDATED zijn aan een externe onafhankelijke referentie en welke MODELLED.

seg-2dc1d8680abb = Eerste regel van de samenvatting

seg-abd799395f27 = L-bandspectrum en jammingwaterval

seg-33453b2cfdf3 = Het zonnestelsel op één epoch

seg-23bc4ff7f741 = Positiebepaling rond een ander hemellichaam

seg-c135b151e469 = Constellatieontwerp op schaal

seg-065995e9bd5e = Campagnes: soorten geketend op één tijdlijn

seg-dbae357e7e34 = Eén LEO-PNT-systeem van begin tot eind

seg-9d3d72ea03df = Gefuseerde MEO- + LEO-positiebepaling

seg-acc2793d1721 = LEO-signalen, passages en navigatieberichten

seg-db2626e54a24 = <c1/> (de passage)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = PPP-convergentie met een LEO-laag; 5G-positiebepaling

seg-01160980ce50 = Veerkracht: GNSS gejamd, LEO draagt de gebruiker

seg-adf8453bc035 = Verticale toepassingen: spoor, maritiem, telecom, voertuigen, Arctisch gebied

seg-15a5098b5045 = <c1/> (en de andere <c2/>-bestanden)

seg-e6494ed83ee3 = Telecom-holdover tegenover de klokgrenzen van ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272

seg-dfc04f1abe82 = LEO is lage baan om de aarde (low Earth orbit) en MEO middelhoge baan om de aarde (medium Earth orbit); PVT is positie, snelheid en tijd; PPP is precise point positioning; 5G is de vijfde generatie mobiele standaard; TDB is Barycentric Dynamical Time; JD is Juliaanse datum; TE is tijdfout.

seg-1d45d94f2e5b = De CLI voegt drie uitvoeren toe aan elke run:

seg-893276648fec = <b>Rapporten.</b> Elke run schrijft <c1/> en <c2/> (zie <a1>REPORTS.md</a1>). <c3/> draait een suite van scenario's naar één <c4/> en <c5/>, bijvoorbeeld <c6/>.

seg-e9f06d47c82c = <c1/> geeft de tijdreeks van de run weer, bijvoorbeeld <c2/> op <c3/> schrijft <c4/>. Een soort zonder bemonsterde tijdas (zoals <c5/>) wordt met een foutmelding geweigerd; zie <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Interop-exports.

seg-3977722b8517 = <c1/> schrijft het resultaat voor andere hulpmiddelen: CZML (Cesium Language), KML (Keyhole Markup Language, voor Google Earth), GeoJSON (geografische JSON), een efemeride voor STK (Systems Tool Kit) of een opname in SigMF (Signal Metadata Format). <c2/> zegt welke formaten voor een scenario gelden; SigMF geldt alleen voor <c3/>. Het baanpakket exporteert ook <c4/>, <c5/> en <c6/> (CCSDS, het Consultative Committee for Space Data Systems, baanberichten). Zie <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Oefeningen met oplopende moeilijkheid

seg-9513af4fb862 = Werk de ladder door. Elke tier is moeilijker en beter verdedigbaar dan de vorige; referentie-oplossingen staan in <a1><c1/></a1>.

seg-89ad8eb64a54 = Doel

seg-0a824838ef57 = Wat u doet

seg-2463a86470b8 = Referentie-oplossing

seg-7ce3ac2347b9 = Tier { "1" } — draaien en lezen

seg-e1dee35aedff = een meegeleverd scenario ongewijzigd draaien en één kwaliteitsmaat lezen

seg-296694716b3b = Draai <c1/>; druk de <c2/> van quantum tegenover klassiek af. CLI, playground of een Python-aanroep van één regel.

seg-bad6d3afb6a0 = Tier { "2" } — bewerken en sweepen

seg-c18da238e470 = verander één parameter en observeer een monotoon effect

seg-598ca8efea83 = Scherp de klokspecificatie (<c1/>) aan of verleng de uitval en zie de holdover dalen; of gebruik <c2/>/<c3/> om die in een tabel te zetten.

seg-1d9dfecce6fa = Tier { "3" } — kwantificeren en verdedigen

seg-5b57f2c8ffb9 = Monte-Carlo, betrouwbaarheidsbanden, reproduceerbaarheid en een beschermingsniveau

seg-0fac2036b289 = Draai een klokensemble (<c1/>), lees de band [p05–p95], bevestig dat twee runs een identieke <c2/> geven en lees een integriteits-/Stanford-resultaat.

seg-45dc753da682 = De referentie-oplossingen gebruiken de Python-extensie (eerst <c1/>). Vanuit de root van de repository gedraaid drukt <c2/> af dat de holdover van de atoomklok op chipschaal daalt van { "2610" } s bij een specificatie van { "20" } ns naar { "1140" } s bij { "5" } ns.

seg-e59b1beadb98 = Verse gegevens nodig?

seg-530db2e609d0 = De kerngetallen in deze tutorials draaien volledig uit scenario's die al in de repo staan. Er wordt niets opgehaald, en dat houdt ze reproduceerbaar en veilig om in continuous integration (CI) te draaien. Voor de oefeningen “breid het uit” kunt u live gegevens ophalen:

seg-6a20ec96cb92 = <b>GPS two-line elements (TLE's)</b> (ververs de baanconstellatie): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, elementensets van 3 regels in platte tekst (naam + regel { "1" } + regel { "2" }). Hulpmiddel: <c1/>. Open gegevens (catalogus van het 18th Space Defense Squadron van de US Space Force, herverspreid door Celestrak, Dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>Verificatiereferentie voor SGP4 (Simplified General Perturbations { "4" })</b> (al opgenomen, haal niet opnieuw op): de testvectoren uit AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 “Revisiting Spacetrack Report #3”, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, gebruikt door <c1/>; zie <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Onafhankelijke referentie voor klokstabiliteitsrelaties</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, de relaties tussen σ_y(τ) en fase achter Tutorial { "2" }.

seg-36be39f17e35 = <s1>Vorige</s1>Studiogids

seg-6f6204737a87 = <s1>Volgende</s1>{ "1" } · Uw eerste baan

seg-2fa9e002b3a2 = De engine schakelt op de <c1/> van het scenario. De tabel hieronder somt de meestgebruikte soorten op (de acht tutorialdomeinen hierboven plus hun naaste buren). Het is <b>niet</b> de complete verzameling: <c2/> geeft alle <c3/> ingebouwde soorten terug. Die functie (beschikbaar als <c4/> in de Python- en WebAssembly-bindings (WASM), en als <c5/> op de opdrachtregel) is de gezaghebbende, altijd actuele catalogus, en <a1><c6/></a1> is de gegenereerde opsomming ervan, één sectie per soort met de verplichte en optionele TOML-velden. <c7/> dwingt af dat elke soort die een tutorial beschrijft een echte dispatchsoort is, zodat niets in deze tabel een soort kan noemen die niet bestaat.
