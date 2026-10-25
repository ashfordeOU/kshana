# docs--kinds-jamming-spoofing-and-the-spectrum: translations (de)

# text
seg-b03d56f501c3 = Typ

# text
seg-98e740d32860 = Testumgebung zur Bewertung maschinellen Lernens bei der Erkennung von HF-Beeinträchtigungen ({ "13494" }): Erzeugen eines beschrifteten, parametergestützten SYNTHETISCHEN Korpus (nominal/jamming/spoof-time/spoof-position/multipath), Bewerten eines Detektors (energy|agc|sqm|parity|fused) mit dem detektorunabhängigen Harness und Ausgeben von AUC/ROC/Konfusion + Pd je Klasse bei einer Ziel-Pfa sowie der Optimismuslücke zwischen In- und Out-of-Distribution. Nur MODELLED Betriebskennlinien — nie Feld-/IQ-Daten, kein Urteil gut/schlecht.

# attr:alt
seg-7e7b07bc5545 = Das Diagramm, das die Engine für scenarios/impairment-eval.toml schreibt, Kind impairment-eval

# text
seg-60bf3f0ff000 = Jamming per Link-Budget: J/S → effektives C/N₀ → Verlust der Aufschaltung.

# attr:alt
seg-42d46b928d09 = Das Diagramm, das die Engine für scenarios/jamming-demo.toml schreibt, Kind jamming

