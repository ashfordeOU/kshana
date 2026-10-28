# docs--mcp: translations (da)

seg-261c059bec54 = Vejledende, ikke typegodkendt navigationsudstyr: operatøren er fortsat ansvarlig for navigationen. Serveren kører på din computer; intet sendes til Ashforde OÜ.

seg-13641146503d = Cursor (ét klik)

seg-3bd13fe295f4 = VS Code (ét klik)

seg-fea7b394cdde = npx

seg-76fcc8024f2f = uvx / pipx

seg-deb5187472d1 = Homebrew

seg-491167f2310c = Scoop

seg-5c425ea185ee = Færdigbygget binær fil

seg-d107bc8e1950 = MCP-register

seg-842b77a21c5f = Kanal

seg-d6476863f862 = Funktion

seg-fdbb9db68f1d = ingen

seg-1759a8cce7d6 = Typer

seg-564133d6a0c4 = Konstellationer omkring ethvert legeme

seg-b88a2a9497c2 = Værktøj

seg-a683980168f7 = Docker

seg-f3a2279d6df7 = Kommando eller knap

seg-20c5ae650eb7 = Kræver

seg-af4d3ce85e11 = Fastlåst form

seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

seg-b02bdf7c7661 = Node eller Docker

seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

seg-abf8b5fe685a = Node { "18" }+

seg-06299cefbf9e = Python { "3.9" }+ med uv eller pipx

seg-26795c302f8a = brew

seg-ded975fa67fa = formel for v{ $version }

seg-667d6dde705b = <c1/> og derefter <c2/>

seg-f6e9fc5f46fe = Scoop (Windows)

seg-bc4762d20004 = manifest for v{ $version }

seg-f7c0a2fbb0b5 = winget

seg-9e599ab3c0a3 = winget (Windows)

seg-091d1404bb8a = cargo

seg-145ddf98e77f = Rust { "1.88" }+

seg-b308519d4c8d = <a1>udgivelsessiden</a1>: <c1/> (Linux x86-64), <c2/>, kontrolleret med <c3/> og <c4/>

seg-c39cac69f700 = v{ $version }

seg-e8f5e2b6580b = <c1/> (findes af klienter, der kender registret)

seg-b1a6e807f06f = en klient, der kender registret

seg-d5a3818ac3b6 = Fjernadgang (streamable HTTP)

seg-5f1397b1ea30 = din egen vært

seg-e7acd0ff4c84 = Kilde: <c1/>

seg-81a87d14efda = Kshana: mærket, et kompastrådkors, der markerer det præcise øjeblik, ved siden af ordmærket kshana

seg-3d5232472e42 = kshana-mcp: spørg din AI-assistent, og motoren svarer

seg-ef90bf1e0b51 = <c1/> er en <a1>Model Context Protocol</a1>-server (MCP) til <b>Kshana</b>, open source-simulatoren til PNT-robusthed (positionering, navigation og tidssynkronisering). Den lader en AI-assistent (kunstig intelligens) køre den rigtige motor og læse dens JSON (JavaScript Object Notation) tilbage i stedet for at gætte på matematikken. Den taler over stdio (standard input og output) med enhver MCP-kompatibel klient, herunder Cursor og JetBrains AI Assistant / Junie.

seg-1fddef4e9a49 = Den matematik, som Kshana er valideret til, er netop dér, hvor en sprogmodel gætter dårligt: SGP4-banepropagering (Simplified General Perturbations { "4" }), referencesystemer fra IAU (Den Internationale Astronomiske Union), Allan-deviationer, GNSS-tilgængelighed (Global Navigation Satellite System) og DOP (dilution of precision), ARAIM-beskyttelsesniveauer (advanced receiver autonomous integrity monitoring), fusion af GNSS og INS (inertialnavigationssystem) samt kvantesensormodeller. Stil et spørgsmål; assistenten kører et rigtigt scenarie og får kvalitetsmål med deres proveniens og deres mærkat VALIDATED eller MODELLED.

seg-d51681f30e8f = Én åben motor i midten med MCP-serveren som én af sine overflader ved siden af kommandolinjen, Rust-biblioteket, Python, WebAssembly og Kshana Studio, Docker-imaget og JetBrains-pluginet; alle overflader kører den samme motor, og Kshana Pro afhænger af den uden at forke den

seg-2a56e1f52830 = Værktøjer

