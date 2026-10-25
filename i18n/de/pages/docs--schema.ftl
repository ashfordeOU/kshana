# docs--schema: translations (de)

# text
seg-2247a2344710 = Bedeutung

# text
seg-f42465f7d066 = ns

# text
seg-6940543aa3c0 = Zeichenfolge

# text
seg-f5e7215e6835 = Objekt

# text
seg-9da5d92757bd = Objekt, optional

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-c353e7bec219 = Schlüssel

# text
seg-a129b9e613d0 = Typ

# text
# c1: docs/SCHEMA.md
seg-e28387d70be0 = Quelle: <c1/>

# text
# c1: *.result.json
seg-49d2afecf5f1 = Ergebnisschema — ein <c1/> von Kshana lesen

# text
# c1: RunResult
# c2: src/report.rs
# c3: FoMScores
# c4: src/fom.rs
seg-c128455c353c = Jeder Lauf schreibt neben das Szenario ein versioniertes, selbstbeschreibendes JSON-Artefakt (JavaScript Object Notation). Diese Seite ist der von Hand geschriebene Leserleitfaden zur Austauschhülle und zu den Ergebnisformen von <b>Uhr und Orbit</b>: die <b>Einheit</b> jedes Feldes, wo es in der Quelle berechnet wird und wie es zu lesen ist. Der kanonische Typ ist <c1/> in <a1><c2/></a1>; die Gütemaße sind <c3/> in <a2><c4/></a2>.

# text
seg-092ea1e33a05 = Sie ist <b>nicht</b> die vollständige Feldreferenz. Die Engine verteilt über weit mehr Arten als diese beiden, und jede gibt ihr eigenes Paket aus. Die vollständige Referenz — Einheit, Herkunftsklasse und Definition für jedes numerische Feld jeder eingebauten Art — wird erzeugt, nicht von Hand geschrieben: siehe unten <a1>Einheiten und Herkunft, je Feld, für jede Art</a1>.

# text
seg-e4c4b66a2f46 = Austauschhülle (KIF, das Kshana Interchange Format) — ein Artefakt erkennen und seine Version prüfen

# text
# c1: Envelope
# c2: src/interchange.rs
seg-9b83bb817814 = Artefakte von Kshana können in eine neutrale, selbstbeschreibende <b>Austauschhülle</b> verpackt werden, damit ein Werkzeug eines Dritten die Datei erkennen und entscheiden kann, ob es sie lesen kann, <em>bevor</em> es sich auf ein Nutzdatenschema festlegt. Der kanonische Typ ist <c1/> in <a1><c2/></a1>.

# text
# c1: "kshana-interchange"
# c2: FORMAT_TAG
seg-e4fd08930644 = Immer <c1/> (<c2/>) — wie ein fremdes Werkzeug ein Artefakt von Kshana erkennt.

# text
# c1: MAJOR.MINOR
# c2: SCHEMA_VERSION
seg-abd853f2ce49 = Die Schemaversion <c1/> (<c2/>, die einzige Quelle der Wahrheit für das gesamte Crate).

# text
# c1: "scenario"
# c2: "run-result"
# c3: "trade-study"
seg-ee9f238072f1 = Artefaktart, z. B. <c1/>, <c2/>, <c3/> — lässt einen Konsumenten routen, ohne den Rumpf zu parsen.

# text
# c1: Cargo.toml
seg-29ad4bedd64f = Crate-Version (<c1/>), die die Nutzdaten erzeugt hat.

# text
# c1: Scenario
# c2: RunResult
seg-52f3e962c049 = Das verpackte Artefakt als kanonisches JSON (ein <c1/>, ein <c2/>, …).

