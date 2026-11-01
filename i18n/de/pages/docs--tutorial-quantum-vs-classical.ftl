# docs--tutorial-quantum-vs-classical: translations (de)

# text
seg-501d3a72ea43 = Integrität

# text
seg-8980b5ae869b = Zahl

# text
seg-e5f926d1055b = Fallstricke und Einheiten

# text
seg-cb457294fc53 = Wie es weitergeht

# text
# c1: docs/tutorials/03-quantum-vs-classical.md
seg-a3686dd6817d = Quelle: <c1/>

# text
seg-0c2365600795 = Tutorial { "3" } — Quantum gegen Classical bei der GNSS-Resilienz (Abschluss)

# text
# c1: spoof
# c2: hybrid
# c3: scenarios/spoof-attack.toml
# c4: scenarios/hybrid-pnt.toml
# c5: scenarios/security.toml
# c6: scenarios/hybrid.toml
seg-cc4017642043 = <c1/> + <c2/> · <b>Szenarien:</b> <c3/>, <c4/> (Lehrkopien: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Schwierigkeit:</b> fortgeschritten · <b>~{ "35" } min</b>

# text
seg-5de2e6656527 = Der Abschluss. Sie führen ein Szenario mit Spoofing-Detektor und eine vollständige fusionierte Suite für Positionierung, Navigation und Zeitgebung (PNT) aus und lernen, <b>Sicherheit</b>, <b>Integrität</b> und <b>Koppelnavigation</b> gemeinsam zu lesen — die gesamte These: Quantum-Inertial plus optische Zeitgebung verschaffen Resilienz, die ein Entzug von GNSS (Global Navigation Satellite System) sonst nehmen würde.

# text
seg-ffa5242638c2 = Teil A — Sicherheit: einen Zeit-Spoof fangen

# text
# c1: 1 − P_md
seg-23c18da1415f = Ein Angreifer schleust eine langsam ansteigende falsche GNSS-Zeit ein ({ "0.1" } ns/s, beginnend bei t = { "60" } s). Der Empfänger gleicht die behauptete Zeit mit der vorhergesagten Zeit seiner eigenen im Coast-Betrieb laufenden Uhr ab und meldet den Spoof, wenn die Abweichung die Erkennungsgrenze überschreitet. Der Detektor ist ein zweiseitiger <b>χ²₁-/Neyman-Pearson-Energietest</b> bei einer Fehlalarmwahrscheinlichkeit P_fa = { "0.01" }; die Sicherheitskennzahl ist <b><c1/></b> (eins minus der Wahrscheinlichkeit einer verpassten Erkennung) bei der auf die Vorgabe bezogenen Spoof-Größe ({ "20" } ns).

# text
# c1: security 1.000
seg-46aa0e01b330 = <b>Quantum: <c1/>, erkannt bei { "70" } s.</b> Die Erkennungsschwelle der optischen Uhr liegt bei einem Bruchteil einer Nanosekunde, sodass sie den Spoof fast sofort meldet — weit unter der Vorgabe von { "20" } ns.

# text
# c1: security 0.558
seg-022573b3dcc4 = <b>Classical: <c1/>, erkannt bei { "430" } s.</b> Das eigene Coast-Rauschen der Chip-Scale-Atomuhr (CSAC) über das Fenster ist mit { "20" } ns vergleichbar, sodass sie den Spoof oft nicht von ihrer eigenen Drift unterscheiden kann — sie verpasst ihn in { "44" } % der Fälle.

# text
seg-27b2b715efcb = Die nicht zirkuläre unabhängige Referenz: analytisches gegen Monte-Carlo-P_md

# text
# c1: 0.442
# c2: 0.444
# c3: ~few × 1/√N
# c4: tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo
# c5: |analytic_pmd − mc_pmd| < 0.05
# c6: quantum security_fom > 0.9
seg-c85651eebd32 = Die Wahrscheinlichkeit einer verpassten Erkennung des Detektors wird auf <b>zwei unabhängige Arten</b> berechnet, die übereinstimmen müssen: ein <b>geschlossener χ²₁-Tail</b> (das Neyman-Pearson-Ergebnis) und eine <b>Monte-Carlo-Schätzung</b> (MC). Für die CSAC beträgt das analytische P_md <c1/> und das MC-P_md <c2/> — sie stimmen auf { "0.002" } überein, deutlich innerhalb des Stichprobenfehlers <c3/>. Für die optische Uhr sind beide { "0.000" }. Dass zwei getrennte Berechnungen der <em>selben</em> Wahrscheinlichkeit übereinstimmen, ist die nicht zirkuläre Gegenprobe (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; übliche NP-/χ²-Detektion). <c4/> prüft <c5/> für beide Uhren und <c6/>.

# text
seg-5cf0d909bac7 = Teil B — Hybrid-PNT: die vollständige fusionierte Suite

# text
# c1: [resync]
# c2: src/hybrid.rs
# c3: optical-isl
seg-498a57aae11d = Nun fusioniert das Abschlussszenario eine optische Uhr plus eine Kaltatom-Inertialmesseinheit (IMU) (Quantum-Suite) gegen eine CSAC plus eine IMU der Navigationsklasse (Classical-Suite), durch denselben GNSS-Ausfall von { "6600" } s ({ "1.83" } h), gegen eine Zeitgebungsvorgabe von { "20" } ns und eine Positionsvorgabe von { "100" } m. Beide Suiten setzen ihre Uhren alle { "60" } s über dieselbe optische Zeitübertragungsstrecke zwischen Satelliten neu auf, modelliert mit einem Jitter von { "1" } ps je Neusynchronisation (<c1/> im Szenario; <c2/> baut für beide Suiten eine <c3/>-Strecke).

# text
# c1: (t …/p …)
seg-61934559c7a0 = Lesen Sie die Aufteilung <c1/> — Zeitgebungs-Holdover gegen Positions-Holdover:

# text
seg-dee5b1a35bdd = <b>Quantum: PNT-Holdover { "6600" } s</b> — hält sowohl die Zeitgebung (t { "6600" } s) als auch die Position (p { "6600" } s) über den gesamten Ausfall.

# text
seg-6441dfa026dc = <b>Classical: PNT-Holdover { "350" } s</b> — die <em>Zeitgebung</em> hält die vollen { "6600" } s (t { "6600" } s), weil die Neusynchronisation über die optische Zeitübertragung sogar die <em>klassische Uhr</em> synchronisiert hält. Die Suite ist <b>positionsbegrenzt bei p { "350" } s</b>: Die IMU der Navigationsklasse ist das schwache Glied. Das ist die Fusionsthese — das Versagen der Classical-Suite auf ihren Inertialsensor einzugrenzen.

# text
# c1: integrity 0.998
# c2: docs/INTEGRITY.md
seg-12e9b7192733 = <b><c1/> für die Quantum-Suite ist real und kein Fehler.</b> Es ist die Selbstkonsistenz des Filters bei verrauschter Neusynchronisation — <b>nicht</b> eine Integritätsangabe der Luftfahrt (horizontales oder vertikales Schutzniveau, HPL/VPL). Lesen Sie das Wort „Integrität“ hier nicht zu weit; siehe <a1><c2/></a1>.

# text
seg-587efcdcbc13 = Die nicht zirkuläre unabhängige Referenz: der Positions-Holdover von { "350" } s

# text
# c1: b
seg-a70ad8fc122f = Die Angabe von { "350" } s ist Physik der Koppelnavigation, keine angepasste Zahl. Ein konstanter Beschleunigungsmesser-Bias <c1/> treibt den Positionsfehler als <b>½·b·T²</b>. Beim Überschreiten der Vorgabe von { "100" } m:

# text
# c1: q_va
seg-778e817e3e9b = Die Engine meldet { "350" } s, den letzten Punkt des { "10" }-s-Rasters vor dem Überschreiten und { "2" } % unter den { "357" } s allein durch den Bias: Die Beschleunigungsmesser des Szenarios tragen auch Rauschen als Geschwindigkeits-Random-Walk (<c1/>), das sich zur Bias-Drift addiert, sodass der modellierte Fehler { "100" } m etwas früher erreicht.

# text
seg-e105a8ab605b = Maßgebliches Gesetz: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2. Aufl.), Fehlerwachstum der Koppelnavigation. Diese beiden Werte ½bT² erklären die Aufteilung der Engine von { "350" } s / { "6600" } s: eine physikalische Prüfung in geschlossener Form, extern zum Filter.

