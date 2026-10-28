# docs--capability-map: translations (de)

# text
seg-76b323512350 = Zeitsysteme

# text
seg-ee2e250497f9 = Export für den Prüfstand

# text
# c1: docs/CAPABILITY.md
seg-956cdb003ffc = Quelle: <c1/>

# text
seg-891eb89a8801 = Fähigkeitskarte: was Kshana leistet, teilweise leistet und nicht leistet

# text
# c1: POSITIONING.md
seg-f9b372e8832b = Kshana ist eine <b>Nachweis-Engine für PNT-Leistung und -Resilienz (Positionierung, Navigation und Zeitgebung)</b>, kein vollständiges Werkzeugset für Raumfahrtsysteme. Sie stellt Zeitgebung und holdover voran, ihr am besten validiertes Gebiet (siehe <a1><c1/></a1>). Diese Seite ist die ehrliche Umfangskarte: Für jeden Fähigkeitsbereich, den ein Beschaffungs- oder Forschungsprüfer kontrollieren könnte, nennt sie den Status, was im Code tatsächlich vorhanden ist, was fehlt und wo er auf der Roadmap steht. Der Status ist einer von:

# text
seg-1b3a49d09c7d = <b>full</b>: durchgängig umgesetzt und auf einem in der Zeile genannten Niveau validiert;

# text
seg-0da2570a5ca3 = <b>partial</b>: ein echtes, aber begrenztes Modell (Umfang unten ausdrücklich begrenzt);

# text
seg-6e02edaa8f54 = <b>none</b>: nicht modelliert (heute außerhalb des Umfangs).

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-6b5bb629bf5e = Dies sind die einzigen drei Werte, die die Statusspalte annimmt. Sie bewerten die <em>Reife der Fähigkeit</em>, eine andere Achse als die Einstufung VALIDATED / MODELLED / PARTNER in <a1><c1/></a1>; diese bewertet die <em>Herkunft der Evidenz</em>, Zeile für Zeile, und wird maschinell aus <c2/> geprüft.

# text
# c1: VALIDATION.md
# c2: INTEGRITY.md
# c3: QUANTUM-MODELS.md
# c4: CLAIMS-VS-REALITY.md
seg-b5eea277511f = Nichts hier ist Wunschdenken: „partial“ heißt nie „fast fertig“, es heißt „so viel und nicht mehr“. Siehe auch <a1><c1/></a1>, <a2><c2/></a2>, <a3><c3/></a3> und das Register zum Abschluss überzogener Aussagen <a4><c4/></a4> (jede historische überzogene Aussage, wie sie behoben wurde, und eine CI-Sperre (kontinuierliche Integration), die sie behoben hält).

# text
seg-b55f7e5a69cc = Kern-PNT (wo Kshana tatsächlich mitspielt)

# text
seg-d6476863f862 = Fähigkeit

# text
seg-ad856ad710eb = Status

# text
seg-2ee4023e3a27 = Was vorhanden ist

# text
seg-25843dc03c73 = Was fehlt

# text
seg-331d2821d43f = Roadmap

# text
seg-724b1929b536 = Bahnbestimmung und Propagation

# text
seg-9aa33b4484ca = partial

# text
# c1: ephemeris
# c2: src/ephemeris.rs
# c3: --export-oem
# c4: src/propagator.rs
# c5: forces::zonal_accel
# c6: J2..J6
# c7: integrate_dopri
# c8: propagate_dopri
# c9: solve_kepler_checked
# c10: Err
# c11: ForceModel::third_body
# c12: accel_at
# c13: src/ephem.rs
# c14: epoch_jd_tt + t/86400
# c15: third_body_accel
# c16: forces::srp_accel
# c17: ForceModel::solar_radiation
# c18: ν·P☉·cᵣ·(A/m)·(AU/d)²·d̂
# c19: forces::conical_shadow
# c20: forces::drag_accel
# c21: ForceModel::drag
# c22: accel_rv
# c23: −½·ρ(h)·(C_D·A/m)·|v_rel|·v_rel
# c24: v_rel = v − ωₑ ẑ × r
# c25: ρ
# c26: forces::atmospheric_density
# c27: forces::relativistic_accel
# c28: ForceModel::relativity
# c29: β = γ = 1
# c30: a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}
# c31: 3μ²/(c²r³)·r̂
# c32: ≈1.9e-9
# c33: forces::lense_thirring_accel
# c34: ForceModel::lense_thirring
# c35: src/orbit_determination.rs
# c36: src/batch_ls.rs
# c37: [r, v]
seg-7f4957a488b7 = Abhängigkeitsfreies <b>SGP4/SDP4</b> (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), validiert auf { "4.12" } mm gegen alle { "666" } Vektoren AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 (Position <b>und</b> Geschwindigkeit, Letztere auf { "1" } mm/s); analytisch Keplersch + J2-säkular; die inertiale Geschwindigkeit wird bereitgestellt und <b>durchgängig</b> über das lauffähige <b>Szenario <c1/></b> (<c2/>, erreichbar über CLI/Python/WASM/MCP (CLI: Kommandozeilenschnittstelle; WASM: WebAssembly; MCP: Model Context Protocol)) bereitgestellt: Pro Schritt gibt es den Zustand in TEME (wahrer Äquator, mittleres Äquinoktium) <b>und</b> GCRS (Geocentric Celestial Reference System) aus (Position + Geschwindigkeit), die Position in ITRF/ECEF (ITRF: International Terrestrial Reference Frame; ECEF: Earth-centred, Earth-fixed), die <b>Bodenspur des Subsatellitenpunkts</b> in WGS-84 (WGS: World Geodetic System) (Breite/Länge/Höhe) sowie Azimut/Elevation/Entfernung der Station + <b>Entfernungsrate/Doppler</b> (die radiale Entfernungsrate stimmt mit der wahren Ortsableitung, frei von JD-Rauschen (JD: Julianisches Datum), auf { "6e-9" } m/s überein), und über den geschwindigkeitsführenden Ephemeriden-Export im CCSDS-Format (Consultative Committee for Space Data Systems) <b>OEM</b> (Orbit Ephemeris Message) (<c3/>). Ein <b>numerischer (Cowell-)Propagator</b> (<c4/>) integriert ein konfigurierbares Kraftmodell der <b>zonalen Gravitation</b>, das <b>vollständige zonale Erdfeld bis Grad { "6" }</b> (<c5/>, das veröffentlichte EGM-96 (EGM: Earth Gravitational Model) <c6/>), mit einem Treiber nach Wahl, adaptiv: RK4 (Runge-Kutta vierter Ordnung) mit <b>Schrittverdopplung</b> oder das eingebettete Paar <b>Dormand-Prince RK5({ "4" })</b> (<c7/> / <c8/>, eine billigere eingebettete Fehlerschätzung mit 7 Auswertungen, die dasselbe Kepler-Kriterium erfüllt und mit dem RK4-Pfad auf <{ "1" } m übereinstimmt, Bahn mit J2..J6), festgemacht an <b>analytischer Wahrheit, die stärker ist als ein numerischer Werkzeugvergleich</b>: Die ungestörte Bahn reproduziert die <b>exakte Kepler-Lösung in universellen Variablen auf unter einen Meter über { "24" } h</b> (ein engeres Kriterium als das „gegen die Referenz < { "10" } m“ des Meilensteins), Energie und Drehimpuls bleiben auf ~{ "1e-9" } relativ erhalten, die J2-Knotenregression stimmt nach der Theorie erster Ordnung mit der geschlossenen säkularen Rate überein, die zonale Beschleunigung ist nachweislich der <b>exakte Gradient ihres eigenen Potenzials</b> (und reduziert sich auf die mit 666 Vektoren validierte geschlossene J2-Form), und <c9/> <b>gibt <c10/> zurück, statt eine falsche Antwort zu liefern</b>, wenn Newton nicht konvergiert (z. B. nahe dem Perigäum bei e = { "0.999" }). Die <b>epochengetriebene Gravitation dritter Körper (Sonne und Mond)</b> ist <b>in den zeitvarianten Integrator eingebunden</b> (<c11/> / <c12/>, mit den niedrigpräzisen Sonnen- und Mondephemeriden von Montenbruck & Gill in <c13/>; kein Kernel DE/SPK (DE: Development Ephemeris; SPK: planetarer Ephemeridenkernel) nötig): Jede Auswertung der rechten Seite (RHS) tastet die Positionen der Störkörper zur fortgeschriebenen Epoche <c14/> ab, sodass sich Sonne und Mond während der Integration auf ihren Bahnen bewegen. Die Störung ist nachweislich der exakte Gradient ihres Störpotenzials, verschwindet im Geozentrum und hat die lehrbuchmäßigen Größenordnungen im LEO (niedriger Erdorbit) (~{ "5e-7" } m/s² Sonne, ~{ "1.1e-6" } m/s² Mond); die Sonnenephemeride trifft von Hand abgeleitete J2000-Ankerwerte (Perihelabstand, ~−{ "23" }° Deklination zur Sonnenwende, ~{ "1" }°/Tag Bewegung) und die Mondephemeride ihre Perigäums-/Apogäumshülle, ~{ "384 400" } km mittleren Abstand, die Neigungsgrenze ≤ { "5.3" }° und die Richtungsrückkehr nach einem siderischen Monat; und die Integrationsanbindung ist <b>bitgenau</b> belegt (der RHS-Term entspricht <c15/> an der abgetasteten Position bei t = { "0" } und t = { "1" } Tag), wobei eine Epochenverschiebung um ein Vierteljahr eine andere Trajektorie ergibt. Der <b>Strahlungsdruck der Sonne</b> (SRP) fährt auf derselben epochengetriebenen RHS mit (<c16/> / <c17/>): das Kanonenkugelmodell <c18/> mit einem Finsternisfaktor aus Kernschatten + Halbschatten, <c19/> (glatt ν ∈ [{ "0,1" }], nachweislich über einen monotonen Halbschatten abklingend, der über den Kernschattenzylinder hinausreicht), geprüft gegen den lehrbuchmäßigen Druck bei 1 AU (AU: astronomische Einheit) (≈ { "4.54e-6" } N/m²), die Größenordnung von ~{ "1.36e-7" } m/s² im LEO, die von der Sonne wegdrückt, den Abfall mit dem Abstandsquadrat (doppelter Sonnenabstand viertelt ihn), eine <b>exakt verschwindende</b> Beschleunigung im Kernschattenzylinder und eine propagierte Verschiebung, die ~linear mit A/m skaliert. Der <b>atmosphärische Luftwiderstand</b> ist der erste geschwindigkeitsabhängige Term (<c20/> / <c21/> + die neue RHS <c22/> / mit Geschwindigkeitsübergabe): quadratischer Luftwiderstand <c23/> gegen die mitrotierende Atmosphäre <c24/>, wobei <c25/> die stückweise exponentielle <c26/> nach Vallado ist, nachgewiesen durch den Anker von { "1.225" } kg/m³ auf Meereshöhe, einen streng monotonen LEO-Abfall mit einer physikalischen Skalenhöhe von ~{ "58" } km, die Größenordnung von ~{ "2e-6" } m/s² des Luftwiderstands entgegen der Relativgeschwindigkeit und die <b>Dissipationssignatur</b> (eine Bahn in { "300" } km verliert monoton spezifische Energie, und ihre große Halbachse nimmt begrenzt um ~km/Tag ab, während die Vakuumbahn die Energie erhält). Die <b>post-Newtonsche (Schwarzschild-)Relativitätskorrektur</b> ist der zweite geschwindigkeitsabhängige Term (<c27/> / <c28/>): die Form <c29/> des IERS (International Earth Rotation and Reference Systems Service) <c30/>, der führende Treiber der relativistischen Perigäumsdrehung, nachgewiesen gegen ihren geschlossenen Kreisbahnwert <c31/> (radial, nach außen), ihr lehrbuchmäßiges Verhältnis <c32/> im LEO zum Zweikörperproblem, die von Hand vereinfachte Form der radialen Geschwindigkeit und die <b>konservative Signatur</b> (sie stört die Bahn, hält aber die große Halbachse auf unter einen Meter/Tag, das strukturelle Gegenteil des Luftwiderstands). Der Term der <b>Lense-Thirring</b>-Rahmenmitführung (<c33/> / <c34/>, IERS { "2010" } §{ "10" }) ist die gravitomagnetische Korrektur jenseits von Schwarzschild, optional, im LEO ~{ "1" }–{ "2" } Größenordnungen darunter, nachweislich verschwindend ohne Erdrotation und unterhalb der Schwarzschild-Größenordnung. Die <b>Bahnbestimmung</b> (OD, <c35/>) schließt den Kreis von Beobachtungen zurück zu einem Zustand: Ein <b>Gauss-Newton-Batch</b>-Korrektor (<c36/>) treibt ein Kandidatenpaar <c37/> auf die beste Anpassung von über den Bogen propagierten Stationsentfernungen (unter einem Meter / mm·s⁻¹ aus rauschfreien Entfernungen; ~{ "2" } m mit einem Residuum nach der Anpassung am Rauschboden von { "5" } m, der Signatur einer konsistenten Kleinste-Quadrate-Anpassung), mit einer <b>sequenziellen</b> rekursiven Variante auf dem Unscented-Filter

# text
# c1: src/gravity_sh.rs
# c2: from_gfc
# c3: src/precise_od.rs
# c4: AGENCY-ORBIT-VALIDATION.md
# c5: tests/numerical_cowell_propagator_reference.rs
# c6: tests/batch_sequential_orbit_determination_reference.rs
seg-4bca83197ed6 = Das Standard-Kraftmodell nach Cowell führt nur das zonale Feld; das hochgradige <b>tesserale</b> Feld EGM2008 (Earth Gravitational Model { "2008" }) (<c1/>, Grad/Ordnung { "70" }, mit einem Lader <c2/> für ICGEM-Dateien (International Centre for Global Earth Models)) wird nur in die Engine zur präzisen Ephemeridenanpassung (<c3/>; siehe <a1><c4/></a1>) eingebunden; die Luftwiderstandsdichte ist die <b>statische</b> stückweise Exponentialfunktion nach Vallado (unabhängig von der Sonnenaktivität), <b>nicht</b> NRLMSISE-00 (das Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model; die Klausel zur thermosphärischen Dichte von < { "5" } %); der SRP ist das <b>Kanonenkugel</b>-Modell mit einem geometrischen <b>konischen Kernschatten + Halbschatten</b> (keine Randverdunkelung der Sonne, kein Schatten der abgeplatteten Erde, keine Form/Lage des Satelliten); die Relativität deckt die Terme von <b>Schwarzschild und Lense-Thirring</b> (Rahmenmitführung) ab, beide optional, aber ohne Abstimmung der PPN-Parameter (PPN: parametrisiertes post-Newtonsches); <b>Gravitation dritter Körper/SRP verwenden die niedrigpräzisen Ephemeriden (~{ "0.005" }° Sonne, ~{ "0.3" }° Mond), nicht die Genauigkeit von DE/SPK-Kernels</b>. Die konservativen Stufen des Kraftmodells (Zweikörper → J2–J6 → Sonne/Mond → SRP) sind <b>VALIDATED gegen Orekit { "12.2" }</b> (schlechtester Wert { "0.08" } m über { "24" } h, <c5/>), und die Batch-/sequenzielle Bahnbestimmung ist <b>VALIDATED gegen die Schätzer von Orekit { "12.2" }</b> (<c6/>); die Luftwiderstandsstufe und die absolute Treue der Ephemeriden- und Dichteeingabe bleiben MODELLED; es gibt keine Gegenprüfung mit GMAT (General Mission Analysis Tool)

# text
seg-c66f25447fe9 = tesserale Gravitation im Standard-Cowell-Modell + Luftwiderstand nach NRLMSISE-00 + Randverdunkelung der Sonne + Ephemeride auf DE-Niveau + Kreuzvalidierung mit GMAT + OD-Messungen von Entfernungsrate/Winkel und analytische STM (Zustandsübergangsmatrix): P2+

# text
# c1: src/timescales.rs
# c2: eraEra00
# c3: gstime
# c4: ephemeris
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: finals2000A
# c9: eop_finals2000a
# c10: kshana --eop <file>
# c11: EopSeries
# c12: precise_od
seg-fffd275219ff = <c1/>: Julianisches-Datum-API (zivil↔JD, MJD (modifiziertes Julianisches Datum)), UTC↔TAI (UTC: Koordinierte Weltzeit; TAI: Internationale Atomzeit) über die vollständige IERS-Schaltsekundentabelle ({ "10" }→{ "37" } s, { "1972" }→{ "2017" }), TAI→TT (TT: Terrestrische Zeit), UT1 (Weltzeit { "1" }, Zeit der Erdrotation) über DUT1 (die Erdrotationszeit minus Koordinierte Weltzeit) und der <b>Erdrotationswinkel</b> nach IAU-2000 (IAU: Internationale Astronomische Union) (ERA, bitgenau gegen den SOFA-Vektor (Standards of Fundamental Astronomy) <c2/> validiert). Die <b>Näherung DUT1≈{ "0" } des SGP4-Pfads ist ausdrücklich dokumentiert</b> an der Aufrufstelle <c3/> (ein GMST-Fehler (mittlere Greenwich-Sternzeit) von ≤ ~{ "13" }″, weit innerhalb des eigenen Modellfehlers von SGP4), und das Szenario <c4/> nimmt ausdrückliche Stellgrößen <c5/>/<c6/>/<c7/> entgegen <b>oder eine eingebettete echte IERS-Reihe <c8/></b> (<c9/> / <c10/>, interpoliert durch dasselbe <c11/>, das <c12/> verwendet), sodass die Bodenspur über echte IERS-UT1 / Polbewegung reduziert wird, nicht nur über die nominalen Skalare

