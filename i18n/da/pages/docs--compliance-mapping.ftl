# docs--compliance-mapping: translations (da)

seg-6555ff9a6d8e = Output

seg-2247a2344710 = Betydning

seg-d6476863f862 = Funktion

seg-ad856ad710eb = Status

seg-8d216d42c776 = Vurdering af tillid til modtagerlog

seg-ff808ce8ec48 = Alternative og diversificerede PNT-kilder

seg-3621a68a508c = Reproducerbar proveniens for kørsler

seg-50fe2a3ff712 = Integritetsmonitorering og beskyttelsesniveauer

seg-554a16dc7965 = Kilde: <c1/>

seg-76db63e8d2de = Købere og modtagerproducenter skal stå til regnskab over for offentlige rammer for robusthed. Denne mappe knytter række for række det, Kshana beregner og registrerer, til disse rammer, og <c1/> udfylder koblingen ud fra de kørsler, du faktisk har.

seg-e22a3aca9550 = <b>Formulering.</b> Output fra Kshana <em>leverer belæg for</em> et krav. De er ikke en bedømmelse eller godkendelse af noget produkt, og ingen af disse filer er en udtalelse fra et vurderingsorgan; det er Kshana ikke. Kravtekst er omskrevet, aldrig gengivet ordret.

seg-2602c3f5aff6 = Ramme

seg-245fe1f87b08 = Fil

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = IMO's vejledning om GNSS-interferens for skibe

seg-f318176b86de = EASA's vejledning om GNSS-interferens for luftfart

seg-7939ac1eea3b = EU's NIS2-direktiv, artikel { "21" }

seg-f2eccc9b815f = EN { "16803" } (betalingsstandard; kun efter del og klausulnumre, der er synlige i kataloget)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (januar { "2023" })

seg-499fc17fb83a = <b>Standardpakker</b> ({ "0.38" }) gør en ramme om til scorede scenarier: hver pakke har scenarier, tærskler fastsat før kørslen og rækker, den leverer belæg for. <c1/> viser dem.

seg-9c0eb89a2fbe = Pakke

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testprofiler for niveau { "1" } til { "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, PNT-databehandling om bord på skibe: nøjagtighedsniveauer og integritet

seg-aa77ffe0acbf = ICAO Doc { "9849" } Appendix F, overvåg, vurder og afbød GNSS-interferens

seg-b9387be0e4f1 = Hver fil oplister sine kildedokumenter med version, URL, læsedato og hvad der blev og ikke blev kontrolleret. Kilderne blev læst den 2026-10-09 (NIST-profilen den 2026-10-18; EASA-bulletinen og katalogsiderne for EN { "16803" } blev kontrolleret igen den 2026-10-10). Hvor en kilde kun kunne læses via et spejl eller en katalogside, siger filen det.

seg-e98e25897176 = Hver test i de tre scorede standardpakker, fra rigtige kørsler af motoren v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } nået, { "1" } ikke nået, { "2" } mangler et input; imo-circ-1575: { "1" } nået, { "4" } ikke nået, { "2" } mangler et input; icao-doc9849-appf: { "6" } nået, { "0" } ikke nået, { "2" } mangler et input. I alt { "13" } nået, { "5" } ikke nået og { "6" } mangler et input, som motoren ikke har (en modtagerlog eller udstyrsdokumentation). Hver tærskel blev fastsat før kørslen; en miss forbliver en miss. En nået tærskel siger, at et modelleret scenarie nåede en angivet tærskel, intet om et produkt. Pakkerne leverer belæg for de rækker, de henviser til; de er ikke en vurdering. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life); det må ikke være det eneste grundlag for nogen navigations- eller sikkerhedsbeslutning.

seg-092dd691ca17 = Rapporten

