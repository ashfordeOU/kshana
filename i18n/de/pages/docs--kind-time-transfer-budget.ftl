# docs--kind-time-transfer-budget: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
seg-dfe78b9d0811 = GHz

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (Artenkatalog (<c1/>))

# text
# c1: docs/kinds/by-kind/time-transfer-budget.md
seg-937ebbbd612c = Quelle: <c1/>

# text
seg-9a2bb9809aed = Zweiweg-Satelliten-Zeit- und Frequenzübertragung zwischen zwei Stationen über ein geostationäres Relais: die nach T_A - T_B aufgelöste Zweiweg-Gleichung mit jedem nichtreziproken Term (Stationsgerätelaufzeiten, Ku-Band-Ionosphäre, Transponder, Sagnac), ein quadratisches Unsicherheitsbudget, dessen Typ-A-Term die TDEV der simulierten Strecke bei der Mittelungszeit ist, eine simulierte Strecke mit weißem und Flicker-Phasenrauschen und einer täglichen Nichtreziprozität sowie die Stabilität (Rate, Rest-RMS, TDEV, ADEV) jeder gelieferten Reihe aus BIPM Circular T Abschnitt { "1" }, MJD,ns-CSV oder IGS-RINEX-Stationsuhr-Aufzeichnungen. MODELLED.

# text
# c1: scenarios/time-transfer-budget.toml
seg-a4f8e9a09026 = Ein Lauf von <c1/> fasst sich zusammen als: time-transfer-budget: europe - north-america Offset { "12.500" } ns (Sagnac { "204.365" } ns, Ionosphäre { "0.0213" } ns); kombiniertes u { "1.087" } ns (Typ A { "0.031" } ns bei { "86400" } s); { "0" } reale Reihen (MODELLED)

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
seg-0353d795ebdf = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: uplink_ghz
# c2: downlink_ghz
# c3: true_offset_ns
# c4: flicker_noise_ns
# c5: diurnal_amplitude_ns
# c6: reciprocity_bias_ns
# c7: step_s
# c8: span_days
# c9: averaging_s
# c10: seed
# c11: series
seg-fe3afa366df2 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

# text
# c1: scenarios/time-transfer-budget.toml
seg-00026a1d3760 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-2409cc9397c7 = Ergebnisbezeichnung (die der Engine): MODELLED — TWSTFT-Zweiweg-Gleichung (Stationslaufzeiten, Ku-Band-Ionosphäre, Transponder, Sagnac), aufgelöst aus angegebenen Laufzeiten, ein quadratisches Unsicherheitsbudget mit der TDEV der simulierten Strecke als Typ-A-Term, eine simulierte Strecke mit Flicker-Phasenrauschen und täglicher Nichtreziprozität und die Stabilität jeder r

# text
seg-83b9c66b9e92 = <b>MODELLED</b> Die nach T_A - T_B aufgelöste TWSTFT-Zweiweg-Gleichung mit Sende- und Empfangslaufzeiten der Stationen, der Ku-Band-Ionosphärenasymmetrie zwischen Auf- und Abwärtsstrecke, der Laufzeitdifferenz der Transponder und den Sagnac-Termen, gegen ihr exaktes Vorwärtsmodell; eine quadratische Unsicher

# text
seg-58cf4086c7a5 = <b>MODELLED</b> Die nach T_A - T_B aufgelöste TWSTFT-Zweiweg-Gleichung mit Sende- und Empfangslaufzeiten der Stationen, der Ku-Band-Ionosphärenasymmetrie zwischen Auf- und Abwärtsstrecke, der Laufzeitdifferenz der Tran. Unabhängige Referenz (InternalConsistency): Interne Konsistenz: Das Vorwärtsmodell und die aufgelöste Gleichung stimmen auf { "1e-15" } s überein, der Sagnac-Term entspricht der unabhängigen BIPM-Schleifenform 2A omega/c^{ "2" } des Moduls, der Ionosphärenterm ist { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, und die Rauschprozesse zeigen ihre erwarteten TDEV-Formen. WAS NICHT: Es wurde keine reale TWSTFT-Messung und kein Kalibrierbericht verglichen; die angegebenen Laufzeiten und Unsicherheiten sind Eingaben, nicht gemessen; t

# text
# c1: label
seg-15de1cdaa684 = MODELLED — TWSTFT-Zweiweg-Gleichung (Stationslaufzeiten, Ku-Band-Ionosphäre, Transponder, Sagnac), aufgelöst aus angegebenen Laufzeiten, ein quadratisches Unsicherheitsbudget mit der TDEV der simulierten Strecke als Typ-A-Term, eine simulierte Strecke mit Flicker-Phasenrauschen und täglicher Nichtreziprozität und die Stabilität jeder gelieferten realen UTC-UTC(k)- oder Stationsuhr-Reihe; nicht mit einer realen TWSTFT-Strecke verglichen (Ergebnis <c1/>)

# text
seg-4b0d23aed0ab = TWSTFT-Zweiweg-Gleichung, Unsicherheitsbudget und Streckenstabilität mit Flicker und täglicher Nichtreziprozität ist MODELLED, nicht validiert: geprüft gegen ihre eigene geschlossene / analytische Identität — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-52e06909ccc5 = <s1>Zurück</s1>terrain-slam

# text
seg-a22fa1c51042 = <s1>Weiter</s1>timetransfer

# text
# c1: time-transfer-budget
seg-6af6f07f5f5a = <c1/> (Szenarioart)

# attr:alt
seg-92d3c84024d7 = Das Diagramm, das die Engine für scenarios/time-transfer-budget.toml schreibt, Szenarioart time-transfer-budget

# text
seg-70448ca49780 = Zweiweg-Satelliten-Zeit- und Frequenzübertragung (TWSTFT) zwischen zwei ILLUSTRATIVEN Stationen, einer in Mitteleuropa und einer im Osten Nordamerikas, über ein geostationäres Relais bei { "10" } Grad W. Der Lauf löst die Zweiweg-Gleichung nach T_A - T_B aus den angegebenen Geräte-, Transponder-, Ionosphären- (Ku-Band, 14/11 GHz) und Sagnac-Termen. Er bildet ein Unsicherheitsbudget, dessen statistischer Term die TDEV bei einem Tag einer simula (Kommentar der Szenariodatei, Zeilen { "1" } bis { "8" })
