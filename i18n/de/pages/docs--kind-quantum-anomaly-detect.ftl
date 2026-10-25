# docs--kind-quantum-anomaly-detect: translations (de)

# text
seg-29e58493fdd4 = Modelliert

# text
seg-619127334cf3 = Keine Matrixzeile nennt diesen Typ beim Namen; die Kennzeichnung seines Ergebnisses stammt von der Engine selbst, siehe oben.

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
seg-496b17a8d3b9 = Themenseite: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Nicht geliefert — nur Leistungsmodelle; Kaltatom-/Uhren-Hardware gehört einem Partner. Orakel (NoneKind): keine: eine Disziplin im Besitz eines Partners, bewusst ohne Modul und ohne Test

# text
# c1: docs/kinds/by-kind/quantum-anomaly-detect.md
seg-836d5102f0d1 = Quelle: <c1/>

# text
# c1: quantum-anomaly-detect
seg-ad4ce0110e8d = <c1/> (Szenario-Kind)

# text
seg-04310cd6cbec = MODELLED Fehler-/Anomalieerkennung für Quanten-PNT-Systeme: ein gekennzeichneter Fehlerkatalog (Uhr: Frequenzsprung/Drift/Lock-Verlust; Sensor: Bias-Sprung/Ausfall), eine ROC-AUC der Erkennungsstatistik (mit einem Bootstrap-Konfidenzintervall aus der extern validierten eval_stats) und ein minimal erkennbarer Fehler bei fester Fehlalarmrate, wobei der quantenuhrgestützte Monitor (geringeres Rauschen) kleinere Fehler erkennt — als ehrliche TradeEvidence + Repräsentativität. Gaußsches Modell der Erkennungsstatistik (AUC = Phi(mu/(sigma*sqrt2))); modelliert die Klasse, illustrative Parameter aus öffentlichen Quellen, kein TRL/Flug/Zertifizierung.

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-442310afbb13 = Ein Lauf von <c1/> fasst sich zusammen als: quantum-anomaly-detect | AUC Quanten { "0.9908" } gegen klassisch { "0.7603" } | minimal erkennbarer Fehler Quanten { "1.312" } gegen klassisch { "4.372" } | { "5" } Fehlerklassen | Trade Quanten gewinnt 2/2 | MODELLED

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-335b8d87e27d = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-c2b10c0bdaf8 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-f44afe581836 = { $version }

# text
seg-25da07e56aa8 = Quanten- gegen klassische PNT-Anomalieerkennun

# attr:alt
seg-2f1d14239d1a = Das Diagramm, das die Engine für scenarios/quantum-anomaly-detect.toml schreibt, Kind quantum-anomaly-detect

# text
seg-af9aaf95d4f8 = <b>VALIDATED</b> Analytische binormale ROC-AUC = Φ(μ/(σ√{ "2" })) und der minimal erkennbare Fehler σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), die den Quantenfehler- und Anomaliedetektoren zugrunde liegen. Unabhängige Referenz (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), beide BSD-3-Clause — unabhängige Bibliotheken, die dieselben eindeutig definierten Gauß-Schwanz-/AUC-Größen berechnen, abgeglichen bis zum A&S-erf-Boden (~{ "7e-8" }). Der darauf aufbauende Quanten-gegen-klassisch-Vorteil bleibt MODELLED

# text
seg-c37642bb24fe = <b>MODELLED</b> Ein reproduzierbares TradeEvidence-Objekt (fester Rahmen: Szenario+Seed+Engine; gemeinsame Quanten-gegen-klassisch-Werte pro FoM mit polaritätsrichtigem Nutzen, optional { "95" }%. Unabhängige Referenz (InternalConsistency): Identitäten für Nutzen/Gewinner in geschlossener Form + getreue Verpackung des bestehenden quantum_trade::TradeResult; die Ehrlichkeit ist an das Repräsentativitätsregister und die Verifikationslabels gebunden

# text
seg-b854cedc8a51 = <b>MODELLED</b> Gekennzeichneter Quantenfehlerkatalog (Uhr: Frequenzsprung/Drift/Lock-Verlust; Sensor: Bias-Sprung/Ausfall), eine ROC-AUC der Erkennungsstatistik mit einem Bootstrap-Konfidenzintervall und ein minimal. Unabhängige Referenz (InternalConsistency): Gaußsche AUC in geschlossener Form = Phi(mu/(sigma*sqrt2)), gegengeprüft gegen die extern validierte eval_stats::bootstrap_auc_ci (gegen scikit-learn) + analytische Erkennungsschwellen

# text
# c1: kshana kinds --json
seg-7b465c2bb7cf = MODELLED Fehler-/Anomalieerkennung für Quanten-PNT-Systeme: ein gekennzeichneter Fehlerkatalog (Uhr: Frequenzsprung/Drift/Lock-Verlust; Sensor: Bias-Sprung/Ausfall), eine ROC-AUC der Erkennungsstatistik (mit einem Bootstrap-Konfidenzintervall aus der extern validierten eval_stats) und ein minimal erkennbarer Fehler bei fester Fehlalarmrate, wobei der quantenuhrgestützte Monitor (geringeres Rauschen) kleinere Fehler erkennt — als ehrliche TradeEvidence + repräsentativ (Kind-Katalog (<c1/>))

# text
seg-7f43972b246d = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme — gekennzeichneter Fehlerkatalog + ROC-AUC + minimal erkennbarer Fehler, quantenuhrgestützter gegen klassischen Monitor. MODELLED; illustrative Parameter aus öffentlichen Quellen; modelliert die Klasse, keine TRL-/Flugaussage. (Kommentar der Szenariodatei, Zeilen { "1" } bis { "3" })

# text
seg-eb75c6a4dcec = Quanten-gegen-klassisch-Trade-Evidenz (gemeinsame Form) ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-3f92aec2b92a = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-6524a69e4835 = <s1>Zurück</s1>pvt

# text
seg-aa689568cf84 = <s1>Weiter</s1>quantum-gnss-free-nav
