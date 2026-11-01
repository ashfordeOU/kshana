# docs--tutorial-clock-holdover: translations (de)

# text
# c1: docs/tutorials/02-clock-holdover.md
seg-b59f529012a6 = Quelle: <c1/>

# text
seg-e66a5042182e = Tutorial { "2" } — Uhren-Holdover: wie lange können Sie durchhalten

# text
# c1: clock
# c2: scenarios/clock-holdover.toml
# c3: scenarios/clock.toml
seg-889112bc4c09 = <c1/> · <b>Szenario:</b> <c2/> (Lehrkopie: <a1><c3/></a1>) · <b>Schwierigkeit:</b> Einsteiger · <b>~{ "20" } min</b>

# text
seg-a4bdf55d96be = Am Ende haben Sie einen Uhren-Holdover bei verweigerten GNSS-Signalen (Global Navigation Satellite System) durchgeführt, die Zeitgebungs-Kennzahl gelesen und das Driftgesetz √(q_wf·T) verstanden, das erklärt, <em>warum</em> die optische Uhr länger durchhält als die Chip-Scale-Uhr, wobei das Gesetz vom NIST (dem US National Institute of Standards and Technology) stammt und nicht erfunden ist.

# text
seg-51ae9468b92a = Was dieses Szenario ist

# text
seg-87334505b228 = Wenn GNSS-Signale wegfallen, hält ein System die Zeit mit seiner eigenen Borduhr. Die Phase dieser Uhr driftet langsam, und sobald die Drift die betriebliche Zeitgebungsvorgabe überschreitet, sind Sie außer Dienst. <b>Holdover</b> ist, wie lange Sie nach dem GNSS-Verlust innerhalb der Vorgabe bleiben — die zentrale Kennzahl der Autonomie.

# text
seg-798ac031b5c6 = Das Szenario läuft über eine Zeitleiste von { "2" } h: { "10" } min GNSS-Synchronisation, dann { "6600" } s ({ "1.83" } h) verweigert, gegen eine Zeitgebungsvorgabe von { "20" } ns, abgetastet alle { "10" } s. Es vergleicht zwei Uhren mit identischem Code und ihrem <em>eigenen</em> veröffentlichten Rauschen:

# text
seg-3d53622dbe12 = <b>Quantum</b>: eine optische Strontium-Gitteruhr, Weltraumziel σ_y({ "1" } s) = { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }), ein Zielwert für einen Bodendemonstrator, nicht geflogen. σ_y(τ) ist die Allan-Abweichung, das übliche Maß für die Frequenzstabilität einer Uhr bei der Mittelungszeit τ.

# text
seg-e25af6d0752f = <b>Classical</b>: eine Chip-Scale-Atomuhr (CSAC) SA.45s von Microchip, σ_y({ "1" } s) = { "3" }×{ "10" }⁻¹⁰ (Datenblatt) — ein im Einsatz befindliches kommerzielles Bauteil.

# text
seg-08f3fdc9252a = Die einzeilige Zusammenfassung lesen

# text
seg-baa0cc808987 = Mit Seed = { "42" }, der Vorgabe von { "20" } ns und dem Ausfall von { "6600" } s:

# text
# c1: quantum holdover 6600s
seg-76f7739f8b17 = <b><c1/></b> — die optische Uhr hält den gesamten Ausfall von { "6600" } s, ohne { "20" } ns zu verletzen. Ihr Phasenfehler im 95. Perzentil beträgt { "1.20e-4" } ns, etwa ein Zehntausendstel einer Nanosekunde: Sie bewegt sich kaum.

# text
# c1: classical holdover 2610s
seg-0ba48fccffae = <b><c1/></b> — die CSAC verletzt die Vorgabe von { "20" } ns bei ~{ "2610" } s, weniger als die Hälfte des Ausfalls. Ihr Phasenfehler p95 ({ "19.7" } ns) liegt genau an der Vorgabelinie.

# text
# c1: security n/a (no attack)
# c2: fom.security
# c3: applicable: false
# c4: figure_tiers
seg-b745d05e2bf1 = <b><c1/></b> — dieses Szenario konfiguriert keinen Angriff, es gibt also nichts zu erkennen, und die Zusammenfassung gibt keine Zahl aus. Das JSON enthält dennoch die analytische Grenze der Spoofing-Erkennbarkeit jeder Uhr in <c2/> ({ "0.997" } für die optische Uhr; { "0.000" } für die CSAC, deren eigenes Coast-Rauschen über das Fenster bereits { "20" } ns überschreitet), gekennzeichnet mit <c3/> im Block <c4/>. Die Bewertung der Erkennung gegen einen echten Angriff ist die Geschichte von <a1>Tutorial { "3" }</a1>.

# text
# c1: integrity 1.000
# c2: docs/INTEGRITY.md
seg-510e1cd8ed40 = <b><c1/></b> — hier ist dies <em>Filter-Selbstkonsistenz</em> (der Anteil der Ausfall-Abtastwerte innerhalb der eigenen k-Sigma-Grenze des Kalman-Filters), <b>nicht</b> ein horizontales oder vertikales Schutzniveau der Luftfahrt (HPL/VPL). Siehe <a1><c2/></a1>.

# text
seg-7cc0ba5e5d13 = Die nicht zirkuläre unabhängige Referenz: warum { "2610" } s für die CSAC?

# text
# c1: q_wf = σ_y(1 s)²
# c2: tests/calibration.rs
seg-2958401e00ca = Bei einer Uhr mit weißer Frequenzmodulation (weißes FM) wächst der 1-σ-Phasenfehler wie <b>σ_x(T) ≈ √(q_wf · T)</b>, wobei <c1/> die Einheit s² hat. Diese Beziehung stammt aus der <b>NIST Special Publication { "1065" }</b> (Riley, <em>Handbook of Frequency Stability Analysis</em>) — den Beziehungen σ_y(τ)↔Phase — der <em>selben</em> SP-1065-Beziehung, gegen die <c2/> die Allan-Abweichung der Engine auf ~{ "2" } % validiert.

