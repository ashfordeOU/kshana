# docs--araim-reference: translations (de)

# text
# c1: docs/ARAIM_REFERENCE.md
seg-c316596d7ec8 = Quelle: <c1/>

# text
seg-4768b19aaed7 = ARAIM-Referenz — Schutzniveaus des Advanced RAIM in Kshana

# text
# c1: src/raim.rs
seg-93c83a737a43 = Diese Notiz dokumentiert die offene Implementierung von <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b> in Kshana: den Algorithmus, jede Annahme, die Integritätsunterstützungsnachricht, die er verarbeitet, und den Validierungsstatus. Die Implementierung liegt in <a1><c1/></a1>; dieses Dokument ist der Begleittext, den ein Prüfer (oder ein Beschaffungsgutachter) neben dem Code lesen kann.

# text
seg-f5a7abecc2df = ARAIM ist der Zwei-Konstellationen-Mehrfrequenz-Nachfolger des klassischen RAIM, den die Working Group C (WG-C) von GPS (Global Positioning System) und Galileo definiert hat, um horizontale und vertikale Führung bis hinunter zu LPV-200 zu unterstützen (LPV: localizer performance with vertical guidance). Er beantwortet für jede Epoche eine einzige Frage:

# text
# c1: P_HMI
seg-252dac107a2a = Wie groß muss die Positionsfehlerschranke (das <em>Schutzniveau</em>) sein, damit die Restwahrscheinlichkeit <em>gefährlich irreführender Information</em> — ein Fehler größer als die Schranke, während die Schranke noch innerhalb der Alarmgrenze liegt — unter dem Integritätsrisikobudget <c1/> bleibt?

# text
seg-04299e9742b7 = { "1" }. Die Integritätsunterstützungsnachricht (ISM)

# text
# c1: IntegritySupportMessage
seg-717bea7d6bc8 = Die ISM ist der je Konstellation geltende Parametersatz, den der Nutzer anwendet. Sie wird von <a1><c1/></a1> ausdrücklich modelliert:

# text
seg-fffbeccd4266 = Symbol

# text
seg-2247a2344710 = Bedeutung

# text
seg-d7e49778bed2 = σ_URE / SISE (Signal-in-Space-Fehler)

# text
seg-b1b5bca63e21 = Entfernungsfehler-RMS (Effektivwert), verwendet für <b>Genauigkeit und Kontinuität</b>

# text
seg-8ff2973d7f5b = σ_URA / SISA (Signal-in-Space-Genauigkeit)

# text
seg-f993962a5c9b = Entfernungsfehlerschranke, verwendet für die <b>Integrität</b> (≥ σ_URE)

# text
# c1: b_k = Σ_i |s_i|·b_nom
seg-727c7fbe1b01 = maximaler nominaler Entfernungs-Bias, einseitig in die Integritätsschranke eingerechnet (<c1/>); siehe §{ "3" }

# text
seg-a79e42c29c46 = A-priori-Wahrscheinlichkeit eines unentdeckten Einzelsatellitenfehlers

# text
seg-78c45312d2ff = A-priori-Wahrscheinlichkeit eines konstellationsweiten Fehlers

# text
# c1: IntegritySupportMessage::gps_galileo_reference()
seg-19cc5ff2e541 = <c1/> gibt die veröffentlichten Referenzwerte der WG-C zurück: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> über das Expositionsintervall. Das sind die Werte, mit denen in der Referenzliteratur die ARAIM-Verfügbarkeit dimensioniert wird; die operative ISM wird gesendet bzw. am Boden zusammengestellt und ist je Konstellation konfigurierbar. Die Unterscheidung zwischen σ_URA (Integrität) und σ_URE (Genauigkeit) ist gewollt und das bestimmende Merkmal des ISM-Konzepts.

# text
# c1: .fault_priors()
# c2: .dual_fault_priors()
seg-0c1687628e67 = <c1/> und <c2/> reichen diese unmittelbar an die beiden Engines weiter.

# text
seg-8c516e53f595 = { "2" }. Fehlerhypothesen

# text
# c1: H_k
seg-b6353366ebf0 = ARAIM ist ein Verfahren der <em>Lösungstrennung mit mehreren Hypothesen</em> (MHSS). Für jede Fehlerhypothese <c1/> bildet es die Gesamtlösung aller sichtbaren Satelliten und die Teillösung, die die fehlerbehaftete Menge ausschließt, und begrenzt den Positionsfehler unter dieser Hypothese:

# text
# c1: H_0
# c2: ≈ 1
seg-3b340e082b84 = <c1/> (a priori <c2/>): die vollständige Positionslösung nach kleinsten Quadraten aus allen sichtbaren Satelliten.

# text
seg-03332e433edc = Fehler einzelner Satelliten

# text
# c1: H_i
# c2: P_sat
# c3: araim_raim
seg-add4792e4e40 = <c1/> (a priori je <c2/>): jede Teillösung mit Ausschluss eines Satelliten. Das ist die klassische ARAIM-Basislinie für Einzelfehler, <a1><c3/></a1>.

# text
seg-7e20f419e670 = Konstellationsweite Fehler

# text
# c1: H_c
# c2: P_const
# c3: araim_dual_raim
# c4: P_const = 0
# c5: araim_raim
seg-920bd35833ff = <c1/> (a priori je <c2/>): die Teillösung, die <em>alle</em> Satelliten einer Konstellation auf einmal entfernt, die in <a1><c3/></a1> implementierte Erweiterung nach der EU-ARAIM-TN (EU: Europäische Union; TN: technische Note) / DO-316. Mit <c4/> reduziert sie sich <b>bitgenau</b> auf <c5/>.

# text
seg-323dd205d238 = { "3" }. Schutzniveaus

# text
# c1: (p_fault, threshold, σ)
# c2: K_fa = Φ⁻¹(1 − P_fa / 2N)
# c3: N
# c4: PL
seg-9ab2676d2554 = Für jede Achse (vertikal, horizontal) und jede Hypothese baut die Engine einen Modus <c1/>, wobei die Schwelle die Detektionsgrenze der Lösungstrennung beim Fehlalarm-Multiplikator <c2/> ist (eine Bonferroni-Aufteilung des Kontinuitätsbudgets auf die <c3/> Hypothesen). Das Schutzniveau ist die kleinste Schranke <c4/>, deren aufsummiertes Integritätsrisiko

# text
seg-05c0d8fc855c = Hinweis zur Implementierung.

# text
# c1: b_k = Σ_i |s_{axis,i}|·b_nom
# c2: axis_bias_sum
# c3: horiz_bias_sum
# c4: b_nom_m
# c5: b_nom = 0.75 m
# c6: b_nom = 0
# c7: integrity
# c8: sigma_ura_m
# c9: sigma_uere_m
# c10: b_nom_m
# c11: INTEGRITY.md
seg-248092fe9b94 = <c1/> ist die einseitige Projektion des nominalen Bias auf die Achse — die ungünstigste Summe der Beträge der Verstärkungen je Satellit (<a1><c2/>/<c3/></a1>) —, bezogen aus dem <c4/> der ISM. Die WG-C-Referenz-ISM verwendet <c5/>; mit <c6/> reduziert sich die Schranke auf die MHSS-Form ohne nominalen Bias. Das lauffähige Szenario <c7/> stellt <c8/> bereit (die für das Schutzniveau verwendete Integritätsschranke, auf ≥ <c9/> begrenzt und standardmäßig darauf gesetzt) und <c10/> (Standard { "0" }), sodass das Schutzniveau stets mit der Integritätsschranke σ_URA dimensioniert wird, nie mit der kleineren Genauigkeit σ_URE. Dies bleibt eine <b>modellierte, nicht zertifizierte</b> ARAIM-Implementierung — siehe <a2><c11/></a2>.

# text
# c1: araim_protection_level
# c2: araim_integrity_risk
# c3: ≤
seg-f6bccff61ff5 = das zugeteilte Budget einhält ([<c1/>] / <a1><c2/></a1>). VPL (vertikales Schutzniveau) und HPL (horizontales Schutzniveau) sind die vertikale und die horizontale Antwort. Das Ergebnis meldet außerdem das tatsächlich erreichte Integritätsrisiko (<c3/> die Zuteilung) und ob sich eine Teillösung über ihre Schwelle hinaus getrennt hat.

