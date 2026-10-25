# docs--python-api: translations (sv)

seg-5ad814c7ef9e = Anteckningar

seg-2bd2101ce454 = Yta

seg-fffbeccd4266 = Symbol

seg-a129b9e613d0 = Typ

seg-ce0b6a889a87 = Källa: <c1/>

seg-aea4d3625c20 = Kshana levereras med ett förstklassigt programmeringsgränssnitt (API) för Python, byggt med <a1>PyO3</a1> och <a2>maturin</a2>. Dess <c1/>-wheels byggs mot Pythons stabila binärgränssnitt (ABI), så ett wheel per plattform fungerar med CPython ≥ { "3.9" }; wheels täcker Linux, macOS och Windows, var och en för x86-64 och 64-bitars ARM (se <a3>WHEEL_TAGS.md</a3>). En medföljande typstub (<c2/> + <c3/>) ger editorer och <c4/>/<c5/> full typinformation.

seg-8b0ad6639bd5 = Snabbstart

seg-28e092a5a781 = Kör de här kodstyckena från roten av en utcheckad kopia av repot: de läser scenariofiler under <c1/>. NumPy-raden kräver <c2/>.

seg-8c83544270b5 = Signatur

seg-fa90b5cd182b = Returnerar

seg-6f62744a47df = typat resultat (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

seg-67cd4e7f6ad0 = resultatdokumentet som en JSON-sträng (JavaScript Object Notation)

seg-8246b2be7aaf = tillgängliga scenariotyper + metadata (tolkade)

seg-b5ad97d3ec18 = samma metadata som EN JSON-arraysträng, inte en lista (kvar för befintliga anropare; använd <c1/> för den tolkade listan)

seg-8ce669f8e1d0 = felmeddelanden (tom om giltig)

seg-6017d21f52dd = felkategoritagg (<c1/>, <c2/>, <c3/> eller <c4/>), eller <c5/> vid lyckad körning

seg-c62c5ab99132 = motorversion

seg-fdaaf33250d1 = bedöm en verklig mottagarlogg som beskrivs av ett <c1/>-scenario: resultatdokument, förtroende-CSV per epok, diagram och sammanfattning; en <c2/>-tabell lägger till de maritima övervakarna och förtroendepoängen 0–100 med skäl (rådgivande)

seg-0fb76af3d043 = ett begränsat NMEA-utdrag poängsatt på samma sätt som live-läget poängsätter: tillstånd per epok, poäng 0–100 och skäl, en sammanfattning (ingen socket, ingen grind; rådgivande)

seg-6ecd9bb3a1cd = ett fartygs NMEA-logg som en batchkörning: poängmodellen och varje epoks poäng med dess avdrag (rådgivande)

seg-7cd62f15bc3c = den publicerade Jammertest-katalogen och planen som händelser med schemalagd referens (<c1/>, <c2/>); planerade tidsluckor, inte inspelade sändningstider

seg-1e2faf2894e3 = en mottagarlogg poängsatt mot det schemat: fördröjning per test, missade, tid till återhämtning, falsklarm (MODELLED; ett signerat paket kräver kommandoraden)

seg-f94eaef45f04 = ett signerat bevispaket för ett fönster av loggen, i minnet: <c1/>, <c2/>, <c3/> (håll den privat); en teknisk handling, inte ett juridiskt utlåtande

seg-ebd10aea2f6f = verifiera ett paket: hashar, kedja, signatur, eventuellt den betrodda undertecknaren, hela loggen och en tidsstämpel; <c1/> är <c2/>, <c3/> (ingen publik nyckel angiven: intakt, undertecknaren inte fastställd) eller <c4/>

seg-bf13e70f1d5c = CLI:ts <c1/>-artefakter som text

seg-1e5eb44bec6f = vilka interoperabilitetsformat som gäller för ett scenario, utan att köra det

seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> eller <c5/> i minnet: <c6/>, varje fil <c7/> (<c8/>-text eller <c9/>)

seg-bef8250e8453 = en GeoJSON-rutt skriven in i ett scenario med waypoint-spår (<c1/>)

seg-e25bcb6342db = körningens tidsserie som en animerad SVG, en HTML-spelare eller upp till { "120" } SVG-bildrutor: <c1/>

seg-9b24b9cf0510 = de medföljande referensscenarierna och deras TOML

seg-f62c11fe1e7d = bind en RFC { "3161" }-token (bytes eller base64) till ett paket i minnet: <c1/>; paketet måste fortfarande verifieras; myndighetens signatur kontrolleras inte

seg-95fe54b500a7 = en ny signeringsnyckel i minnet: <c1/> (PRIVAT), <c2/>, <c3/>, <c4/>; endast Python

seg-646e6aba13db = spela upp en inspelning igen över olika slingutformningar (<c1/>): stationär jitter, låsningsandelar och C/N0 per utformning och PRN; en förvärvning per PRN, varje kanal på samma samplingar

seg-08d46de5e7cd = beskriv en inspelning, eller varje inspelning i en mapp (läser filer; <c1/> läser dem i sin helhet)

seg-7d9cc8394e65 = ett scenarios fordonsrörelse och händelser för en GNSS-simulator i laboratorium, i minnet: <c1/>; typerna <c2/>, <c3/>, <c4/>; ingen signal skrivs, behåll <c5/> tillsammans med filerna

seg-e215c7242eb2 = kartläggningen mot offentliga ramverk ifylld från resultattexter: <c1/> är en lista med <c2/>-dictar (text, högst { "64" }); returnerar <c3/>; varje rads <c4/> anger att körningarna ger belägg för dess förmågor, inte att ett ramverk uppfylls; ta med <c5/> vid all visning

seg-18d57e4920dd = de statiska kartläggningstabellerna (eller källdokumenten) som Markdown, med uttalandet först

seg-8284e10dce6a = standardpaketen (id, titel, ramverk, antal tester) och ett meddelande; ett paket mäter modellerade scenarier mot trösklar som angavs före körningen

seg-ce6b819604a9 = en paketkörning: varje test <c1/>, <c2/> eller <c3/> med uppmätta och förväntade värden, plus rapporten som Markdown under <c4/>; ger <c5/> för ett okänt id

seg-0f701bc523c6 = LunaNet AFS-implementationen kontrollerad mot de tryckta tabellerna och de genomräknade exemplen i LSIS-AFS V1.0 (trösklarna B1 till B10; B4 redovisar ett fastställt misslyckande)

seg-82aecf261c46 = en AFS-symbolström (text med { "0" } och { "1" }) kontrollerad för synkmönster, SB1-avkodning, FID, TOI-kontinuitet och avstånd; LDPC och CRC-24Q för delramarna { "2" } till { "4" } verifieras inte

seg-f72ab45ae10b = en testsymbolström med platshållardelramar (inte en vågform)

seg-1da34527bb64 = det signerade laboratoriepaketet för tur och retur som länkar scenario, testvillkor (<c1/>), mottagarlogg och poäng via hash; som <c2/>

seg-dd3726fec672 = en resultatfil från kshana-bench (JSON-text) utifrån en referensfil och en prediktionsfil; MODELLED

seg-b82a110c324c = resultatfiler från kshana-bench renderade som den statiska resultattavlan (HTML)

seg-58b8aa919eaf = Galileo OSNMA-autentisering av I/NAV-sidor eller en UBX-ström i minnet: dicten som <c1/> skriver ut, med det rådgivande meddelandet i fältet <c2/>; endast rådgivande, inte en integritetstjänst för navigering

seg-15e4601cd88c = de satelliter en plats ser under en azimutberoende horisontlinje: per satellit <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, kofaktorn och kovariansen i öst-nord-upp samt de horisontella felellipserna; <c3/> är JSON- eller TOML-text eller en dict (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); synlighetsbeslutet och ellipsen kontrolleras mot oberoende bibliotek, resten är MODELLED, och resultatet bär det rådgivande meddelandet (<c14/>, <c15/> anger om himlen är representativ eller kommer från elementmängder)

seg-51ac7cd68154 = <c1/> ({ "1" } till { "5000" }) fördelade minsta kvadratfel för den synliga mängden i <c2/>, med deras empiriska kovarians, RMS och andelen inom { "95" } %-ellipsen

seg-8bba3099379a = förinställningarna för horisontlinjer (<c1/>, <c2/>, <c3/>, <c4/>) med sin etikett REPRESENTATIVE, sin proveniens och avskärmningen för varje azimutgrad; representativa geometrier, inte uppmätningar

seg-f900de61f6e9 = ett horisontlinjeavsnitt (tabell, gatukanjon, sektorer, terräng) reducerat till den normaliserade tabellen med 360 poster som motorn använder

seg-824f3c5951fa = skyplotten för <c1/> som statisk SVG-text

seg-0ffb65c8f5f3 = en förtroendeström (<c1/>) eller ett <c2/>-resultat som Prometheus-text, syslog-rader i CEF eller LEEF eller en OTLP-JSON-nyttolast, med kodarna för <c3/>; ingenting skickas och ingen klocka läses (syslog-rader bär ingen tidsstämpel)

seg-c1ab3dbbe2f2 = en störningskarta för GNSS ur ADS-B- eller AIS-CSV-text: en dict per UTC-dag med <c1/> GeoJSON (endast aggregerat; en försämrad cell pekar inte ut störning som orsak)

seg-ff4bc7fdbce7 = andelen av en rutt som går genom försämrade celler i dessa kartor, som JSON-text (ingen prognos; celler utan observationer är inget belägg för en fri rutt)

seg-d70bccba0e03 = syntetisk NMEA för bryggan vid besättningsträning plus instruktörsloggen (<c1/>, <c2/>, <c3/>); endast text, aldrig för ett fartygs levande navigeringssystem

seg-3fe13851ac82 = namnen på GNSS-IQ-signaler som <c1/>, <c2/> och <c3/> accepterar (<c4/>, <c5/>, <c6/>, ...)

seg-50bf4ad4e23a = en GNSS-IQ-scen med flera satelliter i minnet: <c1/> / <c2/> och <c3/> per epok

seg-b3199839a37c = detsamma, men med varje GPS-satellit i geometrin enligt sänd efemerid ur ett RINEX-navigeringsmeddelande (Receiver Independent Exchange Format)

seg-8f0f9efea46b = FFT-förvärvning (snabb Fouriertransform) av varje PRN (pseudoslumpkod): Doppler, kodfas, statistik, tröskel

seg-3bf994f3f1bf = hela förvärvningsytan för en PRN (<c1/>): <c2/> korrelationseffekt, toppen och två finjusteringar av Doppler (<c3/>, <c4/>)

seg-393572e31421 = förvärva och sedan följa varje PRN: Doppler, kodfas, låsindikatorer, C/N0 och prompt-korrelator per epok

seg-bc39efdb015a = mottagarens frontändekedja (bandpass, notch, blankning, excision, AGC (automatisk förstärkningsreglering), kvantiserare) över komplexa samplingar

seg-ead1b81c712f = anpassa modellen för förlorad låsning i följeslingan till en förtroendetidslinje för en mottagare (ett <c1/>-scenario)

seg-0ab8531d0465 = tolka en <c1/>-fil (en sökväg eller TOML-text) till dess lösta utformningar, var och en med sitt <c2/> och <c3/>; <c4/> vid en ogiltig fil

seg-9c3467d4451e = läs en binär fil med följeepoker (<c1/>, så som <c2/> skriver den): <c3/> och en dict per epok i <c4/>

seg-469303e33d2a = IQ-detektionsövervakarna över en inspelning i ett enda strömmande pass (<c1/>): <c2/>, <c3/>, <c4/> och <c5/>; läser en fil

seg-bb5c5008f1a8 = validera en testvillkorsfil för laboratorium (<c1/>, TOML eller JSON, en sökväg eller text) och returnera den löst, med dess <c2/>

seg-d2441bf762b4 = kör en kampanj med uppspelning i laboratorium (<c1/>) till <c2/> så som <c3/> gör; färdiga celler hoppas över; returnerar antalet celler, misslyckanden och <c4/> när varje cell är klar

seg-7b6d264d9c7f = bygg om en kampanjs resultatkort, HTML-rapport och digest från dess celler: antalet celler och rader, raderna som missar en tröskel och <c1/>

seg-e3956268cf1c = Signaturer för GNSS-IQ och mottagarförtroende

seg-817bd0898d46 = De fullständiga signaturerna, så som <c1/> anger dem (varje nyckelord efter de obligatoriska argumenten har ett standardvärde; docstringarna i stubben anger vad vart och ett betyder). Omslut listorna <c2/> / <c3/> och indata <c4/> / <c5/> med <c6/> för arrayer.

seg-2dd9323829ce = En kampanj med uppspelning i laboratorium från Python, därefter dess rapport (kampanjfilen och dess inspelningar är dina; en färdig cell hoppas över vid nästa anrop; <c1/> läser en följeepokfil som en <c2/>-körning skrev):

seg-5f48b88438df = <c1/>:s <c2/> anger hur många kodperioder förvärvningen vid överlämningen integrerar koherent. Från { "0.33.0" } är standardvärdet <c3/>, vilket betyder automatiskt: omkring { "4" } ms ({ "4" } perioder för en kod på { "1" } ms som GPS L1 C/A, { "1" } för en kod på { "4" } ms eller längre), så att kanalen startar tillräckligt nära för att frekvensslingan ska kunna dra in; <c4/> behåller sökningen med en period från { "0.32" }.

seg-012a83181bd3 = Typer

seg-0b4f4c6c6014 = <c1/> typar de slutna vokabulärerna för kontrollverktyg (mypy, pyright): <c2/> (varje typnamn, en <c3/>), <c4/> (de fyra taggarna som <c5/> returnerar), <c6/>, samt <c7/>-typerna <c8/> (vad <c9/> returnerar en lista av) och <c10/> (en post i ett resultats <c11/>-block, som utvidgar basen med obligatoriska nycklar <c12/>). De finns bara för typkontroll och kan inte importeras vid körning; <c13/> håller dem lika med motorns listor.

seg-b5ad0d8e1456 = Medlem

seg-2698ab8436e6 = fullständigt resultatdokument (JSON)

seg-7eccc8361120 = fristående diagram-SVG (Scalable Vector Graphics)

seg-38c8d20ca07a = sammanfattning på en rad för människor

seg-e21e82ad3fe8 = reproducerbarhetstabellen, för de typer som ger en (se nedan)

seg-aadcc1cc4c79 = resultatet tolkat till en Python-dict (se anmärkningen om formen nedan)

seg-409504363c4c = den numeriska listan vid <c1/> (punktavgränsad, <c2/>, eller en JSON Pointer, <c3/>): 1-D för tal, 2-D för numeriska listor av samma längd

seg-b6d5d7e5271a = listan med poster vid <c1/> (en tidsserie), en array per fält som är ett tal i varje post

seg-adb2d15f9f74 = varje lista med poster som har ett numeriskt fält, med punktsökväg som nyckel, var och en som <c1/>

seg-7f053ad96880 = skriv den tabellen till <c1/>; returnerar antalet skrivna bytes, eller { "0" } (och skriver ingenting) när typen inte ger någon tabell

seg-276104139e73 = Reproducerbarhetstabellen

seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> och <c5/> publicerar alltid en tabell; <c6/> publicerar en när en exportplats (<c7/> + <c8/>) är konfigurerad. Varje annan typ returnerar <c9/>. Texten är samma bytes som CLI (kommandoraden) skriver som <c10/>, så en granskare som återskapar en publicerad tabell från wheel-filen aldrig behöver gå ner till kommandoraden:

seg-3ad2987110ee = Resultatets form

seg-57c7066d3522 = Kvalitetsmåtten och tidsserierna finns <b>per sida i körningen</b>, inte på högsta nivån. För en klockkörning ser dokumentet ut så här:

seg-cb19f961de2b = så kvalitetsmåtten är <c1/>, aldrig <c2/>. Andra typer ger egna paket; den fullständiga referensen per fält, med enheter och en källhänvisning, är <a1><c3/></a1> och läsarens guide är <a2><c4/></a2>.

seg-bfd984e0407b = <c1/> och <c2/> <b>kör</b> scenariot, så de visar fel vid tolkning, konfiguration <em>och</em> körning. De ger aldrig upphov till ett undantag.

seg-0ca0a1da8356 = <c1/> / <c2/> ger <c3/> vid ett ogiltigt scenario.

seg-901c2ede0cd0 = Resultaten är reproducerbara: ett scenario bär sitt <c1/> och motorn registrerar en <c2/>, så samma indata ger identiska utdata byte för byte på samma plattform (se <a1><c3/></a1>).

seg-8c0c32fcba2b = <c1/>, <c2/> och <c3/> returnerar exakt <c4/> av samma värden som <c5/> ger (samma dtype, bitidentiskt; <c6/>). De importerar NumPy när de anropas och ger <c7/> utan det; NumPy ingår inte i paketets krav vid körning. <c8/> betyder att sökvägen saknas, <c9/> att värdet där inte är en numerisk array (eller inte en lista med poster). Körbara notebooks finns i <a1><c10/></a1>.

seg-00a3cf088cde = Inte i Python: långvariga processer

seg-3780dd4973f0 = <c1/> (en strömprocess med en grind och en valfri TCP-server med <c2/>) och telemetriexportörerna (Prometheus, OTLP, syslog; <c3/>) samt strömning med <c4/> finns bara på kommandoraden: en bindning returnerar när anropet returnerar och håller ingen socket öppen. Python täcker batchformen av var och en: <c5/> för en logg, <c6/> för ett strömutdrag (poäng och tillstånd; grinden tillämpas inte), <c7/> för den genererade texten.

seg-82379c29d438 = <s1>Föregående</s1>Kallatomsinterferometer

seg-4a457afc63fb = <s1>Nästa</s1>npm och WebAssembly

seg-dbbce10a12d2 = RunOutput
