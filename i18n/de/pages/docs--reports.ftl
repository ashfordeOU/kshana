# docs--reports: translations (de)

# text
seg-3ea93ae372ca = Was es enthält

# text
seg-245adc6e6766 = <s1>Zurück</s1>Kampagnen

# text
seg-aa5482ac34ff = Grenzen, offen benannt

# text
# c1: docs/REPORTS.md
seg-b0dcf3142564 = Quelle: <c1/>

# text
# c1: <scenario>.report.html
# c2: <scenario>.report.json
seg-4c412bb0ce63 = Jeder Lauf der Befehlszeilenschnittstelle (CLI) schreibt neben sein Ergebnis einen Bericht: eine druckbare HyperText-Markup-Language-(HTML-)Seite, <c1/>, und ein maschinenlesbares JavaScript-Object-Notation-(JSON-)Dokument, <c2/>, mit demselben Inhalt. Der Bericht funktioniert für jede Szenarioart und für Kampagnen.

# text
seg-e26b1a83a86d = Das Ergebnisdokument beantwortet, <em>was die Engine berechnet hat</em>. Der Bericht fügt hinzu, was ein Leser braucht, bevor er danach handelt: was eingegangen ist, worauf die Zahlen beruhen, was weggelassen wurde und wie man dieselben Bytes wieder erhält. Er erfindet nichts davon. Jeder Abschnitt wird aus einer Quelle gelesen, die die Engine bereits führt, und nennt die Quelle neben dem, was er zitiert.

# text
# c1: kshana::advanced_report
# c2: src/advanced_report.rs
seg-bf0456f18e4f = Der Builder ist <c1/> (<c2/>). Er ist eine reine Funktion der Laufausgabe, der Bytes der Szenariodatei und der Befehlszeile: Er liest keine Uhr, keine Datei und kein Netzwerk, und er lässt sich für WebAssembly bauen.

# text
seg-bed0af192da5 = Abschnitte

# text
seg-fca842769048 = Abschnitt

# text
seg-2654051d8292 = Gelesen aus

# text
seg-5790851a4a5f = Zusammenfassung

# text
seg-3d34b2ef5988 = was die Art tut, die einzeilige Zusammenfassung des Laufs, Kennzahlen, die Ehrlichkeitskennzeichnung auf Laufebene, die Zahl der verwendeten Fähigkeiten VALIDATED / MODELLED / PARTNER

# text
# c1: kshana kinds --json
# c2: label
# c3: figure_tiers
seg-923111083001 = der Artenkatalog (<c1/>), das <c2/> des Ergebnisses, sein Block <c3/> oder Gütemaß-Block, die Perzentile einer Monte-Carlo-Kampagne

# text
seg-e1ce0e8d5c61 = jedes Feld, das die Szenariodatei setzt, abgeflacht auf seinen Pfad, mit seiner Einheit und woher die Einheit stammt

# text
# c1: units
# c2: docs/field-units-schema.json
# c3: _s
# c4: _ns
# c5: _m
# c6: _deg
# c7: _dbw
seg-fbd2e96c92c7 = die Szenariodatei; Einheiten aus dem Block <c1/> des Ergebnisses (das Einheitenschema der Felder, <c2/>), sonst aus dem Suffix des Feldnamens (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); eine Einheit, die keines von beiden angibt, wird als <b>nicht angegeben</b> gedruckt

# text
seg-88ccaef6fc49 = das Diagramm des Laufs, jeder Skalar des Ergebnisdokuments mit seiner Einheit und eine Zusammenfassung aus Anzahl / Minimum / Maximum / erstem / letztem Wert jeder numerischen Spalte

# text
# c1: units
seg-42a82485f8c8 = das Ergebnisdokument und sein Block <c1/>

# text
seg-f554fbcdd85c = Aggregation (Kampagnen und Durchläufe)

# text
seg-7c0466805f54 = die Knotentabelle eines Durchlaufs; Mittelwert, Standardabweichung, 5. / 50. / 95. Perzentil und das { "95" }-%-Konfidenzintervall des Mittelwerts eines Monte-Carlo-Laufs, mit einem Histogramm je Metrik; die Phasentabelle einer Kette; die gemeinsamen Bedingungen, Mitglieder und die kombinierte Zusammenfassung einer Komposition

