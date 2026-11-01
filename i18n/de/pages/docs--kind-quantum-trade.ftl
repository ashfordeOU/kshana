# docs--kind-quantum-trade: translations (de)

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diesen Typ nennen.

# text
seg-debc2f07db78 = true

# text
seg-98151954f217 = false

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
seg-496b17a8d3b9 = Themenseite: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Nicht geliefert — nur Leistungsmodelle; Kaltatom-/Uhren-Hardware gehört einem Partner. Orakel (NoneKind): keine: eine Disziplin im Besitz eines Partners, bewusst ohne Modul und ohne Test

# text
seg-51cac2f918e0 = Themenseite: <a1>POSITIONING.md</a1>

# text
# c1: docs/kinds/by-kind/quantum-trade.md
seg-3a8c76a2396f = Quelle: <c1/>

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Quanten-gegen-klassisch-PNT-Trade ({ "13503" }): Nutzen einer Kandidatenuhr bei Zeitgebungs-Holdover + inertialem Holdover (eine gemessene ADEV-Kurve — der Angelpunkt der Verteidigbarkeit — oder eine Quantenuhrklasse) gegen eine klassische Basislinienklasse, mit dem am Artefakt mitgeführten Vorbehalt zur Annahme einer Langzeit-Untergrenze, plus eine Hüllkurve der GNSS-verweigerten Resilienz über die Zeit. MODELLED; quantifiziert (validiert nie) ein Partnergerät. Die Kandidatenuhr ist eine gemessene Kurve (<c1/> + <c2/>, gleich lang, mindestens { "2" } Punkte; sie gewinnt, wenn beide Formen angegeben sind) oder eine <c3/>.

# text
# c1: scenarios/quantum-trade.toml
seg-4f470bc1d82c = Ein Lauf von <c1/> fasst sich zusammen als: quantum-trade | Kandidat measured-ADEV | Zeitgebungs-Holdover 2621947s gegen 203s (12943.62x) | inertial 14108s gegen 378s (37.34x) | Resilienz-Auslauf 14108s | MODELLED [Vorbehalt Untergrenze angenommen]

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
seg-2639560aeff2 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: baseline_ins
# c2: candidate_ins
# c3: resilience_times_s
# c4: alt_pnt_bound_m
seg-d66f1ef84201 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-trade.toml
seg-f2cc0830b53f = Das Beispiel <c1/> setzt unter anderem:

# text
seg-ee5bcbbe0167 = csac

# text
seg-f5fa445702c6 = Ergebnisbezeichnung (die der Engine): MODELLED — quantifiziert (validiert nie) eine Partneruhr/einen Partnersensor; nicht im Flug demonstriert

# text
seg-93310aaa6ead = <b>VALIDATED</b> NNLS-Rückgewinnung eines Potenzgesetzes (Weiß-FM + Rotrausch-Boden) aus einer veröffentlichten gemessenen Allan-Abweichung des optischen ⁸⁸Sr-Uhrenübergangs — reproduziert σ_y(τ) und die Skalierung 4.7e-16/√τ bei kurzem τ mit einer echten gemessenen Langzeit-Untergrenze, statt Tests: <a1>optical_clock_adev_reference.rs</a1>.

# text
seg-fc46e95688ba = <b>VALIDATED</b> Gemessene-ADEV-NNLS-Anpassung, NEES/NIS-χ²-Konsistenzbänder und die diskrete Prozessrauschkovarianz der Uhr nach Van Loan (Holdover-Auslauf) — das Rechenrückgrat der Trade-Engine Tests: <a1>scipy_reference.rs</a1>.

# text
seg-6e2b62136cef = <b>MODELLED</b> Einlesen gemessener ADEV (NNLS), Trade-Tabelle (Zeitgebungs-/inertialer Holdover + Nutzen), Hüllkurve Resilienz über die Zeit; Vorbehalt zur Untergrenze am Artefakt mitgeführt.