seg-b847694d91b5 = Kør et scenarie ud fra en TOML-definition (Tom's Obvious, Minimal Language); returnerer oversigten og hele resultat-JSON (JavaScript Object Notation: kvalitetsmål, kurver). Valgfri <c1/> returnerer diagrammet som SVG (Scalable Vector Graphics).

seg-3c00da00ec30 = Forhåndskontrol: fortolk TOML-filen og find dens type uden at køre den.

seg-4516fd1e665c = De medfølgende referencescenarier som JSON: hver <c1/>, dens <c2/> og én sætning om, hvad den viser. Valgfrit filter <c3/>. Hvert eksempel kan køres, som det står, så dette er den hurtigste vej til en gyldig TOML for en type.

seg-61db4a94ad72 = TOML-teksten for ét medfølgende referencescenarie, byte for byte den fil, der ligger under <c1/>.

seg-306f7a835bb9 = Kør et scenarie og returnér dets rapport: resumé, input, hvert tal med sin enhed og sin mærkat VALIDATED eller MODELLED, hændelser, de afprøvede funktioner og en reproducerbarhedsoptegnelse. <c1/> er <c2/> (standard) eller <c3/> (den udskrivbare enkeltfilside).

seg-bdacef6d5133 = Kør et scenarie og returnér dets tidsserie som en animation: <c1/> (standard), <c2/> (en selvstændig afspiller) eller <c3/> (højst { "120" } i ét svar). Det første indholdselement er et JSON-resumé af det, der blev tegnet; filerne følger efter. En type uden en samplet tidsakse afvises med begrundelsen.

seg-313f7594bd81 = Hvilke interoperabilitetsformater der gælder for et scenarie (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), begrundelsen når et ikke gør, og den specifikation, som hver skriver følger. Kører ikke scenariet.

seg-e63b7853bb96 = Eksportér et scenarie som CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK-efemeride (Systems Tool Kit) <c1/> eller SigMF (Signal Metadata Format, for et <c2/>-scenarie med en <c3/>-blok). Det første indholdselement er et JSON-indeks over filerne (endelse, størrelse, kodning og SHA-256-fingeraftrykket, den 256-bit Secure Hash Algorithm); filerne følger efter, den binære SigMF-samplefil som base64.

seg-074e914789c5 = Skriv en GeoJSON-rute af typen <c1/> ind i et scenarie, der flyver en waypoint-bane (<c2/>, <c3/>, <c4/>, <c5/>), og returnér den nye TOML.

seg-ae58a8577aa7 = Eksportér konstellationen i et <c1/>-scenarie som SP3-c (Standard Product { "3" }, revision c), præcis efemeride.

seg-6a59aacf26bb = Eksportér elementerne i et <c1/>-scenarie som et CCSDS-katalog (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message).

seg-5562b319968b = Eksportér tilstandsserien i et <c1/>-scenarie som CCSDS OEM-efemeride (Orbit Ephemeris Message) { "2.0" } — TEME-serien (true equator, mean equinox) af position <em>og</em> hastighed, som flyvedynamikværktøjer (GMAT, General Mission Analysis Tool; Orekit; STK, Systems Tool Kit) læser; komplementet til det rent positionsbaserede <c2/>, som medbringer hastigheden.

seg-b0cf13e530b7 = Kør et scenarie og returnér dets reproducerbarhedstabel som CSV (comma-separated values) — den byte-stabile tabel, som CLI'en (kommandolinjegrænsefladen) skriver som <c1/>. Kun <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (dens <c7/>-analyse på en <c8/>- eller <c9/>-meddelelsesmodel) og <c10/> med <c11/> + <c12/> sat udsender en; enhver anden type returnerer en fejl, der nævner disse.

seg-ab242cd0259c = Himmelgeometri under en azimutafhængig horisontprofil: ud fra et sted, et tidspunkt og konstellationsforudindstillinger, two-line element sets (<c1/>, propageret med SGP4 til en UTC-<c2/>) eller satellitter som azimut/elevation eller ECEF, de synlige satellitter og dem, horisontprofilen skjuler, GDOP/PDOP/HDOP/VDOP/TDOP fra den DOP-kerne, der er kontrolleret mod gnss_lib_py, east-north-up-kofaktoren og -kovariansen (ét ur pr. system eller ét fælles) og den horisontale fejlellipse; med <c3/> i stedet for <c4/> en REPRESENTATIVE forudindstilling med sin proveniens og sit snit for hver grad. MODELLED; bærer den vejledende erklæring; ingen Monte Carlo over MCP. Se <a1><c5/></a1>.

seg-d6ed4e8d56e5 = Vurdér en rigtig GNSS-modtagerlog (global navigation satellite system) for tillid. TOML-filen angiver logens <c1/> (<c2/>, <c3/>, <c4/>, <c5/> eller <c6/>) og giver dens bytes inline som <c7/> eller <c8/>; værktøjet kører tillidsmonitorerne (fald i bærer-til-støj-tæthed, tab af lås, AGC (automatic gain control), jamming-indikator, positionsspring og, med RINEX plus broadcast-navigationsdata, RAIM (receiver autonomous integrity monitoring) og en urstøttet monitor) og returnerer, hvornår og hvorfor positionsbestemmelsen holdt op med at være troværdig. Valgfri sektioner <c9/> og <c10/> scorer angivne hændelser og forudsagte C/N0-fald mod angivne tolerancer. En <c11/>-tabel vælger de maritime monitorer og tilføjer en tillidsscore på 0-100 pr. epoke med de monitorer, der trak fra (vejledende; MODELLED). Loggen gives inline som <c12/> eller <c13/> (højst { "4" } MiB). Diagram og CSV pr. epoke på forlangende. Se <a1><c14/></a1>.

seg-d1a967a443ea = Scor et afgrænset NMEA { "0183" }-uddrag (højst { "2" } MiB og { "20,000" } epoker; det skal rumme kalibreringsvinduet) på samme måde som <c1/> scorer det: tillidstilstand og score på 0-100 pr. epoke med de monitorer, der trak fra, et resumé og den sidste <c2/>. Den afgrænsede form af den levende kommando: ingen socket åbnes, og intet skrives til en port; gaten, <c3/> og telemetrieksportørerne (Prometheus, OTLP, syslog) findes kun på kommandolinjen. Kun vejledende; MODELLED. Se <a1><c4/></a1>.

seg-89e894d4b416 = Et fartøjs NMEA { "0183" }-log (højst { "4" } MiB) som batchkørsel, hvor sessions-TOML'en angiver fartøjets grænser: scoremodellen og hver epokes score på 0-100 med dens fradrag (svaret bevarer antal pr. tilstand og de første { "200" } degraded eller untrusted epoker). Kun vejledende; MODELLED.

seg-27698c80b7f1 = Læs den publicerede Jammertest-testkatalog og transmissionsplan (NPRA/jammertest-plan, MIT) som planlagt reference (<c1/>): ét testområdes slots bliver til modtagertillidshændelser med katalog-id og år i hver etiket. Planlagte slots, ikke optagne sendetider; intet kontaktfelt i planen læses. MODELLED. Se <a1><c2/></a1>.

seg-23daf6121ca0 = Scor en modtagerlog mod den tidsplan (<c1/>): pr. test detektionsforsinkelse, oversete alarmer og tid til genopretning samt de falske alarmer uden for ethvert slot. Tekstlogs som <c2/>, binære (<c3/>, <c4/>) som <c5/>. En signeret pakke kræver en nøgle: kommandolinje. Kun vejledende; MODELLED.

seg-0ca5b319e850 = En signeret bevispakke for et vindue af et fartøjs log (<c1/>): de rå logbytes for vinduet, konfiguration, resultater og årsager pr. epoke, en oversigtsside og et manifest med hver SHA-256 og en hashkæde, signeret med Ed25519. Signeringsseedet returneres eller logges aldrig; uden et bruges en engangsnøgle, så pakken beviser integritet, ikke identitet. En teknisk optegnelse, ikke en juridisk vurdering. Se <a1><c2/></a1>.

seg-8df4c6fb851d = Bind et RFC { "3161" }-tidsstempeltoken (base64 af <c1/>-bytes) til en pakke, i hukommelsen (<c2/>); pakken med tokenet skal stadig kunne verificeres. Tidsstempelmyndighedens signatur kontrolleres ikke: brug <c3/>.

seg-1f7a6f7f005a = Verificér en pakke (<c1/>): hver hash, kæden, signaturen og, med signaturhaverens offentlige nøgle og hele loggen, hvem der signerede den, og at udsnittet stammer fra den log. Nævner hver fejl og fil. <c2/> er <c3/> (signaturhaver fastlåst), <c4/> (alt stemmer, men ingen offentlig nøgle blev givet, så signaturhaveren er ikke fastslået) eller <c5/>; <c6/> afviser en pakke uden tidsstempeltoken.

seg-c43761e01f63 = Syntetisk bro-NMEA { "0183" } til besætningstræning ud fra en <c1/>-TOML (jamming, positionsdrag-off, tidsspoofing, replay-forsinkelse) med instruktørloggen (<c2/>); deterministisk pr. seed. Kun tekst: intet syntetiseres på RF- eller IQ-niveau, og intet udsendes; aldrig til et fartøjs levende navigationssystemer. Svaret rummer de første { "2000" } linjer.

seg-8aec8f61dab2 = Et GNSS-interferenskort ud fra ADS-B- eller AIS-positionsrapporter som CSV-tekst (højst { "4" } MiB): ét <c1/>-GeoJSON pr. UTC-dag, kun aggregeret (ingen identifikatorer, celler med under { "5" } forskellige fly eller fartøjer holdes tilbage), med datasættets licens indlejret. En degraded celle udpeger ikke interferens som årsag; ikke en prognose. MODELLED. Se <a1><c2/></a1>.

seg-d5959e4f1c96 = Et scenaries køretøjsbevægelse og hændelser til en GNSS-simulator i laboratoriet (<c1/>): bevægelses-CSV og -JSON, NMEA, waypoints og hændelser som tekst, intet skrevet til disk. Typerne <c2/>, <c3/>, <c4/>. Intet signal: intet af det eksporterede er, modellerer eller styrer et radiofrekvens- eller basisbåndssignal; simulatoren og dens operatør leverer signalerne. Se <a1><c5/></a1>.

seg-1076916237f0 = Den signerede round-trip-pakke fra laboratoriet (<c1/>): scenariet, laboratoriets <a1><c2/></a1>-dokument, modtagerloggen og dens score mod de angivne hændelser, bundet sammen med hashværdier. Afviser betingelser og scoringshændelser, der er uenige. Intet signal; en teknisk optegnelse, ikke en certificering.

seg-9e1df2016cd7 = Afspil én IQ-optagelse i arbejdsmappen på tværs af flere udformninger af sporingsløkker (<c1/>): pr. udformning og PRN den stationære fase- og kodejitter, låsandele og gennemsnitlig C/N0. Højst { "256" } (udformning, PRN)-kanaler pr. kald; spændet skal rummes af sampelbudgettet.

seg-a5af1743f993 = Kør monitorerne til detektion af interferens og spoofing over en IQ-optagelse i arbejdsmappen (<c1/>): bredbåndseffekt- og spektralmonitorer samt C/N0- og signalkvalitetsmonitorer pr. satellit mod en indlært baseline. Serienavne og -længder og op til { "200" } hændelser i svaret; hele rapporten på forlangende som filer. En hændelse siger, at en målt størrelse forlod sin baseline, ikke hvorfor. MODELLED.

seg-c9c9c909c621 = Tilpas tab-af-lås-modellen for sporingsløkken til laboratoriekørsler (<c1/>) ud fra et <c2/>-scenarie, hvis logs er inline (<c3/> eller <c4/>; en <c5/> afvises). Læser og skriver ingen fil. MODELLED.

seg-4f231cd18d37 = Validér en fil af typen <c1/>, givet som tekst, og returnér de opløste betingelser med deres hash. Kun inline.

seg-2851f2858910 = Kortlægningen af offentlige rammeværker, udfyldt ud fra resultatdokumenter givet som tekst (<c1/>): hvilke rækker i seks rammeværker og standarder for robusthed (US DHS Resilient PNT framework v2.0, IMO for skibe, EASA for luftfart, NIS2 artikel { "21" }, EN { "16803" }, NIST IR 8323r1) kørslerne leverer belæg for, hvilke de ikke gør, og hullet for hver række. Tager <c2/> af <c3/> (højst { "64" }, { "4" } MiB i alt). En status siger, at kørslerne leverer belæg for rækkens funktioner; det er ikke en konstatering af, at et rammeværk er opfyldt og ikke en vurdering eller godkendelse af noget produkt. <c4/> returneres med hver rapport; vis den ordret. MODELLED. Se <a1><c5/></a1>.

seg-0a5161ddea94 = De statiske kortlægningstabeller (eller, med <c1/>, de kildedokumenter, de henviser til, med versioner og URL'er) som Markdown, indledt af den samme erklæring. Kræver ingen kørsler.

seg-ffcc6c72dc1e = En tillidsstrøm (JSON-linjer) eller et <c1/>-resultat gengivet som Prometheus-tekst, CEF- eller LEEF-syslog-linjer, en OTLP JSON-nyttelast eller Home Assistant MQTT-discovery- og tilstandslinjer, med encoderne fra <c2/>. Tekst i svaret: intet sendes eller leveres, og intet ur læses. Kun vejledende.

seg-2b82a8a22298 = Accelerometer- og gyroparametre for scenarierne <c1/> og <c2/>, tilpasset ud fra en stationær IMU-log (CSV eller EuRoC) ved hjælp af Allan-deviation, med en klar til indsætning <c3/>-tabel og logens SHA-256 (<c4/>). Tekst ind, JSON ud; MODELLED.

seg-30d5bb6b34cb = Standardpakkerne (<c1/>): scorede scenariesæt til testprofilerne i DHS Resilient PNT framework (niveau { "1" } til { "4" }), IMO MSC.1/Circ.1575 og ICAO Doc { "9849" } appendiks F.

seg-767a05e5df9f = Én pakkekørsel mod dens tærskler, fastsat før kørslen (<c1/>): hver test <c2/>, <c3/> eller <c4/>, med målte og forventede værdier; giv rapporten til <c5/> for at se rækkerne. MODELLED; vurderer intet produkt.

seg-74110e6b530f = LunaNet Augmented Forward Signal kontrolleret mod LNIS V5 AD1 bind A (LSIS-AFS V1.0, { "29" } januar { "2025" }): <c1/> (implementeringen mod dokumentets trykte kodetabeller og gennemregnede eksempler), <c2/> (en symbolstrøm: synkroniseringsmønster, SB1, FID, TOI-kontinuitet) eller <c3/> (en teststrøm). LDPC og CRC-24Q for underrammerne { "2" } til { "4" } er ikke verificeret; intet signal skrives.

seg-b6abad1f2c9d = En indsendelse til kshana-bench scoret mod en referencefil, begge som JSON-tekst (<c1/>, <c2/>): resultatfilen med specifikationsversion, opdeling, inputhashes og opgavens målinger. MODELLED; beskriver en log eller et korpus, aldrig et produkt.

seg-c7a0d7981bfd = kshana-bench-resultatfiler gengivet som den statiske leaderboard-side (HTML-tekst), hver især valideret først.

seg-1ec7117c7825 = En tillidsstrøm (JSON-linjer) eller et <c1/>-resultat gengivet som Prometheus-tekst, CEF- eller LEEF-syslog-linjer eller en OTLP JSON-nyttelast, med encoderne fra <c2/>. Tekst i svaret: intet sendes eller leveres, og intet ur læses. Kun vejledende.

seg-0fc2e3928768 = Andelen af en rutes længde i degraderede, ikke-degraderede, ikke-vurderede og ikke-observerede celler i et eller flere interferenskort, eventuelt inden for et datointerval. Ikke-observerede celler er ikke belæg for en fri rute.

seg-62756ba18cf5 = Opsætningen af GNSS IQ-laget: de signalnavne, som IQ-værktøjerne accepterer, om IQ-filværktøjerne er slået til, arbejdsmappen og sampelbudgettet pr. kald. Kald den først.

seg-98939638409f = Beskriv én IQ-optagelse (in-phase og quadrature) i arbejdsmappen uden at behandle den: format, samplingrate, centerfrekvens, sampel, varighed, datafiler og størrelser (<c1/>).

seg-c529b1a7ee53 = Generér en GNSS IQ-scene med flere satellitter i arbejdsmappen (<c1/>): angivne Doppler/C/N0-profiler eller ægte broadcast-efemeride-geometri fra en RINEX-navigationsfil, med en valgfri propagationskanal på signalniveau. Svarer med de skrevne filer og deres bytetal samt referencens første epoke pr. satellit.

seg-0c6f5e26367f = FFT-acquisition (fast Fourier transform) af en eller flere PRN'er (pseudo-random noise-koder) over en optagelse (<c1/>), eventuelt bag front-end-trin: pr. PRN om den er acquired eller ej, Doppler, kodefase, topstatistik og tærskel; <c2/> (én PRN) bevarer hele Doppler × kodefase-korrelationsoverfladen med finere Doppler-forfininger.

seg-1da73ad326de = Acquire og derefter tracking med DLL/PLL/FLL-banken (delay-, fase- og frekvenslåst sløjfe) (<c1/>), med sløjferne fra en <c2/> TOML-fil i arbejdsmappen (<c3/>) eller det indbyggede design og valgfri genopfangning (<c4/>): pr. kanal epoker, endelig Doppler, endelig og gennemsnitlig C/N0, fase- og kodelåsandele, låst ved slutningen, den endelige låsetilstand, falske låse og genopfangninger samt designets navn og hash. Tracking streamer i begrænset hukommelse; output pr. epoke går kun til filer (<c5/>: E/P/L, diskriminatorer, sløjfetilstande, C/N0, låsetilstand som .csv/.jsonl/.bin; <c6/>).

seg-262bb9c592c0 = Anvend modtagerens front-end og DSP til afhjælpning af interferens (digital signalbehandling: båndpas, notch, blanking, excision, AGC, kvantiserer) på en optagelse og skriv en ny (<c1/>).

seg-cf33e101b144 = Kør en laboratoriegenafspilningskampagne (<c1/>): optagelser, hver med en testbetingelsesfil, der angiver laboratoriets kendte reference, × front-end-kæder × sløjfedesign. Hver celle scores for tid til tab af lås, genopfangningstid, C/N0-forringelse mod det angivne J/S (ved siden af en analytisk reference mærket MODELLED), falsk-låsrate, PLL/DLL-jitter og tilgængelighed. Inkrementel og genoptagelig: hvert kald kører de ventende celler, der kan være inden for sampelbudgettet (eller <c2/>).

seg-8112428c6226 = Fremdriften i en kampagnes outputmappe: celler færdige og ventende samt digest, når den er færdig. Læser kun filer.

seg-8bd76f017ae4 = Hvert værktøj er en tynd, tro indpakning af en offentlig funktion i biblioteket <c1/> — ingen ny simuleringslogik bor her, så en agent kører præcis den validerede motor.

seg-b37bbaf38900 = GNSS IQ-værktøjerne: filer ind, kompakt JSON ud

seg-ecf2ec0eb66d = IQ-optagelser løber op i gigabytes, så værktøjerne <c1/> sender aldrig sampel gennem protokollen. De følger én kontrakt:

seg-31a173dfe40d = <b>En arbejdsmappe.</b> Serveren læser og skriver kun IQ-filer inde i den mappe, der er angivet af <c1/>. Hvert stiargument er relativt til den (en absolut sti skal opløses inde i den); input opløses gennem symlinks før kontrollen, et outputs mappe skal allerede findes inde i den, og et eksisterende output erstattes kun med <c2/>. Hvis den ikke er sat, er IQ-filværktøjerne slået fra og siger, hvordan de slås til; alle andre værktøjer er upåvirkede.

seg-4f734b84a91a = <b>Et sampelbudget.</b> Ét kald genererer eller behandler højst <c1/> komplekse sampel (standard { "50 000 000" }). I bytes er det { "400" } MB som <c2/> ({ "8" } bytes pr. komplekst sampel), { "200" } MB som <c3/> ({ "4" } bytes) og { "100" } MB som <c4/> ({ "2" } bytes); en scene skrives som <c5/>, medmindre <c6/> siger andet. Kontrollen kører før noget arbejde, og afvisningen angiver den varighed eller <c7/>, der kan være inden for budgettet.

seg-178284ddfee0 = <b>Kompakte svar.</b> Hvert værktøj svarer med én JSON-oversigt: acquisition-toppe, C/N0, låsetilstand og hver skrevet fil med sin sti og sit bytetal. Tabeller pr. epoke går til de <c1/> / <c2/>-filer, du angiver.

seg-f375643798e9 = <b>Ukendte argumenter afvises</b>, ikke ignoreres, så en stavefejl i en indstilling er en fejl.

seg-41040247770d = Hvert værktøj kører den samme kodesti som <c1/> på kommandolinjen, i processen. Laget er kun software: det skriver filer til softwaremodtagere og styrer ingen radiohardware. IQ-laget tilføjer ingen syntese af interferens eller spoofer, og intet udsendes nogensinde. (Scenarietypen <c2/>, der er adskilt herfra, kan skrive analytiske jammer-IQ-øjebliksbilleder til en fil.)

seg-f02d2f6bac7c = Med Docker-aftrykket monterer du mappen og peger variablen på den: <c1/>.

seg-721079aa25e7 = Alle typer kan nås

seg-116ada4f4498 = <c1/> sender videre efter scenariets <c2/>, så alle typer, som <c3/> nævner, kører gennem det. Det omfatter de nyere familier, hver med medfølgende eksempler, som en agent kan hente:

seg-c7047f5750a9 = Et eksempel at starte fra

seg-b45752760eca = Solsystemet

seg-1ccf38ab6e24 = Kampagner: kædede faser, sweeps, Monte Carlo (seedede tilfældige ensembler), sammensætning

seg-67fe14962e1c = Navigation i lav jordbane (LEO): signaludformning

seg-c555e5b73203 = LEO-navigation: linkbudget for overflyvning

seg-67de12cac6f0 = LEO-navigation: navigationsbesked

seg-b8badd962245 = LEO-navigation: fusioneret positionering og tidssynkronisering

seg-0561cfd970d8 = <c1/> med en <c2/> nævner hvert medfølgende eksempel af den type. Animationer, rapporter og interoperabilitetseksporter er ikke typer: de er visninger af en kørsel, og <c3/>, <c4/> og <c5/> returnerer dem for ethvert scenarie, de gælder for.

seg-62d106ca4a89 = Ikke understøttet: undersøgelsessuiter (<c1/>), fordi en suite navngiver søskendescenariefiler på disken, og scenarieværktøjerne læser ingen fil. Kør hvert medlem med <c2/>. (IQ-værktøjerne læser og skriver filer, kun inde i deres arbejdsmappe.)

seg-57f592bb676b = Installér MCP-serveren

seg-77fc92e21295 = Et afsnit, der nævner tredjeparts AI-klienter, er udeladt her; det findes i <a1>mcp/kshana-mcp/README.md</a1> på GitHub.

seg-9ec78559983f = <c1/>, selvhostet: se <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

seg-b32b9d4e0f8b = Fra en checkout eller git (udvikling):

seg-73a73af88f08 = HTTP-tilstand (selvhostet)

seg-4f248ed3e597 = <c1/> leverer de samme værktøjer over streamable HTTP på <c2/>. Den binder kun til loopback; en adresse uden for loopback kræver <c3/> og et bearer-token i <c4/>; IQ-filværktøjerne er slået fra; størrelse, tid og samtidighed for forespørgsler er begrænset; der sendes ingen CORS-header. Kshana hoster ikke et endpoint: du hoster det selv. Se <a1>docs/deploy/mcp-http.md</a1>.

seg-60f55b197ac2 = <c1/> lægger <c2/> på din <c3/> (typisk <c4/>). Serveren taler JSON-RPC (JSON remote procedure call) over stdio; logs går til stderr. Bygning fra kildekode kræver en Rust-toolchain ≥ { "1.88" } (den patchede <c5/> { "2" }.x SDK kræver den; selve biblioteket <c6/> kræver kun { "1.85" }); Docker-aftrykket kræver ingen.

seg-2f3216082425 = Registrér den hos en klient

seg-1090ae3f689c = Stort set alle MCP-klienter bruger den samme <c1/>-konfigurationsblok — registrér binæren <c2/> med absolut sti:

seg-2da393482666 = Eller med Docker-aftrykket i stedet for en lokal binær (<c1/> er ikke nødvendig):

seg-a4f1295bb27a = Hvor blokken ligger, afhænger af klienten:

seg-154c7e09063d = <b>Cursor</b> — <c1/> (globalt) eller <c2/> (pr. projekt).

seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, indsæt blokken, og genstart derefter IDE'en (integreret udviklingsmiljø) helt.

seg-daf0ea451b11 = <b>Desktop-assistenter</b> — de fleste bruger en <c1/> med den samme <c2/>-form; se din klients dokumentation for filens placering.

seg-fc80286aa9bf = <b>CLI-agenter</b> — mange accepterer den samme JSON via en <c1/> / <c2/>-mekanisme.

seg-9f3ef8d76e05 = Brug altid en absolut sti til binæren. Sæt <c1/> i <c2/> for at fejlfinde (diagnostik går til stderr; stdout er forbeholdt JSON-RPC-protokollen).

seg-283d1eba838a = Prøv det

seg-61739e9b6515 = Når den er registreret, kan du spørge din assistent om ting som:

seg-256276ac933d = <em>"Vis scenarietyperne i Kshana."</em> → <c1/>

seg-2a8e3c76b939 = <em>"Vis mig et Kshana-spektrumeksempel og kør det."</em> → <c1/>, <c2/>, <c3/>

seg-d2e1e4148589 = <em>"Kør clock-holdover-scenariet i Kshana med en tærskel på { "20" } ns og et GNSS-udfald på 2 timer; hvad er holdover for kvante mod klassisk?"</em> → <c1/>

seg-f4b83873e280 = <em>"Eksportér den GPS-konstellation (Global Positioning System) som SP3."</em> → <c1/>

seg-54e01c1af45f = <em>"Giv mig tabellen realtime-frame-eop som CSV."</em> → <c1/>

seg-478e6fa0e8d8 = <em>"Læg den Iridium-overflyvning på en Cesium-globus."</em> → <c1/>, <c2/>

seg-90829388d5d9 = <em>"Animér jamming-kampagnen."</em> → <c1/>

seg-9eb1b97ad2fd = <em>"Giv mig rapporten for den kørsel med dens reproducerbarhedsoptegnelse."</em> → <c1/>

seg-dc60d64a3bb8 = <em>"Lav en GPS L1-scene på ét sekund med PRN'erne { "3" } og { "17" }, og foretag derefter acquisition og tracking af den."</em> → <c1/>, <c2/>, <c3/>, <c4/>

seg-942dc8abe0ec = Designnote — hvorfor en separat crate

seg-ce6d0ecab448 = Serveren er en <b>selvstændig crate uden for workspacet</b> med sin egen <c1/>, så den officielle Rust MCP SDK (software development kit) <c2/> og dens asynkrone runtime aldrig kommer ind i den udgivne crate <c3/>s afhængighedsgraf: en bruger af biblioteket eller Python kompilerer ikke en server, vedkommende ikke kører. (Den blev først skilt ud, fordi <c4/> er <b>edition { "2024" }</b> og kræver rustc ≥ { "1.85" }, mens hovedcraten dengang lovede { "1.75" }. Biblioteket erklærer nu { "1.85" }; denne server erklærer { "1.88" }, gulvet for den sikkerhedspatchede <c5/> { "2" }.x.) Kontinuerlig integration (CI) kontrollerer denne crate for sig selv — tests og <c6/> mod dens lockfile. rmcps licenstræ er rent (Apache-2.0/MIT/BSD), så opdelingen handler, i modsætning til tværvalideringscraten <c7/>, som den ellers afspejler, ikke om licensering.

seg-75bf2d74642d = Licens: kun AGPL-3.0, GNU Affero General Public License version { "3" } alene (eller en kommerciel licens fra Ashforde OÜ; se repositoriets <a1>LICENSING.md</a1>).

seg-490ebbefb561 = <s1>Forrige</s1>Rust-crate

seg-350b6b914734 = <s1>Næste</s1>MCP-server: alle installationskanaler

seg-492888115662 = De { "92" } indbyggede scenarietyper med beskrivelser + obligatoriske/valgfrie felter, så agenten kan konstruere et gyldigt scenarie.

seg-a4a0e399a31e = <c1/> lægger <c2/> på din <c3/> (typisk <c4/>). Serveren taler JSON-RPC (JSON remote procedure call) over stdio; logs går til stderr. Bygning fra kildekode kræver en Rust-toolchain ≥ { "1.88" } (den patchede <c5/> { "2" }.x SDK kræver den, og det gør biblioteket <c6/> også); Docker-aftrykket kræver ingen.

seg-0757e15070d4 = Serveren er en <b>selvstændig crate uden for workspacet</b> med sin egen <c1/>, så den officielle Rust MCP SDK (software development kit) <c2/> og dens asynkrone runtime aldrig kommer ind i den udgivne crate <c3/>s afhængighedsgraf: en bruger af biblioteket eller Python kompilerer ikke en server, vedkommende ikke kører. (Den blev først skilt ud, fordi <c4/> er <b>edition { "2024" }</b> og kræver rustc ≥ { "1.85" }, mens hovedcraten dengang lovede { "1.75" }. Biblioteket og denne server erklærer nu begge { "1.88" }, gulvet for den sikkerhedspatchede <c5/> { "2" }.x og for de opgraderede RustCrypto-crates.) Kontinuerlig integration (CI) kontrollerer denne crate for sig selv — tests og <c6/> mod dens lockfile. rmcps licenstræ er rent (Apache-2.0/MIT/BSD), så opdelingen handler, i modsætning til tværvalideringscraten <c7/>, som den ellers afspejler, ikke om licensering.
