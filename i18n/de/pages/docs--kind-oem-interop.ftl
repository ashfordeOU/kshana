# docs--kind-oem-interop: translations (de)

# text
seg-99ef7c1d552c = Szenarioart der Engine v{ $version }, Familie <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-37d29d8303fe = km

# text
seg-8f1e7d3f5a07 = Familienseite: <a1>Missionsanalyse, Links und Raumfahrtbetrieb</a1>

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
# c1: docs/kinds/by-kind/oem-interop.md
seg-4abcbdaddcf8 = Quelle: <c1/>

# text
# c1: oem-interop
seg-a92dcafd670e = <c1/> (Szenario-Kind)

# text
seg-dbffff25b57f = CCSDS-OEM-Interoperabilitätsbrücke: Importiert eine Orbit Ephemeris Message, die von einem externen Flugdynamik-Werkzeug erzeugt wurde (GMAT/Orekit/STK geben alle OEM aus), und gibt ihre Segmente/Objekte/Bezugssysteme/Epochenspanne sowie eine Geschwindigkeits-Konsistenzprüfung aus; ohne Eingabe führt sie eine erzeugte Referenzbahn im Rundlauf und gibt die Import↔Export-Treue aus. MODELLED strukturelle/physikalische Einlesprüfung, KEINE Bahngenauigkeits-Validierung der Quelle.

# text
# c1: oem_text
seg-54c35d9fbfd9 = Optionale Felder: <c1/>

# text
# c1: scenarios/oem-interop.toml
seg-d4117f615cd8 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-d7db74d14617 = KSHANA

# text
seg-b16f858574ca = Ergebnisbezeichnung (die der Engine): MODELLED — CCSDS-OEM-Import-/Rundlauf-Interop-Brücke (GMAT/Orekit/STK geben OEM aus); eine strukturelle + physikalische Einlesprüfung, KEINE Bahngenauigkeits-Validierung der Quelle

# attr:alt
seg-5db5a7c812ca = Das Diagramm, das die Engine für scenarios/oem-interop.toml schreibt, Kind oem-interop

# text
seg-cd29f08ef235 = <b>VALIDATED</b> CCSDS-{ "502.0" }-OEM-Importer (parse_oem), tolerant gegenüber COMMENT-Zeilen / zusätzlichen Metadaten-Schlüsselwörtern / Kovarianzblöcken und exakte Umkehrung des Schreibers; Rundlauf + Einlesen externer Dateien mit einer Geschwindigkeits-Konsistenzprüfung. Tests: <a1>ccsds_oem_interop_reference.rs</a1>.

# text
# c1: oem
seg-20071a16b316 = <b>VALIDATED</b> CCSDS-{ "502.0" }-OEM-Importer (parse_oem), tolerant gegenüber COMMENT-Zeilen / zusätzlichen Metadaten-Schlüsselwörtern / Kovarianzblöcken und exakte Umkehrung des Schreibers; Rundlauf + . Unabhängige Referenz (ExternalDataset): Unabhängiger CCSDS-502-Parser eines Drittanbieters <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — eine separate Codebasis, die das von kshana ausgegebene EME2000/UTC-OEM byteidentisch dekodiert ({ "24" } Zustände über { "2" } Fixtures, Pos/Vel Δ = { "0" }) und deren strenger Leser die Metadaten-Token bestätigt; der Parser von kshana stimmt ebenso mit ihr an einem mitgelieferten externen OEM überein. Zwei ehrliche Interop-Befunde (die oem-Bibliothek lehnt das Pro-Satellit-mu von kshana ab

# text
# c1: label
seg-7ab6bb7a1b8a = MODELLED — CCSDS-OEM-Import-/Rundlauf-Interop-Brücke (GMAT/Orekit/STK geben OEM aus); eine strukturelle + physikalische Einlesprüfung, KEINE Bahngenauigkeits-Validierung der Quelle (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-343a56c07d02 = MODELLED strukturelle/physikalische Einlesprüfung, KEINE Bahngenauigkeits-Validierung der Quelle. (Kind-Katalog (<c1/>))

# text
seg-44aba1ad1d37 = EHRLICHER GELTUNGSBEREICH: MODELLED strukturelle + physikalische Einlesprüfung, KEINE Bahngenauigkeits-Validierung der Quell-Ephemeride. Lauf: kshana scenarios/oem-interop.toml (Kommentar der Szenariodatei, Zeilen { "11" } bis { "13" })

# text
seg-833df8eedc34 = <s1>Zurück</s1>ntn-positioning

# text
seg-28254e1b38d4 = <s1>Weiter</s1>optical-atmosphere

# text
# c1: scenarios/oem-interop.toml
seg-21eb1c9d7571 = Ein Lauf von <c1/> fasst sich zusammen als: oem-interop: im Rundlauf { "2" } Segment(e), { "12" } Zustände; maximaler Rundlauffehler { "4.88e-7" } km / { "4.61e-10" } km/s (Interop der Stufe MODELLED)