# text
seg-b1a868221848 = Das ist der ausdrückliche ARAIM-Vertrag — „Wie groß muss die Schranke sein?“ — statt des impliziten, geometrieabhängigen Risikos eines klassischen RAIM mit festem Multiplikator.

# text
seg-c90cf313dea8 = { "4" }. Stanford-Diagramm

# text
# c1: StanfordDiagram
# c2: (error, PL)
# c3: classify_stanford
# c4: stanford_svg
# c5: PL = error
seg-b51e44c3deda = <a1><c1/></a1> sammelt je Epoche <c2/> gegen eine feste Alarmgrenze (AL), und <a2><c3/></a2> ordnet jede in <em>verfügbar</em>, <em>System nicht verfügbar</em> (PL > AL, konservativ), <em>irreführende Information</em> (PL < Fehler ≤ AL) oder <em>gefährlich irreführende Information</em> (Fehler > AL und > PL) ein. <a3><c4/></a3> stellt das klassische Streudiagramm — die Integritätsgrenze <c5/>, die Hilfslinien der Alarmgrenze und ein farbcodierter Marker je Epoche — als eigenständige SVG (Scalable Vector Graphics) dar.

# text
seg-c902173f6acf = { "5" }. Der Nutzen von zwei Konstellationen

# text
# c1: raim::tests::dual_constellation_improves_geometry_and_tolerates_a_constellation_fault
seg-96e114a6981c = Zwei Effekte werden in <c1/> gezeigt:

# text
seg-06c7d8d62b44 = <b>Geometrie / Redundanz</b> — das Zusammenfassen der Satelliten einer zweiten Konstellation verengt das HPL für Einzelfehler: mehr Messungen und eine größere Menge von Einzel-SV-Teillösungen (SV: Raumfahrzeug, also ein Satellit) ergeben eine strikt kleinere Schranke.

# text
# c1: P_const
# c2: araim_dual_raim
# c3: None
seg-f788c9e07547 = <b>Toleranz gegenüber Konstellationsfehlern</b> — mit aktivem <c1/> bleibt der Nutzer mit zwei Konstellationen verfügbar, wenn eine ganze Konstellation ausfallen kann (Satelliten der <em>anderen</em> Konstellation überleben), während ein Nutzer mit nur einer Konstellation nachweislich nicht gegen den Fehler seiner eigenen Konstellation geschützt werden kann (<c2/> gibt <c3/> zurück).

# text
seg-f52a937bad94 = Eine Feinheit, die ehrlich gesagt werden sollte: Weil die Hypothese eines Konstellationsfehlers verlangt, den Verlust einer <em>ganzen</em> Konstellation zu überstehen, ist das <em>Momentaufnahme</em>-Schutzniveau mit zwei Konstellationen nach unten durch die verbleibende Geometrie einer einzelnen Konstellation begrenzt — es ist nicht automatisch in jedem Augenblick kleiner als das reine GPS-PL. Das Kernergebnis der EU-ARAIM-TN, dass GPS+Galileo ein um <b>{ "15" }–{ "25" } % kleineres HPL</b> ergibt, ist ein <b>Verfügbarkeits</b>ergebnis, aufgelaufen über realistische Konstellationen und Nutzerstandorte, keine Garantie je Momentaufnahme.

# text
seg-b4289b877902 = { "6" }. Validierungsstatus

# text
# c1: P_const = 0
# c2: tests/igs_real_data.rs
seg-e553de2eee63 = <b>Im Repository, automatisiert:</b> die MHSS-Algebra (<c1/> ⇒ bitgenau Einzelfehler; Konstellationsfehler weitet das PL; Budget nie überschritten), die oben genannten Vorteile bei Geometrie und Konstellationsfehlern sowie die Erprobung an <b>realer präziser Bahngeometrie des IGS (International GNSS Service; GNSS = globales Satellitennavigationssystem) (SP3, Standard Product { "3" })</b> (<c2/>), nicht nur an synthetischen Konstellationen.

