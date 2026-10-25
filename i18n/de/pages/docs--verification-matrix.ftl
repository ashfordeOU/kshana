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
seg-a83c68500982 = Drei unabhängige Werkzeuge, vorab festgelegt (0123cee1), bevor irgendeine Fixture oder Ausgabe einer unabhängigen Referenz existierte, Toleranzen damals festgelegt. ({ "1" }) ARAIM: Stanford MAAST für ARAIM { "2" } (Commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als getrenntes Programm unter GNU Octave { "8.4" } mit einer treiberseitigen Kompatibilitätsschicht für unique() ausgeführt (offengelegt, keine Änderung am Algorithmus), bei der ADD-Toleranz TOL_PL von { "0.05" } m: Das Rust-Programm reproduziert die ADD-Referenzimplementierung an { "270" } echten Fällen. Offengelegt: Der ADD-Pfad von Kshana wurde nach der Vorregistrierung geschrieben, nach dem ADD, wie MAAST ihn umsetzt; ein unabhängiger zurückgehaltener Datensatz des Prüfers ({ "270" } neue Nutzergeometrien und eine zweite Integritäts-Unterstützungsnachricht, MAAST gegen den eingefrorenen Code neu ausgeführt) bestand denselben Zielwert. ({ "2" }) Snapshot-RAIM: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde in einem getrennten C-Harness für Erkennung und Ausschluss; das PL nach der Steigung aus RTKLIB matinv/xyz2enu plus SciPy { "1.18.1" } chi2/ncx2, wobei beide Seiten dieselbe geschlossene Form auswerten (Brown; Parkinson und Axelrad), sodass die PL-Prüfung die Implementierung abdeckt, nicht die Formel. ({ "3" }) SBAS: Stanford MAAST (Commit 7d32b049) usr_vhpl, unverändert, auf den von MAAST selbst aufgezeichneten WAAS-Broadcasts: L1-Niveaus innerhalb von { "1e-4" } m nach der K-Neuskalierung und eine gleiche geschützte Menge. Dieselben Vergleiche ergaben die in der Fähigkeit genannten Befunde: Die ARAIM-Funktionen mit einheitlichem Sigma sind nicht ADD-konform, und die Mengengleichheit bei L5 scheitert an { "308" } Paaren ohne GEO in Sicht (die Niveaus der { "3267" } Paare, die beide Werkzeuge schützen, stimmen auf { "1e-13" } m überein). Die K-Faktoren aus DO-229E/DO-316 sind übertragene Konstanten und die echte Geometrie ist eine Eingabe; keines von beiden wird als unabhängige Referenz gezählt. Revision { "0.30" }: Die Schutzniveaus von snapshot_raim wurden von der radialen auf die geodätische lokale Ebene verlegt (bis zu { "0.31" } m HPL und { "0.14" } m VPL bei { "16" } Grad N)

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
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio mit einem verdeckenden Körper WGS-84 und einem sphärischen OneAxisEllipsoid, als getrenntes Programm mit der Sonne an derselben inertialen Position ausgeführt. Zielwerte vorab festgelegt in xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } auf beiden Seiten und eine Streuung zwischen abgeplattet und Kugel von > { "1e-2" }; alle erreicht. Die Ellipsoidachse ist auf beiden Seiten die inertiale z-Achse (keine Präzession-Nutation)

# text
seg-01066d639b39 = Box-Wing- und ECOM2-Strahlungsdruck der Sonne, mit partiellen Ableitungen (optional)

# text
seg-2a5fc9708bd0 = SRP ohne Kanonenkugel: ein Flachplattenmodell Box-Wing (Vallado Gl. 8-44; einseitige Körperpaneele, zur Sonne zeigende Flügel) mit den Tabellen für Galileo FOC, IOV und IOV am Lebensende aus den Satellitenmetadaten der GSC, in nominaler GNSS-Gierlenkung, mit analytischen partiellen Ableitungen für den Strahlungsfaktor und die spekularen und diffusen Koeffizienten jedes Paneels; und das empirische Modell ECOM2 (D2/B1) mit seinen partiellen Ableitungen. Das Box-Wing ist optional im Cowell-Propagator (propagator::ForceModel::box_wing_srp, setzt sein Feld srp_boxwing) und im Modell der präzisen Bahnbestimmung (precise_od::PreciseForceModel::box_wing_srp), wobei es den Kanonenkugel-Term mit cr als Strahlungsfaktor ersetzt; beide stehen standardmäßig auf None, sodass jeder bestehende Pfad byteidentisch bleibt. ECOM2 ist in kein Kraftmodell eingebunden

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft mit FixedPanel und PointingPanel, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), nominale Gierlenkung GenericGNSS und ECOM2(nD = { "2" }, nB = { "1" }), als getrenntes Programm mit der Sonne an festen inertialen Positionen ausgeführt; die Ableitung des Strahlungsfaktors aus Hipparchus Gradient, Ableitungen je Paneel als zentrale Differenzen von Orekit (Orekit hat keine). Zielwerte vorab festgelegt in xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), bevor irgendeine Ausgabe von Orekit existierte: { "1e-12" } relativ ({ "1e-11" } Ende zu Ende, { "1e-9" } für die Differenzen); alle erreicht (RESULTS.md). VALIDATED deckt nur die Modellauswertung ab: Die GSC-Tabellen sind übertragene Eingaben, und die Eignung eines Box-Wing für echte Galileo-Bahnen, die thermische Re-Emission, das modifizierte Gierlenkungsgesetz bei kleinem Beta und Eklipsenwenden sind nicht abgedeckt; die SRP-Vorhersage für Galileo bleibt MODELLED

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
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, das den NRL-Fortran GTD7D in einfacher Genauigkeit ausführt, und die C-Portierung von NRLMSISE-00 (Release { "20190709" }, gemeinfrei), als getrenntes Programm kompiliert, dazu die { "17" } veröffentlichten Testausgaben der C-Distribution. Zielwerte vorab festgelegt in xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a), bevor die Portierung existierte; alle erreicht (RESULTS.md). Validiert die Portierung, nicht die Genauigkeit des Modells gegenüber gemessener Dichte

# text
seg-12977f65b2ea = Luftwiderstands-Dichtestufe NRLMSISE-00 (optional)

# text
seg-17aec847b675 = forces::DensityModel (Exponential als Standard, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) und propagator::ForceModel::drag_density: quadratischer Luftwiderstand gegen die mitrotierende Atmosphäre mit der Dichte nach NRLMSISE-00 am geodätischen Punkt in WGS-84 (Erdrotationswinkel mit UT1 = TT, lokale Sonnenzeit UT + lon/15), konstantes Weltraumwetter je Modell; standardmäßig aus und bitidentisch

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 mit DragForce über die eigene NRLMSISE00-Implementierung von Orekit, als getrenntes Programm mit demselben Bezugssystem des Erdrotationswinkels, derselben Form WGS-84, derselben Konvention der lokalen Sonnenzeit (eine mittlere Sonne) und TT als UT ausgeführt; die Einrichtung der Konventionen wurde Referenz gegen Referenz geprüft (Orekit gegen pymsis, { "5.2e-5" } in der Dichte). Zielwerte vorab festgelegt in xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } der Luftwiderstandsverschiebung und zwei Empfindlichkeitsprüfungen > { "100" } m; alle erreicht. Nicht abgedeckt: die Genauigkeit des Modells gegenüber gemessener Dichte, zeitvariantes Weltraumwetter, ein Zweig mit GMAT

# text
seg-1ac7430e88fc = Standard-Exponential-Luftwiderstand gegen eine unabhängige Implementierung (äquatorial)

# text
seg-a9c41b03f2ca = Der Standard-Luftwiderstand des Cowell-Propagators: quadratischer Luftwiderstand gegen die mitrotierende Atmosphäre mit forces::atmospheric_density, der stückweise exponentiellen Tabelle aus Vallado Tabelle 8-4 bei der sphärischen Höhe (propagator::ForceModel::drag mit der Standardvariante Exponential von forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole mit der Exponential-Atmosphäre (dieselbe Tabelle mit 28 Bändern), Punktmasse-Erde und PrinceDormand78, ausgeführt, nie eingebunden. Zielwerte vorab festgelegt in xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) auf der Luftwiderstandsverschiebung jeder Seite (Lauf mit Luftwiderstand minus Lauf ohne), die die beiden Werte von mu der Erde und die Integratoren auslöscht; alle erreicht (RESULTS.md). GMAT nimmt die geodätische Höhe und kshana die sphärische Höhe: Sie fallen nur am Äquator zusammen, daher deckt VALIDATED äquatoriale Bahnen ab; abseits des Äquators unterscheiden sich die Modelle absichtlich ({ "10.4" } % der Verschiebung über { "24" } h bei { "51.6" } Grad, { "400" } km). Der öffentliche Build von GMAT hat kein NRLMSISE-00 (Plugin fehlt), sodass die Stufe NRLMSISE-00 nur die Referenz von Orekit hat. Die Genauigkeit der Tabelle gegenüber gemessener Dichte ist nicht abgedeckt

# text
seg-9e15970435c3 = Sonne und Mond aus DE440 im Cowell-Kraftmodell (optional)

# text
seg-de6831cf7785 = Optionale Ephemeridenstufe für die Terme der Gravitation dritter Körper und des SRP im numerischen Cowell-ForceModel: die geozentrische Sonne und der Mond aus jedem EphemerisProvider (ein DE440-SPK-Kernel über KernelEphemeris) bei TDB = TT + (TDB - TT), wobei ein Provider, der die Epoche nicht bedienen kann, zurückgewiesen und jeder Rückfall auf die analytische Reihe gezählt wird; standardmäßig aus

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 mit ThirdBodyAttraction und SolarRadiationPressure auf dem eigenen DE440-Leser von Orekit (orekit-data lnxp1990.440), als getrenntes Programm ausgeführt; kshana liest einen bitgenauen, mit SPICE geprüften Ausschnitt von NAIF de440s.bsp. Zielwerte vorab festgelegt in xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Der Bahn-Zielwert ({ "0.5" } m) und die Empfindlichkeitskontrolle sind erreicht, aber der Zielwert für die Position von Sonne/Mond ({ "3" } m / { "0.2" } m) wurde mit { "6.39" } m / { "0.244" } m verfehlt. SPICE, das denselben Kernel bei seiner exakten TDB liest, verfehlt Orekit um denselben Betrag ({ "6.25" } m / { "0.240" } m), sodass die Lücke zwischen dem Pfad de440s von NAIF und dem DE440-Leser oder der Zeitskala von Orekit liegt; Ursache nicht isoliert. Festgehalten und festgelegt, daher bleibt die Zeile MODELLED

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
seg-4745148b6c60 = Biancale und Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), Tabelle { "5" }, Modell A2: Ray ({ "2001" }) veröffentlicht in voll normierten Harmonischen mit Sinus-Vorlauf-Phasen, eine unabhängige Darstellung desselben Modells. Vorab festgelegt in xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) zusammen mit der Korrektur, die es validiert. Deckt nur die Koeffizientenumrechnung ab; die Wirkung der Luftgezeit auf das Geopotenzial hat keine externe unabhängige Referenz

# text
seg-444f0a65b6fd = Tesserales Geopotenzial im Cowell-Propagator

# text
seg-ad475816bc78 = Optionales tesserales EGM2008-Feld (bis Grad/Ordnung { "70" }) als zentrale Gravitation des numerischen Cowell-ForceModel, ausgewertet in einem erdfesten Bezugssystem, das um den Erdrotationswinkel der IAU { "2000" } gedreht wird (oder über die CIO-Kette GCRS nach ITRS); standardmäßig aus, sodass sich keine bestehende Ausgabe ändert

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 mit HolmesFeatherstoneAttractionModel über dieselben Koeffizienten (tools/egm2008_to70.gfc) in einem Körperbezugssystem, das mit derselben Erdrotationswinkel-Formel gedreht wird, als separates Programm ausgeführt. Zielwerte vorab festgelegt (f0e0e65, vor jedem Vergleich in 2da899a geändert): |dr| <= { "0.5" } m und |dv| <= { "5e-4" } m/s, und beide Negativkontrollen verfehlen um > { "100" } m; alle erreicht, die Zielwerte wurden danach auf { "0.1" } m und { "1e-4" } m/s verschärft. Nicht validiert: Genauigkeit der Erdorientierung (beide Seiten verwenden UT1 = TT ohne Präzession-Nutation im Era-Bezugssystem), die Option des Cio-Bezugssystems (nur interne Prüfung), Grade über { "70" }

# text
seg-e8f5ff8c9149 = Sphärisch-harmonische Gravitation hohen Grades (EGM2008 bis { "2190" })

# text
seg-d3b2f32dcecb = Unterlauf- und polsichere Auswertung eines vollständig normierten Feldes bis Grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, modifizierte Vorwärtsspalte nach Holmes-Featherstone { "2002" } mit einem Gradienten ohne 1/cos phi), ein streamender ICGEM-.gfc-Lader (from_gfc_file / from_gfc_reader; das vollständige EGM2008 wird zur Laufzeit geladen, nicht mitgeliefert) und der Holmes-Featherstone-Auswerter, der für das optionale Cowell-Geopotential wählbar ist

# text
seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel und pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, als separate Programme ausgeführt; Zielwerte vorab festgelegt in xval/high-degree-gravity/PREREGISTRATION.md (276c869f) und xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit stimmt überall überein, wo es definiert ist, aber pyshtools verfehlt seinen vorab festgelegten Zielwert an den beiden polnahen Punkten (bis zu { "7.3e-10" } m/s^{ "2" }; eine 50-stellige mpmath-Prüfung ordnet den Fehler pyshtools zu), es gibt keinen Referenzwert genau auf der Polachse, und die vorab festgelegte Sensitivitätskontrolle für Grad 70 der { "24" }-h-Bahn wurde verfehlt ({ "0.726" } m gegen > { "1" } m). Jede Verfehlung ist festgehalten und nicht weggetunt, daher bleibt die Zeile MODELLED

# text
seg-e81b7418c382 = DOP853-Integrator

# text
seg-e6e3638aa68e = Explizites Runge-Kutta-Verfahren Hairer DOP853 { "8" }({ "5,3" }) mit dem kombinierten Fehlerschätzer 5. und 3. Ordnung, dem SciPy/Hairer-Schrittweitenregler, automatischer Anfangsschrittweite, einer fail-closed-Schrittwächter-Prüfung und dichter Ausgabe 7. Ordnung; wählbar als Integrator-Variante Dop853 des Propagators / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) und seine Routinen für Einzelschritt, Fehlernorm, dichte Ausgabe und Anfangsschrittweite, eine unabhängige Implementierung; exakte Zweikörperzustände aus mpmath { "1.3.0" } mit { "40" } Stellen. Zielwerte vorab festgelegt in xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) vor dem ersten Vergleich; alle erreicht (xval/dop853-scipy/RESULTS.md). Der erste Schritt von SciPy wird in den vollständigen Läufen beiden Lösern vorgegeben; die Routine für die Anfangsschrittweite wird getrennt verglichen. Nicht abgedeckt: RKF7({ "8" }), Steifigkeitserkennung, Ereignislokalisierung

