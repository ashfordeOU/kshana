# docs--changelog: translations (nb)

seg-9a2a5f0a8a02 = Solsystemet

seg-20db2c79b998 = Validert

seg-a20b4a6e8f53 = chipskala atomklokke

seg-49a994d77d2f = temperaturkompensert krystalloscillator

seg-2247a2344710 = Betydning

seg-5770537524d3 = Område

seg-40d4fc0d3922 = Kilde: <c1/>

seg-7333b85d448f = Alle merkbare endringer i Kshana er dokumentert her.

seg-bbc8f38627f1 = Formatet bygger på <a1>Keep a Changelog</a1>, og dette prosjektet følger <a2>Semantic Versioning</a2>. Så lenge prosjektet er før 1.0, kan det offentlige skjemaet for scenarioer og resultater fortsatt endres; brytende endringer er uttrykkelig varslet.

seg-985f7b4c001a = Ikke utgitt

seg-a2f583aadd0b = Ingen nye funksjoner: én rettelse i kommandolinjen, avhengighetsoppdateringer i verktøyene for kryssvalidering og dokumentasjon. Motorens resultater er uendret fra { "0.38.0" }.

seg-c9a8a5898ced = Rettet

seg-3cc8ba4d1be6 = Kommandolinjen avslutter stille med status { "141" } når standardutdata lukkes (<c1/>), i stedet for å panikke med "failed printing to stdout: Broken pipe". { "141" } er { "128" } pluss SIGPIPE, statusen et skall rapporterer for <c2/>. Bare en lukket pipe håndteres: en full disk eller en annen skrivefeil rapporterer seg fortsatt, og en levende strøm som skriver til en lukket socket får fortsatt sin skrivefeil. <c3/> lukker leseren før programmet starter, så den første skrivingen feiler i hver kjøring.

seg-2a47e785cc1d = Avhengighetsoppdateringer i verktøyene for kryssvalidering (<c1/>); ingen levert crate, wheel eller pakke endres.

seg-9df898fb24be = <c1/> { "0.9.10" } til { "0.9.11" } (RUSTSEC-2026-0186) i låsfilene for ANISE-kryssjekkene (<c2/>, <c3/>); låsfilene synkroniserer også på nytt sti-avhengigheten <c4/> i repoet.

seg-835e9d6058f8 = <c1/> { "12.3.0" } til { "13.0.0" } og <c2/> { "2026.7.22" } til { "2026.10.19" } i festingene for miljøet til de uavhengige referansene (<c3/>, <c4/>): de rettede utgivelsene for åtte pillow-sikkerhetsmeldinger og én certifi-sikkerhetsmelding.

seg-902fc421a851 = <c1/>, README-filen og denne filen lister hver kshana-bench-terskel som er NOT MET, slik den er registrert i <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } mot minst { "0.80" } på testsplitten), <b>D1</b> (største gap { "0.0301" }) og <b>oppgave (b) R1</b> (videreført, ikke kjørt på nytt). Ingen terskel er svekket.

seg-44d9c9622c24 = Gjennomgang av README for fullstendighet: en innholdsliste; scenariotypene ordnet under familier, hver med en side under <c1/> (motorens beskrivelse og felt, inngangene og resultatene av en eksempelkjøring, registerradene og de uavhengige referansene, begrensningene kjøringens rapport oppgir, og diagrammet motoren skriver), et kontaktark per familie, alle indeksert av <c2/>; hver kommando i <c3/>; hver flate, plugin-kommando, ferdighet og Studio-side i <c4/>; hvert funksjonsområde i <c5/>; innebygde Mermaid-diagrammer (systemoversikt, flater, indre sløyfe, mottakertillit, laboratorie-rundtur, Studio, test- og utgivelsesflyt, modulkart, distribusjon). Skrevet av <c6/>, <c7/> og <c8/>; revidert av <c9/>; vaktet av <c10/>, som også låser hver oppførings beskrivelse og felt til motoren.

seg-b953186d5726 = <c1/>: gjengir et Mermaid-diagram til SVG og PNG på Linux og oppdaterer gjengivelsesregisteret.

seg-68e19f94faed = README: figurene for rombrukere og månen brukte stier relative til <c1/>, så de ble ikke lastet fra README-filen; én lenke pekte til <c2/>.

seg-850e1574e2d6 = Fjernet to utdaterte, håndkopierte diagramfiler (<c1/>, <c2/>) som ingen side brukte og som ikke lenger stemte med motoren; <c3/> har de gjeldende diagrammene.

seg-033d52126d8a = Lagt til

seg-090bf5ae96b6 = <b>GNSS utover konstellasjonen (<c1/>).</b> En ny scenariotype for romfartøy over, rundt og forbi GNSS-banene (<a1><c2/></a1>): tilgjengelighet for ett og fire signaler, avbruddsvarigheter, C/N0, DOP og hovedlobe mot sidelobe-lenker for GPS, GLONASS, Galileo, BDS, QZSS og NavIC på et skall eller langs LEO-, MEO-, GEO-, HEO- og månetransferbaner; sendemønstre fra hefte, parametriske eller levert av brukeren; en modell for ionosfære, plasmasfære og atmosfære langs randstrålen; en mottakerutforming for svake signaler; et utvidet Kalman-filter om bord med GNSS for HEO og månetransfer; og relativ navigasjon i formasjon. Sammenlignet med ICG Space Service Volume-heftet under en forhåndsregistrering sjekket inn før kjøringen: konstantene for minste utstrålte effekt og månetersklene stemmer, de andre tersklene er ikke nådd under den forhåndsregistrerte lesningen (nesten alle på grunn av heftets inkonsistente GLONASS-strålevinkel), og den parametriske sidelobe-erstatningen gjengir ikke de målte GPS-panelmønstrene. Alt forblir MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Månebane og måneoverflate som infrastruktur for navigasjon og geodesi (<c1/>).</b> En ny scenariotype med fem studier valgt med <c2/> (<a1><c3/></a1>): konsistens i en banebestemmelse om bord med GNSS fra jorden i en nesten rettlinjet haloform bane mot en uavhengig bakkebestemmelse av avstand og avstandsrate; felles dobbeltdifferensiert bærebølgefase mellom overflatestasjon og orbiter med LAMBDA-fiksering av heltall; Fisher-informasjon for det sjuparametrede månedatumet med og uten avstander mellom orbiter og overflate; innbyrdes forskyvninger mellom teknikkene GNSS, VLBI og laseravstandsmåling mot den lokale koblingen; og følsomhet for h2, k2, l2 og den fysiske librasjonen. MODELLED, med ILLUSTRATIVE inndata: tallbehandlingen er kontrollert mot uavhengige numpy- og scipy-programmer, og ingenting er sammenlignet med en måling av en månestørrelse. Tersklene ble fastsatt i <c4/> og to opplyste endringer. Tre er NOT MET, og hver er festet av en test som slår fast at terskelen ikke ble nådd: C3 (en injisert kraftfeil oppdages ikke med den forhåndsregistrerte raten), Q3 (den bootstrappede suksessraten avviker fra numpy-referansen med { "1.7e-6" } mot en terskel på { "1e-9" }, fra LAMBDAs tilnærming til den normale CDF-en), og sporhalvdelen av G3 (å legge til en avstandsfamilie senker ikke alltid sporet til pseudoinversen). Resten er nådd (<a2><c5/></a2>).

seg-022859135e79 = <b>En sjette artikkel i forskningstabellen.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) viser at dilution of precision er udefinert for cislunar sporing med bare avstand, og bruker i stedet observerbarhetsgramianen på fire plane fjerne retrograde baner: bare avstand har rang { "2" } av { "4" } i et øyeblikksbilde og trenger en bue på omtrent { "2.09" } t, avstandsrate (Doppler) gir rang { "4" } umiddelbart, og samestimering av en stasjon med satellitttilstander og klokker forblir rangmangelfull med én uten en ekstern interferometrisk observabel. Tallene regenereres av typen <c1/> (<c2/>); <c3/> tester terskelen med en uavhengig estimator. Forskningskortet i README-filen, README-filene for crates, npm og PyPI og generatoren bærer den.

seg-d74a1b2dcb38 = Den nøytrale dommeren, gjort målbar.

seg-bf568567fe06 = <c1/> leser den publiserte NPRA Jammertest-katalogen og sendeplanen som planlagt referanse (katalog-ID-er beholdt), og <c2/> skårer en mottakerlogg mot den per test (deteksjonsforsinkelse, uteblitte alarmer, falske alarmer, tid til gjenoppretting), eventuelt som en signert bevispakke (<a1><c3/></a1>). Skåringstersklene ble forhåndsregistrert før noen skåret kjøring (<c4/>). På JammerTest-datasettet fra { "2024" } (hentet, aldri medlevert) sviktet den forhåndsregistrerte regelen om minstemengde data både i den første kjøringen og i revisjonen av datahåndteringen, så ingen terskel kan vurderes og ingenting hevdes; begge kjøringene er registrert og festet. MODELLED: planen er datasettets loggede vinduer, ikke registrerte sendetidspunkter. NMEA-settet fra SimulaMet fra { "2025" } er ikke tilpasset (ingen lisens oppgitt på siden).

seg-0a2bcad8d645 = <b>Mottakerens egne flagg, ved siden av Kshanas.</b> UBX-NAV-STATUS <c1/> og UBX-SEC-SIG leses inn i <c2/> for hver epoke, og sammenligningen <c3/> i resultatet setter dem opp mot Kshanas monitorer (begge, bare mottakeren, bare Kshana, ingen av dem); den utløser ingen alarm og endrer ingen score. En Septentrio SBF-leser (PVTGeodetic, MeasEpoch, RFStatus, skrivebeskyttet, på den MIT-lisensierte crate-en <c4/>) og <c5/> (en seriell eller USB NMEA-strøm, skrivebeskyttet; den skriver aldri til en mottaker) kommer i tillegg.

seg-90d9927fe3e2 = <b>Tidssynkronisering og maskinvaresikkerhet</b> (<a1><c1/></a1>, <a2><c2/></a2>). Scenariotypen <c3/> skårer en holdover-test av et tidssystem (GNSS fjernet av operatøren, holdover, gjenoppretting) fra en målt tidsfeilregistrering, målt mot ITU-T-maskene fra offentlige tabeller. <c4/> leser logger fra linuxptp (<c5/>, <c6/>, <c7/>) og chrony (<c8/>, <c9/>). <c10/> skriver ION GNSS SDR-metadata, og <c11/> overvåker et SigMF-opptak mens det vokser (kun mottak). <c12/> får NIST IR 8323r1 Foundational PNT Profile ({ "15" } parafraserte rader, gir belegg for). En bevispakke kan registrere operatørens <c13/> i sitt signerte manifest, aldri verifisert; maskinvaretrinnene { "0" } til { "4" } og de juridiske merknadene står i <c14/> (venter på juridisk gjennomgang). Det finnes ingen sendevei av noe slag.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): faste oppgaver, splitter og målinger for GNSS-interferensdeteksjon på mottakerlogger (JammerTest { "2024" }) og IQ, prediksjon av tidsholdover (IGS-klokker) og optimismegapet utenfor fordelingen; splittmanifester med festede hasher og hentingsskript (ingen data medlevert), et forseglet tilbakeholdt datasett med forpliktelse og avsløring, et skjema for resultatfiler og en statisk ledertavleside. Grunnlinjer under terskler forhåndsregistrert i <c4/>: skårerterskler nådd, C1 til C3 nådd, D2 nådd; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } mot minst { "0.80" } på testsplitten), <b>D1 NOT MET</b> (største gap { "0.0301" }) og <b>oppgave (b) R1 NOT MET</b> (videreført, ikke kjørt på nytt), hver festet (<c6/>). Hver score er MODELLED. Python <c7/>, <c8/>; WebAssembly på samme måte; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Interferensobservatorium</b> (<c1/>, <c2/>, <a1><c3/></a1>): en reproduserbar daglig GeoJSON, PNG og hendelsesrapport-JSON med tre tilstander (degradert, ikke degradert, ikke observert), en minste forsinkelse på { "24" } t, celler på { "0.5" } grader eller grovere, ingen årsak tilskrevet og OpenSky-data avvist; en følsomhetsstudie av de forhåndsregistrerte parameterne; et baltisk bakkatalog på 30 dager fra adsb.lol.

seg-497ae18bfb03 = <b>Maskin- og sensorinndata for <c1/></b> (<a1><c2/></a1>). Nye <c3/>-verdier, alle skrivebeskyttede, MODELLED, med selvskrevne fixturer og ingen data medlevert: <c4/> (RTKLIB <c5/>-løsningsfiler), <c6/> (OEM7 ASCII og binær <c7/>, <c8/> C/No og <c9/>; mottakerens jammerflagg blir epokens <c10/>, satt opp mot Kshanas alarmer av sammenligningen <c11/>), <c12/> (MSM4 og MSM7 C/N0 for GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou og NavIC; oppsett fra de BSD-lisensierte pyrtcm-tabellene, hvis merknad står i <c13/>, ikke fra RTCM-standarden) og <c14/> (GNSS-SDR Monitor- og PVT-monitormeldinger som JSON-linjer, videresendt av <c15/>).

seg-22e8b434782f = IMU-logger som en andre sensor.

seg-5491196d6421 = <c1/> (<c2/> eller <c3/>) integrerer gyroens gir-rate til den headingen monitoren <c4/> leser; innebygd på alle flater og båret gjennom bevispakker. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, plugin <c9/>, en JetBrains-handling) tilpasser akselerometer- og gyroparameterne i scenarioene <c10/> og <c11/> fra en stasjonær logg ved Allan-avvik og skriver ut en tabell <c12/> med loggens SHA-256 i opphavet.

seg-f48fdf6252cd = <b>Integrasjoner:</b> en ROS { "2" }-pakke (<c1/>: NavSatFix og <c2/> inn, tillitstemaer ut; dens ROS-frie bro er testet mot den virkelige motoren, selve noden har ikke kjørt på en levende ROS-graf), en bro til <c3/> (<c4/>, MIT-avhengighet, valgfri) og et GNSS-SDR-relé.

seg-1a8727ad42bb = <b>Home Assistant MQTT-eksport</b> for tillitstelemetri: <c1/> og <c2/> (oppdagelsesmeldinger og et JSON-tilstandsdokument; kun publisering, ingen legitimasjon eller TLS), og <c3/> som tekst i Python, WebAssembly og MCP.

seg-f1cb2c2881c9 = Sju registerrader som er MODELLED for det ovenstående. Ingenting her er VALIDATED: ingen opptak fra en virkelig mottaker, basestasjon, IMU, GNSS-SDR-kjøring, ROS-graf eller MQTT-megler ble lest.

seg-12c7a28c80b5 = <b>Optisk lenkemargin mot tid.</b> Typen <c1/> tar en valgfri tabell <c2/> (<c3/>, <c4/>, <c5/>) og skriver da også, per sted, én frøstyrt realisering av den oppgitte stedsmodellen gjennom tid: skyepisoder, en flytende vannsøyle per episode, ett gamma-gamma-scintillasjonssample per steg, og ut fra dem lenkemarginen, sky- og scintillasjonsfadene og lenke-oppe-flagget, med den realiserte tilgjengeligheten, skyandelen, antall avbrudd og lengste avbrudd. MODELLED (ett trekk fra modellen, ikke klimaet; ingen ekstern uavhengig referanse). Uten tabellen er resultatet dokumentet fra { "0.37" }. De to medfølgende optiske scenarioene bærer tabellen ({ "336" } t, { "600" } s, frø { "37" }). Terskler forhåndsregistrert i <c6/> før den første kjøringen.

seg-78524dbb3bd2 = Spesifikasjon for testbetingelser og laboratorie-rundturen.

seg-fbf034925641 = <c1/> er publisert som <a1><c2/></a1> med et JSON-skjema, og får <c3/>. <c4/> skriver også <c5/>. <c6/> bygger en signert pakke som knytter sammen scenarioets hash, hashen til de oppgitte betingelsene, mottakerloggens hash og scoren mot de oppgitte hendelsene, og avviser betingelser som ikke stemmer med skåringshendelsene. Gjennomgått eksempel med gps-sdr-sim som bare skriver en fil; avspilling er operatørens ansvar og automatiseres aldri. Python <c7/>, MCP <c8/>, plugin <c9/>.

seg-8bda4472d561 = <b>Standardpakker</b> (<c1/>, <c2/>): testprofilene i DHS Resilient PNT-rammeverket for nivå { "1" } til { "4" }, IMO MSC.1/Circ.1575 nøyaktighetsnivåer og integritetsevaluering, og ICAO Doc { "9849" } vedlegg F monitor, assess og mitigate, hver et sett scenarioer skåret mot terskler fastsatt før kjøringen, med compliance-report-radene de gir belegg for. Terskler som ikke ble nådd er registrert og festet: DHS L4-T1 og de fire IMO-nøyaktighetstestene. Selve Doc { "9849" } ble ikke lest (betalt); ICAO-pakken følger ICAOs egen presentasjon av RFI Mitigation Plan. <c3/> får en seksjon for standardpakker. Alt MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): AFS-I Gold- og AFS-Q Weil-koder for PRN { "1" } til { "210" }, signalene <c2/> og <c3/> i <c4/>, SB1 BCH-koden, CRC-24Q og interleaver, og <c5/> (<c6/>, <c7/>, <c8/>), festet til LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januar { "2025" }). Kodene VALIDATED mot dokumentets trykte tabeller (som det merker TBC); én trykt tertiærkolonne (PRN { "147" }) er sannsynligvis en trykkfeil, og avviket er festet. LDPC-koding av underrammene { "2" } til { "4" } er ikke implementert.

seg-5a5720500b6d = <b>Kursnotatbøker</b> (<c1/>): jamming, spoofing, holdover, integritet, OSNMA og interferenskart, hver med øvelser.

seg-3d543433051c = <b>EU-US WG-C ARAIM Milestone { "3" }-studie av maksimal URA</b> (<c1/>, <c2/>), som erstatter den trukne planen "Table A-3"; MODELLED under oppgitte avvik.

seg-4f1f786e2658 = <b>Utkast som venter på eierens samtykke</b> under <c1/>: JOSS-artikkel, endring av TSC-charteret, prosess for register over uavhengige referanser og et forslag om å dele <c2/>. Ingenting der er vedtatt.

seg-49a758039871 = <b>Studio-visninger for funksjonene i { "0.38" }</b> (kshana.dev/studio/). Bridge-avspilling (to syntetiske kjøringer på én klokke: spor, tillitsscore, satellittene loggen hører og konklusjonen, med mottakerens egne flagg ved siden av Kshanas alarmer); Optical PNT (de to scenarioene <c1/>, med en valgfri frøstyrt realisering av <c2/>, MODELLED); Holdover-test (resultatet <c3/> målt mot ITU-T-maskene, tegnet fra resultatets egen <c4/>); en visning for interferensobservatoriet som åpner filene du har laget og ikke leverer noen; på Verktøy-siden en Jammertest-skårer, en IMU-tilpasning og MQTT som telemetriformat; og under Tillit en velger for loggformat (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) med en valgfri IMU-fil. Hver visning leser filer i nettleseren og laster ikke opp noe; hvert tall beholder etiketten registeret har for det, og hver bærer den veiledende erklæringen. Nettsiden <c6/> viser fragmentet <c7/>.

seg-91f6beb29f8e = <b>Sak #36: byte-eksakte festelag.</b> Byte-eksakte festelag kjøres bare på en vert som er erklært som grunnlinje (<c1/>, satt av <c2/>), ikke på hver Apple-silicon-Mac, fordi Apples matematikkbibliotek er forskjellig mellom macOS-utgivelser; det bærbare laget kjøres overalt, og <c3/> hindrer at et byte-eksakt lag igjen styres av plattform alene. Sammenligningene med de uavhengige referansene består selv på macOS. Ingen literal ble tatt på nytt og ingen toleranse endret. <c4/> og <a1><c5/></a1> forklarer hvordan en forskjell trieres; <c6/> er en manuell og ukentlig diagnostikk, ikke en port.

seg-15070f7dcc0a = <b>CodeQL: et uforankret mønster i Studios hjelpefunksjon trust-open</b> matcher nå hele headeren (<c1/>).

seg-56856063519f = <b>CI: diskplass på runneren.</b> Jobben <c1/> bygger dev- og test-profilene uten feilsøkingsinformasjon, så lenking fyller ikke lenger disken.

seg-38c59868835e = <b>Kildevakter.</b> Hver kildefil som inneholder testfixturer med fester, erklærer sitt festeomfang, og testene som skriver midlertidige filer bruker en unik sti per kall, så parallelle kjøringer ikke kan kollidere.

seg-884f693585fa = <b><c1/></b> er generert på nytt for det valgfrie feltet <c2/> i optical-atmosphere.

seg-e16d328f3967 = <b>JetBrains-plugin: ingen bruk av utdatert plattform-API eller API planlagt fjernet.</b> IntelliJ Plugin Verifier (<c1/>) mot IntelliJ IDEA build { "263" } ({ "2026.3" }: { "263.6800.24" } og { "263.7031.23" }) fant ett utdatert kall, <c2/>, i Insert Example; den åpner nå den nye filen med <c3/>. Pluginen er kompatibel med og ren på { "2024.3" } (since-build, uendret) og begge { "263" }-byggene. CI kjører nå <c4/> og feiler på kompatibilitetsproblemer og på all bruk av API som er planlagt fjernet.

seg-07ce053c906a = <b>Optisk PNT gjennom atmosfæren</b> (scenariotypen <c1/>, <a1><c2/></a1>, designnotat <c3/>). For en optisk lenke og et sett bakkesteder rapporterer den klarluftstapet som avhenger av bølgelengde og elevasjon, turbulenstilstanden etter Hufnagel-Valley (Rytov-varians, scintillasjonsindeks, gamma-gamma-fader, aperturmidling), tilgjengeligheten mot lenkemarginen ut fra et oppgitt skyklima, marginen som trengs for målrettede tilgjengeligheter og taket ingen margin løfter, fordelingen av avbruddsvarighet, tids- og avstandsfeilen per avbrudd gjennom klokkens holdover-modell, avstandskorrelert stedsdiversitet og hva-hvis-gevinster for en endret bølgelengde, en større apertur, scintillasjonsreduksjon med adaptiv optikk og ekstra margin. <c4/> får et atmosfærebevisst budsjett; uten ett er utdataene bit-identiske med { "0.36" } (terskel A5). To medfølgende scenarioer bærer ILLUSTRATIVE skyklimaer. MODELLED: tre registerrader. Tallbehandlingen når tersklene A1 til A6 forhåndsregistrert i <c5/> mot et uavhengig mpmath-program; det kontrollerer implementasjonen av de oppgitte formlene, ikke atmosfæren, og ingen målt tilgjengelighetsregistrering er sammenlignet, så ingen rad er VALIDATED. Terskelen A4 ble først ikke nådd, med { "3e-9" } fordi den normale CDF-en i bruk var en tilnærming på { "1.5e-7" }; CDF-en ble erstattet og terskelen latt stå som registrert. De innebygde byggene og WebAssembly-byggene returnerer byte-identiske dokumenter for begge medfølgende scenarioer (A7, kjørt på integrasjonscommitten for { "0.37.0" }).

seg-eb589aff44ad = <b>Deteksjons-ROC for IQ-monitorene</b> (PRO-32, <a1><c1/></a1>). En kampanje med monitorer beholder hver teststatistikks maksimum over vinduer rundt oppgitte hendelser (positive) og flislagte vinduer utenfor hendelsene (negative, <c2/>). Rapporten slår dem sammen per alarmtype til en ROC med dens AUC og driftspunktet ved den konfigurerte terskelen, som <c3/> og en rapportseksjon. På syntetiske kampanjer er kontrollen mot tilfeldighetsnivå nådd. AUC-terskelen for C/N0 ({ "0.95" }) er ikke nådd ({ "0.79" }), fordi de negative vinduene rett etter en hendelse arver CUSUM-ens avtakning fra deteksjonen; dette er registrert. MODELLED.

seg-d25a34e23f1a = <b>IQ-monitorer i kampanjen for labavspilling</b> (PRO-31, <a1><c1/></a1>). En valgfri tabell <c2/> i en kampanjefil kjører IQ-monitorene i kjørerens enkeltpass: effekt og spektral etter hver frontend-kjede, og C/N0, SQM og lås per sporet kanal. Alarmene skåres mot de oppgitte hendelsene: oppdaget eller uteblitt, tid til deteksjon og falske alarmer per eksponeringstime. Hver tests lukkede falskalarmtall er oppgitt, inkludert et nytt tosidig gaussisk tall for SQM-testene (<c3/>). Uten tabellen endres ingenting. På syntetiske kampanjer er terskelene for falske alarmer for effekt og SQM og for C/N0 nådd; { "18" } av { "18" } dempinger oppdages, men grensen for tid til deteksjon, under ett detektorsample av konstruksjon, er ikke nådd og er registrert. MODELLED; registerrad "IQ monitors scored in lab-replay campaigns".

seg-8eb0f650065e = <b>Laboratorietilpasning fra IQ-kampanjer, oppfølging</b> (<c1/>, CI-jobb <c2/>). Den tester de to hypotesene §{ "13.6" } i <c3/> lot stå åpne, mot terskler forhåndsregistrert i 1e532f84. Den legger til to syntetiske kampanjer: S, med en trinnvis J/S (frø 2026_1014), og R, en fersk rampe (frø 2026_1015). Resultatene står i <c4/>.

seg-ce60405d0005 = S1 nådd: med hvert J/S-nivå holdt, gjenvinnes <c1/> innenfor +{ "0.185" } dB. Rampekampanjenes feil på −{ "1.1" } dB er estimatorens etterslep.

seg-ea9f206c2999 = S2 ikke nådd, festet av en test som slår fast at terskelen ikke ble nådd: (d) slik den er skrevet på den trinnvise kampanjen holder for sporingssløyfemodellen ({ "0.45" } dB) men ikke for den empiriske ({ "6.42" } dB).

seg-fab0653558e4 = R1 nådd: på den ferske rampekampanjen er (d) med den tilpassede varigheten for bortfall, ganger hver hendelses rampehastighet lagt til, innenfor { "1" } dB for begge modeller.

seg-24c6725c2c7d = Avvikene i (a′) og (d) gjentas på R.

seg-7cbbce356973 = En kampanje kan nå oppgi sin J/S som en <c1/>-profil i testharnessen.

seg-34007ba58a9f = Ingen konklusjon i §{ "13" } endres, og registerraden forblir MODELLED.

seg-df2c3f2532d6 = <b>Begrenset FLL-innhenting, valgfri</b> (DS-LOOP-05): en ny sløyfeutformingsnøkkel <c1/> (s), Rust <c2/>. Under <c3/> tvinger den overleveringen fra FLL til PLL etter så lang tid, uansett PLI. Ikke satt som standard, og da utenfor utformingens hash; standardutformingen og dens hash er uendret.

seg-ae2794b2d3d5 = Kontrollert mot terskler forhåndsregistrert i 58789af0, på injisert referanse. Kontrollen er nådd: standarden overleverer aldri i { "9" } av { "10" } frø ved { "33" } dB-Hz.

seg-6d9483874b35 = Ikke nådd: med et tak på { "1.0" } s holder { "16" } av { "20" } kjøringer låsen ved { "33" } dB-Hz og { "8" } av { "20" } ved { "31" } dB-Hz; de andre går i sløyfe mellom tvungne overleveringer og FLL-ens retur. Fasejitteren er { "1.8" }× PLL alene ved { "33" } dB-Hz.

seg-deeefaf50e3e = Gulvet for innhenting på ~{ "35" } dB-Hz forblir standardens dokumenterte grense.

seg-780de73c01e1 = MODELLED; registerrad "Capped FLL pull-in below the default design's FLL-to-PLL hand-over floor (opt-in)".

seg-ace6b53749bd = <b>Akkvisisjonshysterese og frontend-kvantiseren i jamming-typen</b> (CAP-06c): to valgfrie seksjoner for et scenario av typen <c1/>.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, ved eller over sporingsterskelen) og <c3/> (s, standard { "0" }). En satellitt akkvireres ved eller over akkvisisjonsterskelen, når den har vært uakkvirert i forsinkelsen. Den holdes mens den er ved eller over sporingsterskelen. Utdata: <c4/> (sann/usann), <c5/> (antall) og <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> ({ "1" } til { "16" }) og <c3/> (MHz, standard dobbelt chiprate). Gir en blokk <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, trukket fra hver lenkes effektive C/N0) og <c8/>. Tapet er det for gaussisk inngang, merket som ikke gyldig for CW-, smalbånds- og feide jammere.

seg-0dad81736863 = Uten seksjonene er alle utdata byte-identiske.

seg-92007bfb6680 = Kontrollert mot terskler forhåndsregistrert i 70c72fcc. Kvantiseringstapet er innenfor { "0.0007" } dB av en uavhengig Monte Carlo, og AGC-avlesningen innenfor { "0.012" } dB av IQ-lagets AGC-sløyfe.

seg-973e451df99d = De registrerte hysteresekjøringene var uinformative (hver lenke tapt), så den terskelen er NOT MET. Et supplerende kjøringssett registrert ved { "37793290" } når den: hvert flagg er lik en uavhengig omberegning, og { "732" } av { "1824" } lenker viser hysteresen.

seg-912e9f1a4d5b = Funn: med en CW-jammer taper en 1-bits ADC omtrent { "5" } dB mer enn det gaussiske tallet.

seg-a19aee81b581 = MODELLED; registerrad "Acquisition hysteresis and the front-end quantiser in the jamming kind against independent recomputations".

seg-97f43a4fe71d = <b>Terrengskygge av jammeren i jamming-typen</b> (CAP-06b): en valgfri seksjon <c1/> i et scenario av typen <c2/> med en jammer. Felt:

seg-6d59a2857ab9 = <c1/>: en SRTM-rute i formatet <c2/>, relativt til arbeidsmappen;

seg-fa5b15500405 = <c1/>, <c2/> og <c3/> (grader): rutens størrelse og hjørne;

seg-09a35655f010 = <c1/> (m, standard { "0" }), <c2/> (standard 4/3) og <c3/> (m, standard { "30" }).

seg-ad58fe7ff627 = Motoren sampler den store sirkelens terrengprofil mellom jammer og mottaker og finner den dominerende knivseggen. Jammerens mottatte effekt, og dermed hver J/S, senkes med enkeltknivseggtapet i ITU-R P.526-15 §{ "4.1" }.

seg-001d7b88b26d = Resultatet får en blokk <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) og <c7/> (antall).

seg-b9696f5eda4b = Uten seksjonen er alle utdata byte-identiske.

seg-593b6a5b4480 = Kontrollert mot terskler og ti plasseringer forhåndsregistrert i 92cd2bfd, på den innsjekkede virkelige SRTM-ruten over Death Valley, mot en uavhengig numpy-omberegning. Alle nådd: verste forskjell { "1.6e-10" } på <c1/> og på tapet (terskel { "1e-9" }), tapet monotont i jammerhøyde, og tapet når J/S nøyaktig.

seg-62e07defd715 = MODELLED; registerrad "Terrain shadowing of the jammer in the jamming kind against an independent numpy recomputation on a real SRTM tile".

seg-378e9052e2c4 = <b>CRPA-antenneforsterkninger i jamming-typen</b> (CAP-06a): en valgfri seksjon <c1/> i et scenario av typen <c2/>. Felt: <c3/> (elementposisjoner i lokal øst-nord-opp, m), <c4/> (<c5/> eller <c6/>) og <c7/> (MVDR-støybåndbredde, MHz, standard dobbelt chiprate).

seg-ca39fefc0fb3 = Hver kanal danner en forvrengningsfri stråle mot sin satellitt. Lenkens støy skaleres med <c1/> og jammeren med <c2/> før den eksisterende anti-jam C/N0-ligningen.

seg-1f1ddc11ad94 = Hver lenke får en blokk <c1/>: <c2/> (dB) og <c3/> (dB).

seg-790ecc6a1bd4 = En ugyldig seksjon (en tom elementliste, en ukjent vekting, en ikke-positiv båndbredde) er en feil, gjennom <c1/> og <c2/> så vel som <c3/>.

seg-2464d9dde85f = Kontrollert mot terskler forhåndsregistrert i 08d83b4d. Nådd: additivitet (etter en rettelse: det første bygget la de nye enhetene til i enhetstabellen for hver jamming-kjøring); ett element er ingen gruppe; støyforsterkning og effektiv C/N0 mot en uavhengig numpy-omberegning innenfor { "1e-9" } dB; MVDR går mot nullet ved høy JNR.

seg-c04495f7a65a = Ikke nådd: MVDR-jammerforsterkningen på { "194" } av { "456" } lenker på { "0.36" } bærbar matematikk ({ "202" } på vertens matematikk; <c1/>) (verst { "1.7e-6" } dB). Residualene på −{ "100" } til −{ "188" } dB er under float64s oppløsning ved den terskelen, og numpy er uenig med seg selv i samme størrelsesorden.

seg-c10e1c72eb15 = MODELLED; registerrad "CRPA antenna gains in the jamming kind against an independent numpy recomputation".

seg-0a3adfa7271c = <b>IQ-sporingsmotor mot GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> og GNSS-SDR sporer de samme uavhengige numpy-opptakene av GPS L1 C/A ved { "30" } til { "45" } dB-Hz.

seg-cc73857e38e8 = Terskler forhåndsregistrert i 48edd4a5. Den registrerte kalibreringen sviktet på en feil overlevering i GNSS-SDR (F3), så endring { "1" } (1e4288c4) legger til en FLL bare for innhenting i begge mottakerne, sjekket inn før noe testopptak.

seg-1d651ff134f9 = Nådd: bærebølge- og kodejitter og Doppler stemmer innenfor { "5" } % ved hver C/N0.

seg-bc9c9a0247d1 = Ikke nådd: motorens NWPR C/N0 leser { "2.3" }–{ "7.1" } dB under GNSS-SDRs SNV (F4, en kjent grense for estimatoren; M2M4 er innenfor { "0.06" } dB av referansen); låseindikatorene avviker per definisjon (F5); én uenighet om slipp ved { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; registerrad "IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings".

seg-6ba057fab559 = <b>To VALIDATED rader for koder i IQ-laget</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Alle { "63" } primærkoder i B1I stemmer chip for chip med den uavhengige generatoren i GNSS-SDR { "v0.0.19" } (terskel forhåndsregistrert i 911106d1). Bare det programmets utdata er sjekket inn: B1I PRN-kodene den offentlige ICD-en definerer, som et prefiks og en hash.

seg-37437a09dd67 = <b>GPS L1C.</b> Alle { "126" } L1CP/L1CD-koder og { "63" } L1CO-overlegg stemmer med kontrollkolonnene IS-GPS-800J trykker, og den beregnede Legendre-sekvensen stemmer med dens tabell 6.2-1 (terskler forhåndsregistrert i fe372e26).

seg-f445784a7f2d = Rader: "BeiDou B1I primary ranging codes against an independent generator" og "GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns".

seg-001f48d86a3c = <b>GLONASS-, BeiDou- og Galileo E6-bånd i spektrummodellen</b> (CAP-12, signaler): nye bandnavn <c1/> og <c2/> (enhver FDMA-kanal som <c3/>, K = −{ "7" } til { "6" }), <c4/>, <c5/>, <c6/>, <c7/> og <c8/>. Hvert bærer sin ICD-bærebølge, modulasjon og minste mottatte effekt. De er valgfrie etter navn: standard båndsett og alle eksisterende utdata er uendret.

seg-158a6ec19d6b = Kontrollert mot terskler forhåndsregistrert i 5806f28b: ICD-verdiene, nullpunktene, B1C-sammensetningen og C/N0-banen er nådd.

seg-805092ae8ca2 = To terskler ble ikke nådd. Enhetsarealterskelen var uoppnåelig slik den var skrevet (F1). IQ-lagets B1I- og B1C-bølgeformer stemmer med modellen bare båndmidlet, på grunn av de ujevne linjespektrene i kodene deres (F2).

seg-db88f07d97bb = MODELLED; registerrad "Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)".

seg-b0147cf3acc8 = <b>Valgfri celle-midlende CFAR i IQ-akkvisisjon</b> (PRO-37): <c1/> og <c2/> avgjør på et akkvisisjonsrutenett ved å sammenligne hver celle med gjennomsnittet av referanseceller i sin Doppler-rad. Grensen kommer fra den lukkede formelen for CA-CFAR-falskalarmsannsynligheten for <c3/> ikke-koherente blokker (<c4/>, <c5/>), så beslutningen avhenger ikke av normaliseringen av sampleeffekt. Den er valgfri; standarddetektoren og alle eksisterende utdata er uendret.

seg-a56e74b1e091 = Kontrollert mot terskler forhåndsregistrert i 3724aefa: den lukkede formelen mot Monte Carlo ({ "18" } av { "18" } tilfeller), og en utformingsrate på { "1" } % målt til { "0.97" }–{ "1.01" } % på gaussisk og 2-bits kvantisert støy.

seg-f88fe97e0ee6 = Én terskel ble ikke nådd: på et støyfritt 2-bits signal overskrider { "1.28" } % av cellene utenfor toppen grensen, ved kodens korrelasjonssidelober (funn F1).

seg-8d88b626c31e = MODELLED; registerrad "Cell-averaging CFAR option in IQ acquisition".

seg-d596329195cf = <b>Scintillasjonsmodell mot målte data</b> (PRO-34): IQ-kanalens Cornell-scintillasjonsmodell ble sammenlignet med målt intensitet og fase for GPS L1 ved { "50" } Hz fra en ekvatorial scintillasjonsnatt (Zenodo-post { "16941224" }, INGV, Malindi, CC BY { "4.0" }), under terskler forhåndsregistrert i b6ccb499. Nådd: intensitetsfordelingen og fasescintillasjonen knyttet til S4. Ikke nådd: modellen fader { "2.4" } ganger så ofte under −{ "10" } dB og { "3.5" } ganger så lenge (funn F1). Den registrerte behandlingen leser modellens innpakkede fase (funn F2); faseresultatet holder med den utpakket. <c1/> henter dataene. Raden forblir MODELLED: "IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation".

seg-d6740cab2271 = <b>Rettet LuGRE-sampleleser</b> (MR-09): <c1/> leser en LuGRE IQ-batch med I i den høye nibblen og mid-rise-nivåene <c2/> (<c3/>), som fjerner middelverdien på −½ de rene toerkomplementheltallene har på I og Q. <c4/> gir GNSS-SDR den samme lesningen. Den generiske ION-leseren og alle eksisterende utdata er uendret: { "149" } scenarioresultater og en studie er byte-identiske før og etter, og de festede LuGRE-funnene leses som registrert (<c5/>). Ingen registerrad endres.

seg-5adf36c03c14 = <b>Valgfri sporing med BOC({ "1,1" })</b> (CAP-07 (a)): <c1/> skalerer DLL-diskriminatorene for hovedtoppen til sinus-BOC({ "1,1" }) og legger til en bump-jump-monitor (veldig tidlige og veldig sene korrelatorer ved ±{ "0.5" } chip, opp/ned-tellere, <c2/>) som flytter kode-NCO-en bort fra en sidetopp; <c3/> lister hoppene. Av som standard, og alle eksisterende utdata er uendret. Kontrollert mot terskler forhåndsregistrert i 6b68f6cc på et syntetisk BeiDou B1C-signal: en start på sidetoppen som uten valget blir stående { "0.55" } chip ved siden av, trekkes inn på hovedtoppen av ett hopp ved { "0.08" } s med valget, og ingen falske hopp ble sett fra hovedtoppen. Én terskel ble ikke nådd: enhetstestrutenettet for skaleringen rekker utenfor diskriminatorenes lineære område (funn F1 i <c4/>). MODELLED; registerrad "BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)".

seg-89345aa385f7 = <b>Laboratorietilpasning fra IQ-kampanjer</b> (B7.1, <a1><c1/></a1>). <c2/> i et labfit-scenario tilpasser en utdatamappe fra <c3/> på CLI-et (<c4/>), i Python (<c5/>) og i MCP-verktøyet labfit (bare mapper innenfor dets arbeidsmappe). Den tilpasser én enhet per signal, sløyfeutforming, frontend-kjede og jammertype:

seg-1726361b81c4 = C/N0-modellen mot oppgitt J/S, med sensurering;

seg-e1b8a27b06fd = sporingsterskelen, direkte og i lukket form;

seg-8dce89923619 = sporingssløyfemodellen og den empiriske låsemodellen, koblet gjennom C/N0-modellen, med deres varigheter;

seg-108646713c97 = en frøstyrt klyngebootstrap over opptak, prediksjonsintervaller på { "90" } % og tilbakeholdte datasett med ett opptak utelatt om gangen;

seg-ee5deb4d5d4b = en forhåndsregistrert tabell <c1/>, hashet, med PASS/FAIL per terskel.

seg-4d58263106af = Rapporten er <c1/> som JSON, CSV og Markdown, med en enhetsblokk. <b><c2/> kan ikke identifiseres fra C/N0-data</b> uten en uavhengig effektmåling. Den oppgis, tilpasses aldri, og den tilpassede parameteren er <c3/> (utformingsendring 2026-10-12). En ukjent jammertype tar den mest skadelige oppgitte <c4/> (cw, { "1" }). På syntetiske kampanjer fra Kshanas egne scener består terskelen (c) for dekning i tilbakeholdte datasett. Tersklene (a') og (b') for <c5/> ({ "0" } av { "50" } kampanjer dekket) og den lukkede terskelen for grense (d) er ikke nådd: de er registrert med sine verdier. MODELLED; registerrad "Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error". Stien for labfit fra mottakerlogg og dens utdata er uendret.

seg-308d19be658d = <b><c1/> på en JPL-kjerne</b> (CAP-31): <c2/> tar hvert legeme SPK-en inneholder (med de440s: Merkur, Venus, Jorden, Månen) fra kjernen, etikett <c3/>, og legger til en blokk <c4/> bare når den er satt. Ny rad, VALIDATED mot SPICE (forhåndsregistrert f8e946ea; verst { "3.3e-5" } m, { "1.0e-11" } m/s). Standardrapporten er uendret.

seg-fe16c24eae60 = <b>Porkchop på DE440-efemeriden</b> (CAP-20b): <c1/> sveiper C3 og ankomst-V∞ på heliosentriske tilstander fra en DE440 SPK. Ny rad, VALIDATED mot SPICE-tilstander

seg-a8632f3c86e9 = pykep { "3.0.1" } (forhåndsregistrert 2d857fb1; Jorden til Mars 2026-2028, { "304" } celler, verst { "2.6e-14" }, den samme cellen med minste C3).

seg-266cffab38a7 = <b>Ikke-gravitasjonell makromodell for LRO: NOT MET</b> (DS-LRO-10, forhåndsregistrert e82047e2). <c1/> (valgfri via <c2/>): direkte solstråling på flat plate med Månens skygge, et solsporende panel, og månens albedo og termisk IR; <c3/> er en merket generisk LRO-tilnærming fra publiserte fakta (ingen bussplater: platetabellen kunne ikke skaffes). På LRO-buen på { "4" } t lar den RMS for redusert dynamikk stå på { "6.668" } m og den dynamiske på { "11.94" } m, med en usannsynlig strålingsfaktor (omtrent +{ "21" } / −{ "22" }), så ingen av de tre tersklene er nådd. Funnet er festet av en test, og ingen standardutdata endres (<c4/>). Den valgfrie månekanonkule-SRP-en bruker nå Månens koniske skygge i stedet for Jordens (<c5/>).

seg-e4ed6e0e5048 = <b>Månebanebestemmelse: valgfri fast k2-tidevann og selenosentrisk relativitet</b> (DS-LRO-11), av som standard (<c1/>, <c2/>); en bryter <c3/> for ANISE-kryssjekken (DS-LRO-04); en fixture med LRO-bue på { "24" } t og en tilpasning av lang bue kun for informasjon (DS-LRO-09). Informasjonskjøringer er registrert i <c4/>; ingen publisert verdi endres.

seg-b065138adba8 = <b>CR3BP { "9" }:{ "2" } NRHO mot CAPSTONE</b> (CAP-29d): ny MODELLED rad som måler motorens sirkulære begrensede NRHO mot CAPSTONEs fløyne bane (JPL Horizons, mars { "2023" }; forhåndsregistrert { "4e868170" }): periode { "1.07" } %, apolun { "0.05" } %, perilun { "4.1" } % fra CAPSTONEs middelverdier, innenfor de registrerte tersklene på { "3" } / { "5" } / { "20" } %. En måling, ikke en validering.

seg-954bd2771180 = <b>CR3BP-roterende tilstander til Måne-sentrert ICRF</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> avbilder en dimensjonsløs roterende Jord-Måne-tilstand på den øyeblikkelige DE440 Jord-Måne-linjen, inkludert rammens rate ut av planet. Ny rad, VALIDATED mot en SPICE-ramme med to vektorer (forhåndsregistrert 2313eb1b, endret før noen kjøring d5ef79b3; { "72" } tilfeller, verst { "1.8e-7" } m og { "1.2e-9" } m/s).

seg-14599ab79300 = <b>CR3BP-familiemedlemmer mot JPL Three-Body Periodic Orbits API: NOT MET</b> (RM-35, forhåndsregistrert a9074f65). <c1/> (halo-, NRHO- og DRO-korreksjon, stabilitetsindeks for monodromi, pseudo-buelengde-fortsettelse) stemmer med { "54" } av { "58" } API-medlemmer på hver terskel (tilstand, periode og Jacobi innenfor { "1e-10" } overalt). Én stabilitetsindeks for L1-halo ({ "9.5e-2" }) og tre lukkinger av små DRO-er ({ "1.5e-8" } til { "3.3e-8" } mot { "1e-8" }) er ikke nådd, så modulen er <c2/>, og ingen rad hevder den. Resultater: <c3/>.

seg-0cd0e67a2e28 = <b>Valgfri DE440-orientering og -miljø for månen</b> (FUT-05, DS-LRO-08; standardene uendret): <c1/>, <c2/> / <c3/> (forankret i epoke, hovedaksene i DE440) og <c4/> (innebygd DE440 PA-orientering pluss geosentrisk Sol og Måne fra en SPK for DE440 levert av brukeren). Mot ANISE (forhåndsregistrert ea537710): orientering innenfor { "3.5e-7" } rad og LRO-tilpasninger innenfor { "1" } mm, men efemeridedelen nådde ikke terskelen sin (Sol { "30.7" } m, Måne { "1.1" } m, en tidsforskyvning på ~{ "1" } ms på ANISE-siden), så den er ikke en validert rad. Resultater: <c5/>.

seg-92cc171c69da = <b>Datum for månerammekampanje, tilstandsskalert NumPy-terskel: NOT MET</b> (forhåndsregistrert b887eb05; forblir MODELLED). Steg { "0" } utelukker pseudoinvers-reserveløsningen som årsak til gapet på { "0.30" } for estimerte stasjoner; NumPy stemmer innenfor terskelen på seks av åtte scenarioer, men stations_estimated når den ikke ({ "6.8e-6" } mot { "5.9e-7" }), og på den ferske datoen 2026-12-01 gjør et uobservert fyr ved sørpolen at fyrinformasjonen mangler rang, noe den uendrede uavhengige referansen ikke kan evaluere. Resultater: <c1/>.

seg-8d2f1e9708ff = <b>Månerammedatum fra en virkelig observasjonskampanje (analytisk Måne) VALIDATED</b> på ferske EDC-normalpunkter fra { "2025" } (forhåndsregistrert 31f5283 før noen ble hentet): den uendrede SPICE- og NumPy-referansen stemmer på bokføring, rang og null kobling, og innenfor { "1.11e-3" } på sigmaer (terskel { "1e-2" }), { "8.95e-4" } på tilstanden og { "1.79e-3" } på forholdene på tvers/langs (terskel { "2e-2" }). Kun en bibliotekkontroll av kovariansberegningen; tersklene skiller ikke mellom månemodeller. Resultater: <c1/>.

seg-058d7d490111 = <b>IAU-orientering og GM for de fjorten tilføyde legemene i solsystemet</b> utskilt fra raden "Physical constants of every solar-system body" til en VALIDATED rad (forhåndsregistrert 154bc54): <c1/> stemmer med SPICE <c2/> på pck00011 innenfor { "1e-9" } rad på { "574" } matriser ved de opprinnelige epokene og på { "574" } ved { "41" } ferske epoker aldri sammenlignet før (verst Phobos { "1.38e-10" } rad), og <c3/> er lik gm_de440 for alle fjorten legemer. Resten av den opprinnelige raden (J2, middelradius, rapporten) forblir MODELLED. Resultater: <c4/>.

seg-56c445aa8d9e = <b>Lambert med flere omløp</b> (<c1/>): hver løsning med opptil tre omløp, begge grener. Ny registerrad, VALIDATED mot pykep { "3.0.1" } (forhåndsregistrert a75de851; { "382" } tilfeller, { "1058" } løsninger, verste hastighetsforskjell { "1.6e-13" } mot { "1e-8" }). Den interne vakten for Kepler-landing fant én begrensning ved <c2/> på en bue med e = { "0.994" }; den er registrert i <c3/>.

seg-b62dc38b09e9 = Boks-vinge- og ECOM2-solstrålingstrykk (DS-PA-14), valgfritt.

seg-fd50e846d10e = <c1/>: en boks-vinge-modell med flate plater og Galileo FOC/IOV-tabellene fra GSC-satellittmetadataene, i nominell GNSS-yaw-styring, med strålingsfaktor og partielle deriverte per panel, og den empiriske ECOM2-modellen med sine partielle deriverte. Velges med <c2/> / <c3/> (feltene <c4/>, standard <c5/>: kanonkulestien og alle golden-filer er uendret); med et boks-vinge-sett er <c6/> dets strålingsfaktor. Sammenlignet med Orekit { "12.2" } under en forhåndsregistrering (<c7/>): alle terskler nådd, omtrent { "1e-15" } relativt; VALIDATED som en modellevaluering, mens prediksjonen av Galileo-SRP forblir MODELLED.

seg-fd7a7fe09705 = <b>SRP-skygge for en flattrykt Jord og solens randmørkning (FUT-09, RM-11).</b> Ny modul <c1/>: <c2/> (WGS-84 okkulterende ellipsoide), <c3/> (Eddington-loven) og <c4/>, valgt med <c5/> (standard: den eksisterende sfæriske koniske skyggen, uendret); <c6/>. Den flattrykte skyggen stemmer med Orekit { "12.2" }s lysforhold innenfor { "7.4e-9" } over { "2400" } geometrier (VALIDATED, <c7/>); randmørkning har ingen ekstern uavhengig referanse (MODELLED).

seg-f09d4b831dfe = NRLMSISE-00-termosfære (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: en port av <c2/> og <c3/> (brytere, moduser med daglig Ap og 3-timers ap-tabell) fra den C-versjonen i det offentlige domenet av NRL-Fortran. Den er bit-identisk med den C-porten og innenfor { "1.9e-6" } relativt av pymsis { "0.13.0" } (NRL-Fortran, enkel presisjon) på et rutenett med 720 punkter, og den gjengir de { "17" } publiserte testtilfellene (VALIDATED; <c4/>). Dette bekrefter porten, ikke modellens nøyaktighet mot målt tetthet.

seg-9e8e9018dbaf = Valgfritt nivå for NRLMSISE-00-tetthet i luftmotstand.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> og <c4/>. Den statiske eksponentialmodellen forblir standarden, bit for bit. Romvær er konstant per modell. VALIDATED på banenivå mot Orekit { "12.2" }s egen NRLMSISE-00-luftmotstand over { "24" } t (verst { "0.03" } m mot opptil { "142" } km luftmotstandsforskyvning; <c5/>).

seg-b1b2ac9ac91e = Valgfri DE440 Sol og Måne i Cowell-propagatoren (RM-33, FUT-10).

seg-4f323703b251 = <c1/> tar enhver <c2/> (for eksempel en DE440 <c3/>) for tredjelegeme- og SRP-leddene; den avviser en leverandør som ikke kan betjene epoken, teller reserveløsninger til den analytiske rekken og er av som standard. <c4/> beholder presisjon i to deler. Mot Orekit { "12.2" } på dens egen DE440-leser stemmer baner på { "24" } t til { "0.017" } m; den forhåndsregistrerte terskelen for posisjon av Sol/Måne ble ikke nådd ({ "6.4" } m / { "0.24" } m; SPICE viser det samme gapet), så MODELLED (<c5/>).

seg-6ac7f3f65b33 = Valgfritt atmosfærisk S1-tidevann (DS-PA-03).

seg-35da1ed0dc83 = <c1/> og <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 tabell { "1" } modell N1, grad { "2" }–{ "6" }), slått på med <c3/> på <c4/> og <c5/>; av som standard. MODELLED (koeffisientene kontrollert på nytt mot den publiserte tabellen; ingen ekstern uavhengig referanse for kraftens virkning).

seg-c62d816a93cf = Batch-banebestemmelse med avstandsrate og azimut/elevasjon med en elevasjonsmaske (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variasjonell STM med analytiske partielle deriverte for to-legeme + J2), <c5/>, <c6/>; <c7/>. Stien for bare avstand er uendret. Sammenlignet med batch minste kvadrater i Orekit { "12.2" } over { "8" } forhåndsregistrerte scenarioer: hver terskel nådd unntatt tilstandsoverensstemmelsen uten støy (≤ { "1" } cm), som ikke ble nådd på { "2" } av { "4" } scenarioer ved { "1.46" } og { "1.74" } cm med kshana innenfor { "1e-8" } m av referansen; registrert, MODELLED.

seg-223f1e39669f = Vekting etter SP3-nøyaktighet (DS-PA-06).

seg-b5560ff1c426 = <c1/> og <c2/> avbilder nøyaktighetskodene i header og per post til observasjonssigmaer; en SP3-vektet variant av Galileo-tilpasningen (Tier-2 3D RMS { "0.035" } m mot { "0.070" } m uvektet) er lagt til ved siden av de uendrede registrerte kjøringene. MODELLED.

seg-831d35c5f97e = <b>Dispatch-jobb for full bue for Swarm-A (DS-PA-08)</b> i <c1/>.

seg-cc5e8af7cb0d = Planetarisk gravitasjon fra PDS SHADR-tabeller (CAP-30, del av CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) leser Mars GMM-3 (d/o { "120" }) og GRAIL GL0660B (d/o { "660" }); <c3/> kobler til ethvert innlastet felt (standardene uendret). Utsnitt av grad 20 følger med (NASA PDS, offentlig domene; <c4/>); de fulle filene hentes av <c5/>. VALIDATED mot pyshtools { "4.14.1" } (innenfor { "4e-15" } av total gravitasjon ved d/o { "120" } over hele sfæren, { "5e-14" } ved d/o { "660" } for |lat| ≤ { "60" }°); koblingen til legemets ramme forblir MODELLED (hvert felts opprinnelige ramme er ikke den IAU-rammen som brukes).

seg-afb5fbf86ffc = Høygradsgravitasjon til grad { "2190" } (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (Holmes–Featherstone modifisert forover-kolonne, ingen underflyt, ingen polsingularitet), <c3/>, en strømmende ICGEM-laster <c4/> / <c5/> (kontroller av norm og maksimal grad, tidevannssystem registrert, tidsvariable ledd avvist) og <c6/> (full EGM2008, SHA-256 festet, ikke medfølgende; tester styrt av <c7/>). <c8/> velger den på den valgfrie <c9/>. Stemmer med Orekit { "12.2" } til { "7.3e-17" } m/s² gjennom grad { "2190" }, og en bane på { "24" } t med { "200" }×{ "200" } stemmer til { "0.13" } m. MODELLED: pyshtools nådde ikke den forhåndsregistrerte terskelen nær polen (sporet til pyshtools), og kontrollen av banens følsomhet for grad 70 ble ikke nådd ({ "0.73" } m < { "1" } m); begge er registrert i <c10/>.

seg-4ef4f74f21c1 = DOP853-integrator (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (tett utdata av 7. orden), <c4/>, <c5/>, med en stegvakt som feiler lukket; <c6/>, <c7/>, <c8/>. Standarddriveren er uendret. VALIDATED mot SciPy { "1.18.1" } <c9/>: enkeltsteg innenfor { "5.6e-15" }, sammenfallende stegsekvenser, sluttilstander innenfor { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Robust Kepler-løser (FUT-12).</b> Ny modul <c1/>: <c2/> (Markley { "1995" }-start, residual uten kansellering) for alle { "0" } ≤ e < { "1" }, pakket inn av <c3/>. VALIDATED mot røtter med 50 sifre fra mpmath til { "0.9" } ε·|E| opptil e = { "0.999999" } (<c4/>).

seg-5e82deb7c853 = Valgfri tesseral jordgravitasjon i Cowell-propagatoren (RM-09).

seg-e1a7ad42211e = <c1/> får <c2/> (<c3/>, <c4/>). Den evaluerer et <c5/> (medfølgende EGM2008 til grad/orden { "70" }, eller en hvilken som helst ICGEM <c6/>) i en jordfast ramme nådd gjennom jordrotasjonsvinkelen (<c7/>) eller CIO GCRS-til-ITRS-kjeden (<c8/>). Standard <c9/>: ingen eksisterende utdata endres. VALIDATED mot Orekit { "12.2" } Holmes–Featherstone over { "24" } t ({ "6" } tilfeller, verst { "0.036" } m), med tersklene forhåndsregistrert i <c10/>.

seg-957686bb351e = <b>Julianske datoer i to deler gjennom jordrotasjon på banestien</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> og <c6/>, <c7/>-omregninger mellom <c8/> og <c9/>, og en valgfri <c10/> for scenariet <c11/> (ECEF, bakkespor og stasjonsvisning; av som standard og uendret, og nøkkelen er utelatt fra scenarioets hash når den er av). Ny registerrad, VALIDATED mot pyerfa <c12/>/<c13/> (forhåndsregistrert b10475ee; { "40" } datoer: GMST bit-identisk, matrise innenfor { "2.7e-14" }, rotasjon over steg på { "1" } µs innenfor { "1.1e-14" } rad, der stien med enkelt <c14/> ikke når dem). Cowell-kraftmodellens epoke forblir enkelt <c15/>; grunnen står i dokumentasjonen.

seg-0680b1f4c98b = <b>EOP-prediksjon utover tabellen</b> (<c1/>, <c2/>): en valgfri forlengelse av en IERS-serie for jordorientering med LS+AR-prediktoren utstedt ved dens siste rad, slik at rammeargumentene for en senere epoke følger prognosen i stedet for å bli låst til den siste raden. Svar innenfor tabellen er bit-identiske (testet); serien låses fortsatt med mindre dette kalles. Prognosens nøyaktighet forblir det eksisterende LS+AR-funnet mot Bulletin A (MODELLED).

seg-a7d272a1ddd6 = <b>Celestiale poloffsets dX, dY på CIO-kjeden</b> (<c1/>), og direkte ERFA-vektorkontroller av <c2/>, <c3/> og den nye funksjonen. Ny registerrad, VALIDATED mot pyerfa (forhåndsregistrert 979c1e39; { "40" } epoker { "1950" }–{ "2100" }: presesjon og CIO bit-identiske, TEME→GCRS innenfor { "1.1e-10" } rad, den predikerte virkningen av to-leddsrekken for jevndøgnsligningen). Eksisterende funksjoner er uendret.

seg-20d19a2d65ec = <b>UTC før 1972 på tidsstien i to deler</b> (<c1/>, og <c2/>, <c3/> og <c4/> fra 1960-01-01): epoken med drivende rate ("gummisekund"), med SOFAs drifttabell, brøkdelssteg ved slutten av dagen og UTC-til-SI-skaleringen av dagsbrøken. Ny registerrad, VALIDATED mot pyerfa <c5/>/<c6/>/<c7/> (forhåndsregistrert 23c40661; { "117" } tidspunkter { "1960" }–{ "1971" }, verst { "2.9e-11" } s mot en terskel på { "1" } µs). Hvert resultat fra { "1972" } og senere er bit-identisk (sjekksum festet før endringen). Før { "1960" } er TAI − UTC { "0" }, som i SOFA. Den enkle <c8/>-versjonen <c9/> er uendret.

seg-3ff0d080d9e6 = <b>GLONASS-satellittklokke fra kringkastingen</b> (<c1/>): <c2/> fra RINEX-posten, ved et tidspunkt lest på satellittklokken (to fastpunktiterasjoner, RTKLIB-konvensjonen). De innleste <c3/> og <c4/> var tidligere ubrukt. Ny registerrad "GLONASS broadcast satellite clock and broadcast-orbit propagation", VALIDATED mot RTKLIB 2.4.2-p13 <c5/>/<c6/> (forhåndsregistrert e099c42a; { "292" } tilfeller på en virkelig kringkastingsfil fra { "2013" }: klokkeforskjell { "0" } s, verste posisjon { "1.1" } mm mot en terskel på { "1" } cm). Bibliotekfunksjon; ingen scenarioutdata endres. Ingen transformasjon fra PZ-90.11 til ITRF anvendes, og modulen sier det.

seg-71ae2ee163e0 = <b>PPP-tidsløsning mot IGS-stasjonsklokken</b> ({ "0.36" }, FUT-19): mottakerklokken i float-PPP-filteret på WTZR stemmer med den endelige kombinerte IGS-klokken for stasjonen til { "0.075" } ns (standardavvik) med en konstant forskyvning på −{ "0.66" } ns over de konvergerte to timene. Tersklene ble forhåndsregistrert i <c1/>. VALIDATED (ny registerrad). Ny fixture <c2/>, stasjonsklokkepostene i den endelige IGS-klokkefilen som allerede brukes for satellittklokkene.

seg-463ac67600b1 = <b>PPP-paritet med gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } ble kjørt på de samme WTZR-inndataene som et eget verktøy (Apache-2.0-kjerne; nedlastingens sjekksum kontrollert mot den publiserte listen), med kommandolinjen fra en prosedyreendring sjekket inn før kjøringen. På sin første registrerte kjøring stemmer Kshanas float-PPP og gLABs innenfor { "0.05" } m på { "240" } av { "240" } epoker og til { "5.0" } mm på den siste. SPP-terskelen ble ikke nådd (median { "1.187" } m mot { "0.50" } m) og er registrert som et funn: gLABs og RTKLIBs egne SPP-løsninger avviker fra hverandre med { "0.852" } m. Den registrerte regelen lar derfor begge verktøyenes deler stå som ikke nådd i sin helhet, mens PPP-paritet holder.

seg-158717c78c80 = <b>Lesing av RINEX { "4" }-navigasjon</b> ({ "0.36" }, WP-07, PRO-41): <c1/> leser RINEX 4.00-4.02 navigasjonsfiler (<c2/> GPS LNAV, Galileo I/NAV og F/NAV, BeiDou D1/D2, QZSS LNAV; andre poster hoppes over til neste postheader), og <c3/> tar valg. VALIDATED mot den samme dagens sammenslåtte IGS RINEX { "3" }-fil: hvert dekodet felt identisk og { "0" } m i posisjon. Lesing av RINEX 2/3 er uendret.

seg-57aa5c6ef4f8 = <b>Kringkastede posisjoner for BeiDou GEO</b> (valgfri): <c1/> og <c2/> (BDS ICD, −{ "5" } grader helning). <c3/> hopper fortsatt over GEO-er. MODELLED: den forhåndsregistrerte sammenligningen med en presis bane er datastyrt og ikke kjørt ennå.

seg-416f58111d1f = <b>RINEX { "4" }-observasjonsfiler</b>: en virkelig RINEX { "4.00" } MGEX-observasjonsfil leses i tester (MODELLED, formatkontroll).

seg-64b4664c0ff6 = <b>RTK med LAMBDA på virkelig RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, dobbeltdifferanser på kort grunnlinje av tofrekvent GPS-kode og -fase med et float-Kalman-filter og LAMBDA-fiksering av heltall (forholdstest). VALIDATED på IGS-stasjonene WTZR og WTZZ ({ "1.4" } m fra hverandre) mot deres ITRF2020-grunnlinje under forhåndsregistrerte terskler: fiksert ved hver epoke etter de første ti minuttene, grunnlinjefeil median { "4.5" } mm og 95-persentil { "5.5" } mm.

seg-69db4437ebbb = <b>RTKLIB-paritet for PPP på virkelige data</b> (RM-31): <c1/> og <c2/> med forhåndsregistrerte terskler. RTKLIB v2.4.2-p13 PPP på de samme WTZR-inndataene stemmer med Kshana innenfor { "5" } cm ved hver epoke i de to siste timene ({ "9.7" } mm på slutten) ved den tredje registreringen; de to første kjøringene, registrert som funn, hadde fast tidevann av og mottakerantennen i RTKLIBs basespor. Pariteterskelen for enkeltpunkt ble ikke nådd ({ "1.09" } m median mot { "0.5" } m). gLAB-delen er ikke kjørt (datastyrt).

seg-fb6e053a0a9d = <b>Navigasjonsmeldingskodere utover LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> koder GPS CNAV (meldingstypene { "10" }, { "11" }, { "30" }; CRC-24Q; kontinuerlig kode med rate 1/2 og K={ "7" }), Galileo I/NAV (ordtypene 1-5 i partalls-/oddetallssider nominelt; interleaver 30x8; synk <c2/>) og Galileo F/NAV (sidetypene 1-4; interleaver 61x8; synk <c3/>), med testdekodere. MODELLED: rundturer og kjente svar fra ICD-en; en forhåndsregistrert kontroll av at kringkastede Galileo-efemerider ligger på koderens LSB-rutenett holdt (verst { "3.6e-3" } LSB), men nådde ikke terskelen for antall satellitter ({ "15" } av { "20" }), registrert. Koderne er bibliotekfunksjoner; kobling til scenen er ikke en del av denne endringen.

seg-562f36eb18e6 = <b>IONEX-filleser</b> ({ "0.36" }, WP-07): <c1/> med <c2/>, <c3/>, <c4/>, <c5/> og <c6/>: en streng IONEX { "1.0" }-leser med faste kolonner, med epoker talt fra det første kartets dag, <c7/> lest som manglende, RMS-kart, og formatets nærmeste, påfølgende og roterte kart for tidsinterpolasjon; skrå TEC ved headerens skallhøyde. Kontrollert på et innsjekket syntetisk kart og, datastyrt (hentet ved testtid med en festet SHA-256, ikke medlevert), på et utsnitt av en virkelig CODE GIM: hver node eksakt; interpolasjonen stemmer med en formelreferanse til { "4e-13" } TECU. RTKLIBs <c8/> stemmer til { "3.6e-13" } TECU ved { "6885" } punkter (forhåndsregistrert B6). VALIDATED på datastyrt evidens (eierens beslutning, 2026-10-13): testen feiler på ethvert annet kart enn det SHA-festede.

seg-9fac2e8535c8 = <b>Hatch-bærebølgeutjevning</b> ({ "0.36" }, WP-07): <c1/> og <c2/>, den divergensfrie (ionosfærefrie) formen i den presise enkeltpunktsammenstillingen. MODELLED med et registrert funn: på IGS-stasjonen WTZR senker den medianen av enkeltpunktfeilen fra { "1.55" } m til { "1.12" } m og 95-persentilen fra { "3.47" } m til { "3.21" } m, under den forhåndsregistrerte reduksjonen på { "40" } % (den gjenværende feilen er biaslignende, ikke støy).

seg-7e4c7639d102 = <b>Float-PPP på virkelig RINEX</b> ({ "0.36" }, WP-07): <c1/>, et statisk float-filter for presis punktposisjonering på virkelig tofrekvent GPS-kode og -fase med endelige IGS-produkter (antenneforskyvninger og -variasjoner, fast jordtidevann, fase-wind-up, Shapiro-forsinkelse, estimert våt forsinkelse, deteksjon av syklusslipp), med <c2/>. VALIDATED på den tilbakeholdte IGS-stasjonen WTZR mot dens ITRF2020-koordinat under forhåndsregistrerte terskler: etter { "6" } t er feilen { "1.5" } mm horisontalt og { "2.9" } cm vertikalt, og hver epoke i de to siste timene er innenfor { "10" } cm.

seg-173aa308e3e8 = <b>Interpolasjon av SP3 presise klokker</b> ({ "0.36" }, WP-07): <c1/> og <c2/> interpolerer de tabulerte SP3-satellittklokkene lineært mellom de to omsluttende gyldige nodene (sentinellverdien for dårlig klokke hoppes over), og <c3/> mater dem til <c4/>, så den presise kjeden kan kjøres fra en SP3 alene. VALIDATED mot de endelige IGS-klokkene på { "30" } s fra 2025-02-24 under forhåndsregistrerte terskler: { "32" } GPS-satellitter, RMS i midtpunkt { "0.121" } ns (terskel { "0.15" } ns), 95-persentil { "0.265" } ns (terskel { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM ved siden av nøkkeltallene for klokkens holdover</b> (CAP-05b): en valgfri seksjon <c1/> på klokketypen rapporterer en egen blokk <c2/> (RAIM i øyeblikksbilde på en forhåndsinnstilt himmel fra et oppgitt sted: konklusjon per epoke og beskyttelsesnivåer, tilgjengelighet; utilgjengelig mens GNSS er nektet, aldri ekstrapolert). Holdover-tallene er uendret; uten seksjonen er utdataene byte-identiske. MODELLED.

seg-99d9a67fc2f3 = <b>Terskler for receiver-trust kalibrert på JammerTest { "2024" }</b> (CAP-13): en forhåndsregistrert kalibrering av monitorene for C/N0-fall, AGC og jamming-indikator på det offentlige JammerTest { "2024" }-datasettet (hentet ved kjøring, aldri medlevert; <c1/>), levert bare som den valgfrie <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Tilbakeholdt: terskelene for AGC, jamming-indikator og unionen består; terskelen for falske C/N0-alarmer feiler ({ "0.023" } mot { "0.02" }), så raden er MODELLED (<c3/>). Standardene og utdata uten profilen er uendret.

seg-8ccd18c54b4b = <b>ARAIM-feilhypoteser for flere satellitter</b> (CAP-05a): delmengderegelen i ADD v4.2 generalisert utover par (<c1/>, <c2/>; orden { "2" } er nøyaktig den eksisterende MAAST-kontrollerte stien) og en valgfri avansert RAIM over disse hypotesene (<c3/>), som rapporterer delmengden med størst separasjon når en feil oppdages. Prior som trenger dypere delmengder avvises, aldri avkortet. MODELLED.

seg-02f1f2d72263 = <b>Horisontlinje i receiver-trust</b> (FUT-01): en receiver-trust-økt kan oppgi en <c1/>; satellitter bak den går tapt for himmelen (<c2/>, <c3/>, <c4/>) og tapene klassifiseres som <c5/>, aldri <c6/>; uten en, er reserveløsningen med asimutgap og alle utdata som før. Generatoren for mannskapstrening får en hendelse <c7/> (en blokkert himmel, ikke interferens) og scenariet <c8/>. Monte Carlo for UERE x DOP får designnotatets to geometrier med maskert horisontlinje, forhåndsregistrert alene: alle { "26" } kontroller består.

seg-69fa2ecdc4e9 = <b>Verifisering av RFC { "3161" }-tidsstempel</b> (CAP-14): <c1/> kontrollerer et tidsstempeltokens signatur (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 og P-384), dets ESS-binding til signeringssertifikatet, signatørens bruk til timeStamping og kjeden til et pålitelig anker ved tokenets genTime, frakoblet; <c2/> anvender det på en pakkes <c3/> (valgfritt; uten det er rapporten uendret). VALIDATED, snevert: alle { "27" } selvgenererte tilfeller stemmer med OpenSSL { "3.0.13" } på konklusjonen og genTime, under en sammenligning forhåndsregistrert før verifisereren ble skrevet. Tilbakekalling kontrolleres ikke.

seg-1b7777e600a8 = <b>Verifikasjonsnivåer per tall for hver type</b> (RM-04): hver scenariotypes resultat ender nå med en blokk <c1/> som nevner dens hovedtall, raden i verifikasjonsmatrisen som eier hvert av dem og nivået lest fra den raden (tall ingen rad eier, listes som uten nivå). Blokken legges til etter kjøringen og fjernes igjen til forrige dokument byte for byte (<c2/>). <c3/> har ingen <c4/> før en ny datert prediksjon erstatter den frosne; <c5/>, <c6/>, <c7/> og <c8/> har ikke noe skalart hovedtall, og <c9/> skriver kompakt JSON. Kampanjemedlemmer beholder dokumentene sine uten nivå.

seg-54aec3e311cf = <b>Kvante-forhåndsinnstilling <c1/></b> (CAP-08c): et medfølgende treghetsscenario der en akselerometer med kaldatom-interferometer, spesifisert ut fra interferometerets fysikk (<c2/> med et oppgitt vibrasjonsnivå på plattformen), går på treghet mot et kvartsakselerometer av navigasjonsklasse gjennom et GNSS-bortfall på 110 minutter. MODELLED.

seg-21d2b7fd2a21 = <b>Greenhalls eksakte ekvivalente frihetsgrader</b> (CAP-03): <c1/>, den fullstendige algoritmen til Greenhall og Riley ({ "2003" }) (differanseordener { "1" } til { "3" }, støyeksponenter +{ "2" } til -4, overlappende og ikke-overlappende, modifisert og ikke-modifisert, med tabellene for store J), med omslag for ADEV, MDEV og HDEV. VALIDATED i en forhåndsregistrert sammenligning med allantools { "2024.6" }: { "4 876" } rutenettpunkter innenfor { "6.0e-13" } relativt; allantools feiler i { "32" } ytterligere punkter, som er registrert uten verdi fra en uavhengig referanse. Konfidensintervallene til <c2/> er uendret bit for bit.

seg-8e04ebc15045 = <b>Feilledd for kaldatom-interferometer</b> (RM-26/27/28): Raman-laserfasestøy (med forsinkelsesleddet fra retrorefleksjonen), bølgefrontkrumningens skjevhet for en termisk sky (ren defokusering, med en deteksjonsradius) og oppløsning av fringe-flertydighet (klassisk støttet og to avhørstider), som bibliotekfunksjoner i <c1/>, der hver lukkede form er kontrollert mot kvadratur eller Monte Carlo. MODELLED; foreløpig ikke tilgjengelig fra en scenariotype (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Klokkeloggformater</b> (RM-03): <c1/> leser RINEX-klokkefiler, ASCII-fase- eller frekvenslogger i TimeLab-stil og TAPR TICC-tellerlogger til én normalisert faseserie (tau0 oppgitt eller funnet, hull talt opp, en hullpolicy). Valgfritt: en telecom-timing-serie kan navngi en logg (<c2/>), og tabellen <c3/> i et klokkescenario legger til en blokk <c4/> (ADEV, TDEV, MTIE). Uten tabellen er begge typene byte-identiske (<a1><c5/></a1>). En forhåndsregistrert sammenligning på tre syntetiske logger nådde terskelene for fase og kobling; estimatorene stemmer med allantools innenfor { "2.5e-14" } overalt der den beregner, og den beregner ikke MTIE-punktet for hele opptaket (registrert). MODELLED.

seg-53369a5c3749 = <b>Wander-masker for frekvenssynkronisering</b> (RM-01): typen <c1/> får sju MTIE- og TDEV-masker for wander-generering ved konstant temperatur, ITU-T G.811 PRC, G.812 type I til III, G.8262 EEC alternativ { "1" } og { "2" } og G.8262.1 eEEC, med potenslovdelene tabellene angir, og referansescenarioet <c2/> (en frittgående OCXO mot EEC-maskene: den feiler ved { "1 000" } s, der en sløyfe må gjøre jobben). Hver rad er lest på nytt mot teksten på itu.int; G.812 (06/2004) er erstattet av en forhåndspublisert utgave fra 08/2026 som ikke kunne leses. MODELLED (en transkripsjon); eksisterende masker og utdata er uendret.

seg-5e84b35ee4e7 = <b>Veiledning for filterprior for typen <c1/></b> ({ "0.36" }, WP-09, funn fra RM-21): pakkens standard filterprior passer for en IMU i taktisk klasse. Med en IMU i navigasjonsklasse kan standardverdien gjøre den fusjonerte treghetsgangen dårligere enn fri INS: { "52" } m mot { "11" } m på en flyprofil på { "70" } m/s. Sett <c2/> slik at den passer til sensorens klasse, slik de nye maritime, jernbane- og luftfartspakkene gjør. Ingen medfølgende scenarioer kombinerer en IMU i navigasjonsklasse med standardprioren: alle som bruker standardverdien har restskjevheter i akselerometeret på minst { "0.015" } m/s². Kun dokumentasjon; ingen utdata endres.

seg-f74b3c265f3a = <b>Testbenk-eksport kontrollert med en simulators egne lesere</b> ({ "0.36" }, WP-09, CAP-16): bevegelsesfilene fra <c1/> for { "8" } medfølgende scenarioer ble lest tilbake av gps-sdr-sims lesere for NMEA, breddegrad/lengdegrad/høyde og jordfast bevegelse (MIT, commit 28ca29a6, brukt som et eget verktøy via <c2/>; ingen signalfunksjon kalles). De gir den eksporterte banen tilbake til { "1.2" } mm, { "0.15" } mm og nøyaktig. FUNN: simulatorens jordfaste leser kan ikke ta CSV-en i full bredde, fordi linjebufferen på 100 tegn deler hver rad. <c3/> angir nå kolonneskillene som skal brukes og simulatorens tak på { "300" } s. VALIDATED (ny registerrad); eksportens bytes er uendret.

seg-e77e1ac87dd5 = <b>GNSS/INS på KF-GINS-datasettet</b> ({ "0.36" }, WP-09, FUT-17): innlastere og kjører for <c1/> og lever-arm-målemodellen i det lukkede EKF-et. På KF-GINS-demodatasettet (hentet ved testtidspunktet, ikke medfølgende) er Kshanas horisontale RMS mot referansebanen { "1.09" } cm mot KF-GINS' egne { "1.11" } cm, og alle forhåndsregistrerte terskler holdt. VALIDATED på datastyrt evidens (eierbeslutning, 2026-10-13): datasettet hentes med SHA-256-festing og reproduksjonsveien står i <c2/>.

seg-4d5a503c5c9c = <b>Koblet PNT-filter i fusjonspakken</b> ({ "0.36" }, WP-09, FUT-16): typen <c1/> tar en valgfri tabell <c2/> som kjører ett stablet filter på pseudoavstander med en akselerometer-skjevhetstilstand (<c3/>), og <c4/> er 3D-versjonen med 8 tilstander. Nytt medfølgende scenario <c5/>: med skjeve akselerometre holder den koblede modusen kvantesuitens posisjon til { "18.7" } m (95-persentil) med full integritet, der de frakoblede filtrene når { "430" } m. Uten tabellen er både <c6/> og <c7/> uendret (festet); <c8/> avviser tabellen. MODELLED.

seg-b7f07e3693df = <b>GNSS/INS-pakker for maritim bruk, jernbane og luftfart</b> ({ "0.36" }, WP-09, RM-21): medfølgende scenarioer <c1/>, <c2/> og <c3/> på banebiblioteket, og en valgfri tabell <c4/> for typen <c5/> som fusjonerer pseudoavstander fra en SGP4 Walker-konstellasjon (alle satellitter når den er nominell, de få høyeste når den er degradert). På jernbanepakken holder tett kobling løsningen i navigasjonsklasse på { "5.3" } m gjennom et skjæring og en tunnel, mot { "12.9" } m ved løs kobling. Uten <c6/> er pakken uendret (festet). MODELLED.

seg-0daf8b2646ad = <b>Tett kobling med bærebølgefase</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, et EKF med feiltilstander og en eksplisitt mottakerklokke med 2 tilstander og flyttall-flertydigheter for bærebølgen, drevet av en SGP4 Walker-konstellasjon med Klobuchar- og Saastamoinen-korreksjoner i målesløyfen, slipp-deteksjon med tidsdifferensiert bærebølge og reinitialisering av flertydigheter, og en kjøring med kun kode på de samme målingene til sammenligning. MODELLED: på en kjøring i figur 8-bane er bærebølgeløsningen { "2.5" } cm mot { "47" } cm med kun kode, og NIS/NEES er konsistente over seeder.

seg-7032646c0bc4 = <b>GNSS/INS-banebibliotek</b> ({ "0.36" }, WP-09, RM-24): typen <c1/> tar en valgfri tabell <c2/> med <c3/>. Profilene styrer Euler-rater og akselerasjon langs banen ut fra referansetilstanden og utleder den sanne IMU-en fra stivlegemekinematikk (koordinerte svinger, stigning, Coriolis); <c4/> importerer en referansebane (<c5/>) og løser den IMU-en som gjengir den. Uten tabellen flyr pakken sin historiske kjøring, bit for bit (festet). MODELLED.

seg-e6b31bf61185 = <b>DEM-fliser med breddegrad/lengdegrad for månens horisont</b>: <c1/> leser en tekstflis <c2/> (høyder over middelkulen på et rutenett av breddegrad/lengdegrad) i stedet for den polare stereografiske <c3/>, både for <c4/> og <c5/>; rapporten gjengir flisen (<c6/>, med dens SHA-256). <c7/> er nå koblet inn i horisontens strålemarsj. En flis resamplet fra det medfølgende utsnittet gir stasjonen utsnittets horisont til { "0.22" } grader. MODELLED.

seg-0c7ebb6c7d0d = <b>Terreng ved eksportstedet for tjenestevolumet</b>: med en seksjon <c1/> får hver rad i geometrieksporten per satellitt for <c2/> feltet <c3/> (satellitten er over den flate masken og eksportstedets horisont i sin asimut), rapporten inneholder stedets horisont (<c4/>), og kjøretids-CSV-en får kolonnen. Uten terreng er eksporten uendret. MODELLED.

seg-7c8789777c26 = <b>Hovedfelt fra motoren</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> og WebAssembly-funksjonen <c3/> oppgir, for tolv typer, hvilke felt i et scenario som svarer på spørsmålet det stiller, de beste først, som stier med punktum (<c4/>). Studio leser dem foran sin egen rangering. Kun visningsmetadata: motoren leser dem aldri, ingen scenariofil trenger dem, og ingen resultat avhenger av dem. <c5/> feiler hvis en type ikke kan dispatches eller en sti ikke finnes i noen av typens medfølgende scenarioer (den fanget to stier som Studios flatede id-er hadde skrevet uten array-klammene).

seg-7528700924b2 = <b>Tabell fra type til modul fra motoren</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> og WebAssembly-funksjonen <c3/> gir, for hver scenariotype hvis rader i verifikasjonsmatrisen nevner en annen modul enn sin egen, modulnavnene. Studios funksjonskart brukte sin egen håndskrevne kopi; <c4/> feiler hvis en type i tabellen ikke kan dispatches eller en modul ikke finnes i noen matriserad. Ingen utdata endret.

seg-af7d28b7fb0e = <b>Kort IQ-kjøring i nettleserbygget</b> ({ "0.36" }): <c1/> og <c2/> i WebAssembly-modulen bygger en syntetisk scene, fanger hver satellitt og sporer de fangede, alt i minnet, begrenset til { "0.25" } s, { "1 000 000" } sampler og { "8" } satellitter. Scenebyggeren og navneoppslaget for signaler er flyttet ut av den rent native <c3/> (til <c4/> og <c5/>) slik at begge byggene deler dem; kommandolinjens utdata er uendret. Den native testen og <c6/> sammenligner den samme forespørselen mot én fasit (<c7/>), byte for byte: siden endringen til portabel matematikk (STUDIO-15, nedenfor) gir nettleserbygget og det native bygget de samme bitene.

seg-c0eab9b97b7d = <b>Typede API-er for Python og TypeScript</b> (CAP-34): <c1/> typer de lukkede vokabularene (<c2/>, hvert typenavn; <c3/>; <c4/>) og ordbøkene <c5/> og <c6/>; <c7/> og <c8/> returnerer dem. WebAssembly-pakken legger til <c9/> (én kjøring som et typet <c10/>-objekt med det tolkede dokumentet som <c11/>) og <c12/> (de tolkede <c13/>), og dens <c14/> har det samme vokabularet; <c15/> er typet <c16/>. <c17/> holder begge listene lik motorens.

seg-b097c2f105c3 = <b>Enheter for hver <c1/>-kolonne</b> (FUT-28): et <c2/>-resultat har nå <c3/> og <c4/>, enheten for hver sveipet nøkkel og hver registrerte metrikk, lest fra den sveipede pakkens egen enhetstabell. En akse kan deklarere <c5/> for en nøkkel som pakken ikke gjengir; en deklarert enhet som motsier pakkens avvises, og en enhet som ingen av dem oppgir er <c6/>, aldri gjettet. <c7/> og <c8/> er beskrevet, så hver av de { "76" } typene er nå fullt dekket av feltenhetsporten (tak for ikke-dekkede typer { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>NumPy-matriser fra <c1/></b> (FUT-26): Python-typen <c2/> får <c3/>, <c4/> og <c5/>, som returnerer <c6/>-objekter for en numerisk liste, de numeriske kolonnene i en liste av poster eller hver postserie i dokumentet. Hver matrise er lik <c7/> av de samme verdiene fra <c8/> (dtype og bits). NumPy importeres bare når en av dem kalles og står utenfor kjøretidskravene. Typet i <c9/> og kontrollert av stubtest.

seg-1c7a22dabad3 = <b>Kampanjeoptimerer</b> (CAP-32): den nye, valgfrie seksjonen <c2/> i typen <c1/> søker gjennom én til tre scenarionøkler innenfor oppgitte grenser etter den beste verdien av én metrikk: minimere, maksimere eller treffe et mål. Den søker uttømmende på et rutenett, eller med en deterministisk avgrenset Nelder–Mead-simpleks. Hver evaluering er en ekte kjøring av den navngitte typen og står i resultatets <c3/>. Eksempel: <c4/>. Tersklene ble forhåndsregistrert (<c5/>):

seg-f4e79236b6bf = Rosenbrock-funksjonen er nådd (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = en 1-D-målløsning i lukket form er nådd ({ "6e-15" } relativt);

seg-5ab478e03354 = rutenettet er bit-likt en uavhengig brute force;

seg-ea0a04c6e713 = simpleksen gjør det minst like godt som et rutenett på { "41" } × { "41" } på { "177" } kjøringer.

seg-161d8c5b55e8 = Terskelen for 1-D i runde { "1" } er registrert som NOT MET, fordi den forhåndsregistrerte boksen utelot løsningen. MODELLED; registerrad «Bounded optimisation of one metric over campaign parameters». Tilleggsfunksjon: kampanjer uten seksjonen er uendret.

seg-83d40a636fcb = <b>Kalibreringsensembler</b> (CAP-10): tre kontroller med ett seed, kjørt på nytt over { "200" } uavhengige seeder mot forhåndsregistrerte terskler, i <a1><c1/></a1> (generert av <c2/>; verdier per seed i <c3/>).

seg-b163e53e06e9 = Kampanjens Monte Carlo-bootstrapintervall på { "95" } % dekker det sanne gjennomsnittet i { "192" } av { "200" } ensembler, og dets kjikvadrat-kontroll består i { "196" }.

seg-022a7fbee13a = Persentiltoleransen med ett seed består i bare { "183" } av { "200" }: NOT MET, som forutsagt. Det er en terskel på om lag 2 sigma, registrert og ikke løsnet.

seg-096f36d21b02 = ADEV-kalibreringene for hvit FM består for hvert seed, med verste feil langt innenfor toleransen.

seg-369c7f2a115c = <b>Innebygde typer gjennom trait-en <c1/></b> (FUT-27, under arbeid): trait-en <c2/> (<c3/>, med en krok for nivå per størrelse og <c4/>), og de første typene flyttet over på den (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Utdata er uendret: et manifest for hele katalogen med SHA-256 for hver utdata er identisk før og etter (<c10/>).

seg-fd6e68ff5e5d = <b>Kontroll av at lekeplassen ikke henter noe</b> (RM-07): <c1/> kontrollerer tre ting:

seg-3e424188f6e1 = hvert Studio-bibliotekscenario finnes i nettleserpakken;

seg-2803ccf8b9ae = pakken er byte-identisk med <c1/>;

seg-b98016a4a844 = hvert nettleserscenario kjører fra en tom arbeidsmappe.

seg-efc143b4f2a9 = <b>Alt-PNT-kart: ekte tyngdefelt, Monte Carlo av kartfeil, SRTM i full oppløsning</b> ({ "0.36" }, WP-10). Typen <c1/> tar en valgfri <c2/>: en tyngdeanomali syntetisert fra de medfølgende EGM2008-koeffisientene (eller en ICGEM-fil <c3/> via <c4/>, bare i native bygg). Denne syntesen stemmer med ICGEM Calculation Service til omtrent { "1e-8" } mGal over { "794" } noder i to regioner, mot forhåndsregistrerte terskler på { "0.005" } mGal RMS og { "0.02" } mGal maks (VALIDATED; registerrad «Gravity-anomaly synthesis from a spherical-harmonic model»). Det nye medfølgende scenarioet <c5/> kjører 60-minutters benchmarken på dette ekte feltet av grad 70. Forhåndsregistrert utfall: tilpasset feil { "3106" } m, så terskelen på < { "500" } m er NOT MET, som forutsagt (grad { "70" } er for glatt), og tidoblingen av kuttet i driften er MET (MODELLED). En valgfri <c6/> kjører benchmarken på nytt over kartfeil med seed og gaussisk korrelasjon og rapporterer fordelingen av den tilpassede feilen (medfølgende scenario <c7/>). Utforskende og ikke forhåndsregistrert: med en kartfeil på { "2" } mGal korrelert over { "0.2" } grader (størrelsen matcherens egen sigma budsjetterer), holder { "1" } av { "20" } realiseringer seg innenfor { "500" } m (median { "2.9" } km, p95 { "14.7" } km), mot { "144" } m med et perfekt kart. Den syntetiske benchmarkens posisjonsbestemmelse under 500 m forutsetter at kartet er nøyaktig. Uten noen av valgene er dokumentet byte-identisk med tidligere utgivelser. <c8/> tar en valgfri <c9/> (<c10/>, <c11/>) som leser den magnetiske kanalen fra en CSV i EMAG2v3-format. EMAG2 er ikke medfølgende fordi vilkårene ikke er eksplisitte: <c12/> henter det med en festet SHA-256 og beskjærer en boks. Ingen navigasjonsutfall hevdes på det ekte EMAG2-rutenettet. Felles kartestimering (terreng-SLAM, RM-18): <c13/> flyr den sekvensielle terrengnavigatoren over et lagret kart som avviker fra referansen, enten ved å stole på det eller ved å estimere en korreksjon per celle med et Rao-Blackwellisert filter i FastSLAM-stil. Forhåndsregistrert mot SITAN med kjent kart på en korrelert kartfeil på { "15" } m over { "20" } seeder: en gjennomsnittlig gevinst på { "1.5" } %, bedre i { "10" } av { "20" }, så begge forbedringsterskler er NOT MET ({ "10" } % og { "12" } av { "20" }), uten skade på et perfekt kart (MET). En enkelt passering uten gjenbesøk lar ikke kartet læres (<c14/>, MODELLED). <c15/>-dokumenter er byte-identiske. Testene med ekte SRTM kjører nå i CI på to innsjekkede utsnitt i full oppløsning; alle forhåndsregistrerte terskler er nådd, med nærmeste node lik GDAL { "3.8.4" } i { "8" } av { "8" } punkter (<c16/>).

seg-aa7ac7a47111 = <b>Interoperabilitet, WP-08</b> ({ "0.36" }; hvert punkt forhåndsregistrert og sjekket inn alene før kjøringen mot sin uavhengige referanse, hvert et nytt VALIDATED registerrad unntatt telemetripunktet, som utvider en eksisterende rad):

seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 og OCM { "3.0" } (blokkene TRAJ, PHYS, COV, MAN, USER) skrevet og lest i KVN og NDM/XML, og en OMM i full presisjon fra et SGP4-elementsett (<c2/>); utdata fra <c3/> er uendret. Mot Orekit { "13.1.8" } begge veier: { "27" } av { "30" } Kshana-meldinger tolkes i Orekit, og Kshana leser hver melding skrevet av Orekit, verdier innenfor { "1e-14" } relativt og epoker innenfor { "1e-9" } s; fire funn festet (Orekit krever <c4/>, avviser <c5/> i XML-parametere definert av brukeren, skriver ikke <c6/> uten <c7/>, og leser relative OCM-epoker i TDB i SI-sekunder). Den eldre OMM-skriverens <c8/> avvises av Orekit (registrert). Rad «CCSDS Orbit Data Messages (OPM, OMM, OCM)».

seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 og APM { "2.0" } i KVN og XML mot Orekit { "13.1.8" }, alle terskler nådd; Orekits APM-skriver avviser et manøver uten <c3/> (festet). Rad «CCSDS Attitude Data Messages (AEM, APM)».

seg-bdfce382a98c = <b>SPICE SPK-eksport</b> (<c1/>): skriver og leser for SPK-typene { "9" } og { "13" } og OEM-til-SPK-eksport; mot CSPICE N0067 er kjernene byte-identiske med SPICEs og evalueres bit-identisk. Rad «SPICE SPK export (types { "9" } and { "13" })».

seg-ce217acb9fe7 = <b>SPICE SPK-typene { "3" } og { "21" }</b> (<c1/>): segmenter av type { "3" } (Chebyshev) og type { "21" } (utvidede differanselinjer) skrevet fra gitte poster og evaluert slik SPICE gjør det; mot CSPICE N0067 er kjernene byte-identiske med SPICEs og hver evaluering stemmer bit for bit begge veier. Rad «SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)».

seg-72b8edbc74dc = <b>Utvidelser av Space Packet</b> (<c1/>): sekundær header med tidskodene CUC/CDS, pakkefeilkontroll, segmentering og strømkontroller, mot ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } og CPython <c2/>, null avvik. Rad «CCSDS Space Packet secondary header, packet error control and segmentation».

seg-c5fcf933b656 = <b>Telemetriskjema { "1.3" } gjennom ekte forbrukere</b>: Prometheus-eksposisjonen og OTLP/HTTP-JSON fra en syntetisk strøm i skjema 1.3, inkludert geometriserien og etiketten <c1/>, lest nøyaktig av prometheus_client og OTLP-protoen, akseptert av promtool { "3.5.0" } <c2/> uten lint-problemer, og sendt uendret gjennom OpenTelemetry Collector contrib { "0.135.0" } (datastyrt: verktøy hentet med festet SHA-256, utdata sjekket inn).

seg-013344665417 = <b>Banebestemmelse for Mars, kjøring { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skalerer normalmatrisen med diagonalen og demper steget (Levenberg-Marquardt), etter at den registrerte Gauss-Newton-tilpasningen feilet på en matrise der den rå diagonalen spenner over åtte størrelsesordener. Registrert separat (<c2/>, samme bue, terskler og redigering). På de scorede MRO-passeringene ligger banen innenfor { "0.36" } km RMS ({ "0.53" } km maksimum) av MROs navigasjonsrekonstruksjon, terskler nådd. Doppler etter tilpasning er { "48.6" } mHz mot terskelen på { "30" } mHz, ikke nådd (funn festet). En endring som bare gjelder scoring, R2-A1, er oppgitt i <c3/>. Raden forblir MODELLED.

seg-fee311480417 = <b>Rampet 2-veis Doppler-modell for Mars og banebestemmelse</b> ({ "0.36" }, WP-14, del av CAP-30, trinn { "2" }): <c1/> forutsier DSNs rampede 2-veis Doppler i X-bånd fra ODF-ramptabeller (lysgangtid, Shapiro, troposfære, stasjonstid, DSN-stasjoner via CIO-kjeden og IERS EOP) og tilpasser en Mars-orbiter (GMM-3, tredjelegemer, SRP, luftmotstand). <c2/> leser SPK-type { "1" } (kontrollert mot CSPICE) og <c3/> leser PDS SHADR-felt. Forhåndsregistrert mot MROs navigasjonsrekonstruksjon på ekte MRO-passeringer (datastyrt, <c4/>, månedlig CI): den forutsagte Doppleren stemmer med observasjonene til { "12.5" } mHz (terskel { "30" } mHz, nådd); den registrerte banetilpasningen feilet på den scorede buen og ga ingen bane (funn festet). Raden forblir MODELLED.

seg-d8212aa309ef = <b>Leser for DSN Orbit Data File</b> ({ "0.36" }, WP-14, del av CAP-30): <c1/> leser TRK-2-18 ODF-er. På en ekte ODF fra Mars Reconnaissance Orbiter (NASA PDS, medfølgende) stemmer leseren med PDS-etikettens antall poster, gruppeposisjoner, stasjoner og tider, og alle datatypene er kjent. Etikettens tabell for filslutt er én rad for kort i forhold til filen, en inkonsistens i etiketten registrert som funn. MODELLED. Banebestemmelse på disse dataene er ikke gjort ennå.

seg-bf26920a50bc = <b>TWSTFT-budsjett og stabilitet ved tidsoverføring: typen <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Toveisligning:

seg-c1fdd431db57 = <c1/> løser den for T_A − T_B med utstyrsforsinkelser i stasjonene, den ionosfæriske asymmetrien opp/ned i Ku-bånd, forskjellen i transponderforsinkelse og Sagnac-leddene, og gjenvinner direkte modellen til { "1e-15" } s.

seg-a5468765380d = <b>Usikkerhetsbudsjett:</b> kombinert kvadratisk, med lenkens TDEV som ledd av type A.

seg-7f365f91bb3e = <b>Lenkestøy:</b> toveisserien får et gulv av flicker-fasestøy, en døgnlig ikke-resiprositet og en konstant resiprositetsrest. Pakken <c1/> med hvit jitter er uendret.

seg-8b40e74db08c = <b>Ekte serier:</b> stabiliteten til oppgitte serier fra BIPM Circular T, <c1/>-CSV eller IGS stasjonsklokker.

seg-267fd20d823c = MODELLED. Nytt medfølgende scenario <c1/>. PPP-tidsløsningen er VALIDATED separat mot IGS-stasjonsklokken på grenen for GNSS-virkelighetsdata.

seg-ae33b92da4a6 = <b>Oppvarming ved innflyging, EO-radiometri og stigetap</b> ({ "0.36" }, WP-14, CAP-28): tre nye typer.

seg-34951878aa49 = <c1/>: en innflyging med 3 frihetsgrader og punktmasse over en roterende Jord eller Mars med oppvarming i stagnasjonspunktet etter Sutton-Graves.

seg-98fe7a4c464a = <c1/>: SNR for avbilder, MTF ved Nyquist, relativ kantrespons og GIQE { "4" } NIIRS.

seg-173dfbe3cc3e = <c1/>: en gravitasjonssving-oppstigning i flere trinn med tap fra tyngdekraft, luftmotstand, styring og mottrykk, kontrollert med den eksakte identiteten ideell dv minus tap.

seg-0c9e7aacec80 = Innflygingens maksimale retardasjon ble kontrollert mot den publiserte nominelle verdien for Stardust under en forhåndsregistrert terskel: { "35.44" } g mot { "33.4" } g (+{ "6.1" } %, terskel { "10" } %). Den raden er VALIDATED. Oppvarming, radiometri og oppstigning er MODELLED. Nytt er også: <c1/>, medfølgende scenarioer <c2/>, <c3/> og <c4/>, og <c5/>.

seg-d4648c4e6655 = <b>Holdningskontroll med reaksjonshjul: typen <c1/></b> ({ "0.36" }, WP-14, CAP-21). En treghetspekende sving av et stivt legeme med tre eller flere balanserte reaksjonshjul under MRP-tilbakekobling, med minimumsnorm hjulmomenter begrenset til hver motors grense (<c2/>). Den kan også lukke sløyfen på et multiplikativt EKF fra en simulert gyro og stjernekamera (<c3/>). Sløyfen med sann tilstand ble sammenlignet med Basilisk { "2.9.1" } på tre tilfeller forhåndsregistrert før koden fantes (tre ortogonale hjul, en pyramide med fire hjul, et mettende tilfelle). Hver MRP-komponent, kroppsrate, hjulhastighet og motormoment stemte ved hver sampling, verst { "2.4e-14" } i sigma og { "2.9e-11" } rad/s i hjulhastighet. Denne raden er VALIDATED; MEKF er MODELLED (NEES-konsistens). Nye medfølgende scenarioer <c4/> og <c5/>, og <c6/>.

seg-8ce699586340 = <b>Planlegging av bakkekontakt og DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): to nye scenariotyper. <c1/> gir, for én satellitt over én stasjon, Es/N0 for hver passering og MODCOD-en for DVB-S2 som velges langs den (terskler fra ETSI EN { "302" } 307-1 tabell { "13" } pluss en margin). Den gir også datavolumet ACM flytter mot grunnlinjen med konstant koding. <c2/> gjør det samme for flere satellitter over flere stasjoner og bygger en konfliktfri kontaktplan (antenneomstilling, én stasjon per satellitt, prioritetsvektet levering begrenset av hver kø). Den rapporterer en grådig plan med marginalverdi, en først-til-mølla-grunnlinje og det eksakte optimum på små mengder, med den grådige planens optimalitetsgap. Tilgangsvinduene kommer fra den VALIDATED prediktoren for tilsynelatende passeringer. Nye medfølgende scenarioer <c3/> og <c4/> (illustrerende inndata) og <c5/>. MODELLED (to nye registerrader).

seg-cd6dbcc3a78b = <b>Doppler-posisjonering med Starlink mot et publisert eksperiment</b> ({ "0.36" }, WP-14, del av CAP-11, MODELLED). Dette er en forhåndsregistrert proxy-sammenligning av Doppler-modusen i <c1/> med forhåndsinnstillingen <c2/> mot persentilene for datasett 3 i «Unveiling Starlink for PNT» (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Modellen brukte { "3" } satellitter (en maske på { "47" } grader valgt etter en fast regel), ingen høydestøtte og en Doppler-sigma på { "30" } Hz, over { "200" } seeder. Dens 3D-feil i 90-persentilen er { "92.2" } m ved { "20" } s og { "870" } m ved { "8" } s, mot de publiserte { "2" } m og { "10" } m, så begge terskler på faktor to er NOT MET. Modellen er pessimistisk, ikke optimistisk som forutsagt: tre faste satellitter gir langt mindre geometrisk variasjon enn eksperimentets { "63" } satellitter over { "10" } minutter med kanalbytte hvert { "15" } s. Begge bom er sikret med assert (<c3/>).

seg-ffeb1b66cda5 = <b>Optimerer for impulsive overføringer på DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> finner avgangs- og ankomstdatoene for en ballistisk overføring med to impulser og én omdreining som minimerer avgangs-C3 eller ankomst-V-uendelig innenfor type I eller type II. Den søker i et rutenett på 2 dager og forfiner deretter med 2D Nelder-Mead, på heliosentriske tilstander fra DE440-kjernen; den bygger på <c2/>. Sammenligningen ble forhåndsregistrert (bf0439e8) mot en uavhengig optimerer med SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } på mulighetsvinduet Jord til Mars i { "2026" }: alle fire optimaliseringer stemmer til { "8.7e-13" } relativt, med datoer innenfor { "1e-5" } døgn (VALIDATED, ny registerrad). Som sekundær publisert referanse stemmer NASA/TM-2010-216764 (håndboken for Jord til Mars 2026-2045) for minimum C3 av type II ({ "9.182" } mot { "9.144" }) og minimum ankomst-V-uendelig av type II ({ "2.564" } mot { "2.565" }). Minimum C3 av type I stemmer ikke: { "10.535" } mot { "11.11" } (-5.18 %), der bibliotekets uavhengige referanse stemmer med Kshana. Det bommet er registrert og sikret med assert.

seg-91fe2e2625a1 = <b>Studie av månens referansestasjon</b> ({ "0.36" }, foranlediget av publisert materiale om en planlagt referansestasjon ved månens sørpol; kilder i <a1><c1/></a1>): typen <c2/>, en Monte Carlo-sveip av månens differensielle PNT-modell over et brukerrutenett ved sørpolen og et døgn med epoker, som gir per punkt og over regionen persentilene for korrigert og ukorrigert feil, tilgjengelighet med årsaker, dekning mot en oppgitt terskel, beskyttelsesnivåer, dekningsradius per asimut og budsjettet for korreksjonslenken. Den reduseres nøyaktig til <c3/> ved ett punkt, én epoke og ett forsøk; aritmetikken ble regnet om med numpy under en forhåndsregistrert terskel (posisjoner og persentiler nådd; stasjonskorreksjonene bommet på sin på grunn av avrunding i dobbel presisjon, registrert). MODELLED; registerrad «Lunar reference-station coverage and accuracy map». Ikke tilknyttet eller støttet av noe byrå; ingen påstand om ytelsen til noe ekte system.

seg-3d0cd9692787 = <b>Forhåndsregistrert prediksjon: dekning fra månens referansestasjon</b> (ikke en validering; MODELLED). <a1><c1/></a1> fryser, ved commit c05dac1d, resultatene fra <c2/> under de offentlig oppgitte forutsetningene, med SHA-256-hasher av inndata og resultater og en scoringsprotokoll fastsatt nå (faktor { "2" } for nøyaktigheter og beskyttelsesnivåer, { "10" } prosentpoeng for tilgjengelighet og dekning; en endret forutsetning får en ny datert prediksjon, aldri en redigering; et bom publiseres like tydelig som et treff). Hvert tall domineres av elementsettet til konstellasjonen med fire satellitter, som ikke er publisert og er ILLUSTRATIVE, og sier det. <c3/> vokter den; <c4/> får en seksjon «Pre-registered predictions». Ingen registerrad.

seg-00ec7ccd4d0d = <b>Utvidelser for månens referansestasjon</b> ({ "0.36" }; stasjonsstudiens begrensninger { "2" } og { "3" } og kildenes løsningsstil), hver valgfri på <c1/> og fraværende som standard, slik at alle eksisterende dokumenter, den frosne prediksjonen medregnet, er uendret: <c2/> (flerveisfeil <c3/> hos brukeren og stasjonen, stasjonens valgfritt Gauss-Markov over epoker, DLL-kodestøy fra C/N0, biaser mellom kanaler; verdiene er ILLUSTRATIVE på Månen); <c4/> (lineær vekst av den kringkastede banefeilen over korreksjonsforsinkelsen, ILLUSTRATIVE); <c5/> (høydebegrensning, et minimum på tre satellitter med den, et vindu for statisk bruker over epoker). To tillegg til sammenligningen med publiserte påstander, hvert forhåndsregistrert alene før sin kjøring, står ved siden av den uredigerte registrerte kjøringen: K5 med vekst feiler ved alle rater; med kildenes løsningsstil feiler K1 til K5 og K6 består ({ "1" } av { "6" }), der R300 korrigert p95 3D-feil faller fra { "280.6" } m til { "2.11" } m. MODELLED; tre registerrader.

seg-1d0a0dcd42de = <b>Horisontmasker for månens terreng</b> ({ "0.36" }; den første begrensningen i studien av månens referansestasjon): en valgfri seksjon <c1/> på <c2/> (stasjonen og hvert brukerpunkt) og <c3/> (hvert rutenettpunkt) gir hvert sted en asimutavhengig horisont i tabellformatet for skyline fra { "0.36" }, fra en oppgitt profil merket med sin kilde (<c4/>, <c5/>) og/eller en strålemarsj over en polar DEM (<c6/>) langs storsirkler på månekulen med eksakt krumning. Inkluderer et utsnitt på { "0.98" } MB av den offentlig tilgjengelige polare LRO LOLA-DEM-en <c7/> ved sørpolen, resamplet med blokkmiddel { "5" } x { "5" } til { "1200" } m (<c8/>, med sin NOTICE, SHA-256 og <c9/>), og scenarioet <c10/> som bare finnes i repoet. Kontrollert mot horisonter i lukket form (bar kule, krater i et platå, rasterisert kjegle); MODELLED, registerrad «Lunar terrain horizon masks from a stated profile or a polar DEM». Uten seksjonen er hvert dokument, enhetsblokken medregnet, byte-identisk.

seg-ca0c6ca7396a = <b>Geometribevisst tillit</b> (designnotat for geometri { "0.36" }, avsnitt { "4" }). Hver <c1/>-epoke, statisk eller fartøy, batch eller live, har sin satellittgeometri: <c2/>, <c3/> (årsaker <c4/>, <c5/>, <c6/>, og den informative <c7/>) eller <c8/> der loggen ikke gir noen satellittgeometri, med HDOP, PDOP, VDOP og de brukte satellittene. Den utledes fra elevasjonene og asimutene mottakeren rapporterer (NMEA GSV, UBX NAV-SAT) gjennom den eksisterende kjernen <c9/>, eller tas fra NMEA GSA. Hver epoke har også en etikett, <c10/>, <c11/> eller <c12/>, alltid rapportert og aldri scoret, og et notat med HDOP, PDOP, VDOP, antall satellitter og signaltap i ord. Et fartøys score får en monitor <c13/> som ikke trekker noe med mindre geometrien er dårlig (HDOP over { "4" }, PDOP over { "6" } eller færre enn { "5" } brukte satellitter), og deretter stiger gradvis til et tak på { "15" } poeng; geometri alene når høyst det degraderte båndet, aldri det ikke-pålitelige (ingen alarm). Hvert fradrag får en klasse, <c14/>, <c15/> eller <c16/>, slik at en dårlig himmel ikke leses som et angrep. <c17/> er <c18/> når satellittene som gikk tapt alle var under { "15" } grader ved sin siste rapport; et fradrag for dårlig geometri er <c19/> når HDOP som mottakeren oppgir avviker fra den oppgitte himmelen med mer enn max({ "1.0" }, { "25" } % av utledet HDOP), slik at en forfalsket dårlig himmel ikke kan kjøpe etiketten. En ny tabell <c20/> oppgir hver terskel med sin opprinnelse (HDOP { "4" }, PDOP { "6" }, minst { "5" } brukte, sigma_UERE { "1.5" } m, en HDOP-toleranse på max({ "1.0" }, { "25" } % av utledet HDOP) der { "25" } % er et representativt valg for mottakere med klokker per konstellasjon eller delmengdeløsninger, { "15" } grader; tallene fra IEC 61108-1 og GPS SPS slik de er sitert, som må kontrolleres mot standardenes tekst). Totalt signaltap merkes ikke som himmel: når satellitter i sikte ikke spores og DOP for satellittene i sikte er god (og de usporede ikke er begrenset til én halvdel av horisonten), har epoken <c21/> og geometrifradraget er <c22/>. En oppgitt HDOP eller PDOP på { "99" } eller mer, GGA-kvalitet { "0" } og GSA-modus { "1" } leses som ingen posisjonsbestemmelse, ikke som DOP. Taket (<c23/> { "15" }), rampens slutt (<c24/> { "1.5" }) og gulvet (<c25/>, som standard scorens <c26/>) står i <c27/>, det samme gjør etikettens gode nivåer (HDOP { "2" }, PDOP { "3" }, { "6" } satellitter, representativt); taket som gjelder er <c28/>, så en tabell <c29/> som hever <c30/> (også en på { "0.35" }) senker taket i stedet for å bli avvist, og et gulv under <c31/> avvises. MODELLED; veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-d976d3495695 = Geometrien når hver flate: resultat-JSON (<c1/>, <c2/> på hvert fradrag, <c3/>, <c4/>), live JSON-linjene (skjema { "1.3" }), Python- og WebAssembly-funksjonene <c5/>, <c6/> og <c7/>, MCP-verktøyene <c8/>, bevispakker (<c9/>, <c10/>, et geometrifelt på sammendragssiden) og <c11/> (Prometheus <c12/> og en etikett <c13/> på <c14/>, OTLP <c15/>, egne CEF-felt <c16/> (geometristatus og klasser), <c17/> (HDOP) og <c18/> (PDOP), kontrollert mot begge CEF-referanseparserne, og LEEF <c19/>, <c20/>, <c21/>). Geometrietiketten eksporteres også, lagt til etter alle tidligere serier og felt og bare for inndata som har den: Prometheus <c22/> og <c23/>, OTLP <c24/> og <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, og CEF et tredje felt <c30/> (etiketten) og <c31/> (brukte satellitter); VDOP finnes ikke i CEF (flyttallsfeltene er tatt). Begge CEF-referanseparserne leser etikettilfellene tilbake slik de ble skrevet (endring { "5" }: { "176" } linjer, { "172" } tolket av pycef, { "176" } av Logstash). En oppgitt HDOP som den oppgitte himmelen ikke forklarer, flagges på hver epoke og telles (<c32/>, en linje på bevissammendragssiden), og scores bare når geometrien er dårlig. Signaltap eksporteres for seg, siden geometristatusen forblir <c33/> mens det varer: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; i CEF vises det som klassen <c37/> i <c38/>.

seg-5030e5214ed0 = <c1/>: kovariansfaktoren <c2/> bak <c3/>, utskilt fra den med den samme aritmetikken.

seg-c6cc061a3ed6 = Registerrad «Position error from geometry: RMS error = sigma_UERE x DOP» (<b>MODELLED</b>, intern konsistens): en Monte Carlo med seed av motorens minstekvadraters posisjonsbestemmelse på de { "8" } DOP-geometriene som stemmer med gnss_lib_py, mot kovariansfaktoren til den validerte DOP-kjernen, med toleranser forhåndsregistrert før første kjøring og to negative kontroller som feiler slik de skal; ved siden av en tidligere kontroll på fire håndvalgte himler med kjikvadrat-konfidensintervaller, rapportert slik den ble kjørt, før forhåndsregistreringen.

seg-b87b6eafd465 = <b>Asimutavhengige skyline-masker</b> (<c1/>, <a1><c2/></a1>, punkt { "1" } i designnotatet): en elevasjonsgrense som avhenger av asimut, det punktvise maksimum av tabeller (hver interpolert for seg, brutt rundt ved { "360" }°), en gatekløft i lukket form (med valgfrie åpne ender), sektorer med skarpe kanter og en terrengprofil med Jordens krumning; den effektive grensen er <c3/>. Fire REPRESENTATIVE forhåndsinnstillinger med oppgitt opprinnelse (<c4/>, <c5/>, <c6/>, <c7/>), som kan overstyres felt for felt. En valgfri seksjon <c8/> i <c9/>, <c10/>, <c11/> (hver modus, polarsveipet medregnet), <c12/> og opplæringsfilene for <c13/>, og i <c14/> og <c15/> gjennom en ny bruker på bakkested, <c16/> (geodetiske sikteviklinger på den roterende Jorden, med den geodetiske oppretningen for ARAIMs horisontale og vertikale oppdeling; hver sampling er ett absolutt tidspunkt, <c17/>, som elementsett, kringkastede efemerider og SP3-filer føres frem til fra sine egne epoker, datert fra den nyeste satellittepoken når ingen <c18/> er oppgitt; en <c19/> i bane avviser en skyline). Resultater får <c20/> og <c21/> per sampling. Uten seksjonen er hvert scenario byte-identisk med { "0.35.0" }, kontrollert mot sjekksummer fra utgivelsescommitten. Seks medfølgende eksempler: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> og kampanjen <c27/> (bykløften for det autonome kjøretøyet som en flat grense og som en gate; den eksisterende kampanjen er uendret). MODELLED.

seg-95cdecf341d6 = <b>Funksjoner for himmelgeometri</b> (<c1/>, punkt { "2" } i designnotatet): <c2/> (synlige og maskerte satellitter fra et sted, et tidspunkt og konstellasjonsforhåndsinnstillinger, to-linjers elementsett (<c3/>, høyst { "4" } MiB, propagert av motorens SGP4 til en UTC-<c4/>) eller gitte satellitter; <c5/> og <c6/> sier om himmelen er representativ eller den himmelen elementsettene gir ved den epoken, ikke en måling; <c7/> lister hver ubrukte linje med årsak; grenser for inndata på { "2000" } satellitter over horisonten, kontrollert før en systemtabell bygges, og { "16" } mottakerklokker; de fem DOP-ene; ENU-kofaktoren og kovariansen med én klokke per system eller én felles; den horisontale feilellipsen ved én sigma og ved en oppgitt konfidens), <c8/> (minstekvadratfeil med seed, høyst { "5000" }), <c9/>, <c10/> og <c11/>. <c12/> eksponerer kovariansen bak <c13/>, som nå er dens reduksjon (de validerte skalarene er uendret). Flater: <c14/> og <c15/>, Python- og WASM-funksjoner med de samme navnene, og MCP-verktøyet <c16/> ({ "40" } verktøy), og notatboken <c17/> (med speilet <c18/>; kjørt av <c19/>). Hvert resultat har etiketten MODELLED, erklæringen om feilmodellen og den veiledende merknaden.

seg-9414d387cf79 = Register: fem rader for skyline og himmelgeometri. <b>VALIDATED</b>, hver i en sammenligning forhåndsregistrert før den uavhengige referansen ble kjørt: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> mot Orekit { "12.2" } (<c1/>, <c2/>) og gnss_lib_py { "1.0.4" } (<c3/>), verste avvik i sikteviklinger og masker { "1.1e-12" }° mot { "1e-9" }°, identiske synlige mengder, DOP { "3.3e-13" } relativt (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> mot numpy <c5/> og <c6/> (standard P2), { "270" } tilfeller, akser { "5.1e-13" } relativt (<c7/>). <b>MODELLED</b>: reduksjonene for kløft, sektor og terreng; forhåndsinnstillingene; sammensetningen av himmelgeometri (forhåndsinnstilt himmel, Monte Carlo-sky).

seg-8f5ebce999fe = Med radene for geometritillit, skyline og månens referansestasjon har registeret { "274" } rader: { "134" } validert, { "136" } modellert, { "4" } partner.

seg-686b1211d7bb = <b>Månens referansestasjon: laboratorium for stasjonstid</b> (<b>MODELLED</b>). En valgfri blokk <c1/> på <c2/> (<c3/>). Den modellerer en stasjonsklokke (som standard klassen miniRAFS, en hvilken som helst navngitt klasse, eller et enhetskort tilpasset oppgitte stabilitetspunkter) styrt mot LTC, deretter frittgående eller styrt på nytt hvert N sekund. Den gir tidsfeilkurven x(t), tiden til { "1" }, { "10" } og { "100" } ns (halvering ved siden av den lukkede formen) og det dominerende leddet per horisont, alt med enheter. Styringsresten er ILLUSTRATIVE. LTC-raten utledes ikke på nytt og beholder sin egen VALIDATED rad. Nanosekundmålet i det offentlige ICG WG-B-materialet om Lunar PNT (juni { "2024" }) er sitert som en kildeerklæring, ikke en påstand. Klokkerekkefølgen optisk < PHM < RAFS < miniRAFS holder fra { "1" } s til { "7e5" } s, og testen fester krysningen mellom PHM- og RAFS-kurvene nær { "7.5e5" } s. Denne krysningen er en egenskap ved klokkemodeller med én støytype (ren flicker FM mot ren hvit FM), ikke et fysisk resultat. Uten blokken er rapporten, dens tabell og dens sammendrag uendret. Eksempel: <c4/>. Legger til én registerrad, merket MODELLED.

seg-863c2c7a5f0b = <b>Månens referansestasjon: stasjonsgeodesi</b> (<b>MODELLED</b>). Valgfrie inndata <c1/> og <c2/> på <c3/> legger til en blokk <c4/>. Datuminformasjonen i fem matriser fra det arkiverte laseravstandsutsnittet kombineres med det en lagt til retroreflektor og et lagt til VLBI-fyr på oppgitte steder ville bidra med. Reflektoren avstandsmåles ved de arkiverte epokene den kan se, med deres arkiverte vekter. Fyret bruker nettverket og planen fra <c5/>, med stasjonene fastholdt. Blokken gir hver Helmert-1-sigma før og etter, og forholdet mellom dem. Dette er Cramér-Rao-grenser for et redusert parametersett, på en ILLUSTRATIVE plan og et illustrativt sted. Fraværende eller tomme inndata lar rapporten være byte-identisk. Eksempler: <c6/> og <c7/>. Legger til én registerrad, merket MODELLED.

seg-45c6febcc7fc = <b>Månens referansestasjon: sammenligning med publiserte påstander</b> (<b>MODELLED</b>). Hver numeriske påstand i fem offentlige kilder er listet med eksakt ordlyd, side og oppgitte forutsetninger, og klassifisert som sammenlignbar, delvis sammenlignbar eller ikke sammenlignbar (<c1/>; kilder med URL, hentedato, SHA-256 og lisens i <c2/>). De delvis sammenlignbare påstandene ble scoret under seks ensidige terskler forhåndsregistrert før kjøringen (<c3/>, revisjon { "2" }, 05bf9a19): { "1" } av { "6" } påstander innenfor den forhåndsregistrerte terskelen (forhåndsregistrert 05bf9a19). Dekning er { "0.00" } mot >= { "0.95" } på begge sirklene ved sørpolen, og korrigert p95 er { "280.6" } m mot <= { "1.5" } m. Årsaken er satellittenes banelementer, som ingen kilde publiserer: på de ILLUSTRATIVE elementene i treet er fire satellitter i felles sikt i { "8" } % av epokene, ved nesten singulær geometri. Kjøringen gjengir ikke påstandene på disse elementene og er ikke belegg for at påstandene er feil. Festet i <c4/>. Én registerrad, merket MODELLED med funnet.

seg-2b01d2ccb666 = <b>Månens referansestasjon: dataklarhet for klokkefiler</b>. <c1/> oppgir nå tidssystemet for sine epoker. Det er verdien <c2/>, eller, når den ikke er deklarert, standardverdien for headerens satellittsystem. Resultatet sier også om systemet var deklarert. Funksjonen avviser et ukjent tidssystem (for eksempel en månetidsskala), en fil med blandede systemer uten deklarasjon og filer som er uenige, i stedet for å lese dem som GPS-tid. Den leveres med en syntetisk klokkefiksjon for stasjonen. Intet format for korreksjonsfiler er definert, fordi det ikke finnes noe offentlig.

seg-0fb89eb36003 = Endret

seg-b63c95f12bc4 = Moduldokumentasjonen for <c1/>, <c2/> og <c3/> kaller ikke lenger UKF-navigatoren med 17 tilstander, den tette koblingen med full INS og den eksplisitte klokketilstanden fremtidig arbeid; de peker til <c4/>, <c5/> og <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } avvises ikke lenger</b> ({ "0.36" }, WP-07): en RINEX { "4" }-navigasjonsfil ble tidligere avvist med vilje; den leses nå (se Lagt til). For observasjonsfiler fra versjon { "4" } og senere matches headeretiketter bare i kolonne 61-80, slik at de nye frittekstpostene ikke kan passere som etiketter.

seg-5829841b58d7 = <b><c1/> leser ekte IONEX-filer</b> ({ "0.36" }, WP-07): en full post med 16 verdier fyller kolonne 61-80, som leseren tok for en etikett, så den returnerte <c2/> på hver ekte IONEX-fil. Den leser nå en post der etikettfeltet er numerisk som verdier. Ingen utdata som ble levert brukte den.

seg-a66bd6592b93 = <b>Mottatte effekter for Galileo E1 og E5a etter OS SIS ICD Issue { "2.1" }</b> (revisjon, 2026-10-14). Spektrumbåndene <c1/> og <c2/>, og de GNSS-offerne i LEO-signaler som henter effekten sin fra dem, bruker nå minimumseffektene mottatt fra tabell { "12" } i Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (var −{ "157.0" }) og −{ "155.25" } dBW (var −{ "155.0" }).

seg-b0386f62923f = Ni scenarioresultater endres: spektrumeksemplene, spektrumkampanjen, tre LEO-robusthetsvertikaler og tre LEO-signaldesign. Effektiv C/N0 endres med −{ "0.25" } dB og J/S med +{ "0.25" } dB på disse båndene.

seg-2af90bfcefae = Hver endrede verdi ({ "1766" }, gammel → ny) står i <c1/> og dens CSV, sammen med dokumentasjonstabellene som endret seg. Ingen registerrad endrer status.

seg-d468174b2d4c = Andre del, samme dag: LEO-signaloffer <c1/> (−{ "155.0" } → −{ "155.25" } dBW, tabell { "12" } E5b) og <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD-en har ingen rad for fullt E5-bånd, så AltBOC-verdien er effektsummen av totalene for E5a og E5b i tabell { "12" }, bygget slik den gamle verdien ble. Tre resultater for LEO-signaldesign endres ({ "64" } verdier: disse mottatte effektene og LEO-til-GNSS-degraderingen av C/N0 på de to ofrene), listet i den samme revisjonen (§{ "5" }) og CSV-en. Ingenting annet endres.

seg-a96992246ef8 = <b>Retting av atmosfærisk S2-tidevann</b> (<c1/>). S2-harmonikkene for lufttrykk hos Ray ({ "2001" }) er koeffisienter til unormalisert <c2/> med cosinus-fasetilbakeslag; de ble brukt som fullt normalisert, med tilbakeslaget som IERS sinus-føring. De går nå inn delt på <c3/> med <c4/>; den nye <c5/> gjengir modell A2 i GFZ STR06/01 tabell { "5" } for alle { "21" } bølger (verst { "0.0005" } cm, { "0.05" }°; VALIDATED). Bare utdata med tidevann aktivert endres: Galileo CI-tilpasningen { "0.132" } → { "0.133" } m, Swarm-A-komponenter med { "1" }–{ "2" } mm (forhåndsregistrert i <c6/>).

seg-6fa076226c01 = Bare dokumentasjon: <c1/>, <c2/> og <c3/> er dokumentert som eldre løsere, numerisk uendret, med henvisning til <c4/>.

seg-a757fd7ca793 = <b>Status for D9 runde { "3" } (<c1/>).</b> BIPM Circular T { "465" } kom ut 2026-10-12. Den forhåndsregistrerte prospektive scoringen er fortsatt ikke kjørt: utgave { "465" } har omtrent { "285" } testverdier, og stoppregelen trenger { "1000" }, altså omtrent utgavene { "465" }–{ "468" }. Kjøringen trenger også de arkiverte filene per laboratorium fra 2026-09-30, fordi BIPM siden har skrevet om { "87" } av { "113" }. Registerraden og testhodet sier det; testen, dens terskler og dens oppdeling er uendret.

seg-e064546d05ec = <b>Gjennomgang av dokumentasjonens riktighet ({ "0.36" }).</b> Veikart, funksjonsrader, statuslinjer i designdokumenter og modulkommentarer bragt i tråd med koden; ingen utdata endres. Punkter som allerede er bygget men fortsatt stod oppført som åpne er nå merket ferdige: ITU-T-maskekontrollene, holdover-scenarioet på { "24" } timer og klokkelogginnlesing (telecom timing), hurtigstartene for første minutt, Lense–Thirring og kryssjekken av Orekit-propagatoren, den ITRF-presise GCRS-kjeden, gyldne og kryssplattform-hasher, proveniens, ARAIM med flere feil (ADD v4.2), FDE for én satellitt, CRPA-biblioteket, CAI-grensen for fringe-flertydighet, dimensjonering av dekningsstrimler og 3D-banevisningen, stivlegemets holdningsdynamikk, OMM-skriveren og leseren for NAIF-kjerner, DE440 månelibrasjon, setningen om hva en kjøring betyr i lekeplassen, <c1/>, den tett koblede navigatoren med 17 tilstander og gravity-map-typen. Radene sier også presist hva som fortsatt er åpent (for eksempel JD i to deler i <c2/>, leseren <c3/> mot et ekte produkt, og utelukkelse av flere satellitter i <c4/>). Den manglende <c5/> er skrevet fra en fersk kjøring av testene (M1–M4 består), og utkastet til IQ-validering rettet mot partnere har gjeldende registertall.

seg-e2290a640df7 = Minnekodene for Galileo E1 følger ikke lenger med.

seg-80f8ca869682 = <c1/> og <c2/> (ICD vedlegg C.7/C.8) er fjernet fra repoet og pakkene. ICD-ens vilkår (sitert i <c3/>) lar en bruker lagre kodene med kilden oppgitt og bruke dem i et produkt, men tillater videredistribusjon bare til ikke-kommersielle formål, og Kshana tilbys også under en kommersiell lisens. <c4/> / <c5/> returnerer nå en <c6/> og leser brukerens egen kopi fra <c7/> / <c8/>, eller, i en kildeutsjekk, fra <c9/>, der det nye <c10/> trekker dem ut av ICD-ens PDF (kontrollert med hash). <c11/> / <c12/> er fjernet. Uten tabellene gir signalene for Galileo E1 (<c13/>, <c14/>) en feil som forklarer hvordan de skal skaffes, og E1-testene hoppes over med en melding. Med tabellene på plass er hver E1-utdata uendret. Ingen scenario-, golden- eller spektrumutdata bruker kodetabellene. Testfiksturene for E5a vedlegg C.3/C.4 (LFSR-referansen i <c15/>) behandles på samme måte: hentet av det samme skriptet, git-ignorert, og testen hoppes over uten dem.

seg-654d0358137b = <b>Portabel matematikk overalt</b> ({ "0.36" }, STUDIO-15): hver transcendent <c1/>-funksjon i biblioteket, og samplerne <c2/> for normal-, gamma- og eksponentialfordeling, beregner nå gjennom det rene Rust-biblioteket <c3/> (<c4/>, <c5/>), slik at et native bygg og WebAssembly-bygget returnerer byte-identisk resultat-JSON for alle { "141" } medfølgende scenarioer og for den korte IQ-kjøringen. Prisen er at de siste bitene i resultater beregnet med vertens matematikkbibliotek er flyttet: { "98" } av de { "141" } medfølgende scenarioene endret seg, { "43" } ikke; { "5" } endret seg med mer enn { "1e-3" } i sitt største felt, og resten med mindre. Hver flyttet verdi er listet gammel -> ny i <a1><c6/></a1> (med en CSV av alle { "136,127" } flyttede tall); ingen terskel, toleranse eller grense er endret. Publiserte tall som endret seg: tilgjengelighet for <c7/> med avstanden til Jorden { "0.719" } -> { "0.713" } og RMS-feil { "86.147" } -> { "86.499" } m (én epoke på tilgjengelighetskanten løses nå på samme måte overalt; den skrev ut { "0.725" } / { "85.800" } m på macOS arm64); stasjonsfeil for <c8/> { "3.541350" } -> { "3.536885" } m med VLBI og { "2183.558" } -> { "2184.021" } m uten; <c9/>, åtte verdier av <c10/> med { "3" } enheter i siste desimal (erratum i den tekniske rapporten); det utgitte dokumentet <c11/> i størrelser på avrundingsgulvet (åtte verdier utover seks gjeldende siffer, opptil { "6.8e-5" } relativt; ingen rangering eller terskel flyttet seg). De festede hashene til byte-identitetsvaktene (<c12/>, <c13/>, <c14/>) er satt på nytt til en navngitt «{ "0.36" } portable»-grunnlinje med verdiene fra { "0.35.0" } beholdt som historisk register; den frosne prediksjonen for månens referansestasjon er urørt og dens portable gjenkjøring er lagret ved siden av (<c15/>). <c16/> (den validerte raden for felles OD på Månen): fiksturer eksportert på nytt og numpy-sammenligningen kjørt på nytt med numpy { "2.4.6" }, den registrerte versjonen, skriptet og terskelen uendret; alle seks nettverk består (<a2><c17/></a2>). Arbeidet i batch 2-3 som ble flettet inn etter STUDIO-15 bruker også portabel matematikk ({ "457" } kallsteder i { "62" } filer); det det flyttet står i <a3><c18/></a3>: { "12" } medfølgende scenarioer (største relative endring { "5.2e-8" }, ingen utskrevet størrelse flytter seg), { "28" } skyline-vaktrader satt på nytt, M2M4-sjekksummen for <c19/>, de eldre referansehashene for <c20/>, datumsigma for fyr uten observasjon ({ "632.3769" } -> { "632.3772" } m), og to registrerte funn (CR3BP DRO-lukkinger; CRPA A3, { "194" } av { "456" } lenker). Greenhalls eksakte edf beholder sin validerte terskel med en dobbel-dobbel logaritme i kjernen (<a4><c21/></a4>), og testbenk-referansen for gps-sdr-sim ble kjørt på nytt på de flyttede NMEA-eksportene, med alle terskler holdt (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: raden for månesuiten oppgir evidensnivået til hver del (den sa at alle var MODELLED).

seg-ffb14764a7a9 = <c1/> returnerer <c2/> (serie, griddingslogg, tidssystem, om det var deklarert, posttype) i stedet for en tuppel <c3/>. Den faller nå tilbake fra satellittposter (<c4/>) til mottaker-/stasjonsposter (<c5/>) med det forespurte navnet.

seg-6777ca96624a = Ingen score endres med mindre geometrien er dårlig; etiketten rapporteres alltid. Med god eller grei geometri (en åpen himmel med bare GPS og { "8" } satellitter medregnet) eller ukjent geometri (monitoren kjører ikke) er hver score som i { "0.35" }: <c1/> holder begge eksempelsesjonenes utdata og <c2/> hvert innsjekkede NMEA-korpus for fartøy (også som åpen himmel med bare GPS) og opplæringsscenarioene for mannskap til bytene fra { "0.35.0" } når de tillagte nøklene er fjernet; i de to opplæringsscenarioene der jamming gjør geometrien dårlig, avviker de dårlige epokene bare ved geometrifradraget. En logg med dårlig geometri mister opptil { "15" } poeng den ikke mistet i { "0.35" }. Ellers tilsiktede endringer, alle tillegg: nøklene ovenfor i resultat-JSON og bevispakker (<c3/> er uendret); skjemaet for live JSON-linjer går fra { "1.2" } til { "1.3" } (<c4/> lagt til, <c5/> i hvert fradrag); utdragssammendraget får <c6/>; telemetrien får geometriserier, felt og etiketten <c7/> bare for inndata som har dem, slik at en strøm eller et resultat fra { "0.35" } gjengis byte for byte som før. <c8/> er det 17. monitornavnet; det står sist i <c9/> når det avgjorde (et fartøy der loggen gir geometrien; en liste fra { "0.35" } beholder sin rekkefølge og sammendragets monitorantall øker med én) og har ingen oppføring i <c10/> (å sette en avvises: dets fradrag settes i <c11/>).

seg-45b44c851937 = <c1/> oppga lisensen til gnss_lib_py som Apache-2.0; utgivelsen { "1.0.4" } er MIT.

seg-a1a670a9c63e = NMEA-leseren leser nå GSA (en kort GSA ignoreres, telles ikke som hoppet over) og beholder GSV-elevasjoner og -asimuter, også for satellitter oppført uten signal; UBX-leseren beholder elevasjon og asimut fra NAV-SAT. C/N0 leses nøyaktig som før.

seg-0bafbea5c75d = <b>Resultatendring: bredbånds- og sveipede jammere bruker nå Q = { "2" }.</b> Anti-jam-ligningen bruker lærebokens justering Q for spredt spektrum for disse jammerne, der den brukte { "1" }. Q = { "2" } er hvit støy over hovedloben med signaleffekten i båndet normalisert; den er festet i testene til den lukkede formen fra <c1/>.

seg-21f31ec302de = <b>Uendret:</b> CW- og smalbåndsjammere (Q = { "1" }), en ukjent jammertype (Q = { "1" }, den mest skadelige verdien), og <c1/>.

seg-f362499d2ed0 = <b>Virkning:</b> der en bredbånds- eller sveipet jammer virker, øker effektiv C/N0 med opptil { "3.0103" } dB, utledede J/S-terskler øker med { "3.0103" } dB, og nektingsradier i fritt rom krymper med { "0.7071" }.

seg-088dcd34cc88 = <b>Endrede medfølgende scenarioer:</b> { "12" } av { "144" } endres, alle som forhåndsregistrert (<c1/>, resultater i <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: tapte satellitter { "26" } → { "0" }, avstand ved tap av lås median { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: nektingsradius for sløyfedynamikk { "75.2" } → { "53.2" } km;

seg-096a24491872 = og kampanjene og spektrumkryssjekkene som inneholder disse.

seg-ecdf60335064 = <b>Berørte forbrukere:</b> typene <c1/>, <c2/>, <c3/> og <c4/>, <c5/> i spektrumtypene, den MODELLED referansekurven til IQ-kampanjen og standard-Q i labfit, og interop-sceneeksport.

seg-89672d99e9e2 = JetBrains-plugin: ingen utdatert plattform-API eller API som er planlagt fjernet. De fem valgdialogene bruker en liten <c1/> med en rullegardin i stedet for den utdaterte <c2/>; filvelgere for én fil bruker konstruktøren <c3/> i stedet for den utdaterte <c4/>; animasjonen åpnes med <c5/> i stedet for <c6/>, som plattformen { "2026.3" } har planlagt fjernet. Since-build forblir { "243" }. IntelliJ Plugin Verifier rapporterer Compatible uten bruk av utdatert API eller API planlagt fjernet mot { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) og { "2026.3" } EAP (IU-263.6259.32); <c7/> kontrollerer { "2024.3" } som standard og enhver liste oppgitt i <c8/>.

seg-58ee61cbd633 = <c1/> og <c2/> returnerer <c3/>: en ugyldig seksjon <c4/> er en feil når den kalles direkte, slik den allerede var gjennom <c5/>, i stedet for en stille tilbakegang til den flate masken. <b>Brytende endring</b> for Rust-kallere av disse to funksjonene.

seg-9b4113258e1e = <b>Kampanjescorer: en ekte falsk lås i sporeren ble aldri talt</b> (<c1/>). Sporerens kontroll av falsk lås flytter en kanal fra LOCKED til LOST idet den utløses. Scoreren merket kanalens neste oppdatering i stedet, som da var ulåst og derfor aldri ble talt. En <c2/>-hendelse rapportert fra LOCKED er nå én episode på sitt tidspunkt, i kjøringen og i hver oppgitt hendelse som inneholder den. En som oppdages under innlåsing, eller gjentas av en kanal som allerede er LOST, er ikke en ny episode. En ny test driver en ekte falsk lås: en legitim GPS L1 C/A-bærebølge som trinnvis endres med 1/(2T) mens den er låst (<c3/>).

seg-ac508954b6a6 = I referansekampanjen i <c1/> endres bare PRN { "11" } for ramp/agc-3bit (episoder med falsk lås { "0" } → { "1" }, { "426" } og { "437" } per låst time).

seg-cfc47d9d9237 = DIGEST-ene for cellene er festet på nytt.

seg-fcfa0de18b05 = Den forhåndsregistrerte festingen av scorede resultater er fortsatt aktiv og gjengir fortsatt nøyaktig: i hashen er bare de seks feltene som ble endret av denne rettingen gjort etter registreringen tilordnet tilbake til sine verdier før rettingen. De rettede verdiene er festet hver for seg.

seg-b96d34bb1d36 = Ingen terskel ble endret, og ingen VALIDATED rad, figur eller nettside-tall flyttet seg.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: et fyr uten observasjon rapporteres nå</b> (funnet av MR-05). Rapporten får <c1/> og <c2/> bare når et fyr ikke har noen observasjon, og da kommer sigmaene til de observerte fyrene fra deres egen informasjon i stedet for å være null alle sammen. Datumet er uendret, og ingen standard, medfølgende eller publisert utdata flytter seg (<c3/>).

seg-c223c1fc1323 = <b>Månens hovedakseramme</b> (<c1/>, brukt av <c2/> og LRO-tilpasningen): DE421-forskyvningen fra middel-Jord til hovedakse i <c3/> ble brukt i feil retning og med feil Euler-rekkefølge, slik at den analytiske PA-rammen lå omtrent { "208" }″ fra PA i stedet for på den. Den er nå transkribert slik SPICEs Frames Required Reading definerer den og stemmer med SPICE <c4/> til { "2.6e-16" } rad; den analytiske PA-rammen er { "6" }″ til { "8" }″ fra DE440 PA (forhåndsregistrert e1ead19b, registrert på nytt be33382e etter at den første foreslåtte endringen bommet på terskelen { "1e-12" }; <c5/>). Publiserte tall som flytter seg: LRO-tilpasningen (<c6/>) rå overlapping { "53.8" } → { "39.9" } m, dynamisk { "12.6" } → { "12.05" } m, redusert-dynamisk { "6.65" } → { "6.67" } m (terskler uendret). Den analytiske stakken stemmer nå med ANISE DE-klasse kryssvalidering ({ "12.0" } / { "6.67" } m) på begge nivåer; det tidligere gapet på det dynamiske nivået var denne feilen.

seg-ef2b49d4ad48 = <b>MCP-serveren avviser <c1/></b> (oppfølging av CAP-06b). Stien til terrengflisen for typen jamming står nå i <c2/>. En inline-flate avviser et scenario som navngir en, med en melding som verken inneholder stien eller en feil fra operativsystemet. Testen for vakten mot filkilder flagger nå også felt som slutter på <c3/>.

seg-ef005d2e3d42 = <c1/> med en brøkdel i dagsdelen mistet brøkdelen i konverteringene for UTC, TAI, UT1 og Jordens rotasjon (én times dagsdel snudde Jorden { "15" }° feil); dagsdelen normaliseres nå til et heltall. Ingen kaller i motoren ble påvirket: hver sender en heltallsdag, og hver utdata som ble levert er bit-identisk.

seg-144d90307ec6 = Planlagt

seg-7ef4cd25cb87 = Geometrien fra en oppgitt skyline ({ "0.36" } punkt { "1" }, nå i motoren som <c1/>): <c2/> og <c3/> fra skylinen der inndataene gir en (asimutgapet som reserve), en hendelse med naturlig degradering (fjord eller terminal) i <c4/>, og designnotatets to maskerte geometrier i raden sigma_UERE x DOP, forhåndsregistrert som et tillegg.

seg-49481d2fdf31 = Geometri for RINEX-logger med navigasjon (fra motorens egen posisjonsbestemmelse) og Android-logger (fra radene <c1/>); begge leser <c2/> i dag. Geometri i <c3/> (versjon { "1" } uendret i { "0.36" }) og integrasjonene med Signal K og OpenCPN.

seg-57df1332ff87 = Et eksisterende gap, ikke introdusert i { "0.36" }: når SNR-feltet til hver satellitt er tomt, utløses verken <c1/> eller fradrag for C/N0; totalt signaltap er bare synlig gjennom geometrimonitorens <c2/> (klassifisert <c3/>). Et fradrag for det er planlagt.

seg-a5a7a10ee11c = En strøm i skjema { "1.3" } i de eksterne telemetriorakelene (Prometheus' tekstformatparser og OTLP-collectoren), som i dag bare dekker strømmer i { "1.2" }.

seg-caa1977b5b5e = En toveis hindring (en kløft eller en smal fjord) leses som signaltap i stedet for en blokkert himmel til skylinen er integrert.

seg-4bd0f178ca4e = En passasje som navngir tredjeparts AI-klienter er utelatt her; den står i <a1>CHANGELOG.md</a1> på GitHub.

seg-b2689beaba9e = Verifikator for Galileo OSNMA

seg-d16c9b4bf537 = <b>Ny modul <c1/> og <c2/>: en åpen verifikator i ren Rust på mottakersiden for Galileo OSNMA.</b> Den leser I/NAV-sider og rapporterer, per satellitt og epoke, om navigasjonsdataene er autentisert, med en årsak for hver feil eller forsinkelse: tolking av HKROOT og MACK, gjenoppbygging av DSM-KROOT og DSM-PKR, Merkle-verifisering av den offentlige nøkkelen, verifisering av TESLA-nøkkelkjeden, MACSEQ- og tag-verifisering for ADKD { "0" }, { "4" } og { "12" } inkludert kryssautentisering, og et resultat i form av <c3/> for mottakertillitsmonitoren. Utdata har en veiledende merknad om at statusen ikke er en tjeneste for navigasjonsintegritet. <c4/> oppgir hva som verifiseres og ikke verifiseres, tidskravet, og at Kshana ikke gir noen rettigheter under EUs IPR-er for OSNMA ICD (brukere støtter seg på ICD-ens vedlegg E om tillatelse). Implementert mot SIS ICD Issue { "1.1" } og Receiver Guidelines Issue { "1.3" }. Sider kontrolleres med CRC, og en bytestrøm fra u-blox UBX-RXM-SFRBX kan leses direkte (<c5/>). Standardtestene bruker syntetiske data og publiserte known-answer-tester for primitiver; en valgfri test leser en lokalt nedlastet kopi av de offisielle vektorene. Etter uavhengig gjennomgang henter verifikatoren tiden sin bare fra verifiserte TESLA-nøkler (en forfalsket delramme langt frem i tid kan ikke lenger slette en feil), lar en autentisering utløpe og følge IODnav i bruk, tar hensyn til verifiserte varselmeldinger (hvis Merkle-blad nå inkluderer det tilfeldige NPK-feltet) og NMA-status «don't use», holder dummy-tagger utenfor satellittstatusen, holder kjeder per CID med tilbakekalling og fornyelse, kontrollerer paddinghashen i KROOT, og begrenser lengder på UBX-rammer og arbeidet med TESLA-verifisering. En satellitt leses som autentisert bare så lenge de nyeste efemeride- og klokkedataene den sender er, bit for bit, dataene som ble autentisert (ikke bare under samme IODnav), en status eller tilbakekalling fra den uautentiserte NMA-headeren teller bare når to satellitter er enige eller en verifisert KROOT bærer den, en avspilt eldre KROOT kan ikke erstatte en kjede, og en stanset nøkkelstrøm rapporteres.

seg-3e7df5c888ca = Lagt til (MCP-serverkanaler)

seg-4e70d8b85211 = <b><c1/>, streambar HTTP, selvhostet.</b> Loopback som standard; en adresse som ikke er loopback trenger <c2/> og et bearer-token i <c3/>; ingen verktøy leser eller skriver en sti (IQ-filverktøyene er av); grenser for forespørselsstørrelse, tid og samtidighet; ingen CORS-header; kontroller av Host og Origin. Kshana drifter ingen endepunkt (<c4/>, med maler for Docker, Fly.io og Cloud Run).

seg-c392cde151c9 = Lagt til (flater)

seg-19ab5c068b6e = <b><c1/> i Python og WebAssembly.</b> Verifikatoren bak <c2/> på bytes i minnet, som returnerer JSON-en <c3/> skriver ut (veiledende merknad i feltet <c4/>; bare autentiseringsstatus, ikke en tjeneste for navigasjonsintegritet). De samme avvisningene som kommandolinjen. Ikke på MCP: inndataene er en lang rå mottakerstrøm som egner seg bedre for CLI og Python. <c5/> og <c6/> sier det.

seg-6128929994b4 = <b><c1/> i WebAssembly, Python og MCP, med en plugin-kommando og en JetBrains-handling.</b> Gjengir en tillitsstrøm eller et resultat fra <c2/> som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP-JSON-nyttelast, med kodererne <c3/> bruker (<c4/>); ingen socket og ingen klokke. Plugin: <c5/> og ferdigheten <c6/>. JetBrains: Render Trust Telemetry. Funksjonene <c7/> og <c8/> og MCP-serveren aktiverer nå også <c9/>, som ikke legger til noen crate.

seg-83d01411c6d4 = <b>Paritetssveip.</b> JetBrains-handlingene Validate Scenario, List Scenario Kinds og Assess Receiver Stream; <c1/> lister nå <c2/>, <c3/>, <c4/> og <c5/>; notatboken <c6/> (compliance-kartlegging og testbenk-eksport); og hver gjenværende JetBrains-celle «CLI only» i <c7/> er nå en eksplisitt N/A med sin begrunnelse.

seg-062ef0cf7ee7 = Lagt til (bevispakker)

seg-9889575c2df1 = <b><c1/> og <c2/>: signerte, verifiserbare bevispakker for en GNSS-tillitshendelse.</b> En pakke samler det rå loggutsnittet og hele loggens SHA-256, konfigurasjonen med hver terskel, resultatene og årsakene per epoke, motorversjonen, et hash-kjedet manifest og et selvstendig HTML-sammendrag, signert med Ed25519 (en nøkkel fra <c3/> eller din egen fil; nøkler lagres aldri i en pakke og <c4/> er git-ignorert). <c5/> kontrollerer hver hash, kjeden og signaturen og navngir nøyaktig hva som feiler; med <c6/> fester den signereren. Et RFC { "3161" }-token kan legges ved og leses og bindes til manifestet (autoritetens egen signatur kontrolleres ikke av dette bygget; <c7/> dekker det). Loggutsnittet er vinduets eksakte bytes der leseren rapporterer kildeomfang (NMEA, UBX, RINEX { "3" }, Android), ellers hele loggen, og manifestet sier hvilket. Opprettelse og verifisering er rene offentlige funksjoner (<c8/>) som bygges for <c9/>. Pakkene oppgir at de er en teknisk journal, ikke en juridisk vurdering. De nye avhengighetene er treet <c10/> (BSD-3-Clause og Apache-2.0/MIT, minimale funksjoner) og en direkte <c11/> (allerede i det treet) for å slette nøkkelmateriale. Se <c12/>.

seg-280fd37126c1 = Lagt til (tillitstelemetri)

seg-ebd269c618b0 = <b><c1/>: GNSS-tillit som kilde til sikkerhetstelemetri.</b> Leser tillitsstrømmen per epoke (JSON-linjer: score 0-100, bånd, årsaker) eller et batch-resultat fra <c2/> og mater et Prometheus-endepunkt <c3/> (localhost som standard), syslog-hendelser i CEF eller LEEF inne i en RFC { "5424" }-konvolutt (UDP eller TCP), og, bak funksjonen <c4/> som er av som standard, eksport som OTLP/HTTP-JSON. Leveringen kjører på arbeidstråder med tidsgrenser for tilkobling og skriving, begrenset reconnect-backoff og en teller <c5/>, slik at en død eller fastlåst collector ikke kan stoppe den løpende vurderingen eller fryse <c6/>; årsaketiketter er begrenset til { "64" } serier. Ingen nye avhengigheter. Et eksempel på Grafana-dashbord ligger i <c7/>. Metrikknavn, etiketter og CEF/LEEF-feltkartleggingen står i <c8/>. Strømformatet er isolert i <c9/>.

seg-fa5e803edb44 = Maritim tillit: en løpende tillitsscore fra 0 til 100 for posisjonsbestemmelsen til et fartøy i bevegelse, fra NMEA { "0183" } som mottakeren allerede sender, med en valgfri port.

seg-c5b3fcb9bba8 = <c1/> tar en tabell <c2/> (<c3/> eller <c4/>, fartøyets maksimale fart, akselerasjon og svingrate, antennehøyde over vannlinjen og en valgfri retningssensor; hver standard er dokumentert med sin begrunnelse). For et fartøy erstattes monitoren for statisk posisjonshopp, som måler avstand fra kalibreringsgjennomsnittet og er feil på et skip i fart, av kausale monitorer for bevegelige plattformer: kinematisk konsistens mellom posisjonen og den rapporterte farten og kursen og mot fartøyets grenser, gyroretning mot kurs over grunn, fartslogg mot fart over grunn, antennehøyde mot den oppgitte høyden over vannlinjen, C/N0-spredning som kollapser og stiger sammen mot kalibreringens grunnlinje, og tidskonsistens (også mot denne datamaskinens klokke i live-modus). Den leser også en rapportert autentiseringsstatus, samlet eller per satellitt (bare en rapportert status: ingen OSNMA-kryptografi). Hver terskel oppgis i en tabell <c5/> før kjøringen. Hver epoke får så en score fra { "0" } til { "100" } ved en deterministisk, forhåndsregistrert kartlegging (ingen læring, ingenting tilpasset hendelser; vekter, båndkanter og evidensen ligger i en tabell <c6/>), avbildet på de eksisterende tillitstilstandene, med monitorene som trakk fra og deres poeng. Statiske scenarioer er uendret og hashes som før. <c7/> leser stdin, en fil som utvides, TCP eller UDP og skriver én JSON-linje per epoke og en proprietær setning <c8/>; med <c9/> sender den strømmen videre uendret så lenge posisjonsbestemmelsen er pålitelig og merker posisjonsbestemmelsen som ugyldig (GGA-kvalitet { "0" }, RMC- og GLL-status <c10/>, GNS- og VTG-modus <c11/>) mens den ikke er det. Porten er av med mindre den bes om; <c12/> serverer den portede strømmen til et hvilket som helst antall TCP-klienter (loopback som standard, en treg klient kobles fra i stedet for å blokkere de andre). Dette er veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }); operatøren er fortsatt ansvarlig. <c13/> er en syntetisk logg fra Tallinn til Helsingfors, skrevet bare som tekst, med en posisjons-drag-off et stykke ut der mottakeren fortsetter å rapportere en gyldig posisjonsbestemmelse; forventet utdata er festet av en test. Veiledning: <c14/>. Kontrollene kan ikke se en spoofer hvis posisjonsbestemmelse er konsistent med alt på bussen; veiledningen sier det.

seg-80f3f0aae42c = Interferenskart

seg-8539a42718cb = <b><c1/> og <c2/>: et offentlig bilde av hvor fly og skip rapporterte degraderte navigasjonsdata, og hvor mye av en rute det berører.</b> Inndata er lokale CSV-filer laget fra åpent lisensierte data fra ADS-B (adsb.lol, ODbL { "1.0" }) og AIS (NOAA MarineCadastre, Kystverket under NLOD { "2.0" }); hver utdatafil er én kilde og én UTC-dag med GeoJSON som bærer metoden, dens terskler, datalisensen, kildehenvisningen og kildens dekningsskjevhet. ADS-B-metoden aggregerer NIC og NACp på et fast rutenett og kaller en celle degradert ut fra andelen distinkte fly, med vern mot utstyr som aldri rapporterer nøyaktighet, lav høyde og årsaker over store områder. AIS-metoden kjører fem detektorer: posisjoner på land (mot en kystlinje oppgitt av brukeren), sirkulære spor, usannsynlige hopp, usannsynlige hastigheter og mange fartøy i én posisjon. Tersklene er forhåndsregistrerte konstanter i en navngitt metodeversjon. Bare aggregater: identifikatorer hashes i minnet og skrives aldri, og celler med færre enn { "5" } distinkte fly eller fartøy publiseres ikke. En degradert celle er ikke et funn av interferens. Standardkommandoene bruker ikke nettverk; en valgfri hjelper <c3/> laster ned Natural Earth-landpolygoner fra en adresse festet til en commit og beholder filen bare hvis dens SHA-256 stemmer. ADS-B-inndata er en CSV eller readsb-historikkfilene fra adsb.lol direkte (ny avhengighet: <c4/> med sin rene Rust-backend, for gzip). Begge metodene er versjon { "2" }: et kall om degradert eller avvikende trenger minst { "5" } fly eller fartøy (publiseringsminimum), hvert antall per celle under { "5" } holdes tilbake som <c5/>, og en dag der bakgrunnen ikke kan estimeres holder tilbake sine kall. Utdatafiler heter <c6/> og overskrives aldri; inndata strømmes linje for linje; ruteeksponeringen håndterer antimeridianen. Testene bruker bare syntetiske data. Se <c7/> og lisensgjennomgangen i <c8/>.

seg-7a54dfab93dc = Lagt til (opplæringsstrømmer)

seg-0b01d1d871e2 = <b><c1/>: syntetisk bro-NMEA { "0183" } for mannskapsopplæring i gjenkjenning av GNSS-jamming og -spoofing.</b> Fra en scenario-TOML skriver den en fil, eller strømmer over TCP eller UDP (unicast eller broadcast; sanntid, akselerert eller så fort som mulig), hele bro-settet GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT og VBW for et fartøysspor med svingrate, akselerasjon og strømgrenser, med satellittgeometri fra motorens egne nominelle konstellasjoner. Skriptede hendelser på en tidslinje: jamming, posisjons-drag-off (en gyldig posisjonsbestemmelse som går bort), tids-spoofing og en forsinkelse ved avspilling, hver med ramper for inntreden og gjenoppretting. En instruktørlogg (JSON og tekst) registrerer hva som ble injisert når, med det sanne sporet mot det rapporterte. Et bibliotek i <c2/> (jamming på åpent hav, drag-off ved kysten, tids-spoofing ved havneinnseiling, kombinert) har instruktørnotater. Utdata har gyldig sjekksum og er deterministisk per seed; testene fester et gyldent utdrag per scenario og leser hver setning med NMEA-leseren i <c3/>. Bare tekst: ingen RF-, IQ- eller bølgeformutdata; strømmene er for opplæring og testing og må aldri mates inn i et fartøys løpende navigasjonssystemer. Se <c4/>.

seg-bb8d508c92fa = Maritime integrasjoner ({ "0.35.0" }, arbeidsstrøm B)

seg-538cdf145ac1 = <b>Signal K-plugin</b> (<c1/>, ikke publisert til npm): kjører eller kobler til <c2/> (serverens egen NMEA-inngang, egendefinerte inndataargumenter, en TCP-mating med JSON-linjer, eller setningene <c3/> fra en portstrøm), publiserer tillitsscoren, båndet, årsakene, alarmene og portens tilstand under <c4/> (inkludert posisjonen rapportert av mottakeren som kontekst, aldri <c5/>), og sender et Signal K-varsel (<c6/> ved degradert, <c7/> ved ikke-pålitelig, med terskler for holding, opphevelse og foreldelse, alle i konfigurasjonsskjemaet). Ingen npm-avhengigheter. Testet på innspilt syntetisk utdata.

seg-b6eb7110291e = <b>OpenCPN</b>: NMEA i port-modus serveres direkte av <c1/> (anbefalt); et avhengighetsfritt TCP-relé (<c2/>) er det valgfrie alternativet. Uansett hvilket ser OpenCPN en ugyldig posisjonsbestemmelse når tilliten kollapser og <c3/> i sitt NMEA-feilsøkingsvindu; testene spiller av den syntetiske portede strømmen gjennom en ekte TCP-socket og kontrollerer hva en forbruker mottar. En innebygd plugin for scorepanel (<c4/>, plugin-API { "1.18" }, CMake) leser <c5/> fra OpenCPNs egen NMEA-strøm og varsler ved det ikke-pålitelige båndet; den bygges, logikken er enhetstestet, og den ble kjørt inne i OpenCPN { "5.8.4" } under en virtuell skjerm (evidens og et reproduksjonsskript i <c6/>); den er ikke pakket for plugin-behandleren.

seg-bb26e8c1aff0 = <b>Referansebygg</b> (<c1/>): generisk delliste, oppsett av OS, systemd-enheter for den veiledende monitoren og den valgfrie porten (kontrollert med <c2/> av <c3/>), et containeralternativ, kobling til Signal K.

seg-6695d4c1f13b = Signal K-pluginen godtar live JSON-skjemaet { "1.2" } (en <c1/> og deretter en nøkkel <c2/> lagt til; ukjente tillagte nøkler ignoreres), kontrollert på ekte utdata i { "1.2" } og mot en ekte signalk-server.

seg-622c2d3dd8fa = Rettinger etter gjennomgang: systemd-enhetene starter alltid på nytt og kjører i sandkasse (ingen shell, ingen nettverk der det ikke trengs), et logrotate-utdrag, <c1/> feiler ved ethvert funn; containeren kjører porten fra miljøvariabler med en helsekontroll og basebilder festet med digest; Signal K-scoremetadata, det foreldede varselet erstattes når data gjenopptas, feil i barneprosesser beholdes og avslutninger eskaleres, usikre <c2/> avvises, og varselet ligger på <c3/>; releet begrenser en holdt delvis linje; parserne for <c4/> avviser scorer utenfor { "0" } til { "100" }; en kontroll av dokumentasjonslenker; en CI-arbeidsflyt (<c5/>) som kjører alt, inkludert den ekte binærfilen ende til ende.

seg-7c615a62ca26 = <c1/>. Veiledende programvare, ikke typegodkjent utstyr; operatøren er fortsatt ansvarlig. Bare programvare: ingenting sender, og ingen tall for deteksjon eller falske alarmer hevdes.

seg-72cb9f45ce99 = Lagt til: compliance-kartlegging og testbenk-eksport

seg-15aae04a9490 = <b><c1/> og <c2/>.</b> En kartlegging fra Kshanas utdata til fem rammeverk og standarder for robusthet (US DHS Resilient PNT Conformance Framework v2.0, IMO-veiledning for skip, EASA-veiledning for luftfart, NIS2 artikkel { "21" }, EN { "16803" }, en betalt standard sitert etter del og etter de få klausulnumrene som er synlige i katalogteksten), én tabell per rammeverk: referansen, hva det ber om i vår parafrase, utdataene som gir belegg for det, og gapet. Kildeversjoner, URL-er og hva som ble og ikke ble lest er registrert. <c3/> fyller kartleggingen fra kjøringene som er gitt og merker hver rad <c4/>, <c5/>, <c6/> eller <c7/>, som Markdown og JSON, med gapet beholdt på hver rad. Formuleringen er «gir belegg for»; ingenting vurderes eller godkjennes. Testene bruker syntetiske kjøringer og feiler når en innsjekket tabell avviker fra koden.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Skriver bevegelsen og hendelsene til et kjøretøy i et scenario av typen <c2/>, <c3/> eller <c4/> for en GNSS-simulator i laboratoriet: en CSV med brukerbevegelse med dokumenterte rammer og en metadata-sidefil, NMEA { "0183" } <c5/>/<c6/>, tekst med veipunkter, og hendelsene som CSV og som blokker <c7/> <c8/> (<c9/>). Bare bevegelse og hendelser: ingen signal skrives. Hver fil leses tilbake i <c10/> og sammenlignes innenfor sin oppgitte toleranse. <a1><c11/></a1> gir metoden for å spille av eksporten gjennom en simulator og score mottakerens logg med <c12/>.

seg-fc0fe915ed3d = <b>Hva som regnes som evidens.</b> Et resultat teller for en funksjon bare når det har feltene typen skriver; en typeetikett alene teller ikke. Ukjente typer, et resultat som er uenig med sitt søskenscenario, ikke-heksadesimale hasher og feilformede antall for mottakertillit listes som ikke brukt, med årsaken. Rapporten escaper Markdown-celler og kan ikke krasje med panic på en ikke-ASCII-hash. <c1/> og <c2/> tar tekster, ikke stier.

seg-6b46de1164d8 = Testbenk-eksport.

seg-c48a4dd4134b = <c1/> områdekontrolleres (<c2/>); veipunktfilen kontrollerer hvert intervall og kommandoen sier hvorfor når en er utelatt; dokumentasjonen oppgir at retningen for <c3/> er kroppens giring og ikke kursen, plassholderfeltene i <c4/>, og scenarioets egen høydeendring. <c5/> og <c6/> står i bruksteksten.

seg-eb2e415ec540 = <c1/> eksponerer den sanne tilstandshistorikken til kjøreprofilen for <c2/> (den samme steppingen som typens egen referanse bruker), og <c3/> får NMEA-felt for dato og tid.

seg-fbfc1a59e99b = Validering av interferenskartet

seg-a68d88381eea = <b>Interferenskartets dekodingssemantikk og geometri er kontrollert mot uavhengige implementasjoner på syntetiske inndata.</b> Betydningen av NIC- og NACp-kodene mot pyModeS-dekoding av syntetiske ADS-B-rammer, AIS-verdiene for ikke tilgjengelig mot pyais-dekoding av syntetiske AIVDM-setninger, tilordning av rutenettceller mot shapely, rutelengde per celletilstand mot shapely og GeographicLib, og maskering av innland mot shapely og pyproj, hver til en toleranse fastsatt før den første sammenligningen (<c1/>). Dette kontrollerer hvordan koder og feltverdier leses og geometrien, ikke at en flagget celle er interferens. Leseren for landpolygoner lukker nå en ring som ikke gjentar sitt første hjørne, som den tidligere leste uten siste kant. Dokumentasjonen oppgir terskelene for lav nøyaktighet for NACp og NIC som grensen hver kode står for (NACp { "6" } er en EPU-grense på { "556" } m, NIC { "5" } en inneslutningsgrense på { "1" } NM).

seg-cf4ffdbba1a6 = Lagt til (validering av telemetriformatene og bevispakkene)

seg-ad6730e0e891 = <b>Eksterne kontroller av kryptografien i bevispakkene, pakkeverifikatoren og trådformatene for telemetri.</b> Ed25519-testvektorene fra RFC { "8032" } avsnitt { "7.1" } ({ "1" }, { "2" }, { "3" } og { "1024" }) og SHA-256-eksemplene fra FIPS 180-4 kjøres gjennom pakkens egne funksjoner for signering, verifisering og hashing, til eksakt likhet. En verifikator skrevet i Python fra bare den normative delen av <c1/> (hashlib og <c2/>) er enig med Rust-verifikatoren på { "71" } intakte og manipulerte pakker: dom, feilmengde, signaturdom og begge kjedehodene. Vår Prometheus-eksposisjon leses av parseren i den offisielle Python-klienten og vår OTLP-JSON av den offisielle meldingen <c3/>, strengt, og begge stemmer med tilstanden de ble laget fra. CEF og LEEF har ingen uavhengig åpen validator og forblir modellert. <c4/> fikk det normative pakkeformatet og verifiseringsprosedyren clean-room-verifikatoren ble skrevet fra; <c5/> fikk <c6/>. Referanser og fiksturer: <c7/>, <c8/> med <c9/>, <c10/>; tester <c11/>, <c12/> og <c13/>. CI trenger ikke Python.

seg-20d1b02bfda4 = Lagt til (validering av CEF-hendelsene)

seg-8c464e43e43d = CEF-hendelsene i telemetrien leses tilbake riktig av to uavhengige åpen kildekode-parsere.

seg-a6321d13b0ab = <c1/> { "1.11" } og Logstash CEF-kodeken (<c2/> { "6.2.7" } i Logstash { "8.15.3" }) tolker { "157" } CEF-linjer (hver båndendring og hver epoke i den innsjekkede telemetristrømmen, pluss motstridig tekst som inneholder <c3/>, omvendte skråstreker, piper, linjeskift, tabulatorer og tekst med flere bytes) og gjenvinner hvert headerfelt, alvorlighetsgraden, det eksakte settet av utvidelsesnøkler og hver verdi nøyaktig. Logstash-kodeken leser også fire linjer der headerteksten trenger escaping, noe <c4/> ikke kan. Terskelen ble registrert før noen av parserne ble kjørt (<c5/>); fiksturer i <c6/>, referanseskript <c7/> og <c8/>; CI trenger verken Python eller Logstash. LEEF har ingen vedlikeholdt åpen parser og forblir modellert. CEF-hendelsene har nå tillitsscoren og epokeforskyvningen i CEF-ordbokens flyttallsfelt (<c9/>, <c10/>) i stedet for heltallsfeltene <c11/> og <c12/>, som passet for ingen av verdiene; CEF er nytt i denne utgivelsen, så ingenting som ble levert endres.

seg-65b362fa8711 = MCP: <c1/> godtar loggen som <c2/> eller <c3/>; verktøyinndata er begrenset til { "4" } MiB.

seg-8999974aa1fa = Jamming-diagrammet henter også fargene sine fra paletten.

seg-8c8ff384dbf6 = <c1/> var den ene modulen som revisjonen av Observatory-paletten lot beholde sine egne farger mens arbeidet med jammer-Q landet; dens <c2/> (<c3/>, <c4/> og andre scenarioer av typen <c5/>) leser nå <c6/>, og tillatelseslisten i <c7/> er tom. Bare farger og skrift: diagrammene <c8/> og <c9/> er lik sine tidligere registrerte gjengivelser når farge, <c10/> og versjonsbunnteksten er normalisert. Ingen plottet verdi flyttet seg. De registrerte Studio-kopiene under <c11/> ble registrert på nytt ved overføringene av { "0.33.0" } og { "0.34.0" } (bare versjonsstempel): de har fortsatt jamming-diagrammets gamle maling, og får palettens maling ved neste overføring.

seg-a059d10c5330 = <b>3-sigma-grensen for klokkeensemblet dekker nå flicker-gulvet, og filterhelsekontrollen ser det.</b> Med en <c1/> hadde referanseklokken flicker FM, men filteret med to tilstander som gir integritetsgrensen hadde det ikke, så 3-sigma-dekningen i det leverte scenarioet <c2/> var { "0.41" } (klassisk) og { "0.33" } (kvante), og NIS/NEES-kontrollen, som trakk sin egen referanse fra filterets modell, rapporterte identiske verdier med og uten gulvet. Grensen er nå variansen fra de to tilstandene pluss den eksakte variansen til flicker-fasen akkumulert siden siste synkronisering, beregnet fra den samme banken som referanseklokken bruker; NIS/NEES-kontrollen trekker sin referanse fra den utvidede modellen med den banken og kjører det tilpassede utvidede filteret (og filteret med to tilstander mot flicker-referanse rapporterer <c3/>). Endring i utdata, bare for klokker med en <c4/> som ikke er null: <c5/> på <c6/> går fra { "0.40866" } / { "0.33026" } til { "0.99970" } / { "1.0" } (klassisk / kvante) og NIS/NEES for <c7/> inkluderer nå flickeren; tidsfeilen, <c8/> og <c9/> er uendret, og scenarioer uten gulv er byte-identiske. <c10/> (orbit-type, seed { "7" }, gulv { "1e-16" } / { "2e-11" }) endres også: <c11/> klassisk { "0.7734" } til { "1.0" } og kvante { "0.9796" } til { "1.0" }, og NIS/NEES for <c12/> og deres bånd endres. Dens kvante <c13/> snur fra <c14/> til <c15/>: en samplingshendelse i flicker-ensemblet på 16 seeder ganger 60 steg (NIS { "0.8815" } mot et bånd på [{ "0.9125" }, { "1.0914" }]), ikke en defekt. Båndet er et { "95" } %-bånd, så omtrent { "5" } % av seedene flagger et tilpasset filter per konstruksjon ({ "40" } nye seeder av dette scenarioet: kvante { "1" } og klassisk { "2" } flagget); ved { "64" } ganger { "200" } ligger det samme seedet innenfor båndet for begge klokker (NIS { "0.990" } og { "1.001" }). Kjent oppfølging: typen fusion har det samme gapet (klassisk integritet { "0.80" } med et gulv); typen hybrid forblir over { "0.99" }.

seg-c7308350b6d4 = <b>Inndata til MCP-serveren herdet.</b> Scenarioverktøyene i MCP-serveren godtar nå bare inline-innhold og avviser felt for filkilder; inndatastørrelsen er begrenset. Sikkerhetsmerknad: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Lab replay: en sporingsmotor, deteksjonsmonitorer og en kampanjekjører for GNSS IQ-opptak, med sløyfedesignene, C/N0-estimatorene og scorene som hører til. Evidensklasse: alt nedenfor er <b>MODELLED</b> eller kontrollert for intern konsistens mot lukkede former og simulering med seed; ingenting av det legger til en VALIDATED rad, og verifikasjonsregisteret er uendret ({ "251" } rader: { "124" } validert, { "123" } modellert, { "4" } partner). Det er et programvarelag for analyse: ingenting her syntetiserer en bølgeform fra en jammer eller spoofer, og ingenting sender.

seg-912ecb44cee4 = Lab replay: testforhold, kampanjekjører og scoring ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> spiller av opptak × front-end-kjeder × sløyfedesign (<c2/>) og scorer hver celle mot en testforholdsfil per opptak (<c3/>, TOML eller JSON). Den filen oppgir hva et laboratorium vet om opptaket: de forventede satellittene, og for hver hendelse typeetiketten, start og slutt, berørte satellitter og oppgitt J/S- eller jammereffektprofil. Det er bare metadata. Scorene per satellitt, for hele kjøringen og per hendelse, er:

seg-180447aaf31e = tilgjengelighet, tid til tap av lås og oppgitt J/S ved tapet;

seg-1ababddb0d87 = tid til gjenfangst, fra hendelsens slutt og fra tapet;

seg-a6468323c971 = målt C/N0-degradering per oppgitt J/S-bin;

seg-4cb6f510e159 = episoder med falsk lås per låst time (sporerens flagg, eller Doppler mot en sidefil med referanse);

seg-97c6243bac2e = jitter i PLL- og DLL-diskriminatorer.

seg-014b28f61db8 = Ved siden av hver målte degraderingskurve tegnes en analytisk referanse for spektral separasjon (<c1/> med typens <c2/>) og merkes MODELLED overalt der den vises.

seg-eb5c38197dab = Celler kjører parallelt gjennom sporingsøktens tilstandsmaskin for lås, og hver skrives atomisk under en nøkkel med innholdshash. Nøkkelen dekker opptakets SHA-256, hashene for forhold, front-end, design, kjøring og scoring, den påkrevde <c1/> (<c2/> | <c3/>) og motorversjonen. Med <c4/> satt beholdes også hver celles strøm <c5/> og låshendelser, navngitt etter cellenøkkel og hashet inn i cellen. <c6/> og <c7/> er offentlige, slik at en forbruker kan utlede hver nøkkel og sammendraget på nytt. En ny kjøring hopper derfor over ferdige celler, og utdata avhenger aldri av antall arbeidere. Kjøringen skriver <c8/>/<c9/>, en selvstendig <c10/> og en <c11/>. Terskler for bestått/ikke bestått (<c12/>, kan overstyres per opptak) brukes når rapporten bygges.

seg-beec1c1264c9 = <c1/> (standard <c2/>, del av scoringshashen) velger C/N0-en bak den rapporterte C/N0 og degraderingskurven. Begge estimatene scores og rapporteres alltid (medianer for hele kjøringen og grunnlinjen, og per J/S-bin), og cellen og scorekortet registrerer estimatoren. NWPR leser lavt med omtrent { "8" } dB × Bn·T under sløyfens egen jitter; M2M4 gjør ikke det.

seg-baf1a2422a66 = Også nytt:

seg-f36e22ff54c3 = <c1/> bygger scorekortene, rapporten og sammendraget på nytt fra cellene;

seg-aad7fcc28bc8 = <c1/> kontrollerer en testforholdsfil mot sitt skjema;

seg-c3e5e4461aaa = <c1/> importerer annotasjonene <c2/> i et SigMF-opptak som hendelser;

seg-c1a2ebb844c5 = Python får <c1/>, <c2/> og <c3/>;

seg-cd69258ccc09 = <c1/> får <c2/>, som er inkrementell og kan gjenopptas under samplingsbudsjettet per kall med hver fil begrenset til arbeidsmappen, og <c3/>.

seg-c398b66a7058 = Tester: <c1/> kjører en syntetisk kampanje med { "3" } opptak × { "2" } front-ends × { "2" } design. Scenene har oppgitte C/N0-profiler, og den dekker:

seg-3f2fbdecb101 = hver metrikk kontrollert mot den injiserte referansen;

seg-e103a30260db = gjenopptakelse etter en delvis kjøring med én arbeider og en ødelagt celle, byte-identisk med en uavbrutt kjøring med fire arbeidere;

seg-79164d8b0b22 = epokefiler per celle;

seg-9470016f056a = en regresjonstest for gjenfangst med { "20" } s og tre satellitter: med <c1/> på er hver kanal tilbake innen { "2" } s etter et opphold på { "2" } s; utfallet med <c2/> av er festet;

seg-1deb4ab83054 = terskler vurdert på nytt uten ny kjøring;

seg-351f9cdcbcd6 = CLI-en;

seg-2c35af369a36 = ignorerte kontroller av gjennomstrømning og minne i release-modus, inkludert et opptak på { "4" } GB ({ "5.45" }× sanntid, toppminne { "2" } MB over RSS ved start; målinger på én maskin, ikke terskler).

seg-efbaf5a00ea2 = Bare programvare: ingenting sender, og ingen bølgeform for interferens eller spoofing syntetiseres. Notater om design og som bygget: <c1/>.

seg-c9871226c82f = Sporingsmotor for lab replay ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Filer for sløyfedesign</em>: <c1/> TOML (<c2/>; parser <c3/>). Ett eller flere navngitte design setter hvert sløyfefelt:

seg-0437148324ca = bærebølgetype (PLL, FLL eller FLL-assistert PLL), ordener og båndbredder;

seg-4e722960f8c6 = diskriminatorer for PLL/FLL/DLL og bærebølgestøtte;

seg-44976e3ad4e7 = avstand og integrasjon;

seg-5c06173036d6 = låsterskler og C/N0-vinduer, og bitsynkronisering;

seg-405e693dd757 = tilstandsmaskinen for lås;

seg-e6908584e2f4 = fangsten ved overlevering (<c1/> eller eksplisitt).

seg-8844cc963705 = Design kan <c1/> hverandre. Ukjente nøkler avvises. Hvert oppløst design har en SHA-256-hash over en kanonisk JSON-form (nøkler sortert på hvert nivå, fast tallformat), slik at hashen ikke avhenger av feltrekkefølge; hver utdata registrerer den. Flater:

seg-5c32182634f7 = <c1/>, der eksplisitte flagg overstyrer designet og registreres;

seg-9356751a6b98 = <c1/>, som kjører hvert design i filen;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, kolonnen <c2/> i track-epoch etter <c3/>; Python-epokeordbøker). Estimatet fra andre og fjerde moment over de samme vinduene som NWPR, fra bare promptens effekt: NWPR leser lavt under sløyfens egen bærebølgejitter (omtrent { "8" } dB × Bn_PLL·T) og M2M4 gjør ikke det. På GPS L2C CM ({ "20" } ms, nominelt { "40" } dB-Hz, PLL { "1" } til { "10" } Hz) leser den { "39.93" } dB-Hz ved hver båndbredde mens NWPR faller fra { "39.55" } til { "38.22" }; på L1 C/A ved { "45" } dB-Hz leser den { "45.34" }. NWPR og hver annen utdata er uendret (en festing bit for bit). Den binære posten forblir på { "184" } bytes (verdien tar den reserverte flyttallsplassen og flaggbit { "6" }).

seg-c02d07475717 = Ekstra korrelatortaps (multikorrelator / SQM).

seg-70fcdc903413 = <c1/> (forskyvninger i chips fra prompt, positive tidlig; høyst { "16" }, hver innenfor ±{ "2" }) korrelerer ekstra replikaer ved siden av E/P/L og returnerer dem som <c2/> (<c3/> i designrekkefølge). Sløyfene bruker dem aldri. Nøkkelen utelates fra den kanoniske JSON-en når den er tom, slik at standarddesignets hash og hver utdata uten taps er uendret (<c4/> forblir; CSV/JSONL/binær uten taps er bit-identisk). Med taps: CSV/JSONL-kolonner, og en binær post på <c5/> bytes der headeren har <c6/>, slik at en gammel leser avviser filen i stedet for å tolke den feil. <c7/> (CLI), <c8/> (Python) og <c9/> (MCP <c10/>). Designene i én kjøring må være enige om taps.

seg-66d494267598 = <em>Parallelle kanaler</em> (<c1/> / <c2/>; Rust <c3/>). Hver delmengde av kanaler kjører på inntil N tråder (<c4/>; <c5/> forblir seriell). En kanals korrelasjon og tilstandsmaskin for lås berører bare den kanalen; dens epoker og hendelser bufres og skrives til sinkene i kanalrekkefølge, slik at utdata (CSV, JSONL, binær, hendelser, sammendrag) er byte-identiske med den serielle kjøringen for enhver N. Standard forblir { "1" } tråd. Målt på et opptak med 12 kanaler, { "4" } s, { "4.092" } MHz på { "4" } kjerner: { "19.5" } s seriell, { "11.5" } s ved { "2" } tråder, { "6.3" } s ved { "4" } ({ "3.1" }×; den første fangsten er seriell).

seg-cf59911d458f = <em>Eksport av fangstoverflate</em> (<c1/>; <c2/>, <c3/>). <c4/> (én PRN; CSV, JSON eller binær), Python <c5/> og MCP <c6/> <c7/> skriver hele korrelasjonseffektoverflaten Doppler × kodefase som søket beregner (cellene er <c8/> sine, bit for bit) med toppen og to finforfininger av Doppler: et parabolsk estimat og et finsøk på 1/16 bin (≈{ "5" } Hz ved { "4" } ms koherent, mot { "167" } Hz-bin). <c9/> selv og hver standard er uendret.

seg-a01bf371cc4f = <em>Strømmende epokeutdata</em> (<c1/>; <c2/>). Hver sløyfeoppdatering har:

seg-ff549f07ce78 = korrelatorene early/prompt/late;

seg-00457c1bb059 = alle tre diskriminatorutdataene;

seg-b17d335f6cac = NCO-tilstandene for PLL/FLL/DLL og bærebølgefasen;

seg-a3bf3f1034cd = PLI og låsflaggene;

seg-7912a72da79b = begge C/N0-estimatene og bitene;

seg-8d105d656041 = låstilstanden.

seg-6af6331255fb = Den skrives mens det skjer, som CSV, JSON Lines eller en versjonert binær form med lesere i Rust (<c1/>) og Python (<c2/>).

seg-aa081bfd9878 = <c1/> får <c2/>, <c3/> og <c4/> (<c5/>), og <c6/> får <c7/> og <c8/>. MCP <c9/> får <c10/>/<c11/> og bygger svaret sitt fra sammendraget med begrenset minne.

seg-8cb2f8b27bad = Heapen til en kjøring vokser ikke lenger med opptakets lengde: <c1/> måler den med en telleallokator ({ "6" }× lengden, samme topp innenfor { "64" } KiB), med en kontroll som viser at stien i minnet vokser.

seg-e3eff59db445 = Strømmet utdata er bit-identisk med gjenspillingen i minnet.

seg-c602902313f8 = <em>Låsetilstandsmaskin</em> (<c1/>, <c2/>): innfanging → låst → mistet → gjenfangst → innfanging, eller utfaset når et tap varer lenger enn <c3/> (standard { "30" } s). Mislykkede søk forsøkes på nytt hver <c4/> ({ "0.1" } s), jevnt fordelt, slik at gjentaksplanen legger til høyst { "0.1" } s til en målt gjenfangsttid. En valgfri tilbakeholdelse (<c5/> over <c6/>) er av som standard, og <c7/> er en valgfri grense ({ "0" }, ingen, som standard). Et avbrudd på { "2" } s på tre PRN-er ved { "4.092" } MS/s ender nå med at hver kanal er gjenfanget og låst. Med et budsjett på 3 forsøk ble hver kanal utfaset innen { "0.2" } s etter tapet.

seg-56bc109dbef9 = Terskler (<c1/>, <c2/>, Doppler-vinduet for gjenfangst) kommer fra utformingen. Hver overgang er en hendelse med sin årsak.

seg-b1c551e48389 = Kontrollen av falsk låsing søker i den sporede Doppler-verdien mot dens ±1/(2T) FLL/PLL-alias. Den fanger den falske låsingen som PR #38 målte (−{ "2400" } Hz sporet { "500" } Hz ved siden av). Med gjenfangst på ender kanalen låst på den innsatte Doppler-verdien.

seg-39409dd0b4bc = Et signalopphold på { "0.8" } s erklæres som tap og gjenfanges innen { "0.3" } s etter at signalet er tilbake.

seg-ce3162720ce5 = <c1/> (og tabellens kolonne) er tilstanden etter siste overgang, slik at en kanal som er utfaset etter sin siste sløyfeoppdatering, vises som <c2/>.

seg-520ab6d84a6c = <b>FLL-assistanse bare under innfanging</b> (<c1/>, standarden; <c2/> beholder den tidligere oppførselen bit for bit). FLL-en overleverer til PLL-en når den glattede PLI-en har holdt seg på eller over <c3/> ({ "0.8" }) i <c4/> ({ "0.1" } s), og går tilbake under <c5/> ({ "0.6" }). Når den ble stående på, brøt FLL-banen på { "10" } Hz faselåsen under omtrent { "38" } dB-Hz på rene signaler: ved { "35" } dB-Hz var faselåsandelen { "10" }–{ "16" } %, med en sann fasefeil på { "38" }–{ "41" }°. Med portstyring holder standarden { "100" } % ved { "35" } dB-Hz med { "4.5" }°, det samme som en PLL alene. Innfanging fra en overleveringsfeil på { "100" } Hz er uendret. Evidens med terskler fastsatt på forhånd: <c6/>. <b>Standardsløyfene er derfor ikke bit for bit like tidligere kjøringer av standardutformingen.</b> Bruk <c7/> for å gjenskape dem. Kjent grense: ved { "35" } dB-Hz skjer overleveringen { "1.9" }–{ "2.6" } s ut i sporingen, og ved { "33" } dB-Hz holder FLL-en på { "10" } Hz PLI-en under overleveringsterskelen, slik at innfangingen aldri fullføres.

seg-1a911b958f8e = Nye nøkler for sløyfeutforming og nytt API, oppført:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, der <c5/> er endret fra en standard på { "3" } til en valgfri grense (standard { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = Utformingens hash er beregnet over en kanonisk JSON-form, og hashen til den innebygde standarden er <c1/> (festet av en test).

seg-2405be1bc0c6 = Merknader om utdatakompatibilitet:

seg-77670b7dd608 = tabellen fra <c1/> har en avsluttende kolonne <c2/>;

seg-a52d9bbdd1a4 = CSV-en fra <c1/> har en avsluttende kolonne <c2/>, og JSON-en har <c3/> og <c4/>;

seg-3fa0f9243806 = sveipets <c1/> er nå gjennomsnittet over hver oppdatering som har et NWPR-estimat (oppsummering med begrenset minne), ikke lenger over andre halvdel av kjøringen.

seg-d542c1616f35 = Gjenfangst er <b>av i den innebygde standarden</b>, der tilstandsmaskinen bare observerer og sløyfene kjører bit for bit som uten den. (Selve standardsløyfene er likevel endret: se FLL-assistanse ovenfor.) Slå den på per utforming (<c1/>), med <c2/>, eller med <c3/>.

seg-61d6b3122888 = En <b>advarsel om <c1/></b>: når fs ligger innenfor { "1e-6" } av et multiplum av halve brikkehastigheten (<c2/>), advarer <c3/>/<c4/> (utdata, <c5/>, sveip-JSON), MCP-svaret fra <c6/> og Python-resultatet fra <c7/> om at jitter og bias i kodesløyfen ikke er representative. Grunnårsaken er dokumentert med terskler fastsatt på forhånd i <c8/>. Ved nøyaktig { "2" } sampler per brikke med 0.5 brikkes avstand er DLL-S-kurven ett enkelt trinn og sløyfen dirrer: ≈ { "0.09" } brikke RMS kodefeil (≈ { "26" } m) ved { "45" } dB-Hz, mot ≈ { "0.004" } brikke ved en ikke-kommensurabel hastighet. Den omtrent { "2" } dB lave NWPR C/N0 ved den hastigheten har samme årsak. Ved nøyaktig { "0" } Hz kode-Doppler og { "4" } sampler per brikke krysser koden aldri dødsonen på ±0.21 brikke, slik at en kodefasebias på opptil omtrent { "0.2" } brikke kan bestå uten å vise seg i jitteren (målt: 0.5 brikkes avstand gir { "2.0" }× kontrollens kodefeil med et gjennomsnitt på +{ "0.011" } brikke; 0.25 brikkes avstand gir +{ "0.125" } brikke); advarselen dekker hastigheten.

seg-8fbfb3f0bee2 = <b>Kjent grense: standardutformingen overleverer ikke fra FLL til PLL under omtrent { "35" } dB-Hz</b> (et innfangingsgulv på ~{ "35" } dB-Hz; se FLL-assistanse ovenfor og <c1/>).

seg-43f02bc861be = Et søk etter falsk låsing eller gjenfangst som ikke kan kjøres (en hastighet uten et helt antall sampler per kodeperiode) stanser ikke lenger sporingen.

seg-14f4e9edc443 = Tester: <c1/>, <c2/>, <c3/>, <c4/> og MCP IQ-rundturen.

seg-60141bb08f64 = C/N0-profiler i syntetiske scener ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> planlegger tidsvarierende C/N0 per satellitt i Kshanas egne scener, som dB-forskyvninger i forhold til scenens C/N0. Former: trinn, rampe, stykkevis lineær, og seedet scintillasjonslignende Rice-fading med oppgitt S4 og dekorrelasjonstid. De anvendes gjennom den eksisterende kanalkroken i scenen (<c2/>, og kan kombineres med effektene fra ionosfære, troposfære, scintillasjon og flerveisutbredelse), uten endring i scenekjernen. Referansefilens <c3/> følger profilen.

seg-548eeca516ff = Flater: <c1/> og <c2/>.

seg-a242e4d9f071 = Hva den brukes til: sløyfer, monitorer og kampanjescoring kan stresstestes mot en kjent referanse. Den endrer bare styrken til de legitime signalene.

seg-ff4df7c343dc = Kontroller (<c1/>). Terskler: gjennomsnittlig fadingintensitet innenfor { "5" } % av { "1" }, S4 innenfor { "8" } % av målet (ved S4 = { "0.3" }, { "0.7" } og { "1" }), intensitetskorrelasjon over { "0.9" } ved { "0.05" } τ og under { "0.05" } ved { "5" } τ; referansen nøyaktig den oppgitte C/N0 pluss profilen; et sporet fall i NWPR C/N0 innenfor { "0.7" } dB av et trinn på { "6" } dB. Målt: S4 innenfor { "1.3" } % av målet, og et sporet fall på { "6.26" } dB.

seg-e214458cd1b6 = <b>Deteksjonsmonitorer på IQ-banen ({ "0.34.0" } «Lab replay»).</b> Ny modul <c1/>, kommando <c2/> og binding <c3/>. De observerer en opptaking og rapporterer tidsserier pluss flaggede hendelser (start-, alarm- og sluttidspunkt, topp, terskel). De oppdager og måler bare; ingenting her genererer et signal.

seg-5b05b2a54fab = <b>Totaleffekt / AGC</b>: blokkeffekt og forsterkningen en ideell AGC ville brukt; flagger stigninger og fall.

seg-2a84a640d7f1 = <b>Spektrum før korrelasjon</b>: Welch-PSD per blokk mot en innlært grunnlinje. Terskelen for overskudd kommer fra et mål for falsk alarm. Også kompleks kurtose og en pulsdetektor. Pulsdetektoren teller samplene over en terskel i hver blokk og utløser en hendelse når den eksakte binomiale øvre halen for det antallet er under <c1/> (standard { "1e-4" } per blokk), ikke når en z-score passerer en grense: ved de små forventede antallene i korte blokker er et enkelt sample allerede flere sigma.

seg-7704ac807c38 = <b>C/N0 per kanal</b>: to ensidige CUSUM-endringsdetektorer (fall og stigning), matet med uavhengige estimater (steget settes ut fra sløyfens C/N0-vindu).

seg-f965a68d388b = <b>SQM fra korrelatorene</b>: delta <c1/> og forhold <c2/>, pluss asymmetritester fra ekstra korrelatorer når en kanal leverer dem.

seg-a4006c2e8692 = <b>Låseindikatorserier</b>: PLI og en frekvenslåseindikator fra påfølgende prompt-verdier, som rå signaler. Avgjørelsene om lås og tap av lås blir hos sporingsmotorens låsetilstandsmaskin.

seg-da72318f44cc = Ett strømmende gjennomløp (<c1/>) kjører alt, med en TOML/JSON-innstillingsfil (<c2/>); kampanjekjøreren bruker samme inngangspunkt. Alt er MODELLED. Hver statistikk er kontrollert mot sin lukkede form ved seedet simulering (<c3/>):

seg-0ff96e4c5a20 = overskridelser av blokkeffekt mot gammahalen;

seg-97b559ea0897 = kurtose med gjennomsnitt { "2" } og spredning <c1/>;

seg-2b941c702b7f = pulsandel <c1/>;

seg-e8f068c41f0c = CUSUM-løpelengder mot Siegmunds tilnærming (målt { "330" } og { "8.46" } sampler mot { "338" } og { "8.34" });

seg-e2cd6a55e49b = faselåseindikatoren mot gjennomsnittet for Rice-fase;

seg-06291b1c6274 = på et sporet C/A-signal avviker SQM-delta og -forhold med omtrent { "6" } % fra de førsteordens lukkede formene (målt { "5.97" } %; testterskel { "12" } %).

seg-12deb36a2e3a = Formelen for falsk alarm ved spektralt overskudd er en tilnærming; den målte raten var { "1.3" }× formelen. Fra ende til ende flagger monitorene:

seg-b002c66c7881 = et C/N0-trinn på { "6" } dB (endringstidspunkt innenfor ett estimat);

seg-2e828d106393 = en reflektert bane som dukker opp midt i opptaket (forholdstest);

seg-68063f036e2c = et signalbortfall (PLI faller fra { "0.999" } til −{ "0.3" } og FLI fra { "0.93" } til { "0.03" } under det);

seg-0cd95f0197ec = en smalbåndstone og spredte samples med høy amplitude (spektral-, puls- og kurtosetester). Dette er generelle DSP-testinndata, ikke interferensmodeller.

seg-7128b9000cc2 = <c1/>/<c2/> strømmer gjennom den nye sesjonen (se Lagt til).

seg-98891d33e48c = <c1/> beholder sine { "0.32" }-kolonner, men strømmes nå, slik at rader fra flere kanaler flettes i tidsrekkefølge i stedet for å grupperes per kanal. <c2/> beholder sin { "0.32" }-form og holder fortsatt hver epoke i minnet: bruk <c3/> for lange opptak.

seg-2ef2d5771ade = <c1/> måler jitter over oppdateringene i andre halvdel av kjøringens varighet (tidligere andre halvdel av antall oppdateringer), og CSV/JSON får en kolonne <c2/>.

seg-f23b6db96748 = Sporingstabellen får en kolonne <c1/>.

seg-a5769fbc201e = Bruksteksten hevder ikke lenger at <c1/> tar frontend-flaggene; bare <c2/> bruker dem.

seg-cf28fa21786a = Pythons <c1/> har nå <c2/> og <c3/> som standard satt til <c4/> (utformingens verdier, { "1" } og { "5000" } Hz i den innebygde utformingen). Epokene får tidlig/sen-korrelatorene, <c5/>, <c6/>, <c7/> og <c8/>, og resultatet får <c9/> og <c10/>.

seg-666b9e3faa5d = <b>Standard fangsttrinn gir ikke lenger Galileo E1-sporingen en restfeil som FLL-en ikke kan fange inn.</b> Trinnet <c1/> etterlater opptil <c2/> Doppler-feil ved overlevering, men standard tokvadrants FLL fanger bare inn <c3/>. For hver kode på { "4" } ms eller lengre (<c4/>), inkludert Galileo E1-B og E1-C, lå resten ({ "83.3" } Hz ved { "4" } ms) utenfor innfangingen på { "62.5" } Hz, og sporingen låste seg falskt på +{ "125" } Hz, med en faselåseindikator på { "0.97" } som skjulte det. Standardtrinnet er nå også begrenset til <c5/> (<c6/>), { "0.8" } av innfangingen, slik at overleveringen holder seg innenfor den selv når nabo-bin-en vinner. ({ "0.4" } ble prøvd først: det låste seg falskt { "1" } kjøring av { "42" } på E1-B, og et koherent GPS L1 C/A-søk på { "1" } ms valgte en bin { "350" } Hz ved siden av og låste på +{ "500" } Hz; { "0.25" } og { "0.2" } hadde ingen i de samme kjøringene.) Kostnad: Galileo E1-B/E1-C går fra bin-er på { "166.7" } Hz til { "50" } Hz, { "201" } bin-er over ±{ "5" } kHz i stedet for { "61" }; kodene på { "1" } ms ({ "166.7" } Hz, <c7/>) er uendret. <c8/> i en sløyfeutforming betyr dette; en eksplisitt <c9/> eller <c10/> brukes som skrevet, og <c11/> (ingen sporingsoverlevering) beholder lærebokstrinnet. Epokeheaderen og <c12/> registrerer nå det løste trinnet og sløyfebåndbreddene for hver kanal (<c13/>). Standardutformingens hash er uendret. Endring i utdata: deteksjoner på koder på { "4" } ms og lengre kan havne i andre Doppler-bin-er.

seg-9150dc89e186 = <b>GPS L2C CM ({ "20" } ms sløyfeoppdatering) holder lås med standardutformingen.</b> Standard PLL på { "15" } Hz og FLL på { "10" } Hz har <c1/> på { "0.3" } og { "0.2" } ved T = { "20" } ms, og sløyfen mistet låsen selv fra en perfekt start (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Ny utformingsnøkkel <c2/> (standard { "0.1" }) begrenser støybåndbreddene til PLL og FLL til <c3/> når sløyfens oppdateringstid er lengre enn { "4" } ms (<c4/>): { "5" } Hz og { "5" } Hz ved { "20" } ms, { "10" } Hz og { "10" } Hz ved BeiDou B1C sine { "10" } ms; kodene på { "1" } ms og { "4" } ms beholder { "15" } og { "10" } Hz. Den gjelder også eksplisitte båndbredder; <c5/> slår den av. Nøkkelen utelates fra den kanoniske formen ved standardverdien, slik at standardhashen er uendret; en utforming som setter en annen verdi, har en annen hash. Ved { "45" } dB-Hz gir L2C CM nå PLI { "0.996" }, Doppler-feil { "0.00" } Hz og M2M4 { "42.71" } dB-Hz. Kjent åpent punkt: NWPR C/N0 leses { "1.76" } dB for lavt der (og { "2.45" } dB for lavt på B1C ved { "10" } ms), så matrisens T5 for L2C forblir et ignorert funn.

seg-74517bee3f6f = <b><c1/> generert på nytt: den innsjekkede figuren var utdatert mot sitt eget scenario (en dataendring, ikke en ny tegning).</b> Diagrammet ble tegnet 2026-06-02 fra <c2/>; to dager senere satte 67fed19e gulvene for flicker-FM i det scenarioet (kvante <c3/>, CSAC <c4/>), og figuren ble aldri tegnet på nytt. Den viste kjøringen før gulvene: y-akse fra { "0" } til { "47" } ns, CSAC-avbrudd p95 per kjøring på { "10.5" } til { "47.6" } ns (gjennomsnitt { "25.2" } ns), klassisk holdover { "4050" } s i gjennomsnitt. Scenarioet slik det leveres (og slik veiledningen og CLI-oppsummeringen allerede oppgir) gir y-akse fra { "0" } til { "407" } ns, CSAC p95 per kjøring { "40.8" } til { "374.0" } ns (gjennomsnitt { "167.0" } ns), klassisk holdover { "844" } s [{ "220" } til { "2130" } s]; spesifikasjonslinjen på { "20" } ns ligger på de samme { "20" } ns på en akse som er omtrent ni ganger høyere. Motoren er uendret: dagens motor på scenariofilen fra juni gjengir den gamle figurens akse nøyaktig. Figuren er ikke referert fra README eller dokumentasjonen.

seg-75636f9419b2 = Kjente begrensninger

seg-2c607b56048e = <b>NWPR C/N0 leses for lavt ved høy C/N0·T per prompt, og BOC({ "1,1" }) ved { "5" } MS/s taper omtrent { "1" } dB.</b> NWPR er forventningsrett på ideelle prompt-verdier, men sløyfens egen PLL-jitter koster omtrent { "8" } dB × Bn·T etter tilpasning (én scene, fire punkter: −0.24/−0.44/−0.77/−{ "1.58" } dB ved 1/2.5/5/10 Hz og { "20" } ms; omtrent −{ "1" } dB ved standard <c1/>); M2M4 er ufølsom. BeiDou B1C-data ved { "5" } MS/s taper også omtrent { "1" } dB prompt-effekt på grunn av båndbegrensning (bruk { "10" } MS/s eller mer). Ingen av delene er en estimatorfeil; radene T5 i signalmatrisen for GPS L2C og BeiDou B1C forblir ignorerte funn med disse årsakene.

seg-ff195e575023 = <b>Diagramtekst og Studioets overtakelse av diagrammer er herdet.</b> Tekst som et scenario fører inn i et generert diagram, escapes nå konsekvent av én felles rutine, og Studio overtar bare tegnemarkering fra et diagram. Studioets adresseparametere, oppslag etter type og scenariohentinger er begrenset til kjente verdier. Medfølgende diagrammer, registrerte resultater og publiserte tall er uendret. Oppgradering anbefales for alle som åpner scenariofiler fra ikke-pålitelige kilder i Studio eller bygger genererte diagrammer inn i nettsider. Sikkerhetsvarsel: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>Omfanget av interferens og spoofing i IQ-laget, oppgitt riktig.</b> Oppføringene for { "0.31.0" } og { "0.32.0" } nedenfor sier at IQ-laget legger til «ingen syntese av interferens- eller spoofingbølgeformer». Det stemmer for selve IQ-laget (<c1/> genererer bare legitime GNSS-signaler), men det ble lest som en påstand om hele motoren, og det er den ikke: siden { "0.29.0" } skriver delen <c3/> i typen <c2/> et SigMF-øyeblikksbilde av sin analytiske modell med de konfigurerte jammerne i (støylignende jammere bin for bin, toner og chirps som bølgeformer), og <c4/> summerer et autentisk signal og en spoofer-kopi i minnet for å teste sløyfefangst (sammensetningen skrives aldri ut). Motoren har også hatt en programvare-GNSS-mottaker siden { "0.20.0" } (<c5/>: fangst og sporing; siden { "0.31.0" } også <c6/> og <c7/>). Ingenting i Kshana sender eller styrer radiomaskinvare. Statuslinjen i README, <c8/>, <c9/> og IQ-designnotatene sier nå dette; de utgitte oppføringene er latt stå slik de ble publisert. Ingen endring i oppførsel.

seg-61befd8b474d = <b>Kjent begrensning: kommensurabel sampling.</b> Ved en samplingshastighet som er et heltalls- eller halvtallsmultiplum av brikkehastigheten, ligger samplene på de samme brikkefasene i hver brikke, og kodediskriminatoren blir en trapp. På et syntetisk GPS L1 C/A-signal ved { "45" } dB-Hz med 0.5 brikkes avstand gir { "2.046" } MHz ({ "2" } sampler/brikke) ≈ { "0.09" } brikke (≈ { "26" } m) RMS kodefeil og en bias på −{ "0.09" } brikke, mot ≈ { "0.003" } brikke ved en ikke-kommensurabel hastighet. NWPR C/N0 leses ≈ { "2.4" } dB for lavt der. Ved { "4.092" } MHz avhenger det av avstanden og kode-Doppler. Ved { "0.5" } brikke er det harmløst ved { "1500" } Hz Doppler, men { "2" }× med en bias på { "0.011" } brikke ved { "0" } Hz, og ved { "0.25" } eller { "0.1" } brikke er det { "8" }–{ "10" }× kodefeilen. Bærebølgesporing påvirkes ikke. <c1/> har målingene.

seg-3a30bd47380a = GNSS IQ-laget på MCP-serveren (fase B.1).

seg-ef81eca03bca = <c1/> får seks verktøy som styrer laget <c2/> fra en agent: <c3/> (de godtatte signalnavnene og IQ-oppsettet), <c4/> (beskriv en opptaking), <c5/> (generer en scene med oppgitt profil eller kringkastet efemeride, med den valgfrie kanalen på signalnivå), <c6/> (FFT-fangst, eventuelt bak frontend-trinn), <c7/> (fang, deretter DLL/PLL/FLL-banken) og <c8/> (båndpass, notch, blanking, ekskisjon, AGC, kvantiserer). IQ-sampler krysser aldri protokollen: hvert verktøy tar filbaner innenfor én arbeidsmappe satt av <c9/> (usatt slår IQ-filverktøyene av og lar alle andre verktøy være upåvirket), avviser baner som løses utenfor den og utdata som allerede finnes med mindre <c10/> er satt, håndhever et samplebudsjett per kall (<c11/>, standard { "50 000 000" }) før noe arbeid, avviser ukjente argumenter, og svarer med en kompakt JSON-oppsummering (deteksjoner, C/N0, låsetilstand og hver skrevet fil med bytetall). Utdata per epoke går bare til filer som kalleren navngir. Verktøyene kjører den samme kodebanen som CLI-en gjennom et nytt offentlig skjøtepunkt, <c12/>, som returnerer CLI-ens melding i stedet for å skrive den ut (stdout er MCP JSON-RPC-kanalen); <c13/> og <c14/> er nå også offentlige. Bare programvare og additivt: IQ-laget legger ikke til noen syntese av interferens eller spoofer, ingenting sendes noen gang, og det er ingen nye avhengigheter. <c15/> deklarerer de to miljøvariablene. Rundturstester i <c16/> genererer en kort scene med to satellitter og kontrollerer fangst mot scenens egen referansefil, sporingslås og C/N0, frontend, SigMF-utdata, budsjettet, baneavgrensning og avslått tilstand.

seg-6963f3fa1db7 = <b>GNSS IQ-laget i valideringsregisteret.</b> En kryssjekk fastsatt på forhånd mot gps-sdr-sim (en uavhengig GPS L1 C/A-basebåndgenerator, MIT, commit 28ca29a6) er nå en del av den alltid påslåtte testsuiten (<c1/>). Den innsjekkede referanseutdataen (<c2/>: { "20" } ms av gps-sdr-sims egen 8-bits I/Q, kanallisten og kanaltilstanden bak den fra en testrigg lenket mot samme bygg) genereres på nytt av <c3/>. Ingenting ved testtidspunktet trenger nettverk eller det eksterne verktøyet. To registerrader er lagt til ({ "251" } rader: { "124" } Validated, { "123" } Modelled, { "4" } Partner):

seg-21d005e2ef0e = <em>Signalgeometri i GNSS IQ-scene mot en uavhengig basebåndgenerator</em>: <b>Validert</b>. Scenens referanse (synlig sett, pseudoavstand, kodefase, Doppler, siktevinkler) for en scene med kringkastet efemeride stemmer med gps-sdr-sims kanaltilstand på alle { "11" } kanaler: verst { "1.6" } mm, { "5.5e-6" } brikke, { "7.4e-5" } Hz, { "4e-9" } grad, mot terskler på { "0.05" } m, { "2e-4" } brikke, { "0.02" } Hz og { "1e-4" } grad fastsatt før kjøringen.

seg-5c8858182d41 = <em>GNSS IQ-fangst på uavhengig genererte I/Q-sampler</em>: <b>Modellert, med et funn</b>. <c1/> finner hver simulerte satellitt i gps-sdr-sims sampler innenfor de registrerte terskelene (kodefase innenfor { "0.195" } brikke, Doppler innenfor { "72" } Hz). Den registrerte terskelen «ingen annen PRN oppdaget» svikter likevel: på gps-sdr-sims støyfrie utdata krysses terskelen for gaussisk støy av de andre satellittenes krysskorrelasjon for alle { "21" } fraværende PRN-er. Den strenge testen er beholdt, ignorert med funnet, og en festet test registrerer det. Ingen motorkode eller offentlig API endres. I/Q-samplene sammenlignes ikke sample for sample: gps-sdr-sims heltallssinustabell, forsterkninger, nullstilte startfase for bærebølgen og avkortede LNAV-felt er ikke størrelser en mottaker trenger å være enig om. Sammenligningen gjøres på de observablene en mottaker måler.

seg-a2be63287ce4 = <b><c1/> overleverer som standard fra en fangst på ≈{ "4" } ms (endring i oppførsel).</b> Fangsten som initialiserer hver sporingskanal integrerer nå <c2/> kodeperioder koherent i stedet for én, der <c3/> er kodens fulle periode (primær- ganger sekundærlengde for en lagdelt kode, enheten fangsten integrerer over). De ulagdelte kodene på { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) søker nå over { "4" } perioder ({ "4" } ms), slik at standard Doppler-trinn <c4/> er ~{ "167" } Hz i stedet for ~{ "667" } Hz. Hver kode hvis fulle periode allerede er { "4" } ms eller lengre, beholder { "1" } periode: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms), og de lagdelte kodene GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q og E1-C ({ "10" } til { "100" } ms med overleggskodene), og GPS L2C. Hvert signal integrerer dermed minst ~{ "4" } ms. Et søk over én periode kunne overlevere en kanal opptil ~{ "333" } Hz feil, utenfor FLL-ens innfanging, og den sporet da en falsk lås ~{ "500" } Hz unna mens den rapporterte et rent spor. På et seedet sveip av { "180" } GPS L1 C/A-kanaler (Doppler over ±{ "5" } kHz, { "38" } til { "47" } dB-Hz, halvparten med navigasjonsdata; <c5/>, kan kjøres på nytt) faller falske låsinger fra { "27" } av { "180" } til { "1" } av { "180" } og mislykkede fangster fra { "102" } til { "11" }, mot ~{ "40" } ms mer søk per PRN på GPS L1 ({ "11" } → { "52" } ms). Den ene gjenværende falske låsingen er ved { "38" } dB-Hz, { "36" } Hz ved siden av. Alle flater er enige: <c6/> og <c7/> (<c8/>), Python <c9/> (<c10/> er nå auto; stub oppdatert) og MCP-verktøyet <c11/>. Brukere som stolte på den gamle standarden, kan oppgi <c12/> (<c13/>). Standarden for <c15/> i <c14/> forblir { "1" }. Nye offentlige <c16/> og <c17/>; regresjonstest <c18/>.

seg-52768eb8e3d5 = <b>Hver generert grafikk følger nå nettstedets Observatory-tema: bytene i hvert diagram endres.</b> Dette er en bevisst revisjon av de publiserte figurene, bare farger og skrifter; ingen plottet verdi, koordinat eller etikett er flyttet. Hvert scenarios <c1/> (og dermed Studioets diagrameksport og demodiagrammene i README), rapport-HTML-en fra kjøringen (<c2/>), tidslinjeanimasjonen (<c3/>), HTML-sidene for scenarioresultat og studie, valideringsoppsummeringen og figurene og diagrammene i dokumentasjonen brukte den varme, mørke julipaletten (<c4/> bakgrunn, <c5/> gull) og et varmt papirtema for rapporter. De henter nå hver farge og skrift fra én modul, <c6/>, som speiler <c7/>: diagrammer tegnes instrumentmørkt på Observatory-bakgrunnen (<c8/>) i Geist-skriftstabelen; rapporten, animasjonsspilleren og resultatsidene følger seerens lys/mørk-preferanse med Observatory-tokenene for lys og mørk. De seks feildomenene beholder én farge hver (interferens korall, spoofing magenta, tidssynkronisering blå, baner cyan, integritet lime, navigasjon rav), og evidensnivåene leses validated lime, modelled rav, partner magenta. Fossefallsrampene beholder sin perseptuelle (inferno) rekkefølge, forankret på nytt i den nye bakgrunnen.

seg-d967e354a966 = <c1/> holder modulen til <c2/> i begge temaene, kontrollerer at <c3/> og <c4/> (begge generert fra modulen, for Python-figurverktøyene og mermaid-cli) er oppdaterte, og feiler hvis en hex-fargekonstant dukker opp i <c5/> utenfor paletten.

seg-fa3e60422ca5 = <c1/> får en tredje diagnose, «bare farger og skrifter er flyttet», slik at en palettrevisjon kan skilles fra en flyttet plottet verdi. Hvert README-diagram som er tegnet på nytt, ble kontrollert som lik forgjengeren under den normaliseringen.

seg-3bc4056fd57e = <c1/> leser paletten og genererer nå også de tre resultatfigurene i README som ikke hadde noen innsjekket generator (<c2/>, <c3/>, <c4/>), med ekte tekstelementer, fra <c5/>, resultatet fra <c6/> og <c7/>. <c8/> leser den samme paletten, noe som retter opp avviket i lyst tema fra nettstedet. Verdiene i <c9/> er kolonnen for verste tilfelle for <c10/> i den testdatafilen ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } og { "4.12e-6" } km), uendret fra Matplotlib-figuren, og <c11/> feiler nå hvis den innsjekkede figuren og testdatafilen er uenige.

seg-3196836a2a0d = <b><c1/> oppdatert til gjeldende data (en dataendring, ikke en ny tegning).</b> Figuren oppga { "28" } funksjoner fordelt på { "8" } domener ({ "11" } validert, { "17" } modellert), utdatert mot sin egen oppgitte kilde; tegnet nå av sin nye generator fra <c2/> viser den { "46" } funksjoner fordelt på { "8" } domener ({ "17" } validert, { "29" } modellert).

seg-55d5b16379aa = <b>Q for CW/smalbåndsjammer er nå { "1.0" }, ikke { "1.5" }.</b> Lærebokverdien for en tone på bærebølgen er { "1" } (en tone beholder signalets spektrale topp, <c1/>, <c2/>); den gamle verdien { "1.5" } gjorde en tone mindre skadelig enn bredbåndsstøy ved lik J/S. Endring i utdata: omtrent −{ "1.8" } dB effektiv C/N0 under CW/smalbåndsjammere ved høy J/S i typene <c3/>, <c4/> og interop (tonen i det medfølgende eksempelet <c5/>: { "17.98" } dB-Hz fra tabellen, var { "19.74" }). Q for bredbånd forblir { "1.0" } (konservativt, omtrent { "3" } dB under lærebokverdien ~{ "2" }) i påvente av gjennomgang i { "0.34" }. Sett <c6/> for å beholde den gamle verdien { "1.5" }.

seg-99fab1936170 = <b>Heltallsutdata fra <c1/> bruker heltallsområdet.</b> Med støy med enhetseffekt og en skriveskala på { "1" } ble scenene i <c2/>/<c3/> omtrent { "{" }-1, { "0" }, { "1" }{ "}" }, og 2-bits scener hadde sine terskler ved { "2.8" } sigma. Heltallsformater skaleres nå slik at forventet RMS per komponent er en fjerdedel av full skala ({ "31.75" } LSB i ci8, { "8191.75" } i ci16) eller { "2" } LSB i 2-bit. Skalaen og antallet avkortede elementer skrives ut og skrives til sidefilen. Utdata i flyttall er uendret.

seg-696109ae70f8 = <b>Åtte festede testdatapunkter i sju testfiler feiler ikke lenger på macOS på grunn av forskjeller i siste bit</b> (del av issue #36). Festene som kontrollerer at motoren fortsatt bygger en uavhengig referanses innsjekkede inndata (Jacobian-matriser, en tilstandstabell, utskytningsazimuter) ble sammenlignet bit for bit og feilet på macOS arm64 med { "2" } til noen tusen enheter i siste siffer. De sammenlignes nå innenfor { "1e-12" } av en skala hentet fra testdatafilen; heltall, nøkler og lengder sammenlignes fortsatt eksakt, og en mutasjonstest viser at en relativ endring på { "1e-6" } fortsatt feiler. Festet for utskytningsazimut sammenligner <c1/> og grenen stigende/synkende i stedet for selve azimuten, fordi <c2/> forsterker én ulp av argumentet til omtrent { "3e-9" } rad der en inklinasjon er lik et steds kobreddegrad. Ingen toleranse for en uavhengig referanse og ingen terskel fastsatt på forhånd er endret. To tester (felles banebestemmelse for månen, observerbarhet for månen) er ikke dekket: på macOS flytter selve sammenligningene som er fastsatt på forhånd, seg, og det overlates til en oppfølging.

seg-b6c354fa0c28 = <b><c1/> og <c2/> bruker frontend-flaggene.</b> Bruksteksten oppga <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> på <c9/>, men <c10/> og <c11/> bygde aldri kjeden: flaggene ble stille ignorert, og et flagg uten verdi, som <c12/>, svelget flagget etter seg. Begge kommandoene tolker dem nå slik <c13/> gjør, og setter en fersk frontend-kjede foran fangstgjennomløpet og sporingsgjennomløpet. Utdataene er lik det du får ved å kjøre kommandoen på filen som <c14/> skriver for de samme flaggene.

seg-d7238dab610e = IQ-scenedata plasseres per signal.

seg-46ace9a3e008 = <c1/> (og <c2/>) la bits på { "50" } bit/s på hvert signal, også pilotene, og med GPS LNAV-hastighet på Galileo og BeiDou. Data følger nå hvert signals egen symboltiming, oppgitt av den nye <c3/> (<c4/>, satt av hver konstruktør i <c5/>). Det er { "10" } ms på L5-I5, { "4" } ms på E1-B, { "2" } ms på BeiDou B1I GEO (D2), og bits på { "20" } ms med en meander på { "10" } ms på GLONASS L1OF. Data avvises på piloter, på GPS L2C som én CM/CL-strøm, og <c6/> på alt unntatt L1 C/A. Egendefinerte koder beholder den tidligere timingen på { "20" } ms som standard. En programmatisk <c7/> som ba om <c8/> på en annen kode enn L1 C/A, eller <c9/> på en pilot, genererte tidligere stille og returnerer nå en feil ved første lesing.

seg-9dd38fa39d14 = GLONASS L1OF-kanaler fanges og spores på sin egen FDMA-bærebølge.

seg-a775751ed6f6 = <c1/> og sporingskanalene mikset hver kode ned fra <c2/> alene. I et GLONASS-opptak med flere kanaler fant derfor et søk etter kanal +{ "3" } signalet til kanal { "0" } (alle kanaler deler én avstandskode) og så aldri { "1.6875" } MHz høyere. Begge bruker nå <c3/>. Bærebølgeleddet er null for ethvert opptak sentrert på signalets egen bærebølge og utelates når senteret er ukjent, slik at CDMA-behandlingen er uendret. Hvis du omgikk den gamle oppførselen ved å legge <c4/> inn i sidefilens <c5/>, fjern det leddet: forskyvningen anvendes nå fra bærebølgen og senteret, så å la det stå anvender den to ganger. Kjent begrensning, uendret her: en GLONASS-scene identifiserer hver satellitt ved frekvenskanalen <c6/>, og satellitt-ID-en av typen <c7/> bryter rundt for en negativ kanal. Referansesidefilen skriver <c8/> som <c9/> { "4294967289" } (<c10/>). Les den tilbake som <c11/> med en <c12/>-konvertering.

seg-1c88bffc605b = <b>GNSS IQ-laget på CLI og Python ({ "0.32.0" } fase A).</b> Den eksisterende modulen <c1/> kan nå brukes uten å skrive Rust. Fem nye kommandoer under <c2/> kommer inn i datahåndteringsgruppen: <c3/> genererer en lang IQ-scene med flere satellitter til en fil med en sidefil for referansen; <c4/> kjører FFT-fangst av én eller flere PRN-er over et opptak og rapporterer hver deteksjon (PRN, Doppler, kodefase, statistikk, terskel); <c5/> fanger og kjører deretter DLL/PLL/FLL-banken over et opptak og gir sporingsutdata per epoke (CSV/JSON) med konfigurerbare sløyfebåndbredder, integrasjonstid og korrelatoravstand; <c6/> spiller av ett opptak over flere sløyfeutforminger og rapporterer resulterende jitter- og låsemålinger per utforming; og <c7/> tilpasser modellen for tap av lås i sporingssløyfen til en tidslinje for mottakertillit. Den samme kjernen er eksponert for Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>) og returnerer NumPy-vennlige lister og ordbøker. Bare programvare og additivt: ingen nye avhengigheter, ingen sending, ingen syntese av interferens- eller spoofingbølgeformer; motoren, fangsten, sporingen og sløyfeutformingene er crate-ens egne, så en CLI- eller Python-kaller får de samme bitene som Rust-testene. Ny modul <c13/>; scenens egen referansefil er den uavhengige referansen i <c14/> (fangsten gjenfinner hver innsatte kodefase og Doppler, sporingen konvergerer mot den innsatte Doppler-verdien). Ingen publisert antall scenariotyper og ingen rad i verifikasjonsmatrisen endres.

seg-1971e3e9cfe6 = <b>Gjenværende GNSS IQ-bibliotekfunksjoner i CLI-en <c1/> og Python ({ "0.32.0" } fase A.2).</b> Bygger på fase A og gjør resten av laget <c2/> tilgjengelig uten å skrive Rust:

seg-67c485097357 = <b>Utbredelseskanal på <c1/></b> (og Python-funksjonen <c2/>): en førsteordens ionosfære (<c3/>/<c4/> eller <c5/>), Saastamoinen/Niell-troposfæren (<c6/>), Cornell-scintillasjonsmodellen (<c7/>, <c8/>, <c9/>), speilende flerveisutbredelse fra bakken (<c10/>/<c11/>), landmobilkanalen med tre tilstander (<c12/>) og en blokk uten fri sikt (<c13/>) gjelder for hver satellitt gjennom en ny crate-intern bro (<c14/>) som konverterer kanalmodellenes absolutte baner til scenens form for overskudd i forhold til geometrien.

seg-d736671f2251 = <b>SigMF-utdata på <c1/></b> (<c2/>): skriver samplene som et par <c3/>/<c4/> med en opptaking og annotasjoner per satellitt; <c5/>/<c6/> leser allerede SigMF, så en scene går rundt uten tap.

seg-c59ae97779ae = <b>Frontend-DSP</b>: en ny kommando <c1/> og de samme flaggene på <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) kjører trinnene i <c10/> (båndpass-FIR, adaptivt notch, pulsblanking, ekskisjon i frekvensdomenet, AGC, kvantiserer); speilet i Python som <c11/>.

seg-878d66b73571 = <b>Scener med kringkastet efemeride</b>: <c1/> (med <c2/>/<c3/>/<c4/>) plasserer hver friske GPS-satellitt i sin sanne kringkastede geometri ved hjelp av motorens RINEX-leser, slik at referansesidefilen bærer den virkelige avstanden, Doppler og kodefasen per satellitt; speilet i Python som <c5/>. Bare programvare og additivt: ingen nye avhengigheter, ingen sending, ingen syntese av interferens- eller spoofingbølgeformer (kanalens utbredelseseffekter virker bare på det legitime signalet). Hver numeriske påstand er testet mot en uavhengig referanse (lukket form eller innsatt referanse) i enhetstestene for kanal/frontend og i <c6/>.

seg-1e71370d87d8 = <b>GNSS IQ-laget: simulering på signalnivå og programvaremottakerbehandling.</b> En ny modul <c1/> tar Kshana fra en frontend for én satellitt og korte blokker på L1 C/A til et fullt lag på signalnivå, tilgjengelig fra kommandogruppen <c2/>. Den genererer lange rå IQ-scener med flere satellitter og en sidefil for referansen per epoke (<c3/>); anvender utbredelse på signalnivå — ionosfære med kode-bærebølge-divergens, troposfære, amplitude- og fasescintillasjon (Cornell-modellen), Fresnel-flerveisutbredelse og en landmobilkanal med tre tilstander, med forhold uten fri sikt (<c4/>); fanger og sporer med FFT-fangst og en DLL/PLL/FLL-bank med flere kanaler, og spiller av ett opptak gjennom mange sløyfeutforminger (<c5/>, <c6/>); modellerer frontend — FIR/IIR-filtrering, kvantisering fra 1 til 14 bit, AGC, notch, pulsblanking og ekskisjon i frekvensdomenet (<c7/>); strømmer store innspilte datasett med begrenset minne — formatene int8/int16/float32/pakket 2-bit og reell IF, SigMF med flere filer, resampling, en datasettoversikt med SHA-256 per fil og en batchkjører (<c8/>); legger til spredekoder for GPS L5/L2C, Galileo E1 (CBOC, ekte ICD-minnekoder) og E5a, BeiDou B1C/B1I og GLONASS L1OF, hver kontrollert mot sitt grensesnittkontrolldokument (<c9/>); og tilpasser modellen for tap av lås i sporingssløyfen til en virkelig mottakers observerte oppførsel i laboratoriekjøringer, med feil for tilbakeholdt kjøring (leave-one-run-out) og ekstrapolering merket som prediction (<c10/>). Hver numeriske påstand er testet mot en uavhengig referanse (en ICD-tabell, en lukket form, eller en uavhengig mottaker som gjenfinner den innsatte referansen); de fysiske kanal- og sløyfemodellene forblir MODELLED. Dette er bare et programvarelag: det skriver IQ-filer for programvaremottakere og syntetiserer ikke interferens- eller spoofingbølgeformer og styrer ikke radiomaskinvare. Ingen publisert antall scenariotyper og ingen rad i verifikasjonsmatrisen endres. Design: <c11/>.

seg-943e21ccb25f = Mottakertillit: vurder en virkelig GNSS-mottakerlogg.

seg-f8274120bff2 = <c1/> leser en logg fra u-blox UBX, RINEX { "3" } (med en valgfri kringkastet navigasjonsfil), Android GnssLogger eller NMEA { "0183" } inn i én tidsstemplet tidslinje og kjører tillitsmonitorer over den: fall i bærebølge-til-støy-tetthet (C/N0), tap av lås, automatisk forsterkningsregulering (AGC), u-bloxs jamming-indikator, posisjonssprang og, med RINEX og navigasjon, motorens egen enkeltpunkts posisjonsbestemmelse med paritets-RAIM (receiver autonomous integrity monitoring) og den klokkestøttede monitoren. Hver epoke er nominell, degradert eller ikke betrodd, og resultatet sier når og hvorfor. Hendelser og predikerte C/N0-fall oppgitt i scenarioet scores mot toleranser oppgitt i samme fil: oppdaget, sen eller oversett, og enig eller uenig. Utdata er resultat-JSON, en CSV per epoke og et diagram; resultatet bærer loggens SHA-256 og hver terskel. Også tilgjengelig fra Python (<c2/>), WebAssembly-pakken (<c3/>, logger inline) og det nye verktøyet <c4/> på serveren for Model Context Protocol (MCP). Veiledning: <c5/>; eksempel: <c6/>. På spoofingloggene fra JammerTest { "2024" } gjenskaper motorbanen den første alarmen i den forhåndsregistrerte referansekjeden ved hvert publisert starttidspunkt (<c7/>). Monitorene forblir MODELLED; ingen rad i verifikasjonsmatrisen endres.

seg-55669fe92932 = En mindre utgivelse. Valideringsrunde { "2" } og pakkene fra bølge 1 tar verifikasjonsmatrisen fra { "223" } rader ({ "93" } VALIDATED) ved { "0.29.3" } til { "249" } rader ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); hver opprykking ble kontrollert mot en uavhengig referanse ved en toleranse fastsatt før kjøringen, og hver uenighet er publisert som et funn. Nytt: en innebygd NAIF-kjernelser og DE440-bane, én validert SGP4-til-ITRS-propagerings- og tidsbane, et målt klokkebibliotek, en referansegenerator for LunaNet AFS, løsere med utvidet presisjon og kvadratrotinformasjon, og ekte månebasert IQ-behandling på LuGRE-data. Publiserte tall som har endret seg, er oppført som revisjoner nedenfor.

seg-f75f1878045e = Syv og tjue rader i verifikasjonsmatrisen blir VALIDATED etter at en uavhengig referanse stemte innenfor en toleranse fastsatt før den første sammenligningen (opprykningsregelen i <c1/>): ti i en første valideringsrunde og sytten i en andre. Femtien MODELLED-rader ble lagt frem for en ekstern referanse i første runde og de gjenværende rutbare radene i andre; hver uenighet er registrert nedenfor som et funn i stedet for å bli justert bort. Tre rader ble delt slik at en validert del ikke bærer en uvalidert rest, noe som tar matrisen fra { "223" } til { "226" } rader; valideringspakkene som er føyd til siden, tar den til { "249" }. Tallene leses fra den genererte <c2/>.

seg-8d542741fa77 = etter runde { "1" }

seg-ae3743f976c5 = Rader i verifikasjonsmatrisen

seg-6c4b1fd56a31 = hvorav VALIDATED mot en ekstern referanse

seg-90450fe87280 = hvorav MODELLED

seg-86972e4c7f12 = hvorav PARTNER

seg-61c5c5e308ed = Forkortelser brukt i denne oppføringen

seg-5907283b71da = Forkortelse

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (for ARAIM); avansert mottakerautonom integritetsovervåking (ARAIM); Matlab Algorithm Availability Simulation Tool ved Stanford University

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = Allan-avvik; tilfeldig vandring i hastighet; tilfeldig vandring i vinkel

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = et åpen kildekode-verktøysett for astrodynamikk (Nyx Space); NASAs verktøysett Spacecraft, Planet, Instrument, C-matrix, Events fra Navigation and Ancillary Information Facility; kjerne for planetkonstanter

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = Barycentric Celestial Reference System; Barycentric Dynamical Time; Terrestrial Time

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Det internasjonale byrået for mål og vekt; et laboratoriums realisering av koordinert universaltid

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; månetidssystemer skrevet i meldingens felt TIME_SYSTEM

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = Cramér–Rao nedre grense

seg-a1fff77503b4 = CW

seg-064470740a35 = Clohessy–Wiltshire relativ bevegelse

seg-d70a9b3e92a7 = Development Ephemeris { "440" } fra Jet Propulsion Laboratory

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = geometrisk presisjonsforringelse (dilution of precision); posisjonsrelatert geometrisk presisjonsforringelse

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = utvidet Kalman-filter; unscented Kalman-filter; treghetsnavigasjonssystem; globalt satellittnavigasjonssystem; treghetsmåleenhet

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = effektiv monitorterskel; vertikalt og horisontalt beskyttelsesnivå

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = Jordorienteringsparametere; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; gjennomsnittlig absoluttfeil

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = NASAs General Mission Analysis Tool

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = ikke-terrestrisk nett (3GPP); synkroniseringssignalblokk

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = heltallsminste kvadrater; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = bias mellom systemer

seg-743c3303e01c = LEO

seg-d7b83e7c427f = lav jordbane

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = løsningsseparasjon med flere hypoteser; beskyttelsesnivå; beskyttelsesnivå for tidssynkronisering

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = effekttetthetsspekter; sampler i fase og kvadratur; Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvanteprojeksjonsstøy

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = mottakerautonom integritetsovervåking

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = satellittbasert forsterkningssystem; det amerikanske Wide Area Augmentation System; dobbel frekvens og flere konstellasjoner; en geostasjonær SBAS-satellitt

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = kvadratisk middelverdi; avstandsfeil i signal i rommet

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = et åpen kildekode-bibliotek for GNSS-posisjonering

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = interferometri med svært lang grunnlinje

seg-c3bc7d828ecc = Hver rad nedenfor oppgir typen uavhengig referanse (Bibliotek: et uavhengig tredjepartsbibliotek som beregner en entydig definert størrelse; Målt: virkelige måledata; P2: et uavhengig numerisk bibliotek som beregner en lineæralgebra-størrelse på nytt på innsjekkede inndata), den uavhengige referansen, toleransen fastsatt før kjøringen og resultatet. Hver opprykking ble kjørt på nytt av en andre gjennomgåer, som genererte testdatafilen på nytt byte for byte og viste at en bevisst mutasjon i motoren gjør testen rød.

seg-be0a4e3ac81c = <b>GNSS/INS-sensorfusjon</b> (Bibliotek), avgrenset til det løst koblede 15-tilstands feiltilstands-EKF-et: NaveGo v1.4 (LGPL-3.0, kjørt under GNU Octave) på sin egen virkelige kjøretur med Ekinox IMU/GNSS. Kshanas RMS for horisontal, vertikal og posisjonsinnovasjon er { "0.912" }, { "0.940" } og { "0.861" } av NaveGos (terskel { "1.2" }), og dens gjennomsnittlige normaliserte innovasjon er { "0.395" } (terskel { "1.5" }). GNSS er til stede hele turen, så ingen utfall er testet. Det tett koblede UKF-et og det koblede klokkefilteret forblir utenfor påstanden.

seg-0c82afd5ba30 = <b>3-DOF holdning og feilbudsjett for pekning</b> (Bibliotek), avgrenset til toppen av gravitasjonsgradientmomentet: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } tilfeller, innenfor { "1e-12" } relativt (verst { "2.1e-15" }). RSS-pekebudsjettet er en sum av tall levert av kalleren og forblir utenfor den.

seg-71cf58e91a09 = <b>Felles geometri for kommunikasjon og navigasjon på månen</b> (Bibliotek), avgrenset til plassering av stasjon, azimut, elevasjon og avstand: ANISE { "0.10.2" }, { "768" } sampler, innenfor { "1e-6" } grad og { "1" } mm (verst { "2.2e-12" } grad og { "5.6e-9" } m). Parameteren for avstandsmålingsnøyaktighet er en utformingsinndata utenfor påstanden.

seg-0687c757231b = <b>Momentfri stivlegemeholdningsdynamikk</b> (Bibliotek): Basilisk { "2.9.1" } spacecraft hub, { "1e4" } s på to generelle treghetsmomenter, kvaternion og vinkelhastigheter innenfor { "1e-9" } (verst { "3.3e-11" } og { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>GNSS-løsning av heltallsflertydighet i bærebølgefase (LAMBDA)</b> (Bibliotek), avgrenset til ILS-løsningen og dens to beste normer: RTKLIB v2.4.2-p13 <c1/>, { "300" } kovariansmatriser, { "0" } heltallsavvik, normer innenfor { "1e-9" } relativt (verst { "5.6e-13" }). Suksessraten for bootstrapping forblir bare kontrollert internt.

seg-c23196cbdc96 = <b>Sammensatt PL for tidssynkronisering, skalar MHSS</b> (P2): numpy { "2.3.5" } og scipy { "1.18.1" } på { "300" } innsjekkede inndata, PL innenfor { "1e-9" } relativt (verst { "1.2e-10" }), styrende delmengde identisk.

seg-8f524d815949 = <b>GLS-hvitgjøring av fellesmodus og Mahalanobis-identiteten</b> (P2): numpy { "2.3.5" } LAPACK på { "201" } innsjekkede kovariansmatriser, innenfor { "1e-12" } relativt (verst { "7.9e-16" }); konditionstall opptil { "19.3" }.

seg-b4136cdb8a98 = <b>Leverandør av DE440-orientering for månens hovedakser</b> (Bibliotek): SPICE <c1/> på den binære PCK-en ved { "2 000" } epoker utenfor nodene, innenfor { "1.7e-5" } rad (verst { "1.7e-6" } rad, omtrent { "3" } m ved overflaten), etter rettingen som er oppført under «Rettet».

seg-c28de00a491c = <b>SigMF-opptak som inndata og utdata, og Welch-spektre</b> (Bibliotek), avgrenset til lesing og skriving av SigMF og <c1/>: scipy { "1.18.1" } <c2/> innenfor { "1e-12" } relativt per bin (verst { "6.0e-14" }); sigmf-python { "1.13.0" }-opptak dekodet bit-identisk; crate-ens metadata gyldige mot SigMF { "v1.2.6" }-skjemaet. IQ-syntese og modellsammenligningene for den forblir utenfor den.

seg-a7756d2e124a = <b>LEO-tilpasning av kringkastet efemeride og SISRE mot tilpasningsintervall</b> (Målt), avgrenset til Kepler-tilpasningen med 16 parametere og dens SISRE bare for banen: presise baner fra TU Graz ITSG for fire satellitter mot statistikken fra Liu et al. { "2025" }, komponenter innenfor 1.5x ({ "0.804" } til { "1.087" }) og SISRE innenfor 1.5x ({ "0.716" } til { "0.809" }).

seg-99debd58724a = Funn

seg-3f5b2f54c7bf = Den uavhengige referansen var uenig med disse radene, så de forblir MODELLED. Hvert funn er også skrevet inn i radens tekst om uavhengig referanse (og dermed inn i <c1/>), med en test som fester det.

seg-e28fac875d8c = <b>Estimering av klokketilstand om bord:</b> på tilbakeholdte IGS-klokker for { "11" } GPS Block IIF-satellitter er trestatsfilteret konsistent ett steg frem, men overmodig ved én time på { "9" } av { "11" } (periodiske ledd og flicker-ledd er ikke med i modellen).

seg-5900ce454dc7 = <b>Spoofingdeteksjon:</b> på JammerTest { "2024" } slo ingen monitor på observasjonsnivå alarm innen { "10" } s etter noen av de { "8" } publiserte starttidspunktene, og tre vinduer før start hadde falske alarmer.

seg-08b6e6aa7d08 = <b>Beskyttelsesnivå for tidssynkronisering under spoofing:</b> den målte uoppdagede tidsfeilen overstiger TPL ved { "3" } av { "8" } oppdagede starter (1.9x til 5.3x); en klokkekalibrering på { "60" } s dekker ikke driften i mottakerens TCXO.

seg-a2f4df11d9cc = <b>Geometri for utskytningsvindu og stigning:</b> mot Orekit { "12.2" } stemmer geometrien innenfor avrunding, men stedshastigheten fra jordrotasjonen bommer på { "1e-6" } relativt ved { "62.9" } grader bredde ({ "1.12e-6" }, polarbevegelsen som den sfæriske modellen utelater). Runde { "2" }: hastigheten med sann pol og en epoke stemmer, standardhastigheten uten epoke bommer fortsatt (se nedenfor).

seg-f6b6c9251a17 = <b>Ballistisk innflyvingskorridor ved gjeninntreden (Allen–Eggers):</b> den predikerte toppakselerasjonen for Stardust-gjeninntreden er { "61.8" } g mot den rekonstruerte { "32.89" } g (+{ "88" } %, toleranse { "15" } %).

seg-5d83648dd867 = <b>Felles feil i UT1 og polbevegelse:</b> mot nøyaktighetsformelen trykt i { "178" } utgaver av IERS Bulletin A stemmer polen innenfor 1.5x, men UT1 gjør det ikke ({ "0.48" } ved { "10" } dager, { "1.59" } ved { "40" } dager). Erstattet i runde { "2" }: raden er nå VALIDATED (se nedenfor).

seg-98a99bcba894 = <b>Frakoblet standard inndata for jordorientering:</b> astropy bekrefter radtellingen, men de { "12" } radene som crate-en kaller Bulletin A-prediksjoner, er flagget som målt (I), ikke predikert (P). Tallene for enighet i raden for den operative prediktoren var derfor mot målte rader. Erstattet i runde { "2" }: motoren klassifiserer rader etter flagg, og raden er VALIDATED.

seg-d96fbfa4be79 = <b>Prediksjonsfeil for jordorientering i operativ stil:</b> prediktorens UT1-feil er 2.4x til 12.6x Bulletin A ved { "1" } til { "10" } dager og { "5.32" } ms ved { "10" } dager, utenfor området { "0.36" } til { "3.13" } ms for den 2. EOP PCC.

seg-1833bf6e3b6f = <b>Geodetisk VLBI på månen:</b> mot ANISE-lystider gjennom DE440 ligger ingen forsinkelse innenfor { "1" } ps; det største avviket er { "24" } µs, for det meste det analytiske månesenteret (omtrent { "200" } km fra DE440). Runde { "2" }: kjernebanen er VALIDATED i en egen rad; denne analytiske banen forblir MODELLED.

seg-0ec8a2a91702 = <b>Interoperabel eksport for månen:</b> Orekit { "12.2" } avviser tidssystemene LTC og TCL, så utveksling av OEM-filer for månen med en andre leser er ikke etablert.

seg-09cfd4e61b7b = <b>Clohessy–Wiltshire relativ bevegelse:</b> mot Orekits ikke-lineære bevegelse ved { "100" } m er avviket { "1.2" } til { "6.3" } mm, over { "1" } mm; det skalerer som det utelatte andreordensleddet, så toleransen fastsatt på forhånd lå under lineariseringsfeilen. Erstattet i runde { "2" }: andreordenskorreksjonen er VALIDATED mot den samme terskelen.

seg-af1bdd974ba5 = <b>Feilvekst ved fri treghetsnavigasjon i INS/TRN:</b> mot en fri-treghets Monte Carlo fra NaveGo holder vekstlovene innenfor { "5" } % til { "600" } s og overvurderer utover det (2.2x til 8x ved én time), fordi de utelater Schuler-tilbakekoblingen. Erstattet i runde { "2" }: Schuler-feilmodellen er VALIDATED.

seg-8459bc50f8b4 = <b>Tjenestevolum på månen fra virkelig konstellasjonsgeometri:</b> { "4" } av { "12" } publiserte tilgjengelighetsstatistikker avviker med mer enn { "2" } prosentpoeng (opptil { "22.5" }).

seg-7a0fd1377b9c = <b>Overgrense for sporbarhetsbias i heterogen UTC(k):</b> på { "105 024" } BIPM-rader overskrides overgrensen av { "50.8" } % av radene; den publiserte usikkerheten avgrenser BIPMs måling av forskyvningen, ikke forskyvningen.

seg-814acf34cffd = <b>Klassifisering av nullrom for datum på månen:</b> på den publiserte geometrien med fem reflektorer er korrelasjonen -0.78 mot -0.97, og CRLB for origo er { "96" } til { "98" } % under artikkelens.

seg-da01b5e08a87 = <b>Substrat for LLR-datumgeometri på månen:</b> mot { "192" } lunare normalpunkter fra ILRS for { "2024" } var RMS for enveisresidualen { "96" } m med den tidligere orienteringsinterpolasjonen og er { "22.7" } m etter rettingen nedenfor, fortsatt over terskelen på { "10" } m (avrundede stasjonskoordinater, ingen polbevegelse). Orienteringsserien avkortes stille utenfor 2024-2025. Runde { "2" }: modellen for målt avstand er VALIDATED i en egen rad ({ "2.81" } m); serien dekker nå 2014-2030 og gir feil utenfor.

seg-fd9ad94680e9 = <b>Kobling mellom relativistisk klokkerate og referansesystem:</b> selvpotensialleddet ligger { "3.18e-4" } over den publiserte verdien (toleranse { "1e-4" }); artikkelen evaluerer et annet potensial, så ingen publisert verdi finnes for denne lukkede formen. Erstattet i runde { "2" }: det ekvatoriale potensialet av grad 2 er VALIDATED mot den samme artikkelen.

seg-e002819c1e2d = <b>Fysiske konstanter for hvert legeme i solsystemet:</b> { "12" } av { "84" } konstanter for de tilføyde legemene avviker fra NAIF pck00011 og gm_de440 (eldre elementer for Mars-måner; andre GM-løsninger for Uranus, Neptun og Pluto). Runde { "2" }: konstantene følger nå NAIF (en transkripsjon, ikke talt med), og den beregnede orienteringen stemmer med SPICE; raden forblir MODELLED.

seg-e722d242e78e = <b>Valgbare efemeridemodeller for LEO:</b> tilpasningen med 22 parametere etterlater 1.71x og 1.86x den publiserte feilen langs banen på buer på { "20" } min, over 1.5x. Erstattet i runde { "2" }: modellen med 22 parametere og dens tilpasning er VALIDATED i en egen rad.

seg-c136023752df = <b>Felles GNSS- og LEO-posisjonering:</b> biasen mellom systemene stemmer med RTKLIB, men { "93.2" } % av epokene ligger innenfor { "3" } m av ITRF2020 mot { "95" } %; RTKLIB selv når { "88.2" } % på dataene ({ "93.6" } % etter rettingen av gruppeforsinkelsen i runde 2).

seg-e5f0e3c21def = <b>Integritetsblindhet i fellesmodus</b> og <b>dekning og DOP-kart:</b> begge sammenligningene bestod, men ble avvist under gjennomgang fordi en bevisst feil motor også består dem (den første kontrollerer bare en intern identitet; de publiserte gulvene i den andre kan ikke se en doblet PDOP). Runde { "2" }: integritetsblindhet i fellesmodus er VALIDATED på inndata med paritet; dekningskartene forblir et funn (se nedenfor).

seg-688e1753cd53 = Valideringsrunde { "2" }

seg-b320fbdb72c3 = Den andre runden tok hver rad som den første runden lot være rutbar, med nye forhåndsregistreringer innsjekket før noen testdatafil ble hentet eller noen uavhengig referanse kjørt, en kritisk andre gjennomgåer som kjørte hver sammenligning på nytt, og en bevisst mutasjon i motoren som må gjøre hver test rød. Eieren godtok den rettede ordlyden i raden for grensen utenfor Omega 2026-10-02 før den ble rykket opp (den gamle teksten motsa koden).

seg-7b7c584caaaf = <b>Rykket opp til VALIDATED ({ "17" }).</b> Typen uavhengig referanse i parentes; toleranse fastsatt før kjøringen.

seg-555e6ad454d2 = <b>Kobling mellom relativistisk klokkerate og referansesystem</b> (Referanse): Ashby og Patla { "2024" } L_m innenfor { "2.8e-6" } (terskel { "1e-4" }) fra det ekvatoriale potensialet av grad 2 for de to feltene artikkelen siterer; pyshtools tyngdefelt av grad 350 for den radiale oppføringen ({ "8.3e-5" }); DE441 månehastighet ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Frakoblet standard inndata for jordorientering</b> (Bibliotek): astropy { "8.0.1" } og IERS Bulletin A nr. { "039" } bekrefter de { "30" } endelige, { "54" } raske og { "90" } predikerte radene i det omskårne utdraget.

seg-b77253dd26b5 = <b>Felles feil i UT1 og polbevegelse</b> (Bibliotek): fulle rotasjoner i astropy og pyerfa gjenskaper den felles tabellen (UT1 og pol innenfor { "6e-16" }, kombinasjonen innenfor { "1.9e-7" }); de realiserte feilene i IERS Annual Report { "2019" } gir forhold fra { "1.001" } til { "1.100" }.

seg-378414f812c1 = <b>EO-nyttelastens fotavtrykk og dekning</b> (Bibliotek): Orekit { "12.2" } og GeographicLib { "2.1" } ved hver terskel fastsatt på forhånd, med J2-noderegresjonen nå i nodeavstanden.

seg-792bf58a1c1e = <b>Clohessy–Wiltshire relativ bevegelse</b> (Bibliotek): med en andreordenskorreksjon i lukket form innenfor { "1.2e-7" } m av Orekits ikke-lineære bevegelse mot { "1e-3" } m; den lineære matrisen alene forblir karakterisert ({ "1.2" } til { "6.3" } mm).

seg-423437d90022 = <b>B-plan-siktning og tyngdekraftassistanse med patched conic</b> (Bibliotek): GMAT R2026a B-plan, asymptoter, C3 og heliosentriske elementer; sbpy { "0.6.0" } og Kasuga og Jewitt { "2019" } for Tisserand-parameteren.

seg-b29b0dfcd3a4 = <b>Feilvekst ved fri treghetsnavigasjon i INS/TRN:</b> en Schuler-feilmodell med ni tilstander innenfor { "5" } % av korrigerte NaveGo-kjøringer med fri bevegelse i alle { "48" } punkter (verst { "3.70" } %).

seg-8cc49496b4c6 = <b>Integritetsblindhet i fellesmodus</b> (P2): numpy <c1/> på { "1464" } inndata med paritet innenfor { "1e-12" } (verst { "1.06e-14" }).

seg-f0ff538b7329 = <b>Felles multiteknikk-OD og klokke for månen</b> (P2): numpy beregner hvert Gauss-Newton-steg, sigma og stasjonsfeil på nytt på seks nettverk (innenfor { "2.4e-11" }) etter en retting av QR-løsningen.

seg-7ed9b059f888 = <b>Kovarians for stasjonskoordinater i VLBI på månen</b> (Bibliotek): en SPICE-bygd Jacobian gjenskaper planen, spekteret, sigmaene og nullrommet innenfor { "1" } % og { "0.1" } grad; numpy til { "2e-13" }.

seg-0e4e1c3fc899 = <b>Udetekterbar fellesmodusgrense for residual utenfor Omega</b> (P2, ordlyd rettet etter eierens beslutning): numpy LAPACK på { "256" } tilfeller innenfor { "1e-12" }, seks eksakte uendeligheter.

seg-0fc8ce9cde6c = <b>Basisinvariant klassifisering av nullrom</b> (P2): SciPy- og NumPy-snitt av underrom på { "72" } konstruerte matriser, heltall eksakte, projektornorm innenfor { "6.0e-15" }.

seg-4e5e7a6072bc = <b>Enkeltfrekvens ionosfære- og UTC-tjenester i en LEO-navigasjonsmelding</b> (Bibliotek): GNSSTk { "15.3.1" } for Klobuchar, Az og UTC-driften; ERFA for de tre tilfellene med skuddsekund.

seg-a644bf49c816 = <b>Grense for 5G-posisjonering i ikke-terrestrisk nett</b> (P1): grenser for enkelt SSB fra Bachl, Lei og Nabeel { "2026" } innenfor et halvt trykt siffer; numpy for kovariansene til posisjonsbestemmelsen.

seg-b326f6fc55ad = <b>LLR-modell for målt avstand</b> (Målt, ny rad delt ut fra LLR-datumsubstratet): { "192" } lunare normalpunkter fra ILRS ved { "2.81" } m RMS mot en terskel på { "10" } m, med den barysentriske lystiden fra IERS { "2010" }; komponentene under terskelen er ikke løst én for én, og raden sier det.

seg-82e9fba684dc = <b>Geodetisk VLBI på månen, kjernebane</b> (Bibliotek, ny rad delt ut fra raden for VLBI på månen): SPICE-konvergerte lystider innenfor { "1" } ps og partielle deriverte innenfor { "1e-6" } ved epoker nær J2000; den analytiske standardbanen forblir MODELLED.

seg-03c47d262ff3 = <b>LEO-efemeridemodellen med 22 parametere fra Liu et al. { "2025" } og dens tilpasning</b> (Målt, ny rad delt ut fra raden for valgbare modeller): virkelige presise baner innenfor 1.5x av den publiserte statistikken på artikkelens dager og tilbakeholdte dager ({ "0.683" } til { "1.186" }); skalakonvensjonen for n_dot er transkribert og ikke validert av denne sammenligningen, og stoppregelen er Kshanas parameterkonvergensregel, ikke artikkelens regel for RMS-endring. ATOMIC-polynomet og tabellen med fem høyder forblir MODELLED.

seg-b49f96eb52ad = Eksisterende VALIDATED-rader med ny støtte (ingen endring i antall).

seg-4e26bec3297c = <b>Planetposisjoner fra JPL Standish-elementene</b> og <b>lystid mellom legemer i solsystemet</b>: de etterpåfølgende terskelene på dobbelt nominelt er erstattet av sammenligninger fastsatt på forhånd mot JPL Horizons DE441 (RMS høyst tallet i Explanatory Supplement Table { "8.10.1" }, verst { "0.778" }, med Jord-delingen og ICRF-rotasjonen inkludert; lystider innenfor { "1e-6" } s av Horizons på DE441-posisjoner, verst { "6.7e-9" } s). Flaggene «grense satt etter sammenligningen» er fjernet.

seg-d3b745392d29 = <b>Integritet (RAIM/ARAIM/SBAS)</b>: raden hviler ikke lenger på plausibilitetskontroller. Den sier nå: løsningsseparasjonen med flere hypoteser i ARAIM fra ADD v4.2 stemmer med Stanford MAAST for ARAIM { "2" } på { "270" } virkelige tilfeller (verste VPL-forskjell { "2.2e-3" } m mot { "0.05" } m); RAIM-deteksjon og -eksklusjon på øyeblikksbilde stemmer med RTKLIB <c1/> på { "2016" } av { "2016" } beslutninger, med beskyttelsesnivået for helning innenfor { "2.7e-12" } m; SBAS DO-229E L1-beskyttelsesnivåene stemmer med Stanford MAAST på virkelige WAAS-kringkastinger ({ "2868" } par innenfor { "1.6e-5" } m). Den sier tydelig at funksjonene med enhetlig sigma <c2/> og <c3/> IKKE er i samsvar med ADD (avvik ved like inndata 0.75/4.04 m og 0.39/1.93 m VPL/HPL, et funn), at SBAS-sammenligningen for DFMC L5 er et funn ({ "308" } par uten GEO i sikte er beskyttet av Kshana og ikke av MAAST), og at <c4/> ikke har noen ekstern sammenligning. Dens egen selvflagging er fjernet.

seg-d059b9953c3f = <b>LEO-tilpasning av kringkastet efemeride</b>: den integrerte referansebanen er lagt til den validerte delen (Orekit { "12.2" } innenfor { "4.55" } mm over { "6" } t, terskel { "2" } cm); korreksjonspolynomene, klokketilpasningen og avveiningen av oppdateringsperioden forblir modellert.

seg-166d511bbba3 = <b>Funn og blokkerte rader (forblir MODELLED).</b> Hver rads tekst om uavhengig referanse bærer funnet og dets festede test.

seg-7f233dbdf110 = Modulasjon av navigasjonssignaler (Betz { "2001" }, Hein { "2006" }): spektre og korrelasjoner stemmer; sidelobene på { "24" } MHz og hver flerveisbias ({ "11" } til { "15" } % for lav) gjør det ikke, årsaken er uløst.

seg-4d5a6bb44d64 = TDOA/FDOA-geolokalisering: grensene stemmer med Ho og Chan og Ho og Xu, og med forfatternes kode til { "3e-12" }; Ottawa-faktorene trykt fra en Monte Carlo avviker med { "1.3" } % og { "4.4" } %.

seg-5fa189f788ca = GNSS fra Jorden på månens avstand: GENESIS-gjennomsnitt i senit stemmer med Montenbruck et al. { "2023" } på { "5" } av { "6" }; gjennomsnitt i nadir er { "1.0" } til { "2.4" } satellitter for høye.

seg-d7e5b5a64f43 = Dekning og DOP-kart: jordutforminger stemmer med Orekit, gnss_lib_py og numpy på hver terskel; utforminger for Månen og Mars overskrider { "1e-9" } bare i nesten singulære celler.

seg-3c8fb07d83ec = Felles GNSS-posisjonering: to frekvenser { "79.9" } % og presise produkter { "94.2" } % innenfor { "3" } m mot { "95" } % (RTKLIB { "67.9" } % og { "94.1" } %); ISB-avviket for presise produkter skyldes at RTKLIB ignorerer antenneforskyvninger.

seg-5d3d4d99fbc4 = Sporingssløyfer (GNSS-SDR { "0.0.19" }): stemmer ved { "35" } til { "45" } dB-Hz; ved { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, terskler +{ "1.5" } dB; slipptider { "0.5" } til { "2" } dekader kortere.

seg-0dd24947169c = Tjenestevolum på månen (Orekit og Hipparchus): { "155" } av { "160" } verdier stemmer; kravet til verste sample svikter på nesten singulær LNCSS B-geometri.

seg-74002245287f = Kvantetreghetssensor: gulvet med bare QPN er { "21" } til { "31" } % under Gauguet { "2009" } målt støy (terskel { "30" } %, bommet med { "0.5" } poeng).

seg-ab8b17cf325e = Oscillatorforhåndsinnstillinger: målte enheter overskrider holdover for rubidium, kortidsverdien for cesium og CSAC-forhåndsinnstillingen for verste enhet; OCXO-forhåndsinnstillingen har ingen målt registrering.

seg-81ad9b839a28 = Tetthet fra romvær: Jacchia { "1971" } er innenfor en faktor { "2" } av akselerometertettheter ved solmaksimum, men omtrent 1.7x for tett i minimumet i { "2008" }.

seg-68e5d0942847 = Geometrifri skrå TEC: { "33" } av { "36" } buer innenfor { "3" } TECU av CODE-kartet (verst { "6.84" }).

seg-f410ce9cf195 = Spoofingdeteksjon og TPL mot den offisielle JammerTest { "2024" }-loggen: { "4" } av { "10" } starter oppdaget i tide; TPL overskrides ved { "4" } av { "10" }.

seg-41eb2c318469 = Klokkefilter på ferske IGS-klokker: to av { "11" } satellitter feiler kriteriet for innovasjonssum.

seg-064b623e918b = EOP-prediktor med minste kvadrater pluss autoregresjon: UT1 { "1.73" } til 2.11x Bulletin A ved { "2" } til { "10" } dager.

seg-d98571cc21f4 = Overgrense for realisert forskyvning i UTC(k): samlet overskridelse { "0.0333" } mot { "1e-2" }.

seg-527aca91ec7c = Datum for månens referansesystem fra en kampanje: SPICE-leddet stemmer; P2-leddet med estimerte stasjoner bommer på { "1e-9" } på et problem med kondisjon 2.1e8.

seg-9805c4c821f9 = Datum for månens referansesystem fra virkelig LLR: { "15" } av { "16" } størrelser stemmer med SPICE; sigma for z-translasjonen er { "1.03" } % for høy mot { "1" } %.

seg-08e6c541b59e = Gjeninntreden (Allen-Eggers): punktmasseløsningen stemmer med rekonstruksjoner fra romfartsorganisasjoner (bare en kryssjekk); sammenligningen med akselerometer er blokkert av mangel på en lesbar Hayabusa2-kilde.

seg-0bb78ffbd915 = ITU-T-masker: de trykte regneeksemplene stemmer; klassegrensene i G.8273.2 har ingen (blokkert).

seg-308c1bca3fd9 = Geometri for utskytningsvindu: stedshastigheten med sann pol og en epoke stemmer med Orekit ({ "4.9e-8" }); standardhastigheten uten epoke bommer fortsatt ({ "1.12e-6" }). Ikke rykket opp; oppfølging venter.

seg-f0b7c3d60df8 = Fysiske konstanter for hvert legeme: nå avviker { "0" } av { "84" } fra NAIF (en transkripsjon), og den beregnede orienteringen stemmer med SPICE til { "1.4e-10" } rad. Ikke rykket opp; oppfølging venter.

seg-a5a787c9a761 = Blokkert av en avgjørelse om avgrensning som eieren må ta, hver med sin samstemte sammenligning innsjekket: observerbarhet for absolutte stasjoner på månen, DOP for overflatebeaconer, eksporten utenfor siktelinjen, deteksjonskraft på tvers av modaliteter, konsistensstatistikken for fellesmodus og polar LEO-dekning.

seg-cf638ec9878b = Blokkert av data: feilbudsjett for tidsoverføring (trenger en datareduksjon på virkelige data), JammerTest C/N0 (antenneposisjon og effektfordeling er ikke dokumentert).

seg-e8709509eef3 = Revisjoner (publiserte tall som har endret seg, gammelt -> nytt).

seg-5e93ab237b15 = Beskyttelsesnivåene fra <c1/> ligger nå på det geodetiske lokale nivået i stedet for det radiale: opptil { "0.31" } m HPL og { "0.14" } m VPL ved ABMF ({ "16" } grader N); ingen golden fil er flyttet, men den registrerte oppsummeringen i veiledningen for <c2/> flyttes fra gjennomsnittlig HPL { "22.1" } m / VPL { "40.0" } m til { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Standardverdier for kobling i referansesystem for rate på månen: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } per meter.

seg-8ac9cb8c5631 = Frakoblet standardkjøring for EOP (<c1/>, celler oppført i <c2/>): predicted_rows { "12" } -> { "90" }; poltak { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; radene i tabell { "2" } i <c3/>; enighet for operativ prediktor 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

seg-dd93329245ba = <c1/> liu22 SISRE bane/med klokke: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

seg-e4205dfdb0d2 = Liu-høydetabell, Kshana (forhold): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = LEO-navigasjonsmeldingens <c1/>-skala { "2" }^-60 -> { "2" }^-58 (ikke forhåndsregistrert, oppgitt åpent; utenfor tilpasningssammenligningen); CRC-en for liu22-eksempelrammen 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = Verifikasjonstabellen i <c1/>: raden for Liu og ATOMIC delt i en VALIDATED rad for 22 parametere og en MODELLED rad for ATOMIC og fem høyder.

seg-537f5d80b66c = Radtekst for DE440-orientering av månens hovedakser: spenn 2024-2025 / { "731" } rader -> 2014-2030 / { "6 209" } rader; «avkortes stille» -> gir feil utenfor spennet.

seg-17a5dd090566 = Scenarioet <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nye felt inclination_deg ({ "98.19" }) og nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (referanseklokken for TDOP/GDOP er nå konstellasjonen med lavest nummer i sikte): global GDOP maks { "2.2236" } -> { "2.1205" }, gjennomsnitt { "1.122" } -> { "1.131" }, median { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, og GDOP-kartet per celle; mean_visible_by_constellation summert som heltall (omtrent { "1e-12" } relativt, usynlig med { "4" } desimaler).

seg-e48b212c4881 = Felles GNSS-posisjonsbestemmelse med én frekvens etter rettingen av kringkastet gruppeforsinkelse: { "93.2" } % -> { "93.6" } % innenfor { "3" } m; ISB-median -0.351 -> -0.114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costas-sløyfe SNR rho/4): ved terskelen { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; ved { "25" } dB-Hz { "9.55" } -> { "1.60" }; ved { "22" } dB-Hz { "2.24" } -> -0.14.

seg-789a302679f7 = <c1/>: hver utdata flytter seg med Schuler-feilmodellen; TRN-toppen i det medfølgende scenarioet { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = Rapporten <c1/>: ny nøkkel geometry_path («analytic» på standardkjøringen, ingen numerisk verdi endret); nye valgfrie felt planetary_kernel_path, earth_orientation_kernel_path og moon_orientation_kernel_path, med epoch_partials på kjernebanen; typens beskrivelse er skrevet om. Den uavhengige referansen for kjernebanen i verifikasjonsraden er SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) blir en kryssjekk av kjerneevalueringen.

seg-3631a31e7b26 = Legemekonstanter: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); ekvatorialradius for Phobos { "13.1" } -> { "13.0" } km; pol og nullmeridian for Phobos og Deimos fra pck00011; prime_meridian_deg i solsystemet inkluderer nå de kvadratiske og periodiske leddene.

seg-ac1251d7a0fd = <c1/> (<c2/> på Europa), fra den fulle pck00011-orienteringen av Europa (7cfd66b4; orienteringen stemmer med SPICE pxform til { "1.4e-10" } rad), som flytter landeren i treghetsrommet: tilgjengelighet bare reléer / med avstanden til Jorden { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } av { "171" } epoker bare reléer), median PDOP { "5.266" } -> { "5.360" }, RMS for posisjonsfeil { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, median formell sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tabellen i <c3/> og festet i <c4/> følger med; <c5/> er uendret.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), den kalibrerte faktoren erstattet av Jacchia { "1971" }: activity_density_kg_m3 ved 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k fjernet, mean_exospheric_temperature_k lagt til ({ "1186.7" } K); <c2/>: solsyklussvingningen ved { "800" } km er nå 10.4x (NRLMSISE-00 13.6x), og høydepåstanden følger NRLMSISEs stigning til { "500" } km og fall ved { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (oppsummeringsteksten uendret på { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (QR-løsning): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> sendt ut på nytt for de nye og fjernede feltene ovenfor.

seg-717c51e1cca0 = Valideringspakker

seg-4ec44f8a5f8e = D12, utvidet presisjon og en løser med kvadratrot (to nye VALIDATED-rader: { "226" } -> { "228" } rader, { "110" } -> { "112" } validert).

seg-d28005966948 = Del { "1" }, uavhengig referanse med utvidet presisjon:

seg-9a5f94973450 = Datum for månens referansesystem med estimerte stasjoner: en mpmath-referanse med 50 sifre utvidet presisjon (forhåndsregistrert 804662d5, kondisjonsskalerte terskler fra en a priori formel for bakoverfeil) stemmer på en ny kampanjedato (2026-03-18) og på det opprinnelige scenarioet fra 2024-01-01; ny VALIDATED rad under P2. Den avgjør den tidligere striden om dobbel presisjon: motorens datumsigmaer er feil med opptil { "9.7e-6" }, NumPys inverse- og egenverdiruter med opptil { "6.2e-6" }, og dens Cholesky- og QR-ruter med omtrent { "1e-8" }. Motoren er innenfor sin feilgrense, men omtrent tusen ganger mindre nøyaktig enn en faktoriseringsrute.

seg-b055435a2138 = Miljø for uavhengig referanse: mpmath { "1.3.0" } lagt til.

seg-d0c2b2a8e635 = Revisjoner: ingen. Ingen golden fil eller publisert figur endres; raden «Datum for månens referansesystem fra en observasjonskampanje» forblir MODELLED (beslutning av grunnleggeren 2026-10-02, alternativ A: den låner ikke status fra den separate raden); dens tekst om tester viser til den nye testen og dens funn.

seg-50b53908fb7c = Del { "2" }, datumløser med kvadratrotinformasjon:

seg-4c6089cfac5e = Ny valgfri løser med kvadratrotinformasjon (<c1/>; <c2/> i scenarioet for månens referansesystemkampanje): Householder-QR, marginalisering gjennom den trekantede faktoren, en Jacobi-SVD for spekteret, og kompenserte produkter fra bare korrekt avrundede operasjoner. Mot referansen med 50 sifre (forhåndsregistrert b41908c9) stemmer datumsigmaene til { "3e-13" } på en ny dato (2026-06-09); på inndataene fra 2026-03-18 og 2024-01-01 er standardløseren feil med opptil { "1e-5" }. Ny VALIDATED rad under P2. Standardløseren og dens utdata er uendret. Terskelene fastsatt på forhånd dokumenterer bare feil over omtrent { "2e-7" } relativt: de avviser standardløseren, men ikke et snudd Householder-fortegn, et ukompensert skalarprodukt eller en spektral sluttinvers, og raden sier det.

seg-de9aeb2adde0 = Valgfrie kvadratrotbaner ved siden av de uendrede standardene: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> og <c6/>, på nye <c7/> og <c8/>. Hver stemmer med sin standard der begge er nøyaktige (en intern kontroll, ingen rad; ingen validering hevdes for dem). <c9/> delegerer nå til en felles rutine; dens utdata og hvert scenarios standardutdata er uendret.

seg-87a632404f32 = Rangeringsbeslutninger i månens referansesystemkampanje: en forhåndsregistrert kontroll med utvidet presisjon over { "40" } dager bekrefter hver avgjørbar stasjonsblokk- og fullrangs-Helmert-beslutning. Den a priori grensen kan ikke bekrefte de { "20" } rangmangelfulle Helmert-dagene; i eksakt aritmetikk er defekten deres geometrisk, med terskelen { "1e-9" } innenfor kampanjens naturlige område av egenverdiforhold. Ingen rad.

seg-3b24e7fa36bf = Påstanden i raden for kampanjen med utvidet presisjon er innsnevret til «innenfor grensen for verste tilfelle», og kontrollen av svakeste retning med faste stasjoner måler nå en virkelig vinkel ({ "6.6e-16" } rad; sammenligneren er endret fra acos til en korde, terskelen er ikke endret).

seg-4fad02ab4b6d = Revisjoner: ingen. Ingen golden fil eller publisert figur endres; raden «Datum for månens referansesystem fra en observasjonskampanje» er uendret og forblir MODELLED (beslutning av grunnleggeren 2026-10-02, alternativ A).

seg-627d3357d620 = D4, ryggraden for JPL-kjerneefemeride, fase { "1" } (fire nye VALIDATED-rader: { "228" } -> { "232" } rader, { "112" } -> { "116" } validert).

seg-30e8a645191f = NAIF-kjernelseren har sin egen rad.

seg-98ff121aa2a9 = <c1/> (DAF-beholder, SPK type { "2" }, binær PCK type { "2" }) stemmer med SPICE Toolkit (CSPICE N0067 gjennom spiceypy { "8.2.0" }) og med ANISE { "0.10.6" } på alle { "600" } DE440-tilstander og { "200" } rotasjoner av månens orientering i et tilfeldig rutenett trukket fra hashen til selve forhåndsregistreringscommit-en (abcd9133), innenfor terskler utledet på forhånd fra Chebyshev-evaluering i dobbel presisjon (verst { "0.6" } % av terskelen, { "1.95e-3" } m). Raden hevder at motoren leser JPL-kjerner riktig, ikke at DE440 eller den analytiske serien er nøyaktig (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: DE440- (eller en hvilken som helst type 2 SPK-) posisjoner gjennom motorens egen leser, med todelte TDB-epoker og kjernens SHA-256 beholdt for rapporter; den erstatter aldri en planet med et systems barysenter. <c2/> lar en geometribane velge den analytiske serien (standarden) eller en kjerne.

seg-6c7dae98601e = <b>Valgfri kjerne-Måne for <c1/> og <c2/></b>: en nøkkel <c3/> leser det geosentriske månesenteret fra kjernen; ellers endres ingenting, og rapporten får en blokk <c4/> som navngir kjernen og dens SHA-256. Uten nøkkelen er begge rapportene byte-identiske med før.

seg-74e8def84747 = <b>Kovarians for punkt på månens overflate på kjernebanen</b> (ny VALIDATED-rad): med hver stasjon fast og beaconen på DE440-Månen stemmer beaconens kovarians med en SPICE-lystid-Jacobian (verst { "1.7e-3" } mot en terskel på { "1" } %) og en NumPy-invers ({ "4e-14" } mot { "1e-9" }), forhåndsregistrert 4a51256 (<c1/>). Raden for den analytiske banen forblir MODELLED: på den analytiske Månen er dens minste beacon-sigma { "3.9" } % under den uavhengige referansen.

seg-55002d236ab0 = <b>Datum for månens referansesystem fra en virkelig kampanje, kjerne for Månens senter</b> (ny VALIDATED-rad): på { "447" } usette normalpunkter fra 2019-Q2, forhåndsregistrert 830d945a før noe av dem ble hentet, stemmer datumkovariansen på kjernebanen med den uendrede uavhengige SPICE- og NumPy-referansen innenfor { "7.6e-5" } mot terskler på { "1" } % og { "2" } % (<c1/>). Grunnleggeren bestemte at denne raden bare rykkes opp på ferske punkter; diagnosen på sette data (c51f8b2) er et funn, ikke evidens. Terskelen skiller ikke mellom månemodeller: den analytiske Månen består også på den samme delmengden (verst { "3.8e-3" }), den planlagte mutasjonen (kjerne-Månen én time sen) ble ikke oppdaget, og ved foldingen bestod også et månesenter som var omtrent { "4,650" } km feil (Månen tatt rundt Jord–Måne-barysenteret). Raden hevder kovariansen på den banen, ikke månesenteret, og sier det.

seg-f147f9257b8b = <b>Posisjoner for Sola, Månen, Merkur og Venus fra DE440 ved UTC-epoker</b> (ny VALIDATED-rad): <c1/> stemmer med Skyfield { "1.54" } på { "600" } posisjoner mellom { "1973" } og { "2026" }, verst { "2.96" } m, innenfor en terskel fastsatt på forhånd (0bfafe6d) av serien med to ledd for TDB − TT (<c2/>). Planetposisjoner får denne nye kjerneraden nå; Standish-raden og raden for planetmåner er uendret, og månene venter på et scenario som trenger dem (beslutning av grunnleggeren).

seg-bb840641c655 = Funn: den ene bommen i sammenligningen av LLR-datum (sigma for z-translasjon { "1.025" } % mot { "1" } %) faller til { "0.049" } % når bare månesenteret leses fra DE440, på sette data (<c1/>); på den ferske { "2019" }-delmengden består den analytiske Månen også, så bommen i { "2015" } lå marginalt til den kvartalets geometri. De analytiske radene «Datum for månens referansesystem fra en VIRKELIG observasjonskampanje» og «Koordinatkovarians for punkt på månens overflate … holdt adskilt fra den for jordstasjoner» forblir MODELLED; teksten om uavhengig referanse peker nå til radene for kjernebanen.

seg-64c9f3b96392 = <c1/> sier ikke lenger at motoren ikke har noen leser for binære kjerner; den peker til raden for leseren og forklarer hvorfor romfartøykjerner (typene { "13" } og { "21" }) fortsatt kommer gjennom Horizons.

seg-841deceb80e6 = Revisjoner: ingen. Ingen golden fil, publisert figur eller eksisterende testverdi endres; de analytiske rapportene <c1/>, <c2/> og <c3/> med alle stasjoner faste er byte-identiske med før (prefikser for resultatets SHA-256 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, målt klokkebibliotek «Clock Atlas» (tre nye rader, én VALIDATED: { "232" } -> { "235" } rader, { "116" } -> { "117" } validert).

seg-1f8644486f5d = <b>Målt klokkebibliotek (<c1/>).</b> Enhetskort (hvit fase, hvit, flicker og tilfeldig vandring i frekvensmodulasjon, en lineær frekvensdrift og eventuelt faseledd én til fire ganger per omløp) tilpasset en navngitt målt klokkeregistrering og scoret på tilbakeholdte data; Allan- og Hadamard-varianser som tar hensyn til hull; en kondisjoneringsdetektor som logger hvert hull, fasetoppavvik, fasesprang, utbrudd og frekvenssprang og ikke vet noe om fil- eller dagsgrenser; konvertering av et kort til støymodellen for slottiming, den utvidede Kalman-klokkemodellen og støynivåene til spoofingmonitoren. Lesere for RINEX- og IGS-klokkefiler, BIPM-filer per laboratorium og Circular T avsnitt { "1" } (<c2/>); en samlet, hierarkisk aldringsgrense for UTC(k) (<c3/>, ikke scoret ennå).

seg-93add052ae56 = <b>Identifikasjon av støy med lag-1-autokorrelasjon</b> (<c1/>, Riley og Greenhall { "2004" }), ny VALIDATED-rad (Bibliotek): stemmer med allantools { "2024.6" } <c2/> på { "140" } tilfeller, heltall identiske, verste forskjell { "9.6e-13" } mot en terskel på { "1e-9" } (forhåndsregistrert 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Målte enhetskort med prediksjon på tilbakeholdte data</b>, ny MODELLED-rad (et funn): tilpass på en tredjedel, prediker Allan-avviket for de to andre tredjedelene innenfor en faktor på { "1.5" } (forhåndsregistrert 2ec76864). GPS Block IIF i et ferskt IGS-vindu (2026-03-01 til { "14" }): { "10" } av { "11" }; G27 er optimistisk på tretimersskalaen (verste faktor { "1.510" }). Cesium (innenfor, { "1.070" }), OCXO (utenfor, { "2.348" }) og strontium (innenfor) rapporteres, ikke blindt. Mottakerkortet for JammerTest og kortene for Galileo-masere og Deep Space Atomic Clock er blokkert. En TCXO-modellklasse for ZED-F9P-mottakere på { "12" } statiske Wroclaw-stasjoner (Zenodo { "6488497" }) feiler: { "1" } av { "11" } blinde stasjoner i en åpent oppgitt rettet ny kjøring (<c1/>, <c2/>).

seg-26fa898f6272 = <b>GPS Block IIF-kort med ledd per omløp</b>, ny MODELLED-rad (et funn): i et andre ferskt vindu (2026-04-01 til { "14" }) { "9" } av { "11" } innenfor terskelen; G03 ({ "1.947" }) og G25 ({ "1.581" }) er optimistiske fordi de tilbakeholdte registreringene deres er mer støyfylte enn tilpasningstredjedelene; å fjerne de periodiske leddene feiler på alle { "11" } (forhåndsregistrert fb475550; <c1/>).

seg-ef456da29319 = <b>M002, estimering av klokketilstand om bord, runde { "3" }</b> (et funn, forblir MODELLED): etter den frosne kondisjoneringsdetektoren klarer det utvidede filteret fra runde 2, med uendret tuning og uendrede kriterier, (a) og (c) på alle { "11" } satellitter for første gang; (b) feiler på G09 ({ "0.894" }) og G26 ({ "0.876" }) (forhåndsregistrert fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, spoofingdeteksjon, runde { "3" } til 4b</b> (forblir MODELLED): runde { "3" } blokkert ({ "167" } treningsepoker fra de andre øktene til JammerTest-enheten mot { "3600" }); med et modellklassekort for ZED-F9P (runde { "4" } og 4b) gir klokkemonitoren null falske alarmer før start ved alle { "10" } loggførte starter (runde { "2" }: { "86" }) og { "6" } av { "10" } starter oppdages innen { "10" } s (runde { "2" }: { "4" }); de samme fire forblir sene (<c1/>).

seg-79757abc69e3 = <b>M083, overgrense for UTC(k), runde { "3" }</b>: forhåndsregistrert prospektivt (fb475550) på Circular T-utgaver fra { "465" }, ikke kjørt ennå (<c1/>).

seg-09abf996ed16 = Miljø for uavhengig referanse: Wroclaw ZED-F9P-registreringen er datagated under <c1/> (CC BY { "4.0" }, omtrent { "1.5" } GB); IGS-klokketestdataene er medlevert (IGS-produkter, med kildehenvisning).

seg-b05fa0811a3e = Revisjoner: ingen. Ingen golden fil, publisert figur eller eksisterende testverdi endres; M001 (re-forankring av holdover) følges ikke opp fordi ingen klokkeklasse ble rykket opp.

seg-986f4075210b = D8, én validert propagerings-, referansesystem- og tidsbane (tre nye VALIDATED-rader og M131 rykket opp: { "235" } -> { "238" } rader, validert { "117" } -> { "121" }).

seg-d7a612528765 = Jordbanetypene som hadde sine egne modeller med bare tolegemeproblem, sekulær J2 eller sideraltid, deler nå én bane: SGP4/SDP4-elementsett med todelte juliandatoer, ført til GCRS og ITRS (International Terrestrial Reference System) gjennom IAU (International Astronomical Union) 2006/2000A-kjeden, med valgfrie parametere for jordorientering.

seg-016507ccdb8f = Nye <c1/>, <c2/>, <c3/>, <c4/> og <c5/>; <c6/> og <c7/> tar todelte epoker. Nye <c8/> (SOFA-konvensjonen <c9/> for skuddsekunddager), <c10/>, <c11/>, <c12/> (gjennom TAI, som SOFA <c13/>), <c14/> og en todelt <c15/>.

seg-158c39fff817 = Polarmodusen i <c1/> propagerer med SGP4 ved 2026-01-01T00:{ "00" }:{ "00" } UTC på IAU-kjeden (<c2/> tar en hvilken som helst epoke); SGP4 Walker-generatoren roterer til det jordfaste systemet gjennom IAU-kjeden.

seg-86ecad91a601 = Typen <c1/> kjører en ny prediktor for tilsynelatende pass (<c2/>, <c3/>): SGP4 på IAU-kjeden, ITU-R P.834-9-refraksjon og lystid for nedlenken (nye brytere <c4/> og <c5/>, på som standard), parametere for jordorientering (<c6/>, <c7/>, <c8/>, standard { "0" }), kryssinger løst til { "1e-7" } s og kulminasjonen med gyllent snitt-søk. Den geometriske <c9/> er uendret.

seg-9ce091899bf1 = <c1/> hindrer at pakkens kjerner for geometri, tid og propagering har en privat Kepler-propagering, sekulære J2-rater eller en rotasjon bare med sideraltid; navngitte raske nivåer og fysikk som er en rads tema, er begrunnede unntak.

seg-cf4ae964c5d1 = Ny VALIDATED-rad «Todelte juliandatoer og skuddsekunder på tidsbanen for jordbaner»: pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> på { "224" } tidspunkter rundt alle { "27" } skuddsekunder innenfor { "1e-6" } s (forhåndsregistrert e947e69d); verst { "1.9e-11" } s.

seg-c0dec16ea932 = Ny VALIDATED-rad «Én jordbane»: TEME-posisjoner for { "232" } elementsett mot python-sgp4 { "2.24" } (Vallados referanse-SGP4) innenfor { "6.1e-8" } m (terskel { "1" } cm), og rotasjonene GCRS -> ITRS og TEME -> ITRS mot ERFA <c1/>, <c2/> og <c3/> innenfor { "2.9e-6" } mas og { "0.41" } mas (terskler { "0.1" } og { "2" } mas), med parametere for jordorientering (forhåndsregistrert 72ea9eb0). Oppgitt åpent: den første kjøringen feilet ved 2016-12-31T23:{ "59" }:{ "59.5" } med ett sekunds rotasjon; UT1 ble tatt fra UTC-kvasi-juliandatoen på en skuddsekunddag, motoren går nå gjennom TAI, og den andre kjøringen stemmer ved de uendrede terskelene.

seg-a72ccdc2516e = M131 «LEO-dekning og geometrisk presisjonsforringelse for polare og arktiske brukere mot MEO GNSS» blir VALIDATED: Orekit { "13.1.8" } tar motorens GCRS-tilstander, roterer dem og beregner synlighet og DOP (NumPy for klokkegrupper med flere klokker); posisjoner innenfor { "6.8e-5" } m (terskel { "0.2" } m), antall i sikte identisk på 4040/4040 sampler, median DOP innenfor { "2.3e-11" } relativt.

seg-db498ac8e135 = Ny VALIDATED-rad «Tilsynelatende pass-prediksjon for bakkestasjon med refraksjon og lystid»: Orekit { "13.1.8" } propagerer de samme elementsettene i en TEME den bygger etter den oppgitte definisjonen, med ITU-R P.834-refraksjon og dens målemodell for lystid, over { "60" } tilfeller på stasjoner ved havnivå: { "1210" } pass, kryssinger innenfor { "3.4e-6" } s (terskel { "5" } ms), maksimal elevasjon innenfor { "5.5e-7" } grader, tilsynelatende retning innenfor { "8.8e-7" } grader (terskel { "1e-4" } grader).

seg-ab87bb0ee63d = Funn, holdt festet: de første sammenligningene av hele påstanden mot Orekit fra ende til ende bommet på terskelene for posisjon og retning, ikke på grunn av motoren, men fordi Orekit { "13.1.8" }s SDP4 avviker fra referanse-SGP4 for sirkulære (e = { "0" }) baner i dypt rom (opptil { "67" } m), og dens standard-TEME er bygd på IERS { "1996" } (IAU { "1980" }) nutasjon, omtrent { "72" } millibuesekunder fra IAU 2006/2000A-kjeden ({ "2.7" } m i LEO). Orekits ITU-R P.834-koeffisient for h*theta0^{ "2" } er { "0.011380" } der anbefalingen trykker { "0.01380" }; sammenligningen er på havnivå, der leddet forsvinner, og forskjellen over det er festet.

seg-49978e6a73b2 = «Pass-prediksjon for bakkestasjon (bakkesegment)» forblir VALIDATED med påstanden innsnevret til den geometriske <c1/>; typen <c2/> hører til den nye raden.

seg-60d6ac0011f1 = Miljø for uavhengig referanse: Orekit { "13.1.8" } med Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Revisjoner: medfølgende <c1/> total tilgang { "1675" } s -> { "1659" } s (fem pass som før; beste maksimale elevasjon { "73.25" } grader -> { "70.08" } grader), og hver utdata fra <c2/> flytter seg med den nye banen (den utskrevne linjen i <c3/> og oppføringen <c4/> i <c5/> sier nå det); medfølgende <c6/> GNSS-VDOP ved ekvator { "1.19669" } -> { "1.19710" }, ved { "89.9" } grader { "1.50645" } -> { "1.50590" }, fusjonert VDOP ved { "89.9" } grader { "1.14388" } -> { "1.14250" } (de publiserte tallene med to desimaler { "1.20" }, { "1.51" } og { "1.14" } er uendret). Ingen golden fil endres.

seg-b65f3186a7e9 = Ikke rutet ennå: <c1/>, modusene doppler, joint og timing i <c2/> og referansebanen <c3/> (modellene deres ligger i <c4/> og <c5/>), og jordutforminger i <c6/> (et navngitt raskt nivå med tolegemeproblem).

seg-03f638f20376 = D6, referansegenerator for LunaNet AFS, LSIS V1.0 (fire nye rader, to VALIDATED: { "238" } -> { "242" } rader, validert { "121" } -> { "123" }).

seg-1d09f0582781 = <b>Referansegenerator for LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), festet til LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 av { "29" } januar { "2025" } og med den versjonen navngitt i hver utdata: bærebølgen på { "2492.028" } MHz; AFS-I BPSK({ "1" })-datakanalen med { "500" } symboler per sekund og dens Gold-kode med 2046 brikker; AFS-Q BPSK({ "5" })-piloten med dens primære Weil-kode på 10230 brikker, sekundære kode på 4 brikker og tertiære kode på 1500 brikker; rammen med identifikator { "0" } (synkroniseringsmønster, BCH ({ "51" }, { "8" }) delramme { "1" }, CRC-24, LDPC-delrammer med rate en halv { "2" } til { "4" }, blokkinterleaver { "60" } ganger { "98" }) med en uttømmende dekoder for delramme 1 og en min-sum LDPC-dekoder skrevet fra paritetskontrollmatrisen alene; og IQ-syntese i basebånd med referanseetiketter skrevet som et SigMF-opptak. Kodene genereres fra standardens skiftregistre og Legendre/Weil-konstruksjoner. Ingenting kopiert fra standarden distribueres videre (den har ingen vilkår for gjenbruk): de primære indeksene for AFS-Q kommer fra IS-GPS-800J, og det som bare standardens vedlegg definerer (AFS-I G2-forsinkelser, tertiære koder, LDPC-delmatriser) leses ved kjøring fra en lokal hurtigbuffer som <c2/> fyller fra den NASA-vertede PDF-en, hver fil kontrollert mot en festet SHA-256 (<c3/>). Modellen er en referanse for kontroll mot standarden, ikke en kanal-, utbredelses- eller linkbudsjettmodell.

seg-7b8cb0461377 = <c1/> og <c2/>: et opptak kan bære felt for navnerom-utvidelser deklarert i <c3/>.

seg-a9465820a1fc = Ny VALIDATED-rad «LunaNet AFS-basebåndgjengivelse mot en uavhengig generator, gitt dens kanaltilstand»: mot LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, S-bånd-bygg) null brikkeavvik over kodene for PRN { "1" } til { "210" }, null symbolavvik over de tre rammene i kjøringen, og en normalisert kompleks korrelasjon på { "0.999990" } over { "23.9" } s av dens egne sampler (verste blokk på { "2" } ms { "0.999948" }), innenfor terskler fastsatt før sammenligningen (forhåndsregistrert 986ac280). Den driver gjengiveren med simulatorens egen kanaltilstand og dekker ikke effektfordelingen ut fra bærebølge-til-støy-tettheten eller SigMF- og 8-bits-skrivingen.

seg-07edced2764a = Ny VALIDATED-rad «LunaNet AFS-kanalkoding av rammer, FID { "0" }»: rammene på 6000 symboler er like LANS-AFS-SIMs symbol for symbol (forhåndsregistrert 986ac280); koden for delramme 1 gjenskaper regneeksemplet i LSIS Figur { "8" } og CRC-24 kontrollverdien i katalogen for CRC-24/LTE-A.

seg-ab94ac9f41fc = Begge radene som er rykket opp, er datagated på LSIS-hurtigbufferen: testen mot den uavhengige referansen hoppes over med en merknad til <c1/> er kjørt.

seg-89a4bc4a766e = Funn (ny MODELLED-rad), «LunaNet AFS-generering av spredekoder»: av { "2 937 232" } genererte brikker og bits sammenlignet med standardens tabeller og Annex { "3" }-filer avviker én, «siste { "24" } brikker» som Tabell E-5 trykker for tertiær PRN { "147" }, som dupliserer cellen for PRN { "151" } mens standardens egen Annex { "3" }-fil stemmer med generatoren. Kriteriet om null avvik er bommet.

seg-d4e76301323f = Funn (ny MODELLED-rad), «LunaNet AFS lukket sløyfe, dekodbarhet»: tre forhåndsregistrerte kjøringer mot PocketSDR-AFS; den tredje møtte terskelene for sporing og dekoding i sin helhet, men ikke sitt vern mot at et mottakerbygg som bare skriver ut, gjenskaper loggen til det festede bygget, fordi to kjøringer av den uendrede mottakeren allerede avviker i fangstregistreringene sine.

seg-93cfa05a1923 = Rettet: standard bærebølge for <c1/> (<c2/>), <c3/> og <c4/> var avrundede { "2.4" } GHz; den er nå LSIS-020 AFS-bærebølgen, { "2492.028" } MHz. Ved den gamle standarden var frittromstapet undervurdert med { "0.327" } dB.

seg-ed7c170ccc2c = Revisjoner: ingen. Hvert medfølgende scenario navngir sin bærebølge, og resultatene fra alle { "138" } scenariofiler er byte-identiske med forrige main.

seg-3ec7f5b17122 = D7, virkelig IQ fra månen og GPS LNAV (sju nye rader, ingen VALIDATED: { "242" } -> { "249" } rader, validert { "123" } uendret).

seg-0c3dcf4f2b0f = <c1/>: en rask Fourier-transform (FFT) med blandet radix som gir de samme bitene på hver plattform; en SHA-256-festing av transformene på 8000 og 24000 punkter består på x86_64 og på wasm32-wasip1 (kjører i <c2/>).

seg-150d9809c584 = <c1/>: parallelt kodefasesøk på samplet IQ (<c2/>, <c3/>) med koherent folding, ikke-koherent akkumulering, en kjikvadratterskel for en falsk-alarm-sannsynlighet for hele søket og en statistikk med celleaveraging for båndbegrenset støy; <c4/>, <c5/> med kode-Doppler, og M2M4- og rutenetttopp-estimatorene for bærebølge-til-støy-tetthet (C/N0).

seg-46bda8ecf2cd = <c1/>: en koder for IS-GPS-200 legacy-navigasjonsmeldingen (LNAV) for delrammer { "1" } til { "3" }, med paritet fra Table 20-XIV og en felt-dekoder.

seg-43444792974c = <c1/>: en leser for ION GNSS SDR Metadata Standard (<c2/>) og dens samplefiler, med <c3/> for nivåer i toerkomplement.

seg-a7dfc3475923 = <c1/>: LuGRE-ens (Lunar GNSS Receiver Experiment) IQS-batchheader, RAW-, ACQ- og NAV-telemetri og CLK-filer, og en kontroll som lister opp hvor <c2/>-metadata motsier den binære headeren.

seg-f0125531c4f8 = <c1/> og, i <c2/>, kroppsreferansesystemet for yaw-styring, sendeazimut og off-nadir-vinkler, og <c3/> for relativ C/N0 med målte mønstre.

seg-679aa02de1d0 = Koding av GPS LNAV-navigasjonsmelding (ny rad, forblir MODELLED etter integratorens etterverifisering): på IGS-kringkastingsfilen for { "2" } mars { "2025" }, tolket og dekodet av RTKLIB v2.4.2-p13, består alle { "960" } ord paritet, alle { "96" } delrammer dekodes og alle { "608" } kringkastede heltall er lik Kshanas (<c1/>), men forhåndsregistreringen (d4d9eb9d) nådde den offentlige grenen to sekunder etter commit-en som holdt resultatet, så rekkefølgen «registrert før filen ble hentet» kan ikke vises og raden rykkes ikke opp.

seg-2875ba2d8f5f = <c1/> fyller ord fra mest signifikante bit (I i den høye nibbelen i en LuGRE-byte; den tidligere lesingen ga det konjugerte signalet), beholder den gamle lesingen som <c2/>, og leser sampler som er bredere enn et ord.

seg-f6e0e3b9b166 = <c1/>: fasekoherent Doppler-raffinering ({ "0.2" } Hz RMS ved { "30" } dB-Hz over { "200" } ms i simulering).

seg-b0f6a61acce0 = GPS L1 C/A mot gps-sdr-sim: brikker og paritetsbit bit-eksakte; { "230" } av { "1152" } LNAV-felt avviker med én enhet fordi gps-sdr-sim avkorter der det kringkastede heltallet trenger avrunding.

seg-1c525ca495c0 = LNAV dekodet av RTKLIB: all paritet og alle delrammer består og hver parameter er innenfor et halvt kvantum; { "41" } skalerte verdier avviker med noen få enheter i siste siffer gjennom RTKLIBs desimale { "2" }^-43-konstant, over den registrerte terskelen.

seg-14e26e69777b = LuGRE-fangst mot GNSS-SDR { "0.0.19" }: { "266" } av { "266" } beslutninger stemmer, { "250" } lokalisert i samme celle; de fleste positive er artefakter av et gjennomsnitt på −{ "0.5" } i de bare 4-bits nivåene; C/N0-leddet hadde ingen samtidige flydata. To batcher (OP5, OP12) ble utelatt ved en feil: metadataene deres stemmer med headerne, men leseren kunne da ikke lese en sample bredere enn et ord.

seg-3a32ff9d66fc = LuGRE-fangst mot orbit-predikert Doppler: med beslutningen om sampleeffekt krysser hvert søk på båndbegrenset støy; med beslutningen om celleaveraging stemmer de sterkeste parene i størrelse med motsatt fortegn, noe som viser at den registrerte I/Q-rekkefølgen er den konjugerte av dataene.

seg-2bb618ba4059 = Blind fangst på batchene fra månens overflate: fire batcher fanger hver én satellitt (predikert synlig, ingen falsk alarm ved { "1e-7" }), ingen to, så terskelen for Doppler-differanse har ikke noe par å score.

seg-f95606e17fd1 = Relativ C/N0 på månens avstand (M039 omformulert): { "15" } Block IIR/IIR-M-registreringer og ett par, for få for den registrerte terskelen.

seg-9306cf44fc44 = Revisjoner: ingen; ingen publisert tall, golden fil eller dokumentasjonsfigur er endret.

seg-2a3cb68c94d6 = Raden M039 «GNSS fra Jorden på månens avstand» omformulerer påstanden sin på månens avstand som den relative C/N0 mellom satellitter ved én epoke pluss synlighet (absolutt C/N0 hevdes ikke); den forblir MODELLED. Den øverste NOTICE-filen bærer kildehenvisningen for LuGRE CC BY { "4.0" }.

seg-e1e4094a186a = DE440-orienteringen av månens hovedakser interpoleres nå langs geodeten mellom daglige noder. Den tidligere elementvise interpolasjonen var feil med opptil { "2.0e-4" } rad ({ "340" } m på månens overflate) nær kvartpunktene i hvert døgn, ikke de «omtrent { "14" } m» raden oppga. Brukerne (geometri for lunar laser ranging, datum for månen, observerbarhet for feil på månen) får den korrigerte orienteringen.

seg-a2071d345923 = Rettinger i motoren for runde { "2" }, hver kjørt på nytt mot sin uendrede toleranse fastsatt på forhånd: IERS-vintagen til en EOP-rad leses fra I/P-flaggene i stedet for fra en tom Bulletin B-blokk; <c1/> bruker det geodetiske lokale nivået; koblingen i referansesystemet for rate på månen bruker ekvatorialradius, J2 og rotasjon; liu22-tilpasningen starter med null korreksjoner uten priorer og bruker artikkelens rate for middelbevegelse; nodeavstanden i EO bærer J2-noderegresjonen; syklusslipptiden for Costas bruker rho/4; den felles posisjonsbestemmelsen anvender den kringkastede gruppeforsinkelsen for paret; den felles løsningen for månen bruker et QR-steg; NTN-grensen evalueres i den sanne posisjonen; klokkereferansen for konstellasjonsutforming er konstellasjonen med lavest nummer i sikte; DE440-orienteringsserien spenner over 2014-2030 og gir feil utenfor i stedet for å avkorte.

seg-74f397ad9c16 = <c1/>, en referansebane bygd fra tabulerte jordfaste tilstander, brukt av sammenligningen med tilpasning til virkelig bane.

seg-7293b717d978 = Testfilene og testdataene for sammenligningene ovenfor, hver med sin generator og en <c1/> som oppgir kilde, lisens, hentedato og SHA-256.

seg-920fe965bda9 = Runde { "2" }: <c1/> og <c2/> (ADD v4.2-feildeteksjon, etter Stanford MAAST for ARAIM { "2" }, BSD-3-merknad i kilden); <c3/>; <c4/> og <c5/>; INS-feilmodellen med ni tilstander <c6/>; partielle deriverte for <c7/> og inndata for <c8/> på kjernebanen; <c9/>, en leser for SPK type { "2" } og binære PCK-kjerner; <c10/> med ITRF2020-stasjoner; Jacchia { "1971" }-tetthet; <c11/> over en hvilken som helst efemeridetilbyder; <c12/>; <c13/> og <c14/>; <c15/>; <c16/> (RINEX-klokke, ANTEX- og DCB-lesere).

seg-e3336e670d51 = En patchutgivelse på { "0.29.2" }. Kshana Studio er bygget om rundt to visninger: en enkel visning som svarer først og forklarer med vanlige ord, og en avansert visning med hele dashbordet. To små rettelser på kshana.dev følger med. Motoren endres ikke: hvert medfølgende scenario gir et byte-identisk resultat som i { "0.29.2" }, bortsett fra versjonsstempelet.

seg-c40ab967ace6 = <b>Kshana Studio har en enkel visning.</b> Det er den Studio åpner på.

seg-6a5ae001d00e = Svaret kommer først: et scenario åpnes på resultatet, formulert i én enkel setning. Hvert medfølgende scenario har sin egen setning, skrevet for det scenarioet måler.

seg-375421534e4c = Høyst fem innstillinger vises, de som endrer svaret mest. Resten ligger under «Avanserte innstillinger», skjult til du åpner dem.

seg-d8650ae64549 = «Slik beregnes dette» forklarer metoden i noen få linjer, og «For forskere» viser motorens egne tall, scenariofilen og evidensen bak resultatet.

seg-36af7640e6ad = <b>Hele dashbordet er den avanserte visningen.</b> Hvert panel, diagram, hver eksport og rapport fra den tidligere Studio-versjonen finnes der.

seg-0428d0a7921b = <b>En bryter bytter mellom de to visningene og husker hvor du var.</b> Scenarioet, visningen du var i og alle innstillinger du har endret blir med over. Studio husker hvilken visning du brukte sist. Lenker fra nettstedet og dokumentasjonen åpner den enkle visningen; en lenke med <c1/> åpner den avanserte visningen, og hver eldre Studio-lenke åpner fortsatt det samme scenarioet og den samme visningen.

seg-2c98ed084c10 = <b>En raskere første visning på trege forbindelser.</b> Det registrerte svaret for et scenario tegnes før resten av Studio er lastet, så på en treg mobilforbindelse vises svaret på omtrent to sekunder i stedet for omtrent ni.

seg-2214d2dcfab4 = <b>Bedre søk.</b> Et søk viser nå først scenarioer der området eller tittelen samsvarer med ordene, foran scenarioer som bare nevner dem i filnavnet eller teksten.

seg-aa8d43280c19 = <b>Globusen på forsiden blir ikke lenger tom når redusert bevegelse er slått på.</b> Med systeminnstillingen for redusert bevegelse på kunne en endring av vindusstørrelsen la globusen i toppfeltet stå tom til siden ble rullet. Globusen tegnes nå på nytt i samme bilde som størrelsesendringen.

seg-da4b78816df1 = <b>L-bånd-konsollen på forsiden forklarer det tomme båndet.</b> I «Watch a jammer take the band» forble panelet for GPS L5 / Galileo E5a mørkt i hele minuttet, noe som så ut som en feil. Ingen jammer sender i det båndet i dette scenarioet, og satellittsignalene ligger under støygulvet, så ingenting der stiger over det. En diskret merkelapp sier nå dette i alle panelstrekk der ingenting ligger over gulvet (L5 / E5a-panelet, og L2C-panelet før støyjammeren starter), med hvert båndets C/N0 og låsestatus fra samme kjøring. Den plasseres bare der ingenting er over gulvet, så den dekker aldri jammerenergi.

seg-e353fdee7033 = En patchutgivelse på { "0.29.1" }. Den fjerner duplisert kode i modulene for LEO-navigasjonsmeldinger, fusjon og spektrum, legger til et lyst tema på kshana.dev, flytter Kshana Studio til sin egen adresse, gjør nettstedet lesbart for søkemotorer og AI-assistenter, retter flere små ting i Studio og lar npm-utgivelser publiseres uten lagret token. Ingen motorutdata endres: hvert medfølgende scenario gir et byte-identisk resultat som i { "0.29.1" }, bortsett fra versjonsstempelet.

seg-e8bf0a4fdc35 = <b>Et lyst tema for kshana.dev.</b> Hver side kan leses lyst eller mørkt. Nettstedet følger leserens systeminnstilling og har en bryter for å endre den.

seg-8e7cabc14c40 = <b>Søkemotorer og AI-assistenter kan lese nettstedet.</b> Hver side har nå sin egen tittel, beskrivelse, kanoniske adresse, tagger for sosiale kort og strukturerte data fra schema.org, og ren tekst for de delene et skript tegner. Nettstedet publiserer <c1/>, en <c2/> med datoen hver side sist ble endret, <c3/> og <c4/> (en kort og en full tekstveiledning for AI-assistenter), og en IndexNow-nøkkel slik at en utrulling kan fortelle søkemotorer hva som er endret.

seg-804ba71be9ed = <b>npm-utgivelser kan publiseres uten lagret token.</b> npm-jobben kjører nå Node { "24" } og npm { "11.5.1" } eller nyere, som støtter npm trusted publishing: npm bytter utgivelsesjobbens GitHub-identitet mot en kortlevd legitimasjon. Hemmeligheten <c1/> virker fortsatt og brukes så lenge den er satt, så ingenting endres før trusted publishing er slått på for pakken på npmjs.com. <c2/> lister trinnene.

seg-81405e5a5e06 = <b>Overskriften på forsiden er lesbar over globusen.</b> En myk skygge ligger nå bak overskriften og teksten, og demper banelinjene og satellittprikkene i den animerte globusen der de krysser den.

seg-24b8363acc14 = <b>Kshana Studio har sin egen adresse: <a1>https://kshana.dev/studio/</a1>.</b> Hver lenke på nettstedet og i dokumentasjonen peker dit. Den gamle adressen, <c1/>, virker fortsatt og videresender til den nye, med scenarioet, visningen og de andre innstillingene i lenken bevart.

seg-12f223b986bd = <b>Rettelser i Studio.</b> Motorfilen lastes ned én gang i stedet for to. Mens den lastes ned, viser Studio scenarioets registrerte resultat med en gang, merket som registrert, i stedet for en tom skjerm. På en telefon er toppfeltet én kompakt rad. Nøkkeltallene brytes til to per rad, så ingen skjules utenfor skjermkanten. Feltetikettene bruker scenarioets egne ord, med feltnavnet ved siden av, og søket finner felt på begge.

seg-c130d8a4dc5e = <b>Mindre duplisert kode.</b> Enhetstabellen for LEO-navigasjonsmeldinger skrev de samme ti SISRE-statistikkradene for fire tilpasningssammendrag. Et makro skriver dem nå én gang. De to spektrum-fossefalldiagrammene deler én tidsakse, ett fargefelt og ett C/N0-søylepanel. Nedsamplingen av hovedrutenettet gjenbruker <c1/>, og Simpson-integralet gjenbruker <c2/>. De to inngangspunktene til LEO-passeringstypen deler ett oppsettstrinn. <c3/> importerer vektorhjelperne i <c4/> i stedet for å kopiere dem. Den avanserte rapporten importerer API-rapportens HTML-escape i stedet for å kopiere den. Hver av de { "139" } scenariofilene i <c5/> ble kjørt på { "0.29.1" } og på denne koden, og hver utdatafil er byte-identisk.

seg-166b0435c96f = <b>Enhetstabellene for leo-navmsg og leo-pvt har sine egne filer.</b> De er flyttet ut av moduler som også inneholder logikk, til <c1/> og <c2/>. <c3/> beholder sin offentlige sti. Bare disse to tabellfilene kommer inn under unntakene fra påvisning av kopiert kode for deklarative kataloger i <c4/>, som <c5/> kontrollerer.

seg-f8b372e08ef9 = <b>CI-merket i README viser resultatet av pushes til main.</b> Merket telte kjøringer av alle hendelser på main, så det kunne vise «failing» mens hver push-kjøring var grønn; det ber nå bare om push-kjøringer (<c1/>).

seg-7c41a482c7d8 = En patchutgivelse på { "0.29.0" }: det målte dekningstallet, prosjektets navnelinje på kshana.dev, en raskere dekningsjobb og en oppfrisket README. Ingen motorutdata endres: hvert scenario gir samme resultat som i { "0.29.0" }.

seg-997490bd1696 = Revisjoner av publiserte tall

seg-ed4b071e4bd9 = <b>Linjedekning: ~{ "96" } % → ~{ "95" } %.</b> Dekningsjobben målte den utgitte { "0.29.0" }-koden på nytt (commit <c1/>, CI-kjøring { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } av { "58,697" } linjer i <c3/>. Det publiserte tallet var { "95.63" } % ({ "37,697" } av { "39,419" } linjer), målt på <c4/> før { "0.28.0" }; det ble avrundet til ~{ "96" } %. Det nye tallet avrundes til ~{ "95" } %, så hver flate som <c5/> fester flytter seg samlet: <c6/>, README-merket, Evidens-linjen og CI-tabellen, merkene for crates.io, PyPI og npm, den tekniske rapporten og dekningssiden på kshana.dev. Gulvet på { "85" } % er uendret.

seg-577baa03af04 = <b>Navnelinjen på kshana.dev.</b> «Kshana · क्षण · the precise instant» åpner nå forsidens hovedfelt og står under merkenavnet i bunnteksten på hver side. kshana.dev sender fortsatt ingen forespørsel til en annen vert: devanagari-skriften er et selvhostet utvalg av Noto Sans Devanagari med de tre bokstavene i क्षण ({ "1,692" } bytes, <c1/>, med teksten i SIL Open Font License og SHA-256 i <c2/>). <c3/> har lært å lagre et utvalg fra Google Fonts <c4/> under et innholdsadressert filnavn.

seg-35b5bc4ee466 = <b>Lenkene på nettstedet lander der de peker, på rene adresser.</b> En lenke til en seksjon plasserer nå seksjonen rett under toppfeltet, på telefon og på stasjonær: en sektorlenke i Missions åpner den sektoren med panelet øverst; lenker i Capabilities og Editions holder plassen mens diagrammene over dem tegnes; Editions legger ikke lenger til en ekstra toppforskyvning; og en lenke inn i en sammenfoldet del av en dokumentasjonsside åpner den. Hver side lenkes med sin rene adresse (<c1/>, <c2/>, <c3/> for forsiden), og de kanoniske lenkene, områdekartet og omdirigeringene fra gamle adresser bruker de samme; adressene med <c4/> virker fortsatt. Research har sin egen lenke i toppfeltet, mellom Evidence og Developers, og i bunnteksten. Dokumentasjonen viser ikke lenger veikartet (<c5/> blir i depotet): gruppen Project er Changelog, Licensing, Security, Contributing, Governance og Code of conduct, og Glossary er flyttet til Get started.

seg-3da9f00f5ce6 = <b>Dekningsjobben er raskere.</b> På { "0.29.0" } tok den { "143" } minutter mot friske { "91" } til

seg-85d502773367 = Fuzzeren <c1/>, årsaken forrige gang, tok { "4" } av dem. Det medfølgende korpuset vokste fra { "74" } til { "139" } scenarioer, og tre testbinærfiler gikk gjennom hele korpuset én fil om gangen (<c2/> to ganger, <c3/> og <c4/> én gang): { "37" } minutter til sammen under dekningsinstrumentering, mot { "3" } på { "0.27.2" }. De deler nå <c5/>, som kjører arbeidet per scenario på hver kjerne og leverer resultatene tilbake i sortert rekkefølge; hvert scenario og hver påstand blir stående. På en bærbar arm64, debug-bygg: <c6/> tar { "143" } s på { "14" } kjerner mot { "612" } s med <c7/> (den gamle serielle gjennomgangen).

seg-bb69dbadbc81 = <b>README, oppfrisket.</b> Den åpner med den samme navnelinjen som nettstedet; Studio-skjermbildene er tatt på nytt fra Studio { "0.29.1" }, med et nytt av Studio på en telefon og dens trinnlinje nederst; en ny stripe «The site» viser tre sider av kshana.dev fra bygget { "0.29.1" } (<c1/>, satt sammen av <c2/> og registrert i <c3/>); dekningstallet er ~{ "95" } %; og alternativteksten til forskningsfiguren, som gjentok arkitekturfigurens, beskriver nå artiklene. Merkene i toppen er mindre og kortere ({ "18" } px høye; «~{ "95" }%», «83/223», «quality», «AGPL-3.0», «zenodo.20528627»), så de elleve får plass på to linjer; hver lenke og alternativtekst beholder sin fulle mening.

seg-f61ef3e16884 = <b>Jobben for containerbildet får { "90" } minutter.</b> Ved { "v0.29.0" } nådde det emulerte linux/arm64-bygget av bildet <c1/> den gamle grensen på 45 minutter mens den siste crate-en ble kompilert, så bildet, oppføringen i MCP-registeret og kanalkontrollen ble ikke publisert. Grensen er nå { "90" } minutter; bildet er uendret.

seg-1688bf9f0fec = <b>Åtte flyttallsliteraler gruppert på nytt</b> i <c1/> og <c2/> (<c3/> → <c4/>): SonarQube Cloud leste en siste gruppe på <c5/> eller <c6/> som et manglende suffiks <c7/> eller <c8/> (regel S7454). Verdiene er de samme tallene, så hvert resultat er uendret.

seg-81fd160937db = Tolv nye scenariotyper og tre nye måter å lese en kjøring på. Motoren dekker nå radiospekteret, hele solsystemet, konstellasjoner rundt et hvilket som helst legeme, kampanjer som lenker scenarioer til ett oppdrag, og posisjonering, navigasjon og tidssynkronisering (PNT) fra lav jordbane (LEO) fra signalet til posisjonsbestemmelsen. Hver kjøring kan også skrives som en animasjon, en full rapport og et sett interoperabilitetsfiler for andre verktøy.

seg-118be64d7cb2 = Rundt motoren: en nytegnet kshana.dev (et nettsted med flere sider, og et nytt Kshana Studio-dashbord som kjører hver funksjon i nettleseren), en omskrevet README, fjorten verktøy på Model Context Protocol-serveren (MCP), et nettleserbygg som gir de samme tallene som det native, og en offentlig side for Kshana Pro.

seg-ea31356bc17d = Scenariofiler (pluss ett suitemanifest)

seg-26654cd81de1 = { "138" }, hvorav { "132" } er medfølgende for <c1/>

seg-3d1a85e93e48 = hvorav MODELLED (oppgitt modell, kontrollert for intern konsistens)

seg-e77f9d273ee1 = hvorav PARTNER (trenger en partners maskinvare eller data)

seg-e94cd6b3561a = Hvor veksten kommer fra:

seg-1759a8cce7d6 = Typer

seg-94de9433d99f = Scenariofiler

seg-03d7aea335dc = Matriserader (validert + modellert)

seg-fdd674722717 = Spektrum

seg-59583fa40da3 = Solsystemet og posisjonering rundt et hvilket som helst legeme

seg-fafa167623df = Scenarioer for sjø, vei og bane

seg-fc571c46e522 = Animasjon, rapporter, interoperabilitetseksporter

seg-2746e0d9f787 = LEO-signaldesign og flerbåndsspekteret

seg-d40ec114d1f9 = LEO-posisjonering, tidssynkronisering og fusjon

seg-0157f649e65b = LEO-kjeden fra ende til ende

seg-423283112128 = LEO-robusthet, fokusområder og sluttbrukerscenarioer

seg-395beca13299 = Totalt lagt til

seg-ea9dc4093d8a = LEO-funksjonen er systemuavhengig: den kjører på generiske, oppgitte parametere og trenger ikke noe navngitt system. Navngitte systemer er valgfrie forhåndsinnstillinger, hver i sin egen fil med sin offentlige kilde. Én forhåndsinnstilling, Celeste IOD (in-orbit demonstration), bruker tall presentert på ESA NAVISP LEO-PNT-workshopen, { "2026" } (ESA er European Space Agency; NAVISP er dets Navigation Innovation and Support Programme); den ligger i én fil, <c1/>, med sine fem scenarioer som bare finnes i depotet, så den kan holdes tilbake uten kildeendring, og ingen av workshop-tallene gjentas i denne endringsloggen.

seg-c36a5015c03c = <b>Les «Revisjoner av publiserte tall» før du oppgraderer.</b> Én motorutdata endres (kolonnene i treghetsreferansesystemet for typen <c1/>, etter en fortegnsrettelse i nutasjonsmatrisen), og dokumentasjonsrevisjonen rettet tall som tidligere dokumenter hadde trykt.

seg-7fe505d3232b = Statuser: <b>VALIDATED</b> betyr kontrollert mot en uavhengig ekstern referanse (en publisert tabell, en annen gruppes programvare eller målte data); <b>MODELLED</b> betyr en oppgitt modell som bare er kontrollert for intern konsistens; <b>PARTNER</b> betyr at kontrollen trenger en partners maskinvare eller data.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project; femte generasjons mobilnett; ikke-terrestrisk nett

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = kalenderæraer (anno Domini, før Kristus)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternativ binær offsetbærebølge; binær offsetbærebølge; binær fasetastmodulasjon; multiplekset binær offsetbærebølge (signalmodulasjoner)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (en publisert LEO-efemeridemodell)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = grov-/oppsamlingskoden (coarse/acquisition) og bærebølge- og sivilsignalnavnene i Global Positioning System

seg-e464509f3abb = forholdet mellom bærebølge og støytetthet

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = kommandolinjegrensesnitt

seg-9aa3c2e54398 = 24-bits syklisk redundanssjekk (Qualcomm-polynom)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = kommaseparerte verdier; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform ressurslokalisator

seg-3ad592244ea8 = kontinuerlig bølge

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (kart- og globusformater)

seg-3415aa029e39 = Development Ephemeris { "441" } fra Jet Propulsion Laboratory

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital objektidentifikator

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = svekkelse av presisjon (dilution of precision): geometrisk, posisjon, horisontal, vertikal

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = signalnavn i Galileo

seg-544f4fcbd68f = et sporenavn i konstellasjonstabellen til Global Positioning System

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = jordsentrert, jordfast

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = jevndøgnsligningen

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = ekvivalent isotropisk utstrålt effekt

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (astronomibiblioteker brukt som referanse)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = European Space Agency; dets Navigation Innovation and Support Programme

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = frekvensdelt flertilgang

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = Russlands Global Navigation Satellite System

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = globalt satellittnavigasjonssystem; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = International Astronomical Union

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = grensesnittsspesifikasjon (interface control document); Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Den internasjonale sjøfartsorganisasjonen

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = treghetsnavigasjonssystem; mikroelektromekanisk system

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = demonstrasjon i bane

seg-92cd0058a058 = IQ

seg-c7fa50165400 = i fase og kvadratur

seg-41471e51e661 = grensesnittspesifikasjonen til Global Positioning System

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Den internasjonale romstasjonen

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-jordfast; sann ekvator, middels jevndøgn (referansesystemer)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Den internasjonale teleunion; dens radiokommunikasjonssektor

seg-a524e4c4a670 = forholdet mellom jammer og signal

seg-5d93361e20d4 = J2 til J6, J2000

seg-50255586b303 = sonale harmoniske i gravitasjonsfeltet; epoken 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Jet Propulsion Laboratory

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = lav jordbane; middels jordbane

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = modellbasert systemutvikling

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = normalisert estimeringsfeil i annen potens

seg-56d5135d987d = ionosfæremodellen til Galileo

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (presise baner); tolinjers elementsett

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = posisjonering, navigasjon og tidssynkronisering; presis punktposisjonering

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = effekttetthetsspekter; spektral separasjonskoeffisient

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = mottakerens autonome integritetsovervåking; overvåking av signalkvalitet

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = kvadratisk middelverdi

seg-e1c3c49833fc = et åpen kildekode-bibliotek for GNSS-posisjonering, brukt her som uavhengig referanse

seg-9ead536db4aa = Simplified General Perturbations { "4" } (banemodellen til tolinjers elementsett)

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bit

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = avstandsfeil i signalet i rommet

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (dets efemeridefilformat <c1/>)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = identifikator for romfartøy

seg-de4e841ce8a2 = en Walker-konstellasjons totale antall satellitter, baneplan og faseforskyvning

seg-4d6ebfefc096 = TEC

seg-5149401781dd = totalt elektroninnhold

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahøy frekvens

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = koordinert universaltid

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = signalnavn i Xona Pulsar-systemet

seg-d6a3f210958a = Et endret publisert tall er en revisjon og blir registrert, aldri rettet i det stille. Denne utgivelsen har én revisjon av motorutdata og flere av tall som er trykt i dokumentasjonen.

seg-1669eb4224f1 = Motorutdata

seg-185961ebab61 = TEME→GCRS-reduksjonen dreide med { "2" }·Δψ: nutasjonsmatrisen hadde fortegnet til Δψ snudd.

seg-504b78f30c54 = <c1/> bygde <c2/> der SOFAs <c3/> bygger <c4/>, så <c5/>, <c6/>, <c7/> og <c8/> roterte med det dobbelte av nutasjonen i lengde, omtrent { "25" } buesekunder. Hver kontroll av kjeden var en egenskapstest (ekte rotasjon, rundtur, et ikke-null nutasjonsbidrag) som et fortegnsslurv passerer; ende-til-ende-testen mot Vallado dekket TEME→PEF, TEME→ITRF og GCRS→ITRS, men ikke TEME→GCRS. På Vallado-eksempelet (AIAA 2006-6753, 2004-04-06) bommet kjeden på den publiserte GCRF med { "1 145" } m; den lander nå { "0.11" } m fra den, og matrisen er lik ERFAs <c9/> til { "1e-14" }. <c10/> og <c11/> feiler begge med det gamle fortegnet. Konsistenstesten for CIO (Celestial Intermediate Origin) i <c12/> hadde satt det resulterende avviket på ~{ "130" } m ned til «≈ { "2" }·EE»; resten er nå { "5" } cm og grensen er strammet inn fra { "250" } m til { "1" } m. <b>Dette flytter publiserte tall, registrert her som en revisjon:</b> kolonnene <c14/> og <c15/> for typen <c13/> (omtrent { "0.8" }–{ "1.0" } km for det medfølgende ISS-scenarioet (International Space Station); kolonnene for TEME, jordfast, sporet på jorden, siktevinkler og Doppler endres ikke), og <c16/> / <c17/> for referansesystemene GCRS og ITRS. Ingen medfølgende scenarios sammendragslinje, diagram eller golden-hash leser disse kolonnene. De nye interoperabilitetseksportene bruker den rettede kjeden: CZML-posisjonen til den første <c18/>-satellitten stemmer med en ERFA-reduksjon av samme TLE (propagert av Python-pakken <c19/>) til { "2.3" } cm.

seg-a0a4026d22ed = <b>Typen <c1/>, native og i nettleserbygget.</b> Typen beregner nå hver transcendental funksjon gjennom ett portabelt matematikkbibliotek, så rammen er de samme bytene på hver plattform og i hvert bygg (under Fixed). Hvert tall for <c2/> flytter seg med det, og det samme gjør trinnet <c3/> i <c4/>. Typen er ny i denne utgivelsen, så ingenting fra en tidligere utgivelse flytter seg, men tall trykt før rettelsen gjør det: kontrollverdien i <c5/> for scenarioet som koder og dekoder var <c6/> og er <c7/>, og SISRE for den dekodede meldingen er { "0.129" } cm. På kshana.dev viste Missions-kortet for <c8/> en verste avstandsfeil på { "1.6" } mm med en tilpasning på { "60" } s og { "40.3" } mm med en tilpasning på { "900" } s; nettstedet er nå bygget fra denne utgivelsens motor og viser { "1.8" } mm og { "46.6" } mm.

seg-77f441bfc3c3 = <b>Kartet over jamming-fotavtrykk på kshana.dev (Missions).</b> Hver av de { "875" } cellene er én kjøring av <c1/> der bare mottakerens posisjon er endret. Cellene beregnes nå ut fra de samme koordinatene med tre desimaler som cellens lenke «open this run» gir til Kshana Studio, så en celle viser nøyaktig det lenken gjengir. Gjennomsnittlig forhold mellom jammer og signal (J/S) for { "30" } celler flytter seg med { "0.1" } dB, opp eller ned; ingen celles sporingstilgjengelighet endres. Motoren gir identiske resultater for hver celle i { "0.28.0" } og { "0.29.0" }.

seg-146588a39e7c = <b>Seedet resampling i WebAssembly-pakken (WASM).</b> Nettleserbygget trakk andre bootstrap- og shuffle-indekser enn det native bygget fra samme seed (under Fixed). Intervallet for <c1/> for arealet under kurven i nettleseren var <c2/> og er nå det native <c3/>. Ingen native tall flytter seg.

seg-017810049453 = Tall trykt i dokumentasjonen

seg-85ab2a364a37 = Dokumentasjonen ble revidert ord for ord mot kjøringer av denne utgivelsens motor. Der et trykt tall ikke stemte med kjøringen, ble dokumentet rettet, og hver rettelse er listet her, gammelt → nytt. I hvert tilfelle nedenfor endret ikke motorutdataene seg; dokumentet hadde feillest, feilrundet eller overlevd dem.

seg-1eacdefbfda2 = <b>Dokumentasjonsrevisjon av sidene om spektrum, konstellasjon, kampanje, animasjon, rapport og interoperabilitet, og en ny <c1/>.</b> Hvert tall ble kjørt på nytt med denne motoren. To publiserte tall flytter seg: <c2/> oppga dekningstesten med { "5" } 000 satellitter som «om lag { "0.13" } s i et debug-bygg»; det lot seg ikke gjengi ({ "1.24" } s på en belastet bærbar), så siden oppgir nå forfilterets andel som testen skriver ut ({ "9.9" } % av { "19 440 000" } partester) og { "0.14" } s for release-binærfilen for det medfølgende <c3/>. Den samme siden oppga kryssingen til E3F som «feil med { "0.050" } deg»; ingen test skriver ut det tallet, så siden oppgir nå bare terskelen på { "0.06" } deg som testen håndhever og utledningen { "7.30" } mot { "7.36" } deg bak den. Ingen motorutdata endres.

seg-2ad182e2db15 = LEO-PNT-dokumenter: reviderte publiserte tall (kjørt på nytt med denne utgivelsens motor).

seg-6c2401365dd5 = <c1/> båndavveining: den første ordens ionosfæriske forsinkelsen for <c2/> er { "3.24" } m (var trykt { "3.25" } m) og for <c3/> { "0.77" } m (var { "0.78" } m). <c4/> koding og dekoding: SISRE for den dekodede meldingen var trykt { "0.119" } cm der kjøringen ga { "0.122" } cm; siden oppgir nå { "0.129" } cm, tallet etter rettelsen for plattformuavhengighet under Fixed nedenfor. <c5/> LEO mot GNSS-passering: { "32" } dB mindre fritt-rom-tap ved passeringens topp (var «{ "26" } til { "32" } dB»). For signal- og passeringstallene endret ikke motorutdataene seg; dokumentene hadde feillest eller feilrundet dem.

seg-fc3c8ba1b789 = <b>Veiledningene, det gjennomgåtte pipeline-eksempelet og kommandoen <c1/>, revidert mot denne utgivelsens motor.</b> Revisjoner av publiserte tall, gammelt → nytt: typene som skriver <c2/> er seks, ikke fire (<c3/> og <c4/> manglet; <c5/>, <c6/>); kryssingen for kald-atom ½bT² i veiledning { "3" } er { "18,443" } s, ikke { "18,440" } s; rundturfeilen for <c7/> i <c8/> er de målte { "4.88e-7" } km, ikke «~{ "1e-7" } km»; CSAC-holdover-båndet i veiledning { "2" } er de { "2000" }–{ "3200" } s testen påstår, ikke «~{ "2600" }–{ "4400" } s»; veiledning { "1" } siterer SP3-radene og geometriblokken med den presisjonen motoren skriver dem. Ingen motorutdata endret seg.

seg-4c613cabb87b = Sidene om validering, kvante, SGP4, animasjon, påstander og integritet.

seg-c49d5cdb36e1 = <c1/>: den håndhevde grensen for den simulerte Allan-avviket ved ett sekund for en klokke med hvit frekvensstøy er { "20" } % (var trykt { "25" } %; grensen på { "25" } % er den på kurven ved { "1" }, { "10" } og { "100" } s); raden for hastighetens tilfeldige vandring oppgir nå sin håndhevde grense på { "20" } % ved siden av de omtrent { "12" } % som ble observert; og tilgjengeligheten til den brikkeskala atomklokken i <c2/> er omtrent { "0.73" } (var trykt omtrent { "0.83" }). <c3/>: den vibrasjonsbegrensede støyen per skudd i sidens gjennomgåtte kaldatomeksempel er omtrent { "46" } ganger skuddstøygulvet (var «~{ "45" }×»; { "46.49" } beregnet på nytt), og området «{ "1" }–{ "50" } µg/√Hz» for utstyr i bruk, som motsa en enhet siden selv siterer, er erstattet av de to siterte enhetenes publiserte tall. <c4/>: den verste posisjonsforskjellen er { "4.12" } mm (var «≈ { "4" } mm»), med satellitten navngitt. <c5/>: videokoder-eksempelet leste bildene med { "24" } bilder per sekund ved { "12" }; det bruker nå { "24" }, raten bildemanifestet oppgir. <c6/>: jamming-modellen har { "10" } tester (var { "8" }), og det koblede filterets «{ "2.97" } m mot { "48.8" } m» er erstattet av det testen påstår (den koblede posisjonsfeilen under { "0.6" } ganger den frakoblede, og vinner i minst { "90" } av { "100" } forsøk). <c7/>: stempelet «Today» sa { "v0.22.0" }; det navngir nå denne utgivelsen, og to funksjoner bygget siden (feilmodusen for hele konstellasjonen og støttemeldingen for integritet) er fjernet fra gaplisten.

seg-4fde8788f95f = <b>Scenariotypen <c1/>: en L-bånd-spektrummodell og et fossefalldiagram</b> (<c2/>, <c3/>, <c4/>). Hele GNSS L-båndet som ett effekttetthetsspekter (PSD): GPS L1 coarse/acquisition (C/A) og L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (multiplexed binary offset carrier, MBOC(6,1,1/11), eller BOC({ "1,1" })), GPS L5 og Galileo E5a (BPSK({ "10" })), et kT-støygulv med en støytallsverdi for mottakeren, og jammere med kontinuerlig bølge (CW), smalbånd, chirp og matchet støy på en skriptet tidslinje. Hver jammer vurderes per bånd med sin spektrale separasjonskoeffisient (SSC), noe som gir forholdet mellom jammer og signal (J/S) og effektiv bærebølge-til-støytetthet (C/N0) per bånd per rad. Diagrammet er et SVG-fossefall med C/N0-søyler; result.json bærer rutenettet effektmiddelt per blokk. Valgfri <c5/> tegner modellen som IQ-sampler, skriver og leser en opptaksfil i Signal Metadata Format (SigMF) (<c6/>, <c7/>) og sammenligner et Welch-estimat med modellen; valgfri <c8/> estimerer en ekte SigMF-fil. Medfølgende eksempel <c9/>: en chirp tar L1 C/A og E1 ved { "10" } s, en CW-tone på L1-bærebølgen holder C/A på { "17.98" } dB-Hz etter at chirpen stopper mens E1, hvis spekter har et nullpunkt der, kommer seg; L5 og E5a er urørt.

seg-fa9976349886 = Ny VALIDATED rad: signal-PSD-ene og SSC-ene, mot hovedloben til BPSK(n) på 2n x { "1.023" } MHz, BOC({ "1,1" })-lobene sentrert ved +/-1.023 MHz, de lukkede Parseval-formene bak de publiserte SSC-ene på -61.8 / -64.8 / -67.8 dB/Hz, og lærebokens Q = { "1" } (CW) og { "1.5" } (matchet). Maksimum for BOC({ "1,1" })-PSD er ved +/-0.759 MHz, ikke ved lobens sentrum; testen fester begge.

seg-411431a9b26b = To nye MODELLED rader: fossefallet og C/N0-tidslinjen, som reduseres nøyaktig til kjeden for typen <c1/> (krysskontrollert i hver rapport), og SigMF-kodeken og Welch-estimatoren. Ingen opptak fra tredjepart ligger i depotet.

seg-5c5c695e7c0a = <c1/>: en MBOC-variant og <c2/>.

seg-bb346f4942a9 = Rapporten skriver ut C/N0 som den representative Q-tabellen for typen <c1/> ville gitt ved siden av den spektrumutledede; for en CW-tone på C/A-bærebølgen avviker de med { "1.8" } dB. Tre nye matriserader: én validert (signalspektre og spektrale separasjonskoeffisienter) og to modellerte.

seg-673dfe048dad = <b>Solsystemets efemeride og posisjonering rundt et hvilket som helst legeme.</b> To nye scenariotyper.

seg-3e1b0e8e99e9 = <c1/>: Solen, de åtte planetene, Pluto, Månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto og Titan ved én epoke: heliosentrisk posisjon og hastighet i International Celestial Reference Frame (ICRF), gravitasjonsparameter, radier, J2 (den andre sonale harmoniske) der den er publisert, siderisk rotasjon, polen og nullmeridianen til International Astronomical Union (IAU), et banespor over én omdreining, og lysets gangtid, ensrettet og tosidig avstand, solens Shapiro-forsinkelse og avstand fra Solen sett fra et observatørlegeme og for en hvilken som helst ekstra lenke. Planetene kommer fra de keplerske elementene til Jet Propulsion Laboratory (JPL) av Standish og Williams (tabell { "1" }, { "1800" } AD til { "2050" } AD; tabell 2a/2b, { "3000" } BC til { "3000" } AD); månene fra JPLs middelelementer med IAUs synkrone rotasjonsrate, og Titan fra IAUs rotasjonsmodell. Eksempel: <c2/>.

seg-6a094973208b = <c1/>: en orbiter eller en landingsfarkost på overflaten rundt et hvilket som helst av disse legemene, som navigerer med pseudoavstander fra en Walker-konstellasjon rundt legemet og en klokkefri tosidig avstand fra Jorden; svekkelse av presisjon, formell usikkerhet og seedede minste kvadraters posisjonsbestemmelser med og uten Jord-lenken. Eksempler: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> får Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto og de sju månene, et navneoppslag og en fysisk post; <c2/> gir et hvilket som helst legeme i forhold til et annet gjennom den eksisterende grensen <c3/>.

seg-8b5c2fbe91f7 = VALIDATED mot JPL Horizons (Development Ephemeris DE441; fixtures og spørringer i <c1/>): Merkur til Saturn og Jorden fra tabell { "1" } innenfor det dobbelte av den oppgitte nominelle feilen (verst { "1.87" } ganger), alle åtte planetene fra tabell 2a/2b (verst { "1.71" } ganger), og lysets gangtid fra Jorden til Mars og Jupiter. MODELLED: Uranus og Neptun fra tabell { "1" }, som overskrider den oppgitte feilen mot DE441 ({ "2.0" } og { "5.2" } ganger), Pluto, månene, legemekonstantene og resultatene for <c2/>.

seg-a3c83f6d2078 = Funn: den lunare serien til Montenbruck & Gill i <c1/> er allerede referert til J2000-jevndøgnet av sitt eget presesjonsledd ({ "0.05" } grader fra Horizons), så den brukes uten en ytterligere presesjonsrotasjon. Seks nye matriserader: to validerte (planetposisjoner, lysets gangtid) og fire modellerte.

seg-564133d6a0c4 = Konstellasjoner rundt et hvilket som helst legeme

seg-d1ddb76d8bf3 = <b>Konstellasjonsdesign i stor skala (typen <c1/>, <c2/>).</b> Walker delta- og Walker star-mønstre (T/P/F), eksplisitte elementlister og design med flere skall, flere konstellasjoner per kjøring, rundt Jorden, Månen, Mars eller en hvilken som helst annen planet, Pluto eller en stor måne ut fra legemekonstantene som typen <c3/> la til. Forhåndsinnstillinger fra publiserte nominelle elementer: grunnlinjen for Global Positioning System (GPS) og den utvidbare konstellasjonen med 24 spor (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document utgave { "1.1" }), BeiDou middels jordbane Walker 24/3/1 pluss geostasjonære og skråstilte geosynkrone satellitter (Open Service Performance Standard { "3.0" }) og GLONASS 24/3/1 (Interface Control Document { "5.1" }). Dekning og svekkelse av presisjon (DOP) over et rutenett av breddegrad/lengdegrad: satellitter i sikte, GDOP, PDOP, HDOP og VDOP (geometrisk, posisjon, horisontal, vertikal) og tilgjengelighet per celle, globalt og på det verste stedet, med én mottakerklokke per konstellasjon. Et synlighetsforfilter (dekningshalvvinkel pluss et bånd av undersatellittbredde, nøyaktig på et sfærisk legeme) kjører { "5 000" } satellitter på et rutenett på { "10" } deg på omtrent { "0.13" } s i et debug-bygg.

seg-8f4ebd177f3d = VALIDATED: Walker-generatoren gjengir tabell { "23" } i Galileo OS SDD og sporformelen i GLONASS ICD; GPS-forhåndsinnstillingen gjengir ekvatorkryssingskolonnen i SPS PS ({ "35" } av { "36" } steder innenfor { "0.0108" } deg; E3F innenfor { "0.06" } deg, siden tabellens egen rad er selvmotsigende); den globale HDOP-fordelingen for GPS-grunnlinjen stemmer med SPS PS vedlegg B (median { "0.940" } mot { "0.94" }, { "95" } % { "1.255" } mot { "1.25" }, middel { "0.965" } mot { "0.96" }; terskel { "0.03" }).

seg-65658a896a73 = MODELLED: vilkårlige design, andre legemer, BeiDou-fasen og de skråstilte geosynkrone nodene, tolegemebaner med valgfri J2, bare geometri.

seg-3dfe470e8a5c = Scenarioer: <c1/> ({ "102" } satellitter, tilgjengelighet { "100" } %, median PDOP { "0.95" }, { "31.0" } i sikte over { "10" } deg), <c2/> ({ "5 000" } satellitter, tilgjengelighet { "99.22" } % ved PDOP { "3" } eller lavere over { "20" } deg, { "0" } % ved polarkalottene, forfilteret beholder { "11.5" } % av partestene), <c3/> ({ "14" } satellitter rundt Månen, tilgjengelighet { "21.33" } % totalt og høyest over sørpolområdet). Alle tre er medfølgende for <c4/>. Merknader: <c5/>. Tre nye matriserader: to validerte (Walker-generator og GNSS-forhåndsinnstillinger, global DOP for GPS) og én modellert.

seg-79e2d2c42166 = En kampanje drevet av spektrummodellen, og konstellasjoner rundt et hvilket som helst legeme.

seg-4ab5f6f6bbbb = <c1/> lenker typen <c2/> med en klokke-holdover og en integritetsovervåker (en chirp tar L1 C/A og E1; en CW-tone holder så C/A nede mens E1 kommer seg og mottakeren faller tilbake til en himmel med bare Galileo), festet mot det frittstående fossefalleksempelet i <c3/>. <c4/> løser nå sitt sentrallegeme gjennom <c5/>, så en konstellasjon kan legges rundt en hvilken som helst planet, Pluto eller stor måne med konstantene som typen <c6/> bruker.

seg-dc904f639fed = <b>Kampanjer: mange scenarioer satt sammen til én kjøring.</b> En ny type <c1/> (<c2/>, dokumentert i <c3/>) kjører medlemmer av eksisterende typer gjennom samme utsending som kommandolinjen og leser tall tilbake ut av resultatene deres. Fire seksjoner, i en hvilken som helst kombinasjon:

seg-903ee141047a = <c1/>: et lenket oppdrag på én tidslinje. Forhåndsinnstillinger per type leser klokkens tidsfeil mot sin vaktgrense, det effektive middelforholdet mellom bærebølge og støytetthet (C/N0) mot sporingsgulvet, det vertikale beskyttelsesnivået mot alarmgrensen, posisjonsfeil, satellitter som spores og alarmflagg, holdt på et felles rutenett med fasegrenser og hendelser. Tilstand føres videre av <c2/>, <c3/> og <c4/>.

seg-4eeedde09a77 = <c1/>: én til tre punktnøkler av en hvilken som helst type, eventuelt med et seedet ensemble i hver node.

seg-4c113198cbb7 = <c1/>: realisasjon k med basisseed + k, med middel, spredning, persentiler og et bootstrap-konfidensintervall på { "95" }% med fast seed.

seg-df107253752d = <c1/>: delte verdier bundet til flere medlemmer, med et kombinert beste og verste sammendrag. Hvert resultat bærer en kampanjehash og en digest over hvert medlemsresultat. Fire medfølgende scenarioer: <c2/> (nominelt, jamming, spoofing avsluttet ved klokkeovervåkerens deteksjon etter { "370" } s, holdover som bærer den spoofede forskyvningen på { "37.0" } ns med en treghetsenhet som kjører fritt, en integritetsalarm, gjenoppretting), <c3/>, <c4/> og <c5/>. <c6/> fester sammensetningsidentitetene: en kampanje med én fase gjengir den frittstående kjøringen bit for bit på tre typer, et ensemble med fast seed er byte-stabilt, og på en klokke med hvit frekvensstøy ligger ensemblets middel innenfor det rapporterte intervallet med spredningen innenfor khikvadrat-intervallet for sqrt(q_wf * tau) = { "16.459" } ns. Tre nye modellerte matriserader.

seg-c611ee59301a = Animasjon

seg-14b2d3cc9e7c = <b>Animasjonseksport (<c1/>, <c2/>, <a1><c3/></a1>).</b> Enhver kjøring der resultatet bærer en tidsserie kan nå skrives som en animert Scalable Vector Graphics-fil (SVG) (Cascading Style Sheets-keyframes, uten skript: kurvene tegnes inn bak en bevegelig tidsmarkør), en enkelt selvstendig HyperText Markup Language-spiller (HTML) (spill av og pause, skrubbing, hastighet, alle paneler på én synkronisert markør, hendelsesmarkører som søker ved klikk; ingen ekstern ressurs), eller en nummerert SVG-bildesekvens med en <c4/> som oppgir bilder per sekund, varighet og bildetider for en videokoder. En kampanje spilles som sine faser med alarmene markert; en spektrumkjøring animerer fossefallet rad for rad. Spilleren følger <c5/>, og under <c6/> viser både SVG-en og spilleren det ferdige bildet i stedet for å bevege seg. <c7/> og <c8/> setter avspillingen; <c9/> og <c10/> er bibliotekets inngangspunkter, og <c11/> får en blokk <c12/> bare når <c13/> kjøres. Utdata er en ren funksjon av resultatet og valgene, byte-identisk ved ny kjøring, uten tidsstempel. En type uten samplet tidsakse avvises med «no time series to animate» og ingenting skrives. Eksportøren tegner kjøringens egne sampler og legger ikke til noe tall, så den er MODELLED (intern konsistens) og har ingen rad i verifikasjonsmatrisen; ingen publisert tall endres. Tester: <c14/> (determinisme, antall bilder, ingen ekstern adresse, velformet XML, stien for redusert bevegelse, og hvert medfølgende scenario med en tidsserie som animeres).

seg-c01b78b64065 = Rapporter

seg-2662fdb991f3 = <b>Avanserte kjøringsrapporter (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Hver kjøring fra kommandolinjegrensesnittet (CLI) skriver nå <c2/>, en utskriftsvennlig HyperText Markup Language-rapport (HTML), og <c3/>, det samme innholdet som et maskinlesbart JavaScript Object Notation-dokument (JSON). Seksjoner: et sammendrag for ledelsen; hver scenarioinndata med enhet, lest fra enhetsskjemaet for feltene (resultatets <c4/>-blokk), ellers fra feltnavnets suffiks, ellers oppgitt som ikke oppgitt; resultatene med kjøringens diagram, hver skalar og et sammendrag av hver numeriske kolonne; for en kampanje, nodetabellen for sveipet, Monte Carlo-middelet, standardavviket, 5., 50. og 95. persentil og bootstrap-konfidensintervallet med et histogram per metrikk, fasetabellen for kjeden, eller sammensetningens medlemmer og kombinerte sammendrag (og rutenettet for en kjøring av <c5/> eller <c6/>); en hendelsestidslinje; etiketten VALIDATED / MODELLED / PARTNER, den uavhengige referansen og testevidensen for hver rad i verifikasjonsmatrisen som kjøringens typer bruker, lest fra matrisen gjennom en kryssliste fra type til rad (en rad som vurderer én inndatasti, som banen Simplified General Perturbations { "4" } (SGP4) for <c7/> eller stien for målt opptak for <c8/>, listes bare når kjøringen tok den stien, og raden for leseren av Shuttle Radar Topography Mission (SRTM) listes for ingen type, siden intet scenariofelt leser en SRTM-flis); erklæringene om det som ikke er modellert og forutsetningene, hver sitert med sin kilde; og en reproduserbarhetspost (motorversjon, kildecommit når bygget setter <c9/>, Secure Hash Algorithm 256-bit-digester (SHA-256) av scenariofilen og resultatdokumentet, seed, plattform og den eksakte kommandoen). Rapporten leser ingen klokke: samme scenario, seed og motorbygg gir en byte-identisk rapport, og det eneste tidsstempelet den kan vise er det <c10/> allerede skriver. Et utskriftsstilark passer A4 og US Letter, gjentar tabelloverskrifter og holder rader og figurer hele over sider; en Portable Document Format-fil (PDF) lages med nettleserens «Lagre som PDF». Det finnes ikke noe valg <c11/>, fordi det å tegne diagrammene inn i en PDF ville kreve en ny, tung avhengighet. Tester: <c12/> rapporterer hvert medfølgende scenario (ingen tom seksjon, ingen plassholdertekst, etiketter lik matrisen, scenariodigesten lik filens, byte-identisk ved ny kjøring) og <c13/> kjører den registrerte kommandoen på nytt i en ny katalog og krever en byte-identisk <c14/>. Ingen publisert tall endres, og antallet typer, scenariofiler og matriserader er uendret.

seg-ce45e75c6d67 = <b>Rapporten, animasjonen og eksportene virker sammen.</b> Den avanserte rapporten får en seksjon «Animation and exports»: kjøringens animerte tegning innebygd som et inert bilde (eller grunnen til at det ikke finnes noe), lenker til animasjons- og eksportfilene som skrives ved siden av, og hvert interoperabilitetsformat med om det gjelder, hvorfor ikke, og spesifikasjonen; <c1/> bærer den samme blokken <c2/>. HTML-animasjonsspilleren lister eksportfilene som skrives ved siden av den. Kommandolinjegrensesnittet (CLI) lager nå eksportene før det skriver rapporten, så begge kan navngi filene.

seg-c60dc5b92a60 = Interoperabilitetseksporter

seg-5bfce52c5a13 = Interoperabilitetseksporter og importer (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> skriver scenarioets geometri som CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, en standard fra Open Geospatial Consortium, med tidsmerkede spor i <c2/>), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) og Ansys STK-efemerider (Systems Tool Kit) <c3/> (<c4/>, meter, én fil per bevegelig objekt), og det syntetiserte IQ-øyeblikksbildet (i fase og kvadratur) fra typen <c5/> som et SigMF-par (Signal Metadata Format) gjennom den eksisterende <c6/>. <c7/> skriver hvert format som gjelder og skriver ut hvorfor de andre ikke gjør det; <c8/> rapporterer uten å kjøre. Bevegelige objekter skrives i Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) og jordfast WGS { "84" } (World Geodetic System { "1984" }) lengdegrad, breddegrad og høyde (KML, GeoJSON); faste steder i CZML er <c11/>. Typen <c12/> legger til to jammer-fotavtrykk fra sine egne lenkeligninger. <c13/> skriver en GeoJSON-<c14/> inn i sporinndataene til <c15/>, <c16/>, <c17/> og <c18/>. Eksporter er byte-deterministiske og bærer ikke noe tidsstempel. <c19/> validerer hver eksport mot sin publiserte spesifikasjon, sammenligner eksporterte satellitttilstander med motorens egne til { "1" } mm, og kjører hvert medfølgende scenario gjennom hvert format, der hvert enten eksporterer eller oppgir hvorfor ikke (tabellen i docs/INTEROP.md). Ingen publisert tall endres: IQ-syntesen til typen <c20/> er flyttet inn i én delt funksjon og resultatdokumentet er byte-identisk, og <c21/> får <c22/> og <c23/> som brukes av dens egen kjøring. Antallet typer, scenariofiler og verifikasjonsmatriserader er uendret. Et bane- eller integritetsscenario uten <c24/> dateres av satellittenes egne data: <c25/> er den tidligste epoken blant TLE (tolinjers elementsett), kringkastet efemeride eller SP3 (Standard Product { "3" }), og hver slik satellitt roteres inn i GCRS og de jordfaste referansesystemene ved sitt eget tidspunkt; 2000-01-01T00:{ "00" }:00Z brukes bare når ingen satellitt bærer en epoke. SP3- og OEM-eksportene (Orbit Ephemeris Message) beholder etiketten 2000-01-01. For å støtte dette er <c26/>, <c27/> og <c28/> lagt til; ingenting som fantes fra før leser dem.

seg-12c151a800f9 = Navigasjon i lav jordbane: signal

seg-9b665682695a = <b>LEO-PNT-signaldesign og et flerbåndsspekter.</b> En ny type <c1/> og en type <c2/> som rekker utover L-båndet: én type, fire scenariofiler (tre medfølgende; Celeste IOD-filen finnes bare i depotet) og fire matriserader (to VALIDATED, to MODELLED).

seg-b355b28bfd1b = <c1/>: parametriserte signaldesign for posisjonering, navigasjon og tidssynkronisering (PNT) i lav jordbane (LEO) for et hvilket som helst system (bånd, sendebåndbredde, ITU-tildeling; akkvisisjons-, data- og pilotkomponenter med BPSK(n), BOC(m,n), MBOC eller flate spektre, effektandeler, FDMA-underbærebølger, kodelengder og datarater), fra offentlige forhåndsinnstillingsfiler kompilert inn under <c2/> (Xona Pulsar X1/X5, Iridium STL, et Starlink-signal av opportunitet, CentiSpace, et representativt C-bånd-design og representative UHF/L/S/C/bred-C-design, hver med sin kilde-URL) eller skrevet inline. Per signal: det båndbegrensede PSD-et og effektandelene i båndet, Gabor-båndbredden, båndbegrenset tidlig-sen kodesporingsjitter mot C/N0 og avstand (Betz & Kolodziejski { "2009" }) og avstandsnøyaktigheten, akkvisisjonssøkerommet, deteksjonssannsynligheten og gjennomsnittlig seriell og kodeparallell akkvisisjonstid, SSC inn i og ut fra GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b og AltBOC med C/N0-tapet, CW-, bredbånds- og matchet J/S-toleranse fra SSC-koden til spektrumtypen, en båndavveining (ionosfærisk forsinkelse, fritt-rom-tap, avstandsmåling ved lik C/N0 og lik EIRP, jammertoleranse), og valgfrie formkontroller mot en beskrevet måling. Eksempler: <c3/>, <c4/>, <c5/> (Celeste IOD-båndene og signalkonfigurasjonen presentert på ESA NAVISP LEO-PNT-workshopen, { "2026" }; holdt tilbake sammen med forhåndsinnstillingen Celeste IOD, se «LEO-PNT end to end» nedenfor). Merknader i <c6/>.

seg-8f58debf721f = <c1/>: bånd kan nå være et forhåndsinnstilt signaldesign (hver komponent tegnet, båndbegrenset, C/N0 og J/S referert til den sporede komponenten) eller en egendefinert bærebølge og modulasjon; <c2/> legger til fossefall over andre frekvensområder på én tidslinje; en <c3/>-jammer (barrage) kommer til som en femte bølgeform ved siden av de fire. Rapporten legger til <c4/>, <c5/> og <c6/>, og én post <c7/>. Vanlige bånd gir de samme tallene som før. Eksempel: <c8/>.

seg-98f74d85c54b = <c1/> får sinusintegralet, de lukkede formene for BPSK-effekt i båndet og båndbegrenset Gabor-båndbredde, den båndbegrensede tidlig-sen-jitteren for et hvilket som helst spekter og dens Gabor-grense, den lukkede formen for SSC for offset-BPSK, Galileo E5 AltBOC({ "15,10" })-spekteret og en parser for modulasjonsetiketter; <c2/> skriver ut BPSK(1/3) som en brøk.

seg-78d9e5e2c615 = Fire matriserader: VALIDATED båndbegrensede lukkede former ({ "90.3" } % av BPSK-effekten i hovedloben, jitteren som reduseres til Kaplan & Hegartys koherente form, { "0.0039564" } chip ved { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, og til sin Gabor-grense, og BPSK-selv-SSC 2/({ "3" } R_c); den lukkede Gabor-formen og offset-SSC mot sin Parseval-form er oppgitt som interne krysskontroller); VALIDATED maksimal LEO-Doppler (Xona X1 { "33.2" } kHz innenfor de publiserte { "32" } til { "34" } kHz, Iridium innenfor { "0.5" } kHz av { "36" } kHz); MODELLED <c1/>; MODELLED flerbåndsspekter.

seg-45d3d4a46d6b = Navigasjon i lav jordbane: lenke

seg-1d120db87aae = <b>LEO-PNT-passering og lenkebudsjett per bånd: typen <c1/>.</b> LEO-PNT er posisjonering, navigasjon og tidssynkronisering fra satellitter i lav jordbane (LEO). En bruker (på bakken, til sjøs, i luften eller innendørs, stasjonær eller i bevegelse) og én eller flere LEO-satellitter fra en designet passering, eksplisitte elementer, et tolinjers elementsett (TLE) gjennom SGP4, eller en Walker-konstellasjon fra koden for <c2/>. Per satellitt, bånd og epoke: siktevinkler, avstand, avstandsrate og avstandsakselerasjon i lukket form (kontrollert i hver kjøring mot sentrale differanser), Doppler og Doppler-rate, fritt-rom-tap, EIRP (ekvivalent isotropisk utstrålt effekt) med et isoflux-, gaussisk stråle- eller flatt satellittmønster, en patchantenne hos brukeren, gassdemping etter ITU-R P.676, regndemping etter ITU-R P.838/P.618, troposfærisk scintillasjon etter P.618, bygningsinntrengingstap etter ITU-R P.2109 for en innendørs bruker, polarisasjonsavvik, systemets støytemperatur og C/N0 (bærebølge-til-støytetthet); den første ordens ionosfæriske forsinkelsen per bånd fra en skrå TEC (totalt elektroninnhold) etter Klobuchar eller vertikal TEC under satellitten, og ionosfærefrie båndpar med deres støyforsterkning. Galileo- eller GPS-satellitter evalueres med samme mottaker ut fra mottatte effekter i grensesnittdokumentene, så den klokkeformede LEO-passeringen og de flate MEO-bærebølgene (middels jordbane) deler ett plott. En seksjon <c3/> gir tid til første posisjonsbestemmelse, energi per posisjonsbestemmelse og batterilevetid mot driftssyklus (MODELLED).

seg-17f3503e1be3 = Systemuavhengig: motoren trenger ingen forhåndsinnstilling. Valgfrie forhåndsinnstillinger, hver i sin egen fil og merket PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP: generisk flerbånd (UHF, L, S, C), generisk C-bånd, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink som et signal av opportunitet kun for Doppler, CentiSpace, og Celeste IOD (in-orbit demonstration), hvis signalparametere ble presentert på ESA NAVISP LEO-PNT-workshopen, { "2026" }, og ligger i <c1/> så de kan holdes tilbake (se «LEO-PNT end to end» nedenfor).

seg-a338cc46a1e0 = Offentlige byggeklosser i <c1/> (geometri, antenne, itu, iono, energi, forhåndsinnstillinger) som andre moduler kan kalle.

seg-887ad03cb6f6 = Scenarioer: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-a20f1602c236 = Ni matriserader. VALIDATED ({ "6" }): koeffisientene i ITU-R P.838-3 mot dens tabell { "5" }; regndemping og scintillasjon etter P.618-14 mot valideringseksemplene til ITU-R Study Group { "3" }; bygningsinntrengingstap etter P.2109 mot regnearket til Study Group { "3" }; første ordens ionosfærisk skalering mot gruppeforsinkelsesforholdet i IS-GPS-200, med fritt-rom-tapet; maksimal Doppler for en stasjonær bruker i en sirkulær bane mot arXiv { "2509.19551" } tabell { "1" }. MODELLED ({ "3" }): passeringen og lenkebudsjettet, forhåndsinnstillingene og budsjettet for lavenergi-posisjonsbestemmelse. Én type og seks scenariofiler. Merknader i <c1/>.

seg-ef74b0f08aa1 = Navigasjon i lav jordbane: navigasjonsmelding

seg-866ff4ee8b19 = <b>LEO-navigasjonsmelding (typen <c1/>, <c2/>).</b> Den kringkastede efemeride- og klokkemeldingen til en satellitt for posisjonering, navigasjon og tidssynkronisering (PNT) i lav jordbane (LEO), for en hvilken som helst bane, bærebølge og modell; navngitte forhåndsinnstillinger er valgfrie data og hver funksjon kjører uten dem. Én type, fem scenariofiler og ni matriserader (tre VALIDATED, seks MODELLED). Se <c3/>.

seg-c42821b6e855 = Meldingsinnhold: SVID, datautgave, bånd og signalhelse; uke, ukens tid og et andre ordens klokkepolynom; efemeriden i en av fire modeller — det keplerske settet med 16 parametere fra Galileo OS SIS ICD, det settet pluss korreksjonspolynomer langs banen, på tvers av banen og radielt, modellen med 22 parametere av Liu et al. { "2025" } (doi 10.3390/rs17162894), eller ATOMIC-polynomet med null klokke i ECEF — og et Klobuchar-sett, NeQuick-G-koeffisienter med det effektive ioniseringsnivået, og parametere fra systemtid til UTC med ICD-ens skuddsekundtilfeller.

seg-e4565696f162 = Tilpasser: en referansebane integrert med sonal J2–J6 eller EGM2008-gravitasjon og luftmotstand, en seedet fri eller styrt klokke, en Levenberg–Marquardt-tilpasning på ikke-singulære elementer, deretter lineære minste kvadraters korreksjonspolynomer og en klokke tilpasset netto av brukerens relativistiske ledd.

seg-a7287b7b336c = Fire analyser og scenarioer: <c1/> (avstandsfeil i signalet i rommet (SISRE) mot tilpasningsintervall og oppdateringsperiode), <c2/> (fire modeller, biter, og Kshanas tilpasning med 22 parametere ved Liu et al.-høydene ved siden av de publiserte tallene, MODELLED), <c3/> (kontinuitet ved hvert meldingsbytte i en passering) og <c4/> (Kshanas egen dokumenterte binære ramme med CRC-24Q og et kvantiseringsbudsjett, en blokk i RINEX 4-stil merket som en Kshana-utvidelse, og en CSV-tabell).

seg-e272dce3d10f = VALIDATED: de globale gjennomsnittlige SISRE-vektene mot den publiserte tabellen for middels bane og geostasjonær bane av Montenbruck et al. { "2018" }; Galileo-brukeralgoritmen mot RTKLIB på fire ekte kringkastede Galileo-efemerider (<c1/>); CRC-24Q mot katalogens kontrollverdi og eksempelrammen RTCM { "10403" } { "1005" }.

seg-5c8592195b0d = Forhåndsinnstillinger, én fil hver med kilder: Xona Pulsar og Pulsar-0, Iridium, Starlink, CentiSpace, et representativt C-bånd-system, ATOMIC, og Celeste IOD (den eneste forhåndsinnstillingen som bruker materiale presentert på ESA NAVISP LEO-PNT-workshopen, { "2026" }, lagt i <c1/> sammen med scenarioene sine så den kan holdes tilbake).

seg-9fb0cbf29cef = Navigasjon i lav jordbane: fusjon

seg-071f4db017c5 = <b>Fusjonert MEO + LEO-posisjonering, -navigasjon og -tidssynkronisering: <c1/>, <c2/> og <c3/>.</b> Tre nye scenariotyper i <c4/>, systemuavhengige: hver konstellasjon er Walker-skall, elementsett eller en GNSS-forhåndsinnstilling, hvert signal en bærebølge, en chiprate og en omhylling av bærebølge-til-støytetthet (C/N0), hvert feilbudsjett en eksplisitt ett-sigma, og navngitte systemer i lav jordbane (LEO) er valgfrie forhåndsinnstillinger, én fil hver med kildene merket offentlig, workshop eller utledet (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlink-signaler av opportunitet, CentiSpace, et representativt C-bånd-system, efemeridemodellen ATOMIC med null klokke, og én ESA Celeste-forhåndsinnstilling for demonstrasjon i bane med workshop-utledede parametere som ligger i <c5/> så de kan holdes tilbake).

seg-f28f7a441263 = <c1/> har fire moduser: Doppler-posisjonering (batch minste kvadrater på avstandsrate med tilstander for klokkedrift og hastighet, en modus for signaler av opportunitet kun med Doppler, nøyaktigheten langs og på tvers av banen i én enkelt passering, og omhyllingen for Doppler, Doppler-rate og rykk); felles GNSS + LEO vektet minste kvadrater med én klokke per system (intersystembiasen) eller en kjent forskyvning, sigma per måling som inndata, og DOP mot antall LEO-satellitter; polar og arktisk dekning mot breddegrad; og LEO-tidsoverføring til koordinert universaltid (UTC) mot C/N0 og mottakerens oscillator med uttrykket for systemtid til UTC i IS-GPS-200.

seg-57afa384aabd = <c1/>: et utvidet Kalman-filter for flytende presis punktposisjonering (PPP) på ionosfærefri kode og fase, bare GNSS og med LEO-utvidelse, med konvergenstid og en Monte Carlo-konsistenstest av NEES (normalisert estimeringsfeil i annen potens). Det medfølgende scenarioet gir { "7.4" } min med fire MEO-systemer og { "4.8" }, { "3.2" }, { "2.7" } og { "2.3" } min med { "60" }, { "96" }, { "192" } og { "288" } LEO-satellitter, ved siden av { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } og { "1.3" } min fra Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) som en MODELLED sammenligning av trenden.

seg-3fa0556b3737 = <c1/>: 5G-posisjonering i ikke-terrestrisk nett (NTN) i S-båndet for mobilsatellitt 3GPP n256 ut fra Cramér-Rao-grensen for ankomsttid og Doppler.

seg-a0cc2699e276 = Scenarioer: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (medfølgende) og <c8/> (bare i depotet, holdt tilbake sammen med forhåndsinnstillingen Celeste IOD).

seg-c0b6b98eeac3 = Åtte matriserader: LEO-Doppler-omhyllingen VALIDATED mot de publiserte tallene for Iridium (±{ "36" } kHz: { "35.9" } kHz, innenfor { "5" }%) og Xona Pulsar X1 ({ "32" } til { "34" } kHz: { "33.6" } kHz fra skallet på { "97" } deg, uten utvidelse) (<c1/>); Doppler-posisjonering, felles pseudoavstandsposisjonering, PPP-konvergens, NTN-grenser, LEO-tidssynkronisering, polar dekning og forhåndsinnstillingene MODELLED. Tre typer og åtte scenariofiler. Dokumentasjon: <c2/>.

seg-173793480abc = <b>LEO-PNT fra ende til ende: typen <c1/>, og LEO-trinnene koblet sammen.</b> Ett posisjonerings-, navigasjons- og tidssynkroniseringssystem (PNT) i lav jordbane (LEO) fulgt fra signaldesignet til brukerens posisjon, hvert trinn motorens egen type på sin egen scenariotabell, med verdier ført videre i kode (<a1><c2/></a1>):

seg-41a4a2183ba3 = Bånd i <c1/> kan navngi et design av typen <c2/> (<c3/>): båndet tar designets senter, sendebåndbredde og chiprate for den sporede komponenten, fordeler sin EIRP (ekvivalent isotropisk utstrålt effekt) på designets komponenter, og rapporterer hver epokes C/N0 (bærebølge-til-støytetthet) for den sporede komponenten og båndbegrenset kodesporingsjitter (avstandsfeilen; støyen i paret <c4/> bruker den også). Et bånd uten design gir samme utdata som før.

seg-a076a43a9d44 = <c1/> kjører signal -> passering -> navigasjonsmelding -> fusjonert felles posisjonsbestemmelse i <c2/> -> valgfri <c3/>. Hvert LEO-system i posisjoneringstrinnet som lar dem stå usatt får en C/N0-linje i sin(elevasjon) tilpasset passeringen, meldingens avstandsfeil i signalet i rommet (SISRE: dens representasjonsfeil i banen til passeringens satellitt, med et oppgitt ledd <c4/> for banebestemmelse i kvadratsum), og designets bærebølge og chiprate; PPP-tilfellene (presis punktposisjonering) tar SISRE. Hver overlevering er listet med verdi og enhet, og <c5/> kontrollerer at hver er lik utdataene oppstrøms og at endringer oppstrøms flytter tallene nedstrøms. <c6/> er det nye inngangspunktet for meldinger.

seg-8c256ed478e9 = Scenarioer: <c1/> (en generisk konstellasjon på { "1080" } km og det representative signalet <c2/>), <c3/> (det offentlige X5-signalet), begge medfølgende, og den valgfrie <c4/> som bare finnes i depotet.

seg-879259c7ff86 = Forhåndsinnstillingene for Celeste IOD (in-orbit demonstration) i områdene passering, melding og fusjonert posisjonering ligger nå i én fil, <c1/>, som <c2/> bare kompilerer inn når den finnes (konfigurasjonsflagget <c3/>). Dens fem scenarioer (<c4/>) finnes bare i depotet, så å slette den filen og de scenarioene holder tilbake hvert tall som ble presentert på ESA NAVISP LEO-PNT-workshopen, { "2026" }, uten kildeendring; <c5/> kontrollerer hvilke filer som kan navngi forhåndsinnstillingen eller bære dens bandplantall.

seg-110b1f7c7c63 = Hver LEO-type i den avanserte rapportens kryssliste, med radene for en bestemt sti listet bare når kjøringen tok den stien (en regnrate, en bygning, en analyse eller modus som kjørte). Dopplervinduene i <c1/> får <c2/> og tilfellene i <c3/> får <c4/>, så begge animeres; <c5/> og <c6/> eksporterer CZML-, KML-, GeoJSON- og STK-efemerider, og de andre LEO-typene oppgir hvorfor et format ikke gjelder.

seg-1419edea5329 = Navigasjon i lav jordbane: robusthet, fokusområder og sluttbrukerscenarioer

seg-d084d86044b4 = <b>LEO-PNT-robusthet, ett scenario per eksperimentfokusområde og ett per sluttbrukervertikal, og <c1/> som oversikt over hver LEO-type og hvert LEO-scenario.</b> Hvert scenario kjører uten noen Celeste-data og er medfølgende.

seg-07e91f076ab2 = <c1/> får en seksjon <c2/>: en spoofer forfalsker, selvkonsistent i avstand og avstandsrate, signalene fra en hevdet posisjon som hopper og/eller skyves bort fra den sanne etter en start (per LEO-bånd, og MEO-GNSS-signalet), med eller uten ionosfæren. To overvåkere kjører ved en oppgitt falsk alarmsannsynlighet: konsistens i Doppler og passeringsgeometri (målte avstandsrater mot de som er forutsagt fra banene og en uavhengig forhåndsposisjon og -hastighet; en generalisert minste kvadraters khikvadrat over et vindu, på GNSS-, LEO- og alle kanaler, støy i frekvenslåsesløyfen fra C/N0) og konsistens mellom bånd (steget i hvert LEO-båndpars modellkorrigerte geometrifrie kombinasjon). Resultatet gir statistikken per epoke (så det animeres), hvert par, og når hver overvåker detekterer. Byggeklosser i <c3/>. Seksjonen er fraværende, utdata uendret.

seg-6a7852f1f053 = Hvert båndpar i <c1/> rapporterer også det skrå totale elektroninnholdet (TEC) som den geometrifrie kombinasjonen gjenvinner ved passeringens topp og kodestøy-sigmaet til det estimatet (ionosfæresondering). Dette legger til to felt i hvert flerbåndsresultat i <c2/>; ingen eksisterende tall endres.

seg-bdf333f4c978 = Tidsmodusen i <c1/> tar <c2/>: hver rad rapporterer da sin tidsfeil og forutsagte sigma ved hver epoke, med de samme trekningene, så radstatistikken er uendret og kjøringen animeres og lenkes i en kampanje.

seg-eb4461740dc5 = En kampanje eksporterer nå hvert medlemsscenario som har geometri (faskjøringer, basisscenarioene for sveip og Monte Carlo, sammensatte medlemmer med sine delte verdier bundet) som sitt eget filsett, med medlemsetiketten i filnavnet; tidligere eksporterte en kampanje ingenting. Interoperabilitetstabellen i <c1/> endres tilsvarende.

seg-c0b1f4d9fed0 = En sveipenøkkel i en kampanje kan indeksere en tabellrekke etter posisjon (<c1/>).

seg-4c995017dd9c = Robusthetsscenarioer: <c1/> (en barrage på { "50" } MHz i L5-båndet sveipet i effekt: hvert L-bånd-signal faller, LEO-signalene i UHF, S og C beholder sin C/N0), <c2/> (J/S-margin fra mottatt effekt: GPS L5, Galileo E5a og Xona X5 mistet ved -105, -100 og -95 dBW, et generisk LEO-signal på -135 dBW som fortsatt sporer ved -90 dBW), <c3/> (et hopp på { "30" } m som GNSS-bare Doppler-testen overser og testen på alle kanaler detekterer { "105" } s etter starten), <c4/> (fire spoofere mot begge overvåkere) og <c5/> (GNSS jammet, LEO-laget i S og C sporet, mottakerens autonome integritetsovervåking på LEO-laget alene alarmerer ved { "2" } av { "30" } epoker).

seg-bae66dac04cc = Scenarioer for fokusområder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (robusthet i L, S og C er <c8/>).

seg-c7947d9cc592 = Vertikale kampanjer, hver animert og med eksport av sine LEO-passeringer: <c1/>, <c2/> (de medfølgende scenarioene for sjø og bane pluss LEO), <c3/>, <c4/>, <c5/>, <c6/>. Enlinjeresultater i <c7/>.

seg-222ad0b777f8 = Tre MODELLED matriserader: spoofingovervåkeren for Doppler og passeringsgeometri, spoofingovervåkeren mellom bånd, og ionosfæresondering. <c1/> kontrollerer overvåkerne (stille før starten, Doppler-statistikken kvadratisk i et hopp, det ionosfæriske steget for en spoofer på bakken og ingen fra en som tar hensyn til ionosfæren), sonderingsidentiteten, tidssporet mot radstatistikken, og at en kampanjes eksport er lik hvert medlems egen.

seg-f650b42bf210 = Siden <c1/> flytter til <c2/>; <c3/> er oversikten.

seg-00a4ba834f37 = <b>Scenarioer for sjø, vei og bane.</b> Fem medfølgende eksempler på eksisterende typer, så skip, kjøretøy på vei og tog hver har et gjennomarbeidet tilfelle. Hvert tall er MODELLED; ingen er validert mot målte data.

seg-682414bbe0c6 = <c1/> (<c2/>): en bredbåndsjammer på { "50" } W på en mast på { "30" } m, { "30" } km over åpent vann fra et skip. Gjennomsnittlig forhold mellom jammer og signal (J/S) omtrent { "48" } dB, og tilgjengeligheten faller fra { "1.00" } til { "0.00" }.

seg-4666dcd72c24 = <c1/> (<c2/>): et treghetsnavigasjonssystem (INS) av navigasjonsklasse ved { "12" } knop med GNSS tapt og uten støtte. Det krysser { "10" } m etter { "281" } s og { "100" } m etter { "833" } s, tallene for havneinnseiling og åpent hav i resolusjon A.1046({ "27" }) fra Den internasjonale sjøfartsorganisasjonen (IMO), brukt her som budsjetter.

seg-7407bb97aedd = <c1/> (<c2/>): en spoofer på +{ "2" } dB som ikke er bærebølgejustert og skyver fire satellitter for å dra et skip { "500" } m. Den fusjonerte overvåkeren detekterer den (score { "0.70" } mot en terskel på { "0.50" }) på mottakerens autonome integritetsovervåking (RAIM) og overvåking av signalkvalitet (SQM); effektovervåking alene overser den.

seg-1edc0541930b = <c1/> (<c2/>): en bil gjennom en undergang på { "15" } s og et bortfall på { "60" } s fra en jammer ved veikanten, mot et budsjett på { "1.5" } m for et halvt kjørefelt. Den fusjonerte RMS-feilen (kvadratisk middelverdi) under bortfallet er { "1.9" } m for en enhet av bilklasse med mikroelektromekanisk system (MEMS) og { "0.7" } m for en taktisk sammenligningsenhet; kjørende fritt driver MEMS-enheten til { "850.8" } m.

seg-f9830a49659f = <c1/> (<c2/>): et taktisk INS på et tog ved { "160" } km/t i en tunnel. Det krysser { "2" } m (skillet mellom spor) etter { "35.8" } s, omtrent { "1.6" } km inne, og { "20" } m etter { "107.3" } s. Dette er bare INS: motoren har ingen odometermodell, så det er den pessimistiske grensen. Antallet scenariofiler i README flytter seg fra { "77" } til { "82" }. Alle fem er medfølgende for <c3/> og listet i nettleserens playground.

seg-77c8c53126fd = Model Context Protocol-server

seg-2deb4b35b41a = Serveren for Model Context Protocol (MCP) når hver type og hver visning av en kjøring: sju nye verktøy, fjorten til sammen.

seg-7f4035dfd9db = <c1/> sendte allerede ut hver type; det en agent manglet var en vei til et gyldig scenario av en type, og de tre utdataene kommandolinjen skriver ved siden av et resultat. Nye verktøy:

seg-d9df5ab8817a = <c1/> og <c2/> leverer de medfølgende referansescenarioene (tabellen <c3/>), hvert med sin type og den første setningen i sin egen overskrift, byte for byte filen under <c4/>. Et scenario som finnes i depotet men ikke er medfølgende, avvises med grunnen. Hver type unntatt <c5/> (hvis datautsnitt bare følger med depotet) har minst ett eksempel.

seg-cb24ad7147ef = <c1/> returnerer kjøringens rapport som JSON (JavaScript Object Notation) eller som utskriftsvennlig HTML-side (HyperText Markup Language) (<c2/>).

seg-9264b2f20e15 = <c1/> returnerer kjøringens tidsserie som en animert SVG-tegning (Scalable Vector Graphics), en HTML-spiller eller nummererte bilder, etter et JSON-sammendrag av det som ble tegnet (<c2/>). Et svar bærer høyst { "120" } bilder; kommandolinjen skriver en hvilken som helst lengde.

seg-959f23871238 = <c1/>, <c2/> og <c3/> leverer interoperabilitetseksportene og GeoJSON-ruteimporten (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeriden (Systems Tool Kit) <c5/> og SigMF (Signal Metadata Format), med en JSON-indeks over filene (suffiks, størrelse og SHA-256, den 256-bits Secure Hash Algorithm-digesten) og den binære SigMF-samplefilen som base64.

seg-9ec3f9639b8c = Biblioteket får en funksjon <c1/> som er av som standard og som eksponerer referansescenariotabellen som <c2/>; bare MCP-serveren slår den på, så Python-hjulet og WebAssembly-modulen bærer fortsatt ikke scenarioteksten. Studiesuiter (<c3/>) forblir bare for kommandolinjen, fordi en suite navngir filer på disk og serveren leser ingen. Rundturtestene kjører hvert nye verktøy mot medfølgende scenarioer og kontrollerer motorens tall: spektrum, solsystemet, konstellasjoner rundt Månen og Europa, et kampanjesveip, og typene for signal, passering, navigasjonsmelding, fusjonert posisjonering, presis punktposisjonering, ikke-terrestrisk nett og ende-til-ende i lav jordbane (LEO). Hver flate som oppgir antallet MCP-verktøy eller lister verktøyene sier nå fjorten, unntatt playground-siden under <c4/>, som er erstattet av nettstedet.

seg-c11823028688 = kshana.dev, Kshana Studio og README

seg-fb584cf84218 = <b>En nytegnet kshana.dev.</b> Den enkelte playground-siden er erstattet av et nettsted med flere sider: Home, Missions, Capabilities, Evidence, Developers, Editions og Docs, med Kshana Studio ett klikk unna. Hvert diagram, kart og tall på det er en registrert kjøring av denne utgivelsens motor, med scenarioet og en lenke som åpner den samme kjøringen på nytt i Studio; byggingen av nettstedet avviser et opptak laget av en annen motorcommit. Dokumentasjonssidene genereres fra depotets <c1/>, og installasjonsvalgene fra dets kanaler. Skrifter og skriptbiblioteker leveres fra kshana.dev selv, så ingen side ber om noe fra en tredjepartsvert. Gamle adresser (<c2/>, <c3/>, delingslenker med <c4/>, innbyggingslenker med <c5/> og resten) omdirigeres til sin nye plass, og en ukjent adresse får en { "404" }-side.

seg-9fa1c542332b = <b>Kshana Studio, et dashbord for hver funksjon.</b> Studio åpner på en startskjerm med domenefliser og gode første kjøringer, og tar så en kjøring gjennom fem nummererte trinn: Choose a scenario, Set its parameters, Run the engine lokalt i nettleseren, Read the results (nøkkeltall først, hvert med en PASS- eller FAIL-brikke der kjøringen oppgir en terskel, deretter panelene) og Share or export. Ett søkefelt finner scenarioer, domener og feltene i dem og hopper til kontrollen; kjøringer kan festes og sammenlignes; en brødsmulesti sier hvor du er; på en telefon blir trinnene en trinnlinje. Hver scenariotype har sin visning, inkludert spektrumfossefallet, solsystemet, konstellasjonsdekning, kampanjer, animasjonen, kjøringsrapporten, interoperabilitetseksportene og kjeden i lav jordbane. En dyp lenke (<c1/>) åpner den samme kjøringen på det navngitte panelet.

seg-dcf2788bb430 = <b>Forskning og sitering.</b> Siden Evidence lister de fem Kshana-artiklene på arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } og { "2607.06212" }), hver med et sammendrag, et tall beregnet av denne motoren, kommandoen som gjengir det, en Studio-lenke og BibTeX, ved siden av hvordan programvaren siteres. README får den samme seksjonen Research.

seg-fab395bab130 = En offentlig side for Kshana Pro.

seg-167a59e94101 = <c1/> og nettstedets side Editions sier hva det proprietære Pro-laget legger til over den samme motoren (designoptimerer, usikkerhet og sensitivitet, oppdragsdossier, kampanjeovervåking, spektrumsameksistens, jobbtjeneste på egne servere, sporbarhet av krav), hva hvert produserer og hva det ikke gjør. Hvert Pro-tall nettstedet viser er oppgitt på den offentlige siden. Pro legger ikke til noen fysisk modell, og den åpne motoren forblir hel og gratis.

seg-f57f0a610943 = <b>En omskrevet README.</b> Korte seksjoner, ett bilde per seksjon, Kshana-merket, to rader med merker, genererte bilder av arkitektur, scenarioflyt, kjeden i lav jordbane og verifikasjon (<c1/>, som feiler på et utdatert bilde), og Studio-skjermbilder tatt fra den kjørende Studio av <c2/>. READMEene for crates.io, PyPI, npm og MCP-serveren følger samme design. Langt referansemateriale er brettet sammen eller flyttet til <c3/>.

seg-e06522ca762e = <b><c1/> er nå den avanserte kjøringsrapporten</b> som er beskrevet under Added, og CLI-linjen <c2/> navngir også <c3/>. Resultatkortet på én side som den erstattet er uendret som <c4/>, som Python- og WebAssembly-bindingene fortsatt returnerer. <c5/> eksponerer setningen som <c6/> skriver ut for hver MODELLED rad; det dokumentet er uendret.

seg-77a6f35c5c9a = <b>README sier hva Kshana Pro bygger på.</b> Seksjonen Editions og linjen om Kshana Pro under «Support & professional services» oppgir nå hva Pros verktøy for modellbasert systemutvikling (MBSE) og programmer gjør og hvilke av den åpne motorens publiserte utdata det leser (hver kjørings <c1/> og <c2/>, scenariofilen, enhetsskjemaet for feltene og etikettene i verifikasjonsmatrisen), og hva klokkenes digitale tvillinger, avveiningsstudiene og bevispakkene hviler på i den åpne motoren. Bare ordlyd: ingen motorutdata og ingen publisert tall endres.

seg-1a19675ffa3b = <b>Kompatibilitet.</b> Den offentlige enumen <c1/> får en variant <c2/>, som er en brytende endring for en kaller som matcher den uttømmende. Kolonnene <c4/> og <c5/> for typen <c3/> endres (se «Revisjoner av publiserte tall»). En kjøring gjengis fortsatt av motorversjonen som laget den.

seg-e7c5f77a6602 = <b><c1/> på MCP-serveren navnga fire typer som de eneste med en CSV-tabell (kommaseparerte verdier); seks publiserer en.</b> Verktøyet returnerte alltid tabellen for <c2/> og for <c3/> (dens analyse <c4/> på en meldingsmodell <c5/> eller <c6/>), men beskrivelsen, avvisningsmeldingen og dokumentene som lister typene utelot begge, så en agent ble fortalt at den ikke skulle spørre. De er nå navngitt, og en rundturtest henter begge tabellene.

seg-4094f58a5f4b = Rammen for navigasjonsmeldingen i lav jordbane (LEO) var ikke de samme bytene på hver plattform, og heller ikke i hvert bygg av én plattform.

seg-5191262de022 = <c1/> kodet en ramme med syklisk redundanssjekk <c2/> i release-bygget på aarch64 macOS, <c3/> i et debug-bygg av samme kilde på samme maskin, og <c4/> i WebAssembly-bygget (WASM); <c5/> ga <c6/> native mot <c7/> i nettleseren. Tre årsaker, hver sporet til den første verdien som avvek:

seg-f6501c3cd89d = <em>Mellom plattformer.</em> Referansebanen var bit-identisk på begge; tilpasningens startpunkt var det ikke. <c1/> tar den oskulerende inklinasjonen fra en <c2/> og perigeumsargumentet fra en <c3/>, og de to matematikkbibliotekene runder disse ulikt i siste posisjon (over { "20 000" } argumenter er de uenige for { "781" } sinuser, { "858" } cosinuser, { "1 931" } eksponentialer og { "1 899" } arctangenser med to argumenter).

seg-cd6f05096b8b = <em>Mellom byggprofiler.</em> Et optimalisert bygg på macOS slår sammen en sinus og en cosinus av ett argument til ett enkelt kall til systemets kombinerte rutine, og dens sinus er ikke den alenestående <c1/> for { "379" } av { "200 000" } argumenter; et uoptimalisert bygg gjør de to kallene. Typen tar en sinus og en cosinus sammen på tretten steder.

seg-91b0700dcb30 = <em>I klokken.</em> Normalsamplereren i <c1/> kaller vertens <c2/> og <c3/> i sine to sjeldne grener: av fire millioner seedede trekninger avvek tre i siste bit mellom det native og WASM-bygget.

seg-0a4724333429 = Levenberg–Marquardt-tilpasningen, som på denne buen stopper ved grensen på 80 iterasjoner og ikke ved et minimum, bærer én enhet i siste posisjon inn i andre kvantiserte felt. Typen beregner nå hver transcendental funksjon gjennom den nye <c1/>, som kaller crate-en <c2/> i ren Rust (allerede i avhengighetstreet, nå navngitt i <c3/>), kompilert fra én kilde for hvert mål og ikke et bibliotekskall som optimalisereren skriver om: <c4/> og scenariokoden. Heltallspotenser på den stien er skrevet ut som kvadrer-og-multipliser, fordi <c5/> har uspesifisert presisjon, og sannhetsklokken trekker sine normalavvik fra <c6/> (Marsaglias polare metode på generatorens rå utdata). De delte rutinene som referansebanen integreres gjennom er skrevet én gang, generiske over matematikkbiblioteket, med et inngangspunkt <c7/> internt i crate-en ved siden av det eksisterende: akselerasjonen fra kulefunksjoner, de sonale akselerasjonene og luftmotstanden, de sekulære J2-ratene og Klobuchar-forsinkelsen. De eksisterende inngangspunktene er uendret til siste bit, så ingen annen typens tall flytter seg. <c8/> fester hele rammen på 171 byte og én kontrollverdi per efemeridemodell, i den vanlige (uoptimaliserte) testprofilen, på hver plattform og uten noen port for grunnlinjeverten; <c9/> leser typens kilder fra disk og feiler på et iboende transcendentalt kall, på en sampler fra <c10/>, eller på et kall inn i en modul som ikke er gjennomgått. Etter endringen gir et debug-bygg, et release-bygg og WASM-bygget byte-identiske resultatdokumenter for alle fem scenarioene i <c11/>. <b>Dette flytter tall, registrert her som en revisjon.</b> Typen <c12/> er ny i denne utgivelsen, så ingenting publisert i en tidligere utgivelse flytter seg, men hvert tall for <c13/> gjør det, native og i WASM-bygget, og trinnet <c14/> i <c15/> med det: banetallene fordi tilpasningen nå starter fra de portable elementene, klokketallene fordi sannhetsklokken er en annen realisasjon av den samme prosessen. <c16/> er generert på nytt fra de nye resultatene; dens publiserte kontrollverdi for scenarioet som koder og dekoder var <c17/> og er <c18/> (posisjon innenfor { "1.126" } mm av den eksakte meldingen der den var { "0.665" } mm, klokke innenfor { "0.185" } mm der den var { "0.451" } mm). Størrelsen på endringene i sub-millimetertallene er tilpasningens følsomhet, ikke en feil i noen av settene: tilpasningen er uendret og stopper fortsatt ved sin iterasjonsgrense.

seg-c30f4cef4797 = Seedet resampling trakk andre indekser på et 32-bits mål.

seg-2bf668e23ec1 = <c1/> over <c2/> tar { "64" } biter fra generatoren på en 64-bits vert og { "32" } biter på en 32-bits, så det samme seedet ga andre indekser, og lot strømmen stå et annet sted, i WASM-bygget. Tre steder trakk slik: persentil-bootstrapene i <c3/> (<c4/>, <c5/>), shufflen før hver treningsrunde i <c6/>, og permutasjonstesten i <c7/>. De trekker nå gjennom <c8/>, som alltid samples som <c9/>: nøyaktig det en 64-bits vert gjorde, så ingen native tall flytter seg. <b>Dette flytter publiserte tall i WASM-pakken, registrert her som en revisjon:</b> bootstrap-intervallet for arealet under kurven for <c10/> (<c11/>, <c12/>) var <c13/> i nettleseren og er nå det native <c14/>.

seg-80f783da1d4f = <b>Filnavn for STK-efemerider fra mover-id-er.</b> En mover-id som inneholdt en <c1/> eller et mellomrom (et konstellasjonsskall og en satellitt, <c2/>) fikk CLI-en til å panikke på <c3/>; hver id går nå gjennom en trygg fildel (bokstaver, sifre, <c4/>, <c5/>).

seg-a0dc5729d5e9 = <b>Nutasjonsfortegnet for TEME→GCRS</b>, beskrevet under «Revisjoner av publiserte tall» ovenfor fordi det flytter publiserte utdata.

seg-5ecbf0787f39 = <b>Scenariotypen <c1/></b> (<c2/>): sekunder til en fritt gående klokke forlater vaktgrensen til et tidsindeksert rutings- eller oppgavespor, hvert bidragende ledd på det tidspunktet med det dominerende navngitt, tiden som er igjen siden siste posisjonsbestemmelse, og det største intervallet mellom posisjonsbestemmelser som holder klokken innenfor, netto av ventetiden for posisjonsbestemmelsen. Klokken kommer fra en klassestandard, en datablad-forhåndsinnstilling for telecom-timing, et inline datablad (maksima for Allan-avvik, aldring, temperaturkoeffisient) eller et målt faseopptak. Et brudd utover den lengste midlingstiden kilden støtter flagges som ekstrapolert. Medfølgende eksempel: <c3/>. Se <c4/>.

seg-40dd4c16b760 = <b>Målt rødstøygulv.</b> Det overlappende Allan-avviket for et faseopptak tilpasses med vektet minste kvadrater i grunnlaget for hvit fase og frekvensmodulasjon etter IEEE Std { "1139" } (<c1/>), der hvert punkt vektes med sine ekvivalente frihetsgrader, så et holdover-svar kan hvile på klokkens eget gulv i stedet for klassens antakelse. En uvektet tilpasning la et falskt flikkergulv på et testopptak med hvit støy og forkortet et brudd på { "2 000" } s med { "30" } %.

seg-22c09748488b = <b>Validering med tilbakeholdte data av holdover-inversjonen på en ekte klokke</b> (<c1/>): tilpasset på den første tredjedelen av opptaket 5071A cesium mot hydrogenmaser, lander de forutsagte ett-sigma-bruddene ved seks terskler fra { "0.5" } til { "2.5" } ns innenfor { "0.84" } til { "1.03" } av bruddene målt på de to andre tredjedelene, mot en terskel på { "1.5" } fastsatt før testen først ble kjørt. En kontroll (Allan-avviket ved ett sekund lest som hvit støy) bommer med en faktor på omtrent { "1 000" } og besto ikke terskelen. Ny VALIDATED rad i registeret; arbeidsflyten <c2/> kjører den nå.

seg-cd73dc87a22f = <b>Den samme prediksjonen på en ekte krystalloscillator</b> (<c1/>, <c2/>): på en målt ovnsstyrt krystalloscillator er den tilbakeholdte prediksjonen konservativ, på { "0.59" } til { "0.70" } av det målte bruddet og aldri senere, og for det meste utenfor terskelen på { "1.5" }, fordi oscillatorens støygulv ble halvert i løpet av opptaket på 5.5 timer; tilpasset i utvalget lander den innenfor { "0.98" } til { "1.17" }. Krystalltilfellet er ikke validert og forblir MODELLED. Kjøringen avslørte også et manglende ledd: en krystalls frekvens vandrer, så modellen bærer nå usikkerheten i frekvensen som er kjent ved posisjonsbestemmelsen (<c3/>); uten den var prediksjonen optimistisk med opptil { "2.5" }×.

seg-8519979d184c = <b>Den samme prediksjonen på atomklokker i bane</b> (<c1/>, <c2/>): { "14" } dager med endelige klokker fra International GNSS Service for GPS Block IIF-satellittene, med protokollen skrevet ned før dataene ble lastet ned. Åtte av ti satellitter lander innenfor terskelen på { "1.5" }; G25 og G30 predikerer brudd opptil omtrent dobbelt så sent som målt. Protokollen krever at hver satellitt består, så tilfellet i bane er ikke validert og forblir MODELLED; utfallet er festet.

seg-0d666a725b77 = <b>Klokkeklassene temperaturkompensert krystall (TCXO), ovnsstyrt krystall (OCXO) og rubidium atomfrekvensstandard (RAFS)</b> (<c1/>, <c2/>, <c3/>), delene en kommersiell smallsat-buss eller en bakkegateway flyr, hver med ett offentlig datablad (<c4/>). <c5/>, <c6/> og <c7/> er lagt til. <c9/> i <c8/> godtar de tre nye id-ene. Å legge varianter til en offentlig enum er en brytende endring for en kaller som matcher den uttømmende.

seg-24ae82b115f5 = <b>Beskyttelsesnivå for tid for en mottaker i bane</b> (<c1/>, den valgfrie seksjonen <c3/> i typen <c2/>): hvor lenge en spoofer på bakken kan nå en satellitt i lav jordbane per passering, trekket en spoofer ved en oppgitt maksimal rampehastighet akkumulerer før satellitten forlater rekkevidden eller en uavhengig kontroll kjører, og om hver kontroll mot bakken eller krysslenke er uavhengig av den spooferen. Reduseres nøyaktig til <c4/> for en klokke uten flikker-, hvitfase- eller tilfeldig-vandring-støy. MODELLED.

seg-4032bc03fad5 = <b>Tre notater</b>: <c1/> (inkludert hvilken vandringsmetrikk et spor bør godtas mot: maksimal absolutt tidsfeil, ikke maksimal tidsintervallfeil eller tidsavvik, og hvorfor), <c2/> (en signert kommando brukt på et bedratt tidspunkt rutes fortsatt feil) og <c3/> (hvor Kshana kjører; ingen flykjerne med <c4/> tilbys).

seg-712035e19515 = Utgivelsen { "v0.27.3" } nådde crates.io (<c1/> og <c2/>) og PyPI, og stoppet så ved npm, så npm, MCP-bildet på ghcr.io, MCP-registeret, JetBrains Marketplace og kshana.dev aldri fikk den. { "0.27.4" } bærer den samme motoren, med utgivelsesrettelsen nedenfor, til hver kanal.

seg-bab8d4d1bc54 = <b>npm-publiseringstrinnet navngir tarballen med en eksplisitt sti.</b> npm leser en bar <c1/> som GitHub-forkortelsen <c2/>, så npm-jobben i { "v0.27.3" } prøvde å klone <c3/> og feilet med «Permission denied (publickey)». Selve tarballen var bygget og attestert. Trinnet publiserer nå <c4/>. Alt etter npm i utgivelsesrekkefølgen (MCP-bildet, JetBrains-pluginen, kontrollen av kanalparitet og nettstedet) ble hoppet over, som tiltenkt.

seg-f9a112755eb1 = <b>Enhetskatalogene for telecom-timing og <c1/> er unntatt fra påvisning av kopiert kode</b>, under samme policy og begrunnelsestest som de andre katalogene. Kvalitetsporten i SonarCloud hadde blitt rød på duplisering i ny kode ({ "4.0" }% mot { "3" }%), og hver duplisert blokk var en enhetsrad eller en ITU-T-maskeoppføring.

seg-3c3dacae06d6 = <b><c1/>: hvor lenge navigasjonen til en liten drone holder etter at GNSS er jammet.</b> Den kjører en mikroelektromekanisk (MEMS) treghetsenhet i flykontrollerklassen, en Bosch BMI088, mot en enhet av taktisk klasse. GNSS-signalet (Global Navigation Satellite System) er nominelt i { "100" } s, deretter nektet i { "60" } s (<c2/> viser hvorfor en jammer i nærheten gjør det). BMI088s bias er restene etter kalibrering ved oppstart, tatt fra temperaturkoeffisientene i databladet (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s per K for gyroen og < { "0.2" } mg per K for akselerometeret. To antakelser er flagget i filen: en oppvarming på { "10" } K etter kalibreringen, og fortsatt oppvarming på { "1" } K per minutt under flyging. Driften under flyging er feilen filteret ikke kan lære før jammingen starter, og det er den som avslutter kjøringen uten støtte. Hvert tall er modellert; å validere det krever flygelogger fra et jammet miljø. <c3/> skriver det ut.

seg-7154f69a2b8a = <b>Hver sensor i <c1/> kan sette sin egen filterprior</b> (<c2/> eller <c3/>, med <c4/> og <c5/>). Standarden er uendret, så hvert eksisterende scenario gir samme resultat. Den gjenværende gyrobiasen til en enhet av forbrukerklasse ligger omtrent { "26" } sigma utenfor standarden for taktisk klasse, der filteret aldri ville lære den. En prior som ikke er endelig og positiv avvises, og resultatet ekkoer prioren når en er satt.

seg-2b54735b19aa = <b><c1/> gir en registerbruker et scenario å kjøre.</b> En bruker av <c2/> har den kjørbare filen og ingen katalog <c3/>, så den første kommandoen hver hurtigstart ga dem feilet. Kommandolinjegrensesnittet (CLI) bærer nå de { "75" } referansescenarioene som kjører på egen hånd, byte for byte, kompilert inn fra <c4/> (<c5/>; tabellen ligger i CLI-binærfilen, så Python-hjulet og WebAssembly-modulen vokser ikke). <c6/> lister dem; <c7/> skriver ett. De to andre filene finnes bare i depotet: <c8/> leser arkiverte data fra lunar laser ranging som bare følger med depotet, og <c9/> er et studiemanifest som kjører tre søskenfiler med <c10/>. Å be om en av dem sier hvorfor og avslutter med { "2" } i stedet for å skrive ut noe som ikke kan kjøres på egen hånd. <c11/> holder tabellen opp mot katalogen i begge retninger, så en ny scenariofil som verken er medfølgende eller navngitt som bare for depotet feiler.

seg-43249b6a1f3c = <b>Hvert kvalitetsmål i et klokke-, bane-, hybrid- eller fusjonsresultat sier nå om det er VALIDATED eller MODELLED, i selve resultatet.</b> Resultatdokumentet får en blokk <c1/>, alltid dens siste nøkkel. Den lister hvert rapportert tall (for eksempel <c2/>) med sitt nivå — VALIDATED betyr kontrollert mot en uavhengig ekstern referanse, MODELLED betyr en førsteprinsippsmodell som er testet internt — og raden i verifikasjonsmatrisen nivået er lest fra. Nivået kommer fra <c3/> gjennom <c4/>, så det finnes ingen andre tabell å drive fra hverandre. Før dette forekom ordene «validated» og «modelled» null ganger i et klokke-holdover-resultat, og en leser av rå JSON (JavaScript Object Notation) hadde ingen måte å skille de to på. Posisjonstallene for <c5/> og <c6/> har ingen eierrad i matrisen, så de er listet under <c7/> i stedet for å få et nivå. Blokken bærer ingen tall. Den er bevist additiv, ikke antatt: å fjerne den gir det gamle dokumentet tilbake byte for byte, for alle fem typene (en motortest), og begge golden-harnessene (<c8/>, <c9/>) fjerner nå nøyaktig denne nøkkelen, og bare når den er den siste, og hasher så resten mot sine <b>uendrede</b> frosne konstanter. En liste i hver harness fester hvilke scenarioer som må bære blokken, så unntaket ikke i det stille kan utvides.

seg-8faf1981d797 = <b>En type <c1/> svarer i en tidsingeniørs enheter: tidsfeil, maksimal tidsintervallfeil (MTIE) og tidsavvik (TDEV), hver med PASS eller FAIL og en margin mot maskene til International Telecommunication Union Telecommunication Standardization Sector (ITU-T).</b> Maskene er transkribert fra utgavene som gjelder: G.8272 (07/2025) for klassene A og B av primær referansetidsklokke (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) for den forbedrede PRTC i låst modus og i holdover (inkludert dens omhylling for tidsfeil, som stiger fra { "30" } ns til { "100" } ns over en holdover-periode bestemt av hvor lenge klokken var låst), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) for telekomgrense- og tidsslaveklokker, klassene A til D, og G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) for nettgrensene ved referansepunkt C. Hver oppføring som disse anbefalingene lar stå «for further study» er utelatt, ikke estimert, og <c2/> lister hvert tall med sin tabell eller klausul og hver post som ble utelatt. Rapporten oppgir også tiden til hvert tidsfeilbudsjett overskrides: som standard holdover-standarden på { "100" } ns for ePRTC, en nettverks-holdover-tildeling på { "400" } ns, grensen på { "1 100" } ns ved punkt C og ende-til-ende-kravet på { "1.5" } mikrosekunder for klasse { "4" }.

seg-9e5325e1b0ca = Inndata er enten en syntetisk holdover eller en serie av din egen. Den syntetiske bruker en av fire oscillatorforhåndsinnstillinger (en ovnsstyrt krystalloscillator, en rubidiumstandard, en cesiumstandard og en brikkeskala atomklokke), hver med stabilitets-, aldrings- og temperaturtallene fra et navngitt Microchip-datablad. Hvordan disse tallene blir hvit, flikker- og tilfeldig-vandring-frekvensstøy, aldring og et temperaturledd er oppgitt i hver rapport og merket MODELLED. En serie av din egen er <c1/>-par, inline (slik den kjører i nettleseren) eller, på native bygg, fra en fil med kommaseparerte verdier. MTIE/TDEV-tabellen, med grensen for hver valgt maske ved siden av, skrives som kjøringens CSV-artefakt.

seg-a23a96819dee = <c1/> er en 24-timers rubidium-holdover med aldring, flikker og en daglig temperatursyklus: dens største tidsfeil er { "603.2" } ns, den krysser { "100" } ns { "8 206" } s etter tapet og holder seg innenfor { "1.5" } mikrosekunder hele dagen, og den består ikke holdover-omhyllingen for forbedret PRTC, slik en klokke som ikke er av cesiumklassen skal gjøre. <c2/> viser inline-inndataene. MTIE og TDEV som typen rapporterer kontrolleres mot pakken allantools på en innsjekket holdover-serie med { "2" } 048 sampler, nøyaktig for MTIE og til { "1.1e-15" } for TDEV, så matrisen får én VALIDATED rad og to MODELLED (transkripsjonen av maskene og forhåndsinnstillingene) og står nå på <b>{ "171" } rader — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Dekningen av feltenheter går fra { "60" } av { "61" } typer til { "61" } av { "62" }, og fra { "1,742" } til { "1,788" } beskrevne felt. Typen er ny og additiv: ingen eksisterende scenario, festing eller publisert tall flytter seg.

seg-5bb1ad9a34ec = Playground kjører motoren i en Web Worker i bakgrunnen, så et tregt scenario fryser ikke lenger siden.

seg-b1ab3546f131 = <c1/> er vert for WebAssembly-motoren og <c2/> videresender hver scenariokjøring til den — kjøringer, parametersveip og eksportene SP3 / OMM / OEM / CSV. En kjøring som varer lenger enn { "150" } ms viser en opptatt-tilstand (Run deaktivert, «Running… N s») og en Cancel-knapp som avslutter og starter workeren på nytt; en nettleser som ikke kan starte en modul-worker faller tilbake til den gamle stien i hovedtråden. <c3/>, som ble utelatt fra katalogen fordi den frøs siden, er tilbake i den, merket som treg: den tar omtrent { "13" } s i Chrome (fire motorkall på omtrent { "3" } s hver), og siden forblir responsiv i løpet av den tiden.

seg-146200dfac7e = <b>Hver rapportert størrelse i <c1/> har nå en enhet, en opprinnelsesklasse og en definisjon — den nest siste typen på unntakslisten for hele crate-en.</b> Alle { "41" } numeriske felt i det UTGITTE dokumentet er beskrevet, så dekningen av feltenheter går fra { "59" } av { "61" } typer til { "60" } av { "61" } og fra { "1,698" } til { "1,742" } beskrevne felt, med baklisten uten definisjon uendret på { "239" }.

seg-61b1219ae0e3 = Dette ble blokkert av festingen som fryser det utgitte dokumentet, som navnga <c1/> som en nøkkel dokumentet aldri må få. Å legge til en ville ha betydd å slette den påstanden og sette tre hasher på nytt som grunnlinje i tre filer — en form som ikke kan skilles fra å dekke over en regresjon. I stedet <em>beviser</em> de to festingene som måler dette dokumentet nå at tilleggene er additive: hver fjerner blokken <c2/> igjen og hasher på nytt mot konstanten som ble frosset før blokken fantes, og <b>begge konstantene er uendret</b>. En mutasjon bekrefter at garantien er ekte — flytt en utgitt verdi og sett hele dokumentets hash på nytt som grunnlinje slik en uaktsom rettelse ville gjort, og fjerning-og-hash-på-nytt feiler fortsatt. Den tredje festingen, i den generiske registry-golden-harnessen, er satt på nytt som grunnlinje i takt med de seks søskenene som ble satt på nytt av nøyaktig denne grunnen, og dens verdibærende literal <c3/> flytter seg ikke.

seg-a73409e0b664 = <c1/> rapporterer hvilken referanse hver rad for jordorientering ble vurdert mot, og hvor ofte reserveløsningen slo inn.

seg-6e0493a39f1a = <c1/> får <c2/> og <c3/>. Gulvet <c4/> vurderes mot Bulletin B final og kan bare bruke epoker som publiserer en; hver rad <c5/> vurderes mot <c6/>/<c7/>, som faller tilbake til den raske verdien i Bulletin A. På det medfølgende utdraget for { "2026" } er det { "12" } av { "31" } sampler ved én dag, mot { "0" } ved gulvet — så gulvraden og prediksjonsradene ved siden av hviler på målbart ulik referanse, noe rapporten nå oppgir i stedet for å la det utledes av et samplingstall som stiger der nestede horisonter sier at det ikke kan.

seg-7ba5be07fa8c = <c1/> gir en keplersk grunnlinje i samme størrelse.

seg-f9dc8fae6452 = <c1/> kjører den illustrative konstellasjonen på nytt ved antallet satellitter i det HENTEDE settet, til stede bare når antallene er ulike. Antallet er en del av det designets geometri — RAAN og middelanomali spres begge som <c2/> — så uten det ble et hentet sett med fem satellitter vurdert mot et illustrativt sett med åtte og design ble blandet sammen med størrelse. For LANS-referansesettet med fem satellitter viser det seg at { "8.68" } av dekningsgapet på 14.24 poeng skyldes de tre manglende satellittene og bare { "5.56" } poeng designet; for de fire romfartøyene som faktisk er i månebane når et spesialbygd sett med fire satellitter { "4.86" } % der de når { "0" } %. En test fester at den tilpassede raden er en gjenoppbygd konstellasjon og ikke den konfigurerte omdøpt, som var slik den først ble skrevet og det kjøringen da rapporterte.

seg-2e7e4dbbb7f6 = <b>Ni funksjonskort på det offentlige nettstedet, som dekker { "22" } rader i verifikasjonsmatrisen som ble levert uten kort på produktnivå.</b> Motoren hadde vokst en familie av funksjoner — ARAIM-kontrollen mot publiserte referansevektorer fra Working Group C, ekte hentet geometri for månekonstellasjoner, månens nektelseskontur med et målt C/N₀-bånd, steget fra VLBI-plan til stasjonskovarians, optisk og RF-overlevering med feilinjeksjon på tvers av modaliteter, prediksjon av jordorientering i sanntid mot arkivert Bulletin A, deling av apertur mellom navigasjon og kommunikasjon, INS/TRN-kjøring uten støtte, og dekning av enheter og opprinnelse — hver med en matriserad og et medfølgende scenario, og ingen av dem navngitt på kshana.dev. Dekningen fra kort til rad går fra { "72" } av { "168" } rader til { "94" }.

seg-3dc189224fe8 = <b>Åtte scenarioer er lagt til i playground-katalogen.</b> Kjør-knappen på et funksjonskort vises bare når <c1/> også inneholder filen; seks kort navnga et scenario som den ikke hadde, så de ble vist uten noen måte å kjøre dem på. Ett av dem, datumet for ekte laseravstandsmåling, hadde vært i den tilstanden siden det ble levert. <c2/> sikrer nå invarianten i begge halvdeler: målet <c3/> på et kort må være bundlet under <c4/> <em>og</em> tilbudt av katalogen. Mutasjonstestet mot begge feiltypene.

seg-2d69334516e9 = <b><c1/> skriver ut geometrien per satellitt som <c2/></b> når et eksportsted er konfigurert (G11). Det er den største tabellen crate-en publiserer, med { "2304" } rader i den utgitte felles tabellen for kommunikasjon og navigasjon, og den nådde brukerne bare inne i JSON, formatet som avkortet et søsterscenarios kurve på 57 punkter til { "23" } punkter under en kolonne som påstod å inneholde alle. Én rad per forbindelse, radantallet på overskriftslinjen, og antennekolonnene bare når en antenne var konfigurert. En kjøring uten eksportsted er uendret byte for byte og skriver ingen fil.

seg-7958d26072f7 = SBOM-en beskriver nå det som leveres: { "60" } komponenter ble til { "66" }.

seg-219cd333b000 = <c1/> listet hver pakke i oppløsningen med standardfunksjoner, dev-dependencies inkludert. Det førte <c2/> og <c3/>, crates som bare brukes i tester og ikke kompileres inn i noe artefakt, inn i materiallisten, og utelot kjeden bak <c4/> som PyPI-wheelen lenker inn (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), som er wheelens grense mot fremmedfunksjoner. Skriptet går nå gjennom oppløsningsgrafen fra kshana-pakken, bare via vanlige kanter og build-kanter, over unionen av funksjonssettene default, <c13/> og <c14/> (npm-pakken inneholder den samme SBOM-en), for hver målplattform. Den låste CycloneDX-vurderingen av overensstemmelse er satt på nytt som grunnlinje gjennom den innsjekkede generatoren: { "60" } → { "66" } komponenter, { "53" } → { "60" } sammensatte lisensuttrykk, og fortsatt null skjemafeil når disse er plassert i standardformen <c15/>.

seg-23c98d31f749 = <b>Reproduserbarhetstabellen i CSV nås fra hver inngang, ikke bare fra CLI-en og Python-wheelen.</b> MCP-serveren får et sjuende verktøy, <c1/>, som kjører et scenario og returnerer den byte-stabile tabellen som CLI-en skriver som <c2/>, eller en feil som navngir typene som publiserer en (<c3/>, <c4/>, <c5/>, og <c6/> bare når <c7/> + <c8/> er satt). WebAssembly-modulen får <c9/>, som returnerer den samme teksten eller <c10/>. MCP-rundturstesten og Python-bindingstestene fester nå den returnerte CSV-en byte for byte mot <c11/>, og fester at <c12/> returnerer antall byte skrevet, og { "0" } uten at noen fil opprettes for en type uten tabell. Hver flate som oppgir antallet MCP-verktøy eller lister verktøyene, sier nå sju.

seg-86c3fed5e23a = <c1/> i WebAssembly-modulen: én motorkjøring for alle utdata.

seg-3f2677cd280b = <c1/>, <c2/>, <c3/> og <c4/> kjører hver scenarioet fra bunnen av, så playground betalte for fire fulle kjøringer per klikk, omtrent { "12" } s i stedet for { "3" } s for <c5/> i en nettleser. <c6/> returnerer <c7/> fra én kjøring, og playground bruker den nå. Den stemmer byte for byte med de fire separate kallene.

seg-fa05c9ee0c6a = <b>REVISJON: koblingen mellom gyrobias og holdning i GNSS/INS-filteret hadde feil fortegn, og utfallstallene for <c1/> endres.</b> Det utvidede Kalman-filteret med feiltilstand (EKF) holder begge treghetsbiasene som residualer (sann verdi minus løpende estimat, tilbakeført ved addisjon). Akselerometerkolonnen drev hastighetsfeilen med <c2/>, men gyrokolonnen drev holdningsfeilen med <c3/>. En gjenværende gyrobias roterer i virkeligheten den beregnede holdningen med <c4/>, så hvert gyrobiasestimat dro i feil retning. Pakken holdt seg stabil bare fordi standard forhåndsverdi for gyrobias ({ "1e-4" } rad/s, 1-sigma) var stram nok til å holde disse tilstandene i ro. Med en videre forhåndsverdi divergerte filteret selv når den sanne gyrobiasen var null: { "93" } m fusjonert utfallsfeil ble til { "4.3" } km. De publiserte tallene for <c5/> endres slik:

seg-47e22e713df6 = før (≤ { "0.27.2" })

seg-5215a0a41b89 = etter

seg-f58aecc6864c = kaldatom-IMU, fusjonert RMS under utfall

seg-c4fbd933ddb2 = { "96.1" } m

seg-002d765fca02 = { "1.9" } m

seg-d14616d4ea1b = kaldatom-IMU, drift innenfor spesifikasjon ({ "50" } m)

seg-35f8f623ea28 = { "30" } s

seg-91645c14401b = { "60" } s (hele utfallet)

seg-f297a2652cf8 = taktisk IMU, fusjonert RMS under utfall

seg-0ac27c6d4206 = { "62.5" } m

seg-eda895cc3b86 = { "3.1" } m

seg-e0ab83f1d8d7 = taktisk IMU, drift innenfor spesifikasjon ({ "50" } m)

seg-5c526991a521 = { "37" } s

seg-743060da5543 = Tallene for fri drift ({ "130.7" } m og { "314.3" } m) endres ikke; de brukte aldri filteret. Pakkens tidligere tolkning, at den fusjonerte driften er begrenset av et gulv for overleveringsholdning og derfor ikke blir bedre med en bedre sensor, var en artefakt av denne feilen og er trukket tilbake. Med konstante, støyfrie biaser lærer filteret dem nå mens GNSS er tilgjengelig, så den fusjonerte driften er et beste tilfelle. Den eksterne filterpy-referansen (<c1/>) kontrollerer bare måleoppdateringene, og derfor så den aldri propagasjonen. To tester kontrollerer nå fortegnet direkte, og begge feiler på det gamle. Den første, i <c2/>, mater en kjent gjenværende gyrobias gjennom strapdown-beregningen og krever at filteret forutsier den resulterende holdningsfeilen innenfor { "2" } %. Den andre krever at en vid forhåndsverdi lærer en gyrobias på { "1e-3" } rad/s og holder seg innenfor { "6" } m. Den tverrplattform-golden-verdien for <c3/> er festet på nytt av denne grunnen og ingen annen.

seg-f764678e3376 = <b>Hver quickstart for registrene kjører nå som skrevet på en ren maskin.</b> Målt før denne endringen leste eksemplene for crates.io og PyPI (Python Package Index) <c1/>, som en registerinstallasjon ikke har, og npm-eksemplet krasjet under Node.js med <c2/>, fordi pakkens <c3/> henter WebAssembly-binæren og Nodes <c4/> ikke kan lese en lokal fil. Nå:

seg-e77a540d2f90 = <c1/> og <c2/> inneholder det scenarioet inline, slik <c3/> allerede gjorde. Rust-blokken er et helt program med sin egen <c4/>, siden den rustdoc-skjulte linjen <c5/> den endte med vises på crates.io og ikke kompilerer når den limes inn. <c6/> kompilerer den fortsatt byte for byte, og avviser nå også en skjult linje i blokken.

seg-ea5204ced0d2 = <c1/> skiller nettleseren fra Node.js og gir en Node-oppskrift som leser binæren fra disk og sender den til <c2/>. Doc-sync-testen godtar <c3/> som lasteren wasm-bindgen genererer.

seg-ebb763695c59 = Alle tre bygger inn scenarioet med proveniensstrengene uforkortet, så scenariohashen er <c1/> på hver flate. npm-eksemplet pleide å forkorte dem, og det ga det en annen hash enn CLI-en.

seg-dc52363432f8 = Gjengitt fra lokale bygg av dette treet: et nytt <c1/>-prosjekt med en stiavhengighet til den pakkede crate-en bygde og kjørte Rust-eksemplet; en wheel bygd med maturin fra de pakkede kildene, installert i et nytt virtuelt miljø, kjørte Python-eksemplet; og pakken <c2/>, pakket og installert med npm, kjørte Node-oppskriften. Alle tre skrev ut den samme sammendragslinjen.

seg-07e465a602f1 = <c1/> fungerer fra en klone.

seg-77ce31300b69 = <c1/> setter <c2/>. Uten det avviste cargo med «could not determine which binary to run», som hver <c3/>-linje i dokumentasjonen traff.

seg-2d516597b5f5 = <b>CLI-ens feilmeldinger det første minuttet sier hva du bør gjøre videre.</b> En scenariosti som ikke finnes, legger nå til et hint som peker på <c1/>, og et andre posisjonsargument skriver ut bruksteksten i tillegg til å navngi argumentet. <c2/>, <c3/>, feilen for ukjent alternativ (exit { "2" }) og <c4/>s enlinjes <c5/> ved suksess var allerede på main. <c6/> dekker nå alle sammen, siden ingen test kjørte binæren for noen av dem før.

seg-fdd9a27ccfc4 = <b><c1/> i Python er dokumentert som å returnere én JSON-streng, ikke en liste.</b> Den returnerer de samme metadataene som <c2/>, serialisert, så iterasjon går gjennom tegn. Den beholder strengreturen slik at eksisterende kallere ikke går i stykker. <c3/>, bindingens dokumentasjonskommentar, <c4/> og <c5/> sier nå dette og peker til <c6/>.

seg-f0e0c8c12f8a = <b>De tre README-filene for registrene skriver ut hver forkortelse ved første bruk.</b> PNT er nå utvidet i slagordet, der det først forekommer, og CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL og API er utvidet i filene som bruker dem. Overskriften på tabellen over uavhengige referanser sier ikke lenger «CI-gated» før CI er definert.

seg-554c5b0c9c60 = Rettet et publisert tall: tilgjengelighet for ARAIM med to konstellasjoner på de medfølgende Celestrak GPS- og Galileo-TLE-ene.

seg-1f023a822c91 = <c1/> oppga at å slå sammen Galileo løfter tilgjengeligheten fra { "0.21" } til { "0.67" } under en VAL på { "12" } m, og at modusen som er robust mot konstellasjonsfeil, er begrenset med bare to konstellasjoner. Det kom av at <c2/> propagerte hver satellitt fra sin egen TLE-epoke (<c3/> dropper epoken), og epokene i disse filene spenner over { "70.6" } t (GPS) og { "335.7" } t (Galileo), så satellittene stod på innbyrdes inkonsistente tidspunkter. Testen beholder nå hver epoke (<c4/>) og evaluerer hver satellitt på ett felles UTC-tidspunkt, den seneste TLE-epoken i settet (2026-06-07T07:{ "21" }:{ "04" }). Den målte tilgjengeligheten over det samme rutenettet på { "24" } t med 289 sampler blir GPS alene { "0.993" } (var { "0.208" }), sammenslått { "1.000" } (var { "0.671" }) og dual robust mot konstellasjonsfeil { "0.990" } (var { "0.031" }); ved APV-I-grensen går dual-modusen fra { "0.180" } til { "1.000" }. Konklusjonen snus: på en konsistent himmel bærer to konstellasjoner hypotesen om konstellasjonsfeil ved en VAL på { "12" } m. De samme tallene fås med den tidligste TLE-epoken som referanse. En selvkontroll i testen fester tilgjengelighetsløkken sampel for sampel til <c5/>, så den eneste forskjellen er tidsjusteringen. <c6/> og <c7/> §{ "3" } har de nye tallene; oppføringen for { "0.13.0" } nedenfor er latt stå slik den ble utgitt.

seg-3173a2e03521 = <b>De offentlige flatene reklamerer ikke lenger for RINEX { "4" } som validert.</b> Motoren avviser nå en RINEX { "4" }-navigasjonsfil ved navn i stedet for å dekode den feil, men standardrutenettet viste fortsatt et kort «RINEX { "3" } / { "4" }» med et <em>validert</em>-merke, knyttet til RINEX-3-evidensen for navigasjonsparseren. Kortet er nå «RINEX { "3" }», og README, <c1/>, <c2/>, <c3/> og funksjonssammendraget oppgir det som er sant: RINEX 3.0x-observasjonsfiler parses, observasjonsoppsettet { "4.00" } forventes å parses, men ingen { "4.00" }-fil er lest gjennom koden, og RINEX { "4" }-navigasjonsfiler avvises.

seg-c9bb514acb7a = <b><c1/> sier fra når «ok» betyr at det ikke var noe å kontrollere.</b> Omtrent to tredjedeler av katalogen publiserer ikke noe obligatorisk felt; de pakkene kjører referansekonfigurasjonen sin fra en tom body, så lint-kontrollen kunne bare skrive ut «ok» for dem, med de samme ordene som den brukte etter å ha kontrollert seks felt. Suksesslinjen oppgir nå antallet obligatoriske felt den fant til stede, eller at typen ikke krever noen.

seg-06b324d00285 = <b><c1/> avviser en ikke-numerisk <c2/> eller <c3/>.</b> Under bash { "3.2" } fikk <c4/> den numeriske sammenligningen til å gi feil og evaluere til usann, så gaten kunngjorde «repeatability loop SKIPPED (REPEAT={ "0" })» for en verdi som ikke var { "0" }, og skrev likevel en kvittering. Begge innstillingene avslutter nå med { "2" } med mindre de er rene heltall.

seg-09d04ffdd9ac = MSRV oppgis som { "1.85" } overalt der et menneske leser det.

seg-dafc23725315 = <c1/> gikk til { "1.85" } forrige utgivelse; README-merket, installasjons- og feilsøkingsteksten, <c2/> og MCP-crate-ens egen begrunnelse sa fortsatt { "1.75" }.

seg-c2fa8a31058c = <b><c1/> i Python-bindingen rapporterer byte, ikke «chars».</b> Den skrev ut <c2/> av UTF-8-strenger, som er et antall byte: { "710" } «chars» for en tabell på 708 tegn.

seg-6b4452a4e340 = README dokumenterer ikke lenger <c1/> sammen.

seg-47d83e4d847b = <c1/> er et flagg for ett enkelt scenario og ignoreres med <c2/> (binæren advarer). De to kopier-og-lim-eksemplene i README.md og README.crates.md viser nå study-kommandoen alene.

seg-5ed7f8330b2d = <b>Nettstedets evidens for klokkestabilitet oppgir begge observerte toleranser.</b> 5071A-cesiumserien gjenskapes til ≤ { "3e-5" } og PHASE.DAT til ≤ { "5e-5" }; avsnittet oppga { "3e-5" } for begge.

seg-8bba7f1171f3 = To filer med motorutdata spores ikke lenger.

seg-ea9bf1d14371 = <c1/> var stemplet av motor { "0.20.0" } med hvert kvalitetsmål tomt, og READMEs egen study-kommando overskrev dem, noe som gjorde treet urent og blokkerte push-gaten. <c2/> / <c3/> ignoreres nå som de fire andre motorutdataene.

seg-77ce9b90859d = <b>En seed-sveip i playground feiler ikke lenger ved hver kjøring.</b> Sveipet steppet heltallsinnstillingen <c1/> lineært ({ "1" }, { "10.9" }, { "20.8" }, …), og motoren, som leste den som <c2/>, avviste hver brøkverdi. Heltallsinnstillinger sveipes nå over distinkte hele tall.

seg-e1b1e1360eb9 = <b>Hver nedlasting fra playground sier hvilken motor og hvilke inndata som laget den.</b> Noen få typer (for eksempel <c1/>) gir ingen <c2/> eller <c3/>, så nedlastingene deres het bare <c4/>. Navnet faller nå tilbake på den innlastede motorens versjon og et FNV-1a-64-fingeravtrykk på 12 heksadesimale tegn av scenarioteksten.

seg-0181e86b576a = <b>Den publiserte crate-en er mindre enn halvparten så stor som før, og <c1/> bygger bare CLI-en.</b> Pakken pleide å inkludere artiklene, innleveringspakkene deres, artefaktene for artikkelfigurene, notatbøkene, <c2/>, vedlikeholdsskriptene og eksempelprogrammene. Ingen av dem kompileres av biblioteket eller CLI-en. Den inkluderte også de tre interne generatorene under <c3/> (<c4/>, <c5/>, <c6/>), så en registerinstallasjon kompilerte og installerte fire kjørbare filer, hvorav tre bare var nyttige inne i en utsjekking. Disse trærne og de tre generatorkildene er nå utelatt. Cargo lister en pakkes binærer fra filene den inneholder, så det publiserte manifestet navngir bare <c7/>. I en klone finnes generatorene fortsatt automatisk, så <c8/> og utgivelsesjobben som kjører <c9/> er uendret. Målt med <c10/>: { "763" } filer, { "16.7" } MiB, { "6.8" } MiB komprimert før; { "591" } filer, { "10.5" } MiB, { "3.0" } MiB komprimert etter. Verifikasjonsbygget, som bare kompilerer de pakkede filene, består. <c11/> på den pakkede crate-en installerte én kjørbar fil, <c12/>.

seg-567c7059286f = <b>Utdata en tidssynkroniseringsingeniør kan lese: ikke mer <c1/>, ikke mer <c2/> uten angrep, og stedtall som stemmer med README-filene.</b> Dette er en visningsrevisjon. Ingen publiserte tall endres; JSON-verdiene er identiske, noe golden-hashene ovenfor beviser.

seg-849fa9a29f07 = Enlinjessammendraget skrev ut den optiske klokkens 95-persentil (p95) for tidssynkroniseringsfeil som <c1/> mens tabellen ved siden av viste { "1.20e-4" } ns. Et tidssynkroniseringstall som ikke er null, men for lite for én desimal, skrives nå ut med tre gjeldende siffer (<c2/>); en eksakt null skrives fortsatt ut som <c3/>. HTML-rapporten (HyperText Markup Language), sammenligningstabellen for studier og playgrounds nedlastbare rapport bruker den samme regelen, så heller ikke noe tall som ikke er null skrives ut som <c4/>.

seg-c44323babd1e = <c1/> er en analytisk grense for spoof-detekterbarhet som bare betyr noe mot et konfigurert angrep. Typene <c2/>, <c3/>, <c4/> og <c5/> konfigurerer ingen, så sammendraget deres skriver nå ut <c6/> i stedet for et tall som <c7/> som leses som en mislykket deteksjon. Verdien blir værende i <c8/>, merket <c9/> med årsaken i <c10/>, og rapporttabellene viser «not applicable». Typen <c11/> skårer fortsatt deteksjon.

seg-f54d5ffb7dff = To sammendragsfestepunkter i <c1/> flyttet seg av akkurat disse to grunnene og ingen andre: <c2/> (kvante-p95 og begge <c3/>-verdiene) og <c4/> (begge <c5/>-verdiene; p95-verdiene er nøyaktig null). Hashene for hele dokumentene flyttet seg ikke. De forventede sammendragene i README, de tre veiledningene og undervisningsscenarioene deres er oppdatert så de stemmer, og <c6/> kontrollerer undervisningskopiene mot motoren.

seg-e8e012376fa3 = Playgrounds guidede tur åpnes ikke lenger ved første innlasting. Modalen fanget de første klikkene, og spotlighten scrollet siden bort fra der besøkende landet. Den starter fra knappen «Take the 60-second tour» eller den flytende Tour-knappen.

seg-4d60d4ea4d7d = Siden scroller ikke lenger sideveis på en telefon. Ved { "390" } px kom merkeraden og GitHub-knappen til omtrent { "410" } px innhold, en overflyt på { "4" } px; toppen passer nå fra { "320" } px og oppover, og tabellen over kvalitetsmål scroller inne i sin egen boks i stedet for å gjøre siden bredere.

seg-f6ec6a64071d = Funksjonsutforskeren åpnet med sitt eget kortantall («{ "46" } funksjonskort … { "17" } støttet av en ekstern uavhengig referanse») ved siden av README-filer som sier { "64" } av { "168" }. Den åpner nå med verifikasjonsmatrisen, lest fra den genererte <c1/> (den samme matrisen som README-tallene er festet til), og navngir kortene etterpå som det sammendragslaget de er. <c2/>, et nytt steg i arbeidsflyten for kontinuerlig integrasjon (CI), kontrollerer regnestykket og krysskontrollerer README.md og sidens beskrivelser; <c3/> fester koblingen fra Rust-siden.

seg-606098743e57 = <b>Den offentlige beskrivelsen åpner nå med tidssynkronisering og holdover, det best validerte området.</b> README-åpningen og <c1/> presenterer Kshana som en åpen, reproduserbar PNT-robusthetsmotor for evidens med merket proveniens: tidssynkronisering og holdover for kritisk infrastruktur først (estimatorene for Allan, modifisert Allan, tidsavvik og maksimal tidsintervallfeil og inversjonen av coast-variansen i holdover er de VALIDATED radene bak), kvante som en nøytral metode for kvante-mot-klassisk-avveining der resultatene er merket MODELLED, og lunar / cislunar og dypromsnavigasjon som vedlikeholdte funksjoner og ikke hovedbudskapet. Begge sidene sier nå hva Kshana ikke er: ikke en simulator for radiofrekvenssignaler eller en rigg med maskinvare i løkken, ikke en erstatning for MATLAB/Simulink, STK eller Orekit, og peker til den nye typen <c2/> og <c3/>. Den gamle linjen «there is no good open tool» er borte: et søk som ikke finner noe, er ikke evidens for at ingenting finnes. <c4/> får en udatert prioritert rekkefølge (tidssynkronisering først, kvanteavveiningen som nummer to, lunar vedlikeholdt) og dropper tre utdaterte punkter (systematikk for Coriolis og lysskift, startbetingelsene for NRHO og lunar-scenarioet, alle levert); README-linjen «Coriolis and light-shift remain roadmap» er rettet på samme måte.

seg-7bc48692be0b = <b><c1/> sluttet å underkommunisere.</b> Raden for jordfaste referansesystemer sa «none» mens matrisen graderer GCRS→ITRS som VALIDATED; den er nå «full», og raden for kjernereferansesystemer registrerer ANISE-krysskontrollen som levert. Guidet modus var oppført som veikart; playground har levert guidede glidere og en guidet tur. En gjennomgang mot <c2/> rettet fem rader til som var eldre enn valideringene sine: kraftmodellen Cowell og batch-/sekvensiell banebestemmelse mot Orekit { "12.2" }, bakkestasjonspasseringer mot Orekits elevasjonsdetektor, kjernen for dilution of precision mot gnss_lib_py, og OEM-import mot den uavhengige <c3/>-parseren; raden for verifikasjon og validering navngir nå vaktene som kontrollerer at hver siterte test finnes.

seg-9d144df304ca = Ordlisten forklarer hva en resultatfil sier.

seg-eed672b2f8fd = <c1/> får forklaringer i klart språk for utdatabegrepene (holdover, p95, integritet, sikkerhetsscoren, PDOP, <c2/>, <c3/>), begrepene for telekomtidssynkronisering (tidsfeil, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) og de tre evidensnivåene (VALIDATED, MODELLED, PARTNER).

seg-1a4f9d5eef96 = <b>Forkortelser skrives ut ved første bruk i hvert håndskrevne offentlige dokument.</b> README og { "24" } filer under <c1/> hadde flere hundre forkortelser brukt før, eller uten, utvidelsen sin; hver er nå utvidet der den først forekommer i den filen. De tre genererte filene (<c2/>, <c3/>, <c4/>) er latt stå: de skrives fra <c5/> og <c6/>, så ordlyden må endres ved kilden.

seg-2889ce118381 = Linjedekning har et målt tall som er førende.

seg-9c4684c0a4ef = <c1/> registrerer { "95.63" } % ({ "37,697" } av { "39,419" } linjer) fra CI-jobben <c2/> på <c3/>, og <c4/> fester de fem offentlige flatene med «~{ "96" }%» til det, det ene hovedtallet som ble vedlikeholdt for hånd og som allerede hadde flyttet seg én gang uten at noen la merke til det.

seg-ebd36b7291df = Nye doc-sync-gater for flater ingenting leste.

seg-3dd44fc69a28 = <c1/> kontrollerer hver <c2/> i en JavaScript-blokk mot WebAssembly-eksportene, og fester Rust-eksemplet i README.crates.md byte for byte til en kopi testbinæren kompilerer. <c3/> feiler hvis <c4/> mister <c5/> eller SECURITY.md slutter å oppgi det. <c6/> skanner nå også <c7/> og de tre README-filene for registrene, og hver standard på nettstedet må oppgi sin <c8/> eksplisitt.

seg-a506d14f3447 = De to kontrollene av ekte maskinvareklokker kjører på en runner.

seg-c7f8b8627137 = <c1/> (månedlig og ved dispatch) henter seriene 5071A og PHASE.DAT og kjører begge testene med <c2/>, så en manglende inndata gir feil i stedet for å hoppes over. Begge hentingsskriptene er festet til én allantools-commit og verifiserer SHA-256.

seg-3b4a7fee3cd0 = <b>Python-typestubben kontrolleres mot den bygde wheelen</b> (<c1/> i bindings-jobben), og det var slik <c2/>/<c3/> ble levert uten stubb.

seg-24c2ccf3634a = <b>Ordlisten definerer URE, EOP, FoM, CTI og TIB</b>, som README og registeret brukte uten forklaring.

seg-ae044195cd47 = <b>Hver types publiserte feltkontrakt er nå sann, og en test holder den der.</b> Fem av de { "61" } typene endret seg. Typer med et ikke-tomt <c1/> går fra { "21" } til { "22" }: <c2/> krever nå <c3/> (en bar <c4/> pleide å bestå <c5/> og deretter feile kjøringen), og <c6/> legger til <c7/>, som kjøringen allerede krevde. En obligatorisk oppføring kan bruke <c8/> (ett av disse) og <c9/> (alle disse sammen); <c10/> forstår begge. <c11/>, <c12/> og <c13/> publiserer { "9" } ekte valgfrie felt de hadde utelatt. <c14/> sier nå at <c15/> er obligatorisk for hver type unntatt <c16/>. <c17/> kontrollerer hver type mot det medfølgende scenarioet: å fjerne en hvilken som helst obligatorisk oppføring må få kjøringen til å feile, og et dokument som bare har de obligatoriske feltene, må kunne kjøres.

seg-09ba716f3e97 = Notatene for JetBrains Marketplace er gatet.

seg-938ff48e7a2d = <c1/> feiler nå med mindre den nyeste oppføringen <c2/> i <c3/> navngir versjonen som leveres; sju publiserte versjoner hadde servert notatene for { "0.22.0" } uendret.

seg-3d38550854e0 = Dekningstallet i den tekniske rapporten er det målte.

seg-bd312cd26746 = <c1/> sa «near { "97" } %»; den sier nå nær { "96" } % ({ "95.63" } % målt, <c2/>) og er den sjette flaten dekningstesten fester.

seg-934680d402da = <b>Motorklienten utenfor hovedtråden er testet</b> (<c1/>, i CI): tillatelsesliste for dispatch, avbrytelse og ny oppstart, de tre reserverutene i hovedtråden og krasjgjenoppretting, mot en falsk worker.

seg-fd5f9a8a4f43 = <b>Ingenting publiseres før den merkede commit-en har bestått testene sine, og en utgivelse er ikke ferdig før hvert register serverer den.</b> Rekkefølgen er nå tag, verifiser, publiser, paritet, nettsted, i én kjøring av <c1/> (<a1><c2/></a1>).

seg-745b11c8ed74 = Publisering venter på dommen.

seg-e66c890cf6c0 = <c1/>, <c2/> og <c3/> starter ikke lenger på tag-pushen; <c4/> kaller dem fra jobber som har <c5/>. Før løp de i kappløp med den: på { "v0.27.2" } hadde crates.io, npm og Python Package Index (PyPI) alle publisert innen { "4.5" } minutter etter taggen, og <c6/> kom tilbake { "84" } minutter etter den; på { "v0.27.0" } publiserte npm og PyPI mens crates.io-jobben feilet. Et manuelt nytt forsøk på en tag holdes tilbake av det nye <c7/>, som krever en grønn <c8/> for akkurat den commit-en fra Actions-grensesnittet og feiler lukket på alt annet.

seg-3800247c81f2 = <em>Alt bygges før noe lastes opp</em>, og crates.io, hvis pakkesteg var det som feilet midt i en utgivelse, publiserer først.

seg-6929a7608da7 = <em>En manglende registertoken får jobben til å feile</em> i stedet for å hoppe over opplastingen og rapportere suksess.

seg-460811602293 = En paritetskontroll etter publisering.

seg-86eb0fab2f7c = <c1/> poller crates.io (<c2/> og <c3/>), npm, PyPI (kildedistribusjonen og alle seks plattformwheels) og ghcr.io til hver serverer versjonen, ellers feiler kjøringen; docs.rs og Model Context Protocol-registeret (MCP) rapporteres, men kreves ikke. Kjørt mot tidligere utgivelser finner den at { "0.22.0" } mangler fra npm og PyPI, { "0.23.0" } fra PyPI og { "0.27.0" } fra crates.io.

seg-79578a00fd78 = <em>Ferdigbygde kommandolinjebinærer for macOS (Apple silicon og Intel) og Windows x86-64</em>, navngitt etter mål (<c1/> og så videre), ved siden av Linux-binæren <c2/>, hvis navn er uendret. En <c3/>-fil dekker hver ressurs, og <c4/> kontrollerer den og kjører macOS- og Windows-binærene på sine egne systemer.

seg-3e1f5afa9f2a = <em>kshana.dev viser en utgivelse, ikke <c1/>.</em> Den pleide å deployes på nytt ved hver push til <c2/> mens sidene navngav den siste utgivelsen. <c3/> bygger nå bare en utgivelsestag: utgivelsen starter den når hver kanal serverer versjonen, og en manuell dispatch deployer den nyeste utgivelsen (eller en navngitt) på nytt.

seg-43da8f3f171e = Én kilde til wheels.

seg-b911ac65e231 = Den håndkopierte matrisen med seks mål i <c1/> er borte; den kaller <c2/>, så auditwheel-tag-gaten og kontrollen av byte-reproduserbarhet graderer nå de wheelene PyPI mottar, og en feil i en av dem stopper utgivelsen.

seg-194c4b019a4c = <em>Festede byggeverktøy.</em> Hver arbeidsflyt ber om Rust { "1.93.0" } (msrv-jobben om sin egen versjon); <c1/> og <c2/> hadde bedt om <c3/>, og loggen for { "v0.27.2" } viser at rustup installerte { "1.98.1" } og deretter kompilerte med { "1.93.0" } bare fordi <c4/> har forrang. wasm-pack er festet til { "0.13.1" } (versjonen som bygde { "v0.27.2" }, og som det ufestede installasjonsskriptet valgte) med en sjekksumkontroll, og mcp-publisher til { "1.8.1" } med sin publiserte SHA-256. <c5/> feiler nå hvis en arbeidsflyt ber om en annen kompilator eller piper et nedlastet skript inn i et skall. Ingen verifikasjonsjobb, golden-festing eller lokalt gate-skript er fjernet eller løsnet.

seg-9e2a7376367e = <b>Hver tredjeparts GitHub Action er festet med commit-SHA</b>, { "93" } referanser i { "15" } arbeidsflyter, { "92" } av dem nye, med taggen beholdt som en etterfølgende kommentar slik at Dependabot kan oppdatere. Unntaket er <c1/>, hvis tag er verktøykjedevelgeren.

seg-6afb4a8770b0 = <b>Basislagene i MCP-serverens image er festet med multi-arch-digest</b>, og Dependabot overvåker nå Dockerfile-en til <c1/>, så OS-lagene fortsatt mottar sikkerhetsoppdateringer, gjennom en gjennomgått PR.

seg-4ea8b158b408 = Kontrollen av tag mot manifest kjører i de to publiseringsarbeidsflytene som leverer tagens versjon.

seg-4b77764e955d = <c1/> (ghcr-image, MCP-register) og <c2/> (Marketplace) løper i kappløp med <c3/> i stedet for å vente på den, så en feilkuttet tag ble bare gatet i en søsterarbeidsflyt. Begge kjører nå <c4/> før bygging.

seg-bf90c4063843 = <b>Fire advisories Dependabot reiste dagen varslene ble slått på, er rettet.</b> MCP-serveren går fra <c1/> { "1.7" } til { "2.2" }: tre advisories mot <c2/> < { "2.1" } (en lekkasje i Streamable-HTTP-sesjonstabellen, manglende validering av OAuth protected-resource, egendefinerte headere som følger en kryssopprinnelse-omdirigering), ingen av dem nåbare her siden serveren bare snakker stdio, men en publisert crate bør ikke feste en sårbar SDK. Makroene i <c3/> { "2" } trenger Rust { "1.88" }, så bare <c4/> erklærer nå <c5/>; biblioteket <c6/> blir på { "1.85" }. Den ene API-endringen (<c7/> → <c8/>) er gjennomført, og rundturstestene består. SonarQube-skanneaksjonen går fra v5 til v6, som retter en advisory om argumentinjeksjon (≥ { "4.0" }, < { "6.0" }).

seg-2652aaad177e = <b>Hvert Rust-element en rad i verifikasjonsmatrisen siterer, blir nå slått opp mot crate-en.</b> Den eksisterende vakten kontrollerte siteringene som har form som filstier; { "63" } av de { "164" } radene som ikke er partner, navngir i stedet evidensen sin som et element i crate-en: <c1/>, <c2/>, <c3/>, og et token uten suffikset <c4/> var usynlig for en stiskanner. Disse radene kunne ha navngitt en omdøpt modul, en tømt testmodul eller en funksjon som aldri fantes, og hver gate ville ha holdt seg grønn.

seg-01eee5115e3f = <c1/> løser alle { "339" } slike siteringer gjennom modultreet, krever at hver rad som ikke er partner navngir minst én test som faktisk har <c2/>, og krever at partnerrader ikke navngir noen. Fire mutasjoner ble brukt til å gradere den: å omdøpe en sitert modul, å peke en rads eneste testsitering på en funksjon som ikke er en test, å omdøpe den ekte <c3/> og å fjerne attributtene <c4/> fra den; hver blir rød på påstanden som eier den.

seg-7731d549c739 = Én rad var allerede feil: <em>Alternative / complementary PNT</em> siterte <c1/>, en glob, som ikke er en sitering. Den navngir nå <c2/> og de tre testmodulene i crate-en bak den.

seg-cf6fd64368de = <b>De publiserte figurene kontrolleres på nytt mot motoren ved hvert bygg</b> (<c1/>). De tre demodiagrammene i README er motorens egne <c2/>-utdata, og ingenting kjørte scenarioet på nytt; artikkelens to krysningsstudier ble generert én gang og committet; og README oppgir fire kvalitetsmål i prosa ved siden av <c3/>. Alle tre er nå festet til levende motorutdata.

seg-276b65a8f76a = Avstemmingen ga det nyttige resultatet: demodiagrammene var tegnet med motor { "0.22.0" } og artikkelens krysnings-JSON med { "0.20.0" }, og med { "0.27.1" } er <b>hver plottede verdi i alle fem artefaktene identisk</b>; de tre diagram-SVG-ene skiller seg fra en ny kjøring med nøyaktig to tegn hver, versjonsstempelet i bunnteksten. Diagrammene er rendret på nytt slik at bunnteksten stemmer. Artikkelens JSON er bevisst latt stå stemplet { "0.20.0" }: den er opptegnelsen over kjøringen hvis figur en publisert artikkel bygger inn, og å stemple den på nytt ville hevde en proveniens PDF-en ikke har. Vakten påstår i stedet den sterkere egenskapen, at dagens motor fortsatt gjengir hver publiserte verdi.

seg-c88647c5f2fc = SonarCloud-analyser ble registrert som <c1/>, så perioden for ny kode i <c2/> gikk aldri fremover: den var fortsatt forankret ved analysen 2026-07-02, gradererte åttito dagers arbeid som ett enkelt delta og målte { "7877" } «nye» duplikatlinjer mot en terskel på { "3" } %. Skanningen sender nå crate-versjonen. Den underliggende dupliseringen er reell og skjules ikke av dette: den er konsentrert i de deklarative <c3/>-registrene som gjentas på tvers av <c4/>, <c5/>, <c6/>, <c7/> og <c8/>, og i verifikasjonstabellen med 168 rader, og den er navngitt her som arbeid og ikke utelatt fra målingen.

seg-f2a0960a6f11 = <b><c1/> hadde ingen lås for én enkelt skriver, og hver kjøring skrev den samme loggen.</b> Det handler ikke om ryddighet: kvitteringens <c2/>, <c3/> og <c4/> leses tilbake FRA den loggen, og pre-push-kroken stoler på kvitteringen. En gate som var drept, men hvis testbinær fortsatt var i live, fortsatte å skrive inn i filen den neste kjøringen nettopp hadde avkortet, så én kjørings tall kunne ha blitt bekreftet som en annen kjørings og gitt tillatelse til en push på grunnlag av en suite som aldri kjørte på treet som ble pushet. Det er nå én gate per utsjekking (den avviser med exit { "75" } ved siden av en levende, og rydder bort en foreldet lås hvis pid er borte) og én logg per kjøring, med <c5/> oppdatert fra den ferdige kjøringen på vei ut. Begge retninger er testet: en levende pid avvises, en død ryddes bort.

seg-687d6fe87221 = <c1/> hevdet at testene sine «do <b>not</b> prove the named test/oracle strings resolve to live code». To vakter gjør nå akkurat det, så moduldokumentasjonen sa det motsatte av sannheten; den oppgir nå hva som kontrolleres maskinelt og hva som overlates til menneskelig skjønn. En utdatert referanse til <c2/>, der modulen er <c3/>, er rettet i søstervaktens egen dokumentasjon.

seg-014070f0873c = <b><c1/> ble skrevet om 2026-09-22 og force-pushet.</b> Ti commits ble til fire. Omskrivingen slo hver commit som lot en gate være rød sammen med commit-en som ryddet den, så hver commit på <c2/> har nå et tre som består, og fjernet de avbrutte kjøringene som en samtidighetsgruppe for hele grenen hadde latt ligge igjen på hver erstattet commit.

seg-b48d6cfc3b42 = Ingenting ble forkastet. Commit-ene fra før omskrivingen er fortsatt tilgjengelige gjennom taggene som peker på dem, og det endelige treet er byte-identisk med treet omskrivingen startet fra: <c1/> mellom den gamle spissen og den nye er tom bortsett fra de tre arbeidsflytfilene denne utgivelsen endrer.

seg-0549cfdc6d69 = De erstattede SHA-ene, for alle som holder en referanse til en av dem:

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

seg-9c220336c895 = <b>Taggene { "v0.27.0" } og { "v0.27.1" } ble bevisst IKKE flyttet.</b> De peker fortsatt på <c1/> og <c2/>, de nøyaktige commit-ene hvis trær ga artefaktene som nå ligger på crates.io, npm, PyPI, ghcr.io og MCP-registeret. En crates <c3/> registrerer sha1-en den ble pakket fra, registre er uforanderlige, og SLSA-attestasjonen av build-proveniens på ressursene i utgivelsen { "v0.27.1" } er bundet til den commit-en. Å flytte taggene ville ha latt hvert av de publiserte artefaktene peke på en commit som ikke lenger finnes. Å la dem stå holder de gamle commit-ene tilgjengelige og hver publisert provenienskjede oppløsbar, til prisen av to tagger som ikke lenger er forfedre til <c4/>, og det er derfor denne utgivelsen finnes: { "v0.27.2" } gir <c5/> en egen tag, pakket fra en commit som ligger på den.

seg-3c644384256f = Dette er den andre opplyste omskrivingen av denne historikken; den første, 2026-09-21, kanoniserte forfatterskap og er registrert i notatene for { "0.27.0" } med sine egne to hengende crate-sha1-er. En omskriving opplyses her hver gang, fordi et repository som selger verifiserbar proveniens ikke i det stille kan flytte grunnen under et publisert artefakt.

seg-d82d7a3c9054 = Den publiserte crate-en kompilerte ikke.

seg-ebc99c9df1ef = <c1/> har en <c2/> på toppnivå av <c3/>, og manifestet utelater <c4/> fra pakken, så tarballen crates.io mottar manglet en fil biblioteket selv bygger inn. Publiseringen av { "v0.27.0" } feilet i verifikasjonsbygget av den grunnen, og ingen { "0.27.0" } nådde crates.io; npm og PyPI, hvis jobber ikke avhenger av den, publiserte normalt. Utelatelsen har nå et unntak for akkurat den katalogen.

seg-6ff9cdb976e8 = Hver annen <c1/> av en fixture i <c2/> ligger inne i en <c3/>-modul og når derfor aldri det pakkede biblioteket. Bare en på toppnivå gjør det.

seg-7f0975453b8f = <b>Ingenting i CI kjørte <c1/>,</b> og derfor ble en tarball som ikke kan kompileres, først oppdaget av publiseringsjobben, etter at to andre registre allerede hadde levert. En <c2/>-jobb bygger og kompilerer nå akkurat den tarballen ved hver push.

seg-1f2df48821fc = Emisjonsfestene for lunar-frame-realisation flytter seg ikke lenger ved en versjonsøkning. SVG-bunnteksten inneholder motorversjonen, så hver utgivelse satte tre hasher på nytt som grunnlinje, to ganger på én dag, og et feste som tas på nytt av rutine, slutter å bli lest. Versjonsstrengen normaliseres til en plassholder før hashing, og emisjonen påstås separat å oppgi den kjørende versjonen, så det faktumet kontrolleres mer presist enn hashen noen gang kontrollerte det.

seg-56309487ea7e = <c1/>, lunar-referansedatumet fra en ekte observasjonskampanje.

seg-966a2cc4e40d = <c1/> erstattet en injisert Helmert-transformasjon med en <em>simulert</em> kampanje og sa det: stasjonsnettverket, planen og sigmaet per observasjon er illustrative inndata. Dette scenarioet fjerner simuleringen fra de to stedene der en plan og en feilmodell går inn i svaret. Epokene er sendetidspunktene til { "337" } arkiverte ILRS normalpunkter for lunar laseravstandsmåling (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } og Matera MLRO { "7941" }, alle fem retroreflektorarrayene), og hver observasjonsvekt er det normalpunktets egen arkiverte presisjon, <c2/>, en median på { "5.13" } mm ettveis avstand, hentet ut av filen og ikke valgt her. Stasjonskoordinatene kommer fra IERS ITRF2020 og reflektorkoordinatene fra JPL DE430 tabell { "7" }; hver fixture registrerer en URL, en hentedato og en SHA-256 og regenereres fra kilden sin av en innsjekket generator som verifiserer kilden og avbryter i stedet for å skrive ut et tall. Rapporten navngir hvilke forbindelser som er målt og hvilke som fortsatt er modellert, og de modellerte er <em>målt</em>: forskjellen mellom observert og beregnet ettveis avstand over de ekte dataene er { "156 494" } m RMS, noe det samme testsettet bekrefter mot JPL Horizons over det samme tidsrommet ({ "195 655" } m RMS-vektor, verste epoke { "0.054" }°, innenfor de ~{ "0.3" }° den innebygde analytiske lunarserien hevder for seg selv). Additivt: en ny type, en ny leser (<c3/>) og en ny modul (<c4/>); de eksisterende lunar-frame-pakkene er festet bit for bit.

seg-7fcd2af0a688 = <b><c1/> som scenarioparameter</b> på <c2/> og <c3/>. Nøyaktigheten for signal-i-rommet-avstandsmåling var en konstant ved kompileringstid (<c4/>), så et sveip over tjenestevolumet kunne bare svare bestått/ikke bestått ved én fast verdi. Beskyttelsesnivåene er nøyaktig lineære i den, så å eksponere den gjør sveipet til et <b>krav</b> til avstandsmålingsnøyaktighet over hele volumet. Standardverdien gjengir tidligere oppførsel bit for bit.

seg-c3ccc1e89a2d = <b>Eksport av geometri per satellitt</b> på <c1/>: <c2/> + <c3/> legger til en <c4/>-tabell som gir azimut, elevasjon og skrå avstand til hver satellitt ved hver epoke for ett navngitt selenografisk sted, pluss synlighetsflagget. Det aggregerte dekningssammendraget slår bevisst sammen geometrien per satellitt, men skrå avstand er akkurat det et linkbudsjett bruker, så en felles analyse av kommunikasjon og navigasjon kunne ikke gjøres fra sammendraget alene. Av med mindre begge koordinatene er oppgitt; rent additivt.

seg-ae7886fbca9d = <c1/>, den offentlige hjelperen for siktevinkler bak eksporten.

seg-b187bade5f04 = En rad i verifikasjonsmatrisen for den nye geometrifunksjonen.

seg-14ef785b6c12 = <b>Det ekte antennemønsteret i geometrieksporten.</b> Motoren har hatt et mønster for en sirkulær apertur med jevn belysning siden P1 (<c1/>, Airy-formen <c2/>), og <b>ingenting utenfor <c3/> brukte det</b>; en boresight-forsterkning sammen med en tommelfingerregel fra forsterkning til stråleåpning gjorde jobben i stedet. En valgfri <c4/>-tabell på <c5/> (leses bare når eksportstedet er satt) gir nå hver eksporterte rad <b>vinkelen utenfor boresight ved satellitten</b> og <b>sendeforsterkningen mot stedet fra det mønsteret</b>, og legger til en <c6/>-blokk som rapporterer <b>antallet i strålen under det ekte mønsteret ved siden av antallet i strålen under den symmetriske tilnærmingen</b> (<c7/>) med forskjellen som en navngitt korreksjon. Begge tallene skrives ut; ingen av dem erstatter den andre. Målt ved motorens egen representative lunar apertur ({ "1" } m parabol, { "2.4" } GHz, η = { "0.60" }) over et sted ved sørpolen og det illustrative skallet i LCNS-klassen <b>er de to uenige med mer enn én satellitt</b>: det ekte mønsteret setter { "0" } av { "76" } synlige forbindelser innenfor halveffektstrålen, tilnærmingen påstår { "28" }, en korreksjon på −{ "2.33" } satellitter per epoke, verste enkeltepoke { "3" }. Tilnærmingen har sin egen aperturvirkningsgrad ({ "0.641" } mot gradregelen <c8/> den vanligvis oppgis med, { "0.920" } mot en uniform sirkulær apertur), så på en parabol med η = { "0.60" } gir den en stråle som er { "1.238" }× for bred; blokken skriver ut begge de underforståtte virkningsgradene i stedet for å la dem utledes. Rent additivt: målt over det dokumenterte arbeidspunktet, { "597" } eksisterende blader, <b>{ "0" } endret, { "0" } fjernet, { "494" } lagt til</b>.

seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> og <c7/>, de offentlige delene bak den. Mønsteret er også nå forankret mot de publiserte Airy-konstantene og ikke bare mot seg selv: halveffektkrysningen lokaliseres ved bisection og sammenlignes med <c8/>, som gjør den eksakte halveffektbredden <c9/> og registrerer ærlig at den konvensjonelle koeffisienten <c10/> setter <c11/> til <b>−{ "2.955" } dB</b>, ikke −{ "3.010" } dB.

seg-bac7217bb128 = <b>En reproduserbarhetstabell i langt format for <c1/>.</b> Scenarioets tabellverdiutdata, gridet av midlingstider, de sju kurvene <c2/> per ledd og deres kvadratroten-av-kvadratsummen-total, nådde brukerne bare som JSON-tabeller. Én utgitt tabell var avkortet ved { "400" } tegn og publiserte { "23" } av sine { "57" } midlingstider under en kolonne som påstod å inneholde alle, og manuskriptet gjenoppbygde kurvene per ledd fra lukkede former fordi motoren aldri skrev dem ut. En vanlig kjøring skriver nå også <c3/> med én rad per (gridindeks, midlingstid, ledd), som ikke kan avkortes til noe som fortsatt ser helt ut. Gridindeksen er en eksakt join-nøkkel; <c4/> skrives med { "13" } gjeldende siffer og hver <c5/> med { "7" }, så byte-ene ikke forgrener seg mellom bygg av samme kilde. Rent additivt: rapport-JSON-en er byte-identisk.

seg-ab9209297ec2 = <b>Rapporten for <c1/> beskriver nå seg selv.</b> En <c2/>-blokk gjentar de oppløste linkinndataene (bærebølgelengde, sende- og mottaksapertur, avstand, pulsbredde, integrasjonstid, virkningsgrader og tap) med standardverdiene anvendt, så en artikkel oppgir konfigurasjonen den kjørte med i stedet for å sitere en standardverdi lest ut av kilden. En <c3/>-blokk gir enheten og proveniensklassen for hver størrelse en artikkel sannsynligvis siterer. Sporene til overleveringskovariansen er grunnen til at den finnes: de ble skrevet ut som en bar <c4/>, og et manuskript utledet kvadratmeter fra en intern konsistenskontroll. Utledningen var riktig, og akkurat derfor var det en defekt: ingenting ville ha fanget det hvis den hadde vært feil. Rent additivt: målt over fire konfigurasjoner, { "456" } eksisterende felt, <b>{ "0" } endret, { "0" } fjernet, { "196" } lagt til</b>.

seg-5c810155300c = En rad i verifikasjonsmatrisen for reproduserbarhetstabellen til tidsbudsjettet, ærlig <c1/> / <b>MODELLED</b>: totalen kontrolleres mot kvadratroten av kvadratsummen av leddene i den samme filen, som deler motorens egne leddefinisjoner og derfor ikke er en uavhengig referanse. Til sammen legger disse til tre rader. Den løpende totalen for denne uutgitte delen er <b>{ "168" } rader: { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

seg-ed290a85ab0e = <b>Commit-forfatterskap i hele historikken er nå én enkelt identitet, og to publiserte crates peker på en commit som ikke lenger finnes.</b> 2026-09-21 ble git-historikken skrevet om slik at hver menneskelig commit er skrevet og committet av <c1/>. Den hadde tidligere tre skrivemåter av én person: { "688" } commits som <c2/>, { "34" } som <c3/> og { "94" } som allerede var kanoniske. Den ene <c4/>-commit-en ble bevisst latt stå som sin egen forfatter: å merke en bots avhengighetsoppdatering om ville hevde forfatterskap til arbeid ingen her gjorde.

seg-ec4e75f94462 = <b>Ingen innhold endret seg.</b> Omskrivingen rørte bare forfatter- og committer-headere, og det kan kontrolleres i stedet for å påstås: treet til hver tag og hver gren er bit-identisk med det det var før. <c1/> løses fortsatt til treet <c2/>, akkurat som før.

seg-bc0f4fa0a009 = <b>Hva det kostet.</b> En commits navn er en hash over treet, foreldrene og forfatterheaderne, så å endre en forfader gir nytt navn til hver etterkommer. Utgivelses-commit-en for <c1/> var <c2/> og er nå <c3/>. To artefakter registrerte det gamle navnet ved publisering og kan ikke rettes, fordi en publisert registerversjon er uforanderlig av design:

seg-52e096332738 = <c1/> { "0.26.0" } på crates.io: <c2/> registrerer <c3/>

seg-8ec39d2f136c = <c1/> { "0.26.0" } på crates.io: den samme sha1-en, <c2/>

seg-9a21b7c7b41c = Ingenting annet er berørt. npm-pakken registrerer ingen <c1/>, og PyPI-distribusjonen registrerer ingen commit i det hele tatt; begge ble kontrollert i stedet for antatt.

seg-9c51c5fb0d80 = Det finnes ingen reparasjon som får <c1/> til å navngi den omskrevne commit-en: den strengen <em>er</em> den gamle aner-historikken, og den eneste måten den kan løses på er å holde historikken fra før omskrivingen publisert, noe som ville gjenopprettet forfatterskapet omskrivingen fjernet. Proveniensen for { "0.26.0" } går derfor gjennom taggen og ikke gjennom den registrerte sha1-en, og taggen leverer de identiske byte-ene crate-en ble bygd fra. Den neste utgivelsen registrerer en gyldig commit uten at det kreves noen handling.

seg-30ecea86118a = <b><c1/> brukte som standard en EOP-fil uten prediksjonsrader (G12).</b> Scenarioet bygde inn et utdrag av <c2/> med fem rader og <em>bare endelige verdier</em> som frakoblet standard, så en bar kjøring rapporterte <c3/> og tabellen per horisont hvilte på { "5" }, { "4" }, { "3" } og { "2" } par. Motoren kunne alltid lese en prediksjonsrad; inndataene hadde bare ingen. Standarden er nå det ordrette IERS-utdraget fra { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } endelige verdier fra Bulletin B og <b>{ "12" } rader fra Bulletin A med bare prediksjon</b>, så en bar kjøring uten filargument og uten nettverk rapporterer <c5/> og en tabell per horisont ved n = { "20" } / { "31" } / { "30" } / { "29" }, og sammenligningen med den operative prediktoren og samsvaret mot produktets egne publiserte prediksjoner fylles også ut. Det langvarige utdraget med 45 rader ble målt som alternativ og avvist: det har også bare endelige verdier, så det ville ha latt <c6/> stå på { "0" }. <b>Dette flytter publiserte tall</b>, etter regel R4 og med grunnleggerens tillatelse: ti av de { "22" } cellene i den utgitte <c7/> og { "24" } av de { "42" } utfylte cellene i <c8/>. Det målte gulvet for pol, rask minus endelig, blir { "0.0678" } mas (fra { "0.0769" } mas), som er verdien artikkel P4s egen polbevegelsestabell allerede publiserer ved n = { "20" }; de to stemmer nå overens i stedet for å avvike med { "13.5" } %. Hvert annet tall P4 skriver ut fra denne tabellen er uendret ved presisjonen som skrives ut. Hele oppstillingen gammel → ny, inkludert feltene som <em>ikke</em> flyttet seg, står i <a1><c9/></a1>. Utdraget med bare endelige verdier leveres fortsatt, er festet byte for byte og blir kjørt: et prediksjonsradantall på null for det er filens egenskap, og en test beviser det fortsatt.

seg-17fbc566dc5b = <b>En utdatert begrensning av antall satellitter i <c1/>.</b> Scenarioet begrenset <c2/> til { "12" } selv om konstellasjonsbyggeren støtter { "24" } og en test påstår { "24" }, så hvert forespurt antall over { "12" } ble stille redusert, og et sveip over satellittantall ga identiske verdier over { "12" }, umulig å skille fra ekte geometrisk metning. Nå begrenset ved byggerens grense. Dette er en oppførselsendring bare for <c3/>.

seg-4df7d4d61b40 = Den samme utdaterte begrensningen i <c1/>.

seg-8adfbd27c4f8 = <c1/> begrenset <c2/> til { "12" } med den samme konsekvensen, og denne nådde en publisert tabell: <c3/> har en rad <c4/> som er byte-identisk med raden <c5/>, fordi motoren returnerte et svar for tolv satellitter under en merkelapp for seksten satellitter. Nå begrenset ved byggergrensen på { "24" }, og en ny test fester det: hver større konstellasjon må både rapportere sitt eget antall og strengt forbedre beskyttelsesnivået, så begrensningen ikke kan komme tilbake ubemerket. <b>Dette flytter publiserte tall</b>: beskyttelsesnivået for <c6/> blir { "16.92" } m → { "14.57" } m. Sveipet til { "24" } er kurven strengt monoton ({ "11.94" } m ved { "24" } satellitter, { "29.5" } % bedre enn ved { "12" }), så det er ingen metning ved { "12" }; det tilsynelatende platået var begrensningen. Oppførselsendring bare for <c7/>.

seg-ebee158b73c8 = En utgivelse om dokumentasjon, åpenhet og playground. Ingen endringer i motoroppførsel: verifikasjonsmatrisen står på <b>{ "102" } rader: { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, uendret fra { "0.25.0" }.

seg-7af422ed6d89 = <b>Rustdoc på crate-nivå</b> (<c1/> i <c2/>) som dekker inngangspunkter, modellen for ærlighet og evidensnivåer og reproduserbarhet, så docs.rs åpner på en ekte landingsside i stedet for en bar modulvegg.

seg-dd44c25f3af5 = <b><c1/></b>, en referanse per type for alle <c2/> scenariotyper, generert fra <c3/> (den eneste sannhetskilden) av <c4/> og vokttet av <c5/>, så den ikke kan drive bort fra dispatcheren.

seg-e2cc77d3b413 = <b>Moduldokumentasjon</b> for de { "11" } tidligere udokumenterte offentlige modulene (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

seg-8d156713799d = <b>Litteraturkilder</b> for fem formelmoduler som oppga en ligning, men ikke navnga noen referanse: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

seg-832b4bfbc48a = <b>En publisert <c1/></b> på kshana.dev for koordinert avsløring.

seg-30603f59e27d = <b>Valideringsnivå per kjøring i playground.</b> Tabellen over kvalitetsmål for én enkelt kjøring har nå et merke per tall, VALIDATED/MODELLED, lest fra det samme oppslaget <c1/> som den nedlastbare rapporten bruker (speiler <c2/>, selv utledet fra verifikasjonsmatrisen), så nivået som vises ved siden av et levende tall aldri kan være uenig med registeret.

seg-93b203f3a1c0 = <b><c1/></b> i playground-menyen: alle { "50" } typer som kan dispatches, er nå ett klikk unna (var 49/50).

seg-1ec0830db404 = <b>Fem kjørbare funksjonskort til</b> (romvær, evaluering av RF-forstyrrelser, robusthet, CCSDS OEM-interoperabilitet, KIF), som løfter antallet kjørbare kort fra { "11" } til { "16" }. Kort som bare gjelder API og bibliotek beholder en ærlig dokumentasjonslenke i stedet for en falsk kjør-knapp.

seg-977ea074dd9d = Dokumentasjonsdekning er nå en skralle i CI.

seg-beb308bcaafb = <c1/> kompilerer biblioteket med <c2/>, teller advarslene og feiler bare hvis antallet stiger over et festet tak ({ "986" }). En hard <c3/> under <c4/> ville ha gjort ~{ "1000" } offentlige elementer som nå er udokumenterte, til et byggebrudd over natten; på denne måten feiler nye udokumenterte offentlige elementer bygget mens den eksisterende etterslepet nedbetales bevisst.

seg-27668072a608 = <b>MCP-verktøyraden <c1/> annonserte «~{ "17" } built-in scenario kinds»</b> mens <c2/> en stund hadde eksponert { "50" }; en agentrettet dokumentasjon som underkommuniserer reell funksjonalitet med en faktor tre. Festet til det sanne antallet.

seg-1ffc9f9816e8 = Regenererte den uavhengige referansen for overensstemmelse for CycloneDX SBOM for den oppdaterte avhengighetsgrafen ({ "60" } komponenter). Vurderingen av overensstemmelse er uendret: null normaliserte skjemafeil og hver atomære lisens-id er fortsatt i den offisielle SPDX-opptellingen.

seg-a6db590bbcbe = <b>Fem funksjoner er hevet til eksternt VALIDATED</b>, hver nå krysskontrollert mot en uavhengig tredjepartsimplementasjon av den samme entydig definerte størrelsen (ikke-sirkulært, med fixtures som kan regenereres offline):

seg-98588143b4bb = <b>IEEE-1139-konvertering fra potenslov til Allan-deviasjon</b> mot lukkede former fra <c1/> for alle fem støytyper (<c2/>);

seg-ce37d70fa8bc = <b>CRPA MVDR / minimumsnorm-vekter for nullstyrende stråleformer</b> mot numpy/scipy LAPACK (<c1/>);

seg-0f033d1027f8 = <b>Wahba / TRIAD / QUEST holdningsbestemmelse</b> mot SciPys SVD <c1/> på støyfrie observasjoner (<c2/>);

seg-e1e2283cb524 = <b>CCSDS { "502.0" } OEM-utveksling av kovariansblokk</b> rundturstestet gjennom parseren i det uavhengige biblioteket <c1/> (<c2/>);

seg-579eefbb646f = <b>deteksjonsstatistikkjernen for kvadratlov-akkvisisjon</b> (generalisert Marcum-Q / P_d / P_fa / terskel) mot SciPy <c1/>/<c2/> (<c3/>). Den maskinkontrollerte valideringsmatrisen går til <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> over <b>{ "102" } rader</b> (var { "51" } · { "47" } · { "4" }). Ærlige forbehold om omfang er bevart: for eksempel dekker hevingen av akkvisisjon bare deteksjonsstatistikkjernen; CFAR/straddling-tap forblir MODELLED.

seg-b6a140d55580 = <b>Kvalitetsmål i posisjonsdomenet</b> (<c1/>): eksakt CEP, SEP og 2DRMS fra den 3-D ENU-posisjonskovariansen til en navigasjonsløsning pluss et horisontalt beskyttelsesnivå. CEP/SEP er de <em>eksakte</em> medianene for radiell feil (ikke den lineære regelen <c2/>), krysskontrollert mot rayleigh/maxwell-kvantiler fra <c3/> og en uavhengig Monte Carlo-median i NumPy (<c4/>). Erstatter den forrige ærlige stubben som ikke var implementert; <b>funksjonssignaturen endret seg</b> fra <c5/> som returnerte en feil til <c6/> som returnerer en <c7/>.

seg-1551afa17154 = <b>Ekvivalente frihetsgrader (EDF) for konfidensintervall er fullført for alle estimatorer i Allan-familien</b> (<c1/>): EDF for modifisert Allan, Hadamard og total varians bruker nå den kombinerte EDF-algoritmen til Greenhall & Riley og TOTVAR-formen i NIST SP { "1065" } tabell 7 (tidligere var bare EDF for overlappende Allan implementert; de andre gjenbrukte den stille), krysskontrollert mot <c2/> <c3/>/<c4/> (<c5/>).

seg-39753e7919cc = <b>Uavhengige eksterne krysskontroller for lunar-PNT-geometri, DOP, EOP, DRO og RF-avstandsmålingsfunksjoner</b> (<c1/>, med fixtures og generatorer for den uavhengige referansen under <c2/>). Hver kontroll driver en allerede levert <b>modellert</b> funksjon mot en referanse produsert av en <em>annen</em> implementasjon, så samsvaret er ikke-sirkulært: orbitalt sende-/fangstfotavtrykk mot <c3/> (Cephes, en genuint annen Bessel J1); DOP for overflatebeaconer mot en uavhengig NumPy-løsning av <c4/>; veksten i prediksjonsfeil for UT1/EOP-persistens mot en separat NumPy-parsing på nytt av de samme ordrette IERS-radene i <c5/>; den plane familien av distant-retrograde-baner mot NASA/JPL Three-Body Periodic Orbit Database; og budsjettet for RF-avstandsmålingspresisjon mot en referanse fra første prinsipper. Dette er ekstra regresjonsevidens for eksisterende moduler; å legge til disse krysskontrolltestene omklassifiserer ikke i seg selv noen funksjon (de fem hevingene ovenfor er separate statusendringer støttet av uavhengig referanse i <c6/>).

seg-662c04f0552f = <b>Scenarioet <c1/></b> (<c2/>, <c3/>): en sammensatt P1-kjøring for lunar signalsikkerhet som kan nås fra binæren (CLI / Python / MCP / wasm via <c4/>), og som setter sammen effektunderskuddet i linkbudsjettet og dets følsomhetsbånd på { "12" }–{ "18" } dB, den nødvendige sendeeffekten for jamming/spoofing mot avstand, det orbitale fangstfotavtrykket under et ekte antennemønster, utfallet av pull-in for spoof-fangst i sporingsløkken, horisontrekkevidden for et legeme uten atmosfære og budsjettet for OSNMA/TESLA-autentisering. En tom body gjengir P1-grunnlinjen.

seg-a9b7ee942a23 = <b>Følsomhetsbånd for effektunderskudd</b> (<c1/>, <c2/>): et genuint sveip over flere akser (referanse × EIRP × skrå avstand) bygget på <c3/> og evaluert gjennom <c4/>, som gjengir P1-båndet på { "12" }–{ "18" } dB og forener de lineære faktorene { "32" }× (avrundet) / { "36" }× (uavrundet).

seg-0734a4ca7535 = <b>Tredimensjonal kube for spoof-fangst</b> (<c1/>): legger bærebølge-/Doppler-forskyvningsaksen til fangstkartet (J/S × kodeforskyvning × bærebølgeforskyvning, låsetid per celle); skiven med null bærebølge reduseres nøyaktig til den 2-D <c2/>.

seg-3b9bbc25b114 = <b>Deteksjon i et spredt overvåkingsnettverk</b> (<c1/>) setter nå sammen den fysiske AGC-statistikken <c2/> og det selenografiske synlighetsrutenettet <c3/> for å utlede hver stasjons deteksjonsstatistikk og geometri, i stedet for frie parametere og en ad hoc-overlapp langs storsirkel; deteksjonssannsynlighetene per monitor og for nettverket er fortsatt de lukkede formene for kjikvadrat/Marcum-Q i <c4/>. <b>Feltene <c5/> / <c6/> endret seg</b> til fysiske størrelser (bredde/lengde/høyde/effekt).

seg-54c36267382c = <b>Dimensjonering av OSNMA/TESLA-autentiseringsoverhead</b> (<c1/>): feltandelene per side for OSNMA (8-bit HKROOT + 32-bit MACK per side på { "2" } s) var feilmerket som totaler per subramme, noe som underkommuniserte overheaden med en faktor { "15" } ({ "1.33" } bit/s). Rettet til de publiserte totalene per subramme på 30 s i SIS-ICD (HKROOT { "120" } + MACK { "480" } bit ⇒ <b>{ "20" } bit/s</b>). Konsekvensen oppgis nå ærlig: ved en AFS-navigasjonsrate på { "50" } bit/s er autentiseringsoverheaden en kostnad av <b>første orden på ≈{ "40" } %</b>, ikke noen få uvesentlige prosent; feltet <c2/> er dokumentert som forsinkelsen for nøkkelavsløring (en nedre grense for tiden til første autentiserte posisjonsbestemmelse fra ende til ende).

seg-0cf179a34252 = En bred funksjonsutgivelse. Den leverer to fullt <b>eksternt validerte</b> analysesuiter, en komplett familie for <b>flerkriterie beslutningsanalyse (MCDA)</b> og estimatorene for <b>Allan-wander / langtids klokkestabilitet med lang τ</b>, og åpner et nytt lag av kjørbare scenarioer for <b>lunar tidsbudsjett, sanntids ramme/EOP, optisk/RF-hybrid, cislunar observerbarhet og lagdelt PNT-robusthet ved konflikt</b> oppå substratet, pluss et substrat for <b>lunar overflatebeacon</b> og <b>signalsikkerhet</b>. Den maskinkontrollerte valideringsmatrisen vokser til <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> over <b>{ "102" } rader</b> (var { "40" } · { "47" } · { "4" } over { "91" }): alle elleve nye rader er valideringer mot uavhengig ekstern referanse for beslutningsanalysen og tidsestimatorene, kontrollert mot uavhengige biblioteker (SciPy, pymcdm, pyDecision, allantools) til stram toleranse, mens den nye PNT-funksjonsflaten ærlig fremstilles som MODELLED. Som alltid oppgraderes ingen numerisk modellpåstand uten et eksternt datasett bak.

seg-267e50f8dd56 = <b>Kjørbare scenarioer</b>, hvert en registrert scenario-<c1/>, dispatchet gjennom motoren og bevist ende til ende i CI av <c2/> (som kjører hver medfølgende <c3/> og feiler hardt på enhver fixture som ikke kan kjøres):

seg-c87fc11dd86b = <b>Lagdelt PNT-robusthet ved konflikt</b> (<c1/>, <c2/>): en seedet Monte Carlo-motor for robusthet for en PNT-arkitektur med flere lag, med en <b>overlevelsesmodell per vektor for graceful degradation</b> i §{ "4.2" } (fire navngitte trusselvektorer, den lukkede overlevelsesformen for brukbar PNT som Monte Carlo per lag konvergerer mot, skrevet ut i resultat-JSON) og dokumentert, drift-vokttet proveniens for trusselparametrene (<c3/>). MODELLED arkitekturer; konvergensen fra overlevelses-Monte Carlo til lukket form er den validerte kjernen.

seg-9c69e4d8ade9 = <b>Cislunar observerbarhet</b> (<c1/>, <c2/>): et egenspektrum for observerbarhetsgramianen over en bue, en differensialkorrigert seeder for distant retrograde-baner (DRO) og en uavhengig krysskontroll med kvadratrotinformasjonsfilter hvis posteriorkovarians blir endelig nøyaktig ved full observerbar rang. MODELLED konstellasjon; invariantene for rang/gramian/STM/SRIF er den validerte kjernen.

seg-92fb333483e5 = <b>Heterogen optisk/RF-hybrid kontinuitet og integritet</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>): tilgjengelighet og integritet på tvers av domener når optisk og RF PNT kombineres. MODELLED.

seg-08e2f640ae14 = <b>Endogent lunar tidsbudsjett</b> (<c1/>, <c2/>) og <b>sanntidsbudsjett for ramme / EOP</b> (<c3/>, <c4/>, <c5/>): P3/P4-budsjettene for lunar tid og jordorientering utledet endogent fra tidssynkroniseringskjeden og ikke påstått. MODELLED.

seg-52c2f9c2c9a7 = <b>Eksternt validerte analysesuiter</b>, biblioteksfunksjoner som hver kommer inn i matrisen som nye VALIDATED rader (kontrollert mot en uavhengig ekstern referanse, ikke en selvkontroll):

seg-709789e8fb04 = <b>Full suite for flerkriterie beslutningsanalyse (MCDA)</b> (<c1/>): de fire metodefamiliene verdiaggregering (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), ratiosystem (<b>MOORA</b>) og proporsjonal (<b>COPRAS</b>), avstand til ideal (<b>TOPSIS</b>), kompromissprogrammering (<b>VIKOR</b>) og outranking (<b>PROMETHEE II</b> med seks generaliserte kriterieformer, <b>ELECTRE I</b> konkordans/diskordans), pluss <b>AHP</b> prioritetsvekter fra Perron-egenvektor med Saatys konsistensratio-gate (CR < { "0.10" }), <b>MAUT</b>-nytte, uttrekking av Pareto-front og <b>sensitivitetsanalyse</b> av vekter. De ni aggregatorene gjengir <b>pymcdm</b> / <b>pyDecision</b>, og AHP-egenvektoren stemmer med SciPy/LAPACK, alt til < { "1e-9" } (<c2/>). Sensitivitets-tornadoen vises også inne i scenarioet for robusthet ved konflikt.

seg-2ce49cbfd8bf = <b>Allan-wander og estimatorer for klokkestabilitet med lang τ</b> (<c1/>): <b>MTIE</b> (wander-statistikken for tidsfeil fra topp til topp som synkroniseringsmaskene i ITU-T G.810/G.823/G.8261 er skrevet mot), tidsdomene-wander for <b>MDEV</b> og <b>TDEV</b>, og estimatorer med utvidet område, <b>Theo1 / TOTVAR</b>. VALIDATED mot <b>allantools</b> på NIST SP { "1065" }-seriene; den bias-fjernede hybriden <b>ThéoH</b> bygget på TOTVAR forblir ærlig MODELLED.

seg-68bcdf8bd5de = <b>Rammeverk for sikring / ekstern uavhengig referanse</b> (<c1/>): et rammeverk for uavhengig referanse koblet direkte til ærlighetsgaten i CI, en <b>W3C-PROV</b>-proveniensregistrering med en deterministisk Merkle-rot, og <b>Greenhall</b> ekvivalente frihetsgrader + kjikvadrat-konfidensintervaller på stabilitetsestimater.

seg-dcb91813b24c = <b>PackRegistry / ExternalPack, utvidelsessømmen</b> (<c1/>, <c2/>): en dispatch-søm slik at funksjonspakker rutes gjennom ett register (innebygd dispatch ligger på den varme stien i CLI-en; pakker utenfor treet kobles på bak en <c3/> med standardverdi), vokttet av en golden-suite for byte-identitet og testing av overensstemmelse og av frittstående / wasm32-gater i CI.

seg-16b1f5d249ed = <b>Modellert funksjonssubstrat</b>, nye bibliotekmoduler som mater scenarioene ovenfor og fremtidige (ennå ikke en frittstående scenario-<c1/>):

seg-f8c9ffbc56cf = <b>DOP for lunar overflatebeacon</b> (<c1/>) med budsjett for realisert nøyaktighet, sveip over N satellitter og GDOP-kart, pluss en perturbert lunar efemeride (<c2/>) og geometri for horisont uten atmosfære / invers av spoof-effekt / AFS-underskuddsbånd (<c3/>, <c4/>). Gjenbruker DOP-kjernen validert mot gnss_lib_py.

seg-28209a2747d5 = <b>Innlesing av DEM i LOLA-format</b> + siktlinje over terreng (<c1/>).

seg-6e98ac90a0e2 = <b>Tredelt forsvar for signalsikkerhet</b>: spoof-fangst, kryssensor-integritet og dimensjonering av overvåkingsnettverk (<c1/>, <c2/>, <c3/>) med et orbitalt antennefotavtrykk og et autentiseringsbudsjett for OSNMA (<c4/>, <c5/>). MODELLED.

seg-bd5b9511accb = Valideringsmatrisen og hvert avledet artefakt ble regenerert fra den eneste sannhetskilden (<c1/>): registeret på nettstedet, diagrammene for modulkart og valideringsproveniens, og README- og tellestrengene per flate lyder nå <b>{ "51" } / { "47" } / { "4" } av { "102" }</b> (var { "40" } / { "47" } / { "4" } av { "91" }); ærlighetsvakten for tellinger skanner nå hele git-historikken, og README-figurene er samlet på den mørke merkepaletten.

seg-c2ec7e2b6296 = Én delt adaptiv integrasjonsdriver ligger nå bak både <c1/> og <c2/> (<c3/>), og den duplikate stepperen er fjernet.

seg-85cfb0f10268 = Statisk analyse med <b>SonarQube Cloud</b> lagt til i CI (Rust + importert dekning), med merker for vurdering av sikkerhet / vedlikeholdbarhet / pålitelighet i README.

seg-deeef8318367 = Disiplin for utgivelse / pakking: CI registrerer et deployment-miljø per pakke-/registerpublisering, og den fokuserte jobben for offentlig frittstående bygg er avgrenset bort fra de trege valideringsbinærene.

seg-30181148b098 = Vakten for hygiene mot attribusjon er avgrenset til forfattermarkører alene, så å navngi en integrasjonsvert eller et produkt ikke lenger får bygget til å feile.

seg-6eb3868fdce0 = Dokumentasjon: README-delen <b>Citing</b> lister nå de fire publiserte arXiv-preprintene, og DOP-funksjonen for overflatebeacon er dokumentert i lunar-raden.

seg-d12533cbf1f2 = Heltallsløkketellere for flyttalsdrevne løkker (Sonar S2193).

seg-3c213354187f = Nøyaktig invers kjikvadrat ved lave frihetsgrader via Newton-forbedring i stien for konfidensintervaller i sikringen.

seg-386b7094d34d = kshana.dev: standardseksjonen åpnes nå som standard og reserveverdien for registertallet er rettet; utdaterte README- og nettstedstrenger rundt observerbarhetslaget er synkronisert.

seg-33448f46894f = En funksjonsutgivelse som legger til et generelt lag for <b>Fisher-informasjon / Cramér–Rao-observerbarhet og optimal eksperimentdesign</b>, og utgivelsen artikkelen om observerbarhet for lunar PNT hviler på. Den maskinkontrollerte valideringsmatrisen vokser til <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> over <b>{ "91" } rader</b> (var { "39" } · { "46" } · { "4" } over { "89" }): den nye estimeringsmotoren er kontrollert mot en ekstern uavhengig referanse og er VALIDATED; den lunare anvendelsen av den er ærlig MODELLED. Som alltid oppgraderes ingen numerisk modellpåstand uten et eksternt datasett bak.

seg-c377207026f4 = <b><c1/>: Fisher-informasjon, Cramér–Rao-grenser og optimal eksperimentutforming.</b> En generell, gjenbrukbar motor for estimeringsteori: Fisher-informasjonsmatrisen <c2/> fra en måle-Jacobian og vekter; en symmetrisk egenverdiløser (syklisk Jacobi); den nedre Cramér–Rao-grensen via inversen, eller Moore–Penrose-pseudoinversen pluss en nullromsbasis når informasjonen er rangdefekt (tilfellet med fritt nettverk / datumdefekt); og D-, A-, E- og T-optimale metrikker for eksperimentutforming med en <c3/>-velger over kandidatgeometrier. <b>VALIDATED</b> mot NumPy (<c4/>/<c5/>) og de publiserte lukkede grensene til Kay ({ "1993" }) til { "1e-9" } (<c6/>), så den kommer inn i matrisen som en rad med ekstern uavhengig referanse og ikke som en selvkontroll.

seg-91d09b4e737f = <b>Lunar observerbarhet for felles banebestemmelse</b> (<c1/> i <c2/>, vist i rapporten for lunar kombinasjon): anvender FIM/CRLB-motoren på den felles løsningen for bane og klokke for å vise datumdefekten for absolutt stasjon, gjenopprettingen av rang når stasjoner på jordbaselinjen legges til, den oppnådde CRLB for stasjonsposisjon og E-optimal kondisjonering. Ærlig <b>MODELLED</b>: estimeringsmotoren er eksternt validert, men det lunare nettverket den anvendes på er en representativ simulering, og ingen eksisterende datasett kan gjøre den geometrien til en måling.

seg-6b1cd00aca8c = <b>Representativ geometri for elliptisk lunar frossen bane (ELFO)</b> for scenarioet for lunar kombinasjon (<c1/>, <c2/>, <c3/>, <c4/>; sirkulær plassering forblir standard) og et observerbarhetsfelt uten VLBI i rapporten, slik at resultatet om datumdefekt kan vises å være geometrigenerelt. Den samme stigen { "3" }→{ "1" }→{ "0" } og terskelen på tre stasjoner holder på en ELFO i familien Moonlight/LCNS, og med tre jordbaserte VLBI-baselinjer er den absolutte stasjonsposisjonen observerbar ved en grense under en meter, låst av <c5/>. Fortsatt MODELLED.

seg-9e6627c0c417 = Valideringsmatrisen og hvert genererte evidensartefakt ble regenerert fra den eneste sannhetskilden (<c1/>): registeret (<c2/>), <c3/>, <c4/>, figurene for valideringsfordeling og type uavhengig referanse, og README-tellestrengene på alle distribusjonsflater lyder nå <b>{ "40" } / { "47" } / { "4" } av { "91" }</b>.

seg-6f90233290a2 = En utgivelse som bare gjelder pakking. Ingen endringer i motor, scenario eller resultater; valideringsmatrisen er uendret på { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER over { "89" } rader.

seg-9d41e1412d1f = npm publish: pakken <c1/> utledet fra crate-manifestet brukte GitHub-eieren med feil store/små bokstaver (<c2/>), noe som feilet verifiseringen av npms sigstore-proveniens (den matcher eieren skille mellom store og små bokstaver). Manifestet <c3/> er nå det kanoniske med små bokstaver, <c4/>, så den genererte <c5/> stemmer med proveniensemnet og npm-utgivelsen publiseres.

seg-fe1f8aae99f4 = Wheel-bygget fester <c1/> slik at manylinux-wheelen er byte-reproduserbar på tvers av gjenbygg (kontrollen av reproduserbarhet ved gjenbygg og diff).

seg-b87075b47007 = En konsolideringsutgivelse med fokus på <b>evidens, proveniens og distribusjonsdisiplin</b>. Den maskinkontrollerte valideringsmatrisen vokser til <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> over sine <b>{ "89" } rader</b> (var { "15" } · { "42" } · { "4" } over { "61" }), drevet av krysskontroll av modellerte funksjoner mot uavhengige eksterne referanser. Hvert distribuerte artefakt har nå en kryptografisk SLSA-attestasjon av build-proveniens, leveres med en CycloneDX SBOM og publiseres i lås på alle flater. Ingen numerisk modellpåstand oppgraderes uten et eksternt datasett bak; ny funksjonalitet forblir ærlig MODELLED.

seg-f6de783bfd29 = <b>Holdningsdynamikk</b> (<c1/>, MODELLED): dreiemomentfrie Euler-ligninger for stive legemer + kvaternionkinematikk (RK4), med selvtester av bevaringslover (kvaternionnorm, kinetisk energi, |Iω|, presesjon for symmetrisk topp).

seg-339bc18b9fc4 = <b>Krysskontroll av modellerte funksjoner</b> mot uavhengige eksterne referanser, som tar valideringsmatrisen til { "39" } VALIDATED rader, hver støttet av et eksternt datasett (ærlighetsgaten i CI forbyr statusen VALIDATED uten et). De nyeste valideringene mot uavhengig ekstern referanse: <b>målt stabilitetskurve for optisk klokke</b> (ADEV-kurvetilpasningen i <c1/> gjengir den publiserte σ_y(τ) for ⁸⁸Sr-optisk gitterklokke fra Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, medfølgende under <c2/>); <b>generering av GPS L1 C/A-spredningskode</b> (G1/G2-LFSR-en i <c3/> gjengir kodefaseoktalene i IS-GPS-200 tabell 3-Ia for PRN { "1" }–{ "9" }); og <b>SRTM-leseren for digital høydemodell på ekte terreng</b> (<c4/> leser en medfølgende SRTM v3-flis fra NASA/USGS i det offentlige domene, N36W117 / Death Valley, og plasserer Badwater Basin innenfor sitt dokumenterte målebånd).

seg-665d0dde637b = <b>Nye MODELLED funksjoner</b>, hver internt krysskontrollert mot en lukket form eller en søsterkodesti: relativ bevegelsesdynamikk etter Clohessy–Wiltshire / Hill, passiv geolokalisering av sendere med TDOA/FDOA, holdningsbestemmelse etter Wahba/TRIAD/QUEST, oppløsning av heltallsflertydighet i GNSS bærebølgefase (LAMBDA), B-plane-målstyring og gravitasjonsassistanse med patched conic, antijam-stråleforming med CRPA-array, akkvisisjonsstatistikk for GNSS med kvadratlov, flertydighet i kvante-treghetssensorens fringes / dynamisk område, IEEE-1139 potenslov for klokkestøy + flicker-FM-gulv, og CCSDS-OEM-utveksling av kovariansblokk.

seg-b3f53d5e3c3a = <b>Evidensregister fra én enkelt kilde</b> med genererte verifikasjonsdokumenter og en drift-vakt; et bla-bart valideringsregister på kshana.dev med dypelenker til evidens per kort.

seg-b3c0545157b3 = <b>Maskinlesbare siteringsmetadata</b>: <c1/> (CodeMeta { "2.0" }) og <c2/>, festet til Cargo-manifestet av <c3/>.

seg-2ca8875da9de = <b>Proveniens for forsyningskjeden</b>: SLSA-attestasjon av build-proveniens for crate-tarballen, wheels, sdist og npm-tarballen; PyPI OIDC Trusted Publishing; CycloneDX SBOM levert inne i wheelen og npm-pakken; reproduserbar build-diff og verifikasjon etter utgivelse.

seg-18fdecf7f2fa = <b>Auffinnbarhet</b>: <c1/>, <c2/> og metadata for Open Graph / JSON-LD på kshana.dev; en generert figur <c3/> utledet fra matrisen.

seg-f80db0b0f545 = <b>README-filer per flate</b> for crates.io / PyPI / npm med en ærlighetsvakt for tellinger.

seg-bd33b21f8f91 = <b>Sagnac-tidsoverføring</b>, uavhengig referanse oppgradert til ExternalDataset: Sagnac-korreksjonen for en omsegling langs ekvator kontrolleres nå mot Ashbys publiserte { "207.4" } ns (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, ligning { "1.29" }; gjengitt til < { "0.05" } ns). Den sammensatte funksjonen for tidsoverføring forblir ærlig MODELLED.

seg-882133bf1fcc = <b>Dokumentasjon, diagrammer og figurer oppdatert</b> til den levende matrisen (39/46/4/89): valideringsproveniensdiagrammet, figuren <c1/> (nå generert fra matrisen med en drift-vakt i CI), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, arkitektur- og veiledningsdokumentene og totalen i registeret på kshana.dev.

seg-a9be3d71a52c = Omformaterte kildetreet med den festede rustfmt (verktøykjede { "1.93.0" }): ren stil, ingen endring i oppførsel.

seg-4542eb4fabfc = <b>Versjonering i lås.</b> Hver distribusjonsflate (crate, PyPI, npm, MCP-crate + OCI-image, JetBrains-plugin) versjoneres nå i lås med motoren, håndhevet av <c1/> i CI.

seg-792df0cdc8a7 = <b>JetBrains-pluginen</b> er relisensiert til <b>AGPL-3.0-only</b> (den publiserte { "0.1.1" } oppga fortsatt Apache-2.0) og utleder nå Marketplace-versjonen fra utgivelsestaggen.

seg-171f5649c90f = <b>Herding av robusthet</b>: <c1/> i kode som ikke er test er fjernet eller begrunnet; <c2/> er gatet på kode som ikke er test.

seg-0e5abb2fad02 = <b>kshana.dev</b> fullstendig omarbeidet med bevis først: dominerende hero, arkitekturdiagrammer og resultatfigurer, i18n, sammenleggbare og responsive seksjoner for register og standarder.

seg-05ef9b9f3653 = <b>SP3 presis efemeride</b>: bruk IGS-korreksjonen for jordrotasjon ved noden under interpolasjon.

seg-bbd0dc3dd9cb = <b>Registerbilder</b>: README-filene for PyPI/crates.io/npm bruker absolutte bilde-URL-er; de relative bildestiene i hoved-README ble vist som ødelagte bilder på PyPI-siden for { "0.21.0" }. En CI-vakt (<c1/>) hindrer regresjonen.

seg-6d044971dbc8 = <b>CI</b>: <c1/> + <c2/> grønne; slutt å kompilere mot git-ignorerte ekte data.

seg-c3c260b7063e = Tester

seg-5dca3defcfe3 = Kalman-klokkekovariansen forblir PSD og symmetrisk (egenskapstest, <c1/>).

seg-c861779f04ca = Doc-sync-vakter: hver offentlige tellestreng for validering, siteringsmetadata, den genererte figuren og bilde-URL-ene i README for flatene er festet til sin sannhetskilde.

seg-0540044c92a6 = Denne utgivelsen legger til to MODELLED applikasjonssuiter i den åpne motoren: en <b>demonstrator for kvanteaktivert PNT</b> (pålitelig kvantetidsoverføring, GNSS-fri kvantenavigasjon, kvantefeil-/anomalideteksjon) og en <b>suite for lunar / cislunar PNT</b> (lunar koordinattid, lunar VLBI, felles banebestemmelse + klokke, realisering av referansesystem, tjenestevolum, differensiell PNT, interoperabilitetseksport), hver kjørbar fra én <c1/>, hver med en ærlig <c2/>-registrering pluss et register over representativitet / hull mot flyvning. Den leverer også <b>seks nye valideringer mot uavhengig ekstern referanse</b>, som tar den maskinkontrollerte valideringsmatrisen til <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> over sine { "61" } rader. De nye applikasjonstallene er MODELLED fra illustrative parametere fra offentlige kilder, uten TRL, flygehistorikk, sertifisering eller støtte fra noe byrå, og de validerte kjernene de gjenbruker, er merket som sådan.

seg-82a1822f53e2 = <b>Demonstratorsuite for kvanteaktivert PNT</b> (<c1/>, <c2/>, <c3/>). Tre kjørbare MODELLED applikasjonsområder bak motoren, hvert med <c4/> pluss en registrering av representativitet / hull mot flyvning:

seg-07532f03a1f1 = <b>Pålitelig kvantetidsoverføring</b> (<c1/>): et tovegsbudsjett for optisk gitterklokke + fotonisk link mot CSAC + RF, som gjenbruker beskyttelsesnivået for tidssynkronisering, med et sikkerhetskvalitetsmål mot forsinkelses-/replay-angrep ({ "1" } − P_md) og klokkeanomalideteksjon + CUSUM-latens.

seg-4c9036cffe1b = <b>GNSS-fri kvantenavigasjon</b> (<c1/>): en treghetsdrift med kaldatom-interferometer mot et INS av navigasjonsklasse over et GNSS-utfall, ærlig på at uten ekstern posisjonsbestemmelse forblir akselerometerbiasen ikke observerbar, så feilen fortsatt vokser.

seg-6188f1c6893a = <b>Kvantefeil- / anomalideteksjon</b> (<c1/>): en merket feilkatalog med ROC AUC med bootstrap-konfidensintervall og en minste detekterbare feil ved en fast falsk alarmrate.

seg-9e22314b1337 = Et delt bibliotek for feilmodeller for kvanteenheter (<c1/>) og et samlet rammeverk for avveining mellom kvante og klassisk (<c2/>) ligger under alle tre.

seg-808e20f28556 = <b>Suite for lunar / cislunar PNT.</b> Sju kjørbare MODELLED enheter av typen <c1/>, lagt oppå CR3BP-kjernen: <b>lunar koordinattid</b> (sekulær rate LTC/TCL − TT, <c2/>), observerbar for geodetisk <b>lunar VLBI</b>-forsinkelse (<c3/>), estimator for <b>felles banebestemmelse + klokke med flere teknikker</b> i batch (<c4/>), <b>realisering av referansesystem</b> (7-parameter Helmert + IAU { "2015" } WGCCRE-tie, <c5/>), analyse av <b>tjenestevolum i klassen Moonlight / LCNS</b> (<c6/>), <b>lunar differensiell PNT</b> (<c7/>) og en <b>eksport for interoperabilitet i tråd med LunaNet / IOAG</b> (CCSDS-OEM + lunar tidsskala i KIF-konvolutten, <c8/>). Alt MODELLED fra illustrative parametere fra offentlige kilder; ikke validert mot ekte VLBI / Gateway-sporing; ingen tilknytning til eller støtte fra noe byrå.

seg-a892ce052e3c = <b>Seks nye valideringer mot uavhengig ekstern referanse</b> (valideringsmatrisen står nå på { "15" } validerte):

seg-c30ae6767c6c = <b>ADEV / HDEV på en ekte 5071A-cesiumklokke</b>, validert mot desimalpunktreferanser fra Stable32 (<c1/>).

seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV på Stable32-referansen <c1/></b>, validert mot Stable32s publiserte tabeller (<c2/>).

seg-e8728f57effa = <b>ROC AUC for anomalideteksjon på ekte ESA OPS-SAT-telemetri</b>, validert mot scikit-learn (<c1/>).

seg-5446957ac631 = <b>Syntese av ICGEM-gravitasjonsfunksjonaler</b>, validert mot GRS80-standarden for normaltyngde (Somigliana γ til { "3.5e-12" }; EGM2008-forstyrrelseskart, <c1/>).

seg-751c5ac90229 = <b>Klobuchar-modellen for kringkastet ionosfære</b>, validert mot RTKLIB (<c1/>).

seg-dcc6d4e04a5c = <b>RAIM-deteksjonskjerne</b> ({ "171" } tilfeller, <c1/>) og <b>SBAS DO-229E-beskyttelsesnivå</b> på ekte EGNOS-data (RTKLIB SBAS-PL-fork, <c2/>), begge validert mot sine eksterne uavhengige referanser.

seg-3f6c1ff0b3a4 = <b>Register over representativitet og hull mot flyvning</b> (<c1/>). En strukturert registrering hver demonstrator skriver ut: hva som er representativt, hva som er forenklet og hva som står mellom modellen og flyvning, den ærlige følgesvennen til hver MODELLED avveining.

seg-6b4c78bdaf35 = <b>Studieaggregering og CLI-ergonomi.</b> Et manifest for scenariosuiter med studieaggregering i én kommando, hash-stabile studiemetadata + <c1/>, lint-kontroll av scenarioer med <c2/> og visning av valideringsnivå per kvalitetsmål i studierapporter.

seg-e24230b80a89 = <b>kshana.dev er omdesignet rundt en delt domenerygg</b>: funksjoner og validering er slått sammen til én domeneutforsker med et felles vokabular, de nye validerte øyene er løftet frem, en landnøyaktig animert jordinstrument og en CTA for å be om en studie, og Ashforde OÜ-merkevare og -lenker.

seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE gjennomgått for fullstendighet og ærlighet</b>: utdaterte antall validerte er rettet (nå { "15" } eksterne uavhengige referanser), diagrammene er utvidet, og preprintene om Conditional Timing Protection Level (arXiv:{ "2606.24210" }) og optimismegapet for RF-forstyrrelser (arXiv:{ "2606.22054" }) er sitert.

seg-42a317c6ce06 = Kildene i <c1/> og JOSS-utkastpipelinen holdes i det offentlige repoet.

seg-8ed5cf845b00 = Denne utgivelsen legger til fire studiefunksjoner i den åpne motoren: et betinget beskyttelsesnivå for tidssynkronisering, rammeverkstilpasset skåring av PNT-robusthet, en evaluering av optimismegapet for RF-forstyrrelser og en front end for programvaredefinert mottaker / ekte data, hver reproduserbar fra én kommando og skriver et byte-deterministisk artefakt. Alle studier er MODELLED (syntetisk eller kalibrering mot offentlige datasett), bærer sin ærlige proveniens (motorversjon, seeds, konfigurasjonshash) og valideringsmerker, og er ikke sertifiseringer.

seg-0c9f0c665491 = <b>Betinget beskyttelsesnivå for tidssynkronisering (<c1/>).</b> En holdover-begrenset grense for den uoppdagede tidsfeilen under GNSS-spoofing, med et monitorgulv på k sigma, en van Loan-variansdrift over deteksjonslatensen og en CUSUM-tid til alarm. Kalibrert på et ekte registrert angrep (JammerTest { "2024" }, scenario { "2.1.1" }) via <c2/>, som gjengir referansetabellen fra skalarer hentet fra den offentlige opptaket (det rå datasettet redistribueres ikke).

seg-d874d7f13f28 = <b>Rammeverkstilpasset skåring av PNT-robusthet + studie av beslutningsustabilitet (<c1/>).</b> Arkitekturmodell, RPCF-tilpasset skåring, Dirichlet-vektingssimpleks, Kendall-tau og ustabilitet i top-1-flipprate, og kollaps av fellesmodus-diversitet (Hill-N2), med <c2/>. Krysstabell i <a1><c3/></a1>.

seg-343f7af54503 = <b>Studie av optimismegapet for RF-forstyrrelser (<c1/>, <c2/>, <c3/>).</b> Et panel på 13 detektorer over et parameterforankret syntetisk korpus, et optimismegap mellom innenfor og utenfor fordelingen, trender i skaleringslover med en permutasjonsnull og en leave-one-out-prediktor for degradering, via <c4/>.

seg-6eed55859bbf = <b>Front end for programvaredefinert mottaker (<c1/>) og adaptere for ekte data (<c2/>).</b> Rå IQ/IF til korrelatortapper og SQM, pluss innleseradaptere (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) og probe-eksempler. Disse leser opptak brukeren leverer lokalt; ingen opptak er committet.

seg-afe2282fa771 = <b>Committede studieartefakter.</b> De byte-deterministiske <c1/> og <c2/> spores nå under <c3/> slik at studietallene kan kontrolleres uten å bygge på nytt; de kan fortsatt regenereres fra generatorene ovenfor. Rå datasett holdes utenfor repoet (<c4/>).

seg-450d82cddc28 = Versjonen er økt til { "0.20.0" } i <c1/>, <c2/> og <c3/>; artefaktene for krysningsstudiene er regenerert slik at stempelet stemmer med den utgitte versjonen.

seg-a0a66af8fd14 = <b>Relisensiert fra Apache-2.0 til GNU AGPL-3.0-only, med en kommersiell lisens tilgjengelig fra Ashforde OÜ (dobbel lisensiering).</b> Den åpne motoren forblir fullt åpen og offentlig verifiserbar; AGPLs nettverks-copyleft (§{ "13" }) betyr at en lukket eller driftet avledet versjon må komme tilbake til åpen kildekode, eller ta en kommersiell lisens. Dette forsvarer den validerte kjernen mot fork-and-close og bevarer troverdigheten til en offentlig, kjørbar og reviderbar motor. Se <a1><c1/></a1> (AGPL) og den nye <a2><c2/></a2> (hva hver lisens dekker og når den gjelder).

seg-ffa799fdb814 = <c1/> inneholder nå AGPL-3.0-teksten; SPDX-headere i alle kilder er oppdatert til <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, nettstedet og crate-/pakkemetadata (<c7/>, <c8/>, <c9/>, MCP-crate-en + imaget) er oppdatert tilsvarende.

seg-8d67aba2af0b = <b>Bidragsvilkår</b> (<a1><c1/></a1>) lisensierer nå innkommende bidrag under AGPL <b>og</b> gir Ashforde OÜ retten til å ta med bidrag i den kommersielt lisensierte utgaven, slik at dobbeltlisensieringen fortsetter å virke.

seg-93644d1c1420 = <b>Avhengighetspolicyen er uendret, men begrunnet på nytt</b> (<a1><c1/></a1>, <c2/>): avhengigheter forblir permissive (Apache/MIT/BSD/ISC). AGPL er bare tillatt for kshanas egen crate; en <em>avhengighet</em> med copyleft ville smitte den kommersielle utgaven og bryte dobbeltlisensieringen.

seg-9b77c2d36241 = <b>Merknad for etterfølgende ledd:</b> dette er en relisensiering til copyleft. Brukere som stolte på de permissive Apache-2.0-vilkårene, kan fortsette å bruke den siste Apache-2.0-utgivelsen (<c1/> og tidligere, som publisert); fra <c2/> og utover er det AGPL-3.0 / kommersiell.

seg-51e32f15b7ea = <b>Hevet <c1/> { "0.24" } → { "0.29" }</b> for å fjerne RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) fra eksterne OSV-/avhengighetsskanninger. Begge er advisories på <em>funksjonsnivå</em> hvis berørte funksjoner (<c2/>/<c3/>, <c4/>) Kshana aldri kaller, og <c5/> er en valgfri avhengighet (funksjonen <c6/>), så den reelle eksponeringen var null, men hevingen gir en ren skanning for revisorer lenger ned. Migrerte <c7/> til pyo3 { "0.29" }-API-et (Bound-returtype for <c8/>; eksplisitt <c9/> på pyclass <c10/>). Alle { "11" } Python-bindingstester består mot den gjenbygde utvidelsen.

seg-8d9332df5c74 = <b>Elleve nye kjørbare scenariotyper: demonstratorer for to anbud, en CCSDS-interoperabilitetsbro og en førsteordens suite for oppdragsanalyse / miljø (alle MODELLED, additive; eksisterende golden-verdier for reproduserbarhet er uendret).</b> Hver kan dispatches fra CLI / Python / WASM / MCP, leveres med en <c1/> og bærer en eksplisitt MODELLED-merking i resultat-JSON og enlinjessammendraget (en test per type i <c2/> påstår at merkingen er til stede og at utdataene aldri inneholder strengen <c3/>):

seg-20b74caf58cc = <c1/> (<c2/>): testbed for evaluering av maskinlæringsdeteksjon av RF-forstyrrelser: et merket <b>syntetisk</b> korpus + et detektoragnostisk <b>ROC/AUC</b>-rammeverk + en rapport om <b>optimismegap</b> innenfor / utenfor fordelingen (bare operasjonskarakteristikker, aldri felt-/IQ-data).

seg-0253656a0ecf = <c1/> (<c2/>): avveining mellom kvante og klassisk PNT med innlesing av målt ADEV og et robusthetskonvolutt for GNSS-nektede forhold.

seg-901bd713bd62 = <c1/> (<c2/>): sol-/geomagnetiske indekser (Kp↔ap IAGA-tabell, daglig Ap, sentrert 81-dagers F10.7a), eksosfærisk temperatur etter <b>Jacchia-71</b> og en aktivitetsdrevet kobling til termosfærisk tetthet over en statisk atmosfære (IKKE en absolutt tetthetsmodell som NRLMSISE).

seg-2323b43c0ffc = <c1/> (<c2/>): import av <b>CCSDS { "502.0" } OEM</b> + rundturbro for efemerider fra GMAT / Orekit / STK (leseren <c3/>, eksakt invers av skriveren).

seg-188aeb3e8219 = <c1/> (<c2/>): <b>utskytningsazimut</b> for to legemer (<c3/>), Δv for planendring, bonus fra stedets rotasjon og geometri for daglige muligheter.

seg-6200a47276e6 = <c1/> (<c2/>): ballistisk gjeninntrengingskorridor etter <b>Allen-Eggers</b>: maksimal retardasjon, hastigheter ved maksimal g og maksimal oppvarming, høyde ved maksimal g.

seg-0874c2241748 = <c1/> (<c2/>): EO-geometri for <b>swath / GSD / tilgang / revisit</b> (SMAD space-triangle).

seg-83c7588ff074 = <c1/> (<c2/>): koding/dekoding av primærheader for <b>CCSDS 133.0-B Space Packet</b> med bit-eksakt rundtur.

seg-ae1bcad02880 = <c1/> (<c2/>): 3-DOF <b>gravitasjonsgradient-dreiemoment</b> + <b>RSS-budsjett for pekefeil</b> (skalart budsjett før maskinvare, ikke en kontrollsløyfe).

seg-65f59cc12e02 = <c1/> (<c2/>): <b>prediksjon av passeringer for bakkestasjon</b> (AOS/TCA/LOS, maksimal elevasjon, tilgang).

seg-178776497627 = <c1/> (<c2/>): enveis linkligning etter <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / margin / lukking).

seg-e7fee32a00f5 = <b>Hybrid tett koblet UKF med 17 tilstander, kvante + klassisk, vist som et kjørbart scenario (MODELLED).</b> En ny scenariotype <c1/> (<c2/>, <c3/>) som gjør det tidligere bare API-tilgjengelige tett koblede GNSS/INS-filteret med unscented-transformasjon og 17 tilstander (<c4/>) til et scenario CLI-, Python-, WASM- og MCP-bindingene kan dispatche. Feilvektoren med 17 tilstander er de <b>{ "15" } INS-feiltilstandene</b> (posisjon, hastighet, holdningsfeiljustering, akselerometer- + gyrobias) utvidet med den <b>CAI-utledede korreksjonen av akselerometerbias</b> (kaldatom-interferometeret (<c5/>) setter gulvet for hastighets-random-walk <c6/>, så langtidsdriften er den som er begrenset av kvantesensoren) og en <b>klokke med 2 tilstander, fase + frekvens</b>, hvis prosessstøy kommer fra <b>q-parametermotoren for klokker</b> (<c7/>, som avbilder en klokkes profil for Allan-deviasjon til PSD-ene <c8/>/<c9/>, skalert til avstandsenheter). Plattformen er GNSS-støttet i en innledning (filteret lærer biasene, hastigheten og klokken), og driver deretter gjennom et GNSS-utfall på CAI-IMU og klokke alene, så kjøringen demonstrerer hybridiseringen <b>klassisk IMU på kort sikt + kvante på lang sikt</b>. Kvalitetsmålet er <b>filterets selvkonsistens</b>: samlet <b>NEES</b> (Normalised Estimation Error Squared, over den estimerbare delmengden posisjon/hastighet/klokke) og <b>NIS for innovasjonshvithet</b> (Normalised Innovation Squared) over et Monte Carlo-ensemble, kontrollert mot sine { "95" }%-bånd for χ² (Bar-Shalom §{ "5.4" }). Det matchede filteret havner innenfor båndene; et bevisst feiljustert filter (innstillingene <c10/> / <c11/>) flagges: en objektivt kontrollerbar, diskriminerende gate og ikke en gummistempel. <b>Kontrollen av NEES / innovasjonshvithet er DEN STATISTISKE REFERANSEN: en påstand om selvkonsistens (filterets rapporterte kovarians stemmer ærlig med spredningen i filterets egne feil under den modellerte støyen), IKKE en garanti for nøyaktighet i den virkelige verden.</b> Ærlig omfang: alt er <b>modellert / simulering</b>; CAI- og klokkeinndataene er bracketerte, litteraturrepresentative verdier og ikke målt maskinvare; CAI-maskinvaren og dens nøkkelperson forblir eid av partneren; ingenting her antyder TRL > { "3" }, flygehistorikk eller ekstern validering (resultat-JSON og enlinjessammendraget bærer disse merkene eksplisitt). Den ene banen med konstant hastighet og i plan lar holdnings- og IMU-biastilstandene være bare svakt observerbare, så NEES vurderes over de { "8" } estimerbare tilstandene; en manøvrerende bane for full observerbarhet av alle 17 er veikart. Legger også til instrumentering for konsistens med <c12/> (returnerer NIS per oppdatering) og <c13/>. Alle eksisterende scenarioer er upåvirket (additivt; golden-verdier for reproduserbarhet er uendret).

seg-9b55f4ac5053 = <b>Sekvensiell (rekursiv) terrengreferert navigasjon: SITAN som et løpende filter.</b> En ny scenariotype <c1/> (<c2/>, <c3/>) som kjører den eksisterende målemodellen høydemåler mot DEM <b>epoke for epoke</b> gjennom SIR-motoren <c4/>, i stedet for det grove-til-fine batchsøket <c5/> bruker for å gjenvinne ett enkelt <em>konstant</em> INS-avvik. Ved hvert veipunkt propageres skyen med inkrementet INS rapporterer (selv forvrengt av veksten i drift per steg), revektes med terrengmatchen og resamples ved degenerasjon, så en <b>tidsvarierende</b> INS-drift blir <em>fulgt</em> langs sporet, noe en tilpasning med konstant avvik strukturelt ikke kan. På den syntetiske DEM-en holder det rekursive estimatet seg begrenset og konvergerer på nytt (sluttverdi ≈ { "70" } m) mens den uassisterte treghetsløsningen divergerer ubegrenset til ≈ { "5" } km; feilen per epoke følger terrengets særpreg (den driver på det biasede INS over flate sadler og låser seg på nytt over distinkt relieff), og monitoren for effektivt utvalg bekrefter en frisk sky. Ærlig omfang: kartet er <b>kjent og fast</b>: rekursiv <em>lokalisering</em> mot en lagret DEM (lokaliseringshalvdelen av terreng-SLAM), ikke felles kartestimering; ikke-sirkulært per konstruksjon (den injiserte driftsrampen er den uavhengige referansen). Alle eksisterende scenarioer er upåvirket (additivt; golden-verdier for reproduserbarhet er uendret).

seg-87ba3bc926fa = <b>Ryggrad for robusthet mot GNSS-nekting + demonstratorskiver for FutureNAV</b> (<c1/>, og grunnlag for robusthetskonvolutt under <c2/>, <c3/>, <c4/>, <c5/>, med verifikasjonsskiver for FutureNAV i <c6/>). Setter sammen byggeklossene for alternativ PNT (holdover for klokke, signalsporing, treghetsdrift, terreng) til én enkelt fortelling om robusthet ved GNSS-utfall. MODELLED; additivt.

seg-071bb6654f24 = <b>Kshana Interchange Format (KIF): en versjonert, selvbeskrivende artefaktkonvolutt</b> (<c1/>). En skjemamerket innpakning rundt scenarioresultater slik at et lagret artefakt bærer med seg typen, skjemaversjonen og merkene MODELLED/VALIDATED, og eldre konvolutter forblir forover-kompatibelt lesbare. Additivt; eksisterende resultat-JSON er uendret.

seg-07147766ab22 = <b>Modulasjon / sporing av navigasjonssignal + differensialkorrektor for CR3BP halo/NRHO</b> (<c1/>, <c2/>). En førsteordens modell for modulasjon og sporing av navigasjonssignal, og en differensialkorrektor for det sirkulære begrensede trelegemeproblemet for halo-baner / nesten rettlinjede halo-baner, vist på den eksisterende funksjonsaksen for dypt rom. MODELLED.

seg-d0d2366e3351 = <b>Evalueringsmodus for fordelingsforskyvning + innstilling for alvorlighetsskala i korpus for <c1/></b> (<c2/>). Legger til et eksplisitt skille mellom innenfor og utenfor fordelingen og en justerbar alvorlighetsskala i korpuset til rammeverket for ROC/AUC og optimismegap (bare operasjonskarakteristikker, aldri felt-/IQ-data).

seg-9bb8ee93e70b = <b>ROI for kostnad per dekning + kartlegging av integritetspåvirkning ved uoppdaget feil</b> (<c1/>, <c2/>). Et ROI-perspektiv for sparsommelig ingeniørkunst (kostnad per enhet dekning) og en kartlegging fra rate for uoppdagede feil til integritetspåvirkning. MODELLED; additivt.

seg-55f8ba5b52ee = <b>Sitert parameterark for feilmodellen for kaldatom-interferometer (CAI)</b> (<c1/>). Et litteraturreferert, bracketert parameterark for den inertiale CAI-modellen; inndataene er <b>sitert, ikke målt maskinvare</b> (ingen TRL- eller flygepåstand); det mater gulvet for hastighets-random-walk i <c2/>.

seg-cfbff4acc64c = Prosjektstyring.

seg-982f9ea3eee8 = <c1/> dokumenterer beslutningsmodellen og grensen mellom åpent og lukket; raden for fellesskap/styring i funksjonskartet går <c2/> for å gjenspeile det.

seg-c9ff6a7183eb = <b>Beskyttelsesnivå for ARAIM-integritet: nominell bias (<c1/>) og σ_URA er nå anvendt.</b> MHSS-beskyttelsesnivået trekker nå fra den ensidige projeksjonen av nominell bias <c2/> per feilmodus, og bruker <b>integritets</b>-sigmaet σ_URA (forskjellig fra <b>nøyaktighets</b>-sigmaet σ_URE) som bæres i Integrity Support Message. Dette gjør beskyttelsesnivået mer konservativt og standardriktig, og <b>endrer derfor PL-verdiene som eksisterende integritetsscenarioer rapporterer</b>. ISM/scenarioet får feltene <c3/> <c4/> / <c5/>, så inndata som lar dem stå usatt beholder tidligere oppførsel. Se <c6/> for den gjenopprettede formelen <c7/> og den ærlige implementasjonsmerknaden.

seg-c408f8944ac6 = Konsistens for kjikvadrat i spoof-monitoren.

seg-92e2b5c5458c = <c1/> bruker nå den delte stien for invers kjikvadrat i <c2/>, og en andre, avvikende kjikvadratimplementasjon er fjernet slik at RAIM og paritetsmonitoren for spoofing er enige om terskelene sine.

seg-6d424034e500 = <b><c1/> koblet til CLI-dispatcheren.</b> Scenarioet var tidligere bare nåbart gjennom API-et; det dispatches nå som en <c2/> som alle andre scenarioer.

seg-62c3efb54991 = <b>Nøyaktig dokumentasjon/antall.</b> Antall scenariotyper i README er nå festet til <c1/> av en <c2/>-test, slik at det dokumenterte antallet ikke lenger kan avvike fra dispatcheren.

seg-5f0f497aa643 = <b>Deep-space & Mars PNT — åpen radiometrisk navigasjonsmotor + GSE-simulering.</b> En ny, fullt additiv funksjonsakse oppå den jordvaliderte kjernen (hvert eksisterende jordscenario er <b>byte-identisk</b> — reproduserbarhetens golden-filer består uendret uten regenerering). Legger til: en flerlegemedynamikkjerne (<c1/> med tesseral tyngdekraft GMM-3 for Mars, et IAU-definert Mars-fast referansesystem, en utskiftbar <c2/>-søm, todelte julianske datoer med sub-mikrosekund og TT↔TDB); radiometriske observabler (iterativ lystid + Shapiro-forsinkelse, to-/ett-/treveis Doppler og avstand via Moyer-løsningen med to ledd, koherent transponderomsnuing, regenerativ/PN-avstandsmåling iht. CCSDS { "414" }, Δ-DOR iht. CCSDS { "506" }, medier som solplasma/tropo/iono); parsing og utskrift av CCSDS-TDM ({ "503" }); et redusert-dynamisk Square-Root Information Filter med empiriske RTN-akselerasjoner, en tretilstands klokke ombord og en Mars-luftmotstandsmodell; en felles estimator som fusjonerer enveis og toveis; scenarioflaten <c3/> (reléstjernebilde + LMO/overføring/ overflate) på tvers av CLI, Python, WASM, MCP og playground; og en ende-til-ende GSE-ytelsessimulator (geometri → linkbudsjett → observabler → SRIF → kovarians). <b>Valideringsnivå — validert ved simulering:</b> syntetisk banebestemmelse (OD) i lukket sløyfe (Mars-LMO ≈ { "0.2" } m) og analytisk selvkonsistens, der den solsentrerte Mars-dynamikken er uavhengig kryssjekket mot JPL <b>DE440</b> (<c4/>, avhengig av tilgjengelig kernel: { "137" } m @ 1-dagers bue, den ærlige residualen fra umodellert n-legeme). Rapporterte dyprommsnøyaktigheter er <b>simulerings-/kovariansbaserte kvalitetsmål</b>, ikke resultater fra reelle oppdrag; validering mot reelle DSN/ESTRACK-sporingsdata står fortsatt på veikartet. ANISE (MPL-2.0, edition-2024) er avgrenset til en krysskontroll-crate utenfor workspace, slik at lisensporten <c5/> og MSRV-1.75-jobben er urørt.

seg-2ab34100a2d7 = <b>Byrånøyaktige bakkespor fra reell IERS-jordorientering.</b> Scenarioet <c1/> tar et valgfritt felt <c2/> — den innebygde brødteksten i en reell IERS <c3/>-fil — og reduserer bakkesporet gjennom UT1−UTC og polbevegelse per epoke, interpolert fra den (den samme <c4/> som <c5/> bruker), og overstyrer de nominelle skalarene <c6/>/<c7/>/<c8/>. Dataene følger med i scenarioet, så kjøringen forblir reproduserbar og trenger ikke noe filsystem (den fungerer i WASM-playground). Et flagg <c9/> legger en reell fil inn i scenarioet fra CLI. Lukker asymmetrien der bare <c10/> brukte reelle jordorienteringsdata.

seg-e778245e7d8f = <b>Konsistens i referansesystem for avstandsrate.</b> Bakkestasjonen avbildes nå inn i det inertielle systemet gjennom den eksakte inversen av satellittens reduksjon (<c1/>, som angrer polbevegelsen <em>og</em> sideralrotasjonen) i stedet for en GMST-rotasjon som ikke tar hensyn til polbevegelse, slik at begge endepunkter deler ett referansesystem. Virkningen på rapportert Doppler ligger under valideringsgulvet, men det fjerner et reelt avvik mellom referansesystemene og en «eksakt»-overdrivelse i kilden.

seg-3b912d8a819d = <b><c1/> valideres.</b> En null eller ikke-endelig bærefrekvens gir nå en feil i stedet for stille å produsere null Doppler (den hadde gjort λ = c/bærefrekvens uendelig), på linje med den eksisterende kontrollen for <c2/>.

seg-7d70317ca717 = <b>Validering av kraftmodell ved efemeridetilpasning, kryssvalidert mot reelle byråprodukter.</b> En ny batch-estimator med minste kvadrater (<c1/>) med variasjonell tilstandsovergangsmatrise og utlierredigering, drevet av en full kraftmodell (<c2/>: EGM2008-geopotensial, tredjelegemer, tidevann fra fast jord + hav + atmosfære, og empiriske CPR/2-per-omløp-akselerasjoner), matet av en reell IERS <c3/>-parser for jordorientering. Validert mot publiserte referansebaner: <b>Galileo MEO til { "13" } cm etter tilpasning</b>, ESA <b>Swarm-A LEO</b> og <b>LRO måne</b> (selenosentrisk, GRAIL-tyngdefelt, IAU-2015 legemefast system — redusert-dynamisk { "6.6" } m, ærlig talt over målet på { "5" } m på den åpne stien; DE-klasse-stien ANISE/DE440 som når målet, er en crate utenfor workspace).

seg-bf88a3eb4733 = <b>Scenarioet <c1/></b> — en integrert flerlags spoofing-detektor som kombinerer RAIM-paritet per epoke, AGC- og signalkvalitetsmonitorer (SQM) og en fusjonert beslutning, validert mot de publiserte scenarioparametrene i <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }), inkludert det vanskelige tilfellet med bærebølgejustering.

seg-976036ba124b = <b>Scenarioet <c1/> — tilstand, referansesystemer, bakkespor og Doppler.</b> Propagerer én satellitt (TLE→SGP4 eller en analytisk bane) og gir for hvert steg ut den inertielle TEME- og GCRS-tilstanden (<b>posisjon <em>og</em> hastighet</b>), den jordfaste ITRF/ECEF-posisjonen, WGS-84 <b>bakkesporet</b> under satellitten (breddegrad / lengdegrad / høyde), og toposentrisk asimut / elevasjon / avstand med avstandsrate og <b>Doppler</b> fra en bakkestasjon. Tilgjengelig fra CLI, Python, WASM og MCP-serveren, og levert som <b>forhåndsinnstillingen «Ground track»</b> i web-playground, der sporet tegnes <b>over et reelt verdenskart</b> (Natural Earth { "1" }:110m kystlinjer, innebygd — ingen nettverk eller ekstern avhengighet).

seg-761c95f2ede5 = <b>CCSDS OEM-eksport</b> (<c1/> / <c2/>) — den hastighetsbærende Orbit Ephemeris Message som brukes av GMAT / Orekit / STK, på linje med de eksisterende SP3- og OMM-eksportørene.

seg-111b0896fdd4 = <b>Jordtidevann: fast, hav (FES2004) og atmosfærisk (Ray { "2001" } S2)</b> på geopotensialet (IERS Conventions kap. { "6" }), koblet inn i kraftmodellen.

seg-7e392131261a = <b>ARM64-wheels</b> — PyPI-bygget lager nå også wheels for Linux aarch64 (manylinux_2_28), macOS arm64 og Windows arm64.

seg-7cc04ea3362b = <b>Utvidet teknisk rapport (preprint)</b> lenket fra README, og JOSS-artikkelen gjort innsendbar (forfatterens ORCID, kompilert til PDF i CI ved hver endring).

seg-3b1e95acc728 = <b>Referansesystemer validert til millimeternivå mot publiserte Vallado-vektorer.</b> Reduksjonen TEME→PEF/ITRF, hele CIO IAU 2006/2000A GCRS→ITRS-kjeden og konverteringen ECEF→geodetisk WGS-84 er nå festet til regneeksempelet i Vallado et al. (AIAA 2006-6753) med dets IERS EOP, ikke bare til intern selvkonsistens.

seg-fd9818877a6c = <b>Uavhengige krysskontroller av tidsskalaer.</b> ERA og skalaene UTC/TAI/TT stemmer overens med <c1/> til < { "1" } µs, og den planetariske efemeriden DE440 stemmer overens med JPL Horizons (geosentriske posisjoner for Måne/Sol), begge som alltid-på CI-porter.

seg-75aeec4cd6d0 = Web-playground skjuler fanen for kvalitetsmål når et resultat ikke har noen rader med kvalitetsmål, slik at pakker med bare diagram (efemeride, RAIM, spoof) åpner på diagrammet sitt — for efemeride, bakkesporet — i stedet for en tom tabell.

seg-b8ab0cc3ce7f = Playgroundens veiledede glidere <b>og parametersveip fungerer nå for efemeride-/bakkesporscenarioet</b>: knottene (stasjonens breddegrad / lengdegrad, tidssteg, varighet, UT1−UTC) kan justeres, og et sveip kan plotte overflygingsgeometri (maks. elevasjon, topp-Doppler, høyde, hastighet) mot hvilken som helst av dem — for eksempel maks. elevasjon mot stasjonens breddegrad. Sveip-fanen vises nå bare når et scenario faktisk kan sveipes, slik at ingen pakke tilbyr en kontroll som ikke plotter noe.

seg-9e7a37e51940 = Dokumenterte SGP4-tilnærmingen <c1/> ved GMST-kallstedet (en rotasjonsfeil på ≤ ~{ "13" }″, godt innenfor SGP4s egen modellfeil) og oppdaterte <c2/>.

seg-174a75e840b0 = JetBrains-pluginen <b>Kshana — PNT simulator</b> er nå publisert og akseptert på <a1>JetBrains Marketplace</a1>. README, <c1/> og distribusjonsdokumentene lenker direkte til den.

seg-4deaf7918fff = <b>Publisering til MCP-registeret</b> lykkes nå: <c1/> <c2/> var over registerets grense på 100 tegn (HTTP { "422" }). Forkortet den og justerte servernavnet (og eierskapsetiketten på container-imaget) til det kanoniske navnerommet <c3/>.

seg-1408961042a1 = <b>Publisering til JetBrains Marketplace</b> lykkes nå: CI lastet opp på nytt den samme plugin-versjonen som var oppført manuelt, noe Marketplace avviser. Plugin-versjonen er økt til <c1/>, og idempotensvakten behandler nå også et svar med «already contains version» som en vellykket no-op.

seg-74e8cab2f10e = <b>Cache-busting for <c1/></b>: spørrestrengene <c2/>/<c3/> med versjonsstempel følger utgivelsen, slik at gjenkommende besøkende alltid får gjeldende bygg.

seg-65949229eed7 = <b><c1/> — Kshana som en Model Context Protocol (MCP)-server</b> (<c2/>). En frittstående crate utenfor workspace (SDK-en <c3/> er edition { "2024" }) som eksponerer den validerte motoren for AI-agenter og assistenter — Cursor, JetBrains AI Assistant / Junie og enhver MCP-klient — over stdio. Verktøy: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, hvert en tynn wrapper rundt <c9/>.

seg-bd792f66363c = <b>JetBrains IDE-plugin</b> (<c1/>). Høyreklikk et scenario <c2/> → <b>Run Kshana Scenario</b>; kvalitetsmål og resultat-JSON strømmes inn i et Kshana-verktøyvindu. Ren plattform-Kotlin-plugin som fungerer med alle JetBrains IDE-er { "2024.3" }+.

seg-755358390517 = <b>Offentlig distribusjon + automatisk publisering per utgivelse</b> for begge:

seg-14fc2fd73553 = <c1/> til <b>crates.io</b> (<c2/>) via <c3/>.

seg-2b39bbfc0581 = <c1/> som et <b>OCI-image</b> for flere arkitekturer på <c2/> (<c3/>) via en ny <c4/>.

seg-c824d1532eb6 = <c1/> til det <b>offisielle MCP-registeret</b> via GitHub OIDC (null hemmeligheter); registeroppføringen (<c2/>) bruker OCI-pakketypen med en eier verifisert via etikett.

seg-f90da0c61aac = IDE-pluginen til <b>JetBrains Marketplace</b> via <c1/> (token-styrt, valgfri utviklersignering) ved hver utgivelses-tag.

seg-21d7457dad23 = <b>Uavhengig kryssvalidering av referansesystemer med ANISE/SPICE</b> (<c1/>). En frittstående crate utenfor workspace krysssjekker IAU 2006/2000A CIO-reduksjonen i <c2/> (<c3/>, GCRS→ITRS) mot <b>ANISE</b> (den rene Rust-reimplementasjonen av NAIF/SPICE) som roterer GCRF→ITRF93 fra JPLs <c4/>, med <b>de samme IERS <c5/>-parametrene for jordorientering gitt til begge sider</b>, over åtte kvartalsvise epoker { "2020" }–{ "2023" }. De to uavhengige realiseringene av referansesystemet stemmer overens med en <b>maksimal relativ rotasjon på { "0.028" }″ — ≤ { "0.86" } m på bakken, ≤ { "0.93" } m i LEO, ≤ { "3.6" } m i GNSS-bane</b>, noe som innfrir det mangeårige ROADMAP-målet «< { "10" } m» for krysskontroll av referansesystemer med god margin (den kompletterer, og erstatter ikke, de eksisterende bit-for-bit SOFA/ERFA-ankrene). Craten er isolert fordi <c6/> + <c7/> er MPL-2.0 / edition-2024 og aldri må komme inn i den publiserte avhengighetsgrafen til <c8/>, dens <c9/>, lisensporten <c10/> eller MSRV-bygget; ANISE er festet med <c11/>. Inkluderer en binærfil <c12/> (henter ~{ "5" } MB BPC, skriver ut en tabell, skriver <c13/>), en testport som hopper over seg selv når kernel/nettverk mangler, og en valgfri CI-jobb som bare kjøres ved <c14/> (blokkerer aldri <c15/>). Dokumentert i <c16/> (CIO-raden) og <c17/>.

seg-eb45b43dacc2 = <b>Mobilvennlig playground.</b> Rettet horisontal overflyt i playgroundens <c1/> på telefoner (et CSS-grid-element som er standard <c2/> ble gjengitt ~{ "100" } px bredere enn visningsvinduet) via <c3/> og breddebeskyttede kontroller; verifisert uten feil ved { "360" } / { "390" } / { "414" } / { "768" } px. Justerte handlingsknappene "Pin to compare" / "Download report" (like marginbokser i flex-raden). Forstørret kjøreknapper, glidere, utvalgslister og navigasjonslenker til minstestørrelsen for berøringsmål på ~{ "44" } px (WCAG { "2.5.5" } / Apple HIG) på telefoner og berøringsenheter, med uendret størrelse på skrivebordet.

seg-fe5095d5e61f = <b>Robusthetsherding fra en adversariell battle-test-runde.</b> ({ "1" }) <c1/> avviser nå ikke-endelig elevasjon/asimut/varians og negative eller ikke-endelige kovariansdiagonaler (en nesten-singulær geometri skalert opp av en liten σ kunne tidligere slippe gjennom den absolutte pivotporten og returnere en NaN VPL / absurd HPL som en <em>gyldig</em> <c2/> — en stille integritetsfeil). ({ "2" }) Den numeriske propagatoren (<c3/>/<c4/>) feiler lukket på en ikke-endelig starttilstand i stedet for å la den adaptive regulatoren spinne evig. ({ "3" }) DEM-cellehjelperen kaster ikke lenger panic på et rutenett med én prøve ({ "1" }×N). ({ "4" }) Asimut i <c5/> holdes strengt i <c6/>. ({ "5" }) <c7/> avviser ikke-fysiske (NaN / ikke-positive) <c8/>/radius.

seg-9ca339d8977a = <b>Binærfilen <c1/> + utgivelsesartefakt</b>: en avhengighetsfri generator som lager en utskriftsklar HTML-valideringsoppsummering på én side som indekserer hver CI-håndhevet validering (SGP4 666/666, EGM2008, bit-for-bit referansesystemer, NIST Allan, IMU-datablad, ARAIM/SBAS, reproduserbarhet på 3 OS, dekning) til sin test og sin eksterne uavhengige referanse. Utgivelsesarbeidsflyten genererer <c2/> og legger den ved (med SLSA-proveniens) til hver tagget utgivelse.

seg-bd231d07658f = <b>numpy-interop-pytest + wheel-herding</b>: <c1/> (kjøres i CI) pluss en festet manylinux-container og et verifiseringssteg med <c2/> i wheel-bygget.

seg-5427cae6fc39 = <b>Veiledninger og undervisning</b>: <c1/> (tre gjennomarbeidede veiledninger, annoterte scenarioer per fagområde, øvelser på nivå 1/2/3) med <c2/> som fester hvert oppgitt tall til live motorutdata.

seg-2fad9124c5a6 = <b>Artefakter for ekstern innsending</b> (<c1/>, <c2/>, <c3/>): et utkast til JOSS-artikkel, en notebook om kvante mot klassisk, og klare pakker for innsending til awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, pluss <c4/> — som klargjør de eksterne stegene for innsending.

seg-0f88f8bccbc1 = <b>Terrengreferert og kombinert alt-PNT-navigasjon</b> (modulen <c1/>): en TERCOM/SITAN-terrengmatchende navigator over en DEM (laster for <c2/> + generator for syntetiske testdata) og en kombinert tyngde- + magnetisk (IGRF) + terrengbasert GPS-nektet navigator, eksponert som scenariotypene <c3/> og <c4/>. Validert ved terrengmatchkonvergens (et kjent injisert avvik gjenfunnet) og en avgrenset feil i det kombinerte filteret over et GPS-nektet vindu.

seg-bd01ec72fa2a = <b>LunaNet LANS-geometri</b> (<c1/>): navngitte månesteder (Apollo 11/15/16, Shackleton-kanten) med autoritative selenografiske koordinater, overflatesiktevinkler (az/el/avstand), synlighet/dekning og DOP for stedet, validert mot Månens radius, de publiserte stedskoordinatene og identiteten for radial overhead på { "90" }° elevasjon.

seg-2dad9cf59ea9 = <b>Veiledet nettleser-playground</b>: glidere i veiledet modus, et faneinndelt utdatapanel, en førstegangsomvisning som overlegg, moduser for parametersveip og overlegg av flere kjøringer, en avhengighetsfri canvas/SVG 3D-banevisning (orbit-pakken gir nå ut et additivt <c1/>), en embed/iframe-modus og nedlasting som HTML-rapport — hver med node-enhetstester i CI.

seg-261604603d67 = <b>Datablad-validert IMU-feilmodell</b> (<c1/>): ADIS16465/16488/16460 ARW/VRW/bias-ustabilitet gjenfunnet fra den syntetiserte Allan-deviasjonen og kontrollert mot produsentens spesifikasjoner (NIST SP1065 / identifikasjon etter IEEE { "952" }).

seg-dc7b9bdb3076 = <b>Validering av Allan-estimatorene i NIST SP1065</b> (<c1/>): de fire estimatorene gjengir de publiserte referansedeviasjonene for 1000 punkter og konfidensgrensene i tabell 32.

seg-5d50be22aacd = <b>SBAS / DO-229E beskyttelsesnivåer, L1/L5 ionosfærefri og et DO-316 compliance-kart</b> (modulen <c1/>). <c2/> danner den vektede geometrimatrisen fra hver satellitts elevasjon/asimut og feilbudsjettet UDRE/GIVE/airborne/tropo, inverterer normalmatrisen (delt <c3/>) og projiserer variansene til HPL/VPL via K-faktorene i DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> legger til den ionosfærefrie GPS L1/L5-pseudoavstanden (IS-GPS-705, <c5/>), validert til å kansellere motorens uavhengige førsteordens ionosfæreforsinkelse. <c6/> sporer DO-316/DO-229E-kravene til de implementerende funksjonene. Validert mot lukkede formdefinisjoner av K-faktorene, numpy-referansegeometrien <c7/> og identiteten for kovarians via to ruter; krysskontrollen av overensstemmelse med publiserte PL-verdier fra RTKLIB/gLAB er dokumentert som under gjennomgang i <c8/>.

seg-e9e60b40e42a = <b>Full tesseral sfærisk-harmonisk tyngdekraft — EGM2008-feltet til grad/orden { "70" }.</b> En ny <c1/> evaluerer geopotensialet og akselerasjonen fra det i det jordfaste systemet ut fra fullt normaliserte <c2/>-koeffisienter, ved hjelp av den stabile normaliserte Legendre-rekursjonen til Holmes–Featherstone (avnormalisering ville gitt overflyt ved denne graden). De medfølgende koeffisientene er NGA-produktet EGM2008 (offentlig eiendom, via ICGEM), samlet i <c3/> og gjengitt bit-for-bit av <c4/> fra den innsjekkede <c5/>; enhver ICGEM-modell i formatet <c6/> lastes via <c7/>. Validert mot tre uavhengige referanser: kollaps til punktmasse (kun <c8/> = <c9/>), et felt med bare sonale ledd som gjengir den eksisterende <c10/> til ~{ "1e-9" }, og den analytiske akselerasjonen som stemmer med endelig-differanse-gradienten av det direkte summerte potensialet til <{ "1e-6" }.

seg-c33a2dbf851d = <b>Generell-relativistisk Lense–Thirring-akselerasjon (rammedragning)</b> (<c1/>, IERS { "2010" } lign. { "10.12" }), det gravitomagnetiske leddet utover den eksisterende Schwarzschild-korreksjonen, koblet inn i den numeriske propagatoren via et nytt flagg <c2/>. Validert som lineært i jordens spinnmoment og { "1" }–{ "2" } størrelsesordener under Schwarzschild-leddet, regimet for målingene med LAGEOS / Gravity Probe B.

seg-909562023109 = <b>Et trait <c1/> som forener de analytiske og numeriske banepropagatorene.</b> Den numeriske Cowell-propagatoren med kraftmodell er nå en førsteklasses likemann til SGP4: en ny type <c2/> (starttilstand + <c3/> + <c4/> + valg av enten step-doubling eller Dormand–Prince <c5/>) og <c6/> implementerer begge <c7/>, hvis <c8/> returnerer den inertielle TEME-tilstanden i SI-enheter (m, m/s), slik at de to kan byttes mot hverandre bak en <c9/>. SGP4-implementasjonen er den eksakte km/min→SI-konverteringen av den iboende metoden (verifisert med en likhetstest); den numeriske implementasjonen klarer den samme sub-meter-porten mot eksakt Kepler gjennom trait-et, de to adaptive driverne stemmer overens, og en <c10/> viser den underliggende SGP4-koden.

seg-d094880df57b = Denne utgivelsen lukker det største korrekthetsgapet i motoren: jordorientering og reduksjon av referansesystemer er nå gjort på nivå med en referanseimplementasjon (validert <b>bit-for-bit mot ERFA/SOFA</b>), integritetsstakken får <b>ARAIM med to konstellasjoner</b> på reelle GPS+Galileo-TLE-er, og lagene for propagering, kvantesensorer, måne/cislunar og geomagnetisme blir alle dypere — sammen med et typet Python-API, en rikere nettleser-playground og en reproduserbarhetsmatrise på tre OS. Høydepunkter:

seg-bfe1d4a7cabd = <b>Referansesystemer, bit-for-bit.</b> Full IAU 2000A- og 2000B-nutasjon, presesjon etter IAU { "2006" }, den CIO-baserte (X, Y, s) IAU 2006/2000A GCRS↔ITRS-reduksjonen, IERS-polbevegelse og utdata-systemene TEME→GCRS/ITRS — hver validert bit-for-bit mot referanserutinene i ERFA/SOFA.

seg-bb5705347a24 = <b>ARAIM med to konstellasjoner</b> (GPS + Galileo) på reelle TLE-er, med HPL/VPL, utdata som Stanford-diagram og en åpen <c1/>.

seg-2865dadcd4c8 = <b>Cislunar PNT</b>: en CR3BP-propagator for Jord–Måne, referansesystemene MCI↔MCMF, selenografiske koordinater og et kjørbart LunaNet-scenario for månens integritet.

seg-3b636707a158 = <b>Kvantesensing</b>: Coriolis- og AC-Stark-systematikk for kaldatom-interferometeret, et driftsveip og validering mot Freier-budsjettet ({ "2016" }).

seg-10bc94801a6a = <b>IGRF-14</b> geomagnetisk hovedfeltmodell, selvstendig og validert.

seg-6485f627d793 = <b>Typet Python-API</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, typestubber) med et CI-wheelbygg, pluss førsteklasses GCRS/ITRS-utdata fra propagatoren og CCSDS OMM-eksport.

seg-2b7693641333 = <b>Troverdighet og reproduserbarhet</b>: en head-to-head-sammenligning av SGP4-nøyaktighet mot den uavhengige craten <c1/>, en CI-dekningsport (~{ "97" }% linjer på <c2/>) og en reproduserbarhetsmatrise på tre OS (<c3/>/<c4/>/<c5/>).

seg-32e53ac66056 = <b>Hvert playground-diagram følger nå nettstedets tema.</b> Alle tolv SVG-diagramgeneratorene — resultat-/holdover-diagrammet (<c1/> + <c2/>), Allan-deviasjonsdiagrammet (<c3/>) og alle scenariodiagram (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + tilgjengelighet, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — brukte kjølige marineblå paneler (<c15/>), kjølige grå akser/tekst og en skurrende rød/blå/lilla seriepalett. De bruker nå den varme grafittpaletten hele veien: <c16/>-paneler, varmt <c17/>-rutenett, <c18/>-etiketter, med en konsekvent seriefordeling: kvante = honninggull (<c19/>), klassisk = varm rav (<c20/>), spesifikasjon/grense = <c21/>. Sikkerhetskodede visninger beholder betydningen sin: RAIM Stanford-diagrammet forblir grønt (tilgjengelig) / rav (villedende) / rødt (farlig) / dempet stål (utilgjengelig), og HPL/VPL leses som gull/bronse.

seg-2bb31dfc7756 = <b>Diagrammer er nå selvforklarende når de lagres/lastes ned.</b> Begge diagrammene bakes inn tittelen i SVG-en (tittelen og undertittelen «lower is better» i Allan-diagrammet var tidligere bare HTML rundt bildet, så et lagret bilde hadde ingen bildetekst), og begge har en proveniensfot — <c1/> — slik at et nedlastet diagram står på egne ben og forblir reproduserbart.

seg-9f528e334cd8 = <b>Hvert diagram har nå proveniensfoten.</b> Foten — <c1/> — stemples sentralt for alle scenariotyper i <c2/> (tidligere bare på holdover- og Allan-diagrammene), slik at ethvert lagret eller nedlastet bilde — fra playground, CLI-ens eksport av <c3/> eller HTML-resultatkortet — identifiserer versjonen, scenariofingeravtrykket og kilden. Hashen er merket <c4/> for tydelighet og kommer fra resultatets <c5/> der den finnes, med en reserve med kildehash for integritets-/månerapportene. Hva fingeravtrykket er og hvorfor det er der, er dokumentert i README-delen «Output» og <a1><c6/></a1>.

seg-635697ed3fb1 = <b><c1/> og RAIM Stanford-støysamplerne er nå panikkfrie ved inndata utenfor område / ikke-endelige</b> (et funn fra fuzzing som avhenger av rekkefølgen til <c2/>, fra de nye ARAIM-scenarioene). <c3/> vokter nå <c4/>/<c5/> som <c6/> (returnerer en grenseverdi i stedet for å panikke via <c7/>), og tilgjengelighetens Stanford-støy <c8/> klemmer til en strengt positiv σ — slik at integritets-/ARAIM-stakken aldri kaster panic på muterte eller feilkonfigurerte scenarioer.

seg-b36a0c42845e = <b>CI-matrise for kryssplattform-reproduserbarhet.</b> En ny jobb <c1/> kjører reproduserbarhetstestene på <b>ubuntu-latest, macos-latest og windows-latest</b> ved hver push. Fordi hele resultat-JSON-en ikke er byte-identisk på tvers av OS-er (avvik i libm i siste ULP), kontrollerer den den plattforminvariante projeksjonen eksakt — inndatafingeravtrykket pluss utdataformen, festet per scenario som SHA-256-golden-filer i <c2/> av den nye <c3/> — ved siden av de numeriske festene (<c4/>, til { "1e-6" }), SGP4-tilstandene (<c5/>, til { "2e-5" } km) og determinisme innenfor samme prosess (<c6/>). Sammen beviser dette reproduserbarhet på tvers av plattformer på tre OS uten skjørheten ved eksakt byte-hashing av hele utdataen. <c7/> dokumenterer oppdelingen.

seg-9b8c0a407387 = <b>Kodedekningsport i CI.</b> En ny jobb <c1/> kjører <c2/> med den LLVM-kildebaserte motoren, publiserer en lcov-rapport som byggeartefakt og håndhever et gulv for linjedekning på <c3/> (genererte datatabeller, CLI-inngangspunktet, testene og web-ressursene er utelatt). Målt linjedekning er ~{ "97" }% på <c4/> (SGP4 og klokkemodulene ≥{ "95" }%); porten er satt til { "85" }% — over målet på ≥{ "80" }% og klar av den målte verdien, slik at den fanger regresjoner uten å flakke. Et dekningsmerke publiseres i README.

seg-1dfc4beb239a = <b>SGP4/SDP4 head-to-head mot den uavhengige craten <c1/>.</b> En ny test (<c2/>) kryssvaliderer Kshanas propagator mot det mest brukte Rust-biblioteket for SGP4 (neuromorphicsystems/sgp4, lagt til som en dev-avhengighet kun for test) over de samme { "666" } AIAA 2006-6753-vektorene. Med begge kjørt på tyngdemodellen WGS72 som vektorene bruker, stemmer de to uavhengige implementasjonene overens til <b>sub-mikron</b> på jordnære og resonante baner og <b>{ "4.12" } mm i verste tilfelle</b> på tvers av alle regimer, og begge gjengir referansetabellen <c3/>. Den innsjekkede sammenligningstabellen (<c4/>, regenerert via <c5/>) bryter resultatet ned per regime (LEO/MEO, dypt rom, ½-dags og 1-dags resonans) og noterer de fire bevisst patologiske tilfellene som craten avviser ved konstruksjon. De kjørende kontrollene holder begge innenfor { "2e-5" } km av referansen og stemmer overens innenfor { "4e-5" } km — en regresjonsvakt, ikke en engangsøvelse. Dette er konkurransedyktig dokumentasjon av kvalitet: korrekthet mot en uavhengig kodebase, ikke bare en statisk tabell. (Standardfunksjonen <c6/> i craten bruker WGS84 og avviker derfor fra WGS72-referansen med ~km — vist ærlig i tabellteksten.)

seg-dc75162ecd64 = <b>CCSDS OMM-eksport kan nå nås ende-til-ende.</b> OMM-skriveren (<c1/>) hadde tidligere ingen sti via CLI/API; middelelementene i et <c2/>-scenario kan nå publiseres som en CCSDS 502.0-B-2 OMM-katalog — én OMM KVN-melding per TLE-definerte satellitt — via <c3/>, eller <c4/> i scenarioet skriver automatisk <c5/> (i likhet med den eksisterende <c6/>). Hver melding bærer satellittens <b>reelle</b> NORAD-katalognummer, COSPAR internasjonale betegnelse (<c7/>) og epoke (CCSDS-form med dag i året), parset fra TLE-linje { "1" } av den nye <c8/>; navnelinjen blir <c9/> (ellers <c10/>). <c11/> er scenarioets epoke, ikke veggklokketid, slik at utdataen er reproduserbar. Nytt API: <c12/> / <c13/>, <c14/>, <c15/>. Et syntetisk Walker- eller RINEX-scenario (uten TLE-middelelementer) gir feil i stedet for å skrive en tom fil. Validert mot det medfølgende øyeblikksbildet <c16/> med 30 satellitter (<c17/>).

seg-036782a2b65e = <b>Interaktive avlesninger ved hover på playground-diagrammene.</b> Når markøren flyttes over et diagram, snapper et trådkors til nærmeste prøve og viser et verktøytips med verdi (<c1/>, koblet inn i <c2/>). På Allan-diagrammet viser det τ og σ_y(τ) for hver klokke; på tidsseriediagrammene for scenarioer (klokke-holdover, dødregning, tidsoverføring, hybrid PNT, GNSS/INS) viser det tiden og verdien for hver serie i diagrammets egne enheter (ns / m / ps / utnyttelse), parset fra resultatet slik at avlesningen stemmer med kurven. Spesialiserte diagrammer (RAIM, spoof, sveip) får ikke noe overlegg. Diagrammene forblir selvforklarende blob-bilder (<c3/>) — overlegget er et gjennomsiktig trådkors + verktøytips på toppen, så nedlasting/sammenligning/eksport er urørt. Koordinatmatematikken (nærmeste prøve, markør→plottbrøk, polylinje-parsing) er enhetstestet (<c4/>, kjøres i CI).

seg-1588ae024e5d = <b>A/B-sammenligningsmodus i playground.</b> Fest hvilken som helst kjøring som grunnlinje A, kjør et andre scenario, og de to vises side ved side med en deltatabell for kvalitetsmål (holdover, RMS/p95 for tidssynkronisering, tilgjengelighet) som farger vinneren per måltall (<c1/>, koblet inn i <c2/>; deltalogikken er enhetstestet i <c3/>, kjøres i CI). Alle verdier settes inn som tekst og alle diagrammer via blob <c4/>, slik at ingenting fra en scenariostreng noen gang injiseres som markup.

seg-6e7a99f8f275 = <b>Nedlastingsknapper for diagram (SVG + PNG).</b> Hvert playground-diagram har nå en verktøylinje "Download SVG / PNG" som passer til temaet (<c1/>, koblet inn i <c2/>). SVG gir tilbake den trofaste, skalerbare originalen; PNG rasteriserer det samme selvforklarende bildet i 2x for lysbilder og dokumenter. Filene får navn med proveniens — <c3/> — og logikken for filnavn/størrelse er enhetstestet (<c4/>, kjøres i CI).

seg-4cb87e7dc892 = <b>IGRF-14 geomagnetisk hovedfeltmodell (<c1/>).</b> Det sfærisk-harmoniske standardfeltet fra IAGA (grad/orden { "13" }, epoke { "2025.0" } + sekulær variasjon { "2025" }–{ "2030" }; koeffisientene er maskingenerert fra den offisielle <c2/> av <c3/> til <c4/>, bit-for-bit reproduserbart). En Schmidt-normalisert syntese gir feltvektoren (nord/øst/ned) og avledede elementer (deklinasjon, inklinasjon, horisontal/total intensitet) på ethvert geodetisk sted/dato, pluss den geomagnetiske polen og dipolstyrken — det magnetiske motstykket til tyngdekartmatcheren for alternativ PNT-navigasjon. Validert selvstendig: syntesen stemmer med den eksakte lukkede formen for den vippede dipolen, hele det analytiske feltet av grad 13 stemmer med en endelig differanse av skalarpotensialet, dipolaksen gjengir den kjente geomagnetiske polen (~{ "80.7" }°N, −{ "72.7" }°E) og styrken ~{ "29.7" } µT, og det globale feltet er fysisk.

seg-c69d50031da4 = <b>Typede Python-bindinger (<c1/>).</b> Utover <c2/>/<c3/> med streng inn/streng ut eksponerer modulen nå en typet klasse <c4/> (<c5/>, <c6/>, <c7/> og en tilgangsmetode <c8/> som returnerer resultatet parset til en innebygd Python-dict — ingen JSON-reparsing, kan pakkes inn i NumPy), pluss <c9/>, <c10/> (parset liste med metadata-dicts) og <c11/> (en liste over feilmeldinger som ikke kaster unntak). Leverer en typestub for PEP { "561" } (<c12/> + <c13/>) for mypy/pyright/editorer og en hurtigstart i <c14/>. De eksisterende funksjonene er uendret.

seg-fb65ac14344c = <b>Førsteklasses utdata-systemer for propagatorer (<c1/>: enumen <c2/> + <c3/> + <c4/>).</b> Enhver <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) kan nå gi posisjonen sin i TEME, <b>GCRS</b> (≈ J2000) eller <b>ITRS</b> (jordfast) — TEME er nativt, GCRS via den validerte TEME→GCRS-reduksjonen, ITRS ved å kjede den inn i IAU 2006/2000A CIO-rotasjonen <c6/> — og den fulle GCRS-tilstanden (posisjon + hastighet) via <c7/>. Den inertielle utdataen for gjeldende dato er ikke lenger bare TEME.

seg-8f596733c439 = <b>CIO-basert IAU 2006/2000A-reduksjon fra himmelsk til terrestrisk system (<c1/>).</b> Den moderne, jevndøgnsfrie kjeden GCRS↔CIRS↔ITRS: CIP-koordinatene <c2/> avlest fra IAU 2006/2000A bias-presesjon-nutasjon-matrisen (gjenbruker den validerte FW-presesjonen + 2000A-nutasjonen med justeringen <c3/> P03), 66-leddsserien for CIO-lokalisatoren <c4/> (<c5/>, maskingenerert fra ERFA-referansen av <c6/> til <c7/>, bit-for-bit reproduserbar), GCRS→CIRS-matrisen (<c8/>), jordrotasjonsvinkelen (<c9/>) og den fulle GCRS→ITRS-rotasjonen (<c10/>, sammensatt med den eksisterende IERS-polbevegelsen). Validert <b>bit-for-bit</b> mot den publiserte <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 ved JD_TT { "2453736.5" }), samt testvektorene for <c12/> og <c13/>. CIO-kjeden og den eldre reduksjonen TEME med jevndøgn/GMST-1982 vises å stemme overens opp til den dokumenterte forskjellen på ≈{ "2" }·(jevndøgnsligningen) i konvensjonen for sideraltid. Dette er den strenge reduksjonen som jevndøgn/GMST-stien tilnærmet.

seg-32e6d8dfcebc = <b>Full IAU 2000A-nutasjonsserie (<c1/>: <c2/>, <c3/>).</b> Hele MHB2000-modellen — { "678" } luni-solare + { "687" } planetariske ledd — nøyaktig til < { "0.1" } mas, ved siden av den eksisterende trunkeringen med 77 ledd i 2000B. Tabellene er maskingenerert fra IAU SOFA / ERFA-referansen <c4/> av <c5/> til <c6/> (generatoren gjengir den innsjekkede filen bit-for-bit), og hele serien — både settene med fundamentale argumenter fra IERS-2003 og MHB2000 og de planetariske lengdegradene — er validert <b>bit-for-bit</b> mot den publiserte testvektoren <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } ved JD_TT { "2453736.5" }, til { "1e-13" } rad). Standard TEME→GCRS-reduksjon beholder 2000B-serien (~{ "1" } mas, under kjedens forenkling av rotasjon i hastighetssystemet); <c8/> eksponerer matrisen for gjeldende dato på < { "0.1" } mas for kallere som trenger den.

seg-35e9e419d2ae = <b>Kjørbart scenario for månens integritet (<c1/>, <c2/>).</b> Kobler beregningen av beskyttelsesnivå ved månens sørpol (<c3/>: <c4/> → <c5/>) inn i scenariokjøreren med en JSON-rapport <c6/> og et SVG-diagram for HPL mot tid, slik at cislunar integritetstilfellet kan nås rett fra CLI. Den viser gapet ærlig: med LANS σ_URE på { "30" } m overstiger HPL ved sørpolen (≈ { "260" }–{ "450" } m) en varslingsgrense på { "50" } m ({ "0" } % tilgjengelig) — integritet for PNT på månen er ennå ikke oppnådd.

seg-1910e8110b43 = <b>Tilgjengelighet for ARAIM med to konstellasjoner på reelle GPS+Galileo-TLE-er, og kobling til scenariokjøreren (<c1/>, <c2/>, <c3/>).</b> Legger til <c4/> (den avanserte ARAIM-motoren — feil i enkeltsatellitter <em>og</em> i hele konstellasjoner — kjørt over et tidsrutenett) og <c5/>, og kobler den inn i kjøreren <c6/> via et flagg <c7/>, slik at en multi-GNSS ARAIM-studie kan nås rett fra TOML. En test med reelle data (<c8/>) på medfølgende Celestrak-øyeblikksbilder fra 2026-06-07 for GPS+Galileo viser at å slå sammen Galileo løfter ARAIM-tilgjengeligheten fra { "0.21" } til { "0.67" } under en krevende VAL på { "12" } m ({ "10.5" }→{ "21.8" } satellitter i sikte), mens modusen som er robust mot konstellasjonsfeil er fundamentalt begrenset med bare to konstellasjoner — den kvantitative grunnen til at robust integritet med to konstellasjoner trekker mot en tredje konstellasjon eller SBAS. Ærlig rest: den numerisk eksakte gjengivelsen av EU ARAIM TN Table A-3 mot én versjonslåst epoke, og en Zenodo-post for testdata.

seg-78ab887a4543 = <b>Det sirkulære begrensede tre-legeme-problemet (CR3BP) for systemet Jord–Måne (<c1/>).</b> En ny kjerne for cislunar dynamikk som to-legeme-/SGP4-propagatorene ikke kan gi: bevegelsesligninger i roterende system (<c2/>), en RK4-propagator (<c3/>), Jacobi-konstantens integral (<c4/>) og de fem Lagrange-punktene (<c5/>). Validert mot lukkede/publiserte anker: de kollineære punktene Jord–Måne (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), de eksakte likesidede L4/L5 = (½−μ, ±√3/2, { "0" }), alle fem bekreftet som likevektspunkter i kraftfeltet, Jacobi bevart til integratorens presisjon under propagering, og den utenfor-planet-gjenopprettende kraften som gjør halo-/NRHO-baner mulig. Dette er grunnlaget for å representere en reell NRHO. Ærlig rest: differensialkorrigerte periodiske startbetingelser for NRHO { "9" }:{ "2" }, den eksentriske/efemeridebaserte (DE) modellen og den avnormaliserte transformasjonen inn i de selenosentriske referansesystemene i <c6/>.

seg-14f4572144f3 = <b>IERS-polbevegelse og reduksjonen TEME→ITRF (<c1/>).</b> Legger til <c2/> (SOFA <c3/>: <c4/> med TIO-lokalisatoren <c5/>), <c6/> / <c7/> og <c8/> — GMST-basert TEME→PEF-rotasjon etterfulgt av polbevegelse — som fullfører en ITRF-presis jordfast posisjon oppå den rene GMST-versjonen <c9/> (polbevegelse er en effekt på titalls meter ved banens radius). <c10/>/<c11/> er observerte IERS-størrelser som kalleren leverer. Ærlig rest: en fullt CIO-basert (X, Y, s)-kjede og en numerisk krysskontroll mot ANISE/SPICE på <{ "10" } m gjenstår som videre arbeid.

seg-b5e84faf880c = <b>Systematikk i kaldatom-interferometeret, driftsveip og en validering mot en publisert enhet (<c1/>, <c2/>).</b> Utvider det førsteprinsipp-baserte CAI-akselerometeret med de to ledende deterministiske systematikkene: <b>Coriolis/rotasjon</b>-fasen <c3/> (<c4/>, med den tilsvarende akselerasjonsbiasen <c5/> via <c6/>) og fasen for <b>AC-Stark lysforskyvning</b> <c7/> (<c8/>, som kanselleres av symmetrien π/2–π–π/2 for en konstant forskyvning). Legger til <c9/> (posisjonsdrift ved dødregning mot syklustid — kjernen i en sammenligning kvante mot klassisk) og en valideringstest mot den mobile gravimeteren til Freier et al. { "2016" } (arXiv:{ "1512.05660" }): det modellerte gulvet for kvanteprojeksjonsstøy ligger under, og innenfor ~{ "2" } størrelsesordener av, den publiserte kortsiktige støyen på { "96" } nm/s²/√Hz. <c10/> oppdatert. Ærlig rest: systematikk fra bølgefront/stråleretning, oppløsning av fringe-flertydighet, den eksakte reproduksjonen av flytester for CARIOQA-PMP / Boeing-AOSense (krever publiserte PSD-er for plattformen) og en JS-playground-forhåndsinnstilling.

seg-f32829ed9cf1 = <b>Cislunar referansesystemreduksjon og en integritetsberegning for månens sørpol (<c1/>).</b> Utvider den lunare ARAIM-motoren med rotasjonen MCI↔MCMF (månesentrert inertiell ↔ månefast) (<c2/> / <c3/>, en forenklet middelrotasjonsmodell med månens sideralrate), selenografisk breddegrad/lengdegrad/høyde (<c4/> / <c5/>) og <c6/> — en landet mottaker i Artemis-området mot et representativt sett med LunaNet-reléer over en passering på { "24" } h, som ærlig kvantifiserer integritetsgapet: med nominell LANS σ_URE på { "30" } m er beskyttelsesnivået endelig, men overstiger en varslingsgrense på { "50" } m for overflateoperasjoner. Ærlig rest: den presise LANS NRHO-efemeriden (en cislunar bane med 3 legemer), den fysiske librasjonen / presesserende månepolen (DE421/SPICE) og et LunaNet TOML-scenario gjenstår som videre arbeid.

seg-5ef720855cc4 = <b>Integritetsstøttemelding for ARAIM, Stanford-diagram som SVG og den åpne ARAIM-referansen (<c1/>, <c2/>).</b> Legger til en eksplisitt <c3/> (σ_URA / σ_URE / b_nom / P_sat / P_const, med WG-C-referanseverdiene for GPS+Galileo og omformerne <c4/> / <c5/> inn i motorene for enkeltfeil <c6/> og konstellasjonsomfattende feil <c7/>), en frittstående renderer <c8/> av Stanford-integritetsdiagrammet (de fire sonene, grensen <c9/>, hjelpelinjene for varslingsgrense, én fargekodet markør per epoke) og <c10/> som dokumenterer algoritmen, ISM, feilhypotesene, kontrakten for beskyttelsesnivå og fordelen med to konstellasjoner. Testene viser gevinsten i geometri/redundans (å slå sammen en andre konstellasjon strammer inn HPL for enkeltfeil) og toleranse for konstellasjonsfeil (brukeren med to konstellasjoner overlever tap av en hel konstellasjon; en bruker med én konstellasjon kan ikke). Ærlig rest: å numerisk gjengi EU ARAIM TN Table A-3 / tilgjengelighetstallet på { "15" }–{ "25" } % mot et versjonslåst reelt TLE-øyeblikksbilde, en Zenodo-post for testdata og å koble <c11/> inn i scenariofilkjøreren.

seg-3607eb34acd9 = <b>IAU 2000B-nutasjon og den fulle inertielle reduksjonen TEME→GCRS/J2000 (<c1/>).</b> Legger til del to og tre av en ekte inertiell reduksjon av referansesystem oppå den eksisterende presesjonen etter IAU { "2006" }: den luni-solare MHB2000-nutasjonsserien med 77 ledd (<c2/>, standard trunkering IAU 2000B, nøyaktig til ~{ "1" } mas) med de fundamentale Delaunay-argumentene og SOFA-nutasjonsmatrisen <c3/>, og Vallado-kjeden AIAA-2006-6980 TEME→TOD (jevndøgnsligningen) → TOD→MOD (nutasjon) → MOD→GCRS (bias-presesjon) eksponert som <c4/> / <c5/>. Serien, argumentene og enhetskonstantene er transkribert fra IAU SOFA / ERFA-referansen <c6/> og validert <b>bit-for-bit</b> mot den publiserte testvektoren <c7/> (Δψ, Δε til { "1e-13" } rad). Ærlig rest: den fulle IAU 2000A-serien med 678 ledd (<{ "0.1" } mas), en numerisk krysskontroll mot ANISE/SPICE på <{ "10" } m og polbevegelse gjenstår som videre arbeid (se <c8/>).

seg-d9b5e459f6eb = Denne utgivelsen leverer Kshanas første <b>ikke-analytiske banepropagator</b> — en Cowell-integrator med en hierarkisk kraftmodell med seks perturbasjoner (to-legeme + sonale J2–J6 + epokestyrt tredjelegeme Sol/Måne + solstrålingstrykk med konisk umbra-/penumbraskygge + atmosfærisk luftmotstand + den post-newtonske relativistiske Schwarzschild-korreksjonen) drevet av et valg mellom to adaptive integratorer (RK4 med step-doubling og det innebygde paret Dormand–Prince RK5({ "4" })) — sammen med et lag for manøver og baneutforming (impulsive og endelige brenninger, en Izzo Lambert-løser og et porkchop-sveip), et alt-PNT-lag med matching av tyngdekart som gjenfinner et 60 minutter langt GPS-nektet spor til under { "500" } m, en pipeline for banebestemmelse med batch + sekvensiell, og en full 17-tilstands tett koblet GNSS/INS UKF med dødregning med kvante-CAI. Hver numeriske funksjon er festet mot analytisk referanse eller en håndutledet lukket form; perturbasjonene som er av som standard, lar de utgitte golden-filene være urørt.

seg-aa8d478f5c10 = <b>Post-newtonsk (Schwarzschild) relativistisk korreksjon (<c1/> + <c2/>).</b> Legger til den dominerende generell-relativistiske perturbasjonen på en jordnær bane — hovedårsaken til den relativistiske perigeumforskyvningen — i formen <c3/> fra IERS / Montenbruck–Gill: <c4/>. Som atmosfærisk luftmotstand er den <b>hastighetsavhengig</b>, så den følger med i høyresiden til integratoren <c5/> via [<c6/>], valgfri og av som standard. Validert selvstendig: på en sirkulær bane kollapser den til den lukkede formen <c7/> (rent radial og <b>utover</b>, komponenter utenfor aksen er eksakt null); dens <b>forhold til to-legeme er det lærebokmessige <c8/> i LEO</b> (signaturen til <c9/>); et tilfelle med radiell hastighet stemmer med den håndforenklede <c10/>; og i propagatoren <b>forstyrrer den banen uten å dissipere den</b> — store halvakse er bevart til godt under en meter/døgn, den strukturelle motsetningen til luftmotstandens monotone forfall. Fordi den er av som standard, er golden-filene for to-legeme/J2/sonale urørt. Tuning av PPN-parametrene (<c11/>,<c12/>) og Lense–Thirring-leddet for rammedragning gjenstår som videre arbeid.

seg-043e831224ab = <b>Konisk umbra- + penumbraskyggemodell (<c1/>), nå brukt av solstrålingstrykket.</b> Oppgraderer den binære eklipsen med umbra-sylinder til en jevn faktor <c2/>: Solen og Jorden modelleres som skiver med tilsynelatende vinkelradier <c3/>, <c4/> og tilsynelatende sentravstand <c5/>, og <c6/> er én minus andelen av solskiven som skjules av jordskiven (arealet av linseoverlappet mellom sirklene) — full sol for <c7/>, total umbra for <c8/>, ringformet for <c9/> og en kontinuerlig penumbra imellom. <c10/> bruker den nå, slik at SRP-kraften avtar jevnt gjennom eklipsen i stedet for å slå av/på. Legger til den nominelle IAU-verdien <c11/>. Validert selvstendig: <c12/> i full sol og <c13/> dypt i umbra (eksakt), en <b>jevn monoton penumbra</b> (<c14/> stiger { "0" } → ~½ ved <c15/> → { "1" } over båndet <c16/>), og den koniske penumbraen <b>strekker seg utover umbra-sylinderen</b> (et punkt som den binære sylinderen kaller fullt opplyst, er <c17/> for kjeglen). Den enklere <c18/> er fortsatt tilgjengelig; solrandmørkning og skyggen fra den oblate Jorden gjenstår som videre arbeid.

seg-8d1c16019f3c = <b>Innebygd integrator Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Legger til det standard innebygde Butcher-tabellparet Dormand–Prince ({ "1980" }) ved siden av den eksisterende RK4-driveren med step-doubling: sju FSAL-trinn gir en 5. ordens løsning og et 4. ordens feilestimat fra ett sett evalueringer ({ "7" } mot { "11" } funksjonskall per steg), et billigere estimat av lokal feil. Den adaptive driveren gjenbruker den samme RMS-feilnormen og stegregulatoren <c4/>, så den er et direkte alternativ; <c5/> eksponerer den på kraftmodellen for baner. Validert selvstendig: det innebygde feilestimatet er <b>O(h⁵)</b> (å halvere steget kutter det ~{ "32" }×); DP5({ "4" }) integrerer <c6/> til <c7/> og den harmoniske oscillatoren over { "50" } perioder med energibevaring til <{ "1e-6" }; den når det samme endepunktet ved samme toleranse med <b>færre funksjonsevalueringer</b> enn step-doubling (uten å ofre nøyaktighet); og <c8/> klarer den samme porten med analytisk referanse som RK4-stien — <b>sub-meter mot den eksakte Kepler-løsningen med universelle variabler over en { "24" } h LEO-bane</b> — mens de to driverne stemmer overens til <{ "1" } m på en J2..J6-bane (ingen lukket form). Høyere innebygde par (RKF7({ "8" }) / DOP853) gjenstår som videre arbeid.

seg-cca3c00757d6 = <b>Atmosfærisk luftmotstand koblet inn i propagatoren som dens første hastighetsavhengige kraft (<c1/> + <c2/> + <c3/>).</b> Legger til den <b>stykkvis eksponentielle atmosfæren fra Vallado Table 8-4</b> <c4/> ({ "28" } bånd fra havnivå forbi { "1000" } km, avgrenset under overflaten) og den kvadratiske luftmotstanden <c5/> mot den <b>medroterende atmosfæren</b> <c6/> (<c7/>). Fordi luftmotstand avhenger av hastighet, får <c8/> en ny <c9/>, og høyresiden til integratoren sender nå hastighet (<c10/>); den rene posisjonsavhengige <c11/> er uendret, så de konservative leddene og golden-filene er urørt. Validert selvstendig: tettheten <b>forankres i havnivåverdien { "1.225" } kg/m³</b>, avgrenses under overflaten, <b>avtar monotont</b> gjennom LEO, ligger i solmiddelbåndet ~{ "1e-12" } kg/m³ ved { "400" } km, og dens <b>gjenvunne lokale skalahøyde (≈ { "58" } km ved { "400" } km)</b> er fysisk; luftmotstanden <b>motvirker den medroterende relative hastigheten</b> med størrelsen ~{ "2e-6" } m/s² i LEO for <c12/>; og — den sentrale signaturen — luftmotstand er <b>dissipativ</b>: en bane på { "300" } km mister spesifikk energi <b>monotont</b> og store halvakse <b>forfaller med en avgrenset ~km/døgn</b>, der vakuum-grunnlinjen bevarer energi til <{ "1e-9" }. NRLMSISE-00-termosfæretettheten (klausulen om tetthet for luftmotstand på < { "5" } %) gjenstår som videre arbeid.

seg-0d20f02ef85f = <b>Solstrålingstrykk koblet epokestyrt inn i propagatorens kraftmodell (<c1/> + <c2/>).</b> Legger til <b>kanonkule-SRP-modellen</b> <c3/> med en <b>eklipsefaktor med sylinderskygge</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): strålingstrykket <c5/> fra den moderne totale solinnstrålingen på { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), flukstapet etter kvadratloven <c6/> og det radiale dyttet <b>bort fra Solen</b>. Den går på <b>den samme epokestyrte høyresiden</b> som tredjelegemet, og henter Solen fra <c7/> én gang ved den framskrevne epoken <c8/>, som deles mellom tredjelegemet Sol og SRP. Kan settes sammen: <c9/>. Validert selvstendig mot håndutledede signaturer: <b>strålingstrykket ved 1 AU festes til lærebokverdien ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; SRP for en fullt opplyst LEO-satellitt er <b>bit-identisk</b> med kanonkuleformelen, peker <b>bort fra Solen</b> og ligger i <b>båndet ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> for cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>å doble avstanden til Solen firedeler størrelsen</b> (kvadratloven); <b>sylinderskyggen formørker bare umbra-sylinderen</b> (anti-solvendt <em>og</em> innenfor én jordradius fra linjen Jord–Sol) og gir <b>nøyaktig null</b> SRP i eklipse; og i propagatoren <b>forstyrrer SRP en LEO-bane med en liten avgrenset størrelse som skalerer ~lineært med A/m</b> — mens en modell uten perturbasjoner forblir bit-for-bit tidsuavhengig, slik at golden-filene for to-legeme/J2/sonale er urørt. Den koniske umbraen/penumbraen (jevn ν ∈ [{ "0,1" }]), atmosfærisk luftmotstand og ekstern kryssvalidering mot GMAT/Orekit gjenstår som videre arbeid.

seg-d3f819c21660 = <b>Epokestyrt tredjelegeme Sol/Måne koblet inn i den tidsvarierende høyresiden i propagatoren (<c1/> / <c2/>).</b> Tredjelegemeperturbasjonen er ikke lenger et frittstående kraftledd — den integreres nå av Cowell-propagatoren som en genuint <em>tidsvarierende</em> kraft: hver evaluering av høyresiden sampler posisjonene til Sol/Måne fra <c3/> ved den <b>framskrevne epoken <c4/></b> (gjenbruker <c5/> for omregningen mellom dager og århundrer), slik at perturberne beveger seg langs banene sine under integreringen i stedet for å være frosset ved starten. Kan settes sammen med hvilken som helst tyngdemodell (<c6/>). Validert selvstendig: Sol-leddet i høyresiden er <b>bit-identisk</b> med <c7/> evaluert ved efemeridens posisjon for det øyeblikket ved både <c8/> og <c9/> (som beviser koblingen { "86400" } s ↔ { "1" } døgn ↔ 1/36525 århundre eksakt), perturberen <b>forflytter seg ~{ "2.6" }·10⁹ m/døgn</b> mellom prøvene (ikke frosset), de <b>øyeblikkelige tidevannsstørrelsene i LEO</b> treffer lærebokbåndene ~{ "5" }·{ "10" }⁻⁷ m/s² (Sol) og ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Måne, ≈ { "2" }× Solen), hvert legeme <b>forstyrrer banen over et døgn målbart, men forblir avgrenset</b>, og den samme starttilstanden propagert ved <b>epoker et kvart år fra hverandre gir en annen bane</b> (tidevannsaksen roterer { "90" }°) — mens en modell uten noen av legemene aktivert er bit-for-bit tidsuavhengig, slik at golden-filene for to-legeme/J2/sonale er urørt. Efemeridenøyaktighet på DE-nivå og ekstern kryssvalidering mot GMAT/Orekit gjenstår som videre arbeid.

seg-0a517f6c4b1b = <b>Månens efemeride med lav presisjon (<c1/>), som fullfører paret Sol/Måne for tredjelegemer.</b> Legger til den lunare serien med lav presisjon fra Montenbruck & Gill (<c2/>) ved siden av Sol-modellen, slik at den legemeuavhengige <c3/> nå kan drives av begge himmellegemer med <b>ingen ekstern DE/SPK-kernel</b>. Validert selvstendig mot håndutledede lunare signaturer: den geosentriske avstanden holder seg innenfor den reelle <b>perigeum-/apogeumsonen (~{ "356 500" }–{ "406 700" } km)</b> over en måned og <b>månedsmiddelet gjenvinner den store halvaksen på ~{ "384 400" } km</b>; den <b>ekliptiske breddegraden overstiger aldri banehelningen på ~{ "5.3" }° for månebanen</b> (kontrollert ved å projisere på ekliptikkens pol i ekvatorialkoordinater, som validerer breddegradsserien og skråstillingsrotasjonen sammen); Månens <b>retning kommer tilbake til innenfor { "1" }° etter én siderisk måned ({ "27.3217" } d)</b> og dens <b>daglige bevegelse holder seg i det fysiske båndet { "12" }–{ "15" }°/døgn</b>; og tredjelegemeperturbasjonen fra Månen på en LEO-satellitt har <b>størrelsen ~{ "1.1" }·{ "10" }⁻⁶ m/s² fra læreboka</b> (≈ det dobbelte av Solens). Posisjonsnøyaktighet på DE-nivå, atmosfærisk luftmotstand og SRP gjenstår som videre arbeid.

seg-8b7025e00dd1 = <b>Tredjelegemetyngde (Sol) med en innebygd efemeride med lav presisjon (<c1/>, <c2/>).</b> Legger tredjelegemeperturbasjonen til kraftmodellen: <c3/> (direkte tiltrekning minus det indirekte leddet som det geosentriske systemet må trekke fra), med Sol-posisjonen levert av den nye modulen <c4/> med analytisk serie med lav presisjon fra Montenbruck & Gill — <b>ingen ekstern DE/SPK-kernel nødvendig</b> for en kjøring med lav presisjon. Validert selvstendig: akselerasjonen <b>stemmer med den eksakte gradienten av sitt eget forstyrrende potensial</b> (<c5/>), perturbasjonen <b>forsvinner i geosenteret</b> og har <b>størrelsen ~{ "5" }·{ "10" }⁻⁷ m/s² på en LEO-satellitt fra læreboka</b>, og Sol-efemeriden treffer håndutledede J2000-anker — <b>avstand i perihel ≈ { "1.471" }·10¹¹ m</b>, <b>deklinasjon ≈ −{ "23" }° nær desembersolverv</b>, en tilsynelatende bevegelse på <b>≈ { "1" }°/døgn</b> (≈ { "90" }° per kvartår), og en avstand som holder seg innenfor jordbanens sone { "0.983" }–{ "1.017" } AU over et helt år. Leverer tredjelegemehalvdelen av kraftmodelltrinnet i milepælen for den numeriske propagatoren (Månen leveres i en følgeoppføring ovenfor); posisjonsnøyaktighet på DE-nivå, atmosfærisk luftmotstand og SRP gjenstår som videre arbeid.

seg-99fd6ae1ea09 = <b>Kraftmodell med sonale harmoniske J2–J6 (<c1/> / <c2/>).</b> Utvider kraftmodellen i Cowell-propagatoren utover J2 til hele jordens sonale felt til og med grad { "6" } (standard publiserte EGM-96 unormaliserte <c3/>), koblet inn i propagatoren som <c4/>. Akselerasjonen er den <b>eksakte analytiske gradienten</b> av det forstyrrende sonale potensialet <c5/> (Legendre-polynomer ved oppadgående rekursjon), validert på tre uavhengige måter: den <b>reduseres til den 666-vektor-validerte <c6/> til maskinpresisjon</b> når den begrenses til <c7/>; den <b>stemmer med den numeriske gradienten av sitt eget potensial</b> gjennom hele J2..J6-feltet (gullstandardkontrollen for konservative felt); og de odde leddene <c8/> mot de partalls <c9/>/<c10/> viser sin <b>karakteristiske nord–sør-(anti)symmetri</b> under <c11/> — asymmetrien med pæreform. En propagert J2..J6-bane bevarer total energi (kinetisk + sentral + sonalt potensial) til ~{ "1e-8" } over et døgn og forstyrrer banen med bare J2 med en liten ikke-null størrelse. Dette leverer trinn 2 («J2–J6 sonale harmoniske») i milepælen for den numeriske propagatoren; det tesserale EGM-feltet av høy grad, luftmotstand, SRP, tredjelegeme og ekstern kryssvalidering mot GMAT/Orekit gjenstår som videre arbeid.

seg-59f0ba5a6269 = <b>Numerisk (Cowell) banepropagator (<c1/>).</b> Kshanas første <b>ikke-analytiske</b> propagator (resten av banestakken er analytisk SGP4/SDP4): den kobler kraftmodellen to-legeme + J2 (<c2/>) inn i den adaptive RK4-driveren med step-doubling (<c3/>) som <c4/>, med en bryter <c5/>. Validert mot <b>analytisk referanse som er sterkere enn et numerisk verktøy ville vært</b>: den uforstyrrede banen gjengir den <b>eksakte Kepler-løsningen med universelle variabler til sub-meter over en 24-timers LEO-bane</b> (en strammere port enn «mot en numerisk referanse < { "10" } m» som milepælen formulerer), spesifikk energi og dreieimpuls bevares til ~{ "1e-9" } relativt, og J2-nodalregresjonen gjengir den lukkede formen <c6/> til førsteordens teori (innenfor { "2" } %, residualen O(J2²)). Legger også til <c7/>, en Newton-løser for Keplers ligning som <b>returnerer <c8/> i stedet for et stille feil svar</b> når den ikke konvergerer innenfor et avgrenset iterasjonsbudsjett (tilfellet <c9/> nær perigeum). Ærlig omfang: kraftmodellen er bare to-legeme + J2 — det tesserale EGM-feltet av høy grad ({ "200" }×{ "200" } + laster), luftmotstand (NRLMSISE-00), SRP, tredjelegemekrefter og en ekstern kryssvalidering mot GMAT/Orekit gjenstår som videre arbeid.

seg-d4c7c29f09d1 = <b>60-minutters GPS-nektet matching av tyngdekart til < { "500" } m (<c1/>).</b> Utdyper alt-PNT-laget mot valideringsmålet <em>Quantum Wayfarer</em> i ESA NAVISP: et kjøretøy flyr et spor på ~{ "700" } km gjennom et helt ett timers GNSS-bortfall — der den inertielle løsningen driver til <b>≈ { "70" } km</b> — og et kaldatom-gravimeter pluss en <b>hierarkisk grov-til-fin</b> partikkel-/rutenettmatcher gjenvinner den konstante INS-driften til <b>≈ { "145" } m</b> (< { "500" } m), en reduksjon på > { "480" }×. Gravimeterets reelle hvitstøygulv injiseres som en <b>deterministisk seedet</b> sekvens, slik at matcheren aldri får støyfri referanse, men kjøringen likevel er eksakt reproduserbar (verifisert bit-identisk, og stabil til noen få meter over støyrealisasjoner). En test på regresjonsnivå viser at raffineringen er <em>nødvendig</em> — et enkelt grovt rutenett stopper opp på ~{ "2" } km, og bare den tretrinns raffineringen bryter barrieren på { "500" } m. Nytt innsjekket scenario <c2/>. Raden <c3/> forblir ærlig <b>delvis</b> (fortsatt ingen medfølgende EGM2008-kart) med bevisene oppdatert til resultatet < { "500" } m over 60 minutter. Ærlig omfang uendret: lavgrads sfærisk-harmonisk felt + syntetiske mascons; en Monte Carlo over realisasjoner av feil i kartrepresentasjonen gjenstår som videre arbeid.

seg-4262a99328bb = <b>Register over overdrevne påstander + regresjonsvakt (<c1/>, <c2/>).</b> Avslutter sporet for ærlighet/fjerning av påstander: de fjorten overdrivelsene en tidligere revisjon katalogiserte (<c3/>…<c4/>) er nå alle GREEN — de sterke påstandene (<c5/> koblet klokke+posisjon-Kalman, <c6/> jamming J/S→C/N₀→tap av lås, <c7/> Mach–Zehnder CAI-fysikk, <c8/> ARAIM HPL/VPL) er <b>erstattet av leverte, testede funksjoner</b> i stedet for mykere formuleringer, og de gjenværende radene er fjernet som påstander slik at de stemmer med koden. En ny CI-test skanner de levende offentlige flatene (<c9/>, <c10/>, <c11/>, <c12/>) og feiler hvis en utfaset, uforbeholden overdrivelsesformulering dukker opp igjen, slik at en GREEN-rad ikke i det stille kan regrediere. «Integritets»-kvalitetsmålet per kjøring forblir ærlig merket <em>filterets selvkonsistens</em> (ikke luftfartsintegritet); den reelle ARAIM HPL/VPL vises separat slik at de to aldri blandes sammen.

seg-27da62a7ff63 = <b>Navigasjon med matching av tyngdekart (GPS-nektet alt-PNT).</b> En ny <c1/> legger til alt-PNT-laget som studiene om tyngdekartmatching i ESA NAVISP (<em>Quantum Wayfarer</em> / QT-CCI) etterlyser: en <b>målemodell for kaldatom-gravimeter</b> der hvitstøygulvet er utledet fra ASD for CAI-akselerometeret (<c2/>); et <b>sfærisk-harmonisk felt for tyngdeanomali</b> av lav grad, fullt normalisert (validert mot de lukkede Legendre-funksjonene <c3/>, <c4/>, <c5/> og en håndutledet enkeltleddsanomali på { "1.897" } mGal) pluss syntetiske <b>mascons</b> for de lokale egenskapene av høy grad; og et <b>partikkelfilter for matching av tyngdekart</b> (sammensatt av <c6/> + <c7/>) som gjenfinner et GPS-nektet spor fra anomalisekvensen det flyr gjennom. En innsjekket NAVISP-benchmark (<c8/>) kutter en fri inertiell drift på ~{ "73" } km til noen få km. Ærlig omfang: Kshana inkluderer <b>ikke</b> det fulle koeffisientsettet EGM2008 { "2190" }° — feltet er lav grad + mascons, ikke et reelt kart med høy oppløsning; EGM/EIGEN-laster, magnetisk kart, terrengstøttet SLAM og kobling av <c9/> i scenariomotoren med et SVG-driftsdiagram gjenstår som videre arbeid. <c10/> "Gravity-map / alt-PNT navigation" → <b>delvis</b>.

seg-d028a2db7837 = <b>Manøvermodellering og et første fotfeste for baneutforming.</b> En ny <c1/> legger til det første laget for baneutforming over SGP4: impulsive ΔV-noder som anvender en hastighetsdiskontinuitet og fører en kovarians på { "6" }×{ "6" } videre (deterministisk brenning ⇒ identitet som tilstandsovergang; utførelsesfeilens kovarians roteres fra brennsystemet — ECI eller LVLH — inn i hastighetsblokken), en integrasjon av endelig brenning (konstant skyv over en brennbue med masse som tilstand) der oppnådd ΔV kontrolleres mot den lukkede <b>Tsiolkovsky</b>-rakettligningen til bedre enn { "0.01" } %, en <b>Izzo-2015</b>-løser for <b>Lambert</b> med én runde (<c2/>, <c3/>, flytid ⇒ <c4/>, <c5/>), en eksakt <b>Kepler-propagator</b> med universelle variabler (to-legeme-referanse) og et <b>porkchop</b>-sveip som avbilder et rutenett av oppskytingsepoke × ankomstepoke til avgangs-C3 og ankomst-V∞, gitt ut som en 2-D JSON-array for konturtegning i nettleseren. Valideringen er selvstendig og sterkere enn en avlesning fra en veiledning: hver Lambert-utdata sendes tur-retur gjennom Kepler-propagatoren (den må lande tilbake på <c6/>), og porkchop-minimumet kontrolleres mot den analytiske Hohmann-overføringens C3-gulv for to koplanare sirkulære baner. Kshana posisjonerer dette som ytelsessimuleringslaget over GMAT/Orekit, ikke en erstatning (grener med flere runder og en reell planetefemeride er utenfor omfanget). Ti tester.

seg-cbdd0e56d89f = <b>Full 17-tilstands tett koblet GNSS/INS UKF med dødregning med kvante-CAI.</b> En ny <c1/> bærer hele den inertielle navigasjonstilstanden et tett koblet filter estimerer — <c2/> ({ "17" } tilstander) — propagert gjennom strapdown-mekaniseringen drevet av målt spesifikk kraft og vinkelrate, med den småvinkelbaserte rotasjonen <c3/> fra kropp til inertiell slik at holdningsfeil kobler seg inn i horisontal akselerasjon (standard INS-tiltkobling). Under et GNSS-bortfall ruller den videre på IMU alene; prosessstøyen for hastighets-random-walk er den utledede <c4/> (<c5/>) for kaldatom-interferometer-akselerometeret, slik at dødregningsdriften er den som er begrenset av kvantesensoren — et bortfall på 120 sekunder holder seg begrenset til noen hundre meter mot de kilometerne et fritt INS i navigasjonsklassen ville nådd. Oppdateringen med pseudoavstand/avstandsrate går gjennom det delte unscented-filteret (med α = { "1" } for velkondisjonerte vekter ved denne tilstandsstørrelsen). Fem tester: identitet i målemodellen, integrasjon med konstant hastighet med perfekt IMU, GNSS-støtte, estimering av akselerometerbias og benchmarken for CAI-begrenset 120-s bortfall.

seg-087521bb32b7 = <b>Ærlig innramming av kvantepositioneringen.</b> Den overordnede beskrivelsen er nå gjennomgående en <b>"PNT-resilience simulator with quantum-sensor performance models"</b> i README-slagordet, siteringslinjen, <c1/> (tittel + sammendrag) og bannergrafikken — i stedet for den løsere markedsføringsformuleringen "hybrid quantum/classical PNT simulator". Avsnittet <em>What it is / is not</em> i README får en eksplisitt avgrensning <b>"It is not (yet)"</b> (ikke en fysikkmotor for atominterferometri fra første prinsipper, ikke en GNSS-mottaker/PVT-løser, ikke et verktøy for oppdragsutforming), og en ny <c2/> på toppnivå gjør <b>kvantefysikklaget til et P2-punkt</b> (Mach–Zehnder CAI-fase, projeksjonsstøy, vibrasjonstensor) slik at leserne vet at fysikken fra første prinsipper er planlagt og kommer, ikke forlatt. Ingen endring i oppførsel eller API.

seg-f8fa36190ec7 = Avveiningsstudie for konstellasjonsutforming: Walker-utformingssveip med en Pareto-front, JSON for revisit-tid og en validering av Walker-formelen på under én kilometer.

seg-31518e92d8cf = <c1/> får <c2/>, som kjører et rutenett <c3/> (f.eks. en avveining på { "3" }×{ "3" }) ved en fast inklinasjon og tabulerer, per utforming, dekningsandelen, verste PDOP og maks./middels revisit-gap; <c4/> flagger de ikke-dominerte utformingene (færre satellitter, mer dekning, lavere PDOP, kortere revisit), og <c5/> serialiserer cellene og Pareto-fronten — inkludert revisit-tidsfeltene — som JSON. Ny validering fester generatoren til Walker-formelen <c6/>: satellitter i samme spor i nabobaner vises å avbildes på hverandre av en eksakt rotasjon <c7/> til <b>under { "1" } km over hele { "24" } h</b> med SGP4-propagering (J2-pustingen med kort periode er fellesmodus og kanselleres), og sporene i banen er bekreftet med avstanden <c8/> i middel. Bygger på det innsjekkede øyeblikksbildet av reelle Celestrak <c9/> fra 2021-07-28 (<c10/>, brukt av testene for scenariodekning og SP3-tur-retur).

seg-71d257587c28 = <b>Avansert overføring av tid og frekvens: TWSTFT, GNSS common-view, PPP, optisk, IEEE-1139 potenslov-tilpasning og et klokkeensemble.</b> En ny <c1/> bygger de operative overføringsmetodene på de eksisterende lukkede formene for Sagnac/common-view og Allan-stabilitetsverktøyene. <c2/> gir Sagnac-korreksjonen for Two-Way Satellite Time and Frequency Transfer som sløyfesummen over tre hopp, nøyaktig lik BIPMs lukkede form <c3/> (krysskontrollert av den uavhengige <c4/>); <c5/> gir ut en døgnserie <c6/> og dens TDEV. <c7/> tar enkeltdifferanser mellom to syntetiske bakkestasjoner slik at satellittklokken kanselleres. <c8/> + <c9/> er den ionosfærefrie PPP-kombinasjonen og løsningen for mottakerklokke mot en (syntetisk) referanse i SP3-klassen, som kansellerer førsteordens ionosfære eksakt. <c10/>, <c11/> og den lognormale <c12/> med enhetsmiddel modellerer turbulensindusert scintillasjon i en optisk fri-rom-lenke. <c13/> er en full IEEE-1139 minste-kvadraters tilpasning av <c14/> med fem koeffisienter til Allan-variansekurven (alle fem kanoniske støyprosesser samtidig) med den dominerende prosessen rapportert per τ-tiår. <c15/> danner en invers-varians-vektet papirtidsskala hvis Allan-deviasjon faller strengt under den beste bidragsytende klokken. { "31" } enhetstester; valideringsmålene er lukkede former og syntetisk referanse — en reell innlesing av BIPM Circular-T / IGS SP3 gjenstår.

seg-c3ab93e7324f = IONEX-ionosfærekart: filparser, tidsinterpolasjon og skrå obliquity-kartlegging.

seg-7b94a515ce2b = <c1/> får <c2/>, som leser filformatet IONEX (headerens rutenettdefinisjon + blokker <c3/>) inn i en sekvens av <c4/>, normaliserer filens breddegradsrekkefølge fra nord til sør til et <c5/> med positivt steg og skalerer verdier med <c6/>. <c7/> blander to påfølgende kart til en spørreepoke, og <c8/> / <c9/> avbilder vertikal TEC på en skrå stråle via enkeltlags tynnskall-faktoren <c10/> (<c11/>). Sammen med den eksisterende rutenettmodellen gjør disse et målt globalt ionosfærekart fra IGS til en brukbar skrå forsinkelse.

seg-2ed90763cf11 = Konstellasjonsutforming: dimensjonering med streets-of-coverage + sammenligning av flere konstellasjoner.

seg-326e8957bb10 = <c1/> får <c2/>, en idealisert løser for minste antall satellitter med streets-of-coverage — fra den eksisterende halvvinkelen for dekning <c3/> og gatens halvbredde <c4/> dimensjonerer den den nær-polare konstellasjonen for kontinuerlig enkeltdekning globalt som <c5/> baner (f.eks. trenger et plan med 4 satellitter i GPS-høyde { "2" } baner, { "8" } satellitter), og rapporterer <c6/> når satellittene er for spredt til å danne en kontinuerlig gate. <c7/> er verktøyet for sammenligning av flere konstellasjoner: det skårer hver navngitte Walker-utforming på samme stasjon/vindu via <c8/> og returnerer dekning / PDOP / størrelse side ved side. Ærlig omfang: den sømeksakte Rider-korreksjonen ved grensen mellom motroterende plan og en 3-D dekningsglobus gjenstår som videre arbeid.

seg-90f5ec9ff4ae = Spoof-deteksjon i flere lag: paritetsdetektor for RAIM-konsistens + fusjon av lag.

seg-a0e4878bea45 = <c1/> får det tredje og siste deteksjonslaget og fusjonstrinnet: <c2/> tilpasser med minste kvadrater posisjons-/klokkeløsningen til et redundant sett pseudoavstander og tester den gjenværende vektede kvadratsummen av residualer mot terskelen χ²<c3/> — og flagger en forskjøvet <em>delmengde</em> av satellitter mens en <em>fellesmodus</em>-skjevhet (absorbert av mottakerklokken) korrekt blir stående usynlig for RAIM, ikke tilslørt. <c4/> kombinerer lagene for paritet, AGC og SQM til én vektet beslutning som registrerer hvilke lag som utløste. En Monte Carlo karakteriserer detektoren: empirisk <b>P_fa ≈ { "0.068" }</b> mot et utformingspunkt på { "0.05" }, med <b>sannsynligheten for uteblitt deteksjon som faller fra { "0.885" } ved en spoofing-skjevhet på 2σ til { "0.16" } ved 8σ</b>. Ærlig omfang: krysskontroll mot bestemte publiserte (Spirent / ION GNSS+) testvektorer for spoofing krever de eksterne datasettene og gjenstår som videre arbeid.

seg-2413b3d10f5b = <b>Valideringsensemble for koblet mot frakoblet Kalman.</b> En Monte Carlo med 100 forsøk i <c1/> kvantifiserer verdien av å ta med kryss-kovariansen posisjon↔klokke: en trofast inline-grunnlinje uten kobling (validert bit-for-bit mot den eksisterende <c2/>) behandler de samme dataene med krysblokkene nullet, og etter nesten-degenererte pseudoavstander pluss en bestemmelse med bare klokke gjenvinner det koblede filteret posisjon til <b>{ "2.97" } m RMS mot { "48.8" } m for det frakoblede filteret, og vinner { "97" } av { "100" } forsøk</b> — klokkebestemmelsen skjerper posisjonen bare gjennom korrelasjonen som den frakoblede pakken forkaster. Dette fullfører valideringspakken for Kalman-korrekthet (Joseph-form, PSD-sikkerhet, NEES/NIS-konsistens og nå ensemblet for det koblede filteret).

seg-804f35695553 = <b>Pipeline for banebestemmelse (batch + sekvensiell).</b> En ny <c1/> gjenvinner en satellitts banetilstand <c2/> fra avstandssporing fra bakkestasjoner og setter sammen tre eksisterende deler: kraftmodellen to-legeme + J2 (<c3/>) og RK4-integratoren (<c4/>) propagerer en kandidattilstand over buen, en målemodell for avstand predikerer hver stasjonsavstand, og Gauss–Newton-batchkorrektoren (<c5/>) driver kandidaten til beste tilpassede tilstand (<c6/>). Den samme dynamikken og avstandsmodellen driver også en <b>sekvensiell</b> rekursiv bestemmelse på det eksisterende unscented-filteret (<c7/>). Fire tester validerer den: avstandsprediksjon over buen; <b>batchgjenfinning til sub-meter / mm·s⁻¹ fra støyfrie avstander</b>; batchgjenfinning til <b>~{ "2" } m med en residual etter tilpasning ved støygulvet på { "5" } m</b> (signaturen til en konsistent minste kvadraters tilpasning); og sekvensiell gjenfinning til innenfor titalls meter. Ærlig omfang: målinger av avstandsrate/Doppler og vinkler, en analytisk J2-tilstandsovergangsmatrise og masking av stasjonssynlighet er videre arbeid.

seg-0a81039e510c = <b>Tett koblet GNSS/INS UKF-navigator.</b> En ny <c1/> kobler den eksisterende unscented Kalman-kjernen (<c2/>) til en fungerende tett koblet navigator over den åttetilstands <c3/> (ECEF-posisjon/hastighet pluss mottakerens klokkebias og -drift i avstandsenheter). Den tar inn de <b>rå satellittmålingene</b> — <c4/> (<c5/>) og <c6/>/Doppler (<c7/>) — i stedet for en ferdigdannet posisjonsbestemmelse, slik at <c8/> (med <c9/>/<c10/>/ <c11/>) fortsetter å korrigere <b>med færre enn fire satellitter</b> og ruller gjennom GNSS-bortfall på sin propagerte dynamikk. Fem tester validerer den ende-til-ende, inkludert akseptscenarioene fra milepælen: geometrien for pseudoavstand/Doppler mot håndverdier; støyfri konvergens til <b>sub-meter</b> med fem satellitter; et tilfelle med <b>tre satellitter</b> som konvergerer fra ~{ "212" } m til ~{ "13" } m der en PVT fra øyeblikksbilde ikke engang kan dannes; et <b>bortfall på 120 sekunder</b> med konstant hastighet innenfor { "50" } m; og — hovedakseptansen — en <b>30 minutter lang kurvet LEO-passering</b> (reell to-legeme + J2-bane) med et <b>GNSS-bortfall på 120 sekunder</b>, holdt til <b>{ "0.77" } m RMS over passeringen</b> og <b>{ "2.9" } m i verste tilfelle gjennom bortfallet</b>. Den banebaserte rullingen setter sammen den eksisterende tyngdekraftmodellen (<c12/>) og RK4-integratoren (<c13/>) til UKF-prosessmodellen (<c14/>), slik at filteret følger banens krumning — noe en rulling med konstant hastighet ikke kan (krumningen alene er ~{ "58" } km over { "120" } s i LEO). Ærlig omfang: den banebaserte rullingen bruker kraftmodellen to-legeme + J2 i stedet for rå IMU-spesifikk kraft (for en ikke-drevet orbital plattform sammenfaller de); å ta inn en feiltilstand for strapdown-IMU og iono/tropo-korreksjoner i sløyfen er videre arbeid.

seg-792f25a4a1da = <b>Målemodell for map-matching (navigasjon referert til terreng/tyngde).</b> En ny <c1/> leverer målemodellen som gjør det eksisterende partikkelfilteret med sekvensiell viktighetsresampling (<c2/>) til en fungerende GPS-nektet navigator: <c3/> (en gaussisk sannsynlighet for feltmatch) og <c4/>, som sampler et hvilket som helst georeferert referansefelt — terrenghøyde (TRN) eller en tyngdeanomali — ved en partikkels posisjon og vekter den etter hvor godt den stemmer med kjøretøyets målte verdi. Feltet er en hvilken som helst sampler <c5/>, så det kan settes sammen med det bilineære rutenettet i <c6/> eller en closure. To tester forankrer det — sannsynligheten topper seg (={ "1" }) ved perfekt match og faller til <c7/> ved én sigma, og et partikkelfilter over en markant syntetisk terrengflate gjenfinner den sanne posisjonen til innenfor { "0.1" }. Ærlig omfang: de reelle referansekartene (SRTM-høyde, EGM/EIGEN-tyngdeanomali) og lasterne for dem er videre arbeid.

seg-9240e95a5058 = <b>Integritet for cislunar PNT (lunar ARAIM).</b> En ny <c1/> anvender ARAIM-motoren MHSS på jordsiden på en navigasjonstjeneste i LunaNet-stil på månen med månens parametere (<c2/> mot GPS { "0.6" } m, <c3/>): lunare konstanter, en selenosentrisk øst/nord/opp-basis og hjelper for himmelgeometri, og <c4/> (HPL/VPL). Tre tester forankrer det — den ortonormale selenosentriske basisen, geometrien for skrå avstand og den eksakte lineære skaleringen av beskyttelsesnivået med <c5/> (månens { "30" } m gir et { "50" }× større beskyttelsesnivå enn den samme geometrien ved GPS { "0.6" } m — den kvantitative grunnen til at PNT-integritet på månen er vanskelig). Ærlig omfang: den presise LANS NRHO-efemeriden, feilbudsjettet for signal i rommet og reduksjonen av referansesystemet MCI↔MCMF er videre arbeid.

seg-4a43e2ff83d7 = <b>Todelte (høypresisjons) julianske datoer.</b> En ny <c1/> legger til <c2/>, en juliansk dato delt i en heltallig <c3/> og en brøkdel <c4/> i <c5/> (konvensjonen i SOFA/hifitime), med <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Differanser mellom nære epoker forblir eksakte til gulvet for <c11/> der en JD med én <c12/> taper ~{ "50" } µs nær J2000. Fire tester forankrer den: tur-retur, normalisering av brøkdelen, eksakt gjenfinning av mikrosekunder (med feilen for én <c13/> demonstrert ved siden av) og additiv/reversibel sekundaritmetikk.

seg-8eef92a85711 = <b>Skriver for CCSDS OMM (Orbit Mean-Elements Message).</b> En ny <c1/> utfyller efemeriskriveren <c2/> med meldingen med middelelementer: <c3/> avbilder SGP4/TLE-middelelementer til OMM-enheter (middelbevegelse i rev/day, vinkler i grader, pluss <c4/>), og <c5/> serialiserer KVN-formen CCSDS 502.0-B-2 på standardiseringsløpet — slik at en Kshana-bane kan brukes av ethvert verktøy som forstår OMM i stedet for som en spesialtilpasset TLE. To tester forankrer enhetskonverteringen TLE→OMM (≈ { "15.5" } rev/day, { "51.6" }° inklinasjon osv.) og at de påkrevde KVN-nøkkelordene finnes. Ærlig omfang: KVN-formen og TLE-avbildningen leveres her; XML-gjengivelsen (<c6/>) og en tur-retur med en referanseparser er videre arbeid.

seg-ca2b730b5cc3 = <b>Partikkelfilter med sekvensiell viktighetsresampling.</b> En ny <c1/> legger til den ikke-lineære, ikke-gaussiske estimatoren bak kartstøttet, GPS-nektet navigasjon (terrengreferert eller matching av tyngdekart): <c2/> (propager partikler gjennom dynamikken + gaussisk prosessstøy), <c3/> (revekt etter en sannsynlighet for måling per partikkel), systematisk <c4/>, degenerasjonsmonitoren <c5/> og det vektede middelestimatet. Seks tester forankrer den deterministiske kjernen eksakt — ESS over { "1" }…N, systematisk resampling som velger indekser i forhold til vekt, den konvekse kombinasjonen i det vektede middelet, en gaussisk sannsynlighet som trekker estimatet mot målingen, resampling til uniform oppførsel og seedet determinisme i predict. Ærlig omfang: motoren leveres her; referansekartene (SRTM-høyde, EGM-tyngdeanomali) og målemodellen for kart er videre arbeid (rutenett + bilineær sampler i <c6/> ville tjent et tyngde-/terrengkart like godt).

seg-564ad319685e = <b>TEC-ionosfærekart i IONEX-stil.</b> En ny <c1/> legger til et alternativ med målt ionosfære til den kringkastede Klobuchar-modellen: en <c2/> (et regulært breddegrad/lengdegrad-rutenett med vertikal TEC, et globalt ionosfærekart fra IGS) med bilineær interpolasjon ved et gjennomtrengningspunkt (<c3/>, avgrenset utenfor rutenettet) og førsteordens forsinkelse <c4/> (<c5/>, <c6/>). Fire tester forankrer den: <c7/> ved L1 med skaleringen <c8/>, nodeeksakt interpolasjon, bilineære midtpunkter som midler hjørnene og kantavgrensede spørringer utenfor rutenettet. Ærlig omfang: rutenettet og interpolasjonen leveres her; parsing av filformatet IONEX, tidsinterpolasjon mellom kart og kartleggingsfunksjonen for skrå stråle er videre arbeid.

seg-26c7b53cbc8c = <b>Geometriske korreksjoner for tidsoverføring (Sagnac + GNSS common-view).</b> En ny <c1/> legger til de to deterministiske effektene en reell klokkesammenligning må ta hensyn til, som supplerer den stokastiske toveismodellen i <c2/>: <c3/> (<c4/>, forsinkelsen fra den roterende Jorden — titalls ns for kontinentale grunnlinjer) og <c5/>, enkeltdifferansen for GNSS common-view som kansellerer satellittklokkefeilen eksakt og gjenvinner forskjellen mellom stasjonene. Tre tester forankrer dem på eksakte referanser: Sagnac på ≈ { "33" } ns for en ekvatorial kvartomdreining, antisymmetri og de radiale/polare nulltilfellene, og eksakt kansellering av satellittklokken. Ærlig omfang: et fullt budsjett for TWSTFT-transponder/maskinvareforsinkelse og en ionosfærefri PPP-løsning for tidsoverføring er videre arbeid.

seg-098e7ea0ee13 = <b>Kraftmodell for baner (to-legeme + J2).</b> En ny <c1/> legger til akselerasjonsmodellen en numerisk propagator integrerer: <c2/> (<c3/>), oblatenhetsperturbasjonen <c4/> (den lukkede ECI-formen) og <c5/> som summerer dem — bruk den sammen med <c6/> som <c7/>. Den eksponerer også de analytiske <b>sekulære J2-ratene</b> (<c8/>): nodal regresjon <c9/>, apsidal rotasjon <c10/> og drift i middelanomali <c11/>. Seks tester forankrer fysikken på eksakte referanser: <c12/> for to-legeme-leddet, den lukkede J2-formen ved ekvator (~{ "10" }⁻³ av to-legeme-størrelsen), den <b>kritiske inklinasjonen</b> ({ "63.4349" }°) som fryser perigeum (<c13/>), nodal regresjon for ISS (<c14/>) og den østover driften for en retrograd solsynkron bane. Ærlig omfang: bare to-legeme + J2; J3–J6, luftmotstand, SRP og tredjelegeme er videre arbeid.

seg-d5c03ebc5707 = <b>Delbare permalenker for scenarioer.</b> En ny <c1/> legger til en avhengighetsfri Base64-kodek etter RFC { "4648" } (standardalfabetet <c2/> med padding og et URL-sikkert alfabet <c3/> uten padding) og omslagene <c4/> / <c5/>, slik at en TOML fra playground kan kodes til en spørreparameter <c6/> og deles som en URL. Eksponert for nettleseren som wasm-bindinger <c7/> / <c8/>. Fire tester forankrer den på de kanoniske testvektorene i RFC { "4648" } (<c9/> → <c10/> osv.), en URL-sikker tur-retur for scenario (ingen <c11/>/<c12/>/<c13/> å escape), avvisning av ugyldige symboler og en tur-retur for alle 256 byte. Ærlig omfang: kodeken og bindingene leveres her; Share-knappens UI i playground, flerseriediagrammet med Plotly/D3 og A/B-sammenligningsmodusen er videre arbeid.

seg-b615fb16d547 = <b>Gauss–Newton batch minste kvadrater (den differensielle batchkorrektoren).</b> En ny <c1/> legger til estimeringskjernen som en batch-<em>banebestemmelse</em> (eller enhver parametertilpasning) hviler på: <c2/> lineariserer en brukerlevert modell <c3/> med en Jacobi-matrise med sentral endelig differanse, danner og løser de vektede normalligningene <c4/> (gjenbruker den testede matriseinversen) og itererer til konvergens med vekter per måling. Fire tester forankrer den: en lineær linjetilpasning som når den eksakte vektede minste kvadraters løsningen, en ikke-lineær tilpasning <c5/> som gjenvinner de sanne parametrene, en 3-D avstands-multilaterasjon som gjenvinner en kjent posisjon fra støyfrie avstander (varianten av banebestemmelse) og avvisning av underbestemte inndata eller inndata med ulike dimensjoner. Ærlig omfang: dette er den generiske korrektormotoren; den banespesifikke målemodellen for avstand/avstandsrate/asimut-elevasjon, den analytiske J2-tilstandsovergangsmatrisen og validering mot publiserte tilfeller er videre arbeid.

seg-0ada87934135 = <b>RF-lagsmonitorer for spoofing (AGC-effekt og SQM).</b> En ny <c1/> legger til to uavhengige spoofdetektorer i mottakerens frontend som utfyller den klokkestøttede tidsspoofmonitoren i <c2/>: en <b>AGC-effektmonitor</b> (<c3/> inkoherent effektsum + <c4/>) som flagger den overskytende mottatte effekten en spoofsender legger til utover en konfigurerbar dB-margin, og en <b>signalkvalitetsmonitor</b> (<c5/> trekantet kodeautokorrelasjon + <c6/>) som flagger Early-minus-Late-ubalansen i korrelatoren som multipath/meaconing/replay fører med seg. Fire tester forankrer de eksakte lukkede formene ({ "3.01" } dB for en dobling av effekt, aggregatet <c7/>, den trekantede <c8/> og varslingsterskelen på { "10" } % for Early/Late). Ærlig omfang: den fulle paritetsspoofdetektoren for RAIM-konsistens, flerlagsfusjonen av monitorutdataene og validering mot publiserte spoofingvektorer fra Spirent/ION GNSS+ er videre arbeid.

seg-b1ff62d88cd2 = <b>Adaptiv numerisk ODE-integrator.</b> En ny <c1/> legger til den første delen av en <em>numerisk</em> propagator (Kshanas banepropagering er ellers analytisk SGP4/SDP4): et generisk Runge–Kutta-steg av fjerde orden (<c2/>) over et hvilket som helst førsteordens system <c3/> og en adaptiv driver (<c4/>) som kontrollerer lokal feil med <b>step-doubling</b> (Richardson-ekstrapolasjon) med standard stegregulator <c5/> og logikk for å akseptere/avvise. Seks tester forankrer den på eksakte løsninger: den eksponensielle <c6/> til <c7/>, feilreduksjonen på ~{ "16" }× per halverte steg som beviser fjerde ordens konvergens, bevaring av energi/retur for den harmoniske oscillatoren over en full periode, og den adaptive driveren som oppnår en stram toleranse med variable steg. Ærlig omfang: dette er integratorkjernen og feilkontrollen dens; de innebygde tabellene Dormand–Prince RK5({ "4" })/RKF7({ "8" }) og den hierarkiske kraftmodellen for baner (to-legeme + J2–J6 + luftmotstand + SRP + tredjelegeme) som gjør den til en <c8/> er videre arbeid.

seg-ca53c62839d8 = <b>Unscented (sigmapunkt) Kalman-filter.</b> En ny <c1/> legger til det skalerte unscented Kalman-filteret (Julier & Uhlmann; Wan & van der Merwe) som en generell estimator med <c2/> tilstander over brukerlevert prosess- og målefunksjoner — sigmapunktestimatoren en tett koblet GNSS/INS-navigator bruker når modellen for pseudoavstand/Doppler er sterkt ikke-lineær og Jacobi-matrisen i et EKF forringes. Den inkluderer den støttende tette lineære algebraen (Cholesky-faktor for spredningen av sigmapunkter, Gauss–Jordan-invers for innovasjonskovariansen) og en Joseph-fri oppdatering <c3/>. Seks tester fester den, der de viktigste utnytter den eksakte egenskapen at for en <em>lineær</em> modell gjengir den unscented transformasjonen Kalman-filteret til numerisk presisjon (predict, update og en full syklus predict+update er alle sammenlignet med et håndkjørt lineært KF, pluss en analytisk 1-D Bayes-posteriorkontroll og identitetene for Cholesky/invers). Ærlig omfang: dette er estimatormotoren; den tett koblede GNSS/INS-navigatoren med 17 tilstander, målemodellen for pseudoavstand/Doppler og valideringsscenarioet med bortfall er videre arbeid.

seg-da92d32b5715 = <b>Beskyttelsesnivåer for ARAIM med to konstellasjoner.</b> En ny <c1/> utvider ARAIM med enkeltfeil (<c2/>) med <b>konstellasjonsomfattende feilmodus</b> fra EU ARAIM / DO-316: ved siden av hypotesene feilfri og per satellitt bidrar hver konstellasjon (merket per satellitt) med én hypotese som fjerner alle satellittene i den på én gang, med prior <c3/> (en ny <c4/>). Hver hypotese legger et ledd til den samme MHSS-integritetssummen, slik at VPL/HPL er de minste grensene der den totale <c5/> holder seg innenfor budsjettet over feilfri + enkelt-SV + feil per konstellasjon (Bonferroni-delingen av falsk alarm er over alle <c6/> hypoteser). Med <c7/> er resultatet bit-for-bit <c8/>; en bruker med én konstellasjon returnerer <c9/> mot sin egen konstellasjonsfeil (den kan ikke ekskluderes) — som er nettopp grunnen til at dekning med to konstellasjoner betyr noe. Fire tester dekker ekvivalensen, utvidelsen av beskyttelsesnivået, utilgjengeligheten for én konstellasjon og validering av inndata, og gjenbruker det eksisterende maskineriet for delløsninger med løsningsseparasjon.

seg-d06c5f88282b = <b>Presesjon etter IAU { "2006" } (Fukushima–Williams-vinkler og bias-presesjonsmatrise).</b> En ny <c1/> implementerer presesjonen etter IAU { "2006" } (P03; Capitaine, Wallace & Chapront { "2003" }): de fire Fukushima–Williams-vinklene <c2/> som polynomer i TT-julianske århundrer (<c3/>) og rotasjonsmatrisen for bias-presesjon fra GCRS til middel for datoen, bygget fra dem via SOFA-konstruksjonen <c4/> (<c5/>, med hjelperne <c6/> / <c7/>). Dette er den første delen for inertielt referansesystem oppå den eksisterende GMST-baserte reduksjonen <c8/>. Åtte tester validerer mot lukkede anker — middels ekliptikkskråstilling for J2000 <c9/>, de publiserte konstantleddene i vinklene, akkumuleringen av generell presesjon <c10/> over et århundre, matriseortonormalitet og <c11/>, nesten-identitetsverdien (bare referansesystembias) ved J2000, og nettorotasjonsvinkelen <c12/>/århundre. Ærlig omfang (<c13/>): bare presesjon — nutasjonen IAU 2000A med 678 ledd, den fulle kjeden TEME→GCRS og en numerisk krysskontroll mot SOFA/ANISE på µas/<{ "10" } m er videre arbeid.

seg-14c0a863eef1 = Fysikk for kaldatom-interferometer-(CAI)-akselerometer fra første prinsipper.

seg-408fc6feb284 = <c1/> modellerer et atominterferometer av Mach–Zehnder-type med tre pulser fra første prinsipper i stedet for fra et datablad: effektiv bølgevektor <c2/>, interferometerfase <c3/>, kvanteprojeksjonsstøy (shot noise) <c4/>, akselerasjonsfølsomhet per skudd, kontrastforfall <c5/> og — poenget — <c6/>, som <b>utleder</b> den hvite akselerasjons-PSD-en som det klassiske <c7/> allerede bruker, fra antall atomer, avhørstid og kontrast. Modellen dekker nå også <b>vibrasjonskobling</b> — det dominerende leddet i reelle enheter: overføringsfunksjonen fra akselerasjon til fase for interferometeret <c8/> (<c9/>), fasevariansen for hvit PSD <c10/> (<c11/>, med en numerisk kryssjekk av båndintegralet <c12/>), den rang-1 projeksjonen langs strålen <c13/> og <c14/> / <c15/> (sistnevnte reduseres til gulvet <c17/>, uavhengig av <c16/>). Elleve tester verifiserer fysikken for hånd (Rb-87 <c18/>, <c19/>, <c20/>/skudd gulv for shot noise mot et vibrasjonsgulv på ≈ { "5.9" } µg, <c21/>, <c22/> og skaleringslovene for <c23/>). Ærlig omfang i <c24/>: dette spenner over gulvet for projeksjonsstøy og det vibrasjonsbegrensede regimet over det; laserfasestøy, systematikk fra Coriolis og lysforskyvning og valideringsscenarioene for PHARAO/CARIOQA er videre arbeid.

seg-ed668459d019 = <b>Kvante-CAI-akselerometer koblet inn i inertialscenarioet.</b> Et akselerometer i et inertialt dødregningsscenario løses nå til en ny <c1/> — <c2/> (den eksisterende sensoren med koeffisienter fra datablad) eller <c3/> når det har en valgfri blokk <c4/> (<c5/>: bølgelengde, pulsavstand, antall atomer, kontrast, syklustid og en valgfri plattform-<c6/>). En sensor av typen <c7/> har PSD-en <c8/> for hastighets-random-walk <b>utledet</b> fra interferometerfysikken — gulvet for shot noise pluss, når en vibrasjons-PSD er oppgitt, bidraget som er begrenset av vibrasjon, i kvadratur — i stedet for en oppgitt koeffisient, og kjøringens proveniens registrerer at støyen er utledet fra fysikk. Feltet <c9/> er <c10/>, slik at eksisterende scenarioer utelater det og serialiseres byte-identisk (scenariohashen er uendret). Fem tester dekker utledningen, kvadratursummen for vibrasjon, valget mellom <c11/>/<c12/>, hash-stabil serialisering og en ende-til-ende kjøring drevet av CAI.

seg-c3978a122010 = Optimalisering av konstellasjonsutforming og geometri for streets-of-coverage.

seg-aae519e71c00 = <c1/> får <c2/>, en gradientfri rutenettoptimalisator som søker i utformingsrommet <c3/> og returnerer den beste Walker-utformingen under et valgt <c4/> — <c5/>, <c6/> eller <c7/> — over det allerede validerte PDOP-sveipet (en test bekrefter at den returnerer brute-force-vinneren). Pluss de analytiske lukkede formene for <b>streets-of-coverage</b> <c8/> (<c9/>) og <c10/> (<c11/>, Rider/Beste), kontrollert for hånd mot lærebokgeometri og som oppdager gapet ved underbefolkning. Den fulle Rider-løseren for minste antall satellitter for global dekning, en 3-D-globus i playground og en ekstern DOP-krysskontroll er videre arbeid.

seg-7b8468636dea = <b>Eksport av presis SP3-efemeride fra CLI.</b> Et propagert bane-/konstellasjonsscenario kan nå skrives til en SP3-c-fil: <c1/>, eller <c2/> i scenarioet skriver automatisk <c3/> (<c4/> / <c5/>, <c6/>, valgfri <c7/>). En test med tur-retur (<c8/>) propagerer det reelle Celestrak-øyeblikksbildet <c9/>, eksporterer det, parser det på nytt og bekrefter at de gjenvunne ECEF-posisjonene stemmer med SGP4-referansen over { "24" } h til <b>< { "0.5" } m</b> (godt innenfor toleransen på { "10" } m for TLE-klassen). README dokumenterer rollen for interoperabilitet (RINEX → RTKLIB/gLAB, SP3 → Ginan/presise banedata).

seg-56c729ba110f = Koblet Kalman-filter for klokke+posisjon (kryssblokk-kovarians).

seg-0a424875131d = <c1/> er ett stablet filter med <c2/> (oppdateringer i Joseph-form) der <b>pseudoavstand</b>-målingen <c3/> virkelig kobler blokkene for posisjon og klokke — i motsetning til de to uavhengige tilstandsfiltrene med to tilstander i den eldre fusjonspakken, som holder kryssblokk-kovariansen eksakt null. Validert: en delt pseudoavstand gjør <c4/> ulik null; to ulike geometrier løser sammen injiserte posisjons- og klokkeavvik som en enkelt avstand ikke kan skille; en <b>bestemmelse med bare klokke skjerper posisjonen</b> gjennom kryss-kovariansen (gevinsten frakoblede filtre ikke kan gi); og Monte Carlo-NEES er <b>konsistent med χ²({ "4" })</b>. Dette er realiseringen med 1 frihetsgrad (dimensjonaliteten i fusjonspakken); utvidelsen til 3-D med 8 tilstander og koblingen inn i den kjørbare pakken følges opp som videre arbeid.

seg-3983794a9584 = <b>Overvåking av Kalman-filterets konsistens (NIS/NEES).</b> Kovariansoppdateringen i klokkefilteret med to tilstander er nå i <b>Joseph-stabilisert form</b> `P⁺ = (I−KH)P(I−KH)ᵀ

seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, kontrollert mot tabell).

seg-f9689061a1d2 = <b><c1/> — én siterbar provenienstabell.</b> Samler hver sensorparameter (klokker, inertial, tidsoverføring), fysisk/algoritmisk modell (bane, tidssystemer, referansesystemer, iono/tropo, integritet, deteksjon, jamming, Allan) og valideringsdatasett (AIAA 2006-6753, Celestrak <c2/>) med publisert kilde — datablad, artikkel, ICD eller standard — og en ærlig modenhetsmerking (flight-qualified / ground-lab / space-goal-on-ground-hardware). Lenket fra README-introen og dokumentasjonstabellen; utfyller strengene <c3/> per kjøring som allerede følger med i resultat-JSON.

seg-55c7b52b5fdb = <b>Typet scenario-API.</b> Dispatch skjer nå på en typet enum <c1/> i stedet for en rå strengmatch på <c2/> (<c3/> + uttømmende dispatch), slik at tillegg av en pakke er kompilatorkontrollert. Nye typede flater ved siden av den uendrede <c4/> som returnerer streng: <c5/> med en strukturert feiltaksonomi (<c6/> / <c7/> / <c8/> / <c9/>, hver med en stabil <c10/>); et trait <c11/> og utvidelsespunktet <c12/> (pakken <c13/> er koblet gjennom det som det gjennomarbeidede eksempelet); og introspeksjon via <c14/> (navn, beskrivelse, påkrevde/valgfrie felt per type). Python- og WebAssembly-bindingene får <c15/> og <c16/>. Dokumentert i <c17/>.

seg-2b86391b753e = Reell GPS-konstellasjon + dekning av driftsområdet.

seg-288f2b1872c8 = <c1/> leveres nå med et <b>reelt Celestrak-øyeblikksbilde av <c2/></b> (2021-07-28, { "30" } satellitter) i stedet for syntetiske Walker-TLE-er, med <c3/> slik at den bare lastes når hver TLE-sjekksum er gyldig; <c4/> dokumenterer reproduserbar oppdatering og README krediterer kilden med åpne data. En ny <c5/> kjører hver pakke over ≥{ "5" } varianter av driftsområdet og kontrollerer at utdata er endelige/avgrensede, bekrefter at <b>flicker-FM-gulvet målbart forverrer klokkens rulling</b> når det er aktivert (nå satt i tre leverte scenarioer), og bekrefter at <b>fusjonsfilteret konvergerer med en realistisk akselerometerbias som ikke er null</b> (innenfor { "3" }× tilfellet med nullstilt bias), og lukker realismegapet "fusion only works with zeroed biases". <c6/> får en tabell for driftsområdet (Operating Envelope).

seg-f78d7dce7bfa = <b>GNSS-simulering i måledomenet (typen <c1/>).</b> En forovermodell på pseudoavstandsnivå: for hver synlige satellitt syntetiserer den <c2/> og L1-Doppler, med den enkeltfrekvente ionosfæren fra <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) og den <b>Saastamoinen</b>-baserte zenittroposfæren projisert med kartleggingsfunksjonen fra <b>Niell ({ "1996" })</b> — eksponert som TOML-blokkene <c3/> og <c4/>. Residualene mates til RAIM for øyeblikksbilder for HPL/VPL per epoke, og en JSON-array <c5/> bærer hver SVs pseudoavstand, Doppler, C/N₀ og korreksjoner for iono/tropo. En kjøring uten støy gjengir geometri + korreksjoner til sub-millimeter (CI-test). Nye <c6/> og <c7/>.

seg-833249802c56 = <b>Stokastisk detektor for tidsspoofing (typen <c1/>).</b> Spoof-pakken kjører nå en reell detektor i stedet for en deterministisk sammenligning av rampe mot grense: fire injeksjonsformer (<c2/>, <c3/>, <c4/>, <c5/>), en tosidig χ²₁-energitest / Neyman–Pearson på monitorstatistikken med klokkestøtte der terskelen settes ut fra et mål for budsjettet for falsk alarm <c6/>, og sannsynligheten for uteblitt deteksjon <c7/> rapportert både i lukket form og med Monte Carlo (<c8/> forsøk per hypotese — de to stemmer overens til noen få ×1/√N). Sikkerhetskvalitetsmålet er nå <c9/> ved den operativt skadelige (spesifikasjons-)størrelsen. Ny <c10/> (gaussiske haleverdier, NP-/energitest, Monte Carlo P_fa/P_md) og <c11/>. Bakoverkompatibel: en <c12/> alene godtas fortsatt som en lineær rampe.

seg-b3f3d2ca8a3d = <b>Definisjon av kvalitetsmålet Security (typen <c1/>):</b> fra den analytiske grensen for detekterbarhet <c2/> til den stokastiske detektorens <c3/>. Feltet <c4/> i klokkepakken forblir den raskere analytiske proxyen.

seg-ee1268975b2c = Lagt til (fortsettelse)

seg-f71696b7fa20 = <b>RF-jammingmodell (typen <c1/>).</b> En interferensmodell med linkbudsjett som gjør en jammers effekt og geometri om til tap av lås per satellitt: forholdet mellom jammer og signal fra frirom-tap og mottaksantennegevinst per retning, den effektive C/N₀ via standardligningen for anti-jam (prosesseringsgevinst ved despreading × spektralseparasjonsfaktoren <c2/>; Kaplan & Hegarty §{ "9.4" }) og en konfigurerbar sporingsterskel, vurdert over en Walker-konstellasjon som et kvalitetsmål <c3/>. Nye <c4/> og <c5/>. Ærlig omfang (ingen multipath, terrengskygge, AGC eller adaptiv nulling) er dokumentert i <c6/> / <c7/>.

seg-d4dc36011ea1 = <b>Generelt N-D parametersveip over en hvilken som helst scenariotype (<c1/>).</b> Det forrige N-D-sveipet gjaldt bare klokkepakken. <c2/> varierer TOML-nøkler med punktum i et scenario med <c3/> over det kartesiske produktet av aksene, sender hver rutenettnode på nytt gjennom den vanlige kjørestien og leser ut ett eller flere måltall fra resultatet via JSON-sti med punktum — slik at det fungerer for hver pakke (inertial, gnss-ins, integrity, spoof, …) uten å koble seg til Rust-typen for hver pakke. Rutenettnoder evalueres parallelt over OS-tråder på native mål (ingen ekstra avhengighet); wasm faller tilbake til sekvensiell. Deterministisk og radvis uavhengig av antall tråder. Nytt eksempel <c4/>.

seg-1c42e15d65a9 = <b>TOML-konfigurerbar deterministisk IMU-feilmodell i pakken <c1/>.</b> Den treaksede strapdown-feilkjeden (skalafaktor, misjustering, g-følsomhet, kvantisering, rate-ramp; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) kan nå nås per sensor fra en scenariofil via en valgfri blokk <c2/>, lagt oppå de konstante biasene ved oppstart. Å utelate blokken lar hver sensor forbli en ren kilde med konstant bias, slik at eksisterende kjøringer av <c3/> er uendret. Dette kobler den tidligere kun-bibliotek-feilmodellen inn i en kjørbar pakke og et kvalitetsmål.

seg-e035371fbe58 = <b>Validering med reelle data.</b> Parseren for multi-GNSS RINEX-navigasjon, GLONASS RK4-propagatoren og SP3-leseren er nå prøvd mot ekte IGS/DLR-filer (en reell RINEX { "3" } blandet kringkastet navigasjonsfil og et IGS SP3-c banedataprodukt), ikke bare selvskrevne eksempler — med kontroller av ikke-tomme satellittsett og endelige, fysisk riktig store ECEF-posisjoner. Testdataene er kun for test (utelatt fra den publiserte craten); se <c1/>.

seg-2a807ae8e194 = <b>RAIM på reell referansebanegeometri.</b> Kjernene for øyeblikksbilde, solution-separation (MHSS) og beskyttelsesnivå i ARAIM er nå validert mot reell IGS-geometri for presise baner (SP3), ikke bare mot syntetiske konstellasjoner: siktlinjegeometrien bygges fra den første SP3-epoken ved en reell bakkestasjon, og testene kontrollerer meternivå-beskyttelsesnivåer som er tilgjengelige for APV-I, at en pseudoavstandsbias på { "60" } m utløser χ²-monitoren, at solution separation <b>identifiserer</b> den feilbehengte satellitten, og at ARAIMs nivåer holder seg innenfor den tildelte <c1/>. Lukker gapet med validering bare på syntetisk geometri (paritet med gLAB i mottakerdomenet over en full RINEX-bue er fortsatt et punkt på veikartet — det krever en pseudoavstandsløsning).

seg-651cc4af4872 = <b>Konfidensintervaller per node for N-D-parametersveipet</b> (<c1/>). Hver rutenettnode i det N-dimensjonale kartesiske produktsveipet kan nå evalueres som et Monte Carlo-ensemble av seeds, og rapporterer måltallets middel, persentiler og et persentil-bootstrap-KI på { "95" }% per node (for begge klokker) — et statistisk ærlig sveip i stedet for ett trekk per node. Gjenbruker maskineriet for ensemble/bootstrap (<c2/>); deterministisk; <c3/> reduseres eksakt til enkelt-seed-varianten <c4/>. (Å generalisere sveipet på tvers av alle pakker, noe som er viklet inn i refaktoreringen til typet Scenario, og parallell kjøring gjenstår.)

seg-815eda56aad9 = <b>NaveGo-kryssvalidering av IMU-støyløpet</b> (<c1/>). En ekstern kryssjekk mot NaveGo (R. Gonzalez' åpne INS/GNSS-verktøykasse): gjengir den syntetiske rundturen i <c2/> på den publiserte referanseprofilen for Microstrain 3DM-GX3-35 og bekrefter at vår overlappende ADEV-estimator gjenfinner NaveGos koeffisienter for hastighets- og vinkelrandomvandring (<c3/>) med mindre enn { "5" }% avvik og med den forventede −1/2-stigningen for hvit støy. (Den innspilte STIM300-loggen på { "40" } MB (<c4/>) leses ikke inn — den er sperret av binærformatet.)

seg-b67b3ec240de = Tett koblet (pseudorange) GNSS/INS-oppdatering.

seg-c926dddc5256 = <c1/> (og omslaget <c2/>) implementerer den tidligere stubbede målingen i avstandsdomenet: innovasjonen er den predikerte avstanden fra INS-posisjonen til hver satellitt sammenlignet med den målte pseudorangen, med en siktlinje-Jacobian på posisjonsfeilen. Fordi hver satellitt er en skalarmåling, fortsetter filteret å korrigere med <b>færre enn fire satellitter</b> — der en løst koblet PVT-posisjonsbestemmelse ikke finnes. Fem tester dekker nulling med fire satellitter, korreksjon med to satellitter (ingen PVT mulig), observerbarhet langs siktlinjen med én satellitt og inndatavalidering. Kun pseudorange; bærebølgefase og en eksplisitt mottakerklokketilstand står fortsatt på veikartet. Den ubrukte cargo-funksjonen <c3/> (som sperret den gamle feilstubben) er fjernet.

seg-94ebfac3bbc3 = <b>Scenariopakke for løst koblet GNSS/INS (<c1/>, <c2/>).</b> Kobler den treaksede strapdown-navigatoren og den 15-tilstands feiltilstands-EKF-en (<c3/> / <c4/>) inn i et kjørbart scenario med et kvalitetsmål — EKF-en styrer mekaniseringen mot støyende GNSS-posisjonsbestemmelser mens dekningen er oppe, og glir så gjennom bortfallet. Dermed erstattes den gamle 1-DOF-skalarpakkens tilbakestilling som tvinger løsningen til referansen, med ekte fusjon. Resultatet rapporterer den fusjonerte serien for horisontal feil, det scorede posisjonskvalitetsmålet (tilgjengelighet / RMS i bortfall / holdover) og RMS for fri, åpen sløyfe-INS til sammenligning; et kvante-/klassisk IMU-par skiller seg bare i den sanne biasen. Startes fra CLI, Python og wasm-inngangspunktet med et <c5/>-eksempel. Ærlig avgrensning: bare løst koblet, én deterministisk bane, og den fusjonerte feilen i bortfallet er gulvbegrenset av attitydefeilen ved overleveringen (så den påstås ikke å skalere med bias) — de robuste funnene er at fusjon slår uhjulpet dødregning for en sensor med bias, og at en sensor med lavere bias har den bedre uhjulpne glidningen.

seg-0a2df01f99d8 = <b>Konstellasjonsutforming på den validerte SGP4-kjernen (<c1/>).</b> En ny modul <c2/> sender ut et utformet Walker-delta-mønster (<c3/>) som SGP4-<b>middelelementer</b>, slik at den syntetiske konstellasjonen propageres gjennom den samme SGP4-banen som er validert til { "4.12" } mm mot AIAA 2006-6753-vektorene — ikke den analytiske Kepler-generatoren. Oppå dette: <c4/> tabulerer dekning og median/verste PDOP over et utformingsrutenett <c5/>, og <c6/> rapporterer dekningsandelen og gjenbesøkshull (verste/gjennomsnitt) i et bakkepunkt. Validert mot de fysiske monotoniene en avveining må følge (flere satellitter ⇒ høyere dekning, lavere PDOP, kortere gjenbesøk). Separat er et ekte <b>Celestrak-<c7/>-TLE-øyeblikksbilde</b> (2021-07-28, { "30" } operative GPS-satellitter) lagt til som testfiks som bare brukes i tester, og den virkelige geometribanen TLE → SGP4 → ECEF er validert mot det (hele MEO-skallet innen { "1" }%, ni satellitter i sikte samtidig ved PDOP { "1.64" }), ved siden av de eksisterende virkelige datastiene for SP3 og RINEX.

seg-9e051f3725df = Støytypespesifikke effektive frihetsgrader for Allan-konfidensintervallene.

seg-2392bec8f0b6 = <c1/> implementerer de lukkede formene i NIST SP { "1065" } tabell { "5" } (Stable32-enkeltsettet) for alle fem kanoniske potenslov-støytyper — hvit/flicker-PM, hvit/flicker-FM og random-walk-FM — og erstatter det konservative antallet uten overlapping som frihetsgrader for χ². En ny enum <c2/> og <c3/> identifiserer den dominerende typen ut fra stigningen i registreringens <b>modifiserte</b> Allan-deviasjon (MDEV skiller hvit fra flicker-PM der ADEV ikke kan), og <c4/> knytter nå den identifiserte støytypen, dens edf og et { "95" }%-konfidensbånd til hvert punkt på den eksporterte ADEV-kurven (<c5/> får <c6/>/<c7/>/<c8/>/<c9/>, additivt med serde-standardverdier). Validert på to måter: de fem formlene stemmer med håndberegnede verdier til { "1e-12" }, og et Monte Carlo-ensemble med hvit FM på { "4" } 000 registreringer bekrefter at formelen predikerer estimatorens faktiske kjikvadrat-edf innen { "20" }% (og at den klart slår det konservative antallet). Åtte nye tester.

seg-df59cc71120f = Stokastisk modell for toveis tidsoverføring.

seg-d2add1ce01e1 = <c1/> erstatter den rene hvitstøy-sampleren med en fysisk begrunnet modell: den resiproke (fellesmodus) banesinkelsen kanselleres i estimatet <c2/> (<c3/>, slik at to uavhengige enveismålinger gir gjennomsnittet <c4/>), og residualen er den <b>ikke-resiproke</b> differensialsinkelsen — modellert som en farget hvit-FM + random-walk-FM-prosess (den validerte <c5/>), som gir synkroniseringsfeilserien en realistisk Allan-signatur (<c6/>) i stedet for flat hvit støy. <c7/> får <c8/>/<c9/> (serde-standard { "0" } ⇒ den gamle atferden med bare hvit støy, bit for bit), link-FoM-en rapporterer <c10/> (modellens Allan-deviasjon ved basissteget), og scenarioet og CLI-et <c11/> viser den frem. Gylden FoM festet på nytt. Seks håndavledede tester (fellesmodus-kansellering, toveisgevinsten sqrt({ "2" }), RWFM-loven <c12/> via linkens egen <c13/>, ekvivalens med den gamle atferden ved <c14/>, determinisme og FoM-eksponering fra ende til ende).

seg-6c7a1dd63be0 = Numerisk paritet med Stable32 for estimatorene i Allan-familien (NBS14).

seg-adbb47ca87b4 = <c1/> validerer estimatorene overlappende ADEV, modifisert ADEV, tidsdeviasjon og overlappende Hadamard mot Stable32-referansedeviasjonene for det kanoniske <b>NBS14</b>-datasettet (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~s.107) ved tau = { "1" }, { "2" } med en relativ toleranse på { "1e-4" } — faktisk samsvar ~{ "1e-6" }. Dette fester estimatormatematikken mot den de facto referanseimplementasjonen, ikke bare mot estimatorenes egen analytiske indre konsistens. Bare de offentlige referansetallene brukes; ingen tredjepartskode.

seg-35b0c0644fa2 = <b>Vertikalt Stanford-integritetsdiagram eksportert av scenarioet <c1/>.</b> Det kjørbare scenarioet <c2/> eksporterer nå et vertikalt Stanford(-ESA)-diagram ved siden av HPL/VPL-tilgjengelighetskartet: ved hver beskyttet epoke trekkes en seedet, reproduserbar feilfri avstandsfeil og avbildes gjennom geometrien til en faktisk vertikal posisjonsfeil, som klassifiseres mot VPL og den vertikale varslingsgrensen (Available / System-Unavailable / Misleading / Hazardously-Misleading). Diagrammet (punkter per epoke + regionantall) ligger i resultat-JSON-en, og antallet integritetshendelser / HMI står i CLI-sammendraget, slik at Stanford-klassifisereren — tidligere bare i biblioteket — nås fra ende til ende. <c3/> får et felt <c4/> (standard { "0" }) som styrer feilrealiseringen; selve tilgjengelighetskartet forblir rent geometribasert og uavhengig av seed.

seg-5d76a638ae77 = ARAIM-integritetsrisikobudsjett (P_HMI) for beskyttelsesnivåene.

seg-449adb9ad6e6 = <c1/> utleder de horisontale og vertikale beskyttelsesnivåene fra et eksplisitt integritetsrisikobudsjett i stedet for en fast multiplikator <c2/>: for løsningen med alle satellitter i sikte og hver delløsning med én satellitt utelatt bygger den den modusvise <c3/> på hver akse, og deretter finner <c4/> det minste PL der summen av sannsynlighetene for farlig villedende informasjon (<c5/>, <c6/>, Blanch m.fl. <em>Baseline ARAIM</em>) innfrir det tildelte <c7/>. Resultatet rapporterer integritetsrisikoen nivåene faktisk oppnår, slik at en bruker eksplisitt kan veie integritet mot varslingsgrensen. Seks håndavledede tester (lukkede former for feilfri og terskelbasert enkeltmodus, summering over flere moduser/monotoni, feilfri beskyttelse fra ende til ende der et 10⁵× strammere budsjett hever PL, feildeteksjon/-identifikasjon og redundansgulvet på seks satellitter). Enkeltfeil-MHSS er ARAIM-grunnlinjen; samtidige feil i flere SV-delmengder, den konstellasjonsvide feilmodusen og validering mot gLAB-referansedatasettet er dokumenterte utvidelser.

seg-3e33581644a5 = To-hastighets coning/sculling-kompensasjon for strapdown-mekaniseringen.

seg-c900e193ac29 = <c1/> trekker de høyfrekvente leddene for coning (attityde) og rotasjon+sculling (hastighet) ut av en grov oppdateringsstegs ordnede IMU-inkrementer i delintervaller, slik at en <c2/> med moderat rate gjengir vibrasjonsrektifisert bevegelse som et grovt steg over de rå summene går glipp av. En valideringstest kjører et { "10" } Hz coning+sculling-miljø i { "60" } s og sammenligner finratereferanse, naiv grov integrasjon og den foldede grove integrasjonen: foldingen kutter posisjonsfeilen med ~{ "18" }× (meter med naiv drift → under desimeter), noe som bekrefter at coning/sculling-leddene er bærende. Et typealias <c3/> gir den gamle 1-DOF-<c4/> navn etter det den er, atskilt fra den treaksede navigatoren <c5/>.

seg-ceb037e7a6ea = <b>Parser for RINEX-observasjonsfiler.</b> Den nye modulen <c1/> leser RINEX 3.0x / { "4.00" }-<em>observasjonsfilen</em> — mottakerens faktiske målinger — og fullfører dermed RINEX-paret ved siden av den eksisterende parseren for navigasjonsmeldinger. <c2/> dekoder headeren (versjon/type, lister <c3/> per system med fortsettelseslinjer, omtrentlig posisjon, intervall, tidspunkt for første observasjon) og hver epokes poster per satellitt: pseudorange, bærebølgefase, Doppler og signalstyrke, nøklet på RINEX { "3" }-observasjonskoden (<c4/>, <c5/>, …) med flaggene for tap av lås (LLI) og signalstyrke (SSI); et tomt felt bevares som fraværende, ikke som null. Ærlig omfang: dette er <em>innlesing</em> av standardformatet (en ekte observasjonslogg fra RTKLIB/gLAB/IGS-stasjon inn, typede målinger ut), ikke en posisjoneringsmotor — ingen pseudorange-løsning, PPP eller RTK her.

seg-60efb0c44522 = <b>CCSDS OEM-skriver (Orbit Ephemeris Message).</b> Den nye modulen <c1/> eksporterer en propagert konstellasjon som en gyldig CCSDS 502.0-B OEM { "2.0" }-melding — KVN-efemerideformatet som GMAT, Orekit, STK og de fleste flydynamikkverktøy leser inn. <c2/> sampler hver satellitts treghetstilstand (TEME) — posisjon <b>og</b> hastighet, hentet rett fra propagatoren uten jordfast rotasjon, i motsetning til SP3-eksporten — på et tidsrutenett, og <c3/> serialiserer headeren <c4/>/<c5/>/ <c6/> pluss ett segment <c7/> per satellitt (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) etterfulgt av linjene <c15/> (km, km/s). <c16/> oppgis av kalleren, aldri fra veggklokken, så utdataene er byte-identiske mellom kjøringer (reproduserbarhetskontrakten). Dette er romfartøyefemeridens motstykke til GNSS-eksporten SP3: en Kshana-bane kan nå overleveres til et flydynamikkverktøy i et standardformat.

seg-f8538db4a17c = Presis SP3-efemeride som propageringskilde.

seg-2cf2e224deb9 = <c1/> bygger en <c2/> per satellitt som fyller posisjonen mellom de tabulerte SP3-epokene med et Lagrange-polynom av 9. orden (standard IGS-praksis) og roterer den inn i det felles TEME-rammeverket, eksponert som <c3/>. En presis banefil fra IGS/analysesenter kan nå drive den samme geometri-/synlighets-/integritetsrørledningen som de kringkastede og analytiske propagatorene. Validert rundtur: en Kepler-bane skrevet til SP3 og lest inn igjen gjennom interpolatoren stemmer med originalen til under en meter i nodene og < { "100" } m midt i intervallet. Klokkeinterpolasjon er neste steg.

seg-8d50fd42f53c = <b>GLONASS-kringkastet efemeride (fullfører multi-GNSS RINEX nav).</b> Ny modul <c1/>: GLONASS kringkaster ikke Kepler-elementer, men en jordfast <b>tilstandsvektor</b> i PZ-90 (posisjon, hastighet, måne-sol-akselerasjon). <c2/> leser RINEX { "3" }-postene <c3/>, og satellittposisjonen til et hvilket som helst tidspunkt fås ved <b>4. ordens Runge–Kutta-integrasjon</b> av bevegelsesligningene i GLONASS ICD (sentral gravitasjon + <c4/> + Coriolis-/sentrifugalledd fra jordrotasjonen + den kringkastede akselerasjonen). Eksponert som <c5/>, slik at GLONASS-satellitter flyter gjennom konstellasjons-/synlighets-/integritetsrørledningen ved siden av Kepler-systemene; en enkelt konstellasjonsblokk <c6/> kan nå blande GPS, Galileo, QZSS, BeiDou og GLONASS.

seg-8d88144e3726 = <b>Multi-GNSS RINEX-navigasjon (GPS, Galileo, QZSS, BeiDou).</b> RINEX { "3" }-navigasjonsparseren dekoder nå poster for Galileo (<c1/>), QZSS (<c2/>) og BeiDou (<c3/>, MEO/IGSO) ved siden av GPS (<c4/>) — de deler Kepler-oppsettet og brukeralgoritmen — hver evaluert med sin egen gravitasjonskonstant og jordrotasjonsrate (Galileo/BeiDou μ, BeiDou Ω̇ₑ). En fil med blandede konstellasjoner gir alle sammen, og de flyter gjennom konstellasjons-/synlighets-/integritetsrørledningen som <c5/>. Geostasjonære BeiDou-satellitter bruker en annen koordinatrotasjon og hoppes over til det finnes en referansefiks å validere mot. Postgjennomgangen bruker linjeantall per system, noe som retter en latent feil der firelinjers GLONASS/SBAS-poster ble hoppet over som om de var åtte linjer lange. GLONASS (en tilstandsvektormodell) er neste steg.

seg-91a6907acc8d = <b>Leser og skriver for SP3-c/d presis efemeride.</b> Ny modul <c1/> parser IGS-/analysesenterets SP3-banefiler (<c2/>) — det etterprosesserte ECEF-posisjons-/klokkeproduktet som PPP-motorer (Ginan, RTKLIB, gLAB) behandler som referanse — til en strukturert <c3/> (header, epokerutenett, posisjon per satellitt km→m, klokke µs og hastighet dm/s→m/s for produkter med <c4/>), med de ugyldige sentinelverdiene i SP3 bevart. Motsatt retning er også dekket: <c5/> bygger en SP3 fra en propagert konstellasjon (TEME→ECEF per epoke) og <c6/> serialiserer den, slik at Kshana-baner kan eksporteres i formatet eksterne PPP-verktøy leser inn — rundturen lese↔skrive. Epokeinterpolasjon og en SP3-propagatorkilde er neste steg.

seg-7d51d1b6f39f = <b>RINEX-kringkastet efemeride som kjørbar konstellasjonskilde.</b> En konstellasjon godtar nå en innebygd blokk <c1/> (RINEX { "3" } GPS-navigasjonstekst) ved siden av det eksisterende alternativet <c2/>, slik at en ekte kringkastet fil driver et scenario fra ende til ende fra CLI, Python eller lekeplassen i nettleseren — RINEX inn, PNT-geometri ut. Nytt <c3/> viser GNSS-tilgjengelighet og DOP fra åtte GPS-satellitter bygget rett fra kringkastede poster. (Bare GPS LNAV; multi-GNSS og SP3 er neste steg.)

seg-9730835bfc64 = <b>RINEX-kringkastet efemeride som propageringskilde.</b> En parset <c1/> kan nå konverteres til en <c2/> (<c3/>): posisjonen er den kringkastede IS-GPS-200-banen rotert fra ECEF til det felles TEME-treghetsrammeverket (<c4/>, med GPS→UT1-tid som er korrekt for skuddsekunder), hastigheten fås ved sentral finittdifferanse, og dessuten Kepler-omløpstiden. Ekte kringkastede GPS-data kan nå drive den samme geometri-, synlighets- og integritetsrørledningen (RAIM) som de analytiske SGP4-/Kepler-propagatorene. (Ennå ikke eksponert som scenariotype for RINEX-fil — det og multi-GNSS/SP3 er neste steg.)

seg-a355e3e52ec3 = <b>Arkiv-DOI.</b> Utgivelser deponeres nå hos Zenodo og får en siterbar DOI.

seg-c6e4556e1ce5 = <b>Dokumentasjon.</b> Oppdaterte README til institusjonelt nivå: en funksjonsoversikt over hele { "v0.9.0" }-stakken, en seksjon om versjonering og utgivelser, en ren header med det nye merket og en kortfattet statuslinje. Ingen endringer i motoren.

seg-1bfc4e965d2b = Denne utgivelsen legger til tre betydelige funksjonsområder oppå SGP4-substratet fra { "0.8.0" }: en ekte treaksed strapdown-INS, en løst koblet GNSS/INS-feiltilstands-EKF med lukket sløyfe-tilbakekobling, ekte øyeblikks-RAIM og RAIM med løsningsseparasjon (ARAIM-stil) med HPL/VPL og et kjørbart scenario <c1/>, og det første steget mot interoperabilitet mellom GNSS-formater (innlesing av RINEX-3 GPS-efemerider).

seg-7fa2f68d436a = <b>Parser for RINEX { "3" } GPS-navigasjonsmeldinger (<c1/>).</b> Første steg mot interoperabilitet mellom GNSS-formater: <c2/> leser en RINEX { "3" }.x-navigasjonsfil og dekoder hver kringkastede GPS-efemeridepost (<c3/>) — den åttelinjers blokken SV/epoke + <c4/> — til en <c5/> med Kepler-elementer og klokkekorreksjoner, med feltnavn og enheter etter IS-GPS-200. Håndterer Fortrans flyttallsformat med <c6/>-eksponent (<c7/>) og kolonneoppsett med fast bredde; poster for systemer som ikke er GPS hoppes over, ikke avvises, slik at en blandet fil fortsatt gir sine GPS-efemerider. Fire tester: parsing av <c8/>-eksponent (inkludert blanke felt og feil), en full post dekodet mot kjente feltverdier med en sunnhetssjekk av GPS' store halvakse (√A² ≈ { "26 560" } km), overhopping av ikke-GPS og tilfellet med tom fil.

seg-9c4a068f204c = GPS-kringkastet efemeride → ECEF-posisjon (<c1/>).

seg-5deeec4b8cc9 = <c1/> evaluerer satellittens jordfaste posisjon fra den parsede efemeriden via brukeralgoritmen i IS-GPS-200 §{ "20.3.3.4.3.1" }: Newton-løsning av Keplers ligning for den eksentriske anomalien, andre harmoniske korreksjoner av breddeargument / radius / inklinasjon og rotasjonen til ECEF som tar hensyn til jordrotasjonen siden referanseepoken (med GPS-verdiene <c2/> og <c3/> som spesifikasjonen krever, og en folding av ukeskifte <c4/>). Tre tester: den geosentriske radiusen holder seg i GPS-båndet (≈ { "26 560" } km), den jordfaste hastigheten er ~{ "3.9" } km/s, og evaluering en hel uke unna gir den samme posisjonen.

seg-583433389a70 = GPS SV-klokkebias med den relativistiske korreksjonen (<c1/>).

seg-957588ed5dff = <c1/> evaluerer det kringkastede klokkepolynomet <c2/> rundt <c3/> pluss det relativistiske eksentrisitetsleddet <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). En ny <c5/> konverterer postens kalenderepoke til GPS-ukesekunder via aritmetikk med juliansk dag fra GPS-epoken (1980-01-06), og Kepler-løsningen deles med posisjonsevalueringen. Tester: GPS-ukesekunder for en søndag/tirsdag/lørdag (ukegrenser), og at klokkebiasen er dominert av af0 med et tilstedeværende, begrenset relativistisk ledd. L1-gruppeforsinkelsen <c6/> er eksponert, men med vilje ikke innregnet. Ærlig omfang: en kilde <c7/>, Galileo/BeiDou/GLONASS og SP3 er fortsatt neste steg. (<c8/> er oppdatert tilsvarende.)

seg-ef971feff16c = <b>Brukerkjørbar scenariotype <c1/> (<c2/>).</b> RAIM-tilgjengelighetsfunksjonen kan nå nås fra CLI/TOML som alle andre pakker: <c3/> parser et <c4/> (brukerbane, en eller flere GNSS-konstellasjoner, elevasjonsmaske og integritetskonfigurasjonen <c5/>), kjører <c6/> og sender ut tilgjengelighetskartet for HPL/VPL per epoke som JSON pluss en selvstendig SVG — beskyttelsesnivåer over tid mot varslingsgrensene, med en grønn/rød tilgjengelighetsstripe. <c7/> skriver JSON-en, diagrammet og en HTML-rapport. Det medfølgende scenarioet (24-satellitters Walker, { "1" } m tofrekvens-avstandsmåling, APV-I-grenser) rapporterer ~{ "95" } % tilgjengelighet; det dokumenterer at enfrekvens-RAIM ikke innfrir den vertikale APV-I-grensen med én konstellasjon, og det er derfor vertikal veiledning bruker SBAS/tofrekvens/ARAIM. Testene dekker utsendelsen, JSON-en med tilgjengelighetskartet og SVG-en.

seg-bbe5721c1785 = <b>Kjørbar RAIM-tilgjengelighet over en konstellasjon (<c1/>).</b> Integritetsmodulen hadde ingen kaller — <c2/> gjør den til et ekte inngangspunkt fra ende til ende: ved hver epoke på et tidsrutenett propagerer den de synlige satellittene (de samme SGP4-/Kepler-<c3/>-ene motoren bruker), beregner beskyttelsesnivåene uten feil og vurderer tilgjengelighet mot de horisontale/vertikale varslingsgrensene, og returnerer en <c4/>-serialiserbar <c5/> (per epoke <c6/>/HPL/VPL/<c7/> pluss tilgjengelighetsandelen). En <c8/> samler <c9/>, og <c10/> per epoke er eksponert for kallere som løser sin egen geometri. Tre tester: en epoke vurdert som tilgjengelig under APV-I-grenser på en geometri med ti satellitter, gjort utilgjengelig av en umulig stram grense, og <c11/>-nivåer under fem satellitter; og en kjøring fra ende til ende over en 24-satellitters Walker-konstellasjon som gir et endelig tilgjengelighetskart og serialiseres. (Seks satellitter — redundansgulvet for residual-RAIM — innfrir ærlig talt <em>ikke</em> APV-I selv ved { "1" } m avstandsmåling; APV-I-tilgjengelighet krever den tettere geometrien testen bruker.)

seg-91e32e587cb6 = <b>Akkumulator for Stanford(-ESA)-integritetsdiagram (<c1/>).</b> Standardmåten å oppsummere en integritetsmonitor over mange epoker: den plotter faktisk posisjonsfeil (x) mot beskyttelsesnivå (y) og klassifiserer hver epoke, ut fra diagonalen <c2/> og varslingsgrensen, som <c3/> (PL avgrenser feilen, innenfor AL), <c4/> (PL avgrenser feilen, men overstiger AL — trygt, ubrukelig), <c5/> (PL < feil ≤ AL) eller <c6/> (PL < feil og feil > AL — den utrygge svikten). <c7/> er den rene klassifisereren; <c8/> akkumulerer <c9/>-punkter mot en fast varslingsgrense og eksponerer regionantall, tilgjengelighet, totaler for integritetshendelser og <c10/>-serialiserbare punkter for plotting/JSON-eksport. Fire tester: hver region (inkludert den avgrensede grensen <c11/>), akkumulering av antall/tilgjengelighet og JSON-rundtur. Dette er rapporteringsflaten for RAIM-beskyttelsesnivåene; å koble den inn i konstellasjonsscenarioet og validere mot et offentlig datasett står fortsatt på veikartet.

seg-cdeb3a5a4acf = <b>RAIM med løsningsseparasjon (ARAIM-stil) (<c1/>).</b> En integritetsmonitor med flere hypoteser ved siden av den eksisterende residual-/paritets-kjikvadrat-<c2/>. For minste kvadraters løsning med alle satellitter i sikte og hver delløsning med én satellitt utelatt danner den separasjonen <c3/> — gaussisk med forventning null uten feil og med kovarians <c4/> (identiteten for nestede estimatorer, gyldig fordi løsningen med alle satellitter i sikte er BLUE) — og den både <b>oppdager</b> en feil og <b>identifiserer</b> den feilaktige satellitten (den hvis utelatelse gir størst normalisert separasjon). Horisontale/vertikale beskyttelsesnivåer følger standard MHSS-allokering <c5/>, med <c6/>, <c7/>. Ny avhengighetsfri <c8/>/<c9/> bygget på modulens eksisterende regulariserte ufullstendige gamma (<c10/>). Fire håndavledede tester: normal-CDF / kvantil mot lærebokverdier (Φ({ "1.95996" })={ "0.975" }, halen { "1e-7" } = { "5.1993" }, symmetri); en feilfri geometri som ikke alarmerer og gir endelige, positive HPL/VPL; en 60-σ-bias på én satellitt som oppdages <em>og</em> identifiseres riktig (<c11/>); og redundansgulvet på seks satellitter. Lukker revisjonens P0-hull «tautologisk integritet — ingen ekte RAIM/HPL/VPL» på algoritmesiden; validering mot gLAB-datasett og Stanford-diagramakkumulatoren står fortsatt på veikartet.

seg-67e771fc0a48 = Lukket sløyfe-integrasjon av GNSS/INS (<c1/>).

seg-5aa467783b99 = <c1/> kobler feiltilstands-EKF-kjernen til den treaksede strapdown-mekaniseringen: hver IMU-sample korrigeres med de løpende bias-estimatene, mekaniseres fremover, og EKF-kovariansen tidspropageres med tilhørende navigasjonskontekst; hver GNSS-posisjons-/hastighetsbestemmelse danner INS−GNSS-innovasjonen og mater de estimerte <b>posisjons-, hastighets-, attitydefeil- (ψ, som en kvaternionrotasjon) og akselerometer-/gyrobias-verdiene</b> tilbake i løsningen og nullstiller feiltilstandens middelverdi. Å mate attityden tilbake (ikke bare biasene) er nødvendig for stabilitet — tilt og akselerometerbias er et koblet par, så å korrigere det ene uten det andre divergerer. INS og GNSS sammenlignes i et lokalt tangentplan NED-rammeverk med mekaniseringens egne krumningsradier (ny <c2/>; <c3/>/<c4/> eksponert). Dette er den ærlige erstatningen for hybridpakkens <em>tilbakestilling som tvinger løsningen til referansen</em>. Tre tester: en lukket sløyfe som nuller en injisert posisjonsfeil på { "8" } m / −{ "5" } m til <{ "0.1" } m; en hjulpet løsning som holder seg begrenset til meternivå (<{ "6" } m) på en kjørebane mens en fritt løpende INS divergerer forbi { "100" } m; og milepælsbenchmarken — den fusjonerte løsningens <b>Monte Carlo-posisjons-RMS over et GNSS-bortfall på { "60" } s slår en uhjulpet åpen sløyfe-dødregner med >{ "2" }× (≈{ "4" }× på tvers av seeds)</b>. Ærlig begrensning dokumentert i modulen: i løst koblet modus lar akselerometerbias og tilt seg bare svakt skille (begge kobles gjennom gravitasjon), så verdien som leveres er den begrensede, korrigerte tilstanden og et rent inngangspunkt til bortfallet — ikke en presis treghetskalibrering; rikere dynamikk og den tett koblede utvidelsen står fortsatt på veikartet.

seg-aa9bf0ff6f84 = <b>Kjerne for løst koblet GNSS/INS-feiltilstands-EKF (<c1/>).</b> Et utvidet Kalman-filter med 15 feiltilstander — <c2/> — med strapdown-feildynamikken fra Groves { "2013" } §{ "14.2" } (kobling mellom spesifikk kraft og tilt, Coriolis, projeksjon av bias fra kropp til nav, Gauss–Markov-biasmodeller), en førsteordens diskret overgang <c3/> og en løst koblet måleoppdatering av posisjon+hastighet (<c4/>) på Joseph-form. Avhengighetsfri tett lineær algebra (Gauss–Jordan-invers, Joseph-kovariansoppdatering). En cargo-funksjon <c5/> sperrer en dokumentert, ennå ikke implementert pseudorange-/Doppler-oppdatering. { "7" } tester med håndavledede forventninger: identiteten for skjev-/kryssprodukt, en verifisert { "3" }×{ "3" }-invers, kovarians som forblir symmetrisk/PSD under prediksjon (og posisjonsusikkerhet som vokser uhjulpet), en posisjonsbestemmelse som krymper posisjonskovariansen, eksakt gjenfinning av en kjent posisjonsfeil ved den analytiske Kalman-forsterkningen <c6/>, og mindre korreksjoner under større målestøy. Dette er kjernen som skal erstatte hybridpakkens åpne sløyfe-tilbakestilling mot referansen med lukket sløyfe-tilbakekobling (pakkekobling + NaveGo-validering følger).

seg-5be84079b8b6 = Deterministisk IMU-feilmodell for den 3-aksede strapdown-navigatoren (<c1/>).

seg-492e670736b2 = <c1/> forvrenger et sant kroppsrammepar <c2/> til et målt par gjennom fem systematiske kategorier (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabell { "4.1" }): <b>skalafaktor</b> (feil i forsterkning per akse i ppm), <b>skjevjustering / krysskobling</b> (ikke-ortogonalitet utenfor diagonalen i triaden), <b>g-følsomhet</b> (en gyroratebias proporsjonal med spesifikk kraft), <b>kvantisering</b> (avrunding til LSB i utdataene) og <b>rateramp</b> (en lineær drift over tid — den tredje Allan-regionen), pluss en konstant oppstartsbias. Hvert ledd er null som standard, så <c3/> er en gjennomsiktig gjennomgang og eksisterende scenarioer påvirkes ikke. Hver feilkilde har en isolasjonstest (skala lineær til <{ "0.01" }%, skjevjustering på tvers av aksene over VRW-gulvet, g-følsomhetsbias, LSB-rutenett, lineær ramp), og en test fra ende til ende driver en navigasjonsfeil gjennom mekaniseringen fra en forvrengt IMU. Ikke modellert: vibrasjonsrektifiseringsfeil og temperaturgradientdrift. (Den medfølgende scenariopakken <c4/> kjører fortsatt det gamle 1-DOF-skalarbudsjettet; denne modellen mater 3-akse-biblioteket.)

seg-f57bc89d4688 = <b>Coning- og sculling-kompensasjon for strapdown-integratoren.</b> Attitydebanen får det todelte <c1/> (<c2/>); en integrasjon med grov rate ({ "30" } Hz, 5 samples/syklus) av et { "5" } Hz coning-miljø er verifisert til å følge finratereferansen ≥ { "3" }× bedre med korreksjonen enn med naiv summering av inkrementer. Hastighetsbanen får <c3/> (<c4/>, Groves lign. { "5.82" }) og løser kroppens hastighetsinkrement gjennom en ny inkrementbasert oppdatering <c5/> med den kroppsrelative rotasjonen <c6/>, slik at en jordfast plattform ikke får noen falsk sculling mens en ekte vibrasjon utløser hele leddet.

seg-56c599250ed4 = Full treaksed strapdown-mekanisering i NED-rammeverket (<c1/>).

seg-d0897492e89b = <c1/> flyttes frem av <c2/> med standardligningene for NED i et terrestrisk rammeverk (Groves §{ "5.4" }): attityde fra kropp til NED korrigert for raten fra treghet til nav <c3/> (jordrotasjon + transportrate); spesifikk kraft løst fra kropp til NED gjennom DCM-en; hastighet som integrerer <c4/> (Coriolis/transport + gravitasjon); og geodetisk posisjon via meridian- og tverrkrumningsradiene. Gravitasjonen er den lukkede formen WGS-84 Somigliana for <b>normal (loddlinje-)gravitasjon</b> med en NIMA-fri luft-høydekorreksjon — aldri en hardkodet konstant. Dette er den ekte treaksede navigatoren som avløser 1-DOF-banen med skalarfeilbudsjett. Verifisert ved fysiske invarianter: en plattform boltet til den roterende jorden ved { "45" }°N (som registrerer jordrate + { "1" } g) holder seg innenfor { "1" } mm over { "60" } s; en horisontal spesifikk kraft mot nord gir <c5/> og <c6/> forskyvning; normal gravitasjon stemmer med de kjente overflateverdiene ved ekvator/pol/45° og fri luft-gradienten.

seg-290b08199bfb = <b>Treaksed attityderepresentasjon for strapdown-INS (<c1/>).</b> En enhetskvaternion-type <c2/> (skalar først, Hamilton-konvensjon) som bærer rotasjonen fra kropp til nav, med en DCM-visning (<c3/>/<c4/> via Shepperds metode), Hamilton-produkt, konstruktører for akse-vinkel og rotasjonsvektor (eksakt eksp-avbildning) og kvaternionkinematikk — både en førsteordens RK-rateoppdatering (<c5/>) og en rotasjonsvektoroppdatering med coning-korreksjon. Det todelte <c6/> (Savage / Bryan–Lewantowski, <c7/>) gir rotasjonsratens krysskoblingsledd som skalar dødregning utelater. Dette er attitydefundamentet for den fulle 3-akse-mekaniseringen som erstatter den gamle banen med 1-DOF-feilbudsjett. Verifisert mot lukkede rotasjoner: propagering med konstant rate stemmer med akse-vinkel-kvaternionen til { "1e-6" }, DCM-er er ortonormale med enhetsdeterminant, og coning forsvinner for bevegelse om én akse. (<c8/> er nå modulmappen <c9/>; den offentlige stien <c10/> er uendret.)

seg-5e6e5bba25a5 = Geodetisk korrekt synlighet fra bakkestasjon (<c1/>).

seg-69bdb1e5bfc8 = <c1/>, <c2/> og <c3/> beregner en satellitts elevasjon over en bakkestasjons horisont mot <b>WGS-84-ellipsoidens normal</b> (den sanne lokale vertikalen), ikke den geosentriske radialen — de to avviker med opptil den geodetiske avbøyningen på ~{ "0.19" }°, nok til å flytte satellitter nær horisonten inn i eller ut av en elevasjonsmaske. Verifisert fra ende til ende (en Walker-konstellasjon propagert, rotert TEME→ECEF og telt fra et geodetisk sted) og mot den geosentriske tilnærmingen.

seg-4de1d79d2e76 = <b>Pålitelighet i CI.</b> Jobben <c1/> bygger nå wheel-filen med <c2/> (manylinux-container) i stedet for en rå verts-<c3/>, noe som fjerner en periodisk rustup-konflikt mellom <c4/> og <c5/> på runner-avbildet. Jobben <c6/> installerer <c7/> som ferdigbygd binærfil via <c8/> i stedet for den Docker-baserte <c9/>, noe som fjerner en tidsavbrudd ved registerhenting fra Docker Hub. Ingen av endringene påvirker kontrollene som utføres.

seg-05055c993904 = Treghetshastighet eksponeres videre nedstrøms.

seg-1228235c99b6 = <c1/> og <c2/> (som returnerer <c3/>) fører den analytiske TEME-hastigheten som SGP4 allerede beregner — tidligere forkastet — videre til kallerne i m/s; <c4/> gir Kepler-banen en konsistent hastighet. Verifikasjonstesten mot AIAA 2006-6753 kontrollerer nå også hastigheten for hver referanserad (verste hastighetsfeil { "1.85e-9" } km/s over alle { "666" } tilstander) og fester antallet sammenlignede rader til nøyaktig { "666" }.

seg-8ac2598291b8 = <b>Strengere, panikkfri TLE-parsing.</b> Linjer må være ASCII og deles trygt (ikke lenger panikk ved byte-indeks på flerbyte-inndata); elementer områdekontrolleres (inklinasjon, eksentrisitet, middelbevegelse); sjekksummen i kolonne 69 kan håndheves via <c1/> / <c2/> og det nye flagget <c3/> på <c4/> (ettergivende som standard).

seg-1cd2c6621a04 = <b>Allan-deviasjonskurve i utdataene.</b> Hver klokkekjøring rapporterer nå en <c1/> (<c2/>), og lekeplassen i nettleseren tegner et log-log-diagram «Klokkestabilitet (ADEV)».

seg-c76ff20811e7 = Validering av inndata for tidsrutenettet.

seg-75436d067802 = <c1/> avviser et tidsrutenett som er ikke-endelig, null, negativt eller for stort (et steg større enn varigheten, eller flere enn <c2/> samples) før noen allokering, slik at et ugyldig scenario gir en feil i stedet for panikk eller tømmer minnet.

seg-d0a8ce50cf6e = Monte Carlo-ensembler for den inertielle pakken.

seg-3225674ce4ea = <c1/> på et inertielt scenario kjører N seeds og rapporterer hver målings gjennomsnitt, standardavvik, persentiler og et persentil-bootstrap-konfidensintervall på { "95" }% (<c2/>). Hver inertielle kjøring bærer nå et flagg <c3/>, slik at et kvalitetsmål fra én realisering ikke lenger forveksles med en fordeling. (CEP/2DRMS rapporteres med vilje ikke — de krever 3-akse-modellen som står på veikartet.)

seg-2967872bfca1 = <b>Veiledet lekeplassmodus.</b> Lekeplassen i nettleseren slipper deg ikke lenger rett ned i en vegg av rå TOML: en stripe «Start her» med scenariokort du klikker på laster og kjører et ferdig eksempel, glidere eksponerer de universelle innstillingene (seed, tidsterskel) uten å røre TOML-en, en merknad «Slik leser du dette» forklarer resultatet, og hele TOML-en ligger ett klikk unna i en sammenleggbar seksjon. Hver kjøring kan deles — <b>Kopier delingslenke</b> koder hele scenarioet inn i URL-fragmentet (ingenting lastes opp), slik at en lenke gjengir den eksakte kjøringen ved innlasting. Kodeken er enhetstestet (<c1/>, kjørt i CI).

seg-2e47e8864718 = N-dimensjonale parametersveip (<c1/>).

seg-5076a9ad20d7 = <c1/> evaluerer en måling over hele det kartesiske produktet av flere <c2/>-områder (avveiningsstudien med flere parametere), i radvis rekkefølge, deterministisk. Additivt — det eksisterende 1D-sveip-API-et er uendret. Bootstrap-konfidensintervaller per node og generalisering utover klokkepakken står fortsatt på veikartet.

seg-958718831037 = <b>Ekte øyeblikks-RAIM (<c1/>).</b> Ekte Receiver Autonomous Integrity Monitoring i posisjonsdomenet: den bygger siktlinjegeometrien til de synlige satellittene, danner minste kvadraters løsning og residualene, kjører en χ²-test av residualene for feildeteksjon (eksakt terskel fra en avhengighetsfri ufullstendig gamma χ²/ikke-sentral χ²) og beregner helningsbaserte horisontale og vertikale beskyttelsesnivåer (HPL/VPL) med biasen for uoppdaget feil utledet for de konfigurerte P_fa/P_md. Dette er noe annet enn — og er <b>ennå ikke koblet inn i</b> — integritetsmålet for filterets indre konsistens i scenariorørledningen; feilutelatelse, budsjettering av varslingsgrense/P_HMI og ARAIM står fortsatt på veikartet.

seg-1675540acbd9 = <b>Pakke for frekvensstabilitet: MDEV, TDEV, HDEV + konfidensintervaller</b> (<c1/>). Ved siden av den overlappende ADEV: den modifiserte Allan-deviasjonen (skiller hvit fra flicker-fasestøy), tidsdeviasjonen (<c2/>) og Hadamard-deviasjonen (avviser lineær frekvensdrift eksakt og konvergerer for divergerende rødstøytyper). χ²-baserte konfidensintervaller (<c3/>) bruker et avhengighetsfritt par av normal-/χ²-kvantiler (Acklam + Wilson-Hilferty) med en konservativ edf uten overlapping; støytypespesifikk edf og numerisk paritet med Stable32 står fortsatt på veikartet.

seg-446a9ed4467c = <b>Reduksjon mellom referansesystemer (<c1/>).</b> GMST-basert TEME↔ECEF-rotasjon (med samme IAU-1982-siderealtid som propagatoren), eksakt WGS-84 geodetisk↔ECEF med en iterativ invers sådd med Bowring (maskinpresisjon i alle høyder, også MEO/GEO) og en geodetisk bakkestasjonsobservatør som returnerer asimut / elevasjon / avstand i det lokale East-North-Up-rammeverket. Polbevegelse og nutasjon under buesekundet brukes ikke (bare GMST, under en kilometer på bakkesporet); en ITRF-presis CIO-kjede står på veikartet.

seg-9f6f53583cf5 = <b>Fundament for tidsskalaer (<c1/>).</b> Et avhengighetsfritt API for juliansk dato (gregoriansk sivil ↔ JD, MJD), den fulle IERS-historikken over heltalls skuddsekunder (UTC↔TAI, { "10" } s i { "1972" } til { "37" } s siden { "2017" }), den definerte TAI→TT-forskyvningen, UT1-korreksjonen via en oppgitt DUT1 og IAU-2000 jordrotasjonsvinkelen. Dette er tidssubstratet som reduksjon til jordfast rammeverk (planlagt) hviler på. Tidspunkter er julianske datoer med enkel <c2/> (~{ "50" } µs oppløsning nær nåværende epoke; en todelt JD står på veikartet), og æraen før 1972 med gummisekunder er ikke modellert — begge deler er dokumentert i modulen.

seg-6ecc053f101f = <b>Reproduserbarhet og opphav.</b> En deterministisk CycloneDX-SBOM-generator (<c1/>) og en SLSA-attestasjon av byggopphav på utgivelsesbinæren og SBOM-en; utgivelsesverktøykjeden er festet slik at den stemmer med CI. Determinismegarantier, forbeholdet om <c2/> på tvers av plattformer og tilnærmingen med gylden festing er dokumentert i <c3/>.

seg-3e98dcdcb82b = <b>Egenskapsbaserte tester og fuzz-tester</b> (<c1/>). Deterministiske, randomiserte tester (ingen ny avhengighet) hevder invarianter over tusenvis av inndata: TLE- og scenarioparserne gir aldri panikk på søppel, ikke-ASCII, muterte eller avkortede inndata; <c2/> gir aldri panikk på NaN/inf/negative rutenett; TLE-sjekksummen er konsistent og gjelder bare kolonne 69; geodetisk↔ECEF-rundturer og TEME→ECEF-rotasjonen bevarer normen over hele kloden og et bredt høydebånd.

seg-ea252b5d7427 = Gylden testing <b>fester nå kvalitetsmålene felt for felt</b> for de fire referansescenarioene (med en toleranse som absorberer jitter i <c1/> på tvers av plattformer) og erstatter de tidligere kontrollene som bare var ulikheter, slik at en stille numerisk regresjon fanges umiddelbart.

seg-4b2a0b78984b = <c1/> i resultatartefakter er hevet fra <c2/> til <c3/> (den lå fast mens motoren gikk videre).

seg-ecafa9d44810 = <c1/> <b>avviser</b> nå (advarer ikke om) trukne avhengigheter.

seg-c48af44de5b4 = Nye dokumenter: <c1/> (ærlig omfangskart), <c2/> (referanse for resultatfelt), <c3/>, <c4/>, <c5/>. En CI-vakt feiler hvis versjonsmerket i README driver bort fra <c6/>.

seg-8ef32ebec7f5 = <b>SGP4/SDP4-banepropagering.</b> En full, avhengighetsfri implementasjon av standard propagator for forenklede perturbasjoner — SGP4 for nær jorden sammen med SDP4-utvidelsen for dypt rom (sekulære og periodiske perturbasjoner fra måne og sol og geopotensialresonans på { "12" } h / { "24" } h). Den er validert mot de offisielle verifikasjonsvektorene i AIAA 2006-6753 («Revisiting Spacetrack Report #3»): alle { "666" } referansetilstander på tvers av tilfellene nær jorden, dypt rom, resonans og feilkoder stemmer med en verste posisjonsfeil på omtrent { "4" } mm. Dette er modellen to-linjers elementsett er definert mot, så den representerer ekte konstellasjoner — særlig GNSS-banene på ~{ "12" } h, som er dypt rom og resonante og som den tidligere to-legemers + J2-sekulære modellen ikke kan fange.

seg-06a77fb9233e = En konstellasjon gitt som <b>fulle to-linjers elementsett</b> (linje { "1" } + linje { "2" }) propageres nå med SGP4/SDP4; en konstellasjon gitt som elementer med bare linje 2 beholder den analytiske Kepler-propageringen med to legemer, uendret. De to formene kan blandes i én blokk. Nytt referansescenario <c1/> (en GPS-lignende MEO-konstellasjon i ekte to-linjers format, propagert med SGP4) — legg inn et aktuelt Celestrak-sett «gps-ops» for å studere den levende konstellasjonen.

seg-2dbb4054e9b8 = <b>Demonstrator for aktivt spoofing-angrep.</b> En ny scenariotype <c1/> injiserer en voksende falsk tidsspoof og kjører hver klokkes klokkestøttede integritetsmonitor, og rapporterer om og når spoofen oppdages og om den når den operative spesifikasjonen uoppdaget — slik at sikkerhetsmålet blir en konkret demonstrasjon av angrep og forsvar. Nytt referansescenario <c2/>.

seg-aa0cb8038baa = <b>Tilgjengelighet med flere konstellasjoner.</b> Et banescenario kan kombinere flere konstellasjoner (en liste <c1/> ved siden av den primære <c2/>) for multi-GNSS-tilgjengelighet og presisjonsfortynning — for eksempel GPS pluss Galileo. Nytt referansescenario <c3/>.

seg-9b9dcd5be0a7 = <b>HTML-resultatkort.</b> Hver kjøring lager nå også et selvstendig, merkevarebygget HTML-resultatkort — sammendraget på én linje, diagrammet (innebygd som et inert data-URI-bilde) og hele JSON-en — skrevet av CLI-et ved siden av JSON-en og SVG-en. En delbar enkeltfilartefakt for en studieleveranse eller et vedlegg.

seg-76c573048a91 = <b>Felles sensorfusjonsestimator.</b> En ny scenariotype <c1/> kjører ett enkelt rekursivt Kalman-filter som navigasjonsløsning — det fusjonerer klokketilstanden <c2/> og posisjonstilstanden <c3/>, styres av GNSS (lærer frekvensavviket og hastigheten) og støttes av optisk tidsoverføring under bortfallet — i stedet for å sette sammen uavhengige prediktorer. Den rapporterer fusjonert holdover for tid/posisjon og en integritet fra felles kovarians. Nytt referansescenario <c4/>.

seg-10f0501c91ef = <b>Fyldigere IMU-støymodell.</b> Akselerometeret modellerer nå de gjenværende Allan-varianstermene utover den konstante biasen og hastighetsrandomvandringen: <b>biasustabilitet</b> (et 1/f-flickergulv ved standard Allan-koeffisient for biasustabilitet, som gjenbruker klokkens flickersyntese) og <b>akselerasjonsrandomvandring</b>. Nye valgfrie inertielle scenariofelt <c1/> og <c2/>; en ny GNSS-posisjonsbestemmelse rekalibrerer den gjenværende biasdriften.

seg-251ffc7b7722 = <b>Ekte konstellasjonsgeometri fra TLE-er.</b> En konstellasjon kan oppgis som en blokk med to-linjers elementsett (standardformatet fra NORAD/Celestrak) via et felt <c1/>, slik at tilgjengelighet og presisjonsfortynning bruker en ekte konstellasjons publiserte geometri i stedet for et syntetisk Walker-mønster. Motoren leser hver TLEs Kepler-middelelementer og propagerer dem som to legemer — ikke med SGP4 — noe som er forsvarlig for en øyeblikksstudie fra en felles epoke. Nytt referansescenario <c2/>.

seg-7deb93b51cc7 = <b>Parametersveip for avveiningsstudier.</b> En ny scenariotype <c1/> varierer én parameter (<c2/>, <c3/>, <c4/> eller <c5/>) over et lineært eller logaritmisk område og registrerer et valgt kvalitetsmål i hvert punkt for begge klokkene, og lager dermed sammenligningsdiagrammet «hvordan skalerer holdover med klokkestabilitet?» som en utformingsavveining trenger. Nytt referansescenario <c6/>.

seg-ef6f3e77b476 = <b>Monte Carlo-konfidensbånd.</b> Scenarioet for klokke-holdover kan kjøre mange realiseringer (nytt valgfritt felt <c1/>): hvert kvalitetsmål rapporteres da som et gjennomsnitt med en spredning fra 5. til 95. persentil, og diagrammet skraverer feilomhyllingen på { "5" }–{ "95" }% rundt medianen for hver klokke. En enkelt kjøring er fortsatt standard. Nytt referansescenario <c2/>.

seg-e70cc0973fa3 = <b>Eksentriske baner og J2-drift.</b> Banetypen er nå en full Kepler-bane (store halvakse, eksentrisitet, inklinasjon, RAAN, perigeumsargument, middelanomali), propagert ved å løse Keplers ligning, med valgfri sekulær J2-noderegresjon og apsidepresesjon. Nye valgfrie scenariofelt <c1/>, <c2/> og <c3/>, og et referansescenario <c4/> (en bruker i en svært eksentrisk, kritisk inklinert bane på { "12" } h). Sirkulære baner beholder den opprinnelige lukkede banen bit for bit.

seg-cc041e16d418 = Hybridpakken (kombinert PNT) rapporterer nå <b>Integritet</b> og <b>Sikkerhet</b>, slik at alle fire pakkene dekker hele settet av operative kvalitetsmål. Integritet er innesluttingen i beskyttelsesgrensen for tidskanalen fra et Kalman-filter som styres mot referansen mens GNSS er nominell og forankres på nytt (mer løst) ved hver optiske resynkronisering; grensen inkluderer linkens målestøygulv, slik at en klokke som er langt bedre enn linken scores mot den leverte løsningens faktiske støy. Sikkerhet er den klokkestøttede spoofdeteksjonsscoren mot tidsspesifikasjonen.

seg-e0b666457d6e = Utgivelsesnotater genereres nå fra den kuraterte CHANGELOG-seksjonen for taggen (<c1/>), slik at hver GitHub-utgivelse fremhever hva som er endret i stedet for å liste rå commits.

seg-f785718e9454 = Kvalitetsmålet <b>Sikkerhet</b> (tidligere ikke fylt ut): en klokkestøttet spoofdeteksjonsscore for pakkene klokke-holdover og bane. Det modellerer en integritetsmonitor som krysssjekker GNSS-avledet tid mot klokkens egen predikerte glidning over et koherent vindu; deteksjonsgulvet kombinerer den midlede målestøyen med klokkens usikkerhet under glidningen, slik at en roligere klokke oppdager mindre, langsommere tidsspoofer. Scoren rapporteres i <c1/> relativt til tidsspesifikasjonen og fullfører de seks operative kvalitetsmålene.

seg-9164140872c8 = Geometriavledet <b>posisjonsnøyaktighet</b> for banepakken: fra siktlinjegeometrien til de synlige satellittene danner den designmatrisen og dens kovariansfaktor <c1/>, og gir faktorene for presisjonsfortynning (GDOP/PDOP/HDOP/VDOP/TDOP). Posisjonsnøyaktighet er posisjons-DOP skalert med en konfigurerbar brukerekvivalent avstandsfeil (nytt valgfritt scenariofelt <c2/>). Et baneresultat bærer nå et geometrisammendrag (andel samples med posisjonsbestemmelse, beste og median PDOP og posisjonssigma).

seg-3285502161c6 = En <b>lekeplass</b> i nettleseren (<c1/>) som kjører motoren hos klienten som WebAssembly: velg et referansescenario eller rediger TOML-en, kjør den og se sammendraget, diagrammet og hele JSON-en, uten at noe lastes opp. En arbeidsflyt <c2/> bygger og publiserer den til GitHub Pages, og en ny WebAssembly-eksport <c3/> ligger bak utlesningen.

seg-0dca5318f7ce = Y-akser med etiketter på SVG-diagrammene: rutenettlinjer, numeriske ticketiketter og en aksetittel med enheter (via en felles hjelper <c1/>), slik at størrelsesordener er lesbare.

seg-ce84a3d61f19 = Arbeidsflyt for pakkepublisering (<c1/>) til crates.io, PyPI og npm, hver sperret på sitt registertoken og utløst av en publisert utgivelse.

seg-0f01369fc29b = Flicker-FM-gulv (1/f) for klokkefeilmodellen, syntetisert som en sum av logaritmisk fordelte Ornstein-Uhlenbeck-prosesser og kalibrert slik at det flate Allan-deviasjonsgulvet ligger på et konfigurerbart nivå. Av som standard; slås på per klokke via det valgfrie scenariofeltet <c1/>.

seg-5b7fcd386fd3 = Gyrokanal for den inertielle modellen: gjenværende gyrobias og vinkelrandomvandring driver en attitydefeil (tilt) som kobler gravitasjon inn i en horisontal feil i spesifikk kraft, den dominerende mekanismen for feilvekst i strapdown. Av som standard; slås på per sensor via de valgfrie feltene <c1/> og <c2/>.

seg-efe9f10d2641 = Kalman-klokkeestimator med to tilstander (fase, frekvens) med eksakt van Loan-diskretisering av prosessstøy. Glidning fra en kjent tilstand gjengir den analytiske veksten i holdover-feil (<c1/>) eksakt, og filteret gir i tillegg en løpende usikkerhetsgrense på 1 sigma.

seg-539e24f34ed1 = Klokkekjøringen rapporterer nå kvalitetsmålet <b>Integritet</b> (tidligere ikke fylt ut): andelen bortfallssamples der feilen holder seg innenfor filterets beskyttelsesgrense på 3 sigma, vist i JSON-resultatet og CLI-sammendraget.

seg-80620c97e3f5 = Geometriavledet GNSS-tilgjengelighet: propagering av sirkulære baner, en generator for Walker-delta-konstellasjoner og siktlinjesynlighet (jordokkultasjon pluss elevasjonsmaske) gir tilgjengelighetstidslinjen fra ekte banegeometri. Ny scenariotype <c1/> og referansescenarioet <c2/> (et romfartøy inne i GNSS-skallet med periodisk dekning).

seg-67549163ad7d = Valgfri Python-utvidelse (PyO3, abi3) som eksponerer <c1/>, <c2/> og <c3/>, pakket med maturin (<c4/>) og bygget for Linux, macOS og Windows av en arbeidsflyt <c5/> utløst av utgivelsestagg. Bindingen er en funksjonssperret, valgfri avhengighet: standardbygget, testene og avhengighetsrevisjonen påvirkes ikke.

seg-c76dc363f0b1 = Valgfri WebAssembly-modul (wasm-bindgen) som eksponerer <c1/>, <c2/> og <c3/>, bygget med wasm-pack under funksjonen <c4/>; <c5/> er målsperret for å bruke nettleserens entropikilde på <c6/>.

seg-cf1b0eef2201 = Felles utsendelse <c1/> brukt av CLI-et og begge bindingene, slik at kommandolinjen og bindingene ikke kan drive fra hverandre.

seg-8d4f855d11bd = Scoring av holdover er nå segmentbevisst: bortfallstidslinjer deles i sammenhengende segmenter ved GNSS-gjenerverving, og den rapporterte holdoveren er den verste (korteste) glidningen på tvers av dem. Scenarioer med ett bortfall er uendret. Gjelder for scorerne for klokke, inertiell og hybrid.

seg-8b3556d125ed = Den inertielle modellens rapporterte <c1/> er nå <c2/> (var <c3/>), noe som gjenspeiler de kombinerte kanalene for akselerometer og gyro.

seg-d842f9cc0a9c = Første utgivelse.

seg-962b75c38735 = <b>Deterministisk simuleringsmotor</b> for hybrid kvante-/klassisk PNT: et felles grensesnitt for feilmodeller, deklarative GNSS-tilgjengelighetsscenarioer, estimatorer for holdover / dødregning og scoring av kvalitetsmål mot standard operative PNT-kriterier. Resultater kan reproduseres fra <c1/> (versjonert, selvbeskrivende JSON med scenariohash) og gjengis som SVG-diagrammer. CLI-et sender scenarioer videre etter <c2/>.

seg-16e574edc3a8 = <b>Fire sensorpakker</b>, hver kalibrert mot publiserte data og validert mot standardrelasjonen:

seg-b49bbb60c2cd = <b>Klokke-holdover</b> — hvit FM, random-walk-FM og lineær aldring; validert med overlappende Allan-deviasjon (Riley, NIST SP { "1065" }). Brikkeskala atomklokke mot optisk strontium-gitterklokke.

seg-be2c5f28b256 = <b>Inertiell dødregning</b> — gjenværende bias + hastighetsrandomvandring, dobbeltintegrert til posisjonsfeil; validert mot Groves' relasjoner for feilvekst. Kaldt-atom-akselerometer mot akselerometer av navigasjonsklasse.

seg-fcb0f72db736 = <b>Tidsoverføring</b> — tidsjitter i optisk mot RF-link → synkroniseringspresisjon → enveis avstandsmåling.

seg-93e5f2f70b58 = <b>Hybrid fusjon (avslutningsstykket)</b> — en kombinert PNT-suite som må holde både tid og posisjon, med valgfri klokkestøtte fra optisk tidsoverføring mellom satellitter.

seg-e0a8cbe0c105 = <b>Ett sitert referansescenario per pakke</b> under <c1/>, der hver numeriske parameter bærer en fagfellevurdert <c2/>.

seg-8f1cc09b2513 = <b>Vakter for reproduserbarhet og depothygiene</b>; CI (format, clippy, tester, vakter, MSRV) og en tagg-sperret utgivelsesrørledning som kjører alle kontrollene på nytt.

seg-8b4e21f56334 = <b>Dokumentasjon</b>: README med arkitekturdiagrammer, rapport om valideringsstatus, bidragsveiledning, sikkerhetspolicy og atferdsregler; Apache-2.0-lisens; maler for saker/PR-er og Dependabot-konfigurasjon.

seg-e26d94f06ead = Leverandørnøytral gjennomgående; fagfellevurderte vitenskapelige og metrologiske referanser er beholdt.

seg-84cb67686edf = Hygiene for Apache-2.0-lisensen: SPDX-headere i alle kilder, en <c1/> med varemerkemerknad, Developer Certificate of Origin (DCO)-signering for bidrag og håndheving av avhengighetslisenser/-varsler med <c2/> i CI.

seg-a0f14bea7532 = Posisjonering som åpen kjerne (README): en gratis Apache-2.0-motor pluss tilgjengelig kommersiell støtte, integrasjon og proprietære utvidelser fra Ashforde OÜ — båret av tjenester, ikke lisensavgifter.

seg-899815063eb1 = <c1/> slik at programvaren kan siteres.

seg-15f45d8ccb0f = <s1>Forrige</s1>Hvor Kshana står

seg-cd8a14a9e8ec = <s1>Neste</s1>Lisensiering

seg-1200856c90da = [{ $version }] - 2026-10-28

seg-05d0c798a196 = { "0.40" } legger til oppdragstråden i Artemis-klassen og månesegmentet, en evidensetikett på hver figur og tabell en kjøring skriver, innlesing og tilpasning av målte klokker, en kontroll av innsendinger fra datapartnere, en estimert senderregion fra ADS-B- eller AIS-rapporter, den nye benchmark-kampanjen for { "0.40" }, og kommandolinjen, rapportene og Studio på sytten språk ved siden av engelsk (maskindokumenter forblir engelske). Verifikasjonsmatrisen vokser fra { "388" } til { "401" } rader: { "176" } VALIDATED (uendret), { "221" } MODELLED (var { "208" }) og { "4" } PARTNER. Ingen rad ble oppgradert til VALIDATED. Scenariotypene vokser fra { "87" } til { "92" }. Hver terskel en forhåndsregistrert sammenligning bommet på, er oppgitt nedenfor og forblir festet; ingen ble løsnet. Den veiledende erklæringen er uendret: Kshana er veiledende programvare, ikke typegodkjent navigasjonsutstyr og ikke en sertifisering; operatøren er fortsatt ansvarlig.

seg-738f33f0ae8a = Kjente begrensninger

seg-d4062fab7ae1 = Kjøringer på andre språk tar omtrent dobbelt så lang tid, fordi scenarioet kjøres to ganger (én gang på engelsk for maskinfilene, én gang på det valgte språket for personen).

seg-8db6dedc627a = Noen Studio-setninger settes sammen av fragmenter og kan mangle artikler i språk som har grammatisk kjønn.

seg-86e6e35ac846 = Oversettelsene er maskinoversettelser som ingen morsmålsbruker har gjennomgått; engelsk er referansen.

seg-dd7ee240b467 = <b>Sytten språk ved siden av engelsk</b> for motorens tekst som mennesker leser, og for nettstedet og Studio: nl, pl, pt-BR, pt-PT, fi, sv, da, nb, cs, uk, ru, de, fr, es, et, ja, zh-Hans (<c1/>, <c2/>, språkvariablene; <c3/> i kall mot biblioteket, Python, WebAssembly og MCP). Meldinger og feil på kommandolinjen, kjøringsoppsummeringer, diagramtekst, <c4/>, typebeskrivelser og de veiledende erklæringene er oversatt; maskindokumenter (JSON, CSV, feilkoder, verifikasjonsmatrisen) forblir engelske, og en kjøring på et annet språk kjører scenarioet én gang på engelsk for maskinfilene og én gang på det valgte språket for personen (<a1><c5/></a1>). <b>Oversettelsene er maskinoversettelser, ikke gjennomgått av morsmålsbrukere; engelsk er referansen</b>; hvert språks <c6/> lister hva en som gjennomgår bør kontrollere først, og nettsidene har en merknad som sier dette. Utfallsord, evidensnivåer og omfanget av den veiledende erklæringen («ikke typegodkjent», «ikke en sertifisering», «operatøren er fortsatt ansvarlig») beholdes på alle språk.

seg-7a95c263ecec = <c1/>: en <b>estimert senderregion</b> fra ADS-B- eller AIS-rapporter. En posterior over hvor en kilde til forringede posisjonsrapporter kan befinne seg (radiosiktlinje på en 4/3-jordradius, senderantennehøyde og effekt marginalisert, berørte fly som trekker og uberørte fly med siktlinje som presser tilbake), skrevet som regioner ved { "50" }, { "90" } og { "95" } %, et tyngdepunkt med usikkerhetsellipsen sin (aldri et bart punkt), økter i tid (start, slutt, varighet, berørt areal, distinkte fly over publiseringsminimum), en døgnprofil og timer per dag, med valgfri fusjon av en TDOA-posisjonsbestemmelse fra <c2/>. Utdata: GeoJSON, JSON-sammendrag, CSV med økter og en SVG-figur, hver med lisens, kildeangivelse, metode-id, forutsetninger, begrensninger og sin evidensetikett. Bibliotek <c3/>, Python og WebAssembly <c4/>. MODELLED (registerrad <c5/>; matrisen er nå { "401" } rader, { "176" } VALIDATED, { "221" } MODELLED, { "4" } PARTNER); kalibrert bare på syntetiske data, med sammenligningen mot senderstedene fra Jammertest { "2025" } forhåndsregistrert og kjørt én gang: ADS-B og AIS begge NOT ASSESSABLE (for få planlagte økter i de åpne dataene), så raden forblir MODELLED (<c6/>). Nøytral ordlyd, bare aggregert; publisering av senderregioner i det offentlige observatoriet forblir av. Et syntetisk eksempel finnes i <c7/> (<a1><c8/></a1>).

seg-b8f971ebf318 = Målte klokkelogger.

seg-59b240848747 = <c1/> leser en målt klokkelogg inn i én faseserie: åtte formater (RINEX clock, TimeLab, TICC, linuxptp <c2/>, <c3/> og <c4/>, chrony tracking og statistikk), hvert en dokumentert delmengde; alt utenfor den avvises med en feil som navngir det som ble funnet. Den brukes av <c5/> (<c6/>) og klokketypen (<c7/>, som legger til en blokk <c8/> med SHA-256 for loggen og de overlappende ADEV, TDEV og MTIE), med det medfølgende scenarioet <c9/> (<a1><c10/></a1>). Sammenlignet med allantools på virkelige offentlige data mot forhåndsregistrerte terskler: første kjøring <b>bommet</b> på B1 ({ "5" } av { "11" } tilfeller, alle TICC-tidsstempler lagret som <c11/>), B2, B3 ({ "7" } av { "24" } tilfeller) og B4 (headerversjonen ble ikke kontrollert); etter rettingene er B1, B3 og B4 nådd, og B2 er nådd bortsett fra ett MTIE-par, som er festet og ikke er en motorfeil (allantools { "2024.6" } fjerner middelfrekvensen før det integrerer; mot dets fasemodus-MTIE stemmer motoren innenfor { "1e-10" }). Raden forblir MODELLED (<c12/>).

seg-400a39dbf3dd = <b>En holdover drevet av en tilpasset målt serie</b>: <c1/> i klokketypen tilpasser støyen i en målt serie og driver holdoveren fra den (<c2/>, medfølgende scenario <c3/>). Forhåndsregistrert sammenligning: F1(b), F3 og F4 nådd; F1(a) (gjenfinning av den registrerte random-walk FM) <b>NOT MET</b> på C3-postene (ikke identifiserbar ved konstruksjon) og på to av tre C4-poster (random-walk FM absorbert av flicker FM og drift); F2 (støyidentifikasjon mot allantools) nådd på elleve av tolv poster og D3 og <b>NOT MET</b> på D2 som registrert (nådd på like vilkår). Alle bom er festet (<c4/>); blokken <c5/> og holdoveren den driver forblir MODELLED (<c6/>).

seg-f1f15e102774 = <b>Den nye benchmark-kampanjen for { "0.40" }</b>, forhåndsregistrert med eierens underskrift før noen kjøring: A3 (EXPLORATORY, AUC fra bootstrap med mappeklynger for <c1/>, { "2.5" } % kvantil { "0.8502" } mot { "0.80" }), D3 (EXPLORATORY, tre av fem detektorer overskrider et optimismegap på { "0.05" } ved skala { "0.25" }), R3 (AUC { "1.0" }) og R4 (P_fa { "0.0" }, P_d { "1.0" }): alle MET, alle MODELLED. A2, D1 og R1 er urørt og forblir <b>NOT MET</b>; ingenting her lukker dem (<c2/>, <a1>Bench</a1>).

seg-b13f2dae66ea = <c1/>: kontrollerer formatet og metadataene i en innsending fra en datapartner (<c2/>: enhet, datafil og SHA-256, hvordan den ble tatt, radene som er MODELLED og som den tilbys mot, lisens, erklæringer) og leser dataene med motorens egne lesere for klokkelogg eller IMU. Den skårer ingenting og validerer ingenting. Et syntetisk eksempel finnes i <c3/>.

seg-823e1abc7f92 = <c1/>: hvilke registerrader som er MODELLED målte data kan oppgradere, hvilke formater som godtas, hvordan en innsending kontrolleres, skåres mot en forhåndsregistrert terskel og krediteres, og hva PARTNER og VALIDATED hver betyr; et utkast til et oppsøkende notat for eieren i <c2/> (ingenting sendes).

seg-34bdcfd66ded = I repositoriegrenen disse dokumentene kommer fra; ennå ikke på GitHub

seg-ddd45d39e8a9 = <b>Andre kampanjer for tersklene som ikke ble nådd for <c1/> og <c2/></b>, kjørt som forhåndsregistrert (<s1><c3/></s1>, <s2><c4/></s2>; underskrevet før noen kjøring). Hvert opprinnelig bom forblir NOT MET og festet. <c5/>: kontrollen gjengir kjøring { "1" } celle for celle; fem ablasjoner med én lesing hver bringer { "2" } av de { "78" } bommede cellene innenfor toleranse (EXPLORATORY, ingen terskel); den nye terskelen S7b (en sendeform med avrulling og gulv tilpasset på Classic IIR-paneler) er NOT MET på IIR-M-panelene ved { "3.83" } til { "3.95" } dB mot { "3" } dB; kampanjen med tilbakeholdt publisert mottak ble ikke kjørt (ingen kilde festet) (<s3><c6/></s3>). <c7/>: nye terskler C3a, C3b (en deteksjonsgrense på omtrent { "3e-9" } m/s2), Q3a, Q3b (en nøyaktig normal CDF fjerner forskjellen på { "1.7e-6" }) og G3'' er nådd som egne terskler, og G3' med illustrative priorer er nådd og merket EXPLORATORY (<s4><c8/></s4>). Alt forblir MODELLED. Nye offentlige elementer: <c9/>.

seg-bc89e70f4d36 = <b>En evidensetikett på hver figur og tabell en kjøring skriver.</b> Resultat-JSON har en nøkkel <c1/>, diagram-SVG-en et metadataelement og en linje under diagrammet, og CSV-tabellen kommentarlinjer <c2/>: nivået (<c3/>, <c4/> eller <c5/>, det svakeste av radene) og id-ene til radene i verifikasjonsmatrisen kjøringen hviler på. Rader og statuser leses fra matrisen, ikke skrives inn; id-ene er stabile (<c6/> og åtte heksadesimale sifre, en ny kolonne <c7/> i <c8/>, en fast liste i <c9/>). Også på receiver-trust, <c10/>, <c11/>, rapporten om ruteeksponering og, inne i den signerte <c12/>, hver bevispakke (<c13/> { "1.1" }; <c14/> rapporterer nivået; pakker laget før { "0.40" } verifiseres uendret). <c15/> feiler hvis en figur ikke har noen etikett, en etikett er uenig med matrisen eller en ny filskriver verken er merket eller oppført med en begrunnelse. Utdata som ikke bærer noen er oppført i <c16/>. De tre README-demodiagrammene ble tegnet på nytt med etiketten (å fjerne den gjenoppretter de gamle bytene; <c17/>). Ingen påstand ble endret.

seg-8abd87414bc4 = Scenariotypen <c1/> (<c2/>, <c3/>): feilbudsjettet for navigasjon og tidssynkronisering for en kjede av faser fra oppskyting til gjeninntreden, hvert tall MODELLED og hver inndata oppgitt. Åtte fasetyper: <c4/>, <c5/> (relativ Clohessy-Wiltshire-kovarians over sensoretapper, dokkingvindu), <c6/> (Cowell-propagering med en tilstandsovergangsmatrise med endelig differanse, brenningsfeil, oppdateringer fra <c7/> og fra bakkesporing, Månen fra et valgfritt DE440-kjerneutsnitt), <c8/> (sigma for banevinkel, korridorsannsynlighet, maksimal retardasjon ved korridorkantene, landingsfotavtrykk) og de fire lunare typene. Overleveringsregler (<c9/>, <c10/>, <c11/>), konverteringer av referansesystem og tidsskala som egne budsjettrader, et valgfritt bakkenettverksoverlegg som setter hver fases sporingsdrift, marginen mot oppgitte krav og det svakeste leddet. Eksemplet følger sekvensen i en offentlig lysbildeserie fra NASA om operasjonskonseptet med ILLUSTRATIVE tall: et ende-til-ende-eksempel i Artemis-klassen over { "11" } faser, jord- og månesegmenter. Den cislunare propageringen ble sammenlignet med den offentlige Artemis I-banen over en bue på { "72" } t mot en terskel fastsatt i <c12/> før kjøringen: <b>NOT MET</b> ({ "45.3" } km og { "0.25" } m/s mot { "5" } km og { "0.05" } m/s). Diagnostikken plasserer bommen i fem små impulsive hendelser i referansen; mellom dem gjengir kraftmodellen timestilstandene med en median på { "0.4" } m. Raden forblir MODELLED (<c13/>).

seg-67cad0a9c0c4 = Månesegmentet i oppdragstråden i Artemis-klassen: fire scenariotyper, hver også en fasetype i grensesnittet for <c1/> (<c2/>), alle MODELLED.

seg-63066076a0a8 = <c1/>: relativ navigasjon til dokking i en sirkulær polar bane på { "100" } km eller en elliptisk polar bane på { "100" } km ganger { "3000" } km (<c2/>, <c3/>). Et batch-estimat med Gauss-Newton over buen fusjonerer en absolutt posisjonsbestemmelse per fartøy fra et illustrativt relésett i LCNS-klassen, en vedvarende feil i signalet i rommet (felles for begge fartøyer og uavhengig) og en avstand over krysslenken, under månekraftmodellen i crate-en. Den rapporterer den relative posisjonen og hastigheten i målets lokale akser, tilgjengeligheten av posisjonsbestemmelser, den gjennomsnittlige normaliserte estimeringsfeilen i kvadrat mot forventet verdi, kostnaden ved å ignorere gravitasjonsharmonikkene, modellene for terminale relative sensorer ved siden av tallet med bare signaler, og 6x6-kovariansen som føres videre.

seg-a2d67bb5cfb3 = <c1/>: budsjettet for landingsspredning på et sted nær sørpolen (<c2/>; <c3/> leser LOLA DEM fra en utsjekking): en inertiell feilmodell med fem tilstander per akse, en AFS-posisjonsbestemmelse (alene eller differensiell, med korreksjonslenkens residual fra <c4/>), en terrengrelativ posisjonsbestemmelse (matcheren fra <c5/> på sitt syntetiske relieff, eller Cramer-Rao-grensen for matching mot LOLA DEM) og månetid gjennom fartøyets klokke (<c6/>). Den rapporterer 3-sigma-landingsellipsen, hver kombinasjon av hjelpemidler og en Monte Carlo-kalibrering av ellipsen.

seg-1babf99e8d56 = <c1/>: tilgjengelighet for posisjonering og tidssynkronisering etter sted og årstid (<c2/>; <c3/> legger til den strålemarsjerte LOLA-horisonten): posisjoneringstallet for ett sted er likt tallet for <c4/> bit for bit; synligheten til Jorden og Solen fra de analytiske efemeridene er det som beveger seg med årstiden.

seg-bae659d0ff4d = <c1/>: oppstigningen til rendezvous-banen og posisjons-hastighetskovariansen ført tilbake til bane (<c2/>), med spredningen ved motoravstengning rapportert ved siden av.

seg-106be12d960f = <c1/>; forhåndsregistreringen, endringene i den og hvert resultat, bom inkludert, i <c2/>.

seg-5e8880c28a67 = Forhåndsregistrert i <c1/> før noen kjøring, med seks daterte endringer (hver gjort før dataene ble hentet, unntatt endring { "6" }, som retter en regnefeil i et tilstandsantall etter hentingen og før noe A2-resultat; hver endring er oppgitt i filen). Ingen terskel ble løsnet.

seg-90adc3a3c58b = A1 (propagatoren mot LRO-banen rekonstruert fra JPL Horizons, { "24" } t): <b>MET</b>, en største 3D-forskjell på { "33" } m mot en terskel på { "500" } m og en radial RMS-forskjell på { "2.4" } m mot { "60" } m.

seg-69f903a278eb = A2 (den samme propagatoren mot CAPSTONE NRHO over én omdreining på 6.5 dager): <b>NOT MET</b>, en forskjell i sluttposisjon på { "136.8" } km mot en terskel på { "25" } km og en forskjell i oskulerende periapsisradius på { "28.4" } km mot { "10" } km. Raden forblir MODELLED, og bommen er festet av <c1/>.

seg-32fcafe8fa07 = B1 (rendezvous-estimatets konsistens med sin egen modell) er MET på den fjerde estimatorutformingen, gjennomsnittlig NEES { "5.85" } til { "5.93" } mot et bånd på [{ "5.2" }, { "6.8" }]; de tre tidligere utformingene, et utvidet Kalman-filter i tre varianter, bommet på det. En femte endring, gjort etter at det medfølgende scenarioet på { "2" } t viste seg å sende { "4" } av { "50" } forsøk inn i et lokalt minimum (gjennomsnittlig NEES { "1e9" }), kjører Gauss-Newton-tilpasningen på en voksende bue med steghalvering; B1 er uendret av den, og de medfølgende scenarioene gir { "6.51" } og { "6.33" }. Historikken står i <c1/>.

seg-a4b6bfcb9984 = Ingenting her er VALIDATED: radene for uavhengig referanse tester den delte propagatoren, ikke et navigasjonsfilter, signal eller budsjett.

seg-29d014d29790 = Én avhengighetsoppdatering i det leverte biblioteket (den første oppføringen), resten i verktøyene for kryssvalidering (<c1/>).

seg-6b6a960ca7cf = <c1/>, <c2/> og <c3/> { "0.13" } til { "0.14" } (med <c4/> { "0.14.3" }, <c5/> { "0.17.0" } og <c6/> { "0.5.5" } til { "0.7.10" }; også den direkte avhengigheten <c7/>, nå { "0.7" }) utbedrer RUSTSEC-2026-0387, tidsvariasjon i <c8/> { "0.5.5" }. Kshana bruker disse crate-ene bare til å verifisere offentlige signaturer (rotnøkkelen for Galileo OSNMA og RFC { "3161" }-tidsstempeltokener) og signerer bare i tester med engangsnøkler, så den praktiske eksponeringen var null; oppgraderingen fjerner varselet uten en ignorer-oppføring. Bibliotekets og MCPs låsefiler flyttes begge; ingen verifiseringsresultater endres (vektortestene for OSNMA og tidsstempler består uendret).
