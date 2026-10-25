# docs--kind-realtime-frame-eop: translations (de)

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diesen Typ nennen.

# text
seg-ddf4702f78e5 = Ehrlichkeit: VALIDATED sind die geschlossene Form (der Hebelarm L19, omega_earth gegengeprüft am CIO-Erdrotationswinkel) und reale Daten (die UT1- und Polbewegungskurven L18 aus den realen finals2000A-Zeilen). DERIVED ist die Untergrenze der Realisierung des Bezugssystems (das Post-Fit-Residuum der Helmert-Transformation). MODELLED sind die Größenordnungen der Kovarianz der Bahnbestimmung des Mondrelais ({ "0.27" } m nachverarbeitet, ~{ "14.4" } m in Echtzeit bei einer Stunde Latenz — gerundet, nicht rückgerechnet, alle (Kommentar der Szenariodatei, Zeilen { "27" } bis { "32" })

# text
seg-bc51b666d070 = Der Vorhersagefehler einer betriebsnahen Erdorientierungsvorhersage, gemessen als Vorhersage gegenüber Endwert, ist MODELLED, nicht validiert: geprüft gegen eine separate Implementierung in derselben Codebasis — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-653fad5e0afe = <s1>Zurück</s1>quantum-trade

# text
seg-5abe534d4ef1 = <s1>Weiter</s1>reentry

# text
seg-8e845ce908ee = Szenarioart der Engine v{ $version }, Familie <a1>GNSS-Messungen, Positionierung und Integrität</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-f6b7ca020692 = Familienseite: <a1>GNSS-Messungen, Positionierung und Integrität</a1>

# text
seg-a2889fb2b42a = Themenseite: <a1>integrations.md</a1>

# text
# c1: docs/kinds/by-kind/realtime-frame-eop.md
seg-1ad013ffb9d1 = Quelle: <c1/>

# text
# c1: realtime-frame-eop
seg-54620502f0dd = <c1/> (Szenario-Kind)

# text
seg-edfcb546d9de = Echtzeit-Budget der Vorhersage von Mondbezugssystem / Erdorientierung: P4-Tabelle { "1" } (die Konsistenzprüfung des Bezugssystemfehlers — nachverarbeitet ~{ "0.27" } m ↔ ~{ "0.010" } ms und Echtzeit ~{ "15" } m ↔ ~{ "0.5" } ms, jede Bezugssystemposition ausgedrückt als ihr äquivalenter UT1-Fehler über den L19-Hebelarm Δr = D_EM·ω⊕·ΔUT1) und Tabelle { "2" } (gemessener UT1-Vorhersagefehler gegen den Horizont — die L18-Kurve, direkt aus der realen IERS-Reihe finals2000A abgelesen: die endgültige Untergrenze Bulletin A − Bulletin B und der Fehler des Persistenz-Prädiktors über mehrere Tage, jeweils durch L19 auf eine Position im Mondbezugssystem abgebildet), plus das L21-Echtzeit-Bezugssystemfehlerbudget als Wurzel aus der Quadratsumme (EOP + Ephemeride + Realisierungs-Untergrenze). VALIDATED: die geschlossene Form (der L19-Hebelarm, ω⊕ gegengeprüft gegen den CIO-Erdrotationswinkel) und VALIDATED: reale Daten (die L18-Kurve aus den realen finals2000A-Zeilen); MODELLED sind die Größenordnungen der Kovarianz der Bahnbestimmung des Mondrelais und die Untergrenze der Bezugssystemrealisierung (repräsentative Zuweisungen) sowie der Persistenz-Prädiktor (nicht der operative Bulletin-A-Algorithmus des IERS). Kein zertifiziertes Echtzeit-Bezugssystemprodukt.

# text
# c1: scenarios/realtime-frame-eop.toml
seg-488039e4240f = Ein Lauf von <c1/> fasst sich zusammen als: realtime-frame-eop | Tabelle { "1" }: nachverarbeitet { "0.27" } m ({ "0.0096" } ms UT1) ↔ Echtzeit { "14.4" } m ({ "0.514" } ms UT1) | Tabelle { "2" }: endgültige Untergrenze { "0.0171" } ms → 3 Tage { "1.6644" } ms | Budget gesamt { "20.1" } m ({ "67.0" } ns) | L19-Hebelarm + L18-Realdaten (validiert), Bahnbestimmungs-Kov. (modelliert)

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-66264ec78a4c = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

# text
# c1: scenarios/realtime-frame-eop.toml
seg-45a4ed476311 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-c39a26aa1f1e = mitgelieferte Fixture finals2000A_20260930

# text
seg-9ef8a2b4c144 = Ergebnisbezeichnung (die der Engine): Echtzeit-Budget der Vorhersage von Mondbezugssystem / Erdorientierung. VALIDATED geschlossene Form: der L19-Hebelarm ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ gegengeprüft gegen den CIO-Erdrotationswinkel. VALIDATED reale Daten: die L18-Vorhersagefehlerkurven für UT1 und Polbewegung, direkt aus den realen IERS-finals200

# attr:alt
seg-2721ed7727bb = Das Diagramm, das die Engine für scenarios/realtime-frame-eop.toml schreibt, Kind realtime-frame-eop

# text
seg-72a1fc2f5c90 = <b>VALIDATED</b> Eine Tabelle gibt den UT1-Vorhersagefehler, den Polfehler der Polbewegung und ihre quadratische Kombination am Mond über einen IDENTISCHEN Epochensatz pro Horizont aus und gibt die Epochen aus, an denen jede Komponente gemessen wurde. Tests: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

# text
# c1: realtime-frame-eop
seg-b1d90bf98ac3 = <b>VALIDATED</b> Der Laufzeit-Standard von <c1/> ist die eigene eingebettete Kopie der Bibliothek eines wortgetreuen IERS-finals2000A-Auszugs (tools/finals2000A_20260930.txt: { "174" } aufeinanderfolgende Tageszeilen, MJD 61224-61397, ausgeschnitten aus der finals2000A.all vom 2026-09-30) trägt Tests: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-0298bd40d72f = <b>MODELLED</b> Eine Kleinste-Quadrate-Anpassung von Bias plus Rate über ein nachlaufendes Fenster plus die wichtigsten periodischen Terme — jährlich, halbjährlich und die zwei wichtigsten zonalen Gezeiten für UT1; Chandler, jährlich und halbjährlich für den Pol — extrapoliert mit dem letzten im Fenster liegenden Tests: <a1>operational_eop_predictor_reference.rs</a1>.

# text
seg-12efcd20ca62 = <b>VALIDATED</b> Eine Tabelle gibt den UT1-Vorhersagefehler, den Polfehler der Polbewegung und ihre quadratische Kombination am Mond über einen IDENTISCHEN Epochensatz pro Horizont aus, gibt. Unabhängige Referenz (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3), das das IERS-Produkt finals2000A mit seiner eigenen Regel Bulletin B sonst A liest, und pyerfa { "2.0.1.5" } (SOFA) volle Rotationen vom Himmels- ins Erdsystem (c2i06a, sp00, pom00, c2tcio; der Erdrotationswinkel nach IERS { "2010" } Gl. { "5.15" } in exakter Arithmetik), als separate Programme auf wortgetreuen Zeilen der eingefrorenen finals2000A.all vom 2026-09-30 ausgeführt; vorregistriert (455b8fb5) mit den Änderungen A1 und A2, die nur

# text
# c1: realtime-frame-eop
seg-020e5919c8fd = <b>VALIDATED</b> Der Laufzeit-Standard von <c1/> ist die eigene eingebettete Kopie der Bibliothek eines wortgetreuen IERS-finals2000A-Auszugs (tools/finals2000A_20260930.txt: { "174" } aufeinanderfolgend. Unabhängige Referenz (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), das dieselben Bytes mit seinem eigenen Leser liest, und die Tabelle des IERS Bulletin A Vol. XXXIX No. { "039" }, Zahl für Zahl kopiert; vorregistriert (6fdae01b) mit sechs exakten Kriterien, bevor astropy ausgeführt wurde. Alle sechs gelten: { "30" } endgültige, { "54" } schnelle und { "90" } vorhergesagte Zeilen mit gleichen MJD-Listen, jede vorhergesagte Zeile mit Flag P, die Zählung im Standardlauf gleich, und die Vorhersagen gleich Bullet

# text
seg-530c87bbff78 = <b>MODELLED</b> Eine Kleinste-Quadrate-Anpassung von Bias plus Rate über ein nachlaufendes Fenster plus die wichtigsten periodischen Terme — jährlich, halbjährlich und die zwei wichtigsten zonalen Gezeiten für UT1; Cha. Unabhängige Referenz (ReferenceImpl): Drei unabhängige Wege, keiner davon eine veröffentlichte Angabe zur Vorhersagegenauigkeit. ({ "1" }) Ein analytisches Signal mit bekannten Koeffizienten — der einzige Weg, die periodische Maschinerie zu prüfen, da keine eingecheckte Reihe lang genug ist, um einen Jahresterm zuzulassen. ({ "2" }) Die Lehrbuch-Lösung der kleinsten Quadrate in geschlossener Form, andere Algebra als die geprüfte Matrixlösung, auf realen Zeilen. ({ "3" }) Die echten archivierten Vorhersagezeilen von Bulletin A, die

# text
# c1: label
seg-a233df86be95 = Echtzeit-Budget der Vorhersage von Mondbezugssystem / Erdorientierung. VALIDATED geschlossene Form: der L19-Hebelarm ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ gegengeprüft gegen den CIO-Erdrotationswinkel. VALIDATED reale Daten: die L18-Vorhersagefehlerkurven für UT1 und Polbewegung, direkt aus der realen IERS-Reihe finals2000A abgelesen (Bulletin A schnell gegen Bulletin B endgültig und Persistenz über mehrere Tage auf den realen Tageszeilen). DERIVED: das Bezugssystem (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-60e7ee7e6e3e = VALIDATED geschlossene Form (der L19-Hebelarm, ω⊕ gegengeprüft gegen den CIO-Erdrotationswinkel) und VALIDATED reale Daten (die L18-Kurve aus den realen finals2000A-Zeilen); MODELLED sind die Größenordnungen der Kovarianz der Bahnbestimmung des Mondrelais und die Untergrenze der Bezugssystemrealisierung (repräsentative Zuweisungen) sowie der Persistenz-Prädiktor (nicht der operative Bulletin-A-Algorithmus des IERS). (Kind-Katalog (<c1/>))
