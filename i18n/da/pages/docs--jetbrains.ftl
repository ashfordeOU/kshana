# docs--jetbrains: translations (da)

seg-f8a0fe9968c4 = Kilde: <c1/>

seg-c55e49fd2a72 = Kshana til JetBrains IDE'er

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> på JetBrains Marketplace</a1> — eller i en hvilken som helst JetBrains IDE: <em>Settings → Plugins → Marketplace → search "Kshana"</em>.

seg-959ab829762c = Et native plugin, der kører PNT-robusthedssimulatoren <b>Kshana</b> inde fra en hvilken som helst JetBrains IDE (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Højreklik på et scenarie <c1/> → <b>Run Kshana Scenario</b>; kvalitetsmålene og resultat-JSON strømmer ind i værktøjsvinduet <b>Kshana</b>.

seg-594199d2ce06 = Supplerer <a1>MCP-serveren</a1> (som giver JetBrains <em>AI Assistant</em> adgang til Kshana): dette plugin er den <em>menneskelige</em> vej med peg og klik.

seg-a356f2c30afb = Handlingen <b>Run Kshana Scenario</b> på enhver <c1/> (kontekstmenuer i editor og projektvisning) — kører <c2/> og viser outputtet i værktøjsvinduet Kshana.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> på et scenarie <c1/> <c2/> (<c3/>): tillidstidslinjen med en score fra 0 til 100 og begrundelser for et fartøj. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> på et <c1/> <c2/> (<c3/>): syntetisk NMEA fra broen og en instruktørlog, skrevet ved siden af scenariet. Kun tekst; til træning, aldrig til et fartøjs levende navigationssystemer.

seg-99510426a384 = <b>Build Interference Map</b> på en ADS-B- eller AIS-<c1/> (projektvisning; spørger, hvilket godkendt datasæt det er) og <b>Route Exposure</b> på en rutefil (spørger efter mappen med kort). En forringet celle identificerer ikke interferens som årsag; ikke en prognose.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> på et scenarie <c1/> (<c2/>): køretøjets bevægelse, NMEA og mærkede hændelser til en GNSS-simulator i laboratoriet, skrevet ved siden af scenariet. Det skriver intet signal; kør kun en simulator, hvor det er tilladt.

seg-79c553c303c5 = <b>Build Compliance Report</b> på et kørselsresultat <c1/> (<c2/>) og <b>Tools → Show Compliance Mapping</b> (<c3/>): afbildningen på offentlige rammeværker, vist med motorens egen erklæring ord for ord.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> på en mappe med en bevispakke (projektvisning; <c1/>): spørger efter underskriverens offentlige nøgle ({ "64" } hex-cifre eller en fil <c2/>; altid fastlåst, pluginet accepterer aldrig en ufastlåst underskriver) og eventuelt den fulde sessionslog. Kun et verificeret resultat læses som verificeret; en intakt pakke med en ufastlåst underskriver læses som "NOT VERIFIED".

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> på et resultat <c1/> <c2/> (<c3/>): Prometheus-tekst, syslog-hændelser i CEF/LEEF eller MQTT-linjer til Home Assistant, udskrevet i Kshana-vinduet. Intet sendes eller serveres; de kørende eksportører bliver på kommandolinjen.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> på en IMU <c1/> i hvile (<c2/>): accelerometer- og gyroparametrene for scenarierne <c3/> og <c4/> tilpasset med Allan-afvigelse, udskrevet i Kshana-vinduet som en tabel <c5/>. Intet skrives; tilpasningen er MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menuen Tools; <c2/>) og <b>Assess Receiver Stream</b> (en fartøjssession <c3/> plus en gemt NMEA-log, du vælger; <c4/>, bedømt én gang uden socket og uden gate).

seg-38037d36639c = <b>Insert Example Scenario</b> (mappe i projektvisning eller menuen Tools; <c1/>): vælg et medfølgende scenarie, så skrives det som en ny <c2/> (aldrig oven på en fil). <b>Export Scenario</b> på en <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; kun simuleret output), <b>Animate Scenario</b> (HTML eller SVG, åbnet i browseren) og <b>Import Route</b> på en rute <c4/> (spørger, hvilket scenarie).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> på en session for modtagertillid <c1/> (<c2/>): spørger efter vinduet, en signeringsnøglefil, du allerede har, og outputmappen. Pluginet laver, læser eller gemmer aldrig en nøgle (<c3/> bliver på kommandolinjen). <b>Attach Timestamp</b> på en pakkemappe (<c4/>): Kshana kontrollerer ikke tidsstempelmyndighedens signatur; kør <c5/> selv.

seg-f4f6605d3db9 = Fortsat kun på kommandolinjen: IQ-kommandoerne, <c1/> og <c2/>.

seg-63efd04104f1 = Et værktøjsvindue <b>Kshana</b> nederst, der rummer kørselskonsollen.

seg-decda07aa7eb = Ikke i pluginet: <c1/> (en langvarig strømproces med en gate og en valgfri TCP-lytter) og <c2/> bliver på kommandolinjen, fordi en IDE-handling kører en kommando til ende og viser dens output; se <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> for at pege på binæren <c1/> (tom → findes via <c2/>; installér med <c3/>).

seg-44dfdd65bd0a = Pluginet er rent platformsbaseret (ingen sprogspecifikke afhængigheder), så det indlæses i alle JetBrains IDE'er fra build { "243" } ({ "2024.3" }) og nyere.

seg-453bd42c23fa = Byg og kør

seg-b5328f8c7a8a = Kræver JDK { "17" }+ (buildet fastlåser JDK { "21" }) og den medfølgende Gradle-wrapper.

seg-758124ceb1c7 = <c1/> kontrollerer som standard since-build, { "2024.3" }. Hvis du vil kontrollere andre linjer, så angiv dem som <c2/> (hver IDE er en download på ca. { "1" } GB):

seg-15d175aaeb59 = Pluginet bruger ingen forældede platform-API'er eller API'er, der er planlagt fjernet, på nogen af dem; bevar det sådan (en valgdialog går gennem <c1/>, ikke <c2/>).

seg-39cfd740d9b3 = Installér den byggede zip via <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Opbygning

seg-73b3f55b7208 = Isolation

seg-a14db8de576a = Som <c1/> og <c2/> er dette et selvstændigt Gradle-projekt, udeladt fra den publicerede crate <c3/> (<c4/> i pakkens <c5/>); dets build-output er gitignoreret.

seg-b38914a430b9 = Licens: AGPL-3.0-only (eller en kommerciel licens fra Ashforde OÜ — se repositoriets <c1/>).

seg-bb286e3ce9c9 = <s1>Forrige</s1>Hvor hver funktion kan nås

seg-e62586b5f58c = <s1>Næste</s1>Hvor Kshana kører
