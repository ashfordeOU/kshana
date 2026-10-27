# docs--kind-leo-navmsg: translations (nl)

seg-debc2f07db78 = true

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = { "5" } meegeleverde scenario's gebruiken deze soort; de overige staan in <a1><c1/></a1>.

seg-648c27220789 = Bron: <c1/>

seg-087287602b47 = <c1/> (scenariosoort)

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-867f3e41b5ab = LEO-navigatiebericht: de uitgezonden efemeride en klok van een satelliet voor positiebepaling, navigatie en tijdsynchronisatie in een lage baan om de aarde (LEO), voor elke baan, draaggolf en elk model, met optionele benoemde voorinstellingen (Xona Pulsar, Iridium, Starlink, CentiSpace, een representatief C-bandsysteem, het ATOMIC-zero-clockmodel, Celeste IOD). INHOUD: hulpgegevens (SVID, issue of data, band, signaalgezondheid), synchronisatie (week, tijd van de week, een klokpolynoom van de tweede orde af0-af2 rond toc), efemeride in een van vier modellen -- de Keplerset met 16 parameters uit de Galileo OS SIS ICD; die set plus correctiepolynomen langs het spoor, dwars op het spoor en radiaal; het model met 22 parameters van Liu et al. { "2025" }; een ECEF-polynoom zonder klokthermen (ATOMIC zero-clock) -- en andere diensten (een uitgezonden Klobuchar-set, NeQuick-G ai0-ai2 met het effectieve ionisatieniveau, en parameters voor systeemtijd naar UTC met de schrikkelseconde-logica van de ICD). FITTER: een referentiebaan geïntegreerd met zonale J2-J6- of EGM2008-zwaartekracht tot de gekozen graad en weerstand, en een geseede vrije of gestuurde klok; Levenberg-Marquardt-fit van de Keplerset op niet-singuliere elementen, daarna lineaire kleinste-kwadraten-correctiepolynomen; klok gefit na aftrek van de relativistische term die de gebruiker toevoegt. ANALYSES: fit-interval-trade (signal-in-space-afstandsfout, SISRE, met wereldwijd gemiddelde gewichten voor de baanhoogte, tegen fitinterval en updateperiode, alleen baan en met klok), model-comparison (vier modellen, aantal parameters, gecodeerde bits, en de fit van Kshana op de hoogten van Liu et al. naast de gepubliceerde cijfers), midpass-update (de hoogste overvlucht boven een gebruiker, de sprong in positie, klok en gebruikersafstand bij elke berichtwisseling, de sprong bij de slechtste geometrie, PASS/FAIL tegen een continuïteitsdrempel), encode-decode (het eigen gedocumenteerde binaire frame van Kshana met CRC-24Q, een kwantisatiebudget van een halve stap per veld, een controle op een beschadigd frame, een export en import van een record in RINEX-4-stijl gelabeld als Kshana-extensie, en een CSV-tabel). VALIDATED: de SISRE-gewichten tegen de gepubliceerde MEO/GEO-tabel (Montenbruck et al. { "2018" }); het Galileo-gebruikersalgoritme tegen RTKLIB op echte Galileo-uitgezonden efemeriden; CRC-24Q tegen zijn catalogus-controlewaarde en het RTCM-{ "1005" }-voorbeeldframe. MODELLED: elk fit- en SISRE-cijfer is representatiefout tegen een door Kshana geïntegreerde referentiewaarheid (geen fout in baanbepaling of baanvoorspelling); de vergelijking met Liu et al. gebruikt andere banen; de coderings- en tekstformaten zijn van Kshana zelf.

seg-e5a4f0290e9e = Eén run van <c1/> vat samen als: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m De Keplerset met 16 parameters degradeert van { "0.0003" } m bij { "60" } s tot { "0.1073" } m bij { "900" } s: één Keplerset met harmonischen twee keer per omloop kan de zwaartekrachttermen met hogere frequentie en de weerstand van een LEO-boog niet langer dan enkele minuten volgen, en het kleinste-kwadratenresidu oscilleert over het venster. De polynomen langs/dwars/radiaal, van hogere graad dan de Keplerset omspant, absorberen wat overblijft, wat { "0.0388" } m bij { "900" } s oplevert.