# text
# c1: f64
# c2: timescales::TwoPartJd
# c3: src/jd2.rs
# c4: Jd2
# c5: Sgp4::propagate_at(Jd2)
# c6: tests/jd2_sofa_time_oracle.rs
# c7: jd2::gmst82
# c8: cio::gcrs_to_itrs_matrix_jd2
# c9: orbit::Propagator::position_in_frame_jd2
# c10: two_part_jd
# c11: tests/jd2_earth_rotation_erfa_oracle.rs
# c12: Jd2
# c13: TwoPartJd
# c14: f64
# c15: two_part_jd
# c16: f64
# c17: jd2
# c18: timescales::tai_minus_utc_on_date
# c19: tests/jd2_pre1972_sofa_oracle.rs
# c20: f64
# c21: timescales::tai_minus_utc
# c22: src/eop_ls_ar.rs
# c23: EopSeries::with_ls_ar_prediction
# c24: tests/eop_prediction_beyond_table.rs
seg-d488e9db94e9 = Die Erdorbit-Pfade verwenden weiterhin ein JD mit einem einzelnen <c1/> (~{ "50" } µs Auflösung um { "2020" }; das, nicht der Algorithmus, ist die Untergrenze für eine Gegenprüfung mit finiten Differenzen); ein zweiteiliges JD existiert (<c2/>, verwendet von den Pfaden für Radiometrie, CCSDS-TDM, Bodensegment-Simulator und Sonnensystem sowie <c3/> <c4/>) und wird durch SGP4 (<c5/>), Überflugvorhersage, Geometrie und Walker-Entwürfe geführt (gegen SOFA validiert, <c6/>) sowie durch die Erdrotation auf dem Orbitpfad (<c7/>, <c8/>, <c9/>, das optionale <c10/> des Ephemeridenszenarios; VALIDATED gegen ERFA, <c11/>), mit verlustfreien Umwandlungen zwischen <c12/> und <c13/>; die Standard-Erdorbit-Pfade behalten das Datum mit einzelnem <c14/>, solange <c15/> nicht gesetzt ist, und die Epoche des Cowell-Kraftmodells bleibt absichtlich einfach <c16/> (ihr analytischer Sonnen-/Mondfehler übersteigt eine Rundung von { "40" } µs bei Weitem); UTC mit Gummisekunde vor 1972 ({ "1960" }–{ "1971" }) wird auf dem zweiteiligen Pfad modelliert (<c17/>, <c18/>, VALIDATED gegen ERFA, <c19/>), aber das <c21/> mit einzelnem <c20/> begrenzt vor { "1972" } weiterhin auf { "10" } s; ein Prädiktor der Erdorientierung nach kleinsten Quadraten + Autoregression (<c22/>, als Befund mit dem IERS Bulletin A verglichen) kann nun eine EOP-Reihe über ihre letzte Zeile hinaus fortsetzen (<c23/>, optional; <c24/>), sodass die Rahmenargumente jenseits der Tabelle der Vorhersage folgen, statt begrenzt zu werden; die Standardreihe begrenzt weiterhin, und noch kein Szenarioschlüssel schaltet die Vorhersage ein

# text
seg-d59294cf367c = <b>erledigt</b> (Grundlage); zweiteiliges JD durch die Erdrotation auf dem Orbitpfad: <b>erledigt</b> (optional im Ephemeridenszenario) ; EOP-Vorhersage jenseits der Tabelle: <b>erledigt</b> (Bibliothek, optional); UTC vor 1972 auf dem zweiteiligen Pfad: <b>erledigt</b>

# text
seg-798b3b5db6d6 = Bezugssysteme

# text
seg-69930da8bc5a = full

# text
# c1: src/frames.rs
# c2: src/precession.rs
# c3: (γ̄, φ̄, ψ̄, ε̄_A)
# c4: src/nutation.rs
# c5: nutation_iau2000a
# c6: nutation_matrix_2000a
# c7: nut00a
# c8: tools/gen_nut00a.py
# c9: iauNumat
# c10: teme_to_gcrs(r, v, jd_tt)
# c11: nut00a
# c12: nut00b
# c13: teme_to_itrf
# c14: polar_motion_matrix
# c15: iauPom00
# c16: x_p
# c17: y_p
# c18: src/cio.rs
# c19: X,Y
# c20: s
# c21: gcrs_to_cirs_matrix
# c22: gcrs_to_itrs_matrix
# c23: eraXys06a
# c24: eraC2ixys
# c25: eraEra00
# c26: tests/frame_reference_vectors.rs
# c27: ephemeris
seg-4b3fe53b3dcd = <c1/>: GMST-basiertes TEME↔ECEF, geodätisch↔ECEF nach WGS-84 (exakt + iterative Umkehrung, Maschinengenauigkeit in allen Höhen) und ein geodätischer Bodenstationsbeobachter (Azimut/Elevation/Entfernung); <b>IAU-{ "2006" }-Präzession</b> (<c2/>: die Fukushima-Williams-Winkel <c3/> + die Bias-Präzessionsmatrix GCRS↔mittleres Datum); <b>IAU-2000A/2000B-Nutation + vollständige Kette TEME→GCRS</b> (<c4/>: die <b>vollständige Reihe IAU 2000A</b>, { "678" } lunisolare + { "687" } planetare Terme, <c5/> / <c6/>, Tabelle maschinell aus der ERFA-Referenz (Essential Routines for Fundamental Astronomy) <c7/> durch <c8/> erzeugt, neben der Reihe 2000B mit 77 Termen, den Delaunay-Argumenten, der SOFA-Nutationsmatrix <c9/>, der Äquinoktiengleichung und <c10/> über TEME→TOD→MOD→GCRS (wahres Datum, mittleres Datum); beide Reihen <b>bitgenau</b> gegen die SOFA/ERFA-Referenzvektoren <c11/>/<c12/> validiert, Δψ/Δε auf { "1e-13" } rad); <b>IERS-Polbewegung</b> PEF→ITRF (pseudo-erdfest nach terrestrisch) (<c13/> / <c14/>, SOFA <c15/>, vom Aufrufer gelieferte <c16/>/<c17/>; ein Effekt von mehreren zehn Metern im Bahnradius); <b>CIO-basierte (CIO: Celestial Intermediate Origin) Reduktion IAU 2006/2000A</b> (<c18/>: die äquinoxfreie Kette GCRS↔CIRS↔ITRS (CIRS: Celestial Intermediate Reference System; ITRS: International Terrestrial Reference System), CIP (Celestial Intermediate Pole) <c19/> aus der NPB-Matrix (Nutation-Präzession-Bias) 2006/2000A, die Reihe <c20/> des CIO-Lokators mit 66 Termen, <c21/>, der Erdrotationswinkel und die vollständige <c22/>, <b>bitgenau</b> gegen die SOFA-Vektoren <c23/>/<c24/>/<c25/> validiert). Die <b>Ende-zu-Ende</b>-Transformationen sind nun an ein veröffentlichtes maßgebliches durchgerechnetes Beispiel gebunden, nicht nur an Selbstkonsistenz: Gegen den Zustand <b>Vallado</b> AIAA 2006-6753 (2004-04-06, mit seinen IERS-EOP (Erdorientierungsparameter); <c26/>) stimmt TEME→PEF auf <b>{ "0.1" } mm</b> überein, TEME→ITRF auf <b>{ "0.6" } mm</b>, das vollständige CIO GCRS→ITRS auf <b>{ "4" } mm</b>, und ECEF→geodätisch reproduziert Breite/Länge/Höhe von Vallado Beispiel 3-3 bis zur letzten veröffentlichten Stelle. Die ganze Kette ist <b>für Nutzer erreichbar</b> über das Szenario <c27/> (Position in ITRF/ECEF + Bodenspur des Subsatellitenpunkts in WGS-84 je Schritt)

# text
# c1: nutation_matrix_2000a
# c2: src/cio.rs
# c3: xval/anise-frames/
# c4: gcrs_to_itrs_matrix
# c5: precession_matrix
# c6: teme_to_gcrs_matrix
# c7: cio::gcrs_to_cirs_matrix_with_offsets
# c8: tests/frames_erfa_vector_oracle.rs
seg-d33e9458e239 = Die Standardkette TEME→GCRS verwendet 2000B (~{ "1" } mas, unterhalb ihrer eigenen Vereinfachung der Rotation des Geschwindigkeitssystems); mit < { "0.1" } mas steht der vollständige Pfad 2000A über <c1/> bereit, und die strenge Reduktion <b>CIO (X, Y, s)</b> steht über <c2/> bereit. Der ältere TEME-Pfad verwendet GMST nach IAU-1982 (SGP4-Konvention). Die unabhängige numerische Gegenprüfung mit ANISE/SPICE (ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, ein reines Rust-Werkzeug für Planetengeometrie; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events) ist <b>geliefert</b> (<c3/>: <c4/> gegen GCRF→ITRF93 (GCRF: Geocentric Celestial Reference Frame; ITRF93: International Terrestrial Reference Frame { "1993" }) von ANISE über acht Epochen { "2020" }–{ "2023" }, ≤ { "0.86" } m am Boden, ≤ { "3.6" } m in der GNSS-Bahn (Globales Navigationssatellitensystem)); sie ist ein eigenständiges Crate außerhalb der Standard-CI-Sperren. <c5/> und <c6/> werden außerdem direkt gegen ERFA bei { "40" } Epochen { "1950" }–{ "2100" } geprüft, und die CIO-Kette nimmt die IERS-Himmelspol-Offsets dX, dY entgegen (<c7/>; <c8/>); die Standardpfade vernachlässigen dX, dY weiterhin. Die Verifikationsmatrix stuft diese Zeile als <b>VALIDATED</b> ein (SOFA/ERFA-Vektoren + Vallado)

# text
seg-0713e7ed6be7 = TEME↔ECEF + geodätisch: <b>erledigt</b> (durch Vallado verifiziert); inertiales TEME→GCRS: <b>erledigt</b> (2000B + vollständiges 2000A); Polbewegung ITRF: <b>erledigt</b> (durch Vallado verifiziert); CIO GCRS→ITRS: <b>erledigt</b> (durch Vallado verifiziert)

# text
seg-7e3e210ca43c = Zeitgebung und Frequenz

# text
# c1: src/filter_health.rs
# c2: filter_health
# c3: src/allan.rs
# c4: tests/allan_reference.rs
# c5: src/timetransfer.rs
# c6: src/holdover.rs
# c7: σ_x²(t) = q_wf·t + q_rw·t³/3 + q_drift·t⁵/20
# c8: clock_state
# c9: src/tpl.rs
# c10: cargo run --example tpl_jammertest
# c11: allantools
# c12: tests/mtie_reference.rs
# c13: tests/mdev_tdev_reference.rs
# c14: tests/gnss_denied_clock_holdover_reference.rs
# c15: telecom-timing
# c16: TELECOM-TIMING.md
seg-97de2d9d9ccf = Exakte Kalman-Uhr mit zwei Zuständen und van-Loan-Q (NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }) mit einer <b>Joseph-stabilisierten Kovarianzaktualisierung</b> (positiv semidefinit bei extremen Q/R-Verhältnissen, in CI per Cholesky geprüft) und einem <b>Gesundheitsmonitor für die Filterkonsistenz</b> (<c1/>): eine Monte-Carlo-Bewertung von NIS/NEES (NIS: normiertes Innovationsquadrat; NEES: normiertes Schätzfehlerquadrat) gegen χ²-Konfidenzbänder, ausgegeben als <c2/> im Ergebnis-JSON (JavaScript Object Notation) und als grün/gelbe Karte im Playground, mit einem Sweep-Test zur Q/R-Fehlanpassung, der belegt, dass der Monitor auf <em>inkonsistent</em> kippt, wenn die Abstimmung nicht stimmt (Bar-Shalom §{ "5.4" }); überlappende Schätzer für <b>ADEV (Allan-Abweichung), MDEV (modifizierte Allan-Abweichung), TDEV (Zeitabweichung), HDEV</b> (Hadamard-Abweichung) + χ²-basierte Konfidenzintervalle mit <b>rauschartspezifischen effektiven Freiheitsgraden</b> (geschlossene Formen aus NIST SP { "1065" } Tabelle { "5" } für WPM/FPM/WFM/FFM/RWFM (WPM: weiße Phasenmodulation; FPM: Flicker-Phasenmodulation; WFM: weiße Frequenzmodulation; FFM: Flicker-Frequenzmodulation; RWFM: Random-Walk-Frequenzmodulation), den Satz, den Stable32 verwendet; die exportierte ADEV-Kurve erkennt die Potenzgesetzart der Aufzeichnung an der MDEV-Steigung und setzt ein { "95" }-%-Band je τ an, <c3/>), <b>numerisch gegen die Stable32-Referenzabweichungen für den kanonischen Datensatz NBS14 auf { "1e-4" } validiert</b> (<c4/>), wobei die edf durch ein Monte-Carlo-Ensemble mit weißer FM (FM: Frequenzmodulation) gegengeprüft wird; eine ehrliche, rastergebundene holdover-Gütegröße; Uhrenensembles; ein <b>Zweiwege-Zeitübertragungsmodell</b> mit Auslöschung reziproker Laufzeiten + einer nichtreziproken Untergrenze des Differenzlaufzeit-Random-Walk-FM (<c5/>, Allan-Signatur berichtet); ein <b>Uhren-holdover-Rechner für GNSS-verweigerte Lagen</b> (<c6/>), der das geschlossene Wachstum des van-Loan-Auslauffehlers <c7/> als nutzerseitige Umkehrung <em>holdover bis zur Schwelle</em> bereitstellt (wie lange eine Uhr frei läuft, bevor ihr Zeitfehler das Budget überschreitet), mit repräsentativen Quantenuhrklassen (optisches Gitter/Ionenfalle/Quecksilberion): <b>modelliert, nicht extern validiert</b>, gegengeprüft gegen die mehrstufige Kovarianzrekursion <c8/>, und ehrlich festgehalten, dass bei einer sehr stabilen Uhr der holdover bis zu einer engen Schwelle <b>vom <em>angenommenen</em> Rot-Rausch-Boden bei langem Tau bestimmt wird, nicht von der zitierten ADEV</b> (für eine belastbare Zahl gemessene Böden verwenden). Ein <b>bedingtes Timing-Schutzniveau</b> (<c9/>) baut auf derselben holdover-Maschinerie für den Fall des <em>Spoofing</em> auf: eine Schranke für den <b>unerkannten</b> Zeitfehler bei einer unabhängigen Gegenprüfung, nämlich einen k-σ-Monitorboden plus die van-Loan-Auslaufvarianz über die Erkennungslatenz plus eine CUSUM-Zeit bis zum Alarm (kumulative Summe), kalibriert an einem <b>echten aufgezeichneten Spoof</b> (JammerTest { "2024" }, Zenodo { "15911589" }) und reproduzierbar über <c10/>. <b>Modellierte</b> Komposition, bedingt auf die Erkennung: Es gibt keine endliche <em>unbedingte</em> Schranke (eine hinreichend langsame Rampe entgeht einem einzelnen uhrengestützten Monitor). <b>Maximaler Zeitintervallfehler (MTIE)</b> und <b>TDEV</b> sind gegen <c11/> VALIDATED (<c12/>, <c13/>), und die Umkehrung der holdover-Auslaufvarianz ist gegen SciPy VALIDATED (<c14/>); die Art <c15/> wendet sie auf die ITU-T-Masken (International Telecommunication Union Telecommunication Standardization Sector) G.8272 / G.8272.1 / G.8273.2 / G.8271.1 an, siehe <a1><c16/></a1>

# text
seg-cf16b15c0a27 = die vollständige edf nach dem Greenhall-Algorithmus (die einfachen geschlossenen Formen sind verzerrungsbegrenzt, aber gröber als die exakte BasicSum) und die Identifikation von Mischungen mehrerer Rauscharten

# text
seg-d35d1a9e0ed3 = exakte edf + Identifikation gemischten Rauschens: P2

# text
seg-cdfb50bca79e = GNSS-/PNT-Verarbeitung

