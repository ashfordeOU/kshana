# docs--changelog: translations (da)

seg-9a2a5f0a8a02 = Solsystemet

seg-20db2c79b998 = Valideret

seg-a20b4a6e8f53 = chipskala-atomur

seg-49a994d77d2f = temperaturkompenseret krystaloscillator

seg-2247a2344710 = Betydning

seg-40d4fc0d3922 = Kilde: <c1/>

seg-7333b85d448f = Alle væsentlige ændringer i Kshana dokumenteres her.

seg-bbc8f38627f1 = Formatet bygger på <a1>Keep a Changelog</a1>, og dette projekt følger <a2>Semantic Versioning</a2>. Så længe projektet er før 1.0, kan det offentlige skema for scenarier og resultater stadig ændre sig; brydende ændringer fremhæves udtrykkeligt.

seg-985f7b4c001a = Ikke udgivet

seg-66749e5be121 = [{ $version }] - 2026-10-22

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