# text
# c1: MAJOR.MINOR
# c2: #[serde(default)]
# c3: Compatible
# c4: ForwardIncompatible
# c5: MajorIncompatible
# c6: Envelope::parse
seg-6fe0d7cd4165 = <b>Kompatibilitätsvertrag.</b> Versionen sind <c1/>. Neue Felder werden mit <c2/> hinzugefügt (die <em>additive Disziplin</em>), sodass ein Leser jedes Artefakt mit <b>derselben Hauptversion und einer gleichen oder älteren Nebenversion</b> parsen kann (<c3/>). Eine streng <b>neuere Nebenversion</b> (<c4/>) kann Felder tragen, die dieser Leser nicht berücksichtigen kann, und eine <b>andere Hauptversion</b> (<c5/>) ist ein struktureller Bruch — beide werden von <c6/> zurückgewiesen, das das Formatkennzeichen und die Version an der Grenze prüft, statt fremde Eingaben stillschweigend falsch zu parsen.

# text
# c1: scenario + seed + engine_version
# c2: engine_version
# c3: scenario_hash
seg-f7ae91002e56 = <b>Determinismus.</b> Die Hülle trägt <b>keinen Zeitstempel</b> — das Reproduzierbarkeitsversprechen von Kshana (<c1/> reproduziert einen Lauf) verlangt es. Die Herkunft steht in <c2/> und im eigenen <c3/> der Nutzdaten.

# text
# c1: Envelope::payload_as::<T>()
# c2: Deserialize
# c3: Scenario
# c4: payload
seg-bb0b742d2df8 = Ein typisiertes Zurücklesen (<c1/>) funktioniert für jede Nutzlast, die <c2/> implementiert (z. B. <c3/>). Ergebnisartefakte sind absichtlich nur serialisierbar und werden als roher JSON-Wert <c4/> gelesen.

# text
seg-87be7aa00b17 = Oberste Ebene (Pakete Uhr und Orbit)

# text
seg-cc22d9206eb4 = Typ / Einheit

# text
seg-3a821855c582 = Version des Ergebnisschemas (unabhängig von der Engine-Version).

# text
# c1: Cargo.toml
seg-cc6dded799f9 = Crate-Version (<c1/>), die die Datei erzeugt hat.

# text
seg-5a69a99b9a87 = Hex-Zeichenkette

# text
# c1: scenario + seed + engine_version
seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) über das kanonische Szenario-JSON — der Lauf ist aus <c1/> reproduzierbar.

# text
# c1: seed + 0x9e3779b97f4a7c15
seg-ba73ba76873e = Seed des Zufallszahlengenerators (RNG) für den Quantenlauf (klassisch verwendet <c1/>).

# text
seg-a688dd98c588 = Nanosekunden

# text
# c1: threshold_ns
seg-24e0f04033fa = Die Zeitspezifikation: Ein Fehler innerhalb von ±<c1/> ist „in Spezifikation“.

# text
seg-f52388753a1a = Szenario

# text
# c1: ClockRun
seg-15b4082a6455 = Objekt (<c1/>)

# text
seg-7d3b92769bf5 = Der Lauf des Quantensensors (siehe unten).

# text
seg-aa665b955931 = Der Lauf des klassischen Sensors, zum Vergleich.

# text
seg-152ae43896b3 = Karte von Einheit/Herkunft je Feld für dieses Dokument, nach Feldpfad geschlüsselt. Siehe §Einheiten und Herkunft unten.

