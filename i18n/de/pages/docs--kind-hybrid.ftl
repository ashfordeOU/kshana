# docs--kind-hybrid: translations (de)

# text
seg-03442e4be82d = Datenblatt Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

# text
seg-f70076ea4a77 = <b>VALIDATED</b> Allan-/modifizierte/Hadamard-Abweichung + Potenzgesetz-Rauschidentifikation mit χ²-Konfidenzintervallen. Unabhängige Referenz (ExternalDataset): NIST SP { "1065" } (Riley) / Stable32-Referenzabweichungen auf NBS14

# text
seg-5278ccdaf16f = <b>MODELLED</b> Geschlossene Formel für das Wachstum des Auslauffehlers + Holdover bis zum Schwellenwert; Quantenuhr-Klassen. Unabhängige Referenz (ReferenceImpl): Mehrschritt-Kovarianzrekursion von clock_state (Gegenprüfung innerhalb derselben Codebasis); der zugrunde liegende Kern für Auslaufvarianz und Holdover-Inversion ist extern gegen scipy validiert (siehe „Clock-holdover coast-variance & threshold inversion“). Die Holdover-Werte je Klasse mit Rotrauschboden bleiben MODELLED

# text
seg-3ea0aa9b3907 = <b>MODELLED</b> 3-Zustands-Van-Loan-Kalman-Uhr (Phase/Frequenz/Drift), Joseph-stabilisiert. Unabhängige Referenz (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), mit F über scipy.linalg.expm und Q über die Van-Loan-{ "1978" }-Blockmatrix – eine unabhängige Referenzimplementierung, die die vollständige Filtertrajektorie von kshana reproduziert. Konsistenz über Implementierungen hinweg: Die Uhrenphysik / Allan-Kalibrierung ist nicht extern validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): auf IGS-Final-{ "30" }-s-Uhren von { "11" } GPS Blo

# text
seg-e12f672ae71d = GNSS-gesperrter Uhren-Holdover ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8de95b3a9229 = Die Zustandsschätzung der Bordzeit-Uhr ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber extern nicht maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-e4b64d7277da = Spoofing-Erkennung ist MODELLED, nicht validiert: eine Teilaussage ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f4cf8b629797 = Themenseite: <a1>INTEGRITY.md</a1>

# text
seg-98151954f217 = false

# text
seg-7b2721b7588d = Szenarioart der Engine v{ $version }, Familie <a1>Inertial-, Fusions- und Quantensensoren</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-dba20bb12cda = Pflichtfelder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-e0633b308e4e = <b>MODELLED</b> Ein gestapeltes Kalman-Filter über Position, Geschwindigkeit, Uhrenphase und -frequenz, gespeist mit Pseudoentfernungen, die Position und Uhr koppeln (Joseph-Form-Updates mit Kreuzkovarianz); eine 1-DOF-Variante, erweitert um einen konstanten Beschleunigungsmesser-Bias s Tests: <a1>fusion_coupled_filters.rs</a1>.

# text
seg-451a304052c4 = <b>MODELLED</b> Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN). Unabhängige Referenz (ExternalDataset): Veröffentlichte numerische Vektoren aus Primärarbeiten zu CAI (Übertragungsfunktion nach Cheinet { "2008" }; Empfindlichkeit nach Peters/Freier): k_eff·T² exakt getroffen, die Schrotrausch-ASD ein einseitiger Boden innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte tragen technisches Rauschen über dem Quantenboden). Eine Eingrenzung, keine Gleichheit. { "0.30" } Runde { "2" } (vorab registriert fcb9ac64), ein Befund (bleibt MODELLED): das reine QPN-Rotationsrauschen gegen das gemessene von Gauguet et al.

# text
seg-9955b1b1c018 = Die Leistung von Quanten-Inertialsensoren ist MODELLED, nicht validiert: Eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = Die Resilienz der Quanten-Inertial-Koppelnavigation ist MODELLED, nicht validiert: gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Familienseite: <a1>Inertial-, Fusions- und Quantensensoren</a1>

# text
# c1: docs/kinds/by-kind/hybrid.md
seg-d91dc5633e67 = Quelle: <c1/>

# text
seg-22cd963c7042 = Hybrid-PNT-Abschlussszenario: Uhr + IMU + Zeitübertragungsstützung.

# text
# c1: scenarios/hybrid-pnt.toml
seg-166be08d5276 = Ein Lauf von <c1/> fasst sich so zusammen: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

# text
seg-5a70fcb097dc = Optionale Felder: keine

# text
# c1: scenarios/hybrid-pnt.toml
seg-f33278986879 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-7bebd09c614b = Quarz-Beschleunigungsmesser der Navigationsklasse (Honeywell QA-2000 / G

# text
seg-4f5fd1bc8a4e = Hybrider Quanten-Beschleunigungsmesser-Triade von Exail, Bias-Stabilität { "5.8" }

# text
seg-49bff8dc860e = Quarz-Beschleunigungsmesser der Navigationsklasse (H

# text
seg-a1810bbca337 = <b>MODELLED</b> Zweiweg/TWSTFT (Sagnac), GNSS-Common-View, PPP; Link-Jitter→Entfernung. Orakel (ExternalDataset): Sagnac-Betrag geprüft gegen einen maßgeblichen VERÖFFENTLICHTEN WERT — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Gl. { "1.29" }: Eine ostwärtige Umrundung am Äquator summiert { "207.4" } ns (2ωA_E/c²); kshana reproduziert { "207.386" } ns. Unabhängig bestätigt durch RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), das dieselbe 2Aω/c²-Geometrie trägt. Der zusammengesetzte BIPM-TWSTFT-Transponder/Common-View/

# text
seg-a8beb8dfc757 = Das Fehlerbudget der Zeitübertragung ist MODELLED, nicht validiert: Eine Teilaussage wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-a9c56fc9608a = Themenseite: <a1>MACHINE-INPUTS.md</a1>

# text
seg-cc86939900fe = <s1>Zurück</s1>hybrid-ukf

# text
seg-53b95026bf54 = <s1>Weiter</s1>impairment-eval

# text
# c1: hybrid
seg-3b43d9c5624d = <c1/> (Szenarioart)

# attr:alt
seg-52378a7b074c = Das Diagramm, das die Engine für scenarios/hybrid-pnt.toml schreibt, Szenarioart hybrid