# text
# c1: sweep
# c2: monte_carlo
# c3: timeline
# c4: compose
# c5: sweep
# c6: sweep-nd
seg-7b5f5b635905 = der Abschnitt <c1/>, <c2/>, <c3/> oder <c4/> des Kampagnenergebnisses; das Gitter eines Ergebnisses <c5/> oder <c6/>

# text
seg-3bf44008fc65 = Animation und Exporte

# text
# c1: --animate svg
seg-64d1073dfadc = die animierte Zeichnung des Laufs (die Ausgabe <c1/>), eingebettet als inaktives Bild, oder warum es keine gibt; Links zu den Animations- und Interoperabilitätsdateien, die derselbe Befehl neben den Bericht geschrieben hat; jedes Exportformat mit der Angabe, ob es auf das Szenario zutrifft, warum nicht, und seiner Spezifikation

# text
# c1: src/animation.rs
# c2: interop::plan
# c3: --animate
# c4: --export
seg-ad7792e04197 = der Animationsexporter (<c1/>), <c2/> und die Dateien, die die Befehlszeile geschrieben hat (<c3/>, <c4/>)

# text
seg-3d3781a3691b = Ereigniszeitleiste

# text
seg-f29f1b90edbd = zeitlich begrenzte Fenster und Punktereignisse, gezeichnet und tabelliert auf der Zeitachse des Laufs

# text
# c1: t0
# c2: t1
# c3: on_s
# c4: off_s
# c5: start_s
# c6: end_s
# c7: time.duration_s
# c8: events
seg-4271c092fa45 = Szenariotabellen mit <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> oder einer Einsetzzeit; die Laufspanne <c7/>; jedes Array <c8/> im Ergebnis; die Phasen und Übergaben einer Kampagne

# text
seg-00bee96167aa = Verifikationskennzeichnungen

# text
seg-6dea392111a6 = jede Zeile der Verifikationsmatrix, die die Arten des Laufs ausüben, mit ihrer Kennzeichnung, unabhängigen Referenz und ihrem Testnachweis, und die Stufen je Kennzahl, die das Ergebnis angibt

# text
# c1: src/verification.rs
# c2: docs/VERIFICATION-MATRIX.md
# c3: advanced_report::KIND_CAPABILITIES
seg-ca56309b9693 = die Verifikationsmatrix (<c1/>, <c2/>) über den Querverweis von Art zu Zeile <c3/>

# text
seg-c19ae28a2355 = Nicht modelliert, und Annahmen

# text
seg-aff7a016c7e2 = jede Einschränkung, zitiert

# text
# c1: not_modelled
# c2: not_implemented
# c3: honesty
# c4: docs/MODELLED-RATIONALE.md
seg-9be853632d3a = die Blöcke <c1/>, <c2/> und <c3/> des Ergebnisses; MODELLED-Klauseln des Artenkatalogs; Szenariokommentare und Eingabetexte, die „not modelled“ sagen; der Grund der Matrix, warum jede MODELLED-Zeile modelliert bleibt (<c4/>)

# text
seg-a3ee5ba71183 = Reproduzierbarkeitsnachweis

# text
seg-a9746c2f1881 = Engine-Version, Quell-Commit, Secure-Hash-Algorithm-256-Bit-(SHA-256-)Digests der Szenariodatei und des Ergebnisdokuments, Seed, Plattform, der genaue Befehl, die Regel zum Arbeitsverzeichnis, der Digest jeder weiteren Eingabedatei

# text
seg-ec1f62f6bbd1 = der Build, die Dateien, die Befehlszeile

# text
seg-ea460048debd = Ein Abschnitt, in dem nichts aufzulisten ist, sagt in einem Satz, warum (zum Beispiel „No timed event: the scenario scripts no window or onset time and the result reports no event“). Kein Abschnitt ist je leer und stumm.

# text
seg-b99234469953 = Was eine Kennzeichnung im Bericht bedeutet

# text
seg-f9060b1e8077 = Eine Verifikationskennzeichnung bewertet die in einer Matrixzeile genannte <b>Fähigkeit</b>, so wie die Matrix sie festhält. Sie bewertet nicht die Konfiguration des Szenarios, und eine Zeile VALIDATED macht die Eingaben eines Laufs nicht zu gemessenen. Eine Zeile PARTNER ist eine Disziplin, auf die sich der Lauf stützt und die Kshana nicht liefert (Antennenhardware für die Hochfrequenzarten, die Quanten-Nutzlast für die Quantenarten, der Satellitenbus für das Lagebudget); der Bericht zeigt sie als <em>darauf gestützt, nicht geliefert</em>.