# text
# c1: scenarios/inertial.toml
# c2: inertial
# c3: quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m
seg-c2515e55dffa = Den inertialen schwachen Punkt sehen Sie direkt im Koppelnavigations-Szenario (<a1><c1/></a1>, Art <c2/>): <c3/>: Der Sensor der Navigationsklasse divergiert auf zig Kilometer.

# text
seg-6c688f2e7136 = Die drei Angaben zusammen lesen

# text
seg-4f1a49d61cee = Was sie hier bedeutet

# text
seg-2e91989b1a89 = Was sie <b>nicht</b> bedeutet

# text
# c1: 1 − P_md
# c2: hybrid
# c3: n/a (no attack)
seg-b403ce86b14d = analytische Grenze der <em>Erkennbarkeit</em> von Spoofing (<c1/>) für einen konfigurierten Angriff; die Zusammenfassung von <c2/> gibt <c3/> aus, weil dieses Szenario keinen konfiguriert

# text
seg-e04c25dd278d = kein Detektor mit mehreren Satelliten nach RAIM (receiver autonomous integrity monitoring)

# text
seg-7e678dd4409e = Filter-Selbstkonsistenz (Abtastwerte innerhalb der k-σ-Grenze)

# text
seg-1643e7e71209 = keine Integrität der Luftfahrt nach HPL/VPL/RAIM

