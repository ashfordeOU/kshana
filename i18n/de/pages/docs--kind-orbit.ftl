# docs--kind-orbit: translations (de)

# text
seg-a8d92406e428 = Optische Strontium-Gitteruhr, weltraumtaugliches Ziel sigma_y

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
seg-debc2f07db78 = true

# text
seg-11e8c29ecb45 = Szenarioart der Engine v{ $version }, Familie <a1>Konstellationen, Abdeckung und Geometrie</a1>. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung verdient wird: der Abschnitt Evidence der README).

# text
seg-a4f1e7d2041e = Familienseite: <a1>Konstellationen, Abdeckung und Geometrie</a1>

# text
seg-be831b52a339 = und { "4" } weitere in der Matrix.

# text
seg-d291f20074f0 = <b>VALIDATED</b> Erddrehung aus einem zweiteiligen UT1-Julianischen Datum auf dem Bahnpfad, sodass die erdfeste Position die Mikrosekunde behält, die ein Datum aus einem einzelnen f64 verliert (etwa { "3e-9" } rad nahe { "2020" }): jd2::gmst82 (IAU-{ "1982" }-GMST, die TEME-Konvention, auf den zwei Teilen), cio:

# text
seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: die Zeilen der <a1>Verifikationsmatrix</a1>, die diese Art nennen.

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP aus der Sichtliniengeometrie über Q=(HᵀH)⁻¹ mit einer lokalen ENU-Aufteilung. Unabhängige Referenz (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — unabhängige Bibliothek, auf { "1e-6" } relativ getroffen

# text
seg-53a78e98af12 = Themenseite: <a1>SKYLINE.md</a1>

# text
seg-ae15d15bf151 = Themenseite: <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/orbit.md
seg-0e3518dc3ddb = Quelle: <c1/>

# text
seg-cb4262b66b8f = GNSS-Verfügbarkeit + DOP aus einer Bahnkonstellation (Walker / TLE / RINEX).

# text
# c1: scenarios/orbit-rinex.toml
seg-97680b4587c8 = Ein Lauf von <c1/> fasst sich zusammen als: Szenario bffc887db977 | 77/361 Samples GNSS-nominal | bester PDOP { "2.53" } Pos 2.53m | Quanten-Holdover 0s p95 6.49e-5ns Integrität { "1.000" } Sicherheit n/a (kein Angriff) | klassisches Holdover 0s p95 25.0ns Integrität { "1.000" } Sicherheit n/a (kein Angriff)

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
seg-b3a080b98bd9 = Erforderliche Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: sigma_uere_m
# c2: constellations
# c3: epoch
# c4: export_sp3
# c5: export_omm
# c6: export_oem
# c7: skyline
seg-c818cc4f87da = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/orbit-rinex.toml
seg-364139ff447d = Das Beispiel <c1/> setzt unter anderem:

# text
seg-d5063dda3971 = Microchip SA.45s / SA65 Chip-Scale-Atomuhr, sigma_y(1s)

# text
seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

# text
seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP aus der Sichtlinien-Geometrie über Q=(HᵀH)⁻¹ mit einer lokalen ENU-Aufteilung Tests: <a1>dop_reference.rs</a1>.

# text
seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry und check: eine Monte-Carlo-Simulation mit Seed (N = { "20,000" } Epochen pro Geometrie, sigma = { "1.5" } m, ChaCha8-Seed { "36" } + i) des iterierten Kleinste-Quadrate-Fixes der Engine (pvt::solve_spp, Einheitsgewichte, aus der wahren Position gelöst) auf Tests: <a1>uere_dop_monte_carlo.rs</a1>.

# text
seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: der geodätische (WGS-84) Azimut und die Elevation eines Satelliten von einem Bodenstandort, eine Azimut/Elevation-Maskentabelle, linear in Azimut interpoliert mit Umbruch bei { "360" } deg, die sichtbare Menge el Tests: <a1>skyline_orekit_oracle.rs</a1>.

# text
seg-d86884be3f98 = <s1>Zurück</s1>optical-atmosphere

# text
seg-da202333ae8d = <s1>Weiter</s1>passes

# text
# c1: orbit
seg-1428025a91e1 = <c1/> (Szenarioart)

# attr:alt
seg-3b652c0da6de = Das Diagramm, das die Engine für scenarios/orbit-rinex.toml schreibt, Szenarioart orbit

# text
# c1: scenarios/
seg-99a3c57c7926 = { "7" } mitgelieferte Szenarien verwenden diese Szenarioart; die übrigen stehen in <a1><c1/></a1>.