# text
seg-9ad7c1f4da77 = Robuster Löser der Kepler-Gleichung

# text
seg-4b9d812fd13e = Elliptischer Kepler-Löser für alle { "0" } <= e < { "1" } und alle mittleren Anomalien: kubischer Startwert und Korrektur fünfter Ordnung nach Markley ({ "1995" }), ein auslöschungsfreies Residuum (1-e)E + e(E - sin E) - M und abgesicherte Newton-Nachpolierung (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause), 50-stellige Nullstellen aus den exakten binären Eingaben. Zielwerte vorab festgelegt in xval/kepler-mpmath/PREREGISTRATION.md (df22174), bezogen auf |E| mit dem Konditionierungsargument e -> { "1" }, M -> { "0" }; alle erreicht (xval/kepler-mpmath/RESULTS.md). Die älteren Löser (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) sind numerisch unverändert, weil festgeschriebene Ausgaben von ihnen abhängen, und werden von dieser Zeile nicht abgedeckt

# text
seg-1960804ef2f4 = Bahnbestimmung im Batch-Verfahren aus Entfernungsraten und Az/El mit Stationsmaskierung

# text
seg-4c185244bc66 = Rekonstruktion eines Epochenzustands aus gemischter Entfernungs-, Entfernungsraten- und Azimut/Elevations-Verfolgung oberhalb einer Elevationsmaske durch Gauss-Newton auf H = (dh/dx(t)) Phi(t, t0): analytische Messpartiale und eine variationelle Zustandsübergangsmatrix mit analytischen Zweikörper- + J2-Partialen (RK4-integriert, keine geschlossene STM)

# text
seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator mit benutzerdefinierten momentanen geometrischen RangeRate- und AzEl-Messungen (gegen Orekits TopocentricFrame gegengeprüft), als separates Programm auf identischen, maskierten, gesetzten Beobachtungen ausgeführt. Zielwerte vorab festgelegt in xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Jeder Zielwert erreicht außer B4, der rauschfreien Zustandsübereinstimmung von { "1" } cm, verfehlt in { "2" } von { "4" } Szenarien ({ "1.46" }, { "1.74" } cm): Orekits eigene rauschfreie Schätzung liegt so weit von seiner simulierten Wahrheit entfernt (Ursache auf Orekit-Seite nicht isoliert). Festgehalten und festgeschrieben, daher bleibt die Zeile MODELLED. Nicht modelliert: Lichtlaufzeit, Aberration, Refraktion, Erdrotation, ein sequenzielles Filter für diese Messtypen

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
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause), das dieselben PDS-Dateien liest und die Punktgravitation auswertet, als separates Programm ausgeführt, sowie die veröffentlichten Header und Labels der PDS-Produkte. Zielwerte vorab festgelegt in xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); alle erreicht (RESULTS.md). Daten: NASA PDS Geosciences Node, gemeinfrei; Ausschnitte bis Grad 20 mit NOTICE mitgeliefert, vollständige Dateien werden zur Testzeit geladen

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
seg-1575dc4cfb4a = Die gedruckten Werte des CODE-GIM (exakt an jedem Knoten; die Karte wird zur Testzeit geladen, nicht mitgeliefert, da ihre Lizenz unbestätigt ist) und eine unabhängige Neuimplementierung der IONEX-{ "1.0" }-Interpolationsformeln mit der Python-Standardbibliothek, mit dem Fixture festgeschrieben (Zielwerte vorab festgelegt e4d8b1f, { "1e-9" } TECU). Prüfung durch Dritte (B6, vorab festgelegt, erster Lauf): RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, als separates Werkzeug ausgeführt) stimmt an { "6885" } Abfragepunkten mit IonexFile::vtec_at auf { "3.6e-13" } TECU in beiden Interpolationsmodi überein, gegen einen Zielwert von { "1e-5" } TECU. Datengebunden: CODE-GIM wird zur Testzeit geladen, SHA-fixiert; RTKLIB liest die vollständige Datei, weil sein getindex den Breitenausschnitt zurückweist. tests/fixtures/ionex_code_gim/fetch.sh lädt sie und prüft den SHA-256, der Test schlägt bei allen anderen Bytes fehl, und run_rtklib.sh ist der dokumentierte Reproduktionsweg (Netzwerkzugang erforderlich). Auf VALIDATED hochgestuft durch Entscheidung des Eigentümers auf Grundlage datengebundener Nachweise (2026-10-13)

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
seg-687b3b159691 = Die zusammengeführte RINEX-{ "3" }-Broadcast-Datei des IGS desselben Tages (veröffentlichte Daten, von einem anderen Dateigenerator aus denselben Broadcast-Nachrichten geschrieben); Zielwerte vorab festgelegt in tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) vor dem ersten Lauf

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
seg-06d500099814 = Vorab festgelegt (7aa264b, 110fef9) gegen eine präzise IGS-MGEX-Bahn mit den GEOs; aus der Sitzung, die es gebaut hat, war kein solches Produkt erreichbar, daher steht der Vergleich aus und die Zeile ist MODELLED (nur gegen die veröffentlichten nominellen GEO-Positionen geprüft)

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
seg-e0cc33dfb10b = Gemessen gegen die rekonstruierte CAPSTONE-Ephemeride von JPL Horizons (NAIF -1176, CAPSTONE_merged, mondzentriertes ICRF, 2023-03-01..31 mit { "10" } min), byteweise festgeschrieben (tests/fixtures/capstone_horizons/, NOTICE.md), vorab festgelegt { "4e868170" } vor dem Abruf, als Messung mit Zielwerten für die mittlere Geometrie. Keine Validierung: Das CR3BP lässt die Sonne, die Exzentrizität des Mondes und die von CAPSTONE durchgeführte Bahnhaltung aus, daher beschreiben die Zielwerte, wie repräsentativ die Modellbahn ist, nicht eine Genauigkeit. Ergebnisse: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = CR3BP-Rotationszustände, auf der Erde-Mond-Linie nach DE440 in mondzentriertes ICRF abgebildet

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf bildet einen dimensionslosen rotierenden Erde-Mond-CR3BP-Zustand auf eine mondzentrierte ICRF-Position und -Geschwindigkeit auf der momentanen Erde-Mond-Linie ab (Längeneinheit der Erde-Mond-Abstand, Zeiteinheit die inverse Bahnrate, die volle Winkelgeschwindigkeit des Bezugssystems einschließlich seiner Rate außerhalb der Ebene aus der Beschleunigung des Mondes), mit der Umkehrung from_moon_centred_icrf, und cr3bp::to_moon_centred_icrf_de440 liest den geozentrischen Mondzustand aus einem DE440-SPK. Es bildet Zustände ab; es macht eine CR3BP-Bahn nicht zu einer Bahn eines Ephemeridenmodells

# text
seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) sxform eines dynamischen Zwei-Vektor-Bezugssystems (primär +X entlang der Position des Mondes bezüglich der Erde, sekundär +Y entlang seiner Geschwindigkeit, de440s), angewendet auf den dimensionsbehafteten rotierenden Zustand, der aus dem eigenen Mondzustand von SPICE gebildet wird, durch ein separates Programm, das keinen Kshana-Code aufruft (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Vorab festgelegt 2313eb1b, vor jedem Lauf in d5ef79b3 geändert, um die Winkelgeschwindigkeit des Bezugssystems außerhalb der Ebene einzuschließen (ohne sie wäre die Geschwindigkeit um bis zu { "8e-2" } m/s abweichend). Nur eine Bibliotheksprüfung der Transformation. Ergebnisse: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Sonnensystem-Art auf einem JPL-Kernel (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = Die Art <c1/> mit planetary_kernel_path: Jeder gemeldete Körper, dessen eigenen NAIF-Code der SPK enthält, bezieht seine heliozentrische J2000-Position und -Geschwindigkeit über den eigenen Leser der Engine aus dem Kernel (Label KERNEL), eine Verbindung, deren beide Enden im Kernel liegen, wird darauf berechnet, Baryzentren werden nie für einen Planeten eingesetzt, und jeder andere Körper bleibt analytisch mit seinem eigenen Label; der Bericht erhält einen Kernel-Block (Pfad, SHA-256, die daraus entnommenen Körper und Verbindungen) nur, wenn die Option gesetzt ist. Mit de440s.bsp sind das Merkur, Venus, die Erde und der Mond

# text
seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) spkezr, heliozentrische Zustände auf der vollständigen de440s.bsp, ein separates Programm, das keinen Kshana-Code aufruft (tests/fixtures/solar_system_kernel/, NOTICE.md); die Engine liest bitgenaue Ausschnitte von de440s. Vorab festgelegt f8e946ea. Eine Bibliotheksprüfung der Verdrahtung: DE440 selbst und die analytischen Körper werden hier nicht validiert. Ergebnisse: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop-Diagramm auf der DE440-Ephemeride

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: der Durchlauf über Starttermin x Ankunftstermin von Abflug-C3 (km²/s²) und Ankunfts-V-Unendlich (km/s) mit dem prograden Lambert-Löser für eine Umdrehung und der Kollinearitätssperre von { "0.5" } Grad, auf den heliozentrischen J2000-Zuständen zweier beliebiger NAIF-Körper, die vom eigenen Leser der Crate aus einem JPL-DE440-SPK gelesen werden. Eine Umdrehung, prograd, keine Randbedingungen für Trägerrakete oder Ankunft: ein Durchlauf, kein Missionsentwurf

# text
seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 über spiceypy { "8.3.0" }) heliozentrische Zustände auf de440s.bsp und pykep { "3.0.1" } lambert_problem (ESA, der C++-Kern kep3, MPL-2.0), ein unabhängiger Lambert-Löser, als separates Programm ausgeführt, das keinen Kshana-Code aufruft (tests/fixtures/porkchop_de440/, NOTICE.md); die Engine liest einen bitgenauen Ausschnitt von de440s. Vorab festgelegt 2d857fb1. Eine Bibliotheksprüfung des Durchlaufs. Ergebnisse: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

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
seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, der C++-Kern kep3, MPL-2.0), eine unabhängige Bibliothek, von scripts/gen_lambert_multirev_ref.py als separates Programm ausgeführt; nur ihre numerische Ausgabe ist festgeschrieben. Vorab festgelegt a75de851 (Fallmenge, Zielwerte, Ergebnisregel) vor jedem Vergleich; die Referenz wurde unabhängig neu erzeugt und ist byte-identisch. Ergebnisse: docs/design/evidence/lambert-multirev/RESULTS.md

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
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: erfa.dtf2d("UTC"), erfa.utctai und erfa.taiutc auf den festgeschriebenen Zeitpunkten, die Abweichung teilweise auf den zweiteiligen Daten gebildet, Zielwert { "1e-6" } s vor dem Lauf festgelegt (vorab festgelegt e947e69d). Schlechteste Abweichung { "9.6e-12" } s (dtf2d) und { "1.9e-11" } s (utctai, taiutc). Wird jeder UTC-Tag als { "86 400" } s genommen oder der Schalttagsanteil nicht skaliert, wird der Test rot. UT1 über TAI (iauUtcut1) wird durch den ERFA-Zweig der Zeile zum Pfad der Erdbahn geprüft. Geltungsbereich: UTC ab 1972-01-01; das frühere UTC mit driftender Rate ist nicht modelliert

# text
seg-f1c7bc235a6b = Zweiteilige Julianische Daten bis zur Erdrotation auf dem Bahnpfad

# text
seg-cee11d4bad08 = Erdrotation aus einem zweiteiligen Julianischen UT1-Datum auf dem Bahnpfad, sodass die erdfeste Position die Mikrosekunde behält, die ein einzelnes f64-Datum verliert (etwa { "3e-9" } rad nahe { "2020" }): jd2::gmst82 (IAU-{ "1982" }-GMST, die TEME-Konvention, auf den zwei Teilen), cio::gcrs_to_itrs_matrix_jd2 (die CIO-Matrix GCRS nach ITRS mit dem Erdrotationswinkel aus den zwei Teilen) und, darauf aufgebaut und intern geprüft, frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 und own_jd2_utc, die optionale two_part_jd des Ephemeriden-Szenarios (die ECEF-Position, Bodenspur und Stationssicht; standardmäßig aus, unverändert) und verlustfreie From-Konvertierungen zwischen jd2::Jd2 und timescales::TwoPartJd. Präzession-Nutation und die Epoche des Cowell-Kraftmodells bleiben einfaches f64, wo eine Rundung von { "40" } us unter { "1e-15" } rad oder weit unter dem Fehler der analytischen Sonnen-/Mondephemeride liegt

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: gmst82 und c2t06a auf den festgeschriebenen zweiteiligen Daten, Polbewegung { "0.1" } und { "0.3" } Bogensekunden. Vorab festgelegt b10475ee (Daten, Zielwerte), bevor die Funktionen geschrieben und bevor die unabhängige Referenz ausgeführt wurde. Die internen Tests (die Szenario-Option, der TEME/ITRF-Rundlauf, die Typkonvertierungen) sind unterstützende Selbstkonsistenz

# text
seg-096df3971f5f = Bezugssystem-Matrizen gegen ERFA-Vektoren: IAU-{ "2006" }-Bias-Präzession, TEME nach GCRS und die CIO-Kette mit Offsets des Himmelspols

# text
seg-731a5ed967b3 = Drei Bezugssystem-Matrizen, die Element für Element oder nach Drehwinkel mit ERFA zu beliebigen Epochen verglichen werden: precession::precession_matrix (IAU-{ "2006" }-Bias-Präzession durch Fukushima-Williams-Winkel), nutation::teme_to_gcrs_matrix (die Rotation TEME nach GCRS P^T N^T Rz(-EE) mit IAU-{ "2006" }-Präzession, IAU-2000B-Nutation und der Äquinoktiengleichung mit ihren zwei führenden komplementären Termen) und cio::gcrs_to_cirs_matrix_with_offsets (die Rotation GCRS nach CIRS mit den IERS-Offsets des Himmelspols dX, dY, die vor der Rotation zu den Modell-CIP-X, -Y addiert werden, die Konvention des SOFA-Kochbuchs; neu). Die Modellentscheidungen selbst (2000B-Nutation auf dem TEME-Pfad, die komplementäre Reihe mit zwei Termen) sind nicht validiert, nur ihre Implementierung

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: pmat06; numat(obl06, nut00b) mit der Äquinoktiengleichung aus eect00 (die vollständige komplementäre Reihe), zusammengesetzt als P^T N^T Rz(-EE); xys06a, dann c2ixys(X + dX, Y + dY, s). Vorab festgelegt 979c1e39 (Epochen, Offsets und Zielwerte), bevor die unabhängige Referenz ausgeführt wurde. Das TEME-Residuum von { "1.1e-10" } rad ist die vorhergesagte Wirkung davon, zwei komplementäre Terme beizubehalten (etwa { "3" } mm auf einer GNSS-Bahn)

