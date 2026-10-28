# docs--changelog: translations (da)

seg-9a2a5f0a8a02 = Solsystemet

seg-20db2c79b998 = Valideret

seg-a20b4a6e8f53 = chipskala-atomur

seg-49a994d77d2f = temperaturkompenseret krystaloscillator

seg-2247a2344710 = Betydning

seg-5770537524d3 = Område

seg-40d4fc0d3922 = Kilde: <c1/>

seg-7333b85d448f = Alle væsentlige ændringer i Kshana dokumenteres her.

seg-bbc8f38627f1 = Formatet bygger på <a1>Keep a Changelog</a1>, og dette projekt følger <a2>Semantic Versioning</a2>. Så længe projektet er før 1.0, kan det offentlige skema for scenarier og resultater stadig ændre sig; brydende ændringer fremhæves udtrykkeligt.

seg-985f7b4c001a = Ikke udgivet

seg-a2f583aadd0b = Ingen nye funktioner: én rettelse af kommandolinjen, opdateringer af afhængigheder i værktøjerne til krydsvalidering og dokumentation. Motorens resultater er uændrede fra { "0.38.0" }.

seg-c9a8a5898ced = Rettet

seg-3cc8ba4d1be6 = Kommandolinjen afslutter stille med status { "141" }, når dens standard output lukkes (<c1/>), i stedet for at gå i panik med "failed printing to stdout: Broken pipe". { "141" } er { "128" } plus SIGPIPE, den status en shell rapporterer for <c2/>. Kun en lukket pipe håndteres: en fuld disk eller enhver anden skrivefejl rapporterer sig stadig selv, og et levende feed, der skriver til en lukket socket, får stadig sin skrivefejl. <c3/> lukker læseren, før programmet starter, så den første skrivning fejler i hver kørsel.

seg-2a47e785cc1d = Opdateringer af afhængigheder i værktøjerne til krydsvalidering (<c1/>); ingen ændringer af udleverede crates, wheels eller pakker.

seg-9df898fb24be = <c1/> { "0.9.10" } til { "0.9.11" } (RUSTSEC-2026-0186) i ANISE-krydskontrollens låse (<c2/>, <c3/>); låsene synkroniserer også igen den lokale stiafhængighed <c4/>.

seg-835e9d6058f8 = <c1/> { "12.3.0" } til { "13.0.0" } og <c2/> { "2026.7.22" } til { "2026.10.19" } i miljøfastlåsningerne for de uafhængige referencer (<c3/>, <c4/>): de rettede udgivelser for otte pillow-sikkerhedsadvarsler og én certifi-sikkerhedsadvarsel.

seg-902fc421a851 = <c1/>, README og denne fil opregner hver kshana-bench-tærskel, der er NOT MET, som registreret i <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } mod mindst { "0.80" } på testopdelingen), <b>D1</b> (største afstand { "0.0301" }) og <b>opgave (b) R1</b> (videreført, ikke kørt igen). Ingen tærskel er lempet.

seg-44d9c9622c24 = Gennemgang af README's fuldstændighed: en indholdsfortegnelse; scenarietyperne ordnet under familier, hver med en side under <c1/> (motorens beskrivelse og felter, input og resultater fra en eksempelkørsel, registerrækkerne og de uafhængige referencer, de begrænsninger, som kørslens rapport angiver, og det diagram, som motoren skriver), et kontaktark pr. familie, alt indekseret af <c2/>; hver kommando i <c3/>; hver flade, plugin-kommando, skill og Studio-side i <c4/>; hvert funktionsområde i <c5/>; indlejrede Mermaid-diagrammer (systemoversigt, flader, indre sløjfe, receiver trust, laboratoriets rundtur, Studio, test- og udgivelsesforløb, modulkort, distribution). Skrevet af <c6/>, <c7/> og <c8/>; revideret af <c9/>; bevogtet af <c10/>, som også fastlåser hver posts beskrivelse og felter til motoren.

seg-b953186d5726 = <c1/>: gengiver et Mermaid-diagram til SVG og PNG på Linux og opdaterer gengivelsesregistret.

seg-68e19f94faed = README: figurerne for rumbrugere og Månen brugte stier relative til <c1/>, så de blev ikke indlæst fra README; ét link pegede på <c2/>.

seg-850e1574e2d6 = Fjernede to forældede, håndkopierede diagramfiler (<c1/>, <c2/>), som ingen side brugte, og som ikke længere stemte med motoren; <c3/> indeholder de aktuelle diagrammer.

seg-033d52126d8a = Tilføjet

seg-090bf5ae96b6 = <b>GNSS ud over konstellationen (<c1/>).</b> En ny scenarietype for rumfartøjer over, omkring og forbi GNSS-banerne (<a1><c2/></a1>): tilgængelighed af ét og fire signaler, varighed af udfald, C/N0, DOP og hovedlobe mod sidelobe-links for GPS, GLONASS, Galileo, BDS, QZSS og NavIC på en skal eller langs LEO-, MEO-, GEO-, HEO- og månetransferbaner; sendemønstre fra hæfte, parametriske eller leveret af brugeren; en model for ionosfære, plasmasfære og atmosfære med grænsestråle; en modtagerudformning til svage signaler; et GNSS-udvidet Kalman-filter ombord til HEO og månetransfer; og relativ navigation i formation. Sammenlignet med ICG's Space Service Volume-hæfte under en præregistrering committet før kørslen: konstanterne for minimum udstrålet effekt og månetærsklen stemmer, de øvrige tærskler er ikke nået under den præregistrerede læsning (næsten alle på grund af hæftets inkonsistente GLONASS-strålevinkel), og den parametriske sidelobe-stedfortræder gengiver ikke de målte GPS-panelmønstre. Alt forbliver MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Månens bane og overflade som navigations- og geodætisk infrastruktur (<c1/>).</b> En ny scenarietype med fem studier valgt med <c2/> (<a1><c3/></a1>): konsistens af en banebestemmelse ombord med Jord-GNSS i en næsten retlinet halobane mod en uafhængig bestemmelse fra jorden af afstand og afstandshastighed; fælles dobbeltdifferentieret bærebølgefase fra overfladestation og orbiter med LAMBDA-heltalsfiksering; Fisher-information for det syv-parameters månedatum med og uden afstande mellem orbiter og overflade; forskelle mellem teknikker for GNSS, VLBI og laserafstandsmåling mod den lokale tilknytning; og følsomhed over for h2, k2, l2 og den fysiske libration. MODELLED, med ILLUSTRATIVE inputdata: numerikken kontrolleres mod uafhængige numpy- og scipy-programmer, og intet sammenlignes med en måling af en månestørrelse. Tærsklerne blev fastsat i <c4/> og to offentliggjorte ændringer. Tre er NOT MET, og hver er fastlåst af en test, der hævder afvigelsen: C3 (en indlagt kraftfejl detekteres ikke med den præregistrerede rate), Q3 (den bootstrappede succesrate afviger fra den uafhængige numpy-reference med { "1.7e-6" } mod en tærskel på { "1e-9" }, fra LAMBDA's tilnærmelse af normalfordelingens CDF) og sporhalvdelen af G3 (tilføjelse af en afstandsfamilie sænker ikke altid pseudoinversens spor). Resten er nået (<a2><c5/></a2>).

seg-022859135e79 = <b>En sjette artikel i forskningstabellen.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) viser, at præcisionsfortynding er udefineret for cislunar tracking kun med afstand, og bruger i stedet observabilitets-Gramianen på fire plane fjerne retrograde baner: kun afstand har rang { "2" } af { "4" } i et øjebliksbillede og kræver en bue på omkring { "2.09" } t, afstandshastighed (Doppler) giver rang { "4" } øjeblikkeligt, og samtidig estimering af en station med satellittilstande og ure forbliver rangdeficient med én uden en ekstern interferometrisk observabel. Dens tal genskabes af typen <c1/> (<c2/>); <c3/> tester tærsklen med en uafhængig estimator. README's forskningskort, README'erne for crates, npm og PyPI og generatoren bærer den.

seg-d74a1b2dcb38 = Den neutrale dommer, gjort målbar.

seg-bf568567fe06 = <c1/> læser det offentliggjorte NPRA Jammertest-katalog og den offentliggjorte transmissionsplan som planlagt reference (katalog-id'er bevaret), og <c2/> scorer en modtagerlog mod den pr. test (detektionslatenstid, oversete alarmer, falske alarmer, tid til genopretning), eventuelt som en signeret bevispakke (<a1><c3/></a1>). Scoringstærsklerne blev præregistreret før enhver scoret kørsel (<c4/>). På JammerTest-datasættet for { "2024" } (hentet, aldrig medleveret) slog den præregistrerede regel om minimumsdata fejl både i den første kørsel og i revisionen af datahåndteringen, så ingen tærskel kan vurderes, og intet påstås; begge kørsler er registreret og fastlåst. MODELLED: planen er datasættets loggede vinduer, ikke optagne tidspunkter for udsendelse. NMEA-sættet fra SimulaMet for { "2025" } er ikke tilpasset (ingen licens angivet på dets side).

seg-0a2bcad8d645 = <b>Modtagerens egne flag ved siden af Kshanas.</b> UBX-NAV-STATUS <c1/> og UBX-SEC-SIG læses ind i <c2/> ved hver epoke, og sammenligningen <c3/> i resultatet stiller dem over for Kshanas monitorer (begge, kun modtageren, kun Kshana, ingen af dem); den udløser ingen alarm og ændrer ingen score. En Septentrio SBF-læser (PVTGeodetic, MeasEpoch, RFStatus, skrivebeskyttet, på den MIT-licenserede crate <c4/>) og <c5/> (et serielt eller USB NMEA-feed, skrivebeskyttet; det skriver aldrig til en modtager) kommer til.

seg-90d9927fe3e2 = <b>Tidssynkronisering og hardwaresikkerhed</b> (<a1><c1/></a1>, <a2><c2/></a2>). Scenarietypen <c3/> scorer en holdover-test af et tidssynkroniseringssystem (GNSS fjernet af operatøren, holdover, genopretning) ud fra en målt tidsfejlsoptegnelse, målt mod ITU-T-masker fra offentlige tabeller. <c4/> læser logs fra linuxptp (<c5/>, <c6/>, <c7/>) og chrony (<c8/>, <c9/>). <c10/> skriver ION GNSS SDR-metadata, og <c11/> overvåger en SigMF-optagelse, mens den vokser (kun modtagelse). <c12/> får NIST IR 8323r1 Foundational PNT Profile ({ "15" } parafraserede rækker, leverer belæg for). En bevispakke kan registrere operatørens <c13/> i sit signerede manifest, aldrig verificeret; hardwaretrinene { "0" } til { "4" } og de juridiske noter findes i <c14/> (afventer juridisk gennemgang). Der findes ingen sendesti af nogen art.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): faste opgaver, opdelinger og målinger til GNSS-interferensdetektion på modtagerlogs (JammerTest { "2024" }) og IQ, forudsigelse af holdover for tidssynkronisering (IGS-ure) og optimismegabet uden for fordelingen; opdelingsmanifester med fastlåste hashes og hentescripts (ingen data medleveret), et tilbageholdt datasæt forseglet ved commit og afsløring, et skema for resultatfiler og en statisk leaderboard-side. Baselines under tærskler præregistreret i <c4/>: scorertærskler nået, C1 til C3 nået, D2 nået; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } mod mindst { "0.80" } på testopdelingen), <b>D1 NOT MET</b> (største afstand { "0.0301" }) og <b>opgave (b) R1 NOT MET</b> (videreført, ikke kørt igen), hver fastlåst (<c6/>). Hver score er MODELLED. Python <c7/>, <c8/>; WebAssembly det samme; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Interferensobservatorium</b> (<c1/>, <c2/>, <a1><c3/></a1>): en reproducerbar daglig GeoJSON, PNG og hændelsesrapport i JSON med tre tilstande (forringet, ikke forringet, ikke observeret), en mindsteforsinkelse på { "24" } t, celler på { "0.5" } grader eller grovere, ingen årsag tillagt og OpenSky-data afvist; et følsomhedsstudie af de præregistrerede parametre; et 30-dages baltisk bagkatalog fra adsb.lol.

seg-497ae18bfb03 = <b>Maskin- og sensorinput til <c1/></b> (<a1><c2/></a1>). Nye <c3/>-værdier, alle skrivebeskyttede, MODELLED, med selvskrevne fixtures og ingen data medleveret: <c4/> (RTKLIB <c5/>-løsningsfiler), <c6/> (OEM7 ASCII og binær <c7/>, <c8/> C/No og <c9/>; modtagerens jammerflag bliver epokens <c10/>, stillet over for Kshanas alarmer af sammenligningen <c11/>), <c12/> (MSM4 og MSM7 C/N0 for GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou og NavIC; opbygning fra de BSD-licenserede pyrtcm-tabeller, hvis meddelelse står i <c13/>, ikke fra RTCM-standarden) og <c14/> (GNSS-SDR Monitor- og PVT-monitor-meddelelser som JSON-linjer, videresendt af <c15/>).

seg-22e8b434782f = IMU-logs som en anden sensor.

seg-5491196d6421 = <c1/> (<c2/> eller <c3/>) integrerer gyroets yaw-rate til den heading, som monitoren <c4/> læser; inline på alle flader og båret med gennem bevispakker. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, plugin <c9/>, en JetBrains-handling) tilpasser accelerometerets og gyroets parametre for scenarierne <c10/> og <c11/> ud fra en stationær log ved Allan-deviation og udskriver en <c12/>-tabel med logens SHA-256 i dens proveniens.

seg-f48fdf6252cd = <b>Integrationer:</b> en ROS { "2" }-pakke (<c1/>: NavSatFix og <c2/> ind, tillidsemner ud; dens ROS-frie bro er testet mod den rigtige motor, selve noden er ikke kørt på en levende ROS-graf), en <c3/>-bro (<c4/>, MIT-afhængighed, valgfri) og et GNSS-SDR-relæ.

seg-1a8727ad42bb = <b>Home Assistant MQTT-eksport</b> til tillidstelemetri: <c1/> og <c2/> (discovery-meddelelser og et JSON-tilstandsdokument; kun udgivelse, ingen legitimationsoplysninger eller TLS), og <c3/> som tekst i Python, WebAssembly og MCP.

seg-f1cb2c2881c9 = Syv MODELLED registerrækker for ovenstående. Intet her er VALIDATED: ingen optagelse fra en rigtig modtager, basestation, IMU, GNSS-SDR-kørsel, ROS-graf eller MQTT-broker blev læst.

seg-12c7a28c80b5 = <b>Optisk linkmargin over tid.</b> Typen <c1/> tager en tabel <c2/> til-valg (<c3/>, <c4/>, <c5/>) og skriver så også pr. sted én seedet realisation af den angivne stedmodel gennem tiden: skyepisoder, en flydende vandsøjle pr. episode, én gamma-gamma-scintillationsprøve pr. trin og ud fra dem linkmarginen, sky- og scintillationsfades og flaget for link oppe, med den realiserede tilgængelighed, skyandel, antal udfald og længste udfald. MODELLED (ét træk fra modellen, ikke klimaet; ingen ekstern uafhængig reference). Uden tabellen er resultatet dokumentet for { "0.37" }. De to medfølgende optiske scenarier bærer tabellen ({ "336" } t, { "600" } s, seed { "37" }). Tærskler præregistreret i <c6/> før den første kørsel.

seg-78524dbb3bd2 = Specifikation af testbetingelser og laboratoriets rundtur.

seg-fbf034925641 = <c1/> offentliggøres som <a1><c2/></a1> med et JSON Schema og får <c3/>. <c4/> skriver også <c5/>. <c6/> bygger en signeret pakke, der forbinder scenariets hash, de angivne betingelsers hash, modtagerlogens hash og scoren mod de angivne hændelser, og afviser betingelser, der ikke stemmer med scoringshændelserne. Gennemarbejdet eksempel med gps-sdr-sim, der kun skriver en fil; afspilning er operatørens ansvar og automatiseres aldrig. Python <c7/>, MCP <c8/>, plugin <c9/>.

seg-8bda4472d561 = <b>Standardpakker</b> (<c1/>, <c2/>): testprofilerne i DHS' Resilient PNT-rammeværk for niveauerne { "1" } til { "4" }, IMO MSC.1/Circ.1575's nøjagtighedsniveauer og integritetsvurdering samt ICAO Doc { "9849" } Appendix F overvågning, vurdering og afhjælpning, hver et sæt scenarier scoret mod tærskler fastsat før kørslen, med de compliance-report-rækker, som de leverer belæg for. Afvigelser er registreret og fastlåst: DHS L4-T1 og de fire IMO-nøjagtighedstest. Doc { "9849" } selv blev ikke læst (betalt); ICAO-pakken følger ICAO's egen præsentation af RFI Mitigation Plan. <c3/> får et afsnit om standardpakker. Alle MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): AFS-I Gold- og AFS-Q Weil-koder for PRN { "1" } til { "210" }, signalerne <c2/> og <c3/> i <c4/>, SB1 BCH-koden, CRC-24Q og interleaver samt <c5/> (<c6/>, <c7/>, <c8/>), fastlåst til LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januar { "2025" }). Koder VALIDATED mod dokumentets trykte tabeller (som det markerer TBC); én trykt tertiærkolonne (PRN { "147" }) er sandsynligvis en trykfejl, og afvigelsen er fastlåst. LDPC-kodning af underrammerne { "2" } til { "4" } er ikke implementeret.

seg-5a5720500b6d = <b>Kursusnotebooks</b> (<c1/>): jamming, spoofing, holdover, integritet, OSNMA og interferenskort, hver med øvelser.

seg-3d543433051c = <b>EU-US WG-C ARAIM Milestone { "3" } studie af maksimal URA</b> (<c1/>, <c2/>), der erstatter den tilbagetrukne "Table A-3"-plan; MODELLED under angivne afvigelser.

seg-4f1f786e2658 = <b>Udkast til ejerens godkendelse</b> under <c1/>: JOSS-artikel, ændring af TSC-charteret, proces for registret over uafhængige referencer og et forslag om opdeling af <c2/>. Intet der er vedtaget.

seg-49a758039871 = <b>Studio-visninger for funktionerne i { "0.38" }</b> (kshana.dev/studio/). Bro-afspilning (to syntetiske kørsler på ét ur: spor, tillidsscore, de satellitter, som loggen hører, og dommen, med modtagerens egne flag ved siden af Kshanas alarmer); Optisk PNT (de to scenarier <c1/>, med en til-valgt seedet realisation af <c2/>, MODELLED); Holdover-test (resultatet af <c3/> målt mod ITU-T-masker, tegnet ud fra resultatets eget <c4/>); en viser for interferensobservatoriet, der åbner de filer, du selv har produceret, og ikke leverer nogen; på siden Værktøjer en Jammertest-scorer, en IMU-tilpasning og MQTT som telemetriformat; og i Tillid en vælger af logformat (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) med en valgfri IMU-fil. Hver visning læser filer i browseren og uploader intet; hvert tal bevarer den mærkat, som registret har for det, og hver bærer den vejledende erklæring. Webstedssiden <c6/> viser fragmentet <c7/>.

seg-91f6beb29f8e = <b>Issue #36: byte-nøjagtige pin-lag.</b> Byte-nøjagtige pin-lag kører kun på en vært, der er erklæret som baseline (<c1/>, sat af <c2/>), ikke på hver Apple-silicon-Mac, fordi Apples matematikbibliotek er forskelligt mellem macOS-udgivelser; det portable lag kører overalt, og <c3/> forhindrer, at et byte-nøjagtigt lag igen bliver gated alene på platform. Sammenligningerne med de uafhængige referencer består selv på macOS. Ingen literal blev taget om, og ingen tolerance blev ændret. <c4/> og <a1><c5/></a1> beskriver, hvordan man triagerer en forskel; <c6/> er en manuel og ugentlig diagnostik, ikke en gate.

seg-15070f7dcc0a = <b>CodeQL: et ikke-forankret mønster i Studios trust-open-hjælper</b> matcher nu hele headeren (<c1/>).

seg-56856063519f = <b>CI: runnerens disk.</b> Jobbet <c1/> bygger dev- og testprofilerne uden fejlfindingsinformation, så linkning ikke længere fylder disken.

seg-38c59868835e = <b>Kildekontroller.</b> Hver kildefil, der indeholder testfixtures med pins, erklærer sit pin-omfang, og de tests, der skriver midlertidige filer, bruger en unik sti pr. kald, så parallelle kørsler ikke kan støde sammen.

seg-884f693585fa = <b><c1/></b> er genskabt for det valgfrie felt <c2/> i optical-atmosphere.

seg-e16d328f3967 = <b>JetBrains-plugin: ingen brug af forældet platform-API eller API planlagt til fjernelse.</b> IntelliJ Plugin Verifier (<c1/>) mod IntelliJ IDEA build { "263" } ({ "2026.3" }: { "263.6800.24" } og { "263.7031.23" }) fandt ét forældet kald, <c2/>, i Insert Example; den åbner nu den nye fil med <c3/>. Pluginnet er kompatibelt med og rent på { "2024.3" } (since-build, uændret) og begge { "263" }-builds. CI kører nu <c4/> og slår fejl ved kompatibilitetsproblemer og ved enhver brug af API planlagt til fjernelse.

seg-07ce053c906a = <b>Optisk PNT gennem atmosfæren</b> (scenarietypen <c1/>, <a1><c2/></a1>, designnotat <c3/>). For et optisk link og et sæt jordstationer rapporteres det bølgelængde- og elevationsafhængige tab i klar luft, turbulenstilstanden efter Hufnagel-Valley (Rytov-varians, scintillationsindeks, gamma-gamma-fades, aperturmiddelværdi), tilgængeligheden mod linkmarginen ud fra et angivet skyklima, den margin, der skal til for måltilgængeligheder, og det loft, ingen margin kan løfte, fordelingen af udfaldsvarighed, tids- og afstandsfejlen pr. udfald gennem urets holdover-model, afstandskorreleret stedsdiversitet og hvad-hvis-gevinster ved en ændring af bølgelængden, en større apertur, adaptiv-optik-reduktion af scintillation og ekstra margin. <c4/> får et atmosfærebevidst budget; uden et er dets output bit-identisk med { "0.36" } (tærskel A5). To medfølgende scenarier bærer ILLUSTRATIVE skyklimaer. MODELLED: tre registerrækker. Numerikken når tærsklerne A1 til A6, præregistreret i <c5/>, mod et uafhængigt mpmath-program; det kontrollerer implementeringen af de angivne formler, ikke atmosfæren, og ingen målt tilgængelighedsoptegnelse er sammenlignet, så ingen række er VALIDATED. Tærskel A4 blev først overskredet med { "3e-9" }, fordi den normale CDF, der blev brugt, var en tilnærmelse på { "1.5e-7" }; CDF'en blev udskiftet, og tærsklen blev stående, som den var registreret. Native og WebAssembly-builds returnerer byte-identiske dokumenter for begge medfølgende scenarier (A7, kørt på integrationscommit { "0.37.0" }).

seg-eb589aff44ad = <b>Detektions-ROC for IQ-monitorerne</b> (PRO-32, <a1><c1/></a1>). En kampagne med monitorer gemmer hver teststatistiks maksimum over vinduer med angivne hændelser (positive) og flisebelagte vinduer uden for hændelserne (negative, <c2/>). Rapporten samler dem pr. alarmtype i en ROC med dens AUC og driftspunktet ved den konfigurerede tærskel, som <c3/> og et rapportafsnit. På syntetiske kampagner er tilfældighedskontrollen nået. Tærsklen for C/N0 AUC ({ "0.95" }) er ikke nået ({ "0.79" }), fordi de negative vinduer lige efter en hændelse arver CUSUM's henfald fra detektionen; dette er registreret. MODELLED.

seg-d25a34e23f1a = <b>IQ-monitorer i laboratoriets afspilningskampagne</b> (PRO-31, <a1><c1/></a1>). En valgfri tabel <c2/> i en kampagnefil kører IQ-monitorerne i runnerens enkelte gennemløb: effekt og spektral efter hver front-end-kæde og C/N0, SQM og lås pr. trackede kanal. Deres alarmer scores mod de angivne hændelser: detekteret eller misset, tid til detektion og falske alarmer pr. time eksponering. Hver tests tal for falsk alarm i lukket form er angivet, herunder et nyt tosidet gaussisk tal for SQM-testene (<c3/>). Uden tabellen ændres intet. På syntetiske kampagner er tærsklerne for falsk alarm for effekt og SQM og for falsk alarm for C/N0 nået; { "18" } af { "18" } dæmpninger detekteres, men grænsen for tid til detektion, som pr. konstruktion ligger under én detektorsample, er ikke nået og er registreret. MODELLED; registerrække "IQ monitors scored in lab-replay campaigns".

seg-8eb0f650065e = <b>Laboratorietilpasning ud fra IQ-kampagner, opfølgning</b> (<c1/>, CI-job <c2/>). Den tester de to hypoteser, som §{ "13.6" } i <c3/> lod stå åbne, mod tærskler præregistreret ved 1e532f84. Den tilføjer to syntetiske kampagner: S, med et trinvist J/S (seed 2026_1014), og R, en ny rampe (seed 2026_1015). Resultaterne står i <c4/>.

seg-ce60405d0005 = S1 nået: med hvert J/S-niveau holdt konstant genfindes <c1/> inden for +{ "0.185" } dB. Rampekampagnernes fejl på −{ "1.1" } dB er estimatorens forsinkelse.

seg-ea9f206c2999 = S2 ikke nået, fastlåst af en test, der hævder afvigelsen: (d) som skrevet på den trinvise kampagne holder for trackingsløjfemodellen ({ "0.45" } dB), men ikke for den empiriske ({ "6.42" } dB).

seg-fab0653558e4 = R1 nået: på den nye rampekampagne ligger (d) med de tilpassede dwell-tider for tab plus hver hændelses rampehastighed inden for { "1" } dB for begge modeller.

seg-24c6725c2c7d = Afvigelserne for (a′) og (d) gentages på R.

seg-7cbbce356973 = En kampagne kan nu angive sit J/S som en <c1/>-profil i testharnessen.

seg-34007ba58a9f = Ingen dom i §{ "13" } ændres, og registerrækken forbliver MODELLED.

seg-df2c3f2532d6 = <b>Begrænset FLL-indfangning, til-valg</b> (DS-LOOP-05): en ny nøgle for sløjfeudformningen <c1/> (s), Rust <c2/>. Under <c3/> gennemtvinger den FLL-til-PLL-overdragelsen efter så lang tid, uanset PLI. Ikke sat som standard, og så uden for udformningens hash; standardudformningen og dens hash er uændrede.

seg-ae2794b2d3d5 = Kontrolleret mod tærskler præregistreret ved 58789af0, på indlagt reference. Kontrollen er nået: standarden overdrager aldrig i { "9" } af { "10" } seeds ved { "33" } dB-Hz.

seg-6d9483874b35 = Ikke nået: med en begrænsning på { "1.0" } s fastholder { "16" } af { "20" } kørsler låsen ved { "33" } dB-Hz og { "8" } af { "20" } ved { "31" } dB-Hz; de øvrige veksler mellem tvungne overdragelser og FLL'ens tilbagevenden. Fasejitteren er { "1.8" }× PLL alene ved { "33" } dB-Hz.

seg-deeefaf50e3e = Indfangningsgulvet på ca. { "35" } dB-Hz forbliver standardens dokumenterede grænse.

seg-780de73c01e1 = MODELLED; registerrække "Begrænset FLL-indfangning under standardudformningens gulv for FLL-til-PLL-overdragelse (til-valg)".

seg-ace6b53749bd = <b>Akkvisitionshysterese og front-end-kvantisereren i jamming-typen</b> (CAP-06c): to valgfrie sektioner for et <c1/>-scenarie.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, ved eller over trackingtærsklen) og <c3/> (s, standard { "0" }). En satellit akkvireres ved eller over akkvisitionstærsklen, når den har været uakkvireret i forsinkelsen. Den fastholdes, så længe den er ved eller over trackingtærsklen. Output: <c4/> (sand/falsk), <c5/> (antal) og <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> ({ "1" } til { "16" }) og <c3/> (MHz, standard det dobbelte af chipraten). Giver en blok <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, trukket fra hvert links effektive C/N0) og <c8/>. Tabet er det for gaussisk input og er markeret som ugyldigt for CW-, smalbåndede og svejpede jammere.

seg-0dad81736863 = Uden sektionerne er hvert output byte-identisk.

seg-92007bfb6680 = Kontrolleret mod tærskler præregistreret ved 70c72fcc. Kvantiseringstabet ligger inden for { "0.0007" } dB af en uafhængig Monte Carlo, og AGC-aflæsningen inden for { "0.012" } dB af IQ-lagets AGC-sløjfe.

seg-973e451df99d = De registrerede hysteresekørsler var uinformative (hvert link gik tabt), så den tærskel er NOT MET. Et supplerende kørselssæt registreret ved { "37793290" } når den: hvert flag er lig med en uafhængig genberegning, og { "732" } af { "1824" } links viser hysteresen.

seg-912e9f1a4d5b = Fund: med en CW-jammer taber en 1-bit-ADC omkring { "5" } dB mere end det gaussiske tal.

seg-a19aee81b581 = MODELLED; registerrække "Akkvisitionshysterese og front-end-kvantisereren i jamming-typen mod uafhængige genberegninger".

seg-97f43a4fe71d = <b>Terrænskygge af jammeren i jamming-typen</b> (CAP-06b): en valgfri sektion <c1/> i et <c2/>-scenarie med en jammer. Felter:

seg-6d59a2857ab9 = <c1/>: en SRTM <c2/>-tile, relativ til arbejdsmappen;

seg-fa5b15500405 = <c1/>, <c2/> og <c3/> (deg): tilens størrelse og hjørne;

seg-09a35655f010 = <c1/> (m, standard { "0" }), <c2/> (standard 4/3) og <c3/> (m, standard { "30" }).

seg-ad58fe7ff627 = Motoren sampler storcirkelterrænprofilen mellem jammer og modtager og finder den dominerende knivægge. Jammerens modtagne effekt, og dermed hvert J/S, sænkes med det enkelte knivægtab fra ITU-R P.526-15 §{ "4.1" }.

seg-001d7b88b26d = Resultatet får en blok <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) og <c7/> (antal).

seg-b9696f5eda4b = Uden sektionen er hvert output byte-identisk.

seg-593b6a5b4480 = Kontrolleret mod tærskler og ti placeringer præregistreret ved 92cd2bfd, på den committede rigtige SRTM-tile af Death Valley, mod en uafhængig numpy-genberegning. Alle nået: værste forskel { "1.6e-10" } på <c1/> og på tabet (tærskel { "1e-9" }), tabet monotont i jammerhøjden, og tabet når J/S nøjagtigt.

seg-62e07defd715 = MODELLED; registerrække "Terrænskygge af jammeren i jamming-typen mod en uafhængig numpy-genberegning på en rigtig SRTM-tile".

seg-378e9052e2c4 = <b>CRPA-antenneforstærkninger i jamming-typen</b> (CAP-06a): en valgfri sektion <c1/> i et <c2/>-scenarie. Felter: <c3/> (elementpositioner i lokal øst-nord-op, m), <c4/> (<c5/> eller <c6/>) og <c7/> (MVDR-støjbåndbredde, MHz, standard det dobbelte af chipraten).

seg-ca39fefc0fb3 = Hver kanal danner en forvrængningsfri stråle mod sin satellit. Linkets støj skaleres med <c1/> og jammeren med <c2/> før den eksisterende anti-jam-C/N0-ligning.

seg-1f1ddc11ad94 = Hvert link får en blok <c1/>: <c2/> (dB) og <c3/> (dB).

seg-790ecc6a1bd4 = En ugyldig sektion (en tom elementliste, en ukendt vægtning, en ikke-positiv båndbredde) er en fejl, gennem <c1/> og <c2/> såvel som <c3/>.

seg-2464d9dde85f = Kontrolleret mod tærskler præregistreret ved 08d83b4d. Nået: additivitet (efter en rettelse: det første build tilføjede de nye enheder til enhedstabellen i hver jamming-kørsel); ét element er intet array; støjforstærkning og effektiv C/N0 mod en uafhængig numpy-genberegning inden for { "1e-9" } dB; MVDR går mod nulpunktet ved høj JNR.

seg-c04495f7a65a = Ikke nået: MVDR's jammerforstærkning på { "194" } af { "456" } links på { "0.36" } portabel matematik ({ "202" } på værtens matematik; <c1/>) (værst { "1.7e-6" } dB). Residualerne fra −{ "100" } til −{ "188" } dB ligger under float64's opløsning ved den tærskel, og numpy er uenig med sig selv i samme størrelsesorden.

seg-c10e1c72eb15 = MODELLED; registerrække "CRPA-antenneforstærkninger i jamming-typen mod en uafhængig numpy-genberegning".

seg-0a3adfa7271c = <b>IQ-trackingmotor mod GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> og GNSS-SDR tracker de samme uafhængige numpy-optagelser af GPS L1 C/A ved { "30" } til { "45" } dB-Hz.

seg-cc73857e38e8 = Tærskler præregistreret ved 48edd4a5. Den registrerede kalibrering slog fejl på en forkert GNSS-SDR-overdragelse (F3), så Amendment { "1" } (1e4288c4) tilføjer en FLL kun til indfangning i begge modtagere, committet før nogen testoptagelse.

seg-1d651ff134f9 = Nået: bærebølge- og kodejitter og Doppler stemmer inden for { "5" } % ved hver C/N0.

seg-bc9c9a0247d1 = Ikke nået: motorens NWPR C/N0 aflæser { "2.3" }–{ "7.1" } dB under GNSS-SDR's SNV (F4, en kendt grænse for estimatoren; M2M4 er inden for { "0.06" } dB af referencen); låseindikatorerne adskiller sig pr. definition (F5); én uenighed om et slip ved { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; registerrække "IQ-trackingmotor mod GNSS-SDR { "0.0.19" } på uafhængige optagelser".

seg-6ba057fab559 = <b>To VALIDATED rækker for koder i IQ-laget</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Alle { "63" } primære B1I-koder stemmer chip for chip med GNSS-SDR { "v0.0.19" }s uafhængige generator (tærskel præregistreret ved 911106d1). Kun det programs output er committet: de B1I PRN-koder, som den offentlige ICD definerer, som et præfiks og en hash.

seg-37437a09dd67 = <b>GPS L1C.</b> Alle { "126" } L1CP/L1CD-koder og { "63" } L1CO-overlays stemmer med de kontrolkolonner, IS-GPS-800J trykker, og den beregnede Legendre-sekvens stemmer med dens Table 6.2-1 (tærskler præregistreret ved fe372e26).

seg-f445784a7f2d = Rækker: "BeiDou B1I's primære afstandskoder mod en uafhængig generator" og "GPS L1C's afstands- og overlaykoder mod de trykte kontrolkolonner i IS-GPS-800J".

seg-001f48d86a3c = <b>GLONASS-, BeiDou- og Galileo E6-bånd i spektrummodellen</b> (CAP-12, signaler): nye båndnavne <c1/> og <c2/> (enhver FDMA-kanal som <c3/>, K = −{ "7" } til { "6" }), <c4/>, <c5/>, <c6/>, <c7/> og <c8/>. Hver bærer sin ICD-bærebølge, modulation og mindste modtagne effekt. De er til-valg ved navn: standardbåndsættet og alle eksisterende outputs er uændrede.

seg-158a6ec19d6b = Kontrolleret mod tærskler præregistreret ved 5806f28b: ICD-værdierne, nulpunkterne, B1C-sammensætningen og C/N0-stien er nået.

seg-805092ae8ca2 = To tærskler blev ikke nået. Enhedsareal-tærsklen var uopnåelig, som den var skrevet (F1). IQ-lagets B1I- og B1C-bølgeformer stemmer kun med modellen som middelværdi over båndet på grund af deres koders ujævne linjespektre (F2).

seg-db88f07d97bb = MODELLED; registerrække "Spektrummodel: GLONASS-, BeiDou- og Galileo E6-bånd (til-valg)".

seg-b0147cf3acc8 = <b>Cell-averaging CFAR-tilvalg i IQ-akkvisition</b> (PRO-37): <c1/> og <c2/> afgør på et akkvisitionsgitter ved at sammenligne hver celle med middelværdien af referenceceller i dens Doppler-række. Tærsklen stammer fra den lukkede form for CA-CFAR's sandsynlighed for falsk alarm for <c3/> ikke-koherente blokke (<c4/>, <c5/>), så beslutningen ikke afhænger af normaliseringen af sampleeffekt. Det er til-valg; standarddetektoren og alle eksisterende outputs er uændrede.

seg-a56e74b1e091 = Kontrolleret mod tærskler præregistreret ved 3724aefa: den lukkede form mod Monte Carlo ({ "18" } af { "18" } tilfælde), og en designrate på { "1" } % målt til { "0.97" }–{ "1.01" } % på gaussisk og 2-bit-kvantiseret støj.

seg-f88fe97e0ee6 = Én tærskel blev ikke nået: på et støjfrit 2-bit-signal overskrider { "1.28" } % af cellerne uden for toppen tærsklen, ved kodens korrelationssidelobes (fund F1).

seg-8d88b626c31e = MODELLED; registerrække "Cell-averaging CFAR-tilvalg i IQ-akkvisition".

seg-d596329195cf = <b>Scintillationsmodel mod måledata</b> (PRO-34): IQ-kanalens Cornell-scintillationsmodel blev sammenlignet med målt GPS L1-intensitet og -fase ved { "50" } Hz fra en ækvatorial scintillationsnat (Zenodo-post { "16941224" }, INGV, Malindi, CC BY { "4.0" }), under tærskler præregistreret ved b6ccb499. Nået: intensitetsfordelingen og fasescintillationen knyttet til S4. Ikke nået: modellen fader { "2.4" } gange så ofte under −{ "10" } dB og { "3.5" } gange så længe (fund F1). Den registrerede behandling læser modellens indpakkede fase (fund F2); faseresultatet holder, når den er udpakket. <c1/> henter dataene. Rækken forbliver MODELLED: "IQ-kanal for ionosfærisk scintillation (Cornell-modellen) mod målt GPS L1-scintillation ved { "50" } Hz".

seg-d6740cab2271 = <b>Rettet LuGRE-samplelæser</b> (MR-09): <c1/> læser en LuGRE IQ-batch med I i den høje nibble og mid-rise-niveauerne <c2/> (<c3/>), som fjerner det middel på −½, som de rene to-komplement-heltal bærer på I og Q. <c4/> giver GNSS-SDR den samme læsning. Den generiske ION-læser og alle eksisterende outputs er uændrede: { "149" } scenarieresultater og et studie er byte-identiske før og efter, og de fastlåste LuGRE-fund læses som registreret (<c5/>). Ingen registerrække ændres.

seg-5adf36c03c14 = <b>BOC({ "1,1" })-tracking, til-valg</b> (CAP-07 (a)): <c1/> omskalerer DLL-diskriminatorerne til hovedtoppen af sinus-BOC({ "1,1" }) og tilføjer en bump-jump-monitor (meget tidlige og meget sene korrelatorer ved ±{ "0.5" } chip, op/ned-tællere, <c2/>), der flytter kode-NCO'en væk fra en sidetop; <c3/> opregner springene. Slået fra som standard, og alle eksisterende outputs er uændrede. Kontrolleret mod tærskler præregistreret ved 6b68f6cc på et syntetisk BeiDou B1C-signal: en start på en sidetop, der uden tilvalget bliver stående { "0.55" } chip ved siden af, trækkes med det over på hovedtoppen af ét spring ved { "0.08" } s, og intet falsk spring blev set væk fra hovedtoppen. Én tærskel blev ikke nået: enhedstestgridet for skaleringen rækker uden for diskriminatorernes lineære område (fund F1 i <c4/>). MODELLED; registerrække "BOC({ "1,1" })-tracking: DLL-skalering og opløsning af bump-jump-multiplicitet (til-valg)".

seg-89345aa385f7 = <b>Laboratorietilpasning ud fra IQ-kampagner</b> (B7.1, <a1><c1/></a1>). <c2/> i et labfit-scenarie tilpasser en outputmappe fra <c3/> på CLI'en (<c4/>), i Python (<c5/>) og i MCP's labfit-værktøj (kun mapper inden for dets arbejdsmappe). Den tilpasser én enhed pr. signal, sløjfeudformning, front-end-kæde og jammertype:

seg-1726361b81c4 = C/N0-modellen mod angivet J/S, med censurering;

seg-e1b8a27b06fd = trackingtærsklen, direkte og i lukket form;

seg-8dce89923619 = tracking-sløjfemodellen og de empiriske lås-modeller, koblet gennem C/N0-modellen, med deres dwell-tider;

seg-108646713c97 = en seedet klynge-bootstrap over optagelser, { "90" } % prædiktionsintervaller og tilbageholdte datasæt med udeladelse af én optagelse ad gangen;

seg-ee5deb4d5d4b = en præregistreret tabel <c1/>, hashet, med PASS/FAIL pr. tærskel.

seg-4d58263106af = Rapporten er <c1/> som JSON, CSV og Markdown, med en enhedsblok. <b><c2/> kan ikke identificeres ud fra C/N0-data</b> uden en uafhængig effektmåling. Den angives, tilpasses aldrig, og den tilpassede parameter er <c3/> (designændring 2026-10-12). En ukendt jammertype får det mest skadelige angivne <c4/> (cw, { "1" }). På syntetiske kampagner fra Kshanas egne scener består tærsklen for dækning i det tilbageholdte datasæt (c). Tærsklerne for <c5/> (a') og (b') ({ "0" } af { "50" } kampagner dækket) og tærsklen (d) for tærsklen i lukket form er ikke nået: de er registreret med deres værdier. MODELLED; registerrække "Kalibrering af den åbne modtagers C/N0- og låsemodeller til IQ-kampagneresultater, med angiven prædiktionsfejl". Stien labfit for modtagerlogs og dens outputs er uændrede.

seg-308d19be658d = <b><c1/> på en JPL-kerne</b> (CAP-31): <c2/> tager hvert legeme, som SPK'en indeholder (med de440s: Merkur, Venus, Jorden, Månen), fra kernen, mærkat <c3/>, og tilføjer kun en blok <c4/>, når den er sat. Ny række, VALIDATED mod SPICE (præregistreret f8e946ea; værst { "3.3e-5" } m, { "1.0e-11" } m/s). Standardrapporten er uændret.

seg-fe16c24eae60 = <b>Porkchop på DE440-efemeriden</b> (CAP-20b): <c1/> gennemløber C3 og ankomst-V∞ på heliocentriske tilstande fra en DE440 SPK. Ny række, VALIDATED mod SPICE-tilstande

seg-a8632f3c86e9 = pykep { "3.0.1" } (præregistreret 2d857fb1; Jorden til Mars 2026-2028, { "304" } celler, værst { "2.6e-14" }, samme celle med mindste C3).

seg-266cffab38a7 = <b>LRO ikke-gravitationel makromodel: NOT MET</b> (DS-LRO-10, præregistreret e82047e2). <c1/> (til-valg via <c2/>): direkte solstråling på flade plader med Månens skygge, et solfølgende array og månens albedo og termiske IR; <c3/> er en mærket generisk LRO-tilnærmelse ud fra offentliggjorte kendsgerninger (ingen buspaneler: pladetabellen kunne ikke skaffes). På LRO-buen på { "4" } t efterlader den den reduceret-dynamiske RMS på { "6.668" } m og den dynamiske på { "11.94" } m, med en usandsynlig strålingsfaktor (omkring +{ "21" } / −{ "22" }), så alle tre tærskler er overskredet. Fundet er fastlåst af en test, og intet standardoutput ændres (<c4/>). Det til-valgte månekanonkugle-SRP bruger nu Månens koniske skygge i stedet for Jordens (<c5/>).

seg-e4ed6e0e5048 = <b>Månens OD: valgfri k2-fast tidevand og selenocentrisk relativitet</b> (DS-LRO-11), slået fra som standard (<c1/>, <c2/>); en kontakt <c3/> til ANISE-krydsvalideringen (DS-LRO-04); en fixture med en LRO-bue på { "24" } t og en kun informerende tilpasning over en lang bue (DS-LRO-09). Informationskørsler er registreret i <c4/>; intet offentliggjort tal ændres.

seg-b065138adba8 = <b>CR3BP { "9" }:{ "2" } NRHO mod CAPSTONE</b> (CAP-29d): ny MODELLED række, der måler motorens cirkulære begrænsede NRHO mod CAPSTONEs fløjne bane (JPL Horizons, marts { "2023" }; præregistreret { "4e868170" }): periode { "1.07" } %, apolun { "0.05" } %, perilun { "4.1" } % fra CAPSTONEs middelværdier, inden for de registrerede tærskler på { "3" } / { "5" } / { "20" } %. En måling, ikke en validering.

seg-954bd2771180 = <b>CR3BP roterende tilstande til Måne-centreret ICRF</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> afbilder en dimensionsløs roterende Jord-Måne-tilstand på den øjeblikkelige DE440 Jord-Måne-linje, inklusive referencesystemets rate uden for planet. Ny række, VALIDATED mod et SPICE-referencesystem med to vektorer (præregistreret 2313eb1b, ændret før nogen kørsel d5ef79b3; { "72" } tilfælde, værst { "1.8e-7" } m og { "1.2e-9" } m/s).

seg-14599ab79300 = <b>CR3BP-familiemedlemmer mod JPL Three-Body Periodic Orbits API: NOT MET</b> (RM-35, præregistreret a9074f65). <c1/> (halo-, NRHO- og DRO-korrektion, monodromi-stabilitetsindeks, pseudo-buelængde-fortsættelse) stemmer med { "54" } af { "58" } API-medlemmer på hver tærskel (tilstand, periode og Jacobi inden for { "1e-10" } overalt). Ét L1 halo-stabilitetsindeks ({ "9.5e-2" }) og tre små DRO-lukninger ({ "1.5e-8" } til { "3.3e-8" } mod { "1e-8" }) overskrider tærsklen, så modulet er <c2/>, og ingen række påstår det. Resultater: <c3/>.

seg-0cd0e67a2e28 = <b>Til-valgt DE440-månerotation og -miljø</b> (FUT-05, DS-LRO-08; standarder uændrede): <c1/>, <c2/> / <c3/> (forankret i epoke, DE440 hovedakser) og <c4/> (indlejret DE440 PA-orientering plus den geocentriske Sol og Måne fra en DE440 SPK leveret af brugeren). Mod ANISE (præregistreret ea537710): orientering inden for { "3.5e-7" } rad og LRO-tilpasninger inden for { "1" } mm, men efemeridedelen overskred sin tærskel (Sol { "30.7" } m, Måne { "1.1" } m, en tidsforskydning på ca. { "1" } ms på ANISE-siden), så det er ikke en valideret række. Resultater: <c5/>.

seg-92cc171c69da = <b>Datum for månens referencesystemkampagne, tilstandsskaleret NumPy-tærskel: NOT MET</b> (præregistreret b887eb05; forbliver MODELLED). Trin { "0" } udelukker pseudoinversens fallback som årsag til gabet på { "0.30" } for estimerede stationer; NumPy stemmer inden for tærsklen på seks af otte scenarier, men stations_estimated overskrider den ({ "6.8e-6" } mod { "5.9e-7" }), og på den nye dato 2026-12-01 gør et uobserveret sydpolsbeacon-informationen rangdeficient, hvilket den uændrede uafhængige reference ikke kan evaluere. Resultater: <c1/>.

seg-8d2f1e9708ff = <b>Datum for månens referencesystem fra en rigtig observationskampagne (analytisk Måne) VALIDATED</b> på friske EDC-normalpunkter fra { "2025" } (præregistreret 31f5283, før nogen blev hentet): den uændrede SPICE- og NumPy-reference stemmer på bogføring, rang og nul kobling og inden for { "1.11e-3" } på sigmaer (tærskel { "1e-2" }), { "8.95e-4" } på tilstanden og { "1.79e-3" } på tværs/langs-forholdene (tærskel { "2e-2" }). Kun en Library-kontrol af kovariansberegningen; tærsklerne skelner ikke mellem månemodeller. Resultater: <c1/>.

seg-058d7d490111 = <b>IAU-legemsorientering og GM for de fjorten tilføjede legemer i solsystemet</b> udskilt fra rækken "Fysiske konstanter for hvert legeme i solsystemet" til en VALIDATED række (præregistreret 154bc54): <c1/> stemmer med SPICE <c2/> på pck00011 inden for { "1e-9" } rad på { "574" } matricer ved de oprindelige epoker og på { "574" } ved { "41" } friske epoker, der aldrig er sammenlignet før (værst Phobos { "1.38e-10" } rad), og <c3/> er lig med gm_de440 for alle fjorten legemer. Resten af den oprindelige række (J2, middelradius, rapporten) forbliver MODELLED. Resultater: <c4/>.

seg-56c445aa8d9e = <b>Lambert med flere omløb</b> (<c1/>): hver løsning med op til tre omløb, begge grene. Ny registerrække, VALIDATED mod pykep { "3.0.1" } (præregistreret a75de851; { "382" } tilfælde, { "1058" } løsninger, værste hastighedsforskel { "1.6e-13" } mod { "1e-8" }). Den interne Kepler-landingsvagt fandt én begrænsning i <c2/> på en bue med e = { "0.994" }; den er registreret i <c3/>.

seg-b62dc38b09e9 = Solstrålingstryk med box-wing og ECOM2 (DS-PA-14), til-valg.

seg-fd50e846d10e = <c1/>: en box-wing-model med flade plader med Galileo FOC/IOV-tabellerne fra GSC's satellitmetadata, i nominel GNSS-yawstyring, med strålingsfaktor og partielle afledede pr. panel, og den empiriske ECOM2-model med dens partielle afledede. Vælges med <c2/> / <c3/> (felter <c4/>, standard <c5/>: kanonkuglestien og alle golden-filer er uændrede); med et box-wing-sæt er <c6/> dets strålingsfaktor. Sammenlignet med Orekit { "12.2" } under en præregistrering (<c7/>): hver tærskel nået, omkring { "1e-15" } relativt; VALIDATED som en modelevaluering, Galileo-SRP-forudsigelsen forbliver MODELLED.

seg-fd7a7fe09705 = <b>SRP-skygge for en oblat Jord og solens randformørkelse (FUT-09, RM-11).</b> Nyt modul <c1/>: <c2/> (WGS-84-skyggende ellipsoide), <c3/> (Eddingtons lov) og <c4/>, valgt med <c5/> (standard: den eksisterende sfæriske koniske skygge, uændret); <c6/>. Den oblate skygge stemmer med Orekit { "12.2" }s belysningsforhold inden for { "7.4e-9" } over { "2400" } geometrier (VALIDATED, <c7/>); randformørkelsen har ingen ekstern uafhængig reference (MODELLED).

seg-f09d4b831dfe = NRLMSISE-00-termosfære (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: en portering af <c2/> og <c3/> (kontakter, tilstande med daglig Ap og 3-timers ap-array) fra den offentligt tilgængelige C-version af NRL's Fortran. Den er bit-identisk med den C-portering og inden for { "1.9e-6" } relativt af pymsis { "0.13.0" } (NRL Fortran, enkelt præcision) på et gitter med 720 punkter, og den gengiver de { "17" } offentliggjorte testtilfælde (VALIDATED; <c4/>). Dette validerer porteringen, ikke modellens nøjagtighed mod målt densitet.

seg-9e8e9018dbaf = Til-valgt NRLMSISE-00-trin for dragdensitet.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> og <c4/>. Den statiske eksponentielle model forbliver standard, bit for bit. Rumvejret er konstant pr. model. VALIDATED på banebasis mod Orekit { "12.2" }s eget NRLMSISE-00-drag over { "24" } t (værst { "0.03" } m mod op til { "142" } km dragforskydning; <c5/>).

seg-b1b2ac9ac91e = Til-valgt DE440 Sol og Måne i Cowell-propagatoren (RM-33, FUT-10).

seg-4f323703b251 = <c1/> tager enhver <c2/> (f.eks. en DE440 <c3/>) til tredjelegeme- og SRP-leddene; den afviser en udbyder, der ikke kan betjene epoken, tæller fallbacks til den analytiske række og er slået fra som standard. <c4/> bevarer todelt præcision. Mod Orekit { "12.2" } på dens egen DE440-læser stemmer baner på { "24" } t med { "0.017" } m; den præregistrerede tærskel for Sol/Måne-position blev overskredet ({ "6.4" } m / { "0.24" } m; SPICE viser det samme gab), så MODELLED (<c5/>).

seg-6ac7f3f65b33 = Til-valgt atmosfærisk S1-tidevand (DS-PA-03).

seg-35da1ed0dc83 = <c1/> og <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Table { "1" } model N1, grad { "2" }–{ "6" }), aktiveret med <c3/> på <c4/> og <c5/>; slået fra som standard. MODELLED (koefficienter kontrolleret igen mod den offentliggjorte tabel; ingen ekstern uafhængig reference for kraftens virkning).

seg-c62d816a93cf = Batch-banebestemmelse med afstandshastighed og azimut/elevation med elevationsmaske (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variationel STM med analytiske partielle afledede for topartikel + J2), <c5/>, <c6/>; <c7/>. Stien kun med afstand er uændret. Sammenlignet med Orekit { "12.2" } batch least squares over { "8" } præregistrerede scenarier: hver tærskel nået undtagen den støjfri tilstandssammenfald (≤ { "1" } cm), overskredet på { "2" } af { "4" } scenarier ved { "1.46" } og { "1.74" } cm med kshana inden for { "1e-8" } m af referencen; registreret, MODELLED.

seg-223f1e39669f = SP3-nøjagtighedsvægtning (DS-PA-06).

seg-b5560ff1c426 = <c1/> og <c2/> afbilder nøjagtighedskoderne i headeren og pr. post til observationssigmaer; en SP3-vægtet Galileo-tilpasningsvariant (Tier-2 3D RMS { "0.035" } m mod { "0.070" } m uvægtet) er tilføjet ved siden af de uændrede registrerede kørsler. MODELLED.

seg-831d35c5f97e = <b>Swarm-A-dispatchjob for hele buen (DS-PA-08)</b> i <c1/>.

seg-cc5e8af7cb0d = Planetarisk tyngdekraft fra PDS SHADR-tabeller (CAP-30, del af CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) læser Mars GMM-3 (d/o { "120" }) og GRAIL GL0660B (d/o { "660" }); <c3/> tilknytter ethvert indlæst felt (standarder uændrede). Beskæringer til grad 20 medfølger (NASA PDS, public domain; <c4/>); de fulde filer hentes af <c5/>. VALIDATED mod pyshtools { "4.14.1" } (inden for { "4e-15" } af den samlede tyngdekraft ved d/o { "120" } over hele kuglen, { "5e-14" } ved d/o { "660" } for |lat| ≤ { "60" }°); koblingen til legemets referencesystem forbliver MODELLED (hvert felts eget referencesystem er ikke det IAU-system, der anvendes).

seg-afb5fbf86ffc = Tyngdekraft af høj grad til grad { "2190" } (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (Holmes–Featherstone modificeret fremadrettet kolonne, ingen underflow, ingen polsingularitet), <c3/>, en streamende ICGEM-indlæser <c4/> / <c5/> (kontrol af norm og maksimal grad, tidevandssystem registreret, tidsvarierende led afvist) og <c6/> (fuld EGM2008, SHA-256 fastlåst, ikke medleveret; tests gated på <c7/>). <c8/> vælger den på det til-valgte <c9/>. Stemmer med Orekit { "12.2" } til { "7.3e-17" } m/s² gennem grad { "2190" }, og en bane på { "24" } t { "200" }×{ "200" } stemmer til { "0.13" } m. MODELLED: pyshtools overskred den præregistrerede tærskel nær polen (sporet til pyshtools), og banens kontrol af følsomhed for grad 70 blev overskredet ({ "0.73" } m < { "1" } m); begge er registreret i <c10/>.

seg-4ef4f74f21c1 = DOP853-integrator (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (tæt output af 7. orden), <c4/>, <c5/>, med en trinvagt, der lukker ved fejl; <c6/>, <c7/>, <c8/>. Standarddriveren er uændret. VALIDATED mod SciPy { "1.18.1" } <c9/>: enkelte trin inden for { "5.6e-15" }, samme trinsekvenser, sluttilstande inden for { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Robust Kepler-løser (FUT-12).</b> Nyt modul <c1/>: <c2/> (Markley { "1995" }-starter, residual uden udslettelse) for alle { "0" } ≤ e < { "1" }, pakket ind af <c3/>. VALIDATED mod mpmath-rødder med 50 cifre til { "0.9" } ε·|E| op til e = { "0.999999" } (<c4/>).

seg-5e82deb7c853 = Til-valgt tesseral tyngdekraft fra Jorden i Cowell-propagatoren (RM-09).

seg-e1a7ad42211e = <c1/> får <c2/> (<c3/>, <c4/>). Den evaluerer et <c5/> (medfølgende EGM2008 til grad/orden { "70" }, eller en hvilken som helst ICGEM <c6/>) i et jordfast referencesystem, nået ved jordrotationsvinklen (<c7/>) eller CIO GCRS-til-ITRS-kæden (<c8/>). Standard <c9/>: intet eksisterende output ændres. VALIDATED mod Orekit { "12.2" } Holmes–Featherstone over { "24" } t ({ "6" } tilfælde, værst { "0.036" } m), med tærsklerne præregistreret i <c10/>.

seg-957686bb351e = <b>Todelte julianske datoer gennem jordrotation på banestien</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> og <c6/>, <c7/>-konverteringer mellem <c8/> og <c9/> og et til-valgt <c10/> for scenariet <c11/> (ECEF, jordspor og stationsvisning; slået fra som standard og uændret, og nøglen udelades af scenariets hash, når den er slået fra). Ny registerrække, VALIDATED mod pyerfa <c12/>/<c13/> (præregistreret b10475ee; { "40" } datoer: GMST bit-identisk, matrix inden for { "2.7e-14" }, rotation over trin på { "1" } µs inden for { "1.1e-14" } rad, hvor stien med enkelt <c14/> overskrider dem). Epoken for Cowell-kraftmodellen forbliver enkelt <c15/>; grunden står i dens dokumentation.

seg-0680b1f4c98b = <b>EOP-forudsigelse ud over tabellen</b> (<c1/>, <c2/>): en til-valgt udvidelse af en IERS-serie for jordens orientering med LS+AR-prædiktoren udstedt ved dens sidste række, så referencesystemets argumenter for en senere epoke følger prognosen i stedet for at klemmes til den sidste række. Svar inden for tabellen er bit-identiske (testet); serien klemmer stadig, medmindre dette kaldes. Prognosens nøjagtighed forbliver det eksisterende LS+AR-fund mod Bulletin A (MODELLED).

seg-a7d272a1ddd6 = <b>Forskydninger dX, dY af den himmelske pol på CIO-kæden</b> (<c1/>) og direkte ERFA-vektorkontroller af <c2/>, <c3/> og den nye funktion. Ny registerrække, VALIDATED mod pyerfa (præregistreret 979c1e39; { "40" } epoker { "1950" }–{ "2100" }: præcession og CIO bit-identiske, TEME→GCRS inden for { "1.1e-10" } rad, den forudsagte virkning af to-leddet-rækken for jævndøgnsligningen). Eksisterende funktioner er uændrede.

seg-20d19a2d65ec = <b>UTC før 1972 på den todelte tidssti</b> (<c1/>, og <c2/>, <c3/> og <c4/> fra 1960-01-01): æraen med glidende rate ("rubber-second"), med SOFA's driftstabel, brøkdelstrin ved dagens slutning og skaleringen af dagsbrøken fra UTC til SI. Ny registerrække, VALIDATED mod pyerfa <c5/>/<c6/>/<c7/> (præregistreret 23c40661; { "117" } tidspunkter { "1960" }–{ "1971" }, værst { "2.9e-11" } s mod en tærskel på { "1" } µs). Hvert resultat fra { "1972" } og frem er bit-identisk (kontrolsum fastlåst før ændringen). Før { "1960" } er TAI − UTC { "0" }, som i SOFA. Stien <c9/> med enkelt <c8/> er uændret.

seg-3ff0d080d9e6 = <b>GLONASS-udsendt satellitur</b> (<c1/>): <c2/> fra RINEX-posten, ved en tid aflæst på satellituret (to fastkomma-iterationer, RTKLIB-konventionen). De indlæste <c3/> og <c4/> var tidligere ubrugte. Ny registerrække "GLONASS-udsendt satellitur og propagering af udsendt bane", VALIDATED mod RTKLIB 2.4.2-p13 <c5/>/<c6/> (præregistreret e099c42a; { "292" } tilfælde på en rigtig udsendt fil fra { "2013" }: urforskel { "0" } s, værste position { "1.1" } mm mod en tærskel på { "1" } cm). Biblioteksfunktion; intet scenarieoutput ændres. Ingen transformation fra PZ-90.11 til ITRF anvendes, og modulet siger det.

seg-71ae2ee163e0 = <b>PPP-tidsløsning mod IGS-stationsuret</b> ({ "0.36" }, FUT-19): modtagerens ur i det flydende PPP-filter på WTZR stemmer med IGS' endelige kombinerede ur for stationen til { "0.075" } ns (standardafvigelse) med en konstant forskydning på −{ "0.66" } ns over de konvergerede to timer. Tærsklerne blev præregistreret i <c1/>. VALIDATED (ny registerrække). Ny fixture <c2/>, stationsurposterne fra den endelige IGS-urfil, der allerede bruges til satellitterne.

seg-463ac67600b1 = <b>PPP-paritet med gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } blev kørt på de samme WTZR-input som et separat værktøj (Apache-2.0-kerne; downloadets kontrolsum kontrolleret mod den offentliggjorte liste), med kommandolinjen fra en proceduremæssig ændring committet før kørslen. På dens første registrerede kørsel stemmer Kshanas flydende PPP og gLABs inden for { "0.05" } m på { "240" } af { "240" } epoker og til { "5.0" } mm på den sidste. SPP-tærsklen blev overskredet (median { "1.187" } m mod { "0.50" } m) og er registreret som et fund: gLABs og RTKLIBs egne SPP-løsninger afviger fra hinanden med { "0.852" } m. Den registrerede regel lader derfor begge værktøjers ben stå som ikke nået som helhed, mens PPP-paritet holder.

seg-158717c78c80 = <b>Læsning af RINEX { "4" }-navigation</b> ({ "0.36" }, WP-07, PRO-41): <c1/> læser RINEX 4.00-4.02-navigationsfiler (<c2/> GPS LNAV, Galileo I/NAV og F/NAV, BeiDou D1/D2, QZSS LNAV; andre poster springes over til næste postheader), og <c3/> tager indstillinger. VALIDATED mod samme dags IGS RINEX { "3" }-sammenflettede fil: hvert afkodet felt identisk og { "0" } m i position. Læsning af RINEX 2/3 er uændret.

seg-57aa5c6ef4f8 = <b>BeiDou GEO-udsendte positioner</b> (til-valg): <c1/> og <c2/> (BDS ICD, −{ "5" } deg hældning). <c3/> springer stadig GEO'er over. MODELLED: den præregistrerede sammenligning med en præcis bane er data-gated og endnu ikke kørt.

seg-416f58111d1f = <b>RINEX { "4" }-observationsfiler</b>: en rigtig RINEX { "4.00" } MGEX-observationsfil læses i tests (MODELLED, formatkontrol).

seg-64b4664c0ff6 = <b>RTK med LAMBDA på rigtig RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, dobbeltdifferencer over kort baseline af tofrekvent GPS-kode og -fase med et flydende Kalman-filter og LAMBDA-heltalsfiksering (ratiotest). VALIDATED på IGS-stationerne WTZR og WTZZ ({ "1.4" } m fra hinanden) mod deres ITRF2020-baseline under præregistrerede tærskler: fikseret ved hver epoke efter de første ti minutter, baselinefejl median { "4.5" } mm og 95. percentil { "5.5" } mm.

seg-69db4437ebbb = <b>RTKLIB-paritet for PPP med rigtige data</b> (RM-31): <c1/> og <c2/> med præregistrerede tærskler. RTKLIB v2.4.2-p13 PPP på de samme WTZR-input stemmer med Kshana inden for { "5" } cm ved hver epoke i de sidste to timer ({ "9.7" } mm til sidst) ved den tredje registrering; de første to kørsler, registreret som fund, havde det faste tidevand slået fra og modtagerantennen på RTKLIBs basis-slot. Tærsklen for enkeltpunktsparitet blev overskredet ({ "1.09" } m median mod { "0.5" } m). gLAB-benet er ikke kørt (data-gated).

seg-fb6e053a0a9d = <b>Navigationsmeddelelsesenkodere ud over LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> enkoder GPS CNAV (meddelelsestyper { "10" }, { "11" }, { "30" }; CRC-24Q; kontinuerlig rate-1/2 K={ "7" }-kodning), Galileo I/NAV (ordtyper 1-5 i lige/ulige nominelle sider; 30x8-interleaver; sync <c2/>) og Galileo F/NAV (sidetyper 1-4; 61x8-interleaver; sync <c3/>), med testdekodere. MODELLED: rundture og ICD-kendte svar; en præregistreret kontrol af, at udsendte Galileo-efemerider ligger på enkoderens LSB-gitter, holdt (værst { "3.6e-3" } LSB), men overskred sin tærskel for antal satellitter ({ "15" } af { "20" }), registreret. Enkoderne er biblioteksfunktioner; sceneforbindelse er ikke en del af denne ændring.

seg-562f36eb18e6 = <b>IONEX-fillæser</b> ({ "0.36" }, WP-07): <c1/> med <c2/>, <c3/>, <c4/>, <c5/> og <c6/>: en streng IONEX { "1.0" }-læser med faste kolonner, med epoker talt fra det første korts dag, <c7/> læst som manglende, RMS-kort og formatets nærmeste, på hinanden følgende og roterede korts tidsinterpolationer; skrå TEC ved headerens skalhøjde. Kontrolleret på et committet syntetisk kort og, data-gated (hentet ved testtidspunktet med en fastlåst SHA-256, ikke medleveret), på et udsnit af en rigtig CODE GIM: hver knude nøjagtig; interpolationen stemmer med en formelreference til { "4e-13" } TECU. RTKLIBs <c8/> stemmer til { "3.6e-13" } TECU ved { "6885" } punkter (præregistreret B6). VALIDATED på data-gated belæg (ejerens beslutning, 2026-10-13): testen slår fejl på ethvert andet kort end det SHA-fastlåste.

seg-9fac2e8535c8 = <b>Hatch-bærebølgeudglatning</b> ({ "0.36" }, WP-07): <c1/> og <c2/>, den divergensfrie (ionosfærefrie) form i den præcise enkeltpunktssamling. MODELLED med et registreret fund: på IGS-stationen WTZR sænker den medianen af enkeltpunktsfejlen fra { "1.55" } m til { "1.12" } m og 95. percentil fra { "3.47" } m til { "3.21" } m, under den præregistrerede reduktion på { "40" } % (den resterende fejl er biaslignende, ikke støj).

seg-7e4c7639d102 = <b>Flydende PPP på rigtig RINEX</b> ({ "0.36" }, WP-07): <c1/>, et statisk flydende filter til præcis punktpositionering på rigtig tofrekvent GPS-kode og -fase med endelige IGS-produkter (antenneforskydninger og -variationer, fast jordtidevand, phase wind-up, Shapiro-forsinkelse, estimeret våd forsinkelse, detektion af cycle slips), med <c2/>. VALIDATED på den tilbageholdte IGS-station WTZR mod dens ITRF2020-koordinat under præregistrerede tærskler: efter { "6" } t er fejlen { "1.5" } mm horisontalt og { "2.9" } cm vertikalt, og hver epoke i de sidste to timer ligger inden for { "10" } cm.

seg-173aa308e3e8 = <b>Interpolation af præcise SP3-ure</b> ({ "0.36" }, WP-07): <c1/> og <c2/> interpolerer de tabulerede SP3-satelliture lineært mellem de to indrammende gyldige knuder (sentinel for dårligt ur springes over), og <c3/> fodrer dem til <c4/>, så den præcise kæde kan køre af en SP3 alene. VALIDATED mod IGS' endelige ure på { "30" } s fra 2025-02-24 under præregistrerede tærskler: { "32" } GPS-satellitter, midtpunkts-RMS { "0.121" } ns (tærskel { "0.15" } ns), 95. percentil { "0.265" } ns (tærskel { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM ved siden af tallene for urets holdover</b> (CAP-05b): en til-valgt sektion <c1/> på ur-typen rapporterer en separat blok <c2/> (øjebliksbillede af RAIM på en forudindstillet himmel fra et angivet sted: dom pr. epoke og beskyttelsesniveauer, tilgængelighed; utilgængelig, mens GNSS er nægtet, aldrig ekstrapoleret). Holdover-tallene er uændrede; uden sektionen er outputtet byte-identisk. MODELLED.

seg-99d9a67fc2f3 = <b>Tærskler for receiver-trust kalibreret på JammerTest { "2024" }</b> (CAP-13): en præregistreret kalibrering af monitorerne for fald i C/N0, AGC og jammingindikator på det offentlige JammerTest { "2024" }-datasæt (hentet ved kørsel, aldrig medleveret; <c1/>), kun leveret som den til-valgte <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Tilbageholdt: tærsklerne for AGC, jammingindikator og unionen består; tærsklen for falsk alarm i C/N0 slår fejl ({ "0.023" } mod { "0.02" }), så rækken er MODELLED (<c3/>). Standarder og outputs uden profilen er uændrede.

seg-8ccd18c54b4b = <b>ARAIM-fejlhypoteser for flere satellitter</b> (CAP-05a): ADD v4.2-delmængderegelen generaliseret ud over par (<c1/>, <c2/>; orden { "2" } er nøjagtig den eksisterende MAAST-kontrollerede sti) og en til-valgt avanceret RAIM over disse hypoteser (<c3/>), som rapporterer delmængden med største adskillelse, når en fejl detekteres. A priori-fordelinger, der kræver dybere delmængder, afvises, aldrig afkortet. MODELLED.

seg-02f1f2d72263 = <b>Horisontlinje i receiver trust</b> (FUT-01): en receiver-trust-session kan angive en <c1/>; satellitter bag den går tabt for himlen (<c2/>, <c3/>, <c4/>), og deres tab klassificeres som <c5/>, aldrig <c6/>; uden en er fallback til azimutgab og alle outputs som før. Generatoren til besætningstræning får en <c7/>-hændelse (en blokeret himmel, ikke interferens) og scenariet <c8/>. Monte Carlo for UERE x DOP får designnotatets to maskerede horisontgeometrier, præregistreret alene: alle { "26" } kontroller består.

seg-69fa2ecdc4e9 = <b>Verifikation af RFC { "3161" }-tidsstempler</b> (CAP-14): <c1/> kontrollerer et tidsstempeltokens signatur (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 og P-384), dets ESS-binding til signeringscertifikatet, signatørens timeStamping-anvendelse og dets kæde til et betroet anker på tokens genTime, offline; <c2/> anvender det på en pakkes <c3/> (til-valg; uden det er rapporten uændret). VALIDATED, snævert: alle { "27" } selvgenererede tilfælde stemmer med OpenSSL { "3.0.13" } på dommen og genTime, under en sammenligning præregistreret, før verifikatoren blev skrevet. Tilbagekaldelse kontrolleres ikke.

seg-1b7777e600a8 = <b>Verifikationsniveauer pr. tal for hver type</b> (RM-04): hver scenarietypes resultat ender nu med en blok <c1/>, der navngiver dens hovedtal, den række i verifikationsmatrixen, der ejer hvert enkelt, og det niveau, der aflæses fra rækken (tal, som ingen række ejer, opføres som uden niveau). Blokken tilføjes efter kørslen og fjernes igen til det forrige dokument byte for byte (<c2/>). <c3/> har ingen <c4/>, før en ny dateret forudsigelse erstatter dens frosne; <c5/>, <c6/>, <c7/> og <c8/> har intet skalart hovedtal, og <c9/> skriver kompakt JSON. Kampagnemedlemmer beholder deres dokumenter uden niveau.

seg-54aec3e311cf = <b>Kvante-forudindstilling <c1/></b> (CAP-08c): et medfølgende inertialscenarie, hvor et koldatom-interferometer-accelerometer, specificeret ud fra interferometerets fysik (<c2/> med et angivet vibrationsniveau for platformen), glider frem mod et kvartsaccelerometer af navigationskvalitet gennem et GNSS-udfald på 110 minutter. MODELLED.

seg-21d2b7fd2a21 = <b>Greenhalls eksakte ækvivalente frihedsgrader</b> (CAP-03): <c1/>, den fulde algoritme af Greenhall og Riley ({ "2003" }) (differensordener { "1" } til { "3" }, støjeksponenter +{ "2" } til -4, overlappende og ikke-overlappende, modificeret og umodificeret, med tabellerne for stort J), med ADEV-, MDEV- og HDEV-indpakninger. VALIDATED i en præregistreret sammenligning med allantools { "2024.6" }: { "4 876" } gitterpunkter inden for { "6.0e-13" } relativt; allantools svigter i yderligere { "32" } punkter, som er noteret uden en værdi fra en uafhængig reference. Konfidensintervallerne i <c2/> er uændrede bit for bit.

seg-8e04ebc15045 = <b>Fejlled for koldatom-interferometer</b> (RM-26/27/28): Raman-laserfasestøj (med forsinkelsesleddet fra retroreflektionen), bølgefrontens krumningsbias for en termisk sky (ren defokusering, med en detektionsradius) og opløsning af fringe-multiplicitet (klassisk understøttet og to afhøringstider), som biblioteksfunktioner i <c1/>, hver lukket form kontrolleret mod kvadratur eller Monte Carlo. MODELLED; kan endnu ikke nås fra en scenarietype (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Formater for urlog</b> (RM-03): <c1/> læser RINEX-urfiler, ASCII-fase- eller frekvenslogge i TimeLab-stil og TAPR TICC-tællerlogge ind i én normaliseret faserække (tau0 angivet eller fundet, huller talt, en hulpolitik). Valgfrit: en tidssynkroniseringsrække for telekommunikation kan nævne en log (<c2/>), og tabellen <c3/> i et urscenarie tilføjer en blok <c4/> (ADEV, TDEV, MTIE). Uden tabellen er begge typer byte-identiske (<a1><c5/></a1>). En præregistreret sammenligning på tre syntetiske logge opfyldte sine tærskler for fase og forbindelser; estimatorerne stemmer med allantools inden for { "2.5e-14" }, hvor den kan beregne dem, og den beregner ikke MTIE-punktet for hele optagelsen (noteret). MODELLED.

seg-53369a5c3749 = <b>Wander-masker for frekvenssynkronisering</b> (RM-01): typen <c1/> får syv MTIE- og TDEV-masker for wander-generering ved konstant temperatur, ITU-T G.811 PRC, G.812 type I til III, G.8262 EEC-valgmulighederne { "1" } og { "2" } og G.8262.1 eEEC, med de potenslovsstykker, som tabellerne angiver, og referencescenariet <c2/> (en frit løbende OCXO mod EEC-maskerne: den svigter ved { "1 000" } s, hvor en sløjfe må gøre arbejdet). Hver række blev læst igen mod teksten på itu.int; G.812 (06/2004) er afløst af en forhåndsudgivet udgave 08/2026, som ikke kunne læses. MODELLED (en transskription); eksisterende masker og output er uændrede.

seg-5e84b35ee4e7 = <b>Vejledning om filter-prior for typen <c1/></b> ({ "0.36" }, WP-09, fund fra RM-21): pakkens standard-filter-prior passer til en IMU af taktisk kvalitet. Med en IMU af navigationskvalitet kan standardværdien gøre den fusionerede glidning dårligere end fri INS: { "52" } m mod { "11" } m på en flyprofil med { "70" } m/s. Sæt <c2/> til at passe til sensorens kvalitet, som de nye pakker til søfart, jernbane og luftfart gør. Intet medfølgende scenarie parrer en IMU af navigationskvalitet med standard-prior: alle, der bruger standardværdien, har resterende accelerometerbiaser på mindst { "0.015" } m/s². Kun dokumentation; ingen ændringer i output.

seg-f74b3c265f3a = <b>Testbænk-eksport kontrolleret med en simulators egne læsere</b> ({ "0.36" }, WP-09, CAP-16): bevægelsesfilerne fra <c1/> for { "8" } medfølgende scenarier blev læst tilbage af gps-sdr-sims læsere for NMEA, bredde/længde/højde og jordfast bevægelse (MIT, commit 28ca29a6, brugt som et separat værktøj via <c2/>; ingen signalfunktion kaldes). De returnerer den eksporterede bane til { "1.2" } mm, { "0.15" } mm og præcist. FUND: simulatorens jordfaste læser kan ikke tage CSV-filen i fuld bredde, fordi dens linjebuffer på 100 tegn deler hver række. <c3/> angiver nu de kolonneafskæringer, der skal bruges, og simulatorens loft på { "300" } s. VALIDATED (ny registerrække); eksportens bytes er uændrede.

seg-e77e1ac87dd5 = <b>GNSS/INS på KF-GINS-datasættet</b> ({ "0.36" }, WP-09, FUT-17): <c1/> indlæsere og kører samt målemodellen for lever-arm i den lukkede EKF-sløjfe. På KF-GINS-demodatasættet (hentet ved testtidspunktet, ikke medleveret) er Kshanas horisontale RMS i forhold til referencebanen { "1.09" } cm mod KF-GINS' egne { "1.11" } cm, og alle præregistrerede tærskler holdt. VALIDATED på data-gated evidens (ejerens beslutning, 2026-10-13): datasættet hentes med SHA-256-fastlåsninger, og fremgangsmåden til at gengive resultatet står i <c2/>.

seg-4d5a503c5c9c = <b>Koblet PNT-filter i fusionspakken</b> ({ "0.36" }, WP-09, FUT-16): typen <c1/> tager en valgfri tabel <c2/>, som kører ét stakket filter på pseudoafstande med en accelerometerbias-tilstand (<c3/>), og <c4/> er den 3D-version med 8 tilstande. Nyt medfølgende scenarie <c5/>: med biasede accelerometre holder den koblede tilstand kvantesuitens position til { "18.7" } m (95. percentil) med fuld integritet, hvor de afkoblede filtre når { "430" } m. Uden tabellen er både <c6/> og <c7/> uændrede (fastlåst); <c8/> afviser tabellen. MODELLED.

seg-b7f07e3693df = <b>GNSS/INS-pakker til søfart, jernbane og luftfart</b> ({ "0.36" }, WP-09, RM-21): medfølgende scenarier <c1/>, <c2/> og <c3/> på banebiblioteket og en valgfri tabel <c4/> for typen <c5/>, der fusionerer pseudoafstande fra en SGP4-Walker-konstellation (alle satellitter ved nominel drift, de højeste få ved forringet drift). I jernbanepakken holder tæt kobling løsningen af navigationskvalitet på { "5.3" } m gennem en afgravning og en tunnel, mod { "12.9" } m ved løs kobling. Uden <c6/> er pakken uændret (fastlåst). MODELLED.

seg-0daf8b2646ad = <b>Tæt kobling med bærebølgefase</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, en fejltilstands-EKF med et eksplicit modtagerur med to tilstande og flydende bærebølge-multiplicitet, drevet af en SGP4-Walker-konstellation med Klobuchar- og Saastamoinen-korrektioner i målesløjfen, slipdetektion med tidsdifferentieret bærebølge og geninitialisering af multiplicitet samt en kørsel kun med kode på de samme målinger til sammenligning. MODELLED: på en kørsel i form af et 8-tal er bærebølgeløsningen { "2.5" } cm mod { "47" } cm kun med kode, og NIS/NEES er konsistente over seeds.

seg-7032646c0bc4 = <b>Banebibliotek for GNSS/INS</b> ({ "0.36" }, WP-09, RM-24): typen <c1/> tager en valgfri tabel <c2/> med <c3/>. Profilerne styrer Euler-rater og acceleration langs sporet ud fra referencetilstanden og udleder den sande IMU ud fra stiv-legeme-kinematik (koordinerede sving, stigninger, Coriolis); <c4/> importerer en referencebane (<c5/>) og løser den IMU, der gengiver den. Uden tabellen flyver pakken sin historiske kørsel, bit for bit (fastlåst). MODELLED.

seg-e6b31bf61185 = <b>DEM-fliser med bredde/længde til den månehorisont</b>: <c1/> læser en tekstflise <c2/> (højder over middelkuglen på et gitter af bredde og længde) i stedet for den polarstereografiske <c3/>, både for <c4/> og <c5/>; rapporten gentager flisen (<c6/>, med dens SHA-256). <c7/> er nu koblet ind i horisontens strålemarch. En flise, der er gensamplet fra det medleverede udsnit, giver stationen udsnittets horisont med en afvigelse på { "0.22" } grader. MODELLED.

seg-0c7ebb6c7d0d = <b>Terræn ved eksportstedet for servicevolumen</b>: med en sektion <c1/> bærer hver række i geometrieksporten pr. satellit for <c2/> feltet <c3/> (satellitten er fri af den flade maske og af eksportstedets horisont i dens azimut), rapporten bærer stedets horisont (<c4/>), og runtime-CSV'en får kolonnen. Uden terræn er eksporten uændret. MODELLED.

seg-7c8789777c26 = <b>Overskriftsfelter fra motoren</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> og WebAssembly-funktionen <c3/> angiver for tolv typer, hvilke felter i et scenarie der besvarer dets spørgsmål, de bedste først, som stier med punktum (<c4/>). Studio læser dem før sin egen rangering. Kun visningsmetadata: motoren læser dem aldrig, ingen scenariefil behøver dem, intet resultat afhænger af dem. <c5/> svigter, hvis en type ikke kan afsendes, eller en sti ikke findes i nogen af typens medfølgende scenarier (den fangede to stier, som Studios fladgjorte id'er havde stavet uden array-parenteserne).

seg-7528700924b2 = <b>Tabel fra type til modul fra motoren</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> og WebAssembly-funktionen <c3/> giver for hver scenarietype, hvis rækker i verifikationsmatrixen nævner et andet modul end typens eget, modulnavnene. Studios funktionskort brugte sin egen håndskrevne kopi; <c4/> svigter, hvis en type i tabellen ikke kan afsendes, eller et modul ikke står i nogen række i matrixen. Intet output er ændret.

seg-af7d28b7fb0e = <b>Kort IQ-kørsel i browserbuildet</b> ({ "0.36" }): <c1/> og <c2/> i WebAssembly-modulet bygger en syntetisk scene, opnår hver satellit og sporer de opnåede, alt i hukommelsen, begrænset til { "0.25" } s, { "1 000 000" } sampel og { "8" } satellitter. Scenebyggeren og opslaget af signaler efter navn er flyttet ud af <c3/>, der kun findes native (til <c4/> og <c5/>), så begge builds deler dem; kommandolinjens output er uændret. Den native test og <c6/> sammenligner den samme forespørgsel med én gylden reference (<c7/>), byte for byte: siden ændringen til portabel matematik (STUDIO-15, nedenfor) giver browserbuildet og det native build de samme bits.

seg-c0eab9b97b7d = <b>Typede API'er til Python og TypeScript</b> (CAP-34): <c1/> typer de lukkede ordforråd (<c2/>, hvert typenavn; <c3/>; <c4/>) og ordbøgerne <c5/> og <c6/>; <c7/> og <c8/> returnerer dem. WebAssembly-pakken tilføjer <c9/> (én kørsel som et typet <c10/>-objekt med det fortolkede dokument som <c11/>) og <c12/> (den fortolkede <c13/>), og dens <c14/> bærer det samme ordforråd; <c15/> er typet <c16/>. <c17/> holder begge lister lig motorens.

seg-b097c2f105c3 = <b>Enheder for hver kolonne i <c1/></b> (FUT-28): et resultat af <c2/> bærer nu <c3/> og <c4/>, enheden for hver gennemløbet nøgle og hver registreret metrik, læst fra den gennemløbne pakkes egen enhedstabel. En akse kan angive <c5/> for en nøgle, som pakken ikke gentager; en angivet enhed, der modsiger pakkens, afvises, og en enhed, som ingen af dem angiver, er <c6/>, aldrig gættet. <c7/> og <c8/> er beskrevet, så alle { "76" } typer nu er fuldt dækket af kontrollen af feltenheder (loft for ikke-dækkede typer { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>NumPy-arrays fra <c1/></b> (FUT-26): Python-typen <c2/> får <c3/>, <c4/> og <c5/>, som returnerer <c6/> for en numerisk liste, de numeriske kolonner i en liste af poster eller hver postrække i dokumentet. Hvert array er lig <c7/> af de samme værdier fra <c8/> (dtype og bits). NumPy importeres kun, når en af dem kaldes, og er ikke et krav til runtime. Typet i <c9/> og kontrolleret med stubtest.

seg-1c7a22dabad3 = <b>Kampagneoptimering</b> (CAP-32): typen <c1/> får en ny, valgfri sektion <c2/>, som inden for angivne grænser søger i én til tre scenarienøgler efter den bedste værdi af én metrik: minimér, maksimér eller ram et mål. Den søger udtømmende på et gitter eller med en deterministisk afgrænset Nelder–Mead-simpleks. Hver evaluering er en rigtig kørsel af den nævnte type og står i resultatets <c3/>. Eksempel: <c4/>. Tærsklerne blev præregistreret (<c5/>):

seg-f4e79236b6bf = tærsklen for Rosenbrock-funktionen er opfyldt (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = tærsklen for en 1D-målløsning i lukket form er opfyldt ({ "6e-15" } relativt);

seg-5ab478e03354 = gitteret er bit-lig med en uafhængig brute force;

seg-ea0a04c6e713 = simpleksen klarer sig mindst lige så godt som et gitter på { "41" } × { "41" } med { "177" } kørsler.

seg-161d8c5b55e8 = Tærsklen for 1D i runde { "1" } er noteret som NOT MET, fordi den præregistrerede boks udelukkede løsningen. MODELLED; registerrække "Bounded optimisation of one metric over campaign parameters". Additivt: kampagner uden sektionen er uændrede.

seg-83d40a636fcb = <b>Kalibreringsensembler</b> (CAP-10): tre kontroller med ét seed hver, kørt igen over { "200" } uafhængige seeds mod præregistrerede tærskler, i <a1><c1/></a1> (genereret af <c2/>; værdier pr. seed i <c3/>).

seg-b163e53e06e9 = Kampagnens Monte Carlo-bootstrapinterval på { "95" } % dækker det sande gennemsnit i { "192" } af { "200" } ensembler, og dens chi-i-anden-kontrol består i { "196" }.

seg-022a7fbee13a = Percentiltolerancen med ét seed består kun i { "183" } af { "200" }: NOT MET, som forudsagt. Det er en tærskel på omkring 2 sigma, noteret og ikke lempet.

seg-096f36d21b02 = ADEV-kalibreringerne for hvid FM består for hvert seed, med deres værste fejl langt inden for tolerancen.

seg-369c7f2a115c = <b>Indbyggede typer gennem trait'en <c1/></b> (FUT-27, i gang): trait'en <c2/> (<c3/>, med en tier-hook pr. figur og <c4/>) og de første typer, der er flyttet over på den (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Outputtet er uændret: en manifest for hele kataloget med SHA-256 af hvert output er identisk før og efter (<c10/>).

seg-fd6e68ff5e5d = <b>Kontrol af, at legepladsen ikke henter noget</b> (RM-07): <c1/> kontrollerer tre ting:

seg-3e424188f6e1 = hvert scenarie i Studios bibliotek er i browserbundlen;

seg-2803ccf8b9ae = bundlen er byte-identisk med <c1/>;

seg-b98016a4a844 = hvert browserscenarie kører fra en tom arbejdsmappe.

seg-efc143b4f2a9 = <b>Alt-PNT-kort: ægte tyngdefelt, Monte Carlo af kortfejl, SRTM i fuld opløsning</b> ({ "0.36" }, WP-10). Typen <c1/> tager en valgfri <c2/>: en tyngdeanomali syntetiseret ud fra de medfølgende EGM2008-koefficienter (eller en ICGEM-fil <c3/> via <c4/>, kun i native builds). Den syntese stemmer med ICGEM Calculation Service til omkring { "1e-8" } mGal over { "794" } knudepunkter i to regioner, mod præregistrerede tærskler på { "0.005" } mGal RMS og { "0.02" } mGal maks. (VALIDATED; registerrække "Gravity-anomaly synthesis from a spherical-harmonic model"). Det nye medfølgende scenarie <c5/> kører benchmarken på 60 minutter på det ægte felt af grad 70. Præregistreret udfald: den matchede fejl er { "3106" } m, så tærsklen på < { "500" } m er NOT MET, som forudsagt (grad { "70" } er for glat), og den tidoblede nedsættelse af driften er MET (MODELLED). En valgfri <c6/> kører benchmarken igen over seedede, gaussisk korrelerede kortfejl og rapporterer fordelingen af den matchede fejl (medfølgende scenarie <c7/>). Eksplorativ og ikke præregistreret: med en kortfejl på { "2" } mGal, korreleret over { "0.2" } grader (den størrelse, som matcherens egen sigma-budgettering regner med), holder { "1" } af { "20" } realiseringer sig inden for { "500" } m (median { "2.9" } km, p95 { "14.7" } km), mod { "144" } m med et perfekt kort. Den syntetiske benchmarks positionsbestemmelse under 500 m forudsætter, at kortet er nøjagtigt. Uden nogen af mulighederne er dokumentet byte-identisk med tidligere udgivelser. <c8/> tager en valgfri <c9/> (<c10/>, <c11/>), som læser den magnetiske kanal fra en CSV i EMAG2v3-format. EMAG2 er ikke medleveret, fordi dets vilkår ikke er eksplicitte: <c12/> henter det med en fastlåst SHA-256 og beskærer en boks. Der hævdes intet navigationsresultat på det ægte EMAG2-gitter. Fælles kortestimering (terræn-SLAM, RM-18): <c13/> flyver den sekventielle terrænnavigator over et lagret kort, der afviger fra referencen, enten ved at stole på det eller ved at estimere en korrektion af kortet pr. celle med et Rao-Blackwelliseret filter i stil med FastSLAM. Præregistreret mod SITAN med kendt kort på en korreleret kortfejl på { "15" } m over { "20" } seeds: en gevinst på { "1.5" } % i gennemsnit, bedre i { "10" } af { "20" }, så begge tærskler for forbedring er NOT MET ({ "10" } % og { "12" } af { "20" }), uden skade på et perfekt kort (MET). Et enkelt gennemløb uden genbesøg lader ikke kortet læres (<c14/>, MODELLED). Dokumenter for <c15/> er byte-identiske. Testene med ægte SRTM kører nu i CI på to indsendte udsnit i fuld opløsning; alle præregistrerede tærskler er opfyldt, med det nærmeste knudepunkt lig GDAL { "3.8.4" } i { "8" } af { "8" } punkter (<c16/>).

seg-aa7ac7a47111 = <b>Interoperabilitet, WP-08</b> ({ "0.36" }; hvert punkt præregistreret og indsendt alene før kørslen mod dets uafhængige reference, hvert en ny registerrække med VALIDATED undtagen punktet om telemetri, som udvider en eksisterende række):

seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 og OCM { "3.0" } (blokkene TRAJ, PHYS, COV, MAN, USER) skrevet og læst i KVN og NDM/XML samt en OMM i fuld præcision fra et SGP4-elementsæt (<c2/>); outputtet fra <c3/> er uændret. Mod Orekit { "13.1.8" } begge veje: { "27" } af { "30" } Kshana-meddelelser kan fortolkes i Orekit, og Kshana læser enhver meddelelse skrevet af Orekit, værdier inden for { "1e-14" } relativt og epoker inden for { "1e-9" } s; fire fund fastlåst (Orekit kræver <c4/>, afviser <c5/> i brugerdefinerede XML-parametre, vil ikke skrive <c6/> uden <c7/> og læser relative OCM-epoker under TDB i SI-sekunder). Den ældre OMM-skrivers <c8/> afvises af Orekit (noteret). Række "CCSDS Orbit Data Messages (OPM, OMM, OCM)".

seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 og APM { "2.0" } i KVN og XML mod Orekit { "13.1.8" }, alle tærskler opfyldt; Orekits APM-skriver afviser et manøvre uden <c3/> (fastlåst). Række "CCSDS Attitude Data Messages (AEM, APM)".

seg-bdfce382a98c = <b>SPICE SPK-eksport</b> (<c1/>): skriver og læser til SPK-typerne { "9" } og { "13" } samt eksport fra OEM til SPK; mod CSPICE N0067 er kernerne byte-identiske med SPICE's og evalueres bit-identisk. Række "SPICE SPK export (types { "9" } and { "13" })".

seg-ce217acb9fe7 = <b>SPICE SPK-typerne { "3" } og { "21" }</b> (<c1/>): segmenter af type { "3" } (Chebyshev) og type { "21" } (udvidede differenslinjer) skrevet ud fra givne poster og evalueret, som SPICE gør; mod CSPICE N0067 er kernerne byte-identiske med SPICE's, og hver evaluering stemmer bit for bit begge veje. Række "SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)".

seg-72b8edbc74dc = <b>Udvidelser af Space Packet</b> (<c1/>): sekundær header med tidskoderne CUC/CDS, pakkefejlkontrol, segmentering og strømkontroller, mod ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } og CPython <c2/>, nul afvigelser. Række "CCSDS Space Packet secondary header, packet error control and segmentation".

seg-c5fcf933b656 = <b>Telemetriskema { "1.3" } gennem rigtige forbrugere</b>: Prometheus-eksponeringen og OTLP/HTTP-JSON for en syntetisk strøm i skema 1.3, herunder geometriserien og etiketten <c1/>, læst nøjagtigt af prometheus_client og OTLP-proto, accepteret af promtool { "3.5.0" } <c2/> uden lint-problemer og sendt uændret gennem OpenTelemetry Collector contrib { "0.135.0" } (data-gated: værktøjer hentet med fastlåst SHA-256, output indsendt).

seg-013344665417 = <b>Banebestemmelse for Mars, kørsel { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skalerer normalmatricen med dens diagonal og dæmper trinnet (Levenberg-Marquardt), efter at den registrerede Gauss-Newton-tilpasning svigtede på en matrix, hvis rå diagonal spænder over otte størrelsesordener. Registreret særskilt (<c2/>, samme bue, tærskler og redigering). På de bedømte MRO-passager ligger banen inden for { "0.36" } km RMS ({ "0.53" } km maksimum) fra MRO's navigationsrekonstruktion, tærskler opfyldt. Doppleren efter tilpasningen er { "48.6" } mHz mod tærsklen på { "30" } mHz, ikke opfyldt (fund fastlåst). Et tillæg kun til bedømmelsen, R2-A1, er oplyst i <c3/>. Rækken forbliver MODELLED.

seg-fee311480417 = <b>Model for rampet 2-vejs-Doppler for Mars og banebestemmelse</b> ({ "0.36" }, WP-14, del af CAP-30, trin { "2" }): <c1/> forudsiger DSN's rampede 2-vejs-Doppler i X-bånd ud fra ODF-ramptabeller (lystid, Shapiro, troposfære, stationstid, DSN-stationer via CIO-kæden og IERS EOP) og tilpasser en Mars-orbiter (GMM-3, tredjelegemer, SRP, luftmodstand). <c2/> læser SPK-type { "1" } (kontrolleret mod CSPICE), og <c3/> læser PDS SHADR-felter. Præregistreret mod MRO's navigationsrekonstruktion på rigtige MRO-passager (data-gated, <c4/>, månedlig CI): den forudsagte Doppler stemmer med observationerne til { "12.5" } mHz (tærskel { "30" } mHz, opfyldt); den registrerede banetilpasning svigtede på den bedømte bue og gav ingen bane (fund fastlåst). Rækken forbliver MODELLED.

seg-d8212aa309ef = <b>Læser til DSN Orbit Data File</b> ({ "0.36" }, WP-14, del af CAP-30): <c1/> læser TRK-2-18-ODF'er. På en rigtig ODF fra Mars Reconnaissance Orbiter (NASA PDS, medleveret) stemmer læseren med PDS-etikettens antal poster, gruppepositioner, stationer og tider, og alle dens datatyper er kendt. Etikettens tabel over filslutning er én række kortere end filen, en modstrid i etiketten, noteret som et fund. MODELLED. Banebestemmelse på disse data er endnu ikke udført.

seg-bf26920a50bc = <b>TWSTFT-budget og stabilitet af tidsoverførsel: typen <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Tovejsligning:

seg-c1fdd431db57 = <c1/> løser den for T_A − T_B med stationsudstyrets forsinkelser, asymmetrien i ionosfæren mellem op- og nedlink i Ku-bånd, forskellen i transponderforsinkelse og Sagnac-leddene, og genfinder fremadmodellen til { "1e-15" } s.

seg-a5468765380d = <b>Usikkerhedsbudget:</b> kombineret kvadratisk, med linkens TDEV som type A-led.

seg-7f365f91bb3e = <b>Linkstøj:</b> tovejsrækken får et gulv af flicker-fasestøj, en dagsvarierende ikke-gensidighed og en konstant rest af gensidighed. Pakken <c1/> med hvid jitter er uændret.

seg-8b40e74db08c = <b>Rigtig række:</b> stabiliteten af leverede BIPM Circular T-, <c1/>-CSV- eller IGS-stationsurrækker.

seg-267fd20d823c = MODELLED. Nyt medfølgende scenarie <c1/>. PPP-tidsløsningen er særskilt VALIDATED mod IGS-stationsuret på grenen med rigtige GNSS-data.

seg-ae33b92da4a6 = <b>Opvarmning ved indtrængen, EO-radiometri og tab under opstigning</b> ({ "0.36" }, WP-14, CAP-28): tre nye typer.

seg-34951878aa49 = <c1/>: en indtrængen som punktmasse med 3 frihedsgrader over en roterende Jord eller Mars med Sutton-Graves-opvarmning i stagnationspunktet.

seg-98fe7a4c464a = <c1/>: billeddannerens SNR, MTF ved Nyquist, relativ kantrespons og GIQE { "4" } NIIRS.

seg-173dfbe3cc3e = <c1/>: en opstigning i flere trin med tyngdekraftssving og tab fra tyngdekraft, luftmodstand, styring og modtryk, kontrolleret med den eksakte identitet ideelt dv minus tab.

seg-0c9e7aacec80 = Indtrængningens maksimale deceleration blev kontrolleret mod det offentliggjorte nominelle Stardust-forløb med en præregistreret tærskel: { "35.44" } g mod { "33.4" } g (+{ "6.1" } %, tærskel { "10" } %). Den række er VALIDATED. Opvarmning, radiometri og opstigning er MODELLED. Nyt er også: <c1/>, medfølgende scenarier <c2/>, <c3/> og <c4/> samt <c5/>.

seg-d4648c4e6655 = <b>Attitudestyring med reaktionshjul: typen <c1/></b> ({ "0.36" }, WP-14, CAP-21). Et inertialt peg-slew af et stift hub med tre eller flere afbalancerede reaktionshjul under MRP-feedback, med minimumsnorm-momenter til hjulene begrænset til hver motors grænse (<c2/>). Den kan også lukke sløjfen på et multiplikativt EKF ud fra et simuleret gyro og en stjernekamera (<c3/>). Sløjfen med sand tilstand blev sammenlignet med Basilisk { "2.9.1" } på tre tilfælde, præregistreret før koden fandtes (tre ortogonale hjul, en firehjuls pyramide, et mættende tilfælde). Hver MRP-komponent, kropsrate, hjulhastighed og motormoment stemte ved hver sampling, værst { "2.4e-14" } i sigma og { "2.9e-11" } rad/s i hjulhastighed. Denne række er VALIDATED; MEKF er MODELLED (NEES-konsistens). Nye medfølgende scenarier <c4/> og <c5/> samt <c6/>.

seg-8ce699586340 = <b>Planlægning af jordkontakter og DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): to nye scenarietyper. <c1/> angiver for én satellit over én station hver passages Es/N0 og den DVB-S2 MODCOD, der vælges undervejs (tærskler fra ETSI EN { "302" } 307-1 tabel { "13" } plus en margin). Den angiver også den datamængde, ACM flytter i forhold til baseline med konstant kodning. <c2/> gør det samme for flere satellitter over flere stationer og bygger en konfliktfri kontaktplan (antennens omstillingstid, én station pr. satellit, prioritetsvægtet levering begrænset af hver bagstand). Den rapporterer en grådig plan med marginalværdi, en først-til-mølle-baseline og det eksakte optimum for små mængder, med den grådige plans optimalitetsgab. Adgangsvinduerne kommer fra den VALIDATED forudsigelse af tilsyneladende passager. Nye medfølgende scenarier <c3/> og <c4/> (illustrative inputdata) og <c5/>. MODELLED (to nye registerrækker).

seg-cd6dbcc3a78b = <b>Starlink-Doppler-positionsbestemmelse mod et offentliggjort eksperiment</b> ({ "0.36" }, WP-14, del af CAP-11, MODELLED). Det er en præregistreret proxy-sammenligning af Doppler-tilstanden i <c1/> med forudindstillingen <c2/> mod percentilerne for datasæt 3 i "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Modellen brugte { "3" } satellitter (en maske på { "47" } grader valgt efter en fast regel), ingen højdestøtte og en Doppler-sigma på { "30" } Hz, over { "200" } seeds. Dens 3D-fejl i 90. percentil er { "92.2" } m ved { "20" } s og { "870" } m ved { "8" } s, mod de offentliggjorte { "2" } m og { "10" } m, så begge tærskler på en faktor to er NOT MET. Modellen er pessimistisk, ikke optimistisk som forudsagt: tre faste satellitter giver langt mindre geometrisk diversitet end eksperimentets { "63" } satellitter over { "10" } minutter med kanalskift hvert { "15" } s. Begge misser er kontrolleret ved assertion (<c3/>).

seg-ffeb1b66cda5 = <b>Optimering af impulsive overførsler på DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> finder afgangs- og ankomstdatoerne for en ballistisk to-impuls-overførsel med én omdrejning, der minimerer C3 ved afgang eller V-infinity ved ankomst inden for type I eller type II. Den søger i et gitter på 2 dage og forfiner derefter med 2D Nelder-Mead, på heliocentriske tilstande fra DE440-kernen; den bygger på <c2/>. Sammenligningen blev præregistreret (bf0439e8) mod en uafhængig optimering med SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } på mulighederne for Jord til Mars i { "2026" }: alle fire optimeringer stemmer til { "8.7e-13" } relativt, med datoer inden for { "1e-5" } dag (VALIDATED, ny registerrække). Som sekundær offentliggjort reference matches NASA/TM-2010-216764 (håndbogen for Jord til Mars 2026-2045) for minimum C3 af type II ({ "9.182" } mod { "9.144" }) og minimum V-infinity ved ankomst af type II ({ "2.564" } mod { "2.565" }). Dens minimum C3 af type I matches ikke: { "10.535" } mod { "11.11" } (-5.18 %), hvor bibliotekets uafhængige reference er enig med Kshana. Den miss er noteret og kontrolleret ved assertion.

seg-91fe2e2625a1 = <b>Studie af en månereferencestation</b> ({ "0.36" }, foranlediget af offentliggjort materiale om en planlagt referencestation ved månens sydpol; kilder i <a1><c1/></a1>): typen <c2/>, et Monte Carlo-gennemløb af den lunare differentielle PNT-model over et sydpolart brugergitter og et døgn af epoker, som giver pr. punkt og over regionen percentilerne for korrigeret og ukorrigeret fejl, tilgængelighed med årsager, dækning mod en angivet tærskel, beskyttelsesniveauer, dækningsradius pr. azimut og korrektionslinkens budget. Den reduceres præcist til <c3/> ved ét punkt, én epoke og ét forsøg; dens aritmetik blev regnet om af numpy med en præregistreret tærskel (positioner og percentiler opfyldt; stationskorrektionerne missede deres på grund af afrunding i dobbelt præcision, noteret). MODELLED; registerrække "Lunar reference-station coverage and accuracy map". Ikke tilknyttet eller støttet af noget agentur; ingen udtalelse om ydeevnen af noget rigtigt system.

seg-3d0cd9692787 = <b>Præregistreret forudsigelse: dækning af en månereferencestation</b> (ikke en validering; MODELLED). <a1><c1/></a1> fryser ved commit c05dac1d resultaterne fra <c2/> under de offentligt angivne antagelser, med SHA-256-hashes af inputdata og resultater og en bedømmelsesprotokol fastlagt nu (faktor { "2" } for nøjagtigheder og beskyttelsesniveauer, { "10" } procentpoint for tilgængelighed og dækning; en ændret antagelse får en ny dateret forudsigelse, aldrig en redigering; en miss offentliggøres lige så tydeligt som et hit). Hvert tal domineres af det ikke offentliggjorte elementsæt for konstellationen på fire satellitter, som er ILLUSTRATIVE, og siger det. <c3/> vogter den; <c4/> får en sektion "Pre-registered predictions". Ingen registerrække.

seg-00ec7ccd4d0d = <b>Udvidelser af månereferencestationen</b> ({ "0.36" }; stationsstudiets begrænsninger { "2" } og { "3" } samt kildernes løsningsstil), hver valgfri på <c1/> og fraværende som standard, så ethvert eksisterende dokument, også den frosne forudsigelse, er uændret: <c2/> (multipath <c3/> hos brugeren og stationen, stationens eventuelt Gauss-Markov over epoker, DLL-kodestøj ud fra C/N0, biaser mellem kanaler; værdier ILLUSTRATIVE på Månen); <c4/> (lineær vækst af den udsendte banefejl over korrektionens latenstid, ILLUSTRATIVE); <c5/> (højdebegrænsning, et minimum på tre satellitter med den, et vindue for statisk bruger over epoker). To tillæg til sammenligningen med offentliggjorte påstande, hver præregistreret alene før sin kørsel, står ved siden af den uredigerede registrerede kørsel: K5 med vækst svigter ved enhver rate; med kildernes løsningsstil svigter K1 til K5, og K6 består ({ "1" } af { "6" }), idet R300's korrigerede 3D-fejl i p95 falder fra { "280.6" } m til { "2.11" } m. MODELLED; tre registerrækker.

seg-1d0a0dcd42de = <b>Horisontmasker for månens terræn</b> ({ "0.36" }; første begrænsning i studiet af månereferencestationen): en valgfri sektion <c1/> på <c2/> (stationen og hvert brugerpunkt) og <c3/> (hvert gitterpunkt) giver hvert sted en azimutafhængig horisont i skyline-tabelformatet fra { "0.36" }, ud fra en angiven profil mærket med sin kilde (<c4/>, <c5/>) og/eller en strålemarch over en polar DEM (<c6/>) langs storcirkler på månekuglen med eksakt krumning. Den medleverer et udsnit på { "0.98" } MB af den offentligt tilgængelige LRO LOLA-sydpol-DEM <c7/>, gensamplet som middelværdi af blokke på { "5" } x { "5" } til { "1200" } m (<c8/>, med dens NOTICE, SHA-256 og <c9/>), og scenariet <c10/>, som kun findes i repositoriet. Kontrolleret mod horisonter i lukket form (bar kugle, krater i et plateau, rasteriseret kegle); MODELLED, registerrække "Lunar terrain horizon masks from a stated profile or a polar DEM". Uden sektionen er ethvert dokument, også enhedsblokken, byte-identisk.

seg-ca0c6ca7396a = <b>Geometribevidst tillid</b> (designnote for { "0.36" } om geometri, sektion { "4" }). Hver epoke i <c1/>, statisk eller for fartøj, batch eller live, bærer sin satellitgeometri: <c2/>, <c3/> (årsager <c4/>, <c5/>, <c6/> og den informative <c7/>) eller <c8/>, hvor loggen ikke angiver nogen satellitgeometri, med HDOP, PDOP, VDOP og de anvendte satellitter. Den udledes af de elevationer og azimutter, som modtageren rapporterer (NMEA GSV, UBX NAV-SAT), gennem den eksisterende kerne <c9/>, eller tages fra NMEA GSA. Hver epoke bærer også en etiket, <c10/>, <c11/> eller <c12/>, altid rapporteret og aldrig scoret, og en note med HDOP, PDOP, VDOP, antal satellitter og signaltab i ord. Et fartøjs score får en monitor <c13/>, der ikke trækker noget fra, medmindre geometrien er dårlig (HDOP over { "4" }, PDOP over { "6" } eller færre end { "5" } anvendte satellitter), og derefter rampes op til et loft på { "15" } point; geometri alene når højst det forringede bånd, aldrig det utroværdige (ingen alarm). Hvert fradrag får en klasse, <c14/>, <c15/> eller <c16/>, så en dårlig himmel ikke læses som et angreb. <c17/> er <c18/>, når de satellitter, der gik tabt, alle var under { "15" } grader ved deres seneste rapport; et fradrag for dårlig geometri er <c19/>, når den HDOP, modtageren angiver, afviger fra dens angivne himmel med mere end max({ "1.0" }, { "25" } % af den udledte HDOP), så en forfalsket dårlig himmel ikke kan købe etiketten. En ny tabel <c20/> angiver hver tærskel med dens proveniens (HDOP { "4" }, PDOP { "6" }, mindst { "5" } anvendte, sigma_UERE { "1.5" } m, en HDOP-tolerance på max({ "1.0" }, { "25" } % af den udledte HDOP), hvor de { "25" } % er et repræsentativt valg for modtagere med ure pr. konstellation eller delmængdeløsninger, { "15" } grader; tallene fra IEC 61108-1 og GPS SPS som citeret, der skal kontrolleres mod standardernes tekst). Totalt signaltab mærkes ikke som himmel: når satellitter i sigte ikke spores, og DOP for de satellitter, der er i sigte, er god (og de usporede ikke er samlet i den ene halvdel af horisonten), bærer epoken <c21/>, og geometrifradraget er <c22/>. En angivet HDOP eller PDOP på { "99" } eller derover, GGA-kvalitet { "0" } og GSA-tilstand { "1" } læses som ingen positionsbestemmelse, ikke som DOP. Loftet (<c23/> { "15" }), rampens slutning (<c24/> { "1.5" }) og gulvet (<c25/>, som standard scorens <c26/>) står i <c27/>, ligesom etikettens gode niveauer (HDOP { "2" }, PDOP { "3" }, { "6" } satellitter, repræsentative); det gældende loft er <c28/>, så en tabel <c29/>, der hæver <c30/> (også en på { "0.35" }), sænker loftet i stedet for at blive afvist, og et gulv under <c31/> afvises. MODELLED; Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-d976d3495695 = Geometrien når alle flader: resultat-JSON (<c1/>, <c2/> på hvert fradrag, <c3/>, <c4/>), de levende JSON-linjer (skema { "1.3" }), Python og WebAssembly <c5/>, <c6/> og <c7/>, MCP-værktøjerne <c8/>, bevispakker (<c9/>, <c10/>, et geometrispor på oversigtssiden) og <c11/> (Prometheus <c12/> og en etiket <c13/> på <c14/>, OTLP <c15/>, CEF-brugerfelter <c16/> (geometristatus og klasser), <c17/> (HDOP) og <c18/> (PDOP), kontrolleret mod begge CEF-referenceparsere, og LEEF <c19/>, <c20/>, <c21/>). Geometrietiketten eksporteres også, tilføjet efter alle tidligere rækker og felter og kun for inputdata, der bærer den: Prometheus <c22/> og <c23/>, OTLP <c24/> og <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, og CEF et tredje felt <c30/> (etiketten) og <c31/> (anvendte satellitter); VDOP er ikke i CEF (flydende-komma-brugerfelterne er optaget). Begge CEF-referenceparsere læser etiketttilfældene tilbage, som de blev skrevet (ændring { "5" }: { "176" } linjer, { "172" } fortolket af pycef, { "176" } af Logstash). En angivet HDOP, som den angivne himmel ikke forklarer, markeres på hver epoke og tælles (<c32/>, en linje på bevisets oversigtsside), og scores kun, når geometrien er dårlig. Signaltab eksporteres for sig, da geometristatus forbliver <c33/>, mens det varer: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; i CEF vises det som klassen <c37/> i <c38/>.

seg-5030e5214ed0 = <c1/>: kovariansfaktoren <c2/> bag <c3/>, udskilt fra den med den samme aritmetik.

seg-c6cc061a3ed6 = Registerrække "Position error from geometry: RMS error = sigma_UERE x DOP" (<b>MODELLED</b>, intern konsistens): et seedet Monte Carlo af motorens mindste-kvadraters positionsbestemmelse på de { "8" } DOP-geometrier, der er matchet med gnss_lib_py, mod kovariansfaktoren i den validerede DOP-kerne, med tolerancer præregistreret før den første kørsel og to negative kontroller, der svigter som krævet; ved siden af en tidligere kontrol på fire håndvalgte himle med chi-i-anden-konfidensintervaller, rapporteret som kørt før præregistreringen.

seg-b87b6eafd465 = <b>Azimutafhængige skyline-masker</b> (<c1/>, <a1><c2/></a1>, punkt { "1" } i designnoten): et elevationsafskær, der afhænger af azimut, det punktvise maksimum af tabeller (hver interpoleret for sig, omviklet ved { "360" }°), en gadekløft i lukket form (med valgfri åbne ender), skarpkantede sektorer og en terrænprofil med Jordens krumning; det effektive afskær er <c3/>. Fire REPRESENTATIVE forudindstillinger med angivet proveniens (<c4/>, <c5/>, <c6/>, <c7/>), som kan tilsidesættes felt for felt. En valgfri sektion <c8/> i <c9/>, <c10/>, <c11/> (hver tilstand, også det polare gennemløb), <c12/> og træningsfilerne <c13/>, og i <c14/> og <c15/> gennem en ny bruger på et jordsted, <c16/> (geodætiske sigtevinkler på den roterende Jord, med den geodætiske opretning for den horisontale og vertikale opdeling i ARAIM; hver sampling er ét absolut tidspunkt, <c17/>, som elementsæt, udsendte efemerider og SP3-filer fremføres til fra deres egne epoker, dateret fra den nyeste satellitepoke, når ingen <c18/> er angivet; en kredsende <c19/> afviser en skyline). Resultater får <c20/> og <c21/> pr. sampling. Uden sektionen er ethvert scenarie byte-identisk med { "0.35.0" }, kontrolleret mod digests fra udgivelsens commit. Seks medfølgende eksempler: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> og kampagnen <c27/> (kløften for det autonome køretøj som et fladt afskær og som en gade; den eksisterende kampagne er uændret). MODELLED.

seg-95cdecf341d6 = <b>Funktioner for himmelgeometri</b> (<c1/>, punkt { "2" } i designnoten): <c2/> (synlige og maskerede satellitter fra et sted, et tidspunkt og konstellationsforudindstillinger, two-line-elementsæt (<c3/>, højst { "4" } MiB, propageret af motorens SGP4 til et UTC-<c4/>) eller givne satellitter; <c5/> og <c6/> angiver, om himlen er repræsentativ eller den himmel, elementsættene giver på den epoke, ikke en måling; <c7/> opregner hver ubrugt linje med dens årsag; grænser for input på { "2000" } satellitter over horisonten, kontrolleret før en systemtabel bygges, og { "16" } modtagerure; de fem DOP'er; ENU-kofaktoren og -kovariansen med ét ur pr. system eller ét fælles; den horisontale fejlellipse ved én sigma og ved en angiven konfidens), <c8/> (seedede mindste-kvadraters fejl, højst { "5000" }), <c9/>, <c10/> og <c11/>. <c12/> eksponerer kovariansen bag <c13/>, som nu er dens reduktion (de validerede skalarer er uændrede). Flader: <c14/> og <c15/>, Python- og WASM-funktioner med de samme navne og MCP-værktøjet <c16/> ({ "40" } værktøjer) samt notebooken <c17/> (med dens spejl <c18/>; kørt af <c19/>). Hvert resultat bærer etiketten MODELLED, erklæringen om fejlmodellen og den vejledende erklæring.

seg-9414d387cf79 = Register: fem rækker om skyline og himmelgeometri. <b>VALIDATED</b>, hver i en sammenligning præregistreret før dens uafhængige reference blev kørt: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> mod Orekit { "12.2" } (<c1/>, <c2/>) og gnss_lib_py { "1.0.4" } (<c3/>), værste forskelle i sigtevinkel og maske { "1.1e-12" }° mod { "1e-9" }°, identiske synlige mængder, DOP { "3.3e-13" } relativt (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> mod numpy <c5/> og <c6/> (standard P2), { "270" } tilfælde, akser { "5.1e-13" } relativt (<c7/>). <b>MODELLED</b>: reduktionerne for kløft, sektor og terræn; forudindstillingerne; sammensætningen af himmelgeometri (forudindstillet himmel, Monte Carlo-sky).

seg-8f5ebce999fe = Med rækkerne om geometritillid, skyline og månereferencestation har registret { "274" } rækker: { "134" } validerede, { "136" } modellerede, { "4" } partner.

seg-686b1211d7bb = <b>Månereferencestation: stationens tidslaboratorium</b> (<b>MODELLED</b>). En valgfri blok <c1/> på <c2/> (<c3/>). Den modellerer et stationsur (som standard klassen miniRAFS, enhver navngiven klasse eller et enhedskort tilpasset angivne stabilitetspunkter) styret til LTC, derefter frit løbende eller styret igen hvert N. sekund. Den udsender kurven for tidsfejl x(t), tiden til { "1" }, { "10" } og { "100" } ns (bisektion ved siden af den lukkede form) og det dominerende led pr. horisont, alt med enheder. Resten efter styringen er ILLUSTRATIVE. LTC-raten er ikke udledt igen og beholder sin egen VALIDATED række. Nanosekundmålet i det offentlige ICG WG-B-materiale om lunar PNT (juni { "2024" }) citeres som en kildeudtalelse, ikke en påstand. Rækkefølgen optisk < PHM < RAFS < miniRAFS gælder fra { "1" } s til { "7e5" } s, og testen fastlåser krydsningen mellem PHM- og RAFS-kurverne nær { "7.5e5" } s. Den krydsning er en egenskab ved urmodeller med én støjtype (ren flicker-FM mod ren hvid FM), ikke et fysisk resultat. Uden blokken er rapporten, dens tabel og dens oversigt uændrede. Eksempel: <c4/>. Tilføjer én registerrække, mærket MODELLED.

seg-863c2c7a5f0b = <b>Månereferencestation: stationsgeodæsi</b> (<b>MODELLED</b>). Valgfrie inputdata <c1/> og <c2/> på <c3/> tilføjer en blok <c4/>. Datuminformationen i fem arrays fra det arkiverede udsnit af laserafstandsmåling kombineres med det, som en tilføjet retroreflektor og et tilføjet VLBI-beacon på angivne steder ville bidrage med. Reflektoren afstandsmåles på de arkiverede epoker, den kan se, med deres arkiverede vægte. Beaconet bruger netværket og skemaet fra <c5/>, med stationerne fastholdt. Blokken giver hver Helmert-1-sigma før og efter og deres forhold. Det er Cramér-Rao-grænser for et reduceret parametersæt, på et ILLUSTRATIVE skema og sted. Manglende eller tomme inputdata lader rapporten være byte-identisk. Eksempler: <c6/> og <c7/>. Tilføjer én registerrække, mærket MODELLED.

seg-45c6febcc7fc = <b>Månereferencestation: sammenligning med offentliggjorte påstande</b> (<b>MODELLED</b>). Hver numerisk påstand i fem offentlige kilder er opregnet med sin nøjagtige ordlyd, side og angivne antagelser og klassificeret som sammenlignelig, delvis sammenlignelig eller ikke sammenlignelig (<c1/>; kilder med URL, hentedato, SHA-256 og licens i <c2/>). De delvis sammenlignelige påstande blev bedømt med seks ensidede tærskler, præregistreret før kørslen (<c3/>, revision { "2" }, 05bf9a19): { "1" } af { "6" } påstande inden for den præregistrerede tærskel (præregistreret 05bf9a19). Dækningen er { "0.00" } mod >= { "0.95" } på begge sydpolare cirkler, og den korrigerede p95 er { "280.6" } m mod <= { "1.5" } m. Årsagen er satellitternes banelementer, som ingen kilde offentliggør: på de ILLUSTRATIVE elementer i træet er fire satellitter i fælles sigte i { "8" } % af epokerne, ved næsten singulær geometri. Kørslen gengiver ikke påstandene på de elementer og er ikke belæg for, at påstandene er forkerte. Fastlåst i <c4/>. Én registerrække, mærket MODELLED med fundet.

seg-2b01d2ccb666 = <b>Månereferencestation: dataparathed for urfiler</b>. <c1/> angiver nu tidssystemet for sine epoker. Det er værdien <c2/>, eller, når den ikke er angivet, standarden for headerens satellitsystem. Resultatet angiver også, om systemet var angivet. Funktionen afviser et ukendt tidssystem (for eksempel en lunar tidsskala), en fil med blandede systemer uden angivelse og filer, der er uenige, i stedet for at læse dem som GPS-tid. Den leveres med en syntetisk fixture for stationsur. Intet format for korrektionsfiler er defineret, fordi der ikke findes noget offentligt.

seg-0fb89eb36003 = Ændret

seg-b63c95f12bc4 = Moduldokumentationen for <c1/>, <c2/> og <c3/> kalder ikke længere navigatoren med UKF med 17 tilstande, den fulde INS-tætkobling og den eksplicitte urtilstand for fremtidigt arbejde; de peger på <c4/>, <c5/> og <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } afvises ikke længere</b> ({ "0.36" }, WP-07): en RINEX { "4" }-navigationsfil blev før afvist med vilje; den læses nu (se Tilføjet). For observationsfiler af version { "4" } og senere matches headeretiketter kun i kolonne 61-80, så de nye fritekstposter ikke kan passere for etiketter.

seg-5829841b58d7 = <b><c1/> læser rigtige IONEX-filer</b> ({ "0.36" }, WP-07): en fuld post med 16 værdier fylder kolonne 61-80, som læseren tog for en etiket, så den returnerede <c2/> for hver rigtig IONEX-fil. Den læser nu en post, hvis etiketfelt er numerisk, som værdier. Intet leveret output brugte den.

seg-a66bd6592b93 = <b>Modtagne effekter for Galileo E1 og E5a efter OS SIS ICD Issue { "2.1" }</b> (revision, 2026-10-14). Spektrumbåndene <c1/> og <c2/> og de GNSS-ofre med LEO-signaler, der henter deres effekt fra dem, bruger nu de mindste modtagne effekter i tabel { "12" } i Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (var −{ "157.0" }) og −{ "155.25" } dBW (var −{ "155.0" }).

seg-b0386f62923f = Ni scenarieresultater flytter sig: spektrumeksemplerne, spektrumkampagnen, tre LEO-resiliensvertikaler og tre LEO-signaldesign. Effektiv C/N0 flytter sig −{ "0.25" } dB og J/S +{ "0.25" } dB på disse bånd.

seg-2af90bfcefae = Hver flyttet værdi ({ "1766" }, gammel → ny) er opregnet i <c1/> og dens CSV, med de dokumenttabeller, der flyttede sig. Ingen registerrække ændrer status.

seg-d468174b2d4c = Anden del, samme dag: LEO-signalofrene <c1/> (−{ "155.0" } → −{ "155.25" } dBW, tabel { "12" } E5b) og <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD'en har ingen række for fuldt E5-bånd, så AltBOC-værdien er effektsummen af totalerne for E5a og E5b i tabel { "12" }, bygget, som den gamle værdi blev. Tre resultater for LEO-signaldesign flytter sig ({ "64" } værdier: disse modtagne effekter og forringelsen af C/N0 fra LEO til GNSS på de to ofre), opregnet i samme revision (§{ "5" }) og CSV. Intet andet flytter sig.

seg-a96992246ef8 = <b>Rettelse af S2-atmosfæretiden</b> (<c1/>). Rays ({ "2001" }) harmoniske for S2-lufttryk er koefficienter for ikke-normaliseret <c2/> med cosinus-faseforsinkelser; de blev brugt som fuldt normaliserede med forsinkelsen som IERS' sinus-forspring. De indgår nu divideret med <c3/> med <c4/>; den nye <c5/> gengiver model A2 i GFZ STR06/01 tabel { "5" } for alle { "21" } bølger (værst { "0.0005" } cm, { "0.05" }°; VALIDATED). Kun output med tidevand slået til flytter sig: Galileo CI-tilpasningen { "0.132" } → { "0.133" } m, Swarm-A-komponenter med { "1" }–{ "2" } mm (præregistreret i <c6/>).

seg-6fa076226c01 = Kun dokumentation: <c1/>, <c2/> og <c3/> er dokumenteret som ældre løsere, numerisk uændrede, med henvisning til <c4/>.

seg-a757fd7ca793 = <b>Status for D9 runde { "3" } (<c1/>).</b> BIPM Circular T { "465" } udkom 2026-10-12. Den præregistrerede prospektive bedømmelse er stadig ikke kørt: nummer { "465" } rummer omkring { "285" } testværdier, og stopreglen kræver { "1000" }, altså omkring numrene { "465" }–{ "468" }. Kørslen kræver også de arkiverede filer pr. laboratorium fra 2026-09-30, fordi BIPM siden har omskrevet { "87" } af { "113" }. Registerrækken og testens header siger det; testen, dens tærskler og dens opdeling er uændrede.

seg-e064546d05ec = <b>Gennemgang af dokumentationens sandhed ({ "0.36" }).</b> Køreplan, funktionsrækker, statuslinjer i designdokumenter og modulkommentarer bragt på linje med koden; ingen ændringer i output. Punkter, der allerede er bygget, men stadig stod som åbne, er nu markeret som færdige: kontrollerne af ITU-T-masker, scenariet for holdover på { "24" } t og indlæsning af urlog (tidssynkronisering for telekommunikation), quickstarts for det første minut, Lense–Thirring og krydskontrollen af Orekit-propagatoren, GCRS-kæden med ITRF-præcision, gyldne hashes og hashes på tværs af platforme, proveniens, ARAIM med flere fejl (ADD v4.2), FDE med én satellit, CRPA-biblioteket, grænsen for CAI-fringe-multiplicitet, dimensionering af streets-of-coverage og 3D-banevisningen, stiv-legeme-attitudedynamik, OMM-skriveren og læseren af NAIF-kerner, DE440-libration for Månen, sætningen om kørslens betydning på legepladsen, <c1/>, navigatoren med tæt kobling og 17 tilstande og typen for tyngdekort. Rækkerne angiver også præcist, hvad der stadig er åbent (for eksempel JD i to dele i <c2/>, læseren <c3/> mod et rigtigt produkt og udelukkelse af flere satellitter i <c4/>). Den manglende <c5/> er skrevet ud fra en ny kørsel af dens tests (M1–M4 består), og udkastet til IQ-validering rettet mod partnere har aktuelle antal fra registret.

seg-e2290a640df7 = Hukommelseskoderne for Galileo E1 medleveres ikke længere.

seg-80f8ca869682 = <c1/> og <c2/> (ICD Annex C.7/C.8) er fjernet fra repositoriet og pakkerne. ICD'ens vilkår (citeret i <c3/>) lader en bruger gemme koderne med kilden angivet og bruge dem i et produkt, men tillader kun videredistribution til ikke-kommercielle formål, og Kshana tilbydes også under en kommerciel licens. <c4/> / <c5/> returnerer nu et <c6/> og læser brugerens egen kopi fra <c7/> / <c8/> eller, i et kildecheckout, fra <c9/>, hvor det nye <c10/> udtrækker dem fra ICD'ens PDF (hashkontrolleret). <c11/> / <c12/> er fjernet. Uden tabellerne returnerer Galileo E1-signalerne (<c13/>, <c14/>) en fejl, der siger, hvordan de skal leveres, og E1-testene springes over med en besked. Med tabellerne på plads er hvert E1-output uændret. Intet scenarie, ingen gylden reference og intet spektrumoutput bruger kodetabellerne. Testfixtures for E5a Annex C.3/C.4 (LFSR-referencen i <c15/>) håndteres på samme måde: hentet af det samme script, git-ignoreret, og testen springes over uden dem.

seg-654d0358137b = <b>Portabel matematik overalt</b> ({ "0.36" }, STUDIO-15): hver transcendent <c1/> i biblioteket og samplerne <c2/> for normal-, gamma- og eksponentialfordeling beregnes nu gennem det rene Rust-bibliotek <c3/> (<c4/>, <c5/>), så et native build og WebAssembly-buildet returnerer byte-identisk resultat-JSON for alle { "141" } medfølgende scenarier og for den korte IQ-kørsel. Prisen er, at de sidste bits i resultater beregnet med værtens matematikbibliotek flyttede sig: { "98" } af de { "141" } medfølgende scenarier ændrede sig, { "43" } gjorde ikke; { "5" } ændrede sig med mere end { "1e-3" } i deres største felt og resten med mindre. Hver flyttet værdi er opregnet gammel -> ny i <a1><c6/></a1> (med en CSV over alle { "136,127" } flyttede tal); ingen tærskel eller tolerance er ændret. Offentliggjorte tal, der ændrede sig: <c7/> tilgængelighed med Jordens afstand { "0.719" } -> { "0.713" } og RMS-fejl { "86.147" } -> { "86.499" } m (en epoke på tilgængelighedens kant afgøres nu på samme måde overalt; den gav { "0.725" } / { "85.800" } m på macOS arm64); <c8/> stationsfejl { "3.541350" } -> { "3.536885" } m med VLBI og { "2183.558" } -> { "2184.021" } m uden; <c9/>, otte værdier af <c10/> med { "3" } enheder på sidste decimal (erratum i den tekniske rapport); det udgivne dokument <c11/> i størrelser ved afrundingsgulvet (otte værdier ud over seks betydende cifre, op til { "6.8e-5" } relativt; ingen rang eller tærskel flyttede sig). De fastlåste hashes for vagterne for byte-identitet (<c12/>, <c13/>, <c14/>) er rebaseret til en navngiven baseline "{ "0.36" } portable", med værdierne fra { "0.35.0" } bevaret som historisk optegnelse; den frosne forudsigelse for månereferencestationen er urørt, og dens portable genkørsel er gemt ved siden af (<c15/>). <c16/> (den validerede række for lunar fælles OD): fixtures eksporteret igen og numpy-sammenligningen kørt igen med numpy { "2.4.6" }, den registrerede version, med script og tærskel uændrede; alle seks netværk består (<a2><c17/></a2>). Arbejdet i batch 2-3, der blev flettet efter STUDIO-15, er også på portabel matematik ({ "457" } kaldesteder i { "62" } filer); hvad det flyttede, står i <a3><c18/></a3>: { "12" } medfølgende scenarier (største relative ændring { "5.2e-8" }, intet trykt tal flytter sig), { "28" } skyline-vagtrækker genautoriseret, M2M4-digesten for <c19/>, de ældre sandhedshashes for <c20/>, datumsigmaen for det uobserverede beacon ({ "632.3769" } -> { "632.3772" } m) og to registrerede fund (lukninger af CR3BP DRO; CRPA A3, { "194" } af { "456" } links). Greenhalls eksakte edf bevarer sin validerede tærskel med en double-double-logaritme i sin kerne (<a4><c21/></a4>), og gps-sdr-sim-testbænkens uafhængige reference blev kørt igen på de flyttede NMEA-eksporter, og alle tærskler holdt (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: rækken for månesuiten angiver evidensniveauet for hver del (der stod, at alle var MODELLED).

seg-ffb14764a7a9 = <c1/> returnerer <c2/> (række, gridding-log, tidssystem, om det var angivet, posttype) i stedet for en tuple <c3/>. Den falder nu tilbage fra satellitposter (<c4/>) til modtager-/stationsposter (<c5/>) med det ønskede navn.

seg-6777ca96624a = Ingen score ændres, medmindre geometrien er dårlig; etiketten rapporteres altid. Med god eller rimelig geometri (også en åben himmel kun med GPS og { "8" } satellitter) eller ukendt geometri (monitoren kører ikke) er hver score som i { "0.35" }: <c1/> holder begge eksempelsessioners output og <c2/> hvert indsendt NMEA-korpus for fartøjer (også som åben himmel kun med GPS) og scenarierne til besætningstræning til bytes fra { "0.35.0" }, når de tilføjede nøgler er fjernet; i de to træningsscenarier, hvor jamming gør geometrien dårlig, afviger de dårlige epoker alene ved geometrifradraget. En log med dårlig geometri mister op til { "15" } point, som den ikke mistede i { "0.35" }. Ellers er de tilsigtede ændringer alle tilføjelser: nøglerne ovenfor i resultat-JSON og bevispakker (<c3/> er uændret); skemaet for levende JSON-linjer går fra { "1.2" } til { "1.3" } (<c4/> tilføjet, <c5/> i hvert fradrag); uddragets oversigt får <c6/>; telemetri får geometrirækker, felter og etiketten <c7/> kun for inputdata, der bærer dem, så en strøm eller et resultat fra { "0.35" } gengives byte for byte som før. <c8/> er det 17. monitornavn; det står sidst i <c9/>, når det traf en afgørelse (et fartøj, hvis log giver geometrien; en liste fra { "0.35" } beholder sin rækkefølge, og oversigtens antal monitorer stiger med én) og har ingen post i <c10/> (at sætte én afvises: dens fradrag fastsættes i <c11/>).

seg-45b44c851937 = <c1/> kaldte licensen for gnss_lib_py Apache-2.0; udgivelsen { "1.0.4" } er MIT.

seg-a1a670a9c63e = NMEA-læseren læser nu GSA (en kort GSA ignoreres, tælles ikke som sprunget over) og beholder GSV-elevationer og -azimutter, også for satellitter opført uden signal; UBX-læseren beholder elevation og azimut fra NAV-SAT. C/N0 læses nøjagtigt som før.

seg-0bafbea5c75d = <b>Resultatændring: bredbåndede og fejende jammere bruger nu Q = { "2" }.</b> Anti-jam-ligningen bruger lærebogens spread-spectrum-justering Q for disse jammere, hvor den brugte { "1" }. Q = { "2" } er hvid støj over hovedloben med signaleffekten i båndet normaliseret; det er fastlåst i testene til den lukkede form fra <c1/>.

seg-21f31ec302de = <b>Uændret:</b> CW- og smalbåndsjammere (Q = { "1" }), en ikke genkendt jammertype (Q = { "1" }, den mest skadelige værdi) og <c1/>.

seg-f362499d2ed0 = <b>Virkning:</b> hvor en bredbåndet eller fejende jammer virker, stiger effektiv C/N0 med op til { "3.0103" } dB, udledte J/S-tærskler stiger med { "3.0103" } dB, og radierne for afvisning i frit rum skrumper med { "0.7071" }.

seg-088dcd34cc88 = <b>Ændrede medfølgende scenarier:</b> { "12" } af { "144" } ændrer sig, alle som præregistreret (<c1/>, resultater i <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: tabte satellitter { "26" } → { "0" }, median for afstand ved tab af lås { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: afvisningsradius for sløjfedynamik { "75.2" } → { "53.2" } km;

seg-096a24491872 = og de kampagner og krydskontroller af spektrum, der indeholder disse.

seg-ecdf60335064 = <b>Berørte forbrugere:</b> typerne <c1/>, <c2/>, <c3/> og <c4/>, spektrumtypernes <c5/>, IQ-kampagnens MODELLED referencekurve og standard-Q i labfit samt eksport af interop-scener.

seg-89672d99e9e2 = JetBrains-plugin: ingen forældet platforms-API eller API, der er planlagt til fjernelse. De fem valgdialoger bruger en lille <c1/> med en rullemenu i stedet for den forældede <c2/>; filvælgere til én fil bruger konstruktøren <c3/> i stedet for den forældede <c4/>; animationen åbnes med <c5/> i stedet for <c6/>, som platformen { "2026.3" } planlægger at fjerne. Since-build forbliver { "243" }. IntelliJ Plugin Verifier rapporterer Compatible uden brug af noget forældet eller til fjernelse planlagt mod { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) og { "2026.3" } EAP (IU-263.6259.32); <c7/> kontrollerer som standard { "2024.3" } og enhver liste angivet i <c8/>.

seg-58ee61cbd633 = <c1/> og <c2/> returnerer <c3/>: en ugyldig sektion <c4/> er en fejl, når den kaldes direkte, som den allerede var gennem <c5/>, i stedet for en tavs tilbagevenden til den flade maske. <b>Brydende</b> for Rust-kaldere af disse to funktioner.

seg-9b4113258e1e = <b>Kampagnens bedømmelse: en rigtig falsk lås i trackeren blev aldrig talt</b> (<c1/>). Trackerens kontrol af falsk lås flytter en kanal fra LOCKED til LOST, idet den udløses. Bedømmelsen markerede i stedet kanalens næste opdatering, som da var uden lås og derfor aldrig blev talt. En hændelse <c2/> rapporteret fra LOCKED er nu én episode på sit tidspunkt, i kørslen og i hver angiven hændelse, der indeholder den. En, der findes under pull-in, eller gentaget af en kanal, der allerede er LOST, er ikke en ny episode. En ny test driver en rigtig falsk lås: en legitim GPS L1 C/A-bærebølge, der springer 1/(2T), mens den er låst (<c3/>).

seg-ac508954b6a6 = I referencekampagnen i <c1/> ændrer kun PRN { "11" } af ramp/agc-3bit sig (episoder med falsk lås { "0" } → { "1" }, { "426" } og { "437" } pr. låst time).

seg-cfc47d9d9237 = Dens cellers DIGEST'er er fastlåst igen.

seg-fcfa0de18b05 = Den præregistrerede fastlåsning af bedømte resultater forbliver aktiv og gengiver stadig nøjagtigt: i dens hash er kun de seks felter, ændret af denne rettelse efter registreringen, afbildet tilbage til deres værdier før rettelsen. De rettede værdier er fastlåst for sig.

seg-b96d34bb1d36 = Ingen tærskel blev ændret, og ingen VALIDATED række, intet tal i figurer eller på nettet flyttede sig.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: et beacon uden observation rapporteres nu</b> (fundet af MR-05). Rapporten får <c1/> og <c2/> kun, når et beacon ikke har nogen observation, og så kommer de observerede beacons' sigmaer fra deres egen information i stedet for alle at være null. Datum er uændret, og intet standard-, medfølgende eller offentliggjort output flytter sig (<c3/>).

seg-c223c1fc1323 = <b>Lunar hovedakseramme</b> (<c1/>, brugt af <c2/> og LRO-tilpasningen): forskydningen fra DE421 mellem middel-Jord og hovedakse i <c3/> blev anvendt i den forkerte retning og med den forkerte Euler-rækkefølge, så den analytiske PA-ramme lå omkring { "208" }″ fra PA i stedet for på den. Den er nu transskriberet, som SPICE's Frames Required Reading definerer den, og stemmer med SPICE <c4/> til { "2.6e-16" } rad; den analytiske PA-ramme ligger { "6" }″ til { "8" }″ fra DE440 PA (præregistreret e1ead19b, registreret igen be33382e, efter at den første foreslåede ændring missede tærsklen på { "1e-12" }; <c5/>). Offentliggjorte tal, der flytter sig: LRO-tilpasningen (<c6/>) rå overlap { "53.8" } → { "39.9" } m, dynamisk { "12.6" } → { "12.05" } m, reduceret-dynamisk { "6.65" } → { "6.67" } m (tærskler uændrede). Den analytiske stak stemmer nu med ANISE-krydsvalideringen af DE-kvalitet ({ "12.0" } / { "6.67" } m) på begge niveauer; det tidligere gab på det dynamiske niveau var denne fejl.

seg-ef2b49d4ad48 = <b>MCP-serveren afviser <c1/></b> (opfølgning på CAP-06b). Jamming-typens sti til terrænflise står nu i <c2/>. En inline-flade afviser et scenarie, der nævner en, med en besked, der hverken bærer stien eller en fejl fra operativsystemet. Testen af filkildevagten markerer nu også felter, der ender på <c3/>.

seg-ef005d2e3d42 = <c1/> med en brøkdel i dagsdelen tabte brøkdelen i konverteringerne til UTC, TAI, UT1 og Jordens rotation (én times dagsdel drejede Jorden { "15" }° forkert); dagsdelen normaliseres nu til et heltal. Ingen kalder i motoren blev berørt: hver sender et helt døgn, og hvert leveret output er bit-identisk.

seg-144d90307ec6 = Planlagt

seg-7ef4cd25cb87 = Geometrien ud fra en angivet skyline (punkt { "1" } i { "0.36" }, nu i motoren som <c1/>): <c2/> og <c3/> fra skylinen, hvor inputdata giver en (azimutgabet som reserve), en hændelse med naturlig forringelse (fjord eller terminal) i <c4/> og designnotens to maskerede geometrier i rækken sigma_UERE x DOP, præregistreret som et tillæg.

seg-49481d2fdf31 = Geometri for RINEX-logge med navigation (fra motorens egen positionsbestemmelse) og Android-logge (fra rækkerne <c1/>); begge læser i dag <c2/>. Geometri i <c3/> (version { "1" } uændret i { "0.36" }) og integrationerne med Signal K og OpenCPN.

seg-57df1332ff87 = Et eksisterende hul, ikke indført i { "0.36" }: når hver satellits SNR-felt er tomt, udløses intet fradrag for <c1/> eller C/N0; totalt signaltab er kun synligt gennem geometrimonitorens <c2/> (klassificeret <c3/>). Et fradrag for det er planlagt.

seg-a5a7a10ee11c = En strøm i skema { "1.3" } i de eksterne telemetri-referencer (Prometheus' tekstformatparser og OTLP-collectoren), som i dag kun dækker strømme i { "1.2" }.

seg-caa1977b5b5e = En tosidet hindring (en kløft eller en smal fjord) læses som signaltab i stedet for en blokeret himmel, indtil skylinen er integreret.

seg-4bd0f178ca4e = En passage, der nævner AI-klienter fra tredjeparter, er udeladt her; den står i <a1>CHANGELOG.md</a1> på GitHub.

seg-b2689beaba9e = Verifikator for Galileo OSNMA

seg-d16c9b4bf537 = <b>Nyt modul <c1/> og <c2/>: en åben verifikator i ren Rust på modtagersiden for Galileo OSNMA.</b> Den læser I/NAV-sider og rapporterer pr. satellit og epoke, om navigationsdata er autentificeret, med en årsag til hver fejl eller forsinkelse: fortolkning af HKROOT og MACK, genopbygning af DSM-KROOT og DSM-PKR, Merkle-verifikation af den offentlige nøgle, verifikation af TESLA-nøglekæden, verifikation af MACSEQ og tag for ADKD { "0" }, { "4" } og { "12" } inklusive krydsautentifikation og et resultat i form af <c3/> til modtagertillidsmonitoren. Outputtet bærer en vejledende erklæring om, at statussen ikke er en integritetstjeneste for navigation. <c4/> angiver, hvad der verificeres og ikke verificeres, tidskravet, og at Kshana ikke giver nogen rettigheder under EU's IPR'er for OSNMA-ICD'en (brugere støtter sig på ICD'ens Annex E-tilladelse). Implementeret mod SIS ICD Issue { "1.1" } og Receiver Guidelines Issue { "1.3" }. Sider CRC-kontrolleres, og en bytestrøm af u-blox UBX-RXM-SFRBX kan læses direkte (<c5/>). Standardtests bruger syntetiske data og offentliggjorte known-answer-tests for primitiver; en valgfri test læser en lokalt hentet kopi af de officielle vektorer. Efter uafhængig gennemgang tager verifikatoren kun sin tid fra verificerede TESLA-nøgler (en forfalsket subframe langt ude i fremtiden kan ikke længere slette en fejl), lader en autentifikation udløbe og følge den IODnav, der er i brug, respekterer verificerede alarmmeddelelser (hvis Merkle-blad nu indeholder det tilfældige NPK-felt) og NMA-status "don't use", holder dummy-tags ude af satellitstatussen, holder kæder efter CID med tilbagekaldelse og fornyelse, kontrollerer padding-hashen for KROOT og begrænser UBX-rammelængder og TESLA-verifikationsarbejde. En satellit læses kun som autentificeret, så længe de nyeste efemerider og urdata, den sender, bit for bit er de data, der blev autentificeret (ikke blot under samme IODnav), en status eller tilbagekaldelse fra den uautentificerede NMA-header tæller kun, når to satellitter er enige, eller en verificeret KROOT bærer den, en afspillet ældre KROOT kan ikke erstatte en kæde, og en nøglestrøm, der er gået i stå, rapporteres.

seg-3e7df5c888ca = Tilføjet (MCP-serverkanaler)

seg-4e70d8b85211 = <b><c1/>, streambar HTTP, selvhostet.</b> Loopback som standard; en adresse uden loopback kræver <c2/> og et bearer-token i <c3/>; intet værktøj læser eller skriver en sti (IQ-filværktøjerne er slået fra); grænser for størrelse, tid og samtidighed på forespørgsler; ingen CORS-header; kontrol af Host og Origin. Kshana hoster intet endpoint (<c4/>, med skabeloner til Docker, Fly.io og Cloud Run).

seg-c392cde151c9 = Tilføjet (flader)

seg-19ab5c068b6e = <b><c1/> på Python og WebAssembly.</b> Verifikatoren bag <c2/> på bytes i hukommelsen, som returnerer den JSON, <c3/> udskriver (vejledende erklæring i feltet <c4/>; kun autentifikationsstatus, ikke en integritetstjeneste for navigation). De samme afvisninger som på kommandolinjen. Ikke på MCP: inputtet er en lang rå modtagerstrøm, der egner sig bedre til CLI og Python. <c5/> og <c6/> siger det.

seg-6128929994b4 = <b><c1/> på WebAssembly, Python og MCP, med en plugin-kommando og en JetBrains-handling.</b> Gengiver en tillidsstrøm eller et resultat fra <c2/> som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-JSON-nyttelast, med de encodere, <c3/> bruger (<c4/>); ingen socket og intet ur. Plugin: <c5/> og skill'en <c6/>. JetBrains: Render Trust Telemetry. Funktionerne <c7/> og <c8/> og MCP-serveren aktiverer nu også <c9/>, som ikke tilføjer nogen crate.

seg-83d01411c6d4 = <b>Paritetsgennemgang.</b> JetBrains-handlingerne Validate Scenario, List Scenario Kinds og Assess Receiver Stream; <c1/> opregner nu <c2/>, <c3/>, <c4/> og <c5/>; notebooken <c6/> (compliance-kortlægning og testbænk-eksport); og hver tilbageværende JetBrains-celle med "CLI only" i <c7/> er nu en eksplicit N/A med sin årsag.

seg-062ef0cf7ee7 = Tilføjet (bevispakker)

seg-9889575c2df1 = <b><c1/> og <c2/>: signerede, verificerbare bevispakker for en GNSS-tillidshændelse.</b> En pakke samler det rå logudsnit og hele logens SHA-256, konfigurationen med hver tærskel, resultater og årsager pr. epoke, motorens version, en hash-kædet manifest og en selvstændig HTML-oversigt, signeret med Ed25519 (en nøgle fra <c3/> eller din egen fil; nøgler gemmes aldrig i en pakke, og <c4/> er git-ignoreret). <c5/> kontrollerer hver hash, kæden og signaturen og navngiver præcist, hvad der svigter; med <c6/> fastlåser den underskriveren. Et RFC { "3161" }-token kan vedhæftes og læses og bindes til manifestet (autoritetens egen signatur kontrolleres ikke af dette build; <c7/> dækker den). Logudsnittet er vinduets nøjagtige bytes, hvor læseren rapporterer kildespænd (NMEA, UBX, RINEX { "3" }, Android), ellers hele loggen, og manifestet siger hvilket. Oprettelse og verifikation er rene offentlige funktioner (<c8/>), der bygges til <c9/>. Pakkerne angiver, at de er en teknisk optegnelse, ikke en juridisk udtalelse. De nye afhængigheder er træet <c10/> (BSD-3-Clause og Apache-2.0/MIT, minimale funktioner) og en direkte <c11/> (allerede i det træ) til at slette nøglemateriale. Se <c12/>.

seg-280fd37126c1 = Tilføjet (tillidstelemetri)

seg-ebd269c618b0 = <b><c1/>: GNSS-tillid som kilde til sikkerhedstelemetri.</b> Læser tillidsstrømmen pr. epoke (JSON-linjer: score 0-100, bånd, årsager) eller et batchresultat fra <c2/> og fodrer et Prometheus-endpoint <c3/> (localhost som standard), syslog-hændelser i CEF eller LEEF i en RFC { "5424" }-kuvert (UDP eller TCP) og, bag funktionen <c4/>, der som standard er slået fra, eksport af OTLP/HTTP-JSON. Levering kører på arbejdstråde med tidsgrænser for forbindelse og skrivning, begrænset backoff ved genforbindelse og en tæller <c5/>, så en død eller gået i stå collector ikke kan standse den levende vurdering eller fryse <c6/>; årsagsetiketter er begrænset til { "64" } rækker. Ingen nye afhængigheder. Et eksempel på et Grafana-dashboard findes i <c7/>. Metriknavne, etiketter og CEF/LEEF-feltmapningen står i <c8/>. Strømformatet er isoleret i <c9/>.

seg-fa5e803edb44 = Tillid til søfart: en levende tillidsscore fra 0 til 100 for et skibs i bevægelse positionsbestemmelse, ud fra den NMEA { "0183" }, som modtageren allerede udsender, med en valgfri port.

seg-c5b3fcb9bba8 = <c1/> tager en tabel <c2/> (<c3/> eller <c4/>, fartøjets maksimale fart, acceleration og drejningsrate, antennehøjde over vandlinjen og en valgfri kursføler; hver standard dokumenteret med sin årsag). For et fartøj erstattes monitoren for statiske positionsspring, som måler afstand fra kalibreringsmiddelværdien og er forkert på et skib i fart, af kausale monitorer for platforme i bevægelse: kinematisk konsistens af positionen med den rapporterede fart og kurs og med fartøjets grænser, gyrokurs mod kurs over grunden, logfart mod fart over grunden, antennehøjde mod den angivne højde over vandlinjen, C/N0-spredning, der falder sammen og stiger samtidig mod kalibreringens baseline, og tidskonsistens (også mod denne computers ur i live-tilstand). Den læser også en rapporteret autentifikationsstatus, samlet eller pr. satellit (kun en rapporteret status: ingen OSNMA-kryptografi). Hver tærskel angives i en tabel <c5/> før kørslen. Hver epoke får derefter en score fra { "0" } til { "100" } ved en deterministisk, præregistreret afbildning (ingen læring, intet tilpasset til hændelser; vægte, båndkanter og beviset ligger i en tabel <c6/>), afbildet på de eksisterende tillidstilstande, med de monitorer, der trak fra, og deres point. Statiske scenarier er uændrede og hashes som før. <c7/> læser stdin, en fil, der får tilføjet, TCP eller UDP og skriver én JSON-linje pr. epoke og en proprietær sætning <c8/>; med <c9/> sender den strømmen videre uændret, mens positionsbestemmelsen er troværdig, og markerer positionsbestemmelsen som ugyldig (GGA-kvalitet { "0" }, RMC- og GLL-status <c10/>, GNS- og VTG-tilstand <c11/>), mens den ikke er det. Porten er slået fra, medmindre der bedes om den; <c12/> serverer den portstyrede strøm til et vilkårligt antal TCP-klienter (loopback som standard, en langsom klient droppes i stedet for at blokere de andre). Dette er vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }); operatøren er fortsat ansvarlig. <c13/> er en syntetisk log fra Tallinn til Helsinki, skrevet kun som tekst, med et position-drag-off et stykke henne, hvor modtageren bliver ved med at rapportere en gyldig positionsbestemmelse; dens forventede output er fastlåst af en test. Vejledning: <c14/>. Kontrollerne kan ikke se en spoofer, hvis positionsbestemmelse er konsistent med alt på bussen; vejledningen siger det.

seg-80f3f0aae42c = Interferenskort

seg-8539a42718cb = <b><c1/> og <c2/>: et offentligt billede af, hvor fly og skibe rapporterede forringede navigationsdata, og hvor meget af en rute det berører.</b> Inputdata er lokale CSV-filer lavet af ADS-B-data (adsb.lol, ODbL { "1.0" }) og AIS-data (NOAA MarineCadastre, Kystverket under NLOD { "2.0" }) med åben licens; hver outputfil er én kilde og ét UTC-døgn af GeoJSON, der bærer metoden, dens tærskler, datalicensen, kildeangivelsen og kildens dækningsbias. ADS-B-metoden aggregerer NIC og NACp på et fast gitter og kalder en celle forringet ud fra andelen af forskellige fly, med værn for udstyr, der aldrig rapporterer nøjagtighed, lav højde og årsager med stort område. AIS-metoden kører fem detektorer: positioner på land (mod en brugerleveret kystlinje), cirkulære spor, urealistiske spring, urealistiske hastigheder og mange fartøjer på samme position. Tærsklerne er præregistrerede konstanter i en navngiven metodeversion. Kun aggregater: identifikatorer hashes i hukommelsen og skrives aldrig, og celler med færre end { "5" } forskellige fly eller fartøjer offentliggøres ikke. En forringet celle er ikke et fund af interferens. Standardkommandoerne bruger intet netværk; en valgfri hjælper <c3/> henter polygoner for land fra Natural Earth fra en adresse fastlåst til en commit og beholder filen kun, hvis dens SHA-256 passer. ADS-B-inputtet er en CSV eller direkte readsb-historikfilerne fra adsb.lol (ny afhængighed: <c4/> med sin rene Rust-backend, til gzip). Begge metoder er version { "2" }: et kald om forringet eller anomalt kræver mindst { "5" } fly eller fartøjer (offentliggørelsesminimum), hvert antal pr. celle under { "5" } tilbageholdes som <c5/>, og et døgn, hvis baggrund ikke kan estimeres, tilbageholder sine kald. Outputfiler hedder <c6/> og overskrives aldrig; input streames linje for linje; ruteeksponering håndterer antimeridianen. Tests bruger kun syntetiske data. Se <c7/> og licensgennemgangen i <c8/>.

seg-7a54dfab93dc = Tilføjet (træningsstrømme)

seg-0b01d1d871e2 = <b><c1/>: syntetisk NMEA { "0183" } for broen til besætningstræning i at genkende jamming og spoofing af GNSS.</b> Ud fra en scenarie-TOML skriver den en fil eller streamer over TCP eller UDP (unicast eller broadcast; i realtid, accelereret eller så hurtigt som muligt) det fulde bro-sæt GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT og VBW for et fartøjsspor med grænser for drejningsrate, acceleration og strøm, med satellitgeometri fra motorens egne nominelle konstellationer. Scriptede hændelser på en tidslinje: jamming, position drag-off (en gyldig positionsbestemmelse, der vandrer væk), tids-spoofing og en forsinkelse ved afspilning, hver med ramper for indsættelse og genopretning. En instruktørlog (JSON og tekst) registrerer, hvad der blev injiceret hvornår, med det sande spor mod det rapporterede. Et bibliotek i <c2/> (jamming på åbent hav, drag-off ved kysten, tids-spoofing ved indsejling til havn, kombineret) bærer noter til træneren. Outputtet har gyldig kontrolsum og er deterministisk pr. seed; testene fastlåser et gyldent uddrag pr. scenarie og læser hver sætning med NMEA-læseren <c3/>. Kun tekst: intet output af RF, IQ eller bølgeform; strømmene er til træning og test og må aldrig sendes ind i et fartøjs levende navigationssystemer. Se <c4/>.

seg-bb8d508c92fa = Maritime integrationer ({ "0.35.0" }, arbejdsstrøm B)

seg-538cdf145ac1 = <b>Signal K-plugin</b> (<c1/>, ikke udgivet på npm): kører eller forbinder til <c2/> (serverens egen NMEA-input, brugerdefinerede inputargumenter, et JSON-linjer-TCP-feed eller <c3/>-sætningerne i en portstyret strøm), udgiver tillidsscore, bånd, årsager, alarmer og portens tilstand under <c4/> (herunder den position, modtageren selv rapporterer, som kontekst, aldrig <c5/>) og rejser en Signal K-notifikation (<c6/> ved forringet, <c7/> ved utroværdig, med tærskler for hold, ryd og forældelse, alle i konfigurationsskemaet). Ingen npm-afhængigheder. Testet på optaget syntetisk output.

seg-b6eb7110291e = <b>OpenCPN</b>: NMEA i port-tilstand serveres direkte af <c1/> (anbefalet); et afhængighedsfrit TCP-relæ (<c2/>) er det valgfrie alternativ. Under alle omstændigheder ser OpenCPN en ugyldig positionsbestemmelse, når tilliden bryder sammen, og <c3/> i sit NMEA-fejlsøgningsvindue; testene afspiller den syntetiske portstyrede strøm gennem en rigtig TCP-socket og kontrollerer, hvad en forbruger modtager. Et native plugin med scorepanel (<c4/>, plugin-API { "1.18" }, CMake) læser <c5/> fra OpenCPNs egen NMEA-strøm og alarmerer på det utroværdige bånd; det bygger, dets logik er enhedstestet, og det blev kørt inde i OpenCPN { "5.8.4" } under en virtuel skærm (evidens og et script til at gengive det i <c6/>); det er ikke pakket til plugin-manageren.

seg-bb26e8c1aff0 = <b>Referencebuild</b> (<c1/>): generisk styklisteforslag, opsætning af OS, systemd-units til den vejledende monitor og den valgfrie port (kontrolleret med <c2/> af <c3/>), en containermulighed, Signal K-forbindelse.

seg-6695d4c1f13b = Signal K-pluginet accepterer det levende JSON-skema { "1.2" } (en nøgle <c1/>, derefter en nøgle <c2/> tilføjet; ukendte tilføjede nøgler ignoreres), kontrolleret på rigtigt output i { "1.2" } og mod en rigtig signalk-server.

seg-622c2d3dd8fa = Rettelser efter gennemgang: systemd-units genstarter altid og kører i sandbox (ingen shell, intet netværk, hvor der ikke er brug for det), et logrotate-uddrag, <c1/> svigter ved ethvert fund; containeren kører porten ud fra miljøvariabler med en sundhedskontrol og baseimages fastlåst med digest; Signal K-scoremetadata, den forældede notifikation erstattes, når data genoptages, fejl fra børneprocesser beholdes, og kill-signaler eskalerer, usikre <c2/> afvises, og notifikationen ligger ved <c3/>; relæet begrænser en tilbageholdt delvis linje; parserne for <c4/> afviser scorer uden for { "0" } til { "100" }; en kontrol af links i dokumentationen; en CI-workflow (<c5/>), der kører det hele, også den rigtige binær fra ende til anden.

seg-7c615a62ca26 = <c1/>. Vejledende software, ikke typegodkendt udstyr; operatøren forbliver ansvarlig. Kun software: intet sendes, og der hævdes intet tal for detektion eller falsk alarm.

seg-72cb9f45ce99 = Tilføjet: compliance-kortlægning og testbænk-eksport

seg-15aae04a9490 = <b><c1/> og <c2/>.</b> En kortlægning fra Kshanas output til fem rammeværker og standarder for resiliens (US DHS Resilient PNT Conformance Framework v2.0, IMO-vejledning for skibe, EASA-vejledning for luftfart, NIS2 artikel { "21" }, EN { "16803" }, en betalt standard, der er citeret efter del og de få paragrafnumre, der er synlige i katalogteksten), én tabel pr. rammeværk: referencen, hvad den kræver i vores omskrivning, de output, der leverer belæg for den, og hullet. Kildeversioner, URL'er og hvad der blev og ikke blev læst er noteret. <c3/> udfylder kortlægningen ud fra de angivne kørsler og markerer hver række <c4/>, <c5/>, <c6/> eller <c7/>, som Markdown og JSON, med hullet bevaret på hver række. Formuleringen er "leverer belæg for"; intet bliver vurderet eller godkendt. Testene bruger syntetiske kørsler og svigter, når en indsendt tabel afviger fra koden.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Skriver bevægelse og hændelser for køretøjet i et scenarie af typen <c2/>, <c3/> eller <c4/> til en GNSS-simulator i laboratoriet: en CSV med brugerbevægelse med dokumenterede referencesystemer og en metadata-sidecar, NMEA { "0183" } <c5/>/<c6/>, waypoint-tekst og hændelserne som CSV og som <c7/>-blokke <c8/> (<c9/>). Kun bevægelse og hændelser: intet signal skrives. Hver fil læses tilbage i <c10/> og sammenlignes inden for sin angivne tolerance. <a1><c11/></a1> giver metoden til at afspille eksporten gennem en simulator og bedømme modtagerens log med <c12/>.

seg-fc0fe915ed3d = <b>Hvad der tæller som evidens.</b> Et resultat tæller kun for en funktion, når det bærer de felter, dets type skriver; en typeetiket alene tæller ikke. Ukendte typer, et resultat der er uenigt med sit søskendescenarie, ikke-hex-hashes og misdannede antal for modtagertillid opregnes som ikke brugt, med årsagen. Rapporten escaper Markdown-celler og kan ikke gå i panik på en hash med ikke-ASCII. <c1/> og <c2/> tager tekster, ikke stier.

seg-6b46de1164d8 = Testbænk-eksport.

seg-c48a4dd4134b = <c1/> er områdekontrolleret (<c2/>); waypoint-filen kontrollerer hvert interval, og kommandoen siger hvorfor, når et udelades; dokumentationen angiver, at <c3/>-kursen er kroppens yaw og ikke kursen, pladsholderfelterne i <c4/> og scenariets egen højdeændring. <c5/> og <c6/> står i brugsteksten.

seg-eb2e415ec540 = <c1/> eksponerer den sande tilstandshistorik for kørselsprofilen i <c2/> (det samme trin, som typens egen reference bruger), og <c3/> får NMEA-felter for dato og tid.

seg-fbfc1a59e99b = Validering af interferenskortet

seg-a68d88381eea = <b>Interferenskortets afkodningssemantik og geometri er kontrolleret mod uafhængige implementeringer på syntetiske inputdata.</b> Betydningen af NIC- og NACp-koder mod pyModeS' afkodning af syntetiske ADS-B-rammer, AIS' værdier for ikke tilgængelig mod pyais' afkodning af syntetiske AIVDM-sætninger, tildeling af gitterceller mod shapely, rutelængde pr. celletilstand mod shapely og GeographicLib og maskering af indland mod shapely og pyproj, hver til en tolerance fastlagt før den første sammenligning (<c1/>). Det validerer, hvordan koder og feltværdier læses, og geometrien, ikke at en markeret celle er interferens. Læseren af landpolygoner lukker nu en ring, der ikke gentager sit første hjørne, og som den før læste uden sin sidste kant. Dokumentationen angiver tærsklerne for lav nøjagtighed i NACp og NIC som den grænse, hver kode står for (NACp { "6" } er en EPU-grænse på { "556" } m, NIC { "5" } en indeslutningsgrænse på { "1" } NM).

seg-cf4ffdbba1a6 = Tilføjet (validering af telemetriformaterne og bevispakkerne)

seg-ad6730e0e891 = <b>Eksterne kontroller af bevispakkernes kryptografi, pakkeverifikatoren og telemetriens trådformater.</b> Testvektorerne for Ed25519 i RFC { "8032" } afsnit { "7.1" } ({ "1" }, { "2" }, { "3" } og { "1024" }) og eksemplerne for FIPS 180-4 SHA-256 køres gennem pakkens egne funktioner til signering, verifikation og hashing, til nøjagtig lighed. En verifikator skrevet i Python alene ud fra det normative afsnit i <c1/> (hashlib og <c2/>) er enig med Rust-verifikatoren på { "71" } intakte og manipulerede pakker: dom, mængde af fejl, signaturdom og begge kædehoveder. Vores Prometheus-eksponering læses af den officielle Python-klients parser og vores OTLP-JSON af den officielle meddelelse <c3/>, strengt, og begge er enige med den tilstand, de blev lavet ud fra. CEF og LEEF har ingen uafhængig åben validator og forbliver modellerede. <c4/> fik det normative pakkeformat og den verifikationsprocedure, som clean-room-verifikatoren blev skrevet ud fra; <c5/> fik <c6/>. Uafhængige referencer og fixtures: <c7/>, <c8/> med <c9/>, <c10/>; tests <c11/>, <c12/> og <c13/>. CI behøver ikke Python.

seg-20d1b02bfda4 = Tilføjet (validering af CEF-hændelserne)

seg-8c464e43e43d = Telemetriens CEF-hændelser læses tilbage korrekt af to uafhængige open source-parsere.

seg-a6321d13b0ab = <c1/> { "1.11" } og Logstash' CEF-codec (<c2/> { "6.2.7" } i Logstash { "8.15.3" }) fortolker { "157" } CEF-linjer (hvert båndskift og hver epoke i den indsendte telemetristrøm, plus fjendtlig tekst med <c3/>, omvendte skråstreger, pipes, linjeskift, tabulatorer og tekst med flere bytes) og gendanner hvert headerfelt, alvorlighedsgraden, den nøjagtige mængde af extension-nøgler og hver værdi nøjagtigt. Logstash-codec'en læser også fire linjer, hvis headertekst kræver escaping, hvilket <c4/> ikke kan. Tærsklen blev registreret, før nogen af parserne blev kørt (<c5/>); fixtures i <c6/>, scripts til uafhængige referencer <c7/> og <c8/>; CI behøver hverken Python eller Logstash. LEEF har ingen vedligeholdt åben parser og forbliver modelleret. CEF-hændelserne bærer nu tillidsscoren og epokeforskydningen i CEF-ordbogens flydende-komma-brugerfelter (<c9/>, <c10/>) i stedet for heltalsfelterne <c11/> og <c12/>, som passede til ingen af værdierne; CEF er nyt i denne udgivelse, så intet af det, der blev leveret, ændrer sig.

seg-65b362fa8711 = MCP: <c1/> accepterer loggen som <c2/> eller <c3/>; værktøjets input er begrænset til { "4" } MiB.

seg-8999974aa1fa = Jamming-diagrammet henter også sine farver fra paletten.

seg-8c8ff384dbf6 = <c1/> var det ene modul, som revisionen af Observatory-paletten lod blive på sine egne farver, mens arbejdet med jammer-Q landede; dets <c2/> (scenarierne <c3/>, <c4/> og andre af typen <c5/>) læser nu <c6/>, og tilladelseslisten i <c7/> er tom. Kun farver og skrifttype: diagrammerne <c8/> og <c9/> er lig deres tidligere optagne gengivelser, når farve, <c10/> og versionsfoden er normaliseret. Ingen plottet værdi flyttede sig. De optagne Studio-kopier under <c11/> blev optaget igen ved genportingerne af { "0.33.0" } og { "0.34.0" } (kun versionsstempel): de bærer stadig jamming-diagrammets gamle maling og tager palettens maling ved næste genporting.

seg-a059d10c5330 = <b>Urensemblets 3-sigma-grænse dækker nu flicker-gulvet, og filtrets sundhedskontrol ser det.</b> Med et <c1/> bar sandhedsuret flicker-FM, men tilstandsfilteret med to tilstande, der leverer integritetsgrænsen, gjorde det ikke, så det leverede scenarie <c2/> havde 3-sigma-dækning på { "0.41" } (klassisk) og { "0.33" } (kvante), og NIS/NEES-kontrollen, som trak sin egen sandhed fra filtrets model, rapporterede identiske værdier med og uden gulvet. Grænsen er nu variansen for de to tilstande plus den eksakte varians af flicker-fasen akkumuleret siden den seneste synkronisering, beregnet fra den samme bank, som sandhedsuret bruger; NIS/NEES-kontrollen trækker sin sandhed fra den udvidede model med den bank og kører det matchede udvidede filter (og filteret med to tilstande mod flicker-sandhed rapporterer <c3/>). Ændring af output, kun for ure med en <c4/> forskellig fra nul: <c5/> på <c6/> går fra { "0.40866" } / { "0.33026" } til { "0.99970" } / { "1.0" } (klassisk / kvante), og <c7/> NIS/NEES indeholder nu flicker; tidsfejlen, <c8/> og <c9/> er uændrede, og scenarier uden gulv er byte-identiske. <c10/> (orbit-type, seed { "7" }, gulve { "1e-16" } / { "2e-11" }) flytter sig også: <c11/> klassisk { "0.7734" } til { "1.0" } og kvante { "0.9796" } til { "1.0" }, og NIS/NEES i <c12/> og deres bånd ændrer sig. Dens kvante-<c13/> skifter fra <c14/> til <c15/>: en samplinghændelse i ensemblet af flicker med 16 seeds gange 60 trin (NIS { "0.8815" } mod et bånd på [{ "0.9125" }, { "1.0914" }]), ikke en defekt. Båndet er et bånd på { "95" } %, så omkring { "5" } % af seeds markerer et matchet filter per konstruktion ({ "40" } nye seeds af dette scenarie: kvante { "1" } og klassisk { "2" } markeret); ved { "64" } gange { "200" } ligger det samme seed inden for båndet for begge ure (NIS { "0.990" } og { "1.001" }). Kendt opfølgning: fusionstypen har det samme hul (klassisk integritet { "0.80" } med et gulv); hybridtypen forbliver over { "0.99" }.

seg-c7308350b6d4 = <b>Input til MCP-serveren er hærdet.</b> MCP-serverens scenarieværktøjer accepterer nu kun inline-indhold og afviser felter med filkilde; inputstørrelsen er begrænset. Vejledende: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Lab-afspilning: en sporingsmotor, detektionsmonitorer og en kampagnekører til GNSS IQ-optagelser, med de sløjfedesign, C/N0-estimatorer og scorer, der hører til. Evidensklasse: alt nedenfor er <b>MODELLED</b> eller kontrolleret for intern konsistens mod lukkede former og seedet simulering; intet af det tilføjer en VALIDATED række, og verifikationsregistret er uændret ({ "251" } rækker: { "124" } validerede, { "123" } modellerede, { "4" } partner). Det er et softwarelag til analyse: intet her syntetiserer en bølgeform fra en jammer eller spoofer, og intet sendes.

seg-912ecb44cee4 = Lab-afspilning: testbetingelser, kampagnekører og bedømmelse ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> afspiller optagelser × front-end-kæder × sløjfedesign (<c2/>) og bedømmer hver celle mod en testbetingelsesfil pr. optagelse (<c3/>, TOML eller JSON). Den fil angiver, hvad et laboratorium ved om optagelsen: de forventede satellitter og for hver hændelse dens typeetiket, start og slut, berørte satellitter og angivet J/S- eller jammereffektprofil. Det er kun metadata. Scorerne pr. satellit, for hele kørslen og pr. hændelse, er:

seg-180447aaf31e = tilgængelighed, tid til tab af lås og den angivne J/S ved tabet;

seg-1ababddb0d87 = tid til genopnåelse, fra hændelsens slutning og fra tabet;

seg-a6468323c971 = målt forringelse af C/N0 pr. bin for angivet J/S;

seg-4cb6f510e159 = episoder med falsk lås pr. låst time (trackerens flag eller Doppler mod en sandheds-sidecar);

seg-97c6243bac2e = jitter i PLL- og DLL-diskriminatorer.

seg-014b28f61db8 = Ved siden af hver målt forringelseskurve tegnes en analytisk reference for spektral adskillelse (<c1/> med typens <c2/>) og mærkes MODELLED, uanset hvor den optræder.

seg-eb5c38197dab = Celler kører parallelt gennem sporingssessionens tilstandsmaskine for lås, og hver skrives atomisk under en nøgle af indholdshash. Nøglen dækker optagelsens SHA-256, hashes for betingelse, front-end, design, kørsel og bedømmelse, den krævede <c1/> (<c2/> | <c3/>) og motorens version. Med <c4/> sat gemmes hver celles strøm <c5/> og lås-hændelser også, navngivet efter cellenøgle og hashet ind i cellen. <c6/> og <c7/> er offentlige, så en forbruger kan udlede hver nøgle og digesten igen. En ny kørsel springer derfor færdige celler over, og output afhænger aldrig af antallet af arbejdere. Kørslen skriver <c8/>/<c9/>, en selvstændig <c10/> og en <c11/>. Tærskler for bestået/ikke bestået (<c12/>, kan tilsidesættes pr. optagelse) anvendes, når rapporten bygges.

seg-beec1c1264c9 = <c1/> (standard <c2/>, del af bedømmelsens hash) vælger den C/N0, der ligger bag den rapporterede C/N0 og forringelseskurven. Begge estimater bedømmes og rapporteres altid (medianer for hele kørslen og for baseline og pr. J/S-bin), og cellen og scorekortet registrerer estimatoren. NWPR læser omkring { "8" } dB × Bn·T for lavt under sløjfens egen jitter; M2M4 gør ikke.

seg-baf1a2422a66 = Også nyt:

seg-f36e22ff54c3 = <c1/> bygger scorekortene, rapporten og digesten op igen fra cellerne;

seg-aad7fcc28bc8 = <c1/> kontrollerer en testbetingelsesfil mod dens skema;

seg-c3e5e4461aaa = <c1/> importerer en SigMF-optagelses annotationer <c2/> som hændelser;

seg-c1a2ebb844c5 = Python får <c1/>, <c2/> og <c3/>;

seg-cd69258ccc09 = <c1/> får <c2/>, som er inkrementel og kan genoptages under budgettet for sampel pr. kald, med hver fil afgrænset til arbejdsmappen, og <c3/>.

seg-c398b66a7058 = Tests: <c1/> kører en syntetisk kampagne med { "3" } optagelser × { "2" } front-ends × { "2" } design. Dens scener bærer angivne C/N0-profiler, og den dækker:

seg-3f2fbdecb101 = hver metrik kontrolleret mod den injicerede sandhed;

seg-e103a30260db = genoptagelse efter en delvis kørsel med én arbejder med en ødelagt celle, byte-identisk med en uafbrudt kørsel med fire arbejdere;

seg-79164d8b0b22 = epokefiler pr. celle;

seg-9470016f056a = en regressionstest af genopnåelse med tre satellitter på { "20" } s: med <c1/> slået til er hver kanal tilbage inden for { "2" } s efter et hul på { "2" } s; udfaldet med <c2/> slået fra er fastlåst;

seg-1deb4ab83054 = tærskler dømt igen uden at køre igen;

seg-351f9cdcbcd6 = CLI'en;

seg-2c35af369a36 = ignorerede kontroller af gennemløb og hukommelse i release-tilstand, herunder en optagelse på { "4" } GB ({ "5.45" }× realtid, hukommelsestop { "2" } MB over start-RSS; målinger på én maskine, ikke tærskler).

seg-efbaf5a00ea2 = Kun software: intet sendes, og ingen bølgeform for interferens eller spoofing syntetiseres. Design og noter om som bygget: <c1/>.

seg-c9871226c82f = Sporingsmotor til lab-afspilning ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Filer med sløjfedesign</em>: <c1/> TOML (<c2/>; parser <c3/>). Ét eller flere navngivne design fastsætter hvert sløjfefelt:

seg-0437148324ca = bærebølgetype (PLL, FLL eller FLL-assisteret PLL), ordener og båndbredder;

seg-4e722960f8c6 = diskriminatorer for PLL/FLL/DLL og støtte til bærebølgen;

seg-44976e3ad4e7 = afstand og integration;

seg-5c06173036d6 = tærskler for lås og C/N0-vinduer samt bitsynkronisering;

seg-405e693dd757 = tilstandsmaskinen for lås;

seg-e6908584e2f4 = overdragelsen til opnåelse (<c1/> eller eksplicit).

seg-8844cc963705 = Design kan <c1/> hinanden. Ukendte nøgler afvises. Hvert opløst design har en SHA-256-hash over en kanonisk JSON-form (nøgler sorteret på hvert niveau, fast talformatering), så hashen ikke afhænger af feltrækkefølgen; hvert output registrerer den. Flader:

seg-5c32182634f7 = <c1/>, hvor eksplicitte flag tilsidesætter designet og registreres;

seg-9356751a6b98 = <c1/>, som kører hvert design i filen;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, track-epoke-kolonnen <c2/> efter <c3/>; Python-epokeordbøger). Estimatet af andet og fjerde moment over de samme vinduer som NWPR, kun ud fra prompt-effekt: NWPR læser lavt under sløjfens egen bærebølgejitter (omkring { "8" } dB × Bn_PLL·T), og M2M4 gør ikke. På GPS L2C CM ({ "20" } ms, nominelt { "40" } dB-Hz, PLL { "1" } til { "10" } Hz) læser den { "39.93" } dB-Hz ved hver båndbredde, mens NWPR falder fra { "39.55" } til { "38.22" }; på L1 C/A ved { "45" } dB-Hz læser den { "45.34" }. NWPR og hvert andet output er uændret (en bit-for-bit-fastlåsning). Den binære post forbliver { "184" } bytes (værdien tager den reserverede float og flagbit { "6" }).

seg-c02d07475717 = Ekstra korrelatortaps (multikorrelator / SQM).

seg-70fcdc903413 = <c1/> (forskydninger i chips fra prompt, positiv tidlig; højst { "16" }, hver inden for ±{ "2" }) korrelerer ekstra replikaer ved siden af E/P/L og returnerer dem som <c2/> (<c3/> i designets rækkefølge). Sløjferne bruger dem aldrig. Nøglen udelades af den kanoniske JSON, når den er tom, så standarddesignets hash og hvert output uden taps er uændret (<c4/> bliver; CSV/JSONL/binær uden taps er bit-identiske). Med taps: kolonner i CSV/JSONL og en binær post på <c5/> bytes, hvis header bærer <c6/>, så en gammel læser afviser filen i stedet for at fortolke den forkert. <c7/> (CLI), <c8/> (Python) og <c9/> (MCP <c10/>). Designene i én kørsel skal være enige om taps.

seg-66d494267598 = <em>Parallelle kanaler</em> (<c1/> / <c2/>; Rust <c3/>). Hver bid af kanaler kører på op til N tråde (<c4/>; <c5/> forbliver seriel). En kanals korrelation og tilstandsmaskine for lås berører kun den kanal; dens epoker og hændelser bufres og skrives til sinks i kanalrækkefølge, så outputtet (CSV, JSONL, binær, hændelser, oversigt) er byte-identisk med den serielle kørsel for ethvert N. Standarden forbliver { "1" } tråd. Målt på en optagelse med 12 kanaler, { "4" } s, { "4.092" } MHz på { "4" } kerner: { "19.5" } s seriel, { "11.5" } s ved { "2" } tråde, { "6.3" } s ved { "4" } ({ "3.1" }×; den indledende opnåelse er seriel).

seg-cf59911d458f = <em>Eksport af opnåelsesoverflade</em> (<c1/>; <c2/>, <c3/>). <c4/> (én PRN; CSV, JSON eller binær), Python <c5/> og MCP <c6/> <c7/> skriver hele overfladen af korrelationseffekt over Doppler × kodefase, som søgningen beregner (dens celler er <c8/>'s, bit for bit) med toppen og to finere Doppler-forfininger: et parabolsk estimat og en fin søgning med 1/16 bin (≈{ "5" } Hz ved { "4" } ms kohærent, mod bins på { "167" } Hz). <c9/> selv og hver standard er uændret.

seg-a01bf371cc4f = <em>Streamet epokeoutput</em> (<c1/>; <c2/>). Hver sløjfeopdatering bærer:

seg-ff549f07ce78 = korrelatorerne early/prompt/late;

seg-00457c1bb059 = alle tre diskriminatoroutput;

seg-b17d335f6cac = NCO-tilstandene for PLL/FLL/DLL og bærebølgefasen;

seg-a3bf3f1034cd = PLI og låsflagene;

seg-7912a72da79b = begge C/N0-estimater og bittene;

seg-8d105d656041 = låstilstanden.

seg-6af6331255fb = Det skrives, mens det sker, som CSV, JSON Lines eller en versioneret binær form med læsere i Rust (<c1/>) og Python (<c2/>).

seg-aa081bfd9878 = <c1/> får <c2/>, <c3/> og <c4/> (<c5/>), og <c6/> får <c7/> og <c8/>. MCP <c9/> får <c10/>/<c11/> og bygger sit svar ud fra oversigten med afgrænset hukommelse.

seg-8cb2f8b27bad = En kørsels heap vokser ikke længere med optagelsens længde: <c1/> måler det med en tællende allokator ({ "6" }× længden, samme top inden for { "64" } KiB), med en kontrol, der viser, at stien i hukommelsen vokser.

seg-e3eff59db445 = Streamet output er bit-identisk med genafspilningen i hukommelsen.

seg-c602902313f8 = <em>Låsetilstandsmaskine</em> (<c1/>, <c2/>): pull-in → låst → tabt → genindfangning → pull-in, eller taget ud af drift, når et tab varer længere end <c3/> (standard { "30" } s). Mislykkede søgninger gentages hver <c4/> ({ "0.1" } s), jævnt fordelt, så planen for genforsøg højst lægger { "0.1" } s til en målt genindfangningstid. En valgfri back-off (<c5/> over <c6/>) er som standard slået fra, og <c7/> er en valgfri grænse ({ "0" }, ingen, som standard). Et udfald på { "2" } s på tre PRN'er ved { "4.092" } MS/s ender nu med, at hver kanal er genindfanget og låst. Med et budget på 3 forsøg blev hver kanal taget ud af drift inden for { "0.2" } s efter tabet.

seg-56bc109dbef9 = Tærskler (<c1/>, <c2/>, Doppler-vinduet for genindfangning) kommer fra udformningen. Hver overgang er en hændelse med sin årsag.

seg-b1c551e48389 = Falsklås-kontrollen søger den sporede Doppler mod dens ±1/(2T) FLL/PLL-alias. Den fanger den falske lås, som PR #38 målte (−{ "2400" } Hz sporet, { "500" } Hz fra den rigtige). Med genindfangning slået til ender kanalen låst på den indsatte Doppler.

seg-39409dd0b4bc = Et signalhul på { "0.8" } s erklæres som tab og genindfanges inden for { "0.3" } s efter signalets tilbagekomst.

seg-ce3162720ce5 = <c1/> (og tabellens kolonne) er tilstanden efter den sidste overgang, så en kanal, der er taget ud af drift efter sin sidste sløjfeopdatering, viser <c2/>.

seg-520ab6d84a6c = <b>FLL-hjælp kun under pull-in</b> (<c1/>, standarden; <c2/> bevarer den tidligere adfærd bit for bit). FLL'en overdrager til PLL'en, når den udglattede PLI har ligget på eller over <c3/> ({ "0.8" }) i <c4/> ({ "0.1" } s), og vender tilbage under <c5/> ({ "0.6" }). Når den var slået til, brød FLL-stien på { "10" } Hz faselåsen under ca. { "38" } dB-Hz på rene signaler: ved { "35" } dB-Hz var faselåsandelen { "10" }–{ "16" } %, med en sand fasefejl på { "38" }–{ "41" }°. Med gating holder standarden { "100" } % ved { "35" } dB-Hz med { "4.5" }°, det samme som en PLL alene. Pull-in fra en overdragelsesfejl på { "100" } Hz er uændret. Evidens med tærskler fastsat på forhånd: <c6/>. <b>Standardsløjferne er derfor ikke bit for bit identiske med tidligere kørsler af standardudformningen.</b> Brug <c7/> for at gengive dem. Kendt grænse: ved { "35" } dB-Hz kommer overdragelsen { "1.9" }–{ "2.6" } s inde i sporingen, og ved { "33" } dB-Hz holder FLL'en på { "10" } Hz PLI under overdragelsestærsklen, så pull-in aldrig gennemføres.

seg-1a911b958f8e = Nye nøgler til sløjfeudformningen og nye API'er, opført:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, hvor <c5/> er ændret fra en standard på { "3" } til en valgfri grænse (standard { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = Udformningens hash er over en kanonisk JSON-form, og den indbyggede standards hash er <c1/> (fastlåst af en test).

seg-2405be1bc0c6 = Noter om kompatibilitet for output:

seg-77670b7dd608 = tabellen for <c1/> har en afsluttende kolonne <c2/>;

seg-a52d9bbdd1a4 = CSV-filen for <c1/> har en afsluttende kolonne <c2/>, og dens JSON har <c3/> og <c4/>;

seg-3fa0f9243806 = sweepets <c1/> er nu middelværdien over hver opdatering, der har et NWPR-estimat (resumé med afgrænset hukommelse), ikke længere over anden halvdel af kørslen.

seg-d542c1616f35 = Genindfangning er <b>slået fra i den indbyggede standard</b>, hvor tilstandsmaskinen kun observerer, og sløjferne kører bit for bit, som de gør uden den. (Selve standardsløjferne er dog ændret: se FLL-hjælp ovenfor.) Slå den til pr. udformning (<c1/>), med <c2/> eller med <c3/>.

seg-61d6b3122888 = En <b>advarsel for <c1/></b>: når fs ligger inden for { "1e-6" } af et multiplum af halvdelen af chiprate (<c2/>), advarer <c3/>/<c4/> (output, <c5/>, sweep-JSON), MCP-svaret fra <c6/> og Python-resultatet fra <c7/> om, at jitter og bias i kodesløjfen ikke er repræsentative. Grundårsagen er dokumenteret med tærskler fastsat på forhånd i <c8/>. Ved præcis { "2" } samples pr. chip med 0.5-chip afstand er DLL's S-kurve ét enkelt trin, og sløjfen dithrer: ≈ { "0.09" } chip RMS-kodefejl (≈ { "26" } m) ved { "45" } dB-Hz, mod ≈ { "0.004" } chip ved en ikke-kommensurabel rate. Den lave NWPR C/N0 på ~{ "2" } dB ved den rate har samme årsag. Ved præcis { "0" } Hz kode-Doppler og { "4" } samples pr. chip krydser koden aldrig dødzonen på ±0.21 chip, så en kodefase-bias på op til ca. { "0.2" } chip kan bestå uden at vise sig i jitteren (målt: 0.5-chip afstand giver { "2.0" }× kodefejlen i kontrolkørslen med et gennemsnit på +{ "0.011" } chip; 0.25-chip afstand giver +{ "0.125" } chip); advarslen dækker raten.

seg-8fbfb3f0bee2 = <b>Kendt grænse: standardudformningen overdrager ikke FLL→PLL under ca. { "35" } dB-Hz</b> (et pull-in-gulv på ~{ "35" } dB-Hz; se FLL-hjælp ovenfor og <c1/>).

seg-43f02bc861be = En falsklås- eller genindfangningssøgning, der ikke kan køre (en rate uden et helt antal samples pr. kodeperiode), stopper ikke længere sporingen.

seg-14f4e9edc443 = Tests: <c1/>, <c2/>, <c3/>, <c4/> og MCP IQ-rundturen.

seg-60141bb08f64 = C/N0-profiler i syntetiske scener ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> planlægger tidsvarierende C/N0 pr. satellit i Kshanas egne scener som dB-forskydninger i forhold til scenens C/N0. Former: trin, rampe, stykvis lineær og seedede scintillationslignende Rice-fading med en angivet S4 og dekorrelationstid. De anvendes gennem den eksisterende kanalkrog i scenen (<c2/>, sammensat med effekterne fra ionosfære, troposfære, scintillation og flervejs), uden ændring af scenens kerne. Reference-sidecarens <c3/> følger profilen.

seg-548eeca516ff = Flader: <c1/> og <c2/>.

seg-a242e4d9f071 = Hvad den er til: sløjfer, monitorer og kampagnescoring kan stresstestes mod en kendt reference. Den ændrer kun styrken af de legitime signaler.

seg-ff4df7c343dc = Kontroller (<c1/>). Tærskler: middelintensiteten af fadingen inden for { "5" } % af { "1" }, S4 inden for { "8" } % af målet (ved S4 = { "0.3" }, { "0.7" } og { "1" }), intensitetskorrelation over { "0.9" } ved { "0.05" } τ og under { "0.05" } ved { "5" } τ; reference nøjagtigt den angivne C/N0 plus profilen; et sporet fald i NWPR C/N0 inden for { "0.7" } dB af et trin på { "6" } dB. Målt: S4 inden for { "1.3" } % af målet og et sporet fald på { "6.26" } dB.

seg-e214458cd1b6 = <b>Detektionsmonitorer på IQ-stien ({ "0.34.0" } "Lab replay").</b> Nyt modul <c1/>, ny kommando <c2/> og ny binding <c3/>. De observerer en optagelse og rapporterer tidsserier samt markerede hændelser (start-, alarm- og sluttidspunkter, spids, tærskel). De detekterer og måler kun; intet her genererer et signal.

seg-5b05b2a54fab = <b>Totaleffekt / AGC</b>: blokeffekt og den forstærkning, en ideel AGC ville anvende; markerer stigninger og fald.

seg-2a84a640d7f1 = <b>Spektrum før korrelation</b>: Welch-PSD pr. blok mod en indlært baseline. Overskudstærsklen kommer fra et mål for falsk alarm. Desuden kompleks kurtosis og en pulsdetektor. Pulsdetektoren tæller samples over en tærskel i hver blok og udløser en hændelse, når den nøjagtige binomiale øvre hale for det antal er under <c1/> (standard { "1e-4" } pr. blok), ikke når en z-score passerer en grænse: ved de små forventede antal i korte blokke er en enkelt sample allerede flere sigma.

seg-7704ac807c38 = <b>C/N0 pr. kanal</b>: to ensidede CUSUM-ændringsdetektorer (fald og stigning), fodret med uafhængige estimater (skridtet er sat ud fra sløjfens C/N0-vindue).

seg-f965a68d388b = <b>SQM fra korrelatorerne</b>: delta <c1/> og forhold <c2/>, plus asymmetritests fra ekstra korrelatorer, når en kanal leverer dem.

seg-a4006c2e8692 = <b>Serier for låseindikatorer</b>: PLI og en frekvenslåsindikator fra successive prompts, som rå signaler. Beslutninger om lås og tab af lås forbliver hos sporingsmotorens låsetilstandsmaskine.

seg-da72318f44cc = Ét streamet gennemløb (<c1/>) kører det hele med en TOML/JSON-indstillingsfil (<c2/>); kampagnekøreren bruger samme indgang. Alt er MODELLED. Hver statistik kontrolleres mod sin lukkede form ved seedet simulering (<c3/>):

seg-0ff96e4c5a20 = overskridelser af blokeffekt mod Gamma-halen;

seg-97b559ea0897 = kurtosis-middelværdi { "2" } og spredning <c1/>;

seg-2b941c702b7f = pulsandel <c1/>;

seg-e8f068c41f0c = CUSUM-løbelængder mod Siegmunds approksimation (målt { "330" } og { "8.46" } samples mod { "338" } og { "8.34" });

seg-e2cd6a55e49b = faselåsindikatoren mod middelværdien for Rician-fase;

seg-06291b1c6274 = på et sporet C/A-signal afviger spredningen af SQM-delta og -forhold med omkring { "6" } % fra de førsteordens lukkede former (målt { "5.97" } %; testtærskel { "12" } %).

seg-12deb36a2e3a = Formlen for falsk alarm ved spektralt overskud er en approksimation; den målte rate var { "1.3" }× formlen. Fra ende til anden markerer monitorerne:

seg-b002c66c7881 = et trin på { "6" } dB i C/N0 (ændringstidspunktet inden for ét estimat);

seg-2e828d106393 = en reflekteret sti, der dukker op midt i optagelsen (forholdstest);

seg-68063f036e2c = et signaludfald (PLI falder fra { "0.999" } til −{ "0.3" } og FLI fra { "0.93" } til { "0.03" } under det);

seg-0cd95f0197ec = en smalbåndstone og spredte samples med høj amplitude (spektral-, puls- og kurtosistest). Det er generiske DSP-testinput, ikke interferensmodeller.

seg-7128b9000cc2 = <c1/>/<c2/> streamer gennem den nye session (se Tilføjet).

seg-98891d33e48c = <c1/> beholder sine kolonner fra { "0.32" }, men streames nu, så rækker fra flere kanaler flettes i tidsorden i stedet for at være grupperet efter kanal. <c2/> beholder sin form fra { "0.32" } og holder stadig hver epoke i hukommelsen: brug <c3/> til lange optagelser.

seg-2ef2d5771ade = <c1/> måler jitter over opdateringerne i anden halvdel af kørslens varighed (tidligere anden halvdel af antallet af opdateringer), og dens CSV/JSON får en kolonne <c2/>.

seg-f23b6db96748 = Sporingstabellen får en kolonne <c1/>.

seg-a5769fbc201e = Brugsteksten påstår ikke længere, at <c1/> tager front-end-flagene; kun <c2/> anvender dem.

seg-cf28fa21786a = I Python har <c1/> nu som standard <c4/> for <c2/> og <c3/> (udformningens værdier, { "1" } og { "5000" } Hz i den indbyggede udformning). Dens epoker får early/late-korrelatorerne, <c5/>, <c6/>, <c7/> og <c8/>, og resultatet får <c9/> og <c10/>.

seg-666b9e3faa5d = <b>Standardskridtet for indfangning overdrager ikke længere et residual til Galileo E1-sporing, som FLL'en ikke kan trække ind.</b> Skridtet <c1/> efterlader op til <c2/> Doppler-fejl ved overdragelsen, men den standardmæssige tokvadrant-FLL trækker kun <c3/> ind. For hver kode på { "4" } ms eller længere (<c4/>), herunder Galileo E1-B og E1-C, lå residualet ({ "83.3" } Hz ved { "4" } ms) uden for pull-in på { "62.5" } Hz, og sporingen falsklåste ved +{ "125" } Hz med en faselåsindikator på { "0.97" }, der skjulte det. Standardskridtet er nu desuden begrænset til <c5/> (<c6/>), { "0.8" } af pull-in, så overdragelsen forbliver inden for den, selv når nabobinnen vinder. ({ "0.4" } blev prøvet først: den falsklåste { "1" } kørsel ud af { "42" } på E1-B, og en kohærent GPS L1 C/A-søgning på { "1" } ms valgte en bin { "350" } Hz fra og låste ved +{ "500" } Hz; { "0.25" } og { "0.2" } havde ingen i de samme kørsler.) Pris: Galileo E1-B/E1-C går fra bins på { "166.7" } Hz til { "50" } Hz, { "201" } bins over ±{ "5" } kHz i stedet for { "61" }; koderne på { "1" } ms ({ "166.7" } Hz, <c7/>) er uændrede. <c8/> i en sløjfeudformning betyder dette; et eksplicit <c9/> eller <c10/> bruges, som det står, og <c11/> (ingen sporingsoverdragelse) beholder lærebogsskridtet. Epokehovedet og <c12/> registrerer nu det opløste skridt og sløjfebåndbredderne for hver kanal (<c13/>). Standardudformningens hash er uændret. Ændring i output: detektioner på koder på { "4" } ms og længere kan lande i andre Doppler-bins.

seg-9150dc89e186 = <b>GPS L2C CM ({ "20" } ms sløjfeopdatering) holder lås med standardudformningen.</b> Standard-PLL'en på { "15" } Hz og FLL'en på { "10" } Hz har <c1/> på { "0.3" } og { "0.2" } ved T = { "20" } ms, og sløjfen mistede låsen selv fra en perfekt start (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Ny udformningsnøgle <c2/> (standard { "0.1" }) begrænser PLL- og FLL-støjbåndbredderne til <c3/>, når sløjfeopdateringstiden er længere end { "4" } ms (<c4/>): { "5" } Hz og { "5" } Hz ved { "20" } ms, { "10" } Hz og { "10" } Hz ved { "10" } ms for BeiDou B1C; koderne på { "1" } ms og { "4" } ms beholder { "15" } og { "10" } Hz. Den gælder også for eksplicitte båndbredder; <c5/> slår den fra. Nøglen udelades fra den kanoniske form ved sin standard, så standardhashen er uændret; en udformning, der sætter en anden værdi, har en anden hash. Ved { "45" } dB-Hz giver L2C CM nu PLI { "0.996" }, Doppler-fejl { "0.00" } Hz og M2M4 { "42.71" } dB-Hz. Kendt åbent punkt: NWPR C/N0 aflæses her { "1.76" } dB for lavt (og { "2.45" } dB for lavt på B1C ved { "10" } ms), så rækken T5 i matricen for L2C forbliver et ignoreret fund.

seg-74517bee3f6f = <b><c1/> regenereret: den committede figur var forældet i forhold til sit eget scenarie (en dataændring, ikke en gentegning).</b> Diagrammet blev tegnet 2026-06-02 ud fra <c2/>; to dage senere satte 67fed19e flicker-FM-gulvene i det scenarie (kvante <c3/>, CSAC <c4/>), og figuren blev aldrig tegnet om. Den viste kørslen før gulvene: y-akse { "0" } til { "47" } ns, CSAC-udfald p95 pr. kørsel på { "10.5" } til { "47.6" } ns (middel { "25.2" } ns), klassisk holdover { "4050" } s i middel. Scenariet, som det leveres (og som tutorialen og CLI-oversigten allerede angiver), giver y-akse { "0" } til { "407" } ns, CSAC p95 pr. kørsel { "40.8" } til { "374.0" } ns (middel { "167.0" } ns), klassisk holdover { "844" } s [{ "220" } til { "2130" } s]; specifikationslinjen på { "20" } ns ligger på de samme { "20" } ns på en akse, der er omtrent ni gange højere. Motoren er uændret: dagens motor på junifilen for scenariet gengiver den gamle figurs akse nøjagtigt. Figuren refereres ikke fra README eller dokumentationen.

seg-75636f9419b2 = Kendte begrænsninger

seg-2c607b56048e = <b>NWPR C/N0 aflæses for lavt ved høj C/N0·T pr. prompt, og BOC({ "1,1" }) ved { "5" } MS/s mister omkring { "1" } dB.</b> NWPR er uden bias på ideelle prompts, men sløjfens egen PLL-jitter koster omkring en tilpasset { "8" } dB × Bn·T (én scene, fire punkter: −0.24/−0.44/−0.77/−{ "1.58" } dB ved 1/2.5/5/10 Hz og { "20" } ms; omkring −{ "1" } dB ved standarden <c1/>); M2M4 er ufølsom. BeiDou B1C-data ved { "5" } MS/s mister også omkring { "1" } dB promptseffekt til båndbegrænsning (brug { "10" } MS/s eller mere). Ingen af delene er en estimatorfejl; rækkerne T5 i signalmatricen for GPS L2C og BeiDou B1C forbliver ignorerede fund med disse årsager.

seg-ff195e575023 = <b>Diagramtekst og Studios overtagelse af diagrammer er hærdet.</b> Tekst, som et scenarie fører ind i et genereret diagram, escapes nu ensartet af én fælles rutine, og Studio overtager kun tegnemarkup fra et diagram. Studios adresseparametre, opslag efter nøgle og type samt hentning af scenarier er begrænset til kendte værdier. Medfølgende diagrammer, registrerede resultater og offentliggjorte tal er uændrede. Opgradering anbefales til alle, der åbner scenariefiler fra ikke-betroede kilder i Studio eller indlejrer genererede diagrammer på websider. Sikkerhedsbulletin: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>Interferens- og spoofing-omfanget af IQ-laget, angivet nøjagtigt.</b> Posterne for { "0.31.0" } og { "0.32.0" } nedenfor siger, at IQ-laget tilføjer "ingen syntese af interferens- eller spoofing-bølgeformer". Det er rigtigt for selve IQ-laget (<c1/> genererer kun legitime GNSS-signaler), men det blev læst som en udtalelse om hele motoren, og det er det ikke: siden { "0.29.0" } skriver sektionen <c3/> i scenarietypen <c2/> et SigMF-snapshot af sin analytiske model med de konfigurerede jammere i (støjlignende jammere bin for bin, toner og chirps som bølgeformer), og <c4/> summerer et autentisk signal og et spoofer-replikasignal i hukommelsen for at teste sløjfens opfangning (kompositten skrives aldrig ud). Motoren har desuden båret en software-GNSS-modtager siden { "0.20.0" } (<c5/>: indfangning og sporing; siden { "0.31.0" } også <c6/> og <c7/>). Intet i Kshana sender eller styrer radiohardware. Statuslinjen i README, <c8/>, <c9/> og IQ-designnoterne siger det nu; de udgivne poster er bevaret, som de blev offentliggjort. Ingen adfærd ændres.

seg-61befd8b474d = <b>Kendt begrænsning: kommensurabel sampling.</b> Ved en samplerate, der er et heltals- eller halvtalsmultiplum af chiprate, ligger samplene på de samme chipfaser i hver chip, og kodediskriminatoren bliver en trappefunktion. På et syntetisk GPS L1 C/A-signal ved { "45" } dB-Hz med 0.5-chip afstand giver { "2.046" } MHz ({ "2" } samples/chip) ≈ { "0.09" } chip (≈ { "26" } m) RMS-kodefejl og en bias på −{ "0.09" } chip, mod ≈ { "0.003" } chip ved en ikke-kommensurabel rate. NWPR C/N0 aflæses ≈ { "2.4" } dB for lavt dér. Ved { "4.092" } MHz afhænger det af afstanden og kode-Doppler. Ved { "0.5" } chip er det harmløst ved { "1500" } Hz Doppler, men { "2" }× med en bias på { "0.011" } chip ved { "0" } Hz, og ved { "0.25" } eller { "0.1" } chip er det { "8" }–{ "10" }× kodefejlen. Bæresporing er upåvirket. <c1/> har målingerne.

seg-3a30bd47380a = GNSS IQ-lag på MCP-serveren (fase B.1).

seg-ef81eca03bca = <c1/> får seks værktøjer, der driver laget <c2/> fra en agent: <c3/> (de accepterede signalnavne og IQ-opsætningen), <c4/> (beskriv en optagelse), <c5/> (generer en scene med angivet profil eller broadcast-efemeride, med den valgfri kanal på signalniveau), <c6/> (FFT-indfangning, eventuelt bag front-end-trin), <c7/> (indfang, derefter DLL/PLL/FLL-banken) og <c8/> (båndpas, notch, blanking, excision, AGC, kvantiserer). IQ-samples krydser aldrig protokollen: hvert værktøj tager filstier inde i én arbejdsmappe sat af <c9/> (usat slår IQ-filværktøjerne fra og lader alle andre værktøjer upåvirkede), afviser stier, der opløses uden for den, og output, der allerede findes, medmindre <c10/> er sat, håndhæver et sample-budget pr. kald (<c11/>, standard { "50 000 000" }) før noget arbejde, afviser ukendte argumenter og svarer med et kompakt JSON-resumé (detektioner, C/N0, låsetilstand og hver skrevet fil med sit antal bytes). Output pr. epoke går kun til filer, som kalderen navngiver. Værktøjerne kører samme kodesti som CLI'en gennem en ny offentlig grænseflade, <c12/>, som returnerer CLI'ens meddelelse i stedet for at udskrive den (stdout er MCP's JSON-RPC-kanal); <c13/> og <c14/> er nu også offentlige. Kun software og additivt: IQ-laget tilføjer ingen syntese af interferens eller spoofer, intet sendes nogensinde, og der er ingen nye afhængigheder. <c15/> erklærer de to miljøvariabler. Round-trip-tests i <c16/> genererer en kort scene med to satellitter og kontrollerer indfangning mod scenens egen reference-sidecar, sporingslås og C/N0, front-end, SigMF-output, budgettet, stiafgrænsning og den deaktiverede tilstand.

seg-6963f3fa1db7 = <b>GNSS IQ-laget i valideringsregisteret.</b> En krydskontrol fastsat på forhånd mod gps-sdr-sim (en uafhængig GPS L1 C/A-basisbåndsgenerator, MIT, commit 28ca29a6) er nu en del af den altid aktive testsuite (<c1/>). Dens committede referenceoutput (<c2/>: { "20" } ms af gps-sdr-sims eget 8-bit I/Q, dens kanalliste og kanaltilstanden bag den fra en harness linket mod samme build) regenereres af <c3/>. Intet ved testtid behøver netværk eller det eksterne værktøj. To registerrækker tilføjes ({ "251" } rækker: { "124" } valideret, { "123" } modelleret, { "4" } partner):

seg-21d005e2ef0e = <em>GNSS IQ-scenens signalgeometri mod en uafhængig basisbåndsgenerator</em>: <b>Valideret</b>. Scenens reference (synligt sæt, pseudorange, kodefase, Doppler, sigtevinkler) for en scene med broadcast-efemeride stemmer med gps-sdr-sims kanaltilstand på alle { "11" } kanaler: værst { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } grad, mod tærskler på { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz og { "1e-4" } grad fastsat før kørslen.

seg-5c8858182d41 = <em>GNSS IQ-indfangning på uafhængigt genererede I/Q-samples</em>: <b>Modelleret, med et fund</b>. <c1/> finder hver simuleret satellit i gps-sdr-sims samples inden for de registrerede tærskler (kodefase inden for { "0.195" } chip, Doppler inden for { "72" } Hz). Den registrerede tærskel "ingen anden PRN detekteret" fejler dog: på gps-sdr-sims støjfrie output overskrides tærsklen for gaussisk støj af de andre satellitters krydskorrelation for alle { "21" } fraværende PRN'er. Den strenge test beholdes, ignoreret med fundet, og en fastlåst test registrerer det. Ingen motorkode eller offentlig API ændres. Sample-I/Q sammenlignes ikke sample for sample: gps-sdr-sims heltals-sinustabel, forstærkninger, nul begyndelsesbærebølgefase og trunkerede LNAV-felter er ikke størrelser, en modtager behøver at være enig om. Sammenligningen foretages på de observabler, en modtager måler.

seg-a2be63287ce4 = <b><c1/> overdrager som standard fra en indfangning på ≈{ "4" } ms (adfærdsændring).</b> Indfangningen, der initialiserer hver sporingskanal, integrerer nu <c2/> kodeperioder kohærent i stedet for én, hvor <c3/> er kodens fulde periode (primær gange sekundær længde for en lagdelt kode, den enhed indfangningen integrerer over). De ulagdelte koder på { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) søger nu { "4" } perioder ({ "4" } ms), så standard-Doppler-skridtet <c4/> er ~{ "167" } Hz i stedet for ~{ "667" } Hz. Hver kode, hvis fulde periode allerede er { "4" } ms eller længere, beholder { "1" } periode: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) og de lagdelte GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q og E1-C ({ "10" } til { "100" } ms med deres overlay-koder) samt GPS L2C. Hvert signal integrerer derfor mindst ~{ "4" } ms. En søgning på én periode kunne overdrage en kanal op til ~{ "333" } Hz ved siden af, uden for FLL'ens pull-in, og den sporede så en falsk lås ~{ "500" } Hz væk, mens den rapporterede en ren sporing. På et seedet sweep af { "180" } GPS L1 C/A-kanaler (Doppler på tværs af ±{ "5" } kHz, { "38" } til { "47" } dB-Hz, halvdelen med navigationsdata; <c5/>, kan genkøres) falder falske låse fra { "27" } af { "180" } til { "1" } af { "180" }, og oversete indfangninger fra { "102" } til { "11" }, for ~{ "40" } ms mere søgning pr. PRN på GPS L1 ({ "11" } → { "52" } ms). Den ene resterende falske lås er ved { "38" } dB-Hz, { "36" } Hz ved siden af. Alle flader stemmer: <c6/> og <c7/> (<c8/>), Python <c9/> (<c10/> er nu auto; stub opdateret) og MCP-værktøjet <c11/>. Brugere, der var afhængige af den gamle standard, kan angive <c12/> (<c13/>). Standarden for <c15/> i <c14/> forbliver { "1" }. Nye offentlige <c16/> og <c17/>; regressionstest <c18/>.

seg-52768eb8e3d5 = <b>Hver genereret grafik følger nu webstedets Observatory-tema: hvert diagrams bytes ændres.</b> Det er en bevidst revision af de offentliggjorte figurer, kun farver og skrifttyper; ingen plottet værdi, koordinat eller etiket er flyttet. Hvert scenaries <c1/> (og dermed Studios diagrameksport og README-demodiagrammerne), kørselsrapportens HTML (<c2/>), tidslinjeanimationen (<c3/>), HTML-siderne for scenarieresultater og studier, valideringsoversigten samt dokumentationens figurer og diagrammer brugte den varme mørke juli-palet (<c4/> baggrund, <c5/> guld) og et varmt papirtema til rapporter. De henter nu hver farve og skrifttype fra ét modul, <c6/>, som spejler <c7/>: diagrammer tegnes instrumentmørkt på Observatory-baggrunden (<c8/>) i Geist-skriftstakken; rapporten, animationsafspilleren og resultatsiderne følger seerens lyse/mørke præference med Observatory-tokens for lys og mørk. De seks fejldomæner beholder hver én farve (interferens koral, spoofing magenta, tidssynkronisering blå, baner cyan, integritet lime, navigation rav), og evidensniveauerne læses valideret lime, modelleret rav, partner magenta. Vandfaldsfarveskalaerne beholder deres perceptuelle (inferno) rækkefølge, forankret påny i den nye baggrund.

seg-d967e354a966 = <c1/> holder modulet synkroniseret med <c2/> i begge temaer, kontrollerer, at <c3/> og <c4/> (begge genereret fra modulet, til Python-figurværktøjerne og mermaid-cli) er aktuelle, og slår fejl, hvis en hex-farvekonstant optræder i <c5/> uden for paletten.

seg-fa3e60422ca5 = <c1/> får en tredje diagnose, "kun farver og skrifttyper er flyttet", så en paletrevision kan skelnes fra en flyttet plottet værdi. Hvert gengivet README-diagram blev kontrolleret lig sin forgænger under denne normalisering.

seg-3bc4056fd57e = <c1/> læser paletten og genererer nu også de tre README-resultatfigurer, der ikke havde nogen committet generator (<c2/>, <c3/>, <c4/>), med rigtige tekstelementer, ud fra <c5/>, resultatet <c6/> og <c7/>. <c8/> læser samme palet, hvilket retter dens afdrift fra webstedet i lyst tema. Værdierne i <c9/> er kolonnen med værste tilfælde for <c10/> i den fixture ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } og { "4.12e-6" } km), uændret fra Matplotlib-figuren, og <c11/> slår nu fejl, hvis den committede figur og fixturen er uenige.

seg-3196836a2a0d = <b><c1/> opdateret til aktuelle data (en dataændring, ikke en gentegning).</b> Figuren angav { "28" } funktioner på tværs af { "8" } domæner ({ "11" } validerede, { "17" } modellerede), forældet i forhold til sin egen angivne kilde; tegnet nu af sin nye generator ud fra <c2/> viser den { "46" } funktioner på tværs af { "8" } domæner ({ "17" } validerede, { "29" } modellerede).

seg-55d5b16379aa = <b>Q for CW/smalbåndsjammere er nu { "1.0" }, ikke { "1.5" }.</b> Lærebogsværdien for en tone på bæreren er { "1" } (en tone bevarer signalets spektrale spids, <c1/>, <c2/>); den gamle { "1.5" } gjorde en tone mindre skadelig end bredbåndsstøj ved samme J/S. Ændring i output: omkring −{ "1.8" } dB effektiv C/N0 under CW/smalbåndsjammere ved høj J/S i scenarietyperne <c3/>, <c4/> og interop (tonen i det medfølgende eksempel <c5/>: { "17.98" } dB-Hz fra tabellen, var { "19.74" }). Bredbånds-Q forbliver { "1.0" } (konservativt, omkring { "3" } dB under lærebogens ~{ "2" }) i afventning af gennemgang af { "0.34" }. Sæt <c6/> for at beholde den gamle { "1.5" }.

seg-99fab1936170 = <b>Heltalsoutput fra <c1/> bruger heltalsintervallet.</b> Med enhedseffektstøj og en skriveskala på { "1" } kom scener i <c2/>/<c3/> ud som omkring { "{" }-1, { "0" }, { "1" }{ "}" }, og 2-bit-scener havde deres tærskler ved { "2.8" } sigma. Heltalsformater skaleres nu, så den forventede RMS pr. komponent er en fjerdedel af fuld skala ({ "31.75" } LSB i ci8, { "8191.75" } i ci16) eller { "2" } LSB i 2-bit. Skalaen og antallet af klippede elementer udskrives og skrives til sidecar-filen. Float-output er uændret.

seg-696109ae70f8 = <b>Otte fixture-pins i syv testfiler slår ikke længere fejl på macOS på grund af forskelle i sidste bit</b> (del af issue #36). De pins, der kontrollerer, at motoren stadig bygger en uafhængig references committede inputs (Jacobianer, en tilstandstabel, opsendelsesazimutter), sammenlignede bit for bit og slog fejl på macOS arm64 med { "2" } til nogle tusinde enheder på sidste plads (ulp). De sammenligner nu inden for { "1e-12" } af en skala taget fra fixturen; heltal, nøgler og længder sammenlignes stadig nøjagtigt, og en mutationstest viser, at en relativ ændring på { "1e-6" } stadig slår fejl. Pinnen for opsendelsesazimut sammenligner <c1/> og den opstigende/nedstigende gren i stedet for selve azimutten, fordi <c2/> forstærker én ulp af sit argument til omkring { "3e-9" } rad, hvor en inklination er lig med et steds kobredde. Ingen tolerance for en uafhængig reference og ingen tærskel fastsat på forhånd er ændret. To tests (månens fælles OD, månens observerbarhed) er ikke dækket: på macOS flytter deres præregistrerede sammenligninger sig selv, og det overlades til en opfølgning.

seg-b6c354fa0c28 = <b><c1/> og <c2/> anvender front-end-flagene.</b> Brugsteksten annoncerede <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> på <c9/>, men <c10/> og <c11/> byggede aldrig kæden: flagene blev tavst ignoreret, og et flag uden værdi som <c12/> slugte flaget efter sig. Begge kommandoer parser dem nu, som <c13/> gør, og sætter en ny front-end-kæde foran indfangningsgennemløbet og sporingsgennemløbet. Outputtet svarer til at køre kommandoen på den fil, <c14/> skriver for de samme flag.

seg-d7238dab610e = IQ-scenedata placeres pr. signal.

seg-46ace9a3e008 = <c1/> (og <c2/>) lagde bits på { "50" } bit/s på hvert signal, piloter inklusive, og med GPS LNAV-raten på Galileo og BeiDou. Data følger nu hvert signals egen symboltakt, angivet af den nye <c3/> (<c4/>, sat af hver konstruktør i <c5/>). Det er { "10" } ms på L5-I5, { "4" } ms på E1-B, { "2" } ms på BeiDou B1I GEO (D2) og bits på { "20" } ms med en meander på { "10" } ms på GLONASS L1OF. Data afvises på piloter, på GPS L2C som én CM/CL-strøm, og <c6/> på alt andet end L1 C/A. Brugerdefinerede koder beholder den tidligere takt på { "20" } ms som standard. En programmatisk <c7/>, der bad om <c8/> på en kode, der ikke er L1 C/A, eller <c9/> på en pilot, plejede at generere tavst og returnerer nu en fejl ved første læsning.

seg-9dd38fa39d14 = GLONASS L1OF-kanaler indfanges og spores på deres egen FDMA-bærebølge.

seg-a775751ed6f6 = <c1/> og sporingskanalerne blandede hver kode ned fra kun <c2/>. I en GLONASS-optagelse med flere kanaler fandt en søgning efter kanal +{ "3" } derfor signalet fra kanal { "0" } (alle kanaler deler én afstandskode) og kiggede aldrig { "1.6875" } MHz højere. Begge bruger nu <c3/>. Bæreleddet er nul for enhver optagelse centreret på signalets egen bærebølge og udelades, når centret er ukendt, så CDMA-behandling er uændret. Hvis du har omgået den gamle adfærd ved at lægge <c4/> ind i sidecar-filens <c5/>, så fjern det led: forskydningen anvendes nu fra bæreren og centret, så hvis det bliver, anvendes den to gange. Kendt begrænsning, uændret her: en GLONASS-scene identificerer hver satellit ved sin frekvenskanal <c6/>, og satellit-id'et af typen <c7/> ombrydes ved en negativ kanal. Reference-sidecar-filen skriver <c8/> som <c9/> { "4294967289" } (<c10/>). Læs den tilbage som <c11/> med en cast til <c12/>.

seg-1c88bffc605b = <b>GNSS IQ-laget i CLI og Python ({ "0.32.0" } fase A).</b> Det eksisterende modul <c1/> kan nu bruges uden at skrive Rust. Fem nye kommandoer under <c2/> slutter sig til gruppen for datahåndtering: <c3/> genererer en lang IQ-scene med flere satellitter til en fil med en reference-sidecar; <c4/> kører FFT-indfangning af en eller flere PRN'er over en optagelse og rapporterer hver detektion (PRN, Doppler, kodefase, statistik, tærskel); <c5/> indfanger og kører derefter DLL/PLL/FLL-banken over en optagelse og udsender sporingsoutput pr. epoke (CSV/JSON) med konfigurerbare sløjfebåndbredder, integrationstid og korrelatorafstand; <c6/> genafspiller én optagelse over flere sløjfeudformninger og rapporterer de resulterende jitter- og låsemål pr. udformning; og <c7/> tilpasser modellen for tab af sløjfelås til en tidslinje for modtagertillid. Den samme kerne er eksponeret for Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>) og returnerer NumPy-venlige lister og dicts. Kun software og additivt: ingen nye afhængigheder, ingen udsendelse, ingen syntese af interferens- eller spoofing-bølgeformer; motoren, indfangningen, sporingen og sløjfeudformningerne er crate'ens egne, så en CLI- eller Python-kalder får de samme bits som Rust-testene. Nyt modul <c13/>; sceneens egen reference-sidecar er den uafhængige reference i <c14/> (indfangning genfinder hver indsat kodefase og Doppler, sporing konvergerer mod den indsatte Doppler). Intet offentliggjort antal scenarietyper og ingen række i verifikationsmatricen ændres.

seg-1971e3e9cfe6 = <b>Resterende GNSS IQ-biblioteksfunktioner i CLI-kommandoen <c1/> og i Python ({ "0.32.0" } fase A.2).</b> Bygger videre på fase A og gør resten af laget <c2/> tilgængeligt uden at skrive Rust:

seg-67c485097357 = <b>Udbredelseskanal på <c1/></b> (og Python <c2/>): en førsteordens ionosfære (<c3/>/<c4/> eller <c5/>), Saastamoinen/Niell-troposfæren (<c6/>), Cornell-scintillationsmodellen (<c7/>, <c8/>, <c9/>), spekulær flervejs fra jorden (<c10/>/<c11/>), landmobilkanalen med tre tilstande (<c12/>) og en blok uden sigtelinje (<c13/>) anvendes på hver satellit gennem en ny crate-intern bro (<c14/>), der omregner kanalmodellernes absolutte stier til sceneformen med overskud over geometrien.

seg-d736671f2251 = <b>SigMF-output på <c1/></b> (<c2/>): skriver samples som et par <c3/>/<c4/> med en capture og annotationer pr. satellit; <c5/>/<c6/> læser allerede SigMF, så en scene kan gennemløbes frem og tilbage uden tab.

seg-c59ae97779ae = <b>Front-end-DSP</b>: en ny kommando <c1/> og de samme flag på <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) kører trinnene i <c10/> (båndpas-FIR, adaptivt notch, pulsblanking, excision i frekvensdomænet, AGC, kvantiserer); spejlet i Python som <c11/>.

seg-878d66b73571 = <b>Scener med broadcast-efemeride</b>: <c1/> (med <c2/>/<c3/>/<c4/>) placerer hver sunde GPS-satellit i dens sande broadcast-geometri ved hjælp af motorens RINEX-læser, så reference-sidecar-filen bærer den reelle afstand, Doppler og kodefase pr. satellit; spejlet i Python som <c5/>. Kun software og additivt: ingen nye afhængigheder, ingen udsendelse, ingen syntese af interferens- eller spoofing-bølgeformer (kanalens udbredelseseffekter virker kun på det legitime signal). Hver numerisk påstand er testet mod en uafhængig reference (lukket form eller indsat reference) i enhedstestene for kanal/front-end og i <c6/>.

seg-1e71370d87d8 = <b>GNSS IQ-lag: simulering på signalniveau og softwaremodtagerbehandling.</b> Et nyt modul <c1/> løfter Kshana fra en front-end til én satellit og korte blokke i L1 C/A til et fuldt lag på signalniveau, tilgængeligt fra kommandogruppen <c2/>. Det genererer lange rå IQ-scener med flere satellitter med en reference-sidecar pr. epoke (<c3/>); anvender udbredelse på signalniveau — ionosfære med kode-bærebølge-divergens, troposfære, amplitude- og fasescintillation (Cornell-modellen), Fresnel-flervejs og en landmobilkanal med tre tilstande, med manglende sigtelinje (<c4/>); indfanger og sporer med FFT-indfangning og en DLL/PLL/FLL-bank med flere kanaler og genafspiller én optagelse gennem mange sløjfeudformninger (<c5/>, <c6/>); modellerer front-end — FIR/IIR-filtrering, kvantisering fra 1 til 14 bit, AGC, notch, pulsblanking og excision i frekvensdomænet (<c7/>); streamer store optagede datasæt med afgrænset hukommelse — formaterne int8/int16/float32/pakket 2-bit og reel IF, SigMF med flere filer, resampling, en datasætfortegnelse med SHA-256 pr. fil og en batchkører (<c8/>); tilføjer spredningskoder til GPS L5/L2C, Galileo E1 (CBOC, rigtige ICD-hukommelseskoder) og E5a, BeiDou B1C/B1I og GLONASS L1OF, hver kontrolleret mod sit interfacekontroldokument (<c9/>); og tilpasser modellen for tab af sløjfelås til en rigtig modtagers observerede adfærd i laboratoriekørsler, med leave-one-run-out-fejl på tilbageholdt datasæt og ekstrapolering mærket som forudsigelse (<c10/>). Hver numerisk påstand testes mod en uafhængig reference (en ICD-tabel, en lukket form eller en uafhængig modtager, der genfinder den indsatte reference); de fysiske kanal- og sløjfemodeller forbliver MODELLED. Dette er kun et softwarelag: det skriver IQ-filer til softwaremodtagere og syntetiserer ikke interferens- eller spoofing-bølgeformer og styrer ikke radiohardware. Intet offentliggjort antal scenarietyper og ingen række i verifikationsmatricen ændres. Udformning: <c11/>.

seg-943e21ccb25f = Modtagertillid: vurder en rigtig GNSS-modtagerlog.

seg-f8274120bff2 = <c1/> læser en log fra u-blox UBX, RINEX { "3" } (med en valgfri broadcast-navigationsfil), Android GnssLogger eller NMEA { "0183" } ind i én tidsstemplet tidslinje og kører tillidsmonitorer over den: fald i bærebølge-til-støj-tæthed (C/N0), tab af lås, automatisk forstærkningsstyring (AGC), u-bloxs jamming-indikator, positionsspring og, med RINEX og navigation, motorens egen enkeltpunktspositionsbestemmelse med paritetsbaseret autonom integritetskontrol i modtageren (RAIM) og den urstøttede monitor. Hver epoke er nominel, forringet eller upålidelig, og resultatet siger hvornår og hvorfor. Hændelser og forudsagte fald i C/N0, der er angivet i scenariet, scores mod tolerancer angivet i samme fil: detekteret, sen eller overset, og enig eller uenig. Output er resultat-JSON, en CSV pr. epoke og et diagram; resultatet bærer logens SHA-256 og hver tærskel. Kan også nås fra Python (<c2/>), WebAssembly-pakken (<c3/>, logs inline) og Model Context Protocol-serverens (MCP) nye værktøj <c4/>. Guide: <c5/>; eksempel: <c6/>. På spoofing-logs fra JammerTest { "2024" } gengiver motorstien den præregistrerede pipelines første alarm ved hvert offentliggjort starttidspunkt (<c7/>). Monitorerne forbliver MODELLED; ingen række i verifikationsmatricen ændres.

seg-55669fe92932 = En minor-udgivelse. Valideringsrunde { "2" } og pakkerne fra bølge 1 løfter verifikationsmatricen fra { "223" } rækker ({ "93" } VALIDATED) ved { "0.29.3" } til { "249" } rækker ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); hver oprykning blev kontrolleret mod en uafhængig reference med en tolerance fastsat før kørslen, og hver uenighed offentliggøres som et fund. Nyt: en native NAIF-kernelæser og DE440-sti, én valideret SGP4-til-ITRS-propagerings- og tidssti, et målt urbibliotek, en LunaNet AFS-referencegenerator, løsere med udvidet præcision og kvadratrodsinformation og rigtig IQ-behandling af månedata fra LuGRE. Offentliggjorte tal, der flyttede sig, er opført som revisioner nedenfor.

seg-f75f1878045e = Syvogtyve rækker i verifikationsmatricen bliver VALIDATED, efter at en uafhængig reference stemte inden for en tolerance fastsat før den første sammenligning (oprykningsreglen i <c1/>): ti i en første valideringsrunde og sytten i en anden. Enoghalvtreds MODELLED-rækker blev stillet over for en ekstern reference i den første runde og de resterende rækker, der kunne tages op, i den anden; hver uenighed er registreret nedenfor som et fund frem for at blive tunet væk. Tre rækker blev delt, så en valideret del ikke bærer en uvalideret rest, hvilket løfter matricen fra { "223" } til { "226" } rækker; valideringspakkerne, der siden er føjet til, tager den til { "249" }. Tallene er læst fra den genererede <c2/>.

seg-8d542741fa77 = efter runde { "1" }

seg-ae3743f976c5 = Rækker i verifikationsmatricen

seg-6c4b1fd56a31 = heraf VALIDATED mod en uafhængig ekstern reference

seg-90450fe87280 = heraf MODELLED

seg-86972e4c7f12 = heraf PARTNER

seg-61c5c5e308ed = Forkortelser brugt i denne post

seg-5907283b71da = Forkortelse

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (for ARAIM); avanceret autonom integritetskontrol i modtageren; Stanford Universitys Matlab Algorithm Availability Simulation Tool

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = Allan-deviation; hastighedsrandomwalk; vinkelrandomwalk

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = et open source-værktøj til astrodynamik (Nyx Space); NASA's værktøj Spacecraft, Planet, Instrument, C-matrix, Events fra dets Navigation and Ancillary Information Facility; planetkonstantkerne

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = barycentrisk himmelsk referencesystem; barycentrisk dynamisk tid; terrestrisk tid

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Det Internationale Bureau for Mål og Vægt; et laboratoriums realisering af koordineret universaltid

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; månetidssystemer skrevet i meddelelsens felt TIME_SYSTEM

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = Cramér–Rao nedre grænse

seg-a1fff77503b4 = CW

seg-064470740a35 = Clohessy–Wiltshire relativ bevægelse

seg-d70a9b3e92a7 = Development Ephemeris { "440" } fra Jet Propulsion Laboratory

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = præcisionsfortynding; positionspræcisionsfortynding

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = udvidet Kalman-filter; unscented Kalman-filter; inertinavigationssystem; globalt satellitnavigationssystem; inertimåleenhed

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = effektiv monitortærskel; lodret og vandret beskyttelsesniveau

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = Jordens orienteringsparametre; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; middelabsolutfejl

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = NASA's General Mission Analysis Tool

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = ikke-terrestrisk netværk (3GPP); synkroniseringssignalblok

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = heltals-mindste-kvadrater; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = intersystembias

seg-743c3303e01c = LEO

seg-d7b83e7c427f = lav jordbane

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = løsningsseparation med flere hypoteser; beskyttelsesniveau; beskyttelsesniveau for tidssynkronisering

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = effektspektraltæthed; in-phase- og kvadratursamples; Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvanteprojektionsstøj

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = autonom integritetskontrol i modtageren

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = satellitbaseret augmenteringssystem; det amerikanske Wide Area Augmentation System; dobbeltfrekvens med flere konstellationer; en geostationær SBAS-satellit

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = kvadratisk middelværdi; signal-i-rummet-afstandsfejl

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = et open source-bibliotek til GNSS-positionering

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = interferometri med meget lang baseline

seg-c3bc7d828ecc = Hver række nedenfor angiver sin type uafhængig reference (Library: et uafhængigt tredjepartsbibliotek, der beregner en entydigt defineret størrelse; Measured: rigtige måledata; P2: et uafhængigt numerisk bibliotek, der genberegner en lineær-algebra-størrelse på committede inputs), den uafhængige reference, tolerancen fastsat før kørslen og resultatet. Hver oprykning blev kørt igen af en anden gennemgår, som regenererede fixturen byte for byte og viste, at en bevidst motormutation gør testen rød.

seg-be0a4e3ac81c = <b>GNSS/INS-sensorfusion</b> (Library), afgrænset til det løst koblede 15-tilstands fejltilstands-EKF: NaveGo v1.4 (LGPL-3.0, kørt under GNU Octave) på dets egen rigtige Ekinox IMU/GNSS-køretur. Kshanas horisontale, vertikale og positionsinnovations-RMS er { "0.912" }, { "0.940" } og { "0.861" } af NaveGos (tærskel { "1.2" }), og dens gennemsnitlige normaliserede innovation er { "0.395" } (tærskel { "1.5" }). GNSS er til stede under hele køreturen, så intet udfald er testet. Det tæt koblede UKF og det koblede urfilter ligger uden for påstanden.

seg-0c82afd5ba30 = <b>3-DOF-attitude- og pejlefejlbudget</b> (Library), indsnævret til spidsen af gravitationsgradient-momentet: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } tilfælde, inden for { "1e-12" } relativt (værst { "2.1e-15" }). RSS-pejlebudgettet er en sum af tal angivet af kalderen og ligger uden for det.

seg-71cf58e91a09 = <b>Fælles geometri for kommunikation og navigation på Månen</b> (Library), indsnævret til stedplacering, azimut, elevation og afstand: ANISE { "0.10.2" }, { "768" } samples, inden for { "1e-6" } grad og { "1" } mm (værst { "2.2e-12" } grad og { "5.6e-9" } m). Parameteren for afstandsnøjagtighed er et udformningsinput uden for påstanden.

seg-0687c757231b = <b>Momentfri attitudedynamik for stiv krop</b> (Library): Basilisk { "2.9.1" } spacecraft hub, { "1e4" } s på to generelle inertier, kvaternion og vinkelhastigheder inden for { "1e-9" } (værst { "3.3e-11" } og { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>Opløsning af heltalsmultiplicitet i GNSS-bærebølgefase (LAMBDA)</b> (Library), indsnævret til ILS-løsningen og dens to bedste normer: RTKLIB v2.4.2-p13 <c1/>, { "300" } kovarianser, { "0" } heltalsafvigelser, normer inden for { "1e-9" } relativt (værst { "5.6e-13" }). Den bootstrappede succesrate forbliver kun kontrolleret internt.

seg-c23196cbdc96 = <b>Sammensat PL for tidssynkronisering, skalar MHSS</b> (P2): numpy { "2.3.5" } og scipy { "1.18.1" } på { "300" } committede inputs, PL inden for { "1e-9" } relativt (værst { "1.2e-10" }), drivende delmængde identisk.

seg-8f524d815949 = <b>GLS-fællesmode-whitening og Mahalanobis-identiteten</b> (P2): numpy { "2.3.5" } LAPACK på { "201" } committede kovarianser, inden for { "1e-12" } relativt (værst { "7.9e-16" }); konditionstal op til { "19.3" }.

seg-b4136cdb8a98 = <b>DE440-leverandør af månens hovedaksenorientering</b> (Library): SPICE <c1/> på den binære PCK ved { "2 000" } epoker mellem noderne, inden for { "1.7e-5" } rad (værst { "1.7e-6" } rad, omkring { "3" } m på overfladen), efter rettelsen opført under "Rettet".

seg-c28de00a491c = <b>SigMF-optagelser som input og output og Welch-spektre</b> (Library), indsnævret til SigMF-læsning og -skrivning og <c1/>: scipy { "1.18.1" } <c2/> inden for { "1e-12" } relativt pr. bin (værst { "6.0e-14" }); optagelser fra sigmf-python { "1.13.0" } dekodet bit-identisk; cratens metadata gyldige mod skemaet for SigMF { "v1.2.6" }. IQ-syntese og dens modelsammenligninger ligger uden for det.

seg-a7756d2e124a = <b>Fitter til LEO-broadcast-efemeride og SISRE som funktion af fitinterval</b> (Measured), indsnævret til Kepler-fittet med 16 parametre og dets SISRE for kun bane: præcise baner fra TU Graz ITSG for fire satellitter mod statistikken fra Liu et al. { "2025" }, komponenter inden for 1.5x ({ "0.804" } til { "1.087" }) og SISRE inden for 1.5x ({ "0.716" } til { "0.809" }).

seg-99debd58724a = Fund

seg-3f5b2f54c7bf = Den uafhængige reference var uenig med disse rækker, så de forbliver MODELLED. Hvert fund er også skrevet ind i rækkens tekst om den uafhængige reference (og dermed i <c1/>), med en test, der fastlåser det.

seg-e28fac875d8c = <b>Estimering af tilstand for ur ombord:</b> på tilbageholdte IGS-ure for { "11" } GPS Block IIF-satellitter er filteret med tre tilstande konsistent ét skridt frem, men overkonfident ved én time på { "9" } af { "11" } (periodiske led og flicker-led er ikke i modellen).

seg-5900ce454dc7 = <b>Spoofing-detektion:</b> på JammerTest { "2024" } slog ingen monitor på observabelniveau alarm inden for { "10" } s efter nogen af de { "8" } offentliggjorte starttidspunkter, og tre vinduer før starttidspunktet havde falske alarmer.

seg-08b6e6aa7d08 = <b>Beskyttelsesniveau for tidssynkronisering under spoofing:</b> den målte uopdagede tidsfejl overstiger TPL ved { "3" } af { "8" } detekterede starttidspunkter (1.9x til 5.3x); en urkalibrering på { "60" } s dækker ikke vandringen i modtagerens TCXO.

seg-a2f4df11d9cc = <b>Opsendelsesvindue og opstigningsgeometri:</b> mod Orekit { "12.2" } stemmer geometrien op til afrunding, men stedets hastighed fra Jordens rotation misser { "1e-6" } relativt ved { "62.9" } grader bredde ({ "1.12e-6" }, den polarbevægelse, som den sfæriske model udelader). Runde { "2" }: hastigheden for den sande pol med en epoke stemmer, standardhastigheden uden epoke misser stadig (se nedenfor).

seg-f6b6c9251a17 = <b>Ballistisk korridor for genindtræden (Allen–Eggers):</b> den forudsagte maksimale deceleration for Stardust-genindtrædenen er { "61.8" } g mod den rekonstruerede { "32.89" } g (+{ "88" } %, tolerance { "15" } %).

seg-5d83648dd867 = <b>Fælles fejl i UT1 og polarbevægelse:</b> mod nøjagtighedsformlen trykt i { "178" } numre af IERS Bulletin A stemmer polen inden for 1.5x, men UT1 gør ikke ({ "0.48" } ved { "10" } dage, { "1.59" } ved { "40" } dage). Afløst i runde { "2" }: rækken er nu VALIDATED (se nedenfor).

seg-98a99bcba894 = <b>Offline standardinput til Jordens orientering:</b> astropy bekræfter rækketællingen, men de { "12" } rækker, som cratet kalder Bulletin A-forudsigelser, er markeret som målt (I), ikke forudsagt (P). Tallene for samstemmighed i rækken for den operationelle prediktor var derfor mod målte rækker. Afløst i runde { "2" }: motoren klassificerer rækker efter flag, og rækken er VALIDATED.

seg-d96fbfa4be79 = <b>Fejl i Jordorienteringsprediktion i operationel stil:</b> prediktorens UT1-fejl er 2.4x til 12.6x fejlen i Bulletin A ved { "1" } til { "10" } dage og { "5.32" } ms ved { "10" } dage, uden for intervallet { "0.36" } til { "3.13" } ms i den 2. EOP PCC.

seg-1833bf6e3b6f = <b>Geodætisk VLBI på Månen:</b> mod lysrejsetider fra ANISE gennem DE440 ligger ingen forsinkelse inden for { "1" } ps; det største hul er { "24" } µs, mest det analytiske månecentrum (omkring { "200" } km fra DE440). Runde { "2" }: kernestien er VALIDATED i en egen række; denne analytiske sti forbliver MODELLED.

seg-0ec8a2a91702 = <b>Eksport til månens interoperabilitet:</b> Orekit { "12.2" } afviser tidssystemerne LTC og TCL, så udveksling af OEM-filer for Månen med en anden læser er ikke fastslået.

seg-09cfd4e61b7b = <b>Clohessy–Wiltshire relativ bevægelse:</b> mod Orekits ulineære bevægelse ved { "100" } m er forskellen { "1.2" } til { "6.3" } mm, over { "1" } mm; den skalerer som det udeladte andenordensled, så den præregistrerede tolerance lå under linearisationsfejlen. Afløst i runde { "2" }: andenordenskorrektionen er VALIDATED mod den samme tærskel.

seg-af1bdd974ba5 = <b>Fejlvækst for INS/TRN under coasting:</b> mod en frit inertial Monte Carlo fra NaveGo holder vækstlovene inden for { "5" } % til { "600" } s og overvurderer derefter (2.2x til 8x ved én time), fordi de udelader Schuler-tilbagekoblingen. Afløst i runde { "2" }: Schuler-fejlmodellen er VALIDATED.

seg-8459bc50f8b4 = <b>Servicevolumen på Månen ud fra rigtig konstellationsgeometri:</b> { "4" } af { "12" } offentliggjorte tilgængelighedsstatistikker afviger med mere end { "2" } procentpoint (op til { "22.5" }).

seg-7a0fd1377b9c = <b>Overgrænse for heterogen sporbarhedsbias i UTC(k):</b> på { "105 024" } BIPM-rækker overskrides overgrænsen i { "50.8" } % af rækkerne; den offentliggjorte usikkerhed afgrænser BIPM's måling af forskydningen, ikke forskydningen.

seg-814acf34cffd = <b>Klassifikation af datum-nulrum på Månen:</b> på den offentliggjorte geometri med fem reflektorer er korrelationen -0.78 mod -0.97, og CRLB for origo er { "96" } til { "98" } % under artiklens.

seg-da01b5e08a87 = <b>Substrat for månens LLR-datumgeometri:</b> mod { "192" } ILRS-normalpunkter for Månen fra { "2024" } var RMS af envejsresidualet { "96" } m med den tidligere orienteringsinterpolation og er { "22.7" } m efter rettelsen nedenfor, stadig over tærsklen på { "10" } m (afrundede stationskoordinater, ingen polarbevægelse). Orienteringsserien klampes tavst uden for 2024-2025. Runde { "2" }: modellen for målt afstand er VALIDATED i en egen række ({ "2.81" } m); serien dækker nu 2014-2030 og giver fejl uden for den.

seg-fd9ad94680e9 = <b>Kobling fra relativistisk urrate til referencesystem:</b> selvpotentialeleddet er { "3.18e-4" } over den offentliggjorte værdi (tolerance { "1e-4" }); artiklen evaluerer et andet potentiale, så ingen offentliggjort værdi af denne lukkede form findes. Afløst i runde { "2" }: ækvatorialpotentialet af grad 2 er VALIDATED mod den samme artikel.

seg-e002819c1e2d = <b>Fysiske konstanter for hvert legeme i solsystemet:</b> { "12" } af { "84" } konstanter for de tilføjede legemer afviger fra NAIF pck00011 og gm_de440 (ældre elementer for Marsmåner; andre GM-løsninger for Uranus, Neptun og Pluto). Runde { "2" }: konstanterne følger nu NAIF (en transskription, ikke medregnet), og den beregnede orientering stemmer med SPICE; rækken forbliver MODELLED.

seg-e722d242e78e = <b>Valgbare LEO-efemeridemodeller:</b> fittet med 22 parametre efterlader 1.71x og 1.86x den offentliggjorte fejl langs banen på buer på { "20" } min, over 1.5x. Afløst i runde { "2" }: modellen med 22 parametre og dens fit er VALIDATED i en egen række.

seg-c136023752df = <b>Fælles GNSS- og LEO-positionering:</b> intersystembiasen stemmer med RTKLIB, men { "93.2" } % af epokerne ligger inden for { "3" } m af ITRF2020 mod { "95" } %; RTKLIB selv når { "88.2" } % på dataene ({ "93.6" } % efter rettelsen af gruppeforsinkelsen i runde 2).

seg-e5f0e3c21def = <b>Fællesmodeblindhed i integritet</b> og <b>dækningskort og DOP-kort:</b> begge sammenligninger bestod, men blev afvist ved gennemgang, fordi en bevidst forkert motor også består dem (den første kontrollerer kun en intern identitet; den andens offentliggjorte gulve kan ikke se en fordoblet PDOP). Runde { "2" }: fællesmodeblindhed i integritet er VALIDATED på paritetsbærende inputs; dækningskortene forbliver et fund (se nedenfor).

seg-688e1753cd53 = Valideringsrunde { "2" }

seg-b320fbdb72c3 = Den anden runde tog hver række, der stadig kunne tages op efter den første runde, med friske præregistreringer committet, før noget fixture blev hentet, eller en uafhængig reference kørt, en adversariel anden gennemgår, der kørte hver sammenligning igen, og en bevidst motormutation, der skal gøre hver test rød. Ejeren accepterede den rettede formulering af rækken om grænsen uden for Omega den 2026-10-02, før den blev rykket op (dens gamle tekst modsagde koden).

seg-7b7c584caaaf = <b>Rykket op til VALIDATED ({ "17" }).</b> Type af uafhængig reference i parentes; tolerance fastsat før kørslen.

seg-555e6ad454d2 = <b>Kobling fra relativistisk urrate til referencesystem</b> (Reference): Ashby og Patla { "2024" } L_m inden for { "2.8e-6" } (tærskel { "1e-4" }) ud fra ækvatorialpotentialet af grad 2 for de to felter, som artiklen citerer; pyshtools tyngdefelt af grad 350 for den radiale post ({ "8.3e-5" }); DE441-månehastighed ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Offline standardinput til Jordens orientering</b> (Library): astropy { "8.0.1" } og IERS Bulletin A nr. { "039" } bekræfter de { "30" } endelige, { "54" } hurtige og { "90" } forudsagte rækker i det genskårne udtræk.

seg-b77253dd26b5 = <b>Fælles fejl i UT1 og polarbevægelse</b> (Library): fulde rotationer fra astropy og pyerfa gengiver den fælles tabel (UT1 og pol inden for { "6e-16" }, kombinationen inden for { "1.9e-7" }); de realiserede fejl i IERS Annual Report { "2019" } giver forhold på { "1.001" } til { "1.100" }.

seg-378414f812c1 = <b>EO-nyttelastens fodaftryk og dækning</b> (Library): Orekit { "12.2" } og GeographicLib { "2.1" } ved hver præregistreret tærskel, med den nodale J2-regression nu i nodeafstanden.

seg-792bf58a1c1e = <b>Clohessy–Wiltshire relativ bevægelse</b> (Library): med en andenordenskorrektion i lukket form inden for { "1.2e-7" } m af Orekits ulineære bevægelse mod { "1e-3" } m; den lineære matrix alene forbliver karakteriseret ({ "1.2" } til { "6.3" } mm).

seg-423437d90022 = <b>B-plane-målstyring og patched-conic-gravitationsassistance</b> (Library): GMAT R2026a B-plane, asymptoter, C3 og heliocentriske elementer; sbpy { "0.6.0" } og Kasuga og Jewitt { "2019" } for Tisserand-parameteren.

seg-b29b0dfcd3a4 = <b>Fejlvækst for INS/TRN under coasting</b> (Library): en Schuler-fejlmodel med ni tilstande inden for { "5" } % af korrigerede coast-kørsler fra NaveGo i alle { "48" } punkter (værst { "3.70" } %).

seg-8cc49496b4c6 = <b>Fællesmodeblindhed i integritet</b> (P2): numpy <c1/> på { "1464" } paritetsbærende inputs inden for { "1e-12" } (værst { "1.06e-14" }).

seg-f0ff538b7329 = <b>Fælles multiteknik-OD og ur på Månen</b> (P2): numpy genberegner hvert Gauss-Newton-skridt, sigma og stationsfejl på seks netværk (inden for { "2.4e-11" }) efter en rettelse af QR-løsningen.

seg-7ed9b059f888 = <b>Kovarians for stationskoordinater i månens VLBI</b> (Library): en Jacobian bygget med SPICE gengiver observationsplanen, spektret, sigmaerne og nulrummet inden for { "1" } % og { "0.1" } grad; numpy til { "2e-13" }.

seg-0e4e1c3fc899 = <b>Grænse for uopdagelig fællesmode, residual uden for Omega</b> (P2, formulering rettet ved ejerens beslutning): numpy LAPACK på { "256" } tilfælde inden for { "1e-12" }, seks eksakte uendeligheder.

seg-0fc8ce9cde6c = <b>Basisinvariant klassifikation af nulrum</b> (P2): delrumsskæring med SciPy og NumPy på { "72" } konstruerede matricer, heltal eksakte, projektornorm inden for { "6.0e-15" }.

seg-4e5e7a6072bc = <b>Enkeltfrekvens ionosfære- og UTC-tjenester i en LEO-navigationsmeddelelse</b> (Library): GNSSTk { "15.3.1" } for Klobuchar, Az og UTC-driften; ERFA for de tre skudsekundtilfælde.

seg-a644bf49c816 = <b>Positioneringsgrænse for 5G ikke-terrestriske netværk</b> (P1): grænser for enkelt-SSB fra Bachl, Lei og Nabeel { "2026" } inden for et halvt trykt ciffer; numpy for kovarianserne for positionsbestemmelserne.

seg-b326f6fc55ad = <b>LLR-model for målt afstand</b> (Measured, ny række udskilt fra substratet for LLR-datum): { "192" } ILRS-normalpunkter for Månen ved { "2.81" } m RMS mod en tærskel på { "10" } m, med IERS { "2010" } barycentrisk lystid; komponenterne under tærsklen opløses ikke én for én, og rækken siger det.

seg-82e9fba684dc = <b>Geodætisk VLBI på Månen, kernesti</b> (Library, ny række udskilt fra rækken for månens VLBI): SPICE-konvergerede lystider inden for { "1" } ps og partielle afledede inden for { "1e-6" } ved epoker nær J2000; den analytiske standardsti forbliver MODELLED.

seg-03c47d262ff3 = <b>LEO-efemeridemodellen med 22 parametre fra Liu et al. { "2025" } og dens fit</b> (Measured, ny række udskilt fra rækken for valgbare modeller): rigtige præcise baner inden for 1.5x af de offentliggjorte statistikker på artiklens dage og tilbageholdte dage ({ "0.683" } til { "1.186" }); skalakonventionen for n_dot er transskriberet og ikke valideret af denne sammenligning, og stopreglen er Kshanas regel om parameterkonvergens, ikke artiklens regel om RMS-ændring. ATOMIC-polynomiet og tabellen med fem højder forbliver MODELLED.

seg-b49f96eb52ad = Eksisterende VALIDATED-rækker med nyt grundlag (ingen ændring i antal).

seg-4e26bec3297c = <b>Planetpositioner fra JPL Standish-elementerne</b> og <b>lystid mellem solsystemets legemer</b>: de post hoc fastsatte tærskler på det dobbelte af nominelt er erstattet af præregistrerede sammenligninger med JPL Horizons DE441 (RMS højst tallet i Explanatory Supplement tabel { "8.10.1" }, værst { "0.778" }, Jordens opdeling og ICRF-rotationen inkluderet; lystider inden for { "1e-6" } s af Horizons på DE441-positioner, værst { "6.7e-9" } s). Deres flag "grænse sat efter sammenligningen" er fjernet.

seg-d3b745392d29 = <b>Integritet (RAIM/ARAIM/SBAS)</b>: rækken hviler ikke længere på plausibilitetskontroller. Den siger nu: ARAIM-løsningsseparationen med flere hypoteser fra ADD v4.2 stemmer med Stanford MAAST for ARAIM { "2" } på { "270" } rigtige tilfælde (værste VPL-forskel { "2.2e-3" } m mod { "0.05" } m); snapshot-RAIM-detektion og -udelukkelse stemmer med RTKLIB <c1/> på { "2016" } af { "2016" } beslutninger, med hældningsbeskyttelsesniveauet inden for { "2.7e-12" } m; SBAS DO-229E L1-beskyttelsesniveauerne stemmer med Stanford MAAST på rigtige WAAS-udsendelser ({ "2868" } par inden for { "1.6e-5" } m). Den siger klart, at funktionerne med ensartet sigma <c2/> og <c3/> IKKE er ADD-konforme (huller ved matchede inputs på 0.75/4.04 m og 0.39/1.93 m VPL/HPL, et fund), at DFMC L5 SBAS-sammenligningen er et fund ({ "308" } par uden GEO i sigte er beskyttet af Kshana og ikke af MAAST), og at <c4/> ikke har nogen ekstern sammenligning. Dens selvmarkering er fjernet.

seg-d059b9953c3f = <b>LEO-fitter til broadcast-efemeride</b>: den integrerede referencebane føjes til den validerede del (Orekit { "12.2" } inden for { "4.55" } mm over { "6" } h, tærskel { "2" } cm); korrektionspolynomierne, urfittet og afvejningen af opdateringsperioden forbliver modellerede.

seg-166d511bbba3 = <b>Fund og blokerede rækker (forbliver MODELLED).</b> Hver rækkes tekst om den uafhængige reference bærer fundet og dens fastlåste test.

seg-7f233dbdf110 = Modulation af navigationssignaler (Betz { "2001" }, Hein { "2006" }): spektre og korrelationer stemmer; sidelobes ved { "24" } MHz og hver flervejsbias ({ "11" } til { "15" } % for lav) gør ikke, årsag uafklaret.

seg-4d5a6bb44d64 = TDOA/FDOA-geolokalisering: grænserne matcher Ho og Chan og Ho og Xu og forfatternes kode til { "3e-12" }; Ottawa-faktorerne trykt fra en Monte Carlo afviger med { "1.3" } % og { "4.4" } %.

seg-5fa189f788ca = Jordens GNSS på månedistance: GENESIS-zenitmiddelværdier stemmer med Montenbruck et al. { "2023" } på { "5" } af { "6" }; nadirmiddelværdier er { "1.0" } til { "2.4" } satellitter for høje.

seg-d7e5b5a64f43 = Dæknings- og DOP-kort: udformninger for Jorden stemmer med Orekit, gnss_lib_py og numpy ved hver tærskel; udformninger for Månen og Mars overskrider { "1e-9" } kun på næsten singulære celler.

seg-3c8fb07d83ec = Fælles GNSS-positionering: dobbeltfrekvens { "79.9" } % og præcise produkter { "94.2" } % inden for { "3" } m mod { "95" } % (RTKLIB { "67.9" } % og { "94.1" } %); ISB-forskellen for præcise produkter skyldes, at RTKLIB ignorerer antenneforskydninger.

seg-5d3d4d99fbc4 = Sporingssløjfer (GNSS-SDR { "0.0.19" }): stemmer ved { "35" } til { "45" } dB-Hz; ved { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, tærskler +{ "1.5" } dB; slip-tider { "0.5" } til { "2" } dekader kortere.

seg-0dd24947169c = Servicevolumen på Månen (Orekit og Hipparchus): { "155" } af { "160" } værdier stemmer; kravet om værste sample slår fejl på næsten singulær LNCSS B-geometri.

seg-74002245287f = Kvanteinertisensor: QPN-gulvet alene er { "21" } til { "31" } % under den målte støj fra Gauguet { "2009" } (tærskel { "30" } %, misset med { "0.5" } point).

seg-ab8b17cf325e = Oscillator-forudindstillinger: målte enheder overstiger forudindstillingerne for rubidiums holdover, cæsiums korttidsstabilitet og CSAC's værste enhed; OCXO-forudindstillingen har ingen målt optegnelse.

seg-81ad9b839a28 = Rumvejrstæthed: Jacchia { "1971" } ligger inden for en faktor { "2" } af accelerometertætheder ved solmaksimum, men er omkring 1.7x for tæt i minimummet i { "2008" }.

seg-68e5d0942847 = Geometrifri skrå TEC: { "33" } af { "36" } buer inden for { "3" } TECU af CODE-kortet (værst { "6.84" }).

seg-f410ce9cf195 = Spoofing-detektion og TPL mod den officielle log fra JammerTest { "2024" }: { "4" } af { "10" } starttidspunkter detekteret i tide; TPL overskrides ved { "4" } af { "10" }.

seg-41eb2c318469 = Urfilter på friske IGS-ure: to af { "11" } satellitter slår fejl på kriteriet for innovationssum.

seg-064b623e918b = Mindste kvadraters plus autoregressiv EOP-prediktor: UT1 { "1.73" } til 2.11x Bulletin A ved { "2" } til { "10" } dage.

seg-d98571cc21f4 = Overgrænse for realiseret UTC(k)-forskydning: samlet overskridelse { "0.0333" } mod { "1e-2" }.

seg-527aca91ec7c = Månens referencesystemdatum fra en kampagne: SPICE-delen stemmer; P2-delen med estimerede stationer misser { "1e-9" } på et problem med kondition 2.1e8.

seg-9805c4c821f9 = Månens referencesystemdatum fra rigtig LLR: { "15" } af { "16" } tal stemmer med SPICE; sigma for z-translationen er { "1.03" } % for høj mod { "1" } %.

seg-08e6c541b59e = Genindtræden (Allen-Eggers): punktmasseløsningen stemmer med rekonstruktioner fra rumagenturer (kun en krydskontrol); accelerometersammenligningen er blokeret på en læsbar Hayabusa2-kilde.

seg-0bb78ffbd915 = ITU-T-masker: de trykte regneeksempler stemmer; klassegrænserne i G.8273.2 har ingen (blokeret).

seg-308c1bca3fd9 = Geometri for opsendelsesvindue: stedets hastighed for den sande pol med en epoke stemmer med Orekit ({ "4.9e-8" }); standardhastigheden uden epoke misser stadig ({ "1.12e-6" }). Ikke rykket op; opfølgning afventer.

seg-f0b7c3d60df8 = Fysiske konstanter for hvert legeme: nu afviger { "0" } af { "84" } fra NAIF (en transskription), og den beregnede orientering stemmer med SPICE til { "1.4e-10" } rad. Ikke rykket op; opfølgning afventer.

seg-a5a787c9a761 = Blokeret af en afgrænsningsbeslutning fra ejeren, hver med sin stemmende sammenligning committet: absolut stationsobserverbarhed på Månen, DOP for overfladefyr, eksporten uden for boresight, detektionseffekt på tværs af modaliteter, konsistensstatistikken for fælles mode og polær LEO-dækning.

seg-cf638ec9878b = Blokeret på data: budgettering af fejl ved tidsoverførsel (kræver en datareduktion på rigtige data), JammerTest C/N0 (antenneposition og effektfordeling ikke dokumenteret).

seg-e8709509eef3 = Revisioner (offentliggjorte tal, der flyttede sig, gammelt -> nyt).

seg-5e93ab237b15 = Beskyttelsesniveauer for <c1/> ligger nu på det geodætiske lokale niveau i stedet for det radiale: op til { "0.31" } m HPL og { "0.14" } m VPL ved ABMF ({ "16" } grad N); ingen golden-fil er flyttet, men det registrerede resumé i tutorialen <c2/> flytter sig fra middel-HPL { "22.1" } m / VPL { "40.0" } m til { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Standarder for kobling til Månens ratereferencesystem: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } pr. meter.

seg-8ac9cb8c5631 = Offline standardkørsel for EOP (<c1/>, celler opført i <c2/>): predicted_rows { "12" } -> { "90" }; polgulv { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; rækkerne i tabel { "2" } i <c3/>; samstemmighed for den operationelle prediktor 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

seg-dd93329245ba = <c1/> liu22 SISRE bane/med ur: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

seg-e4205dfdb0d2 = Liu-højdetabel, Kshana (forhold): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = Skalaen <c1/> i LEO-navigationsmeddelelsen { "2" }^-60 -> { "2" }^-58 (ikke præregistreret, oplyst; uden for fit-sammenligningen); CRC for liu22-eksempelrammen 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = Verifikationstabellen i <c1/>: rækken for Liu og ATOMIC delt i en VALIDATED række med 22 parametre og en MODELLED række for ATOMIC og fem højder.

seg-537f5d80b66c = Rækketekst for DE440-orienteringen af månens hovedakser: spænd 2024-2025 / { "731" } rækker -> 2014-2030 / { "6 209" } rækker; "klampes tavst" -> giver fejl uden for sit spænd.

seg-17a5dd090566 = Scenarie <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nye felter inclination_deg ({ "98.19" }) og nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (referenceuret for TDOP/GDOP er nu den lavest nummererede konstellation i sigte): globalt GDOP maks. { "2.2236" } -> { "2.1205" }, middel { "1.122" } -> { "1.131" }, median { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" } og GDOP-kortet pr. celle; mean_visible_by_constellation summeret som heltal (omkring { "1e-12" } relativt, usynligt ved { "4" } decimaler).

seg-e48b212c4881 = Fælles GNSS-positionsbestemmelse med enkelt frekvens efter rettelsen af broadcast-gruppeforsinkelsen: { "93.2" } % -> { "93.6" } % inden for { "3" } m; ISB-median -0.351 -> -0.114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costas-sløjfe SNR rho/4): ved tærsklen på { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; ved { "25" } dB-Hz { "9.55" } -> { "1.60" }; ved { "22" } dB-Hz { "2.24" } -> -0.14.

seg-789a302679f7 = <c1/>: hvert output flytter sig med Schuler-fejlmodellen; TRN-spidsen i det medfølgende scenarie { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = Rapport for <c1/>: ny nøgle geometry_path ("analytic" ved standardkørslen, ingen numerisk værdi ændret); nye valgfrie felter planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path, med epoch_partials på kernestien; typens beskrivelse er omskrevet. Verifikationsrækkens uafhængige reference for kernestien er SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) bliver en krydskontrol af kerneevaluering.

seg-3631a31e7b26 = Legemskonstanter: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); Phobos' ækvatorialradius { "13.1" } -> { "13.0" } km; pol og primærmeridian for Phobos og Deimos fra pck00011; prime_meridian_deg for solsystemet indeholder nu de kvadratiske og periodiske led.

seg-ac1251d7a0fd = <c1/> (<c2/> på Europa), fra den fulde orientering af Europa i pck00011 (7cfd66b4; orienteringen stemmer med SPICE pxform til { "1.4e-10" } rad), som flytter landeren i inertialrummet: tilgængelighed kun via relæer / med afstanden til Jorden { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } af { "171" } epoker kun via relæer), median-PDOP { "5.266" } -> { "5.360" }, RMS-fejl i positionsbestemmelsen { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, median formel sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tabellen i <c3/> og pinnen i <c4/> følger med; <c5/> er uændret.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), den kalibrerede faktor erstattet af Jacchia { "1971" }: activity_density_kg_m3 ved 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k fjernet, mean_exospheric_temperature_k tilføjet ({ "1186.7" } K); <c2/>: solcyklussvinget ved { "800" } km er nu 10.4x (NRLMSISE-00 13.6x), og påstanden om højde følger NRLMSISE's stigning til { "500" } km og fald ved { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (resumétekst uændret ved { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (QR-løsning): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> udsendt påny for de nye og fjernede felter ovenfor.

seg-717c51e1cca0 = Valideringspakker

seg-4ec44f8a5f8e = D12, udvidet præcision og en kvadratrodsløser (to nye VALIDATED-rækker: { "226" } -> { "228" } rækker, { "110" } -> { "112" } validerede).

seg-d28005966948 = Del { "1" }, uafhængig reference med udvidet præcision:

seg-9a5f94973450 = Månens datum for referencesystem med estimerede stationer: en uafhængig reference med mpmath-udvidet præcision på 50 cifre (præregistreret 804662d5, konditionsskalerede tærskler ud fra en a priori-formel for baglæns fejl) stemmer på en ny kampagnedato (2026-03-18) og på det oprindelige scenarie fra 2024-01-01; ny VALIDATED række under P2. Den afgør den tidligere strid om dobbelt præcision: motorens datumsigmaer er forkerte med op til { "9.7e-6" }, NumPys inversions- og egenværdiveje med op til { "6.2e-6" }, og dens Cholesky- og QR-veje med omkring { "1e-8" }. Motoren er inden for sin fejlgrænse, men omkring tusind gange mindre nøjagtig end en faktoriseringsvej.

seg-b055435a2138 = Miljø for uafhængig reference: mpmath { "1.3.0" } tilføjet.

seg-d0c2b2a8e635 = Revisioner: ingen. Ingen golden-fil eller offentliggjort figur ændres; rækken "Lunar frame datum from an observing campaign" forbliver MODELLED (grundlæggerens beslutning 2026-10-02, mulighed A: den låner ikke status fra den separate række); dens testtekst citerer den nye test og dens fund.

seg-50b53908fb7c = Del { "2" }, løser for kvadratrodsinformation af datum:

seg-4c6089cfac5e = Ny valgfri løser for kvadratrodsinformation (<c1/>; <c2/> i scenariet lunar-frame-campaign): Householder-QR, marginalisering gennem den trekantede faktor, en Jacobi-SVD til spektret og kompenserede produkter udelukkende fra korrekt afrundede operationer. Mod den uafhængige reference på 50 cifre (præregistreret b41908c9) stemmer dens datumsigmaer til { "3e-13" } på en ny dato (2026-06-09); på inputtene fra 2026-03-18 og 2024-01-01 er standardløseren forkert med op til { "1e-5" }. Ny VALIDATED række under P2. Standardløseren og dens output er uændrede. De præregistrerede tærskler fastslår kun fejl over omkring { "2e-7" } relativt: de afviser standardløseren, men ikke et vendt Householder-fortegn, et ikke-kompenseret prikprodukt eller en spektral endelig invers, og rækken siger det.

seg-de9aeb2adde0 = Valgfrie kvadratrodsstier ved siden af de uændrede standarder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> og <c6/>, på nye <c7/> og <c8/>. Hver stemmer med sin standard, hvor begge er nøjagtige (en intern kontrol, ingen række; ingen validering påstås for dem). <c9/> uddelegerer nu til en fælles rutine; dens output og hvert scenaries standardoutput er uændrede.

seg-87a632404f32 = Rangbeslutninger i månens referencesystemkampagne: en præregistreret kontrol med udvidet præcision over { "40" } dage bekræfter hver afgørbar stationsblok- og fuldrangs-Helmert-beslutning. A priori-grænsen kan ikke fastslå de { "20" } rangdefekte Helmert-dage; i eksakt aritmetik er deres defekt geometrisk, med tærsklen på { "1e-9" } inde i kampagnens naturlige interval af egenværdiforhold. Ingen række.

seg-3b24e7fa36bf = Påstanden for rækken om kampagnen med udvidet præcision er indsnævret til "inden for grænsen for værste tilfælde", og dens kontrol af svageste retning med stationer fastholdt måler nu en rigtig vinkel ({ "6.6e-16" } rad; sammenligneren er skiftet fra acos til en korde, tærsklen er ikke ændret).

seg-4fad02ab4b6d = Revisioner: ingen. Ingen golden-fil eller offentliggjort figur ændres; rækken "Lunar frame datum from an observing campaign" er uændret og forbliver MODELLED (grundlæggerens beslutning 2026-10-02, mulighed A).

seg-627d3357d620 = D4, rygraden for JPL-kerneefemeride, fase { "1" } (fire nye VALIDATED-rækker: { "228" } -> { "232" } rækker, { "112" } -> { "116" } validerede).

seg-30e8a645191f = NAIF-kernelæseren har sin egen række.

seg-98ff121aa2a9 = <c1/> (DAF-container, SPK type { "2" }, binær PCK type { "2" }) stemmer med SPICE Toolkit (CSPICE N0067 via spiceypy { "8.2.0" }) og med ANISE { "0.10.6" } på alle { "600" } DE440-tilstande og { "200" } rotationer af månens orientering på et tilfældigt gitter trukket fra præregistreringscommitens eget hash (abcd9133), inden for tærskler udledt på forhånd fra Chebyshev-evaluering i dobbelt præcision (værst { "0.6" } % af tærsklen, { "1.95e-3" } m). Rækken påstår, at motoren læser JPL-kerner korrekt, ikke at DE440 eller den analytiske serie er nøjagtig (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: DE440 (eller en hvilken som helst SPK af type 2) positioner gennem motorens egen læser, med todelte TDB-epoker og kernens SHA-256 gemt til rapporter; den erstatter aldrig en planet med systemets barycenter. <c2/> lader en geometristi vælge den analytiske serie (standarden) eller en kerne.

seg-6c7dae98601e = <b>Valgfri kerne-Måne for <c1/> og <c2/></b>: en nøgle <c3/> læser det geocentriske månecentrum fra kernen; intet andet ændres, og rapporten får en blok <c4/>, der navngiver kernen og dens SHA-256. Uden nøglen er begge rapporter byte-identiske med før.

seg-74e8def84747 = <b>Kovarians for punkt på månens overflade på kernestien</b> (ny VALIDATED række): med hver station fastholdt og beaconen på DE440-Månen stemmer beaconens kovarians med en SPICE lysrejse-Jacobian (værst { "1.7e-3" } mod en tærskel på { "1" } %) og en NumPy-invers ({ "4e-14" } mod { "1e-9" }), præregistreret 4a51256 (<c1/>). Rækken for den analytiske sti forbliver MODELLED: på den analytiske Måne er dens mindste beacon-sigma { "3.9" } % under den uafhængige reference.

seg-55002d236ab0 = <b>Månens datum for referencesystem fra en rigtig kampagne, kerne-månecentrum</b> (ny VALIDATED række): på { "447" } usete normalpunkter fra 2019-Q2, præregistreret 830d945a før nogen blev hentet, stemmer datumkovariansen på kernestien med den uændrede uafhængige reference fra SPICE og NumPy inden for { "7.6e-5" } mod tærskler på { "1" } % og { "2" } % (<c1/>). Grundlæggeren besluttede, at denne række kun rykkes op på friske punkter; diagnostikken på sete data (c51f8b2) er et fund, ikke evidens. Tærsklen skelner ikke mellem månemodeller: den analytiske Måne består også på samme udsnit (værst { "3.8e-3" }), den planlagte mutation (kerne-Månen en time for sent) blev ikke opdaget, og ved foldet bestod også et månecentrum, der var cirka { "4,650" } km forkert (Månen taget om Jord-Måne-barycentret). Rækken påstår kovariansen på den sti, ikke månecentrum, og siger det.

seg-f147f9257b8b = <b>Positioner for Solen, Månen, Merkur og Venus fra DE440 ved UTC-epoker</b> (ny VALIDATED række): <c1/> stemmer med Skyfield { "1.54" } på { "600" } positioner mellem { "1973" } og { "2026" }, værst { "2.96" } m, inden for en præregistreret tærskel (0bfafe6d) sat af serien med to led for TDB − TT (<c2/>). Planetpositioner får denne nye kernerække nu; rækken for Standish og rækken for planetmåner er uændrede, og månerne venter på et scenarie, der har brug for dem (grundlæggerens beslutning).

seg-bb840641c655 = Fund: den ene tærskel, som sammenligningen for LLR-datum misser (sigma for z-translation { "1.025" } % mod { "1" } %), falder til { "0.049" } %, når kun månecentrum læses fra DE440, på sete data (<c1/>); på det friske udsnit fra { "2019" } består den analytiske Måne også, så den tærskel, der blev misset i { "2015" }, var marginal for det kvartals geometri. De analytiske rækker "Lunar frame datum from a REAL observing campaign" og "Lunar-surface-point coordinate covariance … kept distinct from the Earth-station one" forbliver MODELLED; deres tekster om den uafhængige reference peger nu på rækkerne for kernestien.

seg-64c9f3b96392 = <c1/> siger ikke længere, at motoren ikke har nogen læser for binære kerner; den peger på rækken for læseren og forklarer, hvorfor rumfartøjskerner (typerne { "13" } og { "21" }) stadig kommer gennem Horizons.

seg-841deceb80e6 = Revisioner: ingen. Ingen golden-fil, offentliggjort figur eller eksisterende testværdi ændres; de analytiske rapporter for <c1/> og <c2/> og rapporten for <c3/> med alle stationer fastholdt er byte-identiske med før (resultatets SHA-256-præfikser 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, målt urbibliotek "Clock Atlas" (tre nye rækker, én VALIDATED: { "232" } -> { "235" } rækker, { "116" } -> { "117" } validerede).

seg-1f8644486f5d = <b>Målt urbibliotek (<c1/>).</b> Enhedskort (hvid fasestøj, hvid, flicker- og random-walk-frekvensmodulation, en lineær frekvensdrift og eventuelt faseled med én til fire pr. omløb) tilpasset en navngivet målt urregistrering og scoret på tilbageholdte data; hulbevidste Allan- og Hadamard-varianser; en konditioneringsdetektor, der logger hvert hul, fase-outlier, fasetrin, burst og frekvenstrin og intet kender til fil- eller dagsgrænser; omregning af et kort til støjmodellen for slot-timing, den udvidede Kalman-urmodel og spoofing-monitorens støjniveauer. Læsere til RINEX- og IGS-urfiler, BIPM-filer pr. laboratorium og Circular T afsnit { "1" } (<c2/>); en samlet, hierarkisk ældningsgrænse for UTC(k) (<c3/>, endnu ikke scoret).

seg-93add052ae56 = <b>Identifikation af støj ved lag-1-autokorrelation</b> (<c1/>, Riley og Greenhall { "2004" }), ny VALIDATED række (Library): stemmer med allantools { "2024.6" } <c2/> på { "140" } tilfælde, heltal identiske, værste forskel { "9.6e-13" } mod en tærskel på { "1e-9" } (præregistreret 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Målte enhedskort med forudsigelse på tilbageholdte data</b>, ny MODELLED række (et fund): fit på en tredjedel, forudsigelse af Allan-deviationen for de to andre tredjedele inden for en faktor { "1.5" } (præregistreret 2ec76864). GPS Block IIF på et friskt IGS-vindue (2026-03-01 til { "14" }): { "10" } af { "11" }; G27 er optimistisk på to-timers-skalaen (værste faktor { "1.510" }). Cæsium (inden for, { "1.070" }), OCXO (uden for, { "2.348" }) og strontium (inden for) rapporteres, ikke blinde. JammerTest-modtagerkortet og kortene for Galileo-masere og Deep Space Atomic Clock er blokeret. En modelklasse for ZED-F9P-modtager-TCXO på { "12" } statiske stationer i Wroclaw (Zenodo { "6488497" }) slår fejl: { "1" } af { "11" } blinde stationer i en oplyst rettet genkørsel (<c1/>, <c2/>).

seg-26fa898f6272 = <b>GPS Block IIF-kort med led pr. omløb</b>, ny MODELLED række (et fund): på et andet friskt vindue (2026-04-01 til { "14" }) { "9" } af { "11" } inden for tærsklen; G03 ({ "1.947" }) og G25 ({ "1.581" }) er optimistiske, fordi deres tilbageholdte optegnelser er mere støjede end deres fit-tredjedele; hvis de periodiske led udelades, slår alle { "11" } fejl (præregistreret fb475550; <c1/>).

seg-ef456da29319 = <b>M002, estimering af tilstand for ur ombord, runde { "3" }</b> (et fund, forbliver MODELLED): efter den frosne konditioneringsdetektor klarer det udvidede filter fra runde 2, med uændret tuning og uændrede kriterier, (a) og (c) på alle { "11" } satellitter for første gang; (b) slår fejl på G09 ({ "0.894" }) og G26 ({ "0.876" }) (præregistreret fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, spoofing-detektion, runde { "3" } til 4b</b> (forbliver MODELLED): runde { "3" } blokeret ({ "167" } træningsepoker fra JammerTest-enhedens andre sessioner mod { "3600" }); med et modelklassekort for ZED-F9P (runde { "4" } og 4b) udløser urmonitoren nul falske alarmer før starttidspunktet ved alle { "10" } loggede starttidspunkter (runde { "2" }: { "86" }), og { "6" } af { "10" } starttidspunkter detekteres inden for { "10" } s (runde { "2" }: { "4" }); de samme fire er stadig sene (<c1/>).

seg-79757abc69e3 = <b>M083, overgrænse for UTC(k), runde { "3" }</b>: præregistreret prospektivt (fb475550) på Circular T-numre fra { "465" }, endnu ikke kørt (<c1/>).

seg-09abf996ed16 = Miljø for uafhængig reference: Wroclaw ZED-F9P-registreringen er datastyret under <c1/> (CC BY { "4.0" }, omkring { "1.5" } GB); IGS-urfixturerne er medleveret (IGS-produkter, med kildeangivelse).

seg-b05fa0811a3e = Revisioner: ingen. Ingen golden-fil, offentliggjort figur eller eksisterende testværdi ændres; M001 (genforankring af holdover) følges ikke op, fordi ingen urklasse blev rykket op.

seg-986f4075210b = D8, én valideret sti for propagering, referencesystem og tid (tre nye VALIDATED-rækker og M131 rykket op: { "235" } -> { "238" } rækker, validerede { "117" } -> { "121" }).

seg-d7a612528765 = De scenarietyper for Jordbaner, der bar deres egne modeller med kun to legemer, sekulær J2 eller sideraltid, deler nu én sti: SGP4/SDP4-elementsæt med todelte juliandatoer, ført til GCRS og ITRS (International Terrestrial Reference System) gennem IAU (International Astronomical Union) 2006/2000A-kæden, med valgfri Jordorienteringsparametre.

seg-016507ccdb8f = Nye <c1/>, <c2/>, <c3/>, <c4/> og <c5/>; <c6/> og <c7/> tager todelte epoker. Ny <c8/> (SOFA's konvention <c9/> for skudsekunddage), <c10/>, <c11/>, <c12/> (gennem TAI, som SOFA <c13/>), <c14/> og en todelt <c15/>.

seg-158c39fff817 = Polartilstanden i <c1/> propagerer med SGP4 ved 2026-01-01T00:{ "00" }:{ "00" } UTC på IAU-kæden (<c2/> tager enhver epoke); SGP4 Walker-generatoren roterer til det jordfaste referencesystem gennem IAU-kæden.

seg-86ecad91a601 = Scenarietypen <c1/> kører en ny prediktor for tilsyneladende passager (<c2/>, <c3/>): SGP4 på IAU-kæden, refraktion efter ITU-R P.834-9 og downlink-lysrejsetiden (nye indstillinger <c4/> og <c5/>, slået til som standard), Jordorienteringsparametre (<c6/>, <c7/>, <c8/>, standard { "0" }), krydsninger løst til { "1e-7" } s og kulminationen ved gyldensnitssøgning. Den geometriske <c9/> er uændret.

seg-9ce091899bf1 = <c1/> forhindrer, at pakkens geometri-, tids- og propageringskerner bærer en privat Kepler-propagering, sekulære J2-rater eller en rotation med kun sideraltid; navngivne hurtige niveauer og fysik, der er en rækkes emne, er begrundede undtagelser.

seg-cf4ae964c5d1 = Ny VALIDATED række "Two-part Julian dates and leap seconds on the Earth-orbit time path": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> på { "224" } tidspunkter omkring alle { "27" } skudsekunder inden for { "1e-6" } s (præregistreret e947e69d); værst { "1.9e-11" } s.

seg-c0dec16ea932 = Ny VALIDATED række "One Earth-orbit path": TEME-positioner for { "232" } elementsæt mod python-sgp4 { "2.24" } (Vallados reference-SGP4) inden for { "6.1e-8" } m (tærskel { "1" } cm), og rotationerne GCRS -> ITRS og TEME -> ITRS mod ERFA <c1/>, <c2/> og <c3/> inden for { "2.9e-6" } mas og { "0.41" } mas (tærskler { "0.1" } og { "2" } mas), med Jordorienteringsparametre (præregistreret 72ea9eb0). Oplyst: den første kørsel slog fejl ved 2016-12-31T23:{ "59" }:{ "59.5" } med ét sekund af rotation; UT1 blev taget fra UTC's kvasi-juliandato på en skudsekunddag, motoren går nu gennem TAI, og den anden kørsel stemmer ved uændrede tærskler.

seg-a72ccdc2516e = M131 "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS" bliver VALIDATED: Orekit { "13.1.8" } tager motorens GCRS-tilstande, roterer dem og beregner sigtbarhed og DOP (NumPy for grupper med flere ure); positioner inden for { "6.8e-5" } m (tærskel { "0.2" } m), antal i sigte identiske på 4040/4040 samples, median-DOP inden for { "2.3e-11" } relativt.

seg-db498ac8e135 = Ny VALIDATED række "Apparent ground-station pass prediction with refraction and light time": Orekit { "13.1.8" } propagerer de samme elementsæt i en TEME, det bygger efter den angivne definition, med ITU-R P.834-refraktion og dets målemodel for lysrejsetid, over { "60" } tilfælde ved stationer i havniveau: { "1210" } passager, krydsninger inden for { "3.4e-6" } s (tærskel { "5" } ms), maksimal elevation inden for { "5.5e-7" } grad, tilsyneladende retning inden for { "8.8e-7" } grad (tærskel { "1e-4" } grad).

seg-ab87bb0ee63d = Fund, holdt fastlåst: de første sammenligninger af hele påstanden mod Orekit fra ende til anden missede deres positions- og retningstærskler, ikke på grund af motoren, men fordi SDP4 i Orekit { "13.1.8" } afviger fra reference-SGP4 for cirkulære (e = { "0" }) dybrumsbaner (op til { "67" } m), og dens standard-TEME er bygget på nutationen fra IERS { "1996" } (IAU { "1980" }), omkring { "72" } millibuesekunder fra IAU 2006/2000A-kæden ({ "2.7" } m ved LEO). Orekits ITU-R P.834-koefficient for h*theta0^{ "2" } er { "0.011380" }, hvor anbefalingen trykker { "0.01380" }; sammenligningen er i havniveau, hvor leddet forsvinder, og forskellen over det er fastlåst.

seg-49978e6a73b2 = "Ground-station pass prediction (ground segment)" forbliver VALIDATED, med påstanden indsnævret til den geometriske <c1/>; typen <c2/> hører til den nye række.

seg-60d6ac0011f1 = Miljø for uafhængig reference: Orekit { "13.1.8" } med Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Revisioner: det medfølgende <c1/> samlet adgang { "1675" } s -> { "1659" } s (fem passager som før; bedste maksimale elevation { "73.25" } grad -> { "70.08" } grad), og hvert output for <c2/> flytter sig med den nye sti (den udskrevne linje i <c3/> og posten <c4/> i <c5/> siger det nu); det medfølgende <c6/> GNSS-VDOP ved ækvator { "1.19669" } -> { "1.19710" }, ved { "89.9" } grad { "1.50645" } -> { "1.50590" }, fusioneret VDOP ved { "89.9" } grad { "1.14388" } -> { "1.14250" } (de offentliggjorte tal med to decimaler { "1.20" }, { "1.51" } og { "1.14" } er uændrede). Ingen golden-filer ændres.

seg-b65f3186a7e9 = Endnu ikke rutet: <c1/>, tilstandene doppler, joint og timing i <c2/> og referencebanen i <c3/> (deres modeller ligger i <c4/> og <c5/>), og udformninger for Jorden i <c6/> (et navngivet hurtigt niveau med to legemer).

seg-03f638f20376 = D6, LunaNet AFS-referencegenerator, LSIS V1.0 (fire nye rækker, to VALIDATED: { "238" } -> { "242" } rækker, validerede { "121" } -> { "123" }).

seg-1d09f0582781 = <b>LunaNet Augmented Forward Signal (AFS)-referencegenerator</b> (<c1/>), fastlåst til LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 af { "29" }. januar { "2025" } og navngiver den version i hvert output: bærebølgen på { "2492.028" } MHz; datakanalen AFS-I BPSK({ "1" }) med { "500" } symboler pr. sekund og dens Gold-kode på 2046 chips; pilotsignalet AFS-Q BPSK({ "5" }) med dets primære Weil-kode på 10230 chips, sekundære kode på 4 chips og tertiære kode på 1500 chips; rammen med identifikator { "0" } (synkroniseringsmønster, BCH ({ "51" }, { "8" }) underramme { "1" }, CRC-24, LDPC-underrammer med rate en halv { "2" } til { "4" }, blokinterleaver { "60" } gange { "98" }) med en udtømmende dekoder for underramme 1 og en min-sum-LDPC-dekoder skrevet alene ud fra paritetskontrolmatricen; og IQ-syntese i basisbånd med referencemærker skrevet som en SigMF-optagelse. Koder genereres ud fra standardens skifteregistre og Legendre/Weil-konstruktioner. Intet kopieret fra standarden videredistribueres (den har ingen vilkår for genbrug): de primære indekser for AFS-Q kommer fra IS-GPS-800J, og det, som kun standardens bilag definerer (G2-forsinkelser for AFS-I, tertiære koder, LDPC-delmatricer), læses ved kørsel fra en lokal cache, som <c2/> fylder fra den NASA-hostede PDF, hver fil kontrolleret mod en fastlåst SHA-256 (<c3/>). Modellen er en referencemodel til formatkontrol, ikke en kanal-, udbredelses- eller link budget-model.

seg-7b8cb0461377 = <c1/> og <c2/>: en optagelse kan bære navnerumsopdelte udvidelsesfelter deklareret i <c3/>.

seg-a9465820a1fc = Ny VALIDATED række "LunaNet AFS baseband rendering against an independent generator, given its channel state": mod LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, S-band-build), nul chip-afvigelser over koderne for PRN { "1" } til { "210" }, nul symbolafvigelser over de tre rammer i kørslen og en normaliseret kompleks korrelation på { "0.999990" } over { "23.9" } s af dens egne samples (værste blok på { "2" } ms { "0.999948" }), inden for tærskler fastsat før sammenligningen (præregistreret 986ac280). Den driver rendereren med simulatorens egen kanaltilstand og dækker ikke effektfordelingen ud fra bærebølge-til-støj-tætheden eller SigMF- og 8-bit-skrivningen.

seg-07edced2764a = Ny VALIDATED række "LunaNet AFS frame channel coding, FID { "0" }": rammerne på 6000 symboler er identiske med rammerne fra LANS-AFS-SIM symbol for symbol (præregistreret 986ac280); koden for underramme 1 gengiver regneeksemplet i LSIS figur { "8" }, og CRC-24 kontrolværdien i kataloget CRC-24/LTE-A.

seg-ab94ac9f41fc = Begge rækker, der rykkes op, er datastyrede af LSIS-cachen: deres test af den uafhængige reference springes over med en meddelelse, indtil <c1/> er kørt.

seg-89a4bc4a766e = Fund (ny MODELLED række), "LunaNet AFS spreading-code generation": af { "2 937 232" } genererede chips og bits sammenlignet med standardens tabeller og filerne i bilag { "3" } afviger én, de "sidste { "24" } chips", som tabel E-5 trykker for tertiær PRN { "147" }, hvilket dublerer cellen for PRN { "151" }, mens standardens egen fil i bilag { "3" } stemmer med generatoren. Kriteriet om nul afvigelser er misset.

seg-d4e76301323f = Fund (ny MODELLED række), "LunaNet AFS closed-loop decodability": tre præregistrerede kørsler mod PocketSDR-AFS; den tredje klarede fuldt ud sine tærskler for sporing og dekodning, men ikke sin kontrol af, at en modtagerbuild, der kun udskriver, gengiver den fastlåste builds log, fordi to kørsler af den uændrede modtager allerede afviger i deres indfangningsregistre.

seg-93cfa05a1923 = Rettet: standardbærebølgen for <c1/> (<c2/>), <c3/> og <c4/> var en afrundet { "2.4" } GHz; den er nu LSIS-020 AFS-bærebølgen, { "2492.028" } MHz. Ved den gamle standard var tabet i frit rum undervurderet med { "0.327" } dB.

seg-ed7c170ccc2c = Revisioner: ingen. Hvert medfølgende scenarie navngiver sin bærebølge, og resultaterne af alle { "138" } scenariefiler er byte-identiske med den forrige main.

seg-3ec7f5b17122 = D7, rigtig IQ fra Månen og GPS LNAV (syv nye rækker, ingen VALIDATED: { "242" } -> { "249" } rækker, validerede { "123" } uændret).

seg-0c3dcf4f2b0f = <c1/>: en hurtig Fouriertransformation (FFT) med blandet radix, hvis output er de samme bits på alle platforme; en SHA-256-pin af transformationerne på 8000 og 24000 punkter består på x86_64 og på wasm32-wasip1 (køremiljø i <c2/>).

seg-150d9809c584 = <c1/>: parallel kodefasesøgning på samplet IQ (<c2/>, <c3/>) med kohærent foldning, ikke-kohærent akkumulering, en chi-i-anden-tærskel for en falsk-alarm-sandsynlighed på tværs af søgningen og en cellegennemsnitsstatistik for båndbegrænset støj; <c4/>, <c5/> med kode-Doppler samt M2M4- og grid-peak-estimatorer for bærebølge-til-støj-tæthed (C/N0).

seg-46bda8ecf2cd = <c1/>: en kodning af den ældre GPS-navigationsmeddelelse (LNAV) efter IS-GPS-200 for underrammer { "1" } til { "3" }, med paritet efter tabel 20-XIV og en feltdekoder.

seg-43444792974c = <c1/>: en læser til ION GNSS SDR Metadata Standard (<c2/>) og dens samplefiler, med <c3/> for to-komplement-niveauer.

seg-a7dfc3475923 = <c1/>: LuGRE-batchhoved for IQS (Lunar GNSS Receiver Experiment), RAW-, ACQ- og NAV-telemetri og CLK-filer samt en kontrol, der opregner, hvor metadata i <c2/> modsiger det binære hoved.

seg-f0125531c4f8 = <c1/> og, i <c2/>, yaw-styringens kropsreferencesystem, vinkler for udsendelsesazimut og off-nadir samt <c3/> for relativ C/N0 med målte mønstre.

seg-679aa02de1d0 = Kodning af GPS LNAV-navigationsmeddelelsen (ny række, forbliver MODELLED efter integratorens efterverifikation): på IGS-broadcastfilen fra { "2" }. marts { "2025" }, parset og dekodet af RTKLIB v2.4.2-p13, består alle { "960" } ord paritet, alle { "96" } underrammer dekodes, og alle { "608" } broadcast-heltal er lig Kshanas (<c1/>), men præregistreringen (d4d9eb9d) nåede den offentlige gren to sekunder efter committen med resultatet, så rækkefølgen "registreret før filen blev hentet" kan ikke påvises, og rækken rykkes ikke op.

seg-2875ba2d8f5f = <c1/> fylder ord fra den mest betydende bit (I i den høje nibble af en LuGRE-byte; den tidligere læsning gav det konjugerede signal), beholder den gamle læsning som <c2/> og læser samples, der er bredere end et ord.

seg-f6e0e3b9b166 = <c1/>: fasekohærent Doppler-forfining ({ "0.2" } Hz RMS ved { "30" } dB-Hz over { "200" } ms i simulering).

seg-b0f6a61acce0 = GPS L1 C/A mod gps-sdr-sim: chips og paritet er bit-eksakte; { "230" } af { "1152" } LNAV-felter afviger med én enhed, fordi gps-sdr-sim trunkerer, hvor det udsendte heltal kræver afrunding.

seg-1c525ca495c0 = LNAV dekodet af RTKLIB: al paritet og alle underrammer består, og hver parameter er inden for et halvt kvantum; { "41" } skalerede værdier afviger med nogle få enheder på sidste plads gennem RTKLIBs decimale konstant { "2" }^-43, over den registrerede tærskel.

seg-14e26e69777b = LuGRE-indfangning mod GNSS-SDR { "0.0.19" }: { "266" } af { "266" } beslutninger stemmer, { "250" } placeret på samme celle; de fleste positive er artefakter af et middel på −{ "0.5" } i de nøgne 4-bit-niveauer; C/N0-delen havde ingen samtidige flyvedata. To batches (OP5, OP12) blev udelukket ved en fejl: deres metadata stemmer med deres hoveder, men læseren kunne da ikke læse en sample bredere end et ord.

seg-3a32ff9d66fc = LuGRE-indfangning mod banepredikeret Doppler: med sampleeffektbeslutningen krydser hver søgning på båndbegrænset støj; med cellegennemsnitsbeslutningen stemmer de stærkeste par i størrelse med omvendt fortegn, hvilket viser, at den registrerede I/Q-rækkefølge er den konjugerede af dataene.

seg-2bb618ba4059 = Blind indfangning på batches fra månens overflade: fire batches indfanger hver én satellit (forudsagt synlig, ingen falsk alarm ved { "1e-7" }), ingen to, så tærsklen for Doppler-forskel har intet par at score.

seg-f95606e17fd1 = Relativ C/N0 på månedistance (M039 omformuleret): { "15" } Block IIR/IIR-M-optegnelser og ét par, for få til den registrerede tærskel.

seg-9306cf44fc44 = Revisioner: ingen; intet offentliggjort tal, golden-fil eller dokumentationsfigur ændret.

seg-2a3cb68c94d6 = Rækken M039 "Earth-GNSS at lunar distance" omformulerer sin påstand på månedistance som den relative C/N0 mellem satellitter ved én epoke plus sigtbarhed (absolut C/N0 påstås ikke); den forbliver MODELLED. Den øverste NOTICE bærer kildeangivelsen for LuGRE under CC BY { "4.0" }.

seg-e1e4094a186a = Orienteringen af månens hovedakser fra DE440 interpoleres nu langs geodæten mellem daglige noder. Den tidligere elementvise interpolation var forkert med op til { "2.0e-4" } rad ({ "340" } m på månens overflade) nær kvartpunkterne i hver dag, ikke de "omkring { "14" } m", rækken angav. Dens brugere (geometri for månens laserafstandsmåling, månens datum, månens fejlobserverbarhed) får den rettede orientering.

seg-a2071d345923 = Rettelser af motoren i runde { "2" }, hver kørt igen mod sin uændrede præregistrerede tolerance: IERS-årgangen for en EOP-række læses fra dens I/P-flag i stedet for fra en tom Bulletin B-blok; <c1/> bruger det geodætiske lokale niveau; koblingen til månens ratereferencesystem bruger ækvatorialradius, J2 og rotation; liu22-fittet starter ved nul korrektioner uden priors og bruger artiklens middelbevægelsesrate; EO-nodeafstanden bærer den nodale J2-regression; Costas-sløjfens tid til cycle slip bruger rho/4; den fælles positionsbestemmelse anvender broadcast-gruppeforsinkelsen for parret; den fælles løsning for Månen bruger et QR-skridt; NTN-grænsen evalueres på den sande position; urreferencen i konstellationsudformningen er den lavest nummererede konstellation i sigte; DE440-orienteringsserien spænder over 2014-2030 og giver fejl uden for den i stedet for at klampe.

seg-74f397ad9c16 = <c1/>, en referencebane bygget ud fra tabellerede jordfaste tilstande, brugt i sammenligningen af fitteren på rigtige baner.

seg-7293b717d978 = Testfilerne og fixturerne til sammenligningerne ovenfor, hver med sin generator og en <c1/>, der angiver kilde, licens, hentedato og SHA-256.

seg-920fe965bda9 = Runde { "2" }: <c1/> og <c2/> (ADD v4.2-fejldetektion efter Stanford MAAST for ARAIM { "2" }, BSD-3-meddelelse i kilden); <c3/>; <c4/> og <c5/>; INS-fejlmodellen med ni tilstande <c6/>; partielle afledede for <c7/> og inputtene <c8/> på kernestien; <c9/>, en læser til SPK type { "2" } og binære PCK-kerner; <c10/> med ITRF2020-stationer; tætheden fra Jacchia { "1971" }; <c11/> over enhver efemeridekilde; <c12/>; <c13/> og <c14/>; <c15/>; <c16/> (læsere til RINEX-ur, ANTEX og DCB).

seg-e3336e670d51 = En patch-udgivelse på { "0.29.2" }. Kshana Studio er bygget om omkring to visninger: en enkel visning, der svarer først og forklarer med almindelige ord, og en avanceret visning med det fulde dashboard. Der følger to små rettelser på kshana.dev med. Motoren ændres ikke: hvert medfølgende scenarie giver et resultat, der er byte-identisk med { "0.29.2" } bortset fra versionsstemplet.

seg-c40ab967ace6 = <b>Kshana Studio har en enkel visning.</b> Det er den, Studio åbner på.

seg-6a5ae001d00e = Svaret kommer først: et scenarie åbner på sit resultat, formuleret i én almindelig sætning. Hvert medfølgende scenarie har sin egen sætning, skrevet ud fra det, scenariet måler.

seg-375421534e4c = Der vises højst fem indstillinger, dem der ændrer svaret mest. Resten ligger under "Avancerede indstillinger", foldet sammen, indtil du åbner dem.

seg-d8650ae64549 = "Sådan beregnes det" forklarer metoden i få linjer, og "Til forskere" viser motorens egne tal, scenariefilen og den evidens, der ligger bag resultatet.

seg-36af7640e6ad = <b>Det fulde dashboard er den avancerede visning.</b> Alle paneler, diagrammer, eksporter og rapporter fra den tidligere Studio findes dér.

seg-0428d0a7921b = <b>En kontakt skifter mellem de to visninger og bevarer din plads.</b> Scenariet, den visning du var i, og alle indstillinger, du har redigeret, følger med. Studio husker, hvilken visning du brugte sidst. Links fra webstedet og dokumentationen åbner den enkle visning; et link med <c1/> åbner den avancerede visning, og alle tidligere Studio-links åbner stadig det samme scenarie og den samme visning.

seg-2c98ed084c10 = <b>En hurtigere første visning på langsomme forbindelser.</b> Det optagne svar for et scenarie tegnes, før resten af Studio er indlæst, så på en langsom mobilforbindelse vises svaret efter cirka to sekunder i stedet for cirka ni.

seg-2214d2dcfab4 = <b>Bedre søgning.</b> En søgning viser nu først de scenarier, hvis område eller titel matcher ordene, før scenarier, der kun nævner dem i filnavnet eller teksten.

seg-aa8d43280c19 = <b>Globussen på forsiden bliver ikke længere tom, når reduceret bevægelse er slået til.</b> Når systemindstillingen for reduceret bevægelse var slået til, kunne en ændring af vinduets størrelse efterlade hero-globussen tom, indtil siden blev rullet. Globussen tegnes nu om i samme billede som størrelsesændringen.

seg-da4b78816df1 = <b>L-bånd-konsollen på forsiden forklarer sit tomme bånd.</b> I "Watch a jammer take the band" forblev GPS L5 / Galileo E5a-panelet mørkt hele minuttet, hvilket virkede ødelagt. Ingen jammer sender i det bånd i dette scenarie, og satellitsignalerne ligger under støjgulvet, så intet dér hæver sig over det. En diskret mærkat siger nu det i hver panelstrækning, hvor intet ligger over gulvet (L5 / E5a-panelet og L2C-panelet, før dets støjjammer starter), sammen med hvert båndets C/N0 og låsetilstand fra den samme kørsel. Den placeres kun dér, hvor intet er over gulvet, så den dækker aldrig jammerenergi.

seg-e353fdee7033 = En patch-udgivelse på { "0.29.1" }. Den fjerner duplikeret kode i LEO-navigationsmeddelelses-, fusions- og spektrummodulerne, tilføjer et lyst tema til kshana.dev, flytter Kshana Studio til sin egen adresse, gør webstedet læsbart for søgemaskiner og AI-assistenter, retter flere små ting i Studio og lader npm-udgivelser publicere uden et gemt token. Intet motoroutput ændres: hvert medfølgende scenarie giver et resultat, der er byte-identisk med { "0.29.1" } bortset fra versionsstemplet.

seg-e8bf0a4fdc35 = <b>Et lyst tema til kshana.dev.</b> Hver side kan læses lys eller mørk. Webstedet følger læserens systemindstilling og har en kontakt til at ændre den.

seg-8e7cabc14c40 = <b>Søgemaskiner og AI-assistenter kan læse webstedet.</b> Hver side har nu sin egen titel, beskrivelse, kanoniske adresse, tags til sociale kort og strukturerede schema.org-data samt almindelig tekst til de sektioner, et script tegner. Webstedet udgiver <c1/>, en <c2/> med datoen for hver sides seneste ændring, <c3/> og <c4/> (en kort og en fuld guide i almindelig tekst til AI-assistenter) samt en IndexNow-nøgle, så en udrulning kan fortælle søgemaskiner, hvad der er ændret.

seg-804ba71be9ed = <b>npm-udgivelser kan publicere uden et gemt token.</b> npm-jobbet kører nu Node { "24" } og npm { "11.5.1" } eller nyere, som understøtter npm trusted publishing: npm bytter udgivelsesjobbets GitHub-identitet til en kortlivet legitimation. Hemmeligheden <c1/> virker stadig og bruges, så længe den er sat, så intet ændres, før trusted publishing er slået til for pakken på npmjs.com. <c2/> angiver trinnene.

seg-81405e5a5e06 = <b>Forsidens overskrift er læsbar hen over globussen.</b> En blød skygge ligger nu bag overskriften og dens tekst og toner baneliniernes og satellitprikkernes visning på den animerede globus ned, hvor de krydser den.

seg-24b8363acc14 = <b>Kshana Studio har sin egen adresse: <a1>https://kshana.dev/studio/</a1>.</b> Hvert link på webstedet og i dokumentationen peger dertil. Den gamle adresse, <c1/>, virker stadig og videresender til den nye, så scenariet, visningen og andre indstillinger i linket bevares.

seg-12f223b986bd = <b>Rettelser i Studio.</b> Motorfilen hentes én gang i stedet for to. Mens den hentes, viser Studio scenariets optagne resultat med det samme, markeret som optaget, i stedet for en tom skærm. På en telefon er overskriften én kompakt række. Nøgletallene ombrydes to på en række, så intet skjules uden for skærmens kant. Feltmærkater bruger scenariets egne ord med feltnavnet ved siden af, og søgningen finder felter ved begge dele.

seg-c130d8a4dc5e = <b>Mindre duplikeret kode.</b> LEO-navigationsmeddelelsens enhedstabel skrev de samme ti SISRE-statistikrækker for fire tilpasningsoversigter. En makro skriver dem nu én gang. De to spektrum-vandfaldsdiagrammer deler én tidsakse, farvebjælke og C/N0-bjælkepanel. Hovedgitterets nedsampling genbruger <c1/>, og Simpson-integralet genbruger <c2/>. LEO-passagetypens to indgangspunkter deler ét opsætningstrin. <c3/> importerer vektorhjælpefunktionerne fra <c4/> i stedet for at kopiere dem. Den avancerede rapport importerer API-rapportens HTML-escape i stedet for at kopiere den. Hver af de { "139" } scenariefiler i <c5/> blev kørt på { "0.29.1" } og på denne kode, og hver outputfil er byte-identisk.

seg-166b0435c96f = <b>Enhedstabellerne for leo-navmsg og leo-pvt har deres egne filer.</b> De er flyttet ud af moduler, der også indeholder logik, til <c1/> og <c2/>. <c3/> beholder sin offentlige sti. Kun disse to tabelfiler kommer med i undtagelserne for kopi-og-indsæt-detektion for deklarative kataloger i <c4/>, som <c5/> kontrollerer.

seg-f8b372e08ef9 = <b>READMEs CI-badge viser resultatet af push til main.</b> Badget talte kørsler af alle hændelser på main, så det kunne vise "failing", mens hver push-kørsel var grøn; det beder nu kun om push-kørsler (<c1/>).

seg-7c41a482c7d8 = En patch-udgivelse på { "0.29.0" }: det målte dækningstal, projektets navnelinje på kshana.dev, et hurtigere dækningsjob og en opdateret README. Intet motoroutput ændres: hvert scenarie giver samme resultat som på { "0.29.0" }.

seg-997490bd1696 = Rettelser af offentliggjorte tal

seg-ed4b071e4bd9 = <b>Linjedækning: ~{ "96" } % → ~{ "95" } %.</b> Dækningsjobbet målte den udgivne { "0.29.0" }-kode igen (commit <c1/>, CI-kørsel { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } af { "58,697" } linjer i <c3/>. Det offentliggjorte tal var { "95.63" } % ({ "37,697" } af { "39,419" } linjer), målt på <c4/> før { "0.28.0" }; det blev rundet til ~{ "96" } %. Det nye tal rundes til ~{ "95" } %, så alle flader, som <c5/> låser fast, flytter sig sammen: <c6/>, README-badget, Evidence-linjen og CI-tabellen, badgene på crates.io, PyPI og npm, den tekniske rapport og dækningssiden på kshana.dev. Gulvet på { "85" } % er uændret.

seg-577baa03af04 = <b>Navnelinjen på kshana.dev.</b> "Kshana · क्षण · the precise instant" åbner nu forsidens hero og står under mærket i hver sides fodlinje. kshana.dev sender stadig ingen forespørgsler til nogen anden vært: devanagari-skriften er en selvhostet Noto Sans Devanagari-delmængde med de tre bogstaver i क्षण ({ "1,692" } bytes, <c1/>, med teksten til SIL Open Font License og dens SHA-256 i <c2/>). <c3/> har lært at gemme en Google Fonts-delmængde med <c4/> under et indholdsadresseret filnavn.

seg-35b5bc4ee466 = <b>Webstedets links lander dér, hvor de peger, på rene adresser.</b> Et link til en sektion placerer nu sektionen lige under overskriften, på en telefon og på en computer: et sektorlink under Missioner åbner sektoren med dens panel øverst; links under Funktioner og Udgaver holder deres plads, mens diagrammerne ovenover tegnes; Udgaver lægger ikke længere en ekstra forskydning for overskriften til; og et link ind i en foldet del af en dokumentationsside åbner den. Hver side linkes med sin rene adresse (<c1/>, <c2/>, <c3/> for forsiden), og de kanoniske links, sitemappet og omdirigeringerne fra gamle adresser nævner de samme; adresserne med <c4/> virker stadig. Forskning har sit eget link i overskriften mellem Evidens og Udviklere og i fodlinjen. Dokumentationen viser ikke længere køreplanen (<c5/> bliver i repositoriet): gruppen Projekt er Changelog, Licensing, Security, Contributing, Governance og Code of conduct, og ordlisten er flyttet til Kom i gang.

seg-3da9f00f5ce6 = <b>Dækningsjobbet er hurtigere.</b> På { "0.29.0" } tog det { "143" } minutter mod raske { "91" } til

seg-85d502773367 = Fuzzeren <c1/>, årsagen sidste gang, tog { "4" } af dem. Det medfølgende korpus voksede fra { "74" } til { "139" } scenarier, og tre testprogrammer gennemgik det hele én fil ad gangen (<c2/> to gange, <c3/> og <c4/> én gang): tilsammen { "37" } minutter under dækningsinstrumentering mod { "3" } på { "0.27.2" }. De deler nu <c5/>, som kører arbejdet for hvert scenarie på hver kerne og returnerer resultaterne i sorteret rækkefølge; hvert scenarie og hver assertion bevares. På en arm64-bærbar, debug-build: <c6/> tager { "143" } s på { "14" } kerner mod { "612" } s med <c7/> (den gamle serielle gennemgang).

seg-bb69dbadbc81 = <b>README, opdateret.</b> Den åbner med samme navnelinje som webstedet; Studio-skærmbillederne er taget om fra Studio { "0.29.1" }, med et nyt af Studio på en telefon og dens trinlinje i bunden; en ny strimmel, "The site", viser tre sider af kshana.dev fra build { "0.29.1" } (<c1/>, sammensat af <c2/> og registreret i <c3/>); dækningstallet er ~{ "95" } %; og forskningsfigurens alt-tekst, som gentog arkitekturfigurens, beskriver nu artiklerne. Badgene i overskriften er mindre og kortere ({ "18" } px høje; "~{ "95" }%", "83/223", "quality", "AGPL-3.0", "zenodo.20528627"), så alle elleve er der plads til på to linjer; hvert link og hver alt-tekst bevarer sin fulde betydning.

seg-f61ef3e16884 = <b>Jobbet til container-imaget får { "90" } minutter.</b> Ved { "v0.29.0" } ramte det emulerede linux/arm64-build af imaget <c1/> den gamle grænse på 45 minutter, mens det kompilerede sin sidste crate, så imaget, MCP-registerets post og kanalkontrollen ikke blev publiceret. Grænsen er nu { "90" } minutter; imaget er uændret.

seg-1688bf9f0fec = <b>Otte float-literaler er omgrupperet</b> i <c1/> og <c2/> (<c3/> → <c4/>): SonarQube Cloud læste en sidste gruppe på <c5/> eller <c6/> som et manglende suffiks <c7/> eller <c8/> (regel S7454). Værdierne er de samme tal, så hvert resultat er uændret.

seg-81fd160937db = Tolv nye scenarietyper og tre nye måder at læse en kørsel på. Motoren dækker nu radiospektret, hele solsystemet, konstellationer omkring ethvert legeme, kampagner, der kæder scenarier sammen til én mission, og positionering, navigation og tidssynkronisering (PNT) fra lav jordbane (LEO) fra signalet til positionsbestemmelsen. Hver kørsel kan også skrives som en animation, en fuld rapport og et sæt interoperabilitetsfiler til andre værktøjer.

seg-118be64d7cb2 = Omkring motoren: en gentegnet kshana.dev (et websted med flere sider og et nyt Kshana Studio-dashboard, der kører alle funktioner i browseren), en omskrevet README, fjorten værktøjer på Model Context Protocol-serveren (MCP), et browser-build, der giver de samme tal som det native, og en offentlig side for Kshana Pro.

seg-ea31356bc17d = Scenariefiler (plus ét suitemanifest)

seg-26654cd81de1 = { "138" }, hvoraf { "132" } er medfølgende til <c1/>

seg-3d1a85e93e48 = hvoraf MODELLED (angiven model, kontrolleret for intern konsistens)

seg-e77f9d273ee1 = hvoraf PARTNER (kræver en partners hardware eller data)

seg-e94cd6b3561a = Hvor væksten kommer fra:

seg-1759a8cce7d6 = Typer

seg-94de9433d99f = Scenariefiler

seg-03d7aea335dc = Matrixrækker (valideret + modelleret)

seg-fdd674722717 = Spektrum

seg-59583fa40da3 = Solsystemet og positionering omkring ethvert legeme

seg-fafa167623df = Scenarier til søs, på vej og på skinner

seg-fc571c46e522 = Animation, rapporter, interoperabilitetseksporter

seg-2746e0d9f787 = LEO-signaludformninger og multibåndsspektret

seg-d40ec114d1f9 = LEO-positionering, tidssynkronisering og fusion

seg-0157f649e65b = LEO-kæde fra ende til anden

seg-423283112128 = LEO-modstandsdygtighed, fokusområder og slutbrugerscenarier

seg-395beca13299 = Tilføjet i alt

seg-ea9dc4093d8a = LEO-funktionen er systemagnostisk: den kører på generiske, angivne parametre og kræver intet navngivet system. Navngivne systemer er valgfri forudindstillinger, hver i sin egen fil med sin offentlige kilde. Én forudindstilling, Celeste IOD (demonstration i kredsløb), bruger tal præsenteret på ESA NAVISP LEO-PNT-workshoppen, { "2026" } (ESA er Den Europæiske Rumorganisation; NAVISP er dens Navigation Innovation and Support Programme); den ligger i én fil, <c1/>, sammen med sine fem scenarier, der kun findes i repositoriet, så den kan holdes tilbage uden en kildeændring, og ingen af dens workshoptal gentages i denne changelog.

seg-c36a5015c03c = <b>Læs "Rettelser af offentliggjorte tal", før du opgraderer.</b> Ét motoroutput ændres (kolonnerne i inertialsystemet for typen <c1/>, efter en fortegnsrettelse i nutationsmatricen), og dokumentationsgennemgangen rettede tal, som tidligere dokumenter havde trykt.

seg-7fe505d3232b = Statusser: <b>VALIDATED</b> betyder kontrolleret mod en uafhængig ekstern reference (en offentliggjort tabel, en anden gruppes software eller måledata); <b>MODELLED</b> betyder en angiven model, der kun er kontrolleret for intern konsistens; <b>PARTNER</b> betyder, at kontrollen kræver en partners hardware eller data.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project; femtegenerations mobilnet; ikke-terrestrisk net

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = kalenderæraer (anno Domini, før Kristus)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternativ binær offsetbærebølge; binær offsetbærebølge; binær faseskiftmodulation; multiplekset binær offsetbærebølge (signalmodulationer)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (en offentliggjort LEO-efemeridemodel)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = grov/akvisitionskode samt bærebølge- og civile signalnavne i Global Positioning System

seg-e464509f3abb = forhold mellem bærebølge og støjtæthed

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = kommandolinjegrænseflade

seg-9aa3c2e54398 = 24-bit cyklisk redundanskontrol (Qualcomm-polynomium)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = kommaseparerede værdier; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform ressourcelokator

seg-3ad592244ea8 = kontinuert bølge

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (kort- og globusformater)

seg-3415aa029e39 = Development Ephemeris { "441" } fra Jet Propulsion Laboratory

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital objektidentifikator

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = præcisionsforringelse: geometrisk, position, horisontal, vertikal

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = Galileos signalnavne

seg-544f4fcbd68f = et slotnavn i konstellationstabellen for Global Positioning System

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = jordcentreret, jordfast

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = jævndøgnsligningen

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = ækvivalent isotropisk udstrålet effekt

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (astronomibiblioteker til reference)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = Den Europæiske Rumorganisation; dens Navigation Innovation and Support Programme

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = frekvensdelt multipel adgang

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = Ruslands Global Navigation Satellite System

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = globalt satellitnavigationssystem; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = Den Internationale Astronomiske Union

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = grænsefladespecifikation; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Den Internationale Søfartsorganisation

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = inertinavigationssystem; mikroelektromekanisk system

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = demonstration i kredsløb

seg-92cd0058a058 = IQ

seg-c7fa50165400 = i fase og kvadratur

seg-41471e51e661 = grænsefladespecifikationen for Global Positioning System

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Den Internationale Rumstation

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-jordfast; sand ækvator, middeljævndøgn (referencesystemer)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Den Internationale Telekommunikationsunion; dens radiokommunikationssektor

seg-a524e4c4a670 = forhold mellem jammer og signal

seg-5d93361e20d4 = J2 til J6, J2000

seg-50255586b303 = zonale harmoniske i tyngdefeltet; epoken 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Jet Propulsion Laboratory

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = lav jordbane; mellemhøj jordbane

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = modelbaseret systemudvikling

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = normaliseret estimationsfejl i anden potens

seg-56d5135d987d = Galileos ionosfæremodel

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (præcise baner); tolinjers elementsæt

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = positionering, navigation og tidssynkronisering; præcis punktpositionering

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = effektspektraltæthed; spektral separationskoefficient

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = modtagerautonom integritetsovervågning; overvågning af signalkvalitet

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = kvadratisk middelværdi

seg-e1c3c49833fc = et open source-bibliotek til GNSS-positionering, brugt her som uafhængig reference

seg-9ead536db4aa = Simplified General Perturbations { "4" } (banemodellen for tolinjers elementsæt)

seg-865e7d1794b6 = Secure Hash Algorithm, 256-bit

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = afstandsfejl for signal i rummet

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (dets efemeridefilformat <c1/>)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = rumfartøjsidentifikator

seg-de4e841ce8a2 = en Walker-konstellations samlede antal satellitter, baneplaner og faseforskydning

seg-4d6ebfefc096 = TEC

seg-5149401781dd = samlet elektronindhold

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahøj frekvens

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = Coordinated Universal Time

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = signalnavne i Xona Pulsar-systemet

seg-d6a3f210958a = Et ændret offentliggjort tal er en rettelse og bliver registreret, aldrig rettet i det skjulte. Denne udgivelse indeholder én rettelse af motoroutput og flere af tal, der er trykt i dokumentationen.

seg-1669eb4224f1 = Motoroutput

seg-185961ebab61 = TEME→GCRS-reduktionen drejede med { "2" }·Δψ: nutationsmatricen havde fortegnet for Δψ omvendt.

seg-504b78f30c54 = <c1/> byggede <c2/>, hvor SOFAs <c3/> bygger <c4/>, så <c5/>, <c6/>, <c7/> og <c8/> roterede med det dobbelte af nutationen i længde, cirka { "25" } buesekunder. Hver kontrol på kæden var en egenskabstest (korrekt rotation, rundtur, et bidrag fra nutationen forskelligt fra nul), som en fortegnsfejl består; Vallado-testen fra ende til anden dækkede TEME→PEF, TEME→ITRF og GCRS→ITRS, men ikke TEME→GCRS. På Vallado-eksemplet (AIAA 2006-6753, 2004-04-06) missede kæden den offentliggjorte GCRF med { "1 145" } m; den lander nu { "0.11" } m fra den, og matricen er lig ERFAs <c9/> til { "1e-14" }. <c10/> og <c11/> fejler begge med det gamle fortegn. Konsistenstesten for CIO (Celestial Intermediate Origin) i <c12/> havde tilskrevet den resulterende afvigelse på ~{ "130" } m til "≈ { "2" }·EE"; resten er nu { "5" } cm, og dens grænse er strammet fra { "250" } m til { "1" } m. <b>Dette flytter offentliggjorte tal, registreret her som en rettelse:</b> kolonnerne <c14/> og <c15/> for typen <c13/> (omkring { "0.8" }–{ "1.0" } km for det medfølgende ISS-scenarie (Den Internationale Rumstation); dets kolonner for TEME, jordfast, sporet på jorden, pejlevinkel og Doppler ændres ikke) samt <c16/> / <c17/> for rammerne GCRS og ITRS. Intet medfølgende scenaries oversigtslinje, diagram eller golden hash læser disse kolonner. De nye interoperabilitetseksporter bruger den rettede kæde: den første <c18/>-satellits CZML-position stemmer med en ERFA-reduktion af den samme TLE (propageret af Python-pakken <c19/>) til { "2.3" } cm.

seg-a0a4026d22ed = <b>Typen <c1/>, native og i browser-buildet.</b> Typen beregner nu hver transcendent funktion gennem ét bærbart matematikbibliotek, så dens frame er de samme bytes på hver platform og i hvert build (under Fixed). Hvert tal for <c2/> flytter sig med, og det samme gør trinnet <c3/> i <c4/>. Typen er ny i denne udgivelse, så intet fra en tidligere udgivelse flytter sig, men tal, der er trykt før rettelsen, gør: kontrolværdien for scenariet med kodning og afkodning i <c5/> var <c6/> og er <c7/>, og den afkodede meddelelses SISRE er { "0.129" } cm. På kshana.dev viste Missioner-kortet for <c8/> en værste afstandsfejl på { "1.6" } mm med en tilpasning på { "60" } s og { "40.3" } mm med en tilpasning på { "900" } s; webstedet bygges nu af denne udgivelses motor og viser { "1.8" } mm og { "46.6" } mm.

seg-77f441bfc3c3 = <b>Jamming-fodaftrykskortet på kshana.dev (Missioner).</b> Hver af dets { "875" } celler er én kørsel af <c1/>, hvor kun modtagerens position er ændret. Cellerne beregnes nu ud fra de samme koordinater med tre decimaler, som cellens link "open this run" giver Kshana Studio, så en celle viser præcis det, dens link gengiver. Middelværdien af forholdet mellem jammer og signal (J/S) for { "30" } celler flytter sig med { "0.1" } dB, op eller ned; ingen celles tracking-tilgængelighed ændres. Motoren giver identiske resultater for hver celle i { "0.28.0" } og { "0.29.0" }.

seg-146588a39e7c = <b>Seedet resampling i WebAssembly-pakken (WASM).</b> Browser-buildet trak andre bootstrap- og shuffle-indekser end det native build ud fra det samme seed (under Fixed). Intervallet <c1/> for arealet under kurven i browseren var <c2/> og er nu det native <c3/>. Intet nativt tal flytter sig.

seg-017810049453 = Tal trykt i dokumentationen

seg-85ab2a364a37 = Dokumentationen blev gennemgået ord for ord mod kørsler af denne udgivelses motor. Hvor et trykt tal ikke svarede til kørslen, blev dokumentet rettet, og hver rettelse er opført her, gammelt → nyt. I hvert tilfælde nedenfor ændrede motoroutputtet sig ikke; dokumentet havde misforstået det, afrundet det forkert eller overlevet det.

seg-1eacdefbfda2 = <b>Dokumentationsgennemgang af siderne om spektrum, konstellation, kampagne, animation, rapport og interoperabilitet samt en ny <c1/>.</b> Hvert tal blev kørt igen med denne motor. To offentliggjorte tal flytter sig: <c2/> angav testen af dækning med { "5" } 000 satellitter som "about { "0.13" } s in a debug build"; det kunne ikke gengives ({ "1.24" } s på en belastet bærbar), så siden angiver nu den andel af forfiltret, testen udskriver ({ "9.9" } % af { "19 440 000" } parvise tests), og release-binærfilens { "0.14" } s for den medfølgende <c3/>. Den samme side angav E3Fs krydsning som "off by { "0.050" } deg"; ingen test udskriver det tal, så siden angiver nu kun tærsklen på { "0.06" } deg, som testen håndhæver, og udledningen { "7.30" } mod { "7.36" } deg bag den. Intet motoroutput ændres.

seg-2ad182e2db15 = LEO-PNT-dokumenter: rettede offentliggjorte tal (kørt igen på denne udgivelses motor).

seg-6c2401365dd5 = <c1/> båndafvejning: den første ordens ionosfæriske forsinkelse for <c2/> er { "3.24" } m (var trykt som { "3.25" } m) og for <c3/> { "0.77" } m (var { "0.78" } m). <c4/> kodning og afkodning: den afkodede meddelelses SISRE var trykt som { "0.119" } cm, hvor kørslen gav { "0.122" } cm; siden angiver nu { "0.129" } cm, tallet efter rettelsen af platformsuafhængigheden under Fixed nedenfor. <c5/> LEO-mod-GNSS-passage: { "32" } dB mindre fritrumstab ved passagens top (var "{ "26" } to { "32" } dB"). For signal- og passagetallene ændrede motoroutputtet sig ikke; dokumenterne havde misforstået eller afrundet det forkert.

seg-fc3c8ba1b789 = <b>Vejledningerne, det gennemarbejdede pipeline-eksempel og kommandoen <c1/>, gennemgået mod denne udgivelses motor.</b> Rettelser af offentliggjorte tal, gammelt → nyt: de typer, der skriver <c2/>, er seks, ikke fire (<c3/> og <c4/> manglede; <c5/>, <c6/>); krydsningen for koldt atom ½bT² i vejledning { "3" } er { "18,443" } s, ikke { "18,440" } s; rundturfejlen for <c7/> i <c8/> er den målte { "4.88e-7" } km, ikke "~{ "1e-7" } km"; CSAC-holdover-båndet i vejledning { "2" } er de { "2000" }–{ "3200" } s, testen hævder, ikke "~{ "2600" }–{ "4400" } s"; vejledning { "1" } citerer SP3-rækkerne og geometriblokken med den præcision, motoren skriver dem med. Intet motoroutput ændrede sig.

seg-4c613cabb87b = Siderne om validering, kvante, SGP4, animation, påstande og integritet.

seg-c49d5cdb36e1 = <c1/>: den håndhævede grænse for den simulerede Allan-deviation på ét sekund for et ur med hvid frekvensstøj er { "20" } % (var trykt som { "25" } %; grænsen på { "25" } % er den, der gælder på kurven ved { "1" }, { "10" } og { "100" } s); rækken for hastighedens tilfældige gang angiver nu sin håndhævede grænse på { "20" } % ved siden af de omkring { "12" } %, der er observeret; og det chipskala-atomurs tilgængelighed i <c2/> er omkring { "0.73" } (var trykt som omkring { "0.83" }). <c3/>: den vibrationsbegrænsede støj pr. skud i sidens gennemarbejdede eksempel med koldt atom er omkring { "46" } gange dens skudstøjgulv (var "~{ "45" }×"; { "46.49" } genberegnet), og intervallet "{ "1" }–{ "50" } µg/√Hz" for udstyr i felten, som modsagde en enhed, siden selv citerer, er erstattet af de to citerede enheders offentliggjorte tal. <c4/>: den største positionsforskel er { "4.12" } mm (var "≈ { "4" } mm"), med satellitten angivet ved navn. <c5/>: videoindkoderens eksempel læste de { "24" } billeder i sekundet med { "12" }; det bruger nu { "24" }, den rate, billedmanifestet angiver. <c6/>: jamming-modellen har { "10" } tests (var { "8" }), og det koblede filters "{ "2.97" } m against { "48.8" } m" er erstattet af det, dets test hævder (den koblede positionsfejl under { "0.6" } gange den afkoblede og vinder i mindst { "90" } af { "100" } forsøg). <c7/>: stemplet "Today" læste { "v0.22.0" }; det nævner nu denne udgivelse, og to funktioner bygget siden (fejltilstanden for hele konstellationen og integritetsstøttemeddelelsen) forlader dens liste over huller.

seg-4fde8788f95f = <b>Scenarietypen <c1/>: en L-bånd-spektrummodel og et vandfald</b> (<c2/>, <c3/>, <c4/>). Hele GNSS-L-båndet som én effektspektraltæthed (PSD): GPS L1 grov/akvisitionskode (C/A) og L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (multiplekset binær offsetbærebølge, MBOC(6,1,1/11), eller BOC({ "1,1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), et kT-støjgulv med en modtagers støjtal samt jammere med kontinuert bølge (CW), smalbånd, chirp og matchet støj på en scriptet tidslinje. Hver jammer vurderes pr. bånd ud fra sin spektrale separationskoefficient (SSC), hvilket giver forholdet mellem jammer og signal (J/S) og den effektive bærebølge-til-støjtæthed (C/N0) pr. bånd pr. række. Diagrammet er et SVG-vandfald med C/N0-bjælker; result.json bærer gitteret blokmiddelværdiberegnet i effekt. Valgfri <c5/> tegner modellen som IQ-sampel, skriver og læser en optagelse i Signal Metadata Format (SigMF) (<c6/>, <c7/>) og sammenligner et Welch-estimat med modellen; valgfri <c8/> estimerer en rigtig SigMF-fil. Medfølgende eksempel <c9/>: en chirp tager L1 C/A og E1 ved { "10" } s, en CW-tone på L1-bærebølgen holder C/A på { "17.98" } dB-Hz, efter chirpen stopper, mens E1, hvis spektrum har et nulpunkt dér, kommer sig; L5 og E5a er urørte.

seg-fa9976349886 = Ny VALIDATED-række: signal-PSD'erne og SSC'erne, mod BPSK(n)-hovedloben på 2n x { "1.023" } MHz, BOC({ "1,1" })-lobernes centrering ved +/-1.023 MHz, de lukkede Parseval-former bag de offentliggjorte SSC'er på -61.8 / -64.8 / -67.8 dB/Hz og lærebogens Q = { "1" } (CW) og { "1.5" } (matchet). BOC({ "1,1" })-PSD'ens maksimum ligger ved +/-0.759 MHz, ikke ved lobens centrum; testen fastlåser begge dele.

seg-411431a9b26b = To nye MODELLED-rækker: vandfaldet og C/N0-tidslinjen, som reduceres nøjagtigt til kæden for typen <c1/> (krydskontrolleret i hver rapport), og SigMF-codec og Welch-estimatoren. Ingen optagelse fra tredjepart findes i repositoriet.

seg-5c5c695e7c0a = <c1/>: en MBOC-variant og <c2/>.

seg-bb346f4942a9 = Rapporten udskriver den C/N0, som den repræsentative Q-tabel for typen <c1/> ville give, ved siden af den spektrumafledte; for en CW-tone på C/A-bærebølgen afviger de med { "1.8" } dB. Tre nye matrixrækker: én valideret (signalspektre og spektrale separationskoefficienter) og to modellerede.

seg-673dfe048dad = <b>Efemeride for solsystemet og positionering omkring ethvert legeme.</b> To nye scenarietyper.

seg-3e1b0e8e99e9 = <c1/>: Solen, de otte planeter, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan ved én epoke: heliocentrisk position og hastighed i International Celestial Reference Frame (ICRF), gravitationsparameter, radier, J2 (den anden zonale harmoniske), hvor den er offentliggjort, siderisk rotation, polen og nulmeridianen fra Den Internationale Astronomiske Union (IAU), et banespor over én omdrejning samt lysrejsetid, envejs- og tovejsafstand, solens Shapiro-forsinkelse og solafstand fra et observatørlegeme og for ethvert ekstra link. Planeterne kommer fra Keplerelementerne fra Jet Propulsion Laboratory (JPL) af Standish og Williams (tabel { "1" }, { "1800" } AD til { "2050" } AD; tabel 2a/2b, { "3000" } BC til { "3000" } AD); månerne fra JPLs middelelementer med IAUs synkrone rotationsrate og Titan fra IAUs rotationsmodel. Eksempel: <c2/>.

seg-6a094973208b = <c1/>: en orbiter eller en lander på overfladen omkring et hvilket som helst af disse legemer, der navigerer med pseudoafstande fra en Walker-konstellation omkring legemet og en urfri tovejsafstand fra Jorden; præcisionsforringelse, formel usikkerhed og seedede mindste kvadraters positionsbestemmelser med og uden jordlinket. Eksempler: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> får Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto og de syv måner, et navneopslag og en fysisk post; <c2/> giver ethvert legeme i forhold til ethvert andet gennem den eksisterende søm <c3/>.

seg-8b5c2fbe91f7 = VALIDATED mod JPL Horizons (Development Ephemeris DE441; fixtures og forespørgsler i <c1/>): Merkur til Saturn og Jorden fra tabel { "1" } inden for to gange den angivne nominelle fejl (værst { "1.87" } gange), alle otte planeter fra tabel 2a/2b (værst { "1.71" } gange) samt lysrejsetiden fra Jorden til Mars og Jupiter. MODELLED: Uranus og Neptun fra tabel { "1" }, som overskrider den angivne fejl mod DE441 ({ "2.0" } og { "5.2" } gange), Pluto, månerne, legemekonstanterne og resultaterne for <c2/>.

seg-a3c83f6d2078 = Fund: Montenbruck & Gills månerække i <c1/> er allerede henført til J2000-jævndøgnet af sit eget præcessionsled ({ "0.05" } grader fra Horizons), så den bruges uden en yderligere præcessionsrotation. Seks nye matrixrækker: to validerede (planetpositioner, lysrejsetid) og fire modellerede.

seg-564133d6a0c4 = Konstellationer omkring ethvert legeme

seg-d1ddb76d8bf3 = <b>Konstellationsudformning i stor skala (typen <c1/>, <c2/>).</b> Walker delta- og Walker star-mønstre (T/P/F), eksplicitte elementlister og udformninger med flere skaller, flere konstellationer pr. kørsel, omkring Jorden, Månen, Mars eller enhver anden planet, Pluto eller en stor måne ud fra de legemekonstanter, som typen <c3/> tilføjede. Forudindstillinger ud fra offentliggjorte nominelle elementer: baseline og den udvidelige konstellation med 24 slots for Global Positioning System (GPS) (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, udgave { "1.1" }), BeiDou med mellemhøj jordbane Walker 24/3/1 samt geostationære og skråtstillede geosynkrone satellitter (Open Service Performance Standard { "3.0" }) og GLONASS 24/3/1 (Interface Control Document { "5.1" }). Dækning og præcisionsforringelse (DOP) over et bredde-/længdegrad-gitter: satellitter i sigte, GDOP, PDOP, HDOP og VDOP (geometrisk, position, horisontal, vertikal) og tilgængelighed pr. celle, globalt og på det værste sted, med ét modtagerur pr. konstellation. Et synlighedsforfilter (dækningshalvvinkel plus et breddegradsbånd under satellitten, nøjagtigt på et sfærisk legeme) kører { "5 000" } satellitter på et gitter på { "10" } deg på omkring { "0.13" } s i en debug-build.

seg-8f4ebd177f3d = VALIDATED: Walker-generatoren gengiver tabel { "23" } i Galileo OS SDD og slotformlen i GLONASS ICD; GPS-forudindstillingen gengiver SPS PS-kolonnen med ækvatorkrydsninger ({ "35" } af { "36" } steder inden for { "0.0108" } deg; E3F inden for { "0.06" } deg, idet tabellens egen række er inkonsistent); GPS-baselinens globale HDOP-fordeling matcher SPS PS appendiks B (median { "0.940" } mod { "0.94" }, { "95" } % { "1.255" } mod { "1.25" }, middelværdi { "0.965" } mod { "0.96" }; tærskel { "0.03" }).

seg-65658a896a73 = MODELLED: vilkårlige udformninger, andre legemer, BeiDou-fasen og knuderne for skråtstillet geosynkron bane, tolegemebaner med valgfri J2, kun geometri.

seg-3dfe470e8a5c = Scenarier: <c1/> ({ "102" } satellitter, tilgængelighed { "100" } %, median PDOP { "0.95" }, { "31.0" } i sigte over { "10" } deg), <c2/> ({ "5 000" } satellitter, tilgængelighed { "99.22" } % ved PDOP på { "3" } eller derunder over { "20" } deg, { "0" } % ved polarhætterne, forfilteret beholder { "11.5" } % af de parvise tests), <c3/> ({ "14" } satellitter omkring Månen, tilgængelighed { "21.33" } % samlet og højest over det sydpolare område). Alle tre er medfølgende til <c4/>. Noter: <c5/>. Tre nye matrixrækker: to validerede (Walker-generator og GNSS-forudindstillinger, GPS globalt DOP) og én modelleret.

seg-79e2d2c42166 = En kampagne drevet af spektrummodellen og konstellationer omkring ethvert legeme.

seg-4ab5f6f6bbbb = <c1/> kæder typen <c2/> sammen med et urs holdover og en integritetsovervågning (en chirp tager L1 C/A og E1; en CW-tone holder derefter C/A nede, mens E1 kommer sig, og modtageren falder tilbage til en himmel med kun Galileo), fastlåst mod det selvstændige vandfaldseksempel i <c3/>. <c4/> finder nu sit centrale legeme gennem <c5/>, så en konstellation kan lægges omkring enhver planet, Pluto eller en stor måne med de konstanter, typen <c6/> bruger.

seg-dc904f639fed = <b>Kampagner: mange scenarier sammensat til én kørsel.</b> En ny type <c1/> (<c2/>, dokumenteret i <c3/>) kører medlemmer af eksisterende typer gennem den samme afsendelse som kommandolinjen og læser tal ud af deres resultater. Fire sektioner, i enhver kombination:

seg-903ee141047a = <c1/>: en kædet mission på én tidslinje. Forudindstillinger for hver type læser urets tidsfejl mod dets grænse, det gennemsnitlige effektive forhold mellem bærebølge og støjtæthed (C/N0) mod tracking-gulvet, det lodrette beskyttelsesniveau mod alarmgrænsen, positionsfejl, satellitter i tracking og alarmflag, holdt på et fælles gitter med fasegrænser og hændelser. Tilstanden gives videre af <c2/>, <c3/> og <c4/>.

seg-4eeedde09a77 = <c1/>: en til tre punktnoterede nøgler af enhver type, eventuelt med et seedet ensemble i hver knude.

seg-4c113198cbb7 = <c1/>: realisering k ved basisseed + k, med middelværdi, spredning, percentiler og et bootstrap-konfidensinterval på { "95" } % med fast seed.

seg-df107253752d = <c1/>: delte værdier bundet ind i flere medlemmer, med en samlet bedste og værste oversigt. Hvert resultat bærer en kampagnehash og en digest over hvert medlems resultat. Fire medfølgende scenarier: <c2/> (nominel, jamming, spoofing, der slutter ved urovervågningens detektion efter { "370" } s, holdover, der bærer den spoofede forskydning på { "37.0" } ns, mens en inertienhed driver videre, en integritetsalarm, genopretning), <c3/>, <c4/> og <c5/>. <c6/> fastlåser sammensætningsidentiteterne: en kampagne med én fase gengiver den selvstændige kørsel bit for bit på tre typer, et ensemble med fast seed er byte-stabilt, og på et ur med hvid frekvensstøj ligger ensemblets middelværdi inden for det rapporterede interval, med spredningen inden for chi-i-anden-intervallet for sqrt(q_wf * tau) = { "16.459" } ns. Tre nye modellerede matrixrækker.

seg-c611ee59301a = Animation

seg-14b2d3cc9e7c = <b>Animationseksport (<c1/>, <c2/>, <a1><c3/></a1>).</b> Enhver kørsel, hvis resultat bærer en tidsserie, kan nu skrives som en animeret Scalable Vector Graphics-fil (SVG) (Cascading Style Sheets-keyframes, intet script: kurverne tegnes ind bag en bevægelig tidsmarkør), én selvstændig HyperText Markup Language-afspiller (HTML) (afspil og pause, scrub, hastighed, alle paneler på én synkroniseret markør, hændelsesmarkører, der søger ved klik; intet eksternt aktiv) eller en nummereret SVG-billedsekvens med et <c4/>, der angiver billeder pr. sekund, varighed og billedtider til en videoindkoder. En kampagne afspilles som sine faser med sine alarmer markeret; en spektrumkørsel animerer sit vandfald række for række. Afspilleren følger <c5/>, og under <c6/> viser både SVG-filen og afspilleren det færdige billede i stedet for at bevæge sig. <c7/> og <c8/> styrer afspilningen; <c9/> og <c10/> er bibliotekets indgangspunkter, og <c11/> får kun en blok <c12/>, når <c13/> kører. Outputtet er en ren funktion af resultatet og tilvalgene, byte-identisk ved en ny kørsel og uden tidsstempel. En type uden en samplet tidsakse afvises med "no time series to animate", og intet skrives. Eksportøren tegner kørslens egne sampel og tilføjer intet tal, så den er MODELLED (intern konsistens) og bærer ingen række i verifikationsmatrixen; intet offentliggjort tal ændres. Tests: <c14/> (determinisme, antal billeder, ingen ekstern adresse, velformet XML, stien for reduceret bevægelse, og hvert medfølgende scenarie med en tidsserie animerer).

seg-c01b78b64065 = Rapporter

seg-2662fdb991f3 = <b>Avancerede kørselsrapporter (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Hver kørsel i kommandolinjegrænsefladen (CLI) skriver nu <c2/>, en udskrivbar HyperText Markup Language-rapport (HTML), og <c3/>, det samme indhold som et maskinlæsbart JavaScript Object Notation-dokument (JSON). Sektioner: et resumé til ledelsen; hvert scenarieinput med sin enhed, læst fra feltenhedsskemaet (resultatets blok <c4/>), ellers fra feltnavnets suffiks, ellers angivet som ikke angivet; resultaterne med kørslens diagram, hver skalar og en oversigt over hver numerisk kolonne; for en kampagne sweepets knudetabel, Monte Carlo-middelværdien, standardafvigelsen, 5., 50. og 95. percentil og bootstrap-konfidensintervallet med et histogram pr. måltal, kædens fasetabel eller sammensætningens medlemmer og samlede oversigt (og gitteret for en kørsel af <c5/> eller <c6/>); en hændelsestidslinje; mærkatet VALIDATED / MODELLED / PARTNER, den uafhængige reference og testevidensen for hver række i verifikationsmatrixen, som kørslens typer berører, læst fra matrixen gennem en krydsreference fra type til række (en række, der bedømmer én inputsti, for eksempel Simplified General Perturbations { "4" }-stien (SGP4) for <c7/> eller sporet med målt registrering for <c8/>, vises kun, når kørslen tog den sti, og rækken for Shuttle Radar Topography Mission-læseren (SRTM) vises for ingen type, da intet scenariefelt læser en SRTM-flise); udsagnene om det, der ikke er modelleret, og antagelserne, hver citeret med sin kilde; og en gengivelsesregistrering (motorversion, kildecommit, når buildet sætter <c9/>, Secure Hash Algorithm 256-bit-digests (SHA-256) af scenariefilen og resultatdokumentet, seed, platform og den præcise kommando). Rapporten læser intet ur: samme scenarie, seed og motorbuild giver en byte-identisk rapport, og det eneste tidsstempel, den kan vise, er det, <c10/> allerede skriver. Et udskriftsstilark passer til A4 og US Letter, gentager tabeloverskrifter og holder rækker og figurer hele hen over sider; en Portable Document Format-fil (PDF) laves med browserens "Save as PDF". Der er intet tilvalg <c11/>, fordi det ville kræve en ny, tung afhængighed at tegne diagrammerne ind i en PDF. Tests: <c12/> rapporterer hvert medfølgende scenarie (ingen tom sektion, ingen pladsholdertekst, mærkater lig matrixen, scenariedigesten lig filens, byte-identisk ved en ny kørsel) og <c13/> kører den registrerede kommando igen i en frisk mappe og kræver en byte-identisk <c14/>. Intet offentliggjort tal ændres, og antallene af typer, scenariefiler og matrixrækker er uændrede.

seg-ce45e75c6d67 = <b>Rapporten, animationen og eksporterne virker sammen.</b> Den avancerede rapport får en sektion "Animation and exports": kørslens animerede tegning indlejret som et inaktivt billede (eller grunden til, at der ikke er nogen), links til animations- og eksportfilerne skrevet ved siden af og hvert interoperabilitetsformat med, om det gælder, hvorfor ikke, og dets specifikation; <c1/> bærer den samme blok <c2/>. HTML-animationsafspilleren viser de eksportfiler, der er skrevet ved siden af den. Kommandolinjegrænsefladen (CLI) laver nu eksporterne, før den skriver rapporten, så begge kan nævne filerne.

seg-c60dc5b92a60 = Interoperabilitetseksporter

seg-5bfce52c5a13 = Interoperabilitetseksporter og -importer (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> skriver scenariets geometri som CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, en standard fra Open Geospatial Consortium, med tidsmærkede spor af typen <c2/>), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) og Ansys STK-efemerider (Systems Tool Kit) <c3/> (<c4/>, meter, én fil pr. bevægeligt objekt) samt det syntetiserede IQ-øjebliksbillede (i fase og kvadratur) fra typen <c5/> som et SigMF-par (Signal Metadata Format) gennem den eksisterende <c6/>. <c7/> skriver hvert format, der gælder, og udskriver, hvorfor de andre ikke gør; <c8/> rapporterer uden at køre. Bevægelige objekter skrives i Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) og jordfast WGS { "84" } (World Geodetic System { "1984" }) længdegrad, breddegrad og højde (KML, GeoJSON); faste steder i CZML er <c11/>. Typen <c12/> tilføjer to jammer-fodaftryk ud fra sine egne linkligninger. <c13/> skriver en GeoJSON-<c14/> ind i sporinputtene for <c15/>, <c16/>, <c17/> og <c18/>. Eksporter er byte-deterministiske og bærer intet tidsstempel. <c19/> validerer hver eksport mod dens offentliggjorte specifikation, sammenligner eksporterede satellittilstande med motorens egne til { "1" } mm og kører hvert medfølgende scenarie gennem hvert format, som enten eksporterer eller angiver hvorfor ikke (tabellen i docs/INTEROP.md). Intet offentliggjort tal ændres: IQ-syntesen i typen <c20/> er flyttet ind i én delt funktion, og dens resultatdokument er byte-identisk, og <c21/> får <c22/> og <c23/>, som bruges af dens egen kørsel. Antallene af typer, scenariefiler og verifikationsmatrixrækker er uændrede. Et bane- eller integritetsscenarie uden <c24/> dateres ud fra sine satellitters egne data: <c25/> er den tidligste epoke for TLE (tolinjers elementsæt), broadcast-efemeride eller SP3 (Standard Product { "3" }), og hver sådan satellit roteres ind i GCRS- og jordfaste rammer på sit eget tidspunkt; 2000-01-01T00:{ "00" }:00Z bruges kun, når ingen satellit bærer en epoke. SP3- og OEM-eksporterne (Orbit Ephemeris Message) beholder deres mærkat 2000-01-01. For at understøtte det er <c26/>, <c27/> og <c28/> tilføjet; intet, der fandtes, læser dem.

seg-12c151a800f9 = Navigation fra lav jordbane: signal

seg-9b665682695a = <b>LEO-PNT-signaludformninger og et multibåndsspektrum.</b> En ny type <c1/> og en type <c2/>, der rækker ud over L-båndet: én type, fire scenariefiler (tre medfølgende; filen Celeste IOD findes kun i repositoriet) og fire matrixrækker (to VALIDATED, to MODELLED).

seg-b355b28bfd1b = <c1/>: parametriserede signaludformninger til positionering, navigation og tidssynkronisering (PNT) fra lav jordbane (LEO) for ethvert system (bånd, sendebåndbredde, ITU-tildeling; akvisitions-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flade spektre, effektandele, FDMA-underbærebølger, kodelængder og datarater), fra indkompilerede offentlige forudindstillingsfiler under <c2/> (Xona Pulsar X1/X5, Iridium STL, et Starlink-opportunitetssignal, CentiSpace, en repræsentativ C-bånd-udformning og repræsentative UHF/L/S/C/bred-C-udformninger, hver med sin kilde-URL) eller skrevet inline. Pr. signal: den båndbegrænsede PSD og effektandelene i båndet, Gabor-båndbredde, båndbegrænset early-late-kodetrackingjitter mod C/N0 og afstand (Betz & Kolodziejski { "2009" }) og afstandsnøjagtigheden, akvisitionssøgerummet, detektionssandsynlighed og middeltid for seriel og kodeparallel akvisition, SSC ind i og fra GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og AltBOC med C/N0-tabet, CW-, bredbånds- og matchet J/S-tolerance fra spektrumtypens SSC-kode, en båndafvejning (ionosfærisk forsinkelse, fritrumstab, afstandsbestemmelse ved lige C/N0 og lige EIRP, jammertolerance) og valgfrie formkontroller mod en beskrevet måling. Eksempler: <c3/>, <c4/>, <c5/> (de Celeste IOD-bånd og den signalkonfiguration, der blev præsenteret på ESA NAVISP LEO-PNT-workshoppen, { "2026" }; holdt tilbage sammen med forudindstillingen Celeste IOD, se "LEO-PNT end to end" nedenfor). Noter i <c6/>.

seg-8f58debf721f = <c1/>: bånd kan nu være en forudindstillet signaludformning (hver komponent tegnet, båndbegrænset, med C/N0 og J/S henført til den trackede komponent) eller en brugerdefineret bærebølge og modulation; <c2/> tilføjer vandfald over andre frekvensområder på én tidslinje; en jammer af typen <c3/> (barrage) slutter sig til de fire bølgeformer. Rapporten tilføjer <c4/>, <c5/> og <c6/> samt én post <c7/>. Almindelige bånd giver de samme tal som før. Eksempel: <c8/>.

seg-98f74d85c54b = <c1/> får sinusintegralet, de lukkede former for BPSK-effekt i båndet og båndbegrænset Gabor-båndbredde, den båndbegrænsede early-late-jitter for ethvert spektrum og dens Gabor-grænse, den lukkede form for SSC for offset-BPSK, Galileo E5 AltBOC({ "15,10" })-spektret og en parser for modulationsmærkater; <c2/> udskriver BPSK(1/3) som en brøk.

seg-78d9e5e2c615 = Fire matrixrækker: VALIDATED båndbegrænsede lukkede former ({ "90.3" } % af BPSK-effekten i hovedloben, jitteren, der reduceres til Kaplan & Hegartys koherente form, { "0.0039564" } chips ved { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, og til sin Gabor-grænse, og BPSK-selv-SSC'en 2/({ "3" } R_c); den lukkede Gabor-form og offset-SSC'en mod sin Parseval-form er angivet som interne krydskontroller); VALIDATED maksimal LEO-Doppler (Xona X1 { "33.2" } kHz inden for de offentliggjorte { "32" } til { "34" } kHz, Iridium inden for { "0.5" } kHz af { "36" } kHz); MODELLED <c1/>; MODELLED multibåndsspektrum.

seg-45d3d4a46d6b = Navigation fra lav jordbane: link

seg-1d120db87aae = <b>LEO-PNT-passage og linkbudget pr. bånd: typen <c1/>.</b> LEO-PNT er positionering, navigation og tidssynkronisering fra satellitter i lav jordbane (LEO). En bruger (på jorden, til søs, i luften eller indendørs, stillestående eller i bevægelse) og én eller flere LEO-satellitter fra en udformet passage, eksplicitte elementer, et tolinjers elementsæt (TLE) gennem SGP4 eller en Walker-konstellation fra koden <c2/>. Pr. satellit, bånd og epoke: pejlevinkler, afstand, lukket form for afstandsrate og afstandsacceleration (kontrolleret ved hver kørsel mod centrale differenser), Doppler og Doppler-rate, fritrumstab, EIRP (ækvivalent isotropisk udstrålet effekt) med et isoflux-, gaussisk strålings- eller fladt satellitmønster, en patch-brugerantenne, gasdæmpning efter ITU-R P.676, regndæmpning efter ITU-R P.838/P.618, troposfærisk scintillation efter P.618, indtrængningstab i bygninger efter ITU-R P.2109 for en indendørs bruger, polarisationsfejltilpasning, systemstøjtemperatur og C/N0 (forhold mellem bærebølge og støjtæthed); den første ordens ionosfæriske forsinkelse pr. bånd ud fra en skrå TEC (samlet elektronindhold) efter Klobuchar eller lodret TEC under satellitten samt ionosfærefri båndpar med deres støjforstærkning. Galileo- eller GPS-satellitter vurderes med den samme modtager ud fra deres modtagne effekter i grænsefladedokumenterne, så den klokkeformede LEO-passage og de flade MEO-bærebølger (mellemhøj jordbane) deler ét plot. En sektion <c3/> giver tid til første positionsbestemmelse, energi pr. positionsbestemmelse og batterilevetid mod driftscyklus (MODELLED).

seg-17f3503e1be3 = Systemagnostisk: motoren kræver ingen forudindstilling. Valgfri forudindstillinger, hver i sin egen fil og mærket PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP: generisk multibånd (UHF, L, S, C), generisk C-bånd, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink som et opportunitetssignal kun med Doppler, CentiSpace og Celeste IOD (demonstration i kredsløb), hvis signalparametre blev præsenteret på ESA NAVISP LEO-PNT-workshoppen, { "2026" }, og som ligger i <c1/>, så de kan holdes tilbage (se "LEO-PNT end to end" nedenfor).

seg-a338cc46a1e0 = Offentlige byggeklodser i <c1/> (geometry, antenna, itu, iono, energy, presets), som andre moduler kan kalde.

seg-887ad03cb6f6 = Scenarier: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-a20f1602c236 = Ni matrixrækker. VALIDATED ({ "6" }): koefficienterne i ITU-R P.838-3 mod dens tabel { "5" }; regndæmpning og scintillation efter P.618-14 mod valideringseksemplerne fra ITU-R Study Group { "3" }; indtrængningstab i bygninger efter P.2109 mod regnearket fra Study Group { "3" }; første ordens ionosfærisk skalering mod gruppeforsinkelsesforholdet i IS-GPS-200 sammen med fritrumstabet; den maksimale Doppler for en stillestående bruger i en cirkulær bane mod arXiv { "2509.19551" } tabel { "1" }. MODELLED ({ "3" }): passagen og linkbudgettet, forudindstillingerne og budgettet for positionsbestemmelse med lavt energiforbrug. Én type og seks scenariefiler. Noter i <c1/>.

seg-ef74b0f08aa1 = Navigation fra lav jordbane: navigationsmeddelelse

seg-866ff4ee8b19 = <b>LEO-navigationsmeddelelse (typen <c1/>, <c2/>).</b> Broadcast-efemeride- og urmeddelelsen fra en satellit til positionering, navigation og tidssynkronisering (PNT) i lav jordbane (LEO), for enhver bane, bærebølge og model; navngivne forudindstillinger er valgfri data, og hver funktion kører uden dem. Én type, fem scenariefiler og ni matrixrækker (tre VALIDATED, seks MODELLED). Se <c3/>.

seg-c42821b6e855 = Meddelelsesindhold: SVID, dataudgave, bånd og signalsundhed; uge, ugetid og et andengrads urpolynomium; efemeriden i en af fire modeller — Galileo OS SIS ICD's Kepler-sæt med 16 parametre, det sæt plus korrektionspolynomier langs sporet, på tværs af sporet og radialt, modellen med 22 parametre fra Liu et al. { "2025" } (doi 10.3390/rs17162894) eller ATOMIC's ECEF-polynomium med nul ur — og et Klobuchar-sæt, NeQuick-G-koefficienter med det effektive ionisationsniveau samt parametre for systemtid til UTC med ICD'ens skudsekundtilfælde.

seg-e4565696f162 = Tilpasning: en sand bane integreret med zonal J2–J6 eller EGM2008-tyngdekraft og atmosfærisk modstand, et seedet frit eller styret ur, en Levenberg–Marquardt-tilpasning på ikke-singulære elementer, derefter lineære mindste kvadraters korrektionspolynomier og et ur tilpasset netto af brugerens relativistiske led.

seg-a7287b7b336c = Fire analyser og scenarier: <c1/> (afstandsfejl for signal i rummet (SISRE) mod tilpasningsinterval og opdateringsperiode), <c2/> (fire modeller, bits og Kshanas tilpasning med 22 parametre i Liu et al.-højderne ved siden af de offentliggjorte tal, MODELLED), <c3/> (kontinuitet ved hvert meddelelsesskift i en passage) og <c4/> (Kshanas egen dokumenterede binære frame med CRC-24Q og et kvantiseringsbudget, en blok i RINEX-4-stil mærket som en Kshana-udvidelse og en CSV-tabel).

seg-e272dce3d10f = VALIDATED: de globalt gennemsnitlige SISRE-vægte mod den offentliggjorte tabel for mellemhøj og geostationær bane fra Montenbruck et al. { "2018" }; Galileo-brugeralgoritmen mod RTKLIB på fire rigtige Galileo-broadcast-efemerider (<c1/>); CRC-24Q mod katalogets kontrolværdi og RTCM { "10403" } { "1005" }-eksempelframen.

seg-5c8592195b0d = Forudindstillinger, én fil hver med kilder: Xona Pulsar og Pulsar-0, Iridium, Starlink, CentiSpace, et repræsentativt C-bånd-system, ATOMIC og Celeste IOD (den eneste forudindstilling, der bruger materiale præsenteret på ESA NAVISP LEO-PNT-workshoppen, { "2026" }, opbevaret i <c1/> sammen med sine scenarier, så den kan holdes tilbage).

seg-9fb0cbf29cef = Navigation fra lav jordbane: fusion

seg-071f4db017c5 = <b>Fusioneret MEO + LEO-positionering, -navigation og -tidssynkronisering: <c1/>, <c2/> og <c3/>.</b> Tre nye scenarietyper i <c4/>, systemagnostiske: hver konstellation er Walker-skaller, elementsæt eller en GNSS-forudindstilling, hvert signal en bærebølge, en chiprate og en C/N0-envelope (forhold mellem bærebølge og støjtæthed), hvert fejlbudget en eksplicit énsigma, og navngivne systemer i lav jordbane (LEO) er valgfri forudindstillinger, én fil hver med deres kilder markeret som offentlig, workshop eller afledt (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlink-opportunitetssignaler, CentiSpace, et repræsentativt C-bånd-system, ATOMIC-efemeridemodellen med nul ur og én forudindstilling for ESA Celeste-demonstrationen i kredsløb, hvis parametre afledt fra workshoppen ligger i <c5/>, så de kan holdes tilbage).

seg-f28f7a441263 = <c1/> har fire tilstande: Doppler-positionering (batch mindste kvadrater på afstandsrate med tilstande for urdrift og hastighed, en tilstand med opportunitetssignaler kun med Doppler, nøjagtigheden langs og på tværs af sporet i én passage samt Doppler-, Doppler-rate- og jerk-envelopen); fælles GNSS + LEO vægtede mindste kvadrater med ét ur pr. system (intersystembiasen) eller en kendt forskydning, sigma pr. måling som input og DOP mod antallet af LEO-satellitter; polar og arktisk dækning mod breddegrad; og LEO-tidsoverførsel til Coordinated Universal Time (UTC) mod C/N0 og modtagerens oscillator med udtrykket for systemtid til UTC i IS-GPS-200.

seg-57afa384aabd = <c1/>: et flydende præcist punktpositionerings-udvidet Kalman-filter (PPP) på ionosfærefri kode og fase, kun med GNSS og med LEO-supplering, med dets konvergenstid og en Monte Carlo-konsistenstest med NEES (normaliseret estimationsfejl i anden potens). Det medfølgende scenarie giver { "7.4" } min med fire MEO-systemer og { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter, ved siden af de { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min fra Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) som en MODELLED sammenligning af tendensen.

seg-3fa0556b3737 = <c1/>: 5G-positionering i ikke-terrestriske net (NTN) i 3GPP n256 mobil-satellit-S-båndet ud fra Cramér-Rao-grænsen for ankomsttid og Doppler.

seg-a0cc2699e276 = Scenarier: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (medfølgende) og <c8/> (kun i repositoriet, holdt tilbage sammen med forudindstillingen Celeste IOD).

seg-c0b6b98eeac3 = Otte matrixrækker: LEO-Doppler-envelopen VALIDATED mod de offentliggjorte tal for Iridium (±{ "36" } kHz: { "35.9" } kHz, inden for { "5" }%) og Xona Pulsar X1 ({ "32" } til { "34" } kHz: { "33.6" } kHz fra skallen på { "97" } deg, uden udvidelse) (<c1/>); Doppler-positionering, fælles pseudoafstandspositionering, PPP-konvergens, NTN-grænser, LEO-tidssynkronisering, polardækning og forudindstillingerne MODELLED. Tre typer og otte scenariefiler. Dokumentation: <c2/>.

seg-173793480abc = <b>LEO-PNT fra ende til anden: typen <c1/> og LEO-trinnene koblet sammen.</b> Ét positionerings-, navigations- og tidssynkroniseringssystem (PNT) i lav jordbane (LEO) fulgt fra sin signaludformning til brugerens position, hvert trin motorens egen type på sin egen scenarietabel, med værdier givet videre i kode (<a1><c2/></a1>):

seg-41a4a2183ba3 = <c1/>-bånd kan nævne en udformning af typen <c2/> (<c3/>): båndet tager udformningens centrum, sendebåndbredde og chiprate for den trackede komponent, fordeler sin EIRP (ækvivalent isotropisk udstrålet effekt) over udformningens komponenter og rapporterer hver epokes C/N0 (forhold mellem bærebølge og støjtæthed) for den trackede komponent og båndbegrænsede kodetrackingjitter (afstandsfejlen; parstøjen for <c4/> bruger den også). Et bånd uden en udformning giver det samme output som før.

seg-a076a43a9d44 = <c1/> kører signal -> passage -> navigationsmeddelelse -> fusioneret fælles positionsbestemmelse med <c2/> -> valgfri <c3/>. Hvert LEO-system i positioneringstrinnet, der lader dem være usat, får en C/N0-linje i sin(elevation) tilpasset passagen, meddelelsens afstandsfejl for signal i rummet (SISRE: dens repræsentationsfejl i banen for passagens satellit, med et angivet led <c4/> for banebestemmelse i kvadratsum), og udformningens bærebølge og chiprate; PPP-tilfældene tager SISRE. Hver overdragelse er opført med sin værdi og enhed, og <c5/> kontrollerer, at hver er lig upstream-outputtet, og at ændringer upstream flytter tallene downstream. <c6/> er det nye indgangspunkt for meddelelsen.

seg-8c256ed478e9 = Scenarier: <c1/> (en generisk konstellation på { "1080" } km og det repræsentative signal <c2/>), <c3/> (det offentlige X5-signal), begge medfølgende, og det valgfri <c4/>, der kun findes i repositoriet.

seg-879259c7ff86 = Forudindstillingerne Celeste IOD (demonstration i kredsløb) for områderne passage, meddelelse og fusioneret positionering ligger nu i én fil, <c1/>, som <c2/> kun kompilerer ind, når den findes (konfigurationsflaget <c3/>). Dens fem scenarier (<c4/>) findes kun i repositoriet, så sletning af den fil og de scenarier holder hvert tal tilbage, der blev præsenteret på ESA NAVISP LEO-PNT-workshoppen, { "2026" }, uden en kildeændring; <c5/> kontrollerer, hvilke filer der må nævne forudindstillingen eller bære dens tal for båndplanen.

seg-110b1f7c7c63 = Hver LEO-type i den avancerede rapports krydsreference, med sine stispecifikke rækker opført kun, når kørslen tog den sti (en regnrate, en bygning, en analyse eller tilstand, der kørte). <c1/>-Doppler-vinduerne får <c2/> og <c3/>-tilfældene får <c4/>, så begge animerer; <c5/> og <c6/> eksporterer CZML-, KML-, GeoJSON- og STK-efemerider, og de andre LEO-typer angiver, hvorfor et format ikke gælder.

seg-1419edea5329 = Navigation fra lav jordbane: modstandsdygtighed, fokusområder og slutbrugerscenarier

seg-d084d86044b4 = <b>LEO-PNT-modstandsdygtighed, ét scenarie pr. eksperimentfokusområde og ét pr. slutbrugervertikal samt <c1/> som oversigt over hver LEO-type og hvert LEO-scenarie.</b> Hvert scenarie kører uden nogen Celeste-data og er medfølgende.

seg-07e91f076ab2 = <c1/> får en sektion <c2/>: en spoofer forfalsker, selvkonsistent i afstand og afstandsrate, signalerne for en påstået position, der springer og/eller skubbes væk fra den sande efter et indsættelsestidspunkt (pr. LEO-bånd og MEO-GNSS-signalet), med eller uden ionosfæren. To overvågninger kører ved en angivet sandsynlighed for falsk alarm: konsistens mellem Doppler og passagegeometri (målte afstandsrater mod dem, der er forudsagt ud fra banerne og en uafhængig forudgående position og hastighed; en generaliseret mindste kvadraters chi-i-anden over et vindue, på GNSS-, LEO- og alle kanaler, støj i frekvenslåsesløjfen ud fra C/N0) og konsistens mellem bånd (trinnet i hvert LEO-båndpars modelkorrigerede geometrifri kombination). Resultatet giver statistikkerne pr. epoke (så det animerer), hvert par og hvornår hver overvågning detekterer. Byggeklodser i <c3/>. Ingen sektion, uændret output.

seg-6a7852f1f053 = Hvert båndpar for <c1/> rapporterer også det skrå samlede elektronindhold (TEC), som dets geometrifri kombination gendanner ved passagens top, og den estimerede kodestøjs sigma (ionosfæresondering). Det tilføjer to felter til hvert multibåndsresultat for <c2/>; intet eksisterende tal ændres.

seg-bdf333f4c978 = Tidssynkroniseringstilstanden i <c1/> tager <c2/>: hver række rapporterer da sin tidsfejl og forudsagte sigma ved hver epoke, med de samme træk, så rækkestatistikkerne er uændrede, og kørslen animerer og kædes i en kampagne.

seg-eb4461740dc5 = En kampagne eksporterer nu hvert medlemsscenarie, der har geometri (faseundersøgelser, sweepet og Monte Carlo-basisscenarierne, sammensatte medlemmer med deres delte værdier bundet), som sit eget filsæt, med medlemsmærkatet i filnavnet; før eksporterede en kampagne intet. Interoperabilitetstabellen i <c1/> ændres tilsvarende.

seg-c0b1f4d9fed0 = En kampagnes sweepnøgle kan indeksere et array af tabeller efter position (<c1/>).

seg-4c995017dd9c = Scenarier for modstandsdygtighed: <c1/> (en barrage på { "50" } MHz i L5-båndet sweepet i effekt: hvert L-bånd-signal falder, mens LEO-signalerne i UHF-, S- og C-båndet beholder deres C/N0), <c2/> (J/S-margin ud fra modtaget effekt: GPS L5, Galileo E5a og Xona X5 tabt ved -105, -100 og -95 dBW, mens et generisk LEO-signal på -135 dBW stadig tracker ved -90 dBW), <c3/> (et spring på { "30" } m, som Doppler-testen kun med GNSS misser, og som testen på alle kanaler detekterer { "105" } s efter indsættelsen), <c4/> (fire spoofere mod begge overvågninger) og <c5/> (GNSS jammet, LEO-laget i S- og C-båndet trackes, modtagerautonom integritetsovervågning på LEO-laget alene alarmerer ved { "2" } af { "30" } epoker).

seg-bae66dac04cc = Scenarier for fokusområder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (modstandsdygtighed i L, S og C er <c8/>).

seg-c7947d9cc592 = Vertikale kampagner, hver animeret og eksporterende sine LEO-passager: <c1/>, <c2/> (de medfølgende scenarier til søs og på skinner plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Resultater på én linje i <c7/>.

seg-222ad0b777f8 = Tre MODELLED matrixrækker: overvågningen af spoofing med Doppler og passagegeometri, overvågningen af spoofing mellem bånd og ionosfæresondering. <c1/> kontrollerer overvågningerne (tavse før indsættelsen, Doppler-statistikken kvadratisk i et spring, det ionosfæriske trin for en jordspoofer og intet fra en ionosfærebevidst), sonderingsidentiteten, tidssynkroniseringssporet mod rækkestatistikkerne og at en kampagnes eksport er lig hvert medlems egen.

seg-f650b42bf210 = Siden <c1/> flyttes til <c2/>; <c3/> er oversigten.

seg-00a4ba834f37 = <b>Scenarier til søs, på vej og på skinner.</b> Fem medfølgende eksempler på eksisterende typer, så skibe, køretøjer på vej og tog hver har et gennemarbejdet tilfælde. Hvert tal er MODELLED; intet er valideret mod måledata.

seg-682414bbe0c6 = <c1/> (<c2/>): en bredbåndsjammer på { "50" } W på en mast på { "30" } m, { "30" } km væk over åbent vand fra et skib. Gennemsnitligt forhold mellem jammer og signal (J/S) omkring { "48" } dB, og tilgængeligheden falder fra { "1.00" } til { "0.00" }.

seg-4666dcd72c24 = <c1/> (<c2/>): et inertinavigationssystem (INS) af navigationsklasse ved { "12" } knob med GNSS tabt og uden støtte. Det krydser { "10" } m efter { "281" } s og { "100" } m efter { "833" } s, tallene for havneindsejling og åbent hav i resolution A.1046({ "27" }) fra Den Internationale Søfartsorganisation (IMO), brugt her som budgetter.

seg-7407bb97aedd = <c1/> (<c2/>): en spoofer på +{ "2" } dB, ikke afstemt med bærebølgen, der skubber fire satellitter for at trække et skib { "500" } m. Den fusionerede overvågning detekterer den (score { "0.70" } mod en tærskel på { "0.50" }) på modtagerautonom integritetsovervågning (RAIM) og overvågning af signalkvalitet (SQM); effektovervågning alene misser den.

seg-1edc0541930b = <c1/> (<c2/>): en bil gennem en underføring på { "15" } s og et udfald på { "60" } s fra en jammer ved vejkanten mod et budget på { "1.5" } m for en halv vognbane. Den fusionerede RMS-fejl (kvadratisk middelværdi) under udfaldet er { "1.9" } m for en MEMS-enhed (mikroelektromekanisk system) i bilklasse og { "0.7" } m for en sammenligningsenhed af taktisk klasse; frit løbende driver MEMS-enheden til { "850.8" } m.

seg-f9830a49659f = <c1/> (<c2/>): et INS af taktisk klasse på et tog ved { "160" } km/h i en tunnel. Det krydser { "2" } m (sporadskillelse) efter { "35.8" } s, cirka { "1.6" } km inde, og { "20" } m efter { "107.3" } s. Dette er kun INS: motoren har ingen odometermodel, så det er den pessimistiske grænse. Antallet af scenariefiler i README flytter sig fra { "77" } til { "82" }. Alle fem er medfølgende til <c3/> og opført i browserens playground.

seg-77c8c53126fd = Model Context Protocol-server

seg-2deb4b35b41a = Serveren Model Context Protocol (MCP) når hver type og hver visning af en kørsel: syv nye værktøjer, fjorten i alt.

seg-7f4035dfd9db = <c1/> afsendte allerede hver type; det, en agent manglede, var en vej til et gyldigt scenarie af en type og de tre outputs, kommandolinjen skriver ved siden af et resultat. Nye værktøjer:

seg-d9df5ab8817a = <c1/> og <c2/> leverer de medfølgende referencescenarier (tabellen <c3/>), hver med sin type og første sætning i sin egen overskrift, byte for byte filen under <c4/>. Et scenarie, der ligger i repositoriet, men ikke er medfølgende, afvises med grunden. Hver type undtagen <c5/> (hvis dataudsnit kun følger med repositoriet) har mindst ét eksempel.

seg-cb24ad7147ef = <c1/> returnerer kørslens rapport som JSON (JavaScript Object Notation) eller som den udskrivbare HTML-side (HyperText Markup Language) (<c2/>).

seg-9264b2f20e15 = <c1/> returnerer kørslens tidsserie som en animeret SVG-tegning (Scalable Vector Graphics), en HTML-afspiller eller nummererede billeder efter et JSON-resumé af det, der blev tegnet (<c2/>). Et svar bærer højst { "120" } billeder; kommandolinjen skriver enhver længde.

seg-959f23871238 = <c1/>, <c2/> og <c3/> leverer interoperabilitetseksporterne og GeoJSON-ruteimporten (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeridefilen (Systems Tool Kit) <c5/> og SigMF (Signal Metadata Format), med et JSON-indeks over filerne (suffiks, størrelse og SHA-256, 256-bit-digesten fra Secure Hash Algorithm) og den binære SigMF-samplefil som base64.

seg-9ec3f9639b8c = Biblioteket får en funktion <c1/>, der som standard er slået fra, og som eksponerer tabellen med referencescenarier som <c2/>; kun MCP-serveren slår den til, så Python-wheelen og WebAssembly-modulet stadig ikke bærer scenarieteksten. Studiesuiter (<c3/>) forbliver kun i kommandolinjen, fordi en suite navngiver filer på disken, og serveren læser ingen. Rundturstestene kører hvert nyt værktøj mod medfølgende scenarier og kontrollerer motorens tal: spektrum, solsystemet, konstellationer omkring Månen og Europa, et kampagnesweep og typerne for signal, passage, navigationsmeddelelse, fusioneret positionering, præcis punktpositionering, ikke-terrestriske net og fra ende til anden i lav jordbane (LEO). Hver flade, der angiver antallet af MCP-værktøjer eller opregner værktøjerne, siger nu fjorten, undtagen playground-siden under <c4/>, som erstattes med webstedet.

seg-c11823028688 = kshana.dev, Kshana Studio og README

seg-fb584cf84218 = <b>En gentegnet kshana.dev.</b> Den enkelte playground-side er erstattet af et websted med flere sider: Forside, Missioner, Funktioner, Evidens, Udviklere, Udgaver og Dokumentation, med Kshana Studio ét klik væk. Hvert diagram, kort og tal på det er en optaget kørsel af denne udgivelses motor, med scenariet og et link, der genåbner den samme kørsel i Studio; webstedets build afviser en optagelse lavet af en anden motorcommit. Dokumentationssiderne genereres ud fra repositoriets <c1/> og installationsmulighederne ud fra dets kanaler. Skrifttyper og scriptbiblioteker leveres fra kshana.dev selv, så ingen side beder om noget fra en tredjepartsvært. Gamle adresser (<c2/>, <c3/>, delingslinks af typen <c4/>, indlejringslinks af typen <c5/> og resten) omdirigerer til deres nye sted, og en ukendt adresse får en { "404" }-side.

seg-9fa1c542332b = <b>Kshana Studio, et dashboard for hver funktion.</b> Studio åbner på en startskærm med domænefliser og gode første kørsler og fører derefter en kørsel gennem fem nummererede trin: Vælg et scenarie, Sæt dets parametre, Kør motoren lokalt i browseren, Læs resultaterne (nøgletal først, hvert med en PASS- eller FAIL-chip, hvor kørslen angiver en tærskel, derefter panelerne) og Del eller eksporter. Én søgeboks finder scenarier, domæner og felterne i dem og hopper til kontrollen; kørsler kan fastgøres og sammenlignes; en brødkrumme siger, hvor du er; på en telefon bliver trinnene til en trinlinje. Hver scenarietype har sin visning, herunder spektrumvandfaldet, solsystemet, konstellationsdækning, kampagner, animationen, kørselsrapporten, interoperabilitetseksporterne og kæden i lav jordbane. Et dybt link (<c1/>) åbner den samme kørsel på det navngivne panel.

seg-dcf2788bb430 = <b>Forskning og citering.</b> Siden Evidens opregner de fem Kshana-artikler på arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } og { "2607.06212" }), hver med et resumé, en figur beregnet af denne motor, kommandoen der gengiver den, et Studio-link og BibTeX, ved siden af hvordan softwaren citeres. README får den samme sektion om forskning.

seg-fab395bab130 = En offentlig side for Kshana Pro.

seg-167a59e94101 = <c1/> og webstedets side Udgaver angiver, hvad det proprietære Pro-lag tilføjer over den samme motor (udformningsoptimering, usikkerhed og følsomhed, missionsdossier, kampagneovervågning, spektrumsameksistens, jobtjeneste på egne servere, sporbarhed af krav), hvad hver producerer, og hvad den ikke gør. Hvert Pro-tal, webstedet viser, er angivet på den offentlige side. Pro tilføjer ingen fysisk model, og den åbne motor forbliver hel og gratis.

seg-f57f0a610943 = <b>En omskrevet README.</b> Korte sektioner, ét billede pr. sektion, Kshana-mærket, to rækker badges, genererede billeder af arkitekturen, scenarieforløbet, kæden i lav jordbane og verifikationen (<c1/>, som fejler på et forældet billede) og Studio-skærmbilleder taget fra det kørende Studio af <c2/>. README'erne til crates.io, PyPI, npm og MCP-serveren følger samme udformning. Langt referencemateriale er foldet sammen eller flyttet til <c3/>.

seg-e06522ca762e = <b><c1/> er nu den avancerede kørselsrapport</b>, der er beskrevet under Added, og CLI'ens linje <c2/> nævner også <c3/>. Den énsides resultatoversigt, den afløste, er uændret som <c4/>, som Python- og WebAssembly-bindingerne stadig returnerer. <c5/> eksponerer den sætning, <c6/> udskriver for hver MODELLED-række; det dokument er uændret.

seg-77a6f35c5c9a = <b>README'en siger, hvad Kshana Pro bygger på.</b> Sektionen Udgaver og linjen om Kshana Pro under "Support & professional services" angiver nu, hvad Pros værktøjer til modelbaseret systemudvikling (MBSE) og programstyring gør, og hvilke af den åbne motors offentliggjorte outputs det læser (hver kørsels <c1/> og <c2/>, scenariefilen, feltenhedsskemaet og verifikationsmatrixens mærkater), og hvad urenes digitale tvillinger, afvejningsstudier og bevispakker bygger på i den åbne motor. Kun formulering: intet motoroutput og intet offentliggjort tal ændres.

seg-1a19675ffa3b = <b>Kompatibilitet.</b> Den offentlige enum <c1/> får en variant <c2/>, hvilket er en brydende ændring for en kalder, der matcher den udtømmende. Kolonnerne <c4/> og <c5/> for typen <c3/> ændres (se "Rettelser af offentliggjorte tal"). En kørsel gengives stadig af den motorversion, der lavede den.

seg-e7c5f77a6602 = <b><c1/> på MCP-serveren nævnte fire typer som de eneste med en CSV-tabel (kommaseparerede værdier); seks udgiver en.</b> Værktøjet returnerede altid tabellen for <c2/> og for <c3/> (dets analyse <c4/> på en meddelelsesmodel <c5/> eller <c6/>), men dets beskrivelse, dets afvisningsmeddelelse og de dokumenter, der opregner typerne, udelod begge, så en agent fik at vide, at den ikke skulle spørge. De er nævnt nu, og en rundturstest henter begge tabeller.

seg-4094f58a5f4b = Framen for LEO-navigationsmeddelelsen (lav jordbane) var ikke de samme bytes på hver platform og heller ikke i hvert build af én platform.

seg-5191262de022 = <c1/> kodede en frame med cyklisk redundanskontrol <c2/> i release-buildet på aarch64 macOS, <c3/> i en debug-build af den samme kilde på den samme maskine og <c4/> i WebAssembly-buildet (WASM); <c5/> gav <c6/> nativt mod <c7/> i browseren. Tre årsager, hver sporet til den første afvigende værdi:

seg-f6501c3cd89d = <em>Mellem platforme.</em> Den sande bane var bit-identisk på begge; tilpasningens udgangspunkt var det ikke. <c1/> tager den oskulerende inklination fra en <c2/> og perigæumsargumentet fra en <c3/>, og de to matematikbiblioteker afrunder dem forskelligt på sidste plads (over { "20 000" } argumenter er de uenige for { "781" } sinus, { "858" } cosinus, { "1 931" } eksponentialfunktioner og { "1 899" } arkustangens med to argumenter).

seg-cd6f05096b8b = <em>Mellem build-profiler.</em> Et optimeret build på macOS slår en sinus og en cosinus af ét argument sammen til ét enkelt kald til systemets kombinerede rutine, og dens sinus er ikke den samme som sinus i den enkeltstående <c1/> for { "379" } af { "200 000" } argumenter; et uoptimeret build laver de to kald. Typen tager en sinus og en cosinus sammen på tretten steder.

seg-91b0700dcb30 = <em>I uret.</em> Normalsampleren i <c1/> kalder værtens <c2/> og <c3/> i sine to sjældne grene: af fire millioner seedede træk afveg tre i sidste bit mellem det native og WASM-buildet.

seg-0a4724333429 = Levenberg–Marquardt-tilpasningen, som på denne bue stopper ved sin grænse på 80 iterationer og ikke ved et minimum, bærer én enhed på sidste plads over i forskellige kvantiserede felter. Typen beregner nu hver transcendent funktion gennem den nye <c1/>, som kalder crate'en <c2/> i ren Rust (allerede i afhængighedstræet, nu nævnt i <c3/>), kompileret fra én kilde for hvert mål og ikke et bibliotekskald, som optimereren omskriver: <c4/> og scenariekoden. Heltalspotenser på den sti er skrevet ud som kvadrér-og-gang, fordi <c5/> har uspecificeret præcision, og det sande ur trækker sine normalafvigelser fra <c6/> (Marsaglias polære metode på generatorens rå output). De delte rutiner, som den sande bane integrerer gennem, er skrevet én gang, generiske over matematikbiblioteket, med et indgangspunkt <c7/> internt i crate'en ved siden af det eksisterende: den sfærisk-harmoniske acceleration, de zonale accelerationer og accelerationen fra atmosfærisk modstand, J2-sekulære rater og Klobuchar-forsinkelsen. De eksisterende indgangspunkter er uændrede til sidste bit, så ingen anden types tal flytter sig. <c8/> fastlåser hele framen på 171 bytes og én kontrolværdi pr. efemeridemodel i den almindelige (uoptimerede) testprofil, på hver platform og uden nogen port for baseline-værten; <c9/> læser typens kilder fra disken og fejler ved et iboende transcendent kald, ved en sampler af typen <c10/> eller ved et kald ind i et modul, der ikke er gennemgået. Efter ændringen producerer et debug-build, et release-build og WASM-buildet byte-identiske resultatdokumenter for alle fem scenarier af typen <c11/>. <b>Dette flytter tal, registreret her som en rettelse.</b> Typen <c12/> er ny i denne udgivelse, så intet offentliggjort i en tidligere udgivelse flytter sig, men hvert tal for <c13/> gør, nativt og i WASM-buildet, og det gør trinnet <c14/> i <c15/> med: banetallene, fordi tilpasningen nu starter fra de bærbare elementer, urtallene, fordi det sande ur er en anden realisering af den samme proces. <c16/> er genereret ud fra de nye resultater; dens offentliggjorte kontrolværdi for scenariet med kodning og afkodning var <c17/> og er <c18/> (position inden for { "1.126" } mm af den nøjagtige meddelelse, hvor den var { "0.665" } mm, ur inden for { "0.185" } mm, hvor det var { "0.451" } mm). Størrelsen af ændringerne i tallene under millimeteret er tilpasningens følsomhed, ikke en fejl i nogen af sættene: tilpasningen er uændret og stopper stadig ved sin iterationsgrænse.

seg-c30f4cef4797 = Seedet resampling trak andre indekser på et 32-bit-mål.

seg-2bf668e23ec1 = <c1/> over <c2/> tager { "64" } bits fra generatoren på en 64-bit-vært og { "32" } bits på en 32-bit-vært, så det samme seed gav andre indekser og efterlod strømmen et andet sted, i WASM-buildet. Tre steder trak på den måde: percentil-bootstraps i <c3/> (<c4/>, <c5/>), shufflingen før hver træningsgennemgang i <c6/> og permutationstesten i <c7/>. De trækker nu gennem <c8/>, som altid samplerer som <c9/>: præcis det, en 64-bit-vært gjorde, så intet nativt tal flytter sig. <b>Dette flytter offentliggjorte tal i WASM-pakken, registreret her som en rettelse:</b> bootstrap-intervallet for <c10/> for arealet under kurven (<c11/>, <c12/>) var <c13/> i browseren og er nu det native <c14/>.

seg-80f783da1d4f = <b>Filnavne for STK-efemerider ud fra id'er for bevægelige objekter.</b> Et id for et bevægeligt objekt, der indeholdt et <c1/> eller et mellemrum (en konstellationsskal og en satellit, <c2/>), fik CLI'en til at gå i panik ved <c3/>; hvert id går nu gennem en sikker filedel (bogstaver, cifre, <c4/>, <c5/>).

seg-a0dc5729d5e9 = <b>Fortegnet i TEME→GCRS-nutationen</b>, beskrevet under "Rettelser af offentliggjorte tal" ovenfor, fordi det flytter offentliggjort output.

seg-5ecbf0787f39 = <b>Scenarietypen <c1/></b> (<c2/>): sekunder, indtil et frit løbende ur forlader grænsen for en tidsindekseret routing- eller opgavetildelingsslot, hvert bidragende led på det tidspunkt med det dominerende navngivet, den tid, der er tilbage siden den sidste positionsbestemmelse, og det største interval mellem positionsbestemmelser, der holder uret inden for, netto af forsinkelsen for positionsbestemmelsen. Uret kommer fra en klassestandard, en forudindstilling fra et datablad for telecom-timing, et inline-datablad (maksima for Allan-deviation, ældning, temperaturkoefficient) eller en målt faseregistrering. Et brud ud over den længste middeltid, kilden understøtter, markeres som ekstrapoleret. Medfølgende eksempel: <c3/>. Se <c4/>.

seg-40dd4c16b760 = <b>Målt rødstøjgulv.</b> En faseregistrerings overlappende Allan-deviation tilpasses med vægtede mindste kvadrater i basen for hvid fase og IEEE Std { "1139" }-frekvensmodulation (<c1/>), hvert punkt vægtet med sine ækvivalente frihedsgrader, så et holdover-svar kan hvile på urets eget gulv i stedet for klasseantagelsen. En uvægtet tilpasning lagde et falsk flickergulv på en hvidstøjstestregistrering og forkortede et brud på { "2 000" } s med { "30" } %.

seg-22c09748488b = <b>Validering med tilbageholdte data af holdover-inversionen på et rigtigt ur</b> (<c1/>): tilpasset på den første tredjedel af registreringen af 5071A-cæsium mod brintmaser ligger de forudsagte brud ved én sigma ved seks tærskler fra { "0.5" } til { "2.5" } ns inden for { "0.84" } til { "1.03" } af de brud, der er målt på de to andre tredjedele, mod en tærskel på { "1.5" }, fastsat før testen første gang kørte. En kontrol (Allan-deviationen på ét sekund læst som hvid støj) misser med en faktor omkring { "1 000" } og består ikke tærsklen. Ny VALIDATED registerrække; workflowet <c2/> kører den nu.

seg-cd73dc87a22f = <b>Den samme forudsigelse på en rigtig krystaloscillator</b> (<c1/>, <c2/>): på en målt ovnstyret krystaloscillator er forudsigelsen med tilbageholdte data konservativ, ved { "0.59" } til { "0.70" } af det målte brud og aldrig senere, og for det meste uden for tærsklen på { "1.5" }, fordi den oscillators støjgulv blev halveret under registreringen på 5,5 timer; tilpasset i stikprøven lander den inden for { "0.98" } til { "1.17" }. Krystaltilfældet er ikke valideret og forbliver MODELLED. Kørslen afslørede også et manglende led: en krystals frekvens vandrer, så modellen bærer nu usikkerheden i den frekvens, der er kendt ved positionsbestemmelsen (<c3/>); uden den var forudsigelsen optimistisk med op til { "2.5" }×.

seg-8519979d184c = <b>Den samme forudsigelse på atomure i kredsløb</b> (<c1/>, <c2/>): { "14" } dages endelige ure fra International GNSS Service for GPS Block IIF-satellitterne, med protokollen skrevet ned, før dataene blev hentet. Otte af ti satellitter lander inden for tærsklen på { "1.5" }; G25 og G30 forudsiger brud op til omkring dobbelt så sent som målt. Protokollen kræver, at hver satellit består, så tilfældet i kredsløb er ikke valideret og forbliver MODELLED; udfaldet er fastlåst.

seg-0d666a725b77 = <b>Urklasserne temperaturkompenseret krystal (TCXO), ovnstyret krystal (OCXO) og atomfrekvensstandard med rubidium (RAFS)</b> (<c1/>, <c2/>, <c3/>), de dele som en kommerciel smallsat-platform eller en jordgateway flyver med, hver med ét offentligt datablad som kilde (<c4/>). <c5/>, <c6/> og <c7/> er tilføjet. <c9/> i <c8/> accepterer de tre nye id'er. At tilføje varianter til en offentlig enum er en brydende ændring for en kalder, der matcher den udtømmende.

seg-24ae82b115f5 = <b>Beskyttelsesniveau for tidssynkronisering for en modtager i kredsløb</b> (<c1/>, den valgfri sektion <c3/> i typen <c2/>): hvor længe en jordspoofer kan nå en satellit i lav jordbane pr. passage, det træk, som en spoofer ved en angivet maksimal rampehastighed akkumulerer, før satellitten forlader dens rækkevidde, eller en uafhængig kontrol kører, og om hver kontrol ved jordkontakt eller krydslink er uafhængig af den spoofer. Reduceres nøjagtigt til <c4/> for et ur uden flicker-, hvidfase- eller random-run-støj. MODELLED.

seg-4032bc03fad5 = <b>Tre noter</b>: <c1/> (herunder hvilken vandringsmetrik en slot bør accepteres mod: maksimal absolut tidsfejl, ikke maksimal tidsintervalfejl eller tidsdeviation, og hvorfor), <c2/> (en signeret kommando anvendt på et bedraget tidspunkt fejlroutes stadig) og <c3/> (hvor Kshana kører; ingen flyvekerne uden <c4/> tilbydes).

seg-712035e19515 = Udgivelsen { "v0.27.3" } nåede crates.io (<c1/> og <c2/>) og PyPI og stoppede derefter ved npm, så npm, MCP-imaget på ghcr.io, MCP-registret, JetBrains Marketplace og kshana.dev aldrig modtog den. { "0.27.4" } bærer den samme motor, med udgivelsesrettelsen nedenfor, til hver kanal.

seg-bab8d4d1bc54 = <b>npm-udgivelsestrinnet navngiver tarballen med en eksplicit sti.</b> npm læser en bar <c1/> som GitHub-genvejen <c2/>, så npm-jobbet for { "v0.27.3" } forsøgte at klone <c3/> og fejlede med "Permission denied (publickey)". Selve tarballen var bygget og attesteret. Trinnet udgiver nu <c4/>. Alt efter npm i udgivelsesrækkefølgen (MCP-imaget, JetBrains-pluginet, kanalparitetskontrollen og webstedet) blev sprunget over, som tilsigtet.

seg-f9a112755eb1 = <b>Enhedskatalogerne for telecom-timing og <c1/> er undtaget fra kopi-og-indsæt-detektion</b> under samme politik og begrundelsestest som de andre kataloger. SonarCloud-kvalitetsporten var blevet rød på duplikering i ny kode ({ "4.0" }% mod { "3" }%), og hver duplikeret blok var en enhedsrække eller en post i en ITU-T-maske.

seg-3c3dacae06d6 = <b><c1/>: hvor længe en lille drones navigation holder, efter GNSS er jammet.</b> Den kører en mikroelektromekanisk (MEMS) inertienhed i flyvekontrollerklassen, en Bosch BMI088, mod en enhed af taktisk klasse. GNSS-signalet (Global Navigation Satellite System) er nominelt i { "100" } s og derefter nægtet i { "60" } s (<c2/> viser, hvorfor en jammer i nærheden gør det). BMI088's bias er de rester, der er tilbage efter kalibrering ved opstart, taget fra temperaturkoefficienterne i dens datablad (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s pr. K for gyroen og < { "0.2" } mg pr. K for accelerometeret. To antagelser er markeret i filen: en opvarmning på { "10" } K efter kalibrering og fortsat opvarmning på { "1" } K pr. minut under flyvning. Driften under flyvning er den fejl, filteret ikke kan nå at lære, før jammingen starter, og det er den, der afslutter den inertielle glidning. Hvert tal er modelleret; at validere det kræver flyvelogs fra et jammet miljø. <c3/> udskriver det.

seg-7154f69a2b8a = <b>Hver <c1/>-sensor kan sætte sit eget filterprior</b> (<c2/> eller <c3/>, med <c4/> og <c5/>). Standarden er uændret, så hvert eksisterende scenarie giver det samme resultat. Den resterende gyrobias for en enhed af forbrugerklasse ligger omkring { "26" } sigma uden for standarden for taktisk klasse, hvor filteret aldrig ville lære den. Et prior, der ikke er endeligt og positivt, afvises, og resultatet gentager prioret, når et er sat.

seg-2b54735b19aa = <b><c1/> giver en registerbruger et scenarie at køre.</b> En <c2/>-bruger har den eksekverbare fil og ingen mappe <c3/>, så den første kommando, hver quickstart gav dem, fejlede. Kommandolinjegrænsefladen (CLI) bærer nu de { "75" } referencescenarier, der kører på egen hånd, byte for byte, kompileret ind fra <c4/> (<c5/>; tabellen ligger i CLI-binærfilen, så Python-wheelen og WebAssembly-modulet ikke vokser). <c6/> opregner dem; <c7/> skriver ét. De to andre filer findes kun i repositoriet: <c8/> læser arkiverede data fra måneafstandsmåling med laser, som kun følger med repositoriet, og <c9/> er et studiemanifest, der kører tre søsterfiler med <c10/>. At bede om en af dem siger hvorfor og afslutter med { "2" } i stedet for at udskrive noget, der ikke kan køre på egen hånd. <c11/> holder tabellen op mod mappen i begge retninger, så en ny scenariefil, der hverken er medfølgende eller navngivet som kun i repositoriet, fejler.

seg-43249b6a1f3c = <b>Hvert kvalitetsmål i et ur-, bane-, hybrid- eller fusionsresultat siger nu, om det er VALIDATED eller MODELLED, i selve resultatet.</b> Resultatdokumentet får en blok <c1/>, altid dets sidste nøgle. Den opregner hvert rapporteret tal (for eksempel <c2/>) med dets niveau — VALIDATED betyder kontrolleret mod en uafhængig ekstern reference, MODELLED betyder en model fra grundprincipper, der er testet internt — og den række i verifikationsmatrixen, som niveauet læses fra. Niveauet kommer fra <c3/> gennem <c4/>, så der ikke er nogen anden tabel, der kan drive. Før dette optrådte ordene "validated" og "modelled" nul gange i et holdover-resultat for et ur, og en læser af den rå JSON (JavaScript Object Notation) havde ingen måde at skelne de to fra hinanden. Positionstallene for <c5/> og <c6/> har ingen ejende matrixrække, så de er opført under <c7/> i stedet for at få et niveau. Blokken bærer ingen tal. Den er bevist additiv, ikke antaget: at fjerne den giver det tidligere dokument tilbage byte for byte, for alle fem typer (en motortest), og begge golden-harnesses (<c8/>, <c9/>) fjerner nu præcis denne nøgle, og kun når den er den sidste, og hasher derefter resten mod deres <b>uændrede</b> frosne konstanter. En liste i hver harness fastlåser, hvilke scenarier der skal bære blokken, så udelukkelsen ikke i det stille kan udvides.

seg-8faf1981d797 = <b>En type <c1/> svarer i en timingingeniørs enheder: tidsfejl, maksimal tidsintervalfejl (MTIE) og tidsdeviation (TDEV), hver med en PASS eller FAIL og en margin mod masker fra International Telecommunication Union Telecommunication Standardization Sector (ITU-T).</b> Maskerne er transskriberet fra de gældende udgaver: G.8272 (07/2025) for klasserne A og B af primært referencetidsur (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) for det forbedrede PRTC i låst tilstand og i holdover (herunder dets tidsfejlsenvelope, som stiger fra { "30" } ns til { "100" } ns over en holdover-periode bestemt af, hvor længe uret var låst), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) for telecom-grænse- og tidsslaveure, klasserne A til D, og G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) for netværksgrænserne ved referencepunkt C. Hver post, som disse anbefalinger lader stå "til videre undersøgelse", er fraværende, ikke estimeret, og <c2/> opregner hvert tal med sin tabel eller klausul og hver post, der blev udeladt. Rapporten giver også tiden til at overskride hvert tidsfejlsbudget: som standard standarden på { "100" } ns for ePRTC-holdover, en allokering på { "400" } ns for netværksholdover, grænsen på { "1 100" } ns ved punkt C og kravet på { "1.5" } mikrosekunder for ende-til-ende i klasse { "4" }.

seg-9e5325e1b0ca = Inputtet er enten en syntetisk holdover eller en række af din egen. Den syntetiske bruger en af fire oscillatorforudindstillinger (en ovnstyret krystaloscillator, en rubidiumstandard, en cæsiumstandard og et chipskala-atomur), hver med stabilitets-, ældnings- og temperaturtal fra et navngivet Microchip-datablad. Hvordan disse tal bliver til hvid, flicker- og random-walk-frekvensstøj, ældning og et temperaturled, er angivet i hver rapport og mærket MODELLED. En række af din egen er <c1/>-par, inline (sådan kører den i browseren) eller på native builds fra en fil med kommaseparerede værdier. MTIE/TDEV-tabellen, med hver valgt maskes grænse ved siden af, skrives som kørslens CSV-artefakt.

seg-a23a96819dee = <c1/> er en rubidium-holdover på 24 timer med ældning, flicker og en daglig temperaturcyklus: dens største tidsfejl er { "603.2" } ns, den krydser { "100" } ns { "8 206" } s efter tabet og forbliver inden for { "1.5" } mikrosekunder hele dagen, og den består ikke holdover-envelopen for forbedret PRTC, som et ur, der ikke er af cæsiumklassen, bør ikke. <c2/> viser det inline input. MTIE og TDEV, som typen rapporterer, er kontrolleret mod pakken allantools på en indsendt holdoverrække med { "2" } 048 sampel, nøjagtigt for MTIE og til { "1.1e-15" } for TDEV, så matrixen får én VALIDATED række og to MODELLED (maskeomskrivningen og forudindstillingerne) og står nu på <b>{ "171" } rækker — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Dækningen af feltenheder går fra { "60" } af { "61" } typer til { "61" } af { "62" } og fra { "1,742" } til { "1,788" } beskrevne felter. Typen er ny og additiv: intet eksisterende scenarie, ingen fastlåsning og intet offentliggjort tal flytter sig.

seg-5bb1ad9a34ec = Playground kører motoren i en Web Worker i baggrunden, så et langsomt scenarie ikke længere fryser siden.

seg-b1ab3546f131 = <c1/> hoster WebAssembly-motoren, og <c2/> videresender hver scenarieudførelse til den — kørsler, parametersweeps og eksporterne SP3 / OMM / OEM / CSV. En kørsel, der varer længere end { "150" } ms, viser en optaget tilstand (Kør deaktiveret, "Running… N s") og en knap Cancel, der afslutter og genstarter workeren; en browser, der ikke kan starte en modul-worker, falder tilbage til den gamle sti i hovedtråden. <c3/>, udeladt af kataloget, fordi det frøs siden, er tilbage i det, mærket som langsomt: det tager omkring { "13" } s i Chrome (fire motorkald på omkring { "3" } s hver), hvor siden forbliver responsiv.

seg-146200dfac7e = <b>Hver rapporteret størrelse i <c1/> bærer nu en enhed, en proveniensklasse og en definition — den næstsidste type på undtagelseslisten for hele crate'en.</b> Alle { "41" } numeriske felter i det UDGIVNE dokument er beskrevet, så dækningen af feltenheder går fra { "59" } af { "61" } typer til { "60" } af { "61" } og fra { "1,698" } til { "1,742" } beskrevne felter, med efterslæbet uden definition uændret på { "239" }.

seg-61b1219ae0e3 = Det var blokeret af den fastlåsning, der fryser det udgivne dokument, og som navngav <c1/> som en nøgle, dokumentet aldrig må få. At tilføje en ville have betydet at slette den assertion og genbaselinere tre hashes i tre filer — en form, der ikke kan skelnes fra at dække over en regression. I stedet <em>beviser</em> de to fastlåsninger, der måler dette dokument, nu, at tilføjelsen er additiv: hver fjerner blokken <c2/> igen og hasher på ny mod den konstant, der blev frosset, før blokken fandtes, og <b>begge konstanter er uændrede</b>. En mutation bekræfter, at garantien er ægte — flyt en udgivet værdi og genbaselinér hele dokumentets hash, som en skødesløs rettelse ville gøre, og fjern-og-hash-igen fejler stadig. Den tredje fastlåsning, i den generiske registry-golden-harness, er genbaselineret på linje med de seks søskende, der blev genbaselineret af netop den grund, og dens værdibærende literal <c3/> flytter sig ikke.

seg-a73409e0b664 = <c1/> rapporterer, hvilken reference hver række for jordorientering blev bedømt mod, og hvor ofte reserveløsningen blev brugt.

seg-6e0493a39f1a = <c1/> får <c2/> og <c3/>. Gulvet <c4/> bedømmes mod det endelige tal i Bulletin B og kan kun bruge epoker, der udgiver et; hver række <c5/> bedømmes mod <c6/>/<c7/>, som falder tilbage til den hurtige værdi i Bulletin A. På det medfølgende udtræk for { "2026" } er det { "12" } af { "31" } sampel ved én dag mod { "0" } ved gulvet — så gulvrækken og forudsigelsesrækkerne ved siden af hviler på målbart forskellig reference, hvilket rapporten nu angiver i stedet for at overlade det til at udlede af et sampeltal, der stiger, hvor indlejrede horisonter siger, at det ikke kan.

seg-7ba5be07fa8c = <c1/> udsender en Kepler-baseline af samme størrelse.

seg-f9dc8fae6452 = <c1/> kører den illustrative konstellation igen med det HENTEDE sæts eget antal satellitter, kun til stede når antallene er forskellige. Antallet er en del af den udformnings geometri — RAAN og middelanomali er begge spredt som <c2/> — så uden det blev et hentet sæt med fem satellitter bedømt mod et illustrativt med otte, og udformning blev blandet sammen med størrelse. For referencesættet LANS med fem satellitter viser det sig, at { "8.68" } af dækningsgabet på 14,24 point er de tre manglende satellitter og kun { "5.56" } point udformningen; for de fire rumfartøjer, der virkelig er i månebane, når et specialbygget sæt med fire satellitter { "4.86" } %, hvor de når { "0" } %. En test fastlåser, at den matchede række er en genopbygget konstellation og ikke den konfigurerede omdøbt, hvilket er den måde, den først blev skrevet på, og det, kørslen derefter rapporterede.

seg-2e7e4dbbb7f6 = <b>Ni funktionskort på det offentlige websted, der dækker { "22" } rækker i verifikationsmatrixen, som blev leveret uden noget kort på produktniveau.</b> Motoren var vokset med en familie af funktioner — ARAIM-kontrollen mod offentliggjorte referencevektorer fra Working Group C, rigtig hentet geometri for måne-konstellationer, den lunare afvisningskontur med et målt C/N₀-bånd, trinnet fra VLBI-skema til stationskovarians, optisk og RF-overdragelse med fejlindsprøjtning på tværs af modaliteter, forudsigelse af jordorientering i realtid mod arkiveret Bulletin A, deling af apertur mellem navigation og kommunikation, INS/TRN-glidning og dækning af enheder og proveniens — hver med en matrixrække og et medfølgende scenarie, og ingen af dem nævnt på kshana.dev. Dækningen fra kort til række går fra { "72" } af { "168" } rækker til { "94" }.

seg-3dc189224fe8 = <b>Otte scenarier er føjet til legepladsens katalog.</b> Et funktionskorts Kør-knap vises kun, når <c1/> også indeholder filen; seks kort pegede på et scenarie, som den ikke indeholdt, så de blev vist uden nogen måde at køre dem på. Et af dem, datummet for ægte laserafstandsmåling, havde været i den tilstand, siden det blev udgivet. <c2/> sikrer nu invarianten i begge halvdele: et korts <c3/>-mål skal både være pakket under <c4/> <em>og</em> udbydes af kataloget. Mutationstestet mod begge fejltilstande.

seg-2d69334516e9 = <b><c1/> udskriver sin geometri pr. satellit som <c2/></b>, når et eksportsted er konfigureret (G11). Det er det største array, cratet udgiver: { "2304" } rækker i den udgivne fælles kommunikations- og navigationstabel. Det nåede kun frem til brugerne inde i JSON, den form, der afkortede et søsterscenaries kurve på 57 punkter til { "23" } punkter under en kolonne, som påstod at indeholde dem alle. Én række pr. forbindelse, rækkeantallet på overskriftslinjen, og antennekolonnerne kun til stede, når en antenne var konfigureret. En kørsel uden eksportsted er uændret på bytes og skriver ingen fil.

seg-7958d26072f7 = SBOM'en beskriver nu det, der leveres: { "60" } komponenter blev til { "66" }.

seg-219cd333b000 = <c1/> opførte hver pakke i opløsningen med standardfunktioner, dev-dependencies inkluderet. Det satte <c2/> og <c3/>, crates der kun bruges i test og ikke kompileres ind i noget artefakt, ind i styklisten og udelod kæden <c4/>, som PyPI-wheelen linker (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), og som er wheelens grænse mod fremmede funktioner. Scriptet gennemløber nu opløsningsgrafen fra pakken kshana ad normale kanter og build-kanter alene, over foreningsmængden af standardfunktionerne og funktionssættene <c13/> og <c14/> (npm-pakken indeholder den samme SBOM), for hver målplatform. Den fastlåste CycloneDX-formatkontrol er genbaselinet gennem sin indcheckede generator: { "60" } → { "66" } komponenter, { "53" } → { "60" } sammensatte licensudtryk, og stadig nul skemafejl, når disse er placeret i standardformen <c15/>.

seg-23c98d31f749 = <b>CSV-reproducerbarhedstabellen når alle indgange, ikke kun CLI'en og Python-wheelen.</b> MCP-serveren får et syvende værktøj, <c1/>, som kører et scenarie og returnerer den bytestabile tabel, CLI'en skriver som <c2/>, eller en fejl, der nævner de slags, som udgiver en (<c3/>, <c4/>, <c5/> og <c6/> kun når <c7/> + <c8/> er sat). WebAssembly-modulet får <c9/>, som returnerer den samme tekst eller <c10/>. MCP-rundturstesten og Python-bindingstestene fastlåser nu den returnerede CSV byte for byte mod <c11/> og fastlåser, at <c12/> returnerer antallet af skrevne bytes og { "0" } uden at oprette en fil for en slags uden tabel. Hver flade, der angiver antallet af MCP-værktøjer eller opregner værktøjerne, siger nu syv.

seg-86c3fed5e23a = <c1/> i WebAssembly-modulet: én motorkørsel for alle outputs.

seg-3f2677cd280b = <c1/>, <c2/>, <c3/> og <c4/> udfører hver scenariet fra bunden, så legepladsen betalte for fire fulde kørsler pr. klik, omkring { "12" } s i stedet for { "3" } s for <c5/> i en browser. <c6/> returnerer <c7/> fra én kørsel, og legepladsen bruger den nu. Den stemmer byte for byte med de fire separate kald.

seg-fa05c9ee0c6a = <b>REVISION: GNSS/INS-filterets kobling af gyrobias havde forkert fortegn, og tallene for udfald i <c1/> ændres.</b> Det udvidede Kalman-filter med fejltilstand (EKF) holder begge inertibiaser som residualer (sand værdi minus det løbende estimat, ført tilbage ved addition). Accelerometerkolonnen drev hastighedsfejlen med <c2/>, men gyrokolonnen drev attitudefejlen med <c3/>. En residual gyrobias roterer i virkeligheden den beregnede attitude med <c4/>, så hvert estimat af gyrobias skubbede i den forkerte retning. Pakken var kun stabil, fordi dens standardprior for gyrobias ({ "1e-4" } rad/s, 1 sigma) var stram nok til at holde de tilstande på plads. Med en bredere prior divergerede filteret, selv når den sande gyrobias var nul: { "93" } m fusioneret udfaldsfejl blev til { "4.3" } km. De udgivne tal for <c5/> ændres som følger:

seg-47e22e713df6 = før (≤ { "0.27.2" })

seg-5215a0a41b89 = efter

seg-f58aecc6864c = koldatom-IMU, fusioneret RMS under udfald

seg-c4fbd933ddb2 = { "96.1" } m

seg-002d765fca02 = { "1.9" } m

seg-d14616d4ea1b = koldatom-IMU, coast inden for specifikation ({ "50" } m)

seg-35f8f623ea28 = { "30" } s

seg-91645c14401b = { "60" } s (hele udfaldet)

seg-f297a2652cf8 = taktisk IMU, fusioneret RMS under udfald

seg-0ac27c6d4206 = { "62.5" } m

seg-eda895cc3b86 = { "3.1" } m

seg-e0ab83f1d8d7 = taktisk IMU, coast inden for specifikation ({ "50" } m)

seg-5c526991a521 = { "37" } s

seg-743060da5543 = Tallene for frit løbende drift ({ "130.7" } m og { "314.3" } m) ændres ikke; de brugte aldrig filteret. Pakkens tidligere aflæsning, at den fusionerede coast er begrænset af et attitudegulv fra overdragelsen og derfor ikke forbedres med en bedre sensor, var en artefakt af denne fejl og er trukket tilbage. Med konstante, støjfrie biaser lærer filteret dem nu, mens GNSS er tilgængeligt, så den fusionerede coast er et bedste tilfælde. Den eksterne filterpy-reference (<c1/>) kontrollerer kun måleopdateringerne, og derfor så den aldrig propagationen. To tests kontrollerer nu fortegnet direkte, og begge fejler på det gamle. Den første, i <c2/>, fører en kendt residual gyrobias gennem strapdown og kræver, at filteret forudsiger den resulterende attitudefejl inden for { "2" } %. Den anden kræver, at en bred prior lærer en gyrobias på { "1e-3" } rad/s og holder sig inden for { "6" } m. Den tværplatformsgyldne reference for <c3/> er genfastlåst af denne grund og ingen anden.

seg-f764678e3376 = <b>Hver registry-quickstart kører nu som skrevet på en ren maskine.</b> Målt før denne ændring læste eksemplerne for crates.io og PyPI (Python Package Index) <c1/>, som en registry-installation ikke har, og npm-eksemplet gik ned under Node.js med <c2/>, fordi pakkens <c3/> henter sin WebAssembly-binær, og Nodes <c4/> ikke kan læse en lokal fil. Nu gælder:

seg-e77a540d2f90 = <c1/> og <c2/> indeholder det scenarie inline, som <c3/> allerede gjorde. Rust-blokken er et helt program med sin egen <c4/>, da den rustdoc-skjulte linje <c5/>, som den før sluttede med, vises på crates.io og ikke kompilerer, når den indsættes. <c6/> kompilerer den stadig byte for byte og afviser nu også en skjult linje i blokken.

seg-ea5204ced0d2 = <c1/> adskiller browseren fra Node.js og giver en Node-opskrift, der læser binæren fra disken og sender den til <c2/>. Doc-sync-testen accepterer <c3/> som den indlæser, wasm-bindgen genererer.

seg-ebb763695c59 = Alle tre indlejrer scenariet med dets proveniensstrenge uforkortede, så scenariets hash er <c1/> på alle flader. npm-eksemplet plejede at forkorte dem, hvilket gav det en anden hash end CLI'en.

seg-dc52363432f8 = Gengivet fra lokale builds af dette træ: et nyt <c1/>-projekt med en stiafhængighed til det pakkede crate byggede og kørte Rust-eksemplet; en wheel bygget med maturin fra de pakkede kilder og installeret i et nyt virtuelt miljø kørte Python-eksemplet; og pakken <c2/>, pakket og installeret med npm, kørte Node-opskriften. Alle tre udskrev den samme oversigtslinje.

seg-07e465a602f1 = <c1/> virker fra en klon.

seg-77ce31300b69 = <c1/> sætter <c2/>. Uden den afviste cargo med "could not determine which binary to run", hvilket hver <c3/>-linje i dokumentationen ramte.

seg-2d516597b5f5 = <b>CLI'ens fejl i det første minut siger, hvad du skal gøre nu.</b> En scenariosti, der ikke findes, tilføjer nu et fingerpeg, der peger på <c1/>, og et andet positionelt argument udskriver brugsteksten og navngiver argumentet. <c2/>, <c3/>, fejlen for en ukendt indstilling (exit { "2" }) og <c4/>s enlinjede <c5/> ved succes lå allerede på main. <c6/> dækker nu dem alle, da ingen test kørte binæren for nogen af dem før.

seg-fdd9a27ccfc4 = <b><c1/> i Python er dokumenteret som returnerende én JSON-streng, ikke en liste.</b> Den returnerer de samme metadata som <c2/>, serialiseret, så iteration gennemløber tegn. Den beholder sin strengreturnering, så eksisterende kaldere ikke går i stykker. <c3/>, bindingens dokumentationskommentar, <c4/> og <c5/> siger nu det og peger på <c6/>.

seg-f0e0c8c12f8a = <b>De tre registry-README'er udskriver hver forkortelse ved første brug.</b> PNT er nu udfoldet i sloganet, hvor det først optræder, og CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL og API er udfoldet i de filer, der bruger dem. Overskriften på tabellen med uafhængige referencer siger ikke længere "CI-gated", før CI er defineret.

seg-554c5b0c9c60 = Rettede et udgivet tal: tilgængelighed for ARAIM med to konstellationer på de medfølgende Celestrak GPS + Galileo TLE'er.

seg-1f023a822c91 = <c1/> angav, at sammenlægning af Galileo løfter tilgængeligheden fra { "0.21" } til { "0.67" } under en VAL på { "12" } m, og at den konstellationsfejlrobuste tilstand er begrænset med kun to konstellationer. Det stammede fra <c2/>, der propagerede hver satellit fra sin egen TLE-epoke (<c3/> dropper epoken), og epokerne i de filer spænder over { "70.6" } h (GPS) og { "335.7" } h (Galileo), så satellitterne stod på indbyrdes uforenelige tidspunkter. Testen bevarer nu hver epoke (<c4/>) og evaluerer hver satellit på ét fælles UTC-tidspunkt, den seneste TLE-epoke i sættet (2026-06-07T07:{ "21" }:{ "04" }). Den målte tilgængelighed over det samme gitter på { "24" } h med 289 sampler bliver kun GPS { "0.993" } (var { "0.208" }), sammenlagt { "1.000" } (var { "0.671" }) og konstellationsfejlrobust dobbelt { "0.990" } (var { "0.031" }); ved APV-I-grænsen går dobbelttilstanden fra { "0.180" } til { "1.000" }. Konklusionen vendes om: på en konsistent himmel bærer to konstellationer hypotesen om konstellationsfejl ved en VAL på { "12" } m. De samme tal fremkommer med den tidligste TLE-epoke som reference. En selvkontrol i testen fastlåser dens tilgængelighedsløkke sampel for sampel til <c5/>, så den eneste forskel er tidsjusteringen. <c6/> og <c7/> §{ "3" } indeholder de nye tal; posten for { "0.13.0" } nedenfor er uændret som udgivet.

seg-3173a2e03521 = <b>De offentlige flader reklamerer ikke længere for RINEX { "4" } som valideret.</b> Motoren afviser nu en RINEX { "4" }-navigationsfil ved navn i stedet for at afkode den forkert, men standardgitteret viste stadig et kort "RINEX { "3" } / { "4" }" med en <em>valideret</em>-pille, bundet til navigationsparserens RINEX-3-evidens. Kortet er nu "RINEX { "3" }", og README, <c1/>, <c2/>, <c3/> og funktionsoversigten angiver det, der er sandt: RINEX 3.0x-observationsfiler parses, observationslayoutet { "4.00" } forventes at blive det, men ingen { "4.00" }-fil er læst gennem koden, og RINEX { "4" }-navigationsfiler afvises.

seg-c9bb514acb7a = <b><c1/> siger, når "ok" betød, at der ikke var noget at kontrollere.</b> Omkring to tredjedele af kataloget udgiver intet obligatorisk felt; de pakker kører deres referencekonfiguration fra et tomt indhold, så linten kun kunne udskrive "ok" for dem, med de samme ord som efter kontrol af seks felter. Succeslinjen angiver nu antallet af obligatoriske felter, den fandt til stede, eller at slagsen ikke kræver nogen.

seg-06b324d00285 = <b><c1/> afviser en ikke-numerisk <c2/> eller <c3/>.</b> Under bash { "3.2" } fik <c4/> den numeriske sammenligning til at give fejl og evaluere til falsk, så gaten meddelte "repeatability loop SKIPPED (REPEAT={ "0" })" for en værdi, der ikke var { "0" }, og skrev stadig en kvittering. Begge knapper afslutter nu med { "2" }, medmindre de er rene heltal.

seg-09d04ffdd9ac = MSRV er angivet som { "1.85" } overalt, hvor et menneske læser det.

seg-dafc23725315 = <c1/> gik til { "1.85" } ved sidste udgivelse; README-badgen, installations- og fejlfindingsteksten, <c2/> og MCP-cratets egen begrundelse sagde stadig { "1.75" }.

seg-c2fa8a31058c = <b><c1/> i Python-bindingen angiver bytes, ikke "chars".</b> Den udskrev <c2/> af UTF-8-strenge, som er et bytetal: { "710" } "chars" for en tabel på 708 tegn.

seg-6b4452a4e340 = README'en dokumenterer ikke længere <c1/> sammen.

seg-47d83e4d847b = <c1/> er et flag for ét scenarie og ignoreres med <c2/> (binæren advarer). De to eksempler til kopiering i README.md og README.crates.md viser nu study-kommandoen alene.

seg-5ed7f8330b2d = <b>Sidens evidens for urstabilitet angiver begge observerede tolerancer.</b> 5071A-cæsiumserien gengives til ≤ { "3e-5" } og PHASE.DAT til ≤ { "5e-5" }; afsnittet angav { "3e-5" } for begge.

seg-8bba7f1171f3 = To motoroutputfiler spores ikke længere.

seg-ea9bf1d14371 = <c1/> var stemplet af motor { "0.20.0" } med alle kvalitetsmål tomme, og README'ens egen study-kommando overskrev dem, hvilket gjorde træet beskidt og blokerede push-gaten. <c2/> / <c3/> ignoreres nu som de andre fire motoroutputs.

seg-77ce9b90859d = <b>Et seed-sweep på legepladsen fejler ikke længere ved hver kørsel.</b> Sweepet trinnede heltalsknappen <c1/> lineært ({ "1" }, { "10.9" }, { "20.8" }, …), og motoren, der læste den som <c2/>, afviste hver brøkværdi. Heltalsknapper sweeper nu forskellige hele tal.

seg-e1b1e1360eb9 = <b>Hver download fra legepladsen siger, hvilken motor og hvilket input der frembragte den.</b> Nogle få slags (f.eks. <c1/>) udskriver hverken <c2/> eller <c3/>, så deres downloads blev blot kaldt <c4/>. Navnet falder nu tilbage på den indlæste motors version og et FNV-1a-64-fingeraftryk på 12 hex-tegn af scenarieteksten.

seg-0181e86b576a = <b>Det udgivne crate er under halvt så stort som før, og <c1/> bygger kun CLI'en.</b> Pakken plejede at indeholde artiklerne, deres indsendelsespakker, artefakterne til artiklernes figurer, notebooks, <c2/>, vedligeholderscripts og eksempelprogrammerne. Intet af det kompileres af biblioteket eller CLI'en. Den indeholdt også de tre interne generatorer under <c3/> (<c4/>, <c5/>, <c6/>), så en registry-installation kompilerede og installerede fire eksekverbare filer, hvoraf tre kun er nyttige inde i et checkout. De træer og de tre generatorkilder er nu udelukket. Cargo opregner en pakkes binærer ud fra de filer, den indeholder, så det udgivne manifest nævner kun <c7/>. I en klon findes generatorerne stadig automatisk, så <c8/> og udgivelsesjobbet, der kører <c9/>, er uændrede. Målt med <c10/>: { "763" } filer, { "16.7" } MiB, { "6.8" } MiB komprimeret før; { "591" } filer, { "10.5" } MiB, { "3.0" } MiB komprimeret efter. Dens verifikationsbuild, som kun kompilerer de pakkede filer, består. <c11/> på det pakkede crate installerede én eksekverbar fil, <c12/>.

seg-567c7059286f = <b>Output, en tidssynkroniseringsingeniør kan læse: ikke mere <c1/>, ikke mere <c2/> uden angreb og stedtal, der stemmer med README'erne.</b> Dette er en visningsrevision. Intet udgivet tal ændres; JSON-værdierne er identiske, hvilket golden-hashene ovenfor beviser.

seg-849fa9a29f07 = Enlinjeoversigten udskrev det optiske urs tidsfejl i 95. percentil (p95) som <c1/>, mens tabellen ved siden af viste { "1.20e-4" } ns. Et tidsfejltal, der ikke er nul, men for lille til én decimal, udskrives nu med tre betydende cifre (<c2/>); et nøjagtigt nul udskrives stadig som <c3/>. HTML-rapporten (HyperText Markup Language), study-sammenligningstabellen og legepladsens downloadbare rapport bruger samme regel, så intet tal, der ikke er nul, udskrives som <c4/> heller.

seg-c44323babd1e = <c1/> er en analytisk grænse for spoof-detekterbarhed, som kun betyder noget over for et konfigureret angreb. Slagsene <c2/>, <c3/>, <c4/> og <c5/> konfigurerer intet, så deres oversigt udskriver nu <c6/> i stedet for et tal som <c7/>, der læses som en mislykket detektion. Værdien bliver i <c8/>, markeret <c9/> med begrundelsen i <c10/>, og rapporttabellerne viser "not applicable". Slagsen <c11/> scorer stadig detektion.

seg-f54d5ffb7dff = To oversigtsfastlåsninger i <c1/> flyttede sig af netop disse to grunde og ingen andre: <c2/> (kvante-p95 og begge <c3/>-værdier) og <c4/> (begge <c5/>-værdier; dens p95-værdier er nøjagtigt nul). Deres hele dokumenthashes flyttede sig ikke. De forventede oversigter i README'en, de tre tutorials og deres undervisningsscenarier er opdateret til at passe, og <c6/> kontrollerer undervisningskopierne mod motoren.

seg-e8e012376fa3 = Legepladsens guidede rundtur åbner ikke længere ved første indlæsning. Dens modal fangede de første klik, og dens spotlight scrollede siden væk fra det sted, besøgende landede. Den starter fra knappen "Take the 60-second tour" eller den flydende Tour-knap.

seg-4d60d4ea4d7d = Siden scroller ikke længere sidelæns på en telefon. Ved { "390" } px udgjorde mærkerækken og GitHub-knappen omkring { "410" } px indhold, en overskridelse på { "4" } px; overskriften passer nu fra { "320" } px og op, og tabellen over kvalitetsmål scroller inde i sin egen boks i stedet for at udvide siden.

seg-f6ec6a64071d = Funktionsudforskeren indledte med sit eget kortantal ("{ "46" } capability cards … { "17" } backed by an external oracle") ved siden af README'er, der siger { "64" } af { "168" }. Den indleder nu med verifikationsmatrixen, læst fra den genererede <c1/> (den samme matrix, README-tallene er fastlåst til), og nævner bagefter kortene som det oversigtslag, de er. <c2/>, et nyt trin i arbejdsgangen for kontinuerlig integration (CI), kontrollerer regnestykket og krydstjekker README.md og sidens beskrivelser; <c3/> fastlåser forbindelsen fra Rust-siden.

seg-606098743e57 = <b>Den offentlige beskrivelse indleder nu med tidssynkronisering og holdover, det bedst validerede område.</b> README'ens åbning og <c1/> præsenterer Kshana som en åben, reproducerbar PNT-robusthedsmotor for evidens med proveniensmærkning: tidssynkronisering og holdover for kritisk infrastruktur først (estimatorerne for Allan, modificeret Allan, tidsdeviation og maksimal tidsintervalfejl og holdover-coastvariansinversionen er de VALIDATED rækker bag det), kvante som en neutral afvejningsmetode mellem kvante og klassisk, hvis resultater er mærket MODELLED, og navigation til månen / cislunar rum og dybt rum som vedligeholdte funktioner frem for overskriften. Begge sider siger nu, hvad Kshana ikke er: ikke en radiofrekvenssignalsimulator eller hardware-in-the-loop-rig, ikke en erstatning for MATLAB/Simulink, STK eller Orekit, og peger på den nye slags <c2/> og <c3/>. Den gamle linje "der findes intet godt åbent værktøj" er væk: en søgning, der ikke finder noget, er ikke evidens for, at intet findes. <c4/> får en udateret prioriteret rækkefølge (tidssynkronisering først, kvanteafvejningen som nummer to, månen vedligeholdt) og dropper tre forældede punkter (Coriolis og lysforskydningssystematik, NRHO-begyndelsesbetingelserne og månescenariet, alle leveret); README'ens linje "Coriolis and light-shift remain roadmap" er rettet på samme måde.

seg-7bc48692be0b = <b><c1/> holdt op med at underdrive.</b> Rækken for jordfaste referencesystemer sagde "none", mens matrixen graderer GCRS→ITRS som VALIDATED; den er nu "full", og rækken for kernereferencesystemer registrerer ANISE-krydskontrollen som leveret. Guidet tilstand var opført som køreplan; legepladsen har leveret guidede skydere og en guidet rundtur. Et gennemløb mod <c2/> rettede fem rækker mere, der var ældre end deres valideringer: Cowell-kraftmodellen og batch-/sekventiel banebestemmelse mod Orekit { "12.2" }, jordstationspassager mod Orekits elevationsdetektor, kernen for præcisionsfortynding (dilution of precision) mod gnss_lib_py og OEM-import mod den uafhængige <c3/>-parser; rækken for verifikation og validering nævner nu de vagter, der kontrollerer, at hver citeret test findes.

seg-9d144df304ca = Ordlisten forklarer, hvad en resultatfil siger.

seg-eed672b2f8fd = <c1/> får forklaringer i almindeligt sprog af outputtermerne (holdover, p95, integritet, sikkerhedsscoren, PDOP, <c2/>, <c3/>), telekommunikationens tidssynkroniseringstermer (time error, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) og de tre evidensniveauer (VALIDATED, MODELLED, PARTNER).

seg-1a4f9d5eef96 = <b>Forkortelser er udfoldet ved første brug i hvert håndskrevet offentligt dokument.</b> README'en og { "24" } filer under <c1/> havde adskillige hundrede forkortelser brugt før eller uden deres udfoldelse; hver er nu udfoldet, hvor den først optræder i den fil. De tre genererede filer (<c2/>, <c3/>, <c4/>) er ladt i fred: de skrives ud fra <c5/> og <c6/>, så deres ordlyd skal ændres ved kilden.

seg-2889ce118381 = Linjedækning har et måltal i registret.

seg-9c4684c0a4ef = <c1/> registrerer { "95.63" } % ({ "37,697" } af { "39,419" } linjer) fra CI-jobbet <c2/> på <c3/>, og <c4/> fastlåser de fem offentlige "~{ "96" }%"-flader til det, det ene overskriftstal, der blev vedligeholdt i hånden og allerede én gang var flyttet uden at blive bemærket.

seg-ebd36b7291df = Nye doc-sync-gates for flader, som intet læste.

seg-3dd44fc69a28 = <c1/> kontrollerer hver <c2/> i en JavaScript-blok mod WebAssembly-eksporterne og fastlåser README.crates.md's Rust-eksempel byte for byte til en kopi, testbinæren kompilerer. <c3/> fejler, hvis <c4/> mister <c5/>, eller SECURITY.md holder op med at angive det. <c6/> scanner nu også <c7/> og de tre registry-README'er, og hver standard på siden skal udtrykkeligt angive sit <c8/>.

seg-a506d14f3447 = De to kontroller af ægte hardwareure kører på en runner.

seg-c7f8b8627137 = <c1/> (månedligt og ved dispatch) henter serierne 5071A og PHASE.DAT og kører begge tests med <c2/>, så et manglende input fejler i stedet for at blive sprunget over. Begge hentescripts er fastlåst til ét allantools-commit og verificerer SHA-256.

seg-3b4a7fee3cd0 = <b>Python-typestubben kontrolleres mod den byggede wheel</b> (<c1/> i bindingsjobbet), hvilket er sådan, <c2/>/<c3/> blev leveret uden stub.

seg-24c2ccf3634a = <b>Ordlisten definerer URE, EOP, FoM, CTI og TIB</b>, som README'en og registret brugte uden forklaring.

seg-ae044195cd47 = <b>Hver slags udgivne feltkontrakt er nu sand, og en test holder den der.</b> Fem af de { "61" } slags ændredes. Slags med et ikke-tomt <c1/> går fra { "21" } til { "22" }: <c2/> kræver nu <c3/> (en bar <c4/> plejede at bestå <c5/> og derefter fejle kørslen), og <c6/> tilføjer <c7/>, som dens kørsel allerede krævede. En obligatorisk post må bruge <c8/> (en af disse) og <c9/> (alle disse sammen); <c10/> forstår begge. <c11/>, <c12/> og <c13/> udgiver { "9" } ægte valgfrie felter, de havde udeladt. <c14/> siger nu, at <c15/> er obligatorisk for hver slags undtagen <c16/>. <c17/> kontrollerer hver slags mod dens leverede scenarie: fjernes en obligatorisk post, skal kørslen fejle, og et dokument med kun de obligatoriske felter skal køre.

seg-09ba716f3e97 = Noterne til JetBrains Marketplace er bag en gate.

seg-938ff48e7a2d = <c1/> fejler nu, medmindre den nyeste <c2/>-post i <c3/> angiver den version, der leveres; syv udgivne versioner havde serveret noterne for { "0.22.0" } uændret.

seg-3d38550854e0 = Den tekniske rapports dækningstal er det målte.

seg-bd312cd26746 = <c1/> sagde "near { "97" } %"; den siger nu omkring { "96" } % ({ "95.63" } % målt, <c2/>) og er den sjette flade, dækningstesten fastlåser.

seg-934680d402da = <b>Motorklienten uden for hovedtråden er testet</b> (<c1/>, i CI): dispatch-tilladelsesliste, annullering og genstart, de tre fallback-ruter i hovedtråden og nedbrudsgendannelse, mod en falsk worker.

seg-fd5f9a8a4f43 = <b>Intet udgives, før det mærkede commit har bestået sine tests, og en udgivelse er ikke færdig, før hvert registry serverer den.</b> Rækkefølgen er nu tag, verificér, udgiv, paritet, side, i én kørsel af <c1/> (<a1><c2/></a1>).

seg-745b11c8ed74 = Udgivelsen venter på afgørelsen.

seg-e66c890cf6c0 = <c1/>, <c2/> og <c3/> starter ikke længere ved tag-push; <c4/> kalder dem fra jobs, der har <c5/>. Før løb de om kap med den: ved { "v0.27.2" } havde crates.io, npm og Python Package Index (PyPI) alle udgivet inden for { "4.5" } minutter efter tagget, og <c6/> vendte tilbage { "84" } minutter efter det; ved { "v0.27.0" } udgav npm og PyPI, mens crates.io-jobbet fejlede. Et manuelt genforsøg på et tag holdes tilbage af det nye <c7/>, som kræver en grøn <c8/> for netop det commit fra Actions-grænsefladen og lukker af ved alt andet.

seg-3800247c81f2 = <em>Alt bygges, før noget uploades</em>, og crates.io, hvis pakketrin var det, der fejlede midt i en udgivelse, udgiver først.

seg-6929a7608da7 = <em>Et manglende registry-token lader jobbet fejle</em> i stedet for at springe uploaden over og melde succes.

seg-460811602293 = En paritetskontrol efter udgivelsen.

seg-86eb0fab2f7c = <c1/> poller crates.io (<c2/> og <c3/>), npm, PyPI (kildedistributionen og alle seks platformswheels) og ghcr.io, indtil hver serverer versionen, eller lader kørslen fejle; docs.rs og Model Context Protocol-registret (MCP) rapporteres, men er ikke påkrævet. Kørt mod tidligere udgivelser finder den { "0.22.0" } manglende fra npm og PyPI, { "0.23.0" } fra PyPI og { "0.27.0" } fra crates.io.

seg-79578a00fd78 = <em>Prækompilerede kommandolinjebinærer til macOS (Apple silicon og Intel) og Windows x86-64</em>, navngivet efter mål (<c1/> og så videre), ved siden af Linux-<c2/>, hvis navn er uændret. En <c3/>-fil dækker hvert aktiv, og <c4/> kontrollerer den og kører macOS- og Windows-binærerne på deres egne systemer.

seg-3e1f5afa9f2a = <em>kshana.dev viser en udgivelse, ikke <c1/>.</em> Den plejede at blive udrullet igen ved hvert push til <c2/>, mens dens sider nævnte den sidste udgivelse. <c3/> bygger nu kun et udgivelsestag: udgivelsen igangsætter den, når hver kanal serverer versionen, og en manuel dispatch ruller den seneste udgivelse (eller en navngiven) ud igen.

seg-43da8f3f171e = Én kilde til wheels.

seg-b911ac65e231 = <c1/>s håndkopierede matrix med seks mål er væk; den kalder <c2/>, så auditwheel-taggaten og bytereproducerbarhedskontrollen nu bedømmer de wheels, PyPI modtager, og en fejl i en af dem stopper udgivelsen.

seg-194c4b019a4c = <em>Fastlåste byggeværktøjer.</em> Hver arbejdsgang anmoder om Rust { "1.93.0" } (msrv-jobbet om sin egen version); <c1/> og <c2/> havde anmodet om <c3/>, og loggen for { "v0.27.2" } viser, at rustup installerede { "1.98.1" } og derefter kompilerede med { "1.93.0" } kun fordi <c4/> har forrang. wasm-pack er fastlåst til { "0.13.1" } (den version, der byggede { "v0.27.2" }, og som det ufastlåste installationsscript valgte) med en kontrolsumkontrol, og mcp-publisher til { "1.8.1" } med dens udgivne SHA-256. <c5/> fejler nu, hvis en arbejdsgang beder om en anden compiler eller sender et downloadet script ind i en shell. Intet verifikationsjob, ingen golden-fastlåsning og intet lokalt gate-script er fjernet eller lempet.

seg-9e2a7376367e = <b>Hver tredjeparts GitHub Action er fastlåst med commit-SHA</b>, { "93" } referencer på tværs af { "15" } arbejdsgange, { "92" } af dem nye, med tagget bevaret som en afsluttende kommentar, som Dependabot kan opdatere. Undtagelsen er <c1/>, hvis tag er værktøjskædevælgeren.

seg-6afb4a8770b0 = <b>MCP-serverbilledets basislag er fastlåst med multiarkitektur-digest</b>, og Dependabot overvåger nu <c1/>s Dockerfile, så OS-lagene stadig modtager sikkerhedsopdateringer gennem en gennemgået PR.

seg-4ea8b158b408 = Kontrollen af tag mod manifest kører i de to udgivelsesarbejdsgange, der leverer tagets version.

seg-4b77764e955d = <c1/> (ghcr-billede, MCP-registret) og <c2/> (Marketplace) løber om kap med <c3/> i stedet for at vente på den, så et fejlskåret tag kun blev kontrolleret i en søsterarbejdsgang. Begge kører nu <c4/> før build.

seg-bf90c4063843 = <b>Fire sikkerhedsbulletiner, Dependabot rejste den dag, dens alarmer blev slået til, er rettet.</b> MCP-serveren går fra <c1/> { "1.7" } til { "2.2" }: tre bulletiner mod <c2/> < { "2.1" } (en lækage i Streamable-HTTP-sessionstabellen, manglende OAuth-validering af beskyttet ressource, brugerdefinerede headers der følger en omdirigering på tværs af oprindelser), ingen af dem nåbare her, da serveren kun taler stdio, men et udgivet crate bør ikke fastlåse en sårbar SDK. Makroerne i <c3/> { "2" } kræver Rust { "1.88" }, så <c4/> alene erklærer nu <c5/>; biblioteket <c6/> bliver på { "1.85" }. Den ene API-ændring (<c7/> → <c8/>) er gennemført, og rundturstestene består. SonarQube-scanningshandlingen går fra v5 til v6, som retter et bulletin om argumentinjektion (≥ { "4.0" }, < { "6.0" }).

seg-2652aaad177e = <b>Hvert Rust-element, en række i verifikationsmatrixen citerer, opløses nu mod craten.</b> Den eksisterende vagt kontrollerede de citater, der er formet som filstier; { "63" } af de { "164" } rækker, der ikke er partnerrækker, nævner i stedet deres evidens som et element i craten (<c1/>, <c2/>, <c3/>), og et token uden suffikset <c4/> var usynligt for en stiscanner. De rækker kunne have nævnt et omdøbt modul, et tømt testmodul eller en funktion, der aldrig fandtes, og hver gate ville være forblevet grøn.

seg-01eee5115e3f = <c1/> opløser alle { "339" } sådanne citater gennem modultræet, kræver, at hver række, der ikke er en partnerrække, nævner mindst én test, der faktisk bærer <c2/>, og kræver, at partnerrækker ikke nævner nogen. Fire mutationer blev brugt til at bedømme den: omdøbning af et citeret modul, at lade en rækkes eneste testcitat pege på en funktion uden test, omdøbning af det rigtige <c3/> og fjernelse af <c4/>-attributterne fra det; hver slår over i rødt på den påstand, der ejer den.

seg-7731d549c739 = Én række var allerede forkert: <em>Alternative / complementary PNT</em> citerede <c1/>, en glob, som ikke er et citat. Den nævner nu <c2/> og de tre testmoduler i craten bag den.

seg-cf6fd64368de = <b>De udgivne figurer kontrolleres igen mod motoren ved hver build</b> (<c1/>). De tre demodiagrammer i README er motorens eget <c2/>-output, og intet kørte scenariet igen; artiklens to crossover-studier blev genereret én gang og committet; og README'en angiver fire kvalitetsmål i prosa ved siden af <c3/>. Alle tre er nu fastlåst til levende motoroutput.

seg-276b65a8f76a = Afstemningen af dem gav det nyttige resultat: demodiagrammerne var tegnet ved motor { "0.22.0" } og artiklens crossover-JSON ved { "0.20.0" }, og ved { "0.27.1" } er <b>hver plottet værdi i alle fem artefakter identisk</b>; de tre diagram-SVG'er adskiller sig fra en ny kørsel med nøjagtigt to tegn hver, versionsstemplet i sidefoden. Diagrammene er tegnet igen, så sidefoden er sand. Artiklens JSON er bevidst efterladt stemplet { "0.20.0" }: den er optegnelsen over den kørsel, hvis figur en udgivet artikel indlejrer, og at stemple den igen ville påstå en proveniens, som PDF'en ikke har. Vagten fastslår i stedet den stærkere egenskab, at den nuværende motor stadig gengiver hver udgivet værdi.

seg-c88647c5f2fc = SonarCloud-analyser blev registreret som <c1/>, så perioden for ny kode <c2/> aldrig rykkede frem: den var stadig forankret ved analysen den 2026-07-02, bedømte toogfirs dages arbejde som ét enkelt delta og målte { "7877" } "nye" duplikerede linjer mod en tærskel på { "3" } %. Scanningen sender nu cratets version. Den underliggende duplikering er reel og skjules ikke af dette: den er koncentreret i de deklarative <c3/>-registre, der gentages på tværs af <c4/>, <c5/>, <c6/>, <c7/> og <c8/>, og i verifikationstabellen med 168 rækker, og den nævnes her som arbejde i stedet for at blive udeladt af målingen.

seg-f2a0960a6f11 = <b><c1/> havde ingen lås for én skriver, og hver kørsel skrev den samme log.</b> Det er ikke pedanteri: kvitteringens <c2/>, <c3/> og <c4/> læses tilbage UD AF den log, og pre-push-hooken stoler på kvitteringen. En gate, der var dræbt, men hvis testbinær stadig var i live, blev ved med at skrive ind i den fil, den næste kørsel netop havde afkortet, så en kørsels tal kunne være blevet taget for en anden kørsels og give tilladelse til et push på grundlag af en suite, der aldrig kørte på det træ, der blev pushet. Der er nu én gate pr. checkout (den afviser med exit { "75" } ved siden af en levende og rydder en forældet lås, hvis pid er væk) og én log pr. kørsel, med <c5/> opdateret fra den afsluttende kørsel på vej ud. Begge retninger er testet: en levende pid afvises, en død ryddes.

seg-687d6fe87221 = <c1/> påstod, at dens tests "do <b>not</b> prove the named test/oracle strings resolve to live code". To vagter gør nu netop det, så moduldokumentationen sagde det modsatte af sandheden; den angiver nu, hvad der kontrolleres maskinelt, og hvad der overlades til menneskelig vurdering. En forældet henvisning til <c2/>, hvor modulet er <c3/>, er rettet i søstervagtens egen dokumentation.

seg-014070f0873c = <b><c1/> blev omskrevet den 2026-09-22 og force-pushet.</b> Ti commits blev til fire. Omskrivningen slog hvert commit, der efterlod en gate rød, sammen med det commit, der ryddede den, så hvert commit på <c2/> nu har et træ, der består, og fjernede de annullerede kørsler, som en samtidighedsgruppe for hele grenen havde efterladt på hvert erstattet commit.

seg-b48d6cfc3b42 = Intet blev kasseret. Commits fra før omskrivningen kan stadig nås gennem de tags, der peger på dem, og det endelige træ er byteidentisk med det træ, omskrivningen startede fra; <c1/> mellem den gamle spids og den nye er tom bortset fra de tre arbejdsgangsfiler, som denne udgivelse ændrer.

seg-0549cfdc6d69 = De erstattede SHA'er, til alle der har en reference til en af dem:

seg-14812deb1b6b = gammel

seg-c63f549e6a1d = emne

seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

seg-9c220336c895 = <b>Tagsene { "v0.27.0" } og { "v0.27.1" } blev bevidst IKKE flyttet.</b> De peger stadig på <c1/> og <c2/>, de nøjagtige commits, hvis træer frembragte de artefakter, der nu ligger på crates.io, npm, PyPI, ghcr.io og MCP-registret. Et cratets <c3/> registrerer den sha1, det blev pakket fra, registries er uforanderlige, og SLSA-attesteringen af byggeproveniens på aktiverne i udgivelsen { "v0.27.1" } er bundet til det commit. Hvis tagsene var flyttet, ville hvert af de udgivne artefakter have peget på et commit, der ikke længere findes. At lade dem stå holder de gamle commits tilgængelige og hver udgivet provenienskæde opløselig, til prisen af to tags, der ikke længere er forfædre til <c4/>; derfor findes denne udgivelse: { "v0.27.2" } giver <c5/> et tag af sit eget, pakket fra et commit, der ligger på den.

seg-3c644384256f = Dette er den anden offentliggjorte omskrivning af denne historik; den første, den 2026-09-21, gjorde forfatterskab kanonisk og er optegnet i noterne for { "0.27.0" } med dens egne to hængende crate-sha1'er. En omskrivning offentliggøres her hver gang, for et repository, der sælger verificerbar proveniens, kan ikke i det skjulte flytte grunden under et udgivet artefakt.

seg-d82d7a3c9054 = Det udgivne crate kompilerede ikke.

seg-ebc99c9df1ef = <c1/> indeholder en <c2/> på øverste niveau af <c3/>, og manifestet udelukker <c4/> fra pakken, så den tarball, crates.io modtager, manglede en fil, som biblioteket selv indlejrer. Udgivelsen af { "v0.27.0" } fejlede sin verifikationsbuild af den grund, og ingen { "0.27.0" } nåede crates.io; npm og PyPI, hvis jobs ikke afhænger af den, udgav normalt. Udelukkelsen har nu en undtagelse for netop det ene katalog.

seg-6ff9cdb976e8 = Hver anden <c1/> af en fixture i <c2/> ligger inde i et <c3/>-modul og når derfor aldrig det pakkede bibliotek. Kun en på øverste niveau gør.

seg-7f0975453b8f = <b>Intet i CI kørte <c1/>,</b> og derfor blev en tarball, der ikke kan kompilere, først opdaget af udgivelsesjobbet, efter at to andre registries allerede havde leveret. Et <c2/>-job bygger og kompilerer nu den nøjagtige tarball ved hvert push.

seg-1f2df48821fc = Fastlåsningerne af emissionen for månereferencesystemets realisering flytter sig ikke længere ved en versionsforhøjelse. SVG-sidefoden bærer motorversionen, så hver udgivelse re-baselinede tre hashes, to gange på én dag, og en fastlåsning, der tages om af rutine, holder op med at blive læst. Versionsstrengen normaliseres til en pladsholder før hashing, og emissionen kontrolleres separat for at angive den kørende version, så det forhold kontrolleres mere præcist, end hashen nogensinde kontrollerede det.

seg-56309487ea7e = <c1/>, datummet for månereferencesystemet fra en ægte observationskampagne.

seg-966a2cc4e40d = <c1/> erstattede en indsprøjtet Helmert-transformation med en <em>simuleret</em> kampagne og sagde det: dens stationsnetværk, dens tidsplan og dens sigma pr. observation er illustrative input. Dette scenarie fjerner simuleringen fra de to steder, hvor en tidsplan og en fejlmodel indgår i svaret. Epokerne er afsendelsestiderne for { "337" } arkiverede ILRS-normalpunkter for månelaserafstandsmåling (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } og Matera MLRO { "7941" }, alle fem retroreflektorarrays), og hver observationsvægt er det normalpunkts egen arkiverede præcision, <c2/>, en median på { "5.13" } mm envejsafstand, taget ud af filen og ikke valgt her. Stationskoordinaterne kommer fra IERS ITRF2020 og reflektorkoordinaterne fra JPL DE430 Tabel { "7" }; hver fixture registrerer en URL, en hentedato og en SHA-256 og genereres igen fra sin kilde af en committet generator, der verificerer kilden og afbryder frem for at udsende et tal. Rapporten nævner, hvilke forbindelser der er målt, og hvilke der stadig er modelleret, og de modellerede er <em>målt</em>: den observerede minus beregnede envejsafstand over de rigtige data er { "156 494" } m RMS, hvilket det samme testsæt bekræfter mod JPL Horizons over det samme tidsrum ({ "195 655" } m RMS-vektor, værste epoke { "0.054" }° — inden for de ~{ "0.3" }°, som den indbyggede analytiske måneserie hævder for sig selv). Additivt: en ny slags, en ny læser (<c3/>) og et nyt modul (<c4/>); de eksisterende pakker til månereferencesystemet er fastlåst bit for bit.

seg-7fcd2af0a688 = <b><c1/> som scenarieparameter</b> på <c2/> og <c3/>. Nøjagtigheden af afstandsmåling i signalrummet var en konstant på kompileringstidspunktet (<c4/>), så et sweep af servicevolumen kun nogensinde kunne svare bestået/ikke bestået ved én fast værdi. Beskyttelsesniveauer er nøjagtigt lineære i den, så når den eksponeres, bliver sweepet til et <b>krav</b> til nøjagtigheden af afstandsmåling over hele volumenen. Standarden gengiver den tidligere adfærd bit for bit.

seg-c3ccc1e89a2d = <b>Eksport af geometri pr. satellit</b> på <c1/>: <c2/> + <c3/> tilføjer et <c4/>-array, der giver azimut, elevation og skråafstand til hver satellit ved hver epoke for ét navngivet selenografisk sted, plus synlighedsflaget. Den samlede dækningsoversigt slår med vilje geometrien pr. satellit sammen, men skråafstand er netop det, et linkbudget bruger, så en fælles kommunikations- og navigationsanalyse kunne ikke udføres ud fra oversigten alene. Slået fra, medmindre begge koordinater er angivet; rent additivt.

seg-ae7886fbca9d = <c1/>, den offentlige hjælpefunktion for synsvinkler bag eksporten.

seg-b187bade5f04 = En række i verifikationsmatrixen for den nye geometrifunktion.

seg-14ef785b6c12 = <b>Det rigtige antennemønster i geometrieksporten.</b> Motoren har haft et mønster for en cirkulær blænde med ensartet belysning siden P1 (<c1/>, Airy-formen <c2/>), og <b>intet uden for <c3/> brugte det</b>; i stedet gjorde en boresight-forstærkning parret med en tommelfingerregel fra forstærkning til strålebredde arbejdet. En valgfri <c4/>-tabel på <c5/> (læses kun, når eksportstedet er sat) giver nu hver eksporteret række <b>vinklen uden for boresight ved satellitten</b> og <b>sendeforstærkningen mod stedet fra det mønster</b> og tilføjer en <c6/>-blok, der rapporterer <b>antallet i strålen under det rigtige mønster ved siden af antallet i strålen under den symmetriske tilnærmelse</b> (<c7/>) med forskellen som en navngivet korrektion. Begge tal udskrives; ingen af dem erstatter den anden. Målt ved motorens egen repræsentative månebrændvidde ({ "1" } m parabol, { "2.4" } GHz, η = { "0.60" }) over et sted ved sydpolen og den illustrative skal af LCNS-klassen <b>afviger de to med mere end én satellit</b>: det rigtige mønster placerer { "0" } af { "76" } synlige forbindelser inde i halveffektstrålen, tilnærmelsen påstår { "28" }, en korrektion på −{ "2.33" } satellitter pr. epoke, værste enkelte epoke { "3" }. Tilnærmelsen bærer sin egen blændeeffektivitet ({ "0.641" } mod den <c8/>-graders regel, den normalt citeres med, { "0.920" } mod en ensartet cirkulær blænde), så på en parabol med η = { "0.60" } returnerer den en stråle, der er { "1.238" }× for bred; blokken udskriver begge de underforståede effektiviteter i stedet for at overlade dem til at blive udledt. Rent additivt: målt over det dokumenterede arbejdspunkt { "597" } eksisterende blade, <b>{ "0" } ændret, { "0" } fjernet, { "494" } tilføjet</b>.

seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> og <c7/>, de offentlige dele bag. Mønsteret er også nu forankret mod de udgivne Airy-konstanter og ikke kun mod sig selv: halveffektskrydsningen findes ved bisektion og sammenlignes med <c8/>, hvilket gør den nøjagtige halveffektsbredde til <c9/> og redeligt registrerer, at den konventionelle koefficient <c10/> placerer <c11/> ved <b>−{ "2.955" } dB</b>, ikke −{ "3.010" } dB.

seg-bac7217bb128 = <b>En reproducerbarhedstabel i langt format for <c1/>.</b> Scenariets array-værdier outputs, gitteret over middelingstider, de syv kurver <c2/> pr. led og deres samlede rod-sum-kvadrat, nåede kun frem til brugerne som JSON-arrays. En udgivet tabel blev afkortet ved { "400" } tegn og udgav { "23" } af sine { "57" } middelingstider under en kolonne, der påstod at indeholde dem alle, og manuskriptet genopbyggede kurverne pr. led ud fra lukkede former, fordi motoren aldrig udskrev dem. En almindelig kørsel skriver nu også <c3/> med én række pr. (gitterindeks, middelingstid, led), som ikke kan afkortes til noget, der stadig ligner det hele. Gitterindekset er en nøjagtig sammenføjningsnøgle; <c4/> skrives med { "13" } betydende cifre og hver <c5/> med { "7" }, så bytes ikke forgrener sig mellem builds af den samme kilde. Rent additivt: rapport-JSON'en er byteidentisk.

seg-ab9209297ec2 = <b>Rapporten for <c1/> beskriver nu sig selv.</b> En <c2/>-blok gentager de opløste linkinput (bærebølgens bølgelængde, sende- og modtageblænde, afstand, pulsbredde, integrationstid, effektiviteter og tab) med standarder anvendt, så en artikel angiver den konfiguration, den kørte ved, i stedet for at citere en standard læst ud af kilden. En <c3/>-blok angiver enhed og proveniensklasse for hver størrelse, en artikel sandsynligvis citerer. Sporene af overdragelseskovariansen er grunden til, at den findes: de blev udskrevet som en bar <c4/>, og et manuskript udledte kvadratmeter ud fra en intern konsistenskontrol. Udledningen var rigtig, og netop derfor var det en defekt: intet ville have fanget, at den var forkert. Rent additivt: målt på tværs af fire konfigurationer { "456" } eksisterende felter, <b>{ "0" } ændret, { "0" } fjernet, { "196" } tilføjet</b>.

seg-5c810155300c = En række i verifikationsmatrixen for tidsbudgettets reproducerbarhedstabel, redeligt <c1/> / <b>MODELLED</b>: totalen kontrolleres mod rod-sum-kvadratet af leddene i den samme fil, som deler motorens egne leddefinitioner og derfor ikke er en uafhængig reference. Tilsammen tilføjer disse tre rækker. Den løbende total for dette uudgivne afsnit er <b>{ "168" } rækker — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

seg-ed290a85ab0e = <b>Commit-forfatterskab i hele historikken er nu én enkelt identitet, og to udgivne crates peger på et commit, der ikke længere findes.</b> Den 2026-09-21 blev git-historikken omskrevet, så hvert menneskeligt commit er forfattet og committet af <c1/>. Det bar tidligere tre stavemåder af én person: { "688" } commits som <c2/>, { "34" } som <c3/> og { "94" } allerede kanoniske. Det ene <c4/>-commit blev bevidst efterladt som sin egen forfatter: at omdøbe en bots afhængighedsopdatering ville påstå forfatterskab af arbejde, ingen her har udført.

seg-ec4e75f94462 = <b>Intet indhold ændredes.</b> Omskrivningen rørte kun forfatter- og committer-headere, og det kan kontrolleres frem for blot at påstås: træet for hvert tag og hver gren er bitidentisk med det, det var før. <c1/> opløses stadig til træet <c2/>, nøjagtigt som før.

seg-bc0f4fa0a009 = <b>Hvad det kostede.</b> Et commits navn er en hash over dets træ, dets forældre og dets forfatterheadere, så ændring af en forfader omdøber hver efterkommer. Udgivelsescommittet <c1/> var <c2/> og er nu <c3/>. To artefakter registrerede det gamle navn ved udgivelsen og kan ikke rettes, fordi en udgivet registry-version er uforanderlig ved design:

seg-52e096332738 = <c1/> { "0.26.0" } på crates.io — <c2/> registrerer <c3/>

seg-8ec39d2f136c = <c1/> { "0.26.0" } på crates.io — den samme sha1, <c2/>

seg-9a21b7c7b41c = Intet andet er berørt. npm-pakken registrerer ingen <c1/>, og PyPI-distributionen registrerer slet intet commit; begge dele blev kontrolleret frem for antaget.

seg-9c51c5fb0d80 = Der findes ingen reparation, der får <c1/> til at nævne det omskrevne commit: den streng <em>er</em> den gamle afstamning, og den eneste måde, den opløses på, er at beholde den udgivne historik fra før omskrivningen, hvilket ville genskabe det forfatterskab, omskrivningen fjernede. Proveniens for { "0.26.0" } går derfor gennem tagget og ikke gennem den registrerede sha1, og tagget leverer de identiske bytes, craten blev bygget fra. Den næste udgivelse registrerer et gyldigt commit uden behov for handling.

seg-30ecea86118a = <b><c1/> brugte som standard en EOP-fil uden prædiktionsrækker (G12).</b> Scenariet indlejrede et uddrag af <c2/> med fem rækker, <em>kun endelige</em>, som sin standard uden net, så en bar kørsel rapporterede <c3/>, og tabellen pr. horisont hvilede på { "5" }, { "4" }, { "3" } og { "2" } par. Motoren kunne altid læse en prædiktionsrække; inputtet havde simpelthen ingen. Standarden er nu det ordrette IERS-uddrag for { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } endelige fra Bulletin B og <b>{ "12" } Bulletin A-rækker med kun prædiktion</b>, så en bar kørsel uden filargument og uden net rapporterer <c5/> og en tabel pr. horisont ved n = { "20" } / { "31" } / { "30" } / { "29" }, og sammenligningen med den operationelle prædiktor og enigheden mod produktets egne udgivne prædiktioner udfyldes også. Det langvarige uddrag med 45 rækker blev målt som alternativet og afvist: det er også kun endeligt, så det ville have efterladt <c6/> på { "0" }. <b>Dette flytter udgivne tal</b>, under regel R4 og med stifterens bemyndigelse: ti af de { "22" } celler i den udgivne <c7/> og { "24" } af de { "42" } udfyldte celler i <c8/>. Det målte polgulv for hurtig minus endelig bliver { "0.0678" } mas (fra { "0.0769" } mas), hvilket er den værdi, artiklen P4's egen tabel over polbevægelse allerede udgiver ved n = { "20" }; de to stemmer nu overens i stedet for at afvige med { "13.5" } %. Hvert andet tal, P4 udskriver fra denne tabel, er uændret ved den udskrevne præcision. Den fulde opregning gammel → ny, inklusive de felter, der <em>ikke</em> flyttede sig, står i <a1><c9/></a1>. Uddraget med kun endelige leveres stadig, er fastlåst på bytes og anvendes: et antal prædiktionsrækker på nul i det er filens egenskab, og en test beviser det stadig.

seg-17fbc566dc5b = <b>En forældet satellitbegrænsning i <c1/>.</b> Scenariet begrænsede <c2/> til { "12" }, selv om dets egen konstellationsbygger understøtter { "24" }, og en test hævder { "24" }, så hvert ønsket antal over { "12" } blev stiltiende reduceret, og et sweep over satellitantallet gav identiske værdier over { "12" }, umuligt at skelne fra ægte geometrisk mætning. Nu begrænset ved byggerens grænse. Det er en adfærdsændring kun for <c3/>.

seg-4df7d4d61b40 = Den samme forældede begrænsning i <c1/>.

seg-8adfbd27c4f8 = <c1/> begrænsede <c2/> til { "12" } med samme konsekvens, og denne nåede en udgivet tabel: <c3/> har en <c4/>-række, der er byteidentisk med sin <c5/>-række, fordi motoren returnerede et svar for tolv satellitter under en etiket for seksten satellitter. Nu begrænset ved byggerens grænse på { "24" }, og en ny test fastlåser det: hver større konstellation skal både rapportere sit eget antal og strengt forbedre beskyttelsesniveauet, så begrænsningen ikke kan vende tilbage ubemærket. <b>Dette flytter udgivne tal</b>: beskyttelsesniveauet for <c6/> bliver { "16.92" } m → { "14.57" } m. Sweepet til { "24" } er kurven strengt monoton ({ "11.94" } m ved { "24" } satellitter, { "29.5" } % bedre end ved { "12" }), så der er ingen mætning ved { "12" }; det tilsyneladende plateau var begrænsningen. Adfærdsændring kun for <c7/>.

seg-ebee158b73c8 = En udgivelse om dokumentation, gennemsigtighed og legeplads. Ingen motoradfærd ændres: verifikationsmatrixen står på <b>{ "102" } rækker — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, uændret fra { "0.25.0" }.

seg-7af422ed6d89 = <b>Rustdoc på crate-niveau</b> (<c1/> i <c2/>), der dækker indgangspunkter, modellen for ærlighed og evidensniveauer og reproducerbarhed, så docs.rs åbner på en rigtig landingsside i stedet for en bar modulvæg.

seg-dd44c25f3af5 = <b><c1/></b>: en reference pr. slags for alle <c2/> scenarieslags, genereret fra <c3/> (den eneste sandhedskilde) af <c4/> og vogtet af <c5/>, så den ikke kan glide væk fra dispatcheren.

seg-e2cc77d3b413 = <b>Moduldokumentation</b> for de { "11" } tidligere udokumenterede offentlige moduler (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

seg-8d156713799d = <b>Litteraturkilder</b> til fem formelmoduler, der angav en ligning, men ikke nævnte nogen reference: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

seg-832b4bfbc48a = <b>En udgivet <c1/></b> på kshana.dev til koordineret offentliggørelse af sårbarheder.

seg-30603f59e27d = <b>Valideringsniveau pr. kørsel på legepladsen.</b> Tabellen over kvalitetsmål for en enkelt kørsel bærer nu en VALIDATED/MODELLED-pille pr. tal, læst fra det samme <c1/>-opslag, som den downloadbare rapport bruger (spejler <c2/>, selv afledt af verifikationsmatrixen), så det niveau, der vises ved siden af et levende tal, aldrig kan være uenigt med registret.

seg-93b203f3a1c0 = <b><c1/></b> i legepladsens menu: alle { "50" } slags, der kan dispatches, er nu ét klik væk (var 49/50).

seg-1ec0830db404 = <b>Fem flere funktionskort, der kan køres</b> (rumvejr, evaluering af RF-forstyrrelser, robusthed, CCSDS OEM-interoperabilitet, KIF), hvilket løfter antallet af kort, der kan køres, fra { "11" } til { "16" }. Kort, der kun gælder API og bibliotek, beholder et redeligt dokumentationslink i stedet for en falsk kør-knap.

seg-977ea074dd9d = Dokumentationsdækningen ratcheteres nu i CI.

seg-beb308bcaafb = <c1/> kompilerer biblioteket med <c2/>, tæller advarslerne og fejler kun, hvis antallet stiger over et fastlåst loft ({ "986" }). En hård <c3/> under <c4/> ville have gjort ~{ "1000" } i øjeblikket udokumenterede offentlige elementer til et byggebrud natten over; på denne måde fejler nye udokumenterede offentlige elementer buildet, mens den eksisterende bunke betales ned bevidst.

seg-27668072a608 = <b>MCP-værktøjets række <c1/> reklamerede for "~{ "17" } built-in scenario kinds"</b>, mens <c2/> i nogen tid havde eksponeret { "50" }: et agentvendt dokument, der underdrev den reelle funktion tre gange. Fastlåst til det sande antal.

seg-1ffc9f9816e8 = Genererede formatkontrol-referencen for CycloneDX-SBOM'en igen for den opdaterede afhængighedsgraf ({ "60" } komponenter). Resultatet af formatkontrollen er uændret: nul normaliserede skemafejl, og hvert atomart licens-id er stadig i den officielle SPDX-opregning.

seg-a6db590bbcbe = <b>Fem funktioner løftet til eksternt VALIDATED</b>, hver nu krydskontrolleret mod en uafhængig tredjepartsimplementering af den samme entydigt definerede størrelse (ikke-cirkulært, med fixtures der kan genereres igen offline):

seg-98588143b4bb = <b>Omregning fra IEEE-1139-potenslov til Allan-deviation</b> mod lukkede former i <c1/> for alle fem støjtyper (<c2/>);

seg-ce37d70fa8bc = <b>CRPA MVDR / vægte for minimumsnorm-nulstyrende stråleformer</b> mod numpy/scipy LAPACK (<c1/>);

seg-0f033d1027f8 = <b>Wahba / TRIAD / QUEST attitudebestemmelse</b> mod SciPys SVD <c1/> på støjfri observationer (<c2/>);

seg-e1e2283cb524 = <b>CCSDS { "502.0" } OEM-udveksling af kovariansblokke</b> kørt rundt gennem den uafhængige <c1/>-parser (<c2/>);

seg-579eefbb646f = <b>kernen for detektionsstatistik ved kvadratlovsoptagelse</b> (generaliseret Marcum-Q / P_d / P_fa / tærskel) mod SciPy <c1/>/<c2/> (<c3/>). Den maskinkontrollerede valideringsmatrix flytter sig til <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> på tværs af <b>{ "102" } rækker</b> (var { "51" } · { "47" } · { "4" }). Redelige forbehold om omfang er bevaret, f.eks. dækker løftet af optagelse kun kernen for detektionsstatistik; CFAR/straddling-tab forbliver MODELLED.

seg-b6a140d55580 = <b>Kvalitetsmål i positionsdomænet</b> (<c1/>): nøjagtig CEP, SEP og 2DRMS ud fra en navigationsløsnings 3D ENU-positionskovarians plus et horisontalt beskyttelsesniveau. CEP/SEP er de <em>nøjagtige</em> mediane radiale fejl (ikke den lineære regel <c2/>), krydskontrolleret mod kvantiler for rayleigh/maxwell i <c3/> og en uafhængig median fra en NumPy-Monte-Carlo (<c4/>). Erstatter den tidligere redelige stub, der ikke var implementeret; <b>funktionssignaturen ændredes</b> fra <c5/>, der returnerede en fejl, til <c6/>, der returnerer en <c7/>.

seg-1551afa17154 = <b>Ækvivalente frihedsgrader (EDF) for konfidensintervaller er gjort færdige for alle estimatorer i Allan-familien</b> (<c1/>): EDF for modificeret Allan, Hadamard og total varians bruger nu Greenhall & Rileys kombinerede EDF-algoritme og formen TOTVAR fra tabel 7 i NIST SP { "1065" } (tidligere var kun EDF for overlappende Allan implementeret; de andre genbrugte den stiltiende), krydskontrolleret mod <c2/> <c3/>/<c4/> (<c5/>).

seg-39753e7919cc = <b>Uafhængige eksterne krydskontroller for månens PNT-geometri, DOP, EOP, DRO og RF-afstandsmåling</b> (<c1/>, med fixtures og referencegeneratorer under <c2/>). Hver kontrol kører en allerede leveret <b>modelleret</b> funktion mod en reference, der er frembragt af en <em>anden</em> implementering, så enigheden er ikke-cirkulær: den orbitale sende-/optagelsesfodaftryk mod <c3/> (Cephes, en reelt anden Bessel J1); DOP for overfladebøjers geometri mod en uafhængig NumPy-løsning af <c4/>; væksten i prædiktionsfejl for UT1/EOP-persistens mod en separat NumPy-genparsning af de samme ordrette IERS-rækker i <c5/>; den plane familie af distant retrograde baner mod NASA/JPL's Three-Body Periodic Orbit Database; og præcisionsbudgettet for RF-afstandsmåling mod en reference ud fra første principper. Disse er yderligere regressionsevidens for eksisterende moduler; at tilføje disse krydskontroltests omdøber ikke i sig selv nogen funktion (de fem løft ovenfor er separate, referencestøttede statusændringer i <c6/>).

seg-662c04f0552f = <b>Scenariet <c1/></b> (<c2/>, <c3/>): en sammensat, binærnåbar (CLI / Python / MCP / wasm via <c4/>) P1-kørsel af månens signalsikkerhed, der sammenstiller effektunderskuddet i linkbudgettet og dets følsomhedsbånd på { "12" }–{ "18" } dB, den krævede sendeeffekt for jam/spoof mod afstand, det orbitale optagelsesfodaftryk under et rigtigt antennemønster, udfaldet af indtrækning ved spoof-optagelse i sporingsløkken, rækkevidden til horisonten på et legeme uden atmosfære og budgettet for OSNMA/TESLA-autentificering. Et tomt indhold gengiver P1-baselinen.

seg-a9b7ee942a23 = <b>Følsomhedsbånd for effektunderskud</b> (<c1/>, <c2/>): et ægte sweep over flere akser (reference × EIRP × skråafstand) bygget på <c3/> og evalueret gennem <c4/>, der gengiver P1-båndet på { "12" }–{ "18" } dB og afstemmer de lineære faktorer { "32" }× (afrundet) / { "36" }× (uafrundet).

seg-0734a4ca7535 = <b>Tredimensional spoof-optagelseskube</b> (<c1/>): tilføjer aksen for bærebølge-/Doppler-forskydning til optagelseskortet (J/S × kodeforskydning × bærebølgeforskydning, låsetid pr. celle); snittet med nul bærebølge reduceres nøjagtigt til den 2-D <c2/>.

seg-3b9bbc25b114 = <b>Detektion i et spredt monitornetværk</b> (<c1/>) sammensætter nu den fysiske AGC-statistik fra <c2/> og det selenografiske synlighedsgitter fra <c3/> til at udlede hver stations detektionsstatistik og geometri, i stedet for frie parametre og et ad hoc-overlap langs storcirkler; sandsynlighederne for detektion pr. monitor og for netværket er stadig de lukkede former med chi-kvadrat/Marcum-Q fra <c4/>. <b>Felterne <c5/> / <c6/> ændredes</b> til fysiske størrelser (bredde/længde/højde/effekt).

seg-54c36267382c = <b>Dimensionering af overhead ved OSNMA/TESLA-autentificering</b> (<c1/>): OSNMA-feltandelene pr. side (8-bit HKROOT + 32-bit MACK pr. side på { "2" } s) var fejlmærket som totaler pr. subframe, hvilket underdrev overheadet { "15" }× ({ "1.33" } bit/s). Rettet til de udgivne totaler pr. subframe på 30 s i SIS-ICD (HKROOT { "120" } + MACK { "480" } bit ⇒ <b>{ "20" } bit/s</b>). Konsekvensen angives nu redeligt: ved en navigationsrate for AFS på { "50" } bit/s er overheadet for autentificering en <b>førsteordens omkostning på ≈{ "40" } %</b>, ikke nogle få ubetydelige procent; feltet <c2/> er dokumenteret som forsinkelsen af nøgleafsløring (en nedre grænse for tiden til første autentificerede positionsbestemmelse fra ende til ende).

seg-0cf179a34252 = En bred funktionsudgivelse. Den leverer to fuldt <b>eksternt validerede</b> analysesuiter, en komplet familie til <b>multikriterie-beslutningsanalyse (MCDA)</b> og estimatorerne for <b>Allan-wander / langtids-τ urstabilitet</b>, og åbner et nyt lag af scenarier, der kan køres, for <b>månens tidsbudget, EOP/referencesystem i realtid, hybrid optik/RF, cislunar observerbarhed og lagdelt PNT-robusthed under konflikt</b>, oven på substratet, plus et substrat af funktioner for <b>månebøje på overfladen</b> og <b>signalsikkerhed</b>. Den maskinkontrollerede valideringsmatrix vokser til <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> på tværs af <b>{ "102" } rækker</b> (var { "40" } · { "47" } · { "4" } på tværs af { "91" }): alle elleve nye rækker er eksterne referencevalideringer af estimatorerne for beslutningsanalyse og tidssynkronisering, kontrolleret mod uafhængige biblioteker (SciPy, pymcdm, pyDecision, allantools) til stram tolerance, mens den nye PNT-funktionsflade redeligt vises som MODELLED. Som altid opgraderes ingen numerisk modelpåstand uden et eksternt datasæt bag sig.

seg-267e50f8dd56 = <b>Scenarier, der kan køres</b>: hvert et registreret scenarie <c1/>, dispatchet gennem motoren og bevist fra ende til anden i CI af <c2/> (som kører hver medfølgende <c3/> og fejler hårdt på enhver fixture, der ikke kan køres):

seg-c87fc11dd86b = <b>Lagdelt PNT-robusthed under konflikt</b> (<c1/>, <c2/>): en seedet Monte-Carlo-motor for robusthed i en PNT-arkitektur med flere lag, med en <b>overlevelsesmodel for yndefuld nedbrydning pr. vektor</b> i §{ "4.2" } (fire navngivne trusselsvektorer, den lukkede form for overlevelse af anvendelig PNT, som hver Monte-Carlo pr. lag konvergerer mod, udskrevet i resultat-JSON'en) og dokumenteret, mod afdrift vogtet proveniens for trusselsparametre (<c3/>). MODELLED arkitekturer; konvergensen fra overlevelses-Monte-Carlo mod lukket form er den validerede kerne.

seg-9c69e4d8ade9 = <b>Cislunar observerbarhed</b> (<c1/>, <c2/>): et egenspektrum for observerbarhedens Gramian over en bue, en differentialkorrigeret frø-generator for distant retrograde baner (DRO) og en uafhængig krydskontrol med kvadratrodsinformationsfilter, hvis posteriore kovarians bliver endelig netop ved fuld observerbar rang. MODELLED konstellation; invarianterne for rang/Gramian/STM/SRIF er den validerede kerne.

seg-92fb333483e5 = <b>Heterogen kontinuitet og integritet i hybrid optik/RF</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>): tilgængelighed og integritet på tværs af domæner, når optisk og RF-PNT kombineres. MODELLED.

seg-08e2f640ae14 = <b>Endogent tidsbudget for månen</b> (<c1/>, <c2/>) og <b>budget for referencesystem / EOP i realtid</b> (<c3/>, <c4/>, <c5/>): tids- og jordorienteringsbudgetterne P3/P4 for månen, udledt endogent af tidskæden i stedet for påstået. MODELLED.

seg-52c2f9c2c9a7 = <b>Eksternt validerede analysesuiter</b>: biblioteksfunktioner, der hver kommer ind i matrixen som nye VALIDATED rækker (kontrolleret mod en uafhængig ekstern reference, ikke en selvkontrol):

seg-709789e8fb04 = <b>Fuld suite til multikriterie-beslutningsanalyse (MCDA)</b> (<c1/>): de fire metodefamilier: værdiaggregering (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), ratiosystem (<b>MOORA</b>) og proportional (<b>COPRAS</b>), afstand til idealet (<b>TOPSIS</b>), kompromisprogrammering (<b>VIKOR</b>) og outranking (<b>PROMETHEE II</b> med seks former for generaliseret kriterium, <b>ELECTRE I</b> konkordans/diskordans), plus <b>AHP</b> med prioritetsvægte fra Perron-egenvektoren og Saatys gate for konsistensforhold (CR < { "0.10" }), <b>MAUT</b>-nytte, udtræk af Pareto-front og analyse af vægtenes <b>følsomhed</b>. De ni aggregatorer gengiver <b>pymcdm</b> / <b>pyDecision</b>, og AHP-egenvektoren stemmer med SciPy/LAPACK, alt til < { "1e-9" } (<c2/>). Følsomhedstornadoen vises også inde i scenariet for robusthed under konflikt.

seg-2ce49cbfd8bf = <b>Estimatorer for Allan-wander og langtids-τ urstabilitet</b> (<c1/>): <b>MTIE</b> (den peak-to-peak-statistik for tidsfejlswander i ITU-T G.810/G.823/G.8261, som synkroniseringsmasker er skrevet mod), <b>MDEV</b> og <b>TDEV</b> som wander i tidsdomænet og <b>Theo1 / TOTVAR</b> som estimatorer med udvidet rækkevidde. VALIDATED mod <b>allantools</b> på serien i NIST SP { "1065" }; den biasfjernede hybrid <b>ThéoH</b> bygget på TOTVAR forbliver redeligt MODELLED.

seg-68bcdf8bd5de = <b>Sikringsværktøj med ekstern reference</b> (<c1/>): et referenceværktøj koblet direkte til CI-gaten for ærlighed, en <b>W3C-PROV</b>-proveniensoptegnelse med en deterministisk Merkle-rod og <b>Greenhall</b>-ækvivalente frihedsgrader + chi-kvadrat-konfidensintervaller på stabilitetsestimater.

seg-dcb91813b24c = <b>Udvidelsessømmen PackRegistry / ExternalPack</b> (<c1/>, <c2/>): en dispatch-søm, så funktionspakker rutes gennem ét register (indbygget dispatch ligger på CLI'ens hot path; pakker uden for træet kobles på bag et <c3/> med standard), vogtet af en golden-testsuite for byteidentitet og standalone-/wasm32-CI-gates.

seg-16b1f5d249ed = <b>Modelleret funktionssubstrat</b>: nye biblioteksmoduler, der fødes ind i scenarierne ovenfor og kommende (endnu ikke et selvstændigt scenarie <c1/>):

seg-f8c9ffbc56cf = <b>DOP for månebøje på overfladen</b> (<c1/>) med budget for realiseret nøjagtighed, sweep over N satellitter og GDOP-kort, plus en forstyrret månefemeride (<c2/>) og geometri for horisont uden atmosfære / invers spoof-effekt / underskudsbånd for AFS (<c3/>, <c4/>). Genbruger den med gnss_lib_py validerede DOP-kerne.

seg-28209a2747d5 = <b>Indlæsning af DEM i LOLA-format</b> + sigtelinje over terræn (<c1/>).

seg-6e98ac90a0e2 = <b>Signalsikkerhedens forsvar i tre lag</b>: spoof-optagelse, krydssensor-integritet og dimensionering af monitornetværk (<c1/>, <c2/>, <c3/>) med et antennefodaftryk for orbital stråle og et budget for OSNMA-autentificering (<c4/>, <c5/>). MODELLED.

seg-bd5b9511accb = Valideringsmatrixen og alle afledte artefakter blev genereret igen fra den eneste sandhedskilde (<c1/>): registret på siden, diagrammerne over modulkort og valideringsproveniens og README'ens/de enkelte fladers antalsstrenge står nu på <b>{ "51" } / { "47" } / { "4" } af { "102" }</b> (var { "40" } / { "47" } / { "4" } af { "91" }); vagten for ærlighed i antal scanner nu hele git-historikken, og README'ens figurer er forenet på den mørke brandpalet.

seg-c2ec7e2b6296 = Én fælles adaptiv integrationsdriver understøtter nu både <c1/> og <c2/> (<c3/>) og fjerner den duplikerede stepper.

seg-85cfb0f10268 = Statisk analyse med <b>SonarQube Cloud</b> er føjet til CI (Rust + importeret dækning), med badges for rating af sikkerhed / vedligeholdelighed / pålidelighed på README'en.

seg-deeef8318367 = Disciplin for udgivelse / pakning: CI registrerer et udrulningsmiljø pr. udgivelse til pakke/registry, og det fokuserede offentlige standalone-job er holdt uden for de langsomme valideringsbinærer.

seg-30181148b098 = Hygiejnevagten mod angivelse af ophav er afgrænset til kun markører for forfatterskab, så navngivning af en integrationsvært eller et produkt ikke længere fejler buildet.

seg-6eb3868fdce0 = Dokumentation: README'ens afsnit <b>Citing</b> opregner nu de fire udgivne arXiv-preprints, og DOP-funktionen for overfladebøjer er dokumenteret i rækken for månen.

seg-d12533cbf1f2 = Heltalsløkketællere til løkker drevet af flydende tal (Sonar S2193).

seg-3c213354187f = Nøjagtig invers chi-kvadrat ved få frihedsgrader via Newton-forfinelse i stien for konfidensintervaller i sikringsværktøjet.

seg-386b7094d34d = kshana.dev: standardsektionen åbner nu som standard, og fallbacken for registerantallet er rettet; forældede strenge i README / siden omkring observerbarhedslaget er synkroniseret.

seg-33448f46894f = En funktionsudgivelse, der tilføjer et almindeligt <b>lag for Fisher-information / Cramér–Rao-observerbarhed og optimalt eksperimentdesign</b>, og den udgivelse, artiklen om månens PNT-observerbarhed hviler på. Den maskinkontrollerede valideringsmatrix vokser til <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> på tværs af <b>{ "91" } rækker</b> (var { "39" } · { "46" } · { "4" } på tværs af { "89" }): den nye estimationsmotor er kontrolleret mod en ekstern reference og er VALIDATED; dens anvendelse på månen er redeligt MODELLED. Som altid opgraderes ingen numerisk modelpåstand uden et eksternt datasæt bag sig.

seg-c377207026f4 = <b><c1/>: Fisher-information, Cramér–Rao-grænser og optimalt eksperimentdesign.</b> En almindelig, genbrugelig motor for estimationsteori: Fisher-informationsmatrixen <c2/> ud fra en målejacobian og vægte; en symmetrisk egenværdiløser (cyklisk Jacobi); den nedre Cramér–Rao-grænse via den inverse eller Moore–Penrose-pseudoinversen plus en basis for nulrummet, når informationen er rangdefekt (tilfældet med frit netværk / datumdefekt); og D-, A-, E- og T-optimale metrikker for eksperimentdesign med en <c3/>-vælger over kandidatgeometrier. <b>VALIDATED</b> mod NumPy (<c4/>/<c5/>) og Kays udgivne lukkede grænser ({ "1993" }) til { "1e-9" } (<c6/>), så den kommer ind i matrixen som en række med ekstern reference frem for en selvkontrol.

seg-91d09b4e737f = <b>Observerbarhed ved fælles banebestemmelse for månen</b> (<c1/> i <c2/>, vist på rapporten for månekombinationen): anvender FIM/CRLB-motoren på den fælles løsning for bane og ur for at blotlægge defekten i det absolutte stationsdatum, genoprettelsen af rangen, når stationer på Jorden som baseline tilføjes, den opnåede CRLB for stationens position og E-optimal konditionering. Redeligt <b>MODELLED</b>: estimationsmotoren er eksternt valideret, men det månenetværk, den anvendes på, er en repræsentativ simulering, og intet nuværende datasæt kan gøre den geometri til en måling.

seg-6b1cd00aca8c = <b>Repræsentativ geometri for elliptiske frosne månebaner (ELFO)</b> til scenariet for månekombination (<c1/>, <c2/>, <c3/>, <c4/>; cirkulær placering er stadig standard) og et observerbarhedsfelt uden VLBI på rapporten, så resultatet om datumdefekt kan vises at være geometriuafhængigt. Den samme stige { "3" }→{ "1" }→{ "0" } og tærsklen på tre stationer gælder på en ELFO i Moonlight/LCNS-familien, og med tre VLBI-baselines på Jorden er den absolutte stationsposition observerbar ved en grænse under en meter, fastlåst af <c5/>. Stadig MODELLED.

seg-9e6627c0c417 = Valideringsmatrixen og hvert genereret evidensartefakt blev genereret igen fra den eneste sandhedskilde (<c1/>): registret (<c2/>), <c3/>, <c4/>, figurerne for valideringsfordeling og referencetyper og README'ens antalsstrenge på tværs af alle distributionsflader står nu på <b>{ "40" } / { "47" } / { "4" } af { "91" }</b>.

seg-6f90233290a2 = En udgivelse, der kun gælder pakning. Ingen ændringer i motor, scenarier eller resultater; valideringsmatrixen er uændret på { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER på tværs af { "89" } rækker.

seg-9d41e1412d1f = npm-udgivelse: pakkens <c1/>, afledt af crate-manifestet, brugte GitHub-ejeren med forkert store og små bogstaver (<c2/>), hvilket fejlede npms sigstore-verifikation af proveniens (den sammenligner ejeren med forskel på store og små bogstaver). Manifestets <c3/> er nu den kanoniske version med små bogstaver, <c4/>, så den genererede <c5/> stemmer med proveniensens emne, og npm-udgivelsen udgives.

seg-fe1f8aae99f4 = Wheel-buildet fastlåser <c1/>, så manylinux-wheelen er bytereproducerbar på tværs af genopbygninger (reproducerbarhedskontrollen med genopbygning og diff).

seg-b87075b47007 = En konsolideringsudgivelse med fokus på <b>evidens, proveniens og disciplin i distribution</b>. Den maskinkontrollerede valideringsmatrix vokser til <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> på tværs af sine <b>{ "89" } rækker</b> (var { "15" } · { "42" } · { "4" } på tværs af { "61" }), drevet af krydsvalidering af modellerede funktioner mod uafhængige eksterne referencer. Hvert distribueret artefakt bærer nu en kryptografisk SLSA-attestering af byggeproveniens, leveres med en CycloneDX-SBOM og udgives i takt på tværs af alle flader. Ingen numerisk modelpåstand opgraderes uden et eksternt datasæt bag sig; ny funktion forbliver redeligt MODELLED.

seg-f6de783bfd29 = <b>Attitudedynamik</b> (<c1/>, MODELLED): drejningsfrie Euler-ligninger for stive legemer + kvaternionkinematik (RK4), med selvtests af bevarelseslove (kvaternionens norm, kinetisk energi, |Iω|, præcession for symmetrisk top).

seg-339bc18b9fc4 = <b>Krydsvalidering af modellerede funktioner</b> mod uafhængige eksterne referencer, der bringer valideringsmatrixen til { "39" } VALIDATED rækker, hver støttet af et eksternt datasæt (CI-gaten for ærlighed forbyder status VALIDATED uden et). De nyeste valideringer med ekstern reference: den <b>målte stabilitetskurve for optiske ure</b> (tilpasningen af ADEV-kurven i <c1/> gengiver den udgivne σ_y(τ) for det optiske gitterur med ⁸⁸Sr fra Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, medfølgende under <c2/>); <b>generering af spredningskode for GPS L1 C/A</b> (G1/G2-LFSR'en i <c3/> gengiver kodefase-oktalerne i tabel 3-Ia i IS-GPS-200 for PRN { "1" }–{ "9" }); og <b>SRTM-læseren af digitale højdemodeller på rigtigt terræn</b> (<c4/> læser en medfølgende SRTM v3-flise fra NASA/USGS i public domain, N36W117 / Death Valley, og placerer Badwater Basin inden for dets dokumenterede opmålingsbånd).

seg-665d0dde637b = <b>Nye MODELLED funktioner</b>, hver internt krydskontrolleret mod en lukket form eller en søster-kodesti: relativ bevægelsesdynamik efter Clohessy–Wiltshire / Hill, passiv geolokalisering af sendere med TDOA/FDOA, attitudebestemmelse med Wahba/TRIAD/QUEST, løsning af heltalsmultiplicitet i GNSS-bærebølgefase (LAMBDA), B-plane-styring og patched-conic gravitationsassistance, stråleformning med CRPA-array mod jamming, statistik for optagelse af GNSS med kvadratlov, flertydighed i fringes / dynamisk område for kvante-inertialsensorer, IEEE-1139 potenslovsur-støj + flicker-FM-gulv og CCSDS-OEM-udveksling af kovariansblokke.

seg-b3f53d5e3c3a = <b>Register for evidens fra én kilde</b> med genererede verifikationsdokumenter og en vagt mod afdrift; et register over validering, der kan gennemses på kshana.dev, med dybe links til evidens pr. kort.

seg-b3c0545157b3 = <b>Maskinlæsbare metadata til citering</b>: <c1/> (CodeMeta { "2.0" }) og <c2/>, fastlåst til Cargo-manifestet af <c3/>.

seg-2ca8875da9de = <b>Proveniens i forsyningskæden</b>: SLSA-attestering af byggeproveniens for crate-tarballen, wheels, sdist og npm-tarballen; PyPI OIDC Trusted Publishing; CycloneDX-SBOM leveret inde i wheelen og npm-pakken; diff af reproducerbart build og verifikation efter udgivelse.

seg-18fdecf7f2fa = <b>Synlighed</b>: <c1/>, <c2/> og metadata for Open Graph / JSON-LD på kshana.dev; en genereret figur <c3/> afledt af matrixen.

seg-f80db0b0f545 = <b>README'er pr. flade</b> til crates.io / PyPI / npm med en vagt for ærlighed i antal.

seg-bd33b21f8f91 = <b>Sagnac-tidsoverførsel</b>: referencen er løftet til ExternalDataset; Sagnac-korrektionen for en omsejling af ækvator kontrolleres nu mod Ashbys udgivne { "207.4" } ns (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, ligning { "1.29" }; gengivet til < { "0.05" } ns). Den sammensatte funktion for tidsoverførsel forbliver redeligt MODELLED.

seg-882133bf1fcc = <b>Dokumentation, diagrammer og figurer opdateret</b> til den levende matrix (39/46/4/89): diagrammet over valideringsproveniens, figuren <c1/> (nu genereret fra matrixen med en CI-vagt mod afdrift), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, arkitektur- og tutorialdokumenterne og totalen i registret på kshana.dev.

seg-a9be3d71a52c = Kildetræet er omformateret med den fastlåste rustfmt (værktøjskæde { "1.93.0" }): ren stil, ingen ændring i adfærd.

seg-4542eb4fabfc = <b>Versionering i takt.</b> Hver distributionsflade (crate, PyPI, npm, MCP-crate + OCI-billede, JetBrains-plugin) versioneres nu i takt med motoren, håndhævet af <c1/> i CI.

seg-792df0cdc8a7 = <b>JetBrains-pluginet</b> er omlicenseret til <b>AGPL-3.0-only</b> (den udgivne { "0.1.1" } angav stadig Apache-2.0) og udleder nu sin Marketplace-version fra udgivelsestagget.

seg-171f5649c90f = <b>Hærdning af robusthed</b>: <c1/>-kald uden for test er fjernet eller begrundet; <c2/> er gatet på kode uden for test.

seg-0e5abb2fad02 = <b>kshana.dev</b>, en overhaling med bevis først: dominerende hero, arkitekturdiagrammer og resultatfigurer, i18n, sammenklappelige/responsive sektioner for register og standarder.

seg-05ef9b9f3653 = <b>SP3 præcis efemeride</b>: anvend IGS' korrektion af jordrotationsknude under interpolation.

seg-bbd0dc3dd9cb = <b>Billeder i registries</b>: README'erne for PyPI/crates.io/npm bruger absolutte billed-URL'er; den primære README's relative billedstier blev vist som ødelagte billeder på PyPI-siden for { "0.21.0" }. En CI-vagt (<c1/>) forhindrer tilbagefald.

seg-6d044971dbc8 = <b>CI</b>: <c1/> + <c2/> grønne; hold op med at kompilere mod git-ignorerede rigtige data.

seg-c3c260b7063e = Tests

seg-5dca3defcfe3 = Kalman-urkovariansen forbliver PSD og symmetrisk (egenskabstest, <c1/>).

seg-c861779f04ca = Doc-sync-vagter: hver offentlig streng for valideringsantal, citeringsmetadata, den genererede figur og billed-URL'er i README'erne for fladerne er alle fastlåst til deres sandhedskilde.

seg-0540044c92a6 = Denne udgivelse tilføjer to MODELLED applikationssuiter til den åbne motor: en <b>demonstrator for kvanteaktiveret PNT</b> (betroet kvantetidsoverførsel, GNSS-fri kvantenavigation, kvantefejl-/anomalidetektion) og en <b>PNT-suite for månen / cislunar rum</b> (månekoordinattid, VLBI på månen, fælles banebestemmelse + ur, realisering af referencesystem, servicevolumen, differentiel PNT, interoperabilitetseksport), hver kan køres fra én <c1/> og udskriver hver en redelig <c2/>-optegnelse plus et register over repræsentativitet / huller til flyvning. Den leverer også <b>seks nye valideringer med ekstern reference</b>, der bringer den maskinkontrollerede valideringsmatrix til <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> på tværs af dens { "61" } rækker. De nye applikationstal er MODELLED ud fra illustrative parametre fra offentlige kilder: ingen TRL, ingen flyvearv, ingen certificering og ingen opbakning fra et agentur, og de validerede kerner, de genbruger, er mærket som sådanne.

seg-82a1822f53e2 = <b>Demonstratorsuite for kvanteaktiveret PNT</b> (<c1/>, <c2/>, <c3/>). Tre MODELLED applikationsområder, der kan køres, bag motoren, hvert udskriver <c4/> plus en optegnelse over repræsentativitet / huller til flyvning:

seg-07532f03a1f1 = <b>Betroet kvantetidsoverførsel</b> (<c1/>): et budget for optisk gitterur + fotonisk link mod CSAC + RF tovejs, der genbruger beskyttelsesniveauet for tidssynkronisering, med en kvalitetsmål for sikkerhed mod forsinkelses-/genafspilningsangreb ({ "1" } − P_md) og detektion af uranomali + CUSUM-latens.

seg-4c9036cffe1b = <b>GNSS-fri kvantenavigation</b> (<c1/>): en inertial coast med koldatominterferometer mod et INS af navigationsklasse over et GNSS-udfald, redeligt om, at uden en ekstern positionsbestemmelse forbliver accelerometerets bias uobserverbar, så fejlen stadig vokser.

seg-6188f1c6893a = <b>Kvantefejl- / anomalidetektion</b> (<c1/>): et mærket fejlkatalog med en bootstrap-CI for ROC AUC og en mindst detekterbar fejl ved en fast falsk-alarm-rate.

seg-9e22314b1337 = Et fælles bibliotek for fejlmodeller af kvanteenheder (<c1/>) og et samlet værktøj til afvejning mellem kvante og klassisk (<c2/>) ligger under alle tre.

seg-808e20f28556 = <b>PNT-suite for månen / cislunar rum.</b> Syv MODELLED <c1/>, der kan køres, lagt oven på CR3BP-kernen: <b>månekoordinattid</b> (sekulær rate LTC/TCL − TT, <c2/>), observabel for forsinkelse i geodætisk <b>VLBI på månen</b> (<c3/>), <b>fælles estimator med flere teknikker til banebestemmelse + ur</b> i batch (<c4/>), <b>realisering af referencesystem</b> (7-parameter Helmert + IAU { "2015" } WGCCRE-binding, <c5/>), <b>analyse af servicevolumen i Moonlight / LCNS-klassen</b> (<c6/>), <b>differentiel PNT på månen</b> (<c7/>) og en <b>eksport for interoperabilitet på linje med LunaNet / IOAG</b> (CCSDS-OEM + tidsskala for månen i KIF-kuverten, <c8/>). Alle MODELLED ud fra illustrative parametre fra offentlige kilder; ikke valideret mod rigtig VLBI / Gateway-sporing; ingen tilknytning til eller opbakning fra et agentur.

seg-a892ce052e3c = <b>Seks nye valideringer med ekstern reference</b> (valideringsmatrixen står nu på { "15" } validerede):

seg-c30ae6767c6c = <b>ADEV / HDEV på et rigtigt 5071A-cæsiumur</b>: valideret mod Stable32-referencer for dekadepunkter (<c1/>).

seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV på Stable32-referencen <c1/></b>: valideret mod Stable32's udgivne tabeller (<c2/>).

seg-e8728f57effa = <b>ROC AUC for anomalidetektion på rigtig ESA OPS-SAT-telemetri</b>: valideret mod scikit-learn (<c1/>).

seg-5446957ac631 = <b>Syntese af ICGEM-tyngdefunktionaler</b>: valideret mod GRS80-standarden for normal tyngde (Somigliana γ til { "3.5e-12" }; EGM2008-forstyrrelseskort, <c1/>).

seg-751c5ac90229 = <b>Klobuchar-modellen for broadcast-ionosfære</b>: valideret mod RTKLIB (<c1/>).

seg-dcc6d4e04a5c = <b>RAIM-detektionskernen</b> ({ "171" } tilfælde, <c1/>) og <b>SBAS DO-229E-beskyttelsesniveauet</b> på rigtige EGNOS-data (RTKLIB SBAS-PL-fork, <c2/>): begge valideret mod deres eksterne referencer.

seg-3f6c1ff0b3a4 = <b>Register over repræsentativitet og huller til flyvning</b> (<c1/>). En struktureret optegnelse, hver demonstrator udskriver: hvad der er repræsentativt, hvad der er forenklet, og hvad der står mellem modellen og flyvning, den redelige ledsager til hver MODELLED afvejning.

seg-6b4c78bdaf35 = <b>Aggregering af studier og ergonomi i CLI.</b> Et manifest for scenariesuiter med aggregering af studier med én kommando, hash-stabile studiemetadata + <c1/>, linting af scenarier med <c2/> og visning af valideringsniveau pr. kvalitetsmål i studierapporter.

seg-e24230b80a89 = <b>kshana.dev er redesignet omkring en fælles domænerygrad</b>: funktioner og validering samlet i én domæneudforsker med et fælles ordforråd, de nye validerede øer vist, et landnøjagtigt animeret jordinstrument og en CTA til at bestille et studie, samt brandingen/linkene for Ashforde OÜ.

seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE gennemgået for fuldstændighed og ærlighed</b>: forældede antal validerede rettet (nu { "15" } eksterne referencer), diagrammerne udvidet, og preprintsene om det betingede beskyttelsesniveau for tidssynkronisering (arXiv:{ "2606.24210" }) og optimismegabet for RF-forstyrrelser (arXiv:{ "2606.22054" }) citeret.

seg-42a317c6ce06 = Kilderne i <c1/> og JOSS-udkastets pipeline opbevares i det offentlige repo.

seg-8ed5cf845b00 = Denne udgivelse tilføjer fire studiefunktioner til den åbne motor: et betinget beskyttelsesniveau for tidssynkronisering, scoring af PNT-robusthed på linje med rammeværk, en evaluering af optimismegabet for RF-forstyrrelser og en software-defineret modtager / frontend til rigtige data, hver kan gengives fra én kommando og skriver et bytedeterministisk artefakt. Alle studier er MODELLED (syntetisk eller kalibrering mod offentligt datasæt), bærer deres redelige proveniens (motorversion, seeds, konfigurationshash) og valideringsmærker og er ikke certificeringer.

seg-0c9f0c665491 = <b>Betinget beskyttelsesniveau for tidssynkronisering (<c1/>).</b> En grænse begrænset af holdover for den uopdagede tidsfejl under GNSS-spoofing, med et k-sigma-gulv for monitoren, en van Loan-coastvarians over detektionslatensen og en CUSUM-tid til alarm. Kalibreret på et rigtigt optaget angreb (JammerTest { "2024" }, scenarie { "2.1.1" }) via <c2/>, der gengiver dens referencetabel ud fra skalarer genvundet fra den offentlige optagelse (det rå datasæt videredistribueres ikke).

seg-d874d7f13f28 = <b>Scoring af PNT-robusthed på linje med rammeværk + studie af beslutningsinstabilitet (<c1/>).</b> Arkitekturmodel, scoring på linje med RPCF, Dirichlet-vægtsimplex, Kendall-tau og instabilitet i flip-rate for top 1 og kollaps af diversitet i fælles tilstand (Hill-N2), med <c2/>. Krydsreference i <a1><c3/></a1>.

seg-343f7af54503 = <b>Studie af optimismegab for RF-forstyrrelser (<c1/>, <c2/>, <c3/>).</b> Et panel af 13 detektorer over et parameterfunderet syntetisk korpus, et optimismegab mellem i og uden for distributionen, trends i skaleringslove med en permutationsnul og en leave-one-out-prædiktor for nedbrydning, via <c4/>.

seg-6eed55859bbf = <b>Frontend til software-defineret modtager (<c1/>) og adaptere til rigtige data (<c2/>).</b> Rå IQ/IF til korrelatortaps og SQM, plus adaptere til indlæsning (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) og probe-eksempler. De læser optagelser, brugeren selv leverer lokalt; ingen optagelser committes.

seg-afe2282fa771 = <b>Committede studieartefakter.</b> De bytedeterministiske <c1/> og <c2/> spores nu under <c3/>, så studietallene kan kontrolleres uden at bygge igen; de kan stadig genereres igen fra generatorerne ovenfor. Rå datasæt bliver uden for repoet (<c4/>).

seg-450d82cddc28 = Versionen er forhøjet til { "0.20.0" } på tværs af <c1/>, <c2/> og <c3/>; artefakterne til crossover-studiet er genereret igen, så deres stempel stemmer med den udgivne version.

seg-a0a66af8fd14 = <b>Omlicenseret fra Apache-2.0 til GNU AGPL-3.0-only, med en kommerciel licens tilgængelig fra Ashforde OÜ (dobbeltlicensering).</b> Den åbne motor forbliver fuldt åben og offentligt verificerbar; AGPL's netværks-copyleft (§{ "13" }) betyder, at en lukket eller hostet afledt udgave skal vende tilbage til open source, eller tage en kommerciel licens. Det forsvarer den validerede kerne mod fork-og-luk og bevarer samtidig troværdigheden af en offentlig, kørbar og kontrollerbar motor. Se <a1><c1/></a1> (AGPL) og den nye <a2><c2/></a2> (hvad hver licens dækker, og hvornår den gælder).

seg-ffa799fdb814 = <c1/> indeholder nu AGPL-3.0-teksten; SPDX-headere i alle kilder er opdateret til <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, hjemmesiden og metadata for crate/pakker (<c7/>, <c8/>, <c9/>, MCP-craten + billedet) er opdateret tilsvarende.

seg-8d67aba2af0b = <b>Bidragsydervilkår</b> (<a1><c1/></a1>) licenserer nu indgående bidrag under AGPL <b>og</b> giver Ashforde OÜ ret til at inkludere bidrag i den kommercielt licenserede udgave, så dobbeltlicensen bliver ved med at virke.

seg-93644d1c1420 = <b>Afhængighedspolitikken er uændret, men begrundet påny</b> (<a1><c1/></a1>, <c2/>): afhængigheder forbliver permissive (Apache/MIT/BSD/ISC). AGPL tillades kun for kshanas eget crate: en copyleft-<em>afhængighed</em> ville smitte den kommercielle udgave og bryde dobbeltlicensering.

seg-9b77c2d36241 = <b>Note til downstream:</b> dette er en copyleft-omlicensering. Brugere, der har støttet sig til de permissive vilkår i Apache-2.0, kan fortsætte med at bruge den sidste Apache-2.0-udgivelse (<c1/> og tidligere, som udgivet); fra <c2/> og frem er det AGPL-3.0 / kommerciel.

seg-51e32f15b7ea = <b>Forhøjede <c1/> { "0.24" } → { "0.29" }</b> for at fjerne RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) fra eksterne OSV-/afhængighedsscanninger. Begge er bulletiner på <em>funktionsniveau</em>, hvis berørte funktioner (<c2/>/<c3/>, <c4/>) Kshana aldrig kalder, og <c5/> er en valgfri afhængighed (funktionen <c6/>), så den reelle eksponering var nul, men forhøjelsen bevarer en ren scanning for downstream-revisorer. Migrerede <c7/> til API'et i pyo3 { "0.29" } (returtypen Bound for <c8/>; eksplicit <c9/> på pyclass'en <c10/>). Alle { "11" } tests af Python-bindingen består mod den genopbyggede udvidelse.

seg-8d9332df5c74 = <b>Elleve nye scenarieslags, der kan køres: demonstratorer for to udbud, en CCSDS-interoperabilitetsbro og en suite for missionsanalyse / miljø af første orden (alle MODELLED, additive; eksisterende reproducerbarhedsgoldens er uændrede).</b> Hver kan dispatches fra CLI / Python / WASM / MCP, leveres med en <c1/> og bærer et eksplicit MODELLED mærke i sin resultat-JSON og enlinjeoversigt (en test pr. slags i <c2/> hævder, at mærket er til stede, og at outputtet aldrig indeholder strengen <c3/>):

seg-20b74caf58cc = <c1/> (<c2/>): testbænk til evaluering af maskinlæringsbaseret detektion af RF-forstyrrelser: et mærket <b>syntetisk</b> korpus + en detektoruafhængig <b>ROC/AUC</b>-harness + en rapport om <b>optimismegab</b> mellem i og uden for distributionen (kun operationelle karakteristika, aldrig felt-/IQ-data).

seg-0253656a0ecf = <c1/> (<c2/>): afvejning mellem kvante og klassisk PNT med indlæsning af målt ADEV og en robusthedskuvert uden GNSS.

seg-901bd713bd62 = <c1/> (<c2/>): sol-/geomagnetiske indekser (IAGA-tabellen Kp↔ap, daglig Ap, centreret 81-dages F10.7a), eksosfærisk temperatur efter <b>Jacchia-71</b> og en aktivitetsdrevet kobling til termosfærisk massefylde over en statisk atmosfære (IKKE en model for absolut massefylde som NRLMSISE).

seg-2323b43c0ffc = <c1/> (<c2/>): <b>CCSDS { "502.0" } OEM</b>-import + rundturs-bro for efemerider fra GMAT / Orekit / STK (læseren <c3/>, den nøjagtige inverse af skriveren).

seg-188aeb3e8219 = <c1/> (<c2/>): totlegemers <b>opsendelsesazimut</b> (<c3/>), Δv for planskifte, bonus fra stedets rotation og geometri for daglige muligheder.

seg-6200a47276e6 = <c1/> (<c2/>): ballistisk korridor for nedstyrtning efter <b>Allen-Eggers</b>: maksimal deceleration, hastigheder ved maksimal g og maksimal opvarmning, højde ved maksimal g.

seg-0874c2241748 = <c1/> (<c2/>): geometri for EO med <b>swath / GSD / adgang / revisit</b> (SMAD-rumtrekant).

seg-83c7588ff074 = <c1/> (<c2/>): kodning/afkodning af primær header i <b>CCSDS 133.0-B Space Packet</b> med bitnøjagtig rundtur.

seg-ae1bcad02880 = <c1/> (<c2/>): 3-DOF <b>drejningsmoment fra tyngdegradient</b> + <b>RSS-budget for pegefejl</b> (skalarbudget før hardware, ikke en reguleringssløjfe).

seg-65f59cc12e02 = <c1/> (<c2/>): <b>prædiktion af op-/nedgang for passager</b> over jordstation (AOS/TCA/LOS, maksimal elevation, adgang).

seg-178776497627 = <c1/> (<c2/>): envejs linjeligning efter <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / margen / lukning).

seg-e7fee32a00f5 = <b>Hybrid UKF med 17 tilstande, kvante + klassisk, tæt koblet: gjort til et scenarie, der kan køres (MODELLED).</b> En ny scenarieslags <c1/> (<c2/>, <c3/>), der gør det tidligere kun-API-baserede ukendt-filter (unscented) med 17 tilstande for tæt koblet GNSS/INS (<c4/>) til et scenarie, som bindingerne til CLI/Python/WASM/MCP kan dispatche. Fejlvektoren med 17 tilstande er de <b>{ "15" } INS-fejltilstande</b> (position, hastighed, attitudeskævhed, accelerometer- + gyrobias) udvidet med den <b>CAI-afledte korrektion af accelerometerbias</b>: koldatominterferometret (<c5/>) sætter gulvet for hastighedens random walk <c6/>, så driften ved lang coast er den, kvantesensoren begrænser, og et <b>ur med 2 tilstande, fase + frekvens</b>, hvis processtøj kommer fra <b>q-parameter-urmotoren</b> (<c7/>, der afbilder et urs Allan-deviationsprofil til PSD'erne <c8/>/<c9/>, skaleret til afstandsenheder). Platformen er GNSS-støttet i en indledning (filteret lærer biaser, hastighed og ur) og coaster derefter gennem et GNSS-udfald alene på CAI-IMU og ur, så kørslen demonstrerer <b>klassisk IMU på kort sigt + kvante på langt sigt</b> som hybrid. Kvalitetsmålet er <b>filterets selvkonsistens</b>: samlet <b>NEES</b> (Normalised Estimation Error Squared, over den estimerbare delmængde af position/hastighed/ur) og <b>innovationshvidhed NIS</b> (Normalised Innovation Squared) over et Monte-Carlo-ensemble, kontrolleret mod deres { "95" }%-bånd for χ² (Bar-Shalom §{ "5.4" }). Det matchede filter lander inden for båndene; et med vilje fejljusteret filter (knapperne <c10/> / <c11/>) markeres: en objektivt kontrollerbar, skelnende gate, ikke en gummistempling. <b>Kontrollen af NEES/innovationshvidhed er den STATISTISKE REFERENCE: en påstand om selvkonsistens (filterets rapporterede kovarians svarer redeligt til spredningen af dets egne fejl under den modellerede støj), IKKE en garanti for nøjagtighed i den virkelige verden.</b> Redeligt omfang: alt er <b>modelleret / simulering</b>; CAI- og urinputtene er afgrænsede værdier, repræsentative for litteraturen, ikke målt hardware; CAI-hardwaren og dens nøgleperson forbliver ejet af partneren; intet her antyder TRL > { "3" }, flyvearv eller ekstern validering (resultat-JSON'en og enlinjeoversigten bærer disse mærker eksplicit). Den ene bane med konstant hastighed i plan gør attitude- og IMU-biastilstandene kun svagt observerbare, så NEES vurderes over de { "8" } estimerbare tilstande; en manøvrerende bane til fuld observerbarhed af alle 17 er på køreplanen. Tilføjer også instrumentering af konsistens i <c12/> (returnerer NIS pr. opdatering) og <c13/>. Alle eksisterende scenarier er upåvirket (additivt; reproducerbarhedsgoldens uændrede).

seg-9b55f4ac5053 = <b>Sekventiel (rekursiv) terrænreferenceret navigation: SITAN som et løbende filter.</b> En ny scenarieslags <c1/> (<c2/>, <c3/>), der kører den eksisterende målemodel for højdemåler mod DEM <b>epoke for epoke</b> gennem SIR-motoren <c4/> i stedet for den grov-til-fin-søgning i batch, som <c5/> bruger til at genfinde en enkelt <em>konstant</em> INS-forskydning. Ved hvert waypoint propageres skyen med det INS-rapporterede tillæg (selv forvansket af væksten i drift pr. trin), vægtes om efter terrænmatchet og resamples ved degeneration, så en <b>tidsvarierende</b> INS-drift <em>følges</em> langs sporet, hvilket en tilpasning med konstant forskydning strukturelt ikke kan. På den syntetiske DEM forbliver det rekursive estimat begrænset og konvergerer igen (slut ≈ { "70" } m), mens den uunderstøttede inertialløsning divergerer ubegrænset til ≈ { "5" } km; fejlen pr. epoke følger terrænets særpræg (den coaster på det biasede INS over flade sadler og låser igen over udpræget relief), og monitoren for effektiv stikprøvestørrelse bekræfter en sund sky. Redeligt omfang: kortet er <b>kendt og fast</b>, rekursiv <em>lokalisering</em> mod en lagret DEM (lokaliseringshalvdelen af terræn-SLAM), ikke fælles estimation af kortet; ikke-cirkulær ved konstruktion (den indsprøjtede driftrampe er den uafhængige reference). Alle eksisterende scenarier er upåvirket (additivt; reproducerbarhedsgoldens uændrede).

seg-87ba3bc926fa = <b>Rygrad for robusthed uden GNSS + skiver af FutureNAV-demonstratoren</b> (<c1/> og fundamenter for robusthedskuvert under <c2/>, <c3/>, <c4/>, <c5/>, med verifikationsskiver for FutureNAV i <c6/>). Sammensætter byggeklodserne til alternativ PNT (urets holdover, signalsporing, inertial coast, terræn) til én fortælling om robusthed ved GNSS-udfald. MODELLED; additivt.

seg-071bb6654f24 = <b>Kshana Interchange Format (KIF): en versioneret, selvbeskrivende kuvert til artefakter</b> (<c1/>). En skemamærket indpakning om scenarieresultater, så et lagret artefakt bærer sin slags, skemaversion og mærkerne MODELLED/VALIDATED med sig, og ældre kuverter forbliver læsbare med fremadrettet kompatibilitet. Additivt; eksisterende resultat-JSON uændret.

seg-07147766ab22 = <b>Modulation / sporing af navigationssignal + differentialkorrektor for CR3BP-halo/NRHO</b> (<c1/>, <c2/>). En model af første orden for modulation og sporing af navigationssignal og en differentialkorrektor for det cirkulære begrænsede trelegemeproblem til halo-baner / næsten retlinede halo-baner, vist på den eksisterende akse for dybt rum. MODELLED.

seg-d0d2366e3351 = <b>Evalueringstilstand for distributionsskift + knap for korpussets alvorlighedsskala til <c1/></b> (<c2/>). Tilføjer en eksplicit opdeling i og uden for distributionen og en justerbar alvorlighedsskala for korpus til ROC/AUC-harnessen for optimismegab (kun operationelle karakteristika, aldrig felt-/IQ-data).

seg-9bb8ee93e70b = <b>ROI pr. dækning i omkostning + afbildning af integritetspåvirkning ved udeblevet detektion</b> (<c1/>, <c2/>). Et ROI-perspektiv for frugal engineering (omkostning pr. enhed dækning) og en afbildning fra rate for udeblevet detektion til integritetspåvirkning. MODELLED; additivt.

seg-55f8ba5b52ee = <b>Citeret parameterark for fejlmodel for koldatominterferometer (CAI)</b> (<c1/>). Et parameterark med litteraturhenvisninger og afgrænsede værdier for den inertiale CAI-model: inputtene er <b>citeret, ikke målt hardware</b> (ingen TRL- eller flyvepåstand); det fødes ind i gulvet for hastighedens random walk i <c2/>.

seg-cfbff4acc64c = Projektets styring.

seg-982f9ea3eee8 = <c1/>, der dokumenterer beslutningsmodellen og grænsen mellem åbent og lukket; funktionskortets række for fællesskab/styring flytter sig fra <c2/> for at afspejle det.

seg-c9ff6a7183eb = <b>Beskyttelsesniveau for ARAIM-integritet: nominel bias (<c1/>) og σ_URA anvendes nu.</b> MHSS-beskyttelsesniveauet trækker nu den ensidige projektion af nominel bias <c2/> fra pr. fejltilstand og bruger <b>integritets</b>-sigmaet σ_URA (adskilt fra <b>nøjagtigheds</b>-sigmaet σ_URE), som bæres på Integrity Support Message. Det gør beskyttelsesniveauet mere konservativt og korrekt efter standarderne og <b>ændrer derfor PL-værdierne, som eksisterende integritetsscenarier rapporterer</b>. ISM/scenariet får felterne <c3/> <c4/> / <c5/>, så input, der lader dem stå usat, beholder den tidligere adfærd. Se <c6/> for den genoprettede formel <c7/> og den redelige implementeringsnote.

seg-c408f8944ac6 = Spoof-monitorens χ²-konsistens.

seg-92e2b5c5458c = <c1/> bruger nu den fælles sti <c2/> for invers χ², hvilket fjerner en anden, afvigende χ²-implementering, så RAIM og paritetsmonitoren for spoofing er enige om deres tærskler.

seg-6d424034e500 = <b><c1/> koblet til CLI-dispatcheren.</b> Scenariet kunne tidligere kun nås gennem API'et; det dispatches nu som en <c2/> som hvert andet scenarie.

seg-62c3efb54991 = <b>Dokumentation/korrekt antal.</b> Antallet af scenarietyper i README er nu knyttet til <c1/> af en <c2/>-test, så det dokumenterede antal ikke længere kan afvige fra dispatcheren.

seg-5f0f497aa643 = <b>Dybrums- og Mars-PNT — åben radiometrisk navigationsmotor + GSE-simulering.</b> En ny, rent additiv funktionsakse oven på den Jord-validerede kerne (hvert eksisterende Jord-scenarie er <b>byte-identisk</b> — reproducerbarhedens golden-filer består uændret uden regenerering). Tilføjer: en dynamikkerne for flere legemer (<c1/> med tesseral tyngdekraft for Mars GMM-3, et IAU-legemefast Mars-referencesystem, en udskiftelig <c2/>-søm, to-delte Julian-datoer med præcision under et mikrosekund og TT↔TDB); radiometriske observable (iterativ lystid + Shapiro-forsinkelse, to-/en-/tovejs Doppler og afstand via Moyers to-benede løsning, koherent transponder-omdrejning, regenerativ/PN-afstandsmåling efter CCSDS { "414" }, Δ-DOR efter CCSDS { "506" }, medier som solplasma, troposfære og ionosfære); parsing og udskrivning af CCSDS-TDM ({ "503" }); et reduceret-dynamisk kvadratrods-informationsfilter med empiriske RTN-accelerationer, et ur med tre tilstande om bord og en Mars-modstandsmodel; en fælles estimator, der fusionerer envejs- og tovejsmåling; scenarieoverfladen <c3/> (relækonstellation + LMO/transfer/overflade) på tværs af CLI, Python, WASM, MCP og playground; og en ende-til-ende-simulator for GSE-ydeevne (geometri → linkbudget → observable → SRIF → kovarians). <b>Valideringsniveau — valideret ved simulering:</b> syntetisk lukket-sløjfe-OD (Mars-LMO ≈ { "0.2" } m) og analytisk selvkonsistens, hvor den Sol-centrerede Mars-dynamik uafhængigt er krydstjekket mod JPL <b>DE440</b> (<c4/>, kun med kerne: { "137" } m @ 1-dages bue, den ærlige umodellerede n-legeme-rest). De rapporterede dybrumsnøjagtigheder er <b>simulerings- og kovarianskvalitetsmål</b>, ikke resultater fra rigtige missioner; validering mod rigtige DSN/ESTRACK-sporingsdata står stadig på køreplanen. ANISE (MPL-2.0, edition-2024) er afgrænset til en krydstjek-crate uden for workspace, så licensporten <c5/> og MSRV-1.75-jobbet er urørte.

seg-2ab34100a2d7 = <b>Sporet på jorden med myndighedsnøjagtighed ud fra reel IERS-jordorientering.</b> Scenariet <c1/> tager et valgfrit felt <c2/> — selve indholdet af en reel IERS-<c3/>-fil, indlejret — og reducerer sporet på jorden gennem UT1−UTC og polbevægelse for hver epoke, interpoleret herfra (den samme <c4/>, som <c5/> bruger), og tilsidesætter de nominelle skalarer <c6/>/<c7/>/<c8/>. Dataene følger med i scenariet, så kørslen forbliver reproducerbar og ikke kræver noget filsystem (den virker i WASM-playground). Et flag <c9/> folder en reel fil ind i scenariet fra CLI. Det lukker den skævhed, at kun <c10/> brugte reelle jordorienteringsdata.

seg-e778245e7d8f = <b>Konsistent referencesystem for afstandsrate.</b> Jordstationen afbildes nu ind i det inertielle system gennem den præcise inverse af satellittens reduktion (<c1/>, som fortryder både polbevægelse <em>og</em> den sideriske rotation) i stedet for en GMST-rotation uden polbevægelse, så begge endepunkter deler ét system. Virkningen på den rapporterede Doppler ligger under valideringsgulvet, men den fjerner en reel systemforskel og en overdrivelse af "præcis" i kilden.

seg-3b912d8a819d = <b><c1/> valideres.</b> En bærefrekvens på nul eller en ikke-endelig værdi giver nu en fejl i stedet for i tavshed at give nul Doppler (det havde gjort λ = c/bærefrekvens uendelig), på linje med den eksisterende kontrol af <c2/>.

seg-7d70317ca717 = <b>Validering af kraftmodellen ved efemeridetilpasning, krydsvalideret mod reelle myndighedsprodukter.</b> En ny batch-estimator med mindste kvadrater (<c1/>) med en variationel tilstandsovergangsmatrix og redigering af outliers, drevet af en fuld kraftmodel (<c2/>: EGM2008-geopotential, tredjelegemer, faste + oceaniske + atmosfæriske tidevand og empiriske CPR/2-per-omløb-accelerationer), fodret af en reel IERS-<c3/>-parser for jordorientering. Valideret mod publicerede referencebaner: <b>Galileo MEO til { "13" } cm efter tilpasning</b>, ESA <b>Swarm-A LEO</b> og <b>LRO måne</b> (selenocentrisk, GRAIL-tyngdefelt, IAU-2015-legemefast system — reduceret-dynamisk { "6.6" } m, ærligt over målet på { "5" } m på den åbne vej; DE-klassens ANISE/DE440-vej, som når det, er en crate uden for workspace).

seg-bf88a3eb4733 = <b>Scenariet <c1/></b> — en integreret spoofing-detektor i flere lag, der kombinerer RAIM-paritet for hver epoke, AGC- og signalkvalitetsmonitorer (SQM) og en fusioneret beslutning, valideret mod de publicerede scenarieparametre for <b>TEXBAT</b> (Humphreys m.fl., ION GNSS { "2012" }), herunder det svære tilfælde med bærebølgejustering.

seg-976036ba124b = <b>Scenariet <c1/> — tilstand, referencesystemer, spor på jorden og Doppler.</b> Propagér én satellit (TLE→SGP4 eller en analytisk bane) og udskriv for hvert trin den inertielle TEME- og GCRS-tilstand (<b>position <em>og</em> hastighed</b>), den jordfaste ITRF/ECEF-position, WGS-84-<b>sporet på jorden</b> under satellitten (bredde / længde / højde) og det topocentriske azimut / elevation / afstand med afstandsrate og <b>Doppler</b> fra en jordstation. Kan nås fra CLI, Python, WASM og MCP-serveren og leveres som <b>forudindstillingen "Ground track"</b> i web-playground, hvor sporet tegnes <b>over et rigtigt verdenskort</b> (Natural Earth { "1" }:110m-kystlinjer, indlejret — uden netværk eller eksterne afhængigheder).

seg-761c95f2ede5 = <b>CCSDS OEM-eksport</b> (<c1/> / <c2/>) — den hastighedsbærende Orbit Ephemeris Message, som GMAT / Orekit / STK bruger, på niveau med de eksisterende SP3- og OMM-eksportører.

seg-111b0896fdd4 = <b>Faste, oceaniske (FES2004) og atmosfæriske (Ray { "2001" } S2) jordtidevand</b> på geopotentialet (IERS Conventions kap. { "6" }), koblet ind i kraftmodellen.

seg-7e392131261a = <b>ARM64-wheels</b> — PyPI-buildet producerer nu også wheels til Linux aarch64 (manylinux_2_28), macOS arm64 og Windows arm64.

seg-7cc04ea3362b = <b>Udvidet teknisk rapport (preprint)</b> med link fra README, og JOSS-artiklen gjort klar til indsendelse (forfatterens ORCID, kompileret til PDF i CI ved hver ændring).

seg-3b1e95acc728 = <b>Referencesystemer valideret til millimeteren mod publicerede Vallado-vektorer.</b> Reduktionen TEME→PEF/ITRF, hele CIO IAU 2006/2000A GCRS→ITRS-kæden og konverteringen ECEF→geodætisk WGS-84 er nu fastlåst til det gennemregnede eksempel i Vallado m.fl. (AIAA 2006-6753) med dets IERS EOP, ikke blot til intern selvkonsistens.

seg-fd9818877a6c = <b>Uafhængige krydstjek af tidsskalaer.</b> ERA og skalaerne UTC/TAI/TT stemmer med <c1/> til < { "1" } µs, og planeteefemeriden DE440 stemmer med JPL Horizons (geocentriske positioner for Måne/Sol), begge som altid-aktive CI-porte.

seg-75aeec4cd6d0 = Web-playground skjuler fanen med kvalitetsmål, når et resultat ikke har nogen rækker med kvalitetsmål, så bevispakker med kun diagram (efemeride, RAIM, spoof) åbner på deres diagram — for efemeride på sporet på jorden — i stedet for en tom tabel.

seg-b8ab0cc3ce7f = Playgroundens vejledte skydere <b>og parametersweep virker nu for scenariet efemeride / spor på jorden</b>: dets parametre (stationens bredde / længde, tidstrin, varighed, UT1−UTC) kan justeres, og et sweep kan afbilde overflyvningens geometri (maksimal elevation, spidsværdi for Doppler, højde, hastighed) mod hver af dem — fx maksimal elevation mod stationens bredde. Fanen Sweep vises nu kun, når et scenarie faktisk kan sweepes, så ingen bevispakke tilbyder en styring, der ikke afbilder noget.

seg-9e7a37e51940 = Dokumenterede SGP4-tilnærmelsen <c1/> ved GMST-kaldet (en rotationsfejl på ≤ ~{ "13" }″, godt inden for SGP4's egen modelfejl) og opdaterede <c2/>.

seg-174a75e840b0 = JetBrains-pluginet <b>Kshana — PNT simulator</b> er nu udgivet og accepteret på <a1>JetBrains Marketplace</a1>. README, <c1/> og distributionsdokumentationen linker direkte til det.

seg-4deaf7918fff = <b>Udgivelse i MCP-registret</b> lykkes nu: <c1/> <c2/> var over registrets grænse på 100 tegn (HTTP { "422" }). Den er forkortet, og servernavnet (og imagets ejerskabsmærke) er rettet til det kanoniske navnerum <c3/>.

seg-1408961042a1 = <b>Udgivelse på JetBrains Marketplace</b> lykkes nu: CI uploadede igen den samme pluginversion, som allerede var oplistet manuelt, hvilket Marketplace afviser. Pluginversionen er hævet til <c1/>, og idempotensvagten behandler nu også svaret "already contains version" som en vellykket no-op.

seg-74e8cab2f10e = <b><c1/>: cache-busting</b>: de versionsstemplede query-strenge til <c2/>/<c3/> følger udgivelsen, så tilbagevendende besøgende altid får den aktuelle build.

seg-65949229eed7 = <b><c1/> — Kshana som en Model Context Protocol (MCP)-server</b> (<c2/>). En selvstændig crate uden for workspace (SDK'en <c3/> er edition { "2024" }), der stiller den validerede motor til rådighed for AI-agenter og assistenter — Cursor, JetBrains AI Assistant / Junie og enhver MCP-klient — over stdio. Værktøjer: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, alle et tyndt lag over <c9/>.

seg-bd792f66363c = <b>JetBrains IDE-plugin</b> (<c1/>). Højreklik på et scenarie <c2/> → <b>Run Kshana Scenario</b>; kvalitetsmål og resultat-JSON streames ind i et Kshana-værktøjsvindue. Rent platformsbaseret Kotlin-plugin, kompatibelt med alle JetBrains IDE'er { "2024.3" }+.

seg-755358390517 = <b>Offentlig distribution + automatisk udgivelse ved hver release</b> for begge:

seg-14fc2fd73553 = <c1/> til <b>crates.io</b> (<c2/>) via <c3/>.

seg-2b39bbfc0581 = <c1/> som et multi-arch-<b>OCI-image</b> på <c2/> (<c3/>) via en ny <c4/>.

seg-c824d1532eb6 = <c1/> til det <b>officielle MCP-register</b> via GitHub OIDC (ingen hemmeligheder); registerposten (<c2/>) bruger OCI-pakketypen med en etiketverificeret ejer.

seg-f90da0c61aac = IDE-pluginet til <b>JetBrains Marketplace</b> via <c1/> (låst bag token, valgfri udviklersignering) ved hvert release-tag.

seg-21d7457dad23 = <b>Uafhængig krydsvalidering af referencesystemer med ANISE/SPICE</b> (<c1/>). En selvstændig crate uden for workspace krydstjekker IAU 2006/2000A CIO-reduktionen i <c2/> (<c3/>, GCRS→ITRS) mod <b>ANISE</b> (den rene Rust-genimplementering af NAIF/SPICE), som roterer GCRF→ITRF93 ud fra JPL's <c4/>, med <b>de samme IERS <c5/>-jordorienteringsparametre givet til begge sider</b>, over otte kvartalsvise epoker { "2020" }–{ "2023" }. De to uafhængige realiseringer af referencesystemet stemmer til en <b>maksimal relativ rotation på { "0.028" }″ — ≤ { "0.86" } m på jorden, ≤ { "0.93" } m i LEO, ≤ { "3.6" } m i GNSS-bane</b> og ligger dermed med stor margin inden for det mangeårige krydstjek af referencesystemet i ROADMAP på "< { "10" } m" (det supplerer de eksisterende bit-for-bit-ankre fra SOFA/ERFA og erstatter dem ikke). Craten er isoleret, fordi <c6/> + <c7/> er MPL-2.0 / edition-2024 og aldrig må komme ind i den publicerede afhængighedsgraf for <c8/>, dens <c9/>, licensporten <c10/> eller MSRV-buildet; ANISE er låst med <c11/>. Omfatter en binær <c12/> (henter den ~{ "5" } MB store BPC, udskriver en tabel, skriver <c13/>), en testport, der selv springer over uden kerne/netværk, og et valgfrit CI-job kun med <c14/> (blokerer aldrig <c15/>). Dokumenteret i <c16/> (CIO-rækken) og <c17/>.

seg-eb45b43dacc2 = <b>Mobilvenlig playground.</b> Rettede vandret overløb af playgroundens <c1/> på telefoner (et CSS-grid-element, der som standard har <c2/>, blev gengivet ~{ "100" } px bredere end viewporten) via <c3/> og breddebeskyttede styringer; kontrolleret rent ved { "360" } / { "390" } / { "414" } / { "768" } px. Justerede handlingsknapperne "Pin to compare" / "Download report" (lige store marginbokse i flex-rækken). Forstørrede kørselsknapper, skydere, udvalgslister og navigationslinks til ~{ "44" } px, minimum for berøringsmål efter WCAG { "2.5.5" } / Apple HIG, på telefoner og berøringsenheder, mens størrelserne på skrivebordet er uændrede.

seg-fe5095d5e61f = <b>Robusthedsstyrkelse fra en modstridende kamptestgennemgang.</b> ({ "1" }) <c1/> afviser nu elevation/azimut/varians, der ikke er endelige, og negative eller ikke-endelige diagonaler i kovariansen (en næsten singulær geometri skaleret op med lille σ kunne tidligere slippe forbi den absolutte pivotport og returnere et NaN-VPL / et absurd HPL som en <em>gyldig</em> <c2/> — en tavs integritetsfejl). ({ "2" }) Den numeriske propagator (<c3/>/<c4/>) fejler lukket ved en begyndelsestilstand, der ikke er endelig, i stedet for at lade den adaptive regulator snurre for evigt. ({ "3" }) DEM-cellehjælperen går ikke længere i panik ved et gitter med én prøve ({ "1" }×N). ({ "4" }) Azimut for <c5/> holdes strengt i <c6/>. ({ "5" }) <c7/> afviser ikke-fysisk (NaN / ikke-positiv) <c8/>/radius.

seg-9ca339d8977a = <b>Binær <c1/> + release-artefakt</b>: en afhængighedsfri generator, der udskriver et trykklart HTML-valideringsresumé på én side, som indekserer hver CI-håndhævet validering (SGP4 666/666, EGM2008, bit-for-bit-referencesystemer, NIST Allan, IMU-datablade, ARAIM/SBAS, reproducerbarhed på 3 OS, dækning) til dens test og eksterne uafhængige reference. Release-workflowet genererer <c2/> og vedhæfter den (med SLSA-proveniens) til hvert mærket release.

seg-bd231d07658f = <b>numpy-interop pytest + styrkelse af wheel</b>: <c1/> (køres i CI) plus en fastlåst manylinux-container og et verifikationstrin med <c2/> i wheel-buildet.

seg-5427cae6fc39 = <b>Tutorials og uddannelse</b>: <c1/> (tre gennemregnede tutorials, annoterede scenarier for hvert domæne, øvelser på niveau 1/2/3) med <c2/>, som fastlåser hvert citeret tal til motorens aktuelle output.

seg-2fad9124c5a6 = <b>Eksterne indsendelsesartefakter</b> (<c1/>, <c2/>, <c3/>): et udkast til en JOSS-artikel, en notebook om kvante mod klassisk og indsendelsessæt klar til awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, plus <c4/> — de eksterne trin forberedt til indsendelse.

seg-0f88f8bccbc1 = <b>Terrænreferenceret og kombineret alt-PNT-navigation</b> (modulet <c1/>): en TERCOM/SITAN-terrænmatchende navigator over en DEM (indlæser til <c2/> + generator af syntetiske fixtures) og en kombineret navigator uden GPS med tyngdekraft + magnetfelt (IGRF) + terræn, tilgængelig som scenarietyperne <c3/> og <c4/>. Valideret ved konvergens af terrænmatchningen (en kendt tilført forskydning blev genfundet) og en afgrænset fejl i det kombinerede filter over et vindue uden GPS.

seg-bd01ec72fa2a = <b>LunaNet LANS-geometri</b> (<c1/>): navngivne steder på månens overflade (Apollo 11/15/16, Shackleton-randen) med autoritative selenografiske koordinater, udsigtsvinkler fra overfladen (az/el/afstand), sigtbarhed/dækning og DOP for stedet, valideret mod Månens radius, de publicerede stedkoordinater og identiteten for elevation på { "90" }° ved radial overhead.

seg-2dad9cf59ea9 = <b>Vejledt playground i browseren</b>: skydere i vejledt tilstand, et output-panel med faner, et rundvisningsoverlay ved første kørsel, tilstande for parametersweep og overlay af flere kørsler, en afhængighedsfri 3D-banevisning i canvas/SVG (bane-bevispakken udskriver nu en additiv <c1/>), en embed/iframe-tilstand og download som HTML-rapport — hver med node-enhedstest i CI.

seg-261604603d67 = <b>Fejlmodel for IMU valideret mod datablade</b> (<c1/>): ARW/VRW/bias-ustabilitet for ADIS16465/16488/16460 genfundet ud fra den syntetiserede Allan-deviation og kontrolleret mod producentens specifikationer (identifikation efter NIST SP1065 / IEEE { "952" }).

seg-dc7b9bdb3076 = <b>Validering af Allan-estimatorer efter NIST SP1065</b> (<c1/>): de fire estimatorer gengiver de publicerede referencedeviationer for 1000 punkter og konfidensgrænserne i Table-32.

seg-5d50be22aacd = <b>SBAS / DO-229E-beskyttelsesniveauer, ionosfærefri L1/L5 og et DO-316 compliance-kort</b> (modulet <c1/>). <c2/> danner den vægtede geometrimatrix ud fra hver satellits elevation/azimut og fejlbudgettet for UDRE/GIVE/airborne/tropo, inverterer normalmatricen (delt <c3/>) og projicerer varianserne til HPL/VPL via K-faktorerne i DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> tilføjer den ionosfærefri GPS L1/L5-pseudoafstand (IS-GPS-705, <c5/>), valideret til at ophæve motorens uafhængige forsinkelse i ionosfæren af første orden. <c6/> sporer kravene i DO-316/DO-229E til de funktioner, der implementerer dem. Valideret mod lukkede definitioner af K-faktorerne, referencegeometrien <c7/> i numpy og identiteten for kovarians ad to veje; krydstjekket mod RTKLIB/gLAB af de publicerede PL-værdier er dokumenteret som afventende gennemgang i <c8/>.

seg-e9e60b40e42a = <b>Fuldt tesseralt tyngdefelt med kugelfunktioner — EGM2008-feltet til grad/orden { "70" }.</b> Et nyt <c1/> evaluerer geopotentialet og dets acceleration i det jordfaste system ud fra fuldt normaliserede <c2/>-koefficienter med den stabile normaliserede Legendre-rekursion af Holmes–Featherstone (denormalisering ville give overløb ved denne grad). De medfølgende koefficienter er NGA's EGM2008-produkt (public domain, via ICGEM), samlet i <c3/> og gengivet bit-for-bit af <c4/> ud fra den indcheckede <c5/>; enhver ICGEM-model i <c6/> kan indlæses via <c7/>. Valideret mod tre uafhængige referencer: sammenfald med en punktmasse (kun <c8/> = <c9/>), et felt med kun zonale led, der gengiver den eksisterende <c10/> til ~{ "1e-9" }, og den analytiske acceleration, der stemmer med differensgradienten af det direkte summerede potentiale til <{ "1e-6" }.

seg-c33a2dbf851d = <b>Lense–Thirring-acceleration (frame-dragging) fra generel relativitet</b> (<c1/>, IERS { "2010" } ligning { "10.12" }), det gravitomagnetiske led ud over den eksisterende Schwarzschild-korrektion, koblet ind i den numeriske propagator via et nyt flag <c2/>. Valideret som lineær i Jordens impulsmoment og { "1" }–{ "2" } størrelsesordener under Schwarzschild-leddet, det område som målingerne fra LAGEOS / Gravity Probe B ligger i.

seg-909562023109 = <b>Et trait <c1/>, der forener de analytiske og numeriske banepropagatorer.</b> Den numeriske Cowell-propagator med kraftmodel er nu en førsteklasses jævnbyrdig til SGP4: en ny type <c2/> (begyndelsestilstand + <c3/> + <c4/> + valg mellem trindobling eller Dormand–Prince-<c5/>) og <c6/> implementerer begge <c7/>, hvis <c8/> returnerer den inertielle TEME-tilstand i SI-enheder (m, m/s), så de to kan udskiftes bag en <c9/>. SGP4-implementeringen er den præcise omregning km/min→SI af den iboende metode (verificeret ved en ligheds-test); den numeriske implementering består gennem traitet den samme port for præcis Kepler under en meter, de to adaptive drivere stemmer, og en <c10/> bringer den underliggende SGP4-kode frem.

seg-d094880df57b = Denne release lukker det største korrekthedshul i motoren: jordorientering og reduktion mellem referencesystemer sker nu på niveau med en referenceimplementering (valideret <b>bit-for-bit mod ERFA/SOFA</b>), integritetsstakken får <b>ARAIM med to konstellationer</b> på rigtige GPS+Galileo-TLE'er, og lagene for propagering, kvantesensorer, måne/cislunar og geomagnetisme uddybes alle — sammen med et typet Python-API, en rigere browser-playground og en reproducerbarhedsmatrix på tre OS. Højdepunkter:

seg-bfe1d4a7cabd = <b>Referencesystemer, bit-for-bit.</b> Fuld IAU 2000A- og 2000B-nutation, IAU { "2006" }-præcession, den CIO-baserede (X, Y, s) IAU 2006/2000A GCRS↔ITRS-reduktion, IERS-polbevægelse og TEME→GCRS/ITRS som outputsystemer — hver valideret bit-for-bit mod referencerutiner fra ERFA/SOFA.

seg-bb5705347a24 = <b>ARAIM med to konstellationer</b> (GPS + Galileo) på rigtige TLE'er, med HPL/VPL, output som Stanford-diagram og en åben <c1/>.

seg-2865dadcd4c8 = <b>Cislunar PNT</b>: en CR3BP-propagator for Jord–Måne, systemerne MCI↔MCMF, selenografiske koordinater og et kørbart LunaNet-scenarie for månens integritet.

seg-3b636707a158 = <b>Kvantesensing</b>: Coriolis- og AC-Stark-systematik for kold-atom-interferometeret, et driftsweep og validering mod budgettet fra Freier ({ "2016" }).

seg-10bc94801a6a = <b>IGRF-14</b>, den geomagnetiske hovedfeltmodel, selvstændig og valideret.

seg-6485f627d793 = <b>Typet Python-API</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, typestubs) med et wheel-build i CI, plus førsteklasses GCRS/ITRS-output fra propagatoren og CCSDS OMM-eksport.

seg-2b7693641333 = <b>Troværdighed og reproducerbarhed</b>: en direkte sammenligning af SGP4-nøjagtighed mod den uafhængige crate <c1/>, en CI-port for dækning (~{ "97" }% linjer på <c2/>) og en reproducerbarhedsmatrix på tre OS (<c3/>/<c4/>/<c5/>).

seg-32e53ac66056 = <b>Hvert diagram i playground passer nu til sidens tema.</b> Alle tolv SVG-diagramgeneratorer — resultat-/holdover-diagrammet (<c1/> + <c2/>), Allan-deviationsdiagrammet (<c3/>) og hvert scenariediagram (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + tilgængelighed, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — brugte kolde marineblå paneler (<c15/>), kølige grå akser/tekst og en skurrende serie-palet i rødt/blåt/lilla. De bruger nu overalt den varme grafitpalet: <c16/>-paneler, varmt <c17/>-gitter, <c18/>-etiketter, med en konsekvent tildeling af serier — kvante = honninggul (<c19/>), klassisk = varm rav (<c20/>), spec/grænse = <c21/>. Sikkerhedskodede visninger bevarer deres betydning: RAIM Stanford-diagrammet forbliver grønt (tilgængelig) / rav (vildledende) / rødt (farligt) / dæmpet stålgråt (utilgængelig), og HPL/VPL læses som guld/bronze.

seg-2bb31dfc7756 = <b>Diagrammer beskriver nu sig selv, når de gemmes/downloades.</b> Begge diagrammer bager deres titel ind i SVG'en (Allan-diagrammets titel + undertitlen "lower is better" var tidligere kun HTML omkring billedet, så et gemt billede havde ingen billedtekst), og begge har en proveniensfod — <c1/> — så et downloadet diagram kan stå alene og forbliver reproducerbart.

seg-9f528e334cd8 = <b>Hvert diagram har nu proveniensfoden.</b> Foden — <c1/> — stemples centralt for alle scenarietyper i <c2/> (den var tidligere kun på diagrammerne for holdover og Allan), så ethvert gemt eller downloadet billede — fra playground, CLI's eksport med <c3/> eller HTML-scorecardet — angiver sin version, sit scenarieaftryk og sin kilde. Hashen er mærket <c4/> for tydelighedens skyld og stammer fra resultatets <c5/>, hvor den findes, med en reserve ud fra kildehashen for integritets- og månerapporterne. Hvad aftrykket er, og hvorfor det er der, er dokumenteret i afsnittet "Output" i README og i <a1><c6/></a1>.

seg-635697ed3fb1 = <b><c1/> og RAIM Stanford-støjsampleren går nu ikke længere i panik ved input uden for intervallet / der ikke er endelige</b> (et fund fra fuzzing, der afhang af rækkefølgen i <c2/>, fra de nye ARAIM-scenarier). <c3/> beskytter nu <c4/>/<c5/> som <c6/> (returnerer en grænseværdi i stedet for at gå i panik med <c7/>), og <c8/> for Stanford-støj i tilgængelighed begrænser til en strengt positiv σ — så integritets-/ARAIM-stakken aldrig går i panik ved muterede eller fejlkonfigurerede scenarier.

seg-b36a0c42845e = <b>CI-matrix for reproducerbarhed på tværs af platforme.</b> Et nyt job <c1/> kører reproducerbarhedstestene på <b>ubuntu-latest, macos-latest og windows-latest</b> ved hvert push. Fordi det fulde resultat-JSON ikke er byte-identisk på tværs af OS (afvigelse i libm i sidste ULP), hævder det præcist den platformsinvariante projektion — inputaftrykket plus outputformen, fastlåst for hvert scenarie som SHA-256-goldens i <c2/> af den nye <c3/> — ved siden af de numeriske fastlåsninger (<c4/>, til { "1e-6" }), SGP4-tilstandene (<c5/>, til { "2e-5" } km) og determinisme i samme proces (<c6/>). Tilsammen beviser de reproducerbarhed på tværs af platforme på tre OS uden skrøbeligheden ved præcis byte-hashing af hele outputtet. <c7/> dokumenterer opdelingen.

seg-9b8c0a407387 = <b>Port for kodedækning i CI.</b> Et nyt job <c1/> kører <c2/> med den LLVM-kildebaserede motor, udgiver en lcov-rapport som build-artefakt og håndhæver en nedre grænse for linjedækning på <c3/> (genererede datatabeller, CLI-indgangspunktet, testene og web-aktiver er udeladt). Målt linjedækning er ~{ "97" }% på <c4/> (SGP4 og urmodulerne ≥{ "95" }%); porten er sat til { "85" }% — over målet på ≥{ "80" }% og med afstand til den målte værdi, så den fanger regressioner uden at flakke. Et dækningsbadge er udgivet i README.

seg-1dfc4beb239a = <b>SGP4/SDP4 sammenlignet direkte med den uafhængige crate <c1/>.</b> En ny test (<c2/>) krydsvaliderer Kshanas propagator mod det mest udbredte SGP4-bibliotek i Rust (neuromorphicsystems/sgp4, tilføjet som en dev-afhængighed kun til test) over de samme { "666" } vektorer fra AIAA 2006-6753. Når begge køres med tyngdemodellen WGS72, som vektorerne bruger, stemmer de to uafhængige implementeringer til <b>under en mikrometer</b> på jordnære og resonante baner og til <b>{ "4.12" } mm i værste tilfælde</b> på tværs af alle områder, og begge gengiver referencetabellen <c3/>. Den indcheckede sammenligningstabel (<c4/>, regenereret via <c5/>) opdeler resultatet efter område (LEO/MEO, dybt rum, ½-døgns- og 1-døgnsresonans) og noterer de fire bevidst patologiske tilfælde, som craten afviser ved konstruktionen. De levende påstande holder begge inden for { "2e-5" } km af referencen og stemmer indbyrdes inden for { "4e-5" } km — et værn mod regression, ikke en engangsøvelse. Det er konkurrencedygtig stamtavle: korrekthed mod en uafhængig kodebase, ikke blot en statisk tabel. (Craten har som standard <c6/> med WGS84 og afviger derfor fra WGS72-referencen med ~km — ærligt fremhævet i tabellens tekst.)

seg-dc75162ecd64 = <b>CCSDS OMM-eksport kan nu nås ende-til-ende.</b> OMM-skriveren (<c1/>) havde tidligere ingen vej fra CLI/API; de middelelementer, et scenarie af typen <c2/> har, kan nu udgives som et CCSDS 502.0-B-2 OMM-katalog — én OMM KVN-meddelelse for hver TLE-defineret satellit — via <c3/>, eller <c4/> i scenariet skriver automatisk <c5/> (som spejler den eksisterende <c6/>). Hver meddelelse bærer satellittens <b>rigtige</b> NORAD-katalognummer, COSPAR-internationale betegnelse (<c7/>) og epoke (CCSDS-form med dag i året), parset fra TLE-linje { "1" } af den nye <c8/>; navnelinjen bliver til <c9/> (ellers <c10/>). <c11/> er scenariets epoke, ikke vægurstid, så outputtet er reproducerbart. Nyt API: <c12/> / <c13/>, <c14/>, <c15/>. Et syntetisk Walker- eller RINEX-scenarie (uden TLE-middelelementer) giver en fejl i stedet for at udskrive en tom fil. Valideret mod det medfølgende øjebliksbillede <c16/> med 30 satellitter (<c17/>).

seg-036782a2b65e = <b>Interaktive aflæsninger ved markøren på playgroundens diagrammer.</b> Når markøren flyttes hen over et diagram, springer et trådkors til den nærmeste prøve og viser en værdi-tooltip (<c1/>, koblet ind i <c2/>). På Allan-diagrammet viser den τ og hvert urs σ_y(τ); på scenariediagrammerne med tidsserier (urets holdover, dødregning, tidsoverførsel, hybrid PNT, GNSS/INS) viser den tiden og hver suites værdi i diagrammets egne enheder (ns / m / ps / udnyttelse), parset fra resultatet, så aflæsningen svarer til kurven. Specialiserede diagrammer (RAIM, spoof, sweep) får intet overlay. Diagrammerne forbliver selvbeskrivende blob-<c3/>-billeder — overlayet er et gennemsigtigt trådkors + tooltip ovenpå, så download/sammenligning/eksport er uberørt. Koordinatmatematikken (nærmeste prøve, markør→plot-brøkdel, parsing af polylinjer) er enhedstestet (<c4/>, køres i CI).

seg-1588ae024e5d = <b>A/B-sammenligningstilstand i playground.</b> Fastgør en vilkårlig kørsel som baseline A, kør et andet scenarie, og de to vises side om side med en deltatabel over kvalitetsmål (holdover, RMS/p95 for tidssynkronisering, tilgængelighed), som farver vinderen for hvert mål (<c1/>, koblet ind i <c2/>; deltalogikken er enhedstestet i <c3/>, køres i CI). Alle værdier indsættes som tekst og alle diagrammer via blob-<c4/>, så intet fra en scenariestreng nogensinde injiceres som markup.

seg-6e7a99f8f275 = <b>Knapper til download af diagrammer (SVG + PNG).</b> Hvert diagram i playground har nu en værktøjslinje "Download SVG / PNG" i samme tema (<c1/>, koblet ind i <c2/>). SVG giver den trofaste, skalerbare original tilbage; PNG rasteriserer det samme selvbeskrivende billede i 2x til slides og dokumenter. Filerne navngives med deres proveniens — <c3/> — og logikken for filnavn/størrelse er enhedstestet (<c4/>, køres i CI).

seg-4cb87e7dc892 = <b>IGRF-14, den geomagnetiske hovedfeltmodel (<c1/>).</b> Det standardiserede IAGA-felt med kugelfunktioner (grad/orden { "13" }, epoke { "2025.0" } + sekulær variation { "2025" }–{ "2030" }; koefficienterne er maskingenereret fra den officielle <c2/> af <c3/> til <c4/>, bit-for-bit reproducerbart). En Schmidt-normaliseret syntese giver feltvektoren (nord/øst/ned) og afledte elementer (deklination, inklination, horisontal/total intensitet) på ethvert geodætisk sted/dato, plus den geomagnetiske pol og dipolstyrken — det magnetiske modstykke til tyngdekortets matcher for alternativ PNT-navigation. Valideret selvstændigt: syntesen stemmer med den præcise lukkede form for en tiltet dipol, hele det analytiske felt til grad 13 stemmer med en differens af det skalare potentiale, dipolaksen gengiver den kendte geomagnetiske pol (~{ "80.7" }°N, −{ "72.7" }°E) og en styrke på ~{ "29.7" } µT, og det globale felt er fysisk.

seg-c69d50031da4 = <b>Typede Python-bindinger (<c1/>).</b> Ud over <c2/>/<c3/> med streng ind/streng ud udstiller modulet nu en typet klasse <c4/> (<c5/>, <c6/>, <c7/> og en tilgang <c8/>, der returnerer resultatet parset til en native Python-dict — ingen genparsing af JSON, kan pakkes ind i NumPy), plus <c9/>, <c10/> (parset liste af metadata-dicts) og <c11/> (en liste af fejlmeddelelser, der ikke kaster). Leverer en typestub efter PEP { "561" } (<c12/> + <c13/>) til mypy/pyright/editorer og en quickstart i <c14/>. De eksisterende funktioner er uændrede.

seg-fb65ac14344c = <b>Førsteklasses outputsystemer for propagatorer (enum <c1/> <c2/> + <c3/> + <c4/>).</b> Enhver <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) kan nu udskrive sin position i TEME, <b>GCRS</b> (≈ J2000) eller <b>ITRS</b> (jordfast) — TEME native, GCRS via den validerede reduktion TEME→GCRS, ITRS ved at kæde den ind i IAU 2006/2000A CIO-rotationen <c6/> — og sin fulde GCRS-tilstand (position + hastighed) via <c7/>. Det inertielle output for dato er ikke længere kun TEME.

seg-8f596733c439 = <b>CIO-baseret IAU 2006/2000A-reduktion fra himmelsk til jordfast (<c1/>).</b> Den moderne ækvinoksfrie kæde GCRS↔CIRS↔ITRS: CIP-koordinaterne <c2/> aflæst af IAU 2006/2000A-matricen for bias-præcession-nutation (genbruger den validerede FW-præcession + 2000A-nutation med justeringen P03 af <c3/>), serien med 66 led for CIO-lokatoren <c4/> (<c5/>, maskingenereret fra ERFA-referencen af <c6/> til <c7/>, bit-for-bit reproducerbar), matricen GCRS→CIRS (<c8/>), jordens rotationsvinkel (<c9/>) og den fulde rotation GCRS→ITRS (<c10/>, sammensat med den eksisterende IERS-polbevægelse). Valideret <b>bit-for-bit</b> mod de publicerede testvektorer for <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 ved JD_TT { "2453736.5" }), <c12/> og <c13/>. CIO-kæden og den ældre TEME-reduktion med ækvinoks/GMST-1982 vises at stemme op til deres dokumenterede forskel i konvention for sideraltid på ≈{ "2" }·(ækvinokstidsligningen). Det er den stringente reduktion, som sporet med ækvinoks/GMST tilnærmede.

seg-32e6d8dfcebc = <b>Fuld IAU 2000A-nutationsserie (<c1/> <c2/>, <c3/>).</b> Den komplette MHB2000-model — { "678" } luni-solare + { "687" } planetariske led — nøjagtig til < { "0.1" } mas, ved siden af den eksisterende afkortning 2000B med 77 led. Tabellerne er maskingenererede fra referencen <c4/> i IAU SOFA / ERFA af <c5/> til <c6/> (generatoren gengiver den indcheckede fil bit-for-bit), og hele serien — både sættene af fundamentale argumenter fra IERS-2003 og MHB2000 og de planetariske længder — er valideret <b>bit-for-bit</b> mod den publicerede testvektor for <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } ved JD_TT { "2453736.5" }, til { "1e-13" } rad). Standardreduktionen TEME→GCRS beholder 2000B-serien (~{ "1" } mas, under kædens forenkling af hastighedssystemets rotation); <c8/> udstiller matricen for dato på < { "0.1" } mas til kaldere, der har brug for den.

seg-35e9e419d2ae = <b>Kørbart scenarie for månens integritet (<c1/>, <c2/>).</b> Kobler passet for beskyttelsesniveau ved månens sydpol (<c3/> <c4/> → <c5/>) ind i scenariekøreren med et JSON-<c6/> og et SVG-diagram af HPL mod tid, så den cislunare integritetssag kan nås direkte fra CLI. Det bringer ærligt hullet frem: med LANS σ_URE på { "30" } m overstiger HPL ved sydpolen (≈ { "260" }–{ "450" } m) en alarmgrænse på { "50" } m ({ "0" } % tilgængelig) — integritet for PNT på Månen er endnu ikke opnået.

seg-1910e8110b43 = <b>Tilgængelighed af ARAIM med to konstellationer på rigtige GPS+Galileo-TLE'er og kobling til scenariekøreren (<c1/>, <c2/>, <c3/>).</b> Tilføjer <c4/> (den avancerede ARAIM-motor — fejl i enkeltsatellitter <em>og</em> i hele konstellationer — kørt over et tidsgitter) og <c5/> og kobler den ind i køreren <c6/> via et flag <c7/>, så et ARAIM-studie med flere GNSS kan nås direkte fra TOML. En test på reelle data (<c8/>) på medfølgende øjebliksbilleder fra Celestrak af GPS+Galileo fra 2026-06-07 viser, at samling af Galileo løfter ARAIM-tilgængeligheden fra { "0.21" } til { "0.67" } under en krævende VAL på { "12" } m ({ "10.5" }→{ "21.8" } satellitter i sigte), mens tilstanden, der er robust over for konstellationsfejl, grundlæggende er begrænset med kun to konstellationer — den kvantitative grund til, at robust integritet med to konstellationer presser mod en tredje konstellation eller SBAS. Ærlig rest: den numerisk præcise gengivelse af EU ARAIM TN Table A-3 mod en enkelt versionslåst epoke og en Zenodo-fixturepost.

seg-78ab887a4543 = <b>Det cirkulære begrænsede trelegemeproblem (CR3BP) for systemet Jord–Måne (<c1/>).</b> En ny cislunar dynamikkerne, som propagatorerne med to legemer/SGP4 ikke kan levere: bevægelsesligninger i roterende system (<c2/>), en RK4-propagator (<c3/>), Jacobi-konstantens integral (<c4/>) og de fem Lagrange-punkter (<c5/>). Valideret mod lukkede / publicerede ankre: de kollineære punkter for Jord–Måne (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), de præcise ligesidede L4/L5 = (½−μ, ±√3/2, { "0" }), alle fem bekræftet som ligevægte i feltet, Jacobi bevaret med integratorens præcision under propagering og den tilbagedrivende kraft uden for planen, der gør halo/NRHO-baner mulige. Det er grundlaget for at repræsentere en rigtig NRHO. Ærlig rest: differentialkorrigerede periodiske begyndelsesbetingelser for NRHO { "9" }:{ "2" }, den excentriske/efemeride-(DE)-model og den denormaliserede transformation ind i de selenocentriske systemer i <c6/>.

seg-14f4572144f3 = <b>IERS-polbevægelse og reduktionen TEME→ITRF (<c1/>).</b> Tilføjer <c2/> (SOFA <c3/>: <c4/> med TIO-lokatoren <c5/>), <c6/> / <c7/> og <c8/> — den GMST-baserede rotation TEME→PEF efterfulgt af polbevægelse — og fuldender en ITRF-præcis jordfast position oven på <c9/> kun med GMST (polbevægelse er en effekt på titals meter ved banens radius). <c10/>/<c11/> er observerede IERS-størrelser, som kalderen leverer. Ærlig rest: en fuldt CIO-baseret (X, Y, s)-kæde og et numerisk krydstjek med ANISE/SPICE på <{ "10" } m er fortsat opfølgende arbejde.

seg-b5e84faf880c = <b>Systematik i kold-atom-interferometeret, driftsweep og validering mod en publiceret enhed (<c1/>, <c2/>).</b> Udvider det førsteprincip-baserede CAI-accelerometer med de to førende deterministiske systematikker: <b>Coriolis/rotations</b>-fasen <c3/> (<c4/>, med den tilsvarende accelerationsbias <c5/> via <c6/>) og <b>AC-Stark-lysskift</b>-fasen <c7/> (<c8/>, der ophæves af symmetrien π/2–π–π/2 ved et konstant skift). Tilføjer <c9/> (drift af positionen ved dødregning mod cyklustid — kernen i en sammenligning mellem kvante og klassisk) og en valideringstest mod Freier m.fl. { "2016" } mobil gravimeter (arXiv:{ "1512.05660" }): det modellerede gulv for kvanteprojektionsstøj ligger under og inden for ~{ "2" } størrelsesordener af den publicerede kortsigtede støj på { "96" } nm/s²/√Hz. <c10/> opdateret. Ærlig rest: systematik fra bølgefront/strålepegning, løsning af stribemultiplicitet, den præcise gengivelse af flyvetesten for CARIOQA-PMP / Boeing-AOSense (kræver publicerede PSD'er for platformen) og en forudindstilling i JS-playground.

seg-f32829ed9cf1 = <b>Cislunar systemreduktion og et integritetspas ved månens sydpol (<c1/>).</b> Udvider månens ARAIM-motor med rotationen MCI↔MCMF (Moon-centered inertial ↔ Moon-fixed) (<c2/> / <c3/>, en forenklet model med middelrotation med månens sideriske rate), selenografisk bredde/længde/højde (<c4/> / <c5/>) og <c6/> — en landet modtager i Artemis-området mod et repræsentativt sæt af LunaNet-relæer over et pas på { "24" } h, som ærligt kvantificerer integritetshullet: med den nominelle LANS σ_URE på { "30" } m er beskyttelsesniveauet endeligt, men overstiger en alarmgrænse på { "50" } m for overfladeoperationer. Ærlig rest: den præcise LANS NRHO-efemeride (en cislunar bane med 3 legemer), den fysiske libration / præcesserende månepol (DE421/SPICE) og et LunaNet TOML-scenarie er fortsat opfølgende arbejde.

seg-5ef720855cc4 = <b>ARAIM-meddelelse om integritetsstøtte, Stanford-diagram som SVG og den åbne ARAIM-reference (<c1/>, <c2/>).</b> Tilføjer en eksplicit <c3/> (σ_URA / σ_URE / b_nom / P_sat / P_const, med WG-C-referenceværdierne for GPS+Galileo og omregnerne <c4/> / <c5/> ind i motorerne for enkeltfejl <c6/> og for fejl i hele konstellationen <c7/>), en selvstændig renderer <c8/> af Stanford-integritetsdiagrammet (de fire zoner, grænsen <c9/>, hjælpelinjerne for alarmgrænsen, én farvekodet markør for hver epoke) og <c10/>, der dokumenterer algoritmen, ISM, fejlhypoteserne, kontrakten for beskyttelsesniveauet og fordelen ved to konstellationer. Testene viser gevinsten i geometri/redundans (samling af en anden konstellation strammer HPL ved enkeltfejl) og tolerance over for konstellationsfejl (brugeren med to konstellationer overlever tabet af en hel konstellation; en bruger med en enkelt konstellation kan ikke). Ærlig rest: numerisk gengivelse af EU ARAIM TN Table A-3 / tallet for tilgængelighed på { "15" }–{ "25" } % mod et versionslåst øjebliksbillede af rigtige TLE'er, en Zenodo-fixturepost og kobling af <c11/> ind i køreren for scenariefiler.

seg-3607eb34acd9 = <b>IAU 2000B-nutation og den fulde inertielle reduktion TEME→GCRS/J2000 (<c1/>).</b> Tilføjer det andet og tredje stykke af en ægte inertiel reduktion af referencesystemer oven på den leverede IAU { "2006" }-præcession: MHB2000-nutationsserien med 77 luni-solare led (<c2/>, den standardiserede IAU 2000B-afkortning med nøjagtighed på ~{ "1" } mas) med de fundamentale argumenter af Delaunay og SOFA-nutationsmatricen <c3/>, og kæden fra Vallado AIAA-2006-6980 TEME→TOD (ækvinokstidsligningen) → TOD→MOD (nutation) → MOD→GCRS (bias-præcession), udstillet som <c4/> / <c5/>. Serien, argumenterne og enhedskonstanterne er afskrevet fra referencen <c6/> i IAU SOFA / ERFA og valideret <b>bit-for-bit</b> mod den publicerede testvektor for <c7/> (Δψ, Δε til { "1e-13" } rad). Ærlig rest: den fulde IAU 2000A-serie med 678 led (<{ "0.1" } mas), et numerisk krydstjek med ANISE/SPICE på <{ "10" } m og polbevægelse er fortsat opfølgende arbejde (se <c8/>).

seg-d9b5e459f6eb = Denne release bringer Kshanas første <b>ikke-analytiske banepropagator</b> — en Cowell-integrator med en hierarkisk kraftmodel med seks perturbationer (to legemer + zonale led J2–J6 + Sol/Måne som tredje legeme drevet af epoken + solstrålingstryk med en konisk skygge af umbra/penumbra + atmosfærisk modstand + den post-newtonske relativistiske Schwarzschild-korrektion) drevet af et valg mellem to adaptive integratorer (RK4 med trindobling og det indlejrede par Dormand–Prince RK5({ "4" })) — sammen med et lag til manøvre- og banedesign (impulsive og endelige brændinger, en Lambert-løser af Izzo og et porkchop-sweep), et alt-PNT-lag med tyngdekortmatchning, der genfinder et spor på 60 minutter uden GPS til under { "500" } m, en pipeline for banebestemmelse med batch og sekventiel og et fuldt tæt koblet GNSS/INS-UKF med 17 tilstande med dødregning med kvante-CAI. Hver numerisk funktion er fastlåst mod analytisk reference eller en håndafledt lukket form; de perturbationer, der er slået fra som standard, lader de udgivne goldens være urørte.

seg-aa8d478f5c10 = <b>Post-newtonsk (Schwarzschild) relativistisk korrektion (<c1/> + <c2/>).</b> Tilføjer den dominerende perturbation fra generel relativitet på en bane nær Jorden — den førende årsag til den relativistiske periapsisdrejning — i IERS / Montenbruck–Gill-formen med <c3/> <c4/>. Som atmosfærisk modstand er den <b>hastighedsafhængig</b>, så den kører med på højresiden af integratoren <c5/> via [<c6/>], frivillig og slået fra som standard. Valideret selvstændigt: på en cirkulær bane falder den sammen med den lukkede form <c7/> (rent radial og <b>udadrettet</b>, komponenter uden for aksen er præcis nul); dens <b>forhold til to legemer er den lærebogsmæssige <c8/> i LEO</b> (signaturen <c9/>); et tilfælde med radial hastighed stemmer med den håndforenklede <c10/>; og i propagatoren <b>forstyrrer den banen uden at sprede den</b> — den halve storakse bevares til godt under en meter/døgn, det strukturelle modstykke til modstandens monotone henfald. Fordi den er slået fra som standard, er goldens for to legemer/J2/zonale led urørte. Tuning af PPN-parametre (<c11/>,<c12/>) og Lense–Thirring-leddet (frame-dragging) er fortsat opfølgende arbejde.

seg-043e831224ab = <b>Konisk skyggemodel for umbra+penumbra (<c1/>), nu brugt af solstrålingstryk.</b> Opgraderer den binære formørkelse med umbra-cylinder til en glat faktor <c2/>: Solen og Jorden modelleres som skiver med tilsyneladende vinkelradier <c3/>, <c4/> med tilsyneladende afstand mellem centrene <c5/>, og <c6/> er én minus den brøkdel af Solens skive, som Jordens skive dækker (arealet af overlappet mellem to cirkler) — fuld sol for <c7/>, total umbra for <c8/>, ringformet for <c9/> og en kontinuert penumbra imellem. <c10/> bruger den nu, så SRP-kraften aftager glat gennem formørkelsen i stedet for at slå til/fra. Tilføjer den nominelle IAU-værdi <c11/>. Valideret selvstændigt: <c12/> i fuld sol og <c13/> dybt i umbraen (præcist), en <b>glat monoton penumbra</b> (<c14/> stiger { "0" } → ~½ ved <c15/> → { "1" } over båndet <c16/>), og den koniske penumbra <b>rækker ud over umbra-cylinderen</b> (et punkt, som den binære cylinder kalder fuldt belyst, er <c17/> for keglen). Den enklere <c18/> er stadig tilgængelig; Solens randmørkning og den fladtrykte Jords skygge er fortsat opfølgende arbejde.

seg-8d1c16019f3c = <b>Indlejret integrator Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Tilføjer det standardiserede indlejrede par af Dormand–Prince ({ "1980" }) med Butcher-tableau ved siden af den eksisterende driver med RK4 og trindobling: syv FSAL-trin giver en løsning af 5. orden og et fejlestimat af 4. orden ud fra ét sæt evalueringer ({ "7" } mod { "11" } funktionskald pr. trin), et billigere estimat af den lokale fejl. Den adaptive driver genbruger den samme RMS-fejlnorm og trinregulatoren <c4/>, så den er et alternativ, der kan sættes direkte ind; <c5/> udstiller den på kraftmodellen for banen. Valideret selvstændigt: det indlejrede fejlestimat er <b>O(h⁵)</b> (halvering af trinnet skærer det ~{ "32" }×); DP5({ "4" }) integrerer <c6/> til <c7/> og den harmoniske oscillator over { "50" } perioder med bevarelse af energi til <{ "1e-6" }; den når det samme endepunkt ved den samme tolerance med <b>færre funktionsevalueringer</b> end trindobling (uden at ofre nøjagtighed); og <c8/> består den samme port mod analytisk reference som RK4-vejen — <b>under en meter mod den præcise Kepler-løsning med universelle variable over en LEO-bane på { "24" } h</b> — mens de to drivere stemmer til <{ "1" } m på en bane med J2..J6 (ingen lukket form). Højere indlejrede par (RKF7({ "8" }) / DOP853) er fortsat opfølgende arbejde.

seg-cca3c00757d6 = <b>Atmosfærisk modstand koblet ind i propagatoren som dens første hastighedsafhængige kraft (<c1/> + <c2/> + <c3/>).</b> Tilføjer <b>stykkevis eksponentiel atmosfære efter Vallado Table 8-4</b> <c4/> ({ "28" } bånd fra havniveau forbi { "1000" } km, begrænset under overfladen) og den kvadratiske modstand <c5/> mod den <b>medroterende atmosfære</b> <c6/> (<c7/>). Fordi modstand afhænger af hastighed, får <c8/> en ny <c9/>, og højresiden af integratoren sender nu hastigheden videre (<c10/>); den rent positionsafhængige <c11/> er uændret, så de konservative led og goldens er urørte. Valideret selvstændigt: densiteten <b>forankres ved værdien { "1.225" } kg/m³ ved havniveau</b>, begrænses under overfladen, <b>aftager monotont</b> gennem LEO, ligger i det solgennemsnitlige bånd ~{ "1e-12" } kg/m³ ved { "400" } km, og dens <b>genfundne lokale skalahøjde (≈ { "58" } km ved { "400" } km)</b> er fysisk; modstanden <b>modvirker den medroterende relative hastighed</b> med størrelsen ~{ "2e-6" } m/s² i LEO for <c12/>; og — den afgørende signatur — modstanden er <b>dissipativ</b>: en bane på { "300" } km mister specifik energi <b>monotont</b>, og dens halve storakse <b>aftager med et afgrænset ~km/døgn</b>, hvor baselinen i vakuum bevarer energien til <{ "1e-9" }. NRLMSISE-00-densiteten for termosfæren (klausulen om densitet i modstand på < { "5" } %) er fortsat opfølgende arbejde.

seg-0d20f02ef85f = <b>Solstrålingstryk koblet ind i propagatorens kraftmodel, drevet af epoken (<c1/> + <c2/>).</b> Tilføjer den <b>SRP-model med kanonkugle</b> <c3/> med en <b>formørkelsesfaktor for cylinderskygge</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): strålingstrykket <c5/> ud fra den moderne totale solindstråling på { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), aftagen af fluxen med kvadratet på afstanden <c6/> og det radiale skub <b>væk fra Solen</b>. Den kører med på den <b>samme epokedrevne højreside</b> som tredjelegemet og sampler Solen <c7/> én gang ved den fremskredne epoke <c8/>, delt mellem Solen som tredjelegeme og SRP. Kan sammensættes: <c9/>. Valideret selvstændigt mod håndafledte signaturer: <b>strålingstrykket ved 1 AU fastlåses til sit lærebogsmæssige ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; SRP for en fuldt belyst LEO-satellit er <b>bit-identisk</b> med kanonkugleformlen, peger <b>væk fra Solen</b> og ligger i <b>båndet ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> for cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>en fordobling af afstanden til Solen firedeler størrelsen</b> (omvendt kvadrat); <b>cylinderskyggen formørker kun umbra-cylinderen</b> (modsolrettet <em>og</em> inden for én Jordradius af linjen Jord–Sol) og giver <b>præcis nul</b> SRP i formørkelse; og i propagatoren <b>forstyrrer SRP en LEO-bane med en lille afgrænset størrelse, der skalerer ~lineært med A/m</b> — mens en model uden perturbationer forbliver bit-for-bit tidsuafhængig, så goldens for to legemer/J2/zonale led er urørte. Den koniske umbra/penumbra (glat ν ∈ [{ "0,1" }]), atmosfærisk modstand og ekstern krydsvalidering med GMAT/Orekit er fortsat opfølgende arbejde.

seg-d3f819c21660 = <b>Sol/Måne som tredjelegeme drevet af epoken, koblet ind i propagatorens tidsvarierende højreside (<c1/> / <c2/>).</b> Perturbationen fra tredjelegemet er ikke længere et selvstændigt kraftled — den integreres nu af Cowell-propagatoren som en ægte <em>tidsvarierende</em> kraft: hver evaluering af højresiden sampler positionerne af Sol/Måne <c3/> ved den <b>fremskredne epoke <c4/></b> (genbruger <c5/> til omregningen mellem dage og århundreder), så forstyrrerne bevæger sig langs deres baner under integrationen i stedet for at være frosset ved starten. Kan sammensættes med enhver tyngdemodel (<c6/>). Valideret selvstændigt: solleddet på højresiden er <b>bit-identisk</b> med <c7/> evalueret ved efemeridepositionen for det øjeblik ved både <c8/> og <c9/> (hvilket præcist beviser koblingen mellem { "86400" } s ↔ { "1" } døgn ↔ 1/36525 århundrede), forstyrreren <b>rykker ~{ "2.6" }·10⁹ m/døgn</b> mellem prøverne (ikke frosset), de <b>øjeblikkelige tidevandsstørrelser i LEO</b> rammer de lærebogsmæssige bånd ~{ "5" }·{ "10" }⁻⁷ m/s² (Sol) og ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Måne, ≈ { "2" }× Solen), hvert legeme <b>forstyrrer målbart banen over et døgn, mens det forbliver afgrænset</b>, og den samme begyndelsestilstand propageret ved <b>epoker et kvartal fra hinanden giver en anden bane</b> (tidevandsaksen drejer { "90" }°) — mens en model uden nogen af legemerne slået til er bit-for-bit tidsuafhængig, så goldens for to legemer/J2/zonale led er urørte. Efemeridenøjagtighed i DE-klassen og ekstern krydsvalidering med GMAT/Orekit er fortsat opfølgende arbejde.

seg-0a517f6c4b1b = <b>Månens efemeride med lav præcision (<c1/>), der fuldender parret Sol/Måne som tredjelegeme.</b> Tilføjer den lavpræcise måneserie af Montenbruck & Gill (<c2/>) ved siden af solmodellen, så den legemeuafhængige <c3/> nu kan drives af begge himmellegemer <b>uden nogen ekstern DE/SPK-kerne</b>. Valideret selvstændigt mod håndafledte signaturer for Månen: den geocentriske afstand holder sig inden for den virkelige <b>kuvert fra perigæum/apogæum (~{ "356 500" }–{ "406 700" } km)</b> over en måned, og dens <b>månedlige middel genfinder den halve storakse på ~{ "384 400" } km</b>; den <b>ekliptiske bredde overstiger aldrig månebanens inklination på ~{ "5.3" }°</b> (kontrolleret ved projektion på ekliptikas pol i ækvatoriale koordinater, hvilket validerer breddeserien og rotationen for skråstillingen sammen); Månens <b>retning vender tilbage til inden for { "1" }° efter én siderisk måned ({ "27.3217" } d)</b>, og dens <b>daglige bevægelse holder sig i det fysiske bånd { "12" }–{ "15" }°/døgn</b>; og perturbationen fra Månen som tredjelegeme på en LEO-satellit har den <b>lærebogsmæssige størrelse ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ det dobbelte af Solens). Positionsnøjagtighed i DE-klassen, atmosfærisk modstand og SRP er fortsat opfølgende arbejde.

seg-8b7025e00dd1 = <b>Tyngdekraft fra et tredjelegeme (Solen) med en indbygget lavpræcis efemeride (<c1/>, <c2/>).</b> Tilføjer perturbationen fra tredjelegemet til kraftmodellen: <c3/> (direkte tiltrækning minus det indirekte led, som det geocentriske system skal trække fra), hvor Solens position leveres af den nye serie i modulet <c4/>, den analytiske lavpræcisionsserie af Montenbruck & Gill — <b>ingen ekstern DE/SPK-kerne nødvendig</b> til en kørsel med lav præcision. Valideret selvstændigt: accelerationen <b>stemmer med den præcise gradient af sit eget forstyrrende potentiale</b> (<c5/>), perturbationen <b>forsvinder i geocentret</b> og har den <b>lærebogsmæssige størrelse ~{ "5" }·{ "10" }⁻⁷ m/s² på en LEO-satellit</b>, og Solens efemeride rammer håndafledte ankre i J2000 — <b>perihelafstand ≈ { "1.471" }·10¹¹ m</b>, <b>deklination ≈ −{ "23" }° nær decembersolhverv</b>, en tilsyneladende bevægelse på <b>≈ { "1" }°/døgn</b> (≈ { "90" }° pr. kvartal) og en afstand, der holder sig inden for kuverten på { "0.983" }–{ "1.017" } AU for Jordens bane gennem et helt år. Leverer halvdelen med tredjelegemet i trinnet om kraftmodellen i milepælen for den numeriske propagator (Månen leveres i et ledsagende punkt ovenfor); positionsnøjagtighed i DE-klassen, atmosfærisk modstand og SRP er fortsat opfølgende arbejde.

seg-99fd6ae1ea09 = <b>Kraftmodel med zonale harmoniske J2–J6 (<c1/> / <c2/>).</b> Udvider kraftmodellen i Cowell-propagatoren ud over J2 til hele Jordens zonale felt til og med grad { "6" } (de standardiserede publicerede ikke-normaliserede <c3/> fra EGM-96), koblet ind i propagatoren som <c4/>. Accelerationen er den <b>præcise analytiske gradient</b> af det zonale forstyrrende potentiale <c5/> (Legendre-polynomier ved opadgående rekursion), valideret på tre uafhængige måder: den <b>reduceres til den ved 666 vektorer validerede <c6/> til maskinpræcision</b>, når den begrænses til <c7/>; den <b>stemmer med den numeriske gradient af sit eget potentiale</b> gennem hele feltet J2..J6 (den afgørende kontrol for et konservativt felt); og de ulige led <c8/> mod de lige led <c9/>/<c10/> udviser deres <b>karakteristiske (anti)symmetri mellem nord og syd</b> under <c11/> — asymmetrien i pæreformen. En propageret bane med J2..J6 bevarer den samlede energi (kinetisk + central + zonalt potentiale) til ~{ "1e-8" } over et døgn og forstyrrer banen med kun J2 med en lille størrelse forskellig fra nul. Det leverer trin 2 ("zonale harmoniske J2–J6") i milepælen for den numeriske propagator; det tesserale felt af høj grad i EGM, modstand, SRP, tredjelegemer og ekstern krydsvalidering med GMAT/Orekit er fortsat opfølgende arbejde.

seg-59f0ba5a6269 = <b>Numerisk (Cowell) banepropagator (<c1/>).</b> Kshanas første <b>ikke-analytiske</b> propagator (resten af banestakken er analytisk SGP4/SDP4): den kobler kraftmodellen med to legemer + J2 (<c2/>) ind i den adaptive driver med RK4 og trindobling (<c3/>) som <c4/>, med en omskifter <c5/>. Valideret mod en <b>analytisk reference, der er stærkere end et numerisk krydstjek mod et andet værktøj ville være</b>: den uforstyrrede bane gengiver den <b>præcise Kepler-løsning med universelle variable til under en meter over en LEO-bane på 24 timer</b> (en strammere port end "mod en numerisk reference < { "10" } m", som milepælen formulerer det), specifik energi og impulsmoment bevares til ~{ "1e-9" } relativt, og J2-regressionen af knuden gengiver den lukkede form <c6/> til første ordens teori (inden for { "2" } %, resten af orden O(J2²)). Tilføjer også <c7/>, en Newton-løser til Keplers ligning, der <b>returnerer <c8/> i stedet for et tavst forkert svar</b>, når den ikke konvergerer inden for et afgrænset iterationsbudget (tilfældet med <c9/> nær perigæum). Ærligt omfang: kraftmodellen er kun to legemer + J2 — det tesserale felt af høj grad i EGM ({ "200" }×{ "200" } + indlæser), modstand (NRLMSISE-00), SRP, kræfter fra tredjelegemer og et eksternt krydstjek med GMAT/Orekit er fortsat opfølgende arbejde.

seg-d4c7c29f09d1 = <b>Tyngdekortmatchning uden GPS i 60 minutter til < { "500" } m (<c1/>).</b> Uddyber alt-PNT-laget til valideringsmålet for ESA NAVISP <em>Quantum Wayfarer</em>: et køretøj flyver et spor på ~{ "700" } km gennem et GNSS-udfald på en hel time — dets inertielle løsning driver til <b>≈ { "70" } km</b> — og en kold-atom-gravimeter plus en <b>hierarkisk grov-til-fin</b> partikel-/gittermatcher genfinder den konstante INS-drift til <b>≈ { "145" } m</b> (< { "500" } m), en reduktion på > { "480" }×. Gravimeterets virkelige hvide støjgulv tilføres som en <b>deterministisk sådd</b> sekvens, så matcheren aldrig får støjfri reference, men kørslen alligevel er præcis reproducerbar (verificeret bit-identisk og stabil til nogle få meter på tværs af støjrealiseringer). En test på regressionsniveau viser, at forfiningen er <em>nødvendig</em> — et enkelt groft gitter går i stå ved ~{ "2" } km, kun forfining i tre trin bryder barrieren på { "500" } m. Nyt indchecket scenarie <c2/>. Rækken <c3/> forbliver ærligt <b>delvis</b> (der er stadig intet medfølgende EGM2008-kort), og dens evidens er opdateret til resultatet på < { "500" } m ved 60 min. Ærligt omfang uændret: felt med kugelfunktioner af lav grad + syntetiske mascons; en Monte Carlo over realiseringer af fejl i kortrepræsentationen er fortsat opfølgende arbejde.

seg-4262a99328bb = <b>Register over overdrevne påstande + værn mod regression (<c1/>, <c2/>).</b> Lukker sporet for ærlighed og fjernelse af påstande: de fjorten overdrevne påstande, som en tidligere revision katalogiserede (<c3/>…<c4/>), er nu alle GREEN — de stærke påstande (<c5/> koblet Kalman-filter for ur+position, <c6/> jamming J/S→C/N₀→tab af lås, <c7/> fysik for Mach–Zehnder-CAI, <c8/> ARAIM HPL/VPL) er <b>afløst af leverede, testede funktioner</b> frem for en afdæmpet formulering, og de øvrige rækker er frataget påstanden, så de svarer til koden. En ny CI-test skanner de levende offentlige flader (<c9/>, <c10/>, <c11/>, <c12/>) og fejler, hvis en pensioneret nøgen formulering af en overdrevet påstand dukker op igen uden forbehold, så en GREEN række ikke i tavshed kan gå tilbage. "Integritets"-kvalitetsmålet for hver kørsel er stadig ærligt mærket <em>filterets selvkonsistens</em> (ikke luftfartsintegritet); den reelle ARAIM HPL/VPL vises separat, så de to aldrig blandes sammen.

seg-27da62a7ff63 = <b>Navigation med tyngdekortmatchning (alt-PNT uden GPS).</b> Nyt <c1/> tilføjer det alt-PNT-funktionslag, som ESA NAVISP's studier <em>Quantum Wayfarer</em> / QT-CCI om tyngdekortmatchning efterlyser: en <b>målemodel for kold-atom-gravimeter</b>, hvis hvide støjgulv er afledt af ASD for CAI-accelerometeret (<c2/>); et <b>tyngdeanomalifelt med kugelfunktioner</b> af lav grad og fuld normalisering (valideret mod de lukkede Legendre-funktioner <c3/>, <c4/>, <c5/> og en håndafledt anomali med ét led på { "1.897" } mGal) plus syntetiske <b>mascons</b> til de lokale træk af høj grad; og et <b>partikelfilter til tyngdekortmatchning</b> (sammensat af <c6/> + <c7/>), der genfinder et spor uden GPS ud fra den anomalisekvens, det flyver igennem. Et indchecket NAVISP-benchmark (<c8/>) skærer en fri inertiel drift på ~{ "73" } km ned til nogle få km. Ærligt omfang: Kshana medfølger <b>ikke</b> hele koefficientsættet EGM2008 på { "2190" }° — feltet er af lav grad + mascons, ikke et rigtigt kort med høj opløsning; indlæseren til EGM/EIGEN, magnetkort, terrænstøttet SLAM og kobling af <c9/> i scenariemotoren med et SVG-diagram af drift er fortsat opfølgende arbejde. Række <c10/> "Gravity-map / alt-PNT navigation" → <b>delvis</b>.

seg-d028a2db7837 = <b>Manøvremodellering og brohoved for banedesign.</b> Nyt <c1/> tilføjer det første lag for banedesign over SGP4: impulsive ΔV-knuder, der anvender en diskontinuitet i hastigheden og fører en kovarians på { "6" }×{ "6" } videre (deterministisk brænding ⇒ identitet som tilstandsovergang; kovariansen for udførelsesfejl roteres fra brændingens system — ECI eller LVLH — ind i hastighedsblokken), en integration af endelig brænding (konstant fremdrift over en brændebue med massen som tilstand), hvor den opnåede ΔV kontrolleres mod den lukkede <b>Tsiolkovsky</b>-raketligning til bedre end { "0.01" } %, en <b>Lambert</b>-løser af <b>Izzo-2015</b> med én omdrejning (<c2/>, <c3/>, flyvetid ⇒ <c4/>, <c5/>), en præcis <b>Kepler-propagator</b> med universelle variable (reference for to legemer) og et <b>porkchop</b>-sweep, der afbilder et gitter af affyringsepoke × ankomstepoke til C3 ved afgang og V∞ ved ankomst, udskrevet som et 2D JSON-array til konturgengivelse i browseren. Valideringen er selvstændig og stærkere end en tutorialaflæsning: hvert Lambert-output sendes rundt gennem Kepler-propagatoren (det skal lande tilbage på <c6/>), og porkchop-minimummet kontrolleres mod det analytiske gulv for C3 ved Hohmann-transfer for to koplanare cirkulære baner. Kshana placerer dette som laget for ydelsessimulering over GMAT/Orekit, ikke som en erstatning (grene med flere omdrejninger og en rigtig planeteefemeride er fortsat uden for omfanget). Ti tests.

seg-cbdd0e56d89f = <b>Fuldt tæt koblet GNSS/INS-UKF med 17 tilstande med dødregning med kvante-CAI.</b> Nyt <c1/> bærer hele den inertielle navigationstilstand, som et tæt koblet filter estimerer — <c2/> ({ "17" } tilstande) — propageret gennem strapdown-mekaniseringen drevet af den målte specifikke kraft og vinkelhastighed, med rotationen fra legeme til inertialsystem <c3/> for små vinkler, så fejl i attitude kobler ind i vandret acceleration (den standardmæssige INS-tiltkobling). Under et GNSS-udfald glider det kun på IMU; procesindstøjen for velocity random walk er den afledte <c4/> (<c5/>) for kold-atom-interferometerets accelerometer, så driften ved dødregning er den, som kvantesensoren begrænser — et udfald på 120 sekunder forbliver afgrænset til nogle få hundrede meter mod de kilometer, som en fri INS af navigationsklasse ville nå. Opdateringen af pseudoafstand/afstandsrate køres gennem det delte unscented-filter (med α = { "1" } for velkonditionerede vægte ved denne tilstandsstørrelse). Fem tests: identitet for målemodellen, integration med konstant hastighed med perfekt IMU, GNSS-støtte, estimering af accelerometerets bias og benchmarken for udfald på 120 s begrænset af CAI.

seg-087521bb32b7 = <b>Ærlig indramning af kvantepositionering.</b> Den overordnede beskrivelse er nu konsekvent <b>"PNT-resilience simulator with quantum-sensor performance models"</b> i README's tagline, citationslinjen, <c1/> (titel + abstract) og bannerillustrationen — og erstatter den løsere markedsføringsformulering "hybrid quantum/classical PNT simulator". README's afsnit <em>What it is / is not</em> får en eksplicit afgrænsning <b>"It is not (yet)"</b> (ikke en førsteprincip-baseret fysikmotor for atominterferometri, ikke en GNSS-modtager/PVT-løser, ikke et værktøj til missionsdesign), og en ny <c2/> på øverste niveau gør <b>kvantefysiklaget til et P2-punkt</b> (Mach–Zehnder-CAI-fase, projektionsstøj, vibrationstensor), så læserne ved, at fysikken fra første principper er afgrænset og på vej, ikke opgivet. Ingen ændring i adfærd eller API.

seg-f8fa36190ec7 = Handelsstudie af konstellationsdesign: Walker-designsweep med en Pareto-front, JSON for revisit-tid og en validering af Walker-formlen under en kilometer.

seg-31518e92d8cf = <c1/> får <c2/>, som kører et gitter <c3/> (fx et handelsstudie på { "3" }×{ "3" }) ved fast inklination og tabulerer for hvert design dækningsbrøken, PDOP i værste tilfælde og det maksimale/gennemsnitlige hul i revisit; <c4/> markerer de ikke-dominerede designs (færre satellitter, mere dækning, lavere PDOP, kortere revisit), og <c5/> serialiserer cellerne og Pareto-fronten — felter for revisit-tid medregnet — som JSON. Ny validering fastlåser generatoren til Walker-formlen <c6/>: satellitter i samme plads i nabobaner vises at kunne afbildes på hinanden ved en præcis rotation <c7/> til <b>under { "1" } km over fulde { "24" } h</b> af SGP4-propagering (den korte J2-periodiske vejrtrækning er fælles og ophæves), og pladserne i baneplanet bekræftes i gennemsnit at ligge med afstanden <c8/>. Bygger på det indcheckede rigtige øjebliksbillede fra Celestrak <c9/> 2021-07-28 (<c10/>, afprøvet af testene for scenariedækning og SP3-rundtur).

seg-71d257587c28 = <b>Avanceret overførsel af tid og frekvens: TWSTFT, GNSS common-view, PPP, optisk, tilpasning af potenslov efter IEEE-1139 og et urensemble.</b> Nyt <c1/> bygger de operationelle overførselsmetoder oven på de leverede lukkede former for Sagnac/common-view og værktøjerne for Allan-stabilitet. <c2/> giver Sagnac-korrektionen for Two-Way Satellite Time and Frequency Transfer som sløjfesummen over tre hop, præcis lig med BIPM's lukkede form <c3/> (krydstjekket af den uafhængige <c4/>); <c5/> udskriver en serie <c6/> over ét døgn og dens TDEV. <c7/> tager enkeltdifferens mellem to syntetiske jordstationer, så satellittens ur ophæves. <c8/> + <c9/> er den ionosfærefri PPP-kombination og løsningen for modtagerens ur mod en (syntetisk) reference af SP3-klasse, som præcist ophæver ionosfæren af første orden. <c10/>, <c11/> og den lognormale <c12/> med enhedsmiddel modellerer den scintillation, turbulens giver på et optisk link i fri luft. <c13/> er en fuld tilpasning med mindste kvadrater af fem koefficienter efter IEEE-1139 <c14/> til Allan-variansens kurve (alle fem kanoniske støjprocesser på én gang), hvor den dominerende proces rapporteres for hver τ-dekade. <c15/> danner en papirtidsskala vægtet med omvendt varians, hvis Allan-deviation falder strengt under det bedste bidragende ur. { "31" } enhedstests; valideringsmålene er lukkede former og syntetisk reference — en rigtig indlæsning af BIPM Circular-T / IGS SP3 mangler stadig.

seg-c3ab93e7324f = IONEX-ionosfærekort: filparser, interpolation i tid og kortlægning af skråstilling.

seg-7b94a515ce2b = <c1/> får <c2/>, som læser filformatet IONEX (definition af gitter i headeren + blokke <c3/>) ind i en sekvens af <c4/>-kort — og normaliserer filens bredderækkefølge fra nord til syd til et <c5/> med positivt trin og skalerer værdier med <c6/>. <c7/> blander to på hinanden følgende kort til en forespørgselsepoke, og <c8/> / <c9/> afbilder den lodrette TEC på en skrå stråle via tyndskalsfaktoren for ét lag <c10/> (<c11/>). Sammen med den leverede gittermodel gør de et målt globalt ionosfærekort fra IGS til en brugbar skrå forsinkelse.

seg-2ed90763cf11 = Konstellationsdesign: dimensionering efter streets-of-coverage + sammenligning af flere konstellationer.

seg-326e8957bb10 = <c1/> får <c2/>, en idealiseret løser for mindste antal satellitter efter streets-of-coverage — ud fra den leverede halvvinkel for dækning <c3/> og gadens halvbredde <c4/> dimensionerer den den næsten polære konstellation til kontinuert enkelt global dækning som <c5/> baneplaner (fx kræver et plan med 4 satellitter i GPS-højde { "2" } planer, { "8" } satellitter), og rapporterer <c6/>, når satellitterne er for spredte til at danne en kontinuert gade. <c7/> er værktøjet til at sammenligne flere konstellationer: det scorer hvert navngivne Walker-design på den samme station/det samme vindue via <c8/> og returnerer deres dækning / PDOP / størrelse side om side. Ærligt omfang: Rider-korrektionen, der er præcis ved sømmen i grænsen mellem modroterende baneplaner, og en 3D-dækningsglobus er fortsat opfølgende arbejde.

seg-90f5ec9ff4ae = Spoof-detektion i flere lag: paritetsdetektor for RAIM-konsistens + fusion af lag.

seg-a0e4878bea45 = <c1/> får det tredje og sidste detektionslag og fusionstrinnet: <c2/> tilpasser med mindste kvadrater løsningen for position/ur til et redundant sæt pseudoafstande og tester den resterende vægtede sum af kvadrater af residualer mod dens tærskel χ²<c3/> — og markerer en forskudt <em>delmængde</em> af satellitter, mens en <em>fælles</em> bias (absorberet af modtagerens ur) korrekt efterlades usynlig for RAIM i stedet for at blive tilsløret. <c4/> kombinerer lagene for paritet, AGC og SQM til én vægtet beslutning, der registrerer, hvilke lag der udløste. En Monte Carlo karakteriserer detektoren: empirisk <b>P_fa ≈ { "0.068" }</b> mod et designpunkt på { "0.05" } og <b>missede detektioner, der falder fra { "0.885" } ved en spoof-bias på 2σ til { "0.16" } ved 8σ</b>. Ærligt omfang: krydsvalidering mod specifikke publicerede testvektorer for spoofing (Spirent / ION GNSS+) kræver disse eksterne datasæt og er fortsat opfølgende arbejde.

seg-2413b3d10f5b = <b>Valideringsensemble for koblet mod afkoblet Kalman.</b> En Monte Carlo med 100 forsøg i <c1/> kvantificerer værdien af at bære krydskovariansen mellem position↔ur: en trofast indlejret afkoblet baseline (valideret bit-for-bit mod den leverede <c2/>) behandler de samme data med krydsblokkene nulstillet, og efter næsten degenererede pseudoafstande plus en positionsbestemmelse kun med uret genfinder det koblede filter positionen til <b>{ "2.97" } m RMS mod det afkoblede filters { "48.8" } m og vinder { "97" } af { "100" } forsøg</b> — urets fix skærper kun positionen gennem den korrelation, som den afkoblede bevispakke kasserer. Det fuldender valideringspakken for Kalman-korrekthed (Joseph-form, PSD-sikkerhed, konsistens af NEES/NIS og nu ensemblet for det koblede filter).

seg-804f35695553 = <b>Pipeline for banebestemmelse (batch + sekventiel).</b> Nyt <c1/> genfinder en satellits banetilstand <c2/> ud fra afstandssporing fra jordstationer og sammensætter tre leverede dele: kraftmodellen med to legemer + J2 (<c3/>) og integratoren RK4 (<c4/>) propagerer en kandidattilstand over buen, en målemodel for afstand forudsiger hver stationsafstand, og Gauss–Newton-korrektoren for batch (<c5/>) driver kandidaten ind på den bedst tilpassede tilstand (<c6/>). Den samme dynamik og afstandsmodel driver også en <b>sekventiel</b> rekursiv bestemmelse på det leverede unscented-filter (<c7/>). Fire tests validerer den: forudsigelse af afstand over buen; <b>genfinding med batch til under en meter / mm·s⁻¹ ud fra støjfri afstande</b>; genfinding med batch til <b>~{ "2" } m med et residual efter tilpasning ved støjgulvet på { "5" } m</b> (signaturen for en konsistent tilpasning med mindste kvadrater); og sekventiel genfinding til inden for nogle få titals meter. Ærligt omfang: afstandsrate/Doppler og vinkelmålinger, en analytisk tilstandsovergangsmatrix for J2 og maskering af stationens sigtbarhed er opfølgende arbejde.

seg-0a81039e510c = <b>Tæt koblet GNSS/INS UKF-navigator.</b> Nyt <c1/> kobler den leverede unscented Kalman-kerne (<c2/>) ind i en fungerende tæt koblet navigator over de otte tilstande <c3/> (ECEF-position/hastighed plus modtagerurets bias og drift i afstandsenheder). Den indlæser de <b>rå satellitmålinger</b> — <c4/> (<c5/>) og <c6/>/Doppler (<c7/>) — frem for en forudformet positionsbestemmelse, så <c8/> (med <c9/>/<c10/>/ <c11/>) bliver ved med at korrigere <b>med færre end fire satellitter</b> og glider gennem GNSS-udfald på sin propagerede dynamik. Fem tests validerer den ende-til-ende, herunder scenarierne for milepælens accept: geometrien for pseudoafstand/Doppler mod håndværdier; støjfri konvergens til <b>under en meter</b> på fem satellitter; et tilfælde med <b>tre satellitter</b>, der konvergerer fra ~{ "212" } m til ~{ "13" } m, hvor en øjebliks-PVT ikke engang kan dannes; et <b>udfald på 120 sekunder</b> med konstant hastighed inden for { "50" } m; og — den afgørende accept — et <b>buet LEO-pas på 30 minutter</b> (rigtig bane med to legemer + J2) med et <b>GNSS-udfald på 120 sekunder</b>, holdt til <b>{ "0.77" } m RMS for passet</b> og <b>{ "2.9" } m i værste tilfælde gennem udfaldet</b>. Den orbitale glidning sammensætter den leverede tyngdekraftsmodel (<c12/>) og RK4-integratoren (<c13/>) til procesmodellen for UKF (<c14/>), så filteret følger banens krumning — hvilket en glidning med konstant hastighed ikke kan (krumningen alene er ~{ "58" } km over { "120" } s i LEO). Ærligt omfang: den orbitale glidning bruger kraftmodellen med to legemer + J2 frem for rå specifik kraft fra IMU (for en ikke-drevet orbital platform falder de sammen); inddragelse af en fejltilstand for strapdown-IMU og korrektioner af ionosfære/troposfære i sløjfen er fortsat opfølgende arbejde.

seg-792f25a4a1da = <b>Målemodel for kortmatchning (terræn-/tyngdereferenceret navigation).</b> Nyt <c1/> leverer den målemodel, der gør det leverede partikelfilter med sekventiel vigtighedsresampling (<c2/>) til en fungerende navigator uden GPS: <c3/> (en gaussisk sandsynlighed for feltmatch) og <c4/>, som sampler et vilkårligt georefereret referencefelt — terrænhøjde (TRN) eller en tyngdeanomali — ved en partikels position og vægter den efter, hvor godt den passer til køretøjets målte værdi. Feltet er en vilkårlig sampler af typen <c5/>, så det kan sammensættes med det bilineære gitter i <c6/> eller en closure. To tests forankrer den — sandsynligheden topper (={ "1" }) ved et perfekt match og falder til <c7/> ved én sigma, og et partikelfilter over et karakteristisk stykke syntetisk terræn genfinder den sande position inden for { "0.1" }. Ærligt omfang: de rigtige referencekort (SRTM-højde, EGM/EIGEN-tyngdeanomali) og deres indlæsere er fortsat opfølgende arbejde.

seg-9240e95a5058 = <b>Cislunar PNT-integritet (månens ARAIM).</b> Nyt <c1/> anvender ARAIM-motoren MHSS fra Jordens side på en navigationstjeneste for Månen i stil med LunaNet med månens parametre (<c2/> mod GPS { "0.6" } m, <c3/>): månekonstanter, en selenocentrisk basis Øst/Nord/Op og en hjælper for himlens geometri samt <c4/> (HPL/VPL). Tre tests forankrer den — den ortonormale selenocentriske basis, geometrien for skråafstanden og den præcise lineære skalering af beskyttelsesniveauet med <c5/> (månens { "30" } m giver et beskyttelsesniveau, der er { "50" }× større end den samme geometri ved GPS' { "0.6" } m — den kvantitative grund til, at integritet for PNT på Månen er svær). Ærligt omfang: den præcise LANS NRHO-efemeride, fejlbudgettet for signal i rummet og reduktionen af referencesystemet MCI↔MCMF er opfølgende arbejde.

seg-4a43e2ff83d7 = <b>To-delte (højpræcise) Julian-datoer.</b> Nyt <c1/> tilføjer <c2/>, en Julian-dato delt i et heltalligt <c3/> og et brøkdelt <c4/> i <c5/> (konventionen fra SOFA/hifitime), med <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Forskelle mellem nære epoker forbliver præcise til gulvet for <c11/>, hvor en JD med en enkelt <c12/> mister ~{ "50" } µs nær J2000. Fire tests forankrer den: rundtur, normalisering af brøken, præcis genfinding af mikrosekunder (med fejlen for en enkelt <c13/> vist ved siden af) og additiv/reversibel aritmetik med sekunder.

seg-8eef92a85711 = <b>CCSDS OMM-skriver (Orbit Mean-Elements Message).</b> Nyt <c1/> supplerer efemeride-skriveren <c2/> med meddelelsen om middelelementer: <c3/> afbilder SGP4/TLE-middelelementer til OMM-enhederne (middelbevægelse i omdr./døgn, vinkler i grader, plus <c4/>), og <c5/> serialiserer standardsporets CCSDS 502.0-B-2 KVN-form — så en Kshana-bane kan bruges af ethvert værktøj, der forstår OMM, i stedet for som en skræddersyet TLE. To tests forankrer omregningen af enheder fra TLE til OMM (≈ { "15.5" } omdr./døgn, inklination { "51.6" }° osv.) og tilstedeværelsen af de krævede KVN-nøgleord. Ærligt omfang: KVN-formen og afbildningen af TLE leveres her; XML-gengivelsen (<c6/>) og en rundtur med en referenceparser er fortsat opfølgende arbejde.

seg-ca2b730b5cc3 = <b>Partikelfilter med sekventiel vigtighedsresampling.</b> Nyt <c1/> tilføjer den ikke-lineære, ikke-gaussiske estimator bag kortstøttet navigation uden GPS (terrænreferenceret eller tyngdekortmatchning): <c2/> (propager partikler gennem dynamikken + gaussisk procesindstøj), <c3/> (omvægt efter en sandsynlighed for måling for hver partikel), systematisk <c4/>, monitoren for degeneration <c5/> og estimatet som vægtet middel. Seks tests forankrer den deterministiske kerne præcist — ESS fra { "1" }…N, systematisk resampling, der vælger indeks i forhold til vægten, den konvekse kombination ved det vægtede middel, en gaussisk sandsynlighed, der trækker estimatet hen på målingen, adfærden ved resampling til ensartet fordeling og deterministisk predict med sådd. Ærligt omfang: motoren leveres her; referencekortene (SRTM-højde, EGM-tyngdeanomali) og kortets målemodel er fortsat opfølgende arbejde (gitteret med bilineær sampler i <c6/> ville tjene et tyngde-/terrænkort lige så godt).

seg-564ad319685e = <b>IONEX-lignende TEC-ionosfærekort.</b> Nyt <c1/> tilføjer det målte alternativ til den udsendte Klobuchar-model for ionosfæren: et <c2/> (et regulært bredde/længde-gitter af lodret TEC, et globalt ionosfærekort fra IGS) med bilineær interpolation i et gennemtrængningspunkt (<c3/>, begrænset uden for gitteret) og forsinkelsen af første orden <c4/> (<c5/>, <c6/>). Fire tests forankrer det: <c7/> ved L1 med skaleringen <c8/>, interpolation præcis i knuder, bilineære midtpunkter, der er gennemsnit af hjørnerne, og forespørgsler uden for gitteret begrænset til kanten. Ærligt omfang: gitteret og interpolationen leveres her; parsing af filformatet IONEX, interpolation i tid mellem kort og kortlægningsfunktionen for skråstilling er fortsat opfølgende arbejde.

seg-26c7b53cbc8c = <b>Geometriske korrektioner ved tidsoverførsel (Sagnac + GNSS common-view).</b> Nyt <c1/> tilføjer de to deterministiske effekter, som en rigtig urammenligning skal tage højde for, som supplement til den stokastiske tovejsmodel i <c2/>: <c3/> (<c4/>, forsinkelsen fra en roterende Jord — nogle få titals ns for kontinentale baselines) og <c5/>, GNSS common-view-enkeltdifferensen, der præcist ophæver fejlen i satellittens ur og genfinder forskydningen mellem stationerne. Tre tests forankrer dem på præcise referencer: Sagnac på ≈ { "33" } ns for et kvart omløb ved ækvator, antisymmetri og tilfældene med nul radialt/polært samt den præcise ophævelse af satellittens ur. Ærligt omfang: et fuldt budget for TWSTFT-transponder/hardwareforsinkelser og en ionosfærefri PPP-løsning til tidsoverførsel er fortsat opfølgende arbejde.

seg-098e7ea0ee13 = <b>Kraftmodel for banen (to legemer + J2).</b> Nyt <c1/> tilføjer den accelerationsmodel, som en numerisk propagator integrerer: <c2/> (<c3/>), forstyrrelsen fra fladtrykningen <c4/> (den lukkede form i ECI) og <c5/>, der summerer dem — sæt den sammen med <c6/> som <c7/>. Den udstiller også de analytiske <b>sekulære rater</b> for J2 (<c8/>): regression af knuden <c9/>, rotation af apsiderne <c10/> og drift i middelanomalien <c11/>. Seks tests forankrer fysikken på præcise referencer: <c12/> for leddet med to legemer, den lukkede form for J2 ved ækvator (~{ "10" }⁻³ af størrelsen for to legemer), den <b>kritiske inklination</b> ({ "63.4349" }°), der fryser perigæum (<c13/>), regressionen af knuden for ISS (<c14/>) og den østlige drift af en retrograd solsynkron bane. Ærligt omfang: kun to legemer + J2; J3–J6, modstand, SRP og tredjelegemer er opfølgende arbejde.

seg-d5c03ebc5707 = <b>Permalinks til scenarier, der kan deles.</b> Nyt <c1/> tilføjer en afhængighedsfri Base64-codec efter RFC { "4648" } (standardalfabetet <c2/> med padding og et URL-sikkert alfabet <c3/> uden padding) og indpakningerne <c4/> / <c5/>, så en TOML fra playground kan kodes til en forespørgselsparameter <c6/> og deles som en URL. Udstillet til browseren som wasm-bindinger <c7/> / <c8/>. Fire tests forankrer det på de kanoniske vektorer i RFC { "4648" } (<c9/> → <c10/> osv.), en URL-sikker rundtur for et scenarie (ingen <c11/>/<c12/>/<c13/> at escape), afvisning af ugyldige symboler og en rundtur med alle 256 bytes. Ærligt omfang: codec og bindinger leveres her; knappen Del i playground, diagrammet med flere serier i Plotly/D3 og A/B-sammenligningstilstanden er fortsat opfølgende arbejde.

seg-b615fb16d547 = <b>Gauss–Newton batch med mindste kvadrater (den differentielle batch-korrektor).</b> Nyt <c1/> tilføjer den estimeringskerne, som en <em>banebestemmelse</em> med batch (eller enhver parametertilpasning) hviler på: <c2/> linearisér en model <c3/> leveret af brugeren med en Jacobi-matrix af centrale finite differenser, danner og løser de vægtede normalligninger <c4/> (genbruger den testede matrixinvers) og itererer til konvergens med vægte for hver måling. Fire tests forankrer det: en lineær linjetilpasning, der når den præcise løsning med vægtede mindste kvadrater, en ikke-lineær tilpasning <c5/>, der genfinder de sande parametre, en 3D-multilateration af afstande, der genfinder en kendt position ud fra støjfri afstande (varianten for banebestemmelse), og afvisning af underbestemte/inkonsistente input. Ærligt omfang: dette er den generiske korrektormotor; målemodellen for bane med afstand/afstandsrate/azimut-elevation, den analytiske tilstandsovergangsmatrix for J2 og validering på publicerede tilfælde er fortsat opfølgende arbejde.

seg-0ada87934135 = <b>Spoofing-monitorer i RF-laget (AGC-effekt og SQM).</b> Nyt <c1/> tilføjer to uafhængige spoof-detektorer i modtagerens front end som supplement til den urstøttede monitor for tidsspoofing i <c2/>: en <b>AGC-effektmonitor</b> (<c3/> inkoherent effektsum + <c4/>), der markerer den overskydende modtagne effekt, som en spoof-sender tilføjer ud over en konfigurerbar dB-margin, og en <b>signalkvalitetsmonitor</b> (<c5/> trekantet kodeautokorrelation + <c6/>), der markerer den ubalance mellem Early og Late i korrelatoren, som multipath/meaconing/replay giver. Fire tests forankrer de præcise lukkede former ({ "3.01" } dB ved en fordobling af effekten, summen <c7/>, den trekantede <c8/> og alarmtærsklen på { "10" } % for Early/Late). Ærligt omfang: den fulde paritetsdetektor for spoofing med RAIM-konsistens, fusionen af monitorernes output i flere lag og validering mod publicerede spoofing-vektorer fra Spirent/ION GNSS+ er fortsat opfølgende arbejde.

seg-b1ff62d88cd2 = <b>Adaptiv numerisk ODE-integrator.</b> Nyt <c1/> tilføjer det første stykke af en <em>numerisk</em> propagator (Kshanas banepropagering er ellers analytisk SGP4/SDP4): et generisk Runge–Kutta-trin af fjerde orden (<c2/>) over ethvert system af første orden <c3/> og en adaptiv driver (<c4/>), der styrer den lokale fejl ved <b>trindobling</b> (Richardson-ekstrapolation) med den standardmæssige trinregulator <c5/> og logik for accept/afvisning. Seks tests forankrer den på præcise løsninger: eksponentialfunktionen <c6/> til <c7/>, reduktionen af fejlen med ~{ "16" }× for hvert halverede trin, som beviser konvergens af fjerde orden, bevarelse af energi/tilbagevenden for den harmoniske oscillator over en hel periode og den adaptive driver, der klarer en stram tolerance med variable trin. Ærligt omfang: dette er integratorens kerne og dens fejlstyring; de indlejrede tableauer Dormand–Prince RK5({ "4" })/RKF7({ "8" }) og den hierarkiske kraftmodel for banen (to legemer + J2–J6 + modstand + SRP + tredjelegeme), der gør den til en <c8/>, er fortsat opfølgende arbejde.

seg-ca53c62839d8 = <b>Unscented (sigma-punkt) Kalman-filter.</b> Nyt <c1/> tilføjer det skalerede unscented Kalman-filter (Julier & Uhlmann; Wan & van der Merwe) som en generel estimator med <c2/> tilstande over procesfunktioner og målefunktioner leveret af brugeren — den sigma-punkt-estimator, som en tæt koblet GNSS/INS-navigator bruger, når modellen for pseudoafstand/Doppler er stærkt ikke-lineær, og Jacobi-matricen i et EKF forringes. Det omfatter den understøttende tætte lineære algebra (Cholesky-faktor til spredning af sigma-punkter, Gauss–Jordan-invers til innovationens kovarians) og en Joseph-fri opdatering <c3/>. Seks tests fastlåser det, hvor de vigtigste udnytter den præcise egenskab, at den unscented transformation for en <em>lineær</em> model gengiver Kalman-filteret til numerisk præcision (predict, update og en hel cyklus predict+update stemmer alle med et håndkørt lineært KF, plus en analytisk 1D Bayesiansk kontrol af posterior og identiteterne for Cholesky/invers). Ærligt omfang: dette er estimatormotoren; den tæt koblede GNSS/INS-navigator med 17 tilstande, målemodellen for pseudoafstand/Doppler og valideringsscenariet for udfald er fortsat opfølgende arbejde.

seg-da92d32b5715 = <b>Beskyttelsesniveauer i ARAIM med to konstellationer.</b> Nyt <c1/> udvider Advanced RAIM med enkeltfejl (<c2/>) med <b>fejltilstanden for hele konstellationen</b> fra EU ARAIM / DO-316: ved siden af hypoteserne om ingen fejl og fejl i enkeltsatellitter bidrager hver konstellation (mærket for hver satellit) med én hypotese, der fjerner alle dens satellitter på én gang, med a priori <c3/> (en ny <c4/>). Hver hypotese tilføjer et led til den samme MHSS-integritetssum, så VPL/HPL er de mindste grænser, hvis samlede <c5/> holder sig inden for budgettet over ingen fejl + enkelt-SV + fejl i konstellationer (Bonferroni-fordelingen af falske alarmer er over alle <c6/> hypoteser). Med <c7/> er resultatet bit-for-bit <c8/>; en bruger med en enkelt konstellation returnerer <c9/> ved sin egen konstellationsfejl (den kan ikke udelukkes) — hvilket præcis er grunden til, at dækning med to konstellationer betyder noget. Fire tests dækker ækvivalensen, udvidelsen af beskyttelsesniveauet, utilgængeligheden med en enkelt konstellation og validering af input, og genbruger den eksisterende maskineri for delløsninger med løsningsadskillelse.

seg-d06c5f88282b = <b>IAU { "2006" }-præcession (Fukushima–Williams-vinkler og matrix for bias-præcession).</b> Nyt <c1/> implementerer IAU { "2006" }-præcessionen (P03; Capitaine, Wallace & Chapront { "2003" }): de fire Fukushima–Williams-vinkler <c2/> som polynomier i Julian-århundreder i TT (<c3/>) og rotationsmatricen for bias-præcession fra GCRS til middel for datoen bygget ud fra dem med konstruktionen <c4/> i SOFA (<c5/>, med hjælperne <c6/> / <c7/>). Det er det første stykke af inertielt referencesystem oven på den eksisterende GMST-baserede reduktion <c8/>. Otte tests validerer mod lukkede ankre — den middel skråstilling <c9/> i J2000, de publicerede konstante led i vinklerne, akkumuleringen af generel præcession <c10/> over et århundrede, ortonormalitet af matricen og <c11/>, værdien nær identitet (kun bias i referencesystemet) i J2000 og den nettorotationsvinkel <c12/>/århundrede. Ærligt omfang (<c13/>): kun præcession — nutationen IAU 2000A med 678 led, hele kæden TEME→GCRS og et numerisk krydstjek med SOFA/ANISE på µas/<{ "10" } m er fortsat opfølgende arbejde.

seg-14c0a863eef1 = Fysik for et kold-atom-interferometer-(CAI)-accelerometer fra første principper.

seg-408fc6feb284 = <c1/> modellerer et Mach–Zehnder-atominterferometer med tre pulser fra første principper i stedet for efter et datablad: effektiv bølgevektor <c2/>, interferometerfase <c3/>, kvanteprojektionsstøj (shot noise) <c4/>, følsomhed over for acceleration for hvert skud, kontrastens henfald <c5/> og — det afgørende — <c6/>, som <b>afleder</b> den hvide PSD for acceleration, som den klassiske <c7/> allerede bruger, ud fra antallet af atomer, afhøringstiden og kontrasten. Modellen dækker nu også <b>vibrationskobling</b> — det dominerende led i en rigtig enhed: overføringsfunktionen fra acceleration til fase i interferometeret <c8/> (<c9/>), fasevariansen ved hvid PSD <c10/> (<c11/>, med et numerisk krydstjek af båndintegralet <c12/>), den langs strålen projicerede <c13/> af rang 1 og <c14/> / <c15/> (sidstnævnte reduceres til gulvet <c17/>, der er uafhængigt af <c16/>). Elleve tests verificerer fysikken i hånden (Rb-87 <c18/>, <c19/>, <c20/>/skud for gulvet for shot noise mod et vibrationsgulv på ≈ { "5.9" } µg, <c21/>, <c22/> og skaleringslovene for <c23/>). Ærligt omfang i <c24/>: dette spænder over gulvet for projektionsstøj og det vibrationsbegrænsede område over det; laserfasestøj, systematik fra Coriolis og lysskift og valideringsscenarierne for PHARAO/CARIOQA er fortsat opfølgende arbejde.

seg-ed668459d019 = <b>Kvante-CAI-accelerometer koblet ind i det inertielle scenarie.</b> Et accelerometer i et inertielt scenarie med dødregning løses nu til en ny <c1/> — <c2/> (den eksisterende sensor med koefficienter fra datablad) eller <c3/>, når det bærer en valgfri blok <c4/> (<c5/>: bølgelængde, pulsafstand, antal atomer, kontrast, cyklustid og en valgfri <c6/> for platformen). PSD'en for velocity random walk <c8/> for en sensor <c7/> er <b>afledt</b> af interferometerets fysik — gulvet for shot noise plus, når en vibrations-PSD er givet, bidraget begrænset af vibration i kvadratur — i stedet for en leveret koefficient, og kørslens proveniens registrerer, at støjen er afledt af fysik. Feltet <c9/> er <c10/>, så eksisterende scenarier udelader det og serialiserer byte-identisk (scenariehashen er uændret). Fem tests dækker afledningen, summen af vibration i kvadratur, valget mellem <c11/>/<c12/>, serialisering med stabil hash og en ende-til-ende-kørsel drevet af CAI.

seg-c3978a122010 = Optimering af konstellationsdesign og geometri for streets-of-coverage.

seg-aae519e71c00 = <c1/> får <c2/>, en gradientfri gitteroptimerer, der søger i designrummet <c3/> og returnerer det bedste Walker-design under et valgt <c4/> — <c5/>, <c6/> eller <c7/> — over det allerede validerede PDOP-sweep (en test bekræfter, at den returnerer vinderen fundet ved brute force). Plus de analytiske lukkede former for <b>streets-of-coverage</b> <c8/> (<c9/>) og <c10/> (<c11/>, Rider/Beste), kontrolleret i hånden mod lærebogsgeometri og med påvisning af hullet ved for få satellitter. Den fulde Rider-løser for mindste antal satellitter til global dækning, en 3D-globus i playground og et krydstjek af DOP med et eksternt værktøj er fortsat opfølgende arbejde.

seg-7b8468636dea = <b>SP3-eksport af præcis efemeride fra CLI.</b> Et propageret bane-/konstellationsscenarie kan nu skrives til en SP3-c-fil: <c1/>, eller <c2/> i scenariet skriver automatisk <c3/> (<c4/> / <c5/>, <c6/>, valgfri <c7/>). En rundturstest (<c8/>) propagerer det rigtige øjebliksbillede <c9/> fra Celestrak, eksporterer det, parser det igen og bekræfter, at de genfundne ECEF-positioner stemmer med SGP4-referencen over { "24" } h til <b>< { "0.5" } m</b> (godt inden for tolerancen på { "10" } m for TLE-klassen). README dokumenterer rollen for interoperabilitet (RINEX → RTKLIB/gLAB, SP3 → Ginan/produkter med præcise baner).

seg-56c729ba110f = Koblet Kalman-filter for ur+position (kovarians på tværs af blokke).

seg-0a424875131d = <c1/> er ét stablet <c2/>-filter (opdateringer i Joseph-form), hvis <b>pseudoafstand</b>-måling <c3/> reelt kobler blokkene for position og ur — i modsætning til den ældre fusionspakkes to uafhængige filtre med to tilstande, der holder krydskovariansen præcis nul. Valideret: en delt pseudoafstand driver <c4/> forskellig fra nul; to forskellige geometrier løser i fællesskab tilførte forskydninger i position+ur, som en enkelt afstand ikke kan adskille; en <b>positionsbestemmelse kun med uret skærper positionen</b> gennem krydskovariansen (gevinsten, som afkoblede filtre ikke kan give); og NEES fra Monte Carlo er <b>konsistent med χ²({ "4" })</b>. Det er realiseringen med 1 frihedsgrad (fusionspakkens dimensionalitet); udvidelsen til 3D med 8 tilstande og koblingen ind i den kørbare pakke er registreret som opfølgende arbejde.

seg-3983794a9584 = <b>Overvågning af Kalman-filterets konsistens (NIS/NEES).</b> Opdateringen af kovariansen i urfilteret med to tilstande er nu i <b>Josephs stabiliserede form</b> `P⁺ = (I−KH)P(I−KH)ᵀ

seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, kontrolleret mod tabel).

seg-f9689061a1d2 = <b><c1/> — én citerbar tabel over proveniens.</b> Samler hver sensorparameter (ur, inertial, tidsoverførsel), fysisk/algoritmisk model (bane, tidssystemer, referencesystemer, ionosfære/troposfære, integritet, detektion, jamming, Allan) og valideringsdatasæt (AIAA 2006-6753, Celestrak <c2/>) med dens publicerede kilde — datablad, artikel, ICD eller standard — og en ærlig modenhedsmærkning (flyvekvalificeret / jordlaboratorium / rummål på jordhardware). Der linkes til den fra introduktionen i README og dokumentationstabellen; supplerer de strenge <c3/> for hver kørsel, som allerede følger med i resultat-JSON.

seg-55c7b52b5fdb = <b>Typet scenarie-API.</b> Dispatch sker nu på en typet enum <c1/> i stedet for en match på en rå streng <c2/> (<c3/> + udtømmende dispatch), så tilføjelse af en pakke kontrolleres ved kompilering. Nye typede flader ved siden af den uændrede <c4/>, der returnerer streng: <c5/> med en struktureret taksonomi for fejl (<c6/> / <c7/> / <c8/> / <c9/>, hver med et stabilt <c10/>); et trait <c11/> og udvidelsespunktet <c12/> (pakken <c13/> er koblet gennem det som det gennemarbejdede eksempel); og introspektion med <c14/> (navn, beskrivelse, påkrævede/valgfri felter for hver type). Python- og WebAssembly-bindingerne får <c15/> og <c16/>. Dokumenteret i <c17/>.

seg-2b86391b753e = Rigtig GPS-konstellation + dækning af driftskuverten.

seg-288f2b1872c8 = <c1/> leveres nu med et <b>rigtigt øjebliksbillede <c2/> fra Celestrak</b> (2021-07-28, { "30" } satellitter) i stedet for syntetiske Walker-TLE'er, med <c3/>, så det kun indlæses, når hver TLE-kontrolsum er gyldig; <c4/> dokumenterer reproducerbar opdatering, og README krediterer kilden med åbne data. Ny <c5/> afprøver hver pakke over ≥{ "5" } varianter af kuverten og hævder endeligt/afgrænset output, bekræfter, at <b>gulvet for flicker-FM målbart forringer et urs glidning</b>, når det er slået til (nu sat i tre leverede scenarier), og bekræfter, at <b>fusionsfilteret konvergerer med en realistisk bias i accelerometeret forskellig fra nul</b> (inden for { "3" }× tilfældet med nulstillet bias), og lukker realismehullet "fusion virker kun med nulstillede biases". <c6/> får en tabel over driftskuverten.

seg-f78d7dce7bfa = <b>GNSS-simulering i måledomænet (typen <c1/>).</b> En fremadrettet model på niveau med pseudoafstande: for hver synlig satellit syntetiserer den <c2/> og L1-Doppler, med <b>Klobuchar</b>-ionosfæren for én frekvens (IS-GPS-200 §{ "20.3.3.5.2.5" }) og <b>Saastamoinen</b>-troposfæren i zenit projiceret med kortlægningsfunktionen <b>Niell ({ "1996" })</b> — udstillet som TOML-blokkene <c3/> og <c4/>. Residualerne føder snapshot-RAIM for HPL/VPL for hver epoke, og et JSON-array <c5/> bærer hver SV's pseudoafstand, Doppler, C/N₀ og korrektioner for ionosfære/troposfære. En kørsel uden støj gengiver geometri + korrektioner til under en millimeter (CI-test). Ny <c6/> og <c7/>.

seg-833249802c56 = <b>Stokastisk detektor for tidsspoofing (typen <c1/>).</b> Spoof-pakken kører nu en rigtig detektor i stedet for en deterministisk sammenligning af rampe mod grænse: fire former for injektion (<c2/>, <c3/>, <c4/>, <c5/>), en tosidet χ²₁-energitest / Neyman–Pearson på monitorens urstøttede statistik med tærsklen sat ud fra et mål for budgettet for falske alarmer <c6/> og sandsynligheden for missede detektioner <c7/> rapporteret både i lukket form og ved Monte Carlo (<c8/> forsøg for hver hypotese — de to stemmer til nogle få ×1/√N). Kvalitetsmålet for sikkerhed er nu <c9/> ved den operationelt skadelige (spec) størrelse. Ny <c10/> (gaussiske haleføringer, NP-/energitest, Monte Carlo P_fa/P_md) og <c11/>. Bagudkompatibel: en bar <c12/> accepteres stadig som en lineær rampe.

seg-b3f3d2ca8a3d = <b>Definition af kvalitetsmålet for sikkerhed (typen <c1/>):</b> fra den analytiske grænse for detekterbarhed <c2/> til den stokastiske detektors <c3/>. Urpakkens felt <c4/> forbliver den hurtigere analytiske proxy.

seg-ee1268975b2c = Tilføjet (fortsat)

seg-f71696b7fa20 = <b>RF-jammingmodel (typen <c1/>).</b> En interferensmodel med linkbudget, der omsætter en jammers effekt og geometri til tab af lås for hver satellit: forholdet mellem jammer og signal ud fra tab i fri luft og antennegevinsten ved modtagelse i hver retning, den effektive C/N₀ via den standardmæssige anti-jam-ligning (processeringsgevinst ved despreading × spektralseparationsfaktoren <c2/>; Kaplan & Hegarty §{ "9.4" }) og en konfigurerbar tracking-tærskel, scoret over en Walker-konstellation som kvalitetsmålet <c3/>. Ny <c4/> og <c5/>. Ærligt omfang (ingen multipath, terrænskygge, AGC eller adaptiv nulning) er dokumenteret i <c6/> / <c7/>.

seg-d4dc36011ea1 = <b>Generisk N-D parametersweep over enhver scenarietype (<c1/>).</b> Det tidligere N-D-sweep gjaldt kun urpakken. <c2/> varierer punkterede TOML-nøgler i et scenarie <c3/> over det kartesiske produkt af dets akser, sender hver gitterknude videre gennem den normale køresti igen og aflæser ét eller flere mål i resultatet ved en punkteret JSON-sti — så det virker for hver pakke (inertial, gnss-ins, integritet, spoof, …) uden at kobles til hver pakkes Rust-type. Gitterknuder evalueres parallelt over OS-tråde på native mål (ingen ekstra afhængighed); wasm falder tilbage til sekventiel. Deterministisk og rækkevist uanset antallet af tråde. Nyt eksempel <c4/>.

seg-1c42e15d65a9 = <b>TOML-konfigurerbar deterministisk fejlmodel for IMU i pakken <c1/>.</b> Den treaksede strapdown-fejlkæde (skalafaktor, fejljustering, g-følsomhed, kvantisering, rate-rampe; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) kan nu nås for hver sensor fra en scenariefil via en valgfri blok <c2/>, lagt oven på de konstante biases ved opstart. Hvis blokken udelades, forbliver hver sensor en ren kilde med konstant bias, så eksisterende kørsler af <c3/> er uændrede. Det kobler den hidtil kun bibliotekbaserede fejlmodel ind i en kørbar pakke og et kvalitetsmål.

seg-e035371fbe58 = <b>Validering på reelle data.</b> Parseren for multi-GNSS RINEX-navigation, GLONASS RK4-propagatoren og SP3-læseren afprøves nu mod ægte IGS/DLR-filer (en rigtig blandet RINEX { "3" }-broadcast-navfil og et IGS SP3-c-banprodukt), ikke kun mod selvskrevne eksempler — og hævder ikke-tomme sæt af satellitter og endelige, fysisk dimensionerede ECEF-positioner. Fixturerne er kun til test (udeladt af den publicerede crate); se <c1/>.

seg-2a807ae8e194 = <b>RAIM på geometri fra en reel referencebane.</b> Kernerne for snapshot, løsningsadskillelse (MHSS) og beskyttelsesniveauer i ARAIM er nu valideret mod den reelle geometri for den præcise IGS-bane (SP3), ikke kun mod syntetiske konstellationer: geometrien for sigtelinjen bygges ud fra den første SP3-epoke ved en rigtig jordstation, og testene hævder beskyttelsesniveauer på meterniveau, der er tilgængelige for APV-I, at en bias i pseudoafstand på { "60" } m udløser χ²-monitoren, at løsningsadskillelse <b>identificerer</b> den fejlbehæftede satellit, og at ARAIM's niveauer holder sig inden for den tildelte <c1/>. Lukker hullet med kun validering på syntetisk geometri (paritet med gLAB i modtagerdomænet over en hel RINEX-bue er fortsat et punkt på køreplanen — det kræver en løsning for pseudoafstand).

seg-651cc4af4872 = <b>Konfidensintervaller for hver knude i N-D-parametersweepet</b> (<c1/>). Hver gitterknude i det N-dimensionale sweep med kartesisk produkt kan nu evalueres som et Monte Carlo-ensemble af seeds og rapporterer målets middel, percentiler og et percentil-bootstrap-KI på { "95" }% for hver knude (for begge ure) — et statistisk ærligt sweep frem for ét træk for hver knude. Genbruger maskineriet for ensemble/bootstrap (<c2/>); deterministisk; <c3/> reduceres præcist til det enkelte seed <c4/>. (At generalisere sweepet til alle pakker, hvilket er viklet ind i refaktoreringen af typet Scenario, og parallel udførelse mangler stadig.)

seg-815eda56aad9 = <b>NaveGo-krydsvalidering af IMU-støjkæden</b> (<c1/>). Et eksternt krydstjek mod NaveGo (R. Gonzalez' open source INS/GNSS-værktøjskasse): gengiver den syntetiske rundtur i <c2/> på dens offentliggjorte Microstrain 3DM-GX3-35-referenceprofil og bekræfter, at vores overlappende ADEV-estimator genfinder NaveGos koefficienter for hastigheds- og vinkel-random-walk (<c3/>) til under { "5" }% med den forventede −1/2-hvidstøjshældning. (Den optagede STIM300-log i formatet <c4/> på { "40" } MB indlæses ikke, da den er låst bag et binært format.)

seg-b67b3ec240de = Tæt koblet (pseudorange) GNSS/INS-opdatering.

seg-c926dddc5256 = <c1/> (og indpakningen <c2/>) implementerer den tidligere stubbede måling i afstandsdomænet: innovationen er den forudsagte afstand fra INS-positionen til hver satellit i forhold til den målte pseudorange, med en sigtelinje-Jacobian på positionsfejlen. Fordi hver satellit er en skalar måling, bliver filteret ved med at korrigere med <b>færre end fire satellitter</b> — hvor en løst koblet PVT-positionsbestemmelse ikke findes. Fem tests dækker nulstilling af fejlen med fire satellitter, korrektion med to satellitter (ingen PVT mulig), observerbarhed langs sigtelinjen med en enkelt satellit og inputvalidering. Kun pseudorange; bærebølgefase og en eksplicit tilstand for modtagerens ur er stadig på køreplanen. Cargo-featuren <c3/>, som ikke blev brugt (og som spærrede for den gamle fejlstub), er fjernet.

seg-94ebfac3bbc3 = <b>Løst koblet GNSS/INS-scenariepakke (<c1/>, <c2/>).</b> Forbinder den treaksede strapdown-navigator og den 15-tilstands fejltilstands-EKF (<c3/> / <c4/>) til et scenarie, der kan køres, med et kvalitetsmål — EKF'en disciplinerer mekaniseringen mod støjende GNSS-positionsbestemmelser, mens dækningen er oppe, og glider derefter igennem udfaldet; det erstatter den ældre 1-DOF-skalarpakkes nulstilling med snap til reference med ægte fusion. Resultatet rapporterer den fusionerede serie af vandret fejl, det scorede positionskvalitetsmål (tilgængelighed / RMS under udfald / holdover) og den åbne sløjfes frie INS-RMS til sammenligning; et kvante-/klassisk IMU-par adskiller sig kun i den sande bias. Aktiveres fra CLI-, Python- og wasm-indgangen med et eksempel i <c5/>. Ærlig rammesætning: kun løst koblet, én deterministisk bane, og den fusionerede fejl under udfaldet er begrænset af en gulvværdi sat af attitudefejlen ved overdragelsen (derfor påstås den ikke at skalere med bias) — de robuste fund er, at fusion slår ustøttet dødregning for en sensor med bias, og at en sensor med lavere bias har den bedre ustøttede udglidning.

seg-0a2df01f99d8 = <b>Konstellationsudformning på den validerede SGP4-kerne (<c1/>).</b> Et nyt modul <c2/> udsender et udformet Walker-delta-mønster (<c3/>) som SGP4-<b>middelelementer</b>, så den syntetiske konstellation propagerer gennem den samme SGP4-vej, som er valideret til { "4.12" } mm mod AIAA 2006-6753-vektorerne — ikke den analytiske Kepler-generator. Oven på den: <c4/> tabulerer dækning og median-/værste-PDOP over et udformningsgitter <c5/>, og <c6/> rapporterer dækningsandelen og revisit-huller (værste/gennemsnit) i et jordpunkt. Valideret ved de fysiske monotonicitetsrelationer, som en afvejning skal følge (flere satellitter ⇒ højere dækning, lavere PDOP, kortere revisit). Særskilt er et ægte <b>Celestrak <c7/> TLE-snapshot</b> (2021-07-28, { "30" } operative GPS-satellitter) tilføjet som en fixture kun til test, og vejen fra rigtige TLE'er → SGP4 → ECEF-geometri er valideret mod det (hele MEO-skallen inden for { "1" }%, ni satellitter i sigte på samme tid ved PDOP { "1.64" }), ved siden af de eksisterende SP3- og RINEX-veje med rigtige data.

seg-9e051f3725df = Støjtype-specifikke effektive frihedsgrader for Allan-konfidensintervallerne.

seg-2392bec8f0b6 = <c1/> implementerer de lukkede former i NIST SP { "1065" } tabel { "5" } (Stable32's enkle sæt) for alle fem kanoniske potenslov-støjtyper — hvid/flicker PM, hvid/flicker FM, random-walk FM — og erstatter det konservative ikke-overlappende antal som χ²-frihedsgrader. En ny enum <c2/> og <c3/> identificerer den dominerende type ud fra hældningen af optagelsens <b>modificerede</b> Allan-deviation (MDEV adskiller hvid fra flicker PM, hvor ADEV ikke kan), og <c4/> knytter nu den identificerede støjtype, dens edf og et konfidensbånd på { "95" }% til hvert punkt på den eksporterede ADEV-kurve (<c5/> får <c6/>/<c7/>/<c8/>/<c9/>, additivt med serde-standardværdier). Valideret på to måder: de fem formler stemmer med håndudregnede værdier til { "1e-12" }, og et Monte Carlo-ensemble af { "4" } 000 optagelser med hvid FM bekræfter, at formlen forudsiger estimatorens faktiske chi-i-anden-edf inden for { "20" }% (og at den klart slår det konservative antal). Otte nye tests.

seg-df59cc71120f = Stokastisk model for tovejs tidsoverførsel.

seg-d2add1ce01e1 = <c1/> erstatter den rene hvidstøjs-sampler med en fysisk begrundet model: den gensidige (fælles) forsinkelse i signalvejen ophæver sig selv i estimatet <c2/> (<c3/>, så to uafhængige envejsmålinger gennemsnittes til <c4/>), og resten er den <b>ikke-gensidige</b> differentielle forsinkelse — modelleret som en farvet hvid-FM + random-walk-FM-proces (den validerede model <c5/>), hvilket giver synkroniseringsfejlserien en realistisk Allan-signatur (<c6/>) i stedet for flad hvid støj. <c7/> får <c8/>/<c9/> (serde-standard { "0" } ⇒ den ældre adfærd med kun hvid støj, bit for bit), link-kvalitetsmålet rapporterer <c10/> (modellens Allan-deviation ved basisskridtet), og scenariet og CLI'en <c11/> eksponerer dem. Golden-kvalitetsmålet er pinnet igen. Seks håndafledte tests (ophævelse af fælles mode, tovejsgevinsten på sqrt({ "2" }), RWFM-loven <c12/> via linkets egen <c13/>, ækvivalens med den ældre adfærd ved <c14/>, determinisme og ende-til-ende-eksponering af kvalitetsmålet).

seg-6c7a1dd63be0 = Numerisk paritet med Stable32 for Allan-familiens estimatorer (NBS14).

seg-adbb47ca87b4 = <c1/> validerer de overlappende ADEV-, modificerede ADEV-, tidsdeviations- og overlappende Hadamard-estimatorer mod Stable32's referencedeviationer for det kanoniske <b>NBS14</b>-datasæt (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ca. s. 107) ved tau = { "1" }, { "2" } med en relativ tolerance på { "1e-4" } — de faktiske afvigelser er ca. { "1e-6" }. Det fastlåser estimatormatematikken mod de facto-referenceimplementeringen og ikke kun mod estimatorernes egen analytiske selvkonsistens. Kun de offentlige referencetal bruges; ingen tredjepartskode.

seg-35b0c0644fa2 = <b>Lodret Stanford-integritetsdiagram eksporteret af scenariet <c1/>.</b> Scenarietypen <c2/>, som kan køres, eksporterer nu et lodret Stanford(-ESA)-diagram ved siden af HPL/VPL-tilgængelighedskortet: for hver beskyttet epoke afbildes et seedet, reproducerbart fejlfrit træk af afstandsfejl gennem geometrien til en faktisk lodret positionsfejl og klassificeres i forhold til VPL og den lodrette alarmgrænse (Available / System-Unavailable / Misleading / Hazardously-Misleading). Diagrammet (punkter pr. epoke + antal pr. region) ligger i resultat-JSON'en, og integritetshændelses-/HMI-tællingerne i CLI-oversigten, så Stanford-klassifikatoren — tidligere kun i biblioteket — kan nås fra ende til anden. <c3/> får et felt <c4/> (standard { "0" }), der styrer fejlrealiseringen; selve tilgængelighedskortet forbliver rent geometrisk og uafhængigt af seed.

seg-5d76a638ae77 = ARAIM-integritetsrisikobudget (P_HMI) for beskyttelsesniveauerne.

seg-449adb9ad6e6 = <c1/> udleder de vandrette og lodrette beskyttelsesniveauer ud fra et eksplicit integritetsrisikobudget i stedet for en fast multiplikator <c2/>: for løsningen med alle satellitter i sigte og for hver delløsning med udelukkelse af en enkelt satellit opbygger den pr. akse tripletten <c3/> for hver tilstand, hvorefter <c4/> løser det mindste PL, hvis summerede sandsynlighed for farligt vildledende information (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) holder sig inden for den tildelte <c7/>. Resultatet rapporterer den integritetsrisiko, niveauerne faktisk opnår, så en bruger eksplicit kan afveje integritet mod alarmgrænsen. Seks håndafledte tests (lukkede former for fejlfri og tærskelbaseret enkelttilstand, summation/monotoni over flere tilstande, ende-til-ende fejlfri beskyttelse, hvor et budget, der er 10⁵× strammere, hæver PL, fejldetektering/-identifikation og redundansgulvet med seks satellitter). Enkeltfejls-MHSS er ARAIM-baseline; samtidige fejl i delmængder af flere SV'er, konstellationsdækkende fejltilstand og validering mod gLAB-referencedatasæt er dokumenterede udvidelser.

seg-3e33581644a5 = Tohastigheds coning/sculling-kompensation til strapdown-mekaniseringen.

seg-c900e193ac29 = <c1/> folder de højfrekvente coning-led (attitude) og rotation+sculling-led (hastighed) ud af en grov opdaterings ordnede IMU-inkrementer i delintervaller, så en <c2/> med moderat rate gengiver vibrationsensrettet bevægelse, som et groft skridt over de rå summer overser. En valideringstest kører et { "10" } Hz coning+sculling-miljø i { "60" } s og sammenligner reference med fin rate, naiv grov integration og foldet grov integration: foldningen skærer positionsfejlen med ca. { "18" }× (fra meter af naiv drift til under en decimeter), hvilket bekræfter, at coning/sculling-leddene er bærende. Et typealias <c3/> kalder den ældre 1-DOF-model <c4/> ved dens rette navn, adskilt fra navigatoren med tre akser <c5/>.

seg-ceb037e7a6ea = <b>Parser til RINEX-observationsfiler.</b> Et nyt modul <c1/> læser RINEX 3.0x / { "4.00" } <em>observationsfilen</em> — modtagerens faktiske målinger — og fuldender RINEX-parret ved siden af den eksisterende parser til navigationsbeskeder. <c2/> afkoder headeren (version/type, listerne <c3/> pr. system med fortsættelseslinjer, omtrentlig position, interval, tidspunkt for første observation) og hver epokes poster pr. satellit: pseudorange, bærebølgefase, Doppler og signalstyrke, nøglet på deres observationskode i RINEX { "3" } (<c4/>, <c5/>, …) med flagene for tab af lås (LLI) og signalstyrke (SSI), hvor et tomt felt bevares som fraværende frem for nul. Ærligt omfang: dette er <em>indlæsning</em> af standardformatet (en rigtig observationslog fra en RTKLIB-/gLAB-/IGS-station ind, typede målinger ud), ikke en positioneringsmotor — ingen pseudorange-løsning, PPP eller RTK her.

seg-60efb0c44522 = <b>CCSDS OEM-skriver (Orbit Ephemeris Message).</b> Et nyt modul <c1/> eksporterer en propageret konstellation som en gyldig CCSDS 502.0-B OEM-meddelelse { "2.0" } — KVN-efemeridefilformatet, som GMAT, Orekit, STK og de fleste flight-dynamics-værktøjer indlæser. <c2/> sampler hver satellits inertielle (TEME) tilstand — position <b>og</b> hastighed, taget direkte fra propagatoren uden jordfast rotation, i modsætning til SP3-eksporten — på et tidsgitter, og <c3/> serialiserer headeren <c4/>/<c5/>/ <c6/> plus ét segment <c7/> pr. satellit (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) efterfulgt af dets linjer <c15/> (km, km/s). <c16/> leveres af kalderen, aldrig fra systemuret, så outputtet er byte-identisk fra kørsel til kørsel (reproducerbarhedskontrakten). Det er rumfartøjs-efemeridens modstykke til GNSS SP3-eksporten: en Kshana-bane kan nu overdrages til et flight-dynamics-værktøj i et standardformat.

seg-f8538db4a17c = Præcis SP3-efemeride som propagationskilde.

seg-2cf2e224deb9 = <c1/> opbygger en <c2/> pr. satellit, der udfylder positionen mellem de tabulerede SP3-epoker med et Lagrange-polynomium af 9. orden (standard IGS-praksis) og roterer den ind i det fælles TEME-referencesystem; den udstilles som <c3/>. En IGS-/analysecenter-fil med præcise baner kan nu drive den samme pipeline for geometri/synlighed/integritet som de udsendte og analytiske propagatorer. Valideret rundtur: en Kepler-bane skrevet til SP3 og læst tilbage gennem interpolatoren stemmer med originalen til under en meter i knudepunkterne og < { "100" } m midt i intervallet. Urinterpolation er næste skridt.

seg-8d50fd42f53c = <b>GLONASS-udsendt efemeride (fuldender multi-GNSS RINEX-nav).</b> Nyt modul <c1/>: GLONASS udsender ikke Kepler-elementer, men en jordfast <b>tilstandsvektor</b> i PZ-90 (position, hastighed, måne-sol-acceleration). <c2/> læser posterne <c3/> i RINEX { "3" }, og satellitpositionen til ethvert tidspunkt fås ved <b>Runge–Kutta-integration af 4. orden</b> af GLONASS ICD's bevægelsesligninger (centralt tyngdefelt + <c4/> + Coriolis-/centrifugalled fra jordens rotation + den udsendte acceleration). Udstillet som <c5/>, så GLONASS-satellitter flyder gennem pipelinen for konstellation/synlighed/integritet sammen med de keplerske systemer; en enkelt konstellationsblok <c6/> kan nu blande GPS, Galileo, QZSS, BeiDou og GLONASS.

seg-8d88144e3726 = <b>Multi-GNSS RINEX-navigation (GPS, Galileo, QZSS, BeiDou).</b> Navigationsparseren for RINEX { "3" } afkoder nu poster for Galileo (<c1/>), QZSS (<c2/>) og BeiDou (<c3/>, MEO/IGSO) ved siden af GPS (<c4/>) — de deler Kepler-layoutet og brugeralgoritmen — hver evalueret med sin egen gravitationskonstant og jordrotationshastighed (Galileo/BeiDou μ, BeiDou Ω̇ₑ). En fil med blandede konstellationer giver dem alle, og de flyder gennem pipelinen for konstellation/synlighed/integritet som <c5/>. BeiDous geostationære satellitter bruger en anden koordinatrotation og springes over, indtil der findes en referencefixture at validere mod. Postgennemløberen bruger linjetal pr. system, hvilket retter en latent fejl, hvor firelinjers GLONASS-/SBAS-poster blev sprunget over, som om de var otte linjer lange. GLONASS (en tilstandsvektormodel) er næste skridt.

seg-91a6907acc8d = <b>Læser og skriver til SP3-c/d med præcis efemeride.</b> Et nyt modul <c1/> parser IGS-/analysecenter-SP3-filer med præcise baner (<c2/>) — det efterbehandlede ECEF-produkt med position/ur, som PPP-motorer (Ginan, RTKLIB, gLAB) behandler som reference — til en struktureret <c3/> (header, epokegitter, position pr. satellit km→m, ur µs og hastighed dm/s→m/s for produkter af typen <c4/>), idet SP3's sentinelværdier for ugyldige værdier bevares. Den omvendte retning er også dækket: <c5/> opbygger en SP3 fra en propageret konstellation (TEME→ECEF pr. epoke), og <c6/> serialiserer den, så Kshana-baner kan eksporteres i det format, eksterne PPP-værktøjer indlæser — rundturen læs↔skriv. Epokeinterpolation og en SP3-propagatorkilde er næste skridt.

seg-7d51d1b6f39f = <b>RINEX-udsendt efemeride som en konstellationskilde, der kan køres.</b> En konstellation accepterer nu en indlejret blok <c1/> (RINEX { "3" } GPS-navigationstekst) ved siden af den eksisterende indstilling <c2/>, så en rigtig udsendt fil driver et scenarie fra ende til anden fra CLI, Python eller playground i browseren — RINEX ind, PNT-geometri ud. Nyt referencescenarie <c3/> viser GNSS-tilgængelighed og DOP fra otte GPS-satellitter bygget direkte af udsendte poster. (Kun GPS LNAV; multi-GNSS og SP3 er næste skridt.)

seg-9730835bfc64 = <b>RINEX-udsendt efemeride som propagationskilde.</b> En parset <c1/> kan nu konverteres til en <c2/> (<c3/>): positionen er IS-GPS-200-banen fra udsendelsen, roteret fra ECEF til det fælles inertielle TEME-system (<c4/>, med GPS→UT1-tid korrekt for skudsekunder), hastigheden ved central finitdifferens og den keplerske omløbstid. Rigtige udsendte GPS-data kan nu drive den samme pipeline for geometri, synlighed og integritet (RAIM) som de analytiske SGP4-/Kepler-propagatorer. (Endnu ikke udstillet som scenarietype for en RINEX-fil — det og multi-GNSS/SP3 er næste skridt.)

seg-a355e3e52ec3 = <b>Arkiv-DOI.</b> Udgivelser deponeres nu på Zenodo og tildeles en DOI, der kan citeres.

seg-c6e4556e1ce5 = <b>Dokumentation.</b> README er opdateret til institutionelt niveau: en funktionsoversigt over hele stakken { "v0.9.0" }, et afsnit om versionering og udgivelser, en ren header med det nye mærke og en kortfattet statuslinje. Ingen ændringer i motoren.

seg-1bfc4e965d2b = Denne udgivelse tilføjer tre væsentlige funktionsområder oven på SGP4-fundamentet i { "0.8.0" }: en ægte treaksed strapdown-INS, en løst koblet GNSS/INS fejltilstands-EKF med feedback i lukket sløjfe, ægte snapshot- og solution-separation-RAIM (i ARAIM-stil) med HPL/VPL og et scenarie <c1/>, der kan køres, og det første skridt mod interoperabilitet mellem GNSS-formater (indlæsning af RINEX-3 GPS-efemerider).

seg-7fa2f68d436a = <b>Parser til RINEX { "3" } GPS-navigationsbeskeder (<c1/>).</b> Første skridt mod interoperabilitet mellem GNSS-formater: <c2/> læser en RINEX { "3" }.x-navigationsfil og afkoder hver GPS-post (<c3/>) med udsendt efemeride — blokken med otte linjer SV/epoke + <c4/> — til en <c5/> med Kepler-elementer og urkorrektioner, med feltnavne og enheder efter IS-GPS-200. Håndterer Fortran-flydende tal med eksponenten <c6/> (<c7/>) og layout med faste kolonnebredder; poster for ikke-GPS-systemer springes over og afvises ikke, så en blandet fil stadig giver sine GPS-efemerider. Fire tests: parsing af eksponenten <c8/> (inklusive tomme felter og fejl), en hel post afkodet mod kendte feltværdier med en sundhedskontrol af GPS' store halvakse (√A² ≈ { "26 560" } km), overspringning af ikke-GPS og tilfældet med tom fil.

seg-9c4a068f204c = GPS-udsendt efemeride → ECEF-position (<c1/>).

seg-5deeec4b8cc9 = <c1/> evaluerer satellittens jordfaste position ud fra den parsede efemeride via brugeralgoritmen i IS-GPS-200 §{ "20.3.3.4.3.1" }: Newton-løsning af Keplers ligning for den excentriske anomali, andenharmoniske korrektioner af breddeargument / radius / inklination og rotationen ind i ECEF under hensyn til jordens rotation siden referenceepoken (med de af specifikationen foreskrevne GPS-værdier <c2/> og <c3/> og en fold af <c4/> ved ugeskift). Tre tests: den geocentriske radius forbliver i GPS-båndet (≈ { "26 560" } km), den jordfaste hastighed er ca. { "3.9" } km/s, og evaluering en hel uge væk giver samme position.

seg-583433389a70 = GPS SV-urbias med den relativistiske korrektion (<c1/>).

seg-957588ed5dff = <c1/> evaluerer det udsendte urpolynomium <c2/> omkring <c3/> plus det relativistiske excentricitetsled <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). En ny <c5/> konverterer postens kalenderepoke til GPS-ugetid via juliansk dagsaritmetik fra GPS-epoken (1980-01-06), og Kepler-løsningen deles med positionsevalueringen. Tests: GPS-ugetid for en søndag/tirsdag/lørdag (ugegrænser) og urbiasen, der er domineret af af0 med et til stede, afgrænset relativistisk led. L1-gruppeforsinkelsen <c6/> udstilles, men indregnes bevidst ikke. Ærligt omfang: en kilde <c7/>, Galileo/BeiDou/GLONASS og SP3 er stadig næste skridt. (<c8/> er opdateret, så den passer.)

seg-ef971feff16c = <b>Scenarietype <c1/>, som brugeren kan køre (<c2/>).</b> RAIM-tilgængelighedsfunktionen kan nu nås fra CLI/TOML som alle andre pakker: <c3/> parser et <c4/> (brugerbane, én eller flere GNSS-konstellationer, elevationsmaske og integritetskonfigurationen <c5/>), kører <c6/> og udsender tilgængelighedskortet for HPL/VPL pr. epoke som JSON plus en selvstændig SVG — beskyttelsesniveauer over tid mod alarmgrænserne, med en grøn/rød tilgængelighedsstribe. <c7/> skriver JSON'en, diagrammet og en HTML-rapport. Det medfølgende scenarie (24-satellit Walker, dobbeltfrekvent afstandsmåling på { "1" } m, APV-I-grænser) rapporterer ca. { "95" } % tilgængelighed; det dokumenterer, at RAIM med én frekvens ikke når den lodrette APV-I-grænse med én konstellation, og derfor bruger lodret vejledning SBAS/dobbeltfrekvens/ARAIM. Tests dækker dispatch, tilgængelighedskortets JSON og SVG'en.

seg-bbe5721c1785 = <b>RAIM-tilgængelighed over en konstellation, der kan køres (<c1/>).</b> Integritetsmodulet havde ingen kalder — <c2/> gør det til et ægte indgangspunkt fra ende til anden: ved hver epoke på et tidsgitter propagerer den de synlige satellitter (de samme SGP4-/Kepler-propagatorer <c3/>, som motoren bruger), beregner beskyttelsesniveauerne uden fejl og vurderer tilgængeligheden mod de vandrette/lodrette alarmgrænser og returnerer en <c5/>, der kan serialiseres med <c4/> (<c6/>/HPL/VPL/<c7/> pr. epoke plus tilgængelighedsandelen). En <c8/> samler <c9/>, og <c10/> pr. epoke er udstillet til kaldere, der selv løser deres geometri. Tre tests: en epoke vurderet som tilgængelig under APV-I-grænser på en geometri med ti satellitter, gjort utilgængelig af en umulig stram grænse, og <c11/> som niveauer under fem satellitter; og en kørsel fra ende til anden over en Walker-konstellation med 24 satellitter, der giver et endeligt tilgængelighedskort og serialiseres. (Seks satellitter — redundansgulvet for residual-RAIM — når ærligt talt <em>ikke</em> APV-I selv ved { "1" } m afstandsmåling; APV-I-tilgængelighed kræver den tættere geometri, som testen bruger.)

seg-91e32e587cb6 = <b>Akkumulator til Stanford(-ESA)-integritetsdiagram (<c1/>).</b> Standardmåden at opsummere en integritetsmonitor over mange epoker: den afbilder den faktiske positionsfejl (x) mod beskyttelsesniveauet (y) og klassificerer hver epoke ud fra diagonalen <c2/> og alarmgrænsen som <c3/> (PL afgrænser fejlen, inden for AL), <c4/> (PL afgrænser fejlen, men overskrider AL — sikkert, ubrugeligt), <c5/> (PL < fejl ≤ AL) eller <c6/> (PL < fejl og fejl > AL — den usikre fejl). <c7/> er den rene klassifikator; <c8/> akkumulerer punkter af formen <c9/> mod en fast alarmgrænse og udstiller regionstal, tilgængelighed, totaler for integritetshændelser og punkter, der kan serialiseres med <c10/>, til afbildning/JSON-eksport. Fire tests: hver region (inklusive grænsetilfældet <c11/>, hvor PL afgrænser fejlen), akkumulering af antal/tilgængelighed og JSON-rundtur. Dette er rapporteringsfladen for RAIM-beskyttelsesniveauerne; at koble den ind i konstellationsscenariet og validere mod et offentligt datasæt er stadig punkter på køreplanen.

seg-cdeb3a5a4acf = <b>Solution-separation-RAIM (i ARAIM-stil) (<c1/>).</b> En integritetsmonitor med flere hypoteser ved siden af den eksisterende residual-/paritets-χ²-test <c2/>. For mindste kvadraters-løsningen med alle satellitter i sigte og for hver delløsning med udelukkelse af en enkelt satellit danner den separationen <c3/> — gaussisk med middelværdi nul uden fejl og med kovarians <c4/> (den indlejrede estimatoridentitet, gyldig fordi løsningen med alle satellitter i sigte er BLUE) — og den både <b>detekterer</b> en fejl og <b>identificerer</b> den fejlbehæftede satellit (den, hvis udelukkelse giver den største normaliserede separation). Vandrette/lodrette beskyttelsesniveauer følger den almindelige MHSS-allokering <c5/> med <c6/>, <c7/>. Nyt afhængighedsfrit par <c8/>/<c9/>, bygget på modulets eksisterende regulariserede ufuldstændige gamma (<c10/>). Fire håndafledte tests: normal-CDF / kvantil mod lærebogsværdier (Φ({ "1.95996" })={ "0.975" }, halen på { "1e-7" } = { "5.1993" }, symmetri); en fejlfri geometri, der ikke giver alarm og giver endelig, positiv HPL/VPL; en bias på 60 σ i en enkelt satellit, som både detekteres <em>og</em> identificeres korrekt (<c11/>); og redundansgulvet med seks satellitter. Lukker revisionens P0-hul om "tautologisk integritet — ingen rigtig RAIM/HPL/VPL" på algoritmesiden; validering mod gLAB-datasæt og Stanford-diagramakkumulatoren er stadig punkter på køreplanen.

seg-67e771fc0a48 = Integration af GNSS/INS med lukket sløjfe (<c1/>).

seg-5aa467783b99 = <c1/> forbinder fejltilstands-EKF-kernen med den treaksede strapdown-mekanisering: hver IMU-måling korrigeres med de løbende bias-estimater, mekaniseres fremad, og EKF-kovariansen tidspropageres med den tilsvarende navigationskontekst; hver GNSS-position/hastighed danner INS−GNSS-innovationen og fører de estimerede <b>fejl i position, hastighed, attitude (ψ, som en kvaternionrotation) og accelerometer-/gyro-bias</b> tilbage i løsningen og nulstiller fejltilstandens middelværdi. At føre attitude tilbage (ikke kun bias) er nødvendigt for stabiliteten — tilt og accelerometerbias er et koblet par, så at korrigere det ene uden det andet divergerer. INS og GNSS sammenlignes i et lokalt tangentplan i NED-systemet ved hjælp af mekaniseringens egne krumningsradier (nyt <c2/>; <c3/>/<c4/> udstillet). Dette er den ærlige erstatning for den hybride pakkes <em>nulstilling med snap til reference</em>. Tre tests: en lukket sløjfe, der nulstiller en tilført positionsfejl på { "8" } m / −{ "5" } m til <{ "0.1" } m; en støttet løsning, der holder sig afgrænset til meterniveau (<{ "6" } m) på en køretrajektorie, mens en frit løbende INS divergerer forbi { "100" } m; og milepælstesten — den fusionerede løsnings <b>Monte Carlo-positions-RMS over et GNSS-udfald på { "60" } s slår en ustøttet dødregner med åben sløjfe med >{ "2" }× (≈{ "4" }× på tværs af seeds)</b>. Ærlig begrænsning dokumenteret i modulet: i løst koblet tilstand kan accelerometerbias og tilt kun svagt adskilles (begge kobler gennem tyngdekraften), så den leverede værdi er den afgrænsede, korrigerede tilstand og en ren indgang til udfaldet — ikke en præcis inertial kalibrering; rigere dynamik og den tæt koblede udvidelse er stadig punkter på køreplanen.

seg-aa9bf0ff6f84 = <b>Løst koblet GNSS/INS fejltilstands-EKF-kerne (<c1/>).</b> Et udvidet Kalman-filter med 15 fejltilstande — <c2/> — med strapdown-fejldynamikken fra Groves { "2013" } §{ "14.2" } (kobling mellem specifik kraft og tilt, Coriolis, projektion af bias fra krop til nav, Gauss–Markov-biasmodeller), en diskret overgang af første orden <c3/> og en løst koblet opdatering af position+hastighed (<c4/>) i Joseph-form. Afhængighedsfri tæt lineær algebra (Gauss–Jordan-invers, Joseph-kovariansopdatering). En cargo-feature <c5/> spærrer for en dokumenteret, endnu ikke implementeret pseudorange-/Doppler-opdatering. { "7" } tests med håndafledte forventninger: skew-/krydsproduktidentiteten, en verificeret { "3" }×{ "3" } invers, kovarians der forbliver symmetrisk/PSD under prædiktion (og positionsusikkerhed, der vokser uden støtte), en positionsbestemmelse der skrumper positionskovariansen, eksakt genfinding af en kendt positionsfejl ved den analytiske Kalman-gain <c6/> og mindre korrektioner ved større målestøj. Dette er kernen, der vil erstatte den hybride pakkes nulstilling med snap til reference i åben sløjfe med feedback i lukket sløjfe (pakkekobling + NaveGo-validering følger).

seg-5be84079b8b6 = Deterministisk IMU-fejlmodel til den 3-aksede strapdown-navigator (<c1/>).

seg-492e670736b2 = <c1/> forvrænger et sandt par <c2/> i kropssystemet til et målt par gennem fem systematiske kategorier (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabel { "4.1" }): <b>skalafaktor</b> (forstærkningsfejl pr. akse i ppm), <b>fejljustering / krydskobling</b> (ikke-ortogonalitet i triaden uden for diagonalen), <b>g-følsomhed</b> (en gyro-ratebias proportional med specifik kraft), <b>kvantisering</b> (afrunding til output-LSB) og <b>rate-ramp</b> (en lineær drift i tid — den tredje Allan-region), plus en konstant bias ved opstart. Hvert led er som standard nul, så <c3/> er en gennemsigtig gennemgang, og eksisterende scenarier er upåvirkede. Hver fejlkilde har en isolationstest (skala lineær til <{ "0.01" }%, fejljustering på tværs af akser over VRW-gulvet, g-følsomhedsbias, LSB-gitter, lineær ramp), og en test fra ende til anden driver en navigationsfejl gennem mekaniseringen fra en forvrænget IMU. Ikke modelleret: vibrationsensretningsfejl, drift fra temperaturgradient. (Den medfølgende scenariepakke <c4/> kører stadig det ældre 1-DOF-skalarbudget; denne model fodrer 3-akse-biblioteket.)

seg-f57bc89d4688 = <b>Coning- og sculling-kompensation til strapdown-integratoren.</b> Attitudestien tilføjer to-sample-inkrementet <c1/> (<c2/>); en integration med grov rate ({ "30" } Hz, 5 samples/cyklus) af et { "5" } Hz coning-miljø er verificeret til at følge reference med fin rate ≥ { "3" }× bedre med korrektionen end med naiv summering af inkrementer. Hastighedsstien tilføjer <c3/> (<c4/>, Groves lign. { "5.82" }) og løser kropshastighedsinkrementet gennem en ny inkrementbaseret opdatering <c5/> med den kroprelative rotation <c6/>, så en jordfast platform ikke får falsk sculling, mens en ægte vibration udløser det fulde led.

seg-56c599250ed4 = Fuld treaksed strapdown-mekanisering i NED-systemet (<c1/>).

seg-d0897492e89b = <c1/> fremføres af <c2/> med de almindelige NED-ligninger for jordfast system (Groves §{ "5.4" }): attitude fra krop til NED korrigeret for raten fra inertial til nav <c3/> (jordrotation + transportrate); specifik kraft opløst fra krop til NED gennem DCM; hastighed, der integrerer <c4/> (Coriolis/transport + tyngde); og geodætisk position via meridian- og tværkrumningsradierne. Tyngden er WGS-84's lukkede Somigliana-form for <b>normaltyngde (lodlinjetyngde)</b> med en NIMA-friluftskorrektion for højde — aldrig en hårdkodet konstant. Dette er den ægte treaksede navigator, der afløser den skalare 1-DOF-fejlbudgetsti. Verificeret ved fysiske invarianter: en platform boltet fast til den roterende jord ved { "45" }°N (der registrerer jordrate + { "1" } g) holder sig inden for { "1" } mm over { "60" } s; en vandret specifik kraft mod nord giver <c5/> og en forskydning på <c6/>; normaltyngden stemmer med de kendte overfladeværdier ved ækvator/pol/45° og med friluftsgradienten.

seg-290b08199bfb = <b>Treaksed attitudemodel til strapdown-INS (<c1/>).</b> En enhedskvaternion-type <c2/> (skalar først, Hamilton-konvention), der bærer rotationen fra krop til nav, med en DCM-visning (<c3/>/<c4/> via Shepperds metode), Hamilton-produkt, konstruktører til akse-vinkel og rotationsvektor (eksakt exp-afbildning) og kvaternionkinematik — både en RK-ratenopdatering af første orden (<c5/>) og en rotationsvektoropdatering med coning-korrektion. To-sample-funktionen <c6/> (Savage / Bryan–Lewantowski, <c7/>) leverer det krydskoblingsled for rotationsraten, som skalar dødregning udelader. Dette er attitudefundamentet for den fulde 3-aksede mekanisering, der erstatter den ældre 1-DOF-fejlbudgetsti. Verificeret mod lukkede rotationsformler: propagering med konstant rate stemmer med akse-vinkel-kvaternionen til { "1e-6" }, DCM'er er ortonormale med enhedsdeterminant, og coning forsvinder ved bevægelse om én akse. (<c8/> er nu modulmappen <c9/>; den offentlige sti <c10/> er uændret.)

seg-5e6e5bba25a5 = Geodætisk korrekt synlighed fra jordstation (<c1/>).

seg-69bdb1e5bfc8 = <c1/>, <c2/> og <c3/> beregner en satellits elevation over en jordstations horisont i forhold til <b>WGS-84-ellipsoidens normal</b> (den sande lokale lodlinje) og ikke den geocentriske radial — de to afviger med op til den geodætiske afvigelse på ca. { "0.19" }°, nok til at få satellitter tæt på horisonten til at skifte ind eller ud af en elevationsmaske. Verificeret fra ende til anden (en Walker-konstellation propageret, roteret TEME→ECEF og talt fra et geodætisk sted) og mod den geocentriske tilnærmelse.

seg-4de1d79d2e76 = <b>CI-pålidelighed.</b> Jobbet <c1/> bygger nu wheel-pakken med <c2/> (manylinux-container) i stedet for en rå <c3/> på værten, hvilket fjerner en intermitterende rustup-konflikt mellem <c4/>/<c5/> på runner-imaget. Jobbet <c6/> installerer <c7/> som en forbygget binær via <c8/> i stedet for den Docker-baserede <c9/>, hvilket fjerner en timeout ved pull fra Docker Hub-registret. Ingen af ændringerne påvirker de udførte kontroller.

seg-05055c993904 = Inertialhastighed udstilles nedstrøms.

seg-1228235c99b6 = <c1/> og <c2/> (der returnerer <c3/>) fører den analytiske TEME-hastighed, som SGP4 allerede beregner — tidligere kasseret — videre til kaldere i m/s; <c4/> giver Kepler-stien en konsistent hastighed. Verifikationstesten for AIAA 2006-6753 kontrollerer nu også hastigheden for hver referencerække (værste hastighedsfejl { "1.85e-9" } km/s over alle { "666" } tilstande) og fastlåser antallet af sammenlignede rækker til præcis { "666" }.

seg-8ac2598291b8 = <b>Strengere TLE-parsing uden panics.</b> Linjer skal være ASCII og skæres sikkert (ikke flere panics ved byteindeks på multibyte-input); elementer områdekontrolleres (inklination, excentricitet, middelbevægelse); kontrolsummen i kolonne 69 kan gennemtvinges via <c1/> / <c2/> og det nye flag <c3/> på <c4/> (som standard tolerant).

seg-1cd2c6621a04 = <b>Allan-deviationskurve i outputtet.</b> Hver urkørsel rapporterer nu en <c1/> (<c2/>), og playground i browseren tegner et log-log-diagram "Urets stabilitet (ADEV)".

seg-c76ff20811e7 = Validering af tidsgitterets input.

seg-75436d067802 = <c1/> afviser et tidsgitter, der ikke er endeligt, er nul, negativt eller for stort (et skridt større end varigheden eller mere end <c2/> samples), før der allokeres noget, så et fejlformet scenarie returnerer en fejl i stedet for at gå ned med en panic eller opbruge hukommelsen.

seg-d0a8ce50cf6e = Monte Carlo-ensembler til den inertiale pakke.

seg-3225674ce4ea = <c1/> på et inertialt scenarie kører N seeds og rapporterer hver metriks middelværdi, standardafvigelse, percentiler og et percentil-bootstrap-konfidensinterval på { "95" }% (<c2/>). Hver inertial kørsel bærer nu et flag <c3/>, så et kvalitetsmål fra én realisering ikke længere forveksles med en fordeling. (CEP/2DRMS rapporteres bevidst ikke — de kræver 3-akse-modellen på køreplanen.)

seg-2967872bfca1 = <b>Guidet playground-tilstand.</b> Playground i browseren smider dig ikke længere ud i en rå TOML-mur: en "Start her"-stribe med scenariekort, der indlæser og kører et gennemarbejdet eksempel med ét klik, skydere der giver adgang til de universelle indstillinger (seed, tidstærskel) uden at røre TOML, en note "Sådan læser du dette", der forklarer resultatet, og hele TOML'en er ét klap væk. Hver kørsel kan deles — <b>Kopiér delingslink</b> koder hele scenariet ind i URL-fragmentet (intet uploades), så et link gengiver præcis den samme kørsel ved indlæsning. Kodeken er enhedstestet (<c1/>, køres i CI).

seg-2e47e8864718 = N-dimensionelle parametersweeps (<c1/>).

seg-5076a9ad20d7 = <c1/> evaluerer en metrik over hele det kartesiske produkt af flere intervaller <c2/> (afvejningsstudiet med flere parametre), i row-major-rækkefølge, deterministisk. Additivt — den eksisterende 1-D-sweep-API er uændret. Bootstrap-konfidensintervaller pr. knudepunkt og generalisering ud over urpakken er stadig på køreplanen.

seg-958718831037 = <b>Ægte snapshot-RAIM (<c1/>).</b> Ægte Receiver Autonomous Integrity Monitoring i positionsdomænet: den opbygger sigtelinjegeometrien til de synlige satellitter, danner mindste kvadraters-løsningen og residualerne, kører en χ²-test af residualer til fejldetektering (eksakt tærskel fra en afhængighedsfri ufuldstændig gamma χ²/ikke-central χ²) og beregner hældningsbaserede vandrette og lodrette beskyttelsesniveauer (HPL/VPL) med den bias ved udeblevet detektering, der er udledt for de konfigurerede P_fa/P_md. Dette er noget andet end — og er <b>endnu ikke koblet til</b> — scenariepipelinens integritetskvalitetsmål om filterets selvkonsistens; fejludelukkelse, budgettering af alarmgrænse/P_HMI og ARAIM er stadig på køreplanen.

seg-1675540acbd9 = <b>Pakke til frekvensstabilitet: MDEV, TDEV, HDEV + konfidensintervaller</b> (<c1/>). Ved siden af den overlappende ADEV: den modificerede Allan-deviation (adskiller hvid fra flicker-fasestøj), tidsdeviationen (<c2/>) og Hadamard-deviationen (afviser lineær frekvensdrift eksakt og konvergerer for divergente rødstøjstyper). χ²-baserede konfidensintervaller (<c3/>) bruger et afhængighedsfrit normal-/χ²-kvantilpar (Acklam + Wilson-Hilferty) med en konservativ ikke-overlappende edf; støjtypespecifik edf og numerisk paritet med Stable32 er stadig på køreplanen.

seg-446a9ed4467c = <b>Reduktion af referencesystem (<c1/>).</b> GMST-baseret TEME↔ECEF-rotation (med den samme IAU-1982 siderealtid som propagatoren), eksakt geodætisk↔ECEF for WGS-84 med en iterativ invers startet med Bowring (maskinpræcision i alle højder, også MEO/GEO) og en geodætisk jordstationsobservatør, der returnerer azimut / elevation / afstand i det lokale East-North-Up-system. Polbevægelse og nutation under buesekunder anvendes ikke (kun GMST, under en kilometer på jordsporet); en ITRF-præcis CIO-kæde er på køreplanen.

seg-9f6f53583cf5 = <b>Fundament for tidsskalaer (<c1/>).</b> Et afhængighedsfrit API til juliansk dato (gregoriansk civil ↔ JD, MJD), hele IERS' historik over heltallige skudsekunder (UTC↔TAI, { "10" } s i { "1972" } til { "37" } s siden { "2017" }), den definerede TAI→TT-forskydning, UT1-korrektionen via en leveret DUT1 og IAU-2000-jordrotationsvinklen. Det er tidssubstratet, som jordfast systemreduktion (planlagt) hviler på. Tidspunkter er julianske datoer i én værdi af typen <c2/> (ca. { "50" } µs opløsning nær den nuværende epoke; en todelt JD er på køreplanen), og æraen med gummisekunder før 1972 er ikke modelleret — begge dele er dokumenteret i modulet.

seg-6ecc053f101f = <b>Reproducerbarhed og proveniens.</b> En deterministisk CycloneDX SBOM-generator (<c1/>) og en SLSA-attestering af build-proveniens på release-binæren og SBOM'en; release-værktøjskæden er pinnet, så den passer til CI. Determinismegarantier, forbeholdet om <c2/> på tværs af platforme og tilgangen med fastlåste golden-værdier er dokumenteret i <c3/>.

seg-3e98dcdcb82b = <b>Egenskabsbaserede tests og fuzz-tests</b> (<c1/>). Deterministiske randomiserede tests (ingen ny afhængighed) kontrollerer invarianter over tusindvis af input: TLE- og scenarieparserne går aldrig ned på affald, ikke-ASCII, muteret eller afkortet input; <c2/> går aldrig ned på NaN/inf/negative gitre; TLE-kontrolsummen er konsistent og kun kolonne 69; rundture for geodætisk↔ECEF og TEME→ECEF-rotationen bevarer normen over hele kloden og et bredt højdebånd.

seg-ea252b5d7427 = Golden-tests <b>fastlåser nu kvalitetsmålene felt for felt</b> for de fire referencescenarier (med en tolerance, der optager jitter fra <c1/> på tværs af platforme), og erstatter de tidligere kontroller, der kun var uligheder, så en tavs numerisk regression opdages med det samme.

seg-4b2a0b78984b = <c1/> i resultatartefakter er hævet fra <c2/> til <c3/> (den var frosset, mens motoren gik videre).

seg-ecafa9d44810 = <c1/> <b>afviser</b> nu (advarer ikke om) yankede afhængigheder.

seg-c48af44de5b4 = Ny dokumentation: <c1/> (ærligt omfangskort), <c2/> (referencen til resultatfelter), <c3/>, <c4/>, <c5/>. En CI-vagt fejler, hvis README-versionsbadgen driver fra <c6/>.

seg-8ef32ebec7f5 = <b>SGP4/SDP4-banepropagering.</b> En fuld, afhængighedsfri implementering af den almindelige simplified-perturbations-propagator — SGP4 for nær jorden sammen med SDP4-udvidelsen for dybt rum (sekulære og periodiske perturbationer fra måne og sol og geopotentialresonans på { "12" } t / { "24" } t). Den er valideret mod de officielle verifikationsvektorer fra AIAA 2006-6753 ("Revisiting Spacetrack Report #3"): alle { "666" } referencetilstande på tværs af tilfældene nær jorden, dybt rum, resonans og fejlkode stemmer med en værste positionsfejl på ca. { "4" } mm. Det er den model, som elementsæt på to linjer er defineret mod, så den repræsenterer rigtige konstellationer — især GNSS-baner på ca. { "12" } t, som er dybt rum og resonante, og som den tidligere to-legeme- + J2-sekulære model ikke kan fange.

seg-06a77fb9233e = En konstellation angivet som <b>fulde elementsæt på to linjer</b> (linje { "1" } + linje { "2" }) propageres nu med SGP4/SDP4; en konstellation angivet som elementer med kun linje 2 beholder den analytiske keplerske to-legemepropagering, uændret. De to former kan blandes i én blok. Nyt referencescenarie <c1/> (en GPS-lignende MEO-konstellation i rigtigt format med to linjer, propageret med SGP4) — læg et aktuelt Celestrak "gps-ops"-sæt ind for at studere den levende konstellation.

seg-2dbb4054e9b8 = <b>Demonstrator af aktivt spoofing-angreb.</b> En ny scenarietype <c1/> injicerer en rampende falsk tids-spoof og kører hvert urs urstøttede integritetsmonitor og rapporterer, om og hvornår spoofen detekteres, og om den når den operationelle specifikation uopdaget — hvilket gør kvalitetsmålet Sikkerhed til en konkret demonstration af angreb/forsvar. Nyt referencescenarie <c2/>.

seg-aa0cb8038baa = <b>Tilgængelighed med flere konstellationer.</b> Et orbitscenarie kan kombinere flere konstellationer (en liste <c1/> ved siden af den primære <c2/>) til multi-GNSS-tilgængelighed og præcisionsfortynding — fx GPS plus Galileo. Nyt referencescenarie <c3/>.

seg-9b9dcd5be0a7 = <b>HTML-scorecard-rapport.</b> Hver kørsel producerer nu også et selvstændigt scorecard i HTML med brandet udseende — oversigten på én linje, diagrammet (indlejret som et inaktivt data-URI-billede) og hele JSON — skrevet af CLI'en ved siden af JSON og SVG. En delbar enkeltfilsartefakt til en studieleverance eller et bilag.

seg-76c573048a91 = <b>Fælles sensorfusionsestimator.</b> En ny scenarietype <c1/> kører ét enkelt rekursivt Kalman-filter som navigationsløsning — det fusionerer urtilstanden <c2/> og positionstilstanden <c3/>, disciplineret af GNSS (der lærer frekvensforskydningen og hastigheden) og støttet af optisk tidsoverførsel under udfaldet — i stedet for at sammensætte uafhængige prædiktorer. Den rapporterer fusioneret holdover for tidssynkronisering/position og en integritet fra den fælles kovarians. Nyt referencescenarie <c4/>.

seg-10f0501c91ef = <b>Fyldigere IMU-støjmodel.</b> Accelerometeret modellerer nu de resterende Allan-varianstermer ud over den konstante bias og hastigheds-random-walk: <b>biasustabilitet</b> (et 1/f-flickergulv ved den almindelige Allan-koefficient for biasustabilitet, der genbruger urets flickersyntese) og <b>acceleration random walk</b>. Nye valgfrie scenariefelter <c1/> og <c2/> for inertial; en ny GNSS-positionsbestemmelse rekalibrerer den resterende biasdrift.

seg-251ffc7b7722 = <b>Ægte konstellationsgeometri fra TLE'er.</b> En konstellation kan angives som en blok af elementsæt på to linjer (standardformatet fra NORAD/Celestrak) via et felt <c1/>, så tilgængelighed og præcisionsfortynding bruger en rigtig konstellations offentliggjorte geometri i stedet for et syntetisk Walker-mønster. Motoren læser hver TLE's middelelementer og propagerer dem som to-legeme — ikke SGP4 — hvilket er forsvarligt for et snapshot-studie fra en fælles epoke. Nyt referencescenarie <c2/>.

seg-7deb93b51cc7 = <b>Parametersweeps til afvejningsstudier.</b> En ny scenarietype <c1/> varierer én parameter (<c2/>, <c3/>, <c4/> eller <c5/>) over et lineært eller logaritmisk interval og registrerer et valgt kvalitetsmål i hvert punkt for begge ure, hvilket giver sammenligningsdiagrammet "hvordan skalerer holdover med urets stabilitet?", som en udformningsafvejning har brug for. Nyt referencescenarie <c6/>.

seg-ef6f3e77b476 = <b>Monte Carlo-konfidensbånd.</b> Urets holdover-scenarie kan køre mange realiseringer (nyt valgfrit felt <c1/>): hvert kvalitetsmål rapporteres så som en middelværdi med en spredning fra 5. til 95. percentil, og diagrammet skraverer fejlkonvolutten på { "5" }–{ "95" }% omkring medianen for hvert ur. En enkelt kørsel er stadig standard. Nyt referencescenarie <c2/>.

seg-e70cc0973fa3 = <b>Excentriske baner og J2-drift.</b> Banetypen er nu en fuld keplersk bane (stor halvakse, excentricitet, inklination, RAAN, perigæumsargument, middelanomali), propageret ved at løse Keplers ligning, med valgfri sekulær J2-regression af knuden og apsidepræcession. Nye valgfrie scenariefelter <c1/>, <c2/> og <c3/> og et referencescenarie <c4/> (en meget excentrisk bruger med kritisk inklination på { "12" } t). Cirkulære baner beholder den oprindelige lukkede sti bit for bit.

seg-cc041e16d418 = Den hybride pakke (kombineret PNT) rapporterer nu <b>Integritet</b> og <b>Sikkerhed</b>, så alle fire pakker dækker det fulde sæt af operationelle kvalitetsmål. Integritet er indeslutningen af beskyttelsesgrænsen i tidskanalen fra en Kalman-estimator, der er disciplineret mod reference, mens GNSS er nominelt, og forankres igen (mere løst) ved hver optisk gensynkronisering; dens grænse inkluderer linkets gulv for målestøj, så et ur, der er langt bedre end linket, scores mod den leverede løsnings faktiske støj. Sikkerhed er scoren for urstøttet spoof-detektering mod tidsspecifikationen.

seg-e0b666457d6e = Udgivelsesnoter genereres nu fra det kuraterede CHANGELOG-afsnit for tagget (<c1/>), så hver GitHub-release fremhæver, hvad der er ændret, i stedet for at opregne rå commits.

seg-f785718e9454 = Kvalitetsmålet <b>Sikkerhed</b> (tidligere ikke udfyldt): en score for urstøttet spoof-detektering for pakkerne for urholdover og bane. Det modellerer en integritetsmonitor, der krydstjekker GNSS-afledt tid mod urets egen udglidede forudsigelse over et sammenhængende vindue; detekteringsgulvet kombinerer den midlede målestøj med urets usikkerhed under udglidning, så et roligere ur detekterer mindre, langsommere tids-spoofs. Scoren rapporteres i <c1/> relativt til tidsspecifikationen og fuldender de seks operationelle kvalitetsmål.

seg-9164140872c8 = Geometriafledt <b>positionsnøjagtighed</b> til orbitpakken: ud fra sigtelinjegeometrien til de synlige satellitter danner den designmatricen og dens kovariansfaktor <c1/> og giver præcisionsfortyndingsfaktorerne (GDOP/PDOP/HDOP/VDOP/TDOP). Positionsnøjagtigheden er positions-DOP skaleret med en konfigurerbar brugerækvivalent afstandsfejl (nyt valgfrit scenariefelt <c2/>). Et orbitresultat indeholder nu en geometrioversigt (andelen af samples med positionsbestemmelse, bedste og median PDOP og positionssigma).

seg-3285502161c6 = En <b>playground</b> i browseren (<c1/>), der kører motoren hos klienten som WebAssembly: vælg et referencescenarie eller redigér TOML, kør det og se oversigten, diagrammet og hele JSON, uden at noget uploades. En arbejdsgang <c2/> bygger og udgiver den på GitHub Pages, og en ny WebAssembly-eksport <c3/> understøtter udlæsningen.

seg-0dca5318f7ce = Mærkede y-akser på SVG-diagrammerne: gitterlinjer, numeriske tick-labels og en akseoverskrift med enheder (via en fælles hjælper <c1/>), så størrelser kan læses.

seg-ce84a3d61f19 = Arbejdsgang til pakkeudgivelse (<c1/>) for crates.io, PyPI og npm, hver især betinget af sit registry-token og udløst af en udgivet release.

seg-0f01369fc29b = Flicker (1/f) FM-gulv til urfejlmodellen, syntetiseret som en sum af logaritmisk fordelte Ornstein-Uhlenbeck-processer og kalibreret, så det flade gulv for Allan-deviationen ligger på et konfigurerbart niveau. Slået fra som standard; aktiveres pr. ur via det valgfrie scenariefelt <c1/>.

seg-5b7fcd386fd3 = Gyrokanal til den inertiale model: resterende gyrobias og vinkel-random-walk driver en attitudefejl (tilt), der kobler tyngden ind i en vandret fejl i specifik kraft, den dominerende mekanisme for fejlvækst i strapdown. Slået fra som standard; aktiveres pr. sensor via de valgfrie felter <c1/> og <c2/>.

seg-efe9f10d2641 = Kalman-urestimator med to tilstande (fase, frekvens) og eksakt van Loan-diskretisering af processtøj. Udglidning fra en kendt tilstand gengiver den analytiske vækst i holdover-fejl (<c1/>) eksakt, og filteret giver desuden en online 1-sigma-usikkerhedsgrænse.

seg-539e24f34ed1 = Urkørslen rapporterer nu kvalitetsmålet <b>Integritet</b> (tidligere ikke udfyldt): andelen af samples under udfaldet, hvis fejl holder sig inden for filterets beskyttelsesgrænse på 3 sigma, vist i JSON-resultatet og CLI-oversigten.

seg-80620c97e3f5 = Geometriafledt GNSS-tilgængelighed: propagering af cirkulære baner, en generator af Walker-delta-konstellationer og sigtelinjesynlighed (jordens skygge plus elevationsmaske) giver tilgængelighedstidslinjen ud fra reel banegeometri. Ny scenarietype <c1/> og referencescenariet <c2/> (et rumfartøj inde i GNSS-skallen med intermitterende dækning).

seg-67549163ad7d = Valgfri Python-udvidelse (PyO3, abi3), der udstiller <c1/>, <c2/> og <c3/>, pakket med maturin (<c4/>) og bygget til Linux, macOS og Windows af en arbejdsgang <c5/> ved release-tag. Bindingen er en valgfri afhængighed bag en feature: standardbygget, testene og afhængighedsrevisionens gate er upåvirkede.

seg-c76dc363f0b1 = Valgfrit WebAssembly-modul (wasm-bindgen), der udstiller <c1/>, <c2/> og <c3/>, bygget med wasm-pack under featuren <c4/>; <c5/> er målafgrænset til at bruge browserens entropikilde på <c6/>.

seg-cf1b0eef2201 = Delt dispatch <c1/>, som bruges af både CLI'en og begge bindinger, så kommandolinjen og bindingerne ikke kan drive fra hinanden.

seg-8d4f855d11bd = Scoring af holdover er nu segmentbevidst: udfaldstidslinjer opdeles i sammenhængende segmenter ved GNSS-genopfangning, og den rapporterede holdover er den værste (korteste) udglidning på tværs af dem. Scenarier med ét udfald er uændrede. Gælder for ur-, inertial- og hybridscorerne.

seg-8b3556d125ed = Den rapporterede <c1/> for den inertiale model er nu <c2/> (var <c3/>) og afspejler de kombinerede accelerometer- og gyrokanaler.

seg-d842f9cc0a9c = Første udgivelse.

seg-962b75c38735 = <b>Deterministisk simuleringsmotor</b> til hybrid kvante-/klassisk PNT: en fælles grænseflade for fejlmodeller, deklarative GNSS-tilgængelighedsscenarier, estimatorer for holdover / dødregning og scoring af kvalitetsmål mod de almindelige operationelle PNT-kriterier. Resultater kan gengives ud fra <c1/> (versioneret, selvbeskrivende JSON med en scenariehash) og tegnes som SVG-diagrammer. CLI'en aktiverer scenarier efter <c2/>.

seg-16e574edc3a8 = <b>Fire sensorpakker</b>, hver kalibreret til offentliggjorte data og valideret mod den almindelige relation:

seg-b49bbb60c2cd = <b>Urholdover</b> — hvid FM, random-walk FM og lineær aldring; valideret ved overlappende Allan-deviation (Riley, NIST SP { "1065" }). Chip-skala atomur mod optisk gitterur med strontium.

seg-be2c5f28b256 = <b>Inertial dødregning</b> — resterende bias + hastigheds-random-walk, dobbeltintegreret til positionsfejl; valideret mod Groves' relationer for fejlvækst. Koldatom- mod navigationsklasse-accelerometer.

seg-fcb0f72db736 = <b>Tidsoverførsel</b> — optisk mod RF-link, tidsjitter → synkroniseringspræcision → envejs afstandsmåling.

seg-93e5f2f70b58 = <b>Hybrid fusion (afslutning)</b> — en kombineret PNT-pakke, der skal holde både tid og position, med valgfri urstøtte via optisk tidsoverførsel mellem satellitter.

seg-e0a8cbe0c105 = <b>Ét citeret referencescenarie pr. pakke</b> under <c1/>, hvor hver numerisk parameter bærer en fagfællebedømt kilde (<c2/>).

seg-8f1cc09b2513 = <b>Værn for reproducerbarhed og repositoriehygiejne</b>; CI (format, clippy, tests, værn, MSRV) og en release-pipeline spærret bag et tag, der kører alle kontroller igen.

seg-8b4e21f56334 = <b>Dokumentation</b>: README med arkitekturdiagrammer, rapport om valideringsstatus, bidragsguide, sikkerhedspolitik og adfærdskodeks; Apache-2.0-licens; skabeloner til issues/PR'er og Dependabot-konfiguration.

seg-e26d94f06ead = Leverandørneutral hele vejen igennem; fagfællebedømte videnskabelige og metrologiske citater bevaret.

seg-84cb67686edf = Licenshygiejne for Apache-2.0: SPDX-headers på alle kilder, en fil <c1/> med varemærkemeddelelse, Developer Certificate of Origin (DCO)-underskrift for bidrag og håndhævelse af afhængigheders licenser/advisories i CI via <c2/>.

seg-a0f14bea7532 = Open-core-positionering (README): en gratis Apache-2.0-motor plus tilgængelig kommerciel support, integration og proprietære udvidelser fra Ashforde OÜ — båret af tjenester, ikke licensgebyrer.

seg-899815063eb1 = <c1/> så softwaren kan citeres.

seg-15f45d8ccb0f = <s1>Forrige</s1>Hvor Kshana står

seg-cd8a14a9e8ec = <s1>Næste</s1>Licensering

seg-1200856c90da = [{ $version }] - 2026-10-28

seg-05d0c798a196 = { "0.40" } tilføjer missionstråden i Artemis-klassen og dens månesegment, en evidensetiket på hvert tal og hver tabel, en kørsel skriver, indlæsning og tilpasning af målte ure, en kontrol af datapartneres indsendelser, et estimeret senderområde ud fra ADS-B- eller AIS-rapporter, gen-kampagnen for benchmark { "0.40" } samt kommandolinjen, rapporterne og Studio på sytten sprog ved siden af engelsk (maskindokumenter forbliver engelske). Verifikationsmatricen vokser fra { "388" } til { "401" } rækker: { "176" } VALIDATED (uændret), { "221" } MODELLED (var { "208" }) og { "4" } PARTNER. Ingen række blev opgraderet til VALIDATED. Scenarietyperne vokser fra { "87" } til { "92" }. Hver tærskel, en præregistreret sammenligning missede, er opgivet nedenfor og forbliver fastholdt; ingen blev lempet. Den vejledende erklæring er uændret: Kshana er vejledende software, ikke typegodkendt navigationsudstyr og ikke en certificering; operatøren er fortsat ansvarlig.

seg-738f33f0ae8a = Kendte begrænsninger

seg-d4062fab7ae1 = Kørsler på andre sprog end engelsk tager omkring dobbelt så lang tid, fordi scenariet køres to gange (én gang på engelsk til maskinfilerne, én gang på det valgte sprog til personen).

seg-8db6dedc627a = Nogle sætninger i Studio er sat sammen af fragmenter og kan mangle artikler på sprog med grammatisk køn.

seg-86e6e35ac846 = Oversættelserne er maskinoversættelser, som ingen modersmålstalende har gennemgået; engelsk er referencen.

seg-dd7ee240b467 = <b>Sytten sprog ved siden af engelsk</b> til motorens tekst til mennesker og til webstedet og Studio: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, lokalitetsvariablerne; <c3/> på kald til biblioteket, Python, WebAssembly og MCP). Meddelelser og fejl på kommandolinjen, kørselsoversigter, diagramtekst, <c4/>, beskrivelser af typer og de vejledende erklæringer er oversat; maskindokumenter (JSON, CSV, fejlkoder, verifikationsmatricen) forbliver engelske, og en kørsel på et andet sprog end engelsk udfører scenariet én gang på engelsk til maskinfilerne og én gang på det valgte sprog til personen (<a1><c5/></a1>). <b>Oversættelserne er maskinoversættelser, ikke gennemgået af modersmålstalende; engelsk er referencen</b>; hvert sprogs <c6/> angiver, hvad en gennemgang bør kontrollere først, og webstedets sider bærer en meddelelse om det. Dommeord, evidensniveauer og den vejledende afgrænsning ("ikke typegodkendt", "ikke en certificering", "operatøren er fortsat ansvarlig") bevares på alle sprog.

seg-7a95c263ecec = <c1/>: et <b>estimeret senderområde</b> ud fra ADS-B- eller AIS-rapporter. En posterior over, hvor en kilde til forringede positionsrapporter kan være (radiosigtlinje på en 4/3-jordradius, senderantennens højde og effekt marginaliseret, berørte fly trækker og uberørte fly med sigtlinje skubber imod), skrevet som områder ved { "50" }, { "90" } og { "95" }%, et tyngdepunkt med dets usikkerhedsellipse (aldrig et bart punkt), sessioner i tid (start, slut, varighed, berørt areal, forskellige fly over offentliggørelsesminimum), en døgnprofil og timer pr. dag, med valgfri fusion af en TDOA-positionsbestemmelse fra <c2/>. Output: GeoJSON, JSON-oversigt, sessions-CSV og en SVG-figur, hver med licens, kildeangivelse, metode-id, antagelser, begrænsninger og sin evidensetiket. Bibliotek <c3/>, Python og WebAssembly <c4/>. MODELLED (registerrække <c5/>; matricen er nu på { "401" } rækker, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); kalibreret kun på syntetiske data, med sammenligningen mod senderpladserne i Jammertest { "2025" } præregistreret og kørt én gang: ADS-B og AIS begge NOT ASSESSABLE (for få planlagte sessioner i de åbne data), så rækken forbliver MODELLED (<c6/>). Neutral formulering, kun aggregeret; offentliggørelse af senderområder i det offentlige observatorium forbliver slået fra. Et syntetisk eksempel findes i <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Målte urlogs.

seg-59b240848747 = <c1/> læser en målt urlog til én faseserie: otte formater (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> og <c4/>, chrony tracking og statistik), hvert en dokumenteret delmængde; alt uden for den afvises med en fejl, der nævner, hvad der blev fundet. Den bruges af <c5/> (<c6/>) og typen ur (<c7/>, som tilføjer en blok <c8/> med logens SHA-256 og de overlappende ADEV, TDEV og MTIE), med det medfølgende scenarie <c9/> (<a1><c10/></a1>). Sammenlignet med allantools på virkelige offentlige data mod præregistrerede tærskler: den første kørsel <b>missede</b> B1 ({ "5" } af { "11" } tilfælde, alle TICC-tidsstempler holdt som <c11/>), B2, B3 ({ "7" } af { "24" } tilfælde) og B4 (headerens version blev ikke kontrolleret); efter rettelserne er B1, B3 og B4 nået, og B2 er nået bortset fra ét MTIE-par, som er fastholdt og ikke er en fejl i motoren (allantools { "2024.6" } fjerner middelfrekvensen, før den integrerer; mod dens MTIE i fasetilstand stemmer motoren overens inden for { "1e-10" }). Rækken forbliver MODELLED (<c12/>).

seg-400a39dbf3dd = <b>En holdover drevet af en tilpasset målt serie</b>: urtypens <c1/> tilpasser støjen i en målt serie og driver holdoveren ud fra den (<c2/>, medfølgende scenarie <c3/>). Præregistreret sammenligning: F1(b), F3 og F4 nået; F1(a) (genfinding af den registrerede random-walk-FM) <b>NOT MET</b> på C3-optagelserne (ikke identificerbar pr. konstruktion) og på to af tre C4-optagelser (random-walk-FM opslugt af flicker-FM og drift); F2 (støjidentifikation mod allantools) nået på elleve af tolv optagelser og D3 og <b>NOT MET</b> på D2 som registreret (nået på sammenlignelig basis). Alle misser er fastholdt (<c4/>); blokken <c5/> og den holdover, den driver, forbliver MODELLED (<c6/>).

seg-f1f15e102774 = <b>Gen-kampagnen for benchmark { "0.40" }</b>, præregistreret med ejerens frigivelse før enhver kørsel: A3 (EXPLORATORY, den mappeklyngede bootstrap-AUC for <c1/>, { "2.5" } %-kvantil { "0.8502" } mod { "0.80" }), D3 (EXPLORATORY, tre af fem detektorer overstiger et optimismegab på { "0.05" } ved skala { "0.25" }), R3 (AUC { "1.0" }) og R4 (P_fa { "0.0" }, P_d { "1.0" }): alle MET, alle MODELLED. A2, D1 og R1 er urørte og forbliver <b>NOT MET</b>; intet her lukker dem (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/>: kontrollerer format og metadata for en indsendelse fra en datapartner (<c2/>: enhed, datafil og SHA-256, hvordan den blev optaget, de MODELLED-rækker, den tilbydes mod, licens, erklæringer) og læser dataene med motorens egne læsere af urlog eller IMU. Den scorer intet og validerer intet. Et syntetisk eksempel findes i <c3/>.

seg-823e1abc7f92 = <c1/>: hvilke MODELLED-registerrækker målte data kunne opgradere, de accepterede formater, hvordan en indsendelse kontrolleres, scores mod en præregistreret tærskel og krediteres, og hvad PARTNER og VALIDATED hver især betyder; et udkast til en henvendelse til partnere til ejeren i <c2/> (intet sendes).

seg-34bdcfd66ded = I den repository-gren, disse dokumenter kommer fra; endnu ikke på GitHub

seg-ddd45d39e8a9 = <b>Anden kampagne for de tærskler, <c1/> og <c2/> ikke nåede</b>, kørt som præregistreret (<s1><c3/></s1>, <s2><c4/></s2>; frigivet før enhver kørsel). Hver oprindelig miss forbliver NOT MET og fastholdt. <c5/>: kontrollen gengiver kørsel { "1" } celle for celle; fem ablationer med én aflæsning bringer { "2" } af de { "78" } missede celler inden for tolerancen (EXPLORATORY, ingen tærskel); den nye tærskel S7b (en sendeform med roll-off og gulv, tilpasset Classic IIR-paneler) er NOT MET på IIR-M-panelerne ved { "3.83" } til { "3.95" } dB mod { "3" } dB; kampagnen med tilbageholdt offentliggjort modtagelse blev ikke kørt (ingen kilde fastlåst) (<s3><c6/></s3>). <c7/>: de nye tærskler C3a, C3b (en detektionsgrænse på omkring { "3e-9" } m/s2), Q3a, Q3b (en nøjagtig normalfordeling fjerner forskellen på { "1.7e-6" }) og G3'' er nået som deres egne tærskler, og G3' med illustrative priorer er nået og betegnet EXPLORATORY (<s4><c8/></s4>). Alt forbliver MODELLED. Nye offentlige elementer: <c9/>.

seg-bc89e70f4d36 = <b>En evidensetiket på hvert tal og hver tabel, en kørsel skriver.</b> Resultat-JSON har en nøgle <c1/>, diagram-SVG et metadataelement og en linje under diagrammet, og CSV-tabellen <c2/> kommentarlinjer: niveauet (<c3/>, <c4/> eller <c5/>, det svageste af rækkerne) og id'erne på de verifikationsmatrixrækker, kørslen hviler på. Rækker og statusser læses fra matricen og er ikke skrevet ind; id'erne er stabile (<c6/> og otte hex-cifre, en ny kolonne <c7/> i <c8/>, en fastfrosset liste i <c9/>). Også på receiver-trust, <c10/>, <c11/>, rapporten om rute-eksponering og, inde i den signerede <c12/>, hver bevispakke (<c13/> { "1.1" }; <c14/> rapporterer niveauet; pakker lavet før { "0.40" } verificeres uændret). <c15/> fejler, hvis et tal ikke har en etiket, en etiket er uenig med matricen, eller en ny filskriver hverken er mærket eller opført med en begrundelse. Output, der ikke bærer nogen, er opført i <c16/>. De tre demodiagrammer i README blev gengivet igen med etiketten (fjernes den, vender de gamle bytes tilbage; <c17/>). Ingen påstand er ændret.

seg-8abd87414bc4 = Scenarietypen <c1/> (<c2/>, <c3/>): fejlbudgettet for navigation og tidssynkronisering for en kæde af faser fra opsendelse til indflyvning, hvert tal MODELLED og hvert input angivet. Otte fasetyper: <c4/>, <c5/> (relativ Clohessy-Wiltshire-kovarians over sensorstrækninger, dockingvindue), <c6/> (Cowell-propagering med en tilstandsovergangsmatrix med endelig differens, brændingsfejl, <c7/> og opdateringer fra jordsporing, Månen fra et valgfrit udsnit af DE440-kernen), <c8/> (sigma for flyvebanevinklen, korridorsandsynlighed, maksimal deceleration ved korridorkanterne, landingsfodaftryk) og de fire månetyper. Overdragelsesregler (<c9/>, <c10/>, <c11/>), konverteringer af referencesystem og tidsskala som egne budgetrækker, et valgfrit overlay af jordnetværk, der sætter hver fases sporingsandel, marginen mod angivne krav og det svageste led. Eksemplet følger rækkefølgen i et offentligt NASA-slidedeck om operationskoncept med ILLUSTRATIVE tal: et Artemis-eksempel i hele forløbet over { "11" } faser, jord- og månesegmenter. Den cislunare propagering blev sammenlignet med den offentlige bane for Artemis I over en bue på { "72" } timer mod en tærskel fastsat i <c12/> før kørslen: <b>NOT MET</b> ({ "45.3" } km og { "0.25" } m/s mod { "5" } km og { "0.05" } m/s). Diagnosen placerer missen i fem små impulsive hændelser i referencen; mellem dem gengiver kraftmodellen timetilstandene med en median på { "0.4" } m. Rækken forbliver MODELLED (<c13/>).

seg-67cad0a9c0c4 = Månesegmentet i missionstråden i Artemis-klassen: fire scenarietyper, hver også en fasetype i grænsefladen <c1/> (<c2/>), alle MODELLED.

seg-63066076a0a8 = <c1/>: relativ navigation til docking i en cirkulær polar bane på { "100" } km eller en elliptisk polar bane på { "100" } km gange { "3000" } km (<c2/>, <c3/>). Et batch-Gauss-Newton-estimat over buen fusionerer en absolut positionsbestemmelse pr. køretøj fra et illustrativt relæsæt i LCNS-klassen, en vedvarende fejl i signal i rummet (fælles for begge køretøjer og uafhængig) og en krydslinkafstand under cratens månekraftmodel. Det rapporterer den relative position og hastighed i målets lokale akser, tilgængeligheden af positionsbestemmelser, den gennemsnitlige normaliserede estimeringsfejl i anden mod dens forventede værdi, omkostningen ved at ignorere tyngdeharmonikkerne, de afsluttende relative sensormodeller ved siden af tallet med kun signaler og den 6x6-kovarians, der gives videre.

seg-a2d67bb5cfb3 = <c1/>: budgettet for landingsspredning på et sted ved sydpolen (<c2/>; <c3/> læser LOLA-DEM fra et checkout): en inertiel fejlmodel med fem tilstande pr. akse, en AFS-positionsbestemmelse (selvstændig eller differentiel, med residualet fra korrektionslinket i <c4/>), en terrænrelativ positionsbestemmelse (matcheren <c5/> på sit syntetiske relief eller Cramer-Rao-grænsen for matchning af LOLA-DEM) og månetid gennem køretøjets ur (<c6/>). Den rapporterer 3-sigma-landingsellipsen, hver kombination af støtte og en Monte Carlo-kalibrering af ellipsen.

seg-1babf99e8d56 = <c1/>: tilgængelighed af positionering og tidssynkronisering efter sted og årstid (<c2/>; <c3/> tilføjer den stråleforfulgte LOLA-horisont): tallet for positionering ved ét sted er lig med <c4/>s til sidste bit; sigtbarheden af Jorden og Solen fra de analytiske efemerider er det, der flytter sig med årstiden.

seg-bae659d0ff4d = <c1/>: opstigningen til rendezvous-banen og position-hastighedskovariansen ført tilbage til banen (<c2/>), med spredningen ved motorafbrydelse rapporteret ved siden af.

seg-106be12d960f = <c1/>; præregistreringen, dens ændringer og hvert resultat, misser medregnet, i <c2/>.

seg-5e8880c28a67 = Præregistreret i <c1/> før enhver kørsel, med seks daterede ændringer (hver foretaget, før dataene blev hentet, undtagen ændring { "6" }, som retter en regnefejl i et tilstandsantal efter hentningen og før noget A2-resultat; hver ændring er oplyst i filen). Ingen tærskel blev lempet.

seg-90adc3a3c58b = A1 (propagatoren mod den rekonstruerede LRO-bane fra JPL Horizons, { "24" } timer): <b>MET</b>, en maksimal 3D-forskel på { "33" } m mod en tærskel på { "500" } m og en radial RMS-forskel på { "2.4" } m mod { "60" } m.

seg-69f903a278eb = A2 (samme propagator mod CAPSTONE NRHO over ét omløb på 6,5 dage): <b>NOT MET</b>, en forskel i slutposition på { "136.8" } km mod en tærskel på { "25" } km og en forskel i den oskulerende periapsisradius på { "28.4" } km mod { "10" } km. Rækken forbliver MODELLED, og missen er fastholdt af <c1/>.

seg-32fcafe8fa07 = B1 (rendezvous-estimatets konsistens med sin egen model) er MET på det fjerde estimatordesign, gennemsnitlig NEES { "5.85" } til { "5.93" } mod et bånd på [{ "5.2" }, { "6.8" }]; de tre tidligere designs, et udvidet Kalman-filter i tre varianter, missede den. En femte ændring, foretaget efter det udleverede scenarie på { "2" } timer viste sig at sende { "4" } af { "50" } forsøg i et lokalt minimum (gennemsnitlig NEES { "1e9" }), kører Gauss-Newton-tilpasningen på en voksende bue med trinhalvering; B1 er upåvirket af den, og de udleverede scenarier giver { "6.51" } og { "6.33" }. Historikken findes i <c1/>.

seg-a4b6bfcb9984 = Intet her er VALIDATED: rækkerne med uafhængig reference afprøver den delte propagator, ikke et navigationsfilter, et signal eller et budget.