# text
# c1: gnss-sim
# c2: src/gnss_sim.rs
# c3: ρ = geometric range + c·δt_rx − c·δt_sv + I + T + noise + multipath
# c4: gnss_measurements[]
# c5: Propagator
# c6: rinex
# c7: scenarios/orbit-rinex.toml
# c8: pvt
# c9: src/pvt.rs
# c10: −TGD
# c11: tests/pvt_abmf.rs
# c12: scenarios/pvt-abmf.toml
seg-733cf51a8c5e = Eine <b>Pseudorange-Simulation im Messbereich</b> (Art <c1/>, <c2/>): Je sichtbarem Satelliten synthetisiert sie <c3/> und den L1-Doppler, mit der <b>Einfrequenz-Ionosphäre nach Klobuchar</b> (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §{ "20.3.3.5.2.5" }) und der <b>Zenit-Troposphäre nach Saastamoinen</b> (Davis { "1985" }), projiziert durch die <b>Abbildungsfunktion von Niell ({ "1996" })</b>, jedes Modell per Einheitentest gegen Handrechnung geprüft, und führt dann die Residuen dem <b>Snapshot-RAIM</b> (Receiver Autonomous Integrity Monitoring) für HPL/VPL je Epoche zu (HPL: horizontales Schutzniveau; VPL: vertikales Schutzniveau) und gibt ein Array <c4/> aus (Pseudorange, Doppler, C/N₀, Iono-/Tropo-Korrekturen je SV (Space Vehicle, also Satellit)). Dazu DOP/Verfügbarkeit (DOP: Dilution of Precision) und Solution-Separation-RAIM aus Bahnen; <b>Einlesen von RINEX (Receiver Independent Exchange Format) { "3" } Multi-GNSS-NAV</b> (GPS/Galileo/QZSS/BeiDou (QZSS: japanisches Quasi-Zenith Satellite System) über IS-GPS-200, GLONASS (russisches Global Navigation Satellite System) Zustandsvektor) geparst → SV-ECEF-Position und Uhrenversatz, verwendbar als erstklassige Quelle <c5/> UND als eingebetteter Konstellationsblock <c6/> (<c7/>); <b>Einlesen von RINEX { "3" }-BEOBACHTUNGEN</b> (das Beobachtungslayout { "4.00" } soll sich parsen lassen, aber es wurde keine Datei { "4.00" } erprobt; RINEX-{ "4" }-NAVIGATIONSDATEIEN werden namentlich zurückgewiesen statt falsch dekodiert); ein <b>Einzelpunkt-Positionierungslöser</b> (Art <c8/>, <c9/>), der echte RINEX-Code-Pseudoranges + Broadcast-Ephemeriden durch iterierte gewichtete kleinste Quadrate in eine <b>Empfängerposition</b> verwandelt, mit Sagnac-/Erdrotationskorrektur, Broadcast-Satellitenuhr mit <c10/>, der <b>ionosphärenfreien Zweifrequenz-Kombination L1/L2</b> (oder Einfrequenz-Klobuchar), Troposphäre nach Saastamoinen/Niell, Elevationsgewichtung, DOP und Snapshot-RAIM, <b>an echten IGS-Daten validiert</b> (International GNSS Service) (Station ABMF, Guadeloupe, 2018-05-13) auf <b>{ "5.7" } m 3-D-RMS (Effektivwert) / { "1.1" } m horizontal</b> gegen die vermessene Koordinate der Station (<c11/>, <c12/>); und Lesen/Schreiben von SP3 (Standard Product { "3" }, das Format präziser Bahnen)

# text
seg-61b43da61326 = Fixierung der PPP-Mehrdeutigkeiten, kinematisches oder Netz-RTK, Echtzeitbetrieb: RTKLIB/gLAB verwenden (RTKLIB: eine quelloffene Bibliothek für kinematische Echtzeitpositionierung)

# text
seg-820a5f1f7e3b = Sensorfusion / Koppelnavigation mit INS (Trägheitsnavigationssystem)

# text
# c1: src/inertial/{attitude,mechanization,imu_errors}.rs
# c2: src/fusion/pack.rs
# c3: kind = "gnss-ins"
# c4: src/fusion/{gnss_ins_ekf,closed_loop}.rs
# c5: inertial
# c6: update_tightly_coupled
# c7: fuse_tightly_coupled
# c8: src/fusion/tightly_coupled17.rs
# c9: q_va
# c10: src/fusion/hybrid_ukf.rs
# c11: kind = "hybrid-ukf"
# c12: q_va
# c13: clock_state::q_from_allan
# c14: q_wf
# c15: q_rw
# c16: gnss-ins
# c17: [imu_*.error_model]
seg-4181becfd059 = <b>Strapdown-Bibliothek mit 3 Achsen</b> (<c1/>): Quaternionenlage mit Coning-/Sculling-Kompensation, vollständige NED-Mechanisierung (Nord-Ost-Unten) (Erdrate + Transportrate, Somigliana-Schwere nach WGS-84) und ein deterministisches IMU-Fehlermodell (inertiale Messeinheit) (<b>Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung, Ratenrampe</b> modelliert). Der Strapdown-Navigator ist nun <b>in ein lauffähiges lose gekoppeltes GNSS/INS-Paket eingebunden</b>, mit einer Gütegröße (<c2/>, <c3/>): Die dreiachsige Mechanisierung wird vom <b>Fehlerzustands-EKF mit 15 Zuständen</b> (erweitertes Kalman-Filter) (<c4/>, Rückführung von Position/Geschwindigkeit/Lage/Bias) nachgeführt, solange GNSS verfügbar ist, und läuft dann durch den Ausfall im Auslauf; das ersetzt das Zurücksetzen auf die Wahrheit durch echte Fusion und berichtet den fusionierten Horizontalfehler gegenüber dem offenen freien INS-Auslauf. Das getrennte ältere Paket <c5/> führt weiterhin das <b>skalare 1-DOF-Budget</b> (DOF: Freiheitsgrad) mit Zurücksetzen auf die Wahrheit aus. Ebenfalls umgesetzt ist eine <b>eng gekoppelte Pseudorange</b>-Aktualisierung (<c6/> / <c7/>): Sie bildet die Innovation im Entfernungsbereich (Sichtlinien-Jacobi-Matrix auf δp) und korrigiert weiter mit <b>weniger als vier Satelliten</b>, wo eine lose gekoppelte PVT-Lösung (Position, Geschwindigkeit und Zeit) nicht existiert. Ein <b>vollständiges eng gekoppeltes GNSS/INS-UKF mit 17 Zuständen</b> (Unscented-Kalman-Filter) (<c8/>) führt Position, Geschwindigkeit, Lagefehler, Beschleunigungsmesser- und Kreiselbiase sowie die Empfängeruhr (Versatz + Drift) mit <b>Quanten-CAI-Koppelnavigation</b> (CAI: Kaltatom-Interferometer): Das Geschwindigkeits-Random-Walk-Prozessrauschen ist das abgeleitete <c9/> des Kaltatom-Beschleunigungsmessers; es läuft durch einen Ausfall von 120 Sekunden auf wenige hundert Meter begrenzt im Auslauf (gegenüber den Kilometern eines freien INS der Navigationsklasse). Dieses UKF mit 17 Zuständen ist nun <b>als lauffähiges Szenario bereitgestellt</b> (<c10/>, <c11/>, erreichbar über CLI/Python/WASM/MCP): Die <b>{ "15" } INS-Fehlerzustände</b> werden um die <b>aus CAI abgeleitete Korrektur des Beschleunigungsmesser-Bias</b> erweitert (das Kaltatom-Interferometer legt den Boden des Geschwindigkeits-Random-Walk <c12/> fest) sowie um eine <b>Uhr mit 2 Zuständen aus Phase + Frequenz</b>, deren Prozessrauschen aus der <b>Uhren-Engine mit q-Parametern</b> stammt (<c13/>, Allan-Profil → <c14/>/<c15/>), angetrieben vom eingegrenzten CAI-Fehlermodell, sodass der Lauf die Hybridisierung aus klassischer IMU im Kurzzeitbereich + Quanten im Langzeitbereich zeigt. Seine Gütegröße ist die <b>Selbstkonsistenz des Filters</b>, nämlich gepoolte <b>NEES + Innovationsweißheit (NIS)</b> über ein Monte-Carlo-Ensemble gegen ihre { "95" }-%-χ²-Bänder (das angepasste Filter liegt innerhalb der Bänder; ein falsch abgestimmtes Filter wird markiert, eine objektiv prüfbare Sperre). <b>Dies ist eine Aussage zur SELBSTKONSISTENZ unter dem modellierten Rauschen, KEINE Genauigkeitsgarantie für die reale Welt</b>: Die CAI-/Uhreneingaben sind eingegrenzt/modelliert, die CAI-Hardware gehört dem Partner, und nichts hier impliziert TRL (Technologiereifegrad)>{ "3" }, Flugerfahrung oder externe Validierung. Das deterministische IMU-Fehlermodell ist <b>pro Sensor aus der TOML-Szenariodatei <c16/> konfigurierbar</b> (Tom's Obvious Minimal Language) (<c17/>: Skalenfaktor, Fehlausrichtung, g-Empfindlichkeit, Quantisierung, Ratenrampe), mit einer reinen Quelle konstanten Bias als Voreinstellung, wenn nichts angegeben ist

# text
# c1: hybrid-ukf
# c2: tests/classical_strapdown_ins_reference.rs
seg-4052714816eb = Eng gekoppelt ist <b>nur über Pseudorange</b> (Trägerphase steht auf der Roadmap); das Szenario <c1/> verwendet eine <b>einzelne, ebene Trajektorie mit konstanter Geschwindigkeit</b>, auf der die Fehlerzustände von Lage und IMU-Bias nur schwach beobachtbar sind, sodass die NEES-Konsistenz über die <b>schätzbare Teilmenge</b> bewertet wird (Position, Geschwindigkeit, Uhr = { "8" } Zustände); die volle Beobachtbarkeit aller 17 Zustände braucht eine manövrierende Trajektorie (Roadmap); das lose gekoppelte Paar aus Beschleunigungs-Bias/Neigung ist nur schwach trennbar, daher wird keine Kalibrierung je Bias behauptet; das IMU-Fehlermodell lässt Vibrationsgleichrichtung und Temperaturgradientendrift aus; das UKF mit 17 Zuständen und die eng gekoppelten Pfade sind <b>selbstvalidiert</b> (analytische Integration bei konstanter Geschwindigkeit, Konvergenz bei GNSS-Stützung, Bias-Rückgewinnung, die CAI-begrenzte Schranke für den Ausfall von 120 s und die χ²-Konsistenzreferenz für NEES/NIS); die <b>Mechanisierung</b> des Strapdown selbst ist gegen NaveGo v1.4 VALIDATED (<c2/>: Lage bitidentisch, Geschwindigkeit/Position innerhalb benannter analytischer Schranken), aber es wurde keine Kreuzvalidierung auf Filterebene (NaveGo oder der Fahrzeugdatensatz KF-GINS) durchgeführt

# text
seg-5d4529365f46 = Trägerphasen-Enge-Kopplung, volle Beobachtbarkeit aller 17 Zustände bei manövrierender Trajektorie, Trajektorienbibliothek, Kreuzvalidierung von NaveGo/KF-GINS auf Filterebene: <b>P2</b>

# text
seg-7d33171c5e26 = <b>Integrität / RAIM / ARAIM</b> (fortgeschrittene autonome Integritätsüberwachung des Empfängers)

# text
# c1: src/raim.rs
# c2: araim_raim
# c3: P_HMI = Σ_k p_fault,k·Q((PL−T_k)/σ_k)
# c4: araim_dual_raim
# c5: P_const = 0
# c6: araim_raim
# c7: IntegritySupportMessage
# c8: integrity
# c9: stanford_svg
# c10: PL=error
# c11: ARAIM_REFERENCE.md
seg-fd0afb948d1f = <b>Echtes Snapshot-RAIM</b> in <c1/>: Lösung nach kleinsten Quadraten + Fehlererkennung über das χ² der Residuen (exakte Schwelle aus einem abhängigkeitsfreien unvollständigen Gamma-χ²) und <b>steigungsbasierte HPL/VPL</b> (pbias aus einem nichtzentralen χ² für das konfigurierte P_fa/P_md); <b>RAIM mit Solution Separation (MHSS)</b> mit Fehlererkennung/-identifikation; <b>ARAIM-Integritätsrisikobudget (P_HMI)</b> (<c2/>), das das kleinste HPL/VPL löst, dessen summiertes <c3/> eine ausdrückliche Zuteilung des Integritätsrisikos einhält, den <b>konstellationsweiten Fehlermodus bei zwei bzw. mehreren Konstellationen</b> (<c4/>, EU-ARAIM-TN (Technische Note) / DO-316; <c5/> ⇒ bitgenau <c6/>), eine ausdrückliche <b>Integritäts-Unterstützungsnachricht</b> (<c7/>: σ_URA/σ_URE/b_nom/P_sat/P_const, mit den Referenzwerten GPS+Galileo der WG-C (WG: Arbeitsgruppe)), dazu ein <b>Stanford(-ESA, die Europäische Weltraumorganisation)-Integritätsdiagramm</b> (die Szenarioart <c8/> und ein eigenständiger Renderer <c9/> der vier Zonen + <c10/>-Grenze). Durchgängig dokumentiert in <a1><c11/></a1>. Dazu die Selbstkonsistenz des Filters (k-σ-Schranke) der Szenario-Gütegröße

# text
# c1: integrity
# c2: integrity_fom
# c3: [integrity]
# c4: raim::snapshot_raim_fde
# c5: raim_fde
# c6: tests/integrity_snapshot_raim_rtklib_oracle.rs
# c7: src/araim_reference.rs
# c8: tests/integrity_araim_stanford_oracle.rs
# c9: raim::araim_raim
# c10: araim_subset_raim
# c11: add_v42_protection_levels_to_order
# c12: araim_dual_raim
# c13: araim_dual
# c14: scenarios/araim-gps-galileo.toml
# c15: araim_dual_constellation_availability
# c16: tests/igs_real_data.rs
# c17: tests/araim_dual_real_data.rs
# c18: xval/araim-m3/
seg-f5fa7c20d28d = RAIM ist über die Szenarioart <c1/> und ({ "0.36" }, optional) neben der Gütegröße für Uhr/holdover als getrennter Block <c2/> erreichbar (<c3/>: Snapshot-RAIM auf einem voreingestellten Himmel von einem angegebenen Standort, nicht verfügbar, solange GNSS verweigert ist; MODELLED), nie in die holdover-Gütegröße eingerechnet, die weiterhin Selbstkonsistenz berichtet; das Snapshot-RAIM trägt <b>FDE</b> für einzelne Satelliten (Fehlererkennung und -ausschluss, <c4/>, VALIDATED gegen RTKLIB <c5/> in <c6/>); die Mehrhypothesen-Solution-Separation nach ARAIM ADD v4.2 mit Teilmengenbestimmung über mehrere Satelliten steht in <c7/> (VALIDATED gegen Stanford MAAST, <c8/>), aber das Budget <c9/> mit einheitlichem Sigma deckt weiterhin nur Einzel-SV- und konstellationsweite Fehler ab und ist nicht ADD-konform ({ "0.36" }, optional: gleichzeitige Fehler von Mehr-SV-Teilmengen über die auf mehr als Paare verallgemeinerte Teilmengenregel von ADD v4.2, <c10/>, <c11/>; MODELLED, kein MAAST-Lauf jenseits von Paaren), und der Ausschluss mehrerer SV ist nicht modelliert; und <c12/> ist über das Flag <c13/> in den TOML-Szenario-Runner eingebunden (<c14/>), mit einem Verfügbarkeitspfad je Epoche <c15/>; die Kerne für Snapshot/MHSS/ARAIM werden auf <b>echter Geometrie präziser IGS-Bahnen (SP3)</b> (<c16/>) und auf <b>echten Celestrak-TLEs für GPS+Galileo</b> (<c17/>, jeder Satellit auf eine gemeinsame UTC-Epoche propagiert, die späteste TLE-Epoche (Zweizeilen-Elementesatz) im Satz, 2026-06-07T07:{ "21" }:{ "04" }) für einen Nutzer mit { "45" }° Neigung in { "400" } km über { "24" } h geprüft: Die Verfügbarkeit unter einem VAL (vertikale Alarmgrenze) von { "12" } m / HAL (horizontale Alarmgrenze) von { "10" } m beträgt { "0.993" } nur mit GPS, { "1.000" } mit GPS+Galileo gepoolt und { "0.990" } im gegen konstellationsweite Fehler robusten Zweimodus; die hier zuvor veröffentlichte Zahl, { "0.21" }→{ "0.67" } mit dem robusten Modus „begrenzt“, stammte aus der Propagation jedes Satelliten ab seiner eigenen TLE-Epoche, einem Himmel, den es nie gab, und ist zurückgezogen); der frühere Vergleich mit „EU-ARAIM-TN Table A-3“ ist zurückgezogen (keine öffentliche Quelle), und eine Reproduktion der öffentlichen Einträge der maximalen URA aus dem EU-US-WG-C-ARAIM-Meilenstein { "3" } (Tabellen { "5" } bis { "7" }, Zeilen Depleted und Baseline) wird in <c18/> unter angegebenen Abweichungen versucht (MODELLED, siehe INTEGRITY.md); nicht DO-229/ARAIM-zertifiziert

# text
# c1: raim
# c2: INTEGRITY.md
seg-9a4aff4fb863 = ARAIM mit mehreren Fehlern (ADD v4.2): <b>erledigt</b>; Teilmengen mehrerer SV in <c1/> + Parität mit gLAB im Empfängerbereich + Anbindung an die Gütegröße: <b>P2</b> (siehe <a1><c2/></a1>)

