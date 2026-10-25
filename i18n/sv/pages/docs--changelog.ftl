# docs--changelog: translations (sv)

seg-9a2a5f0a8a02 = Solsystemet

seg-20db2c79b998 = Validated

seg-a20b4a6e8f53 = chipskalig atomklocka

seg-49a994d77d2f = temperaturkompenserad kristalloscillator

seg-2247a2344710 = Betydelse

seg-5770537524d3 = Område

seg-40d4fc0d3922 = Källa: <c1/>

seg-7333b85d448f = Alla anmärkningsvärda ändringar i Kshana dokumenteras här.

seg-bbc8f38627f1 = Formatet bygger på <a1>Keep a Changelog</a1>, och det här projektet följer <a2>Semantic Versioning</a2>. Så länge projektet är före 1.0 kan det publika schemat för scenario och resultat fortfarande ändras; brytande ändringar anges uttryckligen.

seg-985f7b4c001a = Oreleaserat

seg-66749e5be121 = [{ $version }] - 2026-10-22

seg-a2f583aadd0b = Inga nya funktioner: en rättning i kommandoraden, beroendeuppdateringar i verktygen för korsvalidering och dokumentation. Motorns resultat är oförändrade från { "0.38.0" }.

seg-c9a8a5898ced = Rättat

seg-3cc8ba4d1be6 = Kommandoraden avslutas tyst med status { "141" } när dess standardutdata stängs (<c1/>), i stället för att krascha med "failed printing to stdout: Broken pipe". { "141" } är { "128" } plus SIGPIPE, den status ett skal rapporterar för <c2/>. Endast ett stängt rör hanteras: en full disk eller något annat skrivfel rapporterar fortfarande sig självt, och ett levande flöde som skriver till ett stängt uttag får fortfarande sitt skrivfel. <c3/> stänger läsaren innan programmet startar, så den första skrivningen misslyckas vid varje körning.

seg-2a47e785cc1d = Beroendeuppdateringar i verktygen för korsvalidering (<c1/>); inga ändringar i levererade crates, wheels eller paket.

seg-9df898fb24be = <c1/> { "0.9.10" } till { "0.9.11" } (RUSTSEC-2026-0186) i låsfilerna för ANISE-korskontrollen (<c2/>, <c3/>); låsfilerna synkar också om sökvägsberoendet <c4/> i repositoryt.

seg-835e9d6058f8 = <c1/> { "12.3.0" } till { "13.0.0" } och <c2/> { "2026.7.22" } till { "2026.10.19" } i fastlåsningarna för referensmiljön (<c3/>, <c4/>): de korrigerade versionerna för åtta pillow-säkerhetsmeddelanden och ett certifi-säkerhetsmeddelande.

seg-902fc421a851 = <c1/>, README och den här filen listar varje kshana-bench-tröskel som är NOT MET, så som den är registrerad i <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } mot minst { "0.80" } på testdelningen), <b>D1</b> (största glapp { "0.0301" }) och <b>uppgift (b) R1</b> (överförd, inte körd om). Ingen tröskel har lättats.

seg-44d9c9622c24 = Genomgång av README:ns fullständighet: en innehållsförteckning; scenariotyperna ordnade under familjer, var och en med en sida under <c1/> (motorns beskrivning och fält, indata och resultat från en exempelkörning, registerraderna och de oberoende referenserna, de begränsningar som körningens rapport anger och diagrammet som motorn skriver), ett översiktsblad per familj, alla indexerade av <c2/>; varje kommando i <c3/>; varje yta, insticksmodulskommando, färdighet och Studio-sida i <c4/>; varje förmågedomän i <c5/>; inbäddade Mermaid-diagram (systemöversikt, ytor, inre slinga, receiver trust, laboratorieringlopp, Studio, test- och releaseflöde, modulkarta, distribution). Skrivet av <c6/>, <c7/> och <c8/>; granskat av <c9/>; bevakat av <c10/>, som också låser varje posts beskrivning och fält mot motorn.

seg-b953186d5726 = <c1/>: renderar ett Mermaid-diagram till SVG och PNG på Linux och uppdaterar renderingsposten.

seg-68e19f94faed = README: figurerna för rymdanvändare och månen använde sökvägar relativa till <c1/>, så de lästes inte in från README; en länk pekade på <c2/>.

seg-850e1574e2d6 = Två föråldrade handkopierade diagramfiler togs bort (<c1/>, <c2/>) som ingen sida använde och som inte längre stämde med motorn; <c3/> bär de aktuella diagrammen.

seg-033d52126d8a = Tillagt

seg-090bf5ae96b6 = <b>GNSS bortom konstellationen (<c1/>).</b> En ny scenariotyp för rymdfarkoster ovanför, runt och bortom GNSS-banorna (<a1><c2/></a1>): tillgänglighet för en och fyra signaler, avbrottstider, C/N0, DOP samt huvudlob mot sidolobslänkar för GPS, GLONASS, Galileo, BDS, QZSS och NavIC på ett skal eller längs banor i LEO, MEO, GEO, HEO och månöverföring; sändarmönster från häfte, parametriska eller användarlevererade; en modell av limbstrålar för jonosfär, plasmasfär och atmosfär; en utformning av en mottagare för svaga signaler; ett utvidgat Kalmanfilter för GNSS ombord för HEO och månöverföring; samt relativ navigering i formation. Jämfört med ICG:s häfte om Space Service Volume under en förhandsregistrering incheckad före körningen: konstanterna för minsta utstrålade effekt och månens tröskel stämmer, de andra trösklarna är inte uppfyllda under den förhandsregistrerade läsningen (nästan alla på grund av häftets inkonsekventa stråle-vinkel för GLONASS), och den parametriska sidolobsersättningen återger inte de uppmätta GPS-panelmönstren. Allt förblir MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Månbana och månyta som navigations- och geodetisk infrastruktur (<c1/>).</b> En ny scenariotyp med fem studier valda med <c2/> (<a1><c3/></a1>): konsistens hos en banbestämning ombord med Jord-GNSS i en nästan rätlinjig halobana mot en oberoende bestämning från marken med avstånd och avståndshastighet; gemensam dubbeldifferentierad bärvågsfas mellan ytstation och omloppsfarkost med heltalsfixering enligt LAMBDA; Fisher-information för månens datum med sju parametrar med och utan avstånd mellan omloppsfarkost och yta; avvikelser mellan tekniker för GNSS, VLBI och laseravståndsmätning mot den lokala kopplingen; samt känslighet för h2, k2, l2 och den fysiska libration. MODELLED, med ILLUSTRATIVE indata: numeriken kontrolleras mot oberoende numpy- och scipy-program, och inget jämförs med en mätning av någon månstorhet. Trösklarna fastställdes i <c4/> och två redovisade ändringar. Tre är NOT MET och var och en är fastlåst av ett test som hävdar missen: C3 (ett injicerat kraftfel upptäcks inte med den förhandsregistrerade frekvensen), Q3 (den bootstrappade framgångsfrekvensen skiljer sig från numpy-referensen med { "1.7e-6" } mot en tröskel på { "1e-9" }, från LAMBDA:s normalfördelningsapproximation) och spårhalvan av G3 (att lägga till en avståndsfamilj sänker inte alltid spåret av pseudoinversen). Resten är uppfyllda (<a2><c5/></a2>).

seg-022859135e79 = <b>En sjätte artikel i forskningstabellen.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) visar att dilution of precision är odefinierat för cislunär spårning med enbart avstånd och använder i stället observerbarhetsgramianen på fyra plana avlägsna retrograda banor: enbart avstånd har rang { "2" } av { "4" } i ett ögonblick och behöver en båge på cirka { "2.09" } h, avståndshastighet (Doppler) ger rang { "4" } omedelbart, och samuppskattning av en station med satellittillstånd och klockor förblir rangdefekt med ett utan en extern interferometrisk observabel. Dess tal regenereras av typen <c1/> (<c2/>); <c3/> testar tröskeln med en oberoende skattare. README:ns forskningskort, README-filerna för crates, npm och PyPI samt generatorn bär den.

seg-d74a1b2dcb38 = Den neutrala domaren, gjord mätbar.

seg-bf568567fe06 = <c1/> läser den publicerade NPRA Jammertest-katalogen och sändningsplanen som schemalagd referens (katalog-id:n bevarade) och <c2/> poängsätter en mottagarlogg mot den per test (detektionsfördröjning, missade larm, falsklarm, tid till återhämtning), som tillval som ett signerat bevispaket (<a1><c3/></a1>). Poängsättningens trösklar förhandsregistrerades före varje poängsatt körning (<c4/>). På datamängden JammerTest { "2024" } (hämtad, aldrig medföljande) misslyckades den förhandsregistrerade regeln om minsta datamängd både i den första körningen och i revisionen av datahanteringen, så ingen tröskel kan bedömas och inget görs gällande; båda körningarna är registrerade och fastlåsta. MODELLED: schemat är datamängdens loggade fönster, inte registrerade sändningstider. NMEA-uppsättningen från SimulaMet { "2025" } är inte anpassad (ingen licens angiven på dess sida).

seg-0a2bcad8d645 = <b>Mottagarens egna flaggor, bredvid Kshanas.</b> UBX-NAV-STATUS <c1/> och UBX-SEC-SIG läses in i <c2/> vid varje epok, och jämförelsen <c3/> i resultatet ställer dem mot Kshanas övervakare (båda, endast mottagaren, endast Kshana, ingen); den ger inget larm och ändrar ingen poäng. En Septentrio SBF-läsare (PVTGeodetic, MeasEpoch, RFStatus, skrivskyddad, på MIT-licensierade cratet <c4/>) och <c5/> (ett seriellt eller USB-NMEA-flöde, skrivskyddat; det skriver aldrig till en mottagare) hör till dem.

seg-90d9927fe3e2 = <b>Tidssynkronisering och hårdvarusäkerhet</b> (<a1><c1/></a1>, <a2><c2/></a2>). Scenariotypen <c3/> poängsätter ett holdover-test av ett tidssystem (GNSS borttaget av operatören, holdover, återhämtning) från en uppmätt tidsfelsregistrering, mätt mot ITU-T-masker från offentliga tabeller. <c4/> läser loggar från linuxptp (<c5/>, <c6/>, <c7/>) och chrony (<c8/>, <c9/>). <c10/> skriver ION GNSS SDR-metadata och <c11/> övervakar en SigMF-inspelning medan den växer (endast mottagning). <c12/> får NIST IR 8323r1 Foundational PNT Profile ({ "15" } omskrivna rader, ger belägg för). Ett bevispaket kan registrera operatörens <c13/> i sitt signerade manifest, aldrig verifierat; hårdvarustegen { "0" } till { "4" } och de juridiska anmärkningarna finns i <c14/> (väntar på juridisk granskning). Det finns ingen sändningsväg av något slag.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): fasta uppgifter, delningar och mått för detektion av GNSS-störning i mottagarloggar (JammerTest { "2024" }) och IQ, prediktion av holdover för tidssynkronisering (IGS-klockor) och optimismglappet utanför fördelningen; delningsmanifest med fastlåsta hashar och hämtningsskript (inga data medföljer), en undanhållen datamängd genom commit och avslöjande, ett schema för resultatfiler och en statisk topplistesida. Baslinjer under trösklar förhandsregistrerade i <c4/>: poängsättarens trösklar uppfyllda, C1 till C3 uppfyllda, D2 uppfylld; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } mot minst { "0.80" } på testdelningen), <b>D1 NOT MET</b> (största glapp { "0.0301" }) och <b>uppgift (b) R1 NOT MET</b> (överförd, inte körd om), var och en fastlåst (<c6/>). Varje poäng är MODELLED. Python <c7/>, <c8/>; WebAssembly detsamma; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Störningsobservatorium</b> (<c1/>, <c2/>, <a1><c3/></a1>): en reproducerbar daglig GeoJSON, PNG och incident-rapport i JSON med tre tillstånd (degraded, not degraded, not observed), en minsta fördröjning på { "24" } h, celler på { "0.5" } grader eller grövre, ingen orsak tillskriven och OpenSky-data avvisade; en känslighetsstudie av de förhandsregistrerade parametrarna; ett bakåtriktat katalogmaterial för Östersjön över 30 dagar från adsb.lol.

seg-497ae18bfb03 = <b>Maskin- och sensorindata för <c1/></b> (<a1><c2/></a1>). Nya värden för <c3/>, alla skrivskyddade, MODELLED, med självskrivna fixturer och inga data medföljande: <c4/> (RTKLIB <c5/>-lösningsfiler), <c6/> (OEM7 ASCII och binär <c7/>, <c8/> C/No och <c9/>; mottagarens jammer-flagga blir epokens <c10/>, ställd mot Kshanas larm av jämförelsen <c11/>), <c12/> (MSM4 och MSM7 C/N0 för GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou och NavIC; layouter från de BSD-licensierade pyrtcm-tabellerna, vars meddelande finns i <c13/>, inte från RTCM-standarden) och <c14/> (GNSS-SDR Monitor- och PVT-monitor-meddelanden som JSON-rader, vidarebefordrade av <c15/>).

seg-22e8b434782f = IMU-loggar som en andra sensor.

seg-5491196d6421 = <c1/> (<c2/> eller <c3/>) integrerar gyrots girhastighet till den färdriktning som övervakaren <c4/> läser; inbyggd på varje yta och förd vidare genom bevispaket. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, insticksmodul <c9/>, en JetBrains-åtgärd) anpassar accelerometerns och gyrots parametrar för scenarierna <c10/> och <c11/> från en stillastående logg med Allan-avvikelse och skriver ut en tabell <c12/> med loggens SHA-256 i sin proveniens.

seg-f48fdf6252cd = <b>Integrationer:</b> ett ROS { "2" }-paket (<c1/>: NavSatFix och <c2/> in, förtroendeämnen ut; dess ROS-fria brygga testas mot den verkliga motorn, själva noden har inte körts på en levande ROS-graf), en brygga <c3/> (<c4/>, MIT-beroende, valfritt) och ett GNSS-SDR-relä.

seg-1a8727ad42bb = <b>Home Assistant MQTT-exportör</b> för förtroendetelemetri: <c1/> och <c2/> (discovery-meddelanden och ett JSON-tillståndsdokument; endast publicering, inga inloggningsuppgifter eller TLS), och <c3/> som text i Python, WebAssembly och MCP.

seg-f1cb2c2881c9 = Sju MODELLED registerrader för ovanstående. Inget här är VALIDATED: ingen inspelning från en verklig mottagare, basstation, IMU, GNSS-SDR-körning, ROS-graf eller MQTT-broker lästes.

seg-12c7a28c80b5 = <b>Optisk länkmarginal över tid.</b> Typen <c1/> tar en valfri tabell <c2/> (<c3/>, <c4/>, <c5/>) och skriver då också, per plats, en frösatt realisering av den angivna platsmodellen genom tiden: molnepisoder, en vattenpelare i vätskefas per episod, ett gamma-gamma-scintillationssampel per steg, och utifrån dem länkmarginalen, moln- och scintillationsfädningarna och flaggan för länk uppe, med den realiserade tillgängligheten, molnandelen, antalet avbrott och det längsta avbrottet. MODELLED (en dragning ur modellen, inte klimatet; ingen extern oberoende referens). Utan tabellen är resultatet dokumentet från { "0.37" }. De två medföljande optiska scenarierna bär tabellen ({ "336" } h, { "600" } s, frö { "37" }). Trösklar förhandsregistrerade i <c6/> före den första körningen.

seg-78524dbb3bd2 = Specifikation för testförhållanden och laboratorieringloppet.

seg-fbf034925641 = <c1/> publiceras som <a1><c2/></a1> med ett JSON-schema, och får <c3/>. <c4/> skriver också <c5/>. <c6/> bygger ett signerat paket som länkar scenariots hash, hashen för de angivna förhållandena, mottagarloggens hash och poängen mot de angivna händelserna, och avvisar förhållanden som inte stämmer med poängsättningens händelser. Genomarbetat exempel med gps-sdr-sim som endast skriver en fil; uppspelning är operatörens ansvar och automatiseras aldrig. Python <c7/>, MCP <c8/>, insticksmodul <c9/>.

seg-8bda4472d561 = <b>Standardpaket</b> (<c1/>, <c2/>): testprofilerna för nivåerna { "1" } till { "4" } i DHS Resilient PNT-ramverket, noggrannhetsnivåerna och integritetsutvärderingen i IMO MSC.1/Circ.1575 samt övervakning, bedömning och begränsning i ICAO Doc { "9849" } Appendix F, var och en en uppsättning scenarier poängsatta mot trösklar angivna före körningen, med de rader i compliance-report som de ger belägg för. Missar är registrerade och fastlåsta: DHS L4-T1 och de fyra noggrannhetstesterna i IMO. Doc { "9849" } i sig lästes inte (betalt); ICAO-paketet följer ICAO:s egen presentation av RFI Mitigation Plan. <c3/> får ett avsnitt för standardpaket. Alla MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): Gold-koder för AFS-I och Weil-koder för AFS-Q för PRN { "1" } till { "210" }, signalerna <c2/> och <c3/> i <c4/>, SB1 BCH-koden, CRC-24Q och interfolieraren samt <c5/> (<c6/>, <c7/>, <c8/>), fastlåst till LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }). Koderna VALIDATED mot dokumentets tryckta tabeller (som det markerar TBC); en tryckt tertiär kolumn (PRN { "147" }) är sannolikt ett tryckfel och missen är fastlåst. LDPC-kodning av underramarna { "2" } till { "4" } är inte implementerad.

seg-5a5720500b6d = <b>Kursanteckningsböcker</b> (<c1/>): jamming, spoofing, holdover, integritet, OSNMA och störningskarta, var och en med övningar.

seg-3d543433051c = <b>Studie av maximal URA i EU-US WG-C ARAIM Milestone { "3" }</b> (<c1/>, <c2/>), som ersätter den tillbakadragna planen "Table A-3"; MODELLED under angivna avvikelser.

seg-4f1f786e2658 = <b>Utkast för ägargodkännande</b> under <c1/>: JOSS-artikel, ändring av TSC-stadgan, process för register över oberoende referenser och ett förslag om uppdelning av <c2/>. Inget där är antaget.

seg-49a758039871 = <b>Studio-vyer för funktionerna i { "0.38" }</b> (kshana.dev/studio/). Brygguppspelning (två syntetiska körningar på en klocka: spår, förtroendepoäng, de satelliter loggen hör och utslaget, med mottagarens egna flaggor bredvid Kshanas larm); Optisk PNT (de två scenarierna <c1/>, med en valfri frösatt realisering av <c2/>, MODELLED); Holdover-test (resultatet <c3/> mätt mot ITU-T-masker, ritat från resultatets egen <c4/>); en vy för störningsobservatoriet som öppnar de filer du producerat och inte levererar några; på sidan Verktyg en Jammertest-poängsättare, en IMU-anpassning och MQTT som telemetriformat; och i Förtroende en väljare för loggformat (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) med en valfri IMU-fil. Varje vy läser filer i webbläsaren och laddar inte upp något; varje tal behåller den etikett som registret har för det, och var och en bär den rådgivande försäkran. Webbplatssidan <c6/> visar fragmentet <c7/>.

seg-91f6beb29f8e = <b>Ärende #36: byteexakta fastlåsningslager.</b> Byteexakta fastlåsningslager körs bara på en värd som deklarerats som baslinje (<c1/>, satt av <c2/>), inte på varje Mac med Apple-kisel, eftersom Apples matematikbibliotek skiljer sig mellan macOS-versioner; det portabla lagret körs överallt, och <c3/> hindrar att ett byteexakt lager åter grindas enbart på plattform. Själva jämförelserna med oberoende referenser passerar på macOS. Ingen literal togs om och ingen tolerans ändrades. <c4/> och <a1><c5/></a1> beskriver hur en skillnad utreds; <c6/> är en manuell och veckovis diagnostik, inte en grind.

seg-15070f7dcc0a = <b>CodeQL: ett ej förankrat mönster i Studios hjälpfunktion trust-open</b> matchar nu hela headern (<c1/>).

seg-56856063519f = <b>CI: körarens disk.</b> Jobbet <c1/> bygger profilerna för utveckling och test utan felsökningsinformation, så länkningen fyller inte längre disken.

seg-38c59868835e = <b>Källskydd.</b> Varje källfil som innehåller fixturer med fastlåsningar för test deklarerar sin fastlåsningsomfattning, och testerna som skriver temporära filer använder en unik sökväg per anrop, så parallella körningar inte kan kollidera.

seg-884f693585fa = <b><c1/></b> regenereras för det valfria fältet <c2/> i optical-atmosphere.

seg-e16d328f3967 = <b>JetBrains-insticksmodul: ingen användning av föråldrat plattforms-API eller API som är planerat att tas bort.</b> IntelliJ Plugin Verifier (<c1/>) mot IntelliJ IDEA-bygget { "263" } ({ "2026.3" }: { "263.6800.24" } och { "263.7031.23" }) fann ett föråldrat anrop, <c2/>, i Insert Example; den öppnar nu den nya filen med <c3/>. Insticksmodulen är kompatibel med och ren på { "2024.3" } (since-build, oförändrad) och båda { "263" }-byggena. CI kör nu <c4/> och misslyckas vid kompatibilitetsproblem och vid varje användning av API som är planerat att tas bort.

seg-07ce053c906a = <b>Optisk PNT genom atmosfären</b> (scenariotypen <c1/>, <a1><c2/></a1>, designanteckning <c3/>). För en optisk länk och en uppsättning markplatser redovisar den den våglängds- och elevationsberoende förlusten i klar luft, turbulenstillståndet enligt Hufnagel-Valley (Rytov-varians, scintillationsindex, gamma-gamma-fädningar, aperturmedelvärdesbildning), tillgängligheten mot länkmarginalen utifrån ett angivet molnklimat, den marginal som behövs för måltillgängligheter och taket som ingen marginal lyfter över, fördelningen av avbrottstider, tids- och avståndsfelet per avbrott genom klockans holdover-modell, avståndskorrelerad platsdiversitet samt vad-händer-om-vinster för ett byte av våglängd, en större apertur, scintillationsminskning med adaptiv optik och extra marginal. <c4/> får en atmosfärsmedveten budget; utan en är dess utdata bitidentiskt med { "0.36" } (tröskel A5). Två medföljande scenarier bär ILLUSTRATIVE molnklimat. MODELLED: tre registerrader. Numeriken uppfyller trösklarna A1 till A6 förhandsregistrerade i <c5/> mot ett oberoende mpmath-program; det kontrollerar implementeringen av de angivna formlerna, inte atmosfären, och ingen uppmätt tillgänglighetsregistrering har jämförts, så ingen rad är VALIDATED. Tröskeln A4 missades först med { "3e-9" } eftersom den normalfördelningsfunktion som användes var en approximation på { "1.5e-7" }; fördelningsfunktionen byttes ut och tröskeln lämnades som registrerad. De inbyggda och WebAssembly-byggena returnerar byteidentiska dokument för båda medföljande scenarierna (A7, körd på integrationscommiten för { "0.37.0" }).

seg-eb589aff44ad = <b>ROC för detektion hos IQ-övervakarna</b> (PRO-32, <a1><c1/></a1>). En kampanj med övervakare behåller varje teststatistiks maximum över fönster med angivna händelser (positiva) och uppdelade fönster utanför händelserna (negativa, <c2/>). Rapporten poolar dem per larmtyp till en ROC med dess AUC och arbetspunkten vid den konfigurerade tröskeln, som <c3/> och ett rapportavsnitt. På syntetiska kampanjer är kontrollen av slumpnivån uppfylld. Tröskeln för C/N0-AUC ({ "0.95" }) är inte uppfylld ({ "0.79" }), eftersom de negativa fönstren direkt efter en händelse ärver CUSUM:ens avklingning från detektionen; detta är registrerat. MODELLED.

seg-d25a34e23f1a = <b>IQ-övervakare i kampanjen för laboratorieuppspelning</b> (PRO-31, <a1><c1/></a1>). En valfri tabell <c2/> i en kampanjfil kör IQ-övervakarna i körarens enda genomgång: effekt och spektral efter varje frontändkedja, samt C/N0, SQM och lås per spårad kanal. Deras larm poängsätts mot de angivna händelserna: detekterat eller missat, tid till detektion och falsklarm per exponeringstimme. Varje tests slutna form för falsklarm anges, inklusive ett nytt tvåsidigt gaussiskt tal för SQM-testerna (<c3/>). Utan tabellen ändras ingenting. På syntetiska kampanjer är trösklarna för falsklarm för effekt och SQM samt för C/N0 uppfyllda; { "18" } av { "18" } dämpningar detekteras, men gränsen för tid till detektion, under ett detektorsampel per konstruktion, är inte uppfylld och är registrerad. MODELLED; registerraden "IQ monitors scored in lab-replay campaigns".

seg-8eb0f650065e = <b>Laboratorieanpassning från IQ-kampanjer, uppföljning</b> (<c1/>, CI-jobb <c2/>). Den testar de två hypoteser som § { "13.6" } i <c3/> lämnade öppna, mot trösklar förhandsregistrerade i 1e532f84. Den lägger till två syntetiska kampanjer: S, med ett stegvis J/S (frö 2026_1014), och R, en ny ramp (frö 2026_1015). Resultaten finns i <c4/>.

seg-ce60405d0005 = S1 uppfylld: med varje J/S-nivå hållen återfås <c1/> inom +{ "0.185" } dB. Rampkampanjernas fel på −{ "1.1" } dB är skattarens eftersläpning.

seg-ea9f206c2999 = S2 inte uppfylld, fastlåst av ett test som hävdar missen: (d) som skrivet på den stegvisa kampanjen gäller för modellen med spårningsslinga ({ "0.45" } dB) men inte för den empiriska ({ "6.42" } dB).

seg-fab0653558e4 = R1 uppfylld: på den nya rampkampanjen ligger (d) med de anpassade vilotiderna för fall gånger varje händelses ramphastighet inom { "1" } dB för båda modellerna.

seg-24c6725c2c7d = Missarna för (a′) och (d) återskapas på R.

seg-7cbbce356973 = En kampanj kan nu ange sitt J/S som en profil <c1/> i testramen.

seg-34007ba58a9f = Inget utslag i § { "13" } ändras, och registerraden förblir MODELLED.

seg-df2c3f2532d6 = <b>Begränsad FLL-inlåsning, tillval</b> (DS-LOOP-05): en ny nyckel <c1/> (s) för slingutformning, i Rust <c2/>. Under <c3/> tvingar den fram överlämningen från FLL till PLL efter så lång tid, oavsett PLI. Osatt som standard, och då utanför utformningens hash; standardutformningen och dess hash är oförändrade.

seg-ae2794b2d3d5 = Kontrollerad mot trösklar förhandsregistrerade i 58789af0, på injicerad referens. Kontrollen är uppfylld: standarden lämnar aldrig över i { "9" } av { "10" } frön vid { "33" } dB-Hz.

seg-6d9483874b35 = Inte uppfylld: med ett tak på { "1.0" } s håller { "16" } av { "20" } körningar lås vid { "33" } dB-Hz och { "8" } av { "20" } vid { "31" } dB-Hz; de andra växlar mellan påtvingade överlämningar och FLL:ens återgång. Fasjittret är { "1.8" }× enbart PLL vid { "33" } dB-Hz.

seg-deeefaf50e3e = Golvet för inlåsning på ~{ "35" } dB-Hz förblir standardens dokumenterade gräns.

seg-780de73c01e1 = MODELLED; registerraden "Capped FLL pull-in below the default design's FLL-to-PLL hand-over floor (opt-in)".

seg-ace6b53749bd = <b>Hysteres vid acquisition och frontändens kvantiserare i jamming-typen</b> (CAP-06c): två valfria sektioner för ett <c1/>-scenario.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, vid eller över spårningströskeln) och <c3/> (s, standard { "0" }). En satellit acquireras vid eller över acquisition-tröskeln, när den har varit oacquirerad under fördröjningen. Den hålls så länge den ligger vid eller över spårningströskeln. Utdata: <c4/> (true/false), <c5/> (antal) och <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> ({ "1" } till { "16" }) och <c3/> (MHz, standard dubbla chiphastigheten). Ger ett block <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, avdragen från varje länks effektiva C/N0) och <c8/>. Förlusten är den för gaussisk indata, flaggad som ogiltig för CW-, smalbandiga och svepande jammers.

seg-0dad81736863 = Utan sektionerna är varje utdata byteidentiskt.

seg-92007bfb6680 = Kontrollerad mot trösklar förhandsregistrerade i 70c72fcc. Kvantiseringsförlusten ligger inom { "0.0007" } dB från en oberoende Monte Carlo, och AGC-avläsningen inom { "0.012" } dB från IQ-lagrets AGC-slinga.

seg-973e451df99d = De registrerade körningarna för hysteres var ointressanta (varje länk förlorad), så den tröskeln är NOT MET. En kompletterande körningsuppsättning registrerad i { "37793290" } uppfyller den: varje flagga är lika med en oberoende omräkning, och { "732" } av { "1824" } länkar visar hysteresen.

seg-912e9f1a4d5b = Fynd: med en CW-jammer förlorar en 1-bitars ADC omkring { "5" } dB mer än det gaussiska talet.

seg-a19aee81b581 = MODELLED; registerraden "Acquisition hysteresis and the front-end quantiser in the jamming kind against independent recomputations".

seg-97f43a4fe71d = <b>Terrängskuggning av jammern i jamming-typen</b> (CAP-06b): en valfri sektion <c1/> i ett <c2/>-scenario med en jammer. Fält:

seg-6d59a2857ab9 = <c1/>: en SRTM-ruta <c2/>, relativt arbetskatalogen;

seg-fa5b15500405 = <c1/>, <c2/> och <c3/> (deg): rutans storlek och hörn;

seg-09a35655f010 = <c1/> (m, standard { "0" }), <c2/> (standard 4/3) och <c3/> (m, standard { "30" }).

seg-ad58fe7ff627 = Motorn samplar storcirkelns terrängprofil mellan jammer och mottagare och finner den dominerande knivseggen. Jammerns mottagna effekt, och därmed varje J/S, sänks av förlusten för en enda knivsegg enligt ITU-R P.526-15 § { "4.1" }.

seg-001d7b88b26d = Resultatet får ett block <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) och <c7/> (antal).

seg-b9696f5eda4b = Utan sektionen är varje utdata byteidentiskt.

seg-593b6a5b4480 = Kontrollerad mot trösklar och tio placeringar förhandsregistrerade i 92cd2bfd, på den incheckade verkliga SRTM-rutan över Death Valley, mot en oberoende omräkning i numpy. Alla uppfyllda: sämsta skillnad { "1.6e-10" } på <c1/> och på förlusten (tröskel { "1e-9" }), förlusten monoton i jammerhöjd, och förlusten når J/S exakt.

seg-62e07defd715 = MODELLED; registerraden "Terrain shadowing of the jammer in the jamming kind against an independent numpy recomputation on a real SRTM tile".

seg-378e9052e2c4 = <b>CRPA-antennförstärkningar i jamming-typen</b> (CAP-06a): en valfri sektion <c1/> i ett <c2/>-scenario. Fält: <c3/> (elementpositioner i lokalt öst-nord-upp, m), <c4/> (<c5/> eller <c6/>) och <c7/> (MVDR-brusbandbredd, MHz, standard dubbla chiphastigheten).

seg-ca39fefc0fb3 = Varje kanal bildar en distorsionsfri stråle mot sin satellit. Länkens brus skalas med <c1/> och jammern med <c2/> före den befintliga C/N0-ekvationen för anti-jam.

seg-1f1ddc11ad94 = Varje länk får ett block <c1/>: <c2/> (dB) och <c3/> (dB).

seg-790ecc6a1bd4 = En ogiltig sektion (en tom elementlista, en okänd viktning, en icke-positiv bandbredd) är ett fel, genom <c1/> och <c2/> liksom <c3/>.

seg-2464d9dde85f = Kontrollerad mot trösklar förhandsregistrerade i 08d83b4d. Uppfyllda: additivitet (efter en rättning: det första bygget lade till de nya enheterna i enhetstabellen för varje jamming-körning); ett element är ingen grupp; brusförstärkning och effektiv C/N0 mot en oberoende omräkning i numpy inom { "1e-9" } dB; MVDR går mot nollan vid högt JNR.

seg-c04495f7a65a = Inte uppfylld: MVDR:s jammerförstärkning på { "194" } av { "456" } länkar på bärbar matematik i { "0.36" } ({ "202" } på värdmatematik; <c1/>) (sämsta { "1.7e-6" } dB). Residualerna på −{ "100" } till −{ "188" } dB ligger under float64:s upplösning vid den tröskeln, och numpy avviker från sig självt med samma storleksordning.

seg-c10e1c72eb15 = MODELLED; registerraden "CRPA antenna gains in the jamming kind against an independent numpy recomputation".

seg-0a3adfa7271c = <b>IQ-spårningsmotor mot GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> och GNSS-SDR spårar samma oberoende numpy-inspelningar av GPS L1 C/A vid { "30" } till { "45" } dB-Hz.

seg-cc73857e38e8 = Trösklar förhandsregistrerade i 48edd4a5. Den registrerade kalibreringen misslyckades på en felaktig GNSS-SDR-överlämning (F3), så ändring { "1" } (1e4288c4) lägger till en FLL enbart för inlåsning i båda mottagarna, incheckad före varje testinspelning.

seg-1d651ff134f9 = Uppfyllda: bärvågs- och kodjitter samt Doppler stämmer inom { "5" } % vid varje C/N0.

seg-bc9c9a0247d1 = Inte uppfyllda: motorns NWPR-C/N0 läser { "2.3" }–{ "7.1" } dB under GNSS-SDR:s SNV (F4, en känd gräns för skattaren; M2M4 ligger inom { "0.06" } dB från referensen); låsindikatorerna skiljer sig per definition (F5); en avvikelse i slirning vid { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; registerraden "IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings".

seg-6ba057fab559 = <b>Två VALIDATED rader för koder i IQ-lagret</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Alla { "63" } primära B1I-koder stämmer med den oberoende generatorn i GNSS-SDR { "v0.0.19" } chip för chip (tröskel förhandsregistrerad i 911106d1). Endast det programmets utdata är incheckat: de B1I PRN-koder som den offentliga ICD:n definierar, som ett prefix och en hash.

seg-37437a09dd67 = <b>GPS L1C.</b> Alla { "126" } L1CP/L1CD-koder och { "63" } L1CO-överlägg stämmer med de kontrollkolumner IS-GPS-800J skriver ut, och den beräknade Legendre-sekvensen stämmer med dess Tabell 6.2-1 (trösklar förhandsregistrerade i fe372e26).

seg-f445784a7f2d = Rader: "BeiDou B1I primary ranging codes against an independent generator" och "GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns".

seg-001f48d86a3c = <b>Banden för GLONASS, BeiDou och Galileo E6 i spektrummodellen</b> (CAP-12, signaler): nya bandnamn <c1/> och <c2/> (varje FDMA-kanal som <c3/>, K = −{ "7" } till { "6" }), <c4/>, <c5/>, <c6/>, <c7/> och <c8/>. Var och en bär sin ICD:s bärvåg, modulation och lägsta mottagna effekt. De är tillval med namn: standardbanduppsättningen och varje befintligt utdata är oförändrade.

seg-158a6ec19d6b = Kontrollerad mot trösklar förhandsregistrerade i 5806f28b: ICD-värdena, nollställena, B1C-kompositen och C/N0-vägen är uppfyllda.

seg-805092ae8ca2 = Två trösklar var inte uppfyllda. Enhetsareatröskeln var ouppnåelig så som den var skriven (F1). IQ-lagrets vågformer för B1I och B1C stämmer med modellen endast bandmedelvärdesbildade, på grund av deras koders ojämna linjespektra (F2).

seg-db88f07d97bb = MODELLED; registerraden "Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)".

seg-b0147cf3acc8 = <b>Alternativ med cellmedelvärdesbildande CFAR vid IQ-acquisition</b> (PRO-37): <c1/> och <c2/> avgör på ett acquisition-rutnät genom att jämföra varje cell med medelvärdet av referensceller i dess Dopplerrad. Tröskeln kommer från den slutna formen för falsklarmssannolikheten i CA-CFAR för <c3/> icke-koherenta block (<c4/>, <c5/>), så beslutet beror inte på normaliseringen av sampeleffekten. Det är ett tillval; standarddetektorn och varje befintligt utdata är oförändrade.

seg-a56e74b1e091 = Kontrollerad mot trösklar förhandsregistrerade i 3724aefa: den slutna formen mot Monte Carlo ({ "18" } av { "18" } fall), och en utformningsfrekvens på { "1" } % uppmätt till { "0.97" }–{ "1.01" } % på gaussiskt och 2-bitars kvantiserat brus.

seg-f88fe97e0ee6 = En tröskel var inte uppfylld: på en brusfri 2-bitarssignal överskrider { "1.28" } % av cellerna utanför toppen tröskelvärdet, vid kodens korrelationssidolober (fynd F1).

seg-8d88b626c31e = MODELLED; registerraden "Cell-averaging CFAR option in IQ acquisition".

seg-d596329195cf = <b>Scintillationsmodell mot uppmätta data</b> (PRO-34): IQ-kanalens Cornell-scintillationsmodell jämfördes med uppmätt { "50" } Hz GPS L1-intensitet och -fas från en ekvatorial scintillationsnatt (Zenodo-post { "16941224" }, INGV, Malindi, CC BY { "4.0" }), under trösklar förhandsregistrerade i b6ccb499. Uppfyllda: intensitetsfördelningen och fasscintillationen kopplad till S4. Inte uppfyllda: modellen fädar { "2.4" } gånger så ofta under −{ "10" } dB och { "3.5" } gånger så länge (fynd F1). Den registrerade bearbetningen läser modellens lindade fas (fynd F2); fasresultatet håller med den avlindad. <c1/> hämtar data. Raden förblir MODELLED: "IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation".

seg-d6740cab2271 = <b>Korrigerad LuGRE-sampelläsare</b> (MR-09): <c1/> läser en LuGRE IQ-batch med I i den höga nibblen och mid-rise-nivåerna <c2/> (<c3/>), vilket tar bort medelvärdet −½ som de nakna tvåkomplementsheltalen bär på I och Q. <c4/> ger GNSS-SDR samma läsning. Den generiska ION-läsaren och varje befintligt utdata är oförändrade: { "149" } scenarioresultat och en studie är byteidentiska före och efter, och de fastlåsta LuGRE-fynden läses som registrerade (<c5/>). Ingen registerrad ändras.

seg-5adf36c03c14 = <b>BOC({ "1,1" })-spårning som tillval</b> (CAP-07 (a)): <c1/> omskalar DLL-diskriminatorerna för sinus-BOC({ "1,1" })-huvudtoppen och lägger till en bump-jump-övervakare (mycket tidiga och mycket sena korrelatorer vid ±{ "0.5" } chip, upp/ned-räknare, <c2/>) som flyttar kod-NCO:n från en sidotopp; <c3/> listar hoppen. Av som standard, och varje befintligt utdata är oförändrat. Kontrollerad mot trösklar förhandsregistrerade i 6b68f6cc på en syntetisk BeiDou B1C-signal: en start på en sidotopp som utan tillvalet förblir { "0.55" } chip fel dras med det på huvudtoppen av ett hopp vid { "0.08" } s, och inget falskt hopp sågs från huvudtoppen. En tröskel var inte uppfylld: enhetstestrutnätet för skalningen når utanför diskriminatorernas linjära område (fynd F1 i <c4/>). MODELLED; registerraden "BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)".

seg-89345aa385f7 = <b>Laboratorieanpassning från IQ-kampanjer</b> (B7.1, <a1><c1/></a1>). En labfit-scenarios <c2/> anpassar en utdatamapp från <c3/> i CLI (<c4/>), i Python (<c5/>) och i MCP-verktyget labfit (endast mappar inom dess arbetskatalog). Den anpassar en enhet per signal, slingutformning, frontändkedja och jammertyp:

seg-1726361b81c4 = C/N0-modellen mot angivet J/S, med censurering;

seg-e1b8a27b06fd = spårningströskeln, direkt och i sluten form;

seg-8dce89923619 = modellerna för spårningsslinga och empiriskt lås, kopplade genom C/N0-modellen, med deras vilotider;

seg-108646713c97 = en frösatt klusterbootstrap över inspelningar, { "90" } % prediktionsintervall och undanhållna datamängder med utelämnande av en inspelning i taget;

seg-ee5deb4d5d4b = en förhandsregistrerad tabell <c1/>, hashad, med PASS/FAIL per tröskel.

seg-4d58263106af = Rapporten är <c1/> som JSON, CSV och Markdown, med ett enhetsblock. <b><c2/> är inte identifierbar från C/N0-data</b> utan en oberoende effektmätning. Den anges, anpassas aldrig, och den anpassade parametern är <c3/> (utformningsändring 2026-10-12). En okänd jammertyp tar det mest skadliga angivna <c4/> (cw, { "1" }). På syntetiska kampanjer från Kshanas egna scener passerar tröskeln för täckning i den undanhållna datan (c). Trösklarna för <c5/> (a') och (b') ({ "0" } av { "50" } kampanjer täckta) och den slutna formens tröskel för tröskelvärdet (d) är inte uppfyllda: de är registrerade med sina värden. MODELLED; registerraden "Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error". Sökvägen labfit för mottagarloggar och dess utdata är oförändrade.

seg-308d19be658d = <b><c1/> på en JPL-kärna</b> (CAP-31): <c2/> tar varje kropp som SPK:n innehåller (med de440s: Merkurius, Venus, Jorden, Månen) från kärnan, etikett <c3/>, och lägger bara till ett block <c4/> när det är satt. Ny rad, VALIDATED mot SPICE (förhandsregistrerad f8e946ea; sämsta { "3.3e-5" } m, { "1.0e-11" } m/s). Standardrapporten är oförändrad.

seg-fe16c24eae60 = <b>Porkchop på efemeriden DE440</b> (CAP-20b): <c1/> sveper C3 och ankomst-V∞ på heliocentriska tillstånd från en DE440 SPK. Ny rad, VALIDATED mot SPICE-tillstånd

seg-a8632f3c86e9 = pykep { "3.0.1" } (förhandsregistrerad 2d857fb1; Jorden till Mars 2026-2028, { "304" } celler, sämsta { "2.6e-14" }, samma cell med minsta C3).

seg-266cffab38a7 = <b>Icke-gravitationell makromodell för LRO: NOT MET</b> (DS-LRO-10, förhandsregistrerad e82047e2). <c1/> (tillval via <c2/>): direkt solstrålning på plana plattor med månens skugga, en solföljande panel samt månens albedo och termiska IR; <c3/> är en märkt generisk LRO-approximation från publicerade fakta (inga bussplattor: plattabellen gick inte att få tag på). På LRO-bågen på { "4" } h lämnar den den reducerat dynamiska RMS på { "6.668" } m och den dynamiska på { "11.94" } m, med en orimlig strålningsfaktor (omkring +{ "21" } / −{ "22" }), så alla tre trösklarna missas. Fyndet är fastlåst av ett test, och inget standardutdata ändras (<c4/>). Det valfria cannonball-SRP:et för månen använder nu månens koniska skugga i stället för jordens (<c5/>).

seg-e4ed6e0e5048 = <b>Månens banbestämning: valfri fast tidvatten k2 och selenocentrisk relativitet</b> (DS-LRO-11), av som standard (<c1/>, <c2/>); en omkopplare <c3/> för ANISE-korsvalideringen (DS-LRO-04); en fixtur för en LRO-båge på { "24" } h och en enbart informativ anpassning över lång båge (DS-LRO-09). Informationskörningar registreras i <c4/>; inget publicerat tal ändras.

seg-b065138adba8 = <b>CR3BP { "9" }:{ "2" } NRHO mot CAPSTONE</b> (CAP-29d): ny MODELLED rad som mäter motorns cirkulära begränsade NRHO mot den bana CAPSTONE har flugit (JPL Horizons, mars { "2023" }; förhandsregistrerad { "4e868170" }): period { "1.07" } %, apolun { "0.05" } %, perilun { "4.1" } % från medelvärdena för CAPSTONE, inom de registrerade trösklarna { "3" } / { "5" } / { "20" } %. En mätning, inte en validering.

seg-954bd2771180 = <b>CR3BP roterande tillstånd till månencentrerad ICRF</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> avbildar ett dimensionslöst roterande Jord-Måne-tillstånd på den momentana DE440-linjen Jord-Måne, inklusive systemets rotationshastighet utanför planet. Ny rad, VALIDATED mot ett SPICE-tvåvektorsystem (förhandsregistrerad 2313eb1b, ändrad före varje körning d5ef79b3; { "72" } fall, sämsta { "1.8e-7" } m och { "1.2e-9" } m/s).

seg-14599ab79300 = <b>CR3BP-familjemedlemmar mot JPL:s Three-Body Periodic Orbits API: NOT MET</b> (RM-35, förhandsregistrerad a9074f65). <c1/> (halo-, NRHO- och DRO-korrektion, monodromistabilitetsindex, pseudo-båglängdskontinuering) matchar { "54" } av { "58" } API-medlemmar för varje tröskel (tillstånd, period och Jacobi inom { "1e-10" } överallt). Ett L1-halo-stabilitetsindex ({ "9.5e-2" }) och tre små DRO-slutningar ({ "1.5e-8" } till { "3.3e-8" } mot { "1e-8" }) missar, så modulen är <c2/> och ingen rad gör anspråk på den. Resultat: <c3/>.

seg-0cd0e67a2e28 = <b>Valfri DE440-månorientering och månmiljö</b> (FUT-05, DS-LRO-08; standardvärden oförändrade): <c1/>, <c2/> / <c3/> (epokförankrade, DE440-huvudaxlar) och <c4/> (inbäddad DE440 PA-orientering plus den geocentriska solen och månen från en användartillhandahållen DE440 SPK). Mot ANISE (förhandsregistrerad ea537710): orientering inom { "3.5e-7" } rad och LRO-anpassningar inom { "1" } mm, men efemeridledet missade sin tröskel (solen { "30.7" } m, månen { "1.1" } m, en tidsförskjutning på ~{ "1" } ms på ANISE-sidan), så det är inte någon VALIDATED rad. Resultat: <c5/>.

seg-92cc171c69da = <b>Datum för månens referenssystemskampanj, villkorsskalad NumPy-tröskel: NOT MET</b> (förhandsregistrerad b887eb05; förblir MODELLED). Steg { "0" } utesluter reservlösningen med pseudoinvers som orsak till gapet på { "0.30" } för uppskattade stationer; NumPy stämmer inom tröskeln i sex av åtta scenarier, men stations_estimated missar den ({ "6.8e-6" } mot { "5.9e-7" }), och för det nya datumet 2026-12-01 gör en oobserverad fyr vid sydpolen att fyrens information blir rangbristfällig, vilket den oförändrade oberoende referensen inte kan utvärdera. Resultat: <c1/>.

seg-8d2f1e9708ff = <b>Datum för månens referenssystem från en verklig observationskampanj (analytisk måne) VALIDATED</b> på nya { "2025" } EDC-normalpunkter (förhandsregistrerad 31f5283 innan någon hämtades): den oförändrade SPICE- och NumPy-referensen stämmer i bokföring, rang och noll koppling, och inom { "1.11e-3" } på sigman (tröskel { "1e-2" }), { "8.95e-4" } på konditionen och { "1.79e-3" } på kvoterna tvärs/längs (tröskel { "2e-2" }). Enbart en biblioteksnivåkontroll av kovariansberäkningen; trösklarna skiljer inte mellan månmodeller. Resultat: <c1/>.

seg-058d7d490111 = <b>IAU-kroppsorientering och GM för de fjorton tillagda solsystemkropparna</b> utbrutna ur raden "Fysikaliska konstanter för varje solsystemkropp" till en VALIDATED rad (förhandsregistrerad 154bc54): <c1/> stämmer med SPICE <c2/> på pck00011 inom { "1e-9" } rad på { "574" } matriser vid de ursprungliga epokerna och på { "574" } vid { "41" } nya epoker som aldrig jämförts tidigare (sämst Phobos { "1.38e-10" } rad), och <c3/> är lika med gm_de440 för alla fjorton kroppar. Resten av den ursprungliga raden (J2, medelradie, rapporten) förblir MODELLED. Resultat: <c4/>.

seg-56c445aa8d9e = <b>Lambert med flera varv</b> (<c1/>): varje lösning med upp till tre varv, båda grenarna. Ny registerrad, VALIDATED mot pykep { "3.0.1" } (förhandsregistrerad a75de851; { "382" } fall, { "1058" } lösningar, största hastighetsskillnad { "1.6e-13" } mot { "1e-8" }). Den interna Kepler-landningsspärren hittade en begränsning hos <c2/> på en båge med e = { "0.994" }; den är dokumenterad i <c3/>.

seg-b62dc38b09e9 = Strålningstryck från solen med box-wing och ECOM2 (DS-PA-14), valfritt.

seg-fd50e846d10e = <c1/>: en box-wing-modell med plana ytor och Galileo FOC/IOV-tabeller från GSC:s satellitmetadata, med nominell GNSS-girstyrning, med strålningsfaktor och partiella derivator per panel, samt den empiriska ECOM2-modellen med sina partiella derivator. Väljs med <c2/> / <c3/> (fälten <c4/>, standard <c5/>: kanonkulevägen och alla golden-värden är oförändrade); med en box-wing-uppsättning är <c6/> dess strålningsfaktor. Jämförd med Orekit { "12.2" } under en förhandsregistrering (<c7/>): varje tröskel nådd, cirka { "1e-15" } relativt; VALIDATED som modellutvärdering, men Galileo-SRP-prognosen förblir MODELLED.

seg-fd7a7fe09705 = <b>SRP-skugga för tillplattad jord och solkantsmörkning (FUT-09, RM-11).</b> Ny modul <c1/>: <c2/> (WGS-84 ockulterande ellipsoid), <c3/> (Eddingtons lag) och <c4/>, valt med <c5/> (standard: den befintliga sfäriska koniska skuggan, oförändrad); <c6/>. Den tillplattade skuggan stämmer med belysningsförhållandet i Orekit { "12.2" } inom { "7.4e-9" } över { "2400" } geometrier (VALIDATED, <c7/>); kantmörkning har ingen extern oberoende referens (MODELLED).

seg-f09d4b831dfe = NRLMSISE-00-termosfär (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: en portning av <c2/> och <c3/> (växlar, dagligt Ap och 3-timmars ap-array-lägen) från C-versionen i public domain av NRL:s Fortran. Den är bitidentisk med den C-portningen och inom { "1.9e-6" } relativt pymsis { "0.13.0" } (NRL Fortran, enkel precision) på ett rutnät med 720 punkter, och den återger de { "17" } publicerade testfallen (VALIDATED; <c4/>). Detta validerar portningen, inte modellens noggrannhet mot uppmätt densitet.

seg-9e8e9018dbaf = Valfri NRLMSISE-00-nivå för luftmotståndsdensitet.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> och <c4/>. Den statiska exponentialmodellen förblir standard, bit för bit. Rymdvädret är konstant per modell. VALIDATED på banivå mot det egna NRLMSISE-00-luftmotståndet i Orekit { "12.2" } över { "24" } h (sämst { "0.03" } m mot upp till { "142" } km luftmotståndsförskjutning; <c5/>).

seg-b1b2ac9ac91e = Valfri DE440-sol och -måne i Cowell-propagatorn (RM-33, FUT-10).

seg-4f323703b251 = <c1/> tar emot valfri <c2/> (t.ex. en DE440 <c3/>) för tredjekropps- och SRP-termerna; den vägrar en leverantör som inte kan betjäna epoken, räknar återgångar till den analytiska serien och är avstängd som standard. <c4/> behåller tvådelad precision. Mot Orekit { "12.2" } på dess egen DE440-läsare stämmer banor över { "24" } h till { "0.017" } m; den förhandsregistrerade positionströskeln för sol/måne missades ({ "6.4" } m / { "0.24" } m; SPICE visar samma gap), så MODELLED (<c5/>).

seg-6ac7f3f65b33 = Valfritt atmosfärstidvatten S1 (DS-PA-03).

seg-35da1ed0dc83 = <c1/> och <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 tabell { "1" } modell N1, grad { "2" }–{ "6" }), aktiverat med <c3/> på <c4/> och <c5/>; avstängt som standard. MODELLED (koefficienterna kontrollerade på nytt mot den publicerade tabellen; ingen extern oberoende referens för kraftens effekt).

seg-c62d816a93cf = Satsvis banbestämning med avståndshastighet och azimut/elevation med elevationsmask (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variations-STM med analytiska tvåkropps- + J2-derivator), <c5/>, <c6/>; <c7/>. Vägen med enbart avstånd är oförändrad. Jämfört med minstakvadratanpassning i satser i Orekit { "12.2" } över { "8" } förhandsregistrerade scenarier: varje tröskel nådd utom den brusfria tillståndsöverensstämmelsen (≤ { "1" } cm), som missades i { "2" } av { "4" } scenarier vid { "1.46" } och { "1.74" } cm med kshana inom { "1e-8" } m från referensen; registrerat, MODELLED.

seg-223f1e39669f = Viktning av SP3-noggrannhet (DS-PA-06).

seg-b5560ff1c426 = <c1/> och <c2/> avbildar noggrannhetskoderna i huvudet och per post på observationssigman; en SP3-viktad Galileo-anpassningsvariant (nivå-2 3D-RMS { "0.035" } m mot { "0.070" } m oviktad) läggs till vid sidan av de oförändrade registrerade körningarna. MODELLED.

seg-831d35c5f97e = <b>Dispatch-jobb för full Swarm-A-båge (DS-PA-08)</b> i <c1/>.

seg-cc5e8af7cb0d = Planetär gravitation från PDS SHADR-tabeller (CAP-30, del av CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) läser Mars GMM-3 (d/o { "120" }) och GRAIL GL0660B (d/o { "660" }); <c3/> kopplar på valfritt inläst fält (standardvärden oförändrade). Beskärningar till grad 20 medföljer (NASA PDS, public domain; <c4/>); de fullständiga filerna hämtas av <c5/>. VALIDATED mot pyshtools { "4.14.1" } (inom { "4e-15" } av total gravitation vid d/o { "120" } över hela sfären, { "5e-14" } vid d/o { "660" } för |lat| ≤ { "60" }°); kopplingen till kroppssystemet förblir MODELLED (varje fälts eget system är inte det IAU-system som används).

seg-afb5fbf86ffc = Högradig gravitation till grad { "2190" } (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (Holmes–Featherstone modifierad framåtkolonn, inget underflöde, ingen polsingularitet), <c3/>, en strömmande ICGEM-läsare <c4/> / <c5/> (kontroller av norm och maxgrad, tidvattensystem registrerat, tidsvarierande termer avvisade), och <c6/> (full EGM2008, SHA-256 fastlåst, ej medföljande; tester styrda av <c7/>). <c8/> väljer den på den valfria <c9/>. Stämmer med Orekit { "12.2" } till { "7.3e-17" } m/s² till och med grad { "2190" }, och en bana över { "24" } h på { "200" }×{ "200" } stämmer till { "0.13" } m. MODELLED: pyshtools missade den förhandsregistrerade tröskeln nära polen (spårad till pyshtools) och banans känslighetskontroll för grad 70 missades ({ "0.73" } m < { "1" } m); båda är registrerade i <c10/>.

seg-4ef4f74f21c1 = DOP853-integrator (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (täta utdata av ordning 7), <c4/>, <c5/>, med en stegspärr som stänger säkert vid fel (fail-closed); <c6/>, <c7/>, <c8/>. Standarddrivrutinen är oförändrad. VALIDATED mot SciPy { "1.18.1" } <c9/>: enskilda steg inom { "5.6e-15" }, matchande stegföljder, sluttillstånd inom { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Robust Kepler-lösare (FUT-12).</b> Ny modul <c1/>: <c2/> (startvärde enligt Markley { "1995" }, kancelleringsfri residual) för alla { "0" } ≤ e < { "1" }, omsluten av <c3/>. VALIDATED mot 50-siffriga mpmath-rötter till { "0.9" } ε·|E| upp till e = { "0.999999" } (<c4/>).

seg-5e82deb7c853 = Valfri tesseral jordgravitation i Cowell-propagatorn (RM-09).

seg-e1a7ad42211e = <c1/> får <c2/> (<c3/>, <c4/>). Den utvärderar ett <c5/> (medföljande EGM2008 till grad/ordning { "70" }, eller valfri ICGEM <c6/>) i ett jordfast system som nås via jordrotationsvinkeln (<c7/>) eller CIO GCRS-till-ITRS-kedjan (<c8/>). Standard <c9/>: ingen befintlig utdata ändras. VALIDATED mot Orekit { "12.2" } Holmes–Featherstone över { "24" } h ({ "6" } fall, sämst { "0.036" } m), med trösklarna förhandsregistrerade i <c10/>.

seg-957686bb351e = <b>Tvådelade julianska datum genom jordrotation på banvägen</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> och <c6/>, konverteringar via <c7/> mellan <c8/> och <c9/>, och en valfri <c10/> för scenariot <c11/> (ECEF, markspår och stationsvy; avstängd som standard och oförändrad, och nyckeln utelämnas ur scenariots hash när den är av). Ny registerrad, VALIDATED mot pyerfa <c12/>/<c13/> (förhandsregistrerad b10475ee; { "40" } datum: GMST bitidentisk, matris inom { "2.7e-14" }, rotation över steg på { "1" } µs inom { "1.1e-14" } rad, där vägen med en enda <c14/> missar dem). Cowells kraftmodellsepok förblir en enda <c15/>; skälet finns i dess dokumentation.

seg-0680b1f4c98b = <b>EOP-prognos bortom tabellen</b> (<c1/>, <c2/>): en valfri förlängning av en IERS jordorienteringsserie med LS+AR-prediktorn utfärdad vid dess sista rad, så att referenssystemsargumenten för en senare epok följer prognosen i stället för att låsas vid sista raden. Svar inom tabellen är bitidentiska (testat); serien låses fortfarande om detta inte anropas. Prognosens noggrannhet förblir det befintliga LS+AR-resultatet mot Bulletin A (MODELLED).

seg-a7d272a1ddd6 = <b>Himmelspolsoffseten dX, dY på CIO-kedjan</b> (<c1/>), och direkta ERFA-vektorkontroller av <c2/>, <c3/> och den nya funktionen. Ny registerrad, VALIDATED mot pyerfa (förhandsregistrerad 979c1e39; { "40" } epoker { "1950" }–{ "2100" }: precession och CIO bitidentiska, TEME→GCRS inom { "1.1e-10" } rad, den förväntade effekten av serien med två termer för jämdygnsekvationen). Befintliga funktioner är oförändrade.

seg-20d19a2d65ec = <b>UTC före 1972 på den tvådelade tidsvägen</b> (<c1/>, och <c2/>, <c3/> och <c4/> från 1960-01-01): eran med glidande takt ("gummisekund"), med SOFA:s glidtabell, bråkdelade steg vid dygnets slut och UTC-till-SI-skalningen av dygnsbråkdelen. Ny registerrad, VALIDATED mot pyerfa <c5/>/<c6/>/<c7/> (förhandsregistrerad 23c40661; { "117" } tidpunkter { "1960" }–{ "1971" }, sämst { "2.9e-11" } s mot en tröskel på { "1" } µs). Varje resultat från { "1972" } och framåt är bitidentiskt (kontrollsumma fastlåst före ändringen). Före { "1960" } är TAI − UTC { "0" }, som i SOFA. <c9/> med en enda <c8/> är oförändrad.

seg-3ff0d080d9e6 = <b>Utsänd GLONASS-satellitklocka</b> (<c1/>): <c2/> från RINEX-posten, vid en tid avläst på satellitklockan (två fixpunktsiterationer, RTKLIB-konventionen). De tolkade <c3/> och <c4/> var tidigare oanvända. Ny registerrad "GLONASS utsänd satellitklocka och propagering av utsänd bana", VALIDATED mot RTKLIB 2.4.2-p13 <c5/>/<c6/> (förhandsregistrerad e099c42a; { "292" } fall på en verklig utsänd fil från { "2013" }: klockskillnad { "0" } s, sämsta position { "1.1" } mm mot en tröskel på { "1" } cm). Biblioteksfunktion; inget scenarioutdata ändras. Ingen PZ-90.11 → ITRF-transformation tillämpas, och modulen säger det.

seg-71ae2ee163e0 = <b>PPP-tidslösning mot IGS stationsklocka</b> ({ "0.36" }, FUT-19): mottagarklockan i float-PPP-filtret på WTZR stämmer med IGS slutliga kombinerade klocka för stationen till { "0.075" } ns (standardavvikelse) med en konstant förskjutning på −{ "0.66" } ns över de konvergerade två timmarna. Trösklarna förhandsregistrerades i <c1/>. VALIDATED (ny registerrad). Ny testfixtur <c2/>, stationsklockposterna i IGS slutliga klockfil som redan används för satellitklockorna.

seg-463ac67600b1 = <b>PPP-paritet med gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } kördes på samma WTZR-indata som ett separat verktyg (Apache-2.0-kärna; nedladdningens kontrollsumma verifierad mot den publicerade listan), med kommandoraden från ett förfarandemässigt tillägg incheckat före körningen. Vid sin första registrerade körning stämmer Kshanas float-PPP och gLAB:s inom { "0.05" } m vid { "240" } av { "240" } epoker och till { "5.0" } mm vid den sista. SPP-tröskeln missades (median { "1.187" } m mot { "0.50" } m) och registreras som ett fynd: gLAB:s och RTKLIB:s egna SPP-lösningar skiljer sig från varandra med { "0.852" } m. Den registrerade regeln lämnar därför båda verktygens led som helhet ej nådda, medan PPP-pariteten håller.

seg-158717c78c80 = <b>Läsning av navigationsfiler i RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41): <c1/> läser RINEX 4.00-4.02-navigationsfiler (<c2/> GPS LNAV, Galileo I/NAV och F/NAV, BeiDou D1/D2, QZSS LNAV; andra poster hoppas över till nästa postrubrik), och <c3/> tar emot alternativ. VALIDATED mot samma dygns sammanslagna IGS-fil i RINEX { "3" }: varje avkodat fält identiskt och { "0" } m i position. Läsning av RINEX 2/3 är oförändrad.

seg-57aa5c6ef4f8 = <b>Utsända BeiDou GEO-positioner</b> (valfritt): <c1/> och <c2/> (BDS ICD, lutning på −{ "5" } grader). <c3/> hoppar fortfarande över GEO. MODELLED: den förhandsregistrerade jämförelsen med en precis bana är datastyrd och har ännu inte körts.

seg-416f58111d1f = <b>Observationsfiler i RINEX { "4" }</b>: en verklig MGEX-observationsfil i RINEX { "4.00" } läses i tester (MODELLED, formatkontroll).

seg-64b4664c0ff6 = <b>RTK med LAMBDA på verklig RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, dubbeldifferenser på kort baslinje av tvåfrekvens-GPS-kod och -fas med ett float-Kalmanfilter och LAMBDA-heltalsfixering (kvottest). VALIDATED på IGS-stationerna WTZR och WTZZ ({ "1.4" } m ifrån varandra) mot deras ITRF2020-baslinje under förhandsregistrerade trösklar: fixerad vid varje epok efter de första tio minuterna, baslinjefel median { "4.5" } mm och 95:e percentilen { "5.5" } mm.

seg-69db4437ebbb = <b>RTKLIB-paritet för PPP med verkliga data</b> (RM-31): <c1/> och <c2/> med förhandsregistrerade trösklar. RTKLIB v2.4.2-p13 PPP på samma WTZR-indata stämmer med Kshana inom { "5" } cm vid varje epok under de två sista timmarna ({ "9.7" } mm vid slutet) i den tredje registreringen; de två första körningarna, registrerade som fynd, hade fastjordstidvattnet avstängt och mottagarantennen på RTKLIB:s basplats. Paritetströskeln för enpunktslösning missades ({ "1.09" } m median mot { "0.5" } m). gLAB-ledet har inte körts (datastyrt).

seg-fb6e053a0a9d = <b>Navigationsmeddelandekodare bortom LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> kodar GPS CNAV (meddelandetyper { "10" }, { "11" }, { "30" }; CRC-24Q; kontinuerlig kodning med hastighet 1/2, K={ "7" }), Galileo I/NAV (ordtyper 1-5 i jämna/udda nominella sidor; 30x8-interfolierare; synk <c2/>) och Galileo F/NAV (sidtyper 1-4; 61x8-interfolierare; synk <c3/>), med testavkodare. MODELLED: rundturer och kända svar från ICD; en förhandsregistrerad kontroll att utsända Galileo-efemerider ligger på kodarens LSB-rutnät höll (sämst { "3.6e-3" } LSB) men missade sin tröskel för antal satelliter ({ "15" } av { "20" }), registrerat. Kodarna är biblioteksfunktioner; kopplingen till scenen ingår inte i denna ändring.

seg-562f36eb18e6 = <b>IONEX-filläsare</b> ({ "0.36" }, WP-07): <c1/> med <c2/>, <c3/>, <c4/>, <c5/> och <c6/>: en strikt läsare för IONEX { "1.0" } med fast kolumnformat, med epoker räknade från första kartans dygn, <c7/> läst som saknat, RMS-kartor och formatets tidsinterpolationer med närmaste, på varandra följande och roterad karta; snedriktad TEC vid huvudets skalhöjd. Kontrollerad mot en incheckad syntetisk karta och, datastyrt (hämtad vid testtillfället med fastlåst SHA-256, inte medlevererad), mot ett utsnitt av en verklig CODE GIM: varje nod exakt; interpolationen stämmer med en formelreferens till { "4e-13" } TECU. RTKLIB:s <c8/> stämmer till { "3.6e-13" } TECU i { "6885" } punkter (förhandsregistrerad B6). VALIDATED på datastyrt belägg (ägarbeslut, 2026-10-13): testet misslyckas på varje annan karta än den SHA-fastlåsta.

seg-9fac2e8535c8 = <b>Hatch-bärvågsutjämning</b> ({ "0.36" }, WP-07): <c1/> och <c2/>, den divergensfria (jonosfärsfria) formen i den precisa enpunktsammanställningen. MODELLED med ett registrerat fynd: på IGS-stationen WTZR sänker den medianfelet för enpunktslösning från { "1.55" } m till { "1.12" } m och 95:e percentilen från { "3.47" } m till { "3.21" } m, vilket ligger under den förhandsregistrerade minskningen på { "40" } % (det kvarstående felet är biasliknande, inte brus).

seg-7e4c7639d102 = <b>Float-PPP på verklig RINEX</b> ({ "0.36" }, WP-07): <c1/>, ett statiskt float-filter för precis punktpositionering på verklig tvåfrekvens-GPS-kod och -fas med IGS slutliga produkter (antennoffset och -variationer, fast jordtidvatten, fasuppvridning, Shapirofördröjning, uppskattad våt fördröjning, detektering av cykelslip), med <c2/>. VALIDATED på den undanhållna IGS-stationen WTZR mot dess ITRF2020-koordinat under förhandsregistrerade trösklar: efter { "6" } h är felet { "1.5" } mm horisontellt och { "2.9" } cm vertikalt, och varje epok under de två sista timmarna ligger inom { "10" } cm.

seg-173aa308e3e8 = <b>Interpolering av precisa SP3-klockor</b> ({ "0.36" }, WP-07): <c1/> och <c2/> interpolerar de tabellerade SP3-satellitklockorna linjärt mellan de två omslutande giltiga noderna (markören för ogiltig klocka hoppas över), och <c3/> matar dem till <c4/>, så att den precisa kedjan kan köras från enbart en SP3. VALIDATED mot IGS slutliga klockor på { "30" } s från 2025-02-24 under förhandsregistrerade trösklar: { "32" } GPS-satelliter, RMS i mittpunkten { "0.121" } ns (tröskel { "0.15" } ns), 95:e percentilen { "0.265" } ns (tröskel { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM vid sidan av klockans holdover-kvalitetsmått</b> (CAP-05b): en valfri sektion <c1/> på klocktypen rapporterar ett separat block <c2/> (RAIM i ögonblicksbild på en förinställd himmel från en angiven plats: utfall per epok och skyddsnivåer, tillgänglighet; otillgängligt medan GNSS är nekat, aldrig extrapolerat). Holdover-måtten är oförändrade; utan sektionen är utdata byte-identiskt. MODELLED.

seg-99d9a67fc2f3 = <b>Tröskelvärden för mottagarförtroende kalibrerade på JammerTest { "2024" }</b> (CAP-13): en förhandsregistrerad kalibrering av monitorerna för C/N0-fall, AGC och jamming-indikator på den publika datamängden JammerTest { "2024" } (hämtas vid körning, aldrig medlevererad; <c1/>), levererad endast som den valfria <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). På undanhållna data: trösklarna för AGC, jamming-indikator och unionen klaras; falsklarmströskeln för C/N0 klaras inte ({ "0.023" } mot { "0.02" }), så raden är MODELLED (<c3/>). Standardvärden och utdata utan profilen är oförändrade.

seg-8ccd18c54b4b = <b>ARAIM-felhypoteser för flera satelliter</b> (CAP-05a): ADD v4.2:s delmängdsregel generaliserad bortom par (<c1/>, <c2/>; ordning { "2" } är exakt den befintliga MAAST-kontrollerade vägen) och en valfri avancerad RAIM över dessa hypoteser (<c3/>), som rapporterar delmängden med störst separation när ett fel upptäcks. A priori-sannolikheter som kräver djupare delmängder avvisas, aldrig trunkeras. MODELLED.

seg-02f1f2d72263 = <b>Skyline i mottagarförtroende</b> (FUT-01): en mottagarförtroendesession kan ange <c1/>; satelliter bakom den förloras för himlen (<c2/>, <c3/>, <c4/>) och deras förluster klassas <c5/>, aldrig <c6/>; utan en gäller reservlösningen med azimutglapp och alla utdata som tidigare. Besättningsutbildningsgeneratorn får en händelse <c7/> (en blockerad himmel, inte störning) och scenariot <c8/>. UERE x DOP-Monte Carlo får utformningsanteckningens två maskerade skyline-geometrier, förhandsregistrerade separat: alla { "26" } kontroller klaras.

seg-69fa2ecdc4e9 = <b>Verifiering av tidsstämplar enligt RFC { "3161" }</b> (CAP-14): <c1/> kontrollerar en tidsstämpeltokens signatur (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 och P-384), dess ESS-bindning till signeringscertifikat, signerarens timeStamping-användning och dess kedja till ett betrott ankare vid tokenens genTime, offline; <c2/> tillämpar det på ett pakets <c3/> (valfritt; utan det är rapporten oförändrad). VALIDATED, snävt: alla { "27" } självgenererade fall stämmer med OpenSSL { "3.0.13" } i utfall och genTime, under en jämförelse förhandsregistrerad innan verifieraren skrevs. Återkallelse kontrolleras inte.

seg-1b7777e600a8 = <b>Verifieringsnivåer per mått för varje typ</b> (RM-04): resultatet för varje scenariotyp slutar nu med ett block <c1/> som namnger dess huvudmått, den rad i verifieringsmatrisen som äger vart och ett och den nivå som läses från den raden (mått som ingen rad äger listas som utan nivå). Blocket läggs till efter körningen och tas bort igen så att det föregående dokumentet återställs byte för byte (<c2/>). <c3/> har ingen <c4/> förrän en ny daterad prognos ersätter den frusna; <c5/>, <c6/>, <c7/> och <c8/> har inget skalärt huvudmått, och <c9/> skriver kompakt JSON. Kampanjmedlemmar behåller sina dokument utan nivåer.

seg-54aec3e311cf = <b>Kvantförinställning <c1/></b> (CAP-08c): ett medföljande tröghetsscenario där en accelerometer med kallatomsinterferometer, specificerad av sin interferometerfysik (<c2/> med en angiven vibrationsnivå för plattformen), glider mot en kvartsaccelerometer av navigationsklass genom ett GNSS-bortfall på 110 minuter. MODELLED.

seg-21d2b7fd2a21 = <b>Greenhalls exakta ekvivalenta frihetsgrader</b> (CAP-03): <c1/>, hela algoritmen av Greenhall och Riley ({ "2003" }) (differensordningar { "1" } till { "3" }, brusexponenter +{ "2" } till -4, överlappande och icke-överlappande, modifierade och omodifierade, med tabellerna för stora J), med omslag för ADEV, MDEV och HDEV. VALIDATED under en förhandsregistrerad jämförelse med allantools { "2024.6" }: { "4 876" } rutnätspunkter inom { "6.0e-13" } relativt; allantools misslyckas vid { "32" } ytterligare punkter, som registreras utan värde från oberoende referens. Konfidensintervallen för <c2/> är oförändrade bit för bit.

seg-8e04ebc15045 = <b>Felbidrag för kallatomsinterferometer</b> (RM-26/27/28): Raman-laserfasbrus (med termen för retroreflektionsfördröjning), vågfrontskrökningsbias för ett termiskt moln (ren defokusering, med en detektionsradie) och upplösning av fransosäkerhet (klassiskt stödd och två avfrågningstider), som biblioteksfunktioner i <c1/>, var och en med sluten form kontrollerad mot kvadratur eller Monte Carlo. MODELLED; ännu inte nåbar från en scenariotyp (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Klockloggformat</b> (RM-03): <c1/> läser RINEX-klockfiler, ASCII-fas- eller frekvensloggar i TimeLab-stil och TAPR TICC-räknarloggar till en normaliserad fasserie (tau0 angiven eller funnen, glapp räknade, en glapppolicy). Valfritt: en tidssynkroniseringsserie för telekom kan namnge en logg (<c2/>), och tabellen <c3/> i ett klockscenario lägger till ett block <c4/> (ADEV, TDEV, MTIE). Utan tabellen är båda typerna byte-identiska (<a1><c5/></a1>). En förhandsregistrerad jämförelse på tre syntetiska loggar nådde sina fas- och kopplingströsklar; skattarna stämmer med allantools inom { "2.5e-14" } där den utvärderar, och den utvärderar inte MTIE-punkten för hela posten (registrerat). MODELLED.

seg-53369a5c3749 = <b>Wander-masker för frekvenssynkronisering</b> (RM-01): typen <c1/> får sju wander-genereringsmasker för MTIE och TDEV vid konstant temperatur, ITU-T G.811 PRC, G.812 typerna I till III, G.8262 EEC alternativ { "1" } och { "2" } och G.8262.1 eEEC, med de potenslagsdelar som tabellerna skriver, och referensscenariot <c2/> (en fritt gående OCXO mot EEC-maskerna: den misslyckas vid { "1 000" } s, där en slinga måste göra jobbet). Varje rad lästes om mot texten på itu.int; G.812 (06/2004) har ersatts av en förpublicerad utgåva 08/2026 som inte kunde läsas. MODELLED (en transkription); befintliga masker och utdata är oförändrade.

seg-5e84b35ee4e7 = <b>Vägledning om filterprior för typen <c1/></b> ({ "0.36" }, WP-09, fynd RM-21): paketets standardfilterprior passar en IMU av taktisk klass. Med en IMU av navigationsklass kan standardvärdet göra den fuserade drivningen sämre än fri INS: { "52" } m mot { "11" } m på en flygprofil med { "70" } m/s. Ställ in <c2/> så att det motsvarar sensorns klass, som de nya paketen för sjö, järnväg och flyg gör. Inget medföljande scenario parar en IMU av navigationsklass med standardprioren: varje scenario som använder standardvärdet har kvarstående accelerometerbias på minst { "0.015" } m/s². Endast dokumentation; inga utdata ändras.

seg-f74b3c265f3a = <b>Test-bench-export kontrollerad med en simulators egna läsare</b> ({ "0.36" }, WP-09, CAP-16): rörelsefilerna från <c1/> för { "8" } medföljande scenarier lästes tillbaka med gps-sdr-sims läsare för NMEA, latitud/longitud/höjd och jordfast rörelse (MIT, commit 28ca29a6, använd som ett separat verktyg via <c2/>; ingen signalfunktion anropas). De återger den exporterade banan till { "1.2" } mm, { "0.15" } mm och exakt. FYND: den simulatorns jordfasta läsare kan inte ta CSV med full bredd, eftersom dess radbuffert på 100 tecken delar varje rad. <c3/> anger nu de kolumnavskärningar som ska användas och simulatorns tak på { "300" } s. VALIDATED (ny registerrad); exportens bytes är oförändrade.

seg-e77e1ac87dd5 = <b>GNSS/INS på KF-GINS-datamängden</b> ({ "0.36" }, WP-09, FUT-17): inläsare och körare för <c1/> samt mätmodellen för hävarm i det slutna EKF:et. På KF-GINS-demodatamängden (hämtad vid testtillfället, inte medlevererad) är Kshanas horisontella RMS mot referensbanan { "1.09" } cm mot KF-GINS egna { "1.11" } cm, och varje förhandsregistrerad tröskel höll. VALIDATED på datastyrt belägg (ägarbeslut, 2026-10-13): datamängden hämtas med SHA-256-fastlåsningar och återskapandevägen finns i <c2/>.

seg-4d5a503c5c9c = <b>Kopplat PNT-filter i fusionspaketet</b> ({ "0.36" }, WP-09, FUT-16): typen <c1/> tar en valfri tabell <c2/> som kör ett staplat filter på pseudoavstånd med ett accelerometer-biastillstånd (<c3/>), och <c4/> är den 3-D-version som har 8 tillstånd. Nytt medföljande scenario <c5/>: med biasade accelerometrar håller det kopplade läget kvantsviterns position till { "18.7" } m (95:e percentilen) med full integritet, där de frikopplade filtren når { "430" } m. Utan tabellen är både <c6/> och <c7/> oförändrade (fastlåsta); <c8/> vägrar tabellen. MODELLED.

seg-b7f07e3693df = <b>GNSS/INS-paket för sjö, järnväg och flyg</b> ({ "0.36" }, WP-09, RM-21): medföljande scenarier <c1/>, <c2/> och <c3/> på trajektoriebiblioteket, och en valfri tabell <c4/> för typen <c5/> som fuserar pseudoavstånd från en SGP4 Walker-konstellation (alla satelliter när nominell, de högsta få när försämrad). På järnvägspaketet håller tät koppling lösningen av navigationsklass på { "5.3" } m genom en skärning och en tunnel, mot { "12.9" } m vid löst kopplad. Utan <c6/> är paketet oförändrat (fastlåst). MODELLED.

seg-0daf8b2646ad = <b>Tät koppling med bärvågsfas</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, ett felstats-EKF med en explicit mottagarklocka med två tillstånd och float-bärvågsosäkerheter, driven av en SGP4 Walker-konstellation med Klobuchar- och Saastamoinen-korrektioner i mätslingan, slipdetektering med tidsdifferentierad bärvåg och ny initiering av osäkerheterna, och en körning med enbart kod på samma mätningar för jämförelse. MODELLED: på en figur-8-körning är bärvågslösningen { "2.5" } cm mot { "47" } cm med enbart kod, och NIS/NEES är samstämmiga över frön.

seg-7032646c0bc4 = <b>GNSS/INS-trajektoriebibliotek</b> ({ "0.36" }, WP-09, RM-24): typen <c1/> tar en valfri tabell <c2/> med <c3/>. Profilerna styr Eulervinkelhastigheter och acceleration längs spåret från referenstillståndet och härleder den sanna IMU:n ur stelkroppskinematik (koordinerade svängar, stigningar, Coriolis); <c4/> importerar en referenstrajektoria (<c5/>) och löser den IMU som återskapar den. Utan tabellen flyger paketet sin historiska färd, bit för bit (fastlåst). MODELLED.

seg-e6b31bf61185 = <b>DEM-brickor i latitud/longitud för månhorisonten</b>: <c1/> läser en textbricka <c2/> (höjder över medelsfären på ett rutnät i latitud/longitud) i stället för det polära stereografiska <c3/>, för både <c4/> och <c5/>; rapporten ekar brickan (<c6/>, med dess SHA-256). <c7/> är nu kopplad in i strålstegningen för horisonten. En bricka omsamplad från den medföljande beskärningen ger stationen beskärningens horisont till { "0.22" } grader. MODELLED.

seg-0c7ebb6c7d0d = <b>Terräng på exportplatsen för servicevolymen</b>: med en sektion <c1/> bär varje rad i exporten av geometri per satellit för <c2/> värdet <c3/> (satelliten klarar den platta masken och exportplatsens horisont vid dess azimut), rapporten bär platsens horisont (<c4/>), och körnings-CSV får kolumnen. Utan terräng är exporten oförändrad. MODELLED.

seg-7c8789777c26 = <b>Huvudfält från motorn</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> och WebAssembly-funktionen <c3/> anger, för tolv typer, vilka fält i ett scenario som besvarar dess fråga, bäst först, som punktade sökvägar (<c4/>). Studio läser dem före sin egen rangordning. Endast visningsmetadata: motorn läser den aldrig, ingen scenariofil behöver den, inget resultat beror på den. <c5/> misslyckas om en typ inte kan skickas eller en sökväg inte finns i något av typens medföljande scenarier (det fångade två sökvägar som Studios tillplattade id:n hade stavat utan arrayparenteserna).

seg-7528700924b2 = <b>Tabell från typ till modul från motorn</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> och WebAssembly-funktionen <c3/> anger, för varje scenariotyp vars rader i verifieringsmatrisen namnger en annan modul än sin egen, modulnamnen. Studios förmågekarta använde sin egen handskrivna kopia; <c4/> misslyckas om en typ i tabellen inte kan skickas eller en modul inte förekommer i någon matrisrad. Inga utdata ändrades.

seg-af7d28b7fb0e = <b>Kort IQ-körning i webbläsarbygget</b> ({ "0.36" }): <c1/> och <c2/> i WebAssembly-modulen bygger en syntetisk scen, fångar in varje satellit och spårar de infångade, allt i minnet, begränsat till { "0.25" } s, { "1 000 000" } sampel och { "8" } satelliter. Scenbyggaren och uppslagningen av signal efter namn flyttades ut ur <c3/> som bara finns i native-bygget (till <c4/> och <c5/>) så att båda byggen delar dem; kommandoradens utdata är oförändrad. Det native testet och <c6/> jämför samma begäran mot en golden (<c7/>), byte för byte: sedan ändringen med portabel matematik (STUDIO-15, nedan) ger webbläsarbygget och det native bygget samma bitar.

seg-c0eab9b97b7d = <b>Typade API:er för Python och TypeScript</b> (CAP-34): <c1/> typar de stängda vokabulärerna (<c2/>, varje typnamn; <c3/>; <c4/>) och ordböckerna <c5/> och <c6/>; <c7/> och <c8/> returnerar dem. WebAssembly-paketet lägger till <c9/> (en körning som ett typat objekt <c10/> med det tolkade dokumentet som <c11/>) och <c12/> (de tolkade <c13/>), och dess <c14/> bär samma vokabulär; <c15/> är typad <c16/>. <c17/> håller båda listorna lika med motorns.

seg-b097c2f105c3 = <b>Enheter för varje kolumn i <c1/></b> (FUT-28): ett resultat av <c2/> bär nu <c3/> och <c4/>, enheten för varje svept nyckel och varje registrerat mått, läst från det svepta paketets egen enhetstabell. En axel kan deklarera <c5/> för en nyckel som paketet inte ekar; en deklarerad enhet som strider mot paketets avvisas, och en enhet som ingen av dem anger är <c6/>, aldrig gissad. <c7/> och <c8/> beskrivs, så var och en av de { "76" } typerna täcks nu fullt av grinden för fältenheter (tak för icke täckta typer { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>NumPy-arrayer från <c1/></b> (FUT-26): Python-klassen <c2/> får <c3/>, <c4/> och <c5/>, som returnerar objekt av typen <c6/> för en numerisk lista, de numeriska kolumnerna i en lista med poster eller varje postserie i dokumentet. Varje array är lika med <c7/> av samma värden från <c8/> (dtype och bitar). NumPy importeras bara när en av dem anropas och står utanför körkraven. Typad i <c9/> och kontrollerad av stubtest.

seg-1c7a22dabad3 = <b>Kampanjoptimerare</b> (CAP-32): typen <c1/> får en ny, valfri sektion <c2/> som söker bland en till tre scenarionycklar inom angivna gränser efter bästa värde för ett mått: minimera, maximera eller träffa ett mål. Den söker uttömmande på ett rutnät, eller med en deterministisk begränsad Nelder–Mead-simplex. Varje utvärdering är en verklig körning av den namngivna typen och listas i resultatets <c3/>. Exempel: <c4/>. Trösklarna förhandsregistrerades (<c5/>):

seg-f4e79236b6bf = Rosenbrock-funktionen når sin tröskel (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = en 1-D-målslösning med sluten form når sin tröskel ({ "6e-15" } relativt);

seg-5ab478e03354 = rutnätet är bitidentiskt med en oberoende uttömmande sökning;

seg-ea0a04c6e713 = simplexen presterar minst lika bra som ett rutnät på { "41" } × { "41" } med { "177" } körningar.

seg-161d8c5b55e8 = Tröskeln för 1-D i rond { "1" } registreras som NOT MET, eftersom den förhandsregistrerade rutan uteslöt lösningen. MODELLED; registerrad "Begränsad optimering av ett mått över kampanjparametrar". Additivt: kampanjer utan sektionen är oförändrade.

seg-83d40a636fcb = <b>Kalibreringsensembler</b> (CAP-10): tre kontroller med ett enda frö omkörda över { "200" } oberoende frön mot förhandsregistrerade trösklar, i <a1><c1/></a1> (genererade av <c2/>; värden per frö i <c3/>).

seg-b163e53e06e9 = Bootstrap-intervallet på { "95" } % för kampanjens Monte Carlo täcker det sanna medelvärdet i { "192" } av { "200" } ensembler, och dess chi-kvadrat-kontroll klaras i { "196" }.

seg-022a7fbee13a = Percentiltoleransen för ett enda frö klaras i bara { "183" } av { "200" }: NOT MET, som förutsagt. Det är en tröskel på ungefär 2 sigma, registrerad och inte lättad.

seg-096f36d21b02 = ADEV-kalibreringarna för vit FM klaras för varje frö, med sitt sämsta fel långt inom toleransen.

seg-369c7f2a115c = <b>Inbyggda typer genom traiten <c1/></b> (FUT-27, pågår): traiten <c2/> (<c3/>, med en nivåkrok per mått och <c4/>), och de första typerna flyttade till den (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Utdata är oförändrat: ett manifest över hela katalogen med SHA-256 för varje utdata är identiskt före och efter (<c10/>).

seg-fd6e68ff5e5d = <b>No-fetch-kontroll för lekplatsen</b> (RM-07): <c1/> kontrollerar tre saker:

seg-3e424188f6e1 = varje Studio-biblioteksscenario finns i webbläsarpaketet;

seg-2803ccf8b9ae = paketet är byte-identiskt med <c1/>;

seg-b98016a4a844 = varje webbläsarscenario körs från en tom arbetskatalog.

seg-efc143b4f2a9 = <b>Alt-PNT-kartor: verkligt gravitationsfält, Monte Carlo av kartfel, SRTM i full upplösning</b> ({ "0.36" }, WP-10). Typen <c1/> tar en valfri <c2/>: en gravitationsanomali syntetiserad från de medföljande EGM2008-koefficienterna (eller en ICGEM-fil <c3/> via <c4/>, endast native-byggen). Den syntesen stämmer med ICGEM Calculation Service till ungefär { "1e-8" } mGal över { "794" } noder i två regioner, mot förhandsregistrerade trösklar på { "0.005" } mGal RMS och { "0.02" } mGal max (VALIDATED; registerrad "Syntes av gravitationsanomali från en sfärisk-harmonisk modell"). Det nya medföljande scenariot <c5/> kör 60-minutersbenchmarken på det verkliga fältet av grad 70. Förhandsregistrerat utfall: matchat fel { "3106" } m, så tröskeln på < { "500" } m är NOT MET, som förutsagt (grad { "70" } är för slät), och den tiodubbla minskningen av driften är MET (MODELLED). En valfri <c6/> kör om benchmarken över fröstyrda, gaussiskt korrelerade kartfel och rapporterar fördelningen av matchat fel (medföljande scenario <c7/>). EXPLORATORY och inte förhandsregistrerat: med ett kartfel på { "2" } mGal korrelerat över { "0.2" } grader (den storlek som matcharens egen sigmabudget räknar med) håller sig { "1" } av { "20" } realiseringar inom { "500" } m (median { "2.9" } km, p95 { "14.7" } km), mot { "144" } m med en perfekt karta. Den syntetiska benchmarkens positionsbestämning under 500 m förutsätter att kartan är exakt. Utan något av alternativen är dokumentet byte-identiskt med tidigare utgåvor. <c8/> tar en valfri <c9/> (<c10/>, <c11/>) som läser den magnetiska kanalen från en CSV i EMAG2v3-format. EMAG2 medföljer inte eftersom dess villkor inte är uttryckliga: <c12/> hämtar den med en fastlåst SHA-256 och beskär en ruta. Inget navigeringsutfall hävdas på det verkliga EMAG2-rutnätet. Gemensam kartskattning (terrain SLAM, RM-18): <c13/> flyger den sekventiella terrängnavigatorn över en lagrad karta som skiljer sig från referensen, antingen genom att lita på den eller genom att uppskatta en kartkorrektion per cell med ett Rao-Blackwelliserat filter i FastSLAM-stil. Förhandsregistrerat mot SITAN med känd karta på ett korrelerat kartfel på { "15" } m över { "20" } frön: en genomsnittlig förbättring på { "1.5" } %, bättre i { "10" } av { "20" }, så båda förbättringströsklarna är NOT MET ({ "10" } % och { "12" } av { "20" }), utan skada på en perfekt karta (MET). Ett enda pass utan återbesök låter inte kartan läras (<c14/>, MODELLED). Dokument för <c15/> är byte-identiska. Testerna med verklig SRTM körs nu i CI på två incheckade beskärningar i full upplösning; alla förhandsregistrerade trösklar nås, med närmaste nod lika med GDAL { "3.8.4" } i { "8" } av { "8" } punkter (<c16/>).

seg-aa7ac7a47111 = <b>Interoperabilitet, WP-08</b> ({ "0.36" }; varje punkt förhandsregistrerad och incheckad ensam före sin körning mot oberoende referens, var och en en ny VALIDATED registerrad utom telemetripunkten, som vidgar en befintlig rad):

seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 och OCM { "3.0" } (blocken TRAJ, PHYS, COV, MAN, USER) skrivna och lästa i KVN och NDM/XML, och ett OMM med full precision från en SGP4-elementmängd (<c2/>); utdata från <c3/> är oförändrat. Mot Orekit { "13.1.8" } åt båda hållen: { "27" } av { "30" } Kshana-meddelanden tolkas i Orekit och Kshana läser varje meddelande skrivet av Orekit, värden inom { "1e-14" } relativt och epoker inom { "1e-9" } s; fyra fynd fastlåsta (Orekit kräver <c4/>, avvisar <c5/> i användardefinierade XML-parametrar, skriver inte <c6/> utan <c7/>, och läser OCM:s relativa epoker under TDB i SI-sekunder). Den äldre OMM-skrivarens <c8/> avvisas av Orekit (registrerat). Rad "CCSDS Orbit Data Messages (OPM, OMM, OCM)".

seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 och APM { "2.0" } i KVN och XML mot Orekit { "13.1.8" }, varje tröskel nådd; Orekits APM-skrivare avvisar en manöver utan <c3/> (fastlåst). Rad "CCSDS Attitude Data Messages (AEM, APM)".

seg-bdfce382a98c = <b>SPICE SPK-export</b> (<c1/>): skrivare och läsare för SPK-typerna { "9" } och { "13" } samt OEM till SPK-export; mot CSPICE N0067 är kärnorna byte-identiska med SPICE:s och utvärderas bitidentiskt. Rad "SPICE SPK-export (typerna { "9" } och { "13" })".

seg-ce217acb9fe7 = <b>SPICE SPK-typerna { "3" } och { "21" }</b> (<c1/>): segment av typ { "3" } (Chebyshev) och typ { "21" } (utökade differenslinjer) skrivna från givna poster och utvärderade som SPICE gör; mot CSPICE N0067 är kärnorna byte-identiska med SPICE:s och varje utvärdering stämmer bit för bit åt båda hållen. Rad "SPICE SPK-typerna { "3" } och { "21" } (Chebyshev, utökade differenslinjer)".

seg-72b8edbc74dc = <b>Utökningar av Space Packet</b> (<c1/>): sekundärhuvud med tidskoderna CUC/CDS, paketfelskontroll, segmentering och strömkontroller, mot ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } och CPython <c2/>, noll avvikelser. Rad "CCSDS Space Packet, sekundärhuvud, paketfelskontroll och segmentering".

seg-c5fcf933b656 = <b>Telemetrischema { "1.3" } genom verkliga konsumenter</b>: en syntetisk ström i schema 1.3 med Prometheus-exposition och OTLP/HTTP JSON, inklusive geometriserien och etiketten <c1/>, lästa exakt av prometheus_client och OTLP-proto, accepterade av promtool { "3.5.0" } <c2/> utan lintproblem, och vidarebefordrade oförändrade genom OpenTelemetry Collector contrib { "0.135.0" } (datastyrt: verktyg hämtade med fastlåst SHA-256, utdata incheckade).

seg-013344665417 = <b>Banbestämning för Mars, körning { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skalar normalmatrisen med dess diagonal och dämpar steget (Levenberg–Marquardt), efter att den registrerade Gauss–Newton-anpassningen misslyckats på en matris vars råa diagonal spänner över åtta storleksordningar. Registrerad separat (<c2/>, samma båge, trösklar och redigering). På de poängsatta MRO-passagerna ligger banan inom { "0.36" } km RMS ({ "0.53" } km maximum) från MRO:s navigationsrekonstruktion, trösklar nådda. Doppler efter anpassning är { "48.6" } mHz mot tröskeln { "30" } mHz, inte nådd (fynd fastlåst). Ett ändringstillägg enbart för poängsättning, R2-A1, redovisas i <c3/>. Raden förblir MODELLED.

seg-fee311480417 = <b>Mars rampad 2-vägs-Dopplermodell och banbestämning</b> ({ "0.36" }, WP-14, CAP-30 del, steg { "2" }): <c1/> förutsäger DSN:s rampade X-band 2-vägs-Doppler från ODF-ramptabeller (ljustid, Shapiro, troposfär, stationstid, DSN-stationer via CIO-kedjan och IERS EOP) och anpassar en Mars-satellit (GMM-3, tredjekroppar, SRP, luftmotstånd). <c2/> läser SPK-typ { "1" } (kontrollerad mot CSPICE) och <c3/> läser PDS SHADR-fält. Förhandsregistrerat mot MRO:s navigationsrekonstruktion på verkliga MRO-passager (datastyrt, <c4/>, månatlig CI): den förutsagda Dopplern matchar observationerna till { "12.5" } mHz (tröskel { "30" } mHz, nådd); den registrerade banpassningen misslyckades på den poängsatta bågen och gav ingen bana (fynd fastlåst). Raden förblir MODELLED.

seg-d8212aa309ef = <b>Läsare för DSN Orbit Data File</b> ({ "0.36" }, WP-14, CAP-30 del): <c1/> läser TRK-2-18-ODF:er. På en verklig ODF från Mars Reconnaissance Orbiter (NASA PDS, medföljande) stämmer läsaren med PDS-etikettens postantal, grupppositioner, stationer och tider, och alla dess datatyper är kända. Etikettens tabell vid filslut är en rad kortare än filen, en etikettinkonsistens registrerad som ett fynd. MODELLED. Banbestämning på dessa data är ännu inte gjord.

seg-bf26920a50bc = <b>TWSTFT-budget och stabilitet för tidsöverföring: typen <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Tvåvägsekvation:

seg-c1fdd431db57 = <c1/> löser den för T_A − T_B med stationsutrustningens fördröjningar, Ku-bandets jonosfäriska asymmetri upp/ner, skillnaden i transponderfördröjning och Sagnac-termerna, och återskapar framåtmodellen till { "1e-15" } s.

seg-a5468765380d = <b>Osäkerhetsbudget:</b> kombinerad kvadratiskt, med länkens TDEV som typ A-term.

seg-7f365f91bb3e = <b>Länkbrus:</b> tvåvägsserien får ett flickerfasbrusgolv, en dygnsvarierande icke-reciprocitet och en konstant reciprocitetsrest. Paketet <c1/> med vitt jitter är oförändrat.

seg-8b40e74db08c = <b>Verkliga serier:</b> stabiliteten hos tillhandahållna serier från BIPM Circular T, CSV <c1/> eller IGS stationsklockor.

seg-267fd20d823c = MODELLED. Nytt medföljande scenario <c1/>. PPP-tidslösningen är VALIDATED separat mot IGS stationsklocka på grenen för verkliga GNSS-data.

seg-ae33b92da4a6 = <b>Inträdesuppvärmning, EO-radiometri och uppstigningsförluster</b> ({ "0.36" }, WP-14, CAP-28): tre nya typer.

seg-34951878aa49 = <c1/>: ett 3-DoF-inträde som punktmassa över en roterande jord eller Mars med Sutton–Graves stagnationspunktsuppvärmning.

seg-98fe7a4c464a = <c1/>: avbildares SNR, MTF vid Nyquist, relativ kantrespons och GIQE { "4" } NIIRS.

seg-173dfbe3cc3e = <c1/>: en uppstigning i flera steg med gravitationssväng och förluster från gravitation, luftmotstånd, styrning och mottryck, kontrollerad av den exakta identiteten ideal-dv minus förluster.

seg-0c9e7aacec80 = Inträdets maximala retardation kontrollerades mot den publicerade nominella för Stardust under en förhandsregistrerad tröskel: { "35.44" } g mot { "33.4" } g (+{ "6.1" } %, tröskel { "10" } %). Den raden är VALIDATED. Uppvärmning, radiometri och uppstigning är MODELLED. Nytt är också: <c1/>, medföljande scenarier <c2/>, <c3/> och <c4/>, samt <c5/>.

seg-d4648c4e6655 = <b>Attitydreglering med reaktionshjul: typen <c1/></b> ({ "0.36" }, WP-14, CAP-21). En tröghetsriktad vridning av ett stelt nav med tre eller fler balanserade reaktionshjul under MRP-återkoppling, med minimumnorm-hjulmoment begränsade till varje motors gräns (<c2/>). Den kan också sluta slingan på ett multiplikativt EKF från en simulerad gyro och stjärnkamera (<c3/>). Slingan med sant tillstånd jämfördes med Basilisk { "2.9.1" } på tre fall förhandsregistrerade innan koden fanns (tre ortogonala hjul, en fyrhjulspyramid, ett mättande fall). Varje MRP-komponent, kroppsvinkelhastighet, hjulhastighet och motormoment stämde vid varje sampel, sämst { "2.4e-14" } i sigma och { "2.9e-11" } rad/s i hjulhastighet. Denna rad är VALIDATED; MEKF är MODELLED (NEES-samstämmighet). Nya medföljande scenarier <c4/> och <c5/>, samt <c6/>.

seg-8ce699586340 = <b>Schemaläggning av markkontakter och DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): två nya scenariotyper. <c1/> ger, för en satellit över en station, varje passages Es/N0 och den DVB-S2 MODCOD som väljs längs den (ETSI EN { "302" } 307-1 trösklarna i tabell { "13" } plus en marginal). Den ger också den datavolym som ACM förflyttar jämfört med baslinjen med konstant kodning. <c2/> gör detsamma för flera satelliter över flera stationer och bygger en konfliktfri kontaktplan (antennomställning, en station per satellit, prioritetsviktad leverans begränsad till varje kö). Den rapporterar en girig plan med marginalvärde, en baslinje enligt först till kvarn och det exakta optimumet på små mängder, med den giriga planens optimalitetsgap. Åtkomstfönster kommer från den VALIDATED prediktorn för skenbara passager. Nya medföljande scenarier <c3/> och <c4/> (illustrativa indata) samt <c5/>. MODELLED (två nya registerrader).

seg-cd6dbcc3a78b = <b>Starlink-Dopplerpositionering mot ett publicerat experiment</b> ({ "0.36" }, WP-14, CAP-11 del, MODELLED). Detta är en förhandsregistrerad proxyjämförelse av Dopplerläget i <c1/> med förinställningen <c2/> mot percentilerna i datamängd 3 i "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Modellen använde { "3" } satelliter (en mask på { "47" } grader vald med en fast regel), ingen höjdhjälp och en Doppler-sigma på { "30" } Hz, över { "200" } frön. Dess 3-D-fel vid 90:e percentilen är { "92.2" } m vid { "20" } s och { "870" } m vid { "8" } s, mot de publicerade { "2" } m och { "10" } m, så båda trösklarna på en faktor två är NOT MET. Modellen är pessimistisk, inte optimistisk som förutsagt: tre fasta satelliter ger mycket mindre geometrisk mångfald än experimentets { "63" } satelliter över { "10" } minuter med kanalbyte var { "15" } s. Båda missarna fastställs i test (<c3/>).

seg-ffeb1b66cda5 = <b>Impulsiv transferoptimerare på DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> finner avgångs- och ankomstdatum för en ballistisk tvåimpulstransfer med ett varv som minimerar avgångs-C3 eller ankomst-V-infinity inom typ I eller typ II. Den söker i ett rutnät på 2 dagar och förfinar sedan med 2-D Nelder–Mead, på heliocentriska tillstånd från DE440-kärnan; den bygger på <c2/>. Jämförelsen förhandsregistrerades (bf0439e8) mot en oberoende optimerare med SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } på möjligheten Jorden–Mars { "2026" }: alla fyra optimeringar stämmer till { "8.7e-13" } relativt, med datum inom { "1e-5" } dygn (VALIDATED, ny registerrad). Som sekundär publicerad referens matchas NASA/TM-2010-216764 (handboken för Jorden–Mars 2026-2045) för minsta C3 av typ II ({ "9.182" } mot { "9.144" }) och minsta ankomst-V-infinity av typ II ({ "2.564" } mot { "2.565" }). Dess minsta C3 av typ I matchas inte: { "10.535" } mot { "11.11" } (-5.18 %), där biblioteksreferensen stämmer med Kshana. Missen registreras och fastställs i test.

seg-91fe2e2625a1 = <b>Studie av månreferensstation</b> ({ "0.36" }, föranledd av publicerat material om en planerad referensstation vid månens sydpol; källor i <a1><c1/></a1>): typen <c2/>, ett Monte Carlo-svep av den lunara differentiella PNT-modellen över ett sydpolärt användarrutnät och ett dygn av epoker, som ger per punkt och över regionen percentilfelet korrigerat och okorrigerat, tillgänglighet med skäl, täckning mot en angiven tröskel, skyddsnivåer, täckningsradien per azimut och korrektionslänkens budget. Den reduceras exakt till <c3/> vid en punkt, en epok och ett försök; dess aritmetik beräknades om av numpy under en förhandsregistrerad tröskel (positioner och percentiler nådda; stationskorrektionerna missade sin på grund av avrundning i dubbel precision, registrerat). MODELLED; registerrad "Täckning och noggrannhetskarta för månreferensstation". Inte knuten till eller stödd av någon myndighet; inget uttalande om prestanda hos något verkligt system.

seg-3d0cd9692787 = <b>Förhandsregistrerad prognos: täckning för månreferensstation</b> (inte en validering; MODELLED). <a1><c1/></a1> fryser, vid commit c05dac1d, resultaten för <c2/> under de offentligt angivna antagandena, med SHA-256-hashar av indata och resultat och ett poängprotokoll fastställt nu (faktor { "2" } för noggrannheter och skyddsnivåer, { "10" } procentenheter för tillgänglighet och täckning; ett ändrat antagande får en ny daterad prognos, aldrig en redigering; en miss publiceras lika framträdande som en träff). Varje värde domineras av den fyrsatellitkonstellationens opublicerade elementmängd, som är ILLUSTRATIVE, och säger det. <c3/> vaktar den; <c4/> får ett avsnitt "Förhandsregistrerade prognoser". Ingen registerrad.

seg-00ec7ccd4d0d = <b>Utökningar för månreferensstation</b> ({ "0.36" }; begränsningarna { "2" } och { "3" } i stationsstudien och källornas lösningsstil), var och en valfri på <c1/> och frånvarande som standard, så att varje befintligt dokument, den frusna prognosen inräknad, är oförändrat: <c2/> (flervägsutbredning <c3/> hos användaren och stationen, stationens valfritt som Gauss–Markov över epoker, DLL-kodbrus från C/N0, interkanalbias; värden ILLUSTRATIVE på månen); <c4/> (linjär tillväxt av det utsända banfelet över korrektionsfördröjningen, ILLUSTRATIVE); <c5/> (höjdbegränsning, ett minimum av tre satelliter med den, ett fönster för statisk användare över epoker). Två tillägg till jämförelsen med publicerade påståenden, vart och ett förhandsregistrerat ensamt före sin körning, ligger bredvid den oredigerade registrerade körningen: K5 med tillväxt misslyckas vid varje takt; med källornas lösningsstil misslyckas K1 till K5 och K6 klaras ({ "1" } av { "6" }), där det korrigerade 3-D-felet vid p95 för R300 faller från { "280.6" } m till { "2.11" } m. MODELLED; tre registerrader.

seg-1d0a0dcd42de = <b>Horisontmasker för månterräng</b> ({ "0.36" }; den första begränsningen i studien av månreferensstation): en valfri sektion <c1/> på <c2/> (stationen och varje användarpunkt) och <c3/> (varje rutnätspunkt) ger varje plats en azimutberoende horisont i skyline-tabellformatet för { "0.36" }, från en angiven profil märkt med sin källa (<c4/>, <c5/>) och/eller en strålstegning över en polär DEM (<c6/>) längs storcirklar på månsfären med exakt krökning. Medför en beskärning på { "0.98" } MB av den sydpolära DEM:en <c7/> från LRO LOLA (public domain), omsamplad med blockmedelvärde { "5" } x { "5" } till { "1200" } m (<c8/>, med dess NOTICE, SHA-256 och <c9/>), och scenariot <c10/> som endast finns i förrådet. Kontrollerad mot slutna horisonter (bar sfär, krater i en platå, rastrerad kon); MODELLED, registerrad "Horisontmasker för månterräng från en angiven profil eller en polär DEM". Utan sektionen är varje dokument, enhetsblocket inräknat, byte-identiskt.

seg-ca0c6ca7396a = <b>Geometrimedvetet förtroende</b> (utformningsanteckningen för geometri i { "0.36" }, avsnitt { "4" }). Varje epok i <c1/>, statisk eller fartyg, batch eller live, bär sin satellitgeometri: <c2/>, <c3/> (skäl <c4/>, <c5/>, <c6/> och informationen <c7/>) eller <c8/> där loggen inte ger någon satellitgeometri, med HDOP, PDOP, VDOP och använda satelliter. Den härleds från de elevationer och azimut som mottagaren rapporterar (NMEA GSV, UBX NAV-SAT) genom den befintliga kärnan <c9/>, eller tas från NMEA GSA. Varje epok bär också en etikett, <c10/>, <c11/> eller <c12/>, alltid rapporterad och aldrig poängsatt, och en notering med HDOP, PDOP, VDOP, antal satelliter och signalförlust i ord. Ett fartygs poäng får en monitor <c13/> som drar av ingenting om inte geometrin är dålig (HDOP över { "4" }, PDOP över { "6" } eller färre än { "5" } använda satelliter), och sedan ramper upp till ett tak på { "15" } poäng; enbart geometri når högst det försämrade bandet, aldrig det opålitliga (inget larm). Varje avdrag får en klass, <c14/>, <c15/> eller <c16/>, så att en dålig himmel inte läses som en attack. <c17/> är <c18/> när de förlorade satelliterna alla låg under { "15" } grader vid sin senaste rapport; ett avdrag för dålig geometri är <c19/> när den HDOP mottagaren anger avviker från dess angivna himmel med mer än max({ "1.0" }, { "25" } % av den härledda HDOP), så att en förfalskad dålig himmel inte kan köpa etiketten. En ny tabell <c20/> anger varje tröskel med dess proveniens (HDOP { "4" }, PDOP { "6" }, minst { "5" } använda, sigma_UERE { "1.5" } m, en HDOP-tolerans på max({ "1.0" }, { "25" } % av den härledda HDOP) där { "25" } % är ett representativt val för mottagare med klockor per konstellation eller delmängdslösningar, { "15" } grader; siffrorna i IEC 61108-1 och GPS SPS som citerade, att kontrolleras mot standardernas text). Total signalförlust märks inte som himmel: när satelliter i sikte inte spåras och DOP för satelliterna i sikte är bra (och de ospårade inte är begränsade till en halva av horisonten), bär epoken <c21/> och geometriavdraget är <c22/>. Ett angivet HDOP eller PDOP på { "99" } eller mer, GGA-kvalitet { "0" } och GSA-läge { "1" } läses som ingen positionsbestämning, inte som DOP. Taket (<c23/> { "15" }), rampens slut (<c24/> { "1.5" }) och golvet (<c25/>, som standard poängens <c26/>) finns i <c27/>, liksom etikettens goda nivåer (HDOP { "2" }, PDOP { "3" }, { "6" } satelliter, representativt); taket som gäller är <c28/>, så en tabell <c29/> som höjer <c30/> (en på { "0.35" } inräknad) sänker taket i stället för att avvisas, och ett golv under <c31/> avvisas. MODELLED; rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.

seg-d976d3495695 = Geometrin når varje yta: resultat-JSON (<c1/>, <c2/> på varje avdrag, <c3/>, <c4/>), de levande JSON-raderna (schema { "1.3" }), Python- och WebAssembly-gränssnitten <c5/>, <c6/> och <c7/>, MCP-verktygen <c8/>, bevispaket (<c9/>, <c10/>, ett geometrispår på sammanfattningssidan) och <c11/> (Prometheus <c12/> och en etikett <c13/> på <c14/>, OTLP <c15/>, anpassade CEF-fält <c16/> (geometristatus och klasser), <c17/> (HDOP) och <c18/> (PDOP), kontrollerade mot båda CEF-referenstolkarna, och LEEF <c19/>, <c20/>, <c21/>). Geometrietiketten exporteras också, tillagd efter varje tidigare serie och fält och endast för indata som bär den: Prometheus <c22/> och <c23/>, OTLP <c24/> och <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, och CEF ett tredje fält <c30/> (etiketten) och <c31/> (använda satelliter); VDOP finns inte i CEF (flyttalsfälten för anpassade fält är upptagna). Båda CEF-referenstolkarna läser tillbaka etikettfallen som skrivna (tillägg { "5" }: { "176" } rader, { "172" } tolkade av pycef, { "176" } av Logstash). Ett angivet HDOP som den angivna himlen inte förklarar flaggas på varje epok och räknas (<c32/>, en rad på bevissammanfattningens sida), och poängsätts endast när geometrin är dålig. Signalförlust exporteras för sig, eftersom geometristatusen förblir <c33/> medan den består: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; i CEF visas den som klassen <c37/> i <c38/>.

seg-5030e5214ed0 = <c1/>: kovariansfaktorn <c2/> bakom <c3/>, utbruten ur den med samma aritmetik.

seg-c6cc061a3ed6 = Registerrad "Positionsfel från geometri: RMS-fel = sigma_UERE x DOP" (<b>MODELLED</b>, intern samstämmighet): en fröstyrd Monte Carlo av motorns minstakvadratbestämning på { "8" } gnss_lib_py-matchade DOP-geometrier mot kovariansfaktorn i DOP-kärnan med nivån VALIDATED, med toleranser förhandsregistrerade före första körningen och två negativa kontroller som misslyckas som krävs; vid sidan av den, en tidigare kontroll på fyra handvalda himlar med chi-kvadrat-konfidensintervall, redovisad som körd före förhandsregistreringen.

seg-b87b6eafd465 = <b>Azimutberoende skyline-masker</b> (<c1/>, <a1><c2/></a1>, utformningsanteckningens punkt { "1" }): en elevationsgräns som beror på azimut, punktvis maximum av tabeller (var och en interpolerad för sig, omlindad vid { "360" }°), en gatukanjon i sluten form (med valfria öppna ändar), skarpkantade sektorer och en terrängprofil med jordens krökning; den effektiva gränsen är <c3/>. Fyra REPRESENTATIVE förinställningar med angiven proveniens (<c4/>, <c5/>, <c6/>, <c7/>), överskrivbara fält för fält. En valfri sektion <c8/> i träningsfilerna för <c9/>, <c10/>, <c11/> (varje läge, det polära svepet inräknat), <c12/> och <c13/>, och i <c14/> och <c15/> genom en ny användare på marknivå, <c16/> (geodetiska siktvinklar på den roterande jorden, med den geodetiska uppåtriktningen för ARAIM:s horisontella och vertikala uppdelning; varje sampel är ett absolut ögonblick, <c17/>, till vilket elementmängder, utsända efemerider och SP3-filer förs fram från sina egna epoker, daterade från den nyaste satellitepoken när ingen <c18/> anges; en kretsande <c19/> avvisar en skyline). Resultat får <c20/> och <c21/> per sampel. Utan sektionen är varje scenario byte-identiskt med { "0.35.0" }, kontrollerat mot sammandrag från utgivningscommiten. Sex medföljande exempel: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> och kampanjen <c27/> (kanjonen för det autonoma fordonet som plan gräns och som gata; den befintliga kampanjen är oförändrad). MODELLED.

seg-95cdecf341d6 = <b>Funktioner för himmelsgeometri</b> (<c1/>, utformningsanteckningens punkt { "2" }): <c2/> (synliga och maskerade satelliter från en plats, en tid och konstellationsförinställningar, tvåradiga elementmängder (<c3/>, högst { "4" } MiB, propagerade av motorns SGP4 till en UTC-epok <c4/>) eller givna satelliter; <c5/> och <c6/> anger om himlen är representativ eller den himmel som elementmängderna ger vid den epoken, inte en mätning; <c7/> listar varje oanvänd rad med sitt skäl; indatagränser på { "2000" } satelliter över horisonten, kontrollerade innan en systemtabell byggs, och { "16" } mottagarklockor; de fem DOP-värdena; ENU-kofaktorn och kovariansen med en klocka per system eller en gemensam; den horisontella felellipsen vid en sigma och vid en angiven konfidens), <c8/> (fröstyrda minstakvadratfel, högst { "5000" }), <c9/>, <c10/> och <c11/>. <c12/> exponerar kovariansen bakom <c13/>, som nu är dess reduktion (de kontrollerade skalärerna är oförändrade). Ytor: <c14/> och <c15/>, Python- och WASM-funktioner med samma namn, och MCP-verktyget <c16/> ({ "40" } verktyg), och notebooken <c17/> (med dess spegel <c18/>; körs av <c19/>). Varje resultat bär etiketten MODELLED, uttalandet om felmodellen och den rådgivande texten.

seg-9414d387cf79 = Register: fem rader för skyline och himmelsgeometri. <b>VALIDATED</b>, var och en i en jämförelse förhandsregistrerad innan dess oberoende referens kördes: <em>Azimutberoende skyline-mask: synlig mängd, azimut och elevation, och DOP under masken</em> mot Orekit { "12.2" } (<c1/>, <c2/>) och gnss_lib_py { "1.0.4" } (<c3/>), sämsta skillnader i siktvinkel och mask { "1.1e-12" }° mot { "1e-9" }°, identiska synliga mängder, DOP { "3.3e-13" } relativt (<c4/>); <em>Horisontell felellips och kofaktor per system från geometrikovariansen</em> mot numpy <c5/> och <c6/> (standard P2), { "270" } fall, axlar { "5.1e-13" } relativt (<c7/>). <b>MODELLED</b>: kanjon-, sektor- och terrängreduktionerna; förinställningarna; sammansättningen av himmelsgeometri (förinställd himmel, Monte Carlo-moln).

seg-8f5ebce999fe = Med raderna för geometriförtroende, skyline och månreferensstation har registret { "274" } rader: { "134" } Validated, { "136" } Modelled, { "4" } Partner.

seg-686b1211d7bb = <b>Månreferensstation: stationens tidslaboratorium</b> (<b>MODELLED</b>). Ett valfritt block <c1/> på <c2/> (<c3/>). Det modellerar en stationsklocka (som standard miniRAFS-klassen, valfri namngiven klass, eller ett enhetskort anpassat till angivna stabilitetspunkter) styrd mot LTC, sedan fritt gående eller omstyrd var N:e sekund. Den ger tidsfelskurvan x(t), tiden till { "1" }, { "10" } och { "100" } ns (bisektion bredvid sluten form) och den dominerande termen per horisont, alla med enheter. Styrresten är ILLUSTRATIVE. LTC-takten härleds inte på nytt och behåller sin egen VALIDATED rad. Nanosekundmålet i det offentliga materialet från ICG WG-B Lunar PNT (juni { "2024" }) citeras som ett källuttalande, inte ett påstående. Klockordningen optisk < PHM < RAFS < miniRAFS gäller från { "1" } s till { "7e5" } s, och testet fastlåser korsningen mellan PHM- och RAFS-kurvorna nära { "7.5e5" } s. Den korsningen är en egenskap hos klockmodellerna med en enda brustyp (ren flicker-FM mot ren vit FM), inte ett fysikaliskt resultat. Utan blocket är rapporten, dess tabell och dess sammanfattning oförändrade. Exempel: <c4/>. Lägger till en registerrad, märkt MODELLED.

seg-863c2c7a5f0b = <b>Månreferensstation: stationsgeodesi</b> (<b>MODELLED</b>). Valfria indata <c1/> och <c2/> på <c3/> lägger till ett block <c4/>. Datuminformationen med fem arrayer från den arkiverade laseravståndsskivan kombineras med vad en tillagd retroreflektor och en tillagd VLBI-fyr på angivna platser skulle bidra med. Reflektorn avståndsmäts vid de arkiverade epoker den kan se, med sina arkiverade vikter. Fyren använder nätverket och schemat från <c5/>, med stationerna fasta. Blocket ger varje Helmert-1-sigma före och efter, och deras kvot. Dessa är Cramer–Rao-gränser för en reducerad parametermängd, på ett ILLUSTRATIVE schema och en ILLUSTRATIVE plats. Frånvarande eller tomma indata lämnar rapporten byte-identisk. Exempel: <c6/> och <c7/>. Lägger till en registerrad, märkt MODELLED.

seg-45c6febcc7fc = <b>Månreferensstation: jämförelse med publicerade påståenden</b> (<b>MODELLED</b>). Varje numeriskt påstående i fem offentliga källor listas med sin exakta formulering, sida och angivna antaganden, och klassas som jämförbart, delvis jämförbart eller inte jämförbart (<c1/>; källor med URL, hämtningsdatum, SHA-256 och licens i <c2/>). De delvis jämförbara påståendena poängsattes under sex ensidiga trösklar förhandsregistrerade före körningen (<c3/>, revision { "2" }, 05bf9a19): { "1" } av { "6" } påståenden inom den förhandsregistrerade tröskeln (förhandsregistrerad 05bf9a19). Täckningen är { "0.00" } mot >= { "0.95" } på båda sydpolära cirklarna, och det korrigerade p95 är { "280.6" } m mot <= { "1.5" } m. Orsaken är satelliternas banelement, som ingen källa publicerar: med de ILLUSTRATIVE elementen i källträdet är fyra satelliter i gemensam sikt i { "8" } % av epokerna, vid nästan singulär geometri. Körningen återger inte påståendena med dessa element och är inte belägg för att påståendena är fel. Fastlåst i <c4/>. En registerrad, märkt MODELLED med fyndet.

seg-2b01d2ccb666 = <b>Månreferensstation: databeredskap för klockfiler</b>. <c1/> anger nu tidssystemet för sina epoker. Det är värdet <c2/>, eller, när det inte är deklarerat, standardvärdet för huvudets satellitsystem. Resultatet säger också om systemet deklarerades. Funktionen avvisar ett okänt tidssystem (en lunar tidsskala, till exempel), en odeklarerad fil med blandade system och filer som motsäger varandra, i stället för att läsa dem som GPS-tid. Den levereras med en syntetisk stationsklockfixtur. Inget format för korrektionsfiler definieras, eftersom inget offentligt finns.

seg-0fb89eb36003 = Ändrat

seg-b63c95f12bc4 = Moduldokumentationen för <c1/>, <c2/> och <c3/> kallar inte längre UKF-navigatorn med 17 tillstånd, den fulla INS-täta kopplingen och det explicita klocktillståndet framtida arbete; de pekar på <c4/>, <c5/> och <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } avvisas inte längre</b> ({ "0.36" }, WP-07): en navigationsfil i RINEX { "4" } avvisades förr med avsikt; den läses nu (se Tillagt). För observationsfiler av version { "4" } och senare matchas rubriketiketter endast i kolumnerna 61-80, så att de nya fritextposterna inte kan passera som etiketter.

seg-5829841b58d7 = <b><c1/> läser verkliga IONEX-filer</b> ({ "0.36" }, WP-07): en fullständig post med 16 värden fyller kolumnerna 61-80, vilka läsaren tog för en etikett, så den returnerade <c2/> på varje verklig IONEX-fil. Den läser nu en post vars etikettfält är numeriskt som värden. Ingen levererad utdata använde den.

seg-a66bd6592b93 = <b>Mottagna effekter för Galileo E1 och E5a enligt OS SIS ICD Issue { "2.1" }</b> (revision, 2026-10-14). Spektrumbanden <c1/> och <c2/>, och de GNSS-offer med LEO-signal som tar sin effekt från dem, använder nu minimimottagna effekterna i tabell { "12" } i Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (var −{ "157.0" }) och −{ "155.25" } dBW (var −{ "155.0" }).

seg-b0386f62923f = Nio scenarioresultat flyttas: spektrumexemplen, spektrumkampanjen, tre LEO-resiliensvertikaler och tre LEO-signalutformningar. Effektivt C/N0 flyttas −{ "0.25" } dB och J/S +{ "0.25" } dB på dessa band.

seg-2af90bfcefae = Varje flyttat värde ({ "1766" }, gammalt → nytt) listas i <c1/> och dess CSV, med de dokumenttabeller som flyttats. Ingen registerrad ändrar status.

seg-d468174b2d4c = Andra delen, samma dag: LEO-signaloffren <c1/> (−{ "155.0" } → −{ "155.25" } dBW, tabell { "12" } E5b) och <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD:n har ingen E5-rad för fullt band, så AltBOC-värdet är effektsumman av totalerna för E5a och E5b i tabell { "12" }, byggd som det gamla värdet var. Tre resultat för LEO-signalutformning flyttas ({ "64" } värden: dessa mottagna effekter och C/N0-försämringen från LEO till GNSS på de två offren), listade i samma revision (§{ "5" }) och CSV. Inget annat flyttas.

seg-a96992246ef8 = <b>Korrigering av atmosfärstidvatten S2</b> (<c1/>). S2-lufttrycksharmonikerna hos Ray ({ "2001" }) är koefficienter för onormaliserade <c2/> med cosinusfasfördröjningar; de användes som fullt normaliserade med fördröjningen som IERS sinusledning. De går nu in dividerade med <c3/> med <c4/>; den nya <c5/> återskapar modell A2 i GFZ STR06/01 tabell { "5" } för alla { "21" } vågor (sämst { "0.0005" } cm, { "0.05" }°; VALIDATED). Bara utdata där tidvatten är aktiverat flyttas: Galileo CI-anpassningen { "0.132" } → { "0.133" } m, Swarm-A-komponenter med { "1" }–{ "2" } mm (förhandsregistrerat i <c6/>).

seg-6fa076226c01 = Endast dokumentation: <c1/>, <c2/> och <c3/> dokumenteras som äldre lösare, numeriskt oförändrade, med hänvisning till <c4/>.

seg-a757fd7ca793 = <b>D9 rond { "3" } (<c1/>), status.</b> BIPM Circular T { "465" } kom ut 2026-10-12. Den förhandsregistrerade prospektiva poängsättningen är fortfarande inte körd: utgåva { "465" } innehåller omkring { "285" } testvärden, och stoppregeln kräver { "1000" }, alltså omkring utgåvorna { "465" }–{ "468" }. Körningen kräver också de arkiverade filerna per laboratorium från 2026-09-30, eftersom BIPM sedan dess har skrivit om { "87" } av { "113" }. Registerraden och testhuvudet säger detta; testet, dess trösklar och dess uppdelning är oförändrade.

seg-e064546d05ec = <b>Genomgång av dokumentationens sanning ({ "0.36" }).</b> Färdplan, förmågerader, statusrader i utformningsdokument och modulkommentarer bringade i linje med koden; inga utdata ändras. Punkter som redan är byggda men fortfarande listade som öppna är nu markerade som klara: ITU-T-maskkontrollerna, holdover-scenariot på { "24" } h och inläsning av klockloggar (telecom timing), snabbstarterna för första minuten, Lense–Thirring och korskontrollen av Orekit-propagatorn, den ITRF-precisa GCRS-kedjan, golden- och korsplattformshashar, proveniens, ARAIM med flera fel (ADD v4.2), FDE för en enda satellit, CRPA-biblioteket, gränsen för CAI-fransosäkerhet, dimensionering av streets-of-coverage och 3-D-banvyn, stelkroppsattitydsdynamik, OMM-skrivaren och läsaren för NAIF-kärnor, DE440-librationen för månen, meningen om körningens betydelse i playground, <c1/>, den tätt kopplade navigatorn med 17 tillstånd och typen för gravitationskarta. Raderna anger också exakt vad som fortfarande är öppet (till exempel tvådelat JD i <c2/>, läsaren <c3/> mot en verklig produkt, och uteslutning av flera satelliter i <c4/>). Den saknade <c5/> är skriven från en ny körning av dess tester (M1–M4 klaras), och det partnerriktade utkastet till IQ-validering har aktuella registerantal.

seg-e2290a640df7 = Minneskoderna för Galileo E1 medföljer inte längre.

seg-80f8ca869682 = <c1/> och <c2/> (ICD Annex C.7/C.8) har tagits bort från förrådet och paketen. ICD:ns villkor (citerade i <c3/>) låter en användare lagra koderna med källan angiven och använda dem i en produkt, men tillåter vidaredistribution endast för icke-kommersiella ändamål, och Kshana erbjuds också under en kommersiell licens. <c4/> / <c5/> returnerar nu ett <c6/> och läser användarens egen kopia från <c7/> / <c8/>, eller, i en källkodsutcheckning, från <c9/>, där det nya <c10/> extraherar dem ur ICD-PDF:en (hashkontrollerat). <c11/> / <c12/> har tagits bort. Utan tabellerna returnerar Galileo E1-signalerna (<c13/>, <c14/>) ett fel som säger hur de ska tillhandahållas, och E1-testerna hoppas över med ett meddelande. Med tabellerna på plats är varje E1-utdata oförändrat. Inget scenario, ingen golden och ingen spektrumutdata använder kodtabellerna. Testfixturerna för E5a Annex C.3/C.4 (LFSR-referensen i <c15/>) hanteras på samma sätt: hämtas av samma skript, git-ignorerade, och testet hoppas över utan dem.

seg-654d0358137b = <b>Portabel matematik överallt</b> ({ "0.36" }, STUDIO-15): varje transcendent funktion för <c1/> i biblioteket, och samplarna för normal-, gamma- och exponentialfördelning i <c2/>, beräknas nu genom det rena Rust-biblioteket <c3/> (<c4/>, <c5/>), så att ett native bygge och WebAssembly-bygget ger byte-identisk resultat-JSON för alla { "141" } medföljande scenarier och för den korta IQ-körningen. Kostnaden är att de sista bitarna i resultat beräknade med värdens matematikbibliotek flyttades: { "98" } av de { "141" } medföljande scenarierna ändrades, { "43" } inte; { "5" } ändrades med mer än { "1e-3" } i sitt största fält, och resten med mindre. Varje flyttat värde listas gammalt -> nytt i <a1><c6/></a1> (med en CSV över alla { "136,127" } flyttade tal); ingen tröskel, tolerans eller gräns ändrades. Publicerade tal som ändrades: <c7/> tillgänglighet med jordavståndet { "0.719" } -> { "0.713" } och RMS-fel { "86.147" } -> { "86.499" } m (en epok på tillgänglighetskanten löses nu likadant överallt; den skrev ut { "0.725" } / { "85.800" } m på macOS arm64); <c8/> stationsfel { "3.541350" } -> { "3.536885" } m med VLBI och { "2183.558" } -> { "2184.021" } m utan; <c9/>, åtta värden i <c10/> med { "3" } enheter på sista platsen (erratum i den tekniska rapporten); det utgivna dokumentet <c11/> i storheter vid avrundningsgolvet (åtta värden bortom sex gällande siffror, upp till { "6.8e-5" } relativt; ingen rang eller tröskel flyttades). De fastlåsta hasharna för byte-identitetsvakterna (<c12/>, <c13/>, <c14/>) är omräknade till en namngiven baslinje "{ "0.36" } portable", med värdena från { "0.35.0" } bevarade som historisk dokumentation; den frusna prognosen för månreferensstationen är orörd och dess portabla omkörning lagras bredvid den (<c15/>). <c16/> (den VALIDATED raden för lunar joint OD): fixturer omexporterade och numpy-jämförelsen körd om med numpy { "2.4.6" }, den registrerade versionen, skriptet och tröskeln oförändrade; alla sex nätverk klaras (<a2><c17/></a2>). Arbetet i omgång 2-3 som slogs ihop efter STUDIO-15 använder också portabel matematik ({ "457" } anropsplatser i { "62" } filer); vad det flyttade finns i <a3><c18/></a3>: { "12" } medföljande scenarier (största relativa ändring { "5.2e-8" }, inget utskrivet värde flyttas), { "28" } skyline-vaktrader omfastställda, M2M4-sammandraget för <c19/>, de äldre referenshasharna för <c20/>, den oobserverade fyrens datumsigma ({ "632.3769" } -> { "632.3772" } m), och två registrerade fynd (CR3BP DRO-slutningar; CRPA A3, { "194" } av { "456" } länkar). Greenhalls exakta edf behåller sin VALIDATED tröskel med en dubbel-dubbel-logaritm i sin kärna (<a4><c21/></a4>), och test-bench-referensen för gps-sdr-sim kördes om på de flyttade NMEA-exporterna, varje tröskel höll (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: raden för månsviten anger varje delmängds evidensnivå (den sade att alla var MODELLED).

seg-ffb14764a7a9 = <c1/> returnerar <c2/> (serie, logg för rutnätsomsampling, tidssystem, om det deklarerades, posttyp) i stället för en tupel <c3/>. Den faller nu tillbaka från satellitposter (<c4/>) till mottagar-/stationsposter (<c5/>) med det begärda namnet.

seg-6777ca96624a = Inga poäng ändras om inte geometrin är dålig; etiketten rapporteras alltid. Med god eller acceptabel geometri (en GPS-enbart öppen himmel med { "8" } satelliter inräknad) eller okänd geometri (monitorn körs inte) är varje poäng som i { "0.35" }: <c1/> håller båda exempelsessionernas utdata och <c2/> varje incheckad NMEA-korpus för fartyg (även som GPS-enbart öppen himmel) och besättningsträningsscenarierna till bytes för { "0.35.0" } när de tillagda nycklarna tagits bort; i de två träningsscenarier där jamming gör geometrin dålig skiljer sig de dåliga epokerna enbart genom geometriavdraget. En logg med dålig geometri förlorar upp till { "15" } poäng som den inte förlorade i { "0.35" }. Avsedda ändringar i övrigt, alla tillägg: nycklarna ovan i resultat-JSON och bevispaket (<c3/> är oförändrad); schemat för live-JSON-rader går från { "1.2" } till { "1.3" } (<c4/> tillagd, <c5/> i varje avdrag); utdragssammanfattningen får <c6/>; telemetrin får geometriserier, fält och etiketten <c7/> endast för indata som bär dem, så en ström eller ett resultat från { "0.35" } renderas byte för byte som förr. <c8/> är det 17:e monitornamnet; det listas sist i <c9/> när den avgjorde (ett fartyg vars logg ger geometrin; en lista från { "0.35" } behåller sin ordning och sammanfattningens monitorantal ökar med ett) och har ingen post <c10/> (att ange en avvisas: dess avdrag anges i <c11/>).

seg-45b44c851937 = <c1/> angav licensen för gnss_lib_py som Apache-2.0; utgåvan { "1.0.4" } är MIT.

seg-a1a670a9c63e = NMEA-läsaren läser nu GSA (en kort GSA ignoreras, räknas inte som överhoppad) och behåller GSV-elevationer och -azimut, även för satelliter listade utan signal; UBX-läsaren behåller elevation och azimut för NAV-SAT. C/N0 läses exakt som förut.

seg-0bafbea5c75d = <b>Resultatändring: bredbands- och svepande jammers använder nu Q = { "2" }.</b> Anti-jam-ekvationen använder den läroboksmässiga justeringen Q för spridspektrum för dessa jammers, där den tidigare använde { "1" }. Q = { "2" } är vitt brus över huvudloben med signaleffekten i bandet normaliserad; den är fastlåst i testerna mot den slutna formen från <c1/>.

seg-21f31ec302de = <b>Oförändrat:</b> CW- och smalbandsjammers (Q = { "1" }), en okänd jammertyp (Q = { "1" }, det mest skadliga värdet) och <c1/>.

seg-f362499d2ed0 = <b>Effekt:</b> där en bredbands- eller svepande jammer verkar ökar effektivt C/N0 med upp till { "3.0103" } dB, härledda J/S-trösklar ökar med { "3.0103" } dB och radierna för nekande i fria rymden krymper med faktorn { "0.7071" }.

seg-088dcd34cc88 = <b>Ändrade medföljande scenarier:</b> { "12" } av { "144" } ändras, alla som förhandsregistrerat (<c1/>, resultat i <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: förlorade satelliter { "26" } → { "0" }, median för loss-of-lock-avstånd { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: radie för nekande, slingdynamik { "75.2" } → { "53.2" } km;

seg-096a24491872 = och kampanjerna och spektrumkorskontrollerna som innehåller dessa.

seg-ecdf60335064 = <b>Berörda konsumenter:</b> typerna <c1/>, <c2/>, <c3/> och <c4/>, spektrumtypernas <c5/>, IQ-kampanjens MODELLED referenskurva och labfit-standardvärdet Q, och interop-scenexport.

seg-89672d99e9e2 = JetBrains-plugin: inget föråldrat eller för borttagning schemalagt plattforms-API. De fem valdialogerna använder en liten <c1/> med en rullgardinsmeny i stället för den föråldrade <c2/>; enfilsväljare använder konstruktorn med <c3/> i stället för den föråldrade <c4/>; animeringen öppnas med <c5/> i stället för <c6/>, som plattformen { "2026.3" } schemalägger för borttagning. Since-build förblir { "243" }. IntelliJ Plugin Verifier rapporterar Compatible utan föråldrad eller för borttagning schemalagd användning mot { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) och { "2026.3" } EAP (IU-263.6259.32); <c7/> kontrollerar { "2024.3" } som standard och varje lista som anges i <c8/>.

seg-58ee61cbd633 = <c1/> och <c2/> returnerar <c3/>: en ogiltig sektion <c4/> är ett fel vid direktanrop, som den redan var via <c5/>, i stället för en tyst reserv till den platta masken. <b>Brytande ändring</b> för Rust-anropare av dessa två funktioner.

seg-9b4113258e1e = <b>Kampanjpoängsättare: en verklig falsklåsning i spåraren räknades aldrig</b> (<c1/>). Spårarens falsklåskontroll flyttar en kanal från LOCKED till LOST när den slår till. Poängsättaren markerade kanalens nästa uppdatering i stället, som då var olåst och därför aldrig räknades. En händelse <c2/> rapporterad från LOCKED är nu en episod vid sin tid, i körningen och i varje angiven händelse som innehåller den. En som hittas under inlåsning (pull-in), eller upprepas av en kanal som redan är LOST, är inte en ny episod. Ett nytt test driver en verklig falsklåsning: en legitim GPS L1 C/A-bärvåg som stegas med 1/(2T) medan den är låst (<c3/>).

seg-ac508954b6a6 = I referenskampanjen i <c1/> ändras endast PRN { "11" } för ramp/agc-3bit (falsklåsepisoder { "0" } → { "1" }, { "426" } och { "437" } per låst timme).

seg-cfc47d9d9237 = Dess cell-DIGEST:er fastlåses på nytt.

seg-fcfa0de18b05 = Den förhandsregistrerade fastlåsningen av poängsatta resultat är fortfarande aktiv och återskapar fortfarande exakt: i dess hash mappas endast de sex fälten, ändrade av denna korrigering gjord efter registreringen, tillbaka till sina värden före korrigeringen. De korrigerade värdena är fastlåsta för sig.

seg-b96d34bb1d36 = Ingen tröskel ändrades, och ingen VALIDATED rad, siffra eller webbtal flyttades.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: en fyr utan observation rapporteras nu</b> (hittat av MR-05). Rapporten får <c1/> och <c2/> endast när någon fyr saknar observation, och då kommer de observerade fyrarnas sigman från deras egen information i stället för att alla vara null. Datumet är oförändrat, och inget standardvärde, medföljande eller publicerat utdata flyttas (<c3/>).

seg-c223c1fc1323 = <b>Månens principalaxelsystem</b> (<c1/>, använt av <c2/> och LRO-anpassningen): DE421-offseten mellan medeljordsaxel och principalaxel i <c3/> tillämpades i fel riktning och med fel Eulerordning, så det analytiska PA-systemet låg cirka { "208" }″ från PA i stället för på det. Den är nu transkriberad som SPICE:s Frames Required Reading definierar den och stämmer med SPICE <c4/> till { "2.6e-16" } rad; det analytiska PA-systemet ligger { "6" }″ till { "8" }″ från DE440 PA (förhandsregistrerad e1ead19b, omregistrerad be33382e efter att den första föreslagna ändringen missade tröskeln { "1e-12" }; <c5/>). Publicerade tal som flyttas: LRO-anpassningen (<c6/>) rå överlappning { "53.8" } → { "39.9" } m, dynamisk { "12.6" } → { "12.05" } m, reducerat dynamisk { "6.65" } → { "6.67" } m (trösklar oförändrade). Den analytiska stacken stämmer nu med ANISE-korsvalideringen på DE-nivå ({ "12.0" } / { "6.67" } m) på båda nivåerna; det tidigare gapet på den dynamiska nivån var detta fel.

seg-ef2b49d4ad48 = <b>MCP-servern avvisar <c1/></b> (uppföljning av CAP-06b). Terrängbrickans sökväg för jamming-typen finns nu i <c2/>. En inline-yta avvisar ett scenario som namnger en, med ett meddelande som varken innehåller sökvägen eller något operativsystemfel. Testet för filkällsvakten flaggar nu också fält som slutar på <c3/>.

seg-ef005d2e3d42 = <c1/> med en bråkdelad dagsdel tappade bråkdelen i konverteringarna för UTC, TAI, UT1 och jordrotation (en timmes dagsdel gav jordrotationen { "15" }° fel); dagsdelen normaliseras nu till ett heltal. Ingen motoranropare påverkades: alla skickar ett heltalsdygn, och varje levererat utdata är bitidentiskt.

seg-144d90307ec6 = Planerat

seg-7ef4cd25cb87 = Geometrin från en angiven skyline ({ "0.36" } punkt { "1" }, nu i motorn som <c1/>): <c2/> och <c3/> från skylinen där indata anger en (azimutglappet som reserv), en händelse för naturlig försämring (fjord eller terminal) i <c4/>, och utformningsanteckningens två maskerade geometrier i raden sigma_UERE x DOP, förhandsregistrerade som tillägg.

seg-49481d2fdf31 = Geometri för RINEX-loggar med navigation (från motorns egen positionsbestämning) och Android-loggar (från raderna <c1/>); båda läser <c2/> i dag. Geometri i <c3/> (version { "1" } oförändrad i { "0.36" }) och integrationerna med Signal K och OpenCPN.

seg-57df1332ff87 = Ett tidigare gap, inte infört i { "0.36" }: när varje satellits SNR-fält är tomt utlöses varken något avdrag för <c1/> eller för C/N0; total signalförlust syns endast genom geometrimonitorns <c2/> (klassad <c3/>). Ett avdrag för den är planerat.

seg-a5a7a10ee11c = En ström i schema { "1.3" } i de externa telemetrireferenserna (Prometheus textformatsparser och OTLP-collectorn), som i dag endast täcker strömmar i { "1.2" }.

seg-caa1977b5b5e = En tvåsidig obstruktion (en kanjon eller smal fjord) läses som signalförlust snarare än blockerad himmel tills skylinen är integrerad.

seg-4bd0f178ca4e = Ett stycke som namnger AI-klienter från tredje part utelämnas här; det finns i <a1>CHANGELOG.md</a1> på GitHub.

seg-b2689beaba9e = Verifierare för Galileo OSNMA

seg-d16c9b4bf537 = <b>Ny modul <c1/> och <c2/>: en öppen, rent Rust-baserad verifierare på mottagarsidan för Galileo OSNMA.</b> Den läser I/NAV-sidor och rapporterar, per satellit och epok, om navigationsdata är autentiserade, med ett skäl för varje fel eller fördröjning: tolkning av HKROOT och MACK, återmontering av DSM-KROOT och DSM-PKR, Merkle-verifiering av den publika nyckeln, verifiering av TESLA-nyckelkedjan, MACSEQ- och taggverifiering för ADKD { "0" }, { "4" } och { "12" } inklusive korsautentisering, och ett resultat i formen <c3/> för mottagarförtroendemonitorn. Utdata bär ett rådgivande meddelande om att statusen inte är en tjänst för navigeringsintegritet. <c4/> anger vad som verifieras och inte verifieras, tidskravet, och att Kshana inte beviljar några rättigheter under EU:s IPR för OSNMA-ICD (användare förlitar sig på ICD:ns Annex E-auktorisation). Implementerad mot SIS ICD Issue { "1.1" } och Receiver Guidelines Issue { "1.3" }. Sidor CRC-kontrolleras, och en byteström från u-blox UBX-RXM-SFRBX kan läsas direkt (<c5/>). Standardtester använder syntetiska data och publicerade kända-svar-test för primitiver; ett valfritt test läser en lokalt nedladdad kopia av de officiella vektorerna. Efter oberoende granskning hämtar verifieraren sin tid endast från verifierade TESLA-nycklar (en spoofad sub-frame långt i framtiden kan inte längre radera ett fel), låter en autentisering löpa ut och följa den IODnav som används, respekterar verifierade larmmeddelanden (vars Merkle-löv nu inkluderar det slumpmässiga NPK-fältet) och NMA-status "don't use", håller dummytaggar utanför satellitstatus, behåller kedjor per CID med återkallelse och förnyelse, kontrollerar KROOT-paddingens hash, och begränsar UBX-ramlängder och TESLA-verifieringsarbete. En satellit läses som autentiserad endast så länge de nyaste efemerid- och klockdata den sänder är, bit för bit, de data som autentiserades (inte bara under samma IODnav), en status eller återkallelse från den oautentiserade NMA-rubriken räknas endast när två satelliter är överens eller en verifierad KROOT bär den, en återspelad äldre KROOT kan inte ersätta en kedja, och en avstannad nyckelström rapporteras.

seg-3e7df5c888ca = Tillagt (MCP-serverkanaler)

seg-4e70d8b85211 = <b><c1/>, streamable HTTP, självhostad.</b> Loopback som standard; en adress som inte är loopback kräver <c2/> och en bearer-token i <c3/>; inget verktyg läser eller skriver en sökväg (IQ-filverktygen är avstängda); gränser för förfrågans storlek, tid och samtidighet; ingen CORS-header; kontroller av Host och Origin. Kshana tillhandahåller ingen slutpunkt (<c4/>, med mallar för Docker, Fly.io och Cloud Run).

seg-c392cde151c9 = Tillagt (ytor)

seg-19ab5c068b6e = <b><c1/> på Python och WebAssembly.</b> Verifieraren bakom <c2/> på bytes i minnet, som returnerar den JSON som <c3/> skriver ut (rådgivande i sitt fält <c4/>; endast autentiseringsstatus, inte en tjänst för navigeringsintegritet). Samma avvisningar som kommandoraden. Inte på MCP: indata är en lång rå mottagarström som betjänas bättre av CLI och Python. <c5/> och <c6/> säger detta.

seg-6128929994b4 = <b><c1/> på WebAssembly, Python och MCP, med ett plugin-kommando och en JetBrains-åtgärd.</b> Renderar en förtroendeström eller ett resultat från <c2/> som Prometheus-text, syslog-rader i CEF eller LEEF eller en OTLP JSON-nyttolast, med de kodare som <c3/> använder (<c4/>); ingen socket och ingen klocka. Plugin: <c5/> och skillen <c6/>. JetBrains: Render Trust Telemetry. Funktionerna <c7/> och <c8/> och MCP-servern aktiverar nu också <c9/>, som inte lägger till någon crate.

seg-83d01411c6d4 = <b>Paritetssvep.</b> JetBrains-åtgärder Validate Scenario, List Scenario Kinds och Assess Receiver Stream; <c1/> listar nu <c2/>, <c3/>, <c4/> och <c5/>; notebooken <c6/> (compliance mapping och test-bench-export); och varje återstående JetBrains-cell "CLI only" i <c7/> är nu ett explicit N/A med sitt skäl.

seg-062ef0cf7ee7 = Tillagt (bevispaket)

seg-9889575c2df1 = <b><c1/> och <c2/>: signerade, verifierbara bevispaket för en GNSS-förtroendehändelse.</b> Ett paket samlar det råa loggutsnittet och hela loggens SHA-256, konfigurationen med varje tröskel, resultaten och skälen per epok, motorversionen, ett hashkedjat manifest och en fristående HTML-sammanfattning, signerat med Ed25519 (en nyckel från <c3/> eller din egen fil; nycklar lagras aldrig i ett paket och <c4/> är git-ignorerat). <c5/> kontrollerar varje hash, kedjan och signaturen och namnger exakt vad som misslyckas; med <c6/> fastlåser den signeraren. En token enligt RFC { "3161" } kan bifogas och läses och binds till manifestet (utfärdarens egen signatur kontrolleras inte av detta bygge; <c7/> täcker det). Loggutsnittet är fönstrets exakta bytes där läsaren rapporterar källintervall (NMEA, UBX, RINEX { "3" }, Android), annars hela loggen, och manifestet anger vilket. Skapande och verifiering är rena publika funktioner (<c8/>) som byggs för <c9/>. Paketen anger att de är en teknisk dokumentation, inte ett juridiskt utlåtande. De nya beroendena är trädet <c10/> (BSD-3-Clause och Apache-2.0/MIT, minimala funktioner) och en direkt <c11/> (redan i det trädet) för att radera nyckelmaterial. Se <c12/>.

seg-280fd37126c1 = Tillagt (förtroendetelemetri)

seg-ebd269c618b0 = <b><c1/>: GNSS-förtroende som säkerhetstelemetrikälla.</b> Läser den ström av förtroende per epok (JSON-rader: poäng 0-100, band, skäl) eller ett batchresultat från <c2/> och matar en Prometheus-slutpunkt <c3/> (localhost som standard), syslog-händelser i CEF eller LEEF i ett kuvert enligt RFC { "5424" } (UDP eller TCP), och, bakom den som standard avstängda funktionen <c4/>, OTLP/HTTP JSON-export. Leverans körs på arbetartrådar med tidsgränser för anslutning och skrivning, begränsad återanslutningsbackoff och en räknare <c5/>, så att en död eller stillastående insamlare inte kan stoppa den levande bedömningen eller frysa <c6/>; skäletiketter begränsas till { "64" } serier. Inga nya beroenden. En exempelinstrumentpanel för Grafana finns i <c7/>. Måttnamn, etiketter och CEF/LEEF-fältmappningen finns i <c8/>. Strömformatet är isolerat i <c9/>.

seg-fa5e803edb44 = Maritimt förtroende: en levande förtroendepoäng 0-100 för ett rörligt fartygs positionsbestämning, från den NMEA { "0183" } som mottagaren redan ger ut, med en valfri grind.

seg-c5b3fcb9bba8 = <c1/> tar en tabell <c2/> (<c3/> eller <c4/>, fartygets maximala fart, acceleration och svängtakt, antennhöjd över vattenlinjen och en valfri kursgivare; varje standardvärde dokumenterat med sitt skäl). För ett fartyg ersätts monitorn för statiskt positionshopp, som mäter avstånd från kalibreringsmedelvärdet och är fel på ett fartyg i fart, av kausala monitorer för rörliga plattformar: kinematisk konsistens hos positionen mot rapporterad fart och kurs och mot fartygets gränser, gyrokurs mot kurs över grund, loggfart mot fart över grund, antennhöjd mot angiven höjd över vattenlinjen, C/N0-spridning som kollapsar och stiger tillsammans mot kalibreringens baslinje, och tidskonsistens (även mot den här datorns klocka, i live-läge). Den läser också en rapporterad autentiseringsstatus, övergripande eller per satellit (endast en rapporterad status: ingen OSNMA-kryptografi). Varje tröskel anges i en tabell <c5/> före körningen. Varje epok får sedan en poäng från { "0" } till { "100" } genom en deterministisk, förhandsregistrerad avbildning (ingen inlärning, inget anpassat till händelser; vikter, bandkanter och evidensen anges i en tabell <c6/>), avbildad på de befintliga förtroendetillstånden, med de monitorer som drog av och deras poäng. Statiska scenarier är oförändrade och hashas som förut. <c7/> läser stdin, en fil som läggs till, TCP eller UDP och skriver en JSON-rad per epok och en proprietär sats <c8/>; med <c9/> släpper den igenom strömmen oförändrad medan positionsbestämningen är betrodd och markerar positionsbestämningen som ogiltig (GGA-kvalitet { "0" }, RMC- och GLL-status <c10/>, GNS- och VTG-läge <c11/>) medan den inte är det. Grinden är av om den inte begärs; <c12/> serverar den grindade strömmen till valfritt antal TCP-klienter (loopback som standard, en långsam klient kastas ut i stället för att blockera de andra). Detta är rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }); operatören är fortsatt ansvarig. <c13/> är en syntetisk logg från Tallinn till Helsingfors, skriven endast som text, med ett bortdrag av positionen en bit in under vilket mottagaren fortsätter rapportera en giltig positionsbestämning; dess förväntade utdata är fastlåst av ett test. Handledning: <c14/>. Kontrollerna kan inte se en spoofer vars positionsbestämning är konsistent med allt på bussen; handledningen säger detta.

seg-80f3f0aae42c = Störningskarta

seg-8539a42718cb = <b><c1/> och <c2/>: en offentlig bild av var flygplan och fartyg rapporterade försämrade navigationsdata, och hur mycket av en rutt den berör.</b> Indata är lokala CSV-filer gjorda av data med öppen licens från ADS-B (adsb.lol, ODbL { "1.0" }) och AIS (NOAA MarineCadastre, Kystverket under NLOD { "2.0" }); varje utdatafil är en källa och ett UTC-dygn av GeoJSON som bär metoden, dess trösklar, datalicensen, attributionen och källans täckningsbias. ADS-B-metoden aggregerar NIC och NACp på ett fast rutnät och kallar en cell försämrad utifrån andelen distinkta flygplan, med skydd för utrustning som aldrig rapporterar noggrannhet, låg höjd och orsaker över stora områden. AIS-metoden kör fem detektorer: positioner på land (mot en användartillhandahållen kustlinje), cirkulära spår, orimliga hopp, orimliga hastigheter och många fartyg på en position. Trösklar är förhandsregistrerade konstanter för en namngiven metodversion. Endast aggregat: identifierare hashas i minnet och skrivs aldrig, och celler med färre än { "5" } distinkta flygplan eller fartyg publiceras inte. En försämrad cell är inte ett fynd av störning. Standardkommandona använder inget nätverk; en valfri hjälpare <c3/> laddar ned Natural Earth-landpolygoner från en commit-fastlåst adress och behåller filen bara om dess SHA-256 stämmer. ADS-B-indata är en CSV eller adsb.lol:s readsb-historikfiler direkt (nytt beroende: <c4/> med dess rena Rust-backend, för gzip). Båda metoderna är version { "2" }: ett anrop om försämrad eller onormal kräver minst { "5" } flygplan eller fartyg (publiceringsminimum), varje antal per cell under { "5" } undanhålls som <c5/>, och ett dygn vars bakgrund inte kan skattas undanhåller sina anrop. Utdatafiler namnges <c6/> och skrivs aldrig över; indata strömmas rad för rad; ruttexponering hanterar antimeridianen. Tester använder endast syntetiska data. Se <c7/> och licensgranskningen i <c8/>.

seg-7a54dfab93dc = Tillagt (träningsströmmar)

seg-0b01d1d871e2 = <b><c1/>: syntetisk brygga med NMEA { "0183" } för besättningsträning i att känna igen GNSS-jamming och spoofing.</b> Från en scenario-TOML skriver den en fil eller strömmar över TCP eller UDP (unicast eller broadcast; i realtid, accelererat eller så fort som möjligt) hela bryggsatsen GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT och VBW för ett fartygsspår med gränser för girhastighet, acceleration och havsström, med satellitgeometri från motorns egna nominella konstellationer. Skriptade händelser på en tidslinje: jamming, positionsdrift (en giltig positionsbestämning som driver iväg), tids-spoofing och en replay-fördröjning, var och en med ramper för inträde och återhämtning. En instruktörslogg (JSON och text) registrerar vad som injicerades när, med det sanna spåret mot det rapporterade. Ett bibliotek i <c2/> (jamming på öppet hav, drift vid kusten, tids-spoofing vid hamninlöp, kombinerat) innehåller instruktörsanteckningar. Utdata har giltiga kontrollsummor och är deterministiska per frö; tester låser ett golden-utdrag per scenario och läser varje mening med NMEA-läsaren i <c3/>. Endast text: ingen RF-, IQ- eller vågformsutdata; strömmar är till för träning och test och får aldrig matas in i ett fartygs levande navigationssystem. Se <c4/>.

seg-bb8d508c92fa = Marina integrationer ({ "0.35.0" }, arbetsström B)

seg-538cdf145ac1 = <b>Signal K-plugin</b> (<c1/>, inte publicerat på npm): kör eller ansluter till <c2/> (serverns egen NMEA-ingång, egna ingångsargument, ett JSON-lines-TCP-flöde eller <c3/>-meningarna i en gate-ström), publicerar förtroendepoäng, band, skäl, larm och gate-tillstånd under <c4/> (inklusive den av mottagaren rapporterade positionen som kontext, aldrig <c5/>), och skickar en Signal K-notis (<c6/> vid degraded, <c7/> vid untrusted, med tröskelvärden för hold, clear och inaktualitet, alla i konfigurationsschemat). Inga npm-beroenden. Testat på inspelad syntetisk utdata.

seg-b6eb7110291e = <b>OpenCPN</b>: NMEA i gate-läge serveras direkt av <c1/> (rekommenderas); ett beroendefritt TCP-relä (<c2/>) är det valfria alternativet. Oavsett väg ser OpenCPN en ogiltig positionsbestämning när förtroendet kollapsar och <c3/> i sitt NMEA-felsökningsfönster; tester spelar upp den syntetiska gate-strömmen genom en riktig TCP-socket och kontrollerar vad en konsument tar emot. Ett inbyggt plugin med poängpanel (<c4/>, plugin-API { "1.18" }, CMake) läser <c5/> från OpenCPN:s egen NMEA-ström och larmar vid bandet untrusted; det byggs, dess logik är enhetstestad och det kördes inuti OpenCPN { "5.8.4" } under en virtuell skärm (evidens och ett reproduktionsskript i <c6/>); det är inte paketerat för plugin-hanteraren.

seg-bb26e8c1aff0 = <b>Referensbygge</b> (<c1/>): generisk delslista, OS-konfiguration, systemd-enheter för den rådgivande övervakaren och det valfria gate-läget (kontrollerade med <c2/> av <c3/>), ett containeralternativ, Signal K-koppling.

seg-6695d4c1f13b = Signal K-pluginet accepterar det levande JSON-schemat { "1.2" } (en nyckel <c1/> och därefter en nyckel <c2/> läggs till; okända tillagda nycklar ignoreras), kontrollerat på verklig utdata av version { "1.2" } och mot en riktig signalk-server.

seg-622c2d3dd8fa = Fixar efter granskning: systemd-enheterna startar alltid om och körs i sandlåda (inget skal, inget nätverk där det inte behövs), ett logrotate-utdrag, <c1/> misslyckas vid varje fynd; containern kör gaten från miljövariabler med en hälsokontroll och digest-fästa basavbildningar; Signal K-poängmetadata, den inaktuella notisen ersätts när data återkommer, fel i barnprocesser bevaras och avslut eskalerar, osäkra <c2/> vägras, och notisen ligger på <c3/>; reläet begränsar en kvarhållen ofullständig rad; parsrarna för <c4/> avvisar poäng utanför { "0" } till { "100" }; en kontroll av dokumentationslänkar; ett CI-arbetsflöde (<c5/>) som kör allt detta, inklusive den riktiga binären från början till slut.

seg-7c615a62ca26 = <c1/>. Rådgivande programvara, inte typgodkänd utrustning; operatören är fortsatt ansvarig. Endast programvara: inget sänder, och inga detekterings- eller falsklarmssiffror hävdas.

seg-72cb9f45ce99 = Tillagt: compliance-mappning och export för test-bench

seg-15aae04a9490 = <b><c1/> och <c2/>.</b> En mappning från Kshanas utdata till fem ramverk och standarder för resiliens (US DHS Resilient PNT Conformance Framework v2.0, IMO-vägledning för fartyg, EASA-vägledning för luftfart, NIS2 artikel { "21" }, EN { "16803" }, en betald standard som citeras per del och med de få klausulnummer som syns i katalogtexten), en tabell per ramverk: referensen, vad den kräver i vår parafras, de utdata som ger belägg för den, och luckan. Källversioner, URL:er och vad som lästes och inte lästes antecknas. <c3/> fyller mappningen från de angivna körningarna och markerar varje rad <c4/>, <c5/>, <c6/> eller <c7/>, som Markdown och JSON, med luckan kvar på varje rad. Formuleringen är "ger belägg för"; ingenting betygsätts eller godkänns. Tester använder syntetiska körningar och misslyckas när en incheckad tabell avviker från koden.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Skriver fordonsrörelsen och händelserna för ett scenario av typen <c2/>, <c3/> eller <c4/> för en GNSS-simulator i laboratorium: en CSV med användarrörelse med dokumenterade referenssystem och en metadata-sidfil, NMEA { "0183" } <c5/>/<c6/>, waypoint-text, och händelserna som CSV och som <c7/> <c8/>-block (<c9/>). Endast rörelse och händelser: ingen signal skrivs. Varje fil läses tillbaka i <c10/> och jämförs inom sin angivna tolerans. <a1><c11/></a1> beskriver metoden för att spela upp exporten genom en simulator och poängsätta mottagarens logg med <c12/>.

seg-fc0fe915ed3d = <b>Vad som räknas som evidens.</b> Ett resultat räknas för en förmåga endast när det bär de fält som dess typ skriver; enbart en typetikett räknas som ingenting. Okända typer, ett resultat som motsäger sitt syskonscenario, icke-hex-hashar och felaktiga antal för receiver-trust listas som oanvända, med skälet. Rapporten maskerar Markdown-celler och kan inte krascha på en icke-ASCII-hash. <c1/> och <c2/> tar texter, inte sökvägar.

seg-6b46de1164d8 = Export för test-bench.

seg-c48a4dd4134b = <c1/> intervallkontrolleras (<c2/>); waypoint-filen kontrollerar varje intervall och kommandot anger varför när ett utelämnas; dokumentationen anger att rubriken (heading) i <c3/> är kroppens girvinkel och inte kursen, platshållarfälten i <c4/> och scenariots egen höjdändring. <c5/> och <c6/> finns i användningstexten.

seg-eb2e415ec540 = <c1/> exponerar den sanna tillståndshistoriken för körprofilen i <c2/> (samma stegning som typens egen referens använder), och <c3/> får fält för NMEA-datum och -tid.

seg-fbfc1a59e99b = Validering av störningskartan

seg-a68d88381eea = <b>Störningskartans avkodningssemantik och geometri kontrolleras mot oberoende implementationer på syntetiska indata.</b> Betydelserna hos NIC- och NACp-koder mot pyModeS-avkodning av syntetiska ADS-B-ramar, AIS-värdena för ej tillgänglig mot pyais-avkodning av syntetiska AIVDM-meningar, tilldelning av rutceller mot shapely, ruttlängd per cellstatus mot shapely och GeographicLib, och maskning av inlandet mot shapely och pyproj, var och en med en tolerans som fastställdes före den första jämförelsen (<c1/>). Detta validerar hur koder och fältvärden läses och geometrin, inte att en flaggad cell är störning. Läsaren av landpolygoner sluter nu en ring som inte upprepar sin första hörnpunkt, vilken den tidigare läste utan sin sista kant. Dokumentationen anger tröskelvärdena för låg noggrannhet hos NACp och NIC som den gräns varje kod står för (NACp { "6" } är en EPU-gräns på { "556" } m, NIC { "5" } en inneslutningsgräns på { "1" } NM).

seg-cf4ffdbba1a6 = Tillagt (validering av telemetriformaten och bevispaketen)

seg-ad6730e0e891 = <b>Externa kontroller av bevispaketens kryptografi, paketverifieraren och telemetrins trådformat.</b> Testvektorerna för Ed25519 i RFC { "8032" } avsnitt { "7.1" } ({ "1" }, { "2" }, { "3" } och { "1024" }) och SHA-256-exemplen i FIPS 180-4 körs genom paketets egna funktioner för signering, verifiering och hashning, till exakt likhet. En verifierare skriven i Python enbart utifrån det normativa avsnittet i <c1/> (hashlib och <c2/>) stämmer med Rust-verifieraren på { "71" } intakta och manipulerade paket: utfall, felmängd, signaturutfall och båda kedjehuvudena. Vår Prometheus-exposition läses av den officiella Python-klientens parser och vår OTLP JSON av det officiella meddelandet <c3/>, strikt, och båda stämmer med det tillstånd de skapades från. CEF och LEEF saknar oberoende öppen validerare och förblir modelled. <c4/> fick det normativa paketformatet och verifieringsförfarandet som verifieraren i ren miljö (clean-room) skrevs utifrån; <c5/> fick <c6/>. Oberoende referenser och fixturer: <c7/>, <c8/> med <c9/>, <c10/>; tester <c11/>, <c12/> och <c13/>. CI behöver ingen Python.

seg-20d1b02bfda4 = Tillagt (validering av CEF-händelserna)

seg-8c464e43e43d = Telemetrins CEF-händelser läses tillbaka korrekt av två oberoende parsrar med öppen källkod.

seg-a6321d13b0ab = <c1/> { "1.11" } och Logstash CEF-kodeken (<c2/> { "6.2.7" } i Logstash { "8.15.3" }) tolkar { "157" } CEF-rader (varje bandändring och varje epok i den incheckade telemetriströmmen, plus motstridig text som innehåller <c3/>, omvända snedstreck, rörtecken, radbrytningar, tabbar och text med flera byte) och återskapar varje huvudfält, allvarlighetsgraden, den exakta uppsättningen tilläggsnycklar och varje värde exakt. Logstash-kodeken läser också fyra rader vars huvudtext behöver escape-tecken, vilket <c4/> inte klarar. Tröskeln (fastställd i förväg) registrerades innan någon av parsrarna kördes (<c5/>); fixturer i <c6/>, skript för de oberoende referenserna <c7/> och <c8/>; CI behöver varken Python eller Logstash. LEEF har ingen underhållen öppen parser och förblir modelled. CEF-händelserna bär nu förtroendepoängen och epokförskjutningen i CEF-ordlistans flyttalsfält för egna värden (<c9/>, <c10/>) i stället för heltalsfälten <c11/> och <c12/>, som passade för inget av värdena; CEF är nytt i den här utgåvan, så inget som levererats ändras.

seg-65b362fa8711 = MCP: <c1/> accepterar loggen som <c2/> eller <c3/>; verktygsindata begränsas till { "4" } MiB.

seg-8999974aa1fa = Jamming-diagrammet hämtar också sina färger från paletten.

seg-8c8ff384dbf6 = <c1/> var den enda modul som revisionen av Observatory-paletten lämnade kvar med egna färger medan arbetet med jammer-Q landade; dess <c2/> (scenarierna <c3/>, <c4/> och andra scenarier av typen <c5/>) läser nu <c6/>, och tillåtelselistan i <c7/> är tom. Endast färger och typsnitt: diagrammen <c8/> och <c9/> är lika med sina tidigare registrerade renderingar när färg, <c10/> och versionsfoten har normaliserats. Inget ritat värde ändrades. De inspelade Studio-kopiorna under <c11/> spelades in på nytt vid omportningarna { "0.33.0" } och { "0.34.0" } (endast versionsstämpel): de bär fortfarande jamming-diagrammets gamla färg och får palettfärgen vid nästa omportning.

seg-a059d10c5330 = <b>Klockensemblens 3-sigma-gräns täcker nu flicker-golvet, och filterhälsokontrollen ser det.</b> Med ett <c1/> bar referensklockan flicker FM men filtret med två tillstånd som levererar integritetsgränsen gjorde det inte, så det levererade scenariot <c2/> hade 3-sigma-täckning på { "0.41" } (klassisk) och { "0.33" } (kvant), och NIS/NEES-kontrollen, som drog sin egen referens från filtrets modell, rapporterade identiska värden med och utan golvet. Gränsen är nu variansen för de två tillstånden plus den exakta variansen hos flicker-fasen ackumulerad sedan senaste synkronisering, beräknad från samma bank som referensklockan använder; NIS/NEES-kontrollen drar sin referens från den utökade modellen med den banken och kör det matchade utökade filtret (och filtret med två tillstånd mot flicker-referens rapporterar <c3/>). Utdataändring, endast för klockor med ett <c4/> skilt från noll: <c5/> på <c6/> går från { "0.40866" } / { "0.33026" } till { "0.99970" } / { "1.0" } (klassisk / kvant) och NIS/NEES för <c7/> inkluderar nu flickern; tidsfelet, <c8/> och <c9/> är oförändrade, och scenarier utan golv är byte-identiska. <c10/> (typ orbit, frö { "7" }, golv { "1e-16" } / { "2e-11" }) flyttas också: <c11/> klassisk { "0.7734" } till { "1.0" } och kvant { "0.9796" } till { "1.0" }, och NIS/NEES för <c12/> och deras band ändras. Dess <c13/> för kvant växlar från <c14/> till <c15/>: en stickprovshändelse i flicker-ensemblen om 16 frön gånger 60 steg (NIS { "0.8815" } mot ett band på [{ "0.9125" }, { "1.0914" }]), inte en defekt. Bandet är ett band på { "95" } %, så ungefär { "5" } % av fröna flaggar ett matchat filter per konstruktion ({ "40" } nya frön för det här scenariot: kvant { "1" } och klassisk { "2" } flaggade); vid { "64" } gånger { "200" } ligger samma frö inom bandet för båda klockorna (NIS { "0.990" } och { "1.001" }). Känd uppföljning: fusion-typen har samma lucka (klassisk integritet { "0.80" } med golv); hybrid-typen stannar över { "0.99" }.

seg-c7308350b6d4 = <b>Indata till MCP-servern härdade.</b> MCP-serverns scenarioverktyg accepterar nu endast infogat innehåll och vägrar fält för filkälla; indatastorleken begränsas. Säkerhetsmeddelande: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Lab replay: en spårningsmotor, detekteringsmonitorer och en kampanjkörare för GNSS-IQ-inspelningar, med slingutformningarna, C/N0-estimatorerna och poängsättningen som hör till. Evidensklass: allt nedan är <b>MODELLED</b> eller kontrollerat för intern konsistens mot slutna uttryck och simulering med fast frö; inget av det lägger till en VALIDATED-rad, och verifieringsregistret är oförändrat ({ "251" } rader: { "124" } Validated, { "123" } Modelled, { "4" } Partner). Det är ett analyslager i programvara: inget här syntetiserar en jammer- eller spoofer-vågform, och ingenting sänder.

seg-912ecb44cee4 = Lab replay: testvillkor, kampanjkörare och poängsättning ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> spelar upp inspelningar × front-end-kedjor × slingutformningar (<c2/>) och poängsätter varje cell mot en testvillkorsfil per inspelning (<c3/>, TOML eller JSON). Filen anger vad ett laboratorium vet om inspelningen: de förväntade satelliterna, och för varje händelse dess typetikett, start och slut, påverkade satelliter och angiven J/S- eller jammereffektprofil. Den är enbart metadata. Poängen per satellit, för hela körningen och per händelse, är:

seg-180447aaf31e = tillgänglighet, tid till förlorat lås och angiven J/S vid förlusten;

seg-1ababddb0d87 = tid för återinfångning, från händelsens slut och från förlusten;

seg-a6468323c971 = uppmätt C/N0-försämring per angivet J/S-intervall;

seg-4cb6f510e159 = falsklåsningsepisoder per låst timme (spårarens flagga, eller Doppler mot en referenssidofil);

seg-97c6243bac2e = PLL- och DLL-diskriminatorjitter.

seg-014b28f61db8 = Bredvid varje uppmätt försämringskurva ritas en analytisk referens för spektral separation (<c1/> med typens <c2/>), betecknad MODELLED var den än förekommer.

seg-eb5c38197dab = Celler körs parallellt genom spårningssessionens tillståndsmaskin för lås, och varje cell skrivs atomärt under en nyckel av innehållshash. Nyckeln omfattar inspelningens SHA-256, hasharna för villkor, front-end, utformning, körning och poängsättning, den obligatoriska <c1/> (<c2/> | <c3/>) och motorversionen. Med <c4/> satt behålls också varje cells ström <c5/> och låshändelser, namngivna efter cellnyckel och hashade in i cellen. <c6/> och <c7/> är publika, så en konsument kan härleda varje nyckel och sammandraget på nytt. En omkörning hoppar därför över färdiga celler, och utdata beror aldrig på antalet arbetare. Körningen skriver <c8/>/<c9/>, en fristående <c10/> och ett <c11/>. Trösklarna för pass/fail (<c12/>, kan åsidosättas per inspelning) tillämpas när rapporten byggs.

seg-beec1c1264c9 = <c1/> (standard <c2/>, del av poängsättningens hash) väljer den C/N0 som ligger bakom den rapporterade C/N0 och försämringskurvan. Båda skattningarna poängsätts och rapporteras alltid (median för hela körningen och för baslinjen, och per J/S-intervall), och cellen och poängkortet registrerar estimatorn. NWPR läser ungefär { "8" } dB × Bn·T lågt under slingans egen jitter; M2M4 gör det inte.

seg-baf1a2422a66 = Också nytt:

seg-f36e22ff54c3 = <c1/> bygger om poängkorten, rapporten och sammandraget från cellerna;

seg-aad7fcc28bc8 = <c1/> kontrollerar en testvillkorsfil mot sitt schema;

seg-c3e5e4461aaa = <c1/> importerar annotationerna <c2/> i en SigMF-inspelning som händelser;

seg-c1a2ebb844c5 = Python får <c1/>, <c2/> och <c3/>;

seg-cd69258ccc09 = <c1/> får <c2/>, som är inkrementell och återupptagbar under provbudgeten per anrop med varje fil begränsad till arbetskatalogen, och <c3/>.

seg-c398b66a7058 = Tester: <c1/> kör en syntetisk kampanj med { "3" } inspelningar × { "2" } front-ends × { "2" } utformningar. Dess scener har angivna C/N0-profiler, och den täcker:

seg-3f2fbdecb101 = varje mått kontrollerat mot den injicerade referensen;

seg-e103a30260db = återupptagning efter en partiell körning med en arbetare och en korrupt cell, byte-identisk med en oavbruten körning med fyra arbetare;

seg-79164d8b0b22 = epokfiler per cell;

seg-9470016f056a = en regression för återinfångning av tre satelliter över { "20" } s: med <c1/> på är varje kanal tillbaka inom { "2" } s efter ett glapp på { "2" } s; utfallet med <c2/> av är låst;

seg-1deb4ab83054 = trösklar som bedöms om utan att köra om;

seg-351f9cdcbcd6 = CLI:t;

seg-2c35af369a36 = ignorerade kontroller av genomströmning och minne i release-läge, inklusive en inspelning på { "4" } GB ({ "5.45" }× realtid, toppminne { "2" } MB över start-RSS; mätningar på en maskin, inte trösklar).

seg-efbaf5a00ea2 = Endast programvara: inget sänder, och ingen störnings- eller spoofing-vågform syntetiseras. Anteckningar om utformning och som-byggt: <c1/>.

seg-c9871226c82f = Spårningsmotor för lab replay ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Filer för slingutformning</em>: <c1/> TOML (<c2/>; parser <c3/>). En eller flera namngivna utformningar anger varje slingfält:

seg-0437148324ca = bärvågstyp (PLL, FLL eller FLL-assisterad PLL), ordningar och bandbredder;

seg-4e722960f8c6 = diskriminatorer för PLL/FLL/DLL och bärvågsstöd;

seg-44976e3ad4e7 = korrelatoravstånd och integrering;

seg-5c06173036d6 = låströsklar och C/N0-fönster, och bitsynkronisering;

seg-405e693dd757 = tillståndsmaskinen för lås;

seg-e6908584e2f4 = infångningen vid överlämning (<c1/> eller uttrycklig).

seg-8844cc963705 = Utformningar kan utvidga varandra via <c1/>. Okända nycklar vägras. Varje löst utformning har en SHA-256-hash över en kanonisk JSON-form (nycklar sorterade på varje nivå, fast talformatering), så hashen beror inte på fältordning; varje utdata registrerar den. Gränssnitt:

seg-5c32182634f7 = <c1/>, där uttryckliga flaggor åsidosätter utformningen och registreras;

seg-9356751a6b98 = <c1/>, som kör varje utformning i filen;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, spårepokskolumnen <c2/> efter <c3/>; Python-epokordlistor). Skattningen med andra och fjärde momentet över samma fönster som NWPR, enbart från prompteffekt: NWPR läser lågt under slingans egen bärvågsjitter (ungefär { "8" } dB × Bn_PLL·T) och M2M4 gör det inte. På GPS L2C CM ({ "20" } ms, nominellt { "40" } dB-Hz, PLL { "1" } till { "10" } Hz) läser den { "39.93" } dB-Hz vid varje bandbredd medan NWPR faller från { "39.55" } till { "38.22" }; på L1 C/A vid { "45" } dB-Hz läser den { "45.34" }. NWPR och alla andra utdata är oförändrade (en bit-för-bit-låsning). Den binära posten förblir { "184" } bytes (värdet tar den reserverade flyttalsplatsen och flaggbit { "6" }).

seg-c02d07475717 = Extra korrelatorpunkter (multikorrelator / SQM).

seg-70fcdc903413 = <c1/> (förskjutningar i chips från prompt, positiva tidiga; högst { "16" }, var och en inom ±{ "2" }) korrelerar extra repliker vid sidan av E/P/L och returnerar dem som <c2/> (<c3/> i utformningsordning). Slingorna använder dem aldrig. Nyckeln utelämnas ur den kanoniska JSON-formen när den är tom, så standardutformningens hash och varje utdata utan punkter är oförändrade (<c4/> kvarstår; CSV/JSONL/binär utan punkter är bit-identiska). Med punkter: CSV-/JSONL-kolumner, och en binär post på <c5/> bytes vars huvud bär <c6/>, så att en gammal läsare vägrar filen i stället för att tolka fel. <c7/> (CLI), <c8/> (Python) och <c9/> (MCP <c10/>). Utformningarna i en körning måste vara överens om punkterna.

seg-66d494267598 = <em>Parallella kanaler</em> (<c1/> / <c2/>; Rust <c3/>). Varje delblocks kanaler körs på upp till N trådar (<c4/>; <c5/> förblir seriell). En kanals korrelation och tillståndsmaskin för lås rör bara den kanalen; dess epoker och händelser buffras och skrivs till utdatamottagarna i kanalordning, så utdata (CSV, JSONL, binär, händelser, sammanfattning) är byte-identisk med den seriella körningen för varje N. Standard förblir { "1" } tråd. Uppmätt på en inspelning med 12 kanaler, { "4" } s, { "4.092" } MHz på { "4" } kärnor: { "19.5" } s seriellt, { "11.5" } s med { "2" } trådar, { "6.3" } s med { "4" } ({ "3.1" }×; den initiala infångningen är seriell).

seg-cf59911d458f = <em>Export av infångningsyta</em> (<c1/>; <c2/>, <c3/>). <c4/> (en PRN; CSV, JSON eller binär), Python <c5/> och MCP <c6/> <c7/> skriver hela korrelationseffektytan över Doppler × kodfas som sökningen beräknar (dess celler är identiska bit för bit med dem från <c8/>) med toppen och två finförfiningar av Doppler: en parabolisk skattning och en finsökning på 1/16 intervall (≈{ "5" } Hz vid { "4" } ms koherent, mot intervall på { "167" } Hz). <c9/> självt och alla standardvärden är oförändrade.

seg-a01bf371cc4f = <em>Strömmande epokutdata</em> (<c1/>; <c2/>). Varje slinguppdatering bär:

seg-ff549f07ce78 = korrelatorerna tidig/prompt/sen;

seg-00457c1bb059 = alla tre diskriminatorutdata;

seg-b17d335f6cac = NCO-tillstånden för PLL/FLL/DLL och bärvågsfasen;

seg-a3bf3f1034cd = PLI- och låsflaggorna;

seg-7912a72da79b = båda C/N0-skattningarna och bitarna;

seg-8d105d656041 = låstillståndet.

seg-6af6331255fb = Den skrivs medan den sker, som CSV, JSON Lines eller en versionshanterad binär form med läsare i Rust (<c1/>) och Python (<c2/>).

seg-aa081bfd9878 = <c1/> får <c2/>, <c3/> och <c4/> (<c5/>), och <c6/> får <c7/> och <c8/>. MCP <c9/> får <c10/>/<c11/> och bygger sitt svar från sammanfattningen med begränsat minne.

seg-8cb2f8b27bad = En körnings heap växer inte längre med inspelningens längd: <c1/> mäter det med en räknande allokerare ({ "6" }× längden, samma topp inom { "64" } KiB), med en kontroll som visar att sökvägen i minnet växer.

seg-e3eff59db445 = Strömmande utdata är bit-identiska med uppspelningen i minnet.

seg-c602902313f8 = <em>Tillståndsmaskin för lås</em> (<c1/>, <c2/>): intagning → låst → förlorad → återinfångning → intagning, eller avförd när en förlust varar längre än <c3/> (standard { "30" } s). Misslyckade sökningar görs om med intervallet <c4/> ({ "0.1" } s), jämnt fördelade, så att omförsöksschemat lägger till högst { "0.1" } s till en uppmätt återinfångningstid. Ett valfritt ökande intervall (<c5/> över <c6/>) är avstängt som standard, och <c7/> är ett valfritt tak ({ "0" }, inget, som standard). Ett avbrott på { "2" } s på tre PRN vid { "4.092" } MS/s slutar nu med att varje kanal är återinfångad och låst. Under en budget på 3 försök var varje kanal avförd inom { "0.2" } s efter förlusten.

seg-56bc109dbef9 = Trösklar (<c1/>, <c2/>, Dopplerfönstret för återinfångning) kommer från utformningen. Varje övergång är en händelse med sitt skäl.

seg-b1c551e48389 = Falsklåsningskontrollen söker det spårade Dopplervärdet mot dess ±1/(2T) FLL/PLL-alias. Den fångar den falsklåsning som PR #38 mätte (−{ "2400" } Hz spårat { "500" } Hz fel). Med återinfångning på slutar kanalen låst vid det injicerade Dopplervärdet.

seg-39409dd0b4bc = Ett signalglapp på { "0.8" } s deklareras som förlorat och återinfångas inom { "0.3" } s efter att signalen återvänder.

seg-ce3162720ce5 = <c1/> (och tabellens kolumn) är tillståndet efter den sista övergången, så en kanal som avförts efter sin sista slinguppdatering läser <c2/>.

seg-520ab6d84a6c = <b>FLL-stöd endast under intagning</b> (<c1/>, standard; <c2/> behåller det tidigare beteendet bit för bit). FLL lämnar över till PLL när den utjämnade PLI har hållit sig vid eller över <c3/> ({ "0.8" }) i <c4/> ({ "0.1" } s), och återgår under <c5/> ({ "0.6" }). Lämnad på bröt FLL-vägen på { "10" } Hz faslåsningen under ungefär { "38" } dB-Hz på rena signaler: vid { "35" } dB-Hz var andelen faslåsning { "10" }–{ "16" } %, med ett verkligt fasfel på { "38" }–{ "41" }°. Med grind håller standardutformningen { "100" } % vid { "35" } dB-Hz med { "4.5" }°, samma som en PLL ensam. Intagning från ett överlämningsfel på { "100" } Hz är oförändrad. Evidens med trösklar fastställda i förväg: <c6/>. <b>Standardslingorna är därför inte bit för bit lika tidigare körningar av standardutformningen.</b> Använd <c7/> för att återskapa dem. Känd gräns: vid { "35" } dB-Hz sker överlämningen { "1.9" }–{ "2.6" } s in i spåret, och vid { "33" } dB-Hz håller FLL på { "10" } Hz kvar PLI under överlämningströskeln, så intagningen slutförs aldrig.

seg-1a911b958f8e = Nya nycklar för slingutformning och nytt API, uppräknade:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, där <c5/> ändrats från standardvärdet { "3" } till ett valfritt tak (standard { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = Utformningens hash är över en kanonisk JSON-form, och den inbyggda standardutformningens hash är <c1/> (låst av ett test).

seg-2405be1bc0c6 = Anteckningar om kompatibilitet för utdata:

seg-77670b7dd608 = tabellen <c1/> har en avslutande kolumn <c2/>;

seg-a52d9bbdd1a4 = CSV för <c1/> har en avslutande kolumn <c2/>, och dess JSON har <c3/> och <c4/>;

seg-3fa0f9243806 = svepets <c1/> är nu medelvärdet över varje uppdatering som har en NWPR-skattning (sammanfattning med begränsat minne), inte längre över körningens andra hälft.

seg-d542c1616f35 = Återinfångning är <b>av i den inbyggda standarden</b>, där tillståndsmaskinen bara observerar och slingorna körs bit för bit som utan den. (Standardslingorna själva ändrades dock: se FLL-stöd ovan.) Slå på den per utformning (<c1/>), med <c2/> eller med <c3/>.

seg-61d6b3122888 = En <b>varning för <c1/></b>: när fs ligger inom { "1e-6" } från en multipel av halva chiphastigheten (<c2/>), varnar <c3/>/<c4/> (utdata, <c5/>, svepets JSON), MCP-svaret från <c6/> och Python-resultatet från <c7/> för att kodslingans jitter och bias inte är representativa. Grundorsaken är dokumenterad med trösklar fastställda i förväg i <c8/>. Vid exakt { "2" } sampel per chip med avstånd på 0.5 chip är S-kurvan för DLL ett enda steg och slingan pendlar (dither): ≈ { "0.09" } chip RMS-kodfel (≈ { "26" } m) vid { "45" } dB-Hz, mot ≈ { "0.004" } chip vid en inkommensurabel hastighet. Den ~{ "2" } dB låga NWPR C/N0 vid den hastigheten har samma orsak. Vid exakt { "0" } Hz kod-Doppler och { "4" } sampel per chip korsar koden aldrig dödzonen på ±0.21 chip, så en kodfasbias på upp till omkring { "0.2" } chip kan bestå utan att synas i jittret (uppmätt: avstånd på 0.5 chip ger { "2.0" }× kontrollens kodfel med ett medelvärde på +{ "0.011" } chip; avstånd på 0.25 chip ger +{ "0.125" } chip); varningen gäller hastigheten.

seg-8fbfb3f0bee2 = <b>Känd gräns: standardutformningen lämnar inte över FLL→PLL under ungefär { "35" } dB-Hz</b> (ett golv för intagning på ~{ "35" } dB-Hz; se FLL-stöd ovan och <c1/>).

seg-43f02bc861be = En falsklåsnings- eller återinfångningssökning som inte kan köras (en hastighet utan helt antal sampel per kodperiod) stoppar inte längre spårningen.

seg-14f4e9edc443 = Tester: <c1/>, <c2/>, <c3/>, <c4/> och MCP IQ-rundturen.

seg-60141bb08f64 = C/N0-profiler i syntetiska scener ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> schemalägger tidsvarierande C/N0 per satellit i Kshanas egna scener, som dB-förskjutningar relativt scenens C/N0. Former: steg, ramp, styckvis linjär och scintillationsliknande Rice-fädningar med fast frö och angivet S4 och dekorrelationstid. De tillämpas genom den befintliga kanalkroken i scenen (<c2/>, i samverkan med effekterna från jonosfär, troposfär, scintillation och flervägsutbredning), utan ändring av scenkärnan. Referenssidofilens <c3/> följer profilen.

seg-548eeca516ff = Gränssnitt: <c1/> och <c2/>.

seg-a242e4d9f071 = Vad den är till för: slingor, monitorer och kampanjpoängsättning kan stresstestas mot en känd referens. Den ändrar endast styrkan hos de legitima signalerna.

seg-ff4df7c343dc = Kontroller (<c1/>). Trösklar: fädningens medelintensitet inom { "5" } % av { "1" }, S4 inom { "8" } % av målet (vid S4 = { "0.3" }, { "0.7" } och { "1" }), intensitetskorrelation över { "0.9" } vid { "0.05" } τ och under { "0.05" } vid { "5" } τ; referens exakt det angivna C/N0 plus profilen; ett spårat NWPR C/N0-fall inom { "0.7" } dB av ett steg på { "6" } dB. Uppmätt: S4 inom { "1.3" } % av målet, och ett spårat fall på { "6.26" } dB.

seg-e214458cd1b6 = <b>Detekteringsmonitorer för IQ-vägen ({ "0.34.0" } "Lab replay").</b> Ny modul <c1/>, kommando <c2/> och bindning <c3/>. De observerar en inspelning och rapporterar tidsserier plus flaggade händelser (start-, larm- och sluttider, topp, tröskel). De detekterar och mäter endast; inget här genererar en signal.

seg-5b05b2a54fab = <b>Totaleffekt / AGC</b>: blockeffekt och den förstärkning en idealisk AGC skulle tillämpa; flaggar ökningar och minskningar.

seg-2a84a640d7f1 = <b>Spektrum före korrelation</b>: Welch-PSD per block mot en inlärd baslinje. Överskottströskeln kommer från ett mål för falsklarm. Även komplex kurtosis och en pulsdetektor. Pulsdetektorn räknar sampel över en tröskel i varje block och utlöser en händelse när den exakta binomiala övre svansen för det antalet ligger under <c1/> (standard { "1e-4" } per block), inte när ett z-värde passerar en gräns: vid de små förväntade antalen i korta block är ett enda sampel redan flera sigma.

seg-7704ac807c38 = <b>C/N0 per kanal</b>: två ensidiga CUSUM-ändringsdetektorer (fall och ökning), matade med oberoende skattningar (steget sätts utifrån slingans C/N0-fönster).

seg-f965a68d388b = <b>SQM från korrelatorerna</b>: delta <c1/> och kvot <c2/>, plus asymmetritester från extra korrelatorer när en kanal levererar dem.

seg-a4006c2e8692 = <b>Låsindikatorserier</b>: PLI och en frekvenslåsindikator från på varandra följande prompts, som råsignaler. Besluten om lås och låsförlust ligger kvar hos spårningsmotorns tillståndsmaskin för lås.

seg-da72318f44cc = Ett strömmande pass (<c1/>) kör allt, med en TOML-/JSON-inställningsfil (<c2/>); kampanjköraren använder samma ingång. Allt MODELLED. Varje statistik kontrolleras mot sin slutna form genom simulering med fast frö (<c3/>):

seg-0ff96e4c5a20 = överskridanden av blockeffekt mot Gamma-svansen;

seg-97b559ea0897 = kurtosis medelvärde { "2" } och spridning <c1/>;

seg-2b941c702b7f = pulsandel <c1/>;

seg-e8f068c41f0c = CUSUM-körlängder mot Siegmunds approximation (uppmätt { "330" } och { "8.46" } sampel mot { "338" } och { "8.34" });

seg-e2cd6a55e49b = faslåsindikatorn mot medelvärdet för Rice-fas;

seg-06291b1c6274 = på en spårad C/A-signal avviker SQM-delta och kvotspridningar med omkring { "6" } % från de slutna formerna av första ordningen (uppmätt { "5.97" } %; testtröskel { "12" } %).

seg-12deb36a2e3a = Formeln för falsklarm vid spektralt överskott är en approximation; den uppmätta frekvensen var { "1.3" }× formeln. Från början till slut flaggar monitorerna:

seg-b002c66c7881 = ett C/N0-steg på { "6" } dB (ändringstid inom en skattning);

seg-2e828d106393 = en reflekterad väg som uppträder mitt i inspelningen (kvottest);

seg-68063f036e2c = ett signalbortfall (PLI faller från { "0.999" } till −{ "0.3" } och FLI från { "0.93" } till { "0.03" } under det);

seg-0cd95f0197ec = en smalbandig ton och glesa sampel med hög amplitud (spektral-, puls- och kurtosistester). Det är generiska DSP-testindata, inte störningsmodeller.

seg-7128b9000cc2 = <c1/>/<c2/> strömmar genom den nya sessionen (se Tillagt).

seg-98891d33e48c = <c1/> behåller sina kolumner från { "0.32" } men strömmas nu, så rader från flera kanaler interfolieras i tidsordning i stället för att grupperas per kanal. <c2/> behåller sin form från { "0.32" } och håller fortfarande varje epok i minnet: använd <c3/> för långa inspelningar.

seg-2ef2d5771ade = <c1/> mäter jitter över uppdateringarna under andra hälften av körningens varaktighet (tidigare andra hälften av antalet uppdateringar), och dess CSV/JSON får en kolumn <c2/>.

seg-f23b6db96748 = Spårtabellen får en kolumn <c1/>.

seg-a5769fbc201e = Användningstexten påstår inte längre att <c1/> tar front-end-flaggorna; bara <c2/> tillämpar dem.

seg-cf28fa21786a = För Python-funktionen <c1/> har <c2/> och <c3/> nu standardvärdet <c4/> (utformningens värden, { "1" } och { "5000" } Hz i den inbyggda utformningen). Dess epoker får de tidiga/sena korrelatorerna, <c5/>, <c6/>, <c7/> och <c8/>, och resultatet får <c9/> och <c10/>.

seg-666b9e3faa5d = <b>Standardsteget för infångning lämnar inte längre Galileo E1-spårning med en rest som FLL inte kan dra in.</b> Steget <c1/> lämnar upp till <c2/> Dopplerfel vid överlämning, men den tvåkvadrants FLL som är standard drar bara in <c3/>. För varje kod på { "4" } ms eller längre (<c4/>), inklusive Galileo E1-B och E1-C, låg resten ({ "83.3" } Hz vid { "4" } ms) utanför intagningen på { "62.5" } Hz och spårningen falsklåste vid +{ "125" } Hz, med en faslåsindikator på { "0.97" } som dolde det. Standardsteget begränsas nu också till <c5/> (<c6/>), { "0.8" } av intagningen, så att överlämningen håller sig inom den även när det angränsande intervallet vinner. ({ "0.4" } prövades först: det falsklåste { "1" } körning av { "42" } på E1-B, och en koherent sökning på { "1" } ms på GPS L1 C/A valde ett intervall { "350" } Hz fel och låste vid +{ "500" } Hz; { "0.25" } och { "0.2" } hade inga i samma körningar.) Kostnad: Galileo E1-B/E1-C går från intervall på { "166.7" } Hz till { "50" } Hz, { "201" } intervall över ±{ "5" } kHz i stället för { "61" }; koderna på { "1" } ms ({ "166.7" } Hz, <c7/>) är oförändrade. <c8/> i en slingutformning betyder detta; ett uttryckligt <c9/> eller <c10/> används som skrivet, och <c11/> (ingen spårningsöverlämning) behåller lärobokssteget. Epokhuvudet och <c12/> registrerar nu det lösta steget och slingbandbredderna för varje kanal (<c13/>). Standardutformningens hash är oförändrad. Utdataändring: detekteringar på koder på { "4" } ms och längre kan hamna i andra Dopplerintervall.

seg-9150dc89e186 = <b>GPS L2C CM (slinguppdatering på { "20" } ms) håller lås med standardutformningen.</b> Standardens PLL på { "15" } Hz och FLL på { "10" } Hz har <c1/> på { "0.3" } och { "0.2" } vid T = { "20" } ms, och slingan tappade låset även från en perfekt start (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Ny utformningsnyckel <c2/> (standard { "0.1" }) begränsar brusbandbredderna för PLL och FLL till <c3/> när slinguppdateringstiden är längre än { "4" } ms (<c4/>): { "5" } Hz och { "5" } Hz vid { "20" } ms, { "10" } Hz och { "10" } Hz vid { "10" } ms för BeiDou B1C; koderna på { "1" } ms och { "4" } ms behåller { "15" } och { "10" } Hz. Den gäller också uttryckliga bandbredder; <c5/> stänger av den. Nyckeln utelämnas ur den kanoniska formen vid sitt standardvärde, så standardhashen är oförändrad; en utformning som anger något annat värde har en annan hash. Vid { "45" } dB-Hz ger L2C CM nu PLI { "0.996" }, Dopplerfel { "0.00" } Hz och M2M4 { "42.71" } dB-Hz. Känd öppen punkt: NWPR C/N0 läser { "1.76" } dB lågt där (och { "2.45" } dB lågt på B1C vid { "10" } ms), så matrisens T5 för L2C förblir ett ignorerat fynd.

seg-74517bee3f6f = <b><c1/> återgenererad: den incheckade figuren var inaktuell mot sitt eget scenario (en dataändring, inte en omritning).</b> Diagrammet ritades 2026-06-02 från <c2/>; två dagar senare angav 67fed19e golven för flicker FM i det scenariot (kvant <c3/>, CSAC <c4/>) och figuren ritades aldrig om. Den visade körningen före golven: y-axel { "0" } till { "47" } ns, CSAC p95 för avbrott per körning på { "10.5" } till { "47.6" } ns (medelvärde { "25.2" } ns), klassisk holdover { "4050" } s i medel. Scenariot som levereras (och som handledningen och CLI-sammanfattningen redan anger) ger y-axel { "0" } till { "407" } ns, CSAC p95 per körning { "40.8" } till { "374.0" } ns (medelvärde { "167.0" } ns), klassisk holdover { "844" } s [{ "220" } till { "2130" } s]; specifikationslinjen på { "20" } ns ligger vid samma { "20" } ns på en ungefär nio gånger högre axel. Motorn är oförändrad: dagens motor på scenariofilen från juni återger den gamla figurens axel exakt. Figuren refereras inte från README eller dokumentationen.

seg-75636f9419b2 = Kända begränsningar

seg-2c607b56048e = <b>NWPR C/N0 läser lågt vid högt C/N0·T per prompt, och BOC({ "1,1" }) vid { "5" } MS/s förlorar omkring { "1" } dB.</b> NWPR är väntevärdesriktig på ideala prompts, men slingans egen PLL-jitter kostar omkring en anpassad { "8" } dB × Bn·T (en scen, fyra punkter: −0.24/−0.44/−0.77/−{ "1.58" } dB vid 1/2.5/5/10 Hz och { "20" } ms; omkring −{ "1" } dB vid standardvärdet <c1/>); M2M4 är okänslig. BeiDou B1C-data vid { "5" } MS/s förlorar också omkring { "1" } dB prompteffekt till bandbegränsning (använd { "10" } MS/s eller mer). Inget av detta är ett fel i estimatorn; raderna T5 i signalmatrisen för GPS L2C och BeiDou B1C förblir ignorerade fynd med dessa orsaker.

seg-ff195e575023 = <b>Diagramtext och Studios övertagande av diagram härdade.</b> Text som ett scenario för in i ett genererat diagram maskeras nu konsekvent av en gemensam rutin, och Studio övertar bara ritmarkering från ett diagram. Studios adressparametrar, nyckelstyrda uppslag och scenariohämtningar begränsas till kända värden. Medföljande diagram, inspelade resultat och publicerade siffror är oförändrade. Uppgradering rekommenderas för alla som öppnar scenariofiler från opålitliga källor i Studio eller bäddar in genererade diagram på webbsidor. Säkerhetsmeddelande: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>Störnings- och spoofing-omfattningen för IQ-lagret, korrekt angiven.</b> Posterna för { "0.31.0" } och { "0.32.0" } nedan säger att IQ-lagret lägger till "ingen syntes av störnings- eller spoofing-vågformer". Det stämmer för själva IQ-lagret (<c1/> genererar endast legitima GNSS-signaler), men det lästes som ett påstående om hela motorn, och det är det inte: sedan { "0.29.0" } skriver sektionen <c3/> i typen <c2/> en SigMF-ögonblicksbild av sin analytiska modell med de konfigurerade jammers i den (brusliknande jammers frekvensintervall för frekvensintervall, toner och chirps som vågformer), och <c4/> summerar en autentisk signal och en spoofer-replikasignal i minnet för att testa slingfångst (kompositen skrivs aldrig ut). Motorn har också haft en programvarumottagare för GNSS sedan { "0.20.0" } (<c5/>: infångning och spårning; sedan { "0.31.0" } även <c6/> och <c7/>). Ingenting i Kshana sänder eller styr radiohårdvara. Statusraden i README, <c8/>, <c9/> och IQ-anteckningarna om utformning säger nu detta; de utgivna posterna lämnas som de publicerades. Inget beteende ändras.

seg-61befd8b474d = <b>Känd begränsning: kommensurabel sampling.</b> Vid en samplingshastighet som är en heltals- eller halvtalsmultipel av chiphastigheten ligger samplen på samma chipfaser i varje chip, och kod-diskriminatorn blir en trappa. På en syntetisk GPS L1 C/A-signal vid { "45" } dB-Hz med avstånd på 0.5 chip ger { "2.046" } MHz ({ "2" } sampel/chip) ≈ { "0.09" } chip (≈ { "26" } m) RMS-kodfel och en bias på −{ "0.09" } chip, mot ≈ { "0.003" } chip vid en inkommensurabel hastighet. NWPR C/N0 läser ≈ { "2.4" } dB lågt där. Vid { "4.092" } MHz beror det på avståndet och kod-Dopplern. Vid { "0.5" } chip är det ofarligt vid { "1500" } Hz Doppler men { "2" }× med en bias på { "0.011" } chip vid { "0" } Hz, och vid { "0.25" } eller { "0.1" } chip är det { "8" }–{ "10" }× kodfelet. Bärvågsspårning påverkas inte. <c1/> har mätningarna.

seg-3a30bd47380a = GNSS-IQ-lager på MCP-servern (fas B.1).

seg-ef81eca03bca = <c1/> får sex verktyg som styr lagret <c2/> från en agent: <c3/> (de accepterade signalnamnen och IQ-uppsättningen), <c4/> (beskriv en inspelning), <c5/> (generera en scen med angiven profil eller broadcast-efemerid, med den valfria kanalen på signalnivå), <c6/> (FFT-infångning, valfritt bakom front-end-steg), <c7/> (infånga, sedan DLL/PLL/FLL-banken) och <c8/> (bandpass, notch, blankning, excision, AGC, kvantiserare). IQ-sampel passerar aldrig protokollet: varje verktyg tar filsökvägar inom en arbetskatalog som anges av <c9/> (om den inte är satt är IQ-filverktygen av och alla andra verktyg opåverkade), vägrar sökvägar som löses utanför den och utdata som redan finns om inte <c10/> är satt, tillämpar en samplingsbudget per anrop (<c11/>, standard { "50 000 000" }) innan något arbete görs, vägrar okända argument och svarar med en kompakt JSON-sammanfattning (detekteringar, C/N0, låstillstånd och varje skriven fil med sitt antal byte). Utdata per epok går bara till filer som anroparen namnger. Verktygen kör samma kodväg som CLI:t genom en ny publik söm, <c12/>, som returnerar CLI:ts meddelande i stället för att skriva ut det (stdout är MCP:s JSON-RPC-kanal); <c13/> och <c14/> är nu också publika. Endast programvara och additivt: IQ-lagret lägger inte till någon störnings- eller spoofer-syntes, ingenting sänds någonsin och det finns inga nya beroenden. <c15/> deklarerar de två miljövariablerna. Rundturstester i <c16/> genererar en kort scen med två satelliter och kontrollerar infångning mot scenens egen referenssidofil, spårningslås och C/N0, front-end, SigMF-utdata, budgeten, sökvägsbegränsningen och det avstängda tillståndet.

seg-6963f3fa1db7 = <b>GNSS-IQ-lagret i valideringsregistret.</b> En kontroll fastställd i förväg mot gps-sdr-sim (en oberoende GPS L1 C/A-basbandsgenerator, MIT, commit 28ca29a6) ingår nu i den alltid påslagna testsviten (<c1/>). Dess incheckade referensutdata (<c2/>: { "20" } ms av gps-sdr-sims egen 8-bitars I/Q, dess kanallista och kanaltillståndet bakom den från ett testharness länkat mot samma bygge) återskapas av <c3/>. Inget vid testtillfället behöver nätverk eller det externa verktyget. Två registerrader läggs till ({ "251" } rader: { "124" } Validated, { "123" } Modelled, { "4" } Partner):

seg-21d005e2ef0e = <em>GNSS-IQ-scenens signalgeometri mot en oberoende basbandsgenerator</em>: <b>Validated</b>. Scenens referens (synlig mängd, pseudoavstånd, kodfas, Doppler, siktvinklar) för en scen med broadcast-efemerid stämmer med gps-sdr-sims kanaltillstånd på alla { "11" } kanaler: sämst { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } grader, mot trösklar på { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz och { "1e-4" } grader som fastställdes före körningen.

seg-5c8858182d41 = <em>GNSS-IQ-infångning på oberoende genererade I/Q-sampel</em>: <b>Modelled, med ett fynd</b>. <c1/> hittar varje simulerad satellit i gps-sdr-sims sampel inom de registrerade trösklarna (kodfas inom { "0.195" } chip, Doppler inom { "72" } Hz). Den registrerade tröskeln "ingen annan PRN detekterad" misslyckas dock: på gps-sdr-sims brusfria utdata korsas tröskeln för gaussiskt brus av de andra satelliternas korskorrelation för alla { "21" } frånvarande PRN. Det strikta testet behålls, ignorerat med fyndet, och ett låst test registrerar det. Ingen motorkod eller publikt API ändras. I/Q-sampel jämförs inte sampel för sampel: gps-sdr-sims heltalssinustabell, förstärkningar, nollstartfas för bärvågen och trunkerade LNAV-fält är inte storheter som en mottagare behöver vara överens om. Jämförelsen görs på de observabler som en mottagare mäter.

seg-a2be63287ce4 = <b><c1/> lämnar som standard över från en infångning på ≈{ "4" } ms (beteendeändring).</b> Infångningen som initierar varje spårningskanal integrerar nu <c2/> kodperioder koherent i stället för en, där <c3/> är kodens hela period (primär gånger sekundär längd för en skiktad kod, den enhet som infångningen integrerar över). De oskiktade koderna på { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) söker nu { "4" } perioder ({ "4" } ms), så standardsteget för Doppler <c4/> är ~{ "167" } Hz i stället för ~{ "667" } Hz. Varje kod vars hela period redan är { "4" } ms eller längre behåller { "1" } period: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms), och de skiktade GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q och E1-C ({ "10" } till { "100" } ms med sina överlagringskoder), och GPS L2C. Varje signal integrerar därför minst ~{ "4" } ms. En sökning på en period kunde lämna över en kanal upp till ~{ "333" } Hz fel, utanför intagningen för FLL, och den spårade då en falsklåsning ~{ "500" } Hz bort medan den rapporterade ett rent spår. På ett svep med fast frö av { "180" } GPS L1 C/A-kanaler (Doppler över ±{ "5" } kHz, { "38" } till { "47" } dB-Hz, hälften med navigeringsdata; <c5/>, kan köras om) minskar falsklåsningarna från { "27" } av { "180" } till { "1" } av { "180" } och missade infångningar från { "102" } till { "11" }, för ~{ "40" } ms mer sökning per PRN på GPS L1 ({ "11" } → { "52" } ms). Den enda kvarvarande falsklåsningen är vid { "38" } dB-Hz, { "36" } Hz fel. Varje gränssnitt är överens: <c6/> och <c7/> (<c8/>), Python <c9/> (<c10/> är nu auto; stub uppdaterad) och MCP-verktyget <c11/>. Användare som förlitade sig på den gamla standarden kan ange <c12/> (<c13/>). Standardvärdet { "1" } för <c15/> i <c14/> är oförändrat. Nya publika <c16/> och <c17/>; regressionstest <c18/>.

seg-52768eb8e3d5 = <b>Varje genererad grafik följer nu sajtens Observatory-tema: varje diagrams byte ändras.</b> Detta är en avsiktlig revision av de publicerade figurerna, endast färger och typsnitt; inget ritat värde, ingen koordinat och ingen etikett flyttades. Varje scenarios <c1/> (och därmed Studios diagramexporter och demodiagrammen i README), körningsrapportens HTML (<c2/>), tidslinjeanimationen (<c3/>), HTML-sidorna för scenarioresultat och studier, valideringssammanfattningen och dokumentationens figurer och diagram använde den varmt mörka julipaletten (<c4/> botten, <c5/> guld) och ett varmt pappersaktigt rapporttema. De hämtar nu varje färg och typsnitt från en enda modul, <c6/>, som speglar <c7/>: diagram ritas instrumentmörka på Observatory-botten (<c8/>) i typsnittsstacken Geist; rapporten, animationsspelaren och resultatsidorna följer betraktarens ljus/mörk-inställning med Observatorys tokens för ljust och mörkt. De sex felområdena behåller en färg var (störning korall, spoofing magenta, tidssynkronisering blå, banor cyan, integritet lime, navigering bärnsten), och evidensnivåerna läses validated lime, modelled bärnsten, partner magenta. Vattenfallsrampernas perceptuella (inferno) ordning behålls, förankrad på nytt vid den nya botten.

seg-d967e354a966 = <c1/> binder modulen till <c2/> i båda teman, kontrollerar att <c3/> och <c4/> (båda genererade från modulen, för Python-figurverktygen och mermaid-cli) är aktuella, och misslyckas om en hex-färgliteral förekommer i <c5/> utanför paletten.

seg-fa3e60422ca5 = <c1/> får en tredje diagnos, "endast färger och typsnitt flyttades", så att en palettrevision kan skiljas från ett flyttat ritat värde. Varje omrenderat README-diagram kontrollerades vara lika med sin föregångare under den normaliseraren.

seg-3bc4056fd57e = <c1/> läser paletten och genererar nu också de tre resultatfigurerna i README som saknade incheckad generator (<c2/>, <c3/>, <c4/>), med riktiga textelement, från <c5/>, resultatet <c6/> och <c7/>. <c8/> läser samma palett, vilket rättar dess drift i ljust tema från sajten. Värdena för <c9/> är värstafallskolumnen <c10/> i den fixturen ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } och { "4.12e-6" } km), oförändrade från Matplotlib-figuren, och <c11/> misslyckas nu om den incheckade figuren och fixturen inte stämmer med varandra.

seg-3196836a2a0d = <b><c1/> uppdaterad till aktuella data (en dataändring, inte en omritning).</b> Figuren angav { "28" } förmågor över { "8" } områden ({ "11" } validated, { "17" } modelled), inaktuellt mot sin egen angivna källa; ritad nu av sin nya generator från <c2/> läser den { "46" } förmågor över { "8" } områden ({ "17" } validated, { "29" } modelled).

seg-55d5b16379aa = <b>Q för CW-/smalbandsjammer är nu { "1.0" }, inte { "1.5" }.</b> Lärobokens värde för en ton på bärvågen är { "1" } (en ton behåller signalens spektrala topp, <c1/>, <c2/>); det gamla { "1.5" } gjorde en ton mindre skadlig än bredbandsbrus vid samma J/S. Utdataändring: omkring −{ "1.8" } dB effektivt C/N0 under CW-/smalbandsjammers vid högt J/S i typerna <c3/>, <c4/> och interop (tonen i det medföljande exemplet <c5/>: { "17.98" } dB-Hz från tabellen, var { "19.74" }). Q för bredband förblir { "1.0" } (konservativt, omkring { "3" } dB under lärobokens ~{ "2" }) i väntan på granskning i { "0.34" }. Sätt <c6/> för att behålla det gamla { "1.5" }.

seg-99fab1936170 = <b>Heltalsutdata från <c1/> använder heltalsintervallet.</b> Med enhetseffektbrus och en skrivarskala på { "1" } blev scener i <c2/>/<c3/> ungefär { "{" }-1, { "0" }, { "1" }{ "}" } och scener med 2 bitar hade sina trösklar vid { "2.8" } sigma. Heltalsformat skalas nu så att den förväntade RMS per komponent är en fjärdedel av full skala ({ "31.75" } LSB i ci8, { "8191.75" } i ci16) eller { "2" } LSB med 2 bitar. Skalan och antalet klippta element skrivs ut och skrivs till sidofilen. Flyttalsutdata är oförändrade.

seg-696109ae70f8 = <b>Åtta fixturlåsningar i sju testfiler misslyckas inte längre på macOS på grund av skillnader i sista biten</b> (del av issue #36). Låsningarna som kontrollerar att motorn fortfarande bygger de incheckade indata för en oberoende referens (jakobianer, en tillståndstabell, uppskjutningsazimut) jämfördes bit för bit och misslyckades på macOS arm64 med { "2" } till några tusen enheter i sista decimalen (ulp). De jämför nu inom { "1e-12" } av en skala hämtad från fixturen; heltal, nycklar och längder jämförs fortfarande exakt, och ett mutationstest visar att en relativ ändring på { "1e-6" } fortfarande misslyckas. Låsningen för uppskjutningsazimut jämför <c1/> och den stigande/fallande grenen i stället för själva azimuten, eftersom <c2/> förstärker en ulp i sitt argument till omkring { "3e-9" } rad där en inklination är lika med en plats kolatitud. Ingen tolerans för en oberoende referens och ingen tröskel fastställd i förväg ändrades. Två tester (gemensam banbestämning på månen, observerbarhet på månen) täcks inte: på macOS flyttar sig deras jämförelser som fastställdes i förväg själva, och det lämnas till en uppföljning.

seg-b6c354fa0c28 = <b><c1/> och <c2/> tillämpar front-end-flaggorna.</b> Användningstexten annonserade <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> på <c9/>, men <c10/> och <c11/> byggde aldrig kedjan: flaggorna ignorerades tyst, och en flagga utan värde som <c12/> svalde flaggan efter sig. Båda kommandona tolkar dem nu som <c13/> gör och sätter en ny front-end-kedja framför infångningspasset och spårningspasset. Utdata är lika med att köra kommandot på filen som <c14/> skriver för samma flaggor.

seg-d7238dab610e = IQ-scenens data placeras per signal.

seg-46ace9a3e008 = <c1/> (och <c2/>) lägger bitar på { "50" } bit/s på varje signal, piloter inklusive, och med GPS LNAV-hastigheten på Galileo och BeiDou. Data följer nu varje signals egen symboltakt, angiven av den nya <c3/> (<c4/>, satt av varje konstruktor i <c5/>). Det är { "10" } ms på L5-I5, { "4" } ms på E1-B, { "2" } ms på BeiDou B1I GEO (D2), och bitar på { "20" } ms med en meander på { "10" } ms på GLONASS L1OF. Data vägras på piloter, på GPS L2C som en enda CM/CL-ström, och <c6/> på allt utom L1 C/A. Egna koder behåller den tidigare tidtagningen på { "20" } ms som standard. En programmatisk <c7/> som bad om <c8/> på en kod som inte är L1 C/A, eller <c9/> på en pilot, genererade tidigare tyst och returnerar nu ett fel vid första läsningen.

seg-9dd38fa39d14 = GLONASS L1OF-kanaler infångas och spåras på sin egen FDMA-bärvåg.

seg-a775751ed6f6 = <c1/> och spårningskanalerna blandade ned varje kod från enbart <c2/>. I en GLONASS-inspelning med flera kanaler hittade en sökning efter kanal +{ "3" } därför signalen från kanal { "0" } (alla kanaler delar en spridningskod) och tittade aldrig { "1.6875" } MHz högre. Båda använder nu <c3/>. Bärvågstermen är noll för varje inspelning centrerad på signalens egen bärvåg och utelämnas när centrum är okänt, så CDMA-bearbetningen är oförändrad. Om du kringgick det gamla beteendet genom att lägga in <c4/> i <c5/> i sidofilen: ta bort den termen, förskjutningen tillämpas nu utifrån bärvågen och centrum, så att lämna kvar den tillämpar den två gånger. Känd begränsning, oförändrad här: en GLONASS-scen identifierar varje satellit med sin frekvenskanal <c6/>, och satellit-id:t av typen <c7/> omsluter en negativ kanal. Referenssidofilen skriver <c8/> som <c9/> { "4294967289" } (<c10/>). Läs tillbaka den som <c11/> med en cast till <c12/>.

seg-1c88bffc605b = <b>GNSS-IQ-lagret i CLI och Python ({ "0.32.0" } fas A).</b> Den befintliga modulen <c1/> går nu att använda utan att skriva Rust. Fem nya kommandon i <c2/> ansluter till gruppen för datahantering: <c3/> genererar en lång IQ-scen med flera satelliter till en fil med en referenssidofil; <c4/> kör FFT-infångning av en eller flera PRN över en inspelning och rapporterar varje detektering (PRN, Doppler, kodfas, statistik, tröskel); <c5/> infångar och kör sedan DLL/PLL/FLL-banken över en inspelning och ger spårningsutdata per epok (CSV/JSON) med konfigurerbara slingbandbredder, integrationstid och korrelatoravstånd; <c6/> spelar upp en inspelning över flera slingutformningar och rapporterar resulterande jitter- och lågmått per utformning; och <c7/> anpassar modellen för låsförlust i spårningsslingan till en tidslinje för mottagarförtroende. Samma kärna exponeras för Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>) och returnerar NumPy-vänliga listor och ordlistor. Endast programvara och additivt: inga nya beroenden, ingen sändning, ingen syntes av störnings- eller spoofing-vågformer; motorn, infångningen, spårningen och slingutformningarna är cratets egna, så en anropare från CLI eller Python får samma bitar som Rust-testerna. Ny modul <c13/>; scenens egen referenssidofil är den oberoende referensen i <c14/> (infångningen återskapar varje injicerad kodfas och Doppler, spårningen konvergerar mot det injicerade Dopplervärdet). Inget publicerat antal scenariotyper och ingen rad i verifieringsmatrisen ändras.

seg-1971e3e9cfe6 = <b>Återstående funktioner i GNSS-IQ-biblioteket i CLI:t <c1/> och Python ({ "0.32.0" } fas A.2).</b> Bygger på fas A och gör resten av lagret <c2/> tillgängligt utan att skriva Rust:

seg-67c485097357 = <b>Utbredningskanal i <c1/></b> (och Pythons <c2/>): en jonosfär av första ordningen (<c3/>/<c4/> eller <c5/>), Saastamoinen/Niell-troposfären (<c6/>), Cornells scintillationsmodell (<c7/>, <c8/>, <c9/>), spekulär markflervägsutbredning (<c10/>/<c11/>), den landmobila kanalen med tre tillstånd (<c12/>) och ett block för förhållanden utan fri sikt (<c13/>) tillämpas på varje satellit genom en ny crate-intern brygga (<c14/>) som omvandlar kanalmodellernas absoluta vägar till scenens form med överskott över geometrin.

seg-d736671f2251 = <b>SigMF-utdata i <c1/></b> (<c2/>): skriver samplen som ett par <c3/>/<c4/> med en capture och annotationer per satellit; <c5/>/<c6/> läser redan SigMF, så en scen gör en rundtur.

seg-c59ae97779ae = <b>Front-end-DSP</b>: ett nytt kommando <c1/> och samma flaggor på <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) kör stegen i <c10/> (bandpass-FIR, adaptiv notch, pulsblankning, excision i frekvensdomänen, AGC, kvantiserare); speglat i Python som <c11/>.

seg-878d66b73571 = <b>Scener med broadcast-efemerid</b>: <c1/> (med <c2/>/<c3/>/<c4/>) placerar varje frisk GPS-satellit i dess sanna broadcast-geometri med motorns RINEX-läsare, så att referenssidofilen bär verkligt avstånd, Doppler och kodfas per satellit; speglat i Python som <c5/>. Endast programvara och additivt: inga nya beroenden, ingen sändning, ingen syntes av störnings- eller spoofing-vågformer (kanalens utbredningseffekter verkar bara på den legitima signalen). Varje numeriskt påstående testas mot en oberoende referens (sluten form eller injicerad referens) i enhetstesterna för kanal/front-end och <c6/>.

seg-1e71370d87d8 = <b>GNSS-IQ-lager: simulering på signalnivå och bearbetning i programvarumottagare.</b> En ny modul <c1/> tar Kshana från en front-end för L1 C/A med en satellit och korta block till ett fullständigt lager på signalnivå, nåbart från kommandogruppen <c2/>. Den genererar långa IQ-scener i råformat med flera satelliter och en referenssidofil per epok (<c3/>); tillämpar utbredning på signalnivå — jonosfär med kod-bärvågsdivergens, troposfär, amplitud- och fasscintillation (Cornell-modellen), Fresnel-flervägsutbredning och en landmobil kanal med tre tillstånd, samt förhållanden utan fri sikt (<c4/>); infångar och spårar med FFT-infångning och en DLL/PLL/FLL-bank med flera kanaler, och spelar upp en inspelning genom många slingutformningar (<c5/>, <c6/>); modellerar front-end — FIR-/IIR-filtrering, kvantisering på 1 till 14 bitar, AGC, notch, pulsblankning och excision i frekvensdomänen (<c7/>); strömmar stora inspelade datamängder med begränsat minne — int8-/int16-/float32-/packade 2-bitars- och reella IF-format, SigMF med flera filer, omsampling, en datamängdsinventering med SHA-256 per fil och en batchkörare (<c8/>); lägger till spridningskoder för GPS L5/L2C, Galileo E1 (CBOC, riktiga minneskoder från ICD) och E5a, BeiDou B1C/B1I och GLONASS L1OF, var och en kontrollerad mot sitt gränssnittskontrolldokument (<c9/>); och anpassar modellen för låsförlust i spårningsslingan till en verklig mottagares observerade beteende i labbkörningar, med fel för leave-one-run-out i undanhållen datamängd och extrapolering betecknad som prediction (<c10/>). Varje numeriskt påstående testas mot en oberoende referens (en ICD-tabell, en sluten form eller en oberoende mottagare som återskapar den injicerade referensen); kanal- och slingmodellerna i fysiken förblir MODELLED. Detta är enbart ett programvarulager: det skriver IQ-filer för programvarumottagare och syntetiserar inte störnings- eller spoofing-vågformer och styr inte radiohårdvara. Inget publicerat antal scenariotyper och ingen rad i verifieringsmatrisen ändras. Utformning: <c11/>.

seg-943e21ccb25f = Mottagarförtroende: bedöm en verklig GNSS-mottagarlogg.

seg-f8274120bff2 = <c1/> läser en logg från u-blox UBX, RINEX { "3" } (med en valfri broadcast-navigeringsfil), Android GnssLogger eller NMEA { "0183" } till en enda tidsstämplad tidslinje och kör förtroendemonitorer över den: fall i bärvågsbrustäthet (C/N0), förlust av lås, automatisk förstärkningsstyrning (AGC), u-bloxs jamming-indikator, positionshopp och, med RINEX och navigering, motorns egen enpunktsbestämning med RAIM (receiver autonomous integrity monitoring) med paritet och den klockstödda monitorn. Varje epok är nominal, degraded eller untrusted, och resultatet anger när och varför. Händelser och förutsagda C/N0-fall som anges i scenariot poängsätts mot toleranser som anges i samma fil: detekterad, sen eller missad, och överens eller oense. Utdata är resultat-JSON, en CSV per epok och ett diagram; resultatet bär loggens SHA-256 och varje tröskel. Nås också från Python (<c2/>), WebAssembly-paketet (<c3/>, loggar infogade) och det nya verktyget <c4/> i servern för Model Context Protocol (MCP). Guide: <c5/>; exempel: <c6/>. På spoofing-loggarna från JammerTest { "2024" } återskapar motorvägen det första larmet i pipelinen för den oberoende referensen som fastställdes i förväg vid varje publicerad start (<c7/>). Monitorerna förblir MODELLED; ingen rad i verifieringsmatrisen ändras.

seg-55669fe92932 = En mindre utgåva. Valideringsrunda { "2" } och paket i wave 1 tar verifieringsmatrisen från { "223" } rader ({ "93" } VALIDATED) vid { "0.29.3" } till { "249" } rader ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); varje uppflyttning kontrollerades mot en oberoende referens vid en tolerans fastställd före körningen, och varje avvikelse publiceras som ett fynd. Nytt: en inbyggd läsare för NAIF-kernel och en DE440-väg, en validerad väg för propagering och tid från SGP4 till ITRS, ett uppmätt klockbibliotek, en referensgenerator för LunaNet AFS, lösare med utökad precision och kvadratrotsinformation, och verklig bearbetning av IQ från månen på LuGRE-data. Publicerade siffror som flyttades listas som revisioner nedan.

seg-f75f1878045e = Tjugosju rader i verifieringsmatrisen blir VALIDATED efter att en oberoende referens stämde inom en tolerans fastställd före den första jämförelsen (uppflyttningsregeln i <c1/>): tio i en första valideringsrunda och sjutton i en andra. Femtioen MODELLED-rader ställdes mot en extern oberoende referens i den första rundan och de återstående rader som gick att ta vidare i den andra; varje avvikelse antecknas nedan som ett fynd i stället för att trimmas bort. Tre rader delades så att en validerad del inte bär en ovaliderad rest, vilket tar matrisen från { "223" } till { "226" } rader; valideringspaketen som lagts till sedan dess tar den till { "249" }. Siffrorna läses från den genererade <c2/>.

seg-8d542741fa77 = efter runda { "1" }

seg-ae3743f976c5 = Rader i verifieringsmatrisen

seg-6c4b1fd56a31 = varav VALIDATED mot en extern oberoende referens

seg-90450fe87280 = varav MODELLED

seg-86972e4c7f12 = varav PARTNER

seg-61c5c5e308ed = Förkortningar som används i den här posten

seg-5907283b71da = Förkortning

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (för ARAIM); avancerad autonom integritetsövervakning i mottagare; Matlab Algorithm Availability Simulation Tool från Stanford University

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = Allan-avvikelse; slumpvandring i hastighet; slumpvandring i vinkel

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = ett astrodynamikverktyg med öppen källkod (Nyx Space); NASA:s verktygslåda Spacecraft, Planet, Instrument, C-matrix, Events från dess Navigation and Ancillary Information Facility; kernel med planetkonstanter

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = Barycentric Celestial Reference System; Barycentric Dynamical Time; Terrestrial Time

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Internationella byrån för mått och vikt; ett laboratoriums realisering av koordinerad universell tid

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; månens tidssystem som skrivs i meddelandets fält TIME_SYSTEM

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = Cramér–Rao-gränsen (undre gräns)

seg-a1fff77503b4 = CW

seg-064470740a35 = Clohessy–Wiltshire-relativrörelse

seg-d70a9b3e92a7 = Development Ephemeris { "440" } från Jet Propulsion Laboratory

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = geometrisk försämring av precision; positionens geometriska försämring av precision

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = utökat Kalmanfilter; unscented Kalmanfilter; tröghetsnavigeringssystem; globalt navigationssatellitsystem; tröghetsmätenhet

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = effektiv monitortröskel; skyddsnivå i vertikal och horisontell led

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = jordorienteringsparametrar; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; medelvärde av absolutfel

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = NASA:s General Mission Analysis Tool

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = icke-terrestriskt nätverk (3GPP); synkroniseringssignalblock

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = heltalsminstakvadrater; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = bias mellan system

seg-743c3303e01c = LEO

seg-d7b83e7c427f = låg jordbana

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = lösningsseparation med flera hypoteser; skyddsnivå; skyddsnivå för tid

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = effekttäthetsspektrum; sampel i fas och kvadratur; Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvantprojektionsbrus

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = autonom integritetsövervakning i mottagare

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = satellitbaserat kompletteringssystem; USA:s Wide Area Augmentation System; dubbla frekvenser och flera konstellationer; en geostationär SBAS-satellit

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = kvadratiskt medelvärde; signal-i-rymden-avståndsfel

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = ett positioneringsbibliotek för GNSS med öppen källkod

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = interferometri med mycket lång baslinje

seg-c3bc7d828ecc = Varje rad nedan anger sin typ av referens (Library: ett oberoende tredjepartsbibliotek som beräknar en entydigt definierad storhet; Measured: verkliga uppmätta data; P2: ett oberoende numeriskt bibliotek som räknar om en linjäralgebrastorhet på incheckade indata), referensen, toleransen som fastställdes före körningen och resultatet. Varje uppflyttning kördes om av en andra granskare, som återskapade fixturen byte för byte och visade att en avsiktlig mutation i motorn gör testet rött.

seg-be0a4e3ac81c = <b>GNSS/INS-sensorfusion</b> (Library), avgränsad till det löst kopplade EKF med 15 felstillstånd: NaveGo v1.4 (LGPL-3.0, körd under GNU Octave) på dess egen verkliga körning med Ekinox IMU/GNSS. Kshanas RMS i horisontell led, vertikal led och positionsinnovation är { "0.912" }, { "0.940" } och { "0.861" } av NaveGos (tröskel { "1.2" }) och dess normaliserade medelinnovation är { "0.395" } (tröskel { "1.5" }). GNSS finns under hela körningen, så inget bortfall testas. Det hårt kopplade UKF och det kopplade klockfiltret ligger utanför påståendet.

seg-0c82afd5ba30 = <b>Attityd i 3 frihetsgrader och budget för pekfel</b> (Library), avgränsad till toppen i gravitationsgradientmomentet: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } fall, inom { "1e-12" } relativt (sämst { "2.1e-15" }). RSS-pekbudgeten är en summa av tal som anroparen levererar och ligger utanför.

seg-71cf58e91a09 = <b>Gemensam geometri för kommunikation och navigering på månen</b> (Library), avgränsad till platsplacering, azimut, elevation och avstånd: ANISE { "0.10.2" }, { "768" } sampel, inom { "1e-6" } grader och { "1" } mm (sämst { "2.2e-12" } grader och { "5.6e-9" } m). Parametern för avståndsnoggrannhet är en utformningsindata utanför påståendet.

seg-0687c757231b = <b>Momentfri dynamik för attityd hos en stel kropp</b> (Library): rymdfarkostens hub i Basilisk { "2.9.1" }, { "1e4" } s på två allmänna tröghetsmoment, kvaternion och vinkelhastigheter inom { "1e-9" } (sämst { "3.3e-11" } och { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>Heltalsosäkerhet i bärvågsfas för GNSS (LAMBDA)</b> (Library), avgränsad till ILS-lösningen och dess två bästa normer: RTKLIB v2.4.2-p13 <c1/>, { "300" } kovarianser, { "0" } avvikelser i heltalen, normer inom { "1e-9" } relativt (sämst { "5.6e-13" }). Den bootstrappade framgångsfrekvensen kontrolleras fortfarande bara internt.

seg-c23196cbdc96 = <b>Sammansatt skyddsnivå för tid, skalär MHSS</b> (P2): numpy { "2.3.5" } och scipy { "1.18.1" } på { "300" } incheckade indata, PL inom { "1e-9" } relativt (sämst { "1.2e-10" }), drivande delmängd identisk.

seg-8f524d815949 = <b>GLS-whitening av gemensam mod och Mahalanobis-identiteten</b> (P2): numpy { "2.3.5" } LAPACK på { "201" } incheckade kovarianser, inom { "1e-12" } relativt (sämst { "7.9e-16" }); konditionstal upp till { "19.3" }.

seg-b4136cdb8a98 = <b>Leverantör av orientering för månens huvudaxlar enligt DE440</b> (Library): SPICE <c1/> på den binära PCK vid { "2 000" } epoker utanför noderna, inom { "1.7e-5" } rad (sämst { "1.7e-6" } rad, omkring { "3" } m vid ytan), efter rättningen som listas under "Åtgärdat".

seg-c28de00a491c = <b>SigMF-inspelning in och ut, och Welch-spektra</b> (Library), avgränsad till läsning och skrivning av SigMF och <c1/>: scipy { "1.18.1" } <c2/> inom { "1e-12" } relativt per intervall (sämst { "6.0e-14" }); inspelningar med sigmf-python { "1.13.0" } avkodade bit-identiskt; cratets metadata giltig mot schemat för SigMF { "v1.2.6" }. IQ-syntes och dess modelljämförelser ligger utanför.

seg-a7756d2e124a = <b>Anpassning av LEO broadcast-efemerid och SISRE mot anpassningsintervall</b> (Measured), avgränsad till Kepler-anpassningen med 16 parametrar och dess SISRE enbart för banan: precisionsbanor från TU Graz ITSG för fyra satelliter mot statistiken hos Liu et al. { "2025" }, komponenter inom 1.5x ({ "0.804" } till { "1.087" }) och SISRE inom 1.5x ({ "0.716" } till { "0.809" }).

seg-99debd58724a = Fynd

seg-3f5b2f54c7bf = Den oberoende referensen stämde inte med dessa rader, så de förblir MODELLED. Varje fynd skrivs också in i radens referenstext (och därmed i <c1/>), med ett test som låser det.

seg-e28fac875d8c = <b>Skattning av klocktillstånd ombord:</b> på undanhållna IGS-klockor för { "11" } GPS Block IIF-satelliter är filtret med tre tillstånd konsistent ett steg framåt men överoptimistiskt vid en timme på { "9" } av { "11" } (periodiska termer och flicker-termer finns inte i modellen).

seg-5900ce454dc7 = <b>Detektering av spoofing:</b> på JammerTest { "2024" } larmade ingen monitor på observabelnivå inom { "10" } s för någon av de { "8" } publicerade starterna, och tre fönster före start bar falsklarm.

seg-08b6e6aa7d08 = <b>Skyddsnivå för tid under spoofing:</b> det uppmätta oupptäckta tidsfelet överstiger TPL vid { "3" } av { "8" } detekterade starter (1.9x till 5.3x); en klockkalibrering på { "60" } s täcker inte vandringen hos mottagarens TCXO.

seg-a2f4df11d9cc = <b>Uppskjutningsfönster och stigningsgeometri:</b> mot Orekit { "12.2" } stämmer geometrin till avrundning, men hastigheten hos platsen på grund av jordens rotation missar { "1e-6" } relativt vid { "62.9" } graders latitud ({ "1.12e-6" }, den polrörelse som den sfäriska modellen utelämnar). Runda { "2" }: hastigheten med sann pol och epok stämmer, standardhastigheten utan epok missar fortfarande (se nedan).

seg-f6b6c9251a17 = <b>Ballistisk korridor vid återinträde (Allen–Eggers):</b> den förutsagda toppretardationen för Stardust-återinträdet är { "61.8" } g mot rekonstruerade { "32.89" } g (+{ "88" } %, tolerans { "15" } %).

seg-5d83648dd867 = <b>Gemensamt fel i UT1 och polrörelse:</b> mot noggrannhetsformeln som skrivs ut i { "178" } nummer av IERS Bulletin A stämmer polen inom 1.5x men UT1 gör det inte ({ "0.48" } vid { "10" } dagar, { "1.59" } vid { "40" } dagar). Ersatt i runda { "2" }: raden är nu VALIDATED (se nedan).

seg-98a99bcba894 = <b>Offline standardindata för jordorientering:</b> astropy bekräftar radantalet, men de { "12" } rader som craten kallar Bulletin A-prediktioner är flaggade som uppmätta (I), inte förutsagda (P). Samstämmighetssiffrorna för raden för den operativa prediktorn var därför mot uppmätta rader. Ersatt i runda { "2" }: motorn klassar rader efter flagga och raden är VALIDATED.

seg-d96fbfa4be79 = <b>Fel i prediktion av jordorientering i operativ stil:</b> prediktorns UT1-fel är 2.4x till 12.6x Bulletin A:s vid { "1" } till { "10" } dagar och { "5.32" } ms vid { "10" } dagar, utanför intervallet { "0.36" } till { "3.13" } ms för 2:a EOP PCC.

seg-1833bf6e3b6f = <b>VLBI för månens geodesi:</b> mot ljustider från ANISE genom DE440 ligger ingen fördröjning inom { "1" } ps; det största gapet är { "24" } µs, mestadels månens analytiska centrum (omkring { "200" } km från DE440). Runda { "2" }: kernelvägen är VALIDATED i en egen rad; den analytiska vägen förblir MODELLED.

seg-0ec8a2a91702 = <b>Interoperabilitetsexport för månen:</b> Orekit { "12.2" } vägrar tidssystemen LTC och TCL, så utbyte av månens OEM-filer med en andra läsare är inte etablerat.

seg-09cfd4e61b7b = <b>Clohessy–Wiltshire-relativrörelse:</b> mot Orekits olinjära rörelse vid { "100" } m är gapet { "1.2" } till { "6.3" } mm, över { "1" } mm; det skalar som den utelämnade termen av andra ordningen, så toleransen som fastställdes i förväg låg under linjäriseringsfelet. Ersatt i runda { "2" }: korrektionen av andra ordningen är VALIDATED mot samma tröskel.

seg-af1bdd974ba5 = <b>Felväxt vid INS/TRN utan stöd:</b> mot en fritt tröghetsbaserad Monte Carlo i NaveGo håller tillväxtlagarna inom { "5" } % till { "600" } s och överskattar bortom det (2.2x till 8x vid en timme), eftersom de utelämnar Schuler-återkopplingen. Ersatt i runda { "2" }: Schuler-felmodellen är VALIDATED.

seg-8459bc50f8b4 = <b>Servicevolym på månen från verklig konstellationsgeometri:</b> { "4" } av { "12" } publicerade tillgänglighetsstatistiker skiljer sig med mer än { "2" } procentenheter (upp till { "22.5" }).

seg-7a0fd1377b9c = <b>Övre gräns för bias i spårbarhet för heterogen UTC(k):</b> på { "105 024" } BIPM-rader överskrids den övre gränsen av { "50.8" } % av raderna; den publicerade osäkerheten avgränsar BIPM:s mätning av förskjutningen, inte själva förskjutningen.

seg-814acf34cffd = <b>Klassificering av nollrum för månens datum:</b> på den publicerade geometrin med fem reflektorer är korrelationen -0.78 mot -0.97, och CRLB för origo är { "96" } till { "98" } % under artikelns.

seg-da01b5e08a87 = <b>Substrat för månens LLR-datumgeometri:</b> mot { "192" } ILRS-normalpunkter för månen från { "2024" } var RMS för enkelriktat residual { "96" } m med den tidigare orienteringsinterpoleringen och är { "22.7" } m efter rättningen nedan, fortfarande över tröskeln på { "10" } m (avrundade stationskoordinater, ingen polrörelse). Orienteringsserien klampar tyst utanför 2024-2025. Runda { "2" }: modellen för uppmätt avstånd är VALIDATED i en egen rad ({ "2.81" } m); serien täcker nu 2014-2030 och ger fel utanför den.

seg-fd9ad94680e9 = <b>Koppling mellan relativistisk klockhastighet och ramen:</b> självpotentialtermen är { "3.18e-4" } över det publicerade värdet (tolerans { "1e-4" }); artikeln utvärderar en annan potential, så inget publicerat värde finns för denna slutna form. Ersatt i runda { "2" }: ekvatorialpotentialen av grad 2 är VALIDATED mot samma artikel.

seg-e002819c1e2d = <b>Fysikaliska konstanter för varje kropp i solsystemet:</b> { "12" } av { "84" } konstanter för de tillagda kropparna skiljer sig från NAIF pck00011 och gm_de440 (äldre element för Mars månar; andra GM-lösningar för Uranus, Neptunus och Pluto). Runda { "2" }: konstanterna följer nu NAIF (en transkription, räknas inte), och den beräknade orienteringen stämmer med SPICE; raden förblir MODELLED.

seg-e722d242e78e = <b>Valbara efemeridmodeller för LEO:</b> anpassningen med 22 parametrar lämnar 1.71x och 1.86x det publicerade felet längs banan på bågar på { "20" } min, över 1.5x. Ersatt i runda { "2" }: modellen med 22 parametrar och dess anpassning är VALIDATED i en egen rad.

seg-c136023752df = <b>Gemensam positionsbestämning med GNSS och LEO:</b> bias mellan system stämmer med RTKLIB, men { "93.2" } % av epokerna ligger inom { "3" } m från ITRF2020 mot { "95" } %; RTKLIB själv når { "88.2" } % på data ({ "93.6" } % efter rättningen av gruppfördröjning i runda 2).

seg-e5f0e3c21def = <b>Blindhet för gemensam mod i integritet</b> och <b>täcknings- och DOP-kartor:</b> båda jämförelserna lyckades men avvisades vid granskning eftersom en medvetet felaktig motor också klarar dem (den första kontrollerar bara en intern identitet; de publicerade golven för den andra kan inte se en fördubblad PDOP). Runda { "2" }: blindhet för gemensam mod i integritet är VALIDATED på indata med paritet; täckningskartorna förblir ett fynd (se nedan).

seg-688e1753cd53 = Valideringsrunda { "2" }

seg-b320fbdb72c3 = Den andra rundan tog varje rad som den första rundan lämnat som möjlig att ta vidare, med nya förhandsregistreringar incheckade innan någon fixtur hämtades eller någon oberoende referens kördes, en motstridig andra granskare som körde om varje jämförelse och en avsiktlig mutation i motorn som måste göra varje test rött. Ägaren godtog den rättade formuleringen för raden om gränsen utanför Omega den 2026-10-02 innan den flyttades upp (dess gamla text motsade koden).

seg-7b7c584caaaf = <b>Uppflyttade till VALIDATED ({ "17" }).</b> Typ av referens inom hakparentes; tolerans fastställd före körningen.

seg-555e6ad454d2 = <b>Koppling mellan relativistisk klockhastighet och ramen</b> (Reference): Ashby och Patla { "2024" } L_m inom { "2.8e-6" } (tröskel { "1e-4" }) från ekvatorialpotentialen av grad 2 för de två fält som artikeln citerar; pyshtools gravitation av grad 350 för den radiella posten ({ "8.3e-5" }); DE441 månens hastighet ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Offline standardindata för jordorientering</b> (Library): astropy { "8.0.1" } och IERS Bulletin A nr { "039" } bekräftar de { "30" } slutgiltiga, { "54" } snabba och { "90" } förutsagda raderna i det omskurna utdraget.

seg-b77253dd26b5 = <b>Gemensamt fel i UT1 och polrörelse</b> (Library): fulla rotationer i astropy och pyerfa återskapar den gemensamma tabellen (UT1 och pol inom { "6e-16" }, kombinationen inom { "1.9e-7" }); de realiserade felen i IERS Annual Report { "2019" } ger kvoter { "1.001" } till { "1.100" }.

seg-378414f812c1 = <b>Fotavtryck och täckning för EO-nyttolast</b> (Library): Orekit { "12.2" } och GeographicLib { "2.1" } vid varje tröskel fastställd i förväg, med J2-nodregressionen nu i nodavståndet.

seg-792bf58a1c1e = <b>Clohessy–Wiltshire-relativrörelse</b> (Library): med en korrektion av andra ordningen i sluten form, inom { "1.2e-7" } m från Orekits olinjära rörelse mot { "1e-3" } m; enbart den linjära matrisen förblir karakteriserad ({ "1.2" } till { "6.3" } mm).

seg-423437d90022 = <b>B-plansstyrning och gravitationsassistans med patched conic</b> (Library): GMAT R2026a B-plan, asymptoter, C3 och heliocentriska element; sbpy { "0.6.0" } och Kasuga och Jewitt { "2019" } för Tisserand-parametern.

seg-b29b0dfcd3a4 = <b>Felväxt vid INS/TRN utan stöd</b> (Library): en Schuler-felmodell med nio tillstånd inom { "5" } % från korrigerade körningar utan stöd i NaveGo vid alla { "48" } punkter (sämst { "3.70" } %).

seg-8cc49496b4c6 = <b>Blindhet för gemensam mod i integritet</b> (P2): numpy <c1/> på { "1464" } indata med paritet inom { "1e-12" } (sämst { "1.06e-14" }).

seg-f0ff538b7329 = <b>Gemensam banbestämning och klocka på månen med flera tekniker</b> (P2): numpy räknar om varje Gauss-Newton-steg, sigma och stationsfel på sex nätverk (inom { "2.4e-11" }) efter en rättning av QR-lösningen.

seg-7ed9b059f888 = <b>Kovarians för stationskoordinater vid VLBI på månen</b> (Library): en Jacobian byggd med SPICE återskapar schemat, spektrumet, sigman och nollrummet inom { "1" } % och { "0.1" } grader; numpy till { "2e-13" }.

seg-0e4e1c3fc899 = <b>Oupptäckbar gräns för gemensam mod för residual utanför Omega</b> (P2, formulering rättad genom ägarbeslut): numpy LAPACK på { "256" } fall inom { "1e-12" }, sex exakta oändligheter.

seg-0fc8ce9cde6c = <b>Basinvariant klassificering av nollrum</b> (P2): SciPy och NumPy med snitt av underrum på { "72" } konstruerade matriser, heltal exakta, projektornorm inom { "6.0e-15" }.

seg-4e5e7a6072bc = <b>Enfrekvens-jonosfärs- och UTC-tjänster i ett LEO-navigeringsmeddelande</b> (Library): GNSSTk { "15.3.1" } för Klobuchar, Az och UTC-driften; ERFA för de tre skottsekundsfallen.

seg-a644bf49c816 = <b>Positioneringsgräns för 5G icke-terrestriskt nätverk</b> (P1): Bachl, Lei och Nabeel { "2026" } gränser för enkel SSB inom en halv utskriven siffra; numpy för kovarianserna för positionsbestämningen.

seg-b326f6fc55ad = <b>Modell för uppmätt avstånd vid LLR</b> (Measured, ny rad utbruten ur LLR-datumsubstratet): { "192" } ILRS-normalpunkter för månen vid { "2.81" } m RMS mot en tröskel på { "10" } m, med barycentrisk ljustid enligt IERS { "2010" }; komponenterna under tröskeln löses inte upp en och en, och raden säger det.

seg-82e9fba684dc = <b>VLBI för månens geodesi, kernelväg</b> (Library, ny rad utbruten ur raden för VLBI på månen): SPICE konvergerade ljustider inom { "1" } ps och partialer inom { "1e-6" } vid epoker nära J2000; den analytiska standardvägen förblir MODELLED.

seg-03c47d262ff3 = <b>Liu et al. { "2025" } LEO-efemeridmodell med 22 parametrar och dess anpassning</b> (Measured, ny rad utbruten ur raden för valbara modeller): verkliga precisionsbanor inom 1.5x av den publicerade statistiken på artikelns dagar och undanhållna dagar ({ "0.683" } till { "1.186" }); skalkonventionen för n_dot är transkriberad och inte validerad av denna jämförelse, och stoppregeln är Kshanas regel om parameterkonvergens, inte artikelns regel om RMS-förändring. ATOMIC-polynomet och tabellen med fem höjder förblir MODELLED.

seg-b49f96eb52ad = Befintliga VALIDATED-rader med ny grund (ingen ändring av antal).

seg-4e26bec3297c = <b>Planetpositioner från JPL Standish-elementen</b> och <b>ljustid mellan kroppar i solsystemet</b>: de efterhandsfastställda trösklarna på två gånger nominellt ersätts av jämförelser fastställda i förväg med JPL Horizons DE441 (RMS högst värdet i tabell { "8.10.1" } i Explanatory Supplement, sämst { "0.778" }, inklusive jorddelningen och ICRF-rotationen; ljustider inom { "1e-6" } s från Horizons på DE441-positioner, sämst { "6.7e-9" } s). Deras flaggor "gräns satt efter jämförelsen" tas bort.

seg-d3b745392d29 = <b>Integritet (RAIM/ARAIM/SBAS)</b>: raden vilar inte längre på rimlighetskontroller. Den säger nu: lösningsseparationen med flera hypoteser för ARAIM i ADD v4.2 stämmer med Stanford MAAST för ARAIM { "2" } på { "270" } verkliga fall (sämsta VPL-skillnad { "2.2e-3" } m mot { "0.05" } m); detektering och exkludering i ögonblicksbilds-RAIM stämmer med RTKLIB <c1/> i { "2016" } av { "2016" } beslut, med skyddsnivån för lutning inom { "2.7e-12" } m; SBAS DO-229E L1-skyddsnivåerna stämmer med Stanford MAAST på verkliga WAAS-sändningar ({ "2868" } par inom { "1.6e-5" } m). Den anger tydligt att funktionerna med enhetlig sigma <c2/> och <c3/> INTE är ADD-konforma (gap vid matchade indata 0.75/4.04 m och 0.39/1.93 m VPL/HPL, ett fynd), att jämförelsen för DFMC L5 SBAS är ett fynd ({ "308" } par utan GEO i sikte skyddas av Kshana och inte av MAAST) och att <c4/> saknar extern jämförelse. Dess självflagga tas bort.

seg-d059b9953c3f = <b>Anpassning av broadcast-efemerid för LEO</b>: den integrerade referensbanan läggs till i den validerade delen (Orekit { "12.2" } inom { "4.55" } mm över { "6" } h, tröskel { "2" } cm); korrektionspolynomen, klockanpassningen och avvägningen för uppdateringsperiod förblir modelled.

seg-166d511bbba3 = <b>Fynd och blockerade rader (förblir MODELLED).</b> Varje rads referenstext bär fyndet och dess låsta test.

seg-7f233dbdf110 = Modulation av navigeringssignaler (Betz { "2001" }, Hein { "2006" }): spektra och korrelationer stämmer; sidolober vid { "24" } MHz och varje flervägsbias ({ "11" } till { "15" } % låg) gör det inte, orsaken olöst.

seg-4d5a6bb44d64 = TDOA/FDOA-geolokalisering: gränserna stämmer med Ho och Chan och Ho och Xu, och med författarnas kod till { "3e-12" }; Ottawa-faktorerna som skrivs ut från en Monte Carlo skiljer sig med { "1.3" } % och { "4.4" } %.

seg-5fa189f788ca = GNSS från jorden på månavstånd: GENESIS medelvärden i zenit stämmer med Montenbruck et al. { "2023" } på { "5" } av { "6" }; medelvärden i nadir är { "1.0" } till { "2.4" } satelliter för höga.

seg-d7e5b5a64f43 = Täcknings- och DOP-kartor: utformningar för jorden stämmer med Orekit, gnss_lib_py och numpy vid varje tröskel; utformningar för månen och Mars överskrider { "1e-9" } bara på nära singulära celler.

seg-3c8fb07d83ec = Gemensam GNSS-positionering: dubbla frekvenser { "79.9" } % och precisionsprodukter { "94.2" } % inom { "3" } m mot { "95" } % (RTKLIB { "67.9" } % och { "94.1" } %); ISB-gapet för precisionsprodukter beror på att RTKLIB ignorerar antennförskjutningar.

seg-5d3d4d99fbc4 = Spårningsslingor (GNSS-SDR { "0.0.19" }): stämmer vid { "35" } till { "45" } dB-Hz; vid { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, trösklar +{ "1.5" } dB; tider för cykelglapp { "0.5" } till { "2" } dekader kortare.

seg-0dd24947169c = Servicevolym på månen (Orekit och Hipparchus): { "155" } av { "160" } värden stämmer; kravet för sämsta sampel misslyckas på nära singulär geometri hos LNCSS B.

seg-74002245287f = Kvanttröghetssensor: golvet med endast QPN är { "21" } till { "31" } % under Gauguet { "2009" } uppmätta brus (tröskel { "30" } %, missad med { "0.5" } punkter).

seg-ab8b17cf325e = Oscillatorförinställningar: uppmätta enheter överskrider förinställningarna för holdover hos rubidium, kort sikt hos cesium och CSAC för sämsta enhet; förinställningen för OCXO har ingen uppmätt post.

seg-81ad9b839a28 = Densitet från rymdväder: Jacchia { "1971" } ligger inom en faktor { "2" } från accelerometerdensiteter vid solmaximum men omkring 1.7x för tät i minimet { "2008" }.

seg-68e5d0942847 = Geometrifri sned TEC: { "33" } av { "36" } bågar inom { "3" } TECU från CODE-kartan (sämst { "6.84" }).

seg-f410ce9cf195 = Detektering av spoofing och TPL mot den officiella loggen från JammerTest { "2024" }: { "4" } av { "10" } starter detekterade i tid; TPL överskrids vid { "4" } av { "10" }.

seg-41eb2c318469 = Klockfilter på nya IGS-klockor: två av { "11" } satelliter misslyckas med kriteriet för innovationssumma.

seg-064b623e918b = Prediktor för EOP med minsta kvadrater plus autoregression: UT1 { "1.73" } till 2.11x Bulletin A vid { "2" } till { "10" } dagar.

seg-d98571cc21f4 = Övre gräns för realiserad förskjutning hos UTC(k): sammanlagd frekvens av överskridanden { "0.0333" } mot { "1e-2" }.

seg-527aca91ec7c = Datum för månens ram från en kampanj: SPICE-delen stämmer; delen P2 med skattade stationer missar { "1e-9" } på ett problem med kondition 2.1e8.

seg-9805c4c821f9 = Datum för månens ram från verklig LLR: { "15" } av { "16" } siffror stämmer med SPICE; sigma för z-translationen är { "1.03" } % hög mot { "1" } %.

seg-08e6c541b59e = Återinträde (Allen-Eggers): lösningen med punktmassa stämmer med myndigheters rekonstruktioner (enbart en korskontroll); jämförelsen med accelerometer är blockerad i väntan på en läsbar källa för Hayabusa2.

seg-0bb78ffbd915 = ITU-T-masker: de utskrivna räknade värdena stämmer; klassgränserna i G.8273.2 har inga (blockerad).

seg-308c1bca3fd9 = Geometri för uppskjutningsfönster: hastigheten hos platsen med sann pol och epok stämmer med Orekit ({ "4.9e-8" }); standardhastigheten utan epok missar fortfarande ({ "1.12e-6" }). Inte uppflyttad; uppföljning väntar.

seg-f0b7c3d60df8 = Fysikaliska konstanter för varje kropp: nu skiljer sig { "0" } av { "84" } från NAIF (en transkription), och den beräknade orienteringen stämmer med SPICE till { "1.4e-10" } rad. Inte uppflyttad; uppföljning väntar.

seg-a5a787c9a761 = Blockerade i väntan på ett avgränsningsbeslut av ägaren, var och en med sin stämmande jämförelse incheckad: absolut observerbarhet för stationer på månen, DOP för beacon på ytan, exporten utanför boresight, detekteringseffekt över modaliteter, konsistensstatistiken för gemensam mod och polär LEO-täckning.

seg-cf638ec9878b = Blockerade i väntan på data: felbudgetering för tidsöverföring (kräver en reduktion av verkliga data), C/N0 i JammerTest (antennposition och effektfördelning är inte dokumenterade).

seg-e8709509eef3 = Revisioner (publicerade siffror som flyttades, gammalt -> nytt).

seg-5e93ab237b15 = Skyddsnivåerna i <c1/> ligger nu på den geodetiska lokala nivån i stället för den radiella: upp till { "0.31" } m HPL och { "0.14" } m VPL vid ABMF ({ "16" } grader N); inget golden flyttades, men den inspelade sammanfattningen i handledningen <c2/> flyttas från medel-HPL { "22.1" } m / VPL { "40.0" } m till { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Standardvärden för koppling mellan månens hastighet och ramen: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } per meter.

seg-8ac9cb8c5631 = Offline standardkörning för EOP (<c1/>, celler listade i <c2/>): predicted_rows { "12" } -> { "90" }; polgolv { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; raderna i tabell { "2" } i <c3/>; samstämmighet hos den operativa prediktorn 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

seg-dd93329245ba = SISRE för liu22 i <c1/> bana/med klocka: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

seg-e4205dfdb0d2 = Liu-höjdtabell, Kshana (kvot): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = Skalan för <c1/> i LEO-navigeringsmeddelandet { "2" }^-60 -> { "2" }^-58 (inte fastställd i förväg, redovisad; utanför anpassningsjämförelsen); ramens CRC för liu22-exemplet 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = Verifieringstabell i <c1/>: raden för Liu och ATOMIC delades i en VALIDATED rad med 22 parametrar och en MODELLED rad för ATOMIC och fem höjder.

seg-537f5d80b66c = Radtext för orienteringen av månens huvudaxlar enligt DE440: spann 2024-2025 / { "731" } rader -> 2014-2030 / { "6 209" } rader; "klampar tyst" -> ger fel utanför sitt spann.

seg-17a5dd090566 = Scenariot <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nya fält inclination_deg ({ "98.19" }) och nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (referensklockan för TDOP/GDOP är nu den lägst numrerade konstellationen i sikte): globalt GDOP max { "2.2236" } -> { "2.1205" }, medel { "1.122" } -> { "1.131" }, median { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, och GDOP-kartan per cell; mean_visible_by_constellation summerad som heltal (omkring { "1e-12" } relativt, osynligt vid { "4" } decimaler).

seg-e48b212c4881 = Gemensam GNSS-positionsbestämning med en frekvens efter rättningen av gruppfördröjning i broadcast: { "93.2" } % -> { "93.6" } % inom { "3" } m; ISB-median -0.351 -> -0.114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costas-slinga SNR rho/4): vid tröskeln { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; vid { "25" } dB-Hz { "9.55" } -> { "1.60" }; vid { "22" } dB-Hz { "2.24" } -> -0.14.

seg-789a302679f7 = <c1/>: varje utdata flyttas med Schuler-felmodellen; TRN-toppen i det levererade scenariot { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = Rapporten <c1/>: ny nyckel geometry_path ("analytic" i standardkörningen, inget numeriskt värde ändrat); nya valfria fält planetary_kernel_path, earth_orientation_kernel_path och moon_orientation_kernel_path, med epoch_partials på kernelvägen; typens beskrivning är omskriven. Den oberoende referensen för kernelvägen i verifieringsraden är SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) blir en korskontroll av kernelutvärdering.

seg-3631a31e7b26 = Kroppskonstanter: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptunus { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); Phobos ekvatorialradie { "13.1" } -> { "13.0" } km; Phobos och Deimos pol och nollmeridian från pck00011; prime_meridian_deg för solsystemet innehåller nu de kvadratiska och periodiska termerna.

seg-ac1251d7a0fd = <c1/> (<c2/> på Europa), från den fullständiga orienteringen av Europa i pck00011 (7cfd66b4; orienteringen stämmer med SPICE pxform till { "1.4e-10" } rad), vilket flyttar landaren i tröghetsrummet: tillgänglighet endast reläer / med jordavståndet { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } av { "171" } epoker endast reläer), median-PDOP { "5.266" } -> { "5.360" }, RMS för positionsfel { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, median för formell sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tabellen i <c3/> och låsningen i <c4/> följer; <c5/> är oförändrad.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), den kalibrerade faktorn ersatt av Jacchia { "1971" }: activity_density_kg_m3 vid 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k borttagen, mean_exospheric_temperature_k tillagd ({ "1186.7" } K); <c2/>: solcykelsvängningen vid { "800" } km är nu 10.4x (NRLMSISE-00 13.6x) och höjdpåståendet följer NRLMSISE:s ökning till { "500" } km och fall vid { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (sammanfattningstexten oförändrad vid { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (QR-lösning): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> sänds ut på nytt för de nya och borttagna fälten ovan.

seg-717c51e1cca0 = Valideringspaket

seg-4ec44f8a5f8e = D12, utökad precision och en kvadratrotslösare (två nya VALIDATED-rader: { "226" } -> { "228" } rader, { "110" } -> { "112" } validated).

seg-d28005966948 = Del { "1" }, oberoende referens med utökad precision:

seg-9a5f94973450 = Datum för månens ram med stationerna skattade: en oberoende referens med utökad precision på 50 siffror i mpmath (förhandsregistrerad 804662d5, konditionsskalade trösklar från en a priori-formel för bakåtfel) stämmer på ett nytt kampanjdatum (2026-03-18) och på det ursprungliga scenariot 2024-01-01; ny VALIDATED-rad under P2. Den avgör den tidigare tvisten med dubbel precision: motorns datumsigman avviker med upp till { "9.7e-6" }, NumPys vägar med invers och egenvärden med upp till { "6.2e-6" }, och dess vägar med Cholesky och QR med omkring { "1e-8" }. Motorn ligger inom sin felgräns men är omkring tusen gånger mindre noggrann än en väg med faktorisering.

seg-b055435a2138 = Referensmiljö: mpmath { "1.3.0" } tillagd.

seg-d0c2b2a8e635 = Revisioner: inga. Ingen golden-fil och ingen publicerad figur ändras; raden "Datum för månens ram från en observationskampanj" förblir MODELLED (grundarbeslut 2026-10-02, alternativ A: den lånar inte den separata radens status); dess testtext hänvisar till det nya testet och dess fynd.

seg-50b53908fb7c = Del { "2" }, datumlösare med kvadratrotsinformation:

seg-4c6089cfac5e = Ny valfri lösare med kvadratrotsinformation (<c1/>; <c2/> i scenariot lunar-frame-campaign): Householder-QR, marginalisering genom den triangulära faktorn, en Jacobi-SVD för spektrumet och kompenserade produkter enbart från korrekt avrundade operationer. Mot den oberoende referensen på 50 siffror (fastställd i förväg b41908c9) stämmer dess datumsigman till { "3e-13" } på ett nytt datum (2026-06-09); på indata från 2026-03-18 och 2024-01-01 avviker standardlösaren med upp till { "1e-5" }. Ny VALIDATED-rad under P2. Standardlösaren och dess utdata är oförändrade. Trösklarna som fastställdes i förväg kan bara styrka fel över omkring { "2e-7" } relativt: de förkastar standardlösaren men inte ett vänt Householder-tecken, en okompenserad skalärprodukt eller en spektral slutinvers, och raden säger det.

seg-de9aeb2adde0 = Valfria kvadratrotsvägar vid sidan av de oförändrade standardvärdena: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> och <c6/>, på nya <c7/> och <c8/>. Var och en stämmer med sin standard där båda är noggranna (en intern kontroll, ingen rad; ingen validering påstås för dem). <c9/> delegerar nu till en gemensam rutin; dess utdata och varje scenarios standardutdata är oförändrade.

seg-87a632404f32 = Rangbeslut i månens ramkampanj: en kontroll med utökad precision som fastställdes i förväg över { "40" } dagar bekräftar varje avgörbart stationsblock och varje Helmert-beslut med full rang. A priori-gränsen kan inte styrka de { "20" } rangdefekta Helmert-dagarna; i exakt aritmetik är deras defekt geometrisk, med tröskeln { "1e-9" } inom kampanjens naturliga intervall av egenvärdeskvoter. Ingen rad.

seg-3b24e7fa36bf = Påståendet för raden om kampanjen med utökad precision begränsas till "inom värstafallsgränsen", och dess kontroll av svagaste riktning med fasta stationer mäter nu en verklig vinkel ({ "6.6e-16" } rad; jämföraren ändrades från acos till en korda, tröskeln gjorde det inte).

seg-4fad02ab4b6d = Revisioner: inga. Ingen golden-fil och ingen publicerad figur ändras; raden "Datum för månens ram från en observationskampanj" är oförändrad och förblir MODELLED (grundarbeslut 2026-10-02, alternativ A).

seg-627d3357d620 = D4, JPL:s kärna av efemeridkärnor, fas { "1" } (fyra nya VALIDATED-rader: { "228" } -> { "232" } rader, { "112" } -> { "116" } validerade).

seg-30e8a645191f = NAIF-kärnläsaren har en egen rad.

seg-98ff121aa2a9 = <c1/> (DAF-behållare, SPK typ { "2" }, binär PCK typ { "2" }) stämmer med SPICE Toolkit (CSPICE N0067 till och med spiceypy { "8.2.0" }) och med ANISE { "0.10.6" } för alla { "600" } DE440-tillstånd och { "200" } rotationer av månens orientering i ett slumpmässigt rutnät som dragits ur förhandsregistreringens egen incheckningshash (abcd9133), inom trösklar som härletts i förväg ur Chebyshev-evaluering med dubbel precision (sämsta { "0.6" } % av tröskeln, { "1.95e-3" } m). Raden hävdar att motorn läser JPL-kärnor korrekt, inte att DE440 eller den analytiska serien är noggrann (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: DE440 (eller valfri SPK av typ 2) positioner genom motorns egen läsare, med tvådelade TDB-epoker och kärnans SHA-256 sparad för rapporter; den ersätter aldrig en planet med ett systemets masscentrum. <c2/> låter en geometrisökväg välja den analytiska serien (standard) eller en kärna.

seg-6c7dae98601e = <b>Frivillig kärn-måne för <c1/> och <c2/></b>: en nyckel <c3/> läser månens geocentriska centrum ur kärnan; inget annat ändras, och rapporten får ett block <c4/> som anger kärnan och dess SHA-256. Utan nyckeln är båda rapporterna byte för byte identiska med tidigare.

seg-74e8def84747 = <b>Kovarians för en punkt på månytan på kärnsökvägen</b> (ny VALIDATED-rad): med alla stationer fasta och fyrens position på DE440-månen stämmer fyrens kovarians med en SPICE-ljustidsjakobian (sämsta { "1.7e-3" } mot en tröskel på { "1" } %) och en NumPy-invers ({ "4e-14" } mot { "1e-9" }), förhandsregistrerad 4a51256 (<c1/>). Raden för den analytiska sökvägen förblir MODELLED: på den analytiska månen ligger fyrens minsta sigma { "3.9" } % under den oberoende referensen.

seg-55002d236ab0 = <b>Månens referenssystemsdatum från en verklig kampanj, kärn-månens centrum</b> (ny VALIDATED-rad): på { "447" } osedda normalpunkter från 2019-Q2, förhandsregistrerade 830d945a innan någon av dem hämtats, stämmer datumkovariansen på kärnsökvägen med den oförändrade SPICE- och NumPy-referensen inom { "7.6e-5" } mot trösklar på { "1" } % och { "2" } % (<c1/>). Grundaren beslutade att den här raden endast befordras på nya punkter; diagnostiken på redan sedda data (c51f8b2) är ett fynd, inte belägg. Tröskeln skiljer inte mellan månmodeller: den analytiska månen klarar också samma urval (sämsta { "3.8e-3" }), den planerade mutationen (kärn-månen en timme för sen) upptäcktes inte, och vid vikningen klarade även ett månens centrum som var cirka { "4,650" } km fel (månen tagen kring jord-måne-masscentrum) tröskeln. Raden hävdar kovariansen på den sökvägen, inte månens centrum, och säger så.

seg-f147f9257b8b = <b>Solens, månens, Merkurius och Venus positioner från DE440 vid UTC-epoker</b> (ny VALIDATED-rad): <c1/> stämmer med Skyfield { "1.54" } för { "600" } positioner mellan { "1973" } och { "2026" }, sämsta { "2.96" } m, inom en förhandsregistrerad tröskel (0bfafe6d) som sätts av tvåtermsserien TDB − TT (<c2/>). Planetpositioner får nu den nya kärnraden; Standish-raden och raden för planeternas månar är oförändrade, och månarna väntar på ett scenario som behöver dem (grundarens beslut).

seg-bb840641c655 = Fynd: det enda missen i jämförelsen av LLR-datum (z-translationens sigma { "1.025" } % mot { "1" } %) sjunker till { "0.049" } % när bara månens centrum läses ur DE440, på redan sedda data (<c1/>); på det nya urvalet från { "2019" } klarar även den analytiska månen tröskeln, så missen från { "2015" } var marginell för det kvartalets geometri. De analytiska raderna "Lunar frame datum from a REAL observing campaign" och "Lunar-surface-point coordinate covariance … kept distinct from the Earth-station one" förblir MODELLED; deras texter om oberoende referens pekar nu på kärnsökvägens rader.

seg-64c9f3b96392 = <c1/> säger inte längre att motorn saknar en läsare för binära kärnor; den pekar på läsarraden och förklarar varför rymdfarkostkärnor (typerna { "13" } och { "21" }) fortfarande kommer via Horizons.

seg-841deceb80e6 = Ändringar: inga. Ingen golden-fil, publicerad siffra eller befintligt testvärde ändras; de analytiska rapporterna <c1/>, <c2/> och <c3/> med alla stationer fasta är byte för byte identiska med tidigare (prefix för resultatets SHA-256 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, uppmätt klockbibliotek "Clock Atlas" (tre nya rader, en VALIDATED: { "232" } -> { "235" } rader, { "116" } -> { "117" } validerade).

seg-1f8644486f5d = <b>Uppmätt klockbibliotek (<c1/>).</b> Enhetskort (vit fas, vit, flicker- och slumpvandringsfrekvensmodulation, en linjär frekvensdrift och, som tillval, fasterm med en till fyra perioder per varv) anpassade till en namngiven uppmätt klockregistrering och bedömda på undanhållna data; luckmedvetna Allan- och Hadamard-varianser; en konditioneringsdetektor som loggar varje lucka, fasutstickare, fassteg, skur och frekvenssteg och inte vet något om fil- eller dygnsgränser; omvandling av ett kort till brusmodellen för slottidtagning, den utökade Kalman-klockmodellen och brusnivåerna för spoofing-övervakaren. Läsare för RINEX- och IGS-klockfiler, BIPM:s laboratoriefiler och Circular T avsnitt { "1" } (<c2/>); en poolad, hierarkisk åldringsgräns för UTC(k) (<c3/>, ännu inte bedömd).

seg-93add052ae56 = <b>Identifiering av brus med lag-1-autokorrelation</b> (<c1/>, Riley och Greenhall { "2004" }), ny VALIDATED-rad (Library): stämmer med allantools { "2024.6" } <c2/> på { "140" } fall, heltalen identiska, sämsta skillnad { "9.6e-13" } mot en tröskel på { "1e-9" } (förhandsregistrerad 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Uppmätta enhetskort med förutsägelse på undanhållna data</b>, ny MODELLED-rad (ett fynd): anpassa på en tredjedel, förutsäg Allan-deviationen för de andra två tredjedelarna inom en faktor { "1.5" } (förhandsregistrerad 2ec76864). GPS Block IIF på ett nytt IGS-fönster (2026-03-01 till { "14" }): { "10" } av { "11" }; G27 är optimistisk på tvåtimmarsskalan (sämsta faktor { "1.510" }). Cesium (inom, { "1.070" }), OCXO (utanför, { "2.348" }) och strontium (inom) redovisas, inte blint. Mottagarkortet för JammerTest samt korten för Galileo-masern och Deep Space Atomic Clock är blockerade. En modellklass för ZED-F9P-mottagarens TCXO på { "12" } statiska stationer i Wroclaw (Zenodo { "6488497" }) misslyckas: { "1" } av { "11" } blinda stationer i en redovisad rättad omkörning (<c1/>, <c2/>).

seg-26fa898f6272 = <b>GPS Block IIF-kort med termer per varv</b>, ny MODELLED-rad (ett fynd): på ett andra nytt fönster (2026-04-01 till { "14" }) klarar { "9" } av { "11" } tröskeln; G03 ({ "1.947" }) och G25 ({ "1.581" }) är optimistiska eftersom deras undanhållna registreringar är brusigare än anpassningstredjedelarna; om de periodiska termerna tas bort misslyckas alla { "11" } (förhandsregistrerad fb475550; <c1/>).

seg-ef456da29319 = <b>M002, tillståndsskattning av klockan ombord, runda { "3" }</b> (ett fynd, förblir MODELLED): efter den frysta konditioneringsdetektorn uppfyller det utökade filtret från runda 2, med oförändrad inställning och oförändrade kriterier, (a) och (c) för alla { "11" } satelliter för första gången; (b) misslyckas för G09 ({ "0.894" }) och G26 ({ "0.876" }) (förhandsregistrerad fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, upptäckt av spoofing, rundorna { "3" } till 4b</b> (förblir MODELLED): runda { "3" } blockerades ({ "167" } träningsepoker från JammerTest-enhetens övriga sessioner mot { "3600" }); med ett modellklasskort för ZED-F9P (rundorna { "4" } och 4b) ger klockövervakaren noll falsklarm före start vid alla { "10" } loggade starter (runda { "2" }: { "86" }) och { "6" } av { "10" } starter upptäcks inom { "10" } s (runda { "2" }: { "4" }); samma fyra förblir sena (<c1/>).

seg-79757abc69e3 = <b>M083, överbound för UTC(k), runda { "3" }</b>: förhandsregistrerad prospektivt (fb475550) på Circular T-utgåvor från { "465" }, ännu inte körd (<c1/>).

seg-09abf996ed16 = Miljö för oberoende referens: Wroclaw ZED-F9P-registreringen är datastyrd under <c1/> (CC BY { "4.0" }, cirka { "1.5" } GB); IGS-klockfixturerna medföljer (IGS-produkter, med erkännande av källan).

seg-b05fa0811a3e = Ändringar: inga. Ingen golden-fil, publicerad siffra eller befintligt testvärde ändras; M001 (återförankring av holdover) åtgärdas inte eftersom ingen klockklass befordrades.

seg-986f4075210b = D8, en validerad sökväg för propagering, referenssystem och tid (tre nya VALIDATED-rader och M131 befordrad: { "235" } -> { "238" } rader, validerade { "117" } -> { "121" }).

seg-d7a612528765 = De jordbaneslag som tidigare hade egna modeller för tvåkroppsproblem, sekulär J2 eller enbart sideral tid delar nu en sökväg: SGP4/SDP4-elementuppsättningar med tvådelade juliska datum, förda till GCRS och ITRS (International Terrestrial Reference System) genom IAU-kedjan (International Astronomical Union) 2006/2000A, med valfria parametrar för jordens orientering.

seg-016507ccdb8f = Ny <c1/>, <c2/>, <c3/>, <c4/> och <c5/>; <c6/> och <c7/> tar tvådelade epoker. Ny <c8/> (SOFA-konventionen <c9/> för skottsekunddagar), <c10/>, <c11/>, <c12/> (via TAI, som SOFA <c13/>), <c14/> och en tvådelad <c15/>.

seg-158c39fff817 = Polarläget i <c1/> propagerar med SGP4 vid 2026-01-01T00:{ "00" }:{ "00" } UTC på IAU-kedjan (<c2/> tar valfri epok); SGP4-Walker-generatorn roterar till det jordfasta systemet genom IAU-kedjan.

seg-86ecad91a601 = Slaget <c1/> kör en ny prediktor för skenbara överflygningar (<c2/>, <c3/>): SGP4 på IAU-kedjan, refraktion enligt ITU-R P.834-9 och nedlänkens ljustid (nya brytare <c4/> och <c5/>, påslagna som standard), parametrar för jordens orientering (<c6/>, <c7/>, <c8/>, standard { "0" }), passeringar lösta till { "1e-7" } s och kulminationen med gyllene-snittet-sökning. Den geometriska <c9/> är oförändrad.

seg-9ce091899bf1 = <c1/> hindrar paketets geometri-, tids- och propageringskärnor från att bära en privat keplersk propagering, sekulära J2-takter eller en rotation som bara bygger på sideral tid; namngivna snabba nivåer och fysik som är en rads ämne är motiverade undantag.

seg-cf4ae964c5d1 = Ny VALIDATED-rad "Two-part Julian dates and leap seconds on the Earth-orbit time path": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> på { "224" } tidpunkter kring alla { "27" } skottsekunder inom { "1e-6" } s (förhandsregistrerad e947e69d); sämsta { "1.9e-11" } s.

seg-c0dec16ea932 = Ny VALIDATED-rad "One Earth-orbit path": TEME-positioner för { "232" } elementuppsättningar mot python-sgp4 { "2.24" } (Vallados referens-SGP4) inom { "6.1e-8" } m (tröskel { "1" } cm), samt rotationerna GCRS -> ITRS och TEME -> ITRS mot ERFA <c1/>, <c2/> och <c3/> inom { "2.9e-6" } mas och { "0.41" } mas (trösklar { "0.1" } och { "2" } mas), med parametrar för jordens orientering (förhandsregistrerad 72ea9eb0). Redovisat: den första körningen misslyckades vid 2016-12-31T23:{ "59" }:{ "59.5" } med en sekunds rotation; UT1 hade tagits från UTC:s kvasijuliska datum på en skottsekunddag, motorn går nu via TAI, och den andra körningen stämmer vid oförändrade trösklar.

seg-a72ccdc2516e = M131 "LEO coverage and dilution of precision for polar and Arctic users against MEO GNSS" blir VALIDATED: Orekit { "13.1.8" } tar motorns GCRS-tillstånd, roterar dem och beräknar sikt och DOP (NumPy för grupper med flera klockor); positioner inom { "6.8e-5" } m (tröskel { "0.2" } m), antal satelliter i sikte identiska för 4040/4040 prover, median-DOP inom { "2.3e-11" } relativt.

seg-db498ac8e135 = Ny VALIDATED-rad "Apparent ground-station pass prediction with refraction and light time": Orekit { "13.1.8" } propagerar samma elementuppsättningar i ett TEME som det bygger enligt den angivna definitionen, med refraktion enligt ITU-R P.834 och dess mätmodell för ljustid, över { "60" } fall vid stationer på havsnivå: { "1210" } passager, passeringstider inom { "3.4e-6" } s (tröskel { "5" } ms), maximal elevation inom { "5.5e-7" } grader, skenbar riktning inom { "8.8e-7" } grader (tröskel { "1e-4" } grader).

seg-ab87bb0ee63d = Fynd, hålls fastlåsta: de första jämförelserna av hela påståendet mot Orekit från början till slut missade sina trösklar för position och riktning, inte på grund av motorn utan för att Orekit { "13.1.8" }:s SDP4 avviker från referens-SGP4 för cirkulära (e = { "0" }) djuprymdsbanor (upp till { "67" } m) och dess standard-TEME bygger på IERS { "1996" }-nutationen (IAU { "1980" }), cirka { "72" } millibågsekunder från IAU-kedjan 2006/2000A ({ "2.7" } m i LEO). Orekits ITU-R P.834-koefficient för h*theta0^{ "2" } är { "0.011380" } där rekommendationen anger { "0.01380" }; jämförelsen sker vid havsnivå, där termen försvinner, och skillnaden ovanför är fastlåst.

seg-49978e6a73b2 = "Ground-station pass prediction (ground segment)" förblir VALIDATED med sitt påstående avgränsat till den geometriska <c1/>; slaget <c2/> hör till den nya raden.

seg-60d6ac0011f1 = Miljö för oberoende referens: Orekit { "13.1.8" } med Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Ändringar: medföljande <c1/> total åtkomsttid { "1675" } s -> { "1659" } s (fem passager som tidigare; bästa maximala elevation { "73.25" } grader -> { "70.08" } grader), och varje utdata från <c2/> flyttas med den nya sökvägen (den utskrivna raden i <c3/> och posten <c4/> i <c5/> säger nu det); medföljande <c6/> GNSS-VDOP vid ekvatorn { "1.19669" } -> { "1.19710" }, vid { "89.9" } grader { "1.50645" } -> { "1.50590" }, fusionerad VDOP vid { "89.9" } grader { "1.14388" } -> { "1.14250" } (de publicerade siffrorna med två decimaler { "1.20" }, { "1.51" } och { "1.14" } är oförändrade). Ingen golden-fil ändras.

seg-b65f3186a7e9 = Ännu inte dirigerat: <c1/>, lägena för doppler, gemensam lösning och tidssynkronisering i <c2/> samt referensbanan i <c3/> (deras modeller finns i <c4/> och <c5/>), och jordutformningar i <c6/> (en namngiven snabb tvåkroppsnivå).

seg-03f638f20376 = D6, LunaNet AFS-referensgenerator, LSIS V1.0 (fyra nya rader, två VALIDATED: { "238" } -> { "242" } rader, validerade { "121" } -> { "123" }).

seg-1d09f0582781 = <b>LunaNet Augmented Forward Signal (AFS)-referensgenerator</b> (<c1/>), fastlåst till LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 från { "29" } januari { "2025" } och med den versionen angiven i varje utdata: bärvågen { "2492.028" } MHz; AFS-I BPSK({ "1" })-datakanalen med { "500" } symboler per sekund och dess Gold-kod på 2046 chip; AFS-Q BPSK({ "5" })-pilotkanalen med primärkod av Weil-typ på 10230 chip, sekundärkod på 4 chip och tertiärkod på 1500 chip; ramidentifierare { "0" }-ramen (synkroniseringsmönster, BCH ({ "51" }, { "8" }) delram { "1" }, CRC-24, LDPC-delramar med kodhastighet en halv { "2" } till { "4" }, blockinterleaver { "60" } gånger { "98" }) med en uttömmande avkodare för delram 1 och en min-sum-LDPC-avkodare skriven enbart utifrån paritetskontrollmatrisen; samt basbands-IQ-syntes med sanningsetiketter skriven som en SigMF-inspelning. Koderna genereras ur standardens skiftregister och Legendre/Weil-konstruktioner. Inget som kopierats ur standarden vidaredistribueras (den har inga villkor för återanvändning): AFS-Q:s primärindex kommer från IS-GPS-800J, och det som bara standardens bilagor definierar (AFS-I G2-fördröjningar, tertiärkoder, LDPC-delmatriser) läses vid körning från ett lokalt cacheminne som <c2/> fyller från den NASA-värdade PDF-filen, varje fil kontrollerad mot en fastlåst SHA-256 (<c3/>). Modellen är en formatreferens, inte en kanal-, propagerings- eller länkbudgetmodell.

seg-7b8cb0461377 = <c1/> och <c2/>: en inspelning kan bära tilläggsfält med namnrymd som deklarerats i <c3/>.

seg-a9465820a1fc = Ny VALIDATED-rad "LunaNet AFS baseband rendering against an independent generator, given its channel state": mot LANS-AFS-SIM (BSD-2-Clause, incheckning 480c6bf3, S-bandsbygge) noll chipavvikelser över koderna för PRN { "1" } till { "210" }, noll symbolavvikelser över körningens tre ramar och en normaliserad komplex korrelation på { "0.999990" } över { "23.9" } s av dess egna sampel (sämsta block på { "2" } ms { "0.999948" }), inom trösklar som fastställts före jämförelsen (förhandsregistrerad 986ac280). Den driver renderaren med simulatorns eget kanaltillstånd och täcker inte effektfördelningen utifrån bärvåg-till-brustäthet eller SigMF- och 8-bitarsskrivningen.

seg-07edced2764a = Ny VALIDATED-rad "LunaNet AFS frame channel coding, FID { "0" }": de 6000 symbolerna långa ramarna är lika med LANS-AFS-SIM:s symbol för symbol (förhandsregistrerad 986ac280); koden för delram 1 återger det genomarbetade exemplet i LSIS figur { "8" } och CRC-24 kontrollvärdet i katalogen för CRC-24/LTE-A.

seg-ab94ac9f41fc = Båda befordrade raderna är datastyrda av LSIS-cachen: deras test för oberoende referens hoppas över med ett meddelande tills <c1/> har körts.

seg-89a4bc4a766e = Fynd (ny MODELLED-rad), "LunaNet AFS spreading-code generation": av { "2 937 232" } genererade chip och bitar som jämförts med standardens tabeller och filerna i bilaga { "3" } skiljer sig en, de "sista { "24" } chipen" som tabell E-5 anger för tertiär PRN { "147" }, vilken dubblerar cellen för PRN { "151" } medan standardens egen bilagefil { "3" } stämmer med generatorn. Kriteriet noll avvikelser missas.

seg-d4e76301323f = Fynd (ny MODELLED-rad), "LunaNet AFS closed-loop decodability": tre förhandsregistrerade körningar mot PocketSDR-AFS; den tredje uppfyllde sina trösklar för spårning och avkodning fullt ut men inte sitt skydd om att ett mottagarbygge som bara skriver ut återger det fastlåsta byggets logg, eftersom två körningar av den oförändrade mottagaren redan skiljer sig åt i sina inhämtningsregistreringar.

seg-93cfa05a1923 = Rättat: standardbärvågen för <c1/> (<c2/>), <c3/> och <c4/> var avrundade { "2.4" } GHz; den är nu LSIS-020 AFS-bärvågen, { "2492.028" } MHz. Vid den gamla standarden var fritt-rymd-förlusten underskattad med { "0.327" } dB.

seg-ed7c170ccc2c = Ändringar: inga. Varje medföljande scenario anger sin bärvåg, och resultaten för alla { "138" } scenariofiler är byte för byte identiska med föregående main.

seg-3ec7f5b17122 = D7, verklig lunar IQ och GPS LNAV (sju nya rader, ingen VALIDATED: { "242" } -> { "249" } rader, validerade { "123" } oförändrat).

seg-0c3dcf4f2b0f = <c1/>: en blandad-radix snabb Fouriertransform (FFT) vars utdata är samma bitar på varje plattform; en SHA-256-fastlåsning av transformerna med 8000 och 24000 punkter klarar sig på x86_64 och på wasm32-wasip1 (körare i <c2/>).

seg-150d9809c584 = <c1/>: parallell kodfassökning på samplad IQ (<c2/>, <c3/>) med koherent vikning, icke-koherent ackumulering, ett chi-två-tröskelvärde för en falsklarmssannolikhet över hela sökningen och en cellmedelvärdesstatistik för bandbegränsat brus; <c4/>, <c5/> med kod-Doppler samt M2M4- och rutnätstoppsestimatorerna för bärvåg-till-brustäthet (C/N0).

seg-46bda8ecf2cd = <c1/>: en kodare för IS-GPS-200:s äldre navigeringsmeddelande (LNAV) för delramarna { "1" } till { "3" }, med paritet enligt tabell 20-XIV och en fältavkodare.

seg-43444792974c = <c1/>: en läsare för ION GNSS SDR Metadata Standard (<c2/>) och dess samplefiler, med <c3/> för nivåer i tvåkomplement.

seg-a7dfc3475923 = <c1/>: LuGRE-filerna (Lunar GNSS Receiver Experiment) för IQS-batchhuvud, RAW-, ACQ- och NAV-telemetri samt CLK, och en kontroll som listar var metadata i <c2/> motsäger det binära huvudet.

seg-f0125531c4f8 = <c1/> och, i <c2/>, kroppssystemet med girstyrning, sändningsazimut och vinklar från nadir, samt <c3/> för relativ C/N0 med uppmätta mönster.

seg-679aa02de1d0 = Kodning av GPS LNAV-navigeringsmeddelanden (ny rad, förblir MODELLED efter integratorns efterkontroll): på IGS-sändningsfilen från { "2" } mars { "2025" }, tolkad och avkodad av RTKLIB v2.4.2-p13, klarar alla { "960" } ord paritetskontrollen, alla { "96" } delramar avkodas och alla { "608" } sända heltal är lika med Kshanas (<c1/>), men förhandsregistreringen (d4d9eb9d) nådde den publika grenen två sekunder efter incheckningen med resultatet, så ordningen "registrerad innan filen hämtades" kan inte visas och raden befordras inte.

seg-2875ba2d8f5f = <c1/> fyller ord från den mest signifikanta biten (I i den höga halvbyten i en LuGRE-byte; den tidigare läsningen gav den konjugerade signalen), behåller den gamla läsningen som <c2/> och läser sampel som är bredare än ett ord.

seg-f6e0e3b9b166 = <c1/>: faskoherent Doppler-förfining ({ "0.2" } Hz RMS vid { "30" } dB-Hz över { "200" } ms i simulering).

seg-b0f6a61acce0 = GPS L1 C/A mot gps-sdr-sim: chip och paritetsbit bitexakta; { "230" } av { "1152" } LNAV-fält skiljer sig med en enhet eftersom gps-sdr-sim trunkerar där det sända heltalet kräver avrundning.

seg-1c525ca495c0 = LNAV avkodat av RTKLIB: all paritet och alla delramar klarar sig och varje parameter ligger inom ett halvt kvantum; { "41" } skalade värden skiljer sig med några enheter i sista siffran genom RTKLIB:s decimala konstant { "2" }^-43, över den registrerade tröskeln.

seg-14e26e69777b = LuGRE-inhämtning mot GNSS-SDR { "0.0.19" }: { "266" } av { "266" } beslut stämmer, { "250" } placerade i samma cell; de flesta positiva är artefakter av ett medelvärde på −{ "0.5" } i de nakna 4-bitarsnivåerna; C/N0-grenen hade inga samtida flygdata. Två batchar (OP5, OP12) uteslöts av misstag: deras metadata stämmer med deras huvuden, men läsaren kunde då inte läsa ett sampel som var bredare än ett ord.

seg-3a32ff9d66fc = LuGRE-inhämtning mot banprognosticerad Doppler: med beslut utifrån samplets effekt korsar varje sökning på bandbegränsat brus; med beslut utifrån cellmedelvärde stämmer de starkaste paren i storlek med omvänt tecken, vilket visar att den registrerade I/Q-ordningen är konjugatet av data.

seg-2bb618ba4059 = Blind inhämtning på batcharna från månytan: fyra batchar inhämtar var sin satellit (förutsedd synlig, inget falsklarm vid { "1e-7" }), ingen två, så tröskeln för Doppler-differens har inget par att bedöma.

seg-f95606e17fd1 = Relativ C/N0 på månavstånd (M039 omformulerad): { "15" } Block IIR/IIR-M-registreringar och ett par, för få för den registrerade tröskeln.

seg-9306cf44fc44 = Ändringar: inga; ingen publicerad siffra, golden-fil eller dokumentationssiffra ändrades.

seg-2a3cb68c94d6 = M039-raden "Earth-GNSS at lunar distance" omformulerar sitt påstående på månavstånd som den relativa C/N0 mellan satelliter vid en epok plus sikt (absolut C/N0 hävdas inte); den förblir MODELLED. Den övergripande NOTICE innehåller LuGRE:s erkännande enligt CC BY { "4.0" }.

seg-e1e4094a186a = Orientering av månens huvudaxlar från DE440 interpoleras nu längs geodeten mellan dagliga noder. Den tidigare elementvisa interpoleringen hade ett fel på upp till { "2.0e-4" } rad ({ "340" } m på månytan) nära kvartspunkterna för varje dygn, inte de "cirka { "14" } m" som raden angav. Dess användare (geometri för lunar laseravståndsmätning, lunar datum, observerbarhet av lunara fel) får den rättade orienteringen.

seg-a2071d345923 = Motorrättningar i runda { "2" }, var och en omkörd mot sin oförändrade förhandsregistrerade tolerans: IERS-årgången för en EOP-rad läses ur dess I/P-flaggor i stället för ur ett tomt Bulletin B-block; <c1/> använder geodetisk lokal nivå; den lunara kopplingen i takt- och referenssystemet använder ekvatorialradien, J2 och rotation; liu22-anpassningen startar vid noll korrektioner utan förkunskap och använder artikelns medelrörelsetakt; EO-nodavståndet bär J2-nodregressionen; Costas-cykelglidningstiden använder rho/4; den gemensamma lösningen tillämpar parets sända gruppfördröjning; den lunara gemensamma lösningen använder ett QR-steg; NTN-gränsen utvärderas vid den sanna positionen; klockreferensen i konstellationsutformningen är den lägsta konstellationen i sikte; DE440-orienteringsserien spänner över 2014-2030 och ger fel utanför den i stället för att klippa.

seg-74f397ad9c16 = <c1/>, en referensbana byggd av tabellerade jordfasta tillstånd, som används av jämförelsen med anpassning av verkliga banor.

seg-7293b717d978 = Testfilerna och fixturerna för jämförelserna ovan, var och en med sin generator och en <c1/> som anger källa, licens, hämtningsdatum och SHA-256.

seg-920fe965bda9 = Runda { "2" }: <c1/> och <c2/> (ADD v4.2-feldetektering, efter Stanford MAAST för ARAIM { "2" }, BSD-3-meddelande i källkoden); <c3/>; <c4/> och <c5/>; INS-felmodellen med nio tillstånd <c6/>; partialer för <c7/> och indata för <c8/> på kärnsökvägen; <c9/>, en läsare för SPK typ { "2" } och binära PCK-kärnor; <c10/> med ITRF2020-stationer; Jacchia { "1971" }-densitet; <c11/> över valfri efemeridleverantör; <c12/>; <c13/> och <c14/>; <c15/>; <c16/> (läsare för RINEX-klocka, ANTEX och DCB).

seg-e3336e670d51 = En korrigeringsversion på { "0.29.2" }. Kshana Studio är ombyggd kring två vyer: en enkel vy som svarar först och förklarar med vanliga ord, och en avancerad vy med hela instrumentpanelen. Två små rättningar på kshana.dev följer med. Motorn ändras inte: varje medföljande scenario ger ett byte för byte identiskt resultat med { "0.29.2" } förutom versionsstämpeln.

seg-c40ab967ace6 = <b>Kshana Studio har en enkel vy.</b> Det är den Studio öppnas på.

seg-6a5ae001d00e = Svaret kommer först: ett scenario öppnas på sitt resultat, angivet i en enda vanlig mening. Varje medföljande scenario har sin egen mening, skriven för det scenariot mäter.

seg-375421534e4c = Högst fem inställningar visas, de som ändrar svaret mest. Resten finns under "Advanced settings", ihopfällda tills du öppnar dem.

seg-d8650ae64549 = "How this is computed" förklarar metoden på några rader, och "For researchers" ger motorns egna siffror, scenariofilen och belägget bakom resultatet.

seg-36af7640e6ad = <b>Hela instrumentpanelen är den avancerade vyn.</b> Varje panel, diagram, export och rapport från den tidigare Studion finns där.

seg-0428d0a7921b = <b>En växlare flyttar mellan de två vyerna och behåller din plats.</b> Scenariot, vyn du var i och alla inställningar du redigerat följer med. Studion kommer ihåg vilken vy du använde senast. Länkar från webbplatsen och dokumentationen öppnar den enkla vyn; en länk med <c1/> öppnar den avancerade vyn, och varje tidigare Studio-länk öppnar fortfarande samma scenario och vy.

seg-2c98ed084c10 = <b>En snabbare första vy på långsamma anslutningar.</b> Det inspelade svaret för ett scenario ritas innan resten av Studion har lästs in, så på en långsam mobilanslutning visas svaret efter cirka två sekunder i stället för cirka nio.

seg-2214d2dcfab4 = <b>Bättre sökning.</b> En sökning listar nu först scenarier vars område eller titel matchar orden, före scenarier som bara nämner dem i filnamnet eller texten.

seg-aa8d43280c19 = <b>Globen på startsidan blir inte längre tom med minskad rörelse påslagen.</b> Med systeminställningen för minskad rörelse påslagen kunde en ändring av fönsterstorleken lämna hjälteglobet tomt tills sidan rullades. Globen ritas nu om i samma bildruta som storleksändringen.

seg-da4b78816df1 = <b>L-bandskonsolen på startsidan förklarar sitt tomma band.</b> I "Watch a jammer take the band" förblev panelen GPS L5 / Galileo E5a mörk under hela minuten, vilket såg ut som ett fel. Ingen jammer sänder i det bandet i det här scenariot, och satellitsignalerna ligger under brusgolvet, så ingenting där höjer sig över det. En diskret etikett säger nu det i varje panelavsnitt där inget ligger över golvet (panelen L5 / E5a, och panelen L2C innan dess brusjammer startar), med varje bands C/N0 och låsningstillstånd från samma körning. Den placeras bara där inget ligger över golvet, så den täcker aldrig jammer-energi.

seg-e353fdee7033 = En korrigeringsversion på { "0.29.1" }. Den tar bort duplicerad kod i modulerna för LEO-navigeringsmeddelande, fusion och spektrum, lägger till ett ljust tema på kshana.dev, flyttar Kshana Studio till en egen adress, gör webbplatsen läsbar för sökmotorer och AI-assistenter, rättar flera småsaker i Studion och låter npm-utgåvor publiceras utan en lagrad token. Inget motorutdata ändras: varje medföljande scenario ger ett byte för byte identiskt resultat med { "0.29.1" } förutom versionsstämpeln.

seg-e8bf0a4fdc35 = <b>Ett ljust tema för kshana.dev.</b> Varje sida kan läsas ljus eller mörk. Webbplatsen följer läsarens systeminställning och har en växlare för att ändra den.

seg-8e7cabc14c40 = <b>Sökmotorer och AI-assistenter kan läsa webbplatsen.</b> Varje sida har nu en egen titel, beskrivning, kanonisk adress, taggar för sociala kort och strukturerad schema.org-data, samt ren text för de avsnitt som ett skript ritar. Webbplatsen publicerar <c1/>, en <c2/> med datum för när varje sida senast ändrades, <c3/> och <c4/> (en kort och en fullständig guide i ren text för AI-assistenter) samt en IndexNow-nyckel så att en driftsättning kan tala om för sökmotorer vad som ändrats.

seg-804ba71be9ed = <b>npm-utgåvor kan publiceras utan en lagrad token.</b> npm-jobbet kör nu Node { "24" } och npm { "11.5.1" } eller senare, som stöder npm trusted publishing: npm byter utgivningsjobbets GitHub-identitet mot en kortlivad behörighet. Hemligheten <c1/> fungerar fortfarande och används så länge den är satt, så ingenting ändras förrän trusted publishing slås på för paketet på npmjs.com. <c2/> listar stegen.

seg-81405e5a5e06 = <b>Rubriken på startsidan är läsbar över globen.</b> En mjuk skugga ligger nu bakom rubriken och dess text och tonar ned banlinjerna och satellitprickarna på det animerade globen där de korsar den.

seg-24b8363acc14 = <b>Kshana Studio har en egen adress: <a1>https://kshana.dev/studio/</a1>.</b> Varje länk på webbplatsen och i dokumentationen pekar dit. Den gamla adressen, <c1/>, fungerar fortfarande och vidarebefordrar till den nya med scenariot, vyn och övriga inställningar i länken bevarade.

seg-12f223b986bd = <b>Rättningar i Studion.</b> Motorfilen hämtas en gång i stället för två. Medan den hämtas visar Studion scenariots inspelade resultat direkt, märkt som inspelat, i stället för en tom skärm. På en telefon är sidhuvudet en kompakt rad. Nyckeltalen bryts två per rad, så inget döljs utanför skärmkanten. Fältetiketter använder scenariots egna ord, med fältnamnet bredvid, och sökningen hittar fält med båda.

seg-c130d8a4dc5e = <b>Mindre duplicerad kod.</b> Enhetstabellen för LEO-navigeringsmeddelandet skrev samma tio SISRE-statistikrader för fyra anpassningssammanfattningar. Ett makro skriver dem nu en gång. De två spektrumvattenfallsdiagrammen delar en tidsaxel, en färgskala och en panel för C/N0-staplar. Huvudrutnätets nedsampling återanvänder <c1/>, och Simpson-integralen återanvänder <c2/>. LEO-passagens två ingångspunkter delar ett uppsättningssteg. <c3/> importerar vektorhjälparna i <c4/> i stället för att kopiera dem. Den avancerade rapporten importerar API-rapportens HTML-escape i stället för att kopiera den. Var och en av de { "139" } scenariofilerna i <c5/> kördes på { "0.29.1" } och på den här koden, och varje utdatafil är byte för byte identisk.

seg-166b0435c96f = <b>Enhetstabellerna för leo-navmsg och leo-pvt har egna filer.</b> De flyttades ut ur moduler som också innehåller logik, till <c1/> och <c2/>. <c3/> behåller sin publika sökväg. Bara dessa två tabellfiler ansluter till undantagen från kopieringsdetektering för deklarativa kataloger i <c4/>, vilka <c5/> kontrollerar.

seg-f8b372e08ef9 = <b>README:s CI-märke visar resultatet av push till main.</b> Märket räknade körningar av alla händelser på main, så det kunde visa "failing" medan varje push-körning var grön; det frågar nu bara efter push-körningar (<c1/>).

seg-7c41a482c7d8 = En korrigeringsversion på { "0.29.0" }: den uppmätta täckningssiffran, projektets namnrad på kshana.dev, ett snabbare täckningsjobb och en uppfräschad README. Inget motorutdata ändras: varje scenario ger samma resultat som på { "0.29.0" }.

seg-997490bd1696 = Ändringar av publicerade siffror

seg-ed4b071e4bd9 = <b>Radtäckning: ~{ "96" } % → ~{ "95" } %.</b> Täckningsjobbet mätte om den utgivna koden för { "0.29.0" } (incheckning <c1/>, CI-körning { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } av { "58,697" } rader i <c3/>. Den publicerade siffran var { "95.63" } % ({ "37,697" } av { "39,419" } rader), uppmätt på <c4/> före { "0.28.0" }; den avrundades till ~{ "96" } %. Den nya siffran avrundas till ~{ "95" } %, så varje yta som <c5/> fastlåser flyttas tillsammans: <c6/>, README-märket, Evidence-raden och CI-tabellen, märkena för crates.io, PyPI och npm, den tekniska rapporten och täckningssidan på kshana.dev. Golvet på { "85" } % är oförändrat.

seg-577baa03af04 = <b>Namnraden på kshana.dev.</b> "Kshana · क्षण · the precise instant" öppnar nu startsidans hjälteavsnitt och ligger under varumärket i varje sidas sidfot. kshana.dev gör fortfarande ingen begäran till någon annan värd: devanagari är en egenhostad Noto Sans Devanagari-delmängd med de tre bokstäverna i क्षण ({ "1,692" } bytes, <c1/>, med dess SIL Open Font License-text och dess SHA-256 i <c2/>). <c3/> lärde sig att spara en Google Fonts-delmängd <c4/> under ett innehållsadresserat filnamn.

seg-35b5bc4ee466 = <b>Webbplatsens länkar landar där de pekar, på rena adresser.</b> En länk till ett avsnitt lägger nu avsnittet strax under sidhuvudet, på telefon och på dator: en länk till en Missions-sektor öppnar den sektorn med sin panel överst; länkar till Capabilities och Editions håller sin plats medan diagrammen ovanför ritas; Editions lägger inte längre till en andra förskjutning för sidhuvudet; och en länk in i en ihopfälld del av en dokumentationssida öppnar den. Varje sida länkas med sin rena adress (<c1/>, <c2/>, <c3/> för startsidan), och de kanoniska länkarna, webbplatskartan och omdirigeringarna från gamla adresser anger samma; adresserna <c4/> fungerar fortfarande. Research har en egen länk i sidhuvudet, mellan Evidence och Developers, och i sidfoten. Dokumentationen visar inte längre färdplanen (<c5/> finns kvar i förvaret): gruppen Project är Changelog, Licensing, Security, Contributing, Governance och Code of conduct, och Glossary flyttades till Get started.

seg-3da9f00f5ce6 = <b>Täckningsjobbet är snabbare.</b> På { "0.29.0" } tog det { "143" } minuter mot friska { "91" } till

seg-85d502773367 = Fuzzern <c1/>, orsaken förra gången, tog { "4" } av dem. Det medföljande korpuset växte från { "74" } till { "139" } scenarier, och tre testbinärer gick igenom allt en fil i taget (<c2/> två gånger, <c3/> och <c4/> en gång): { "37" } minuter tillsammans under täckningsinstrumentering, mot { "3" } på { "0.27.2" }. De delar nu <c5/>, som kör arbetet per scenario på varje kärna och lämnar tillbaka resultaten i sorterad ordning; varje scenario och varje assertion finns kvar. På en arm64-bärbar, debugbygge: <c6/> tar { "143" } s på { "14" } kärnor mot { "612" } s med <c7/> (den gamla seriella genomgången).

seg-bb69dbadbc81 = <b>README, uppfräschad.</b> Den öppnar med samma namnrad som webbplatsen; Studio-skärmbilderna är tagna på nytt från Studion i { "0.29.1" }, med en ny av Studion på en telefon och dess stegfält längst ned; en ny remsa "The site" visar tre sidor av kshana.dev från bygget { "0.29.1" } (<c1/>, sammansatt av <c2/> och registrerad i <c3/>); täckningssiffran är ~{ "95" } %; och alt-texten till forskningsfiguren, som upprepade arkitekturfigurens, beskriver nu artiklarna. Märkena i sidhuvudet är mindre och kortare ({ "18" } px höga; "~{ "95" }%", "83/223", "quality", "AGPL-3.0", "zenodo.20528627"), så att alla elva ryms på två rader; varje länk och alt-text behåller sin fulla betydelse.

seg-f61ef3e16884 = <b>Containerbildsjobbet får { "90" } minuter.</b> Vid { "v0.29.0" } nådde bilden <c1/> med emulerat linux/arm64-bygge den gamla gränsen på 45 minuter när den kompilerade sin sista crate, så bilden, posten i MCP-registret och kanalkontrollen publicerades inte. Gränsen är nu { "90" } minuter; bilden är oförändrad.

seg-1688bf9f0fec = <b>Åtta flyttalsliteraler omgrupperade</b> i <c1/> och <c2/> (<c3/> → <c4/>): SonarQube Cloud tolkade en sista grupp <c5/> eller <c6/> som ett saknat suffix <c7/> eller <c8/> (regel S7454). Värdena är samma tal, så varje resultat är oförändrat.

seg-81fd160937db = Tolv nya scenarioslag och tre nya sätt att läsa en körning. Motorn täcker nu radiospektrumet, hela solsystemet, konstellationer kring vilken kropp som helst, kampanjer som kopplar ihop scenarier till ett enda uppdrag, samt positionering, navigering och tidssynkronisering (PNT) från låg jordbana (LEO) från signalen till positionsbestämningen. Varje körning kan också skrivas som en animation, en fullständig rapport och en uppsättning interoperabilitetsfiler för andra verktyg.

seg-118be64d7cb2 = Kring motorn: en omgjord kshana.dev (en webbplats med flera sidor och en ny instrumentpanel, Kshana Studio, som kör varje förmåga i webbläsaren), en omskriven README, fjorton verktyg i Model Context Protocol-servern (MCP), ett webbläsarbygge som ger samma siffror som det inbyggda och en publik sida för Kshana Pro.

seg-ea31356bc17d = Scenariofiler (plus ett svitmanifest)

seg-26654cd81de1 = { "138" }, varav { "132" } medföljer för <c1/>

seg-3d1a85e93e48 = varav MODELLED (angiven modell, kontrollerad för intern konsistens)

seg-e77f9d273ee1 = varav PARTNER (kräver en partners maskinvara eller data)

seg-e94cd6b3561a = Varifrån tillväxten kommer:

seg-1759a8cce7d6 = Slag

seg-94de9433d99f = Scenariofiler

seg-03d7aea335dc = Matrisrader (validerade + modellerade)

seg-fdd674722717 = Spektrum

seg-59583fa40da3 = Solsystemet och positionering kring vilken kropp som helst

seg-fafa167623df = Scenarier för sjö, väg och järnväg

seg-fc571c46e522 = Animation, rapporter, interoperabilitetsexporter

seg-2746e0d9f787 = LEO-signalutformningar och multibandsspektrumet

seg-d40ec114d1f9 = LEO-positionering, tidssynkronisering och fusion

seg-0157f649e65b = LEO-kedja från början till slut

seg-423283112128 = LEO-motståndskraft, fokusområden och slutanvändarscenarier

seg-395beca13299 = Totalt tillagt

seg-ea9dc4093d8a = LEO-förmågan är systemoberoende: den körs på generiska, angivna parametrar och behöver inget namngivet system. Namngivna system är valfria förinställningar, var och en i sin egen fil med sin publika källa. En förinställning, Celeste IOD (demonstration i omloppsbana), använder siffror som presenterades vid ESA NAVISP LEO-PNT-workshopen, { "2026" } (ESA är European Space Agency; NAVISP är dess Navigation Innovation and Support Programme); den finns i en enda fil, <c1/>, med sina fem scenarier som bara finns i förvaret, så den kan hållas tillbaka utan en källkodsändring, och ingen av dess workshopsiffror upprepas i den här ändringsloggen.

seg-c36a5015c03c = <b>Läs "Revisions to published numbers" innan du uppgraderar.</b> Ett motorutdata ändras (inertialsystemskolumnerna för slaget <c1/>, efter en teckenrättning i nutationsmatrisen), och dokumentationsgranskningen rättade siffror som tidigare dokument hade skrivit ut.

seg-7fe505d3232b = Status: <b>VALIDATED</b> betyder kontrollerad mot en oberoende extern referens (en publicerad tabell, en annan grupps programvara eller uppmätta data); <b>MODELLED</b> betyder en angiven modell som bara kontrollerats för intern konsistens; <b>PARTNER</b> betyder att kontrollen kräver en partners maskinvara eller data.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project; femte generationens mobilnät; icke-terrestriskt nät

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = tideräkningar (anno Domini, före Kristus)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternativ binär offsetbärvåg; binär offsetbärvåg; binär fasskiftsmodulering; multiplexad binär offsetbärvåg (signalmoduleringar)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (en publicerad LEO-efemeridmodell)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = grov-/inhämtningskoden samt bärvågs- och civilsignalnamnen i Global Positioning System

seg-e464509f3abb = förhållandet mellan bärvåg och brustäthet

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = kommandoradsgränssnitt

seg-9aa3c2e54398 = cyklisk redundanskontroll på 24 bitar (Qualcomm-polynom)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = kommaseparerade värden; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform resource locator

seg-3ad592244ea8 = kontinuerlig våg

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (format för kartor och glober)

seg-3415aa029e39 = Development Ephemeris { "441" } från Jet Propulsion Laboratory

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital objektidentifierare

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = utspädning av precision: geometrisk, position, horisontell, vertikal

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = Galileos signalnamn

seg-544f4fcbd68f = ett platsnamn i konstellationstabellen för Global Positioning System

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = jordcentrerat, jordfast

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = ekvinoktieekvationen

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = ekvivalent isotropiskt utstrålad effekt

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (referensbibliotek för astronomi)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = European Space Agency; dess Navigation Innovation and Support Programme

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = flerfaldig åtkomst med frekvensdelning

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = Rysslands Global Navigation Satellite System

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = globalt satellitnavigeringssystem; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = International Astronomical Union

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = gränssnittsspecifikation; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Internationella sjöfartsorganisationen

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = tröghetsnavigeringssystem; mikroelektromekaniskt system

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = demonstration i omloppsbana

seg-92cd0058a058 = IQ

seg-c7fa50165400 = i fas och kvadratur

seg-41471e51e661 = gränssnittsspecifikationen för Global Positioning System

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Internationella rymdstationen

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-jordfast; sann ekvator, medelekvinox (referenssystem)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Internationella teleunionen; dess radiokommunikationssektor

seg-a524e4c4a670 = förhållandet mellan jammer och signal

seg-5d93361e20d4 = J2 till J6, J2000

seg-50255586b303 = zonala harmoniska i tyngdkraftsfältet; epoken 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Jet Propulsion Laboratory

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = låg jordbana; medelhög jordbana

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = modellbaserad systemteknik

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = normaliserat skattningsfel i kvadrat

seg-56d5135d987d = Galileos jonosfärmodell

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (precisa banor); tvåradig elementuppsättning

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = positionering, navigering och tidssynkronisering; precis punktpositionering

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = effekttäthetsspektrum; spektral separationskoefficient

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = autonom integritetsövervakning i mottagaren; signalkvalitetsövervakning

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = kvadratiskt medelvärde (rotmedelkvadrat)

seg-e1c3c49833fc = ett GNSS-positioneringsbibliotek med öppen källkod, som används här som oberoende referens

seg-9ead536db4aa = Simplified General Perturbations { "4" } (banmodellen för tvåradiga elementuppsättningar)

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bitar

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = avståndsfel för signal i rymden

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (dess efemeridfilformat <c1/>)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = identifierare för rymdfarkost

seg-de4e841ce8a2 = en Walker-konstellations totala antal satelliter, plan och fasning

seg-4d6ebfefc096 = TEC

seg-5149401781dd = totalt elektroninnehåll

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahög frekvens

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = koordinerad universell tid

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = signalnamn i systemet Xona Pulsar

seg-d6a3f210958a = En ändrad publicerad siffra är en revision och registreras, aldrig rättad i tysthet. Den här utgåvan innehåller en revision av motorutdata och flera av siffror som skrivs ut i dokumentationen.

seg-1669eb4224f1 = Motorutdata

seg-185961ebab61 = Reduktionen TEME→GCRS vreds med { "2" }·Δψ: nutationsmatrisen hade fel tecken på Δψ.

seg-504b78f30c54 = <c1/> byggde <c2/> där SOFA:s <c3/> bygger <c4/>, så <c5/>, <c6/>, <c7/> och <c8/> roterade med dubbla nutationen i longitud, cirka { "25" } bågsekunder. Varje kontroll av kedjan var ett egenskapstest (korrekt rotation, rundtur, ett nollskilt nutationsbidrag) som ett teckenfel klarar; Vallado-testet från början till slut täckte TEME→PEF, TEME→ITRF och GCRS→ITRS men inte TEME→GCRS. På Vallado-exemplet (AIAA 2006-6753, 2004-04-06) missade kedjan det publicerade GCRF med { "1 145" } m; den hamnar nu { "0.11" } m från det, och matrisen är lika med ERFA:s <c9/> inom { "1e-14" }. <c10/> och <c11/> misslyckas båda med det gamla tecknet. Konsistenstestet för CIO (Celestial Intermediate Origin) i <c12/> hade förklarat den resulterande avvikelsen på ~{ "130" } m som "≈ { "2" }·EE"; resten är nu { "5" } cm och dess gräns är skärpt från { "250" } m till { "1" } m. <b>Detta flyttar publicerade siffror, vilket registreras här som en revision:</b> kolumnerna <c14/> och <c15/> för slaget <c13/> (cirka { "0.8" }–{ "1.0" } km för det medföljande ISS-scenariot (International Space Station); dess kolumner för TEME, jordfast, markspår, siktvinklar och Doppler ändras inte), och <c16/> / <c17/> för referenssystemen GCRS och ITRS. Inget medföljande scenarios sammanfattningsrad, diagram eller golden-hash läser de här kolumnerna. De nya interoperabilitetsexporterna använder den rättade kedjan: den första satelliten i <c18/> har en CZML-position som stämmer med en ERFA-reduktion av samma TLE (propagerad av Python-paketet <c19/>) inom { "2.3" } cm.

seg-a0a4026d22ed = <b>Slaget <c1/>, inbyggt och i webbläsarbygget.</b> Slaget beräknar nu varje transcendent funktion genom ett portabelt matematikbibliotek, så dess ram är samma bytes på varje plattform och i varje bygge (under Fixed). Varje siffra för <c2/> flyttas med det, och likaså steget <c3/> i <c4/>. Slaget är nytt i den här utgåvan, så ingenting från en tidigare utgåva flyttas, men siffror som skrevs ut före rättningen gör det: kontrollvärdet i <c5/> för scenariot med kodning och avkodning var <c6/> och är <c7/>, och det avkodade meddelandets SISRE är { "0.129" } cm. På kshana.dev visade Missions-kortet för <c8/> ett sämsta avståndsfel på { "1.6" } mm med en anpassning på { "60" } s och { "40.3" } mm med en anpassning på { "900" } s; webbplatsen byggs nu från den här utgåvans motor och visar { "1.8" } mm och { "46.6" } mm.

seg-77f441bfc3c3 = <b>Kartan över jammingens täckning på kshana.dev (Missions).</b> Var och en av dess { "875" } celler är en körning av <c1/> där bara mottagarens position ändrats. Cellerna beräknas nu utifrån samma koordinater med tre decimaler som cellens länk "open this run" ger Kshana Studio, så en cell visar exakt det som dess länk återger. Medelvärdet av jammer-till-signal-förhållandet (J/S) för { "30" } celler flyttas med { "0.1" } dB, uppåt eller nedåt; ingen cells spårningstillgänglighet ändras. Motorn ger identiska resultat för varje cell i { "0.28.0" } och { "0.29.0" }.

seg-146588a39e7c = <b>Seedad omsampling i WebAssembly-paketet (WASM).</b> Webbläsarbygget drog andra bootstrap- och blandningsindex än det inbyggda bygget från samma frö (under Fixed). Intervallet för <c1/> av arean under kurvan i webbläsaren var <c2/> och är nu det inbyggda <c3/>. Inget inbyggt tal flyttas.

seg-017810049453 = Siffror som skrivs ut i dokumentationen

seg-85ab2a364a37 = Dokumentationen granskades ord för ord mot körningar av den här utgåvans motor. Där en utskriven siffra inte stämde med körningen rättades dokumentet, och varje rättning listas här, gammalt → nytt. I varje fall nedan ändrades inte motorns utdata; dokumentet hade läst fel, avrundat fel eller överlevt det.

seg-1eacdefbfda2 = <b>Dokumentationsgranskning av sidorna om spektrum, konstellation, kampanj, animation, rapport och interoperabilitet, samt en ny <c1/>.</b> Varje siffra kördes om med den här motorn. Två publicerade tal flyttas: <c2/> angav täckningstestet med { "5" } 000 satelliter som "cirka { "0.13" } s i ett debugbygge"; det gick inte att återskapa ({ "1.24" } s på en belastad bärbar), så sidan anger nu den andel för förfiltret som testet skriver ut ({ "9.9" } % av { "19 440 000" } parprov) och släppbinärens { "0.14" } s för den medföljande <c3/>. Samma sida angav E3F:s passage som "off by { "0.050" } deg"; inget test skriver ut den siffran, så sidan anger nu bara tröskeln på { "0.06" } grader som testet upprätthåller och härledningen { "7.30" } mot { "7.36" } grader bakom den. Inget motorutdata ändras.

seg-2ad182e2db15 = LEO-PNT-dokument: reviderade publicerade siffror (omkörda på den här utgåvans motor).

seg-6c2401365dd5 = <c1/> bandavvägning: den förstaordningens jonosfärsfördröjning för <c2/> är { "3.24" } m (skrevs ut som { "3.25" } m) och för <c3/> { "0.77" } m (var { "0.78" } m). <c4/> kodning och avkodning: det avkodade meddelandets SISRE skrevs ut som { "0.119" } cm där körningen gav { "0.122" } cm; sidan skriver nu ut { "0.129" } cm, siffran efter rättningen för plattformsoberoende under Fixed nedan. <c5/> LEO jämfört med GNSS-passage: { "32" } dB mindre fritt-rymd-förlust vid passagens topp (var "{ "26" } till { "32" } dB"). För signal- och passagesiffrorna ändrades inte motorns utdata; dokumenten hade läst fel eller avrundat fel.

seg-fc3c8ba1b789 = <b>Handledningar, det genomarbetade pipelineexemplet och kommandot <c1/>, granskade mot den här utgåvans motor.</b> Revisioner av publicerade siffror, gammalt → nytt: slagen som skriver <c2/> är sex, inte fyra (<c3/> och <c4/> saknades; <c5/>, <c6/>); passagen för det kalla atomernas ½bT² i handledning { "3" } är { "18,443" } s, inte { "18,440" } s; rundtursfelet för <c7/> i <c8/> är det uppmätta { "4.88e-7" } km, inte "~{ "1e-7" } km"; CSAC-holdoverbandet i handledning { "2" } är de { "2000" }–{ "3200" } s som testet kräver, inte "~{ "2600" }–{ "4400" } s"; handledning { "1" } anger SP3-raderna och geometriblocket med den precision som motorn skriver dem.  Inget motorutdata ändrades.

seg-4c613cabb87b = Sidorna om validering, kvantteknik, SGP4, animation, påståenden och integritet.

seg-c49d5cdb36e1 = <c1/>: den upprätthållna gränsen för den simulerade Allan-deviationen på en sekund för en klocka med vitt frekvensbrus är { "20" } % (skrevs ut som { "25" } %; gränsen på { "25" } % är den för kurvan vid { "1" }, { "10" } och { "100" } s); raden för slumpvandring i hastighet anger nu sin upprätthållna gräns på { "20" } % bredvid de cirka { "12" } % som observerats; och det chipskaliga atomurets tillgänglighet i <c2/> är cirka { "0.73" } (skrevs ut som cirka { "0.83" }). <c3/>: det vibrationsbegränsade bruset per skott i sidans genomarbetade exempel med kalla atomer är cirka { "46" } gånger dess skottbruksgolv (var "~{ "45" }×"; { "46.49" } omräknat), och intervallet "{ "1" }–{ "50" } µg/√Hz" för enheter i fält, som motsade en enhet som sidan själv anför, ersätts av de två anförda enheternas publicerade siffror. <c4/>: den sämsta positionsskillnaden är { "4.12" } mm (var "≈ { "4" } mm"), med satelliten namngiven. <c5/>: exemplet med videokodare läste ramarna på { "24" } bilder per sekund som { "12" }; det använder nu { "24" }, den takt som rammanifestet anger. <c6/>: störningsmodellen har { "10" } tester (var { "8" }), och det kopplade filtrets "{ "2.97" } m against { "48.8" } m" ersätts av det som dess test kräver (det kopplade positionsfelet under { "0.6" } gånger det frikopplade, och vinner i minst { "90" } av { "100" } försök). <c7/>: stämpeln "Today" angav { "v0.22.0" }; den anger nu den här utgåvan, och två förmågor som byggts sedan dess (felläget för hela konstellationen och integritetsstödmeddelandet) lämnar sin lucklista.

seg-4fde8788f95f = <b>Scenarioslaget <c1/>: en L-bandsspektrummodell och ett vattenfall</b> (<c2/>, <c3/>, <c4/>). Hela GNSS L-bandet som ett enda effekttäthetsspektrum (PSD): GPS L1 grov-/inhämtningskod (C/A) och L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (multiplexad binär offsetbärvåg, MBOC(6,1,1/11), eller BOC({ "1,1" })), GPS L5 och Galileo E5a (BPSK({ "10" })), ett kT-brusgolv med en mottagares brusfaktor, samt jammer av typerna kontinuerlig våg (CW), smalband, chirp och matchat brus på en skriptad tidslinje. Varje jammer bedöms per band med sin spektrala separationskoefficient (SSC), vilket ger jammer-till-signal-förhållandet (J/S) och effektiv bärvåg-till-brustäthet (C/N0) per band och rad. Diagrammet är ett SVG-vattenfall med C/N0-staplar; result.json innehåller rutnätet blockmedelvärdesbildat i effekt. Valfri <c5/> ritar modellen som IQ-sampel, skriver och läser en inspelning i Signal Metadata Format (SigMF) (<c6/>, <c7/>) och jämför en Welch-skattning med modellen; valfri <c8/> skattar en verklig SigMF-fil. Medföljande exempel <c9/>: en chirp tar L1 C/A och E1 vid { "10" } s, en CW-ton på L1-bärvågen håller C/A vid { "17.98" } dB-Hz efter att chirpen upphör medan E1, vars spektrum har ett nollställe där, återhämtar sig; L5 och E5a är orörda.

seg-fa9976349886 = Ny VALIDATED-rad: signalernas PSD och SSC, mot BPSK(n)-huvudloben på 2n x { "1.023" } MHz, BOC({ "1,1" })-loberna centrerade vid +/-1.023 MHz, de slutna Parseval-formerna bakom de publicerade SSC-värdena -61.8 / -64.8 / -67.8 dB/Hz och läroboksvärdena Q = { "1" } (CW) och { "1.5" } (matchat). Maximum för BOC({ "1,1" })-PSD ligger vid +/-0.759 MHz, inte vid lobens centrum; testet fastlåser båda.

seg-411431a9b26b = Två nya MODELLED-rader: vattenfallet och C/N0-tidslinjen, som reduceras exakt till kedjan för slaget <c1/> (korskontrollerat i varje rapport), samt SigMF-kodeken och Welch-skattaren. Ingen inspelning från tredje part finns i förvaret.

seg-5c5c695e7c0a = <c1/>: en MBOC-variant och <c2/>.

seg-bb346f4942a9 = Rapporten skriver ut den C/N0 som slagets <c1/> representativa Q-tabell skulle ge bredvid den spektrumhärledda; för en CW-ton på C/A-bärvågen skiljer de sig med { "1.8" } dB. Tre nya matrisrader: en validerad (signalspektra och spektrala separationskoefficienter) och två modellerade.

seg-673dfe048dad = <b>Efemerid för solsystemet och positionering kring vilken kropp som helst.</b> Två nya scenarioslag.

seg-3e1b0e8e99e9 = <c1/>: Solen, de åtta planeterna, Pluto, månen, Phobos, Deimos, Io, Europa, Ganymedes, Callisto och Titan vid en epok: heliocentrisk position och hastighet i International Celestial Reference Frame (ICRF), gravitationsparameter, radier, J2 (den andra zonala harmoniska) där den är publicerad, sideral rotation, polen och nollmeridianen enligt International Astronomical Union (IAU), ett banspår över ett varv, samt ljustid, enkel och dubbel avståndsmätning, solens Shapiro-fördröjning och solavstånd från en observatörskropp och för varje extra länk. Planeterna kommer från de keplerska elementen från Jet Propulsion Laboratory (JPL) av Standish och Williams (tabell { "1" }, { "1800" } e.Kr. till { "2050" } e.Kr.; tabellerna 2a/2b, { "3000" } f.Kr. till { "3000" } e.Kr.); månarna från JPL:s medelelement med IAU:s synkrona rotationstakt, och Titan från IAU:s rotationsmodell. Exempel: <c2/>.

seg-6a094973208b = <c1/>: en omloppsfarkost eller en landare på ytan kring någon av dessa kroppar, som navigerar med pseudoavstånd från en Walker-konstellation kring kroppen och en klockfri dubbel avståndsmätning från jorden; utspädning av precision, formell osäkerhet och seedade minstakvadratlösningar med och utan jordlänken. Exempel: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> får Merkurius, Venus, Jupiter, Saturnus, Uranus, Neptunus, Pluto och de sju månarna, en namnuppslagning och en fysisk post; <c2/> ger vilken kropp som helst i förhållande till vilken annan som helst genom den befintliga skarven <c3/>.

seg-8b5c2fbe91f7 = VALIDATED mot JPL Horizons (Development Ephemeris DE441; fixturer och frågor i <c1/>): Merkurius till Saturnus och jorden från tabell { "1" } inom två gånger det angivna nominella felet (sämsta { "1.87" } gånger), alla åtta planeter från tabellerna 2a/2b (sämsta { "1.71" } gånger), och ljustiden jorden till Mars och Jupiter. MODELLED: Uranus och Neptunus från tabell { "1" }, som överskrider det angivna felet mot DE441 ({ "2.0" } och { "5.2" } gånger), Pluto, månarna, kroppskonstanterna och resultaten från <c2/>.

seg-a3c83f6d2078 = Fynd: Montenbruck & Gills månserie i <c1/> är redan hänförd till J2000-ekvinoktiet genom sin egen precessionsterm ({ "0.05" } grader från Horizons), så den används utan ytterligare precessionsrotation. Sex nya matrisrader: två validerade (planetpositioner, ljustid) och fyra modellerade.

seg-564133d6a0c4 = Konstellationer kring vilken kropp som helst

seg-d1ddb76d8bf3 = <b>Konstellationsutformning i stor skala (slaget <c1/>, <c2/>).</b> Walker delta- och Walker star-mönster (T/P/F), explicita elementlistor och utformningar med flera skal, flera konstellationer per körning, kring jorden, månen, Mars eller vilken annan planet, Pluto eller större måne som helst utifrån de kroppskonstanter som slaget <c3/> lade till. Förinställningar från publicerade nominella element: baslinjen för Global Positioning System (GPS) och den utbyggbara konstellationen med 24 platser (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document utgåva { "1.1" }), BeiDou medelhög jordbana Walker 24/3/1 plus geostationära och lutande geosynkrona satelliter (Open Service Performance Standard { "3.0" }) och GLONASS 24/3/1 (Interface Control Document { "5.1" }). Täckning och utspädning av precision (DOP) över ett rutnät i latitud och longitud: satelliter i sikte, GDOP, PDOP, HDOP och VDOP (geometrisk, position, horisontell, vertikal) samt tillgänglighet per cell, globalt och på den sämsta platsen, med en mottagarklocka per konstellation. Ett siktförfilter (täckningshalvvinkel plus ett band i sub-satellitlatitud, exakt på en sfärisk kropp) kör { "5 000" } satelliter på ett rutnät på { "10" } grader på cirka { "0.13" } s i ett debugbygge.

seg-8f4ebd177f3d = VALIDATED: Walker-generatorn återger Galileo OS SDD tabell { "23" } och GLONASS ICD:s platsformel; GPS-förinställningen återger kolumnen för ekvatorspassager i SPS PS ({ "35" } av { "36" } platser inom { "0.0108" } grader; E3F inom { "0.06" } grader, tabellens egen rad är inkonsekvent); den globala HDOP-fördelningen för GPS-baslinjen stämmer med SPS PS bilaga B (median { "0.940" } mot { "0.94" }, { "95" } % { "1.255" } mot { "1.25" }, medelvärde { "0.965" } mot { "0.96" }; tröskel { "0.03" }).

seg-65658a896a73 = MODELLED: godtyckliga utformningar, andra kroppar, faserna och de lutande geosynkrona noderna för BeiDou, tvåkroppsbanor med valfri J2, enbart geometri.

seg-3dfe470e8a5c = Scenarier: <c1/> ({ "102" } satelliter, tillgänglighet { "100" } %, median-PDOP { "0.95" }, { "31.0" } i sikte över { "10" } grader), <c2/> ({ "5 000" } satelliter, tillgänglighet { "99.22" } % vid PDOP { "3" } eller lägre över { "20" } grader, { "0" } % vid polarkalotterna, förfiltret behåller { "11.5" } % av parproven), <c3/> ({ "14" } satelliter kring månen, tillgänglighet { "21.33" } % totalt och högst över sydpolsområdet). Alla tre medföljer för <c4/>. Anteckningar: <c5/>. Tre nya matrisrader: två validerade (Walker-generatorn och GNSS-förinställningar, global DOP för GPS) och en modellerad.

seg-79e2d2c42166 = En kampanj driven av spektrummodellen, och konstellationer kring vilken kropp som helst.

seg-4ab5f6f6bbbb = <c1/> kopplar ihop slaget <c2/> med en klockas holdover och en integritetsövervakare (en chirp tar L1 C/A och E1; en CW-ton håller sedan C/A nere medan E1 återhämtar sig och mottagaren faller tillbaka på en himmel med bara Galileo), fastlåst mot det fristående vattenfallsexemplet i <c3/>. <c4/> löser nu sin centralkropp genom <c5/>, så en konstellation kan läggas kring vilken planet, Pluto eller större måne som helst med de konstanter som slaget <c6/> använder.

seg-dc904f639fed = <b>Kampanjer: många scenarier sammansatta till en körning.</b> Ett nytt slag <c1/> (<c2/>, dokumenterat i <c3/>) kör medlemmar av befintliga slag genom samma utskick som kommandoraden och läser tillbaka tal ur deras resultat. Fyra avsnitt, i valfri kombination:

seg-903ee141047a = <c1/>: ett kedjat uppdrag på en tidslinje. Förinställningar per slag läser klockans tidsfel mot dess skyddsgräns, det genomsnittliga effektiva förhållandet mellan bärvåg och brustäthet (C/N0) mot spårningsgolvet, den vertikala skyddsnivån mot larmgränsen, positionsfel, spårande satelliter och larmflaggor, hållna på ett gemensamt rutnät med fasgränser och händelser. Tillståndet förs vidare av <c2/>, <c3/> och <c4/>.

seg-4eeedde09a77 = <c1/>: en till tre punktseparerade nycklar av valfritt slag, eventuellt med en seedad ensemblekörning vid varje nod.

seg-4c113198cbb7 = <c1/>: realisering k vid basfrö + k, med medelvärde, spridning, percentiler och ett bootstrap-konfidensintervall på { "95" }% med fast frö.

seg-df107253752d = <c1/>: delade värden bundna till flera medlemmar, med en sammanfattning av bästa och sämsta. Varje resultat bär en kampanjhash och en sammanfattning över varje medlemsresultat. Fyra medföljande scenarier: <c2/> (nominellt, jamming, spoofing som avslutades vid klockövervakarens detektion efter { "370" } s, holdover som bär den spoofade förskjutningen på { "37.0" } ns med en tröghetsenhet som rullar fritt, ett integritetslarm, återhämtning), <c3/>, <c4/> och <c5/>. <c6/> fastlåser sammansättningsidentiteterna: en kampanj med en fas återger den fristående körningen bit för bit på tre slag, en ensemble med fast frö är byte-stabil, och på en klocka med vitt frekvensbrus ligger ensemblens medelvärde inom det rapporterade intervallet med spridningen inom chi-två-intervallet för sqrt(q_wf * tau) = { "16.459" } ns. Tre nya modellerade matrisrader.

seg-c611ee59301a = Animation

seg-14b2d3cc9e7c = <b>Animationsexport (<c1/>, <c2/>, <a1><c3/></a1>).</b> Varje körning vars resultat bär en tidsserie kan nu skrivas som en animerad SVG-fil (Scalable Vector Graphics; Cascading Style Sheets-nyckelbilder, inget skript: kurvorna ritas in bakom en rörlig tidsmarkör), en enda fristående HTML-spelare (HyperText Markup Language; spela och pausa, skrubba, hastighet, varje panel på en synkad markör, händelsemarkörer som söker vid klick; ingen extern resurs), eller en numrerad SVG-bildsekvens med en <c4/> som anger bilder per sekund, längd och bildtider för en videokodare. En kampanj spelas som sina faser med sina larm markerade; en spektrumkörning animerar sitt vattenfall rad för rad. Spelaren följer <c5/>, och under <c6/> visar både SVG-filen och spelaren den färdiga bilden i stället för att röra sig. <c7/> och <c8/> anger uppspelningen; <c9/> och <c10/> är bibliotekets ingångspunkter, och <c11/> får ett block <c12/> bara när <c13/> körs. Utdata är en ren funktion av resultatet och alternativen, byte för byte identiskt vid omkörning, utan tidsstämpel. Ett slag utan en samplad tidsaxel avvisas med "no time series to animate" och ingenting skrivs. Exportören ritar körningens egna sampel och lägger inte till något tal, så den är MODELLED (intern konsistens) och har ingen rad i verifieringsmatrisen; ingen publicerad siffra ändras. Tester: <c14/> (determinism, antal bilder, ingen extern adress, välformad XML, sökvägen för minskad rörelse och varje medföljande scenario med en tidsserie som animeras).

seg-c01b78b64065 = Rapporter

seg-2662fdb991f3 = <b>Avancerade körningsrapporter (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Varje körning från kommandoradsgränssnittet (CLI) skriver nu <c2/>, en utskrivbar HTML-rapport (HyperText Markup Language), och <c3/>, samma innehåll som ett maskinläsbart JSON-dokument (JavaScript Object Notation). Avsnitt: en sammanfattning för ledning; varje scenarioindata med sin enhet, läst ur schemat för fältenheter (resultatets block <c4/>), annars ur fältnamnets suffix, annars angivet som inte angivet; resultaten med körningens diagram, varje skalär och en sammanfattning av varje numerisk kolumn; för en kampanj nodtabellen för svepet, Monte Carlo-medelvärdet, standardavvikelsen, 5:e / 50:e / 95:e percentilerna och bootstrap-konfidensintervallet med ett histogram per mått, kedjans fastabell, eller sammansättningens medlemmar och gemensamma sammanfattning (och rutnätet för en körning av <c5/> eller <c6/>); en händelsetidslinje; etiketten VALIDATED / MODELLED / PARTNER, referens och testbelägg för varje rad i verifieringsmatrisen som körningens slag använder, läst ur matrisen genom en korstabell mellan slag och rad (en rad som bedömer en indatasökväg, till exempel sökvägen Simplified General Perturbations { "4" } (SGP4) för <c7/> eller sökvägen med uppmätt registrering för <c8/>, listas bara när körningen tog den sökvägen, och raden för läsaren av Shuttle Radar Topography Mission (SRTM) listas för inget slag, eftersom inget scenariofält läser en SRTM-ruta); uttalandena om vad som inte modelleras och antagandena, var och en citerad med sin källa; och en reproducerbarhetspost (motorversion, källincheckningen när bygget sätter <c9/>, Secure Hash Algorithm 256-bit (SHA-256)-sammanfattningar av scenariofilen och resultatdokumentet, frö, plattform och det exakta kommandot). Rapporten läser ingen klocka: samma scenario, frö och motorbygge ger en byte för byte identisk rapport, och den enda tidsstämpel den kan visa är den som <c10/> redan skriver. En utskriftsstilmall passar A4 och US Letter, upprepar tabellhuvuden och håller rader och figurer hela över sidbrytningar; en PDF-fil (Portable Document Format) skapas med webbläsarens "Save as PDF". Det finns inget alternativ <c11/>, eftersom rendering av diagrammen till en PDF skulle kräva ett nytt, tungt beroende. Tester: <c12/> rapporterar varje medföljande scenario (inget tomt avsnitt, ingen platshållartext, etiketter lika med matrisen, scenariosammanfattningen lika med filens, byte för byte identisk vid omkörning) och <c13/> kör om det registrerade kommandot i en ny katalog och kräver en byte för byte identisk <c14/>. Ingen publicerad siffra ändras, och antalen slag, scenariofiler och matrisrader är oförändrade.

seg-ce45e75c6d67 = <b>Rapporten, animationen och exporterna fungerar tillsammans.</b> Den avancerade rapporten får ett avsnitt "Animation and exports": körningens animerade ritning inbäddad som en overksam bild (eller skälet till att det inte finns någon), länkar till animations- och exportfilerna som skrivits bredvid den, och varje interoperabilitetsformat med om det gäller, varför inte, och dess specifikation; <c1/> bär samma block <c2/>. HTML-animationsspelaren listar exportfilerna som skrivits bredvid den. Kommandoradsgränssnittet (CLI) renderar nu exporterna innan det skriver rapporten, så båda kan nämna filerna.

seg-c60dc5b92a60 = Interoperabilitetsexporter

seg-5bfce52c5a13 = Interoperabilitetsexporter och -importer (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> skriver scenariots geometri som CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, en standard från Open Geospatial Consortium, med <c2/> tidsmärkta spår), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) och Ansys STK (Systems Tool Kit) <c3/>-efemerider (<c4/>, meter, en fil per rörligt objekt), och slaget <c5/>:s syntetiserade IQ-ögonblicksbild (i fas och kvadratur) som ett SigMF-par (Signal Metadata Format) genom den befintliga <c6/>. <c7/> skriver varje format som gäller och skriver ut varför de andra inte gör det; <c8/> rapporterar utan att köra. Rörliga objekt skrivs i Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) och jordfast WGS { "84" } (World Geodetic System { "1984" }) longitud, latitud och höjd (KML, GeoJSON); fasta platser i CZML är <c11/>. Slaget <c12/> lägger till två jammerfotavtryck från sina egna länkekvationer. <c13/> skriver en GeoJSON-<c14/> i spårindata för <c15/>, <c16/>, <c17/> och <c18/>. Exporterna är byte-deterministiska och bär ingen tidsstämpel. <c19/> validerar varje export mot dess publicerade specifikation, jämför exporterade satellittillstånd med motorns egna inom { "1" } mm, och kör varje medföljande scenario genom varje format, där var och en antingen exporterar eller anger varför inte (tabellen i docs/INTEROP.md). Ingen publicerad siffra ändras: IQ-syntesen för slaget <c20/> flyttades till en delad funktion och dess resultatdokument är byte för byte identiskt, och <c21/> får <c22/> och <c23/> som används av dess egen körning. Antalen slag, scenariofiler och rader i verifieringsmatrisen är oförändrade. Ett bana- eller integritetsscenario utan <c24/> dateras av sina satelliters egna data: <c25/> är den tidigaste epoken för TLE (tvåradig elementuppsättning), sänd efemerid eller SP3 (Standard Product { "3" }), och varje sådan satellit roteras till GCRS och jordfasta system vid sitt eget ögonblick; 2000-01-01T00:{ "00" }:00Z används bara när ingen satellit bär en epok. SP3- och OEM-exporterna (Orbit Ephemeris Message) behåller sin etikett 2000-01-01. För att stödja detta läggs <c26/>, <c27/> och <c28/> till; inget som fanns läser dem.

seg-12c151a800f9 = Navigering i låg jordbana: signal

seg-9b665682695a = <b>LEO-PNT-signalutformningar och ett multibandsspektrum.</b> Ett nytt slag <c1/> och ett slag <c2/> som når bortom L-bandet: ett slag, fyra scenariofiler (tre medföljer; filen Celeste IOD finns bara i förvaret) och fyra matrisrader (två VALIDATED, två MODELLED).

seg-b355b28bfd1b = <c1/>: parametriserade signalutformningar för positionering, navigering och tidssynkronisering (PNT) från låg jordbana (LEO) för vilket system som helst (band, sändningsbandbredd, ITU-tilldelning; komponenter för inhämtning, data och pilot med BPSK(n), BOC(m,n), MBOC eller platta spektra, effektandelar, FDMA-underbärvågor, kodlängder och datatakter), från inkompilerade publika förinställningsfiler under <c2/> (Xona Pulsar X1/X5, Iridium STL, en Starlink-signal av tillfälle, CentiSpace, en representativ C-bandsutformning och representativa utformningar för UHF/L/S/C/bred C, var och en med sin käll-URL) eller skrivna inline. Per signal: det bandbegränsade PSD och de bandinterna effektandelarna, Gabor-bandbredd, bandbegränsad tidig-sen-kodspårningsjitter mot C/N0 och avstånd (Betz & Kolodziejski { "2009" }) och avståndsmätningens noggrannhet, inhämtningens sökrum, detektionssannolikhet och genomsnittlig seriell och kodparallell inhämtningstid, SSC in i och från GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b och AltBOC med C/N0-förlusten, tolerans för CW, bredband och matchad J/S från spektrumslagets SSC-kod, en bandavvägning (jonosfärsfördröjning, fritt-rymd-förlust, avståndsmätning vid lika C/N0 och lika EIRP, jammertolerans), och valfria formkontroller mot en beskriven mätning. Exempel: <c3/>, <c4/>, <c5/> (de Celeste IOD-band och den signalkonfiguration som presenterades vid ESA NAVISP LEO-PNT-workshopen, { "2026" }; hålls tillbaka med förinställningen Celeste IOD, se "LEO-PNT end to end" nedan). Anteckningar i <c6/>.

seg-8f58debf721f = <c1/>: band kan nu vara en förinställd signalutformning (varje komponent ritad, bandbegränsad, C/N0 och J/S hänförda till den spårade komponenten) eller en egen bärvåg och modulering; <c2/> lägger till vattenfall över andra frekvensområden på en tidslinje; en <c3/>-jammer (barriär) ansluter till de fyra vågformerna. Rapporten lägger till <c4/>, <c5/> och <c6/>, och en post <c7/>. Vanliga band ger samma tal som tidigare. Exempel: <c8/>.

seg-98f74d85c54b = <c1/> får sinusintegralen, de slutna formerna för BPSK:s effekt i bandet och bandbegränsad Gabor-bandbredd, den bandbegränsade tidig-sen-jittern för vilket spektrum som helst och dess Gabor-gräns, den slutna formen för SSC för offset-BPSK, Galileo E5 AltBOC({ "15,10" })-spektrumet och en tolkare för modulationsetiketter; <c2/> skriver ut BPSK(1/3) som en bråkdel.

seg-78d9e5e2c615 = Fyra matrisrader: VALIDATED bandbegränsade slutna former ({ "90.3" } % av BPSK-effekten i huvudloben, jittern som reduceras till Kaplan & Hegartys koherenta form, { "0.0039564" } chip vid { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, och till sin Gabor-gräns, samt BPSK:s själv-SSC 2/({ "3" } R_c); den slutna Gabor-formen och offset-SSC mot dess Parseval-form anges som interna korskontroller); VALIDATED maximal LEO-Doppler (Xona X1 { "33.2" } kHz inom de publicerade { "32" } till { "34" } kHz, Iridium inom { "0.5" } kHz från { "36" } kHz); MODELLED <c1/>; MODELLED multibandsspektrum.

seg-45d3d4a46d6b = Navigering i låg jordbana: länk

seg-1d120db87aae = <b>LEO-PNT-passage och länkbudget per band: slaget <c1/>.</b> LEO-PNT är positionering, navigering och tidssynkronisering från satelliter i låg jordbana (LEO). En användare (mark, sjö, luft eller inomhus, stillastående eller rörlig) och en eller flera LEO-satelliter från en utformad passage, explicita element, en tvåradig elementuppsättning (TLE) genom SGP4, eller en Walker-konstellation från koden <c2/>. Per satellit, band och epok: siktvinklar, avstånd, sluten avståndshastighet och avståndsacceleration (kontrollerade vid varje körning mot centrala differenser), Doppler och Doppler-takt, fritt-rymd-förlust, EIRP (ekvivalent isotropiskt utstrålad effekt) med ett isoflux-, Gauss-lob- eller platt satellitmönster, en patchantenn för användaren, gasdämpning enligt ITU-R P.676, regndämpning enligt ITU-R P.838/P.618, troposfärisk scintillation enligt P.618, byggnadsinträdesförlust enligt ITU-R P.2109 för en användare inomhus, polarisationsfel, systembrustemperatur och C/N0 (bärvåg-till-brustäthet); den förstaordningens jonosfärsfördröjning per band från ett Klobuchar- eller vertikal-TEC-snedat TEC (totalt elektroninnehåll) under satelliten, och jonosfärsfria bandpar med deras brusförstärkning. Galileo- eller GPS-satelliter utvärderas med samma mottagare utifrån sina mottagna effekter i gränssnittsdokumenten, så den klockformade LEO-passagen och de platta MEO-bärvågorna (medelhög jordbana) delar ett diagram. Ett avsnitt <c3/> ger tid till första positionsbestämning, energi per positionsbestämning och batteritid mot driftcykel (MODELLED).

seg-17f3503e1be3 = Systemoberoende: motorn behöver ingen förinställning. Valfria förinställningar, var och en i sin egen fil och märkt PUBLIC (med URL), REPRESENTATIVE eller WORKSHOP: generisk multiband (UHF, L, S, C), generiskt C-band, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink som en signal av tillfälle med enbart Doppler, CentiSpace, och Celeste IOD (demonstration i omloppsbana), vars signalparametrar presenterades vid ESA NAVISP LEO-PNT-workshopen, { "2026" }, och finns i <c1/> så att de kan hållas tillbaka (se "LEO-PNT end to end" nedan).

seg-a338cc46a1e0 = Publika byggstenar i <c1/> (geometri, antenn, itu, iono, energi, förinställningar) som andra moduler kan anropa.

seg-887ad03cb6f6 = Scenarier: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-a20f1602c236 = Nio matrisrader. VALIDATED ({ "6" }): ITU-R P.838-3-koefficienter mot dess tabell { "5" }; regndämpning och scintillation enligt P.618-14 mot valideringsexemplen från ITU-R Study Group { "3" }; byggnadsinträdesförlust enligt P.2109 mot arbetsboken från Study Group { "3" }; förstaordningens jonosfärsskalning mot förhållandet för gruppfördröjning i IS-GPS-200, med fritt-rymd-förlusten; den maximala Dopplern för en stillastående användare i en cirkulär bana mot arXiv { "2509.19551" } tabell { "1" }. MODELLED ({ "3" }): passagen och länkbudgeten, förinställningarna och budgeten för energisnål positionsbestämning. Ett slag och sex scenariofiler. Anteckningar i <c1/>.

seg-ef74b0f08aa1 = Navigering i låg jordbana: navigeringsmeddelande

seg-866ff4ee8b19 = <b>LEO-navigeringsmeddelande (slaget <c1/>, <c2/>).</b> Det sända efemerid- och klockmeddelandet från en satellit för positionering, navigering och tidssynkronisering (PNT) i låg jordbana (LEO), för vilken bana, bärvåg och modell som helst; namngivna förinställningar är valfria data och varje förmåga körs utan dem. Ett slag, fem scenariofiler och nio matrisrader (tre VALIDATED, sex MODELLED). Se <c3/>.

seg-c42821b6e855 = Meddelandets innehåll: SVID, datautgåva, band och signalhälsa; vecka, tid på veckan och ett andragradsklockpolynom; efemeriden i en av fyra modeller — Galileo OS SIS ICD:s keplerska uppsättning med 16 parametrar, den uppsättningen plus korrektionspolynom längs banan, tvärs banan och radiellt, modellen med 22 parametrar av Liu et al. { "2025" } (doi 10.3390/rs17162894), eller ATOMIC:s nollklocke-ECEF-polynom — och en Klobuchar-uppsättning, NeQuick-G-koefficienter med den effektiva joniseringsnivån, och parametrar för systemtid till UTC med ICD:s skottsekundsfall.

seg-e4565696f162 = Anpassare: en referensbana integrerad med zonal J2–J6- eller EGM2008-gravitation och luftmotstånd, en seedad fri eller styrd klocka, en Levenberg–Marquardt-anpassning på icke-singulära element, därefter linjära minstakvadratkorrektionspolynom och en klocka anpassad netto efter användarens relativistiska term.

seg-a7287b7b336c = Fyra analyser och scenarier: <c1/> (avståndsfel för signal i rymden (SISRE) mot anpassningsintervall och uppdateringsperiod), <c2/> (fyra modeller, bitar, och Kshanas anpassning med 22 parametrar vid Liu et al.:s höjder bredvid de publicerade siffrorna, MODELLED), <c3/> (kontinuitet vid varje meddelandebyte i en passage) och <c4/> (Kshanas egen dokumenterade binära ram med CRC-24Q och en kvantiseringsbudget, ett block i RINEX-4-stil märkt som ett Kshana-tillägg, och en CSV-tabell).

seg-e272dce3d10f = VALIDATED: de globala medelvärdesvikterna för SISRE mot den publicerade tabellen för medelhög bana och geostationär bana av Montenbruck et al. { "2018" }; Galileo-användaralgoritmen mot RTKLIB på fyra verkliga sända Galileo-efemerider (<c1/>); CRC-24Q mot katalogens kontrollvärde och exempelramen RTCM { "10403" } { "1005" }.

seg-5c8592195b0d = Förinställningar, en fil var med källor: Xona Pulsar och Pulsar-0, Iridium, Starlink, CentiSpace, ett representativt C-bandssystem, ATOMIC, och Celeste IOD (den enda förinställning som använder material presenterat vid ESA NAVISP LEO-PNT-workshopen, { "2026" }, förvarat i <c1/> med sina scenarier så att det kan hållas tillbaka).

seg-9fb0cbf29cef = Navigering i låg jordbana: fusion

seg-071f4db017c5 = <b>Fusionerad MEO + LEO-positionering, -navigering och -tidssynkronisering: <c1/>, <c2/> och <c3/>.</b> Tre nya scenarioslag i <c4/>, systemoberoende: varje konstellation är Walker-skal, elementuppsättningar eller en GNSS-förinställning, varje signal en bärvåg, en chiptakt och ett hölje för bärvåg-till-brustäthet (C/N0), varje felbudget en explicit enkel sigma, och namngivna system i låg jordbana (LEO) är valfria förinställningar, en fil var med sina källor märkta publik, workshop eller härledd (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlink-signaler av tillfälle, CentiSpace, ett representativt C-bandssystem, efemeridmodellen ATOMIC med nollklocka, och en förinställning för ESA Celeste-demonstration i omloppsbana vars workshophärledda parametrar finns i <c5/> så att de kan hållas tillbaka).

seg-f28f7a441263 = <c1/> har fyra lägen: Doppler-positionering (minsta kvadrat i omgångar på avståndshastighet med tillstånd för klockdrift och hastighet, ett läge med signaler av tillfälle med enbart Doppler, den enskilda passagens noggrannhet längs och tvärs banan, och höljet för Doppler, Doppler-takt och ryck); gemensam viktad minsta kvadrat för GNSS + LEO med en klocka per system (intersystembiasen) eller en känd förskjutning, sigma per mätning som indata, och DOP mot antalet LEO-satelliter; polär och arktisk täckning mot latitud; samt tidsöverföring från LEO till koordinerad universell tid (UTC) mot C/N0 och mottagaroscillatorn med uttrycket för systemtid till UTC i IS-GPS-200.

seg-57afa384aabd = <c1/>: ett flyttals Kalman-filter (utökat) för precis punktpositionering (PPP) på jonosfärsfri kod och fas, med enbart GNSS och med LEO-förstärkning, med sin konvergenstid och ett Monte Carlo-konsistenstest av NEES (normaliserat skattningsfel i kvadrat). Det medföljande scenariot ger { "7.4" } min med fyra MEO-system och { "4.8" }, { "3.2" }, { "2.7" } och { "2.3" } min med { "60" }, { "96" }, { "192" } och { "288" } LEO-satelliter, bredvid de { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } och { "1.3" } min som Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) anger, som en MODELLED jämförelse av trenden.

seg-3fa0556b3737 = <c1/>: 5G-positionering i icke-terrestriskt nät (NTN) i det mobila satellit-S-bandet 3GPP n256 utifrån Cramér-Rao-gränsen för ankomsttid och Doppler.

seg-a0cc2699e276 = Scenarier: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (medföljer) och <c8/> (finns bara i förvaret, hålls tillbaka med förinställningen Celeste IOD).

seg-c0b6b98eeac3 = Åtta matrisrader: höljet för LEO-Doppler VALIDATED mot de publicerade siffrorna för Iridium (±{ "36" } kHz: { "35.9" } kHz, inom { "5" }%) och Xona Pulsar X1 ({ "32" } till { "34" } kHz: { "33.6" } kHz från skalet på { "97" } grader, utan någon breddning) (<c1/>); Doppler-positionering, gemensam pseudoavståndspositionering, PPP-konvergens, NTN-gränser, LEO-tidssynkronisering, polär täckning och förinställningarna MODELLED. Tre slag och åtta scenariofiler. Dokumentation: <c2/>.

seg-173793480abc = <b>LEO-PNT från början till slut: slaget <c1/>, och LEO-stegen sammankopplade.</b> Ett enda positionerings-, navigerings- och tidssynkroniseringssystem (PNT) i låg jordbana (LEO) följt från sin signalutformning till användarens position, varje steg motorns eget slag på sin egen scenariotabell, med värden som förs vidare i kod (<a1><c2/></a1>):

seg-41a4a2183ba3 = Band i <c1/> kan namnge en utformning <c2/> (<c3/>): bandet tar utformningens centrum, sändningsbandbredd och chiptakt för den spårade komponenten, delar sin EIRP (ekvivalent isotropiskt utstrålad effekt) mellan utformningens komponenter, och rapporterar varje epoks C/N0 (bärvåg-till-brustäthet) för den spårade komponenten och bandbegränsade kodspårningsjitter (avståndsfelet; bruset för paret <c4/> använder det också). Ett band utan utformning ger samma utdata som tidigare.

seg-a076a43a9d44 = <c1/> kör signal -> passage -> navigeringsmeddelande -> fusionerad gemensam lösning med <c2/> -> valfri <c3/>. Varje LEO-system i positioneringssteget som lämnar dem osatta får en C/N0-linje i sin(elevation) anpassad till passagen, meddelandets avståndsfel för signal i rymden (SISRE: dess representationsfel vid passagesatellitens bana, med en angiven banbestämningsterm <c4/> i rotsumma av kvadrater), samt utformningens bärvåg och chiptakt; fallen med precis punktpositionering (PPP) tar SISRE. Varje överlämning listas med sitt värde och sin enhet, och <c5/> kontrollerar att var och en är lika med uppströmsutdata och att ändringar uppströms flyttar siffrorna nedströms. <c6/> är den nya ingångspunkten för meddelandet.

seg-8c256ed478e9 = Scenarier: <c1/> (en generisk konstellation på { "1080" } km och den representativa signalen <c2/>), <c3/> (den publika X5-signalen), båda medföljer, och den valfria <c4/> som bara finns i förvaret.

seg-879259c7ff86 = Förinställningarna för Celeste IOD (demonstration i omloppsbana) för områdena passage, meddelande och fusionerad positionering finns nu i en fil, <c1/>, som <c2/> bara kompilerar in när den finns (konfigurationsflaggan <c3/>). Dess fem scenarier (<c4/>) finns bara i förvaret, så att radera den filen och de scenarierna håller tillbaka varje siffra som presenterades vid ESA NAVISP LEO-PNT-workshopen, { "2026" }, utan någon källkodsändring; <c5/> kontrollerar vilka filer som får nämna förinställningen eller bära dess siffror för bandplanen.

seg-110b1f7c7c63 = Varje LEO-slag i den avancerade rapportens korstabell, med sina sökvägsspecifika rader listade bara när körningen tog den sökvägen (en regnintensitet, en byggnad, en analys eller ett läge som kördes). Dopplerfönstren för <c1/> får <c2/> och fallen för <c3/> får <c4/>, så båda animeras; <c5/> och <c6/> exporterar CZML-, KML-, GeoJSON- och STK-efemerider, och de andra LEO-slagen anger varför ett format inte gäller.

seg-1419edea5329 = Navigering i låg jordbana: motståndskraft, fokusområden och slutanvändarscenarier

seg-d084d86044b4 = <b>LEO-PNT-motståndskraft, ett scenario per fokusområde i experimentet och ett per slutanvändarvertikal, och <c1/> som översikt över varje LEO-slag och scenario.</b> Varje scenario körs utan några Celeste-data och medföljer.

seg-07e91f076ab2 = <c1/> får ett avsnitt <c2/>: en spoofer förfalskar, självkonsekvent i avstånd och avståndshastighet, signalerna från en påstådd position som hoppar och/eller förskjuts från den sanna efter en start (per LEO-band, och MEO GNSS-signalen), med eller utan jonosfären. Två övervakare körs vid en angiven falsklarmssannolikhet: konsistens i Doppler och passagegeometri (uppmätta avståndshastigheter mot de som förutsägs ur banorna och en oberoende förhandsposition och -hastighet; ett generaliserat minsta kvadrat-chi-två över ett fönster, på GNSS-, LEO- och alla kanaler, frekvenslåsslingebrus från C/N0) och konsistens mellan band (steget i varje LEO-bandpars modellkorrigerade geometrifria kombination). Resultatet ger statistiken per epok (så den animeras), varje par, och när varje övervakare detekterar. Byggstenar i <c3/>. Saknat avsnitt, oförändrat utdata.

seg-6a7852f1f053 = Varje bandpar i <c1/> rapporterar också det snedade totala elektroninnehåll (TEC) som dess geometrifria kombination återger vid passagens topp och den skattningens kodbrus-sigma (jonosfärssondering). Detta lägger till två fält i varje multibandsresultat från <c2/>; inget befintligt tal ändras.

seg-bdf333f4c978 = Tidssynkroniseringsläget i <c1/> tar <c2/>: varje rad rapporterar då sitt tidsfel och sin förutsagda sigma vid varje epok, med samma dragningar, så radstatistiken är oförändrad och körningen animeras och kedjas i en kampanj.

seg-eb4461740dc5 = En kampanj exporterar nu varje medlemsscenario som har geometri (fasernas körningar, basscenarierna för svepet och Monte Carlo, sammansatta medlemmar med sina delade värden bundna) som sin egen filuppsättning, med medlemsetiketten i filnamnet; tidigare exporterade en kampanj ingenting. Interoperabilitetstabellen i <c1/> ändras i enlighet med detta.

seg-c0b1f4d9fed0 = En svepnyckel i en kampanj kan indexera en matris av tabeller efter position (<c1/>).

seg-4c995017dd9c = Scenarier för motståndskraft: <c1/> (en barriär på { "50" } MHz i L5-bandet svept i effekt: varje L-bandssignal faller, LEO-signalerna i UHF-, S- och C-banden behåller sin C/N0), <c2/> (J/S-marginal utifrån mottagen effekt: GPS L5, Galileo E5a och Xona X5 förlorade vid -105, -100 och -95 dBW, en generisk LEO-signal på -135 dBW spåras fortfarande vid -90 dBW), <c3/> (ett hopp på { "30" } m som missas av Doppler-testet med enbart GNSS och upptäcks av testet på alla kanaler { "105" } s efter starten), <c4/> (fyra spoofers mot båda övervakarna) och <c5/> (GNSS störd, LEO-lagret i S- och C-banden spåras, autonom integritetsövervakning i mottagaren (RAIM) på enbart LEO-lagret larmar vid { "2" } av { "30" } epoker).

seg-bae66dac04cc = Scenarier för fokusområden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (motståndskraft i L, S och C är <c8/>).

seg-c7947d9cc592 = Vertikala kampanjer, var och en animerad och med export av sina LEO-passager: <c1/>, <c2/> (de medföljande scenarierna för sjö och järnväg plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Enradsresultat i <c7/>.

seg-222ad0b777f8 = Tre MODELLED matrisrader: övervakaren för spoofing med Doppler och passagegeometri, övervakaren för spoofing mellan band och jonosfärssondering. <c1/> kontrollerar övervakarna (tysta före starten, Doppler-statistiken kvadratisk i ett hopp, jonosfärssteget för en markspoofer och inget från en som är medveten om jonosfären), sonderingsidentiteten, tidsspåret mot radstatistiken, och att en kampanjs export är lika med varje medlems egen.

seg-f650b42bf210 = Sidan <c1/> flyttas till <c2/>; <c3/> är översikten.

seg-00a4ba834f37 = <b>Scenarier för sjö, väg och järnväg.</b> Fem medföljande exempel på befintliga slag, så att fartyg, vägfordon och tåg har ett genomarbetat fall var. Varje siffra är MODELLED; ingen är validerad mot uppmätta data.

seg-682414bbe0c6 = <c1/> (<c2/>): en bredbandsjammer på { "50" } W på en mast på { "30" } m, { "30" } km över öppet vatten från ett fartyg. Genomsnittligt jammer-till-signal-förhållande (J/S) cirka { "48" } dB, och tillgängligheten faller från { "1.00" } till { "0.00" }.

seg-4666dcd72c24 = <c1/> (<c2/>): ett tröghetsnavigeringssystem (INS) av navigeringsklass vid { "12" } knop med förlorad GNSS och ingen stödjande information. Det passerar { "10" } m efter { "281" } s och { "100" } m efter { "833" } s, siffrorna för hamninlopp och oceanvatten i resolution A.1046({ "27" }) från Internationella sjöfartsorganisationen (IMO), som används här som budgetar.

seg-7407bb97aedd = <c1/> (<c2/>): en spoofer på +{ "2" } dB, inte bärvågsjusterad, som skjuter fyra satelliter för att dra ett fartyg { "500" } m. Den fusionerade övervakaren upptäcker den (poäng { "0.70" } mot en tröskel på { "0.50" }) på autonom integritetsövervakning i mottagaren (RAIM) och signalkvalitetsövervakning (SQM); enbart effektövervakning missar den.

seg-1edc0541930b = <c1/> (<c2/>): en bil genom en underfart på { "15" } s och ett avbrott på { "60" } s orsakat av en jammer vid vägkanten, mot en budget på { "1.5" } m för ett halvt körfält. Det fusionerade avbrottets kvadratiska medelfel (RMS) är { "1.9" } m för en MEMS-enhet (mikroelektromekaniskt system) av fordonsklass och { "0.7" } m för en taktisk jämförelseenhet; fritt löpande driver MEMS-enheten till { "850.8" } m.

seg-f9830a49659f = <c1/> (<c2/>): ett taktiskt INS på ett tåg vid { "160" } km/h i en tunnel. Det passerar { "2" } m (spårdiskriminering) efter { "35.8" } s, cirka { "1.6" } km in, och { "20" } m efter { "107.3" } s. Detta är enbart INS: motorn har ingen modell för vägmätare, så det är den pessimistiska gränsen. Antalet scenariofiler i README flyttas från { "77" } till { "82" }. Alla fem medföljer för <c3/> och listas i webbläsarens lekplats.

seg-77c8c53126fd = Model Context Protocol-server

seg-2deb4b35b41a = Servern för Model Context Protocol (MCP) når varje slag och varje vy av en körning: sju nya verktyg, fjorton sammanlagt.

seg-7f4035dfd9db = <c1/> skickade redan varje slag; det en agent saknade var en väg till ett giltigt scenario av ett slag, och de tre utdata som kommandoraden skriver bredvid ett resultat. Nya verktyg:

seg-d9df5ab8817a = <c1/> och <c2/> serverar de medföljande referensscenarierna (tabellen <c3/>), var och ett med sitt slag och första meningen i sitt eget huvud, byte för byte filen under <c4/>. Ett scenario som finns i förvaret men inte medföljer avvisas med skälet. Varje slag utom <c5/> (vars dataurval bara levereras med förvaret) har minst ett exempel.

seg-cb24ad7147ef = <c1/> returnerar körningens rapport som JSON (JavaScript Object Notation) eller som den utskrivbara HTML-sidan (HyperText Markup Language) (<c2/>).

seg-9264b2f20e15 = <c1/> returnerar körningens tidsserie som en animerad SVG-ritning (Scalable Vector Graphics), en HTML-spelare eller numrerade bilder, efter en JSON-sammanfattning av vad som ritades (<c2/>). Ett svar bär högst { "120" } bilder; kommandoraden skriver vilken längd som helst.

seg-959f23871238 = <c1/>, <c2/> och <c3/> serverar interoperabilitetsexporterna och GeoJSON-importen av rutter (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeridformatet (Systems Tool Kit) <c5/> och SigMF (Signal Metadata Format), med ett JSON-index över filerna (suffix, storlek och SHA-256, sammanfattningen med Secure Hash Algorithm på 256 bitar) och den binära SigMF-samplefilen som base64.

seg-9ec3f9639b8c = Biblioteket får en funktion <c1/> som är avstängd som standard och som exponerar tabellen med referensscenarier som <c2/>; bara MCP-servern slår på den, så Python-hjulet och WebAssembly-modulen bär fortfarande inte scenariotexten. Sviter (<c3/>) förblir bara tillgängliga från kommandoraden, eftersom en svit namnger filer på disk och servern inte läser några. Rundturstesterna kör varje nytt verktyg mot medföljande scenarier och kontrollerar motorns tal: spektrum, solsystemet, konstellationer kring månen och Europa, ett kampanjsvep, och slagen för signal, passage, navigeringsmeddelande, fusionerad positionering, precis punktpositionering, icke-terrestriskt nät och från början till slut i låg jordbana (LEO). Varje yta som anger antalet MCP-verktyg eller listar verktygen säger nu fjorton, utom lekplatssidan under <c4/>, som ersätts av webbplatsen.

seg-c11823028688 = kshana.dev, Kshana Studio och README

seg-fb584cf84218 = <b>En omgjord kshana.dev.</b> Den enda lekplatssidan ersätts av en webbplats med flera sidor: Home, Missions, Capabilities, Evidence, Developers, Editions och Docs, med Kshana Studio ett klick bort. Varje diagram, karta och tal på den är en inspelad körning av den här utgåvans motor, med scenariot och en länk som öppnar samma körning igen i Studion; webbplatsbygget avvisar en inspelning gjord av en annan motorincheckning. Dokumentationssidorna genereras från förvarets <c1/>, och installationsalternativen från dess kanaler. Typsnitt och skriptbibliotek serveras från kshana.dev självt, så ingen sida begär något från en tredjepartsvärd. Gamla adresser (<c2/>, <c3/>, delningslänkar <c4/>, inbäddningslänkar <c5/> och resten) omdirigeras till sin nya plats, och en okänd adress får en { "404" }-sida.

seg-9fa1c542332b = <b>Kshana Studio, en instrumentpanel för varje förmåga.</b> Studion öppnas på en startskärm med domänrutor och bra första körningar, och för sedan en körning genom fem numrerade steg: Choose a scenario, Set its parameters, Run the engine locally in the browser, Read the results (nyckeltal först, vart och ett med ett PASS- eller FAIL-märke där körningen anger en tröskel, därefter panelerna) och Share or export. En sökruta hittar scenarier, domäner och fälten i dem och hoppar till kontrollen; körningar kan fästas och jämföras; en brödsmula säger var du är; på en telefon blir stegen ett stegfält. Varje scenarioslag har sin vy, inklusive spektrumvattenfallet, solsystemet, konstellationstäckning, kampanjer, animationen, körningsrapporten, interoperabilitetsexporterna och kedjan för låg jordbana. En djuplänk (<c1/>) öppnar samma körning på den namngivna panelen.

seg-dcf2788bb430 = <b>Forskning och citering.</b> Sidan Evidence listar de fem Kshana-artiklarna på arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } och { "2607.06212" }), var och en med en sammanfattning, en figur beräknad av den här motorn, kommandot som återger den, en Studio-länk och BibTeX, bredvid hur man citerar programvaran. README får samma avsnitt Research.

seg-fab395bab130 = En publik sida för Kshana Pro.

seg-167a59e94101 = <c1/> och webbplatsens sida Editions säger vad det proprietära Pro-lagret tillför över samma motor (utformningsoptimerare, osäkerhet och känslighet, uppdragsdossier, kampanjbevakning, spektrumsamexistens, jobbtjänst på plats, kravspårbarhet), vad var och en ger och vad den inte gör. Varje Pro-siffra som webbplatsen visar anges på den publika sidan. Pro lägger inte till någon fysikalisk modell, och den öppna motorn förblir hel och fri.

seg-f57f0a610943 = <b>En omskriven README.</b> Korta avsnitt, en bild per avsnitt, Kshana-märket, två rader märken, genererade bilder av arkitekturen, scenarioflödet, kedjan för låg jordbana och verifieringen (<c1/>, som misslyckas på en inaktuell bild), och Studio-skärmbilder tagna från den körande Studion av <c2/>. README-filerna för crates.io, PyPI, npm och MCP-servern följer samma utformning. Långt referensmaterial viks ihop eller flyttas till <c3/>.

seg-e06522ca762e = <b><c1/> är nu den avancerade körrapporten</b> som beskrivs under Added, och CLI:ets rad <c2/> nämner även <c3/>. Det enkelsidiga resultatkort som den ersatte är oförändrat som <c4/>, som Python- och WebAssembly-bindningarna fortfarande returnerar. <c5/> exponerar meningen som <c6/> skriver ut för varje MODELLED-rad; det dokumentet är oförändrat.

seg-77a6f35c5c9a = <b>README beskriver vad Kshana Pro bygger på.</b> Avsnittet Editions och raden om Kshana Pro under "Support & professional services" anger nu vad Pros modellbaserade systemteknik (MBSE) och programverktyg gör och vilka av den öppna motorns publicerade utdata den läser (varje körnings <c1/> och <c2/>, scenariofilen, fältenhetsschemat och verifieringsmatrisens etiketter), samt vad klockornas digitala tvillingar, avvägningsstudier och bevispaket vilar på i den öppna motorn. Endast formuleringar: ingen motorutdata och inget publicerat tal ändras.

seg-1a19675ffa3b = <b>Kompatibilitet.</b> Den publika enumen <c1/> får varianten <c2/>, vilket är en brytande ändring för en anropare som matchar den uttömmande. Kindens kolumner <c4/> och <c5/> för <c3/> ändras (se "Revisions to published numbers"). En körning reproduceras fortfarande av den motorversion som gjorde den.

seg-e7c5f77a6602 = <b><c1/> på MCP-servern nämnde fyra kinds som de enda med en CSV-tabell (kommaseparerade värden); sex publicerar en.</b> Verktyget returnerade alltid tabellen för <c2/> och för <c3/> (dess <c4/>-analys på en <c5/>- eller <c6/>-meddelandemodell), men dess beskrivning, dess avslagsmeddelande och dokumenten som listar kinds utelämnade båda, så en agent fick veta att den inte skulle fråga. De nämns nu, och ett rundturstest hämtar båda tabellerna.

seg-4094f58a5f4b = Navigationsmeddelanderamen för låg omloppsbana (LEO) var inte samma bytes på alla plattformar, och inte heller i varje bygge av en och samma plattform.

seg-5191262de022 = <c1/> kodade en ram med cyklisk redundanskontroll <c2/> i release-bygget på aarch64 macOS, <c3/> i ett debug-bygge av samma källkod på samma maskin och <c4/> i WebAssembly-bygget (WASM); <c5/> gav <c6/> nativt mot <c7/> i webbläsaren. Tre orsaker, var och en spårad till det första avvikande värdet:

seg-f6501c3cd89d = <em>Mellan plattformar.</em> Sanningsbanan var bitidentisk på båda; passningens startpunkt var det inte. <c1/> tar den oskulerande inklinationen från en <c2/> och perigeumargumentet från en <c3/>, och de två matematikbiblioteken avrundar dessa olika i sista siffran (över { "20 000" } argument skiljer de sig åt för { "781" } sinusvärden, { "858" } cosinusvärden, { "1 931" } exponentialer och { "1 899" } tvåargumentsarkustangenser).

seg-cd6f05096b8b = <em>Mellan byggprofiler.</em> Ett optimerat bygge på macOS slår ihop en sinus och en cosinus av ett argument till ett enda anrop av systemets kombinerade rutin, och dess sinus är inte den ensamma <c1/>:s för { "379" } av { "200 000" } argument; ett ooptimerat bygge gör de två anropen. Kinden tar en sinus och en cosinus tillsammans på tretton ställen.

seg-91b0700dcb30 = <em>I klockan.</em> Normalsamplaren i <c1/> anropar värdens <c2/> och <c3/> i sina två sällsynta grenar: av fyra miljoner seedade dragningar skilde sig tre i sista biten mellan det nativa bygget och WASM-bygget.

seg-0a4724333429 = Levenberg–Marquardt-passningen, som på denna båge stannar vid sin gräns på 80 iterationer och inte vid ett minimum, för över en enhet i sista siffran till olika kvantiserade fält. Kinden beräknar nu varje transcendent funktion genom den nya <c1/>, som anropar den rena Rust-cratet <c2/> (redan i beroendeträdet, nu namngivet i <c3/>), kompilerad från en och samma källa för varje mål och inte ett biblioteksanrop som optimeraren skriver om: <c4/> och scenariokoden. Heltalspotenser på den vägen skrivs ut som kvadrera-och-multiplicera, eftersom <c5/> har ospecificerad precision, och sanningsklockan drar sina normalavvikelser från <c6/> (Marsaglias polära metod på generatorns råa utdata). De gemensamma rutinerna som sanningsbanan integreras genom skrivs en gång, generiska över matematikbiblioteket, med en cratinternt <c7/>-ingång bredvid den befintliga: den sfäriskt harmoniska accelerationen, de zonala accelerationerna och luftmotståndsaccelerationerna, J2-sekulärhastigheterna och Klobuchar-fördröjningen. De befintliga ingångarna är oförändrade ända ned till sista biten, så ingen annan kinds tal flyttas. <c8/> låser fast hela ramen på 171 bytes och ett kontrollvärde per efemeridmodell, i den vanliga (ooptimerade) testprofilen, på varje plattform och utan någon spärr mot en baslinjevärd; <c9/> läser kindens källfiler från disk och misslyckas vid ett inneboende transcendent anrop, vid en <c10/>-samplare eller vid ett anrop till en modul som inte har granskats. Efter ändringen ger ett debug-bygge, ett release-bygge och WASM-bygget byteidentiska resultatdokument för alla fem <c11/>-scenarier. <b>Detta flyttar tal och redovisas här som en revision.</b> Kinden <c12/> är ny i den här releasen, så inget som publicerats i en tidigare release flyttas, men varje <c13/>-värde gör det, nativt och i WASM-bygget, och <c14/>-steget i <c15/> med dem: banvärdena eftersom passningen nu startar från de portabla elementen, klockvärdena eftersom sanningsklockan är en annan realisering av samma process. <c16/> är omgenererad från de nya resultaten; dess publicerade kontrollvärde för kodnings- och avkodningsscenariot var <c17/> och är <c18/> (position inom { "1.126" } mm från det exakta meddelandet där det var { "0.665" } mm, klocka inom { "0.185" } mm där det var { "0.451" } mm). Storleken på ändringarna i värdena under en millimeter är passningens känslighet, inte ett fel i någon av uppsättningarna: passningen är oförändrad och stannar fortfarande vid sin iterationsgräns.

seg-c30f4cef4797 = Seedad omsampling drog andra index på ett 32-bitarsmål.

seg-2bf668e23ec1 = <c1/> över <c2/> tar { "64" } bitar från generatorn på en 64-bitarsvärd och { "32" } bitar på en 32-bitarsvärd, så samma seed gav andra index, och lämnade strömmen på ett annat ställe, i WASM-bygget. Tre ställen drog på det sättet: percentilbootstrapparna i <c3/> (<c4/>, <c5/>), blandningen före varje träningsomgång i <c6/> och permutationstestet i <c7/>. De drar nu genom <c8/>, som alltid samplar som <c9/>: exakt vad en 64-bitarsvärd gjorde, så inget nativt tal flyttas. <b>Detta flyttar publicerade tal i WASM-paketet och redovisas här som en revision:</b> <c10/>-bootstrapintervallet för arean under kurvan (<c11/>, <c12/>) var <c13/> i webbläsaren och är nu det nativa <c14/>.

seg-80f783da1d4f = <b>STK-efemeridfilnamn från mover-id:n.</b> Ett mover-id som innehöll ett <c1/> eller ett mellanslag (ett konstellationsskal och en satellit, <c2/>) fick CLI:et att krascha vid <c3/>; varje id passerar nu genom en säker filnamnsdel (bokstäver, siffror, <c4/>, <c5/>).

seg-a0dc5729d5e9 = <b>Nutationstecknet för TEME→GCRS</b>, beskrivet under "Revisions to published numbers" ovan eftersom det flyttar publicerad utdata.

seg-5ecbf0787f39 = <b>Scenario-kinden <c1/></b> (<c2/>): sekunder tills en fritt gående klocka lämnar skyddsmarginalen för en tidsindexerad rutt- eller uppdragsslot, varje bidragande term vid den tidpunkten med den dominerande namngiven, tiden som återstår sedan senaste positionsbestämningen och det största intervall mellan positionsbestämningar som håller klockan innanför, efter avdrag för latensen i positionsbestämningen. Klockan kommer från ett klassstandardvärde, en förinställning ur ett telecom-timing-datablad, ett inbäddat datablad (maxima för Allan-deviation, åldrande, temperaturkoefficient) eller en uppmätt faspost. Ett överskridande bortom den längsta medelvärdestid som källan stöder flaggas som extrapolerat. Medföljande exempel: <c3/>. Se <c4/>.

seg-40dd4c16b760 = <b>Uppmätt rödbrusgolv.</b> En faspostens överlappande Allan-deviation passas med viktade minsta kvadrater i basen för vitt fasbrus och IEEE Std { "1139" } för frekvensmodulation (<c1/>), varje punkt viktad med sina ekvivalenta frihetsgrader, så att ett holdover-svar kan vila på klockans eget golv i stället för klassantagandet. En oviktad passning lade ett falskt flickergolv på en testpost med vitt brus och förkortade ett överskridande på { "2 000" } s med { "30" } %.

seg-22c09748488b = <b>Validering med undanhållen datamängd av holdover-inversionen på en riktig klocka</b> (<c1/>): passad på första tredjedelen av posten för cesium 5071A mot vätemaser landar de förutsagda ettsigma-överskridandena vid sex trösklar från { "0.5" } till { "2.5" } ns inom { "0.84" } till { "1.03" } av de överskridanden som uppmätts på de andra två tredjedelarna, mot en tröskel på { "1.5" } som fastställdes innan testet först kördes. En kontroll (Allan-deviationen vid en sekund tolkad som vitt brus) missar med en faktor på ungefär { "1 000" } och faller på tröskeln. Ny VALIDATED registerrad; arbetsflödet <c2/> kör den nu.

seg-cd73dc87a22f = <b>Samma förutsägelse på en riktig kristalloscillator</b> (<c1/>, <c2/>): på en uppmätt ugnsstyrd kristalloscillator är förutsägelsen för den undanhållna datamängden konservativ, vid { "0.59" } till { "0.70" } av det uppmätta överskridandet och aldrig senare, och mestadels utanför tröskeln { "1.5" }, eftersom oscillatorns brusgolv halverades under posten på 5.5 timmar; passad i urvalet landar den inom { "0.98" } till { "1.17" }. Kristallfallet är inte validated och förblir MODELLED. Körningen avslöjade också en saknad term: en kristalls frekvens driver, så modellen bär nu osäkerheten i den frekvens som är känd vid positionsbestämningen (<c3/>); utan den var förutsägelsen optimistisk med upp till { "2.5" }×.

seg-8519979d184c = <b>Samma förutsägelse på atomklockor i omloppsbana</b> (<c1/>, <c2/>): { "14" } dygn av International GNSS Service slutgiltiga klockor för GPS Block IIF-satelliterna, med protokollet nedskrivet innan data hämtades. Åtta av tio satelliter landar inom tröskeln { "1.5" }; G25 och G30 förutsäger överskridanden som är upp till ungefär dubbelt så sena som de uppmätta. Protokollet kräver att varje satellit klarar den, så fallet i omloppsbana är inte validated och förblir MODELLED; utfallet är fastlåst.

seg-0d666a725b77 = <b>Klockklasserna temperaturkompenserad kristall (TCXO), ugnsstyrd kristall (OCXO) och atomfrekvensnormal med rubidium (RAFS)</b> (<c1/>, <c2/>, <c3/>), de delar som en kommersiell småsatellitbuss eller en markgateway flyger med, var och en med hänvisning till ett publikt datablad (<c4/>). <c5/>, <c6/> och <c7/> tillagda. <c8/>:s <c9/> accepterar de tre nya id:na. Att lägga till varianter i en publik enum är en brytande ändring för en anropare som matchar den uttömmande.

seg-24ae82b115f5 = <b>Skyddsnivå för tidssynkronisering för en mottagare i omloppsbana</b> (<c1/>, den valfria sektionen <c3/> i kinden <c2/>): hur länge en markspoofer kan nå en satellit i låg omloppsbana per passage, den förskjutning som en spoofer med angiven maximal rampgrad ackumulerar innan satelliten lämnar dess räckvidd eller en oberoende kontroll körs, och om varje markkontakt- eller korslänkskontroll är oberoende av den spoofern. Reduceras exakt till <c4/> för en klocka utan flicker-, vitfas- eller slumpvandringsbrus. MODELLED.

seg-4032bc03fad5 = <b>Tre anteckningar</b>: <c1/> (bland annat mot vilket vandringsmått en slot bör accepteras: maximalt absolut tidsfel, inte maximalt tidsintervallfel eller tidsdeviation, och varför), <c2/> (ett signerat kommando som utförs vid en vilseledd tid felrouterar ändå) och <c3/> (var Kshana körs; ingen <c4/>-flygkärna erbjuds).

seg-712035e19515 = Releasen { "v0.27.3" } nådde crates.io (<c1/> och <c2/>) och PyPI, och stannade sedan vid npm, så npm, MCP-avbilden på ghcr.io, MCP-registret, JetBrains Marketplace och kshana.dev fick den aldrig. { "0.27.4" } bär samma motor, med releasefixen nedan, till varje kanal.

seg-bab8d4d1bc54 = <b>Npm-publiceringssteget namnger tarbollen med en explicit sökväg.</b> Npm tolkar ett bart <c1/> som GitHub-förkortningen <c2/>, så npm-jobbet för { "v0.27.3" } försökte klona <c3/> och misslyckades med "Permission denied (publickey)". Själva tarbollen hade byggts och attesterats. Steget publicerar nu <c4/>. Allt efter npm i releaseordningen (MCP-avbilden, JetBrains-pluginet, kanalparitetskontrollen och webbplatsen) hoppades över, som avsett.

seg-f9a112755eb1 = <b>Enhetskatalogerna för telecom-timing och <c1/> är undantagna från detektering av kopierad kod</b>, under samma policy och motiveringstest som de andra katalogerna. SonarCloud-kvalitetsspärren hade blivit röd på duplicering i ny kod ({ "4.0" } % mot { "3" } %), och varje duplicerat block var en enhetsrad eller en ITU-T-maskpost.

seg-3c3dacae06d6 = <b><c1/>: hur länge en liten drönares navigering håller efter att GNSS störs ut med jamming.</b> Den kör en tröghetsenhet av mikroelektromekanisk typ (MEMS) i flygkontrollerklass, en Bosch BMI088, mot en enhet av taktisk klass. GNSS-signalen (Global Navigation Satellite System) är nominell i { "100" } s och nekas sedan i { "60" } s (<c2/> visar varför en jammer i närheten gör så). BMI088:s bias är de residualer som finns kvar efter kalibrering vid start, hämtade från temperaturkoefficienterna i dess datablad (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s per K för gyrot och < { "0.2" } mg per K för accelerometern. Två antaganden är flaggade i filen: en uppvärmning på { "10" } K efter kalibreringen och fortsatt uppvärmning på { "1" } K per minut under flygning. Driften under flygning är felet som filtret inte hinner lära sig innan jamming börjar, och det är den som avslutar glidflygningen. Varje värde är modellerat; för att validera det krävs flygloggar från en miljö med jamming. <c3/> skriver ut det.

seg-7154f69a2b8a = <b>Varje <c1/>-sensor kan ställa in sitt eget filterprior</b> (<c2/> eller <c3/>, med <c4/> och <c5/>). Standardvärdet är oförändrat, så varje befintligt scenario ger samma resultat. En konsumentklassenhets residuala gyrobias ligger omkring { "26" } sigma utanför standardvärdet för taktisk klass, där filtret aldrig skulle lära sig den. Ett prior som inte är ändligt och positivt avvisas, och resultatet ekar priorn när en är inställd.

seg-2b54735b19aa = <b><c1/> ger en registeranvändare ett scenario att köra.</b> En <c2/>-användare har den körbara filen men ingen katalog <c3/>, så det första kommando som varje snabbstart gav misslyckades. Kommandoradsgränssnittet (CLI) bär nu de { "75" } referensscenarier som kan köras på egen hand, byte för byte, inbyggda i binären, kompilerade från <c4/> (<c5/>; tabellen finns i CLI-binären, så Python-wheelen och WebAssembly-modulen växer inte). <c6/> listar dem; <c7/> skriver ut ett. De övriga två filerna finns bara i repositoryt: <c8/> läser arkiverad data för månlaseravståndsmätning som bara levereras med repositoryt, och <c9/> är ett studiemanifest som kör tre syskonfiler med <c10/>. Att be om någon av dem anger varför och avslutar med { "2" } i stället för att skriva ut något som inte kan köras på egen hand. <c11/> håller tabellen i linje med katalogen i båda riktningarna, så en ny scenariofil som varken är medföljande eller namngiven som endast för repositoryt misslyckas.

seg-43249b6a1f3c = <b>Varje kvalitetsmått i ett klock-, bana-, hybrid- eller fusion-resultat anger nu om det är VALIDATED eller MODELLED, i själva resultatet.</b> Resultatdokumentet får ett block <c1/>, alltid dess sista nyckel. Det listar varje rapporterat mått (till exempel <c2/>) med dess nivå — VALIDATED betyder kontrollerat mot en oberoende extern referens, MODELLED betyder en modell från grundprinciper som testas internt — och den rad i verifieringsmatrisen som nivån läses från. Nivån kommer från <c3/> genom <c4/>, så det finns ingen andra tabell som kan glida isär. Innan dess förekom orden "validated" och "modelled" noll gånger i ett clock-holdover-resultat, och den som läste rå JSON (JavaScript Object Notation) hade inget sätt att skilja de två åt. Positionsvärdena för <c5/> och <c6/> har ingen ägande matrisrad, så de listas under <c7/> i stället för att få en nivå. Blocket innehåller inga tal. Att det är additivt är bevisat, inte antaget: om det tas bort återfås dokumentet från före ändringen byte för byte, för alla fem kinds (ett motortest), och båda golden-testerna (<c8/>, <c9/>) tar nu bort exakt denna nyckel, och bara när den är den sista, och hashar sedan resten mot sina <b>oförändrade</b> frysta konstanter. En lista i varje test fastställer vilka scenarier som måste bära blocket, så att undantaget inte i tysthet kan vidgas.

seg-8faf1981d797 = <b>En <c1/>-kind svarar i en tidssynkroniseringsingenjörs enheter: tidsfel, maximalt tidsintervallfel (MTIE) och tidsdeviation (TDEV), var och en med PASS eller FAIL och en marginal mot maskerna från International Telecommunication Union Telecommunication Standardization Sector (ITU-T).</b> Maskerna är avskrivna från de utgåvor som gäller: G.8272 (07/2025) för klasserna A och B av den primära referenstidsklockan (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) för den förbättrade PRTC i låst läge och i holdover (inklusive dess tidsfelskuvert, som stiger från { "30" } ns till { "100" } ns under en holdover-period som sätts av hur länge klockan var låst), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) för telecom-gränsklockor och tidsslavklockor, klasserna A till D, och G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) för nätgränserna vid referenspunkt C. Varje post som de rekommendationerna lämnar "för vidare studier" saknas, uppskattas inte, och <c2/> listar varje tal med dess tabell eller klausul och varje post som utelämnades. Rapporten anger också tiden till dess att varje tidsfelsbudget överskrids: som standard holdover-standardvärdet { "100" } ns för ePRTC, en nätallokering för holdover på { "400" } ns, gränsen { "1 100" } ns vid punkt C och det heltäckande kravet på { "1.5" } mikrosekunder för klass { "4" }.

seg-9e5325e1b0ca = Indata är antingen en syntetisk holdover eller en egen serie. Den syntetiska använder en av fyra oscillatorförinställningar (en ugnsstyrd kristalloscillator, en rubidiumnormal, en cesiumnormal och en chipskalig atomklocka), var och en med stabilitets-, åldrings- och temperaturvärdena från ett namngivet Microchip-datablad. Hur dessa värden blir vitt, flicker- och slumpvandringsfrekvensbrus, åldrande och en temperaturterm anges i varje rapport och märks MODELLED. En egen serie är <c1/>-par, inbäddade (så körs det i webbläsaren) eller, i nativa byggen, från en fil med kommaseparerade värden. MTIE/TDEV-tabellen, med varje vald masks gräns bredvid, skrivs som körningens CSV-artefakt.

seg-a23a96819dee = <c1/> är en holdover med rubidium på 24 timmar med åldrande, flicker och en daglig temperaturcykel: dess största tidsfel är { "603.2" } ns, den passerar { "100" } ns { "8 206" } s efter bortfallet och håller sig inom { "1.5" } mikrosekunder hela dygnet, och den faller på holdover-kuvertet för förbättrad PRTC, som en klocka som inte är av cesiumklass ska göra. <c2/> visar den inbäddade indatan. MTIE och TDEV som kinden rapporterar kontrolleras mot paketet allantools på en incheckad holdover-serie med { "2" } 048 prov, exakt för MTIE och till { "1.1e-15" } för TDEV, så matrisen får en VALIDATED rad och två MODELLED (masktranskriptionen och förinställningarna) och står nu på <b>{ "171" } rader — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Täckningen av fältenheter går från { "60" } av { "61" } kinds till { "61" } av { "62" }, och från { "1,742" } till { "1,788" } beskrivna fält. Kinden är ny och additiv: inget befintligt scenario, ingen fastlåsning och inget publicerat värde flyttas.

seg-5bb1ad9a34ec = Lekplatsen kör motorn i en Web Worker i bakgrunden, så ett långsamt scenario fryser inte längre sidan.

seg-b1ab3546f131 = <c1/> är värd för WebAssembly-motorn och <c2/> vidarebefordrar varje scenariokörning dit — körningar, parametersvep och exporterna SP3 / OMM / OEM / CSV. En körning som varar längre än { "150" } ms visar ett upptaget läge (Run inaktiverad, "Running… N s") och en Cancel-knapp som avslutar och startar om workern; en webbläsare som inte kan starta en modulworker faller tillbaka på den gamla vägen i huvudtråden. <c3/>, som utelämnades ur katalogen eftersom den fryste sidan, är tillbaka i den, märkt som långsam: den tar omkring { "13" } s i Chrome (fyra motoranrop på omkring { "3" } s vardera), under vilken tid sidan förblir responsiv.

seg-146200dfac7e = <b>Varje rapporterad storhet i <c1/> bär nu en enhet, en proveniensklass och en definition — den näst sista kinden på undantagslistan för hela craten.</b> Alla { "41" } numeriska fält i dokumentet RELEASED är beskrivna, så täckningen av fältenheter går från { "59" } av { "61" } kinds till { "60" } av { "61" } och från { "1,698" } till { "1,742" } beskrivna fält, medan efterslepet av fält utan definition är oförändrat på { "239" }.

seg-61b1219ae0e3 = Detta blockerades av den fastlåsning som fryser det släppta dokumentet, som namngav <c1/> som en nyckel som dokumentet aldrig får få. Att lägga till en hade inneburit att ta bort det påståendet och ta om baslinjen för tre hashar i tre filer — en form som inte går att skilja från att dölja en regression. I stället <em>bevisar</em> de två fastlåsningar som mäter detta dokument nu att tillägget är additivt: var och en tar bort blocket <c2/> igen och hashar om mot den konstant som frystes innan blocket fanns, och <b>båda konstanterna är oförändrade</b>. En mutation bekräftar att garantin är verklig — flytta ett släppt värde och ta om baslinjen för hela dokumentets hash så som en slarvig fix skulle göra, och ta-bort-och-hasha-om misslyckas ändå. Den tredje fastlåsningen, i det generiska registry-golden-testet, har fått ny baslinje i linje med de sex syskon som fick ny baslinje av exakt detta skäl, och dess värdebärande literal <c3/> flyttas inte.

seg-a73409e0b664 = <c1/> rapporterar mot vilken sanning varje Earth-orientation-rad bedömdes och hur ofta reservvägen användes.

seg-6e0493a39f1a = <c1/> får <c2/> och <c3/>. Golvet <c4/> bedöms mot Bulletin B final och kan bara använda epoker som publicerar en; varje <c5/>-rad bedöms mot <c6/>/<c7/>, som faller tillbaka på Bulletin A:s snabba värde. I den medföljande utdraget för { "2026" } är det { "12" } av { "31" } prov vid en dag, mot { "0" } vid golvet — så golvraden och prediktionsraderna bredvid den vilar på mätbart olika sanning, vilket rapporten nu anger i stället för att överlåta åt läsaren att dra slutsatsen av ett antal prov som stiger där nästlade horisonter säger att det inte kan göra det.

seg-7ba5be07fa8c = <c1/> avger en storleksmatchad keplersk baslinje.

seg-f9dc8fae6452 = <c1/> kör om den illustrativa konstellationen vid den HÄMTADE uppsättningens egna antal satelliter, närvarande bara när antalen skiljer sig åt. Antalet är en del av den utformningens geometri — RAAN och medelanomali sprids båda som <c2/> — så utan det bedömdes en hämtad uppsättning med fem satelliter mot en illustrativ med åtta, och utformning blandades ihop med storlek. För LANS-referensuppsättningen med fem satelliter visar det sig att { "8.68" } av gapet på 14.24 poäng i täckning beror på de tre saknade satelliterna och bara { "5.56" } poäng på utformningen; för de fyra farkoster som verkligen finns i månbana når en särskilt byggd uppsättning med fyra satelliter { "4.86" } % där de når { "0" } %. Ett test fastställer att den matchade raden är en ombyggd konstellation och inte den konfigurerade omdöpt, vilket var hur den först skrevs och vad körningen sedan rapporterade.

seg-2e7e4dbbb7f6 = <b>Nio förmågekort på den publika webbplatsen, som täcker { "22" } rader i verifieringsmatrisen som levererades utan något kort på produktnivå.</b> Motorn hade vuxit till en familj av förmågor — ARAIM-kontrollen mot publicerade referensvektorer från Working Group C, verklig hämtad geometri för månkonstellationer, månens nekandekontur med ett uppmätt C/N₀-band, steget från VLBI-schema till stationskovarians, optisk och RF-överlämning med felinjektion över modaliteter, prediktion av jordorientering i realtid mot arkiverad Bulletin A, delning av apertur mellan navigering och kommunikation, INS/TRN-glidflygning samt täckning av enheter och proveniens — var och en med en matrisrad och ett medföljande scenario, och ingen av dem nämnd på kshana.dev. Täckningen mellan kort och rader går från { "72" } av { "168" } rader till { "94" }.

seg-3dc189224fe8 = <b>Åtta scenarier har lagts till i lekplatsens katalog.</b> Knappen Run på ett förmågekort visas bara när <c1/> också innehåller filen; sex kort namngav ett scenario som den inte innehöll, så de visades utan någon möjlighet att köra dem — ett av dem, datumet för verklig laseravståndsmätning, hade varit i det tillståndet sedan det levererades. <c2/> spärrar nu invarianten i båda halvorna: ett korts mål för <c3/> måste vara medföljande under <c4/> <em>och</em> erbjudas av katalogen. Mutationstestat mot båda felfallen.

seg-2d69334516e9 = <b><c1/> avger sin geometri per satellit som <c2/></b> när en exportplats är konfigurerad (G11). Det är den största array som craten publicerar — { "2304" } rader i den släppta gemensamma tabellen för kommunikation och navigering — och den nådde konsumenter bara inuti JSON, den form som kapade en syskonscenarios kurva med 57 punkter till { "23" } punkter under en kolumn som påstod sig innehålla alla. En rad per länk, radantalet på rubrikraden, antennkolumnerna närvarande bara när en antenn var konfigurerad. En körning utan exportplats är byteoförändrad och skriver ingen fil.

seg-7958d26072f7 = SBOM:en beskriver nu det som levereras: { "60" } komponenter blev { "66" }.

seg-219cd333b000 = <c1/> listade varje paket i resolven för standardfunktionerna, inklusive dev-dependencies. Det gjorde att <c2/> och <c3/> — crates som bara används i test och inte kompileras in i någon artefakt — fanns med i materialförteckningen, och att kedjan <c4/> som PyPI-wheelen länkar (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>) saknades, vilken är den wheelens gräns mot främmande funktioner. Skriptet går nu genom resolve-grafen från paketet kshana via enbart normala kanter och build-kanter, över unionen av funktionsuppsättningarna default, <c13/> och <c14/> (npm-paketet bär samma SBOM), för varje målplattform. Det fastlåsta CycloneDX-formatkontrollutslaget har fått ny baslinje genom sin incheckade generator: { "60" } → { "66" } komponenter, { "53" } → { "60" } sammansatta licensuttryck, och fortfarande noll schemafel när dessa har placerats i standardformen <c15/>.

seg-23c98d31f749 = <b>CSV-tabellen för reproducerbarhet når varje ingång, inte bara CLI:et och Python-wheelen.</b> MCP-servern får ett sjunde verktyg, <c1/>, som kör ett scenario och returnerar den bytestabila tabell som CLI:et skriver som <c2/> — eller ett fel som namnger de kinds som publicerar en (<c3/>, <c4/>, <c5/> och <c6/> bara när <c7/> + <c8/> är satta). WebAssembly-modulen får <c9/>, som returnerar samma text eller <c10/>. MCP-rundturstestet och Python-bindningarnas tester låser nu den returnerade CSV:n byte för byte mot <c11/>, och låser att <c12/> returnerar skrivna bytes, och { "0" } utan att någon fil skapats för en kind utan tabell. Varje yta som anger antalet MCP-verktyg eller listar verktygen säger nu sju.

seg-86c3fed5e23a = <c1/> i WebAssembly-modulen: en motorkörning för varje utdata.

seg-3f2677cd280b = <c1/>, <c2/>, <c3/> och <c4/> kör var och en scenariot från början, så lekplatsen betalade för fyra fullständiga körningar per klick — omkring { "12" } s i stället för { "3" } s för <c5/> i en webbläsare. <c6/> returnerar <c7/> från en körning, och lekplatsen använder nu den. Den stämmer med de fyra separata anropen byte för byte.

seg-fa05c9ee0c6a = <b>REVISION: kopplingen för gyrobias i GNSS/INS-filtret hade fel tecken, och avbrottsvärdena för <c1/> ändras.</b> Det utökade Kalman-filtret (EKF) med felstillstånd håller båda tröghetsbiaserna som residualer (sant minus den löpande skattningen, återmatat genom addition). Accelerometerkolumnen drev hastighetsfelet med <c2/>, men gyrokolumnen drev lägesfelet med <c3/>. En residual gyrobias roterar i själva verket det beräknade läget med <c4/>, så varje skattning av gyrobias knuffade åt fel håll. Paketet förblev stabilt bara för att dess standardprior för gyrobias ({ "1e-4" } rad/s, 1-sigma) var tillräckligt snäv för att hålla dessa tillstånd stilla. Med ett bredare prior divergerade filtret även när den sanna gyrobiasen var noll: { "93" } m fuserat avbrottsfel blev { "4.3" } km. De publicerade värdena för <c5/> ändras enligt följande:

seg-47e22e713df6 = före (≤ { "0.27.2" })

seg-5215a0a41b89 = efter

seg-f58aecc6864c = kallatom-IMU, fuserat avbrotts-RMS

seg-c4fbd933ddb2 = { "96.1" } m

seg-002d765fca02 = { "1.9" } m

seg-d14616d4ea1b = kallatom-IMU, glidflygning inom specifikation ({ "50" } m)

seg-35f8f623ea28 = { "30" } s

seg-91645c14401b = { "60" } s (hela avbrottet)

seg-f297a2652cf8 = taktisk IMU, fuserat avbrotts-RMS

seg-0ac27c6d4206 = { "62.5" } m

seg-eda895cc3b86 = { "3.1" } m

seg-e0ab83f1d8d7 = taktisk IMU, glidflygning inom specifikation ({ "50" } m)

seg-5c526991a521 = { "37" } s

seg-743060da5543 = De fritt gående värdena ({ "130.7" } m och { "314.3" } m) ändras inte; de använde aldrig filtret. Paketets tidigare tolkning, att den fuserade glidflygningen begränsas av ett golv för överlämningsläge och därför inte förbättras med en bättre sensor, var en artefakt av detta fel och är tillbakadragen. Med konstanta, brusfria biaser lär sig filtret dem nu medan GNSS är tillgängligt, så den fuserade glidflygningen är ett bästa fall. Den externa filterpy-referensen (<c1/>) kontrollerar bara mätuppdateringarna, vilket är varför den aldrig såg propageringen. Två tester kontrollerar nu tecknet direkt och båda faller på det gamla. Det första, i <c2/>, matar en känd residual gyrobias genom strapdown och kräver att filtret förutsäger det resulterande lägesfelet inom { "2" } %. Det andra kräver att ett brett prior lär sig en gyrobias på { "1e-3" } rad/s och håller sig inom { "6" } m. Det plattformsoberoende golden-testet för <c3/> har fått nya fastlåsta värden av detta skäl och inget annat.

seg-f764678e3376 = <b>Varje snabbstart för register körs nu som skriven på en ren maskin.</b> Uppmätt före denna ändring läste exemplen för crates.io och PyPI (Python Package Index) <c1/>, som en registerinstallation inte har, och npm-exemplet kraschade under Node.js med <c2/>, eftersom paketets <c3/> hämtar sin WebAssembly-binär och Node:s <c4/> inte kan läsa en lokal fil. Nu:

seg-e77a540d2f90 = <c1/> och <c2/> bär det scenariot inbäddat, som <c3/> redan gjorde. Rust-blocket är ett helt program med sin egen <c4/>, eftersom raden <c5/>, dold för rustdoc, som det tidigare slutade med visas på crates.io och inte kompilerar när den klistras in. <c6/> kompilerar det fortfarande byte för byte, och avvisar nu även en dold rad i blocket.

seg-ea5204ced0d2 = <c1/> skiljer webbläsaren från Node.js och ger ett Node-recept som läser binären från disk och skickar den till <c2/>. Doc-sync-testet accepterar <c3/> som den laddare wasm-bindgen genererar.

seg-ebb763695c59 = Alla tre bäddar in scenariot med sina provenienssträngar oförkortade, så scenariohashen är <c1/> på varje yta. Npm-exemplet brukade förkorta dem, vilket gav det en annan hash än CLI:et.

seg-dc52363432f8 = Reproducerat från lokala byggen av detta träd: ett nytt <c1/>-projekt med ett sökvägsberoende på den paketerade craten byggde och körde Rust-exemplet; en wheel byggd med maturin från de paketerade källorna, installerad i en ny virtuell miljö, körde Python-exemplet; och paketet <c2/>, packat och installerat med npm, körde Node-receptet. Alla tre skrev ut samma sammanfattningsrad.

seg-07e465a602f1 = <c1/> fungerar från en klon.

seg-77ce31300b69 = <c1/> sätter <c2/>. Utan det vägrade cargo med "could not determine which binary to run", vilket varje rad med <c3/> i dokumentationen drabbades av.

seg-2d516597b5f5 = <b>CLI:ets fel under första minuten säger vad man ska göra härnäst.</b> En scenariosökväg som inte finns lägger nu till ett tips som pekar på <c1/>, och ett andra positionellt argument skriver ut användningstexten och namnger även argumentet. <c2/>, <c3/>, felet för okänt alternativ (exit { "2" }) och <c4/>:s enradiga <c5/> vid framgång fanns redan på main. <c6/> täcker nu alla dem, eftersom inget test körde binären för något av dem tidigare.

seg-fdd9a27ccfc4 = <b><c1/> i Python är dokumenterad som att den returnerar en JSON-sträng, inte en lista.</b> Den returnerar samma metadata som <c2/>, serialiserad, så att iterera över den går igenom tecken. Den behåller sin strängretur så att befintliga anropare inte går sönder. <c3/>, bindningens doc-kommentar, <c4/> och <c5/> säger nu så och pekar på <c6/>.

seg-f0e0c8c12f8a = <b>De tre README-filerna för register skriver ut varje förkortning vid första användningen.</b> PNT är nu utskrivet i sloganen, där det först förekommer, och CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL och API är utskrivna i de filer som använder dem. Rubriken på tabellen över oberoende referenser säger inte längre "CI-gated" innan CI är definierat.

seg-554c5b0c9c60 = Rättade ett publicerat värde: tillgänglighet för ARAIM med två konstellationer på de medföljande Celestrak-TLE:erna för GPS + Galileo.

seg-1f023a822c91 = <c1/> angav att tillgängligheten stiger från { "0.21" } till { "0.67" } när Galileo poolas, under ett VAL på { "12" } m, och att det konstellationsfelrobusta läget är begränsat med bara två konstellationer. Det kom från <c2/> som propagerade varje satellit från sin egen TLE-epok (<c3/> släpper epoken), och epokerna i dessa filer spänner över { "70.6" } h (GPS) och { "335.7" } h (Galileo), så satelliterna befann sig vid inbördes oförenliga tidpunkter. Testet behåller nu varje epok (<c4/>) och utvärderar varje satellit vid ett gemensamt UTC-ögonblick, den senaste TLE-epoken i uppsättningen (2026-06-07T07:{ "21" }:{ "04" }). Den uppmätta tillgängligheten över samma rutnät på { "24" } h med 289 prov blir enbart GPS { "0.993" } (var { "0.208" }), poolad { "1.000" } (var { "0.671" }) och konstellationsfelrobust dubbel { "0.990" } (var { "0.031" }); vid APV-I-gränsen går det dubbla läget från { "0.180" } till { "1.000" }. Slutsatsen vänds: på en konsistent himmel bär två konstellationer hypotesen om konstellationsfel vid ett VAL på { "12" } m. Samma värden fås med den tidigaste TLE-epoken som referens. En självkontroll i testet låser dess tillgänglighetsloop prov för prov mot <c5/>, så den enda skillnaden är tidsjusteringen. <c6/> och <c7/> §{ "3" } bär de nya talen; posten för { "0.13.0" } nedan lämnas som släppt.

seg-3173a2e03521 = <b>De publika ytorna marknadsför inte längre RINEX { "4" } som validated.</b> Motorn avvisar nu en RINEX { "4" }-navigationsfil vid namn i stället för att avkoda den fel, men standardrutnätet visade fortfarande ett kort "RINEX { "3" } / { "4" }" med en <em>validated</em>-pill, bunden till navigationsparserns RINEX-3-evidens. Kortet är nu "RINEX { "3" }", och README, <c1/>, <c2/>, <c3/> och förmågesammanfattningen anger vad som är sant: RINEX 3.0x-observationsfiler tolkas, observationslayouten { "4.00" } förväntas göra det men ingen { "4.00" }-fil har lästs genom koden, och RINEX { "4" }-navigationsfiler avvisas.

seg-c9bb514acb7a = <b><c1/> säger när "ok" betydde att det inte fanns något att kontrollera.</b> Omkring två tredjedelar av katalogen publicerar inget obligatoriskt fält — de paketen kör sin referenskonfiguration från en tom kropp — så lintern kunde bara skriva ut "ok" för dem, med samma ord som den använde efter att ha kontrollerat sex fält. Framgångsraden anger nu antalet obligatoriska fält som den fann närvarande, eller att kinden inte kräver något.

seg-06b324d00285 = <b><c1/> avvisar ett icke-numeriskt <c2/> eller <c3/>.</b> Under bash { "3.2" } gjorde <c4/> att den numeriska jämförelsen gav fel och utvärderades som falsk, så spärren meddelade "repeatability loop SKIPPED (REPEAT={ "0" })" för ett värde som inte var { "0" } och skrev ändå ett kvitto. Båda inställningarna avslutar nu med { "2" } om de inte är rena heltal.

seg-09d04ffdd9ac = MSRV anges som { "1.85" } överallt där en människa läser det.

seg-dafc23725315 = <c1/> flyttades till { "1.85" } i förra releasen; README-märket, installations- och felsökningstexten, <c2/> och MCP-cratens egen motivering sa fortfarande { "1.75" }.

seg-c2fa8a31058c = <b><c1/> i Python-bindningen rapporterar bytes, inte "chars".</b> Den skrev ut <c2/> av UTF-8-strängar, vilket är ett antal bytes: { "710" } "chars" för en tabell med 708 tecken.

seg-6b4452a4e340 = README dokumenterar inte längre <c1/> tillsammans.

seg-47d83e4d847b = <c1/> är en flagga för ett enda scenario, ignorerad med <c2/> (binären varnar). De två exempel att kopiera och klistra in i README.md och README.crates.md visar nu studiekommandot ensamt.

seg-5ed7f8330b2d = <b>Webbplatsens evidens för klockstabilitet anger båda observerade toleranserna.</b> Serien för cesium 5071A reproduceras till ≤ { "3e-5" } och PHASE.DAT till ≤ { "5e-5" }; stycket angav { "3e-5" } för båda.

seg-8bba7f1171f3 = Två filer med motorutdata spåras inte längre.

seg-ea9bf1d14371 = <c1/> stämplades av motor { "0.20.0" } med varje kvalitetsmått tomt, och README:s eget studiekommando skrev över dem, smutsade ner trädet och blockerade push-spärren. <c2/> / <c3/> ignoreras nu som de andra fyra motorutdatafilerna.

seg-77ce9b90859d = <b>Ett seed-svep i lekplatsen misslyckas inte längre vid varje körning.</b> Svepet steg heltalsreglaget <c1/> linjärt ({ "1" }, { "10.9" }, { "20.8" }, …), och motorn, som läste det som <c2/>, avvisade varje bråkvärde. Heltalsreglage sveper nu distinkta heltal.

seg-e1b1e1360eb9 = <b>Varje nedladdning från lekplatsen anger vilken motor och vilken indata som gjorde den.</b> Några kinds (t.ex. <c1/>) avger inget <c2/> eller <c3/>, så deras nedladdningar fick det vanliga namnet <c4/>. Namnet faller nu tillbaka på den inlästa motorns version och ett FNV-1a-64-fingeravtryck på 12 hex-tecken av scenariotexten.

seg-0181e86b576a = <b>Den publicerade craten är mindre än hälften så stor som förut, och <c1/> bygger enbart CLI:et.</b> Paketet brukade innehålla artiklarna, deras inlämningspaket, artefakterna med artikelfigurer, notebooks, <c2/>, underhållsskripten och exempelprogrammen. Inget av dem kompileras av biblioteket eller CLI:et. Det innehöll också de tre interna generatorerna under <c3/> (<c4/>, <c5/>, <c6/>), så en registerinstallation kompilerade och installerade fyra körbara filer, tre av dem användbara bara i en utcheckning. Dessa träd och de tre generatorkällorna är nu exkluderade. Cargo listar ett pakets binärer utifrån de filer det innehåller, så det publicerade manifestet namnger bara <c7/>. I en klon hittas generatorerna fortfarande automatiskt, så <c8/> och releasejobbet som kör <c9/> är oförändrade. Mätt med <c10/>: { "763" } filer, { "16.7" } MiB, { "6.8" } MiB komprimerat före; { "591" } filer, { "10.5" } MiB, { "3.0" } MiB komprimerat efter. Dess verifieringsbygge, som bara kompilerar de paketerade filerna, går igenom. <c11/> på den paketerade craten installerade en körbar fil, <c12/>.

seg-567c7059286f = <b>Utdata som en tidssynkroniseringsingenjör kan läsa: inga fler <c1/>, inga fler <c2/> utan angrepp, och webbplatsens antal stämmer med README-filerna.</b> Detta är en visningsrevision. Inget publicerat tal ändras; JSON-värdena är identiska, vilket golden-hasharna ovan bevisar.

seg-849fa9a29f07 = Enradssammanfattningen skrev ut den optiska klockans tidsfel vid 95:e percentilen (p95) som <c1/> medan tabellen bredvid visade { "1.20e-4" } ns. Ett tidsvärde som inte är noll men för litet för en decimal skrivs nu ut med tre värdesiffror (<c2/>); en exakt nolla skrivs fortfarande ut som <c3/>. HTML-rapporten (HyperText Markup Language), studiens jämförelsetabell och lekplatsens nedladdningsbara rapport använder samma regel, så inget värde som inte är noll skrivs heller ut som <c4/>.

seg-c44323babd1e = <c1/> är en analytisk gräns för spoofingdetekterbarhet som bara betyder något mot ett konfigurerat angrepp. Kinds <c2/>, <c3/>, <c4/> och <c5/> konfigurerar inget, så deras sammanfattning skriver nu ut <c6/> i stället för ett tal som <c7/> som läses som en misslyckad detektering. Värdet finns kvar i <c8/>, markerat <c9/> med skälet i <c10/>, och rapporttabellerna visar "not applicable". Kinden <c11/> bedömer fortfarande detektering.

seg-f54d5ffb7dff = Två sammanfattningsfastlåsningar i <c1/> flyttades av exakt dessa två skäl och inga andra: <c2/> (kvant-p95 och båda värdena för <c3/>) och <c4/> (båda värdena för <c5/>; dess p95-värden är exakt noll). Deras hashar för hela dokumentet flyttades inte. De förväntade sammanfattningarna i README, de tre handledningarna och deras undervisningsscenarier är uppdaterade så att de stämmer, och <c6/> kontrollerar undervisningskopiorna mot motorn.

seg-e8e012376fa3 = Lekplatsens guidade tur öppnas inte längre vid första inläsningen. Dess modala ruta fångade de första klicken och dess spotlight scrollade sidan bort från där besökaren landade. Den startar från knappen "Take the 60-second tour" eller den flytande Tour-knappen.

seg-4d60d4ea4d7d = Sidan scrollar inte längre i sidled på en telefon. Vid { "390" } px kom varumärkesraden och GitHub-knappen upp i omkring { "410" } px innehåll, ett överskott på { "4" } px; sidhuvudet ryms nu från { "320" } px och uppåt, och tabellen med kvalitetsmått scrollar inuti sin egen ruta i stället för att vidga sidan.

seg-f6ec6a64071d = Förmågeutforskaren inledde med sitt eget antal kort ("{ "46" } capability cards … { "17" } backed by an external oracle") bredvid README-filer som säger { "64" } av { "168" }. Den inleder nu med verifieringsmatrisen, läst från den genererade <c1/> (samma matris som README-antalen är fastlåsta mot), och nämner korten efteråt som det sammanfattande lager de är. <c2/>, ett nytt steg i arbetsflödet för kontinuerlig integration (CI), kontrollerar aritmetiken och korskontrollerar README.md och sidans beskrivningar; <c3/> låser fast kopplingen från Rust-sidan.

seg-606098743e57 = <b>Den publika beskrivningen inleder nu med tidssynkronisering och holdover, den bäst validerade domänen.</b> Öppningen av README och <c1/> presenterar Kshana som en öppen, reproducerbar, proveniensmärkt evidensmotor för PNT-resiliens: tidssynkronisering och holdover för kritisk infrastruktur först (estimatorerna för Allan, modifierad Allan, tidsdeviation och maximalt tidsintervallfel samt holdover-inversionen av glidflygningsvarians är de VALIDATED rader som ligger bakom), kvant som en neutral avvägningsmetod mellan kvant och klassisk vars resultat märks MODELLED, och navigering på Månen / cislunärt och i djuprymd som underhållna förmågor snarare än huvudrubriken. Båda sidorna säger nu vad Kshana inte är — inte en simulator för radiofrekvenssignaler eller en rigg för hardware-in-the-loop, inte en ersättning för MATLAB/Simulink, STK eller Orekit — och pekar på den nya kinden <c2/> och <c3/>. Den gamla raden "there is no good open tool" är borta: en sökning som inte hittar något är inget belägg för att inget finns. <c4/> får en odaterad prioritetsordning (tidssynkronisering först, kvantavvägningen som andra, månen underhållen) och tappar tre inaktuella poster (Coriolis- och ljusförskjutningssystematik, NRHO-begynnelsevillkoren och månscenariot, alla levererade); README:s rad "Coriolis and light-shift remain roadmap" rättas på samma sätt.

seg-7bc48692be0b = <b><c1/> slutade underdriva.</b> Raden för jordfasta referenssystem sa "none" medan matrisen graderar GCRS→ITRS VALIDATED; den är nu "full", och raden för kärnreferenssystem anger ANISE-korskontrollen som levererad. Guidat läge var upptaget som färdplan; lekplatsen har levererat guidade reglage och en guidad tur. En genomgång mot <c2/> rättade fem rader till som föregick sina valideringar: kraftmodellen Cowell och banbestämning med batch/sekventiell metod mot Orekit { "12.2" }, markstationspassager mot Orekits elevationsdetektor, kärnan för geometrisk försämring av precisionen mot gnss_lib_py och OEM-import mot den oberoende parsern <c3/>; raden för verifiering och validering namnger nu de spärrar som kontrollerar att varje citerat test finns.

seg-9d144df304ca = Ordlistan förklarar vad en resultatfil säger.

seg-eed672b2f8fd = <c1/> får förklarande poster på klartext för utdatatermerna (holdover, p95, integritet, säkerhetspoängen, PDOP, <c2/>, <c3/>), termerna för telecom-tidssynkronisering (tidsfel, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) och de tre evidensnivåerna (VALIDATED, MODELLED, PARTNER).

seg-1a4f9d5eef96 = <b>Förkortningar skrivs ut vid första användningen i varje handskrivet publikt dokument.</b> README och { "24" } filer under <c1/> hade flera hundra förkortningar som användes före sin utskrivna form, eller utan den; var och en är nu utskriven där den först förekommer i den filen. De tre genererade filerna (<c2/>, <c3/>, <c4/>) lämnas orörda: de skrivs från <c5/> och <c6/>, så deras formuleringar måste ändras vid källan.

seg-2889ce118381 = Radtäckningen har ett mätvärde som gäller som referens.

seg-9c4684c0a4ef = <c1/> anger { "95.63" } % ({ "37,697" } av { "39,419" } rader) från CI-jobbet <c2/> på <c3/>, och <c4/> låser de fem publika ytornas "~{ "96" }%" mot det — det enda rubriktal som var handunderhållet, och som redan hade flyttats en gång obemärkt.

seg-ebd36b7291df = Nya doc-sync-spärrar för ytor som inget läste.

seg-3dd44fc69a28 = <c1/> kontrollerar varje <c2/> i ett JavaScript-block mot WebAssembly-exporterna, och låser Rust-exemplet i README.crates.md byte för byte mot en kopia som testbinären kompilerar. <c3/> faller om <c4/> förlorar <c5/> eller SECURITY.md slutar ange det. <c6/> söker nu också igenom <c7/> och de tre README-filerna för register, och varje standard på webbplatsen måste ange sin <c8/> uttryckligen.

seg-a506d14f3447 = De två kontrollerna av klockor med verklig hårdvara körs på en runner.

seg-c7f8b8627137 = <c1/> (månadsvis och vid dispatch) hämtar serierna 5071A och PHASE.DAT och kör båda testerna med <c2/>, så att en saknad indata ger fel i stället för att hoppas över. Båda hämtningsskripten är låsta till en och samma allantools-commit och verifierar SHA-256.

seg-3b4a7fee3cd0 = <b>Python-typstubben kontrolleras mot den byggda wheelen</b> (<c1/> i bindningsjobbet), vilket är hur <c2/>/<c3/> levererades utan stub.

seg-24c2ccf3634a = <b>Ordlistan definierar URE, EOP, FoM, CTI och TIB</b>, som README och registret använde utan förklaring.

seg-ae044195cd47 = <b>Varje kinds publicerade fältkontrakt är nu sant, och ett test håller det så.</b> Fem av de { "61" } kinds ändrades. Kinds med ett icke-tomt <c1/> går från { "21" } till { "22" }: <c2/> kräver nu <c3/> (ett bart <c4/> brukade passera <c5/> och sedan misslyckas i körningen), och <c6/> lägger till <c7/>, som dess körning redan krävde. En obligatorisk post får använda <c8/> (en av dessa) och <c9/> (alla dessa tillsammans); <c10/> förstår båda. <c11/>, <c12/> och <c13/> publicerar { "9" } verkliga valfria fält som de hade utelämnat. <c14/> säger nu att <c15/> är obligatoriskt för varje kind utom <c16/>. <c17/> kontrollerar varje kind mot dess medföljande scenario: att ta bort någon obligatorisk post måste få körningen att misslyckas, och ett dokument som bara innehåller de obligatoriska fälten måste kunna köras.

seg-09ba716f3e97 = Anteckningarna för JetBrains Marketplace är spärrade.

seg-938ff48e7a2d = <c1/> misslyckas nu om inte den nyaste posten <c2/> i <c3/> namnger den version som levereras; sju publicerade versioner hade serverat anteckningarna för { "0.22.0" } oförändrade.

seg-3d38550854e0 = Den tekniska rapportens täckningsvärde är det uppmätta.

seg-bd312cd26746 = <c1/> sa "near { "97" } %"; den säger nu nära { "96" } % ({ "95.63" } % uppmätt, <c2/>) och är den sjätte yta som täckningstestet låser.

seg-934680d402da = <b>Motorklienten utanför huvudtråden är testad</b> (<c1/>, i CI): tillåtelselista för dispatch, avbryt och starta om, de tre reservvägarna i huvudtråden och krashåterställning, mot en låtsasworker.

seg-fd5f9a8a4f43 = <b>Ingenting publiceras förrän den taggade committen har klarat sina tester, och en release är inte klar förrän varje register serverar den.</b> Ordningen är nu tagg, verifiering, publicering, paritet, webbplats, i en körning av <c1/> (<a1><c2/></a1>).

seg-745b11c8ed74 = Publiceringen väntar på utslaget.

seg-e66c890cf6c0 = <c1/>, <c2/> och <c3/> startar inte längre vid tagg-pushen; <c4/> anropar dem från jobb som <c5/>. Tidigare tävlade de mot den: vid { "v0.27.2" } hade crates.io, npm och Python Package Index (PyPI) alla publicerat inom { "4.5" } minuter efter taggen, och <c6/> returnerade { "84" } minuter efter den; vid { "v0.27.0" } publicerade npm och PyPI medan crates.io-jobbet misslyckades. En manuell omkörning på en tagg hålls tillbaka av den nya <c7/>, som kräver en grön <c8/> för exakt den committen från Actions-gränssnittet och vägrar i alla andra fall.

seg-3800247c81f2 = <em>Allt byggs innan något laddas upp</em>, och crates.io, vars paketeringssteg är det som misslyckades mitt under en release, publicerar först.

seg-6929a7608da7 = <em>En saknad registertoken får jobbet att misslyckas</em> i stället för att hoppa över uppladdningen och rapportera framgång.

seg-460811602293 = En paritetskontroll efter publicering.

seg-86eb0fab2f7c = <c1/> frågar crates.io (<c2/> och <c3/>), npm, PyPI (källdistributionen och alla sex plattformswheels) och ghcr.io tills var och en serverar versionen, eller låter körningen misslyckas; docs.rs och registret för Model Context Protocol (MCP) rapporteras, men krävs inte. Körd mot tidigare releaser visar den att { "0.22.0" } saknas på npm och PyPI, { "0.23.0" } på PyPI och { "0.27.0" } på crates.io.

seg-79578a00fd78 = <em>Färdigbyggda kommandoradsbinärer för macOS (Apple silicon och Intel) och Windows x86-64</em>, namngivna efter mål (<c1/> och så vidare), bredvid Linux-binären <c2/>, vars namn är oförändrat. En fil <c3/> täcker varje tillgång, och <c4/> kontrollerar den och kör macOS- och Windows-binärerna på deras egna system.

seg-3e1f5afa9f2a = <em>kshana.dev visar en release, inte <c1/>.</em> Den brukade driftsättas om vid varje push till <c2/> medan dess sidor namngav den senaste releasen. <c3/> bygger nu bara en releasetagg: releasen skickar den en gång när varje kanal serverar versionen, och en manuell dispatch driftsätter om den senaste releasen (eller en namngiven).

seg-43da8f3f171e = En källa till wheels.

seg-b911ac65e231 = Den handkopierade matrisen med sex mål i <c1/> är borta; den anropar <c2/>, så att auditwheel-taggspärren och kontrollen av byte-reproducerbarhet nu bedömer de wheels som PyPI tar emot, och ett fel i någon av dem stoppar releasen.

seg-194c4b019a4c = <em>Låsta byggverktyg.</em> Varje arbetsflöde begär Rust { "1.93.0" } (jobbet msrv sin egen version); <c1/> och <c2/> hade begärt <c3/>, och loggen för { "v0.27.2" } visar att rustup installerade { "1.98.1" } och sedan kompilerade med { "1.93.0" } bara för att <c4/> väger tyngre. wasm-pack är låst till { "0.13.1" } (den version som byggde { "v0.27.2" }, som det olåsta installationsskriptet valde) med en kontroll av checksumma, och mcp-publisher till { "1.8.1" } med dess publicerade SHA-256. <c5/> misslyckas nu om ett arbetsflöde begär en annan kompilator eller pipar ett nedladdat skript in i ett skal. Inget verifieringsjobb, ingen golden-fastlåsning och inget lokalt spärrskript togs bort eller lättades.

seg-9e2a7376367e = <b>Varje GitHub Action från tredje part är låst med commit-SHA</b> — { "93" } referenser i { "15" } arbetsflöden, { "92" } av dem nya — med taggen kvar som avslutande kommentar för att Dependabot ska uppdatera den. Undantaget är <c1/>, vars tagg är verktygskedjans väljare.

seg-6afb4a8770b0 = <b>Basskikten i MCP-serverns avbild är låsta med multi-arch-digest</b>, och Dependabot bevakar nu Dockerfile för <c1/>, så att OS-skikten fortfarande får säkerhetsuppdateringar — genom en granskad PR.

seg-4ea8b158b408 = Kontrollen av tagg mot manifest körs i de två publiceringsarbetsflöden som levererar taggens version.

seg-4b77764e955d = <c1/> (ghcr-avbild, MCP-registret) och <c2/> (Marketplace) tävlar mot <c3/> i stället för att vänta på det, så en felaktigt skuren tagg spärrades bara i ett syskon. Båda kör nu <c4/> före bygget.

seg-bf90c4063843 = <b>Fyra säkerhetsrådgivningar som Dependabot gav upphov till den dag dess varningar slogs på är åtgärdade.</b> MCP-servern flyttas från <c1/> { "1.7" } till { "2.2" }: tre rådgivningar mot <c2/> < { "2.1" } (en läcka i sessionstabellen för Streamable-HTTP, saknad validering av OAuth-skyddade resurser, anpassade rubriker som följer en omdirigering mellan ursprung) — inga nåbara här, eftersom servern bara talar stdio, men en publicerad crate bör inte låsa en sårbar SDK. Makrona i <c3/> { "2" } kräver Rust { "1.88" }, så enbart <c4/> deklarerar nu <c5/>; biblioteket <c6/> stannar på { "1.85" }. Den enda API-ändringen (<c7/> → <c8/>) är genomförd, och rundturstesterna går igenom. SonarQube-skanningsåtgärden flyttas från v5 till v6, vilket åtgärdar en rådgivning om argumentinjektion (≥ { "4.0" }, < { "6.0" }).

seg-2652aaad177e = <b>Varje Rust-objekt som en rad i verifieringsmatrisen citerar slås nu upp mot craten.</b> Den befintliga spärren kontrollerade citat som såg ut som filsökvägar; { "63" } av de { "164" } raderna utan PARTNER namnger sin evidens som ett objekt i craten i stället — <c1/>, <c2/>, <c3/> — och ett token utan ändelsen <c4/> var osynligt för en sökvägsskanner. De raderna kunde ha namngett en omdöpt modul, en tömd testmodul eller en funktion som aldrig funnits, och varje spärr hade förblivit grön.

seg-01eee5115e3f = <c1/> löser alla { "339" } sådana citat genom modulträdet, kräver att varje rad utan PARTNER namnger minst ett test som faktiskt bär <c2/>, och kräver att PARTNER-rader inte namnger något. Fyra mutationer användes för att bedöma det: att döpa om en citerad modul, att peka en rads enda testcitat på en funktion som inte är ett test, att döpa om den verkliga <c3/> och att ta bort attributen <c4/> från den — var och en blir röd på det påstående som äger den.

seg-7731d549c739 = En rad var redan fel: <em>Alternative / complementary PNT</em> citerade <c1/>, en glob, som inte är ett citat. Den namnger nu <c2/> och de tre testmodulerna i craten bakom den.

seg-cf6fd64368de = <b>De publicerade figurerna kontrolleras på nytt mot motorn vid varje bygge</b> (<c1/>). De tre demodiagrammen i README är motorns egen utdata <c2/> och inget körde om scenariot; artikelns två crossover-studier genererades en gång och checkades in; och README anger fyra kvalitetsmått i löptext bredvid <c3/>. Alla tre är nu låsta mot levande motorutdata.

seg-276b65a8f76a = Att pussla ihop dem gav det användbara resultatet: demodiagrammen hade ritats vid motor { "0.22.0" } och artikelns crossover-JSON vid { "0.20.0" }, och vid { "0.27.1" } <b>är varje plottat värde i alla fem artefakter identiskt</b> — de tre diagram-SVG:erna skiljer sig från en ny körning med exakt två tecken vardera, versionsstämpeln i fotraden. Diagrammen har ritats om så att fotraden stämmer. Artikelns JSON lämnas medvetet stämplad { "0.20.0" }: den är protokollet över den körning vars figur en publicerad artikel bäddar in, och att stämpla om den skulle göra anspråk på en proveniens som PDF:en inte har. Spärren kontrollerar i stället den starkare egenskapen — att den nuvarande motorn fortfarande reproducerar varje publicerat värde.

seg-c88647c5f2fc = SonarCloud-analyser registrerades som <c1/>, så att <c2/> för ny kod aldrig avancerade: den var fortfarande förankrad vid analysen 2026-07-02, bedömde åttiotvå dagars arbete som ett enda delta och mätte { "7877" } "nya" duplicerade rader mot en tröskel på { "3" } %. Skanningen skickar nu cratens version. Den underliggande dupliceringen är verklig och döljs inte av detta: den är koncentrerad till de deklarativa registren <c3/> som upprepas i <c4/>, <c5/>, <c6/>, <c7/> och <c8/>, och i verifieringstabellen med 168 rader, och den namnges här som arbete att göra i stället för att uteslutas ur mätningen.

seg-f2a0960a6f11 = <b><c1/> hade inget lås för en enda skrivare, och varje körning skrev samma logg.</b> Det handlar inte om ordning och reda: kvittots <c2/>, <c3/> och <c4/> läses tillbaka UR den loggen, och pre-push-kroken litar på kvittot. En spärr som hade dödats men vars testbinär fortfarande levde fortsatte skriva i den fil som nästa körning just hade trunkerat — så en körnings antal kunde ha redovisats som en annans, och tillåtit en push på grundval av en svit som aldrig kördes på det träd som pushades. Det är nu en spärr per utcheckning (den vägrar med exit { "75" } bredvid en levande, och rensar ett gammalt lås vars pid är borta) och en logg per körning, med <c5/> uppdaterad från den körning som avslutas på vägen ut. Båda riktningarna är testade: en levande pid vägras, en död rensas.

seg-687d6fe87221 = <c1/> påstod att dess tester "do <b>not</b> prove the named test/oracle strings resolve to live code". Två spärrar gör nu precis det, så modulens dokumentation sa motsatsen till sanningen; den anger nu vad som kontrolleras maskinellt och vad som lämnas åt mänsklig bedömning. En inaktuell hänvisning till <c2/> — modulen heter <c3/> — är rättad i syskonspärrens egen dokumentation.

seg-014070f0873c = <b><c1/> skrevs om 2026-09-22 och force-pushades.</b> Tio commits blev fyra. Omskrivningen vek in varje commit som lämnade en spärr röd i den commit som rättade den, så att varje commit på <c2/> nu har ett träd som går igenom, och tog bort de avbrutna körningar som en samtidighetsgrupp över hela grenen hade lämnat på varje ersatt commit.

seg-b48d6cfc3b42 = Ingenting kastades bort. Commits från före omskrivningen går fortfarande att nå genom de taggar som pekar på dem, och det slutliga trädet är byteidentiskt med det träd som omskrivningen utgick från — <c1/> mellan den gamla toppen och den nya är tom förutom de tre arbetsflödesfiler som denna release ändrar.

seg-0549cfdc6d69 = De ersatta SHA:erna, för den som håller en referens till någon av dem:

seg-14812deb1b6b = gammal

seg-c63f549e6a1d = ämne

seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

seg-9c220336c895 = <b>Taggarna { "v0.27.0" } och { "v0.27.1" } flyttades medvetet INTE.</b> De pekar fortfarande på <c1/> och <c2/>, de exakta commits vars träd gav de artefakter som nu är live på crates.io, npm, PyPI, ghcr.io och MCP-registret. En cratens <c3/> registrerar den sha1 den paketerades från, register är oföränderliga, och SLSA-attesteringen av byggproveniens på tillgångarna i releasen { "v0.27.1" } är bunden till den committen. Att flytta taggarna hade lämnat varje en av dessa publicerade artefakter pekande på en commit som inte längre finns. Genom att lämna dem förblir de gamla commits nåbara och varje publicerad provenienskedja löses upp, till priset av två taggar som inte längre är förfäder till <c4/> — vilket är varför denna release finns: { "v0.27.2" } ger <c5/> en egen tagg, paketerad från en commit som finns på den.

seg-3c644384256f = Detta är den andra redovisade omskrivningen av den här historiken; den första, 2026-09-21, kanoniserade författarskap och är dokumenterad i anteckningarna för { "0.27.0" } med sina egna två hängande crate-sha1. En omskrivning redovisas här varje gång, eftersom ett repository som säljer verifierbar proveniens inte i tysthet kan flytta marken under en publicerad artefakt.

seg-d82d7a3c9054 = Den publicerade craten kompilerade inte.

seg-ebc99c9df1ef = <c1/> innehåller en <c2/> på översta nivån av <c3/>, och manifestet exkluderar <c4/> från paketet, så tarbollen som crates.io tog emot saknade en fil som biblioteket självt bäddar in. Publiceringen av { "v0.27.0" } misslyckades i sitt verifieringsbygge av det skälet och ingen { "0.27.0" } nådde crates.io; npm och PyPI, vars jobb inte beror på det, publicerade som vanligt. Exkluderingen har nu ett undantag för just den katalogen.

seg-6ff9cdb976e8 = Varje annan <c1/> av en fixtur i <c2/> ligger inuti en <c3/>-modul och når därför aldrig det paketerade biblioteket. Bara en på översta nivån gör det.

seg-7f0975453b8f = <b>Ingenting i CI körde <c1/>,</b> vilket är varför en tarboll som inte kan kompileras först upptäcktes av publiceringsjobbet, efter att två andra register redan hade levererat. Ett <c2/>-jobb bygger och kompilerar nu exakt tarbollen vid varje push.

seg-1f2df48821fc = Fastlåsningarna för utdata från månreferenssystemets realisering flyttas inte längre vid en versionshöjning. SVG-fotraden bär motorversionen, så varje release tog om baslinjen för tre hashar — två gånger på en dag — och en fastlåsning som tas om rutinmässigt slutar läsas. Versionssträngen normaliseras till en platshållare före hashningen, och utdata kontrolleras separat för att ange den körande versionen, så att det faktum kontrolleras mer exakt än hashen någonsin gjorde.

seg-56309487ea7e = <c1/> — månens referensdatum från en verklig observationskampanj.

seg-966a2cc4e40d = <c1/> ersatte en injicerad Helmert-transformation med en <em>simulerad</em> kampanj och sa det: dess stationsnätverk, dess schema och dess sigma per observation är illustrativa indata. Detta scenario tar bort simuleringen från de två ställen där ett schema och en felmodell går in i svaret. Epokerna är sändningstiderna för { "337" } arkiverade normalpunkter från ILRS lunar laser ranging (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } och Matera MLRO { "7941" }, alla fem retroreflektorgrupper), och varje observationsvikt är den normalpunktens egen arkiverade precision, <c2/> — en median på { "5.13" } mm enkelriktat avstånd, hämtad ur filen och inte vald här. Stationskoordinaterna kommer från IERS ITRF2020 och reflektorkoordinaterna från JPL DE430 Table { "7" }; varje fixtur registrerar en URL, ett hämtningsdatum och en SHA-256 och regenereras från sin källa av en incheckad generator som verifierar källan och avbryter i stället för att avge ett tal. Rapporten namnger vilka länkar som är uppmätta och vilka som förblir modellerade, och de modellerade är <em>uppmätta</em>: observerat-minus-beräknat enkelriktat avstånd över de verkliga data är { "156 494" } m RMS, vilket samma testuppsättning bekräftar mot JPL Horizons över samma tidsspann ({ "195 655" } m RMS-vektor, sämsta epok { "0.054" }° — inom de ~{ "0.3" }° som den inbyggda analytiska månserien själv gör anspråk på). Additivt: en ny kind, en ny läsare (<c3/>) och en ny modul (<c4/>); de befintliga paketen för månens referenssystem är låsta bit för bit.

seg-7fcd2af0a688 = <b><c1/> som scenarioparameter</b> på <c2/> och <c3/>. Noggrannheten i avståndsmätningen för signal i rymden var en konstant vid kompileringen (<c4/>), så ett svep över servicevolymen kunde bara besvara klarar/klarar inte vid ett enda fast värde. Skyddsnivåerna är exakt linjära i den, så att exponera den gör om svepet till ett <b>krav</b> på noggrannhet i avståndsmätningen över hela volymen. Standardvärdet reproducerar tidigare beteende bit för bit.

seg-c3ccc1e89a2d = <b>Export av geometri per satellit</b> på <c1/>: <c2/> + <c3/> lägger till en array <c4/> som anger azimut, elevation och snett avstånd till varje satellit vid varje epok för en namngiven selenografisk plats, plus synlighetsflaggan. Den aggregerade täckningssammanfattningen slår medvetet ihop geometrin per satellit, men snett avstånd är exakt vad en länkbudget förbrukar, så en gemensam analys av kommunikation och navigering kunde inte göras enbart utifrån sammanfattningen. Avstängd om inte båda koordinaterna anges; rent additivt.

seg-ae7886fbca9d = <c1/>, den publika hjälpfunktionen för blickvinkel bakom exporten.

seg-b187bade5f04 = En rad i verifieringsmatrisen för den nya geometriförmågan.

seg-14ef785b6c12 = <b>Det verkliga antennmönstret i geometriexporten.</b> Motorn har sedan P1 haft ett mönster för en likformigt belyst cirkulär apertur (<c1/>, Airy-formen <c2/>) och <b>ingenting utanför <c3/> använde det</b> — i stället gjorde en boresight-förstärkning ihop med en tumregel för förstärkning mot strålbredd jobbet. En valfri tabell <c4/> på <c5/> (läses bara när exportplatsen är satt) ger nu varje exporterad rad <b>vinkeln utanför borelinjen vid satelliten</b> och <b>sändningsförstärkningen mot platsen från det mönstret</b>, och lägger till ett block <c6/> som rapporterar <b>antalet inom strålen under det verkliga mönstret bredvid antalet inom strålen under den symmetriska approximationen</b> (<c7/>) med skillnaden som en namngiven korrektion. Båda talen avges; inget ersätter det andra. Uppmätt vid motorns egen representativa månapertur ({ "1" } m parabol, { "2.4" } GHz, η = { "0.60" }) över en plats vid sydpolen och det illustrativa skalet i LCNS-klass <b>skiljer sig de två åt med mer än en satellit</b>: det verkliga mönstret lägger { "0" } av { "76" } synliga länkar inom halveffektstrålen, approximationen påstår { "28" } — en korrektion på −{ "2.33" } satelliter per epok, sämsta enskilda epok { "3" }. Approximationen bär en egen aperturverkningsgrad ({ "0.641" } mot den regel på <c8/> grader som den normalt anges med, { "0.920" } mot en likformig cirkulär apertur), så på en parabol med η = { "0.60" } ger den en stråle som är { "1.238" }× för bred; blocket avger båda de underförstådda verkningsgraderna i stället för att lämna dem åt läsaren att dra slutsatser om. Rent additivt: uppmätt över den dokumenterade arbetspunkten, { "597" } befintliga löv, <b>{ "0" } ändrade, { "0" } borttagna, { "494" } tillagda</b>.

seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> och <c7/>, de publika delarna bakom det. Mönstret är nu också förankrat mot de publicerade Airy-konstanterna och inte bara mot sig självt: halveffektskorsningen hittas genom bisektion och jämförs med <c8/>, vilket ger den exakta halveffektsbredden <c9/> och registrerar ärligt att den konventionella koefficienten <c10/> placerar <c11/> vid <b>−{ "2.955" } dB</b>, inte −{ "3.010" } dB.

seg-bac7217bb128 = <b>En reproducerbarhetstabell i långt format för <c1/>.</b> Scenariots arrayvärderade utdata — rutnätet för medelvärdestider, de sju kurvorna <c2/> per term och deras kvadratsumma — nådde konsumenter bara som JSON-arrayer. En släppt tabell kapades vid { "400" } tecken och publicerade { "23" } av sina { "57" } medelvärdestider under en kolumn som påstod sig innehålla alla, och manuskriptet byggde om kurvorna per term från slutna former eftersom motorn aldrig avgav dem. En vanlig körning skriver nu också <c3/> med en rad per (rutnätsindex, medelvärdestid, term), som inte kan kapas till något som ändå ser helt ut. Rutnätsindexet är en exakt sammanfogningsnyckel; <c4/> skrivs med { "13" } värdesiffror och varje <c5/> med { "7" }, så att bytena inte förgrenas mellan bygget av samma källa. Rent additivt: rapport-JSON är byteidentisk.

seg-ab9209297ec2 = <b>Rapporten för <c1/> beskriver nu sig själv.</b> Ett block <c2/> ekar de lösta länkindata — bärvågens våglängd, sändar- och mottagarapertur, avstånd, pulsbredd, integrationstid, verkningsgrader och förluster — med standardvärden tillämpade, så att en artikel anger den konfiguration den kördes med i stället för att citera ett standardvärde läst ur källkoden. Ett block <c3/> anger enhet och proveniensklass för varje storhet som en artikel sannolikt citerar. Spåren för kovarians vid överlämningen är anledningen till att det finns: de avgavs som en bar <c4/> och ett manuskript drog slutsatsen kvadratmeter av en intern konsistenskontroll. Slutsatsen var riktig, vilket är precis varför det var en brist — inget hade fångat om den varit fel. Rent additivt: uppmätt över fyra konfigurationer, { "456" } befintliga fält, <b>{ "0" } ändrade, { "0" } borttagna, { "196" } tillagda</b>.

seg-5c810155300c = En rad i verifieringsmatrisen för reproducerbarhetstabellen för tidsbudgeten, ärligt <c1/> / <b>MODELLED</b> — totalen kontrolleras mot kvadratsumman av termerna i samma fil, som delar motorns egna termdefinitioner och därför inte är en oberoende referens. Tillsammans lägger dessa till tre rader. Den löpande totalen för det här osläppta avsnittet är <b>{ "168" } rader — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

seg-ed290a85ab0e = <b>Commit-författarskapet i hela historiken är nu en enda identitet, och två publicerade crates pekar på en commit som inte längre finns.</b> Den 2026-09-21 skrevs git-historiken om så att varje mänsklig commit är författad och committad av <c1/>. Den bar tidigare tre stavningar av en person — { "688" } commits som <c2/>, { "34" } som <c3/> och { "94" } redan kanoniska. Den enda <c4/>-committen lämnades medvetet som sin egen författare: att byta etikett på en bots beroendeuppdatering skulle göra anspråk på författarskap till arbete som ingen här gjort.

seg-ec4e75f94462 = <b>Inget innehåll ändrades.</b> Omskrivningen rörde bara rubrikerna för författare och committer, och det går att kontrollera i stället för att bara påstå: trädet för varje tagg och varje gren är bitidentiskt med vad det var förut. <c1/> löses fortfarande upp till trädet <c2/>, precis som förut.

seg-bc0f4fa0a009 = <b>Vad det kostade.</b> En commits namn är en hash över dess träd, dess föräldrar och dess författarrubriker, så att ändra en förfader byter namn på varje ättling. Releasecommitten <c1/> var <c2/> och är nu <c3/>. Två artefakter registrerade det gamla namnet vid publiceringen och kan inte rättas, eftersom en publicerad registerversion är oföränderlig till sin konstruktion:

seg-52e096332738 = <c1/> { "0.26.0" } på crates.io — <c2/> registrerar <c3/>

seg-8ec39d2f136c = <c1/> { "0.26.0" } på crates.io — samma sha1, <c2/>

seg-9a21b7c7b41c = Inget annat påverkas. Npm-paketet registrerar ingen <c1/>, och PyPI-distributionen registrerar ingen commit alls; båda kontrollerades i stället för att antas.

seg-9c51c5fb0d80 = Det finns ingen reparation som får <c1/> att namnge den omskrivna committen: den strängen <em>är</em> den gamla släktlinjen, och det enda sättet den löses upp är att behålla den gamla historiken publicerad, vilket skulle återställa det författarskap som omskrivningen tog bort. Proveniensen för { "0.26.0" } går därför genom taggen och inte genom den registrerade sha1 — och taggen levererar identiska bytes som craten byggdes från. Nästa release registrerar en giltig commit utan att något behöver göras.

seg-30ecea86118a = <b><c1/> hade som standard en EOP-fil utan prediktionsrader (G12).</b> Scenariot bäddade in ett utdrag av <c2/> med fem rader, <em>endast slutgiltiga</em>, som sin standard för offline, så en bar körning rapporterade <c3/> och tabellen per horisont vilade på { "5" }, { "4" }, { "3" } och { "2" } par. Motorn kunde alltid läsa en prediktionsrad — indata hade helt enkelt inga. Standarden är nu det ordagranna IERS-utdraget för { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } slutgiltiga från Bulletin B och <b>{ "12" } rader med enbart prediktion från Bulletin A</b>, så en bar körning utan filargument och utan nätverk rapporterar <c5/> och en tabell per horisont vid n = { "20" } / { "31" } / { "30" } / { "29" }, och jämförelsen med den operativa prediktorn och överensstämmelsen med produktens egna publicerade prediktioner fylls också i. Det långa utdraget med 45 rader mättes som alternativ och avvisades: det är också endast slutgiltigt, så det hade lämnat <c6/> på { "0" }. <b>Detta flyttar publicerade tal</b>, under regel R4 och med grundarens tillstånd: tio av de { "22" } cellerna i den släppta <c7/> och { "24" } av de { "42" } ifyllda cellerna i <c8/>. Den uppmätta polgolvet för snabb-minus-slutgiltig blir { "0.0678" } mas (från { "0.0769" } mas), vilket är det värde som artikel P4:s egen tabell för polarrörelse redan publicerar vid n = { "20" } — de två stämmer nu i stället för att skilja sig med { "13.5" } %. Varje annat värde som P4 skriver ut från den här tabellen är oförändrat vid den utskrivna precisionen. Hela uppräkningen gammalt → nytt, inklusive de fält som <em>inte</em> flyttades, finns i <a1><c9/></a1>. Utdraget med enbart slutgiltiga levereras fortfarande, byte-låst och använt: ett antal prediktionsrader på noll i det är filens egenskap, och ett test bevisar det fortfarande.

seg-17fbc566dc5b = <b>En inaktuell begränsning av antalet satelliter i <c1/>.</b> Scenariot begränsade <c2/> till { "12" } fastän dess egen konstellationsbyggare stöder { "24" } och ett test påstår { "24" }, så varje begärt antal över { "12" } reducerades i tysthet och ett svep över antalet satelliter gav identiska värden över { "12" } — omöjligt att skilja från verklig geometrisk mättnad. Nu begränsas det vid byggarens gräns. Detta är en beteendeändring bara för <c3/>.

seg-4df7d4d61b40 = Samma inaktuella begränsning i <c1/>.

seg-8adfbd27c4f8 = <c1/> begränsade <c2/> till { "12" } med samma följd, och den här nådde en publicerad tabell: <c3/> har en rad <c4/> som är byteidentisk med sin rad <c5/>, eftersom motorn returnerade ett svar för tolv satelliter under en etikett för sexton satelliter. Nu begränsas det vid byggarens gräns på { "24" }, och ett nytt test låser det — varje större konstellation måste både rapportera sitt eget antal och strikt förbättra skyddsnivån, så att begränsningen inte kan återvända obemärkt. <b>Detta flyttar publicerade tal</b>: skyddsnivån för <c6/> blir { "16.92" } m → { "14.57" } m. Svept till { "24" } är kurvan strikt monoton ({ "11.94" } m vid { "24" } satelliter, { "29.5" } % bättre än vid { "12" }), så det finns ingen mättnad vid { "12" } — den uppenbara platån var begränsningen. Beteendeändring bara för <c7/>.

seg-ebee158b73c8 = En release för dokumentation, transparens och lekplats. Ingen motorbeteendeändring: verifieringsmatrisen står på <b>{ "102" } rader — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, oförändrat sedan { "0.25.0" }.

seg-7af422ed6d89 = <b>Rustdoc på cratenivå</b> (<c1/> i <c2/>) som täcker ingångspunkter, modellen för ärlighet och nivåer samt reproducerbarhet, så att docs.rs öppnas på en riktig startsida i stället för en naken modulvägg.

seg-dd44c25f3af5 = <b><c1/></b> — en referens per kind för alla <c2/> scenario-kinds, genererad från <c3/> (den enda källan till sanning) av <c4/> och bevakad av <c5/>, så att den inte kan glida ifrån dispatchern.

seg-e2cc77d3b413 = <b>Moduldokumentation</b> för de { "11" } tidigare odokumenterade publika modulerna (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

seg-8d156713799d = <b>Litteraturkällor</b> för fem formelmoduler som angav en ekvation men inte namngav någon referens: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon m.fl.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

seg-832b4bfbc48a = <b>En publicerad <c1/></b> på kshana.dev för samordnat avslöjande av sårbarheter.

seg-30603f59e27d = <b>Valideringsnivå per körning i lekplatsen.</b> Tabellen med kvalitetsmått för en enskild körning bär nu en pill VALIDATED/MODELLED per mått, läst från samma uppslagning <c1/> som den nedladdningsbara rapporten använder (som speglar <c2/>, i sin tur härledd från verifieringsmatrisen), så att nivån som visas bredvid ett levande tal aldrig kan skilja sig från registret.

seg-93b203f3a1c0 = <b><c1/></b> i lekplatsens meny — alla { "50" } kinds som går att dispatcha är nu ett klick bort (var 49/50).

seg-1ec0830db404 = <b>Fem förmågekort till som går att köra</b> (rymdväder, utvärdering av RF-störningar, resiliens, CCSDS OEM-interoperabilitet, KIF), vilket lyfter antalet körbara kort från { "11" } till { "16" }. Kort som bara gäller API och bibliotek behåller en ärlig länk till dokumentationen i stället för en falsk körknapp.

seg-977ea074dd9d = Dokumentationstäckningen har nu en spärr som bara får gå åt ett håll i CI.

seg-beb308bcaafb = <c1/> kompilerar biblioteket med <c2/>, räknar varningarna och misslyckas bara om antalet stiger över ett fastlåst tak ({ "986" }). En hård <c3/> under <c4/> hade förvandlat ~{ "1000" } för närvarande odokumenterade publika objekt till ett byggstopp över en natt; på det här sättet får nya odokumenterade publika objekt bygget att misslyckas medan det befintliga efterslepet betalas av med avsikt.

seg-27668072a608 = <b>Raden för MCP-verktyget <c1/> annonserade "~{ "17" } built-in scenario kinds"</b> medan <c2/> hade exponerat { "50" } en tid — ett dokument riktat till agenter som underdrev den verkliga förmågan med en faktor tre. Låst till det sanna antalet.

seg-1ffc9f9816e8 = Omgenererade CycloneDX-SBOM:ens referens för formatkontroll för den uppdaterade beroendegrafen ({ "60" } komponenter). Utslaget för formatkontrollen är oförändrat: noll normaliserade schemafel och varje atomärt licens-id finns fortfarande i den officiella SPDX-uppräkningen.

seg-a6db590bbcbe = <b>Fem förmågor uppflyttade till externt VALIDATED</b>, var och en nu korskontrollerad mot en oberoende tredjepartsimplementation av samma entydigt definierade storhet (icke-cirkulärt, med fixturer som kan regenereras offline):

seg-98588143b4bb = <b>IEEE-1139-konvertering från potenslag till Allan-deviation</b> mot slutna former i <c1/> för alla fem brustyper (<c2/>);

seg-ce37d70fa8bc = <b>CRPA MVDR / vikter för nollstyrande strålformare med minsta norm</b> mot numpy/scipy LAPACK (<c1/>);

seg-0f033d1027f8 = <b>Wahba / TRIAD / QUEST för lägesbestämning</b> mot SciPys SVD <c1/> på brusfria observationer (<c2/>);

seg-e1e2283cb524 = <b>CCSDS { "502.0" } OEM-utbyte av kovariansblock</b> som rundturas genom den oberoende parsern i biblioteket <c1/> (<c2/>);

seg-579eefbb646f = <b>kärnan för detekteringsstatistik vid kvadratlagsakvisition</b> (generaliserad Marcum-Q / P_d / P_fa / tröskel) mot SciPy <c1/>/<c2/> (<c3/>). Den maskinkontrollerade valideringsmatrisen flyttas till <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> över <b>{ "102" } rader</b> (var { "51" } · { "47" } · { "4" }). Ärliga förbehåll om omfattning bevaras — t.ex. gäller uppflyttningen av akvisition bara kärnan för detekteringsstatistik; CFAR/straddling loss förblir MODELLED.

seg-b6a140d55580 = <b>Kvalitetsmått i positionsdomänen</b> (<c1/>): exakta CEP, SEP och 2DRMS från en navigationslösnings 3D-ENU-positionskovarians plus en horisontell skyddsnivå. CEP/SEP är de <em>exakta</em> mediana radiella felen (inte den linjära regeln <c2/>), korskontrollerade mot kvantiler för rayleigh/maxwell i <c3/> och en oberoende median från NumPy-Monte-Carlo (<c4/>). Ersätter den tidigare ärliga stubben för ej implementerat — <b>funktionssignaturen ändrades</b> från <c5/> som returnerar ett fel till <c6/> som returnerar en <c7/>.

seg-1551afa17154 = <b>Ekvivalenta frihetsgrader (EDF) för konfidensintervall är nu kompletta för alla estimatorer i Allan-familjen</b> (<c1/>): EDF för modifierad Allan, Hadamard och total varians använder nu algoritmen för kombinerad EDF av Greenhall & Riley och formen TOTVAR i NIST SP { "1065" } Table-7 (tidigare var bara EDF för överlappande Allan implementerad; de övriga återanvände den i tysthet), korskontrollerade mot <c2/> <c3/>/<c4/> (<c5/>).

seg-39753e7919cc = <b>Oberoende externa korskontroller för geometri, DOP, EOP, DRO och RF-avståndsmätning i månens PNT</b> (<c1/>, med fixturer och referensgeneratorer under <c2/>). Varje kontroll driver en redan levererad <b>modellerad</b> förmåga mot en referens som produceras av en <em>annan</em> implementation, så att samstämmigheten är icke-cirkulär: orbitalfotavtrycket för sändning/infångning mot <c3/> (Cephes — en genuint annan Bessel J1); DOP för ytbeaconernas geometri mot en oberoende NumPy-lösning av <c4/>; tillväxten av prediktionsfelet för persistens i UT1/EOP mot en separat NumPy-omtolkning av samma ordagranna IERS-rader <c5/>; familjen av plana avlägsna retrograda banor mot NASA/JPL:s Three-Body Periodic Orbit Database; och budgeten för RF-avståndsmätningens precision mot en referens från grundprinciper. Dessa är ytterligare regressionsevidens för befintliga moduler; att lägga till de här korskontrolltesterna ändrar i sig inte etiketten på någon förmåga (de fem uppflyttningarna ovan är separata statusändringar med stöd av referenser i <c6/>).

seg-662c04f0552f = <b>Scenariot <c1/></b> (<c2/>, <c3/>): en sammansatt, binärnåbar (CLI / Python / MCP / wasm via <c4/>) P1-körning av signalsäkerhet för Månen som sammanfogar effektunderskottet i länkbudgeten och dess känslighetsband på { "12" }–{ "18" } dB, den sändareffekt som krävs för jamming/spoofing mot avstånd, orbitalt infångningsfotavtryck under ett verkligt antennmönster, utfallet av spoofing-infångning i spårningsslingan, räckvidden mot horisonten för kroppar utan atmosfär och autentiseringsbudgeten för OSNMA/TESLA. En tom kropp reproducerar P1-baslinjen.

seg-a9b7ee942a23 = <b>Känslighetsband för effektunderskott</b> (<c1/>, <c2/>): ett genuint svep över flera axlar (referens × EIRP × snett avstånd) byggt på <c3/> och utvärderat genom <c4/>, som reproducerar P1-bandet på { "12" }–{ "18" } dB och förenar de linjära faktorerna { "32" }× (avrundad) / { "36" }× (oavrundad).

seg-0734a4ca7535 = <b>Tredimensionell kub för spoofing-infångning</b> (<c1/>): lägger till axeln för bärvåg/Doppler-förskjutning i infångningskartan (J/S × kodförskjutning × bärvågsförskjutning, låsningstid per cell); skivan med noll bärvågsförskjutning reduceras exakt till den 2-D-formade <c2/>.

seg-3b9bbc25b114 = <b>Detektering med glest övervakningsnätverk</b> (<c1/>) sammansätter nu den fysiska AGC-statistiken <c2/> och det selenografiska synlighetsrutnätet <c3/> för att härleda varje stations detekteringsstatistik och geometri, i stället för fria parametrar och en ad hoc-överlappning över storcirklar; sannolikheterna för detektering per övervakare och för nätverket förblir de slutna formerna med chi-två/Marcum-Q i <c4/>. <b>Fälten <c5/> / <c6/> ändrades</b> till fysiska storheter (lat/lon/höjd/effekt).

seg-54c36267382c = <b>Dimensionering av autentiseringsöverhead för OSNMA/TESLA</b> (<c1/>): fältdelarna per sida i OSNMA (8 bitar HKROOT + 32 bitar MACK per sida om { "2" } s) var felmärkta som totaler per delram, vilket underskattade överheaden { "15" }× ({ "1.33" } bit/s). Rättat till de publicerade totalerna per delram om 30 s i SIS-ICD (HKROOT { "120" } + MACK { "480" } bitar ⇒ <b>{ "20" } bit/s</b>). Följden anges nu ärligt: vid en navigationstakt för AFS på { "50" } bit/s är autentiseringsöverheaden en <b>förstaordningskostnad på ≈{ "40" } %</b>, inte några försumbara procent; fältet <c2/> dokumenteras som fördröjningen för nyckelavslöjande (en nedre gräns för den heltäckande tiden till första autentiserade positionsbestämning).

seg-0cf179a34252 = En bred förmågerelease. Den levererar två fullt <b>externt validerade</b> analyssviter — en komplett familj för <b>multikriterie-beslutsanalys (MCDA)</b> och estimatorerna för <b>Allan-vandring / klockstabilitet vid långt τ</b> — och öppnar ett nytt lager av körbara scenarier för <b>månens tidsbudget, ramverk/EOP i realtid, optisk/RF-hybrid, cislunär observerbarhet och konfliktresiliens i lagerindelad PNT</b> ovanpå substratet, plus ett substrat för förmågor kring <b>månens ytbeacons</b> och <b>signalsäkerhet</b>. Den maskinkontrollerade valideringsmatrisen växer till <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> över <b>{ "102" } rader</b> (var { "40" } · { "47" } · { "4" } över { "91" }): alla elva nya rader är valideringar mot externa referenser av beslutsanalysen och tidsestimatorerna, kontrollerade mot oberoende bibliotek (SciPy, pymcdm, pyDecision, allantools) med snäv tolerans, medan den nya PNT-förmågeytan ärligt redovisas som MODELLED. Som alltid uppgraderas inget numeriskt modellpåstående utan en extern datamängd bakom sig.

seg-267e50f8dd56 = <b>Scenarier som går att köra</b> — var och en en registrerad scenario-<c1/>, dispatchad genom motorn och bevisad från början till slut i CI av <c2/> (som kör varje medföljande <c3/> och misslyckas hårt vid varje fixtur som inte går att köra):

seg-c87fc11dd86b = <b>Konfliktresiliens i lagerindelad PNT</b> (<c1/>, <c2/>) — en seedad Monte-Carlo-motor för resiliens för en PNT-arkitektur med flera lager, med en modell för <b>överlevnad vid graciös degradering per vektor</b> i §{ "4.2" } (fyra namngivna hotvektorer, den slutna formen för användbar PNT-överlevnad som varje Monte-Carlo per lager konvergerar mot, avgiven i resultat-JSON) och dokumenterad, glidskyddad proveniens för hotparametrar (<c3/>). MODELLED arkitekturer; konvergensen från Monte-Carlo för överlevnad till sluten form är den Validated kärnan.

seg-9c69e4d8ade9 = <b>Cislunär observerbarhet</b> (<c1/>, <c2/>) — ett egenspektrum för observerbarhets-Gramianen över en båge, en differentialkorrigerad frögenerator för avlägsna retrograda banor (DRO) och en oberoende korskontroll med kvadratrotsinformationsfilter vars posteriori-kovarians blir ändlig exakt vid full observerbar rang. MODELLED konstellation; invarianterna för rang/Gramian/STM/SRIF är den Validated kärnan.

seg-92fb333483e5 = <b>Kontinuitet och integritet i heterogen optisk/RF-hybrid</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — tillgänglighet och integritet över domäner när optisk och RF-baserad PNT kombineras. MODELLED.

seg-08e2f640ae14 = <b>Endogen tidsbudget för Månen</b> (<c1/>, <c2/>) och <b>budget för ramverk / EOP i realtid</b> (<c3/>, <c4/>, <c5/>) — P3/P4-budgetarna för månens tid och jordorientering härledda endogent ur tidskedjan i stället för påstådda. MODELLED.

seg-52c2f9c2c9a7 = <b>Externt validerade analyssviter</b> — biblioteksförmågor, var och en inkommande i matrisen som nya VALIDATED rader (kontrollerade mot en oberoende extern referens, inte en självkontroll):

seg-709789e8fb04 = <b>Komplett svit för multikriterie-beslutsanalys (MCDA)</b> (<c1/>) — de fyra metodfamiljerna: värdeaggregering (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), kvotsystem (<b>MOORA</b>) och proportionell (<b>COPRAS</b>), avstånd till idealet (<b>TOPSIS</b>), kompromissprogrammering (<b>VIKOR</b>) och överrangering (<b>PROMETHEE II</b> med sex generaliserade kriterieformer, <b>ELECTRE I</b> konkordans/diskordans) — plus <b>AHP</b> med prioritetsvikter från Perron-egenvektorn och Saatys spärr för konsistenskvot (CR < { "0.10" }), <b>MAUT</b>-nytta, extraktion av Pareto-front och <b>känslighetsanalys</b> av vikter. De nio aggregatorerna reproducerar <b>pymcdm</b> / <b>pyDecision</b> och AHP-egenvektorn stämmer med SciPy/LAPACK, alla till < { "1e-9" } (<c2/>). Känslighetstornadon visas också inuti scenariot för konfliktresiliens.

seg-2ce49cbfd8bf = <b>Allan-vandring och estimatorer för klockstabilitet vid långt τ</b> (<c1/>) — <b>MTIE</b> (den statistik för peak-to-peak-vandring i tidsfel enligt ITU-T G.810/G.823/G.8261 som synkroniseringsmaskerna skrivs mot), tidsdomänvandringen <b>MDEV</b> och <b>TDEV</b>, samt estimatorerna med utökat område <b>Theo1 / TOTVAR</b>. VALIDATED mot <b>allantools</b> på NIST SP { "1065" }-serien; den biasbefriade hybriden <b>ThéoH</b> byggd på TOTVAR förblir ärligt MODELLED.

seg-68bcdf8bd5de = <b>Harness för assurance / extern referens</b> (<c1/>) — ett referensharness kopplat direkt till CI:s ärlighetsspärr, en proveniensjournal enligt <b>W3C-PROV</b> med en deterministisk Merkle-rot, samt <b>Greenhall</b> ekvivalenta frihetsgrader + chi-två-konfidensintervall för stabilitetsestimat.

seg-dcb91813b24c = <b>PackRegistry / ExternalPack som sömmen för utökning</b> (<c1/>, <c2/>) — en dispatchsöm så att förmågepaket routas genom ett register (inbyggd dispatch ligger på CLI:ets hetaste väg; paket utanför trädet kopplas in bakom en <c3/> med standardvärde), bevakad av en golden-svit för byteidentitet och fristående / wasm32-CI-spärrar.

seg-16b1f5d249ed = <b>Modellerat substrat för förmågor</b> — nya biblioteksmoduler som matar scenarierna ovan och framtida (ännu inte ett fristående scenario-<c1/>):

seg-f8c9ffbc56cf = <b>DOP för månens ytbeacons</b> (<c1/>) med budget för uppnådd noggrannhet, svep över N satelliter och GDOP-karta, plus en störd månefemerid (<c2/>) och geometri för horisont utan atmosfär / invers av spoofing-effekt / underskottsband för AFS (<c3/>, <c4/>). Återanvänder DOP-kärnan som validerats mot gnss_lib_py.

seg-28209a2747d5 = <b>Inläsning av DEM i LOLA-format</b> + terrängens siktlinje (<c1/>).

seg-6e98ac90a0e2 = <b>Trelagersförsvar för signalsäkerhet</b> — spoofing-infångning, korssensorintegritet och dimensionering av övervakningsnätverk (<c1/>, <c2/>, <c3/>) med ett antennfotavtryck för orbital stråle och en autentiseringsbudget för OSNMA (<c4/>, <c5/>). MODELLED.

seg-bd5b9511accb = Valideringsmatrisen och varje härledd artefakt omgenererades från den enda källan till sanning (<c1/>): registret på plats, diagrammen över modulkarta och valideringsproveniens, och antalssträngarna i README och per yta anger nu <b>{ "51" } / { "47" } / { "4" } av { "102" }</b> (var { "40" } / { "47" } / { "4" } av { "91" }); spärren för ärliga antal söker nu igenom hela git-historiken, och figurerna i README är enhetliga i den mörka varumärkespaletten.

seg-c2ec7e2b6296 = En gemensam adaptiv integrationsdrivrutin ligger nu bakom både <c1/> och <c2/> (<c3/>), vilket tar bort den duplicerade stegaren.

seg-85cfb0f10268 = Statisk analys med <b>SonarQube Cloud</b> tillagd i CI (Rust + importerad täckning), med betygsmärken för säkerhet / underhållbarhet / tillförlitlighet i README.

seg-deeef8318367 = Disciplin för release och paketering: CI registrerar en driftsättningsmiljö per publicering av paket/register, och det fokuserade publika fristående jobbet är avgränsat bort från de långsamma valideringsbinärerna.

seg-30181148b098 = Hygienspärren mot attribution är avgränsad till markörer för författarskap, så att nämna en integrationsvärd eller en produkt inte längre får bygget att misslyckas.

seg-6eb3868fdce0 = Dokumentation: avsnittet <b>Citing</b> i README listar nu de fyra publicerade arXiv-preprinterna, och förmågan DOP för ytbeacons är dokumenterad på månraden.

seg-d12533cbf1f2 = Heltalsräknare i loopar som drivs av flyttal (Sonar S2193).

seg-3c213354187f = Noggrann invers chi-två vid låga frihetsgrader genom Newton-förfining i vägen för konfidensintervall i assurance.

seg-386b7094d34d = kshana.dev: standardavsnittet öppnas nu som standard och reservvärdet för registerantalet är rättat; inaktuella strängar i README och på webbplatsen kring observerbarhetslagret synkade.

seg-33448f46894f = En förmågerelease som lägger till ett allmänt lager för <b>Fisher-information / Cramér–Rao-observerbarhet och optimal experimentutformning</b>, och den release som artikeln om observerbarhet i månens PNT vilar på. Den maskinkontrollerade valideringsmatrisen växer till <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> över <b>{ "91" } rader</b> (var { "39" } · { "46" } · { "4" } över { "89" }): den nya skattningsmotorn är kontrollerad mot en extern referens och är VALIDATED; dess tillämpning på Månen är ärligt MODELLED. Som alltid uppgraderas inget numeriskt modellpåstående utan en extern datamängd bakom sig.

seg-c377207026f4 = <b><c1/> — Fisher-information, Cramér–Rao-gränser och optimal experimentutformning.</b> En allmän, återanvändbar motor för skattningsteori: Fisher-informationsmatrisen <c2/> från en mät-Jacobian och vikter; en symmetrisk egenvärdeslösare (cyklisk Jacobi); den nedre Cramér–Rao-gränsen via inversen, eller Moore–Penrose-pseudoinversen plus en nollrumsbas när informationen är rangdefekt (fallet med fritt nätverk / datumdefekt); och D-, A-, E- och T-optimala mått för experimentutformning med en <c3/>-väljare över kandidatgeometrier. <b>VALIDATED</b> mot NumPy (<c4/>/<c5/>) och de publicerade slutna gränserna av Kay ({ "1993" }) till { "1e-9" } (<c6/>), så den kommer in i matrisen som en rad med extern referens och inte som en självkontroll.

seg-91d09b4e737f = <b>Observerbarhet för gemensam banbestämning på Månen</b> (<c1/> i <c2/>, visad på rapporten för månkombinationen): tillämpar FIM/CRLB-motorn på den gemensamma lösningen för bana och klocka för att visa den absoluta datumdefekten för stationerna, hur rangen återställs när stationer på jordbaslinjer läggs till, den uppnådda CRLB för stationspositionen och den E-optimala konditioneringen. Ärligt <b>MODELLED</b> — skattningsmotorn är externt validerad, men månnätverket den tillämpas på är en representativ simulering, och ingen nuvarande datamängd kan göra den geometrin till en mätning.

seg-6b1cd00aca8c = <b>Representativ geometri för elliptisk frusen månbana (ELFO)</b> för scenariot månkombination (<c1/>, <c2/>, <c3/>, <c4/>; cirkulär placering förblir standard) och ett observerbarhetsfält utan VLBI på rapporten, så att resultatet om datumdefekt kan visas vara geometrigenerellt. Samma stege { "3" }→{ "1" }→{ "0" } och tröskel på tre stationer gäller på en ELFO i familjen Moonlight/LCNS, och med tre VLBI-baslinjer på jorden är den absoluta stationspositionen observerbar vid en gräns under en meter — låst av <c5/>. Fortfarande MODELLED.

seg-9e6627c0c417 = Valideringsmatrisen och varje genererad evidensartefakt omgenererades från den enda källan till sanning (<c1/>): registret (<c2/>), <c3/>, <c4/>, figurerna för valideringsfördelning och typ av referens, och antalssträngarna i README över alla distributionsytor anger nu <b>{ "40" } / { "47" } / { "4" } av { "91" }</b>.

seg-6f90233290a2 = En release enbart för paketering. Inga ändringar av motor, scenarier eller resultat; valideringsmatrisen är oförändrad på { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER över { "89" } rader.

seg-9d41e1412d1f = npm publish: paketfältet <c1/> som härleddes från crate-manifestet använde GitHub-ägaren med fel skiftläge (<c2/>), vilket fick npm:s sigstore-verifiering av proveniens att misslyckas (den matchar ägaren skiftlägeskänsligt). Manifestfältet <c3/> är nu det kanoniska med gemener <c4/>, så att den genererade <c5/> stämmer med proveniensens subjekt och npm-releasen publiceras.

seg-fe1f8aae99f4 = Wheel-bygget låser <c1/> så att manylinux-wheelen är byte-reproducerbar över ombyggen (reproducerbarhetskontrollen med ombygge och diff).

seg-b87075b47007 = En konsolideringsrelease med fokus på <b>evidens, proveniens och disciplin i distributionen</b>. Den maskinkontrollerade valideringsmatrisen växer till <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> över sina <b>{ "89" } rader</b> (var { "15" } · { "42" } · { "4" } över { "61" }), drivet av korsvalidering av modellerade förmågor mot oberoende externa referenser. Varje distribuerad artefakt bär nu en kryptografisk SLSA-attestering av byggproveniens, levereras med en CycloneDX-SBOM och publiceras i takt över alla ytor. Inget numeriskt modellpåstående uppgraderas utan en extern datamängd bakom sig; ny förmåga förblir ärligt MODELLED.

seg-f6de783bfd29 = <b>Lägesdynamik</b> (<c1/>, MODELLED) — momentfria Eulerekvationer för stel kropp + kvaternionkinematik (RK4), med självtester av bevarandelagar (kvaternionnorm, rörelseenergi, |Iω|, precession för symmetrisk topp).

seg-339bc18b9fc4 = <b>Korsvalidering av modellerade förmågor</b> mot oberoende externa referenser, vilket tar valideringsmatrisen till { "39" } VALIDATED rader, var och en med stöd av en extern datamängd (CI:s ärlighetsspärr förbjuder statusen VALIDATED utan en). De senaste valideringarna mot externa referenser: den <b>uppmätta stabilitetskurvan för optisk klocka</b> (<c1/>:s anpassning av ADEV-kurvan reproducerar den publicerade σ_y(τ) för ⁸⁸Sr-optiskgitterklockan av Norcia m.fl., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, medföljande under <c2/>); <b>generering av spridningskod för GPS L1 C/A</b> (<c3/>:s G1/G2-LFSR reproducerar kodfasoktalerna i IS-GPS-200 Table 3-Ia för PRN { "1" }–{ "9" }); och <b>SRTM-läsaren för digital höjdmodell på verklig terräng</b> (<c4/> läser en medföljande SRTM v3-ruta i public domain från NASA/USGS, N36W117 / Death Valley, och placerar Badwater Basin inom dess dokumenterade mätband).

seg-665d0dde637b = <b>Nya MODELLED förmågor</b>, var och en internt korskontrollerad mot en sluten form eller en syskonkodväg: relativ rörelsedynamik enligt Clohessy–Wiltshire / Hill, passiv geolokalisering av sändare med TDOA/FDOA, lägesbestämning med Wahba/TRIAD/QUEST, upplösning av heltalsosäkerhet i bärvågsfas för GNSS (LAMBDA), B-plan-målstyrning och gravitationsassist med patched conic, strålformning med CRPA-grupp mot jamming, statistik för kvadratlagsakvisition i GNSS, fringe-osäkerhet / dynamiskt område för kvantiska tröghetssensorer, klockbrus enligt IEEE-1139-potenslag + golv för flicker-FM, och utbyte av kovariansblock i CCSDS-OEM.

seg-b3f53d5e3c3a = <b>Evidensregister från en enda källa</b> med genererade verifieringsdokument och ett driftskydd; ett bläddringsbart valideringsregister på kshana.dev med djuplänkar till evidensen för varje kort.

seg-b3c0545157b3 = <b>Maskinläsbar citeringsmetadata</b> — <c1/> (CodeMeta { "2.0" }) och <c2/>, fastlåsta mot Cargo-manifestet av <c3/>.

seg-2ca8875da9de = <b>Härkomst för leveranskedjan</b> — SLSA-attestering av byggets härkomst för crate-tarbollen, wheels, sdist och npm-tarbollen; PyPI OIDC Trusted Publishing; CycloneDX SBOM som levereras inuti wheel- och npm-paketet; diff av reproducerbara byggen och verifiering efter release.

seg-18fdecf7f2fa = <b>Sökbarhet</b> — <c1/>, <c2/> samt metadata för Open Graph / JSON-LD på kshana.dev; en genererad <c3/>-figur som härleds ur matrisen.

seg-f80db0b0f545 = <b>README-filer per yta</b> för crates.io / PyPI / npm med ett skydd som håller antalen ärliga.

seg-bd33b21f8f91 = <b>Sagnac-tidsöverföringens</b> oberoende referens har uppgraderats till ExternalDataset — Sagnac-korrektionen för ett varv runt ekvatorn kontrolleras nu mot Ashbys publicerade { "207.4" } ns (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, ekv. { "1.29" }; reproducerad till < { "0.05" } ns). Den sammansatta tidsöverföringsförmågan förblir ärligt MODELLED.

seg-882133bf1fcc = <b>Dokumentation, diagram och figurer har uppdaterats</b> till den aktuella matrisen (39/46/4/89): diagrammet över valideringens härkomst, figuren <c1/> (nu genererad ur matrisen med ett CI-driftskydd), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, arkitektur- och handledningsdokumenten samt totalsumman i registret på kshana.dev.

seg-a9be3d71a52c = Källträdet har formaterats om med den fastlåsta rustfmt-versionen (toolchain { "1.93.0" }) — enbart stil, ingen ändring av beteendet.

seg-4542eb4fabfc = <b>Versionering i takt.</b> Varje distributionsyta (crate, PyPI, npm, MCP-crate + OCI-avbild, JetBrains-plugin) versioneras nu i takt med motorn, vilket <c1/> upprätthåller i CI.

seg-792df0cdc8a7 = <b>JetBrains-pluginet</b> har bytt licens till <b>AGPL-3.0-only</b> (den publicerade { "0.1.1" } angav fortfarande Apache-2.0) och hämtar nu sin Marketplace-version från release-taggen.

seg-171f5649c90f = <b>Härdning av robustheten</b> — <c1/> utanför tester har tagits bort eller motiverats; <c2/> tillämpas på kod utanför tester.

seg-0e5abb2fad02 = <b>kshana.dev</b> har fått en total omarbetning med bevisen först: dominerande hero, arkitekturdiagram och resultatfigurer, i18n, ihopfällbara och responsiva avsnitt för registret och standarderna.

seg-05ef9b9f3653 = <b>SP3-precisionsefemerid</b> — IGS-korrektionen för jordrotationens nod tillämpas under interpolationen.

seg-bbd0dc3dd9cb = <b>Registerbilder</b> — README-filerna för PyPI/crates.io/npm använder absoluta bild-URL:er; huvud-READMEs relativa bildsökvägar visades som trasiga bilder på PyPI-sidan för { "0.21.0" }. Ett CI-skydd (<c1/>) förhindrar att felet återkommer.

seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> gröna; sluta kompilera mot verkliga data som är git-ignorerade.

seg-c3c260b7063e = Tester

seg-5dca3defcfe3 = Kalman-klockans kovarians förblir PSD och symmetrisk (egenskapstest, <c1/>).

seg-c861779f04ca = Dokumentsynkroniserande skydd: varje offentlig sträng med valideringsantal, citeringsmetadata, den genererade figuren och bild-URL:erna i README-filerna för respektive yta är alla fastlåsta mot sin källa till sanning.

seg-0540044c92a6 = Den här releasen lägger till två MODELLED tillämpningssviter i den öppna motorn — en <b>demonstrator för kvantaktiverad PNT</b> (betrodd kvanttidsöverföring, GNSS-fri kvantnavigering, detektion av kvantfel och kvantanomalier) och en <b>PNT-svit för måne och cislunart rymd</b> (månens koordinattid, VLBI för månen, gemensam OD+klocka, realisering av referenssystem, servicevolym, differentiell PNT, interoperabilitetsexport) — var och en körbar från en enda <c1/>, var och en med en ärlig <c2/>-post plus ett register över representativitet och återstående steg till flygning. Den tillför också <b>sex nya valideringar mot externa oberoende referenser</b>, vilket tar den maskinkontrollerade verifieringsmatrisen till <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> över dess { "61" } rader. De nya tillämpningssiffrorna är MODELLED utifrån illustrativa parametrar från öppna källor — ingen TRL, ingen flygerfarenhet, ingen certifiering och inget stöd från någon myndighet — och de validerade kärnor som de återanvänder är märkta som sådana.

seg-82a1822f53e2 = <b>Demonstratorsvit för kvantaktiverad PNT</b> (<c1/>, <c2/>, <c3/>). Tre körbara MODELLED tillämpningsområden bakom motorn, var och en med <c4/> plus en post om representativitet och återstående steg till flygning:

seg-07532f03a1f1 = <b>Betrodd kvanttidsöverföring</b> (<c1/>) — en budget för optisk gitterklocka + fotonisk länk mot CSAC + RF-tvåvägs, som återanvänder skyddsnivån för tidssynkronisering, med en säkerhets-FoM mot fördröjnings-/återuppspelningsattacker ({ "1" } − P_md) samt detektion av klockanomalier + CUSUM-latens.

seg-4c9036cffe1b = <b>GNSS-fri kvantnavigering</b> (<c1/>) — en tröghetsframdrivning med kallatomsinterferometer mot ett INS av navigeringsklass över ett GNSS-avbrott, med det ärliga resultatet att accelerometerbiasen förblir icke observerbar utan extern positionsbestämning, så att felet ändå växer.

seg-6188f1c6893a = <b>Detektion av kvantfel och kvantanomalier</b> (<c1/>) — en märkt felkatalog med ROC AUC och bootstrap-konfidensintervall samt minsta detekterbara fel vid en fast falsklarmsfrekvens.

seg-9e22314b1337 = Ett gemensamt bibliotek med felmodeller för kvantenheter (<c1/>) och ett enhetligt testunderlag för avvägningar mellan kvant och klassiskt (<c2/>) ligger till grund för alla tre.

seg-808e20f28556 = <b>PNT-svit för måne och cislunart rymd.</b> Sju körbara MODELLED <c1/> ovanpå CR3BP-kärnan: <b>månens koordinattid</b> (sekulär takt för LTC/TCL − TT, <c2/>), geodetisk <b>VLBI-fördröjning för månen</b> som observerbar (<c3/>), <b>gemensam estimator för OD + klocka med flera tekniker</b> (<c4/>), <b>realisering av referenssystem</b> (Helmert med 7 parametrar + IAU { "2015" } WGCCRE-koppling, <c5/>), analys av <b>servicevolym i Moonlight / LCNS-klass</b> (<c6/>), <b>differentiell PNT för månen</b> (<c7/>) och en <b>interoperabilitetsexport i linje med LunaNet / IOAG</b> (CCSDS-OEM + månens tidsskala i KIF-höljet, <c8/>). Allt är MODELLED utifrån illustrativa parametrar från öppna källor; inte validerat mot verklig VLBI- eller Gateway-spårning; ingen anknytning till eller något stöd från någon myndighet.

seg-a892ce052e3c = <b>Sex nya valideringar mot externa oberoende referenser</b> (verifieringsmatrisen står nu på { "15" } validated):

seg-c30ae6767c6c = <b>ADEV / HDEV på en verklig 5071A-cesiumklocka</b> — validerat mot Stable32:s referenser för decadpunkter (<c1/>).

seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV mot Stable32-referensen <c1/></b> — validerat mot Stable32:s publicerade tabeller (<c2/>).

seg-e8728f57effa = <b>ROC AUC för anomalidetektion på verklig ESA OPS-SAT-telemetri</b> — validerat mot scikit-learn (<c1/>).

seg-5446957ac631 = <b>Syntes av ICGEM-tyngdfunktionaler</b> — validerat mot normaltyngdstandarden GRS80 (Somigliana-γ till { "3.5e-12" }; EGM2008-störningskarta, <c1/>).

seg-751c5ac90229 = <b>Klobuchar-modellen för den utsända jonosfären</b> — validerat mot RTKLIB (<c1/>).

seg-dcc6d4e04a5c = <b>RAIM-detektionskärnan</b> ({ "171" } fall, <c1/>) och <b>skyddsnivån för SBAS enligt DO-229E</b> på verkliga EGNOS-data (RTKLIB:s SBAS-PL-fork, <c2/>) — båda validerade mot sina externa oberoende referenser.

seg-3f6c1ff0b3a4 = <b>Register över representativitet och återstående steg till flygning</b> (<c1/>). En strukturerad post som varje demonstrator ger — vad som är representativt, vad som är förenklat och vad som står mellan modellen och flygning — den ärliga följeslagaren till varje MODELLED avvägning.

seg-6b4c78bdaf35 = <b>Aggregering av studier och smidigare CLI.</b> Ett scenariomanifest för en svit med aggregering av studier med ett enda kommando, hashstabil studiemetadata + <c1/>, scenariokontroll med <c2/> och visning av valideringsnivå per FoM i studierapporter.

seg-e24230b80a89 = <b>kshana.dev har utformats om kring en gemensam domänrygg</b> — förmågor och validering har slagits ihop till en domänutforskare med ett gemensamt ordförråd, de nya validerade öarna har lyfts fram, ett landexakt animerat jordinstrument och en uppmaning att beställa en studie har tillkommit, liksom varumärke och länkar för Ashforde OÜ.

seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE har granskats för fullständighet och ärlighet</b> — föråldrade antal validerade har korrigerats (nu { "15" } externa oberoende referenser), diagrammen har byggts ut, och förtrycken om Conditional Timing Protection Level (arXiv:{ "2606.24210" }) och optimismgapet vid RF-störningar (arXiv:{ "2606.22054" }) har citerats.

seg-42a317c6ce06 = Källorna i <c1/> och pipelinen för JOSS-utkastet finns kvar i det offentliga arkivet.

seg-8ed5cf845b00 = Den här releasen lägger till fyra studieförmågor i den öppna motorn — en villkorad skyddsnivå för tidssynkronisering, poängsättning av PNT-resiliens i linje med ramverk, en utvärdering av optimismgapet vid RF-störningar och en front end för programvarudefinierad mottagare / verkliga data — var och en reproducerbar från ett enda kommando och skriver en bytedeterministisk artefakt. Alla studier är MODELLED (syntetisk eller kalibrerad mot offentliga datamängder), bär sin ärliga härkomst (motorversion, frön, konfigurationshash) och sina valideringsmärken, och är inte certifieringar.

seg-0c9f0c665491 = <b>Conditional Timing Protection Level (<c1/>).</b> En holdover-begränsad gräns för det oupptäckta tidsfelet under GNSS-spoofing, med ett golv för k-sigma-monitorn, en van Loan-varians för framdrivning över detektionslatensen och en CUSUM-tid till larm. Kalibrerad mot en verklig inspelad attack (JammerTest { "2024" }, scenario { "2.1.1" }) via <c2/>, som reproducerar sin referenstabell ur skalärer som hämtats ur den offentliga inspelningen (den råa datamängden distribueras inte vidare).

seg-d874d7f13f28 = <b>Poängsättning av PNT-resiliens i linje med ramverk + studie av beslutsinstabilitet (<c1/>).</b> Arkitekturmodell, poängsättning i linje med RPCF, viktning med Dirichlet-simplex, instabilitet i Kendall-tau och andel byten av top-1 samt kollaps av mångfald i gemensamt läge (Hill-N2), med <c2/>. Korstabell i <a1><c3/></a1>.

seg-343f7af54503 = <b>Studie av optimismgapet vid RF-störningar (<c1/>, <c2/>, <c3/>).</b> En panel med 13 detektorer över ett parameterförankrat syntetiskt korpus, ett optimismgap mellan data inom och utanför fördelningen, skalningslagstrender med en permutationsnollhypotes och en prediktor för försämring med uteslutning av en i taget, via <c4/>.

seg-6eed55859bbf = <b>Front end för programvarudefinierad mottagare (<c1/>) och adaptrar för verkliga data (<c2/>).</b> Rå IQ/IF till korrelatorstift och SQM, samt inläsningsadaptrar (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) och exempel för sondering. De läser inspelningar som användaren själv tillhandahåller lokalt; inga inspelningar checkas in.

seg-afe2282fa771 = <b>Incheckade studieartefakter.</b> De bytedeterministiska <c1/> och <c2/> spåras nu under <c3/>, så att studiens siffror kan kontrolleras utan ombyggnad; de kan fortfarande genereras om med generatorerna ovan. Råa datamängder hålls utanför arkivet (<c4/>).

seg-450d82cddc28 = Versionen har höjts till { "0.20.0" } i <c1/>, <c2/> och <c3/>; artefakterna i korsningsstudien har genererats om så att deras stämpel stämmer med den släppta versionen.

seg-a0a66af8fd14 = <b>Licensen har bytts från Apache-2.0 till GNU AGPL-3.0-only, med en kommersiell licens tillgänglig från Ashforde OÜ (dubbel licensiering).</b> Den öppna motorn förblir helt öppen och offentligt verifierbar; AGPL:s nätverks-copyleft (§{ "13" }) innebär att en sluten eller värdbaserad härledning måste komma tillbaka som öppen källkod — eller ta en kommersiell licens. Det här försvarar den validerade kärnan mot att någon forkar och stänger den, samtidigt som trovärdigheten hos en offentlig, körbar och granskningsbar motor bevaras. Se <a1><c1/></a1> (AGPL) och den nya <a2><c2/></a2> (vad varje licens omfattar och när den gäller).

seg-ffa799fdb814 = <c1/> innehåller nu AGPL-3.0-texten; SPDX-huvuden i alla källor har uppdaterats till <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, webbplatsen samt metadata för crate och paket (<c7/>, <c8/>, <c9/>, MCP-crate + avbild) har uppdaterats i enlighet med detta.

seg-8d67aba2af0b = <b>Bidragsvillkoren</b> (<a1><c1/></a1>) licensierar nu inkommande bidrag under AGPL <b>och</b> ger Ashforde OÜ rätt att ta med bidrag i den kommersiellt licensierade utgåvan, så att dubbellicensieringen fortsätter att fungera.

seg-93644d1c1420 = <b>Beroendepolicyn är oförändrad men har motiverats på nytt</b> (<a1><c1/></a1>, <c2/>): beroenden förblir tillåtande (Apache/MIT/BSD/ISC). AGPL tillåts bara för kshanas egen crate — ett <em>beroende</em> med copyleft skulle smitta den kommersiella utgåvan och bryta dubbellicensieringen.

seg-9b77c2d36241 = <b>Notering för efterföljande led:</b> det här är ett licensbyte till copyleft. Användare som förlitade sig på de tillåtande villkoren i Apache-2.0 kan fortsätta använda den senaste Apache-2.0-releasen (<c1/> och tidigare, som publicerade); från <c2/> och framåt gäller AGPL-3.0 / kommersiell licens.

seg-51e32f15b7ea = <b>Höjde <c1/> från { "0.24" } till { "0.29" }</b> för att få bort RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) ur externa OSV-/beroendeskanningar. Båda är rådgivningar på <em>funktionsnivå</em> vars berörda funktioner (<c2/>/<c3/>, <c4/>) Kshana aldrig anropar, och <c5/> är ett valfritt beroende (med funktionen <c6/>) — så den verkliga exponeringen var noll — men höjningen håller skanningen ren för efterföljande granskare. Migrerade <c7/> till API:et i pyo3 { "0.29" } (returtypen Bound för <c8/>; explicit <c9/> på pyclass <c10/>). Alla { "11" } Python-bindningstester går igenom mot den ombyggda extensionen.

seg-8d9332df5c74 = <b>Elva nya körbara scenariotyper — demonstratorer för två anbud, en CCSDS-interoperabilitetsbrygga och en förstaordningssvit för uppdragsanalys / miljö (alla MODELLED, additiva; befintliga golden-filer för reproducerbarhet är oförändrade).</b> Var och en kan dirigeras via CLI / Python / WASM / MCP, levereras med en <c1/> och bär ett uttryckligt MODELLED-märke i sitt resultat-JSON och i den enradiga sammanfattningen (ett test per typ i <c2/> kontrollerar att märket finns och att utdata aldrig innehåller strängen <c3/>):

seg-20b74caf58cc = <c1/> (<c2/>) — Testbädd för utvärdering av maskininlärningsbaserad detektion av RF-störningar: ett märkt <b>syntetiskt</b> korpus + ett detektoroberoende <b>ROC/AUC</b>-underlag + en rapport om <b>optimismgap</b> mellan data inom och utanför fördelningen (enbart driftsegenskaper — aldrig fält-/IQ-data).

seg-0253656a0ecf = <c1/> (<c2/>) — avvägning mellan kvant och klassisk PNT med inläsning av uppmätt ADEV och ett resiliensomhölje för GNSS-nekade miljöer.

seg-901bd713bd62 = <c1/> (<c2/>) — sol-/geomagnetiska index (IAGA-tabellen Kp↔ap, dagligt Ap, centrerat 81-dygns F10.7a), exosfärstemperatur enligt <b>Jacchia-71</b> och en aktivitetsdriven koppling av termosfärens densitet över en statisk atmosfär (INTE en absolut densitetsmodell av typen NRLMSISE).

seg-2323b43c0ffc = <c1/> (<c2/>) — <b>CCSDS { "502.0" } OEM</b>-import + brygga för tur och retur för efemerider från GMAT / Orekit / STK (läsaren <c3/>, exakt invers till skrivaren).

seg-188aeb3e8219 = <c1/> (<c2/>) — tvåkropps-<b>uppskjutningsazimut</b> (<c3/>), planändrings-Δv, bonus från platsens rotation och geometri för dagliga tillfällen.

seg-6200a47276e6 = <c1/> (<c2/>) — ballistisk återinträdeskorridor enligt <b>Allen-Eggers</b>: maximal retardation, hastigheter vid maximal g-belastning och maximal uppvärmning, höjd vid maximal g-belastning.

seg-0874c2241748 = <c1/> (<c2/>) — geometri för EO: <b>svepbredd / GSD / åtkomst / återbesökstid</b> (SMAD-rymdtriangel).

seg-83c7588ff074 = <c1/> (<c2/>) — kodning/avkodning av primärhuvudet i <b>CCSDS 133.0-B Space Packet</b> med bitexakt tur och retur.

seg-ae1bcad02880 = <c1/> (<c2/>) — <b>gravitationsgradientmoment</b> med 3 frihetsgrader + <b>RSS-budget för pekfel</b> (skalär budget före hårdvara, inte en reglerslinga).

seg-65f59cc12e02 = <c1/> (<c2/>) — <b>prediktion av uppgång/nedgång för överflygningar</b> från markstation (AOS/TCA/LOS, maximal elevation, åtkomst).

seg-178776497627 = <c1/> (<c2/>) — enkelriktad länkekvation enligt <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / marginal / slutning).

seg-e7fee32a00f5 = <b>Hybrid kvant + klassisk UKF med 17 tillstånd och tät koppling — gjord till ett körbart scenario (MODELLED).</b> En ny scenariotyp <c1/> (<c2/>, <c3/>) som gör det tidigare enbart API-baserade osparfiltret för tätt kopplad GNSS/INS med 17 tillstånd (<c4/>) till ett scenario som bindningarna för CLI/Python/WASM/MCP kan dirigera. Felvektorn med 17 tillstånd är de <b>{ "15" } INS-feltillstånden</b> (position, hastighet, felinriktning av attityd, accelerometer- och gyrobias) utökade med den <b>CAI-härledda korrektionen av accelerometerbias</b> — kallatomsinterferometern (<c5/>) sätter golvet för hastighetens slumpvandring <c6/>, så att den långsiktiga driften under framdrivningen är den som kvantsensorn begränsar — och en <b>klocka med 2 tillstånd för fas + frekvens</b> vars processbrus kommer från <b>q-parametermotorn för klockor</b> (<c7/>, som avbildar en klockas Allan-deviationsprofil på PSD:erna <c8/>/<c9/>, skalade till avståndsenheter). Plattformen stöds av GNSS under en inledning (filtret lär sig bias, hastighet och klocka) och glider sedan genom ett GNSS-avbrott enbart på CAI-IMU och klocka, så körningen visar <b>klassisk IMU på kort sikt + kvant på lång sikt</b> som hybrid. Kvalitetsmåttet är <b>filtrets självkonsistens</b>: samlad <b>NEES</b> (Normalised Estimation Error Squared, över den skattbara delmängden position/hastighet/klocka) och <b>NIS för innovationens vithet</b> (Normalised Innovation Squared) över ett Monte Carlo-ensemble, kontrollerade mot deras { "95" }-procentiga χ²-band (Bar-Shalom §{ "5.4" }). Det matchade filtret hamnar inom banden; ett medvetet feljusterat filter (knapparna <c10/> / <c11/>) flaggas — en objektivt kontrollerbar och urskiljande spärr, inte ett gummistämpel. <b>Kontrollen av NEES/innovationens vithet är den STATISTISKA OBEROENDE REFERENSEN: ett påstående om självkonsistens (filtrets rapporterade kovarians stämmer ärligt med spridningen i dess egna fel under det modellerade bruset), INTE en garanti för noggrannhet i verkligheten.</b> Ärligt omfång: allt är <b>modellerat / simulering</b> — CAI- och klockindata är inramade värden som är representativa för litteraturen, inte uppmätt hårdvara; CAI-hårdvaran och dess nyckelperson förblir partnerägda; ingenting här antyder TRL > { "3" }, flygerfarenhet eller extern validering (resultat-JSON och den enradiga sammanfattningen bär dessa märken uttryckligen). Den enda banan med konstant hastighet och horisontell flygning gör att attityd- och IMU-biastillstånden bara är svagt observerbara, så NEES bedöms över de { "8" } skattbara tillstånden; en manövrerande bana för full observerbarhet av alla 17 finns på färdplanen. Lägger också till <c12/> (returnerar NIS för varje uppdatering) och instrumentering för konsistens i <c13/>. Alla befintliga scenarier påverkas inte (additivt; golden-filer för reproducerbarhet oförändrade).

seg-9b55f4ac5053 = <b>Sekventiell (rekursiv) terrängreferensnavigering — SITAN som löpande filter.</b> En ny scenariotyp <c1/> (<c2/>, <c3/>) som kör den befintliga mätmodellen höjdmätare mot DEM <b>epok för epok</b> genom SIR-motorn <c4/>, i stället för den satsvisa sökningen från grovt till fint som <c5/> använder för att återfinna en enda <em>konstant</em> INS-förskjutning. Vid varje vägpunkt propageras molnet med det inkrement som INS rapporterar (självt förvanskat av driftens tillväxt per steg), viktas om efter terrängmatchningen och omsamplas vid degenerering — så att en <b>tidsvarierande</b> INS-drift <em>följs</em> längs banan, vilket en anpassning med konstant förskjutning strukturellt inte kan göra. På den syntetiska DEM:en förblir den rekursiva skattningen begränsad och konvergerar på nytt (slutligen ≈ { "70" } m) medan den ostödda tröghetslösningen divergerar obegränsat till ≈ { "5" } km; felet per epok följer terrängens särprägel (det glider på den felaktiga INS över platta sadlar och låser in sig på nytt över särpräglad relief), och övervakningen av effektiv urvalsstorlek bekräftar ett friskt moln. Ärligt omfång: kartan är <b>känd och fast</b> — rekursiv <em>lokalisering</em> mot en lagrad DEM (lokaliseringsdelen av terräng-SLAM), inte gemensam kartskattning; icke-cirkulär till sin konstruktion (den injicerade driftrampen är den oberoende referensen). Alla befintliga scenarier påverkas inte (additivt; golden-filer för reproducerbarhet oförändrade).

seg-87ba3bc926fa = <b>Resiliensrygg för GNSS-nekade miljöer + FutureNAV-demonstratorsnitt</b> (<c1/>, och grunder för resiliensomhölje under <c2/>, <c3/>, <c4/>, <c5/>, med FutureNAV-verifieringssnitt i <c6/>). Sätter ihop byggstenarna för alternativ PNT — klockans holdover, signalföljning, tröghetsframdrivning, terräng — till en enda berättelse om resiliens vid GNSS-avbrott. MODELLED; additivt.

seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — ett versionerat, självbeskrivande artefakthölje</b> (<c1/>). Ett schemataggat omslag runt scenarioresultat så att en lagrad artefakt bär med sig sin typ, sin schemaversion och sina MODELLED-/VALIDATED-märken, och så att äldre höljen förblir läsbara framåtkompatibelt. Additivt; befintligt resultat-JSON oförändrat.

seg-07147766ab22 = <b>Modulation / följning av navigeringssignal + differentialkorrektor för halo/NRHO i CR3BP</b> (<c1/>, <c2/>). En förstaordningsmodell för modulation och följning av navigeringssignaler, och en differentialkorrektor för det cirkulära begränsade trekroppsproblemet för halobanor / nästan rätlinjiga halobanor, framlyft på den befintliga förmågeaxeln för djuprymd. MODELLED.

seg-d0d2366e3351 = <b>Utvärderingsläge för fördelningsskifte + reglage för korpusets allvarlighetsskala för <c1/></b> (<c2/>). Lägger till en uttrycklig uppdelning i data inom och utanför fördelningen och en justerbar allvarlighetsskala för korpuset i underlaget för optimismgap med ROC/AUC (enbart driftsegenskaper — aldrig fält-/IQ-data).

seg-9bb8ee93e70b = <b>Avkastning på kostnad per täckning + avbildning av integritetspåverkan vid missad detektion</b> (<c1/>, <c2/>). En ROI-lins för frugal engineering (kostnad per täckningsenhet) och en avbildning från andelen missade detektioner till påverkan på integriteten. MODELLED; additivt.

seg-55f8ba5b52ee = <b>Citerat parameterblad för felmodellen för kallatomsinterferometer (CAI)</b> (<c1/>). Ett litteraturreferat, inramat parameterblad för CAI-tröghetsmodellen — indata är <b>citerade, inte uppmätt hårdvara</b> (inget TRL- eller flygpåstående); det matar golvet för hastighetens slumpvandring i <c2/>.

seg-cfbff4acc64c = Projektstyrning.

seg-982f9ea3eee8 = <c1/> som dokumenterar beslutsmodellen och gränsen mellan öppet och slutet; raden för community/styrning i förmågekartan går från <c2/> för att spegla detta.

seg-c9ff6a7183eb = <b>Skyddsnivå för ARAIM-integritet — nominell bias (<c1/>) och σ_URA tillämpas nu.</b> MHSS-skyddsnivån drar nu av den ensidiga nominella biasprojektionen <c2/> per felläge, och använder <b>integritets</b>-sigma σ_URA (skilt från <b>noggrannhets</b>-sigma σ_URE) som medföljer Integrity Support Message. Det gör skyddsnivån mer konservativ och standardriktig, och därför <b>ändras de PL-värden som befintliga integritetsscenarier rapporterar</b>. ISM/scenariot får fälten <c3/> <c4/> / <c5/>, så indata som lämnar dem osatta behåller tidigare beteende. Se <c6/> för den återställda formeln <c7/> och den ärliga implementationsanmärkningen.

seg-c408f8944ac6 = Konsistens med χ² i spoofing-monitorn.

seg-92e2b5c5458c = <c1/> använder nu den delade inversa χ²-vägen <c2/>, vilket tar bort en andra, avvikande χ²-implementation så att RAIM och paritetsmonitorn för spoofing är överens om sina trösklar.

seg-6d424034e500 = <b><c1/> kopplat till CLI-dispatchern.</b> Scenariot kunde tidigare bara nås via API:et; det dirigeras nu som <c2/> precis som alla andra scenarier.

seg-62c3efb54991 = <b>Noggrannhet i dokumentation/antal.</b> Antalet scenariotyper i README är nu fastlåst mot <c1/> av ett <c2/>-test, så att det dokumenterade antalet inte längre kan glida ifrån dispatchern.

seg-5f0f497aa643 = <b>PNT för djuprymd och Mars — öppen radiometrisk navigeringsmotor + GSE-simulering.</b> En ny, helt additiv förmågeaxel ovanpå den jordvaliderade kärnan (varje befintligt jordscenario är <b>byte-identiskt</b> — golden-filerna för reproducerbarhet går igenom oförändrade utan någon omgenerering). Lägger till: en dynamikkärna för flera kroppar (<c1/> med tesseral gravitation för Mars enligt GMM-3, ett kroppsfast Mars-system enligt IAU, en utbytbar söm <c2/>, tvådelade juliska datum med precision under mikrosekunden och TT↔TDB); radiometriska observabler (iterativ ljustid + Shapiro-fördröjning, två-/en-/trevägs Doppler och avstånd via Moyers lösning med två ben, koherent transpondervändning, regenerativ/PN-avståndsmätning enligt CCSDS { "414" }, Δ-DOR enligt CCSDS { "506" }, media som solplasma/tropo/iono); inläsning + utskrift av CCSDS-TDM ({ "503" }); ett Square-Root Information Filter med reducerad dynamik, empiriska RTN-accelerationer, en ombordklocka med tre tillstånd och en modell för Mars-drag; en gemensam estimator för fusion av enkelriktat + tvåvägs; scenarioytan <c3/> (reläkonstellation + LMO/överföring/ yta) över CLI, Python, WASM, MCP och playground; och en GSE-prestandasimulator från början till slut (geometri → länkbudget → observabler → SRIF → kovarians). <b>Valideringsnivå — simuleringsvaliderad:</b> syntetisk sluten OD (Mars-LMO ≈ { "0.2" } m) och analytisk självkonsistens, där dynamiken kring Solen för Mars har korskontrollerats oberoende mot JPL <b>DE440</b> (<c4/>, kärnstyrd: { "137" } m vid 1-dygnsbåge, den ärliga omodellerade n-kropps-resten). Rapporterade noggrannheter för djuprymd är <b>simulerings-/kovariansmått på kvalitet</b>, inte resultat från verkliga uppdrag; validering mot verkliga spårningsdata från DSN/ESTRACK finns kvar på färdplanen. ANISE (MPL-2.0, edition-2024) är begränsad till en korskontrollcrate som är undantagen från workspace, så licensspärren <c5/> och jobbet för MSRV-1.75 är orörda.

seg-2ab34100a2d7 = <b>Markspår med myndighetsnoggrannhet från verklig IERS jordorientering.</b> Scenariot <c1/> tar ett valfritt fält <c2/> — den inlinade kroppen av en verklig IERS-fil <c3/> — och reducerar markspåret genom UT1−UTC och polrörelse per epok, interpolerade ur den (samma <c4/> som <c5/> använder), och åsidosätter de nominella skalärerna <c6/>/<c7/>/<c8/>. Data följer med i scenariot, så körningen förblir reproducerbar och behöver inget filsystem (den fungerar i WASM-playground). En flagga <c9/> för in en verklig fil i scenariot från CLI. Stänger asymmetrin där bara <c10/> använde verkliga data om jordorientering.

seg-e778245e7d8f = <b>Konsistens i referenssystem för avståndshastighet.</b> Markstationen avbildas nu in i det tröghetsbundna systemet genom den exakta inversen till satellitens reduktion (<c1/>, som ångrar polrörelsen <em>och</em> sidertiden) i stället för en GMST-rotation som är blind för polrörelse, så att båda ändpunkterna delar ett system. Effekten på den rapporterade Doppler ligger under valideringsgolvet, men den tar bort en verklig systemmissanpassning och ett överdrivet påstående om "exakt" i källan.

seg-3b912d8a819d = <b><c1/> valideras.</b> En bärfrekvens som är noll eller inte ändlig ger nu ett fel i stället för att i tysthet ge noll Doppler (den hade gjort λ = c/bärvåg oändlig), i enlighet med den befintliga kontrollen av <c2/>.

seg-7d70317ca717 = <b>Validering av kraftmodellen genom anpassning av efemerider, korsvaliderad mot verkliga myndighetsprodukter.</b> En ny batchestimator med minsta kvadrat (<c1/>) med variationell tillståndsövergångsmatris och redigering av avvikande värden, driven av en fullständig kraftmodell (<c2/>: EGM2008-geopotential, tredje kroppar, fasta + oceaniska + atmosfäriska tidvatten och empiriska accelerationer av typen CPR/2-per-varv), matad av en verklig tolk för jordorientering från IERS <c3/>. Validerad mot publicerade referensbanor: <b>Galileo MEO till { "13" } cm efter anpassning</b>, ESA <b>Swarm-A LEO</b> och <b>LRO för månen</b> (selenocentrisk, GRAIL-gravitation, kroppssystem enligt IAU-2015 — reducerad dynamik { "6.6" } m, ärligt över målet { "5" } m på den öppna vägen; den väg i DE-klass med ANISE/DE440 som når det är en crate som är undantagen från workspace).

seg-bf88a3eb4733 = <b>Scenariot <c1/></b> — en integrerad spoofing-detektor med flera lager som kombinerar RAIM-paritet per epok, monitorer för AGC och signalkvalitet (SQM) samt ett sammanvägt beslut, validerad mot de publicerade scenarioparametrarna i <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }), inklusive det svåra fallet med bärvågsinriktning.

seg-976036ba124b = <b>Scenariot <c1/> — tillstånd, referenssystem, markspår och Doppler.</b> Propagera en satellit (TLE→SGP4 eller en analytisk bana) och ge, för varje steg, tillståndet i det tröghetsbundna TEME och GCRS (<b>position <em>och</em> hastighet</b>), den jordfasta positionen i ITRF/ECEF, <b>markspåret</b> under satelliten i WGS-84 (latitud / longitud / höjd) samt den topocentriska azimuten / elevationen / avståndet med avståndshastighet och <b>Doppler</b> från en markstation. Nåbart från CLI, Python, WASM och MCP-servern, och levereras som <b>förinställningen "Ground track"</b> i webb-playground, där spåret ritas <b>över en verklig världskarta</b> (kustlinjer från Natural Earth { "1" }:110m, inbäddade — inget nätverk eller externt beroende).

seg-761c95f2ede5 = <b>Export av CCSDS OEM</b> (<c1/> / <c2/>) — det hastighetsbärande Orbit Ephemeris Message som GMAT / Orekit / STK använder, i paritet med de befintliga exportörerna för SP3 och OMM.

seg-111b0896fdd4 = <b>Fasta, oceaniska (FES2004) och atmosfäriska (Ray { "2001" } S2) jordtidvatten</b> på geopotentialen (IERS Conventions kap. { "6" }), inkopplade i kraftmodellen.

seg-7e392131261a = <b>ARM64-wheels</b> — PyPI-bygget producerar nu även wheels för Linux aarch64 (manylinux_2_28), macOS arm64 och Windows arm64.

seg-7cc04ea3362b = <b>Utökad teknisk rapport (förtryck)</b> länkad från README, och JOSS-artikeln har gjorts inlämningsbar (författarens ORCID, kompilerad till PDF i CI vid varje ändring).

seg-3b1e95acc728 = <b>Referenssystem validerade till millimeter mot publicerade Vallado-vektorer.</b> Reduktionen TEME→PEF/ITRF, hela kedjan CIO IAU 2006/2000A GCRS→ITRS och omvandlingen ECEF→geodetisk WGS-84 är nu fastlåsta mot det genomräknade exemplet i Vallado et al. (AIAA 2006-6753) med dess IERS EOP, inte bara mot intern självkonsistens.

seg-fd9818877a6c = <b>Oberoende korskontroller av tidsskalor.</b> ERA och skalorna UTC/TAI/TT stämmer med <c1/> till < { "1" } µs, och planetefemeriden DE440 stämmer med JPL Horizons (geocentriska positioner för Månen/Solen), båda som alltid aktiva CI-spärrar.

seg-75aeec4cd6d0 = Webb-playground döljer fliken för kvalitetsmått när ett resultat inte har några rader med kvalitetsmått, så att paket med enbart diagram (efemerid, RAIM, spoofing) öppnas på sitt diagram — för efemerid markspåret — i stället för en tom tabell.

seg-b8ab0cc3ce7f = Playgroundens guidade reglage <b>och parametersvep fungerar nu för scenariot efemerid / markspår</b>: dess inställningar (stationens latitud / longitud, tidssteg, varaktighet, UT1−UTC) går att justera, och ett svep kan rita överflygningsgeometri (maximal elevation, maximal Doppler, höjd, hastighet) mot vilken som helst av dem — till exempel maximal elevation mot stationens latitud. Fliken Sweep visas nu bara när ett scenario faktiskt går att svepa, så inget paket erbjuder en kontroll som inte ritar någonting.

seg-9e7a37e51940 = Dokumenterade approximationen <c1/> för SGP4 vid anropsstället för GMST (ett rotationsfel på ≤ ~{ "13" }″, väl inom SGP4:s eget modellfel) och uppdaterade <c2/>.

seg-174a75e840b0 = JetBrains-pluginet <b>Kshana — PNT simulator</b> är nu publicerat och har antagits på <a1>JetBrains Marketplace</a1>. README, <c1/> och distributionsdokumenten länkar direkt dit.

seg-4deaf7918fff = <b>Publiceringen i MCP-registret</b> lyckas nu: <c1/> <c2/> översteg registrets gräns på 100 tecken (HTTP { "422" }). Förkortade den och anpassade servernamnet (och avbildens ägarmärke) till det kanoniska namnrymdsnamnet <c3/>.

seg-1408961042a1 = <b>Publiceringen på JetBrains Marketplace</b> lyckas nu: CI laddade upp om samma pluginversion som redan listats manuellt, vilket Marketplace avvisar. Pluginversionen har höjts till <c1/>, och idempotensskyddet behandlar nu även svaret "already contains version" som en lyckad no-op.

seg-74e8cab2f10e = <b>Cache-busting för <c1/></b>: de versionsstämplade frågesträngarna för <c2/>/<c3/> följer releasen, så att återkommande besökare alltid får det aktuella bygget.

seg-65949229eed7 = <b><c1/> — Kshana som server för Model Context Protocol (MCP)</b> (<c2/>). En fristående crate som är undantagen från workspace (SDK:n <c3/> är edition { "2024" }) och som exponerar den validerade motorn för AI-agenter och assistenter — Cursor, JetBrains AI Assistant / Junie och vilken MCP-klient som helst — över stdio. Verktyg: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, vart och ett ett tunt omslag runt <c9/>.

seg-bd792f66363c = <b>JetBrains IDE-plugin</b> (<c1/>). Högerklicka på ett scenario <c2/> → <b>Run Kshana Scenario</b>; kvalitetsmått och resultat-JSON strömmas in i ett Kshana-verktygsfönster. Ett rent plattformsplugin i Kotlin, kompatibelt med varje JetBrains IDE { "2024.3" }+.

seg-755358390517 = <b>Offentlig distribution + automatisk publicering per release</b> för båda:

seg-14fc2fd73553 = <c1/> till <b>crates.io</b> (<c2/>) via <c3/>.

seg-2b39bbfc0581 = <c1/> som en <b>OCI-avbild</b> för flera arkitekturer på <c2/> (<c3/>) via en ny <c4/>.

seg-c824d1532eb6 = <c1/> till det <b>officiella MCP-registret</b> via GitHub OIDC (inga hemligheter); registerposten (<c2/>) använder OCI-pakettypen med en ägare som verifierats via etikett.

seg-f90da0c61aac = IDE-pluginet till <b>JetBrains Marketplace</b> via <c1/> (spärrat med token, valfri utvecklarsignering) vid varje release-tagg.

seg-21d7457dad23 = <b>Oberoende korsvalidering av referenssystem mot ANISE/SPICE</b> (<c1/>). En fristående crate som är undantagen från workspace korskontrollerar IAU 2006/2000A CIO-reduktionen i <c2/> (<c3/>, GCRS→ITRS) mot <b>ANISE</b> (den rena Rust-återimplementationen av NAIF/SPICE) som roterar GCRF→ITRF93 från JPL:s <c4/>, med <b>samma IERS-parametrar för jordorientering <c5/> matade till båda sidor</b>, över åtta kvartalsvisa epoker { "2020" }–{ "2023" }. De två oberoende systemrealiseringarna stämmer överens till en <b>maximal relativ rotation på { "0.028" }″ — ≤ { "0.86" } m på marken, ≤ { "0.93" } m i LEO, ≤ { "3.6" } m i GNSS-bana</b>, vilket med god marginal uppfyller den länge gällande korskontrollen av referenssystem på "< { "10" } m" i ROADMAP (den kompletterar, och ersätter inte, de befintliga bit-för-bit-förankringarna mot SOFA/ERFA). Craten är isolerad eftersom <c6/> + <c7/> är MPL-2.0 / edition-2024 och aldrig får hamna i den publicerade grafen över beroenden för <c8/>, dess <c9/>, licensspärren <c10/> eller MSRV-bygget; ANISE är fastlåst med <c11/>. Innehåller en binär <c12/> (hämtar den ~{ "5" } MB stora BPC:n, skriver ut en tabell, skriver <c13/>), en testspärr som hoppar över sig själv när kärna/nätverk saknas och ett valfritt CI-jobb som bara körs med <c14/> (blockerar aldrig <c15/>). Dokumenterad i <c16/> (CIO-raden) och <c17/>.

seg-eb45b43dacc2 = <b>Mobilvänlig playground.</b> Åtgärdade horisontell överflödning av playgroundens <c1/> på telefoner (ett CSS-grid-element som som standard har <c2/> renderades ~{ "100" } px bredare än visningsytan) via <c3/> och breddskyddade kontroller; verifierat rent vid { "360" } / { "390" } / { "414" } / { "768" } px. Justerade åtgärdsknapparna "Pin to compare" / "Download report" (lika stora marginalrutor i flex-raden). Förstorade körknappar, reglage, väljare och navigeringslänkar till minimimåttet ~{ "44" } px för tryckytor enligt WCAG { "2.5.5" } / Apple HIG på telefoner och pekenheter, med oförändrad storlek på datorer.

seg-fe5095d5e61f = <b>Härdning av robustheten efter en kontradiktorisk stresstestomgång.</b> ({ "1" }) <c1/> avvisar nu elevation/azimut/varians som inte är ändliga och negativa eller icke-ändliga diagonaler i kovariansen (en nästan singulär geometri uppskalad med litet σ kunde tidigare slinka förbi spärren för absolut pivot och ge ett NaN-VPL / absurt HPL som ett <em>giltigt</em> <c2/> — ett tyst integritetsfel). ({ "2" }) Den numeriska propagatorn (<c3/>/<c4/>) stänger vid fel på ett begynnelsetillstånd som inte är ändligt i stället för att låta den adaptiva regulatorn snurra i evighet. ({ "3" }) DEM-cellhjälparen går inte längre i panik på ett rutnät med ett enda prov ({ "1" }×N). ({ "4" }) Azimuten i <c5/> hålls strikt i <c6/>. ({ "5" }) <c7/> avvisar icke-fysikaliska (NaN / icke-positiva) <c8/>/radie.

seg-9ca339d8977a = <b>Binären <c1/> + releaseartefakt</b>: en beroendefri generator som ger en utskriftsklar HTML-sammanfattning av valideringen på en sida och som indexerar varje validering som upprätthålls av CI (SGP4 666/666, EGM2008, bit-för-bit-referenssystem, NIST Allan, IMU-datablad, ARAIM/SBAS, reproducerbarhet på 3 operativsystem, täckning) mot dess test och externa oberoende referens. Releaseflödet genererar <c2/> och bifogar den (med SLSA-härkomst) till varje taggad release.

seg-bd231d07658f = <b>pytest för numpy-interoperabilitet + härdning av wheels</b>: <c1/> (körs i CI) plus en fastlåst manylinux-container och ett verifieringssteg med <c2/> i wheel-bygget.

seg-5427cae6fc39 = <b>Handledningar och utbildning</b>: <c1/> (tre genomarbetade handledningar, annoterade scenarier per domän, övningar på nivå 1/2/3) med <c2/> som fastlåser varje citerat tal mot motorns aktuella utdata.

seg-2fad9124c5a6 = <b>Artefakter för externa inlämningar</b> (<c1/>, <c2/>, <c3/>): ett utkast till JOSS-artikel, en anteckningsbok om kvant mot klassiskt och färdiga paket för awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, plus <c4/> — förbereder de externa stegen inför inlämning.

seg-0f88f8bccbc1 = <b>Terrängreferensnavigering och kombinerad alternativ PNT</b> (modulen <c1/>): en navigator för terrängmatchning med TERCOM/SITAN över en DEM (inläsare för <c2/> + generator för syntetiska testdata) och en kombinerad GPS-nekad navigator med gravitation + magnetfält (IGRF) + terräng, exponerad som scenariotyperna <c3/> och <c4/>. Validerad genom konvergens vid terrängmatchning (en känd injicerad förskjutning återfinns) och ett begränsat fel i det kombinerade filtret över ett GPS-nekat tidsfönster.

seg-bd01ec72fa2a = <b>Geometri för LunaNet LANS</b> (<c1/>): namngivna platser på månytan (Apollo 11/15/16, Shackletons kant) med auktoritativa selenografiska koordinater, utsiktsvinklar från ytan (az/el/avstånd), sikt/täckning och DOP för platsen, validerade mot månens radie, de publicerade platskoordinaterna och identiteten för radiellt överhuvudet med elevationen { "90" }°.

seg-2dad9cf59ea9 = <b>Guidad playground i webbläsaren</b>: reglage i guidat läge, en utdatapanel med flikar, en rundtur vid första körningen, lägen för parametersvep och överlagring av flera körningar, en beroendefri 3D-banvy med canvas/SVG (banpaketet ger nu en additiv <c1/>), ett inbäddnings-/iframe-läge och nedladdning som HTML-rapport — var och en med nodenhetstester i CI.

seg-261604603d67 = <b>Felmodell för IMU validerad mot datablad</b> (<c1/>): ARW/VRW/biasinstabilitet för ADIS16465/16488/16460 återfunna ur den syntetiserade Allan-deviationen och kontrollerade mot tillverkarens specifikationer (identifiering enligt NIST SP1065 / IEEE { "952" }).

seg-dc7b9bdb3076 = <b>Validering av Allan-estimatorer enligt NIST SP1065</b> (<c1/>): de fyra estimatorerna reproducerar de publicerade referensdeviationerna för 1000 punkter och konfidensgränserna i tabell 32.

seg-5d50be22aacd = <b>Skyddsnivåer för SBAS / DO-229E, jonosfärsfri L1/L5 och en compliance-karta för DO-316</b> (modulen <c1/>). <c2/> bildar den viktade geometrimatrisen ur varje satellits elevation/azimut och felbudgeten för UDRE/GIVE/flyg/tropo, inverterar normalmatrisen (delad <c3/>) och projicerar varianserna till HPL/VPL via K-faktorerna i DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> lägger till den jonosfärsfria pseudoavståndsobservationen för GPS L1/L5 (IS-GPS-705, <c5/>), validerad att ta ut motorns oberoende jonosfärsfördröjning av första ordningen. <c6/> spårar kraven i DO-316/DO-229E till de funktioner som implementerar dem. Validerad mot slutna definitioner av K-faktorer, numpy-referensgeometrin <c7/> och identiteten för kovarians längs två vägar; den publicerade korskontrollen av PL med RTKLIB/gLAB är dokumenterad som väntande på granskning i <c8/>.

seg-e9e60b40e42a = <b>Fullständig tesseral gravitation med sfäriska harmoniska funktioner — EGM2008-fältet till grad/ordning { "70" }.</b> Ett nytt <c1/> utvärderar geopotentialen och dess acceleration i det jordfasta systemet ur fullnormaliserade koefficienter <c2/>, med den stabila normaliserade Legendre-rekursionen av Holmes–Featherstone (avnormalisering skulle ge överflöde vid denna grad). De medföljande koefficienterna är NGA:s EGM2008-produkt (public domain, via ICGEM), medföljer i <c3/> och reproduceras bit för bit av <c4/> ur den incheckade <c5/>; vilken ICGEM-modell <c6/> som helst läses in via <c7/>. Validerad mot tre oberoende referenser: sammanfall till punktmassa (enbart <c8/> = <c9/>), ett fält med enbart zonala termer som reproducerar den befintliga <c10/> till ~{ "1e-9" }, och den analytiska accelerationen som stämmer med finita differensgradienten av den direkt summerade potentialen till <{ "1e-6" }.

seg-c33a2dbf851d = <b>Allmänt relativistisk acceleration av Lense–Thirring (referenssystemsdragning)</b> (<c1/>, IERS { "2010" } ekv. { "10.12" }), den gravitomagnetiska termen utöver den befintliga Schwarzschild-korrektionen, inkopplad i den numeriska propagatorn via en ny flagga <c2/>. Validerad som linjär i jordens rörelsemängdsmoment och { "1" }–{ "2" } storleksordningar under Schwarzschild-termen, det område som mätningarna med LAGEOS / Gravity Probe B ligger i.

seg-909562023109 = <b>Ett trait <c1/> som förenar de analytiska och numeriska banpropagatorerna.</b> Den numeriska Cowell-propagatorn med kraftmodell är nu en förstklassig jämlike till SGP4: en ny typ <c2/> (begynnelsetillstånd + <c3/> + <c4/> + val av steghalvering eller Dormand–Prince <c5/>) och <c6/> implementerar båda <c7/>, vars <c8/> returnerar det tröghetsbundna TEME-tillståndet i SI-enheter (m, m/s) så att de två är utbytbara bakom en <c9/>. SGP4-implementationen är den exakta omvandlingen km/min→SI av den inneboende metoden (verifierad med ett likhetstest); den numeriska implementationen klarar samma spärr på under en meter mot exakt Kepler via traitet, de två adaptiva drivrutinerna är överens, och ett <c10/> lyfter fram den underliggande SGP4-koden.

seg-d094880df57b = Den här releasen stänger det största korrekthetsgapet i motorn: jordorientering och reduktion av referenssystem görs nu med referensimplementationens kvalitet (validerat <b>bit för bit mot ERFA/SOFA</b>), integritetsstacken får <b>ARAIM med två konstellationer</b> på verkliga GPS+Galileo-TLE, och lagren för propagering, kvantsensorer, måne/cislunart rymd och geomagnetism fördjupas alla — vid sidan av ett typat Python-API, en rikare playground i webbläsaren och en reproducerbarhetsmatris för tre operativsystem. Höjdpunkter:

seg-bfe1d4a7cabd = <b>Referenssystem, bit för bit.</b> Full IAU 2000A- och 2000B-nutation, IAU { "2006" }-precession, den CIO-baserade (X, Y, s) reduktionen IAU 2006/2000A GCRS↔ITRS, IERS-polrörelse och utdatasystemen TEME→GCRS/ITRS — var och en validerad bit för bit mot referensrutiner i ERFA/SOFA.

seg-bb5705347a24 = <b>ARAIM med två konstellationer</b> (GPS + Galileo) på verkliga TLE, med HPL/VPL, utdata som Stanford-diagram och en öppen <c1/>.

seg-2865dadcd4c8 = <b>PNT för cislunart rymd</b>: en CR3BP-propagator för Jorden–Månen, system MCI↔MCMF, selenografiska koordinater och ett körbart LunaNet-scenario för integritet på månen.

seg-3b636707a158 = <b>Kvantavkänning</b>: systematiska fel från Coriolis och AC-Stark för kallatomsinterferometern, ett driftsvep och validering mot Freier-budgeten ({ "2016" }).

seg-10bc94801a6a = Geomagnetisk huvudfältsmodell <b>IGRF-14</b>, fristående och validerad.

seg-6485f627d793 = <b>Typat Python-API</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, typstubbar) med ett wheel-bygge i CI, plus förstklassig utdata av GCRS/ITRS från propagatorn och export av CCSDS OMM.

seg-2b7693641333 = <b>Trovärdighet och reproducerbarhet</b>: en direkt jämförelse av SGP4-noggrannhet mot den oberoende craten <c1/>, en täckningsspärr i CI (~{ "97" } % av raderna i <c2/>) och en reproducerbarhetsmatris för tre operativsystem (<c3/>/<c4/>/<c5/>).

seg-32e53ac66056 = <b>Varje diagram i playground matchar nu webbplatsens tema.</b> Alla tolv SVG-diagramgeneratorer — resultat-/holdover-diagrammet (<c1/> + <c2/>), Allan-deviationsdiagrammet (<c3/>) och varje scenariodiagram (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + tillgänglighet, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — använde kalla marinblå paneler (<c15/>), kallgrå axlar/text och en kolliderande serieuppsättning i rött/blått/lila. De använder nu den varma grafitpaletten genomgående: paneler med <c16/>, varmt <c17/>-rutnät, etiketter med <c18/>, med en konsekvent serietilldelning: kvant = honungsguld (<c19/>), klassisk = varm bärnsten (<c20/>), spec/gräns = <c21/>. Säkerhetskodade vyer behåller sin betydelse: RAIM-Stanford-diagrammet förblir grönt (tillgängligt) / bärnsten (vilseledande) / rött (farligt) / dämpat stål (otillgängligt), och HPL/VPL läses som guld/brons.

seg-2bb31dfc7756 = <b>Diagram beskriver sig nu självt när de sparas/laddas ner.</b> Båda diagrammen bakar in sin titel i SVG (Allan-diagrammets titel + undertiteln "lower is better" fanns tidigare bara som HTML runt bilden, så en sparad bild saknade bildtext), och båda bär en fotrad med härkomst — <c1/> — så att ett nedladdat diagram står på egna ben och förblir reproducerbart.

seg-9f528e334cd8 = <b>Varje diagram bär nu fotraden med härkomst.</b> Fotraden — <c1/> — stämplas centralt för alla scenariotyper i <c2/> (den fanns tidigare bara på diagrammen för holdover och Allan), så att varje sparad eller nedladdad bild — från playground, från CLI:s export med <c3/> eller från HTML-resultatkortet — identifierar sin version, sitt scenarioavtryck och sin källa. Hashen är märkt <c4/> för tydlighetens skull och kommer från resultatets <c5/> där den finns, med en reserv på källhash för integritets-/månrapporterna. Vad avtrycket är och varför det finns beskrivs i avsnittet "Output" i README och i <a1><c6/></a1>.

seg-635697ed3fb1 = <b><c1/> och RAIM-samplaren för Stanford-brus går nu inte längre i panik vid indata utanför intervallet / som inte är ändliga</b> (ett fynd från fuzzning som berodde på ordningen i <c2/>, från de nya ARAIM-scenarierna). <c3/> skyddar nu <c4/>/<c5/> som <c6/> (returnerar ett gränsvärde i stället för att panikera med <c7/>), och <c8/> för tillgänglighetens Stanford-brus begränsar till ett strikt positivt σ — så att stacken för integritet/ARAIM aldrig går i panik på muterade eller felkonfigurerade scenarier.

seg-b36a0c42845e = <b>CI-matris för reproducerbarhet över plattformar.</b> Ett nytt jobb <c1/> kör reproducerbarhetstesterna på <b>ubuntu-latest, macos-latest och windows-latest</b> vid varje push. Eftersom hela resultat-JSON inte är byte-identiskt mellan operativsystem (avvikelse i libm i sista ULP) kontrollerar den den plattformsinvarianta projektionen exakt — indataavtrycket plus utdataformen, fastlåst per scenario som SHA-256-golden-filer i <c2/> av nya <c3/> — vid sidan av de numeriska fastlåsningarna (<c4/>, till { "1e-6" }), SGP4-tillstånden (<c5/>, till { "2e-5" } km) och determinism inom samma process (<c6/>). Tillsammans bevisar dessa reproducerbarhet över plattformar på tre operativsystem utan det sköra i exakta bytehashar av hela utdata. <c7/> dokumenterar uppdelningen.

seg-9b8c0a407387 = <b>Täckningsspärr för kod i CI.</b> Ett nytt jobb <c1/> kör <c2/> med den LLVM-källbaserade motorn, publicerar en lcov-rapport som byggartefakt och upprätthåller ett golv för radtäckning på <c3/> (genererade datatabeller, CLI-ingången, testerna och webbtillgångar undantagna). Uppmätt radtäckning är ~{ "97" } % på <c4/> (SGP4 och klockmodulerna ≥{ "95" } %); spärren är satt till { "85" } % — över målet ≥{ "80" } % och med god marginal till det uppmätta värdet, så att den fångar regressioner utan att bli ostadig. Ett täckningsmärke publiceras i README.

seg-1dfc4beb239a = <b>SGP4/SDP4 head-to-head mot den oberoende craten <c1/>.</b> Ett nytt test (<c2/>) korsvaliderar Kshanas propagator mot det mest använda SGP4-biblioteket i Rust (neuromorphicsystems/sgp4, tillagt som ett beroende enbart för test) över samma { "666" } vektorer i AIAA 2006-6753. När båda drivs med gravitationsmodellen WGS72 som vektorerna använder stämmer de två oberoende implementationerna överens till <b>under en mikrometer</b> för jordnära och resonanta banor och till <b>{ "4.12" } mm i värsta fall</b> över alla regimer, och båda reproducerar referenstabellen <c3/>. Den incheckade jämförelsetabellen (<c4/>, omgenererad via <c5/>) bryter ut resultatet per regim (LEO/MEO, djuprymd, resonans på ½ dygn och 1 dygn) och noterar de fyra medvetet patologiska fall som craten avvisar vid konstruktionen. De levande kontrollerna håller båda inom { "2e-5" } km från referensen och inbördes inom { "4e-5" } km — ett regressionsskydd, inte en engångsföreteelse. Det här är konkurrenskraftig meritlista: korrekthet mot en oberoende kodbas, inte bara en statisk tabell. (Craten har som standard <c6/> med WGS84 och skiljer sig därför från WGS72-referensen med ~km — det framgår ärligt i tabellens text.)

seg-dc75162ecd64 = <b>Export av CCSDS OMM kan nu nås från början till slut.</b> OMM-skrivaren (<c1/>) hade tidigare ingen väg via CLI/API; medelelementen i ett scenario <c2/> kan nu publiceras som en CCSDS 502.0-B-2 OMM-katalog — ett OMM KVN-meddelande per satellit som definieras av TLE — via <c3/>, eller så skriver <c4/> i scenariot automatiskt <c5/> (som speglar det befintliga <c6/>). Varje meddelande bär satellitens <b>verkliga</b> NORAD-katalognummer, internationella COSPAR-beteckning (<c7/>) och epok (CCSDS-form med dag på året), tolkade ur TLE-rad { "1" } av den nya <c8/>; namnraden blir <c9/> (annars <c10/>). <c11/> är scenariots epok, inte väggklocktid, så utdata är reproducerbara. Nytt API: <c12/> / <c13/>, <c14/>, <c15/>. Ett syntetiskt Walker- eller RINEX-scenario (inga TLE-medelelement) ger fel i stället för att skriva en tom fil. Validerat mot den medföljande ögonblicksbilden med 30 satelliter <c16/> (<c17/>).

seg-036782a2b65e = <b>Interaktiva avläsningar vid hovring på playgroundens diagram.</b> När markören förs över ett diagram snäpper ett hårkors till närmaste prov och visar en verktygstips med värdet (<c1/>, inkopplad i <c2/>). På Allan-diagrammet visar det τ och varje klockas σ_y(τ); på tidsseriediagrammen för scenarier (klockans holdover, dödräkning, tidsöverföring, hybrid-PNT, GNSS/INS) visar det tiden och varje svits värde i diagrammets egna enheter (ns / m / ps / utnyttjandegrad), tolkade ur resultatet så att avläsningen stämmer med kurvan. Specialiserade diagram (RAIM, spoofing, svep) får ingen överlagring. Diagrammen förblir självbeskrivande blob-<c3/>, och överlagringen är ett genomskinligt hårkors + verktygstips ovanpå, så nedladdning/jämförelse/export berörs inte. Koordinatmatematiken (närmaste prov, markör→andel av ritytan, tolkning av polylinje) är enhetstestad (<c4/>, körs i CI).

seg-1588ae024e5d = <b>Jämförelseläge A/B i playground.</b> Fäst vilken körning som helst som baslinje A, kör ett andra scenario, så visas de två sida vid sida med en tabell över skillnader i kvalitetsmått (holdover, RMS/p95 för tidssynkronisering, tillgänglighet) som färgar vinnaren per mått (<c1/>, inkopplad i <c2/>; skillnadslogiken är enhetstestad i <c3/>, körs i CI). Alla värden infogas som text och alla diagram via blob <c4/>, så ingenting från en scenariosträng infogas någonsin som markup.

seg-6e7a99f8f275 = <b>Nedladdningsknappar för diagram (SVG + PNG).</b> Varje diagram i playground har nu ett temamatchat verktygsfält "Download SVG / PNG" (<c1/>, inkopplat i <c2/>). SVG lämnar tillbaka den trogna, skalbara originalbilden; PNG rastrerar samma självbeskrivande bild i 2x för bildspel och dokument. Filerna får namn med sin härkomst — <c3/> — och logiken för filnamn och storlek är enhetstestad (<c4/>, körs i CI).

seg-4cb87e7dc892 = <b>Geomagnetisk huvudfältsmodell IGRF-14 (<c1/>).</b> IAGA:s standardfält med sfäriska harmoniska funktioner (grad/ordning { "13" }, epok { "2025.0" } + sekulär variation { "2025" }–{ "2030" }; koefficienterna är maskingenererade ur den officiella <c2/> av <c3/> till <c4/>, bit för bit reproducerbara). En Schmidt-normaliserad syntes ger fältvektorn (nord/öst/ned) och härledda element (deklination, inklination, horisontell/total intensitet) på vilken geodetisk plats och vilket datum som helst, plus den geomagnetiska polen och dipolstyrkan — den magnetiska motsvarigheten till gravitationskartmatcharen för navigering med alternativ PNT. Validerad fristående: syntesen stämmer med den exakta slutna lutande dipolen, hela det analytiska fältet av grad 13 stämmer med en finit differens av den skalära potentialen, dipolaxeln reproducerar den kända geomagnetiska polen (~{ "80.7" }°N, −{ "72.7" }°E) och styrkan ~{ "29.7" } µT, och det globala fältet är fysikaliskt.

seg-c69d50031da4 = <b>Typade Python-bindningar (<c1/>).</b> Utöver <c2/>/<c3/> med sträng in/sträng ut exponerar modulen nu en typad klass <c4/> (<c5/>, <c6/>, <c7/> och en åtkomstmetod <c8/> som returnerar resultatet tolkat till en inbyggd Python-dict — ingen ny JSON-tolkning, kan omslutas av NumPy), plus <c9/>, <c10/> (tolkad lista med metadata-dictar) och <c11/> (en lista med felmeddelanden som inte kastar fel). Levererar en typstubb enligt PEP { "561" } (<c12/> + <c13/>) för mypy/pyright/editorer och en snabbstart i <c14/>. De befintliga funktionerna är oförändrade.

seg-fb65ac14344c = <b>Förstklassiga utdatasystem för propagatorer (<c1/> enum <c2/> + <c3/> + <c4/>).</b> Varje <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) kan nu ge sin position i TEME, <b>GCRS</b> (≈ J2000) eller <b>ITRS</b> (jordfast) — TEME är nativt, GCRS via den validerade reduktionen TEME→GCRS, ITRS genom att kedja den vidare till CIO-rotationen <c6/> enligt IAU 2006/2000A — och sitt fullständiga GCRS-tillstånd (position + hastighet) via <c7/>. Det tröghetsbundna utdata för aktuellt datum är inte längre bara TEME.

seg-8f596733c439 = <b>CIO-baserad reduktion från himmelssystem till jordsystem enligt IAU 2006/2000A (<c1/>).</b> Den moderna kedjan GCRS↔CIRS↔ITRS utan ekvinoktium: CIP-koordinater <c2/> avlästa ur matrisen för bias-precession-nutation enligt IAU 2006/2000A (återanvänder den validerade FW-precessionen + 2000A-nutationen med justeringen P03 för <c3/>), serien med 66 termer för CIO-lokalisatorn <c4/> (<c5/>, maskingenererad ur ERFA-referensen av <c6/> till <c7/>, bit för bit reproducerbar), matrisen GCRS→CIRS (<c8/>), jordrotationsvinkeln (<c9/>) och hela rotationen GCRS→ITRS (<c10/>, sammansatt med den befintliga IERS-polrörelsen). Validerad <b>bit för bit</b> mot de publicerade testvektorerna för <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 vid JD_TT { "2453736.5" }), <c12/> och <c13/>. CIO-kedjan och den äldre TEME-reduktionen med ekvinoktium/GMST-1982 visas stämma överens upp till sin dokumenterade konventionsskillnad i sidertid på ≈{ "2" }·(ekvinoktiernas ekvation). Det här är den rigorösa reduktion som vägen med ekvinoktium/GMST approximerade.

seg-32e6d8dfcebc = <b>Fullständig nutationsserie IAU 2000A (<c1/> <c2/>, <c3/>).</b> Den kompletta modellen MHB2000 — { "678" } luni-solära + { "687" } planetära termer — noggrann till < { "0.1" } mas, vid sidan av den befintliga trunkeringen 2000B med 77 termer. Tabellerna är maskingenererade ur IAU SOFA / ERFA-referensen <c4/> av <c5/> till <c6/> (generatorn reproducerar den incheckade filen bit för bit), och hela serien — både uppsättningarna fundamentala argument enligt IERS-2003 och MHB2000 och de planetära longituderna — är validerad <b>bit för bit</b> mot den publicerade testvektorn för <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } vid JD_TT { "2453736.5" }, till { "1e-13" } rad). Standardreduktionen TEME→GCRS behåller serien 2000B (~{ "1" } mas, under kedjans förenkling av hastighetssystemets rotation); <c8/> exponerar matrisen för aktuellt datum på < { "0.1" } mas för anropare som behöver den.

seg-35e9e419d2ae = <b>Körbart scenario för integritet på månen (<c1/>, <c2/>).</b> Kopplar in skyddsnivåpassagen vid månens sydpol (<c3/> <c4/> → <c5/>) i scenariokörningen med ett JSON-<c6/> och ett SVG-diagram över HPL mot tid, så att fallet med integritet i cislunart rymd nås direkt från CLI. Det visar gapet ärligt: med { "30" } m LANS σ_URE överstiger HPL vid sydpolen (≈ { "260" }–{ "450" } m) en larmgräns på { "50" } m ({ "0" } % tillgänglig) — integriteten för PNT på månen är ännu inte uppnådd.

seg-1910e8110b43 = <b>Tillgänglighet för ARAIM med två konstellationer på verkliga GPS+Galileo-TLE, och inkoppling i scenariokörningen (<c1/>, <c2/>, <c3/>).</b> Lägger till <c4/> (den avancerade ARAIM-motorn — fel hos enskilda satelliter <em>och</em> fel i hela konstellationen — körd över ett tidsrutnät) och <c5/>, och kopplar in den i körningen för <c6/> via en flagga <c7/> så att en ARAIM-studie med flera GNSS nås direkt från TOML. Ett test med verkliga data (<c8/>) på medföljande ögonblicksbilder från Celestrak för GPS+Galileo från 2026-06-07 visar att poolning av Galileo lyfter ARAIM-tillgängligheten från { "0.21" } till { "0.67" } under ett krävande VAL på { "12" } m ({ "10.5" }→{ "21.8" } satelliter i sikte), medan det läge som är robust mot konstellationsfel är i grunden begränsat med bara två konstellationer — den kvantitativa orsaken till att robust integritet med två konstellationer driver mot en tredje konstellation eller SBAS. Ärlig rest: den numeriskt exakta reproduktionen av tabell A-3 i EU:s ARAIM TN mot en enda versionslåst epok, och en fixturepost i Zenodo.

seg-78ab887a4543 = <b>Det cirkulära begränsade trekroppsproblemet (CR3BP) för systemet Jorden–Månen (<c1/>).</b> En ny kärna för cislunar dynamik som tvåkropps-/SGP4-propagatorerna inte kan erbjuda: rörelseekvationer i roterande system (<c2/>), en RK4-propagator (<c3/>), Jacobi-konstantens integral (<c4/>) och de fem Lagrange-punkterna (<c5/>). Validerad mot slutna / publicerade ankarvärden: de kollinjära punkterna för Jorden–Månen (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), de exakta liksidiga L4/L5 = (½−μ, ±√3/2, { "0" }), alla fem bekräftade som jämviktslägen i fältet, Jacobi bevarad till integratorns precision under propagering och den återställande kraften utanför planet som gör halo-/NRHO-banor möjliga. Det här är grunden för att kunna representera en verklig NRHO. Ärlig rest: differentialkorrigerade periodiska begynnelsevillkor för NRHO { "9" }:{ "2" }, den excentriska modellen / efemeridmodellen (DE) och den avnormaliserade transformationen till de selenocentriska systemen i <c6/>.

seg-14f4572144f3 = <b>IERS-polrörelse och reduktionen TEME→ITRF (<c1/>).</b> Lägger till <c2/> (SOFA <c3/>: <c4/> med TIO-lokalisatorn <c5/>), <c6/> / <c7/> och <c8/> — GMST-baserad rotation TEME→PEF följd av polrörelse — vilket fullbordar en ITRF-precis jordfast position ovanpå den enbart GMST-baserade <c9/> (polrörelsen är en effekt på tiotals meter vid banradien). <c10/>/<c11/> är observerade IERS-storheter som anroparen tillhandahåller. Ärlig rest: en helt CIO-baserad kedja (X, Y, s) och en numerisk korskontroll mot ANISE/SPICE på <{ "10" } m återstår som uppföljningar.

seg-b5e84faf880c = <b>Systematiska fel i kallatomsinterferometern, driftsvep och en validering mot en publicerad enhet (<c1/>, <c2/>).</b> Utökar den accelerometer för CAI som bygger på första principer med de två ledande deterministiska systematiska felen: fasen för <b>Coriolis/rotation</b> <c3/> (<c4/>, med den motsvarande accelerationsbiasen <c5/> via <c6/>) och fasen för <b>ljusförskjutning med AC-Stark</b> <c7/> (<c8/>, som tar ut sig själv genom symmetrin π/2–π–π/2 för en konstant förskjutning). Lägger till <c9/> (drift i dödräkningsposition mot cykeltid — kärnan i en jämförelse mellan kvant och klassiskt) och ett valideringstest mot den mobila gravimetern i Freier et al. { "2016" } (arXiv:{ "1512.05660" }): det modellerade golvet för kvantprojektionsbrus ligger under, och inom ~{ "2" } storleksordningar från, det publicerade kortsiktiga bruset på { "96" } nm/s²/√Hz. <c10/> uppdaterad. Ärlig rest: systematiska fel från vågfront/strålriktning, lösning av fransosäkerhet, den exakta reproduktionen av flygtesterna CARIOQA-PMP / Boeing-AOSense (kräver publicerade PSD:er för plattformen) och en förinställning för JS-playground.

seg-f32829ed9cf1 = <b>Reduktion av cislunara referenssystem och en integritetspassage vid månens sydpol (<c1/>).</b> Utökar månens ARAIM-motor med rotationen MCI↔MCMF (månencentrerat tröghetssystem ↔ månfast) (<c2/> / <c3/>, en förenklad modell med medelrotation vid månens sidertidstakt), selenografisk latitud/longitud/höjd (<c4/> / <c5/>) och <c6/> — en landad mottagare i Artemis-regionen mot en representativ uppsättning LunaNet-reläer över en passage på { "24" } h, vilket ärligt kvantifierar integritetsgapet: med nominella { "30" } m LANS σ_URE är skyddsnivån ändlig men överstiger en larmgräns på { "50" } m för ytoperationer. Ärlig rest: den precisa efemeriden för LANS NRHO (en cislunar bana med 3 kroppar), den fysikaliska libration / den precesserande månpolen (DE421/SPICE) och ett LunaNet-TOML-scenario återstår som uppföljningar.

seg-5ef720855cc4 = <b>Integrity support message för ARAIM, SVG för Stanford-diagram och den öppna ARAIM-referensen (<c1/>, <c2/>).</b> Lägger till ett uttryckligt <c3/> (σ_URA / σ_URE / b_nom / P_sat / P_const, med referensvärdena från WG-C för GPS+Galileo och omvandlarna <c4/> / <c5/> in i motorerna <c6/> för enkelfel och <c7/> för fel i hela konstellationen), en fristående renderare <c8/> av Stanford-integritetsdiagrammet (de fyra zonerna, gränsen <c9/>, larmgränsernas hjälplinjer, en färgkodad markör per epok) och <c10/> som dokumenterar algoritmen, ISM, felhypoteserna, kontraktet för skyddsnivån och fördelen med två konstellationer. Testen visar vinsten i geometri/redundans (poolning av en andra konstellation skärper HPL för enkelfel) och tolerans mot fel i konstellationen (användaren med två konstellationer klarar förlusten av en hel konstellation; en användare med en konstellation gör det inte). Ärlig rest: att numeriskt reproducera tabell A-3 i EU:s ARAIM TN / tillgänglighetssiffran { "15" }–{ "25" } % mot en versionslåst verklig TLE-ögonblicksbild, en fixturepost i Zenodo och inkoppling av <c11/> i körningen av scenariofiler.

seg-3607eb34acd9 = <b>Nutation IAU 2000B och hela tröghetsreduktionen TEME→GCRS/J2000 (<c1/>).</b> Lägger till den andra och tredje delen av en sann reduktion till tröghetssystem ovanpå den levererade precessionen IAU { "2006" }: den luni-solära serien MHB2000 med 77 termer (<c2/>, den vanliga trunkeringen IAU 2000B, noggrann till ~{ "1" } mas) med Delaunays fundamentala argument och nutationsmatrisen <c3/> i SOFA, samt Valladokedjan AIAA-2006-6980 TEME→TOD (ekvinoktiernas ekvation) → TOD→MOD (nutation) → MOD→GCRS (bias-precession), exponerad som <c4/> / <c5/>. Serien, argumenten och enhetskonstanterna är avskrivna ur IAU SOFA / ERFA-referensen <c6/> och validerade <b>bit för bit</b> mot den publicerade testvektorn för <c7/> (Δψ, Δε till { "1e-13" } rad). Ärlig rest: hela serien IAU 2000A med 678 termer (<{ "0.1" } mas), en numerisk korskontroll mot ANISE/SPICE på <{ "10" } m och polrörelse återstår som uppföljningar (se <c8/>).

seg-d9b5e459f6eb = Den här releasen levererar Kshanas första <b>icke-analytiska banpropagator</b> — en Cowell-integrator med en hierarkisk kraftmodell med sex störningar (tvåkropps + zonala J2–J6 + tredje kropp Sol/Måne styrd av epok + solstrålningstryck med konisk umbra-/penumbraskugga + atmosfärisk drag + den postnewtonska relativistiska Schwarzschild-korrektionen) driven av ett val mellan två adaptiva integratorer (RK4 med steghalvering och det inbäddade paret Dormand–Prince RK5({ "4" })) — vid sidan av ett lager för manöver- / banutformning (impulsiva och finita brännor, en Lambert-lösare enligt Izzo och ett porkchop-svep), ett alt-PNT-lager med gravitationskartmatchning som återfinner ett GPS-nekat spår på 60 minuter till under { "500" } m, en pipeline för banbestämning med batch + sekventiell och en fullständig UKF med 17 tillstånd och tätt kopplad GNSS/INS med dödräkning via kvant-CAI. Varje numerisk förmåga är fastlåst mot analytisk referens eller en handhärledd sluten form; de perturbationer som är avstängda som standard lämnar de släppta golden-filerna orörda.

seg-aa8d478f5c10 = <b>Postnewtonsk (Schwarzschild) relativistisk korrektion (<c1/> + <c2/>).</b> Lägger till den dominerande allmänt relativistiska störningen på en jordnära bana — den ledande drivkraften bakom den relativistiska periger-framflyttningen — i formen <c3/> enligt IERS / Montenbruck–Gill: <c4/>. Liksom atmosfärisk drag är den <b>hastighetsberoende</b>, så den följer med i högerledet för integratorn <c5/> via [<c6/>], är något man väljer till och är avstängd som standard. Validerad fristående: på en cirkulär bana kollapsar den till den slutna formen <c7/> (rent radiell och <b>utåtriktad</b>, komponenter utanför axeln exakt noll); dess <b>kvot mot tvåkropps är läroboksvärdet <c8/> i LEO</b> (signaturen för <c9/>); ett fall med radiell hastighet stämmer med den handförenklade <c10/>; och i propagatorn <b>stör den banan utan att dissipera den</b> — halva storaxeln bevaras till långt under en meter/dygn, den strukturella motsatsen till dragets monotona avtagande. Eftersom den är avstängd som standard är golden-filerna för tvåkropps/J2/zonal orörda. Justering av PPN-parametrarna (<c11/>,<c12/>) och termen för referenssystemsdragning av Lense–Thirring återstår som uppföljningar.

seg-043e831224ab = <b>Konisk skuggmodell för umbra+penumbra (<c1/>), som nu används av solstrålningstrycket.</b> Uppgraderar den binära förmörkelsen med umbracylinder till en mjuk faktor <c2/>: Solen och Jorden modelleras som skivor med skenbara vinkelradier <c3/>, <c4/> med skenbart centrumavstånd <c5/>, och <c6/> är ett minus den andel av solskivan som Jordens skiva skymmer (cirkel–cirkel-linsens överlappsarea) — fullt solljus för <c7/>, total umbra för <c8/>, ringformig för <c9/> och en kontinuerlig penumbra däremellan. <c10/> använder den nu, så att SRP-kraften avtar mjukt genom förmörkelsen i stället för att slås på/av. Lägger till det nominella IAU-värdet <c11/>. Validerad fristående: <c12/> i fullt solljus och <c13/> djupt i umbran (exakt), en <b>mjuk monoton penumbra</b> (<c14/> stiger { "0" } → ~½ vid <c15/> → { "1" } över bandet <c16/>), och den koniska penumbran <b>sträcker sig bortom umbracylindern</b> (en punkt som den binära cylindern kallar helt upplyst är <c17/> för konen). Den enklare <c18/> finns kvar; solens randfördunkling och skuggan från den tillplattade jorden återstår som uppföljningar.

seg-8d1c16019f3c = <b>Inbäddad integrator Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Lägger till det inbäddade paret med Butcher-tablå enligt standarden Dormand–Prince ({ "1980" }) vid sidan av den befintliga drivrutinen RK4 med steghalvering: sju FSAL-steg ger en lösning av 5:e ordningen och en felskattning av 4:e ordningen ur en enda uppsättning utvärderingar ({ "7" } mot { "11" } funktionsanrop per steg), en billigare skattning av lokalt fel. Den adaptiva drivrutinen återanvänder samma RMS-felnorm och stegregulator <c4/>, så den är ett utbytbart alternativ; <c5/> exponerar den på kraftmodellen för banor. Validerad fristående: den inbäddade felskattningen är <b>O(h⁵)</b> (en halverad steglängd skär ned den ~{ "32" } gånger); DP5({ "4" }) integrerar <c6/> till <c7/> och den harmoniska oscillatorn över { "50" } perioder med energin bevarad till <{ "1e-6" }; den når samma ändpunkt vid samma tolerans med <b>färre funktionsutvärderingar</b> än steghalvering (utan att offra noggrannhet); och <c8/> klarar samma spärr mot analytisk referens som vägen med RK4 — <b>under en meter mot den exakta Kepler-lösningen med universella variabler över en LEO-bana på { "24" } h</b> — medan de två drivrutinerna är överens inom <{ "1" } m på en J2..J6-bana (ingen sluten form). Högre inbäddade par (RKF7({ "8" }) / DOP853) återstår som uppföljning.

seg-cca3c00757d6 = <b>Atmosfärisk drag inkopplad i propagatorn som dess första hastighetsberoende kraft (<c1/> + <c2/> + <c3/>).</b> Lägger till <b>styckvis exponentiell atmosfär enligt Vallado tabell 8-4</b> <c4/> ({ "28" } band från havsnivå förbi { "1000" } km, begränsad under ytan) och det kvadratiska draget <c5/> mot den <b>medroterande atmosfären</b> <c6/> (<c7/>). Eftersom draget beror på hastigheten får <c8/> en ny <c9/> och integratorns högerled skickar nu hastigheten (<c10/>); den rent positionsberoende <c11/> är oförändrad, så de konservativa termerna och golden-filerna är orörda. Validerad fristående: densiteten <b>förankras vid havsnivåvärdet { "1.225" } kg/m³</b>, begränsas under ytan, <b>avtar monotont</b> genom LEO, ligger i bandet ~{ "1e-12" } kg/m³ för solmedelvärde vid { "400" } km, och dess <b>återfunna lokala skalhöjd (≈ { "58" } km vid { "400" } km)</b> är fysikalisk; draget <b>motverkar den medroterande relativa hastigheten</b> med storleken ~{ "2e-6" } m/s² i LEO för <c12/>; och — den viktigaste signaturen — draget är <b>dissipativt</b>: en bana på { "300" } km förlorar specifik energi <b>monotont</b> och dess halva storaxel <b>avtar med ett begränsat ~km/dygn</b>, där vakuumbaslinjen bevarar energin till <{ "1e-9" }. Termosfärens densitet enligt NRLMSISE-00 (klausulen om drag-densitet på < { "5" } %) återstår som uppföljning.

seg-0d20f02ef85f = <b>Solstrålningstryck inkopplat styrt av epok i propagatorns kraftmodell (<c1/> + <c2/>).</b> Lägger till <b>kanonkulemodellen för SRP</b> <c3/> med en <b>förmörkelsefaktor för cylindrisk skugga</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): strålningstrycket <c5/> från den moderna totala solinstrålningen på { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), flödets avtagande med inverterad kvadrat <c6/> och den radiella knuffen <b>bort från Solen</b>. Den följer med i <b>samma epokstyrda högerled</b> som tredje kropp, och samplar Solen <c7/> en gång vid den framflyttade epoken <c8/> som delas mellan Solen som tredje kropp och SRP. Sammansättbar: <c9/>. Validerad fristående mot handhärledda signaturer: <b>strålningstrycket vid 1 AU fastlåses till läroboksvärdet ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; SRP för en fullt belyst LEO-satellit är <b>bitidentisk</b> med kanonkuleformeln, pekar <b>bort från Solen</b> och ligger i <b>bandet ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> för cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>ett fördubblat avstånd till Solen ger en fjärdedel av storleken</b> (inverterad kvadrat); den <b>cylindriska skuggan förmörkar bara umbracylindern</b> (bortvänd från Solen <em>och</em> inom en jordradie från linjen Jorden–Solen) och ger <b>exakt noll</b> SRP i förmörkelse; och i propagatorn <b>stör SRP en LEO-bana med en liten begränsad storlek som skalar ~linjärt med A/m</b> — medan en modell utan störningar förblir bit för bit tidsoberoende och lämnar golden-filerna för tvåkropps/J2/zonal orörda. Den koniska umbran/penumbran (mjuk ν ∈ [{ "0,1" }]), atmosfärisk drag och extern korsvalidering mot GMAT/Orekit återstår som uppföljningar.

seg-d3f819c21660 = <b>Tredje kropp Sol/Måne styrd av epok, inkopplad i propagatorns tidsvarierande högerled (<c1/> / <c2/>).</b> Störningen från tredje kropp är inte längre en fristående kraftterm — den integreras nu av Cowell-propagatorn som en genuint <em>tidsvarierande</em> kraft: varje utvärdering av högerledet samplar positionerna för Sol/Måne <c3/> vid den <b>framflyttade epoken <c4/></b> (återanvänder <c5/> för omvandlingen mellan dygn och sekel), så att störkropparna rör sig längs sina banor under integreringen i stället för att vara frusna vid starten. Sammansättbar med vilken gravitationsmodell som helst (<c6/>). Validerad fristående: solens term i högerledet är <b>bitidentisk</b> med <c7/> utvärderad vid efemeridens position för det ögonblicket vid både <c8/> och <c9/> (vilket bevisar kopplingen { "86400" } s ↔ { "1" } dygn ↔ 1/36525 sekel exakt), störkroppen <b>flyttar sig ~{ "2.6" }·10⁹ m/dygn</b> mellan proven (inte fryst), de <b>momentana tidvattenstorlekarna i LEO</b> når läroboksbanden ~{ "5" }·{ "10" }⁻⁷ m/s² (Solen) och ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Månen, ≈ { "2" }× Solen), varje kropp <b>stör mätbart banan över ett dygn men förblir begränsad</b>, och samma begynnelsetillstånd propagerat vid <b>epoker ett kvarts år isär ger en annan bana</b> (tidvattenaxeln roterar { "90" }°) — medan en modell utan någon av kropparna aktiverad är bit för bit tidsoberoende och lämnar golden-filerna för tvåkropps/J2/zonal orörda. Efemerider i DE-klass och extern korsvalidering mot GMAT/Orekit återstår som uppföljningar.

seg-0a517f6c4b1b = <b>Månefemerid med låg precision (<c1/>), som fullbordar paret Sol/Måne som tredje kropp.</b> Lägger till Montenbruck & Gills lågprecisionsserie för månen (<c2/>) vid sidan av solmodellen, så att den kroppsoberoende <c3/> nu kan drivas av vilken himlakropp som helst med <b>ingen extern DE/SPK-kärna</b>. Validerad fristående mot handhärledda signaturer för månen: det geocentriska avståndet håller sig inom det verkliga <b>perigeum-/apogeumomhöljet (~{ "356 500" }–{ "406 700" } km)</b> över en månad och dess <b>månatliga medelvärde återfinner halva storaxeln på ~{ "384 400" } km</b>; <b>ekliptikal latitud överstiger aldrig lutningen ~{ "5.3" }° för månbanan</b> (kontrollerad genom projektion på ekliptikans pol i ekvatoriella koordinater, vilket validerar latitudserien och oblikvitetsrotationen tillsammans); månens <b>riktning återvänder till inom { "1" }° efter en siderisk månad ({ "27.3217" } d)</b> och dess <b>dagliga rörelse håller sig i det fysikaliska bandet { "12" }–{ "15" }°/dygn</b>; och störningen från månen som tredje kropp på en LEO-satellit har <b>läroboksstorleken ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ dubbelt så stor som Solens). Positionsnoggrannhet i DE-klass, atmosfärisk drag och SRP återstår som uppföljningar.

seg-8b7025e00dd1 = <b>Gravitation från tredje kropp (Solen) med en inbyggd efemerid med låg precision (<c1/>, <c2/>).</b> Lägger till störningen från tredje kropp i kraftmodellen: <c3/> (direkt attraktion minus den indirekta term som det geocentriska systemet måste dra av), med solens position levererad av den nya modulen <c4/> med Montenbruck & Gills analytiska lågprecisionsserie — <b>ingen extern DE/SPK-kärna behövs</b> för en körning med låg noggrannhet. Validerad fristående: accelerationen <b>stämmer med den exakta gradienten av sin egen störpotential</b> (<c5/>), störningen <b>försvinner i geocentrum</b> och har <b>läroboksstorleken ~{ "5" }·{ "10" }⁻⁷ m/s² på en LEO-satellit</b>, och solefemeriden når handhärledda ankarvärden för J2000 — <b>periheliavstånd ≈ { "1.471" }·10¹¹ m</b>, <b>deklination ≈ −{ "23" }° nära decembersolståndet</b>, en skenbar rörelse på <b>≈ { "1" }°/dygn</b> (≈ { "90" }° per kvartsår) och ett avstånd som håller sig inom omhöljet { "0.983" }–{ "1.017" } AU för jordbanan under ett helt år. Levererar halvan för tredje kropp i kraftmodellsteget i milstolpen för den numeriska propagatorn (Månen levereras i en följeslagarpost ovan); positionsnoggrannhet i DE-klass, atmosfärisk drag och SRP återstår som uppföljningar.

seg-99fd6ae1ea09 = <b>Kraftmodell med zonala harmoniska J2–J6 (<c1/> / <c2/>).</b> Utökar Cowell-propagatorns kraftmodell bortom J2 till hela jordens zonala fält till och med grad { "6" } (de publicerade standardvärdena i EGM-96, ej normaliserade, för <c3/>), inkopplad i propagatorn som <c4/>. Accelerationen är den <b>exakta analytiska gradienten</b> av den zonala störpotentialen <c5/> (Legendre-polynom med rekursion uppåt), validerad på tre oberoende sätt: den <b>reduceras till <c6/>, validerad med 666 vektorer, till maskinprecision</b> när den begränsas till <c7/>; den <b>stämmer med den numeriska gradienten av sin egen potential</b> genom hela fältet J2..J6 (guldstandardkontrollen för konservativa fält); och de udda termerna <c8/> mot de jämna <c9/>/<c10/> uppvisar sin <b>karakteristiska (anti)symmetri nord–syd</b> under <c11/> — päronformens asymmetri. En propagerad J2..J6-bana bevarar total energi (kinetisk + central + zonal potential) till ~{ "1e-8" } över ett dygn och stör den bana som bara har J2 med en liten, men inte försumbar, mängd. Det här levererar steg 2 ("J2–J6 zonala harmoniska") i milstolpen för den numeriska propagatorn; det tesserala EGM-fältet av hög grad, drag, SRP, tredje kropp och extern korsvalidering mot GMAT/Orekit återstår som uppföljningar.

seg-59f0ba5a6269 = <b>Numerisk (Cowell) banpropagator (<c1/>).</b> Kshanas första <b>icke-analytiska</b> propagator (resten av banstacken är analytisk SGP4/SDP4): den kopplar in kraftmodellen tvåkropps + J2 (<c2/>) i den adaptiva RK4-drivrutinen med steghalvering (<c3/>) som <c4/>, med en växel <c5/>. Validerad mot <b>analytisk referens som är starkare än ett numeriskt verktyg att jämföra med</b>: den ostörda banan reproducerar den <b>exakta Kepler-lösningen med universella variabler till under en meter över en LEO-bana på 24 timmar</b> (en strängare spärr än "mot en numerisk referens < { "10" } m" som milstolpen formulerar), specifik energi och rörelsemängdsmoment bevaras till ~{ "1e-9" } relativt, och nodalregressionen från J2 reproducerar den slutna <c6/> till första ordningens teori (inom { "2" } %, resten av ordningen O(J2²)). Lägger också till <c7/>, en Newton-lösare för Keplers ekvation som <b>returnerar <c8/> i stället för ett tyst felaktigt svar</b> när den inte konvergerar inom en begränsad iterationsbudget (fallet nära perigeum <c9/>). Ärligt omfång: kraftmodellen är bara tvåkropps + J2 — det tesserala EGM-fältet av hög grad ({ "200" }×{ "200" } + inläsare), drag (NRLMSISE-00), SRP, krafter från tredje kropp och en extern korsvalidering mot GMAT/Orekit återstår som uppföljningar.

seg-d4c7c29f09d1 = <b>Gravitationskartmatchning under 60 minuter utan GPS till < { "500" } m (<c1/>).</b> Fördjupar alt-PNT-lagret till valideringsmålet <em>Quantum Wayfarer</em> från ESA NAVISP: ett fordon flyger ett spår på ~{ "700" } km under ett helt GNSS-avbrott på en timme — dess tröghetslösning driver till <b>≈ { "70" } km</b> — och en kallatomsgravimeter plus en <b>hierarkisk matchare från grov till fin</b> med partiklar/rutnät återfinner den konstanta INS-driften till <b>≈ { "145" } m</b> (< { "500" } m), en minskning med > { "480" }×. Gravimeterns verkliga golv för vitt brus injiceras som en <b>deterministisk sekvens med fast frö</b>, så att matcharen aldrig får brusfri referens men körningen ändå är exakt reproducerbar (verifierat bitidentisk, och stabil inom några meter över brusrealiseringar). Ett test av regressionsklass visar att förfiningen är <em>nödvändig</em> — ett enda grovt rutnät stannar vid ~{ "2" } km, och först förfining i tre steg bryter barriären på { "500" } m. Nytt incheckat scenario <c2/>. Raden <c3/> förblir ärligt <b>partial</b> (fortfarande ingen medföljande EGM2008-karta) med sin evidens uppdaterad till resultatet på 60 min < { "500" } m. Ärligt omfång oförändrat: fält med låg grad av sfäriska harmoniska funktioner + syntetiska mascons; en Monte Carlo över realiseringar av fel i kartrepresentationen är en uppföljning.

seg-4262a99328bb = <b>Register över överdrivna påståenden + regressionsskydd (<c1/>, <c2/>).</b> Avslutar spåret för ärlighet / borttagande av påståenden: de fjorton överdrivna påståenden som en tidigare granskning katalogiserade (<c3/>…<c4/>) är nu alla GREEN — de starka påståendena (<c5/> kopplat Kalman-filter för klocka + position, <c6/> jamming J/S→C/N₀→förlorad låsning, <c7/> fysik för Mach–Zehnder-CAI, <c8/> ARAIM HPL/VPL) är <b>ersatta av levererade, testade förmågor</b> i stället för mjukare formuleringar, och de återstående raderna har fått påståendena borttagna så att de stämmer med koden. Ett nytt CI-test skannar de levande offentliga ytorna (<c9/>, <c10/>, <c11/>, <c12/>) och slår fel om någon utfasad bar fras med överdrivet påstående dyker upp igen utan förbehåll, så att en GREEN rad inte tyst kan regrediera. Måttet "integrity" per körning förblir ärligt märkt <em>filtrets självkonsistens</em> (inte flygintegritet); det verkliga ARAIM HPL/VPL visas separat så att de två aldrig blandas ihop.

seg-27da62a7ff63 = <b>Navigering med gravitationskartmatchning (alt-PNT utan GPS).</b> Nya <c1/> lägger till det alt-PNT-lager som studierna om gravitationskartmatchning inom ESA NAVISP:s <em>Quantum Wayfarer</em> / QT-CCI efterfrågar: en <b>mätmodell för kallatomsgravimeter</b> vars golv för vitt brus härleds ur ASD för CAI-accelerometern (<c2/>); ett <b>gravitationsanomalifält med sfäriska harmoniska funktioner</b> av låg grad och full normalisering (validerat mot de slutna Legendre-funktionerna <c3/>, <c4/>, <c5/> och en handhärledd anomali med en enda term på { "1.897" } mGal) plus syntetiska <b>mascons</b> för de lokala dragen av hög grad; och ett <b>partikelfilter för gravitationskartmatchning</b> (som sätter ihop <c6/> + <c7/>) som återfinner ett GPS-nekat spår ur den anomalisekvens det flyger igenom. En incheckad NAVISP-benchmark (<c8/>) skär ned en fri tröghetsdrift på ~{ "73" } km till några få km. Ärligt omfång: Kshana medföljer <b>inte</b> hela koefficientuppsättningen EGM2008 på { "2190" }° — fältet är av låg grad + mascons, inte en verklig karta med hög upplösning; inläsaren för EGM/EIGEN, magnetkartan, terränghjälpt SLAM och inkopplingen <c9/> i scenariomotorn med ett SVG-driftdiagram återstår som uppföljningar. <c10/> "Gravity-map / alt-PNT navigation" → <b>partial</b>.

seg-d028a2db7837 = <b>Manövermodellering och brohuvud för banutformning.</b> Nya <c1/> lägger till det första lagret för banutformning ovanför SGP4: impulsiva ΔV-noder som tillämpar en hastighetsdiskontinuitet och för en kovarians på { "6" }×{ "6" } framåt (deterministisk bränna ⇒ identitet som tillståndsövergång; kovariansen för genomförandefelet roteras från brännans system — ECI eller LVLH — in i hastighetsblocket), en integrering av finit bränna (konstant dragkraft över en brännbåge med massan som tillstånd) vars uppnådda ΔV kontrolleras mot den slutna <b>Tsiolkovskij</b>-raketekvationen till bättre än { "0.01" } %, en <b>Lambert</b>-lösare enligt <b>Izzo-2015</b> för ett enda varv (<c2/>, <c3/>, flygtid ⇒ <c4/>, <c5/>), en exakt <b>Kepler-propagator</b> med universella variabler (tvåkroppsreferens) och ett <b>porkchop</b>-svep som avbildar ett rutnät av uppskjutningsepok × ankomstepok på avgångens C3 och ankomstens V∞, utskrivet som en 2D-JSON-array för konturrendering i webbläsare. Valideringen är fristående och starkare än en avläsning ur en handledning: varje Lambert-utdata skickas tur och retur genom Kepler-propagatorn (den måste landa tillbaka på <c6/>), och porkchop-minimum kontrolleras mot det analytiska golvet för C3 i en Hohmann-överföring för två koplanära cirkulära banor. Kshana positionerar detta som lagret för prestandasimulering ovanför GMAT/Orekit, inte som en ersättning (grenar med flera varv och en verklig planetefemerid ligger utanför omfånget). Tio tester.

seg-cbdd0e56d89f = <b>Fullständig UKF med 17 tillstånd och tätt kopplad GNSS/INS med dödräkning via kvant-CAI.</b> Nya <c1/> bär hela det tröghetsnavigeringstillstånd som ett tätt kopplat filter skattar — <c2/> ({ "17" } tillstånd) — propagerat genom den strapdown-mekanisering som drivs av den uppmätta specifika kraften och vinkelhastigheten, med rotationen kropp→tröghet <c3/> för små vinklar så att attitydfelet kopplar in i horisontell acceleration (den vanliga lutningskopplingen i INS). Under ett GNSS-avbrott glider det enbart på IMU; processbruset för hastighetens slumpvandring är den härledda <c4/> (<c5/>) för kallatomsinterferometerns accelerometer, så driften vid dödräkning är den som kvantsensorn begränsar — ett avbrott på 120 sekunder förblir begränsat till några hundra meter mot de kilometer som ett fritt INS av navigeringsklass skulle nå. Uppdateringen av pseudoavstånd/avståndshastighet går genom det delade osparfiltret (med α = { "1" } för välkonditionerade vikter vid denna tillståndsstorlek). Fem tester: identitet för mätmodellen, integrering med konstant hastighet med perfekt IMU, stöd från GNSS, skattning av accelerometerbias och benchmarken för avbrott på 120 s begränsat av CAI.

seg-087521bb32b7 = <b>Ärlig inramning av kvantpositioneringen.</b> Den rubrikbeskrivning som gäller är nu <b>"PNT-resiliens-simulator med prestandamodeller för kvantsensorer"</b> genomgående i README:s slogan, citeringsraden, <c1/> (titel + sammanfattning) och bannergrafiken — i stället för den lösare marknadsföringsformuleringen "hybrid kvant/klassisk PNT-simulator". README:s avsnitt <em>What it is / is not</em> får ett uttryckligt omfångspåstående <b>"It is not (yet)"</b> (inte en fysikmotor för atominterferometri från första principer, inte en GNSS-mottagare/PVT-lösare, inte ett verktyg för uppdragsutformning), och en ny <c2/> på toppnivå gör <b>kvantfysiklagret till en P2-punkt</b> (Mach–Zehnder-CAI-fas, projektionsbrus, vibrationstensor) så att läsarna vet att fysiken från första principer är avgränsad och på väg, inte övergiven. Ingen ändring av beteende eller API.

seg-f8fa36190ec7 = Avvägningsstudie för konstellationsutformning: Walker-svep över utformningar med en Pareto-front, JSON med återbesökstid och en validering av Walker-formeln under en kilometer.

seg-31518e92d8cf = <c1/> får <c2/>, som kör ett rutnät <c3/> (till exempel en avvägning på { "3" }×{ "3" }) vid fast inklination och tabellerar, per utformning, täckningsandel, PDOP i värsta fall och största/genomsnittliga gap mellan återbesök; <c4/> flaggar de icke-dominerade utformningarna (färre satelliter, mer täckning, lägre PDOP, kortare återbesök), och <c5/> serialiserar cellerna och Pareto-fronten — inklusive fälten för återbesökstid — som JSON. Ny validering fastlåser generatorn mot Walker-formeln <c6/>: satelliter på samma plats i angränsande plan visas avbildas på varandra genom en exakt rotation <c7/> till <b>under { "1" } km över hela { "24" } h</b> av SGP4-propagering (kortperiodisk J2-andning är gemensamt läge och tar ut sig själv), och platserna i planet bekräftas ligga med avståndet <c8/> i medeltal. Bygger på den incheckade verkliga ögonblicksbilden från Celestrak <c9/> från 2021-07-28 (<c10/>, som används av testerna för scenariotäckning och SP3-tur-och-retur).

seg-71d257587c28 = <b>Avancerad tids- och frekvensöverföring: TWSTFT, GNSS common-view, PPP, optisk, anpassning av potenslag enligt IEEE-1139 och ett klockensemble.</b> Nya <c1/> bygger de operativa överföringsmetoderna ovanpå de levererade slutna formerna för Sagnac/common-view och verktygen för Allan-stabilitet. <c2/> ger Sagnac-korrektionen för Two-Way Satellite Time and Frequency Transfer som slingsumman över tre hopp, exakt lika med BIPM:s slutna form <c3/> (korskontrollerad av den oberoende <c4/>); <c5/> ger en endygnsserie <c6/> och dess TDEV. <c7/> enkeldifferentierar två syntetiska markstationer så att satellitklockan tar ut sig. <c8/> + <c9/> är den jonosfärsfria PPP-kombinationen och lösningen av mottagarklockan mot en (syntetisk) referens av SP3-klass, som tar ut jonosfären av första ordningen exakt. <c10/>, <c11/> och den lognormala <c12/> med enhetsmedelvärde modellerar den turbulensdrivna scintillationen på en optisk fri-rymdslänk. <c13/> är en fullständig anpassning med minsta kvadrat av fem koefficienter <c14/> enligt IEEE-1139 till Allan-variansens kurva (alla fem kanoniska brusprocesser samtidigt) med den dominerande processen rapporterad per τ-decad. <c15/> bildar en pappersbaserad tidsskala med invers-variansviktning vars Allan-deviation faller strikt under den bästa bidragande klockan. { "31" } enhetstester; valideringsmålen är slutna former och syntetisk referens — en inläsning av verklig BIPM Circular-T / IGS SP3 återstår.

seg-c3ab93e7324f = IONEX-jonosfärskartor: filtolkare, interpolation i tid och avbildning med snett obliquitetsmått.

seg-7b94a515ce2b = <c1/> får <c2/>, som läser filformatet IONEX (definition av rutnät i huvudet + block <c3/>) till en sekvens av <c4/> — och normaliserar filens latitudordning från norr till söder till ett <c5/> med positivt steg och skalar värden med <c6/>. <c7/> blandar två på varandra följande kartor till en frågeepok, och <c8/> / <c9/> avbildar den vertikala TEC på en sned stråle via faktorn för tunt enkelskikt <c10/> (<c11/>). Tillsammans med den levererade rutnätsmodellen gör dessa en uppmätt global jonosfärskarta från IGS till en användbar sned fördröjning.

seg-2ed90763cf11 = Konstellationsutformning: dimensionering med streets-of-coverage + jämförelse av flera konstellationer.

seg-326e8957bb10 = <c1/> får <c2/>, en idealiserad lösare för minsta antal satelliter med streets-of-coverage — ur den levererade halvvinkeln för täckning <c3/> och gatans halvbredd <c4/> dimensioneras den nära polära konstellationen för kontinuerlig enkel global täckning som <c5/> plan (till exempel behöver ett plan med 4 satelliter på GPS-höjd { "2" } plan, { "8" } satelliter), och rapporterar <c6/> när satelliterna är för glesa för att bilda en kontinuerlig gata. <c7/> är verktyget för jämförelse av flera konstellationer: det poängsätter varje namngiven Walker-utformning på samma station/fönster via <c8/> och ger deras täckning / PDOP / storlek sida vid sida. Ärligt omfång: den sömexakta korrektionen av Rider vid gränsen mellan motroterande plan och en 3D-täckningsglob återstår som uppföljningar.

seg-90f5ec9ff4ae = Detektion av spoofing i flera lager: paritetsdetektor för RAIM-konsistens + sammanvägning av lager.

seg-a0e4878bea45 = <c1/> får det tredje och sista detektionslagret och sammanvägningssteget: <c2/> anpassar med minsta kvadrat lösningen för position/klocka till en redundant uppsättning pseudoavstånd och testar den kvarvarande viktade kvadratsumman av residualer mot sitt tröskelvärde χ²<c3/> — och flaggar en snedvriden <em>delmängd</em> av satelliter samtidigt som en <em>gemensam</em> bias (som absorberas av mottagarklockan) korrekt lämnas osynlig för RAIM, inte maskerad. <c4/> kombinerar lagren för paritet, AGC och SQM till ett enda viktat beslut som registrerar vilka lager som utlöstes. En Monte Carlo karaktäriserar detektorn: empirisk <b>P_fa ≈ { "0.068" }</b> mot en konstruktionspunkt på { "0.05" }, med <b>missad detektion som faller från { "0.885" } vid en spoofing-bias på 2σ till { "0.16" } vid 8σ</b>. Ärligt omfång: korsvalidering mot specifika publicerade testvektorer för spoofing (Spirent / ION GNSS+) kräver de externa datamängderna och återstår som uppföljning.

seg-2413b3d10f5b = <b>Valideringsensemble för kopplat mot frikopplat Kalman-filter.</b> En Monte Carlo med 100 försök i <c1/> kvantifierar värdet av att bära korskovariansen mellan position och klocka: en trogen inline-baslinje med frikopplat filter (validerad bit för bit mot den levererade <c2/>) bearbetar samma data med korsblocken nollställda, och efter nästan degenererade pseudoavstånd plus en positionsbestämning enbart för klockan återfinner det kopplade filtret positionen till <b>{ "2.97" } m RMS mot det frikopplade filtrets { "48.8" } m, och vinner { "97" } av { "100" } försök</b> — klockbestämningen skärper positionen bara genom den korrelation som det frikopplade paketet kastar bort. Det här fullbordar valideringssviten för Kalman-korrekthet (Joseph-form, PSD-säkerhet, konsistens för NEES/NIS och nu ensemblen för det kopplade filtret).

seg-804f35695553 = <b>Pipeline för banbestämning (batch + sekventiell).</b> Nya <c1/> återfinner en satellits banbestämningstillstånd <c2/> ur avståndsspårning från markstation, och sätter ihop tre levererade delar: kraftmodellen tvåkropps + J2 (<c3/>) och RK4-integratorn (<c4/>) propagerar ett kandidattillstånd över bågen, en mätmodell för avstånd förutsäger varje stationsavstånd, och Gauss–Newton-korrektorn för batch (<c5/>) driver kandidaten till det bäst anpassade tillståndet (<c6/>). Samma dynamik och avståndsmodell driver också en <b>sekventiell</b> rekursiv bestämning på det levererade osparfiltret (<c7/>). Fyra tester validerar den: förutsägelse av avstånd över bågen; <b>återfinnande med batch till under en meter / mm·s⁻¹ ur brusfria avstånd</b>; återfinnande med batch till <b>~{ "2" } m med en residual efter anpassning vid brusgolvet på { "5" } m</b> (signaturen för en konsistent anpassning med minsta kvadrat); och sekventiellt återfinnande inom tiotals meter. Ärligt omfång: mätningar av avståndshastighet/Doppler och vinklar, en analytisk tillståndsövergångsmatris för J2 och maskering av stationens sikt är uppföljningar.

seg-0a81039e510c = <b>Tätt kopplad GNSS/INS UKF-navigator.</b> En ny <c1/> kopplar in den levererade osparkärnan för Kalman (<c2/>) i en fungerande tätt kopplad navigator över det åttatillståndiga <c3/> (ECEF-position/hastighet plus mottagarens klockbias och drift i avståndsenheter). Den tar in de <b>råa satellitmätningarna</b> — <c4/> (<c5/>) och <c6/>/Doppler (<c7/>) — i stället för en förberäknad positionsbestämning, så <c8/> (med <c9/>/<c10/>/ <c11/>) fortsätter korrigera <b>med färre än fyra satelliter</b> och glider genom GNSS-avbrott på sin propagerade dynamik. Fem tester validerar den från början till slut, inklusive acceptansscenarierna i milstolpen: geometrin för pseudoavstånd/Doppler mot handvärden; brusfri konvergens till <b>under en meter</b> med fem satelliter; ett fall med <b>tre satelliter</b> som konvergerar från ~{ "212" } m till ~{ "13" } m där en PVT från ett enda ögonblick inte ens kan bildas; ett <b>avbrott på 120 sekunder</b> med konstant hastighet inom { "50" } m; och — den viktigaste acceptansen — en <b>krökt LEO-passage på 30 minuter</b> (verklig tvåkropps- + J2-bana) med ett <b>GNSS-avbrott på 120 sekunder</b>, hållen till <b>{ "0.77" } m RMS över passagen</b> och <b>{ "2.9" } m i värsta fall genom avbrottet</b>. Den banglidningen sätter ihop den levererade gravitationskraftmodellen (<c12/>) och RK4-integratorn (<c13/>) till UKF:ns processmodell (<c14/>), så att filtret följer banans krökning — vilket en glidning med konstant hastighet inte kan (enbart krökningen är ~{ "58" } km över { "120" } s i LEO). Ärligt omfång: banglidningen använder kraftmodellen tvåkropps + J2 i stället för rå specifik kraft från IMU (för en obemannad orbitalplattform sammanfaller dessa); att lägga in ett feltillstånd för strapdown-IMU och korrektioner av iono/tropo i slingan återstår som uppföljningar.

seg-792f25a4a1da = <b>Mätmodell för kartmatchning (terräng-/gravitationsreferenserad navigering).</b> En ny <c1/> levererar den mätmodell som gör det levererade partikelfiltret med sekventiell viktad omsampling (<c2/>) till en fungerande GPS-nekad navigator: <c3/> (en Gaussisk sannolikhet för fältmatchning) och <c4/>, som samplar vilket georefererat referensfält som helst — terränghöjd (TRN) eller en gravitationsanomali — vid en partikels position och viktar den efter överensstämmelsen med fordonets uppmätta värde. Fältet är vilken sampler <c5/> som helst, så den kan sättas ihop med det bilinjära rutnätet i <c6/> eller en closure. Två tester förankrar den — sannolikheten har sin topp (={ "1" }) vid perfekt matchning och faller till <c7/> vid en sigma, och ett partikelfilter över en särpräglad syntetisk terrängbit återfinner den verkliga positionen till inom { "0.1" }. Ärligt omfång: de verkliga referenskartorna (SRTM-höjd, EGM/EIGEN-gravitationsanomali) och deras inläsare är uppföljningar.

seg-9240e95a5058 = <b>Integritet för PNT i cislunart rymd (ARAIM för månen).</b> En ny <c1/> tillämpar ARAIM-motorn MHSS för jordsidan på en navigeringstjänst för månen i stil med LunaNet med månparametrarna (<c2/> mot GPS { "0.6" } m, <c3/>): månkonstanter, en selenocentrisk bas Öst/Nord/Upp och en hjälpfunktion för himmelsgeometri, samt <c4/> (HPL/VPL). Tre tester förankrar den — den ortonormala selenocentriska basen, geometrin för snett avstånd och den exakt linjära skalningen av skyddsnivån med <c5/> (månens { "30" } m ger en { "50" }× större skyddsnivå än samma geometri vid GPS { "0.6" } m — den kvantitativa orsaken till att integritet för PNT på månen är svår). Ärligt omfång: den precisa efemeriden för LANS NRHO, felbudgeten för signal i rymden och reduktionen av referenssystem MCI↔MCMF är uppföljningar.

seg-4a43e2ff83d7 = <b>Tvådelade (högprecisions) juliska datum.</b> En ny <c1/> lägger till <c2/>, ett julianskt datum delat i ett heltal <c3/> och en bråkdel <c4/> i <c5/> (konventionen i SOFA/hifitime), med <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Skillnader mellan närliggande epoker förblir exakta ned till golvet för <c11/> där ett JD med en enda <c12/> tappar ~{ "50" } µs nära J2000. Fyra tester förankrar den: tur och retur, normalisering av bråkdelen, exakt återfinnande av mikrosekunder (med felet hos enkel <c13/> demonstrerat bredvid) och additiv/reversibel aritmetik med sekunder.

seg-8eef92a85711 = <b>Skrivare för CCSDS OMM (Orbit Mean-Elements Message).</b> En ny <c1/> kompletterar efemeridskrivaren <c2/> med meddelandet om medelelement: <c3/> avbildar SGP4/TLE-medelelement till OMM-enheterna (medelrörelse i varv/dygn, vinklar i grader, plus <c4/>), och <c5/> serialiserar den KVN-form i CCSDS 502.0-B-2 som är på standardspåret — så att en bana från Kshana kan användas av vilket OMM-medvetet verktyg som helst i stället för som en skräddarsydd TLE. Två tester förankrar enhetsomvandlingen TLE→OMM (≈ { "15.5" } varv/dygn, { "51.6" }° inklination med mera) och förekomsten av de obligatoriska KVN-nyckelorden. Ärligt omfång: KVN-formen och avbildningen av TLE levereras här; XML-renderingen (<c6/>) och en tur-och-retur mot en referenstolkare är uppföljningar.

seg-ca2b730b5cc3 = <b>Partikelfilter med sekventiell viktad omsampling.</b> En ny <c1/> lägger till den olinjära, icke-Gaussiska estimatorn bakom kartstödd, GPS-nekad navigering (terrängreferenserad eller gravitationskartmatchning): <c2/> (propagera partiklar genom dynamiken + Gaussiskt processbrus), <c3/> (viktar om efter en sannolikhet för mätning per partikel), systematisk <c4/>, degenereringsmonitorn <c5/> och det viktade medelvärdet som skattning. Sex tester förankrar den deterministiska kärnan exakt — ESS som spänner över { "1" }…N, systematisk omsampling som väljer index i proportion till vikt, den viktade medelvärdets konvexa kombination, en Gaussisk sannolikhet som drar skattningen mot mätningen, beteende för omsampling till likformig fördelning och determinism för predict med fast frö. Ärligt omfång: motorn levereras här; referenskartorna (SRTM-höjd, EGM-gravitationsanomali) och kartans mätmodell är uppföljningar (rutnätssamplern med bilinjär interpolation i <c6/> skulle fungera lika bra för en gravitations-/terrängkarta).

seg-564ad319685e = <b>TEC-jonosfärskartor i IONEX-stil.</b> En ny <c1/> lägger till ett uppmätt jonosfärsalternativ till den utsända Klobuchar-modellen: en <c2/> (ett regelbundet lat/lon-nät av vertikal TEC, en global jonosfärskarta från IGS) med bilinjär interpolation vid genomstickspunkten (<c3/>, avskuren utanför nätet) och förstaordningens fördröjning <c4/> (<c5/>, <c6/>). Fyra tester förankrar den: <c7/> vid L1 med <c8/>-skalningen, nodexakt interpolation, bilinjära mittpunkter som medelvärdesbildar hörnen samt kantavskurna frågor utanför nätet. Ärlig avgränsning: nätet och interpolationen levereras här; tolkning av IONEX-filformatet, tidsinterpolation mellan kartor och snedavbildningsfunktionen är kommande steg.

seg-26c7b53cbc8c = <b>Geometriska korrektioner för tidsöverföring (Sagnac + GNSS common-view).</b> En ny <c1/> lägger till de två deterministiska effekter som en verklig klockjämförelse måste ta hänsyn till, som komplement till den stokastiska tvåvägsmodellen i <c2/>: <c3/> (<c4/>, den fördröjning som den roterande jorden ger — tiotals ns för kontinentala baslinjer) och <c5/>, GNSS common-view-enkeldifferensen som exakt tar bort satellitklockfelet och återskapar förskjutningen mellan stationerna. Tre tester förankrar dem mot exakta referenser: Sagnac-effekten på ≈ { "33" } ns för ett ekvatoriellt kvartsvarv, antisymmetri och de radiella/polära nollfallen samt den exakta upphävningen av satellitklockan. Ärlig avgränsning: en fullständig TWSTFT-budget för transponder- och hårdvarufördröjning samt en jonosfärsfri PPP-lösning för tidsöverföring är kommande steg.

seg-098e7ea0ee13 = <b>Kraftmodell för banor (tvåkroppsproblem + J2).</b> En ny <c1/> lägger till den accelerationsmodell som en numerisk propagator integrerar: <c2/> (<c3/>), <c4/>-störningen från avplattningen (den slutna ECI-formen) och <c5/> som summerar dem — använd den tillsammans med <c6/> som <c7/>. Den ger också de analytiska J2-<b>sekulära hastigheterna</b> (<c8/>): nodregression <c9/>, apsidrotation <c10/> och medelanomalidrift <c11/>. Sex tester förankrar fysiken mot exakta referenser: <c12/> för tvåkroppstermen, den slutna J2-formen vid ekvatorn (~{ "10" }⁻³ av tvåkroppsstorleken), den <b>kritiska inklinationen</b> ({ "63.4349" }°) som fryser perigeum (<c13/>), ISS nodregression (<c14/>) och den österut riktade driften hos en retrograd solsynkron bana. Ärlig avgränsning: endast tvåkroppsproblem + J2; J3–J6, luftmotstånd, SRP och tredjekropp är kommande steg.

seg-d5c03ebc5707 = <b>Delbara permalänkar till scenarier.</b> En ny <c1/> lägger till en beroendefri Base64-kodek enligt RFC { "4648" } (standardalfabetet <c2/> med utfyllnad och ett URL-säkert alfabet <c3/> utan utfyllnad) samt omslagen <c4/> / <c5/>, så att en TOML-fil från lekplatsen kan kodas till en frågeparameter <c6/> och delas som en URL. Exponeras i webbläsaren som wasm-bindningarna <c7/> / <c8/>. Fyra tester förankrar den mot de kanoniska RFC { "4648" }-vektorerna (<c9/> → <c10/> med flera), en URL-säker tur-och-retur för ett scenario (inget <c11/>/<c12/>/<c13/> att escapa), avvisning av ogiltiga symboler samt en tur-och-retur över alla 256 byte. Ärlig avgränsning: kodeken och bindningarna levereras här; användargränssnittet med delningsknappen i lekplatsen, Plotly/D3-diagrammet med flera serier och A/B-jämförelseläget är kommande steg.

seg-b615fb16d547 = <b>Gauss–Newton-batchminstakvadrat (batchens differentialkorrigerare).</b> En ny <c1/> lägger till den skattningskärna som en <em>banbestämning</em> i batch (eller vilken parameteranpassning som helst) vilar på: <c2/> linjäriserar en användarlevererad modell <c3/> med en Jacobian från centrala finita differenser, bildar och löser de viktade normalekvationerna <c4/> (med återanvändning av den testade matrisinversen) och itererar till konvergens med vikter per mätning. Fyra tester förankrar den: en linjär linjeanpassning som når den exakta viktade minstakvadratlösningen, en olinjär <c5/>-anpassning som återskapar de sanna parametrarna, en 3D-avståndsmultilateration som återskapar en känd position från brusfria avstånd (banbestämningsvarianten) samt avvisning av underbestämda eller oförenliga indata. Ärlig avgränsning: detta är den generiska korrigerarmotorn; den banspecifika mätmodellen för avstånd, avståndshastighet och azimut/elevation, den analytiska J2-tillståndsövergångsmatrisen och valideringen mot publicerade fall är kommande steg.

seg-0ada87934135 = <b>Spoofing-monitorer i RF-lagret (AGC-effekt och SQM).</b> En ny <c1/> lägger till två oberoende spoofingdetektorer i mottagarens front-end, som komplement till den klockstödda tidsspoofingmonitorn i <c2/>: en <b>AGC-effektmonitor</b> (<c3/> inkoherent effektsumma + <c4/>) som flaggar den överskottseffekt som en spoofingsändare ger utöver en konfigurerbar dB-marginal, och en <b>signalkvalitetsmonitor</b> (<c5/> triangulär kodautokorrelation + <c6/>) som flaggar den obalans mellan Early- och Late-korrelatorerna som flervägsutbredning, meaconing och replay ger upphov till. Fyra tester förankrar de exakta slutna formerna ({ "3.01" } dB för en effektfördubbling, aggregatet <c7/>, den triangulära <c8/> och larmtröskeln på { "10" } % för Early/Late). Ärlig avgränsning: den fullständiga RAIM-konsistensbaserade paritetsdetektorn för spoofing, flerlagersfusionen av monitorernas utdata och validering mot publicerade spoofingvektorer från Spirent/ION GNSS+ är kommande steg.

seg-b1ff62d88cd2 = <b>Adaptiv numerisk ODE-integrator.</b> En ny <c1/> lägger till den första delen av en <em>numerisk</em> propagator (Kshanas banpropagering är annars analytisk SGP4/SDP4): ett generiskt Runge–Kutta-steg av fjärde ordningen (<c2/>) över vilket förstaordningssystem <c3/> som helst, och en adaptiv drivrutin (<c4/>) som styr det lokala felet genom <b>stegdubbling</b> (Richardson-extrapolation) med den vanliga stegstyrningen <c5/> och logik för att acceptera eller förkasta steg. Sex tester förankrar den mot exakta lösningar: exponentialfunktionen <c6/> till <c7/>, felminskningen på ~{ "16" }× per halverat steg som visar konvergens av fjärde ordningen, energi- och återkomstbevarande hos den harmoniska oscillatorn under en hel period samt den adaptiva drivrutinen som uppfyller en snäv tolerans med variabla steg. Ärlig avgränsning: detta är integratorkärnan och dess felstyrning; de inbäddade Dormand–Prince RK5({ "4" })/RKF7({ "8" })-tabellerna och den hierarkiska kraftmodellen för banor (tvåkroppsproblem + J2–J6 + luftmotstånd + SRP + tredjekropp) som gör den till en <c8/> är kommande steg.

seg-ca53c62839d8 = <b>Unscented (sigma-punkts) Kalman-filter.</b> En ny <c1/> lägger till det skalade unscented Kalman-filtret (Julier & Uhlmann; Wan & van der Merwe) som en allmän skattare med <c2/> tillstånd över användarlevererade process- och mätfunktioner — den sigma-punktsskattare som en tätt kopplad GNSS/INS-navigator använder när pseudoavstånds- och Dopplermodellen är kraftigt olinjär och Jacobianen i ett EKF försämras. Den omfattar den underliggande täta linjära algebran (Cholesky-faktor för sigma-punkternas spridning, Gauss–Jordan-invers för innovationskovariansen) och en Joseph-fri <c3/>-uppdatering. Sex tester fastställer den, där de viktigaste utnyttjar den exakta egenskapen att den unscented transformen för en <em>linjär</em> modell återger Kalman-filtret med numerisk precision (prediktion, uppdatering och en hel cykel av prediktion + uppdatering stäms alla av mot ett för hand körd linjärt KF, plus en 1D-analytisk kontroll av den bayesianska posteriorn och Cholesky-/inversidentiteterna). Ärlig avgränsning: detta är skattarmotorn; den tätt kopplade GNSS/INS-navigatorn med 17 tillstånd, mätmodellen för pseudoavstånd/Doppler och avbrottsvalideringsscenariot är fortfarande kommande steg.

seg-da92d32b5715 = <b>Skyddsnivåer för ARAIM med två konstellationer.</b> En ny <c1/> utvidgar ARAIM (Advanced RAIM) för enkelfel (<c2/>) med det <b>konstellationsomfattande felläget</b> i EU ARAIM / DO-316: vid sidan av hypotesen om felfrihet och hypotesen per satellit bidrar varje konstellation (märkt per satellit) med en hypotes som tar bort alla dess satelliter samtidigt, med apriori <c3/> (en ny <c4/>). Varje hypotes lägger en term till samma MHSS-integritetssumma, så VPL/HPL är de minsta gränser vars totala <c5/> uppfyller budgeten över felfri + enskild SV + fel per konstellation (Bonferroni-fördelningen av falsklarm sker över alla <c6/> hypoteser). Med <c7/> är resultatet bit för bit <c8/>; en användare med en enda konstellation får <c9/> mot sitt eget konstellationsfel (det kan inte uteslutas) — vilket är precis varför täckning med två konstellationer spelar roll. Fyra tester täcker ekvivalensen, vidgningen av skyddsnivåerna, otillgängligheten för en enda konstellation och indatakontrollen, med återanvändning av den befintliga maskineriet för delösningar med lösningsseparation.

seg-d06c5f88282b = <b>IAU { "2006" }-precession (Fukushima–Williams-vinklar och bias-precessionsmatris).</b> En ny <c1/> implementerar IAU { "2006" }-precessionen (P03; Capitaine, Wallace & Chapront { "2003" }): de fyra Fukushima–Williams-vinklarna <c2/> som polynom i TT-julianska sekler (<c3/>) och rotationsmatrisen för bias och precession från GCRS till medelvärdet för datumet, uppbyggd av dem med SOFA-konstruktionen <c4/> (<c5/>, med hjälpfunktionerna <c6/> / <c7/>). Detta är den första delen för tröghetssystem ovanpå den befintliga GMST-baserade reduktionen <c8/>. Åtta tester validerar mot slutna ankarvärden — den genomsnittliga snedställningen vid J2000 <c9/>, de publicerade konstanttermerna för vinklarna, ackumuleringen av den allmänna precessionen <c10/> över ett sekel, matrisens ortonormalitet och <c11/>, det nästan identiska värdet (enbart systembias) vid J2000 samt nettorotationsvinkeln <c12/>/sekel. Ärlig avgränsning (<c13/>): endast precession — IAU 2000A-nutationen med 678 termer, hela kedjan TEME→GCRS och en numerisk korskontroll mot SOFA/ANISE på µas/<{ "10" } m är kommande steg.

seg-14c0a863eef1 = Förstaprincipsfysik för en accelerometer baserad på kalla atomer i interferometer (CAI).

seg-408fc6feb284 = <c1/> modellerar en atominterferometer av Mach–Zehnder-typ med tre pulser utifrån första principer i stället för ett datablad: effektiv vågvektor <c2/>, interferometerfas <c3/>, kvantprojektionsbrus (skottbrus) <c4/>, accelerationskänslighet per skott, kontrastavklingning <c5/> och — själva poängen — <c6/>, som <b>härleder</b> den vita accelerations-PSD som den klassiska <c7/> redan använder från atomantal, avfrågningstid och kontrast. Modellen omfattar nu även <b>vibrationskoppling</b> — den dominerande termen i verkliga enheter: interferometerns överföringsfunktion från acceleration till fas <c8/> (<c9/>), fasvariansen för vit PSD <c10/> (<c11/>, med en numerisk korskontroll via bandintegral <c12/>), den rang-1-projicerade <c13/> längs strålen samt <c14/> / <c15/> (den senare reducerad till det <c16/>-oberoende golvet <c17/>). Elva tester verifierar fysiken för hand (Rb-87 <c18/>, <c19/>, <c20/>/skott som golv för skottbrus mot ett vibrationsgolv på ≈ { "5.9" } µg, <c21/>, <c22/> och skalningslagarna för <c23/>). Ärlig avgränsning i <c24/>: detta täcker golvet för projektionsbrus och det vibrationsbegränsade området ovanför det; laserfasbrus, Coriolis- och ljusskiftssystematik samt valideringsscenarierna PHARAO/CARIOQA är fortfarande kommande steg.

seg-ed668459d019 = <b>Kvant-CAI-accelerometer inkopplad i tröghetsscenariot.</b> En accelerometer i ett tröghetsscenario med dödräkning löses nu upp till en ny <c1/> — <c2/> (den befintliga sensorn med databladskoefficienter) eller <c3/> när den har ett valfritt <c4/>-block (<c5/>: våglängd, pulsavstånd, atomantal, kontrast, cykeltid och en valfri plattforms-<c6/>). En <c7/>-sensors PSD för hastighetsslumpvandring <c8/> <b>härleds</b> ur interferometerfysiken — skottbrusgolvet plus, när en vibrations-PSD anges, det vibrationsbegränsade bidraget kvadratiskt summerat — i stället för en angiven koefficient, och körningens proveniens registrerar att bruset är fysikhärlett. Fältet <c9/> är <c10/>, så befintliga scenarier utelämnar det och serialiseras byte för byte likadant (scenariots hash är oförändrad). Fem tester täcker härledningen, den kvadratiska vibrationssumman, valet mellan <c11/>/<c12/>, hash-stabil serialisering och en CAI-driven körning från början till slut.

seg-c3978a122010 = Optimerare för konstellationsutformning och geometri för täckningsremsor (streets-of-coverage).

seg-aae519e71c00 = <c1/> får <c2/>, en gradientfri nätoptimerare som söker i utformningsrymden <c3/> och returnerar den bästa Walker-utformningen under ett valt <c4/> — <c5/>, <c6/> eller <c7/> — över den redan validerade PDOP-svepningen (ett test bekräftar att den returnerar samma vinnare som brute force). Därtill kommer de analytiska slutna formerna för <b>streets-of-coverage</b>, <c8/> (<c9/>) och <c10/> (<c11/>, Rider/Beste), handverifierade mot läroboksgeometri och med detektering av luckan vid underbefolkning. Den fullständiga Rider-lösaren för minsta antal satelliter vid global täckning, en 3D-glob i lekplatsen och en DOP-korskontroll mot externa verktyg är fortfarande kommande steg.

seg-7b8468636dea = <b>Export av SP3-precisionsefemerid från CLI.</b> Ett propagerat bane- eller konstellationsscenario kan nu skrivas till en SP3-c-fil: <c1/>, eller <c2/> i scenariot skriver automatiskt <c3/> (<c4/> / <c5/>, <c6/>, valfri <c7/>). Ett tur-och-retur-test (<c8/>) propagerar den verkliga ögonblicksbilden <c9/> från Celestrak, exporterar den, läser in den på nytt och bekräftar att de återskapade ECEF-positionerna stämmer med SGP4-referensen över { "24" } h till <b>< { "0.5" } m</b> (väl inom toleransen på { "10" } m för TLE-klass). README beskriver samverkansrollen (RINEX → RTKLIB/gLAB, SP3 → Ginan/produkter för precisionsbanor).

seg-56c729ba110f = Kopplat Kalman-filter för klocka och position (kovarians mellan block).

seg-0a424875131d = <c1/> är ett enda staplat <c2/>-filter (uppdateringar i Joseph-form) vars <b>pseudoavstånds</b>mätning <c3/> verkligen kopplar ihop position- och klockblocken — till skillnad från det äldre fusionspaketets två oberoende tvåtillståndsfilter, som håller kovariansen mellan blocken exakt noll. Validerat: ett gemensamt pseudoavstånd gör <c4/> skilt från noll; två olika geometrier löser gemensamt ut inlagda position- och klockförskjutningar som ett enskilt avstånd inte kan skilja åt; en <b>positionsbestämning enbart för klockan skärper positionen</b> via korskovariansen (den vinst som frikopplade filter inte kan ge); och NEES enligt Monte Carlo är <b>χ²({ "4" })-konsistent</b>. Detta är realiseringen med 1-DOF (fusionspaketets dimensionalitet); den 3D-baserade utvidgningen med 8 tillstånd och kopplingen in i det körbara paketet spåras som kommande steg.

seg-3983794a9584 = <b>Hälsoövervakning av Kalman-filtrets konsistens (NIS/NEES).</b> Kovariansuppdateringen i tvåtillståndsklockfiltret sker nu i <b>Josephs stabiliserade form</b> `P⁺ = (I−KH)P(I−KH)ᵀ

seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, kontrollerad mot tabell).

seg-f9689061a1d2 = <b><c1/> — en enda citerbar proveniensstabell.</b> Samlar varje sensorparameter (klockor, tröghet, tidsöverföring), fysikalisk och algoritmisk modell (bana, tidssystem, referenssystem, jono/tropo, integritet, detektering, jamming, Allan) och valideringsdatamängd (AIAA 2006-6753, Celestrak <c2/>) med dess publicerade källa — datablad, artikel, ICD eller standard — och en ärlig mognadsetikett (flygkvalificerad / markladdad / rymdmål på markhårdvara). Länkad från README-introduktionen och dokumentationstabellen; kompletterar de <c3/>-strängar per körning som redan följer med i resultat-JSON.

seg-55c7b52b5fdb = <b>Typat scenario-API.</b> Dispatch sker nu på en typad enum <c1/> i stället för en rå strängmatchning på <c2/> (<c3/> + uttömmande dispatch), så att tillägg av ett paket kontrolleras vid kompilering. Nya typade gränssnitt vid sidan av det oförändrade <c4/> som returnerar en sträng: <c5/> med en strukturerad felklassificering (<c6/> / <c7/> / <c8/> / <c9/>, var och en med en stabil <c10/>); ett <c11/>-trait och en <c12/>-utvidgningspunkt (paketet <c13/> är kopplat genom den som arbetsexempel); samt introspektionen <c14/> (namn, beskrivning, obligatoriska och valfria fält per slag). Python- och WebAssembly-bindningarna får <c15/> och <c16/>. Dokumenterat i <c17/>.

seg-2b86391b753e = Verklig GPS-konstellation + täckning av driftområdet.

seg-288f2b1872c8 = <c1/> levererar nu en <b>verklig ögonblicksbild <c2/> från Celestrak</b> (2021-07-28, { "30" } satelliter) i stället för syntetiska Walker-TLE:er, med <c3/> så att den bara läses in när varje TLE-kontrollsumma är giltig; <c4/> dokumenterar reproducerbar uppdatering och README anger öppna data som källa. Nya <c5/> prövar varje paket över ≥{ "5" } varianter av driftområdet och kontrollerar att utdata är ändliga och begränsade, bekräftar att <b>flicker-FM-golvet mätbart försämrar en klockas frigång</b> när det är aktiverat (nu satt i tre levererade scenarier) och bekräftar att <b>fusionsfiltret konvergerar med en realistisk accelerometerbias som inte är noll</b> (inom { "3" }× av fallet med nollställd bias), vilket stänger realismluckan "fusion fungerar bara med nollställda biaser". <c6/> får en tabell över driftområdet.

seg-f78d7dce7bfa = <b>GNSS-simulering i mätdomänen (slaget <c1/>).</b> En framåtmodell på pseudoavståndsnivå: för varje synlig satellit syntetiserar den <c2/> och L1-Doppler, med <b>Klobuchar</b>-jonosfären för en frekvens (IS-GPS-200 §{ "20.3.3.5.2.5" }) och <b>Saastamoinen</b>-zenittroposfären projicerad med avbildningsfunktionen <b>Niell ({ "1996" })</b> — exponerade som TOML-blocken <c3/> och <c4/>. Residualerna matas in i snapshot-RAIM för HPL/VPL per epok, och en JSON-array <c5/> bär varje SV:s pseudoavstånd, Doppler, C/N₀ och jono-/tropokorrektioner. En körning utan brus återskapar geometri + korrektioner till under en millimeter (CI-test). Nya <c6/> och <c7/>.

seg-833249802c56 = <b>Stokastisk detektor för tidsspoofing (slaget <c1/>).</b> Spoofingpaketet kör nu en verklig detektor i stället för en deterministisk jämförelse av ramp mot gräns: fyra injektionsformer (<c2/>, <c3/>, <c4/>, <c5/>), ett tvåsidigt χ²₁-energitest / Neyman–Pearson-test på den klockstödda monitorstatistiken med tröskeln satt utifrån en målbudget för falsklarm <c6/>, och sannolikheten för missad detektering <c7/> redovisad både på sluten form och med Monte Carlo (<c8/> försök per hypotes — de två stämmer överens inom några ×1/√N). Kvalitetsmåttet Säkerhet är nu <c9/> vid den operativt skadliga (specificerade) storleken. Nya <c10/> (gaussiska svansfunktioner, NP-/energitest, Monte Carlo P_fa/P_md) och <c11/>. Bakåtkompatibelt: ett ensamt <c12/> godtas fortfarande som en linjär ramp.

seg-b3f3d2ca8a3d = <b>Definition av kvalitetsmåttet Säkerhet (slaget <c1/>):</b> från den analytiska detekterbarhetsgränsen <c2/> till den stokastiska detektorns <c3/>. Klockpaketets fält <c4/> är fortfarande den snabbare analytiska ersättaren.

seg-ee1268975b2c = Tillagt (fortsättning)

seg-f71696b7fa20 = <b>RF-jammingmodell (slaget <c1/>).</b> En länkbudgetmodell för störning som omvandlar en jammers effekt och geometri till förlorad låsning per satellit: jammer-till-signal-förhållandet utifrån fritt-rums-väglust och mottagarantennens förstärkning i varje riktning, den effektiva C/N₀ via den vanliga anti-jam-ekvationen (avspridningens processgain × den spektrala separationsfaktorn <c2/>; Kaplan & Hegarty §{ "9.4" }) och en konfigurerbar spårningströskel, poängsatt över en Walker-konstellation som kvalitetsmåttet <c3/>. Nya <c4/> och <c5/>. Den ärliga avgränsningen (ingen flervägsutbredning, terrängskuggning, AGC eller adaptiv nollning) dokumenteras i <c6/> / <c7/>.

seg-d4dc36011ea1 = <b>Generisk N-dimensionell parametersvepning över vilket scenarioslag som helst (<c1/>).</b> Den tidigare N-dimensionella svepningen gällde bara klockpaketet. <c2/> varierar punktade TOML-nycklar i ett <c3/>-scenario över den kartesiska produkten av dess axlar, skickar om varje nod i nätet genom den normala körvägen och läser ut ett eller flera mått ur resultatet via punktade JSON-sökvägar — så att det fungerar för varje paket (tröghet, gnss-ins, integritet, spoofing, …) utan koppling till varje pakets Rust-typ. Noderna i nätet utvärderas parallellt över OS-trådar på inhemska mål (inget tillagt beroende); wasm faller tillbaka på sekventiell körning. Deterministisk och radvis oberoende av antalet trådar. Nytt exempel <c4/>.

seg-1c42e15d65a9 = <b>TOML-konfigurerbar deterministisk IMU-felmodell i paketet <c1/>.</b> Den treaxliga felkedjan för strapdown (skalfaktor, felinriktning, g-känslighet, kvantisering, hastighetsramp; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) kan nu nås per sensor från en scenariofil via ett valfritt <c2/>-block, lagt ovanpå de konstanta tillslagsbiaserna. Om blocket utelämnas förblir varje sensor en ren källa med konstant bias, så att befintliga <c3/>-körningar är oförändrade. Detta kopplar in den tidigare enbart biblioteksbaserade felmodellen i ett körbart paket och ett kvalitetsmått.

seg-e035371fbe58 = <b>Validering mot verkliga data.</b> Den multi-GNSS-baserade tolkaren för RINEX-navigation, GLONASS RK4-propagatorn och SP3-läsaren prövas nu mot äkta IGS/DLR-filer (en verklig blandad RINEX { "3" }-sändningsnavigationsfil och en IGS SP3-c-banprodukt), inte bara mot egenskrivna exempel — med kontroll av att satellitmängderna inte är tomma och att ECEF-positionerna är ändliga och fysiskt rimligt stora. Testfilerna används bara vid test (undantagna från det publicerade paketet); se <c1/>.

seg-2a807ae8e194 = <b>RAIM på verklig geometri från referensbanor.</b> Kärnorna för snapshot, lösningsseparation (MHSS) och ARAIM-skyddsnivåer är nu validerade mot verklig geometri från IGS precisionsbanor (SP3), inte enbart mot syntetiska konstellationer: siktlinjegeometrin byggs från den första SP3-epoken vid en verklig markstation, och testerna kontrollerar skyddsnivåer på meternivå som är tillgängliga för APV-I, att ett pseudoavståndsbias på { "60" } m utlöser χ²-monitorn, att lösningsseparationen <b>identifierar</b> den felaktiga satelliten och att ARAIM:s nivåer uppfyller den tilldelade <c1/>. Detta stänger luckan att enbart vara validerad på syntetisk geometri (gLAB-paritet i mottagardomänen över en hel RINEX-båge återstår som en punkt på färdplanen — den kräver en pseudoavståndslösning).

seg-651cc4af4872 = <b>Konfidensintervall per nod för den N-dimensionella parametersvepningen</b> (<c1/>). Varje nod i nätet för den N-dimensionella svepningen över kartesisk produkt kan nu utvärderas som en Monte Carlo-ensemble av frön, med mätvärdets medelvärde, percentiler och ett percentil-bootstrap-KI på { "95" }% per nod (för båda klockorna) — en statistiskt ärlig svepning i stället för ett enda dragning per nod. Återanvänder maskineriet för ensemble och bootstrap (<c2/>); deterministisk; <c3/> reduceras exakt till den enkla <c4/> med ett frö. (Att generalisera svepningen över alla paket, vilket hänger ihop med omstruktureringen till typade scenarier, och parallell körning återstår.)

seg-815eda56aad9 = <b>Korsvalidering av IMU-brusflödet mot NaveGo</b> (<c1/>). En extern korskontroll mot NaveGo (R. Gonzalez öppna verktygslåda för INS/GNSS): återskapar den syntetiska tur-och-retur-körningen i <c2/> på dess publicerade referensprofil Microstrain 3DM-GX3-35 och bekräftar att vår överlappande ADEV-skattare återskapar NaveGos koefficienter för hastighets- och vinkelslumpvandring (<c3/>) med under { "5" }% avvikelse och den väntade vita-brus-lutningen −1/2. (Den inspelade STIM300-loggen <c4/> på { "40" } MB läses inte in — den är spärrad av ett binärt format.)

seg-b67b3ec240de = Tätt kopplad GNSS/INS-uppdatering (pseudoavstånd).

seg-c926dddc5256 = <c1/> (och omslaget <c2/>) implementerar den tidigare stubbade mätningen i avståndsdomänen: innovationen är det predikterade avståndet från INS-positionen till varje satellit jämfört med det uppmätta pseudoavståndet, med en Jacobian längs siktlinjen på positionsfelet. Eftersom varje satellit är en skalär mätning fortsätter filtret att korrigera med <b>färre än fyra satelliter</b> — där en löst kopplad PVT-positionsbestämning inte finns. Fem tester täcker nollställning med fyra satelliter, korrektion med två satelliter (ingen PVT möjlig), observerbarhet längs siktlinjen med en enda satellit och indatakontroll. Endast pseudoavstånd; bärvågsfas och ett uttryckligt tillstånd för mottagarklockan återstår på färdplanen. Den oanvända cargo-funktionen <c3/> (som spärrade den gamla felstubben) har tagits bort.

seg-94ebfac3bbc3 = <b>Scenariopaket för löst kopplad GNSS/INS (<c1/>, <c2/>).</b> Kopplar in den treaxliga strapdown-navigatorn och felstatus-EKF med 15 tillstånd (<c3/> / <c4/>) i ett körbart scenario med ett kvalitetsmått — EKF disciplinerar mekaniseringen mot brusiga GNSS-positionsbestämningar medan täckningen finns och glider sedan genom avbrottet, och ersätter det äldre skalära 1-DOF-paketets nollställning som snäpper till referensen med verklig fusion. Resultatet redovisar den fusionerade serien för horisontellt fel, det poängsatta positionskvalitetsmåttet (tillgänglighet / RMS under avbrott / holdover) och RMS för den öppna slingans fria INS som jämförelse; ett kvant-/klassiskt IMU-par skiljer sig endast i verklig bias. Skickas från CLI/Python/wasm-ingången med ett exempel <c5/>. Ärlig inramning: endast löst kopplad, en deterministisk bana, och det fusionerade felet under avbrott är golvbegränsat av överlämningens attitydfel (så det påstås inte skala med bias) — de robusta slutsatserna är att fusion slår oassisterad dödräkning för en sensor med bias och att en sensor med lägre bias har den bättre oassisterade frigången.

seg-0a2df01f99d8 = <b>Konstellationsutformning på den validerade SGP4-kärnan (<c1/>).</b> En ny modul <c2/> ger ett utformat Walker-delta-mönster (<c3/>) som SGP4-<b>medelelement</b>, så att den syntetiska konstellationen propageras genom samma SGP4-väg som validerats till { "4.12" } mm mot AIAA 2006-6753-vektorerna — inte den analytiska Kepler-generatorn. Ovanpå den: <c4/> tabellerar täckning och median/sämsta PDOP över ett utformningsnät <c5/>, och <c6/> redovisar täckningsandelen och luckorna mellan överflygningar (sämsta/medel) vid en punkt på marken. Validerad mot de fysikaliska monotonicitetsvillkor som en avvägning måste följa (fler satelliter ⇒ högre täckning, lägre PDOP, kortare återbesökstid). Separat läggs en äkta <b>TLE-ögonblicksbild <c7/> från Celestrak</b> (2021-07-28, { "30" } operativa GPS-satelliter) till som en fixtur endast för test, och vägen från verklig TLE → SGP4 → ECEF-geometri valideras mot den (hela MEO-skalet inom { "1" }%, nio satelliter alla i sikte vid PDOP { "1.64" }), vid sidan av de befintliga verkliga dataväggarna för SP3 och RINEX.

seg-9e051f3725df = Brustypsspecifika effektiva frihetsgrader för Allan-konfidensintervallen.

seg-2392bec8f0b6 = <c1/> implementerar de slutna formerna i NIST SP { "1065" } tabell { "5" } (den enkla uppsättningen i Stable32) för alla fem kanoniska potenslagsbrustyper — vitt/flicker-PM, vitt/flicker-FM, slumpvandrings-FM — och ersätter det konservativa icke-överlappande antalet som χ²-frihetsgrader. En ny enum <c2/> och <c3/> identifierar den dominerande typen utifrån lutningen hos den <b>modifierade</b> Allan-deviationen i registret (MDEV skiljer vitt från flicker-PM där ADEV inte kan), och <c4/> kopplar nu den identifierade brustypen, dess edf och ett konfidensband på { "95" }% till varje punkt i den exporterade ADEV-kurvan (<c5/> får <c6/>/<c7/>/<c8/>/<c9/>, additivt med serde-standardvärden). Validerat på två sätt: de fem formlerna stämmer med handutvärderade värden till { "1e-12" }, och en Monte Carlo-ensemble med { "4" } 000 poster med vitt FM bekräftar att formeln förutsäger skattarens faktiska kvadratiska edf inom { "20" }% (och att den klart slår det konservativa antalet). Åtta nya tester.

seg-df59cc71120f = Stokastisk modell för tidsöverföring i två riktningar.

seg-d2add1ce01e1 = <c1/> ersätter samplaren med enbart vitt brus med en fysikaliskt grundad modell: den reciproka (gemensamma) vägfördröjningen upphävs i skattningen <c2/> (<c3/>, så att två oberoende envägsmätningar medelvärdesbildas till <c4/>), och residualen är den <b>icke-reciproka</b> differentialfördröjningen — modellerad som en färgad process av vitt FM + slumpvandrings-FM (den validerade <c5/>), vilket ger synkroniseringsfelserien en realistisk Allan-signatur (<c6/>) i stället för plant vitt brus. <c7/> får <c8/>/<c9/> (serde-standardvärde { "0" } ⇒ det äldre beteendet med enbart vitt brus, bit för bit), länkens kvalitetsmått redovisar <c10/> (modellens Allan-deviation vid grundsteget), och scenariot <c11/> samt CLI-gränssnittet exponerar dem. Golden-kvalitetsmåttet har fastlagts på nytt. Sex handhärledda tester (upphävning av gemensam mod, tvåvägsvinsten sqrt({ "2" }), RWFM-lagen <c12/> via länkens egen <c13/>, ekvivalens med det äldre beteendet vid <c14/>, determinism och exponering av kvalitetsmåttet från början till slut).

seg-6c7a1dd63be0 = Numerisk paritet med Stable32 för Allan-familjens skattare (NBS14).

seg-adbb47ca87b4 = <c1/> validerar de överlappande skattarna ADEV, modifierad ADEV, tidsdeviation och överlappande Hadamard mot Stable32-referensdeviationerna för den kanoniska datamängden <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~s. 107) vid tau = { "1" }, { "2" } till en relativ tolerans på { "1e-4" } — faktisk överensstämmelse ~{ "1e-6" }. Detta fäster skattarnas matematik mot den de facto-ledande referensimplementeringen, inte bara mot skattarnas egen analytiska självkonsistens. Endast de publika referenstalen används; ingen tredjepartskod.

seg-35b0c0644fa2 = <b>Vertikalt Stanford-integritetsdiagram exporterat av scenariot <c1/>.</b> Det körbara scenarioslaget <c2/> exporterar nu ett vertikalt Stanford(-ESA)-diagram vid sidan av tillgänglighetskartan för HPL/VPL: vid varje skyddad epok avbildas en fröstyrd, reproducerbar dragning av avståndsfel utan fel genom geometrin till ett faktiskt vertikalt positionsfel och klassificeras mot VPL och den vertikala larmgränsen (Available / System-Unavailable / Misleading / Hazardously-Misleading). Diagrammet (punkter per epok + antal per område) bärs i resultat-JSON och antalet integritetshändelser och HMI i CLI-sammanfattningen, så att Stanford-klassificeraren — tidigare enbart i biblioteket — kan nås från början till slut. <c3/> får ett fält <c4/> (standardvärde { "0" }) som styr felrealiseringen; själva tillgänglighetskartan förblir enbart geometribaserad och oberoende av frö.

seg-5d76a638ae77 = Integritetsrisk (P_HMI) för ARAIM som budget för skyddsnivåerna.

seg-449adb9ad6e6 = <c1/> härleder de horisontella och vertikala skyddsnivåerna ur en uttrycklig integritetsriskbudget i stället för en fast <c2/>-multiplikator: för lösningen med alla satelliter i sikte och varje delösning där en enskild satellit utesluts bygger den <c3/> per läge på varje axel, och därefter löser <c4/> ut den minsta PL vars summerade sannolikhet för farligt vilseledande information (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) uppfyller den tilldelade <c7/>. Resultatet redovisar den integritetsrisk som nivåerna faktiskt uppnår, så att en användare uttryckligen kan avväga integritet mot larmgränsen. Sex handhärledda tester (slutna former för felfritt läge och tröskelsatt enskilt läge, summering och monotonicitet över flera lägen, felfritt skydd från början till slut där en 10⁵× snävare budget höjer PL, felupptäckt och felidentifiering samt redundansgolvet för sex satelliter). MHSS för enkelfel är ARAIM:s baslinje; samtidiga fel i flera SV-delmängder, det konstellationsomfattande felläget och validering mot gLAB:s referensdatamängd är dokumenterade utvidgningar.

seg-3e33581644a5 = Tvåhastighets-kompensation för coning/sculling för strapdown-mekaniseringen.

seg-c900e193ac29 = <c1/> viker bort de högfrekventa termerna för coning (attityd) och rotation + sculling (hastighet) ur de ordnade IMU-inkrementen i delintervallen för en grov uppdatering, så att en <c2/> med måttlig frekvens återger vibrationsrektifierad rörelse som ett grovt steg över de råa summorna missar. Ett valideringstest driver en miljö med coning + sculling på { "10" } Hz i { "60" } s och jämför referens med fin frekvens, naiv grov integrering och grov integrering med vikningen: vikningen minskar positionsfelet med ~{ "18" }× (från meter av naiv drift till under en decimeter), vilket bekräftar att termerna för coning/sculling är bärande. Ett typalias <c3/> ger den äldre modellen <c4/> med 1-DOF sitt rätta namn, skilt från den treaxliga navigatorn <c5/>.

seg-ceb037e7a6ea = <b>Tolkare för RINEX-observationsfiler.</b> Den nya modulen <c1/> läser RINEX 3.0x / { "4.00" }-<em>observationsfilen</em> — mottagarens faktiska mätningar — och fullbordar RINEX-paret vid sidan av den befintliga tolkaren för navigationsmeddelanden. <c2/> avkodar huvudet (version/typ, listorna <c3/> per system med fortsättningsrader, ungefärlig position, intervall, tid för första observationen) och varje epoks poster per satellit: pseudoavstånd, bärvågsfas, Doppler och signalstyrka, nycklade efter sin RINEX { "3" }-observationskod (<c4/>, <c5/>, …) med flaggorna för förlorad låsning (LLI) och signalstyrka (SSI), där ett tomt fält bevaras som saknat i stället för som noll. Ärlig avgränsning: detta är <em>inläsningen</em> av standardformatet (en verklig observationslogg från RTKLIB/gLAB/IGS-station in, typade mätningar ut), inte en positioneringsmotor — ingen pseudoavståndslösning, PPP eller RTK här.

seg-60efb0c44522 = <b>Skrivare för CCSDS OEM (Orbit Ephemeris Message).</b> Den nya modulen <c1/> exporterar en propagerad konstellation som ett giltigt CCSDS 502.0-B OEM { "2.0" }-meddelande — det KVN-efemeridformat som GMAT, Orekit, STK och de flesta verktyg för flygdynamik läser in. <c2/> samplar varje satellits tröghetstillstånd (TEME) — position <b>och</b> hastighet, hämtade direkt från propagatorn utan jordfast rotation, till skillnad från SP3-exporten — på ett tidsnät, och <c3/> serialiserar huvudet <c4/>/<c5/>/ <c6/> plus ett <c7/>-segment per satellit (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>) följt av dess <c15/>-rader (km, km/s). <c16/> anges av anroparen, aldrig från väggklockan, så att utdata är byte för byte identiska mellan körningar (reproducerbarhetskontraktet). Detta är motsvarigheten för rymdfarkostefemerider till GNSS-exporten av SP3: en Kshana-bana kan nu lämnas över till ett verktyg för flygdynamik i ett standardformat.

seg-f8538db4a17c = SP3-precisionsefemerid som propagationskälla.

seg-2cf2e224deb9 = <c1/> bygger en <c2/> per satellit som fyller i positionen mellan de tabellerade SP3-epokerna med ett Lagrange-polynom av 9:e ordningen (vedertagen IGS-praxis) och roterar den till det gemensamma TEME-systemet, exponerad som <c3/>. En precisionsbanefil från IGS eller ett analyscentrum kan nu driva samma kedja för geometri, sikt och integritet som de utsända och analytiska propagatorerna. Validerad tur-och-retur: en Kepler-bana skriven till SP3 och inläst på nytt via interpolatorn stämmer med originalet till under en meter i noderna och < { "100" } m mitt i intervallen. Interpolation av klockan kommer härnäst.

seg-8d50fd42f53c = <b>GLONASS utsända efemerid (fullbordar multi-GNSS RINEX-navigation).</b> Ny modul <c1/>: GLONASS sänder inte Kepler-element utan en jordfast <b>tillståndsvektor</b> i PZ-90 (position, hastighet, sol-måne-acceleration). <c2/> läser RINEX { "3" }-posterna <c3/>, och satellitens position vid valfri tidpunkt fås genom <b>Runge–Kutta-integrering av 4:e ordningen</b> av rörelseekvationerna i GLONASS ICD (central gravitation + <c4/> + Coriolis- och centrifugaltermer från jordrotationen + den utsända accelerationen). Exponerad som <c5/>, så att GLONASS-satelliter går genom kedjan för konstellation, sikt och integritet vid sidan av Kepler-systemen; ett enda konstellationsblock <c6/> kan nu blanda GPS, Galileo, QZSS, BeiDou och GLONASS.

seg-8d88144e3726 = <b>Multi-GNSS RINEX-navigation (GPS, Galileo, QZSS, BeiDou).</b> Tolkaren för RINEX { "3" }-navigation avkodar nu poster för Galileo (<c1/>), QZSS (<c2/>) och BeiDou (<c3/>, MEO/IGSO) vid sidan av GPS (<c4/>) — de delar Kepler-layout och användaralgoritm — var och en utvärderad med sin egen gravitationskonstant och jordrotationshastighet (μ för Galileo/BeiDou, Ω̇ₑ för BeiDou). En fil med blandade konstellationer ger alla dem, som går genom kedjan för konstellation, sikt och integritet som <c5/>. Geostationära BeiDou-satelliter använder en annan koordinatrotation och hoppas över i väntan på en referensfixtur att validera mot. Postgenomgången använder radantal per system, vilket rättar ett latent fel där fyraradiga GLONASS/SBAS-poster hoppades över som om de var åtta rader långa. GLONASS (en modell med tillståndsvektor) kommer härnäst.

seg-91a6907acc8d = <b>Läsare och skrivare för SP3-c/d-precisionsefemerid.</b> Den nya modulen <c1/> tolkar SP3-precisionsbanefiler från IGS/analyscentrum (<c2/>) — den efterbearbetade ECEF-produkten för position och klocka som PPP-motorer (Ginan, RTKLIB, gLAB) behandlar som referens — till en strukturerad <c3/> (huvud, epoknät, position per satellit km→m, klocka µs och hastighet dm/s→m/s för <c4/>-produkter), med SP3:s sentineller för felaktiga värden bevarade. Den omvända riktningen täcks också: <c5/> bygger en SP3 av en propagerad konstellation (TEME→ECEF per epok) och <c6/> serialiserar den, så att Kshana-banor kan exporteras i det format som externa PPP-verktyg läser in — tur-och-retur mellan läsning och skrivning. Epokinterpolation och en SP3-propagatorkälla kommer härnäst.

seg-7d51d1b6f39f = <b>Utsänd RINEX-efemerid som körbar konstellationskälla.</b> En konstellation godtar nu ett inbäddat <c1/>-block (RINEX { "3" }-navigationstext för GPS) vid sidan av det befintliga alternativet <c2/>, så att en verklig utsänd fil driver ett scenario från början till slut från CLI, Python eller lekplatsen i webbläsaren — RINEX in, PNT-geometri ut. Nytt <c3/> visar GNSS-tillgänglighet och DOP från åtta GPS-satelliter byggda direkt av utsända poster. (Endast GPS LNAV; multi-GNSS och SP3 kommer härnäst.)

seg-9730835bfc64 = <b>Utsänd RINEX-efemerid som propagationskälla.</b> En tolkad <c1/> konverteras nu till en <c2/> (<c3/>): positionen är IS-GPS-200:s utsända bana roterad från ECEF till det gemensamma tröghetssystemet TEME (<c4/>, med skottsekundskorrekt tid från GPS till UT1), hastigheten fås genom central finit differens, och Kepler-omloppstiden. Verkliga utsända GPS-data kan nu driva samma kedja för geometri, sikt och integritet (RAIM) som de analytiska propagatorerna SGP4/Kepler. (Ännu inte exponerad som ett scenarioslag för RINEX-filer — det och multi-GNSS/SP3 kommer härnäst.)

seg-a355e3e52ec3 = <b>Arkivbeständig DOI.</b> Utgåvor deponeras nu i Zenodo och tilldelas en citerbar DOI.

seg-c6e4556e1ce5 = <b>Dokumentation.</b> README har uppdaterats till institutionell standard: en översikt över förmågorna i hela stacken { "v0.9.0" }, ett avsnitt om versionshantering och utgåvor, ett rent huvud med den nya märkningen och en kortfattad statusrad. Inga ändringar i motorn.

seg-1bfc4e965d2b = Den här utgåvan lägger till tre omfattande förmågeområden ovanpå SGP4-underlaget i { "0.8.0" }: en äkta treaxlig strapdown-INS, ett löst kopplat felstatus-EKF för GNSS/INS med sluten återkoppling, verklig RAIM med snapshot och lösningsseparation (ARAIM-stil) med HPL/VPL och ett körbart scenario <c1/>, samt det första steget mot samverkan mellan GNSS-format (inläsning av RINEX-3-efemerider för GPS).

seg-7fa2f68d436a = <b>Tolkare för RINEX { "3" }-navigationsmeddelanden för GPS (<c1/>).</b> Första steget mot samverkan mellan GNSS-format: <c2/> läser en RINEX { "3" }.x-navigationsfil och avkodar varje GPS-post (<c3/>) med utsänd efemerid — det åtta rader långa blocket SV/epok + <c4/> — till en <c5/> med Kepler-element och klockkorrektioner, med fältnamn och enheter enligt IS-GPS-200. Hanterar Fortran-flyttalsformatet med <c6/>-exponent (<c7/>) och kolumnlayout med fast bredd; poster för system som inte är GPS hoppas över, inte avvisas, så att en blandad fil fortfarande ger sina GPS-efemerider. Fyra tester: tolkning av <c8/>-exponent (inklusive tomma fält och fel), en hel post avkodad mot kända fältvärden med en rimlighetskontroll av GPS halva storaxel (√A² ≈ { "26 560" } km), överhoppning av system som inte är GPS och fallet med tom fil.

seg-9c4a068f204c = GPS utsänd efemerid → ECEF-position (<c1/>).

seg-5deeec4b8cc9 = <c1/> utvärderar satellitens jordfasta position ur den tolkade efemeriden via användaralgoritmen i IS-GPS-200 §{ "20.3.3.4.3.1" }: Newtons lösning av Keplers ekvation för den excentriska anomalin, korrektionerna av andra övertonen för latitudargument, radie och inklination samt rotationen till ECEF med hänsyn till jordrotationen sedan referensepoken (med GPS-värdena <c2/> och <c3/> som specifikationen föreskriver, och en vikning av veckoskifte <c4/>). Tre tester: det geocentriska avståndet håller sig i GPS-bandet (≈ { "26 560" } km), den jordfasta farten är ~{ "3.9" } km/s, och utvärdering en hel vecka bort återger samma position.

seg-583433389a70 = GPS SV-klockbias med den relativistiska korrektionen (<c1/>).

seg-957588ed5dff = <c1/> utvärderar den utsända klockpolynomet <c2/> kring <c3/> plus den relativistiska excentricitetstermen <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). En ny <c5/> omvandlar postens kalenderepok till GPS-veckotid via julianska dagar räknade från GPS-epoken (1980-01-06), och Kepler-lösningen delas med positionsutvärderingen. Tester: GPS-veckotid för en söndag/tisdag/lördag (veckogränser) och att klockbiasen domineras av af0 med en närvarande, begränsad relativistisk term. Grupplatensen <c6/> för L1 exponeras men räknas medvetet inte in. Ärlig avgränsning: en <c7/>-källa, Galileo/BeiDou/GLONASS och SP3 återstår som nästa steg. (<c8/> uppdaterad så att den stämmer.)

seg-ef971feff16c = <b>Användarkörbart scenarioslag <c1/> (<c2/>).</b> Förmågan för RAIM-tillgänglighet kan nu nås från CLI/TOML som varje annat paket: <c3/> tolkar ett <c4/> (användarbana, en eller flera GNSS-konstellationer, elevationsmask och integritetskonfigurationen <c5/>), kör <c6/> och ger tillgänglighetskartan för HPL/VPL per epok som JSON plus en fristående SVG — skyddsnivåer över tid mot larmgränserna, med en grön/röd tillgänglighetsremsa. <c7/> skriver JSON, diagrammet och en HTML-rapport. Det medföljande scenariot (24-satellitig Walker, dubbelfrekvent avståndsmätning på { "1" } m, APV-I-gränser) redovisar ~{ "95" } % tillgänglighet; det dokumenterar att RAIM med en frekvens inte når den vertikala APV-I-gränsen med en enda konstellation, vilket är därför vertikal vägledning använder SBAS/dubbelfrekvens/ARAIM. Testerna täcker dispatchen, JSON för tillgänglighetskartan och SVG.

seg-bbe5721c1785 = <b>Körbar RAIM-tillgänglighet över en konstellation (<c1/>).</b> Integritetsmodulen hade ingen anropare — <c2/> gör den till en äkta ingång från början till slut: vid varje epok på ett tidsnät propagerar den de synliga satelliterna (samma SGP4/Kepler-<c3/> som motorn använder), beräknar skyddsnivåerna utan fel och bedömer tillgängligheten mot de horisontella/vertikala larmgränserna, och returnerar en <c4/>-serialiserbar <c5/> (per epok <c6/>/HPL/VPL/<c7/> plus tillgänglighetsandelen). En <c8/> samlar <c9/>, och <c10/> per epok exponeras för anropare som löser sin egen geometri. Tre tester: en epok som bedöms tillgänglig under APV-I-gränser på en geometri med tio satelliter, som görs otillgänglig av en omöjligt snäv gräns, och <c11/>-nivåer under fem satelliter; samt en körning från början till slut över en Walker-konstellation med 24 satelliter som ger en ändlig tillgänglighetskarta och serialiseras. (Sex satelliter — golvet för residual-RAIM-redundans — uppfyller ärligt talat <em>inte</em> APV-I ens vid avståndsmätning på { "1" } m; APV-I-tillgänglighet kräver den tätare geometri som testet använder.)

seg-91e32e587cb6 = <b>Ackumulator för Stanford(-ESA)-integritetsdiagram (<c1/>).</b> Det vedertagna sättet att sammanfatta en integritetsmonitor över många epoker: den ritar faktiskt positionsfel (x) mot skyddsnivå (y) och klassificerar varje epok, med hjälp av diagonalen <c2/> och larmgränsen, som <c3/> (PL begränsar felet, inom AL), <c4/> (PL begränsar felet men överskrider AL — säkert, oanvändbart), <c5/> (PL < fel ≤ AL) eller <c6/> (PL < fel och fel > AL — det osäkra felet). <c7/> är den rena klassificeraren; <c8/> ackumulerar <c9/>-punkter mot en fast larmgräns och exponerar antal per område, tillgänglighet, summor av integritetshändelser och <c10/>-serialiserbara punkter för ritning/JSON-export. Fyra tester: varje område (inklusive gränsfallet <c11/> för begränsat), ackumulering av antal/tillgänglighet och JSON-tur-och-retur. Detta är rapporteringsytan för RAIM-skyddsnivåerna; att koppla in den i konstellationsscenariot och validera mot en offentlig datamängd återstår som punkter på färdplanen.

seg-cdeb3a5a4acf = <b>RAIM med lösningsseparation (ARAIM-stil) (<c1/>).</b> En integritetsmonitor med flera hypoteser vid sidan av den befintliga χ²-monitorn <c2/> för residual/paritet. För minstakvadratlösningen med alla satelliter i sikte och varje delösning där en enskild satellit utesluts bildar den separationen <c3/> — gaussisk med medelvärde noll när inget fel finns, med kovarians <c4/> (identiteten för nästlade skattare, giltig eftersom lösningen med alla satelliter i sikte är BLUE) — och därför både <b>upptäcker</b> den ett fel och <b>identifierar</b> den felaktiga satelliten (den vars uteslutning ger den största normaliserade separationen). Horisontella/vertikala skyddsnivåer följer den vanliga MHSS-tilldelningen <c5/>, med <c6/>, <c7/>. Nya beroendefria <c8/>/<c9/> byggda på modulens befintliga regulariserade ofullständiga gammafunktion (<c10/>). Fyra handhärledda tester: normalfördelningens CDF och kvantil mot läroboksvärden (Φ({ "1.95996" })={ "0.975" }, svansen { "1e-7" } = { "5.1993" }, symmetri); en felfri geometri som inte larmar och ger ändliga, positiva HPL/VPL; ett bias på 60 σ hos en enskild satellit som upptäcks <em>och</em> identifieras korrekt (<c11/>); samt redundansgolvet för sex satelliter. Stänger granskningens lucka P0 "tautologisk integritet — ingen verklig RAIM/HPL/VPL" på algoritmsidan; validering mot gLAB-datamängd och Stanford-diagramackumulatorn återstår som punkter på färdplanen.

seg-67e771fc0a48 = Sluten GNSS/INS-integration (<c1/>).

seg-5aa467783b99 = <c1/> kopplar felstatus-EKF-kärnan till den treaxliga strapdown-mekaniseringen: varje IMU-sampel korrigeras med de löpande biasskattningarna, mekaniseras framåt och EKF-kovariansen tidspropageras med motsvarande navigationskontext; varje GNSS-positionsbestämning för position/hastighet bildar INS−GNSS-innovationen och matar tillbaka de skattade <b>position, hastighet, attitydfel (ψ, som en kvaternionrotation) och accelerometer-/gyrobiaserna</b> in i lösningen och nollställer medelvärdet för felstatus. Att återkoppla attityden (inte bara biaserna) krävs för stabilitet — lutningen och accelerometerbiasen är ett kopplat par, så att korrigera det ena utan det andra divergerar. INS och GNSS jämförs i ett lokalt tangentplan med NED-system med mekaniseringens egna krökningsradier (nya <c2/>; <c3/>/<c4/> exponeras). Detta är den ärliga ersättningen för den hybrida paketets <em>nollställning som snäpper till referensen</em>. Tre tester: en sluten slinga som nollställer ett inlagt positionsfel på { "8" } m / −{ "5" } m till <{ "0.1" } m; en assisterad lösning som håller sig inom meterstorlek (<{ "6" } m) på en körbana medan en fritt löpande INS divergerar förbi { "100" } m; och milstolpsbenchmarken — den fusionerade lösningens <b>Monte Carlo-positions-RMS under ett GNSS-avbrott på { "60" } s slår en oassisterad dödräknare med öppen slinga med >{ "2" }× (≈{ "4" }× över olika frön)</b>. Ärlig begränsning som dokumenteras i modulen: i löst kopplat läge går accelerometerbias och lutning bara svagt att skilja åt (båda kopplas via gravitationen), så det levererade värdet är det begränsade, korrigerade tillståndet och ett rent ingångsläge vid avbrott — inte en exakt tröghetskalibrering; rikare dynamik och den tätt kopplade utvidgningen återstår som punkter på färdplanen.

seg-aa9bf0ff6f84 = <b>Löst kopplad felstatus-EKF-kärna för GNSS/INS (<c1/>).</b> Ett utvidgat Kalman-filter för felstatus med 15 tillstånd — <c2/> — med strapdown-felets dynamik enligt Groves { "2013" } §{ "14.2" } (koppling mellan specifik kraft och lutning, Coriolis, projektion av bias från kropp till nav, Gauss–Markov-biasmodeller), en diskret övergång av första ordningen <c3/> och en löst kopplad mätningsuppdatering för position + hastighet (<c4/>) i Joseph-form. Beroendefri tät linjär algebra (Gauss–Jordan-invers, Joseph-kovariansuppdatering). En cargo-funktion <c5/> spärrar en dokumenterad, ännu inte implementerad uppdatering för pseudoavstånd/Doppler. { "7" } tester med handhärledda förväntningar: identiteten för skev symmetri/kryssprodukt, en verifierad invers av { "3" }×{ "3" }, kovarians som förblir symmetrisk/PSD under prediktion (och positionsosäkerhet som växer utan assistans), en positionsbestämning som krymper positionskovariansen, exakt återskapande av ett känt positionsfel vid den analytiska Kalman-förstärkningen <c6/> och mindre korrektioner vid större mätbrus. Detta är den kärna som ska ersätta det hybrida paketets nollställning med öppen slinga som snäpper till referensen med sluten återkoppling (kopplingen till paketet + validering mot NaveGo följer).

seg-5be84079b8b6 = Deterministisk IMU-felmodell för den 3-axliga strapdown-navigatorn (<c1/>).

seg-492e670736b2 = <c1/> förvränger ett verkligt <c2/>-par i kroppssystemet till ett uppmätt par genom fem systematiska kategorier (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabell { "4.1" }): <b>skalfaktor</b> (förstärkningsfel i ppm per axel), <b>felinriktning / korskoppling</b> (icke-ortogonalitet i triaden utanför diagonalen), <b>g-känslighet</b> (en gyrobias i vinkelhastighet proportionell mot specifik kraft), <b>kvantisering</b> (avrundning till utgångens LSB) och <b>hastighetsramp</b> (en drift linjär i tiden — Allans tredje område), plus en konstant tillslagsbias. Varje term har standardvärdet noll, så att <c3/> är en genomsynlig genomströmning och befintliga scenarier påverkas inte. Varje felkälla har ett isoleringstest (skala linjär till <{ "0.01" }%, felinriktning över axlarna ovanför VRW-golvet, g-känslighetsbias, LSB-nät, linjär ramp), och ett test från början till slut driver ett navigationsfel genom mekaniseringen från en förvrängd IMU. Modelleras inte: vibrationsrektifieringsfel, temperaturgradientdrift. (Det levererade scenariopaketet <c4/> kör fortfarande den äldre skalära budgeten med 1-DOF; den här modellen matar 3-axelbiblioteket.)

seg-f57bc89d4688 = <b>Coning- och sculling-kompensation för strapdown-integratorn.</b> Attitydvägen får tvåsampelsmåttet <c1/> (<c2/>); en integrering med grov frekvens ({ "30" } Hz, 5 sampel/cykel) av en coning-miljö på { "5" } Hz verifieras följa referensen med fin frekvens ≥ { "3" }× bättre med korrektionen än med naiv summering av inkrement. Hastighetsvägen får <c3/> (<c4/>, Groves ekv. { "5.82" }) och löser kroppens hastighetsinkrement genom en ny inkrementbaserad uppdatering <c5/> med den kroppsrelativa rotationen <c6/>, så att en jordfast plattform inte får något falskt sculling medan en verklig vibration utlöser hela termen.

seg-56c599250ed4 = Fullständig treaxlig strapdown-mekanisering i NED-systemet (<c1/>).

seg-d0897492e89b = <c1/> flyttas fram med <c2/> med de vanliga NED-ekvationerna för jordfasta system (Groves §{ "5.4" }): attityd från kropp till NED korrigerad för hastigheten från tröghet till nav <c3/> (jordrotation + transporthastighet); specifik kraft löst från kropp till NED via DCM; hastighet som integrerar <c4/> (Coriolis/transport + gravitation); och geodetisk position via meridianens och tvärkrökningens krökningsradier. Gravitationen är WGS-84:s slutna Somigliana-<b>normalgravitation (lodlinje)</b> med en NIMA-korrektion för höjd i fri luft — aldrig en hårdkodad konstant. Detta är den äkta treaxliga navigatorn som ersätter vägen med skalär felbudget och 1-DOF. Verifierad med fysikaliska invarianter: en plattform fastskruvad i den roterande jorden vid { "45" }°N (som mäter jordrotation + { "1" } g) håller sig inom { "1" } mm över { "60" } s; en horisontell specifik kraft mot norr ger <c5/> och förskjutningen <c6/>; normalgravitationen stämmer med de kända ytvärdena vid ekvatorn, polen och 45° och med lapsehastigheten i fri luft.

seg-290b08199bfb = <b>Treaxlig attitydrepresentation för strapdown-INS (<c1/>).</b> En typ för enhetskvaternion <c2/> (skalär först, Hamilton-konvention) som bär rotationen från kropp till nav, med en DCM-vy (<c3/>/<c4/> via Shepperds metod), Hamilton-produkt, konstruktorer för axel-vinkel och rotationsvektor (exakt exp-avbildning) samt kvaternionkinematik — både en RK-hastighetsuppdatering av första ordningen (<c5/>) och en coning-korrigerad uppdatering av rotationsvektorn. Tvåsampelsmåttet <c6/> (Savage / Bryan–Lewantowski, <c7/>) ger den korskopplingsterm för rotationshastighet som skalär dödräkning utelämnar. Detta är attitydgrunden för den fullständiga 3-axliga mekaniseringen som ersätter den äldre vägen med felbudget och 1-DOF. Verifierad mot slutna rotationer: propagering med konstant hastighet stämmer med axel-vinkel-kvaternionen till { "1e-6" }, DCM:erna är ortonormala med determinant ett, och coning försvinner vid rörelse kring en enda axel. (<c8/> är nu modulkatalogen <c9/>; den publika sökvägen <c10/> är oförändrad.)

seg-5e6e5bba25a5 = Geodetiskt korrekt sikt från markstation (<c1/>).

seg-69bdb1e5bfc8 = <c1/>, <c2/> och <c3/> beräknar en satellits elevation över en markstations horisont mot <b>WGS-84-ellipsoidens normal</b> (den verkliga lokala vertikalen), inte den geocentriska radiella — de skiljer sig med upp till ~{ "0.19" }° geodetisk avvikelse, vilket räcker för att få satelliter nära horisonten att hamna innanför eller utanför en elevationsmask. Verifierad från början till slut (en Walker-konstellation propagerad, roterad TEME→ECEF och räknad från en geodetisk plats) och mot den geocentriska approximationen.

seg-4de1d79d2e76 = <b>Tillförlitlighet i CI.</b> Jobbet <c1/> bygger nu hjulet med <c2/> (manylinux-container) i stället för ett rått <c3/> på värden, vilket tar bort en intermittent rustup-konflikt mellan <c4/>/<c5/> på runner-avbilden. Jobbet <c6/> installerar <c7/> som en förbyggd binär via <c8/> i stället för den Docker-baserade <c9/>, vilket tar bort en timeout vid hämtning från Docker Hub-registret. Ingen av ändringarna påverkar de kontroller som utförs.

seg-05055c993904 = Tröghetshastighet exponeras nedströms.

seg-1228235c99b6 = <c1/> och <c2/> (som returnerar <c3/>) för den analytiska TEME-hastighet som SGP4 redan beräknar — tidigare kastad — vidare till anropare i m/s; <c4/> ger Kepler-vägen en konsekvent hastighet. Verifieringstestet för AIAA 2006-6753 kontrollerar nu även hastigheten för varje referensrad (sämsta hastighetsfel { "1.85e-9" } km/s över alla { "666" } tillstånd) och fastställer antalet jämförda rader till exakt { "666" }.

seg-8ac2598291b8 = <b>Strängare TLE-tolkning utan panik.</b> Rader måste vara ASCII och delas säkert (inga fler byteindexpaniker vid flerbyteindata); element områdeskontrolleras (inklination, excentricitet, medelrörelse); kontrollsumman i kolumn 69 kan upprätthållas via <c1/> / <c2/> och den nya flaggan <c3/> på <c4/> (tillåtande som standard).

seg-1cd2c6621a04 = <b>Allan-deviationskurva i utdata.</b> Varje klockkörning redovisar nu en <c1/> (<c2/>) och lekplatsen i webbläsaren ritar ett log-log-diagram "Clock stability (ADEV)".

seg-c76ff20811e7 = Validering av indata för tidsnätet.

seg-75436d067802 = <c1/> avvisar ett icke-ändligt, nollställt, negativt eller för stort tidsnät (ett steg som är större än varaktigheten, eller fler än <c2/> sampel) innan någon allokering sker, så att ett felaktigt scenario ger ett fel i stället för att få panik eller tömma minnet.

seg-d0a8ce50cf6e = Monte Carlo-ensembler för tröghetspaketet.

seg-3225674ce4ea = <c1/> i ett tröghetsscenario kör N frön och redovisar varje mätvärdes medelvärde, standardavvikelse, percentiler och ett percentil-bootstrap-konfidensintervall på { "95" }% (<c2/>). Varje tröghetskörning bär nu en flagga <c3/>, så att ett kvalitetsmått från en enda realisering inte längre misstas för en fördelning. (CEP/2DRMS redovisas medvetet inte — de kräver 3-axelmodellen som finns på färdplanen.)

seg-2967872bfca1 = <b>Guidat läge i lekplatsen.</b> Lekplatsen i webbläsaren släpper inte längre ner dig på en rå TOML-vägg: en "Start here"-remsa med scenariokort för ett klick läser in och kör ett genomarbetat exempel, reglage ger tillgång till de universella inställningarna (frö, tidströskel) utan att röra TOML, en "How to read this"-notering förklarar resultatet, och hela TOML-filen ligger ett fällbart avsnitt bort. Varje körning är delbar — <b>Copy share link</b> kodar hela scenariot i URL-fragmentet (inget laddas upp), så att en länk återskapar exakt samma körning vid inläsning. Kodeken är enhetstestad (<c1/>, körs i CI).

seg-2e47e8864718 = N-dimensionella parametersvepningar (<c1/>).

seg-5076a9ad20d7 = <c1/> utvärderar ett mätvärde över hela den kartesiska produkten av flera <c2/>-intervall (avvägningsstudien med flera parametrar), i radvis ordning och deterministiskt. Additivt — det befintliga 1-D-svep-API:et är oförändrat. Bootstrap-konfidensintervall per nod och generalisering bortom klockpaketet återstår på färdplanen.

seg-958718831037 = <b>Verklig snapshot-RAIM (<c1/>).</b> Äkta Receiver Autonomous Integrity Monitoring i positionsdomänen: den bygger siktlinjegeometrin till de synliga satelliterna, bildar minstakvadratlösningen och residualerna, kör ett χ²-test av residualerna för feldetektering (exakt tröskel från en beroendefri ofullständig gammafunktion med χ²/icke-central χ²) och beräknar lutningsbaserade horisontella och vertikala skyddsnivåer (HPL/VPL) med det bias för missad detektering som härleds för konfigurerade P_fa/P_md. Detta är något annat än — och är <b>ännu inte inkopplat i</b> — scenariokedjans kvalitetsmått för integritet baserat på filtrets självkonsistens; felexkludering, budgetering av larmgräns/P_HMI och ARAIM återstår på färdplanen.

seg-1675540acbd9 = <b>Svit för frekvensstabilitet: MDEV, TDEV, HDEV + konfidensintervall</b> (<c1/>). Vid sidan av den överlappande ADEV: den modifierade Allan-deviationen (skiljer vitt från flicker-fasbrus), tidsdeviationen (<c2/>) och Hadamard-deviationen (avvisar linjär frekvensdrift exakt och konvergerar för divergerande röda brustyper). χ²-baserade konfidensintervall (<c3/>) använder ett beroendefritt kvantilpar för normal/χ² (Acklam + Wilson-Hilferty) med ett konservativt icke-överlappande edf; brustypsspecifikt edf och numerisk paritet med Stable32 återstår på färdplanen.

seg-446a9ed4467c = <b>Reduktion av referenssystem (<c1/>).</b> GMST-baserad rotation TEME↔ECEF (med samma sideriska tid enligt IAU-1982 som propagatorn), exakt geodetisk↔ECEF enligt WGS-84 med en iterativ invers startad med Bowring (maskinprecision på alla höjder, inklusive MEO/GEO) och en geodetisk observatör på markstation som ger azimut / elevation / avstånd i det lokala systemet Öst-Nord-Upp. Polarrörelse och nutation under bågsekunden tillämpas inte (enbart GMST, under en kilometer på markspåret); en ITRF-precis CIO-kedja finns på färdplanen.

seg-9f6f53583cf5 = <b>Grund för tidsskalor (<c1/>).</b> Ett beroendefritt API för julianskt datum (gregorianskt civilt ↔ JD, MJD), hela IERS-historiken över heltalsskottsekunder (UTC↔TAI, { "10" } s år { "1972" } till { "37" } s sedan { "2017" }), den definierade förskjutningen TAI→TT, UT1-korrektionen via en given DUT1 och jordrotationsvinkeln enligt IAU-2000. Detta är det tidsunderlag som reduktionen till jordfasta system (planerad) vilar på. Ögonblick är julianska datum med enkel <c2/> (~{ "50" } µs upplösning nära nutida epok; ett tvådelat JD finns på färdplanen), och eran före 1972 med gummisekunder modelleras inte — båda dokumenterade i modulen.

seg-6ecc053f101f = <b>Reproducerbarhet och proveniens.</b> En deterministisk generator för CycloneDX SBOM (<c1/>) och ett SLSA-intyg om byggproveniens för utgivningsbinären och SBOM; verktygskedjan för utgåvor är låst så att den stämmer med CI. Determinismgarantierna, förbehållet om <c2/> mellan plattformar och tillvägagångssättet med golden-fastlåsning dokumenteras i <c3/>.

seg-3e98dcdcb82b = <b>Egenskapsbaserade tester och fuzz-tester</b> (<c1/>). Deterministiska slumpmässiga tester (inget nytt beroende) kontrollerar invarianter över tusentals indata: TLE- och scenariotolkarna får aldrig panik av skräp, icke-ASCII, muterade eller trunkerade indata; <c2/> får aldrig panik av NaN/inf/negativa nät; TLE-kontrollsumman är konsekvent och gäller bara kolumn 69; geodetisk↔ECEF-tur-och-retur och rotationen TEME→ECEF bevarar normen över hela jorden och ett brett höjdband.

seg-ea252b5d7427 = Golden-tester <b>fastlåser nu kvalitetsmåtten fält för fält</b> för de fyra referensscenarierna (med en tolerans som absorberar jitter i <c1/> mellan plattformar), och ersätter de tidigare kontrollerna som bara bestod av olikheter, så att en tyst numerisk regression upptäcks omedelbart.

seg-4b2a0b78984b = <c1/> i resultatartefakter har höjts från <c2/> till <c3/> (den var fryst medan motorn gick vidare).

seg-ecafa9d44810 = <c1/> <b>nekar</b> nu (varnar inte för) indragna beroenden.

seg-c48af44de5b4 = Ny dokumentation: <c1/> (karta över ärlig avgränsning), <c2/> (referens för resultatfält), <c3/>, <c4/>, <c5/>. En CI-spärr misslyckas om versionsmärket i README avviker från <c6/>.

seg-8ef32ebec7f5 = <b>SGP4/SDP4-banpropagering.</b> En fullständig, beroendefri implementering av den vanliga propagatorn för förenklade störningar — SGP4 för nära jorden tillsammans med SDP4-utvidgningen för djuprymd (sol-måne-sekulära och periodiska störningar och geopotentialresonans på { "12" } h / { "24" } h). Den är validerad mot de officiella verifieringsvektorerna i AIAA 2006-6753 ("Revisiting Spacetrack Report #3"): alla { "666" } referenstillstånd för fallen nära jorden, djuprymd, resonans och felkod stämmer med ett positionsfel i sämsta fall på cirka { "4" } mm. Detta är den modell som tvåradselementuppsättningar (TLE) är definierade mot, så den representerar verkliga konstellationer — särskilt GNSS-banorna på ~{ "12" } h, som är djuprymd och resonanta och som den tidigare modellen med tvåkroppsproblem + J2 sekulär inte kan fånga.

seg-06a77fb9233e = En konstellation angiven som <b>kompletta tvåradselementuppsättningar</b> (rad { "1" } + rad { "2" }) propageras nu med SGP4/SDP4; en konstellation angiven med enbart rad-2-element behåller den analytiska Kepler-propageringen med tvåkroppsproblem, oförändrad. De två formerna kan blandas i ett block. Nytt referensscenario <c1/> (en GPS-liknande MEO-konstellation i verkligt tvåradsformat, propagerad med SGP4) — lägg in en aktuell uppsättning "gps-ops" från Celestrak för att studera den levande konstellationen.

seg-2dbb4054e9b8 = <b>Demonstrator för aktiv spoofingattack.</b> Ett nytt scenarioslag <c1/> injicerar en ramp av falsk tid som spoofing och kör varje klockas klockstödda integritetsmonitor, och redovisar om och när spoofingen upptäcks och om den når den operativa specifikationen oupptäckt — vilket gör kvalitetsmåttet Säkerhet till en konkret demonstration av attack och försvar. Nytt referensscenario <c2/>.

seg-aa0cb8038baa = <b>Tillgänglighet med flera konstellationer.</b> Ett banscenario kan kombinera flera konstellationer (en lista <c1/> vid sidan av den primära <c2/>) för multi-GNSS-tillgänglighet och försämring av precisionen — t.ex. GPS plus Galileo. Nytt referensscenario <c3/>.

seg-9b9dcd5be0a7 = <b>Resultatkort som HTML-rapport.</b> Varje körning ger nu också ett fristående, märkt HTML-resultatkort — sammanfattningen på en rad, diagrammet (inbäddat som en overksam data-URI-bild) och hela JSON — skrivet av CLI vid sidan av JSON och SVG. En delbar enfilsartefakt för en studieleverans eller en bilaga.

seg-76c573048a91 = <b>Gemensam skattare för sensorfusion.</b> Ett nytt scenarioslag <c1/> kör ett enda rekursivt Kalman-filter som navigationslösning — som fuserar klocktillståndet <c2/> och positionstillståndet <c3/>, disciplinerat av GNSS (som lär sig frekvensförskjutningen och hastigheten) och assisterat av optisk tidsöverföring under avbrottet — i stället för att komponera oberoende prediktorer. Det redovisar fusionerad holdover för tid/position och en integritet med gemensam kovarians. Nytt referensscenario <c4/>.

seg-10f0501c91ef = <b>Fylligare IMU-brusmodell.</b> Accelerometern modellerar nu de återstående termerna i Allan-variansen utöver den konstanta biasen och hastighetsslumpvandringen: <b>biasinstabilitet</b> (ett 1/f-flickergolv vid den vanliga koefficienten för Allans biasinstabilitet, med återanvändning av klockans flickersyntes) och <b>accelerationsslumpvandring</b>. Nya valfria tröghetsscenariofält <c1/> och <c2/>; en ny GNSS-positionsbestämning omkalibrerar den kvarvarande biasdriften.

seg-251ffc7b7722 = <b>Verklig konstellationsgeometri från TLE.</b> En konstellation kan anges som ett block med tvåradselementuppsättningar (standardformatet från NORAD/Celestrak) via ett fält <c1/>, så att tillgänglighet och försämring av precisionen använder en verklig konstellations publicerade geometri i stället för ett syntetiskt Walker-mönster. Motorn läser varje TLE:s Kepler-medelelement och propagerar dem med tvåkroppsproblem — inte SGP4 — vilket är hållbart för en ögonblicksstudie från en gemensam epok. Nytt referensscenario <c2/>.

seg-7deb93b51cc7 = <b>Parametersvepningar för avvägningsstudier.</b> Ett nytt scenarioslag <c1/> varierar en parameter (<c2/>, <c3/>, <c4/> eller <c5/>) över ett linjärt eller logaritmiskt intervall och registrerar ett valt kvalitetsmått i varje punkt för båda klockorna, vilket ger det jämförelsediagram "hur skalar holdover med klockstabiliteten?" som en utformningsavvägning behöver. Nytt referensscenario <c6/>.

seg-ef6f3e77b476 = <b>Konfidensband med Monte Carlo.</b> Scenariot för klockans holdover kan köra många realiseringar (nytt valfritt fält <c1/>): varje kvalitetsmått redovisas då som ett medelvärde med en spridning mellan 5:e och 95:e percentilen, och diagrammet skuggar felhöljet på { "5" }–{ "95" }% runt medianen för varje klocka. En enda körning är fortfarande standard. Nytt referensscenario <c2/>.

seg-e70cc0973fa3 = <b>Excentriska banor och J2-drift.</b> Bantypen är nu en fullständig Kepler-bana (halva storaxel, excentricitet, inklination, RAAN, perigeumargument, medelanomali), propagerad genom att lösa Keplers ekvation, med valfri sekulär J2-nodregression och apsidprecession. Nya valfria scenariofält <c1/>, <c2/> och <c3/>, samt ett referensscenario <c4/> (en mycket excentrisk användare med kritisk inklination på { "12" } h). Cirkulära banor behåller den ursprungliga slutna vägen bit för bit.

seg-cc041e16d418 = Det hybrida paketet (kombinerad PNT) redovisar nu <b>Integritet</b> och <b>Säkerhet</b>, så att alla fyra paket täcker hela uppsättningen operativa kvalitetsmått. Integritet är innehållandet i skyddsgränsen för tidskanalen från en Kalman-skattare som disciplineras mot referensen medan GNSS är nominellt och återförankras (lösare) vid varje optisk återsynkronisering; dess gräns inkluderar länkens golv för mätbrus, så att en klocka som är mycket bättre än länken poängsätts mot den levererade lösningens faktiska brus. Säkerhet är den klockstödda poängen för spoofingdetektering mot tidsspecifikationen.

seg-e0b666457d6e = Utgivningsanteckningar genereras nu ur det kurerade avsnittet i CHANGELOG för taggen (<c1/>), så att varje GitHub-utgåva lyfter fram vad som ändrats i stället för att lista råa incheckningar.

seg-f785718e9454 = Kvalitetsmåttet <b>Säkerhet</b> (tidigare ofyllt): en klockstödd poäng för spoofingdetektering för paketen för klockholdover och bana. Det modellerar en integritetsmonitor som korskontrollerar GNSS-härledd tid mot klockans egen frigångsprediktion över ett koherent fönster; detekteringsgolvet kombinerar det medelvärdesbildade mätbruset med klockans osäkerhet vid frigång, så att en tystare klocka upptäcker mindre, långsammare tidsspoofing. Poängen redovisas i <c1/> relativt tidsspecifikationen, vilket fullbordar de sex operativa kvalitetsmåtten.

seg-9164140872c8 = Geometrihärledd <b>positionsnoggrannhet</b> för banpaketet: utifrån siktlinjegeometrin till de synliga satelliterna bildar det designmatrisen och dess kovariansfaktor <c1/>, vilket ger försämringsfaktorerna för precision (GDOP/PDOP/HDOP/VDOP/TDOP). Positionsnoggrannheten är positions-DOP skalad med ett konfigurerbart användarekvivalent avståndsfel (nytt valfritt scenariofält <c2/>). Ett banresultat bär nu en geometrisammanfattning (andel sampel med positionsbestämning, bästa och mediana PDOP och positionssigma).

seg-3285502161c6 = En <b>lekplats</b> i webbläsaren (<c1/>) som kör motorn på klientsidan som WebAssembly: välj ett referensscenario eller redigera TOML, kör det och se sammanfattningen, diagrammet och hela JSON, utan att något laddas upp. Ett arbetsflöde <c2/> bygger och publicerar den på GitHub Pages, och en ny WebAssembly-export <c3/> ligger bakom utläsningen.

seg-0dca5318f7ce = Märkta y-axlar på SVG-diagrammen: stödlinjer, numeriska skalstreckstexter och en axeltitel med enheter (via en delad hjälpfunktion <c1/>), så att storleksordningarna går att läsa.

seg-ce84a3d61f19 = Arbetsflöde för paketpublicering (<c1/>) till crates.io, PyPI och npm, vart och ett spärrat av sin registertoken och utlöst av en publicerad utgåva.

seg-0f01369fc29b = Flicker-FM-golv (1/f) för klockans felmodell, syntetiserat som en summa av logaritmiskt fördelade Ornstein-Uhlenbeck-processer och kalibrerat så att det platta golvet för Allan-deviationen ligger på en konfigurerbar nivå. Av som standard; aktiveras per klocka via det valfria scenariofältet <c1/>.

seg-5b7fcd386fd3 = Gyrokanal för tröghetsmodellen: kvarvarande gyrobias och vinkelslumpvandring driver ett attitydfel (lutning) som kopplar in gravitationen i ett horisontellt fel i specifik kraft, den dominerande mekanismen för felväxt i strapdown. Av som standard; aktiveras per sensor via de valfria fälten <c1/> och <c2/>.

seg-efe9f10d2641 = Kalman-klockskattare med två tillstånd (fas, frekvens) med exakt diskretisering av processbruset enligt van Loan. Frigång från ett känt tillstånd återger exakt den analytiska tillväxten av holdoverfelet (<c1/>), och filtret ger dessutom en 1-sigma-osäkerhetsgräns online.

seg-539e24f34ed1 = Klockkörningen redovisar nu kvalitetsmåttet <b>Integritet</b> (tidigare ofyllt): andelen avbrottssampel vars fel håller sig inom filtrets skyddsgräns på 3 sigma, redovisad i JSON-resultatet och CLI-sammanfattningen.

seg-80620c97e3f5 = Geometrihärledd GNSS-tillgänglighet: cirkulär banpropagering, en generator för Walker-delta-konstellationer och siktlinjesikt (jordockultation plus elevationsmask) ger tillgänglighetstidslinjen utifrån verklig banegeometri. Nytt scenarioslag <c1/> och referensscenariot <c2/> (en rymdfarkost inuti GNSS-skalet med intermittent täckning).

seg-67549163ad7d = Valfritt Python-tillägg (PyO3, abi3) som exponerar <c1/>, <c2/> och <c3/>, paketerat med maturin (<c4/>) och byggt för Linux, macOS och Windows av ett arbetsflöde <c5/> vid utgivningstagg. Bindningen är ett funktionsspärrat, valfritt beroende: standardbygget, testerna och spärren för beroendegranskning påverkas inte.

seg-c76dc363f0b1 = Valfri WebAssembly-modul (wasm-bindgen) som exponerar <c1/>, <c2/> och <c3/>, byggd med wasm-pack under funktionen <c4/>; <c5/> är målspärrad för att använda webbläsarens entropikälla på <c6/>.

seg-cf1b0eef2201 = Gemensam dispatch av <c1/> som används av CLI och båda bindningarna, så att kommandoraden och bindningarna inte kan glida isär.

seg-8d4f855d11bd = Holdover-poängsättningen är nu segmentmedveten: avbrottstidslinjer delas i sammanhängande segment vid GNSS-återinfångning, och den redovisade holdovern är den sämsta (kortaste) frigången över dem. Scenarier med ett enda avbrott är oförändrade. Gäller poängsättarna för klocka, tröghet och hybrid.

seg-8b3556d125ed = Tröghetsmodellens redovisade <c1/> är nu <c2/> (var <c3/>), vilket speglar de kombinerade kanalerna för accelerometer och gyro.

seg-d842f9cc0a9c = Första utgåvan.

seg-962b75c38735 = <b>Deterministisk simuleringsmotor</b> för hybrid kvant-/klassisk PNT: ett gemensamt gränssnitt för felmodeller, deklarativa scenarier för GNSS-tillgänglighet, estimatorer för holdover och dödräkning samt poängsättning av kvalitetsmått mot de vanliga operativa PNT-kriterierna. Resultaten är reproducerbara från <c1/> (versionerad, självbeskrivande JSON med en scenariohash) och återges som SVG-diagram. CLI skickar scenarier vidare efter <c2/>.

seg-16e574edc3a8 = <b>Fyra sensorpaket</b>, vart och ett kalibrerat mot publicerade data och validerat mot standardsambandet:

seg-b49bbb60c2cd = <b>Klockans holdover</b> — vitt FM, slumpvandrings-FM och linjär åldring; validerad med överlappande Allan-deviation (Riley, NIST SP { "1065" }). Chipskaleatomklocka mot optisk gitterklocka med strontium.

seg-be2c5f28b256 = <b>Tröghetsbaserad dödräkning</b> — kvarvarande bias + hastighetsslumpvandring, dubbelintegrerad till positionsfel; validerad mot Groves samband för felväxt. Kallatom- mot navigationsklassad accelerometer.

seg-fcb0f72db736 = <b>Tidsöverföring</b> — tidsjitter i optisk mot RF-länk → synkroniseringsprecision → envägsavståndsmätning.

seg-93e5f2f70b58 = <b>Hybridfusion (slutstenen)</b> — en kombinerad PNT-svit som måste hålla både tid och position, med valfri klockassistans via optisk tidsöverföring mellan satelliter.

seg-e0a8cbe0c105 = <b>Ett citerat referensscenario per paket</b> under <c1/>, där varje numerisk parameter bär en referensgranskad <c2/>.

seg-8f1cc09b2513 = <b>Spärrar för reproducerbarhet och hygien i förvaret</b>; CI (format, clippy, tester, spärrar, MSRV) och en taggspärrad utgivningskedja som kör om alla kontroller.

seg-8b4e21f56334 = <b>Dokumentation</b>: README med arkitekturdiagram, statusrapport för validering, vägledning för bidrag, säkerhetspolicy och uppförandekod; licens Apache-2.0; mallar för ärenden och PR samt Dependabot-konfiguration.

seg-e26d94f06ead = Leverantörsneutralt genomgående; referensgranskade vetenskapliga och metrologiska källhänvisningar behålls.

seg-84cb67686edf = Licenshygien för Apache-2.0: SPDX-huvuden i alla källor, en <c1/> med varumärkesmeddelande, godkännande enligt Developer Certificate of Origin (DCO) för bidrag och <c2/> som upprätthåller beroendenas licenser och rekommendationer i CI.

seg-a0f14bea7532 = Positionering som öppen kärna (README): en gratis motor under Apache-2.0 plus tillgängligt kommersiellt stöd, integration och proprietära tillägg från Ashforde OÜ — finansierat av tjänster, inte licensavgifter.

seg-899815063eb1 = <c1/> så att programvaran kan citeras.

seg-15f45d8ccb0f = <s1>Föregående</s1>Var Kshana står

seg-cd8a14a9e8ec = <s1>Nästa</s1>Licensiering
