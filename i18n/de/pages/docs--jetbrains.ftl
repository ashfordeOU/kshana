# docs--jetbrains: translations (de)

# text
# c1: ide/jetbrains/README.md
seg-f8a0fe9968c4 = Quelle: <c1/>

# text
seg-c55e49fd2a72 = Kshana für JetBrains-IDEs

# text
seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> im JetBrains Marketplace</a1> — oder in jeder JetBrains-IDE <em>Settings → Plugins → Marketplace → nach „Kshana“ suchen</em>.

# text
# c1: .toml
seg-959ab829762c = Ein natives Plugin, das den PNT-Resilienz-Simulator <b>Kshana</b> aus jeder JetBrains-IDE heraus ausführt (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Klicken Sie mit der rechten Maustaste auf ein Szenario <c1/> → <b>Run Kshana Scenario</b>; die Gütemaße und das Ergebnis-JSON laufen in das Werkzeugfenster <b>Kshana</b>.

# text
seg-594199d2ce06 = Ergänzt den <a1>MCP-Server</a1> (der dem JetBrains-<em>AI Assistant</em> Zugriff auf Kshana gibt): Dieses Plugin ist der <em>menschliche</em> Weg per Zeigen und Klicken.

# text
# c1: .toml
# c2: kshana <file>
seg-a356f2c30afb = Aktion <b>Run Kshana Scenario</b> auf jeder <c1/> (Kontextmenüs von Editor und Projektansicht) — führt <c2/> aus und zeigt die Ausgabe im Werkzeugfenster Kshana.

# text
# c1: receiver-trust
# c2: .toml
# c3: kshana receiver-trust
seg-116d04ae5538 = <b>Assess Receiver Trust</b> auf einem Szenario <c1/> <c2/> (<c3/>): der Vertrauensverlauf, mit einem Wert von 0-100 und Gründen für ein Schiff. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
# c1: nmea-scenario
# c2: .toml
# c3: kshana nmea-scenario
seg-726d88d0dea7 = <b>Generate Training NMEA</b> auf einem <c1/> <c2/> (<c3/>): synthetisches Brücken-NMEA und ein Ausbilderprotokoll, neben dem Szenario geschrieben. Nur Text; für Training, nie für die laufenden Navigationssysteme eines Schiffes.

# text
# c1: .csv
seg-99510426a384 = <b>Build Interference Map</b> auf einer ADS-B- oder AIS-<c1/> (Projektansicht; fragt, um welchen zugelassenen Datensatz es sich handelt) und <b>Route Exposure</b> auf einer Routendatei (fragt nach dem Ordner der Karten). Eine beeinträchtigte Zelle weist Störung nicht als Ursache nach; keine Vorhersage.

# text
# c1: .toml
# c2: kshana bench-export
seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> auf einem Szenario <c1/> (<c2/>): Fahrzeugbewegung, NMEA und beschriftete Ereignisse für einen GNSS-Simulator im Labor, neben dem Szenario geschrieben. Es schreibt kein Signal; betreiben Sie einen Simulator nur dort, wo es genehmigt ist.

# text
# c1: .json
# c2: kshana compliance-report
# c3: kshana compliance-report --mapping
seg-79c553c303c5 = <b>Build Compliance Report</b> auf einem Laufergebnis <c1/> (<c2/>) und <b>Tools → Show Compliance Mapping</b> (<c3/>): die Zuordnung zu öffentlichen Rahmenwerken, gezeigt mit der eigenen Aussage der Engine Wort für Wort.

# text
# c1: kshana evidence verify
# c2: .pub
seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> auf einem Nachweispaket-Ordner (Projektansicht; <c1/>): fragt nach dem öffentlichen Schlüssel des Signierenden ({ "64" } Hexziffern oder eine <c2/>-Datei; immer gepinnt, das Plugin akzeptiert nie einen ungepinnten Signierenden) und optional nach dem vollständigen Sitzungsprotokoll. Nur ein verifiziertes Ergebnis gilt als verifiziert; ein intaktes Paket mit ungepinntem Signierenden wird als „NOT VERIFIED“ angezeigt.

# text
# c1: receiver-trust
# c2: .json
# c3: kshana trust-telemetry --result
seg-253d5b7f94ce = <b>Render Trust Telemetry</b> auf einem Ergebnis <c2/> der Art <c1/> (<c3/>): Prometheus-Text, CEF/LEEF-Syslog-Ereignisse oder Home-Assistant-MQTT-Zeilen, im Kshana-Fenster ausgegeben. Nichts wird gesendet oder bereitgestellt; die laufenden Exporter bleiben auf der Kommandozeile.

# text
# c1: .csv
# c2: kshana imu-fit
# c3: hybrid
# c4: fusion
# c5: [accel_classical]
seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> auf einer ruhenden IMU-<c1/> (<c2/>): die Beschleunigungsmesser- und Gyroparameter der Szenarien <c3/> und <c4/>, durch die Allan-Abweichung angepasst, als Tabelle <c5/> im Kshana-Fenster ausgegeben. Nichts wird geschrieben; die Anpassung ist MODELLED.

# text
# c1: kshana example
# c2: .toml
# c3: .toml
# c4: .geojson
seg-38037d36639c = <b>Insert Example Scenario</b> (Ordner der Projektansicht oder Menü Tools; <c1/>): Wählen Sie ein mitgeliefertes Szenario, und es wird als neue <c2/> geschrieben (nie über eine Datei). <b>Export Scenario</b> auf einer <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; nur simulierte Ausgabe), <b>Animate Scenario</b> (HTML oder SVG, im Browser geöffnet) und <b>Import Route</b> auf einer Route <c4/> (fragt, welches Szenario).