# text
# c1: figures
# c2: path
# c3: quantum.fom.timing_p95_ns
# c4: tier
# c5: VALIDATED
# c6: MODELLED
# c7: requirement
# c8: applicable
# c9: applicable
# c10: false
# c11: reason
# c12: security
# c13: fom.security
# c14: untiered
# c15: hybrid
# c16: fusion
# c17: clock
# c18: orbit
# c19: hybrid
# c20: fusion
# c21: fom_label::kind_figures
# c22: api::without_figure_tiers
# c23: lunar-station-coverage
# c24: docs/predictions/lunar-reference-station.md
# c25: figure_tiers
# c26: leo-ppp
# c27: solar-system
# c28: optical-atmosphere
# c29: sweep
# c30: sweep-nd
# c31: lunar-attack-surface
# c32: fom_label::KINDS_EXCLUDED_FROM_FIGURE_TIERS
seg-119bac9b3e6f = Die Verifikationsstufe jedes gemeldeten Gütemaßes, und immer der letzte Schlüssel des Dokuments. <c1/> listet je vorhandener Kennzahl einen Eintrag auf: <c2/> (z. B. <c3/>), <c4/> (<c5/> = gegen eine unabhängige externe Referenz geprüft, <c6/> = aus ersten Prinzipien, intern getestet), <c7/> (die Zeile der Verifikationsmatrix, aus der die Stufe gelesen wird) und <c8/>. <c9/> ist <c10/>, mit einem <c11/>, für <c12/> in jedem Szenario ohne konfigurierten Angriff: Die Schranke bleibt in <c13/>, beantwortet aber keine Frage, die das Szenario stellt. <c14/> listet jede Kennzahl auf, die keine Matrixzeile besitzt (die Positionskennzahlen von <c15/> und <c16/>), statt ihr eine Stufe zu geben. Ausgegeben von den Arten <c17/> (Einzellauf und Monte-Carlo-Ensemble), <c18/>, <c19/> und <c20/>, die sie in ihrem Lauf aufbauen, und ({ "0.36" }, RM-04) von jeder anderen Art für ihre Kopfkennzahlen, nach dem Lauf angehängt aus der Tabelle je Art <c21/>; <c22/> streift sie Byte für Byte zurück zum nicht gestuften Dokument. Nicht ausgegeben von <c23/>, dessen Ergebnis eine eingefrorene, vorregistrierte Vorhersage ist (<c24/>): Diese Art hat kein <c25/>, bis eine neue datierte Vorhersage sie ersetzt. Ebenfalls nicht ausgegeben von <c26/>, <c27/>, <c28/> ({ "0.37" }; Arrays je Standort), <c29/> und <c30/>, die keine skalare Kopfkennzahl haben, oder von <c31/>, dessen Dokument kompaktes JSON ist (<c32/> gibt jeden Grund an), oder von den eingebetteten Mitgliedsdokumenten einer Kampagne. Trägt keine Zahlen.

# text
# c1: samples_total
# c2: samples_with_fix
# c3: sigma_uere_m
# c4: best_pdop
# c5: median_pdop
# c6: best_position_sigma_m
# c7: median_position_sigma_m
# c8: sigma_uere_m
seg-1448f90f0086 = Geometriezusammenfassung des Orbit-Pakets: <c1/>, <c2/>, <c3/> (m, das modellierte Entfernungsfehlerbudget je Satellit), <c4/> / <c5/> (dimensionslos) und <c6/> / <c7/> (m, PDOP (Positions-Dilution-of-Precision) × <c8/>). <b>Nur Orbit-Paket.</b>

# text
# c1: [x, y, z]
seg-ae4f8eed06ac = Array aus <c1/> km, optional

# text
seg-d13d827f54b0 = Propagierte erdzentrierte inertiale Spur des Nutzer-Raumfahrzeugs, ein Eintrag je abgetasteter Zeit. <b>Nur Orbit-Paket</b>; sonst weggelassen. Nur Ausgabe — nicht gehasht.

# text
# c1: StudyMeta
seg-8f511d5de657 = Objekt (<c1/>), optional

# text
seg-ea152e097d6f = Additive Berichtsmetadaten (Studientitel, Erzeugungsstempel, Autor, Haftungsausschluss). Weggelassen, wenn nicht vorhanden, sodass ein Lauf ohne Metadaten byteidentisch zur alten Ausgabe ist. Nur Ausgabe — nicht gehasht.

# text
# c1: ClockRun
# c2: quantum
# c3: classical
seg-1041873fba1b = <c1/> (jeweils <c2/> / <c3/>)

# text
# c1: optical-sr-lattice
seg-3fa81140c10d = Sensorkennung (z. B. <c1/>).

# text
# c1: clock
seg-80765d202558 = Modellart (z. B. <c1/>).

# text
seg-6bf458d964fe = Zitat/Quelle für die Parameter des Sensors.

# text
seg-9145f04a557f = Die verwendeten rohen Modellparameter.

# text
# c1: {t, error_ns, gnss}
seg-697940342a28 = Array aus <c1/>

# text
# c1: t
# c2: error_ns
# c3: gnss
# c4: nominal
# c5: degraded
# c6: denied
seg-b5f4216b55a2 = Zeitreihe je Schritt: <c1/> Sekunden, <c2/> der Zeitfehler in <b>Nanosekunden</b>, <c3/> eines von <c4/>/<c5/>/<c6/>.