seg-3f299f6b20c8 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Het voorbeeld <c1/> stelt onder meer in:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Celeste IOD-bericht (workshopvoorinstelling)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = Resultaatlabel (van de engine): MIXED — VALIDATED bouwstenen, MODELLED resultaten. De SISRE-gewichten reproduceren de gepubliceerde MEO/GEO-tabel (Montenbruck et al. { "2018" }), het gebruikersalgoritme uit de Galileo-ICD reproduceert RTKLIB op echte Galileo-uitgezonden efemeriden, en CRC-24Q reproduceert zijn catalogus-controlewaarde en het RTCM-{ "1005" }-voorbeeldf

seg-35e92abc6a23 = De grafiek die de engine schrijft voor scenarios/leo-navmsg-celeste-iod.toml, soort leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: het radiale gewicht w_R en het gekwadrateerde transversale gewicht w_AC^{ "2" } als gemiddelden van cos^{ "2" } en de helft van sin^{ "2" } van de nadirhoek van de zichtlijn over gebruikers die uniform verdeeld zijn over de zichtbare aardkap boven een elevati

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: de Kepler-evaluatie uit de Galileo OS SIS ICD (de vergelijking van Kepler, tweedeharmonische correcties, aardvaste knoop) afzonderlijk geschreven van de RINEX-evaluator van de engine, die de positie teruggeeft met het argumen Tests: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynoom 0x1864CFB, beginwaarde { "0" }, geen reflectie, geen eind-XOR, de controle die het LEO-frame van Kshana over elke voorgaande byte meedraagt

seg-2b24c2669c23 = <b>VALIDATED</b> De fitter en trade van de soort <c1/>: een referentiebaan geïntegreerd met zonale J2-J6- of EGM2008-zwaartekracht tot de gekozen graad en weerstand, en een geseede vrije of gestuurde klok; een Levenberg-Marquardt-fit van de Galileo-Keplerset op niet-singuliere

