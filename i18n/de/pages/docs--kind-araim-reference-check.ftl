# docs--kind-araim-reference-check: translations (de)

# text
seg-debc2f07db78 = true

# text
# c1: docs/kinds/by-kind/araim-reference-check.md
seg-c53da0bf140d = Quelle: <c1/>

# text
# c1: araim-reference-check
seg-82884391dd77 = <c1/> (Szenarioart)

# text
seg-8e845ce908ee = Szenarioart der Engine v{ $version }, Familie <a1>GNSS-Messungen, Positionierung und Integrität</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
# c1: published
seg-06197409c717 = Veröffentlichte ARAIM-Zertifizierungs-Referenzvektoren: Die horizontalen und vertikalen ARAIM-Schutzniveaus der Engine laufen gegen die EIGENEN durchgerechneten numerischen Beispiele der WG-C-ARAIM-Technical-Subgroup, mit der Toleranz (TOL_PL = { "5e-2" } m), die diese Dokumente selbst nennen. Zwei Vektoren sind als Fixtures eingecheckt, jeder mit seiner Abruf-URL, seinem Abrufdatum, dem SHA-256 der Quelldatei und der Seite: dem Anhang D des Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) — in sich konsistent und der Abnahmevektor — und dem Milestone { "3" } Report ({ "2016" }) Annex A Abschnitt A.IX, der Aussage, die die Forschungsbibliografien zitieren. Jede veröffentlichte Eingabe (die Geometriematrix mit 10 Satelliten und 2 Konstellationen, die Varianzdiagonalen C_int und C_acc, b_nom, P_sat, P_const und der konstante Satz für LPV-200) und jede veröffentlichte Ausgabe (VPL, HPL, EMT, sigma_v_acc, K_fa_3 und sigma_3, sigma_ss_3 und b_3 der beiden Konstellationsfehlermodi) wird neben der eigenen Zahl der Engine und ihrer absoluten Differenz gemeldet. Die Schutzniveaugleichung wird hier NICHT neu gelöst: Die Modusliste der Referenz wird den bestehenden raim::araim_protection_level / araim_integrity_risk der Engine übergeben, sodass die geprüfte Bisektion und Gauß-Schwanz-Algebra die eigenen der Engine sind; nur die Geometrie, die Teillösungen, die Detektionsschwellen und die veröffentlichte Budgetaufteilung werden dafür gebaut. EXTERNALLY CHECKED gegen den Vektor von { "2019" }: VPL { "18.2926" } m gegenüber veröffentlichten { "18.3" } m, HPL { "13.4063" } m gegenüber { "13.45" } m, EMT { "7.2997" } m gegenüber { "7.2998" } m, sigma_v_acc { "1.3694" } m gegenüber { "1.3694" } m und alle sechs veröffentlichten Zwischenwerte auf eine halbe Einheit in ihrer letzten gedruckten Dezimalstelle. Der Vektor von { "2016" } trägt zwei interne Mängel, die der Bericht nennt, statt sie zu verbergen — einen Vorzeichenfehler in Zeile { "3" } von G und ein K_fa_3, das bei { "57" } Fehlermodi ausgewertet wurde, während das Dokument N_fault_max = { "1" } ({ "12" } Modi) nennt — sodass seine Geometrie-Zwischenwerte exakt reproduziert werden, während seine Schutzniveaus als gemessene Abweichungen gemeldet und aus der Abnahmezahl ausgeschlossen werden; die Toleranz wird nie geweitet, um sie aufzunehmen. Jedes ausgegebene numerische Feld trägt eine Einheit und eine Herkunftsklasse, und eine abgeschriebene Zahl ist mit <c1/> bezeichnet, sodass sie nie mit einer berechneten verwechselt werden kann. UMFANG: Nur N_fault_max = { "1" } (Fehlermodi einzelner Satelliten und einzelner Konstellationen) ist implementiert, und ein Fall, dessen Prioris gleichzeitige Fehlerteilmengen mit mehreren Ereignissen erfordern, wird REFUSED, statt stillschweigend gekürzt zu werden; Fehlererkennung, Ausschluss, die Chi-Quadrat-Konsistenzprüfung und der Umverteilungsschritt gegen Doppelzählung des Referenzalgorithmus liegen außerhalb des Umfangs. Dies reproduziert das durchgerechnete Beispiel eines veröffentlichten Referenzalgorithmus — es ist keine Zertifizierung, kein Lufttüchtigkeitsartefakt und keine Zulassung.

# text
# c1: scenarios/araim-reference-check.toml
seg-c16de81ec8da = Ein Lauf von <c1/> fasst sich so zusammen: araim-reference-check: { "2" } published WG-C reference vector(s); worst VPL/HPL agreement { "0.0437" } m against the reference's own TOL_PL = { "0.05" } m over { "1" } acceptance vector(s)

# text
# c1: vector
seg-b1be6b5632c1 = Optionale Felder: <c1/>

# text
# c1: scenarios/araim-reference-check.toml
seg-3f181d41edb5 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-9de6e1b3352d = Ergebnisbezeichnung (die der Engine): EXTERNALLY CHECKED — die ARAIM-Schutzniveaus der Engine laufen gegen die veröffentlichten durchgerechneten numerischen Beispiele des Referenz-Airborne-Algorithmus der Technical Subgroup ARAIM der EU-U.S. Working Group C, mit der Toleranz (TOL_PL), die diese Dokumente selbst nennen. Jede veröffentlichte Zahl trägt ihre Quell-UR

# attr:alt
seg-693c823c85d1 = Das Diagramm, das die Engine für scenarios/araim-reference-check.toml schreibt, Art araim-reference-check

# text
seg-3068552e4ab4 = VALIDATED: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-c5c966ec3c6a = <b>VALIDATED</b> Die Schutzniveaugleichung der Mehrfachhypothesen-Lösungstrennung selbst: gewichtete Kleinste-Quadrate-Lösung mit allen sichtbaren Satelliten und je Fehlermodus auf einer Ost/Nord/Oben-Geometrie mit einem Uhrenzustand je Konstellation, die Sigmas der Teillösungen, Lösungstrenn Tests: <a1>araim_reference_vectors.rs</a1>.

# text
seg-a99b9cf4c6e8 = <b>VALIDATED</b> Die Schutzniveaugleichung der Mehrfachhypothesen-Lösungstrennung selbst: gewichtete Kleinste-Quadrate-Lösung mit allen sichtbaren Satelliten und je Fehlermodus auf einer Ost/Nord/Oben-Geometrie. Unabhängige Referenz (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" }. Juni { "2019" }), durchgerechnetes numerisches Beispiel in Anhang D — veröffentlichte EINGABEN (Geometriematrix mit 10 Satelliten und 2 Konstellationen, Diagonalen C_int/C_acc, b_nom, P_sat, P_const, Konstanten für LPV-200) und veröffentlichte AUSGABEN (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } und sechs Zwischenwerte der Konstellationsfehler

# text
seg-f6b7ca020692 = Familienseite: <a1>GNSS-Messungen, Positionierung und Integrität</a1>

# text
seg-f4cf8b629797 = Themenseite: <a1>INTEGRITY.md</a1>

# text
seg-e6b1f9a47b5d = Themenseite: <a1>ARAIM_REFERENCE.md</a1>

# text
seg-7cf434223fa5 = <s1>Zurück</s1>aperture-duty-cycle

# text
seg-ed2003ecf41b = <s1>Weiter</s1>ascent-losses