seg-10fac3e641e0 = skriver <c1/> og <c2/> (<c3/> ændrer navnet). Inputtet er resultatfiler fra tidligere kørsler: en scenariekørsel skriver <c4/> ved siden af <c5/>, og <c6/> skriver sin egen. Typen af hver kørsel læses fra scenariefilen ved siden af resultatet, fra indholdet af et receiver-trust-resultat eller fra en <c7/> på øverste niveau, og skal være en type, motoren kender. Et resultat opføres som ikke brugt, med begrundelsen, og tæller for intet, når dets type ikke kan findes, ikke er en kendt type, eller når den tilhørende scenariefil og resultatets egen <c8/> er uenige. (Resultatets <c9/> og en hash af scenariefilen sammenlignes ikke: motoren beregner den første over sit fortolkede scenarie, og en filhash er over teksten, så de er forskellige størrelser.)

seg-464351dcdcc3 = <b>En typebetegnelse alene er ikke evidens.</b> En kørsel tæller for en funktion kun, når dens resultat også indeholder de felter, den type skriver (for eksempel kræver et <c1/>-resultat sine kvalitetsmål og rækker pr. epoke; et <c2/>-resultat kræver sine stikprøveantal). Felterne er opført i <c3/> (<c4/>), og et resultat, hvor et af dem mangler, tælles ikke med. En hash, der ikke er hexadecimal, rapporteres ikke som en hash. Et receiver-trust-resultat, hvis antal ikke er hele tal, eller hvor antallet af detekterede eller enige overstiger antallet af evaluerbare, udelukkes og opføres som ikke brugt.

seg-5a316d97f37b = For hver række angiver rapporten en af:

seg-2243532bd26b = hver funktion, rækken nævner, har mindst én kørsel i sættet

seg-e905ae20cec1 = nogle har

seg-e23d6dfc4a00 = ingen har

seg-cf223ce076ce = intet output fra Kshana berører rækken

seg-ec76997fb4d4 = Kolonnen med mangler udskrives for hver række, også de dokumenterede: en kørsel, der leverer belæg for en funktion, lader stadig det meste af et krav høre under anden evidens. Rapporten gentager formuleringsreglen i toppen. <c1/> udskriver de statiske tabeller og <c2/> kildelisten.

seg-f1c508a908ad = Receiver-trust-kørsler bidrager også med de antal, de angiver (detekterede hændelser ud af de evaluerbare, enige forudsigelser ud af de evaluerbare). De beskriver den pågældende log, scoret mod hændelser og tolerancer fastsat før kørslen, og rapporteres, som kørslen angiver dem.

seg-662b717575e0 = Kørselstyper

seg-4377e24c36f5 = tillidstilstand pr. epoke fra en rigtig modtagers egen log, alarmtidspunkter og enighed med hændelser fastsat før kørslen

seg-766182e85848 = Jamming: virkninger på linkbudgettet

seg-6bee09017be6 = bærebølge-til-støj-densitet og låsetilstand pr. satellit under en angiven jammer-geometri

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Detektion af spoofing og meaconing

seg-2e4a3355a936 = detektorbeslutninger og detektorens skelneevne under et angivet spoofing-angreb

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = beskyttelsesniveauer, tilgængelighed i forhold til alarmgrænser og resultater af fejldetektion

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover og coasting

seg-a643345646c3 = vækst i positions- eller tidsfejl, mens GNSS er nægtet, i forhold til en angivet tærskel

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = navigations- eller tidsydelse fra kilder, der er uafhængige af det primære GNSS-bånd

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Scoring af robusthed over trusselsensembler

seg-9eef8dd0d9b9 = overlevelses- og robusthedsforhold pr. trusselsvektor over et angivet ensemble, med antagelserne angivet

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = scenariehash, motorversion og seed følger med i hvert resultat, så en kørsel kan gentages

seg-89edc36c3560 = enhver kørsel, hvis resultat indeholder en <c1/>

seg-488aeabdc552 = <s1>Forrige</s1>Kørsel af en modtager mod et scenarie

seg-53a872636d5a = <s1>Næste</s1>US DHS' ramme for robust PNT