# text
# c1: FoMScores
seg-7fba0b91b75e = Objekt (<c1/>)

# text
seg-5c4b60012f0e = Die bewerteten Gütemaße (unten).

# text
# c1: {tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}
seg-1308a29c6a5b = Array aus <c1/>

# text
# c1: tau_s
# c2: adev
# c3: n_samples
# c4: noise
# c5: WhiteFm
# c6: edf
# c7: ci_lo
# c8: ci_hi
# c9: adev
# c10: allan.rs:overlapping_adev_curve
seg-bbd42065492c = Überlappende Allan-Abweichung: <c1/> die Mittelungszeit (s), <c2/> die dimensionslose relative Frequenzstabilität σ_y(τ), <c3/> die Überlappungszahl hinter diesem Punkt, <c4/> der aus der Steigung der MDEV (modifizierte Allan-Abweichung) erkannte Potenzgesetztyp (z. B. <c5/>), <c6/> die rauschtypspezifischen effektiven Freiheitsgrade und <c7/>/<c8/> das auf χ² beruhende { "95" }-%-Konfidenzband auf <c9/> bei diesem τ. Berechnet in <c10/>.

# text
# c1: filter_health.rs
seg-1e61fd18257f = Bewertung der Kalman-Filter-Konsistenz (NIS/NEES (NIS: normiertes Innovationsquadrat; NEES: normiertes Schätzfehlerquadrat) gegen ihre χ²-Bänder), berechnet in <c1/>; weggelassen für Läufe, die sie nicht bewerten.

# text
# c1: FoMScores
# c2: fom
seg-9333864652b0 = <c1/> (das Objekt <c2/>)

# text
seg-ce9caeaefd87 = Vorbehalt

# text
seg-b24de276d788 = RMS (quadratischer Mittelwert) des Uhrenphasenfehlers (Zeitfehlers) über den Ausfall.

# text
seg-53e5018ae276 = eine <b>Zeitgebungs</b>-Metrik, keine Position

# text
seg-8cdec6da2072 = 95.-Perzentil des Zeitfehlers über den Ausfall.

# text
seg-95f058adb809 = Ungünstigste (kürzeste) Überbrückung in Spezifikation über die Ausfallabschnitte.

# text
seg-48babfd3bd95 = <b>gitterbegrenzt</b> — eine Untergrenze bei der Auflösung des Zeitschritts

# text
seg-41c08973baa1 = Wachstumsrate von |Fehler| nach kleinsten Quadraten während des Ausfalls.

# text
seg-707ee74c5c06 = Anteil [{ "0,1" }]

# text
seg-32e5fe6415f8 = Anteil des gesamten Laufs mit einer Lösung in Spezifikation.

# text
seg-361b3b923a45 = Anteil [{ "0,1" }] oder null

# text
seg-5d55682f9349 = <b>Selbstkonsistenz des Filters</b>: Anteil der Ausfallproben, deren wahrer Fehler innerhalb der Kalman-k-σ-Schranke bleibt.

# text
# c1: INTEGRITY.md
seg-636106cb4a40 = <b>NICHT</b> Integrität nach HPL/VPL/RAIM (HPL: horizontales Schutzniveau; VPL: vertikales Schutzniveau; RAIM: empfängerautonome Integritätsüberwachung) — siehe <a1><c1/></a1>

# text
seg-f686ade3da21 = <b>Analytische Schranke der Spoof-Erkennbarkeit</b> aus der Uhrenstabilität.

# text
# c1: applicable: false
# c2: figure_tiers
# c3: n/a (no attack)
seg-f8783db25141 = nur mit einem konfigurierten Angriff aussagekräftig, daher kennzeichnen die Pakete Uhr und Orbit (die keinen konfigurieren) sie in <c2/> mit <c1/> und drucken sie in der Zusammenfassung als <c3/>; <b>kein</b> RAIM-Detektor mit mehreren Satelliten

# text
seg-90e2980430b9 = Wie „gut“ aussieht

