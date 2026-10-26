# docs--compliance-mapping: translations (nb)

seg-6555ff9a6d8e = Utdata

seg-2247a2344710 = Betydning

seg-d6476863f862 = Funksjon

seg-ad856ad710eb = Status

seg-8d216d42c776 = Tillitsvurdering av mottakerlogg

seg-ff808ce8ec48 = Alternative og mangfoldige PNT-kilder

seg-3621a68a508c = Reproduserbart opphav for kjøringer

seg-50fe2a3ff712 = Integritetsovervåking og beskyttelsesnivåer

seg-554a16dc7965 = Kilde: <c1/>

seg-76db63e8d2de = Kjøpere og mottakerprodusenter svarer for offentlige rammeverk for robusthet. Denne mappen knytter det { -brand } beregner og registrerer til disse rammeverkene, rad for rad, og <c1/> fyller ut koblingen fra kjøringene du faktisk har.

seg-e22a3aca9550 = <b>Ordlyd.</b> Utdata fra { -brand } <em>gir belegg for</em> et krav. De er ikke en vurdering eller godkjenning av noe produkt, og ingen av disse filene er en uttalelse fra et vurderingsorgan; { -brand } er ikke et slikt organ. Kravteksten er parafrasert, aldri gjengitt.

seg-2602c3f5aff6 = Rammeverk

seg-245fe1f87b08 = Fil

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = IMO-veiledning om GNSS-interferens for skip

seg-f318176b86de = EASA-veiledning om GNSS-interferens for luftfart

seg-7939ac1eea3b = EUs NIS2-direktiv, artikkel { "21" }

seg-f2eccc9b815f = EN { "16803" } (betalt standard; bare etter del og klausulnumre som er synlige i katalogen)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (januar { "2023" })

seg-499fc17fb83a = <b>Standardpakker</b> ({ "0.38" }) gjør et rammeverk om til scenarioer med poengsum: hver pakke har scenarioer, terskler fastsatt før kjøringen og rader den gir belegg for. <c1/> viser dem.

