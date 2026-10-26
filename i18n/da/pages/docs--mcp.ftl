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

seg-d51681f30e8f = Én åben motor i midten med MCP-serveren som én af sine overflader ved siden af kommandolinjen, Rust-biblioteket, Python, WebAssembly og Kshana Studio, Docker-imaget og JetBrains-pluginet; alle overflader kører den samme motor, og Kshana Pro afhænger af den uden at forke den

seg-2a56e1f52830 = Værktøjer

seg-b847694d91b5 = Kør et scenarie ud fra en TOML-definition (Tom's Obvious, Minimal Language); returnerer oversigten og hele resultat-JSON (JavaScript Object Notation: kvalitetsmål, kurver). Valgfri <c1/> returnerer diagrammet som SVG (Scalable Vector Graphics).

seg-a30b46501cff = De { "87" } indbyggede scenarietyper med beskrivelser og obligatoriske/valgfrie felter, så agenten kan bygge et gyldigt scenarie.

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