# text
seg-4e2fe2e3dabb = UTC vor 1972 (Ära mit driftender Rate) auf dem Zeitpfad zweiteiliger Julianischer Daten

# text
seg-1d086e669f09 = UTC von 1960-01-01 bis 1971-12-31, als UTC mit einer Ratenabweichung gegenüber TAI lief und in Sekundenbruchteilen gestuft wurde, auf dem Pfad zweiteiliger Julianischer Daten: TAI - UTC aus der Drifttabelle jeder Periode (timescales::tai_minus_utc_on_date), das UTC-Kalenderdatum zu einem zweiteiligen Julianischen UTC-Datum mit der Tageslänge { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC zu TAI mit dem von UTC auf SI-Sekunden skalierten Tagesanteil (jd2::utc_to_tai) und TAI zurück zu UTC (jd2::tai_to_utc), nach SOFA dtf2d, utctai und taiutc. Vor { "1960" } wird TAI - UTC als { "0" } genommen (der Wert von SOFA; UTC undefiniert) und liegt außerhalb der Aussage. Das einfache f64 timescales::tai_minus_utc begrenzt vor { "1972" } weiterhin auf { "10" } s und wird nicht abgedeckt

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; die SOFA-Algorithmen, wie sie vom ERFA-Projekt freigegeben werden), eine unabhängige Bibliothek: erfa.dtf2d("UTC"), erfa.utctai und erfa.taiutc auf den festgeschriebenen Zeitpunkten, die Abweichung teilweise gebildet. Vorab festgelegt 23c40661 (Zeitpunkte, Toleranz und die Prüfsumme ab { "1972" }), bevor die Engine geändert und bevor die unabhängige Referenz ausgeführt wurde. Die Drifttabelle ist aus derselben SOFA-iauDat-Tabelle übertragen, die die unabhängige Referenz verwendet, sodass der Vergleich die Umrechnungsarithmetik (Tageslänge, Skalierung UTC nach SI, Iteration) abdeckt, nicht die historische Tabelle selbst

# text
seg-efacec095051 = GLONASS-Broadcast-Satellitenuhr und Broadcast-Bahnfortschreibung

# text
seg-821b9c01b56e = Der GLONASS-Broadcast-Satellitenuhrversatz -tau_n + gamma_n (t - t_b) zu einer auf der Satellitenuhr gelesenen Zeit (glonass::GlonassEphemeris::sv_clock_bias_s, der um den Uhrversatz korrigierte Offset durch zwei Fixpunktiterationen) und die erdfeste PZ-90-Position des Broadcast-Zustandsvektors, per RK4 durch die GLONASS-ICD-Bewegungsgleichungen innerhalb von +/-15 min um die Referenzepoche fortgeschrieben (GlonassEphemeris::position_ecef), aus echten RINEX-{ "3" }-GLONASS-Navigationsdatensätzen. Es wird keine Transformation PZ-90.11 nach ITRF angewendet (sie stimmen seit { "2014" } auf Zentimeterebene überein; RTKLIB wendet auch keine an). Nicht in eine Szenarioausgabe eingebunden: Bibliotheksfunktion

# text
seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, Commit 71db0ffa) geph2clk und geph2pos, aus C-Quelltext in einem separaten Harness (xval/rtklib-glonass) kompiliert, das dieselbe RINEX-Datei mit dem eigenen Leser von RTKLIB liest, sodass das Parsen, das Vorzeichen von -tau_n, die Einheiten und die Iteration ebenso verglichen werden wie die Uhr und die Bahn. Vorab festgelegt e099c42a, bevor die Funktion existierte und bevor das Harness gebaut wurde. Beide Seiten werten dieselbe geschlossene Uhrenformel aus, daher deckt der Uhrenvergleich die Implementierung ab, nicht die Formel. Die Bahnintegratoren unterscheiden sich (RTKLIB schreitet in { "60" }-s-Schritten, dann den Rest, Kshana in gleichen Schritten von höchstens { "60" } s) und ebenso die Konstanten (RTKLIB mu { "3.9860044e14" }, Kshana das PZ-90.11 { "3.986004418e14" }); der schlechteste Fall von { "1.1" } mm ist dieser Unterschied, wie vor dem Lauf vorhergesagt. Geltungsbereich: die Broadcast-Ephemeride innerhalb ihres Gültigkeitsintervalls, nicht die wahre Bahn oder Uhr (kein Vergleich mit Präzisionsprodukten)

# text
seg-d3b72a6fbb18 = Ein Erdbahn-Pfad: SGP4-Elementsätze zu GCRS und ITRS auf der Kette nach IAU 2006/2000A mit Erdorientierungsparametern

# text
seg-e4eca7205b5e = Der Fortschreibungs- und Bezugssystempfad, den jede geroutete Erdbahn-Art teilt: ein mittlerer SGP4-Elementsatz mit einer zweiteiligen UTC-Epoche (sgp4::MeanElementSet, aus Elementen des Konstellationsentwurfs durch MeanElementSet::from_earth_fixed gelesen), durch SGP4/SDP4 nach TEME fortgeschrieben (sgp4::SgpOrbit), und die Rotationen TEME -> ITRS und GCRS -> ITRS der Kette nach IAU 2006/2000A mit UT1 - UTC und Polbewegung (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, die Formen ohne Parameter teme_to_itrs_matrix und gcrs_to_itrs_matrix). TEME ist der wahre Äquator des Datums mit dem mittleren Äquinoktium, vom GCRS aus erreicht über die IAU-{ "2006" }-Bias-Präzession, die IAU-2000B-Nutation und die Äquinoktiengleichung

# text
seg-44f28276f859 = Zweig { "1" }: python-sgp4 { "2.24" } (MIT-Lizenz; D. Vallados C++-Referenz-SGP4, der Code, der die Verifikationsvektoren AIAA 2006-6753 erzeugt hat), WGS-72, verbesserter Modus. Zweig { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, die SOFA-Routinen): c2t06a mit TT aus utctai/taitt und UT1 aus utcut1, und für TEME c2t06a . pnm06a^T . rz(-ee06a). Zielwerte vor dem Lauf festgelegt (vorab festgelegt 72ea9eb0). Offengelegt: Der erste Lauf scheiterte in Zweig { "2" } bei 2016-12-31T23:{ "59" }:{ "59.5" } um eine Sekunde Rotation (UT1 wurde an einem Tag mit Schaltsekunde aus dem quasi-Julianischen UTC-Datum genommen); die Engine wurde korrigiert (jd2::utc_to_ut1) und der zweite Lauf stimmt mit den unveränderten Zielwerten überein. Entfällt die Polbewegung ({ "46" } Fehlschläge) oder werden WGS-84-Konstanten statt WGS-72 verwendet ({ "4432" } Fehlschläge), wird der Test rot. Dieser Entwurf mit drei Zweigen ersetzte einen durchgehenden Orekit-Vergleich, der am SDP4 von Orekit bei e = { "0" } und an dessen IERS-{ "1996" }-TEME scheiterte (der Befund bleibt in tests/leo_polar_coverage_full_claim_orekit_oracle.rs festgeschrieben)

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
seg-238597f6aa01 = Analytische Struktur des Datumsdefekts — die nicht beobachtbare Mode des absoluten Bezugssystems liegt im Nullraum der Fisher-Information (geschlossene Form), die Rangschwelle entspricht der veröffentlichten Begründung für den Entwurf mit 3 Stationen, und der Schätzer erreicht die resultierende CRLB in Monte-Carlo-Läufen. Die Mondgeometrie selbst ist ein repräsentatives Netz (keine geflogene Ephemeride), daher bleibt die Zeile MODELLED; die zugrunde liegende FIM/CRLB-Engine wird gesondert gegen die geschlossenen Formen nach Kay ({ "1993" }) geprüft. { "0.30" } Runde { "2" } (vorab registriert fab02df9), blockiert (bleibt MODELLED): NumPy/SciPy berechnen den Rang und den Defekt bei der angegebenen Schwelle von { "1e-9" }, den Anteil der Stationsachsen am Nullraum (innerhalb von { "8.4e-10" }) und die Stations-CRLB (innerhalb von { "1.2e-10" }) neu, an { "17" } festgeschriebenen, von Kshana erzeugten Konfigurationen (P2). Nicht hochgestuft: Für die Aussage, dass der Schätzer die Schranke erreicht (Monte-Carlo-Effizienz etwa { "0.98" }), gibt es keine unabhängige Referenz, und die Eingrenzung, die sie auf MODELLED belassen würde, wartet auf eine Entscheidung des Verantwortlichen

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
seg-39b0d6a58d29 = gps-sdr-sim (MIT, Commit 28ca29a6, als eigenständiges Programm über ein festgeschriebenes Harness ausgeführt), vorab registriert f88f2969 mit einem bitgenauen Zielwert auf (A) C/A-Chips, (B) jedes berechnete LNAV-Feld, (C) jedes Paritätsbit. BEFUND: (A) { "0" } von { "32 736" } Chips unterscheiden sich, (C) die Parität von { "0" } von { "1 920" } Wörtern unterscheidet sich, (B) { "230" } von { "1 152" } berechneten Feldern unterscheiden sich um eine Einheit: Das eph2sbf von gps-sdr-sim schneidet mit C-Casts zur Null hin ab, wo die gesendete Ganzzahl Rundung erfordert (jeder abweichende Wert liegt innerhalb von { "0.01" } einer Einheit der gerundeten Ganzzahl von Kshana). Bleibt MODELLED: Der registrierte Zielwert war die Konjunktion

# text
seg-325900ed59ea = Signalgeometrie der GNSS-IQ-Szene gegen einen unabhängigen Basisbandgenerator

# text
seg-ee5625b30ff2 = Die Wahrheitswerte je Satellit des IQ-Szenengenerators für eine GPS-L1-C/A-Szene mit Broadcast-Ephemeride (iq::scene: eine SatGeometry mit Broadcast-Ephemeride, erzeugt in TruthRecord-Wahrheitsdatensätze): welche Satelliten über dem Horizont stehen, die Pseudostrecke, die Codephase am ersten Abtastwert, der Träger-Doppler und die Blickwinkel, für einen ortsfesten Empfänger, verglichen mit dem Kanalzustand, aus dem gps-sdr-sim den ersten Block seiner eigenen I/Q-Ausgabe aufbaut, für dieselbe Ephemeride, denselben Empfänger und dieselbe Startzeit (Ionosphäre auf beiden Seiten aus)

# text
seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, Commit 28ca29a6), ein unabhängiger GPS-L1-C/A-Basisbandgenerator, mit eigenem Makefile gebaut und als eigenständiges Programm auf seiner mitgelieferten brdc0010.22n am Beispielort seines Verwendungstexts ausgeführt (scripts/gen_iq_gpssdrsim_ref.sh); ein festgeschriebenes Harness, das gegen denselben Build gelinkt ist, gibt den Kanalzustand (computeRange, computeCodePhase) hinter dem ersten Block des Programms aus. Zielwerte vor dem Lauf des Generators festgelegt (vorab registriert 7777da53). Geltungsbereich: GPS-L1-C/A-Geometrie für einen ortsfesten Empfänger ohne Ionosphäre, Troposphäre oder Empfängeruhr; die Kanalmodelle, das Rauschen und der Navigationsdateninhalt der Szene sind nicht Teil dieser Zeile

# text
seg-bf429c8f00fb = GNSS-IQ-Erfassung an unabhängig erzeugten I/Q-Abtastwerten

# text
seg-9a0c52bfb06e = iq::acq::acquire (parallele FFT-Codephasensuche mit der Quadratgesetz-Marcum-Q-Schwelle) mit der GpsL1Ca-Replik, auf { "20" } ms der eigenen 8-Bit-I/Q-Ausgabe von gps-sdr-sim, dekodiert vom Abtastwert-Dekodierer iq::io (ci8, { "2.6" } MHz, { "11" } Satelliten, ohne Rauschen): jede PRN { "1" } bis { "32" } in zwei Fenstern von { "10" } ms durchsucht, das Ergebnis verglichen mit der Codephase und dem Doppler, die gps-sdr-sim aufmoduliert hat

# text
seg-fb96290003e1 = I/Q-Abtastwerte von gps-sdr-sim (MIT, Commit 28ca29a6) und dessen eigener Kanalzustand, vorab registriert 7777da53: (B1) jede simulierte PRN erfasst, (B2) keine andere PRN erfasst, (B3) Codephase innerhalb von { "0.5" } Chip, (B4) Doppler innerhalb von { "125" } Hz. BEFUND: B1, B3 und B4 gelten in beiden Fenstern (schlechtester Wert { "0.195" } Chip, { "72" } Hz), aber B2 schlägt fehl: Alle { "21" } PRNs, die gps-sdr-sim nicht simuliert hat, überschreiten ebenfalls die Schwelle (Statistik { "151" } bis { "206" } gegen { "79.5" }; simulierte PRNs { "1 300" } und mehr). Die Schwelle ist für Gauß-Rauschen der gemessenen Abtastleistung festgelegt; gps-sdr-sim fügt kein Rauschen hinzu, daher enthalten die Zellen einer nicht vorhandenen PRN die Kreuzkorrelation der anderen Satelliten. Bleibt MODELLED: Der registrierte Zielwert war die Konjunktion

# text
seg-f40dc3dac990 = In Laborwiedergabe-Kampagnen bewertete IQ-Monitore: Erkennung, Fehlerkennungen, Fehlalarme und geschlossene Fehlalarmkennzahlen

# text
seg-93fb3109728c = iq::campaign::detect und der Kampagnenläufer: Eine optionale Tabelle [monitors] lässt die IQ-Monitore in jeder Zelle im einzigen Durchlauf des Läufers laufen. Die Leistungs- und Spektralmonitore sehen die Abtastwerte nach jeder Front-End-Kette; die C/N0-, SQM- und Lock-Monitore sehen die Schleifenaktualisierungen jedes verfolgten Kanals. Jeder Alarm wird gegen die angegebenen Ereignisse bewertet: erkannt oder verpasst je (Ereignis, Alarmart, Kanal), Zeit bis zur Erkennung und Fehlalarme außerhalb der Ereignisse bezogen auf deren Expositionszeit. Die geschlossene Fehlalarmkennzahl jedes Tests wird angegeben: Leistung je Block (exakter Gamma-Schwanz), spektraler Überschuss je Block (Näherung), Kurtosis (einseitig Gauß), Pulse (binomiale Obergrenze), SQM je gemittelter Aktualisierung (2Q(k) = Q(1/2, k^2/2), neu) und die ARL0 des C/N0-CUSUM (Siegmund). Ohne die Tabelle bleiben Zellen, Schlüssel und Digests unverändert. Es wird keine Störungswellenform synthetisiert

