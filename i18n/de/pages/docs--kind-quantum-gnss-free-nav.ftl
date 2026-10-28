# docs--kind-quantum-gnss-free-nav: translations (de)

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN). Unabhängige Referenz (ExternalDataset): Veröffentlichte numerische Vektoren aus Primärarbeiten zu CAI (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² exakt getroffen, die Schrotrausch-ASD ein einseitiger Boden innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen über dem Quantenboden). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): das reine QPN-Rotationsrauschen gegen das gemessene von Gauguet et al.

# text
seg-9955b1b1c018 = Die Leistung von Quanten-Inertialsensoren ist MODELLED, nicht validiert: Eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
seg-496b17a8d3b9 = Themenseite: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Themenseite: <a1>QUANTUM.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Nicht geliefert — nur Leistungsmodelle; Kaltatom-/Uhren-Hardware gehört einem Partner. Orakel (NoneKind): keine: eine Disziplin im Besitz eines Partners, bewusst ohne Modul und ohne Test

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Ein reproduzierbares TradeEvidence-Objekt (fester Rahmen: Szenario+Seed+Engine; gemeinsame Quanten-gegen-klassisch-Werte pro FoM mit polaritätsrichtigem Nutzen, optional { "95" }%. Unabhängige Referenz (InternalConsistency): Identitäten für Nutzen/Gewinner in geschlossener Form + getreue Verpackung des bestehenden quantum_trade::TradeResult; die Ehrlichkeit ist an das Repräsentativitätsregister und die Verifikationslabels gebunden

# text
seg-eb75c6a4dcec = Quanten-gegen-klassisch-Trade-Evidenz (gemeinsame Form) ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-gnss-free-nav.md
seg-bfbcc7e8f620 = Quelle: <c1/>

# text
seg-790fbfdd80f0 = MODELLED GNSS-freie Quantennavigation: während eines GNSS-Ausfalls ein inertiales Budget mit Quanten-(Kaltatom-Interferometer) gegen ein klassisches INS der Navigationsklasse — Positionsfehlerwachstum über den Auslauf, Holdover bis zu einer Positionsschwelle und der Quanten-gegen-klassisch-Trade als ehrliche TradeEvidence mit Repräsentativität. Ehrlicher Beobachtbarkeitshinweis: Ohne externen Fix ist der Beschleunigungsmesser-Bias unbeobachtbar, sodass der Fehler wächst; der Quantensensor verlangsamt, aber schließt diese Lücke nicht. Illustrative Gerätparameter aus öffentlichen Quellen; modelliert die Klasse, kein TRL/Flug/Zertifizierung.

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-dd74f248373d = Ein Lauf von <c1/> fasst sich zusammen als: quantum-gnss-free-nav | Ausfall 300s | Quanten-Positionsfehler { "0.00" } m gegen klassisch { "37.31" } m (8289.5x) | Holdover Quanten 44721s gegen klassisch 534s (Schw. { "100" } m) | Trade Quanten gewinnt 2/2 | MODELLED

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-960491d74173 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-88d9dfe0353a = Das Beispiel <c1/> setzt unter anderem:

# text
seg-d196391dcf4f = <b>MODELLED</b> Quanten-(Kaltatom-Interferometer) gegen klassisches INS der Navigationsklasse beim Koppelnavigieren über einen GNSS-Ausfall: Positionsfehlerwachstum, Holdover bis zu einer Positionsschwelle,. Unabhängige Referenz (InternalConsistency): Wiederverwendete inertiale Budgets, gegengeprüft gegen eine unabhängige Octave-Doppelintegration derselben Koppelnavigations-ODE (andere Laufzeitumgebung, gemeinsames Modell → ReferenceImpl) plus das veröffentlichte Kurzzeitrauschen von Freier-2016 als einseitiger Anker; der Quanten-gegen-klassisch-Verbund bleibt MODELLED

# text
seg-9b9ce7600ffc = GNSS-freie Quantennavigation — Koppelnavigation mit Quanten-(Kaltatom-Interferometer) gegen klassisches INS der Navigationsklasse über einen GNSS-Ausfall. MODELLED; illustrative Gerätparameter aus öffentlichen Quellen; modelliert die Klasse, keine TRL-/Flugaussage. (Kommentar der Szenariodatei, Zeilen { "1" } bis { "3" })

# text
seg-9d67411151e3 = GNSS-freie Quantennavigation ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e1d502e1ed6d = <s1>Zurück</s1>quantum-anomaly-detect

# text
seg-1f3705925b3c = <s1>Weiter</s1>quantum-time-transfer

# attr:alt
seg-1bdbf1a737b2 = Das Diagramm, das die Engine für scenarios/quantum-gnss-free-nav.toml schreibt, Szenarioart quantum-gnss-free-nav

# text
# c1: kshana kinds --json
seg-af35cccc4e2c = MODELLED GNSS-freie Quantennavigation: während eines GNSS-Ausfalls ein inertiales Budget mit Quanten-(Kaltatom-Interferometer) gegen ein klassisches INS der Navigationsklasse — Positionsfehlerwachstum über den Auslauf, Holdover bis zu einer Positionsschwelle und der Quanten-gegen-klassisch-Trade als ehrliche TradeEvidence mit Repräsentativität. (Szenarioarten-Katalog (<c1/>))

# text
# c1: quantum-gnss-free-nav
seg-cfa59601df4a = <c1/> (Szenarioart)

seg-a349aa76b0ed = PARTNER