seg-9c0eb89a2fbe = Pakke

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testprofiler for nivå { "1" } til { "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, databehandling for PNT om bord på skip: nøyaktighetsnivåer og integritet

seg-aa77ffe0acbf = ICAO Doc { "9849" } Appendix F, overvåke, vurdere og redusere GNSS-interferens

seg-b9387be0e4f1 = Hver fil lister kildedokumentene sine med versjon, URL, lesedato og hva som ble og ikke ble kontrollert. Kildene ble lest 2026-10-09 (NIST-profilen 2026-10-18; EASA-bulletinen og katalogsidene for EN { "16803" } ble kontrollert på nytt 2026-10-10). Der en kilde bare kunne leses via et speil eller en katalogside, sier filen det.

seg-e98e25897176 = Hver test i de tre standardpakkene med poengsum, fra virkelige kjøringer av motoren v{ $version } (`kshana standards-pack run`): dhs-rpcf: { "6" } nådd, { "1" } ikke nådd, { "2" } trenger en inndata; imo-circ-1575: { "1" } nådd, { "4" } ikke nådd, { "2" } trenger en inndata; icao-doc9849-appf: { "6" } nådd, { "0" } ikke nådd, { "2" } trenger en inndata. Til sammen { "13" } nådd, { "5" } ikke nådd og { "6" } trenger en inndata som motoren ikke har (en mottakerlogg eller utstyrsdokumentasjon). Hver terskel ble fastsatt før kjøringen; en bom forblir en bom. En nådd terskel sier at et modellert scenario nådde en oppgitt terskel, ingenting om et produkt. Pakkene gir belegg for radene de viser til; de er ikke en vurdering. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en tjeneste for liv og sikkerhet; det må ikke være eneste grunnlag for noen navigasjons- eller sikkerhetsbeslutning.

seg-092dd691ca17 = Rapporten

seg-10fac3e641e0 = skriver <c1/> og <c2/> (<c3/> endrer navnet). Inndataene er resultatfiler fra tidligere kjøringer: en scenariokjøring skriver <c4/> ved siden av <c5/>, og <c6/> skriver sin egen. Typen til hver kjøring leses fra scenariofilen ved siden av resultatet, fra innholdet i et receiver-trust-resultat, eller fra et <c7/> på øverste nivå, og må være en type motoren kjenner. Et resultat listes som ikke brukt, med begrunnelse, og teller ikke med når typen ikke kan finnes, ikke er en kjent type, eller når søskenscenarioet og resultatets egen <c8/> er uenige. (Resultatets <c9/> og en hash av scenariofilen sammenlignes ikke: motoren beregner den første over det tolkede scenarioet, mens en filhash er over teksten, så de er ulike størrelser.)

seg-464351dcdcc3 = <b>En typeetikett alene er ikke evidens.</b> En kjøring teller for en funksjon bare når resultatet også har feltene den typen skriver (for eksempel trenger et <c1/>-resultat kvalitetsmålene og radene per epoke; et <c2/>-resultat trenger antall sampler). Feltene er listet i <c3/> (<c4/>), og et resultat som mangler ett, telles ikke. En hash som ikke er heksadesimal, rapporteres ikke som en hash. Et receiver-trust-resultat der antallene ikke er hele tall, eller der antallet oppdagede eller som stemmer overens overstiger antallet som kan evalueres, utelukkes og listes som ikke brukt.

seg-5a316d97f37b = For hver rad gir rapporten ett av følgende:

seg-2243532bd26b = hver funksjon raden nevner, har minst én kjøring i settet

seg-e905ae20cec1 = noen har det

seg-e23d6dfc4a00 = ingen har det

seg-cf223ce076ce = ingen utdata fra { -brand } berører raden

seg-ec76997fb4d4 = Gap-kolonnen skrives ut for hver rad, også de med evidens: en kjøring som gir belegg for en funksjon, overlater fortsatt mesteparten av et krav til annen evidens. Rapporten gjentar ordlydsregelen øverst. <c1/> skriver ut de statiske tabellene og <c2/> kildelisten.

seg-f1c508a908ad = Receiver-trust-kjøringer bidrar også med antallene de oppgir (hendelser oppdaget av de som kan evalueres, prediksjoner som stemmer av de som kan evalueres). De beskriver den loggen, målt mot hendelser og toleranser fastsatt før kjøringen, og rapporteres slik kjøringen oppgir dem.

seg-662b717575e0 = Kjøringstyper

seg-4377e24c36f5 = tillitstilstand per epoke fra en virkelig mottakers egen logg, alarmtidspunkter og overensstemmelse med hendelser fastsatt før kjøringen

seg-766182e85848 = Jamming-effekter i linkbudsjettet

seg-6bee09017be6 = bærebølge-til-støy-tetthet og låsetilstand per satellitt under en oppgitt jammer-geometri

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Deteksjon av spoofing og meaconing

seg-2e4a3355a936 = detektorbeslutninger og detektorens skjelneevne under et oppgitt spoofing-angrep

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = beskyttelsesnivåer, tilgjengelighet mot varslingsgrenser og resultater fra feildeteksjon

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover og coasting

seg-a643345646c3 = vekst i posisjons- eller tidsfeil mens GNSS er nektet, mot en oppgitt terskel

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = navigasjons- eller tidsytelse fra kilder som er uavhengige av det primære GNSS-båndet

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Robusthetsscoring over trusselensembler

seg-9eef8dd0d9b9 = overlevelses- og robusthetsforhold per trusselvektor over et oppgitt ensemble, med forutsetningene oppgitt

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = scenariohash, motorversjon og seed følger med i hvert resultat slik at en kjøring kan gjentas

seg-89edc36c3560 = enhver kjøring der resultatet har en <c1/>

seg-488aeabdc552 = <s1>Forrige</s1>Kjøre en mottaker mot et scenario

seg-53a872636d5a = <s1>Neste</s1>Rammeverk for robust PNT fra US DHS