# text
# c1: .toml
# c2: kshana receiver-trust evidence
# c3: kshana evidence keygen
# c4: kshana evidence attach-timestamp
# c5: openssl ts -verify
seg-1f1b18f8e102 = <b>Create Evidence Pack</b> auf einer receiver-trust-Sitzung <c1/> (<c2/>): fragt nach dem Fenster, einer Signierschlüsseldatei, die Sie schon haben, und dem Ausgabeordner. Das Plugin erzeugt, liest oder speichert nie einen Schlüssel (<c3/> bleibt auf der Kommandozeile). <b>Attach Timestamp</b> auf einem Paketordner (<c4/>): Kshana prüft die Signatur der Zeitstempelautorität nicht; führen Sie <c5/> selbst aus.

# text
# c1: evidence keygen
# c2: receiver-trust live
seg-f4f6605d3db9 = Weiterhin nur auf der Kommandozeile: die IQ-Befehle, <c1/> und <c2/>.

# text
seg-63efd04104f1 = Ein unteres Werkzeugfenster <b>Kshana</b>, das die Laufkonsole enthält.

# text
# c1: kshana receiver-trust live
# c2: kshana trust-telemetry
# c3: docs/MARITIME-TRUST.md
seg-decda07aa7eb = Nicht im Plugin: <c1/> (ein lang laufender Stromprozess mit einem Gate und einem optionalen TCP-Listener) und <c2/> bleiben auf der Kommandozeile, weil eine IDE-Aktion einen Befehl bis zum Ende ausführt und seine Ausgabe zeigt; siehe <c3/>.

# text
# c1: kshana
# c2: PATH
# c3: cargo install kshana
seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b>, um auf die Binärdatei <c1/> zu zeigen (leer → aus <c2/> aufgelöst; Installation mit <c3/>).

# text
seg-44dfdd65bd0a = Das Plugin ist rein plattformbasiert (keine sprachspezifischen Abhängigkeiten) und lädt daher in jeder JetBrains-IDE ab Build { "243" } ({ "2024.3" }).

# text
seg-453bd42c23fa = Bauen und ausführen

# text
seg-b5328f8c7a8a = Erfordert JDK { "17" }+ (der Build legt JDK { "21" } fest) und den mitgelieferten Gradle-Wrapper.

# text
# c1: verifyPlugin
# c2: TYPE:VERSION
seg-758124ceb1c7 = <c1/> prüft standardmäßig den Since-Build { "2024.3" }. Um weitere Linien zu prüfen, listen Sie sie als <c2/> auf (jede IDE ist ein Download von etwa { "1" } GB):

# text
# c1: KshanaChooser
# c2: Messages.showChooseDialog
seg-15d175aaeb59 = Das Plugin verwendet auf keiner davon eine veraltete oder zur Entfernung vorgesehene Plattform-API; das soll so bleiben (ein Auswahldialog läuft über <c1/>, nicht über <c2/>).

# text
seg-39cfd740d9b3 = Installieren Sie das gebaute Zip über <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

# text
seg-87aff08f344c = Aufbau

# text
seg-73b3f55b7208 = Isolation

# text
# c1: mcp/
# c2: xval/
# c3: kshana
# c4: /ide
# c5: exclude
seg-a14db8de576a = Wie <c1/> und <c2/> ist dies ein eigenständiges Gradle-Projekt, ausgeschlossen aus dem veröffentlichten Crate <c3/> (<c4/> im Paket <c5/>); seine Build-Ausgabe steht in der gitignore.

# text
# c1: LICENSING.md
seg-b38914a430b9 = Lizenz: AGPL-3.0-only (oder eine kommerzielle Lizenz von Ashforde OÜ — siehe die <c1/> des Repositorys).

# text
seg-bb286e3ce9c9 = <s1>Zurück</s1>Wo jede Fähigkeit erreichbar ist

# text
seg-e62586b5f58c = <s1>Weiter</s1>Wo Kshana läuft

# text
# c1: kshana --validate
# c2: kshana kinds
# c3: .toml
# c4: kshana receiver-trust live --file
seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (Menü Tools; <c2/>) und <b>Assess Receiver Stream</b> (eine Schiffssitzung <c3/> plus ein von Ihnen gewähltes gespeichertes NMEA-Protokoll; <c4/>, einmal bewertet, ohne Socket und ohne Gate).
