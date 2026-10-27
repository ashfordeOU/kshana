# docs--tutorial-first-orbit: translations (da)

seg-51ae9468b92a = Hvad dette scenarie er

seg-08f3fdc9252a = Læs opsummeringen på én linje

seg-def5271a207d = Hvad testen fastlåser

seg-e5f926d1055b = Faldgruber og enheder

seg-cb457294fc53 = Hvad så

seg-dcb2d0b170c1 = Kilde: <c1/>

seg-f57d8b38bf08 = Tutorial { "1" } — Min første bane: hvor er GPS-satellitterne

seg-1b9e1178555d = <c1/> · <b>Scenarie:</b> <c2/> (undervisningskopi: <a1><c3/></a1>) · <b>Sværhedsgrad:</b> begynder · <b>~{ "15" } min</b>

seg-d065731294a1 = Til sidst har du propageret den <em>virkelige</em> operationelle GPS-konstellation, aflæst dens tilgængelighed og geometri og eksporteret en tabel over, hvor hver satellit faktisk befinder sig i rummet — og du ved, at tabellen er valideret mod en ekstern reference, ikke mod sig selv.

seg-b07bb365235d = GPS-satellitter (Global Positioning System) fortæller en bruger, <em>hvor den er</em>, og <em>hvad klokken er</em>. Før noget af det skal du vide, <b>hvor satellitterne er</b>, og <b>hvor mange af dem en bruger kan se</b>. Det er geometri, og geometrien sætter et gulv for, hvor nøjagtigt du kan positionsbestemmes (præcisionsfortyndingen, dilution of precision eller DOP). Denne tutorial:

seg-dec5079e7715 = tager et ægte Celestrak-udtræk af <c1/> for GPS-konstellationen (2021-07-28, { "30" } satellitter, rigtige two-line elements, TLE'er),

seg-693859c435d8 = propagerer hver satellit med den validerede SGP4/SDP4-model (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = finder ved hvert tidstrin ud af, hvilke satellitter en bruger i lav jordbane kan se (sigtelinje, jordens afskærmning og en elevationsmaske på { "5" }°),

seg-605c40b73e96 = omsætter geometrien til en <b>PDOP</b> (position dilution of precision) og en <b>positionsnøjagtighed</b>, og

seg-356e96d219b5 = eksporterer satellitternes faktiske jordcentrerede, jordfaste (ECEF) positioner til en SP3-fil (Standard Product { "3" }, det præcise baneformat fra International GNSS Service, IGS; GNSS er Global Navigation Satellite System).

seg-ff1666fe175e = Rygraden er: <b>TLE → SGP4-propagering → ECEF pr. epoke → synlighed → antal synlige satellitter → PDOP → positions-sigma = PDOP · σ_UERE</b>, hvor σ_UERE er brugerens ækvivalente afstandsfejl (user equivalent range error, 1-σ-afstandsfejlen pr. satellit).

seg-379da723ae57 = Eller åbn <a1>Studio i browseren</a1> og vælg bane-scenariet.

seg-441743833f1e = Den deterministiske kørsel (seed = { "17" }) udskriver:

seg-918a30fea48a = Felt for felt:

seg-375fad797dcf = <b><c1/></b> — scenariets hash på 12 tegn. Den er et fingeraftryk af de præcise inputs (seed, tærskler, modelparametre, TLE-blokken). Ændrer du et input, ændres den; holder du dem ens, gengiver du kørslen bit for bit. Den samme hash er stemplet i diagrammets fod og i resultatfilen i JSON (JavaScript Object Notation).

seg-133711d1ad9f = <b><c1/></b> — af de { "361" } tidstrin har brugeren en brugbar positionsbestemmelse i { "345" } af dem ({ "95.6" } %). Kørslen er et gennemløb på { "12" } t ({ "43,200" } s) med et trin på { "120" } s.

seg-a500c0473784 = <b><c1/></b> — den bedste (laveste) præcisionsfortynding for position over gennemløbet. En PDOP nær { "1" } er fremragende geometri; jo lavere, desto bedre.

seg-98a24f0170d2 = <b><c1/></b> — den bedste positionsnøjagtighed: <b>positions-sigma = PDOP · σ_UERE</b>. I dette scenarie er <c2/>, så de to tal er her <em>numerisk lige store</em> — men reglen er PDOP × UERE, <b>ikke</b> “position = PDOP.” Med en UERE på { "3" } m ville positions-sigma være ca. { "3.2" } m. (Se faldgruben til sidst.)

seg-410081c6dcab = Urtallene (<c1/>, <c2/>, <c3/>, <c4/>) følger med, fordi bane-pakken også lader et ur køre gennem gennemløbet; de er omdrejningspunktet i <a1>Tutorial { "2" }</a1>, ikke i denne. (<c5/> viser <c6/>, fordi der ikke er konfigureret noget angreb.)

seg-95ccef0d94ae = Geometriblokken i JSON indeholder de underliggende tal:

seg-89cb7db9b9eb = Hvor er satellitterne? (udbyttet)

seg-81678afa0cee = Geometrien er god, <em>fordi</em> satellitterne virkelig befinder sig i GPS-skallen. Bevis det — eksportér deres jordfaste positioner:

seg-1452dfac9e06 = De første tre satellitter ved det første sampletrin, ECEF i km (SP3-filen har en fjerde kolonne til ur, skrevet som markøren “ingen værdi” { "999999.999999" }):

seg-4fd0f95da0cf = Tag PG01's geocentriske radius:

seg-cb02d7c01561 = Den ikke-cirkulære uafhængige reference: er det virkelig en GPS-bane?

seg-a7c478360464 = En tutorial, der kontrollerer motoren mod sig selv, beviser ingenting. Her er det eksterne, <em>ikke-cirkulære</em> ankerpunkt for hver påstand ovenfor.

seg-eec62069a957 = <b>{ "1" }. Satellitterne ligger på den virkelige GPS-skal i mellemhøj jordbane (MEO).</b> GPS's nominelle halve storakse er <b>a = { "26,560" } km</b>, højde ≈ { "20,180" } km over jordens middelradius på { "6,378" } km (IS-GPS-200, GPS-grænsefladespecifikationen; GPS Standard Positioning Service (SPS) Performance Standard, US Department of Defense (DoD); Misra & Enge, <em>Global Positioning System</em>, 2. udg.). PG01's øjeblikkelige radius på <b>{ "26,480.9" } km</b> ligger få hundrede km fra <c1/> — præcis hvad en virkelig GPS-excentricitet (~{ "0.005" }–{ "0.02" }) giver. Testen <c2/> hævder <c3/> mod dette offentliggjorte <c4/>, som er <b>eksternt i forhold til Kshana</b>.

seg-a052774de08f = <b>{ "2" }. Gennemløbets længde er ét GPS-omløb.</b> Keplers tredje lov giver perioden <c1/> med <c2/> og <c3/> (World Geodetic System { "1984" }, WGS-84; teknisk rapport NIMA TR8350.2 fra National Imagery and Mapping Agency): <c4/>, et halvt stjernedøgn. Scenariets varighed på { "43,200" } s (“~ét GPS-omløb”) stemmer med det inden for { "0.3" } %, og GPS-sporet på jorden gentages hvert stjernedøgn (to omløb), ifølge IS-GPS-200.

seg-067fb466e396 = <b>{ "3" }. De propagerede positioner er validerede, ikke blot selvkonsistente.</b> SGP4/SDP4-propagatoren, der frembragte denne ECEF-tabel, stemmer med <b>alle { "666" } verifikationsvektorer i AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 med en værste afvigelse på { "4.12" } mm</b> (<c1/>, <a1><c2/></a1>) og stemmer med den uafhængige <c3/>-crate på under en mikrometer. Tabellen, du eksporterede, er altså kontrolleret mod en ekstern referenceimplementering, ikke mod Kshanas egen regning.

seg-652ec3b3d3b8 = <b>En note om datoerne i SP3.</b> SP3-epokens header viser en pladsholderdato (2000-01-01); propageringen kører i virkeligheden fra hver TLE's egen epoke ({ "2021" }). Læs tabellen som “ECEF-positioner ved det første sampletrin”, ikke “den { "1" }. jan { "2000" }.”

seg-74dcb96a27a9 = <c1/> gør hvert tal ovenfor til en CI-kontrakt:

seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (fordi <c4/>), <c5/>, og opsummeringen indeholder <c6/>.

seg-241d75b1502b = <c1/> — PG01's radius ligger i GPS-skallens bånd, kontrolleret mod det offentliggjorte <c2/>.

seg-34328f4f148b = Hvis motoren nogensinde holder op med at frembringe en rigtig GPS-skal, bliver buildet rødt.

seg-3c23c11911cb = <b>Positions-sigma er PDOP × UERE, ikke PDOP.</b> De to er kun lige store, <em>fordi</em> <c1/> her. Ændr UERE, og de skilles.

seg-6bb2f31c15dc = <b>Tidsangivelserne er i nanosekunder</b>, positionstallet i meter. Bland dem ikke sammen.

seg-5bc68d0c144d = <b><c1/> er kvantiseret til tidsgitteret</b> (en nedre grænse ved tidsgitterets trin). I dette gennemløb har brugeren stort set altid en positionsbestemmelse, så holdover er { "0" } s (intet udfald at holde igennem) — det er det <em>gode</em> tilfælde.

seg-9c36a5c64af5 = Skærp eller udvid elevationsmasken (<c1/>) og se tilgængeligheden ændre sig — det er en øvelse på niveau 2.

seg-b0222934237e = Skift til et nyt TLE-udtræk med <c1/> (niveau 2, “brug friske data”).

seg-e487166204f8 = Gå videre til <a1>Tutorial { "2" } — Ur-holdover</a1>, hvor GNSS-signalet bliver <em>taget væk</em>, og uret om bord må holde sig selv i gang.

seg-795315608752 = <s1>Forrige</s1>Tutorials

seg-97ca5a3cc77e = <s1>Næste</s1>{ "2" } · Ur-holdover