# text
seg-7244b585a932 = Bedrohungsmodellierung für Spoofing / jamming

# text
# c1: spoof
# c2: src/spoof.rs
# c3: src/detection.rs
# c4: P_fa
# c5: P_md
# c6: 1 − P_md
# c7: jamming
# c8: src/jamming.rs
# c9: Q
# c10: availability_under_jamming
# c11: src/spoof_monitors.rs
# c12: parity_raim_test
# c13: AgcMonitor
# c14: SqmMonitor
# c15: fuse_spoof_layers
# c16: CombinedSpoofDetector
# c17: evaluate
# c18: spoof-detect
# c19: src/spoof_detect.rs
# c20: tests/spoof_texbat_validation.rs
seg-0cf86b61224c = Ein <b>stochastischer Zeit-Spoofing-Detektor</b> (Art <c1/>, <c2/> + <c3/>): vier Einspeiseformen (lineare Rampe, Sprung, meaconing, Replay) gegen einen uhrengestützten Monitor mit einem zweiseitigen <b>χ²₁-Energie- / Neyman-Pearson-Test</b>, wobei die Erkennungsschwelle aus einem Zielbudget für Fehlalarme <c4/> festgelegt wird und die <b>Wahrscheinlichkeit verpasster Erkennung <c5/> sowohl in geschlossener Form als auch per Monte-Carlo berichtet wird</b> (die beiden stimmen auf einige ×1/√N überein); die Sicherheits-Gütegröße ist <c6/>. Dazu ein <b>Jamming-Modell auf Basis des Link-Budgets</b> (Art <c7/>, <c8/>): Verhältnis von Jammer zu Signal aus der Geometrie (Freiraumdämpfung + richtungsabhängiger Empfangsantennengewinn), die übliche <b>Gleichung für das effektive C/N₀ bei Anti-Jam</b> (Entspreizungs-Verarbeitungsgewinn + Faktor der spektralen Trennung <c9/>; Kaplan & Hegarty §{ "9.4" }), Lock-Verlust je Satellit bei einer einstellbaren Tracking-Schwelle und eine Gütegröße <c10/> über eine Walker-Konstellation. Dazu eine <b>mehrschichtige Spoof-Monitor-Suite für HF-/Messungen (HF: Hochfrequenz)</b> (<c11/>): ein <b>RAIM-Konsistenz-Paritätstest über mehrere Satelliten</b> (<c12/>, gewichtete Residuen-SOS (Summe der Quadrate) gegen eine χ²(m−{ "4" })-Schwelle, und er markiert korrekt, dass ein Gleichtaktfehler für RAIM unsichtbar ist), ein <b>AGC-Monitor (automatische Verstärkungsregelung)</b> (<c13/>, Überschuss der Empfangsleistung über den erwarteten Boden), ein <b>Signalqualitäts-/SQM-Monitor (Signalqualitätsüberwachung)</b> (<c14/>, Ungleichgewicht der Early/Late-Korrelatoren) und ein Kombinierer für die Schichtfusion (<c15/>). Diese bilden einen <b>integrierten <c16/></b>, dessen <c17/> eine Epoche von Observablen aufnimmt (Geometrie + Residuen, AGC-Leistung, Early/Late-Abgriffe) und alle drei Schichten in einem Aufruf durch die gewichtete Fusion führt und die Diagnosen je Schicht zurückgibt; er ist als lauffähiges <b>Szenario <c18/></b> bereitgestellt (<c19/>, über CLI / Python / Playground erreichbar, JSON + SVG (Scalable Vector Graphics)) und <b>gegen die veröffentlichten Szenarioparameter von TEXBAT (Texas Spoofing Test Battery) charakterisiert</b> (Humphreys et al., ION (Institute of Navigation) GNSS { "2012" }; <c20/>), wobei das dokumentierte Erkennbarkeitsmuster einschließlich der negativen Ergebnisse reproduziert wird: das überstarke ds2 wird von AGC + SQM erfasst, das leistungsgleiche ds3 von SQM allein, das Positionsschub-ds4 von RAIM, und das trägerphasengleich ausgerichtete, leistungsgleiche ds7 bleibt (korrekt) dem uhrengestützten Detektor überlassen

# text
# c1: jamming
# c2: [crpa]
# c3: src/crpa.rs
# c4: [terrain]
# c5: src/jamming_terrain.rs
# c6: [acquisition]
# c7: [front_end]
# c8: src/jamming_rx.rs
# c9: src/iq/channel/multipath.rs
# c10: src/iq/channel/land_mobile.rs
# c11: src/iq/frontend/agc.rs
# c12: jamming
# c13: Q
# c14: navsignal
# c15: CombinedSpoofDetector
seg-e423ffff332b = Die Art <c1/> ist ein <b>Link-Budget</b>: Sie hat weder Mehrwegeausbreitung noch AGC-Dynamik in der Zeit. Seit { "0.36" } nimmt sie vier optionale Abschnitte entgegen: <c2/>, einen adaptiven Array-Strahl je Kanal (Nullsteuerung oder MVDR aus <c3/>, gegen eine unabhängige numpy-Neuberechnung geprüft; MODELLED), und <c4/>, den Einzelschneiden-Beugungsverlust des Jammerpfads über einer SRTM-Kachel (<c5/>, ITU-R P.526-15 §{ "4.1" }, gegen eine unabhängige numpy-Neuberechnung auf einer echten Kachel geprüft; MODELLED, nur eine Schneide), <c6/>, die Hysterese zwischen Erfassung und Tracking, und <c7/>, die eingeschwungene AGC-Anzeige und den Quantisierungsverlust des ADC bei gaußschem Eingang (<c8/>; für nicht gaußsche Jammer ausdrücklich als ungültig markiert; MODELLED). Spekulare Mehrwegeausbreitung, Land-Mobil-Schwund und AGC gibt es in der IQ-Schicht (<c9/>, <c10/>, <c11/>), und sie sind nicht in die Art <c12/> eingebunden; die Tabelle <c13/> der spektralen Trennung enthält die Lehrbuchwerte je Typ (CW und Schmalband { "1" }, Breitband und gewobbelt { "2" } seit { "0.36" }), <b>festgemacht an den aus den spektralen Leistungsdichten (PSD) abgeleiteten Koeffizienten</b> in <c14/> (siehe die Zeile zum Navigationssignal). Der uhrengestützte Spoof-Detektor ist ein Einzeluhr-Detektor; die HF-/Messungs-Monitore sind nun integriert (<c15/>) und <b>gegen die veröffentlichten <em>Parameter</em> der TEXBAT-Szenarien charakterisiert</b> (Humphreys et al.); der Rest ist die Validierung gegen die <b>rohen</b> Vektoren: TEXBAT-IQ-Abtastwerte (In-Phase/Quadratur), die ein SDR-Frontend (software-definiertes Funkgerät) für Erfassung/Tracking brauchen, das kshana als Simulator, nicht als Empfänger, nicht hat, oder ein lizenziertes Spirent-Szenario, eine dokumentierte Folgearbeit

# text
seg-34e1b6a6b738 = uhrengestützt + integrierter <b>kombinierter Detektor</b> aus Mehr-SV-RAIM-Konsistenz + AGC + SQM + Charakterisierung anhand der TEXBAT-Parameter: <b>erledigt</b>; Validierung gegen Rohvektoren (TEXBAT-IQ / lizenziertes Spirent): Folgearbeit

# text
seg-557448077fb0 = Navigationssignal-Modulation und Leistung der Codeverfolgung

# text
# c1: src/navsignal.rs
# c2: κ = 2/(3R_c)
# c3: κ = ∫ G_s(f)G_i(f) df
# c4: Q
# c5: jamming
# c6: Q = 1/(R_c·κ)
# c7: CodeFamily
# c8: 1/L
# c9: t(n)/L
# c10: φ(2ⁿ−1)/n
# c11: n mod 4 = 0
seg-22893b9a2c7a = <c1/>: die <b>Signalebene</b> zwischen Link-Budget und Messbereich. <b>Spektrale Leistungsdichten</b> mit Einheitsfläche für <b>BPSK-R(n)</b> (binäre Phasenumtastung, rechteckige Chips) und <b>Sinus-BOC(m,n)</b> (binärer Offset-Träger) (in CI auf Einheitsfläche validiert, auf die geschlossene Form <c2/> des Selbst-Koeffizienten der spektralen Trennung (SSC) bei BPSK und auf die BOC-Spektralaufteilung: Nullstelle am Träger, Spitzen bei ±f_s); der <b>Koeffizient der spektralen Trennung</b> <c3/>, der nun das <b>Anti-Jam-<c4/></b>, das <c5/> verwendet, aus den tatsächlichen Signal-/Jammerspektren ableitet (<c6/>), statt einer repräsentativen Konstante (die Breitbandreferenz wird in CI gegengeprüft); die <b>RMS-Bandbreite (Gabor)</b> (BOC > BPSK; das Maß für Entfernungsinformation / Cramér-Rao); das <b>thermische Rauschjitter der kohärenten Early-Late-Codeverfolgung per DLL (Delay-Locked Loop)</b> (Kaplan & Hegarty §{ "8" }, ~unter einem Meter für C/A bei { "45" } dB-Hz, monoton in C/N₀); und die <b>Mehrwege-Fehlerhüllkurve</b> (kohärentes EML (Early-minus-Late), gefunden über die Nullstelle des zusammengesetzten Diskriminators; die Unterdrückung durch den Narrow-Korrelator ist belegt). Eine Schicht für den <b>Entwurfsabgleich von Entfernungscodes</b> (<c7/>) fügt die Nebenmaxima der periodischen Autokorrelation von m-Sequenz/Gold (<c8/> bei einer m-Sequenz) und die dreiwertige <b>Gold-Kreuzkorrelationsschranke <c9/></b> hinzu, die die veröffentlichte Gold-Kreuzkorrelation von <b>GPS C/A −{ "23.9" } dB</b> (ein externer Anker) und die Zahl der m-Sequenzen <c10/> reproduziert, dazu die Umkehrung Codelänge↔eindeutige Entfernung; die Gold-Garantien liefern ehrlich <em>None</em>, wo kein bevorzugtes Paar existiert (<c11/>), statt eine Schranke zu melden, die nicht gilt.

# text
# c1: src/iq/
# c2: kshana iq
# c3: design/GNSS-IQ-PLAN.md
seg-b8950c3fb79f = Seit { "0.31.0" } ergänzt die getrennte <b>IQ-Schicht</b> (<c1/>, die Befehle <c2/>; Entwurf in <a1><c3/></a1>) eine Software-Empfängerkette: FFT-Erfassung (schnelle Fourier-Transformation), eine Tracking-Bank mit mehreren Kanälen aus DLL/PLL/FLL (verzögerungs-, phasen- und frequenzgekoppelte Regelschleife), Frontend-Filterung und Quantisierung auf 1 bis 14 Bit sowie das Streamen aufgezeichneter Datensätze. Ein unabhängiger Software-Empfänger gewinnt die eingespeiste Wahrheit seiner Szenen zurück, und die Codes von GPS L1 C/A sowie die LNAV-Bits (ältere Navigationsnachricht) stimmen bitgenau mit gps-sdr-sim überein. Weiterhin fehlend: Die Schleifendiskriminatoren setzen das ideale BPSK-Korrelationsdreieck voraus, daher gibt es keine Auflösung der BOC-Tracking-Mehrdeutigkeit; die Kanal- und Schleifenmodelle sind MODELLED, gegen geschlossene Formen und eingespeiste Wahrheit geprüft, <b>nicht gegen gemessene Feld-IQ-Daten</b>; nur skalare Schleifen (kein Vektor-Tracking). Der <b>Hardware</b>-Entwurf von Antenne/HF-Nutzlast (Strahlungsdiagramme, Frontend) liegt bewusst außerhalb des Umfangs, das ist die Rolle eines Nutzlastpartners.

# text
seg-a62a0d9aa1d0 = BOC-Mehrdeutigkeit + Validierung der IQ-Schicht mit Feld-IQ: P2+

# text
seg-6b974aba070f = Physik von Quanten-PNT-Sensoren

# text
# c1: src/inertial/quantum_imu.rs
# c2: Φ = k_eff·a·T²
# c3: σ_Φ = 1/(C√N)
# c4: q_va
# c5: |H(ω)|
# c6: coriolis_phase
# c7: 2Ω×v
# c8: ac_stark_phase
# c9: cai_drift_sweep
# c10: QuantumNavBudget
# c11: ½·b·t²
# c12: AccelModel
# c13: QUANTUM.md
seg-3773b241a9e5 = Die meisten Sensoren sind <b>veröffentlichte Allan-/Rauschbudget-Koeffizienten</b> (CSAC, optisch), <b>plus ein Kaltatom-Interferometer-Beschleunigungsmesser (CAI) aus ersten Prinzipien</b> in <c1/>: die Mach-Zehnder-Phase mit drei Pulsen <c2/>, das Quantenprojektionsrauschen (Schrotrauschen) <c3/>, die abgeleitete PSD des Geschwindigkeits-Random-Walk <c4/>, die der Inertialstapel verbraucht, Kontrastabfall, die Vibrationsübertragungsfunktion <c5/> + Varianz bei weißer PSD, und nun die systematischen Fehler durch <b>Coriolis/Rotation</b> (<c6/>, äquivalenter Bias <c7/>) und <b>AC-Stark (AC: Wechselstrom) Lichtverschiebung</b> (<c8/>, symmetrische Auslöschung) sowie ein <b>Drift-Sweep</b> der Zykluszeit (<c9/>) und ein <b>zusammengesetztes Fehlerbudget der quanteninertialen Koppelnavigation</b> (<c10/>), das den weißen Geschwindigkeits-Random-Walk des CAI mit Restbias (<c11/>, gegengeprüft gegen den unabhängigen Euler-Integrator <c12/>), Skalenfaktorfehler und einer optionalen Verschlechterung der <b>Langzeit</b>stabilität (verschieden von der Dekohärenz je Schuss) zu einer einzigen Zahl für die Positionsdrift über den holdover zusammenführt, plus einen inertialen holdover bis zur Schwelle, das Koppelnavigations-Gegenstück zum Uhren-holdover. Der modellierte Quantenboden ist gegen die { "96" } nm/s²/√Hz des mobilen Gravimeters von Freier et al. { "2016" } (arXiv:{ "1512.05660" }) <b>eingegrenzt (nicht paritätsgleich)</b>: Er liegt darunter und innerhalb von ~{ "2" } Größenordnungen davon. Dokumentiert in <a1><c13/></a1>

# text
# c1: max_unambiguous_accel
# c2: dynamic_range_cells
# c3: src/inertial/quantum_imu.rs
seg-3aafb8938d9d = Systematische Fehler durch Wellenfront/Strahlausrichtung nicht modelliert; die <em>Grenze</em> der Mach-Zehnder-Streifenmehrdeutigkeit ist modelliert (<c1/>, <c2/> in <c3/>), die Auflösung der Mehrdeutigkeit aber nicht; die genauen Flugtest-Budgets von CARIOQA-PMP (CARIOQA: Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry) / Boeing-AOSense (sie brauchen veröffentlichte Plattform-PSDs + SNR je Schuss (Signal-Rausch-Verhältnis)) und eine Voreinstellung für den JS-Playground (JavaScript) stehen noch aus

# text
# c1: QUANTUM-MODELS.md
seg-aff11d135951 = Wellenfront-Systematiken + Reproduktion des Flugtests: P2+ (<a1><c1/></a1>)

# text
# c1: src/walker.rs
# c2: tests/igs_real_data.rs
# c3: {planes × sats × inclination}
# c4: constellation-design
# c5: optimize_walker_design
# c6: MinSatellitesForCoverage
# c7: MaxCoverage
# c8: MinWorstPdop
# c9: coverage_half_angle_rad
# c10: street_half_width_rad
seg-59e99de860b2 = Synthetische Walker-Konstellationen (sowohl analytisch Keplersch <b>als auch SGP4 mit mittleren Elementen</b>, Letztere propagiert durch den auf { "4.12" } mm validierten Kern, <c1/>) + Sichtbarkeit und DOP für echte TLEs mehrerer Konstellationen (GPS+Galileo auf { "100" } %), validiert gegen einen <b>echten Celestrak-Snapshot gps-ops</b> (<c2/>); ein <b>PDOP-Entwurfs-Sweep (PDOP: Positions-Dilution-of-Precision)</b> über das Raster <c3/> und Gütegrößen für <b>Abdeckungsanteil / Wiederkehrzeit</b>; die lauffähige <b>Art <c4/></b> (Walker-Delta- und -Star-Muster in der Konvention i: T/P/F, explizite Elementelisten, Mehrschalenentwürfe und veröffentlichte Voreinstellungen, um die Erde, den Mond, den Mars oder jeden anderen katalogisierten Körper), deren Walker-Geometrie und veröffentlichte Slots von GPS, Galileo und GLONASS gegen die veröffentlichten Tabellen VALIDATED sind und deren globale Dilution of Precision der GPS-Basislinie gegen den Leistungsstandard des GPS Standard Positioning Service VALIDATED ist, während die Abdeckungskarten für beliebige Entwürfe MODELLED bleiben; ein <b>gradientenfreier Entwurfsoptimierer</b> (<c5/>), der das Raster nach dem besten Entwurf unter einem gewählten Ziel durchsucht (<c6/> / <c7/> / <c8/>) und nachweislich den Sieger der Brute-Force-Suche liefert; und <b>analytische Streets-of-Coverage-Geometrie</b> (<c9/>, <c10/>; geschlossene Formen nach Rider/Beste, von Hand verifiziert: GPS bei einer Maske von { "5" }°: λ ≈ { "71.2" }°, halbe Streifenbreite bei 4 Satelliten ≈ { "62.8" }°)