# text
# c1: q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²
seg-d6c8f68b42b9 = Für die CSAC gilt <c1/>. Lösen Sie nach der Zeit auf, zu der die 1-σ-Phase { "20" } ns = { "2" }×{ "10" }⁻⁸ s erreicht:

# text
# c1: holdover_s
# c2: step_s = 10
# c3: src/fom.rs
seg-0f28d1a1163f = Die { "2610" } s der Engine sind nicht diese 1-σ-Zeit und sollen es auch nicht sein. <c1/> ist der erste Punkt des { "10" }-s-Rasters (<c2/>), an dem der absolute Phasenfehler <em>dieser Realisierung mit festem Seed</em> { "20" } ns überschreitet (<c3/>). Das erste Überschreiten einer Schwelle durch einen Random Walk liegt oft deutlich vor der Zeit, zu der seine 1-σ-Hüllkurve diese Schwelle erreicht, und die Realisierung trägt außerdem den Restfrequenzfehler, der dem Filter nach der Synchronisation von { "600" } s bleibt. Das Gesetz legt also die Größenordnung fest, einige tausend Sekunden für eine Uhr mit { "3" }×{ "10" }⁻¹⁰ gegen { "20" } ns, nicht den genauen Wert. Der Test prüft ein <b>Band von { "2000" }–{ "3200" } s</b> darum, nicht die Zahl.

# text
# c1: provenance
# c2: adev_curve
# c3: tests/calibration.rs
seg-2e7cbdefa9b7 = Die Datenblattanker selbst sind extern und in den Zeichenketten <c1/> des Szenarios zitiert: optisches Sr-Gitter-Ziel { "1" }×{ "10" }⁻¹⁵ (arXiv:{ "1503.08457" }); Microchip SA.45s CSAC { "3" }×{ "10" }⁻¹⁰ (Datenblatt). Und das exportierte <c2/> stimmt mit dem σ_y(τ) des Datenblatts auf ~{ "2" } % überein (<c3/>, NIST SP { "1065" }). Stellen Sie es im Playground als doppelt logarithmisches Diagramm „Uhrenstabilität (ADEV, Allan-Abweichung)“ dar.

# text
seg-def5271a207d = Was der Test festschreibt

# text
# c1: quantum holdover >= classical holdover
seg-ebddc1f5ffe2 = <c1/> (die optische Uhr muss mindestens so lange halten),

# text
# c1: quantum holdover ≈ 6600 s
seg-8e570268f107 = <c1/> (hält den gesamten Ausfall),

# text
# c1: classical holdover ∈ [2000, 3200] s
seg-d60483c1af2e = <c1/> — ein Toleranzband um die SP-1065-Größenordnung für weißes FM, <em>keine</em> magische Zahl. Die unabhängige Referenz ist das Gesetz, nicht der Wert.

# text
seg-e5f926d1055b = Fallstricke und Einheiten

# text
seg-0f57e35ed833 = <b>Zeitgebungsangaben sind in Nanosekunden</b>, nie in Metern. (Der Positions-Holdover ist ein <em>anderes</em> Paket — siehe den Trägheitsabschnitt von Tutorial { "3" }.)

# text
# c1: q_wf
seg-2e476b213141 = <b><c1/> hat die Einheit s² und entspricht σ_y({ "1" } s)².</b> Das ist die Brücke von einer Allan-Zahl im Datenblatt zum Modell.

# text
# c1: step_s
seg-75951a150b44 = <b>Holdover ist eine rasterquantisierte untere Schranke</b> (<c1/>). Lesen Sie den genauen Wert nicht zu genau; lesen Sie das <em>Band</em>.

# text
# c1: integrity
seg-959eb86066f1 = <c1/> bedeutet hier Filter-Selbstkonsistenz, nicht Integrität der Luftfahrt.

# text
seg-cb457294fc53 = Wie es weitergeht

# text
# c1: threshold_ns
# c2: exercises/tier2_sweep.py
# c3: kind = "sweep"
# c4: classical_q_wf
# c5: scenarios/sweep-clock-stability.toml
seg-aa3e50f2c699 = <b>Stufe { "2" }:</b> Senken Sie <c1/> von { "20" } auf { "10" } und beobachten Sie, wie der CSAC-Holdover <em>sinkt</em> ({ "2610" } s → { "1300" } s, gemessen mit <c2/>), oder verwenden Sie <c3/>, um den Holdover gegen das CSAC-Rauschniveau <c4/> zu tabellieren (<c5/>: { "25" } Punkte von { "10" }⁻²⁴ bis { "10" }⁻¹⁸ s², klassischer Holdover { "2610" } s → { "250" } s).

# text
# c1: runs = 200
# c2: scenarios/clock-ensemble.toml
# c3: classical holdover 844s [220-2130]
seg-cb31f104d104 = <b>Stufe { "3" }:</b> Fügen Sie <c1/> hinzu, um daraus ein Monte-Carlo-Ensemble zu machen, und lesen Sie das Holdover-Band [p05–p95] (<c2/> gibt <c3/> aus).

# text
seg-9cb56e10f0fd = Dann der Abschluss: <a1>Tutorial { "3" } — Quantum gegen Classical bei Resilienz</a1>.

# text
seg-7dc19a98c7ee = <s1>Zurück</s1>{ "1" } · Ihre erste Umlaufbahn

# text
seg-c274e92fdcb5 = <s1>Weiter</s1>{ "3" } · Quantum gegen Classical