# text
seg-b577b8464cf7 = <b>VALIDATED</b> Gemessene-ADEV-NNLS-Anpassung, NEES/NIS-χ²-Konsistenzbänder und die diskrete Prozessrauschkovarianz der Uhr nach Van Loan (Holdover-Auslauf) — das Rechenrückgrat der Trade-Engine. Unabhängige Referenz (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exakt, χ² <{ "5e-4" } bei Betriebs-Freiheitsgraden. Nur Kernel — Leistungszahlen der Geräte bleiben modelliert (nächste Zeile)

# text
seg-6b8aa8cd6d3e = <b>MODELLED</b> Einlesen gemessener ADEV (NNLS), Trade-Tabelle (Zeitgebungs-/inertialer Holdover + Nutzen), Hüllkurve Resilienz über die Zeit; Vorbehalt zur Untergrenze am Artefakt mitgeführt. Lauffähig von. Unabhängige Referenz (ExternalDataset): Der Kernel der Anpassung gemessene ADEV→PSD (NNLS) stimmt mit scipy.optimize.nnls überein (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — ein unabhängiger externer Kernel; aber die ZAHLEN des Trades quantifizieren (validieren nie) eine Partneruhr/CAI, sodass der Trade selbst MODELLED bleibt, ohne Validierungsnimbus

# text
# c1: label
seg-3d678f64e41c = MODELLED — quantifiziert (validiert nie) eine Partneruhr/einen Partnersensor; nicht im Flug demonstriert (Ergebnis <c1/>)

# text
seg-15275d27252a = Berechnet den Nutzen bei Zeitgebungs-Holdover und inertialem Holdover einer KANDIDATEN-Uhr gegenüber einer KLASSISCHEN Basislinie, plus eine Hüllkurve der GNSS-verweigerten Resilienz über die Zeit. Die Untergrenze des Kandidaten wird durch die MEASURED überlappende ADEV-Kurve einer Partneruhr (der Angelpunkt der Verteidigbarkeit) getrieben, angepasst durch nichtnegative kleinste Quadrate — das Holdover-Budget beruht also auf realen Daten, nicht auf einer angenommenen Langzeit-Untergrenze. (Kommentar der Szenariodatei, Zeilen { "3" } bis { "7" })

# text
seg-ecbdbc9b163e = EHRLICHER GELTUNGSBEREICH: MODELLED — sie QUANTIFIZIERT den Nutzen einer Quantenuhr eines Partners; sie validiert das Gerät NICHT und borgt sich nie die Validierungsinseln von SGP4/Allan/IGS. Ist die Untergrenze einer Zeile ein angenommener Klassenstandard, wird am Artefakt ein Vorbehalt zur Untergrenze ausgegeben. Lauf: kshana scenarios/quantum-trade.toml (Kommentar der Szenariodatei, Zeilen { "9" } bis { "12" })

# text
seg-4b59ac409819 = Quanten-gegen-klassisch-PNT-Trade & GNSS-verweigerte Resilienz ({ "13503" }) ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, sodass die Fähigkeit modelliert bleibt. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e6498fae3ba7 = <s1>Zurück</s1>quantum-time-transfer

# text
seg-50d4bbb7486b = <s1>Weiter</s1>realtime-frame-eop

# text
# c1: kshana kinds --json
seg-20ba66ae9518 = Quanten-gegen-klassisch-PNT-Trade ({ "13503" }): Nutzen einer Kandidatenuhr bei Zeitgebungs-Holdover + inertialem Holdover (eine gemessene ADEV-Kurve — der Angelpunkt der Verteidigbarkeit — oder eine Quantenuhrklasse) gegen eine klassische Basislinienklasse, mit dem am Artefakt mitgeführten Vorbehalt zur Annahme einer Langzeit-Untergrenze, plus eine Hüllkurve der GNSS-verweigerten Resilienz über die Zeit. (Szenarioarten-Katalog (<c1/>))

# text
# c1: kshana kinds --json
seg-45a1d84eef18 = MODELLED; quantifiziert (validiert nie) ein Partnergerät. (Szenarioarten-Katalog (<c1/>))

# attr:alt
seg-c74c63ffd859 = Das Diagramm, das die Engine für scenarios/quantum-trade.toml schreibt, Art quantum-trade

# text
# c1: quantum-trade
seg-f9af2813532e = <c1/> (Szenarioart)

seg-a349aa76b0ed = PARTNER
