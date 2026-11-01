# docs--kind-clock: translations (de)

# text
# c1: docs/kinds/by-kind/clock.md
seg-33555d61ddc6 = Quelle: <c1/>

# text
# c1: clock
seg-618393657d01 = <c1/> (Szenariotyp)

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-78cba87823f7 = Uhren-Holdover gegen Spezifikation; optionales Monte-Carlo-Ensemble (runs > { "1" }).

# text
# c1: scenarios/clock-ensemble.toml
seg-dd2ad570a6c9 = Ein Lauf von <c1/> ergibt zusammengefasst: Szenario 91d2b6d10d14 | { "200" } Läufe | Quanten-Holdover 6600s [6600-6600] p95 8.78e-4ns Sicherheit n/a (kein Angriff) | klassischer Holdover 844s [220-2130] p95 167.0ns Sicherheit n/a (kein Angriff)

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
seg-51820163de28 = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
# c2: integrity
seg-80fe14eb5e79 = Optionale Felder: <c1/>, <c2/>

# text
# c1: scenarios/clock-ensemble.toml
seg-807e7c5a2565 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-b0a5473bec67 = Microchip SA65 / SA.45s CSAC Datenblatt sigma_y(1s)={ "3e-10" }; q_

# text
seg-a8d92406e428 = Optische Strontium-Gitteruhr, weltraumtaugliches Ziel sigma_y

# text
# c1: scenarios/
seg-0cd8dc81045c = { "4" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# attr:alt
seg-cb0b7da83f5c = Das Diagramm, das die Engine für scenarios/clock-ensemble.toml schreibt, Typ clock

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> Der optionale Abschnitt [integrity] des Typs clock (clock_integrity::run): aus einem festgelegten Standort und Konstellations-Voreinstellungen (geometry::sky_geometry), zu jeder Integritätsepoche, solange die GNSS-Zeitreihe nicht gesperrt ist, Snapshot-RAIM (raim::snapshot_ Tests: <a1>clock_integrity.rs</a1>.

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: eine Parser-Schicht, die eine RINEX-Uhrendatei (AS/AR-Einträge einer benannten Uhr, Versionen { "2" } und { "3.00" } bis { "3.04" }), ein ASCII-Phasen- oder Frequenzprotokoll im TimeLab-Stil oder ein TAPR-TICC-Zeitstempel- oder Intervallprotokoll in eine einheitliche Pha Tests: <a1>clock_log_allantools.rs</a1>.

# text
seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input mit den Formaten ptp4l, phc2sys, ts2phc, chrony-tracking und chrony-statistics: der protokollierte Offset einer linuxptp-Servo-Zeile (ns, der eigene eingeklammerte Zeitstempel der Zeile, Messwerte, bevor der Servo erstmals s2 meldet, entfallen a

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifizierte/Hadamard-Abweichung + Potenzgesetz-Rauschidentifikation mit χ²-Konfidenzintervallen. Unabhängige Referenz (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-Referenzabweichungen auf NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Geschlossene Formel für das Wachstum des Auslauffehlers + Holdover bis zum Schwellenwert; Quantenuhr-Klassen. Unabhängige Referenz (ReferenceImpl): Mehrschritt-Kovarianzrekursion von clock_state (Gegenprüfung innerhalb derselben Codebasis); der zugrunde liegende Kern für Auslaufvarianz und Holdover-Inversion ist extern gegen scipy validiert (siehe „Clock-holdover coast-variance & threshold inversion“). Die Holdover-Werte je Klasse mit Rotrauschboden bleiben MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-Zustands-Van-Loan-Kalman-Uhr (Phase/Frequenz/Drift), Joseph-stabilisiert. Unabhängige Referenz (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), mit F über scipy.linalg.expm und Q über die Van-Loan-{ "1978" }-Blockmatrix – eine unabhängige Referenzimplementierung, die die vollständige Filtertrajektorie von kshana reproduziert. Konsistenz über Implementierungen hinweg: Die Uhrenphysik / Allan-Kalibrierung ist nicht extern validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): auf IGS-Final-{ "30" }-s-Uhren von { "11" } GPS Blo

# text
seg-b9174c70772f = <b>MODELLED</b> Uhrengestütztes χ², RAIM, AGC, SQM, fusioniert zu einer Sicherheits-Gütezahl je Epoche. Unabhängige Referenz (ExternalDataset): TEXBAT-Szenarioparameter (Humphreys { "2012" }) – Charakterisierung, keine festgelegten Vektoren. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): bei JammerTest { "2024" } (Bleik; GPL-3.0-Daten) lösten die Monitore auf Beobachtungsebene (uhrengestütztes Chi-Quadrat, RAIM, Lösungsausfall) innerhalb von { "10" } s bei keinem der { "8" } auswertbaren veröffentlichten Spoofing-Einsätze Alarm aus (wo das Fenster vor dem Einsatz sauber war, kam der erste Alarm { "10.2" } bis { "39" } s nach dem pu

# text
seg-e12f672ae71d = GNSS-gesperrter Uhren-Holdover ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = Die Zustandsschätzung der Bordzeit-Uhr ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = Spoofing-Erkennung ist MODELLED, nicht validiert: eine Teilaussage ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
seg-ee7dd15019d0 = Themenseite: <a1>CAMPAIGNS.md</a1>

# text
seg-46ed0b786244 = Themenseite: <a1>RECEIVER-TRUST.md</a1>

# text
seg-e06f9a5a0291 = <s1>Zurück</s1>cislunar-observability

# text
seg-aba9395185fa = <s1>Weiter</s1>combined-altpnt

# text
seg-debc2f07db78 = true

seg-d1beb62cf742 = { "6" } mitgelieferte Szenarien verwenden diese Art; die übrigen stehen in <a1><c1/></a1>.

seg-936e96edf423 = <b>MODELLED</b> Die Art <c1/>: ein Dokument aus Phasen, jede eine von acht registrierten Arten, der Reihe nach ausgeführt, wobei die 6x6-Kovarianz, die Uhr und das Bezugssystem nach einer genannten Regel weitergegeben werden (<c2/>; <c3/>, weißes Beschleunigungsrauschen über eine genannte Lücke Tests: <a1>field_units_global.rs</a1>.

seg-3319b18ac61f = und { "1" } weitere in der Matrix.