# text
# c1: adev_curve
# c2: holdover_s
# c3: security
seg-c1afc6f3c545 = Eine <b>ruhigere Uhr</b> (niedrigeres <c1/>) ergibt ein längeres <c2/> und eine höhere Schranke der Erkennbarkeit <c3/> — das ist der Kontrast zwischen Quanten und klassisch.

# text
# c1: availability
seg-0fa38207813a = <c1/> nahe { "1.0" } bedeutet, dass das System fast den ganzen Lauf in Spezifikation blieb; bei einem langen Ausfall fällt es für die rauschere Uhr ab.

# text
# c1: integrity
seg-4dcba241d5a6 = <c1/> nahe { "1.0" } bedeutet, dass die eigene Unsicherheitsschranke des Filters ehrlich zu seinem Fehler war — eine Aussage zur <em>Selbstkonsistenz</em>, keine Garantie für Leib und Leben.

# text
seg-3099d75a04a5 = Andere Szenarioarten

# text
seg-43cd9f67f384 = Jede andere Art gibt ihre eigene Ergebnisform aus. Einige der gängigen:

# text
# c1: pos_rms_m
# c2: pos_p95_m
# c3: CAPABILITY.md
seg-6b59ef9dfe85 = <b>inertial</b>: Gütemaße im Positionsbereich in <b>Metern</b> (<c1/>, <c2/>) — einachsig (1-DOF (DOF: Freiheitsgrad)), mit einem Seed (siehe <a1><c3/></a1>).

# text
# c1: timing_spec_ns
# c2: position_spec_m
# c3: position_p95_m
# c4: position_holdover_s
# c5: pnt_holdover_s
# c6: figure_tiers
# c7: untiered
seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> und <c2/> auf oberster Ebene und je Seite die Zeitgebungs- und Positionskennzahlen einer Sensor-Suite (<c3/>, <c4/> und <c5/>, die Zeit, bis eine der beiden Spezifikationen verletzt wird), mit einem Block <c6/> wie dem des Uhrenpakets, in dem die Positionskennzahlen als <c7/> aufgeführt sind.

# text
# c1: src/spoof.rs
seg-e38e8a8adec8 = <b>spoof</b>: Spoof-Versatz je Schritt gegenüber der Erkennungsschranke der Uhr, plus ob der Spoof die Spezifikation vor der Erkennung erreichte (<c1/>).

# text
# c1: orbit
# c2: integrity
# c3: user_site
# c4: gnss-sim
# c5: jamming
# c6: leo-pvt
# c7: leo-pass
# c8: [skyline]
# c9: skyline
# c10: source
# c11: preset:<name>
# c12: preset:<name>+overrides
# c13: custom
# c14: open_fraction
# c15: max(mask_deg, skyline)
# c16: provenance
# c17: masked_by_skyline
# c18: epochs[]
# c19: integrity
# c20: jamming
# c21: gnss_measurements[]
# c22: gnss-sim
# c23: joint.epochs[]
# c24: leo-pvt
# c25: leo-pass
# c26: satellites[].pass.epochs_masked_by_skyline
# c27: units
# c28: src/skyline.rs
# c29: UNITS
# c30: SKYLINE.md
seg-dfd972d160e1 = <b>Horizontprofil</b> (<c1/> und <c2/> mit <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; nur vorhanden, wenn das Szenario einen Abschnitt <c8/> hat, sodass ein Szenario ohne ihn unverändert ist): ein Objekt <c9/> auf oberster Ebene mit <c10/> (Zeichenkette: <c11/>, <c12/> oder <c13/>), <c14/> (Anteil [{ "0,1" }] des Raumwinkels der oberen Hemisphäre über <c15/>) und <c16/> (Zeichenkette); je Probe <c17/> (Zahl der Satelliten über der Maske, aber hinter dem Horizontprofil: <c18/> von <c19/> und <c20/>, <c21/> von <c22/>, <c23/> von <c24/>); und für <c25/> <c26/> (Zahl der Epochen). Ihre Einheiten und Herkunftsklassen stehen im Block <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

