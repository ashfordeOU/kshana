# docs--jetbrains: translations (sv)

seg-f8a0fe9968c4 = Källa: <c1/>

seg-c55e49fd2a72 = Kshana för JetBrains IDE:er

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> på JetBrains Marketplace</a1> — eller, i valfri JetBrains IDE, <em>Settings → Plugins → Marketplace → sök efter "Kshana"</em>.

seg-959ab829762c = Ett inbyggt tillägg som kör PNT-resilienssimulatorn <b>Kshana</b> inifrån valfri JetBrains IDE (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Högerklicka på ett scenario <c1/> → <b>Run Kshana Scenario</b>; kvalitetsmåtten och resultat-JSON strömmar in i verktygsfönstret <b>Kshana</b>.

seg-594199d2ce06 = Kompletterar <a1>MCP-servern</a1> (som ger JetBrains <em>AI Assistant</em> åtkomst till Kshana): det här tillägget är den <em>mänskliga</em> peka-och-klicka-vägen.

seg-a356f2c30afb = Åtgärden <b>Run Kshana Scenario</b> på valfri <c1/> (snabbmenyer i editor och projektvy) — kör <c2/> och visar utdata i verktygsfönstret Kshana.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> på ett <c1/>-scenario <c2/> (<c3/>): förtroendetidslinjen, med en poäng på 0-100 och skäl för ett fartyg. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> på ett <c1/> <c2/> (<c3/>): syntetisk brygg-NMEA och en instruktörslogg, skrivna bredvid scenariot. Endast text; för utbildning, aldrig för ett fartygs levande navigationssystem.

seg-99510426a384 = <b>Build Interference Map</b> på en ADS-B- eller AIS-<c1/> (projektvy; frågar vilken av de tillåtna datamängderna det är) och <b>Route Exposure</b> på en ruttfil (frågar efter mappen med kartor). En degraderad cell identifierar inte störning som orsak; inte en prognos.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> på ett scenario <c1/> (<c2/>): fordonsrörelse, NMEA och märkta händelser för en GNSS-simulator i laboratorium, skrivna bredvid scenariot. Den skriver ingen signal; kör en simulator bara där det är tillåtet.

seg-79c553c303c5 = <b>Build Compliance Report</b> på ett körningsresultat <c1/> (<c2/>) och <b>Tools → Show Compliance Mapping</b> (<c3/>): kopplingen till det offentliga ramverket, visad med motorns egen formulering ordagrant.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> på en mapp med bevispaket (projektvy; <c1/>): frågar efter signerarens publika nyckel ({ "64" } hexadecimala siffror eller en <c2/>-fil; alltid fastlåst, tillägget godtar aldrig en signerare som inte är fastlåst) och eventuellt hela sessionsloggen. Bara ett verifierat resultat visas som verifierat; ett intakt paket med en signerare som inte är fastlåst visas som "NOT VERIFIED".

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> på ett <c1/>-resultat <c2/> (<c3/>): Prometheus-text, CEF/LEEF-syslog-händelser eller Home Assistant MQTT-rader som skrivs ut i Kshana-fönstret. Inget skickas eller serveras; de exportörer som körs finns kvar på kommandoraden.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> på en stillastående IMU <c1/> (<c2/>): accelerometerns och gyrots parametrar för scenarierna <c3/> och <c4/> anpassade med Allan-deviation, utskrivna i Kshana-fönstret som en <c5/>-tabell. Inget skrivs; anpassningen är MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menyn Tools; <c2/>) och <b>Assess Receiver Stream</b> (en fartygssession <c3/> plus en lagrad NMEA-logg som du väljer; <c4/>, poängsatt en gång utan socket och utan spärr).

seg-38037d36639c = <b>Insert Example Scenario</b> (mapp i projektvyn eller menyn Tools; <c1/>): välj ett medföljande scenario så skrivs det som en ny <c2/> (aldrig över en fil). <b>Export Scenario</b> på en <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; endast simulerade utdata), <b>Animate Scenario</b> (HTML eller SVG, öppnas i webbläsaren) och <b>Import Route</b> på en rutt <c4/> (frågar vilket scenario).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> på en receiver-trust-session <c1/> (<c2/>): frågar efter fönstret, en signeringsnyckelfil som du redan har och utdatamappen. Tillägget skapar, läser eller lagrar aldrig en nyckel (<c3/> finns kvar på kommandoraden). <b>Attach Timestamp</b> på en paketmapp (<c4/>): Kshana kontrollerar inte tidsstämplingsmyndighetens signatur; kör <c5/> själv.

seg-f4f6605d3db9 = Finns fortfarande bara på kommandoraden: IQ-kommandona, <c1/> och <c2/>.

seg-63efd04104f1 = Ett verktygsfönster <b>Kshana</b> längst ned som rymmer körkonsolen.

seg-decda07aa7eb = Finns inte i tillägget: <c1/> (en långkörande strömprocess med en spärr och en valfri TCP-lyssnare) och <c2/> finns kvar på kommandoraden, eftersom en IDE-åtgärd kör ett kommando till slut och visar dess utdata; se <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> för att peka ut binärfilen <c1/> (tomt → hittas via <c2/>; installera med <c3/>).

seg-44dfdd65bd0a = Tillägget är rent plattformsbaserat (inga språkspecifika beroenden), så det laddas i varje JetBrains IDE med bygge { "243" } ({ "2024.3" }) och nyare.

seg-453bd42c23fa = Bygg och kör

seg-b5328f8c7a8a = Kräver JDK { "17" }+ (bygget fäster JDK { "21" }) och den medföljande Gradle-wrappern.

seg-758124ceb1c7 = <c1/> kontrollerar since-build, { "2024.3" }, som standard. För att kontrollera andra versioner, lista dem som <c2/> (varje IDE är en nedladdning på cirka { "1" } GB):

seg-15d175aaeb59 = Tillägget använder inget föråldrat plattforms-API eller något som är schemalagt för borttagning i någon av dem; behåll det så (en valdialog går via <c1/>, inte <c2/>).

seg-39cfd740d9b3 = Installera det byggda zip-arkivet via <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Layout

seg-73b3f55b7208 = Isolering

seg-a14db8de576a = Liksom <c1/> och <c2/> är det här ett fristående Gradle-projekt, undantaget från den publicerade craten <c3/> (<c4/> i paketets <c5/>); dess byggutdata ignoreras av git.

seg-b38914a430b9 = Licens: AGPL-3.0-only (eller en kommersiell licens från Ashforde OÜ — se förvarets <c1/>).

seg-bb286e3ce9c9 = <s1>Föregående</s1>Var varje förmåga är nåbar

seg-e62586b5f58c = <s1>Nästa</s1>Var Kshana körs
