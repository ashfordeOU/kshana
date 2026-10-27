# docs--kind-tracking-loop: translations (de)

# text
seg-05e8854de548 = Chip

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = kein Wert

# text
seg-59afd80736c5 = <b>PARTNER</b> Nicht bereitgestellt — Kshana modelliert Signalleistung, keine Nutzlast- oder Antennenhardware. Unabhängige Referenz (NoneKind): keine: eine Disziplin im Besitz des Partners, absichtlich ohne Modul und ohne Test

# text
seg-a3697ad561db = Hz

# text
seg-5d23d7f8f872 = Familienseite: <a1>Jamming, spoofing and the spectrum</a1>

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Der Bericht von <c1/> stützt seine Verweigerungskontur nicht mehr auf einen einzigen Skalar.

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Quelle: <c1/>

# text
seg-f6ff1c8c78db = Lock-Verlust der Tracking-Schleife: C/N0 -> Lock/Unlock MIT HYSTERESE, die Zeit bis zum Lock-Verlust und Spoof-Pull-in als Funktion der RATE von Code- und Trägerversatz. Die bestehenden Verweigerungs- und Capture-Kriterien der Engine sind Verhältnisse der Empfangsleistung (ein Jammer verweigert bei J/S = { "30" } dB, ein Spoofer übernimmt bei { "3" } dB); der reale Lock-Verlust ist kein Leistungsverhältnis, sondern dort, wo der Jitter einer Schleife plus dynamische Belastung ihr Tracking-Schwellenbudget verlässt. Gibt aus ({ "1" }) den thermischen 1-Sigma-Jitter von Träger- (Costas) und Code-Schleife (nichtkohärent Early/Late) gegen C/N0, Quadrierungsverlust eingeschlossen, gegen die angegebenen Regeln { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (die 15-Grad-Regel in Drei-Sigma-Form) und { "3" }</em>sigma_DLL + Rampennachlauf <= d/2 Chips; ({ "2" }) die C/N0-Schwellen für Abfall und erneutes Locken mit der benannten bindenden Schleife, wobei die Schwelle für das erneute Locken aus der breiteren Bandbreite, mit der ein Empfänger wieder einzieht, ABGELEITET und nicht behauptet wird, sodass die Hysteresebreite zwischen { "5" }<em>log10(Verhältnis) und { "10" }</em>log10(Verhältnis) dB liegen muss; ({ "3" }) die deklarierte Zeit bis zum Lock-Verlust aus einem Zwei-Schwellen-Lock-Detektor mit Bestätigungs-Verweilzeiten, getrieben über eine C/N0-Rampe, getrennt ausgewiesen von der physikalischen Phasenausbruchszeit (die mittlere Viterbi-Zeit zwischen Cycle Slips, in log10 s, weil sie sich über Hunderte von Dekaden erstreckt); ({ "4" }) Spoof-Pull-in-Grenzen — die größte Code-Verschiebung und Träger-Dopplerrate, denen die Schleifen eines Opfers folgen können, mit einer Karte über beide Achsen, denn ein Spoofer, der schneller verschiebt als diese, übernimmt die Schleife nicht, er überholt sie; und ({ "5" }) den VERWEIGERUNGSRADIUS, den die Schleifendynamik impliziert, AUSGEWIESEN NEBEN dem bestehenden Leistungsverhältnis-Radius, nie an dessen Stelle, mit ihrer vorzeichenbehafteten Differenz als eigenem benanntem Feld (denial_radius_delta_km) und einer Definition daneben. Jedes ausgegebene numerische Feld trägt eine Einheit und eine Herkunftsklasse. VALIDATED geschlossene Formen: die Ausdrücke für den Träger- und Code-Jitter, die Schleifenfilter-Reduktion sqrt({ "2" }<em>B_n</em>T) und der Rampennachlauf erster Ordnung sind gegen den eigenen sdr-Korrelator der Engine, vorwärts geschaltet auf synthetischer ZF mit Seed, gegengeprüft — ein anderer Weg zu denselben Zahlen — auf { "0.6" } %, { "3.7" } % bzw. { "0.17" } %, und die modifizierte Bessel-I0 hinter der Cycle-Slip-Zeit gegen übliche tabellierte Werte auf { "1e-7" }. Die untere Gültigkeitsgrenze wird behauptet, nicht nur genannt: Unterhalb von ~{ "32" } dB-Hz bei { "1" } ms sättigt der reale atan-Diskriminator an seinem Bereich von +-pi/2 und misst weniger Jitter als jede lineare Theorie. MODELLED: die Schleifenbandbreiten, die Integrationszeit, der Korrelatorabstand, das Pull-in-Bandbreitenverhältnis, die Bestätigungs-Verweilzeiten, die Jammer-Leistung und die Antennengewinne sind repräsentative Bandwerte, kein Datenblatt. NICHT modelliert: Oszillator-(Allan-Abweichungs-) und Vibrationsjitter, Begrenzung der Front-End-Bandbreite, Mehrweg, AGC-Dynamik, Datenbit-Übergangsverlust, externe Stützung und jede Halbzyklus-Korrektur der Costas-Cycle-Slip-Formel. Unter Schleifendynamik hat die Spoof-Übernahme überhaupt keinen Radius — die bindende Randbedingung ist die Versatzrate, nicht die Leistung —, sodass dieses Feld mit einer Begründung null ist, statt eine erfundene Zahl zu tragen. Kein zertifiziertes Produkt zur Bewertung der Empfängerleistung.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Ein Lauf von <c1/> fasst sich zusammen als: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } Chip -> Abfall { "25.4744" } dB-Hz (Träger bindet), erneutes Locken { "27.4413" } dB-Hz, Hysterese { "1.9669" } dB | Lock-Verlust erklärt { "39.101" } s nach Beginn der Rampe | Verweigerungsradius Schwelle (J/S { "30" } dB) { "127.413" } km gegen Schleifendynamik { "53.1694" } km, Delta -74.2438 km | Spoof-Pull-in <= { "0.966" } Chip/s Code und { "41.45" } Hz/s Träger (MODELLED Schleife, VALIDATED geschlossene Formen)

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
seg-7614718317f4 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