# text
# c1: walker::StreetsCoverageDesign
# c2: web/studio/lib/orbit3d.mjs
# c3: --export czml
# c4: tests/dop_reference.rs
# c5: tests/coverage_dop_full_oracle.rs
seg-475e6559da9e = Eine idealisierte Dimensionierung nach <b>Streets-of-Coverage mit minimaler Satellitenzahl</b> existiert (<c1/>); die nahtgenaue Rider-Korrektur an der Grenze gegenläufiger Ebenen ist nicht umgesetzt; der Playground zeichnet eine abhängigkeitsfreie 3-D-Orbitansicht (<c2/>), und ein CZML-Export (Cesium Language), <c3/>, lädt die Geometrie in den CesiumJS-Globus; der DOP-Kern ist gegen gnss_lib_py VALIDATED (<c4/>), und die vollständige Sichtbarkeitspipeline für mehrere Konstellationen ist von Ende zu Ende gegen Orekit { "12.2" } + gnss_lib_py gegengeprüft (<c5/>): Die Erdentwürfe stimmen bei jedem Zielwert überein, aber die Mond- und Marsentwürfe verfehlen den DOP-Zielwert bei numerisch singulärer Geometrie, sodass die Zeile MODELLED bleibt; geodätisches gegenüber geozentrischem „oben“ im DOP-Bezugssystem

# text
seg-3fcc2a2a90ba = Dimensionierung nach Streets-of-Coverage + 3-D-Orbitansicht + Ende-zu-Ende-Gegenprüfung für die Erde: <b>erledigt</b>; nahtgenaue Rider-Korrektur + schlecht konditionierter DOP abseits der Erde: P2

# text
seg-afd5b595ee5e = Verifikation und Validierung

# text
# c1: VERIFICATION-MATRIX.md
# c2: src/verification.rs
seg-9b04e0af2559 = Prüfungen gegen externe unabhängige Referenzen im ganzen Engine (SGP4 gegen { "666" } AIAA-Vektoren, die Allan-Familie gegen Stable32 und allantools, Bezugssysteme gegen SOFA/ERFA, Kraftmodell und Bahnbestimmung gegen Orekit, ARAIM gegen das durchgerechnete Beispiel der WG-C und mehr; die aktuelle Zahl steht in der erzeugten Kopfzeile von <a1><c1/></a1>); deterministische Allan-Prüfungen; eine <b>maschinengeprüfte Verifikationsmatrix</b> (<c2/>), ein Querverweis Anforderung→Modul→Test→unabhängige Referenz→Status, dessen Ehrlichkeitsinvarianten <b>per Einheitentest geprüft</b> sind: Eine Zeile darf nur dann als <em>validiert</em> gekennzeichnet werden, wenn sie eine unabhängige <b>externe</b> Referenz trägt (NIST/AIAA/SOFA/IGS/veröffentlichter Wert), sodass eine interne Selbstkonsistenzprüfung nicht als Validierung durchgehen kann; wird nach Markdown/CSV (kommagetrennte Werte) für einen Verifikations-Querverweis nach ECSS-E-ST-10-02 (ECSS: European Cooperation for Space Standardization) ausgegeben und hält die vier im Besitz des Partners liegenden Lücken bei Hardware/PA (PA: Produktsicherung) als solche fest

# text
# c1: CALIBRATION-ENSEMBLES.md
# c2: tests/verification_rows_name_a_test_that_exists.rs
# c3: tests/verification_rows_cite_evidence_that_exists.rs
# c4: tests/published_figures_still_reproduce.rs
seg-71387f67f6ad = Kalibrierungsensembles decken bisher drei Prüfungen mit einzelnem Startwert ab (<a1><c1/></a1>, vorab festgelegt: Das Monte-Carlo-Bootstrap-Intervall deckt bei { "96" } % von { "200" } Startwerten ab; eine Perzentiltoleranz ist startwertanfällig, NOT MET bei { "91.5" } %); die übrigen Zeilen sind weiterhin auf einzelnen Startwerten kalibriert. Die Matrix erzwingt die <em>Klassifikation</em> der Zeilen, und CI prüft nun außerdem, dass jeder von einer Zeile zitierte Test, jede Datei und jedes Element im Crate existiert (<c2/>, <c3/>) und dass veröffentlichte Zahlen weiterhin reproduzierbar sind (<c4/>); sie bewertet die unabhängige Referenz selbst nicht, die weiterhin ein Prüfer liest

# text
seg-d3b92a831cd9 = Kalibrierungsensembles: P1

# text
seg-f382bb1b5d54 = LEO-PNT (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit)

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-e8ba6003d04e = Sieben Arten, systemunabhängig mit benannten öffentlichen Voreinstellungen: <b><c1/></b> (Signalentwürfe in jedem Band und jeder Struktur: BPSK-, BOC-, MBOC- (gemultiplextes BOC) oder flache OFDM-artige (orthogonales Frequenzmultiplex) Komponenten, Codeverfolgung, Erfassung, GNSS-Kompatibilität, Bandabwägung), <b><c2/></b> (ein entworfener, Element-, TLE- oder Walker-Überflug mit einem Link-Budget je Band: ITU-R (International Telecommunication Union Radiocommunication Sector) Regen, Szintillation und Gebäudeeindringverlust, Ionosphäre, Antenne, Doppler, gegen die sichtbaren GNSS-Satelliten im MEO (mittlerer Erdorbit)), <b><c3/></b> (Broadcast-Ephemeride und -Uhr auf der Keplerschen Basis des Galileo-ICD (Schnittstellenkontrolldokument) oder wählbaren LEO-Modellen, angepasst und kodiert mit einer Rahmenprüfung CRC-24Q (zyklische Redundanzprüfung mit 24 Bit)), <b><c4/></b> (fusionierte Pseudorange- und Doppler-Positionierung mit MEO + LEO über beliebige Konstellationen), <b><c5/></b> (PPP-Konvergenz mit und ohne LEO-Augmentation, auf simulierten Messungen), <b><c6/></b> (Schranken der 5G-NTN-Positionierung, nichtterrestrische Netze, aus der Signalbandbreite) und <b><c7/></b> (ein System von Ende zu Ende, die Ausgabe jeder Stufe wird an die nächste übergeben). VALIDATED sind: die ITU-R-Linkterme gegen die Tabellen und Validierungsbeispiele der Empfehlungen, der maximale Doppler gegen eine veröffentlichte Tabelle, der Galileo-Nutzeralgorithmus gegen RTKLIB auf { "1" } mm, CRC-24Q und die SISRE-Gewichte (Signal-in-Space-Entfernungsfehler)

# text
seg-5f87d4e409d5 = Keine Felddaten oder aufgezeichneten Signale; die Zahlen zu Positionierung, PPP, NTN und Zeitgebung sind MODELLED (geschlossene Formen, Filterkonsistenz, Vergleiche mit veröffentlichten Trends); Voreinstellungen stammen aus öffentlichen Quellen oder sind abgeleitet, keine Betreiberdaten

# text
seg-d29a58fe2c84 = Validierung mit echten aufgezeichneten Signalen: P3

# text
seg-4ea6f7ecc4a7 = Spektrum / HF-Umgebung

# text
# c1: spectrum
# c2: src/spectrum.rs
seg-cdf2b88d50c4 = <b>Art <c1/></b> (<c2/>): das GNSS-L-Band (und Mehrbandentwürfe für Ultrahochfrequenz (UHF), S- und C-Band) als eine spektrale Leistungsdichte, mit der Frequenz quer und der Zeit abwärts, unter einer skriptgesteuerten Jammer-Zeitleiste (Dauerstrich-, Schmalband-, Chirp- und angepasste Breitbandjammer), mit J/S je Band (Verhältnis von Jammer zu Signal) und effektivem C/N₀ (Träger-zu-Rauschdichte); SigMF-Aufzeichnungen hinein und heraus sowie Welch-Spektralschätzungen komplexer Abtastwerte. Die geschlossenen Signalspektren und die Koeffizienten der spektralen Trennung sind VALIDATED; der Wasserfall ist MODELLED

# text
seg-970852c2e2e8 = Signale von GLONASS, BeiDou und Galileo E6 nicht modelliert; keine Validierung des Empfänger-Frontends oder mit aufgezeichneten IQ-Daten (In-Phase/Quadratur)

# text
seg-5402957c3eb5 = Vergleich mit aufgezeichneten Signalen: P3

# text
seg-a5e741fa9d69 = Vertrauen in Empfängerprotokolle (Schiff und allgemein)

# text
# c1: src/receiver_trust/
# c2: $PKSHT
seg-70f0191f1cc7 = <c1/>: Monitore über das eigene Protokoll eines Empfängers (Träger-zu-Rauschdichte, Konsistenz von Position, Geschwindigkeit und Kurs, Zeit) mit Ereignissen und vor dem Lauf festgelegten Vorhersagen; auf einer Schiffsplattform ein Wert von 0 bis 100 mit Begründungen; Live-Modus auf einem Strom mit dem Satz <c2/> und einer optionalen Sperre. MODELLED; beratend, keine typzugelassene Navigationsausrüstung

# text
seg-810132d58fbf = Die Schwellen sind angegebene Standardwerte, nicht gegen Empfänger im Einsatz gemessen; ein Protokoll bewertet nur dieses Protokoll; keine Hochfrequenz-Eingabe oder -Ausgabe; keine typzugelassene Navigationsausrüstung

# text
seg-82017a0ec045 = Nachweispakete und Vertrauens-Telemetrie

# text
# c1: src/evidence/
# c2: src/telemetry/
seg-d141f3da7bfc = <c1/>: ein signiertes, hashverkettetes Paket aus einem Protokollfenster, seiner Konfiguration und dem Ergebnis der Engine, offline prüfbar, mit einem optionalen Zeitstempel-Token nach RFC { "3161" }. <c2/>: der Vertrauensstrom als Prometheus-Metriken, syslog-Ereignisse (CEF oder LEEF) und optional OpenTelemetry, mit einem Beispiel-Dashboard für Grafana

# text
seg-9d2138e7a040 = Ein Paket ist ein technischer Nachweis, kein Rechtsgutachten, und sagt nicht, was ein Ereignis verursacht hat; die Signatur der Zeitstempelstelle wird nicht geprüft; die Telemetrie überträgt nur Telemetrie

# text
seg-744f186bdf09 = Ströme für das Besatzungstraining und Störungskarten

# text
# c1: src/nmea_synth/
# c2: src/interference_map/
seg-a3aee0c6d9f2 = <c1/>: synthetische Brücken-NMEA mit skriptgesteuerten jamming-, Drag-off-, Zeit-Spoofing- und Replay-Ereignissen und einem Ausbilderprotokoll (nur Text). <c2/>: aggregierte Karten beeinträchtigter Navigation aus offen lizenzierten Flugzeug- und Schiffsmeldungen und die Belastung einer Route, aus lokalen Dateien

# text
seg-91174c1a81be = Die Ströme sind Trainingsdaten, nie für die Live-Navigationssysteme eines Schiffes; die Karten sind aggregiert, keine Vorhersage, und hängen von den gelieferten Meldungen ab

# text
# c1: src/interop/testbench.rs
# c2: gnss-ins
# c3: jamming
# c4: gnss-sim
seg-1f8768df4060 = <c1/>: die Fahrzeugbewegung und die Ereignisse eines Szenarios <c2/>, <c3/> oder <c4/> als Bewegungs-CSV, NMEA, Wegpunkttext und Ereignisdateien für einen GNSS-Laborsimulator

# text
seg-e5aa0f32fb2a = Es wird kein Signal geschrieben; es wird keine Leistung eines Simulators oder Empfängers behauptet; die Dateien werden geprüft, wie sie von den Bewegungslesern eines quelloffenen Simulators (gps-sdr-sim) zurückgelesen werden, aber die Physik der eigenen Wahrheitstrajektorie des Szenarios wird nicht extern geprüft

# text
# c1: src/osnma/
# c2: kshana osnma verify
# c3: osnma_verify
seg-57b9e81057b4 = <c1/> und <c2/>: liest Galileo-I/NAV-Seiten oder einen UBX-Strom und meldet je Satellit und Epoche, ob die Navigationsdaten authentifiziert sind (signierter Schlüssel mit Merkle-Wurzel, TESLA-Kette, MACs), mit dem Grund, warum eine Prüfung fehlschlug, und einer optionalen unabhängigen Referenzzeit für die Aktualität; außerdem <c3/> in Python und WebAssembly

# text
seg-0e782e8a2775 = Authentifiziert Daten gegen Schlüssel, die der Nutzer liefert; behauptet keine Leistung gegen Spoofing und ist weder ein Integritätsdienst für die Navigation noch eine typzugelassene Ausrüstung; auf synthetischen Vektoren geprüft, die offiziellen ICD-Testvektoren sind ein externer Download

# text
seg-98d0bc6b40ce = Compliance-Zuordnung zu öffentlichen Rahmenwerken

# text
# c1: src/compliance/
# c2: kshana compliance-report
seg-712affa3fd05 = <c1/> und <c2/>: Kshana-Ausgaben, zugeordnet zu sechs öffentlichen Resilienz-Rahmenwerken und Standards, mit Quellen und einer Lücke in jeder Zeile; ein Lauf zählt nur, wenn sein Ergebnis die Felder trägt, die seine Art schreibt

# text
seg-50652c747b6a = Eine Zuordnung ist ein Urteil; der Bericht sagt, wofür ein Satz von Läufen Belege liefert, nie, dass ein Rahmenwerk erfüllt oder ein Produkt zugelassen ist; EN { "16803" } wird nur aus Katalogtext zitiert

# text
# c1: integrations/
# c2: deploy/
seg-9e0206b8ca6f = Ein Signal-K-Plugin, OpenCPN über NMEA im Gate-Modus per TCP und ein Referenzaufbau für einen kleinen Rechner neben dem Empfänger (<c1/>, <c2/>)

# text
seg-0fbabb37bc88 = Auf aufgezeichneter synthetischer Ausgabe getestet; das Plugin ist nicht auf npm veröffentlicht; beratend, keine typzugelassene Navigationsausrüstung

# text
seg-8281218f1c7c = Weitere Raumfahrtsystembereiche (heute außerhalb des Umfangs)

# text
# c1: partial
seg-b564e0b42adc = Mehrere davon sind <b>none</b>; andere sind inzwischen <b>Modelle erster Ordnung (<c1/>)</b> (die Arten für Missionsanalyse / Umgebung, hinzugefügt in der Serie { "v0.17.0" }); sie sind aufgeführt, damit der Umfang eindeutig ist und nicht durch Schweigen nahegelegt wird. Kshana ist ein PNT-Simulator, nicht GMAT/STK/Orekit (STK: Systems Tool Kit); diese angrenzenden Modelle sind bewusst erster Ordnung und MODELLED, nie validierte Flugwerkzeuge.

# text
seg-8125b00a48e4 = Hinweis / Roadmap

# text
seg-6779cc4a0e99 = Missionsentwurf / Trajektorienoptimierung

# text
# c1: src/maneuver.rs
# c2: maneuver::lambert_multirev
# c3: tests/lambert_multirev_oracle.rs
# c4: maneuver::porkchop_kernel
# c5: tests/porkchop_de440_oracle.rs
# c6: maneuver::optimise_transfer_kernel
# c7: tests/transfer_optimiser_oracle.rs
# c8: src/ephem_provider.rs
# c9: xval/anise-mars-od
seg-3c1a80170fd5 = <c1/>: impulsive ΔV-Knoten mit Kovarianzpropagation { "6" }×{ "6" } (ECI/LVLH (ECI: erdzentriert inertial; LVLH: lokal vertikal, lokal horizontal) Ausführungsfehler-Bezugssysteme), Integration endlicher Brennphasen, gegen die geschlossene <b>Tsiolkovsky</b>-Gleichung auf < { "0.01" } % geprüft, ein <b>Izzo-2015-Lambert</b>-Löser für einen Umlauf + ein exakter <b>Kepler-Propagator</b> in universellen Variablen (Lambert-Ausgaben gegen die Zweikörper-Wahrheit hin und zurück gerechnet) und ein <b>Porkchop</b>-Sweep (Start × Ankunft) für C3 / Ankunfts-V∞, ausgegeben als JSON-Konturraster, dessen Minimum gegen die analytische Hohmann-Untergrenze geprüft wird. <b>Kein Trajektorienoptimierer</b>; ein <b>Lambert</b>-Löser für mehrere Umläufe (<c2/>, bis zu drei Umläufe, beide Zweige) ist gegen pykep { "3.0.1" } VALIDATED (<c3/>); der Porkchop läuft auf dem synthetischen koplanar-kreisförmigen Modell oder, mit <c4/>, auf einem DE440-SPK (VALIDATED gegen SPICE-Zustände + den Lambert von pykep, <c5/>); <c6/> findet das kontinuierliche Datumsoptimum (minimales C3 oder minimales Ankunfts-V∞, Typ I oder II) auf DE440, VALIDATED gegen einen unabhängigen Optimierer aus SPICE + pykep + SciPy (<c7/>); gegen die veröffentlichten Erde-Mars-Minima von NASA/TM-2010-216764 { "2026" } trifft er die Werte des Typs II und verfehlt das minimale C3 des Typs I um −{ "5.18" } % (festgehalten). GMAT selbst wurde nicht ausgeführt; pykep ist die Bibliotheksreferenz. Eine <b>Schnittstelle für Planetenephemeriden</b> im tiefen Raum (<c8/>) und eine <b>Gegenprüfung mit DE440 (Development Ephemeris { "440" })</b> (<c9/>, { "137" } m @ 1-Tages-Marsbogen) existieren nun; siehe die Zeile zu PNT im tiefen Raum / interplanetar. Die Schicht der Leistungssimulation oberhalb von GMAT/Orekit, kein Ersatz. P3

