# docs--kind-fusion: translations (de)

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