seg-ddb27b07b9af = en { "7" } meer in de matrix.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: het radiale gewicht w_R en het gekwadrateerde transversale gewicht w_AC^{ "2" } als gemiddelden van cos^{ "2" } en de helft van sin^{ "2" } van de nadir. Onafhankelijke referentie (ExternalDataset): De gepubliceerde tabel met SISRE-wegingsfactoren van Montenbruck, Steigenberger en Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } en 1/49, GLONASS { "0.98" } en 1/45, Galileo { "0.98" } en 1/61, BeiDou MEO { "0.98" } en 1/54, BeiDou IGSO/GEO { "0.99" } en 1/126. Hetzelfde gemiddelde, geëvalueerd op LEO-stralen, geeft de

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: de Kepler-evaluatie uit de Galileo OS SIS ICD (de vergelijking van Kepler, tweedeharmonische correcties, aardvaste knoop) afzonderlijk geschr. Onafhankelijke referentie (ExternalDataset): RTKLIB 2.4.2-p13 eph2pos ECEF-posities (een onafhankelijke implementatie van hetzelfde ICD-algoritme) voor echte BKG/IGS-uitgezonden records van 2024-09-10, beide vastgelegd met herkomst in tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dit valideert het Kepler-gebruikersalgoritme; de er bovenop toegevoegde correcties langs/dwars/radiaal worden gedekt door hun eigen rijen, en de termen van Liu b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: generatorpolynoom 0x1864CFB, beginwaarde { "0" }, geen reflectie, geen eind-XOR, de controle die het LEO-frame van Kshana over elke voorgaande. Onafhankelijke referentie (ExternalDataset): De controlewaarde uit de CRC-catalogus voor deze parameters (reveng.sourceforge.io CRC-catalogus, CRC-24/LTE-A: breedte { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), die de CRC-24Q-parameters van RTCM { "10403" } en de Galileo OS SIS ICD zijn, en het voorbeeldframe van berichttype { "1005" } afgedrukt in RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> De fitter en trade van de soort <c1/>: een referentiebaan geïntegreerd met zonale J2-J6- of EGM2008-zwaartekracht tot de gekozen graad en weerstand, en een geseede vrije of gestuurde. Onafhankelijke referentie (ExternalDataset): Echte nauwkeurige wetenschappelijke banen als referentie (operationele reduced-dynamic-banen van TU Graz IfG/ITSG, vrij te gebruiken met bronvermelding; SHA-256-waarden in de NOTICE van de fixture) gefit met de set van 16 parameters over bogen van { "20" } en { "30" } min, tegen de statistieken die Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publiceren voor dezelfde satellieten en dagen: RMS langs, dwars en radiaal elk binnen 1.5x (gemeten { "0.804" } tot { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE is de representatiefout van het bericht tegen de referentiewaarheid waaraan het is gefit; fouten in baanbepaling en baanvoorspelling worden niet gemodelleerd. (resultaat <c1/>)

seg-3762de39de07 = De referentiebaan is een numerieke integratie van Kshana (zonale of EGM2008-zwaartekracht, statische exponentiële weerstand), niet de nauwkeurige baan van een echte satelliet; geen derde lichamen, zonnestralingsdruk of getijden. (resultaat <c1/>)

seg-4486dd350b57 = Het binaire formaat is een eigen gedocumenteerde codering van Kshana, gemodelleerd naar de gepubliceerde berichtcomponenten; het is niet de bitindeling van Celeste of enig ander systeem (geen daarvan is openbaar). (resultaat <c1/>)

seg-2a5c1bce8320 = Het blok in RINEX-stijl is een gedocumenteerde extensie van Kshana; RINEX { "4.02" } definieert geen LEO-navigatierecords. (resultaat <c1/>)

seg-642d8f4d60e7 = NeQuick-G-coëfficiënten worden meegedragen en het effectieve ionisatieniveau wordt berekend, maar de NeQuick-integratie van de elektronendichtheid die het in een vertraging omzet is niet geïmplementeerd; de Klobuchar-vertraging wel, geschaald naar de draaggolf met 1/f^{ "2" } zonder correctie voor een satelliet die binnen de ionosfeer vliegt. (resultaat <c1/>)

seg-8ba04a3147bd = De termen met 22 parameters van Liu et al. { "2025" } volgen het gebruikersalgoritme van het artikel (Vgl. 1-7) en de fitstrategie (Sectie { "2.3" }); de cijfers voor SISRE tegen hoogte zijn bepaald met echte nauwkeurige banen, dus deze vergelijking op een door Kshana geïntegreerde baan is MODELLED, niet VALIDATED (de vergelijking met echte banen is tests/leo_navmsg_fit_real_orbit_oracle.rs). (resultaat <c1/>)

seg-b3585c7feb4e = MIXED — VALIDATED bouwstenen, MODELLED resultaten. De SISRE-gewichten reproduceren de gepubliceerde MEO/GEO-tabel (Montenbruck et al. { "2018" }), het gebruikersalgoritme uit de Galileo-ICD reproduceert RTKLIB op echte Galileo-uitgezonden efemeriden, en CRC-24Q reproduceert zijn catalogus-controlewaarde en het RTCM-{ "1005" }-voorbeeldframe. Elk fit-, SISRE-, continuïteits- en kwantisatiecijfer is MODELLED: de representatiefout van een bericht tegen een (resultaat <c1/>)

seg-d6e412aab1b4 = MODELLED: elk fit- en SISRE-cijfer is representatiefout tegen een door Kshana geïntegreerde referentiewaarheid (geen fout in baanbepaling of baanvoorspelling); de vergelijking met Liu et al. (soortencatalogus (<c1/>))

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-d9257241d523 = Onderwerppagina: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Vorige</s1>launch-window

seg-2984c4c69850 = <s1>Volgende</s1>leo-pass