# text
seg-4c4fff313585 = Die eigenen geschlossenen Formen der Monitore an Kshanas eigenen GPS-L1-C/A-Szenen (Rauschen und legitime Signale; Dämpfungsereignisse der eigenen Signale der Satelliten), gegen vorab in docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4) registrierte Zielwerte. BEFUND: M1, M2 und M4 erreicht. M3 bei der Erkennung erreicht ({ "18" } von { "18" } Dämpfungen, P_md { "0" }) und NOT MET bei seiner Zeitklausel: Die mediane Zeit bis zur Erkennung beträgt { "1.001" } s gegenüber { "2" } x ARL1-Abtastwerten = { "0.433" } s. Der CUSUM sieht eine Schätzung je { "1" }-s-Fenster, daher liegt die Schranke in Abtastwerten unter einem Abtastwert. Nur interne Konsistenz: Weder ein realer Empfänger noch aufgezeichnete Störungen werden geprüft

# text
seg-5b7eb7ddb474 = Erkennungs-ROC der IQ-Monitore aus einer bewerteten Laborwiedergabe-Kampagne

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) und iq::campaign::report::rocs: Jede Zelle einer Kampagne mit Monitoren hält je Alarmart und Kanal das Maximum der eigenen Teststatistik des Monitors über jedes angegebene Ereignisfenster (positiv) und über aneinandergereihte roc_window_s-Fenster außerhalb der Ereignisse (negativ). Die Statistiken sind die Abweichung der Blockleistung, der PSD-Überschuss, die Kurtosis z, das SQM |z| der gemittelten Metrik und der C/N0-CUSUM. Der Bericht fasst sie nach Art zu einer empirischen ROC auf Fensterebene mit ihrer AUC und dem Arbeitspunkt an der konfigurierten Schwelle zusammen, geschrieben als roc.json (kshana.campaign-roc/1) und als Abschnitt Detection ROC von report.html. Eine Kampagne ohne Monitore schreibt keines von beiden

# text
seg-e882dd678998 = Synthetische Kampagnen aus Kshanas eigenen GPS-L1-C/A-Szenen (Dämpfungen der eigenen Signale der Satelliten), gegen vorab in docs/design/DETECTION-ROC.md (b47e358d) registrierte Zielwerte. BEFUND: R2 erreicht (Zufallsniveau, wenn nichts zu erkennen ist). R1 NOT MET: cn0_drop-AUC { "0.7855" } gegen { "0.95" }, weil jedes negative Fenster nach einem Ereignis den Abfall des CUSUM von der Erkennung erbt (alle { "18" } negativen Fenster nach dem Ereignis erreichen { "81" } oder mehr; alle { "18" } vor dem Ereignis bleiben bei { "0" }). Nur interne Konsistenz: Weder ein realer Empfänger noch aufgezeichnete Störungen werden geprüft

# text
seg-3a3cfa322f01 = Kalibrierung der C/N0- und Lock-Modelle des offenen Empfängers auf IQ-Kampagnenergebnisse, mit angegebenem Vorhersagefehler

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) und <c1/> auf <c2/>, Python <c3/> und das MCP-Werkzeug labfit (Kampagnenordner nur innerhalb seines Arbeitsverzeichnisses): liest einen Ausgabeordner von <c4/> anhand seines DIGEST und gruppiert die bewerteten Zellen zu Anpassungseinheiten (Signal x Schleifenentwurf x Front-End-Kette x Störsendertyp, nie zusammengefasst). Je Einheit passt es das gemessene C/N0 an das angegebene J/S mit der Form der spektralen Trennung an. Q_eff ist aus C/N0-Daten ohne unabhängige Messung der Störer- und Signalleistungen nicht identifizierbar, daher wird Q angegeben, nie angepasst (die Typtabelle, das q des Ereignisses oder bei unbekanntem Typ der schädlichste angegebene Wert, cw Q = { "1" }). Der angepasste Parameter ist der identifizierbare Offset delta_eff = delta - { "10" } log10 Q, wobei die Korrelationsschranke die Entartung meldet. C/N0-Klassen mit weniger als { "90" } % Lock sind zensiert und aufgelistet. Das Schwellen-J/S wird direkt und über die geschlossene Form angegeben; das Verfolgungsschleifenmodell und das empirische Lock-Modell sind über das C/N0-Modell gekoppelt, mit Abfall- und Wiederverriegelungs-Verweilzeiten. Ein mit Seed versehener Cluster-Bootstrap über Aufzeichnungen ({ "1000" } Replikate) liefert Perzentilintervalle; { "90" }-%-Vorhersageintervalle stammen aus Residuenziehungen; Leave-one-recording-out-Zurückhaltungen werden in Interpolation und Extrapolation aufgeteilt; eine vorab registrierte Tabelle [validation] wird gehasht und jeder Zielwert mit PASS/FAIL beurteilt. Bericht kshana.labfit-iq/1 als JSON, CSV und erzeugtes Markdown, mit einem Einheitenblock. Nur synthetisch (keine Aufzeichnung Dritter, keine Störsenderwellenform). Der Labfit-Pfad des Empfängerprotokolls bleibt unverändert

# text
seg-f9abecb1eea6 = Synthetische Parameterrückgewinnung an Kshanas eigenen GPS-L1-C/A-Szenen mit einem bekannten, aus der Formel von Abschnitt { "3.1" } aufgeprägten C/N0-Profil, verfolgt und bewertet mit kshana iq campaign, gegen vorab in docs/design/LABFIT-FROM-IQ.md (Abschnitt { "5.1" }, geändert am 2026-10-12 in b7117bf, Abschnitt { "13" }) registrierte Zielwerte. Der C/N0-Schätzer der Kampagnen (M2M4) wurde in 5b13e3c2 festgelegt, vor der ersten Auswertung eines Zielwerts gepusht (zusammen mit dem Anpassungscode eingecheckt, nicht allein), nach einem offengelegten diagnostischen Verfolgungslauf. BEFUND an der Kampagne mit 18 Ereignissen: (c) PASS; (a') NOT MET, delta_eff-Fehler -1.097 dB gegen { "0.5" } dB (weiterhin -0.89 dB in den Klassen ab { "38" } dB-Hz); (b') NOT MET, { "0" } von { "50" } Kampagnen decken die Wahrheit ab (Fehler -1.189 +/- { "0.093" } dB, Intervall etwa { "0.3" } dB); (d) NOT MET, geschlossene Form { "2.20" } dB unter dem direkten J/S beim Verlust, etwa die angepasste Abfall-Verweilzeit mal die Rampenrate ({ "2.09" } dB); die ursprünglichen Q-Klauseln von (a) und (b) sind NOT MET, weil Q nicht identifizierbar ist. NACHFOLGE (Zielwerte vorab registriert in 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): An einer Kampagne mit gestuftem J/S wird delta_eff innerhalb von +{ "0.185" } dB zurückgewonnen (S1 MET: Der Rampenfehler ist Schätzerverzögerung); (d) wie geschrieben wird darauf vom Verfolgungsschleifenmodell erfüllt ({ "0.45" } dB), nicht aber vom empirischen ({ "6.42" } dB), daher ist S2 NOT MET; an einer neuen Rampenkampagne liegt (d) mit der angepassten Abfall-Verweilzeit plus der Rampenrate jedes Ereignisses für beide Modelle innerhalb von { "1" } dB (R1 MET), und (a') und (d) wie geschrieben werden erneut verfehlt (-1.25 dB; { "2.32" } und { "9.47" } dB). Geprüft wird die Methode, kein Empfänger: Sie kann aus synthetischen Daten nicht VALIDATED werden

# text
seg-9537d301c95e = GPS-LNAV-Kodierung, dekodiert von einer unabhängigen Empfängerbibliothek

# text
seg-909415621881 = Kshanas LNAV-Unterrahmen 1-3 (gps_lnav::encode_subframes) für die { "32" } Ephemeriden aus brdc0010.22n, an decode_word und decode_frame von RTKLIB übergeben: Parität jedes Wortes, Unterrahmendekodierung mit konsistentem Datenstand (Issue of Data) und jeder dekodierte Parameter gegen Kshanas Ganzzahl und gegen den Eingabewert

# text
seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, Commit 71db0ffa) decode_word/decode_frame als eigenständiges Programm, vorab registriert ca5f0142: R1 Parität und Dekodierung, R2 dekodierter Wert gleich Kshanas Ganzzahl mal dem IS-GPS-200-Skalierungsfaktor innerhalb von { "2" }^-52 relativ, R3 innerhalb eines halben Quants der Eingabe. BEFUND: R1 { "960" } von { "960" } Wörtern und { "96" } von { "96" } Unterrahmen; R3 jeder Parameter, jede Woche und jede Referenzzeit exakt; R2 schlägt bei { "41" } Werten (af1, delta-n, IDOT) um { "1" } bis { "4" } Einheiten der letzten Stelle fehl, weil P2_43 in RTKLIB die Dezimalzahl { "1.136868377216160E-13" } ist, { "2.6e-16" } relativ zu { "2" }^-43; die Division durch die Konstante von RTKLIB liefert in jedem Fall Kshanas Ganzzahl zurück. Bleibt MODELLED: Der registrierte R2-Zielwert war für die eigene Konstante der unabhängigen Referenz zu eng

# text
seg-f66855e35c53 = GPS-LNAV-Navigationsnachrichtenkodierung

# text
seg-8caf8366e2f8 = IS-GPS-200-LNAV-Unterrahmen 1-3 (gps_lnav::encode_subframes: Quantisierung jedes Uhren- und Bahnparameters auf den nächsten Wert bei den Skalierungsfaktoren und dem Pi-Wert der Spezifikation, Zweierkomplement-Packung, TLM- und HOW-Wörter, Parität nach Tabelle 20-XIV mit D29*/D30*-Inversion, die paritätslösenden Bits der Wörter { "2" } und { "10" }), die Nachricht, die ein GPS-L1-C/A-Signalgenerator sendet

# text
seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, Commit 71db0ffa) readrnx beim Parsen der täglichen IGS-Broadcast-Datei BRDC00IGS_R_20250610000_01D_MN.rnx und decode_word/decode_frame beim Dekodieren von Kshanas Wörtern, als eigenständiges Programm ausgeführt; vorab registriert d4d9eb9d, bevor die Datei abgerufen wurde, Zielwert exakte Ganzzahl. Mutation: Abschneiden statt Runden ergibt { "235" } Fehlschläge. Frühere Vergleiche desselben Kodierers sind als Befunde festgehalten: gegen gps-sdr-sim, das abschneidet ({ "230" } Felder), und gegen die skalierten Werte von RTKLIB, deren dezimale Konstante { "2" }^-43 einen Ein-ulp-Zielwert verfehlte ({ "41" } Werte). Nachprüfung durch den Integrator (bleibt MODELLED): Der Vergleich stimmt überein, und eine Mutation der Paritätsmenge färbt ihn ebenfalls rot, aber die Vorabregistrierung d4d9eb9d erreichte den öffentlichen Branch um { "20" }:{ "02" }:{ "29" } UTC, zwei Sekunden nach dem Ergebnis-Commit 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), der bereits die Ausgabe von RTKLIB für die Datei enthält, daher lässt sich die Reihenfolge 'registriert, bevor die Datei abgerufen wurde' nicht zeigen; eine neue Registrierung, die gepusht wird, bevor eine ungesehene Broadcast-Datei abgerufen wird, würde dies klären

# text
seg-c5c944357643 = Erfassung und C/N0-Schätzung an realem Mond-IQ

# text
seg-f5dcb5e06bf4 = Parallele Codephasensuche (acquisition::pcps_acquire: portable FFT, kohärente Faltung, nichtkohärente Akkumulation, Chi-Quadrat-Schwelle für eine suchweite Fehlalarmwahrscheinlichkeit), Verfeinerung, Open-Loop-Prompt-Korrelation mit Code-Doppler und der M2M4-C/N0-Schätzer, ausgeführt auf den 4-Bit-IQ-Batches von LuGRE L1, gelesen über realdata::ion_sdr

# text
seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, eigenständiges Programm, festgelegte Konfiguration) auf den neun L1-Batches ohne Oberflächenaufnahme und dem RAW-C/N0 des Flugempfängers (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), vorab registriert 768cb62b. BEFUND: Kshanas Leser dekodiert alle { "288" } verglichenen Abschnitte identisch zu einem unabhängigen Konverter; GNSS-SDR erklärt { "266" } von { "288" } Suchen für positiv, und Kshana stimmt in allen { "266" } Entscheidungen überein, aber nur { "250" } liegen auf der Zelle von GNSS-SDR (A2 schlägt fehl); der C/N0-Zweig ist gegenstandslos, da keine RAW-Epoche des Flugs innerhalb von { "30" } s eines Batches liegt (nächste { "141" } s). Die meisten Positiven sind Artefakte: Die reinen Zweierkomplement-Pegel tragen einen Mittelwert von -0.5 auf I und Q, eine Linie bei Frequenz null { "32" } dB über dem Rauschen in einer { "1" }-kHz-Klasse, die beide Empfänger erfassen. Zwei Batches (OP5, OP12) wurden irrtümlich ausgeschlossen: Eine Lesart ihrer Metadaten ohne Ziffern wurde für einen Widerspruch zu ihren Headern gehalten; die wahre Ursache war, dass der Leser einen Abtastwert, der breiter als ein Wort ist, nicht lesen konnte (inzwischen behoben). Bleibt MODELLED

# text
seg-709626569a5c = Erfassung an realem Mond-IQ gegen den aus der Bahn vorhergesagten Doppler (Entscheidung über die Abtastleistung)

# text
seg-784ebd80c425 = acquisition::pcps_acquire mit seiner Entscheidung über die Abtastleistung auf den neun L1-Batches von LuGRE ohne Oberflächenaufnahme mit Mid-Rise-Pegeln; Doppler-Differenzen zwischen erfassten Satelliten verglichen mit Differenzen, die aus ESA-Endbahnen und der von Firefly rekonstruierten Trajektorie von Blue Ghost vorhergesagt wurden

