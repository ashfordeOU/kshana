# docs--jetbrains: translations (nb)

seg-f8a0fe9968c4 = Kilde: <c1/>

seg-c55e49fd2a72 = Kshana for JetBrains IDE-er

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> på JetBrains Marketplace</a1>, eller, i en hvilken som helst JetBrains IDE, <em>Settings → Plugins → Marketplace → søk etter «Kshana»</em>.

seg-959ab829762c = Et native programtillegg som kjører <b>Kshana</b>-simulatoren for PNT-robusthet fra innsiden av en hvilken som helst JetBrains IDE (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Høyreklikk et scenario <c1/> → <b>Run Kshana Scenario</b>; kvalitetsmålene og resultat-JSON strømmer inn i verktøyvinduet <b>Kshana</b>.

seg-594199d2ce06 = Utfyller <a1>MCP-serveren</a1> (som gir JetBrains <em>AI Assistant</em> tilgang til Kshana): dette programtillegget er den <em>menneskelige</em> pek-og-klikk-veien.

seg-a356f2c30afb = Handlingen <b>Run Kshana Scenario</b> på en hvilken som helst <c1/> (kontekstmenyene i editor og prosjektvisning): kjører <c2/> og viser utdataene i verktøyvinduet Kshana.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> på et <c1/>-scenario <c2/> (<c3/>): tillitstidslinjen, med en score fra 0 til 100 og begrunnelser for et fartøy. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> på et <c1/> <c2/> (<c3/>): syntetisk bro-NMEA og en instruktørlogg, skrevet ved siden av scenarioet. Bare tekst; til trening, aldri for et fartøys live navigasjonssystemer.

seg-99510426a384 = <b>Build Interference Map</b> på en ADS-B- eller AIS-<c1/> (prosjektvisning; spør hvilket klarert datasett det er) og <b>Route Exposure</b> på en rutefil (spør etter mappen med kart). En degradert celle identifiserer ikke interferens som årsak; ikke en prognose.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> på et scenario <c1/> (<c2/>): kjøretøybevegelse, NMEA og merkede hendelser for en GNSS-simulator i laboratorium, skrevet ved siden av scenarioet. Den skriver intet signal; kjør en simulator bare der det er tillatt.

seg-79c553c303c5 = <b>Build Compliance Report</b> på et kjøringsresultat <c1/> (<c2/>) og <b>Tools → Show Compliance Mapping</b> (<c3/>): kartleggingen mot offentlige rammeverk, vist med motorens egen erklæring ord for ord.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> på en mappe med bevispakke (prosjektvisning; <c1/>): spør etter signerens offentlige nøkkel ({ "64" } heksadesimale sifre eller en <c2/>-fil; alltid festet, programtillegget godtar aldri en signer som ikke er festet) og eventuelt hele øktloggen. Bare et verifisert resultat leses som verifisert; en intakt pakke med en signer som ikke er festet leses «NOT VERIFIED».

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> på et <c1/>-resultat <c2/> (<c3/>): Prometheus-tekst, CEF/LEEF-syslog-hendelser eller Home Assistant MQTT-linjer skrevet ut i Kshana-vinduet. Ingenting sendes eller serveres; de kjørende eksportørene blir på kommandolinjen.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> på en stasjonær IMU-<c1/> (<c2/>): akselerometer- og gyroparametrene i scenarioene <c3/> og <c4/> tilpasset med Allan-deviasjon, skrevet ut i Kshana-vinduet som en <c5/>-tabell. Ingenting skrives; tilpasningen er MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (Tools-menyen; <c2/>) og <b>Assess Receiver Stream</b> (en fartøyøkt <c3/> pluss en lagret NMEA-logg du velger; <c4/>, poengsatt én gang uten socket og uten gate).

seg-38037d36639c = <b>Insert Example Scenario</b> (mappe i prosjektvisning eller Tools-menyen; <c1/>): velg et medfølgende scenario, så skrives det som en ny <c2/> (aldri over en eksisterende fil). <b>Export Scenario</b> på en <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; bare simulerte utdata), <b>Animate Scenario</b> (HTML eller SVG, åpnet i nettleseren) og <b>Import Route</b> på en rute-<c4/> (spør hvilket scenario).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> på en økt for mottakertillit <c1/> (<c2/>): spør etter vinduet, en signeringsnøkkelfil du allerede har, og utdatamappen. Programtillegget lager, leser eller lagrer aldri en nøkkel (<c3/> blir på kommandolinjen). <b>Attach Timestamp</b> på en pakkemappe (<c4/>): Kshana kontrollerer ikke signaturen til tidsstempelautoriteten; kjør <c5/> selv.

seg-f4f6605d3db9 = Fortsatt bare på kommandolinjen: IQ-kommandoene, <c1/> og <c2/>.

seg-63efd04104f1 = Et <b>Kshana</b>-verktøyvindu nederst som rommer kjørekonsollen.

seg-decda07aa7eb = Ikke i programtillegget: <c1/> (en langvarig strømprosess med en gate og en valgfri TCP-lytter) og <c2/> blir på kommandolinjen, fordi en IDE-handling kjører en kommando til den er ferdig og viser utdataene; se <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> for å peke på binærfilen <c1/> (tom → løses fra <c2/>; installer med <c3/>).

seg-44dfdd65bd0a = Programtillegget er rent plattformbasert (ingen språkspesifikke avhengigheter), så det lastes i alle JetBrains IDE-er fra build { "243" } ({ "2024.3" }) og nyere.

seg-453bd42c23fa = Bygg og kjør

seg-b5328f8c7a8a = Krever JDK { "17" }+ (bygget fester JDK { "21" }) og den medfølgende Gradle-wrapperen.

seg-758124ceb1c7 = <c1/> kontrollerer som standard since-build, { "2024.3" }. For å kontrollere andre linjer, list dem som <c2/> (hver IDE er en nedlasting på omtrent { "1" } GB):

seg-15d175aaeb59 = Programtillegget bruker ingen utfasede plattform-API-er, eller API-er som er planlagt fjernet, på noen av disse; hold det slik (en valgdialog går gjennom <c1/>, ikke <c2/>).

seg-39cfd740d9b3 = Installer den bygde zip-filen via <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Oppbygning

seg-73b3f55b7208 = Isolasjon

seg-a14db8de576a = Som <c1/> og <c2/> er dette et selvstendig Gradle-prosjekt, utelatt fra den publiserte <c3/>-cratet (<c4/> i pakken <c5/>); byggeutdataene er gitignorert.

seg-b38914a430b9 = Lisens: AGPL-3.0-only (eller en kommersiell lisens fra Ashforde OÜ, se repositoriets <c1/>).

seg-bb286e3ce9c9 = <s1>Forrige</s1>Hvor hver funksjon er tilgjengelig

seg-e62586b5f58c = <s1>Neste</s1>Hvor Kshana kjører