# text
seg-4095f7ab4b14 = Zeit innerhalb der Vorgabe nach GNSS-Verlust, aufgeteilt in Zeitgebung und Position

# text
seg-5b90536cdfd5 = keine 2D-Genauigkeit nach CEP (circular error probable) oder 2DRMS (twice the distance root mean square)

# text
# c1: integrity
# c2: scenarios/integrity.toml
seg-4b11ef3b6dba = Die echte empfängerautonome Integrität — reale HPL/VPL mit Alarmgrenzen und einem Stanford-Diagramm — liegt im Paket <c1/> (<a1><c2/></a1>); das ist die Leseübung der Stufe 3.

# text
seg-28cddec341ed = Was die Tests festschreiben

# text
# c1: tutorial3_spoof_analytic_matches_montecarlo
# c2: quantum security_fom > 0.9
seg-a27c3195acf3 = <c1/> — analytisches und MC-P_md stimmen für beide Uhren auf < { "0.05" } überein; <c2/>.

# text
# c1: scenarios/hybrid.toml
# c2: scenarios/inertial.toml
# c3: teaching_scenarios_match_their_recorded_expected_summary
# c4: # expected:
seg-78a5a0066e09 = Die Hybrid-Zusammenfassung ({ "6600" } s / { "350" } s) und die inertiale Aufteilung werden über ihre Lehrszenarien (<a1><c1/></a1>, <a2><c2/></a2>) durch <c3/> festgeschrieben, das jede Zusammenfassung der Engine mit der von der Datei aufgezeichneten Zeile <c4/> vergleicht. Die obige Referenz ½bT² ist die physikalische Prüfung dieser Zahlen.

# text
seg-a4371822e379 = <b>Die Zeitgebungs-Kennzahl (FoM) ist in Nanosekunden; die Positions-FoM ist in Metern und 1-DOF</b> (ein Freiheitsgrad: einachsig, nicht CEP/2DRMS).

# text
# c1: integrity 0.998
seg-1331ea80a427 = <c1/> ist Selbstkonsistenz, nicht Integrität der Luftfahrt.

# text
# c1: (t …/p …)
seg-87c49084032c = Die <em>Zeitgebung</em> der Classical-Suite besteht nur dank der Neusynchronisation über die optische Zeitübertragung; lesen Sie die Aufteilung <c1/>, nicht nur den Titelwert PNT-Holdover.

# text
# c1: scenarios/lunanet-araim.toml
# c2: lunar-integrity
seg-1c93115bf118 = Führen Sie den Fall des ehrlichen Scheiterns aus: <c1/> (Art <c2/>) meldet einen ARAIM-Durchgang (advanced RAIM) am Südpol, bei dem die Schutzniveaus die Alarmgrenze <em>überschreiten</em> (HPL { "263" }–{ "452" } m > { "50" } m, { "0" } von { "24" } Epochen verfügbar), sodass das System als <b>nicht verfügbar</b> gemeldet wird: ein Merkmal, kein Fehler.

# text
# c1: scenarios/leo-resilience-gnss-jammed-leo-carries.toml
# c2: campaign
seg-ac70d3131064 = Tragen Sie die Geschichte in die niedrige Erdumlaufbahn (LEO): <c1/> (Art <c2/>) verkettet auf einer Zeitleiste eine GNSS-Jamming-Phase, eine LEO-Positionierungsschicht, die den Nutzer hindurchträgt, und eine Integritätsprüfung. Siehe <a1>die neueren Fähigkeiten</a1> für die anderen Resilienz- und Vertikalszenarien.

# text
seg-063422d3c70b = Verteidigen Sie ein Ergebnis: Machen Sie die <a1>Übung der Stufe 3</a1> — Monte-Carlo-Bänder, Reproduzierbarkeit und das Lesen eines Schutzniveaus.

# text
seg-4f7275a21f44 = <s1>Zurück</s1>{ "2" } · Uhren-Holdover

# text
seg-8b0c90f82aab = <s1>Weiter</s1>Durchgespieltes Beispiel: Pipeline mit mehreren Werkzeugen