# text
seg-38b8127db267 = Vorhergesagter Doppler aus ESA/ESOC-Endbahnen und der rekonstruierten NAIF-CLPS-Trajektorie (xval/lugre-predicted-doppler/predict.py, unabhängig von Kshana), vorab registriert 0d1839d2. BEFUND: Alle { "288" } Suchen überschreiten die Schwelle durch Rauschen (Statistiken der Abtastleistung etwa { "430" } bis { "520" } gegen { "346.3" }), daher gilt P1 trivial, und P3 gilt ({ "274" } von { "288" } als sichtbar vorhergesagt), während P2 bei { "4033" } von { "4036" } Paaren fehlschlägt. Das bandbegrenzte Front-End hebt das Rauschen jeder Zelle etwa um das { "1.46" }-fache an (festgehalten: Rauschboden { "292" } gegen das weiße Rauschen { "200" } bei OP2 PRN { "1" }), was die Statistik der Abtastleistung nicht sieht. Bleibt MODELLED

# text
seg-89875d67b253 = Erfassung an realem Mond-IQ, bewertet am aus der Bahn vorhergesagten Doppler

# text
seg-956bcfeaf319 = acquisition::pcps_acquire mit der Cell-Averaging-Entscheidung (Spitze über der mittleren Zelle des Gitters, robust gegen bandbegrenztes Rauschen) auf den neun L1-Batches von LuGRE ohne Oberflächenaufnahme mit Mid-Rise-Pegeln; Doppler-Differenzen zwischen erfassten Satelliten verglichen mit Differenzen, die aus ESA-Endbahnen und der von Firefly rekonstruierten Trajektorie von Blue Ghost vorhergesagt wurden

# text
seg-f80a751bc49b = Vorhergesagter Doppler aus ESA/ESOC-Endbahnen und der rekonstruierten NAIF-CLPS-Trajektorie (xval/lugre-predicted-doppler/predict.py, unabhängig von Kshana), vorab registriert a81a9a4e. BEFUND: P1 und P3 gelten ({ "4" } Batches, { "12" } von { "12" } Erfassungen als sichtbar vorhergesagt), aber P2 schlägt bei { "8" } von { "8" } Paaren fehl. Die zwei stärksten Paare entsprechen der Vorhersage im Betrag bei umgekehrtem Vorzeichen (OP2 PRN 18/24: +{ "7670.0" } Hz gemessen, -7693.9 vorhergesagt; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), daher ist die registrierte Reihenfolge mit I im niederen Nibble das Konjugierte der Batches; die sechs Detektionen knapp über der Schwelle passen zu keinem der Vorzeichen. Die Doppler-Streuung der Verfeinerung ({ "30" } bis { "50" } Hz zwischen zwei Läufen) wurde von der Registrierung ebenfalls unterschätzt. Bleibt MODELLED

# text
seg-8fa779dd1788 = Erfassung an zurückgehaltenem realem Mond-IQ gegen den aus der Bahn vorhergesagten Doppler

# text
seg-484868771231 = acquisition::pcps_acquire (Cell-Averaging-Entscheidung, Fehlalarmwahrscheinlichkeit { "1e-7" }) mit refine_doppler_coherent auf den LuGRE-L1-Batches, die auf der Mondoberfläche aufgezeichnet wurden (I im hohen Nibble, Mid-Rise-Pegel); Doppler-Differenzen zwischen erfassten Satelliten gegenüber Differenzen, die aus ESA-Endbahnen und dem Landeplatz-Kernel von Firefly vorhergesagt wurden

# text
seg-8bfd18bb6478 = Vorhergesagter Doppler aus ESA/ESOC-Endbahnen und dem NAIF-CLPS-Landeplatz-Kernel von Firefly (xval/lugre-predicted-doppler/predict_surface.py, unabhängig von Kshana), vorab registriert 2108e6ff an Batches, die zuvor nie geöffnet wurden. BEFUND: Die Nicht-Leerheitsbedingung schlägt fehl; kein Batch enthält zwei Erfassungen. OP40 ausgeschlossen (die Metadaten nennen eine fehlende Datei); OP38, OP73, OP77_0, OP77_1 erfassen nichts und zeigen bei { "1e-7" } keinen Fehlalarm (höchste Statistiken { "325" } bis { "356" } gegen { "385.9" }); OP74 und OP76 erfassen PRN { "31" } und OP78_0 und OP78_1 PRN { "12" }, jeweils allein, alle als sichtbar vorhergesagt. Bleibt MODELLED. Offengelegte Abweichungen: Der registrierte Doppler-Zielwert von { "10" } Hz beruht auf einer synthetischen Monte-Carlo-Rechnung der kohärenten Verfeinerung, nicht auf der Streuung der bereits gesehenen Batches, wie der Integrator es verlangt hatte; OP40 wurde vor dem Lauf ausgeschlossen, weil seine Metadaten eine Abtastdatei nennen, die der Datensatz nicht mitliefert

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
seg-29adc2d68a7b = Orekit { "12.2" } (Apache-2.0) NumericalPropagator, Zweikörper, LOFType.QSW, als eigenständiges Programm ausgeführt (Fixture seit Runde { "1" } unverändert). Vorab registrierter Zielwert { "1e-3" } m an jedem Abtastwert jedes Falls; die Korrektur der Engine zweiter Ordnung wurde unverändert dagegen erneut ausgeführt (Nachtrag 8c8e768d, geschrieben bevor der Propagator existierte, mit Offenlegung, dass die Lücken erster Ordnung bekannt waren). propagate_second_order stimmt innerhalb von { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } und { "2.2e-8" } m überein; das Halbieren des Terms zweiter Ordnung schlägt bei { "1.85e-3" } bis { "3.14e-3" } m fehl. Das lineare Φ allein weicht über ein Drittel einer Bahn bei { "100" } m um { "1.2" } bis { "6.3" } mm von der nichtlinearen Wahrheit ab (der ausgelassene Term zweiter Ordnung; sein strenger Test bleibt ignoriert), daher wird es charakterisiert, nicht validiert. Beibehaltene interne Prüfungen: Φ gegen eine RK4-Integration der Hill-Gleichungen, Φ(t)Φ(−t)=I, die Identitäten der beschränkten Bahn und der Drift −12π·x₀ sowie die Skalierung des Residuums dritter Ordnung des Terms zweiter Ordnung. Geltungsbereich: kreisförmiger Chief, Abstände nahe { "100" } m, bis zu einem Drittel einer Bahn; keine Exzentrizität (Tschauner–Hempel), keine J2- oder differenziellen Widerstandsterme; Annahme kleiner Abstände

# text
seg-d31be81dfd8f = Passive TDOA/FDOA-Geolokalisierung von Emittern

# text
seg-aa870cee16f6 = Einen Emitter (Jammer/Spoofer oder eine Gelegenheitsquelle für Reverse-PNT) aus der Ankunftszeitdifferenz über ein Empfängernetz orten — der Schnitt der Hyperboloide τᵢ=(Rᵢ−R₀)/c wird durch die Gauß–Newton-Methode der kleinsten Quadrate gelöst — und, mit der Frequenzdifferenz der Ankunft (Entfernungsratendifferenzen) bei bewegten Empfängern, gemeinsam Position und Geschwindigkeit zurückgewinnen; mit der Cramér–Rao-Untergrenze der Positionskovarianz aus der Messgeometrie

# text
seg-17b45796fd43 = Selbstkonsistenz von Schätzer und Geometrie: Vorwärts→Rückwärts-Round-Trips, die Fisher/CRLB-Identität J·CRLB=I, GDOP-Monotonie und der Schätzer, der seine eigene Cramér–Rao-Schranke unter Monte-Carlo-Rauschen erreicht — Prüfungen der internen Konsistenz, KEIN externer Datensatz, daher bleibt die Zeile InternalConsistency. MODELLED passive Geolokalisierung — Punktquellenmodell mit Sichtlinie; keine Mehrweg-/NLOS-, Empfängeruhrenfehler- oder atmosphärischen Refraktionsterme. { "0.30" } Runde { "2" }, gegen Ho und Chan { "1993" } und Ho und Xu { "2004" } (vorab registriert f89018b8, { "1" } % jedes gedruckten Werts), ein Befund (bleibt MODELLED): Die oberflächenbeschränkte TDOA-Schranke reproduziert die geometrischen Faktoren bei { "40" } N (-0.11 %, -0.02 %) und die maximale TDOA; die gemeinsame TDOA+FDOA-Schranke reproduziert Abb. { "6" } (+{ "0.06" } %, -0.17 %) und, an der Quelle, die der eigene Code der Autoren für Abb. { "7" } nennt (Nachtrag nach Kenntnis dieses Ergebnisses geschrieben, offengelegt), Abb. { "7" } (+{ "0.11" } %, -0.02 %); sie entspricht dem veröffentlichten Schrankencode der Autoren (BSD-artig, unter GNU Octave ausgeführt) auf { "3e-12" }; der kovarianzgewichtete Maximum-Likelihood-Löser erreicht die gedruckte Schranke (+{ "0.3" } bis +{ "0.4" } %). Die Ottawa-Faktoren, die das Paper aus einer Monte-Carlo-Rechnung druckt ({ "251" }, { "7.1" }), weichen um +{ "1.3" } % und +{ "4.4" } % ab, außerhalb des Zielwerts von { "1" } %

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
seg-d79071a5d9ec = Unabhängige numpy-Reproduktion der Statistik + Eigenschaftstest, dass eine Gleichtakt-Injektion sie aufbläht (InternalConsistency). Modelliertes Szenario. { "0.30" } Runde { "2" } (vorab registriert f9aa360d), blockiert (bleibt MODELLED): numpy { "2.3.5" } LAPACK gesv reproduziert den Statistikwert auf { "261" } eingecheckten Fällen (innerhalb von { "3.5e-15" } bei guter Konditionierung, { "1.2e-9" } bei Kondition bis { "6.1e7" }); das chi-Quadrat({ "1" })-Nullgesetz ist ein zitierter Satz und die flachen paarweisen Trennungen eine Identität ohne Engine-Ausgabe zum Vergleich, sodass die Eingrenzung auf eine Entscheidung des Eigentümers wartet

# text
seg-91fc18cde833 = Grenze für nicht erkennbaren Gleichtakt außerhalb von Omega (Residuum)

# text
seg-0cc2c0f033c8 = Obergrenze für nicht erkennbaren Gleichtakt: die größte Fehlergröße entlang einer Richtung d, die SOWOHL der Trennung (alpha_ss = T_ss / gewichtete Kontrastnorm von d) ALS AUCH der Gleichtaktstatistik (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|) entgeht, angegeben als min(alpha_ss, alpha_cm). Bei positiv definitem Omega schließen sich die beiden blinden Richtungen (d proportional zu { "1" } und { "1" }^T Omega^-1 d = { "0" }) gegenseitig aus, sodass die Obergrenze für jedes von null verschiedene d ENDLICH ist; unendlich ist sie nur bei einer Nullrichtung oder einem nicht positiv definiten Omega. Eine Richtung außerhalb der modellierten gemeinsamen Achse ist nur für die Gleichtaktstatistik blind und wird durch die Trennung begrenzt

# text
seg-b67c71daa7de = P2: numpy { "2.3.5" } linalg.solve (LAPACK gesv, LU ohne Cholesky) berechnet alpha_ss (die Schwelle über der gewichteten Kontrastnorm von d nach Entfernen seines GLS-Gleichtaktkoeffizienten), alpha_cm und deren Minimum auf { "256" } eingecheckten (Omega, d, T_ss, T_cm)-Eingaben (tests/fixtures/gls_outside_omega_bound_numpy_oracle) neu, darunter reine Gleichtaktrichtungen, Richtungen außerhalb der modellierten gemeinsamen Achse sowie die Fälle der Nullrichtung und des nicht positiv definiten Omega, die +inf ergeben müssen; vorab registriert (d070699a; Änderung 8a44267b, vor jedem Vergleich, Neufassung der Matrixform); Toleranzen vor dem Vergleich festgelegt. Der Text der Fähigkeit wurde per Entscheidung des Eigentümers (2026-10-02) korrigiert: Er hatte behauptet, die Grenze sei für eine Richtung außerhalb der gemeinsamen Achse unendlich, was dem Code und diesem Vergleich widersprach. Dass der idealisierte Einzelkontrast-Detektor die nicht erkennbare Größe eines realen Teilmengen-Detektors nach unten begrenzt, bleibt modelliert

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
seg-536c75eebae3 = Gemessen: { "192" } ILRS-CRD-v2-Normalpunkte zum Mond (EUROLAS Data Center, DGFI-TUM, 2024-04 bis 2024-06; Grasse { "151" }, APOLLO { "32" }, Matera { "9" }; wörtlich mit SHA256SUMS eingecheckt). Die vorhergesagte einfache Entfernung wird mit c mal der halben gemessenen Umlaufzeit in TDB verglichen. Vor dem Vergleich festgelegter Zielwert: RMS höchstens { "10" } m über alle { "192" } Punkte UND über die { "160" } Punkte der beiden ITRF2020-Stationen allein. Der Zielwert stammt aus der dritten Vorregistrierungsänderung 3e0f5cdf, eingecheckt vor der Engine-Änderung und dem Lauf; der Wert von { "10" } m ist seit Runde { "1" } unverändert. Gemessen: { "2.81" } m (Mittelwert { "2.67" } m) über alle Punkte; { "2.96" } m auf den ITRF2020-Stationen; APOLLO { "1.94" } m; Ausschnitt { "2015" } ({ "349" } Punkte, sekundär) { "3.82" } m. Mutation: Das Nullsetzen der Shapiro-Anteile der Sonne ergibt { "10.19" } m, was nicht besteht. Verlauf, offengelegt: { "96" } m mit elementweiser Orientierungsinterpolation; { "22.7" } m nach geodätischer Interpolation mit dem geodätischen Katalog; { "10.94" } m mit ITRF2020-Stationen und Polbewegung, aber geozentrischer Lichtlaufzeit (ein gemeinsamer Versatz von +{ "10.9" } m). Das baryzentrische Modell wurde geschrieben, nachdem dieser Versatz gesehen wurde. Es ist das veröffentlichte Modell nach IERS { "2010" } Abschnitt { "11.2" } ohne freien Parameter. Die dritte Änderung ersetzte eine selbst auferlegte Bedingung, nur ITRF2020/SLRF2020 zu verwenden, nach dem Ergebnis BLOCKED. Der RMS allein für ITRF2020 besteht ohne APOLLO, das keine ITRF2020- oder SLRF2020-Lösung hat und dessen Position die vom Betreiber angegebene Näherung ist. Ein gemeinsamer Versatz von +{ "2.7" } m bleibt, liegt unter dem Zielwert und ist nicht abgestimmt. Der Zielwert ist gemessen am Ergebnis locker: Ein fehlender Sonnenterm von { "7.6" } m ergibt immer noch { "10.19" } m. Terme unter dem Zielwert werden nicht einzeln aufgelöst: Mit auf null gesetzter Polbewegung beträgt der RMS { "6.15" } m (ITRF2020-Stationen { "5.98" } m), und mit entfernter Transformation nach Gl. { "11.19" } beträgt er { "2.96" } m; beide würden weiterhin bestehen. Stationsgeschwindigkeiten und die Shapiro-Terme von Erde und Mond sind noch kleiner. Der Vergleich validiert die zusammengesetzte einfache Entfernung bei { "10" } m RMS und den Shapiro-Term der Sonne, nicht jede aufgeführte Komponente

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
seg-6fc3d01ea825 = Vorab registriert (5590ab21): L_m gegen Ashby und Patla { "2024" } (AJ { "167" }:{ "149" }) Gl. ({ "10" }), { "3.13881" }({ "15" })e-11, aus GM, a_m, omega_m der Veröffentlichung und dem J2 der beiden Felder vom Grad 350, die die Veröffentlichung zitiert (Bertone et al. { "2021" }, AIUB-GRL350A/B), innerhalb von { "1e-4" }; der radiale Eintrag gegen die Äquatorschwere derselben Felder aus pyshtools { "4.14.1" } (BSD-3) innerhalb von { "1e-4" } (gemessen { "8.3e-5" } und { "6.7e-5" }, ein knapper Abstand); der Geschwindigkeitseintrag gegen die Mondgeschwindigkeit aus JPL Horizons DE441 innerhalb von { "4.5e-3" }. Eine geschlossene Form vom Grad 2 eines veröffentlichten Werts vom Grad 350 (Restgrad 3-350; Referenz, nicht P1). Offengelegt: Das Ergebnis des Eintrags 1 war vor der Vorregistrierung bekannt, und der mitgelieferte Standardradius { "1738.14" } km ist die Oberflächendefinition der Veröffentlichung, übernommen nach Runde { "1" }. Die Gezeitenbeiträge und das Vergleichsband bleiben modellierte Zahlen der Bezugsfläche

