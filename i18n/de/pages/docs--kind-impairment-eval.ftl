# docs--kind-impairment-eval: translations (de)

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diesen Typ nennen.

# text
seg-98151954f217 = false

# text
# c1: docs/kinds/by-kind/impairment-eval.md
seg-2e6b437f3e99 = Quelle: <c1/>

# text
seg-98e740d32860 = Testumgebung zur Bewertung maschinellen Lernens bei der Erkennung von HF-Beeinträchtigungen ({ "13494" }): Erzeugen eines beschrifteten, parametergestützten SYNTHETISCHEN Korpus (nominal/jamming/spoof-time/spoof-position/multipath), Bewerten eines Detektors (energy|agc|sqm|parity|fused) mit dem detektorunabhängigen Harness und Ausgeben von AUC/ROC/Konfusion + Pd je Klasse bei einer Ziel-Pfa sowie der Optimismuslücke zwischen In- und Out-of-Distribution. Nur MODELLED Betriebskennlinien — nie Feld-/IQ-Daten, kein Urteil gut/schlecht.

# text
# c1: scenarios/impairment-eval.toml
seg-41c3f9559282 = Ein Lauf von <c1/> fasst sich so zusammen: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-9b0d7ebaa1f0 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/impairment-eval.toml
seg-283510d17885 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-6a64be3b3f07 = fused

# text
seg-3db71c5bdd0a = auc_out uses a subtler out-of-tuning-reg

# text
seg-667d26b3a2fe = Ergebnisbezeichnung (der Engine): MODELLED — synthetischer, parametergestützter Korpus (nie Feld-/IQ-Daten); nur Betriebskennlinien, kein Urteil gut/schlecht

# text
seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, Bindungen ½), Konfusionsmatrix an der Schwelle, P_d/P_md/P_fa/Präzision/Genauigkeit/F1 Tests: <a1>eval_metrics_reference.rs</a1>.

# text
seg-ceedc14c623a = <b>VALIDATED</b> ROC-AUC + Bootstrap-Konfidenzintervall, das echte beschriftete Anomalien trennt; transparenter Detektor (reproduziert die Beschriftungen) Tests: <a1>opssat_ad_reference.rs</a1>.

# text
seg-0ee5b31cfd09 = <b>MODELLED</b> Beschrifteter synthetischer Beeinträchtigungskorpus + detektorunabhängiger ROC/AUC/Konfusion/Pfa-Pmd-Harness; Leakage-Schutz, stratifizierte Aufteilung, Optimismusbericht zur Verteilungsverschiebung (innerhalb vs. außerhalb des Regimes).

# text
seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, Bindungen ½), Konfusionsmatrix an der Schwelle, P_d/P_md/P_fa/Präzision/Genauigkeit/F1. Orakel (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — unabhängige Bibliothek, exakte Übereinstimmung

# text
seg-c719d4060e1a = <b>MODELLED</b> Beschrifteter synthetischer Beeinträchtigungskorpus + detektorunabhängiger ROC/AUC/Konfusion/Pfa-Pmd-Harness; Leakage-Schutz, stratifizierte Aufteilung, Verteilungsverschiebung (innerhalb vs. außerhalb des Regimes. Orakel (InternalConsistency): AUC-Schranken in geschlossener Form (Mann–Whitney) + ein Detektor mit perfekter Referenz; der Korpus ist SYNTHETISCH (parametergestützt, keine Feld-/IQ-Daten)

# text
# c1: label
seg-5565108cc4d1 = MODELLED — synthetischer, parametergestützter Korpus (nie Feld-/IQ-Daten); nur Betriebskennlinien, kein Urteil gut/schlecht (Ergebnis <c1/>)

# text
seg-376f86fbdcb7 = EHRLICHER GELTUNGSBEREICH: nur MODELLED Betriebskennlinien. Der Korpus ist synthetisch und parametergestützt (zusammengesetzt aus den Jamming-/AGC-/SQM-/Parity-Modellen von Kshana) — nie Feldaufnahmen oder rohe IQ-Daten. Der Harness ist ein Schiedsrichter; er meldet Kennlinien, er fällt kein Urteil gut/schlecht. Ausführen: kshana scenarios/impairment-eval.toml (Kommentar in der Szenariodatei, Zeilen { "9" } bis { "12" })

# text
seg-882d67b9474f = Die Bewertung maschinellen Lernens bei der Erkennung von HF-Beeinträchtigungen ({ "13494" }) ist MODELLED, nicht validiert: Sie wird gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-5d23d7f8f872 = Familienseite: <a1>Jamming, spoofing and the spectrum</a1>

# text
seg-6cf4bb2d7f7a = Themenseite: <a1>BENCH.md</a1>

# text
seg-dde90de4270b = <s1>Zurück</s1>hybrid

# text
seg-1e68310f2dc6 = <s1>Weiter</s1>inertial

# text
# c1: impairment-eval
seg-134407946837 = <c1/> (Szenarioart)

# text
seg-304496607bd7 = Szenarioart der Engine v{ $version }, Familie <a1>Jamming, spoofing and the spectrum</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# attr:alt
seg-7e7b07bc5545 = Das Diagramm, das die Engine für scenarios/impairment-eval.toml schreibt, Szenarioart impairment-eval

# text
# c1: kshana kinds --json
seg-d2a9f35ea8cc = MODELLED nur Betriebskennlinien — nie Feld-/IQ-Daten, kein Urteil gut/schlecht. (Szenarioarten-Katalog (<c1/>))
