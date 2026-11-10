# docs--verification-matrix: translations (de)

# text
seg-619f89bf160c = Realisierung des lunaren Bezugssystems

# text
seg-2db69c58f694 = Lunares differenzielles PNT

# text
seg-1ff1d8ebf1e7 = Compliance-Zuordnung zu öffentlichen Rahmenwerken

# text
seg-aab745a65e76 = Modul

# text
seg-d6476863f862 = Fähigkeit

# text
seg-ad856ad710eb = Status

# text
seg-60a43431ebe0 = Anforderung

# text
seg-cbf0f9bcd2d8 = Unabhängige Referenz

# text
seg-1603e76bcf66 = Identifikation von Potenzgesetz-Rauschen über die Autokorrelation bei Lag 1

# text
seg-d95fe5878ee3 = allan::lag1_noise_id: der Rauschidentifikator nach Riley und Greenhall ({ "2004" }) über die Autokorrelation bei Lag 1 (dezimierte Phase mit entferntem quadratischem Anteil oder gruppengemittelte Frequenz mit entfernter Geraden; wiederholte erste Differenzen, bis delta = r1/({ "1" }+r1) < { "0.25" } oder d = dmax), der den ganzzahligen und den ungerundeten Potenzgesetz-Exponenten alpha (+{ "2" } weiße PM bis -2 Random-Walk-FM) bei jedem Mittelungsfaktor liefert; er legt die Freiheitsgrade der Rauschart für die Gerätekarten der Bibliothek gemessener Uhren fest

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin und Mitwirkende, LGPL-3.0-or-later, vom Fixture-Generator als getrenntes Programm ausgeführt): eine unabhängige Implementierung des veröffentlichten Algorithmus von Riley-Greenhall, eine unter den angegebenen Konventionen eindeutig definierte Größe. Validiert den Identifikator, nicht den Rauschinhalt einer echten Uhr

# text
seg-aedf395f3597 = Authentifizierung von Navigationsdaten auf Empfängerseite bei Galileo OSNMA

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/>: ein offener, reiner Rust-Verifizierer auf Empfängerseite für Galileo OSNMA (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) aus I/NAV-Seiten oder einem u-blox-UBX-RXM-SFRBX-Strom: öffentliche Schlüssel im Merkle-Baum (DSM-PKR), die ECDSA-Signatur P-256/P-521 des DSM-KROOT, Verifikation der TESLA-Schlüsselkette (SHA-256 oder SHA3-256), Verifikation von MACSEQ und Tag (HMAC-SHA-256 oder CMAC-AES) für ADKD { "0" }, { "4" } und { "12" } mit Kreuzauthentifizierung, Kettenende/Widerruf/Erneuerung, Erneuerung und Widerruf öffentlicher Schlüssel und die Alarmnachricht; Status je Satellit Authenticated/Failed/Unavailable mit einem Grund für jeden Fehler oder jede Verzögerung. Beratend: keine typzugelassene Navigationsausrüstung und kein Integritätsdienst für die Navigation; es wird keine Leistung gegen Spoofing behauptet

# text
seg-a6bd60ed728f = Die offiziellen Galileo-OSNMA-Testvektoren, die das European GNSS Service Centre als Anhang zu den Receiver Guidelines veröffentlicht hat (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } von { "18" } Sätzen, { "186,382" } Tags authentifiziert, { "0" } fehlgeschlagen, am 2026-10-10 offline ausgeführt (Nachweisprotokoll in kshana-pro docs/evidence). Umfang: Die Vektoren validieren die kryptografische Verifikation (Merkle, KROOT/ECDSA, TESLA-Kette, MACK-Tags, ADKD 0/4/12) und ihre Ergebnisse auf den veröffentlichten Szenarien; sie verwenden nur HMAC-SHA-256, eine SHA-256-Kette, 128-Bit-Schlüssel, 40-Bit-Tags und die Nachschlageeinträge { "33" } und { "34" }, sodass CMAC-AES, SHA3-256-Ketten und andere Parameter nur durch veröffentlichte Known-Answer-Tests der Primitive und synthetische Tests abgedeckt sind. Die Härtung bei vertrauenswürdiger Zeit, Datenbindung, Ablauf und Header-Bestätigung wird durch die synthetischen Angriffstests geprüft, nicht durch eine externe unabhängige Referenz. Nicht geprüft: Zertifikatssperrlisten, Live-Signale oder ein Live-Empfänger (das UBX-Wortlayout wird nur an synthetischen Rahmen geprüft), SHA3-256-Merkle-Bäume, Aktualität ohne unabhängige Zeit. Kein EU-Dienst

# text
seg-27a61718eb95 = Charakterisierung der Frequenzstabilität

# text
seg-56174d771190 = Allan-/modifizierte/Hadamard-Abweichung + Identifikation von Potenzgesetz-Rauschen mit χ²-KI

# text
seg-ed01b2ab3481 = Referenzabweichungen NIST SP { "1065" } (Riley) / Stable32 auf NBS14

# text
seg-25b78672c194 = Frequenzstabilität einer echten gemessenen Uhr

# text
seg-fd378f5fe04a = Überlappende Allan- + überlappende Hadamard-Abweichung an einem echten Cäsium-Normal

# text
seg-64fd49d58394 = Überlappende ADEV/HDEV nach Stable32 an der gemessenen Phasenreihe des Cäsium-Normals 5071A (allantools)

# text
seg-f305dbc83f2b = Parität des Allan-Schätzers auf der kanonischen Stable32-Referenzreihe

# text
seg-5bfca5dcfb7c = Überlappende Allan- + modifizierte Allan- + Zeitabweichung über die ganze AF-Leiter

# text
seg-327ab6dcf16a = Stable32-Referenzabweichungen für PHASE.DAT (Riley; die Standard-Regressionsreihe)

# text
seg-96c4275f5a89 = Frequenzstabilität mit erweitertem Bereich (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 und Gesamtabweichung (TOTVAR): Schätzer der Stabilität bei langem Tau mit erweitertem Bereich, die ~{ "75" } % der Aufzeichnung erreichen, wo die Allan-Abweichung bei ~{ "50" } % an ihre Grenze kommt; das darauf aufbauende verzerrungsbereinigte Hybrid ThêoH (allan::theoh_curve) bleibt MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" }, eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters: theo1 (NIST SP { "1065" } Gl. { "30" }) und totdev (NIST SP { "1065" } Gl. { "25" }) auf dem hermetischen LCG-Datensatz aus NIST SP { "1065" } §{ "12.4" }; offline über tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py neu erzeugbar

# text
seg-cc40472fbcbf = Maximaler Zeitintervallfehler (MTIE), Wander-Metrik der Telekommunikation

# text
seg-5c54ba2748f7 = MTIE(τ): der maximale Spitze-Spitze-Hub des Zeitfehlers über jedes gleitende Fenster von τ = m·tau0, die Wander-Statistik nach ITU-T G.810/G.823/G.8261, gegen die die Grenzwerte von Synchronisationsnetzen (MTIE-Masken) geschrieben sind; eine Extremwertgröße (Max/Min), verschieden von der RMS-Allan-Familie

# text
seg-300fd3f945a0 = allantools { "2024.06" }, eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters: mtie() auf der hermetischen LCG-Phasenreihe aus NIST SP { "1065" } §{ "12.4" }; MTIE ist eine reine Max/Min-Statistik, daher ist die Ausgabe des Schätzers auf dem identisch aufgebauten Phasenarray bitgenau gegenüber allantools (die eingecheckten Referenzkonstanten mit 15 signifikanten Stellen liegen innerhalb von { "1" } ULP). Offline über tests/fixtures/mtie/generate_mtie_reference.py neu erzeugbar

# text
seg-67d73f3ca14d = Modifizierte Allan- / Zeitabweichung (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ): die überlappende modifizierte Allan-Abweichung (Schätzer mit gleitendem Fenster aus zweiten Differenzen, der weißes von Flicker-Phasenrauschen trennt), und TDEV(τ) = τ/√{ "3" }·MDEV(τ), die Zeitbereichs-Wander-Statistik nach ITU-T G.811/G.812/G.823, gegen die die Synchronisationsmasken geschrieben sind

# text
seg-24a441f32375 = allantools { "2024.06" }, eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters: mdev() und tdev() auf der hermetischen LCG-Phasenreihe aus NIST SP { "1065" } §{ "12.4" } (dieselbe Reihe wie in den Zeilen Theo1/TOTDEV/MTIE), die dieselben eindeutig definierten Schätzer berechnen; abgeglichen auf <{ "1e-9" } relativ. Offline über tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py neu erzeugbar. (Das datengesteuerte phasedat_reference.rs prüft diese ebenfalls gegen Stable32 auf { "1e-3" }; dies ist die enge, stets aktive hermetische Gegenprüfung)

# text
seg-e4b6d707cbf5 = Frequenzstabilität einer optischen Uhr auf einer echten gemessenen Kurve

# text
seg-e9077554a08f = NNLS-Rückgewinnung eines Potenzgesetzes (weiße FM + Boden mit rotem Rauschen) aus einer veröffentlichten gemessenen Allan-Abweichung des optischen Uhrenübergangs von ⁸⁸Sr: σ_y(τ) und die Kernskalierung 4.7e-16/√τ bei kurzem τ werden mit einem echten gemessenen Boden bei langem τ reproduziert, statt des synthetisierten Bodens der optischen Klasse, den holdover.rs sonst annimmt

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Abb. { "4" }, gemessene ADEV; Kurve wörtlich übernommen von Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Beschränkt auf die Reproduktion der veröffentlichten gemessenen Stabilitätskurve; die Gerätezahlen für holdover bis zur Schwelle je Uhrenklasse bleiben MODELLED

# text
seg-cc95c8615d39 = Integrität (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = ARAIM-Solution-Separation mit mehreren Hypothesen nach dem ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels und add_v42_protection_levels_ecef: Teilmengenbestimmung nach den Regeln P_THRES und FC_THRES, VPL, HPL, die effektive Monitorschwelle EMT und sigma_acc); χ²-Snapshot-RAIM-Fehlererkennung mit Ausschluss einzelner Satelliten (raim::snapshot_raim, raim::snapshot_raim_fde) und steigungsbasierte HPL/VPL auf der geodätischen lokalen Ebene; und die SBAS-Kombination der Schutzniveaus nach DO-229E (sbas::sbas_protection_level) auf dem L1-Dienst. NICHT abgedeckt, offen gesagt: Die Komfortfunktionen mit einheitlichem Sigma raim::araim_raim und raim::araim_dual_raim sind NICHT ADD-konform (bei gleichen Eingaben verfehlen sie Stanford MAAST um { "0.75" } m VPL / { "4.04" } m HPL und { "0.39" } m VPL / { "1.93" } m HPL, ein Befund); der L5-SBAS-Vergleich für Zweifrequenz-Mehrkonstellationen (DFMC) ist ein Befund ({ "308" } Nutzer-Epochen-Paare ohne GEO in Sicht werden von Kshana geschützt und nicht von MAAST, dessen GEO-Empfangsprüfung Kshana nicht modelliert); raim::solution_separation_raim hat keinen externen Vergleich

# text
seg-1c37702cc5f2 = Bahnpropagation und Bahnbestimmung

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + Störungen, Batch-/sequenzielle OD

# text
seg-c84585f43297 = Verifikationsvektoren AIAA 2006-6753 für SGP4

# text
seg-50c545872e4f = Numerischer Cowell-Propagator und Kraftmodell

# text
seg-74f8c585bcfd = Numerischer Cowell-Propagator mit hierarchischem Kraftmodell (Zweikörper, zonales J2–J6, Gravitation dritter Körper durch Sonne/Mond, Kanonenkugel-SRP, exponentieller Luftwiderstand); RK4 mit Schrittverdopplung / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853: eine unabhängige Bibliothek, ein anderer Integrator und eine andere Kugelfunktionsrekursion. Die konservativen Stufen (Zweikörper → zonales J2–J6 → Gravitation dritter Körper durch Sonne/Mond → Kanonenkugel-SRP) stimmen über einen Bogen von { "24" } h auf unter einen Meter überein und validieren den Integrator + die Kraftalgebra; die Luftwiderstandsstufe und die absolute Treue der Eingabe aus Sonnen-/Mondephemeride / Dichte bleiben MODELLED (nur Charakterisierung)

# text
seg-d38c4be472ac = SRP-Schatten der abgeplatteten Erde (optional)

# text
seg-ab8247c6b4d2 = SRP-Beleuchtungsanteil mit dem Ellipsoid WGS-84 als verdeckendem Körper (scheinbarer Erdradius vom Ellipsoidrand zur Sonne, Formel der Doppelscheibenlinse; srp_shadow::oblate_conical_shadow), optional im Cowell-Kraftmodell über propagator::ForceModel::srp_shadow (Standard: der sphärische konische Schatten, unverändert)

# text
seg-01066d639b39 = Box-Wing- und ECOM2-Strahlungsdruck der Sonne, mit partiellen Ableitungen (optional)

# text
seg-2a5fc9708bd0 = SRP ohne Kanonenkugel: ein Flachplattenmodell Box-Wing (Vallado Gl. 8-44; einseitige Körperpaneele, zur Sonne zeigende Flügel) mit den Tabellen für Galileo FOC, IOV und IOV am Lebensende aus den Satellitenmetadaten der GSC, in nominaler GNSS-Gierlenkung, mit analytischen partiellen Ableitungen für den Strahlungsfaktor und die spekularen und diffusen Koeffizienten jedes Paneels; und das empirische Modell ECOM2 (D2/B1) mit seinen partiellen Ableitungen. Das Box-Wing ist optional im Cowell-Propagator (propagator::ForceModel::box_wing_srp, setzt sein Feld srp_boxwing) und im Modell der präzisen Bahnbestimmung (precise_od::PreciseForceModel::box_wing_srp), wobei es den Kanonenkugel-Term mit cr als Strahlungsfaktor ersetzt; beide stehen standardmäßig auf None, sodass jeder bestehende Pfad byteidentisch bleibt. ECOM2 ist in kein Kraftmodell eingebunden

# text
seg-bde1b3a94a47 = SRP-Schatten mit Randverdunkelung der Sonne (optional)

# text
seg-eaaec545dd68 = SRP-Beleuchtungsanteil als nicht verdeckter Anteil des randverdunkelten Sonnenflusses (Gesetz der Eddington-Näherung I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauß-Legendre-Quadratur) über einer kugelförmigen oder WGS-84-Erde (srp_shadow::limb_darkened_shadow, die Variante ShadowModel OblateEarthLimbDarkened)

# text
seg-76cb4b668ad5 = Keine externe: Orekit { "12.2" } hat kein Beleuchtungsverhältnis mit Randverdunkelung. Nur gegen geschlossene Formen desselben Gesetzes geprüft

# text
seg-673b17e9dcf7 = Thermosphärische Dichte nach NRLMSISE-00

# text
seg-09e997231de8 = Eine Portierung der empirischen Thermosphäre NRLMSISE-00 (gtd7 und gtd7d: Teilchendichten der Spezies, Gesamtmassendichte mit anomalem Sauerstoff, Temperaturen; die { "24" } Schalter; Modi mit täglichem Ap und 3-stündlichem ap-Array) aus der gemeinfreien C-Fassung des NRL-Fortran

# text
seg-12977f65b2ea = Luftwiderstands-Dichtestufe NRLMSISE-00 (optional)

# text
seg-17aec847b675 = forces::DensityModel (Exponential als Standard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) und propagator::ForceModel::drag_density: quadratischer Luftwiderstand gegen die mitrotierende Atmosphäre mit der Dichte nach NRLMSISE-00 am geodätischen Punkt in WGS-84 (Erdrotationswinkel mit UT1 = TT, lokale Sonnenzeit UT + lon/15), konstantes Weltraumwetter je Modell; standardmäßig aus und bitidentisch

# text
seg-1ac7430e88fc = Standard-Exponential-Luftwiderstand gegen eine unabhängige Implementierung (äquatorial)

# text
seg-a9c41b03f2ca = Der Standard-Luftwiderstand des Cowell-Propagators: quadratischer Luftwiderstand gegen die mitrotierende Atmosphäre mit forces::atmospheric_density, der stückweise exponentiellen Tabelle aus Vallado Tabelle 8-4 bei der sphärischen Höhe (propagator::ForceModel::drag mit der Standardvariante Exponential von forces::DensityModel)

# text
seg-9e15970435c3 = Sonne und Mond aus DE440 im Cowell-Kraftmodell (optional)

# text
seg-de6831cf7785 = Optionale Ephemeridenstufe für die Terme der Gravitation dritter Körper und des SRP im numerischen Cowell-ForceModel: die geozentrische Sonne und der Mond aus jedem EphemerisProvider (ein DE440-SPK-Kernel über KernelEphemeris) bei TDB = TT + (TDB - TT), wobei ein Provider, der die Epoche nicht bedienen kann, zurückgewiesen und jeder Rückfall auf die analytische Reihe gezählt wird; standardmäßig aus

# text
seg-057c21daf4f2 = Atmosphärische Gezeit S1 (optional)

# text
seg-f600a39f297e = Die tägliche Luftdruckgezeit S1 als Störung des Geopotenzials: Biancale und Bode ({ "2006" }) Modell N1, Grad { "2" } bis { "6" }, über die Lastformel Gl. { "6.21" } aus IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), optional in den Cowell- und Präzisions-Kraftmodellen (air_tide_s1, standardmäßig aus)

# text
seg-7dd9fccac779 = Keine externe für die Wirkung auf das Geopotenzial. Die { "24" } Koeffizienten sind aus GFZ STR06/01 Tabelle { "1" } Modell N1 übertragen und Zeile für Zeile gegen den Bericht erneut geprüft worden (SHA-256 890865ae); die Grade { "0" }, { "1" }, { "7" } und { "8" } werden nicht verwendet. Ray und Ponte ({ "2003" }) drucken keine Kugelfunktionstabelle, sodass keine zweite Quelle verglichen wurde

# text
seg-b150b1bdb599 = Koeffizienten der atmosphärischen Gezeit S2 in der IERS-Konvention

# text
seg-87e9238b8c53 = Luftdruck-Harmonische S2 nach Ray ({ "2001" }) (n <= { "4" }, prograd und retrograd), umgerechnet in die voll normierte Form mit Sinus-Vorlauf nach IERS { "2010" } Gl. 6.20-6.21 (Amplitude geteilt durch N_nm, epsilon = { "90" } Grad - psi) und als Term S2 von tides::atmospheric_tide angewandt

# text
seg-444f0a65b6fd = Tesserales Geopotenzial im Cowell-Propagator

# text
seg-ad475816bc78 = Optionales tesserales EGM2008-Feld (bis Grad/Ordnung { "70" }) als zentrale Gravitation des numerischen Cowell-ForceModel, ausgewertet in einem erdfesten Bezugssystem, das um den Erdrotationswinkel der IAU { "2000" } gedreht wird (oder über die CIO-Kette GCRS nach ITRS); standardmäßig aus, sodass sich keine bestehende Ausgabe ändert

# text
seg-e8f5ff8c9149 = Sphärisch-harmonische Gravitation hohen Grades (EGM2008 bis { "2190" })

# text
seg-d3b2f32dcecb = Unterlauf- und polsichere Auswertung eines vollständig normierten Feldes bis Grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, modifizierte Vorwärtsspalte nach Holmes-Featherstone { "2002" } mit einem Gradienten ohne 1/cos phi), ein streamender ICGEM-.gfc-Lader (from_gfc_file / from_gfc_reader; das vollständige EGM2008 wird zur Laufzeit geladen, nicht mitgeliefert) und der Holmes-Featherstone-Auswerter, der für das optionale Cowell-Geopotential wählbar ist

# text
seg-e81b7418c382 = DOP853-Integrator

# text
seg-e6e3638aa68e = Explizites Runge-Kutta-Verfahren Hairer DOP853 { "8" }({ "5,3" }) mit dem kombinierten Fehlerschätzer 5. und 3. Ordnung, dem SciPy/Hairer-Schrittweitenregler, automatischer Anfangsschrittweite, einer fail-closed-Schrittwächter-Prüfung und dichter Ausgabe 7. Ordnung; wählbar als Integrator-Variante Dop853 des Propagators / propagator::propagate_dop853

# text
seg-9ad7c1f4da77 = Robuster Löser der Kepler-Gleichung

# text
seg-4b9d812fd13e = Elliptischer Kepler-Löser für alle { "0" } <= e < { "1" } und alle mittleren Anomalien: kubischer Startwert und Korrektur fünfter Ordnung nach Markley ({ "1995" }), ein auslöschungsfreies Residuum (1-e)E + e(E - sin E) - M und abgesicherte Newton-Nachpolierung (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-1960804ef2f4 = Bahnbestimmung im Batch-Verfahren aus Entfernungsraten und Az/El mit Stationsmaskierung

# text
seg-4c185244bc66 = Rekonstruktion eines Epochenzustands aus gemischter Entfernungs-, Entfernungsraten- und Azimut/Elevations-Verfolgung oberhalb einer Elevationsmaske durch Gauss-Newton auf H = (dh/dx(t)) Phi(t, t0): analytische Messpartiale und eine variationelle Zustandsübergangsmatrix mit analytischen Zweikörper- + J2-Partialen (RK4-integriert, keine geschlossene STM)

# text
seg-bc3d1ee7c639 = Beobachtungsgewichtung nach SP3-Genauigkeitscode

# text
seg-63b1fab84f85 = SP3-Genauigkeitscodes (Header-++-Exponenten in { "2" }^n mm, die %f-Basis, Standardabweichungen je Datensatz Basis^n mm) auf Positionssigmas je Beobachtung für die Maschine zur präzisen Bahnbestimmung abbilden (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Keine externe: Die Gewichte sind eine Modellierungsentscheidung (das SP3-Format definiert den Code nur als Genauigkeitsangabe des Erzeugers; er wird hier als Ein-Sigma je Achse gelesen). Die vorhandenen aufgezeichneten Agenturläufe sind unverändert

# text
seg-e35df6881c80 = Planetare Gravitationsfelder aus PDS-SHADR-Tabellen

# text
seg-f78b73ae8742 = PDS-SHADR-Tabellen sphärischer Harmonischer lesen (from_shadr, auf SphericalHarmonicField in src/gravity_pds.rs: Einheitenumrechnung, C00 = { "1" } vorgegeben, Vollständigkeits- und Normierungsprüfungen) und die körperfeste Gravitation von Mars GMM-3 (Grad/Ordnung { "120" }) und des Mondfeldes GL0660B von GRAIL (Grad/Ordnung { "660" }) auswerten

# text
seg-ae3e8833a5ef = Ein veröffentlichtes Gravitationsfeld an einen Körper anhängen

# text
seg-ffb2b20e5f32 = with_gravity_field (auf Body, in src/gravity_pds.rs): hängt jedes geladene sphärisch-harmonische Feld (zum Beispiel GMM-3 oder GL0660B) an einen Body an, sodass der Propagator es körperfest auswertet; optional, Standardkörper unverändert

# text
seg-bcb731f7a9b5 = Nur interne Konsistenz. Jedes veröffentlichte Feld ist im körperfesten Bezugssystem seines Erzeugers definiert (GMM-3 im Mars-Bezugssystem von Konopliv et al. { "2006" }, GL0660B im Hauptachsen-Mondbezugssystem DE421), während das Feld im IAU-Bezugssystem ausgewertet wird; der Versatz ist nicht modelliert

# text
seg-659bfeba459c = Bahnbestimmung im Batch- und sequenziellen Verfahren

# text
seg-dbc98f498941 = Rekonstruktion eines Epochenzustands [r,v] aus Bodenstations-Entfernungen über einen Gauss–Newton-Batch-Differenzialkorrektor und ein sequenzielles Filter, über ein Zweikörper+J2-Kraftmodell

# text
seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — eine unabhängige Schätzbibliothek eines Dritten mit abgestimmtem Kraftmodell; rekonstruierter Epochenzustand + RMS der Residuen nach der Anpassung stimmen auf <{ "1e-3" } m rauschfrei und <{ "3" } m bei einem Rauschboden von { "5" } m überein

# text
seg-acdac055acb9 = Radiometrischer Lichtlaufzeit-Löser für den Weltraum

# text
seg-62a478e40850 = Retardierte (Abwärtsstrecke) einseitige Lichtlaufzeitlösung τ = |r_rx − r_target(t−τ)|/c für die radiometrische Navigation im Weltraum (Erde→Mars/Sonne/Mond)

# text
seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) Lichtlaufzeit mit konvergierter newtonscher Aberration (Aberration::CN; entspricht SPICE spkapo) über JPL DE440 — eine unabhängige SPICE-Implementierung in Rust; der Fixpunkt-Löser für die retardierte Lösung von kshana stimmte auf unter eine Nanosekunde überein. Die weiteren Zahlen zu Doppler / Shapiro / reduziert-dynamischer Bahnbestimmung bleiben MODELLED

# text
seg-c69ef9342160 = Satellitenposition aus der Broadcast-Ephemeride (Multi-GNSS-RINEX)

# text
seg-62702fc6f242 = Keplersche Broadcast-Ephemeride nach IS-GPS-200 / Galileo-OS / BeiDou-OS → ECEF-Satellitenposition aus einem geparsten RINEX-3-Navigationsdatensatz

# text
seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos(), aus C-Quelltext kompiliert (T. Takasu, BSD-2-Clause) — eine unabhängige Implementierung von IS-GPS-200/SIS-ICD, mit denselben RINEX-3-Navigationsdatensätzen gespeist; ECEF-Satellitenposition auf ~{ "62" } nm übereinstimmend. (Die Interpolation präziser SP3-Ephemeriden ist separat validiert — siehe „SP3-Interpolation präziser Ephemeriden“)

# text
seg-c807a782b20e = SP3-Interpolation präziser Ephemeriden

# text
seg-238de70daab9 = Lagrange-Interpolation nach IGS-Standard von Satellitenpositionen aus präzisen SP3-Ephemeriden mit der Erdrotationskorrektur je Stützstelle (jede Stützstelle um ω⊕·(t_node−t) in das erdfeste Bezugssystem des Abfragezeitpunkts drehen, bevor das Polynom angepasst wird)

# text
seg-e9249ae44a11 = RTKLIB peph2pos(), aus C-Quelltext kompiliert (preceph.c; T. Takasu, BSD-2-Clause) — die De-facto-IGS-Referenz, eine unabhängige Implementierung; der Interpolator von kshana (der jetzt dieselbe Erdrotationskorrektur der Stützstellen enthält) stimmte auf einem echten SP3-Produkt auf ~{ "15" } nm überein, gegenüber ~{ "5.5" } cm vor der Korrektur

# text
seg-9762cf428435 = Navigationsnachrichten-Encoder jenseits von GPS LNAV (GPS CNAV, Galileo I/NAV und F/NAV)

# text
seg-9b703b9607d8 = GPS-CNAV-Nachrichtentypen 10/11/30, Galileo-I/NAV-Worttypen 1-5 in nominellen geraden/ungeraden Seiten und Galileo-F/NAV-Seitentypen 1-4: ICD-Feldpackung und Quantisierung, CRC-24Q, Faltungscodierung der Rate 1/2 mit K={ "7" } (G2 invertiert bei Galileo), Blockverschachtelung und Synchronisationsmuster, mit passenden Test-Decodern

# text
seg-7939b210e83c = Interner Rundlauf und bekannte ICD-Antworten; kein Decoder eines Dritten wurde ausgeführt (das RTKLIB/GNSS-SDR-Harness, das KSHANA_NAVMSG_ORACLE_JSON liest, ist datengebunden). MODELLED

# text
seg-5ce7cd3d6011 = Leser für globale IONEX-Ionosphärenkarten und Interpolation auf einem echten CODE-GIM

# text
seg-502656556ddf = IONEX-{ "1.0" }-Leser (Header, I5-Werte fester Spalten, TEC- und RMS-Karten, absolute Epochen, fehlende Werte) mit bilinearer räumlicher Interpolation, der Zeitinterpolation des Formats mit nächster / aufeinanderfolgender / rotierter Karte (Gl. 1-3) und Slant-TEC der dünnen Schale

# text
seg-974d8c1f7876 = Hatch-Trägerglättung des Codes auf echten RINEX-Beobachtungen

# text
seg-f26b5da0f52e = Divergenzfreies Hatch-Filter (ionosphärenfreier Code, getragen von der ionosphärenfreien Trägerphase, Fenster N Epochen, Neustart bei Lock-Verlust, Sprung der geometriefreien Kombination oder Lücke) in der Anordnung der präzisen Einzelpunktpositionierung

# text
seg-fac84cb9b256 = BEFUND gegen die veröffentlichte ITRF2020-Koordinate von WTZR: Die vorab festgelegten Zielwerte (geglätteter Median und p95 höchstens { "0.6" } x roh; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) wurden verfehlt, Verhältnisse { "0.718" } und { "0.923" }; der verbleibende Fehler im Meterbereich ist biasartig (C1C-Codebias, Antenne, Gezeiten, langperiodische Mehrwegeausbreitung), nicht das weiße Rauschen, das die Glättung entfernt. MODELLED: Die Statistik des Filters wird intern geprüft

# text
seg-2eec513ae8c8 = RTK-Doppeldifferenzen mit ganzzahliger Festsetzung per LAMBDA auf echten RINEX-Beobachtungen

# text
seg-6571676bf918 = Relative Positionierung auf kurzer Basislinie aus echtem Zweifrequenz-GPS-Code und -Trägerphase: Doppeldifferenzen gegen den höchsten Satelliten mit ihrer vollständigen Kovarianz, ein Float-Kalman-Filter über die Basislinie und Einzeldifferenz-Mehrdeutigkeiten mit Re-Initialisierung bei Sprüngen, ganzzahlige Kleinste-Quadrate-Schätzung mit LAMBDA mit Ratio-Test und die auf die festgesetzten ganzen Zahlen konditionierte Basislinie

# text
seg-e50c5d4b65c7 = Veröffentlichte ITRF2020-Koordinaten von WTZR und WTZZ (IGN ITRF2020_GNSS.SSC, Lösung { "3" }, mit den RINEX-Antennenhöhen), die die Referenzbasislinie ergeben; Zielwerte vorab festgelegt in tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md, bevor der Code geschrieben wurde. Nur kurze Basislinie: keine ionosphärischen oder troposphärischen Doppeldifferenzen modelliert

# text
seg-f9aa0c529393 = PPP-Zeitlösung der Empfängeruhr gegen die finale IGS-Stationsuhr

# text
seg-83ad9e893db9 = Die vom statischen Float-PPP-Filter auf echtem Zweifrequenz-GPS-Code und -Phase mit finalen IGS-Bahnen und -Uhren geschätzte Empfängeruhr: ein Zeitvergleich vom Empfänger zur IGS-Zeit, die ionosphärenfreie PPP-Zeitlösung.

# text
seg-91a882dd71e8 = Die finale kombinierte IGS-Uhr für die Station WTZR (AR-Datensätze von IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, eine Kombination der Netzlösungen mehrerer Analysezentren; IGS-Produkte, freie Nutzung mit Namensnennung); Zielwerte vorab festgelegt in xval/ppp-time/PREREGISTRATION.md vor jedem Vergleich; alle im ersten Lauf eingehalten. WAS NICHT GEPRÜFT IST: eine Station und ein zweistündiges konvergiertes Fenster; IGS-Zeit, nicht UTC(k); der konstante Versatz enthält Empfänger-Codebiase und ist begrenzt, nicht kalibriert; keine Rückführbarkeit auf Circular T.

# text
seg-a9b2a93401a3 = Float-Präzisionspunktpositionierung auf echten RINEX-Beobachtungen

# text
seg-cc991ccec112 = Statisches erweitertes Float-PPP-Kalman-Filter auf echtem Zweifrequenz-GPS-Code und -Trägerphase mit finalen IGS-Bahnen und -Uhren: ionosphärenfreie Kombination, Satelliten- und Empfängerantennen-Offsets (Empfängervariationen), feste Erdgezeiten, Phase-Wind-up, Shapiro-Verzögerung, geschätzte Zenit-Feuchteverzögerung, Float-Mehrdeutigkeiten je Bogen mit Sprungerkennung per geometriefreier Kombination / Melbourne-Wübbena

# text
seg-36e7c9286af7 = Veröffentlichte ITRF2020-Koordinate von WTZR (IGN ITRF2020_GNSS.SSC, Lösung { "3" }, mit ihrer Geschwindigkeit fortgeschrieben) — Zielwerte vorab festgelegt in tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md, bevor das Filter geschrieben wurde; Entwicklung nur auf der kolokierten Station WTZZ. Nicht modelliert: Ozeanauflast, PCV der Satelliten, Auflösung der ganzzahligen Mehrdeutigkeit

# text
seg-c8d87abed330 = Lesen von RINEX-{ "4" }-Navigationsdateien

# text
# c1: > EPH
seg-28913a01af00 = RINEX-4.00-4.02-Navigationsdateien: <c1/>-Datensätze von GPS LNAV, Galileo I/NAV und F/NAV, BeiDou D1/D2 und QZSS LNAV, in den Broadcast-Ephemeriden-Typ dekodiert; CNAV-, CNV1-3-, FDMA-, SBAS-, STO-, EOP- und ION-Datensätze bis zum nächsten Datensatz-Header übersprungen; ein Datensatz, dessen Header einen anderen Satelliten nennt, oder ein abgeschnittener Datensatz wird zurückgewiesen

# text
seg-278ca396127a = Lesen von RINEX-{ "4" }-Beobachtungsdateien

# text
seg-e0883aa933eb = RINEX-4.0x-Beobachtungs-Header (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; Labels in den Spalten 61-80 ab Version { "4" } erkannt) und Epochendatensätze

# text
seg-971fb1203a6d = Formatprüfung an einer echten veröffentlichten RINEX-{ "4.00" }-Datei (zurückgelesene Werte entsprechen den gedruckten Literalen der Datei) und einem aus der Spezifikation abgeleiteten Header; es wurde kein unabhängiger Leser ausgeführt, daher MODELLED

# text
seg-33e5c74720ff = BeiDou-GEO-Satellitenposition aus Broadcast

# text
seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } Position eines geostationären Satelliten aus einer Broadcast-Ephemeride (inertialähnliches Bezugssystem, dann Rz(Ω̇e·tk)·Rx(−{ "5" }°)), optional über das Feld include_beidou_geo von NavParseOptions, sodass der Standard-Leser GEOs weiterhin überspringt

# text
seg-559814996a4c = Interpolation präziser SP3-Uhren

# text
seg-8e7a0dbd1755 = Satellitenuhrversatz zwischen den tabellierten SP3-Uhrknoten durch lineare Interpolation über die beiden einschließenden gültigen Knoten (das RTKLIB-Schema pephclk; Schlechtuhr-Sentinel übersprungen), und dieselben Knoten, als Datensätze äquivalent zu RINEX-Uhren in die Kette der Präzisionsprodukte eingespeist

# text
seg-1f4f0f841802 = Finale IGS-Satellitenuhr-Kombination mit { "30" } s (IGS0OPSFIN 30S CLK, 2025-02-24): veröffentlichte Uhrschätzungen zu den Abfragezeitpunkten, nicht aus dem SP3 interpoliert; Zielwerte vorab festgelegt in tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md vor dem ersten Lauf (RMS { "0.15" } ns, p95 { "0.30" } ns, Knotenmedian { "1e-12" } s, Diskriminierung 2x)

# text
seg-71f48628ebb2 = Trägerphasen-eng gekoppeltes GNSS/INS mit Float-Mehrdeutigkeiten

# text
seg-5a156aa81275 = Fehlerzustands-EKF über { "15" } INS-Zustände, eine Empfängeruhr mit zwei Zuständen und eine Float-Trägermehrdeutigkeit je verfolgtem Satelliten; Pseudostrecke, Trägerphase und optional Entfernungsrate aus einer SGP4-Walker-Konstellation (Lichtlaufzeit und Sagnac), Klobuchar- und Saastamoinen/Niell-Korrekturen, in der Schleife an der eigenen Position des Filters angewendet; Sprungerkennung per zeitdifferenzierter Trägerphase mit einer je Satellit durch die Geschwindigkeitsunsicherheit verbreiterten Schwelle; Re-Initialisierung der Mehrdeutigkeit bei Sprüngen und Wiedererfassung

# text
seg-00576e8c1032 = Interne Konsistenz: Die Messungen werden aus den Modellen synthetisiert, die das Filter verwendet (χ² NEES/NIS über Seeds, eine rauschfreie Konvergenz, Sprunginjektion). MODELLED; es werden keine echten Empfängerdaten und kein Filter eines Dritten verglichen

# text
seg-7d644516b1ec = GNSS/INS-Pakete für Schifffahrt, Bahn und Luftfahrt mit einer Option zur engen Kopplung

# text
seg-cbb03a8baf73 = Drei gnss-ins-Szenarien auf der Trajektorienbibliothek (ein Schiff, das mit { "8" } m/s schlingert, mit einem Ausfall von fünf Minuten; ein Zug durch einen Einschnitt mit zwei Satelliten und einen Tunnel; ein Flugzeug, dessen Ausfall eine Kurve mit 25 Grad Querneigung umfasst) und die optionale [tight]-Tabelle des Pakets: Pseudostrecken aus einer SGP4-Walker-Konstellation, vom Navigator mit geschlossener Schleife fusioniert, jeder Satellit über der Maske im Nominalfall und die höchsten wenigen im degradierten Fall

# text
seg-273c14256d4c = Intern: die Gütemaße jedes Pakets gegen seine eigene Wahrheit und ein Vergleich lose/eng auf identischen Eingaben. MODELLED; der Vergleich mit NaveGo aus dem Audit wurde nicht ausgeführt

# text
seg-f4dab73c4eda = Gekoppeltes Pseudostrecken-PNT-Filter mit Bias-Zustand und 3D-Erweiterung im Fusionspaket

# text
seg-742b60089361 = Ein gestapeltes Kalman-Filter über Position, Geschwindigkeit, Uhrphase und Frequenz, gespeist mit Pseudostrecken, die Position und Uhr koppeln (Updates in Joseph-Form, die die Kreuzkovarianz mitführen); eine 1-DOF-Variante, erweitert um einen konstanten Beschleunigungsmesser-Bias-Zustand, die das Fusionspaket unter [coupled] ausführt; und die 3D-Version mit 8 Zuständen und Sichtlinienzeilen

# text
seg-9558d7aad3af = Interne Konsistenz: Wahrheit aus den eigenen Modellen der Filter simuliert (χ² NEES über Monte-Carlo-Seeds, das entkoppelte Paket auf identischen Sensoren). MODELLED

# text
seg-4a64aa1fe3ca = Lose gekoppeltes GNSS/INS-EKF mit Hebelarm auf dem KF-GINS-Datensatz

# text
seg-30f503856ac5 = Der Fehlerzustands-EKF mit 15 Zuständen und geschlossener Schleife, angetrieben durch IMU-Inkremente, mit GNSS-Antennenpositionen, die über das Hebelarmmodell H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }] fusioniert werden, konfiguriert aus einer KF-GINS-YAML-Datei (Anfangszustand und Sigmas, ARW/VRW, Gauss-Markov-Biase)

# text
seg-b01d28a09abe = Die veröffentlichte Referenztrajektorie des Datensatzes und das KF-GINS-C++-Programm (GPL-3.0, Commit 8291a93e, als separates Werkzeug ausgeführt); Zielwerte vorab festgelegt in xval/kfgins/PREREGISTRATION.md, und KF-GINS wurde vor dieser Registrierung nicht auf diesen Daten ausgeführt (in den Ergebnissen geprüft). Alle sechs Zielwerte im ersten Lauf eingehalten. DATENGEBUNDEN: Der KF-GINS-Demodatensatz (echte Leador-A15-IMU und RTK-GNSS mit einer Referenztrajektorie) trägt keine Lizenz und wird daher nicht mitgeliefert; xval/kfgins/fetch.sh lädt ihn zur Testzeit mit festgelegtem SHA-256 jeder Datei, und der Test schlägt bei einer Abweichung fehl; der Reproduktionsweg, der Netzwerkzugang benötigt, steht in xval/kfgins/PREREGISTRATION.md. Auf VALIDATED hochgestuft durch Entscheidung des Eigentümers auf Grundlage datengebundener Nachweise (2026-10-13)

# text
seg-e6b6c605564c = Von den Bewegungsdatei-Lesern eines Simulators (gps-sdr-sim) gelesener Testbench-Export

# text
seg-a07429aa1998 = Die Bench-Export-Bewegungsdateien, die den eigenen Lesern eines Open-Source-GNSS-Simulators übergeben werden, kommen als exportierte Trajektorie zurück: die NMEA-GGA-Datei (-g), der Ausschnitt aus Zeit/Breite/Länge/Höhe der Bewegungs-CSV (-x) und ihr Ausschnitt aus Zeit/x/y/z (-u), an { "6" } gnss-ins-Szenarien (einschließlich der Pakete für Schifffahrt, Bahn und Luftfahrt, bis zur Obergrenze des Simulators von 3000 Abtastwerten gelesen) und { "2" } stationären. Nur Bewegung; es wird kein Signal geschrieben oder erzeugt.

# text
seg-07b5f46a900f = WAS EXTERN GEPRÜFT WIRD, eng gefasst: gps-sdr-sim (MIT, Commit 28ca29a6) readNmeaGGA, readUserMotion und readUserMotionLLH mit seinem eigenen WGS-{ "84" }-llh2xyz, über xval/testbench-gpssdrsim/driver.c aufgerufen (keine Signalfunktion aufgerufen), gegen die erdfesten Spalten der Bewegungs-CSV Zeile für Zeile, mit Zielwerten, die vor jedem Lauf in xval/testbench-gpssdrsim/PREREGISTRATION.md vorab festgelegt wurden: jeder Abtastwert in allen { "8" } Szenarien gelesen; NMEA schlechtester Wert { "1.21" } mm (Zielwert { "1" } cm); LLH-Ausschnitt schlechtester Wert { "0.145" } mm (Zielwert { "1" } mm); erdfester Ausschnitt mit vier Spalten exakt (Zielwert { "1" } um, Änderung { "1" }); gnss-ins-Zeilen auf dem { "10" }-Hz-Raster des Simulators auf { "2.3e-13" } s. BEFUND (Lauf { "1" }, festgeschrieben): Die vollbreite CSV ohne Header ist mit -u nicht lesbar, weil der 100-Zeichen-Zeilenpuffer des Lesers jede 161 Zeichen lange Zeile in zwei Abtastwerte teilt; docs/TEST-BENCH.md gibt den Ausschnitt mit vier Spalten an. WAS NICHT GEPRÜFT IST: die Physik der Wahrheitstrajektorie des Szenarios; die Signalausgabe von gps-sdr-sim; der Leser irgendeines anderen Simulators; irgendein Empfänger.

# text
seg-2db2b9dc3b45 = GNSS/INS-Trajektorienbibliothek und CSV-Wahrheitsimport

# text
seg-e1fe83c75a6c = Wählbare Bewegungsprofile für das gnss-ins-Paket (geradeaus, Figur-8, städtisches Stop-and-go, Flugzeugsteigflug und koordinierte Kurve, Vermessungsdrohne), definiert durch Euler-Raten- und Längsbeschleunigungs-Kommandos, geschlossen auf den Wahrheitszustand mit der kinematischen IMU (Zentripetal-, Gravitations- und Coriolis-Terme), und importierte CSV-Wahrheit, in die IMU umgesetzt, die sie reproduziert; die historische Fahrt unverändert, wenn kein Profil angegeben ist

# text
seg-30ea002a06a0 = Intern: Identitäten der Starrkörperkinematik, der CSV-Rundlauf und die eigene Kovarianz des Filters. MODELLED (es wird kein echtes Fahrtenprotokoll verglichen)

# text
seg-8685fd899e3c = Strapdown-INS-Mechanisierung

# text
seg-ba942e322f8a = Strapdown-Inertialmechanisierung mit Quaternionen-Lage, WGS-84-NED (Coning/Sculling-kompensiert), die einen Navigationszustand aus (Δθ, Δv)-Inkrementen fortschreibt

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3), unter Octave ausgeführt — eine unabhängige veröffentlichte INS-Toolbox, angetrieben vom identischen (Δθ,Δv)-Inkrementstrom. Die Lage stimmt bitgenau überein (gleiche Konventionen für NED / Quaternion mit Skalar zuerst / Erdrate / Transportrate); Geschwindigkeit/Position stimmen bis auf zwei dokumentierte Unterschiede überein — den Nord-Gravitationsterm der Lotabweichung, den NaveGo einschließt und kshana absichtlich auslässt (Lotschwere; mit der geschlossenen Form nach Groves auf jede Stelle übereinstimmend, mit einer Plausibilitätsuntergrenzen-Assertion) und Integratorunterschiede der Ordnung O(dt²) — keine Mechanisierungsfehler

# text
seg-d1a5c8e7ca74 = Synthese von Gravitationsfeld-Funktionalen (gravitationsgestützte / GNSS-freie Navigationskarte)

# text
seg-8336eb12eb7b = Sphärisch-harmonische Gravitationsstärke + Störung (mGal) aus jedem ICGEM-.gfc-Modell; GRS80-Normalschwere

# text
seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) Somigliana-Normalschwere + veröffentlichte γ_e/γ_p; echtes ICGEM-EGM2008-Feld

# text
seg-86f9186bb884 = Erde-Mond-CR3BP-{ "9" }:{ "2" }-NRHO gegen die von CAPSTONE geflogene Bahn

# text
seg-d4127cf241f3 = Die kreisförmig eingeschränkte südliche nahezu geradlinige Halo-Bahn (NRHO) mit L2 und { "9" }:{ "2" }, die cr3bp::differential_correct_halo korrigiert (die Bahnfamilie von Gateway und CAPSTONE), verglichen für ihre mittlere Geometrie (Periode, Perilunradius, Apolunradius) mit der Bahn, die CAPSTONE tatsächlich geflogen ist. Eine Messung dafür, wie gut das CR3BP-Mitglied die reale Bahn beschreibt; eine CR3BP-Bahn ist keine Bahn eines Ephemeridenmodells und wird nicht Epoche für Epoche verglichen

# text
seg-c866a5bd4318 = CR3BP-Rotationszustände, auf der Erde-Mond-Linie nach DE440 in mondzentriertes ICRF abgebildet

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf bildet einen dimensionslosen rotierenden Erde-Mond-CR3BP-Zustand auf eine mondzentrierte ICRF-Position und -Geschwindigkeit auf der momentanen Erde-Mond-Linie ab (Längeneinheit der Erde-Mond-Abstand, Zeiteinheit die inverse Bahnrate, die volle Winkelgeschwindigkeit des Bezugssystems einschließlich seiner Rate außerhalb der Ebene aus der Beschleunigung des Mondes), mit der Umkehrung from_moon_centred_icrf, und cr3bp::to_moon_centred_icrf_de440 liest den geozentrischen Mondzustand aus einem DE440-SPK. Es bildet Zustände ab; es macht eine CR3BP-Bahn nicht zu einer Bahn eines Ephemeridenmodells

# text
seg-d543e3e84f36 = Sonnensystem-Art auf einem JPL-Kernel (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = Die Art <c1/> mit planetary_kernel_path: Jeder gemeldete Körper, dessen eigenen NAIF-Code der SPK enthält, bezieht seine heliozentrische J2000-Position und -Geschwindigkeit über den eigenen Leser der Engine aus dem Kernel (Label KERNEL), eine Verbindung, deren beide Enden im Kernel liegen, wird darauf berechnet, Baryzentren werden nie für einen Planeten eingesetzt, und jeder andere Körper bleibt analytisch mit seinem eigenen Label; der Bericht erhält einen Kernel-Block (Pfad, SHA-256, die daraus entnommenen Körper und Verbindungen) nur, wenn die Option gesetzt ist. Mit de440s.bsp sind das Merkur, Venus, die Erde und der Mond

# text
seg-7f3d53b4e8d1 = Porkchop-Diagramm auf der DE440-Ephemeride

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: der Durchlauf über Starttermin x Ankunftstermin von Abflug-C3 (km²/s²) und Ankunfts-V-Unendlich (km/s) mit dem prograden Lambert-Löser für eine Umdrehung und der Kollinearitätssperre von { "0.5" } Grad, auf den heliozentrischen J2000-Zuständen zweier beliebiger NAIF-Körper, die vom eigenen Leser der Crate aus einem JPL-DE440-SPK gelesen werden. Eine Umdrehung, prograd, keine Randbedingungen für Trägerrakete oder Ankunft: ein Durchlauf, kein Missionsentwurf

# text
seg-b1401bed5da8 = Optimierer für impulsive Transfers auf der DE440-Ephemeride

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: die Abflug- und Ankunftstermine eines ballistischen Zwei-Impuls-Transfers mit einer Umdrehung, die den Abflug-C3 oder das Ankunfts-V-Unendlich innerhalb von Typ I oder Typ II minimieren, als kontinuierliches Optimum (ein 2-Tage-Raster über beide Fenster, dann 2D-Nelder-Mead), auf heliozentrischen Zuständen aus dem DE440-SPK. Ein Terminoptimierer für eine Teilstrecke, kein Missionsentwurf: keine Optionen für Trägerrakete, Parkbahn, Deep-Space-Manöver oder mehrere Umdrehungen

# text
seg-6c695aef043b = Ein unabhängiger Optimierer: NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) heliozentrische Zustände auf demselben de440s-Ausschnitt, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) und SciPy { "1.18.1" } Nelder-Mead, ohne Aufruf von Kshana-Code. Das NASA-Handbuch Erde-Mars (MIDAS, Ephemeride nicht angegeben, 2-Tage-Terminraster) ist eine zweitrangige veröffentlichte Referenz und bestimmt den Status nicht

# text
seg-93f3cdbb7297 = Lambert-Transferlöser für mehrere Umdrehungen

# text
seg-995a6a995b78 = Jede Lösung des Lambert-Problems mit bis zu drei vollständigen Umdrehungen (maneuver::lambert_multirev: die Lösung mit einer Umdrehung, dann der linke und der rechte Zweig jeder Umdrehungszahl, Izzo { "2015" }), mit den Randgeschwindigkeiten v1 und v2, für prograde und retrograde Transfers, in kanonischen und heliozentrischen SI-Einheiten, einschließlich Transfers innerhalb von { "1" } % der minimalen Flugzeit einer Umdrehungszahl und Geometrien nahe 180 Grad. Nur ein Zweikörper-Löser (keine Störungen)

# text
seg-ff9c6140fe1c = Lambert-Zweikörper-Transferlöser

# text
seg-d8c39ced64b2 = Lambert-Löser nach Izzo-2015 für eine Umdrehung (r1, r2, Flugzeit → Randgeschwindigkeiten) über LEO→GEO→heliozentrische Transfers, prograd und retrograd

# text
seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — ein unabhängiger Lambert-Löser eines Dritten. Das Lambert-Problem mit einer Umdrehung (M={ "0" }) hat eine eindeutige Lösung, daher ist die Übereinstimmung von Bibliothek gegen Bibliothek eine echte externe Prüfung; auf <{ "1e-4" } m/s übereinstimmend (beobachtet ~{ "1e-11" }), dieselbe Art von Validierung, die DOP gegen gnss_lib_py erhält

# text
seg-347cece5df63 = Bezugssysteme und Zeitskalen

# text
seg-5a4bc2c15eaa = IAU-2006/2000A-Präzession-Nutation, CIO GCRS↔ITRS, Zeitskalen mit Schaltsekunden

# text
seg-51d28ab9d256 = Referenzvektoren von IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Zweiteilige Julianische Daten und Schaltsekunden auf dem Zeitpfad der Erdbahn

# text
seg-5e859e3aa613 = Ein UTC-Kalenderdatum samt Uhrzeit zu einem zweiteiligen Julianischen UTC-Datum nach der SOFA-dtf2d-Konvention für Tage, die mit einer Schaltsekunde enden ({ "86 401" } s lang, { "23" }:{ "59" }:{ "60" }.x gültig), UTC zu TAI und zurück, und UT1 aus UTC über TAI, auf zweiteiligen Daten ab 1972-01-01: der Zeitpfad, den SGP4 (Sgp4::propagate_at, gemessen ab einer zweiteiligen Epoche) und die erdfeste Rotation nach IAU 2006/2000A (sgp4::teme_to_itrs_matrix_eop mit dem zweiteiligen Erdrotationswinkel) nehmen

# text
seg-f1c7bc235a6b = Zweiteilige Julianische Daten bis zur Erdrotation auf dem Bahnpfad

# text
seg-cee11d4bad08 = Erdrotation aus einem zweiteiligen Julianischen UT1-Datum auf dem Bahnpfad, sodass die erdfeste Position die Mikrosekunde behält, die ein einzelnes f64-Datum verliert (etwa { "3e-9" } rad nahe { "2020" }): jd2::gmst82 (IAU-{ "1982" }-GMST, die TEME-Konvention, auf den zwei Teilen), cio::gcrs_to_itrs_matrix_jd2 (die CIO-Matrix GCRS nach ITRS mit dem Erdrotationswinkel aus den zwei Teilen) und, darauf aufgebaut und intern geprüft, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 und own_jd2_utc, die optionale two_part_jd des Ephemeriden-Szenarios (die ECEF-Position, Bodenspur und Stationssicht; standardmäßig aus, unverändert) und verlustfreie From-Konvertierungen zwischen jd2::Jd2 und timescales::TwoPartJd. Präzession-Nutation und die Epoche des Cowell-Kraftmodells bleiben einfaches f64, wo eine Rundung von { "40" } us unter { "1e-15" } rad oder weit unter dem Fehler der analytischen Sonnen-/Mondephemeride liegt

# text
seg-096df3971f5f = Bezugssystem-Matrizen gegen ERFA-Vektoren: IAU-{ "2006" }-Bias-Präzession, TEME nach GCRS und die CIO-Kette mit Offsets des Himmelspols

# text
seg-731a5ed967b3 = Drei Bezugssystem-Matrizen, die Element für Element oder nach Drehwinkel mit ERFA zu beliebigen Epochen verglichen werden: precession::precession_matrix (IAU-{ "2006" }-Bias-Präzession durch Fukushima-Williams-Winkel), nutation::teme_to_gcrs_matrix (die Rotation TEME nach GCRS P^T N^T Rz(-EE) mit IAU-{ "2006" }-Präzession, IAU-2000B-Nutation und der Äquinoktiengleichung mit ihren zwei führenden komplementären Termen) und cio::gcrs_to_cirs_matrix_with_offsets (die Rotation GCRS nach CIRS mit den IERS-Offsets des Himmelspols dX, dY, die vor der Rotation zu den Modell-CIP-X, -Y addiert werden, die Konvention des SOFA-Kochbuchs; neu). Die Modellentscheidungen selbst (2000B-Nutation auf dem TEME-Pfad, die komplementäre Reihe mit zwei Termen) sind nicht validiert, nur ihre Implementierung

# text
seg-4e2fe2e3dabb = UTC vor 1972 (Ära mit driftender Rate) auf dem Zeitpfad zweiteiliger Julianischer Daten

# text
seg-1d086e669f09 = UTC von 1960-01-01 bis 1971-12-31, als UTC mit einer Ratenabweichung gegenüber TAI lief und in Sekundenbruchteilen gestuft wurde, auf dem Pfad zweiteiliger Julianischer Daten: TAI - UTC aus der Drifttabelle jeder Periode (timescales::tai_minus_utc_on_date), das UTC-Kalenderdatum zu einem zweiteiligen Julianischen UTC-Datum mit der Tageslänge { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC zu TAI mit dem von UTC auf SI-Sekunden skalierten Tagesanteil (jd2::utc_to_tai) und TAI zurück zu UTC (jd2::tai_to_utc), nach SOFA dtf2d, utctai und taiutc. Vor { "1960" } wird TAI - UTC als { "0" } genommen (der Wert von SOFA; UTC undefiniert) und liegt außerhalb der Aussage. Das einfache f64 timescales::tai_minus_utc begrenzt vor { "1972" } weiterhin auf { "10" } s und wird nicht abgedeckt

# text
seg-efacec095051 = GLONASS-Broadcast-Satellitenuhr und Broadcast-Bahnfortschreibung

# text
seg-821b9c01b56e = Der GLONASS-Broadcast-Satellitenuhrversatz -tau_n + gamma_n (t - t_b) zu einer auf der Satellitenuhr gelesenen Zeit (glonass::GlonassEphemeris::sv_clock_bias_s, der um den Uhrversatz korrigierte Offset durch zwei Fixpunktiterationen) und die erdfeste PZ-90-Position des Broadcast-Zustandsvektors, per RK4 durch die GLONASS-ICD-Bewegungsgleichungen innerhalb von +/-15 min um die Referenzepoche fortgeschrieben (GlonassEphemeris::position_ecef), aus echten RINEX-{ "3" }-GLONASS-Navigationsdatensätzen. Es wird keine Transformation PZ-90.11 nach ITRF angewendet (sie stimmen seit { "2014" } auf Zentimeterebene überein; RTKLIB wendet auch keine an). Nicht in eine Szenarioausgabe eingebunden: Bibliotheksfunktion

# text
seg-d3b72a6fbb18 = Ein Erdbahn-Pfad: SGP4-Elementsätze zu GCRS und ITRS auf der Kette nach IAU 2006/2000A mit Erdorientierungsparametern

# text
seg-e4eca7205b5e = Der Fortschreibungs- und Bezugssystempfad, den jede geroutete Erdbahn-Art teilt: ein mittlerer SGP4-Elementsatz mit einer zweiteiligen UTC-Epoche (sgp4::MeanElementSet, aus Elementen des Konstellationsentwurfs durch MeanElementSet::from_earth_fixed gelesen), durch SGP4/SDP4 nach TEME fortgeschrieben (sgp4::SgpOrbit), und die Rotationen TEME -> ITRS und GCRS -> ITRS der Kette nach IAU 2006/2000A mit UT1 - UTC und Polbewegung (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, die Formen ohne Parameter teme_to_itrs_matrix und gcrs_to_itrs_matrix). TEME ist der wahre Äquator des Datums mit dem mittleren Äquinoktium, vom GCRS aus erreicht über die IAU-{ "2006" }-Bias-Präzession, die IAU-2000B-Nutation und die Äquinoktiengleichung

# text
seg-f650a11458b8 = Entwurfsabwägung beim Entfernungsmesscode

# text
seg-071e552a7179 = Grenzen für Nebenmaxima und Kreuzkorrelation von m-Folgen/Gold-Folgen, Länge↔Mehrdeutigkeit

# text
seg-65b7902a2d8f = Veröffentlichte Gold-Kreuzkorrelation von GPS C/A (−{ "23.9" } dB); Gold-Schranke von { "1967" }

# text
seg-5ec4c0730280 = GNSS-Geometrie / Dilution of Precision (DOP)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP aus der Sichtliniengeometrie über Q=(HᵀH)⁻¹ mit lokaler ENU-Aufteilung

# text
seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — unabhängige Bibliothek, auf { "1e-6" } relativ übereinstimmend

# text
seg-1a5623c81b48 = Positionsfehler aus der Geometrie: RMS-Fehler = sigma_UERE x DOP für die Kleinste-Quadrate-Lösung der Engine

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry und check: eine gesetzte Monte-Carlo-Simulation (N = { "20,000" } Epochen je Geometrie, sigma = { "1.5" } m, ChaCha8-Seed { "36" } + i) der eigenen iterierten Kleinste-Quadrate-Lösung der Engine (pvt::solve_spp, Einheitsgewichte, von der wahren Position aus gelöst) auf den { "8" } Geometrien aus tests/fixtures/dop/dop_reference.csv, die die Fehlervarianzen in Ost, Nord, Höhe und Uhr, den H/V/P-RMS, die Ost-Nord-Korrelation, die mittleren Fehler und den Anteil innerhalb der { "95" }-%-Horizontalellipse mit sigma^{ "2" } Q vergleicht, wobei Q der Kovarianzfaktor des Kerns orbit::dop ist (orbit::dop_cofactor, dieselbe Arithmetik) auf derselben Geometrie

# text
seg-90f18c774d57 = Interne Konsistenz gegen eine geschlossene Form: Unter dem linearen Gauß-Modell ist die Kleinste-Quadrate-Kovarianz sigma^{ "2" } (H^T H)^-1 (Kaplan und Hegarty (Hrsg.), Understanding GPS: Principles and Applications, 2. Aufl., Artech House, { "2006" }, Kap. { "7" }). Methode und Toleranzen der Entwurfsnotiz zur Geometrie { "0.36" }, Abschnitt { "5.2" }, vor dem ersten Lauf in einem Vorregistrierungs-Commit festgelegt: jede Varianz innerhalb von { "5" } % ({ "5" } Standardfehler einer Stichprobenvarianz bei N = { "20,000" }), jeder RMS innerhalb von { "2.5" } %, die Ost-Nord-Korrelation innerhalb von { "0.035" } (5/sqrt(N)), jeder Mittelwert innerhalb von { "5" } Standardfehlern, der Anteil der { "95" }-%-Ellipse innerhalb von { "0.95" } +/- { "0.0077" } ({ "5" } binomiale Standardfehler); Negativkontrollen (PDOP verdoppelt; Fehler, die gegen das ungewichtete Q mit 1/sin(Elevation) wachsen) müssen scheitern. WIE SIE SICH ZUSAMMENSETZT: Q ist der Kovarianzfaktor des Kerns orbit::dop, VALIDATED gegen gnss_lib_py { "1.0.4" } auf genau diesen { "8" } Geometrien in tests/dop_reference.rs (Zeile „GNSS-Geometrie / Dilution of Precision“); diese Zeile ergänzt den Schritt von diesen Faktoren zu Metern durch den Löser der Engine und übernimmt nicht den Status jener Zeile. WARUM MODELLED: Es ist kein externer Datensatz beteiligt; die Übereinstimmung zeigt, dass Schätzer und Rauschen unter dem Lehrbuchmodell sigma x DOP verwirklichen, nicht dass der Fehler irgendeines Empfängers UERE x DOP entspricht, und sigma_UERE ist eine Eingabe

# text
seg-9acfde1b57f7 = Geometriebewusste Vertrauensklassifikation: Satellitengeometrie neben dem Vertrauenswert des Empfängers und eine Klasse für jeden Abzug

# text
seg-6138c41e13ff = receiver_trust::geometry: Satellitengeometrie je Epoche (gut, degradiert mit den Gründen few-satellites/high-pdop/high-hdop/sky-blocked, oder unbekannt, wenn das Log kein GSV, NAV-SAT oder GSA liefert), abgeleitet aus den gemeldeten Elevationen und Azimuten über orbit::dop oder aus GSA übernommen, mit einem Label, das stets gemeldet und nie bewertet wird (good, fair, poor, unknown) und mit HDOP, PDOP, VDOP, Satellitenzahl und Signalverlust in Worten; ein Geometrie-Monitor des Schiffswerts, der nichts abzieht, sofern die Geometrie nicht schlecht ist (Verhältnis max(hdop/4, pdop/6, 5/n_used) über { "1" }), dann bis zu einer Obergrenze von { "15" } Punkten bei { "1.5" } ansteigt, die die Geometrie allein nicht unter das degradierte Band drücken kann (Obergrenze, Ende der Rampe und Untergrenze in [geometry]; kein Alarm); eine Klasse für jeden Abzug (geometry, environment, inconsistency), wobei Lock-Verlust bei Satelliten unter { "15" } Grad als geometry klassifiziert wird, Satelliten in Sicht, aber nicht verfolgt, als environment, und ein Abzug wegen schlechter Geometrie, dessen angegebener HDOP jenseits von max({ "1.0" }, { "25" } % des abgeleiteten HDOP) vom angegebenen Himmel liegt, als inconsistency

# text
seg-6987737c5fe4 = Interne Konsistenz: Die Klassifikation wird gegen die Regeln geprüft, die sie nennt, und gegen von Hand abgeleitete Verhältnisse an synthetischen Änderungen des festgeschriebenen Demo-Logs, und die Pins ohne Änderung halten die Ausgaben von { "0.35.0" } fest: Kein Wert ändert sich, sofern die Geometrie nicht schlecht ist; das Label wird stets gemeldet. WARUM MODELLED: Die Schwellen sind gewählt, nicht angepasst (Herkunft in der geometry_model jedes Laufs; die Zahlen aus IEC 61108-1 und GPS SPS wie zitiert, am Text der Normen zu prüfen), und es gibt keinen externen gelabelten Datensatz natürlicher Geometrieverschlechterung gegenüber Angriffen, gegen den die Klassifikation validiert werden könnte. Das abgeleitete DOP verwendet den Kern orbit::dop wieder, VALIDATED gegen gnss_lib_py, dessen Status diese Zeile nicht übernimmt. Eine Geometrieklasse ist eine Aussage über den Himmel, kein Befund, dass kein Angriff stattgefunden hat

# text
seg-540420863a5a = Broadcast-Ionosphärenmodell (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Ionosphärische Gruppenlaufzeit des Klobuchar-Modells auf Schrägstrecke für einfrequentes L1 aus den acht Broadcast-Koeffizienten α/β

# text
seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — unabhängige, aus dem Quelltext kompilierte Referenzimplementierung; auf < { "1e-4" } m übereinstimmend

# text
seg-0af6b1a073ce = Statistischer Kern der RAIM/ARAIM-Integrität (χ²- / nichtzentrale χ²- / Normalverteilungen)

# text
seg-224a6c4200cd = Der verteilungstheoretische Kern, auf dem jeder Schutzpegel beruht: die Fehlererkennungsschwelle des Schnappschusses χ²₁₋ₚfₐ(dof), die Nichtzentralität der Fehlentdeckung pbias=√λ und die Multiplikatoren K_fa/K_md/K_V der Lösungstrennung

# text
seg-03578217425f = SBAS-Schutzpegel (DO-229E gewichtetes LS-HPL/VPL)

# text
seg-df640d6c7a5d = Schutzpegel nach DO-229E Anhang J mit gewichteten kleinsten Quadraten: D=(GᵀWG)⁻¹ aus Elevation/Azimut je Satellit und Fehlerbudget, große Halbachse der horizontalen Fehlerellipse und vertikales σ, skaliert mit den veröffentlichten K-Faktoren

# text
seg-39aed7b4bffd = RTKLIB-SBAS-PL-Fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, „DO-229D Appendix J“), ausgeführt von rnx2rtkp -ws auf echten EGNOS-GEO-PRN120-Nachrichten + echtem BUTE/Budapest-RINEX; unabhängige Implementierung eines Dritten, HPL auf < { "2e-3" } m übereinstimmend. gLAB { "v6.0.0" } (core/filter.c) bestätigte identische Konvention. Beide unabhängigen Referenzen runden K_V→{ "5.33" } gegenüber dem exakten Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } von Kshana (~{ "0.06" }%), daher wird die Vertikale als K-Faktor-freies d_U geprüft

# text
seg-8f32eb9c8167 = Bewertungsmetriken für ML-Detektoren (ROC/AUC/Konfusion/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, Bindungen ½), Konfusionsmatrix an der Schwelle, P_d/P_md/P_fa/Precision/Accuracy/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — unabhängige Bibliothek, exakte Übereinstimmung

# text
seg-e7af87ce5e72 = Bewertung der Anomalieerkennung an echter Raumfahrzeug-Telemetrie

# text
seg-9659b33fca5b = ROC-AUC + Bootstrap-Konfidenzintervall, das echte gelabelte Anomalien trennt; transparenter Detektor (reproduziert die Labels)

# text
seg-b4ed67ce7e7e = scikit-learn roc_auc_score auf dem OPSSAT-AD-Testsplit (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — echte OPS-SAT-Telemetrie

# text
seg-5c3f1057c6cc = Numerische Kerne der Quantum-Abwägung (NNLS / χ²-Bänder / van-Loan-Q)

# text
seg-f82113ccb30b = NNLS-Anpassung der gemessenen ADEV, χ²-Konsistenzbänder für NEES/NIS und die diskrete Prozessrauschen-Kovarianz der Uhr nach van Loan (Holdover-Auslauf) — das Rechenrückgrat der Abwägungs-Engine

# text
seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exakt, χ² <{ "5e-4" } bei Betriebs-dof. Nur Kerne — Leistungszahlen der Geräte bleiben modelliert (nächste Zeile)

# text
seg-6f3099e7562c = Geomagnetisches Referenzfeld (IGRF-14-Synthese)

# text
seg-e9534723cb34 = Sphärisch-harmonische Synthese des IGRF-14-Hauptfeldes — Komponenten X/Y/Z/F, Deklination und Inklination — als Speisung der Alt-PNT-Schicht für magnetische Anomalien

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — die reine Python-IGRF-Referenzimplementierung der IAGA-VMOD, die die offiziellen IGRF14.shc-Koeffizienten mitliefert (14. Generation der IAGA, Zenodo 10.5281/zenodo.14012302); eine unabhängige Codebasis eines Dritten, die das eindeutig definierte IGRF-14-Feld berechnet, über ein globales Raster übereinstimmend

# text
seg-cb3fea409de7 = Detektionsstatistik — Gauß-AUC & minimal detektierbarer Fehler

# text
seg-ca677becb465 = Analytische binormale ROC-AUC = Φ(μ/(σ√{ "2" })) und der minimal detektierbare Fehler σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), auf dem die Quantenfehler- und Anomaliedetektoren beruhen

# text
seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), beide BSD-3-Clause — unabhängige Bibliotheken, die dieselben eindeutig definierten Größen aus Gauß-Rand / AUC berechnen, auf die A&S-erf-Untergrenze (~{ "7e-8" }) übereinstimmend. Der darauf aufbauende Vorteil Quanten gegen klassisch bleibt MODELLED

# text
seg-1ed12110fb74 = Kern der Rangordnungsstatistik (Kendall-τ / Dirichlet / Perzentil)

# text
seg-0fb003404a5b = Rangkorrelations- und Resampling-Kerne unter der Studie zur Entscheidungsinstabilität der Resilienz: Kendall τ-b, Dirichlet-Mittel, Wettkampf-Rangfolge und Perzentil-Konfidenzintervalle

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — unabhängige Implementierungen (Merge-Sort-τ) der eindeutig definierten Rangstatistiken, auf { "1e-12" } übereinstimmend. Die auf diesen Kernen aufbauende Studie zur Entscheidungsinstabilität bleibt MODELLED

# text
seg-fdd2ba203d5b = MCDA-Kern zur Ableitung von Prioritäten (AHP-Eigenvektor / Konsistenzverhältnis)

# text
seg-d01c155fbddf = Prioritätsgewichte des Analytic Hierarchy Process = normierter Haupteigenvektor (Perron) einer reziproken paarweisen Vergleichsmatrix durch Potenziteration, mit dem Konsistenzindex / Konsistenzverhältnis nach Saaty und der Akzeptanzschwelle CR<{ "0.10" }

# text
seg-d1947f2f2b3b = Kanonische Tabelle des Zufallsindex nach Saaty ({ "1980" }) (RI({ "5" })={ "1.12" }) exakt reproduziert + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) als unabhängiger Eigenlöser, der denselben eindeutig definierten Perron-Eigenvektor/Eigenwert berechnet, auf <{ "1e-9" } übereinstimmend. Die auf diesem Kern aufbauende Entscheidungsschicht aus Pareto / Sensitivität / MAUT bleibt MODELLED (die Aggregatoren WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE sind separat extern validiert — siehe die Zeilen unten)

# text
seg-73e933220afb = MCDA-Kerne zur gewichteten Aggregation (WSM / WPM)

# text
seg-c436cdc991a2 = Weighted Sum Model (min–max-normierte additive Aggregation + Rangfolge) und Weighted Product Model (summennormierte, für Kosten reziproke multiplikative Aggregation) — die beiden Bewerter für Wertaggregation in Abwägungsstudien

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — eine unabhängige, weit verbreitete Python-MCDA-Bibliothek eines Dritten, die dieselben eindeutig definierten gewichteten Aggregate berechnet; auf <{ "1e-9" } übereinstimmend. Offline regenerierbar über tests/fixtures/mcda_wsm/ und tests/fixtures/mcda_wpm/. Garbage in, garbage out bei den Eingaben; die Sensitivitäts-/Robustheitsschicht bleibt MODELLED

# text
seg-f00bdb66a052 = MCDA-Rangfolge nach Abstand zum Ideal (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — Min–Max-Normierung, gewichtete positive/negative Idealösungen, relative Nähe Cᵢ = d⁻/(d⁺+d⁻) und Rangfolge

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — eine unabhängige MCDA-Bibliothek eines Dritten, die dieselben eindeutig definierten Nähekoeffizienten berechnet; auf <{ "1e-9" } übereinstimmend. Offline regenerierbar über tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = MCDA-Kompromissrangfolge (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija — Gruppennutzen Sᵢ, individuelles Bedauern Rᵢ und der Kompromissindex Qᵢ bei Strategiegewicht v={ "0.5" }, mit der Rangfolge, in der kleiner besser ist

# text
seg-69fbe488dec5 = Fisher-Information & Cramér–Rao-Beobachtbarkeit

# text
seg-043d4c7a2d6a = Fisher-Information M=HᵀWH, Cramér–Rao-Untergrenze, Beobachtbarkeitsrang / Nullraum des Datumsdefekts (Moore–Penrose-Pseudoinverse) sowie D/A/E/T-optimale Skalare der Versuchsplanung aus einem symmetrischen Jacobi-Eigenwertlöser

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-gestützt) — eine unabhängige Drittautorität, die dieselben eindeutig definierten Eigenwerte, die σ²(XᵀX)⁻¹-Cramér–Rao-Kovarianz und die GNSS-Dilution-of-Precision-Faktoren mit einem anderen Algorithmus (LAPACK-Divide-and-Conquer + LU) berechnet als Kshanas zyklischer Jacobi-Durchlauf und die spektrale Pseudoinverse; abgeglichen auf { "1e-9" }. Dieselbe Klasse externer Bibliotheken validiert bereits die DOP-Engine (gegen gnss_lib_py) und die χ²/erf-Kerne (gegen SciPy). Zusätzlich gegengeprüft mit den geschlossenen CRLB-Formeln nach Kay ({ "1993" }) und der Erreichung der CRLB in Monte-Carlo-Läufen (intern)

# text
seg-e4ec41d0f5e1 = Absolute Beobachtbarkeit der Mondstationen (Datumsdefekt)

# text
seg-b3e4160042d2 = Fisher-Information-Beobachtbarkeit der gemeinsamen Mondlösung: Ohne Erdbasislinien liegt das Datum des absoluten Bezugssystems im Nullraum von HᵀWH (Stationsposition nicht beobachtbar); ≥{ "3" } Basislinien stellen den vollen Rang wieder her und begrenzen den Cramér–Rao-Fehler der Station, den der Schätzer erreicht

# text
seg-ae4b71d54dfa = 7-Parameter-Helmert-Datumsanpassung + ICRF-Orientierungsanbindung aus einem Netz von Punkten

# text
seg-9e434924b34c = Unabhängiger geschlossener, gewichteter Umeyama-(Horn-)Ähnlichkeitstransformations-Löser (numpy/scipy, SVD-basiert; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — ein anderer Algorithmus als Kshanas iterative Gauß–Newton-Anpassung, der auf byte-identischen Punktnetzen dasselbe eindeutig definierte gewichtete Kleinste-Quadrate-Optimum erreicht

# text
seg-4bcec6e2dd9f = Navigationsdienstvolumen am Mond

# text
seg-dba98ad5df1c = DOP / Abdeckung / Verfügbarkeit der Moonlight-Klasse am Mond + verallgemeinerte ARAIM-Schutzniveaus am Mond über ein Dienstvolumen

# text
seg-7e981d90a806 = Unabhängige Drittautorität ANISE { "0.10.2" } astro::Orbit Kepler-Propagator (Nyx Space, MPL-2.0) — ein äquinoktialer Zweikörper-Codepfad, verschieden von Kshanas Newton-Raphson-Kepler; die MCI-Position je Satellit stimmt auf <{ "1e-3" } m überein, und Anzahl und Menge der abgeleiteten sichtbaren Satelliten stimmen an jedem Gitterpunkt exakt überein. Der DOP-Kern ist gegen gnss_lib_py validiert; die Integrität verwendet veröffentlichte LunaNet/LCNS-Parameter

# text
seg-2ed7181c97dd = Erzeugung der LunaNet-AFS-Spreizcodes (LSIS V1.0)

# text
seg-13ff6c381275 = Die Augmented-Forward-Signal-Codes von LSIS V1.0 ({ "29" }. Januar { "2025" }): der AFS-Q-Primärcode mit 10230 Chips, erzeugt aus der IS-GPS-800-L1C-Pilotkonstruktion mit den IS-GPS-800J-Indizes (dieselben { "210" } Zuweisungen, die LSIS Anhang D druckt), die AFS-I-Gold-Codes mit 2046 Chips, erzeugt aus g1 = x^{ "11" } + x^{ "2" } + { "1" } und g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, wobei die G2-Verzögerung jeder PRN aus der Annex-{ "3" }-Datei des Standards gewonnen wird, die vier Sekundärcodes, die Tertiärcodes mit 1500 Chips, die vorläufige Knotenzuweisung nach Tabelle { "11" } und der gestufte Pilotcode. LSIS-Inhalte werden zur Laufzeit aus einem SHA-256-geprüften lokalen Cache gelesen, der aus dem von der NASA bereitgestellten PDF befüllt wird, und nie weiterverbreitet

# text
seg-dc1dd144b107 = Referenz: die Werte, die LSIS V1.0 zur Validierung druckt (Tabellen C-1 bis C-5, D-1 bis D-6, E-1 bis E-6), und seine elektronischen Codedateien aus Annex { "3" }, unter einem vor dem Vergleich festgelegten Kriterium von null Abweichungen. Das Kriterium wird durch eine gedruckte Zelle verfehlt, die mit der Annex-{ "3" }-Datei des Standards selbst intern inkonsistent ist, daher bleibt die Zeile MODELLED; ein Erratum-Hinweis ist entworfen. Dieselben Chips entsprechen auch denen von LANS-AFS-SIM (Zeile 'LunaNet-AFS-Basisbanderzeugung gegen einen unabhängigen Generator, bei gegebenem Kanalzustand')

# text
seg-ea20909686ea = LunaNet-AFS-Basisbanderzeugung gegen einen unabhängigen Generator, bei gegebenem Kanalzustand (LSIS V1.0)

# text
seg-c0f021c38842 = Der Erzeugungskern des AFS-Basisbands (LSIS-130: komplexe Hüllkurve I + jQ, I = der AFS-I-Gold-Code mal der Rahmen mit { "500" } Symbolen/s bei { "1.023" } Mchip/s, Q = der gestufte AFS-Q-Pilot bei { "5.115" } Mchip/s, Trägerrotation, Chip- und Symbolausrichtung) reproduziert die Abtastwerte eines unabhängigen Generators, wenn er mit dessen eigenem aufgezeichneten Kanalzustand angesteuert wird (Codephasen und -raten, Trägerphase und -frequenz, Amplitude je Kanal). Nicht abgedeckt: das Knotenmodell, das diesen Zustand aus Doppler, Verzögerung und Träger-zu-Rauschleistungsdichte ableitet, die aus der Träger-zu-Rauschleistungsdichte berechnete 50/50-Leistungsaufteilung (die Amplituden werden aus dem Simulator übernommen) sowie die SigMF-Metadaten und das Schreiben der 8-Bit-Abtastwerte

# text
seg-dd1142957a05 = Bibliothek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, Commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-Band-Build, als eigenständiges Programm ausgeführt); Kshanas Abtastwerte werden allein vom aufgezeichneten Kanalzustand des Simulators angesteuert, und ein Build mit reiner Ablaufprotokollierung wird als byte-identisch zum nicht gepatchten geprüft. Vor dem Lauf festgelegte Zielwerte: null Chip- und Symbolabweichungen, |rho| >= { "0.999" } über den Lauf und >= { "0.99" } je Block von { "2" } ms, Phase innerhalb von { "0.05" } rad. Gleiche I- und Q-Amplituden sind eine Eingabe des Vergleichs, daher wird die Leistungsaufteilung dadurch nicht getestet. LANS-AFS-SIM liest seine Tertiärcodes aus der LSIS-Annex-{ "3" }-Datei, daher ist dieser Teil nicht unabhängig von der Codezeile. LANS-AFS-SIM und PocketSDR-AFS haben denselben Autor und zählen als eine unabhängige Implementierung. Datenabhängig: Der LANS-AFS-SIM-Vergleich benötigt den lokalen LSIS-V1.0-Cache (xval/lunar-afs/fetch_lsis.sh, SHA-256-geprüft) und wird ohne ihn mit einem Hinweis übersprungen

# text
seg-5d79da539912 = LunaNet-AFS-Rahmenkanalcodierung, FID { "0" } (LSIS V1.0)

# text
seg-6ed2b4c792e6 = Der { "12" } s lange FID-{ "0" }-Rahmen von LSIS V1.0 mit 6000 Symbolen: 68-Symbol-Synchronisationsmuster, BCH-({ "51" }, { "8" })-Unterrahmen { "1" } (Generator oktal 763), CRC-24 (({ "1" } + X)·P(X)) auf den Unterrahmen 2-4, LDPC-Codierung mit Rate 1/2 mit den gedruckten A, B^-1, C, D (LSIS Annex { "1" }, zur Laufzeit aus dem SHA-256-geprüften lokalen Cache gelesen) und der Punktierung des Standards, Blockverschachtelung { "60" } x { "98" }; ein erschöpfender Dekodierer für Unterrahmen 1, der ein TOI außerhalb von { "0" }..99 meldet, und ein normalisierter Min-Sum-LDPC-Dekodierer, der allein aus H = [[A, B, { "0" }], [C, D, I]] geschrieben wurde

# text
seg-46879e2e8ab5 = Bibliothek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, Commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), dessen eigene BCH-, CRC-, LDPC- und Verschachtelungsfunktionen bei gleichem Inhalt Rahmen erzeugen, die symbolgleich mit denen von Kshana sind (null Abweichungen, Zielwert vor dem Lauf festgelegt). Bestätigt durch Referenzwerte: das BCH-Beispiel aus Abbildung { "8" } von LSIS V1.0 und der CRC-24/LTE-A-Prüfwert (Greg Cooks Katalog parametrisierter CRC-Algorithmen), beide bitgenau; sowie durch PocketSDR-AFS, das in drei Läufen jeden Unterrahmen der synchronisierten Rahmen mit bestandenem CRC und übereinstimmenden Bits von Unterrahmen 2 dekodiert. Der Paritätsprüftest ist nahezu eine interne Identität (er bestätigt, dass das gedruckte B^-1 das gedruckte B invertiert) und zählt nicht als unabhängige Referenz. Datenabhängig: Der LANS-AFS-SIM-Vergleich benötigt den lokalen LSIS-V1.0-Cache (xval/lunar-afs/fetch_lsis.sh, SHA-256-geprüft) und wird ohne ihn mit einem Hinweis übersprungen

# text
seg-56c7aeac59c1 = Dekodierbarkeit von LunaNet AFS im geschlossenen Regelkreis durch einen unabhängigen Empfänger (LSIS V1.0)

# text
seg-da2d29d437b0 = Eine Kshana-AFS-Aufzeichnung, die von einem unabhängigen Software-Empfänger erfasst, verfolgt und dekodiert und mit den eigenen Wahrheits-Labels der Aufzeichnung verglichen wird. Dies belegt nur die Übereinstimmung mit dem Standard und die Konsistenz der Labels; es ist keine Aussage über Kanalphysik, Ausbreitung, Empfangsleistung oder Link-Budgets, deren Werte in der Aufzeichnung gewählte Eingaben sind

# text
seg-8211583afc64 = Bibliothek: PocketSDR-AFS (T. Ebinuma nach T. Takasus PocketSDR { "0.13" }, BSD-2-Clause, Commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-Band-Build, Kopie mit reiner Protokollstufe), unter vor jedem Lauf festgelegten Kriterien. Der dritte vorab registrierte Vergleich erfüllt seine Dekodierungs- und Verfolgungs-Zielwerte C1 und C2 vollständig, nicht aber seine Schutzbedingung G0 wie geschrieben (zwei Läufe des unveränderten Empfängers unterscheiden sich in denselben vier Erfassungsdatensätzen), und der zweite verfehlte sie um { "5" } Verletzungen, daher bleibt die Zeile MODELLED. LANS-AFS-SIM und PocketSDR-AFS haben denselben Autor und zählen als eine unabhängige Implementierung; die Prüfungen der gedruckten Vektoren in der Zeile zur Rahmencodierung sichern gegen eine gemeinsame Fehllesung ab

# text
seg-780369fb9a54 = Übereinstimmung von GPS L1 C/A zwischen Generatoren

# text
seg-ee47b60515f1 = GPS-L1-C/A-Spreizcodes (sdr::CaCode) und LNAV-Unterrahmen 1-3 (gps_lnav: IS-GPS-200-Feldquantisierung mit dem Pi der Spezifikation, Zweierkomplement-Packung, TLM- und HOW-Wörter, Parität nach Tabelle 20-XIV mit D29*/D30*-Inversion, die paritätslösenden Bits der Wörter { "2" } und { "10" }), bitweise verglichen mit gps-sdr-sim auf dessen mitgelieferter brdc0010.22n ({ "32" } Satelliten)

# text
seg-325900ed59ea = Signalgeometrie der GNSS-IQ-Szene gegen einen unabhängigen Basisbandgenerator

# text
seg-ee5625b30ff2 = Die Wahrheitswerte je Satellit des IQ-Szenengenerators für eine GPS-L1-C/A-Szene mit Broadcast-Ephemeride (iq::scene: eine SatGeometry mit Broadcast-Ephemeride, erzeugt in TruthRecord-Wahrheitsdatensätze): welche Satelliten über dem Horizont stehen, die Pseudostrecke, die Codephase am ersten Abtastwert, der Träger-Doppler und die Blickwinkel, für einen ortsfesten Empfänger, verglichen mit dem Kanalzustand, aus dem gps-sdr-sim den ersten Block seiner eigenen I/Q-Ausgabe aufbaut, für dieselbe Ephemeride, denselben Empfänger und dieselbe Startzeit (Ionosphäre auf beiden Seiten aus)

# text
seg-bf429c8f00fb = GNSS-IQ-Erfassung an unabhängig erzeugten I/Q-Abtastwerten

# text
seg-9a0c52bfb06e = iq::acq::acquire (parallele FFT-Codephasensuche mit der Quadratgesetz-Marcum-Q-Schwelle) mit der GpsL1Ca-Replik, auf { "20" } ms der eigenen 8-Bit-I/Q-Ausgabe von gps-sdr-sim, dekodiert vom Abtastwert-Dekodierer iq::io (ci8, { "2.6" } MHz, { "11" } Satelliten, ohne Rauschen): jede PRN { "1" } bis { "32" } in zwei Fenstern von { "10" } ms durchsucht, das Ergebnis verglichen mit der Codephase und dem Doppler, die gps-sdr-sim aufmoduliert hat

# text
seg-f40dc3dac990 = In Laborwiedergabe-Kampagnen bewertete IQ-Monitore: Erkennung, Fehlerkennungen, Fehlalarme und geschlossene Fehlalarmkennzahlen

# text
seg-93fb3109728c = iq::campaign::detect und der Kampagnenläufer: Eine optionale Tabelle [monitors] lässt die IQ-Monitore in jeder Zelle im einzigen Durchlauf des Läufers laufen. Die Leistungs- und Spektralmonitore sehen die Abtastwerte nach jeder Front-End-Kette; die C/N0-, SQM- und Lock-Monitore sehen die Schleifenaktualisierungen jedes verfolgten Kanals. Jeder Alarm wird gegen die angegebenen Ereignisse bewertet: erkannt oder verpasst je (Ereignis, Alarmart, Kanal), Zeit bis zur Erkennung und Fehlalarme außerhalb der Ereignisse bezogen auf deren Expositionszeit. Die geschlossene Fehlalarmkennzahl jedes Tests wird angegeben: Leistung je Block (exakter Gamma-Schwanz), spektraler Überschuss je Block (Näherung), Kurtosis (einseitig Gauß), Pulse (binomiale Obergrenze), SQM je gemittelter Aktualisierung (2Q(k) = Q(1/2, k^2/2), neu) und die ARL0 des C/N0-CUSUM (Siegmund). Ohne die Tabelle bleiben Zellen, Schlüssel und Digests unverändert. Es wird keine Störungswellenform synthetisiert

# text
seg-5b7eb7ddb474 = Erkennungs-ROC der IQ-Monitore aus einer bewerteten Laborwiedergabe-Kampagne

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) und iq::campaign::report::rocs: Jede Zelle einer Kampagne mit Monitoren hält je Alarmart und Kanal das Maximum der eigenen Teststatistik des Monitors über jedes angegebene Ereignisfenster (positiv) und über aneinandergereihte roc_window_s-Fenster außerhalb der Ereignisse (negativ). Die Statistiken sind die Abweichung der Blockleistung, der PSD-Überschuss, die Kurtosis z, das SQM |z| der gemittelten Metrik und der C/N0-CUSUM. Der Bericht fasst sie nach Art zu einer empirischen ROC auf Fensterebene mit ihrer AUC und dem Arbeitspunkt an der konfigurierten Schwelle zusammen, geschrieben als roc.json (kshana.campaign-roc/1) und als Abschnitt Detection ROC von report.html. Eine Kampagne ohne Monitore schreibt keines von beiden

# text
seg-3a3cfa322f01 = Kalibrierung der C/N0- und Lock-Modelle des offenen Empfängers auf IQ-Kampagnenergebnisse, mit angegebenem Vorhersagefehler

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) und <c1/> auf <c2/>, Python <c3/> und das MCP-Werkzeug labfit (Kampagnenordner nur innerhalb seines Arbeitsverzeichnisses): liest einen Ausgabeordner von <c4/> anhand seines DIGEST und gruppiert die bewerteten Zellen zu Anpassungseinheiten (Signal x Schleifenentwurf x Front-End-Kette x Störsendertyp, nie zusammengefasst). Je Einheit passt es das gemessene C/N0 an das angegebene J/S mit der Form der spektralen Trennung an. Q_eff ist aus C/N0-Daten ohne unabhängige Messung der Störer- und Signalleistungen nicht identifizierbar, daher wird Q angegeben, nie angepasst (die Typtabelle, das q des Ereignisses oder bei unbekanntem Typ der schädlichste angegebene Wert, cw Q = { "1" }). Der angepasste Parameter ist der identifizierbare Offset delta_eff = delta - { "10" } log10 Q, wobei die Korrelationsschranke die Entartung meldet. C/N0-Klassen mit weniger als { "90" } % Lock sind zensiert und aufgelistet. Das Schwellen-J/S wird direkt und über die geschlossene Form angegeben; das Verfolgungsschleifenmodell und das empirische Lock-Modell sind über das C/N0-Modell gekoppelt, mit Abfall- und Wiederverriegelungs-Verweilzeiten. Ein mit Seed versehener Cluster-Bootstrap über Aufzeichnungen ({ "1000" } Replikate) liefert Perzentilintervalle; { "90" }-%-Vorhersageintervalle stammen aus Residuenziehungen; Leave-one-recording-out-Zurückhaltungen werden in Interpolation und Extrapolation aufgeteilt; eine vorab registrierte Tabelle [validation] wird gehasht und jeder Zielwert mit PASS/FAIL beurteilt. Bericht kshana.labfit-iq/1 als JSON, CSV und erzeugtes Markdown, mit einem Einheitenblock. Nur synthetisch (keine Aufzeichnung Dritter, keine Störsenderwellenform). Der Labfit-Pfad des Empfängerprotokolls bleibt unverändert

# text
seg-9537d301c95e = GPS-LNAV-Kodierung, dekodiert von einer unabhängigen Empfängerbibliothek

# text
seg-909415621881 = Kshanas LNAV-Unterrahmen 1-3 (gps_lnav::encode_subframes) für die { "32" } Ephemeriden aus brdc0010.22n, an decode_word und decode_frame von RTKLIB übergeben: Parität jedes Wortes, Unterrahmendekodierung mit konsistentem Datenstand (Issue of Data) und jeder dekodierte Parameter gegen Kshanas Ganzzahl und gegen den Eingabewert

# text
seg-f66855e35c53 = GPS-LNAV-Navigationsnachrichtenkodierung

# text
seg-8caf8366e2f8 = IS-GPS-200-LNAV-Unterrahmen 1-3 (gps_lnav::encode_subframes: Quantisierung jedes Uhren- und Bahnparameters auf den nächsten Wert bei den Skalierungsfaktoren und dem Pi-Wert der Spezifikation, Zweierkomplement-Packung, TLM- und HOW-Wörter, Parität nach Tabelle 20-XIV mit D29*/D30*-Inversion, die paritätslösenden Bits der Wörter { "2" } und { "10" }), die Nachricht, die ein GPS-L1-C/A-Signalgenerator sendet

# text
seg-c5c944357643 = Erfassung und C/N0-Schätzung an realem Mond-IQ

# text
seg-f5dcb5e06bf4 = Parallele Codephasensuche (acquisition::pcps_acquire: portable FFT, kohärente Faltung, nichtkohärente Akkumulation, Chi-Quadrat-Schwelle für eine suchweite Fehlalarmwahrscheinlichkeit), Verfeinerung, Open-Loop-Prompt-Korrelation mit Code-Doppler und der M2M4-C/N0-Schätzer, ausgeführt auf den 4-Bit-IQ-Batches von LuGRE L1, gelesen über realdata::ion_sdr

# text
seg-709626569a5c = Erfassung an realem Mond-IQ gegen den aus der Bahn vorhergesagten Doppler (Entscheidung über die Abtastleistung)

# text
seg-784ebd80c425 = acquisition::pcps_acquire mit seiner Entscheidung über die Abtastleistung auf den neun L1-Batches von LuGRE ohne Oberflächenaufnahme mit Mid-Rise-Pegeln; Doppler-Differenzen zwischen erfassten Satelliten verglichen mit Differenzen, die aus ESA-Endbahnen und der von Firefly rekonstruierten Trajektorie von Blue Ghost vorhergesagt wurden

# text
seg-89875d67b253 = Erfassung an realem Mond-IQ, bewertet am aus der Bahn vorhergesagten Doppler

# text
seg-956bcfeaf319 = acquisition::pcps_acquire mit der Cell-Averaging-Entscheidung (Spitze über der mittleren Zelle des Gitters, robust gegen bandbegrenztes Rauschen) auf den neun L1-Batches von LuGRE ohne Oberflächenaufnahme mit Mid-Rise-Pegeln; Doppler-Differenzen zwischen erfassten Satelliten verglichen mit Differenzen, die aus ESA-Endbahnen und der von Firefly rekonstruierten Trajektorie von Blue Ghost vorhergesagt wurden

# text
seg-8fa779dd1788 = Erfassung an zurückgehaltenem realem Mond-IQ gegen den aus der Bahn vorhergesagten Doppler

# text
seg-484868771231 = acquisition::pcps_acquire (Cell-Averaging-Entscheidung, Fehlalarmwahrscheinlichkeit { "1e-7" }) mit refine_doppler_coherent auf den LuGRE-L1-Batches, die auf der Mondoberfläche aufgezeichnet wurden (I im hohen Nibble, Mid-Rise-Pegel); Doppler-Differenzen zwischen erfassten Satelliten gegenüber Differenzen, die aus ESA-Endbahnen und dem Landeplatz-Kernel von Firefly vorhergesagt wurden

# text
seg-758af035b3ce = Gemeinsame Kommunikations- und Navigationsgeometrie am Mond

# text
seg-11f861bdc6bf = Topozentrische Blickwinkel je Satellit (Azimut im Uhrzeigersinn von Norden, Elevation) und Schrägentfernung an einem benannten selenographischen Standort, gegeben der Satellit im mondfesten Bezugssystem des Standorts (die validierte Aussage). Die Entfernungsmessgenauigkeit des Signals im Raum ist als Szenarioparameter freigegeben, sodass der Dienstvolumen-Durchlauf eine Entfernungsmess-ANFORDERUNG liefert statt eines Bestanden/Nicht-bestanden bei einem festen Sigma; dieser Parameter ist eine Entwurfseingabe außerhalb der validierten Aussage

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, als Werkzeug aus xval/anise-service-geometry ausgeführt, Binärdatei lunar-look-angles-xval, die keinen Kshana-Code aufruft): die eigene Routine von ANISE für Azimut, Elevation und Entfernung (azimuth_elevation_range_sez) aus Standorten, die mit seinem Konstruktor für Breite, Länge und Höhe auf dem Mond pck00011 (Kugel { "1737.4" } km) aufgebaut wurden, wobei die Satelliten über moon_pa_de440_200625.bpc in MOON_PA_DE440 gedreht werden. { "768" } Abtastwerte über { "8" } Standorte (die { "4" } benannten Standorte und { "4" } weitere, über und unter dem Horizont), { "12" } Epochen und { "8" } Satelliten stimmen innerhalb von { "1e-6" } Grad in Azimut und Elevation sowie { "1" } mm in Entfernung und Standortposition überein (vor dem Vergleich festgelegt); gemessen { "2.2e-12" } Grad, { "2.1e-13" } Grad und { "5.6e-9" } m. Aussage: Standortplatzierung und Blickwinkel, gegeben der Satellit im körperfesten Bezugssystem des Standorts. Kshanas eigene Realisierung des mondfesten Bezugssystems mit mittlerer Rotation und der Parameter der Entfernungsmessgenauigkeit liegen außerhalb davon; die Unit-Tests der geschlossenen Geometrie bleiben als stützende Prüfungen bestehen

# text
seg-10af60b488b9 = Differenzielle Referenzstation der NovaMoon-Klasse: Aufhebung des Gleichtakts + mit der Basislinie wachsendes Residuum + DGNSS-Schutzniveaus

# text
seg-96b2627b388a = Identität der differenziellen Fehleraufhebung + Wiederverwendung der DO-229E-SBAS-PL-Maschinerie; die Einzeldifferenz mit WLS-Lösung wird zusätzlich gegen lsq()/matinv() von RTKLIB (Takasu, BSD-2-Clause, kompiliertes C) gegengeprüft — unabhängiger Lösercode, aber dieselbe LOS-Differenz-Algebra erster Ordnung, daher weiterhin InternalConsistency

# text
seg-c04a3591074c = Interoperabilitätsexport für den Mond

# text
seg-91f4a066b3c0 = An LunaNet/IOAG ausgerichteter Export von Mond-Bezugssystem + Zeit + Ephemeride (CCSDS OEM + KIF) mit Round-Trip-Übereinstimmung

# text
# c1: oem
seg-f5f8ed69bea7 = Kshanas Mond-OEM-Export, erneut geparst von der unabhängigen Drittbibliothek <c1/> (R. J. Anderson): Bezugssystem-/Zeit-Token und Zustand je Epoche stimmen auf Schreibgenauigkeit überein ({ "1" } mm / { "1e-9" } km/s), und ein Export ohne TIME_SYSTEM wird abgelehnt — ein struktureller Austausch-Round-Trip; die physikalische Semantik von Mond-Bezugssystem und Zeit wird von deren eigenen Zeilen validiert, daher bleibt dies MODELLED. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): Ein zweiter unabhängiger Leser, der CCSDS-OEM-Parser von Orekit { "12.2" } (Apache-2.0, strenge Standardeinstellungen), lehnt beide Mond-Dateien ab, weil er die Zeitsysteme LTC und TCL nicht implementiert (er dekodiert das EME2000/UTC-OEM der Crate und dekodiert die Mond-Dateien, sobald TIME_SYSTEM durch TDB ersetzt wird); oem { "0.4.5" } dekodiert sie nur dadurch innerhalb der geschriebenen Genauigkeit, dass es vom nicht unterstützten Zeitsystem ausweicht. Der Austausch dieser Mond-Dateien mit gängigen CCSDS-Lesern ist nicht belegt

# text
seg-8ab65cbefb75 = An Rahmenwerken ausgerichtete Bewertung der PNT-Resilienz

# text
seg-c48198f31d63 = Teilbewertungen je Dimension über Kshanas eigene sieben Resilienzkategorien (nicht DHS-Begriffe), die RDRR-Funktionen von RethinkPNT und die Yang-Kriterien, jeweils mit ihrem Treiber als modelliert gekennzeichnet; vorläufige RPCF-Stufe mit einer Schranke für begrenzte Degradation. Aus der Simulation abgeleitete Selbsteinschätzung, nie eine Zertifizierung.

# text
seg-f905aeb203bb = Von Hand hergeleitete Formeln je Metrik: inverse Simpson-Diversität, gewichteter Mittelwert als Gesamtwert, begrenzte/unbegrenzte Zeitachsendauern, Stufenleiter nach dem schwächsten Glied

# text
seg-d7bdb6fe186e = Studie zur Entscheidungsinstabilität der Resilienzbewertung

# text
seg-5fcf18a68bb1 = Quantifiziert, wie ein einzelner Gesamtwert / eine RPCF-Stufe Architekturen unter einem vertretbaren Gewichtungs-Simplex und einem Bedrohungsensemble umordnet (Top-1-Wechselrate, Kendall-Tau-Streuung, Stufenwechselrate, Rangbereiche); Analysen von deklariert gegenüber gemessen und von Diversitätskollaps.

# text
seg-b6bf76a752a0 = Identitäten geschlossener Rangstatistik (Tau in [-1,{ "1" }] mit handberechneten Werten; deterministisches Dirichlet mit Seed) und konstruierte stabile/instabile Zeugen

# text
seg-1bf03544a010 = Repräsentativität der Demonstration & Lücken bis zum Flug

# text
seg-db24d16d38c9 = Ehrlichkeitsregister je Ergebnis, das eine Demonstrationsausgabe qualifiziert: ihre externen Anker, modellierten Annahmen, Lücken bis zum Flug und das repräsentative TRL-Band, mit durchgesetzten Invarianten (Validiert verlangt einen externen Anker; Modelliert verlangt eine Lücke und kann nicht über TRL { "4" } hinaus beanspruchen).

# text
seg-81d3adb239c5 = Geschlossene Invarianten, die auf die compliance-Disziplin 'Repräsentativität begründet + Lücken bis zum Flug identifiziert' abbilden; an die Grenze zwischen Verifikationsstatus und Art der unabhängigen Referenz gebunden

# text
seg-52ab936eb5f5 = Nachweise zum Quanten-gegen-klassisch-Abwägen (gemeinsame Form)

# text
seg-a6679ed5bed7 = Ein reproduzierbares TradeEvidence-Objekt (fester Rahmen: Szenario+Seed+Engine; gemeinsame Quanten-gegen-klassisch-Werte je Gütekennzahl mit vorzeichenrichtigem Vorteil, optional { "95" }-%-KI, Label validiert/modelliert), das einen Repräsentativitätsnachweis trägt, sodass jede Quanten-PNT-Vertikale die Abwägung auf dieselbe ehrliche Weise meldet.

# text
seg-70da3e15ea8b = Geschlossene Identitäten für Vorteil/Gewinner + getreue Hülle um das bestehende quantum_trade::TradeResult; Ehrlichkeit an das Repräsentativitätsregister und die Verifikationslabels gebunden

# text
seg-20fee61b3107 = Bibliothek von Fehlermodellen für Quantengeräte

# text
seg-e42eabe9bc2a = Gerätekarten (optisch/gefangenes Ion/Quecksilberion + klassische Uhren, wiederverwendet aus holdover/clock_state; Kaltatom-Interferometer; klassische + Verschränkungs-/Einzelphotonen-Zeitübertragungsstrecken), jeweils mit einem Repräsentativitätsnachweis; die Verschränkungsstrecke fügt ein schrotrauschbegrenztes Zeitgenauigkeitsmodell hinzu (~Jitter/sqrt(R*tau), Dunkelzählstrafe, systematische Untergrenze).

# text
seg-632600203e1f = Wiederverwendete Uhren-/CAI-Koeffizienten (holdover/clock_state, veröffentlichte Werte) + geschlossene Identitäten für Schrotrauschen/Verlust der Verschränkungsstrecke

# text
seg-86d71fd89f26 = Vertrauenswürdige Quantenzeitgebung (Zeitübertragung + sichere Verbreitung + Anomalie)

# text
seg-d2a3d37825ef = Durchgängige Zeitübertragungskette Quanten gegen klassisch (Uhren-Auslauf + Streckengenauigkeit quadratisch addiert), ein wiederverwendetes Zeitgebungs-Schutzniveau, eine Sicherheitskennzahl gegen Verzögerungs-/Wiedereinspielungsangriffe (1-P_md) sowie eine Erkennungswahrscheinlichkeit von Uhrenanomalien + CUSUM-Latenz, ausgegeben als ehrliches TradeEvidence mit einem Repräsentativitätsnachweis.

# text
seg-ac95d112a17a = Geschlossenes quadratisches Budget über wiederverwendete validierte Kerne (ADEV gegen Stable32/NIST; TPL-Schranke; Erkennung analytic_pd/pmd); Ehrlichkeit an das Repräsentativitätsregister gebunden

# text
seg-eaf341ff4522 = GNSS-freie Quantennavigation

# text
seg-908a44a9f7c7 = Quanten- (Kaltatom-Interferometer) gegenüber klassischer Koppelnavigation mit Navigationsklasse-INS während eines GNSS-Ausfalls: Wachstum des Positionsfehlers, Holdover bis zu einer Positionsschwelle und die Abwägung Quanten gegen klassisch als ehrliches TradeEvidence; ehrlicher Hinweis zur Beobachtbarkeit (Bias ohne Fix nicht beobachtbar, daher wächst der Fehler).

# text
seg-508f2c8884e2 = Wiederverwendete Inertialbudgets, gegengeprüft gegen eine unabhängige Octave-Doppelintegration derselben Koppelnavigations-ODE (andere Laufzeit, gemeinsames Modell → ReferenceImpl) plus das veröffentlichte Kurzzeitrauschen von Freier-2016 als einseitiger Anker; der Verbund Quanten gegen klassisch bleibt MODELLED

# text
seg-914132833f5a = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme

# text
seg-f20392820b9d = Beschrifteter Katalog von Quantenfehlern (Uhr Frequenzsprung/Drift/Lock-Verlust; Sensor Bias-Sprung/Aussetzer), eine Erkennungsstatistik als ROC-AUC mit Bootstrap-KI und ein minimal erkennbarer Fehler bei fester Fehlalarmrate; ein quantenuhrgestützter Monitor erkennt kleinere Fehler als ein klassischer, ausgegeben als ehrliches TradeEvidence.

# text
seg-a689ab2ebb84 = Geschlossene Gauß-AUC = Phi(mu/(sigma*sqrt2)), gegengeprüft gegen das extern validierte eval_stats::bootstrap_auc_ci (gegen scikit-learn) + analytische Erkennungsschwellen

# text
seg-0633e05d393f = Drehmomentfreie Lagedynamik des starren Körpers

# text
seg-23f43007bcbf = Eulersche Kreiselgleichungen (I ω̇ = τ − ω × Iω, Hauptachsen- und allgemeiner Trägheitstensor), gekoppelt an die Quaternionen-Lagekinematik (q̇ = ½ q ⊗ ω) und propagiert mit einem RK4-Integrator fester Schrittweite, der das Quaternion in jedem Schritt neu normiert

# text
seg-2d21a01ea132 = Basilisk { "2.9.1" } Propagation des starren Körpers am Raumfahrzeug-Hub (AVSLab, ISC; MRP-Lage über seine eigenen gekoppelten Hub-Gleichungen, svIntegratorRKF78 bei relativer Toleranz { "1e-12" }), eine unabhängige Implementierung der drehmomentfreien Gleichungen des starren Körpers: Kshanas RK4-Quaternion (dt { "0.01" } s) und die Körperraten stimmen innerhalb von { "1e-9" } über { "1e4" } s an zwei allgemeinen nichtdiagonalen Trägheiten überein (schlechtester Wert { "3.3e-11" } und { "3.4e-12" } rad/s); Toleranz vor dem Vergleich festgelegt. Validierte Aussage: drehmomentfreie Bewegung; der Term des äußeren Drehmoments wird nicht verglichen. Die Erhaltungssatz- und Symmetrischer-Kreisel-Prüfungen bleiben als stützende Selbstkonsistenz bestehen. Keine Umgebung mit flexiblem Körper / Regelkreis / äußerem Drehmoment

# text
seg-93b8ba1ba0e5 = Relativbewegungsdynamik nach Clohessy–Wiltshire / Hill

# text
seg-17f27a95d009 = Relativbewegung eines Verfolgers um ein Ziel auf einer kreisförmigen Referenzbahn im LVLH-System: die linearisierten Clohessy–Wiltshire-Gleichungen (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }), gelöst durch die geschlossene { "6" }×{ "6" }-Zustandsübergangsmatrix Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) mit der Bedingung für eine beschränkte Relativbahn ẏ₀=−2n·x₀ und einer geschlossenen Korrektur zweiter Ordnung (cw_dynamics::second_order_correction, die CW-Antwort auf die quadratischen Terme der exakten Gleichungen für einen kreisförmigen Chief; Karlgaard und Lutze { "2003" }, Newman, Lovell und Pratt { "2015" }), zusammengesetzt als cw_dynamics::propagate_second_order. Die validierte Ausgabe ist propagate_second_order; das lineare Φ allein wird gegen die nichtlineare Wahrheit charakterisiert, nicht validiert

# text
seg-d31be81dfd8f = Passive TDOA/FDOA-Geolokalisierung von Emittern

# text
seg-aa870cee16f6 = Einen Emitter (Jammer/Spoofer oder eine Gelegenheitsquelle für Reverse-PNT) aus der Ankunftszeitdifferenz über ein Empfängernetz orten — der Schnitt der Hyperboloide τᵢ=(Rᵢ−R₀)/c wird durch die Gauß–Newton-Methode der kleinsten Quadrate gelöst — und, mit der Frequenzdifferenz der Ankunft (Entfernungsratendifferenzen) bei bewegten Empfängern, gemeinsam Position und Geschwindigkeit zurückgewinnen; mit der Cramér–Rao-Untergrenze der Positionskovarianz aus der Messgeometrie

# text
seg-36b74b49f82f = Maximale Verzögerung beim ballistischen 3-DoF-Eintritt gegen den veröffentlichten Stardust-Nominalwert

# text
# c1: entry-heating
seg-a05ca2fde6fc = Ein 3-DoF-Punktmasse-Eintritt über einer rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" }, mit RK4 aus einem inertialen Eintrittszustand integriert, mit Angabe der maximalen Verzögerung und ihrer Höhe; der planetenrelative Eintrittszustand aus dem inertialen. Ausführbar als Szenarioart <c1/>.

# text
seg-5ab7065c0803 = Der Stardust-Nominalwert von Desai, Mitcheltree und Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maximale Verzögerung { "33.4" } g bei { "12.6" } km/s planetenrelativ mit der Startmasse von { "45.8" } kg, eine 6-DoF-POST-Trajektorie mit der vollständigen aerodynamischen Datenbank; Eintrittsschnittstelle nach Desai, Lyons, Tooley und Kangas (NTRS { "20090004445" }): Radius { "6503.14" } km, inertial { "12.9" } km/s bei -8.2 Grad. Zielwerte vorab in xval/entry-stardust/PREREGISTRATION.md registriert, vor jedem Lauf mit diesen Eingaben; beide wurden im ersten Lauf erreicht. WAS NICHT GEPRÜFT IST: ein veröffentlichter Fall und eine Größe (maximale Verzögerung, die in der ballistischen Näherung nicht vom ballistischen Koeffizienten abhängt); Eintrittsbreite und Kurs sind angenommen; Erwärmung, Wärmelast und der Landepunkt werden nicht dagegen geprüft; Punktmasse mit konstantem C_D, nicht 6-DoF.

# text
seg-5bd3882531b6 = Konvektive Staupunkt-Eintrittserwärmung (Sutton-Graves) bei einem 3-DoF-Eintritt

# text
seg-4f97036ed72f = Konvektiver Wärmestrom am Staupunkt q = k sqrt(rho/R_n) V^{ "3" } mit den Sutton-Graves-Konstanten für Erdluft und die Marsatmosphäre (NASA TR R-376, { "1971" }), sein Maximum und die integrierte Wärmelast entlang eines 3-DoF-Eintritts, ballistisch oder mit Auftrieb bei konstanter Querneigung, auf der Erde oder auf dem Mars.

# text
seg-5a203ecfeaee = Interne Konsistenz: die Beziehung und die Konstanten wie in NASA TR R-376 gedruckt, eine Halbschritt-Konvergenzprüfung und die erwartete Rangfolge der Maxima von Erwärmung und Verzögerung. WAS NICHT GEPRÜFT IST: Es wurde kein veröffentlichter Erwärmungswert verglichen (die Stardust-Veröffentlichungen geben eine Auslegungsgrenze und eine Schätzung aus konvektiver plus Strahlungserwärmung von etwa { "1200" } W/cm2 an, die eine rein konvektive Beziehung nicht treffen kann); keine Strahlungserwärmung, keine Wandtemperatur- oder Katalytizitätskorrektur und keine Reaktion des thermischen Schutzes.

# text
# c1: eo-radiometry
seg-38902593e841 = Signal-Rausch-Budget eines Nadir-Bildgebers (Lambertsche Szenenstrahldichte, Kameragleichung, Schrot-, Dunkel-, Ausles- und Quantisierungsrauschen), die System-MTF bei Nyquist als Produkt aus Beugung bei unverdeckter Apertur, Detektorapertur, linearer Verschmierung und Gauß-Jitter, die aus dieser MTF integrierte Kantenantwort und relative Kantenantwort, Q = lambda F / p, und die GIQE-Version { "4" }-NIIRS ohne MTF-Kompensation. Ausführbar als Szenarioart <c1/>.

# text
seg-bb3a01edc95d = Geschlossene Formen: die Beugungs-MTF bei halber Grenzfrequenz, die Ein-Pixel-Rampenkante einer reinen Detektorapertur (RER { "1" }), die Normalverteilungs-Kante einer Gauß-Unschärfe (RER = erf(0.5/(sigma sqrt { "2" }))), Skalierung des Schrotrauschens und die GIQE-{ "4" }-Koeffizienten wie veröffentlicht (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). WAS NICHT GEPRÜFT IST: Es wurde kein externer Bildgeber, keine gemessene MTF und kein bewertetes Bild verglichen; die GIQE ist eine empirische Regression mit eigenem Fehler; kein Streulicht, keine atmosphärische MTF, keine MTF-Kompensation und kein Aliasing.

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (Dichte und Druck), mit einem Nickstoß, durch den Düsengegendruck verminderter Schubkraft, Stufenbrennschlüssen exakt an Schrittgrenzen und den neben dem Zustand integrierten Gravitations-, Widerstands-, Steuer- und Gegendruckverlusten. Ausführbar als Szenarioart <c1/>.

# text
seg-174ed29adbbe = Interne Konsistenz: die exakte Identität Brennschlussgeschwindigkeit = Summe Isp g0 ln(m0/mf) minus die vier integrierten Verluste (Residuum unter { "1e-6" } m/s), die Tsiolkowski-Gleichung bei einem vertikalen Vakuumbrand mit der Gravitation als einzigem Verlust sowie die US76-Drücke auf Meereshöhe und an der Tropopause. WAS NICHT GEPRÜFT IST: Die Verluste keines veröffentlichten Fahrzeugs wurden verglichen; keine Erdrotation, kein Gleitflug, keine Drosselung und keine Lenkung über den Nickstoß hinaus; konstantes C_D; kein Trajektorienoptimierer.

# text
seg-55e8345def8b = TWSTFT-Zweiwegegleichung, Unsicherheitsbudget und Streckenstabilität mit Flicker und täglicher Nichtreziprozität

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = Die TWSTFT-Zweiwegegleichung, gelöst nach T_A - T_B mit Sende- und Empfangsverzögerungen der Stationen, der ionosphärischen Auf-/Abwärts-Asymmetrie im Ku-Band, dem Laufzeitunterschied der Transponder und den Sagnac-Termen, gegen ihr exaktes Vorwärtsmodell; ein quadratisches Unsicherheitsbudget mit der Strecken-TDEV als Typ-A-Term; eine Zweiwegeserie mit weißem und Flicker-Phasenrauschen (Kasdin-Walter), einer täglichen Nichtreziprozität und einem konstanten Reziprozitätsresiduum; sowie die Rate, das Residuum-RMS, TDEV und ADEV gelieferter Stationsuhrenserien aus Circular T, MJD-CSV oder IGS-RINEX. Ausführbar als Szenarioart <c1/>.

# text
seg-244f7396ac25 = Interne Konsistenz: Das Vorwärtsmodell und die gelöste Gleichung stimmen auf { "1e-15" } s überein, der Sagnac-Term entspricht der unabhängigen BIPM-2A-Schleifenform omega/c^{ "2" } des Moduls, der ionosphärische Term ist { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, und die Rauschprozesse zeigen ihre erwarteten TDEV-Formen. WAS NICHT GEPRÜFT IST: Es wurde keine reale TWSTFT-Messung und kein Kalibrierbericht verglichen; die angegebenen Verzögerungen und Unsicherheiten sind Eingaben, nicht gemessen; die Stabilitäten gelieferter Serien werden gemeldet, nicht validiert.

# text
seg-2f9be02c92bc = Numerik optischer Schrägstrecken-Atmosphäre: Rytov-Varianz, Szintillation, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelung, optische Tiefe von Wolken und klarer Luft

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley-Cn2, entlang einer Schrägstrecke integriert, für die Rytov-Varianz bei ebener und sphärischer Welle (Aufwärts- und Abwärtsstrecke), den Szintillationsindex nach Andrews-Phillips und die Gamma-Gamma-Parameter, die Gamma-Gamma-Schwundwahrscheinlichkeit und die Schwundreserve, den Aperturmittelungsfaktor bei schwacher Turbulenz, die optische Tiefe von Wolken einer Flüssigwassersäule und die optische Tiefe klarer Luft nach Kim-Sichtweite plus Rayleigh, wodurch der gebündelte atmosphärische Verlust des optischen Link-Budgets ersetzt wird, wenn eine Atmosphäre angegeben ist. Ausführbar innerhalb der Szenarioart <c1/>.

# text
seg-7ca512adff99 = Die Numerik wird mit einem unabhängigen Programm verglichen (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } mit { "30" } Stellen, Tanh-Sinh-Quadratur über der ursprünglichen Höhenvariablen und Bessel-K-Gamma-Gamma-Dichten), das keinen Code mit Kshana teilt, unter Zielwerten, die festgelegt wurden, bevor irgendeine Implementierung existierte (xval/optical-atmosphere/PREREGISTRATION.md). WARUM MODELLED: Diese unabhängige Referenz wertet dieselben veröffentlichten Formeln aus, prüft also die Implementierung der angegebenen Formeln und nicht die Atmosphäre; weder ein ITU-R-Validierungsbeispiel noch eine gemessene Szintillations- oder Schrägstrecken-Extinktionsaufzeichnung wird verwendet (die ITU-Werte sind eine offene Lizenzentscheidung und werden aus dem Repository herausgehalten). Das Niveau des Cn2-Profils, die Sichtweite, die Skalenhöhen von Aerosol und Molekülen, die Weglänge der Aperturmittelung und das Moment-Matching zur Anwendung der Aperturmittelung auf die Gamma-Gamma-Parameter sind angegebene Eingaben oder Konventionen. Eine Quellzeile im Modul hält fest, dass ein vielfach kopierter Überblick den zweiten Szintillationsexponenten als 7/6 druckt, wo Andrews und Phillips 5/6 angeben; die Form 5/6 ist implementiert

# text
seg-a2faab92e760 = Wettergetriebene Verfügbarkeit optischer Bodenstandorte und abstandskorrelierte Standortdiversität

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Verfügbarkeit einer optischen Strecke gegen eine angegebene Streckenreserve aus einem lognormalen Klima der Wolkenflüssigwassermenge (Menge nach ITU-R P.840, Extinktion der geometrischen Optik) und dem unabhängigen Gamma-Gamma-Turbulenzschwund, die für Zielverfügbarkeiten nötige Streckenreserve und die Obergrenze, die keine Reserve anhebt, lognormale Ausfalldauern, Was-wäre-wenn-Fälle für Verbesserungstechniken und eine Ein-Faktor-Gauß-Copula-Netzverfügbarkeit, deren Paarkorrelation exp(-Abstand/Dekorrelationslänge) ist. Ausführbar als Szenarioart <c1/>.

# text
seg-20eab6e9b925 = Interne Konsistenz: geschlossene Grenzfälle und Monotonie des Diversitätsmodells, die geschlossene Form der Wolkenobergrenze und die lognormalen Ausfallidentitäten. KEINE externe unabhängige Referenz wird beansprucht, und keine wurde verglichen: Es wird keine gemessene Verfügbarkeit einer optischen Bodenstation und keine Aufzeichnung wolkenfreier Sichtlinien verwendet. WARUM MODELLED: Das Wolkenklima (Wolkenwahrscheinlichkeit, Median und Streuung der Flüssigwassersäule, Ausfalldauern), die Unabhängigkeit von Wolke und Turbulenz, die Form der Gauß-Copula, die Dekorrelationslänge und jeder Technikgewinn sind Annahmen; die mitgelieferten Szenarien geben ILLUSTRATIVE Klimata an, keinen Datensatz. Eine Hochstufung dieser Zeile erfordert eine zitierte gemessene Verfügbarkeitsaufzeichnung und einen vor dem Vergleich registrierten Zielwert

# text
seg-043ece801e72 = Kontinuität von Zeitgebung und Entfernungsmessung bei optischen Ausfällen

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = Die Verteilung der Ausfalldauer eines optischen Standorts, gekoppelt an die geschlossene Auslaufvarianz des Uhren-Holdover-Modells: Zeitgebungs- und Entfernungsmessfehler bei angegebenen Ausfallquantilen, der Holdover bis zu einer Zeitgebungsschwelle, der Anteil der Ausfälle und der Ausfallzeit innerhalb davon und die Zeitgebungsverfügbarkeit A + U E[min(D, T_h)]/E[D], für die klassischen und die Quanten-Uhrenklassen. Ausführbar innerhalb der Szenarioart <c1/>.

# text
seg-ab2a33c1b1a4 = Interne Konsistenz mit dem Holdover-Modul, bitgenau; KEINE externe unabhängige Referenz wird beansprucht. Die Klassen-PSDs sind die synthetisierten Langzeit-tau-Untergrenzen, die das Holdover-Modul bereits trägt, sodass die Werte dessen angegebenen Vorbehalt erben, dass der Holdover bis zu einer engen Schwelle von der angenommenen Rotrausch-Untergrenze bestimmt wird und nicht von der zitierten Allan-Abweichung. Die Ausfalldauern sind ein lognormales Modell mit angegebenen Parametern, keine gemessene Aufzeichnung von Wolkenverweildauern

# text
seg-b119df65d2a7 = Optische Streckenreserve über die Zeit: eine Realisierung des Wetters eines Standorts mit Seed

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Eine optionale Tabelle <c1/> (Dauer, Schritt, Seed) lässt die Art <c2/> je Standort zusätzlich eine Realisierung des angegebenen Standortmodells mit Seed über die Zeit schreiben: Wolkenepisoden (klare Phasen exponentiell, Wolkenausfälle lognormal mit dem angegebenen Mittelwert und der angegebenen Streuung, der Zeitanteil in Wolken auf die angegebene Wolkenwahrscheinlichkeit gesetzt), eine lognormale Flüssigwassersäule je Wolkenepisode, eine Gamma-Gamma-Szintillationsprobe je Schritt und daraus die Streckenreserve, die Wolken- und Szintillationsschwunde und die Streckenverfügbarkeits-Markierung, mit der realisierten Verfügbarkeit, dem Wolkenanteil, der Zahl der Ausfälle und dem längsten Ausfall. Ohne die Tabelle ist das Ergebnis das Dokument { "0.37" }. Ziehungen laufen über die portablen Verteilungs- und Mathematikroutinen, sodass native und wasm32 dieselben Bytes liefern.

# text
seg-d25e5d2449bd = Nur interne Konsistenz; KEINE externe unabhängige Referenz wird beansprucht, und für eine Wetterrealisierung gibt es keine. Die Prüfungen vergleichen eine Ziehung mit der statistischen Ausgabe desselben Modells, sodass ein Bestehen aussagt, dass der Generator die angegebenen Verteilungen abtastet (die Verfügbarkeit und der Wolkenanteil der Ziehung liegen innerhalb vorab registrierter Toleranzen der angegebenen Werte), nicht, dass sich ein realer Standort so verhält. Die Serie ist eine Realisierung, nicht das Klima: Ihre Verfügbarkeit weicht um den Stichprobenfehler der Ziehung von der angegebenen ab, und Szintillationsproben bei verschiedenen Schritten sind unabhängig, eine angegebene Vereinfachung eines Prozesses, der in Millisekunden dekorreliert. Die Wettereingaben bleiben Annahmen des Szenarios.

# text
seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) und inv auf { "201" } eingecheckten SPD-Eingaben (tests/fixtures/gls_whitening_numpy_oracle) prüfen den selbst geschriebenen Faktor, das gewichtete Residuum und den Whitening-Operator; das Mahalanobis-Quadrat wird gegen solve(Omega, r) geprüft, das keine Cholesky-Zerlegung verwendet, sodass die Identität z^T z = r^T Omega^-1 r auf einem getrennten Weg bestätigt wird. Alles innerhalb von { "1e-12" } relativ (schlechtester Wert { "7.9e-16" }), Toleranz vor dem Vergleich festgelegt. Die größte Konditionszahl beträgt { "19.3" }, schlecht konditionierte Matrizen sind daher nicht abgedeckt. GLS/Aitken-{ "1935" }-Whitening ist Cited.

# text
seg-1a3bb032960f = Konsistenzstatistik für Gleichtakt (trennungsblinder Fehler der gemeinsamen Referenz)

# text
seg-1b03f522b8fc = Score-Statistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 für eine Gleichtaktverschiebung, die die Lösungstrennung (Kontraste orthogonal zu { "1" }) nicht sehen kann; eine Gleichtaktverschiebung bläht sie auf, während die paarweisen Trennungen flach bleiben

# text
seg-91fc18cde833 = Grenze für nicht erkennbaren Gleichtakt außerhalb von Omega (Residuum)

# text
seg-0cc2c0f033c8 = Obergrenze für nicht erkennbaren Gleichtakt: die größte Fehlergröße entlang einer Richtung d, die SOWOHL der Trennung (alpha_ss = T_ss / gewichtete Kontrastnorm von d) ALS AUCH der Gleichtaktstatistik (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|) entgeht, angegeben als min(alpha_ss, alpha_cm). Bei positiv definitem Omega schließen sich die beiden blinden Richtungen (d proportional zu { "1" } und { "1" }^T Omega^-1 d = { "0" }) gegenseitig aus, sodass die Obergrenze für jedes von null verschiedene d ENDLICH ist; unendlich ist sie nur bei einer Nullrichtung oder einem nicht positiv definiten Omega. Eine Richtung außerhalb der modellierten gemeinsamen Achse ist nur für die Gleichtaktstatistik blind und wird durch die Trennung begrenzt

# text
seg-a7a33523bb1c = Identifizierbarkeit des Mond-Datums - Zerlegung, lineare Algebra

# text
seg-bd59cc76557a = Marginale des Blocks { "{" }Mondzentrum-X, Maßstab{ "}" } der Fisher-Matrix des 7-Parameter-Helmert-Datums über das Schur-Komplement: die skalare Degenerationsmetrik lambda_min(S), die CRLB des Ursprungs X und die Korrelation zwischen Ursprung und Maßstab

# text
seg-0f7e4fb31c44 = Unabhängige SciPy/NumPy-Referenz (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): das Schur-Komplement, seine Eigenwerte und die 2x2-Inverse, berechnet von einer unabhängigen Bibliothek. Beschränkt auf die LINEARE ALGEBRA der Zerlegung; die Beträge von Korrelation und CRLB des Mondes aus realer Geometrie bleiben MODELLED.

# text
seg-3359eee713a5 = Klassifikation des Nullraums des Mond-Datums (LLR-Rang-Additivität + Libration, Hebung des Defekts)

# text
seg-6d722c176052 = Klassifikation des Datumsproblems bei interner Entfernungsmessung: Eine einzelne Entfernungsbeobachtung trägt den Rang { "1" } bei (6-dimensionaler Nullraum); das Paar aus Ursprung X und Maßstab ist nahezu null, und die physikalische DE440-Libration hebt den Defekt auf null, während das Paar nahezu degeneriert bleibt

# text
seg-ae6dc4e6ea8b = Von der Engine reproduzierte geometrische Struktur plus die geschlossene 2x2-Schur-Identität; in der STRUKTUR konsistent mit Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), deren berichtete Beträge hier NICHT reproduziert werden. Die Klassifikation ist strukturell; die Beträge von Korrelation und CRLB unter realer Geometrie sind MODELLED (Reflektorkoordinaten und Orientierung festgehalten). { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): gegenüber Sosnica et al. { "2025" } liegt die Ursprung-Maßstab-Korrelation der Entfernungs-Fisher-Matrix (-0.993 / -0.988) innerhalb von { "0.05" } des veröffentlichten Werts -0.97, aber auf der eigenen Fünf-Reflektoren-Geometrie der Veröffentlichung beträgt die 7-Parameter-Helmert-Korrelation bei gleicher Gewichtung -0.78 (der veröffentlichte Wert beruht auf Fehlern je Reflektor, die die Veröffentlichung nicht angibt), und die CRLB des Ursprungs ({ "0.6" } bis { "1.2" } mm bei { "3" } mm Entfernungsrauschen) liegt { "96" } bis { "98" } % unter den { "3.07" } cm der Veröffentlichung bei einer Toleranz von { "20" } %. Beträge nicht reproduziert

# text
seg-3fd19007ea67 = Multitechnik-Datumsinformation des Mondes (LLR + Mond-VLBI + Orbiter-Entfernung)

# text
seg-23d0dd7d0666 = Datum-Jacobi-Zeilen für die LLR-Entfernung zu Erdreflektoren, die differenzielle Laufzeit der Zwei-Stationen-Mond-VLBI und die Entfernung zwischen Orbiter und Bake über das 7-Parameter-Datum, zusammengeführt zu einer einheitlich vorkonditionierten Fisher-Matrix; zeigt, dass nicht radiale (Orbiter- / tiefendiverse) Verfolgung die Degeneration zwischen Ursprung X und Maßstab aufhebt, während transversale VLBI nur indirekt hilft

# text
seg-b2f5715c4577 = Kreuzprüfungen der Ableitungen jeder Technik, analytisch gegen finite Differenzen (intern); die RICHTUNG der Verbesserung ist eine geometrische Tatsache. Bakenorte, Zeitpläne und Rauschen sind MODELLED/repräsentativ (siehe tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = DE440-Anbieter der Orientierung der Hauptträgheitsachsen des Mondes

# text
seg-ebe4519a40e4 = Rotation MOON_PA_DE440 nach J2000 zu beliebigen Epochen innerhalb von 2014-01-01 bis 2030-12-31 TDB durch geodätische Interpolation R0·Exp(f·Log(R0ᵀR1)) zwischen den Stützstellen einer eingecheckten täglichen Reihe mit { "6" } 209 Zeilen (die try_-Funktionen geben außerhalb davon OrientationSpanError zurück, die nicht fehlbaren lösen Panic aus; es wird nie begrenzt); zur Kompilierzeit eingebettet, sodass kein Dateisystemzugriff zur Laufzeit nötig ist und der WASM-Build sie mitführt

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 bis spiceypy { "8.2.0" }, als Werkzeug ausgeführt): pxform von MOON_PA_DE440 nach J2000, das die binäre PCK moon_pa_de440_200625.bpc von JPL direkt mit dem eigenen Frame-Kernel moon_de440_250416.tf von NAIF auswertet, bei { "2 000" } zufälligen Epochen zwischen den Stützstellen im eingebetteten Fenster. Der Rotationswinkel zwischen den Matrizen von Kshana und SPICE liegt innerhalb von { "1.7e-5" } rad ({ "30" } m beim mittleren Radius von { "1737.4" } km, vor dem Vergleich festgelegt); gemessen schlechtester Wert { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad und schlechtester Wert { "1.75e-6" } rad bei { "6 000" } weiteren, vom Prüfer gezogenen Epochen. Die täglichen Stützstellen wurden selbst aus demselben Kernel extrahiert (scripts/gen_de440_moon_pa.py, Fixture-SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), sodass dieser Vergleich die Interpolation zwischen ihnen prüft, was die Behauptung ist. Durch diesen Vergleich gefunden und behoben: Die frühere elementweise lineare Interpolation mit Gram-Schmidt behielt die Achse, aber nicht den Winkel der Rotation von { "13.2" } deg/Tag bei und wich nahe den Viertelpunkten um bis zu { "2.0e-4" } rad ({ "340" } m) ab; der frühere Wert von etwa { "14" } m stammte von einer Schutzprüfung, die nur Intervallmitten abtastet. Die Reihe deckt 2014-01-01 bis 2030-12-31 ab und liefert außerhalb davon Fehler (Runde { "2" }); ihre Stützstellen von 2024-2025 lassen sich aus demselben Kernel bis { "4.3e-13" } neu erzeugen. Der obige SPICE-Vergleich zwischen den Stützstellen deckt nur 2024-2025 ab, was das validierte Fenster ist; die erweiterten Stützstellen stammen aus demselben Kernel und Skript, wurden aber zwischen den Stützstellen nicht verglichen. Ein Geometrie-Substrat für die Identifizierbarkeitsanalyse, kein Orientierungsprodukt im Submeterbereich

# text
seg-ab96cfc8d48c = Geometrie-Substrat des Mond-LLR-Datums (Reflektoren in Hauptträgheitsachsen, Bodenstationen, analytische Entfernungsableitungen)

# text
seg-40e91288f81a = Die fünf erdzugewandten Retroreflektor-Arrays in Metern im PA-Körperkoordinatensystem und die LLR-Bodenstationen in geodätischen Koordinaten; Platzierung der Reflektoren vom Körper- ins Inertialsystem über die DE440-PA-Orientierung; analytische Ableitungen der Entfernung Erde-Reflektor nach dem 4-Parameter-Datum; und die reine LLR-Fisher-Matrix, die die Degeneration zwischen Mondzentrum-X und Maßstab zeigt, die die 7-Parameter-Analyse motiviert

# text
seg-89ce1f95d9f6 = Die Berechnung wird intern geprüft: jede analytische Ableitung gegen eine finite Differenz und der Fall des Null-Datums gegen die nominelle Entfernung. Der KATALOG wird extern und unabhängig geprüft - die DE440-Hauptachsenkoordinaten (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) werden mit Tabelle { "6" } des Memorandums zu den DE430-Oberflächenkoordinaten (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, maschinell aus einem per SHA-256 verifizierten PDF extrahiert durch tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) kreuzgeprüft und stimmen auf { "1.12" } m überein, während die Mean-Earth-Realisierung derselben fünf Arrays um { "672" } bis { "871" } m abweicht. Die DEGENERATIONSSTRUKTUR wird gegen ein veröffentlichtes Ergebnis geprüft: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, das für das Hauptachsensystem des Mondes einen Korrelationskoeffizienten von r = -0.97 zwischen Mondzentrum-X und Maßstab angibt und berichtet, dass LLR wegen dieser Korrelation den tatsächlichen Massenmittelpunkt des Mondes nicht mit einer Genauigkeit besser als { "12" } cm erreicht. Dieses Modul gewinnt dieselbe Struktur (|corr(t_x, scale)| zwischen { "0.9" } und { "0.9999" }, Datumsdefekt <= { "1" }) aus einem reinen LLR-Fisher-Entwurf zurück. Die Bestätigung erfolgt über Ephemeriden hinweg, nicht als Rundlauf: Die Veröffentlichung kombiniert INPOP21a, DE430 und EPM2021, während dieses Modul von der DE440-Libration angetrieben wird. Was NICHT reproduziert wird, ist der Betrag - die Korrelation beträgt hier etwa -0.988 gegenüber ihren -0.97, und die 4-Parameter-CRLB liegt im Submillimeterbereich gegenüber ihrem erreichten Boden von { "12" } cm, weil Orientierung und Reflektorkoordinaten hier festgehalten und dort mitgeschätzt werden. Nur Geometrie und Degenerationsstruktur; keine Genauigkeitsaussage über ein geschätztes Datum. { "0.30" } externer Vergleich: Die Teile dieses Moduls zur gemessenen Entfernung (reflectors(), stations_itrf(), die DE440-PA-Platzierung und die baryzentrische Lichtlaufzeit llr_bcrs_one_way_m) sind in ihrer eigenen Zeile, LLR-Modell der gemessenen Entfernung, gegen { "192" } ILRS-Normalpunkte validiert (RMS { "2.81" } m gegenüber { "10" } m). Diese Zeile bleibt MODELLED, weil der Vergleich mit Messungen den Rest ihrer Behauptung nicht prüft. Der geodätische Stationskatalog stations() rundet APOLLO auf { "0.001" } deg; mit einer geozentrischen Lichtlaufzeit ergibt er auf denselben Punkten { "22.7" } m (Test reflector_ranges_against_ilrs_normal_points; { "96" } m mit der früheren elementweisen Orientierungsinterpolation). Die analytischen Entfernungsableitungen und die reine LLR-Fisher-Matrix werden über llr_range_m und reflector_inertial mit der analytischen Mondreihe (ephem::moon_position, etwa { "0.3" } deg vom GCRS) und ohne Lichtlaufzeit berechnet

# text
seg-a78ba110b64c = LLR-Modell der gemessenen Entfernung (Reflektorkatalog, ITRF2020-Stationen, DE440-Platzierung der Hauptträgheitsachsen, baryzentrische Lichtlaufzeit nach IERS { "2010" })

# text
seg-c9827c1a427b = Die einfache Entfernung von der Erdstation zum Reflektor eines Normalpunkts der Laser-Entfernungsmessung zum Mond: die fünf erdzugewandten Retroreflektor-Arrays in Metern im DE440-Hauptachsen-Körperkoordinatensystem (PA) (lunar_llr_geometry::reflectors); die Stationen aus stations_itrf(), nämlich Grasse { "7845" } und Matera { "7941" } aus ITRF2020 zur Epoche { "2015.0" } mit ihren Geschwindigkeiten, durch die IERS-{ "2010" }-Transformation mit Polbewegung aus Bulletin A ins Geocentric Celestial Reference System (GCRS) gebracht (lunar_vlbi::station_inertial_position_itrs), und APOLLO { "7045" } an seiner vom Betreiber veröffentlichten genäherten geozentrischen Position (ohne Geschwindigkeit); die Platzierung der Reflektoren vom Körper- ins Inertialsystem über die DE440-PA-Orientierung (lunar_orientation::try_de440_moon_pa_body_to_inertial, die außerhalb von 2014-2030 einen Fehler liefert); und die baryzentrische Lichtlaufzeit nach IERS Conventions { "2010" } Abschnitt { "11.2" } (lunar_llr_geometry::llr_bcrs_one_way_m: die Körper-zu-BCRS-Transformation von Station und Reflektor nach Gl. { "11.19" } und die Shapiro-Verzögerung durch Sonne, Erde und Mond nach Gl. { "11.17" }). EINGABEN, nicht Teil der Behauptung: die baryzentrischen Zustände und Potenziale von Erde, Mond und Sonne (DE440 über SPICE), IERS UT1-UTC und Polbewegung sowie die gemessene Umlaufzeit, von TT nach TDB umgerechnet. SEITE DES PRÜFSTANDS, nicht Teil der Behauptung: die Mendes-Pavlis-Zenitverzögerung mit FCULa-Abbildung, im Test, mit der Elevation aus dem geodätischen Katalog stations(). Nicht modelliert: Gezeiten, Stationsexzentrizitäten, thermische Terme der Reflektoren

# text
seg-9b1dfa736cb6 = Gekoppelte Eichung von Mondsystem und Zeitskala: der gemeinsame Nullraum aus räumlichem Datum, Uhrversatz und Uhrrate

# text
seg-a000ef6ab2e0 = assemble_coupled_info baut die gekoppelte 9-Parameter-Fisher-Matrix über [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha] auf; classify_null_space liefert eine basisinvariante Zerlegung ihres Nullraums in rein räumliche, rein zeitliche und echt gekoppelte Dimensionen sowie die Kopplungsnorm des Projektors vom Räumlichen zum Zeitlichen; coupled_marginal_eigs liefert die Schur-Komplement-Marginale { "{" }Maßstab, Versatz{ "}" }. Auf den eingecheckten Netzen meldet die Engine ein Datum mit vollem Rang (Defekt { "0" }) für den gut gestellten Fall und einen exakten Defekt in einer einzelnen Ratenrichtung für den Einzelepochenfall (verstrichene Zeit null, die Rate ist also konstruktionsbedingt nicht beobachtbar) und berechnet in beiden die Marginale { "{" }s, d_tau{ "}" }.

# text
seg-35eebbc8a2e9 = WAS EXTERN GEPRÜFT WIRD, eng gefasst: kshana berechnet die Eigenzerlegung mit seinem eigenen handgeschriebenen Jacobi-Löser (fim::sym_eig) und die Marginale mit seiner eigenen Pseudoinversen; das Orakel berechnet beides mit numpy/LAPACK (np.linalg.eigvalsh/eigh/pinv) über scripts/gen_coupled_gauge_ref.py neu. Übereinstimmung auf rel<{ "1e-3" } ist daher eine Prüfung der ARITHMETIK DIESER CRATE gegen eine Standardimplementierung mit unabhängiger Bibliothek, was die validierte Behauptung ist und deren Gesamtheit. WAS NICHT: Der Aufbau und die Klassifikation des Nullraums sind die eigenen Regeln dieses Moduls, und das Orakel reproduziert sie aus derselben Spezifikation statt aus einer unabhängigen Quelle - das bestätigt die Implementierung, nicht die Regel. Die Geometrie von Baken und Orbitern ist modelliert und repräsentativ. Die Beobachtungszeilen tragen zwar die reale DE440-PA-Orientierung des Mondes (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), doch das ist eine EINGABE, die beide Seiten erhalten, kein Beleg für die Antwort, und wird hier als Herkunftsangabe festgehalten statt als Rechtfertigung für den Status - dieselbe Unterscheidung, die main bereits in der Zeile zur Gleichtakt-Integrität trifft. Jede Gleitkommazahl einer Zeile wird vor dem Schreiben von network.json auf { "6" } Nachkommastellen gerundet, sodass beide Seiten identische IEEE-754-Doubles lesen und der einzige verbleibende Unterschied der Löser ist.

# text
seg-63a8571f8eb0 = Degeneration zwischen Entfernung und Uhrversatz bei einfacher Mondentfernungsmessung und das Entwurfsgesetz der geometrischen Vielfalt

# text
seg-cdd70f56051a = Die Degeneration zwischen radialer Entfernung und Empfänger-Uhrversatz je Knoten ist exakt bei { "1" } m zu { "3.336" } ns (eins durch c). Die Schur-Komplement-Marginale { "{" }Maßstab, Versatz{ "}" } (coupled_marginal_fisher) zeigt, dass in einem geometrisch vielfältigen Netz die Zweiwege-Entfernungsmessung die Marginale um etwa denselben Faktor hebt wie eine gleiche Anzahl zusätzlicher Einwege-Daten, während im idealisierten Einzelknoten-Regime die Hebung durch Zweiwege um Größenordnungen größer ist. Das daraus folgende Entwurfsgesetz: Geometrische Vielfalt, nicht die Zweiwege-Entfernungsmessung als solche, trennt bei der Einwege-Entfernungsmessung den Maßstab des Mondsystems vom Zeitskalenversatz; eine Zweiwege- oder externe Zeitanbindung ist nur im Regime geringer Vielfalt oder eines einzelnen Nutzers erforderlich.

# text
seg-25dd0e9134c8 = Schur-Komplement-Marginale der Fisher-Matrix der gekoppelten Informationsmatrix, in geschlossener linearer Algebra, geprüft an den beiden Grenzregimen, die sie vorhersagt. Die Äquivalenz von { "1" } m zu { "3.336" } ns ist die Definition des Meters über c und kein empirisches Ergebnis. Die Beobachtungsnetze sind repräsentative modellierte Geometrie, sodass das Entwurfsgesetz eine Aussage über die ihm vorgelegte Geometrie ist und keine Behauptung über ein im Einsatz befindliches Mondnetz enthält.

# text
seg-16ec8283f9b4 = Relativistische Kopplung von Uhrrate und Bezugssystem für die Mond-Zeitskala

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) liefert die Empfindlichkeit der Rate der Mond-Zeitskala gegenüber der Realisierung des Bezugssystems, aus dem äquatorialen effektiven Potenzial, abgeschnitten bei Grad { "2" } (GM, Äquatorradius, J2, Rotation; LunarSurfacePotential): d_alpha/d_scale = L_m, etwa +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, etwa -1.11e-14 (zeitabhängig); d_alpha/d_r_radial = g_eff/c^{ "2" }, etwa +{ "1.806e-17" } pro Meter. Für eine radiale Datumsverschiebung von { "1" } m ist das eine Störung der Rate von etwa { "1.8e-17" } (eine arithmetische Folge des radialen Eintrags), weit unter dem Ratenversatz von etwa { "1.7e-11" } einer Mond-Zeitskala gegenüber TT

# text
seg-a666792106d9 = Basisinvariante Klassifikation des gekoppelten Nullraums von Bezugssystem und Zeitskala

# text
seg-5ee36574d1b4 = classify_null_space zerlegt den Datum-Nullraum in einen rein räumlichen Teil (Dimension d minus Rang U_T), einen rein zeitlichen Teil (d minus Rang U_S) und einen echt gekoppelten Teil (Rang U_S plus Rang U_T minus d), dazu die Kopplungsnorm p_st_norm des Projektors vom Räumlichen zum Zeitlichen, die Frobenius-Norm des nichtdiagonalen Blocks des Nullraum-Projektors. Jede dieser Größen ist eine Funktion des PROJEKTORS und nicht einer gewählten Basis, sodass sie unter jeder orthonormalen Wahl der Nullvektoren invariant sind - was die Klassifikation überhaupt erst berichtbar macht.

# text
seg-2c074d6260ba = Repräsentatives Menü aus Multitechnik-Messungen und die additive Kombinationsregel der Fisher-Matrix

# text
seg-beefac5c1b13 = MeasurementBlock hält eine mögliche Messkampagne als 7x7-Beitrag zur Fisher-Informationsmatrix plus skalare relative Kosten; block_from_rows baut einen aus rohen Datum-Jacobi-Zeilen auf, sodass jeder Block über lunar_identifiability::assemble_multi_info identisch vorkonditioniert wird; combine summiert die Information einer gewählten Teilmenge, was die richtige Regel ist, weil Fisher-Information über unabhängige Messungen additiv ist; representative_lunar_menu liefert ein deterministisches Menü aus vier Blöcken (LLR, eine transversale VLBI-Randbake, ein erdzugewandter Orbiter und ein erdabgewandter Orbiter). Der budgetbeschränkte Entwurfsoptimierer, der dieses Menü verbraucht, ist nicht Teil dieser Crate.

# text
seg-d83a9942ee72 = Die Additivität der Fisher-Information über unabhängige Messungen ist eine Eigenschaft in geschlossener Form, hier geprüft gegen eine unabhängig geschriebene elementweise Summe und gegen die daraus folgende Reihenfolgeinvarianz und Monotonie. HINWEIS ZUR EVIDENZ: Der Kombinierer hatte zuvor überhaupt keinen Test, und der eine Test im Modul summierte die beiden Informationsmatrizen inline, statt ihn aufzurufen, sodass ein defekter Kombinierer das Modul grün gelassen hätte; der Test läuft jetzt über combine und schlägt fehl, wenn dieses mutiert wird. Alle Bakenorte, die Orbitergeometrie, die Präzisionen je Technik und die relativen Kosten sind repräsentative Wahlen statt Missionswerte (siehe tests/fixtures/llr_geometry/NOTICE.md), sodass jede Degenerationsmetrik und jeder CRLB-Wert, der über dieses Menü erreicht wird, den modellierten Status von lunar_identifiability::decompose erbt.

# text
seg-341eedfc47da = Anbieterübergreifende Konsistenz von Bezugssystem und Dynamik des Mondes (reale Inter-Ephemeriden)

# text
seg-f8d94c0771cc = Zerlegung nur der Rotation (6 Parameter, Translation+Rotation) der Abweichung des geozentrischen Mondes zwischen DE440/INPOP21a/EPM2021 in eine reduzierbare gemeinsame ICRF-Systemanbindung und einen nicht reduzierbaren Überschuss der Orientierung der Mondbahn (die vollständige 7-Parameter-Helmert-Anpassung ist eine eigene öffentliche Funktion, die von dieser externen Prüfung NICHT abgedeckt wird: ihre Evidenz ist ein interner Unit-Test der analytischen Rückgewinnung plus tests/lunar_helmert_fit_cross_check.rs, der sie mit der validierten exakten Gauss-Newton-Anpassung in lunar_frame_realise abgleicht und die Konvention des entgegengesetzten Rotationsvorzeichens zwischen beiden festlegt)

# text
seg-2d3347bcb15e = Anbieterübergreifende Konsistenztoleranz für einen Nutzer mit gemischten Anbietern

# text
seg-9decf2cb6b0c = consistency_tolerance: invertiert ein Positionsbudget des Nutzers zu einer Anforderung an die Helmert-Übereinstimmung zwischen Anbietern je Parameter (Ursprung/Maßstab/Rotation) bei einem Referenz-Hebelarm, optional aufgebläht durch die CRLB der Realisierung eines einzelnen Anbieters nach P1

# text
seg-b8dc68eb4bda = Dreiecksgrenze im ungünstigsten Fall für die Wirkung der Helmert-Punkt-Jacobi-Matrix (geschlossene Form)

# text
seg-5450d921dfc9 = Fehlerbudget für die Interoperabilität mehrerer Mondanbieter und Entwurfsgesetz Bezugssystem gegen Ephemeride

# text
seg-e1e30f5c17a6 = interop_budget: Aufteilung in reduzierbar (gemeinsame Systemanbindung) und nicht reduzierbar (Dynamik) unter den Konventionen PerProvider / CommonFrameTie / CommonEphemeris, mit der Metrik des Entwurfsgesetzes für den nicht reduzierbaren Anteil (~{ "0.69" } bei realen DE440/INPOP/EPM: Ein gemeinsames Systemkennzeichen allein lässt den dominanten Boden bestehen)

# text
seg-46304ae1efa4 = RMS-Aggregation der validierten Aufteilungen je Paar unter jeder Konvention (geschlossene Form)

# text
seg-a01f394a36d3 = Lineare-Algebra-Pipeline zur Fehlerbeobachtbarkeit in einem autonomen freien Netz (Paritätsprojektor, Erkennbarkeit, Nichtzentralität der MDB, byzantinischer Block-Spark)

# text
seg-b3389bb90e8d = Auf dem realen DE440-Mondnetz je Knoten (jede Zeile eine differenzielle einfache Entfernung zwischen Knoten, aufgebaut über pernode_range_row mit einer realen DE440-Sichtlinie im Mond-PA-System) berechnet die Engine den gewichteten Paritätsprojektor P⊥ = I − G(GᵀWG)⁺GᵀW (die rangdefiziente Pseudoinversenform, die die 8-dimensionale Eichung aus Datum⊕Zeitskala übersteht), das T1-Erkennbarkeitsresiduum ‖P⊥·b‖ (Fehler im Bildbereich werden ausgelöscht, generische Fehler sind erkennbar), die quadratische Form der Baarda-MDB-Nichtzentralität cᵀWP⊥c (die richtige gewichtete Form mit einfachem P⊥, NICHT die Form mit doppeltem P⊥ cᵀP⊥WP⊥c) mit MDB = √(λ₀/cᵀWP⊥c) sowie die Zählungen von Erkennung und Identifikation des byzantinischen Block-Sparks der gestapelten effektiven Peer-Signaturen P⊥·B_T (Spaltenrang, nicht bloß ungleich null)

# text
seg-8cb248423fd0 = Unabhängige lineare-Algebra-Reproduktion mit numpy/scipy auf realen DE440-Sichtlinienzeilen im Mond-PA-System (P⊥ aus der SVD des gewichteten Entwurfs W^{ "{" }1/2{ "}" }G; die MDB-Nichtzentralität aus der klassischen quadrierten Norm des Paritätsteilraums nach Baarda ({ "1968" }); der Blockrang aus der Zählung der Singulärwerte einer numpy-SVD) — ein wirklich anderer numerischer Weg als die zyklische Jacobi-Eigenzerlegung von GᵀWG in der Crate. Geltungsbereich (gemäß tests/fixtures/faultobs/NOTICE.md): Dies validiert die LINEARE-ALGEBRA-PIPELINE nur auf diesen Zeilen. Die Knotengeometrie ist modelliert. Es ist KEINE operative Integritätsgarantie, keine Zertifizierung eines Schutzniveaus und keine Aussage zur RAIM/ARAIM-Verfügbarkeit, und KEINE Missionsgarantie zur byzantinischen Fehlertoleranz — die ANZAHL tolerierter Fehler für dieses Netz ist modelliert, während die detect>f / identify>2f-Block-Spark-GRENZE Cited ist (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockweiser Spark von Donoho–Elad { "2003" }) und im Code als bewiesene Instanziierung vorliegt

# text
seg-ebb827739614 = Byzantinische Block-Spark-Grenze für Erkennung/Identifikation im autonomen Mondnetz je Knoten (T3)

# text
seg-4fb935e6193d = byzantine_bound instanziiert die Kodierungs-/Sparse-Beobachtbarkeitsgrenze der sicheren Zustandsschätzung auf der Geometrie des Netzes je Knoten: Ein byzantinischer Peer speist eine beliebige Linearkombination der Messungen ein, an denen er beteiligt ist, und das Netz ERKENNT jede Koalition von ≤ f = block_spark − { "1" } Peers und IDENTIFIZIERT eindeutig jede Koalition von ≤ ⌊(block_spark − { "1" })/2⌋, wobei block_spark die kleinste Peer-Koalition ist, deren gestapelte effektive Signaturen P⊥·B_T spaltenrangdefizient sind. Die Erkennbarkeit eines Peers ist der VOLLE SPALTENRANG von P⊥·B_j (ein von null verschiedener, aber rangdefizienter Block ist ein von null verschiedener Angriff, der in range(G) landet und kein Residuum hinterlässt), nicht bloß P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Geometrische Instanziierung der Grenze des blockweisen Spark / der sicheren Zustandsschätzung (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockweiser Spark von Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NICHT die Konsensschwelle 3f+{ "1" } von Lamport–Shostak–Pease ('Byzantinisch' bezeichnet nur das MODELL beliebiger/kolludierender Fehler). Die konkrete Anzahl tolerierter Fehler ist eine modellierte Eigenschaft der repräsentativen Netzgeometrie, auf Selbstkonsistenz geprüft durch von Hand konstruierte analytische Fälle und die Zählformeln

# text
seg-4f57f586cf82 = Boden der zeitlichen Eichung im autonomen Holdover für die selbstreferenzielle Mondkonstellation (T4)

# text
seg-eb690e8f5c9b = holdover_floor stellt fest, dass in einem Ensemble autonomer Knoten, die nur durch Messungen zwischen den Knoten verbunden sind, die gemeinsame Uhrrate (δα_j += { "1" } ∀j) ein freier Parameter der Ensemblezeit ist, der in N(GᵀWG) liegt: Keine noch so große Zahl zusätzlicher Entfernungsmessungen zwischen den Knoten kann sie beobachten (rate_in_gauge = true, temporal_gauge_dim = { "2" } mit dem gemeinsamen Versatz). Das ist der echte Holdover-Boden — das zeitliche Gegenstück zur Lageeichung des starren Bezugssystems. Das Hinzufügen einer externen absoluten Ratenanbindung (einer direkten Verbindung zu einer Referenz außerhalb des Netzes) treibt die gemeinsame Rate aus dem Nullraum (rate_in_gauge = false, temporal_gauge_dim = { "1" }) und beweist, dass der Boden eine echte Eichung ist und kein Artefakt des Oszillatormodells

# text
seg-097f126797bb = Argument des freien Parameters der Ensemblezeit (Percival { "1978" }; Lewandowski & Thomas { "1991" }), instanziiert auf dem repräsentativen realen DE440-Netz je Knoten: ein Nulltest des relativen Residuums des analytischen Generators der gemeinsamen Rate gegen GᵀWG, wobei der Kontrast mit aufgelöster Entartung die echte Eichung von einem Artefakt des Oszillatormodells unterscheidet. Repräsentative modellierte Geometrie, kein zertifiziertes Zeitgebungsbudget

# text
seg-25ffd6e1979c = Gemeinsame/differenzielle Aufteilung der Anbieter, Vereinheitlichung der Rangdefizienz um eins und Steigung der Schutzlücke (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Drei Facetten der einen Zerlegung ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) mit der 8-dimensionalen Eichung aus Datum⊕Zeitskala als N(G) und den state_dim − { "8" } = { "32" } beobachtbaren Richtungen als range(G): (T5) provider_mismatch_split stuft einen gemeinsamen Bias mehrerer Anbieter (∈ range(G)) als NICHT ERKENNBAR ein — er braucht eine externe Anbindung — und einen differenziellen Bias (∉ range(G)) als selbstüberwacht / ERKENNBAR; (§{ "0" }) die Vereinheitlichung besteht darin, dass DERSELBE blinde Teilraum range(G) die nicht erkennbare Fehlerklasse bestimmt, sodass die Datumseichung N(G) und der fehlerblinde Teilraum range(G) eine Geometrie sind, nicht zwei; (g7) slope liefert die Brown-Schutzlückensteigung ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ für einen Fehler b ∈ range(G) (Schätzer bei Parität null verfälscht) und endlich für einen erkennbaren Fehler

# text
seg-e0fd3860fce9 = Algebra des Paritätsprojektors / der Pseudoinversen in geschlossener Form auf dem repräsentativen realen DE440-Netz je Knoten: Die gemeinsame/differenzielle Aufteilung, die Vereinheitlichung N(G) ⊕ range(G) und die Schutzlückensteigung nach Brown ({ "1992" }) folgen alle aus der Auslöschung des Bildbereichs P⊥·G = { "0" }. Repräsentative modellierte Geometrie, kein zertifiziertes Schutzniveau

# text
seg-101b0551d987 = MTIE und TDEV für die Telekom-Zeitgebung auf einer Zeitfehlerreihe im Holdover

# text
# c1: telecom-timing
seg-b4762fd3cb9d = Der maximale Zeitintervallfehler und die Zeitabweichung, die das Szenario <c1/> auf einer Holdover-Aufzeichnung in Telekom-Größenordnung berichtet: eine MTIE mit gleitendem Fenster über eine monotone Warteschlange mit O(n) (telecom_timing::mtie_sliding, nötig, damit ein Tag mit Ein-Sekunden-Proben schnell bleibt) und die TDEV der Engine (allan::time_deviation), ausgewertet auf dem Raster, das die Art berichtet, und aus einem vollständigen Lauf zurückgelesen, der die Reihe einliest

# text
seg-59cb2711355c = allantools { "2024.06" } — eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters — mtie() und tdev() auf tests/fixtures/telecom_timing/holdover_te_series.csv, wobei die Reihe auf beiden Seiten aus demselben Text mit 17 signifikanten Stellen eingelesen wird; die Referenz hält die SHA-256 der Reihe fest und ist offline über tests/fixtures/telecom_timing/generate_telecom_timing_reference.py neu erzeugbar. Validiert die SCHÄTZER auf dieser Aufzeichnung, nicht das synthetische Holdover, das sie erzeugt hat

# text
seg-632add2dbd3c = ITU-T-Masken zur Telekom-Synchronisation mit PASS/FAIL und Marge

# text
# c1: telecom-timing
seg-47687529aee7 = Übertragene Grenzwerte von ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC gelockt und ePRTC-A Holdover (einschließlich der Zeitfehlerhüllkurve aus Tabelle { "3" }), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC Klassen A-D und G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) Referenzpunkt C, jeweils offenes oder geschlossenes Intervall, wie die Tabelle es angibt, wobei jeder Eintrag 'for further study' weggelassen ist; je Prüfung ein Urteil und eine Marge am bindenden Punkt sowie die Zeit bis zur Überschreitung jedes Budgets. Ausführbar als Szenarioart <c1/>

# text
seg-165ed2bc771a = ITU-T-Masken zur Wander-Erzeugung bei der Frequenzsynchronisation (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Sieben Wander-Erzeugungsmasken für MTIE und TDEV bei konstanter Temperatur für die Art <c1/>: G.811 (09/1997) PRC (autonom), G.812 (06/2004) Typen I, II und III, G.8262 (10/2024) EEC Optionen { "1" } und { "2" } und G.8262.1 (11/2025) eEEC (gelockter Modus), einschließlich der Potenzgesetz-Abschnitte, die die Tabellen schreiben (<c2/> und dergleichen), jeweils offenes oder geschlossenes Intervall wie gedruckt, gemessen durch das { "10" }-Hz-Filter, das die Abschnitte angeben (als vor dem Abtasten angewandt genommen); das Referenzszenario scenarios/telecom-synce-eec.toml stellt einen freilaufenden OCXO gegen die drei EEC-Masken. Nicht implementiert: die Zugaben bei veränderlicher Temperatur, Holdover, Transienten, Jitter und die Frequenzgenauigkeit nach G.811

# text
seg-ca16d9c98dc5 = Übertragung der genannten Empfehlungen (am 2026-10-13 von itu.int heruntergeladen), jede Zeile gegen den Text neu gelesen, wobei die Stetigkeit an den Knickpunkten, die die gedruckten Koeffizienten implizieren, in den Tests begrenzt wird (zum Beispiel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns gegenüber dem Plateau von { "100" } ns in G.812 Tabelle { "4" }). Eine Übertragung von Normen mit internen Konsistenzprüfungen, kein Konformitätstest und keine externe Validierung. G.812 (06/2004) ist als durch eine vorab veröffentlichte Ausgabe 08/2026 ersetzt aufgeführt, und G.811 hat ein Amd. { "1" } (04/2016); keines von beiden konnte gelesen werden, daher ist keines geprüft. Das Szenario mit freilaufendem OCXO überschätzt den Beitrag des Oszillators bei Beobachtungsintervallen, die lang gegenüber der Zeitkonstante einer Regelschleife sind; es sagt nichts über irgendeine Geräteuhr aus

# text
seg-5fc2ad88faf0 = Uhrprotokoll-Formate (RINEX-Uhr, TimeLab ASCII, TAPR TICC), eingelesen zu einer normalisierten Phasenreihe

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: eine Parser-Schicht, die eine RINEX-Uhrdatei (AS/AR-Datensätze einer benannten Uhr, Versionen { "2" } und { "3.00" } bis { "3.04" }), ein Phasen- oder Frequenzprotokoll im ASCII-Format von TimeLab oder ein Zeitstempel- oder Intervallprotokoll von TAPR TICC in ein einheitliches Phasenraster überführt, mit angegebenem, aus einem Header entnommenem oder als Median der Abstände bestimmtem tau0, wobei jede Lücke, jeder Wert neben dem Raster und jedes Duplikat gezählt wird, und mit einer Lückenregel aus Ablehnen, längster Lauf oder linear; als Option in die Reihe der Telekom-Zeitgebung (<c1/>, mit einem zusätzlichen Block <c2/>) und die Uhrart (<c3/>, mit einem zusätzlichen Block <c4/> mit ADEV, TDEV und MTIE, der SHA-256 der Tabelle und der SHA-256 der Phase; runs = { "1" }) eingebunden. Ohne die Tabelle sind beide Arten byteidentisch

# text
seg-acdb0337bce7 = Uhrprotokoll-Formate linuxptp (ptp4l, phc2sys, ts2phc) und chrony (tracking, statistics), eingelesen zu einer normalisierten Phasenreihe

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input mit den Formaten ptp4l, phc2sys, ts2phc, chrony-tracking und chrony-statistics: Der protokollierte Versatz einer linuxptp-Servozeile (ns, der eigene eingeklammerte Zeitstempel der Zeile, Messwerte vor der ersten Meldung s2 des Servos ausgelassen und gezählt) oder eines chrony-Protokolls tracking oder statistics (s, nach Spaltenposition, UTC-Datum und -Uhrzeit) wird über dieselben Lückenregeln wie bei den anderen Formaten zu einem einheitlichen Phasenraster; ein Quellenwähler (<c1/>) benennt eine von mehreren Schnittstellen, Uhren oder Adressen; die Protokolle speisen die Reihe der Telekom-Zeitgebung, die Uhrart und die Art des Holdover-Tests

# text
seg-fb9393044576 = Für Kshana geschriebene Fixtures nach den öffentlichen Zeilenlayouts der Daemons mit erfundenen Werten (NOTICE.md im Fixture-Ordner); es wurde kein Protokoll einer realen Installation gelesen, und kein Orakel vergleicht das Parsen mit einem anderen Leser, sodass ein Layout, das sich zwischen Daemon-Versionen unterscheidet, immer noch abgelehnt oder falsch gelesen werden kann. Die von der Phasenreihe gespeisten Schätzer sind die, die in den obigen Zeilen gegen allantools validiert sind

# text
seg-97aebb84576e = Holdover-Test, bewertet aus einer vom Betreiber gelieferten Zeitfehleraufzeichnung

# text
# c1: holdover-test
seg-ab533cf99c56 = Die Art <c1/>: Eine Zeitfehleraufzeichnung (ein Uhrprotokoll von linuxptp, chrony, TICC, TimeLab oder RINEX, oder Paare time_s,time_error_ns) wird an den beiden Zeitpunkten, die der Betreiber für die Entfernung und die Wiederherstellung von GNSS angibt, in einen Basislinien-, einen Holdover- und einen Erholungsschritt zerlegt; die Basislinie wird an den ITU-T-Masken für eine gelockte Uhr gemessen, das Holdover an denen für Holdover oder eine autonome Uhr, an der ePRTC-A-Holdover-Hüllkurve und an den Zeitfehlerbudgets; das Holdover berichtet den Frequenzversatz nach kleinsten Quadraten, den das System gehalten hat, und die Erholung, ob und wann |TE| in ein angegebenes Band kam und für eine angegebene Verweildauer darin blieb, mit dem Spitzenwert und dem größten Sprung. Jeder Grenzwert ist der, den die Art telecom-timing überträgt; die beiden Zeitpunkte sind die Angabe des Betreibers und werden nicht verifiziert

# text
seg-a54380cf95ea = Handrechnung auf Aufzeichnungen, die aus Formeln aufgebaut sind, deren Steigung, Sprung, Extremum und Erholungszeit vor dem Lauf bekannt sind (die Tests geben sie an), und die Masken, die Hüllkurve und die Budgets der obigen Zeilen zur Telekom-Zeitgebung. Es wurde keine Labormessung eines realen Holdovers bewertet und kein externes Orakel verglichen, sodass die Art keine Aussage über irgendeine Uhr oder ein System macht; ein Zeitgebungslabor als Partner ist nötig, bevor irgendeine Zahl je Uhrklasse hochgestuft werden könnte

# text
seg-94cbac97a1aa = Verfügbarkeit von GNSS-Signalen im Space Service Volume und darüber hinaus, verglichen mit dem ICG-SSV-Heft

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Die Verfügbarkeitsdurchläufe der Art <c1/>: je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und kombiniert, der Anteil der Paare (Nutzer, Epoche) mit mindestens einem und mit mindestens vier Signalen und der längste Ausfall, für einen Nutzer auf einer Kugel (die globale Schale des Hefts mit 2,562 Punkten, { "14" } Tage bei { "1" } Minute) oder auf einer Trajektorie (GEO, HEO, Mondtransfer), aus den Kepler-Bahnen von Anhang C des Hefts, einer konstanten minimalen Strahlungsleistung innerhalb des Referenzwinkels außerhalb der Boresight, einer Abschattung durch die Erde als Kugel plus { "50" } km und einer C/N0-Schwelle; Nutzerantennen aus Tabelle B10 des Hefts

# text
seg-d71c9d361342 = Das Heft zum ICG Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), selbst eine Simulation, verglichen unter einer Vorregistrierung, die vor dem Lauf eingecheckt wurde (xval/gnss-ssv/PREREGISTRATION.md; Ergebnisse in xval/gnss-ssv/RESULTS.md, festgehalten durch tests/ssv_booklet_results.rs, Verfehlungen eingeschlossen). Lauf { "1" } mit der vorab registrierten Lesart: Die Konstanten der minimalen Strahlungsleistung und der Mondzielwert stimmen überein (S0, S6 erreicht); die Zielwerte für oberes und unteres SSV, RF-Schwelle, GEO und HEO sind NOT MET, fast alle durch GLONASS, für das das Heft { "20" } und { "28" } Grad in den Tabellen B2 und B6 und { "26" } und { "34" } Grad in Tabelle { "4.2" } angibt. Eine Diagnosevariante mit den Winkeln aus Tabelle { "4.2" } stimmt in jeder Zelle des oberen SSV, des unteren SSV und der sechs GEO-Missionen überein (sie ersetzt Lauf { "1" } nicht; Zellen für RF, HEO und Mond verfehlen weiterhin). Die gemessenen Antennendiagramme der GPS-L1-Panels werden vom parametrischen Ersatz nicht reproduziert (RMS { "6" } bis { "9" } dB gegenüber einem Zielwert von { "3" } dB). Die Übereinstimmung zeigt, dass die angegebene Methode des Hefts reproduziert wird, nicht dass sich GNSS-Signale so verhalten

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Effekte von Ionosphäre, Plasmasphäre und Atmosphäre auf streifende GNSS-Signale entlang von Randstrahlen sowie der Entwurf des Empfängers für schwache Signale in der Art <c1/>

# text
seg-1a1786ba90b6 = Eine Chapman-Ionosphäre, eine Plasmasphäre vom Gallagher-Typ und eine neutrale Atmosphäre (Brechungsbiegung, Sauerstoffabsorption, Defokussierung), integriert entlang des geraden Strahls zwischen Sender und Nutzer: schräger Gesamtelektronengehalt, sein plasmasphärischer Anteil, Zusatzverzögerung, Tangentenhöhe und der Verlust auf streifenden Strecken; und ein Empfängerentwurf für schwache Signale (kohärente und nichtkohärente Integration, Datenbitgrenze, Stützung, Dopplersuche), der die C/N0-Schwelle aus den Modellen von Erfassung und Tracking-Schleife festlegt

# text
seg-4ca1217472ab = Geschlossene Formen und veröffentlichte Größenordnungen in den Tests (der Scheitel einer Chapman-Schicht und die Biegung am Oberflächenrand, einige TECU Plasmasphäre auf einem Strahl von GPS zu GEO); der Empfängerentwurf verwendet die Modelle von Erfassung und Tracking-Schleife und deren Tests wieder. Es werden keine gemessenen Daten von Randsondierung oder Empfang schwacher Signale damit verglichen

# text
seg-6b8f9f3ca2a3 = GNSS-Navigationsfilter an Bord für Raumfahrzeuge in hohen Umlaufbahnen und im Mondtransfer

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Der Modus <c2/> der Art <c1/>: ein Extended-Kalman-Filter mit neun Zuständen (Position, Geschwindigkeit, Empfängeruhr-Bias und -Drift, ein Maßstab des Strahlungsdrucks der Sonne) auf Pseudoentfernungen, deren Verfügbarkeit, Rauschen und C/N0 aus derselben Streckengeometrie wie die Durchläufe stammen; die Wahrheit wird mit J2, Dritt-Körper-Wirkung von Sonne und Mond und Strahlungsdruck mit Schatten integriert, das Filter modelliert J2 und die dritten Körper und schätzt den Strahlungsdruck; berichtet Positions- und Geschwindigkeitsfehler innerhalb und oberhalb der GNSS-Bahnen, die längste Messlücke und das mittlere NEES

# text
seg-469602656ab4 = Simulierte Wahrheit gegen die eigene Schätzung des Filters (der mittlere normalisierte quadrierte Schätzfehler eines konsistenten Filters beträgt für die Position etwa { "3" }) und Determinismus bei festem Seed. Es werden keine Flugdaten oder aufgezeichneten GNSS-Daten aus hohen Umlaufbahnen verglichen; Sonne und Mond sind kreisförmige Ersatzmodelle geringer Genauigkeit

# text
seg-5fc242476828 = Relative Navigation eines Formationsverbunds mehrerer Raumfahrzeuge in einer stark elliptischen Umlaufbahn aus GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Der Modus <c2/> der Art <c1/>: Ein Chief und Deputies führen je das absolute Filter aus; die Position des Deputy relativ zum Chief wird durch Subtraktion der absoluten Schätzungen und durch ein relatives Filter auf einfach differenzierten Pseudoentfernungen der Signale geschätzt, die beide Fahrzeuge verfolgen, wobei die relative Dynamik die Differenz zweier nichtlinearer Trajektorien ist

# text
seg-69c078b57fc8 = Dieselbe simulierte Wahrheit wie beim absoluten Filter: der Fehler des relativen Filters gegen den wahren relativen Zustand und die Prüfung, dass es mindestens so gut abschneidet wie die Subtraktion zweier unabhängiger absoluter Lösungen. Es werden keine Flugdaten einer Formation verglichen

# text
seg-7038f6902820 = Fehlerterme des Kaltatom-Interferometers: Phasenrauschen des Raman-Lasers, Bias durch Wellenfrontkrümmung und Auflösung der Streifenmehrdeutigkeit

# text
seg-4d9690207607 = inertial::cai_error_terms (Bibliotheksfunktionen, noch nicht aus einer Szenarioart erreichbar): die Gewichtsfunktion der Raman-Phase eines Drei-Puls-Interferometers mit Rechteckpulsen (Cheinet et al. { "2008" }, Gl. { "8" }) mit der geschlossenen Form für weißes Phasenrauschen (pi/2)^{ "2" } S_phi0/tau_R und einem numerischen Weg für jedes Spektrum; das Laser-Frequenzrauschen, das die Verzögerung der Retroreflexion nicht aufhebt (Le Gouet et al. { "2007" }, Gl. { "9" } bis { "11" }); der reine Defokus-Wellenfront-Bias sigma_v^2/R einer thermischen Wolke und seine Verringerung durch einen Detektionsradius; die Wahrscheinlichkeit eines falschen Streifenindex erfc(pi/(sqrt({ "2" }) s)) für eine Stützung durch einen klassischen Beschleunigungsmesser und für zwei Abfragezeiten, und ihre Inverse

# text
seg-a7b220763674 = Jede geschlossene Form gegen einen unabhängigen numerischen Weg in den Tests (Frequenzbereichs-Quadratur der exakten Übertragungsfunktion und des Verzögerungsfilters, eine Monte-Carlo-Rechnung über Atome für den Wellenfront-Bias, eine Monte-Carlo-Rechnung über Schüsse für den Streifenindex) und ihre Grenzfälle. Ein veröffentlichter durchgerechneter Wert: Cheinet et al. { "2008" } (arXiv:physics/0510197, Abschn. IV) geben an, dass bei tau_R = { "20" } us ein weißes Raman-Phasenrauschen unter -111 dB rad^2/Hz für { "1" } mrad je Schuss nötig ist; der weiße Term allein ergibt { "0.99" } mrad (die Veröffentlichung leitet den Pegel mit ihrer Gl. { "17" } her, Flicker plus weiß). Interne Konsistenz und ein durchgerechneter Wert, keine externe Validierung; Aberrationen höherer Ordnung und das Rauschen eines bestimmten Lasers sind nicht modelliert

# text
seg-c380ec16a4f8 = Exakte äquivalente Freiheitsgrade nach Greenhall und Riley für die Allan-Varianz, die modifizierte Allan-Varianz und die Hadamard-Varianz

# text
seg-dee2a54c5019 = allan::edf_greenhall (mit den Wrappern edf_greenhall_adev, _mdev und _hdev): der vollständige Algorithmus von Greenhall und Riley, Proc. 35th PTTI ({ "2003" }), Abschnitt { "3" } (Gln. { "7" } bis { "13" } und die Koeffizienten für großes J aus den Tabellen { "1" } bis { "3" }), für Differenzordnungen { "1" } bis { "3" }, Rauschexponenten +{ "2" } bis -4, wo immer alpha + 2d > { "1" } gilt, überlappend und nicht überlappend, modifizierte und unmodifizierte Schätzer; NaN, wo er nicht anwendbar ist, einschließlich des unmodifizierten Falls weißes PM mit ceil(M/S) <= d, dessen geschlossene Form nicht implementiert ist. assurance::uncertainty::edf teilt sich jetzt den Code und behält seine Ausgaben bitgenau bei

# text
seg-363705e03bac = Holdover-Voreinstellungen für Oszillatoren aus öffentlichen Datenblättern

# text
seg-9750d9e0ec7a = Vier Voreinstellungen — OCXO (Microchip OX-208), Rubidium (Microchip 8040C), Cäsium (Microchip 5071A Hochleistungsröhre) und CSAC (Microchip SA.45s) — jede mit den Maxima der Allan-Abweichung, der Alterung und der Temperaturgrenze ihres Datenblatts; eine Anpassung des Frequenzrauschens aus weiß + Flicker + Random Walk nach nichtnegativen kleinsten Quadraten, skaliert so, dass sie jeden Datenblattpunkt umhüllt, ein Flicker-Boden nie unter dem Wert für das längste τ, lineare Alterung und ein sinusförmiger Temperaturterm, synthetisiert als Holdover mit Seed nach einem GNSS-Verlust

# text
seg-69f93d5ec864 = Holdover-Vorhersage aus einer gemessenen Uhraufzeichnung, geprüft an zurückgehaltenen Daten

# text
# c1: slot-timing
seg-8bdc5a24c66d = Der Pfad der gemessenen Aufzeichnung der Art <c1/>: die überlappende Allan-Abweichung einer Phasenaufzeichnung, angepasst durch nichtnegative kleinste Quadrate mit edf-Gewichtung in der Basis aus weißer Phase und Frequenzmodulation nach IEEE Std { "1139" } (slot_timing::fit_weighted), dann invertiert für die Auslaufzeit, zu der der Zeitfehler eine Schwelle erreicht (slot_timing::slot_budget). Der Boden des roten Rauschens wird aus der Aufzeichnung gemessen statt angenommen

# text
seg-c888226296fe = Eine reale freilaufende Atomuhr: { "556 990" } Ein-Sekunden-Phasenproben eines Cäsiumnormals 5071A, gemessen gegen einen Wasserstoffmaser (A. Wallin, mit allantools verteilt; festgelegter Commit und SHA-256 in scripts/fetch_cs5071a.sh), dieselbe Aufzeichnung, die tests/cs5071a_reference.rs für die Schätzer verwendet. Die zurückgehaltenen zwei Drittel sind eine externe Messung, die die Vorhersage nie gesehen hat. Datenabhängig: Der Workflow realdata-clock holt die Aufzeichnung und führt den Test mit KSHANA_REQUIRE_REALDATA={ "1" } aus. Validiert den Pfad aus Anpassen und Invertieren an einem von weißem FM dominierten Atomnormal über Auslaufzeiten bis etwa { "50 000" } s; nicht die Quellen aus Datenblatt oder Klasse, nicht die deterministischen Terme. KEIN Quarzoszillator: Bei einer gemessenen OCXO-Aufzeichnung (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h gegen einen Wasserstoffmaser) ist die Vorhersage mit zurückgehaltenen Daten konservativ, bei { "0.59" } bis { "0.70" } der gemessenen Überschreitung, und liegt überwiegend außerhalb des Zielwerts, weil sich der Rauschboden dieses Oszillators während der Aufzeichnung halbiert hat; in der Stichprobe liegt sie bei { "0.98" } bis { "1.17" }. Der Fall des Quarzes bleibt MODELLED. Auch KEINE Atomuhren im Orbit: Bei { "10" } GPS-Block-IIF-Satellitenuhren (tests/slot_timing_igs_holdout.rs, finale IGS-Uhren mit { "30" } s, { "14" } Tage, Protokoll vor dem Download geschrieben) liegen { "8" } innerhalb des Zielwerts, und { "2" } (G25, G30) sind um bis zu etwa 2x optimistisch, sodass der Fall im Orbit unter dem Protokoll MODELLED bleibt

# text
seg-d7e03158b972 = Sekunden, bis eine freilaufende Uhr den Schutzabstand eines zeitindizierten Slots verlässt, und die Fix-Kadenz, die sie darin hält

# text
# c1: slot-timing
seg-0b4d8815f756 = Die Art <c1/>: der vorhergesagte Fehler E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t², invertiert für die Überschreitung, die verbleibende Zeit, das Resynchronisationsintervall abzüglich der Fix-Latenz und Fixes pro Tag, wobei jeder Term einzeln ausgewiesen und der dominante benannt wird; Uhren aus den sechs Standardwerten von ClockClass (TCXO, OCXO und RAFS hinzugefügt, je mit Verweis auf ein Datenblatt), den Voreinstellungen der Telekom-Zeitgebung, einem Inline-Datenblatt oder einer gemessenen Aufzeichnung; eine Überschreitung jenseits der längsten Mittelungszeit der Quelle wird als extrapoliert gekennzeichnet

# text
seg-cc0464060e58 = Geschlossene Formen für jeden Term allein und die unabhängige Nullstellensuche holdover::holdover_seconds; die Datenblattwerte sind die benannten Dokumente (docs/SLOT-TIMING.md). Ein Klassenstandard beruht auf einem angenommenen Boden des roten Rauschens und eine Datenblattquelle ist eine Hüllkurve von Maxima, sodass keines von beiden eine Messung einer Einheit ist

# text
seg-65a8361b4a22 = Auswertung des Jammertests: ein Empfängerprotokoll, bewertet je geplantem Test (Erkennungslatenz, verpasste Alarme, Fehlalarme, Erholungszeit) anhand des veröffentlichten Testplans

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): der NPRA-Testkatalog und Sendeplan (MIT, mit festgeschriebenem SHA-256 abgerufen, nie eingebunden) wird als geplante Wahrheit gelesen, die Katalog-IDs bleiben erhalten; ein receiver-trust-Lauf wird je Test bewertet (erster Alarm minus geplanter Beginn, erkannt/verspätet/verpasst gegen eine Toleranz, Zeit bis zum ersten alarmfreien Abschnitt, Alarme außerhalb jedes Zeitfensters und seines Schutzintervalls), mit einem signierten Nachweispaket, das die Bewertungstabelle enthält. Der Plan besteht aus geplanten Zeitfenstern, nicht aus aufgezeichneten Sendezeiten

# text
seg-0d227bbcb5f1 = Prüfstandsexport (kshana bench-export): erdfeste, geodätische und lokale Geschwindigkeitsspalten, Lagespalten und NMEA-{ "0183" }-Ausgabe

# text
seg-c6a6e08afadd = Die erdfeste Position, die geodätische Position, die erdfeste Geschwindigkeit, die Spalten für Kurs/Nick/Roll und UTC der Bewegungs-CSV sowie die NMEA-Sätze GGA/RMC, geschrieben aus synthetischen Szenarien (gnss-ins einschließlich automotive-urban-canyon, jamming, gnss-sim). Nur Bewegung und Ereignisse; es wird kein Signal geschrieben, und es wird keine Leistung eines Simulators oder Empfängers behauptet.

# text
seg-f953ad11fe08 = WAS EXTERN GEPRÜFT WIRD, eng gefasst: gegen pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } und scipy { "1.18.1" }, ausgeführt von scripts/gen_testbench_ref.py an { "4" } synthetischen Szenarien, mit vor dem ersten Vergleich festgelegten Toleranzen (jeweils der ungünstigste Rundungsfall des Schreibers): Die erdfesten Spalten entsprechen in jeder Zeile der WGS-{ "84" }-Umrechnung der geodätischen Spalten (schlechtester Wert { "1.3e-4" } m, Zielwert { "3e-4" }) und umgekehrt ({ "1.3e-9" } Grad, Zielwert { "2e-9" }; Höhe { "1.3e-4" } m, Zielwert { "3e-4" }); die mit der topozentrischen Operation von PROJ nach Nord-Ost-Unten gedrehte erdfeste Geschwindigkeit entspricht der wahren NED-Geschwindigkeit der Engine ({ "7.5e-5" } m/s, Zielwert { "2e-4" }); Kurs, Nick- und Rollwinkel entsprechen dem Gier-Nick-Roll-Winkel, den scipy aus dem wahren Quaternion der Engine berechnet ({ "5.0e-7" } Grad, Zielwert { "1e-6" }); jeder NMEA-Satz wird von pynmea2 mit gültiger Prüfsumme geparst, und seine dekodierte Position ({ "1.2e-3" } m, Zielwert { "5e-3" }), Höhe, Geschwindigkeit, Kurs über Grund ({ "5.0e-4" } Grad, Zielwert { "1e-3" }) und Zeit entsprechen den Bewegungswerten; die UTC-Spalte entspricht einer unabhängigen Datums- und Zeitrechnung. Der SHA-256 der genau geprüften CSV- und NMEA-Bytes ist festgeschrieben. WAS NICHT: die Wahrheitstrajektorie des Szenarios selbst (das Fahrprofil und seine Integration); die Konventionen (der Kurs ist der Gierwinkel des Körpers, nicht der Kurs über Grund, und weicht auf automotive-urban-canyon um bis zu etwa { "77" } Grad davon ab; GGA-Qualität, Satellitenanzahl und HDOP sind Platzhalter); ob ein Laborsimulator die Dateien wie vorgesehen liest; jede Leistung eines Simulators oder Empfängers. Die unabhängigen Referenzen prüfen Umrechnungen und Kodierungen, nicht die Physik des Szenarios. Die Behandlung des lokalen Bezugssystems wird nur über die Geschwindigkeitsdrehung sowie Geschwindigkeit und Kurs über Grund der NMEA-Sätze geprüft (die CSV hat keine lokale Positionsspalte).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): eine Zuordnung von Kshana-Ausgaben zu Abschnitten öffentlicher Regelwerke allein nach Nummer, befüllt aus den angegebenen Läufen; ein Ergebnis zählt nur dann für eine Fähigkeit, wenn es den Nachweis trägt, den die Zuordnung nennt, eine leere Menge belegt nichts, und die Formulierung lautet „liefert Belege für"; der Bericht ist weder eine Feststellung, dass ein Regelwerk erfüllt ist, noch eine Bewertung oder Zulassung durch irgendjemanden.

# text
seg-8659260fd38e = Referenzen geprüft gegen einen per Skript extrahierten Überschriftenindex der zitierten öffentlichen Dokumente, gelesen am 2026-10-10 (tests/compliance_references.rs). WAS GEPRÜFT WIRD: { "49" } zitierte Verweise auf Abschnitte, Absätze oder Überschriften existieren im zitierten Dokument, und { "7" } zitierte URLs ließen sich am vermerkten Datum auflösen ({ "2" } über einen zweiten Weg); negative Kontrollen schlagen fehl. WAS NICHT: dass eine Paraphrase, Zuordnung oder Lücke korrekt ist; die Abschnitte von EN { "16803" } (kostenpflichtig, nur Katalogtext); spätere Revisionen; der Index ist keine unabhängige Implementierung.

# text
seg-98c360d82d56 = Marine-Integrationen: Signal-K-Plugin, OpenCPN-Gate-Stream und Bewertungsfeld, Referenzaufbau

# text
seg-7af9ce566646 = Der Vertrauenswert, das Band, die Gründe, der Gate-Zustand und die vom Empfänger gemeldete Position, veröffentlicht unter navigation.gnss.kshana in einem Signal-K-Server mit einer Warn-, Alarm- und Normalmeldung (integrations/signalk); der gefilterte NMEA-Stream, bei dem der Fix bei eingebrochenem Vertrauen als ungültig markiert wird und je Zyklus ein PKSHT-Satz folgt, über TCP vom Gate selbst oder von einem kleinen Relay an OpenCPN geliefert, und ein natives OpenCPN-Bewertungsfeld, das den PKSHT-Satz liest (integrations/opencpn); sowie systemd-Units und ein Container, die das Gate betreiben (deploy/reference-build). Wo diese eine Ausgabe zeigen, tragen sie den Hinweis: Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-00a0f52f7458 = WAS GEPRÜFT WIRD, eng gefasst: dass diese Integrationen mit der realen Software funktionieren, für die sie geschrieben sind. DER NACHWEIS liegt in integrations/signalk/evidence/README.md (mit den zugehörigen JSON-Dateien) und integrations/opencpn/evidence/README.md (mit den Screenshots und Protokollen) und ist jeweils mit dem Skript committet, das ihn reproduziert. ({ "1" }) Signal K: das Plugin, geladen in das festgelegte npm-Paket signalk-server { "2.33.0" }, in einem privaten, nur über Loopback erreichbaren Netzwerk-Namensraum, gespeist mit synthetischen Daten. Die eigenen REST- und WebSocket-Schnittstellen des Servers zeigten die veröffentlichten Pfade, die Metadaten der Bewertung und eine Meldung, die von abwesend über warn, alarm, normal (nach der Haltezeit) wieder auf warn wechselte, als die Daten ausblieben. Mit dem echten, vom Plugin ausgeführten kshana auf den NMEA-Daten, die der Server selbst empfing, ging die Meldung von warn auf alarm, und die gemeldete Position wurde veröffentlicht; die eigene navigation.position des Servers wurde von seinem NMEA-Provider geschrieben, nie vom Plugin. Erneut ausgeführt gegen das Live-JSON-Schema { "1.2" }. ({ "2" }) OpenCPN: das Plugin, gebaut gegen den Header der OpenCPN-Plugin-API und wxWidgets { "3.2.4" }, geladen in das Ubuntu-{ "24.04" }-Paket von OpenCPN { "5.8.4" } unter einem virtuellen Display; OpenCPN lud es, führte seine Initialisierung aus und übergab ihm die PKSHT-Sätze des gefilterten Streams, und das Feld wurde im nicht vertrauenswürdigen Band rot. In einem sauberen Lauf hörte die eigene Schiffsposition von OpenCPN auf, sich zu aktualisieren, und seine Fix-Anzeige fiel ab, als das Gate den Fix als ungültig markierte. Ein zweiter Lauf, direkt vom TCP-Listener des Gates gespeist, zeigte die Zustellung an das Plugin, aber kein sauberes Vorher-Nachher. ({ "3" }) Die Relay-Tests spielen einen aufgezeichneten Ausschnitt des gefilterten Streams über einen echten TCP-Socket ab und prüfen, was ein Verbraucher empfängt (die Bytes unverändert, gültige Prüfsummen bei jedem Satz einschließlich der umgeschriebenen, GGA und RMC stimmen überein, ein PKSHT je Zyklus mit dem Gate-Feld, wo der Fix ungültig ist), und das Ende-zu-Ende-Skript prüft, dass ein Verbraucher des Listeners des Gates genau die Bytes empfängt, die dasselbe Gate auf die Standardausgabe schreibt. ({ "4" }) Die PKSHT-Parser (JavaScript und C++) laufen über aus der kshana-Ausgabe aufgezeichnete Sätze und weisen eine falsche Prüfsumme, eine falsche Version oder eine Bewertung außerhalb von { "0" } bis { "100" } zurück. ({ "5" }) Die systemd-Units werden mit systemd-analyze verify (systemd { "255" }, Binärdateien durch Stubs ersetzt) und mit Prüfungen auf eine Shell in ExecStart, die Neustartrichtlinie und die Sandbox-Schlüssel geprüft; die Argumentbehandlung des Container-Entrypoints wird mit einer Stub-Binärdatei geprüft. WAS NICHT: Für keinen der Werte, die diese Integrationen anzeigen, gibt es eine externe unabhängige Referenz. Die Vertrauenswerte selbst sind die Zeilen oberhalb, und ein Lauf einer Integration zeigt nur, dass die Verkabelung sie weiterreicht; deshalb ist diese Zeile MODELLED und nicht VALIDATED (docs/VALIDATION.md). Es wurden kein reales Schiff, kein realer Empfänger, kein langer Lauf, keine andere Version eines der beiden Hosts, kein anderes Betriebssystem und keine andere Desktop-Umgebung verwendet; alle Daten sind synthetischer Text, und nichts davon ist eine Messung. Die akustische und visuelle Behandlung der Meldung durch einen echten Signal-K-Client, die Symbolleistenschaltfläche von OpenCPN, die Einstellungen und der veraltete Zustand sowie die Paketierung für den OpenCPN-Plugin-Manager wurden nicht erprobt. Die systemd-Sandbox-Schlüssel wurden nur auf Syntax geprüft, nicht unter einem laufenden systemd ausgeführt, und für den Bau des Container-Images und seine Gesundheitsprüfung liegt hier kein committeter Nachweis vor. Es wird keine Erkennungs- oder Fehlalarmzahl behauptet. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-89ab9ef155eb = BOC({ "1,1" })-Tracking: DLL-Skalierung und Auflösung der Bump-Jump-Mehrdeutigkeit (optional)

# text
seg-ef24be9b5917 = Das Feld boc von iq::track::LoopConfig (optional, standardmäßig None): die drei DLL-Diskriminatoren, neu skaliert, sodass sie den Codefehler in Chips mit Steigung eins am Hauptmaximum des Sinus-BOC({ "1,1" }) anzeigen, und ein Bump-Jump-Monitor auf sehr frühen und sehr späten Korrelatoren im Abstand einer halben Subträgerperiode ({ "0.5" } Chip), der den Code-NCO zum Hauptmaximum springen lässt, wenn ein Auf-/Abwärtszähler N erreicht ({ "8" } standardmäßig). Ohne die Option bleibt jede Ausgabe unverändert.

# text
seg-2c32955cbfb3 = IQ-Kanal für ionosphärische Szintillation (Cornell-Modell) gegen gemessene GPS-L1-Szintillation mit { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, das Cornell-Szintillationsmodell (Rice-Intensität, Butterworth-Spektrum zweiter Ordnung, Phase arg z), betrieben mit dem S4 und der Intensitäts-Dekorrelationszeit eines gemessenen Fensters und verglichen anhand dessen, was es über diese beiden Eingaben hinaus erzeugt; realdata::scint50 liest das Messprotokoll, entfernt den Trend und führt den Vergleich aus.

# text
seg-160507ac3702 = Cell-averaging-CFAR-Option in der IQ-Akquisition

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar und ca_cfar_cells (optional): Eine Zelle eines Akquisitionsrasters wird mit dem Mittelwert von Referenzzellen ihrer Doppler-Zeile verglichen (Schutz- und Schrittlags, die um die Periode herum umbrechen), mit einem Faktor alpha, der aus der geschlossenen Formel der CA-CFAR-Fehlalarmwahrscheinlichkeit für M nichtkohärente Blöcke festgelegt wird (ca_cfar_pfa, ca_cfar_alpha). Der Detektor auf Basis der Stichprobenleistung bleibt der Standard, und jede bestehende Ausgabe bleibt unverändert.

# text
seg-5bd3bf0c22a7 = Spektrummodell: GLONASS-, BeiDou- und Galileo-E6-Bänder (optional)

# text
seg-9c16189c63ac = spectrum::default_band löst allein über den Namen (MORE_BAND_NAMES) auf: GLONASS L1OF und L2OF auf jedem FDMA-Kanal K = -7 bis { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a und B3I (BPSK({ "10" })) sowie Galileo E6 (BPSK({ "5" })), mit den Trägern und minimalen Empfangsleistungen aus ihren Schnittstellenkontrolldokumenten; die Standard-Bandmenge und jede bestehende Ausgabe bleiben unverändert.

# text
seg-63b7da996265 = Primäre BeiDou-B1I-Entfernungsmesscodes gegen einen unabhängigen Generator

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits und b1i: die Gold-Codes nach BDS-SIS-ICD-B1I-3.0, auf { "2046" } Chips gekürzt, PRN { "1" } bis { "63" }, wie die IQ-Schicht sie erzeugt, akquiriert und verfolgt.

# text
seg-b4787b04338e = GPS-L1C-Entfernungsmess- und Überlagerungscodes gegen die gedruckten Prüfspalten von IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits und l1c_o_bits: die Weil-Entfernungsmesscodes L1CP und L1CD (berechnete Legendre-Folge, Weil-Index, vor Chip p eingefügte Erweiterungsfolge) und die S1-Überlagerungscodes L1CO, PRN { "1" } bis { "63" }.

# text
seg-5cba09089e09 = Primäre LunaNet-AFS-I- und AFS-Q-Codes gegen die gedruckten Prüfspalten von LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits und afs_q_primary_bits (Signalnamen lunanet-afs-i und lunanet-afs-q in kshana iq): der AFS-I-Gold-Code ({ "2047" } auf { "2046" } kurzgezykelt, G2 je PRN verzögert) und der primäre AFS-Q-Weil-Code (berechnete Legendre-Folge, Weil-Index, vor Chip p eingefügte Erweiterungsfolge), PRN { "1" } bis { "210" }.

# text
seg-7b1ae0c7ca28 = LunaNet-AFS-Tertiärcodes und Nachrichtenschicht (SB1-BCH, CRC-24Q, Interleaver) gegen LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: Synchronisationsmuster, SB1-BCH({ "51,8" })-Kodierer und Dekodierer mit 256 Hypothesen, CRC-24Q, der Blockinterleaver { "60" } x { "98" }, ein Symbolstrom-Prüfer (kshana lunanet-afs-check) und ein Teststrom-Generator mit Platzhalter-Subframes. Die LDPC-Kodierung mit Rate 1/2 der Subframes { "2" } bis { "4" } ist nicht implementiert (ihre Matrizen stehen in einem separaten Anhang).

# text
seg-0d7b17524c04 = Standardpakete: Szenarien, bewertet gegen Zielwerte, die vor dem Lauf festgelegt wurden

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): die Testprofile des DHS-Rahmenwerks Resilient PNT für die Stufen { "1" } bis { "4" }, die Genauigkeitsstufen und die Integritätsbewertung nach IMO MSC.1/Circ.1575 sowie die Pakete Überwachen, Bewerten und Abmildern nach ICAO Doc { "9849" } Anhang F: Jeder Test führt eine mitgelieferte Szenarioart aus und vergleicht Ergebnisfelder mit den im Paket angegebenen Zielwerten, und Tests, die ein Empfängerprotokoll benötigen, werden als NEEDS INPUT aufgeführt und nicht bewertet.

# text
seg-8a8f2c85e0c3 = Nachweispaket der Labor-Rundreise (Szenario, Testbedingungen, Empfängerprotokoll, Bewertung)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) und der Empfängerprotokoll-Export kshana.test-conditions/1 von kshana bench-export: ein signiertes Paket, das den Szenario-Hash, den Hash der angegebenen Bedingungen, den Hash des Protokolls und die Bewertung gegen die angegebenen Ereignisse festhält und Bedingungen zurückweist, die den Bewertungsereignissen widersprechen, oder ein Protokoll, dessen Hash nicht der angegebene ist. Es wird kein Signal geschrieben, abgespielt oder eingeplant.

# text
seg-a9189e4fe413 = IQ-Tracking-Engine gegen GNSS-SDR { "0.0.19" } an unabhängigen Aufzeichnungen

# text
seg-364de05e5b1b = Die vollständige Tracking-Engine der IQ-Schicht (iq::track über kshana iq track: Akquisitionsübergabe, Korrelatoren, NCOs, Costas-PLL zweiter Ordnung mit { "15" } Hz, trägergestützte DLL erster Ordnung mit { "2" } Hz und EML-Hüllkurve, Lock-Indikator und C/N0-Schätzer) auf GPS L1 C/A bei { "30" } bis { "45" } dB-Hz.

# text
seg-259d201c2ff8 = CRPA-Antennengewinne in der Art jamming gegen eine unabhängige numpy-Neuberechnung

# text
seg-192144c57783 = Der optionale Abschnitt [crpa] der Art jamming: ein Strahl je Kanal zu jedem Satelliten (Nullsteuerung mit dem Jammer als Nullstelle, oder MVDR auf sigma^{ "2" } I + P_j a_j a_j^H), der das Rauschen jeder Verbindung mit ||w||^{ "2" } und den Jammer mit |w^H a_j|^{ "2" } skaliert, bevor die bestehende Anti-Jam-C/N0-Gleichung angewendet wird.

# text
seg-a2f34cff9338 = Geländeabschattung des Jammers in der Szenarioart jamming gegen eine unabhängige numpy-Neuberechnung auf einer realen SRTM-Kachel

# text
seg-334c569d9cae = Der optionale Abschnitt [terrain] der Szenarioart jamming: das Großkreis-Geländeprofil zwischen Jammer und Empfänger auf einer SRTM-.hgt-Kachel mit einer Erdkrümmung nach k-Faktor, die dominante Messerschneide (größtes Fresnel-Kirchhoff-nu) und der Einzel-Messerschneidenverlust nach ITU-R P.526-15 Abschnitt { "4.1" }, abgezogen von der Empfangsleistung des Jammers.

# text
seg-825c121c7512 = Akquisitionshysterese und Frontend-Quantisierer in der Szenarioart jamming gegen unabhängige Neuberechnungen

# text
seg-f7207263d881 = Die optionalen Abschnitte [acquisition] (ein Satellit wird bei oder über einer Akquisitionsschwelle nach einer Wiedererfassungsverzögerung erfasst und gehalten, solange er bei oder über der Tracking-Schwelle liegt) und [front_end] (die AGC-Anzeige { "10" } log10({ "1" } + J/N) und der Quantisierungsverlust des ADC bei gaußschem Eingang, von jeder Verbindung abgezogen, gekennzeichnet als nicht gültig für nicht-gaußsche Jammer) der Szenarioart jamming.

# text
seg-9c46f1c76486 = Begrenztes FLL-Einziehen unterhalb der FLL-zu-PLL-Übergabeuntergrenze des Standardentwurfs (optional)

# text
seg-efa1d1a9e904 = Das optionale carrier.fll_pull_in_max_s von iq::track (das Feld fll_pull_in_max_s von iq::track::LoopConfig): Bei fll_assist = pull-in übergibt die FLL nach einer festen Einziehzeit unabhängig vom PLI an die PLL, mit einer passenden Rückkehr-Verweildauer, bis der PLI erstmals fll_off_pli erreicht.

# text
seg-ac0f97e945a7 = Leser für RTKLIB-.pos-Lösungen für receiver-trust

# text
seg-0b8bc2c89de4 = Liest eine RTKLIB-Lösungsdatei (Kalender- oder GPS-Woche/TOW-Zeit, Breite/Länge oder ECEF-Position, verwendete Satelliten) in die receiver-trust-Zeitleiste (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Keine externe Referenz: Es wurde keine von RTKLIB erzeugte Datei gelesen, und das Spaltenlayout stammt aus dem RTKLIB-Handbuch. Nur an selbst geschriebenen Dateien geprüft; die ECEF-Umrechnung verwendet frames::ecef_to_geodetic wieder, das eigene Zeilen hat

# text
seg-849393517c04 = NovAtel-OEM7-ASCII- und Binärprotokolle (BESTPOS, RANGE, RXSTATUS) für receiver-trust

# text
seg-7e0021922025 = Liest BESTPOS (Position), RANGE (C/No je Signal) und RXSTATUS (das Jammer-Flag des Empfängers, als Selbstauskunft der Epoche) aus ASCII- und Binärprotokollen des OEM7, CRC-geprüft, nur lesend (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Keine externe Referenz als bestandener Zielwert. Die Feldlayouts und die CRC folgen der öffentlichen OEM7-Dokumentation (docs.novatel.com); die CRC-Routine wurde einmal gegen die CRC geprüft, die die Dokumentation für ihr eigenes BESTPOSA-Beispiel angibt (zitiert, nicht wörtlich übernommen). Die Fixtures sind selbst geschrieben; es wurde kein Protokoll eines realen Empfängers gelesen

# text
seg-a45c53a9deb3 = Leser für Träger-zu-Rausch-Werte aus RTCM-{ "3" }-MSM4 und -MSM7 für receiver-trust

# text
seg-0a0c9976236f = Liest das C/N0 jeder Signalzelle von RTCM-{ "3" }-MSM4- und -MSM7-Nachrichten (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) aus einem Frame-Strom, CRC-24Q-geprüft (receiver_trust::machines::rtcm3). Layouts aus den unter BSD lizenzierten pyrtcm-Tabellen, nicht aus dem Text des RTCM-Standards.

# text
seg-2af6fc1abe98 = ReferenceImpl in einer einmaligen Prüfung, kein Test der Suite: Der Dekodierer von pyrtcm { "1.2.0" } liest dieselben selbst geschriebenen Frames mit demselben C/N0 und derselben Epochenzeit. Er teilt die Quelle seiner Tabellen mit diesem Leser, prüft also die Bitverarbeitung, nicht das Layout. Es wurde keine Aufzeichnung eines realen Empfängers oder einer Basisstation gelesen

# text
seg-cd554a7c1649 = GNSS-SDR-Monitor-Adapter für receiver-trust

# text
seg-22b587ac642d = Liest GNSS-SDR-Monitor-Nachrichten (Gnss_Synchro) und PVT-Monitor-Nachrichten, mit den proto-Feldnamen als JSON-Zeilen weitergereicht, in C/N0 je Kanal, Fix, verwendete Satelliten, HDOP und Himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Keine externe Referenz: Die Feldnamen stammen aus der GNSS-SDR-Dokumentation; weder der Leser noch relay.py wurden gegen ein laufendes GNSS-SDR oder eine reale Aufzeichnung ausgeführt

# text
seg-217e5953c128 = Einlesen von IMU-Protokollen, Kreisel-Kurseingang und Allan-Anpassung hybrider Sensorparameter

# text
seg-9dadc819daef = Liest eine IMU-CSV (dokumentierte Spalten oder das EuRoC-Layout); integriert die Gierrate zu dem Kurs, den der Monitor heading-course liest ([log.imu]); und passt die Rauschparameter von Beschleunigungsmesser und Kreisel der hybriden und Fusionsszenarien aus einem Ruheprotokoll per überlappender Allan-Abweichung an (imu-fit).

# text
seg-9099f3467e9e = Keine externe Referenz: Die Anpassung wird an synthetischen Weißrauschen-Protokollen mit bekannten Koeffizienten geprüft, der Kurs an Protokollen mit konstanter Gierrate. Es wurde kein reales IMU-Protokoll angepasst, und q_aa wird nicht angepasst

# text
seg-15a852a2dcb0 = Home-Assistant-MQTT-Discovery und Zustandsexporter für Vertrauenstelemetrie

# text
seg-6d6b07b26966 = Ein JSON-Zustandsdokument und MQTT-Discovery-Nachrichten für Home Assistant zum Vertrauensstrom, auf jeder Oberfläche als Text ausgegeben und von der CLI über MQTT { "3.1.1" } QoS { "0" } veröffentlicht (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-79a8f3864af3 = Keine externe Referenz: Die Pakete wurden von einem für den Test geschriebenen Loopback-Listener gelesen, nicht von einem echten Broker, und Home Assistant wurde nicht ausgeführt

# text
seg-68caf86157c2 = ROS-{ "2" }-Paket für receiver-trust und gnss_lib_py-Brücke

# text
seg-e7d7d99fe538 = Eine ROS-freie Brücke, die Fix- und Satellitennachrichten als NMEA schreibt und über die Python-Anbindung bewertet (integrations/ros2/kshana_trust), und eine Brücke von gnss_lib_py NavData zu receiver-trust über das Format rtklib-pos (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Keine externe Referenz: Der ROS-Knoten wurde nicht in einem laufenden ROS-{ "2" }-Graphen ausgeführt, und die Feldnamen von ublox_ubx_msgs wurden nicht gegen einen laufenden Treiber geprüft. gnss_lib_py (MIT) wurde für den Brückentest ausgeführt

# text
seg-c3c260b7063e = Tests

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — eine unabhängige MCDA-Bibliothek eines Drittanbieters, die dieselbe eindeutig definierte bereichsnormierte S/R/Q-Aggregation berechnet; übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = MCDA-Outranking-Nettofluss-Rangfolge (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod — paarweiser Präferenzindex mit den sechs standardmäßigen verallgemeinerten Kriterienformen, positiven/negativen Outranking-Flüssen und der vollständigen Nettofluss-Rangfolge (übliches Kriterium validiert)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — eine unabhängige MCDA-Bibliothek eines Drittanbieters, die denselben eindeutig definierten Netto-Outranking-Fluss berechnet; übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_promethee/generate_promethee_reference.py. Die Präferenzformen mit Schwellen (q/p/σ) lassen sich auf dieselbe Algebra verallgemeinerter Kriterien zurückführen und bleiben eigenschaftsgeprüft

# text
seg-72248291c388 = MCDA-Outranking-Auswahlkern (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — Konkordanz-/Diskordanzmatrizen, die Dominanzrelation aus Konkordanz und Nicht-Veto sowie der Outranking-Auswahlkern (Konvention: ausschließlich Nutzenkriterien, summennormierte Gewichte, eine einzige globale Skala)

# text
seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — eine unabhängige Multikriterien-Entscheidungsbibliothek eines Drittanbieters, die dieselbe eindeutig definierte Konkordanz/Diskordanz/Dominanz/Kern berechnet; elementweise übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_electre/generate_electre_reference.py. Die Schwellenwahl ĉ/d̂ sind Eingaben der Analysten (die Sensitivität bleibt MODELLED)

# text
seg-95942c6a2689 = MCDA-Aggregationskerne (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (linear normierte konvexe Mischung λ·WSM+({ "1" }−λ)·WPM bei λ={ "0.5" }) und das MOORA-Verhältnissystem (vektornormierte gewichtete Nutzensumme minus gewichtete Kostensumme) — die stabilitätsgehärtete Wertmischung und der vorzeichenbehaftete Verhältnissystem-Bewerter

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA-Verhältnissystem, Vektornormierung) — eine unabhängige, weit verbreitete Python-MCDA-Bibliothek eines Drittanbieters, die dieselben eindeutig definierten Aggregate berechnet; übereinstimmend bis <{ "1e-9" }. Offline neu erzeugbar mit tests/fixtures/mcda_waspas/ und tests/fixtures/mcda_moora/. Garbage in, garbage out bei den Eingaben; die Sensitivitäts-/Robustheitsschicht bleibt MODELLED

# text
seg-7de67fedc1da = MCDA-Proportionalrangfolge (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — spaltensummennormierte Nutzenbedeutung S⁺ plus der Term der inversen Kostenbedeutung, die relative Bedeutung Q und der Nutzengrad U = Q/max Q (beste Alternative = { "1" })

# text
seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — eine unabhängige MCDA-Bibliothek eines Drittanbieters, die dieselbe eindeutig definierte relative Bedeutung/den Nutzen von COPRAS berechnet. pyDecision wird bewusst verwendet: COPRAS in pymcdm { "1.4.0" } kollabiert algebraisch zum trivialen S⁺+S⁻ und ist keine getreue Referenz, während pyDecision das kanonische Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)) umsetzt. Übereinstimmend bis <{ "1e-9" }; offline neu erzeugbar mit tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = CUSUM-Änderungserkennung: Latenz und ARL

# text
seg-302f5db625df = Ungünstigste Erkennungslatenz des tabellarischen CUSUM-Detektors (⌊h/(z−k)⌋+{ "1" }) und mittlere Lauflänge außerhalb der Kontrolle, verwendet von den Monitoren für Zeitgebungs-Schutzniveau und Spoofing

# text
seg-691a506ce13f = Veröffentlichte ARL des tabellarischen CUSUM: Siegmund-({ "1985" })-Näherung durch Brownsche Bewegung (Hawkins & Olwell { "1998" }, Gl. { "3.7" }), quervergleichend verankert an den ARL-Tabellen aus Montgomery, Introduction to Statistical Quality Control (Wiley) für k=½, h∈{ "{" }{ "4,5" }{ "}" }; die deterministische Latenz stimmt exakt mit einer Erstpassage-Referenz überein. Die zusammengesetzte TPL-Schranke bleibt MODELLED

# text
seg-d923a77bd31a = Uhr-Holdover: Auslaufvarianz und Schwellenumkehrung

# text
seg-4fafaf5f919d = Wachstum der Phasenfehlervarianz im Auslauf q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 und seine monotone Umkehrung zu einer Holdover-Schwelle für den Zeitgebungsfehler

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm berechnet das diskrete Van-Loan-({ "1978" })-Prozessrauschen Q₀₀ = ∫₀ᵗ ΦQcΦᵀds über Padé-Skalierung und Quadrierung auf der augmentierten { "6" }×{ "6" }-Matrix — ein unabhängiger Weg, der die polynomialen Koeffizienten von kshana nie sieht; dazu optimize.brentq, das dieselbe monotone Kurve umkehrt, im Vergleich zur Bisektion von kshana. Die Kennwerte der Rotrauschgrenze je Klasse (ClockClass) bleiben MODELLED

# text
seg-eb3cd9e92d8d = Inverser Simpson-Diversitätskern

# text
seg-244d57819f2b = Effektive architektonische Diversität = inverser Simpson-Index / Hill-Zahl der Ordnung 2, 1/Σpᵢ², über die Quellenqualitäten je Unabhängigkeitsgruppe (der Diversitätsterm im Resilienzwert)

# text
seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — eine unabhängige Bibliothek eines Drittanbieters, die den eindeutig definierten inversen Simpson-Index berechnet; byteweise reproduziert. Das darauf aufbauende Bewertungsgerüst DHS-RPCF (Gewichte/Stufen) bleibt MODELLED

# text
seg-c14b8fe46517 = Azimutabhängige Horizontmaske: sichtbare Menge, Azimut und Elevation sowie DOP unter der Maske

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: das geodätische (WGS-84) Azimut und die Elevation eines Satelliten von einem Bodenstandort aus, eine Azimut-/Elevations-Maskentabelle, linear im Azimut interpoliert mit Umbruch bei { "360" } Grad, die sichtbare Menge el >= max(mask_deg, mask(az)) sowie die DOP mit gemeinsamer Uhr und die ENU-und-Uhr-Kofaktormatrix dieser Menge (der Kern hinter orbit::dop). So entscheidet der Abschnitt [skyline] über die Sichtbarkeit in den Arten gnss-sim, jamming, leo-pvt, leo-pass und nmea-scenario und, mit dem Bodenstandort user_site, in orbit und integrity

# text
seg-bbb1828b3db1 = Reduktionen von Straßenschlucht, Sektor und Gelände auf eine Tabelle

# text
seg-2864aec7be88 = skyline: die Straßenschlucht in geschlossener Form (Schnitt atan((h - a) / d) mit d = (w/2) / abs(sin(az - s)), offene Enden bei endlicher Länge), scharfkantige Sektoren im Uhrzeigersinn mit Umbruch und Geländepunkte, auf eine Tabelle reduziert mit dem Krümmungsabfall d^2/({ "2" } * 4/3 R); die Skyline ist ihr punktweises Maximum mit einer beliebigen Tabelle

# text
seg-50f1df206b30 = Intern: Die geschlossenen Formen werden gegen von Hand berechnete Werte geprüft (Elevationen der Wandoberkanten einer angegebenen Straße, die Bedingung für offene Enden, der Krümmungsabfall eines angegebenen Punkts). Keine externe Referenz: Die Entwurfsnotiz ordnet diese Reduktionen als MODELLED ein, und die ElevationMask von Orekit nimmt eine Tabelle, sodass der Vergleich der Zeile 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' ihre 360-Punkt-Tabellen als Eingaben liest und nicht prüft

# text
seg-3f3d657854ce = Skyline-Voreinstellungen (Stadtstraße, Hafeneinfahrt, Fjord, Containerterminal)

# text
seg-b915c06fa3f1 = skyline::PRESETS: vier REPRESENTATIVE Geometrien mit den angegebenen Abmessungen der Entwurfsnotiz und je einer Herkunftszeile: city-street (eine Schlucht, Straße { "0" } Grad, { "20" } m zwischen { "30" } m hohen Wänden, Antenne { "1.5" } m), harbour-approach (Sektoren: offen zur Seeseite über { "180" } Grad, Kaigebäude { "8" } Grad über { "90" } Grad, der Wellenbrecher { "3" } Grad), fjord (Gelände: Wände { "600" } m über der Antenne in je { "1.5" } km Abstand beiderseits einer Nord-Süd-Rinne, Krümmungsabfall angewendet), container-terminal (Sektoren: Stapel { "12" } Grad über der landseitigen Hälfte, Kranausleger { "35" } Grad und { "25" } Grad über zwei schmalen Sektoren); feldweise überschreibbar

# text
seg-44ae9b6289d9 = Keine: gewählte und angegebene Abmessungen, keine Vermessung einer Straße, eines Hafens, eines Fjords oder eines Terminals (das Seitenverhältnis der Straße liegt im Band 0.5-2 von Oke ({ "1988" }); der Fjord liegt in der Größenordnung der westnorwegischen Fjorde; die Stapel verwenden die High-Cube-Höhe nach ISO { "668" }). Der Test prüft die Voreinstellungen gegen ihre eigenen angegebenen Abmessungen, eine Transkriptionsprüfung, die die Validierungsregel nicht zählt

# text
seg-2c53381d48ae = Horizontale Fehlerellipse und Kofaktor je System aus der Geometriekovarianz

# text
seg-15fea5c05cbd = geometry::sky_geometry: der ENU-und-Uhr-Kofaktor (H^T H)^-1 mit einer gemeinsamen Empfängeruhr oder einer je System (der Kern orbit::cofactor_from_los) und die horizontale Fehlerellipse aus seinem Ost-Nord-Block (Halbachsen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), das Azimut der Hauptachse von Nord aus)

# text
seg-6012113b4836 = Himmelsgeometrie-Funktionen: Sichtbarkeit, DOP, Kovarianz, Fehlerellipse, Monte-Carlo-Wolke

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> und <c2/>, Python- und WASM-Funktionen gleichen Namens, MCP <c3/>): aus einem Standort, einer Zeit und Konstellationsvoreinstellungen (oder Satelliten als Azimut/Elevation oder ECEF) die sichtbaren und unter einer Skyline maskierten Satelliten, GDOP/PDOP/HDOP/VDOP/TDOP, den Kofaktor mit Einheitsvarianz (H^T H)^-1 und die Kovarianz in Ost-Nord-Oben mit einer Empfängeruhr je System oder einer gemeinsamen, die horizontale Fehlerellipse (Halbachsen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), Orientierung { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) von Nord aus) sowie n gesäte Kleinste-Quadrate-Fehler bei unabhängigen gaußschen Entfernungsfehlern mit ihrer empirischen Kovarianz, dem RMS und der { "95" }-%-Einschließung. Der Kofaktor ist orbit::cofactor_from_los, der eine Kern hinter orbit::dop und orbit::dop_cov (dop ist die Reduktion von dop_cov): keine zweite DOP-Implementierung

# text
seg-aa0da1028636 = Die DOP-Faktoren mit einer Uhr beruhen auf dem gegen gnss_lib_py { "1.0.4" } validierten Kern (Zeile 'GNSS geometry / dilution of precision (DOP)'); die eigenen Prüfungen dieser Zeile sind intern: sky_geometry reproduziert orbit::dop und dop_cov auf derselben Geometrie, die Ellipse reproduziert eine analytische 2x2-Eigenzerlegung, ECEF- und Azimut/Elevations-Eingaben stimmen überein, und RMS und { "95" }-%-Einschließung der gesäten Wolke stimmen mit der Geometrie überein. Die ENU-Kovarianz mit einer Uhr je System und die Ellipse sind in der Zeile 'Horizontal error ellipse and per-system cofactor from the geometry covariance' VALIDATED (numpy, P2); MODELLED bleibt hier die Komposition: die Propagation der Voreinstellung zu einem repräsentativen Himmel, die Monte-Carlo-Wolke (gegen die Geometrie geprüft, die sie abtastet, eine Selbstkonsistenzprüfung) und die Oberflächen. Die Konstellationsvoreinstellungen liefern einen repräsentativen, keinen datierten Himmel; das gaußsche Fehlermodell und der UERE sind angegebene Eingaben, keine gemessene Genauigkeit und keine Integritätsschranke

# text
seg-7f66be0f15c8 = GNSS-verweigerter Uhr-Holdover

# text
seg-4d8f87668a0f = Wachstum des Auslauffehlers in geschlossener Form + Holdover bis zur Schwelle; Quantenuhr-Klassen

# text
seg-2d260626e3d2 = Mehrschrittige Rekursion der clock_state-Kovarianz (Gegenprüfung innerhalb derselben Codebasis); der zugrunde liegende Kern für Auslaufvarianz und Holdover-Umkehrung ist extern gegen scipy validiert (siehe 'Clock-holdover coast-variance & threshold inversion'). Die Holdover-Kennwerte je Klasse mit Rotrauschgrenze bleiben MODELLED

# text
seg-29b482d88916 = Gemessene Uhren-Gerätekarten (Vorhersage am zurückgehaltenen Datensatz)

# text
seg-8c68c5b25004 = clock_library: eine Gerätekarte (weiße Phase, weiße, Flicker- und Random-Walk-FM plus eine lineare Frequenzdrift), angepasst an ein Drittel einer benannten gemessenen Uhrenaufzeichnung nach einem protokollierten Aufbereitungsdurchlauf (Lücken, Phasenausreißer, Phasensprünge, Bursts entfernt; Frequenzsprünge protokolliert), gewichtet nach den über Lag-1 identifizierten Freiheitsgraden der Rauschtypen, und ihre vorhergesagte Allan-Abweichung, bewertet an den zurückgehaltenen zwei Dritteln; Leser für RINEX- und IGS-Uhrendateien, BIPM-Dateien je Laboratorium und Circular T Abschnitt { "1" }; Umwandlung einer Karte in das Rauschmodell der Slot-Zeitgebung, das erweiterte Kalman-Uhrenmodell und die Rauschpegel des Spoofing-Monitors

# text
seg-5097a0e6460d = Gemessene GPS-Block-IIF-Uhrenkarten mit Termen je Umlauf (Vorhersage am zurückgehaltenen Datensatz)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: eine Gerätekarte, die die ein- bis vierfach pro Umlauf auftretenden Phasenterme trägt (Periode T/k, T = { "43 082.05" } s), gemeinsam mit dem quadratischen Anteil nach der Methode der kleinsten Quadrate an einem Drittel einer gemessenen Satellitenuhr-Aufzeichnung angepasst, mit dem Allan-Beitrag jedes Terms in geschlossener Form { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } in der vorhergesagten Allan-Abweichung

# text
seg-0d72fcc0fbea = Zustandsschätzung der Bordatomuhr

# text
seg-6db5391f8ebe = Kalman-Uhr nach Van Loan mit 3 Zuständen (Phase/Frequenz/Drift), Joseph-stabilisiert

# text
seg-3f0a9d7c2971 = Fehlerbudgetierung der Zeitübertragung

# text
seg-216f46b43860 = Zweiweg/TWSTFT (Sagnac), GNSS-Common-View, PPP; Link-Jitter→Entfernung

# text
seg-e7b6aac2ec58 = Sagnac-Betrag geprüft gegen einen maßgeblichen VERÖFFENTLICHTEN WERT — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Gl. { "1.29" }: Eine ostwärtige Umrundung am Äquator summiert { "207.4" } ns auf (2ωA_E/c²); kshana reproduziert { "207.386" } ns. Unabhängig bestätigt durch RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), das dieselbe 2Aω/c²-Geometrie trägt. Das zusammengesetzte BIPM-Budget für TWSTFT-Transponder/Common-View/PPP hat keine externe Referenz, daher bleibt die Fähigkeit modelliert

# text
seg-157fadeb5d67 = Modulation von Navigationssignalen und Code-Tracking-Analyse

# text
seg-ab633d191396 = BPSK-R/BOC-PSD, Spektraltrennung κ, Gabor-Bandbreite, DLL-Jitter, Mehrwegeausbreitung

# text
seg-589e0053e3e8 = Erzeugung des GPS-L1-C/A-Spreizcodes

# text
seg-782d4da75b59 = G1/G2-LFSR-C/A-Code-Generator, der die in IS-GPS-200 veröffentlichten oktalen Verifikationsvektoren der ersten 10 Chips für PRN { "1" }–{ "9" } reproduziert (dazu Länge von 1023 Chips, Balance von 512 Einsen, dreiwertige periodische Autokorrelation)

# text
seg-473f24d4e06a = IS-GPS-200 Tabelle 3-Ia 'Code Phase Assignments' — die maßgeblichen, gemeinfreien, veröffentlichten OKTALEN Verifikationsvektoren der ersten 10 Chips der US-Regierung (GPS Directorate, navcen.uscg.gov); der eigene G1/G2-LFSR von kshana erzeugt jeden Vektor für PRN { "1" }–{ "9" } exakt neu. Die nachgelagerten geschlossenen Formen für Modulation/SSC/DLL bleiben modelliert (eigene Zeile)

# text
seg-e6c08e1e6ae3 = Leistungsfähigkeit von Quanten-Inertialsensoren

# text
seg-d28e1f6a430f = Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Streifenmehrdeutigkeit / Dynamikbereich von Quanten-Inertialsensoren

# text
seg-deb2850546d5 = Streifenmehrdeutigkeits-Dynamikbereich des Mach-Zehnder-Interferometers: Die 2π-periodische Streifenauslesung legt eine maximale eindeutige spezifische Kraft a_max=π/(k_eff·T²) fest, und der eindeutige Bereich in Auflösungszellen a_max/σ_a=π/σ_Φ ist unabhängig vom optischen Skalenfaktor — der Empfindlichkeitsgewinn mit T² kostet eindeutigen Bereich in exaktem Gleichschritt (die Abfragezeit tauscht Auflösung gegen Bereich, wobei die Zellenzahl durch das Phasenrauschen der Auslesung festgelegt bleibt)

# text
seg-7603ff7a7693 = Selbstkonsistenz des Interferometer-Streifenmodells: die Halbstreifenkante, die 2π-periodische Aliasing-Struktur und die Kürzung des Skalenfaktors im Verhältnis von Bereich zu Auflösung sind algebraische Identitäten in geschlossener Form, geprüft gegen die eigenen Mach-Zehnder-Phasen- und Empfindlichkeitsfunktionen der Engine — Prüfungen der internen Konsistenz, KEIN externer Datensatz, daher bleibt die Zeile InternalConsistency. MODELLED idealer Dreipuls-Streifenmehrdeutigkeit; keine Schranken für Wellenfrontaberration oder Kontrastverlust auf den eindeutigen Bereich

# text
seg-d04bf321d4a1 = Resilienz der Quanten-Inertial-Koppelnavigation

# text
seg-c4989abb5d40 = Zusammengesetztes Positionsbudget aus Bias + Skalenfaktor + VRW + Stabilitätsabfall über den Holdover

# text
seg-bfe4085115c1 = Unabhängige numpy-Monte-Carlo-SDE-Integration von doppelt integriertem weißem Beschleunigungsrauschen (validiert die analytische VRW-Varianz durch einen wirklich unabhängigen Algorithmus) + ein Anker auf dem veröffentlichten Wert von Groves { "2013" } für die Bias-/Skalenfaktor-Terme; die CAI-Gerätewerte quantifizieren Partner-Hardware und bleiben MODELLED

# text
seg-bc6e733c39b3 = GNSS/INS-Sensorfusion

# text
seg-16514286bb51 = 15-Zustands-Fehlerzustands-EKF, lose gekoppelt (validiert an einer realen IMU/GNSS-Fahrt gegen NaveGo); ein eng gekoppelter Pseudorange/Doppler-UKF und ein gekoppeltes Uhr+Position-Filter (nur Konsistenz, außerhalb der validierten Aussage)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, als Werkzeug unter GNU Octave ausgeführt, nie gelinkt): sein lose gekoppeltes ins_gnss auf seiner eigenen realen Ekinox-IMU/GNSS-Landfahrzeugfahrt, beide Lösungen bewertet gegen die Ekinox-Referenztrajektorie. Beide Filter lesen dieselbe { "20" }-Hz-float32-Eingabe, und die Konfiguration von Kshana wird mechanisch aus den veröffentlichten Parametern des Datensatzes abgebildet. Der horizontale und vertikale Positions-RMS von Kshana und sein Positionsinnovations-RMS liegen innerhalb von 1.2x von NaveGo (gemessen { "0.912" }, { "0.940" } und { "0.861" }), und seine mittlere normierte Innovation beträgt höchstens { "1.5" } (gemessen { "0.395" }: etwa 2.5x unterkonfident, gegeben die angegebenen GNSS-Sigmas des Datensatzes); Toleranzen vor dem Vergleich festgelegt. Geltungsbereich: GNSS ist während der gesamten Fahrt mit { "5" } Hz vorhanden, daher wird kein Ausfall und kein Auslauf getestet, und die Prüfung erfasst grobe Filterfehler statt Feinabstimmung (hebelarmkorrigierte Rohlösungen kämen nahe an den vertikalen Zielwert); die Hebelarmtransformation wird im Test-Harness berechnet. Der eng gekoppelte UKF und das gekoppelte Uhr+Position-Filter behalten ihre filterpy-{ "1.4.5" }-Konsistenzprüfungen (lineare Posterioren bis { "2.4e-12" }) und bleiben außerhalb der validierten Aussage

# text
seg-5692c7b936b6 = GNSS-verweigerte Jamming-Resilienz

# text
seg-f4ff77caa47b = Geometrie-J/S-Link-Budget, Anti-Jam-C/N₀, Lock-Verlust je Satellit

# text
seg-ff90679d1de9 = Spoofing-Erkennung

# text
seg-b843f63e77e6 = Uhrgestütztes χ², RAIM, AGC, SQM, fusioniert zu einer Sicherheits-FoM je Epoche

# text
seg-b10d07921f5e = Zeitgebungs-Schutzniveau unter Spoofing

# text
seg-2a829711b997 = Schranke in geschlossener Form für den ungünstigsten unentdeckten Zeitfehler = Monitor-Untergrenze + Oszillator-Auslauf-σ über die CUSUM-Erkennungslatenz, angegeben als Band der Rotrauschgrenze

# text
seg-0ec37553bbc4 = Zislunare Missionsanalyse

# text
seg-a47465f682ba = CR3BP-STM + Einzelschuss-Differentialkorrektor; südliche NRHO um L2

# text
seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; südliche Halo-Familie um Erde–Mond-L2, Methodik nach Howell/Davis) — extern veröffentlichte Periode T, Jacobi-Konstante C und Anfangsbedingungen bei senkrechter Kreuzung; der Einzelschuss-STM-Korrektor von kshana, mit der Katalog-IC initialisiert und gestört, konvergiert zurück auf die Katalogmitglieder

# text
seg-f1d49eac89f8 = Alternatives / ergänzendes PNT

# text
seg-023dda973f66 = Schwerefeld-Kartenabgleich, geländereferenziert (TERCOM/SITAN), magnetische Anomalie

# text
seg-da869d48e505 = IGRF-14-Koeffizienten; CRLB des Matched Filters aus ersten Prinzipien. Das Feld des Schwerefeld-Benchmarks mit realem Feld ist extern geprüft (Zeile 'Gravity-anomaly synthesis from a spherical-harmonic model'), sein Navigationsergebnis hat jedoch keine externe Referenz

# text
seg-db7767ab661d = Synthese von Schwereanomalien aus einem Kugelfunktionsmodell

# text
seg-2db367c4a473 = Schwereanomalie in sphärischer Näherung (Barthelmes STR09/02 Gl. { "126" }, ICGEM gravity_anomaly_sa) aus voll normierten Koeffizienten gegen ein Niveauellipsoid in geschlossener Form (WGS84/GRS80), mit dem Term nullten Grades, gerastert für den Schwerekarten-Abgleicher

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), eine unabhängige Implementierung: EGM2008 bei Grad { "70" } abgeschnitten, gravity_anomaly_sa, WGS84, gezeitenfrei, Term nullten Grades, h = { "0" }. Die Ausgabe des Dienstes trägt keine ausdrückliche Lizenz, daher werden die Raster zur Testzeit mit einem fixierten SHA-256 abgerufen (tools/fetch_icgem_grid.sh) und nur zehn Werte mit Namensnennung zitiert

# text
seg-31f51d4998cb = SRTM-Höhenmodell-Leser auf realem Gelände

# text
seg-08ea4ae0b671 = Selbstgeschriebener SRTM-.hgt-Parser (16 Bit Big-Endian, Nordzeile zuerst, void-bewusst) + bilinearer Abtaster, der eine reale gemeinfreie DEM-Kachel liest und einen dokumentierten Vermessungs-Benchmark auflöst

# text
seg-791e7285c291 = Reproduzierbarkeit und Softwaresicherung

# text
seg-7177355a482c = Deterministische, szenario-gehashte Gates für SBOM + plattformübergreifende Golden-Werte

# text
seg-6cf9d570cc51 = Übereinstimmung der SBOM mit dem offiziellen CycloneDX-{ "1.5" }-JSON-Schema (+ gültige SPDX-Bezeichner) — ein extern veröffentlichter Standard, null Validierungsfehler über den gesamten Abhängigkeitsgraphen; der Teil zu FoM-Determinismus / Byte-Reproduzierbarkeit bleibt eine fixierte Selbstkonsistenzprüfung, daher bleibt die Zeile MODELLED

# text
seg-89b2114542bb = Evaluierung der KI/ML-Erkennung von HF-Störungen ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Gelabeltes synthetisches Störungskorpus + detektorunabhängiges ROC/AUC/Konfusions/Pfa-Pmd-Harness; Leckageschutz, stratifizierte Aufteilung, Bericht zur Optimismuslücke bei Verteilungsverschiebung (innerhalb vs. außerhalb des Regimes). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = AUC-Schranken in geschlossener Form (Mann–Whitney) + ein Detektor mit perfekter Referenz; das Korpus ist SYNTHETISCH (parametergestützt, nicht Feld/IQ)

# text
seg-c38ebee794b3 = Studie zur Optimismuslücke der KI/ML-Erkennung von HF-Störungen & Lückenprädiktor nur aus ID

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Kontrollierte synthetische Studie der AUC-Optimismuslücke von In-Distribution zu Out-of-Distribution über Detektoren veröffentlichter Methoden und gelernte Detektoren (logistische Regression / MLP mit einer verdeckten Schicht): Skalierungsgesetz-Trends je Klasse (Spearman ρ + Steigung über { "1" }−Schweregrad) und ein Ridge-Prädiktor nur aus ID, der die Lücke allein aus In-Distribution-Diagnosen schätzt, bewertet mit Leave-one-detector-out und Leave-one-class-out. Reproduzierbar über <c1/>

# text
seg-c46973920f5b = Von Hand abgeleitete Statistiken gegenüber Formeln in geschlossener Form (binormale AUC Φ(d'/√{ "2" }), DeLong-Varianz, Spearman mit Rangbindungen, exakte OLS-Wiedergewinnung) + Leave-one-out-CV gegenüber der Basislinie „den Mittelwert vorhersagen“. Das Korpus ist SYNTHETISCH (parametergestützt, nie Feld/IQ), und die Optimismuslücke ist eine Schweregradverschiebung von synthetisch zu synthetisch, KEIN Ergebnis von Simulation zu Feld

# text
seg-fd6424213d1f = Abwägung Quanten- gegenüber klassischem PNT & GNSS-verweigerte Resilienz ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Einlesen gemessener ADEV (NNLS), Abwägungstabelle (Zeitgebungs-/Inertial-Holdover + Nutzen), Hüllkurve Resilienz über Zeit; der Hinweis zur Untergrenze wird am Artefakt mitgeführt. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = Der Kern der Anpassung gemessene ADEV→PSD (NNLS) stimmt mit scipy.optimize.nnls überein (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — ein unabhängiger externer Kern; aber die ZAHLEN der Abwägung quantifizieren (und validieren nie) eine Uhr/CAI des Partners, daher bleibt die Abwägung selbst MODELLED, ohne Validierungs-Nimbus

# text
seg-1fa865bfddd1 = Weltraumwetter-Umgebung & aktivitätsgetriebene thermosphärische Dichte

# text
# c1: space-weather
seg-47308f611c7e = Solare/geomagnetische Indizes (definitorische Kp↔ap-Tabelle), die exosphärische Temperatur nach Jacchia-1971 und die thermosphärische Dichte nach Jacchia { "1971" } (SAO Special Report { "332" }: statische Diffusionsprofile, die dessen Tabelle { "7" } reproduzieren, mit den tageszeitlichen, geomagnetischen, halbjährlichen, jahreszeitlich-breitenabhängigen und Helium-Variationen) gegenüber der statischen Atmosphäre USSA76. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/space-weather.toml)

# text
seg-29bedb28c34f = CCSDS-OEM-Interoperabilität (Ephemeriden-Import aus GMAT/Orekit/STK)

# text
# c1: oem-interop
seg-edb58ffbbb5b = CCSDS-{ "502.0" }-OEM-Importer (parse_oem), tolerant gegenüber COMMENT-Zeilen / zusätzlichen Metadaten-Schlüsselwörtern / Kovarianzblöcken und die exakte Umkehrung des Writers; Round-Trip + Einlesen externer Dateien mit einer Geschwindigkeitskonsistenzprüfung. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/oem-interop.toml)

# text
seg-c76b8c395ef0 = Startfenster & Aufstiegsgeometrie (Missionsanalyse)

# text
# c1: launch-window
seg-6066c634faba = Zweikörper-Startazimut(e) (sin Az = cos i / cos lat), minimal erreichbare Inklination, Kreisbahngeschwindigkeit, Ostbonus durch die Erdrotation, Δv des Dogleg-Ebenenwechsels und tägliche Gelegenheiten und, bei gegebener Epoche und IERS-finals2000A-Zeilen, die Standortgeschwindigkeit um den wahren Pol (launch::site_rotation_speed_at). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/launch-window.toml)

# text
seg-ff2cd766bb52 = Ballistischer Wiedereintrittskorridor (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Spitzenverzögerung (unabhängig vom ballistischen Koeffizienten), Geschwindigkeit + Höhe bei Spitzen-g und Geschwindigkeit der Spitzenerwärmung für einen ballistischen Eintritt in eine exponentielle Atmosphäre. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/reentry.toml)

# text
seg-8c10b50407d3 = Fußabdruck der EO-Nutzlast & Abdeckungsgeometrie

# text
# c1: eo-coverage
seg-45c1e799c87c = SMAD-Raumdreiecksgeometrie: Erdwinkelradius, Streifenbreite, GSD im Nadir, maximaler Off-Nadir-Zugriff und Kreisbahnperiode, dazu die J2-Knotenperiode erster Ordnung (eo_payload::j2_nodal_period) und der Bodenspuranstand am Äquator R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) mit einem Flag für lückenlose Abdeckung, für eine Bahnhöhe, Inklination und Sensor-FOV/IFOV. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/eo-coverage.toml); die Standardinklination ist die sonnensynchrone aus eo_payload::sun_synchronous_inclination, ein Komfortstandard, der nicht Teil der validierten Aussage ist

# text
seg-940692c550f3 = CCSDS-Space-Packet-({ "133.0" })-TM/TC-Framing

# text
# c1: space-packet
seg-bf06c7ffa875 = CCSDS-133.0-B-Space-Packet-Primärkopf kodieren/dekodieren (Version/Typ/Sek.-Kopf/APID/Sequenz-Flags/Zähler/Datenlänge) + ein Framing-Szenario. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — eine unabhängige Implementierung von CCSDS 133.0-B-2 eines Drittanbieters; encode_packet/decode_packet von kshana stimmten byte-exakt überein (der 6-Oktett-Primärkopf für { "33" } Fälle + das vollständige kodierte Paket für { "12" })

# text
seg-5510c82f671a = CCSDS-Space-Packet: Sekundärkopf, Paketfehlerkontrolle und Segmentierung

# text
seg-7503bf761df9 = Erweiterungen des CCSDS-133.0-B-2-Space-Packets neben dem Primärkopf: ein Sekundärkopf mit einem CCSDS-301.0-B-Zeitcode (CUC oder CDS, explizites oder implizites P-Feld) und Zusatzdaten, das Paketfehlerkontrollfeld CRC-16, Segmentierung einer großen Nutzdateneinheit und ihr Wiederzusammensetzen, Stromdekodierung mit Sequenzlücken- und Reihenfolgeprüfungen sowie PUS-TM-Pakete. Die Ausgabe des Primärkopfes ist byte-identisch zu vorher

# text
seg-7c61da52b8f8 = SPICE-SPK-Export (Typen { "9" } und { "13" })

# text
seg-582ce23522f6 = Writer und Reader für NAIF-SPICE-SPK-Kernel der Typen { "9" } (Lagrange, ungleiche Zeitschritte) und { "13" } (Hermite, ungleiche Zeitschritte), mit DAF-Layout, Segmentdeskriptoren und Epochenverzeichnissen, sowie der Export eines CCSDS-OEM in einen SPK-Kernel (UTC- oder TDB-Epochen auf Ephemeridenzeit)

# text
seg-d699104fc2af = SPICE-SPK-Typen { "3" } und { "21" } (Tschebyscheff, erweiterte Differenzzeilen)

# text
seg-7d3e8b5b40af = Writer und Reader für NAIF-SPICE-SPK-Segmente vom Typ { "3" } (Tschebyscheff-Polynome für Position und Geschwindigkeit über feste Intervalle, Grad { "0" } bis { "27" }) und Typ { "21" } (erweiterte modifizierte Differenzfelder, die Differenzzeilen der JPL-Integratoren, MAXDIM { "15" } bis { "25" }), aus gegebenen Datensätzen, in Dateien, die auch Segmente der Typen { "9" } und { "13" } enthalten; Datensatzauswahl und Auswertung in der Reihenfolge der SPICE-Reader. Kshana passt keine Tschebyscheff-Koeffizienten an und erzeugt keine Differenzzeilen

# text
seg-39517faae95c = CCSDS Attitude Data Messages (AEM, APM)

# text
seg-f88f6ea002c8 = Writer und Reader für die CCSDS-504.0-B-2-Attitude-Data-Messages in KVN und NDM/XML: AEM Version { "2.0" } (und { "1.0" } in KVN, mit ATTITUDE_DIR, QUATERNION_TYPE und numerischen Rotationsfolgen) mit Quaternionen-, Eulerwinkel- und Spin-Lagetypen und ihren Varianten für Ableitung, Winkelgeschwindigkeit und Nutation, mehrere Segmente; APM Version { "2.0" } mit Blöcken für Quaternion, Euler, Winkelgeschwindigkeit, Spin, Trägheit und Manöver; das A-nach-B-Quaternion eines Datensatzes (504.0-B-2 Anhang F)

# text
seg-5f26f879037e = CCSDS Orbit Data Messages (OPM, OMM, OCM)

# text
seg-eaddfd311fea = Writer und Reader für die CCSDS-502.0-B-3-Orbit-Data-Messages in KVN und NDM/XML: OPM { "3.0" } und { "2.0" } (Zustandsvektor, oskulierende Kepler-Elemente, Raumfahrzeugparameter, Kovarianz, Manöver, benutzerdefinierte Parameter), OMM { "3.0" } und { "2.0" } (mittlere Elemente über mittlere Bewegung oder große Halbachse, TLE-bezogene Parameter mit BSTAR oder BTERM und AGOM, Kovarianz) und OCM { "3.0" } mit Trajektorie (CARTP, CARTPV, CARTPVA; absolute oder relative Epochen), Blöcken für physikalische Eigenschaften, Kovarianz (CARTP, CARTPV in LTM-Reihenfolge), Manöver und benutzerdefinierte Blöcke; ein OMM mit voller Genauigkeit aus einem SGP4-Elementsatz neben dem unveränderten OmmFile::to_omm_kvn

# text
seg-1e5ea1d9918d = 3-DOF-Lage- und Zeigefehlerbudget (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Ungünstigstes Störmoment des Gravitationsgradienten ((3/2)(μ/R³)ΔI) als Spitze über die Lage (die validierte Aussage), plus ein RSS-Zeigefehlerbudget über benannte 1σ-Beiträge mit dem dominanten Term (eine quadratische Summe vom Aufrufer gelieferter Zahlen, außerhalb der validierten Aussage). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), eine unabhängige C++-Implementierung des Gravitationsgradientenmoments mit vollem Tensor: Die Spitze (3/2)(μ/R³)ΔI von Kshana ist gleich dem Moment von Basilisk bei der Lage von { "45" } Grad innerhalb von { "1e-12" } relativ (ungünstigster Wert { "2.1e-15" }) über { "5" } Höhen und { "8" } Trägheitstensoren und begrenzt das Moment von Basilisk über { "2000" } zufällige Lagen je Fall; Toleranz vor dem Vergleich festgelegt. Validierte Aussage: die Spitze des Gravitationsgradientenmoments. Das RSS-Zeigebudget ist eine quadratische Summe vom Aufrufer gelieferter Zahlen ohne externe Wahrheit und bleibt außerhalb davon; die von Hand codierte Maximierung des vollen Tensors mit Hipparchus bleibt als stützende Selbstkonsistenz erhalten. Keine Simulation von Regelkreis/6-DoF/flexiblen Moden

# text
seg-1461aa14a7ff = Überflugvorhersage für Bodenstationen (Bodensegment)

# text
# c1: passes
seg-e1cf1ec4f005 = Sichtbarkeitsüberflüge im Zeitbereich (AOS/TCA/LOS, maximale Elevation, Dauer) eines Engine-Propagators über einer Station oberhalb einer Elevationsmaske, mit interpolierten Auf- und Untergangsdurchgängen und Gesamtzugriff: passes::predict_passes, der geometrische Planer (keine Refraktion oder Lichtlaufzeit). Die Szenarioart <c1/> führt den scheinbaren Prädiktor der Zeile 'Apparent ground-station pass prediction with refraction and light time' aus

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — eine unabhängige Flugdynamikbibliothek: ElevationDetector (Brent-Nullstellensuche) + EventsLogger über einer ITRF-Ephemeride, Station als TopocentricFrame nach WGS-84. AOS/LOS/maximale Elevation/Überflugzahl/Gesamtzugriff stimmen bei identischer Bahn + Station + Maske + Fenster überein (eingecheckte Fixture; Treiber xval/orekit-passes)

# text
seg-1dd8b2655b18 = Scheinbare Überflugvorhersage für Bodenstationen mit Refraktion und Lichtlaufzeit

# text
# c1: passes
seg-46f93d3c24d2 = Sichtbarkeitsüberflüge (AOS, TCA, LOS, maximale scheinbare Elevation, Dauer) eines SGP4-Elementsatzes über einer WGS-84-Station auf dem validierten Erdbahnpfad (IAU 2006/2000A, optionale Erdorientierungsparameter), mit troposphärischer Refraktion nach ITU-R P.834-9 (Gleichungen { "9" } bis { "14" }, die gedruckten Koeffizienten der Empfehlung) und der Lichtlaufzeit des Downlinks, jeweils schaltbar; Durchgänge per Bisektion auf { "1e-7" } s gelöst und die Kulmination per Goldenem-Schnitt-Suche. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/passes.toml), beide Korrekturen standardmäßig an

# text
seg-7b4a8e25c3c9 = Adaptive Codierung und Modulation nach DVB-S2 entlang eines LEO-Downlink-Überflugs

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 des Downlinks entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach Kosekansgesetz, sonstige Verluste, G/T, Boltzmann-Konstante, Symbolrate), das effizienteste DVB-S2-MODCOD, das seine quasi-fehlerfreie Schwelle aus ETSI EN { "302" } 307-1 V1.4.1 Tabelle { "13" } plus eine Implementierungsmarge bei jedem Schritt überschreitet, das ACM-Datenvolumen des Überflugs und die Basislinie mit konstanter Codierung, die an der Maske und der längsten Entfernung schließt. Ausführbar als Szenarioart <c1/>. Illustrative Eingaben; MODELLED.

# text
seg-a7f26e3a6030 = Interne Konsistenz: Die in geschlossener Form aus K_bch von Tabelle 5a und den Rahmenlängen berechnete spektrale Effizienz stimmt mit den Effizienzen überein, die Tabelle { "13" } druckt (eine Transkriptionsprüfung der Schwellentabelle); die Teile des Link-Budgets stimmen mit ihren geschlossenen Formen überein; die Auswahl ist monoton in Es/N0 und beachtet die Marge; ACM bewegt mindestens das Volumen der konstanten Codierung. Die Überflugsgeometrie stammt vom separat VALIDATED scheinbaren Überflugprädiktor. WAS NICHT: Es wurde kein externes Werkzeug und keine gemessene Strecke verglichen; die Schwellen sind die idealen AWGN-Werte des Standards, nicht die eines Modems; Regendämpfung, Zeigeverlust entlang des Überflugs und Piloten sind nicht modelliert.

# text
seg-19603a7e0fe8 = Kontaktplanung für mehrere Satelliten und mehrere Stationen mit Konfliktauflösung

# text
# c1: contact-schedule
seg-40edeae6e48b = Kandidatenkontakte aus jedem Satellit-Station-Überflug mit seinem ACM-Datenvolumen; Konflikte, wenn eine Antenne innerhalb ihrer Umschaltzeit zwei Satelliten bedienen würde oder ein Satellit gleichzeitig zu zwei Stationen herunterladen würde; ein prioritätsgewichtetes Zustellungsziel, begrenzt auf den Rückstau jedes Satelliten; ein Greedy-Plan mit trägem Grenzwert, eine Basislinie nach Eingangsreihenfolge und ein exaktes Branch-and-Bound auf bis zu { "26" } Kandidaten, wobei die Optimalitätslücke des Greedy-Plans angegeben wird. Ausführbar als Szenarioart <c1/>. Illustrative Eingaben; MODELLED.

# text
seg-bc520db98f9a = Interne Konsistenz: Das exakte Branch-and-Bound stimmt auf kleinen Zufallsmengen mit der Brute-Force-Aufzählung überein, jeder Plan wird gegen die Konfliktregeln auf Zulässigkeit geprüft, und der Greedy-Plan schlägt nie das exakte Optimum. WAS NICHT: Es wurde kein externer Planer und kein Betriebsplan verglichen; Kontakte werden ganz genommen (keine Aufteilung), der Rückstau ist am Fensterbeginn fixiert, Schwenkzeit über die feste Umschaltzeit hinaus und der Bordspeicher sind nicht modelliert.

# text
seg-ddf2bc2f13a9 = Einweg-Link-Budget (Kommunikation / Streckenauslegung)

# text
# c1: link-budget
seg-83331f513dba = Freiraumdämpfung, C/N₀, Eb/N₀, Marge und Schließung über die Streckengleichung nach CCSDS { "401" } / DSN 810-005 für EIRP/G·T/Entfernung/Rate/Band gegenüber einem geforderten Eb/N₀. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Veröffentlichte Design-Control-Tabelle der Raumfahrt-Telekommunikation als fixierte numerische Vektoren: DESCANSO / J. H. Yuen (Hrsg.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, Tabelle 1-1 (Galileo X-Band) — kshana setzt die Zeilenposten der Tabelle neu zusammen und reproduziert ihr veröffentlichtes Gesamt-L_fs { "290.54" } dB und Pr/N0 { "54.6" } dB-Hz; die Freiraumdämpfung wird auch gegen ITU-R P.525 geprüft

# text
seg-3742d2aea62a = Sparsame Rahmung von Kosten je Abdeckung / ROI

# text
seg-4228311689f8 = Kosten je Prozent Abdeckung + Abdeckung je Euro als ROI über die Konstellationsdimensionierungs-Engine; die Kosten je Satellit sind eine vom Aufrufer bezogene Spanne niedrig/nominal/hoch (keine erfundenen Preise)

# text
seg-d542ac64c31c = Kostenarithmetik in geschlossener Form gegenüber von Hand abgeleiteten Werten; eine wirtschaftliche RAHMUNG einer modellierten Abdeckungszahl, kein Angebot und kein validiertes Kostenmodell

# text
seg-8ba6ee9acc8a = Integritätsauswirkung unentdeckter Fehlererkennung (kontextabhängiges HPL/VPL gegenüber Alarmgrenze)

# text
seg-f5985399d0d5 = Bildet einen unentdeckten Spoofing-/Jamming-Bias auf einen effektiven Fehler ab → Stanford-Region (verfügbar/nicht verfügbar/MI/HMI) gegenüber kontextspezifischem HAL/VAL (offener Himmel vs. urban)

# text
seg-124d0ffe959e = Setzt die extern validierte RAIM-Stanford-Klassifikation zusammen (raim::classify_stanford); die Abbildung unentdeckte Erkennung→AL selbst ist modelliert, keine zertifizierte Integritätszuteilung

# text
seg-37d43b5b918a = Parameterblatt zitierter Fehlermodelle für CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Eingegrenzte (beste/nominale/konservative) Leistungsfähigkeit von Kaltatom-Interferometern — Bias-Instabilität, Geschwindigkeits-/Winkel-Random-Walk, Skalenfaktorstabilität, abfragebegrenzte Abtastrate, Dynamikbereich der Streifenmehrdeutigkeit — jeweils auf Zitate rückführbar; speist QuantumNavBudget, ohne Hardware zu modellieren

# text
seg-4b66096727b8 = Interne Konsistenz: Die zitierte VRW-Spanne wurde gegen die Physik von CaiAccelerometer::accel_asd gegengeprüft + rohen Dynamikbereich, berechnet aus der Streifenmehrdeutigkeitsgrenze; die Zahlen sind MODELLED Spannen aus einer Literaturübersicht (needs_source_confirmation), kein Gerät validiert, kein Validierungs-Nimbus

# text
seg-c93f2d3a3167 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Epochenklassifikator des Stanford-Integritätsdiagramms

# text
seg-712d5c35a6a6 = TIB-Epochenklassifikation im Stanford-Integritätsdiagramm (nominal / nicht verfügbar / MI / HMI)

# text
seg-93b913e60063 = Unabhängige numpy-Neuimplementierung der Vier-Regionen-Regel (scripts/gen_tib_scorer_reference.py) auf derselben Stichprobenmenge; Methode zitiert aus dem Stanford–ESA-Integritätsdiagramm (Tossaint et al., ION GNSS { "2007" }) und RTCA DO-229 WAAS MOPS. KEINE ExternalDataset-Genauigkeitsreferenz — der Benchmark ist ehrlichkeitsimmun.

# text
seg-573aa0193cb3 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Bewerter der Integritätsabdeckung

# text
seg-4d86f3c2d8f5 = TIB-Bewertung der Integritätsabdeckung (HMI/MI/Verfügbarkeitsraten + Urteil zur Überschrankenabdeckung)

# text
seg-645eb084ae8e = Unabhängige numpy-Neuzählung der Regionen in tests/fixtures/tib/reference.json; nur Gegenprüfung der Bewerter-Mechanik, keine Genauigkeitsaussage.

# text
seg-372dd0fdb025 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Fehlerkatalog (parametrische Generatoren)

# text
seg-2604e7cf27d2 = TIB-Fehlermenü (Domänendivergenz, Uhren-Slam, Holdover-Auslauf, statische/inkrementelle/symmetrische/asymmetrische Verzögerung, Replay innerhalb der Frische, pfadselektiv, k-aus-N-Quorum)

# text
seg-b907aecaccd0 = Repräsentative parametrische Fehlergeneratoren (modelliert); die nicht erkennbare Menge (symmetrische Verzögerung, Replay innerhalb der Frische) ist zitiert nach Mizrahi RFC { "7384" } und Narula & Humphreys (IEEE JSTSP { "2018" }). Keine externe Referenz — ein Fehlerkatalog macht keine gemessene Aussage.

# text
seg-90c0eb1e7c14 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Urteil zur Absorption nicht erkennbarer Fehler

# text
seg-f713acf042ff = TIB-Urteil zur Absorption nicht erkennbarer Fehler (symmetrisch/Replay müssen vom PL absorbiert und nie als erkannt gemeldet werden)

# text
seg-6840c2467c63 = Eigenschaftsprüfung, dass das Verdict-Enum strukturell einen nicht erkennbaren Fehler nicht als erkannt melden kann (Mizrahi RFC { "7384" }); absorbiert ⟺ PL ≥ Offset. Keine Genauigkeitsreferenz.

# text
seg-3652a591eefc = Raumfahrzeugbus-Engineering (AOCS/Thermal/Strukturen/Antrieb/Energie)

# text
seg-50a9c1c7dff0 = Nicht bereitgestellt — Kshana ist ein Simulator der Navigationsleistung, kein Busbauer

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Auslegung von Navigations-HF-Nutzlast und Antennenhardware

# text
seg-76c983a23e7b = Nicht bereitgestellt — Kshana modelliert die Signalleistung, nicht Nutzlast-/Antennenhardware

# text
seg-7bba3b35214c = Auslegung und Reifung von Quanten-Nutzlasthardware

# text
seg-15fcc200b859 = Nicht bereitgestellt — nur Leistungsmodelle; Kaltatom-/Uhrenhardware ist Sache eines Partners

# text
seg-d69dd4c5167b = Produktsicherung für Flughardware (Strahlung/EEE/MAIT)

# text
seg-b1540f78ffd4 = Nicht bereitgestellt — Kshana äußert sich nur zur Software-PA; die Flug-PA ist Sache eines Partners

# text
seg-1f200f8efc71 = Mondkoordinatenzeit

# text
seg-2e6961dbffe9 = Relativistische Erde-Mond-Uhrenrate (LTC/TCL) + TT/TAI/UTC-Verkettung + Ensemble

# text
seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; Grundlage der IAU/IAG-LunaNet-LTC): Eigenpotential der Mondoberfläche L_m = { "3.13881e-11" } und säkularer Gesamtwert { "56.02" } µs/Tag stimmen als veröffentlichte Zahlenwerte überein; die geozentrische Mondgeschwindigkeit wurde gegen JPL DE440 (de440s.bsp über SPICE) gegengeprüft

# text
seg-8adbbd2cdb74 = Selbstbeschreibung des hybriden optischen/HF-Berichts

# text
seg-2a5e48b558e1 = Der hybrid-optical-rf-Bericht gibt die Streckenkonfiguration an, mit der er tatsächlich lief (Trägerwellenlänge, Sende- und Empfangsapertur, Entfernung, Pulsbreite, Integrationszeit, Wirkungsgrade und Verluste, aufgelöste Standardwerte), und trägt einen Einheitenblock, der Einheit und Herkunftsklasse jeder Größe angibt, die eine Veröffentlichung wahrscheinlich zitiert, einschließlich der Spuren der Übergabekovarianz in Quadratmetern

# text
# c1: variance
seg-23f0c10237f4 = Keine externe Referenz, und keine ist möglich: Dies ist Selbstbeschreibung, keine Messung. Sie wird festgehalten, weil ihr Fehlen ein Mangel war -- P5 musste die Trägerwellenlänge und die Sendeapertur aus Quell-Standardwerten zitieren und aus einer internen Konsistenzprüfung ableiten, dass ein bloßes <c1/> in Quadratmetern war. Die Ableitung war richtig, und gerade deshalb kam es darauf an: Nichts hätte erfasst, dass sie falsch gewesen wäre

# text
seg-0691f3dee8cb = Verfügbarkeit der hybriden optischen/HF-Strecke auf der HF-Seite

# text
seg-72ccb655caf0 = Der hybrid-optical-rf-Bericht gibt eine HF-Streckenverfügbarkeit an, zusammengesetzt aus Größen, die die Engine bereits berechnet, statt aus einer importierten Klimatologie, und gibt die Zusammensetzung als benannte Regel an: A_rf = I_closure * I_track, wobei I_closure das Schließungsurteil des Einweg-Link-Budgets nach CCSDS-401 / DSN-810-005 ist (linkbudget::link_budget, Eb/N0-Marge >= { "0" }) bei der eigenen Entfernung des Szenarios und I_track das Urteil der Nachführschleife (jamming::lock_status) auf dem C/N0, den DASSELBE Budget lieferte. Jeder Faktor führt die Herkunftsklasse seiner Eingabe bis zur Ausgabe mit, und die Faktoren, die bewusst NICHT im Produkt enthalten sind -- geometrische Sichtbarkeit, Störungsverweigerung und eine HF-Ausfallklimatologie -- werden mit Begründung benannt, statt stillschweigend auf { "1" } gesetzt zu werden. Die aufgelöste HF-Teilstrecke wird als eigener Block rf_link_configuration ausgegeben, und die kontinuierlichen Zahlen neben dem Indikator (Streckenmarge, C/N0-Marge, die geschlossenen Reichweiten für Schließung und Nachführung in geschlossener Form und die Reichweitenauslastung) sind die Reichweitenumkehrungen desselben Budgets. Der Bericht gibt am Block und im Einheiten-Eintrag, auf dem ein Leser landet, vollständig an, dass diese Zahl DURCH MARGE/GEOMETRIE BEGRENZT und DETERMINISTISCH ist, während die optische Verfügbarkeit DURCH WETTER/KLIMATOLOGIE BEGRENZT und probabilistisch ist, sodass beide nie als vergleichbares Paar von Prozentwerten zitiert werden können

# text
seg-319705ea0166 = Keine externe Referenz, und ExternalDataset wird abgelehnt. Die beiden Eingaben sind eine Eb/N0-Marge und ein C/N0-Schwellenübergang, beide Funktionen einer MODELLED EIRP, Gütezahl und pauschalen Verlustzuteilung; für einen hybriden optischen/HF-Dienst Erde–Mond gibt es keine gemessene Verfügbarkeitsaufzeichnung, gegen die die zusammengesetzte Zahl geprüft werden könnte. Die vorhandenen Prüfungen sind intern und werden als solche angegeben: Die Zusammensetzung wird aus den eigenen veröffentlichten Margen des Berichts neu berechnet statt aus dem Inneren des Emitters, und die Schließungsreichweite wird geprüft, indem die Streckengleichung AN ihr erneut ausgeführt wird und verlangt wird, dass die Marge verschwindet -- ein Umkehr-Round-Trip, keine unabhängige Implementierung. Die ehrliche Grenze der Zahl ist im Bericht selbst festgehalten: Sie ist ein deterministischer 0/1-Indikator, keine Wahrscheinlichkeit, weil nichts in dieser Engine eine Verteilung von HF-Streckenausfällen in diesem Band und dieser Geometrie misst. Diese fehlende Eingabe wird in rf_availability.factors_not_included benannt statt erfunden, und sie zu liefern ist das, was eine probabilistische HF-Verfügbarkeit bräuchte

# text
seg-22c5df9b6c7c = Gleichwertiger Vergleich der Entfernungsmessung optisch gegenüber HF

# text
seg-70eb396f40af = Der hybrid-optical-rf-Bericht gibt das Verhältnis der Entfernungsmessung optisch gegenüber HF aus, wobei die EINE Konfiguration, bei der beide Teilstrecken ausgewertet wurden, im selben Objekt mitgeführt wird: derselbe Einwegpfad, dieselbe Entfernung und dieselbe Akkumulationszeit. Die optische Teilstrecke ist die photonenbegrenzte ToA-CRLB der Engine auf der Einweg-Photonenzahl; die HF-Teilstrecke ist der thermische Code-Tracking-Jitter des DLL (Early-Late) der Engine bei dem C/N0, den das eigene Link-Budget der Engine für dieselbe Einwegentfernung liefert. Die Schleifenrauschbandbreite wird abgeleitet, nicht gewählt: B_L = 1/({ "2" }*integration_s) legt die HF-Teilstrecke genau auf die optische Akkumulationszeit, und wenn ein Aufrufer sie so überschreibt, dass die beiden Mittelungszeiten auseinanderfallen, wird das Verhältnis REFUSED -- null, mit der Abweichung und beiden benannten Zeiten -- statt bei zwei Arbeitspunkten zitiert zu werden. Es wird kein Verhältnis gegen das GEWÄHLTE parametrische rf_position_sigma_m des Szenarios gebildet, und die Ablehnung nennt den Grund: Diese Eingabe trägt überhaupt keine Konfiguration. Die veröffentlichte optische Zweiweg-Kennzahl und der exakte Faktor, der sie mit der Einweg-Vergleichsteilstrecke verbindet, werden neben dem Verhältnis ausgegeben, sodass der Bericht nicht so gelesen werden kann, als trüge er zwei widersprüchliche optische Sigmas

# text
seg-acbb3ac98ee3 = Keine externe Referenz für das VERHÄLTNIS, und ExternalDataset wird bewusst abgelehnt. Die zugrunde liegende HF-Kette hat eine -- tests/validate_p5_rf_ranging_precision.rs prüft linkbudget::link_budget und navsignal::dll_code_jitter_chips gegen eine unabhängige Python/NumPy-Fixture und gegen den fest codierten Rechenwert von Kaplan & Hegarty ({ "2.814e-3" } Chip / { "0.825" } m bei { "45" } dB-Hz) -- und die optische CRLB hat ihre eigene Zeile in geschlossener Form. Einen der beiden Anker für diese Zeile zu beanspruchen, wäre geliehene Validierung, die zu verhindern die Invarianten der Matrix da sind: Die Größe hier ist ein VERHÄLTNIS bei einer Konfiguration mit MODELLED EIRP, Gütezahl, Sendeleistung und Apertur, und es gibt keinen gemessenen Vergleich der Entfernungsmessung optisch gegenüber HF an einem gemeinsamen Arbeitspunkt, gegen den es geprüft werden könnte. Intern geprüft wird das, was das Verhältnis tatsächlich falsch machen kann: dass die beiden Teilstrecken an einem Arbeitspunkt liegen. Das wird gemessen, indem die gemeinsame Akkumulationszeit skaliert wird und verlangt wird, dass sich beide Teilstrecken nach demselben Quadratwurzelgesetz bewegen und das Verhältnis unverändert bleibt, und es wird durch die glatte Ablehnung des Verhältnisses erzwungen, wenn die Mittelungszeiten auseinanderfallen. Beide Teilstrecken sind Grenzen durch thermisches/Schrotrauschen, und beide schließen Mediumverzögerung, Uhrenfehler und Mehrdeutigkeit aus, der Ausschluss ist also auf beiden Seiten identisch; der Bericht sagt das, statt es der Ableitung zu überlassen

# text
seg-3f26f598e013 = Selbstbeschreibung des Link-Budget-Berichts

# text
seg-b88bf41d6d4c = Der Link-Budget-Bericht gibt jede absolute Konstante an, aus der seine eigene Marge berechnet wurde -- die Trägerfrequenz, die die Freiraumdämpfung verwendete, die EIRP, die Gütezahl, den pauschalen Verlust und den Boltzmann-Term -- plus das erforderliche G/T, bei dem die Marge null ist, die Streckenkonstante (EIRP - Verluste - erforderliches Eb/N0), die die einzige Kombination ist, die eine veröffentlichte Raten-/Gewinntabelle je festlegen kann, und, wenn ein Aufrufer eine Systemrauschtemperatur angibt, den Empfangsantennengewinn, den diese Gütezahl impliziert

# text
seg-52f98f50522f = Keine externe Referenz: Dies ist Selbstbeschreibung über eine Gleichung, die bereits gegen eine veröffentlichte Design-Control-Tabelle validiert ist (siehe Zeile Einweg-Link-Budget). Sie wird festgehalten, weil ihr Fehlen ein gemessener Mangel war -- die Reproduktion der veröffentlichten d1_rate_gain_beamwidth.csv erforderte, aus allen dreißig Zeilen eine effektive Konstante auf { "0.0034" } dB zurückzurechnen, und die Engine benennt diese Kombination nun und beweist per Test, dass keine veröffentlichte Tabelle ihre drei Komponenten je hätte trennen können

# text
seg-a7b192e27cb5 = Übergangstabelle der Mondzeit je Uhrenklasse

# text
seg-cab605dc6ea2 = Ein Lauf des Mondzeitbudgets gibt je Uhrenklasse eine Übergangszeile Uhr-gegen-Bezugssystem gegenüber einem einzigen gemeinsamen Bezugssystemterm aus, sodass die Uhr die einzige Variable des Vergleichs ist; jede Zeile trägt den Übergang auf zwei Wegen erreicht -- per Bisektion aus der allgemeinen Potenzgesetz-Zeitfehlerkurve und algebraisch aus dem dominanten Rauschtyp der Zeile umgekehrt -- mit der relativen Differenz zwischen beiden

# text
seg-ccec15f0b125 = Zwei verschiedene Berechnungen derselben Größe innerhalb der Codebasis, nicht eine, die neu formuliert wurde: Die Bisektion auf der IEEE-1139-Potenzgesetzkurve weiß nichts über den Rauschtyp, während die geschlossene Form den dominanten Typ algebraisch umkehrt, sodass ein falsch klassifizierter Rauschtyp oder eine schlechte Einklammerung als nicht winzige relative Differenz erscheint. Die vier Werte reproduzieren auch die veröffentlichte Tabelle der Veröffentlichung bis auf die Hälfte der letzten gedruckten Stelle -- aber diese Tabelle wurde selbst aus derselben geschlossenen Form rekonstruiert, sodass dies eine Reproduzierbarkeitsprüfung und keine externe Referenz ist und der Bezugssystemterm, gegen den gemessen wird, eine modellierte Zuteilung ist

# text
seg-ff32b78acb8c = Gemeinsamer UT1- und Polbewegungsfehler über eine gemeinsame Zeilenmenge

# text
seg-561e588153af = Eine Tabelle gibt den UT1-Vorhersagefehler, den Polfehler der Polbewegung und ihre quadratische Kombination am Mond über eine IDENTISCHE Epochenmenge je Horizont an und gibt die Epochen aus, bei denen jede Komponente gemessen wurde. Gesondert benennt das Szenario, welche EOP-Eingabe gilt, und zerlegt deren Zeilenzählung und gibt stets die Tabelle der Horizonte vorhergesagt gegenüber final aus, mit einer ausdrücklichen Angabe, warum sie leer ist, wenn sie es ist

# text
seg-3692f1fc89e6 = Die Offline-Standardeingabe der Erdorientierung ist ein reales IERS-Produkt

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = Der Laufzeitstandard von <c1/> ist die eigene eingebettete Kopie der Bibliothek eines wörtlichen Auszugs aus IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } aufeinanderfolgende Tageszeilen, MJD 61224-61397, aus der finals2000A.all vom 2026-09-30 geschnitten), der alle drei vom Format definierten Zeilenjahrgänge trägt, klassifiziert nach den IERS-Flags I/P (eop::row_vintage): { "30" } finale Bulletin-B-Zeilen, { "54" } gemessene Rapid-Zeilen (Flag I ohne Bulletin-B-Block) und { "90" } Vorhersagen aus Bulletin A (Flag P). Ein bloßer Lauf ohne Dateiargument und ohne Netzwerk gibt eine gefüllte Tabelle je Horizont aus, die Zählung Zeilen = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) und predicted_rows.n = { "90" } über MJD 61308-61397; der Stand bei Ausgabe für die Vergleiche vorhergesagt gegenüber final ist die letzte gemessene Zeile. Der frühere Auszug mit 32 Zeilen (tools/finals2000A_2026.txt, jede Zeile mit Flag I) und der Auszug mit fünf rein finalen Zeilen werden weiterhin mitgeliefert und ausgeführt: Darauf ist predicted_rows.n gleich { "0" }, eine Eigenschaft der Eingabedatei und kein Parserergebnis

# text
seg-18c72a7565d6 = Erfassungs-Fußabdruck gegenüber Höhe und Strahlbreite

# text
seg-9c30a0ab5233 = Zweiachsiger Durchlauf des musterbewerteten, höhenbegrenzten Oberflächen-Erfassungs-Fußabdrucks über Senderhöhe und Schüsseldurchmesser, ausgegeben eine Zeile je Arbeitspunkt mit der Halbwertsstrahlbreite, die jeder Durchmesser impliziert, und die Erfassung am Horizont als SCHWELLE angegeben -- je Zeile das J/S am Horizont, seine Marge und die Sendeleistung, die es schließen würde; je Raster die gefundenen Durchgänge oder eine ausdrückliche Angabe, dass der Horizont nirgends im Raster erreicht wird, mit dem Fehlbetrag

# text
seg-fc0a64b9a280 = Reproduzierbarkeit des Mondzeit-Fehlerbudgets

# text
seg-5d5970506b9c = Das Szenario lunar-time-budget veröffentlicht seine feldwertigen Ausgaben als Tabelle in Langform (Rasterindex, Mittelungszeit, Term) neben dem Bericht, sodass die sieben x(tau)-Kurven je Term und die Wurzel aus der Quadratsumme der Gesamtheit Engine-Ausgabe sind und nichts, was ein Leser aus dem Methodenabschnitt neu aufbaut

# text
seg-62df6258bc62 = Nur Selbstkonsistenz: Die veröffentlichte Gesamtsumme wird gegen die Wurzel aus der Quadratsumme der Terme in derselben Datei geprüft, und die ausgegebene Kurve reproduziert die veröffentlichte p3_time_budget_curve.csv über alle { "57" } Punkte. Beide Prüfungen teilen die eigenen Termdefinitionen dieser Engine, daher ist keine davon unabhängig. Der Uhrenterm beruht auf veröffentlichten Uhrenspezifikationen, aber die GRÖSSENORDNUNGEN der Untergrenzen für Strecke, Bezugssystem, Relativistik und Ephemeride sind dokumentierte Budgetzuteilungen ohne externe Referenz

# text
seg-675887733454 = Zeitlabor der Mondstation: Holdover des miniRAFS gegenüber LTC

# text
seg-7dfedc40da6a = Der optionale Block [time_lab] des Szenarios lunar-time-budget modelliert eine Mondreferenz-Stationsuhr (standardmäßig die Klasse miniRAFS oder eine beliebige benannte Klasse oder eine an angegebene Stabilitätspunkte angepasste Gerätekarte), die auf die Koordinierte Mondzeit gesteuert und dann frei laufen gelassen oder alle N Sekunden neu gesteuert wird: die Zeitfehlerkurve x(t) als Wurzel aus der Quadratsumme des Potenzgesetz-Terms der Uhr, eines konstanten Steuerresiduums (ILLUSTRATIVE), eines konstanten Realisierungsresiduums der LTC und eines optional zuschaltbaren Terms für die Rate der Stationshöhe; die Zeit nach einer Steuerung auf { "1" }, { "10" } und { "100" } ns (oder angegebene Schwellen) per Bisektion neben der Umkehrung in geschlossener Form für den dominanten Rauschtyp und der dominante Term bei jedem angegebenen Horizont, jeweils mit Einheiten

# text
seg-3801e9b32309 = Nur interne Konsistenz: Die per Bisektion bestimmte Zeit bis zur Schwelle wird gegen die Umkehrung in geschlossener Form des dominanten Rauschtyps der Uhr geprüft und der frei laufende Uhrenterm gegen den eigenen Uhrenterm des Budgets. Die Uhrenklassen beruhen auf veröffentlichten Eintagesspezifikationen (ihre eigenen Zeilen); die LTC-Rate wird hier nicht neu hergeleitet und behält ihre eigene Zeile VALIDATED (Mondkoordinatenzeit); das Steuerresiduum ist ILLUSTRATIVE, das Realisierungsresiduum ist eine Budgetzuteilung, und es ist kein thermisches Modell enthalten. Das im Material der ICG WG-B Lunar PNT vom Juni { "2024" } beschriebene Ziel auf Nanosekundenniveau wird als Quellenaussage zitiert, nicht als Aussage übernommen; nichts hier ist eine Aussage über eine reale Stationsuhr

# text
seg-af3ff120b707 = Geodätische VLBI zum Mond

# text
seg-cfd7d0126028 = Nahfeld-VLBI-Verzögerung für eine Erdbasislinie, die ein Mondbaken beobachtet + partielle Ableitungen

# text
seg-d1943f9932af = Delta_dor für ebene Wellen (innerhalb derselben Codebasis) im Fernfeldgrenzfall; partielle Ableitungen durch finite Differenzen. Externer Vergleich { "0.30" }, ein Befund (bleibt MODELLED): Gegenüber ANISE { "0.10" } mit konvergierten Lichtlaufzeiten durch DE440 ({ "75" } Verzögerungen am 2024-01-01 über drei DSN-Basislinien, erzeugt von xval/anise-lunar-od ohne Kshana-Code) liegt keine Verzögerung innerhalb der Toleranz von { "1" } ps. Die größte Lücke beträgt { "24" } µs und stammt vom analytischen Mondzentrum (etwa { "200" } km von DE440), der einzelnen momentanen Geometrie ohne Lichtlaufzeit-Iteration ({ "3.6" } µs) und der ausgelassenen Polbewegung; partielle Ableitungen der Bake weichen um bis zu { "2.9e-3" } relativ gegenüber { "1e-6" } ab. Die Aussage in der Moduldokumentation, dass die Näherungen des Bezugssystems unterhalb der Modellgüte liegen, gilt auf diesem Niveau nicht. { "0.30" } Runde { "2" }: Der Kernelpfad (lunar_vlbi::KernelGeometry) wird gegen die Lichtlaufzeiten von NAIF SPICE in seiner eigenen Zeile validiert, Geodätische VLBI zum Mond, Kernelpfad; der ANISE-Vergleich dieses Pfades (75/75 innerhalb von { "1" } ps, ungünstigster Wert { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) ist nur eine Gegenprüfung der Kernel-Auswertung, weil die Lichtlaufzeitlösung in diesem Harness die des Projekts selbst ist. Diese Zeile (der analytische Standardpfad) bleibt mit dem obigen Befund MODELLED

# text
seg-d12d4565b01d = Geodätische VLBI zum Mond, Kernelpfad

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Nahfeld-VLBI-Verzögerung für eine Erdbasislinie, die eine Mondbake beobachtet, mit partiellen Ableitungen für Bake und Station, auf dem Kernelpfad (lunar_vlbi::KernelGeometry): Erde und Mond aus DE440, Hauptachsen des Mondes aus DE440, Erdorientierung ITRF93 mit UT1 und Polbewegung, jede Lichtlaufzeit im baryzentrischen System konvergiert, partielle Ableitungen mit dem Lichtlaufzeitfaktor 1/(c - u.V). Ausführbar als Szenario <c1/> mit gesetzten planetary_kernel_path, earth_orientation_kernel_path und moon_orientation_kernel_path; die validierten Ausgaben sind die Serie geometric_delay_s des Kernelpfads und epoch_partials. Auf dem Kernelpfad addiert delay_s den analytischen differenzierten Shapiro-Term, der nicht verglichen wird, und delay_rate sowie near_field_correction_us werden nicht verglichen

# text
seg-1f10810131be = NAIF-Kernel-Leser: DAF-Container, SPK-Typ { "2" } und binärer PCK-Typ { "2" }

# text
seg-7da4847e7a28 = Der eigene reine Rust-Leser der Engine für binäre NAIF-Kernel (naif_kernel): der DAF-Container (beide Byte-Reihenfolgen, verkettete Zusammenfassungsdatensätze), SPK-Typ-2-Tschebyscheff-Positionssegmente, über ihre Zentren bis zu einem niedrigsten gemeinsamen Vorfahren verkettet, und binäre PCK-Typ-2-Euler-Winkel-Segmente, die in eine Rotation von J2000 zum Körper umgewandelt werden, wobei Epochen als zweiteilige ET genommen werden, damit ein Versatz unterhalb einer Mikrosekunde seine Genauigkeit behält. Er ist es, durch den KernelEphemeris (ephem_provider) und die Kernelpfade von lunar_vlbi, lunar_llr und lunar_vlbi_fim DE440 lesen. Die Aussage ist, dass er JPL-Kernel korrekt liest; es ist keine Aussage, dass DE440 oder die analytischen Sonnen- und Mondreihen der Engine genau sind

# text
seg-e08e98908f3a = Erde-GNSS in Mondentfernung

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Erde-GNSS-Empfang in Mondentfernung: die Schwachsignal-Schicht, die P7 Tabelle { "1" } nennt und für die die Engine kein Modell hatte. Je Satellit und je Epoche berechnet sie den Außeraxenwinkel gegenüber dem Nadir des Senders, ob die Erde den geraden Pfad verdeckt, die Schrägentfernung und ihre Freiraumdämpfung, den Sendegewinn bei diesem Winkel, die Empfangsleistung und die Trägerleistungsdichte zu Rauschen; anschließend aggregiert sie nur die Strecken, die eine Tracking-Schwelle überschreiten, und durchläuft einen vollen Umlauf der Konstellation, sodass die Antwort eine VERTEILUNG statt einer Momentaufnahme ist. Drei Tatsachen bestimmen das Ergebnis, und der Bericht nennt jede: Die Erde erscheint vom Konstellationsradius aus unter { "13.90" } Grad, sodass die Strahl-SPITZE für jeden zum Mond gerichteten Strahl geometrisch nicht verfügbar ist; übrig bleiben der Rand der Hauptkeule und die Nebenkeulen, das Regime, in dem LuGRE { "2025" } am Mond arbeitete; und die Pfaddämpfung auf L1 beträgt etwa { "208" } dB, rund { "25" } dB mehr als ein terrestrischer Nutzer zahlt. MEASURED an der mitgelieferten GPS-artigen Geometrie mit 24 Satelliten über { "64" } Epochen einer Umlaufperiode: SIGNAL-Verfügbarkeit { "0.375" } mit einer besten Strecke von { "30.93" } dB-Hz und FIX-Verfügbarkeit { "0.000" } - höchstens zwei gleichzeitig verfolgbare Strecken, nie die vier, die eine Position braucht. Die Trennung dieser beiden Verfügbarkeiten ist der Punkt, und der Bericht lässt nicht zu, dass sie verwechselt werden: Erde-GNSS in Mondentfernung ist eine Schicht der TIMING-Güteklasse, nicht der Positionsgüteklasse, und ein Layered-Resilience-Prior muss die Fix-Verfügbarkeit nehmen. Die Konditionierung wird aus demselben Grund ausgegeben - jeder sichtbare Satellit liegt vom Mond aus gesehen innerhalb eines Kegels von wenigen Grad Breite, sodass die Sichtlinien konstruktionsbedingt nahezu parallel sind. Ausführbar als Art <c1/> Neu gefasst nach D7: Die Aussage in Mondentfernung ist die RELATIVE Trägerleistungsdichte zu Rauschen zwischen Satelliten in einer Epoche, aus gemessenen zweidimensionalen Sendemustern (NAVCEN Block IIR/IIR-M), plus geometrische Sichtbarkeit; ein absolutes C/N0 wird nicht beansprucht (Parker et al. berichten einen gemeinsamen Verlust von { "7" } bis { "12" } dB).

# text
seg-29df5b40a3f9 = Mondbahnbestimmung: Erde-GNSS gegenüber bodengestützter Radiometrie

# text
seg-647902ebcee3 = Bahnbestimmung in einer fast geradlinigen Halo-Bahn (oder einer elliptischen eingefrorenen Bahn) aus zwei unabhängigen Datentypen: an Bord empfangene Erde-GNSS-Pseudoentfernungen (die Streckenregel der Zeile Erde-GNSS in Mondentfernung, plus Mondverdeckung) und bodengestützte Zweiweg-Entfernung und Entfernungsrate von drei Stationen des Deep Space Network. Jede ist eine Einschritt-Batch-Kleinste-Quadrate-Lösung um die Referenzbahn mit ihrer formalen Kovarianz; eine gesäte Monte-Carlo-Studie der Differenz der beiden Schätzungen prüft, ob die beiden Kovarianzen sie erklären (q = d' (P_G + P_R)^-1 d, Chi-Quadrat mit sechs Freiheitsgraden, wenn die Modelle übereinstimmen) und was eine unmodellierte Beschleunigung mit der Statistik macht.

# text
seg-226dedaba243 = Ein unabhängiges scipy/numpy-Programm integriert dieselben Variationsgleichungen (Zielwert O1). Nichts wird mit einer Messung einer Mondbahn verglichen. Die Referenz prüft die Numerik angegebener Formeln, nicht die Physik, daher bleibt die Zeile MODELLED. Eingeschränktes Dreikörpermodell: keine Sonne, keine Mondharmonischen, die Erdrotationsachse entlang der Bahnnormalen, ILLUSTRATIVE Empfänger- und Stationseingaben.

# text
seg-652bdc29deea = Auflösung der Trägerphasen-Mehrdeutigkeit am Mond: Oberfläche und Orbiter

# text
seg-02496f9e9af2 = Zwischen Empfängern einfach differenzierte Erde-GNSS-Trägerphase und Code an einer Mondoberflächenstation und einem Orbiter, wobei die Uhrendifferenz je Epoche herausprofiliert wird, eine Mehrdeutigkeit je kontinuierlichem Überflug und der längste Überflug als Eichung. Die Float-Mehrdeutigkeitskovarianz ist ein Schur-Komplement; LAMBDA löst die ganzen Zahlen auf, die Bootstrap-Rate wird neben einer gesäten Monte-Carlo-Erfolgsrate der ganzzahligen Kleinste-Quadrate-Lösung und den Positions-Sigmas für Float und Fixed angegeben. Berichtet wie gefunden: Bei den registrierten { "12" } dBi ist das Problem der Doppeldifferenz nicht bildbar (Änderung { "1" } verlegte den Standard auf { "25" } dBi, nachdem nur Verfügbarkeitszahlen gesehen wurden), und bei { "25" } dBi wird ganzzahliges Fixieren NICHT erreicht - außer Reichweite (höchstens wenige Prozent), obwohl sich die Float-Lösung mit dem Bogen verbessert.

# text
seg-8d8296752eb8 = Eine unabhängige numpy-Lösung derselben Normalgleichungen aus den exportierten Zeilen (Q3) und eine Brute-Force-Aufzählung der ganzen Zahlen (Q4). Es wird mit keiner GNSS- oder Mond-Trägerphasenmessung verglichen. MODELLED.

# text
seg-11dd1bb8e4e1 = Mitschätzung des Mondbezugssystems: Oberflächenstationen und Orbiter

# text
seg-a38c8d95e6c9 = Fisher-Information des Datums des Mondbezugssystems mit sieben Parametern aus Erdstations-Laserentfernungsmessung zu den fünf Reflektoren allein und mit zusätzlichen Orbiter-zu-Oberflächenstation-Entfernungen: die Informationsmatrix, der Rang, Cramér-Rao-Sigmas, die Degenerationsmetrik des Identifizierbarkeitsmoduls des Mondes und gesäte zufällige Stationsmengen. Die Bahn wird in den Mondachsen als bekannt gehalten (ihr Fehler wird vom Entfernungssigma des Orbiters getragen).

# text
seg-47d2afc53b3d = Eine unabhängige numpy-Finite-Differenzen-Rechnung des Vorwärtsmodells (F2). Es wird nichts mit realen Lösungen des Mondbezugssystems verglichen. Der Faktor ist bedingt durch die angenommene bekannte Bahn und das Entfernungssigma von { "1" } m. MODELLED.

# text
seg-862977c4bb01 = Präzision der Bezugssystem-Verknüpfung im Weltraum: ko-lokalisierte GNSS, VLBI und Laserentfernungsmessung

# text
seg-a9ae8e99f00d = Cramér-Rao-Präzision der Translations-, Maßstabs- und Rotationsversätze zwischen den Techniken für GNSS-, VLBI- und Laserentfernungs-Bezugssysteme, wenn ein Raumfahrzeug alle drei trägt, wobei die Raumfahrzeugposition in jeder Epoche eliminiert wird und neun Störparameter der lokalen Verknüpfung einen Prior tragen, über die Genauigkeit der lokalen Verknüpfung durchlaufen. Kovarianzen über den Quadratwurzelweg (Normalgleichungen verlieren die Stellen, wenn die Techniken nahezu perfekt sind).

# text
seg-b37ac7294112 = Ein unabhängiges numpy-System in gestapelter Form, bei dem die Positionsunbekannten durch explizite Schur-Komplemente eliminiert werden (T3). Es wird mit keinen Daten von GRASP, Genesis oder anderen Missionen verglichen. MODELLED.

# text
seg-ae627996875e = Sensitivität gegenüber Love-Zahlen und Libration des Mondes

# text
seg-28780d07c4a7 = Fisher-Information von h2, k2, l2 und den physikalischen Librationsamplituden aus Laserentfernungsmessung (radiale und horizontale Gezeitenverschiebung, Reflektorrotation), Orbiter-Tracking (die k2-Beschleunigung vom Grad 2, entlang der Sichtlinie integriert, Trend entfernt), einem Oberflächengravimeter (gravimetrischer Faktor { "1" } + h2 - { "1.5" } k2) und einer Oberflächenuhr (relative Rate ({ "1" } + k2 - h2) W2/c2, an die Mondzeitkonstanten gebunden). Nominalwerte von h2 und l2 sind Linearisierungspunkte; die Studie sagt, was wogegen empfindlich ist, nicht, was die Zahlen sind.

# text
seg-180d74388339 = Ein unabhängiger numpy-Aufbau mit finiten Differenzen (G2) und eine Auswertung in geschlossener Form (G4). Die k2-Sensitivität der Orbiter-Familie ist eine Zahl am oberen Ende (der Bahnzustand absorbiert hier nur eine Konstante und einen Trend). Es wird mit keiner Messung von Mondgezeiten oder Libration verglichen; k2 wird nach Lemoine et al. { "2014" } als Nominalwert zitiert. MODELLED.

# text
seg-da712b740519 = DOP-Verbesserung durch Oberflächenbaken auf dem Mond

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Durch Baken verbesserte Präzisionsverdünnung für einen Nutzer auf der Mondoberfläche: Die Sichtlinienzeilen der sichtbaren Satelliten und die Entfernungsmesszeilen der sichtbaren Oberflächenbaken werden zu einer Entwurfsmatrix verkettet und über den gemeinsamen DOP-Kern ausgewertet, und die resultierende DOP wird über einen Nutzeräquivalenz-Entfernungsfehler je Bake, zusammengesetzt als Wurzel aus der Quadratsumme von Uhrensynchronisations-, Mehrwege- und Vermessungstermen, auf eine realisierte 1-Sigma-Genauigkeit IN METERN abgebildet. Die Sichtbarkeit der Baken ist der geometrische Horizont des luftlosen Mondes bei zwei Höhen, der keine refraktive Erweiterung hat und daher exakt statt näherungsweise ist. Ausführbar als Szenarioart <c1/>, die Satelliten allein, Satelliten plus Baken und eine größere Konstellation als konkurrierenden Weg zur selben Geometrie angibt. MEASURED an der mitgelieferten Golden-Geometrie (Nutzer bei -80 Grad, drei vermessene Baken, illustratives LCNS mit sechs Satelliten bei t={ "0" }, Maske { "5" } Grad): { "5" } sichtbare Satelliten ergeben PDOP { "9.6941" } und ein 3-D-1-Sigma von { "11.222" } m; das Hinzufügen der Baken, die den Horizont tatsächlich überschreiten, ergibt PDOP { "4.1160" } und { "4.765" } m, ein Faktor von { "2.355" }; der Dienst mit 24 Satelliten ergibt stattdessen PDOP { "2.4226" } und { "2.804" } m, ein Faktor von { "4.002" }. Der Bericht gibt die Anzahl der SICHTBAREN Baken statt der konfigurierten aus, und bei dieser Geometrie überschreitet nur EINE der drei Baken den Horizont: Die beiden flankierenden Standorte liegen etwa { "333" } km vom Nutzer entfernt gegenüber einem Horizont von { "86" } km für eine Antenne von { "2" } m, sodass ein Leser nie annehmen muss, alle drei hätten beigetragen

# text
seg-b0b618abf402 = Integritätsblindheit bei Gleichtakt

# text
seg-e732ac99a9ae = Exakte Aufspaltung eines Messfehlers im Paritätsunterraum in den Teil, den RAIM nicht sehen kann, und den Teil, den es sehen kann. Für das linearisierte Momentaufnahmemodell y = G·x + e zerfällt jeder Fehler dy eindeutig in eine BLINDE Komponente in range(G) — als Zustandsfehler S·dy absorbiert und vom Residuenprojektor Pperp = I − G·S ausgelöscht, daher für JEDEN Residuentest unsichtbar, nicht nur für eine bestimmte Schwelle — und eine ERKENNBARE Komponente im Paritätsraum. Das Modul liefert den Projektor, die Aufspaltung und den blinden Anteil, sodass ein Aufrufer beziffern kann, wie viel eines bestimmten Fehlers ein Momentaufnahme-Monitor strukturell nicht melden kann. Angewandt auf die reale Untergrenze zwischen Ephemeriden: Die Abweichung DE440 gegenüber INPOP21a und DE440 gegenüber EPM2021 auf Meterebene in der geozentrischen Mondposition wird fast vollständig als Nutzerpositionsfehler absorbiert (Median des blinden Anteils { "1.000000" }; Median des blinden Positionsfehlers { "2.3955" } m und { "2.0050" } m) gegenüber einem Paritätsresiduum auf dem Niveau von { "1e-15" } m

# text
seg-845e9f5eec81 = Schutzniveau bei Gleichtakt und gesamte Integritätshüllkurve

# text
seg-ffc59a7ed497 = Analytische Projektoralgebra, gegen sich selbst geprüft: Eine auf range(G) beschränkte Kovarianz muss ein positives CMPL ergeben, eine auf den Paritätsraum beschränkte etwa null, und die Hüllkurve muss zwei im Messraum orthogonale Beiträge summieren. Die Gleichtakt-Kovarianz, die Konstellationsgeometrie und k sind repräsentative modellierte Eingaben, KEIN zertifiziertes Budget, und es wird nicht behauptet, dass die Dreiecksschranke scharf ist. HINWEIS ZUR HERKUNFT: cmpl_horizontal, blind_position_covariance und integrity_envelope sind öffentlich und ausgeliefert, und ihre Unit-Tests wurden von der Zeile zur Gleichtaktblindheit bereits zitiert, aber die AUSSAGE ZUR HÜLLKURVE selbst trug keine Zeile - so wurde der eine Vorbehalt, der sie ehrlich hält, dass die Summe eine Dreiecksschranke und keine RSS ist, nirgends im Register angegeben. Die Zeile registriert die Aussage und den Vorbehalt gemeinsam.

# text
seg-5ed34a5b402e = Gemeinsame Multitechnik-Bahnbestimmung + Uhr am Mond

# text
seg-5ace1caff5a9 = Batch-Fusion von VLBI + mondlokaler Entfernung + Inter-Satelliten-Entfernung zur Wiedergewinnung von Positionen und Uhren der Stationen und der Konstellation

# text
seg-1b96577665fc = Radiometrie, MTF, relative Kantenantwort und GIQE { "4" } NIIRS eines elektrooptischen Bildgebers

# text
seg-07ca77a67207 = Verluste beim Raketenaufstieg durch Gravitation, Widerstand, Lenkung und Gegendruck

# text
seg-58cbf576c959 = Leser für TRK-2-18-Orbit-Data-Files und gerampetes Mars-2-Wege-Dopplermodell

# text
seg-d1055650a77f = Ein Leser für DSN-Orbit-Data-Files (TRK-2-18): die 36-Byte-Satzgruppen (Dateikennsatz, Kennung, Bahndaten, Rampen je Station, Uhrenversätze, Zusammenfassung, Dateiende) und in jedem Bahndatensatz die Zeitmarke seit { "1950" }, Downlink- und Uplink-Verzögerungen, Observable, Stationen, Datentyp, Bänder, Gültigkeit, Kanal, Raumfahrzeug, die 46-Bit-Referenzfrequenz und die Kompressionszeit; Start- und Endzeiten der Rampen, Raten und Startfrequenzen. Darauf aufbauend ein gerampetes 2-Wege-X-Band-Dopplermodell (integrierte Uplink-Rampen, Rundlauf-Lichtlaufzeit mit Shapiro und Troposphäre, DSN-Stationen über die CIO-Kette IAU 2006/2000A und IERS-EOP, Stationszeit) und eine Batch-Bahnbestimmung für Mars-Orbiter (GMM-3-Feld, Drittkörper, SRP, Widerstand).

# text
seg-6d533149f6f0 = Das PDS3-Label, das der Datenaufbereitungsprozess der DSN-Navigation mit der Datei erzeugt hat (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), geprüft gegen Zielwerte, die in xval/mro-odf/PREREGISTRATION.md vorab registriert wurden, bevor der Leser existierte. MODELLED, weil ein registrierter Zielwert (die Zeilen der Dateiende-Tabelle, { "121" } in der Datei gegenüber { "120" } im Label) verfehlt wurde; das Label ist dort in sich widersprüchlich. Stufe { "2" } (xval/mro-od/PREREGISTRATION.md, Änderungen A1 und A2 vor dem bewerteten Ergebnis): Der aus der Rekonstruktion des MRO-Navigationsteams (mro_psp5, NAIF) vorhergesagte Doppler stimmt mit dem beobachteten gerampeten 2-Wege-Doppler auf { "12.5" } mHz auf Überflügen überein, die nicht in der Entwicklung verwendet wurden, Zielwert erreicht; die registrierte Bahnbestimmung scheiterte auf dem bewerteten Bogen (Normalmatrix nicht positiv definit) und lieferte keine Bahn, daher wurden die Bahn-Zielwerte nicht erreicht. Lauf { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, ein gedämpfter Schätzer, derselbe Bogen und dieselben Zielwerte, eine Bewertungsänderung R2-A1 offengelegt in docs/revisions) konvergierte: Die geschätzte Bahn liegt innerhalb von { "0.36" } km RMS ({ "0.53" } km Maximum) der Rekonstruktion, Zielwerte erreicht, aber der Post-Fit-Doppler-RMS beträgt { "48.6" } mHz gegenüber dem Zielwert von { "30" } mHz, nicht erreicht, daher bleibt die Zeile MODELLED. WAS NICHT: Keine geschätzte Bahn hat jeden registrierten Zielwert erreicht; Ionosphäre, Sonnenplasma und der größte Teil des Antennenversatzes (ein radialer Versatz von { "1.5" } m wird auf dem Entwicklungsüberflug angepasst) sind nicht modelliert.

# text
seg-c7d292f14693 = Geschlossene MRP-Rückführungs-Lageregelung mit Reaktionsrädern

# text
# c1: aocs
seg-f33781b74cc2 = Trägheitsorientierte Lageregelung eines starren Körpers mit drei oder mehr ausgewogenen Reaktionsrädern: das MRP-Rückführungsgesetz L_r = -K sigma_BR - P omega_BR (Schaub und Junkins), normminimale Radmotormomente G_s u = -L_r, auf die Grenze jedes Rades begrenzt, die gekoppelte Dynamik von Körper und Rädern mit der Körperträgheit, die die Spinträgheit der Räder trägt, Quaternionenkinematik, RK4 mit einem Halteglied nullter Ordnung. Ausführbar als Szenarioart <c1/> (Schleife mit wahrem Zustand).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; der Lauf mit bsk-Rädern als getrenntes Werkzeug, nie gelinkt oder mitgeliefert): Raumfahrzeugkörper, reactionWheelStateEffector (BalancedWheels, Momentengrenze an), simpleNav, inertial3D, attTrackingError, mrpFeedback (ohne Integralterm) und rwMotorTorque bei dt = { "0.1" } s mit seinem RK4, gegenüber der eigenen Implementierung von Kshana in drei Fällen (drei orthogonale Räder; eine Vierrad-Pyramide; ein sättigender Vierrad-Fall), Zielwerte vorab registriert in xval/aocs-basilisk/PREREGISTRATION.md vor dem Code und dem Lauf. Alle Zielwerte hielten im ersten Lauf. WAS NICHT: Sensorrauschen in der Schleife, Integralrückführung, Tracking-Führung, Radreibung, Jitter, Drehzahlgrenzen und Leistung, die Verstärkungen eines realen Raumfahrzeugs; der Vergleich prüft die Implementierung des Gesetzes und der Dynamik gegen eine unabhängige, keinen Flugregler.

# text
seg-455dc946c965 = Multiplikative EKF-Lageschätzung aus einem Gyro und einem Sternsensor

# text
# c1: aocs
seg-553d043438b4 = Das multiplikative EKF nach Lefferts-Markley-Shuster: Lagefehler im Körpersystem und Gyro-Bias-Zustände, Propagation mit der Gyrorate abzüglich der Bias-Schätzung und dem diskreten Prozessrauschen nach Farrenkopf (Winkel- und Raten-Random-Walk), Sternsensor-Updates mit dem Residuum { "2" } vec(q^-1 q_st) in Joseph-Form und dem multiplikativen Reset; ein diskreter Gyro- und Sternsensor-Simulator nach Farrenkopf. Die Art <c1/> kann den Regelkreis auf seiner Schätzung schließen.

# text
seg-846cb1eeb35c = Interne Konsistenz: der normierte quadrierte Schätzfehler des Filters gegenüber einer Wahrheit, die aus denselben Sensormodellen über Monte-Carlo-Seeds simuliert wurde, und die Konvergenz der Lage- und Bias-Schätzungen. WAS NICHT: Es wurde kein externer Schätzer und keine Flugdaten verglichen (Basilisk { "2.9.1" } hat kein MEKF-Modul); die Sensormodelle sind die aus dem Lehrbuch, ohne Fehlausrichtung, Skalenfaktor oder Gesichtsfeldeffekte des Sternsensors.

# text
seg-059732bda693 = Lagebestimmung nach Wahba/TRIAD/QUEST

# text
seg-3ee6e56d790f = Optimale dreiachsige Lage aus gewichteten Vektorbeobachtungen (Stern-/Sonnen-/Magnetometerrichtungen): das deterministische Zweivektor-TRIAD, die q-Methode von Davenport (der exakte Minimierer des Wahba-Verlusts — das optimale Quaternion ist der Eigenvektor zum größten Eigenwert der { "4" }×{ "4" }-Davenport-Matrix K, gelöst mit einem symmetrischen Jacobi-Eigenlöser) und QUEST (Newton-/Sekanten-Nullstelle der charakteristischen Gleichung von K, mit Σ Gewichte als Startwert, danach Quaternion-Rückgewinnung über den Gibbs-Vektor)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — die SVD-Lösung nach Kabsch/Markley für das Wahba-Problem, ein wirklich unabhängiger Algorithmus (SVD der Lageprofilmatrix) und eine eigene Codebasis gegenüber dem Davenport-K-Eigenlöser / dem Wurzelverfahren der charakteristischen Gleichung nach QUEST in kshana, die DIESELBE eindeutig definierte Wahba-optimale Lage berechnet. Auf rauschfreien gewichteten Vektorbeobachtungsmengen reproduzieren TRIAD, die q-Methode und QUEST die optimale Rotation von scipy bis <{ "1e-9" } rad (verglichen über den vorzeichenunabhängigen Lagefehlerwinkel). Die statistische Aussage 'optimal schlägt TRIAD' aus verrauschtem Monte-Carlo bleibt MODELLED (keine externe Referenz); nur Beobachtungen als punktförmige Richtungs-Einheitsvektoren — keine Modellierung von Sensorgesichtsfeld/Bias/zeitlicher Korrelation, und QUEST ist bei { "180" }° singulär (die q-Methode deckt diesen Fall ab)

# text
seg-cd342cc48afc = Erkennungsstatistik der Square-Law-Akquisition bei GNSS

# text
seg-6d97452de33e = Square-Law-Akquisitionsdetektor (nichtkohärent) über eine Suche Codephase × Doppler: Fehlalarmwahrscheinlichkeit (zentrales χ² mit 2M Freiheitsgraden), die Schwelle, die ein Ziel-P_fa erreicht (χ²-Verteilungsfunktion per Bisektion umgekehrt), und Detektionswahrscheinlichkeit (nichtzentrales χ² mit Nichtzentralität 2M·ρ für das SNR ρ je Zelle nach der Korrelation), mit der verallgemeinerten Marcum-Q-Funktion Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — ein unabhängiger Algorithmus (Kettenbruch für nichtzentrales/zentrales χ²) gegenüber der Reihe der unvollständigen Gammafunktion in kshana (raim::chi2_cdf / noncentral_chi2_cdf), der denselben eindeutig definierten KERN der Detektionsstatistik berechnet: die verallgemeinerte Marcum-Q-Funktion Q_M(a,b)=ncx2.sf(b²,2M,a²), die Detektionswahrscheinlichkeit P_d, die Fehlalarmwahrscheinlichkeit P_fa und die Umkehrung P_fa→Schwelle, übereinstimmend bis ~{ "1e-6" } — dieselbe Unabhängigkeitsbasis wie in der validierten Zeile 'RAIM/ARAIM integrity statistical kernel'. Nur der KERN: das CFAR-Zellmitteln je Zelle und der Straddling-Verlust der Code-/Doppler-Bins bleiben MODELLED

# text
seg-77f425a38aa2 = Auflösung ganzzahliger Trägerphasen-Mehrdeutigkeiten bei GNSS (LAMBDA)

# text
seg-410ce8b6cebf = Fixieren der Mehrdeutigkeiten durch ganzzahlige Kleinste-Quadrate-Lösung nach der LAMBDA-Art: eine volumenerhaltende ganzzahlige (Z-)Dekorrelationstransformation (ganzzahlige Gauß-Größenreduktion des Faktors L D Lᵀ) + eine exakte ganzzahlige Kleinste-Quadrate-Suche mit Tiefensuche und Branch-and-Bound nach Schnorr–Euchner, mit dem Ratio-Test auf den zwei besten Kandidaten (die validierte Aussage); dazu die Bootstrap-Erfolgsrate in geschlossener Form P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), nur intern geprüft und außerhalb der validierten Aussage

# text
seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (seine Quelldatei lambda.c, T. Takasu, BSD-2-Clause), eine unabhängige LAMBDA-Reduktion und MLAMBDA-Suche, aus C kompiliert und als Werkzeug ausgeführt, auf { "300" } zufälligen Kovarianzen (n { "2" } bis { "10" }): Die ganzzahlige Kleinste-Quadrate-Lösung hat einen eindeutigen Minimierer, daher müssen die fixierten ganzen Zahlen identisch sein ({ "0" } Abweichungen), und die beiden besten quadrierten Normen, die in den Ratio-Test eingehen, stimmen auf { "1e-9" } relativ überein (gemessen { "5.6e-13" }); Toleranz vor dem Vergleich festgelegt. Validierte Aussage: die ILS-Lösung und ihre beiden besten Normen. RTKLIB berechnet die Bootstrap-Erfolgsrate nicht, die weiterhin intern gegen eine Monte-Carlo-Simulation des Rundungsprozesses geprüft wird; die Invarianten der Z-Transformation und die Brute-Force-Aufzählung bleiben als stützende Prüfungen bestehen. Nur ganzzahlige Gauß-Dekorrelation (die Umordnungspermutationen der vollständigen LAMBDA-Reduktion beschleunigen die Suche, ändern aber weder die exakte ILS-Antwort noch die Bootstrap-Rate)

# text
seg-4ad1ec05610f = B-Ebenen-Zielführung und Gravity Assist mit gepatchten Kegelschnitten

# text
seg-d249aea7c3ea = Geometrie des hyperbolischen Vorbeiflugs (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, Ablenkwinkel δ={ "2" }·asin(1/e), Stoßparameter |B|=|a|·√(e²−{ "1" })), das Zielpunkt-Bezugssystem Ŝ/T̂/R̂ der B-Ebene und die Zerlegung B·T̂/B·R̂ sowie ein Gravity Assist mit gepatchten Kegelschnitten (Betrag von v∞ erhalten, Richtung um δ abgelenkt, heliozentrisches Δv={ "2" }·v∞·sin(δ/2) ohne Treibstoffkosten) mit dem Tisserand-Parameter T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-8e82da17a463 = CRPA-Anti-Jam-Array-Strahlformung

# text
seg-1744f527b4d1 = Nullung einer Antenne mit kontrolliertem Empfangsmuster: komplexe Array-Steuervektoren a(û)=exp(j·k·pₙ·û), deterministische Nullsteuerung (Einheitsgewinn zum SV, exakte Nullen zu bis zu N−{ "1" } Störern über das normminimale w=Aᴴ(AAᴴ)⁻¹b) und adaptive MVDR-Gewichte w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv), die tiefe Nullen selbstständig auf starke Störer lenken (mit einem komplett selbst geschriebenen Kern der komplexen linearen Algebra)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK-zgesv-Komplexlösung) — eine von dem komplett selbst geschriebenen komplexen Kern in kshana unabhängige Codebasis der linearen Algebra, die DIESELBEN eindeutig definierten Gewichte berechnet: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) und normminimale Nullsteuerung w=Aᴴ(AAᴴ)⁻¹b, dazu die resultierenden Array-Antwortgewinne, übereinstimmend bis ~{ "1e-9" } — dieselbe Klasse von Referenz wie bei den validierten Zeilen zu DOP (gnss_lib_py) und Fisher-Information (numpy). MODELLED schmalbandiges Fernfeld-Array aus identischen isotropen Elementen — keine Verkopplung, keine Fehlanpassung je Element, keine endliche Bandbreite (STAP) und kein Schätzfehler des Steuervektors

# text
seg-f2c973f14d52 = Potenzgesetz-Uhrenrauschen nach IEEE-1139 + Flicker-FM-Untergrenze

# text
seg-4a0159558671 = Die Umrechnung PSD↔Allan-Varianz nach IEEE-1139 mit fünf Koeffizienten S_y(f)=Σh_α f^α → σ_y²(τ) (weißes/Flicker-PM, weißes/Flicker-/Random-Walk-FM), die Flicker-FM-Untergrenze σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) als erstklassiger anpassbarer Term und eine nichtnegative Anpassung der FM-Familie in der Basis { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }, die die Untergrenze wiedergewinnt, die die Driftbasis { "{" }1/τ,τ,τ³{ "}" } nicht darstellen kann

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; Koeffizienten nach Kasdin & Walter { "1992" } / Vernotte { "2015" }) — eine unabhängige Codebasis eines Drittanbieters mit eigener Zitatlinie, die DIESELBE eindeutig definierte Umrechnung PSD→Allan nach IEEE-1139 σ_y(τ) für jeden der fünf Potenzgesetz-Rauschtypen berechnet. powerlaw::allan_deviation von kshana stimmt mit den geschlossenen Formen von allantools überein (weißes/Flicker-FM, RW-FM und weißes PM auf <{ "5e-9" } relativ; Flicker-PM auf ~{ "1e-5" } — das echte Unabhängigkeitssignal, da kshana die tabellierte Konstante { "1.038" } aus NIST-SP-1065 verwendet gegenüber dem vollen 3γ−ln2 von allantools), und die Flicker-FM-Untergrenze √({ "2" } ln2·h_{ "{" }-1{ "}" }) stimmt über die ganze Leiter mit allantools überein — dieselbe Latte, die die validierten Zeilen MDEV/TDEV/Theo1/MTIE nehmen. MODELLED stationäres Potenzgesetzmodell — kein deterministischer Drift-Term (τ²); gerätespezifische Koeffizienten / gemessene Untergrenzen bleiben modelliert

# text
seg-cc1ac065e684 = Austausch des Kovarianzblocks im CCSDS-OEM

# text
seg-ec4d44e7cf78 = Serialisieren und Parsen des CCSDS-{ "502.0" }-OEM-Blocks COVARIANCE_START…COVARIANCE_STOP — die { "6" }×{ "6" }-Kovarianz von Position/Geschwindigkeit, geschrieben als ihr unteres Dreieck mit 21 Elementen (kanonische Reihenfolge CX_X … CZ_DOT_Z_DOT) mit dem optionalen COV_REF_FRAME, als Ergänzung zum vorhandenen Writer/Parser für OEM-Zustandsvektoren, sodass Kovarianzen aus Bahnbestimmung und Filtern im Standardformat einen Round-Trip bestehen

# text
seg-ae061c7f082c = Fehlerwachstum und Schwellendurchgänge bei INS/TRN-Auslauf

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Budget Positionsfehler gegenüber Auslaufdauer, aufgebaut aus IMU-Koeffizienten, wobei jede Fehlerquelle (Beschleunigungsmesser-Bias, Gyro-Bias, Geschwindigkeits-Random-Walk, Winkel-Random-Walk, Skalenfaktor im Reiseflug und unter anhaltender spezifischer Kraft) durch ein INS-Fehlermodell mit neun Zuständen im lokalen Horizontsystem mit Schuler-Rückführung propagiert wird (inertial::coast::ErrorDynamics nach Groves 2. Aufl. Kap. { "14" }: Lage-, Geschwindigkeits- und Positionsfehler, der vertikale Kanal mit seinem Gravitationsgradienten, WGS-84-Radien und Normalschwere, eine ebene Plattform mit Kurs Nord bei der konfigurierten Geschwindigkeit, latitude_deg und height_m; systematische Terme durch eine erweiterte Matrixexponentialfunktion, Random Walks nach Van Loan), die Monome der flachen Erde nur als leading_order_m beibehalten; Beiträge kombiniert nach einer angegebenen Regel (rss / linear-sum / deterministic-sum-with-stochastic-rss); die Auslaufdauern, die vom Aufrufer gelieferte Positionsschwellen erreichen (standardmäßig { "10" } m und { "50" } m), durch einen Vorwärtsdurchlauf bis zum ersten Durchgang bestimmt (first_crossing_s, da die durch Schuler begrenzten Kurven nicht monoton sind), mit der dominanten Quelle an jedem Durchgang; und ein TRN-begrenzter Modus, der das größte Geländefix-Intervall angibt, das jede Schwelle hält. Ausführbar als Szenarioart <c1/>

# text
seg-a971ff07592a = Einsatzanteil der Apertur für Navigation gegenüber Kommunikation

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Ein Lauf nimmt einen Kontaktplan (eine Liste von aos_s/los_s-Fenstern, die jeweils die Apertur für Navigation oder Kommunikation anfragen — dasselbe Fenstervokabular, das <c1/> ausgibt, umgewandelt durch <c2/>), eine Aperturzahl und eine ausdrückliche Arbitrierungsrichtlinie und liefert den Navigationsanteil, den Kommunikationsanteil, den Leerlaufanteil und den Ausfall je Sitzung. Die Richtlinie ist eine Eingabe mit dokumentiertem Standard (<c3/>; auch <c4/> und nicht verdrängendes <c5/>), und der Bericht trägt die aufgelöste Richtlinie, ihre vollständige Definition und die Definitionen von Anteil und Ausfall, weil eine Anteilszahl, die ohne ihre Arbitrierungsregel zitiert wird, nicht reproduzierbar ist. Der Zeitplan ist ein exakter Intervalldurchlauf über die Fenstergrenzen, sodass ein Fenster, das genau dort endet, wo das nächste beginnt, nie konkurriert, und Aperturzeit für Navigation, Kommunikation und Leerlauf in diesem einen Durchlauf unabhängig akkumuliert werden. Ausführbar als Szenarioart <c6/>

# text
# c1: passes::predict_passes
seg-656fd7d44a9e = Interne Konsistenz, aus drei Größen, die im selben Durchlauf durch verschiedene Ausdrücke berechnet und dann zum Schließen gezwungen werden. Aperturzeit für Navigation, Aperturzeit für Kommunikation und Aperturzeit im Leerlauf werden getrennt akkumuliert — der Leerlauf aus (Aperturen − |bedient|) je Elementarintervall, nie als Rest — und ihre Summe wird gegen Aperturen × horizon_s geprüft, was eine falsch eingeklammerte Grenze, ein doppelt gezähltes oder ein ausgelassenes Intervall sofort bricht; die bedienten Zeiten je Sitzung müssen separat zu den beiden Dienstsummen zurückaddieren. Die strukturellen Eigenschaften des Planers werden gemessen statt angenommen: Die bediente Zeit wird als nicht fallend in der Aperturzahl über { "200" } pseudozufällige Pläne für alle drei Richtlinien geprüft (nicht offensichtlich bei der nicht verdrängenden Richtlinie, bei der eine zusätzliche Apertur an jeder späteren Grenze ändert, wer was hält), und die Grenzarithmetik ist am Paar aus Berührung/Eine-Sekunde-Überlappung festgenagelt, wo sich ein Off-by-one sonst verstecken würde. Die Brücke zum Überflugprädiktor wird gegen die Ausgabe von <c1/> geprüft: Mit einer Apertur und ohne konkurrierenden Dienst ist die Aperturzeit für Navigation gleich der eigenen aufsummierten Überflugdauer des Prädiktors. Es wird keine externe Referenz beansprucht, und es gibt keine: Die Fähigkeit ersetzt Handarithmetik, statt gegen sie geprüft zu werden, der mitgelieferte Kontaktplan ist illustrativ und nicht geflogen, und kein operativer Planer veröffentlicht ein Paar aus Plan und Antwort mit angegebener Arbitrierungsregel — ein unter nicht angegebener Richtlinie berechneter Anteil ist mit einem unter angegebener Richtlinie berechneten nicht vergleichbar, und die Abhängigkeit von der Richtlinie wird gemessen (Navigationsanteile von 100/150 gegenüber 50/150 bei identischem Plan). Schwenk- und Umschaltzeit, Datenvolumen, Pufferzustand, Energie und Streckenschließung sind im Berichtslabel ausgeschlossen, statt stillschweigend modelliert zu werden

# text
seg-43cd7aa7ab53 = HF-Jamming der Mondoberflächen-Navigation (J/S je Satellit)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Mondeigenes Verhältnis von Störer zu Signal, effektives C/N₀ und Lock-Verlust für einen selenographischen Oberflächennutzer unter einem Störer auf der Mondoberfläche (oder erhöht) über der illustrativen Konstellation der Klasse Moonlight/LCNS aus öffentlichen Quellen. Setzt die offene Jamming-Kette (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) mit der offenen Mond-Himmelsgeometrie (lunar_service::LunarConstellation + topozentrisch, lunar::selenographic_to_mcmf) zusammen; weder Geometrie noch Radiometrie werden neu hergeleitet. Anders als bei der Erd-Art <c1/> ist die Signalstrecke keine feste Empfangsleistung: Die isotrope Empfangsleistung jedes Satelliten ist seine eigene Link-Budget-EIRP − FSPL(Schrägentfernung), sodass J/S von Satellit zu Satellit mit Mondentfernung und Elevation variiert. Gibt EINE ZEILE JE SICHTBARER (Epoche, Satellit) STRECKE als JSON und als *.table.csv-Artefakt aus, mit beiden Empfangsleistungen, deren Differenz das J/S ist, daneben gedruckt; aggregierte Gütezahlen stehen neben dieser Tabelle, nie an ihrer Stelle. Ausführbar als Szenarioart <c2/>

# text
seg-2a4393ae7c52 = Kompositions-Gegenprüfung gegen einen unabhängigen Codepfad im Repository: Jedes J/S je Strecke wird als Differenz zweier Link-Budgets neu hergeleitet, die mit linkbudget::received_signal_power_dbw berechnet werden, dessen Freiraumdämpfung der einzelne Ausdruck { "20" }·log10(4πRf/c) ist statt der Dreiterm-Summe, die jamming::free_space_path_loss_db verwendet — beide stimmen auf jeder Zeile auf < { "1e-9" } dB überein (gemessener ungünstigster Fall { "7.11e-14" } dB, d. h. Gleitkomma-Rundung). Die zugrunde liegende Störungskette, die sie zusammensetzt, ist separat extern verankert in tests/gnss_denied_jamming_resilience_reference.rs (unabhängige numpy/scipy-Neuherleitung von J/S und effektivem C/N₀, festgelegt auf Kaplan & Hegarty §{ "9.4" }, plus das gemessene C/N₀ des JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); die Mondgeometrie, die sie zusammensetzt, ist die Geometrie von lunar_service/lunar mit eigenen Referenzen. Hier geprüfte Identitäten in geschlossener Form: Ein halbierter Störerabstand addiert genau { "20" }·log10({ "2" }) dB zu jeder Zeile; J/S ist exakt invariant gegenüber dem Boresight-Gewinn der Nutzerantenne, während sich C/N₀ um genau diesen Gewinn bewegt; eine Elevationsmaske ändert keine überlebende Zeile bitgenau. Die Zeile selbst bleibt ReferenceImpl/modelliert: Es gibt keine gemessene Mond-Jamming-Kampagne, gegen die validiert werden könnte, und die Konstellation ist eine illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen, keine geflogene Ephemeride

# text
seg-4c116e25c5c5 = Mond-Verweigerungskontur mit einem Unsicherheitsband aus der gemessenen C/N₀-Streuung

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Der Bericht <c1/> stützt seine Verweigerungskontur nicht mehr auf einen einzelnen Skalar. Er gibt die gesamte gemessene Verteilung des C/N₀ des Nutzsignals über die Tabelle je Satellit aus — n, min, p05, p25, Median, p75, p95, max, Mittelwert, Stichprobenstandardabweichung und die eigene Asymmetrie der Stichprobe (p95 − Median) − (Median − p05) — neben den Zeilen je Strecke, die unverändert sind. Die Kontur wird dann an jeder dieser Ordnungsstatistiken unter BEIDEN Verweigerungskriterien angegeben, die die Engine kennt, nie das eine anstelle des anderen: das bisherige Kriterium des Leistungsverhältnisses (J/S = { "30" } dB, dieselbe Schwelle, die attack_surface und tracking_loop verwenden, und das Kriterium hinter der Spalte <c2/> der veröffentlichten Tabelle zum Mond-Link-Jamming), und das Kriterium des Lock-Verlusts (das effektive C/N₀ fällt auf tracking_threshold_dbhz), mit dem die eigene Spalte links[].status dieses Berichts bewertet wird. Jeder Konturpunkt wird auf beiden Achsen der Verweigerungsebene angegeben — die erforderliche Störer-EIRP beim Abstand des Szenarios und der Verweigerungsabstand bei der EIRP des Szenarios — sodass das Band ein Intervall auf denselben Achsen ist, auf denen ein Konturdiagramm gezeichnet wird. Die Bandgrenzen SIND contour(p05) und contour(p95): dieselbe Abbildung in geschlossener Form, angewandt auf die eigenen Quantile der Stichprobe, nicht ein an die Stichprobe angepasstes Sigma und nicht Median ± k·Standardabweichung, und der Bericht sagt dies in einer Zeichenkette band_definition neben den Zahlen. Die Standardabweichung wird der Kontinuität halber ausgegeben und von nichts verwendet. Ein Quantil, dessen C/N₀ bereits auf oder unter der Tracking-Schwelle liegt, hat kein endliches verweigerndes J/S; diese Spalten werden als null mit gezähltem Grund ausgegeben statt als Unendlich oder als begrenzter Radius

# text
seg-2d3944107ba0 = Erkennungsstärke des modalitätsübergreifenden Integritätsmonitors

# text
seg-38bc7c0bfe57 = Der hybrid-optical-rf-Bericht gibt an, was der modalitätsübergreifende Chi-Quadrat-Monitor tatsächlich ERKENNEN kann, und nicht nur, dass er einen fehlerfreien Fall besteht: den minimal erkennbaren Bias je überwachter Achse (Ost, Nord, Oben, Uhr) bei den angegebenen Fehlalarm- und Nichterkennungswahrscheinlichkeiten des Szenarios, die Erkennungsstärkekurve beiderseits davon, das rauschfreie Bias-Vielfache, bei dem die realisierte Statistik die Schwelle erstmals überschreitet, und die Zeit bis zur Erkennung für eine Bias-Rampe mit angegebener Rate. Fehler werden außerdem durch den realen Monitor eingespeist, und die Statistik, die er zurückgibt, wird neben der analytischen Vorhersage angegeben

# text
seg-38cabd4921c1 = Erneutes Anwachsen der Kovarianz nach der Übergabe gegenüber der Alarmgrenze

# text
seg-9287268bbada = Der hybrid-optical-rf-Bericht legt das Prozessrauschmodell des Filters offen und gibt an, wie lange die Lösung nach der Übergabe innerhalb der Alarmgrenze bleibt: Für beide Übergaberichtungen trägt er die Kovarianz je Achse, die die Übergabe hinterlassen hat, propagiert sie unter einem angegebenen Random-Walk-Prozessrauschen vorwärts und gibt die Zeit an, zu der das abdeckungsskalierte 1σ die horizontalen, vertikalen und zeitlichen Alarmgrenzen erreicht, welche Grenze zuerst bindet, die Zeitkonstante der Varianzverdopplung und ein abgetastetes Auslaufprofil, das den Durchgang einklammert. Prozessrausch-PSDs, der Abdeckungsfaktor und die Alarmgrenzen sind alle Eingaben mit dokumentierten Standardwerten

# text
seg-c85b822227f3 = Keine externe Referenz. Der Durchgang ist eine Lösung in geschlossener Form des Varianzwachstums des Random Walk, und die Tests berechnen ihn unabhängig aus den Werten neu, die der Bericht selbst veröffentlicht, nicht aus dem Inneren des Emitters. Die Startkovarianz ist bitgenau auf die Spur festgelegt, die der vorhandene Übergabeblock bereits angab, sodass der Auslauf keine Kovarianz propagieren kann, die sonst niemand gesehen hat. Die Prozessrausch-PSDs sind MODELLED repräsentative Eingaben, und die Durchgangszeiten skalieren direkt mit ihnen, was der Skalierungstest als gemessene Eigenschaft und nicht als Behauptung festhält. ExternalDataset wird bewusst abgelehnt: Die Auslaufzeit ist eine direkte Funktion zweier modellierter PSDs und von Alarmgrenzen, die selbst repräsentativ sind, und es gibt keinen gemessenen optischen/HF-Übergabeauslauf am Mond, gegen den verglichen werden könnte. Eine externe Referenz bräuchte hier eine veröffentlichte Kurve des Kovarianzwachstums nach der Übergabe oder der Holdover-Genauigkeit für einen vergleichbaren Empfänger mit angegebenem Prozessrauschmodell, geprüft auf eine Toleranz

# text
seg-a3b8272862aa = Antennenmuster außerhalb der Boresight im Export der Mondgeometrie

# text
seg-27d246503a48 = Der Geometrieexport je Satellit trägt je (Epoche, Satellit) den Außerachsenwinkel AM SATELLITEN und den Sendegewinn zum Standort aus dem realen gleichmäßig ausgeleuchteten Kreisaperturmuster (Airy) und gibt die Zahl der Satelliten im Strahl unter diesem Muster NEBEN der Zahl im Strahl unter der symmetrischen Näherung von Gewinn zu Strahlbreite an (θ_3dB[deg] = √(31000/G_lin)), wobei die Differenz als ausdrückliche Korrektur in Strecken, in Satelliten je Epoche und als ungünstigste einzelne Epoche ausgegeben wird. Beide impliziten Apertureffizienzen der Näherung werden ausgegeben ({ "0.641" } gegenüber der Regel { "70" }·λ/D Grad, mit der sie zitiert wird, { "0.920" } gegenüber einer gleichmäßigen Kreisapertur), sodass die Effizienz, die sie stillschweigend annimmt, angegeben statt abgeleitet wird. Standardmäßig aus: Der Block erscheint nur, wenn ein Exportstandort und eine Apertur beide angegeben sind

# text
seg-6fbfa234ef3e = Lock-Verlust der Nachführschleife und Spoofing-Pull-in unter Störung

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Lock-Verlust, berechnet aus der Schleifendynamik statt aus einem Leistungsverhältnis: thermischer 1σ-Jitter von Träger (Costas) und Code (nichtkohärent Early/Late) gegenüber C/N₀ mit dem Quadrierungsverlust, gegenüber den angegebenen Regeln 3σ_PLL + θ_e ≤ { "45" }° und 3σ_DLL + Rampenverzug ≤ d/2 Chips; C/N₀-Schwellen für Abfall und erneutes Einrasten mit der benannten bindenden Schleife und der aus der weiteren Pull-in-Bandbreite ABGELEITETEN Hysterese statt einer behaupteten; die erklärte Zeit bis zum Lock-Verlust aus einem Lock-Detektor mit zwei Schwellen und Bestätigungsverweilzeiten, getrennt von der physikalischen Phasenfluchtzeit angegeben (mittlere Zeit nach Viterbi zwischen Zyklusschlupfen, in log₁₀ s, weil sie hunderte Dekaden überspannt); die größte Code-Anstiegsrate und Träger-Dopplerrate, denen die Schleifen des Opfers folgen können; und den VERWEIGERUNGSRADIUS, den die Schleifendynamik impliziert, neben dem vorhandenen Radius des Leistungsverhältnisses angegeben, mit ihrer vorzeichenbehafteten Differenz als eigenem benannten Feld. Ausführbar als Szenarioart <c1/>

# text
seg-69155fb79ebd = Kovarianz der Stationskoordinaten bei Mond-VLBI aus einem Tracking-Zeitplan

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Verzögerungs-Partielle, über einen Zeitplan aus Basislinien × Epochen zu einer Fisher-Informationsmatrix akkumuliert, invertiert zur Kovarianz der Stationskoordinaten und zum Stationssigma je Koordinate, statt einer angenommenen isotropen Gleichverteilungsverknüpfung aus einer skalaren Verzögerungspräzision. Der Zustand trägt erdfeste (ITRS) Stationskoordinaten, daher ist die Jacobi-Matrix die inertiale Partielle, gedreht mit der GCRS→ITRS-Matrix jeder Epoche, und die Erdrotation macht diese Koordinaten beobachtbar — der Bericht MISST den erdfesten Sichtliniendurchlauf und die Deklination der Bake, statt sie anzunehmen. Rang, Datumsdefekt, Konditionszahl, das Informationsspektrum und der Nullraum des freien Netzes werden bei jedem Lauf ausgegeben, und bei Rangdefizit wird das Kopf-Sigma als NULL mit einem Status veröffentlicht, statt aus einer fast singulären Inversen gelesen zu werden. Der Gleichverteilungswert c·σ_τ·√(g/N) für DENSELBEN Zeitplan wird neben dem berechneten mit ihrem Verhältnis gedruckt, zusammen mit der isotropen Spurschranke √(p/trace(M)), die AM-HM zu einer harten Untergrenze macht. Ausführbar als Szenarioart <c1/>

# text
seg-0f4d023fe2d4 = Koordinatenkovarianz eines Mondoberflächenpunkts aus einem VLBI-Verzögerungszeitplan, getrennt von der der Erdstationen gehalten

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Eine dritte Datumswahl, <c1/>, die jede Erdstation festhält und allein die mondkörperfesten Koordinaten der BAKE schätzt — die Konfiguration, für die eine Unsicherheit eines Mondoberflächenpunkts tatsächlich angegeben wird, da die Koordinaten der Erdstationen eine Eingabe des Verzögerungsmodells sind und keine Unbekannte davon. Sie existiert, weil die Kovarianz auf Stationsebene und die Kovarianz des Oberflächenpunkts VERSCHIEDENE GRÖSSEN sind, getrennt durch den Hebelarm ρ/B, und zuvor nichts verhinderte, dass die eine gegen die andere zitiert wurde. Der ausgegebene Block <c2/> trägt ρ, die längste Basislinie, den Hebelarm, die Oberflächenpunktform der Gleichverteilungsverknüpfung c·σ_τ·(ρ/B)·√(g/N), das berechnete Bakensigma je Koordinate und ihr Verhältnis — das Verhältnis null statt irreführend, wann immer die Bake nicht geschätzt wird oder die Matrix rangdefizient ist. B wird als die LÄNGSTE vorhandene Basislinie genommen, die günstigste, sodass das Verhältnis nur unterschätzen kann. Ausführbar als <c3/> mit <c4/>, was mit einer Meldung abgelehnt wird, die die fehlende Eingabe nennt, wenn die Bake nicht geschätzt wird

# text
seg-18096ae23d96 = Identitäten in geschlossener Form, ohne dass eine externe Referenz beansprucht wird oder verfügbar ist. Der Hebelarm wird gegen ρ/B und die beiden Gleichverteilungsformen gegeneinander auf { "1e-15" } geprüft — algebraische Identitäten, die also einen Verdrahtungsfehler fangen und sonst nichts und als solche gekennzeichnet sind. Das inhaltliche Ergebnis wird MEASURED statt behauptet: Eine Verzögerung aus einer festen Basislinie schränkt die RICHTUNG der Bake ein, sodass die Sichtlinienkomponente die Informationsmatrix nur über den Nahfeld-Entfernungsterm erreicht, und der Test liest die resultierende Anisotropie aus dem ausgegebenen Spektrum ab, statt sie abzuleiten. AM-HM macht √(p/trace(M)) zu einer harten Untergrenze, sodass eine isotrope Gleichverteilungsverknüpfung immer nur UNTERSCHÄTZEN kann und das Verhältnis berechnet zu Gleichverteilung genau die Anisotropie ist, die sie verworfen hat. MEASURED am Paar Goldstone-artig/Canberra-artig, dessen Sehne { "10726.748" } km beträgt: Über { "112" } abgetastete Tage lassen { "36" } bei einer Maske von { "10" }° überhaupt keine gegenseitig sichtbare Epoche zu, das Höchste an gegenseitig Sichtbarem sind { "17" } eines Zeitplans mit 49 Stichproben, und an den { "73" } brauchbaren Tagen reicht das Dreikomponentenverhältnis von { "113.9" }× bis zu vier Größenordnungen mehr, Median { "1513" }×, während die Beschränkung auf die beiden transversalen Richtungen, die die Sichtlinie nicht aushungert, { "3.94" }× bis { "25.8" }× ergibt, Median { "7.8" }×. WAS DIESE ZEILE NICHT BEANSPRUCHT: irgendeine dieser Zahlen als Eigenschaft einer realen Kampagne. Sie stellt fest, dass die Größe des Oberflächenpunkts nun BERECHNET statt angenommen wird und dass sie nicht stillschweigend mit der auf Stationsebene vertauscht werden kann. Bleibt ReferenceImpl/MODELLED: Es existiert keine veröffentlichte Kovarianz eines Oberflächenpunkts bei Mond-VLBI, gegen die validiert werden könnte, die Stationen und der Bakenstandort sind illustrativ und nicht vermessen, und die Ephemeride, Uhren, Troposphäre und Erdorientierungsparameter werden FEST gehalten, daher ist dies eine Cramér-Rao-Schranke für einen reduzierten Parametersatz und für sich genommen optimistisch. Dieselbe Größe auf dem Kernelpfad (Bake auf dem DE440-Mond) wird in ihrer eigenen Zeile validiert, "…, kernel path"; auf diesem analytischen Pfad liegt das kleinste Bakensigma { "3.9" } % unter der SPICE-Referenz jener Zeile, weshalb diese Zeile MODELLED bleibt

# text
seg-8958521eedf7 = Koordinatenkovarianz eines Mondoberflächenpunkts aus einem VLBI-Verzögerungszeitplan, Kernelpfad

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = Die Bakenkovarianz mit allen festgehaltenen Stationen des Szenarios lunar-vlbi-fim (jede Erdstation festgehalten, allein die mondkörperfesten Koordinaten der Bake geschätzt) mit der Bake auf dem JPL-DE440-Mond, gelesen vom eigenen Kernel-Leser der Engine (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Nur das Mondzentrum unterscheidet sich vom analytischen Pfad; die Körperrotation nach IAU { "2015" }, Stationen, Erdrotation und lineare Algebra sind gleich. Die validierten Ausgaben sind die Beobachtungsmenge, das { "3" } x { "3" }-Informationsspektrum, Rang und Konditionszahl, die drei körperfesten Bakensigmas und ihr RMS, der Hebelarm und das Verhältnis berechnet zu Gleichverteilung, auf dem Standardzeitplan. Ausführbar als Szenario <c1/> mit datum = "all-stations-fixed", estimate_beacon = true und gesetztem planetary_kernel_path

# text
seg-0315968c8214 = Differentielles PNT am Mond — Residuenbudget der Korrekturstrecke

# text
seg-c6785166a44c = Die drei Terme, die eine differentielle Korrektur zwischen der Epoche, zu der sie berechnet wird, und der Epoche, zu der sie verwendet wird, aufnimmt, jeweils zuvor als unmodellierte Reserve belassen: Vermessungsfehler der Referenzstation (über Satelliten korreliert, unabhängig von der Basislinie, ~{ "1" }:{ "1" } Positionsübertragung und nachweislich nicht von DOP verstärkt), Alterung der Korrektur (der eingefrorene Bahnfehlervektor, neu projiziert auf die Sichtlinie, auf die der eigene Propagator der Engine den Satelliten eine Latenz später setzt, plus c·σ_y(τ)·τ Uhrendrift aus dem kalibrierten Potenzgesetz) und gleichmäßige Streckenquantisierung über einen exakten Vollausschlag ±(orbit_err + clock_err) mit der Varianz step²/12. Angegeben sowohl im Entfernungs- als auch im Positionsbereich, neben — nie anstelle von — dem vorhandenen Residuum und Schutzniveau, mit einer Latenzkurve neben der Einzelzahl

# text
seg-29b8e6c12471 = Identitäten in geschlossener Form und Selbstkonsistenz: die Varianz step²/12 des gleichmäßigen Quantisierers, die exakte Kovarianzfortpflanzung (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, die bei gleichem σ zu σ·PDOP zusammenfällt, die { "1" }:{ "1" }-Übertragung des Vermessungsterms als Folge von û_user ≈ û_ref und das Abschalten des quadratischen Schlusses. Die PDOP-Gegenprüfung gegen orbit::dop teilt die Normalmatrix [−û, { "1" }], daher ist sie eine Konsistenzprüfung und wird als solche gekennzeichnet statt als unabhängige Referenz. Es ist kein ExternalDataset verfügbar oder beansprucht: Keine Mondoberflächenstation hat eine veröffentlichte vermessene Genauigkeit, keine Korrekturstrecke für differentielle Korrekturen am Mond hat eine veröffentlichte Latenz oder ein Nachrichtenformat, und das Ergebnis der Quantisierung ist eine geschlossene Form und keine Messung. RTKLIB — bereits die Referenz mit externem Code für den Einzeldifferenz- und gewichteten Kleinste-Quadrate-Kern — könnte mit einer absichtlich falsch vermessenen Basis gefahren werden, um die { "1" }:{ "1" }-Vermessungsübertragung zu bestätigen, aber das wäre unabhängiger Code über dieselbe Algebra der Sichtlinie erster Ordnung. DIE GRÖSSENORDNUNGEN SIND MODELLED: Der Vermessungsstandard ist die eigene Zuteilung der Mondbezugssystem-Realisierung dieses Crates statt einer gemessenen Station, die Latenz und die Bitzahl sind ILLUSTRATIVE Eingaben, und das Anwachsen des Fehler-VEKTORS der Broadcast-Ephemeride selbst ist überhaupt nicht modelliert — angegeben in der ausgegebenen Zeichenkette des Alterungsgesetzes, weil es der Term ist, der in einer realen Strecke am ehesten dominiert

# text
seg-c42646ae4707 = Abdeckungs- und Genauigkeitskarte der Mond-Referenzstation

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Monte-Carlo-Durchlauf des Modells für differentielles PNT am Mond über ein Nutzergitter am Südpol und einen Tag von Epochen (die Art <c1/>): für eine differentielle Referenzstation an einem bekannten Standort am Südpol je Punkt und über die Region das Perzentil des korrigierten und des unkorrigierten Positionsfehlers (3-D, horizontal, vertikal), Verfügbarkeit mit einem Grund für jede nicht verfügbare Epoche (user_lt4, station_missing_sat), Abdeckung gegenüber einer vor dem Lauf angegebenen Schwelle, Schutzniveaus nach DO-229E, den Abdeckungsradius je Azimutsektor und das Budget der Korrekturstrecke an der Station und am ungünstigsten Punkt. Keine Aussage über die Leistung eines realen Systems; nicht mit einer Behörde verbunden oder von ihr unterstützt

# text
seg-7ecf4b0038b0 = Mond-Geländehorizontmasken aus einem angegebenen Profil oder einem polaren DEM

# text
seg-7102948907bc = Azimutabhängige Horizontmasken je Standort für die Art lunar-station-coverage (die Referenzstation und jeden Nutzerpunkt) und das Gitter moonlight-service-volume und seinen Exportstandort je Satellit (jede Exportzeile erhält clears_terrain), im Tabellenformat der Skyline { "0.36" } (skyline::Skyline, linear im Azimut mit Umbruch bei { "360" } Grad; ein angegebenes Profil und ein DEM-Horizont an einem Standort verbinden sich als ihr punktweises Maximum): ein angegebener [terrain] station_horizon oder user_horizon mit seiner Quelle gekennzeichnet und/oder ein Horizont, per Strahlverfolgung über ein DEM in südpolarer stereographischer Projektion berechnet (das gerasterte polare Layout LRO LOLA, gelesen aus einem Deskriptor, der seine Größe und sein SHA-256 festlegt, oder eine Kachel realdata::lola_dem in Breite/Länge mit [terrain] dem_tile_path, mit ihrem SHA-256 zurückgegeben) entlang von Großkreisen der Mondkugel mit exakter Krümmung, von einer angegebenen Masthöhe, bei einem angegebenen Azimutschritt und einer angegebenen Reichweite. Ein Satellit zählt an einem Standort, wenn er die flache mask_deg und den Horizont bei seinem Azimut überschreitet (lunar_service::topocentric); eine Epoche, die der Horizont mit weniger als vier Satelliten an einem Punkt lässt, wo die flache Maske vier ergibt, wird als der Nichtverfügbarkeitsgrund terrain_masked gezählt. Das mitgelieferte DEM ist ein Ausschnitt des gemeinfreien Produkts LOLA LDEM_75S_240M, { "5" } x { "5" } blockmittelwert-umgetastet auf { "1200" } m (data/lunar-dem/NOTICE.md). Fehlt es, behält jeder Standort die flache Maske, und jedes Dokument ist byte-identisch

# text
seg-d37bb01e270b = Mehrwege- und Empfängerhardware-Terme der Mondreferenzstation

# text
seg-1103199f019b = Der optionale Abschnitt [receiver] von lunar-station-coverage (LRS-02): elevationsabhängiges Mehrwege-Sigma sigma(el) = a + b exp(-el / el0) beim Nutzer und an der Station (die funktionale Form der RTCA DO-229 für Luftfahrzeuge, mit a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } deg als Standardwerten; auf dem Mond ist jeder Wert ILLUSTRATIVE), weiß beim Nutzer und ein Gauß-Markov-Prozess erster Ordnung über die Epochen an der Station (rho = exp(-dt / tau)); thermisches Code-Rauschen des Early-minus-Late-DLL sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); kanalweise Inter-Kanal-Biase, konstant über einen Versuch, beim Nutzer und an der Station. Die Stationsterme gehen in deren Korrekturen ein, die Nutzerterme in die Roh- und die korrigierten Messungen, jeweils auf einem eigenen Zufallsstrom mit festem Startwert. Fehlt der Abschnitt, bleibt jedes Dokument unverändert

# text
seg-4fbc7d86b491 = Geschlossene Formen und Statistiken der eigenen Ziehungen des Modells (InternalConsistency): die DLL-Formel gegen eine Handrechnung, die DO-229-Form, die Nullbasislinien-Differenz zweier Empfänger, die Lag-1-Korrelation des Gauß-Markov-Prozesses. Es gibt keine Mehrwege- oder Empfängermessung auf dem Mond, mit der sich vergleichen ließe; die Werte sind ILLUSTRATIVE, und nichts hier ist eine Aussage über einen realen Empfänger

# text
seg-03796cb741b6 = Wachstum des Ephemeridenfehlers der Mondreferenzstation über die Korrekturlatenz

# text
seg-13b0ae9a874a = Die optionale Eingabe orbit_err_growth_m_per_s von lunar-station-coverage (LRS-03): Eine Korrektur, die latency_s nach ihrer Berechnung angewendet wird, verfehlt das Wachstum g latency_s des ausgesendeten Bahnfehlers, wobei g eine isotrope 3-D-RMS-Rate ist, die je Satellit und Versuch auf einem eigenen Zufallsstrom mit festem Startwert gezogen wird (Bereich 1-sigma-Rate tau / sqrt({ "3" })), zusätzlich zur Neuprojektion des eingefrorenen Fehlers auf die Sichtlinie. Fehlt sie, bleibt jedes Dokument unverändert. Ein K5-Nachtrag zum Vergleich mit den veröffentlichten Aussagen, allein vorregistriert, führt K5 bei { "0.001" }, { "0.01" } und { "0.1" } m/s aus (ILLUSTRATIVE)

# text
seg-90307f07e0ef = Lösungsmodi der Mondreferenzstation: Höhenbeschränkung, drei Satelliten, Fenster für statische Nutzer

# text
seg-366c7ad03fb2 = Der optionale Abschnitt [solution] von lunar-station-coverage (LRS-06): eine Höhen-Pseudomessungszeile up . dx = e_h mit angegebenem 1-sigma, gewichtet gegen die Entfernungszeilen, ein Minimum von drei Satelliten, das nur mit ihr zulässig ist, und eine gewichtete Kleinste-Quadrate-Lösung über die letzten window_epochs Epochen mit einer gemeinsamen statischen Position und einer Uhr je Epoche (die Antwort eines Filters für eine statische Position ohne Prozessrauschen über dieselben Daten; die Fehler der Epochen werden als unabhängig behandelt). Fehlt er, bleiben die Momentaufnahme-Lösung und jedes Dokument unverändert. Ein Nachtrag zum Vergleich mit den veröffentlichten Aussagen mit dem Lösungsstil der Quellen, allein vorregistriert

# text
seg-611ba369ed00 = Genauigkeit und Abdeckung der Mondreferenzstation gegen veröffentlichte Aussagen

# text
seg-4fe4f1cffa2b = Die Art lunar-station-coverage, ausgeführt unter den öffentlichen Annahmen des veröffentlichten Materials zu einer differentiellen Mondreferenzstation (vier Navigationssatelliten auf { "24" }-h-Bahnen, eingefrorene elliptische Bahnen, { "10" } m { "95" } % SISE, { "0.30" } m Code-Rauschen, { "1" } s und { "600" } s Korrekturlatenz, eine Stationsvermessung im Subdezimeterbereich, der veröffentlichte Beispielstandort der Station, die südpolaren Kreise von { "300" } km und { "600" } km) und bewertet gegen die numerischen Aussagen der Quellen unter sechs einseitigen Zielwerten, die vor dem Lauf vorregistriert wurden: Abdeckung des gesamten Südpols bei p95 unter einem Meter (K1, K2), korrigiertes p95 unter einem Meter und im Dezimeterbereich (K3, K4), unter einem Meter gehalten bei { "600" } s Latenz (K5) und Genauigkeit gehalten von { "10" } km bis { "500" } km Basislinie (K6)

# text
seg-478225d0a8e1 = Kern des lunaren ARAIM-Schutzniveaus

# text
seg-863690a44f21 = Der Schritt von der Geometrie zur Kovarianz beim lunaren Schutzniveau — (GᵀG)⁻¹ über die Geometrie mit allen sichtbaren Satelliten und jede Einzelfehler-Teilgeometrie, projiziert auf die lokale Vertikale und die Spur des horizontalen Blocks — und sein statistischer Kern: der Bonferroni-Detektormultiplikator, der gaußsche obere Rand jeder Fehlerhypothese und die Wurzelsuche, die ein Integritätsrisikobudget auf ein Schutzniveau abbildet, über ein lunares Dienstvolumen aus 7 Punkten

# text
seg-0ec1699f5754 = ARAIM-MHSS-Schutzniveaus gegen veröffentlichte Referenzvektoren

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = Die Schutzniveau-Gleichung der Mehrfachhypothesen-Lösungstrennung selbst: gewichtete Kleinste-Quadrate-Lösung mit allen sichtbaren Satelliten und je Fehlermodus auf einer Ost/Nord/Auf-Geometrie mit einem Uhrzustand je Konstellation, die Sigmas der Teillösungen, die Sigmas der Lösungstrennung und die einseitigen Projektionen des nominellen Bias, die Bonferroni-K_fa-Schwellen, die Risikozuteilung für nicht überwachte Fehler und die VPL/HPL, die die Integritätsrisiko-Gleichung lösen. Ausführbar als die Szenarioart <c1/>

# text
seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } Juni { "2019" }), durchgerechnetes numerisches Beispiel in Anhang D — veröffentlichte EINGABEN (Geometriematrix mit 10 Satelliten und 2 Konstellationen, Diagonalen C_int/C_acc, b_nom, P_sat, P_const, LPV-200-Konstanten) und veröffentlichte AUSGABEN (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } und sechs Zwischenwerte zu Konstellationsfehlern), abgerufen 2026-09-20, Quell-SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Abgeglichen mit der EIGENEN angegebenen Toleranz der Referenz TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT und σ_v_acc bis zu ihrer gedruckten Genauigkeit. Der Milestone-{ "3" }-Bericht ({ "2016" }) derselben Untergruppe, Annex A §A.IX, nennt dasselbe Beispiel, ist aber in sich widersprüchlich — ein Vorzeichenfehler in Zeile { "3" } von G (+{ "0.7477" }, wo das Dokument von { "2019" } −{ "0.7477" } druckt; mit dem Pluszeichen ergibt das eigene σ_v_acc des Dokuments { "0.8690" } m gegen seine veröffentlichten { "1.47" } m), und ein K_fa_3, ausgewertet bei { "57" } Fehlermodi, während das Dokument N_fault_max = { "1" } angibt, also { "12" }, sodass sein EMT der 57-Modi-Schwelle folgt und sein VPL/HPL nicht. Keine Implementierung, die ihm folgt, kann alle seine Ausgaben zugleich reproduzieren. Seine Geometrie-Zwischenwerte werden exakt reproduziert, und seine Schutzniveaus sind als gemessene Abweichungen festgehalten (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), vom Annahmewert ausgeschlossen; die Toleranz wurde nicht erweitert, um sie aufzunehmen. GELTUNGSBEREICH: nur N_fault_max = { "1" } — Teilmengen mit mehreren Ereignissen werden abgelehnt statt abgeschnitten, und Ausschluss, der Chi-Quadrat-Konsistenztest und der Schritt der Neuzuteilung bei Doppelzählung bleiben MODELLED

# text
seg-7bfcb5c6a985 = ARAIM mit gleichzeitigen Fehlerhypothesen für mehrere Satelliten

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: die Regel zur Bestimmung der Teilmengen nach ADD v4.2 (P_THRES, FC_THRES, überwachte Teilmengen mit den wenigsten Entfernten zuerst), von Paaren auf gleichzeitige Kombinationen von bis zu max_order Satelliten- und Konstellationsereignissen verallgemeinert, mit dem exakten Prior P_no fault prod q_e; add_v42_protection_levels_to_order führt darauf den Schutzniveau-Pfad nach ADD v4.2 aus (Ordnung { "2" } ist exakt der bestehende Pfad). raim::araim_subset_raim (optional zuschaltbar): fortgeschrittenes RAIM über diese Hypothesenmenge, jede überwachte Teilmenge ein Modus (p_fault, T, b, sigma) in der Summe des Integritätsrisikos, nicht beobachtbare Teilmengen in das nicht überwachte Risiko verschoben, das Budget mit der ADD-Zuteilung des nicht überwachten Risikos skaliert, und die Teilmenge mit der größten normierten Trennung gemeldet, wenn ein Fehler erkannt wird. Priors, die tiefere Teilmengen als max_order benötigen, werden abgelehnt, nie abgeschnitten

# text
seg-6c6076ea1eee = Interne Konsistenz (InternalConsistency): die Reduktion der Ordnung 2 auf den mit MAAST geprüften Pfad ADD v4.2, unabhängige Neuherleitung der Priors und ein konstruierter Fehler an zwei Satelliten. Über Paare hinaus wurde kein MAAST- oder RTKLIB-Lauf durchgeführt, daher sind die tieferen Hypothesenmengen und die Schutzniveaus des Teilmengen-RAIM nicht extern geprüft. araim_subset_raim teilt die Vereinfachungen von araim_dual_raim (ein Sigma für Integrität und Genauigkeit, eine Uhr, der einfache Normalrand): Es ist nicht ADD-konform

# text
seg-48ca01332f8f = RAIM neben den Gütemaßen des Uhren-Holdovers

# text
seg-890f1006a75d = Der optionale Abschnitt [integrity] der Art clock (clock_integrity::run): aus einem angegebenen Standort und Konstellationsvorgaben (geometry::sky_geometry), in jeder Integritätsepoche, solange die GNSS-Zeitleiste nicht verwehrt ist, Momentaufnahme-RAIM (raim::snapshot_raim: Paritäts-Chi-Quadrat-Test, Schutzniveaus nach Steigung) auf den Satelliten über der Maske mit gaußschen Residuen mit festem Startwert und dem angegebenen Sigma sowie einem optional angegebenen Bias; ein getrennter Block integrity_fom mit Urteilen je Epoche, Schutzniveaus und Verfügbarkeit. Verwehrte Epochen werden als nicht verfügbar gemeldet, nie extrapoliert; die Holdover-Gütemaße bleiben unverändert, und ohne den Abschnitt ist die Ausgabe byteidentisch

# text
seg-c2860bf4b562 = Interne Konsistenz (InternalConsistency): Die Schutzniveaus sind die von snapshot_raim, das in einer eigenen Zeile gegen RTKLIB validiert ist, auf derselben Geometrie neu berechnet; Verhalten ohne und mit eingespeistem Fehler. Der Himmel ist eine repräsentative Vorgabegeometrie (kein datierter Almanach), die Residuen sind synthetisch, und Sigma, die Alarmgrenzen und die Wahrscheinlichkeiten sind angegebene Eingaben; nichts hier ist eine Aussage über die Verfügbarkeit eines realen Empfängers

# text
seg-9cbb4ee7588a = Räumliche, verrauschte Beobachtbarkeit der Bogenlänge über mehrere Familien cislunarer Bahnen

# text
seg-5ebd771deef8 = Die Schwelle der Beobachtbarkeit der cislunaren Bogenlänge im RÄUMLICHEN CR3BP mit sechs Zuständen statt im ebenen mit vier Zuständen, über die Familien DRO, L2-Halo und L2-Near-Rectilinear-Halo, wobei das Messrauschen in die Gramsche Matrix eingeht, und ZWEI Kriterien berichtet werden, weil es kein einzelnes ehrliches gibt: das veröffentlichte Rangkriterium, das nachweislich unabhängig von einem homoskedastischen Messsigma ist (die Gewichtung multipliziert die Beobachtbarkeitsmatrix mit einem Skalar und lässt das relative Singulärwertspektrum und damit Rang, Defekt und Kondition unverändert), und ein Schätzbarkeitskriterium — der erste Bogen, bei dem die formale 1σ-Positionsunsicherheit des Anfangszustands des Chiefs unter eine angegebene Grenze fällt —, das sich als einziges mit dem Rauschen verschiebt. Jede Schwelle trägt die Klammer des Epochenrasters, in der sie liegt; ein nicht erreichtes Kriterium ist null mit einer Begründung. Der ebene Modus bleibt die Voreinstellung, und Familien außerhalb der Ebene werden dort abgelehnt, statt in einen Zustand zusammengedrückt zu werden, der sie nicht darstellen kann

# text
seg-046231819882 = Ein unabhängiger Zeilenstufenrang durch Gauß-Elimination mit partieller Pivotierung bestätigt jedes Rangurteil mit sechs Zuständen — ein anderer Algorithmus, der keinen Code mit dem geprüften Eigenwert-/SVD-Weg teilt. Die { "6" }×{ "6" }-Zustandsübergangsmatrix des CR3BP, die hier zusammengesetzt wird, trägt ihre eigene ReferenceImpl-Referenz gegen die variationelle Integration mit SciPy, und die Anfangsbedingungen für Halo/NRHO stammen aus einem Korrektor, der die veröffentlichte südliche L2-Gateway-Bahn { "9" }:{ "2" } reproduziert. Der bestehende Zweig mit dem Square-Root-Information-Filter wird ausdrücklich NICHT als Bestätigung gezählt: Er verwendet dieselben Jacobi-Matrizen und reduziert sich auf dieselbe Normalmatrix, ist also eine Konsistenzprüfung zwischen zwei numerischen Maschinen, und das ausgegebene Erweiterungslabel sagt das. NICHT extern verankert, und ExternalDataset wird deshalb abgelehnt statt aus der Zeile der Zustandsübergangsmatrix übernommen: Die Schwellen-Bogenlängen selbst hängen vom MODELLED Konstellationsentwurf, vom Epochenraster und — messbar, um bis zu { "40" }× — von der Singulärwerttoleranz ab. Die veröffentlichten ebenen { "2.09" } h werden bei rel_tol = { "1e-6" } exakt reproduziert und sind selbst toleranzabhängig ({ "10.25" } h bei { "1e-4" }, { "0.42" } h bei { "1e-8" }), was eine Eigenschaft des Kriteriums und nicht der Bahn ist. Kein öffentlicher Datensatz veröffentlicht eine Schwelle der Beobachtbarkeit der Bogenlänge für eine gewählte cislunare Konstellation. MEASURED ERGEBNIS: Die räumliche Schwelle mit sechs Zuständen beträgt { "22.17" } h für die L2-NRHO und { "40.42" } h für den L2-Halo und EXISTIERT NICHT für die ebene DRO-Familie, an der die veröffentlichte Aussage abgeleitet wurde — Rang { "4" } von { "6" } mit Datumsdefekt { "2" } und zwei exakt verschwindenden Eigenwerten, ein struktureller Defekt, den keine Bogenlänge behebt

# text
seg-e250321394bc = Fehler einer Erdorientierungsvorhersage im Betriebsstil, gemessen als vorhergesagt gegen endgültig

# text
seg-0e443d241460 = Eine Kleinste-Quadrate-Anpassung von Bias plus Rate über ein nachlaufendes Fenster plus die wichtigsten periodischen Terme — jährlich, halbjährlich und die beiden wichtigsten zonalen Gezeiten für UT1; Chandler, jährlich und halbjährlich für den Pol —, extrapoliert mit dem letzten Residuum im Fenster, das fortgeschrieben wird: die Klasse, die das IERS Bulletin A verwendet, anstelle des Persistenz-Prädiktors, auf dem der veröffentlichte Horizont beruhte. Bewertet auf die einzige ehrliche Weise: eine Vorhersage für T+h, gebildet aus schnellen Bulletin-A-Zeilen bei oder vor T, gemessen gegen das SPÄTER veröffentlichte endgültige Bulletin B bei T+h, mit der Persistenz daneben, bewertet über dieselbe Epochenmenge gegen dieselben endgültigen Werte. Eine Zielepoche ohne veröffentlichten endgültigen Wert wird verworfen, statt gegen die schnelle Spalte neu bewertet zu werden; ein periodischer Term, den das Fenster nicht festlegen kann, wird als abgelehnt gemeldet, mit den Zyklen, die es tatsächlich überspannt; ein unvollständiges Fenster wird abgelehnt, statt stillschweigend verkürzt zu werden

# text
seg-f4efd94dd746 = Mond-Bezugsdatum aus einer Beobachtungskampagne

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = Das Helmert-Datum mit sieben Parametern, fortgepflanzt aus einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE, statt aus einer eingespeisten Transformation zurückgewonnen. Erdstationen beobachten einen belegten Katalog von Baken auf der Mondoberfläche nach einem ausdrücklichen Zeitplan; die Mond-VLBI-Verzögerungspartialen werden in einer Fisher-Informationsmatrix der Bakenkoordinaten akkumuliert und durch den Helmert-Entwurf A = [I₃ | [p]ₓ | p] in H = AᵀM_bA geschoben, sodass die berichtete Datumsgenauigkeit eine Funktion des Beobachtungsprogramms ist — exakt linear im Verzögerungs-Sigma und monoton im Bogen über die Libration, die der Bericht MISST. Der Datumsdefekt ist der Gegenstand und keine Fußnote: Rang, Defekt, Konditionszahl, Spektrum, nicht beobachtbare Richtungen in der Sieben-Parameter-Basis, die schwächste Richtung selbst bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben, und jeder Parameter, den die Kampagne nicht festlegt, wird als NULL mit einem Status veröffentlicht. Die Korrelation der Bakenfehler wird MEASURED, nicht angenommen — exakt null bei festgehaltenen Stationen und mit ihren Kosten ausgegeben, wenn diese geschätzt werden. Ausführbar als die Szenarioart <c1/>

# text
seg-ca481f2d8f9e = Bestätigung der Schwelle der cislunaren Bogenlänge durch einen unabhängigen Schätzer

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Ein Batch-Kleinste-Quadrate-Schätzer, der den Anfangszustand des Chiefs aus simulierten Messungen zwischen Satelliten über wachsende Präfixe desselben Epochenrasters, das die Tabelle Rang gegen Bogen verwendet, ZURÜCKGEWINNT, wobei die Messpartialen als zentrale finite Differenzen des zusammengesetzten Vorwärtsmodells genommen werden. Er verwendet nichts von der Maschinerie, mit der die Schwelle gemessen wurde — keine analytische Jacobi-Zeile, keine variationelle Zustandsübergangsmatrix, keine Singulärwert- oder Eigenwertzerlegung, keine Rangtoleranz, keinen Square-Root-Information-Filter — und teilt nur die Dynamik, die Anfangsbedingungen, die skalare Observable und das Epochenraster, jeweils im ausgegebenen Dokument benannt. Zwei Kriterien, beide durchlaufen: rauschfreie Wiedergewinnung (das Gegenstück zum Rang) und Monte-Carlo-Schätzbarkeit (das Gegenstück zur Schätzbarkeit, gemessen gegen eine bekannte Wahrheit statt aus einer Kovarianz vorhergesagt). Ausführbar als die Szenarioart <c1/>

# text
seg-60e30948cee7 = Ein separater Schätzer in dieser Codebasis mit einem anderen Algorithmus und einem disjunkten Codepfad: nichtlineares gewichtetes Gauß-Newton mit finit differenzierten Partialen, sein Urteil als gemessener Zustandswiederherstellungsfehler in km und mm/s gelesen. Er hat keinen Ausdruck mit dem Weg über Rang und Kovarianz der Gramschen Matrix gemeinsam, und die Trennung wird durch eine Quelltextwache DURCHGESETZT und nicht behauptet. MEASURED auf dem veröffentlichten ebenen DRO-Raster: Das SCHÄTZBARKEITSKRITERIUM ist CORROBORATED — die gemessene Monte-Carlo-Grenze beträgt { "5.739130" } h gegen die formalen { "5.739130" } h (Verhältnis { "1.0000" }), und der gemessene RMS reproduziert das formale 1σ über { "21" } Bogenlängen mit einem geometrischen Mittel des Verhältnisses von { "0.9804" }. Das RANGKRITERIUM ist als Grenze der Wiedergewinnbarkeit NICHT bestätigt: Der Schätzer gewinnt ab { "0.782609" } h zurück gegen die { "2.086957" } h der Gramschen Matrix, Verhältnis { "0.375" }, und bei { "1.826087" } h — dem letzten Präfix, das die Rangbestimmung mit { "3" } von { "4" } bewertet — gewinnt er auf { "1.96e-5" } der a-priori-Verschiebung zurück. Die Wiedergewinnungsgrenze bleibt über drei Dekaden ihrer eigenen Schranke unbewegt, während die Rangschwelle über vier Dekaden von rel_tol von 'nie' bis { "0.782609" } h reicht, und die beiden fallen bei rel_tol = { "1e-8" } exakt zusammen. Diese Spanne wurde zunächst mit einem Reichweitenwert von { "0.260870" } h festgehalten; diese Zahl war ein ARTEFAKT, erzeugt durch eine Rangbestimmung, die { "4" } Richtungen aus { "2" } Messzeilen unterhalb des f64-Rauschbodens zählte, und sie wird hier korrigiert, statt stehen gelassen zu werden. Die Rangbestimmung ist nun durch die Ungleichung von Sylvester begrenzt, wobei der Grund ausgegeben wird, und die korrigierte Spanne sättigt genau bei dem Bogen, bei dem der unabhängige Schätzer zurückgewinnt, was die Kreuzvalidierung dieser Zeile stärkt statt sie zu schwächen: Die veröffentlichten { "1e-6" } sind eine konservative KONVENTION für Singulärwerte, keine Aussage über die Wiedergewinnbarkeit. Dasselbe Muster räumlich: NRHO { "9.290323" } h gegen { "21.677419" } h, Halo { "22.978723" } h gegen { "39.829787" } h, wobei die Schätzbarkeit in beiden exakt übereinstimmt. Die ebene DRO mit sechs Zuständen gewinnt bei keinem Bogen zurück und reproduziert so unabhängig den strukturellen Datumsdefekt dieser Familie aus einem Schätzer, dem nichts davon gesagt wurde. NICHT extern verankert — die Dynamik und die Anfangsbedingungen werden mit der geprüften Analyse geteilt, und kein öffentlicher Datensatz veröffentlicht eine solche Schwelle — daher wird ExternalDataset abgelehnt

# text
seg-f839285852d9 = Mond-Dienstvolumen aus realer, abgerufener Konstellationsgeometrie

# text
# c1: ephemeris_path
seg-c3059fcced49 = Akzeptiert eine tabellierte mondzentrische Zustandsephemeride (die Auswertung eines SPK/BSP-Kernels) oder eine veröffentlichte Konstellationsdefinition hinter <c1/>, führt denselben Durchlauf über Abdeckung / DOP / Schutzniveau darauf aus und gibt die daraus folgende σ_URE-Entfernungsanforderung NEBEN den unveränderten illustrativen keplerschen und gestörten Ergebnissen aus, wobei die Differenz als eigene benannte Größe erscheint. Jede Zahl trägt eine Herkunftsklasse, die aus dem Kernel abgeleitet, aus veröffentlichten Elementen abgeleitet und modelliert unterscheidet, sodass beides in einem nachgelagerten Zitat nie verwechselt werden kann

# text
seg-36a6cfaf5afa = Einheit und Herkunft für jede berichtete Größe angegeben

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Ein maschinenlesbares Schema, das für jedes numerische Feld jedes Szenarioberichts Einheit, Herkunftsklasse und Definition angibt, plus ein einziges globales Tor, das jede registrierte Szenarioart ausführt und scheitert, wenn einem ausgegebenen numerischen Feld eines von beiden fehlt. Das Herkunftsvokabular ist geschlossen, und jede Klasse trägt eine Evidenzstufe, wobei zwei Klassen bewusst auf <c1/> und <c2/> abgebildet werden, statt ihnen eine Stufe zuzuweisen, die die Klasse nicht bestimmt

# text
# c1: m
# c2: _m
# c3: sweep-nd
# c4: mixed - see note
# c5: key_units
# c6: metric_units
# c7: unit
# c8: cislunar-observability
# c9: units
seg-a8c4a6fd4989 = Das ausgegebene Dokument selbst: Jedes numerische Blatt muss sich zu einem Eintrag im eigenen units-Block dieses Dokuments auflösen lassen. Es gibt kein externes Einheitenregister, gegen das sich eine ANGEGEBENE Einheit prüfen ließe, daher ist eine angegebene Einheit eine geprüfte Behauptung und keine verifizierte — das Tor verifiziert VOLLSTÄNDIGKEIT und WOHLGEFORMTHEIT, nicht Wahrheit, und eine Validierung wäre falsch, weil nichts Externes bestätigt, dass <c1/> die richtige Einheit für ein Feld namens <c2/> ist. Eine unabhängige Gegenprüfung der Namenssuffixe wurde über die { "1,434" } zu DIESEM ZEITPUNKT beschriebenen Felder ausgeführt: Von den { "691" } mit einem Suffix, das eine Einheit trägt, weichen { "40" } von der angegebenen Einheit ab und alle { "40" } sind erklärt (Suffixe pro Sekunde, Minima, Apertur-Sekunden, Newtonmeter gegen ein nanometerartig aussehendes Suffix), sodass keine falsche Einheit zutage trat. Diese Gegenprüfung wurde seither nicht erneut ausgeführt, und die Abdeckung ist darüber hinaus gewachsen — die Zahl bleibt bei dem, was tatsächlich gemessen wurde, statt auf die aktuelle Gesamtzahl umgeschrieben zu werden. Zum Zeitpunkt dieser Änderung ({ "0.27.0" }) stieg die Abdeckung von { "7" } von { "56" } Arten auf { "60" } von { "61" } und von { "389" } von { "1354" } Feldern auf { "1,742" } von { "1,744" } (docs/field-units-schema.json, das von einer Veraltungsprüfung aktuell gehalten wird). KEINE Art bleibt unabgedeckt (Obergrenze { "0" }, FUT-28, { "0.36" }): Die letzte war <c3/>, deren zwei Spalten vom Aufrufer vergeben werden, sodass ihre Einheiten Daten sind; sie werden jetzt als <c4/> beschrieben, und die Einheit jeder Position wird aus der eigenen Einheitentabelle des DURCHLAUFENEN Pakets in <c5/> und <c6/> gelesen (oder aus der angegebenen <c7/> der Achse genommen, die mit der des Pakets übereinstimmen muss, wenn beide existieren; null, wenn keine von beiden existiert, angegeben statt geraten). <c8/> war die davor und fiel von der Liste, als ihr veröffentlichtes Dokument einen units-Block bekam: Der Additivitäts-Pin, der <c9/> als verbotenen Schlüssel benannt hatte, BEWEIST jetzt stattdessen, dass die Ergänzung additiv ist — wird der Block wieder entfernt, ergibt das Dokument weiterhin die beiden Konstanten, die eingefroren wurden, bevor er existierte, sodass ein veröffentlichter Wert, der sich unter der Ergänzung bewegt hat, weiterhin scheitert. Die Arbeit brachte außerdem zwölf Einheiten- oder Dokumentationsdefekte im bestehenden Code zutage, die gemeldet und nach R1 nicht behoben wurden

# text
seg-cf779c468eed = Mond-Bezugsdatum aus einer REALEN Beobachtungskampagne

# text
# c1: lunar-llr-datum
seg-96151f13a92b = Die Kovarianz des Helmert-Datums mit sieben Parametern, bei der die beiden simulierten Eingaben durch gemessene ersetzt sind: Der Zeitplan sind die Sendezeitpunkte am Boden von { "337" } archivierten Normalpunkten der ILRS-Mondlaserentfernungsmessung (2015-04-08 bis 2015-06-27, Grasse MeO { "7845" } und Matera MLRO { "7941" }, alle fünf Retroreflektor-Anordnungen), und jedes Beobachtungsgewicht ist die eigene archivierte Präzision bin_rms/√n_raw dieses Punktes — Median { "5.13" } mm der einfachen Entfernung, aus der Datei gelesen. Stationskoordinaten IERS ITRF2020, Reflektorkoordinaten JPL DE430 Tabelle { "7" }. Ausführbar als die Szenarioart <c1/>. Die validierte Aussage ({ "0.36" }) ist eng gefasst: Auf dem analytischen Standardpfad stimmt die Berechnung der Datumskovarianz mit einer unabhängigen Referenz aus SPICE-Lichtlaufzeit und NumPy auf frischen gemessenen Normalpunkten überein; sie ist keine LLR-Genauigkeit und kein Beleg dafür, dass der analytische Mond genau ist

# text
seg-c815cb90dcde = Geodäsie der Mondreferenzstation: hinzugefügter Retroreflektor und VLBI-Bake gegen das Datum aus fünf Anordnungen

# text
seg-103cf21173ac = Optionale Eingaben extra_reflectors und extra_beacons im Szenario lunar-llr-datum fügen einen Block station_geodesy hinzu: die Helmert-Information der fünf Anordnungen aus dem archivierten Ausschnitt der Mondlaserentfernungsmessung plus die Information, die ein hinzugefügter Retroreflektor (mit Entfernungsmessung zu den archivierten Normalpunkt-Epochen, in denen die messende Station über ihrem Horizont steht, jeweils mit dem archivierten Gewicht dieses Normalpunkts) und eine hinzugefügte VLBI-Bake (beobachtet vom Netz und Zeitplan der lunar-frame-campaign bei festgehaltenen Erdstationen, über die Verzögerungspartialen von lunar-vlbi-fim) an angegebenen Orten auf das Datum mit sieben Parametern legen, neu gelöst, mit dem 1-sigma jedes Helmert-Parameters davor und danach, ihrem Verhältnis, den Normen davor und danach und den extremen Eigenwerten der Fisher-Differenz. Fehlen sie oder sind sie leer, bleibt der Bericht unverändert

# text
seg-479a7e6bbedb = Nur interne Konsistenz: Jeder hinzugefügte Ort ist ein eigener Punkt, und eine Laserentfernung oder eine VLBI-Verzögerung bei festgehaltener Station berührt einen Punkt, sodass seine Information A_p^T M_p A_p positiv semidefinit ist und sich addiert; der Test prüft die Fisher-Differenz und jede Varianz dagegen. Das Ergebnis der fünf Anordnungen ist die bestehende Zeile mit realen Daten und bleibt unverändert. Der hinzugefügte Reflektor verwendet die Epochen wieder, die für die fünf bestehenden Anordnungen geplant sind, ein ILLUSTRATIVE Zeitplan, und Netz, Zeitplan und Verzögerungs-Sigma der hinzugefügten Bake sind die ILLUSTRATIVE Eingaben von lunar-frame-campaign; der Ort ist eine ILLUSTRATIVE südpolare Position. Ein südpolarer Ort sieht die Erde tief am Horizont oder gar nicht, was die bestehenden Tests zum Blickwinkel ausdrücken; keiner der beiden Orte wird fortlaufend entfernungsgemessen. Die Zahlen sind Cramér-Rao-Schranken für eine reduzierte Parametermenge, kein gelöstes Datum und keine Aussage über eine reale Station

# text
seg-d9f033ebf109 = Mond-Bezugsdatum aus einer REALEN Beobachtungskampagne, Mondzentrum aus dem Kernel

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = Die Kovarianz des Helmert-Datums mit sieben Parametern von lunar-llr-datum aus archivierten ILRS-Normalpunkten und ihren gemessenen Gewichten, auf dem Kernel-Pfad: Das geozentrische Mondzentrum wird von dem eigenen Kernel-Leser der Engine aus JPL DE440 gelesen (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Nur das Mondzentrum unterscheidet sich von der analytischen Zeile; die Orientierung der IAU { "2015" }, die fehlende Polbewegung und UT1, die Kataloge, Auswahlregeln, Gewichte und die lineare Algebra sind dieselben. Die validierte Aussage ist nur, dass die Datumskovarianz dieses Pfads mit einer unabhängigen Referenz aus SPICE und NumPy auf frischen, ungesehenen Normalpunkten übereinstimmt. Der Vergleich unterscheidet Mondmodelle nicht und prüft das Mondzentrum nicht: Auf demselben Ausschnitt besteht auch der analytische Mond jeden Zielwert, die vorregistrierte Mutation (der Kernel-Mond eine Stunde zu spät gelesen) wurde nicht erkannt, und ein um etwa { "4,650" } km falsches Mondzentrum besteht ebenfalls (siehe den Text der Referenz). Es ist kein Beleg dafür, dass der Kernel-Mond das Datum verbessert. Ausführbar als das Szenario <c1/> mit planetary_kernel_path (und normal_points_dir für einen anderen Ausschnitt)

# text
seg-bd3af378b613 = Eingebaute analytische Mondephemeride — ihre ANGEGEBENE GENAUIGKEITSSCHRANKE gegen reale Daten geprüft

# text
seg-a51c4e234a4f = ephem::moon_position, die geozentrische Mondreihe geringer Präzision, auf die die Crate zurückfällt, wenn kein DE/SPK-Kernel vorhanden ist, gemessen gegen reale Mondlaserentfernungsmessung und gegen eine veröffentlichte Planetenephemeride über denselben Zeitraum. Diese Zeile validiert die Schranke, die das Modul über sich selbst angibt, KEINE Genauigkeit: Es wird bestätigt, dass die Reihe nicht schlechter ist, als sie angibt, nicht, dass sie gut ist

# text
seg-81dff68ddd9c = ZWEI unabhängige externe Datensätze, die nichts teilen. ({ "1" }) { "337" } archivierte Normalpunkte der ILRS-Mondlaserentfernungsmessung (EUROLAS Data Center, DGFI-TUM, 2015-04-08 bis 2015-06-27, fünf Retroreflektor-Anordnungen, eingecheckt mit SHA-256 je Datei und einem Skript zum erneuten Herunterladen und Verifizieren): beobachtet-minus-berechnet einfache Entfernung { "156,494" } m RMS, mit Stationskoordinaten aus IERS ITRF2020 und Reflektorkoordinaten aus JPL DE430 Tabelle { "7" }, sodass das Residuum von der Reihe des Mondzentrums dominiert wird. ({ "2" }) Geometrische geozentrische Mondzustände von JPL Horizons über denselben Zeitraum: { "112,567" } m RMS radial, { "195,655" } m RMS Vektor, schlechteste Epoche { "360,324" } m = { "0.0536" }°. Ein Entfernungsresiduum reagiert auf den RADIALEN Anteil eines Ephemeridenfehlers, sodass ({ "1" }) und ({ "2" }) dieselbe Größe auf zwei Wegen sind und auf { "1.39" }× übereinstimmen — was das Szenario lunar-llr-datum berechtigt, sein Residuum der Ephemeride zuzuschreiben. Die eigene Moduldokumentation der Engine beansprucht ~{ "0.3" }° / ~einige·10² km; beide Messungen liegen darin, die Winkelaussage mit einem Abstand von { "5.6" }×. GELTUNGSBEREICH, so angegeben, dass kein Leser ihn missverstehen kann: Dies validiert die angegebene SCHRANKE, keine Genauigkeitszahl. Die Reihe bleibt ungeeignet für jede Anwendung, die besser als ~{ "1e5" } m braucht, und diese Einschränkung ist ebenso Inhalt der Zeile wie die Übereinstimmung. Offline regenerierbar durch die eingecheckten Skripte zum Abrufen und Verifizieren

# text
seg-44f582b17fa9 = Integrität des Tores — ein Grün, das bedeutet, was es sagt

# text
# c1: cargo test --all
seg-43fbcfbe990c = Drei strukturelle Wachen über den Verifikationsprozess selbst, die jeweils eine Klasse von Defekten schließen, die als zeitweiliges oder falsches Rot das kanonische Tor erreicht hat. ({ "1" }) Jeder konstruierte temporäre Pfad in den Rust-Quellen muss eine Komponente tragen, die je Aufruf eindeutig ist; eine Prozess-ID wird abgelehnt, weil cargo die Bibliothekstests als parallele Threads EINES Prozesses ausführt und die pid von allen geteilt wird. ({ "2" }) Jeder Byte-für-Byte- oder Hash-Pin muss neben sich oder in seinem Modulkopf angeben, was er abdeckt und was er bewusst ausschließt — damit eine übergreifende Änderung auf einen Blick erkennen kann, welche Pins im Geltungsbereich liegen und welche stillschweigend zu repositoryweiten Änderungsdetektoren geworden sind. ({ "3" }) Ein Grün ist nur aus der VOLLSTÄNDIGEN Suite behauptbar: scripts/gate.sh führt <c1/> aus, erfasst den wahren Exit-Code ohne eine Pipe dazwischen und schreibt eine Quittung, die den Commit, die Anzahl der Integrationsbinärdateien, die Anzahl der Tests und die Dauer nennt; die Prüfung vor dem Push lehnt einen Push ab, dessen Commit keine gültige Quittung nennt, auf einem sauberen Baum. Die Wiederholbarkeit wird getrennt durch scripts/check-repeatability.sh stichprobenartig geprüft, das die Bibliothekssuite N-mal ausführt und scheitert, wenn sich die Menge der bestandenen Tests unterscheidet.

# text
seg-17a5f9da54a4 = Geschlossene Form: Jede Wache wird über einen festen bekannt schlechten Schnipsel ausgeführt, der auslösen muss, und einen festen bekannt guten Schnipsel, der still bleiben muss, beides wörtliche Konstanten, die der Detektor nicht beeinflussen kann. Die beiden bekannt schlechten Schnipsel sind die Defekte F22 und F25 in ihrer ursprünglichen Gestalt. Dies ist eine INTERNE Referenz, und die Zeile ist entsprechend MODELLED: Sie beweist, dass die Wachen den Defekt von seiner Behebung unterscheiden, nicht, dass die Klassen, die sie beschreiben, erschöpfend sind. Ihre angegebenen blinden Flecken — geteilter Zustand, der kein Pfad ist, ein Pin in einer kurzen benannten Konstante, ein seltener Wettlauf, den drei Läufe nicht erfassen, und eine Quittung, die jeder fälschen kann, der die Datei schreiben kann — sind in der Moduldokumentation von tests/source_guards.rs und im Kopf jedes Skripts ausgeschrieben, statt dass man sie erst entdecken muss.

# text
seg-178192c9c87a = Zusammengesetztes Zeitgebungs-PL — skalare MHSS-Spezialisierung (H=1_N)

# text
seg-431aaf94ec31 = Skalares Zeit-TPL der Lösungstrennung über heterogene Quellen; PL getrieben vom Rauschen der Teilmenge des schlechtesten Ausschlusses + UTC(k)-Bias

# text
seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq und scipy { "1.18.1" } (norm.isf, norm.sf, brentq) berechnen mit ihren eigenen Algorithmen die gewichteten Kleinste-Quadrate-Schätzer der Teilmengen, die allgemeine Trennungskovarianz sqrt(Δ Σ Δᵀ), die Biase und daraus das Schutzniveau auf { "300" } eingecheckten Eingaben neu (tests/fixtures/tpl_scalar_numpy_oracle); das PL stimmt innerhalb von { "1e-9" } relativ überein (schlechtester Wert { "1.2e-10" }), und die treibende Ausschlussteilmenge ist identisch, die Toleranz vor dem Vergleich festgelegt. Die Multiplikatoren, Priors und Bias-Überschranken sind Eingaben, und die Struktur der PL-Gleichung (Modusliste, Aufteilung ir/2, Bias-Projektion) ist eine angegebene Eingabe, wie bei der Zeile zum Kern des lunaren ARAIM-Schutzniveaus; die validierte Aussage ist die lineare Algebra und das PL auf diesen Eingaben, nicht die physikalischen Größen eines Zeitgebungsszenarios. ARAIM-Linie Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = Zusammengesetztes Zeitgebungs-PL — mit P0 gestartete Holdover-Überbrückung

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); unterhalbstetiges PL({ "0" }+)≥PL({ "0" }−); K(IR/2) laufendes Maximum; Phasenexponenten τ/τ³/τ⁵

# text
seg-1438193381be = Eigenschaftstests (Monotonie, kein Abfall bei der Übergabe) + Exponenten-Lint gegen holdover::coast_phase_variance

# text
seg-3ab4509b62a2 = Zusammengesetztes Zeitgebungs-PL — Abdeckung der Holdover-Hüllkurve, Mehrjahresbereich (tau>=90d)

# text
seg-d9520f6c1769 = Die Hüllkurve des laufenden Maximums überschränkt (ohne Durchstoß) eine reale metrologische Reihe bei jeder getesteten Verzögerung tau>=90d auf einem disjunkten Segment; kurzes tau (<=30d) ist eine offengelegte Grenze von Modelled

# text
seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5-Tage-Reihe MJD 56074-60429 ({ "872" } Punkte, webtai-API); disjunkte Anpassung/Test, mehrjährige Abdeckung ohne Durchstoß

# text
seg-096b6cdfe2dc = Zusammengesetztes Zeitgebungs-PL — LIL-Hüllkurve f.s. (Unmöglichkeit + Konsistenz)

# text
seg-1671add2210d = Kein endliches Worst-Case-Holdover (das Brownsche Supremum divergiert); IR-zugeteiltes HPL konsistent mit der Hartman-Wintner-Hüllkurve für IR→{ "0" }

# text
seg-c9ed8bbede70 = Identität der Hüllkurve f.s. √(2Dt·lnln t) in geschlossener Form + Prüfung der HPL-Dominanz; Baweja arXiv:{ "2606.24210" } Naht der Unmöglichkeit

# text
seg-5a27c9f0a67d = Integritäts-Überschranke für den heterogenen Rückführbarkeits-Bias von UTC(k)

# text
seg-fd09ab2adbf6 = Überschranke des Bias je Quelle b = (U/k_cov)·Phi^-1(1-tail/2) + Alterung, die eine veröffentlichte erweiterte Unsicherheit vom Typ B auf einen zugeteilten Integritätsrand aufbläht; Brücke zu tpl_scalar als bias_s

# text
seg-d75b900ad25f = Korrelierte Kreuzkovarianz des Rückführbarkeits-Bias (für Gleichtakt unsichere Zuteilung)

# text
seg-0641f6d38c23 = N×N-Bias-Kreuzkovarianz mit Nebendiagonalen rho·b_i·b_j für Quellen, die einen UTC(k)-Realisierer teilen; BEWIESEN correlated_fused_bias >= independent_fused_bias (die naive unabhängige Zuteilung unterschätzt den fusionierten Bias -> optimistisch -> unsicher)

# text
seg-72359f29aab1 = Unabhängige numpy-Reproduktion der Kreuzkovarianz und der Ungleichung zwischen korreliertem und unabhängigem fusioniertem Bias (InternalConsistency). Repräsentative Quellenmenge; Szenario Modelled.

# text
seg-0359a9194c60 = GLS-Gleichtakt-Weißung (Aitken) + Mahalanobis-Identität

# text
seg-67b11ff6d055 = Handgeschriebene Cholesky-Zerlegung Omega=LL^T und Weißung durch Vorwärtssubstitution z=L^-1 r (Cov(z)=I, wenn Cov(r)=Omega); Mahalanobis-Quadrat z^T z = r^T Omega^-1 r

# text
seg-2797643153dc = Zeitgebungs-Schutzniveau für einen Empfänger im Orbit unter GNSS-Spoofing

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, erreichbar als Spoofing-Abschnitt der Art <c1/>: Geschwindigkeit und Periode auf einer Kreisbahn, die längste Zeit, in der ein Bodenspoofer den Satelliten je Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungslatenz, das bedingte Schutzniveau (Untergrenze plus Auslaufen über die Latenz), den Zug, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seinen Footprint verlässt oder eine unabhängige Prüfung läuft, und ob jede Bodenkontakt- oder Crosslink-Prüfung von einem Bodenspoofer unabhängig ist

# text
seg-3d441db3a373 = Reduktion auf das bestehende Zeitgebungs-Schutzniveau und die geschlossenen Formen für Kreisbahn und kugelförmige Erde bei der Sichtbarkeit. Bedingt auf Erkennung, ein terrestrischer Spoofer mit einer angegebenen Rampenrate, ein Überflug direkt darüber auf einer nicht rotierenden Erde; nicht an einem gespooften Empfänger im Orbit validiert

# text
seg-158a99d40b0d = Leistungsdichtespektren von L-Band-Signalen in geschlossener Form und spektrale Trennungskoeffizienten

# text
seg-17060c71fa54 = Leistungsdichtespektren mit Einheitsfläche von GPS L1 C/A und L2C (BPSK({ "1" })), GPS L5 und Galileo E5a (BPSK({ "10" })), Sinus-BOC({ "1,1" }) und Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, mit einer ergänzten MBOC-Variante), ihre numerisch lokalisierten Nullstellen und Maxima (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz) und der spektrale Trennungskoeffizient eines Signals gegen ein beliebiges Spektrum bei einem beliebigen Versatz (navsignal::spectral_separation_coeff_offset) oder gegen einen Ton, flaches Rauschen, einen Chirp oder angepasstes Rauschen (spectrum::Jammer::ssc), mit dem Anti-Jam-Koeffizienten Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Veröffentlichte Lehrbuchwerte: die BPSK(n)-Hauptkeule von 2n x { "1.023" } MHz von Nullstelle zu Nullstelle und die Anti-Jam-Koeffizienten Q = { "1" } für einen Schmalband-Jammer (CW) und Q = { "1.5" } für einen Spreizspektrum-Jammer, der an C/A angepasst ist (Kaplan & Hegarty, Understanding GPS/GNSS, 3. Aufl., Abschnitt { "9.4" }); die BOC(m,n)-Hauptkeulen, zentriert bei plus oder minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); die spektralen Trennungskoeffizienten -61.8, -64.8 und -67.8 dB/Hz für C/A mit C/A, BOC({ "1,1" }) mit BOC({ "1,1" }) und C/A mit BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, Mai/Juni { "2006" }), hier aus ihren geschlossenen Formen der Autokorrelation nach Parseval reproduziert. Das Maximum von BOC({ "1,1" }) liegt nicht bei { "1.023" } MHz: Die Keule reicht von der Trägernullstelle bis { "2.046" } MHz und hat ihre Spitze bei { "0.759" } MHz, und der Test legt beides fest. Die MBOC-Mischung ist die Definition des ICD, nur auf Einheitsfläche und Linearität geprüft

# text
seg-f134975d4ffa = L-Band-Spektrum-Wasserfall mit J/S je Band und effektivem C/N0 unter einem skriptgesteuerten Jammer-Zeitverlauf

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Die Art <c1/>: ein Raster aus Frequenz mal Zeit der Leistungsdichte im L-Band (thermischer Boden k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }), die Signale mit ihren in der Schnittstellenspezifikation angegebenen minimalen Empfangsleistungen sowie Continuous-Wave-, Schmalband-, Chirp- und Matched-Noise-Jammer mit Ein-/Ausschaltzeiten), jede Zelle über ihren Bin und ihre Zeile gemittelt (Chirps exakt über ganze und teilweise Durchläufe, Jammer nach Tastverhältnis), je Zeile effektives C/N0 je Band = [1/(C/N0) + sum (J/S) kappa]^-1, J/S je Band, J/S im Band und ein SVG-Wasserfall mit C/N0-Balken. Der Bericht trägt eine Gegenprüfung gegen die Kette der Art <c2/> mit denselben Streckeneingaben

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Reduktion auf die Anti-Jam-Gleichung und das Streckenbudget der bestehenden Art <c1/> (derselbe Code, mit denselben Eingaben aufgerufen) und die geschlossene Form des Rauschbodens k T0 F. Die zugrunde liegenden Signalspektren sind die validierte Zeile oben; die Jammer-Leistungen, der Zeitverlauf und die Bandbreiten des Frontends sind Szenarioeingaben, die Spektren sind kontinuierlich (keine Spreizcode-Linien), und keine automatische Verstärkungsregelung, Ausblendung oder Antennencharakteristik wirkt auf den Jammer. Im Repository liegt kein gemessenes gejammtes Spektrum, gegen das sich das Gesamtmodell prüfen ließe. Die Q-Tabelle der Art <c2/> (CW und Schmalband { "1" }, Breitband und Sweep { "2" } seit { "0.36" }: die Lehrbuchwerte, auf die geschlossenen Formen von navsignal festgelegt) stimmt mit dem CW-Wert dieses Modells überein und weicht von dem ab, was es für an C/A angepasstes Rauschen ({ "1.5" }) und für flaches Rauschen von Nullstelle zu Nullstelle ohne Normierung im Band ({ "2.2" }) ableitet; der Bericht gibt beides aus

# text
seg-1461dcaed6be = SigMF-Aufzeichnung als Eingabe und Ausgabe sowie Welch-Spektralschätzungen komplexer IQ-Daten

# text
# c1: spectrum
seg-2195d95299b2 = sigmf: Aufzeichnungen im Signal Metadata Format lesen und schreiben (JSON .sigmf-meta mit den Kernfeldern global, captures und annotations; rohes .sigmf-data als cf32_le, ci16_le oder ci8, wobei die Ganzzahl-Decoder mit realdata::iqif::load_iq geteilt werden), alles auf Zeichenketten und Bytepuffern. spectrum::welch_psd: Periodogramme mit Hann-Fenster, überlappend, gemittelt, dichteskaliert, auf einer Radix-2-Transformation innerhalb der Crate (spectrum::fft_in_place). Diese beiden sind die validierte Aussage. spectrum::synthesise_iq zieht das Modell als IQ, und der Abschnitt [iq] der Art <c1/> führt Modell zu IQ zu SigMF zu Welch aus und vergleicht mit dem Modell; sein Abschnitt [recording] schätzt eine reale Aufzeichnung (native Builds); die Synthese und diese Modellvergleiche liegen außerhalb der validierten Aussage

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) mit demselben periodischen Hann-Fenster, Überlappung, Dichteskalierung, ohne Detrend und zweiseitigem Mittelwert: jeder Bin innerhalb von { "1e-12" } relativ (beobachtet { "6.0e-14" }) über { "27" } Fälle, wobei die Segmentzahlen aus dem eigenen Spektrogramm von scipy stammen. sigmf-python { "1.13.0" } (LGPL-3.0, als Werkzeug ausgeführt) schreibt fünf Aufzeichnungen Dritter (cf32_le, ci16_le, ci8, zwei Captures mit Annotationen, ein erstes sample_start ungleich null), die die Crate bitidentisch mit identischen Kernfeldern dekodiert, und liest die Aufzeichnungen der Crate bitidentisch zurück; das Metadatenschema von SigMF { "v1.2.6" } meldet null Fehler auf den Metadaten der Crate. Toleranzen vor dem ersten Vergleich festgelegt. Außerhalb der Aussage: spectrum::synthesise_iq und die Vergleiche von [iq] und [recording] mit dem Modell (eine Synthese hat keine einzige richtige Antwort; ein periodischer Chirp zeigt Linien, Fresnel-Welligkeit und Randausläufer, die das glatte Modell auslässt, Gesamtleistung innerhalb von { "2" } %), die Konvention der Skalierung von Ganzzahl zu Gleitkomma (die Crate teilt durch { "32767" } und { "127" }, die automatische Skalierung von sigmf-python durch { "2" }^{ "15" } und { "2" }^{ "7" }, was die Spezifikation offenlässt; der Vergleich verwendet rohe Codes), mehrkanalige Aufzeichnungen und die Datentypen, die der Leser ablehnt

# text
seg-bf2d02d76762 = Planetenpositionen im gesamten Sonnensystem aus den keplerschen Elementen von JPL nach Standish

# text
# c1: solar-system
seg-c9d3549045eb = Heliozentrische Positionen von Merkur, Venus, dem Erde-Mond-Schwerpunkt, der Erde, Mars, Jupiter und Saturn aus Standish Tabelle { "1" } ({ "1800" } n. Chr. bis { "2050" } n. Chr.) und aller acht Planeten aus den Tabellen 2a/2b ({ "3000" } v. Chr. bis { "3000" } n. Chr., mit den Termen b, c, s, f der mittleren Anomalie), dem Algorithmus der JPL-Seite Schritt für Schritt folgend und mit der Schiefe der Seite ins ICRF (International Celestial Reference Frame) gedreht; die Erde wird durch die Mondreihe von Montenbruck & Gill und das Massenverhältnis vom Schwerpunkt getrennt. Zusammengesetzt als ephem_provider::AnalyticSolarSystem, sodass jeder Körper relativ zu jedem anderen verfügbar ist, und ausführbar als die Art <c1/>

# text
seg-4ea08a296b37 = Positionen von Sonne, Mond, Merkur und Venus aus dem Kernel DE440 zu UTC-Epochen (KernelEphemeris)

# text
seg-8d47467c36e4 = Geometrische Positionen von Sonne, Merkur, Venus, Erde und Mond relativ zueinander (J2000/ICRF-Achsen, Meter) aus einem JPL-DE440-Kernel über ephem_provider::KernelEphemeris zu UTC-Epochen: Körpernamen auf NAIF-Codes abgebildet, UTC durch die Schaltsekundentabelle und TT mit der Zweiterm-Reihe TDB-TT zu TDB geführt, der Kernel vom eigenen Leser der Engine gelesen. Ein Körper, den der Kernel nur als Systemschwerpunkt enthält (Mars bis Neptun, Pluto in de440s), wird abgelehnt, nie ersetzt. Die kernelfreie Zeile nach Standish bleibt der Pfad für Browser und Rückfall

# text
seg-b59153f28d69 = Lichtlaufzeit zwischen Körpern des Sonnensystems

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = Die newtonsche einfache Lichtlaufzeit von jedem Körper zu jedem anderen, zu einer Epoche empfangen, gelöst durch den radiometrischen Fixpunkt-Lichtlaufzeitlöser (radiometric::light_time_solution, Sender an seiner retardierten Position) über solar_system::link_on auf einem beliebigen EphemerisProvider; die Art solar-system führt ihn auf dem analytischen Sonnensystem im heliozentrischen Bezugssystem aus (solar_system::link). Die Zweiweg-Entfernung aus radiometric::two_way_range und die Shapiro-Verzögerung der Sonne aus radiometric::shapiro_delay werden getrennt berichtet und nicht extern verglichen. Ausgegeben für jeden Körper gegen einen Beobachter und für jede zusätzliche Strecke durch die Art <c1/> sowie für den Downlink vom Körper zur Erde durch die Art <c2/>

# text
seg-6e0b9687e8ee = Uranus und Neptun aus Standish Tabelle { "1" }, Pluto und Planetengeschwindigkeiten

# text
seg-df3bf502dfe9 = Positionen von Uranus und Neptun aus Standish Tabelle { "1" } (die Voreinstellung innerhalb von { "1800" } n. Chr. bis { "2050" } n. Chr.), Pluto aus der Zeile der Tabelle { "1" } von { "1992" }, die die aktuelle JPL-Seite nicht mehr aufführt, und die heliozentrische Geschwindigkeit jedes Planeten: die Zweikörper-Ableitung mit der durch die Elemente implizierten mittleren Bewegung plus der Drehung der Ellipse durch die Raten von Perihel, Neigung und Knoten

# text
seg-f49245efe44f = Gemessen gegen JPL Horizons DE441 (dieselben eingecheckten Fixtures), aber nicht validiert: Die angegebenen Zahlen der Tabelle { "1" } für Uranus und Neptun werden gegen heliozentrische Positionen von DE441 um bis zu { "2.0" } und { "5.2" } Mal überschritten (Neptun hält sie gegen baryzentrische Positionen ein, was nahelegt, dass die Anpassung nicht heliozentrisch war), die Seite gibt keinen Fehler für Pluto an, und für die Geschwindigkeiten existiert keine veröffentlichte Schranke. Die Tabellen 2a/2b halten ihre eigenen Zahlen für Uranus und Neptun ein und sind von der validierten Zeile abgedeckt

# text
seg-a50be56f605a = Positionen des Mondes und von sieben großen Monden (Phobos, Deimos, die galileischen Monde, Titan)

# text
seg-2cfbe5a1eece = Der geozentrische Mond aus der Reihe von Montenbruck & Gill (deren Term von -1.3972 deg pro Jahrhundert ihn bereits auf das Äquinoktium J2000 bezieht) sowie planetozentrische Positionen und Geschwindigkeiten von Phobos, Deimos, Io, Europa, Ganymed und Kallisto aus den mittleren Elementen der JPL Solar System Dynamics in der Laplace-Ebene jedes Mondes, wobei die Rate der mittleren Länge aus der synchronen Rotationsrate der IAU genommen wird (die Tabelle druckt die Periode mit zu wenigen Stellen, um die Phase zu halten), und von Titan aus dem Rotationsmodell der IAU (der Mond auf der negativen körperfesten x-Achse im mittleren Abstand), weil die gedruckte Zeile der Laplace-Ebene von Titan Horizons nicht einmal bei ihrer eigenen Epoche reproduziert

# text
seg-6c81bd570fe5 = Gemessen gegen die Satellitenephemeriden von JPL Horizons (DE441, MAR099, JUP365, SAT441), eingecheckt in tests/fixtures/solar_system/horizons_satellites_icrf.csv mit Abfrage und Abrufdatum; für mittlere Elemente oder für die Platzierung nach dem Rotationsmodell existiert keine veröffentlichte Genauigkeit, sodass die festgelegten Zielwerte Regressionen auffangen und nicht validieren. Mittlere Elemente lassen die resonanten und solaren Störungen aus, und die säkulare Beschleunigung von Phobos ist nicht modelliert

# text
seg-8b8c8e28ece9 = Physikalische Konstanten jedes Körpers des Sonnensystems und der Bericht über das gesamte System

# text
# c1: solar-system
seg-d225a30de35c = Body erhält Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan (Gravitationsparameter, Referenzradius, J2, wo veröffentlicht, mit dem Radius, auf den es sich bezieht, IAU-Pol und Nullmeridian), eine Namenssuche und einen Datensatz BodyFacts (NAIF-Code, Klasse, Mutterkörper, Äquatorial- und mittlerer Radius); die Art <c1/> berichtet sie für alle achtzehn Körper mit den Positionen, Lichtlaufzeiten und einer Bahnspur über einen Umlauf, wobei jeder Körper als VALIDATED oder MODELLED gekennzeichnet ist

# text
seg-6adc29de51fd = Abschrift veröffentlichter Konstanten, jeweils dort zitiert, wo sie definiert werden: Gravitationsparameter aus den Körperdatensätzen von JPL Horizons und der Tabelle der physikalischen Satellitenparameter von JPL, Radien aus den Tabellen der physikalischen Parameter von JPL (IAU WGCCRE { "2015" }), Pole und Nullmeridiane aus der IAU Working Group on Cartographic Coordinates and Rotational Elements (Mittelwerte, ohne die T-Raten und periodischen Terme), J2 aus Smith et al. { "2012" }, Iess et al. { "2018" } und { "2019" } sowie Jacobson { "2009" } und { "2014" }. Auf interne Konsistenz geprüft (die Rotationsperiode des Jupiter gegen die Rate des Systems III, jedes J2 gegen seinen Referenzradius), nicht gegen eine externe Referenz. { "0.30" } Runde { "2" }: Die GM-Werte wurden aus gm_de440 und die Elemente von Phobos und Deimos aus pck00011 übernommen, sodass nun { "0" } von { "84" } Konstanten der vierzehn hinzugefügten Körper von NAIF abweichen (zuvor { "12" }), was eine Abschriftsprüfung ist und nicht gezählt wird. { "0.36" }: Die körperfeste Orientierung der IAU und das GM der vierzehn hinzugefügten Körper sind in eine eigene Zeile VALIDATED ausgelagert ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); diese Zeile behält, was übrig ist. J2 und der mittlere Radius sind zitiert, nicht validiert; die Positionen im Bericht beruhen auf ihren eigenen Zeilen; und der Bericht prime_meridian_deg für Erde, Mond und Mars bleibt bei konventionellen Konstanten (bis zu { "6.6e-3" }, { "2.8e-2" } und { "9.6e-4" } rad von IAU_<BODY>). { "0.30" } Revisionen: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Äquatorialradius von Phobos { "13.1" } -> { "13.0" } km; prime_meridian_deg enthält jetzt die quadratischen und periodischen Terme

# text
seg-fa8a4b082cd5 = IAU-Körperorientierung und Gravitationsparameter der vierzehn hinzugefügten Körper des Sonnensystems

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, die Rotation von J2000 in das körperfeste IAU-System von Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan mit jeder Jahrhundertrate, jedem quadratischen Term und jedem periodischen Term, den der Körper in pck00011 trägt, und das Feld des Gravitationsparameters mu derselben vierzehn Körper. Sonne, Erde, Mond und Mars tragen konventionelle Konstanten, die anderen Zeilen gehören, und sind nicht abgedeckt

# text
seg-87ab655f8270 = Positionsbestimmung um jeden Körper des Sonnensystems mit einer lokalen Konstellation und einer Deep-Space-Verbindung von der Erde

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Die Art <c1/>: Ein Orbiter oder ein Lander auf der Oberfläche um einen mit Namen gewählten Körper navigiert mit einfachen Pseudoentfernungen von einer Walker-Navigationskonstellation um den Körper (Zweikörperbahnen mit der säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr) und einer optionalen uhrfreien Zweiweg-Entfernung von der Erde, wobei Richtung und Entfernung der Erde bei jeder Epoche aus der analytischen Ephemeride stammen; durch die Kugel des Körpers blockierte Sichtlinien und eine Elevationsmaske an der Oberfläche; je Epoche GDOP und PDOP allein der Konstellation (orbit::dop), die formale Positionsunsicherheit mit und ohne die Erdzeile und Gauß-Newton-Lösungen mit festem Startwert (batch_ls::gauss_newton) in beiden Varianten, mit Lichtlaufzeit und Umlaufzeit vom Körper zur Erde

# text
seg-3538c49df107 = Geschlossene Formen und Selbstkonsistenz: das dritte keplersche Gesetz für die Relaisperiode, der über den Lauf gehaltene Bahnradius und Oberflächenradius, die Tatsache, dass das Hinzufügen einer Messung die formale Unsicherheit nie erhöht, und die Übereinstimmung der mit festem Startwert erzeugten Fehler mit der Kovarianz. Die Relaisbahnen ignorieren dritte Körper (die Anziehung des Jupiter auf Relais um Europa ist nicht modelliert), das Rauschen ist gaußsch bei angegebenen Pegeln und das Messmodell ist augenblicklich, daher ist dies nicht gegen die Navigationsdaten irgendeiner Mission validiert

# text
seg-281b680a9897 = Geometrie von Walker-Konstellationen und die veröffentlichten nominellen Slots von GPS, Galileo und GLONASS

# text
# c1: constellation-design
seg-cba54289b732 = Die Generatoren der Art <c1/>: Walker-Delta- und Walker-Star-Muster in der T/P/F-Konvention (Knotenabstand 360/P oder 180/P, Abstand in der Ebene { "360" }·P/T, Phasenversatz zwischen den Ebenen { "360" }·F/T) sowie die Voreinstellungen für die GPS-Basislinie und die erweiterbaren 24 Slots, Galileo und GLONASS, aufgebaut aus ihren veröffentlichten nominellen Elementen und in einem erdfesten System mit dem Greenwich-Stundenwinkel platziert, den ihre Dokumente angeben

# text
seg-bdf83007af50 = Veröffentlichte Dokumente der Agenturen: Galileo Open Service Service Definition Document Ausgabe { "1.1" } (European GNSS Service Centre) Tabellen { "1" } und { "23" }, die Referenzkonstellation am 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document Ausgabe { "5.1" } ({ "2008" }) Abschnitt { "5.2" }, die Slot-Formel für Knotenlänge und Breitenargument; GPS Standard Positioning Service Performance Standard 5. Ausgabe (April { "2020" }) Tabellen 3.2-1, 3.2-2 und 3.2-3, einschließlich der Spalte zum Äquatordurchgang der Bodenspur, die eine unabhängige Aussage der erdfesten Geometrie ist, die die Voreinstellung reproduzieren muss. Validiert die Generatoren und die Abschrift; die Phase der mittleren Umlaufbahn von BeiDou und die Knoten der geneigten geosynchronen Bahnen sind nicht veröffentlicht und nicht abgedeckt

# text
seg-0f1d49ab5d51 = Globale Verdünnung der Genauigkeit der GPS-Basislinien-Konstellation

# text
# c1: constellation-design
seg-83775b77f5ca = Die Abdeckungs-Engine der Art <c1/> auf der Voreinstellung mit 24 Slots der GPS-Basislinie unter den Bedingungen von Anhang B des GPS Standard Positioning Service Performance Standard (SPS PS) (ein siderischer Tag, { "287" } Fünf-Minuten-Schritte, ein globales Raster von { "4" } x { "4" } deg, gewichtet mit dem Kosinus der Breite, alle sichtbar, Maske von { "5" } deg, eine Empfängeruhr): die globale HDOP-Verteilung, der PDOP-Median und die Verfügbarkeit von PDOP höchstens 6, global und am schlechtesten Standort

# text
seg-6fb3c2028c4a = GPS SPS PS 5. Ausgabe (April { "2020" }) Anhang B Abschnitte B.3.2.2 und B.3.2.3, die veröffentlichte globale mittlere HDOP-Verteilung der vollständig besetzten 24-Slot-Basislinienkonstellation (Median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, Mittelwert { "0.96" }), Tabelle 3.8-1 (PDOP-Verfügbarkeit) und Tabelle B.3-1 (Ensemble-PDOP einer degradierten Konstellation, nur als obere Schranke verwendet), plus eine von Hand abgeleitete geschlossene Form für eine Epoche. Die VDOP- und PDOP-Verteilungen der vollständigen Konstellation sind nur als Abbildung veröffentlicht, daher wird PDOP einseitig festgelegt; der schlechteste Raum-Zeit-Punkt (HDOP { "2.40" } und VDOP { "5.22" } hier, { "2.49" } und { "5.43" } veröffentlicht) hängt vom Raster ab und wird berichtet, nicht festgelegt

# text
seg-7d4d7200cbca = Abdeckungs- und DOP-Karten für beliebige Mehrkonstellations-Entwürfe im großen Maßstab, um jeden Zentralkörper

# text
# c1: constellation-design
seg-b78b79e9fae4 = Die Art <c1/> über die beiden festgelegten Fälle hinaus: explizite Entwürfe und Entwürfe mit mehreren Schalen, mehrere Konstellationen je Lauf mit einer Empfängeruhr je Konstellation, Erde, Mond und Mars aus den Körperkonstanten, die BeiDou-Voreinstellung (Phase der mittleren Umlaufbahn und Durchgang der geneigten geosynchronen Bahn bei { "118" } deg O modelliert), sichtbare Satelliten je Zelle, GDOP, PDOP, HDOP, VDOP und Verfügbarkeit, heruntergetastete Bodenspuren und ein Sichtbarkeitsvorfilter nach Breite des Subsatellitenpunkts, der einen Entwurf mit { "5" } 000 Satelliten auf einem Raster von { "10" } deg in einem Bruchteil einer Sekunde ausführt

# text
seg-278c77438493 = Eine verkettete Mission über Szenarioarten auf einer gemeinsamen Zeitleiste

# text
# c1: campaign
seg-3dcfb26f6234 = Die Phasen der Art <c1/>: Jede Phase führt über run_toml ein oder mehrere Szenarien bestehender Arten aus, liest deren Ausgaben durch Voreinstellungen je Art oder explizite Ergebnispfade in benannte Kanäle (Uhrzeitfehler und Wache, mittleres effektives Träger-zu-Rauschleistungsdichte-Verhältnis und Tracking-Untergrenze, vertikales Schutzniveau und Alarmgrenze, Positionsfehler, verfolgende Satelliten, Alarmflags), platziert sie am Phasenanfang und hält sie auf einem gemeinsamen Raster, mit Phasengrenzen und Ereignissen; der Zustand wird durch carry (ein Kanal setzt sich vom Endwert der vorigen Phase fort), handoff (eine Zahl einer vorigen Phase wird in das nächste Szenario geschrieben) und end_at (eine Phase endet zu einem Zeitpunkt, den ein Lauf berechnet hat, etwa der Erkennungszeit eines Spoofing-Monitors) weitergegeben; ein Kampagnen-Hash und ein Digest über jedes Mitgliedsergebnis

# text
seg-fd018ef7bc3b = Kompositionsidentitäten gegen die eigenständigen Läufe derselben Arten: Eine Kampagne mit einer Phase reproduziert die eigenständige Ausgabe Bit für Bit, der übernommene Versatz entspricht dem letzten Abtastwert des vorigen Laufs, und die durch end_at beendete Phase hat genau die Erkennungszeit des Laufs als Länge. Der additive Übertrag über eine Phasengrenze und das Halteglied nullter Ordnung sind Modellierungsentscheidungen, und jede Phase ist so gut wie die Art, die sie ausgeführt hat; keine verkettete Mission wurde gegen eine gemessene geprüft

# text
seg-ad6105af464c = Parameterdurchläufe und Monte-Carlo-Ensembles mit festem Startwert über jede Szenarioart

# text
# c1: campaign
seg-95921611839e = Die Abschnitte sweep (ein bis drei Punktschlüssel einer beliebigen Art, auf den Achsenwerten des generischen Durchlaufs, wahlweise mit einem Ensemble an jedem Knoten) und monte_carlo der Art <c1/>: Realisierung k läuft bei base_seed + k; jede Metrik berichtet Mittelwert, Standardabweichung, Perzentile 5/50/95 nach dem Nearest-Rank-Verfahren und ein Perzentil-Bootstrap-Konfidenzintervall von { "95" }% für den Mittelwert mit festem Startwert (inertial::metric_stat); Metrikeinheiten aus dem eigenen units-Block der durchlaufenen Art gelesen

# text
seg-03d15c27b3b9 = Die geschlossene Form des Zufallsmarsches der Phase bei weißem Frequenzrauschen, Varianz q_wf tau (NIST Technical Note { "1337" }), für die statistische Maschinerie und Byte-Gleichheit mit den eigenständigen Läufen für die Initialisierung. Es prüft die Ensemble-Arithmetik am eigenen Uhrenmodell der Engine, nicht an einem externen Datensatz

# text
seg-24327a0ed82e = Mehrere Szenarien unter gemeinsamen Bedingungen, mit einer kombinierten Zusammenfassung

# text
# c1: campaign
seg-5833fb3b06e3 = Der Abschnitt compose der Art <c1/>: benannte gemeinsame Werte (zum Beispiel Leistung und Position eines Jammers), die in jedes Mitglied an den Schlüsseln geschrieben werden, an die sie gebunden sind, jedes Mitglied wird ausgeführt, und je Metrik der kleinste, der größte und der mittlere Wert über die Mitglieder, mit dem benannten Mitglied; die Metrikeinheiten müssen über die Mitglieder übereinstimmen

# text
seg-67ffd6684b1c = Kompositionsidentität gegen den eigenständigen Lauf. Die Arithmetik der gemeinsamen Bedingungen ist Buchführung; die Physik ist die der Mitgliedsarten, jede mit ihrer eigenen Zeile

# text
seg-0bc866720bde = Beschränkte Optimierung einer Metrik über Kampagnenparameter

# text
# c1: campaign
seg-f9bdb89c2b4f = Der Abschnitt optimize der Art <c1/> (CAP-32): ein bis drei Punktschlüssel von Szenarien, auf [lo, hi] beschränkt, auf linearer oder logarithmischer Skala, eine Metrik, die über einen Ergebnispfad gelesen wird, Ziel minimize, maximize oder target; Verfahren grid (die Achsenwerte des Durchlaufs) oder ein deterministisches Nelder-Mead-Simplex in normierten Koordinaten mit Boxprojektion und den Standardkoeffizienten; eine fehlende oder nicht endliche Metrik wird als schlechteste bewertet und bleibt in der Spur; bei runs > { "1" } ist die Metrik der Mittelwert über gemeinsame Startwerte; jede Auswertung ist ein realer Lauf der benannten Art, in trace aufgeführt und im Reproduzierbarkeits-Digest mitgezählt

# text
seg-e3a2f80b04dc = Nur intern: die exakte geschlossene Form -20 log10(range) der Streckengleichung, ein unabhängiges Brute-Force-Raster über dieselbe Art und die Rosenbrock-Funktion. Der 1-D-Zielwert von Runde { "1" } ist NOT MET (die vorregistrierte Box schloss die Lösung bei { "3" } dB aus; der Optimierer stoppte an der Schranke), festgehalten in docs/design/evidence/cap32-optimize/RESULTS.md und nicht neu bewertet. Das Optimum ist lokal zur Box und zum Start; keine Aussage über ein globales Optimum

# text
seg-b9b1637d326c = Bandbegrenzte geschlossene Formen für jedes Entfernungsmesssignal: Leistung im Band und Early-Late-Code-Tracking-Jitter gegen veröffentlichte Werte, mit gegengeprüfter Gabor-Bandbreite und gegengeprüfter spektraler Trennung bei Versatz

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal: das Sinusintegral (sine_integral), der BPSK-R-Anteil der Leistung innerhalb eines zweiseitigen Bandes in geschlossener Form (bpsk_power_in_band_closed_form), die bandbegrenzte BPSK-Gabor-Bandbreite in geschlossener Form (bpsk_gabor_bandwidth_closed_form_hz), der bandbegrenzte kohärente und nichtkohärente Jitter der Early-Late-Delay-Lock-Loop für jedes Spektrum mit Einheitsfläche nach Betz & Kolodziejski { "2009" } (dll_jitter_bandlimited_s) und seine Gabor-Schranke bei verschwindendem Abstand (dll_jitter_small_spacing_limit_s), der spektrale Trennungskoeffizient von BPSK bei Versatz in geschlossener Form (bpsk_offset_ssc_closed_form), das Spektrum von Galileo E5 AltBOC({ "15,10" }) (altboc_15_10_psd) und ein Parser für Modulationsbezeichnungen (parse_modulation); von der Art <c1/> für jedes Signaldesign verwendet

# text
seg-15d8c44be46f = Extern festgelegt: { "90.3" } Prozent Hauptkeulenleistung, der kohärente Early-Late-Jitter am angegebenen Arbeitspunkt, die Tabellenwerte des Sinusintegrals und der spektrale Selbsttrennungskoeffizient 2/({ "3" } R_c) von BPSK bei Versatz null. Nur interne Gegenprüfungen, keine externe Validierung: die geschlossene Form der bandbegrenzten BPSK-Gabor-Bandbreite und ihre Asymptote sowie der spektrale Trennungskoeffizient von BPSK bei Versatz ungleich null, beide hier abgeleitet und gegen Quadratur geprüft. Veröffentlichte geschlossene Formen: das Sinc-Quadrat-Spektrum von BPSK-R und seine { "90" } Prozent Hauptkeulenleistung (Kaplan & Hegarty, Understanding GPS/GNSS, 3. Aufl.); der kohärente Early-Late-Code-Tracking-Jitter sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, Abschnitt { "8" }) und die bandbegrenzte Verallgemeinerung mit ihrer Gabor-Bandbreitengrenze (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); die Sinusintegral-Tabellen von Abramowitz & Stegun (Tabelle { "5.1" }); der spektrale Trennungskoeffizient als Fourier-Transformierte der quadrierten Autokorrelation (Betz { "2001" }). Das AltBOC-Spektrum wird nur auf Einheitsfläche und Keulenlage geprüft (der Ausdruck aus dem Galileo Open Service Signal-in-Space Interface Control Document integriert zu { "8" } und wird dadurch geteilt).

# text
seg-def449efa852 = Maximaler Doppler eines Navigationssatelliten in niedriger Erdumlaufbahn, der die Akquisitionssuche bemisst

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: der größte Satelliten-Doppler bei einem Überflug direkt darüber bei der Elevationsmaske für eine Kreisbahn, v R_E cos(el) / (R_E + h) mal f / c, aus Träger und Bahnhöhe jeder Voreinstellung; die Art <c1/> fügt Oszillator- und Nutzerterme hinzu und macht daraus Doppler-Bins

# text
seg-652e28dfa10f = Signaldesigns für Positionierung, Navigation und Zeitgebung in niedriger Erdumlaufbahn: Code-Tracking, Akquisition, GNSS-Kompatibilität und ein Bandvergleich für jedes System

# text
# c1: leo-signal
seg-c0ba5c7e708e = Die Art <c1/>: parametrisierte Signaldesigns (Band, Sendebandbreite, ITU-Zuweisung; Akquisitions-, Daten- und Pilotkomponenten mit BPSK(n)-, BOC(m,n)-, MBOC- oder flachen Spektren, Leistungsanteilen, FDMA-Unterträgern, Codelängen und Datenraten) aus einkompilierten öffentlichen Voreinstellungsdateien (Xona Pulsar, Iridium STL, Starlink-Gelegenheitssignal, CentiSpace, ein generisches C-Band-Design und generische Designs für UHF/L/S/C/Breit-C, jeweils mit ihrer Quell-URL und unveröffentlichten Werten, die als REPRESENTATIVE gekennzeichnet sind) oder inline geschrieben; je Signal die bandbegrenzte Leistungsdichte, Leistungsanteile im Band, Gabor-Bandbreite, Code-Jitter gegen C/N0 und Abstand sowie die Entfernungsmessgenauigkeit, der Akquisitions-Suchraum, die Detektionswahrscheinlichkeit mit Quadratgesetz und die mittlere serielle und codeparallele Akquisitionszeit, der spektrale Trennungskoeffizient in und aus GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b und AltBOC mit der C/N0-Degradation sowie die Toleranz gegen CW-, Breitband- und angepasstes J/S aus der SSC-Kette der Art spectrum; ein Bandvergleich von ionosphärischer Verzögerung, Freiraumverlust, Entfernungsmessgenauigkeit bei gleichem C/N0 und gleicher EIRP und Jammer-Toleranz; und qualitative Formprüfungen eines Designs gegen eine beschriebene Messung

# text
seg-040b3f5cc70e = Die validierten geschlossenen Formen der beiden Zeilen oben, die Identität der Fehlalarmwahrscheinlichkeit beim Quadratgesetz P_d(snr = { "0" }) = P_fa und die mittlere Akquisitionszeit nach Holmes sowie die Reduktion auf die eigene SSC-Kette der Art spectrum (derselbe Code Jammer::ssc). Die Designs selbst sind Eingaben: Voreinstellungen, die als REPRESENTATIVE oder WORKSHOP gekennzeichnet sind, sind keine veröffentlichten Spezifikationen, die Spektren von Enhanced-Feher-QPSK, Code Shift Keying und OFDM sind angenähert, und die Formprüfungen vergleichen Formen, keine kalibrierten Pegel.

# text
seg-c2b9c8e4a364 = Mehrband-Spektrum-Wasserfall (UHF, L, S, C) mit entworfenen Signalen und Jammern je Band

# text
# c1: spectrum
seg-609df4e0a085 = Die Art <c1/>, über das L-Band hinaus erweitert: Bänder, angegeben als voreingestelltes Signaldesign (mit jeder Komponente gezeichnet, auf die Sendebandbreite bandbegrenzt, C/N0 und J/S auf die verfolgte Komponente bezogen) oder als benutzerdefinierter Träger und Modulation; zusätzliche Wasserfall-Felder über einen beliebigen Frequenzbereich auf derselben Zeitleiste und Farbskala; ein Breitband-Jammer (Barrage) neben CW, Schmalband, Chirp und angepasstem Rauschen; J/S je Band und effektives C/N0 aus der unveränderten Kette der spektralen Trennungskoeffizienten

# text
seg-a3b398f66ad3 = Reduktion auf die bestehende Spektrumkette und die Anti-Jam-Gleichung der Art jamming (ein Band mit einer Komponente ergibt dieselben Zahlen wie vor der Erweiterung) und die Signalspektren der validierten Zeilen. Die Jammer-Leistungen, der Zeitverlauf, die Bandbreiten des Frontends und die entworfenen Signale sind Eingaben, und ein entworfenes Signal wird an seinem Sendeband abgeschnitten (keine Emission außerhalb des Bandes).

# text
seg-f92d6cbc58d4 = Koeffizienten der spezifischen Regendämpfung für jedes Band, das eine LEO-PNT-Strecke verwendet

# text
# c1: leo-pass
seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 Gleichungen ({ "1" }) bis ({ "5" }): k_H, alpha_H, k_V, alpha_V aus den Kurvenanpassungen der Tabellen { "1" } bis { "4" }, die pfad- und polarisationsabhängigen (k, alpha) und die spezifische Dämpfung k R^alpha; vom Regenterm der Art <c1/> verwendet

# text
seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Tabelle { "5" }, die von der Empfehlung selbst tabellierten k_H, alpha_H, k_V, alpha_V, eingecheckt in tests/fixtures/leo_link/p838_3_table5.csv mit der PDF-URL und dem Abrufdatum. Die Tabelle ist auf ihre gedruckten Stellen gerundet, sodass der Zielwert diese Rundung ist

# text
seg-f4a311f936de = Langzeit-Regendämpfung auf dem Schrägpfad einer Erde-Weltraum-Strecke

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = ITU-R P.618-14 Abschnitt { "2.2.1.1" } Schritte { "2" } bis { "10" } (Schräg- und Horizontalpfad unterhalb der Regenhöhe, Faktoren für Horizontalreduktion und Vertikalanpassung, A0.01 und seine Skalierung auf { "0.001" } % bis { "5" } % eines mittleren Jahres), mit der Regenhöhe (P.839) und R0.01 (P.837) als Eingaben, weil die Engine keine der beiden digitalen Karten enthält; je Band und Epoche von der Art <c1/> angewendet

# text
seg-325d1bb9c26d = Validierungsbeispiele der ITU-R Study Group { "3" } in der Datei CG-3M3J-13-ValEx-Rev8.3.0 für P.618-14, wie auf den Validierungsseiten von ITU-Rpy tabelliert, mit der P.839-4-Regenhöhe jedes Standorts aus denselben Beispielen; eingecheckt in tests/fixtures/leo_link/p618_14_rain_attenuation.csv mit den URLs und dem Abrufdatum. Validiert das Verfahren bei gegebenem h_R und R0.01, nicht die Karten

# text
seg-6b51ec84bdce = Troposphärische Amplitudenszintillation auf einer Erde-Weltraum-Strecke

# text
# c1: leo-pass
seg-869894dec004 = ITU-R P.618-14 Abschnitt { "2.4.1" } Schritte { "3" } bis { "9" } (Referenz-Sigma aus N_wet, effektive Pfadlänge, Antennenmittelungsfaktor, Schwundtiefe für { "0.01" } % bis { "50" } % der Zeit), mit N_wet als Eingabe oder aus Temperatur, Feuchte und Druck durch die Ausdrücke von ITU-R P.453-14 berechnet; unterhalb von { "4" } GHz kennzeichnet die Art <c1/> den Wert als Extrapolation

# text
seg-7fc4a1e7960a = Validierungsbeispiele der ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) für die Szintillation nach P.618-14, mit dem N_wet nach P.453-14 jedes Standorts aus denselben Beispielen; eingecheckt in tests/fixtures/leo_link/p618_14_scintillation.csv mit den URLs und dem Abrufdatum. Der Ausdruck für die feuchte Refraktivität aus Temperatur und Feuchte ist von dieser Zeile nicht abgedeckt

# text
seg-e0d40cf4ea79 = Gebäudeeindringverlust für einen Nutzer von LEO-PNT in Innenräumen

# text
# c1: leo-pass
seg-4f06274e38ec = ITU-R P.2109-2 Anhang { "1" } Gleichungen ({ "1" }) bis ({ "10" }) mit Tabelle { "1" }: der Verlust, der mit der Wahrscheinlichkeit P nicht überschritten wird, für herkömmliche und thermisch effiziente Gebäude bei der Elevation des Pfades an der Fassade, { "80" } MHz bis { "100" } GHz; je Band und Epoche von der Art <c1/> auf einen Nutzer in Innenräumen angewendet (der UHF-Fall in Innenräumen)

# text
seg-99c648f9c6eb = Die Werte der Arbeitsmappe der ITU-R Study Group { "3" } zur Validierung von Clutter und BEL, wie im Validierungsskript der MATLAB-Referenzimplementierung abgeschrieben (github.com/eeveetza/p2109), eingecheckt in tests/fixtures/leo_link/p2109_bel.csv mit der URL und dem Abrufdatum. Die Arbeitsmappe druckt drei Dezimalstellen

# text
seg-8c5e291c8ff8 = Ionosphärische Verzögerung erster Ordnung je Band, die ionosphärenfreie Kombination und der Freiraumverlust

# text
seg-89df726127f9 = Gruppenlaufzeit { "40.3" } STEC/f^{ "2" } je Band; die ionosphärenfreien Koeffizienten f1^2/(f1^{ "2" } - f2^{ "2" }) und -f2^2/(f1^{ "2" } - f2^{ "2" }) und die Rauschverstärkung sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) für jedes Bandpaar; der Freiraumverlust { "20" } log10({ "4" } pi R f/c) von linkbudget::free_space_loss_db in seiner Kilometer-Megahertz-Form

# text
seg-9bf00f744174 = IS-GPS-200 Abschnitt { "20.3.3.3.3.2" }, der das Gruppenlaufzeitverhältnis L1/L2 gamma = (77/60)^{ "2" } angibt, das aus der Skalierung 1/f^{ "2" } erster Ordnung folgt, und die Friis-Übertragungsformel (Proc. IRE, { "1946" }). Validiert die Skalierungsgesetze, kein Schräg-TEC

# text
seg-c584a867fcda = Maximaler Doppler, den ein ruhender Nutzer von einer LEO- oder MEO-Bahn aus sieht

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: eine Suche über jede Bahnposition und jeden Nutzer am Horizont des Satelliten auf einer Kreisbahn, bei sich drehender Erde, nach der größten Entfernungsänderungsrate, plus die Bahngeschwindigkeit und die größte erdfeste Satellitengeschwindigkeit; je Band als Doppler-Hüllkurve von der Art <c1/> berichtet und als Kaltstart-Suchfenster ihres energiearmen Modells verwendet

# text
seg-4abd3afebad2 = Leclere, Marathe und Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Tabelle { "1" } (ruhender Empfänger auf einer Kugel von { "6371" } km, die Erdrotation der einzige weitere Effekt): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz auf L1. Deckt kreisförmige Zweikörperbahnen ab

# text
seg-d9eb3e7e69c2 = Ein LEO-PNT-Überflug und sein Streckenbudget je Band gegen die sichtbaren MEO-GNSS-Satelliten

# text
# c1: leo-pass
seg-d986e44443dd = Die Art <c1/>: Satelliten aus einem entworfenen Überflug, aus Elementen, einem TLE über SGP4 oder einer Walker-Konstellation aus constellation-design; je Band und Epoche die Blickwinkel, die Entfernung, die Entfernungsänderungsrate und die Entfernungsbeschleunigung in geschlossener Form (bei jedem Lauf gegen zentrale Differenzen geprüft und berichtet), Freiraumverlust, EIRP mit isoflux-, gaußschem oder flachem Muster, eine Patch-, halbkugelförmige oder isotrope Nutzerantenne, gasförmige Dämpfung nach ITU-R P.676-10 Anhang { "2" }, Regen und Szintillation nach P.618, Gebäudeeindringverlust nach P.2109, Polarisationsfehlanpassung, Systemrauschtemperatur, C/N0, Doppler und Doppler-Rate sowie die Verzögerung erster Ordnung aus einem Klobuchar- oder Vertikal-TEC-Schräg-TEC, skaliert mit dem Chapman-Anteil unterhalb des Satelliten; ionosphärenfreie Paare mit Code-Rauschen am Überflugmaximum; Galileo- oder GPS-Träger aus den Empfangsleistungen ihrer Schnittstellendokumente durch denselben Empfänger

# text
seg-c558a6519038 = Geschlossene Formen und Selbstkonsistenz: die Identitäten von Entfernungsänderungsrate und Entfernungsbeschleunigung gegen numerische Ableitungen, der Isoflux-Gewinn, der das Entfernungswachstum aufhebt, die Lehrbuchgrenzen des Polarisationsverlusts, die qualitative Beobachtung LEO gegenüber GNSS (ein glockenförmiger Überflug von Minuten, der mehrere dB über den flachen GNSS-Trägern mit 44-51 dB-Hz gipfelt). Die EIRPs und Muster sind veröffentlichte Empfangsleistungen, in eine EIRP umgerechnet, oder repräsentative Entscheidungen, der Gasterm ist die überholte vereinfachte Methode nach P.676-10, und nichts wird mit einem gemessenen LEO-C/N0 verglichen

# text
seg-95a077a980b6 = Benannte LEO-PNT-Systemvoreinstellungen mit angegebenen Quellen und eine systemunabhängige Engine

# text
seg-4b47033cda24 = leo_link::presets: generisches Mehrband (UHF, L, S, C), generisches C-Band, Xona Pulsar X1/X5, Iridium STL, Starlink als reines Doppler-Gelegenheitssignal, CentiSpace und eine optionale Voreinstellung Celeste IOD, jeweils mit ihrer Quelle, gekennzeichnet als PUBLIC (mit URL), REPRESENTATIVE oder WORKSHOP, wobei die Workshop-Voreinstellung in der optionalen Voreinstellungsdatei Celeste IOD liegt, die nur einkompiliert wird, wenn diese Datei existiert; jedes Band und jede Bahn in einem Szenario überschreibbar, und ein Szenario muss keine Voreinstellung nennen

# text
seg-399dc53ceafb = Abschrift der zitierten öffentlichen Zahlen und eine Konsistenzprüfung: Eine EIRP, die aus einer veröffentlichten minimalen Empfangsleistung gesetzt wird, sagt das veröffentlichte Maximum innerhalb von { "0.5" } dB mit einem flachen Muster voraus. Das ist eine Prüfung der Entfernungsstreuung, keine Validierung der Antenne irgendeines Satelliten; repräsentative Voreinstellungen erheben keinen Anspruch auf ein reales System

# text
seg-a39f34973373 = Energiearme Positionierung: Zeit bis zur ersten Lösung und Energie je Lösung gegen Tastverhältnis

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy und der Abschnitt [iot] der Art <c1/>: kohärente Integration, durch die Doppler-Rate begrenzt, nichtkohärente Summen mit Quadratgesetz bis zu einer Detektionsschwelle, eine Doppler-Bin-Suche über die Hüllkurve der Bahn für ruhende Nutzer (kalt) oder ein gestütztes Fenster (heiß), parallele oder serielle Codesuche, Zeit der Navigationsnachricht bei einem Kaltstart, Energie je Lösung und Batterielebensdauer über Lösungsintervalle, für jedes LEO-Band und das GNSS-Signal

# text
seg-a5fa1ef1be9b = Interne Konsistenz eines angegebenen Designmodells: Jede Leistung, Schwelle und Suchentscheidung ist eine Eingabe, und das Modell ignoriert Bitflanken-Mehrdeutigkeit, verpasste Detektion und erneute Akquisition. Nicht mit einem gemessenen Empfänger verglichen

# text
seg-7e94f8b38cff = Global gemittelte Gewichte des Signal-in-Space-Entfernungsfehlers für jede Bahnhöhe

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: das radiale Gewicht w_R und das quadrierte transversale Gewicht w_AC^{ "2" } als Mittel von cos^{ "2" } und halbem sin^{ "2" } des Nadirwinkels der Sichtlinie über Nutzer, die gleichmäßig auf der sichtbaren Erdkappe oberhalb einer Elevationsmaske verteilt sind, für jeden Bahnradius, durch Simpson-Integration; von jeder SISRE-Zahl von leo-navmsg verwendet (bei { "510" } km w_R { "0.46" } und w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = Die veröffentlichte SISRE-Gewichtungsfaktor-Tabelle von Montenbruck, Steigenberger und Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } und 1/49, GLONASS { "0.98" } und 1/45, Galileo { "0.98" } und 1/61, BeiDou MEO { "0.98" } und 1/54, BeiDou IGSO/GEO { "0.99" } und 1/126. Dasselbe Mittel, bei LEO-Radien ausgewertet, ergibt die LEO-Gewichte; keine veröffentlichte LEO-Tabelle ist festgelegt, daher sind die LEO-Werte die angewendete validierte Methode, nicht gesondert validiert

# text
seg-3cbb8b6afe3c = Nutzeralgorithmus der Galileo-ICD für Broadcast-Ephemeriden als Grundlage einer LEO-Navigationsnachricht

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point: die keplersche Auswertung nach dem Galileo OS SIS ICD (keplersche Gleichung, Korrekturen zweiter Harmonischer, erdfester Knoten), getrennt vom RINEX-Auswerter der Engine geschrieben, die die Position zusammen mit Breitenargument, Neigung und Knoten liefert, aus denen das Korrekturbezugssystem Along/Cross/Radial aufgebaut wird, und die Erweiterungsterme von Liu et al. { "2025" }

# text
seg-6a90728fcea9 = ECEF-Positionen von RTKLIB 2.4.2-p13 eph2pos (eine unabhängige Implementierung desselben ICD-Algorithmus) für reale BKG/IGS-Broadcast-Datensätze vom 2024-09-10, beide eingecheckt mit Herkunft in tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Dies validiert den keplerschen Nutzeralgorithmus; die zusätzlich aufgesetzten Korrekturen Along/Cross/Radial sind von ihren eigenen Zeilen abgedeckt und die Liu-Terme von der Zeile zu den 22 Parametern nach Liu et al. { "2025" }

# text
seg-d65102fd4a1d = CRC-24Q-Rahmenprüfung für die LEO-Navigationsnachricht

# text
seg-aed568016867 = leo_navmsg::codec::crc24q: Generatorpolynom 0x1864CFB, Anfangswert { "0" }, keine Reflexion, kein abschließendes XOR, die Prüfung, die der LEO-Rahmen von Kshana über jedes vorangehende Byte trägt

# text
seg-18c79d18e4e4 = Der Prüfwert des CRC-Katalogs für diese Parameter (CRC-Katalog reveng.sourceforge.io, CRC-24/LTE-A: Breite { "24" }, Poly 0x864CFB, Init { "0" }, Prüfwert 0xCDE703), die die CRC-24Q-Parameter von RTCM { "10403" } und des Galileo OS SIS ICD sind, und der in RTCM { "10403" } gedruckte Beispielrahmen der Nachricht vom Typ { "1005" }

# text
seg-82b9b0f7b07c = Anpassung von LEO-Broadcast-Ephemeriden und Signal-in-Space-Entfernungsfehler gegen Anpassungsintervall und Aktualisierungsperiode

# text
# c1: leo-navmsg
seg-8c7065aa22bd = Anpassung und Vergleich der Art <c1/>: eine Wahrheitsbahn, mit zonaler J2-J6- oder EGM2008-Gravitation bis zum gewählten Grad und mit Luftwiderstand integriert, und eine freie oder gesteuerte Uhr mit festem Startwert; eine Levenberg-Marquardt-Anpassung des keplerschen Satzes von Galileo auf nichtsingulären Elementen mit schwachen Priors, dann Korrekturpolynome Along-Track, Cross-Track und radial durch lineare kleinste Quadrate; das Uhrenpolynom, angepasst abzüglich des relativistischen Terms des Nutzers; SISRE (nur Bahn und mit Uhr) über Nutzungsperioden, zentriert in ihren Anpassungsfenstern, gegen Anpassungsintervall und Aktualisierungsperiode. Validierter Teil: die keplersche Anpassung mit 16 Parametern und ihr SISRE nur der Bahn gegen das Anpassungsintervall auf realen präzisen Bahnen sowie die integrierte Wahrheitsbahn mit J2-J6/EGM2008({ "20" }, { "70" })/Luftwiderstand gegen Orekit { "12.2" } innerhalb von { "4.6" } mm über { "6" } h (Zielwert { "2" } cm, dieselbe Dichteeingabe); die Korrekturpolynome, die Uhrenanpassung (freie oder gesteuerte Uhr mit festem Startwert) und der Vergleich der Aktualisierungsperioden bleiben modelliert

# text
seg-8121e7db3db3 = Aktualisierung der LEO-Navigationsnachricht mitten im Überflug mit einer Kontinuitätsprüfung beim Wechsel

# text
# c1: leo-navmsg
seg-34c310d85c42 = Die Analyse midpass-update der Art <c1/>: der höchste Überflug über einen Nutzer innerhalb einer Suchspanne, Nachrichten nach einem globalen Zeitplan mit Nutzungsperioden, zentriert in ihren Anpassungsfenstern, und bei jedem Wechsel der 3D-Positionssprung, der Uhrensprung, der Pseudoentfernungssprung des Nutzers, der größte Sprung über jede sichtbare Sichtlinie (geschlossene Form über den Nadirkegel), der Entfernungsfehler davor und danach und PASS/FAIL gegen eine Schwelle

# text
seg-418f2cd21141 = Interne Konsistenz (die Sprungidentität und die Kegelschranke gegen Brute-Force-Abtastung). Die Schwelle ist eine Eingabe; keine veröffentlichte Kontinuitätsanforderung für LEO ist festgelegt

# text
seg-7635a8339e78 = Dokumentierte Binärkodierung der LEO-Navigationsnachricht mit einem Quantisierungsfehlerbudget

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: der eigene Rahmen von Kshana (Präambel, Version, Modell, Länge, Nutzlast, CRC-24Q) für die vier Ephemeridenmodelle, das Uhrenpolynom, SVID, Ausgabestand der Daten, Band, Gesundheitsstatus, einen Klobuchar-Satz, NeQuick-G-Koeffizienten und UTC-Parameter, jedes Feld mit angegebener Breite und Schrittweite (field_table), Quantisierung mit Ablehnung außerhalb des Bereichs und ein Budget der größten Positions- und Uhrenänderung, die eine Änderung um einen halben Schritt jedes Feldes über das Gültigkeitsfenster bewirkt

# text
seg-4261a9fac5d9 = Identitäten bei Hin- und Rückumwandlung und das Budget selbst. Das Format ist das eigene von Kshana, modelliert nach den veröffentlichten Nachrichtenkomponenten und dem Feldsatz der Galileo-ICD; es ist nicht das Bitlayout von Celeste oder eines anderen Systems (keines ist öffentlich), sodass es kein externes Layout gibt, gegen das sich validieren ließe

# text
seg-17ca41d7fd71 = Exporte von LEO-Navigationsnachrichten im Stil von RINEX 4 und als CSV

# text
seg-185e12ccef0d = leo_navmsg::text: ein Block im Stil von RINEX 4 (Kopfzeile des Datensatzes > EPH, Zeile für Satellit und Epoche mit drei Uhrentermen, Broadcast-Bahnzeilen im Format D19.12) mit dem Systembuchstaben L und den Datensatztypen KP16, KRAC, LU22 und APOL, in jedem Kopf als Erweiterung von Kshana gekennzeichnet, die nicht Teil von RINEX { "4.02" } ist, und eine CSV-Tabelle mit einem Standardspaltenschema und Voreinstellungsschemata, jeweils mit einem Importer

# text
seg-5cc5b6382437 = Hin- und Rückumwandlungen und die Kalenderarithmetik. RINEX { "4.02" } definiert keine LEO-Navigationsdatensätze (IGS RINEX { "4.02" }), daher ist das Layout eine dokumentierte Erweiterung, wobei arXiv { "2401.17767" } als Stand der Technik zitiert wird; es existiert kein externer Leser dafür, gegen den sich prüfen ließe

# text
seg-ff15935ba1b3 = LEO-Ephemeridenmodell mit 22 Parametern nach Liu et al. { "2025" } und seine Anpassung auf realen präzisen Bahnen

# text
seg-6af1b6f3bbd4 = die Variante Liu22 von leo_navmsg::elements::EphemerisModel, von kepler_point mit Liu22Extra ausgewertet: der Parametersatz mit 16 Parametern plus eine Rate der großen Halbachse a_dot und eine Rate der mittleren Bewegung n_dot, die als n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk eingeht, aus Gl. { "1" } des Artikels abgeschrieben (der Anpassungsvergleich hängt nicht von dieser Skalenkonvention ab, daher ist die Bedeutung eines übertragenen Wertes nDot hier nicht validiert), sowie einmal und dreimal pro Umlauf auftretende Radiusharmonische Crs1, Crc1, Crs3, Crc3 auf dem unkorrigierten Breitenargument. Seine Anpassung durch leo_navmsg::fit::fit_message übernimmt Start und Schätzer aus Abschnitt { "2.3" } des Artikels (jede Korrektur beginnt bei null; einfache kleinste Quadrate ohne Priors; die Obergrenze von 100 Iterationen des Artikels), hält aber nach der Parameterkonvergenzregel von Kshana an (jeder Schritt unter { "1e-3" } seines formalen Sigma) statt nach der Regel des Artikels einer RMS-Änderung unter { "0.1" } mm. Angepasst über Bögen von { "20" } und { "30" } Minuten einer tabellierten präzisen Bahn

# text
seg-e79047fc95af = ATOMIC-ECEF-Polynom ohne Uhr und der synthetische LEO-Modellvergleich mit fünf Höhen

# text
seg-e261843e35b1 = die Variante EcefPoly von leo_navmsg::elements::EphemerisModel: ein ECEF-Polynom je Achse ohne Uhrenterme, der relativistische Term aus -2 r.v/c^{ "2" }, bewertet gegen eine gesteuerte Uhr. Außerdem die Modellvergleichsanalyse (liu_comparison über LIU2025_TABLE), die das Modell mit 22 Parametern bei den fünf Höhen des Artikels über Bögen von 20 Minuten einer von Kshana integrierten Bahn anpasst und das Ergebnis neben dem veröffentlichten SISRE ausgibt

# text
seg-a3b92fdcc591 = ATOMIC-Modellfakten aus InsideGNSS (Polynom 6. Ordnung, etwa eine Minute Gültigkeit, { "30" } s Aktualisierung, Uhr gesteuert, { "24" } cm Uhrenfehler). Dies sind beschreibende Fakten ohne veröffentlichte Zahlen zum Vergleich. Die Tabelle mit fünf Höhen gibt das SISRE von Liu et al. { "2025" } ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } und { "0.75" } cm bei { "320" }, { "475" }, { "786" }, { "966" } und { "1336" } km über einen Bogen von 20 Minuten) neben der Anpassung von Kshana auf der eigenen integrierten Bahn aus ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } und { "0.51" } cm; Verhältnisse { "0.46" } bis { "0.77" }), nicht festgelegt, weil der Artikel reale präzise Bahnen angepasst hat und die Wahrheiten sich unterscheiden. Das Modell mit 22 Parametern und seine Anpassung selbst sind in der Zeile LEO-Ephemeridenmodell mit 22 Parametern nach Liu et al. { "2025" } und seine Anpassung auf realen präzisen Bahnen gegen reale Bahnen validiert. { "0.30" } Revision: Die Tabellenwerte verschoben sich mit der Anpassung nach der Konvention des Artikels (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = Einfrequenz-Ionosphären- und UTC-Dienste einer LEO-Navigationsnachricht

# text
seg-bc73bfeca68e = leo_navmsg::services: die Klobuchar-Verzögerung der Nachricht bei jedem Träger (das L1-Modell der Engine, skaliert mit (f_L1/f)^{ "2" }), das effektive Ionisationsniveau von NeQuick-G Az = ai0 + ai1 mu + ai2 mu^{ "2" } mit den Regeln für alle Nullen und [{ "0" }, { "400" }] sfu sowie die Systemzeit zu UTC mit den drei Schaltsekundenfällen der ICD

# text
seg-0af8030f4d21 = Doppler, den ein Bodenempfänger von einem LEO-Navigationssatelliten bewältigen muss

# text
# c1: leo-pvt
seg-9714103964d6 = Exakte Entfernungsänderungsrate eines Satelliten, dessen erdfeste Position und Geschwindigkeit aus einer Zweikörperbahn mit der säkularen J2-Drift und der Erdrotation stammen (leo_fusion::geom::EarthOrbit::state, die Geschwindigkeit die exakte Zeitableitung der Position), bei einem Träger in Doppler umgerechnet; der größte absolute Doppler, die größte Doppler-Rate und der größte Ruck über einer Elevationsmaske über ein Fenster (leo_fusion::doppler::doppler_envelope), je LEO-System von der Art <c1/> im Modus doppler berichtet

# text
seg-ebf6cee8ec4c = Veröffentlichte Zahlen, aus der angegebenen Bahn und dem Träger reproduziert: Iridium-Doppler bis zu plus oder minus { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) und Xona Pulsar X1 maximaler Doppler { "32" } bis { "34" } kHz (Leclère, Marathe und Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Die Zahl für Iridium ist eine gerundete obere Schranke, daher der Zielwert von { "5" }%. Die Doppler-Rate und der Ruck werden berichtet, aber nicht validiert: Der modellierte Ruck des Überflugs direkt darüber bei Pulsar X1 beträgt etwa { "1.0" } Hz/s^{ "2" } gegen die veröffentlichten { "1.26" }

# text
seg-d2e18c8bdc14 = Positionierung aus LEO-Doppler, mit einem und mit mehreren Satelliten, mit Zuständen für Uhrendrift und Geschwindigkeit

# text
# c1: leo-pvt
seg-de6cb3c06490 = Batch-Gauß-Newton-Positionierung aus der Entfernungsänderungsrate mit analytischen Partialen (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), wahlweise mit konstanter Nutzergeschwindigkeit, einer Höhen-Pseudomessung für einen Nutzer an der Oberfläche und gedämpften Schritten; die formale Kovarianz an der Wahrheit; Projektionen Along-Track, Cross-Track und vertikal; die Genauigkeit eines einzelnen Überflugs gegen den Cross-Track-Versatz des Nutzers; der Zeitpunkt der größten Annäherung. Der Modus doppler der Art <c1/> fügt den Fehler gegen die Fensterlänge und einen Modus nur mit Doppler für Gelegenheitssignale hinzu (die Voreinstellung starlink-sop)

# text
seg-84e2eb636579 = Interne Konsistenz: rauschfreie Wiedergewinnung, die kinematische Identität rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho numerisch differenziert, Doppler null bei größter Annäherung, die Spiegellösung eines einzelnen Überflugs und Fehler mit festem Startwert gegen die formale Kovarianz. Die Starlink-Zahl von Kozhaya, Saroufim und Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: etwa { "2" } m in { "20" } s mit drei Satelliten) ist nur ein Vergleich: Der modellierte Empfänger mit einer perfekten Ephemeride und jedem Fehler in einem Doppler-Sigma von { "30" } Hz ist über dasselbe Fenster um ein Mehrfaches ungenauer, und der Empfänger und die Messrate des Artikels werden nicht reproduziert

# text
seg-7f462969d2d4 = Gemeinsame GNSS- und LEO-Pseudoentfernungs-Positionierung mit Intersystem-Biases und Fehlermodellen je Signal

# text
# c1: leo-pvt
seg-b9b5298e3408 = Gauß-Newton-Lösungen mit gewichteten kleinsten Quadraten über jede Mischung von Systemen, eine Empfängeruhr je System (der Intersystem-Bias wird mit der Position geschätzt) oder ein bekannter Broadcast-Offset auf der Referenzzeitskala; Sigmas je Messung vom Aufrufer geliefert, standardmäßig das thermische Rauschen der Delay-Lock-Loop der Engine (navsignal::dll_code_jitter_chips) beim C/N0 der Elevation, kombiniert mit dem Signal-in-Space-Entfernungsfehler; ungewichtetes DOP (GDOP, PDOP, HDOP, VDOP, TDOP) im lokalen geodätischen System, formale Ost-Nord-Auf-Sigmas und die Bias-Sigmas; der gemeinsame Modus der Art <c1/> vergleicht Lösungen nur mit GNSS, nur mit LEO und fusionierte und durchläuft das DOP gegen die Zahl der hinzugefügten LEO-Satelliten

# text
seg-ee9a4a0cb530 = Konvergenz der präzisen Punktbestimmung nur mit GNSS und mit LEO-Ergänzung

# text
# c1: leo-ppp
seg-a54f36c27d90 = Ein erweitertes Kalman-Filter für Float-PPP auf ionosphärenfreiem Code und ionosphärenfreier Phase: statische Koordinaten, eine weiße Empfängeruhr, ein Intersystem-Bias je zusätzlichem System, eine feuchte Zenitverzögerung als Zufallsmarsch, abgebildet durch 1/sin(Elevation), eine Float-Mehrdeutigkeit je Satellitenbogen, bei Aufgang hinzugefügt und bei Untergang fallengelassen, und der präzise Bahn- und Uhrenfehler, der Code und Phase eines Satelliten gemeinsam ist, verarbeitet als eine korrelierte Aktualisierung mit zwei Zeilen in einer Form nach Joseph; Messungen aus demselben Modell simuliert; Konvergenzzeit (Fehler unter den Schwellen bis zum Ende des Laufs), Fehlerkurven und die über den Lauf gemittelte Positions-NEES für nur GNSS und jeden LEO-Fall, ausgeführt als die Art <c1/>

# text
seg-be4593802ccf = Der NEES-Chi-Quadrat-Test ist eine interne Konsistenzprüfung (Wahrheit und Filter teilen das Modell). Der Trend wird mit Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2 verglichen: Multi-GNSS { "9.6" } min verkürzt auf { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten. Das mitgelieferte Szenario ergibt { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } und { "2.3" } min mit seinen eigenen repräsentativen Schalen von { "1000" } km, { "60" } deg, Rauschen und Stationen; die Konstellationen, das Rauschen und die Konvergenzdefinition des Artikels werden nicht reproduziert, daher ist dies eine MODELLED Konsistenz des Trends (monotone Verkürzung, die größte Konstellation unter einem Drittel der Zeit nur mit GNSS), keine Validierung

# text
seg-8ef013b46d0f = Positionsgenauigkeit des 5G-Non-Terrestrial-Network aus der Signalbandbreite

# text
# c1: ntn-positioning
seg-12b1e4657370 = Die Cramér-Rao-Schranke für die Ankunftszeit aus der quadratisch gemittelten (Gabor-)Bandbreite, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), für ein flaches OFDM-Spektrum (beta = B/sqrt({ "12" })), ein bandbegrenztes BPSK-Spektrum (Zähler in geschlossener Form) oder ein beliebiges Spektrum durch Quadratur, und für die Frequenz eines komplexen Tons, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); Lösungen aus der Ankunftszeit im Downlink mit unbekannter Empfängeruhr und eine Doppler-Lösung mit einem einzelnen Satelliten über einen Überflug im S-Band n256 des 3GPP MSS, ausgeführt als die Art <c1/>

# text
seg-9306f1c06081 = LEO-gestützte Zeitübertragung zu UTC gegen C/N0 und den Empfängeroszillator

# text
# c1: leo-pvt
seg-c618feb01476 = Uhrenmessungen von jedem sichtbaren LEO-Satelliten an einer bekannten Position, aus dem Pseudoentfernungs-Rauschmodell mit inverser Varianz kombiniert, gefiltert durch ein Kalman-Filter mit zwei Zuständen (Phase, Frequenz), dessen Prozessrauschen das weiße und das Random-Walk-Frequenzrauschen der Oszillatorklasse ist (slot_timing::ClockNoise, clock_state::ClockClass; die Auslaufvarianz von holdover::coast_phase_variance), eine Wahrheitsuhr mit festem Startwert aus denselben Pegeln, und der Ausdruck für Systemzeit zu UTC aus Abschnitt { "20.3.3.5.2.4" } von IS-GPS-200, mit einer Unsicherheit des Broadcast-Offsets, die als Bias je Lauf hinzugefügt wird; der Modus timing der Art <c1/> durchläuft Oszillatoren und C/N0-Offsets

# text
seg-4a878bd4a90f = Interne Konsistenz: der veröffentlichte Offset-Ausdruck von Hand ausgewertet, der normierte Fehler über { "40" } Startwerte und die durch die Offset-Unsicherheit gesetzte Untergrenze. Die Zahl des NIST für Iridium-Zeitgebungsempfänger mit einer Miniatur-Atomuhr (unter { "40" } ns von UTC(NIST) über { "40" } Tage) ist nur ein Vergleich; das mitgelieferte Iridium-Szenario ergibt { "10" } bis { "11" } ns RMS bei Nennleistung mit seinem repräsentativen Entfernungsfehler von { "5" } m. Flicker-Frequenzrauschen und ionosphärische Verzögerung werden nicht simuliert

# text
seg-cef79d82f0d4 = LEO-Abdeckung und Verdünnung der Genauigkeit für polare und arktische Nutzer gegen MEO-GNSS

# text
# c1: leo-pvt
seg-462a5e95d480 = Sichtbare Satelliten und Median von PDOP, HDOP und VDOP mit Verfügbarkeit gegen die Breite, über abgetastete Längen und Epochen, für die MEO-GNSS-Systeme allein, die LEO-Systeme allein und alle zusammen, jedes System mit eigener Maske und eigenem Uhrenmodell, ausgeführt als der Polarmodus der Art <c1/>; die Bahnen sind SGP4/SDP4-Elementsätze zur Epoche des Durchlaufs (2026-01-01T00:{ "00" }:{ "00" } UTC im Polarmodus), auf dem validierten Erdbahnpfad ins erdfeste System überführt (IAU 2006/2000A, UT1 = UTC, keine Polbewegung)

# text
seg-d92777401093 = Benannte LEO-PNT-Systeme als optionale Datenvoreinstellungen, jeweils mit ihrer Quelle

# text
seg-5130bfe2410c = Systemunabhängige Eingaben: Jedes System besteht aus Walker-Schalen, expliziten Elementen oder einer GNSS-Voreinstellung, einem Signal (Träger, Chiprate, Bandbreite, empfangene Leistung oder C/N0-Bereich), einem SISRE, einem Doppler-Sigma und einem Uhrenmodell; Voreinstellungen füllen nur aus, was ein Szenario offenlässt, je eine Datei mit Quellen, gekennzeichnet als PUBLIC (mit URL), WORKSHOP oder DERIVED, und die unveröffentlichten Werte sind als repräsentativ aufgeführt: Xona Pulsar X1/X5, Iridium STL, Starlink-Gelegenheitssignale, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Ephemeridenmodell ohne Uhr und eine aus einem Workshop abgeleitete Voreinstellung in der optionalen Voreinstellungsdatei Celeste IOD, die durch Löschen dieser Datei und ihrer Szenarien zurückgehalten wird

# text
seg-c6f71b3937cd = Abschrift der zitierten öffentlichen Werte, auf Struktur geprüft (jede öffentliche Quelle hat eine URL, Walker-Muster teilen sich gleichmäßig, das C/N0 aus empfangener Leistung über kT bei { "290" } K), nicht gegen eine externe Referenz. Repräsentative Werte sind in jeder Voreinstellung benannt und illustrativ

# text
seg-dec52b5b9cd6 = Ein LEO-PNT-System von Anfang bis Ende: Signaldesign, Streckenbudget des Überflugs, Navigationsnachricht und fusionierte Positionierung, wobei die Ausgabe jeder Stufe an die nächste übergeben wird

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Die Art <c1/>: Ein Design von leo-signal (öffentliche Voreinstellung oder inline) legt Mitte, Bandbreite, Chiprate und EIRP-Aufteilung eines Bandes von leo-pass fest; der Überflug liefert je Epoche das C/N0 der verfolgten Komponente und den bandbegrenzten Code-Jitter; eine C/N0-Gerade nach kleinsten Quadraten in sin(Elevation), das SISRE der Nachricht von leo-navmsg (an der Bahn des Überflugsatelliten angepasst, plus ein angegebener Term der Bahnbestimmung als Wurzel der Quadratsumme) und der Träger und die Chiprate des Designs gehen an jedes LEO-System einer gemeinsamen Lösung von leo-pvt und optional an die LEO-Fälle von leo-ppp; jede Übergabe wird mit ihrem Wert und ihrer Einheit berichtet

# text
seg-854d3c1428d0 = Selbstkonsistenz der Übergaben: Jeder weitergereichte Wert entspricht der eigenen Ausgabe der vorgelagerten Stufe, und die Mutation einer vorgelagerten Eingabe verschiebt jede nachgelagerte Zahl, die von ihr abhängt. Die Stufen behalten ihre eigenen Kennzeichnungen; die Kette fügt keine Physik und keine externe Referenz hinzu

# text
seg-55ca63edff02 = Erkennung von Spoofing durch LEO-Doppler und Konsistenz der Überflug-Geometrie

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = Der Abschnitt <c2/> der Art <c1/>: Ein Spoofer fälscht, in Entfernung und Entfernungsänderungsrate selbstkonsistent, die Signale, die an einer behaupteten Position gesehen werden, die nach einem Beginn springt und/oder von der wahren weggeschoben wird (je LEO-Band und für das MEO-GNSS-Signal); der Empfänger sagt jede Entfernungsänderungsrate aus der Broadcast-Bahn und einer unabhängigen Vorabposition und -geschwindigkeit voraus und prüft die gemessenen Entfernungsänderungsraten mit einer verallgemeinerten Chi-Quadrat-Statistik nach kleinsten Quadraten über ein Fenster von Epochen (Uhrendrift als Störgröße oder mit einem Prior), auf den GNSS-Kanälen, den LEO-Kanälen und allen Kanälen, mit thermischem Rauschen der Frequency-Lock-Loop aus C/N0 (Kaplan & Hegarty { "2006" }, Abschnitt { "5.6.2" }); Detektionswahrscheinlichkeit aus dem nichtzentralen Chi-Quadrat-Gesetz bei einer angegebenen Fehlalarmwahrscheinlichkeit, Detektion bei einer angegebenen Wahrscheinlichkeit der Fehldetektion erklärt

# text
seg-787c07c08c7f = Geschlossene Formen und Identitäten, keine externe Messung: der Gradient der Entfernungsänderungsrate gegen eine zentrale Differenz, die Statistik in Informationsform gegen die dichte Kovarianzform, eine reine Uhrendrift, die null ergibt, eine durch den Prior erklärte Verschiebung, die höchstens |dx|^2/sigma_p^{ "2" } ergibt, die Statistik quadratisch in einem Sprung. Keine Detektionszahl wird mit einem gemessenen Angriff verglichen; der Spoofer ist idealisiert (keine Signatur aus Leistung, Einfallswinkel oder Korrelationsspitze)

# text
seg-5f341f85ac07 = Erkennung von Spoofing durch Konsistenz zwischen den Bändern eines LEO-Mehrbandsignals

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Für jeden LEO-Satelliten und jedes Paar von Entfernungsmessbändern bildet der Abschnitt <c1/> die geometriefreie Pseudoentfernungskombination, entfernt das ionosphärische Modell des Empfängers und prüft ihren Schritt von Epoche zu Epoche gegen das Coderauschen der beiden Bänder und eine angegebene tolerierte nicht modellierte ionosphärische Rate (zweiseitig gaußsch, exakte Detektionswahrscheinlichkeit); ein Spoofer, der manche Bänder fälscht und andere nicht, oder jedes Band ohne die Ionosphäre, wird bei seinem Beginn gesehen; einer, der jedes Band fälscht und die Ionosphäre simuliert, nicht, was das Ergebnis angibt

# text
seg-87fd44fa1d94 = Identitäten: Der Beginnsprung eines ionosphärenfreien Spoofers entspricht der modellierten ionosphärischen Verzögerungsdifferenz des Paares, die Schwelle ist das zweiseitige Normalquantil mal die Standardabweichung des Schritts plus die Ratenschranke. Das ionosphärische Modell des Empfängers ist das der Engine, daher ist das authentische Residuum im Mittel per Konstruktion null; keine externe Referenz

# text
seg-97dbcd5f2728 = Ionosphärensondierung: Schräg-TEC aus der Zweibandverzögerung eines LEO-Überflugs

# text
# c1: leo-pass
seg-844de34fd2f3 = Für jedes Bandpaar eines Satelliten der Art <c1/> gibt der Bericht den Schräg-Gesamtelektronengehalt an, den die geometriefreie Codekombination am Überflugmaximum zurückgewinnt, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), und sein 1-sigma aus dem thermischen Coderauschen der beiden Bänder, sodass jedes LEO-PNT-Design mit mehreren Bändern als Ionosphärensonde abgewogen werden kann

# text
seg-0a63a69e181d = Kovarianz des Mond-Bezugsdatums mit geschätzten Stationen, gegen erweiterte Genauigkeit mit 50 Stellen

# text
seg-de2ee45f6527 = Die Kovarianz des Helmert-Datums mit sieben Parametern des Szenarios lunar-frame-campaign mit geschätzten Erdstationen (Station { "1" } verankert), wie lunar_frame_campaign sie in binary64 berechnet: die gemeinsame Fisher-Information aus Stationen und Baken, aus der Verzögerungs-Jacobi-Matrix akkumuliert, der Stationsblock durch ein Schur-Komplement über eine spektrale Jacobi-Inverse marginalisiert, H = AᵀSA mit dem Helmert-Entwurf gebildet und spektral invertiert. Das Problem ist per Konstruktion schlecht konditioniert (Helmert-Konditionszahl { "2.1e8" } bis { "2.3e8" }, Konditionszahl der gemeinsamen Information { "1.6e12" } bis { "3.0e13" }): Eine relative Änderung von { "1e-9" } im Schur-Term verschiebt die Datums-Sigmas um bis zu { "28" } %. Berichtet: die sieben Datums-Sigmas, die Helmert-Konditionszahl und die schwächste Richtung. AUSSAGE, EINGEENGT: Die Datums-Sigmas und die Konditionszahl der Engine liegen innerhalb der a-priori-Schranke für den schlimmsten Fall einer rückwärtsstabilen Pipeline mit doppelter Genauigkeit bei diesem Problem; dies behauptet nicht, dass sie so genau sind, wie doppelte Genauigkeit es erlaubt (ein Faktorisierungsweg ist bei denselben Eingaben etwa tausendmal genauer und der optionale Quadratwurzel-Löser etwa zehn Millionen Mal), und die schwächste Richtung ist nur dort validiert, wo ihr Zielwert unter einem rechten Winkel liegt (die Kontrolle mit festen Stationen)

# text
seg-71b463388e80 = Datumslöser mit Quadratwurzel-Information gegen erweiterte Genauigkeit mit 50 Stellen

# text
seg-5ec3e3c2bf19 = Ein optionaler Quadratwurzel-Informationslöser (lunar-frame-campaign solver = "srif"; Voreinstellung unverändert), der für das Datum nie eine Informationsmatrix bildet oder invertiert: Householder-QR (orthogonal-dreieckige Zerlegung) der gewichteten Verzögerungs-Jacobi-Matrix als Messaktualisierung eines Square-Root-Information-Filters, die Erdstationen marginalisiert über den nachlaufenden Dreiecksblock (dessen Gram-Produkt das Schur-Komplement ist), eine zweite QR von R_bb A für das Helmert-Datum mit sieben Parametern, Sigmas als Zeilennormen der Dreiecksinversen und das Spektrum (Konditionszahl, schwächste Richtung) aus einer einseitigen Jacobi-Singulärwertzerlegung. Innere Produkte werden mit einem fehlerfreien Produkt nach Dekker-Aufspaltung kompensiert, sodass jede Operation eine korrekt gerundete IEEE-754-Grundoperation oder Quadratwurzel ist; identische Ergebnisse auf jeder Plattform werden daraus begründet, nicht plattformübergreifend getestet

# text
seg-433b52bf0ba2 = Vertrauensmonitore für die Schifffahrt: die Arithmetik, auf der sie beruhen (NMEA-Dekodierung, geodätische Versätze, die kinematischen Statistiken und die Sensorresiduen-Statistiken)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Für ein Schiff dekodiert <c1/> die NMEA-{ "0183" }-Sätze, die ein Empfänger und seine Instrumente ausgeben (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), bildet den Ost-Nord-Versatz zwischen Lösungen (<c2/>) und daraus die Statistiken, auf die sich seine Monitore stützen: die implizierte Geschwindigkeit, das Koppelnavigations-Residuum, die implizierte Beschleunigung und die implizierte Drehrate über Fenster von { "30" } s, die Residuen Kurs gegen Fahrtrichtung, Logge gegen Grundgeschwindigkeit und Antennenhöhe (Mediane über { "10" } s) sowie die Streuung und den Anstieg des Signal-Rausch-Verhältnisses der Satelliten.

# text
seg-32fcf6956dac = WAS EXTERN GEPRÜFT WIRD, eng gefasst: ({ "1" }) die Dekodierung jedes Feldes, das die Monitore lesen, gegen pynmea2 { "1.19.0" } (MIT) auf { "8" } synthetischen Protokollen ({ "1,086" } Epochen), auf { "1e-9" } in der Einheit des Feldes (Breite und Länge, Höhe, Geoidabstand, HDOP, Geschwindigkeiten, Kurs, Steuerkurs, Signal-Rausch-Verhältnis; Ganzzahlen und Daten exakt; Tageszeit auf { "1e-6" } s), größte Differenzen auf dem Niveau der letzten Stelle eines double; ({ "2" }) der Ost-Nord-Versatz zwischen zwei Lösungen, als Entfernung und Peilung, gegen die WGS84-Geodäte von geographiclib { "2.1" } (MIT) auf { "223" } Lösungspaaren mit Basislinien bis zu { "2" } km, von -45 bis { "70" } Grad Breite und über den Antimeridian hinweg, auf { "0.01" } m und { "0.001" } Grad (die Peilung gegen das mittlere Azimut der Geodäte, die Richtung der Sehne); ({ "3" }) die Eingangsstatistiken der Monitore bei { "341" } bewerteten Epochen einer synthetischen Fahrt von { "400" } s mit einer Kurve und einem Positionssprung, gegen Python-Neuberechnungen, die geographiclib für Entfernung und Azimut, pynmea2 für die Dekodierung und numpy für Mediane und Standardabweichungen verwenden: implizierte Geschwindigkeit auf { "0.005" } m/s, Koppelnavigations-Residuum auf { "0.02" } m, Beschleunigung auf { "5e-4" } m/s^{ "2" }, Drehrate auf { "1e-3" } deg/s, die Residuenmediane und die Streuung und der Anstieg des Signal-Rausch-Verhältnisses auf { "1e-6" }. WAS NICHT: Die Fensterlängen, Toleranzen und Schwellen der Monitore sind eigene Regeln dieses Projekts; das Python reproduziert sie aus derselben Dokumentation, daher bestätigt die Übereinstimmung die Implementierung der Arithmetik, nicht die Regeln. Für den Satz THS gibt es keine Klasse in pynmea2, und der Satz ROT wird nicht gelesen; beides ist nicht abgedeckt. Die Tabelle von einem NMEA-Talker und einer Satellitennummer zu einer Satellitenkennung im Stil von RINEX ist eine eigene dieses Projekts (verglichen werden nur die Nummer, der Talker und der Wert). Für die Eingaben Zeitschritt, Host-Uhr und Authentifizierungsstatus gibt es keine Referenz. Alle Daten sind synthetischer Text aus receiver_trust::synth; nichts hier ist eine Messung, und es wird keine Aussage darüber gemacht, wie sich ein Monitor bei realer Störung verhält. Peilung: verglichen mit dem mittleren Azimut der Geodäte. Der vorregistrierte Vergleich mit dem Vorwärtsazimut an der Lösung { "1" } scheiterte bei { "0.001" } Grad ({ "77" } von { "223" } Paaren, schlechtester Wert { "8.3e-3" } Grad) aufgrund einer Definitionsabweichung, nicht der Arithmetik; die Änderung wurde nach dem ersten Lauf vorgenommen, und beide Ergebnisse sind festgehalten (der Vergleich mit dem Vorwärtsazimut bleibt im Test als beschreibende, nicht vorregistrierte Schranke von { "0.01" } Grad). Offengelegt: Die ersten Läufe fanden Eingaben, die zu wenig ausübten (Beschleunigung und Drehrate wurden bei jeder Epoche auf null begrenzt, und die Antimeridian-Spur überquerte ihn nie), einen Fehler im synthetischen Generator (kein Längenumbruch) und, für die Peilung, dass sich die registrierte Referenzgröße (das Vorwärtsazimut der Geodäte an der ersten Lösung) um etwa die Hälfte der Meridiankonvergenz von der Sehnenrichtung unterscheidet ({ "77" } von { "223" } Paaren außerhalb von { "0.001" } Grad, schlechtester Wert { "8.3e-3" }); die Eingaben wurden korrigiert und die Peilung bei gleicher Toleranz mit dem mittleren Azimut verglichen (Änderungen { "1" } bis { "3" } in der Vorregistrierung, nach Kenntnis der Ergebnisse vorgenommen und daher nicht blind); die Vergleiche von Kurs und Steuerkurs wurden zirkulär gemacht ({ "360" } und { "0" } Grad sind ein Kurs, Änderung { "5" }). Mutation: Eine Skalierung des Ostversatzes um { "1e-4" } lässt den Vergleich der Geodäsie scheitern.

# text
seg-1fdbb476c8ab = Vertrauenswert für die Schifffahrt: die Aggregation der Evidenz der Monitore zu einem Wert von 0-100 und seinen drei Bändern

# text
seg-0d76b33144f1 = Jeder Monitor reduziert seine Evidenz auf ein Verhältnis von Statistik zu Schwelle; der Wert ist { "100" } minus die Summe über die Monitore aus Gewicht mal einer begrenzten linearen Rampe des Verhältnisses ({ "0" } bis { "0.5" }, { "1" } bei { "1.5" }), begrenzt auf { "0" } bis { "100" } und gerundet auf { "0.1" }, mit Bändern bei { "90" } und { "55" }; jede Epoche listet die Monitore auf, die abgezogen haben, und ihre Punkte.

# text
seg-b2d3c6d6ac36 = Implementierung gegen Spezifikation, KEINE externe Referenz: Eine Neuimplementierung in Python ohne Kenntnis des Originals (scripts/maritime_score_cleanroom.py), geschrieben von einem Leser, dem nur docs/RECEIVER-TRUST.md und docs/MARITIME-TRUST.md und nicht der Rust-Quelltext vorlagen, stimmt mit score_from_ratios auf { "600" } Verhältnisvektoren überein (Wert, Band, Punkte und Reihenfolge der Abzüge, Differenz { "0" }), nachdem die Dokumentation dort vervollständigt wurde, wo der erste Leser sie stumm oder widersprüchlich fand (Reihenfolge bei Gleichstand, Rundung, das Verhältnis eines Monitors mit Bestanden oder Nichtbestanden, zwei Beispiele, deren Zahlen nicht zur Formel passten). Das zeigt, dass die Dokumentation ausreicht und der Code tut, was sie sagt. WAS NICHT GEPRÜFT WIRD, und warum die Zeile MODELLED bleibt: Die Regel selbst (die Gewichte, die Rampe, die Bandgrenzen, das Halten der Evidenz) ist eine eigene dieses Projekts, vorregistriert, aber ohne externe Quelle, und nichts hier zeigt, dass ein Wert von { "80" } oder { "40" } bei realer Störung das bedeutet, was ein Navigator sich wünschen würde; eine Zahl dieser Art wird nicht angegeben. Die Schwellen der Monitore sind ebenfalls eigene dieses Projekts (Zeile A prüft nur ihre Arithmetik).

# text
seg-f52fceaf06ca = Formprüfung der NMEA-{ "0183" }-Trainingsströme und dekodierte Werte

# text
seg-684f86418933 = Synthetische NMEA-{ "0183" }-Ströme für die Brücke zum Training der Besatzung (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW und die Marke PKSHT, erzeugt aus einer Wahrheitsspur mit modellierten Effekten von Empfänger, Himmel, Jamming und Spoofing. Nur Textausgabe; nichts wird gesendet.

# text
seg-4591ed75149c = WAS EXTERN GEPRÜFT WIRD, eng gefasst: Alle { "225,227" } Sätze von acht synthetischen Trainingsströmen (vier Bibliotheksszenarien, Startwerte { "1" } und { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW und die Marke PKSHT) werden in pynmea2 { "1.19.0" }, einem unabhängigen NMEA-Parser, mit gültiger Prüfsumme und dem erwarteten Talker und Typ geparst. Die von ihm dekodierten Werte für Position, Geschwindigkeit über Grund, Kurs über Grund, Steuerkurs, UTC-Zeit und Datum, Lösungsstatus und die GGA-Satellitenzahl entsprechen der Wahrheitsspur des Generators innerhalb von Toleranzen, die vor dem ersten Vergleich festgelegt wurden ({ "1.5e-6" } deg, { "0.06" } kn, { "0.07" } km/h, { "0.11" } deg Kurs, { "0.5" } deg Steuerkurs, { "0.02" } s), ausgeführt von scripts/gen_nmea_training_ref.py mit dem Fixture in tests/fixtures/nmea_training_ref/. Die Erwartung der GGA-Satellitenzahl wurde nach dem ersten Lauf auf die NMEA-Konvention korrigiert ({ "00" } ohne Lösung); numerische Toleranzen gegenüber dem Vorregistrierungs-Commit unverändert. WAS NICHT: dass irgendein Empfänger, Kartenplotter oder irgendein Brückensystem die Ströme akzeptiert; der Realismus der Modelle von Empfänger, Himmel, Jamming oder Spoofing (nomineller Himmel, modelliertes Rauschen, Drag- und Replay-Profile, alle MODELLED); HDOP, Höhe und der Inhalt von DOP und GSA/GSV über Syntax und Zahlen hinaus; das Instruktorprotokoll. Nichts wird gesendet, und es wird keine Anti-Jam- oder Anti-Spoof-Leistung beansprucht.

# text
seg-1be1cfcb95c8 = Störungskarte: Bedeutungen von Genauigkeitscodes, nicht verfügbare AIS-Werte, Zuordnung zu Rasterzellen, Routenlänge je Zellenzustand und Maskierung im Binnenland

# text
seg-71cff2a675e8 = Die Lesart der ADS-B-Codes für Navigationsgenauigkeit und Integrität, die die Karte verwendet (die EPU-Schranke, für die ein NACp-Code steht, die Schranke des Einschlussradius, für die ein NIC-Code steht, und die niedrigen und guten Klassen, die die Methode daraus ableitet); die nicht verfügbaren Werte für AIS-Position und -Geschwindigkeit, die der AIS-Leser verwirft; die feste Rasterzelle nach Breite und Länge, in die eine Position fällt; die Routenlänge und ihre Aufteilung nach Zellenzustand (degradiert, nicht degradiert, nicht bewertet, nicht beobachtet), die die Routenexposition berichtet; und ob eine Position um mehr als einen Puffer im Binnenland eines Landpolygons liegt. Eine als degradiert oder anomal gekennzeichnete Zelle ist eine Aussage über berichtete Genauigkeitsfelder oder unplausible Positionen, kein Befund einer Störung, und nichts hier prüft das.

# text
seg-beee15333c89 = WAS EXTERN GEPRÜFT WIRD, eng gefasst: Fünf unabhängige Implementierungen lesen dieselben synthetischen Eingaben. ({ "1" }) pyModeS { "2.21" } dekodiert synthetische DF17-Rahmen für Betriebsstatus und Luftposition; die NACp-EPU-Schranken von Kshana stimmen auf { "0.5" } m überein (größte Differenz { "0.4" } m), seine NIC-Einschlussschranken für die Codes { "5" } bis { "11" } stimmen auf { "1" } m überein, und seine niedrigen und guten Klassen ordnen alle { "12" } NACp-Codes und jeden NIC-Code, den die Referenz erzeugt ({ "0" } bis { "11" }), auf dieselbe Seite der Schwellen, die die Schranken der Referenz implizieren ({ "0" } Abweichungen). ({ "2" }) pyais { "3.3.0" } dekodiert AIVDM-Sätze vom Typ { "1" }, deren Nutzlastbits das Skript aus den rohen Feldwerten nach ITU-R M.1371 packt; Kshana lehnt genau die dekodierten nicht verfügbaren Positionen (Breite { "91" }, Länge { "181" }) und Geschwindigkeit ({ "102.3" } kn) ab und behält { "0" } bis { "102.2" } kn wie dekodiert ({ "0" } Abweichungen über { "94" } Rahmen). ({ "3" }) shapely { "2.2.0" } covers() auf Zellpolygonen stimmt mit grid::Grid::cell_of für { "1770" } Punkte über Zellgrößen von { "0.5" }, { "0.25" }, { "1" } und { "0.07" } Grad überein, einschließlich Punkten nahe der Kante, beider Pole und des Antimeridians ({ "0" } Abweichungen). ({ "4" }) Die Schnittmenge aus Route und Zelle mit shapely { "2.2.0" } und geodätischen Längen von GeographicLib { "2.1" } WGS84 stimmt mit der Routenexposition auf { "8" } synthetischen Routen überein, darunter zwei, die den Antimeridian überqueren: Gesamtlänge auf { "0.6" }% (größte Differenz { "0.49" }%, Kugel gegen Ellipsoid) und die Länge jedes Zellenzustands auf { "0.6" }% plus { "125" } m je Stück (größte { "21" }% dieser Toleranz). ({ "5" }) shapely { "2.2.0" } contains() mit dem azimutalen äquidistanten Abstand von pyproj zur Küstenlinie stimmt mit der Binnenland-Maske von { "2000" } m auf { "992" } Gittermittelpunkten um vier synthetische Inseln überein, eine davon mit einem See ({ "0" } Abweichungen; { "4" } Punkte innerhalb von { "20" } m des Puffers wurden ausgeschlossen und gezählt). Die Toleranzen wurden in tests/fixtures/interference_map_ref/PREREGISTRATION.md vor jedem Vergleich festgelegt und danach nicht geändert; zwei Defekte der synthetischen Eingaben, die der erste Lauf fand, sind dort festgehalten. WAS NICHT: Kshana dekodiert keine rohen Mode-S-Rahmen oder AIVDM-Sätze, daher validiert dies seine Lesart bereits dekodierter Werte, keinen Dekoder. Die NIC-Einschlussradien der Referenz für die Codes { "1" }, { "2" } und { "4" } weichen von DO-260B ab ({ "20" }, { "8" } und { "2" } NM), daher werden nur die Codes { "5" } bis { "11" } numerisch verglichen. Die Positionsregel ({ "0" }, { "0" }), die Höhenuntergrenze, der Filter nach Quellentyp, das Hashing der Kennungen, die Schwellen und Statistiken der Methode und die Wahl der Zellgröße sind eigene von Kshana und werden gegen nichts geprüft. Der Routenvergleich verwendet auf beiden Seiten dieselbe Pfaddefinition geradlinig in Breite und Länge, prüft also Längen und Zellzuordnung, nicht, dass dieser Pfad der richtige für ein Schiff oder Luftfahrzeug ist. Nichts hier zeigt, dass eine gekennzeichnete Zelle eine Störung ist. Die Eingaben sind synthetisch; die Fixtures der Referenz werden von scripts/gen_interference_map_ref.py geschrieben (pyModeS steht unter GPL-3.0 und wird nur in diesem Offline-Skript verwendet; CI braucht kein Python).

# text
seg-57ace69bdf1a = Wire-Formate der Vertrauens-Telemetrie: Prometheus-Textexposition und OpenTelemetry OTLP/HTTP JSON

# text
seg-654126a9d073 = GNSS-Vertrauen (Wert, Band, Gründe, Gate und auf Anforderung die Position) als Prometheus-Textexposition, bereitgestellt unter /metrics, und als OTLP/HTTP-JSON-Metriken, mit einer Obergrenze für die Kardinalität der Grundlabels.

# text
seg-b037c999443b = SIEM-Ereignisse der Vertrauens-Telemetrie: Common Event Format (CEF) über Syslog

# text
seg-ffd8d7062055 = Ereignisse bei Bandwechsel (oder je Epoche) als Common-Event-Format-Nutzlasten in einem RFC-{ "5424" }-Umschlag über UDP oder TCP, mit dokumentierter Feldzuordnung und CEF-Maskierung.

# text
seg-51640405c9b7 = SIEM-Ereignisse der Vertrauens-Telemetrie: Log Event Extended Format (LEEF) über Syslog

# text
seg-1b3245506847 = Ereignisse bei Bandwechsel (oder je Epoche) als Nutzlasten im Log Event Extended Format { "2.0" } in einem RFC-{ "5424" }-Umschlag über UDP oder TCP, mit dokumentierter Feldzuordnung.

# text
seg-563ccb0adbe5 = WAS GEPRÜFT WIRD: die eigenen Tests dieser Crate auf exakte Zeichenketten der dokumentierten LEEF-Feldzuordnung und die Felder des RFC-{ "5424" }-Umschlags; es existiert kein gepflegter Open-Source-LEEF-Parser (eine Suche im Python-Paketindex fand keinen), daher wird das Format gegen seine eigene Spezifikation geprüft, die vom selben Autor gelesen wurde, nicht gegen eine externe Referenz. WAS NICHT: ob die LEEF-Nutzlasten von dem Parser oder SIEM irgendeines Herstellers akzeptiert werden; die Maskierungsregeln über die dokumentierten hinaus; das Verhalten eines realen Syslog-Collectors.

# text
seg-96a95b89faa5 = Integrität des Nachweispakets: Signatur, Hash-Kette und Verifikationsverfahren

# text
seg-943a853d8a4a = Ein signiertes, per Hash verkettetes Nachweispaket eines GNSS-Vertrauensereignisses: SHA-256 über jede Datei und eine Kette über das Manifest, eine Ed25519-Signatur über die exakten Manifest-Bytes und ein Verifizierer, der jeden Fehler benennt (eine geänderte, entfernte, umbenannte, vertauschte oder hinzugefügte Datei, ein umgeordnetes oder bearbeitetes Manifest, ein ohne den Schlüssel neu gehashtes Manifest, ein neu signiertes Paket, ein falscher festgelegter Schlüssel und ein Zeitstempel-Token, das entfernt, ersetzt, Müll oder über ein anderes Dokument ist).

# text
seg-c15736afcbc9 = Signatur- und Kettenverifikation von RFC-{ "3161" }-Zeitstempel-Token

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token und optional <c1/> für die timestamp.tsr eines Pakets: eine RFC-{ "3161" }-TimeStampResp oder ein reines TimeStampToken (CMS SignedData über eine TSTInfo), offline gegen vertrauenswürdige Anker geprüft, so wie <c2/> es prüft: der Inhaltstyp der signierten Attribute und der Message Digest über die TSTInfo; die Signatur über die signierten Attribute (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 und P-384; öffentliche RSA-Operationen auf crypto-bigint); der ESS-Signing-Certificate-Hash v1 (SHA-1) oder v2, der das Signierzertifikat benennt, gefunden unter den nicht vertrauenswürdigen Zertifikaten des Tokens und des Aufrufers; die kritische, einzige erweiterte Schlüsselverwendung timeStamping des Signierers; die Kette zu einem vertrauenswürdigen selbst ausgestellten Anker mit der Signatur, dem CA-Status und der Schlüsselverwendung jedes Zertifikats, wobei jedes Zertifikat zur genTime des Tokens gültig ist; und der Message Imprint gegen die Daten. Nicht geprüft: Sperrung (CRL, OCSP), Namens- und Richtlinienbeschränkungen, die Nonce

# text
seg-c04042b0270a = Störungsschwellen des Empfänger-Vertrauens, kalibriert am JammerTest-Datensatz { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: die vorab registrierte Kalibrierung der Monitore für C/N0-Abfall, AGC und Jamming-Indikator am öffentlichen JammerTest-Datensatz { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, zur Laufzeit geladen, nie mitgeliefert): pro Ordner eine Zeitreihe von { "1" } s aus mon_rf.csv und rinex.csv, die Monitore laufen einmal, jede Epoche nach der Kalibrierung wird anhand des attack_log des Ordners als ungestört oder Jamming gekennzeichnet (von CEST nach UTC verschoben, Schutzzeit von { "60" } s), jede Schwelle wird über ein festes Raster durchgefahren, es wird die kleinste Schwelle gewählt, deren gepoolte Fehlalarmwahrscheinlichkeit bei ungestörten Epochen höchstens { "0.01" } beträgt, dazu Zählungen mit zurückgehaltenem Ordner (Leave-one-folder-out) und eine Gegenprüfung mit einem UBX-Leser. Die Auswahl wird nur als optionales Profil [monitors] profile = "jammertest-2024-calibrated" ausgeliefert (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); die Standardregel und jede Ausgabe ohne das Profil bleiben unverändert

# text
seg-33d506570c1b = srp_shadow::tests (die ringförmige geschlossene Form, das gleichmäßige Gesetz, das den konischen Schatten reproduziert, die Grenzfälle volle Sonne und Umbra)

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } Fälle x { "25" } stündliche Zustände über { "24" } h, LEO, GEO und HEO, dritter Körper und dritter Körper + SRP: schlechtestes |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; die Kontrolle mit analytischer Reihe verfehlt um { "9.96" } m; Sonne { "6.39" } m und Mond { "0.244" } m aus den DE440-Positionen von Orekit, ein festgehaltener Fehlschlag); Unit-Tests des Propagators (Ablehnung durch den Provider, über Klone geteilte Fallback-Zählung)

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (der S1-Term ist täglich, dreht sich in einem Vierteltag um { "90" } Grad und hat die Lastfaktor-Amplitude jeder Zeile; physikalische Größenordnung im LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit an { "8" } Punkten außerhalb der Achse: max. |da| { "2.2e-17" } m/s^{ "2" } bei N = { "70" }, läuft immer; { "3.5e-17" }, { "3.9e-17" } und { "7.3e-17" } m/s^{ "2" } bei N = { "200" }, { "360" }, { "2190" }, datengesteuert über KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs ({ "24" }-h-Bahn 200x200, datengesteuert: schlechtestes |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; Kontrolle für Grad 70 { "0.726" } m); Unit-Tests von gravity_sh (Übereinstimmung mit dem klassischen Evaluator auf { "1e-13" } bei Grad { "70" }, finite Differenz und Polkontinuität an einem Feld vom Grad 2190, ein unterlaufender Term vom Grad 2190 gegen eine Rechnung mit erweitertem Exponenten)

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } Szenarien: Entfernungsrate, Az/El und gemischt, LEO und MEO, rauschfrei und mit gesetztem Sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, Masken von { "5" } und { "10" } Grad, gegen Orekit { "12.2" }: Mengen sichtbarer Satelliten identisch; Messwerte innerhalb von { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM innerhalb von { "1.2e-14" } relativ; verrauschte Zustände innerhalb von { "1.74" } cm und { "1.14e-5" } m/s; Post-Fit-RMS je Art innerhalb von { "2.7e-4" } relativ; rauschfreies kshana gegen die Wahrheit { "1.06e-8" } m; rauschfreies kshana gegen Orekit { "1.464" } und { "1.740" } cm bei zwei Szenarien, ein festgehaltenes Verfehlen des Zielwerts von { "1" } cm); Unit-Tests von orbit_determination und batch_ls

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = Unit-Tests von src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (eingecheckte { "8" }-h-ESOC-Fixture, Sigma { "0.032" } m aus dem Kopfexponenten { "5" }: Tier-1-3D-RMS { "0.132" } m unverändert, Tier-2 { "0.035" } m gegenüber { "0.070" } m bei Sigma { "1" } m, wobei die Änderung aus der neu austarierten empirischen A-priori-Bedingung stammt); tests/agency_swarm.rs (das Swarm-Produkt trägt keine Genauigkeitscodes und fällt zurück, festgeschrieben)

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (CRC-24Q-Prüfwert 0xCDE703; Faltungs-Impulsantwort; Viterbi korrigiert eingespeiste Fehler; Layoutbreiten); tests/gnss_navmsg_roundtrip.rs (Feldstartbits entsprechen den ICD-Bitnummern; Kodieren -> FEC -> Interleaving -> Viterbi -> Dekodieren läuft innerhalb eines halben LSB im Kreis); tests/gnss_navmsg_galileo_brdc_grid.rs (IGS-BRDC-2018-133-Galileo-Datensätze auf dem LSB-Raster, schlechtestes { "3.6e-3" } LSB; vorregistrierter Zielwert für die Satellitenzahl verfehlt, { "15" } von { "20" }, FINDING)

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (rauschfreies Durchreichen; Varianz weißen Rauschens 1/(2N-1); Neustarts); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } Epochen, N = { "100" }: mittlerer 3D-Fehler { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (erste { "4" } Epochen der IGS-MGEX-RINEX-{ "4.00" }-Datei MAO000USA_R_20231980000_01D_30S_MO, { "58" } Satelliten, { "7" } Systeme: Kopfsätze und Werte der ersten Epoche entsprechen den veröffentlichten Literalen); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (synthetischer Kopf { "4.02" } aus der Spezifikation)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (echte Datensätze C01-C04: geostationärer Radius, Längen 140.02/80.04/110.55/159.99 Grad auf den veröffentlichten Slots, |Breite| { "2.13" } Grad mit der Neigung gegenüber { "6.65" } ohne; der vorregistrierte Vergleich Rundsendung gegen präzises SP3 ist datengesteuert über KSHANA_BDS_GEO_SP3 und wurde nicht ausgeführt); rinex::tests

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (Fahrt in Form einer 8: stationäres 3D-RMS { "0.025" } m Träger gegenüber { "0.470" } m Code bei identischen Messungen; { "12" } Seeds mittleres NIS/dof { "1.00" } und stationäres NEES/dof { "0.92" }; ein 1-Zyklus-Sprung wird in seiner Epoche ohne Fehlalarme erkannt, und die Lösung bleibt intakt; das Abschalten der Rundsende-Korrekturen erhöht den Codefehler von { "0.51" } m auf { "19.6" } m (Iono) und { "8.0" } m (Tropo); der rauschfreie Lauf konvergiert auf { "0.3" } mm)

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), Szenarien gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (jedes Paket: fusioniert unter dem freien INS über den Ausfall für beide Sensoren; Schiene: eng { "5.3" } m gegenüber lose { "12.9" } m in Navigationsqualität und { "15.6" } m gegenüber { "18.8" } m taktisch über den Ausfall, Verfügbarkeit { "0.97" } gegenüber { "0.95" }; eng-Tabelle validiert); tests/gnss_ins_legacy_trajectory_pin.rs (der lose gekoppelte Standard bitidentisch)

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (3D-Filter über { "60" } Seeds: mittleres NEES der zweiten Hälfte { "8.12" } für { "8" } Zustände, χ²-Summe der letzten Epoche innerhalb ihres { "95" }-%-Bandes; eine Uhrkorrektur von { "0.1" } ns senkt das 3D-Positions-Sigma von { "5.58" } m auf { "3.07" } m; Bias-Filter über { "60" } Seeds: χ²({ "5" })-Summe im Band, Bias innerhalb von { "3" } Sigma in { "59" } von { "60" }; fusion-pnt-coupled mit verzerrten Beschleunigungsmessern: Position p95 { "18.7" } m / { "90.0" } m und Integrität { "1.00" } / { "0.97" } gekoppelt gegenüber { "430" } m / { "4060" } m und { "0.006" } / { "0.000" } entkoppelt); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion und hybrid ohne [coupled] bitidentisch)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (koordinierte Kurve hat keine Seitenkraft und Lastfaktor 1/cos φ; CSV-Import reproduziert ein geflogenes Profil auf { "1e-3" } m/s und { "1" } m); tests/gnss_ins_trajectory_library.rs (jedes Profil läuft, und die Fusion schlägt das freie INS über den Ausfall; jedes fliegt seine benannte Bewegung; Beobachtbarkeit des Steuerkurses: Gier-Sigma nach { "240" } s { "1.27" } Grad bei Geradeausfahrt gegenüber { "0.039" } Grad bei der 8 und { "0.062" } Grad bei Stop-and-go); tests/gnss_ins_legacy_trajectory_pin.rs (Altergebnis und Wahrheits-Hashes bitidentisch)

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE März { "2023" }, { "4" } Perilunen und { "5" } Apolunen: Periode { "6.5004" } d gegenüber { "6.5699" } d ({ "1.07" } %, Zielwert { "3" } %), Apolun { "71 182" } gegenüber { "71 215" } km ({ "0.05" } %, Zielwert { "5" } %), Perilun { "3 385" } gegenüber { "3 245" } km ({ "4.1" } %, Zielwert { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: Auf der synthetischen Fjordpassage von scenarios/training/fjord-natural-degradation.toml werden dieselben { "624" } Epochen mit und ohne die angegebene [skyline] abgezogen; mit ihr wird sky-blocked in { "680" } Epochen gemeldet ({ "0" } ohne: Der Rückfall auf die Azimutlücke sieht in einem beidseitigen Fjord nichts), open_fraction ist { "0.758" }, und die Epochen der Klasse environment fallen von { "78" } auf { "33" }, der Rest sind Verluste von Satelliten, die die angegebene Skyline im Freien lässt; außerhalb des Ereignisses ändert die Skyline keinen Wert); receiver_trust::geometry::tests (von Hand abgeleitete Verhältnisse an den Schwellenwerten, die Schwellenwertgrenzen, die Rampe und Obergrenze, die Untergrenze, die Kennzeichnungsgrenzen, [geometry]-Überschreibungen, das DOP auf dem validierten Kernel, gehaltene und abgelaufene Himmel, unbekannt nicht geraten, Signalverlust, die Toleranz für schlechte Geometrie, Sentinel-Werte ohne Lösung); tests/geometry_trust.rs (ein mittlerer maskierter Himmel gekennzeichnet und nicht bewertet, ein schlechter maskierter Himmel, ein Verlust bei niedriger Elevation, ein Leistungsabfall, ein gefälschtes HDOP, totaler Signalverlust, ein Wegziehen bei schlechter Geometrie, unbekannte Geometrie, Sitzungs-Überschreibungen, das Live-Schema); tests/geometry_trust_no_change.rs (beide Beispielsitzungen byteidentisch mit { "0.35.0" }, sobald die angehängten Schlüssel entfernt sind); tests/geometry_corpus_identity.rs (jedes eingecheckte Schiffs-NMEA-Korpus, auch als GPS-only offener Himmel, und die Crew-Trainingsszenarien: byteidentisch mit { "0.35.0" } außer bei schlechten Epochen, die sich allein durch den Geometrie-Abzug unterscheiden)

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-4e6101547ab1 = Geometrie; Orbit (cofactor_from_los, dop_cov, dop); Oberfläche (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (der Ein-Uhr-Kernel gegen gnss_lib_py)

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (gegen die mehrstufige Kalman-Kovarianzrekursion; weißes FM exakt; Round-Trip); Coast-Varianz-Kernel extern validiert in tests/gnss_denied_clock_holdover_reference.rs (gegen scipy Van-Loan/brentq)

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-3016100a7015 = clock_state::tests (analytisches van-Loan-Q; NEES; Positivität der PSD); tests/clock_state_reference.rs (vollständige Predict+Update-Trajektorie — Zustand x und { "3" }×{ "3" }-Kovarianz P über { "1925" } Schritte / { "4" } Parametersätze gegen filterpy { "1.4.5" }; schlechtester |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (legt den Befund fest); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9, Runde { "3" })

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (reziproke Auslöschung; Sagnac-Identität in zwei Formen); tests/time_transfer_error_budgeting_reference.rs (Sagnac bei Umrundung am Äquator = { "207.386" } ns gegenüber dem veröffentlichten Ashby-Wert { "207.4" } ns bis auf <{ "0.05" } ns; zudem Sagnac-/geodist-Geometrie gegengeprüft mit RTKLIB { "2.4.3" } geodist(), aus C-Quelltext kompiliert)

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (BPSK-Eigen-SSC = 2/3R_c; PSD mit Flächeneinheit; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS-C/A-Gold-Kreuz-/Autokorrelation stimmt ganzzahlig exakt mit der unabhängigen Codeerzeugung nach IS-GPS-200 überein; PSD von BPSK-R({ "1" })/Sinus-BOC({ "1,1" }) gegen ein unabhängiges scipy-Periodogramm); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, festgelegt)

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Eingrenzung der Untergrenze nach Freier 2016); tests/quantum_inertial_sensor_reference.rs (Übertragungsfunktion |H(ω)|, k_eff·T² und Schrotrausch-ASD gegen veröffentlichte numerische Vektoren von Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, festgelegt; gradiometer_qpn_line_matches_janvier_model)

# text
seg-81802510f112 = quantum_imu::tests (a_max liegt an der Halbstreifenkante bei ±π mit der 1/T²-Bereichsskalierung; die Rückgewinnung der umgebrochenen Phase ist innerhalb von [−a_max,a_max] exakt und alias-behaftet um genau { "2" }·a_max außerhalb davon; der eindeutige Dynamikbereich a_max/σ_a=π/σ_Φ ist über zwei sehr unterschiedliche Skalenfaktoren für Wellenlänge/T identisch; die CaiAccelerometer-Methoden stimmen mit den freien Funktionen überein)

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (Bias gegen AccelModel-Integrator; VRW gegen analytisches Integral); tests/quantum_inertial_dead_reckoning_reference.rs (VRW gegen eine unabhängige numpy-Monte-Carlo-Doppelintegration von weißem Beschleunigungsrauschen, größte Abweichung { "0.42" } % innerhalb von ±{ "3" } % über { "6" } Coast-Zeiten; Bias/Skalenfaktor gegen einen Wert in geschlossener Form aus Groves { "2013" }; Holdover-Round-Trips)

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form und cw_q_equals_the_spectral_separation_closed_form: die Q-Tabelle, CW und Schmalband { "1" }, Breitband und Sweep { "2" }, festgelegt auf die geschlossenen Formen aus navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/effektives C-N₀ gegen eine unabhängige numpy-Neuherleitung des Linkbudgets nach Kaplan & Hegarty §{ "9.4" }; reales JammerTest-C/N₀ fällt monoton durch die Schwelle von { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (vorregistriert, blockiert, nicht ausgeführt)

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (TEXBAT-Parametercharakterisierung); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (legt den Befund fest); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (unabhängige Referenzen in geschlossener Form + CUSUM); examples/tpl_jammertest.rs (Kalibrierung des JammerTest { "2024" } mit realem Spoofing); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (legt den Befund fest); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB für Map-Matching; IGRF-14-Feld); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (der 60-Minuten-Benchmark ohne GPS auf dem realen EGM2008-Feld vom Grad 70, vorregistriert in xval/icgem-egm2008/: abgeglichen { "3106" } m, daher ist der Zielwert < { "500" } m NOT MET und als verfehlt festgehalten, und die zehnfache Verringerung der Drift von { "70.6" } km ist MET; zudem die gesetzte Monte-Carlo-Simulation des Kartenfehlers); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel und tests/emag2_real_grid.rs (datenabhängig freigegebener EMAG2v3-Leser auf einem realen Ausschnitt; darauf wird kein Navigationsergebnis behauptet); tests/terrain_slam_rbpf.rs (gemeinsame Kartenschätzung, ein RBPF im FastSLAM-Stil, gegen SITAN mit bekannter Karte bei einem korrelierten Kartenfehler von { "15" } m über { "20" } Seeds, vorregistriert in xval/terrain-slam-rbpf/: { "1.5" } % mittlerer Gewinn und besser in { "10" } von { "20" }, daher sind der Zielwert von { "10" } % und der Zielwert von 12 von 20 NOT MET und als verfehlt festgehalten; kein Schaden bei einer perfekten Karte, MET)

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (die erzeugte SBOM validiert ohne Fehler gegen das offizielle CycloneDX-{ "1.5" }-JSON-Schema über den gesamten ausgelieferten Graphen mit 66 Komponenten: Standard-, Python- und Wasm-Features, Entwicklungsabhängigkeiten ausgeschlossen)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfekt=1/identisch=0.5/Gleichstand={ "0.125" }, ROC monoton, fusioniert>{ "0.8" }, Schichttrennung je Klasse, Leckageschutz, reproduzierbarer Korpus, Verteilungsverschiebung markiert Optimismus); dominance_demonstrators (erreichbar + reproduzierbar + MODELLED-nicht-VALIDATED + Optimismuslücke selbstkonsistent)

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC der unabhängigen Referenz je Klasse≈{ "1" }, gelernte Optimismuslücke>{ "0" }, Rasterform + Bootstrap-KI schließt den Mittelwert ein + positiver Skalierungstrend, ID-Merkmale endlich, Lückenprädiktor schlägt „Mittelwert vorhersagen“ bei BEIDEN CV-Varianten Leave-one-detector-out und Leave-one-class-out + deterministisch); impairment_ml::tests (logreg trennt + deterministisch + Verlust↓, MLP löst XOR, was ein lineares Modell nicht kann + gesetzter Seed); eval_stats::tests (Bootstrap/DeLong/Spearman/Ridge gegen geschlossene Formen)

# text
seg-e0f68f57399d = quantum_trade::tests (Rückgewinnung der ADEV im Round-Trip, NNLS-Nichtnegativität, Hinweis zur Untergrenze vorhanden/fehlend, Nutzen>{ "1" }, monotone Hüllkurve + Grenze für alternatives PNT); dominance_demonstrators (gemessene ADEV ist datengetrieben, nicht als Untergrenze angenommen, angenommene Klasse markiert Untergrenze + Hinweis, fehlerhafte Kurve abgelehnt, MODELLED-nicht-VALIDATED)

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exakt an den Gitterpunkten + Round-Trip + monoton, Tagesmittel von Ap, exosphärische T gegen veröffentlichte Ankerwerte für Sonnenminimum/Mittel/Maximum + Sturmzuwachs, Dichte gleich eins an der Referenz, Sonnenzyklus-Hub im beobachteten Band von { "5" }–{ "10" }×, Szenario reproduzierbar + MODELLED-nicht-VALIDATED + Ablehnung außerhalb des Bereichs); dominance_demonstrators (erreichbar + reproduzierbar + physikalische T + MODELLED-nicht-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (Start genau nach Osten erreicht i=Breitengrad, KSC→ISS = { "45" }° wie im Lehrbuch, polar = N/S, i<lat unerreichbar, Äquatorbonus von { "465" } m/s, Ebenenwechsel von { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, Anzahl der täglichen Gelegenheiten, Szenario reproduzierbar/MODELLED + Dogleg-Pfad); dominance_demonstrators (erreichbar + reproduzierbar + KSC→ISS { "45" }° + MODELLED-nicht-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-c763ac7e3cda = reentry::tests (Spitzen-g unabhängig vom ballistischen Koeffizienten + physikalisches g-Band, wächst mit steilerem γ / schnellerem Eintritt, Geschwindigkeit bei Spitzen-g = V_e·e^(−1/2) und Spitzenheizung = V_e·e^(−1/6) schneller, Höhe bei Spitzen-g physikalisch + tiefer bei höherem B, Szenario reproduzierbar/MODELLED + degenerierte Geometrie abgelehnt); dominance_demonstrators (erreichbar + reproduzierbar + Anteil V_e·e^(−1/2) + MODELLED-nicht-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (nur Gegenprüfung); tests/reentry_point_mass_accelerometer_oracle.rs (blockiert, nicht ausgeführt)

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (von Hand hergeleitete Kosten je Abdeckung 48/96={ "0.5" }, ROI-Verhältnis { "2.667" }, Reihenfolge der Eingrenzung + Schutz bei null Abdeckung)

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (dieselbe verpasste Erkennung kippt von Available über MI zu HMI, wenn sich der Kontext verschärft; konservatives PL→Unavailable; HMI je Achse; Eingabeschutz)

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (physikalisches VRW liegt auf allen { "3" } Stufen innerhalb der zitierten VRW-Eingrenzung; roher Bereich der Streifenmehrdeutigkeit aus k_eff·T² berechnet; konservatives Budget driftet stärker als das beste; jede Eingrenzung hat eine Quelle + Bestätigungsmarkierung; Schutz der Reihenfolge der Eingrenzungen)

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (vier Regionen + inklusive Grenzen + |Fehler| + Nichtverfügbarkeit bei PL>AL); tests/tib_scorer_reference.rs (Klassifikationszahlen gegen unabhängiges numpy auf einem festen synthetischen Satz)

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (sauber/unterbegrenzt/ganz nicht verfügbar/leer); tests/tib_scorer_reference.rs (Zählungen + Raten + coverage_ok gegen numpy auf { "1e-12" })

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (Offsetprofile, monotones Coast, Markierung der nicht erkennbaren Menge, Konsistenz von max_offset, genau zwei nicht erkennbare Klassen)

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (Referenz-PL absorbiert; defektes PL nicht absorbiert, nie erkannt; Urteil zur erkennbaren Abdeckung; die Ehrlichkeitseigenschaft, dass für ein nicht erkennbares Szenario kein Abdeckungs- oder Erkennungsurteil erreichbar ist)

# text
seg-6d963d838eed = hybrid_integrity::tests (die aufgelöste Konfiguration wird für Vorgaben und für Überschreibungen zurückgegeben, ohne die Wellenlänge über Meter hin und zurück zu führen; jeder Eintrag zu Einheiten trägt sowohl eine Einheit als auch eine Herkunftsklasse; jedes vom Einheitenblock genannte Feld wird tatsächlich ausgegeben, sodass es kein Geisterfeld dokumentieren kann)

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (die Verfügbarkeit entspricht dem Produkt der beiden Indikatoren, neu berechnet aus den eigenen Margen des Berichts, und diese Margen werden ihrerseits aus der eigenen EIRP, dem Freiraumverlust, dem pauschalen Verlust, der Gütezahl, dem Boltzmann-Term, der Datenrate und der Anforderung des Berichts auf { "1e-9" } dB neu zusammengesetzt; der Wert wird als { "0" } oder { "1" } gemessen, während die optische Verfügbarkeit im selben Lauf als streng zwischen beiden liegend gemessen wird; jede Faktorzeile trägt eine Herkunftsklasse aus dem geschlossenen Vokabular field_schema; die berichtete Schließungsreichweite, erneut durch das Linkbudget geführt, liefert eine Marge von { "0" } bis { "1e-9" } dB und wird als unabhängig von der Reichweite des Laufs über vier Dekaden gemessen, während die Reichweitenauslastung sich genau um das Reichweitenverhältnis bewegt; eine Strecke mit -40 dBW meldet die Verfügbarkeit { "0" }, LOST, und eine Auslastung über { "1" } statt eines Bruchteils; der überholte Hinweis 'no RF-availability counterpart is computed by this engine' ist als entfernt zugesichert, und der Ersatz ist als das neue Feld nennend zugesichert; eine fehlerhafte HF-Eingabe wird abgelehnt statt begrenzt)

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (das Verhältnis entspricht den beiden ausgegebenen Zweigen, dividiert, auf { "1e-15" } relativ, und sein Kehrwert und seine Dezibelform stimmen überein; Reichweite und Zeit-Sigma jedes Zweigs hängen genau über c zusammen; die ausgegebene gemeinsame Konfiguration ist als gleich der eigenen Reichweite und Integrationszeit des Szenarios zugesichert, und die Reichweite des HF-Zweigs ist als gleich der des optischen Zweigs zugesichert; das C/N0 des HF-Zweigs ist bitgleich mit dem des Verfügbarkeitsblocks, aus einem Linkbudget, keine Neuherleitung; die Eigenschaft des GLEICHEN-MIT-GLEICHEM wird MEASURED statt zugesichert -- eine Vervierfachung der gemeinsamen Akkumulationszeit halbiert den optischen Zweig auf { "1e-12" } und den HF-Zweig auf { "1e-7" } und lässt das Verhältnis auf { "3.19e-9" } relativ unverändert, was ein Zweig, der heimlich über etwas anderes mittelt, nicht könnte; eine Überschreibung rf_dll_bandwidth_hz, die die gemeinsame Mittelungszeit bricht, macht das Verhältnis null mit einem Grund, der beide Zeiten nennt, während beide Zweige weiterhin ausgegeben werden; ein Lauf mit einfachem Weg macht den Vergleichszweig bitgleich mit der veröffentlichten Kernzahl mit einem Strafterm von genau { "1" }, und ein Lauf mit Hin- und Rückweg reproduziert den Strafterm 0.5/sqrt(geometrischer Verlust des Rückwegs), neu berechnet aus dem eigenen geometric_loss_db des Berichts auf { "1e-12" })

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (über drei Bänder, vier Dekaden der Reichweite und beide Schließungsurteile werden die Marge und der darunterliegende Freiraumverlust allein aus dem Bericht auf besser als { "1e-9" } dB neu berechnet; das aus den Gleichungstermen zusammengesetzte benötigte G/T stimmt mit derselben Größe überein, die als G/T minus Marge erreicht wird, und ein erneuter Lauf damit setzt die Marge auf null; drei Budgets mit sehr unterschiedlicher EIRP, sehr unterschiedlichem Verlust und Schwellwert, aber gleicher Streckenkonstante ergeben eine identische Anforderung, während { "1" } dB auf der Konstante sie genau um { "1" } dB verschieben; die Aufteilung des Gewinns fehlt, solange keine Rauschtemperatur angegeben ist, und eine nicht positive wird abgelehnt; jedes vom Einheitenblock genannte Feld wird tatsächlich ausgegeben)

# text
seg-d9742b5a3a48 = lunar_time_budget::tests und lunar_time_budget_scenario::tests (alle vier Klassen sind in einem Lauf und in der Reihenfolge einer angeforderten Teilmenge vorhanden; jede Zeile stimmt mit ihrer eigenen geschlossenen Form auf besser als { "1e-12" } relativ überein; das Skalieren des Rahmenfehlers um k skaliert den Kreuzungspunkt um k bei einer Uhr mit Flicker-FM und um k^{ "2" } bei einer mit weißem FM, geprüft bei k={ "2" } und k={ "3" }, was die beiden Rauschklassen trennt; jede Zeile reproduziert den Kreuzungspunkt der einzelnen Uhr, den das Budget bereits berichtet hat; jede Zeile gewinnt den einen gemeinsamen Rahmenterm zurück; ein unbekannter Uhrenname wird abgelehnt)

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests und attack_surface::tests (das Gitter ist vollständig, und jeder erfasste Anteil liegt in [{ "0,1" }]; der erfasste Anteil ist an jedem Knoten nicht fallend in der Sendeleistung; er ist bei Strahlbreite oder Höhe NICHT monoton, was durch einen eigenen Test festgelegt ist, damit der Sweep später nicht geglättet werden kann; der Basisknoten reproduziert den bestehenden erfassten Anteil bitgleich; die Auswertung nur am Rand ist bitidentisch mit dem letzten Punkt des vollständigen Sweeps; eine lokalisierte Kreuzung liegt auf { "1e-9" } dB auf der Schwelle und ist eingeklammert)

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (alle { "57" } Mittelungszeiten x { "8" } Terme vorhanden, der Gitterindex läuft { "0" }..={ "56" } und trägt je { "8" } Zeilen; die Zeile <c1/> entspricht der Wurzel der Quadratsumme der sieben Terme daneben bei jedem tau; die Tabelle folgt einem angeforderten Gitter statt einem fest eingetragenen; ihre Ausgabe lässt das Bericht-JSON byteidentisch)

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: Bei ausgeschalteter Steuerung ist der Uhrenterm für alle vier Klassen bitgleich mit dem Uhrenterm des Budgets; bisection_matches_the_closed_form innerhalb von { "1e-9" } relativ für beide Rauschklassen; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: Das Standarddokument, die Tabelle und die Zusammenfassung sind unverändert, und der Block fügt nur sein eigenes Objekt und seine Einheiten hinzu; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: optisch < PHM < RAFS < miniRAFS von { "1" } s bis { "7e5" } s, wobei sich die Kurven von PHM und RAFS zwischen { "7e5" } und { "8e5" } s kreuzen, festgelegt als offengelegte Eigenschaft der Uhrenmodelle mit einem einzigen Rauschtyp; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (Fernfeldgrenzfall stimmt mit delta_dor überein; Nahfeldkorrektur; FD-Partialableitungen); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } Bibliothekstests: der halbe Randwinkel der Erde gegen seine geschlossene Form asin(R/r) mit einer weiteren Zusicherung, dass JEDE nicht verdeckte Strecke außerhalb dieses Kegels liegt, sodass der Verdeckungstest und der Randwinkel nicht widersprechen können; das Verdeckungsprädikat geprüft auf der nahen Seite, der fernen Seite und dem Fall, dass der Körper HINTER dem Sender liegt; Pfadverlust auf jeder Strecke auf das plausible Band der Mondentfernung begrenzt; die verfolgbare Menge als Teilmenge der geometrisch sichtbaren Menge gezeigt und disjunkt zur verdeckten; Monotonie in beiden Richtungen - mehr Empfangsgewinn verringert die Anzahl nie, eine strengere Schwelle erhöht sie nie; keiner Strecke wird mehr als der Gewinn in Blickachse angerechnet; ein Empfänger innerhalb der Erde wird abgelehnt; der Sweep ist als tatsächlich mit der Epoche VARIIERENDER zugesichert; und die Verfügbarkeit von Signal gegenüber Fix ist als verschieden, richtig geordnet und konsistent mit den Zeilen je Epoche zugesichert); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (festgelegt); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (festgelegter Befund)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (Zielwert O1: Die über drei Tage und über eine Periode verkettete Zustandsübergangsmatrix entspricht scipy DOP853 auf relativ { "1e-6" }; Zielwert C1: mittleres q und der Anteil innerhalb von 95 %; Zielwert C2: Stichprobe über formaler Spur jedes Schätzers; Zielwert C3, NOT MET und festgelegt: Mit { "3e-10" } m/s2 nicht modellierter Beschleunigung beträgt die Überschreitung innerhalb von 95 % { "0.0525" }, nicht mindestens { "0.5" } - die Schätzung an Bord ist nur auf Hunderte Meter bekannt, daher verbirgt sich etwa zehn Meter Verschiebung in ihrer Kovarianz); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (Zielwert Q1: Monte-Carlo-Erfolg mindestens die Bootstrap-Schranke minus drei Standardfehler; Q2: kein Abfall mit der Bogenlänge über drei Standardfehler hinaus; Q4: LAMBDA entspricht der erschöpfenden Aufzählung für { "200" } Ziehungen mit Dimension bis fünf; Q3: Das Float-Design entspricht einer unabhängigen numpy-Lösung auf { "1e-9" } bei den Kovarianzen von Mehrdeutigkeit und Position, und die Bootstrap-Rate ist bei { "1e-9" } NOT MET, festgelegt: Sie weicht um relativ { "1.7e-6" } ab, weil die Normalverteilungsfunktion von LAMBDA eine Näherung nach Abramowitz und Stegun ist)

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (Zielwert F1: Die Spur der CRLB steigt nicht und der kleinste Eigenwert fällt nicht mit Orbiter-Strecken, im Beispiel und in { "20" } gesetzten Zufallsmengen; Zielwert F2: Die Bereichs-Partialableitungen entsprechen einer unabhängigen numpy-longdouble-Finite-Differenz des Rodrigues-Vorwärtsmodells auf { "50" } Geometrien; Zielwert F3: Der kleinste Eigenwert steigt um mindestens 2.0x, gefunden etwa 111x)

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (Zielwert T1: Die Translations-Sigmas fallen nicht, wenn die lokale Anbindung lockerer wird; T2: Mit um { "1e-6" } skalierten Verfahrens-Sigmas liegt das Translations-Sigma jedes Paares innerhalb von { "1" } % von sqrt({ "2" }) mal dem Sigma der lokalen Anbindung, gefunden innerhalb von { "3e-7" }; T3: Die Informationsmatrix entspricht einem unabhängigen numpy-Gesamtaufbau auf { "1e-9" }). Der erste T2-Lauf mit Invertierung der Normalgleichungen verfehlte ({ "1.3" } % bei einer Anbindung von { "0.1" } m, Werte unter der Untergrenze bei { "1" } m); die Ursache war numerisch, und die Kovarianz wurde auf den Wurzelweg umgestellt, bevor der Zielwert neu bewertet wurde.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (Zielwert G1: Die analytischen Partialableitungen entsprechen einer zentralen finiten Differenz jedes Vorwärtsmodells auf { "1e-8" }; G2: Die 5x5-Information entspricht einem unabhängigen numpy-Aufbau auf { "1e-6" }; G4: Die Amplitude der Uhrengezeiten und ihre k2- und h2-Empfindlichkeiten entsprechen einer unabhängigen Auswertung auf { "1e-9" }; Zielwert G3 in seiner Spurhälfte NOT MET, festgelegt: Das Hinzufügen einer Familie senkt den kleinsten Eigenwert nie ({ "28" } von { "28" }), aber die Spur der Pseudoinversen stieg bei { "12" } von { "28" } Hinzufügungen, weil die hinzugefügte Familie den Rang erhöhte)

# text
seg-2e097e952eb5 = lunar_beacon::tests (Horizontsichtbarkeit gegen die geschlossene Form L01; das durch Baken ergänzte DOP gegen das unergänzte; die Wurzel der Quadratsumme des Fehlerbudgets; die Beziehung von DOP zu Metern); tests/validate_p2_beacon_before_after_table.rs (die gesamte Vorher-nachher-Tabelle auf einen eingecheckten Referenzstand festgelegt bei relativ { "1e-9" }); tests/validate_p2_beacon_before_after_independent_dop.rs (dieselbe Geometrie über einen UNABHÄNGIGEN DOP-Pfad, sodass die Ergänzung nicht gegen den Kernel geprüft wird, der sie erzeugt hat); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal begrenzt den horizontalen Positionsfehler mit k Sigma, den die blinde Gleichtaktklasse beiträgt, indem blind_position_covariance = S<em>Cov</em>S^T gebildet und in ENU projiziert wird; integrity_envelope berichtet hpl_total = hpl_araim + cmpl. Der Unterschied, den das Paar herausstellen soll: Der RESIDUEN-Test von RAIM/ARAIM ist nachweislich blind für Fehler in range(G), der ARAIM-SCHUTZPEGEL aber nicht - sein fehlerfreier Term begrenzt sie bereits bis zu einem URA des Anbieters plus nominalem Bias. Der CMPL ist daher nur der anbieterübergreifende ÜBERSCHUSS, den die URA/ISM eines einzelnen Anbieters je Anbieter nicht überdeckt, und die Summe ist eine konservative Schranke nach der Dreiecksungleichung statt einer RSS, gültig nur dort, wo dieser Überschuss nicht bereits in der URA enthalten ist.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (rangdefizitär ohne Erdbasislinien; drei Basislinien stellen den vollen Rang wieder her — die 3-Stationen-Schwelle aus dem Informationsrang, nicht aus dem Lösungsfehler; Stations-CRLB vom Schätzer mit Effizienz { "0.98" } erreicht; CRLB wird mit den Basislinien monoton enger); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (IS-GPS-800J indices)

# text
seg-d111b6550515 = lunar_afs::codes::tests (Register maximaler Länge, Legendre-Balance, G2-Verzögerungs-Round-Trip, Stufenkomposition); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (ohne den LSIS-Cache: vier zitierte Zahlen legen den Befund fest; mit ihm: { "2 937 232" } Chips und Bits gegen die Dateien aus LSIS-Anhang { "3" }, gedruckte ersten/letzten { "24" } Chips, Legendre-Tabellen D-1 und E-1 und G2-Initialisierungen ergeben genau einen abweichenden Posten, die Zelle 'letzte { "24" } Chips' von PRN { "147" } in Tabelle E-5, die die von PRN { "151" } dupliziert, während die Datei aus Anhang { "3" } mit dem Generator übereinstimmt); der strikte vorregistrierte Test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact wird mit dieser Lücke ignoriert

# text
seg-8cd700abad59 = lunar_afs::waveform (recording and truth labels), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (dritte Vorregistrierung: { "2" } Knoten, { "4" } Kanäle verfolgt, schlechtester Dopplerfehler { "0.57" } Hz, schlechtester Codeversatzfehler { "0.008" } Chip, alle { "6" } Rahmen mit dem richtigen TOI über den Umbruch { "99" } -> { "0" } und passendem Subframe { "2" } dekodiert; G0 nicht erfüllt wie geschrieben, die eigene Lauf-zu-Lauf-Variation des Empfängers in seinen Erfassungsaufzeichnungen); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (zweiter: { "5" } Verletzungen); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (erster: ungültig); die strikten Tests der drei Dateien werden mit ihren Lücken ignoriert

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (festgelegter Befund); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (strikt, mit der Lücke ignoriert); gps_lnav::tests

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (festgelegter Befund); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (strikt, mit der Lücke ignoriert)

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } bei angegebenen Ereignissen, die nichts dämpfen); r1_the_cn0_drop_roc_separates_6_db_attenuations (strikt, mit der Lücke ignoriert); Tests zu iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (festgelegter Befund); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (strikt, mit der Lücke ignoriert)

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } Satelliten der IGS-Broadcast-Datei vom { "2" }. März { "2025" }: { "960" } von { "960" } Wörtern bestehen die Paritätsprüfung von RTKLIB, { "96" } von { "96" } Subframes werden dekodiert, { "608" } von { "608" } dekodierten gesendeten Ganzzahlen entsprechen denen von Kshana, jede Eingabe innerhalb eines halben Quants, Woche und Zeiten exakt); gps_lnav::tests

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (festgelegter Befund, datenabhängig freigegeben); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (strikt, mit der Lücke ignoriert); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (festgelegter Befund, datenabhängig freigegeben); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (strikt, mit der Lücke ignoriert)

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (festgelegter Befund, datenabhängig freigegeben); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (strikt, mit der Lücke ignoriert)

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (festgelegter Befund, datenabhängig freigegeben); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (strikt, mit der Lücke ignoriert)

# text
seg-b4e5e57515cc = lunar_dpnt::tests (der Uhren-Gleichtakt löscht sich exakt aus; das Residuum wächst mit der Basislinie; verwendet SBAS PL erneut; die Satellitenanzahl wird bis zur Grenze des Builders von { "24" } eingehalten, sodass eine größere Konstellation nicht stillschweigend eine kleinere zurückgeben kann); tests/lunar_differential_pnt_reference.rs (Einzeldifferenz-Residuum + WLS-Positionslösung gegen lsq() von RTKLIB, aus C-Quelltext kompiliert)

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (OEM trägt REF_FRAME/TIME_SYSTEM des Mondes; Zeitmetadaten durchlaufen den Round-Trip; KIF-Hülle); tests/lunar_interoperability_export_reference.rs (das ausgegebene OEM des Mondes von kshana, neu geparst durch die unabhängige Python-Bibliothek <c1/>: Token REF_FRAME/TIME_SYSTEM/CENTER + Zustand je Epoche auf Formatgenauigkeit; ein beschädigter Export wird abgelehnt); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (Monotonie, Grenzen des Gesamtwerts, Stufenobergrenze, modellierte Herkunft); resilience::diversity::tests (inverse Simpson, Gleichtakt, SPOF)

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (Kendall-Tau-Handbeispiel, Dirichlet-Simplex, Flip-Rate); resilience::study::tests (Stabilitätskontrolle, Instabilitätszeuge, deklariert gegen gemessen, Diversitätskollaps)

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON-Felder)

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (Polarität des Nutzens höher/niedriger-ist-besser, umhüllt ein reales TradeResult getreu, unehrliche Evidenz abgelehnt, validierte FoM braucht externen Anker, deterministisches JSON)

# text
seg-fe77856b9e9d = quantum_devices::tests (Uhrenkarten ehrlich+geordnet; Verschränkungspräzision ~1/sqrt(tau); erkannte Rate -10x/10dB; Dunkelzählungen verschlechtern; Schranken der systematischen Untergrenze; Karte modelliert+gültig)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (die Präzision verbessert sich mit der Integration; Quanten können gewinnen UND verlieren; PL endlich-positiv; Sicherheits-FoM in [{ "0,1" }] und wächst mit der Angriffsverzögerung; Anomalie-Pd monoton; Trade is_honest)

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (Quanten schlagen klassisch bei einem langen Ausfall; der Vorteil hängt vom Ausfall ab; Trade is_honest); tests/gnss_free_quantum_navigation_reference.rs (Wachstum des Koppelnavigationsfehlers der Position gegen eine unabhängige Octave-Doppelintegration + den veröffentlichten Rauschanker von Freier-2016)

# text
seg-8e49ee940482 = quantum_faults::tests (analytische AUC-Bekanntwerte; empirische Bootstrap-AUC schließt die geschlossene Form ein; Quanten erkennen kleinere Fehler / höhere AUC; der Vorteil verschwindet bei riesigen Fehlern; Katalog mit 5 Klassen; Trade is_honest)

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (rauschfreie TDOA vorwärts→invers auf { "1e-6" } m; J·CRLB=I mit einer symmetrischen positiv definiten Kovarianz; die Spur der Positionsvarianz der CRLB ist nicht steigend, wenn ein Empfänger hinzugefügt wird; gemeinsame TDOA+FDOA gewinnt Position+Geschwindigkeit eines bewegten Emitters zurück; <{ "4" } Empfänger abgelehnt); tests/geolocation_reference.rs (Round-Trips über vier Geometrien mit einem in 3-D diversen Netz; der Gauss–Newton-Schätzer erreicht seine Cramér-Rao-Schranke — die empirische Fehlerkovarianz folgt der analytischen Schranke über { "4000" } Monte-Carlo-Läufe); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound und finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, festgelegt)

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (erfasst { "746" } W/cm2 für Stardust ohne Zielwert)

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (die Zweiwegegleichung gewinnt den Versatz exakt zurück; der Sagnac-Term entspricht der geschlossenen BIPM-Schleifenform; der ionosphärische Term folgt der Frequenzaufspaltung, und die Troposphäre hebt sich auf; Flicker-Phase hat eine flache TDEV; ein tageszeitliches Residuum hebt die TDEV bei etwa einem halben Tag; ein Reziprozitätsfehler verschiebt den Versatz und nicht die TDEV; die Reihenstabilität entfernt eine Rate); time_transfer_budget::tests

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (vorregistrierte Zielwerte A1-A3 gegen die unabhängige mpmath-Referenz: { "216" } Rytov-Gitterpunkte, schlechtester relativer Fehler { "3.4e-7" } gegenüber einem Zielwert von { "1e-6" }, Szintillation schlechtester Wert { "4.5e-16" }, Aperturfaktor schlechtester Wert { "5.7e-16" }, { "96" } Gamma-Gamma-Schwundwahrscheinlichkeiten schlechtester Wert { "1.3e-12" } in log10, optische Tiefe von Wolken und klarer Luft schlechtester Wert { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (Zielwert A5: Das Linkbudget mit pauschalem Verlust und die bestehenden Ausgaben zur Standortverfügbarkeit sind über { "1,000" } Parametersätze bitidentisch mit dem Basis-Commit)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (Zielwert A4: rho = { "0" } entspricht der unabhängigen Vereinigung und rho = { "1" } dem besten einzelnen Standort auf { "1e-12" }, und null Monotonieverletzungen bei der Anzahl der Standorte und bei der Korrelation; der erste Lauf dieses Zielwerts verfehlte ihn um { "3e-9" }, weil die verwendete Normalverteilungsfunktion die Form nach Abramowitz-Stegun mit { "1.5e-7" } war, ein Implementierungsfehler, ersetzt durch die Verteilungsfunktion über die unvollständige Gammafunktion bei unverändertem Zielwert); optical_weather::tests und optical_sitediv::tests (monotone Marge, die Wolkenobergrenze als geschlossene Form, die Identitäten der Ausfalldauer, Inversion der Margensuche)

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (Zielwert A6: Der Zeitfehler je Ausfall entspricht holdover::coast_phase_sigma und der Entfernungsfehler phase_to_range_m bitgenau über { "9" } Uhren, { "3" } mittlere Dauern, { "3" } Streuungen und { "4" } Quantile); optical_outage_holdover::tests

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (Zielwerte T1-T6 aus xval/optical-atmosphere/PREREGISTRATION-timeseries.md, vor dem ersten Lauf festgelegt: gleicher Seed gleiche Bytes und ein anderer Seed andere Bytes; kein Schlüssel ohne die Tabelle; über { "8760" } h bei { "600" } s, Seeds { "37" } und { "38" }, liegt die realisierte Verfügbarkeit jedes der drei Standardstandorte innerhalb von { "6" } Punkten der angegebenen (schlechtester Wert { "3.3" }) und der realisierte Wolkenanteil innerhalb von { "5" } Punkten der angegebenen Wahrscheinlichkeit (schlechtester Wert { "2.1" }); die Marge entspricht dem Budget minus den zwei Schwunden, und „up“ entspricht „Marge nicht negativ“ bei jedem Schritt; kein nicht portabler Mathematikaufruf im Modul; zu lange Läufe und fehlerhafte Schritte werden abgelehnt)

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (eine reale MRO-ODF, 2007-304/305, gegen ihr PDS-Label: Satzanzahl, Gruppenpositionen, Stationen, Start- und Endzeiten und Datentypen stimmen; die Zeilenanzahl der Tabelle am Dateiende verfehlt um eins, eine Inkonsistenz des Labels, als Befund festgelegt); odf::tests (handgebauter Satz im Round-Trip, Epoche { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (datenabhängig freigegeben, Eingaben mit SHA-256 festgelegt, monatliche CI mit realen Daten erforderlich: aus der Navigationsrekonstruktion mro_psp5 von MRO vorhergesagter Doppler auf den gewerteten Überflügen von DSS { "63" } und DSS { "14" }, { "12.5" } mHz RMS, Zielwert { "30" } mHz, erreicht; die registrierte Bahnbestimmung erzeugte keine Bahn, als Befund festgelegt; Lauf { "2" } mit einem gedämpften Schätzer, separat registriert: Bahn { "0.36" } km RMS und { "0.53" } km maximal gegenüber mro_psp5, erreicht, Doppler nach der Anpassung { "48.6" } mHz gegenüber { "30" } mHz, nicht erreicht, als Befund festgelegt; Leser für SPK-Typ { "1" } gegen CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } Seeds, mittlere NEES mit sechs Freiheitsgraden über die zweite Hälfte innerhalb von { "4.5" } bis { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
seg-4da98593fe6a = aperture_duty::tests (ein Fenster, das genau endet, wenn das nächste beginnt, konkurriert nicht, und ein um eine Sekunde früheres Verschieben kostet genau eine Sekunde — der Schutz gegen Fehler um eins; überlappende Fenster über die Aperturanzahl hinaus versetzen die niedriger eingestufte Sitzung in den Ausfall, mit festgelegtem Konkurrenzintervall; die Arbitrierungsrichtlinie entscheidet, welcher Dienst die Apertur hält, mit den Zahlen aller drei Richtlinien an einem Plan festgelegt; Wer-zuerst-kommt-mahlt-zuerst verdrängt keine Sitzung, die bereits eine Apertur hält; eine Sitzung, die bei ihrem Beginn die Arbitrierung verliert, erhält eine Apertur, sobald eine frei wird; die drei Duties erfassen jede verfügbare Aperturssekunde über { "3" } Richtlinien × { "4" } Aperturanzahlen; das Hinzufügen einer Apertur erhöht nie den Ausfall einer Sitzung, gemessen über { "200" } pseudozufällige Pläne × { "3" } Richtlinien × jede Aperturanzahl; genug Aperturen für jede Sitzung lassen gar keinen Ausfall übrig; der Berichtshorizont beschneidet den Plan und setzt den Nenner des Duty; eine vorhergesagte Überflugliste wird ohne einen zweiten Fenstertyp zu einem Kontaktplan; die Duty-Zahlen des mitgelieferten Plans sind Engine-Ausgaben für eine und zwei Aperturen; der Bericht nennt die Richtlinie, die die Zahlen erzeugt hat; jede berichtete Zahl trägt eine Einheit und eine Herkunftsklasse; das Szenario ist reproduzierbar und erklärt sich selbst als MODELLED; das Szenario lehnt einen Plan ab, den es nicht einplanen kann); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } Bibliothekstests: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } Bibliothekstests: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-83724a2a8e06 = hybrid_integrity::tests (die Kurve der Erkennungsleistung läuft von der Fehlalarmrate bei null Fehler bis { "1" } − P_md beim minimal erkennbaren Bias; der minimal erkennbare Bias, bei der vom Monitor selbst angewandten Schwelle durch noncentral_chi2_cdf zurückgeführt, ergibt P_md auf { "1e-9" }, auf jeder Achse und über den öffentlichen Helfer; ein tatsächlich in die HF-Schätzung injizierter Bias verschiebt die eigene Statistik des Monitors um genau das von Hand berechnete b²/(σ_rf² + σ_opt²); ein rauschfreier Bias wird über √(T/λ*)×MDB erkannt und darunter verfehlt, wobei die injizierte Leiter diese Kreuzung überspannt; die Erkennungsleistung ist monoton in der Fehlergröße und auf allen vier Achsen in Vielfachen des MDB identisch; eine gesetzte Monte-Carlo-Simulation der Monitorstatistik mit 200,000 Abtastwerten reproduziert die analytische Leistung innerhalb von 4σ an vier Punkten der Kurve; der MDB der Zeitgebung liegt über der Alarmgrenze der Zeitgebung, was eine gemessene Schwäche und kein Merkmal ist; für das Wilson-Hilferty-Quantil wird gemessen, dass es von der exakten Schwelle des Monitors um ~{ "4" } % abweicht, was festhält, warum es nicht verwendet wurde; die Rampenzahl ist genau MDB/Rate und skaliert umgekehrt mit der Rate, und eine nicht positive Rate berichtet null statt null Sekunden); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-f9767a6109d5 = hybrid_integrity::tests (das Coast beginnt genau bei der Kovarianzspur, die der Übergabeblock berichtet, für beide Richtungen, sodass die wiederholte Diagonale nicht von der berichteten Übergabe abweichen kann; die berichtete Kreuzungszeit wird aus dem eigenen Übergabe-Sigma, der PSD des Prozessrauschens und dem Abdeckungsfaktor des Berichts neu berechnet, und die Schranke liegt kurz davor innerhalb der Alarmgrenze und kurz danach außerhalb; die Coast-Zeit skaliert genau umgekehrt mit der PSD des Prozessrauschens und verkürzt sich, wenn die Alarmgrenze enger wird; ein Coast mit PSD null berichtet null statt einer Zeit null, weil nie nicht sofort ist; das ausgegebene Profil kreuzt genau einmal und schließt die berichtete Kreuzung ein; die Verdopplungszeit der Varianz und die Kreuzungszeit der Alarmgrenze sind getrennt festgelegt, da sie sich nach der engen optischen Stufe um acht Größenordnungen und nach der lockeren HF-Stufe um weniger als eine Größenordnung unterscheiden; das Verlassen der optischen Modalität bringt mehr Coast-Zeit als das Verlassen von HF, genau um die Differenz der Kovarianz geteilt durch die horizontale Wachstumsrate; und random_walk_time_to_limit trennt bereits-außerhalb, kreuzt-bei-t und kreuzt-nie)

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests und lunar_service::tests (die durch Bisektion auf dem Muster gefundene Halbleistungskreuzung stimmt mit dem veröffentlichten Airy-x = { "1.61634" } überein und ergibt die exakte Breite { "1.02899" }·λ/D, was festhält, dass der übliche Koeffizient { "1.02" } bei −{ "2.955" } dB statt −{ "3.010" } dB liegt; das Muster ist über { "400" } Punkte von der Blickachse bis zur ersten Nullstelle streng fallend; die Algebra des implizierten Wirkungsgrads läuft im Round-Trip auf { "1e-12" } und reproduziert { "0.641" } / { "0.920" }; der Winkel außerhalb der Blickachse stimmt mit tan θ = R·sin γ/(r − R·cos γ) an { "20" } Punkten und beide Grenzfälle auf { "1e-12" } überein; der genäherte Kegel enthält den realen Strahl Zeile für Zeile; die Kernzahlen entsprechen den Markierungen je Zeile, die sie zusammenfassen, und die Korrektur entspricht ihrer Differenz; jedes Urteil je Zeile ist allein aus dem ausgegebenen Bericht neu berechenbar; jedes ausgegebene numerische und boolesche Feld hat eine Einheit und eine Herkunftsklasse; eine unmögliche Apertur gibt keinen Block aus; ohne konfigurierte Antenne behält der Export genau seine sechs bereits vorhandenen Schlüssel, { "0" } JSON-Blätter geändert und { "0" } entfernt); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-9910640b7886 = tracking_loop (composing sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (Jitter des Costas-Diskriminators ohne Regelung gegen sdr::correlate, vorwärts geschritten auf gesetzter synthetischer ZF, { "3" } zusammengelegte Rauschrealisierungen × { "900" } Epochen, Übereinstimmung auf { "0.63" } % über 35-45 dB-Hz, wobei der Term des Quadrierverlusts mindestens { "3" }× besser passen muss als die Form ohne Quadrierverlust, wo immer er auflösbar ist; die Sättigung des Atan-Diskriminators bei ~{ "32" } dB-Hz zugesichert statt nur angegeben, sodass die Gültigkeitsgrenze festgelegt ist; σ bei geschlossener Schleife gegen eine schrittweise Costas-Schleife aus sdr über { "4000" } Epochen auf { "3.7" } %; Rampenverzögerung der DLL erster Ordnung gegen eine schrittweise DLL aus sdr auf { "0.17" } %; bessel_i0 gegen tabelliertes I₀ auf { "7.4e-8" }; die Hysteresebreite muss in [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] liegen über { "4" } Verhältnisse × { "2" } Integrationszeiten × { "3" } Bandbreiten); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } Bibliothekstests: jede Schreibweise des Datums durchläuft parse/as_str im Round-Trip, und eine unbekannte wird abgelehnt; das Festhalten jeder Station ohne die Bake wird mit einem Fehler abgelehnt, der <c1/> nennt; der Hebelarm ist als GLEICH ρ/B und die Gleichverteilung der Bake als GLEICH der Gleichverteilung der Station mal ihm zugesichert, beides auf { "1e-15" }, mit einer weiteren Zusicherung, dass der Hebelarm { "10" } übersteigt, sodass die beiden Budgets bei dieser Geometrie nicht verwechselbar sind; die veröffentlichte Basislinie der Fixture ist auf { "10726.748" } km festgelegt, und ihr Plan mit 49 Abtastwerten ist als streng weniger als { "49" } gegenseitig sichtbare Beobachtungen ergebend zugesichert; das Spektrum der Bake auf einer einzelnen Basislinie wird als mindestens fünf Dekaden umspannend gemessen, und das resultierende Verhältnis ist durch AM-HM über { "1" } und tatsächlich über { "100" } zugesichert; die Anordnung aus Station plus Bake ist als rangdefizitär zugesichert, wobei BEIDE berechneten Felder null sind, während der modellierte Vergleichswert weiterhin berichtet. Dazu ein Schutz an der Fixture selbst: Ein Schlüssel der obersten Ebene, der nach einem Array von Tabellen eingefügt wird, wird stattdessen zu Stationsdaten, daher wird die Einfügestelle zugesichert und das geparste Szenario darauf geprüft, den Schlüssel zu tragen — der Fehlermodus ist ein Lauf, der stillschweigend eine andere Konfiguration verwendet als die, die der Test nennt)

# text
seg-08708f044bb5 = lunar_dpnt::tests (ein rein additiver Schutz, dessen Differenz der Schlüsselmenge genau { "{" }correction_link, units{ "}" } ist, wobei jeder bereits vorhandene Wert bitidentisch gegenüber vor der Änderung erfassten Literalen ist; der Vermessungsfehler dekorreliert NICHT mit der Basislinie, während der Bahnterm es tut, und er bleibt bei einer Basislinie null bestehen, wo der Bahnterm genau null ist — die strukturelle Prüfung, die das Verdrahten des Terms an die falsche Stelle abfängt; ein Stationsfehler von { "1" } m überträgt sich { "1" }:{ "1" } und ist nachweislich nicht durch DOP verstärkt; null Latenz reproduziert das ungealterte Residuum bitgenau, und das Residuum ist monoton in der Latenz, wobei die ausgegebene Kurve direkten Läufen entspricht; die Quantisierungsstufe halbiert sich genau je Bit und σ² = step²/12, und der Vollausschlag folgt den injizierten Größen; jeder der Reihe nach abgeschaltete Term gewinnt die anderen zwei in Quadratur zurück; gleiches σ je Satellit pflanzt sich auf genau σ·PDOP fort, und dieses PDOP stimmt mit orbit::dop überein; jedes ausgegebene Feld trägt eine Einheit und eine Herkunftsklasse, in beiden Richtungen geprüft)

# text
seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: auf { "1e-12" } m mit und ohne Empfängerrauschen; zero_baseline_floor_is_zero_in_every_trial: { "0" } auf { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 innerhalb des vor dem Lauf angegebenen Bandes von { "5" } %; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (die vorregistrierte Neuberechnung mit numpy, festgehalten mit ihrem Verfehlen); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs und die Goldens des Registers und plattformübergreifend unverändert (Additivität); tests/field_units_global.rs (jedes ausgegebene Feld beschrieben, keine Ausnahme)

# text
seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: Der Strahlenmarsch reproduziert -acos(R / (R + a)) auf { "1e-3" } Grad bei jedem Azimut; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: Derselbe Kegel, auf eine Breiten-/Längenkachel mit { "0.005" } Grad abgetastet, stimmt mit dem analytischen Kegel auf { "0.25" } Grad überein; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: ein Krater mit flachem Boden auf der Kugel, Beobachter im Mittelpunkt und { "4" } km und { "7" } km daneben, gegen die Randelevation in geschlossener Form atan2((R + H) cos s - (R + a), (R + H) sin s) mit s aus der Gleichung für das sphärische Kreuzen des Randes, auf { "0.01" } Grad bei jedem Azimut; rasterised_cone_matches_the_analytic_cone: ein Kegel, auf ein polarstereographisches Gitter mit { "200" } m gerastert und durch den Gitterabtaster gelesen, stimmt mit dem analytischen Kegel auf { "0.25" } Grad überein; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, für beide Arten; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 behält seine flache Anzahl, und die Epochen, die ein Horizont kostet, sind terrain_masked (die Verfügbarkeit selbst kann steigen, weil ein Horizont einen Satelliten verbergen kann, den die Station nicht sieht), und ein Horizont von { "89" } Grad an der Station lässt nichts verfügbar; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: die Böden der Krater Shackleton und Haworth tief, das Malapert-Massiv hoch, nicht das Spiegelbild; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: eine aus dem eingebundenen Ausschnitt neu abgetastete Kachel gibt der Station den Horizont des Ausschnitts auf { "0.22" } Grad (Schranke { "0.5" } Grad, vor dem Lauf festgelegt), mit Echo der Kachel und Einheiten, und dem_path mit dem_tile_path wird abgelehnt; the_export_site_is_masked_by_the_terrain: jede Exportzeile passiert das Gelände genau dann, wenn sie sichtbar ist und bei ihrem Azimut mindestens auf der Höhe des Standorthorizonts liegt, die Geometrie bewegt sich nicht, die CSV erhält die Spalte nur mit Gelände; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs und die Goldens des Registers und plattformübergreifend unverändert (Additivität)

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m bei { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: Stichproben-Sigma sqrt({ "2" }) a innerhalb von { "6" } %; station_multipath_is_gauss_markov: Korrelation bei Lag 1 exp(-dt / tau) innerhalb von { "0.01" }, Einheitsvarianz innerhalb von { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs und die Goldens unverändert (Additivität)

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: Der Streckenfehler mit Wachstum minus ohne Wachstum hat das Stichproben-Sigma rate tau / sqrt({ "3" }) innerhalb von { "6" } % über { "1600" } Ziehungen; linear_growth_is_the_first_order_propagated_error: Ein Geschwindigkeitsfehler dv, mit dem Zweikörper-Integrator im Baum von der Szenariobahn aus fortgepflanzt, verschiebt die Position um dv tau auf innerhalb von { "1" } % bei { "60" } s und { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignoriert, der festgehaltene Nachtrag)

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: entspricht lunar_dpnt::position_error_vector_from_range_errors auf { "1e-8" } m, eine lockere Höhenzeile ändert nichts, eine enge legt den Höhenfehler fest; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: jede Zahl auf relativ { "1e-6" }; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignoriert, der festgehaltene Nachtrag)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (die festgehaltenen Zahlen gegen die registrierten Zielwerte); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignoriert, etwa { "7" } s im Release: führt die sechs registrierten Fälle erneut aus und sichert die festgehaltenen Zahlen zu)

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, das nicht überwachte Risiko innerhalb von P_THRES, eine Teilmenge, die drei oder mehr Satelliten entfernt, überwacht, und mehr als zehn überwachte Priors unabhängig als P_no fault q^k auf { "1e-12" } neu hergeleitet; a_two_satellite_fault_is_found_as_a_pair: kein Alarm fehlerfrei, und ein Bias von { "30" } m an zwei Satelliten erkannt, wobei das Paar die Teilmenge mit der größten normierten Trennung ist); tests/araim_reference_vectors.rs und tests/integrity_araim_stanford_oracle.rs unverändert (der Pfad der Ordnung 2 ist der mit MAAST geprüfte)

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: Holdover-Zahlen unverändert, { "111" } verweigerte Epochen nicht verfügbar ohne Schutzpegel, abgelehnt bei Läufen > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: HPL und VPL jeder abgetasteten Epoche entsprechen exakt einem snapshot_raim mit Residuum null auf demselben voreingestellten Himmel, und der fehlerfreie Lauf löst keinen Alarm aus; a_stated_bias_is_detected_while_it_lasts: ein Bias von { "60" } m alarmiert auf genau den { "10" } Epochen, die er abdeckt; every_integrity_field_has_a_unit); clock_integrity::tests; die Uhren-Goldens unverändert

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests und observability_gramian::tests (das Standarddokument bitgenau durch FNV-1a seines JSON, seiner Zusammenfassung und seiner SVG festgelegt, wobei explizite Standardwerte als wirkungslos und die acht Erweiterungsschlüssel als ABWESEND zugesichert sind, sodass die Erfassung nicht in einen Selbstvergleich neu erzeugt werden kann; der additive Block <c1/> aus dem Einfrieren ausgenommen, indem er entfernt und gegen die Konstante neu gehasht wird, die vor seiner Existenz festgelegt wurde, was beweist statt annimmt, dass sich nichts Veröffentlichtes bewegt hat; die Rangunabhängigkeit bei homoskedastischem Sigma bei σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m zugesichert; σ_pos als exakt linear mit σ skalierend auf { "1e-6" } relativ zugesichert; der Nullraum der DRO als genau die Koordinatenachsen z und ż zugesichert, mit getrennten zwei Ursachen — eine Entfernungszeile zwischen koplanaren Raumfahrzeugen hat û_z = { "0" }, und der Block des CR3BP außerhalb der Ebene entkoppelt bei z = { "0" } exakt; räumliche Jacobi-Matrizen gegen zentrale finite Differenzen und gegen die unabhängige 3-D-Observable der Entfernungsrate der Crate; Familien außerhalb der Ebene im ebenen Modus abgelehnt)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests und tests/operational_eop_predictor_reference.rs (Rückgewinnung der Koeffizienten des analytischen Signals auf { "1e-9" } bei einem 365-Tage-Fenster; eine Fehler-plus-Rate-Anpassung, die auf realen Zeilen der geschlossenen Steigung und dem Achsenabschnitt der gewöhnlichen Methode der kleinsten Quadrate auf { "1e-12" } entspricht; ZWEI Look-ahead-Detektoren, die die schnellen UT1- und Polspalten jeder Zeile nach der Ausgabeepoche zerstören — und die Bulletin-B-Finals intakt lassen — und bitgleiche Ausgabe verlangen, durch Mutation verifiziert: { "10" } Tests werden rot, wenn die Anpassungsgrenze um genau einen Tag gelockert wird; eine unabhängig neu aufgebaute Epochenliste; der Bulletin-B-Block eines Ziels geleert und gezeigt, dass die Epoche die Tabelle verlässt; die Zulassung von Termen bei Fenstern von { "6" }, { "15" }, { "150" } und 365 Tagen geprüft; monotone Zeilenzahlen; und eine eingefrorene Aufnahme des Standardberichts vor der Änderung, Feld für Feld ohne Toleranz geprüft, die zusätzlich prüft, dass die Aufnahme die neuen Schlüssel nicht enthält, damit sie nicht unbemerkt zu einem Selbstvergleich neu erzeugt werden kann); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (die optionale Erweiterung EopSeries::with_ls_ar_prediction über die letzte Zeile hinaus: Antworten in der Tabelle bitgleich, Prognosezeilen gleich ls_ar_predict, Bezugssystem-Argumente jenseits der Tabelle folgen der Prognose, statt begrenzt zu werden; interne Konsistenz)

# text
seg-c77bd56a0619 = lunar_frame_campaign (zusammengesetzt aus lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests und tests/cislunar_arc_recovery_reference.rs (beide Grenzen und ihre Verhältnisse auf dem veröffentlichten Gitter festgelegt; die gemessene Fehlerkurve Zeile für Zeile mit der formalen Kovarianz verglichen, mit einer Schranke vom Faktor zwei je Zeile und einer Schranke für das geometrische Mittel; eine NEGATIVKONTROLLE — der Sechszustand des ebenen DRO — bestätigt, dass das Kriterium scheitern KANN und dass der nicht regularisierte Schätzer über { "1e6" } km hinaus divergiert, statt einen plausiblen kleinen Fehler zurückzugeben; Parametrisierungsinvarianz auf jedem Präfix auf { "1e-3" } relativ bestätigt; eine Quelltextsperre, die Kommentare, Zeichenkettenliterale und das Testmodul entfernt und dann bei jeder Erwähnung der Jacobi-Matrix, STM, SVD-Rang oder SRIF-Maschinerie fehlschlägt, durch Mutation verifiziert, indem ein verbotener Aufruf eingefügt wird; eine reine Testprüfung, dass die finiten Differenzen den analytischen Zeilen gleichen, sodass die Linearisierung als gut bekannt ist, während der analytische Weg im Schätzer fehlt; Determinismus byteweise bestätigt; das freigegebene cislunar-observability-Dokument durch Schlüsselmenge, kanonischen Fingerabdruck und Zusammenfassungszeile festgelegt)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (Format- und Bezugssystem-Parsing; Lagrange-Interpolation exakt an den Knoten und auf einer linearen Bahn abseits der Knoten; ICRF-Elemente erhalten die IAU-{ "2015" }-Reduktion und sind byte-gleich mit einer expliziten Anwendung von icrf_to_iau_moon; wahre↔mittlere Anomalie Hin-und-zurück-Umrechnung gegen eine Vorwärts-Kepler-Lösung; fehlerhafte Dateien mit benanntem Grund abgelehnt). lunar_service::tests (bei nicht gesetztem <c1/> sind Schlüsselmenge und SHA-256 des Berichts festgelegt; die Keplersche Zeile gleicht dem eigenständigen Keplerschen Lauf Feld für Feld; die Identität σ_required · HPL_max / σ_URE = AL, dann ein DURCHGÄNGIGER erneuter Lauf bei der berechneten Anforderung, der { "100" } % Verfügbarkeit des Schutzniveaus erreicht, und ein erneuter Lauf mit { "1" } % darüber, der sie nicht erreicht; jedes ausgegebene numerische Feld beider neuer Blöcke aus dem erzeugten JSON auf Einheit und Herkunftsklasse durchgegangen; die festgeschriebenen Fixtures Satellit für Satellit mit ihren Quelltabellen abgeglichen; ein Horizont über das Ende einer Tabelle hinaus abgelehnt); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
seg-34bff3218a01 = tests/field_units_global.rs (alle { "61" } registrierten Arten laufen, je eine Dokumentform: Jedes numerische Blatt muss zu einem Eintrag im eigenen Einheitenblock dieses Dokuments aufgelöst werden; ein fehlerhafter Eintrag zählt für JEDE Art als fehlend, ausgenommen oder nicht, sodass ein Platzhalter keine Abdeckung kauft; die Ausnahmeliste darf ihre festgelegte Obergrenze nicht überschreiten, eine gelistete Art, die sich als vollständig abgedeckt erweist, lässt das Gate FEHLSCHLAGEN, sodass die Liste nicht aufgefüllt werden kann, und eine registrierte Art, die in der Runner-Tabelle fehlt, lässt es fehlschlagen, sodass ein neues Paket nicht ungeprüft hineinrutschen kann — was geschah und beide Arten erfasste, die nach Beginn dieser Arbeit hinzukamen; eine Einwegsperre für den Rückstand beschriebener, aber undefinierter Einheiten; und eine Veraltungsprüfung des festgeschriebenen Schemadokuments); field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (über lunar_frame_campaign::beacon_information, schedule_for und solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: leere Listen und das Basislinienbeispiel ergeben den Standardbericht und die Zusammenfassung byteweise; an_added_site_never_increases_any_variance: der kleinste Eigenwert von H_after - H_before ist nichtnegativ auf { "1e-9" } des größten, jedes Sigma-Verhältnis nachher/vorher ist höchstens eins, und beide hinzugefügten Standorte werden beobachtet; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml und scenarios/lunar-station-geodesy-with-station.toml (derselbe archivierte Zeitplan und derselbe VLBI-Kampagnenblock)

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } Tests: beide Sicherungen über den gesamten Quellbaum, plus Mutations-Fixtures, die jede Sicherung in beide Richtungen bewerten — das F22-Muster auf beiden kollidierenden Pfaden gemeldet, die ausgelieferte Behebung mit atomarer Sequenz akzeptiert, eine halbe Behebung genau auf dem Pfad gemeldet, der seine eindeutige Komponente verlor, ein Tempfile-Handle und ein geerbtes eindeutiges Verzeichnis akzeptiert, eine Wanduhr abgelehnt; eine nicht deklarierte Festlegung gemeldet, eine deklarierte akzeptiert, ein Geltungsbereich ohne Ausschluss abgelehnt, eine Deklaration im Doc-Kommentar des umgebenden Tests akzeptiert und gezeigt, dass sie nicht auf den nächsten Test übergreift; und jede Schreibweise einer Festlegung — Hex, Dezimal, Digest-Zeichenkette, Bytelänge, benannte Bytezahl, Golden-Datei — erkannt, während Algorithmuskonstanten, RNG-Seeds und kleine Kardinalitätsprüfungen es nicht werden)

# text
seg-416def055790 = integrity::composed_pl::tests (monoton, P0-Untergrenze, K(IR/2), Exponenten, untere Halbstetigkeit)

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (Divergenz, Schwelle, Dominanz durch IR-Verschärfung)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (datengesteuert: überspringt mit einer Meldung, wenn die BIPM-Serie fehlt); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 Runde { "3" }, prospektiv, noch nicht ausgeführt: Circular T { "465" } erschien am 2026-10-12, und die vorab festgelegte 1000-Werte-Regel braucht Ausgaben bis etwa { "468" })

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (analytische Partielle von LLR/VLBI/Orbiter gegen finite Differenz); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - eine leere Auswahl ergibt die Nullmatrix, eine einzelne Auswahl ist die Identität, ein Paar gleicht einer unabhängig geschriebenen elementweisen Summe, und das Ergebnis ist invariant gegenüber der Auswahlreihenfolge; adding_a_block_never_reduces_the_degeneracy_metric - Monotonie unter hinzugefügter Information; radial_diversity_beats_transverse_for_breaking_the_degeneracy - der Orbiterblock auf der Rückseite hebt die Entartungsmetrik stärker an als der transversale VLBI-Block)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (Monotonie im Budget; RSS-Budgetreduktion unter einer CRLB je Anbieter; durchgerechnete Rotationstoleranz am lunaren Hebelarm; bindender Term = Rotation)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris setzt das Budget auf null; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } bei den realen Aufteilungen; Reihenfolge der Konventionen)

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (nichtverschwindender, aber rangdefizienter Block ⇒ block_spark { "1" }, f_detect { "0" }; unabhängige Spalten ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (ein Teilnehmer, dem alle Messungen eines Knotens gehören = ein Uhrversatzfehler ∈ range(G), nicht erkennbar, mit einer deutlichen spektralen Lücke der Gramschen Matrix), byzantine_redundant_net_identifies_at_least_one (sechs unabhängige Teilnehmer mit je einer Messung ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (P⊥ = I Handfälle legen f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋ fest)

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (selbstbezügliches Netz: Die gemeinsame Rate liegt in N(GᵀWG), temporal_gauge_dim { "2" }; nach einer externen Raten-Anbindungszeile: Rate aus der Eichung verdrängt, temporal_gauge_dim { "1" }, wobei der gemeinsame Versatz bestehen bleibt)

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (gemeinsame Verzerrung nicht erkennbar, differentielle erkennbar), slope_infinity_in_range_finite_detectable (g7: Steigung ∞ für b ∈ range(G), endlich für b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: Rang(GᵀWG) = state_dim − { "8" }, die 8-dimensionale Eichung ist der gesamte Nullraum mit einer spektralen Lücke von >{ "1e6" })

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — offene und geschlossene Enden, die Lücke τ = { "400" } s in G.8271.1 Tabelle 7-3, Stetigkeit an jedem Knickpunkt, den die Tabellen implizieren; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (clock kind [clock_log])

# text
seg-df411365b9ab = clock_log::tests (handgeschriebene Logs je Format: Köpfe, Trenner, Einheiten, Frequenzintegration, TICC-Kanäle und -Modi, Lücken und Richtlinien, Ablehnungen); tests/clock_log_allantools.rs (der vorab registrierte Vergleich: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) auf den Fixtures in tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — die diskrete Alterungsrampe innerhalb von { "0.1" } % von (1/2)·D·t² über einen Tag; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } GPS-Block-IIF-Satellitenuhren, { "14" } Tage finaler IGS-Uhren: { "8" } innerhalb des Zielwerts von { "1.5" }, G25 und G30 optimistisch um bis zu etwa 2x, festgelegt); tests/slot_timing_ocxo_holdout.rs (ein gemessener OCXO: zurückgehaltene Vorhersage nie optimistisch, { "0.59" } bis { "0.70" } der gemessenen Verletzung; in der Stichprobe innerhalb von { "0.98" } bis { "1.17" }; ohne den Term der Fix-Frequenz ist die Vorhersage in der Stichprobe bei jeder Schwelle optimistisch); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — jede Klasse gegen holdover::holdover_seconds auf { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exakt tpl::timing_protection_level_ns, wenn die Uhr keinen Flicker-, Weißphasen- oder Random-Run-Term hat; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S gleich jamming::j_over_s_db und effektives C/N0 gleich jamming::effective_cn0_dbhz mit Q = 1/(R_c kappa) auf { "1e-9" } dB, und der Anker von { "32.105" } dB des eigenen Tests der Art jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: festgelegt bei { "2.04" } und { "5.16" } Mal dem nominalen Längenfehler, unter dem Sechsfachen; pluto_from_the_1992_row_is_measured_not_validated: innerhalb von { "39" } Bogensekunden und { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: schlechtester Wert { "3.7e-3" } der Geschwindigkeit); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: schlechtester Winkelfehler vom Planeten aus gesehen über { "2000" } bis { "2040" }, Phobos { "5.65" } Grad, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymed { "0.22" }, Kallisto { "0.27" }, Titan { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } Grad); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: der quadratische Mittelwert jedes Fix-Fehlers über seinem eigenen formalen Sigma in [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — jede Karte und jeder Zähler gleicht einem Scan mit dem direkten Elevationstest; five_thousand_satellites_on_a_coarse_grid — { "5 000" } Satelliten, gibt die Laufzeit und die beibehaltenen Paartests aus; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (nur Regressionsprüfung); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (Regression)

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — das Mitgliedsergebnis byte-identisch mit dem eigenständigen Lauf und jeder ausgerichtete Wert gleich der eigenständigen Reihe; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — eine Komposition mit einem Mitglied liest die eigenständige Zahl und den Ergebnis-Digest)

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (jedes mitgelieferte systemunabhängige Szenario läuft ohne Workshop-Daten, die ionosphärischen Verhältnisse des Bandvergleichs gleichen (f_ref/f)^{ "2" } und seine Freiraumdifferenzen { "20" } log10(f/f_ref), der Jitter beim Referenz-C/N0 liegt zwischen seiner Gabor-Schranke und seiner Form für unbegrenztes Band, die E5-Formprüfungen des Szenarios mit Workshop-Parametern sind konsistent, wenn diese Datei vorhanden ist, und keine Quelldatei kompiliert diese Datei ein)

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (das Multiband-Wasserfalldiagramm läuft mit vier Panels, die Störer in UHF, L5-Band, S und C verweigern jeweils nur ihr eigenes Band, und ein Lauf mit einfachem Band bleibt durch die Erweiterung unverändert); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: unter { "0.01" } Hz und { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: innerhalb von { "0.5" } dB von -139.1 und -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (der Entfernungssprung jedes Wechsels gleicht der Änderung des Entfernungsfehlers, und eine korrigierte Anpassung von { "300" } s, alle { "150" } s aktualisiert, besteht eine Schwelle von { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (die geschlossene Form begrenzt eine dichte Stichprobe des Kegels)

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (jedes Modell nach dem Dekodieren innerhalb von { "2" } mm der exakten Nachricht, beim erneuten Kodieren bitidentisch, ein gekipptes Bit durch die CRC abgelehnt); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (jedes Modell nach dem Textblock innerhalb von { "0.1" } mm, die CSV exakt)

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: auf { "1" } mm und die Drift auf { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: der gewichtete Residuen-RMS in [{ "0.8" }, { "1.2" }] und der Fehler unter vier formalen Sigmas); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (ein vorab registrierter Proxy gegen die veröffentlichten Perzentile des Datensatzes 3 von "Unveiling Starlink for PNT", doi:10.33012/navi.685: mit { "3" } Satelliten (Maske { "47" } Grad), ohne Höhenstützung und { "30" } Hz beträgt der 3-D-Fehler p90 { "92.2" } m bei { "20" } s und { "870" } m bei { "8" } s gegen die veröffentlichten { "2" } m und { "10" } m, sodass beide Zielwerte vom Faktor zwei NOT MET sind, auf der hohen Seite, und als verfehlt bestätigt werden; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) auf { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } Seeds, über den Lauf gemittelter NEES-Mittelwert in [{ "2.4" }, { "3.6" }] und mindestens { "75" } % der Epochen innerhalb des zweiseitigen Chi-Quadrat-Bandes von { "95" } %; gemessen mit { "150" } Seeds, Mittelwert { "2.84" } nur GNSS und { "2.87" } mit LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: Quelltext-Scans von src, scenarios und tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: ein stärkeres EIRP, ein längeres Anpassungsintervall und ein größerer Term der Bahnbestimmung bewegen jeweils den weitergereichten Wert und den fusionierten Fix; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: gleicht dem schrägen TEC des Überflugs im Scheitelpunkt auf { "1e-9" }, und sein Sigma gleicht dem RSS des Coderauschens über { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monoton in jeder Statistik, ein hinzugefügter Monitor hebt den Wert nie an, gesunde Statistiken bleiben bei { "100" })

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (exakte LEEF-Zeichenketten, Escaping, Schweregrad, Envelope von RFC { "5424" }, Zustelltimeouts und Wiederverbindung); tests/telemetry_cli.rs

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoriert, datengesteuert durch KSHANA_JAMMERTEST_DIR: die festgehaltene Auswahl, zurückgehaltene Zählungen, Zielwert-Urteile und Urteil); receiver_trust::calibration::tests (Zeitstempel, Fensterpaarung und die Zeitzonenverschiebung, Labels, Schutzbänder, Ausschluss, Auswahl); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (datengesteuert durch KSHANA_JAMMERTEST_PLAN_DIR: Slot-Zahlen je Testbereich des Plans von { "2025" }, Katalog-IDs, TOML-Hin-und-zurück); tests/jammertest_score.rs (ein synthetisches Log mit einem bekannten Abfall: erkannt, verfehlt, nicht auswertbar, Lauf mit Fehlalarm, signiertes Paket mit der Scorecard); jammertest::plan::tests; tests/jammertest_score_2024.rs (datengesteuert durch KSHANA_JAMMERTEST_DIR: der festgehaltene Lauf)

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-5614947f4e8e = receiver_trust (live: das Gate, sein TCP-Listener, PKSHT); außerhalb des Crates: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-Relay, natives C++-Plugin), deploy/reference-build (systemd-Units, Container)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (das Gate und sein TCP-Listener, Rust-Seite); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js und integrations/signalk/test/plugin.test.js ({ "24" } Node-Tests auf aufgezeichneter synthetischer Ausgabe); integrations/opencpn/test/relay.test.mjs ({ "5" } Node-Tests); integrations/opencpn/test/e2e-live.mjs (die echte Binärdatei an einen TCP-Verbraucher, von Hand und in CI ausgeführt); integrations/opencpn/plugin/test/pksht_test.cpp und integrations/opencpn/plugin/test/trust_state_test.cpp (C++-Prüfungen des PKSHT-Parsers und des Panel-Zustands); deploy/reference-build/check-units.sh und deploy/reference-build/test-entrypoint.sh

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (die Bump-Jump-Abgriffe und Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); Unit-Tests von iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: der vorab festgelegte Zielwert des Unit-Tests B4 bleibt wie geschrieben, seine festgehaltenen Verfehlungen werden als Befund F1 bestätigt)

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, das registrierte Urteil als festgehalten bestätigt, Befund F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, nur berichtet; datengesteuert, abgerufen durch scripts/fetch_scint_malindi.sh); Unit-Tests von realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, Befund F2)

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, das registrierte Urteil als festgehalten bestätigt, Befund F1, festgelegt durch finding_noise_free_sidelobes_exceed_the_cfar_rate); Unit-Test von iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, Befund F1, festgelegt durch finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, Befund F2, festgelegt durch finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, nur berichtet)

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-662887e17adb = standards_pack; compliance (Fakten des Standards-Packs im compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: der Status jedes Tests, einschließlich der Verfehlungen L4-T1 und der vier Genauigkeitstests der IMO); standards_pack::tests

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), auf Zahlen, die von tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py abgeleitet wurden

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), gegen xval/crpa-jamming/expected.json aus xval/crpa-jamming/oracle.py

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), gegen xval/jamming-terrain/expected.json aus xval/jamming-terrain/oracle.py

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), gegen xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json und expected_quantiser.json

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (das FLL-Gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), auf tests/fixtures/fll_handover_floor/results.csv

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (Lat/Lon-Epochen, Woche/TOW und ECEF, dms abgelehnt, feindselige Eingabe); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (festgelegte CRC, ASCII- und Binärdatensätze, fehlerhafte CRC übersprungen, feindselige Eingabe); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (CRC-24Q-Katalogprüfwert, MSM4/MSM7-C/N0 und Zusammenführen von Epochen, GLONASS-Zeit und Zuordnung der SBAS-ID, fehlerhafte CRC und andere Nachrichten)

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (bekannte Koeffizienten weißen Rauschens innerhalb von { "10" } % zurückgewonnen, Ablehnungen, TOML wird als AccelCfg geparst); tests/receiver_trust_machines.rs (Übereinstimmung und Abweichung der Peilung, Inline-Träger, imu_fit)

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (Paket-Bytes, Loopback-Broker, toter Broker gezählt); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: das Format, das die Bridge von gnss_lib_py schreibt, durch receiver-trust geführt); die Python-Tests der Bridges sind integrations/ros2/kshana_trust/test/test_bridge.py (Bridge mit einer Mock-Engine), integrations/ros2/kshana_trust/test/test_engine_integration.py (das echte Wheel bewertet einen stetigen Fix als nominal und einen Sprung von { "1.1" } km als nicht vertrauenswürdig) und integrations/gnss_lib_py/test_bridge.py (echtes gnss_lib_py { "1.1.0" } und das Wheel), ausgeführt mit pytest, nicht mit cargo

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-e8e0e0618afa = Quelle: <c1/>

# text
seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

# text
seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

# text
seg-af088012df3f = tests/osnma_official_vectors.rs (zuschaltbar, KSHANA_OSNMA_VECTORS: alle { "18" } Vektorsätze, { "186,382" } Tags authentifiziert, { "0" } fehlgeschlagen, Untergrenzen je Satz, Ketten angekündigt, ADKD 0/4/12, Alarm verifiziert, Authentifizierung setzt nach Kettenende wieder ein, Widerruf von Kette und Schlüssel und neuer öffentlicher Schlüssel; offline, Vektoren nicht weiterverteilt); tests/osnma_synthetic.rs (die Angriffssuite: gefälschte Subframes weit in der Zukunft, Ablauf und Datenbindung, Alarm und Nicht-Verwenden, Bestätigung des Headers, Dummy-Tags, MACSEQ, Schlüsselkonflikt, veraltetes und wiedereingespieltes KROOT, CMAC-AES/SHA3-256/P-521 durch den Verifier); Unit-Tests von osnma (bekannte Ergebnisse für RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } und CRC-24Q)

# text
seg-be26fdfb4a7c = allan

# text
seg-a59477833676 = tests/allan_reference.rs (NBS14 gegenüber Stable32 auf { "1e-4" }); allan::tests

# text
seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (reale 5071A Cs gegenüber H-Maser, { "556 990" } Punkte, { "16" } Mittelungsfaktoren gegenüber Stable32 auf { "1e-3" }; durch Daten gesperrt über scripts/fetch_cs5071a.sh)

# text
seg-17f05fc54f98 = tests/phasedat_reference.rs (Stable32 PHASE.DAT, { "139" } Mittelungsfaktoren, OADEV/MDEV/TDEV auf { "1e-3" }; durch Daten gesperrt über scripts/fetch_phasedat.sh)

# text
seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV auf dem Datensatz mit 1000 Punkten aus LCG von NIST SP { "1065" } §{ "12.4" }, { "6" } + { "6" } Mittelungsfaktoren gegenüber allantools { "2024.06" } auf <{ "1e-9" }); allan::tests (Verfolgung der geschlossenen Form bei weißem FM; Identität TOTVAR=ADEV bei m={ "1" }; Invarianz von Theo1/TOTVAR gegenüber Versatz von Phase/Frequenz; Steigung -1/2 bei weißem FM)

# text
seg-ca3c7f74a002 = allan (mtie, mtie_curve)

# text
seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE auf der hermetischen Phasenreihe aus LCG mit 1000 Punkten von NIST SP { "1065" } §{ "12.4" }, { "9" } Mittelungsfaktoren m={ "1" }..256 gegenüber mtie von allantools { "2024.06" } auf <{ "1e-9" }, beobachtet ≤{ "4e-15" }); allan::tests (von Hand hergeleitetes Spitze-zu-Spitze; monoton nicht fallend in τ; exakt a·m auf einer reinen Rampe)

# text
seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

# text
seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV auf der hermetischen Phasenreihe aus LCG mit 1000 Punkten von NIST SP { "1065" } §{ "12.4" }, { "8" } Mittelungsfaktoren m={ "1" }..200 gegenüber mdev/tdev von allantools { "2024.06" } auf <{ "1e-9" } relativ, plus die Identität τ/√{ "3" } auf der realen Reihe); allan::tests (Steigung −1/2 bei weißem FM; von Hand hergeleiteter kleiner Fall für MDEV)

# text
seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

# text
seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (σ_y(τ) der ⁸⁸Sr-Tweezer-Uhr von Norcia et al., { "8" } Mittelungszeiten { "0.92" }–{ "117.76" } s wörtlich unter CC-BY-4.0 eingebunden: NNLS rekonstruiert die Kurve auf ~{ "10" }% RMS / ≤{ "21" }% im schlechtesten Punkt; zurückgewonnenes √q_wf = { "4.33e-16" } stimmt mit dem veröffentlichten 4.7e-16/√τ überein; q_rw > { "0" } gemessener Boden des roten Rauschens)

# text
seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

# text
seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } Fälle mit realer Geometrie, Celestrak GPS+Galileo und IGS SP3: schlechtestes |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m gegenüber dem TOL_PL des ADD { "0.05" } m); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (die Lücken bei gleichförmigem Sigma, festgelegt); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (reale IGS ABMF 2018-05-13, { "288" } Epochen, { "2016" } Fälle mit eingespeisten Biases von { "10" } bis { "100" } m: 2016/2016 Entscheidungen der Detektion und 801/801 des Ausschlusses identisch, Slope HPL/VPL innerhalb von { "2.7e-12" } m gegenüber { "1e-6" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } Paare Nutzer/Epoche auf realen WAAS-Broadcasts, dieselbe geschützte Menge, schlechtestes |dVPL| { "7.1e-6" } m und |dHPL| { "1.6e-5" } m gegenüber { "1e-4" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (der Befund zu L5, festgelegt); tests/igs_real_data.rs und tests/araim_dual_real_data.rs (Plausibilität auf realer IGS-SP3- und Celestrak-Geometrie, als Regressionsprüfungen beibehalten, keine unabhängigen Referenzen)

# text
seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

# text
seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } AIAA-Verifikationsvektoren, schlechtester Wert { "4.12" } mm); tests/sgp4_crate_comparison.rs (unabhängiges Crate sgp4)

# text
seg-1f6277967a05 = propagator, forces

# text
seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } Epochen = { "11" } Fälle × { "25" } stündliche Zustände, LEO+GTO, gegenüber DormandPrince853 von Orekit { "12.2" }; konservative Stufen T1–T5 schlechtestes |Δr| { "0.08" } m über { "24" } h; Luftwiderstandsstufe charakterisiert bei { "333" } m)

# text
seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

# text
seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } Geometrien über die Schattenkante hinweg, { "884" } im Halbschatten, LEO bis GEO, Deklination der Sonne { "0" } und +-23.44 deg, { "8" } Azimute: schlechtestes |dnu| { "7.41e-9" } für WGS-84 und { "2.24e-9" } für die sphärische Basislinie; die WGS-84- und die sphärischen Verhältnisse von Orekit unterscheiden sich um bis zu { "0.98" }, sodass die Menge die Abplattung unterscheidet); Unit-Tests von srp_shadow und propagator

# text
seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

# text
seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } Geometrien auf Galileo-Bahnen, { "7" } Sonnenfälle einschließlich der Abstände im Perihel und Aphel, { "100" } zufällige Lagen; Summe der ebenen Platten schlechtestens { "2.05e-15" } relativ über { "1056" } Fälle; durchgängig mit der eigenen Lage und dem eigenen Druck von Orekit schlechtestens { "2.39e-15" } über { "747" } Fälle bei voller Sonne, während die Standardkonstanten für den Druck von Orekit sich um >= { "4.43e-3" } unterscheiden, sodass der Vergleich die Konstante unterscheidet; Matrix der nominellen Gierung schlechtestens { "1.89e-15" }; Partielle des Strahlungsfaktors schlechtestens { "1.35e-15" }; Partielle je Platte schlechtestens { "4.12e-13" } relativ gegenüber zentralen Differenzen von Orekit über { "10836" } Plattenfälle; Beschleunigung und Partielle von ECOM2 schlechtestens { "1.74e-15" }); Unit-Tests von srp_boxwing (Grenzfälle in geschlossener Form, Partielle aus finiten Differenzen); Tests der Verdrahtung von propagator und precise_od

# text
seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } Gitterpunkte, { "90" } bis { "1000" } km, { "4" } Breiten, { "2" } Ortszeiten, { "3" } Tage, niedrige/mäßige/hohe Aktivität: Dichte innerhalb von { "1.866e-6" } relativ und Temperatur innerhalb von { "1.97e-4" } K von pymsis; bitidentisch mit dem C-Port; die { "17" } veröffentlichten C-Testfälle, { "187" } Werte innerhalb von { "0.496" } Einheiten der 7. signifikanten Stelle); Unit-Tests von nrlmsise00

# text
seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

# text
seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } Fälle x { "25" } stündliche Zustände über { "24" } h, kreisförmig { "51.6" } deg, { "400" } km bei niedriger/mäßiger/hoher Aktivität und { "300" } km: schlechtestes |dr| { "0.0303" } m und |dv| { "3.36e-5" } m/s gegenüber { "3.3" } bis { "141.8" } km Luftwiderstandsverschiebung, schlechtester Fehler/Zielwert { "0.003" }; die Kontrolle mit exponentieller Dichte verfehlt um { "119.1" } m); Unit-Tests von forces und propagator (Standard bitidentisch; die Stufe wertet den Port am erdfesten geodätischen Punkt aus)

# text
seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

# text
seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (äquatoriale Fälle E400, E300 und E250x600 bei J2000.0, { "25" } stündliche Zustände über { "24" } h: Die durch den Luftwiderstand bedingte Verschiebung stimmt mit der von GMAT auf höchstens { "0.016" } des Zielwerts { "0.5" } m + { "1e-3" }|D| überein, bei { "21.5" } bis { "143.9" } km Verschiebung; eine Änderung von +{ "1" } % bei Cd*A/m erreicht das { "9.83" }-Fache des Zielwerts; der geneigte Fall I400 wird berichtet, { "10.4" } % Abstand, der genannte Unterschied in der Definition der Höhe)

# text
seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

# text
seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } von { "21" } Wellen stimmen mit dem veröffentlichten Modell A2 überein: schlechtester Wert { "0.00050" } cm, { "0.050" } deg gegenüber Zielwerten von { "0.0006" } cm, { "0.1" } deg); tests/tides_iers.rs (Amplitudenband von S2)

# text
seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

# text
seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } Fälle x { "25" } stündliche Zustände über { "24" } h: EGM2008 8x8 und 70x70 auf LEO { "45" } deg, polar { "89.9" } deg, sonnensynchron { "98.2" } deg, GTO, und 70x70 mit Sonne/Mond und SRP; schlechtestes |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s; negative Kontrollen verfehlen um { "6168" } m (eingefrorene Erde) und { "20871" } m (nur zonal)); Unit-Tests von propagator (Identität im zonalen Grenzfall auf { "1e-12" }, CIO-Bezugssystem bitgenau gegenüber precise_od, Jacobi-Integral über { "6" } h auf { "1e-9" } gehalten)

# text
seg-f75dcdead7a4 = integrator, propagator

# text
seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } einzelne Schritte: Zustand innerhalb von { "5.55e-15" } relativ, FSAL-Ableitung { "3.46e-15" }, dichte Ausgabe { "1.99e-14" }, Entscheidungen zu Annahme/Ablehnung identisch; { "3" } vollständige Läufe bei rtol = atol = { "1e-12" } (LEO { "58000" } s, e = { "0.7" } über { "5" } Perioden, Arenstorf über eine Periode): erster Schritt identisch, angenommene Schritte 502/501, 390/390, 298/298 und Auswertungen 6025/6013, 5497/5497, 4285/4285 gegenüber SciPy, Endzustände innerhalb von { "2.95e-13" } relativ (Zweikörper) und { "1.58e-12" } (Arenstorf), dichte Ausgabe innerhalb von { "9.5e-13" }; Genauigkeit gegenüber der exakten Kepler-Lösung mit mpmath gleich der von SciPy (LEO { "8.44e-5" } m, Periodizität bei Arenstorf { "1.475e-9" })); Unit-Tests von integrator und propagator ({ "24" } h Zweikörper gegenüber exaktem Kepler unter { "0.1" } m)

# text
seg-c6da65825c67 = kepler, propagator

# text
seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } Gitterpunkte, e von { "0" } bis { "0.999999" }, M in [-pi, pi] bis hinab zu { "1e-12" }: schlechtestes |E - E_ref| { "0.898" } eps|E| gegenüber einem Zielwert von { "8" } eps|E|; { "9" } Punkte mit aufgewickeltem M bei höchstens { "0.013" } ihres Zielwerts; an keinem der { "414" } Punkte war ein Newton-Polierschritt nötig; Wrapper bitidentisch); Unit-Tests von kepler

# text
seg-9a2263ce0872 = gravity_pds, gravity_sh

# text
seg-43b33973adff = tests/planetary_gravity_pds.rs (Ausschnitte bis Grad 20 laufen immer: schlechtestes |dg|/|g| { "9.7e-16" }, bezogen auf die Störung { "3.4e-11" }; GMM-3 d/o { "120" } über die ganze Kugel { "3.7e-15" } / { "6.3e-12" } und GL0660B d/o { "660" } bei |lat| <= { "60" } deg { "5.0e-14" } / { "1.0e-10" }, durch Daten gesperrt; Header und ausgewählte Koeffizienten gleich den veröffentlichten PDS-Produkten, Anzahl der Datensätze { "7380" } und { "218790" }); Unit-Tests von gravity_pds

# text
seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

# text
seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } Szenarien: { "6" } rauschfreie LEO/MEO/exzentrische/3–4 Stationen + { "2" } σ={ "5" } m, gegenüber Orekit { "12.2" }; schlechtester Batch |Δr| { "1e-3" } m / |Δv| { "1e-6" } m/s, sequenziell |Δr| { "0.9" } m)

# text
seg-9edf08007870 = radiometric (light_time_solution)

# text
seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } Strecken über { "8" } Epochen { "2020" }–{ "2027" } gegenüber ANISE DE440; schlechtestes |Δτ| { "1.03e-9" } s, |Δrange| { "0.31" } m bei bis zu { "2.5" } AU)

# text
seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

# text
seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } Fälle SV-Epoche: GPS + Galileo + BeiDou-MEO, { "12" } SV × { "7" } Versätze, gegenüber eph2pos von RTKLIB; schlechtestes |Δ| je Achse { "6.2e-8" } m)

# text
seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

# text
seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } Fälle SV-Epoche außerhalb der Knoten / { "6" } Satelliten gegenüber peph2pos von RTKLIB; schlechtestes |Δ| je Achse { "1.5e-8" } m)

# text
seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

# text
seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (eingecheckte synthetische IONEX-Karte gegenüber der Formelreferenz: { "20 075" } Knoten exakt, Interpolation max |Δ| { "3.5e-13" } TECU; durch Daten gesperrt auf KSHANA_IONEX_CODE_GIM_DIR, der reale Breitenausschnitt des endgültigen GIM von CODE vom 2018-05-13, von fetch.sh mit festgelegtem SHA-256 geholt: Knoten exakt, Interpolation max |Δ| { "3.6e-13" } TECU über { "15 795" } Abtastwerte, Schräg-TEC { "5.1e-13" } TECU; durch Daten gesperrtes iontec von RTKLIB v2.4.2-p13 an { "6885" } Abfragepunkten, Lauf vom 2026-10-13: max |Δ| { "3.6e-13" } TECU in beiden Zeitmodi, Zielwert { "1e-5" } vorab festgelegt); ionex::tests

# text
seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

# text
seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (IGS-Stationen WTZR Basis / WTZZ Rover, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s: { "359" } Epochen, Fixes bei { "100" } % ab { "00" }:{ "10" }, Fehler der fixierten Basislinie Median { "4.5" } mm, p95 { "5.5" } mm; die ersten { "10" } min fixiert { "2.6" } mm gegenüber Float { "13" } cm); rtk_real::tests

# text
seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

# text
seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } Epochen: Kshana minus IGS Std { "0.075" } ns, Zielwert { "0.20" }; Mittel -0.659 ns, Zielwert { "5.0" })

# text
seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

# text
seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (IGS-Station WTZR, 2025-02-24 00-06 h, { "30" } s, von der Entwicklung zurückgehalten: horizontal in der letzten Epoche { "1.5" } mm, oben −{ "2.9" } cm; 04-06 h 240/240 Epochen innerhalb von { "0.10" } m in 3-D, p95 { "6.7" } cm; nur Code p95 { "1.70" } m; durch Daten gesperrt ZTD-RMS { "1.7" } cm gegenüber EUREF); ppp_real::tests; tests/ppp_parity_glab_rtklib.rs (RM-31: PPP von RTKLIB v2.4.2-p13 auf denselben Eingaben stimmt innerhalb von { "0.05" } m bei 240/240 Epochen überein, { "9.7" } mm bei der letzten, bei der dritten Registrierung nach zwei Läufen, deren Konfiguration von RTKLIB die feste Gezeit nicht enthielt und die Antenne auf den Basisslot legte, beide als Befunde festgehalten; der Zielwert für die Parität von SPP wurde verfehlt, { "1.085" } m Median gegenüber { "0.50" } m; gLAB { "6.0.0" } bei seinem ersten registrierten Lauf, Kommandozeile der Änderung { "4" }: PPP innerhalb von { "0.05" } m bei 240/240 Epochen und { "5.0" } mm bei der letzten, Zielwert für SPP verfehlt, { "1.187" } m Median, ein Befund: Die eigenen SPP-Lösungen der beiden Referenzwerkzeuge unterscheiden sich um { "0.852" } m Median, sodass dieser Zielwert enger gesetzt war als die Übereinstimmung zwischen den Werkzeugen)

# text
seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

# text
seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (BRD400DLR_S RINEX { "4.02" } von IGS gegenüber BRDM00DLR_S RINEX { "3.04" } vom 2026-07-19, Ausschnitt 00-02 h: G { "37" } / E { "478" } / C { "72" } Datensätze in beiden Richtungen zugeordnet, jedes Feld identisch, Position bei Toe { "0" } m; ganzer Tag durch Daten gesperrt: G { "416" } / E { "5668" } / C { "865" } / J { "118" }); rinex::tests

# text
seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

# text
seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (endgültiges SP3 von IGS mit { "15" } min vom 2025-02-24 gegenüber den endgültigen Uhren von IGS mit { "30" } s, { "32" } GPS-Satelliten: Median der Knoten |Δ| { "2.6e-13" } s; { "3038" } Datensätze der Mittelpunkte RMS { "0.121" } ns, p95 { "0.265" } ns; bei Halten des Knotens stattdessen { "4.24" } ns RMS); sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

# text
seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

# text
seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (synthetische Lader und Tests mit rotierender Plattform für den Hebelarm immer; durch Daten gesperrt auf KSHANA_KFGINS_DIR, Lauf vom 2026-10-13 auf dem Demodatensatz von KF-GINS: horizontaler / vertikaler RMS { "0.0109" } / { "0.0090" } m gegenüber der Referenztrajektorie gegenüber KF-GINS C++ { "0.0111" } / { "0.0083" } m, alle sechs vorab registrierten Zielwerte gehalten; Hebelarm aus { "0.329" } m)

# text
seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

# text
seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } Tests: unabhängige Referenz und Szenarien, exportierte Bytes festgelegt, Leser für NMEA und LLH, Ausschnitt ECEF mit vier Spalten, FINDING von Lauf 1 am CSV in voller Breite, Zeilenraster mit { "10" } Hz)

# text
seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

# text
seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (Profile statisch/Kurve/Coning, je { "30" } Epochen, gegenüber NaveGo: Lage bitidentisch { "0" } rad; Geschwindigkeit/Position innerhalb benannter analytischer Schranken)

# text
seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (Synthese von GRS80 reproduziert Somigliana auf { "3.5e-12" }; reale Störungskarte von ICGEM EGM2008 physikalisch)

# text
seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

# text
seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } Fälle: { "12" } Epochen im Januar { "2025" } x die Punkte L1 und L2, zwei südliche L2-Halo- und ein DRO-Anfangszustand der JPL Three-Body Periodic Orbits API sowie ein generischer Zustand; schlechteste Position { "1.8e-7" } m gegen { "1" } mm, Geschwindigkeit { "1.2e-9" } m/s gegen { "1e-6" } m/s; Umkehrung { "2.7e-15" }); cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

# text
seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

# text
seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Merkur, Venus, die Erde und der Mond am 2026-01-01, 2030-06-15 und 2040-12-31: schlechtester Wert { "3.3e-5" } m und { "1.0e-11" } m/s gegen { "1" } mm und { "1e-6" } m/s; der Kernel-Block und die Bezeichnungen exakt); tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

# text
seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

# text
seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (Erde zum Mars-Baryzentrum, { "16" } Abflüge 2026-09-01..2027-01-29 x { "19" } Ankünfte 2027-06-01..2028-02-26: { "304" } Zellen auf beiden Seiten endlich, schlechtestes C3 { "2.5e-14" } und V-infinity { "2.6e-14" } relativ gegen { "1e-8" }, dieselbe Zelle mit minimalem C3, { "9.1997" } km²/s²)

# text
seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

# text
seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (Erde zum Mars-Baryzentrum, Abflüge 2026-09-15..2027-01-15 x Ankünfte 2027-05-01..2028-03-01, Typ I/II x min. C3 / min. V-infinity: schlechteste Zielfunktion { "8.7e-13" } relativ, Daten innerhalb von { "1e-5" } Tag, andere Größe innerhalb von { "2.5e-7" } relativ, gegen vorab festgelegte Zielwerte von { "1e-7" }, { "0.01" } Tag und { "1e-4" }; docs/design/evidence/cap20cd-transfer-optimiser/); tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (sekundäre veröffentlichte Referenz NASA/TM-2010-216764 Tabelle { "2" }: Typ II min. C3 { "9.182" } gegenüber { "9.144" } und Typ II min. V-infinity { "2.564" } gegenüber { "2.565" } MET; Typ I min. C3 { "10.535" } gegenüber { "11.11" }, -5.18 %, NOT MET und als verfehlt festgehalten, wobei die Bibliotheksreferenz mit Kshana übereinstimmt)

# text
seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

# text
seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } Fälle: { "300" } zufällige 3-D, { "18" } nahe { "180" } Grad, { "24" } nahe der Minimalzeit mit M = { "1" }..3, { "40" } heliozentrische; { "1058" } Lösungen; Anzahlen und Zweigreihenfolge gleich; Geschwindigkeiten innerhalb von { "1e-8" } relativ, schlechtester Wert { "1.6e-13" }; innerhalb von { "1" } % der Minimalzeit innerhalb von { "1e-6" }, schlechtester Wert { "7.5e-15" }; eine interne Kepler-Landungsprüfung landet jede Lösung innerhalb von { "4.2e-12" } von |r2|, bis auf einen festgehaltenen Befund an einem Bogen mit e = { "0.994" }, eine Einschränkung von kepler_universal, nicht des Lösers)

# text
seg-67d3c2e5a311 = maneuver (lambert)

# text
seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } Transfers gegen lamberthub izzo2015; schlechtestes |Δv| { "7e-12" } m/s)

# text
seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

# text
seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado Ende-zu-Ende; SOFA/ERFA-Vektoren)

# text
seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

# text
seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } UTC-Zeitpunkte: sechs um jede der { "27" } Schaltsekunden 1972-2016, zwei feste, { "60" } mit festem Startwert über 1972-2026 verteilte; dtf2d, utctai und taiutc jeweils innerhalb von { "1e-6" } s, schlechtester Wert { "1.9e-11" } s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

# text
seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

# text
seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } zweiteilige UT1/TT-Daten 1980-2050 einschließlich Schritten von +{ "1" }, +{ "10" }, +{ "50" } us an zwei Daten: gmst82 innerhalb von { "1e-12" } rad, schlechtester Wert { "0" }; GCRS-zu-ITRS-Elemente innerhalb von { "5e-12" }, schlechtester Wert { "2.7e-14" }; Rotation über +1/+10/+{ "50" } us innerhalb von { "1e-13" } rad von ERFA, schlechtester Wert { "1.1e-14" } rad, wobei der Einzel-f64-Pfad die Schritte von +{ "1" } und +{ "10" } us völlig verfehlt); ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor; jd2::tests::two_part_types_convert_without_moving_the_instant

# text
seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

# text
seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } TT-Epochen 1950-2100, dX und dY bis zu { "0.5" } mas: Präzessionselemente innerhalb von { "1e-13" }, schlechtester Wert { "0" }; TEME zu GCRS innerhalb von { "5e-10" } rad, schlechtester Wert { "1.10e-10" } rad; CIO mit Offsets innerhalb von { "1e-13" }, schlechtester Wert { "0" }; Null-Offsets bitidentisch mit cio::gcrs_to_cirs_matrix)

# text
seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

# text
seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } UTC-Zeitpunkte: vier um jeden der { "15" } Beginne eines TAI-UTC-Ausdrucks 1960-1972 und { "60" } mit festem Startwert über 1960-1971 verteilte; dtf2d, utctai und taiutc jeweils innerhalb von { "1e-6" } s, schlechtester Wert { "2.9e-11" } s); tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical (die { "224" } Zeitpunkte der Zeile ab { "1972" } bitgenau unverändert)

# text
seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

# text
seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } Fälle: die { "4" } GLONASS-Datensätze der echten IGS-MGEX-Broadcast-Datei vom 2013-01-01 x { "73" } Offsets innerhalb von +/-900 s; Uhr innerhalb von { "1e-14" } s, schlechtester Wert { "0" } s; Position innerhalb von { "0.01" } m, schlechtester Wert { "1.12e-3" } m)

# text
seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

# text
seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (Teil { "1" }: { "4432" } TEME-Positionen der { "232" } eingecheckten Elementsätze gegen python-sgp4 { "2.24" }, schlechtester Wert { "6.1e-8" } m, Zielwert { "1" } cm; Teil { "2" }: { "108" } Zeitpunkte, davon { "23" } mit Erdorientierungsparametern und einer in der letzten Sekunde eines Schaltsekundentags, gegen ERFA: GCRS -> ITRS schlechtester Wert { "2.9e-6" } mas, Zielwert { "0.1" } mas; TEME -> ITRS schlechtester Wert { "0.41" } mas, Zielwert { "2" } mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs

# text
seg-5235d736ac3e = navsignal (CodeFamily)

# text
seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB; φ({ "1023" })/10 = { "60" })

# text
seg-6f9de921ca86 = orbit (dop)

# text
seg-b215ace86be9 = tests/dop_reference.rs ({ "8" } Geometrien, gut konditioniert → nahezu singulär)

# text
seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

# text
seg-aee414a8d8ec = tests/klobuchar_reference.rs ({ "10" } Fälle über Elevation/Azimut/Ortszeit, zwei Koeffizientensätze)

# text
seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

# text
seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } Fälle: χ²-CDF/Quantil, Normal-CDF/Quantil, nichtzentrale χ²-CDF, pbias über die Bereiche P_fa/P_md/Redundanz)

# text
seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — unabhängige Bibliothek (Cephes/Boost), ein anderer Algorithmus als die Reihe der unvollständigen Gammafunktion von Kshana; abgeglichen auf ≤{ "1e-6" } rel. Nur der Kernel. Die <em>Allokation</em> des ARAIM-MHSS-P_HMI-Budgets ist nicht mehr ohne veröffentlichte numerische unabhängige Referenz — das eigene durchgerechnete Beispiel der WG-C ARAIM Technical Subgroup stützt jetzt die separate Zeile 'ARAIM MHSS protection levels against published reference vectors', abgeglichen mit dem eigenen TOL_PL der Referenz = { "5e-2" } m — der Geltungsbereich dieser Zeile ist daher der statistische Kernel, und jene Zeile trägt die Allokation (siehe docs/ARAIM_REFERENCE.md)

# text
seg-116377f12c14 = sbas (sbas_protection_level)

# text
seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } echte EGNOS-Epochen: HPL direkt abgeglichen, vertikales d_U K-Faktor-frei geprüft)

# text
seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

# text
seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } Datensätze, { "24" } Schwellen; exakte Zählwerte + <{ "1e-9" })

# text
seg-ee20bf2a4315 = impairment_eval, eval_stats

# text
seg-f546b062df87 = tests/opssat_ad_reference.rs (echtes ESA OPS-SAT, AUC reproduziert scikit-learn auf { "1e-9" }); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } Fälle auf dem echten OPSSAT-AD-Testsplit: vollständige Konfusion im Arbeitspunkt + Pd/Pfa/Precision/F1 gegenüber scikit-learn, ganzzahlig exakt)

# text
seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

# text
seg-42b83604390f = tests/scipy_reference.rs (NNLS; χ² bei Betriebs-dof ≥ { "48" }; van-Loan Q)

# text
seg-f571816b43fc = igrf, igrf_data

# text
seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } globale Punkte × Höhen gegenüber ppigrf @ Epoche { "2025.0" }; schlechtestes |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

# text
seg-88c8996b8e2e = quantum_faults, eval_stats, detection

# text
seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } Fälle gegenüber scipy { "1.17" } norm.cdf/ppf + scikit-learn roc_auc_score; schlechtestes |Δ| AUC { "6.9e-8" }, minimal erkennbarer Fehler { "1.3e-8" }, empirische AUC { "1.1e-16" })

# text
seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } Fälle gegenüber scipy { "1.18" } / numpy { "2.4" }: { "61" } Kendall τ-b auf { "2e-16" }, Rangfolge exakt, Dirichlet-Mittelwert + Perzentil-KI auf { "1e-12" })

# text
seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (Saaty { "1980" } Random-Index-Tabelle n={ "1" }..10 EXAKT; Prioritätsvektor + λ_max + CR gegenüber SciPy/LAPACK eig an einer konsistenten { "3" }×{ "3" } und einer inkonsistenten { "3" }×{ "3" } / { "4" }×{ "4" }, abgeglichen auf <{ "1e-9" })

# text
seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

# text
seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (WSM-Scores + Rangfolge) und tests/mcda_wpm_reference.rs (WPM-Scores + Rangfolge), jeweils gegenüber pymcdm auf <{ "1e-9" } an einer festen { "4" }×{ "3" }-Entscheidungsmatrix aus Nutzen- und Kostenkriterien

# text
seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (Nähekoeffizienten + Rangfolge gegenüber pymcdm auf <{ "1e-9" } an einer festen { "4" }×{ "3" }-Matrix aus Nutzen- und Kostenkriterien)

# text
seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (Q-Index + Rangfolge gegenüber pymcdm auf <{ "1e-9" } an einer festen { "4" }×{ "3" }-Matrix aus Nutzen- und Kostenkriterien)

# text
seg-faaffee99e67 = tests/mcda_promethee_reference.rs (Netto-Outranking-Fluss + Rangfolge, übliches Kriterium, gegenüber pymcdm auf <{ "1e-9" } an einer festen { "4" }×{ "3" }-Matrix aus Nutzen- und Kostenkriterien)

# text
seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (Konkordanz-, Diskordanz- und Dominanzmatrizen Element für Element + Kernel-/dominierte Menge gegenüber pyDecision auf <{ "1e-9" } an einem festen { "4" }×{ "3" }-Datensatz nur aus Nutzenkriterien)

# text
seg-08e153bbaef7 = mcda::waspas, mcda::moora

# text
seg-eafdba85247a = tests/mcda_waspas_reference.rs (WASPAS-Präferenzen + Rangfolge) und tests/mcda_moora_reference.rs (MOORA-Scores + Rangfolge), jeweils gegenüber pymcdm auf <{ "1e-9" } an einer festen { "4" }×{ "3" }-Entscheidungsmatrix aus Nutzen- und Kostenkriterien

# text
seg-3d6cd006d21f = tests/mcda_copras_reference.rs (Nutzengrade + Rangfolge gegenüber pyDecision auf <{ "1e-9" } an einer festen { "4" }×{ "3" }-Matrix aus Nutzen- und Kostenkriterien)

# text
seg-7fb7df3cd534 = tpl (Cusum), security

# text
seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } Fälle mit deterministischer Latenz EXAKT gegenüber einer Erstpassage-Referenz; { "8" } ARL₁-Fälle, Monte-Carlo @60k Läufe gegenüber der Siegmund-Näherung + veröffentlichten Montgomery-Tabellen)

# text
seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

# text
seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } Fälle gegenüber scipy { "1.18" }: { "12" } Coast-Varianzen gegenüber linalg.expm Van-Loan Q₀₀ schlechtester rel. Wert { "1.1e-15" }; { "7" } Holdover-Inversionen gegenüber optimize.brentq schlechtester rel. Wert { "1.5e-16" })

# text
seg-817055dfe79a = resilience::diversity (effective_diversity)

# text
seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } Fälle: { "14" } gegenüber scikit-bio inv_simpson + { "3" } festgelegte Nullrandfälle; schlechtestes |Δ| { "0.0" })

# text
seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

# text
seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

# text
seg-db663720ff55 = sdr

# text
seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" }: die ersten 10 Chips reproduzieren die Oktalwerte 1440/1620/1710/1744/1133/1455/1131/1454/1626 aus IS-GPS-200 Tabelle 3-Ia exakt; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

# text
seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

# text
seg-e941099918ef = fusion::tests (Identität UKF==lineares KF; Ausfall-Coast; NEES); tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } Fälle gegenüber filterpy { "1.4.5" }: lineares EKF lose/eng + gekoppelte PNT-Posterioren auf ≤{ "2.4e-12" }; UKF-Lauf über 40 Epochen schlechtestes |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (NaveGo-v1.4-Lösung mit loser Kopplung auf NaveGos echter Ekinox-IMU/GNSS-Fahrt: horizontaler RMS 0.912x, vertikaler 0.940x, RMS der Positionsinnovation 0.861x desjenigen von NaveGo, mittlere normierte Innovation { "0.395" }; Zielwerte 1.2x, 1.2x, 1.2x und { "1.5" } vor dem Lauf festgelegt)

# text
seg-e53182bd8d30 = cr3bp::tests (STM gegenüber finiter Differenz); tests/cislunar_mission_analysis_reference.rs ({ "5" } JPL-L2-S-NRHO-Mitglieder: die { "9" }:{ "2" } + { "4" } Nachbarn; schlechtestes |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, Perilune { "0.7" } km in JPL-Längeneinheiten)

# text
seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

# text
seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values in CI an zehn zitierten ICGEM-Knoten; egm2008_n70_gravity_anomaly_sa_matches_icgem über die vollständig abgerufenen 0.25-Grad-Gitter von Tschad 9-15N 19-25E und Death Valley 35-38N 242-245E, { "794" } Knoten: RMS { "1.3e-8" } und { "2.6e-8" } mGal, Maximum { "2.9e-8" } mGal gegen vorab festgelegte Zielwerte von { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/); gravity_sh::tests

# text
seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — die eingecheckte 6-Bogensekunden-Dezimierung der gemeinfreien SRTM-v3-Kachel N36W117 setzt das Badwater Basin, den tiefsten Punkt Nordamerikas, auf −{ "78" } m innerhalb des Vermessungsbands [−{ "95" },−{ "70" }] m und liest das wahre Relief der östlichen Gebirgskette von ~{ "2.2" } km; außerdem, an zwei eingecheckten wortgetreuen 1-Bogensekunden-Ausschnitten 361x361 von N36W119 und N36W117, real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m im Band [{ "4380,4430" }] m um die Vermessung von { "4421" } m), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m in [−{ "95" },−{ "70" }] m) und gdal_cross_check (der nächste Knoten ist gleich GDAL { "3.8.4" } gdallocationinfo auf den vollständigen Kacheln, exakt an allen { "8" } vorab registrierten Punkten, xval/srtm-ungate/; außerdem die von Hand gebauten Referenzen für Bilinear-Mittelpunkt und synthetische Parser-Fixtures)

# text
seg-d86971b6e158 = oem

# text
# c1: oem
seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } Zustände / { "2" } Fixtures byteidentisch vom unabhängigen <c1/>-Parser dekodiert, Pos/Vel Δ = { "0" }); oem::tests (Parsen eines OEM eines externen Werkzeugs mit zusätzlichen Schlüsselwörtern/Kommentaren/Kovarianz, Schreiben→Lesen-Rundlauf des vollständigen Zustands, Pos+Vel+Beschleunigung toleriert, nur Position + fehlende Pflicht-Metadaten abgelehnt, Szenario-Rundlauf hochgenau + externe Übernahme); dominance_demonstrators (erreichbar + reproduzierbar + Rundlauf exakt + MODELLED-nicht-VALIDATED)

# text
# c1: oem
seg-ab37fdc7a543 = Unabhängiger CCSDS-502-Parser eines Dritten <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — eine separate Codebasis, die das von kshana ausgegebene EME2000/UTC-OEM byteidentisch dekodiert ({ "24" } Zustände in { "2" } Fixtures, Pos/Vel Δ = { "0" }) und deren strenger Leser die Metadaten-Token bestätigt; der Parser von kshana stimmt ebenfalls mit ihr an einem mitgelieferten externen OEM überein. Zwei ehrliche Interop-Befunde (die oem-Bibliothek lehnt die satellitenweise Mehrsegment-Konvention von kshana und deren Kovarianzzeilen mit mehreren Einträgen ab) sind im Test dokumentiert — dies validiert also den dem Standard entsprechenden Austausch einzelner Objekte, nicht die vollständige Übereinstimmung jeder kshana-Variante mit CCSDS-502

# text
seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

# text
seg-e26317a36469 = eo_payload::tests (Winkelradius { "64" }° bei { "700" } km + schrumpft mit der Höhe, Nadir→Zenit/Entfernung null, Horizont→ε=0/maximaler Zentralwinkel, Fehler jenseits des Horizonts, Schwadbreite wächst mit FOV / GSD mit der Höhe, ~{ "2750" } km Knotenabstand, Szenario reproduzierbar/MODELLED + Zurückweisung fehlerhafter Eingaben); dominance_demonstrators (erreichbar + reproduzierbar + { "64" }° Winkelradius + MODELLED-nicht-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (Höhen 400-1500 km, Inklinationen 1-98 Grad, halbes FOV 7.5-50 Grad, IFOV 10-50 Mikroradiant, Schwenk { "30" } und { "89" } Grad: jede Größe innerhalb ihres vorab festgelegten Zielwerts, Zusammenhangs-Flag 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; Regression tests/eo_payload_coverage_reference.rs

# text
seg-ee8ce4b84732 = space_packet::tests (Header-Bits entsprechen dem CCSDS-133-Layout, Kodieren→Dekodieren-Rundlauf aller Felder, außerhalb des Bereichs/abgeschnitten abgelehnt); tests/ccsds_space_packet_reference.rs ({ "33" } Fälle gegenüber spacepackets { "0.32.0" }, darunter { "12" } Vergleiche vollständiger Pakete; null abweichende Oktette)

# text
seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, packet error control, segmentation and reassembly, stream decoding)

# text
seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (fünf vorab festgelegte Zielwerte: CRC, Zeitcodes, Datenströme, Lücke und Reihenfolge, PUS TM; null Abweichungen); space_packet::tests

# text
seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

# text
seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (Inventar, Auswertung, Bit- und Byte-Identität, OEM-Epochenumrechnung; vier geplante Mutationsprüfungen schlagen auf Rot)

# text
seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

# text
seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (Inventar, Auswertung in beide Richtungen, Byte-Identität); spk_writer::tests

# text
seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

# text
seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 Orekit liest { "33" } Kshana-Dateien, L2 Kshana liest { "31" } Orekit-Dateien, L3 { "135" } Datensatzrotationen; Befunde festgehalten); adm::tests; ndm_xml::tests

# text
seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

# text
seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 Orekit liest { "30" } Kshana-Dateien, L2 Kshana liest { "25" } Orekit-Dateien; Befunde festgehalten und als wiederkehrend festgestellt); odm::tests

# text
seg-2e7fd9b81080 = attitude_budget::tests (das GG-Drehmoment verschwindet für einen symmetrischen Körper, wächst mit abnehmender Höhe, linear in ΔI, RSS-Quadratursumme, Varianzanteile summieren sich zu 1); tests/attitude_gg_torque_reference.rs ({ "20" } Fälle gegenüber einem unabhängigen GG-Drehmoment mit vollem Tensor T=(3μ/R³)(n̂×(I·n̂)), numerisch über die Lage maximiert mit Hipparchus { "3.1" } linalg; schlechtester rel. Wert { "6e-15" }, + veröffentlichtes Wertz/Sidi-Band O({ "1e-6" }) s⁻²); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } Fälle gegenüber Basilisk { "2.9.1" } GravityGradientEffector: Maximum bei der Lage von { "45" } Grad innerhalb von { "1e-12" } relativ, schlechtester Wert { "2.1e-15" }; kein Drehmoment oberhalb des Maximums über { "2000" } zufällige Lagen je Fall, { "3" } diagonale und { "5" } allgemeine Trägheitstensoren, { "5" } Höhen)

# text
seg-49b30066ff1b = passes::tests (lineare Interpolation des Durchgangs + entartungssicher, Überflüge von polar→mittlere Breite, höhere Maske ⇒ weniger oder gleich viele); tests/ground_station_pass_prediction_reference.rs ({ "22" } Szenarien / { "129" } Überflüge gegenüber Orekit { "12.2" } ElevationDetector; schlechtestes |Δ| AOS/LOS { "0.0000" } s, maximale Elevation { "0.0014" }°, Gesamtzugang { "0.0001" } s, identische Überflugzahl)

# text
seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

# text
seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } Fälle, { "1210" } Überflüge: AOS/LOS innerhalb von { "3.4e-6" } s, Zielwert { "5" } ms; maximale Elevation innerhalb von { "5.5e-7" } Grad, Zielwert { "1e-3" } Grad; { "8979" } scheinbare Richtungen innerhalb von { "8.8e-7" } Grad, Zielwert { "1e-4" } Grad); tests/earth_orbit_path_sgp4_erfa_oracle.rs (der Pfad); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (Befund aus Runde 1, festgehalten; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

# text
seg-b985f72dcdf4 = linkbudget::tests (Form des Freiraumverlusts, Schluss der Streckengleichung); tests/one_way_link_budget_reference.rs (DESCANSO/JPL Galileo X-Band-DCT Ende-zu-Ende reproduziert + { "6" } ITU-R-P.525-FSL-Fälle über die DSN-Bandmitten S/X/Ka; schlechtestes |ΔFSL| { "4.6e-3" } dB, |Δcarrier| { "2.5e-2" } dB)

# text
seg-ca02c7483ba8 = lunar_time::tests (Rate in geschlossener Form; Rundlauf); tests/lunar_coordinate_time_reference.rs (LTC-Eigenpotential- und säkulare Ratenterme gegenüber veröffentlichten Werten von Ashby & Patla { "2024" } + geozentrische Mondgeschwindigkeit gegenüber JPL DE440)

# text
seg-7ef514b90798 = frame_eop::tests und realtime_frame_eop::tests (alle drei Komponenten tragen gleiche, elementweise identische, streng aufsteigende Epochenmengen über beide echten IERS-Auszüge; die gemeinsame Menge fällt auf die Schnittmenge zusammen, wenn die beiden Bulletin-B-Blöcke tatsächlich voneinander abweichen, und ein Horizont ohne gemeinsame Zeilen wird ausgelassen statt mit Nullen aufgefüllt; die Leere der Tabelle Vorhersage gegen Endwert wird im Dokument ausdrücklich angegeben, statt durch ein fehlendes Feld nahegelegt zu werden; ein echter zweiter Vintage füllt sie, Zeile für Zeile gegengeprüft; ein fehlender späterer Vintage ist ein Fehler, keine stille leere Tabelle); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (Tabellen { "3" }, { "4" } und { "6" } des Szenarios Ende-zu-Ende: Epochenmengen exakt, UT1- und Polstatistiken innerhalb von { "1e-9" }, die Kombination am Mond innerhalb von { "1e-5" } einer vollständigen ERFA-Rotation, der angegebene Status jedes Falls Vorhersage gegen Endwert); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } bis { "1.100" } bei { "1" } bis { "90" } Tagen); Zeilenzählung: tests/embedded_eop_vintage_astropy_preregistered.rs (Zeile mit Offline-Eingabe); Regression aus Runde 1: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

# text
seg-8d703fef00d5 = realtime_frame_eop, eop

# text
seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (sechs exakte Kriterien: die Bytes des Auszugs; { "174" } Zeilen; Zählungen je Vintage und vollständige MJD-Listen 30/54/90; Flag P sowohl bei Polarbewegung als auch UT1 jeder vorhergesagten Zeile; die Zählung des nackten Standardlaufs; jede vorhergesagte Zeile gleich IERS Bulletin A Vol. XXXIX No. { "039" } innerhalb ihrer letzten gedruckten Stelle, schlechtester Wert { "5.0e-5" } Bogensekunden und { "4.9e-6" } s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (Regressionsanker des alten 32-Zeilen-Auszugs unter dem Flag-Klassifikator: { "20" } final, { "12" } rapid, { "0" } predicted); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (der Befund aus Runde 1, beibehalten); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs

# text
seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

# text
seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } Verzögerungen zu { "25" } Epochen nahe J2000 über DSS-14, DSS-43 und DSS-63: Verzögerungen innerhalb von { "1" } ps, schlechtester Wert { "0.06" } ps; Bake-Partialableitungen im Körperbezugssystem innerhalb von { "1e-6" }, schlechtester Wert { "7.4e-9" }; ITRF93-Stations-Partialableitungen innerhalb von { "1e-6" }, schlechtester Wert { "3.8e-11" }); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (Gegenprüfung der Kernel-Auswertung); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests

# text
seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

# text
seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } de440s.bsp-Zustände und { "200" } MOON_PA_DE440-Rotationen zu { "200" } Epochen 1849-2150 und zufälligen Körperpaaren, gezogen aus dem eigenen Hash des Vorregistrierungs-Commits, gegen SPICE und ANISE auf zugeschnittenen Kerneln, die bitidentisch zu denen der NAIF sind: schlechteste Abweichung { "0.6" } % ihres Zielwerts, { "1.95e-3" } m absolut); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (dasselbe auf den vollständigen NAIF-Dateien, SHA-256 geprüft; datenabhängig freigeschaltet); tests/naif_kernel_reader_check.rs (technische Schutzprüfung, kein Beleg); naif_kernel::tests; ephem_provider::tests

# text
seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } Bibliothekstests: die Aufteilung ist additiv und rekonstruiert dy; eine Gleichtakt-Kovarianz liefert ein positives Gleichtakt-Schutzniveau, während eine reine Paritäts-Kovarianz ein nahezu verschwindendes liefert; der Projektor annulliert range(G)); tests/lunar_common_mode_integrity_reference.rs (die Aufteilung der Engine gegenüber einer unabhängigen numpy-Berechnung auf byteidentischen Eingaben über die eingecheckte Stichprobe mit 366 Epochen, relativer UND absoluter Fehler < { "1e-3" }); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } Fälle mit Parität auf der Geometrie mit 8 Satelliten und einer Teilmenge mit 6 Satelliten über beide echten Inter-Ephemeriden-Paare: blind_dx, Residuum und Normen innerhalb von { "1e-12" } von |dy|, schlechtester Wert { "1.06e-14" })

# text
seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

# text
seg-63056b57baab = lunar_combination::tests (rekonstruiert die simulierte Wahrheit; VLBI stellt die 3-D-Beobachtbarkeit der Station wieder her; deterministisch); tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } Geometrien × { "16" } Parameter, je { "31" } Beobachtungen, gegenüber Orekit { "12.2" } / Hipparchus Levenberg-Marquardt auf identischen Beobachtungen; rekonstruierter Zustand schlechtestes |Δ| { "1.4e-8" } m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (sechs Netze, darunter eines ohne VLBI: Gauss-Newton-Schritte innerhalb von { "4.3e-11" }, formale Sigmas innerhalb von { "1.9e-11" }, Stationsfehler gleich; bei den portablen Mathematik-Eingaben { "0.36" }, { "2.4e-11" } und { "1.3e-11" } bei den Eingaben { "0.30" })

# text
seg-ef4de80a0e79 = fim

# text
seg-6a5729ed13c5 = tests/fim_observability_reference.rs (Eigenwerte gegenüber numpy.linalg.eigh; CRLB-Kovarianz gegenüber σ²(XᵀX)⁻¹ über numpy.linalg.inv; GNSS-GDOP/PDOP/HDOP/VDOP/TDOP aus der Informationsmatrix gegenüber numpy — alle abgeglichen auf { "1e-9" }); fim::tests (Jacobi-Eigenlöser gegenüber Spektren in geschlossener Form; CRLB gegenüber den geschlossenen Formen von Kay { "1993" } — DC-in-WGN σ²/N und Geradenanpassung σ²(XᵀX)⁻¹; Erreichen der CRLB im Monte-Carlo; Moore–Penrose-Identität MM⁺M=M; Nullraum des Datumsdefekts)

# text
seg-454f4440a5c8 = lunar_frame_realise::tests (rekonstruiert die eingespeiste Helmert-Transformation); tests/lunar_reference_frame_realisation_reference.rs ({ "14" } Fälle gegenüber einem unabhängigen Umeyama-SVD-Löser in geschlossener Form; schlechtestes |Δ| Translation { "2.0e-5" } m, Rotation { "5.3e-12" } rad, Maßstab { "9.3e-2" } ppb, RMS nach der Anpassung { "6.1e-9" } m)

# text
seg-86ded53b2aac = lunar_service::tests (DOP verwendet den validierten Kernel wieder; PL reduziert sich auf den Südpolfall); tests/lunar_navigation_service_volume_reference.rs (MCI-Position je Satellit auf <{ "1e-3" } m + EXAKTE Menge sichtbarer Satelliten über den gesamten Durchlauf aus Gitter×Epoche gegenüber ANISE { "0.10.2" })

# text
seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

# text
seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (die { "210" } primären AFS-Q-Codes immer; mit KSHANA_LANS_RUN und dem LSIS-Cache alle { "630" } Codes, null Chip-Abweichungen); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (mit dem LSIS-Cache: { "3" } Frames, null Symbol-Abweichungen; { "24" } eingecheckte { "2" }-ms-Fenster, |rho| = { "0.999990" }); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (datenabhängig freigeschaltet: ganzer Lauf über { "23.9" } s, |rho| = { "0.999990" }, schlechtester { "2" }-ms-Block { "0.999948" }, Phase { "8e-9" } rad)

# text
seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

# text
seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (mit dem LSIS-Cache: die { "3" } Frames, die LANS-AFS-SIM sendet, aus derselben FID, TOI und denselben Datenbits aufgebaut: null von { "18 000" } Symbolen weichen ab); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (LSIS Abbildung { "8" }: 0x045 -> 0x229f61dbb84a0; CRC-24/LTE-A-Prüfwert 0xCDE703; läuft immer); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } Codewörter, null unerfüllte Prüfungen der gedruckten H); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (Decoder allein aus H, rauschfrei und bei { "3" } dB Es/N0, und { "10" } vollständige Frames); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests

# text
seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

# text
seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } Kanäle: schlechteste Pseudostrecke { "1.6e-3" } m gegen { "0.05" } m, Codephase { "5.5e-6" } Chip gegen { "2e-4" }, Doppler { "7.4e-5" } Hz gegen { "0.02" } Hz, Blickwinkel { "4e-9" } Grad gegen { "1e-4" }, sichtbare Menge identisch); tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (der Referenz-Harness reproduziert die vom Programm selbst gedruckte Kanalliste exakt)

# text
seg-80e62d2d7748 = lunar_service::tests (topozentrisch gegenüber von Hand berechneter Geometrie: im Zenit, genau nördlich/östlich/westlich, antipodal und die entartete Ostrichtung am Pol; das exportierte Sichtbarkeits-Flag stimmt mit dem unabhängigen Sichtbarkeitsfilter über einen vollständigen Durchlauf von { "6" } h überein; der Export ist standardmäßig aus und ändert nachweislich nichts anderes; Schutzniveaus sind exakt linear im verwendeten Sigma, während die darunterliegende Geometrie unberührt bleibt); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } Stichproben über { "8" } Standorte, { "12" } Epochen und { "8" } Satelliten gegenüber ANISE { "0.10.2" }: Azimut und Elevation innerhalb von { "1e-6" } Grad, Entfernung und Standortposition innerhalb von { "1" } mm; schlechteste Werte { "2.2e-12" } Grad, { "2.1e-13" } Grad, { "5.6e-9" } m)

# text
seg-5613845e8514 = attitude_dynamics::tests (apply/solve inverse, spherical-top zero torque, principal-axis fixed point, short-run energy+momentum conservation, q̇=½q⊗ω, symmetric-top rate sign + body-cone precession); tests/attitude_dynamics_reference.rs ({ "200" } 000 drehmomentfreie Läufe mit je einem Schritt: |q|={ "1" } auf { "1e-10" }, kinetische Energie T=½ωᵀIω erhalten auf { "1e-9" } rel., |Iω| und der inertiale Drehimpulsvektor erhalten auf 1e-9/1e-8 rel., jeweils mit einer triaxialen und einer allgemeinen nichtdiagonalen Trägheit; Körperkegel-Präzession des symmetrischen Kreisels, abgeplattet + gestreckt, reproduziert auf { "1e-6" } gegenüber dem analytischen λ=ω₃(I_a−I_t)/I_t); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (zwei allgemeine nichtdiagonale Trägheiten, { "1e4" } s drehmomentfrei gegenüber dem Basilisk-{ "2.9.1" }-Raumfahrzeug-Hub mit RKF78: Quaternion innerhalb von { "1e-9" }, schlechtester Wert { "3.3e-11" }; Körperraten innerhalb von { "1e-9" } rad/s, schlechtester Wert { "3.4e-12" })

# text
seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

# text
seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, quer zur Bahn entkoppelte harmonische Schwingung); tests/cw_dynamics_reference.rs (Φ in geschlossener Form gegenüber einer unabhängigen RK4-Integration mit fester Schrittweite derselben Hill-Gleichungen auf <{ "1e-6" } über ein Drittel einer Bahn; Φ(t)Φ(−t)=I auf { "1e-9" }; die beschränkte Bedingung ẏ₀=−2n·x₀ schließt den vollen Zustand nach einer Periode auf { "1e-9" } ohne säkulare Drift in Bahnrichtung über { "10" } Bahnen; ein reiner radialer Versatz driftet analytisch um −12π·x₀ pro Bahn); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (vier Fälle bei { "100" } m über ein Drittel einer Bahn von { "500" } km: schlechtester Wert { "1.15e-7" } m gegen { "1e-3" } m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (allein das lineare Φ: { "1.2" } bis { "6.3" } mm, festgehalten)

# text
seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

# text
seg-e9749b2960a2 = tests/entry_stardust_published.rs (Spitze { "35.44" } g gegen veröffentlichte { "33.4" } g, +{ "6.1" } %, Zielwert { "10" } %; planetenrelative Eintrittsgeschwindigkeit { "12.551" } km/s gegen { "12.6" }, Zielwert { "0.1" } km/s); entry_eo_ascent::entry_heating::tests (die Energie im rotierenden System fällt genau um die Widerstandsarbeit; der Freiflug im Vakuum erhält die Jacobi-Energie; der nichtrotierende ballistische Fall stimmt mit dem ebenen Massepunkt des Reentry-Moduls überein; die geschlossene Form nach Allen-Eggers in ihrem Gültigkeitsbereich)

# text
seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

# text
seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } Fälle, je { "601" } Stichproben: MRP schlechtester Wert { "2.4e-14" }, Zielwert { "1e-9" }; Körperrate { "1.6e-15" } rad/s, Zielwert { "1e-9" }; Radgeschwindigkeit { "2.9e-11" } rad/s, Zielwert { "1e-6" }; aufgebrachtes Motordrehmoment { "1.2e-13" } N m, Zielwert { "1e-9" }; t = { "0" }-Drehmomente innerhalb von { "1e-12" } N m; Sättigung in beiden Werkzeugen erreicht); aocs::tests (Drehimpuls erhalten, minimalnormige Abbildung, MRP-Zweig, Konvergenz unter Sättigung); aocs_kind::tests

# text
seg-ec141da2fe8e = wahba

# text
seg-7ece946b2cb0 = wahba::tests (A(Einheitsquaternion)=I; der Jacobi-Eigenlöser erfüllt Kv=λv und erhält die Spur an einer bekannten symmetrischen Matrix; K ist symmetrisch); tests/wahba_reference.rs (TRIAD, Davenports q-Methode und QUEST reproduzieren die optimale DCM von scipy.spatial.transform.Rotation.align_vectors auf rauschfreien gewichteten Vektormengen auf <{ "1e-9" } rad über den bezugssystemunabhängigen Lagefehlerwinkel; außerdem rekonstruiert die q-Methode eine bekannte Rotation mit λ_max=Σ Gewichte und null Wahba-Verlust, die Lösung der q-Methode minimiert den Wahba-Verlust unter Störung, QUEST stimmt mit der optimalen q-Methode auf <{ "1e-7" } rad überein, und der optimale Schätzer schlägt das Zwei-Vektor-TRIAD im RMS-Lagefehler über { "2000" } verrauschte Monte-Carlo-Läufe)

# text
seg-e35ff28ef879 = acquisition

# text
seg-e6a7ff99874a = acquisition::tests (zentraler Fall von Marcum-Q Q_1({ "0" },b)=exp(−b²/2); die Identität P_d=Q_M(√(2Mρ),√γ); Rundlauf P_fa↔Schwelle über M und P_fa; ROC-Monotonie — P_d steigt mit dem SNR, fällt mit der Schwelle, P_d→P_fa für SNR→{ "0" }; der Gewinn der nichtkohärenten Integration hebt P_d bei festem P_fa; Marcum-Q monoton in a und b und beschränkt auf [{ "0,1" }]); tests/acquisition_reference.rs (das verallgemeinerte Marcum Q_M(a,b), P_d, P_fa und die Inversion P_fa→Schwelle abgeglichen gegenüber scipy.stats.ncx2/chi2 über ein Gitter (M,a,b)/(M,P_fa)/(M,SNR) auf ~{ "1e-6" })

# text
seg-4f480ce145f7 = lambda

# text
seg-7c55c072cfb7 = lambda::tests (L D Lᵀ rekonstruiert Q); tests/lambda_reference.rs (die Z-Transformation ist unimodular |det Z|={ "1" } mit Q_z=ZᵀQZ SPD, determinantenerhaltend und mit geringerer gesamter Nebendiagonal-Korrelation; der Schnorr–Euchner-ILS stimmt mit erschöpfender Aufzählung über { "300" } zufällige Kovarianzen überein; die vollständige Pipeline Dekorrelieren→Suchen→Rücktransformieren ergibt dasselbe wie der direkte ILS, und Z⁻ᵀZᵀ bildet Ganzzahlen im Rundlauf ab; die Bootstrapping-Erfolgsrate in geschlossener Form stimmt mit einem Monte-Carlo mit 200k Läufen sequentieller bedingter Rundung auf <{ "0.01" } überein); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (die fixierten Ganzzahlen sind gleich RTKLIB v2.4.2-p13 lambda() bei { "300" } zufälligen Kovarianzen, n { "2" } bis { "10" }, davon { "226" } nicht durch Runden lösbar; die beiden besten quadrierten Normen stimmen auf { "1e-9" } relativ überein, gemessen { "5.6e-13" })

# text
seg-18befb9e9596 = bplane

# text
seg-5eb675d6585e = bplane::tests (die Vorbeiflug-Skalare erfüllen die geschlossenen Formen mit zwei übereinstimmenden |B|-Identitäten und |B|>r_p; der Ablenkwinkel nimmt mit dem Periapsisradius ab und erreicht die Grenzwerte δ→{ "0" } / δ→π; die Ablenkung erhält die Geschwindigkeit v∞ und dreht genau um δ; der Betrag des Assist-Δv ist gleich { "2" }·v∞·sin(δ/2) und durch { "2" }·v∞ beschränkt; die Achsen der B-Ebene sind orthonormal und ⊥ Ŝ mit |B|²=(B·T̂)²+(B·R̂)²; der Tisserand-Parameter ist invariant gegenüber einer v∞-erhaltenden Ablenkung, die a,e,i tatsächlich ändert, und ist gleich { "3" }−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

# text
seg-3111857b93df = crpa

# text
seg-d333f700ca8a = crpa::tests (Identitäten der komplexen Arithmetik einschließlich z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|²; deterministische Nullsteuerung liefert exakt einen Einheitsgewinn des SV und <{ "1e-9" }-Störernullen an einem 4-Element-ULA mit { "3" } Störern; ein N-Element-Array unterdrückt >N−{ "1" } Störer nicht und legt bei weniger Störern minimalnormige Nullen; MVDR bleibt in Richtung des SV verzerrungsfrei, während sich die Störernull mit der Störerleistung monoton bis <{ "1e-3" } bei { "60" } dB vertieft); tests/crpa_reference.rs (die MVDR- und minimalnormigen Nullsteuerungs-Gewichtsvektoren und die resultierenden Array-Antwortgewinne abgeglichen gegenüber einer unabhängigen numpy/scipy-LAPACK-Berechnung auf ~{ "1e-9" })

# text
seg-97d39969aa50 = powerlaw

# text
seg-213c2856bc78 = powerlaw::tests (jeder reine Rauschtyp zeigt seine charakteristische ADEV-Log-Log-Steigung — White FM −½, Flicker FM { "0" }, Random-Walk FM +½, White PM −{ "1" }; der Flicker-FM-Term ist ein flacher Boden gleich √({ "2" } ln2·h_{ "{" }-1{ "}" }) über fünf Dekaden von τ; die Anpassung der FM-Familie bildet bekannte h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 aus einer synthetischen Kurve auf <{ "1e-6" } im Rundlauf ab; und der Boden einer flickerdominierten Kurve wird hier wiedergewonnen, während die Anpassung auf Driftbasis (quantum_trade::qparams_from_adev_curve) bei langem τ um >{ "10" } % falsch liegt — schließt eine dokumentierte Lücke); tests/powerlaw_oadev_reference.rs (σ_y(τ) abgeglichen gegenüber den geschlossenen Formen von allantools { "2024.06" } Noise.adev über die τ-Stufen für alle fünf Rauschtypen, außerdem eine Bestätigung des h_a-Niveaus durch den Kasdin-Generator von allantools mit dem oadev-Schätzer)

# text
seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

# text
seg-c3f4fe461c45 = oem::tests (eine symmetrische positiv definite Kovarianz bildet den Rundlauf KVN→Parsen bis auf f64-Rundung ab und bleibt symmetrisch; der Block gibt genau die { "21" } Einträge des unteren Dreiecks aus — i+{ "1" } je Matrixzeile — mit/ohne COV_REF_FRAME; ein Block mit falscher Wertanzahl und ein fehlender Block werden beide abgelehnt); tests/ccsds_oem_covariance_reference.rs (die unabhängige Bibliothek oem { "0.4.5" } parst ein von kshana ausgegebenes OEM-Segment und rekonstruiert die symmetrische { "6" }×{ "6" }, übereinstimmend mit der Eingabe-Kovarianz von kshana bis auf f64-Rundung; mit einer gestörten negativen Kontrolle und einer Prüfung, dass oem die beschriftete CX_X-Variante ablehnt)

# text
seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — derselbe unabhängige CCSDS-502-Parser, dem auch die validierte Zeile 'CCSDS OEM interoperability' vertraut, eine völlig getrennte Codebasis (eigener KVN-Tokenizer, eigene Zustandsmaschine für den Kovarianzabschnitt und eigener numpy-Matrixaufbau). kshana gibt ein vollständiges OEM-Segment aus, das seinen unbeschrifteten COVARIANCE-Block mit blanken Zahlen im unteren Dreieck trägt; oem parst es und rekonstruiert die symmetrische { "6" }×{ "6" }, übereinstimmend mit der Eingabe-Kovarianz von kshana Element für Element bis auf f64-Rundung — ein echter Interop-Rundlauf von Bibliothek gegen Bibliothek (verglichen mit der Rekonstruktion von oem, nicht mit einem erneuten Parsen durch kshana), der die frühere Lücke der Zeile 'kein Fixture eines Dritten' schließt

# text
# c1: ins-trn-coast
seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); Szenariotyp <c1/>

# text
seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } Punkte, sechs Fehlerterme bei { "30" } s bis { "3600" } s, Klasse Tactical, { "45" } Grad N, waagerecht und nach Norden ausgerichtet: jeder Punkt innerhalb von { "5" } %, schlechtester Wert +{ "3.70" } % Geschwindigkeits-Random-Walk bei { "1200" } s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (der Befund aus Runde 1 zu den Gesetzen führender Ordnung bei flacher Erde, als Regression beibehalten)

# text
seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } Bibliothekstests: die analytische Jacobi-Matrix gegenüber einer zentralen finiten Differenz von lunar_vlbi::vlbi_delay_s, genommen über einen Weg, der die eigenen Koordinaten des Zustands vorwärts rotiert und nie eine partielle Ableitung berührt, übereinstimmend auf < { "1e-6" } von 1/c je Spalte, wobei die beiden Informationsmatrizen auf < { "1e-6" } der größten Diagonale und die Kovarianzen auf < { "1e-5" } relativ übereinstimmen; eine orthogonale Einheitsgeometrie, deren Kovarianz je Achse in geschlossener Form c·σ_τ auf { "1e-12" } beträgt, was auch der einzige Fall ist, in dem die Gleichverteilungs-Verknüpfung exakt ist; das Kovarianzspektrum und das 3-D-Sigma jeder Station invariant unter einer starren Rotation des gesamten Netzes auf { "1e-9" }, mit blockweise festgehaltenem C_rot = R·C·Rᵀ UND einer ausdrücklichen Zusicherung, dass sich die Sigmas je Achse tatsächlich bewegt haben, sodass der Test nicht leer bestehen kann; Kovarianzskalierung genau wie σ² und wie 1/N; die AM-HM-Spurschranke wird nie unterboten; der Verzögerungsschluss τ_ik = τ_ij + τ_jk auf ein ULP festgehalten bei den Verzögerungen und bei den Jacobi-Zeilen, wobei eine redundante Basislinie nachweislich Information hinzufügt, aber nie den Rang; eine einzelne Epoche als rangdefizient mit leerer Kennzahl gemeldet; ein längerer Bogen nachweislich besser konditioniert bei gleicher Beobachtungszahl; der Bake-Block auf diesem Plan als nicht beobachtbar gezeigt; die vernachlässigte differenzierte Shapiro-Partialableitung zur Laufzeit per finiter Differenz gemessen und ausgegeben, statt sie wegzuwinken); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (Standardnetz mit Verankerung und freies Netz: mit SPICE gebaute Jacobi-Matrix, der Plan mit 16 Beobachtungen identisch, Stations-Sigmas innerhalb von { "2.2e-3" }, Eigenwerte { "2.3e-3" }, Kondition { "2.4e-3" }, Kennzahl { "1.0e-3" }, Sichtlinie { "0.018" } Grad, Deklination { "0.007" } Grad, gegen Zielwerte von { "1" } % und { "0.1" } Grad; freies Netz Rang 8/9 mit leerer Kennzahl, Nullraum { "0.006" } Grad auseinander; NumPy auf der eingecheckten Jacobi-Matrix auf { "2e-13" })

# text
seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } Beobachtungen identisch; Rang 3/3; Eigenwerte innerhalb von { "5.9e-5" }; Kondition { "5.9e-5" }; Bake-Sigmas innerhalb von { "1.7e-3" } gegen { "1e-2" }; RMS { "2.9e-5" }; Hebelarm { "1.4e-8" }; P2-Sigmas { "3.9e-14" } gegen { "1e-9" }); lunar_vlbi_fim::tests

# text
seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

# text
seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } Servicevolumen-Fälle — südpolar, mittlere Breite, äquatorial, angehobenes Hochland — { "6" } bis { "19" } Satelliten, σ_URE 10/30/60 m, P_HMI { "1e-3" } bis hinunter zu { "1e-7" }, Schutzniveaus von { "1.7e2" } bis { "6.9e3" } m: HPL/VPL gegenüber der zusammengesetzten Referenz aus RTKLIB + SciPy, schlechtestes |Δ| { "1.061e-8" } m und { "1.044e-8" } m gegen eine Toleranz von { "1e-6" } m; DOP gegenüber dem eigenen (GᵀG)⁻¹ von RTKLIB auf { "1.790e-14" } relativ; K_fa gegenüber scipy.stats.norm.isf auf { "2.716e-11" } relativ; drei negative Kontrollen — eine Satellitenverschiebung um { "5" } km, eine relative σ_URE-Änderung von { "1e-6" } und ein um { "0.1" } % engeres P_HMI — von denen jede das Schutzniveau nachweislich um mindestens das { "171" }-Fache der Toleranz verschiebt; und eine Schutzprüfung gegen veraltete Fixtures, die die eingecheckte Geometrie bitgenau auf das festlegt, was der eigene Konstellations- und Sichtbarkeitscode der Engine erzeugt, sodass ein Grün nicht überleben kann, wenn sich die Konstellation darunter ändert)

# text
seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

# text
seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } veröffentlichte Vektoren + { "6" } negative Kontrollen, Fixture tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: das Weglassen der nominalen Verzerrung verfehlt das veröffentlichte VPL um { "2.6457" } m, ein ISM-Fehler von { "10" } % um { "0.2798" } m, K_fa bei { "57" } Modi statt { "12" } um { "0.4015" } m, ein Integritätsvarianzfehler von +{ "2" } %/+{ "5" } % um 0.0750/0.1971 m — und ein Fehler von +{ "1" } % verschiebt es nur um { "0.0339" } m, als Auflösungsgrenze der Prüfung gemeldet statt verborgen; die Antworten der beiden Dokumente verfehlen jeweils die des anderen um mehr als die Toleranz, die Vektoren sind also nicht austauschbar; das eingecheckte Fixture und die kompilierten Konstanten sind zwei unabhängige Abschriften, deren Übereinstimmung zugesichert wird, sodass eine veröffentlichte Zahl nicht auf einer Seite geändert werden kann, um eine Prüfung bestehen zu lassen; und C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² gilt für alle { "40" } abgeschriebenen Varianzen, eine arithmetische Identität, die ein Abschreibfehler brechen würde)

# text
seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (composing fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

# text
seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } Tests: alle { "15" } eingecheckten CRD-Dateien byteidentisch mit ihren aufgezeichneten Digests; alle { "349" } Datensätze berücksichtigt, { "337" } verwendet und { "12" } aus einem benannten Grund übersprungen; jede archivierte Strecke innerhalb der echten Perigäum/Apogäum-Hüllkurve; die Gewichte erweisen sich als bin_rms/√n_raw; die Sichtlinienkoordinate für jedes Array am besten bestimmt, wobei der Librationsdurchlauf, der sie erkauft, getrennt gemessen wird; das Residuum und seine unabhängige Bestätigung gegenüber JPL Horizons; die Empfindlichkeit gegenüber 0.1 Grad Geometrieneigung; der Vergleich mit der simulierten Kampagne erweist sich als gleich mit einem unabhängigen Lauf dieses Szenarios; eine bitgenaue R1-Festlegung der drei bereits bestehenden Pakete des Mondbezugssystems); lunar_llr::tests ({ "12" }: die Streckenpartialableitung gegenüber einer zentralen finiten Differenz der modellierten Laufzeit auf < { "1e-6" } relativ; die Lichtlaufzeit eine konvergierte Mond-Hin-und-Rück-Strecke; das Datum-Sigma exakt linear im Gewichtsmaßstab auf { "1e-9" }; Blockdiagonalität exakt; ein fehlendes Datenverzeichnis wird abgelehnt statt ersetzt; eine bearbeitete Katalogzeile wird durch ihre eigene Radiusspalte erkannt); realdata::llr_crd::tests ({ "7" }: Feldsemantik, Mitternachtsüberlauf, Ablehnung einer nicht-UTC-Zeitskala und einer nicht unterstützten Formatversion sowie kein ersetztes Sigma für ein leeres Bin); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, festgehalten; reported_residual_is_the_engine_to_spice_light_time_gap); tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } ungesehene Normalpunkte aus 2025-Q2; Sigmas und Normen schlechtester Wert { "1.11e-3" } von { "1e-2" }, Kondition { "8.95e-4" } von { "2e-2" }, Verhältnisse { "1.79e-3" } von { "2e-2" }, Buchführung, Ränge und Kopplung exakt)

# text
seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } ungesehene Normalpunkte aus 2019-Q2; Sigmas und Normen innerhalb von { "4.0e-5" } von { "1e-2" }, Kondition { "1.6e-5" } von { "2e-2" }, Verhältnisse { "7.6e-5" } von { "2e-2" }, Buchführung und Ränge exakt); tests/validate_llr_datum_kernel_moon.rs (die Diagnose mit gesehenen Daten aus { "2015" }, { "0.049" } % bei tz; kein Beleg für diese Zeile); lunar_llr::tests

# text
seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

# text
seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } wöchentliche geozentrische Zustände, Winkel der schlechtesten Epoche zugesichert < { "0.3" }° und RMS < { "5e5" } m gegenüber der eigenen dokumentierten Aussage des Moduls, dazu das LLR-Residuum zugesichert als übereinstimmend mit der radialen Abweichung auf < { "5" }×); ::the_measured_residual_is_the_ephemeris_error ({ "337" } echte Normalpunkte)

# text
seg-e6eeb246d545 = integrity::tpl_scalar::tests (Rang 1, Fusion/Ausschluss, Verzerrungsdominanz, Gegenprüfung des Integritätsrisikos); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } eingecheckte Fälle: numpy-lstsq-Teilmengenschätzer, allgemeine Trennungskovarianz, scipy-brentq-PL; PL innerhalb von { "1e-9" } relativ, schlechtester Wert { "1.2e-10" }; bestimmende Teilmenge exakt)

# text
seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } eingecheckte SPD-Fälle: Faktor, gewichtetes Residuum, Weißungsoperator und Mahalanobis-Quadrat gegenüber numpy-LAPACK innerhalb von { "1e-12" } relativ, schlechtester Wert { "7.9e-16" })

# text
seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } eingecheckte Fälle: alpha_ss, alpha_cm und das Minimum innerhalb von { "1e-12" } relativ bei { "210" } gut konditionierten und Randfällen, schlechtester Wert { "3.3e-15" }; { "40" } schlecht konditionierte bis zur Kondition { "1.3e8" } innerhalb einer angegebenen, konditionsskalierten Schranke, schlechtester Wert { "1.1e-9" }; sechs exakte Unendlichkeiten)

# text
seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } synthetische 7x7-SPD-Matrizen, die von gut konditioniert bis { "{" }{ "0,3" }{ "}" }-nahezu entartet reichen; Schur-lambda_min / Ursprungs-CRLB / |corr| gegenüber SciPy/NumPy auf <{ "1e-9" } rel)

# text
seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } zufällige Epochen zwischen den Stützstellen gegenüber SPICE pxform auf dem binären PCK: Rotationswinkel innerhalb von { "1.7e-5" } rad, schlechtester Wert { "1.7e-6" } rad, { "3" } m beim mittleren Radius)

# text
seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

# text
seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } ILRS-Normalpunkte: RMS { "2.81" } m; die beiden ITRF2020-Stationen allein { "2.96" } m; beide höchstens { "10" } m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (das abgelöste geozentrische Lichtlaufzeitmodell, { "10.94" } m, festgehalten)

# text
seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } Eigenwerte, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm und die Schur-Marginale { "{" }scale,offset{ "}" } für die Netze well_posed mit 120 Zeilen und single_epoch mit 30 Zeilen, auf rel<{ "1e-3" } und abs<{ "1e-3" }); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

# text
seg-9f0fd0918105 = lunar_gauge, lunar_time

# text
seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m innerhalb von { "2.8e-6" } von Ashby und Patla { "2024" } mit J2 aus AIUB-GRL350A/B; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: der radiale Eintrag innerhalb von { "8.3e-5" } der äquatorialen Schwere von pyshtools bei Grad 350; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: der Geschwindigkeitseintrag innerhalb von { "2.5e-3" } der Mondgeschwindigkeit aus DE441 zu { "2000" } Epochen); lunar_gauge::tests; Regression tests/lunar_rate_frame_coupling_oracle.rs

# text
seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - eine achsenparallele Nullbasis und ihre Rotation um { "0.6" } rad liefern identisches defect, dim_spatial, dim_temporal, coupled_dim und p_st_norm; classify_direct_sum_null und classify_coupled_null - konstruierte direkt summierte und echt gekoppelte Fälle bestätigen die Dimensionszerlegung; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } konstruierte 9x9-Fisher-Matrizen über { "18" } Nullunterräume, jeweils in vier zufälligen orthonormalen Neubasen: defect, dim_spatial, dim_temporal und coupled_dim exakt; p_st_norm innerhalb von { "6.0e-15" }, Zielwert { "1e-9" })

# text
seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible für { "3" } Anbieterpaare gegenüber der unabhängigen SciPy-SVD-lstsq-Anpassung in tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m; Fixtures + Referenz byte-konsistent über scripts/gen_interop_ref.py auf den öffentlichen Kerneln DE440/INPOP21a/EPM2021 über IMCCE calceph)

# text
seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: die { "84" }×{ "84" } P⊥ elementweise, trace(P⊥) = parity_dim = { "52" } und rank(G) = { "32" }, Detektierbarkeitsnormen + Flags, die quadratische Form der MDB cᵀWP⊥c + MDB-Wert und die Zählungen des Block-Spark-Erkennens/-Identifizierens für jede Peer-Koalition, reproduziert gegenüber einer unabhängigen numpy/scipy-Referenz auf rel<{ "1e-3" } abs<{ "1e-3" } mit exakten ganzzahligen Zählungen; Eingaben byte-konsistent über examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

# text
seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

# text
seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } MTIE- und { "12" } TDEV-Mittelungsfaktoren auf einer eingecheckten Holdover-Reihe einer Chip-Scale-Atomuhr mit { "2" } 048 Stichproben mit Alterung, Flicker und Temperatur, gegenüber allantools { "2024.06" } auf <{ "1e-12" } / <{ "1e-9" } relativ, beobachtet exakt / { "1.1e-15" }; dieselben Kurven, ausgelesen aus einem vollständigen Telecom-Timing-Lauf, der die CSV einliest); telecom_timing::tests (gleitendes MTIE gleich allan::mtie bei jedem Fenster; von Hand hergeleitetes MTIE und TDEV; monotones MTIE)

# text
seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

# text
seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core); tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline); tests/uncertainty_edf_reference.rs

# text
seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

# text
seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: Anpassung auf dem ersten Drittel der Aufzeichnung, Vorhersage der Ein-Sigma-Überschreitung bei { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } und { "2.5" } ns, gemessen auf den anderen zwei Dritteln ab einem Sync-Punkt alle { "997" } s; Zielwert, vor dem ersten Lauf festgelegt, ein Faktor von { "1.5" } in beide Richtungen; beobachtete Verhältnisse { "0.84" } bis { "1.03" }; eine Kontrolle, die Ein-Sekunden-Allan-Abweichung als White FM gelesen, verfehlt um einen Faktor von etwa { "1 000" } und muss den Zielwert verfehlen; eine Mutation, die den White-FM-Pegel halbiert, lässt den Test scheitern); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)

# text
seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

# text
seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) { "2.046" } MHz und BPSK({ "10" }) { "20.46" } MHz numerisch auf der geschlossenen Form lokalisiert; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — Trägernull, erste Null bei { "2.046" } MHz, Keulenmitte { "1.023" } MHz und das exakte Maximum bei { "0.7590" } MHz gegenüber einer unabhängigen Newton-Lösung von tan y = 2y; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, jeweils innerhalb von { "0.02" } dB; q_values_match_kaplan_hegarty — CW auf dem Träger Q = { "1" }, Rauschen mit angepasstem Spektrum Q = { "1.5" }, flaches Rauschen von Null zu Null Q = { "2.215" }; mboc_is_a_unit_area_one_eleventh_mix)

# text
seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

# text
seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — Boden innerhalb von { "2" } % der Varianz über der Abtastrate, Parseval-Summe innerhalb von { "2" } %, äquivalente Rauschbandbreite des Hann-Fensters { "1.5" } Bins; noise_like_synthesis_is_unbiased_through_welch — Median Welch minus Modell innerhalb von { "0.1" } dB über einen ci16_le-Rundlauf; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (Welch-PSD gegenüber scipy { "1.18.1" } signal.welch je Bin auf { "1e-12" } relativ über { "27" } Fälle, beobachtet { "6.0e-14" }; fünf Aufzeichnungen von sigmf-python { "1.13.0" } bitidentisch mit identischen Metadaten dekodiert; vom Crate geschriebene Aufzeichnungen von sigmf-python bitidentisch zurückgelesen und schemagültig gegen SigMF { "v1.2.6" })

# text
seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

# text
seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (Baryzentren 1800-2050 aus Tabelle { "1" } und { "3000" } v. Chr.-3000 n. Chr. aus Tabelle { "2" }, { "8908" } und { "21857" } Epochen, schlechtester RMS { "0.778" } des Werts aus Tabelle { "8.10.1" }); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: die Erde über AnalyticSolarSystem und icrf_to_ecliptic, RMS { "0.483" } des EMB-Werts; icrf_positions_are_within_the_table_8_10_1_rms: ICRF-Positionen der Körper aus Tabelle { "1" } und der Erde, schlechtester Wert { "0.778" }; earth_minus_barycentre_offset_matches_de441_1950_to_2050: die Aufspaltung der Mondreihe, schlechtester Wert { "0.088" } Grad und { "6.1" } km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Nicht maßgebliche Regression: tests/solar_system_horizons_reference.rs

# text
seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

# text
seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } Positionen zu { "200" } UTC-Epochen 1973-2026, gezogen aus dem Vorregistrierungs-Hash; schlechtester Wert { "0.66" } des Zielwerts, { "2.96" } m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (datenabhängig freigeschaltet); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests

# text
seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

# text
seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (die Baryzentren von Merkur, Venus, Mars, Jupiter und Saturn, die Sonne und der Mond zum Erdmittelpunkt, je { "1576" } Epochen auf interpolierten DE441-Positionen, schlechtester Wert { "6.7e-9" } s gegen { "1e-6" } s); nicht maßgebliche Genauigkeitsangabe für den analytischen Pfad: tests/solar_system_light_time_preregistered.rs (RMS c dLT { "0.17" } bis { "0.30" } des Positionszielwerts aus Tabelle { "8.10.1" }); solar_system::tests

# text
seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

# text
seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } Epochen { "1955" } bis { "2044" }, { "574" } Matrizen innerhalb von { "1e-9" } rad, schlechtester Wert Phobos { "1.43e-10" } rad); tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } Epochen { "1961" } bis { "2038" }, nie zuvor verglichen, { "574" } Matrizen innerhalb von { "1e-9" } rad, schlechtester Wert Phobos { "1.38e-10" } rad); tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } von { "84" } Konstanten der vierzehn Körper weichen von NAIF ab)

# text
seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

# text
seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (alle { "24" } Zeilen für RAAN und mittlere Anomalie auf { "1e-9" } Grad); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (die Slot-Formel des ICD und ein Walker 24/3/1 sind dieselben { "24" } Paare aus Knoten und Breitenargument); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (der Äquatordurchgang der Bodenspur aller { "36" } GPS-Positionen aus RAAN, Breitenargument und dem Stundenwinkel von { "100.765" } Grad: { "35" } innerhalb von { "0.0108" } Grad gegen einen Rundungszielwert von { "0.015" } Grad, und E3F innerhalb von { "0.06" } Grad, weil die eigene E3F-Zeile der Tabelle mit ihrem RAAN und Breitenargument um etwa { "0.06" } Grad inkonsistent ist; die säkulare Knotenregression innerhalb von { "5" } % der -0.0402 Grad/Tag der Tabelle); constellation::tests::walker_geometry_identities_are_exact (die drei Abstandsidentitäten für Delta- und Stern-Muster bis zu { "1 584" } Satelliten, auf { "1e-9" } Grad)

# text
seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

# text
seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP-Median { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, Mittelwert { "0.965" } gegen { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } und { "0.96" }, Zielwert { "0.03" } für jeden, vor dem ersten Lauf festgelegt; PDOP-Median { "1.795" } bei oder unter { "1.815" } aus Tabelle B.3-1 für eine herabgesetzte Mischung aus 20-24 Satelliten; Verfügbarkeit { "100" } % global und am schlechtesten Standort gegen { "98" } % und { "88" } % aus Tabelle 3.8-1); constellation::tests::single_epoch_dop_matches_the_hand_computation (Zenit plus drei Satelliten bei { "30" } Grad Elevation: HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } auf { "1e-9" }, und gleich orbit::dop mit gemeinsamer Uhr)

# text
seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

# text
seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si({ "1" }), Si(pi), Si({ "2" } pi) auf { "1e-12" }; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — { "0.9028" } der Leistung in der Hauptkeule für BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }), und die geschlossene Form gleich der Quadratur auf { "1e-7" } in { "10" }, { "15" }, { "20" } und { "51.15" } MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote — auf { "1e-4" }, und die Asymptote sqrt(B R_c / ({ "2" } pi^{ "2" })); bandlimited_dll_reduces_to_the_textbook_forms — kohärenter Early-Late-BPSK({ "1" }) bei { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } Chip, T { "20" } ms: { "0.0039564" } Chips ({ "1.159" } m) innerhalb von { "1" } %, die nichtkohärente Form gleich navsignal::dll_code_jitter_chips innerhalb von { "1" } %, der Grenzwert verschwindenden Abstands gleich seiner geschlossenen Form auf { "1e-5" }; offset_bpsk_ssc_matches_parseval_closed_form — Offsets { "0" } bis { "3.2" } R_c innerhalb von { "0.01" } dB und -71.86 dB/Hz bei Offset null für BPSK({ "10" }); altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

# text
seg-56f381a3f611 = leo_signal (max_doppler_hz)

# text
seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz innerhalb der veröffentlichten { "32" } bis { "34" } kHz; Iridium ({ "1621" } MHz, { "780" } km) innerhalb von { "0.5" } kHz der veröffentlichten { "36" } kHz

# text
seg-f1cdf8728c6b = Veröffentlichte Zahlen: Xona Pulsar X1 maximaler Doppler { "32" } bis { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridium-Doppler bis zu +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Die Erdrotation bleibt unberücksichtigt, was die Zahl um bis zu etwa { "2.3" } kHz verschiebt; beide veröffentlichten Zahlen werden auch ohne sie erreicht.

# text
seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

# text
seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: alle { "115" } Zeilen von Tabelle { "5" }, { "1" } GHz bis { "1000" } GHz, jeder Koeffizient innerhalb von { "0.6" } seiner letzten gedruckten Stelle; schlechtester beobachteter Wert { "0.51" })

# text
seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

# text
seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: { "56" } Fälle an fünf Standorten, { "14.25" } und { "29" } GHz, { "0.001" } % bis { "1" } %, innerhalb von { "1e-4" } dB; beobachtet { "5e-6" } dB)

# text
seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

# text
seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: { "42" } Fälle an sieben Standorten, { "14.25" } und { "20" } GHz, innerhalb von { "1e-5" } dB; beobachtet { "5e-7" } dB)

# text
seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

# text
seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: { "568" } Werte, { "28" } GHz bei { "0" } Grad und { "2" } GHz bei { "45" } Grad, beide Klassen, P von { "1e-7" } bis { "0.998" }, innerhalb von { "0.001" } dB)

# text
seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

# text
seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^{ "2" } auf { "1e-12" }, Verstärkung L1/L2 und L1/L5 { "2.978" } und { "2.588" }; free_space_loss_is_the_friis_kilometre_megahertz_form: { "32.4478" } + { "20" } log d + { "20" } log f auf { "1e-4" } dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

# text
seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

# text
seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV { "520" } km { "97" } Grad, Pulsar FOC polar { "1080" } km { "97" } Grad, Pulsar FOC geneigt { "1080" } km { "53" } Grad und GPS { "20180" } km { "55" } Grad; Bahngeschwindigkeit, maximale ECEF-Geschwindigkeit, maximale Relativgeschwindigkeit und maximaler Trägerdoppler im L1- und L5-Band, { "20" } Werte, jeweils innerhalb von { "0.05" } %)

# text
seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

# text
seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } und 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } und 1/61.1, BeiDou MEO 1/54.2, geostationär { "0.992" } und 1/126.2 bei einer Maske von { "0" } Grad, jeweils innerhalb von { "0.005" } von w_R und { "0.5" } von 1/w_AC^{ "2" }; leo_weights_shift_toward_the_transverse_axes — Horizont-Nadirwinkel { "67.8" } Grad bei { "510" } km)

# text
seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

# text
seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — vier echte Galileo-Broadcast-Ephemeriden E10, E19, E24, E25 bei tk = { "0" }, +/-600, +/-1800, +/-3600 s, jede Achse innerhalb von { "1" } mm von RTKLIB; real_galileo_records_survive_the_binary_frame_and_the_text_block — innerhalb von { "5" } mm nach dem Kshana-Binärframe und { "1" } mm nach dem Block im RINEX-Stil)

# text
seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

# text
seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 für die ASCII-Zeichenkette { "123456789" }; crc24q_matches_the_rtcm_1005_example_frame — die drei Prüfbytes 0x360B98 des Beispielframes der RTCM-Nachricht { "10403" } vom Nachrichtentyp { "1005" }, und null über den gesamten Frame)

# text
seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

# text
seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (monotones Wachstum von { "1" } bis { "15" } Minuten und mindestens eine dreifache Verbesserung bei { "15" } Minuten); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (reduziert-dynamische ITSG-Bahnen der TU Graz von GRACE-A, GRACE-C, Sentinel-2A und Sentinel-6A, angepasst über Bögen von { "20" } und { "30" } min: RMS in Bahnrichtung, quer und radial { "0.804" } bis { "1.087" } und SISRE { "0.716" } bis { "0.809" } von Liu et al. { "2025" }, innerhalb von 1.5x; SISRE-Gewichte innerhalb von { "0.0007" } ihrer Tabelle { "2" }); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, gleicher Anfangszustand und gleiche Dichteeingabe: schlechtester Wert { "3.95" } mm Zweikörper, { "3.92" } mm J2-J6 und EGM2008 bis Grad { "20" } und { "70" }, { "4.55" } mm EGM2008 Grad { "20" } mit Luftwiderstand bei { "400" } km, Zielwert { "0.02" } m über { "6" } h); interne Gegenprüfung, keine unabhängige Referenz: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

# text
seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

# text
seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (vier Tage der Veröffentlichung: Verhältnisse in Bahnrichtung, quer, radial und SISRE { "0.755" } bis { "1.138" } von Liu et al. { "2025" }, innerhalb von 1.5x); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (acht zurückgehaltene Tage, je zwei Bögen: { "0.683" } bis { "1.186" })

# text
seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

# text
seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — der L1-Wert ist der von RTKLIB mit { "6.1278" } m; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar bei L1, L2 und L5 über { "4 320" } Fälle, schlechtester Wert { "7.0e-13" } m; Az über { "222" } Koeffizientensätze einschließlich der Regeln für Alles-Null und { "400" } sfu, schlechtester Wert { "5.7e-14" } sfu; UTC-Drift über { "50" } Fälle, schlechtester Wert { "3.6e-15" } s; die drei Schaltsekundenfälle über { "21 602" } Zeitpunkte rund um die echten Schaltsekunden von { "2015" } und { "2016" }, { "0" } s)

# text
seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

# text
seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: ein Satellit bei { "780" } km und { "86.4" } Grad, einen Tag lang geflogen bei { "1621" } MHz über vier Breitengrade, Maximum innerhalb von { "5" } % von { "36" } kHz; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: ein Satellit je veröffentlichter Schale, { "1080" } km bei { "53" } und { "97" } Grad, { "1593.3225" } MHz, das Konstellationsmaximum innerhalb von { "32" } bis { "34" } kHz ohne Aufweitung ({ "33.6" } kHz, bestimmt von der Schale mit { "97" } Grad; die Schale mit { "53" } Grad allein erreicht { "31.8" } kHz)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

# text
seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

# text
seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: { "0.4157" } m von Hand bei { "5" } MHz, { "45" } dB-Hz, { "0.1" } s; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

# text
seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

# text
seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (Konfigurationen A und B, { "4040" } Stichproben: erdfeste Positionen innerhalb von { "6.8e-5" } m, Zielwert { "0.2" } m; Sichtbarkeitszahlen identisch bei 4040/4040; Median-DOP innerhalb von { "2.3e-11" } relativ, Zielwert { "1e-3" }; Verfügbarkeit und mittlere Sichtbarkeit identisch); tests/earth_orbit_path_sgp4_erfa_oracle.rs (der Pfad); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (Runde { "2" }, Geometrie auf gegebenen Zuständen); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (Befund der vollständigen Aussage aus Runde 1, festgehalten)

# text
seg-bd265d530763 = lunar_frame_campaign, fim

# text
seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: drei Szenarien — Stationen geschätzt an einem neuen Kampagnendatum 2026-03-18 (maßgeblich), Stationen an diesem Datum fest (Kontrolle), Stationen geschätzt am 2024-01-01 (das Szenario des früheren Fehlschlags in doppelter Genauigkeit); jedes Datum-Sigma, die Konditionszahl und die schwächste Richtung gegenüber einem konditionsskalierten Zielwert, der im Test aus den exakten Sensitivitäten der Referenz neu berechnet wird; engine_inputs_match_the_committed_fixture: die eingecheckte Jacobi-Matrix, die Gewichte und das Helmert-Design sind das, was die Engine jetzt aufbaut; record_engine_accuracy_against_a_factorisation_route: das Fehlerband der Engine und die NumPy-Cholesky-Diagnose festgehalten)

# text
seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

# text
seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: vier Szenarien — Stationen geschätzt an einem neuen Kampagnendatum 2026-06-09 (maßgeblich), Stationen an diesem Datum fest (Kontrolle) sowie die Eingaben mit geschätzten Stationen vom 2026-03-18 und 2024-01-01; jedes Datum-Sigma, die Konditionszahl und die schwächste Richtung gegenüber einem Zielwert in Quadratwurzelform, der im Test aus den exakten Bestandteilen der Referenz neu berechnet wird; engine_inputs_match_the_committed_fixture); linalg_sr::tests ({ "9" } Bibliothekstests: das Dekker-Produkt gleich dem Residuum der fusionierten Multiplikation-Addition auf { "20 000" } Paaren, kompensierte Summation einer sich aufhebenden Summe, R^T R gleich A^T A, sequentielle Filteraktualisierungen gleich einer Batch-Aktualisierung, der hintere Block gleich der Quadratwurzel des Schur-Komplements, die Dreiecksinverse, die Jacobi-SVD, Übereinstimmung mit dem spektralen Datum bei einem gut konditionierten Fall, bitidentische Wiederholläufe); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected und the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

# text
seg-02fed5e55709 = receiver_trust (ingest, maritime)

# text
seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) gegen tests/fixtures/maritime_trust/reference.json, neu erzeugt von scripts/gen_maritime_trust_ref.py aus dem synthetischen NMEA, das examples/gen_maritime_trust_ref_inputs.rs schreibt; Toleranzen vorab festgelegt in tests/fixtures/maritime_trust/PREREGISTRATION.md

# text
seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

# text
seg-5699d8162c69 = tests/nmea_training_reference.rs (Vergleich mit der Referenz pynmea2); tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

# text
seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

# text
seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } NACp-Codes, { "59" } NIC-Zeilen); tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } Frames); tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } Punkte, vier Zellgrößen); tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } Routen, { "420" } Teilstücke, { "11634" } km); tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } Punkte); Unit-Tests von interference_map

# text
seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

# text
seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces; Schema { "1.3" }: prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged); tests/telemetry_cli.rs; telemetry::prometheus::tests (Golden-Exposition)

# text
seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

# text
seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered); telemetry::syslog::tests (exakte CEF-Zeichenketten, Escaping, Schweregrad, RFC-{ "5424" }-Umschlag); tests/telemetry_cli.rs

# text
seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

# text
seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (RFC-{ "8032" }-Abschnitt { "7.1" }-Vektoren { "1" }, { "2" }, { "3" } und { "1024" }; FIPS-180-4-SHA-256-Beispiele; exakt); tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } Fälle); tests/evidence_pack.rs (Manipulationstests)

# text
seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

# text
seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (der vorab festgelegte Vergleich); evidence::tsa::tests (bürgerliche Daten und Zeiten, base64, die öffentliche RSA-Operation); evidence::verify::tests::anchors_make_the_authority_checked (ein nicht signiertes Token scheitert mit Ankern; ohne sie bleibt der Bericht unverändert)

# text
seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

# text
seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } Tests: Festlegungen der Referenz, Export-Bytes, schlechtester Fall über jede Zeile, Positionsspalten, lokale Geschwindigkeit gegenüber wahrer NED-Geschwindigkeit, Euler-Winkel gegenüber scipy, NMEA gegenüber pynmea2); tests/interop_testbench.rs (die eigenen Rundläufe des Schreibers)

# text
seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

# text
seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

# text
seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

# text
seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

# text
seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay); tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

# text
seg-6bb40f180cf0 = <s1>Zurück</s1>Validierungsstatus

# text
seg-defb46c5bc80 = <s1>Weiter</s1>Fähigkeitenreferenz

# text
seg-4d866b62d4f7 = Mengeninklusion: Das Verhältnis von Störer zu Signal geht als einheitlicher Dezibel-Versatz ein, sodass die erfasste Menge bei höherer Sendeleistung die Menge bei niedrigerer enthält und der Anteil nur steigen kann -- eine Eigenschaft, die das Airy-Muster in Strahlbreite oder Höhe NICHT liefert, wo die erfasste Region in Ringe zerfällt und der Anteil echt nicht monoton ist. Keine veröffentlichte Tabelle gibt den erfassten Scheibenanteil eines Mond-Orbitalsenders gegenüber Höhe und Strahlbreite an, daher gibt es nichts Externes, gegen das diese Zellen geprüft werden könnten; das darunterliegende Muster ist separat gegen veröffentlichte Bessel-Werte validiert und behält seine eigene Zeile

# text
seg-76da58fe670a = Keine externe Referenz: Das Paket verknüpft Hashes und eine Bewertung des Empfängerprotokolls (MODELLED), geprüft an synthetischen Daten (die exportierten NMEA-Daten eines mitgelieferten Szenarios, behandelt als Protokoll des Empfängers). Ein Laborlauf wird nicht behauptet

# text
seg-c69fd3fc645b = Drei unabhängige maßgebliche Ephemeriden — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — abgetastet über IMCCE calceph, kreuzgeprüft durch eine unabhängige numpy-SVD-Kleinste-Quadrate-Anpassung. WARUM DIES validiert IST, WO lunar_common_mode ES NICHT IST, auf denselben drei Ephemeriden: Hier IST die berichtete Größe eine Eigenschaft der veröffentlichten Daten — ihrer gegenseitigen Abweichung —, die Ephemeriden sind also die unabhängige Referenz, keine Eingabe. In lunar_common_mode speist dieselbe Abweichung eine als MODELLED eingestufte Konstellationsgeometrie, und die Antwort ist eine Eigenschaft dieses Modells; deshalb ist diese Zeile zu Recht Modelled/ReferenceImpl.

# text
seg-d9ea966abdd6 = Keine externe unabhängige Referenz für die Szenarioergebnisse: Jeder Paket-Test führt eine Szenarioart aus, die MODELLED ist. Die Zielwerte sind das angegebene Profil des Paketautors (das DHS-Rahmenwerk nennt keine Werte; die Genauigkeitsgrenzen der IMO sind Tabelle C-1 von MSC.1/Circ.1575, vollständig gelesen; das ICAO-Paket folgt der eigenen Präsentation der ICAO zum RFI Mitigation Plan, weil Doc { "9849" } eine kostenpflichtige Veröffentlichung ist und nicht gelesen wurde), festgeschrieben vor jedem bewerteten Lauf in PREREGISTRATION.md-Dateien im Stil von xval unter standards/. Ein Zielwert mit MET besagt, dass ein modelliertes Szenario einen angegebenen Zielwert erfüllt hat, nichts über ein Produkt

# text
seg-f7457156f960 = Interne Konsistenz gegenüber den eigenen Vorwärtsfunktionen der Engine, was diese Fähigkeit ehrlicherweise allein beanspruchen kann. Jeder Konturpunkt ist eine Umkehrung in geschlossener Form, und jede Umkehrung wird geprüft, indem ihre Antwort durch die VORWÄRTSFUNKTION zurückgegeben wird, mit der die eigenen Zeilen des Berichts bewertet wurden: die Spalte J/S durch jamming::effective_cn0_dbhz (das tracking_threshold_dbhz auf < { "1e-9" } dB-Hz liefern muss), die Spalte des Abstands durch jamming::free_space_path_loss_db und jamming::j_over_s_db (dasselbe J/S auf < { "1e-9" } dB), die Spalte EIRP durch jamming::j_over_s_db beim eigenen Abstand des Szenarios. Die Kontur wird außerdem als die GRENZE der Sperrmenge geprüft und nicht als ein Punkt in ihr — lock_status verliert die Synchronisation bei einer strikten Ungleichung, daher wird gemessen, dass das Urteil über { "1e-4" } dB J/S beiderseits der Kontur von DEGRADED auf LOST kippt, was eine um ein Epsilon verschobene Kontur nicht bestehen würde. Die stärkste Prüfung erfolgt je Verbindung statt je Quantil: Die Anwendung derselben Abbildung auf das eigene C/N₀ jeder Zeile reproduziert die Statuspalte des Berichts exakt — { "0" } Abweichungen bei { "38" } von { "38" } Zeilen am dokumentierten Arbeitspunkt (kind = lunar-jamming, jede Eingabe auf Standard außer jammer.range_m = { "25 000" } m), wo { "26" } Zeilen LOST sind und { "12" } nicht. Monotonie wird gemessen, nicht angenommen: { "20 001" } Stichproben über [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } Verletzungen eines streng fallenden Abstands und einer streng steigenden erforderlichen Leistung, sodass die Quantilreihenfolge des Bandes gezeigt statt behauptet wird. ExternalDataset wird abgelehnt und damit auch Validated: Es gibt keine gemessene Kampagne zu Mond-Jamming, gegen die ein Sperrradius verglichen werden könnte, die Konstellation ist eine illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen und keine geflogene Ephemeride, und die Eingaben der Kontur (EIRP, Jammerleistung, Antennengewinne, Rauschtemperatur) sind repräsentative Größenordnungen. ReferenceImpl wurde ebenfalls erwogen und abgelehnt — der inverse und der Vorwärtsausdruck sind dieselbe Algebra, in zwei Richtungen gelesen, sodass der Hin-und-zurück-Test Übertragungs- und Vorzeichenfehler findet, aber keine unabhängige Implementierung ist; ihn als Gegenprüfung zu bezeichnen, wäre der Zug der geborgten Unabhängigkeit, den die Invarianten der Matrix verhindern sollen. Was das Band bringt, wird gemessen und beziffert statt behauptet: Am Arbeitspunkt beträgt die Kontur mit einem einzelnen Skalar { "27.402916" } km und legt { "25" } km für alle { "38" } Zeilen auf die gesperrte Seite, während das Band { "21.256108" } .. { "29.921360" } km den Arbeitspunkt enthält und daher die Aufteilung berichtet, die die Tabelle tatsächlich zeigt. Es wird auch gemessen, dass die beiden Kriterien voneinander abweichen — das Band nach Leistungsverhältnis ({ "38.186527" } .. { "53.691675" } km) enthält { "25" } km überhaupt nicht —, weshalb beide ausgegeben werden

# text
seg-8191906fc700 = Zwei etablierte Implementierungen Dritter zusammengesetzt, beide offline ausgeführt, mit dem Fixture, das von Anfang bis Ende neu erzeugt und als byteidentisch verifiziert wurde. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), Commit 71db0ff, src/rtkcmn.c aus dem C-Quelltext mit -ULAPACK übersetzt: lsq() → matinv() → ludcmp()/lubksb() invertiert die Normalmatrix durch Crout-LU mit partieller Pivotierung, ein Algorithmus, der nichts mit dem handgeschriebenen Gauß-Jordan-invert4() von kshana zu tun hat; numpy.linalg.inv (LAPACK getrf/getri) invertiert jede davon als dritte unabhängige Inverse erneut und stimmt mit RTKLIB auf { "1.112e-12" } relativ überein. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) liefern norm.isf, norm.sf (Cephes ndtri/ndtr) und optimize.brentq gegen die Inkomplette-Gamma-Reihe nach Numerical Recipes, die per Bisektion gebildete Inverse und die 200-Schritt-Bisektion von kshana — und das direkte sf von SciPy ist ein anderer numerischer Weg in den fernen Rand als das { "1" } − Φ von kshana, sodass die Auslöschung im tiefen Rand gemessen und nicht gespiegelt wird. Die vertikale Achse ist der radiale Einheitsvektor (die Definition der lokalen Vertikale auf einem sphärischen Mond), und die horizontale Varianz ist die Spur des horizontalen Blocks, sodass keine Ost/Nord-Azimutkonvention gemeinsam verwendet wird. DIESE ZEILE VALIDATED AUSDRÜCKLICH NICHT: σ_URE, der Fehler-Prior je Satellit und die illustrative Konstellation der Klasse Moonlight/LCNS sind MODELLED Eingaben, die der Referenz wie gegeben übergeben werden; und die FORM der MHSS-Integritätsgleichung für Einzelfehler ist aus derselben veröffentlichten Schranke abgeschrieben, die kshana implementiert — eine gemeinsame geschlossene Form ist eine gemeinsame Annahme, daher deckt diese Zeile eine falsche Auswertung dieser Gleichung ab, nicht ihre falsche Wahl. Es ist keine MHSS-ARAIM-Implementierung eines Dritten erreichbar (RTKLIB bietet keinen Einstiegspunkt für Schutzniveaus, eine solche PyPI-Distribution existiert nicht, Stanford MAAST ist MATLAB), was die ausstehende Aufwertung ist

# text
seg-aae487789add = NASA/USGS SRTM v3 (1 Bogensekunde) Kachel N36W117 — PUBLIC-DOMAIN-Höhendaten der US-Regierung aus dem offenen AWS-Spiegel elevation-tiles-prod, auf 6 Bogensekunden ausgedünnt und unter tests/fixtures/terrain/ eingecheckt (siehe NOTICE.md), dazu Ausschnitte in voller Auflösung von N36W117 und N36W119, knotenweise gegen den unabhängigen SRTMHGT-Leser von GDAL und die Vermessungs-Benchmarks Mount Whitney ({ "4421" } m) und Badwater (−{ "86" } m) geprüft. Der dokumentierte Benchmark Badwater Basin (−{ "86" } m, tiefster Punkt Nordamerikas) verankert das georeferenzierte Lesen. Die Geländeabgleich-/TERCOM-Navigationslösung, die das DEM verwendet, bleibt modelliert (eigene Zeile Alternatives/ergänzendes PNT)

seg-65185cb68d6b = Fehlerbudget für Navigation und Zeitgebung einer Kette von Missionsphasen vom Start bis zum Wiedereintritt (<c1/>)

seg-86a132e1a243 = Die Art <c1/>: ein Dokument aus Phasen, jede eine von acht registrierten Arten, der Reihe nach ausgeführt, wobei die 6x6-Kovarianz, die Uhr und das Bezugssystem nach einer genannten Regel weitergegeben werden (<c2/>; <c3/>, weißes Beschleunigungsrauschen über eine genannte Lücke bei einem geradlinigen Modell; <c4/>, Koppelnavigation, dann die Quellgrenze, nie darunter, nie ein Zurücksetzen); Umrechnungen der Bezugssysteme GCRF, MCI und MCMF und der Zeitskalen über TT, jede mit eigener Budgetzeile, wobei der Zustand des Mondes aus einem optionalen DE440-Kernel-Ausschnitt stammt und die analytische Reihe als genannter Ersatz dient; die Marge gegenüber einer genannten Anforderung, das schwächste Glied, die Ereignisse und eine Zeitleistengrafik. Jede Zahl ist eine genannte Eingabe oder ein Modell einer solchen

seg-cf8a0dc4088e = Handrechnungen in den Tests (das geradlinige Kovarianzwachstum, die mittlere siderische Rotation, die säkulare Mondtaktrate) und, nur für den Zustand des Mondes, die eingecheckten DE440-Kernel-Ausschnitte gegen festgelegte JPL-Horizons-Werte (schlechtester Wert { "2.6" } m und { "7e-6" } m/s). Es werden keine Missionsdaten mit der Kette verglichen; ihre Phasen sind eigene Zeilen. Das Dokument ist eine genannte Kette mit ILLUSTRATIVE Eingaben, nur öffentlichen Quellen und ohne Billigung durch eine Agentur

seg-87b2b2459b45 = Start und Aufstieg in eine Parkbahn mit GNSS-Erfassung und -Abschwächung (<c1/>)

seg-725e7ce83533 = Die Phase <c1/>: eine Positions- und Geschwindigkeitskovarianz bei konstanter Geschwindigkeit mit weißem Beschleunigungsrauschen (die Güte der Koppelnavigation), eine GNSS-Lösung genannter Genauigkeit, die nach der Erfassungszeit und außerhalb genannter Abschwächungen angewandt wird, eine Uhr mit Bias und Drift, die von denselben Lösungen geführt wird, und der Zustand beim Einschwenken in die Parkbahn

seg-22e5c301626e = Der stationäre Riccati-Zustand und die Handrechnung der Vorhersage in den Tests. Nichts hier modelliert eine Trägerrakete oder einen Empfänger; jede Zahl ist eine genannte Eingabe

seg-eb66a49b0306 = Relativnavigation bis zur Andockhülle in niedriger Erdumlaufbahn über Sensorabschnitte (<c1/>)

seg-658a0448d80d = Die Phase <c1/>: der Relativzustand in den LVLH-Achsen des Ziels mit dem geschlossenen Clohessy-Wiltshire-Übergang, eine 6x6-Kalman-Kovarianz mit weißem Beschleunigungsrauschen und Positionsaktualisierungen, deren Varianz die des Sensors bei der aktuellen Entfernung ist, über Abschnitte eines genannten Sensors (ILLUSTRATIVE Formen für optische Kamera, Lidar und Funkentfernungsmessung); das Andockfenster ist die Zeit ab dem Punkt, an dem das relative Sigma innerhalb der Fanghülle bleibt, bis zum Ende der Phase. Die absolute Kovarianz des Verfolgers wird unverändert weitergegeben, und eine Zeile sagt das

seg-97f4aa0575e6 = Eine einachsige Handrechnung von Vorhersage und Aktualisierung im Test; der Clohessy-Wiltshire-Übergang ist derjenige, den cw_dynamics gegen eine unabhängige numerische Integration prüft. Die Sensoren sind ILLUSTRATIVE, und es wird kein reales Rendezvous verglichen

seg-b45a8a357faf = Translunare Injektion und cislunarer Flug: fortgeschriebener Mittelwertzustand und Kovarianz mit Tracking-Aktualisierungen (<c1/>)

seg-ab5c79789754 = Die Phase <c1/>: der Mittelwertzustand durch den Cowell-Propagator der Engine (Erde als Punktmasse und J2, Sonne und Mond als dritte Körper, der Mond aus dem DE440-Kernel des Strangs, wo dieser das Segment abdeckt, und die Sonne aus der analytischen Reihe); die Kovarianz durch eine Zustandsübergangsmatrix aus Vorwärtsdifferenzen dieser Fortschreibung (der nominale Lauf und sechs gestörte Läufe je Segment) mit weißem Beschleunigungsrauschen; die Größe und der Richtungsfehler des TLI-Manövers; <c2/>-Lösungen, deren Verfügbarkeit und PDOP aus dem Sweep des Raumdienstvolumens entlang einer oskulierenden Bahn stammen, die den Bogen vertritt; Entfernungs- und Entfernungsratenverfolgung entlang der geozentrischen Richtung, skaliert mit der Einsatzdauer des Bodennetzes, mit der Aktualisierung in Joseph-Form

seg-86dae517e339 = Der Satz von Liouville (die Determinante der Zustandsübergangsmatrix des konservativen Anteils ist eins) und eine feinere Differenz in den Tests; der Mittelwertzustand wird in der Zeile darunter mit einer öffentlichen Trajektorie verglichen, die er verfehlt. Der Manöverfehler, die Aktualisierungen und die Kovarianz werden mit nichts verglichen

seg-7a3eb4fae324 = Kovarianz an der Eintrittsschnittstelle, Korridorwahrscheinlichkeit, Spitzenverzögerung und Landeellipse (<c1/>)

seg-93f07906d7bf = Die Phase <c1/>: der Rückflug von <c2/> ohne Manöver bis zur Eintrittsschnittstelle; der Bahnneigungswinkel und sein Sigma aus der vollen Kovarianz durch einen Differenzengradienten; die Wahrscheinlichkeit, dass der Winkel innerhalb eines genannten Korridors liegt; die Spitzenverzögerung beim nominalen Winkel und an beiden Korridorrändern aus dem ebenen ballistischen Punktmasse-Wiedereintritt der Engine (Abprallen erkannt) neben der geschlossenen Allen-Eggers-Form; die Landeellipse aus einer genannten Reichweitenempfindlichkeit und der Schnittstellenkovarianz quer zur Bahnebene. Auftrieb, Lenkung und Erwärmung werden nicht modelliert

seg-8d5695aad35b = Handrechnungen in den Tests (das Sigma des Winkels ist das senkrechte Geschwindigkeitssigma geteilt durch die Geschwindigkeit; die Gauß-Masse in einem Korridor). Der ebene Wiedereintritt ist der eigene der Engine, und die Allen-Eggers-Form ist ein Vergleich in geschlossener Form; kein geflogener Wiedereintritt wird verglichen

seg-3f0951532f6e = Abdeckung des Bodennetzes und Verfolgungsdauer für eine Phase des Strangs (<c1/> von <c2/>)

seg-5204af351299 = Die Überlagerung des Bodennetzes: Stationen mit einer Mindesthöhe, die Sichtbarkeit des Fahrzeugs bei einer genannten Geometrie (der Eintrittszustand, zweikörperig mit J2 geflogen, die Position des Mondes für den Flug oder eine genannte Einsatzdauer), Stationsübergaben, die je eine genannte Zeit verlieren, und die daraus folgende Einsatzdauer, die an die Aktualisierungsrate der Bodenverfolgung der Phase weitergegeben wird; das längste Intervall ohne Station in Sicht ist eine Budgetzeile

seg-0d1d229a3ab7 = Prüfungen der Geometrie von Zenit und Antipode und die erwartete Sichtbarkeit eines fernen Ziels in den Tests. Es werden kein reales Netz, keine reale Antenne und kein realer Zeitplan modelliert

seg-4ba700726208 = Relativnavigation bis zum Andocken in einer Mondumlaufbahn (<c1/>)

seg-2e30e78e49f7 = Die Art und Phase <c1/>: eine gemeinsame Gauß-Newton-Batchschätzung zweier Fahrzeuge über den Bogen (einundzwanzig Parameter: beide Zustände und beständige Positionsbiase im Signalraum, gemeinsame und unabhängige), über ein Viertel, die Hälfte und den ganzen Bogen mit Schrittweitenhalbierung ausgebaut, aus einer absoluten Lösung je Fahrzeug (Schranke der AFS-Pilotcodeverfolgung, ILLUSTRATIVE Relaisgruppe) und einer Querverbindungsentfernung, unter dem Mondkraftmodell des Crates; der mittlere normierte quadrierte Schätzfehler, die Clohessy-Wiltshire-Prüfung auf einer Kreisbahn und die weitergegebene 6x6-Kovarianz

seg-09fa0c35d004 = Selbstkonsistenz unter einer Vorregistrierung (xval/mission-thread-lunar/PREREGISTRATION.md, Ergebnisse und die Geschichte der Schätzer in RESULTS.md): Der mittlere NEES des Relativzustands beträgt { "5.85" } bis { "5.93" } gegenüber dem Band { "5.2" } bis { "6.8" } in vier Konfigurationen, MET beim vierten Schätzerentwurf, nachdem drei Entwürfe mit sequentiellem Filter verfehlt wurden; die Wahrheit und der Schätzer teilen ein Kraftmodell, daher sagt dies nichts über Modellfehler aus. Der gemeinsam genutzte Propagator wird in einer Zeile darunter mit LRO und CAPSTONE verglichen

seg-c85d7e5e63a3 = Landestreuungsbudget an einem Standort am Mondpol (<c1/>)

seg-bd88ab3ad105 = Die Art und Phase <c1/>: ein inertiales Fehlermodell mit fünf Zuständen je Achse (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Neigung, Kreisel-Bias) über einen angetriebenen Abstieg, gestützt durch AFS-Lösungen (eigenständig oder differenziell, mit dem uhrgestützten Fall mit drei Relais), eine geländerelative Lösung (der Terrain-Nav-Abgleicher der Engine auf synthetischem Relief oder eine Cramer-Rao-Schranke auf einem LOLA-DEM mit einer Blendenproblem-Regel) und Mondzeit, mit einer Monte-Carlo-Aufsetzellipse

seg-a5ddb83a5cf1 = Die geschlossene inertiale Drift, die eigenen Ergebnisse der wiederverwendeten Arten und die Kalibrierung der 3-Sigma-Ellipse (der Anteil darin stimmt mit seiner Erwartung überein) in den Tests. Keine geflogene oder getestete Landung wird verglichen

seg-8dfc1600cf8c = Positionierungs- und Zeitgebungsverfügbarkeit an der Oberfläche nach Standort und Jahreszeit an den Mondpolen (<c1/>)

seg-f91c1da9ab55 = Die Art und Phase <c1/>: Relaisverfügbarkeit und PDOP, Erd- und Sonnensichtbarkeit und eine geführte Oberflächenuhr für jeden Standort und jede Jahreszeit, mit dem Geländehorizont von <c2/>; ein Lauf an einem einzelnen Standort ist bitgenau gleich der Verfügbarkeit und dem PDOP dieser Art

seg-e3a782dce8be = Exakte Gleichheit mit der bestehenden Art für einen Standort sowie Monotonieprüfungen in den Tests. Die Relaisgruppe ist ILLUSTRATIVE, und keine Oberflächenmessung wird verglichen

seg-0db91d70a079 = Angetriebener Aufstieg von einem Standort am Mondpol in eine Einschwenkbahn (<c1/>)

seg-b5b1125d515c = Die Art und Phase <c1/>: das inertiale Fehlermodell mit fünf Zuständen je Achse über einen angetriebenen Aufstieg mit spezifischer Kraft entlang des Pfads, gestützt durch AFS-Lösungen und Mondzeit, mit Angabe der in die Umlaufbahn getragenen Positions- und Geschwindigkeitskovarianz beim Einschwenken und der Streuung beim Triebwerksabschalten (angegeben, nicht weitergetragen)

seg-76e0d23b7483 = Die geschlossene inertiale Drift und Monotonieprüfungen in den Tests. Kein geflogener Aufstieg wird verglichen

seg-1983ce9cc6da = Die Fortschreibung mit dem Mondkraftmodell gegen öffentliche rekonstruierte Trajektorien von Mondorbitern und cislunaren Flugkörpern

seg-57f53a7d1fa2 = Der von den Mondarten gemeinsam genutzte Propagator (GRAIL GL0660B Grad und Ordnung { "150" }, Erde und Sonne als dritte Körper, Relativität, DE440-Mondorientierung), verglichen mit den öffentlichen JPL-Horizons-Trajektorien von LRO ({ "24" } h, Stichproben im Abstand von { "10" } Minuten) und CAPSTONE (ein Umlauf von { "6.5" } Tagen, Stichproben im Stundenabstand), unter Zielwerten, die vor dem Lauf in einer eingecheckten Datei festgelegt wurden

seg-321d0721970d = JPL-Horizons-Ephemeriden der Raumfahrzeuge LRO und CAPSTONE, gegen Zielwerte, die in xval/mission-thread-lunar/PREREGISTRATION.md vorab festgelegt wurden (Änderungen { "1" } bis { "6" }). LRO: MET, { "33" } m größte 3D-Differenz und { "2.4" } m RMS radial gegenüber { "500" } m und { "60" } m. CAPSTONE: NOT MET, eine Differenz der Endposition von { "136.8" } km gegenüber { "25" } km und eine Perilundifferenz von { "28.4" } km gegenüber { "10" } km, die Ursachen nicht isoliert. Die Zeile ist modelliert, weil der CAPSTONE-Zielwert verfehlt wird und der Vergleich den gemeinsam genutzten Propagator prüft, nicht einen Filter, ein Signal oder ein Budget

seg-c557d317389a = Die cislunare Mittelwertfortschreibung gegen die öffentliche Trajektorie von Artemis I (<c1/>)

seg-539d4c3e9b56 = Die Mittelwertfortschreibung der Phase <c1/> (Cowell, Erde als Punktmasse und J2, Sonne und Mond als dritte Körper, der Mond aus einem DE440-Ausschnitt), verglichen mit der öffentlichen JPL-Horizons-Trajektorie von Artemis I über einen Freiflugbogen von { "72" } h ab 2022-11-16 { "18" }:{ "00" } TDB, in Epochen im Abstand von { "12" } Stunden, unter Zielwerten, die vor dem Lauf in einer eingecheckten Datei festgelegt wurden

seg-362b1a7b9e5e = JPL-Horizons-Ziel -1023 (die tatsächlich geflogene Post-TLI-Trajektorie der NASA-Navigation), gegen Zielwerte, die in xval/mission-thread/PREREGISTRATION.md vorab festgelegt wurden (Änderung { "1" } ändert nur die angeforderte Zeitspanne). NOT MET und als verfehlt festgeschrieben: { "45.3" } km größte Positionsdifferenz gegenüber { "5" } km und { "0.249" } m/s Geschwindigkeitsdifferenz bei { "72" } h gegenüber { "0.05" } m/s. Eine nach dem Urteil geschriebene Diagnose verortet die Verfehlung in fünf impulsiven Geschwindigkeitsschritten von { "0.09" } bis { "0.22" } m/s in der Referenz (die vorab festgelegte Annahme, dass das Fenster kein Manöver enthielt, war falsch); über die übrigen { "67" } Stunden gibt das Modell den jeweils nächsten Stundenzustand mit einem Median von { "0.38" } m wieder. Prüft nur den Mittelwertzustand eines einzelnen Freiflugbogens: keine Kovarianz, keinen Filter, keine Aktualisierung und keine andere Phase

seg-150ae9c3d755 = Region einer Störquelle: eine zulässige Senderregion aus Positionsmeldungen von Flugzeugen und Schiffen

seg-b5c49044a7a1 = Eine zulässige Region dafür, wo sich eine Quelle gestörter Navigationsmeldungen befinden kann, aus ADS-B- (NIC/NACp) oder AIS-Positionsmeldungen: Funksicht bei einem 4/3-Erdradius aus der Meldehöhe und einem Höhenbereich der Senderantenne, eine begrenzte effektive Reichweite für die unbekannte Leistung, wobei betroffene Einheiten die Posterior zu ihrer Reichweite ziehen und unbetroffene Einheiten mit Funksicht dagegen drücken, gruppiert zu Sitzungen in Zeit und Raum. Die Ausgabe sind Regionen höchster Dichte bei genannten Konfidenzniveaus, ein Posterior-Schwerpunkt mit einer Momentellipse, Beginn, Ende und Dauer der Sitzung, betroffene Fläche und Anzahl unterschiedlicher Flugzeuge über dem Veröffentlichungsminimum, ein Tagesgangprofil und Stunden pro Tag. Geländefrei; eine einzelne Quelle je Sitzung; die Glaubwürdigkeit hängt vom Modell ab. Optionale Fusion mit einer TDOA-Lösung aus der Geolokalisierung.

seg-953a8b4f9f41 = Noch keine externe. Nur synthetische Vorwärts-Rückwärts-Rundläufe aus einem Generator, der das Modell des Schätzers teilt; sie prüfen also den Code und die Kalibrierung der genannten Niveaus unter diesem Modell und nichts über reale Sender. Eine externe Prüfung gegen die veröffentlichten Senderstandorte des Jammertests { "2025" } wurde vorab festgelegt (docs/emitter-region/PREREGISTRATION.md, vom Eigentümer vor jedem bewerteten Lauf freigegeben) und einmal ausgeführt (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } geplante Sitzungen, weniger als das registrierte Minimum von { "4" }) und AIS NOT ASSESSABLE (keine veröffentlichte Sitzung), sodass kein Zielwert getestet wurde und die Zeile MODELLED bleibt

seg-e9650a618b38 = ID

seg-308cb3c31a16 = mission_thread (scenario, handover, conversions, budget, phase)

seg-65bd744f29c6 = mission_thread::scenario::tests::a_thread_runs_hands_over_converts_and_names_the_weakest_link; mission_thread::scenario::tests::bad_documents_fail_with_the_reason; mission_thread::handover::tests::inflate_never_shrinks_a_sigma_and_matches_the_hand_calculation; mission_thread::handover::tests::reacquire_sets_an_axis_to_the_floor_only_where_the_floor_is_smaller; mission_thread::conversions::tests::mci_mcmf_round_trip_returns_the_state_and_the_covariance; mission_thread::conversions::tests::tt_to_ltc_shifts_bias_and_drift_by_the_secular_rate_and_back; mission_thread::conversions::tests::the_committed_kernel_cuts_agree_with_pinned_horizons_values; tests/field_units_global.rs (the report's units block)

seg-9e5314dc6b0a = mission_thread::earth::launch (LaunchAscent)

seg-083f9245ff63 = mission_thread::earth::launch::tests::with_gnss_the_sigma_settles_near_the_fix_and_an_outage_lets_it_grow; mission_thread::earth::launch::tests::before_acquisition_the_sigma_only_grows_and_a_longer_acquisition_is_worse; mission_thread::earth::launch::tests::a_phase_that_does_not_list_gnss_never_uses_it; mission_thread::earth::launch::tests::bad_models_and_entries_are_refused; mission_thread::earth::filter::tests::repeated_updates_reach_the_riccati_steady_state

seg-da26dd6773fb = mission_thread::earth::rendezvous (LeoRendezvous); cw_dynamics; mission_thread::sensors

seg-940d19eaea64 = mission_thread::earth::rendezvous::tests::the_relative_sigma_falls_through_the_legs_and_opens_a_docking_window; mission_thread::earth::rendezvous::tests::without_relative_sensing_the_sigma_only_grows_and_no_window_opens; mission_thread::earth::rendezvous::tests::the_covariance_recursion_matches_a_one_axis_hand_calculation; mission_thread::earth::rendezvous::tests::bad_models_and_a_duration_mismatch_are_refused; mission_thread::sensors::tests::the_cross_range_error_grows_with_range_and_the_floor_dominates_up_close

seg-88b5123a7c1f = mission_thread::earth::tli_cruise (TliCruise); propagator; ssv::sweep

seg-be98276d9788 = mission_thread::earth::tli_cruise::tests::the_stm_is_symplectic_for_the_conservative_part_and_matches_a_finer_difference; mission_thread::earth::tli_cruise::tests::with_no_tracking_the_covariance_is_the_stm_propagation_of_the_entry_and_the_burn; mission_thread::earth::tli_cruise::tests::range_tracking_shrinks_the_line_of_sight_and_leaves_the_plane_of_the_sky; mission_thread::earth::tli_cruise::tests::the_thread_kernel_serves_the_moon_inside_its_window_and_the_series_outside; mission_thread::earth::tli_cruise::tests::gnss_ssv_fixes_are_applied_where_the_sweep_finds_four_signals; mission_thread::earth::tli_cruise::tests::a_phase_that_lists_a_source_the_model_lacks_is_refused_and_unknown_keys_too

seg-6057015a7a7c = mission_thread::earth::entry (Entry); reentry

seg-dcb831f6f492 = mission_thread::earth::entry::tests::the_flight_path_angle_and_its_sigma_follow_the_velocity_error_over_the_speed; mission_thread::earth::entry::tests::the_corridor_probability_is_the_gaussian_mass_inside; mission_thread::earth::entry::tests::the_phase_reports_the_interface_the_corridor_the_peaks_and_the_footprint; mission_thread::earth::entry::tests::the_steep_edge_peaks_higher_and_a_limit_below_it_is_flagged; mission_thread::earth::entry::tests::bad_corridors_unknown_keys_and_burn_keys_are_refused

seg-f937752c7a50 = mission_thread::earth::ground_network::tests::a_vehicle_over_a_station_is_seen_and_one_on_the_other_side_of_the_earth_is_not; mission_thread::earth::ground_network::tests::the_moon_is_in_view_of_three_well_spread_stations_most_of_the_time; mission_thread::earth::ground_network::tests::handover_losses_reduce_the_duty_and_never_below_zero; mission_thread::earth::ground_network::tests::a_stated_duty_is_passed_through_and_bad_documents_are_refused; mission_thread::scenario::tests::the_overlay_sets_the_tracking_duty_of_a_phase_that_lists_ground_tracking

seg-75f11c7aa6bc = lunar_rendezvous (LunarRendezvousScenario); lunar_phase; mission_thread::lunar

seg-995afbdc6a9f = lunar_rendezvous::tests::b1_mean_nees_is_inside_the_registered_band_in_all_four_configurations; lunar_rendezvous::tests::circular_cw_check_is_within_the_pre_registered_bar; lunar_rendezvous::tests::same_seed_gives_identical_documents; lunar_rendezvous::tests::b6_handover_without_a_measurement_only_propagates; mission_thread::lunar::tests::every_phase_runs_and_returns_a_modelled_outcome; tests/mission_thread_lunar_oracles.rs

seg-2c293a58fb25 = lunar_landing (LunarLandingScenario); lunar_phase; terrain_nav

seg-7ac44470d95d = lunar_landing::tests::b4_with_no_aid_the_landing_error_is_the_closed_form_inertial_drift; lunar_landing::tests::b4_each_aid_reports_exactly_what_the_reused_kind_gives; lunar_landing::tests::b3_ellipse_calibration; lunar_landing::tests::a_plane_gives_no_fix_the_aperture_problem; lunar_landing::tests::a_bowl_matches_the_closed_form_bound; lunar_landing::tests::three_relays_make_the_fix_depend_on_the_clock

seg-dd3ab355cb4f = lunar_surface_map (LunarSurfaceMapScenario); lunar_phase

seg-6b6210646fdd = lunar_surface_map::tests::b5_equals_the_service_volume_for_a_single_site; lunar_surface_map::tests::b5_equals_the_service_volume_with_the_real_terrain; lunar_surface_map::tests::terrain_never_adds_availability; lunar_surface_map::tests::timing_is_at_least_either_source_and_the_season_moves_the_earth_and_sun; lunar_surface_map::tests::same_inputs_give_identical_documents

seg-b95197d3e058 = lunar_ascent (LunarAscentScenario); lunar_phase

seg-977149f40c72 = lunar_ascent::tests::with_no_aid_the_insertion_error_is_the_closed_form_inertial_drift; lunar_ascent::tests::the_aid_never_hurts_and_the_velocity_is_carried_with_its_correlation; lunar_ascent::tests::a_stale_tt_clock_costs_a_three_relay_fix; lunar_ascent::tests::the_same_inputs_give_identical_documents

seg-48ac8187364f = lunar_od (LunarForceModel); precise_od; mission_thread_lunar_oracles (example)

seg-7372185d4dd9 = tests/mission_thread_lunar_oracles.rs::the_stored_numbers_meet_or_miss_the_registered_bars_as_recorded; tests/mission_thread_lunar_oracles.rs::the_fixtures_match_their_recorded_hashes

seg-7089ca12dbe0 = mission_thread::earth::tli_cruise; propagator; mission_thread_oracle (example)

seg-f4b44b14d819 = tests/mission_thread_oracle.rs::the_stored_numbers_miss_the_registered_bars_as_recorded; tests/mission_thread_oracle.rs::the_diagnostic_places_the_miss_in_five_impulsive_events_not_in_the_force_model; tests/mission_thread_oracle.rs::the_kernel_cut_and_the_recorded_inputs_match_their_hashes

seg-67fdcdfdb635 = interference_map::emitter (estimate, sessions, build_units, profile, GaussianFix::from_tdoa), interference_map::emitter_out (locate), <c1/>

seg-920b26e226ab = Unit-Tests von interference_map::emitter (Projektions-Rundlauf, Horizontwert, synthetische Vorwärts- und Rückwärts-Rundläufe: Der bekannte Sender liegt etwa mit der genannten Rate innerhalb der genannten Region, Randfälle, Sitzungsclustering, Profil, Datenschutz und Formulierung); Fälle von locate in tests/interference_map_cli.rs

seg-db7a6ac0a47d = Das vollständige, maschinengeprüfte Nachweisregister: <b>{ "412" } Zeilen — { "176" } VALIDATED, { "232" } MODELLED, { "4" } PARTNER</b>. Eine Zeile darf nur mit einer unabhängigen externen Referenz VALIDATED sein (die Invariantentests der Matrix erzwingen das). Dieselben Daten, mit anklickbaren Links je Zeile zu jedem Test, Modul und eingecheckten Fixture, sind das <em>Validierungsregister</em> auf <a1>https://kshana.dev</a1>. Siehe <a2>MODELLED-RATIONALE.md</a2>, warum jede modellierte Zeile nicht extern validiert ist.

seg-1cc523709234 = { "412" } Zeilen: { "176" } extern validiert, { "232" } modelliert, { "4" } im Besitz von Partnern.