# text
# c1: requirement
# c2: sweep-nd
seg-da422ae044d2 = Der Querverweis von Art zu Zeilen ist eine Tabelle von Matrix-Zeichenketten <c1/>. Die Kennzeichnung, die unabhängige Referenz und der Nachweis werden beim Erstellen des Berichts aus der Matrix zurückgelesen, sodass das Verschieben einer Zeile zwischen VALIDATED und MODELLED jeden Bericht mitnimmt. Eine Kampagne trägt die Zeile für ihre Betriebsart (Kette, Durchlauf oder Monte Carlo, Komposition) plus jede Zeile jeder Mitgliedsart, die sie ausgeführt hat; <c2/> trägt die Zeilen der Art, die es durchlaufen hat. Jeder Lauf trägt außerdem die Zeile „Reproducibility & software assurance“, auf der der Reproduzierbarkeitsnachweis beruht.

# text
# c1: advanced_report::PATH_GATED_CAPABILITIES
# c2: orbit
# c3: ephemeris
# c4: tle
# c5: slot-timing
# c6: oscillator.record
# c7: spectrum
# c8: [[panels]]
# c9: leo-pass
# c10: leo-pnt-chain
# c11: leo-navmsg
# c12: leo-pvt
# c13: terrain-nav
# c14: terrain-slam
seg-f38434695c28 = Eine Zeile, die nur einen Eingabepfad einer Art bewertet, wird nur aufgeführt, wenn der Lauf diesen Pfad genommen hat (<c1/>): <c2/> und <c3/> tragen die Zeile „Orbit propagation & determination“ nur mit einem <c4/> (der Pfad Simplified General Perturbations { "4" } (SGP4); ein analytischer Orbit ist eine Zweikörper-Propagation), und <c5/> trägt die Zeile der gemessenen Aufzeichnung nur mit einem <c6/>. Dieselbe Tabelle steuert die Mehrband-Zeile von <c7/> danach, ob der Lauf <c8/> zeichnet, und die Zeilen der Arten für niedrige Erdumlaufbahnen (LEO) nach dem Pfad, den jeder Lauf genommen hat: eine Zeile für Regen, Gebäudeeintritt, niedrige Energie oder Spoofer bei <c9/> oder <c10/> nur, wenn das Szenario diesen Term setzt, die Szintillationszeile, sofern das Szenario sie nicht ausschaltet, eine Zeile für Präzise Punktpositionierung bei <c11/>, <c12/> oder Kette nur für die Analyse oder Betriebsart, die das Ergebnis trägt, und die Zeile der LEO-Systemvoreinstellung nur, wenn eine benannte Voreinstellung verwendet wird. Die Zeile des Shuttle-Radar-Topography-Mission-(SRTM-)Lesers wird von keiner Art getragen: <c13/> und <c14/> laufen auf einem synthetischen digitalen Höhenmodell (DEM), und kein Szenariofeld liest eine SRTM-Kachel. Eine Zeile VALIDATED, die der Lauf nie berührt hat, würde sonst einen Nachweis beanspruchen, den der Lauf nicht hat.

# text
seg-29efeadac5c7 = Einen Lauf aus seinem Bericht reproduzieren

# text
# c1: report.json
# c2: reproducibility
seg-e859939f0f42 = <c1/> → <c2/> enthält alles Nötige:

# text
# c1: scenario_sha256
# c2: input_files
# c3: --eop
seg-d65ad1b942e3 = Prüfen Sie die Szenariodatei gegen <c1/> und jede Datei in <c2/> (eine Erdorientierungsdatei <c3/>) gegen ihren Digest.

# text
# c1: command
seg-5b3c59266451 = Führen Sie <c1/> aus dem Verzeichnis aus, in dem der ursprüngliche Lauf gestartet wurde. Der Szenariopfad und jeder relative Datenpfad im Szenario werden relativ dazu aufgelöst.

# text
# c1: result.json
# c2: result_sha256
# c3: report.json
# c4: report.html
seg-9f38218af0f0 = Das neue <c1/> hat den SHA-256 in <c2/>, und das neue <c3/> und <c4/> sind byteidentisch mit den alten.