# text
seg-fef00c827c6a = L-Band-Spektrummodell und Wasserfall: das gesamte GNSS-L-Band als eine einzige spektrale Leistungsdichte (PSD), Frequenz quer, Zeit abwärts, über eine geskriptete Jammer-Zeitleiste. SIGNALE: GPS L1 C/A und L2C (BPSK({ "1" })), Galileo-E1-Open-Service (MBOC(6,1,1/11) oder BOC({ "1,1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), jeweils auf seinem Träger mit der in der Schnittstellenspezifikation festgelegten minimalen Empfangsleistung (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), sofern nicht überschrieben; GLONASS, BeiDou und Galileo E6 werden nicht modelliert. JAMMER: Dauerstrich-Ton, flaches Schmalbandrauschen, linearer Sägezahn-Chirp und Breitbandrauschen, angepasst an die eigene Modulation eines Bandes, jeweils mit einer Mitte, einer Bandbreite, einer Empfangsleistung (direkt oder EIRP und Entfernung über den Freiraumpfadverlust des Jamming-Kinds) und Ein-/Ausschaltzeiten. Jeder Jammer wird gegen jedes Band über seinen spektralen Trennungskoeffizienten kappa über die Empfängerbandbreite bewertet, und (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; für einen Jammer entspricht dies der Anti-Jam-Gleichung des Jamming-Kinds mit Q = 1/(R_c kappa), und der Bericht trägt diese Gegenprüfung (und daneben den repräsentativen Q-Wert des Jamming-Kinds). Der Rauschboden ist k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }). Der Wasserfall mittelt jede Zelle über ihren Bin und ihre Zeile (Chirps exakt, ganze Sweeps plus den partiellen; Jammer, die mitten in einer Zeile schalten, nach ihrem Tastverhältnis), sodass die C/N0-Zeitleiste und das Bild aus denselben Zahlen stammen; result.json enthält das in der Leistung blockgemittelte Gitter, pro Band C/N0 und J/S je Zeile sowie pro Jammer und Band SSC, Q, J/S, Inband-J/S und stationäres C/N0. Optional [iq]: das Modell als komplexes IQ zu einem Zeitpunkt gezeichnet, in eine SigMF-Aufzeichnung (cf32_le oder ci16_le) geschrieben und daraus zurückgelesen und mit einer Welch-Schätzung verglichen. Optional [recording] (native Builds): die Welch-PSD einer realen SigMF-Aufzeichnung neben dem Modell. VALIDATED: die Signal-PSDs gegen die Lehrbuch-Hauptkeulenbreiten (BPSK(n) 2n x { "1.023" } MHz Nullstelle zu Nullstelle; BOC({ "1,1" })-Keulen zentriert bei +/-1.023 MHz) und die spektralen Trennungskoeffizienten gegen ihre geschlossenen Formen nach Parseval und Q = { "1" } (CW) und { "1.5" } (angepasst) nach Kaplan & Hegarty. MODELLED: Jammer-Leistungen, Zeitleiste, Front-End-Bandbreiten, die Behandlung als kontinuierliches Spektrum (keine Codelinien) und das Fehlen von AGC, Blanking und Antennendiagramm.

# attr:alt
seg-ea1678eb9e84 = Das Diagramm, das die Engine für scenarios/l-band-waterfall-jamming.toml schreibt, Kind spectrum

# text
seg-f43fe94d84e0 = Kombinierter HF-/Messungs-Spoof-Detektor (Multi-SV-RAIM-Konsistenz + AGC + SQM, fusioniert) gegen einen parametrierten Angriff (Leistungsvorteil, Trägerphasenausrichtung, Zeit-/Positionsversatz; TEXBAT-artig).

# attr:alt
seg-268ebf4cba99 = Das Diagramm, das die Engine für scenarios/spoof-detect.toml schreibt, Kind spoof-detect

# text
seg-cbd77f6ffd63 = Stochastischer Zeit-Spoof-Detektor (Neyman–Pearson / χ²₁) mit Monte-Carlo-P_fa/P_md.

# attr:alt
seg-6f6a8c975111 = Das Diagramm, das die Engine für scenarios/spoof-attack.toml schreibt, Kind spoof

# text
seg-f6ff1c8c78db = Lock-Verlust der Tracking-Schleife: C/N0 -> Lock/Unlock MIT HYSTERESE, die Zeit bis zum Lock-Verlust und Spoof-Pull-in als Funktion der RATE von Code- und Trägerversatz. Die bestehenden Verweigerungs- und Capture-Kriterien der Engine sind Verhältnisse der Empfangsleistung (ein Jammer verweigert bei J/S = { "30" } dB, ein Spoofer übernimmt bei { "3" } dB); der reale Lock-Verlust ist kein Leistungsverhältnis, sondern dort, wo der Jitter einer Schleife plus dynamische Belastung ihr Tracking-Schwellenbudget verlässt. Gibt aus ({ "1" }) den thermischen 1-Sigma-Jitter von Träger- (Costas) und Code-Schleife (nichtkohärent Early/Late) gegen C/N0, Quadrierungsverlust eingeschlossen, gegen die angegebenen Regeln { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (die 15-Grad-Regel in Drei-Sigma-Form) und { "3" }</em>sigma_DLL + Rampennachlauf <= d/2 Chips; ({ "2" }) die C/N0-Schwellen für Abfall und erneutes Locken mit der benannten bindenden Schleife, wobei die Schwelle für das erneute Locken aus der breiteren Bandbreite, mit der ein Empfänger wieder einzieht, ABGELEITET und nicht behauptet wird, sodass die Hysteresebreite zwischen { "5" }<em>log10(Verhältnis) und { "10" }</em>log10(Verhältnis) dB liegen muss; ({ "3" }) die deklarierte Zeit bis zum Lock-Verlust aus einem Zwei-Schwellen-Lock-Detektor mit Bestätigungs-Verweilzeiten, getrieben über eine C/N0-Rampe, getrennt ausgewiesen von der physikalischen Phasenausbruchszeit (die mittlere Viterbi-Zeit zwischen Cycle Slips, in log10 s, weil sie sich über Hunderte von Dekaden erstreckt); ({ "4" }) Spoof-Pull-in-Grenzen — die größte Code-Verschiebung und Träger-Dopplerrate, denen die Schleifen eines Opfers folgen können, mit einer Karte über beide Achsen, denn ein Spoofer, der schneller verschiebt als diese, übernimmt die Schleife nicht, er überholt sie; und ({ "5" }) den VERWEIGERUNGSRADIUS, den die Schleifendynamik impliziert, AUSGEWIESEN NEBEN dem bestehenden Leistungsverhältnis-Radius, nie an dessen Stelle, mit ihrer vorzeichenbehafteten Differenz als eigenem benanntem Feld (denial_radius_delta_km) und einer Definition daneben. Jedes ausgegebene numerische Feld trägt eine Einheit und eine Herkunftsklasse. VALIDATED geschlossene Formen: die Ausdrücke für den Träger- und Code-Jitter, die Schleifenfilter-Reduktion sqrt({ "2" }<em>B_n</em>T) und der Rampennachlauf erster Ordnung sind gegen den eigenen sdr-Korrelator der Engine, vorwärts geschaltet auf synthetischer ZF mit Seed, gegengeprüft — ein anderer Weg zu denselben Zahlen — auf { "0.6" } %, { "3.7" } % bzw. { "0.17" } %, und die modifizierte Bessel-I0 hinter der Cycle-Slip-Zeit gegen übliche tabellierte Werte auf { "1e-7" }. Die untere Gültigkeitsgrenze wird behauptet, nicht nur genannt: Unterhalb von ~{ "32" } dB-Hz bei { "1" } ms sättigt der reale atan-Diskriminator an seinem Bereich von +-pi/2 und misst weniger Jitter als jede lineare Theorie. MODELLED: die Schleifenbandbreiten, die Integrationszeit, der Korrelatorabstand, das Pull-in-Bandbreitenverhältnis, die Bestätigungs-Verweilzeiten, die Jammer-Leistung und die Antennengewinne sind repräsentative Bandwerte, kein Datenblatt. NICHT modelliert: Oszillator-(Allan-Abweichungs-) und Vibrationsjitter, Begrenzung der Front-End-Bandbreite, Mehrweg, AGC-Dynamik, Datenbit-Übergangsverlust, externe Stützung und jede Halbzyklus-Korrektur der Costas-Cycle-Slip-Formel. Unter Schleifendynamik hat die Spoof-Übernahme überhaupt keinen Radius — die bindende Randbedingung ist die Versatzrate, nicht die Leistung —, sodass dieses Feld mit einer Begründung null ist, statt eine erfundene Zahl zu tragen. Kein zertifiziertes Produkt zur Bewertung der Empfängerleistung.

# attr:alt
seg-72182c1aecd9 = Das Diagramm, das die Engine für scenarios/tracking-loop.toml schreibt, Kind tracking-loop

# text
seg-4e31c8daf798 = Register

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } Szenario-Kinds der Engine v{ $version }. Beratend: Analyseausgabe eines Forschungs- und Ingenieurwerkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jedes Label hier stammt von der Engine oder von der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie ein Label verdient wird: der Abschnitt Evidence der README).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Quelle: <c1/>

# text
seg-d4ae70a5d619 = Jamming, Spoofing und das Spektrum (Szenario-Kind-Familie)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Themenseiten: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Einen ausführen: <c1/>. Alle Familien: <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Kontaktbogen der Diagramme, die die Engine für die Kinds der Familie Jamming, Spoofing und das Spektrum schreibt

# text
seg-bbbd87f888b9 = Lock-Verlust der Tracking-Schleife: C/N0 -> Lock/Unlock MIT HYSTERESE, die Zeit bis zum Lock-Verlust und Spoof-Pull-in als Funktion der RATE von Code- und Trägerversatz.

# text
seg-e37f1e071b2c = L-Band-Spektrummodell und Wasserfall: das gesamte GNSS-L-Band als eine einzige spektrale Leistungsdichte (PSD), Frequenz quer, Zeit abwärts, über eine geskriptete Jammer-Zeitleiste.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Testumgebung zur Evaluierung maschineller Lernverfahren zur Erkennung von HF-Beeinträchtigungen ({ "13494" }): einen gekennzeichneten, parametergestützten SYNTHETISCHEN Korpus erzeugen (nominal/Jamming/Spoof-Zeit/Spoof-Position/Mehrweg), einen Detektor bewerten (energy/agc/s

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: jammer
# c6: mask_deg
# c7: tracking_threshold_dbhz
# c8: degraded_margin_db
# c9: signal_power_dbw
# c10: temp_k
# c11: freq_hz
# c12: chip_rate_hz
# c13: skyline
seg-f6dcb5b36454 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>. Optional: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-7bb2f42902f0 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Erforderliche Felder: <c1/>. Optional: <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>spoof-detect</a1>.

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-c65b9d45bdcc = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

# text
seg-bd1b04ccfe22 = <b>Register:</b> MODELLED. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>tracking-loop</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-5024b537d000 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-a73f44c04565 = <b>Register:</b> MODELLED { "3" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>spectrum</a1>.

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-cbcc6f5302b8 = Erforderliche Felder: keine. Optional: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-d14fa8348a2a = <b>Register:</b> MODELLED { "1" } · VALIDATED { "2" }. Vollständige Seite mit den Eingaben, Ergebnissen, Evidenz und Einschränkungen: <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Zurück</s1>Inertial-, Fusions- und Quantensensoren

# text
seg-6b9b04e59491 = <s1>Weiter</s1>Navigation im niedrigen Erdorbit