# text
seg-e42e299359d6 = AOCS (Lage- und Bahnregelungssystem) / GNC (Führung, Navigation und Regelung) / Lage

# text
# c1: attitude-budget
# c2: src/attitude_budget.rs
# c3: 1.5·(μ/R³)·ΔI
# c4: src/attitude_dynamics.rs
# c5: tests/attitude_dynamics_basilisk_oracle.rs
# c6: tests/attitude_gg_torque_basilisk_oracle.rs
# c7: src/wahba.rs
# c8: aocs
# c9: src/aocs.rs
# c10: src/aocs_kind.rs
# c11: AOCS.md
# c12: src/aocs_mekf.rs
seg-a1bccf1c2e01 = Art <c1/> (<c2/>): <b>Gravitationsgradientenmoment</b> im ungünstigsten Fall <c3/> + <b>RSS-Budget (Wurzel aus der Summe der Quadrate) des Zeigefehlers</b> über 1σ-Terme je Beitrag, ein MODELLED skalares Zeig-/Störbudget vor der Hardware. Die drehmomentfreie <b>Starrkörper-Lagedynamik</b> mit einem Quaternionenzustand (<c4/>: Eulersche Gleichungen + Quaternionenkinematik, RK4) ist gegen den Raumfahrzeug-Hub von Basilisk { "2.9.1" } VALIDATED (<c5/>, Quaternion auf { "1e-9" } über { "1e4" } s), und die Spitze des Gravitationsgradientenmoments gegen den GravityGradientEffector von Basilisk (<c6/>); die Lagebestimmung nach Wahba steht in <c7/>. <b>Art <c8/></b> (<c9/>, <c10/>, <a1><c11/></a1>): ein Schwenk zur inertialen Ausrichtung mit ausgewogenen Reaktionsrädern unter MRP-Rückführung, Raddrehmomente minimaler Norm mit Motorgrenzen; der geschlossene Regelkreis ist an drei vorab festgelegten Fällen bis auf Rundungsfehler gegen Basilisk { "2.9.1" } <b>VALIDATED</b>. Ein MEKF aus einem Kreisel und einem Sternsensor (<c12/>) kann den Regelkreis auf seiner Schätzung schließen (MODELLED, Filterkonsistenz). Keine Tracking-Führung, keine Integralrückführung, kein Drallmanagement, keine Magnetspulen, keine Triebwerke, keine Radreibung oder Drehzahlgrenzen; kein externes Drehmoment in der Lagedynamik; kein Flugregler. P3

# text
seg-eb137d279247 = Bezugssysteme → erdfest

# text
seg-c45f5e2f4bec = <b>Erledigt</b>: TEME→ECEF/ITRF, Polbewegung und die CIO-basierte Kette GCRS→ITRS sind umgesetzt und VALIDATED (bitgenau gegen SOFA/ERFA; { "4" } mm Ende zu Ende gegen Vallado). Siehe die Zeile <b>Bezugssysteme</b> oben

# text
seg-aa268d6f1635 = Kommunikation und Link-Budgets

# text
# c1: src/linkbudget.rs
# c2: src/timetransfer*.rs
# c3: link-budget
# c4: C/N₀ = EIRP − FSPL − L_other + G/T − k
seg-411d492c4673 = <c1/>: ein <b>Friis-Link-Budget für den tiefen Raum</b> (Sendeleistung · Antennengewinne · Rauschen → C/N₀ · Eb/N₀ · Reserve), das den radiometrischen Pfad/GSE (GSE: Bodenunterstützungsausrüstung) speist, dazu die optischen/HF-Zeitübertragungsstrecken (<c2/>) und die lauffähige <b>Art <c3/></b>: die Einweg-Streckengleichung nach CCSDS-401/DSN-810-005 (DSN: Deep Space Network) <c4/> mit Eingaben für <b>EIRP (äquivalente isotrope Strahlungsleistung) / G-T</b> und Wahl des S-/X-/Ka-Bands (MODELLED technisches Link-Budget, kein kalibriertes Datenblatt eines Terminals). Keine Zugriffsplanung, keine adaptive Kodierung. P2

# text
seg-cd6f9d8d0dc2 = Bodensegment und Betrieb

# text
# c1: passes
# c2: src/passes.rs
# c3: tests/pass_predictor_on_path_orekit_oracle.rs
# c4: passes::predict_passes
# c5: tests/ground_station_pass_prediction_reference.rs
seg-42b2427525e4 = Art <c1/> (<c2/>): <b>Vorhersage von Auf- und Untergangsüberflügen für Bodenstationen</b>: AOS/TCA/LOS (AOS: Signalerfassung; TCA: Zeitpunkt der größten Annäherung; LOS: Signalverlust), maximale Elevation, Dauer je Überflug und Gesamtzugriff über einen Horizont, aus einem SGP4-Elementesatz im erdfesten Bezugssystem IAU 2006/2000A mit Refraktion nach ITU-R P.834-9 und Lichtlaufzeit, <b>VALIDATED gegen Orekit { "13.1.8" }</b> an Stationen auf Meereshöhe ({ "60" } Fälle / { "1210" } Überflüge, <c3/>); das geometrische <c4/> ist gegen den Elevationsdetektor von Orekit { "12.2" } VALIDATED ({ "22" } Szenarien / { "129" } Überflüge, <c5/>); kein Planungsoptimierer und keine Konfliktauflösung. P3

# text
seg-ec6ce48c783e = Telemetrie / TT&C / CCSDS

# text
# c1: oem-interop
# c2: src/oem.rs
# c3: parse_oem
# c4: oem
# c5: src/ccsds_tdm.rs
# c6: space-packet
# c7: src/space_packet.rs
# c8: src/omm.rs
# c9: src/naif_kernel.rs
# c10: ephem_provider::KernelEphemeris
seg-4f1158386205 = maßgeschneiderte Ein-/Ausgabe TOML-in/JSON-out; <b>CCSDS-OEM-Export (Orbit Ephemeris Message) <em>und -Import</em></b> (502.0-B KVN (Schlüsselwort-Wert-Notation), GMAT/Orekit/STK) über die lauffähige <b>Art <c1/></b> (<c2/> Rundlaufbrücke <c3/>; der Austausch eines einzelnen Objekts im vorgegebenen Format ist gegen den unabhängigen Parser <c4/> { "0.4.5" } <b>VALIDATED</b>); <b>Parsen und Ausgeben der CCSDS-TDM-Trackingdatennachricht ({ "503" })</b> (<c5/>, das radiometrische Austauschformat für den tiefen Raum); und die <b>Art <c6/></b> (<c7/>): <b>Kodieren/Dekodieren des Primärheaders von CCSDS 133.0-B Space Packet</b> mit bitgenauem Rundlauf. Ein Schreiber für <b>CCSDS OMM</b> (Orbit Mean-Elements Message, 502.0-B-2, Teil der ODM-Familie) (<c8/>) veröffentlicht mittlere Elemente von SGP4 in KVN, und ein reiner Rust-<b>Leser für NAIF-SPICE-Kernel</b> (<c9/>: DAF-Container, SPK-Typ { "2" }, binärer PCK-Typ { "2" }) trägt <c10/>. Weitere CCSDS-Nachrichtentypen (OPM, OCM, AEM (AEM: Attitude Ephemeris Message)) und das <em>Schreiben</em> von SPICE bleiben ein Roadmap-Punkt (P2)

# text
seg-a3e6c2c5e7df = Interoperabilität und Standards (RINEX/SP3/SPICE/CCSDS)

# text
# c1: Propagator::Sp3Precise
# c2: kshana <orbit.toml> --export-sp3 out.sp3
# c3: export_sp3 = true
# c4: tests/sp3_export_roundtrip.rs
# c5: kshana <orbit.toml> --export-oem out.oem
# c6: export_oem = true
# c7: tests/sp3_export_roundtrip.rs
# c8: pvt
# c9: src/ccsds_tdm.rs
# c10: --export
# c11: src/interop/
# c12: tests/interop_formats.rs
# c13: --import-route
# c14: spectrum
# c15: INTEROP.md
# c16: STANDARDS.md
# c17: oem-interop
# c18: src/omm.rs
# c19: src/naif_kernel.rs
seg-b41f3b5644a8 = RINEX { "3" } <b>Multi-GNSS-NAV</b>: GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) <b>und GLONASS</b> (Zustandsvektor-RK4 in PZ-90 (PZ: Parametry Zemli, das russische geodätische Datum)), eingelesen + propagiert + lauffähig als eine gemischte Konstellation; <b>RINEX-{ "3" }-BEOBACHTUNGSPARSER</b> (Pseudorange/Träger/Doppler/SNR nach Beobachtungscode, mit den Flags LLI/SSI (LLI: Indikator für Lock-Verlust; SSI: Indikator der Signalstärke); { "4.00" } soll sich parsen lassen, ungetestet); <b>Rundlauf Lesen ↔ Schreiben</b> präziser Ephemeriden in SP3-c/d (Parsen + Export für Ginan/RTKLIB/gLAB) <b>und ein Lagrange-Propagator 10. Ordnung (11 Punkte)</b> (<c1/>); der SP3-Export ist <b>über die CLI bereitgestellt</b> (<c2/> oder <c3/>) und <b>per Rundlauf validiert</b> gegen die echte GPS-Konstellation auf <{ "0.5" } m über { "24" } h (<c4/>); der <b>CCSDS-OEM-{ "2.0" }-Ephemeridenschreiber</b>, der geschwindigkeitsführende TEME-Zustandsexport für Flugdynamikwerkzeuge, ist nun <b>über die CLI bereitgestellt</b> (<c5/> oder <c6/>) und per Rundlauf gegen den Zustand des Propagators geprüft (<c7/>). Der <b>RINEX-Beobachtungsparser speist nun eine Einzelpunkt-Positionierungslösung</b> (<c8/>, an echten IGS-Daten validiert, siehe die Zeile GNSS / PNT). Dazu <b>CCSDS-TDM ({ "503" })</b> Parsen + Ausgeben von Trackingdatennachrichten (<c9/>). Geometrie-Exporte für Betrachter und Missionsanalysewerkzeuge: <b>CZML, KML (Keyhole Markup Language), GeoJSON und STK-Ephemeride</b> (<c10/>, <c11/>), jeweils von einem aus der Spezifikation des Formats geschriebenen Validator zurückgelesen (<c12/>), ein GeoJSON-Routenimport (<c13/>), <b>SigMF</b>-Aufzeichnungen (Signal Metadata Format) hinein und heraus für die Art <c14/> sowie Text im Stil von RINEX 4 / CSV für die LEO-Navigationsnachricht (<a1><c15/></a1>, <a2><c16/></a2>). Kein BeiDou-GEO, keine Fixierung ganzzahliger PPP-Mehrdeutigkeiten und kein kinematisches RTK (statisches Float-PPP und Kurzbasislinien-RTK auf echten Daten existieren, siehe die Zeile GNSS / PNT), noch kein SPICE-Schreiber und kein OPM/AEM (der <b>OEM-Leser</b> existiert über die Art <c17/>, der <b>OMM-Schreiber</b> in <c18/> und ein <b>SPICE-SPK/PCK-Leser</b> in <c19/>): <b>P2</b> „angrenzende Bereiche über Standardformate anbinden“

# text
seg-437dbb962136 = Weltraumwetter / Umgebung (Iono/Atmo/Strahlung)

# text
# c1: space-weather
# c2: src/space_weather.rs
# c3: src/ionex.rs
# c4: CODG1330.18I
# c5: tests/geometry_free_tec_gim_oracle.rs
# c6: src/ionex.rs
seg-74ba8b523842 = Art <c1/> (<c2/>): solare/geomagnetische Indizes (<b>Kp↔ap</b> IAGA-Tabelle (International Association of Geomagnetism and Aeronomy) mit 28 Stufen, tägliches Ap, zentrierter 81-Tage-<b>F10.7a</b>), die <b>exosphärische Temperatur nach Jacchia-71</b> und eine <b>aktivitätsgetriebene Kopplung der thermosphärischen Dichte</b> über einer statischen Atmosphäre, MODELLED erster Ordnung, <b>KEIN</b> Modell der absoluten Dichte nach NRLMSISE. Ionosphäre: das Broadcast-Modell nach Klobuchar (VALIDATED gegen RTKLIB) und ein Leser für TEC-Karten (Gesamtelektronengehalt) im Format IONEX (IONosphere map EXchange format) (<c3/>, per Einheitentest geprüft). Eine echte globale Ionosphärenkarte von CODE (<c4/>) ist die gemessene unabhängige Referenz der Zeile zum geometriefreien Schräg-TEC (<c5/>), aber dieser Test wertet die Karte in seinem eigenen Fixture-Generator aus, sodass der Leser <c6/> selbst noch nicht gegen ein echtes Produkt gegengeprüft ist; kein physikbasiertes oder vom Weltraumwetter getriebenes Ionosphärenmodell; P2+

# text
seg-78a2c5a930e8 = Schwerekarten- / Alt-PNT-Navigation