# text
seg-a666792106d9 = Basisinvariante Klassifikation des gekoppelten Nullraums von Bezugssystem und Zeitskala

# text
seg-5ee36574d1b4 = classify_null_space zerlegt den Datum-Nullraum in einen rein räumlichen Teil (Dimension d minus Rang U_T), einen rein zeitlichen Teil (d minus Rang U_S) und einen echt gekoppelten Teil (Rang U_S plus Rang U_T minus d), dazu die Kopplungsnorm p_st_norm des Projektors vom Räumlichen zum Zeitlichen, die Frobenius-Norm des nichtdiagonalen Blocks des Nullraum-Projektors. Jede dieser Größen ist eine Funktion des PROJEKTORS und nicht einer gewählten Basis, sodass sie unter jeder orthonormalen Wahl der Nullvektoren invariant sind - was die Klassifikation überhaupt erst berichtbar macht.

# text
seg-0608e1dc5183 = SciPy/NumPy (BSD-3-Clause; scipy.linalg.null_space und numpy.linalg.svd, LAPACK gesdd) klassifizieren dieselben eingecheckten Matrizen durch Teilraumschnitt, dim null([F; E_T]) und dim null([F; E_S]), und den SVD-Nullraum-Projektor, was sich von den Jacobi-Eigenvektoren und Gram-Rang-Formeln von Kshana unterscheidet; vorab registriert (d429993c): ganze Zahlen exakt, p_st_norm auf { "1e-9" } (P2, eine unabhängige numerische Bibliothek), mit vorab festgelegter Rangschwelle und einer zugesicherten spektralen Lücke von mindestens { "1e6" }. Die Behauptung der Zeile ist die Klassifikation einer angegebenen Matrix, daher deckt P2 sie vollständig ab. Die konstruierten Fälle umfassen direkte Summen, gekoppelte und gemischte Nullräume sowie zufällige Basiswechsel; die Dimensionen der realen Netze aus der Zeile zur gekoppelten Eichung werden hier nicht neu gezählt. Der crate-interne Invarianztest (eine gedrehte Nullbasis liefert identische Ergebnisse) bleibt erhalten

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
seg-c69fd3fc645b = Drei unabhängige maßgebliche Ephemeriden — DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) — abgetastet über IMCCE calceph, kreuzgeprüft durch eine unabhängige numpy-SVD-Kleinste-Quadrate-Anpassung. WARUM DIES VALIDIERT IST, WO lunar_common_mode ES NICHT IST, auf denselben drei Ephemeriden: Hier IST die berichtete Größe eine Eigenschaft der veröffentlichten Daten — ihrer gegenseitigen Abweichung —, die Ephemeriden sind also die unabhängige Referenz, keine Eingabe. In lunar_common_mode speist dieselbe Abweichung eine MODELLED-Konstellationsgeometrie, und die Antwort ist eine Eigenschaft dieses Modells, weshalb diese Zeile zu Recht modelliert/ReferenceImpl ist.

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
seg-46b139a58bb0 = Übertragung der genannten Empfehlungen (frei von itu.int herunterladbar), jeder Grenzwert mit Tabelle oder Abschnitt, aufgelistet mit jedem unbestätigten oder nicht implementierten Punkt in docs/TELECOM-TIMING.md; die Identitäten der Stetigkeit an den Knickpunkten, die die Tabellen implizieren, werden in den Tests geprüft. Eine Übertragung von Normen mit internen Konsistenzprüfungen, kein Konformitätstest und keine externe Validierung. { "0.30" } Runde { "2" } (vorab registriert 970003ee), blockiert (bleibt MODELLED): Die zehn Maskenwerte und dreizehn ePRTC-A-Holdover-Werte, die die Empfehlungen als durchgerechnete Zahlen abdrucken (G.8272 Abb. 1-2, G.8272.1 Amd.1 Abschn. { "8.2.1" } und Abb. V.1-V.3, G.8271.1 Amd.3 Abb. 7-2 bis 7-4), werden innerhalb einer halben gedruckten Einheit reproduziert, die meisten davon Tabellenkonstanten oder Knickpunkte; G.8271.1 Abb. 7-2 beschriftet { "200" } ns bei { "1.3" } s, gegenüber der eigenen Tabelle 7-1 ({ "197.5" } ns). Die Grenzwerte der Klassen A-D von G.8273.2 haben keinen gedruckten durchgerechneten Wert, und die Beschriftungen der Knickpunkte für ePRTC gelockt aus G.8272.1 (auf durchgezogenen Konstruktionslinien) wurden durch die vorab registrierte Auswahlregel ausgeschlossen, sodass diese Übertragungen bleiben

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
seg-1d3df655c14c = Vorab registriert in tests/fixtures/clock_log/PREREGISTRATION.md (allein eingecheckt, 159334f2, bevor die Fixture existierte); festgehalten in RESULTS.md. Drei mit Seed erzeugte synthetische Protokolle, eines je Format (bei TICC eine Lücke von drei Epochen, bei RINEX eine zweite Uhr, die zu ignorieren ist), zurückgelesen von einem unabhängigen Leser, den derselbe Autor nach docs/CLOCK-LOG-FORMATS.md geschrieben hat: Raster-, Lücken- und Auffüllzahlen gleich, und die größte Phasendifferenz { "0" } s (Zielwert { "1e-13" } s). allantools { "2024.6" } oadev, tdev und mtie auf dieser Phase stimmen bei jedem Mittelungsfaktor, den es auswertet, auf relativ { "2.5e-14" } überein (Zielwert { "1e-10" }); es wertet die MTIE nicht über die gesamte Aufzeichnung aus, die die Engine berichtet, sodass dieser eine Punkt je Protokoll keinen Referenzwert hat und der Zielwert in der formulierten Fassung dort nicht erreicht ist. MODELLED: synthetische Protokolle, und das Leser-Orakel teilt sich den Autor; echte TimeLab-, TICC- und RINEX-Uhrdateien von Instrumenten wurden nicht verglichen

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
seg-695ec24f9676 = allantools { "2024.6" } ci.edf_greenhall, eine Drittanbieter-Implementierung des veröffentlichten Algorithmus, ausgeführt von scripts/gen_greenhall_edf_ref.py über das Raster, das in xval/greenhall-edf/PREREGISTRATION.md vorab registriert wurde (allein eingecheckt, 0db0bb7a, vor jedem Vergleich): An allen { "4 876" } Punkten, an denen es ein endliches edf liefert, stimmt kshana innerhalb von relativ { "6.0e-13" } überein (Zielwert { "1e-9" }); an seinen { "46" } Punkten mit NotImplementedError liefert kshana NaN; jedes Fallkennzeichen kommt vor; die Wrapper sind dem Kern bitgenau gleich; uncertainty::edf ist über { "274 280" } Werte bitidentisch (vor dem Refactoring als SHA-256 festgehalten). An { "32" } Punkten (alpha -4, d { "3" }, unmodifiziert, Fall { "2.2" }) scheitert allantools in seiner Nachschlagetabelle { "2" }, sodass sie keinen Referenzwert haben und nicht gezählt werden. Stable32 wurde nicht ausgeführt. { "0.36" } Revision (docs/revisions/STUDIO15-greenhall-edf-portable.md): Bei portabler Mathematik bezieht der Kern seinen Logarithmus aus einer einmal gerundeten Double-Double-Auswertung (allan::greenhall_ln), und der unveränderte Zielwert { "1" } hält wieder an allen { "4 876" } Punkten, schlechtester relativer Wert { "6.0e-13" }; die Schutzprüfung von uncertainty::edf ist auf den portablen Abzug { "0.36" } umgestellt ({ "3 746" } der { "274 280" } Werte haben sich verschoben, höchstens relativ { "1.6e-12" }, gegenüber der Basis mit Host-Mathematik)

# text
seg-363705e03bac = Holdover-Voreinstellungen für Oszillatoren aus öffentlichen Datenblättern

# text
seg-9750d9e0ec7a = Vier Voreinstellungen — OCXO (Microchip OX-208), Rubidium (Microchip 8040C), Cäsium (Microchip 5071A Hochleistungsröhre) und CSAC (Microchip SA.45s) — jede mit den Maxima der Allan-Abweichung, der Alterung und der Temperaturgrenze ihres Datenblatts; eine Anpassung des Frequenzrauschens aus weiß + Flicker + Random Walk nach nichtnegativen kleinsten Quadraten, skaliert so, dass sie jeden Datenblattpunkt umhüllt, ein Flicker-Boden nie unter dem Wert für das längste τ, lineare Alterung und ein sinusförmiger Temperaturterm, synthetisiert als Holdover mit Seed nach einem GNSS-Verlust

# text
seg-95aaa171864b = Die vier benannten Microchip-Datenblätter (Dokumentnummern und URLs in jeder Voreinstellung und in docs/TELECOM-TIMING.md) für die Eingangswerte; die geschlossene Alterungsrampe und die Hüllkurveneigenschaft der Anpassung als interne Prüfungen. Wie aus den Werten ein Rauschmodell wird — die Anpassung, die Bodenregel, der 30-Tage-Monat, die lineare Temperaturlesart — ist eine Modellierungsentscheidung; keine Voreinstellung ist eine Messung einer Einheit. { "0.30" } Runde { "2" }, einseitige Zielwerte gegen gemessene Einheiten (vorab registriert a01c491c), ein Befund (bleibt MODELLED): Die IGS-Station THU2 Symmetricom 8040C in den finalen ESA-MGEX-Uhren hat eine Allan-Abweichung von { "0.35" } bis { "0.87" } der Rubidium-Voreinstellung, aber einen Holdover-Fehler von { "1.07" } bis { "1.60" } davon; die Aufzeichnung der 5071A liegt bis { "1000" } s außerhalb der Cäsium-Voreinstellung (weißes Phasenrauschen der Messung, 30x bei { "1" } s) und im Holdover ({ "1.15" } bis { "8.74" }); die schlechteste SA.45s von { "2011" } aus der Produktion liegt bei { "1" } s beim 1.26-Fachen der CSAC-Voreinstellung; die OX-208 hat keine gemessene Aufzeichnung (blockiert)

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
seg-49b912adb7a9 = Die Anzahl der Zeitfenster des Plans je Testgebiet ({ "76" }, { "77" } und { "45" } Zeitfenster, von denen { "61" }, { "63" } und { "32" } senden) wurde unabhängig mit einem Skript über dasselbe JSON gezählt; die attack_log-Fenster des Datensatzes von { "2024" } dienen als Ereigniswahrheit, gemäß xval/jammertest-score/PREREGISTRATION.md (allein committet, c2e6d3b, bevor die Auswertung lief). Erster und einziger Lauf (xval/jammertest-score/RESULTS.md): Die registrierte Mindestdatenregel wurde mit FAILED verfehlt ({ "4" } auswertbare Jamming-Fenster aus { "4" } von { "12" } UBX-Ordnern gegenüber einem Minimum von { "10" } Fenstern aus { "2" } Ordnern: { "5" } Ordner wurden durch die Basislinienregel ausgeschlossen, { "3" } UBX-Protokolle enthalten nur die GPS-Wochenzeit), daher sind die Zielwerte B1 bis B4 nicht bewertbar; nichts wurde gelockert oder erneut ausgeführt. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, allein committet, nur Datenbehandlung: Protokolle mit reiner GPS-Zeit werden anhand des Datums eingeordnet, die { "12" } Ordner nur mit CSV, eine Sitzung mit bewegter Plattform für fahrende Rover; gleiche Zielwerte und gleiche Mindestdatenregel): { "14" } von { "24" } Ordnern behalten, aber nur { "7" } auswertbare Jamming-Fenster, die Mindestdatenregel erneut verfehlt, kein Zielwert bewertbar (RESULTS-v2.md). Geplante Wahrheit: Ein geplantes Zeitfenster ist keine Sendeaufzeichnung, ein verpasster Test kann ein Test sein, der nie lief, eine Latenz wird ab dem geplanten Beginn gemessen, und sauber bedeutet außerhalb der geplanten Zeitfenster. Die Erkennung durch Monitore im Messbereich sagt nichts über einen Spoofer mit geringer Leistung aus. Ein Empfängertyp (u-blox ZED-F9P). Der NMEA-Datensatz von SimulaMet aus { "2025" } wird nicht verwendet (keine angegebene Lizenz, abonnementpflichtig)

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
seg-416ce4dfc6f5 = Interne Konsistenz gegenüber eingespeister Wahrheit und geschlossenen Formeln, unter Zielwerten, die bei 6b68f6cc vorab registriert wurden (docs/design/evidence/boc-bump-jump/). Ein BeiDou-B1C-Datensignal (PRN { "19" }, { "5" } MS/s), erzeugt von iq::scene: Bei ausgeschalteter Option bleibt ein Start auf einem Nebenmaximum falsch eingerastet bei den vorhergesagten ±({ "0.5" } + d/4) Chip (gemessen ±{ "0.549" }); bei eingeschalteter Option ein Sprung zum Hauptmaximum bei { "0.08" } s und ein RMS im späten Fenster von { "0.0008" } Chip bei { "45" } dB-Hz und { "0.0048" } Chip bei { "35" } dB-Hz; kein Sprung vom Hauptmaximum bei { "35" }, { "40" } und { "45" } dB-Hz über { "4" } s; die skalierte EMLP-Steigung { "0.94" } bis { "0.99" } am abgetasteten Signal (unskaliert { "3.6" } bis { "3.8" }). Der Bump-Jump-Detektor allein, auf Korrelator-Tripeln mit der exakten BOC({ "1,1" })-Rauschkovarianz, machte in { "100 000" } Aktualisierungen bei { "25" } bis { "45" } dB-Hz keinen falschen Sprung und erkannte { "1000" } von { "1000" } Starts auf einem Nebenmaximum bei { "35" } dB-Hz. NOT MET (Befund F1): Das vorab registrierte Unit-Test-Raster für die Skalierung enthält Versätze außerhalb des linearen Bereichs der Diskriminatoren, wo die skalierten Messwerte den Versatz um bis zu { "48" } % verfehlen. WAS NICHT GEPRÜFT WIRD: IQ-Felddaten, bandbegrenzte Frontends, zusammengesetzte MBOC-/QMBOC-Replikate und jeder externe Empfänger.