# text
# c1: tests/advanced_report_cli.rs
# c2: --eop
seg-a04db3e1c7f5 = <c1/> macht genau das für ein Uhrenszenario, eine verkettete Kampagne, eine Durchlaufkampagne und einen Orbit-Lauf mit einer Datei <c2/>: Es liest den Befehl aus dem Bericht, führt ihn in einem frischen Verzeichnis aus, das nur die aufgezeichneten Eingaben enthält, und vergleicht Bytes.

# text
# c1: scenario_sha256
# c2: scenario_hash
seg-1e2e9158544d = <c1/> ist der Digest der exakten Bytes der Datei. Das <c2/> des Ergebnisses ist etwas anderes, der Fingerabdruck der Art für das Szenario (oft einer kanonischen Form), und der Bericht druckt beide, gekennzeichnet.

# text
# c1: seed
seg-3d72d2059a6c = <b>Seed.</b> Der Seed ist das <c1/> des Szenarios, sonst der, den das Ergebnis angibt. Bei einer Art ohne Seed sagt der Bericht das und dass allein die Szenariodatei und der Engine-Build das Ergebnis festlegen.

# text
# c1: KSHANA_GIT_COMMIT
seg-50457327734e = <b>Quell-Commit.</b> Die Engine hält den Commit nur fest, wenn sie mit gesetzter Umgebungsvariable <c1/> gebaut wurde, zur Kompilierzeit gelesen:

# text
seg-3c7ed74729d3 = Ein Build ohne sie meldet den Commit als nicht aufgezeichnet, und die Engine-Version identifiziert die Veröffentlichung. Nichts wird geraten.

# text
seg-86ff67531a0e = <b>Plattform.</b> Betriebssystem, Architektur und Familie des Builds. Ergebnisse sind auf einer Plattform byteidentisch; über Plattformen hinweg können Gleitkommaergebnisse in den letzten Stellen abweichen (siehe <a1>REPRODUCIBILITY.md</a1>).

# text
seg-eeb07da80914 = Determinismus und der eine Zeitstempel

# text
# c1: report.json
# c2: report.html
# c3: --study-name
# c4: meta.generated_utc
# c5: --study-name
# c6: tests/advanced_report.rs
# c7: scenarios/
seg-995ad516f5ae = Gleiche Szenario-Bytes, gleicher Seed und gleicher Engine-Build ergeben ein byteidentisches <c1/> und <c2/>. Der Bericht trägt keinen Zeitstempel. Die einzige Uhrablesung im gesamten Crate ist die, die <c3/> vornimmt und die <c4/> in das Ergebnisdokument stempelt; der Bericht zeigt dann diesen Stempel und sagt, dass er das eine Feld ist, das eine Reproduktion nicht trifft. Um das zu vermeiden, führen Sie ohne <c5/> aus. <c6/> baut den Bericht jeder Szenariodatei unter <c7/> (bis auf das Suite-Manifest) zweimal und führt sechs Szenarien erneut aus (darunter je eine Kampagne der Betriebsarten Kette, Durchlauf und Komposition), um dies von Anfang bis Ende zu prüfen.

# text
seg-8a3fc60a5b54 = Als PDF drucken

# text
# c1: --report pdf
# c2: report.html
seg-201bcec2caa3 = Die Engine schreibt keine Portable-Document-Format-(PDF-)Dateien. Ein PDF-Schreiber, der die Diagramme rendert, würde eine neue, schwere Abhängigkeit bedeuten, daher gibt es keine Option <c1/>. Stattdessen trägt <c2/> ein Druck-Stylesheet: Öffnen Sie sie in einem Browser, drucken Sie und wählen Sie „Als PDF speichern“.

# text
seg-13f1f294ede1 = Das Stylesheet ist für A4 und US Letter geschrieben. Es setzt keine Papiergröße (die Wahl des Druckdialogs gilt), hält Ränder von { "15" } mm / { "14" } mm ein, die auf beide Formate passen, schaltet auf Schwarz auf Weiß um, wiederholt Tabellenköpfe auf jeder Seite, verhindert, dass Tabellenzeilen, Abbildungen und Karten über Seiten hinweg getrennt werden, hält Überschriften beim folgenden Text und beginnt die Abschnitte zu Eingaben, Ergebnissen, Verifikationskennzeichnungen und Reproduzierbarkeit auf einer neuen Seite. Die Navigationsleiste wird im Druck ausgeblendet.