# text
# c1: src/gravimeter.rs
# c2: σ = ASD/√τ
# c3: mapmatch
# c4: particle_filter
# c5: run_gps_denied_gravity_nav
# c6: scenarios/gps-denied-gravity-nav.toml
# c7: src/igrf.rs
# c8: igrf14coeffs.txt
# c9: src/altpnt/terrain.rs
# c10: .hgt
# c11: run_terrain_nav
# c12: run_combined_altpnt
# c13: src/altpnt/sequential.rs
# c14: run_sequential_trn
# c15: particle_filter
# c16: kind=
# c17: gravity-map
# c18: terrain-nav
# c19: combined-altpnt
# c20: terrain-slam
# c21: scenarios/terrain-nav.toml
# c22: scenarios/combined-altpnt.toml
# c23: scenarios/terrain-slam.toml
# c24: gravity-map
# c25: [reference]
# c26: .gfc
# c27: xval/icgem-egm2008/
# c28: [map_error_mc]
# c29: scenarios/gravity-map-error-mc.toml
# c30: combined-altpnt
# c31: [magnetic_grid]
# c32: terrain-nav
# c33: combined-altpnt
# c34: terrain-nav
# c35: combined-altpnt
# c36: xval/srtm-ungate/
# c37: run_sequential_trn_on_map
# c38: xval/terrain-slam-rbpf/
seg-431b3f05c08c = <c1/>: ein <b>Messmodell eines Kaltatom-Gravimeters</b>, dessen Boden des weißen Rauschens aus der ASD des CAI-Beschleunigungsmessers abgeleitet wird (<c2/>), ein <b>voll normiertes Kugelfunktions-Schwereanomaliefeld</b> niedrigen Grades (gegen die geschlossenen Legendre-Funktionen und eine von Hand abgeleitete Ein-Term-Anomalie validiert) plus synthetische <b>Mascons</b> und ein <b>Partikelfilter für den Schwerekartenabgleich</b> (setzt <c3/> + <c4/> zusammen), das aus der durchflogenen Anomaliefolge eine GPS-verweigerte Spur zurückgewinnt. Der <b>GPS-verweigerte 60-Minuten-Vergleichstest</b> (<c5/>, <c6/>) fliegt einen Ausfall von ~{ "700" } km / einer Stunde, in dem die inertiale Lösung auf <b>≈ { "70" } km</b> driftet, und ein <b>hierarchischer Abgleicher von grob nach fein</b> mit dem deterministischen, mit Startwert versehenen weißen Rauschen des Gravimeters gewinnt sie auf <b>≈ { "145" } m (< { "500" } m)</b> zurück, stabil über Rauschrealisierungen und nachweislich verfeinerungsbegrenzt (ein einzelnes grobes Raster bleibt bei ~{ "2" } km stehen). Dazu ein <b>vollständiges geomagnetisches Hauptfeldmodell IGRF-14 (IGRF: International Geomagnetic Reference Field)</b> (<c7/>: das Schmidt-normierte Kugelfunktionsfeld der IAGA bis Grad/Ordnung { "13" }, { "2025.0" } + säkulare Variation, Koeffizienten maschinell aus der offiziellen <c8/> erzeugt; validiert gegen den geschlossenen geneigten Dipol, eine finite Differenz des skalaren Potenzials und den bekannten geomagnetischen Pol/die bekannte Stärke), das Magnetfeld, das eine Plattform für die Navigation über Magnetanomalien abgleichen kann. Dazu <b>geländebezogene Navigation (TERCOM/SITAN (TERCOM: Geländekonturabgleich; SITAN: Sandia Inertial Terrain-Aided Navigation))</b> und der <b>kombinierte Navigator aus Schwere + Magnetik + Gelände</b> (<c9/>): ein selbstgeschriebener Parser für das digitale Höhenmodell (DEM) <c10/> der SRTM (Shuttle Radar Topography Mission) (16 Bit mit Vorzeichen, Big-Endian, zeilenweise, Nordzeile zuerst, Lücke -32768; validiert gegen die Treiberspezifikation GDAL (Geospatial Data Abstraction Library) SRTMHGT (Shuttle Radar Topography Mission height-file format) und eine unabhängige Referenz mit geschlossener bilinearer Mittelpunktform), ein <b>Höhenmesser</b>-Modell für Radar/Baro und ein Abgleicher <c11/>, der aus dem Bodenhöhenprofil gegen das DEM eine GPS-verweigerte Spur zurückgewinnt, und <c12/>, das je Wegpunkt <b>drei skalare Feldkanäle</b> fusioniert (Δg mGal · |B| nT Krustenanomalie · Höhe m), sodass die gemeinsame Posterior schärfer ist (niedrigere CRLB (Cramér-Rao-Untergrenze)) als jedes einzelne Feld, begrenzt auf < { "500" } m über den 60-min-Ausfall und im Erwartungswert nicht schlechter als der beste einzelne Kanal. Dazu <b>sequenzielle (rekursive) geländebezogene Navigation, SITAN als laufendes Filter</b> (<c13/>, <c14/>): dasselbe Messmodell Höhenmesser gegen DEM, <b>Epoche für Epoche</b> durch die SIR-Engine (Sampling Importance Resampling) <c15/> geführt (Vorhersage über das INS-Inkrement + Prozessrauschen → Neugewichtung über den Geländeabgleich → Neuziehung bei Degeneration), sodass eine <b>zeitvariante</b> INS-Drift entlang der Spur <em>verfolgt</em> wird, wo der Batch-Abgleicher nur einen einzigen konstanten Versatz zurückgewinnt; die rekursive Schätzung bleibt begrenzt und konvergiert neu (am Ende ≈ { "70" } m), während die ungestützte Lösung unbegrenzt auf ≈ { "5" } km divergiert, mit einem Fehler je Epoche, der der Eindeutigkeit des Geländes folgt, und einem Gesundheitsmonitor für die effektive Stichprobengröße. Ehrlicher Umfang: Die Karte ist <b>bekannt und fest</b>, eine rekursive <em>Lokalisierung</em> gegen ein gespeichertes DEM (die Lokalisierungshälfte von Gelände-SLAM (simultane Lokalisierung und Kartierung)); die gemeinsame Kartenschätzung ist das getrennte RBPF weiter unten. Alle vier sind nun <b>in die Szenario-Engine eingebunden (<c16/>)</b> (<c17/>, <c18/>, <c19/>, <c20/>) mit einem SVG-Driftdiagramm (<c21/>, <c22/>, <c23/>). <b>{ "0.36" } (WP-10):</b> Der Navigator <c24/> nimmt ein optionales echtes Referenzfeld entgegen (<c25/>: mitgeliefertes EGM2008 bis Grad { "70" } oder eine ICGEM-Datei <c26/>), dessen Anomaliesynthese mit dem ICGEM Calculation Service auf etwa { "1e-8" } mGal übereinstimmt (VALIDATED, <c27/>); auf diesem Feld vom Grad 70 endet der 60-min-Vergleichstest bei { "3106" } m, sodass der Zielwert < { "500" } m NOT MET ist (vorab festgelegt und vorhergesagt: Grad { "70" } ist zu glatt). Ein optionales Monte-Carlo zum Kartenfehler (<c28/>, <c29/>) zeigt, dass der synthetische Fix von { "144" } m eine exakte Karte voraussetzt ({ "1" } von { "20" } Realisierungen innerhalb von { "500" } m unter einem korrelierten Fehler von { "2" } mGal; explorativ). <c30/> nimmt ein optionales krustales Magnetraster EMAG2v3 entgegen (<c31/>; EMAG2 wird abgerufen, nicht eingebunden, und es wird kein Navigationsergebnis darauf behauptet). <c32/> bleibt absichtlich nur auf das DEM beschränkt: Es ist der Einzelkanal-Abgleicher TERCOM/SITAN, und der Magnetabgleich lebt in <c33/>, das Gelände mit den Magnet- und Schwerekanälen fusioniert; ein Magnetkanal in <c34/> würde es duplizieren, sodass der Prüfpunkt „EMAG2 in terrain-nav“ durch die Anbindung von <c35/> abgedeckt ist (RM-16). Die Prüfungen mit echtem SRTM laufen in CI auf zwei eingecheckten Ausschnitten in voller Auflösung (knotengleich mit GDAL { "3.8.4" }, <c36/>). Eine gemeinsame Kartenschätzung existiert (<c37/>, ein RBPF im Stil von FastSLAM): Bei einem einzelnen Durchgang gewinnt es { "1.5" } % gegenüber SITAN mit bekannter Karte auf einer fehlerhaften Karte und verfehlt damit seinen vorab festgelegten Zielwert von { "10" } % (<c38/>). <b>Weiterhin fehlend:</b> ein hochgradiges Schweremodell in einem Navigationslauf (braucht eine neue Vorregistrierung), ein Ergebnis der Magnetnavigation auf einem echten Raster und ein SLAM-Fall mit erneutem Besuch (Schleifenschluss). P3

# text
seg-bf09e5d705a0 = Wiedereintritt / EDL (Eintritt, Abstieg und Landung), Startanalyse, EO/Nutzlast (EO: Erdbeobachtung)

# text
# c1: reentry
# c2: src/reentry.rs
# c3: launch-window
# c4: src/launch.rs
# c5: sin Az = cos i/cos lat
# c6: eo-coverage
# c7: src/eo_payload.rs
seg-6b88cf88c599 = Geometrie erster Ordnung, MODELLED, über drei lauffähige Arten: <b><c1/></b> (<c2/>, ballistischer Korridor nach <b>Allen-Eggers</b>: maximale Verzögerung, Geschwindigkeiten bei maximalem g und maximaler Erwärmung, Höhe bei maximalem g), <b><c3/></b> (<c4/>, <b>Startazimut</b> im Zweikörpermodell <c5/>, Δv für den Ebenenwechsel, Bonus durch die Rotation des Standorts, tägliche Gelegenheiten) und <b><c6/></b> (<c7/>, Raumdreiecksgeometrie nach SMAD (Space Mission Analysis and Design) für EO: <b>Streifenbreite / GSD (Bodenabtastabstand) / Zugriff / Wiederkehr</b>). <b>Keine</b> 6-DoF-Simulation von EDL/Aerothermik, kein Trajektorienoptimierer, keine Sensor-Radiometrie/MTF (MTF: Modulationsübertragungsfunktion). P3

# text
seg-439bd85c8bbc = Lunares / cislunares PNT (LunaNet)

# text
# c1: src/lunar.rs
# c2: mci_to_mcmf
# c3: mcmf_to_mci
# c4: mcmf_to_selenographic
# c5: south_pole_hpl_pass
# c6: src/cr3bp.rs
# c7: cr3bp_jacobian
# c8: propagate_state_stm
# c9: differential_correct_halo
# c10: src/lunar_orientation.rs
# c11: moon_pa_de440
# c12: pxform
# c13: tests/lunar_pa_orientation_spice_oracle.rs
# c14: lunar::mci_to_mcmf
# c15: lunar-integrity
# c16: scenarios/lunanet-araim.toml
seg-a7a12eb111fc = <c1/>: eine <b>lunare ARAIM</b>-Engine, die den erdseitigen MHSS-Kern mit den Parametern von LunaNet LNIS (LunaNet Interoperability Specification) wiederverwendet (σ_URE ≈ { "30" } m, P_sat ≈ { "1e-4" }), die <b>cislunare Bezugssystemreduktion MCI↔MCMF (MCI: mondzentriert inertial; MCMF: mondzentriert, mondfest)</b> (<c2/> / <c3/>, ein vereinfachtes Modell der mittleren Rotation mit siderischer Rate) und <b>selenographische</b> Breite/Länge/Höhe (<c4/>) sowie ein <b>Schutzniveau-Überflug am Südpol</b> (<c5/>), das die Integritätslücke quantifiziert: Bei { "30" } m Entfernungsfehler ist das HPL endlich, übersteigt aber eine Alarmgrenze von { "50" } m für den Betrieb an der Oberfläche. <c6/> ergänzt das <b>CR3BP</b> Erde–Mond (eingeschränktes Dreikörperproblem auf Kreisbahnen) (Dynamik im rotierenden Bezugssystem + RK4-Propagator + Jacobi-Konstante + die fünf Lagrange-Punkte, validiert gegen die veröffentlichten Werte für L1/L2/L3 und die exakten L4/L5), den Dreikörperkern, den eine echte NRHO (nahezu geradlinige Halo-Bahn) braucht, und einen <b>Differenzialkorrektor aus Zustandsübergangsmatrix + Einzelschießverfahren</b> (<c7/>, <c8/>, <c9/>), der echt periodische L2-Halo-/NRHO-Bahnen erzeugt: Die STM ist gegen finite Differenzen validiert, korrigierte Halos schließen sich auf Maschinengenauigkeit (Jacobi-erhaltend), und das Vorgeben des veröffentlichten Apolune-Zustands reproduziert die <b>südliche NRHO L2 { "9" }:{ "2" }</b> (die Bahn des Gateway) bei einer <b>Periode ≈ { "6.57" } d</b> und einem <b>Perilunium ≈ { "3,250" } km</b>, im Einklang mit den veröffentlichten ≈ { "6.56" } d / ≈ { "3,370" } km | Die durch Differenzialkorrektur gewonnenen Anfangsbedingungen (IC) der NRHO sind nun eingebunden, aber die <b>entnormierte selenozentrische (MCI/MCMF) Transformation der korrigierten Bahn</b> und die Familienfortsetzung sind noch Folgearbeiten; die DE440-Hauptachsen-Orientierung des Mondes mit echter physikalischer Libration existiert (<c10/>, aus dem PCK <c11/>, gegen SPICE <c12/> in <c13/> geprüft), aber der ältere Pfad <c14/> verwendet weiterhin die mittlere Rotation ohne Libration oder den präzedierenden Pol; die NRHO ist eine Lösung des CR3BP (kreisförmig, ohne Sonne) und <b>nicht</b> gegen eine echte Ephemeride von LANS/Gateway (LANS: Lunar Augmented Navigation Service) validiert; eine lauffähige Szenarioart <c15/> (<c16/>) stellt den Überflug am Südpol über die CLI bereit | selenozentrische Transformation + Familienfortsetzung + Schnittstelle zu SPICE/LunaNet: <b>P3</b>

# text
seg-e3d975b70014 = PNT im tiefen Raum / interplanetar (Mars, radiometrisch)

# text
# c1: src/radiometric.rs
# c2: src/ccsds_tdm.rs
# c3: src/deepspace_od.rs
# c4: clock_state.rs
# c5: mars_atmos.rs
# c6: src/body.rs
# c7: src/mars_frame.rs
# c8: EphemerisProvider
# c9: src/ephem_provider.rs
# c10: mars-pnt
# c11: src/mars_pnt.rs
# c12: src/gse_sim.rs
# c13: xval/anise-mars-od
# c14: from_shadr
# c15: Body::with_gravity_field
seg-584d79a8ba08 = <b>Ausgeliefert in { "v0.17.0" }.</b> Eine radiometrische Navigations-Engine: iterative Lichtlaufzeit + Shapiro-Verzögerung, Zwei-/Ein-/Dreiweg-Doppler und -Entfernung (Moyer, zwei Teilstrecken), kohärente Transponder-Umkehr, regenerative/PN-Entfernungsmessung (PN: Pseudo-Rauschen) (CCSDS { "414" }), Δ-DOR (CCSDS { "506" }), Medien aus Sonnenplasma/Tropo/Iono (<c1/>); <b>CCSDS-TDM ({ "503" })</b> Parsen + Ausgeben (<c2/>); ein <b>reduziert-dynamisches SRIF</b> (Wurzel-Informationsfilter) mit empirischen RTN-Beschleunigungen (radial, transversal, normal) + einer Bordenuhr mit 3 Zuständen + Mars-Luftwiderstand (<c3/>, <c4/>, <c5/>), das in einem synthetischen geschlossenen Regelkreis eine <b>OD im Mars-LMO (LMO: niedriger Marsorbit) ≈ { "0.2" } m</b> erreicht; Fusion von Ein- und Zweiweg; ein Mehrkörper-Dynamikkern (<c6/>, Mars GMM-3 (GMM: Goddard Mars Model), das IAU-Marsbezugssystem <c7/>, eine Schnittstelle <c8/> <c9/>, zweiteiliges JD + TT↔TDB (TDB: Baryzentrische dynamische Zeit)); und das Relais-PNT-Szenario <b><c10/></b> (areostationäre Konstellation MARCONI, <c11/>) + ein Ende-zu-Ende-Leistungssimulator für GSE (<c12/>). <b>Simulationsvalidiert</b> (Kovarianz-/Regelkreis-Gütegröße); die sonnenzentrische Dynamik ist gegen JPL (Jet Propulsion Laboratory) DE440 gegengeprüft ({ "137" } m @ 1-Tages-Bogen, <c13/>). <b>Fehlend:</b> Validierung mit echten Trackingdaten von DSN/ESTRACK (ESTRACK: European Space Tracking network); Marsgravitation im eigenen Bezugssystem (das Feld GMM-3 Grad/Ordnung { "120" } wird aus der PDS-SHADR-Tabelle geladen, <c14/>, gegen pyshtools VALIDATED, und über <c15/> angebunden, wird aber im IAU-Bezugssystem statt in seinem eigenen Konopliv-2006-Bezugssystem ausgewertet); Ephemeride auf DE-Niveau im Kern (in xval kernelgesteuert). P3

# text
seg-00450a6acae0 = Sonnensystem und PNT um jeden Körper

# text
# c1: solar-system
# c2: tests/solar_system_horizons_reference.rs
# c3: body-pnt
# c4: body-pnt
# c5: Body
# c6: src/gravity_pds.rs
seg-b999b1b54d5d = <b>Art <c1/></b>: Positionen, Geschwindigkeiten und physikalische Konstanten von Sonne, Planeten, Pluto, Mond und sieben großen Monden zu einer Epoche, mit Lichtlaufzeit zwischen Körpern; die Planetenpositionen (JPL-Standish-Elemente) und die Lichtlaufzeit sind gegen JPL Horizons VALIDATED (<c2/>), die Monde, Pluto und die Tabelle der äußeren Planeten bleiben MODELLED. <b>Art <c3/></b>: ein Orbiter oder Lander um jeden katalogisierten Körper (Mars, Mond, Europa, Ganymed, Titan und die übrigen), der auf Einweg-Pseudoranges einer lokalen Walker-Konstellation navigiert, plus optional einer Zweiweg-Entfernung von der Erde, MODELLED. Kein Kernel für Planetenephemeriden im Kern (analytische Elemente), die Relaisbahnen <c4/> verwenden nur J2 (vollständige Felder Mars GMM-3 Grad/Ordnung { "120" } und Mond GRAIL GL0660B Grad/Ordnung { "660" } werden aus PDS-SHADR-Tabellen geladen und für den Propagator an einen <c5/> angehängt, <c6/>). P3

# text
seg-433128dbc8a9 = Kampagnen / Missionskomposition

# text
# c1: campaign
# c2: src/campaign.rs
# c3: tests/campaign_composition_reference.rs
# c4: [optimize]
# c5: tests/campaign_optimize_reference.rs
seg-6102b9f4123a = <b>Art <c1/></b> (<c2/>): bestehende Arten, verkettet auf einer gemeinsamen Zeitleiste (zum Beispiel jamming, dann Spoofing, dann holdover mit einem INS im Auslauf, dann ein Integritätsalarm, dann recovery), Parameter-Sweeps und Monte-Carlo-Ensembles mit Startwerten über jede Art sowie mehrere Szenarien unter gemeinsamen Bedingungen mit einer zusammengefassten Übersicht; jede Zahl wird aus einem echten Lauf der Mitgliedsart gelesen. Kompositionsidentitäten sind getestet (<c3/>: Eine einphasige Kampagne reproduziert den eigenständigen Lauf Byte für Byte); MODELLED. Ein Abschnitt <c4/> (Raster oder begrenztes Nelder-Mead über ein bis drei Schlüssel, eine Metrik, minimieren, maximieren oder ein Ziel treffen) erfüllt seine vorab festgelegten Zielwerte aus geschlossener Form und Brute-Force (<c5/>); MODELLED, eine lokale Suche ohne Aussage über ein globales Optimum, und kein Gradienten- oder Bayes-Verfahren. P3