# text
seg-2c32955cbfb3 = IQ-Kanal für ionosphärische Szintillation (Cornell-Modell) gegen gemessene GPS-L1-Szintillation mit { "50" } Hz

# text
seg-2fdcb373ab25 = iq::channel::scint, das Cornell-Szintillationsmodell (Rice-Intensität, Butterworth-Spektrum zweiter Ordnung, Phase arg z), betrieben mit dem S4 und der Intensitäts-Dekorrelationszeit eines gemessenen Fensters und verglichen anhand dessen, was es über diese beiden Eingaben hinaus erzeugt; realdata::scint50 liest das Messprotokoll, entfernt den Trend und führt den Vergleich aus.

# text
seg-bdc9fe963c5c = Messdaten unter Zielwerten, die bei b6ccb499 vorab registriert wurden (xval/scint-malindi/): Zenodo-Eintrag { "16941224" } (INGV, Malindi, { "18" }. März { "2023" }, GPS PRN { "26" }, Intensität und Trägerphase mit { "50" } Hz, CC BY { "4.0" }, SHA-256 geprüft). { "22" } qualifizierte Fenster von { "60" } s (N1 erfüllt). MET: die Intensitätsverteilung (Kolmogorov-Smirnov D { "0.0415" }, Zielwert { "0.05" }) und die an S4 gebundene Phasenszintillation (Median gemessen/Modell sigma-phi { "0.779" }, Zielwert 2/3 bis 3/2). NOT MET (Befund F1): Der Anteil tiefer Fades des Modells beträgt das { "2.38" }-Fache des gemessenen (Zielwert { "0.5" } bis { "2" }) und sein mittlerer Fade ist { "3.51" }-mal so lang (Zielwert 2/3 bis 3/2). Befund F2: Die registrierte Verarbeitung liest die umbrochene Phase des Modells, was eine Selbstprüfung aufdeckte; B3, nachträglich mit entfalteter Phase wiederholt, ergibt { "0.804" }. WAS NICHT GEPRÜFT WIRD: andere Nächte, Stationen, Breitengrade oder Signale; Empfängerrauschen im Modell. Die Zeile bleibt MODELLED.

# text
seg-160507ac3702 = Cell-averaging-CFAR-Option in der IQ-Akquisition

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar und ca_cfar_cells (optional): Eine Zelle eines Akquisitionsrasters wird mit dem Mittelwert von Referenzzellen ihrer Doppler-Zeile verglichen (Schutz- und Schrittlags, die um die Periode herum umbrechen), mit einem Faktor alpha, der aus der geschlossenen Formel der CA-CFAR-Fehlalarmwahrscheinlichkeit für M nichtkohärente Blöcke festgelegt wird (ca_cfar_pfa, ca_cfar_alpha). Der Detektor auf Basis der Stichprobenleistung bleibt der Standard, und jede bestehende Ausgabe bleibt unverändert.

# text
seg-ba35daac2aed = Geschlossene Formel, unter Zielwerten, die bei 3724aefa vorab registriert wurden (docs/design/evidence/acq-cfar/). Die CA-CFAR-Fehlalarmwahrscheinlichkeit für Gamma(M)-Zellen gegenüber einer Monte-Carlo-Simulation des exakten Modells: { "18" } von { "18" } Fällen innerhalb von { "3" } Binomial-Sigma. Auf jeder Zelle von iq::acq-Suchen (GPS L1 C/A, { "2.5" } MS/s, je { "210 000" } Zellen) bei einem Entwurfswert von { "1" } %: { "0.977" } % und { "0.969" } % bei Gauß-Rauschen sowie { "1.006" } % und { "0.999" } % bei 2-Bit-quantisiertem Rauschen (M = { "1" } und { "4" }; Zielwert plus/minus { "20" } %); Entscheidungen unverändert, wenn die Eingabe skaliert wird. NOT MET (Befund F1): Bei einem rauschfreien 2-Bit-Signal sind die Detektion und ihre Zelle richtig, aber { "1.28" } % der Zellen außerhalb des Maximums in der Zeile des Maximums (Zielwert { "1" } %) überschreiten die Schwelle, an den deterministischen Korrelationsnebenmaxima des Codes. WAS NICHT GEPRÜFT WIRD: andere CFAR-Varianten, zweidimensionale Fenster, bandbegrenzte Frontends, Felddaten.

# text
seg-5bd3bf0c22a7 = Spektrummodell: GLONASS-, BeiDou- und Galileo-E6-Bänder (optional)

# text
seg-9c16189c63ac = spectrum::default_band löst allein über den Namen (MORE_BAND_NAMES) auf: GLONASS L1OF und L2OF auf jedem FDMA-Kanal K = -7 bis { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a und B3I (BPSK({ "10" })) sowie Galileo E6 (BPSK({ "5" })), mit den Trägern und minimalen Empfangsleistungen aus ihren Schnittstellenkontrolldokumenten; die Standard-Bandmenge und jede bestehende Ausgabe bleiben unverändert.

# text
seg-6d674bc4b40a = Veröffentlichte Schnittstellenkontrolldokumente und geschlossene Formeln, unter Zielwerten, die bei 5806f28b vorab registriert wurden (docs/design/evidence/spectrum-bands/): GLONASS-ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } und B3I { "1.0" }, Galileo-OS-SIS-ICD Issue { "2.1" }. MET: jeder Träger, jede Chiprate und jede Empfangsleistung wie transkribiert ({ "28" } GLONASS-Kanäle), die ersten BPSK-Nullstellen bei der Chiprate, das B1C-Komposit gleich MBOC(6,1,1/11), wie die Leistungstabelle seines ICD es angibt, die Identität des C/N0-Pfads und byteidentische Spektrum-Szenarien. NOT MET: der Zielwert für die Einheitsfläche, der in der vorliegenden Fassung nicht erreichbar war (Befund F1; die Flächen entsprechen dem geschlossenen Anteil im Band), und die Übereinstimmung je Bin der B1I- und B1C-Wellenformen der IQ-Schicht mit der Modellhüllkurve ({ "1.26" } und { "1.56" } dB gegenüber { "0.5" } dB, Befund F2; GLONASS { "0.07" } dB), weil Gold- und Weil-Codes ungleichmäßige Linienspektren haben; bandgemittelt stimmen die Hauptkeulen innerhalb von { "0.25" } dB überein. WAS NICHT GEPRÜFT WIRD: aufgezeichnete IQ-Daten, andere Signale, Störungen innerhalb eines Systems.

# text
seg-63b7da996265 = Primäre BeiDou-B1I-Entfernungsmesscodes gegen einen unabhängigen Generator

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits und b1i: die Gold-Codes nach BDS-SIS-ICD-B1I-3.0, auf { "2046" } Chips gekürzt, PRN { "1" } bis { "63" }, wie die IQ-Schicht sie erzeugt, akquiriert und verfolgt.

# text
seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (Tag { "v0.0.19" }, Commit 1ddd4562), eine unabhängige Open-Source-Implementierung desselben ICD: Ihr beidou_b1i_code_gen_int, eigenständig kompiliert, erzeugte alle { "63" } Codes. Nur ihre Programmausgabe ist committet: tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, ein Präfix von 64 Chips und der SHA-256 jedes Codes mit 2046 Chips. Diese Ausgabe sind die BeiDou-B1I-PRN-Codes, die das öffentliche BDS-SIS-ICD-B1I-3.0 definiert; im Repository befindet sich weder Quellcode noch Binärdatei von GNSS-SDR. Zielwert, vorab registriert bei 911106d1 (xval/beidou-b1i-gnss-sdr/): alle { "2046" } Chips aller { "63" } PRNs identisch, keine Invertierung, Verschiebung oder Umbenennung. Ergebnis: { "63" } von { "63" } identisch; die Fixture wurde aus einem frischen Checkout von { "v0.0.19" } neu erzeugt (SHA-256 der Quelldatei wie vermerkt) und ist byteidentisch. WAS NICHT GEPRÜFT WIRD: der sekundäre NH20-Code, die GEO-PRN-Liste, der Träger und die Chiprate.

# text
seg-b4787b04338e = GPS-L1C-Entfernungsmess- und Überlagerungscodes gegen die gedruckten Prüfspalten von IS-GPS-800J

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits und l1c_o_bits: die Weil-Entfernungsmesscodes L1CP und L1CD (berechnete Legendre-Folge, Weil-Index, vor Chip p eingefügte Erweiterungsfolge) und die S1-Überlagerungscodes L1CO, PRN { "1" } bis { "63" }.

# text
seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, Verteilungsvermerk A), die Prüfspalten, die es neben den Generatorparametern druckt: Tabelle 3.2-2 die ersten und letzten { "24" } Chips jedes L1CP- und L1CD-Codes, Tabelle 3.2-3 die ersten und letzten { "11" } Bits jedes L1CO-Codes, Tabelle 6.2-1 die Legendre-Folge der Länge 10223; mit scripts/extract_is_gps_800_tables.py aus dem PDF transkribiert (SHA-256 c4aad710...). Zielwerte, vorab registriert bei fe372e26 (docs/design/evidence/l1c-codes/): { "252" } von { "252" } Spalten, { "63" } von { "63" } Überlagerungen und { "10 223" } von { "10 223" } Legendre-Bits identisch; die Extraktion mit --check besteht; eine negative Kontrolle schlägt bei umbenannten, invertierten und verschobenen Codes fehl. WAS NICHT GEPRÜFT WIRD: die Generatorparameter selbst (sie stammen aus denselben Tabellen), die Chips zwischen den gedruckten Spalten, das TMBOC-Subträgermuster und die L1CO-S2-Codes.

# text
seg-5cba09089e09 = Primäre LunaNet-AFS-I- und AFS-Q-Codes gegen die gedruckten Prüfspalten von LSIS-AFS V1.0

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits und afs_q_primary_bits (Signalnamen lunanet-afs-i und lunanet-afs-q in kshana iq): der AFS-I-Gold-Code ({ "2047" } auf { "2046" } kurzgezykelt, G2 je PRN verzögert) und der primäre AFS-Q-Weil-Code (berechnete Legendre-Folge, Weil-Index, vor Chip p eingefügte Erweiterungsfolge), PRN { "1" } bis { "210" }.

# text
seg-330ed84e8e78 = Gegen die gedruckten Tabellen von LSIS-AFS V1.0 (in der Spezifikation mit TBC markiert): LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" }. Januar { "2025" } (NASA; PDF-SHA-256 { "986e0795" }...), die Prüfspalten, die es neben den Generatorparametern druckt: Tabellen C-1 bis C-5 und D-2 bis D-6 die ersten und letzten { "24" } Chips jedes AFS-I- und AFS-Q-Codes, Tabelle D-1 die Legendre-Folge der Länge 10223; extrahiert mit scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Zielwerte, vorab registriert bei b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md), bevor der Generator existierte: B1 { "420" } von { "420" }, B2 identisch, B3 { "420" } von { "420" }. Das Dokument kennzeichnet seine Codetabellen mit { "{" }LSIS-TBC{ "}" } und sagt, sie seien nur für Test und Integration bestimmt, sodass dies die Konstruktion gegen die Tabellen dieser Ausgabe validiert, nicht gegen die einer späteren. Eine vorab registrierte Aussage über den gedruckten G2-Anfangszustand (B1b) wurde mit der falschen Richtung formuliert und ist NOT MET ({ "0" } von { "210" }), festgeschrieben; die korrigierte Beziehung ({ "2047" } minus die Verzögerung) gilt für { "210" } von { "210" } und ist als nachträglich vermerkt. WAS NICHT GEPRÜFT WIRD: die Generatorparameter selbst (dieselben Tabellen), die Chips zwischen den gedruckten Spalten, der Tertiärcode, die Nachrichtenschicht und die LDPC-Kodierung.

# text
seg-7b1ae0c7ca28 = LunaNet-AFS-Tertiärcodes und Nachrichtenschicht (SB1-BCH, CRC-24Q, Interleaver) gegen LSIS-AFS V1.0

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: Synchronisationsmuster, SB1-BCH({ "51,8" })-Kodierer und Dekodierer mit 256 Hypothesen, CRC-24Q, der Blockinterleaver { "60" } x { "98" }, ein Symbolstrom-Prüfer (kshana lunanet-afs-check) und ein Teststrom-Generator mit Platzhalter-Subframes. Die LDPC-Kodierung mit Rate 1/2 der Subframes { "2" } bis { "4" } ist nicht implementiert (ihre Matrizen stehen in einem separaten Anhang).

# text
seg-b6f39f180fdd = LSIS-AFS V1.0 (wie oben): die Legendre-Folge der Länge 1499 (Tabelle E-1, identisch) und die ersten und letzten { "24" } Chips des Tertiärcodes (Tabellen E-2 bis E-6: { "419" } von { "420" } Spalten identisch; das Dokument druckt für PRN { "147" } und PRN { "151" } dieselben letzten { "24" } Chips, A14850, und der Generator reproduziert die von PRN { "151" }, sodass der Eintrag für PRN { "147" } höchstwahrscheinlich ein Druckfehler ist; der Zielwert von { "420" } von { "420" } ist NOT MET, und die Abweichung ist festgeschrieben); das Beispiel aus Abbildung { "8" } für den SB1-Code (ein Beispiel: 0x045 wird zu 0x229F61DBB84A0 kodiert); CRC-24Q gegen den Katalog-Prüfwert 0xCDE703 für ASCII { "123456789" }; die eigene Rahmenarithmetik des Dokuments. Zielwerte, vorab registriert bei b3ba5d5. Eine verzeichnete Abweichung und ein Beispiel für die Nachrichtenschicht, daher bleibt die Zeile MODELLED. WAS NICHT GEPRÜFT WIRD: LDPC und die CRC-Wörter in den Subframes { "2" } bis { "4" }, der Nachrichteninhalt und jeder aufgezeichnete Strom

