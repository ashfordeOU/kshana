# docs--kinds-clocks-timing-and-holdover: translations (de)

# text
seg-b03d56f501c3 = Typ

# text
seg-78cba87823f7 = Uhren-Holdover gegen Spezifikation; optionales Monte-Carlo-Ensemble (runs > { "1" }).

# attr:alt
seg-cb0b7da83f5c = Das Diagramm, das die Engine für scenarios/clock-ensemble.toml schreibt, Typ clock

# text
seg-1b61962464c5 = Slot-Zeitgebung: Sekunden, bis eine freilaufende Uhr den Schutzbereich (Guard) eines zeitindizierten Routing- oder Tasking-Slots verlässt (der größte absolute Zeitfehler, den der Slot toleriert), der Beitrag jedes Terms zu diesem Zeitpunkt mit Benennung des dominanten (Unsicherheit der Synchronisation, weißes Phasenrauschen, weißes Frequenzrauschen, Flicker-Frequenzrauschen, Random-Walk- und Random-Run-Frequenzrauschen, verbleibender Frequenzoffset, Temperatur, Alterung), die seit der letzten Synchronisation verbleibende Zeit und das größte Synchronisationsintervall, das die Uhr innerhalb des Schutzbereichs hält, abzüglich der Latenz der Synchronisation. Der Oszillator ist ein KLASSEN-Standard (csac, uso, dsac, tcxo, ocxo oder rafs: eine zitierte Allan-Abweichung bei einer Sekunde und eine angenommene Rotrauschgrenze), ein DATENBLATT-PRESET der Telekom-Zeitgebung oder ein Inline-DATENBLATT (Maxima der Allan-Abweichung als Hüllkurve angepasst, dazu Alterung und ein Temperaturkoeffizient) oder eine Inline-GEMESSENE PHASENAUFZEICHNUNG (ihre überlappende Allan-Abweichung, per gewichteter Methode der kleinsten Quadrate in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } angepasst, sodass die Rotrauschgrenze gemessen statt angenommen ist). Eine Verletzung jenseits der längsten Mittelungszeit, die das Datenblatt oder die Aufzeichnung stützt, wird als extrapoliert gekennzeichnet. Ein optionaler Abschnitt zu Spoofing ergänzt das Schutzniveau der Zeitgebung für einen Empfänger im Orbit: Bahngeschwindigkeit und Umlaufzeit, wie lange ein einzelner Spoofer am Boden den Satelliten pro Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungslatenz, die bedingte Schranke, den Zug, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seine Reichweite verlässt oder eine unabhängige Prüfung läuft, sowie ob jede Prüfung bei Bodenkontakt oder über Crosslink von diesem Spoofer unabhängig ist. VALIDATED: die Holdover-Inversion aus einer angepassten Aufzeichnung, zurückgehalten an einer realen Cäsiumuhr, gemessen gegen einen Wasserstoff-Maser (tests/slot_timing_cs5071a_holdout.rs, datenabhängig freigeschaltet); bei einem gemessenen Quarzoszillator ist die zurückgehaltene Vorhersage konservativ, liegt aber nicht innerhalb des Zielwerts, daher ist der Quarzfall MODELLED. MODELLED: Klassen- und Datenblattquellen, die deterministischen Terme und die Spoofing-Bewertung.

# attr:alt
seg-97a91c8a60cd = Das Diagramm, das die Engine für scenarios/slot-timing-ocxo-leo.toml schreibt, Typ slot-timing