# text
# c1: src/araim_reference.rs
# c2: tests/araim_reference_vectors.rs
# c3: tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt
# c4: TOL_PL = 5 × 10⁻² m
# c5: G
# c6: K_fa,3
# c7: N_fault,max = 1
# c8: araim-reference-check
seg-633bf11af170 = <b>Externe unabhängige Referenz — das veröffentlichte WG-C-Rechenbeispiel:</b> Die Schutzniveaus werden gegen das eigene numerische Beispiel der ARAIM Technical Subgroup geprüft, in <a1><c1/></a1>, <c2/> und der eingecheckten Fixture <c3/> (jeder Vektor trägt seine Abruf-URL (Webadresse), sein Abrufdatum, den SHA-256 der Quelldatei (SHA: Secure Hash Algorithm) und die Seite). Die Akzeptanztoleranz ist das eigene <c4/> der Referenz. Gegen das Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Anhang D: <b>VPL { "18.2926" } m gegenüber veröffentlichten { "18.3" } m (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m gegenüber { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (effektive Monitorschwelle) { "7.2997" } m gegenüber { "7.2998" } m, σ_v,acc { "1.3694" } m gegenüber { "1.3694" } m und alle sechs veröffentlichten Zwischenwerte für Konstellationsfehler (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) innerhalb einer halben Einheit der letzten gedruckten Dezimalstelle. Der Milestone-{ "3" }-Bericht von { "2016" } nennt dasselbe Beispiel, enthält aber zwei interne Mängel — einen Vorzeichenfehler in Zeile { "3" } von <c5/> und ein <c6/>, ausgewertet bei { "57" } Fehlermodi, während das Dokument <c7/> ({ "12" } Modi) angibt —, sodass seine Geometrie-Zwischenwerte exakt reproduziert werden, seine Schutzniveaus aber als gemessene Abweichungen festgehalten (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) und aus der Akzeptanzzahl ausgeschlossen werden. Die Prüfung ist als Szenarioart <c8/> erreichbar.

# text
# c1: N_fault,max = 1
seg-6d79f9836abd = <b>Ehrlicher Rest (extern / Prüfung ausstehend):</b> die Verfügbarkeitszahl von { "15" }–{ "25" } % gegen einen <b>versionsgebundenen echten Schnappschuss von Celestrak-TLEs (Two-Line-Element-Sätze)</b> und das Hinterlegen der ARAIM-Testfixtures als zitierbarer <b>Zenodo</b>-Eintrag. Die obige Referenzprüfung deckt nur <c1/> ab (Fehlermodi einzelner Satelliten und einzelner Konstellationen); gleichzeitige Fehlermengen aus mehreren Ereignissen, Fehlerausschluss, die χ²-Konsistenzprüfung und der Umverteilungsschritt gegen Doppelzählung des Referenzalgorithmus sind nicht implementiert, und ein Fall, dessen A-priori-Werte sie bräuchten, wird abgelehnt statt abgeschnitten.

# text
# c1: integrity
# c2: araim_dual_raim
# c3: araim_dual = true
# c4: p_hmi
# c5: scenarios/araim-gps-galileo.toml
# c6: tests/araim_dual_real_data.rs
seg-b57b889dc536 = <b>Reichweite in der Szenariodatei:</b> Die Szenarioart <c1/> führt in jeder Epoche <c2/> aus, wenn ihre TOML-Datei (Tom's Obvious Minimal Language) <c3/> setzt (optional <c4/>); die mitgelieferte <a1><c5/></a1> tut das über eine zusammengefasste GPS- + Galileo-Geometrie, und <c6/> führt dieselbe Engine an echten Celestrak-TLEs von GPS und Galileo aus, die auf eine gemeinsame Epoche propagiert wurden. Ohne das Flag verwendet der Runner das klassische RAIM mit Lösungstrennung.

# text
seg-6cb7a787ac67 = Referenzen

# text
seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } February { "2016" } — Annex A (reference user algorithm) und §A.IX (numerical example). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

# text
seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } June { "2019" } — Appendix D (numerical example for LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

# text
seg-8758a6e4f6eb = EU–US (Vereinigte Staaten) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

# text
seg-c4d2879b2ec4 = RTCA (früher Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimum operational performance standards); DO-316-ARAIM-MASPS-Material (minimum aviation system performance standards).

# text
seg-d5ed1c3cfb1f = Blanch et al., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

# text
seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (Methodik des Stanford-Diagramms).

# text
seg-d4f50d307775 = <s1>Zurück</s1>Spektrum und Wasserfall

# text
seg-f05ca316fe8e = <s1>Weiter</s1>DO-316 / DO-229E-Zuordnung