# text
# c1: scenarios/tracking-loop.toml
seg-41162ed2743b = Das Beispiel <c1/> setzt unter anderem:

# text
seg-773fff0feaf7 = bracketed

# text
seg-23f3aa5c2064 = Ergebnisbezeichnung (die der Engine): MIXED — VALIDATED geschlossene Formen der Schleife, MODELLED Schleifenkonfiguration. Die Ausdrücke für den thermischen Jitter von Träger und Code, die Schleifenfilter-Reduktion sqrt({ "2" }<em>B_n</em>T) und der Rampennachlauf erster Ordnung sind gegen den eigenen sdr-Korrelator der Engine, vorwärts geschaltet auf synthetischer ZF mit Seed, gegengeprüft (ein anderer Weg

# text
seg-346594a654f2 = <b>MODELLED</b> Lock-Verlust, berechnet aus der Schleifendynamik statt aus einem Leistungsverhältnis: thermischer 1σ-Jitter von Träger- (Costas) und Code-Schleife (nichtkohärent Early/Late) gegen C/N₀ mit dem Quadrierungsverlust, gegen die angegebenen Regeln 3σ_PLL + θ_e ≤ { "45" }° und 3σ_DLL + Rampennachlauf

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Lock-Verlust, berechnet aus der Schleifendynamik statt aus einem Leistungsverhältnis: thermischer 1σ-Jitter von Träger- (Costas) und Code-Schleife (nichtkohärent Early/Late) gegen C/N₀ mit dem. Unabhängige Referenz (ReferenceImpl): Der eigene sdr-Korrelator der Engine (sdr::correlate / synth_if / CaCode), vorwärts geschaltet auf synthetischer ZF mit Seed bei einem kalibrierten C/N₀ — ein separater Codepfad, der dieselben Zahlen durch numerische Korrelation abgetasteter IQ erreicht statt durch einen algebraischen Jitter-Ausdruck, also ein anderer Weg und keine Wiederholung — plus übliche tabellierte Werte der modifizierten Bessel-I₀ für den Cycle-Slip-Term. Schleifentheorie nach Kaplan & Hegar

# text
# c1: label
seg-de048f9cf1f6 = MIXED — VALIDATED geschlossene Formen der Schleife, MODELLED Schleifenkonfiguration. Die Ausdrücke für den thermischen Jitter von Träger und Code, die Schleifenfilter-Reduktion sqrt({ "2" }<em>B_n</em>T) und der Rampennachlauf erster Ordnung sind gegen den eigenen sdr-Korrelator der Engine, vorwärts geschaltet auf synthetischer ZF mit Seed, gegengeprüft (ein anderer Weg zu denselben Zahlen), und die modifizierte Bessel-I0 gegen übliche tabellierte Werte. MODELLED: die Schleifenbandbreiten, Integ (Ergebnis <c1/>)

# text
seg-f8d50cbc6f2c = Jeder Schleifenparameter unten ist ein MODELLED repräsentativer Bandwert, kein Datenblatt. (Kommentar der Szenariodatei, Zeile { "22" })

# text
seg-9241a57823cd = --- Schleifengeometrie ----------------------------------------------------------------- Eine { "10" }-Hz-Costas-Trägerschleife und eine trägergestützte Codeschleife mit { "1" } Hz, { "1" } ms kohärente Integration (eine C/A-Code-Periode, sodass keine Datenbit-Synchronisation angenommen wird), schmaler Korrelator mit { "0.5" } Chip. (Kommentar der Szenariodatei, Zeilen { "25" } bis { "28" })

# text
seg-3a677e343081 = Lock-Verlust der Tracking-Schleife und Spoof-Pull-in unter Störung ist MODELLED, nicht validiert: geprüft gegen eine separate Implementierung in derselben Codebasis — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Zurück</s1>timetransfer

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED: die Schleifenbandbreiten, die Integrationszeit, der Korrelatorabstand, das Pull-in-Bandbreitenverhältnis, die Bestätigungs-Verweilzeiten, die Jammer-Leistung und die Antennengewinne sind repräsentative Bandwerte, kein Datenblatt. (Szenarioarten-Katalog (<c1/>))

# text
seg-304496607bd7 = Szenarioart der Engine v{ $version }, Familie <a1>Jamming, spoofing and the spectrum</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Szenarioart ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# attr:alt
seg-72182c1aecd9 = Das Diagramm, das die Engine für scenarios/tracking-loop.toml schreibt, Szenarioart tracking-loop

# text
# c1: kshana kinds --json
seg-a679a9732b2a = NICHT modelliert: Oszillator-(Allan-Abweichungs-) und Vibrationsjitter, Begrenzung der Front-End-Bandbreite, Mehrweg, AGC-Dynamik, Datenbit-Übergangsverlust, externe Stützung und jede Halbzyklus-Korrektur der Costas-Cycle-Slip-Formel. (Szenarioarten-Katalog (<c1/>))

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (Szenarioart)