# text
seg-c0924aa36e64 = MODELLED Holdover-Test eines Zeitgebungssystems, bewertet anhand eines Zeitfehlerprotokolls, das der BETREIBER liefert (ein linuxptp-Protokoll von ptp4l, phc2sys oder ts2phc, ein chrony-Tracking- oder Statistikprotokoll, ein TICC-, TimeLab- oder RINEX-Uhrenprotokoll oder Paare aus time_s,time_error_ns). Der Test hat vier Schritte, und Kshana führt keinen davon aus: eine eingerastete BASISLINIE, GNSS ENTFERNT durch den Betreiber (das Antennenkabel oder der Simulatorausgang; Kshana sendet nichts und steuert nichts an) zu einem angegebenen Zeitpunkt, HOLDOVER auf dem eigenen Oszillator des Systems und WIEDERHERSTELLUNG, nachdem der Betreiber GNSS zu einem zweiten angegebenen Zeitpunkt wiederherstellt. Das Protokoll wird an diesen beiden Zeitpunkten geteilt. Basislinie: Zeitfehlerstatistik und die für eine eingerastete Uhr geschriebenen ITU-T-Masken. Holdover: Statistik, der Bruchteil des Frequenzversatzes, den das System gehalten hat (eine Ausgleichsgerade nach kleinsten Quadraten), die für Holdover oder eine autonome Uhr geschriebenen Masken, die ePRTC-A-Holdover-Hüllkurve aus der angegebenen Dauer im eingerasteten Zustand und die Zeit bis zur Überschreitung jedes Zeitfehlerbudgets. Wiederherstellung: ob und wann |TE| in ein angegebenes Band gelangte und dort blieb, der Spitzenwert und der größte Sprung. Jeder Grenzwert ist aus einer öffentlichen ITU-T-Tabelle übertragen (die Masken für Telekom-Zeitgebung); die Formulierung lautet 'gegen die Maske gemessen', und die beiden Zeitpunkte sind die Angabe des Betreibers, nicht verifiziert. Ein für eine Maske zu kurzes Protokoll ist INCOMPLETE, nie extrapoliert. Siehe docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = Das Diagramm, das die Engine für scenarios/holdover-test-ptp4l.toml schreibt, Kind holdover-test

# text
seg-540545e6f846 = MODELLED vertrauenswürdige Quantenzeitkette: ein durchgängiges Zeitübertragungsbudget mit Quanten- (optische Gitteruhr + Verschränkungs-/Einzelphotonenstrecke) gegen klassisch (CSAC + RF-Zweiweg), ein wiederverwendetes Zeitgebungs-Schutzniveau + eine Sicherheitsgütezahl gegen Verzögerungs-/Replay-Angriffe (1-P_md), eine Erkennungswahrscheinlichkeit für Uhrenanomalien + CUSUM-Latenz und der Quanten-gegen-klassisch-Trade als ehrliche TradeEvidence mit einem Repräsentativitäts- + Gaps-to-flight-Eintrag. Illustrative Geräte-/Streckenparameter aus öffentlichen Quellen; modelliert die Klasse, kein TRL/Flug/Zertifizierung beansprucht.

# attr:alt
seg-09760f892c7b = Das Diagramm, das die Engine für scenarios/quantum-time-transfer.toml schreibt, Kind quantum-time-transfer

# text
seg-4f19d4fb1341 = Generischer N-D-Sweep über ein beliebiges Paket über gepunktete TOML-Schlüssel / JSON-Metrikpfade.

# attr:alt
seg-621a18c07044 = Das Diagramm, das die Engine für scenarios/sweep-nd-inertial.toml schreibt, Kind sweep-nd

# text
seg-e7ab7b55c969 = 1-D-Trade-Study-Sweep über einen Uhrenpaket-Parameter.

# attr:alt
seg-c784b8f22f12 = Das Diagramm, das die Engine für scenarios/sweep-clock-stability.toml schreibt, Kind sweep