# text
seg-0d7b17524c04 = Standardpakete: Szenarien, bewertet gegen Zielwerte, die vor dem Lauf festgelegt wurden

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): die Testprofile des DHS-Rahmenwerks Resilient PNT für die Stufen { "1" } bis { "4" }, die Genauigkeitsstufen und die Integritätsbewertung nach IMO MSC.1/Circ.1575 sowie die Pakete Überwachen, Bewerten und Abmildern nach ICAO Doc { "9849" } Anhang F: Jeder Test führt eine mitgelieferte Szenarioart aus und vergleicht Ergebnisfelder mit den im Paket angegebenen Zielwerten, und Tests, die ein Empfängerprotokoll benötigen, werden als NEEDS INPUT aufgeführt und nicht bewertet.

# text
seg-d9ea966abdd6 = Keine externe Referenz für die Szenarioergebnisse: Jeder Paket-Test führt eine MODELLED-Szenarioart aus. Die Zielwerte sind das angegebene Profil des Paketautors (das DHS-Rahmenwerk nennt keine Werte; die Genauigkeitsgrenzen der IMO sind Tabelle C-1 von MSC.1/Circ.1575, vollständig gelesen; das ICAO-Paket folgt der eigenen Präsentation der ICAO zum RFI Mitigation Plan, weil Doc { "9849" } eine kostenpflichtige Veröffentlichung ist und nicht gelesen wurde), committet vor jedem bewerteten Lauf in PREREGISTRATION.md-Dateien im Stil von xval unter standards/. Ein MET-Zielwert besagt, dass ein modelliertes Szenario einen angegebenen Zielwert erreicht hat, nichts über ein Produkt

# text
seg-8a8f2c85e0c3 = Nachweispaket der Labor-Rundreise (Szenario, Testbedingungen, Empfängerprotokoll, Bewertung)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) und der Empfängerprotokoll-Export kshana.test-conditions/1 von kshana bench-export: ein signiertes Paket, das den Szenario-Hash, den Hash der angegebenen Bedingungen, den Hash des Protokolls und die Bewertung gegen die angegebenen Ereignisse festhält und Bedingungen zurückweist, die den Bewertungsereignissen widersprechen, oder ein Protokoll, dessen Hash nicht der angegebene ist. Es wird kein Signal geschrieben, abgespielt oder eingeplant.

# text
seg-76da58fe670a = Keine externe Referenz: Das Paket verknüpft Hashes und eine MODELLED-Bewertung des Empfängerprotokolls, geprüft an synthetischen Daten (die exportierten NMEA-Daten eines mitgelieferten Szenarios, behandelt als Protokoll des Empfängers). Ein Laborlauf wird nicht behauptet

# text
seg-a9189e4fe413 = IQ-Tracking-Engine gegen GNSS-SDR { "0.0.19" } an unabhängigen Aufzeichnungen

# text
seg-364de05e5b1b = Die vollständige Tracking-Engine der IQ-Schicht (iq::track über kshana iq track: Akquisitionsübergabe, Korrelatoren, NCOs, Costas-PLL zweiter Ordnung mit { "15" } Hz, trägergestützte DLL erster Ordnung mit { "2" } Hz und EML-Hüllkurve, Lock-Indikator und C/N0-Schätzer) auf GPS L1 C/A bei { "30" } bis { "45" } dB-Hz.

# text
seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, das Paket von Ubuntu { "24.04" }, als eigenständiges Programm ausgeführt; nur abgeleitete Zahlen committet) verfolgt dieselben numpy-Aufzeichnungen (unabhängig von der Engine), beide gemessen gegen die analytische Wahrheit. Zielwerte, vorab registriert bei 48edd4a5, geändert vor jeder Testaufzeichnung bei 1e4288c4 (ein FLL mit { "10" } Hz nur während des Einziehens in beiden Empfängern, nachdem die registrierte Kalibrierung an einer falschen Übergabe von GNSS-SDR gescheitert war, Befund F3). MET bei { "30" }, { "35" }, { "40" } und { "45" } dB-Hz: Trägerjitter innerhalb von { "4.3" } %, Codejitter innerhalb von { "4.6" } % sowie Doppler-Mittelwert und -Streuung innerhalb derer von GNSS-SDR. NOT MET: Der NWPR-C/N0 der Engine liegt { "2.3" } bis { "7.1" } dB unter dem SNV von GNSS-SDR (Befund F4, die bekannte NWPR-Grenze; ihr M2M4 liegt innerhalb von { "0.06" } dB der Wahrheit); die Phasen-Lock-Indikatoren unterscheiden sich per Definition (F5); bei { "30" } dB-Hz rutschte GNSS-SDR zweimal und die Engine nicht (F6). Die eigene Übergabe von GNSS-SDR rastete in { "3" } von { "30" } Kalibrierläufen auf eine falsche Frequenz ein. WAS NICHT GEPRÜFT WIRD: andere Signale, Datenbit-Abstreifung, Wiedererfassung, Feldaufzeichnungen. Die Zeile bleibt MODELLED.

# text
seg-259d201c2ff8 = CRPA-Antennengewinne in der Art jamming gegen eine unabhängige numpy-Neuberechnung

# text
seg-192144c57783 = Der optionale Abschnitt [crpa] der Art jamming: ein Strahl je Kanal zu jedem Satelliten (Nullsteuerung mit dem Jammer als Nullstelle, oder MVDR auf sigma^{ "2" } I + P_j a_j a_j^H), der das Rauschen jeder Verbindung mit ||w||^{ "2" } und den Jammer mit |w^H a_j|^{ "2" } skaliert, bevor die bestehende Anti-Jam-C/N0-Gleichung angewendet wird.

# text
seg-232d040b575d = Eine unabhängige numpy-Neuberechnung (xval/crpa-jamming/oracle.py, kein gemeinsamer Code: numpy-Steuervektoren, numpy.linalg.solve und inv) jeder Verbindung der Geometrie von jamming-demo mit einem quadratischen Array aus 4 Elementen, unter beiden Gewichtungen. Zielwerte, vorab registriert bei 08d83b4d. MET: A1 (alle { "150" } Szenarioergebnisse byteidentisch ohne den Abschnitt, nach einer Korrektur: Der erste Bau fügte die crpa-Einheiten zur Einheitentabelle jedes jamming-Laufs hinzu), A2 (ein Element entspricht keinem Array bis auf { "1e-12" } dB), A3 beim Rauschgewinn des Arrays und beim effektiven C/N0 ({ "912" } Verbindungsgewichtungen innerhalb von { "1e-9" } dB, schlechtester Wert { "2.1e-14" } dB) sowie bei der Jammer-Nullstelle der Nullsteuerung (unter -200 dB auf beiden Seiten), A4 (MVDR innerhalb von { "0.1" } dB der Nullsteuerung bei einem JNR von { "80" } dB). NOT MET: A3 beim MVDR-Jammergewinn, { "194" } von { "456" } Verbindungen über { "1e-9" } dB bei { "0.36" } portabler Mathematik ({ "202" } bei Host-Mathematik; docs/revisions/STUDIO15-batch4-rebaseline.md) (schlechtester Wert { "1.7e-6" } dB) bei Residuen von -100 bis -188 dB, wo die float64-Auslöschung beide Implementierungen begrenzt (die inv und solve von numpy weichen bei { "169" } Verbindungen voneinander ab, schlechtester Wert { "7.9e-7" } dB); das effektive C/N0, das daraus gespeist wird, ist nicht betroffen. WAS NICHT GEPRÜFT WIRD: gegenseitige Kopplung, Elementabweichung, Breitbandverarbeitung, mehrere Jammer, jede Antennenhardware. Eine Neuberechnung derselben Gleichungen, keine externe unabhängige Referenz; die Zeile bleibt MODELLED.

# text
seg-a2f34cff9338 = Geländeabschattung des Jammers in der Szenarioart jamming gegen eine unabhängige numpy-Neuberechnung auf einer realen SRTM-Kachel

# text
seg-334c569d9cae = Der optionale Abschnitt [terrain] der Szenarioart jamming: das Großkreis-Geländeprofil zwischen Jammer und Empfänger auf einer SRTM-.hgt-Kachel mit einer Erdkrümmung nach k-Faktor, die dominante Messerschneide (größtes Fresnel-Kirchhoff-nu) und der Einzel-Messerschneidenverlust nach ITU-R P.526-15 Abschnitt { "4.1" }, abgezogen von der Empfangsleistung des Jammers.

# text
seg-615ea67dd756 = Eine unabhängige numpy-Neuberechnung (xval/jamming-terrain/oracle.py, kein gemeinsamer Code: eigenes Lesen der .hgt, bilineare Interpolation, WGS-{ "84" }-Hin- und Rücktransformation, Profil, Krümmung, nu und J(nu)) von zehn Jammer-Positionen um einen Empfänger im Badwater Basin auf der committeten realen SRTM-Kachel tests/fixtures/terrain/N36W117_sub6.hgt. Zielwerte und Positionen, vorab registriert bei 92cd2bfd. Alle MET: Additivität (alle { "150" } Szenarioergebnisse ohne den Abschnitt byteidentisch); Profilpunkte und Hindernis jeder Position gleich sowie nu und Verlust innerhalb von { "1.6e-10" } (Zielwert { "1e-9" }); der Verlust steigt nie, wenn der Jammer von { "2" } auf { "4902" } m steigt; der Verlust senkt jedes J/S genau um sich selbst und um nichts anderes; J(nu) innerhalb von { "1e-12" } dB desjenigen der unabhängigen Referenz. Befunde: Positionen jenseits der Black und Funeral Mountains verlieren { "44" } bis { "48" } dB; zwei Positionen auf dem Talboden verlieren { "8" } und { "15" } dB allein durch die Erdkrümmung bei Antennenhöhen von { "2" } m, dem Streifenfall des Einzel-Messerschneidenmodells. WAS NICHT GEPRÜFT WIRD: jede gemessene Ausbreitung, Mehrfachkanten-Beugung, Bodenreflexion, Bebauung und Bewuchs, der eigene Fehler des Höhenmodells. Eine Neuberechnung desselben Modells, keine externe unabhängige Referenz; die Zeile bleibt MODELLED.

# text
seg-825c121c7512 = Akquisitionshysterese und Frontend-Quantisierer in der Szenarioart jamming gegen unabhängige Neuberechnungen

# text
seg-f7207263d881 = Die optionalen Abschnitte [acquisition] (ein Satellit wird bei oder über einer Akquisitionsschwelle nach einer Wiedererfassungsverzögerung erfasst und gehalten, solange er bei oder über der Tracking-Schwelle liegt) und [front_end] (die AGC-Anzeige { "10" } log10({ "1" } + J/N) und der Quantisierungsverlust des ADC bei gaußschem Eingang, von jeder Verbindung abgezogen, gekennzeichnet als nicht gültig für nicht-gaußsche Jammer) der Szenarioart jamming.

# text
seg-6abc60ee9ec4 = Eine unabhängige Python-Neuberechnung jedes Akquisitionsflags (xval/jamming-acq-agc/hysteresis.py) aus dem effektiven C/N0 der Engine je Epoche, eine unabhängige numpy-Monte-Carlo-Simulation des Quantisierungsverlusts (xval/jamming-acq-agc/quantiser_mc.py, eigene Suche nach der optimalen Schrittweite, { "2" }^{ "22" } Stichproben) und die AGC-Schleife der IQ-Schicht. Zielwerte, vorab registriert bei 70c72fcc, mit einem ergänzenden Lauf-Satz bei { "37793290" }. MET: Additivität (alle { "150" } Szenarioergebnisse ohne die Abschnitte byteidentisch); jedes Flag gleich in den ergänzenden Läufen ({ "1824" } Verbindungen, davon { "732" } mit Hysterese); monoton in der Schwelle; der Quantisierungsverlust innerhalb von { "0.0007" } dB der Monte-Carlo-Simulation bei { "1" } bis { "4" } Bit (Zielwert { "0.02" } dB); die AGC-Anzeige innerhalb von { "0.012" } dB der AGC-Schleife (Zielwert { "0.05" } dB). NOT MET: Die registrierten Hysterese-Läufe (jamming-demo bei { "10" } bis { "30" } dBW) waren nicht aussagekräftig, da jede Verbindung verloren ging, und ihre H2 und H4 sind nur trivial erfüllt. Befund: Bei einem CW-Jammer verliert ein 1-Bit-ADC etwa { "5" } dB mehr als der gaußsche Wert, den die Engine anwendet, und kennzeichnet dies als nicht gültig. WAS NICHT GEPRÜFT WIRD: die Akquisitionssuche selbst, AGC-Dynamik über die Zeit, jede Empfängerhardware. Neuberechnungen desselben Modells, keine externe unabhängige Referenz; die Zeile bleibt MODELLED.

# text
seg-9c46f1c76486 = Begrenztes FLL-Einziehen unterhalb der FLL-zu-PLL-Übergabeuntergrenze des Standardentwurfs (optional)

# text
seg-efa1d1a9e904 = Das optionale carrier.fll_pull_in_max_s von iq::track (das Feld fll_pull_in_max_s von iq::track::LoopConfig): Bei fll_assist = pull-in übergibt die FLL nach einer festen Einziehzeit unabhängig vom PLI an die PLL, mit einer passenden Rückkehr-Verweildauer, bis der PLI erstmals fll_off_pli erreicht.

# text
seg-76cce58eaddd = Interne Konsistenz gegenüber eingespeister Wahrheit: eine synthetische datenfreie GPS-L1-C/A-Quelle (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, zehn Rauschstartwerte), deren Trägerphase bekannt ist, unter Zielwerten, die bei 58789af0 vorab registriert wurden (docs/design/evidence/fll-handover-floor/). MET: die Kontrolle (der unbegrenzte Standard übergibt bei { "33" } dB-Hz in { "9" } von { "10" } Startwerten nie); Additivität (Standard-Hash und bestehende Tracking-Tests unverändert); Einziehen einer Übergabe mit { "100" } Hz Versatz bei { "45" } dB-Hz. NOT MET: Mit einer Begrenzung von { "1.0" } s Übergabe und Halten in jedem Lauf ({ "16" } von { "20" } bei { "33" } dB-Hz, { "8" } von { "20" } bei { "31" } dB-Hz; die übrigen wechseln zwischen erzwungenen Übergaben und der Rückkehr der FLL) und Phasenjitter innerhalb von { "25" } % der PLL allein ({ "10.8" } gegenüber { "6.1" } Grad bei { "33" } dB-Hz). WAS NICHT GEPRÜFT WIRD: Datenbits, andere Signale und Abtastraten, Feldaufzeichnungen. Der Standard bleibt unverändert; die Zeile bleibt MODELLED.

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