# text
seg-378c53e44b92 = Berichte, Animation und Ausgaben

# text
# c1: result.json
# c2: report.html
# c3: report.json
# c4: tests/advanced_report_cli.rs
# c5: --animate
# c6: src/animation.rs
# c7: ANIMATION.md
# c8: --export
seg-7bd95909787f = Jeder Lauf schreibt <c1/>, ein Diagramm und einen Bericht (<c2/>, <c3/>), dessen Kennzeichnungen aus der Verifikationsmatrix gelesen werden und dessen festgehaltener Befehl das Ergebnis Byte für Byte reproduziert (<c4/>); <c5/> (svg, html oder Einzelbilder) stellt eine Zeitreihe als Animation dar (<c6/>, <a1><c7/></a1>); <c8/> schreibt die Austauschformate der Interoperabilitätszeile. Dies sind Darstellungen des Laufs, kein Beleg für die Physik.

# text
seg-3c3d3427723f = Ökosystem und Reife (ehrlich verfolgt, keine Fähigkeit des Codes)

# text
seg-5770537524d3 = Bereich

# text
seg-e0426ffe2628 = Anmerkung

# text
seg-bdee8089afb0 = Sprachbindungen und Paketierung

# text
# c1: RunOutput
# c2: array
# c3: columns
# c4: series
# c5: ScenarioKind
# c6: ErrorKind
# c7: KindMeta
# c8: run_typed
# c9: RunOutput
# c10: scenario_kinds
# c11: units
seg-89fd1e232849 = Rust + Python (abi3) + WASM auf drei Registries. Typisierte Oberflächen ({ "0.36" }, CAP-34): Python <c1/> mit NumPy-Zugriffsfunktionen (<c2/>, <c3/>, <c4/>) und mit Stubs typisierten <c5/> / <c6/> / <c7/>; JavaScript <c8/> (ein typisiertes Objekt <c9/>) und <c10/>, mit demselben Vokabular in den TypeScript-Deklarationen. Ergebnisdokumente bleiben JSON je Art, nur durch ihren gemeinsamen Umschlag typisiert (<c11/>, Versionen)

# text
seg-e1dee294d0fe = Bildung / Onboarding-UX (Nutzererfahrung)

# text
# c1: web/studio/lib/guided.mjs
# c2: web/studio/lib/tour.mjs
# c3: web/studio/lib/meaning.mjs
# c4: meaning-kinds.mjs
# c5: GLOSSARY.md
seg-664fb9cb4eb0 = Browser-Playground mit <b>ausgeliefertem geführtem Modus</b>: szenarioadaptive geführte Regler (<c1/>, bis zu sechs Stellgrößen je Szenario) und eine interaktive geführte Tour (<c2/>, aus dem Playground wiederholbar). Jeder Lauf erhält außerdem einen <b>Bedeutungs</b>satz in einfacher Sprache und seine Kernzahlen, aus dem Ergebnisdokument gelesen (<c3/>, mit Vorlagen je Art in <c4/>; eine Art ohne Vorlage erhält ihre erste Kennzahl schlicht benannt). Fehlend: Erläuterungen je Zahl über diesen Satz hinaus (das <a1><c5/></a1> in einfacher Sprache deckt sie ab)

# text
seg-becc4cd71f4c = Gemeinschaft / Governance

# text
# c1: GOVERNANCE.md
# c2: CODE_OF_CONDUCT.md
# c3: CONTRIBUTING.md
# c4: SECURITY.md
# c5: FUNDING.yml
seg-ff4d5fc54722 = Governance-Gerüst vorhanden: <c1/> (Modell des wohlwollenden Maintainers + technische Messlatte + Grenze zwischen offen und geschlossen), <c2/>, <c3/>, <c4/>, Vorlagen für Issues/PR (PR: Pull Request), <c5/>, dependabot. Einzelgründer; eine <b>aktive externe Gemeinschaft</b> (Beitragende, Zitate) ist von Menschen und Zeit abhängig und im Aufbau (Outreach in Prüfung)

# text
seg-5e222a61a61e = Förderung und Beschaffungsreife

# text
seg-fdbb9db68f1d = keine

# text
seg-86709f7f67c0 = TRL ~{ "3" }; noch keine Zitate/Verträge von Agenturen (siehe Strategienotizen)

# text
# c1: src/impairment_eval.rs
# c2: src/quantum_trade.rs
# c3: σ_y²(τ)=q_wf/τ + q_rw·τ/3 + q_drift·τ³/20
# c4: q_from_allan
seg-ee8e0111f4d0 = Ergänzungen des FutureNAV-Demonstrators (modelliert, intern gegengeprüft, <b>nicht</b> extern validiert): ({ "1" }) <b>Testbett für die Bewertung der Erkennung von HF-Beeinträchtigungen mit maschinellem Lernen</b> <c1/>: ein beschrifteter <b>synthetischer</b> Beeinträchtigungskorpus (parametergestützt, nicht IQ) + ein detektorunabhängiges Harness für ROC/AUC/Konfusion/Pfa-Pmd (ROC: Betriebskennlinie des Empfängers; AUC: Fläche unter der Kurve) mit Leckageschutz und geschichteter Aufteilung; die mitgelieferten Detektoren sind transparente Baselines veröffentlichter Verfahren, nicht SOTA (Stand der Technik), und eine hohe AUC zeigt hier die Pipeline, nicht die Leistung im Feld. ({ "2" }) <b>Abwägungs-Engine Quanten- gegen klassisches PNT</b> <c2/>: Einlesen gemessener ADEV (NNLS-Anpassung (nichtnegative kleinste Quadrate) von <c3/>, per Rundlauf gegen <c4/> geprüft), eine Nutzentabelle für timing-/inertialen holdover, die den Vorbehalt der Annahme zum Boden am Artefakt trägt, und eine Hüllkurve der GNSS-verweigerten Resilienz über der Zeit; sie <b>quantifiziert</b> den Quantennutzen eines Partners und validiert nie das Gerät. Beide wurden gegnerisch geprüft (ein Fehler in der Driftbasis τ²→τ³ und eine falsche Aussage zur Resilienz „unbegrenzt beschränkt“ wurden gefunden und behoben). { "911" } Bibliothekstests zum Zeitpunkt dieser Ergänzung, fmt+clippy sauber.

# text
# c1: src/interchange.rs
# c2: Envelope
# c3: format
# c4: SCHEMA_VERSION
# c5: engine_version
# c6: compatibility()
# c7: Envelope::parse
# c8: wrap
# c9: to_json
# c10: parse
# c11: payload_as::<T>()
# c12: Deserialize
# c13: SCHEMA.md
seg-deb7124d3c70 = Ergänzung zu Austausch- / Standardformat (<c1/>): das <b>Kshana Interchange Format (KIF)</b>, ein neutraler, versionierter, selbstbeschreibender <c2/>, der jedes Artefakt (Szenario, Ergebnis, Trade-Study) mit einem erkennbaren Tag <c3/> umhüllt, die einzige Quelle der Wahrheit <c4/> (die Schemaversion, früher als Literal an { "15" } Stellen kopiert, liegt nun in einer einzigen Konstante, auf die das ganze Crate verweist), die erzeugende <c5/> und einen ausdrücklichen, getesteten Kompatibilitätsvertrag (<c6/>: gleiche Hauptversion / gleiche oder ältere Nebenversion ist unter der Disziplin additiver Felder lesbar; eine neuere Nebenversion oder eine andere Hauptversion wird an der Grenze von <c7/> zurückgewiesen, statt stillschweigend falsch geparst zu werden). Rundlauffähig (<c8/>→<c9/>→<c10/>→<c11/>) für jede Nutzlast <c12/>; bewusst <b>ohne Zeitstempel</b>, um die bitgenaue Reproduzierbarkeit von Kshana zu wahren. Dokumentiert in <a1><c13/></a1>, damit das Format <b>zitierbar</b> ist und nicht nur ausgegeben wird, die Positionierung des Open Core als „Standard im Wartestand“. { "923" } Bibliothekstests zum Zeitpunkt dieser Ergänzung, fmt+clippy sauber.

# text
# c1: src/frugal.rs
# c2: walker
# c3: src/integrity_impact.rs
# c4: classify_stanford
# c5: src/verification.rs
# c6: VERIFICATION-MATRIX.md
# c7: src/impairment_eval.rs
# c8: stratified_split
# c9: Split::has_leakage
seg-adc959257e0b = Ergänzungen des FutureNAV-Dominanz-Builds (modelliert, intern gegengeprüft, <b>nicht</b> extern validiert): ({ "1" }) <b>Sparsame Schicht für Kosten je Abdeckung / ROI (Kapitalrendite)</b> <c1/>: eine Schicht zur Darstellung des Nutzens über der Engine zur Konstellationsdimensionierung (<c2/>), die Kosten je Prozentpunkt Abdeckung und ROI als Abdeckung je Euro gegenüber einer Basislinie berichtet; die Kosten je Satellit sind eine <b>vom Aufrufer gelieferte, mit Quellen belegte Spanne niedrig/nominal/hoch</b> (keine erfundenen Punktpreise), sodass die Ausgaben Spannen sind, keine scheinbar genauen Punkte; eine modellierte wirtschaftliche Einordnung einer modellierten Abdeckungszahl, kein Angebot. ({ "2" }) <b>Abbildung der Integritätsfolgen verpasster Erkennung</b> <c3/>: bildet einen unerkannten, durch Spoofing/jamming verursachten Positionsfehler auf seinen effektiven Fehler → Stanford-Region ab (verfügbar / System nicht verfügbar / irreführend / gefährlich irreführend), gegen <b>kontextspezifische Alarmgrenzen</b> (offener Himmel gegenüber Stadt, HAL gegenüber VAL), und setzt dabei das extern verankerte RAIM-<c4/> ein; die Brücke von verpasster Erkennung zu Alarmgrenze ist modelliert, keine zertifizierte Integritätszuteilung. Beide sind in die maschinengeprüfte Verifikationsmatrix eingeordnet (<c5/>, Invariante Validated⇒ExternalDataset unverletzt; die aktuelle Zeilenzahl steht in der erzeugten Kopfzeile von <a1><c6/></a1>). Die Kreuzvalidierung / der Leckageschutz / die parametergeschichtete Aufteilung für das Harness zur KI-Bewertung wurde bereits in <c7/> ausgeliefert (<c8/>, <c9/>). { "951" } Bibliothekstests zum Zeitpunkt dieser Ergänzung, fmt+clippy sauber.

# text
# c1: src/impairment_ml.rs
# c2: ImpairmentDetector
# c3: src/eval_stats.rs
# c4: src/impairment_study.rs
# c5: (detector,class)
# c6: cargo run --release --example optimism_study
# c7: src/verification.rs
seg-f744a0c03b2c = Ergänzungen der FutureNAV-Studie zur Optimismuslücke (modelliert, intern gegen geschlossene Formen gegengeprüft, <b>nicht</b> extern validiert, <b>keine</b> Aussage von der Simulation zum Feld): eine kontrollierte <b>synthetische</b> Studie der <b>Optimismuslücke</b> der AUC von innerhalb der Verteilung zu außerhalb der Verteilung für Detektoren von HF-Beeinträchtigungen. ({ "1" }) <b>Gelernte Detektoren</b> <c1/>: eine feste Merkmalsabbildung + ein auf dem Training angepasster Standardisierer, eine Baseline mit logistischer Regression (deterministischer Gradientenabstieg über den ganzen Batch) und ein <b>MLP</b> mit einer verdeckten Schicht (Multilayer-Perzeptron; Backprop-SGD mit Startwert (stochastischer Gradientenabstieg)) hinter demselben Trait <c2/>, den die Baselines veröffentlichter Verfahren verwenden. ({ "2" }) <b>Von Hand abgeleitete Statistiken</b> <c3/>: Perzentil-Bootstrap-Konfidenzintervalle (KI), <b>DeLong</b>-Varianz/KI der AUC, <b>Spearman</b>-ρ und <b>Ridge</b>-Regression, jeweils gegen eine geschlossene Form geprüft (binormale AUC Φ(d′/√{ "2" }), eine von Hand gerechnete DeLong-Varianz, ein Lehrbuch-ρ mit Rangbindungen, exakte Wiedergewinnung per OLS (gewöhnliche kleinste Quadrate)). ({ "3" }) <b>Die Studie</b> <c4/>: AUC je Klasse, der Skalengesetz-Trend je <c5/> (Lücke gegenüber { "1" }−Schweregrad) und ein <b>Ridge-Prädiktor der Lücke nur aus der Verteilung</b>, der die Optimismuslücke allein aus Diagnosen innerhalb der Verteilung schätzt, bewertet mit <b>Leave-one-detector-out</b> und <b>Leave-one-class-out</b> gegen eine Baseline, die den Mittelwert vorhersagt. Artefakt mit einem Befehl über <c6/>. Jede Zahl ist eine AUC über modellabgeleitete Labels auf einem synthetischen, parametergestützten Korpus; die Lücke ist eine Verschiebung des Schweregrads von synthetisch zu synthetisch, nie ein Ergebnis einer Detektion im Feld. In die maschinengeprüfte Verifikationsmatrix eingeordnet (<c7/>, Invariante Validated⇒ExternalDataset unverletzt).

# text
seg-441b67566d5a = <s1>Zurück</s1>Reproduzierbarkeit

# text
seg-861984989d07 = <s1>Weiter</s1>Standards und Interoperabilität

# text
# c1: pvt
# c2: rtk_real::run_rtk
# c3: src/lambda.rs
# c4: tests/rtk_real_wettzell_oracle.rs
# c5: tests/ppp_real_wettzell_oracle.rs
# c6: leo-ppp
# c7: gnss-sim
seg-cc7dc902c8f5 = Eine <b>Code</b>-Positionierungs-Engine plus, ab { "0.36" }, Trägerphasenverarbeitung auf echten Beobachtungen: Der Löser <c1/> berechnet aus echten Codemessungen eine echte Position (Einzelpunktpositionierung, Meterniveau, mit der ionosphärenfreien Zweifrequenz-Kombination); <c2/> führt Kurzbasislinien-RTK auf echtem Zweifrequenz-GPS-Code und -Phase aus (doppelte Differenzen, ein Float-Kalman-Filter, ganzzahlige Mehrdeutigkeitsfixierung mit LAMBDA samt Ratio-Test, <c3/>), und ein statisches Float-PPP-Filter läuft auf echtem Code und echter Phase mit finalen IGS-Bahnen und -Uhren. Beide sind VALIDATED gegen veröffentlichte ITRF2020-Koordinaten von IGS-Stationen (WTZR/WTZZ, <c4/>, <c5/>, Zielwerte vorab festgelegt); es fehlen weiterhin die ganzzahlige Mehrdeutigkeitsfixierung bei PPP, kinematisches oder Netzwerk-RTK und der Echtzeitbetrieb. Die Hatch-Trägerglättung ist ein festgeschriebener Befund, der MODELLED ist (ihre vorregistrierten Zielwerte wurden verfehlt). Die Art <c6/> führt ein Float-PPP-Filter auf selbst simulierten Messungen aus, für Konvergenzstudien; das Vorwärts-Paket <c7/> bleibt ein Simulator aus der Wahrheit; BeiDou-GEO (GEO: geostationäre Umlaufbahn) ausgeschlossen

seg-982b83588ec1 = Aktualisiert am 2026-10-28 für Engine { $version } ({ "92" } Szenarioarten, aus <c1/>; neu in { $version }: <c2/>, <c3/>, <c4/>, <c5/> und <c6/>). 2026-10-22: Engine { "0.39.0" }, { "87" } Arten, keine neue Art. 2026-10-19: Engine { "0.38.0" }, { "87" } Arten (neu in { "0.38.0" }: <c7/>, <c8/> und <c9/>). 2026-10-18: { "84" } Arten (neu in { "0.37" }: <c10/>). 2026-10-16: { "83" } Arten (neu in { "0.36" }: <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/> und <c18/>). 2026-10-10: Engine { "0.35.0" }, { "75" } Arten, keine neue Art. 2026-10-09 und 2026-10-08: frühere Überarbeitungen. 2026-10-04: Die Zeile Navigationssignal vermerkt die IQ-Schicht { "0.31.0" }. 2026-09-29: Zeilen zu LEO-PNT, Spektrum, Sonnensystem / PNT um jeden Körper, Kampagne und Ausgaben hinzugefügt. Früher: abgeglichen mit der Fähigkeitsmatrix mit 27 Zeilen des großen Audits vom 2026-06-02; Zeile zu PNT im tiefen Raum / Mars in { "v0.17.0" } hinzugefügt. Ergänzungen zu Quanten-PNT (GNSS-verweigerter Uhren-holdover <c19/>, zusammengesetztes Fehlerbudget der quanteninertialen Koppelnavigation <c20/>, Entwurfsabgleich von Entfernungscodes <c21/>, maschinengeprüfte Verifikationsmatrix <c22/>) wurden in die Zeilen Zeitgebung, Quanten-PNT-Sensor, Navigationssignal und V&V eingearbeitet, jeweils entweder als validiert oder als modelliert gekennzeichnet, je nach ihrer tatsächlichen unabhängigen Referenz.