# text
seg-a448b24ded2b = Telekom-Zeitgebung: Zeitfehler, maximaler Zeitintervallfehler (MTIE) und Zeitabweichung (TDEV) eines GNSS-Holdovers, geprüft gegen ITU-T-Masken mit PASS oder FAIL und einer Marge pro Maske. Eingabe ist entweder ein SYNTHETISCHES HOLDOVER (ein Oszillator-Preset -- ocxo, rubidium, caesium oder csac, jeweils mit den Stabilitäts-, Alterungs- und Temperaturwerten eines benannten öffentlichen Microchip-Datenblatts -- plus GNSS-Verlustzeit, Aufzeichnungslänge und Abtastintervall; die freilaufende Uhr trägt weißes, Flicker- und, wo die Datenblattanpassung es braucht, Random-Walk-Frequenzrauschen, lineare Alterung und einen sinusförmigen Temperaturterm) oder eine EINGELESENE REIHE aus Paaren [time_s, time_error_ns], inline angegeben (und, nur bei nativen Builds, eine CSV-Datei). Masken: ITU-T G.8272 (07/2025) PRTC-A und PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabellen 1-2, TDEV Tabellen 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC gelockt ({ "30" } ns, Tabellen 1-2) und ePRTC-A-Holdover (die Zeitfehler-Hüllkurve aus Tabelle { "3" }, die über die durch die gelockte Dauer festgelegte Holdover-Periode H von { "30" } ns auf { "100" } ns ansteigt, MTIE Tabelle { "4" }, TDEV Tabelle { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-Klassen A-C (max|TE|, konstanter Zeitfehler, tiefpassgefilterter MTIE und TDEV) und Klasse D (max|TE_L| { "5" } ns, die einzige Zahl der Klasse D, die nicht für weitere Studien offengelassen ist); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Referenzpunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns mit MTIE Tabellen 7-1 bis 7-3). Jeder Eintrag, den eine Empfehlung für weitere Studien markiert, fehlt, statt ergänzt zu werden, und jeder Bericht listet auf, was nicht implementiert ist. Gibt außerdem die Zeit bis zur Überschreitung jedes Budgets für den maximalen Zeitfehler aus (Standardwerte: { "100" } ns ePRTC max|TE_HO|, { "400" } ns Netz-Holdover-Zuteilung, { "1100" } ns Punkt C, { "1.5" } us Klasse { "4" }), die MTIE/TDEV-Kurven als CSV-Tabelle mit jeder Maskengrenze und pro numerischem Feld einen Eintrag zu Einheiten und Herkunft. VALIDATED: die MTIE- und TDEV-Schätzer gegen das Paket allantools an einer eingecheckten Holdover-Reihe. MODELLED: die Maskentabellen sind Abschriften, und ein synthetisches Holdover ist ein aus Datenblatt-Maximalwerten gebautes Modell, keine Messung irgendeiner Einheit. Kein Konformitätstest.

# attr:alt
seg-ec7745a09d08 = Das Diagramm, das die Engine für scenarios/telecom-synce-eec.toml schreibt, Kind telecom-timing

# text
seg-9a2bb9809aed = Zweiweg-Satelliten-Zeit- und Frequenzübertragung zwischen zwei Stationen über ein geostationäres Relais: die nach T_A - T_B aufgelöste Zweiweg-Gleichung mit jedem nichtreziproken Term (Stationsgerätelaufzeiten, Ku-Band-Ionosphäre, Transponder, Sagnac), ein quadratisches Unsicherheitsbudget, dessen Typ-A-Term die TDEV der simulierten Strecke bei der Mittelungszeit ist, eine simulierte Strecke mit weißem und Flicker-Phasenrauschen und einer täglichen Nichtreziprozität sowie die Stabilität (Rate, Rest-RMS, TDEV, ADEV) jeder gelieferten Reihe aus BIPM Circular T Abschnitt { "1" }, MJD,ns-CSV oder IGS-RINEX-Stationsuhr-Aufzeichnungen. MODELLED.

# attr:alt
seg-92d3c84024d7 = Das Diagramm, das die Engine für scenarios/time-transfer-budget.toml schreibt, Kind time-transfer-budget

# text
seg-ccb244e60d60 = Optische gegen HF-Zweiweg-Zeit-/Frequenzübertragung.

# attr:alt
seg-bd76bd68eab3 = Das Diagramm, das die Engine für scenarios/timetransfer.toml schreibt, Kind timetransfer

# text
seg-4e31c8daf798 = Register

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Quelle: <c1/>

# text
seg-3b549536beed = Uhren, Zeitgebung und Holdover (Szenario-Kind-Familie)

# text
seg-9095869ec445 = { "9" } Szenario-Kinds der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Themenseiten: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Einen ausführen: <c1/>. Alle Familien: <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Kontaktbogen der Diagramme, die die Engine für die Kinds der Familie Uhren, Zeitgebung und Holdover schreibt

# text
seg-efd15cff3d32 = MODELLED (Ergebnisbezeichnung)

# text
seg-ff7dca09f0f2 = Telekom-Zeitgebung: Zeitfehler, maximaler Zeitintervallfehler (MTIE) und Zeitabweichung (TDEV) eines GNSS-Holdovers, geprüft gegen ITU-T-Masken mit PASS oder FAIL und einer Marge pro Maske.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Slot-Zeitgebung: Sekunden, bis eine freilaufende Uhr den Schutzbereich eines zeitindizierten Routing- oder Tasking-Slots verlässt (der größte absolute Zeitfehler, den der Slot toleriert), der Beitrag jedes Terms an diesem

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Zweiweg-Satelliten-Zeit- und Frequenzübertragung zwischen zwei Stationen über ein geostationäres Relais: die nach T_A - T_B aufgelöste Zweiweg-Gleichung mit jedem nichtreziproken Term (Stationsgerätelaufzeiten, Ku

# text
seg-a2a710b3204f = MODELLED Holdover-Test eines Zeitgebungssystems, bewertet aus einer Zeitfehleraufzeichnung, die der BETREIBER liefert (ein linuxptp-Log von ptp4l, phc2sys oder ts2phc, ein chrony-Tracking- oder -Statistiklog, ein TICC, TimeLab oder RINEX

# text
seg-1da440dd525c = MODELLED vertrauenswürdige Quantenzeitkette: ein durchgängiges Zeitübertragungsbudget mit Quanten- (optische Gitteruhr + Verschränkungs-/Einzelphotonenstrecke) gegen klassisch (CSAC + RF-Zweiweg), ein wiederverwendetes Zeitgebungs-Schutz

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
# c7: runs
# c8: integrity
seg-50d75d48ed43 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Optional: <c7/>, <c8/>.

# text
seg-3273244f755c = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>clock</a1>.

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
# c7: scale
seg-ee8d6e20c844 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Optional: <c7/>.

# text
seg-e359cc42506e = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Erforderliche Felder: <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Register:</b> keine Matrixzeile nennt dieses Kind; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Register:</b> MODELLED { "5" } · VALIDATED { "1" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Erforderliche Felder: <c1/>, <c2/>. Optional: <c3/>.

# text
seg-cc04bc2d43c5 = <b>Register:</b> MODELLED { "2" } · VALIDATED { "1" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>timetransfer</a1>.

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
# c8: uplink_ghz
# c9: downlink_ghz
# c10: true_offset_ns
# c11: flicker_noise_ns
# c12: diurnal_amplitude_ns
# c13: reciprocity_bias_ns
# c14: step_s
# c15: span_days
# c16: averaging_s
# c17: seed
# c18: series
seg-5134a01b60a0 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Optional: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-09b554a74d49 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Erforderliche Felder: <c1/>, <c2/>. Optional: <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>holdover-test</a1>.

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-76bb4110ea36 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-bb6d7df61e2f = <b>Register:</b> keine Matrixzeile nennt dieses Kind; die Engine kennzeichnet ihr eigenes Ergebnis. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Zurück</s1>Kampagnen

# text
seg-960d5c757310 = <s1>Weiter</s1>Konstellationen, Abdeckung und Geometrie