# text
seg-a25bb320665d = Das JSON-Dokument

# text
# c1: report.json
# c2: report_schema = "kshana-report"
# c3: report_schema_version = "1.0"
# c4: kind
# c5: title
# c6: executive_summary
# c7: inputs
# c8: results
# c9: aggregation
# c10: events
# c11: capabilities
# c12: not_modelled
# c13: companions
# c14: animation
# c15: exports
# c16: export_command
# c17: reproducibility
# c18: items
# c19: omitted
# c20: items
# c21: statement
# c22: value
# c23: display
# c24: null
# c25: value
# c26: display
seg-9d9af39942a7 = <c1/> hat <c2/> und <c3/>, dann <c4/> und <c5/> und einen Schlüssel je Abschnitt: <c6/>, <c7/>, <c8/>, <c9/> (nur Kampagnen und Durchläufe), <c10/>, <c11/>, <c12/>, <c13/> (Abschnitt 3b: <c14/>, <c15/> und <c16/>) und <c17/>. Ein Listenabschnitt hat <c18/>, <c19/> (die Zeilen, die die Seitenobergrenze ausgelassen hat; das Ergebnisdokument trägt jeden Wert) und, wenn <c20/> leer ist, eine <c21/>, die sagt, warum. Ein Wert behält seine rohe JSON-Form in <c22/> und den Text, den die Seite zeigt, in <c23/>; ein fehlender Wert ist <c24/> in <c25/> und „no value“ in <c26/>.

# text
seg-06cc70ca3601 = <b>Einheiten.</b> Wo weder das Einheitenschema der Felder noch der Feldname eine Einheit angibt, sagt der Bericht „nicht angegeben“, statt zu raten. Eingaben, die in den Mitgliedsszenarien einer Kampagne verschachtelt sind, werden nur gegen den eigenen Einheitenblock der Kampagne und das Suffix des Feldnamens aufgelöst, sodass mehr von ihnen „nicht angegeben“ lauten als in einem eigenständigen Lauf.

# text
seg-023d5a1fbffc = <b>Urteil beim Querverweis.</b> Welche Matrixzeilen eine Art ausübt, ist eine kuratierte Tabelle, die ein Test darauf prüft, dass sie je Eintrag genau eine existierende Zeile nennt und jede eingebaute Art abdeckt. Ob jede Zuordnung die richtige ist, ist ein menschliches Urteil, wie die eigene Wahl der unabhängigen Referenz in der Matrix.

# text
# c1: omitted
seg-0a7465f4c29a = <b>Obergrenzen.</b> Die Seite listet höchstens { "400" } Eingaben, { "150" } skalare Ergebnisse, { "60" } numerische Spalten und { "200" } Ereignisse auf; <c1/> zählt den Rest. Eine Tabelle mit mehr als { "24" } Zeilen in einem Szenario (eine eingelesene Reihe) wird je Spalte zusammengefasst.

# text
# c1: kshana --study <suite.toml>
# c2: <suite>.study.json
# c3: <suite>.study.html
seg-1fa26ed86bb8 = <c1/> führt sein eigenes <c2/> und <c3/>; es schreibt diesen Bericht nicht.

# text
# c1: RunOutput::html_report()
# c2: web/studio/lib/report.mjs
# c3: kshana::advanced_report::build
# c4: report_scenario
# c5: scenario.toml
seg-1ccdffd389fb = <b>Bindungen.</b> Die Python- und WebAssembly-Bindungen behalten <c1/>, die einseitige Kennzahlenübersicht; der herunterladbare Bericht des Playgrounds ist eine eigene Seite (<c2/>). Dieser Bericht wird von der CLI geschrieben, und Rust-Aufrufer können ihn mit <c3/> bauen. Der Server des Model Context Protocol (MCP) liefert ihn aus seinem Werkzeug <c4/> zurück, als JSON oder als HTML-Seite; der Szenariodateiname in seinem Reproduktionsbefehl ist der, den der Aufrufer übergibt (Standard <c5/>), und er listet keine Begleitdatei auf, da der Server keine schreibt.

# text
seg-c8ab7b4605cf = <s1>Weiter</s1>Animationsexport
