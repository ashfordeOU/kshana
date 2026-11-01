# docs--example-multi-tool: translations (de)

# text
# c1: docs/examples/multi-tool-pipeline.md
seg-077d900655af = Quelle: <c1/>

# text
seg-42e93cd44e94 = Durchgerechnetes Beispiel — Kshana als Verbindungsschicht der Missionsanalyse über mehrere Werkzeuge

# text
# c1: label
seg-286cf0e7bb71 = Dies führt eine Trajektorie von Anfang bis Ende durch die standardbasierten Interop- und Missionsanalyse-Szenarioarten und zeigt, wie Kshana <em>zwischen</em> den hochgenauen Werkzeugen sitzt, die ein Programm bereits nutzt, statt mit ihnen zu konkurrieren: GMAT (das General Mission Analysis Tool), Orekit und STK (Systems Tool Kit) für den Trajektorienentwurf sowie Basilisk oder { "42" } für die Simulation des Lage- und Bahnregelungssystems (AOCS). Jeder Schritt ist eine ausführbare Szenarioart, und jedes Ergebnis trägt ein <c1/>, das seinen Geltungsbereich und seine Evidenzstufe angibt.

# text
# c1: label
seg-7198d05bece6 = Ehrlichkeitshinweis: Dies ist eine <em>geometrische/analytische</em> Pipeline auf der Stufe vor Phase A bzw. der Trade-Study (vor der ersten förmlichen Entwurfsphase einer Mission). Sie ist keine Zertifizierung der Flugdynamik; siehe das Feld <c1/> jeder Art.

# text
seg-70c18138497b = Weitere unten verwendete Abkürzungen: FDS (Flugdynamiksystem), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, der Propagator für Two-Line-Elemente), TOML (das Dateiformat der Szenarien) und CLI (Befehlszeilenschnittstelle).

# text
seg-7cc0d4d15c4a = Die Pipeline

# text
# c1: passes
# c2: link-budget
# c3: campaign
seg-09a321d36a10 = Die Schritte sind getrennte Läufe: Jeder bezieht seine Eingaben aus seiner eigenen Szenariodatei, sodass Sie eine Zahl von einem zum nächsten übertragen (zum Beispiel eine Schrägentfernung aus <c1/> nach <c2/>), indem Sie die nächste Datei bearbeiten. Die Art <c3/> kann mehrere Arten in einem Lauf unter gemeinsamen Bedingungen bündeln; siehe <a1>CAMPAIGNS.md</a1>.

# text
seg-382ae9161181 = Jeder Befehl unten wird im Wurzelverzeichnis des Repositorys ausgeführt, und die Zusammenfassung darunter ist die erste Zeile, die kshana { $version } für das mitgelieferte Szenario ausgibt.

# text
# c1: oem-interop
seg-7939b15235c8 = { "1" }. Die von einem Entwerfer erzeugte Trajektorie einlesen (<c1/>)

# text
seg-4b732dd54291 = GMAT, Orekit und STK <em>exportieren</em> alle CCSDS Orbit Ephemeris Messages. Kshana importiert sie (die andere Richtung der Brücke), sodass eine Kshana-Analyse von genau der Bahn ausgehen kann, die der Trajektorienentwerfer freigegeben hat, und nicht von einer neu abgeleiteten Näherung:

# text
# c1: oem_text
# c2: kshana scenarios/orbit-sgp4-gps.toml --export-oem gps.oem
# c3: oem-interop: ingested 30 segment(s), 10830 states from external OEM (originator KSHANA) (MODELLED interop)
# c4: label
seg-3136cfd5a40e = Es meldet die Segmente, Objekte, Bezugssysteme und die Epochenspanne sowie eine Prüfung der Geschwindigkeitskonsistenz, die zeigt, dass die Ephemeride getreu eingelesen wurde (Rundlauffehler unter { "1" }×{ "10" }⁻⁶ km). Mit einer externen Datei in <c1/> stattdessen meldet es, was es geparst hat: Mit dem OEM, den <c2/> schreibt, gibt es <c3/> aus. Das <c4/> macht deutlich, dass dies eine strukturelle und physikalische Einlesprüfung ist, keine Validierung der Bahngenauigkeit der Quelle.

# text
# c1: passes
seg-e2c563fcb8cb = { "2" }. Wann ist er von einer Bodenstation aus sichtbar? (<c1/>)

# text
# c1: refraction
# c2: light_time
seg-d66361888ede = Sagt die Auf- und Untergangsüberflüge über einer Station oberhalb einer Elevationsmaske voraus: Signalbeginn (AOS), Zeitpunkt der größten Annäherung (TCA), Signalverlust (LOS), maximale Elevation und Dauer, dazu die gesamte Zugriffszeit. Das ist die Planungsanfrage des Bodensegments. Die Bahn ist ein SGP4-Elementesatz, der über die IAU-2006/2000A-Kette ins erdfeste Bezugssystem überführt wird, und die Elevationen sind scheinbar: Refraktion nach ITU-R P.834-9 und die Lichtlaufzeit der Abwärtsstrecke, jeweils schaltbar (<c1/>, <c2/>).

# text
# c1: link-budget
seg-24d31bafa334 = { "3" }. Kommt der Kontakt zustande? (<c1/>)

# text
seg-47bdb9d4700c = Für einen Überflug setzen Sie die Schrägentfernung und die Kenngrößen des Terminals in die Streckengleichung nach CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network) ein:

# text
seg-db12a99edcd2 = Meldet die Freiraumdämpfung (FSPL), die Träger-Rauschdichte (C/N₀), die Energie pro Bit über der Rauschdichte (Eb/N₀), die Reserve und ob die Strecke gegen ein gefordertes Eb/N₀ <b>zustande kommt</b>: die Machbarkeitsprüfung der Kommunikation, die aus „es ist sichtbar" ein „wir können die Daten tatsächlich herunterladen" macht. Die Zahlen folgen direkt aus den Eingaben in der Datei (hier eine EIRP von { "55" } dBW, die äquivalente isotrope Strahlungsleistung, in ein Empfangs-G/T von { "53" } dB/K, das Verhältnis von Gewinn zu Rauschtemperatur); setzen Sie die Kenngrößen Ihres eigenen Terminals ein, bevor Sie die Reserve ablesen. Es ist eine deterministische Berechnung, kein kalibriertes Datenblatt eines Terminals.

# text
# c1: space-weather
seg-85ad46986461 = { "4" }. Wie schnell lässt die Umgebung sie abklingen? (<c1/>)

# text
seg-8977b12fd934 = Treibt die thermosphärische Neutralteilchendichte aus der solaren Aktivität (F10.7, der Radiofluss bei { "10.7" } cm, und sein 81-Tage-Mittel F10.7a) und der geomagnetischen Aktivität (Indizes Kp und ap) über die exosphärische Temperatur nach Jacchia-71 an. Das erfasst den Dichtehub von ~{ "5" }–{ "10" }× über den Sonnenzyklus, den eine statische Atmosphäre auslässt, sodass eine Abschätzung der Bahnlebensdauer oder des Luftwiderstands das Weltraumwetter-Regime widerspiegelt und nicht eine feste Atmosphäre. Seit { "0.30" } ist die Dichte die thermosphärische Dichte nach Jacchia { "1971" }, charakterisiert gegen NRLMSISE-00 (Naval Research Laboratory, Massenspektrometer und Incoherent Scatter), aber keine datenvalidierte NRLMSISE-00-Atmosphäre.

# text
seg-4b5bdadf3e7e = { "5" }. Das Ergebnis zurückgeben (Exporte)

# text
# c1: orbit
# c2: --export-oem <file>
# c3: --export-sp3 <file>
# c4: --export-omm <file>
# c5: --export <czml|kml|geojson|stk|sigmf|all|list>
# c6: .e
# c7: spectrum
# c8: --export list
# c9: lunar-interop-export
seg-f4a438636ea8 = Dieselbe CLI schreibt Standarddateien für das nächste Werkzeug. Bei einem <c1/>-Szenario schreibt <c2/> eine CCSDS-OEM-{ "2.0" }-Ephemeride mit Geschwindigkeit (die Datei, die GMAT, Orekit und STK lesen), <c3/> eine präzise SP3-Ephemeride (Standard Product { "3" }) und <c4/> einen CCSDS-Katalog von Orbit Mean-Elements Messages. <c5/> deckt die Viewer ab: CZML (Cesium Language), KML (Keyhole Markup Language, für Google Earth), GeoJSON, STK-Ephemeridendateien (<c6/>, eine je Satellit plus der Nutzer) und SigMF-Aufzeichnungen (Signal Metadata Format) aus der Art <c7/>. <c8/> sagt, welche für ein Szenario gelten. Für den Mond gibt die Art <c9/> das Mondbezugssystem, die Zeitskala und die Ephemeride als CCSDS OEM mit einer Übereinstimmungsprüfung aus. Siehe <a1>INTEROP.md</a1>.

# text
seg-5293e6d761a8 = Warum dies die Verbindungsschicht ist und kein Konkurrent

# text
# c1: launch-window
# c2: reentry
# c3: eo-coverage
# c4: space-packet
# c5: attitude-budget
seg-cd78b0435abb = Jeder Schritt ist ein kleines, nachprüfbares, reproduzierbares Szenario mit einem ausdrücklichen Geltungsbereichsetikett. Die hochgenauen Werkzeuge besitzen die Trajektorienoptimierung, die AOCS mit sechs Freiheitsgraden (6-DoF) und den aerothermischen Eintritt, Abstieg und die Landung (EDL); Kshana besitzt das <b>offene, zitierbare, ausführbare Bindegewebe</b>: die Standardformate einlesen, die übergreifenden Fragen zu Geometrie und Machbarkeit beantworten und das Ergebnis weitergeben, auf einer Stufe, die jeder Partner ohne Lizenz ausführen kann. Siehe auch die begleitenden Missionsanalyse-Arten <c1/>, <c2/>, <c3/>, <c4/> und <c5/>.

# text
seg-af1ab3c55fe6 = <s1>Zurück</s1>{ "3" } · Quanten gegen klassisch

# text
seg-b0765a28b4ce = <s1>Weiter</s1>Szenarioarten

# text
seg-dc88ec5ccc43 = { "1" }. Die von einem Entwerfer erzeugte Trajektorie einlesen (oem-interop)

# text
seg-cdff21ef6984 = { "2" }. Wann ist er von einer Bodenstation aus sichtbar? (passes)

# text
seg-afa47b4283a3 = { "3" }. Kommt der Kontakt zustande? (link-budget)

# text
seg-e508e844bf2d = { "4" }. Wie schnell lässt die Umgebung sie abklingen? (space-weather)