# text
# c1: field-units-schema.json
# c2: SCENARIOS.md
# c3: *Result
# c4: src/
seg-d113122b7454 = Den genauen Feldsatz einer Art finden Sie in deren Eintrag in <a1><c1/></a1> (unten), im Abschnitt der Art in <a2><c2/></a2> oder in der entsprechenden <c3/>-Struktur in <c4/>.

# text
seg-e0c63207c019 = Weitere Dateien, die ein Lauf schreibt

# text
# c1: <scenario>.result.json
# c2: <scenario>.chart.svg
# c3: <scenario>.report.html
# c4: <scenario>.report.json
# c5: reproducibility
# c6: REPORTS.md
# c7: REPRODUCIBILITY.md
# c8: <scenario>.table.csv
# c9: --export
# c10: INTEROP.md
# c11: --animate
# c12: ANIMATION.md
seg-cc97989ca06b = Neben <c1/> schreibt die CLI (Kommandozeilenschnittstelle) <c2/>, ein druckbares <c3/> und denselben Bericht als <c4/>, dessen <c5/>-Block die Engine-Version, den SHA-256 der Szenariodatei, den Seed, die Plattform und den genauen Befehl festhält (siehe <a1><c6/></a1> und <a2><c7/></a2>). Arten, die eine Reproduzierbarkeitstabelle veröffentlichen, schreiben außerdem <c8/> (CSV: kommagetrennte Werte). <c9/> schreibt Austauschdateien (siehe <a3><c10/></a3>) und <c11/> eine Animation (siehe <a4><c12/></a4>).

# text
seg-489953601f3b = Einheiten und Herkunft, je Feld, für jede Art

# text
seg-61b33dbb44dd = Diese Seite ist von Hand geschrieben und deckt die Uhren- und Bahnpakete ab. Das maschinenlesbare Gegenstück deckt <b>jede</b> eingebaute Art ab:

# text
# c1: units
# c2: {"unit", "provenance", "note"}
# c3: []
# c4: *
# c5: src/field_schema.rs
seg-1e20fcda7f0b = <b>Im Ergebnis selbst.</b> Das Ergebnisdokument jedes Szenarios enthält ein <c1/>-Objekt auf oberster Ebene, das den Pfad eines ausgegebenen Feldes auf <c2/> abbildet. Die Pfadgrammatik (ein Array trägt ein mit <c3/> endendes Segment bei, das seine Zeilen gemeinsam nutzen; <c4/> ist ein Platzhalter für ein einzelnes Segment bei datenbasierten Objekten) und das geschlossene Vokabular der Herkunftsklassen sind in <a1><c5/></a1> definiert.

# text
seg-b8256437c0b7 = Als eine Datei.

# text
# c1: field-units-schema.json
# c2: coverage
seg-ae7136e34306 = <a1><c1/></a1> ist die zusammengeführte Vereinigung: für jede Art jedes numerische Feld, das sie an einer benannten Quelle ausgibt, mit Einheit, Herkunftsklasse, Evidenzstufe und Definition – und, benannt statt weggelassen, jedes Feld, das noch keine hat. Der <c2/>-Block enthält die Zählwerte.

# text
# c1: tests/field_units_global.rs
# c2: UNCOVERED_KINDS
seg-66af6dc065f7 = Beides wird von <c1/> durchgesetzt, das jede registrierte Art ausführt und fehlschlägt, wenn einem ausgegebenen numerischen Feld eine Einheit oder eine Herkunftsklasse fehlt. Noch nicht abgedeckte Arten sind in <c2/> dieser Datei einzeln mit dem Grund genannt, warum sie offen sind, und die Anzahl ist festgeschrieben, sodass die Liste nur kürzer werden kann.

# text
# c1: units
seg-ca49a577a07b = Erzeugen Sie das JSON nach jeder Änderung an der Form eines Berichts oder an einem <c1/>-Block neu:

# text
seg-ce4351cf7673 = <s1>Zurück</s1>Szenario-Referenz

# text
seg-b988dcc329a4 = <s1>Weiter</s1>Echte TLEs verwenden

# text
seg-6585c8a3643d = ClockRun (jeweils quantum / classical)

# text
seg-299f8a9643f1 = FoMScores (das fom-Objekt)
