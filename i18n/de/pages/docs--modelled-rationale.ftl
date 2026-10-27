# docs--modelled-rationale: translations (de)

# text
seg-2db69c58f694 = Lunares differenzielles PNT

# text
seg-1ff1d8ebf1e7 = Compliance-Zuordnung zu öffentlichen Rahmenwerken

# text
seg-aab745a65e76 = Modul

# text
seg-d6476863f862 = Fähigkeit

# text
seg-60a43431ebe0 = Anforderung

# text
seg-bde1b3a94a47 = SRP-Schatten mit Randverdunkelung der Sonne (optional)

# text
seg-eaaec545dd68 = SRP-Beleuchtungsanteil als nicht verdeckter Anteil des randverdunkelten Sonnenflusses (Gesetz der Eddington-Näherung I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauß-Legendre-Quadratur) über einer kugelförmigen oder WGS-84-Erde (srp_shadow::limb_darkened_shadow, die Variante ShadowModel OblateEarthLimbDarkened)

# text
seg-9e15970435c3 = Sonne und Mond aus DE440 im Cowell-Kraftmodell (optional)

# text
seg-de6831cf7785 = Optionale Ephemeridenstufe für die Terme der Gravitation dritter Körper und des SRP im numerischen Cowell-ForceModel: die geozentrische Sonne und der Mond aus jedem EphemerisProvider (ein DE440-SPK-Kernel über KernelEphemeris) bei TDB = TT + (TDB - TT), wobei ein Provider, der die Epoche nicht bedienen kann, zurückgewiesen und jeder Rückfall auf die analytische Reihe gezählt wird; standardmäßig aus

# text
seg-057c21daf4f2 = Atmosphärische Gezeit S1 (optional)

# text
seg-f600a39f297e = Die tägliche Luftdruckgezeit S1 als Störung des Geopotenzials: Biancale und Bode ({ "2006" }) Modell N1, Grad { "2" } bis { "6" }, über die Lastformel Gl. { "6.21" } aus IERS { "2010" } (tides::atmospheric_tide_s1, s1_air_tide_acceleration), optional in den Cowell- und Präzisions-Kraftmodellen (air_tide_s1, standardmäßig aus)

# text
seg-e8f5ff8c9149 = Sphärisch-harmonische Gravitation hohen Grades (EGM2008 bis { "2190" })

# text
seg-d3b2f32dcecb = Unterlauf- und polsichere Auswertung eines vollständig normierten Feldes bis Grad { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, modifizierte Vorwärtsspalte nach Holmes-Featherstone { "2002" } mit einem Gradienten ohne 1/cos phi), ein streamender ICGEM-.gfc-Lader (from_gfc_file / from_gfc_reader; das vollständige EGM2008 wird zur Laufzeit geladen, nicht mitgeliefert) und der Holmes-Featherstone-Auswerter, der für das optionale Cowell-Geopotential wählbar ist

# text
seg-1960804ef2f4 = Bahnbestimmung im Batch-Verfahren aus Entfernungsraten und Az/El mit Stationsmaskierung

# text
seg-4c185244bc66 = Rekonstruktion eines Epochenzustands aus gemischter Entfernungs-, Entfernungsraten- und Azimut/Elevations-Verfolgung oberhalb einer Elevationsmaske durch Gauss-Newton auf H = (dh/dx(t)) Phi(t, t0): analytische Messpartiale und eine variationelle Zustandsübergangsmatrix mit analytischen Zweikörper- + J2-Partialen (RK4-integriert, keine geschlossene STM)

# text
seg-bc3d1ee7c639 = Beobachtungsgewichtung nach SP3-Genauigkeitscode

# text
seg-63b1fab84f85 = SP3-Genauigkeitscodes (Header-++-Exponenten in { "2" }^n mm, die %f-Basis, Standardabweichungen je Datensatz Basis^n mm) auf Positionssigmas je Beobachtung für die Maschine zur präzisen Bahnbestimmung abbilden (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ae3e8833a5ef = Ein veröffentlichtes Gravitationsfeld an einen Körper anhängen

# text
seg-ffb2b20e5f32 = with_gravity_field (auf Body, in src/gravity_pds.rs): hängt jedes geladene sphärisch-harmonische Feld (zum Beispiel GMM-3 oder GL0660B) an einen Body an, sodass der Propagator es körperfest auswertet; optional, Standardkörper unverändert

# text
seg-9762cf428435 = Navigationsnachrichten-Encoder jenseits von GPS LNAV (GPS CNAV, Galileo I/NAV und F/NAV)

# text
seg-9b703b9607d8 = GPS-CNAV-Nachrichtentypen 10/11/30, Galileo-I/NAV-Worttypen 1-5 in nominellen geraden/ungeraden Seiten und Galileo-F/NAV-Seitentypen 1-4: ICD-Feldpackung und Quantisierung, CRC-24Q, Faltungscodierung der Rate 1/2 mit K={ "7" } (G2 invertiert bei Galileo), Blockverschachtelung und Synchronisationsmuster, mit passenden Test-Decodern

# text
seg-974d8c1f7876 = Hatch-Trägerglättung des Codes auf echten RINEX-Beobachtungen

# text
seg-f26b5da0f52e = Divergenzfreies Hatch-Filter (ionosphärenfreier Code, getragen von der ionosphärenfreien Trägerphase, Fenster N Epochen, Neustart bei Lock-Verlust, Sprung der geometriefreien Kombination oder Lücke) in der Anordnung der präzisen Einzelpunktpositionierung

# text
seg-278ca396127a = Lesen von RINEX-{ "4" }-Beobachtungsdateien

# text
seg-e0883aa933eb = RINEX-4.0x-Beobachtungs-Header (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; Labels in den Spalten 61-80 ab Version { "4" } erkannt) und Epochendatensätze

# text
seg-33e5c74720ff = BeiDou-GEO-Satellitenposition aus Broadcast

# text
seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } Position eines geostationären Satelliten aus einer Broadcast-Ephemeride (inertialähnliches Bezugssystem, dann Rz(Ω̇e·tk)·Rx(−{ "5" }°)), optional über das Feld include_beidou_geo von NavParseOptions, sodass der Standard-Leser GEOs weiterhin überspringt

# text
seg-71f48628ebb2 = Trägerphasen-eng gekoppeltes GNSS/INS mit Float-Mehrdeutigkeiten

# text
seg-5a156aa81275 = Fehlerzustands-EKF über { "15" } INS-Zustände, eine Empfängeruhr mit zwei Zuständen und eine Float-Trägermehrdeutigkeit je verfolgtem Satelliten; Pseudostrecke, Trägerphase und optional Entfernungsrate aus einer SGP4-Walker-Konstellation (Lichtlaufzeit und Sagnac), Klobuchar- und Saastamoinen/Niell-Korrekturen, in der Schleife an der eigenen Position des Filters angewendet; Sprungerkennung per zeitdifferenzierter Trägerphase mit einer je Satellit durch die Geschwindigkeitsunsicherheit verbreiterten Schwelle; Re-Initialisierung der Mehrdeutigkeit bei Sprüngen und Wiedererfassung

# text
seg-7d644516b1ec = GNSS/INS-Pakete für Schifffahrt, Bahn und Luftfahrt mit einer Option zur engen Kopplung

# text
seg-cbb03a8baf73 = Drei gnss-ins-Szenarien auf der Trajektorienbibliothek (ein Schiff, das mit { "8" } m/s schlingert, mit einem Ausfall von fünf Minuten; ein Zug durch einen Einschnitt mit zwei Satelliten und einen Tunnel; ein Flugzeug, dessen Ausfall eine Kurve mit 25 Grad Querneigung umfasst) und die optionale [tight]-Tabelle des Pakets: Pseudostrecken aus einer SGP4-Walker-Konstellation, vom Navigator mit geschlossener Schleife fusioniert, jeder Satellit über der Maske im Nominalfall und die höchsten wenigen im degradierten Fall

# text
seg-f4dab73c4eda = Gekoppeltes Pseudostrecken-PNT-Filter mit Bias-Zustand und 3D-Erweiterung im Fusionspaket

# text
seg-742b60089361 = Ein gestapeltes Kalman-Filter über Position, Geschwindigkeit, Uhrphase und Frequenz, gespeist mit Pseudostrecken, die Position und Uhr koppeln (Updates in Joseph-Form, die die Kreuzkovarianz mitführen); eine 1-DOF-Variante, erweitert um einen konstanten Beschleunigungsmesser-Bias-Zustand, die das Fusionspaket unter [coupled] ausführt; und die 3D-Version mit 8 Zuständen und Sichtlinienzeilen

# text
seg-2db2b9dc3b45 = GNSS/INS-Trajektorienbibliothek und CSV-Wahrheitsimport

# text
seg-e1fe83c75a6c = Wählbare Bewegungsprofile für das gnss-ins-Paket (geradeaus, Figur-8, städtisches Stop-and-go, Flugzeugsteigflug und koordinierte Kurve, Vermessungsdrohne), definiert durch Euler-Raten- und Längsbeschleunigungs-Kommandos, geschlossen auf den Wahrheitszustand mit der kinematischen IMU (Zentripetal-, Gravitations- und Coriolis-Terme), und importierte CSV-Wahrheit, in die IMU umgesetzt, die sie reproduziert; die historische Fahrt unverändert, wenn kein Profil angegeben ist

# text
seg-86f9186bb884 = Erde-Mond-CR3BP-{ "9" }:{ "2" }-NRHO gegen die von CAPSTONE geflogene Bahn

# text
seg-d4127cf241f3 = Die kreisförmig eingeschränkte südliche nahezu geradlinige Halo-Bahn (NRHO) mit L2 und { "9" }:{ "2" }, die cr3bp::differential_correct_halo korrigiert (die Bahnfamilie von Gateway und CAPSTONE), verglichen für ihre mittlere Geometrie (Periode, Perilunradius, Apolunradius) mit der Bahn, die CAPSTONE tatsächlich geflogen ist. Eine Messung dafür, wie gut das CR3BP-Mitglied die reale Bahn beschreibt; eine CR3BP-Bahn ist keine Bahn eines Ephemeridenmodells und wird nicht Epoche für Epoche verglichen

# text
seg-1a5623c81b48 = Positionsfehler aus der Geometrie: RMS-Fehler = sigma_UERE x DOP für die Kleinste-Quadrate-Lösung der Engine

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry und check: eine gesetzte Monte-Carlo-Simulation (N = { "20,000" } Epochen je Geometrie, sigma = { "1.5" } m, ChaCha8-Seed { "36" } + i) der eigenen iterierten Kleinste-Quadrate-Lösung der Engine (pvt::solve_spp, Einheitsgewichte, von der wahren Position aus gelöst) auf den { "8" } Geometrien aus tests/fixtures/dop/dop_reference.csv, die die Fehlervarianzen in Ost, Nord, Höhe und Uhr, den H/V/P-RMS, die Ost-Nord-Korrelation, die mittleren Fehler und den Anteil innerhalb der { "95" }-%-Horizontalellipse mit sigma^{ "2" } Q vergleicht, wobei Q der Kovarianzfaktor des Kerns orbit::dop ist (orbit::dop_cofactor, dieselbe Arithmetik) auf derselben Geometrie

# text
seg-9acfde1b57f7 = Geometriebewusste Vertrauensklassifikation: Satellitengeometrie neben dem Vertrauenswert des Empfängers und eine Klasse für jeden Abzug

# text
seg-6138c41e13ff = receiver_trust::geometry: Satellitengeometrie je Epoche (gut, degradiert mit den Gründen few-satellites/high-pdop/high-hdop/sky-blocked, oder unbekannt, wenn das Log kein GSV, NAV-SAT oder GSA liefert), abgeleitet aus den gemeldeten Elevationen und Azimuten über orbit::dop oder aus GSA übernommen, mit einem Label, das stets gemeldet und nie bewertet wird (good, fair, poor, unknown) und mit HDOP, PDOP, VDOP, Satellitenzahl und Signalverlust in Worten; ein Geometrie-Monitor des Schiffswerts, der nichts abzieht, sofern die Geometrie nicht schlecht ist (Verhältnis max(hdop/4, pdop/6, 5/n_used) über { "1" }), dann bis zu einer Obergrenze von { "15" } Punkten bei { "1.5" } ansteigt, die die Geometrie allein nicht unter das degradierte Band drücken kann (Obergrenze, Ende der Rampe und Untergrenze in [geometry]; kein Alarm); eine Klasse für jeden Abzug (geometry, environment, inconsistency), wobei Lock-Verlust bei Satelliten unter { "15" } Grad als geometry klassifiziert wird, Satelliten in Sicht, aber nicht verfolgt, als environment, und ein Abzug wegen schlechter Geometrie, dessen angegebener HDOP jenseits von max({ "1.0" }, { "25" } % des abgeleiteten HDOP) vom angegebenen Himmel liegt, als inconsistency

# text
seg-e4ec41d0f5e1 = Absolute Beobachtbarkeit der Mondstationen (Datumsdefekt)

# text
seg-b3e4160042d2 = Fisher-Information-Beobachtbarkeit der gemeinsamen Mondlösung: Ohne Erdbasislinien liegt das Datum des absoluten Bezugssystems im Nullraum von HᵀWH (Stationsposition nicht beobachtbar); ≥{ "3" } Basislinien stellen den vollen Rang wieder her und begrenzen den Cramér–Rao-Fehler der Station, den der Schätzer erreicht

# text
seg-2ed7181c97dd = Erzeugung der LunaNet-AFS-Spreizcodes (LSIS V1.0)

# text
seg-13ff6c381275 = Die Augmented-Forward-Signal-Codes von LSIS V1.0 ({ "29" }. Januar { "2025" }): der AFS-Q-Primärcode mit 10230 Chips, erzeugt aus der IS-GPS-800-L1C-Pilotkonstruktion mit den IS-GPS-800J-Indizes (dieselben { "210" } Zuweisungen, die LSIS Anhang D druckt), die AFS-I-Gold-Codes mit 2046 Chips, erzeugt aus g1 = x^{ "11" } + x^{ "2" } + { "1" } und g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, wobei die G2-Verzögerung jeder PRN aus der Annex-{ "3" }-Datei des Standards gewonnen wird, die vier Sekundärcodes, die Tertiärcodes mit 1500 Chips, die vorläufige Knotenzuweisung nach Tabelle { "11" } und der gestufte Pilotcode. LSIS-Inhalte werden zur Laufzeit aus einem SHA-256-geprüften lokalen Cache gelesen, der aus dem von der NASA bereitgestellten PDF befüllt wird, und nie weiterverbreitet

# text
seg-56c7aeac59c1 = Dekodierbarkeit von LunaNet AFS im geschlossenen Regelkreis durch einen unabhängigen Empfänger (LSIS V1.0)

# text
seg-da2d29d437b0 = Eine Kshana-AFS-Aufzeichnung, die von einem unabhängigen Software-Empfänger erfasst, verfolgt und dekodiert und mit den eigenen Wahrheits-Labels der Aufzeichnung verglichen wird. Dies belegt nur die Übereinstimmung mit dem Standard und die Konsistenz der Labels; es ist keine Aussage über Kanalphysik, Ausbreitung, Empfangsleistung oder Link-Budgets, deren Werte in der Aufzeichnung gewählte Eingaben sind

# text
seg-780369fb9a54 = Übereinstimmung von GPS L1 C/A zwischen Generatoren

# text
seg-ee47b60515f1 = GPS-L1-C/A-Spreizcodes (sdr::CaCode) und LNAV-Unterrahmen 1-3 (gps_lnav: IS-GPS-200-Feldquantisierung mit dem Pi der Spezifikation, Zweierkomplement-Packung, TLM- und HOW-Wörter, Parität nach Tabelle 20-XIV mit D29*/D30*-Inversion, die paritätslösenden Bits der Wörter { "2" } und { "10" }), bitweise verglichen mit gps-sdr-sim auf dessen mitgelieferter brdc0010.22n ({ "32" } Satelliten)

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
seg-10af60b488b9 = Differenzielle Referenzstation der NovaMoon-Klasse: Aufhebung des Gleichtakts + mit der Basislinie wachsendes Residuum + DGNSS-Schutzniveaus

# text
seg-c04a3591074c = Interoperabilitätsexport für den Mond

# text
seg-91f4a066b3c0 = An LunaNet/IOAG ausgerichteter Export von Mond-Bezugssystem + Zeit + Ephemeride (CCSDS OEM + KIF) mit Round-Trip-Übereinstimmung

# text
seg-8ab65cbefb75 = An Rahmenwerken ausgerichtete Bewertung der PNT-Resilienz

# text
seg-c48198f31d63 = Teilbewertungen je Dimension über Kshanas eigene sieben Resilienzkategorien (nicht DHS-Begriffe), die RDRR-Funktionen von RethinkPNT und die Yang-Kriterien, jeweils mit ihrem Treiber als modelliert gekennzeichnet; vorläufige RPCF-Stufe mit einer Schranke für begrenzte Degradation. Aus der Simulation abgeleitete Selbsteinschätzung, nie eine Zertifizierung.

# text
seg-d7bdb6fe186e = Studie zur Entscheidungsinstabilität der Resilienzbewertung

# text
seg-5fcf18a68bb1 = Quantifiziert, wie ein einzelner Gesamtwert / eine RPCF-Stufe Architekturen unter einem vertretbaren Gewichtungs-Simplex und einem Bedrohungsensemble umordnet (Top-1-Wechselrate, Kendall-Tau-Streuung, Stufenwechselrate, Rangbereiche); Analysen von deklariert gegenüber gemessen und von Diversitätskollaps.

# text
seg-1bf03544a010 = Repräsentativität der Demonstration & Lücken bis zum Flug

# text
seg-db24d16d38c9 = Ehrlichkeitsregister je Ergebnis, das eine Demonstrationsausgabe qualifiziert: ihre externen Anker, modellierten Annahmen, Lücken bis zum Flug und das repräsentative TRL-Band, mit durchgesetzten Invarianten (Validiert verlangt einen externen Anker; Modelliert verlangt eine Lücke und kann nicht über TRL { "4" } hinaus beanspruchen).

# text
seg-52ab936eb5f5 = Nachweise zum Quanten-gegen-klassisch-Abwägen (gemeinsame Form)

# text
seg-a6679ed5bed7 = Ein reproduzierbares TradeEvidence-Objekt (fester Rahmen: Szenario+Seed+Engine; gemeinsame Quanten-gegen-klassisch-Werte je Gütekennzahl mit vorzeichenrichtigem Vorteil, optional { "95" }-%-KI, Label validiert/modelliert), das einen Repräsentativitätsnachweis trägt, sodass jede Quanten-PNT-Vertikale die Abwägung auf dieselbe ehrliche Weise meldet.

# text
seg-20fee61b3107 = Bibliothek von Fehlermodellen für Quantengeräte

# text
seg-e42eabe9bc2a = Gerätekarten (optisch/gefangenes Ion/Quecksilberion + klassische Uhren, wiederverwendet aus holdover/clock_state; Kaltatom-Interferometer; klassische + Verschränkungs-/Einzelphotonen-Zeitübertragungsstrecken), jeweils mit einem Repräsentativitätsnachweis; die Verschränkungsstrecke fügt ein schrotrauschbegrenztes Zeitgenauigkeitsmodell hinzu (~Jitter/sqrt(R*tau), Dunkelzählstrafe, systematische Untergrenze).

# text
seg-86d71fd89f26 = Vertrauenswürdige Quantenzeitgebung (Zeitübertragung + sichere Verbreitung + Anomalie)

# text
seg-d2a3d37825ef = Durchgängige Zeitübertragungskette Quanten gegen klassisch (Uhren-Auslauf + Streckengenauigkeit quadratisch addiert), ein wiederverwendetes Zeitgebungs-Schutzniveau, eine Sicherheitskennzahl gegen Verzögerungs-/Wiedereinspielungsangriffe (1-P_md) sowie eine Erkennungswahrscheinlichkeit von Uhrenanomalien + CUSUM-Latenz, ausgegeben als ehrliches TradeEvidence mit einem Repräsentativitätsnachweis.

# text
seg-eaf341ff4522 = GNSS-freie Quantennavigation

# text
seg-908a44a9f7c7 = Quanten- (Kaltatom-Interferometer) gegenüber klassischer Koppelnavigation mit Navigationsklasse-INS während eines GNSS-Ausfalls: Wachstum des Positionsfehlers, Holdover bis zu einer Positionsschwelle und die Abwägung Quanten gegen klassisch als ehrliches TradeEvidence; ehrlicher Hinweis zur Beobachtbarkeit (Bias ohne Fix nicht beobachtbar, daher wächst der Fehler).

# text
seg-914132833f5a = Fehler-/Anomalieerkennung für Quanten-PNT-Systeme

# text
seg-f20392820b9d = Beschrifteter Katalog von Quantenfehlern (Uhr Frequenzsprung/Drift/Lock-Verlust; Sensor Bias-Sprung/Aussetzer), eine Erkennungsstatistik als ROC-AUC mit Bootstrap-KI und ein minimal erkennbarer Fehler bei fester Fehlalarmrate; ein quantenuhrgestützter Monitor erkennt kleinere Fehler als ein klassischer, ausgegeben als ehrliches TradeEvidence.

# text
seg-d31be81dfd8f = Passive TDOA/FDOA-Geolokalisierung von Emittern

# text
seg-aa870cee16f6 = Einen Emitter (Jammer/Spoofer oder eine Gelegenheitsquelle für Reverse-PNT) aus der Ankunftszeitdifferenz über ein Empfängernetz orten — der Schnitt der Hyperboloide τᵢ=(Rᵢ−R₀)/c wird durch die Gauß–Newton-Methode der kleinsten Quadrate gelöst — und, mit der Frequenzdifferenz der Ankunft (Entfernungsratendifferenzen) bei bewegten Empfängern, gemeinsam Position und Geschwindigkeit zurückgewinnen; mit der Cramér–Rao-Untergrenze der Positionskovarianz aus der Messgeometrie

# text
seg-5bd3882531b6 = Konvektive Staupunkt-Eintrittserwärmung (Sutton-Graves) bei einem 3-DoF-Eintritt

# text
seg-4f97036ed72f = Konvektiver Wärmestrom am Staupunkt q = k sqrt(rho/R_n) V^{ "3" } mit den Sutton-Graves-Konstanten für Erdluft und die Marsatmosphäre (NASA TR R-376, { "1971" }), sein Maximum und die integrierte Wärmelast entlang eines 3-DoF-Eintritts, ballistisch oder mit Auftrieb bei konstanter Querneigung, auf der Erde oder auf dem Mars.

# text
# c1: eo-radiometry
seg-38902593e841 = Signal-Rausch-Budget eines Nadir-Bildgebers (Lambertsche Szenenstrahldichte, Kameragleichung, Schrot-, Dunkel-, Ausles- und Quantisierungsrauschen), die System-MTF bei Nyquist als Produkt aus Beugung bei unverdeckter Apertur, Detektorapertur, linearer Verschmierung und Gauß-Jitter, die aus dieser MTF integrierte Kantenantwort und relative Kantenantwort, Q = lambda F / p, und die GIQE-Version { "4" }-NIIRS ohne MTF-Kompensation. Ausführbar als Szenarioart <c1/>.

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Ebener Gravity-Turn-Aufstieg eines mehrstufigen Fahrzeugs über einer nicht rotierenden kugelförmigen Erde durch die US Standard Atmosphere { "1976" } (Dichte und Druck), mit einem Nickstoß, durch den Düsengegendruck verminderter Schubkraft, Stufenbrennschlüssen exakt an Schrittgrenzen und den neben dem Zustand integrierten Gravitations-, Widerstands-, Steuer- und Gegendruckverlusten. Ausführbar als Szenarioart <c1/>.

# text
seg-55e8345def8b = TWSTFT-Zweiwegegleichung, Unsicherheitsbudget und Streckenstabilität mit Flicker und täglicher Nichtreziprozität

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = Die TWSTFT-Zweiwegegleichung, gelöst nach T_A - T_B mit Sende- und Empfangsverzögerungen der Stationen, der ionosphärischen Auf-/Abwärts-Asymmetrie im Ku-Band, dem Laufzeitunterschied der Transponder und den Sagnac-Termen, gegen ihr exaktes Vorwärtsmodell; ein quadratisches Unsicherheitsbudget mit der Strecken-TDEV als Typ-A-Term; eine Zweiwegeserie mit weißem und Flicker-Phasenrauschen (Kasdin-Walter), einer täglichen Nichtreziprozität und einem konstanten Reziprozitätsresiduum; sowie die Rate, das Residuum-RMS, TDEV und ADEV gelieferter Stationsuhrenserien aus Circular T, MJD-CSV oder IGS-RINEX. Ausführbar als Szenarioart <c1/>.

# text
seg-2f9be02c92bc = Numerik optischer Schrägstrecken-Atmosphäre: Rytov-Varianz, Szintillation, Gamma-Gamma-Schwundwahrscheinlichkeit, Aperturmittelung, optische Tiefe von Wolken und klarer Luft

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley-Cn2, entlang einer Schrägstrecke integriert, für die Rytov-Varianz bei ebener und sphärischer Welle (Aufwärts- und Abwärtsstrecke), den Szintillationsindex nach Andrews-Phillips und die Gamma-Gamma-Parameter, die Gamma-Gamma-Schwundwahrscheinlichkeit und die Schwundreserve, den Aperturmittelungsfaktor bei schwacher Turbulenz, die optische Tiefe von Wolken einer Flüssigwassersäule und die optische Tiefe klarer Luft nach Kim-Sichtweite plus Rayleigh, wodurch der gebündelte atmosphärische Verlust des optischen Link-Budgets ersetzt wird, wenn eine Atmosphäre angegeben ist. Ausführbar innerhalb der Szenarioart <c1/>.

# text
seg-a2faab92e760 = Wettergetriebene Verfügbarkeit optischer Bodenstandorte und abstandskorrelierte Standortdiversität

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Verfügbarkeit einer optischen Strecke gegen eine angegebene Streckenreserve aus einem lognormalen Klima der Wolkenflüssigwassermenge (Menge nach ITU-R P.840, Extinktion der geometrischen Optik) und dem unabhängigen Gamma-Gamma-Turbulenzschwund, die für Zielverfügbarkeiten nötige Streckenreserve und die Obergrenze, die keine Reserve anhebt, lognormale Ausfalldauern, Was-wäre-wenn-Fälle für Verbesserungstechniken und eine Ein-Faktor-Gauß-Copula-Netzverfügbarkeit, deren Paarkorrelation exp(-Abstand/Dekorrelationslänge) ist. Ausführbar als Szenarioart <c1/>.

# text
seg-043ece801e72 = Kontinuität von Zeitgebung und Entfernungsmessung bei optischen Ausfällen

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = Die Verteilung der Ausfalldauer eines optischen Standorts, gekoppelt an die geschlossene Auslaufvarianz des Uhren-Holdover-Modells: Zeitgebungs- und Entfernungsmessfehler bei angegebenen Ausfallquantilen, der Holdover bis zu einer Zeitgebungsschwelle, der Anteil der Ausfälle und der Ausfallzeit innerhalb davon und die Zeitgebungsverfügbarkeit A + U E[min(D, T_h)]/E[D], für die klassischen und die Quanten-Uhrenklassen. Ausführbar innerhalb der Szenarioart <c1/>.

# text
seg-b119df65d2a7 = Optische Streckenreserve über die Zeit: eine Realisierung des Wetters eines Standorts mit Seed

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Eine optionale Tabelle <c1/> (Dauer, Schritt, Seed) lässt die Art <c2/> je Standort zusätzlich eine Realisierung des angegebenen Standortmodells mit Seed über die Zeit schreiben: Wolkenepisoden (klare Phasen exponentiell, Wolkenausfälle lognormal mit dem angegebenen Mittelwert und der angegebenen Streuung, der Zeitanteil in Wolken auf die angegebene Wolkenwahrscheinlichkeit gesetzt), eine lognormale Flüssigwassersäule je Wolkenepisode, eine Gamma-Gamma-Szintillationsprobe je Schritt und daraus die Streckenreserve, die Wolken- und Szintillationsschwunde und die Streckenverfügbarkeits-Markierung, mit der realisierten Verfügbarkeit, dem Wolkenanteil, der Zahl der Ausfälle und dem längsten Ausfall. Ohne die Tabelle ist das Ergebnis das Dokument { "0.37" }. Ziehungen laufen über die portablen Verteilungs- und Mathematikroutinen, sodass native und wasm32 dieselben Bytes liefern.

# text
seg-1a3bb032960f = Konsistenzstatistik für Gleichtakt (trennungsblinder Fehler der gemeinsamen Referenz)

# text
seg-1b03f522b8fc = Score-Statistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 für eine Gleichtaktverschiebung, die die Lösungstrennung (Kontraste orthogonal zu { "1" }) nicht sehen kann; eine Gleichtaktverschiebung bläht sie auf, während die paarweisen Trennungen flach bleiben

# text
seg-3359eee713a5 = Klassifikation des Nullraums des Mond-Datums (LLR-Rang-Additivität + Libration, Hebung des Defekts)

# text
seg-6d722c176052 = Klassifikation des Datumsproblems bei interner Entfernungsmessung: Eine einzelne Entfernungsbeobachtung trägt den Rang { "1" } bei (6-dimensionaler Nullraum); das Paar aus Ursprung X und Maßstab ist nahezu null, und die physikalische DE440-Libration hebt den Defekt auf null, während das Paar nahezu degeneriert bleibt

# text
seg-3fd19007ea67 = Multitechnik-Datumsinformation des Mondes (LLR + Mond-VLBI + Orbiter-Entfernung)

# text
seg-23d0dd7d0666 = Datum-Jacobi-Zeilen für die LLR-Entfernung zu Erdreflektoren, die differenzielle Laufzeit der Zwei-Stationen-Mond-VLBI und die Entfernung zwischen Orbiter und Bake über das 7-Parameter-Datum, zusammengeführt zu einer einheitlich vorkonditionierten Fisher-Matrix; zeigt, dass nicht radiale (Orbiter- / tiefendiverse) Verfolgung die Degeneration zwischen Ursprung X und Maßstab aufhebt, während transversale VLBI nur indirekt hilft

# text
seg-ab96cfc8d48c = Geometrie-Substrat des Mond-LLR-Datums (Reflektoren in Hauptträgheitsachsen, Bodenstationen, analytische Entfernungsableitungen)

# text
seg-40e91288f81a = Die fünf erdzugewandten Retroreflektor-Arrays in Metern im PA-Körperkoordinatensystem und die LLR-Bodenstationen in geodätischen Koordinaten; Platzierung der Reflektoren vom Körper- ins Inertialsystem über die DE440-PA-Orientierung; analytische Ableitungen der Entfernung Erde-Reflektor nach dem 4-Parameter-Datum; und die reine LLR-Fisher-Matrix, die die Degeneration zwischen Mondzentrum-X und Maßstab zeigt, die die 7-Parameter-Analyse motiviert

# text
seg-63a8571f8eb0 = Degeneration zwischen Entfernung und Uhrversatz bei einfacher Mondentfernungsmessung und das Entwurfsgesetz der geometrischen Vielfalt

# text
seg-cdd70f56051a = Die Degeneration zwischen radialer Entfernung und Empfänger-Uhrversatz je Knoten ist exakt bei { "1" } m zu { "3.336" } ns (eins durch c). Die Schur-Komplement-Marginale { "{" }Maßstab, Versatz{ "}" } (coupled_marginal_fisher) zeigt, dass in einem geometrisch vielfältigen Netz die Zweiwege-Entfernungsmessung die Marginale um etwa denselben Faktor hebt wie eine gleiche Anzahl zusätzlicher Einwege-Daten, während im idealisierten Einzelknoten-Regime die Hebung durch Zweiwege um Größenordnungen größer ist. Das daraus folgende Entwurfsgesetz: Geometrische Vielfalt, nicht die Zweiwege-Entfernungsmessung als solche, trennt bei der Einwege-Entfernungsmessung den Maßstab des Mondsystems vom Zeitskalenversatz; eine Zweiwege- oder externe Zeitanbindung ist nur im Regime geringer Vielfalt oder eines einzelnen Nutzers erforderlich.

# text
seg-2c074d6260ba = Repräsentatives Menü aus Multitechnik-Messungen und die additive Kombinationsregel der Fisher-Matrix

# text
seg-beefac5c1b13 = MeasurementBlock hält eine mögliche Messkampagne als 7x7-Beitrag zur Fisher-Informationsmatrix plus skalare relative Kosten; block_from_rows baut einen aus rohen Datum-Jacobi-Zeilen auf, sodass jeder Block über lunar_identifiability::assemble_multi_info identisch vorkonditioniert wird; combine summiert die Information einer gewählten Teilmenge, was die richtige Regel ist, weil Fisher-Information über unabhängige Messungen additiv ist; representative_lunar_menu liefert ein deterministisches Menü aus vier Blöcken (LLR, eine transversale VLBI-Randbake, ein erdzugewandter Orbiter und ein erdabgewandter Orbiter). Der budgetbeschränkte Entwurfsoptimierer, der dieses Menü verbraucht, ist nicht Teil dieser Crate.

# text
seg-2d3347bcb15e = Anbieterübergreifende Konsistenztoleranz für einen Nutzer mit gemischten Anbietern

# text
seg-9decf2cb6b0c = consistency_tolerance: invertiert ein Positionsbudget des Nutzers zu einer Anforderung an die Helmert-Übereinstimmung zwischen Anbietern je Parameter (Ursprung/Maßstab/Rotation) bei einem Referenz-Hebelarm, optional aufgebläht durch die CRLB der Realisierung eines einzelnen Anbieters nach P1

# text
seg-5450d921dfc9 = Fehlerbudget für die Interoperabilität mehrerer Mondanbieter und Entwurfsgesetz Bezugssystem gegen Ephemeride

# text
seg-e1e30f5c17a6 = interop_budget: Aufteilung in reduzierbar (gemeinsame Systemanbindung) und nicht reduzierbar (Dynamik) unter den Konventionen PerProvider / CommonFrameTie / CommonEphemeris, mit der Metrik des Entwurfsgesetzes für den nicht reduzierbaren Anteil (~{ "0.69" } bei realen DE440/INPOP/EPM: Ein gemeinsames Systemkennzeichen allein lässt den dominanten Boden bestehen)

# text
seg-ebb827739614 = Byzantinische Block-Spark-Grenze für Erkennung/Identifikation im autonomen Mondnetz je Knoten (T3)

# text
seg-4fb935e6193d = byzantine_bound instanziiert die Kodierungs-/Sparse-Beobachtbarkeitsgrenze der sicheren Zustandsschätzung auf der Geometrie des Netzes je Knoten: Ein byzantinischer Peer speist eine beliebige Linearkombination der Messungen ein, an denen er beteiligt ist, und das Netz ERKENNT jede Koalition von ≤ f = block_spark − { "1" } Peers und IDENTIFIZIERT eindeutig jede Koalition von ≤ ⌊(block_spark − { "1" })/2⌋, wobei block_spark die kleinste Peer-Koalition ist, deren gestapelte effektive Signaturen P⊥·B_T spaltenrangdefizient sind. Die Erkennbarkeit eines Peers ist der VOLLE SPALTENRANG von P⊥·B_j (ein von null verschiedener, aber rangdefizienter Block ist ein von null verschiedener Angriff, der in range(G) landet und kein Residuum hinterlässt), nicht bloß P⊥·B_j ≠ { "0" }

# text
seg-4f57f586cf82 = Boden der zeitlichen Eichung im autonomen Holdover für die selbstreferenzielle Mondkonstellation (T4)

# text
seg-eb690e8f5c9b = holdover_floor stellt fest, dass in einem Ensemble autonomer Knoten, die nur durch Messungen zwischen den Knoten verbunden sind, die gemeinsame Uhrrate (δα_j += { "1" } ∀j) ein freier Parameter der Ensemblezeit ist, der in N(GᵀWG) liegt: Keine noch so große Zahl zusätzlicher Entfernungsmessungen zwischen den Knoten kann sie beobachten (rate_in_gauge = true, temporal_gauge_dim = { "2" } mit dem gemeinsamen Versatz). Das ist der echte Holdover-Boden — das zeitliche Gegenstück zur Lageeichung des starren Bezugssystems. Das Hinzufügen einer externen absoluten Ratenanbindung (einer direkten Verbindung zu einer Referenz außerhalb des Netzes) treibt die gemeinsame Rate aus dem Nullraum (rate_in_gauge = false, temporal_gauge_dim = { "1" }) und beweist, dass der Boden eine echte Eichung ist und kein Artefakt des Oszillatormodells

# text
seg-25ffd6e1979c = Gemeinsame/differenzielle Aufteilung der Anbieter, Vereinheitlichung der Rangdefizienz um eins und Steigung der Schutzlücke (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Drei Facetten der einen Zerlegung ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG) mit der 8-dimensionalen Eichung aus Datum⊕Zeitskala als N(G) und den state_dim − { "8" } = { "32" } beobachtbaren Richtungen als range(G): (T5) provider_mismatch_split stuft einen gemeinsamen Bias mehrerer Anbieter (∈ range(G)) als NICHT ERKENNBAR ein — er braucht eine externe Anbindung — und einen differenziellen Bias (∉ range(G)) als selbstüberwacht / ERKENNBAR; (§{ "0" }) die Vereinheitlichung besteht darin, dass DERSELBE blinde Teilraum range(G) die nicht erkennbare Fehlerklasse bestimmt, sodass die Datumseichung N(G) und der fehlerblinde Teilraum range(G) eine Geometrie sind, nicht zwei; (g7) slope liefert die Brown-Schutzlückensteigung ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ für einen Fehler b ∈ range(G) (Schätzer bei Parität null verfälscht) und endlich für einen erkennbaren Fehler

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
seg-97aebb84576e = Holdover-Test, bewertet aus einer vom Betreiber gelieferten Zeitfehleraufzeichnung

# text
# c1: holdover-test
seg-ab533cf99c56 = Die Art <c1/>: Eine Zeitfehleraufzeichnung (ein Uhrprotokoll von linuxptp, chrony, TICC, TimeLab oder RINEX, oder Paare time_s,time_error_ns) wird an den beiden Zeitpunkten, die der Betreiber für die Entfernung und die Wiederherstellung von GNSS angibt, in einen Basislinien-, einen Holdover- und einen Erholungsschritt zerlegt; die Basislinie wird an den ITU-T-Masken für eine gelockte Uhr gemessen, das Holdover an denen für Holdover oder eine autonome Uhr, an der ePRTC-A-Holdover-Hüllkurve und an den Zeitfehlerbudgets; das Holdover berichtet den Frequenzversatz nach kleinsten Quadraten, den das System gehalten hat, und die Erholung, ob und wann |TE| in ein angegebenes Band kam und für eine angegebene Verweildauer darin blieb, mit dem Spitzenwert und dem größten Sprung. Jeder Grenzwert ist der, den die Art telecom-timing überträgt; die beiden Zeitpunkte sind die Angabe des Betreibers und werden nicht verifiziert

# text
seg-94cbac97a1aa = Verfügbarkeit von GNSS-Signalen im Space Service Volume und darüber hinaus, verglichen mit dem ICG-SSV-Heft

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Die Verfügbarkeitsdurchläufe der Art <c1/>: je Konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) und kombiniert, der Anteil der Paare (Nutzer, Epoche) mit mindestens einem und mit mindestens vier Signalen und der längste Ausfall, für einen Nutzer auf einer Kugel (die globale Schale des Hefts mit 2,562 Punkten, { "14" } Tage bei { "1" } Minute) oder auf einer Trajektorie (GEO, HEO, Mondtransfer), aus den Kepler-Bahnen von Anhang C des Hefts, einer konstanten minimalen Strahlungsleistung innerhalb des Referenzwinkels außerhalb der Boresight, einer Abschattung durch die Erde als Kugel plus { "50" } km und einer C/N0-Schwelle; Nutzerantennen aus Tabelle B10 des Hefts

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Effekte von Ionosphäre, Plasmasphäre und Atmosphäre auf streifende GNSS-Signale entlang von Randstrahlen sowie der Entwurf des Empfängers für schwache Signale in der Art <c1/>

# text
seg-1a1786ba90b6 = Eine Chapman-Ionosphäre, eine Plasmasphäre vom Gallagher-Typ und eine neutrale Atmosphäre (Brechungsbiegung, Sauerstoffabsorption, Defokussierung), integriert entlang des geraden Strahls zwischen Sender und Nutzer: schräger Gesamtelektronengehalt, sein plasmasphärischer Anteil, Zusatzverzögerung, Tangentenhöhe und der Verlust auf streifenden Strecken; und ein Empfängerentwurf für schwache Signale (kohärente und nichtkohärente Integration, Datenbitgrenze, Stützung, Dopplersuche), der die C/N0-Schwelle aus den Modellen von Erfassung und Tracking-Schleife festlegt

# text
seg-6b8f9f3ca2a3 = GNSS-Navigationsfilter an Bord für Raumfahrzeuge in hohen Umlaufbahnen und im Mondtransfer

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Der Modus <c2/> der Art <c1/>: ein Extended-Kalman-Filter mit neun Zuständen (Position, Geschwindigkeit, Empfängeruhr-Bias und -Drift, ein Maßstab des Strahlungsdrucks der Sonne) auf Pseudoentfernungen, deren Verfügbarkeit, Rauschen und C/N0 aus derselben Streckengeometrie wie die Durchläufe stammen; die Wahrheit wird mit J2, Dritt-Körper-Wirkung von Sonne und Mond und Strahlungsdruck mit Schatten integriert, das Filter modelliert J2 und die dritten Körper und schätzt den Strahlungsdruck; berichtet Positions- und Geschwindigkeitsfehler innerhalb und oberhalb der GNSS-Bahnen, die längste Messlücke und das mittlere NEES

# text
seg-5fc242476828 = Relative Navigation eines Formationsverbunds mehrerer Raumfahrzeuge in einer stark elliptischen Umlaufbahn aus GNSS

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Der Modus <c2/> der Art <c1/>: Ein Chief und Deputies führen je das absolute Filter aus; die Position des Deputy relativ zum Chief wird durch Subtraktion der absoluten Schätzungen und durch ein relatives Filter auf einfach differenzierten Pseudoentfernungen der Signale geschätzt, die beide Fahrzeuge verfolgen, wobei die relative Dynamik die Differenz zweier nichtlinearer Trajektorien ist

# text
seg-7038f6902820 = Fehlerterme des Kaltatom-Interferometers: Phasenrauschen des Raman-Lasers, Bias durch Wellenfrontkrümmung und Auflösung der Streifenmehrdeutigkeit

# text
seg-4d9690207607 = inertial::cai_error_terms (Bibliotheksfunktionen, noch nicht aus einer Szenarioart erreichbar): die Gewichtsfunktion der Raman-Phase eines Drei-Puls-Interferometers mit Rechteckpulsen (Cheinet et al. { "2008" }, Gl. { "8" }) mit der geschlossenen Form für weißes Phasenrauschen (pi/2)^{ "2" } S_phi0/tau_R und einem numerischen Weg für jedes Spektrum; das Laser-Frequenzrauschen, das die Verzögerung der Retroreflexion nicht aufhebt (Le Gouet et al. { "2007" }, Gl. { "9" } bis { "11" }); der reine Defokus-Wellenfront-Bias sigma_v^2/R einer thermischen Wolke und seine Verringerung durch einen Detektionsradius; die Wahrscheinlichkeit eines falschen Streifenindex erfc(pi/(sqrt({ "2" }) s)) für eine Stützung durch einen klassischen Beschleunigungsmesser und für zwei Abfragezeiten, und ihre Inverse

# text
seg-363705e03bac = Holdover-Voreinstellungen für Oszillatoren aus öffentlichen Datenblättern

# text
seg-9750d9e0ec7a = Vier Voreinstellungen — OCXO (Microchip OX-208), Rubidium (Microchip 8040C), Cäsium (Microchip 5071A Hochleistungsröhre) und CSAC (Microchip SA.45s) — jede mit den Maxima der Allan-Abweichung, der Alterung und der Temperaturgrenze ihres Datenblatts; eine Anpassung des Frequenzrauschens aus weiß + Flicker + Random Walk nach nichtnegativen kleinsten Quadraten, skaliert so, dass sie jeden Datenblattpunkt umhüllt, ein Flicker-Boden nie unter dem Wert für das längste τ, lineare Alterung und ein sinusförmiger Temperaturterm, synthetisiert als Holdover mit Seed nach einem GNSS-Verlust

# text
seg-d7e03158b972 = Sekunden, bis eine freilaufende Uhr den Schutzabstand eines zeitindizierten Slots verlässt, und die Fix-Kadenz, die sie darin hält

# text
# c1: slot-timing
seg-0b4d8815f756 = Die Art <c1/>: der vorhergesagte Fehler E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t², invertiert für die Überschreitung, die verbleibende Zeit, das Resynchronisationsintervall abzüglich der Fix-Latenz und Fixes pro Tag, wobei jeder Term einzeln ausgewiesen und der dominante benannt wird; Uhren aus den sechs Standardwerten von ClockClass (TCXO, OCXO und RAFS hinzugefügt, je mit Verweis auf ein Datenblatt), den Voreinstellungen der Telekom-Zeitgebung, einem Inline-Datenblatt oder einer gemessenen Aufzeichnung; eine Überschreitung jenseits der längsten Mittelungszeit der Quelle wird als extrapoliert gekennzeichnet

# text
seg-65a8361b4a22 = Auswertung des Jammertests: ein Empfängerprotokoll, bewertet je geplantem Test (Erkennungslatenz, verpasste Alarme, Fehlalarme, Erholungszeit) anhand des veröffentlichten Testplans

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): der NPRA-Testkatalog und Sendeplan (MIT, mit festgeschriebenem SHA-256 abgerufen, nie eingebunden) wird als geplante Wahrheit gelesen, die Katalog-IDs bleiben erhalten; ein receiver-trust-Lauf wird je Test bewertet (erster Alarm minus geplanter Beginn, erkannt/verspätet/verpasst gegen eine Toleranz, Zeit bis zum ersten alarmfreien Abschnitt, Alarme außerhalb jedes Zeitfensters und seines Schutzintervalls), mit einem signierten Nachweispaket, das die Bewertungstabelle enthält. Der Plan besteht aus geplanten Zeitfenstern, nicht aus aufgezeichneten Sendezeiten

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): eine Zuordnung von Kshana-Ausgaben zu Abschnitten öffentlicher Regelwerke allein nach Nummer, befüllt aus den angegebenen Läufen; ein Ergebnis zählt nur dann für eine Fähigkeit, wenn es den Nachweis trägt, den die Zuordnung nennt, eine leere Menge belegt nichts, und die Formulierung lautet „liefert Belege für"; der Bericht ist weder eine Feststellung, dass ein Regelwerk erfüllt ist, noch eine Bewertung oder Zulassung durch irgendjemanden.

# text
seg-98c360d82d56 = Marine-Integrationen: Signal-K-Plugin, OpenCPN-Gate-Stream und Bewertungsfeld, Referenzaufbau

# text
seg-7af9ce566646 = Der Vertrauenswert, das Band, die Gründe, der Gate-Zustand und die vom Empfänger gemeldete Position, veröffentlicht unter navigation.gnss.kshana in einem Signal-K-Server mit einer Warn-, Alarm- und Normalmeldung (integrations/signalk); der gefilterte NMEA-Stream, bei dem der Fix bei eingebrochenem Vertrauen als ungültig markiert wird und je Zyklus ein PKSHT-Satz folgt, über TCP vom Gate selbst oder von einem kleinen Relay an OpenCPN geliefert, und ein natives OpenCPN-Bewertungsfeld, das den PKSHT-Satz liest (integrations/opencpn); sowie systemd-Units und ein Container, die das Gate betreiben (deploy/reference-build). Wo diese eine Ausgabe zeigen, tragen sie den Hinweis: Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

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
seg-849393517c04 = NovAtel-OEM7-ASCII- und Binärprotokolle (BESTPOS, RANGE, RXSTATUS) für receiver-trust

# text
seg-7e0021922025 = Liest BESTPOS (Position), RANGE (C/No je Signal) und RXSTATUS (das Jammer-Flag des Empfängers, als Selbstauskunft der Epoche) aus ASCII- und Binärprotokollen des OEM7, CRC-geprüft, nur lesend (receiver_trust::machines::novatel).

# text
seg-a45c53a9deb3 = Leser für Träger-zu-Rausch-Werte aus RTCM-{ "3" }-MSM4 und -MSM7 für receiver-trust

# text
seg-0a0c9976236f = Liest das C/N0 jeder Signalzelle von RTCM-{ "3" }-MSM4- und -MSM7-Nachrichten (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) aus einem Frame-Strom, CRC-24Q-geprüft (receiver_trust::machines::rtcm3). Layouts aus den unter BSD lizenzierten pyrtcm-Tabellen, nicht aus dem Text des RTCM-Standards.

# text
seg-cd554a7c1649 = GNSS-SDR-Monitor-Adapter für receiver-trust

# text
seg-22b587ac642d = Liest GNSS-SDR-Monitor-Nachrichten (Gnss_Synchro) und PVT-Monitor-Nachrichten, mit den proto-Feldnamen als JSON-Zeilen weitergereicht, in C/N0 je Kanal, Fix, verwendete Satelliten, HDOP und Himmel (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-217e5953c128 = Einlesen von IMU-Protokollen, Kreisel-Kurseingang und Allan-Anpassung hybrider Sensorparameter

# text
seg-9dadc819daef = Liest eine IMU-CSV (dokumentierte Spalten oder das EuRoC-Layout); integriert die Gierrate zu dem Kurs, den der Monitor heading-course liest ([log.imu]); und passt die Rauschparameter von Beschleunigungsmesser und Kreisel der hybriden und Fusionsszenarien aus einem Ruheprotokoll per überlappender Allan-Abweichung an (imu-fit).

# text
seg-15a852a2dcb0 = Home-Assistant-MQTT-Discovery und Zustandsexporter für Vertrauenstelemetrie

# text
seg-6d6b07b26966 = Ein JSON-Zustandsdokument und MQTT-Discovery-Nachrichten für Home Assistant zum Vertrauensstrom, auf jeder Oberfläche als Text ausgegeben und von der CLI über MQTT { "3.1.1" } QoS { "0" } veröffentlicht (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-68caf86157c2 = ROS-{ "2" }-Paket für receiver-trust und gnss_lib_py-Brücke

# text
seg-e7d7d99fe538 = Eine ROS-freie Brücke, die Fix- und Satellitennachrichten als NMEA schreibt und über die Python-Anbindung bewertet (integrations/ros2/kshana_trust), und eine Brücke von gnss_lib_py NavData zu receiver-trust über das Format rtklib-pos (integrations/gnss_lib_py).

# text
seg-c3c260b7063e = Tests

# text
seg-bbb1828b3db1 = Reduktionen von Straßenschlucht, Sektor und Gelände auf eine Tabelle

# text
seg-2864aec7be88 = skyline: die Straßenschlucht in geschlossener Form (Schnitt atan((h - a) / d) mit d = (w/2) / abs(sin(az - s)), offene Enden bei endlicher Länge), scharfkantige Sektoren im Uhrzeigersinn mit Umbruch und Geländepunkte, auf eine Tabelle reduziert mit dem Krümmungsabfall d^2/({ "2" } * 4/3 R); die Skyline ist ihr punktweises Maximum mit einer beliebigen Tabelle

# text
seg-3f3d657854ce = Skyline-Voreinstellungen (Stadtstraße, Hafeneinfahrt, Fjord, Containerterminal)

# text
seg-b915c06fa3f1 = skyline::PRESETS: vier REPRESENTATIVE Geometrien mit den angegebenen Abmessungen der Entwurfsnotiz und je einer Herkunftszeile: city-street (eine Schlucht, Straße { "0" } Grad, { "20" } m zwischen { "30" } m hohen Wänden, Antenne { "1.5" } m), harbour-approach (Sektoren: offen zur Seeseite über { "180" } Grad, Kaigebäude { "8" } Grad über { "90" } Grad, der Wellenbrecher { "3" } Grad), fjord (Gelände: Wände { "600" } m über der Antenne in je { "1.5" } km Abstand beiderseits einer Nord-Süd-Rinne, Krümmungsabfall angewendet), container-terminal (Sektoren: Stapel { "12" } Grad über der landseitigen Hälfte, Kranausleger { "35" } Grad und { "25" } Grad über zwei schmalen Sektoren); feldweise überschreibbar

# text
seg-6012113b4836 = Himmelsgeometrie-Funktionen: Sichtbarkeit, DOP, Kovarianz, Fehlerellipse, Monte-Carlo-Wolke

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> und <c2/>, Python- und WASM-Funktionen gleichen Namens, MCP <c3/>): aus einem Standort, einer Zeit und Konstellationsvoreinstellungen (oder Satelliten als Azimut/Elevation oder ECEF) die sichtbaren und unter einer Skyline maskierten Satelliten, GDOP/PDOP/HDOP/VDOP/TDOP, den Kofaktor mit Einheitsvarianz (H^T H)^-1 und die Kovarianz in Ost-Nord-Oben mit einer Empfängeruhr je System oder einer gemeinsamen, die horizontale Fehlerellipse (Halbachsen k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), Orientierung { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) von Nord aus) sowie n gesäte Kleinste-Quadrate-Fehler bei unabhängigen gaußschen Entfernungsfehlern mit ihrer empirischen Kovarianz, dem RMS und der { "95" }-%-Einschließung. Der Kofaktor ist orbit::cofactor_from_los, der eine Kern hinter orbit::dop und orbit::dop_cov (dop ist die Reduktion von dop_cov): keine zweite DOP-Implementierung

# text
seg-7f66be0f15c8 = GNSS-verweigerter Uhr-Holdover

# text
seg-4d8f87668a0f = Wachstum des Auslauffehlers in geschlossener Form + Holdover bis zur Schwelle; Quantenuhr-Klassen

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
seg-157fadeb5d67 = Modulation von Navigationssignalen und Code-Tracking-Analyse

# text
seg-ab633d191396 = BPSK-R/BOC-PSD, Spektraltrennung κ, Gabor-Bandbreite, DLL-Jitter, Mehrwegeausbreitung

# text
seg-e6c08e1e6ae3 = Leistungsfähigkeit von Quanten-Inertialsensoren

# text
seg-d28e1f6a430f = Kaltatom-Interferometer-Beschleunigungsmesser aus ersten Prinzipien (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Streifenmehrdeutigkeit / Dynamikbereich von Quanten-Inertialsensoren

# text
seg-deb2850546d5 = Streifenmehrdeutigkeits-Dynamikbereich des Mach-Zehnder-Interferometers: Die 2π-periodische Streifenauslesung legt eine maximale eindeutige spezifische Kraft a_max=π/(k_eff·T²) fest, und der eindeutige Bereich in Auflösungszellen a_max/σ_a=π/σ_Φ ist unabhängig vom optischen Skalenfaktor — der Empfindlichkeitsgewinn mit T² kostet eindeutigen Bereich in exaktem Gleichschritt (die Abfragezeit tauscht Auflösung gegen Bereich, wobei die Zellenzahl durch das Phasenrauschen der Auslesung festgelegt bleibt)

# text
seg-d04bf321d4a1 = Resilienz der Quanten-Inertial-Koppelnavigation

# text
seg-c4989abb5d40 = Zusammengesetztes Positionsbudget aus Bias + Skalenfaktor + VRW + Stabilitätsabfall über den Holdover

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
seg-f1d49eac89f8 = Alternatives / ergänzendes PNT

# text
seg-023dda973f66 = Schwerefeld-Kartenabgleich, geländereferenziert (TERCOM/SITAN), magnetische Anomalie

# text
seg-791e7285c291 = Reproduzierbarkeit und Softwaresicherung

# text
seg-7177355a482c = Deterministische, szenario-gehashte Gates für SBOM + plattformübergreifende Golden-Werte

# text
# c1: impairment-eval
seg-241f2eeaef12 = Gelabeltes synthetisches Störungskorpus + detektorunabhängiges ROC/AUC/Konfusions/Pfa-Pmd-Harness; Leckageschutz, stratifizierte Aufteilung, Bericht zur Optimismuslücke bei Verteilungsverschiebung (innerhalb vs. außerhalb des Regimes). Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/impairment-eval.toml)

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Kontrollierte synthetische Studie der AUC-Optimismuslücke von In-Distribution zu Out-of-Distribution über Detektoren veröffentlichter Methoden und gelernte Detektoren (logistische Regression / MLP mit einer verdeckten Schicht): Skalierungsgesetz-Trends je Klasse (Spearman ρ + Steigung über { "1" }−Schweregrad) und ein Ridge-Prädiktor nur aus ID, der die Lücke allein aus In-Distribution-Diagnosen schätzt, bewertet mit Leave-one-detector-out und Leave-one-class-out. Reproduzierbar über <c1/>

# text
seg-fd6424213d1f = Abwägung Quanten- gegenüber klassischem PNT & GNSS-verweigerte Resilienz ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Einlesen gemessener ADEV (NNLS), Abwägungstabelle (Zeitgebungs-/Inertial-Holdover + Nutzen), Hüllkurve Resilienz über Zeit; der Hinweis zur Untergrenze wird am Artefakt mitgeführt. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/quantum-trade.toml)

# text
seg-1fa865bfddd1 = Weltraumwetter-Umgebung & aktivitätsgetriebene thermosphärische Dichte

# text
# c1: space-weather
seg-47308f611c7e = Solare/geomagnetische Indizes (definitorische Kp↔ap-Tabelle), die exosphärische Temperatur nach Jacchia-1971 und die thermosphärische Dichte nach Jacchia { "1971" } (SAO Special Report { "332" }: statische Diffusionsprofile, die dessen Tabelle { "7" } reproduzieren, mit den tageszeitlichen, geomagnetischen, halbjährlichen, jahreszeitlich-breitenabhängigen und Helium-Variationen) gegenüber der statischen Atmosphäre USSA76. Ausführbar über die CLI/Bindings als Szenarioart <c1/> (scenarios/space-weather.toml)

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
seg-7b4a8e25c3c9 = Adaptive Codierung und Modulation nach DVB-S2 entlang eines LEO-Downlink-Überflugs

# text
# c1: acm-link
seg-3912fb8ccb15 = Es/N0 des Downlinks entlang jedes Überflugs eines Satelliten über einer Station (EIRP, Freiraumdämpfung, atmosphärische Dämpfung nach Kosekansgesetz, sonstige Verluste, G/T, Boltzmann-Konstante, Symbolrate), das effizienteste DVB-S2-MODCOD, das seine quasi-fehlerfreie Schwelle aus ETSI EN { "302" } 307-1 V1.4.1 Tabelle { "13" } plus eine Implementierungsmarge bei jedem Schritt überschreitet, das ACM-Datenvolumen des Überflugs und die Basislinie mit konstanter Codierung, die an der Maske und der längsten Entfernung schließt. Ausführbar als Szenarioart <c1/>. Illustrative Eingaben; MODELLED.

# text
seg-19603a7e0fe8 = Kontaktplanung für mehrere Satelliten und mehrere Stationen mit Konfliktauflösung

# text
# c1: contact-schedule
seg-40edeae6e48b = Kandidatenkontakte aus jedem Satellit-Station-Überflug mit seinem ACM-Datenvolumen; Konflikte, wenn eine Antenne innerhalb ihrer Umschaltzeit zwei Satelliten bedienen würde oder ein Satellit gleichzeitig zu zwei Stationen herunterladen würde; ein prioritätsgewichtetes Zustellungsziel, begrenzt auf den Rückstau jedes Satelliten; ein Greedy-Plan mit trägem Grenzwert, eine Basislinie nach Eingangsreihenfolge und ein exaktes Branch-and-Bound auf bis zu { "26" } Kandidaten, wobei die Optimalitätslücke des Greedy-Plans angegeben wird. Ausführbar als Szenarioart <c1/>. Illustrative Eingaben; MODELLED.

# text
seg-3742d2aea62a = Sparsame Rahmung von Kosten je Abdeckung / ROI

# text
seg-4228311689f8 = Kosten je Prozent Abdeckung + Abdeckung je Euro als ROI über die Konstellationsdimensionierungs-Engine; die Kosten je Satellit sind eine vom Aufrufer bezogene Spanne niedrig/nominal/hoch (keine erfundenen Preise)

# text
seg-8ba6ee9acc8a = Integritätsauswirkung unentdeckter Fehlererkennung (kontextabhängiges HPL/VPL gegenüber Alarmgrenze)

# text
seg-f5985399d0d5 = Bildet einen unentdeckten Spoofing-/Jamming-Bias auf einen effektiven Fehler ab → Stanford-Region (verfügbar/nicht verfügbar/MI/HMI) gegenüber kontextspezifischem HAL/VAL (offener Himmel vs. urban)

# text
seg-37d43b5b918a = Parameterblatt zitierter Fehlermodelle für CAI ({ "13503" })

# text
seg-0b6a901f5ad2 = Eingegrenzte (beste/nominale/konservative) Leistungsfähigkeit von Kaltatom-Interferometern — Bias-Instabilität, Geschwindigkeits-/Winkel-Random-Walk, Skalenfaktorstabilität, abfragebegrenzte Abtastrate, Dynamikbereich der Streifenmehrdeutigkeit — jeweils auf Zitate rückführbar; speist QuantumNavBudget, ohne Hardware zu modellieren

# text
seg-c93f2d3a3167 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Epochenklassifikator des Stanford-Integritätsdiagramms

# text
seg-712d5c35a6a6 = TIB-Epochenklassifikation im Stanford-Integritätsdiagramm (nominal / nicht verfügbar / MI / HMI)

# text
seg-573aa0193cb3 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Bewerter der Integritätsabdeckung

# text
seg-4d86f3c2d8f5 = TIB-Bewertung der Integritätsabdeckung (HMI/MI/Verfügbarkeitsraten + Urteil zur Überschrankenabdeckung)

# text
seg-372dd0fdb025 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Fehlerkatalog (parametrische Generatoren)

# text
seg-2604e7cf27d2 = TIB-Fehlermenü (Domänendivergenz, Uhren-Slam, Holdover-Auslauf, statische/inkrementelle/symmetrische/asymmetrische Verzögerung, Replay innerhalb der Frische, pfadselektiv, k-aus-N-Quorum)

# text
seg-90c0eb1e7c14 = Übereinstimmungs-Benchmark zur Zeitgebungsintegrität — Urteil zur Absorption nicht erkennbarer Fehler

# text
seg-f713acf042ff = TIB-Urteil zur Absorption nicht erkennbarer Fehler (symmetrisch/Replay müssen vom PL absorbiert und nie als erkannt gemeldet werden)

# text
seg-8adbbd2cdb74 = Selbstbeschreibung des hybriden optischen/HF-Berichts

# text
seg-2a5e48b558e1 = Der hybrid-optical-rf-Bericht gibt die Streckenkonfiguration an, mit der er tatsächlich lief (Trägerwellenlänge, Sende- und Empfangsapertur, Entfernung, Pulsbreite, Integrationszeit, Wirkungsgrade und Verluste, aufgelöste Standardwerte), und trägt einen Einheitenblock, der Einheit und Herkunftsklasse jeder Größe angibt, die eine Veröffentlichung wahrscheinlich zitiert, einschließlich der Spuren der Übergabekovarianz in Quadratmetern

# text
seg-0691f3dee8cb = Verfügbarkeit der hybriden optischen/HF-Strecke auf der HF-Seite

# text
seg-72ccb655caf0 = Der hybrid-optical-rf-Bericht gibt eine HF-Streckenverfügbarkeit an, zusammengesetzt aus Größen, die die Engine bereits berechnet, statt aus einer importierten Klimatologie, und gibt die Zusammensetzung als benannte Regel an: A_rf = I_closure * I_track, wobei I_closure das Schließungsurteil des Einweg-Link-Budgets nach CCSDS-401 / DSN-810-005 ist (linkbudget::link_budget, Eb/N0-Marge >= { "0" }) bei der eigenen Entfernung des Szenarios und I_track das Urteil der Nachführschleife (jamming::lock_status) auf dem C/N0, den DASSELBE Budget lieferte. Jeder Faktor führt die Herkunftsklasse seiner Eingabe bis zur Ausgabe mit, und die Faktoren, die bewusst NICHT im Produkt enthalten sind -- geometrische Sichtbarkeit, Störungsverweigerung und eine HF-Ausfallklimatologie -- werden mit Begründung benannt, statt stillschweigend auf { "1" } gesetzt zu werden. Die aufgelöste HF-Teilstrecke wird als eigener Block rf_link_configuration ausgegeben, und die kontinuierlichen Zahlen neben dem Indikator (Streckenmarge, C/N0-Marge, die geschlossenen Reichweiten für Schließung und Nachführung in geschlossener Form und die Reichweitenauslastung) sind die Reichweitenumkehrungen desselben Budgets. Der Bericht gibt am Block und im Einheiten-Eintrag, auf dem ein Leser landet, vollständig an, dass diese Zahl DURCH MARGE/GEOMETRIE BEGRENZT und DETERMINISTISCH ist, während die optische Verfügbarkeit DURCH WETTER/KLIMATOLOGIE BEGRENZT und probabilistisch ist, sodass beide nie als vergleichbares Paar von Prozentwerten zitiert werden können

# text
seg-22c5df9b6c7c = Gleichwertiger Vergleich der Entfernungsmessung optisch gegenüber HF

# text
seg-70eb396f40af = Der hybrid-optical-rf-Bericht gibt das Verhältnis der Entfernungsmessung optisch gegenüber HF aus, wobei die EINE Konfiguration, bei der beide Teilstrecken ausgewertet wurden, im selben Objekt mitgeführt wird: derselbe Einwegpfad, dieselbe Entfernung und dieselbe Akkumulationszeit. Die optische Teilstrecke ist die photonenbegrenzte ToA-CRLB der Engine auf der Einweg-Photonenzahl; die HF-Teilstrecke ist der thermische Code-Tracking-Jitter des DLL (Early-Late) der Engine bei dem C/N0, den das eigene Link-Budget der Engine für dieselbe Einwegentfernung liefert. Die Schleifenrauschbandbreite wird abgeleitet, nicht gewählt: B_L = 1/({ "2" }*integration_s) legt die HF-Teilstrecke genau auf die optische Akkumulationszeit, und wenn ein Aufrufer sie so überschreibt, dass die beiden Mittelungszeiten auseinanderfallen, wird das Verhältnis REFUSED -- null, mit der Abweichung und beiden benannten Zeiten -- statt bei zwei Arbeitspunkten zitiert zu werden. Es wird kein Verhältnis gegen das GEWÄHLTE parametrische rf_position_sigma_m des Szenarios gebildet, und die Ablehnung nennt den Grund: Diese Eingabe trägt überhaupt keine Konfiguration. Die veröffentlichte optische Zweiweg-Kennzahl und der exakte Faktor, der sie mit der Einweg-Vergleichsteilstrecke verbindet, werden neben dem Verhältnis ausgegeben, sodass der Bericht nicht so gelesen werden kann, als trüge er zwei widersprüchliche optische Sigmas

# text
seg-3f26f598e013 = Selbstbeschreibung des Link-Budget-Berichts

# text
seg-b88bf41d6d4c = Der Link-Budget-Bericht gibt jede absolute Konstante an, aus der seine eigene Marge berechnet wurde -- die Trägerfrequenz, die die Freiraumdämpfung verwendete, die EIRP, die Gütezahl, den pauschalen Verlust und den Boltzmann-Term -- plus das erforderliche G/T, bei dem die Marge null ist, die Streckenkonstante (EIRP - Verluste - erforderliches Eb/N0), die die einzige Kombination ist, die eine veröffentlichte Raten-/Gewinntabelle je festlegen kann, und, wenn ein Aufrufer eine Systemrauschtemperatur angibt, den Empfangsantennengewinn, den diese Gütezahl impliziert

# text
seg-a7b192e27cb5 = Übergangstabelle der Mondzeit je Uhrenklasse

# text
seg-cab605dc6ea2 = Ein Lauf des Mondzeitbudgets gibt je Uhrenklasse eine Übergangszeile Uhr-gegen-Bezugssystem gegenüber einem einzigen gemeinsamen Bezugssystemterm aus, sodass die Uhr die einzige Variable des Vergleichs ist; jede Zeile trägt den Übergang auf zwei Wegen erreicht -- per Bisektion aus der allgemeinen Potenzgesetz-Zeitfehlerkurve und algebraisch aus dem dominanten Rauschtyp der Zeile umgekehrt -- mit der relativen Differenz zwischen beiden

# text
seg-18c72a7565d6 = Erfassungs-Fußabdruck gegenüber Höhe und Strahlbreite

# text
seg-9c30a0ab5233 = Zweiachsiger Durchlauf des musterbewerteten, höhenbegrenzten Oberflächen-Erfassungs-Fußabdrucks über Senderhöhe und Schüsseldurchmesser, ausgegeben eine Zeile je Arbeitspunkt mit der Halbwertsstrahlbreite, die jeder Durchmesser impliziert, und die Erfassung am Horizont als SCHWELLE angegeben -- je Zeile das J/S am Horizont, seine Marge und die Sendeleistung, die es schließen würde; je Raster die gefundenen Durchgänge oder eine ausdrückliche Angabe, dass der Horizont nirgends im Raster erreicht wird, mit dem Fehlbetrag

# text
seg-fc0a64b9a280 = Reproduzierbarkeit des Mondzeit-Fehlerbudgets

# text
seg-5d5970506b9c = Das Szenario lunar-time-budget veröffentlicht seine feldwertigen Ausgaben als Tabelle in Langform (Rasterindex, Mittelungszeit, Term) neben dem Bericht, sodass die sieben x(tau)-Kurven je Term und die Wurzel aus der Quadratsumme der Gesamtheit Engine-Ausgabe sind und nichts, was ein Leser aus dem Methodenabschnitt neu aufbaut

# text
seg-675887733454 = Zeitlabor der Mondstation: Holdover des miniRAFS gegenüber LTC

# text
seg-7dfedc40da6a = Der optionale Block [time_lab] des Szenarios lunar-time-budget modelliert eine Mondreferenz-Stationsuhr (standardmäßig die Klasse miniRAFS oder eine beliebige benannte Klasse oder eine an angegebene Stabilitätspunkte angepasste Gerätekarte), die auf die Koordinierte Mondzeit gesteuert und dann frei laufen gelassen oder alle N Sekunden neu gesteuert wird: die Zeitfehlerkurve x(t) als Wurzel aus der Quadratsumme des Potenzgesetz-Terms der Uhr, eines konstanten Steuerresiduums (ILLUSTRATIVE), eines konstanten Realisierungsresiduums der LTC und eines optional zuschaltbaren Terms für die Rate der Stationshöhe; die Zeit nach einer Steuerung auf { "1" }, { "10" } und { "100" } ns (oder angegebene Schwellen) per Bisektion neben der Umkehrung in geschlossener Form für den dominanten Rauschtyp und der dominante Term bei jedem angegebenen Horizont, jeweils mit Einheiten

# text
seg-af3ff120b707 = Geodätische VLBI zum Mond

# text
seg-cfd7d0126028 = Nahfeld-VLBI-Verzögerung für eine Erdbasislinie, die ein Mondbaken beobachtet + partielle Ableitungen

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
seg-652bdc29deea = Auflösung der Trägerphasen-Mehrdeutigkeit am Mond: Oberfläche und Orbiter

# text
seg-02496f9e9af2 = Zwischen Empfängern einfach differenzierte Erde-GNSS-Trägerphase und Code an einer Mondoberflächenstation und einem Orbiter, wobei die Uhrendifferenz je Epoche herausprofiliert wird, eine Mehrdeutigkeit je kontinuierlichem Überflug und der längste Überflug als Eichung. Die Float-Mehrdeutigkeitskovarianz ist ein Schur-Komplement; LAMBDA löst die ganzen Zahlen auf, die Bootstrap-Rate wird neben einer gesäten Monte-Carlo-Erfolgsrate der ganzzahligen Kleinste-Quadrate-Lösung und den Positions-Sigmas für Float und Fixed angegeben. Berichtet wie gefunden: Bei den registrierten { "12" } dBi ist das Problem der Doppeldifferenz nicht bildbar (Änderung { "1" } verlegte den Standard auf { "25" } dBi, nachdem nur Verfügbarkeitszahlen gesehen wurden), und bei { "25" } dBi wird ganzzahliges Fixieren NICHT erreicht - außer Reichweite (höchstens wenige Prozent), obwohl sich die Float-Lösung mit dem Bogen verbessert.

# text
seg-11dd1bb8e4e1 = Mitschätzung des Mondbezugssystems: Oberflächenstationen und Orbiter

# text
seg-a38c8d95e6c9 = Fisher-Information des Datums des Mondbezugssystems mit sieben Parametern aus Erdstations-Laserentfernungsmessung zu den fünf Reflektoren allein und mit zusätzlichen Orbiter-zu-Oberflächenstation-Entfernungen: die Informationsmatrix, der Rang, Cramér-Rao-Sigmas, die Degenerationsmetrik des Identifizierbarkeitsmoduls des Mondes und gesäte zufällige Stationsmengen. Die Bahn wird in den Mondachsen als bekannt gehalten (ihr Fehler wird vom Entfernungssigma des Orbiters getragen).

# text
seg-862977c4bb01 = Präzision der Bezugssystem-Verknüpfung im Weltraum: ko-lokalisierte GNSS, VLBI und Laserentfernungsmessung

# text
seg-a9ae8e99f00d = Cramér-Rao-Präzision der Translations-, Maßstabs- und Rotationsversätze zwischen den Techniken für GNSS-, VLBI- und Laserentfernungs-Bezugssysteme, wenn ein Raumfahrzeug alle drei trägt, wobei die Raumfahrzeugposition in jeder Epoche eliminiert wird und neun Störparameter der lokalen Verknüpfung einen Prior tragen, über die Genauigkeit der lokalen Verknüpfung durchlaufen. Kovarianzen über den Quadratwurzelweg (Normalgleichungen verlieren die Stellen, wenn die Techniken nahezu perfekt sind).

# text
seg-ae627996875e = Sensitivität gegenüber Love-Zahlen und Libration des Mondes

# text
seg-28780d07c4a7 = Fisher-Information von h2, k2, l2 und den physikalischen Librationsamplituden aus Laserentfernungsmessung (radiale und horizontale Gezeitenverschiebung, Reflektorrotation), Orbiter-Tracking (die k2-Beschleunigung vom Grad 2, entlang der Sichtlinie integriert, Trend entfernt), einem Oberflächengravimeter (gravimetrischer Faktor { "1" } + h2 - { "1.5" } k2) und einer Oberflächenuhr (relative Rate ({ "1" } + k2 - h2) W2/c2, an die Mondzeitkonstanten gebunden). Nominalwerte von h2 und l2 sind Linearisierungspunkte; die Studie sagt, was wogegen empfindlich ist, nicht, was die Zahlen sind.

# text
seg-da712b740519 = DOP-Verbesserung durch Oberflächenbaken auf dem Mond

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Durch Baken verbesserte Präzisionsverdünnung für einen Nutzer auf der Mondoberfläche: Die Sichtlinienzeilen der sichtbaren Satelliten und die Entfernungsmesszeilen der sichtbaren Oberflächenbaken werden zu einer Entwurfsmatrix verkettet und über den gemeinsamen DOP-Kern ausgewertet, und die resultierende DOP wird über einen Nutzeräquivalenz-Entfernungsfehler je Bake, zusammengesetzt als Wurzel aus der Quadratsumme von Uhrensynchronisations-, Mehrwege- und Vermessungstermen, auf eine realisierte 1-Sigma-Genauigkeit IN METERN abgebildet. Die Sichtbarkeit der Baken ist der geometrische Horizont des luftlosen Mondes bei zwei Höhen, der keine refraktive Erweiterung hat und daher exakt statt näherungsweise ist. Ausführbar als Szenarioart <c1/>, die Satelliten allein, Satelliten plus Baken und eine größere Konstellation als konkurrierenden Weg zur selben Geometrie angibt. MEASURED an der mitgelieferten Golden-Geometrie (Nutzer bei -80 Grad, drei vermessene Baken, illustratives LCNS mit sechs Satelliten bei t={ "0" }, Maske { "5" } Grad): { "5" } sichtbare Satelliten ergeben PDOP { "9.6941" } und ein 3-D-1-Sigma von { "11.222" } m; das Hinzufügen der Baken, die den Horizont tatsächlich überschreiten, ergibt PDOP { "4.1160" } und { "4.765" } m, ein Faktor von { "2.355" }; der Dienst mit 24 Satelliten ergibt stattdessen PDOP { "2.4226" } und { "2.804" } m, ein Faktor von { "4.002" }. Der Bericht gibt die Anzahl der SICHTBAREN Baken statt der konfigurierten aus, und bei dieser Geometrie überschreitet nur EINE der drei Baken den Horizont: Die beiden flankierenden Standorte liegen etwa { "333" } km vom Nutzer entfernt gegenüber einem Horizont von { "86" } km für eine Antenne von { "2" } m, sodass ein Leser nie annehmen muss, alle drei hätten beigetragen

# text
seg-845e9f5eec81 = Schutzniveau bei Gleichtakt und gesamte Integritätshüllkurve

# text
seg-1b96577665fc = Radiometrie, MTF, relative Kantenantwort und GIQE { "4" } NIIRS eines elektrooptischen Bildgebers

# text
seg-07ca77a67207 = Verluste beim Raketenaufstieg durch Gravitation, Widerstand, Lenkung und Gegendruck

# text
seg-58cbf576c959 = Leser für TRK-2-18-Orbit-Data-Files und gerampetes Mars-2-Wege-Dopplermodell

# text
seg-d1055650a77f = Ein Leser für DSN-Orbit-Data-Files (TRK-2-18): die 36-Byte-Satzgruppen (Dateikennsatz, Kennung, Bahndaten, Rampen je Station, Uhrenversätze, Zusammenfassung, Dateiende) und in jedem Bahndatensatz die Zeitmarke seit { "1950" }, Downlink- und Uplink-Verzögerungen, Observable, Stationen, Datentyp, Bänder, Gültigkeit, Kanal, Raumfahrzeug, die 46-Bit-Referenzfrequenz und die Kompressionszeit; Start- und Endzeiten der Rampen, Raten und Startfrequenzen. Darauf aufbauend ein gerampetes 2-Wege-X-Band-Dopplermodell (integrierte Uplink-Rampen, Rundlauf-Lichtlaufzeit mit Shapiro und Troposphäre, DSN-Stationen über die CIO-Kette IAU 2006/2000A und IERS-EOP, Stationszeit) und eine Batch-Bahnbestimmung für Mars-Orbiter (GMM-3-Feld, Drittkörper, SRP, Widerstand).

# text
seg-455dc946c965 = Multiplikative EKF-Lageschätzung aus einem Gyro und einem Sternsensor

# text
# c1: aocs
seg-553d043438b4 = Das multiplikative EKF nach Lefferts-Markley-Shuster: Lagefehler im Körpersystem und Gyro-Bias-Zustände, Propagation mit der Gyrorate abzüglich der Bias-Schätzung und dem diskreten Prozessrauschen nach Farrenkopf (Winkel- und Raten-Random-Walk), Sternsensor-Updates mit dem Residuum { "2" } vec(q^-1 q_st) in Joseph-Form und dem multiplikativen Reset; ein diskreter Gyro- und Sternsensor-Simulator nach Farrenkopf. Die Art <c1/> kann den Regelkreis auf seiner Schätzung schließen.

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
seg-43cd7aa7ab53 = HF-Jamming der Mondoberflächen-Navigation (J/S je Satellit)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Mondeigenes Verhältnis von Störer zu Signal, effektives C/N₀ und Lock-Verlust für einen selenographischen Oberflächennutzer unter einem Störer auf der Mondoberfläche (oder erhöht) über der illustrativen Konstellation der Klasse Moonlight/LCNS aus öffentlichen Quellen. Setzt die offene Jamming-Kette (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) mit der offenen Mond-Himmelsgeometrie (lunar_service::LunarConstellation + topozentrisch, lunar::selenographic_to_mcmf) zusammen; weder Geometrie noch Radiometrie werden neu hergeleitet. Anders als bei der Erd-Art <c1/> ist die Signalstrecke keine feste Empfangsleistung: Die isotrope Empfangsleistung jedes Satelliten ist seine eigene Link-Budget-EIRP − FSPL(Schrägentfernung), sodass J/S von Satellit zu Satellit mit Mondentfernung und Elevation variiert. Gibt EINE ZEILE JE SICHTBARER (Epoche, Satellit) STRECKE als JSON und als *.table.csv-Artefakt aus, mit beiden Empfangsleistungen, deren Differenz das J/S ist, daneben gedruckt; aggregierte Gütezahlen stehen neben dieser Tabelle, nie an ihrer Stelle. Ausführbar als Szenarioart <c2/>

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
seg-a3b8272862aa = Antennenmuster außerhalb der Boresight im Export der Mondgeometrie

# text
seg-27d246503a48 = Der Geometrieexport je Satellit trägt je (Epoche, Satellit) den Außerachsenwinkel AM SATELLITEN und den Sendegewinn zum Standort aus dem realen gleichmäßig ausgeleuchteten Kreisaperturmuster (Airy) und gibt die Zahl der Satelliten im Strahl unter diesem Muster NEBEN der Zahl im Strahl unter der symmetrischen Näherung von Gewinn zu Strahlbreite an (θ_3dB[deg] = √(31000/G_lin)), wobei die Differenz als ausdrückliche Korrektur in Strecken, in Satelliten je Epoche und als ungünstigste einzelne Epoche ausgegeben wird. Beide impliziten Apertureffizienzen der Näherung werden ausgegeben ({ "0.641" } gegenüber der Regel { "70" }·λ/D Grad, mit der sie zitiert wird, { "0.920" } gegenüber einer gleichmäßigen Kreisapertur), sodass die Effizienz, die sie stillschweigend annimmt, angegeben statt abgeleitet wird. Standardmäßig aus: Der Block erscheint nur, wenn ein Exportstandort und eine Apertur beide angegeben sind

# text
seg-6fbfa234ef3e = Lock-Verlust der Nachführschleife und Spoofing-Pull-in unter Störung

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Lock-Verlust, berechnet aus der Schleifendynamik statt aus einem Leistungsverhältnis: thermischer 1σ-Jitter von Träger (Costas) und Code (nichtkohärent Early/Late) gegenüber C/N₀ mit dem Quadrierungsverlust, gegenüber den angegebenen Regeln 3σ_PLL + θ_e ≤ { "45" }° und 3σ_DLL + Rampenverzug ≤ d/2 Chips; C/N₀-Schwellen für Abfall und erneutes Einrasten mit der benannten bindenden Schleife und der aus der weiteren Pull-in-Bandbreite ABGELEITETEN Hysterese statt einer behaupteten; die erklärte Zeit bis zum Lock-Verlust aus einem Lock-Detektor mit zwei Schwellen und Bestätigungsverweilzeiten, getrennt von der physikalischen Phasenfluchtzeit angegeben (mittlere Zeit nach Viterbi zwischen Zyklusschlupfen, in log₁₀ s, weil sie hunderte Dekaden überspannt); die größte Code-Anstiegsrate und Träger-Dopplerrate, denen die Schleifen des Opfers folgen können; und den VERWEIGERUNGSRADIUS, den die Schleifendynamik impliziert, neben dem vorhandenen Radius des Leistungsverhältnisses angegeben, mit ihrer vorzeichenbehafteten Differenz als eigenem benannten Feld. Ausführbar als Szenarioart <c1/>

# text
seg-0f4d023fe2d4 = Koordinatenkovarianz eines Mondoberflächenpunkts aus einem VLBI-Verzögerungszeitplan, getrennt von der der Erdstationen gehalten

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Eine dritte Datumswahl, <c1/>, die jede Erdstation festhält und allein die mondkörperfesten Koordinaten der BAKE schätzt — die Konfiguration, für die eine Unsicherheit eines Mondoberflächenpunkts tatsächlich angegeben wird, da die Koordinaten der Erdstationen eine Eingabe des Verzögerungsmodells sind und keine Unbekannte davon. Sie existiert, weil die Kovarianz auf Stationsebene und die Kovarianz des Oberflächenpunkts VERSCHIEDENE GRÖSSEN sind, getrennt durch den Hebelarm ρ/B, und zuvor nichts verhinderte, dass die eine gegen die andere zitiert wurde. Der ausgegebene Block <c2/> trägt ρ, die längste Basislinie, den Hebelarm, die Oberflächenpunktform der Gleichverteilungsverknüpfung c·σ_τ·(ρ/B)·√(g/N), das berechnete Bakensigma je Koordinate und ihr Verhältnis — das Verhältnis null statt irreführend, wann immer die Bake nicht geschätzt wird oder die Matrix rangdefizient ist. B wird als die LÄNGSTE vorhandene Basislinie genommen, die günstigste, sodass das Verhältnis nur unterschätzen kann. Ausführbar als <c3/> mit <c4/>, was mit einer Meldung abgelehnt wird, die die fehlende Eingabe nennt, wenn die Bake nicht geschätzt wird

# text
seg-0315968c8214 = Differentielles PNT am Mond — Residuenbudget der Korrekturstrecke

# text
seg-c6785166a44c = Die drei Terme, die eine differentielle Korrektur zwischen der Epoche, zu der sie berechnet wird, und der Epoche, zu der sie verwendet wird, aufnimmt, jeweils zuvor als unmodellierte Reserve belassen: Vermessungsfehler der Referenzstation (über Satelliten korreliert, unabhängig von der Basislinie, ~{ "1" }:{ "1" } Positionsübertragung und nachweislich nicht von DOP verstärkt), Alterung der Korrektur (der eingefrorene Bahnfehlervektor, neu projiziert auf die Sichtlinie, auf die der eigene Propagator der Engine den Satelliten eine Latenz später setzt, plus c·σ_y(τ)·τ Uhrendrift aus dem kalibrierten Potenzgesetz) und gleichmäßige Streckenquantisierung über einen exakten Vollausschlag ±(orbit_err + clock_err) mit der Varianz step²/12. Angegeben sowohl im Entfernungs- als auch im Positionsbereich, neben — nie anstelle von — dem vorhandenen Residuum und Schutzniveau, mit einer Latenzkurve neben der Einzelzahl

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
seg-7bfcb5c6a985 = ARAIM mit gleichzeitigen Fehlerhypothesen für mehrere Satelliten

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: die Regel zur Bestimmung der Teilmengen nach ADD v4.2 (P_THRES, FC_THRES, überwachte Teilmengen mit den wenigsten Entfernten zuerst), von Paaren auf gleichzeitige Kombinationen von bis zu max_order Satelliten- und Konstellationsereignissen verallgemeinert, mit dem exakten Prior P_no fault prod q_e; add_v42_protection_levels_to_order führt darauf den Schutzniveau-Pfad nach ADD v4.2 aus (Ordnung { "2" } ist exakt der bestehende Pfad). raim::araim_subset_raim (optional zuschaltbar): fortgeschrittenes RAIM über diese Hypothesenmenge, jede überwachte Teilmenge ein Modus (p_fault, T, b, sigma) in der Summe des Integritätsrisikos, nicht beobachtbare Teilmengen in das nicht überwachte Risiko verschoben, das Budget mit der ADD-Zuteilung des nicht überwachten Risikos skaliert, und die Teilmenge mit der größten normierten Trennung gemeldet, wenn ein Fehler erkannt wird. Priors, die tiefere Teilmengen als max_order benötigen, werden abgelehnt, nie abgeschnitten

# text
seg-48ca01332f8f = RAIM neben den Gütemaßen des Uhren-Holdovers

# text
seg-890f1006a75d = Der optionale Abschnitt [integrity] der Art clock (clock_integrity::run): aus einem angegebenen Standort und Konstellationsvorgaben (geometry::sky_geometry), in jeder Integritätsepoche, solange die GNSS-Zeitleiste nicht verwehrt ist, Momentaufnahme-RAIM (raim::snapshot_raim: Paritäts-Chi-Quadrat-Test, Schutzniveaus nach Steigung) auf den Satelliten über der Maske mit gaußschen Residuen mit festem Startwert und dem angegebenen Sigma sowie einem optional angegebenen Bias; ein getrennter Block integrity_fom mit Urteilen je Epoche, Schutzniveaus und Verfügbarkeit. Verwehrte Epochen werden als nicht verfügbar gemeldet, nie extrapoliert; die Holdover-Gütemaße bleiben unverändert, und ohne den Abschnitt ist die Ausgabe byteidentisch

# text
seg-9cbb4ee7588a = Räumliche, verrauschte Beobachtbarkeit der Bogenlänge über mehrere Familien cislunarer Bahnen

# text
seg-5ebd771deef8 = Die Schwelle der Beobachtbarkeit der cislunaren Bogenlänge im RÄUMLICHEN CR3BP mit sechs Zuständen statt im ebenen mit vier Zuständen, über die Familien DRO, L2-Halo und L2-Near-Rectilinear-Halo, wobei das Messrauschen in die Gramsche Matrix eingeht, und ZWEI Kriterien berichtet werden, weil es kein einzelnes ehrliches gibt: das veröffentlichte Rangkriterium, das nachweislich unabhängig von einem homoskedastischen Messsigma ist (die Gewichtung multipliziert die Beobachtbarkeitsmatrix mit einem Skalar und lässt das relative Singulärwertspektrum und damit Rang, Defekt und Kondition unverändert), und ein Schätzbarkeitskriterium — der erste Bogen, bei dem die formale 1σ-Positionsunsicherheit des Anfangszustands des Chiefs unter eine angegebene Grenze fällt —, das sich als einziges mit dem Rauschen verschiebt. Jede Schwelle trägt die Klammer des Epochenrasters, in der sie liegt; ein nicht erreichtes Kriterium ist null mit einer Begründung. Der ebene Modus bleibt die Voreinstellung, und Familien außerhalb der Ebene werden dort abgelehnt, statt in einen Zustand zusammengedrückt zu werden, der sie nicht darstellen kann

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
seg-c815cb90dcde = Geodäsie der Mondreferenzstation: hinzugefügter Retroreflektor und VLBI-Bake gegen das Datum aus fünf Anordnungen

# text
seg-103cf21173ac = Optionale Eingaben extra_reflectors und extra_beacons im Szenario lunar-llr-datum fügen einen Block station_geodesy hinzu: die Helmert-Information der fünf Anordnungen aus dem archivierten Ausschnitt der Mondlaserentfernungsmessung plus die Information, die ein hinzugefügter Retroreflektor (mit Entfernungsmessung zu den archivierten Normalpunkt-Epochen, in denen die messende Station über ihrem Horizont steht, jeweils mit dem archivierten Gewicht dieses Normalpunkts) und eine hinzugefügte VLBI-Bake (beobachtet vom Netz und Zeitplan der lunar-frame-campaign bei festgehaltenen Erdstationen, über die Verzögerungspartialen von lunar-vlbi-fim) an angegebenen Orten auf das Datum mit sieben Parametern legen, neu gelöst, mit dem 1-sigma jedes Helmert-Parameters davor und danach, ihrem Verhältnis, den Normen davor und danach und den extremen Eigenwerten der Fisher-Differenz. Fehlen sie oder sind sie leer, bleibt der Bericht unverändert

# text
seg-44f582b17fa9 = Integrität des Tores — ein Grün, das bedeutet, was es sagt

# text
# c1: cargo test --all
seg-43fbcfbe990c = Drei strukturelle Wachen über den Verifikationsprozess selbst, die jeweils eine Klasse von Defekten schließen, die als zeitweiliges oder falsches Rot das kanonische Tor erreicht hat. ({ "1" }) Jeder konstruierte temporäre Pfad in den Rust-Quellen muss eine Komponente tragen, die je Aufruf eindeutig ist; eine Prozess-ID wird abgelehnt, weil cargo die Bibliothekstests als parallele Threads EINES Prozesses ausführt und die pid von allen geteilt wird. ({ "2" }) Jeder Byte-für-Byte- oder Hash-Pin muss neben sich oder in seinem Modulkopf angeben, was er abdeckt und was er bewusst ausschließt — damit eine übergreifende Änderung auf einen Blick erkennen kann, welche Pins im Geltungsbereich liegen und welche stillschweigend zu repositoryweiten Änderungsdetektoren geworden sind. ({ "3" }) Ein Grün ist nur aus der VOLLSTÄNDIGEN Suite behauptbar: scripts/gate.sh führt <c1/> aus, erfasst den wahren Exit-Code ohne eine Pipe dazwischen und schreibt eine Quittung, die den Commit, die Anzahl der Integrationsbinärdateien, die Anzahl der Tests und die Dauer nennt; die Prüfung vor dem Push lehnt einen Push ab, dessen Commit keine gültige Quittung nennt, auf einem sauberen Baum. Die Wiederholbarkeit wird getrennt durch scripts/check-repeatability.sh stichprobenartig geprüft, das die Bibliothekssuite N-mal ausführt und scheitert, wenn sich die Menge der bestandenen Tests unterscheidet.

# text
seg-b7cd952ff133 = Zusammengesetztes Zeitgebungs-PL — mit P0 gestartete Holdover-Überbrückung

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); unterhalbstetiges PL({ "0" }+)≥PL({ "0" }−); K(IR/2) laufendes Maximum; Phasenexponenten τ/τ³/τ⁵

# text
seg-096b6cdfe2dc = Zusammengesetztes Zeitgebungs-PL — LIL-Hüllkurve f.s. (Unmöglichkeit + Konsistenz)

# text
seg-1671add2210d = Kein endliches Worst-Case-Holdover (das Brownsche Supremum divergiert); IR-zugeteiltes HPL konsistent mit der Hartman-Wintner-Hüllkurve für IR→{ "0" }

# text
seg-5a27c9f0a67d = Integritäts-Überschranke für den heterogenen Rückführbarkeits-Bias von UTC(k)

# text
seg-fd09ab2adbf6 = Überschranke des Bias je Quelle b = (U/k_cov)·Phi^-1(1-tail/2) + Alterung, die eine veröffentlichte erweiterte Unsicherheit vom Typ B auf einen zugeteilten Integritätsrand aufbläht; Brücke zu tpl_scalar als bias_s

# text
seg-d75b900ad25f = Korrelierte Kreuzkovarianz des Rückführbarkeits-Bias (für Gleichtakt unsichere Zuteilung)

# text
seg-0641f6d38c23 = N×N-Bias-Kreuzkovarianz mit Nebendiagonalen rho·b_i·b_j für Quellen, die einen UTC(k)-Realisierer teilen; BEWIESEN correlated_fused_bias >= independent_fused_bias (die naive unabhängige Zuteilung unterschätzt den fusionierten Bias -> optimistisch -> unsicher)

# text
seg-2797643153dc = Zeitgebungs-Schutzniveau für einen Empfänger im Orbit unter GNSS-Spoofing

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, erreichbar als Spoofing-Abschnitt der Art <c1/>: Geschwindigkeit und Periode auf einer Kreisbahn, die längste Zeit, in der ein Bodenspoofer den Satelliten je Überflug erreichen kann, die uhrgestützte Monitoruntergrenze und die CUSUM-Erkennungslatenz, das bedingte Schutzniveau (Untergrenze plus Auslaufen über die Latenz), den Zug, den ein Spoofer mit einer angegebenen maximalen Rampenrate ansammelt, bevor der Satellit seinen Footprint verlässt oder eine unabhängige Prüfung läuft, und ob jede Bodenkontakt- oder Crosslink-Prüfung von einem Bodenspoofer unabhängig ist

# text
seg-f134975d4ffa = L-Band-Spektrum-Wasserfall mit J/S je Band und effektivem C/N0 unter einem skriptgesteuerten Jammer-Zeitverlauf

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Die Art <c1/>: ein Raster aus Frequenz mal Zeit der Leistungsdichte im L-Band (thermischer Boden k T_sys mit T_sys = T_ant + { "290" } K (F - { "1" }), die Signale mit ihren in der Schnittstellenspezifikation angegebenen minimalen Empfangsleistungen sowie Continuous-Wave-, Schmalband-, Chirp- und Matched-Noise-Jammer mit Ein-/Ausschaltzeiten), jede Zelle über ihren Bin und ihre Zeile gemittelt (Chirps exakt über ganze und teilweise Durchläufe, Jammer nach Tastverhältnis), je Zeile effektives C/N0 je Band = [1/(C/N0) + sum (J/S) kappa]^-1, J/S je Band, J/S im Band und ein SVG-Wasserfall mit C/N0-Balken. Der Bericht trägt eine Gegenprüfung gegen die Kette der Art <c2/> mit denselben Streckeneingaben

# text
seg-6e0b9687e8ee = Uranus und Neptun aus Standish Tabelle { "1" }, Pluto und Planetengeschwindigkeiten

# text
seg-df3bf502dfe9 = Positionen von Uranus und Neptun aus Standish Tabelle { "1" } (die Voreinstellung innerhalb von { "1800" } n. Chr. bis { "2050" } n. Chr.), Pluto aus der Zeile der Tabelle { "1" } von { "1992" }, die die aktuelle JPL-Seite nicht mehr aufführt, und die heliozentrische Geschwindigkeit jedes Planeten: die Zweikörper-Ableitung mit der durch die Elemente implizierten mittleren Bewegung plus der Drehung der Ellipse durch die Raten von Perihel, Neigung und Knoten

# text
seg-a50be56f605a = Positionen des Mondes und von sieben großen Monden (Phobos, Deimos, die galileischen Monde, Titan)

# text
seg-2cfbe5a1eece = Der geozentrische Mond aus der Reihe von Montenbruck & Gill (deren Term von -1.3972 deg pro Jahrhundert ihn bereits auf das Äquinoktium J2000 bezieht) sowie planetozentrische Positionen und Geschwindigkeiten von Phobos, Deimos, Io, Europa, Ganymed und Kallisto aus den mittleren Elementen der JPL Solar System Dynamics in der Laplace-Ebene jedes Mondes, wobei die Rate der mittleren Länge aus der synchronen Rotationsrate der IAU genommen wird (die Tabelle druckt die Periode mit zu wenigen Stellen, um die Phase zu halten), und von Titan aus dem Rotationsmodell der IAU (der Mond auf der negativen körperfesten x-Achse im mittleren Abstand), weil die gedruckte Zeile der Laplace-Ebene von Titan Horizons nicht einmal bei ihrer eigenen Epoche reproduziert

# text
seg-8b8c8e28ece9 = Physikalische Konstanten jedes Körpers des Sonnensystems und der Bericht über das gesamte System

# text
# c1: solar-system
seg-d225a30de35c = Body erhält Merkur, Venus, Jupiter, Saturn, Uranus, Neptun, Pluto, Phobos, Deimos, Io, Europa, Ganymed, Kallisto und Titan (Gravitationsparameter, Referenzradius, J2, wo veröffentlicht, mit dem Radius, auf den es sich bezieht, IAU-Pol und Nullmeridian), eine Namenssuche und einen Datensatz BodyFacts (NAIF-Code, Klasse, Mutterkörper, Äquatorial- und mittlerer Radius); die Art <c1/> berichtet sie für alle achtzehn Körper mit den Positionen, Lichtlaufzeiten und einer Bahnspur über einen Umlauf, wobei jeder Körper als VALIDATED oder MODELLED gekennzeichnet ist

# text
seg-87ab655f8270 = Positionsbestimmung um jeden Körper des Sonnensystems mit einer lokalen Konstellation und einer Deep-Space-Verbindung von der Erde

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Die Art <c1/>: Ein Orbiter oder ein Lander auf der Oberfläche um einen mit Namen gewählten Körper navigiert mit einfachen Pseudoentfernungen von einer Walker-Navigationskonstellation um den Körper (Zweikörperbahnen mit der säkularen J2-Drift des Körpers, eine unbekannte Nutzeruhr) und einer optionalen uhrfreien Zweiweg-Entfernung von der Erde, wobei Richtung und Entfernung der Erde bei jeder Epoche aus der analytischen Ephemeride stammen; durch die Kugel des Körpers blockierte Sichtlinien und eine Elevationsmaske an der Oberfläche; je Epoche GDOP und PDOP allein der Konstellation (orbit::dop), die formale Positionsunsicherheit mit und ohne die Erdzeile und Gauß-Newton-Lösungen mit festem Startwert (batch_ls::gauss_newton) in beiden Varianten, mit Lichtlaufzeit und Umlaufzeit vom Körper zur Erde

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
seg-ad6105af464c = Parameterdurchläufe und Monte-Carlo-Ensembles mit festem Startwert über jede Szenarioart

# text
# c1: campaign
seg-95921611839e = Die Abschnitte sweep (ein bis drei Punktschlüssel einer beliebigen Art, auf den Achsenwerten des generischen Durchlaufs, wahlweise mit einem Ensemble an jedem Knoten) und monte_carlo der Art <c1/>: Realisierung k läuft bei base_seed + k; jede Metrik berichtet Mittelwert, Standardabweichung, Perzentile 5/50/95 nach dem Nearest-Rank-Verfahren und ein Perzentil-Bootstrap-Konfidenzintervall von { "95" }% für den Mittelwert mit festem Startwert (inertial::metric_stat); Metrikeinheiten aus dem eigenen units-Block der durchlaufenen Art gelesen

# text
seg-24327a0ed82e = Mehrere Szenarien unter gemeinsamen Bedingungen, mit einer kombinierten Zusammenfassung

# text
# c1: campaign
seg-5833fb3b06e3 = Der Abschnitt compose der Art <c1/>: benannte gemeinsame Werte (zum Beispiel Leistung und Position eines Jammers), die in jedes Mitglied an den Schlüsseln geschrieben werden, an die sie gebunden sind, jedes Mitglied wird ausgeführt, und je Metrik der kleinste, der größte und der mittlere Wert über die Mitglieder, mit dem benannten Mitglied; die Metrikeinheiten müssen über die Mitglieder übereinstimmen

# text
seg-0bc866720bde = Beschränkte Optimierung einer Metrik über Kampagnenparameter

# text
# c1: campaign
seg-f9bdb89c2b4f = Der Abschnitt optimize der Art <c1/> (CAP-32): ein bis drei Punktschlüssel von Szenarien, auf [lo, hi] beschränkt, auf linearer oder logarithmischer Skala, eine Metrik, die über einen Ergebnispfad gelesen wird, Ziel minimize, maximize oder target; Verfahren grid (die Achsenwerte des Durchlaufs) oder ein deterministisches Nelder-Mead-Simplex in normierten Koordinaten mit Boxprojektion und den Standardkoeffizienten; eine fehlende oder nicht endliche Metrik wird als schlechteste bewertet und bleibt in der Spur; bei runs > { "1" } ist die Metrik der Mittelwert über gemeinsame Startwerte; jede Auswertung ist ein realer Lauf der benannten Art, in trace aufgeführt und im Reproduzierbarkeits-Digest mitgezählt

# text
seg-652e28dfa10f = Signaldesigns für Positionierung, Navigation und Zeitgebung in niedriger Erdumlaufbahn: Code-Tracking, Akquisition, GNSS-Kompatibilität und ein Bandvergleich für jedes System

# text
# c1: leo-signal
seg-c0ba5c7e708e = Die Art <c1/>: parametrisierte Signaldesigns (Band, Sendebandbreite, ITU-Zuweisung; Akquisitions-, Daten- und Pilotkomponenten mit BPSK(n)-, BOC(m,n)-, MBOC- oder flachen Spektren, Leistungsanteilen, FDMA-Unterträgern, Codelängen und Datenraten) aus einkompilierten öffentlichen Voreinstellungsdateien (Xona Pulsar, Iridium STL, Starlink-Gelegenheitssignal, CentiSpace, ein generisches C-Band-Design und generische Designs für UHF/L/S/C/Breit-C, jeweils mit ihrer Quell-URL und unveröffentlichten Werten, die als REPRESENTATIVE gekennzeichnet sind) oder inline geschrieben; je Signal die bandbegrenzte Leistungsdichte, Leistungsanteile im Band, Gabor-Bandbreite, Code-Jitter gegen C/N0 und Abstand sowie die Entfernungsmessgenauigkeit, der Akquisitions-Suchraum, die Detektionswahrscheinlichkeit mit Quadratgesetz und die mittlere serielle und codeparallele Akquisitionszeit, der spektrale Trennungskoeffizient in und aus GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b und AltBOC mit der C/N0-Degradation sowie die Toleranz gegen CW-, Breitband- und angepasstes J/S aus der SSC-Kette der Art spectrum; ein Bandvergleich von ionosphärischer Verzögerung, Freiraumverlust, Entfernungsmessgenauigkeit bei gleichem C/N0 und gleicher EIRP und Jammer-Toleranz; und qualitative Formprüfungen eines Designs gegen eine beschriebene Messung

# text
seg-c2b9c8e4a364 = Mehrband-Spektrum-Wasserfall (UHF, L, S, C) mit entworfenen Signalen und Jammern je Band

# text
# c1: spectrum
seg-609df4e0a085 = Die Art <c1/>, über das L-Band hinaus erweitert: Bänder, angegeben als voreingestelltes Signaldesign (mit jeder Komponente gezeichnet, auf die Sendebandbreite bandbegrenzt, C/N0 und J/S auf die verfolgte Komponente bezogen) oder als benutzerdefinierter Träger und Modulation; zusätzliche Wasserfall-Felder über einen beliebigen Frequenzbereich auf derselben Zeitleiste und Farbskala; ein Breitband-Jammer (Barrage) neben CW, Schmalband, Chirp und angepasstem Rauschen; J/S je Band und effektives C/N0 aus der unveränderten Kette der spektralen Trennungskoeffizienten

# text
seg-d9eb3e7e69c2 = Ein LEO-PNT-Überflug und sein Streckenbudget je Band gegen die sichtbaren MEO-GNSS-Satelliten

# text
# c1: leo-pass
seg-d986e44443dd = Die Art <c1/>: Satelliten aus einem entworfenen Überflug, aus Elementen, einem TLE über SGP4 oder einer Walker-Konstellation aus constellation-design; je Band und Epoche die Blickwinkel, die Entfernung, die Entfernungsänderungsrate und die Entfernungsbeschleunigung in geschlossener Form (bei jedem Lauf gegen zentrale Differenzen geprüft und berichtet), Freiraumverlust, EIRP mit isoflux-, gaußschem oder flachem Muster, eine Patch-, halbkugelförmige oder isotrope Nutzerantenne, gasförmige Dämpfung nach ITU-R P.676-10 Anhang { "2" }, Regen und Szintillation nach P.618, Gebäudeeindringverlust nach P.2109, Polarisationsfehlanpassung, Systemrauschtemperatur, C/N0, Doppler und Doppler-Rate sowie die Verzögerung erster Ordnung aus einem Klobuchar- oder Vertikal-TEC-Schräg-TEC, skaliert mit dem Chapman-Anteil unterhalb des Satelliten; ionosphärenfreie Paare mit Code-Rauschen am Überflugmaximum; Galileo- oder GPS-Träger aus den Empfangsleistungen ihrer Schnittstellendokumente durch denselben Empfänger

# text
seg-95a077a980b6 = Benannte LEO-PNT-Systemvoreinstellungen mit angegebenen Quellen und eine systemunabhängige Engine

# text
seg-4b47033cda24 = leo_link::presets: generisches Mehrband (UHF, L, S, C), generisches C-Band, Xona Pulsar X1/X5, Iridium STL, Starlink als reines Doppler-Gelegenheitssignal, CentiSpace und eine optionale Voreinstellung Celeste IOD, jeweils mit ihrer Quelle, gekennzeichnet als PUBLIC (mit URL), REPRESENTATIVE oder WORKSHOP, wobei die Workshop-Voreinstellung in der optionalen Voreinstellungsdatei Celeste IOD liegt, die nur einkompiliert wird, wenn diese Datei existiert; jedes Band und jede Bahn in einem Szenario überschreibbar, und ein Szenario muss keine Voreinstellung nennen

# text
seg-a39f34973373 = Energiearme Positionierung: Zeit bis zur ersten Lösung und Energie je Lösung gegen Tastverhältnis

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy und der Abschnitt [iot] der Art <c1/>: kohärente Integration, durch die Doppler-Rate begrenzt, nichtkohärente Summen mit Quadratgesetz bis zu einer Detektionsschwelle, eine Doppler-Bin-Suche über die Hüllkurve der Bahn für ruhende Nutzer (kalt) oder ein gestütztes Fenster (heiß), parallele oder serielle Codesuche, Zeit der Navigationsnachricht bei einem Kaltstart, Energie je Lösung und Batterielebensdauer über Lösungsintervalle, für jedes LEO-Band und das GNSS-Signal

# text
seg-8121e7db3db3 = Aktualisierung der LEO-Navigationsnachricht mitten im Überflug mit einer Kontinuitätsprüfung beim Wechsel

# text
# c1: leo-navmsg
seg-34c310d85c42 = Die Analyse midpass-update der Art <c1/>: der höchste Überflug über einen Nutzer innerhalb einer Suchspanne, Nachrichten nach einem globalen Zeitplan mit Nutzungsperioden, zentriert in ihren Anpassungsfenstern, und bei jedem Wechsel der 3D-Positionssprung, der Uhrensprung, der Pseudoentfernungssprung des Nutzers, der größte Sprung über jede sichtbare Sichtlinie (geschlossene Form über den Nadirkegel), der Entfernungsfehler davor und danach und PASS/FAIL gegen eine Schwelle

# text
seg-7635a8339e78 = Dokumentierte Binärkodierung der LEO-Navigationsnachricht mit einem Quantisierungsfehlerbudget

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: der eigene Rahmen von Kshana (Präambel, Version, Modell, Länge, Nutzlast, CRC-24Q) für die vier Ephemeridenmodelle, das Uhrenpolynom, SVID, Ausgabestand der Daten, Band, Gesundheitsstatus, einen Klobuchar-Satz, NeQuick-G-Koeffizienten und UTC-Parameter, jedes Feld mit angegebener Breite und Schrittweite (field_table), Quantisierung mit Ablehnung außerhalb des Bereichs und ein Budget der größten Positions- und Uhrenänderung, die eine Änderung um einen halben Schritt jedes Feldes über das Gültigkeitsfenster bewirkt

# text
seg-17ca41d7fd71 = Exporte von LEO-Navigationsnachrichten im Stil von RINEX 4 und als CSV

# text
seg-185e12ccef0d = leo_navmsg::text: ein Block im Stil von RINEX 4 (Kopfzeile des Datensatzes > EPH, Zeile für Satellit und Epoche mit drei Uhrentermen, Broadcast-Bahnzeilen im Format D19.12) mit dem Systembuchstaben L und den Datensatztypen KP16, KRAC, LU22 und APOL, in jedem Kopf als Erweiterung von Kshana gekennzeichnet, die nicht Teil von RINEX { "4.02" } ist, und eine CSV-Tabelle mit einem Standardspaltenschema und Voreinstellungsschemata, jeweils mit einem Importer

# text
seg-e79047fc95af = ATOMIC-ECEF-Polynom ohne Uhr und der synthetische LEO-Modellvergleich mit fünf Höhen

# text
seg-e261843e35b1 = die Variante EcefPoly von leo_navmsg::elements::EphemerisModel: ein ECEF-Polynom je Achse ohne Uhrenterme, der relativistische Term aus -2 r.v/c^{ "2" }, bewertet gegen eine gesteuerte Uhr. Außerdem die Modellvergleichsanalyse (liu_comparison über LIU2025_TABLE), die das Modell mit 22 Parametern bei den fünf Höhen des Artikels über Bögen von 20 Minuten einer von Kshana integrierten Bahn anpasst und das Ergebnis neben dem veröffentlichten SISRE ausgibt

# text
seg-d2e18c8bdc14 = Positionierung aus LEO-Doppler, mit einem und mit mehreren Satelliten, mit Zuständen für Uhrendrift und Geschwindigkeit

# text
# c1: leo-pvt
seg-de6cb3c06490 = Batch-Gauß-Newton-Positionierung aus der Entfernungsänderungsrate mit analytischen Partialen (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), wahlweise mit konstanter Nutzergeschwindigkeit, einer Höhen-Pseudomessung für einen Nutzer an der Oberfläche und gedämpften Schritten; die formale Kovarianz an der Wahrheit; Projektionen Along-Track, Cross-Track und vertikal; die Genauigkeit eines einzelnen Überflugs gegen den Cross-Track-Versatz des Nutzers; der Zeitpunkt der größten Annäherung. Der Modus doppler der Art <c1/> fügt den Fehler gegen die Fensterlänge und einen Modus nur mit Doppler für Gelegenheitssignale hinzu (die Voreinstellung starlink-sop)

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
seg-9306f1c06081 = LEO-gestützte Zeitübertragung zu UTC gegen C/N0 und den Empfängeroszillator

# text
# c1: leo-pvt
seg-c618feb01476 = Uhrenmessungen von jedem sichtbaren LEO-Satelliten an einer bekannten Position, aus dem Pseudoentfernungs-Rauschmodell mit inverser Varianz kombiniert, gefiltert durch ein Kalman-Filter mit zwei Zuständen (Phase, Frequenz), dessen Prozessrauschen das weiße und das Random-Walk-Frequenzrauschen der Oszillatorklasse ist (slot_timing::ClockNoise, clock_state::ClockClass; die Auslaufvarianz von holdover::coast_phase_variance), eine Wahrheitsuhr mit festem Startwert aus denselben Pegeln, und der Ausdruck für Systemzeit zu UTC aus Abschnitt { "20.3.3.5.2.4" } von IS-GPS-200, mit einer Unsicherheit des Broadcast-Offsets, die als Bias je Lauf hinzugefügt wird; der Modus timing der Art <c1/> durchläuft Oszillatoren und C/N0-Offsets

# text
seg-d92777401093 = Benannte LEO-PNT-Systeme als optionale Datenvoreinstellungen, jeweils mit ihrer Quelle

# text
seg-5130bfe2410c = Systemunabhängige Eingaben: Jedes System besteht aus Walker-Schalen, expliziten Elementen oder einer GNSS-Voreinstellung, einem Signal (Träger, Chiprate, Bandbreite, empfangene Leistung oder C/N0-Bereich), einem SISRE, einem Doppler-Sigma und einem Uhrenmodell; Voreinstellungen füllen nur aus, was ein Szenario offenlässt, je eine Datei mit Quellen, gekennzeichnet als PUBLIC (mit URL), WORKSHOP oder DERIVED, und die unveröffentlichten Werte sind als repräsentativ aufgeführt: Xona Pulsar X1/X5, Iridium STL, Starlink-Gelegenheitssignale, CentiSpace, ein repräsentatives C-Band-System, das ATOMIC-Ephemeridenmodell ohne Uhr und eine aus einem Workshop abgeleitete Voreinstellung in der optionalen Voreinstellungsdatei Celeste IOD, die durch Löschen dieser Datei und ihrer Szenarien zurückgehalten wird

# text
seg-dec52b5b9cd6 = Ein LEO-PNT-System von Anfang bis Ende: Signaldesign, Streckenbudget des Überflugs, Navigationsnachricht und fusionierte Positionierung, wobei die Ausgabe jeder Stufe an die nächste übergeben wird

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Die Art <c1/>: Ein Design von leo-signal (öffentliche Voreinstellung oder inline) legt Mitte, Bandbreite, Chiprate und EIRP-Aufteilung eines Bandes von leo-pass fest; der Überflug liefert je Epoche das C/N0 der verfolgten Komponente und den bandbegrenzten Code-Jitter; eine C/N0-Gerade nach kleinsten Quadraten in sin(Elevation), das SISRE der Nachricht von leo-navmsg (an der Bahn des Überflugsatelliten angepasst, plus ein angegebener Term der Bahnbestimmung als Wurzel der Quadratsumme) und der Träger und die Chiprate des Designs gehen an jedes LEO-System einer gemeinsamen Lösung von leo-pvt und optional an die LEO-Fälle von leo-ppp; jede Übergabe wird mit ihrem Wert und ihrer Einheit berichtet

# text
seg-55ca63edff02 = Erkennung von Spoofing durch LEO-Doppler und Konsistenz der Überflug-Geometrie

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = Der Abschnitt <c2/> der Art <c1/>: Ein Spoofer fälscht, in Entfernung und Entfernungsänderungsrate selbstkonsistent, die Signale, die an einer behaupteten Position gesehen werden, die nach einem Beginn springt und/oder von der wahren weggeschoben wird (je LEO-Band und für das MEO-GNSS-Signal); der Empfänger sagt jede Entfernungsänderungsrate aus der Broadcast-Bahn und einer unabhängigen Vorabposition und -geschwindigkeit voraus und prüft die gemessenen Entfernungsänderungsraten mit einer verallgemeinerten Chi-Quadrat-Statistik nach kleinsten Quadraten über ein Fenster von Epochen (Uhrendrift als Störgröße oder mit einem Prior), auf den GNSS-Kanälen, den LEO-Kanälen und allen Kanälen, mit thermischem Rauschen der Frequency-Lock-Loop aus C/N0 (Kaplan & Hegarty { "2006" }, Abschnitt { "5.6.2" }); Detektionswahrscheinlichkeit aus dem nichtzentralen Chi-Quadrat-Gesetz bei einer angegebenen Fehlalarmwahrscheinlichkeit, Detektion bei einer angegebenen Wahrscheinlichkeit der Fehldetektion erklärt

# text
seg-5f341f85ac07 = Erkennung von Spoofing durch Konsistenz zwischen den Bändern eines LEO-Mehrbandsignals

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Für jeden LEO-Satelliten und jedes Paar von Entfernungsmessbändern bildet der Abschnitt <c1/> die geometriefreie Pseudoentfernungskombination, entfernt das ionosphärische Modell des Empfängers und prüft ihren Schritt von Epoche zu Epoche gegen das Coderauschen der beiden Bänder und eine angegebene tolerierte nicht modellierte ionosphärische Rate (zweiseitig gaußsch, exakte Detektionswahrscheinlichkeit); ein Spoofer, der manche Bänder fälscht und andere nicht, oder jedes Band ohne die Ionosphäre, wird bei seinem Beginn gesehen; einer, der jedes Band fälscht und die Ionosphäre simuliert, nicht, was das Ergebnis angibt

# text
seg-97dbcd5f2728 = Ionosphärensondierung: Schräg-TEC aus der Zweibandverzögerung eines LEO-Überflugs

# text
# c1: leo-pass
seg-844de34fd2f3 = Für jedes Bandpaar eines Satelliten der Art <c1/> gibt der Bericht den Schräg-Gesamtelektronengehalt an, den die geometriefreie Codekombination am Überflugmaximum zurückgewinnt, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), und sein 1-sigma aus dem thermischen Coderauschen der beiden Bänder, sodass jedes LEO-PNT-Design mit mehreren Bändern als Ionosphärensonde abgewogen werden kann

# text
seg-1fdbb476c8ab = Vertrauenswert für die Schifffahrt: die Aggregation der Evidenz der Monitore zu einem Wert von 0-100 und seinen drei Bändern

# text
seg-0d76b33144f1 = Jeder Monitor reduziert seine Evidenz auf ein Verhältnis von Statistik zu Schwelle; der Wert ist { "100" } minus die Summe über die Monitore aus Gewicht mal einer begrenzten linearen Rampe des Verhältnisses ({ "0" } bis { "0.5" }, { "1" } bei { "1.5" }), begrenzt auf { "0" } bis { "100" } und gerundet auf { "0.1" }, mit Bändern bei { "90" } und { "55" }; jede Epoche listet die Monitore auf, die abgezogen haben, und ihre Punkte.

# text
seg-51640405c9b7 = SIEM-Ereignisse der Vertrauens-Telemetrie: Log Event Extended Format (LEEF) über Syslog

# text
seg-1b3245506847 = Ereignisse bei Bandwechsel (oder je Epoche) als Nutzlasten im Log Event Extended Format { "2.0" } in einem RFC-{ "5424" }-Umschlag über UDP oder TCP, mit dokumentierter Feldzuordnung.

# text
seg-c04042b0270a = Störungsschwellen des Empfänger-Vertrauens, kalibriert am JammerTest-Datensatz { "2024" }

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: die vorab registrierte Kalibrierung der Monitore für C/N0-Abfall, AGC und Jamming-Indikator am öffentlichen JammerTest-Datensatz { "2024" } (Zenodo { "15911589" }, GPL-3.0-or-later, zur Laufzeit geladen, nie mitgeliefert): pro Ordner eine Zeitreihe von { "1" } s aus mon_rf.csv und rinex.csv, die Monitore laufen einmal, jede Epoche nach der Kalibrierung wird anhand des attack_log des Ordners als ungestört oder Jamming gekennzeichnet (von CEST nach UTC verschoben, Schutzzeit von { "60" } s), jede Schwelle wird über ein festes Raster durchgefahren, es wird die kleinste Schwelle gewählt, deren gepoolte Fehlalarmwahrscheinlichkeit bei ungestörten Epochen höchstens { "0.01" } beträgt, dazu Zählungen mit zurückgehaltenem Ordner (Leave-one-folder-out) und eine Gegenprüfung mit einem UBX-Leser. Die Auswahl wird nur als optionales Profil [monitors] profile = "jammertest-2024-calibrated" ausgeliefert (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); die Standardregel und jede Ausgabe ohne das Profil bleiben unverändert

# text
# c1: docs/MODELLED-RATIONALE.md
seg-b24486eee0fb = Quelle: <c1/>

# text
seg-34d1304c9555 = Modellierte Fähigkeiten — Begründung

# text
# c1: ExternalDataset
seg-144f441bf52b = Diese Fähigkeiten sind aus veröffentlichter oder First-Principles-Physik mit Tests implementiert, sind aber <b>ehrlich als MODELLED gekennzeichnet</b> — nicht gegen eine unabhängige externe Referenz bis auf eine angegebene Toleranz geprüft. Die Invarianztests der Matrix erzwingen, dass nur durch <c1/> gestützte Zeilen VALIDATED sein dürfen, sodass hier nichts stillschweigend befördert werden kann. Jede Zeile gibt an, warum sie modelliert bleibt.

# text
seg-0630e39b4de3 = Art der Referenz

# text
seg-bb023086bbe3 = Warum sie modelliert bleibt

# text
seg-dd6ba97ce971 = InternalConsistency

# text
seg-bac242dada9c = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe: Orekit { "12.2" } hat kein Beleuchtungsverhältnis mit Randabdunklung. Nur gegen geschlossene Formen desselben Gesetzes geprüft

# text
seg-33d506570c1b = srp_shadow::tests (die ringförmige geschlossene Form, das gleichmäßige Gesetz, das den konischen Schatten reproduziert, die Grenzfälle volle Sonne und Umbra)

# text
seg-91fe516eabd4 = ExternalDataset

# text
seg-cb2cbb31b091 = eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — NumericalPropagator/DormandPrince853 von Orekit { "12.2" } (Apache-2.0) mit ThirdBodyAttraction und SolarRadiationPressure auf dem eigenen DE440-Leser von Orekit (orekit-data lnxp1990.440), als eigenes Programm ausgeführt; kshana liest einen bitgenauen, mit SPICE geprüften Ausschnitt von NAIF de440s.bsp. Zielwerte vorregistriert in xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Der Bahn-Zielwert ({ "0.5" } m) und die Sensitivitätskontrolle sind erreicht, aber der Zielwert für die Sonnen-/Mondposition ({ "3" } m / { "0.2" } m) wurde mit { "6.39" } m / { "0.244" } m verfehlt. SPICE, das denselben Kernel zu seiner exakten TDB liest, verfehlt Orekit um denselben Betrag ({ "6.25" } m / { "0.240" } m), sodass die Lücke zwischen dem de440s-Pfad von NAIF und dem DE440-Leser oder der Zeitskala von Orekit liegt; Ursache nicht isoliert. Festgehalten und festgeschrieben, daher bleibt die Zeile MODELLED

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } Fälle x { "25" } stündliche Zustände über { "24" } h, LEO, GEO und HEO, dritter Körper und dritter Körper + SRP: schlechtestes |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; die Kontrolle mit analytischer Reihe verfehlt um { "9.96" } m; Sonne { "6.39" } m und Mond { "0.244" } m aus den DE440-Positionen von Orekit, ein festgehaltener Fehlschlag); Unit-Tests des Propagators (Ablehnung durch den Provider, über Klone geteilte Fallback-Zählung)

# text
seg-b55bcab6f986 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe für den Geopotenzial-Effekt. Die { "24" } Koeffizienten sind aus GFZ STR06/01 Tabelle { "1" } Modell N1 übertragen und Zeile für Zeile gegen den Bericht erneut geprüft (SHA-256 890865ae); die Grade { "0" }, { "1" }, { "7" } und { "8" } werden nicht verwendet. Ray und Ponte ({ "2003" }) drucken keine Tabelle sphärischer Harmonischer, sodass keine zweite Quelle verglichen wurde

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (der S1-Term ist täglich, dreht sich in einem Vierteltag um { "90" } Grad und hat die Lastfaktor-Amplitude jeder Zeile; physikalische Größenordnung im LEO); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-a192b0f512cb = eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — HolmesFeatherstoneAttractionModel von Orekit { "12.2" } (Apache-2.0) und MakeGravGridPoint von pyshtools { "4.14.1" } (BSD-3-Clause), als eigene Programme ausgeführt; Zielwerte vorregistriert in xval/high-degree-gravity/PREREGISTRATION.md (276c869f) und xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit stimmt überall überein, wo es definiert ist, aber pyshtools verfehlt seinen vorregistrierten Zielwert an den zwei polnahen Punkten (bis zu { "7.3e-10" } m/s^{ "2" }; eine 50-stellige mpmath-Prüfung legt den Fehler in pyshtools), es gibt keinen Referenzwert genau auf der Polachse, und die vorregistrierte Sensitivitätskontrolle für Grad 70 der { "24" }-h-Bahn wurde verfehlt ({ "0.726" } m gegenüber > { "1" } m). Jeder Fehlschlag ist festgehalten, nicht weggestimmt, daher bleibt die Zeile MODELLED

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit an { "8" } Punkten außerhalb der Achse: max. |da| { "2.2e-17" } m/s^{ "2" } bei N = { "70" }, läuft immer; { "3.5e-17" }, { "3.9e-17" } und { "7.3e-17" } m/s^{ "2" } bei N = { "200" }, { "360" }, { "2190" }, datengesteuert über KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs ({ "24" }-h-Bahn 200x200, datengesteuert: schlechtestes |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; Kontrolle für Grad 70 { "0.726" } m); Unit-Tests von gravity_sh (Übereinstimmung mit dem klassischen Evaluator auf { "1e-13" } bei Grad { "70" }, finite Differenz und Polkontinuität an einem Feld vom Grad 2190, ein unterlaufender Term vom Grad 2190 gegen eine Rechnung mit erweitertem Exponenten)

# text
seg-84a9851b838c = eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — BatchLSEstimator von Orekit { "12.2" } (Apache-2.0) mit eigenen momentanen geometrischen Messungen RangeRate und AzEl (gegen das TopocentricFrame von Orekit gegengeprüft), als eigenes Programm auf identischen maskierten, gesetzten Beobachtungen ausgeführt. Zielwerte vorregistriert in xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Jeder Zielwert erreicht außer B4, der rauschfreien Zustandsübereinstimmung von { "1" } cm, verfehlt bei { "2" } von { "4" } Szenarien ({ "1.46" }, { "1.74" } cm): Die eigene rauschfreie Schätzung von Orekit liegt so weit von seiner simulierten Wahrheit entfernt (Ursache auf Orekit-Seite nicht isoliert). Festgehalten und festgeschrieben, daher bleibt die Zeile MODELLED. Nicht modelliert: Lichtlaufzeit, Aberration, Refraktion, Erdrotation, ein sequenzieller Filter für diese Messarten

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } Szenarien: Entfernungsrate, Az/El und gemischt, LEO und MEO, rauschfrei und mit gesetztem Sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, Masken von { "5" } und { "10" } Grad, gegen Orekit { "12.2" }: Mengen sichtbarer Satelliten identisch; Messwerte innerhalb von { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad; STM innerhalb von { "1.2e-14" } relativ; verrauschte Zustände innerhalb von { "1.74" } cm und { "1.14e-5" } m/s; Post-Fit-RMS je Art innerhalb von { "2.7e-4" } relativ; rauschfreies kshana gegen die Wahrheit { "1.06e-8" } m; rauschfreies kshana gegen Orekit { "1.464" } und { "1.740" } cm bei zwei Szenarien, ein festgehaltenes Verfehlen des Zielwerts von { "1" } cm); Unit-Tests von orbit_determination und batch_ls

# text
seg-a5554f29b2d7 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe: Die Gewichte sind eine Modellierungsentscheidung (das SP3-Format definiert den Code nur als Genauigkeitsindikator des Erzeugers; er wird hier als Einzel-Sigma je Achse gelesen). Die bestehenden aufgezeichneten Agenturläufe sind unverändert

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = Unit-Tests von src/sp3.rs; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (eingecheckte { "8" }-h-ESOC-Fixture, Sigma { "0.032" } m aus dem Kopfexponenten { "5" }: Tier-1-3D-RMS { "0.132" } m unverändert, Tier-2 { "0.035" } m gegenüber { "0.070" } m bei Sigma { "1" } m, wobei die Änderung aus der neu austarierten empirischen A-priori-Bedingung stammt); tests/agency_swarm.rs (das Swarm-Produkt trägt keine Genauigkeitscodes und fällt zurück, festgeschrieben)

# text
seg-a5ad470a4816 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Nur interne Konsistenz. Jedes veröffentlichte Feld ist im körperfesten System seines Erzeugers definiert (GMM-3 im Mars-System von Konopliv et al. { "2006" }, GL0660B im Hauptachsen-System des Mondes von DE421), während das Feld im IAU-System ausgewertet wird; der Versatz ist nicht modelliert

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-eff90f999826 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interner Rundlauf und bekannte ICD-Antworten; kein Dekoder eines Dritten wurde ausgeführt (der RTKLIB/GNSS-SDR-Aufbau, der KSHANA_NAVMSG_ORACLE_JSON liest, ist datengesteuert). MODELLED

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (CRC-24Q-Prüfwert 0xCDE703; Faltungs-Impulsantwort; Viterbi korrigiert eingespeiste Fehler; Layoutbreiten); tests/gnss_navmsg_roundtrip.rs (Feldstartbits entsprechen den ICD-Bitnummern; Kodieren -> FEC -> Interleaving -> Viterbi -> Dekodieren läuft innerhalb eines halben LSB im Kreis); tests/gnss_navmsg_galileo_brdc_grid.rs (IGS-BRDC-2018-133-Galileo-Datensätze auf dem LSB-Raster, schlechtestes { "3.6e-3" } LSB; vorregistrierter Zielwert für die Satellitenzahl verfehlt, { "15" } von { "20" }, FINDING)

# text
seg-81b76a6d1bcd = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — FINDING gegen die veröffentlichte ITRF2020-Koordinate von WTZR: Die vorregistrierten Zielwerte (geglätteter Median und p95 höchstens { "0.6" } x roh; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) wurden verfehlt, Verhältnisse { "0.718" } und { "0.923" }; der verbleibende Fehler im Meterbereich ist biasartig (C1C-Code-Bias, Antenne, Gezeiten, langperiodischer Mehrwegeempfang), nicht das weiße Rauschen, das die Glättung entfernt. MODELLED: Die Statistik des Filters wird intern geprüft

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (rauschfreies Durchreichen; Varianz weißen Rauschens 1/(2N-1); Neustarts); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } Epochen, N = { "100" }: mittlerer 3D-Fehler { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-1bbd39c17347 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Formatprüfung an einer echten veröffentlichten RINEX-{ "4.00" }-Datei (zurückgelesene Werte entsprechen den gedruckten Literalen der Datei) und einem aus der Spezifikation abgeleiteten Kopf; es wurde kein unabhängiger Leser ausgeführt, daher MODELLED

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (erste { "4" } Epochen der IGS-MGEX-RINEX-{ "4.00" }-Datei MAO000USA_R_20231980000_01D_30S_MO, { "58" } Satelliten, { "7" } Systeme: Kopfsätze und Werte der ersten Epoche entsprechen den veröffentlichten Literalen); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (synthetischer Kopf { "4.02" } aus der Spezifikation)

# text
seg-5afb3c4bf171 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Vorregistriert (7aa264b, 110fef9) gegen eine präzise IGS-MGEX-Bahn mit den GEOs; kein solches Produkt war aus der Sitzung erreichbar, die es gebaut hat, daher steht der Vergleich aus und die Zeile ist MODELLED (nur gegen die veröffentlichten nominalen GEO-Slots geprüft)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (echte Datensätze C01-C04: geostationärer Radius, Längen 140.02/80.04/110.55/159.99 Grad auf den veröffentlichten Slots, |Breite| { "2.13" } Grad mit der Neigung gegenüber { "6.65" } ohne; der vorregistrierte Vergleich Rundsendung gegen präzises SP3 ist datengesteuert über KSHANA_BDS_GEO_SP3 und wurde nicht ausgeführt); rinex::tests

# text
seg-70f61250d256 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Die Messungen werden aus den Modellen synthetisiert, die der Filter verwendet (χ² NEES/NIS über Seeds, eine rauschfreie Konvergenz, Sprung-Einspeisung). MODELLED; es werden keine echten Empfängerdaten oder Filter Dritter verglichen

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (Fahrt in Form einer 8: stationäres 3D-RMS { "0.025" } m Träger gegenüber { "0.470" } m Code bei identischen Messungen; { "12" } Seeds mittleres NIS/dof { "1.00" } und stationäres NEES/dof { "0.92" }; ein 1-Zyklus-Sprung wird in seiner Epoche ohne Fehlalarme erkannt, und die Lösung bleibt intakt; das Abschalten der Rundsende-Korrekturen erhöht den Codefehler von { "0.51" } m auf { "19.6" } m (Iono) und { "8.0" } m (Tropo); der rauschfreie Lauf konvergiert auf { "0.3" } mm)

# text
seg-6f3f6483690e = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Intern: die Gütemaße jedes Pakets gegen seine eigene Wahrheit und ein Vergleich lose/eng auf identischen Eingaben. MODELLED; der NaveGo-Vergleich des Audits wurde nicht ausgeführt

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), Szenarien gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (jedes Paket: fusioniert unter dem freien INS über den Ausfall für beide Sensoren; Schiene: eng { "5.3" } m gegenüber lose { "12.9" } m in Navigationsqualität und { "15.6" } m gegenüber { "18.8" } m taktisch über den Ausfall, Verfügbarkeit { "0.97" } gegenüber { "0.95" }; eng-Tabelle validiert); tests/gnss_ins_legacy_trajectory_pin.rs (der lose gekoppelte Standard bitidentisch)

# text
seg-2c7c37506aab = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Die Wahrheit wird aus den eigenen Modellen der Filter simuliert (χ² NEES über Monte-Carlo-Seeds, das entkoppelte Paket auf identischen Sensoren). MODELLED

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (3D-Filter über { "60" } Seeds: mittleres NEES der zweiten Hälfte { "8.12" } für { "8" } Zustände, χ²-Summe der letzten Epoche innerhalb ihres { "95" }-%-Bandes; eine Uhrkorrektur von { "0.1" } ns senkt das 3D-Positions-Sigma von { "5.58" } m auf { "3.07" } m; Bias-Filter über { "60" } Seeds: χ²({ "5" })-Summe im Band, Bias innerhalb von { "3" } Sigma in { "59" } von { "60" }; fusion-pnt-coupled mit verzerrten Beschleunigungsmessern: Position p95 { "18.7" } m / { "90.0" } m und Integrität { "1.00" } / { "0.97" } gekoppelt gegenüber { "430" } m / { "4060" } m und { "0.006" } / { "0.000" } entkoppelt); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion und hybrid ohne [coupled] bitidentisch)

# text
seg-0866862d2264 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Intern: Identitäten der Starrkörperkinematik, der CSV-Rundlauf und die eigene Kovarianz des Filters. MODELLED (es wird kein echtes Fahrtlog verglichen)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (koordinierte Kurve hat keine Seitenkraft und Lastfaktor 1/cos φ; CSV-Import reproduziert ein geflogenes Profil auf { "1e-3" } m/s und { "1" } m); tests/gnss_ins_trajectory_library.rs (jedes Profil läuft, und die Fusion schlägt das freie INS über den Ausfall; jedes fliegt seine benannte Bewegung; Beobachtbarkeit des Steuerkurses: Gier-Sigma nach { "240" } s { "1.27" } Grad bei Geradeausfahrt gegenüber { "0.039" } Grad bei der 8 und { "0.062" } Grad bei Stop-and-go); tests/gnss_ins_legacy_trajectory_pin.rs (Altergebnis und Wahrheits-Hashes bitidentisch)

# text
seg-5cb3b7bba7be = eine Teilbehauptung ist extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Gemessen gegen die rekonstruierte CAPSTONE-Ephemeride von JPL Horizons (NAIF -1176, CAPSTONE_merged, mondzentriertes ICRF, 2023-03-01..31 bei { "10" } min), Byte für Byte eingecheckt (tests/fixtures/capstone_horizons/, NOTICE.md), vorregistriert { "4e868170" }, bevor sie abgerufen wurde, als Messung mit Zielwerten auf der mittleren Geometrie. Keine Validierung: Das CR3BP lässt die Sonne, die Exzentrizität des Mondes und die von CAPSTONE durchgeführte Bahnhaltung weg, sodass die Zielwerte beschreiben, wie repräsentativ die Modellbahn ist, nicht eine Genauigkeit. Ergebnisse: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE März { "2023" }, { "4" } Perilunen und { "5" } Apolunen: Periode { "6.5004" } d gegenüber { "6.5699" } d ({ "1.07" } %, Zielwert { "3" } %), Apolun { "71 182" } gegenüber { "71 215" } km ({ "0.05" } %, Zielwert { "5" } %), Perilun { "3 385" } gegenüber { "3 245" } km ({ "4.1" } %, Zielwert { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-30e946bde474 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz gegen eine geschlossene Form: Unter dem linearen Gauß-Modell ist die Kleinste-Quadrate-Kovarianz sigma^{ "2" } (H^T H)^-1 (Kaplan und Hegarty (Hrsg.), Understanding GPS: Principles and Applications, 2. Aufl., Artech House, { "2006" }, Kap. { "7" }). Methode und Toleranzen der Geometrie-Entwurfsnotiz { "0.36" }, Abschnitt { "5.2" }, in einem Vorregistrierungs-Commit vor dem ersten Lauf festgelegt: jede Varianz innerhalb von { "5" } % ({ "5" } Standardfehler einer Stichprobenvarianz bei N = { "20,000" }), jedes RMS innerhalb von { "2.5" } %, die Ost-Nord-Korrelation innerhalb von { "0.035" } (5/sqrt(N)), jeder Mittelwert innerhalb von { "5" } Standardfehlern, der Anteil der { "95" }-%-Ellipse innerhalb von { "0.95" } +/- { "0.0077" } ({ "5" } binomiale Standardfehler); Negativkontrollen (PDOP verdoppelt; Fehler, die wie 1/sin(Elevation) gegen das ungewichtete Q wachsen) müssen fehlschlagen. WIE ES SICH ZUSAMMENSETZT: Q ist der Kovarianzfaktor des Kernels orbit::dop, VALIDATED gegen gnss_lib_py { "1.0.4" } an denselben { "8" } Geometrien in tests/dop_reference.rs (Zeile 'GNSS geometry / dilution of precision'); diese Zeile fügt den Schritt von diesen Faktoren zu Metern durch den Löser der Engine hinzu und übernimmt den Status jener Zeile nicht. WARUM MODELLED: Es ist kein externer Datensatz beteiligt; die Übereinstimmung zeigt, dass Schätzer und Rauschen unter dem Lehrbuchmodell sigma x DOP verwirklichen, nicht dass der Fehler irgendeines Empfängers UERE x DOP entspricht, und sigma_UERE ist eine Eingabe

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: alle { "104" } Prüfungen bestehen beim ersten Lauf nach der Vorregistrierung e50c88d2, schlechteste Varianz { "3.2" } %, RMS { "1.6" } %, Korrelation { "0.012" }, Mittelwert { "2.2" } Standardfehler, Ellipsenanteil { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: beide Kontrollen schlagen wie erforderlich fehl; position_error_is_sigma_times_dop_on_masked_skies: die zwei Geometrien mit maskierter Skyline der Entwurfsnotiz, der Himmel 10sat-mixed unter den Voreinstellungen city-street ({ "4" } Satelliten, PDOP { "16.6" }) und container-terminal ({ "9" } Satelliten, PDOP { "2.5" }), alle { "26" } Prüfungen bestehen beim ersten Lauf nach der Vorregistrierung 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (eine erste, separate Prüfung an vier von Hand gewählten Himmeln (offen, gehäuft, Schlucht, halber Himmel; Sigma { "1" } m, Seed 0x0D0B5EED) mit Chi-Quadrat-Konfidenzintervallen bei insgesamt { "1e-6" } über { "20" } Prüfungen: Verhältnisse { "0.987" } bis { "1.009" }, das eigene PDOP/GDOP des Lösers gleich dem des Kernels auf { "2.5e-12" } und Negativkontrollen für einen DOP-Fehler von { "10" } % und Fehler wie 1/sin(Elevation); vor der Vorregistrierung ausgeführt, daher berichtet, nicht vorregistriert); dop_error_mc::tests; dop_error_ci::tests

# text
seg-d40d54b79e58 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Die Klassifikation wird gegen die Regeln, die sie angibt, und gegen von Hand abgeleitete Verhältnisse an synthetischen Änderungen des eingecheckten Demo-Logs geprüft, und die Keine-Änderung-Pins halten die Ausgaben von { "0.35.0" } fest: Kein Wert ändert sich, außer wenn die Geometrie schlecht ist; die Kennzeichnung wird immer gemeldet. WARUM MODELLED: Die Schwellenwerte sind gewählt, nicht angepasst (Herkunft im geometry_model jedes Laufs; die Zahlen von IEC 61108-1 und GPS SPS wie zitiert, noch gegen den Text der Standards zu prüfen), und es gibt keinen externen gekennzeichneten Datensatz natürlicher Geometrieverschlechterung gegenüber Angriffen, gegen den die Klassifikation validiert werden könnte. Das abgeleitete DOP verwendet den Kernel orbit::dop wieder, VALIDATED gegen gnss_lib_py, dessen Status diese Zeile nicht übernimmt. Eine Geometrieklasse ist eine Aussage über den Himmel, keine Feststellung, dass kein Angriff stattfand

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: Auf der synthetischen Fjordpassage von scenarios/training/fjord-natural-degradation.toml werden dieselben { "624" } Epochen mit und ohne die angegebene [skyline] abgezogen; mit ihr wird sky-blocked in { "680" } Epochen gemeldet ({ "0" } ohne: Der Rückfall auf die Azimutlücke sieht in einem beidseitigen Fjord nichts), open_fraction ist { "0.758" }, und die Epochen der Klasse environment fallen von { "78" } auf { "33" }, der Rest sind Verluste von Satelliten, die die angegebene Skyline im Freien lässt; außerhalb des Ereignisses ändert die Skyline keinen Wert); receiver_trust::geometry::tests (von Hand abgeleitete Verhältnisse an den Schwellenwerten, die Schwellenwertgrenzen, die Rampe und Obergrenze, die Untergrenze, die Kennzeichnungsgrenzen, [geometry]-Überschreibungen, das DOP auf dem validierten Kernel, gehaltene und abgelaufene Himmel, unbekannt nicht geraten, Signalverlust, die Toleranz für schlechte Geometrie, Sentinel-Werte ohne Lösung); tests/geometry_trust.rs (ein mittlerer maskierter Himmel gekennzeichnet und nicht bewertet, ein schlechter maskierter Himmel, ein Verlust bei niedriger Elevation, ein Leistungsabfall, ein gefälschtes HDOP, totaler Signalverlust, ein Wegziehen bei schlechter Geometrie, unbekannte Geometrie, Sitzungs-Überschreibungen, das Live-Schema); tests/geometry_trust_no_change.rs (beide Beispielsitzungen byteidentisch mit { "0.35.0" }, sobald die angehängten Schlüssel entfernt sind); tests/geometry_corpus_identity.rs (jedes eingecheckte Schiffs-NMEA-Korpus, auch als GPS-only offener Himmel, und die Crew-Trainingsszenarien: byteidentisch mit { "0.35.0" } außer bei schlechten Epochen, die sich allein durch den Geometrie-Abzug unterscheiden)

# text
seg-7e9cae219d72 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Intern: Die geschlossenen Formen werden gegen von Hand berechnete Werte geprüft (Wandkronen-Elevationen einer angegebenen Straße, die Bedingung des offenen Endes, der Krümmungsabfall eines angegebenen Punkts). Keine externe unabhängige Referenz: Die Entwurfsnotiz fasst diese Reduktionen als MODELLED, und der ElevationMask von Orekit nimmt eine Tabelle, sodass der Vergleich der Zeile 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' deren 360-Punkte-Tabellen als Eingaben liest und sie nicht prüft

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-7ade0dffb2d8 = gegen die eigene geschlossene bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine: gewählte und angegebene Abmessungen, keine Vermessung irgendeiner Straße, eines Hafens, Fjords oder Terminals (das Seitenverhältnis der Straße liegt im Band 0.5-2 von Oke ({ "1988" }); der Fjord ist von der Größenordnung der westnorwegischen Fjorde; die Stapel verwenden die High-Cube-Höhe nach ISO { "668" }). Der Test prüft die Voreinstellungen gegen ihre eigenen angegebenen Abmessungen, eine Übertragungsprüfung, die die Validierungsregel nicht zählt

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-00884df89ab2 = ReferenceImpl

# text
seg-2ddc2b97e673 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Die Einzeluhr-DOP-Faktoren beruhen auf dem Kernel, der gegen gnss_lib_py { "1.0.4" } validiert ist (Zeile 'GNSS geometry / dilution of precision (DOP)'); die eigenen Prüfungen dieser Zeile sind intern: sky_geometry reproduziert orbit::dop und dop_cov auf derselben Geometrie, die Ellipse reproduziert eine analytische 2x2-Eigenzerlegung, ECEF- und Azimut/Elevation-Eingaben stimmen überein, und das RMS und die { "95" }-%-Einschließung der gesetzten Wolke stimmen mit der Geometrie überein. Die ENU-Kovarianz mit einer Uhr je System und die Ellipse sind VALIDATED in der Zeile 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); was hier MODELLED bleibt, ist die Zusammensetzung: die Propagation der Voreinstellung zu einem repräsentativen Himmel, die Monte-Carlo-Wolke (gegen die Geometrie geprüft, die sie abtastet, eine Selbstkonsistenzprüfung) und die Flächen. Die Konstellations-Voreinstellungen ergeben einen repräsentativen Himmel, keinen datierten; das Gauß-Fehlermodell und die UERE sind angegebene Eingaben, keine gemessene Genauigkeit und keine Integritätsschranke

# text
seg-4e6101547ab1 = Geometrie; Orbit (cofactor_from_los, dop_cov, dop); Oberfläche (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (der Ein-Uhr-Kernel gegen gnss_lib_py)

# text
seg-0b5caf359b15 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — mehrstufige clock_state-Kovarianzrekursion (Gegenprüfung in derselben Codebasis); der zugrunde liegende Kernel für Coast-Varianz und Holdover-Inversion ist extern gegen scipy validiert (siehe 'Clock-holdover coast-variance & threshold inversion'). Die Holdover-Werte je Klasse mit rotem Rauschboden bleiben MODELLED

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (gegen die mehrstufige Kalman-Kovarianzrekursion; weißes FM exakt; Round-Trip); Coast-Varianz-Kernel extern validiert in tests/gnss_denied_clock_holdover_reference.rs (gegen scipy Van-Loan/brentq)

# text
seg-8b8c97b664c2 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Gemessene Aufzeichnungen, zurückgehalten: kombinierte IGS-Final-Uhren mit { "30" } s der { "11" } GPS-Block-IIF-Satelliten über 2026-03-01 bis { "14" } (ein Zeitfenster, das kein Test geöffnet hatte; IGS, offen mit Namensnennung) und der u-blox-ZED-F9P-Empfänger des JammerTest { "2024" } in seinen nicht gewerteten stationären Sitzungen (GPL-3.0-or-later). D9, externer Vergleich (vorregistriert 2ec76864, die vorhergesagte / gemessene Allan-Abweichung jeder Karte innerhalb von [1/1.5, { "1.5" }] bei ihren angepassten Mittelungszeiten), ein Befund (bleibt MODELLED): { "10" } von { "11" } GPS-IIF-Karten liegen innerhalb des Zielwerts; G27 ist auf der Zwei-Stunden-Skala optimistisch ({ "0.662" } bei { "7680" } s, schlechtester Faktor { "1.510" }), dem periodischen Fehler im Stundenbereich, den eine Potenzgesetz-Karte nicht abbildet. Die Karte des Empfänger-TCXO ist blockiert: Außerhalb der protokollierten Übertragungen lassen die übrigen Sitzungen des Datensatzes { "167" } Epochen gegenüber den geforderten { "3600" }. Berichtet, nicht blind (Aufzeichnungen, die durch frühere Zeilen geöffnet wurden): Die Karte der 5071A-Cäsiumuhr liegt innerhalb des Zielwerts (schlechtester Wert { "1.070" } bis { "4096" } s), die OCXO-Karte ist konservativ und liegt außerhalb ({ "2.348" } bei { "128" } s; ihr Rauschboden ändert sich während der Aufzeichnung), und die Karte der Norcia-Strontiumuhr, angepasst an die drei kürzesten veröffentlichten Punkte, liegt an den zwei gewerteten Punkten innerhalb davon ({ "1.291" }, { "1.405" }). Passive Wasserstoff-Maser von Galileo (keine ohne Anmeldung erreichbare Quelle für endgültige Galileo-Uhren) und die Deep Space Atomic Clock (ein offener Wert im Weltraum) sind blockiert. D9, Runde { "2" }, der Empfänger-TCXO des ZED-F9P als Modellklasse an { "14" } Tagen von { "12" } statischen Stationen in Wroclaw (Zenodo { "6488497" }, CC BY { "4.0" }; vorregistriert fb475550), ein Befund: Mit der registrierten Pipeline waren { "11" } von { "12" } Stationen nicht auswertbar (RAIM verwarf die meisten ionosphärenfreien Epochen) und BX14 scheiterte; ein offengelegter erneuter Lauf mit korrigierter Pipeline (vorregistriert c9cc0d49) besteht { "1" } von { "11" } blinden Stationen (BX12, { "1.412" }; BX07 { "1.532" } und BX13 { "1.542" } knapp außerhalb), weil Einzelpunkt-Empfängeruhren aus unterbrochenen Dateien mit { "30" } s keine saubere Oszillatoraufzeichnung sind

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; vorregistriert 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; datenabhängig freigegeben)

# text
seg-a2202f0e06b2 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Gemessene Aufzeichnungen, zurückgehalten: kombinierte IGS-Final-Uhren mit { "30" } s der { "11" } GPS-Block-IIF-Satelliten über 2026-04-01 bis { "14" } (ein Zeitfenster, das kein Test geöffnet hatte; IGS, offen mit Namensnennung). D9, externer Vergleich (vorregistriert fb475550, vorhergesagte / gemessene Allan-Abweichung innerhalb von [1/1.5, { "1.5" }] bei jeder angepassten Mittelungszeit auf jedem Satelliten), ein Befund (bleibt MODELLED): { "9" } von { "11" } Karten liegen innerhalb des Zielwerts; G03 ({ "1.947" }) und G25 ({ "1.581" }) sind zwischen { "60" } s und { "2000" } s optimistisch, weil ihre zurückgehaltenen Aufzeichnungen verrauschter sind als ihre Anpassungsdrittel (der zurückgehaltene Teil von G25 enthält { "16" } Lücken und { "29" } Phasenausreißer), eine Änderung der Uhr statt eines fehlenden periodischen Terms. Das Weglassen der periodischen Terme aus der Vorhersage lässt alle { "11" } Karten scheitern ({ "1.77" } bis { "4.96" }), die Terme tragen also die Vorhersage

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; vorregistriert fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-1c858b039ab0 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), mit F über scipy.linalg.expm und Q über die Blockmatrix nach Van-Loan { "1978" } — eine unabhängige Referenzimplementierung, die die gesamte Filtertrajektorie von kshana reproduziert. Konsistenz zwischen Implementierungen: Die Uhrenphysik / Allan-Kalibrierung sind nicht extern validiert, daher bleibt dies MODELLED. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): An IGS-Final-Uhren mit { "30" } s von { "11" } GPS-Block-IIF-Satelliten (2025-08-17 bis { "30" }), mit an die ADEV der ersten Hälfte angepasstem Q und dem an der zurückgehaltenen zweiten Hälfte bewerteten Filter, ist der Filter einen Schritt voraus konsistent ({ "0.906" } bis { "0.971" } der Epochen innerhalb seines { "95" }-%-Bandes, Zielwert { "90" } %), aber bei einer Stunde an { "9" } von { "11" } Uhren überzuversichtlich ({ "0.486" } bis { "0.829" }), und seine Innovationssummen liegen bei { "5" } außerhalb von [{ "2.4" }, { "3.6" }]. Das angepasste weiße Phasenrauschen ist auf jedem Satelliten null, und der Fehler im Stundenbereich (periodische Terme, Flicker-FM) ist nicht im 3-Zustands-Modell enthalten. { "0.30" }, Runde { "2" }, ein erweiterter Filter (Flicker-FM sowie Zustände mit einer und zwei Perioden pro Umlauf) an frischen zurückgehaltenen IGS-Uhren von 2025-09-01 bis { "14" } (vorregistriert 4b1a841e), ein Befund (bleibt MODELLED): Die Konsistenzkriterien für einen Schritt und für eine Stunde gelten auf allen { "11" } Satelliten ({ "0.948" } bis { "0.988" } und { "0.907" } bis { "0.996" }), aber das Kriterium der Innovationssumme scheitert bei G24 ({ "0.964" }) und G30 ({ "1.929" }) gegenüber [{ "2.4" }, { "3.6" }]. D9, Runde { "3" }, der erweiterte Filter aus Runde 2, Abstimmung und Kriterien unverändert nach dem eingefrorenen Konditionierungsdetektor der clock_library, an frischen IGS-Uhren von 2026-04-01 bis { "14" } (vorregistriert fb475550), ein Befund (bleibt MODELLED): (a) ein Schritt { "0.941" } bis { "0.968" } und (c) Dreifach-NIS-Mittelwert { "2.641" } bis { "3.549" } gelten auf allen { "11" } Satelliten; (b) eine Stunde scheitert bei G09 ({ "0.894" }) und G26 ({ "0.876" }) gegenüber { "0.90" }

# text
seg-3016100a7015 = clock_state::tests (analytisches van-Loan-Q; NEES; Positivität der PSD); tests/clock_state_reference.rs (vollständige Predict+Update-Trajektorie — Zustand x und { "3" }×{ "3" }-Kovarianz P über { "1925" } Schritte / { "4" } Parametersätze gegen filterpy { "1.4.5" }; schlechtester |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (legt den Befund fest); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9, Runde { "3" })

# text
seg-27554b73549b = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Sagnac-Betrag gegen einen maßgeblichen VERÖFFENTLICHTEN WERT geprüft — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Gl. { "1.29" }: Eine ostwärts gerichtete Umrundung am Äquator ergibt { "207.4" } ns (2ωA_E/c²); kshana reproduziert { "207.386" } ns. Unabhängig bestätigt durch RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), das dieselbe 2Aω/c²-Geometrie enthält. Das zusammengesetzte BIPM-Budget aus TWSTFT-Transponder/Common-View/PPP hat keine externe unabhängige Referenz, daher bleibt die Fähigkeit modelliert

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (reziproke Auslöschung; Sagnac-Identität in zwei Formen); tests/time_transfer_error_budgeting_reference.rs (Sagnac bei Umrundung am Äquator = { "207.386" } ns gegenüber dem veröffentlichten Ashby-Wert { "207.4" } ns bis auf <{ "0.05" } ns; zudem Sagnac-/geodist-Geometrie gegengeprüft mit RTKLIB { "2.4.3" } geodist(), aus C-Quelltext kompiliert)

# text
seg-a5714c98b299 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Kreuz-/Autokorrelation der GPS-C/A-Gold-Codes stimmt EXAKT überein (ganzzahlig ±65/−1/63) mit der unabhängigen Codeerzeugung nach IS-GPS-200; PSD-Form von BPSK-R({ "1" })/BOC({ "1,1" }) gegen ein unabhängiges scipy-Periodogramm. Die geschlossenen Formen für Modulation/SSC/DLL (Betz { "2001" } / Kaplan & Hegarty) bleiben analytisch, daher bleibt die Zeile MODELLED — aber der Teilanspruch zur Codekorrelation ist extern abgeglichen. { "0.30" }, Runde { "2" }, gegen die gedruckten Werte von Betz { "2001" } und Hein et al. { "2006" } (vorregistriert 9f4f2ce8, eine halbe gedruckte Einheit), ein Befund (bleibt MODELLED): Alle { "45" } spektralen Zellen aus Tabelle { "1" }, die Korrelationswerte bei { "1" } GHz, die MBOC-Störungswerte und { "2" } von { "3" } Versätzen aus Abb. { "17" } stimmen überein; die ersten Nebenmaxima bei { "24" } MHz, der Versatz von BOC({ "8,4" }) aus Abb. { "17" } und jeder Worst-Case-Mehrwegefehler aus den Abb. 18-21 ({ "11" } bis { "15" } % zu niedrig) stimmen nicht überein. Kshana und eine unabhängige NumPy-Auswertung der vorregistrierten Lesart stimmen überein, die Abweichung liegt also in dieser Lesart oder in einem nicht angegebenen Detail der Veröffentlichung; Ursache ungeklärt

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (BPSK-Eigen-SSC = 2/3R_c; PSD mit Flächeneinheit; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS-C/A-Gold-Kreuz-/Autokorrelation stimmt ganzzahlig exakt mit der unabhängigen Codeerzeugung nach IS-GPS-200 überein; PSD von BPSK-R({ "1" })/Sinus-BOC({ "1,1" }) gegen ein unabhängiges scipy-Periodogramm); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, festgelegt)

# text
seg-9fe0ec8c4531 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Veröffentlichte numerische Vektoren aus CAI-Primärarbeiten (Cheinet { "2008" }, Übertragungsfunktion; Peters/Freier, Empfindlichkeit): k_eff·T² stimmt exakt überein, die Schrotrausch-ASD ist eine einseitige Untergrenze innerhalb von ~{ "2" }× jedes veröffentlichten Instruments (reale Geräte haben technisches Rauschen oberhalb der Quantengrenze). Eine Eingrenzung, keine Übereinstimmung. { "0.30" }, Runde { "2" } (vorregistriert fcb9ac64), ein Befund (bleibt MODELLED): Das reine QPN-Rotationsrauschen ergibt gegenüber den gemessenen Punkten aus Gauguet et al. { "2009" }, Abb. { "14" } Verhältnisse von { "0.695" } bis { "0.788" } an den drei zugelassenen Punkten ({ "0.751" } am Betriebspunkt) und verfehlt den vorregistrierten Zielwert von { "30" } % um { "0.5" } Punkte; die QPN-Untergrenze liegt { "21" } bis { "31" } % unter dem gemessenen Rauschen, wie es bei einem Modell ohne Laser- und Detektionsrauschen zu erwarten ist. Die Gradiometer-Komposition stimmt mit der QPN-Modelllinie von Janvier et al. { "2022" } überein (Verhältnis { "1.013" } bis { "1.017" }, Referenz). Der gemessene Test kann einen Kompositionsfehler von sqrt({ "2" }) nicht unterscheiden; nur die Janvier-Linie mit ungleichem Kontrast kann das

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Eingrenzung der Untergrenze nach Freier 2016); tests/quantum_inertial_sensor_reference.rs (Übertragungsfunktion |H(ω)|, k_eff·T² und Schrotrausch-ASD gegen veröffentlichte numerische Vektoren von Cheinet { "2008" } / Peters / Freier); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, festgelegt; gradiometer_qpn_line_matches_janvier_model)

# text
seg-0b9af8a14a54 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Selbstkonsistenz des Interferometer-Streifenmodells: die Halbstreifenkante, die 2π-periodische Aliasing-Struktur und die Kürzung des Skalenfaktors im Verhältnis aus Bereich und Auflösung sind geschlossene algebraische Identitäten, geprüft gegen die eigenen Mach-Zehnder-Phasen- und Empfindlichkeitsfunktionen der Engine — Prüfungen der internen Konsistenz, KEIN externer Datensatz, daher bleibt die Zeile InternalConsistency. MODELLED idealisierte Streifenmehrdeutigkeit mit drei Pulsen; keine Grenzen für Wellenfrontaberration oder Kontrastverlust beim eindeutigen Bereich

# text
seg-81802510f112 = quantum_imu::tests (a_max liegt an der Halbstreifenkante bei ±π mit der 1/T²-Bereichsskalierung; die Rückgewinnung der umgebrochenen Phase ist innerhalb von [−a_max,a_max] exakt und alias-behaftet um genau { "2" }·a_max außerhalb davon; der eindeutige Dynamikbereich a_max/σ_a=π/σ_Φ ist über zwei sehr unterschiedliche Skalenfaktoren für Wellenlänge/T identisch; die CaiAccelerometer-Methoden stimmen mit den freien Funktionen überein)

# text
seg-91728172ea50 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Unabhängige numpy-Monte-Carlo-SDE-Integration von doppelt integriertem weißem Beschleunigungsrauschen (validiert die analytische VRW-Varianz durch einen wirklich unabhängigen Algorithmus) + ein Ankerwert aus Groves { "2013" } (veröffentlichter Wert) für die Bias-/Skalenfaktor-Terme; die Zahlen der CAI-Geräte quantifizieren Partner-Hardware und bleiben MODELLED

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (Bias gegen AccelModel-Integrator; VRW gegen analytisches Integral); tests/quantum_inertial_dead_reckoning_reference.rs (VRW gegen eine unabhängige numpy-Monte-Carlo-Doppelintegration von weißem Beschleunigungsrauschen, größte Abweichung { "0.42" } % innerhalb von ±{ "3" } % über { "6" } Coast-Zeiten; Bias/Skalenfaktor gegen einen Wert in geschlossener Form aus Groves { "2013" }; Holdover-Round-Trips)

# text
seg-8bc5bc7d553c = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Gleichung des Anti-Jam-C/N₀-Linkbudgets, gegengeprüft mit einer unabhängigen numpy-Neuherleitung (teilt dieselbe geschlossene Form → InternalConsistency) sowie einer Charakterisierung der C/N₀-Verschlechterung aus dem realen JammerTest-2024. { "0.30" }, Runde { "2" }, blockiert (bleibt MODELLED): Der gemessene C/N0-Abfall des JammerTest { "2024" } gegenüber einer Linkbudget-Vorhersage (vorregistriert 6a66994b, innerhalb von { "3" } dB) wurde nicht ausgeführt, weil Position und Ausrichtung der F8.1-Antenne in Bleik und der L1-Anteil der Mehrband-Rampenleistung { "1.6.4" } im Testkatalog und im offiziellen Protokoll nicht dokumentiert sind

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form und cw_q_equals_the_spectral_separation_closed_form: die Q-Tabelle, CW und Schmalband { "1" }, Breitband und Sweep { "2" }, festgelegt auf die geschlossenen Formen aus navsignal; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/effektives C-N₀ gegen eine unabhängige numpy-Neuherleitung des Linkbudgets nach Kaplan & Hegarty §{ "9.4" }; reales JammerTest-C/N₀ fällt monoton durch die Schwelle von { "25" } dB-Hz); tests/jamming_jammertest_cn0_oracle.rs (vorregistriert, blockiert, nicht ausgeführt)

# text
seg-26b6c4436ca0 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — TEXBAT-Szenarioparameter (Humphreys { "2012" }) — Charakterisierung, keine festgelegten Vektoren. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): Am JammerTest { "2024" } (Bleik; GPL-3.0-Daten) lösten die Monitore auf Beobachtungsebene (uhrgestütztes Chi-Quadrat, RAIM, Lösungsfehler) innerhalb von { "10" } s nach keinem der { "8" } auswertbaren veröffentlichten Spoofing-Beginne einen Alarm aus (wo das Fenster vor dem Beginn sauber war, kam der erste Alarm { "10.2" } bis { "39" } s nach dem veröffentlichten Beginn des Zeitfensters), und drei Fenster vor dem Beginn enthielten Fehlalarme des Uhrenmonitors ({ "81" }, { "64" } und { "173" } Epochen). Der erste beobachtbare Effekt war ein Verlust der Zweifrequenz-GPS-Verfolgung, keine RAIM-Inkonsistenz. Die veröffentlichten Beginne sind auf die Minute aufgelöste Beginne von Zeitfenstern im Plan; dass sie der HF-Aufzeichnung vorausgehen, ist eine Interpretation, keine Messung. { "0.30" }, Runde { "2" }, gegen das offizielle Protokoll der Veranstalter zum JammerTest { "2024" } (sekundengenau; vorregistriert 6a66994b mit einem Hadamard-kalibrierten Uhrenmonitor mit drei Zuständen ohne Einrasten), ein Befund (bleibt MODELLED): Der Monitor schlägt bei { "4" } von { "10" } protokollierten Beginnen innerhalb von { "10" } s an; bei den anderen sechs ist er { "18" } bis { "211" } s zu spät oder löst Uhren-Fehlalarme vor dem Beginn aus ({ "1" } bei { "2.1.4" }, { "85" } bei { "2.3.15" }). D9, Runde { "3" } (eine Empfängerkarte aus den anderen Sitzungen der JammerTest-Einheit, vorregistriert 2ec76864) blockiert: { "167" } Trainingsepochen gegenüber { "3600" }. D9, Runden { "4" } und 4b (Rauschpegel aus einer Karte der Modellklasse u-blox ZED-F9P, Wroclaw { "2021" }, vorregistriert fb475550; 4b ein offengelegter erneuter Lauf mit korrigierter Extraktion, c9cc0d49), ein Befund (bleibt MODELLED): null Fehlalarme vor dem Beginn bei allen { "10" } protokollierten Beginnen und { "6" } von { "10" } innerhalb von { "10" } s; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } und { "2.6.1" } bleiben spät (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), unverändert durch den Rauschpegel der Uhr

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (TEXBAT-Parametercharakterisierung); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (legt den Befund fest); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-964d859381f5 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Setzt sich aus validierten Primitiven zusammen (allan/holdover van-Loan, Sicherheitsuntergrenze); kalibriert am JammerTest { "2024" }, Szenario { "2.1.1" } (~{ "1.01" } ms realer Zug der bereitgestellten Zeit gegenüber ≤{ "51" } ns beansprucht). Brücke über validierte Teile — selbst keine externe Validierung. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): In den Spoofing-Szenarien des JammerTest { "2024" } übersteigt der gemessene unentdeckte Fehler der bereitgestellten Zeit die nominale TPL bei { "3" } von { "8" } erkannten Beginnen: { "184.3" } gegenüber { "34.6" } ns ({ "2.1.4" }), { "295.7" } gegenüber { "159.3" } ns ({ "2.3.5" }) und { "143.0" } gegenüber { "69.0" } ns ({ "2.3.11" }); drei der fünf innerhalb sind trivial (ein eingerasteter Fehlalarm vor dem Beginn). Wahrscheinliche Ursache: Der Coast-Term aus einer Kalibrierung mit { "60" } s und ohne Driftrauschen deckt die Frequenzschwankung des Empfänger-TCXO über { "15" } bis { "39" } s nicht ab. Der gemessene Fehler ist die eigene Einzelpunkt-Uhrenschätzung von Kshana gegenüber einer an ihre eigenen Schätzungen vor dem Beginn angepassten Geraden, sodass selbst eine Übereinstimmung nicht vollständig unabhängig gewesen wäre. { "0.30" }, Runde { "2" }, gegen die Beginne im offiziellen JammerTest-{ "2024" }-Protokoll und den gemessenen Zeitfehler des Empfängers (vorregistriert 6a66994b), ein Befund (bleibt MODELLED): Bei { "4" } von { "10" } protokollierten Beginnen übersteigt der unentdeckte Fehler die TPL mit Driftzustand ({ "634.7" } gegenüber { "458.5" } ns bei { "2.1.1" }, { "232.6" } gegenüber { "16.2" } ns bei { "2.3.5" }, { "41.3" } gegenüber { "6.0" } ns bei { "2.3.10" }, { "218.6" } gegenüber { "47.4" } ns bei { "2.6.3" })

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (unabhängige Referenzen in geschlossener Form + CUSUM); examples/tpl_jammertest.rs (Kalibrierung des JammerTest { "2024" } mit realem Spoofing); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (legt den Befund fest); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-f2efb9b15383 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — IGRF-14-Koeffizienten; Matched-Filter-CRLB aus ersten Prinzipien. Das Feld des Schwere-Benchmarks mit realem Feld wird extern geprüft (Zeile 'Gravity-anomaly synthesis from a spherical-harmonic model'), aber sein Navigationsergebnis hat keine externe unabhängige Referenz

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (CRLB für Map-Matching; IGRF-14-Feld); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (der 60-Minuten-Benchmark ohne GPS auf dem realen EGM2008-Feld vom Grad 70, vorregistriert in xval/icgem-egm2008/: abgeglichen { "3106" } m, daher ist der Zielwert < { "500" } m NOT MET und als verfehlt festgehalten, und die zehnfache Verringerung der Drift von { "70.6" } km ist MET; zudem die gesetzte Monte-Carlo-Simulation des Kartenfehlers); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel und tests/emag2_real_grid.rs (datenabhängig freigegebener EMAG2v3-Leser auf einem realen Ausschnitt; darauf wird kein Navigationsergebnis behauptet); tests/terrain_slam_rbpf.rs (gemeinsame Kartenschätzung, ein RBPF im FastSLAM-Stil, gegen SITAN mit bekannter Karte bei einem korrelierten Kartenfehler von { "15" } m über { "20" } Seeds, vorregistriert in xval/terrain-slam-rbpf/: { "1.5" } % mittlerer Gewinn und besser in { "10" } von { "20" }, daher sind der Zielwert von { "10" } % und der Zielwert von 12 von 20 NOT MET und als verfehlt festgehalten; kein Schaden bei einer perfekten Karte, MET)

# text
seg-d7fd40dc37c6 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — SBOM gemäß dem offiziellen CycloneDX-{ "1.5" }-JSON-Schema (+ gültige SPDX-Kennungen) — ein externer veröffentlichter Standard, null Validierungsfehler über den gesamten Abhängigkeitsgraphen; der Teil zu FoM-Determinismus / bitgenauer Reproduzierbarkeit bleibt eine festgelegte Selbstkonsistenzprüfung, daher bleibt die Zeile MODELLED

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (die erzeugte SBOM validiert ohne Fehler gegen das offizielle CycloneDX-{ "1.5" }-JSON-Schema über den gesamten ausgelieferten Graphen mit 66 Komponenten: Standard-, Python- und Wasm-Features, Entwicklungsabhängigkeiten ausgeschlossen)

# text
seg-a014f82f28b0 = Auswertung der Erkennung von HF-Beeinträchtigungen durch maschinelles Lernen ({ "13494" })

# text
seg-400e45e7e700 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — AUC-Grenzen in geschlossener Form (Mann–Whitney) + ein Detektor mit perfekter Referenz; der Korpus ist SYNTHETISCH (parametergestützt, nicht aus Feld-/IQ-Daten)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfekt=1/identisch=0.5/Gleichstand={ "0.125" }, ROC monoton, fusioniert>{ "0.8" }, Schichttrennung je Klasse, Leckageschutz, reproduzierbarer Korpus, Verteilungsverschiebung markiert Optimismus); dominance_demonstrators (erreichbar + reproduzierbar + MODELLED-nicht-VALIDATED + Optimismuslücke selbstkonsistent)

# text
seg-7566da9904ba = Studie zur Optimismuslücke bei der HF-Beeinträchtigungserkennung durch maschinelles Lernen und Prädiktor der Lücke nur aus ID-Merkmalen

# text
seg-0d7f46d20a0d = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Von Hand hergeleitete Statistiken gegen geschlossene Formen (binormale AUC Φ(d'/√{ "2" }), DeLong-Varianz, Spearman mit Rangbindungen, exakte OLS-Rückgewinnung) + Leave-one-out-CV gegen die Basislinie „Mittelwert vorhersagen“. Der Korpus ist SYNTHETISCH (parametergestützt, nie aus Feld-/IQ-Daten), und die Optimismuslücke ist eine Schweregradverschiebung von synthetisch zu synthetisch, KEIN Ergebnis von Simulation zu Feld

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (AUC der unabhängigen Referenz je Klasse≈{ "1" }, gelernte Optimismuslücke>{ "0" }, Rasterform + Bootstrap-KI schließt den Mittelwert ein + positiver Skalierungstrend, ID-Merkmale endlich, Lückenprädiktor schlägt „Mittelwert vorhersagen“ bei BEIDEN CV-Varianten Leave-one-detector-out und Leave-one-class-out + deterministisch); impairment_ml::tests (logreg trennt + deterministisch + Verlust↓, MLP löst XOR, was ein lineares Modell nicht kann + gesetzter Seed); eval_stats::tests (Bootstrap/DeLong/Spearman/Ridge gegen geschlossene Formen)

# text
seg-590ec8589ce6 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Der Kernel für die Anpassung von gemessener ADEV→PSD (NNLS) stimmt mit scipy.optimize.nnls überein (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — ein unabhängiger externer Kernel; aber die ZAHLEN des Trade-offs quantifizieren (validieren nie) eine Partner-Uhr / ein Partner-CAI, daher bleibt der Trade-off selbst MODELLED, ohne Validierungsnimbus

# text
seg-e0f68f57399d = quantum_trade::tests (Rückgewinnung der ADEV im Round-Trip, NNLS-Nichtnegativität, Hinweis zur Untergrenze vorhanden/fehlend, Nutzen>{ "1" }, monotone Hüllkurve + Grenze für alternatives PNT); dominance_demonstrators (gemessene ADEV ist datengetrieben, nicht als Untergrenze angenommen, angenommene Klasse markiert Untergrenze + Hinweis, fehlerhafte Kurve abgelehnt, MODELLED-nicht-VALIDATED)

# text
seg-7d1d24d8f8f5 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Definitionstabelle Kp↔ap + Jacchia-1971-Geschlossene-Form für die exosphärische Temperatur (abgeglichen auf <{ "1" } K gegen die veröffentlichten Ankerwerte, tests/space_weather_reference.rs); die Dichte wird gegen pymsis NRLMSISE-00 (ein unabhängiges NRL-Modell) charakterisiert: Der Sonnenzyklus-Hub bei { "800" } km beträgt 10.4x gegenüber 13.6x bei NRLMSISE-00. { "0.30" }, Überarbeitung: Der kalibrierte Aktivitätsfaktor erster Ordnung wurde durch Jacchia { "1971" } ersetzt (Dichte im Standardszenario bei { "400" } km { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k entfernt, mean_exospheric_temperature_k hinzugefügt). { "0.30" }, Runde { "2" }, gemessene TOLEOS-Beschleunigungsmesser-Dichten von CHAMP/GRACE/GRACE-FO (ESA Swarm DISC; vorregistriert 20eed695), ein Befund (bleibt MODELLED): Bahnmittel bei { "400" } bis { "500" } km liegen im Sonnenmaximum außerhalb von Stürmen innerhalb eines Faktors { "2" } (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), aber Jacchia { "1971" } ist im Sonnenminimum { "2008" } etwa 1.7x zu dicht (GRACE-A 412/544 innerhalb eines Faktors { "2" }), daher ist die Dichte nicht validiert

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap exakt an den Gitterpunkten + Round-Trip + monoton, Tagesmittel von Ap, exosphärische T gegen veröffentlichte Ankerwerte für Sonnenminimum/Mittel/Maximum + Sturmzuwachs, Dichte gleich eins an der Referenz, Sonnenzyklus-Hub im beobachteten Band von { "5" }–{ "10" }×, Szenario reproduzierbar + MODELLED-nicht-VALIDATED + Ablehnung außerhalb des Bereichs); dominance_demonstrators (erreichbar + reproduzierbar + physikalische T + MODELLED-nicht-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-83c77a559939 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Sphärisch-trigonometrische Startgeometrie in geschlossener Form gegen veröffentlichte Ankerwerte aus Rechenbeispielen (Vallado, Fundamentals of Astrodynamics, 4. Aufl., Algorithmus { "37" } für das Startazimut + Kap. 6 zum Ebenenwechsel; tests/launch_window_ascent_geometry_reference.rs). Diese verwenden dieselbe geschlossene Form, die kshana implementiert (eine Prüfung auf Übereinstimmung mit veröffentlichten Werten bzw. auf Übertragungsfehler, InternalConsistency); MODELLED Zweikörperproblem, kein Geschwindigkeitsdreieck mit rotierender Erde, kein Aufstiegs- und kein Widerstandsverlustmodell. { "0.30" }, externer Vergleich mit Orekit { "12.2" } (Apache-2.0), ein Befund (bleibt MODELLED): Die Geometrie stimmt bis auf Rundung überein (aus dem Brennschlussazimut zurückgelesene Inklination über { "158" } Fälle, schlechtester Wert { "2.6e-15" } rad; minimale Inklination, Kreisbahngeschwindigkeit und Dogleg-Delta-v auf { "3e-16" }), aber die Standortgeschwindigkeit aus der Erdrotation verfehlt die vorregistrierte relative Schwelle von { "1e-6" } bei { "62.9" } Grad Breite ({ "1.12e-6" }). Die Abweichung wächst wie tan(lat), im Einklang mit einem Polbewegungs-Versatz des Pols von etwa { "5.8e-7" } rad im Erdbezugssystem von Orekit, den das sphärische ω·R·cos(lat) auslässt. Die Aussage wurde vor dem Lauf nicht eingeengt, daher kann die Zeile aufgrund dieses Vergleichs nicht aufsteigen. { "0.30" }, Runde { "2" } (vorregistriert 71bebf63): Mit einer Epoche und IERS-Zeilen stimmt die Standortgeschwindigkeit mit wahrem Pol (Szenariofeld site_rotation_speed_true_pole_m_s) an { "24" } Standorten über vier Längengrade innerhalb von { "1e-6" } mit Orekit überein (schlechtester Wert { "4.9e-8" }), aber die nominale Geschwindigkeit ohne Epoche, die das Szenario standardmäßig als Erdrotationsbonus ausgibt, verfehlt weiterhin um { "1.12e-6" }, daher bleibt die Zeile MODELLED, bis über die Standardausgabe entschieden ist

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (Start genau nach Osten erreicht i=Breitengrad, KSC→ISS = { "45" }° wie im Lehrbuch, polar = N/S, i<lat unerreichbar, Äquatorbonus von { "465" } m/s, Ebenenwechsel von { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, Anzahl der täglichen Gelegenheiten, Szenario reproduzierbar/MODELLED + Dogleg-Pfad); dominance_demonstrators (erreichbar + reproduzierbar + KSC→ISS { "45" }° + MODELLED-nicht-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-2a0f9d168a02 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Analytischer Eintritt nach Allen–Eggers in geschlossener Form, zusätzlich gegengeprüft mit einer numerischen Integration (DOP853) von scipy { "1.18" } solve_ivp derselben nur widerstandsbehafteten Eintritts-DGL (tests/ballistic_re_entry_corridor_reference.rs, { "36" } Fälle, schlechtester relativer Wert von a_max { "2.9e-9" }) — eine Prüfung eines numerischen Integrals gegen die eigene analytische Form, daher weiterhin InternalConsistency, KEINE externe Validierung. MODELLED ballistisch (kein Auftrieb), keine Aerothermik/TPS — die Heizungsausgabe ist eine Geschwindigkeit, keine Wärmestromdichte. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): Gegen die Rekonstruktion des Eintritts der Stardust-SRC (Desai und Qualls, NASA NTRS { "20080008567" }) beträgt die Spitzenverzögerung nach Allen–Eggers für den gedruckten inertialen Eintrittszustand ({ "12.9" } km/s, -8.2 Grad, H { "7200" } m) { "61.8" } g gegenüber { "32.89" } g der bestgeschätzten Trajektorie, +{ "88" } % bei einer Toleranz von { "15" } %: Die Lösung mit konstantem Bahnneigungswinkel und ohne Gravitation verdoppelt die Spitze eines flachen Eintritts mit Geschwindigkeit über der Fluchtgeschwindigkeit ungefähr. Stardust trug keinen Beschleunigungsmesser, daher ist die Rekonstruktion eine Trajektorienschätzung. { "0.30" }, Runde { "2" }, blockiert (bleibt MODELLED): Eine integrierte ebene Punktmassenlösung (reentry::simulate_planar_entry, US76, Gravitation nach dem inversen Quadrat, Krümmung) stimmt mit den bestgeschätzten Trajektorien von Stardust und Genesis innerhalb von { "15" } % überein (+{ "11.3" } %, +{ "5.6" } %), aber diese Maxima sind Ausgaben von Behördensimulationen, keine Messungen, daher ist dies nur eine Gegenprüfung. Der Vergleich mit dem Beschleunigungsmesser (vorregistriert a94a283d) ist blockiert, bis eine lesbare Kopie der REMM-Analyse von Hayabusa2 vorliegt (doi 10.57350/jesa.16)

# text
seg-c763ac7e3cda = reentry::tests (Spitzen-g unabhängig vom ballistischen Koeffizienten + physikalisches g-Band, wächst mit steilerem γ / schnellerem Eintritt, Geschwindigkeit bei Spitzen-g = V_e·e^(−1/2) und Spitzenheizung = V_e·e^(−1/6) schneller, Höhe bei Spitzen-g physikalisch + tiefer bei höherem B, Szenario reproduzierbar/MODELLED + degenerierte Geometrie abgelehnt); dominance_demonstrators (erreichbar + reproduzierbar + Anteil V_e·e^(−1/2) + MODELLED-nicht-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (nur Gegenprüfung); tests/reentry_point_mass_accelerometer_oracle.rs (blockiert, nicht ausgeführt)

# text
seg-f40cd1b25160 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Die aus Tabelle 5a K_bch und den Rahmenlängen in geschlossener Form berechnete spektrale Effizienz stimmt mit den Effizienzen überein, die Tabelle { "13" } angibt (eine Übertragungsprüfung der Schwellentabelle); die Teile des Linkbudgets stimmen mit ihren geschlossenen Formen überein; die Auswahl ist monoton in Es/N0 und berücksichtigt die Marge; ACM überträgt mindestens das Volumen mit konstanter Kodierung. Die Überflugsgeometrie stammt vom separat VALIDATED scheinbaren Überflugprädiktor. WAS NICHT GEPRÜFT IST: Es wurde kein externes Werkzeug und keine gemessene Strecke verglichen; die Schwellen sind die idealen AWGN-Werte der Norm, nicht die eines Modems; Regenschwund, Zeigeverlust entlang des Überflugs und Piloten sind nicht modelliert.

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-a90d5ba33c0b = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Das exakte Branch-and-Bound stimmt mit der erschöpfenden Aufzählung auf kleinen Zufallsmengen überein, jeder Plan wird gegen die Konfliktregeln auf Zulässigkeit geprüft, und das Greedy-Verfahren schlägt das exakte Optimum nie. WAS NICHT GEPRÜFT IST: Es wurde kein externer Planer und kein operativer Plan verglichen; Kontakte werden als Ganzes genommen (keine Aufteilung), der Rückstau ist zu Beginn des Fensters fest, Schwenkzeit über die feste Wendezeit hinaus und der Bordspeicher sind nicht modelliert.

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-7ead676849f9 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Kostenarithmetik in geschlossener Form gegen von Hand hergeleitete Werte; eine wirtschaftliche EINORDNUNG einer modellierten Abdeckungszahl, kein Angebot und kein validiertes Kostenmodell

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (von Hand hergeleitete Kosten je Abdeckung 48/96={ "0.5" }, ROI-Verhältnis { "2.667" }, Reihenfolge der Eingrenzung + Schutz bei null Abdeckung)

# text
seg-8204455973cc = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Setzt die extern validierte RAIM-Stanford-Klassifikation zusammen (raim::classify_stanford); die Abbildung von verpasster Erkennung auf AL ist selbst modelliert und keine zertifizierte Integritätszuteilung

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (dieselbe verpasste Erkennung kippt von Available über MI zu HMI, wenn sich der Kontext verschärft; konservatives PL→Unavailable; HMI je Achse; Eingabeschutz)

# text
seg-7bb58c89a1fb = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Die zitierte VRW-Eingrenzung wurde gegen die Physik von CaiAccelerometer::accel_asd und gegen den aus der Streifenmehrdeutigkeitsgrenze berechneten rohen Dynamikbereich gegengeprüft; die Zahlen sind MODELLED Eingrenzungen aus einer Literaturübersicht (needs_source_confirmation), kein Gerät ist validiert, kein Validierungsnimbus

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (physikalisches VRW liegt auf allen { "3" } Stufen innerhalb der zitierten VRW-Eingrenzung; roher Bereich der Streifenmehrdeutigkeit aus k_eff·T² berechnet; konservatives Budget driftet stärker als das beste; jede Eingrenzung hat eine Quelle + Bestätigungsmarkierung; Schutz der Reihenfolge der Eingrenzungen)

# text
seg-3f5094fa7a30 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Unabhängige numpy-Neuimplementierung der Vier-Regionen-Regel (scripts/gen_tib_scorer_reference.py) auf demselben Stichprobensatz; Methode zitiert aus dem Stanford-ESA-Integritätsdiagramm (Tossaint et al., ION GNSS { "2007" }) und RTCA DO-229 WAAS MOPS. KEINE ExternalDataset-Genauigkeitsreferenz — der Benchmark ist ehrlichkeitsimmun.

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (vier Regionen + inklusive Grenzen + |Fehler| + Nichtverfügbarkeit bei PL>AL); tests/tib_scorer_reference.rs (Klassifikationszahlen gegen unabhängiges numpy auf einem festen synthetischen Satz)

# text
seg-10befbc6faae = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Unabhängige numpy-Neuzählung der Regionen in tests/fixtures/tib/reference.json; nur Gegenprüfung der Scorer-Mechanik, keine Genauigkeitsaussage.

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (sauber/unterbegrenzt/ganz nicht verfügbar/leer); tests/tib_scorer_reference.rs (Zählungen + Raten + coverage_ok gegen numpy auf { "1e-12" })

# text
seg-cee919e2058e = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Repräsentative parametrische Fehlergeneratoren (modelliert); die nicht erkennbare Menge (symmetrische Verzögerung, Replay innerhalb der Frische) ist zitiert aus Mizrahi RFC { "7384" } und Narula & Humphreys (IEEE JSTSP { "2018" }). Keine externe unabhängige Referenz — ein Fehlerkatalog macht keine gemessene Aussage.

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (Offsetprofile, monotones Coast, Markierung der nicht erkennbaren Menge, Konsistenz von max_offset, genau zwei nicht erkennbare Klassen)

# text
seg-0cc84aedee42 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Eigenschaftsprüfung, dass das Verdict-Enum strukturell einen nicht erkennbaren Fehler nicht als erkannt melden kann (Mizrahi RFC { "7384" }); absorbiert ⟺ PL ≥ Offset. Keine Genauigkeitsreferenz.

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (Referenz-PL absorbiert; defektes PL nicht absorbiert, nie erkannt; Urteil zur erkennbaren Abdeckung; die Ehrlichkeitseigenschaft, dass für ein nicht erkennbares Szenario kein Abdeckungs- oder Erkennungsurteil erreichbar ist)

# text
# c1: variance
seg-350aaf43f349 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe unabhängige Referenz, und keine ist möglich: Dies ist Selbstbeschreibung, keine Messung. Sie ist erfasst, weil ihr Fehlen ein Mangel war -- P5 musste die Trägerwellenlänge und die Sendeapertur aus Quellvorgaben zitieren und aus einer Prüfung der internen Konsistenz schließen, dass ein nacktes <c1/> in Quadratmetern angegeben war. Der Schluss war richtig, und genau deshalb war es wichtig: Nichts hätte aufgefangen, wenn er falsch gewesen wäre

# text
seg-6d963d838eed = hybrid_integrity::tests (die aufgelöste Konfiguration wird für Vorgaben und für Überschreibungen zurückgegeben, ohne die Wellenlänge über Meter hin und zurück zu führen; jeder Eintrag zu Einheiten trägt sowohl eine Einheit als auch eine Herkunftsklasse; jedes vom Einheitenblock genannte Feld wird tatsächlich ausgegeben, sodass es kein Geisterfeld dokumentieren kann)

# text
seg-cbd0ee1c1e97 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe unabhängige Referenz, und ExternalDataset wird abgelehnt. Die beiden Eingaben sind eine Eb/N0-Marge und ein Überschreiten der C/N0-Schwelle, beide Funktionen einer MODELLED EIRP, Gütezahl und pauschalen Verlustzuteilung; es gibt keine gemessene Verfügbarkeitsaufzeichnung für einen optisch/HF-hybriden Erde-Mond-Dienst, gegen die die zusammengesetzte Zahl geprüft werden könnte. Die vorhandenen Prüfungen sind intern und werden als solche benannt: Die Zusammensetzung wird aus den eigenen veröffentlichten Margen des Berichts neu berechnet statt aus dem Inneren des Emitters, und die Schließungsreichweite wird durch erneutes Ausführen der Streckengleichung BEI ihr geprüft, wobei verlangt wird, dass die Marge verschwindet -- ein Inversions-Round-Trip, keine unabhängige Implementierung. Die ehrliche Grenze der Zahl ist im Bericht selbst festgehalten: Sie ist ein deterministischer 0/1-Indikator, keine Wahrscheinlichkeit, weil nichts in dieser Engine eine Verteilung der HF-Streckenausfälle bei diesem Band und dieser Geometrie misst. Diese fehlende Eingabe wird in rf_availability.factors_not_included benannt statt erfunden, und sie zu liefern ist, was eine probabilistische HF-Verfügbarkeit bräuchte

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (die Verfügbarkeit entspricht dem Produkt der beiden Indikatoren, neu berechnet aus den eigenen Margen des Berichts, und diese Margen werden ihrerseits aus der eigenen EIRP, dem Freiraumverlust, dem pauschalen Verlust, der Gütezahl, dem Boltzmann-Term, der Datenrate und der Anforderung des Berichts auf { "1e-9" } dB neu zusammengesetzt; der Wert wird als { "0" } oder { "1" } gemessen, während die optische Verfügbarkeit im selben Lauf als streng zwischen beiden liegend gemessen wird; jede Faktorzeile trägt eine Herkunftsklasse aus dem geschlossenen Vokabular field_schema; die berichtete Schließungsreichweite, erneut durch das Linkbudget geführt, liefert eine Marge von { "0" } bis { "1e-9" } dB und wird als unabhängig von der Reichweite des Laufs über vier Dekaden gemessen, während die Reichweitenauslastung sich genau um das Reichweitenverhältnis bewegt; eine Strecke mit -40 dBW meldet die Verfügbarkeit { "0" }, LOST, und eine Auslastung über { "1" } statt eines Bruchteils; der überholte Hinweis 'no RF-availability counterpart is computed by this engine' ist als entfernt zugesichert, und der Ersatz ist als das neue Feld nennend zugesichert; eine fehlerhafte HF-Eingabe wird abgelehnt statt begrenzt)

# text
seg-6471f38fc505 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe unabhängige Referenz für das VERHÄLTNIS, und ExternalDataset wird bewusst abgelehnt. Die zugrunde liegende HF-Kette hat eine -- tests/validate_p5_rf_ranging_precision.rs prüft linkbudget::link_budget und navsignal::dll_code_jitter_chips gegen eine unabhängige Python/NumPy-Fixture und gegen den fest eingetragenen Rechenwert von Kaplan & Hegarty ({ "2.814e-3" } Chip / { "0.825" } m bei { "45" } dB-Hz) -- und die optische CRLB hat ihre eigene Zeile in geschlossener Form. Einen der beiden Anker für diese Zeile zu beanspruchen, wäre geborgte Validierung, die die Invarianten der Matrix verhindern sollen: Die Größe hier ist ein VERHÄLTNIS bei einer Konfiguration mit MODELLED EIRP, Gütezahl, Sendeleistung und Apertur, und es gibt keinen gemessenen Vergleich von optischer und HF-Entfernungsmessung an einem gemeinsamen Betriebspunkt, gegen den es geprüft werden könnte. Intern geprüft wird das, was beim Verhältnis tatsächlich schiefgehen kann: dass die beiden Zweige an einem Betriebspunkt liegen. Das wird gemessen, indem die gemeinsame Akkumulationszeit skaliert wird und verlangt wird, dass beide Zweige sich nach demselben Quadratwurzelgesetz bewegen und das Verhältnis gleich bleibt, und es wird erzwungen, indem das Verhältnis ganz abgelehnt wird, wenn die Mittelungszeiten nicht übereinstimmen. Beide Zweige sind Grenzen aus thermischem Rauschen/Schrotrauschen, und beide schließen Mediumverzögerung, Uhrenfehler und Mehrdeutigkeit aus, der Ausschluss ist also auf beiden Seiten identisch; der Bericht sagt das, statt es der Schlussfolgerung zu überlassen

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (das Verhältnis entspricht den beiden ausgegebenen Zweigen, dividiert, auf { "1e-15" } relativ, und sein Kehrwert und seine Dezibelform stimmen überein; Reichweite und Zeit-Sigma jedes Zweigs hängen genau über c zusammen; die ausgegebene gemeinsame Konfiguration ist als gleich der eigenen Reichweite und Integrationszeit des Szenarios zugesichert, und die Reichweite des HF-Zweigs ist als gleich der des optischen Zweigs zugesichert; das C/N0 des HF-Zweigs ist bitgleich mit dem des Verfügbarkeitsblocks, aus einem Linkbudget, keine Neuherleitung; die Eigenschaft des GLEICHEN-MIT-GLEICHEM wird MEASURED statt zugesichert -- eine Vervierfachung der gemeinsamen Akkumulationszeit halbiert den optischen Zweig auf { "1e-12" } und den HF-Zweig auf { "1e-7" } und lässt das Verhältnis auf { "3.19e-9" } relativ unverändert, was ein Zweig, der heimlich über etwas anderes mittelt, nicht könnte; eine Überschreibung rf_dll_bandwidth_hz, die die gemeinsame Mittelungszeit bricht, macht das Verhältnis null mit einem Grund, der beide Zeiten nennt, während beide Zweige weiterhin ausgegeben werden; ein Lauf mit einfachem Weg macht den Vergleichszweig bitgleich mit der veröffentlichten Kernzahl mit einem Strafterm von genau { "1" }, und ein Lauf mit Hin- und Rückweg reproduziert den Strafterm 0.5/sqrt(geometrischer Verlust des Rückwegs), neu berechnet aus dem eigenen geometric_loss_db des Berichts auf { "1e-12" })

# text
seg-7c14f0734623 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe unabhängige Referenz: Dies ist Selbstbeschreibung über eine Gleichung, die bereits gegen eine veröffentlichte Design-Control-Tabelle validiert ist (siehe Zeile zum Linkbudget mit einfachem Weg). Sie ist erfasst, weil ihr Fehlen ein gemessener Mangel war -- die Reproduktion der veröffentlichten d1_rate_gain_beamwidth.csv erforderte, eine effektive Konstante aus allen dreißig Zeilen auf { "0.0034" } dB zurückzurechnen, und die Engine benennt diese Kombination jetzt und beweist per Test, dass keine veröffentlichte Tabelle ihre drei Komponenten je hätte trennen können

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (über drei Bänder, vier Dekaden der Reichweite und beide Schließungsurteile werden die Marge und der darunterliegende Freiraumverlust allein aus dem Bericht auf besser als { "1e-9" } dB neu berechnet; das aus den Gleichungstermen zusammengesetzte benötigte G/T stimmt mit derselben Größe überein, die als G/T minus Marge erreicht wird, und ein erneuter Lauf damit setzt die Marge auf null; drei Budgets mit sehr unterschiedlicher EIRP, sehr unterschiedlichem Verlust und Schwellwert, aber gleicher Streckenkonstante ergeben eine identische Anforderung, während { "1" } dB auf der Konstante sie genau um { "1" } dB verschieben; die Aufteilung des Gewinns fehlt, solange keine Rauschtemperatur angegeben ist, und eine nicht positive wird abgelehnt; jedes vom Einheitenblock genannte Feld wird tatsächlich ausgegeben)

# text
seg-5a05659a1cbb = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Zwei verschiedene Berechnungen derselben Größe in der Codebasis, nicht eine, die wiederholt wird: Bisektion auf der Potenzgesetzkurve nach IEEE-1139 weiß nichts über den Rauschtyp, während die geschlossene Form den dominanten Typ algebraisch invertiert, sodass ein falsch klassifizierter Rauschtyp oder eine schlechte Einschließung als nicht winziger relativer Unterschied sichtbar wird. Die vier Werte reproduzieren auch die veröffentlichte Tabelle der Arbeit auf die Hälfte ihrer letzten gedruckten Stelle -- aber diese Tabelle wurde selbst aus derselben geschlossenen Form rekonstruiert, daher ist es eine Reproduzierbarkeitsprüfung und keine externe unabhängige Referenz, und der Rahmenterm, gegen den gemessen wird, ist eine modellierte Zuteilung

# text
seg-d9742b5a3a48 = lunar_time_budget::tests und lunar_time_budget_scenario::tests (alle vier Klassen sind in einem Lauf und in der Reihenfolge einer angeforderten Teilmenge vorhanden; jede Zeile stimmt mit ihrer eigenen geschlossenen Form auf besser als { "1e-12" } relativ überein; das Skalieren des Rahmenfehlers um k skaliert den Kreuzungspunkt um k bei einer Uhr mit Flicker-FM und um k^{ "2" } bei einer mit weißem FM, geprüft bei k={ "2" } und k={ "3" }, was die beiden Rauschklassen trennt; jede Zeile reproduziert den Kreuzungspunkt der einzelnen Uhr, den das Budget bereits berichtet hat; jede Zeile gewinnt den einen gemeinsamen Rahmenterm zurück; ein unbekannter Uhrenname wird abgelehnt)

# text
seg-75715af43b8b = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Mengeninklusion: Das Verhältnis von Störer zu Signal geht als einheitlicher Dezibel-Versatz ein, sodass die erfasste Menge bei höherer Sendeleistung die Menge bei niedrigerer enthält und der Anteil nur steigen kann -- eine Eigenschaft, die das Airy-Muster bei Strahlbreite oder Höhe NICHT liefert, wo der erfasste Bereich in Ringe zerfällt und der Anteil tatsächlich nicht monoton ist. Keine veröffentlichte Tabelle gibt den erfassten Scheibenanteil eines lunaren Orbitalsenders gegen Höhe und Strahlbreite an, daher gibt es nichts Externes, gegen das diese Zellen geprüft werden könnten; das darunterliegende Muster ist separat gegen veröffentlichte Bessel-Werte validiert und hat seine eigene Zeile

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests und attack_surface::tests (das Gitter ist vollständig, und jeder erfasste Anteil liegt in [{ "0,1" }]; der erfasste Anteil ist an jedem Knoten nicht fallend in der Sendeleistung; er ist bei Strahlbreite oder Höhe NICHT monoton, was durch einen eigenen Test festgelegt ist, damit der Sweep später nicht geglättet werden kann; der Basisknoten reproduziert den bestehenden erfassten Anteil bitgleich; die Auswertung nur am Rand ist bitidentisch mit dem letzten Punkt des vollständigen Sweeps; eine lokalisierte Kreuzung liegt auf { "1e-9" } dB auf der Schwelle und ist eingeklammert)

# text
seg-eebb00692020 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Nur Selbstkonsistenz: Die veröffentlichte Summe wird gegen die Wurzel der Quadratsumme der Terme in derselben Datei geprüft, und die ausgegebene Kurve reproduziert die veröffentlichte p3_time_budget_curve.csv über alle { "57" } Punkte. Beide Prüfungen teilen die eigenen Termdefinitionen dieser Engine, daher ist keine unabhängig. Der Uhrenterm beruht auf veröffentlichten Uhrenspezifikationen, aber die GRÖSSEN der Untergrenzen für Strecke, Rahmen, Relativistik und Ephemeride sind dokumentierte Budgetzuteilungen ohne externe unabhängige Referenz

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (alle { "57" } Mittelungszeiten x { "8" } Terme vorhanden, der Gitterindex läuft { "0" }..={ "56" } und trägt je { "8" } Zeilen; die Zeile <c1/> entspricht der Wurzel der Quadratsumme der sieben Terme daneben bei jedem tau; die Tabelle folgt einem angeforderten Gitter statt einem fest eingetragenen; ihre Ausgabe lässt das Bericht-JSON byteidentisch)

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: Bei ausgeschalteter Steuerung ist der Uhrenterm für alle vier Klassen bitgleich mit dem Uhrenterm des Budgets; bisection_matches_the_closed_form innerhalb von { "1e-9" } relativ für beide Rauschklassen; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: Das Standarddokument, die Tabelle und die Zusammenfassung sind unverändert, und der Block fügt nur sein eigenes Objekt und seine Einheiten hinzu; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: optisch < PHM < RAFS < miniRAFS von { "1" } s bis { "7e5" } s, wobei sich die Kurven von PHM und RAFS zwischen { "7e5" } und { "8e5" } s kreuzen, festgelegt als offengelegte Eigenschaft der Uhrenmodelle mit einem einzigen Rauschtyp; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-5b1e2e05b9c8 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — delta_dor mit ebener Welle (selbe Codebasis) im Fernfeldgrenzfall; Partialableitungen per finiten Differenzen. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): Gegen konvergierte Lichtlaufzeiten von ANISE { "0.10" } durch DE440 ({ "75" } Verzögerungen am 2024-01-01 über drei DSN-Basislinien, erzeugt von xval/anise-lunar-od ohne Kshana-Code) liegt keine Verzögerung innerhalb der Toleranz von { "1" } ps. Die größte Abweichung beträgt { "24" } µs, durch den analytischen Mondmittelpunkt (etwa { "200" } km von DE440 entfernt), die einzelne momentane Geometrie ohne Lichtlaufzeit-Iteration ({ "3.6" } µs) und die ausgelassene Polbewegung; die Partialableitungen der Bake weichen um bis zu { "2.9e-3" } relativ ab gegenüber { "1e-6" }. Die Aussage in der Moduldokumentation, dass die Näherungen des Bezugssystems unter der Modelltreue liegen, hält auf diesem Niveau nicht. { "0.30" }, Runde { "2" }: Der Kernelpfad (lunar_vlbi::KernelGeometry) ist gegen NAIF-SPICE-Lichtlaufzeiten in seiner eigenen Zeile validiert, Lunar geodetic VLBI, kernel path; der ANISE-Vergleich dieses Pfads (75/75 innerhalb von { "1" } ps, schlechtester Wert { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) ist nur eine Gegenprüfung der Kernel-Auswertung, weil die Lichtlaufzeit-Lösung in diesem Prüfstand die des Projekts selbst ist. Diese Zeile (der analytische Standardpfad) bleibt MODELLED mit dem obigen Befund

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (Fernfeldgrenzfall stimmt mit delta_dor überein; Nahfeldkorrektur; FD-Partialableitungen); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-ed40da9bdfae = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Identitäten in geschlossener Form und interne Konsistenz; es wird KEINE externe unabhängige Referenz beansprucht. Der halbe Randwinkel wird gegen asin(R_earth/r_orbit) geprüft und die Geometrie dagegen; der Freiraumverlust, der DOP-Kernel und die SGP4-Propagation, die hier zusammengesetzt werden, sind jeweils in ihren eigenen Zeilen extern validiert, und diese Zeile borgt ihren Status nicht. WARUM MODELLED, und es ist das Sendemuster: Der Gewinn über dem Winkel ist der einer gleichmäßig ausgeleuchteten kreisförmigen Apertur, des Airy-Musters, während eine reale GPS-L1-Antenne ein Wendelgruppenstrahler mit zwölf Elementen ist, mit einer geformten Hauptkeule, deren Maximum außerhalb der Blickachse liegt, um die Leistung über die Erdscheibe auszugleichen, und mit Nebenkeulen, die nicht Airy-förmig sind. Veröffentlichte gemessene Muster existieren und sind hier nicht eingebunden, daher tragen Reihenfolgen und Größenordnungen, während die dB eines einzelnen Satelliten es nicht tun. EINE ERSTE IMPLEMENTIERUNG DIESER ZEILE WAR AUF EINE ERFASSENSWERTE WEISE FALSCH: Der Airy-Ausdruck gilt nur in der vorderen Hemisphäre, sein Argument verläuft wie sin(theta), und bei theta nahe { "180" } Grad schlägt er um und liefert hinter der Apertur den VOLLEN GEWINN IN BLICKACHSE - sodass die zwei stärksten Strecken im ersten Bericht Satelliten waren, deren Antennen vom Mond weg zeigten, und sie waren die einzigen beiden, die die Schwelle erreichten. Hinter der Apertur wendet das Modell jetzt eine flache Untergrenze der Rückkeule an, als Schranke angegeben statt als erfundene Musterform. Bewusst nicht enthalten, jeweils mit der Folge, dass das Budget OPTIMISTISCH ist: kein ionosphärischer oder troposphärischer Verlust auf den den Rand streifenden Strahlen, kein Polarisations-, Zeige- oder Implementierungsverlust und eine kugelförmige Erde ohne Refraktionsverlängerung. Die Mondposition ist eine EINGABE, kein Ephemeriden-Nachschlag, weil die geprüfte Größe die Strecke und die Strahlgeometrie ist. Um diese Zeile auf validiert zu heben, werden ein gemessenes Sendemuster und LuGRE-Normalpunkte zum Vergleich benötigt; keines von beidem ist im Repository, und keines wird hier erfunden. { "0.30" }, Runde { "2" }, ein Befund (bleibt MODELLED): Ein Streckenpfad mit gemessenen Eingaben (reale SP3-Positionen, Sendeleistung je Block, tabellierte Sende- und Empfangsmuster, Hysterese von Erfassung und Verfolgung) wurde gegen Montenbruck et al. { "2023" } Tabelle { "3" } für GENESIS bei { "6000" } km geprüft (vorregistriert 5b414f0a): Die Mittelwerte der Zenitantenne stimmen bei { "5" } von { "6" } innerhalb von einem dB der Empfindlichkeit der Arbeit überein; die Mittelwerte der Nadirantenne liegen { "1.0" } bis { "2.4" } Satelliten höher als gedruckt, plausiblerweise weil die Arbeit azimutabhängige Nebenkeulenmuster von GPS verwendete, die nicht veröffentlicht sind. Die Zahlen für Mondentfernung dieser Zeile verwenden weiterhin den Airy-Ersatz. { "0.30" }+ D7, ein Befund (bleibt MODELLED): Die neu gefasste Größe, die C/N0-DIFFERENZ zwischen Satelliten der Block IIR/IIR-M, die in einer Epoche verfolgt werden, vorhergesagt mit den gemessenen L1-Mustern je SVN von NAVCEN (zweidimensional, Gierlenkungs-Bezugssystem) gegen das C/N0 des LuGRE-Flugs (vorregistriert 768cb62b: { "99" } % sichtbar, Paar-RMS <= { "3.0" } dB, Median <= { "2.0" } dB, mindestens { "50" } Aufzeichnungen und { "30" } Paare), hat zu wenig Daten: Die { "26" } qualifizierenden Epochen von Transit und Mondorbit enthalten { "15" } verfolgte IIR/IIR-M-Aufzeichnungen (überwiegend werden IIF und III verfolgt) und ein Paar. Alle { "15" } werden als sichtbar vorhergesagt, und das Residuum des einzigen Paares beträgt -0.06 dB; es wird nichts behauptet

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } Bibliothekstests: der halbe Randwinkel der Erde gegen seine geschlossene Form asin(R/r) mit einer weiteren Zusicherung, dass JEDE nicht verdeckte Strecke außerhalb dieses Kegels liegt, sodass der Verdeckungstest und der Randwinkel nicht widersprechen können; das Verdeckungsprädikat geprüft auf der nahen Seite, der fernen Seite und dem Fall, dass der Körper HINTER dem Sender liegt; Pfadverlust auf jeder Strecke auf das plausible Band der Mondentfernung begrenzt; die verfolgbare Menge als Teilmenge der geometrisch sichtbaren Menge gezeigt und disjunkt zur verdeckten; Monotonie in beiden Richtungen - mehr Empfangsgewinn verringert die Anzahl nie, eine strengere Schwelle erhöht sie nie; keiner Strecke wird mehr als der Gewinn in Blickachse angerechnet; ein Empfänger innerhalb der Erde wird abgelehnt; der Sweep ist als tatsächlich mit der Epoche VARIIERENDER zugesichert; und die Verfügbarkeit von Signal gegenüber Fix ist als verschieden, richtig geordnet und konsistent mit den Zeilen je Epoche zugesichert); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (festgelegt); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (festgelegter Befund)

# text
seg-5242a1ecb1f9 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Ein unabhängiges scipy/numpy-Programm integriert dieselben Variationsgleichungen (Zielwert O1). Nichts wird mit einer Messung einer Mondbahn verglichen. Die unabhängige Referenz prüft die Numerik angegebener Formeln, nicht die Physik, daher bleibt die Zeile MODELLED. Eingeschränktes Dreikörpermodell: keine Sonne, keine Mondharmonischen, die Erdrotationsachse entlang der Bahnnormalen, ILLUSTRATIVE Eingaben für Empfänger und Station.

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (Zielwert O1: Die über drei Tage und über eine Periode verkettete Zustandsübergangsmatrix entspricht scipy DOP853 auf relativ { "1e-6" }; Zielwert C1: mittleres q und der Anteil innerhalb von 95 %; Zielwert C2: Stichprobe über formaler Spur jedes Schätzers; Zielwert C3, NOT MET und festgelegt: Mit { "3e-10" } m/s2 nicht modellierter Beschleunigung beträgt die Überschreitung innerhalb von 95 % { "0.0525" }, nicht mindestens { "0.5" } - die Schätzung an Bord ist nur auf Hunderte Meter bekannt, daher verbirgt sich etwa zehn Meter Verschiebung in ihrer Kovarianz); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-a5f9d7981f42 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Eine unabhängige numpy-Lösung derselben Normalgleichungen aus den exportierten Zeilen (Q3) und eine erschöpfende ganzzahlige Aufzählung (Q4). Es wird keine GNSS- oder Mond-Trägerphasenmessung verglichen. MODELLED.

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (Zielwert Q1: Monte-Carlo-Erfolg mindestens die Bootstrap-Schranke minus drei Standardfehler; Q2: kein Abfall mit der Bogenlänge über drei Standardfehler hinaus; Q4: LAMBDA entspricht der erschöpfenden Aufzählung für { "200" } Ziehungen mit Dimension bis fünf; Q3: Das Float-Design entspricht einer unabhängigen numpy-Lösung auf { "1e-9" } bei den Kovarianzen von Mehrdeutigkeit und Position, und die Bootstrap-Rate ist bei { "1e-9" } NOT MET, festgelegt: Sie weicht um relativ { "1.7e-6" } ab, weil die Normalverteilungsfunktion von LAMBDA eine Näherung nach Abramowitz und Stegun ist)

# text
seg-ee535014d898 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Eine unabhängige numpy-Finite-Differenz des Vorwärtsmodells (F2). Es wird nichts mit realen Lösungen des Mondbezugssystems verglichen. Der Faktor ist bedingt durch die angenommene bekannte Bahn und das Bereichs-Sigma von { "1" } m. MODELLED.

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (Zielwert F1: Die Spur der CRLB steigt nicht und der kleinste Eigenwert fällt nicht mit Orbiter-Strecken, im Beispiel und in { "20" } gesetzten Zufallsmengen; Zielwert F2: Die Bereichs-Partialableitungen entsprechen einer unabhängigen numpy-longdouble-Finite-Differenz des Rodrigues-Vorwärtsmodells auf { "50" } Geometrien; Zielwert F3: Der kleinste Eigenwert steigt um mindestens 2.0x, gefunden etwa 111x)

# text
seg-8d70ea5318fa = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Ein unabhängiges numpy-Gesamtsystem, bei dem die Positionsunbekannten durch explizite Schur-Komplemente eliminiert werden (T3). Es werden keine Daten von GRASP, Genesis oder anderen Missionen verglichen. MODELLED.

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (Zielwert T1: Die Translations-Sigmas fallen nicht, wenn die lokale Anbindung lockerer wird; T2: Mit um { "1e-6" } skalierten Verfahrens-Sigmas liegt das Translations-Sigma jedes Paares innerhalb von { "1" } % von sqrt({ "2" }) mal dem Sigma der lokalen Anbindung, gefunden innerhalb von { "3e-7" }; T3: Die Informationsmatrix entspricht einem unabhängigen numpy-Gesamtaufbau auf { "1e-9" }). Der erste T2-Lauf mit Invertierung der Normalgleichungen verfehlte ({ "1.3" } % bei einer Anbindung von { "0.1" } m, Werte unter der Untergrenze bei { "1" } m); die Ursache war numerisch, und die Kovarianz wurde auf den Wurzelweg umgestellt, bevor der Zielwert neu bewertet wurde.

# text
seg-6c1a6dc96a6a = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Ein unabhängiger numpy-Aufbau mit finiten Differenzen (G2) und eine Auswertung in geschlossener Form (G4). Die k2-Empfindlichkeit der Orbiterfamilie ist ein Wert am oberen Ende (der Bahnzustand absorbiert hier nur eine Konstante und einen Trend). Es wird keine Messung von Mondgezeiten oder Libration verglichen; k2 wird aus Lemoine et al. { "2014" } als Nennwert zitiert. MODELLED.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (Zielwert G1: Die analytischen Partialableitungen entsprechen einer zentralen finiten Differenz jedes Vorwärtsmodells auf { "1e-8" }; G2: Die 5x5-Information entspricht einem unabhängigen numpy-Aufbau auf { "1e-6" }; G4: Die Amplitude der Uhrengezeiten und ihre k2- und h2-Empfindlichkeiten entsprechen einer unabhängigen Auswertung auf { "1e-9" }; Zielwert G3 in seiner Spurhälfte NOT MET, festgelegt: Das Hinzufügen einer Familie senkt den kleinsten Eigenwert nie ({ "28" } von { "28" }), aber die Spur der Pseudoinversen stieg bei { "12" } von { "28" } Hinzufügungen, weil die hinzugefügte Familie den Rang erhöhte)

# text
seg-3ead905e6a5c = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Die DOP-Arithmetik ist der Kernel crate::orbit::dop, separat extern gegen gnss_lib_py in tests/dop_reference.rs validiert; diese Zeile borgt den Status jener Zeile nicht erneut. Der Sichtbarkeitshorizont der Bake ist die geschlossene Form L01, und sigma = DOP x sigma_URE ist die übliche GNSS-Beziehung (Kaplan und Hegarty, Understanding GPS/GNSS, Abschnitt { "7" }). Innerhalb dieser Zeile wird die Ergänzung selbst gegen einen unabhängigen DOP-Pfad im Repository geprüft und auf einen eingecheckten Referenzstand festgelegt. WARUM MODELLED: Der Konstellationsentwurf, die Platzierung der Baken, die Antennenhöhen und alle drei Größen des Fehlerbudgets sind illustrative Eingaben und keine im Einsatz befindliche Vermessung oder gemessene Strecke, daher sind die berichteten Meter eine Eigenschaft eines gewählten Szenarios und nicht eines eingesetzten Dienstes. HINWEIS ZUR HERKUNFT: Diese Fähigkeit wurde im README beworben und durch zwei Validierungstests ausgeführt, hatte aber KEINE Matrixzeile und keine Szenarioart, sodass sie aus einem Lauf überhaupt nicht erreichbar war. Sie wurde in Prosa behauptet, fehlte im Register und war in der Engine zugleich unerreichbar. Die Zeile und die Art wurden gemeinsam hinzugefügt. { "0.30" }, Runde { "2" } (vorregistriert db0eb9ec), blockiert (bleibt MODELLED): Die Sichtbarkeit nach ANISE { "0.10.6" } und ein numpy-DOP auf der Geometrie der Zeile stimmen überein (sichtbare Mengen exakt, einschließlich { "72" } Fällen nahe dem Horizont und { "48" } nahe der Maske; DOP innerhalb von { "7.2e-13" }), aber die berichteten Meter sind DOP mal ein illustrativer Fehler der Entfernungsmessung von { "1.158" } m als Wurzel der Quadratsumme ohne unabhängige Referenz; die Eingrenzung, die sie ausschließen würde, wartet auf eine Entscheidung des Verantwortlichen

# text
seg-2e097e952eb5 = lunar_beacon::tests (Horizontsichtbarkeit gegen die geschlossene Form L01; das durch Baken ergänzte DOP gegen das unergänzte; die Wurzel der Quadratsumme des Fehlerbudgets; die Beziehung von DOP zu Metern); tests/validate_p2_beacon_before_after_table.rs (die gesamte Vorher-nachher-Tabelle auf einen eingecheckten Referenzstand festgelegt bei relativ { "1e-9" }); tests/validate_p2_beacon_before_after_independent_dop.rs (dieselbe Geometrie über einen UNABHÄNGIGEN DOP-Pfad, sodass die Ergänzung nicht gegen den Kernel geprüft wird, der sie erzeugt hat); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal begrenzt den horizontalen Positionsfehler mit k Sigma, den die blinde Gleichtaktklasse beiträgt, indem blind_position_covariance = S<em>Cov</em>S^T gebildet und in ENU projiziert wird; integrity_envelope berichtet hpl_total = hpl_araim + cmpl. Der Unterschied, den das Paar herausstellen soll: Der RESIDUEN-Test von RAIM/ARAIM ist nachweislich blind für Fehler in range(G), der ARAIM-SCHUTZPEGEL aber nicht - sein fehlerfreier Term begrenzt sie bereits bis zu einem URA des Anbieters plus nominalem Bias. Der CMPL ist daher nur der anbieterübergreifende ÜBERSCHUSS, den die URA/ISM eines einzelnen Anbieters je Anbieter nicht überdeckt, und die Summe ist eine konservative Schranke nach der Dreiecksungleichung statt einer RSS, gültig nur dort, wo dieser Überschuss nicht bereits in der URA enthalten ist.

# text
seg-753412b4c8f3 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Analytische Projektoralgebra, gegen sich selbst geprüft: Eine auf range(G) beschränkte Kovarianz muss einen positiven CMPL ergeben, eine auf den Paritätsraum beschränkte Kovarianz muss ungefähr null ergeben, und die Hüllkurve muss zwei zum Messraum orthogonale Beiträge summieren. Die Gleichtaktkovarianz, die Konstellationsgeometrie und k sind repräsentative modellierte Eingaben, KEIN zertifiziertes Budget, und es wird nicht behauptet, dass die Dreiecksschranke scharf ist. HINWEIS ZUR HERKUNFT: cmpl_horizontal, blind_position_covariance und integrity_envelope sind öffentlich und ausgeliefert, und ihre Unit-Tests wurden bereits von der Zeile zur Gleichtaktblindheit zitiert, aber die AUSSAGE ZUR HÜLLKURVE selbst hatte keine Zeile - sodass der eine Vorbehalt, der sie ehrlich hält, nämlich dass die Summe eine Dreiecksschranke und keine RSS ist, nirgends im Register stand. Die Zeile erfasst die Aussage und den Vorbehalt gemeinsam.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-a4d8fdc530e4 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Analytische Struktur des Datumsdefekts — der nicht beobachtbare Modus des absoluten Bezugssystems liegt im Nullraum der Fisher-Information (geschlossene Form), die Rangschwelle entspricht der veröffentlichten Begründung des 3-Stationen-Entwurfs, und der Schätzer erreicht die resultierende CRLB in der Monte-Carlo-Simulation. Die Mondgeometrie selbst ist ein repräsentatives Netz (keine geflogene Ephemeride), daher bleibt die Zeile MODELLED; die zugrunde liegende FIM/CRLB-Engine wird separat gegen die geschlossenen Formen von Kay ({ "1993" }) geprüft. { "0.30" }, Runde { "2" } (vorregistriert fab02df9), blockiert (bleibt MODELLED): NumPy/SciPy berechnen Rang und Defekt an der angegebenen Schwelle von { "1e-9" }, den Anteil der Stationsachsen am Nullraum (innerhalb von { "8.4e-10" }) und die Stations-CRLB (innerhalb von { "1.2e-10" }) an { "17" } eingecheckten, von Kshana erzeugten Konfigurationen neu (P2). Nicht aufgestiegen: Die Aussage, dass der Schätzer die Schranke erreicht (Monte-Carlo-Effizienz etwa { "0.98" }), hat keine unabhängige Referenz, und die Eingrenzung, die sie bei MODELLED belassen würde, wartet auf eine Entscheidung des Verantwortlichen

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (rangdefizitär ohne Erdbasislinien; drei Basislinien stellen den vollen Rang wieder her — die 3-Stationen-Schwelle aus dem Informationsrang, nicht aus dem Lösungsfehler; Stations-CRLB vom Schätzer mit Effizienz { "0.98" } erreicht; CRLB wird mit den Basislinien monoton enger); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-5fda3995c3fb = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Referenz: die Werte, die LSIS V1.0 zur Validierung abdruckt (Tabellen C-1 bis C-5, D-1 bis D-6, E-1 bis E-6), und seine elektronischen Codedateien aus Anhang { "3" }, unter einem vor dem Vergleich festgelegten Kriterium von null Abweichungen. Das Kriterium wird von einer gedruckten Zelle verfehlt, die mit der eigenen Datei aus Anhang { "3" } der Norm intern unvereinbar ist, daher bleibt die Zeile MODELLED; eine Erratum-Notiz ist entworfen. Dieselben Chips entsprechen auch denen von LANS-AFS-SIM (Zeile 'LunaNet AFS baseband rendering against an independent generator, given its channel state')

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (IS-GPS-800J indices)

# text
seg-d111b6550515 = lunar_afs::codes::tests (Register maximaler Länge, Legendre-Balance, G2-Verzögerungs-Round-Trip, Stufenkomposition); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (ohne den LSIS-Cache: vier zitierte Zahlen legen den Befund fest; mit ihm: { "2 937 232" } Chips und Bits gegen die Dateien aus LSIS-Anhang { "3" }, gedruckte ersten/letzten { "24" } Chips, Legendre-Tabellen D-1 und E-1 und G2-Initialisierungen ergeben genau einen abweichenden Posten, die Zelle 'letzte { "24" } Chips' von PRN { "147" } in Tabelle E-5, die die von PRN { "151" } dupliziert, während die Datei aus Anhang { "3" } mit dem Generator übereinstimmt); der strikte vorregistrierte Test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact wird mit dieser Lücke ignoriert

# text
seg-f30130dca525 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Bibliothek: PocketSDR-AFS (T. Ebinuma nach PocketSDR { "0.13" } von T. Takasu, BSD-2-Clause, Commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-Band-Build, Kopie nur mit Ausgabe der Log-Stufe), unter vor jedem Lauf festgelegten Kriterien. Der dritte vorregistrierte Vergleich erfüllt seine Zielwerte C1 und C2 für Dekodierung und Verfolgung vollständig, aber nicht seine Schranke G0 wie geschrieben (zwei Läufe des unveränderten Empfängers unterscheiden sich in denselben vier Erfassungsaufzeichnungen), und der zweite verfehlte mit { "5" } Verletzungen, daher bleibt die Zeile MODELLED. LANS-AFS-SIM und PocketSDR-AFS haben einen gemeinsamen Autor und zählen als eine unabhängige Implementierung; die Prüfungen mit gedruckten Vektoren in der Zeile zur Rahmenkodierung schützen vor einer gemeinsamen Fehllesung

# text
seg-8cd700abad59 = lunar_afs::waveform (recording and truth labels), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (dritte Vorregistrierung: { "2" } Knoten, { "4" } Kanäle verfolgt, schlechtester Dopplerfehler { "0.57" } Hz, schlechtester Codeversatzfehler { "0.008" } Chip, alle { "6" } Rahmen mit dem richtigen TOI über den Umbruch { "99" } -> { "0" } und passendem Subframe { "2" } dekodiert; G0 nicht erfüllt wie geschrieben, die eigene Lauf-zu-Lauf-Variation des Empfängers in seinen Erfassungsaufzeichnungen); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (zweiter: { "5" } Verletzungen); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (erster: ungültig); die strikten Tests der drei Dateien werden mit ihren Lücken ignoriert

# text
seg-2f05d26e8be6 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — gps-sdr-sim (MIT, Commit 28ca29a6, als separates Programm über einen eingecheckten Prüfaufbau ausgeführt), vorregistriert f88f2969 mit einem bitgenauen Zielwert für (A) C/A-Chips, (B) jedes berechnete LNAV-Feld, (C) jedes Paritätsbit. BEFUND: (A) { "0" } von { "32 736" } Chips unterscheiden sich, (C) die Parität von { "0" } von { "1 920" } Wörtern unterscheidet sich, (B) { "230" } von { "1 152" } berechneten Feldern unterscheiden sich um eine Einheit: eph2sbf von gps-sdr-sim schneidet mit C-Casts in Richtung null ab, wo die gesendete Ganzzahl Rundung braucht (jeder abweichende Wert liegt innerhalb von { "0.01" } einer Einheit von Kshanas gerundeter Ganzzahl). Bleibt MODELLED: Der registrierte Zielwert war die Konjunktion

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (festgelegter Befund); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (strikt, mit der Lücke ignoriert); gps_lnav::tests

# text
seg-d61a6fd7896c = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — I/Q-Abtastwerte von gps-sdr-sim (MIT, Commit 28ca29a6) und sein eigener Kanalzustand, vorregistriert 7777da53: (B1) jede simulierte PRN erfasst, (B2) keine andere PRN erfasst, (B3) Codephase innerhalb von { "0.5" } Chip, (B4) Doppler innerhalb von { "125" } Hz. BEFUND: B1, B3 und B4 gelten in beiden Fenstern (schlechtester Wert { "0.195" } Chip, { "72" } Hz), aber B2 scheitert: Alle { "21" } PRNs, die gps-sdr-sim nicht simuliert hat, überschreiten ebenfalls die Schwelle (Statistik { "151" } bis { "206" } gegenüber { "79.5" }; simulierte PRNs { "1 300" } und höher). Die Schwelle ist für gaußsches Rauschen der gemessenen Abtastleistung gesetzt; gps-sdr-sim fügt kein Rauschen hinzu, daher enthalten die Zellen einer nicht vorhandenen PRN die Kreuzkorrelation der anderen Satelliten. Bleibt MODELLED: Der registrierte Zielwert war die Konjunktion

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (festgelegter Befund); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (strikt, mit der Lücke ignoriert)

# text
seg-9f9b58158cde = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Die eigenen geschlossenen Formen der Monitore auf Kshanas eigenen GPS-L1-C/A-Szenen (Rauschen und legitime Signale; Dämpfungsereignisse der eigenen Signale der Satelliten), gegen Zielwerte, die in docs/design/MONITORS-IN-CAMPAIGN.md vorregistriert sind (382ab2f4). BEFUND: M1, M2 und M4 erreicht. M3 bei der Erkennung erreicht ({ "18" } von { "18" } Dämpfungen, P_md { "0" }) und bei der Zeitklausel NOT MET: Die mediane Zeit bis zur Erkennung beträgt { "1.001" } s gegenüber { "2" } x ARL1 Abtastwerten = { "0.433" } s. Der CUSUM sieht eine Schätzung je Fenster von { "1" } s, daher liegt die Schranke für die Abtastwertanzahl unter einem Abtastwert. Nur interne Konsistenz: Es wird kein realer Empfänger und keine aufgezeichnete Störung geprüft

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } von { "5900" } Blöcken gegen das binomiale Intervall von { "99" } % [{ "40" }, { "80" }] von P_fa { "0.01" }), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (Delta { "0.0160" }, Verhältnis { "0.0131" } gegenüber { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } gegenüber { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (strikt, mit der Lücke ignoriert); Tests zu iq::campaign::detect; Tests zu iq::monitor::stats (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (die festgelegten Digests sind ohne die Tabelle unverändert)

# text
seg-491de717dd05 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Synthetische Kampagnen aus Kshanas eigenen GPS-L1-C/A-Szenen (Dämpfungen der eigenen Signale der Satelliten), gegen Zielwerte, die in docs/design/DETECTION-ROC.md vorregistriert sind (b47e358d). BEFUND: R2 erreicht (Zufallsniveau, wenn nichts zu erkennen ist). R1 NOT MET: cn0_drop AUC { "0.7855" } gegenüber { "0.95" }, weil jedes negative Fenster nach einem Ereignis den Zerfall des CUSUM aus der Erkennung erbt (alle { "18" } negativen Fenster nach dem Ereignis erreichen { "81" } oder mehr; alle { "18" } vor dem Ereignis bleiben bei { "0" }). Nur interne Konsistenz: Es wird kein realer Empfänger und keine aufgezeichnete Störung geprüft

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } bei angegebenen Ereignissen, die nichts dämpfen); r1_the_cn0_drop_roc_separates_6_db_attenuations (strikt, mit der Lücke ignoriert); Tests zu iq::campaign::detect (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-e40884e4fef7 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Synthetische Parameterrückgewinnung auf Kshanas eigenen GPS-L1-C/A-Szenen mit einem bekannten C/N0-Profil, das aus der Formel in Abschnitt { "3.1" } aufgeprägt wird, von kshana iq campaign verfolgt und bewertet, gegen Zielwerte, die in docs/design/LABFIT-FROM-IQ.md vorregistriert sind (Abschnitt { "5.1" }, geändert 2026-10-12 in b7117bf, Abschnitt { "13" }). Der C/N0-Schätzer der Kampagnen (M2M4) wurde in 5b13e3c2 festgelegt, vor der ersten Bewertung des Zielwerts gepusht (gemeinsam mit dem Anpassungscode eingecheckt, nicht allein), nach einem offengelegten diagnostischen Verfolgungslauf. BEFUND an der Kampagne mit 18-Ereignis-Zielwert: (c) PASS; (a') NOT MET, Fehler von delta_eff -1.097 dB gegenüber { "0.5" } dB (weiterhin -0.89 dB bei Klassen ab { "38" } dB-Hz); (b') NOT MET, { "0" } von { "50" } Kampagnen überdecken die Wahrheit (Fehler -1.189 +/- { "0.093" } dB, Intervall etwa { "0.3" } dB); (d) NOT MET, geschlossene Form { "2.20" } dB unter dem direkten J/S bei Verlust, etwa die angepassten Verweilzeiten des Abfalls mal die Rampenrate ({ "2.09" } dB); die ursprünglichen Q-Klauseln von (a) und (b) sind NOT MET, weil Q nicht identifizierbar ist. NACHFOLGEPRÜFUNG (Zielwerte vorregistriert in 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): Bei einer Kampagne mit gestuftem J/S wird delta_eff innerhalb von +{ "0.185" } dB zurückgewonnen (S1 MET: Der Rampenfehler ist Schätzerverzögerung); (d) wie geschrieben darauf wird vom Modell der Verfolgungsschleife erreicht ({ "0.45" } dB), aber nicht vom empirischen ({ "6.42" } dB), daher ist S2 NOT MET; bei einer frischen Rampenkampagne liegt (d) mit den angepassten Verweilzeiten des Abfalls zuzüglich der Rampenrate jedes Ereignisses für beide Modelle innerhalb von { "1" } dB (R1 MET), und (a') und (d) wie geschrieben werden erneut verfehlt (-1.25 dB; { "2.32" } und { "9.47" } dB). Die Methode wird geprüft, kein Empfänger: Sie kann aus synthetischen Daten nicht VALIDATED werden

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (PI90-Überdeckung { "0.891" } über { "558" } Klassen, { "0.900" } über { "10" } Ereignisse bis zum Verlust unter jedem Lock-Modell), the_report_carries_its_inputs_censoring_validation_and_labels (Eingaben, Zensierung, [validation]-Hash und Urteile, Audit des Einheitenblocks), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db und bar_b_prime_ci_subset (strikt, mit der Lücke ignoriert); bar_b_prime_full_set_of_50_campaigns (ignoriert, vor der Veröffentlichung ausgeführt); Tests zu iq::labfit::cn0 (exakte Q-Delta-Entartung, Delta-Rückgewinnung bei angegebenem Q, Schwellenumkehrung in geschlossener Form); Tests zu iq::labfit::iqfit (die Lock-Modell-Bedingungen reproduzieren das C/N0-Modell exakt); tests/iq_labfit_followup.rs (die in 1e532f84 registrierte Nachfolgeprüfung: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign mit Zusicherung des festgehaltenen NOT MET, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, im Release)

# text
seg-52d2a721c38a = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — RTKLIB v2.4.2-p13 (BSD-2-Clause, Commit 71db0ffa) decode_word/decode_frame als separates Programm, vorregistriert ca5f0142: R1 Parität und Dekodierung, R2 dekodierter Wert gleich Kshanas Ganzzahl mal dem Skalenfaktor aus IS-GPS-200 innerhalb von relativ { "2" }^-52, R3 innerhalb eines halben Quants der Eingabe. BEFUND: R1 { "960" } von { "960" } Wörtern und { "96" } von { "96" } Subframes; R3 jeder Parameter, jede Woche und jede Referenzzeit exakt; R2 scheitert bei { "41" } Werten (af1, delta-n, IDOT) um { "1" } bis { "4" } Einheiten an der letzten Stelle, weil P2_43 in RTKLIB die Dezimalzahl { "1.136868377216160E-13" } ist, relativ { "2.6e-16" } von { "2" }^-43 entfernt; die Division durch die Konstante von RTKLIB liefert in jedem Fall Kshanas Ganzzahl zurück. Bleibt MODELLED: Der registrierte R2-Zielwert war zu eng für die eigene Konstante der unabhängigen Referenz

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (festgelegter Befund); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (strikt, mit der Lücke ignoriert)

# text
seg-d0d7bf57aa68 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — RTKLIB v2.4.2-p13 (BSD-2-Clause, Commit 71db0ffa) readrnx liest die tägliche IGS-Broadcast-Datei BRDC00IGS_R_20250610000_01D_MN.rnx, und decode_word/decode_frame dekodieren Kshanas Wörter, als separates Programm ausgeführt; vorregistriert d4d9eb9d, bevor die Datei abgerufen wurde, Zielwert mit exakten Ganzzahlen. Mutation: Abschneiden statt Runden ergibt { "235" } Fehlschläge. Frühere Vergleiche desselben Kodierers sind als Befunde festgehalten: gegen gps-sdr-sim, das abschneidet ({ "230" } Felder), und gegen die skalierten Werte von RTKLIB, deren dezimale Konstante { "2" }^-43 einen Zielwert von einem ulp verfehlte ({ "41" } Werte). Nachprüfung durch den Integrator (bleibt MODELLED): Der Vergleich stimmt überein, und eine Mutation des Paritätssatzes lässt ihn ebenfalls rot werden, aber die Vorregistrierung d4d9eb9d erreichte den öffentlichen Branch um { "20" }:{ "02" }:{ "29" } UTC, zwei Sekunden nach dem Ergebnis-Commit 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), der bereits die Ausgabe von RTKLIB für die Datei enthält, daher kann die Reihenfolge 'registriert, bevor die Datei abgerufen wurde' nicht gezeigt werden; eine frische Registrierung, die vor dem Abruf einer ungesehenen Broadcast-Datei gepusht wird, würde dies klären

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } Satelliten der IGS-Broadcast-Datei vom { "2" }. März { "2025" }: { "960" } von { "960" } Wörtern bestehen die Paritätsprüfung von RTKLIB, { "96" } von { "96" } Subframes werden dekodiert, { "608" } von { "608" } dekodierten gesendeten Ganzzahlen entsprechen denen von Kshana, jede Eingabe innerhalb eines halben Quants, Woche und Zeiten exakt); gps_lnav::tests

# text
seg-407f33fff57c = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — GNSS-SDR { "0.0.19" } (GPL-3.0, separates Programm, festgelegte Konfiguration) auf den neun L1-Stapeln ohne Oberfläche und dem ROH-C/N0 des Flugempfängers (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), vorregistriert 768cb62b. BEFUND: Kshanas Leser dekodiert alle { "288" } verglichenen Abschnitte identisch zu einem unabhängigen Konverter; GNSS-SDR erklärt { "266" } von { "288" } Suchen für positiv, und Kshana stimmt bei allen { "266" } Entscheidungen überein, aber nur { "250" } liegen auf der Zelle von GNSS-SDR (A2 scheitert); der C/N0-Zweig ist leer, da keine ROH-Epoche des Flugs innerhalb von { "30" } s eines Stapels liegt (nächste { "141" } s). Die meisten Positiven sind Artefakte: Die nackten Zweierkomplement-Pegel tragen einen Mittelwert von -0.5 bei I und Q, eine Linie bei der Frequenz null { "32" } dB über dem Rauschen in einem { "1" }-kHz-Behälter, die beide Empfänger erfassen. Zwei Stapel (OP5, OP12) wurden irrtümlich ausgeschlossen: Eine von Ziffern bereinigte Lesart ihrer Metadaten wurde für einen Widerspruch zu ihren Headern gehalten; die wahre Ursache war, dass der Leser einen Abtastwert, der breiter als ein Wort ist, nicht lesen konnte (inzwischen behoben). Bleibt MODELLED

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (festgelegter Befund, datenabhängig freigegeben); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (strikt, mit der Lücke ignoriert); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-90535435d10d = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Vorhergesagter Doppler aus den endgültigen Bahnen von ESA/ESOC und der rekonstruierten Trajektorie NAIF CLPS (xval/lugre-predicted-doppler/predict.py, unabhängig von Kshana), vorregistriert 0d1839d2. BEFUND: Alle { "288" } Suchen überschreiten die Schwelle auf Rauschen (Statistiken der Abtastleistung etwa { "430" } bis { "520" } gegenüber { "346.3" }), daher gilt P1 trivial und P3 gilt ({ "274" } von { "288" } als sichtbar vorhergesagt), während P2 bei { "4033" } von { "4036" } Paaren scheitert. Das bandbegrenzte Frontend hebt das Rauschen jeder Zelle etwa { "1.46" }-fach (festgelegt: Rauschboden { "292" } gegenüber dem weißen Rauschen { "200" } bei OP2 PRN { "1" }), was die Statistik der Abtastleistung nicht sieht. Bleibt MODELLED

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (festgelegter Befund, datenabhängig freigegeben); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (strikt, mit der Lücke ignoriert)

# text
seg-46dbb16e2ba8 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Vorhergesagter Doppler aus den endgültigen Bahnen von ESA/ESOC und der rekonstruierten Trajektorie NAIF CLPS (xval/lugre-predicted-doppler/predict.py, unabhängig von Kshana), vorregistriert a81a9a4e. BEFUND: P1 und P3 gelten ({ "4" } Stapel, { "12" } von { "12" } Erfassungen als sichtbar vorhergesagt), aber P2 scheitert bei { "8" } von { "8" } Paaren. Die zwei stärksten Paare stimmen mit der Vorhersage im Betrag überein, mit umgekehrtem Vorzeichen (OP2 PRN 18/24: +{ "7670.0" } Hz gemessen, -7693.9 vorhergesagt; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), die registrierte Reihenfolge mit I im unteren Halbbyte ist also das Konjugierte der Stapel; die sechs Detektionen knapp über der Schwelle stimmen mit keinem der beiden Vorzeichen überein. Auch die Doppler-Streuung der Verfeinerung ({ "30" } bis { "50" } Hz zwischen zwei Läufen) wurde von der Registrierung unterschätzt. Bleibt MODELLED

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (festgelegter Befund, datenabhängig freigegeben); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (strikt, mit der Lücke ignoriert)

# text
seg-e10ffc7f4280 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Vorhergesagter Doppler aus den endgültigen Bahnen von ESA/ESOC und dem NAIF-CLPS-Kernel des Landeplatzes von Firefly (xval/lugre-predicted-doppler/predict_surface.py, unabhängig von Kshana), vorregistriert 2108e6ff an zuvor nie geöffneten Stapeln. BEFUND: Die Nicht-Leerheit scheitert; kein Stapel enthält zwei Erfassungen. OP40 ausgeschlossen (die Metadaten nennen eine fehlende Datei); OP38, OP73, OP77_0, OP77_1 erfassen nichts und zeigen keinen Fehlalarm bei { "1e-7" } (höchste Statistiken { "325" } bis { "356" } gegenüber { "385.9" }); OP74 und OP76 erfassen PRN { "31" } und OP78_0 und OP78_1 PRN { "12" }, jeweils allein, alle als sichtbar vorhergesagt. Bleibt MODELLED. Offengelegte Abweichungen: Der registrierte Doppler-Zielwert von { "10" } Hz beruht auf einer synthetischen Monte-Carlo-Simulation der kohärenten Verfeinerung, nicht auf der Streuung der bereits gesehenen Stapel, die der Integrator verlangt hatte; OP40 wurde vor dem Lauf ausgeschlossen, weil seine Metadaten eine Abtastdatei nennen, die der Datensatz nicht mitliefert

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (festgelegter Befund, datenabhängig freigegeben); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (strikt, mit der Lücke ignoriert)

# text
seg-9b89d7ff555a = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Identität der differentiellen Fehlerauslöschung + Wiederverwendung der SBAS-PL-Maschinerie nach DO-229E; die Einzeldifferenz + WLS-Lösung wird zusätzlich gegen lsq()/matinv() von RTKLIB (Takasu, BSD-2-Clause, kompiliertes C) gegengeprüft — unabhängiger Lösercode, aber dieselbe Algebra der LOS-Differenz erster Ordnung, daher weiterhin InternalConsistency

# text
seg-b4e5e57515cc = lunar_dpnt::tests (der Uhren-Gleichtakt löscht sich exakt aus; das Residuum wächst mit der Basislinie; verwendet SBAS PL erneut; die Satellitenanzahl wird bis zur Grenze des Builders von { "24" } eingehalten, sodass eine größere Konstellation nicht stillschweigend eine kleinere zurückgeben kann); tests/lunar_differential_pnt_reference.rs (Einzeldifferenz-Residuum + WLS-Positionslösung gegen lsq() von RTKLIB, aus C-Quelltext kompiliert)

# text
# c1: oem
seg-4d32db579be8 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Der OEM-Export von kshana für den Mond, neu geparst durch die unabhängige Drittanbieter-Bibliothek <c1/> (R. J. Anderson): Bezugssystem- und Zeit-Token und Zustand je Epoche stimmen auf Schreibgenauigkeit überein ({ "1" } mm / { "1e-9" } km/s), und ein Export ohne TIME_SYSTEM wird abgelehnt — ein struktureller Austausch-Round-Trip; die physikalische Semantik von Bezugssystem und Zeit des Mondes wird von ihren eigenen Zeilen validiert, daher bleibt dies MODELLED. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): Ein zweiter unabhängiger Leser, der CCSDS-OEM-Parser von Orekit { "12.2" } (Apache-2.0, strikte Vorgaben), lehnt beide Monddateien ab, weil er die Zeitsysteme LTC und TCL nicht implementiert (er dekodiert das OEM der Crate in EME2000/UTC und dekodiert die Monddateien, sobald TIME_SYSTEM durch TDB ersetzt wird); oem { "0.4.5" } dekodiert sie nur durch Ausweichen vom nicht unterstützten Zeitsystem innerhalb der geschriebenen Genauigkeit. Der Austausch dieser Monddateien mit gängigen CCSDS-Lesern ist nicht belegt

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (OEM trägt REF_FRAME/TIME_SYSTEM des Mondes; Zeitmetadaten durchlaufen den Round-Trip; KIF-Hülle); tests/lunar_interoperability_export_reference.rs (das ausgegebene OEM des Mondes von kshana, neu geparst durch die unabhängige Python-Bibliothek <c1/>: Token REF_FRAME/TIME_SYSTEM/CENTER + Zustand je Epoche auf Formatgenauigkeit; ein beschädigter Export wird abgelehnt); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-2ceda14c0a73 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Von Hand hergeleitete Formeln je Metrik: inverse Simpson-Diversität, gewichteter Mittelwert als Gesamtwert, begrenzte/unbegrenzte Zeitachsendauern, Stufenleiter nach dem schwächsten Glied

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (Monotonie, Grenzen des Gesamtwerts, Stufenobergrenze, modellierte Herkunft); resilience::diversity::tests (inverse Simpson, Gleichtakt, SPOF)

# text
seg-173a6b137751 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Identitäten von Rangstatistiken in geschlossener Form (tau in [-1,{ "1" }] mit von Hand berechneten Werten; deterministisches gesetztes Dirichlet) und konstruierte stabile/instabile Zeugen

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (Kendall-Tau-Handbeispiel, Dirichlet-Simplex, Flip-Rate); resilience::study::tests (Stabilitätskontrolle, Instabilitätszeuge, deklariert gegen gemessen, Diversitätskollaps)

# text
seg-6ee8465d60c7 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Invarianten in geschlossener Form, die auf die compliance-Disziplin 'Repräsentativität begründet + Lücken bis zum Flug identifiziert' abgebildet werden; an die Grenze zwischen Verifikationsstatus und Art der unabhängigen Referenz gebunden

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON-Felder)

# text
seg-177c7c6f506a = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Identitäten für Nutzen/Gewinner in geschlossener Form + getreue Umhüllung des bestehenden quantum_trade::TradeResult; Ehrlichkeit an das Repräsentativitätsregister und die Verifikationsmarkierungen gebunden

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (Polarität des Nutzens höher/niedriger-ist-besser, umhüllt ein reales TradeResult getreu, unehrliche Evidenz abgelehnt, validierte FoM braucht externen Anker, deterministisches JSON)

# text
seg-05e779241ded = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Wiederverwendete Koeffizienten für Uhren/CAI (holdover/clock_state, veröffentlichte Werte) + Identitäten für Schrotrauschen/Verlust in geschlossener Form für die Verschränkungsstrecke

# text
seg-fe77856b9e9d = quantum_devices::tests (Uhrenkarten ehrlich+geordnet; Verschränkungspräzision ~1/sqrt(tau); erkannte Rate -10x/10dB; Dunkelzählungen verschlechtern; Schranken der systematischen Untergrenze; Karte modelliert+gültig)

# text
seg-06a01a48fcad = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Quadraturbudget in geschlossener Form über wiederverwendeten validierten Kerneln (ADEV gegen Stable32/NIST; TPL-Schranke; Erkennung analytic_pd/pmd); Ehrlichkeit an das Repräsentativitätsregister gebunden

# text
seg-65f4bc801f94 = timetransfer_chain::tests (die Präzision verbessert sich mit der Integration; Quanten können gewinnen UND verlieren; PL endlich-positiv; Sicherheits-FoM in [{ "0,1" }] und wächst mit der Angriffsverzögerung; Anomalie-Pd monoton; Trade is_honest)

# text
seg-6ccf2bd93426 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Wiederverwendete Inertialbudgets, gegengeprüft mit einer unabhängigen Octave-Doppelintegration derselben Koppelnavigations-DGL (andere Laufzeit, gemeinsames Modell → ReferenceImpl) sowie dem veröffentlichten Kurzzeitrauschen von Freier-2016 als einseitigem Anker; der Verbund aus Quanten gegen klassisch bleibt MODELLED

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (Quanten schlagen klassisch bei einem langen Ausfall; der Vorteil hängt vom Ausfall ab; Trade is_honest); tests/gnss_free_quantum_navigation_reference.rs (Wachstum des Koppelnavigationsfehlers der Position gegen eine unabhängige Octave-Doppelintegration + den veröffentlichten Rauschanker von Freier-2016)

# text
seg-a06ba11bd079 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Gaußsche AUC in geschlossener Form = Phi(mu/(sigma*sqrt2)), gegengeprüft mit dem extern validierten eval_stats::bootstrap_auc_ci (gegen scikit-learn) + analytische Erkennungsschwellen

# text
seg-8e49ee940482 = quantum_faults::tests (analytische AUC-Bekanntwerte; empirische Bootstrap-AUC schließt die geschlossene Form ein; Quanten erkennen kleinere Fehler / höhere AUC; der Vorteil verschwindet bei riesigen Fehlern; Katalog mit 5 Klassen; Trade is_honest)

# text
seg-c38a05cc3fdb = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Selbstkonsistenz von Schätzer und Geometrie: Round-Trips vorwärts→invers, die Identität von Fisher/CRLB J·CRLB=I, Monotonie von GDOP und der Schätzer, der seine eigene Cramér-Rao-Schranke unter Monte-Carlo-Rauschen erreicht — Prüfungen der internen Konsistenz, KEIN externer Datensatz, daher bleibt die Zeile InternalConsistency. MODELLED passive Geolokalisierung — Punktquellenmodell mit Sichtlinie; keine Terme für Mehrweg / NLOS, Empfängeruhrenversatz oder atmosphärische Refraktion. { "0.30" }, Runde { "2" }, gegen Ho und Chan { "1993" } und Ho und Xu { "2004" } (vorregistriert f89018b8, { "1" } % jedes gedruckten Werts), ein Befund (bleibt MODELLED): Die oberflächenbeschränkte TDOA-Schranke reproduziert die geometrischen Faktoren bei { "40" } N (-0.11 %, -0.02 %) und die maximale TDOA; die gemeinsame TDOA+FDOA-Schranke reproduziert Abb. { "6" } (+{ "0.06" } %, -0.17 %) und, an der Quelle, die der eigene Code der Autoren für Abb. { "7" } nennt (nach Kenntnis dieses Ergebnisses geschriebene Änderung, offengelegt), Abb. { "7" } (+{ "0.11" } %, -0.02 %); sie entspricht dem veröffentlichten Schrankencode der Autoren (BSD-artig, unter GNU Octave ausgeführt) auf { "3e-12" }; der kovarianzgewichtete Maximum-Likelihood-Löser erreicht die gedruckte Schranke (+{ "0.3" } bis +{ "0.4" } %). Die Ottawa-Faktoren, die die Arbeit aus einer Monte-Carlo-Simulation druckt ({ "251" }, { "7.1" }), weichen um +{ "1.3" } % und +{ "4.4" } % ab, außerhalb des Zielwerts von { "1" } %

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (rauschfreie TDOA vorwärts→invers auf { "1e-6" } m; J·CRLB=I mit einer symmetrischen positiv definiten Kovarianz; die Spur der Positionsvarianz der CRLB ist nicht steigend, wenn ein Empfänger hinzugefügt wird; gemeinsame TDOA+FDOA gewinnt Position+Geschwindigkeit eines bewegten Emitters zurück; <{ "4" } Empfänger abgelehnt); tests/geolocation_reference.rs (Round-Trips über vier Geometrien mit einem in 3-D diversen Netz; der Gauss–Newton-Schätzer erreicht seine Cramér-Rao-Schranke — die empirische Fehlerkovarianz folgt der analytischen Schranke über { "4000" } Monte-Carlo-Läufe); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound und finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, festgelegt)

# text
seg-8ac63d14e24b = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: die Beziehung und die Konstanten wie in NASA TR R-376 gedruckt, eine Konvergenzprüfung mit halbem Schritt und die erwartete Reihenfolge der Spitzen von Erwärmung und Verzögerung. WAS NICHT GEPRÜFT IST: Es wurde kein veröffentlichter Heizwert verglichen (die Stardust-Arbeiten geben eine Auslegungsgrenze und eine Schätzung aus konvektiv plus Strahlung von etwa { "1200" } W/cm2 an, die eine nur konvektive Beziehung nicht treffen kann); keine Strahlungserwärmung, keine Korrektur für Wandtemperatur oder Katalyse und keine Reaktion des Hitzeschutzes.

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (erfasst { "746" } W/cm2 für Stardust ohne Zielwert)

# text
seg-1f6aec0085c2 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Geschlossene Formen: die Beugungs-MTF bei halber Grenzfrequenz, die Ein-Pixel-Rampenkante einer reinen Detektorapertur (RER { "1" }), die Normalverteilungskante einer gaußschen Unschärfe (RER = erf(0.5/(sigma sqrt { "2" }))), die Skalierung des Schrotrauschens und die Koeffizienten von GIQE { "4" } wie veröffentlicht (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). WAS NICHT GEPRÜFT IST: Es wurde kein externer Imager, keine gemessene MTF und kein bewertetes Bild verglichen; die GIQE ist eine empirische Regression mit eigenem Fehler; kein Streulicht, keine atmosphärische MTF, keine MTF-Kompensation und kein Aliasing.

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-3f515354b4d2 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: die exakte Identität Brennschlussgeschwindigkeit = Summe Isp g0 ln(m0/mf) minus die vier integrierten Verluste (Residuum unter { "1e-6" } m/s), die Gleichung von Ziolkowski bei einem vertikalen Brand im Vakuum mit Gravitation als einzigem Verlust und die Drücke nach US76 auf Meereshöhe und an der Tropopause. WAS NICHT GEPRÜFT IST: Die Verluste keines veröffentlichten Fahrzeugs wurden verglichen; keine Erdrotation, kein Coast, keine Drosselung und keine Lenkung über den Kick hinaus; konstantes C_D; kein Trajektorienoptimierer.

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-55a57682f26d = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Das Vorwärtsmodell und die gelöste Gleichung stimmen auf { "1e-15" } s überein, der Sagnac-Term entspricht der unabhängigen BIPM-Schleifenform 2A omega/c^{ "2" } des Moduls, der ionosphärische Term ist { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, und die Rauschprozesse zeigen ihre erwarteten TDEV-Formen. WAS NICHT GEPRÜFT IST: Es wurde keine reale TWSTFT-Messung und kein Kalibrierbericht verglichen; die angegebenen Verzögerungen und Unsicherheiten sind Eingaben, nicht gemessen; die Stabilitäten gelieferter Reihen werden berichtet, nicht validiert.

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (die Zweiwegegleichung gewinnt den Versatz exakt zurück; der Sagnac-Term entspricht der geschlossenen BIPM-Schleifenform; der ionosphärische Term folgt der Frequenzaufspaltung, und die Troposphäre hebt sich auf; Flicker-Phase hat eine flache TDEV; ein tageszeitliches Residuum hebt die TDEV bei etwa einem halben Tag; ein Reziprozitätsfehler verschiebt den Versatz und nicht die TDEV; die Reihenstabilität entfernt eine Rate); time_transfer_budget::tests

# text
seg-4ca4b46b128c = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Die Numerik wird mit einem unabhängigen Programm verglichen (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } mit { "30" } Stellen, tanh-sinh-Quadratur auf der ursprünglichen Höhenvariablen und Gamma-Gamma-Dichten mit Bessel-K), das keinen Code mit Kshana teilt, unter Zielwerten, die festgelegt wurden, bevor irgendeine Implementierung existierte (xval/optical-atmosphere/PREREGISTRATION.md). WARUM MODELLED: Diese unabhängige Referenz wertet dieselben veröffentlichten Formeln aus, daher prüft sie die Implementierung der angegebenen Formeln und nicht die Atmosphäre; es wird kein ITU-R-Validierungsbeispiel und keine gemessene Szintillations- oder Schrägstrecken-Extinktionsaufzeichnung verwendet (die ITU-Werte sind eine offene Lizenzentscheidung und werden aus dem Repository herausgehalten). Das Niveau des Cn2-Profils, die Sichtweite, die Skalenhöhen von Aerosol und Molekülen, die Weglänge der Aperturmittelung und das Moment-Matching, mit dem die Aperturmittelung auf die Gamma-Gamma-Parameter angewandt wird, sind angegebene Eingaben oder Konventionen. Eine Quellenzeile im Modul hält fest, dass eine weit abgeschriebene Übersicht den zweiten Szintillationsexponenten als 7/6 druckt, wo Andrews und Phillips 5/6 angeben; die Form mit 5/6 ist implementiert

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (vorregistrierte Zielwerte A1-A3 gegen die unabhängige mpmath-Referenz: { "216" } Rytov-Gitterpunkte, schlechtester relativer Fehler { "3.4e-7" } gegenüber einem Zielwert von { "1e-6" }, Szintillation schlechtester Wert { "4.5e-16" }, Aperturfaktor schlechtester Wert { "5.7e-16" }, { "96" } Gamma-Gamma-Schwundwahrscheinlichkeiten schlechtester Wert { "1.3e-12" } in log10, optische Tiefe von Wolken und klarer Luft schlechtester Wert { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (Zielwert A5: Das Linkbudget mit pauschalem Verlust und die bestehenden Ausgaben zur Standortverfügbarkeit sind über { "1,000" } Parametersätze bitidentisch mit dem Basis-Commit)

# text
seg-6cf381ac2e3d = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: Grenzwerte in geschlossener Form und Monotonie des Diversitätsmodells, die geschlossene Form der Wolkenobergrenze und die Identitäten des Lognormal-Ausfalls. Es wird KEINE externe unabhängige Referenz beansprucht, und keine wurde verglichen: Es wird keine gemessene Verfügbarkeit einer optischen Bodenstation und keine Aufzeichnung wolkenfreier Sichtlinien verwendet. WARUM MODELLED: Das Wolkenklima (Wolkenwahrscheinlichkeit, Median und Streuung der Flüssigwassersäule, Ausfalldauern), die Unabhängigkeit von Wolken und Turbulenz, die Form der gaußschen Copula, die Dekorrelationslänge und jeder Technikgewinn sind Annahmen; die mitgelieferten Szenarien geben ILLUSTRATIVE Klimata an, keinen Datensatz. Um diese Zeile aufzuwerten, werden eine zitierte gemessene Verfügbarkeitsaufzeichnung und ein vor dem Vergleich registrierter Zielwert benötigt

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (Zielwert A4: rho = { "0" } entspricht der unabhängigen Vereinigung und rho = { "1" } dem besten einzelnen Standort auf { "1e-12" }, und null Monotonieverletzungen bei der Anzahl der Standorte und bei der Korrelation; der erste Lauf dieses Zielwerts verfehlte ihn um { "3e-9" }, weil die verwendete Normalverteilungsfunktion die Form nach Abramowitz-Stegun mit { "1.5e-7" } war, ein Implementierungsfehler, ersetzt durch die Verteilungsfunktion über die unvollständige Gammafunktion bei unverändertem Zielwert); optical_weather::tests und optical_sitediv::tests (monotone Marge, die Wolkenobergrenze als geschlossene Form, die Identitäten der Ausfalldauer, Inversion der Margensuche)

# text
seg-1d817d8409d3 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz mit dem Holdover-Modul, bitgenau; es wird KEINE externe unabhängige Referenz beansprucht. Die PSDs der Klassen sind die synthetisierten Untergrenzen bei langem tau, die das Holdover-Modul bereits mitführt, daher erben die Zahlen seinen angegebenen Vorbehalt, dass Holdover bis zu einer engen Schwelle von der angenommenen Untergrenze des roten Rauschens bestimmt wird und nicht von der zitierten Allan-Abweichung. Die Ausfalldauern sind ein Lognormalmodell mit angegebenen Parametern, keine gemessene Aufzeichnung der Wolkenverweildauer

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (Zielwert A6: Der Zeitfehler je Ausfall entspricht holdover::coast_phase_sigma und der Entfernungsfehler phase_to_range_m bitgenau über { "9" } Uhren, { "3" } mittlere Dauern, { "3" } Streuungen und { "4" } Quantile); optical_outage_holdover::tests

# text
seg-55ce1b6d2dfd = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Nur interne Konsistenz; es wird KEINE externe unabhängige Referenz beansprucht, und für eine Wetterrealisierung gibt es keine. Die Prüfungen vergleichen eine Ziehung mit der statistischen Ausgabe desselben Modells, daher sagt ein Bestehen, dass der Generator die angegebenen Verteilungen abtastet (Verfügbarkeit und Wolkenanteil der Ziehung liegen innerhalb vorregistrierter Toleranzen der angegebenen Werte), nicht, dass sich ein realer Standort so verhält. Die Reihe ist eine Realisierung, nicht das Klima: Ihre Verfügbarkeit weicht von der angegebenen um den Abtastfehler der Ziehung ab, und Szintillationsabtastwerte in verschiedenen Schritten sind unabhängig, eine angegebene Vereinfachung eines Prozesses, der in Millisekunden dekorreliert. Die Wettereingaben bleiben die Annahmen des Szenarios.

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (Zielwerte T1-T6 aus xval/optical-atmosphere/PREREGISTRATION-timeseries.md, vor dem ersten Lauf festgelegt: gleicher Seed gleiche Bytes und ein anderer Seed andere Bytes; kein Schlüssel ohne die Tabelle; über { "8760" } h bei { "600" } s, Seeds { "37" } und { "38" }, liegt die realisierte Verfügbarkeit jedes der drei Standardstandorte innerhalb von { "6" } Punkten der angegebenen (schlechtester Wert { "3.3" }) und der realisierte Wolkenanteil innerhalb von { "5" } Punkten der angegebenen Wahrscheinlichkeit (schlechtester Wert { "2.1" }); die Marge entspricht dem Budget minus den zwei Schwunden, und „up“ entspricht „Marge nicht negativ“ bei jedem Schritt; kein nicht portabler Mathematikaufruf im Modul; zu lange Läufe und fehlerhafte Schritte werden abgelehnt)

# text
seg-4dfa142a94c4 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Das PDS3-Label, das der Datenaufbereitungsprozess der DSN-Navigation zusammen mit der Datei erzeugt hat (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), geprüft gegen Zielwerte, die in xval/mro-odf/PREREGISTRATION.md vorregistriert wurden, bevor der Leser existierte. MODELLED, weil ein registrierter Zielwert (die Zeilen der Tabelle am Dateiende, { "121" } in der Datei gegenüber { "120" } im Label) verfehlt wurde; das Label ist dort intern inkonsistent. Stufe { "2" } (xval/mro-od/PREREGISTRATION.md, Änderungen A1 und A2 vor dem gewerteten Ergebnis): Der aus der Rekonstruktion des Navigationsteams von MRO (mro_psp5, NAIF) vorhergesagte Doppler stimmt mit dem beobachteten 2-Weg-Doppler mit Rampe auf { "12.5" } mHz bei Überflügen überein, die nicht in der Entwicklung verwendet wurden, Zielwert erreicht; die registrierte Bahnbestimmung scheiterte auf dem gewerteten Bogen (Normalmatrix nicht positiv definit) und erzeugte keine Bahn, daher wurden die Zielwerte für die Bahn nicht erreicht. Lauf { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, ein gedämpfter Schätzer, derselbe Bogen und dieselben Zielwerte, eine in docs/revisions offengelegte Wertungsänderung R2-A1) konvergierte: Die geschätzte Bahn liegt innerhalb von { "0.36" } km RMS ({ "0.53" } km maximal) der Rekonstruktion, Zielwerte erreicht, aber der Doppler-RMS nach der Anpassung beträgt { "48.6" } mHz gegenüber dem Zielwert von { "30" } mHz, nicht erreicht, daher bleibt die Zeile MODELLED. WAS NICHT GEPRÜFT IST: Keine geschätzte Bahn hat jeden registrierten Zielwert erreicht; Ionosphäre, Sonnenplasma und der größte Teil des Antennenversatzes (ein radialer Versatz von { "1.5" } m wird am Entwicklungsüberflug angepasst) sind nicht modelliert.

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (eine reale MRO-ODF, 2007-304/305, gegen ihr PDS-Label: Satzanzahl, Gruppenpositionen, Stationen, Start- und Endzeiten und Datentypen stimmen; die Zeilenanzahl der Tabelle am Dateiende verfehlt um eins, eine Inkonsistenz des Labels, als Befund festgelegt); odf::tests (handgebauter Satz im Round-Trip, Epoche { "1950" }); tests/mro_odf_short_arc_od_oracle.rs (datenabhängig freigegeben, Eingaben mit SHA-256 festgelegt, monatliche CI mit realen Daten erforderlich: aus der Navigationsrekonstruktion mro_psp5 von MRO vorhergesagter Doppler auf den gewerteten Überflügen von DSS { "63" } und DSS { "14" }, { "12.5" } mHz RMS, Zielwert { "30" } mHz, erreicht; die registrierte Bahnbestimmung erzeugte keine Bahn, als Befund festgelegt; Lauf { "2" } mit einem gedämpften Schätzer, separat registriert: Bahn { "0.36" } km RMS und { "0.53" } km maximal gegenüber mro_psp5, erreicht, Doppler nach der Anpassung { "48.6" } mHz gegenüber { "30" } mHz, nicht erreicht, als Befund festgelegt; Leser für SPK-Typ { "1" } gegen CSPICE, { "5e-7" } m); mars_od::tests

# text
seg-8566593647ee = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz: der normierte quadrierte Schätzfehler des Filters gegen eine aus denselben Sensormodellen simulierte Wahrheit über Monte-Carlo-Seeds und die Konvergenz der Schätzungen von Lage und Bias. WAS NICHT GEPRÜFT IST: Es wurde kein externer Schätzer und keine Flugdaten verglichen (Basilisk { "2.9.1" } hat kein MEKF-Modul); die Sensormodelle sind die aus dem Lehrbuch, ohne Fehlausrichtung, Skalenfaktor oder Effekte des Sichtfelds des Sternsensors.

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } Seeds, mittlere NEES mit sechs Freiheitsgraden über die zweite Hälfte innerhalb von { "4.5" } bis { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
# c1: passes::predict_passes
seg-3085ca73a5f1 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz, aus drei Größen, die mit verschiedenen Ausdrücken im selben Durchlauf berechnet werden und dann abschließen müssen. Apertursekunden der Navigation, Apertursekunden der Kommunikation und ungenutzte Apertursekunden werden getrennt akkumuliert — ungenutzt aus (Aperturen − |bedient|) je Elementarintervall, nie als Rest — und ihre Summe wird gegen Aperturen × horizon_s zugesichert, was eine falsch eingeklammerte Grenze, ein doppelt gezähltes oder ein ausgelassenes Intervall sofort bricht; die bedienten Zeiten je Sitzung müssen zudem separat wieder die beiden Dienstsummen ergeben. Die strukturellen Eigenschaften des Schedulers werden gemessen statt angenommen: Die bediente Zeit wird über { "200" } pseudozufällige Pläne für alle drei Richtlinien als nicht fallend in der Aperturanzahl zugesichert (nicht offensichtlich bei der nicht präemptiven Richtlinie, bei der eine zusätzliche Apertur ändert, wer an jeder späteren Grenze was hält), und die Grenzarithmetik wird am Paar mit Berührung/einer Sekunde Überlappung festgelegt, wo sich ein Fehler um eins sonst verbergen würde. Die Brücke zum Überflugprädiktor wird gegen die Ausgabe von <c1/> geprüft: Mit einer Apertur und ohne konkurrierenden Dienst entsprechen die Apertursekunden der Navigation den eigenen summierten Überflugdauern des Prädiktors. Es wird keine externe unabhängige Referenz beansprucht, und keine existiert: Die Fähigkeit löst Handarithmetik ab, statt gegen sie geprüft zu werden, der mitgelieferte Kontaktplan ist illustrativ und nicht geflogen, und kein operativer Scheduler veröffentlicht ein Paar aus Plan und Antwort mit angegebener Arbitrierungsregel — ein Duty, der unter einer nicht angegebenen Richtlinie berechnet wurde, ist mit einem unter einer angegebenen nicht vergleichbar, und die Abhängigkeit von der Richtlinie wird gemessen (Navigations-Duties von 100/150 gegenüber 50/150 bei identischem Plan). Schwenk- und Umschaltzeit, Datenvolumen, Pufferzustand, Energie und Streckenschluss sind im Berichtslabel ausgeschlossen, statt stillschweigend modelliert zu werden

# text
seg-4da98593fe6a = aperture_duty::tests (ein Fenster, das genau endet, wenn das nächste beginnt, konkurriert nicht, und ein um eine Sekunde früheres Verschieben kostet genau eine Sekunde — der Schutz gegen Fehler um eins; überlappende Fenster über die Aperturanzahl hinaus versetzen die niedriger eingestufte Sitzung in den Ausfall, mit festgelegtem Konkurrenzintervall; die Arbitrierungsrichtlinie entscheidet, welcher Dienst die Apertur hält, mit den Zahlen aller drei Richtlinien an einem Plan festgelegt; Wer-zuerst-kommt-mahlt-zuerst verdrängt keine Sitzung, die bereits eine Apertur hält; eine Sitzung, die bei ihrem Beginn die Arbitrierung verliert, erhält eine Apertur, sobald eine frei wird; die drei Duties erfassen jede verfügbare Aperturssekunde über { "3" } Richtlinien × { "4" } Aperturanzahlen; das Hinzufügen einer Apertur erhöht nie den Ausfall einer Sitzung, gemessen über { "200" } pseudozufällige Pläne × { "3" } Richtlinien × jede Aperturanzahl; genug Aperturen für jede Sitzung lassen gar keinen Ausfall übrig; der Berichtshorizont beschneidet den Plan und setzt den Nenner des Duty; eine vorhergesagte Überflugliste wird ohne einen zweiten Fenstertyp zu einem Kontaktplan; die Duty-Zahlen des mitgelieferten Plans sind Engine-Ausgaben für eine und zwei Aperturen; der Bericht nennt die Richtlinie, die die Zahlen erzeugt hat; jede berichtete Zahl trägt eine Einheit und eine Herkunftsklasse; das Szenario ist reproduzierbar und erklärt sich selbst als MODELLED; das Szenario lehnt einen Plan ab, den es nicht einplanen kann); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-cd818ac01de7 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Kompositions-Gegenprüfung gegen einen unabhängigen Codepfad im Repository: Jedes J/S je Strecke wird als Differenz zweier Linkbudgets neu hergeleitet, die mit linkbudget::received_signal_power_dbw berechnet werden, dessen Freiraumverlust der einzelne Ausdruck { "20" }·log10(4πRf/c) ist statt der Summe aus drei Termen, die jamming::free_space_path_loss_db verwendet — beide stimmen in jeder Zeile auf < { "1e-9" } dB überein (gemessener schlechtester Fall { "7.11e-14" } dB, also Gleitkomma-Rundung). Die zugrunde liegende Störungskette, die sie zusammensetzt, ist separat extern verankert in tests/gnss_denied_jamming_resilience_reference.rs (unabhängige numpy/scipy-Neuherleitung von J/S und effektivem C/N₀, festgelegt auf Kaplan & Hegarty §{ "9.4" }, sowie das gemessene C/N₀ des JammerTest { "2024" }, Zenodo 10.5281/zenodo.15910563); die Mondgeometrie, die sie zusammensetzt, ist die Geometrie aus lunar_service/lunar mit eigenen unabhängigen Referenzen. Hier geprüfte Identitäten in geschlossener Form: Ein halbierter Abstand des Störers addiert genau { "20" }·log10({ "2" }) dB zu jeder Zeile; J/S ist exakt unabhängig vom Gewinn der Nutzerantenne in Blickachse, während sich C/N₀ genau um diesen Gewinn bewegt; eine Elevationsmaske ändert keine verbleibende Zeile bitgenau. Die Zeile selbst bleibt ReferenceImpl/modelliert: Es gibt keine gemessene Kampagne zu Störungen auf dem Mond, gegen die validiert werden könnte, und die Konstellation ist eine illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen, keine geflogene Ephemeride

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } Bibliothekstests: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-4dd2b99376b2 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz gegen die eigenen Vorwärtsfunktionen der Engine, mehr kann diese Fähigkeit ehrlich nicht beanspruchen. Jeder Konturpunkt ist eine Inversion in geschlossener Form, und jede Inversion wird geprüft, indem ihre Antwort zurück durch die VORWÄRTSFUNKTION geführt wird, mit der die eigenen Zeilen des Berichts bewertet wurden: die J/S-Spalte durch jamming::effective_cn0_dbhz (das tracking_threshold_dbhz auf < { "1e-9" } dB-Hz zurückgeben muss), die Spalte des Abstands durch jamming::free_space_path_loss_db und jamming::j_over_s_db (dasselbe J/S auf < { "1e-9" } dB), die EIRP-Spalte durch jamming::j_over_s_db beim eigenen Abstand des Szenarios. Die Kontur wird zudem als GRENZE der Verweigerungsmenge geprüft statt als Punkt in ihr — lock_status verliert den Lock bei einer strikten Ungleichung, daher wird gemessen, dass das Urteil über { "1e-4" } dB von J/S auf jeder Seite der Kontur von DEGRADED zu LOST kippt, was eine um ein Epsilon verschobene Kontur nicht bestehen würde. Die stärkste Prüfung gilt je Strecke statt je Quantil: Die Anwendung derselben Abbildung auf das eigene C/N₀ jeder Zeile reproduziert die Statusspalte des Berichts exakt — { "0" } Abweichungen bei { "38" } von { "38" } Zeilen am dokumentierten Betriebspunkt (kind = lunar-jamming, jede Eingabe auf Standard außer jammer.range_m = { "25 000" } m), wo { "26" } Zeilen LOST sind und { "12" } nicht. Die Monotonie wird gemessen, nicht angenommen: { "20 001" } Abtastwerte über [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } Verletzungen eines streng fallenden Abstands und einer streng steigenden benötigten Leistung, sodass die Quantilreihenfolge des Bandes gezeigt statt behauptet wird. ExternalDataset wird abgelehnt und damit auch validiert: Es gibt keine gemessene Kampagne zu Störungen auf dem Mond, gegen die ein Verweigerungsradius verglichen werden könnte, die Konstellation ist eine illustrative Geometrie der Klasse Moonlight/LCNS aus öffentlichen Quellen und keine geflogene Ephemeride, und die Eingaben der Kontur (EIRP, Störerleistung, Antennengewinne, Rauschtemperatur) sind repräsentative Größenordnungen. ReferenceImpl wurde ebenfalls erwogen und abgelehnt — die Inverse und der Vorwärtsausdruck sind DIESELBE Algebra, in zwei Richtungen gelesen, daher fängt der Round-Trip Übertragungs- und Vorzeichenfehler ab, ist aber keine unabhängige Implementierung; es eine Gegenprüfung zu nennen, wäre der Zug der geborgten Unabhängigkeit, den die Invarianten der Matrix verhindern sollen. Was das Band bringt, wird gemessen und beziffert statt behauptet: Am Betriebspunkt liegt die Kontur mit einem Skalar bei { "27.402916" } km und legt { "25" } km für alle { "38" } Zeilen auf die verweigerte Seite, während das Band { "21.256108" } .. { "29.921360" } km den Betriebspunkt enthält und daher die Aufspaltung berichtet, die die Tabelle tatsächlich zeigt. Es wird auch gemessen, dass die beiden Kriterien voneinander abweichen — das Band nach Leistungsverhältnis ({ "38.186527" } .. { "53.691675" } km) enthält { "25" } km überhaupt nicht — weshalb beide gedruckt werden

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } Bibliothekstests: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-88d196f13afa = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Zwei interne unabhängige Referenzen, kein externer Datensatz. ({ "1" }) Round-Trip in geschlossener Form: Der minimal erkennbare Bias entsteht durch Invertieren des Ausläufers der nichtzentralen Chi-Quadrat-Verteilung am Nichtzentralitätsparameter (raim::pbias) und wird verifiziert, indem der resultierende Nichtzentralitätsparameter bei der eigenen Schwelle des Monitors durch raim::noncentral_chi2_cdf zurückgeführt wird, was P_md zurückgeben muss. ({ "2" }) Injektion gegen Analyse: Ein Bias wird in die HF-Schätzung einer Achse geschrieben und cross_raim::run_cross_raim erneut ausgeführt, sodass die Statistik, die mit dem analytischen Nichtzentralitätsparameter verglichen wird, die ist, die der Monitor berechnet hat, keine Neuherleitung. Eine gesetzte Monte-Carlo-Simulation der Statistik selbst wird in den Tests als dritte Prüfung mitgeführt; sie ist bewusst NICHT im Bericht, weil eine abgetastete Schätzung langsamer und nicht bitgenau reproduzierbar wäre. ExternalDataset wird abgelehnt: Die Größe ist die Erkennungsleistung DIESES Monitors bei der Sigma-Zuteilung DIESES Szenarios, und die Sigma-Größen, mit denen der MDB skaliert wird, sind modellierte repräsentative Eingaben, keine Messungen. ReferenceImpl wurde ebenfalls erwogen und abgelehnt — die Monte-Carlo-Simulation tastet dieselbe Statistik ab, die die Analyse beschreibt, daher fängt sie Übertragungs- und Koeffizientenfehler ab, ist aber keine unabhängige Implementierung des Monitors. { "0.30" }, Runde { "2" } (vorregistriert 0135a9e4), blockiert (bleibt MODELLED): SciPy { "1.18.1" } chi2/ncx2/brentq reproduzieren die Berichtsschwelle (innerhalb von { "5.4e-12" }), den MDB je Achse, die Leistungskurve, das Kreuzungsvielfache und die Zeit bis zur Erkennung bei Rampe (innerhalb von { "5.3e-10" }) bei fünf Konfigurationen; die Statistiken der injizierten Fehler haben keine unabhängige Referenz, und die Sigma-Größen sind modellierte Eingaben, daher wartet die Eingrenzung auf eine Entscheidung des Verantwortlichen

# text
seg-83724a2a8e06 = hybrid_integrity::tests (die Kurve der Erkennungsleistung läuft von der Fehlalarmrate bei null Fehler bis { "1" } − P_md beim minimal erkennbaren Bias; der minimal erkennbare Bias, bei der vom Monitor selbst angewandten Schwelle durch noncentral_chi2_cdf zurückgeführt, ergibt P_md auf { "1e-9" }, auf jeder Achse und über den öffentlichen Helfer; ein tatsächlich in die HF-Schätzung injizierter Bias verschiebt die eigene Statistik des Monitors um genau das von Hand berechnete b²/(σ_rf² + σ_opt²); ein rauschfreier Bias wird über √(T/λ*)×MDB erkannt und darunter verfehlt, wobei die injizierte Leiter diese Kreuzung überspannt; die Erkennungsleistung ist monoton in der Fehlergröße und auf allen vier Achsen in Vielfachen des MDB identisch; eine gesetzte Monte-Carlo-Simulation der Monitorstatistik mit 200,000 Abtastwerten reproduziert die analytische Leistung innerhalb von 4σ an vier Punkten der Kurve; der MDB der Zeitgebung liegt über der Alarmgrenze der Zeitgebung, was eine gemessene Schwäche und kein Merkmal ist; für das Wilson-Hilferty-Quantil wird gemessen, dass es von der exakten Schwelle des Monitors um ~{ "4" } % abweicht, was festhält, warum es nicht verwendet wurde; die Rampenzahl ist genau MDB/Rate und skaliert umgekehrt mit der Rate, und eine nicht positive Rate berichtet null statt null Sekunden); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-df134052a2d9 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Keine externe unabhängige Referenz. Die Kreuzung ist eine Lösung in geschlossener Form des Varianzwachstums eines Random Walk, und die Tests berechnen sie unabhängig aus den Werten neu, die der Bericht selbst veröffentlicht, statt aus dem Inneren des Emitters. Die Startkovarianz ist bitgenau auf die Spur festgelegt, die der bestehende Übergabeblock bereits berichtet hat, sodass das Coast keine Kovarianz fortpflanzen kann, die sonst niemand gesehen hat. Die PSDs des Prozessrauschens sind MODELLED repräsentative Eingaben, und die Kreuzungszeiten skalieren direkt mit ihnen, was der Skalierungstest als gemessene Eigenschaft und nicht als Behauptung festhält. ExternalDataset wird bewusst abgelehnt: Die Coast-Zeit ist eine direkte Funktion zweier modellierter PSDs und von Alarmgrenzen, die ihrerseits repräsentativ sind, und es gibt kein gemessenes Coast bei der Übergabe zwischen optisch und HF auf dem Mond, gegen das verglichen werden könnte. Eine externe unabhängige Referenz bräuchte hier eine veröffentlichte Kurve des Kovarianzwachstums nach der Übergabe oder der Holdover-Genauigkeit für einen vergleichbaren Empfänger mit angegebenem Prozessrauschmodell, auf eine Toleranz geprüft

# text
seg-f9767a6109d5 = hybrid_integrity::tests (das Coast beginnt genau bei der Kovarianzspur, die der Übergabeblock berichtet, für beide Richtungen, sodass die wiederholte Diagonale nicht von der berichteten Übergabe abweichen kann; die berichtete Kreuzungszeit wird aus dem eigenen Übergabe-Sigma, der PSD des Prozessrauschens und dem Abdeckungsfaktor des Berichts neu berechnet, und die Schranke liegt kurz davor innerhalb der Alarmgrenze und kurz danach außerhalb; die Coast-Zeit skaliert genau umgekehrt mit der PSD des Prozessrauschens und verkürzt sich, wenn die Alarmgrenze enger wird; ein Coast mit PSD null berichtet null statt einer Zeit null, weil nie nicht sofort ist; das ausgegebene Profil kreuzt genau einmal und schließt die berichtete Kreuzung ein; die Verdopplungszeit der Varianz und die Kreuzungszeit der Alarmgrenze sind getrennt festgelegt, da sie sich nach der engen optischen Stufe um acht Größenordnungen und nach der lockeren HF-Stufe um weniger als eine Größenordnung unterscheiden; das Verlassen der optischen Modalität bringt mehr Coast-Zeit als das Verlassen von HF, genau um die Differenz der Kovarianz geteilt durch die horizontale Wachstumsrate; und random_walk_time_to_limit trennt bereits-außerhalb, kreuzt-bei-t und kreuzt-nie)

# text
seg-903acaa666a9 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Gemischt, und getrennt statt zusammengeführt. Das MUSTER darunter ist extern validiert und hat seine eigene Zeile (eine Fixture scipy.special.j1 auf < { "0.05" } dB in tests/validate_p1_orbital_footprint.rs, dazu hier die veröffentlichte Airy-Halbleistungsabszisse x = { "1.61634" }, durch Bisektion gefunden statt angenommen). Die GEOMETRIE wird gegen Dreieckstrigonometrie in geschlossener Form geprüft, die als anderer Ausdruck als das geprüfte Skalarprodukt geschrieben ist. Die EINSCHLIESSUNG des realen Strahls durch den genäherten Kegel ist hergeleitete Algebra (28.019/√η gegenüber { "29.479" } Grad je λ/D), daher kann die Korrektur nur für η ≤ { "0.9035" } nicht positiv sein. Aber die ZAHLEN im Strahl selbst haben keine externe unabhängige Referenz: Keine veröffentlichte Tabelle gibt an, wie viele Satelliten einer Schale der Klasse Moonlight/LCNS einen Standort am Südpol innerhalb des Halbleistungsstrahls einer gegebenen Schüssel halten, und die Konstellation ist eine illustrative Näherung aus öffentlichen Quellen, keine geflogene Ephemeride. Die gemessene Abweichung am dokumentierten Arbeitspunkt — { "0" } Strecken im Strahl unter dem realen Muster gegenüber { "28" } unter der Näherung, −{ "2.33" } Satelliten je Epoche, schlechteste Epoche { "3" }, bei { "76" } ausgewerteten Strecken — ist daher ein MODELLED Befund zur Näherung, als Regressionsliteral festgelegt (die nächste Zeile liegt { "0.069" }° von jedem Strahlrand entfernt, vier Größenordnungen über jeder Abweichung in der letzten Stelle), keine extern validierte Abdeckungszahl. Die Zeile als ExternalDataset zu kennzeichnen, gestützt auf den eigenen externen Anker des Musters, wäre geborgte Validierung, der Zug, den die Invarianten der Matrix verhindern sollen. { "0.30" }, Runde { "2" } (vorregistriert d9755d28), blockiert (bleibt MODELLED): SPICE-Geometrie und SciPy-Besselfunktionen reproduzieren den Winkel außerhalb der Blickachse (schlechtester Wert { "3.0e-5" } Grad), den Airy-Gewinn und die Strahlmarkierungen an { "6 336" } Zeilen von Zuständen geflogener Orbiter und dem dokumentierten Arbeitspunkt; aber bei geflogener Geometrie spalten sich die Markierungen nach Satellitenidentität (die nächste Strecke liegt { "1.66" } Grad vom Strahlrand), die sichtbare { "5" }-Grad-Grenze wird als Markierung geprüft, nicht als numerische Elevation, die Markierung der symmetrischen Näherung wendet die Faustregel 31000/G auf einen validierten Winkel an, ohne die Regel zu validieren, und die implizierten Wirkungsgrade haben keine unabhängige Referenz; die Eingrenzung wartet auf eine Entscheidung des Verantwortlichen

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests und lunar_service::tests (die durch Bisektion auf dem Muster gefundene Halbleistungskreuzung stimmt mit dem veröffentlichten Airy-x = { "1.61634" } überein und ergibt die exakte Breite { "1.02899" }·λ/D, was festhält, dass der übliche Koeffizient { "1.02" } bei −{ "2.955" } dB statt −{ "3.010" } dB liegt; das Muster ist über { "400" } Punkte von der Blickachse bis zur ersten Nullstelle streng fallend; die Algebra des implizierten Wirkungsgrads läuft im Round-Trip auf { "1e-12" } und reproduziert { "0.641" } / { "0.920" }; der Winkel außerhalb der Blickachse stimmt mit tan θ = R·sin γ/(r − R·cos γ) an { "20" } Punkten und beide Grenzfälle auf { "1e-12" } überein; der genäherte Kegel enthält den realen Strahl Zeile für Zeile; die Kernzahlen entsprechen den Markierungen je Zeile, die sie zusammenfassen, und die Korrektur entspricht ihrer Differenz; jedes Urteil je Zeile ist allein aus dem ausgegebenen Bericht neu berechenbar; jedes ausgegebene numerische und boolesche Feld hat eine Einheit und eine Herkunftsklasse; eine unmögliche Apertur gibt keinen Block aus; ohne konfigurierte Antenne behält der Export genau seine sechs bereits vorhandenen Schlüssel, { "0" } JSON-Blätter geändert und { "0" } entfernt); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-7319e667db2e = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Der eigene sdr-Korrelator der Engine (sdr::correlate / synth_if / CaCode), vorwärts geschritten auf gesetzter synthetischer ZF bei kalibriertem C/N₀ — ein separater Codepfad, der dieselben Zahlen durch numerische Korrelation abgetasteter IQ erreicht statt durch einen algebraischen Jitter-Ausdruck, also ein anderer Weg und keine Wiederholung — sowie übliche tabellierte Werte der modifizierten Bessel-Funktion I₀ für den Term des Cycle Slips. Schleifentheorie nach Kaplan & Hegarty Kap. { "8" } und Viterbi/Gardner für die Slip-Zeit. Die Zeile bleibt ReferenceImpl/MODELLED: Die Gegenprüfung liegt in derselben Codebasis, und die Prüfung von bessel_i0 validiert eine Spezialfunktion statt des Tracking-Modells, daher wäre ein Aufstieg der Zeile auf dieser Grundlage eine eigennützige Kennzeichnung. ExternalDataset bräuchte einen aufgezeichneten Roh-ZF-Datensatz mit Wahrheits-C/N₀ und einem annotierten Zeitpunkt des Lock-Verlusts (Klasse TEXBAT/OAKBAT); keiner wird in diesem Baum mitgeliefert, und selbst mit den IQ veröffentlichen diese Datensätze keine Wahrheit zum Schleifenzustand je Epoche, sodass eine erklärte Zeit des Lock-Verlusts nur gegen den Lock-Detektor eines anderen Empfängers validiert werden könnte, was eine modellierte Wahl und keine unabhängige Referenz ist. Die Schleifenbandbreiten, die Integrationszeit, der Korrelatorabstand, das Pull-in-Verhältnis, die Verweilzeiten, die Störerleistung und die Antennengewinne sind repräsentative Bandzahlen, kein Datenblatt. { "0.30" }, Runde { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, als Programm ausgeführt) an unabhängig erzeugter ZF (vorregistriert 6ef7698c, Änderungen an der Messmethode offengelegt), ein Befund (bleibt MODELLED): Der Jitter der geschlossenen PLL und DLL stimmt bei { "35" } bis { "45" } dB-Hz innerhalb von { "8" } % überein, die dynamische Belastung von { "10" } Hz/s innerhalb von { "1" } % und die Verzögerung der Coderampe erster Ordnung innerhalb von { "2" } %; bei { "30" } dB-Hz ist der PLL-Jitter { "21" } % höher und der DLL-Jitter { "32" } % niedriger, die gemessenen Schwellen der 15-Grad-Regel liegen { "1.5" } dB über der Engine, und die Schleife zweiter Ordnung hat { "0.5" } bis { "2" } Dekaden häufiger Slips als die Schranke der Slip-Zeit erster Ordnung. { "0.30" }, Überarbeitung: Die Slip-Zeit des Costas-Verfahrens verwendet jetzt das Schleifen-SNR rho/4 (Halbzyklus-Slips); die Standardtabelle jitter_table log10_mean_time_to_cycle_slip_s fällt bei der Schwelle von { "25.47" } dB-Hz von { "11.58" } auf { "2.10" }

# text
seg-9910640b7886 = tracking_loop (composing sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (Jitter des Costas-Diskriminators ohne Regelung gegen sdr::correlate, vorwärts geschritten auf gesetzter synthetischer ZF, { "3" } zusammengelegte Rauschrealisierungen × { "900" } Epochen, Übereinstimmung auf { "0.63" } % über 35-45 dB-Hz, wobei der Term des Quadrierverlusts mindestens { "3" }× besser passen muss als die Form ohne Quadrierverlust, wo immer er auflösbar ist; die Sättigung des Atan-Diskriminators bei ~{ "32" } dB-Hz zugesichert statt nur angegeben, sodass die Gültigkeitsgrenze festgelegt ist; σ bei geschlossener Schleife gegen eine schrittweise Costas-Schleife aus sdr über { "4000" } Epochen auf { "3.7" } %; Rampenverzögerung der DLL erster Ordnung gegen eine schrittweise DLL aus sdr auf { "0.17" } %; bessel_i0 gegen tabelliertes I₀ auf { "7.4e-8" }; die Hysteresebreite muss in [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] liegen über { "4" } Verhältnisse × { "2" } Integrationszeiten × { "3" } Bandbreiten); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-63ab7261e10e = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Identitäten in geschlossener Form, ohne dass eine externe unabhängige Referenz beansprucht wird oder verfügbar ist. Der Hebelarm wird gegen ρ/B und die beiden Gleichverteilungsformen gegeneinander auf { "1e-15" } geprüft — algebraische Identitäten, die also einen Verdrahtungsfehler abfangen und sonst nichts, und als solche gekennzeichnet sind. Das wesentliche Ergebnis wird MEASURED statt behauptet: Eine Verzögerung aus einer festen Basislinie schränkt die RICHTUNG der Bake ein, sodass die Komponente der Sichtlinie nur über den Entfernungsterm des Nahfelds in die Informationsmatrix gelangt, und der Test liest die resultierende Anisotropie aus dem ausgegebenen Spektrum ab, statt sie herzuleiten. AM-HM macht √(p/trace(M)) zu einer harten Untergrenze, sodass eine Strecke mit isotroper Gleichverteilung nur UNTERSCHÄTZEN kann, und das Verhältnis aus berechnet zu Gleichverteilung genau die Anisotropie ist, die sie verworfen hat. MEASURED am Paar Goldstone-artig/Canberra-artig, dessen Sehne { "10726.748" } km beträgt: Über { "112" } abgetastete Tage lassen { "36" } bei einer Maske von { "10" }° überhaupt keine gegenseitig sichtbare Epoche zu, die größte je gegenseitig sichtbare Zahl ist { "17" } von einem Plan mit 49 Abtastwerten, und an den { "73" } brauchbaren Tagen läuft das Verhältnis der drei Komponenten von { "113.9" }× bis zu vier Größenordnungen mehr, Median { "1513" }×, während die Beschränkung auf die zwei transversalen Richtungen, in denen die Sichtlinie nicht verhungert, { "3.94" }× bis { "25.8" }× ergibt, Median { "7.8" }×. WAS DIESE ZEILE NICHT BEHAUPTET: irgendeine dieser Zahlen als Eigenschaft einer realen Kampagne. Sie stellt fest, dass die Größe am Oberflächenpunkt jetzt BERECHNET statt angenommen wird und nicht stillschweigend mit der Größe auf Stationsebene vertauscht werden kann. Bleibt ReferenceImpl/MODELLED: Es gibt keine veröffentlichte Kovarianz eines Oberflächenpunkts der lunaren VLBI, gegen die validiert werden könnte, die Stationen und der Standort der Bake sind illustrativ und nicht vermessen, und Ephemeride, Uhren, Troposphäre und Erdorientierungsparameter sind FEST gehalten, daher ist dies eine Cramér-Rao-Schranke für eine reduzierte Parametermenge und für sich genommen optimistisch. Dieselbe Größe auf dem Kernelpfad (Bake auf dem Mond nach DE440) wird in ihrer eigenen Zeile validiert, "…, kernel path"; auf diesem analytischen Pfad liegt das kleinste Sigma der Bake { "3.9" } % unter der SPICE-Referenz jener Zeile, weshalb diese Zeile MODELLED bleibt

# text
seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } Bibliothekstests: jede Schreibweise des Datums durchläuft parse/as_str im Round-Trip, und eine unbekannte wird abgelehnt; das Festhalten jeder Station ohne die Bake wird mit einem Fehler abgelehnt, der <c1/> nennt; der Hebelarm ist als GLEICH ρ/B und die Gleichverteilung der Bake als GLEICH der Gleichverteilung der Station mal ihm zugesichert, beides auf { "1e-15" }, mit einer weiteren Zusicherung, dass der Hebelarm { "10" } übersteigt, sodass die beiden Budgets bei dieser Geometrie nicht verwechselbar sind; die veröffentlichte Basislinie der Fixture ist auf { "10726.748" } km festgelegt, und ihr Plan mit 49 Abtastwerten ist als streng weniger als { "49" } gegenseitig sichtbare Beobachtungen ergebend zugesichert; das Spektrum der Bake auf einer einzelnen Basislinie wird als mindestens fünf Dekaden umspannend gemessen, und das resultierende Verhältnis ist durch AM-HM über { "1" } und tatsächlich über { "100" } zugesichert; die Anordnung aus Station plus Bake ist als rangdefizitär zugesichert, wobei BEIDE berechneten Felder null sind, während der modellierte Vergleichswert weiterhin berichtet. Dazu ein Schutz an der Fixture selbst: Ein Schlüssel der obersten Ebene, der nach einem Array von Tabellen eingefügt wird, wird stattdessen zu Stationsdaten, daher wird die Einfügestelle zugesichert und das geparste Szenario darauf geprüft, den Schlüssel zu tragen — der Fehlermodus ist ein Lauf, der stillschweigend eine andere Konfiguration verwendet als die, die der Test nennt)

# text
seg-27b8c06d7d01 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Identitäten in geschlossener Form und Selbstkonsistenz: die Varianz step²/12 des gleichmäßigen Quantisierers, die exakte Kovarianzfortpflanzung (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, die für gleiche σ auf σ·PDOP zusammenfällt, die Übertragung des Vermessungsterms im Verhältnis { "1" }:{ "1" } als Folge von û_user ≈ û_ref und der Abschluss der Quadratur beim Abschalten. Die PDOP-Gegenprüfung gegen orbit::dop teilt die Normalmatrix [−û, { "1" }], daher ist sie eine Konsistenzprüfung und als solche gekennzeichnet statt als unabhängige Referenz. Es ist kein ExternalDataset verfügbar oder beansprucht: Keine Mondoberflächenstation hat eine veröffentlichte vermessene Genauigkeit, keine lunare Strecke zur Differenzialkorrektur hat eine veröffentlichte Latenz oder ein Nachrichtenformat, und das Ergebnis der Quantisierung ist eine geschlossene Form statt einer Messung. RTKLIB — bereits die externe Code-Referenz für den Kernel aus Einzeldifferenz und gewichteten kleinsten Quadraten — könnte mit einer absichtlich falsch vermessenen Basis betrieben werden, um die Übertragung der Vermessung im Verhältnis { "1" }:{ "1" } zu bestätigen, aber das ist unabhängiger Code über derselben Algebra der Sichtlinie erster Ordnung. DIE GRÖSSENORDNUNGEN SIND MODELLED: Der Standardwert der Vermessung ist die eigene Zuteilung der Realisierung des lunaren Bezugssystems dieser Crate und keine gemessene Station, die Latenz und die Bitanzahl sind ILLUSTRATIVE Eingaben, und das Wachstum des VEKTORS des Fehlers der gesendeten Ephemeride selbst wird gar nicht modelliert — angegeben in der ausgegebenen Zeichenkette zum Alterungsgesetz, weil es der Term ist, der in einer realen Strecke am ehesten dominiert

# text
seg-08708f044bb5 = lunar_dpnt::tests (ein rein additiver Schutz, dessen Differenz der Schlüsselmenge genau { "{" }correction_link, units{ "}" } ist, wobei jeder bereits vorhandene Wert bitidentisch gegenüber vor der Änderung erfassten Literalen ist; der Vermessungsfehler dekorreliert NICHT mit der Basislinie, während der Bahnterm es tut, und er bleibt bei einer Basislinie null bestehen, wo der Bahnterm genau null ist — die strukturelle Prüfung, die das Verdrahten des Terms an die falsche Stelle abfängt; ein Stationsfehler von { "1" } m überträgt sich { "1" }:{ "1" } und ist nachweislich nicht durch DOP verstärkt; null Latenz reproduziert das ungealterte Residuum bitgenau, und das Residuum ist monoton in der Latenz, wobei die ausgegebene Kurve direkten Läufen entspricht; die Quantisierungsstufe halbiert sich genau je Bit und σ² = step²/12, und der Vollausschlag folgt den injizierten Größen; jeder der Reihe nach abgeschaltete Term gewinnt die anderen zwei in Quadratur zurück; gleiches σ je Satellit pflanzt sich auf genau σ·PDOP fort, und dieses PDOP stimmt mit orbit::dop überein; jedes ausgegebene Feld trägt eine Einheit und eine Herkunftsklasse, in beiden Richtungen geprüft)

# text
seg-37f07885bbf0 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Arithmetik, von einem unabhängigen numpy-Skript an exportierten Fällen neu berechnet (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; vorregistriert in tests/fixtures/lunar_station/PREREGISTRATION.md, allein eingecheckt in 9caedf97 vor dem ersten Lauf): An { "20" } Fällen mit jedem eingeschalteten Fehlerterm sind die sichtbaren Mengen und der Status identisch, die rohen Entfernungsfehler stimmen auf { "1.4e-14" } m überein, die Vektoren und Beträge der Positionsfehler auf { "1.4e-9" } m gegenüber einem Zielwert von { "1e-6" } m, und das p95 jedes Punkts entspricht numpy.percentile bitgenau; die Stationskorrekturen VERFEHLTEN ihren Zielwert von { "1e-9" } m (schlechtester Wert { "3.73e-9" } m, { "15" } von { "20" } Fällen), und mit ihnen die korrigierten Entfernungsfehler: In Arithmetik mit 60 Stellen geprüft liegen beide Seiten innerhalb der Rundung doppelter Genauigkeit um den exakten Wert, wobei der Vermessungsterm die Differenz zweier Entfernungen von { "1e7" } m ist, deren Einheit der letzten Stelle { "1.86e-9" } m beträgt; festgehalten, nicht abgestimmt. Die Art reduziert sich bei einem Punkt, einer Epoche und einem Durchlauf exakt auf die Art lunar-differential-pnt. Das Fehlermodell, das Dekorrelationsmodell und jede Schwelle sind die eigenen dieses Projekts oder ILLUSTRATIVE; nichts hier ist eine Aussage über ein reales System

# text
seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: auf { "1e-12" } m mit und ohne Empfängerrauschen; zero_baseline_floor_is_zero_in_every_trial: { "0" } auf { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 innerhalb des vor dem Lauf angegebenen Bandes von { "5" } %; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (die vorregistrierte Neuberechnung mit numpy, festgehalten mit ihrem Verfehlen); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs und die Goldens des Registers und plattformübergreifend unverändert (Additivität); tests/field_units_global.rs (jedes ausgegebene Feld beschrieben, keine Ausnahme)

# text
seg-bfee8a9a8b64 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Flächen in geschlossener Form (InternalConsistency): der Horizontabfall der bloßen Kugel, ein Krater in einem Plateau auf der Kugel mit einem Beobachter auf und neben seinem Mittelpunkt und ein analytischer Kegel gegen seine eigene Rasterung. Am realen Ausschnitt stimmt ein unabhängiger numpy-Strahlenwurf (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; vorregistriert in tests/fixtures/lunar_terrain/PREREGISTRATION.md, allein eingecheckt in edbb9b02, bevor das Skript existierte) an fünf Standorten überein: Standorthöhen auf { "1.0e-11" } m und alle { "1800" } Horizontelevationen auf { "5.5e-10" } Grad gegenüber Zielwerten von { "1e-6" }, abgeschnittene Strahlen exakt gezählt; das prüft die Arithmetik, nicht das Gelände. Es wurde keine veröffentlichte Zahl zu Horizont oder Beleuchtung am Pol reproduziert: Der eingebundene Ausschnitt mit { "1200" } m glättet das Relief unter einem Kilometer, das veröffentlichte Beleuchtungsstudien auflösen, daher sind die DEM-Horizonte eine MODELLED Sichtlinie über einem neu abgetasteten realen DEM, kein validierter Horizont. Der Standort der Station und die Konstellation bleiben ILLUSTRATIVE; nichts hier ist eine Aussage über ein reales System

# text
seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: Der Strahlenmarsch reproduziert -acos(R / (R + a)) auf { "1e-3" } Grad bei jedem Azimut; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: Derselbe Kegel, auf eine Breiten-/Längenkachel mit { "0.005" } Grad abgetastet, stimmt mit dem analytischen Kegel auf { "0.25" } Grad überein; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: ein Krater mit flachem Boden auf der Kugel, Beobachter im Mittelpunkt und { "4" } km und { "7" } km daneben, gegen die Randelevation in geschlossener Form atan2((R + H) cos s - (R + a), (R + H) sin s) mit s aus der Gleichung für das sphärische Kreuzen des Randes, auf { "0.01" } Grad bei jedem Azimut; rasterised_cone_matches_the_analytic_cone: ein Kegel, auf ein polarstereographisches Gitter mit { "200" } m gerastert und durch den Gitterabtaster gelesen, stimmt mit dem analytischen Kegel auf { "0.25" } Grad überein; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, für beide Arten; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 behält seine flache Anzahl, und die Epochen, die ein Horizont kostet, sind terrain_masked (die Verfügbarkeit selbst kann steigen, weil ein Horizont einen Satelliten verbergen kann, den die Station nicht sieht), und ein Horizont von { "89" } Grad an der Station lässt nichts verfügbar; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: die Böden der Krater Shackleton und Haworth tief, das Malapert-Massiv hoch, nicht das Spiegelbild; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: eine aus dem eingebundenen Ausschnitt neu abgetastete Kachel gibt der Station den Horizont des Ausschnitts auf { "0.22" } Grad (Schranke { "0.5" } Grad, vor dem Lauf festgelegt), mit Echo der Kachel und Einheiten, und dem_path mit dem_tile_path wird abgelehnt; the_export_site_is_masked_by_the_terrain: jede Exportzeile passiert das Gelände genau dann, wenn sie sichtbar ist und bei ihrem Azimut mindestens auf der Höhe des Standorthorizonts liegt, die Geometrie bewegt sich nicht, die CSV erhält die Spalte nur mit Gelände; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs und die Goldens des Registers und plattformübergreifend unverändert (Additivität)

# text
seg-f7719057f56b = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Geschlossene Formen und Statistiken der eigenen Ziehungen des Modells (InternalConsistency): die DLL-Formel gegen eine Handrechnung, die Form nach DO-229, die Differenz zweier Empfänger bei Basislinie null, die Gauss-Markov-Korrelation bei Lag 1. Es gibt keine Messung von Mehrweg oder Empfängern auf dem Mond zum Vergleich; die Werte sind ILLUSTRATIVE, und nichts hier ist eine Aussage über einen realen Empfänger

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m bei { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: Stichproben-Sigma sqrt({ "2" }) a innerhalb von { "6" } %; station_multipath_is_gauss_markov: Korrelation bei Lag 1 exp(-dt / tau) innerhalb von { "0.01" }, Einheitsvarianz innerhalb von { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs und die Goldens unverändert (Additivität)

# text
seg-3c6a533c15dc = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Das Sigma des Wachstumsterms in geschlossener Form und die Prüfung der Fortpflanzung erster Ordnung (InternalConsistency). Der Nachtrag K5 (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, allein vorregistriert in 59d88248): K5 scheitert bei jeder Rate, korrigiertes p95 in 3-D { "369.8" } m, { "2315" } m und { "22797" } m gegenüber einem Zielwert von { "1.5" } m ({ "292.96" } m ohne Wachstum festgehalten), wie vor dem Lauf angegeben. Keine öffentliche Quelle nennt eine Wachstumsrate auf dem Mond: ILLUSTRATIVE

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: Der Streckenfehler mit Wachstum minus ohne Wachstum hat das Stichproben-Sigma rate tau / sqrt({ "3" }) innerhalb von { "6" } % über { "1600" } Ziehungen; linear_growth_is_the_first_order_propagated_error: Ein Geschwindigkeitsfehler dv, mit dem Zweikörper-Integrator im Baum von der Szenariobahn aus fortgepflanzt, verschiebt die Position um dv tau auf innerhalb von { "1" } % bei { "60" } s und { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignoriert, der festgehaltene Nachtrag)

# text
seg-f55331e7b5af = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Die Reduktion auf Schnappschüsse und die Fälle des Lösers in geschlossener Form (InternalConsistency). Der Nachtrag (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, allein vorregistriert in 001ca100) mit einer Höhenbeschränkung von { "1" } m, drei Satelliten und einem Fenster von 6 Epochen (ILLUSTRATIVE Einstellungen; die Quellen nennen einen Filter, eine Höhenbeschränkung und drei Satelliten, aber nicht deren Einstellungen): K1 bis K5 scheitern und K6 besteht, { "1" } von { "6" } wie im festgehaltenen Lauf; der korrigierte p95-Fehler in 3-D bei R300 fällt von { "280.6" } m auf { "2.11" } m (horizontal { "0.90" } m, nicht gewertet), und die Abdeckung bleibt { "0" }. Die Unabhängigkeitsannahme des Fensters begünstigt es. Keine Aussage über ein reales System

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: entspricht lunar_dpnt::position_error_vector_from_range_errors auf { "1e-8" } m, eine lockere Höhenzeile ändert nichts, eine enge legt den Höhenfehler fest; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: jede Zahl auf relativ { "1e-6" }; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignoriert, der festgehaltene Nachtrag)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (die festgehaltenen Zahlen gegen die registrierten Zielwerte); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignoriert, etwa { "7" } s im Release: führt die sechs registrierten Fälle erneut aus und sichert die festgehaltenen Zahlen zu)

# text
seg-f4648485be52 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz (InternalConsistency): die Reduktion der Ordnung 2 auf den mit MAAST geprüften Pfad nach ADD v4.2, unabhängige Neuherleitung der Priors und ein konstruierter Fehler mit zwei Satelliten. Über Paare hinaus wurde kein Lauf mit MAAST oder RTKLIB durchgeführt, daher sind die tieferen Hypothesenmengen und die Schutzpegel des Subset-RAIM nicht extern geprüft. araim_subset_raim teilt die Vereinfachungen von araim_dual_raim (ein Sigma für Integrität und Genauigkeit, eine Uhr, der einfache Normalverteilungsausläufer): Es ist nicht ADD-konform

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, das nicht überwachte Risiko innerhalb von P_THRES, eine Teilmenge, die drei oder mehr Satelliten entfernt, überwacht, und mehr als zehn überwachte Priors unabhängig als P_no fault q^k auf { "1e-12" } neu hergeleitet; a_two_satellite_fault_is_found_as_a_pair: kein Alarm fehlerfrei, und ein Bias von { "30" } m an zwei Satelliten erkannt, wobei das Paar die Teilmenge mit der größten normierten Trennung ist); tests/araim_reference_vectors.rs und tests/integrity_araim_stanford_oracle.rs unverändert (der Pfad der Ordnung 2 ist der mit MAAST geprüfte)

# text
seg-a2b978f8bb5a = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Interne Konsistenz (InternalConsistency): Die Schutzpegel sind die von snapshot_raim, das in seiner eigenen Zeile gegen RTKLIB validiert ist, auf derselben Geometrie neu berechnet; Verhalten ohne Fehler und mit injiziertem Fehler. Der Himmel ist eine repräsentative Voreinstellungsgeometrie (kein datierter Almanach), die Residuen sind synthetisch, und Sigma, die Alarmgrenzen und die Wahrscheinlichkeiten sind angegebene Eingaben; nichts hier ist eine Aussage über die Verfügbarkeit eines realen Empfängers

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: Holdover-Zahlen unverändert, { "111" } verweigerte Epochen nicht verfügbar ohne Schutzpegel, abgelehnt bei Läufen > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: HPL und VPL jeder abgetasteten Epoche entsprechen exakt einem snapshot_raim mit Residuum null auf demselben voreingestellten Himmel, und der fehlerfreie Lauf löst keinen Alarm aus; a_stated_bias_is_detected_while_it_lasts: ein Bias von { "60" } m alarmiert auf genau den { "10" } Epochen, die er abdeckt; every_integrity_field_has_a_unit); clock_integrity::tests; die Uhren-Goldens unverändert

# text
seg-6a7d171f880f = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Ein unabhängiger Rang nach Zeilenstufenform durch Gauß-Elimination mit partieller Pivotisierung bestätigt jedes Rangurteil mit sechs Zuständen — ein anderer Algorithmus, der keinen Code mit dem geprüften Eigenwert-/SVD-Weg teilt. Die { "6" }×{ "6" }-Zustandsübergangsmatrix des CR3BP, die hier zusammengesetzt wird, hat ihre eigene ReferenceImpl-Referenz gegen die Variationsintegration von SciPy, und die Anfangsbedingungen von Halo/NRHO stammen aus einem Korrektor, der die veröffentlichte südliche Gateway-Bahn L2 { "9" }:{ "2" } reproduziert. Der bestehende Zweig mit Square-Root-Information-Filter wird ausdrücklich NICHT als Bestätigung gezählt: Er verbraucht dieselben Jacobi-Matrizen und reduziert sich auf dieselbe Normalmatrix, daher ist er eine Konsistenzprüfung zwischen zwei numerischen Maschinen, und das ausgegebene Erweiterungslabel sagt das. NICHT extern verankert, und ExternalDataset wird daher abgelehnt, statt aus der Zeile der STM geborgt zu werden: Die Bogenlängen an der Schwelle hängen selbst vom MODELLED Konstellationsentwurf, vom Epochenraster und — messbar, bis zu { "40" }× — von der Toleranz der Singulärwerte ab. Die veröffentlichten { "2.09" } h im ebenen Fall werden bei rel_tol = { "1e-6" } exakt reproduziert und sind selbst toleranzabhängig ({ "10.25" } h bei { "1e-4" }, { "0.42" } h bei { "1e-8" }), was eine Eigenschaft des Kriteriums und nicht der Bahn ist. Kein öffentlicher Datensatz veröffentlicht eine Schwelle der Bogenlänge für die Beobachtbarkeit bei einer gewählten cislunaren Konstellation. MEASURED ERGEBNIS: Die räumliche Schwelle mit sechs Zuständen beträgt { "22.17" } h für die NRHO an L2 und { "40.42" } h für das Halo an L2 und EXISTIERT NICHT für die Familie ebener DRO, auf der die veröffentlichte Aussage hergeleitet wurde — Rang { "4" } von { "6" } mit Datumsdefekt { "2" } und zwei genau null betragenden Eigenwerten, ein struktureller Defekt, den keine Bogenlänge behebt

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests und observability_gramian::tests (das Standarddokument bitgenau durch FNV-1a seines JSON, seiner Zusammenfassung und seiner SVG festgelegt, wobei explizite Standardwerte als wirkungslos und die acht Erweiterungsschlüssel als ABWESEND zugesichert sind, sodass die Erfassung nicht in einen Selbstvergleich neu erzeugt werden kann; der additive Block <c1/> aus dem Einfrieren ausgenommen, indem er entfernt und gegen die Konstante neu gehasht wird, die vor seiner Existenz festgelegt wurde, was beweist statt annimmt, dass sich nichts Veröffentlichtes bewegt hat; die Rangunabhängigkeit bei homoskedastischem Sigma bei σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m zugesichert; σ_pos als exakt linear mit σ skalierend auf { "1e-6" } relativ zugesichert; der Nullraum der DRO als genau die Koordinatenachsen z und ż zugesichert, mit getrennten zwei Ursachen — eine Entfernungszeile zwischen koplanaren Raumfahrzeugen hat û_z = { "0" }, und der Block des CR3BP außerhalb der Ebene entkoppelt bei z = { "0" } exakt; räumliche Jacobi-Matrizen gegen zentrale finite Differenzen und gegen die unabhängige 3-D-Observable der Entfernungsrate der Crate; Familien außerhalb der Ebene im ebenen Modus abgelehnt)

# text
seg-d1770a478184 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Drei unabhängige Wege, keiner davon eine veröffentlichte Zahl zur Vorhersagegenauigkeit. ({ "1" }) Ein analytisches Signal mit bekannten Koeffizienten — die einzige Möglichkeit, die periodische Maschinerie zu prüfen, da keine eingecheckte Reihe lang genug ist, um einen jährlichen Term zuzulassen. ({ "2" }) Die Lehrbuchlösung der kleinsten Quadrate in geschlossener Form, eine andere Algebra als die geprüfte Matrixlösung, auf realen Zeilen. ({ "3" }) Die echten archivierten Vorhersagezeilen aus Bulletin A, die das reale Produkt von { "2026" } veröffentlicht, je Vorlaufzeit als ÜBEREINSTIMMUNGSSTATISTIK verglichen und ausdrücklich nicht als Fehler: { "0.256" } ms bei { "1" } Tag, { "0.695" } ms bei { "2" } Tagen, { "1.252" } ms bei { "3" } Tagen, driftend auf { "3.885" } ms bei { "9" } Tagen. Dies ist also die KLASSE von Bulletin A, nahe bei kurzer Vorlaufzeit, nicht Bulletin A. Die Residuen von vorhergesagt gegen endgültig sind reale gemessene Größen über realen IERS-Zeilen, aber ihr Betrag wird nur gegen die RICHTUNG des Vergleichs geprüft, nie gegen eine von der IERS veröffentlichte Genauigkeit — das Lesen eines realen Produkts ist Herkunft, keine unabhängige Referenz. MEASURED: An Tag { "1" } ergibt der operative Prädiktor { "3.78" } m Fehler im Mondsystem gegenüber { "11.39" } m der Persistenz ({ "3.01" }×), an Tag { "2" } { "10.23" } m gegenüber { "21.72" } m ({ "2.12" }×), an Tag { "3" } { "20.33" } m gegenüber { "30.57" } m ({ "1.50" }×) — und er ist jenseits von drei Tagen SCHLECHTER ({ "0.87" }× bei { "5" } Tagen, { "0.43" }× bei { "10" }), was der Bericht ausgibt, statt nur die Horizonte zu zeigen, die ihm schmeicheln. NICHT reproduziert: der autoregressive Residuenfilter und die tabellierte Reduktion der zonalen Gezeiten, das operative Fenster von 365 Tagen ist mit den eingecheckten Daten nicht erreichbar, und es existiert KEINE archivierte frühere Fassung der Reihe in diesem Repository — daher berichtet die Tabelle der archivierten Fassungen keine Zeilen, statt eine synthetisierte zu werten. { "0.30" }, externer Vergleich, ein Befund (bleibt MODELLED): Bei der Wertung gegen dieselben endgültigen Werte über { "178" } archivierte Ausgaben von Bulletin A mit dem Standardfenster der Crate von 15 Tagen liegt der UT1-MAE des Prädiktors bei 2.4x bis 12.6x dem von Bulletin A bei { "1" } bis { "10" } Tagen (Zielwert 1.5x) und bei { "5.32" } ms bei { "10" } Tagen, außerhalb des Bereichs von { "0.36" } bis { "3.13" } ms des 2. EOP PCC; der Pol liegt bei 1.5x bis 1.85x dem von Bulletin A (nur bei { "6" } und { "7" } Tagen innerhalb von 1.5x); { "19" } von { "21" } vorregistrierten Bedingungen scheitern. Korrektur zu Weg ({ "3" }): Die Zeilen des Produkts von { "2026" }, mit denen verglichen wurde, tragen die IERS-Markierung I (gemessen), nicht P, daher beziehen sich diese Übereinstimmungszahlen auf gemessene Rapid-Werte, nicht auf Vorhersagen von Bulletin A. { "0.30" }, Runde { "2" }, ein Prädiktor aus kleinsten Quadraten plus Autoregression mit analytisch entfernten zonalen Gezeiten, gegen { "178" } archivierte Ausgaben von Bulletin A beim Zielwert der Runde 1 (vorregistriert c93605b4), ein Befund (bleibt MODELLED): { "12" } von { "21" } Bedingungen gelten; der UT1-MAE liegt bei { "1.73" } bis 2.11x dem von Bulletin A bei { "2" } bis { "10" } Tagen (Zielwert 1.5x), während der Pol bei jeder Vorlaufzeit innerhalb von 1.27x liegt. { "0.30" }, Überarbeitung: Da die Offline-Eingabe nun nach der IERS-Markierung klassifiziert wird, beziehen sich die Übereinstimmungszahlen des Wegs ({ "3" }) auf reale Vorhersagen von Bulletin A (0.256/0.695/1.252/3.885 ms bei 1/2/3/9 Tagen gegenüber Rapid-Zeilen -> 0.133/0.421/0.839/2.786 ms)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests und tests/operational_eop_predictor_reference.rs (Rückgewinnung der Koeffizienten des analytischen Signals auf { "1e-9" } bei einem 365-Tage-Fenster; eine Fehler-plus-Rate-Anpassung, die auf realen Zeilen der geschlossenen Steigung und dem Achsenabschnitt der gewöhnlichen Methode der kleinsten Quadrate auf { "1e-12" } entspricht; ZWEI Look-ahead-Detektoren, die die schnellen UT1- und Polspalten jeder Zeile nach der Ausgabeepoche zerstören — und die Bulletin-B-Finals intakt lassen — und bitgleiche Ausgabe verlangen, durch Mutation verifiziert: { "10" } Tests werden rot, wenn die Anpassungsgrenze um genau einen Tag gelockert wird; eine unabhängig neu aufgebaute Epochenliste; der Bulletin-B-Block eines Ziels geleert und gezeigt, dass die Epoche die Tabelle verlässt; die Zulassung von Termen bei Fenstern von { "6" }, { "15" }, { "150" } und 365 Tagen geprüft; monotone Zeilenzahlen; und eine eingefrorene Aufnahme des Standardberichts vor der Änderung, Feld für Feld ohne Toleranz geprüft, die zusätzlich prüft, dass die Aufnahme die neuen Schlüssel nicht enthält, damit sie nicht unbemerkt zu einem Selbstvergleich neu erzeugt werden kann); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (die optionale Erweiterung EopSeries::with_ls_ar_prediction über die letzte Zeile hinaus: Antworten in der Tabelle bitgleich, Prognosezeilen gleich ls_ar_predict, Bezugssystem-Argumente jenseits der Tabelle folgen der Prognose, statt begrenzt zu werden; interne Konsistenz)

# text
seg-546d8034c488 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Identitäten in geschlossener Form und ein unabhängiger Weg innerhalb des Repositorys, ohne Anspruch auf eine externe Referenz. Der Helmert-Entwurf — die einzige neue Ableitung im Modul — wird durch zentrale finite Differenz von lunar_frame_realise::apply_helmert neu hergeleitet, einen Pfad, der keinen Ausdruck mit der analytischen Form teilt. Die Akkumulation, die er zusammensetzt, ist die von lunar-vlbi-fim, deren Jacobi-Matrix dort gegen lunar_vlbi::vlbi_delay_s per finiter Differenz geprüft wird und deren Kern der linearen Algebra separat extern gegen numpy in tests/fim_observability_reference.rs verankert ist — diese Zeile übernimmt keinen der beiden Status. Die physikalische Referenz ist strukturell statt numerisch: Eine Beacon-Laufzeitpartielle ist die Nahfeld-DIFFERENZ zweier nahezu paralleler Einheitsvektoren, also MUSS die am schlechtesten bestimmte Translationsrichtung die körperfeste Richtung zur Erde sein, und der Test prüft die berechnete Antwort gegen die separat gemessene Richtung. MEASURED: aus der Kampagne abgeleitete Translationssigma { "6.3975" } m gegen den Rückgewinnungsfehler { "0.3125" } m des Szenarios mit eingespeister Transformation ({ "20.5" }× enger), während Rotation und Maßstab in die ANDERE Richtung laufen, mit { "2.32" }× und { "13.5" }× weiter — der eingespeiste Pfad nimmt ein isotropes Sigma an und verteilt seinen Fehler daher gleichmäßig auf sieben Parameter, was die Laufzeitbeobachtungsgröße nicht tut. Rang 7/7, aber Kondition { "3.8e5" }, mit einer Richtung, die zu { "99.57" } % reine Translation zur Erde hin ist und vierzigmal schlechter als jede andere. WAS DIESE ZEILE NICHT BEHAUPTET: dass die Kampagnenzahl in absoluten Werten richtig ist. Sie stellt fest, dass die Zahl sich nun aus einem Zeitplan, einer Geometrie und einem Fehlermodell HERLEITET und nicht aus einer vorgegebenen Antwort. Bleibt ReferenceImpl/MODELLED: Es gibt kein veröffentlichtes Paar aus Mond-VLBI-Kampagne und Datum-Kovarianz, das Stationsnetz und das Laufzeit-Sigma sind ILLUSTRATIVE Eingaben (der Beacon-Katalog hat Quellen, die Kampagne nicht), Beobachtungen werden als unabhängig behandelt, während Troposphäre und Uhr einer realen Sitzung zwischen benachbarten Scans korreliert sind, und die Ephemeride, die Uhren, die Troposphäre und die Erdorientierungsparameter werden FEST gehalten. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): Mit jeder Beacon-Jacobi-Zeile, neu aufgebaut aus NAIF-SPICE-Lichtlaufzeiten (DE440, ITRF93, MOON_ME; vorab festgelegt { "50863551" }), stimmen der Zeitplan, der Helmert-Rang, die Datum-Sigmas (innerhalb von { "4.7e-3" }), die Kondition, die schwächste Richtung ({ "0.07" } Grad), der Librationsdurchlauf und die Bogenreihenfolge in sechs Szenarien innerhalb der vorab festgelegten { "1" } % / { "0.2" } / { "0.05" } Grad überein. NumPy auf der festgeschriebenen Jacobi-Matrix der Engine stimmt auf { "3e-14" } überein, wo die Stationen fest sind. Mit geschätzten Stationen weicht es um { "6.8e-6" } ab gegen ein vorab festgelegtes { "1e-9" }, dessen Prämisse zur Konditionszahl falsch war (Helmert-Kondition { "2.1e8" }; unabhängige NumPy-Wege weichen um { "3e-6" } voneinander ab; ein Beitrag des Pseudoinversen-Fallbacks der Engine mit { "1e-9" } ist nicht ausgeschlossen), sodass die Zeile auf Grundlage dieser Vorregistrierung nicht hochgestuft wird. { "0.36" } Neuregistrierung mit einem konditionsskalierten Zielwert (vorab festgelegt b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) aus der Konditionierung der gemeinsamen Information und ihrer Helmert-Reduktion), ein Befund (bleibt MODELLED, NOT MET): Schritt { "0" } schließt den Pseudoinversen-Fallback für die Lücke von { "6.8e-6" } AUS (keine Matrix stromaufwärts der Helmert-Matrix fällt in den sechs ursprünglichen Szenarien zurück, knappster Abstand ein Faktor { "2.6" }), der SPICE-Zweig hält weiterhin in allen sechs, und NumPy stimmt in sechs von acht Szenarien innerhalb des Zielwerts überein (Standard, die beiden Bögen, das 3x-Laufzeit-Sigma, der kollineare Defekt und der frische Lauf mit festen Stationen am 2026-12-01; schlechtester Wert { "0.13" } seines Zielwerts). Es scheitert bei stations_estimated (Datum-Sigmas bis { "6.8e-6" }, Kondition { "9.1e-6" }, Norm bei verworfener Unabhängigkeit { "3.5e-6" }, gegen t = { "5.9e-7" }), und am frischen Datum hat der Südpol-Beacon keine Beobachtung, sodass die Beacon-Information rangdefizient ist (Pseudoinversen-Fallback stromaufwärts der Helmert-Matrix in beiden frischen Szenarien) und die unveränderte NumPy-Referenz stations_estimated_fresh nicht auswerten kann (singuläre Matrix). Ergebnisse: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-c77bd56a0619 = lunar_frame_campaign (zusammengesetzt aus lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } Bibliothekstests: der Helmert-Entwurf gegen eine zentrale finite Differenz von lunar_frame_realise::apply_helmert — das Modul, FÜR das das Datum da ist, das keine Ableitung berechnet und daher die Vorzeichenkonvention von [p]ₓ festlegt — alle { "84" } Entwurfseinträge stimmen auf < { "1e-6" } überein; eine reine Netzwerktranslation, als reine Translation zurückgelesen, mit < { "1e-6" } Leckage in die anderen sechs Parameter; das Datum-Sigma exakt linear im Laufzeit-Sigma auf { "1e-8" } bei einer { "3" }×-Änderung in allen sieben Parametern; ein Bogen von { "16" } h als schlechter und ein Bogen von { "48" } h als besser gemessen als { "24" } h, wobei der ausgegebene Librationsdurchlauf gleich geordnet ist; die schlechteste Translationsachse als die dominante Achse der separat gemessenen körperfesten Richtung zur Erde bestätigt und um > { "5" }× schlechter als die anderen, eine physikalische Referenz, von der nichts im Löser wusste; drei kollineare Beacons, die einen Defekt erzeugen, bei dem jedes Datum-Sigma NULL ist und die Nullrichtungen in der Siebenparameterbasis ausgegeben werden; offblock_fraction und die Korrelation zwischen Beacons exakt { "0.0" } bei festen Stationen und beide > { "0" } bei geschätzten; die Zahlen der eingespeisten Transformation im Vergleichsblock als gleich einem unabhängigen Lauf dieses Szenarios auf { "1e-14" } relativ gezeigt, statt abgeschrieben; eine Sicherung, dass nirgends im Dokument ein eingespeistes oder zurückgewonnenes Datum erscheint; die Ausgabe der Mondrahmen-Realisierung byteweise durch FNV-1a-64 über json‖summary‖svg für drei Eingabeformen festgelegt, mit einem Fingerabdruck vor Beginn der Arbeit); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (gesperrt; das strenge lunar_frame_campaign_matches_spice_geometry_and_numpy bleibt ignoriert); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (Befund; Gründerentscheidung 2026-10-02, Option A: Diese Zeile bleibt MODELLED und übernimmt den Status der separaten Zeile nicht; gegen eine mpmath-Referenz mit 50 Stellen, vorab festgelegt 804662d5, liegen die Datum-Sigmas der Engine bei geschätzten Stationen innerhalb ihrer A-priori-Rückwärtsfehlerschranke, { "9.7e-6" } daneben am 2024-01-01, und der Zielwert { "1e-9" } lag unter dem, was irgendein Weg mit doppelter Genauigkeit erreicht, wobei der beste, eine NumPy-QR-Projektion, { "5.5e-9" } daneben liegt; der Beleg stützt die separate Zeile 'Lunar frame datum covariance with the stations estimated, against 50-digit extended precision'); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (festgelegt); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (festgelegt)

# text
seg-114007ecc9fe = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Ein separater Schätzer in dieser Codebasis mit einem anderen Algorithmus und einem getrennten Codepfad: nichtlineares gewichtetes Gauß-Newton-Verfahren mit Partiellen per finiter Differenz, dessen Urteil als gemessener Zustandsrückgewinnungsfehler in km und mm/s gelesen wird. Er hat keinen Ausdruck mit dem Rang-und-Kovarianz-Weg der Gramschen Matrix gemeinsam, und die Trennung wird durch eine Quelltextsperre DURCHGESETZT, statt behauptet zu werden. MEASURED auf dem veröffentlichten ebenen DRO-Gitter: Das SCHÄTZBARKEITS-Kriterium ist CORROBORATED — die gemessene Monte-Carlo-Grenze ist { "5.739130" } h gegen die formale { "5.739130" } h (Verhältnis { "1.0000" }), und der gemessene RMS reproduziert das formale 1σ über { "21" } Bogenlängen mit einem geometrischen Mittel des Verhältnisses von { "0.9804" }. Das RANG-Kriterium ist NICHT bestätigt als Rückgewinnbarkeitsgrenze: Der Schätzer gewinnt ab { "0.782609" } h zurück gegen { "2.086957" } h der Gramschen Matrix, Verhältnis { "0.375" }, und bei { "1.826087" } h — dem letzten Präfix, das die Rangauslesung mit { "3" } von { "4" } bewertet — gewinnt er auf { "1.96e-5" } der A-priori-Verschiebung zurück. Die Rückgewinnungsgrenze bleibt über drei Dekaden ihrer eigenen Schranke unverändert, während die Rangschwelle über vier Dekaden von rel_tol von 'nie' bis { "0.782609" } h reicht, und beide fallen bei rel_tol = { "1e-8" } exakt zusammen. Diese Spanne wurde zuerst als bis { "0.260870" } h reichend festgehalten; diese Zahl war ein ARTEFAKT, erzeugt durch eine Rangauslesung, die { "4" } Richtungen aus { "2" } Messzeilen unterhalb der f64-Rauschgrenze zählte, und sie wird hier korrigiert, statt stehen zu bleiben. Die Rangauslesung wird nun durch die Sylvestersche Ungleichung begrenzt, wobei der Grund ausgegeben wird, und die korrigierte Spanne sättigt genau bei dem Bogen, bei dem der unabhängige Schätzer zurückgewinnt, was die Kreuzvalidierung dieser Zeile stärkt statt schwächt: Das veröffentlichte { "1e-6" } ist eine konservative KONVENTION für Singulärwerte, keine Aussage über die Rückgewinnbarkeit. Dasselbe Muster räumlich: NRHO { "9.290323" } h gegen { "21.677419" } h, Halo { "22.978723" } h gegen { "39.829787" } h, wobei die Schätzbarkeit in beiden exakt übereinstimmt. Der Sechszustand des ebenen DRO gewinnt bei keinem Bogen zurück und reproduziert damit unabhängig den strukturellen Datumsdefekt dieser Familie aus einem Schätzer, dem nichts darüber gesagt wurde. NICHT extern verankert — die Dynamik und die Anfangsbedingungen werden mit der geprüften Analyse geteilt, und kein öffentlicher Datensatz veröffentlicht eine solche Schwelle — daher wird ExternalDataset abgelehnt

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests und tests/cislunar_arc_recovery_reference.rs (beide Grenzen und ihre Verhältnisse auf dem veröffentlichten Gitter festgelegt; die gemessene Fehlerkurve Zeile für Zeile mit der formalen Kovarianz verglichen, mit einer Schranke vom Faktor zwei je Zeile und einer Schranke für das geometrische Mittel; eine NEGATIVKONTROLLE — der Sechszustand des ebenen DRO — bestätigt, dass das Kriterium scheitern KANN und dass der nicht regularisierte Schätzer über { "1e6" } km hinaus divergiert, statt einen plausiblen kleinen Fehler zurückzugeben; Parametrisierungsinvarianz auf jedem Präfix auf { "1e-3" } relativ bestätigt; eine Quelltextsperre, die Kommentare, Zeichenkettenliterale und das Testmodul entfernt und dann bei jeder Erwähnung der Jacobi-Matrix, STM, SVD-Rang oder SRIF-Maschinerie fehlschlägt, durch Mutation verifiziert, indem ein verbotener Aufruf eingefügt wird; eine reine Testprüfung, dass die finiten Differenzen den analytischen Zeilen gleichen, sodass die Linearisierung als gut bekannt ist, während der analytische Weg im Schätzer fehlt; Determinismus byteweise bestätigt; das freigegebene cislunar-observability-Dokument durch Schlüsselmenge, kanonischen Fingerabdruck und Zusammenfassungszeile festgelegt)

# text
seg-03751f09c5c9 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Die GEOMETRIE ist extern und mit Hash versehen: drei Fixtures, deren Zahlen nur aus Dokumenten stammen, die mit URL, Abrufdatum und SHA-256 abgerufen wurden, regenerierbar durch festgeschriebene Generatoren, die den Upstream-Hash prüfen und ABBRECHEN, statt eine Zahl auszugeben — die LANS-Referenzkonstellation zur Interoperabilitätsdemonstration (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), die LNCSS-Fallstudien (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) und eine echte Ephemeride geflogener Raumfahrzeuge für LRO, Danuri, Chandrayaan-2 und CAPSTONE, ausgewertet aus den eigenen rekonstruierten Kernels des JPL über Horizons. KEIN Konstellationskernel für Mondnavigation existiert öffentlich — Moonlight/LCNS, LCRNS und LNSS fliegen nicht, und NAIF veröffentlicht nichts für sie — und keiner wurde erfunden. Die ABGELEITETE σ_URE-Anforderung hat KEINE externe Referenz (niemand veröffentlicht die Entfernungsmessgenauigkeit, die ein lunarer HPL von { "50" } m über dieses Dienstvolumen verlangt), daher wird sie gegen ihre eigene algebraische Identität geprüft und unabhängig davon, indem der gesamte Durchlauf bei der berechneten Anforderung wiederholt und bestätigt wird, dass die Verfügbarkeit dort umschlägt. MEASURED: Der veröffentlichte Entwurf mit 8 Satelliten braucht σ_URE { "2.9044" } m bei { "100" } % Abdeckung gegen { "0.3591" } m bei { "37.85" } % der illustrativen Konstellation — eine Revision einer veröffentlichten Zahl um { "8.09" }× nach Programmregel R4. Die qualitative Schlussfolgerung bleibt bestehen (LNIS-Klasse { "30" } m schließt einen südpolaren HPL von { "50" } m weiterhin nicht), aber das Defizit wurde um das Achtfache überschätzt. Die LANS-Demo mit 5 Satelliten liefert NULL Proben des Schutzniveaus — fünf Satelliten können nicht die sechs in Sicht liefern, die eine Hypothesenmenge für einen Einzelfehler braucht — und das Anforderungsfeld FEHLT, statt erfunden zu werden; ebenso bei den vier realen Raumfahrzeugen mit { "0" } % Abdeckung. InternalConsistency ist die ehrliche Art: Die EINGABEDATEN sind extern und mit Hash versehen, aber die Größe, um die es in dieser Zeile geht, wird nur gegen sich selbst validiert. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): gegen die LNCSS-Fallstudienstatistiken von navi.613 an { "346" } Gitterpunkten liegen { "4" } von { "12" } Verfügbarkeitsstatistiken außerhalb der vorab festgelegten { "2" } Prozentpunkte (Fall A: -4.0, +{ "22.5" } und -3.6 pp; Fall B: -12.1 pp). Wahrscheinliche Ursachen: Elemente im falschen Bezugssystem gelesen, Zweikörper-Kepler über { "15" } Tage gegen das nicht angegebene Kraftmodell der Veröffentlichung und ein Gitter, das aus dem Text nicht reproduzierbar ist. Die PDOP-Hälfte war nicht auswertbar (LANS druckt keine numerische Statistik); der Vergleichstest ist ignoriert festgeschrieben. { "0.30" } Runde { "2" }, ein Befund (bleibt MODELLED): gegen eine Referenz aus Orekit { "12.2" } / Hipparchus { "3.1" }, die den gesamten Bericht berechnet (Orekit-Propagation, DOPComputer-Sichtbarkeit und DOP, mit Hipparchus zusammengesetzte MHSS-Schutzniveaus, die je Probe gelöste Anforderung; vorab festgelegt d3ce97b2) auf allen fünf abgerufenen Geometrien und zwei Gittern stimmen { "155" } von { "160" } Werten innerhalb der vorab festgelegten Zielwerte ({ "2" } pp, { "5" } %, { "1" } %) überein, einschließlich der sigma_URE-Anforderung für LNCSS A und C ({ "3.879072208" } m auf beiden Seiten für Fall A) und der fehlenden Anforderung für LANS und die Orbiter. LNCSS B auf dem dichten Gitter scheitert an seinen Statistiken der schlechtesten Probe (sigma_required { "0.000923" } gegen { "0.001511" } m, hpl_max { "1.63e6" } gegen { "0.99e6" } m), wo nahezu singuläre Geometrien (PDOP etwa { "1e6" }) die Übereinstimmung der Position im Meterbereich verstärken; seine p95-Anforderung stimmt überein ({ "1.6343" } gegen { "1.6357" } m). Die Anforderung der schlechtesten Probe ist bei entarteter Geometrie schlecht gestellt. Gegen navi.613: { "4" } von { "12" } weiterhin außerhalb von { "2" } pp (festgelegt)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (Format- und Bezugssystem-Parsing; Lagrange-Interpolation exakt an den Knoten und auf einer linearen Bahn abseits der Knoten; ICRF-Elemente erhalten die IAU-{ "2015" }-Reduktion und sind byte-gleich mit einer expliziten Anwendung von icrf_to_iau_moon; wahre↔mittlere Anomalie Hin-und-zurück-Umrechnung gegen eine Vorwärts-Kepler-Lösung; fehlerhafte Dateien mit benanntem Grund abgelehnt). lunar_service::tests (bei nicht gesetztem <c1/> sind Schlüsselmenge und SHA-256 des Berichts festgelegt; die Keplersche Zeile gleicht dem eigenständigen Keplerschen Lauf Feld für Feld; die Identität σ_required · HPL_max / σ_URE = AL, dann ein DURCHGÄNGIGER erneuter Lauf bei der berechneten Anforderung, der { "100" } % Verfügbarkeit des Schutzniveaus erreicht, und ein erneuter Lauf mit { "1" } % darüber, der sie nicht erreicht; jedes ausgegebene numerische Feld beider neuer Blöcke aus dem erzeugten JSON auf Einheit und Herkunftsklasse durchgegangen; die festgeschriebenen Fixtures Satellit für Satellit mit ihren Quelltabellen abgeglichen; ein Horizont über das Ende einer Tabelle hinaus abgelehnt); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

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
seg-1e414b2a33b2 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Das ausgegebene Dokument selbst: Jedes numerische Blatt muss zu einem Eintrag im eigenen Einheitenblock dieses Dokuments aufgelöst werden. Es gibt kein externes Einheitenregister, gegen das eine DEKLARIERTE Einheit geprüft werden könnte, daher ist eine deklarierte Einheit eine geprüfte Behauptung und keine verifizierte — das Gate verifiziert VOLLSTÄNDIGKEIT und WOHLGEFORMTHEIT, nicht Wahrheit, und validiert wäre falsch, weil nichts Externes bestätigt, dass <c1/> die richtige Einheit für ein Feld mit dem Namen <c2/> ist. Eine unabhängige Gegenprüfung über Namenssuffixe wurde über die { "1,434" } Felder durchgeführt, die ZU DIESEM ZEITPUNKT beschrieben waren: Von den { "691" } mit einem einheitentragenden Suffix weichen { "40" } von der deklarierten Einheit ab, und alle { "40" } sind erklärt (Suffixe pro Sekunde, Minima, Apertursekunden, Newtonmeter gegen ein nanometerartiges Suffix), sodass keine falsche Einheit zutage trat. Diese Gegenprüfung wurde seither nicht erneut durchgeführt, und die Abdeckung ist darüber hinaus gewachsen — die Zahl bleibt bei dem, was tatsächlich gemessen wurde, statt auf die aktuelle Gesamtzahl umgeschrieben zu werden. Zum Zeitpunkt dieser Änderung ({ "0.27.0" }) stieg die Abdeckung von { "7" } von { "56" } Arten auf { "60" } von { "61" } und von { "389" } von { "1354" } Feldern auf { "1,742" } von { "1,744" } (docs/field-units-schema.json, das eine Veraltungsprüfung aktuell hält). KEINE Art bleibt unabgedeckt (Obergrenze { "0" }, FUT-28, { "0.36" }): die letzte war <c3/>, deren zwei Spalten vom Aufrufer vergeben werden, sodass ihre Einheiten Daten sind; sie werden nun als <c4/> beschrieben, und die Einheit jeder Position wird aus der eigenen Einheitentabelle des DURCHLAUFENEN Pakets in <c5/> und <c6/> gelesen (oder aus der deklarierten <c7/> der Achse übernommen, die mit der des Pakets übereinstimmen muss, wenn beide existieren; null, wenn keine von beiden existiert, angegeben statt geraten). <c8/> war die davor und fiel von der Liste, als sein freigegebenes Dokument einen Einheitenblock erhielt: Die Additivitätsfestlegung, die <c9/> als verbotenen Schlüssel benannt hatte, BEWEIST nun, dass die Ergänzung additiv ist — entfernt man den Block wieder, ergibt das Dokument weiterhin den Hash der beiden Konstanten, die vor seinem Bestehen eingefroren wurden, sodass ein freigegebener Wert, der sich unter der Ergänzung verschoben hat, weiterhin scheitert. Die Arbeit hat außerdem zwölf Einheiten- oder Dokumentationsdefekte im bestehenden Code zutage gefördert, die gemeldet statt unter R1 behoben wurden

# text
seg-34bff3218a01 = tests/field_units_global.rs (alle { "61" } registrierten Arten laufen, je eine Dokumentform: Jedes numerische Blatt muss zu einem Eintrag im eigenen Einheitenblock dieses Dokuments aufgelöst werden; ein fehlerhafter Eintrag zählt für JEDE Art als fehlend, ausgenommen oder nicht, sodass ein Platzhalter keine Abdeckung kauft; die Ausnahmeliste darf ihre festgelegte Obergrenze nicht überschreiten, eine gelistete Art, die sich als vollständig abgedeckt erweist, lässt das Gate FEHLSCHLAGEN, sodass die Liste nicht aufgefüllt werden kann, und eine registrierte Art, die in der Runner-Tabelle fehlt, lässt es fehlschlagen, sodass ein neues Paket nicht ungeprüft hineinrutschen kann — was geschah und beide Arten erfasste, die nach Beginn dieser Arbeit hinzukamen; eine Einwegsperre für den Rückstand beschriebener, aber undefinierter Einheiten; und eine Veraltungsprüfung des festgeschriebenen Schemadokuments); field_schema::tests

# text
seg-8efc76b4ee1d = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Nur interne Konsistenz: Jeder hinzugefügte Standort ist ein eigener Punkt, und eine Laserentfernung oder eine VLBI-Laufzeit einer festen Station berührt einen Punkt, sodass seine Information A_p^T M_p A_p positiv semidefinit ist und sich addiert; der Test prüft die Fisher-Differenz und jede Varianz dagegen. Das Ergebnis mit fünf Arrays ist die bestehende Zeile mit Realdaten und bleibt unverändert. Der hinzugefügte Reflektor verwendet Epochen wieder, die für die fünf bestehenden Arrays eingeplant waren, einen ILLUSTRATIVE Zeitplan, und das Netz, der Zeitplan und das Laufzeit-Sigma des hinzugefügten Beacons sind die ILLUSTRATIVE Eingaben der Lunar-Frame-Kampagne; der Standort ist eine ILLUSTRATIVE südpolare Position. Ein südpolarer Standort sieht die Erde tief am Horizont oder gar nicht, was die bestehenden Blickwinkeltests ausdrücken; keiner der beiden Standorte wird durchgehend per Entfernungsmessung erfasst. Die Zahlen sind Cramér-Rao-Schranken für einen reduzierten Parametersatz, kein gelöstes Datum und keine Aussage über irgendeine reale Station

# text
seg-926c069f8a2e = lunar_llr (über lunar_frame_campaign::beacon_information, schedule_for und solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: leere Listen und das Basislinienbeispiel ergeben den Standardbericht und die Zusammenfassung byteweise; an_added_site_never_increases_any_variance: der kleinste Eigenwert von H_after - H_before ist nichtnegativ auf { "1e-9" } des größten, jedes Sigma-Verhältnis nachher/vorher ist höchstens eins, und beide hinzugefügten Standorte werden beobachtet; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml und scenarios/lunar-station-geodesy-with-station.toml (derselbe archivierte Zeitplan und derselbe VLBI-Kampagnenblock)

# text
seg-cc6113ce33c0 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Form: Jede Sicherung läuft über ein festes bekannt fehlerhaftes Snippet, das auslösen muss, und ein festes bekannt fehlerfreies Snippet, das still bleiben muss, beides literale Konstanten, die der Detektor nicht beeinflussen kann. Die beiden bekannt fehlerhaften Snippets sind die Defekte F22 und F25 in ihrer ursprünglichen Gestalt. Dies ist eine INTERNE Referenz, und die Zeile ist entsprechend MODELLED: Sie beweist, dass die Sicherungen den Defekt von seiner Behebung unterscheiden, nicht, dass die von ihnen beschriebenen Klassen erschöpfend sind. Ihre angegebenen blinden Flecken — geteilter Zustand, der kein Pfad ist, eine Festlegung in einer kurzen benannten Konstante, ein seltenes Wettrennen, das drei Läufe nicht erfassen, und ein Beleg, den jeder fälschen kann, der die Datei schreiben kann — sind in der Moduldokumentation von tests/source_guards.rs und im Kopf jedes Skripts ausgeschrieben, statt dem Zufall der Entdeckung überlassen zu werden.

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } Tests: beide Sicherungen über den gesamten Quellbaum, plus Mutations-Fixtures, die jede Sicherung in beide Richtungen bewerten — das F22-Muster auf beiden kollidierenden Pfaden gemeldet, die ausgelieferte Behebung mit atomarer Sequenz akzeptiert, eine halbe Behebung genau auf dem Pfad gemeldet, der seine eindeutige Komponente verlor, ein Tempfile-Handle und ein geerbtes eindeutiges Verzeichnis akzeptiert, eine Wanduhr abgelehnt; eine nicht deklarierte Festlegung gemeldet, eine deklarierte akzeptiert, ein Geltungsbereich ohne Ausschluss abgelehnt, eine Deklaration im Doc-Kommentar des umgebenden Tests akzeptiert und gezeigt, dass sie nicht auf den nächsten Test übergreift; und jede Schreibweise einer Festlegung — Hex, Dezimal, Digest-Zeichenkette, Bytelänge, benannte Bytezahl, Golden-Datei — erkannt, während Algorithmuskonstanten, RNG-Seeds und kleine Kardinalitätsprüfungen es nicht werden)

# text
seg-b99e60173863 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Eigenschaftstests (Monotonie, kein Abfall bei der Übergabe) + Exponentenlint gegen holdover::coast_phase_variance

# text
seg-416def055790 = integrity::composed_pl::tests (monoton, P0-Untergrenze, K(IR/2), Exponenten, untere Halbstetigkeit)

# text
seg-5b20d21462cb = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Identität der fast sicheren Einhüllenden √(2Dt·lnln t) in geschlossener Form + HPL-Dominanzprüfung; Baweja-arXiv:{ "2606.24210" }-Unmöglichkeitsnaht

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (Divergenz, Schwelle, Dominanz durch IR-Verschärfung)

# text
seg-b286777831de = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Unabhängige Reproduktion mit numpy + stdlib-statistics der Überschranke in geschlossener Form (InternalConsistency). Die Serie BIPM Circular-T [UTC-UTC(USNO)] ist nur eine ZITIERTE Eingabe — es ist dieselbe Serie, die für die Holdover-Abdeckungszeile R4 bereits validiert ist, und sie wird hier NICHT erneut validiert; die Reproduktion ihrer Werte beweist nichts über R2. Der tiefe Integritätsschwanz ist modelliert. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): auf den BIPM-Dateien je Labor UTC-UTC(k) ({ "102" } Labore, { "105 024" } Zeilen mit veröffentlichten Unsicherheiten) wird die Überschranke b = { "2.576" } u am Schwanz von { "1e-2" } von { "50.8" } % der Zeilen überschritten (Clopper-Pearson { "95" } %: { "50.4" } bis { "51.1" } %) und bei { "101" } von { "102" } Laboren um mehr als { "1" } %. Das veröffentlichte u ist die Unsicherheit der Bestimmung von UTC-UTC(k) durch das BIPM, keine Schranke für den Versatz, der routinemäßig ein Vielfaches von u erreicht; die Überschranke in der angegebenen Form begrenzt nicht die reale Rückführbarkeitsverzerrung von UTC(k). { "0.30" } Runde { "2" }, eine Überschranke der realisierten Versätze UTC-UTC(k), trainiert auf BIPM-Circular-T-Daten von 2015-2022 und getestet auf 2023-2026 (vorab festgelegt ca0921a4, gepoolte Überschreitung höchstens { "1e-2" }), ein Befund (bleibt MODELLED): Die gepoolte Überschreitung beträgt { "0.0333" } ({ "694" } von { "20 826" } Zeilen über { "82" } Labore; { "0.0127" } ohne die { "430" } Zeilen, die per Regel keine Schranke haben). D9 Runde { "3" }, eine gepoolte hierarchische Alterungsschranke (utck_bound), vorab festgelegt fb475550 und prospektiv auf Circular-T-Ausgaben ab { "465" } bewertet: noch nicht ausgeführt (Ausgabe { "465" } wurde am 2026-10-12 mit etwa { "285" } Testwerten veröffentlicht; die vorab festgelegte 1000-Werte-Regel braucht Ausgaben bis etwa { "468" }, und der Lauf braucht die archivierten Dateien je Labor vom 2026-09-30, da das BIPM seitdem { "87" } der { "113" } umgeschrieben hat)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (datengesteuert: überspringt mit einer Meldung, wenn die BIPM-Serie fehlt); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 Runde { "3" }, prospektiv, noch nicht ausgeführt: Circular T { "465" } erschien am 2026-10-12, und die vorab festgelegte 1000-Werte-Regel braucht Ausgaben bis etwa { "468" })

# text
seg-98b92da9ce83 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Unabhängige numpy-Reproduktion der Kreuzkovarianz und der Ungleichung für die fusionierte Verzerrung bei korrelierten gegenüber unabhängigen Quellen (InternalConsistency). Repräsentative Quellenmenge; modelliertes Szenario.

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-b14204d97c55 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Unabhängige numpy-Reproduktion der Statistik + Eigenschaftstest, dass eine Gleichtakt-Einspeisung sie aufbläht (InternalConsistency). Modelliertes Szenario. { "0.30" } Runde { "2" } (vorab festgelegt f9aa360d), blockiert (bleibt MODELLED): numpy { "2.3.5" } LAPACK gesv reproduziert den Wert der Statistik in { "261" } festgeschriebenen Fällen (innerhalb von { "3.5e-15" } bei guter Konditionierung, { "1.2e-9" } bei Kondition bis { "6.1e7" }); das Chi-Quadrat({ "1" })-Nullgesetz ist ein zitierter Satz und die flachen paarweisen Trennungen eine Identität ohne Ausgabe der Engine zum Vergleich, sodass die Eingrenzung auf eine Entscheidung des Eigentümers wartet

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-4d3104f6bc80 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Von der Engine reproduzierte geometrische Struktur plus die 2x2-Schur-Identität in geschlossener Form; in der STRUKTUR konsistent mit Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), deren berichtete Größenordnungen hier NICHT reproduziert werden. Die Klassifikation ist strukturell; die Größenordnungen von Korrelation und CRLB unter realer Geometrie sind MODELLED (Reflektorkoordinaten und -orientierung werden festgehalten). { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): gegen Sosnica et al. { "2025" } liegt die Ursprungs-Maßstab-Korrelation der Entfernungs-Fisher-Information (-0.993 / -0.988) innerhalb von { "0.05" } des veröffentlichten -0.97, aber auf der eigenen Fünf-Reflektoren-Geometrie der Veröffentlichung beträgt die gleichgewichtete 7-Parameter-Helmert-Korrelation -0.78 (der veröffentlichte Wert beruht auf Fehlern je Reflektor, die die Veröffentlichung nicht angibt), und die Ursprungs-CRLB ({ "0.6" } bis { "1.2" } mm bei { "3" } mm Entfernungsrauschen) liegt { "96" } bis { "98" } % unter den { "3.07" } cm der Veröffentlichung bei einer Toleranz von { "20" } %. Größenordnungen nicht reproduziert

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-21d912943641 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Querprüfungen der Partiellen jeder Technik, analytisch gegen finite Differenz (intern); die Verbesserungs-RICHTUNG ist eine geometrische Tatsache. Beacon-Orte, Zeitpläne und Rauschen sind MODELLED/repräsentativ (siehe tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (analytische Partielle von LLR/VLBI/Orbiter gegen finite Differenz); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

# text
seg-b5169f1f17d9 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Die Berechnung wird intern geprüft: jede analytische Partielle gegen eine finite Differenz und der Fall des Nulldatums gegen die nominale Entfernung. Der KATALOG wird extern und unabhängig geprüft - die Hauptachsenkoordinaten von DE440 (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) werden gegen Tabelle { "6" } des Memorandums zu den Oberflächenkoordinaten von DE430 (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, maschinell aus einem durch SHA-256 verifizierten PDF extrahiert durch tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) quergeprüft und stimmen auf { "1.12" } m überein, während die Mean-Earth-Realisierung derselben fünf Arrays um { "672" } bis { "871" } m abweicht. Die ENTARTUNGSSTRUKTUR wird gegen ein veröffentlichtes Ergebnis geprüft: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, die für das Hauptachsen-Bezugssystem des Mondes einen Korrelationskoeffizienten zwischen Lunozentrum-X und Maßstab von r = -0.97 berichten und dass LLR den tatsächlichen Massenmittelpunkt des Mondes wegen dieser Korrelation nicht mit einer Genauigkeit besser als { "12" } cm erreicht. Dieses Modul gewinnt dieselbe Struktur (|corr(t_x, scale)| zwischen { "0.9" } und { "0.9999" }, Datumsdefekt <= { "1" }) aus einem Fisher-Entwurf nur mit LLR zurück. Die Bestätigung erfolgt über Ephemeriden hinweg, nicht als Hin-und-zurück-Rechnung: Die Veröffentlichung kombiniert INPOP21a, DE430 und EPM2021, während dieses Modul von der Libration aus DE440 angetrieben wird. Was NICHT reproduziert wird, ist die Größenordnung - die Korrelation beträgt hier etwa -0.988 gegen ihre -0.97, und die 4-Parameter-CRLB liegt im Submillimeterbereich gegen ihre erreichte Untergrenze von { "12" } cm, weil Orientierung und Reflektorkoordinaten hier festgehalten und dort gelöst werden. Nur Geometrie und Entartungsstruktur; keine Genauigkeitsaussage über ein gelöstes Datum. { "0.30" } externer Vergleich: Die Teile dieses Moduls mit gemessener Entfernung (reflectors(), stations_itrf(), die PA-Platzierung nach DE440 und die baryzentrische Lichtlaufzeit llr_bcrs_one_way_m) sind in ihrer eigenen Zeile, LLR-Modell der gemessenen Entfernung, gegen { "192" } ILRS-Normalpunkte validiert (RMS { "2.81" } m gegen { "10" } m). Diese Zeile bleibt MODELLED, weil der Vergleich mit Messungen den Rest ihres Anspruchs nicht prüft. Der geodätische Stationskatalog stations() rundet APOLLO auf { "0.001" } Grad; mit einer geozentrischen Lichtlaufzeit ergibt er { "22.7" } m auf denselben Punkten (Test reflector_ranges_against_ilrs_normal_points; { "96" } m mit der früheren elementweisen Orientierungsinterpolation). Die analytischen Entfernungspartiellen und die Fisher-Information nur mit LLR werden über llr_range_m und reflector_inertial mit der analytischen Mondreihe (ephem::moon_position, etwa { "0.3" } Grad vom GCRS) und ohne Lichtlaufzeit berechnet

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-9cfe6fa8ac17 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Marginale Fisher-Information per Schur-Komplement der gekoppelten Informationsmatrix, in linearer Algebra in geschlossener Form, geprüft gegen die beiden Grenzregime, die sie vorhersagt. Die Äquivalenz von { "1" } m zu { "3.336" } ns ist die Definition des Meters über c und kein empirisches Ergebnis. Die Beobachtungsnetze sind repräsentative modellierte Geometrie, daher ist das Entwurfsgesetz eine Aussage über die ihm vorgelegte Geometrie und enthält keine Aussage über irgendein im Einsatz befindliches Mondnetz.

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-687f7edfb345 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Die Additivität der Fisher-Information über unabhängige Messungen ist eine Eigenschaft in geschlossener Form, hier geprüft gegen eine unabhängig geschriebene elementweise Summe und gegen die Reihenfolgeinvarianz und Monotonie, die daraus folgen. HINWEIS ZUM NACHWEIS: Der Kombinierer hatte zuvor überhaupt keinen Test, und der eine Test im Modul summierte die beiden Informationsmatrizen inline, statt ihn aufzurufen, sodass ein defekter Kombinierer das Modul grün gelassen hätte; der Test läuft nun über combine und scheitert, wenn dieser mutiert wird. Alle Beacon-Orte, die Orbitergeometrie, die Genauigkeiten je Technik und die relativen Kosten sind repräsentative Annahmen und keine Missionswerte (siehe tests/fixtures/llr_geometry/NOTICE.md), sodass jede Entartungsmetrik und jede CRLB-Zahl, die über dieses Menü erreicht wird, den modellierten Status von lunar_identifiability::decompose erbt.

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - eine leere Auswahl ergibt die Nullmatrix, eine einzelne Auswahl ist die Identität, ein Paar gleicht einer unabhängig geschriebenen elementweisen Summe, und das Ergebnis ist invariant gegenüber der Auswahlreihenfolge; adding_a_block_never_reduces_the_degeneracy_metric - Monotonie unter hinzugefügter Information; radial_diversity_beats_transverse_for_breaking_the_degeneracy - der Orbiterblock auf der Rückseite hebt die Entartungsmetrik stärker an als der transversale VLBI-Block)

# text
seg-66020d555be6 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Dreiecksschranke im ungünstigsten Fall für die Wirkung der Helmert-Punkt-Jacobi-Matrix (geschlossene Form)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (Monotonie im Budget; RSS-Budgetreduktion unter einer CRLB je Anbieter; durchgerechnete Rotationstoleranz am lunaren Hebelarm; bindender Term = Rotation)

# text
seg-da0791f2edc4 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — RMS-Aggregation der validierten Aufteilungen je Paar unter jeder Konvention (geschlossene Form)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris setzt das Budget auf null; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } bei den realen Aufteilungen; Reihenfolge der Konventionen)

# text
seg-303947e00325 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geometrische Instanziierung der blockweisen Spark-/Secure-State-Estimation-Schranke (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; blockweiser Spark von Donoho–Elad { "2003" }; Candès–Tao { "2005" }) — NICHT die Konsensschwelle 3f+{ "1" } von Lamport–Shostak–Pease ('Byzantine' benennt nur das MODELL beliebiger bzw. kolludierender Fehler). Die konkrete tolerierte Fehlerzahl ist eine modellierte Eigenschaft der repräsentativen Netzgeometrie, auf Selbstkonsistenz geprüft durch von Hand konstruierte analytische Fälle und die Zählformeln

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (nichtverschwindender, aber rangdefizienter Block ⇒ block_spark { "1" }, f_detect { "0" }; unabhängige Spalten ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (ein Teilnehmer, dem alle Messungen eines Knotens gehören = ein Uhrversatzfehler ∈ range(G), nicht erkennbar, mit einer deutlichen spektralen Lücke der Gramschen Matrix), byzantine_redundant_net_identifies_at_least_one (sechs unabhängige Teilnehmer mit je einer Messung ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (P⊥ = I Handfälle legen f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋ fest)

# text
seg-c4b1731814f5 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Argument der freien Parameter der Ensemblezeit (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instanziiert auf dem repräsentativen realen DE440-Netz je Knoten: ein Test der relativen Residuen auf Null für den analytischen Generator der gemeinsamen Rate gegen GᵀWG, wobei der durch Tie-Breaking aufgelöste Kontrast die echte Eichung von einem Artefakt des Oszillatormodells unterscheidet. Repräsentative modellierte Geometrie, kein zertifiziertes Zeitgebungsbudget

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (selbstbezügliches Netz: Die gemeinsame Rate liegt in N(GᵀWG), temporal_gauge_dim { "2" }; nach einer externen Raten-Anbindungszeile: Rate aus der Eichung verdrängt, temporal_gauge_dim { "1" }, wobei der gemeinsame Versatz bestehen bleibt)

# text
seg-1b1f761bd9a9 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Algebra von Paritätsprojektor und Pseudoinverse in geschlossener Form auf dem repräsentativen realen DE440-Netz je Knoten: Die Aufteilung in gemeinsam/differentiell, die Vereinigung N(G) ⊕ range(G) und die Steigung der Schutzlücke nach Brown ({ "1992" }) folgen alle aus der Bereichsauslöschung P⊥·G = { "0" }. Repräsentative modellierte Geometrie, kein zertifiziertes Schutzniveau

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (gemeinsame Verzerrung nicht erkennbar, differentielle erkennbar), slope_infinity_in_range_finite_detectable (g7: Steigung ∞ für b ∈ range(G), endlich für b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: Rang(GᵀWG) = state_dim − { "8" }, die 8-dimensionale Eichung ist der gesamte Nullraum mit einer spektralen Lücke von >{ "1e6" })

# text
seg-1ac1dc1c053d = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Transkription der benannten Empfehlungen (frei von itu.int herunterladbar), wobei jede Grenze ihre Tabelle oder Klausel trägt, aufgelistet mit jedem unbestätigten oder nicht implementierten Punkt in docs/TELECOM-TIMING.md; die Stetigkeitsidentitäten an den Knickpunkten, die die Tabellen implizieren, werden in den Tests geprüft. Eine Normentranskription mit Prüfungen der internen Konsistenz, kein Konformitätstest und keine externe Validierung. { "0.30" } Runde { "2" } (vorab festgelegt 970003ee), blockiert (bleibt MODELLED): Die zehn Maskenwerte und dreizehn ePRTC-A-Holdover-Werte, die die Empfehlungen als durchgerechnete Zahlen drucken (G.8272 Abb. 1-2, G.8272.1 Amd.1 Kl. { "8.2.1" } und Abb. V.1-V.3, G.8271.1 Amd.3 Abb. 7-2 bis 7-4), werden innerhalb einer halben gedruckten Einheit reproduziert, die meisten davon Tabellenkonstanten oder Knickpunkte; G.8271.1 Abb. 7-2 beschriftet { "200" } ns bei { "1.3" } s gegen die eigene Tabelle 7-1 ({ "197.5" } ns). Für die Grenzen der Klassen A-D nach G.8273.2 gibt es keinen gedruckten durchgerechneten Wert, und die gedruckten Knickpunkt-Beschriftungen von ePRTC locked in G.8272.1 (auf durchgezogenen Konstruktionslinien) wurden durch die vorab festgelegte Auswahlregel ausgeschlossen, sodass diese Transkriptionen bleiben

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — offene und geschlossene Enden, die Lücke τ = { "400" } s in G.8271.1 Tabelle 7-3, Stetigkeit an jedem Knickpunkt, den die Tabellen implizieren; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-7af5107287ea = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Transkription der benannten Empfehlungen (am 2026-10-13 von itu.int heruntergeladen), jede Zeile gegen den Text neu gelesen, wobei die Stetigkeit an den Knickpunkten, die die gedruckten Koeffizienten implizieren, in den Tests begrenzt wird (zum Beispiel { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns gegen das Plateau von { "100" } ns in G.812 Tabelle { "4" }). Eine Normentranskription mit Prüfungen der internen Konsistenz, kein Konformitätstest und keine externe Validierung. G.812 (06/2004) ist als durch eine vorab veröffentlichte Ausgabe 08/2026 abgelöst aufgeführt, und G.811 hat ein Amd. { "1" } (04/2016); keines von beiden konnte gelesen werden, daher ist keines geprüft. Das Szenario mit freilaufendem OCXO überschätzt den Beitrag des Oszillators bei Beobachtungsintervallen, die gegen die Zeitkonstante einer Regelschleife lang sind; es sagt nichts über die Uhr irgendeines Geräts aus

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-53210f1b0709 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Vorab registriert in tests/fixtures/clock_log/PREREGISTRATION.md (allein festgeschrieben, 159334f2, bevor das Fixture existierte); festgehalten in RESULTS.md. Drei mit Seed erzeugte synthetische Logs, eines je Format (eine TICC-Lücke von drei Epochen, eine zu ignorierende zweite RINEX-Uhr), zurückgelesen von einem unabhängigen Leser, der aus docs/CLOCK-LOG-FORMATS.md vom selben Autor geschrieben wurde: Gitter-, Lücken- und Füllzahlen gleich und die größte Phasendifferenz { "0" } s (Zielwert { "1e-13" } s). allantools { "2024.6" } oadev, tdev und mtie auf dieser Phase stimmen innerhalb eines relativen { "2.5e-14" } (Zielwert { "1e-10" }) bei jedem Mittelungsfaktor überein, den es auswertet; es wertet MTIE nicht über die gesamte Aufzeichnung aus, die die Engine berichtet, sodass dieser eine Punkt je Log keinen Referenzwert hat und der Zielwert in der formulierten Form dort nicht erreicht wird. MODELLED: synthetische Logs, und die Leserreferenz teilt den Autor; echte TimeLab-, TICC- und RINEX-Uhrdateien von Instrumenten wurden nicht verglichen

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (clock kind [clock_log])

# text
seg-df411365b9ab = clock_log::tests (handgeschriebene Logs je Format: Köpfe, Trenner, Einheiten, Frequenzintegration, TICC-Kanäle und -Modi, Lücken und Richtlinien, Ablehnungen); tests/clock_log_allantools.rs (der vorab registrierte Vergleich: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-1517b58a40f3 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Für Kshana geschriebene Fixtures nach den öffentlichen Zeilenlayouts der Daemons, mit erfundenen Werten (NOTICE.md im Fixture-Ordner); es wurde kein Log einer realen Installation gelesen, und keine Referenz vergleicht das Parsen mit einem anderen Leser, sodass ein Layout, das sich zwischen Daemon-Versionen unterscheidet, weiterhin abgelehnt oder falsch gelesen werden kann. Die Schätzer, die von der Phasenreihe gespeist werden, sind die in den Zeilen oben gegen allantools validierten

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) auf den Fixtures in tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-d0e0353e588f = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Handrechnung an Aufzeichnungen, die aus Formeln gebaut sind, deren Steigung, Sprung, Extremum und Erholzeit vor dem Lauf bekannt sind (die Tests geben sie an), sowie die Masken, die Einhüllende und die Budgets der Telecom-Timing-Zeilen oben. Es wurde keine Labormessung eines realen Holdover bewertet und keine externe Referenz verglichen, daher macht die Art keine Aussage über irgendeine Uhr oder irgendein System; ein Zeitgebungslabor als Partner wird gebraucht, bevor irgendeine Zahl je Uhrenklasse hochgestuft werden könnte

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ab6aea7075d0 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Das ICG-Booklet zum Space Service Volume (UN OOSA ST/SPACE/75, { "2018" }), selbst eine Simulation, verglichen unter einer Vorregistrierung, die vor dem Lauf festgeschrieben wurde (xval/gnss-ssv/PREREGISTRATION.md; Ergebnisse in xval/gnss-ssv/RESULTS.md, festgelegt durch tests/ssv_booklet_results.rs, Verfehlungen eingeschlossen). Lauf { "1" } auf der vorab registrierten Lesart: Die Konstanten der minimalen Strahlungsleistung und der lunare Zielwert stimmen überein (S0, S6 met); die Zielwerte für oberes und unteres SSV, HF-Schwelle, GEO und HEO sind NOT MET, fast alle durch GLONASS, für das das Booklet { "20" } und { "28" } Grad in den Tabellen B2 und B6 und { "26" } und { "34" } Grad in Tabelle { "4.2" } angibt. Eine Diagnosevariante mit den Winkeln aus Tabelle { "4.2" } stimmt in jeder Zelle des oberen SSV, des unteren SSV und der sechs GEO-Missionen überein (sie ersetzt Lauf { "1" } nicht; HF-, HEO- und lunare Zellen verfehlen weiterhin). Die gemessenen Antennendiagramme des GPS-L1-Panels werden durch den parametrischen Ersatz nicht reproduziert (RMS { "6" } bis { "9" } dB gegen einen Zielwert von { "3" } dB). Übereinstimmung zeigt, dass die angegebene Methode des Booklets reproduziert wird, nicht dass sich GNSS-Signale so verhalten

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-1ba52ce8daa7 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Formen und veröffentlichte Größenordnungen in den Tests (Maximum einer Chapman-Schicht und die Beugung am Oberflächenlimb, einige TECU Plasmasphäre auf einem Strahl von GPS zu GEO); der Empfängerentwurf verwendet die Modelle für Akquisition und Tracking-Schleife und deren Tests wieder. Es werden keine gemessenen Daten zu Limb-Sondierung oder Empfang schwacher Signale damit verglichen

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-3fc3d17949eb = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Simulierte Wahrheit gegen die eigene Schätzung des Filters (der mittlere normierte quadrierte Schätzfehler eines konsistenten Filters beträgt für die Position etwa { "3" }) und Determinismus bei festem Seed. Es werden keine Flugdaten oder aufgezeichneten GNSS-Daten hoher Umlaufbahnen verglichen; Sonne und Mond sind kreisförmige Ersatzmodelle geringer Genauigkeit

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-49de2f2c1b32 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Dieselbe simulierte Wahrheit wie beim absoluten Filter: der Fehler des relativen Filters gegen den wahren Relativzustand und die Prüfung, dass er mindestens so gut abschneidet wie die Subtraktion zweier unabhängiger absoluter Fixes. Es werden keine Flugdaten zu Formationen verglichen

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-8abc8cdf5f0c = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Jede geschlossene Form gegen einen unabhängigen numerischen Weg in den Tests (Frequenzbereichsquadratur der exakten Übertragungsfunktion und des Verzögerungsfilters, eine Monte-Carlo-Rechnung über Atome für die Wellenfrontverzerrung, eine Monte-Carlo-Rechnung über Schüsse für den Fringe-Index) und ihre Grenzfälle. Ein veröffentlichter durchgerechneter Wert: Cheinet et al. { "2008" } (arXiv:physics/0510197, Abschn. IV) geben an, dass bei tau_R = { "20" } us ein weißes Raman-Phasenrauschen unter -111 dB rad^2/Hz für { "1" } mrad je Schuss nötig ist; der weiße Term allein ergibt { "0.99" } mrad (die Veröffentlichung leitet den Pegel mit ihrer Gl. { "17" } ab, Flicker plus weiß). Interne Konsistenz und ein durchgerechneter Wert, keine externe Validierung; Aberrationen höherer Ordnung und das Rauschen eines bestimmten Lasers werden nicht modelliert

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-81b9d7ec3df6 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Die vier benannten Microchip-Datenblätter (Dokumentnummern und URLs in jedem Preset und in docs/TELECOM-TIMING.md) für die Eingabezahlen; die Alterungsrampe in geschlossener Form und die Einhüllendeneigenschaft der Anpassung als interne Prüfungen. Wie aus den Zahlen ein Rauschmodell wird — die Anpassung, die Untergrenzenregel, der Monat mit 30 Tagen, die lineare Temperaturauslesung — ist eine Modellierungsentscheidung; kein Preset ist die Messung einer Einheit. { "0.30" } Runde { "2" }, einseitige Zielwerte gegen gemessene Einheiten (vorab festgelegt a01c491c), ein Befund (bleibt MODELLED): Die IGS-Station THU2 Symmetricom 8040C in den finalen ESA-MGEX-Uhren hat eine Allan-Abweichung von { "0.35" } bis { "0.87" } des Rubidium-Presets, aber einen Holdover-Fehler von { "1.07" } bis { "1.60" } davon; die Aufzeichnung des 5071A liegt bis { "1000" } s außerhalb des Cäsium-Presets (weißes Phasenrauschen der Messung, 30x bei { "1" } s) und im Holdover ({ "1.15" } bis { "8.74" }); der schlechteste SA.45s der Produktion von { "2011" } liegt bei 1.26x des CSAC-Presets bei { "1" } s; für den OX-208 gibt es keine gemessene Aufzeichnung (blockiert)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — die diskrete Alterungsrampe innerhalb von { "0.1" } % von (1/2)·D·t² über einen Tag; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-30e6d79a47c2 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Formen für jeden Term allein und die unabhängige Nullstellensuche holdover::holdover_seconds; die Datenblattzahlen sind die benannten Dokumente (docs/SLOT-TIMING.md). Ein Klassenstandard beruht auf einer angenommenen Untergrenze für rotes Rauschen, und eine Datenblattquelle ist eine Einhüllende von Maxima, sodass keines von beiden eine Messung irgendeiner Einheit ist

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } GPS-Block-IIF-Satellitenuhren, { "14" } Tage finaler IGS-Uhren: { "8" } innerhalb des Zielwerts von { "1.5" }, G25 und G30 optimistisch um bis zu etwa 2x, festgelegt); tests/slot_timing_ocxo_holdout.rs (ein gemessener OCXO: zurückgehaltene Vorhersage nie optimistisch, { "0.59" } bis { "0.70" } der gemessenen Verletzung; in der Stichprobe innerhalb von { "0.98" } bis { "1.17" }; ohne den Term der Fix-Frequenz ist die Vorhersage in der Stichprobe bei jeder Schwelle optimistisch); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — jede Klasse gegen holdover::holdover_seconds auf { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-4dedb9508666 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Rückführung auf das bestehende Schutzniveau der Zeitgebung und die geschlossenen Formen der Sichtbarkeit bei Kreisbahn und kugelförmiger Erde. Bedingt auf Erkennung, ein terrestrischer Spoofer mit einer angegebenen Rampenrate, ein Überflug über dem Kopf bei nicht rotierender Erde; nicht an einem gespooften Empfänger im Orbit validiert

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — exakt tpl::timing_protection_level_ns, wenn die Uhr keinen Flicker-, Weißphasen- oder Random-Run-Term hat; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
# c1: jamming
# c2: jamming
seg-d097f485ef9e = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Rückführung auf die Anti-Jam-Gleichung und das Link-Budget der bestehenden Art <c1/> (derselbe Code, mit denselben Eingaben aufgerufen) und die Rauschuntergrenze k T0 F in geschlossener Form. Die darunterliegenden Signalspektren sind die validierte Zeile oben; die Störerleistungen, der Zeitverlauf und die Bandbreiten des Frontends sind Szenarioeingaben, die Spektren sind kontinuierlich (keine Linien des Spreizcodes), und keine automatische Verstärkungsregelung, keine Austastung und kein Antennendiagramm wirkt auf den Störer. Im Repository liegt kein gemessenes gestörtes Spektrum, gegen das das Gesamtmodell geprüft werden könnte. Die Q-Tabelle der Art <c2/> (CW und Schmalband { "1" }, Breitband und gewobbelt { "2" } seit { "0.36" }: die Lehrbuchwerte, festgelegt auf die geschlossenen Formen von navsignal) stimmt mit dem CW-Wert dieses Modells überein und weicht von dem ab, was es für Rauschen angepasst an C/A ({ "1.5" }) und für flaches Null-zu-Null-Rauschen ohne Normierung im Band ({ "2.2" }) herleitet; der Bericht gibt beide aus

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S gleich jamming::j_over_s_db und effektives C/N0 gleich jamming::effective_cn0_dbhz mit Q = 1/(R_c kappa) auf { "1e-9" } dB, und der Anker von { "32.105" } dB des eigenen Tests der Art jamming; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-821d327efdbf = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Gegen JPL Horizons DE441 gemessen (dieselben festgeschriebenen Fixtures), aber nicht validiert: Die angegebenen Zahlen aus Tabelle { "1" } für Uranus und Neptun werden gegen heliozentrische Positionen aus DE441 um bis zu { "2.0" } bzw. { "5.2" } Mal überschritten (Neptun hält sie gegen baryzentrische Positionen ein, was nahelegt, dass die Anpassung nicht heliozentrisch war), die Seite gibt keinen Fehler für Pluto an, und für die Geschwindigkeiten existiert keine veröffentlichte Schranke. Die Tabellen 2a/2b halten ihre eigenen Zahlen für Uranus und Neptun ein und sind von der validierten Zeile abgedeckt

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: festgelegt bei { "2.04" } und { "5.16" } Mal dem nominalen Längenfehler, unter dem Sechsfachen; pluto_from_the_1992_row_is_measured_not_validated: innerhalb von { "39" } Bogensekunden und { "1.14e9" } m; standish_velocities_track_horizons_to_one_percent: schlechtester Wert { "3.7e-3" } der Geschwindigkeit); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-f17a412271b6 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Gegen Satellitenephemeriden von JPL Horizons (DE441, MAR099, JUP365, SAT441) gemessen, festgeschrieben in tests/fixtures/solar_system/horizons_satellites_icrf.csv mit Abfrage und Abrufdatum; für mittlere Elemente oder für die Platzierung nach dem Rotationsmodell existiert keine veröffentlichte Genauigkeit, sodass die festgelegten Zielwerte Regressionen erfassen und nicht validieren. Mittlere Elemente lassen die resonanten und solaren Störungen aus, und die säkulare Beschleunigung von Phobos wird nicht modelliert

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: schlechtester Winkelfehler vom Planeten aus gesehen über { "2000" } bis { "2040" }, Phobos { "5.65" } Grad, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymed { "0.22" }, Kallisto { "0.27" }, Titan { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } Grad); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-d3a6bc01842e = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Formen und Selbstkonsistenz: das dritte Keplersche Gesetz für die Relaisperiode, der über den Lauf gehaltene Bahnradius und Oberflächenradius, eine hinzugefügte Messung, die die formale Unsicherheit nie vergrößert, und die mit Seed erzeugten Fehler, die mit der Kovarianz übereinstimmen. Die Relaisbahnen ignorieren dritte Körper (die Anziehung des Jupiter auf Relais um Europa wird nicht modelliert), das Rauschen ist gaußsch auf angegebenen Pegeln und das Messmodell ist augenblicklich, daher ist dies nicht gegen Navigationsdaten irgendeiner Mission validiert

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: der quadratische Mittelwert jedes Fix-Fehlers über seinem eigenen formalen Sigma in [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-d57372871f5e = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz: der Brute-Force-Elevationsscan, die von Hand berechneten Reduktionen und die von orbit::dop sowie die Walker- und geosynchrone Geometrie in geschlossener Form. Zweikörperbahnen mit einem optionalen säkularen J2, ein kugelförmiger Körper mit der lokalen Vertikalen entlang des Radius, nur geometrische Sichtbarkeit (keine Signalleistung, kein Satellitenzustand, kein Gelände und keine Störung durch dritte Körper), und die Relativphase zwischen Systemen aus unterschiedlichen Bezugsepochen genommen, sodass es kein Schnappschuss irgendeines Datums ist. { "0.30" } Überprüfung, ein Befund (bleibt MODELLED): Die Presets halten die veröffentlichten einseitigen Untergrenzen der DOP-Verfügbarkeit (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) bei { "100" } % ein, aber mit verdoppeltem PDOP der Engine in einer Arbeitskopie halten sie sie weiterhin ein (schlechtester Punkt { "99.36" } %), sodass die Untergrenzen nicht einmal einen Fehler von { "100" } % in der Größe erkennen können, die diese Zeile berechnet; sie nach dem Lauf zu verschärfen wäre eine nachträgliche Toleranz. Eine Hochstufung braucht einen zweiseitigen Vergleich der DOP-Werte bei identischer Geometrie mit einer vorab festgelegten Toleranz. { "0.30" } Runde { "2" } (tests/coverage_dop_full_oracle.rs, vorab festgelegt add671d6), ein Befund (bleibt MODELLED): Orekit-{ "12.2" }-Positionen, Elevation, Azimut und Bodenspuren mit gnss_lib_py-{ "1.0.4" }-GDOP/PDOP/HDOP/VDOP (gemeinsame Uhr) und einer numpy-Inversen (eine Uhr je Konstellation) stimmen bei jedem Zielwert für die Entwürfe Galileo, GPS, BeiDou, Galileo+GPS (je eine Uhr) und einen Erdentwurf mit 1584 Satelliten überein (DOP innerhalb von { "2e-14" } relativ, identischer Fix, identische Verfügbarkeits- und Sichtbarkeitszahlen). Bei den Entwürfen für Mond und Mars stimmen die Elemente, Positionen, Sichtbarkeit und Spuren überein, aber DOP überschreitet den vorab festgelegten relativen Zielwert von { "1e-9" } in Zellen, deren größter PDOP { "1434" } oder mehr beträgt (bis zu { "8e-6" }), und { "4" } Zellen unterscheiden sich um eine Fix-Epoche bei numerisch singulärer Geometrie (Pivot der Engine { "1e-10" } gegen numpy-Rang), sodass die Zeile nicht validiert ist. { "0.30" } Revisionen: Die Bezugsuhr für TDOP/GDOP ist nun die Konstellation mit der niedrigsten Nummer in Sicht (constellation-multi-gnss-coverage globales GDOP-Maximum { "2.2236" } -> { "2.1205" }, Mittelwert { "1.122" } -> { "1.131" }), und die sichtbaren Zahlen je Konstellation werden als ganze Zahlen summiert

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — jede Karte und jeder Zähler gleicht einem Scan mit dem direkten Elevationstest; five_thousand_satellites_on_a_coarse_grid — { "5 000" } Satelliten, gibt die Laufzeit und die beibehaltenen Paartests aus; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (nur Regressionsprüfung); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (Regression)

# text
seg-41b300bb888a = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Kompositionsidentitäten gegen die eigenständigen Läufe derselben Arten: Eine Kampagne mit einer Phase reproduziert die eigenständige Ausgabe bitgleich, der weitergereichte Versatz gleicht dem letzten Abtastwert des vorherigen Laufs selbst, und die durch end_at beendete Phase hat genau die Erkennungszeit des Laufs als ihre Länge. Die additive Weitergabe über eine Phasengrenze und das Halteglied nullter Ordnung sind Modellierungsentscheidungen, und jede Phase ist so gut wie die Art, die sie ausgeführt hat; keine verkettete Mission wurde mit einer gemessenen verglichen

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — das Mitgliedsergebnis byte-identisch mit dem eigenständigen Lauf und jeder ausgerichtete Wert gleich der eigenständigen Reihe; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-fca7ec328ea6 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Die geschlossene Form des Phasen-Random-Walks unter weißem Frequenzrauschen, Varianz q_wf tau (NIST Technical Note { "1337" }), für die Statistikmaschinerie und Byte-Gleichheit mit den eigenständigen Läufen für das Seeding. Sie prüft die Ensemble-Arithmetik am eigenen Uhrenmodell der Engine, nicht an einem externen Datensatz

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } Seeds einer Uhr mit weißem Frequenzrauschen im Auslauf tau = { "3010" } s: der wahre Mittelwert { "0" } innerhalb des berichteten Intervalls, die halbe Intervallbreite innerhalb von { "25" } % von { "1.96" } sigma/sqrt(n), und die Stichprobenvarianz innerhalb des zweiseitigen Chi-Quadrat-Intervalls von { "99" } % für sigma = sqrt(q_wf tau) = { "16.459" } ns; Kalibrierungsensemble (CAP-10, vorab festgelegt ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): über { "200" } unabhängige Ensembles deckt das Intervall den wahren Mittelwert in { "192" } ab (innerhalb der { "99" }-%-Region [{ "181" }, { "197" }] von Binomial({ "200" }, { "0.95" })) und die Chi-Quadrat-Prüfung besteht in { "196" }, während die Perzentiltoleranz mit einem einzelnen Seed (p05 und p95 innerhalb von { "0.3" } Sigma) nur in { "183" } von { "200" } besteht, NOT MET gegen die vorab festgelegten { "190" }, eine Seed-empfindliche Prüfung, festgehalten statt gelockert; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-3dcca86d0869 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Kompositionsidentität gegen den eigenständigen Lauf. Die Arithmetik der geteilten Bedingungen ist Buchführung; die Physik ist die der Mitgliedsarten, jede mit ihrer eigenen Zeile

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — eine Komposition mit einem Mitglied liest die eigenständige Zahl und den Ergebnis-Digest)

# text
seg-ef402841914e = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Nur intern: die exakte Form -20 log10(range) der Link-Gleichung in geschlossener Form, ein unabhängiges Brute-Force-Gitter über dieselbe Art und die Rosenbrock-Funktion. Der 1-D-Zielwert der Runde { "1" } ist NOT MET (die vorab festgelegte Box schloss die Lösung bei { "3" } dB aus; der Optimierer hielt an der Schranke an), festgehalten in docs/design/evidence/cap32-optimize/RESULTS.md und nicht neu bewertet. Das Optimum ist lokal zur Box und zum Start; keine Aussage über ein globales Optimum

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (vorab festgelegt fbe6c8b3 und, nach einem Protokollfehler in Runde 1, 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — 1-D-Zielsuche innerhalb von { "6.1e-15" } von r* = r0 { "10" }^((m(r0) - { "3" })/20) in { "96" } Auswertungen; p3_prime_contour_target_grid_and_nelder_mead und p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — das beste Ergebnis der Gittermethode bitgleich mit einer unabhängigen Brute-Force-Schleife { "41" } x { "41" } über run_toml, Nelder-Mead mindestens so gut in { "177" } und { "161" } Auswertungen; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, das den festgehaltenen Fehlschlag aus Runde 1 festlegt); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } in { "234" } Auswertungen; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-c235cf7a1f0d = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Die validierten geschlossenen Formen der beiden Zeilen oben, die Quadratgesetz-Identität der Fehlalarme P_d(snr = { "0" }) = P_fa und die mittlere Akquisitionszeit nach Holmes sowie die Rückführung auf die eigene SSC-Kette der Spektrumart (derselbe Code von Jammer::ssc). Die Entwürfe selbst sind Eingaben: Als REPRESENTATIVE oder WORKSHOP markierte Presets sind keine veröffentlichten Spezifikationen, erweiterte Feher-QPSK-, Code-Shift-Keying- und OFDM-Spektren sind angenähert, und die Formprüfungen vergleichen Formen, keine kalibrierten Pegel.

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (jedes mitgelieferte systemunabhängige Szenario läuft ohne Workshop-Daten, die ionosphärischen Verhältnisse des Bandvergleichs gleichen (f_ref/f)^{ "2" } und seine Freiraumdifferenzen { "20" } log10(f/f_ref), der Jitter beim Referenz-C/N0 liegt zwischen seiner Gabor-Schranke und seiner Form für unbegrenztes Band, die E5-Formprüfungen des Szenarios mit Workshop-Parametern sind konsistent, wenn diese Datei vorhanden ist, und keine Quelldatei kompiliert diese Datei ein)

# text
seg-c83f81eb8726 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Rückführung auf die bestehende Spektrumkette und die Anti-Jam-Gleichung der Art jamming (ein Band mit einer Komponente ergibt dieselben Zahlen wie vor der Erweiterung) und die Signalspektren der validierten Zeilen. Die Störerleistungen, der Zeitverlauf, die Bandbreiten des Frontends und die entworfenen Signale sind Eingaben, und ein entworfenes Signal wird an seinem Sendeband abgeschnitten (keine Aussendung außerhalb des Bandes).

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (das Multiband-Wasserfalldiagramm läuft mit vier Panels, die Störer in UHF, L5-Band, S und C verweigern jeweils nur ihr eigenes Band, und ein Lauf mit einfachem Band bleibt durch die Erweiterung unverändert); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-cee2cbdad6d6 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Formen und Selbstkonsistenz: die Identitäten für Entfernungsrate und Entfernungsbeschleunigung gegen numerische Ableitungen, der Isoflux-Gewinn, der den Zuwachs der Entfernung aufhebt, die Lehrbuchgrenzen des Polarisationsverlusts, die qualitative Beobachtung LEO gegenüber GNSS (ein glockenförmiger Überflug von Minuten, der einige dB über den flachen GNSS-Trägern mit 44-51 dB-Hz gipfelt). Die EIRPs und Diagramme sind veröffentlichte Empfangsleistungen, in ein EIRP umgerechnet, oder repräsentative Annahmen, der gasförmige Term ist die abgelöste vereinfachte Methode nach P.676-10, und nichts wird mit einem gemessenen LEO-C/N0 verglichen

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: unter { "0.01" } Hz und { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-d9e965c108ea = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Transkription der zitierten öffentlichen Zahlen und eine Konsistenzprüfung: Ein aus einer veröffentlichten minimalen Empfangsleistung gesetztes EIRP sagt die veröffentlichte maximale innerhalb von { "0.5" } dB mit einem flachen Diagramm voraus. Das ist eine Prüfung der Streuung der Entfernung, keine Validierung der Antenne irgendeines Satelliten; repräsentative Presets erheben keinen Anspruch auf ein reales System

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: innerhalb von { "0.5" } dB von -139.1 und -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-cfa2e7e53eed = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz eines angegebenen Entwurfsmodells: Jede Leistung, jede Schwelle und jede Suchentscheidung ist eine Eingabe, und das Modell ignoriert Bitflanken-Mehrdeutigkeit, Fehlerkennung und Wiedererfassung. Nicht mit einem gemessenen Empfänger verglichen

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-d8b2e149d5cf = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz (die Sprungidentität und die Kegelschranke gegen Brute-Force-Stichproben). Die Schwelle ist eine Eingabe; keine veröffentlichte Kontinuitätsanforderung für LEO ist festgelegt

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (der Entfernungssprung jedes Wechsels gleicht der Änderung des Entfernungsfehlers, und eine korrigierte Anpassung von { "300" } s, alle { "150" } s aktualisiert, besteht eine Schwelle von { "5" } cm); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (die geschlossene Form begrenzt eine dichte Stichprobe des Kegels)

# text
seg-bae9c4665c45 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Hin-und-zurück-Identitäten und das Budget selbst. Das Format ist das eigene von Kshana, nach dem Vorbild der veröffentlichten Nachrichtenkomponenten und des Feldsatzes des Galileo-ICD; es ist nicht das Bitlayout von Celeste oder eines anderen Systems (keines ist öffentlich), sodass es kein externes Layout gibt, gegen das validiert werden könnte

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (jedes Modell nach dem Dekodieren innerhalb von { "2" } mm der exakten Nachricht, beim erneuten Kodieren bitidentisch, ein gekipptes Bit durch die CRC abgelehnt); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-2fe510f389d1 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Hin-und-zurück-Umrechnungen und die Kalenderarithmetik. RINEX { "4.02" } definiert keine LEO-Navigationsdatensätze (IGS RINEX { "4.02" }), daher ist das Layout eine dokumentierte Erweiterung, wobei arXiv { "2401.17767" } als Vorarbeit zitiert wird; es existiert kein externer Leser dafür, gegen den geprüft werden könnte

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (jedes Modell nach dem Textblock innerhalb von { "0.1" } mm, die CSV exakt)

# text
seg-9c1e46397382 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — ATOMIC-Modellfakten aus InsideGNSS (Polynom 6. Ordnung, etwa eine Minute Gültigkeit, Aktualisierung alle { "30" } s, Uhr gesteuert, { "24" } cm Uhrfehler). Das sind beschreibende Fakten ohne veröffentlichte Zahlen, gegen die verglichen werden könnte. Die Tabelle mit fünf Höhen gibt den SISRE von Liu et al. { "2025" } aus ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } und { "0.75" } cm bei { "320" }, { "475" }, { "786" }, { "966" } und { "1336" } km über einen 20-Minuten-Bogen) neben der Kshana-Anpassung an der eigenen integrierten Bahn ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } und { "0.51" } cm; Verhältnisse { "0.46" } bis { "0.77" }), nicht festgelegt, weil die Veröffentlichung reale präzise Bahnen angepasst hat und die Wahrheiten sich unterscheiden. Das 22-Parameter-Modell und die Anpassung selbst sind gegen reale Bahnen in der Zeile Liu et al. { "2025" } 22-parameter LEO ephemeris model and its fit on real precise orbits validiert. { "0.30" } Revision: Die Zahlen der Tabelle verschoben sich mit der Anpassung nach der Konvention der Veröffentlichung (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-3adf09cf2ed5 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz: rauschfreie Rückgewinnung, die kinematische Identität rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho numerisch differenziert, Doppler null bei größter Annäherung, die Spiegellösung eines einzelnen Überflugs und mit Seed erzeugte Fehler gegen die formale Kovarianz. Die Starlink-Zahl von Kozhaya, Saroufim und Kassas (NAVIGATION { "72" }({ "1" }), { "2025" }: etwa { "2" } m in { "20" } s mit drei Satelliten) ist nur ein Vergleich: Der modellierte Empfänger, mit einer perfekten Ephemeride und jedem Fehler in einem Doppler-Sigma von { "30" } Hz, ist über dasselbe Fenster um ein Mehrfaches ungenauer, und der Empfänger und die Messrate der Veröffentlichung werden nicht reproduziert

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: auf { "1" } mm und die Drift auf { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: der gewichtete Residuen-RMS in [{ "0.8" }, { "1.2" }] und der Fehler unter vier formalen Sigmas); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (ein vorab registrierter Proxy gegen die veröffentlichten Perzentile des Datensatzes 3 von "Unveiling Starlink for PNT", doi:10.33012/navi.685: mit { "3" } Satelliten (Maske { "47" } Grad), ohne Höhenstützung und { "30" } Hz beträgt der 3-D-Fehler p90 { "92.2" } m bei { "20" } s und { "870" } m bei { "8" } s gegen die veröffentlichten { "2" } m und { "10" } m, sodass beide Zielwerte vom Faktor zwei NOT MET sind, auf der hohen Seite, und als verfehlt bestätigt werden; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-54aea757feb2 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Ein von Hand hergeleitetes DOP mit vier Satelliten (ein Satellit im Zenit und drei am Horizont im Abstand von { "120" } Grad, deren Normalmatrix sich von Hand invertieren lässt), die strukturelle Identität, dass ein System mit eigener Uhr und einem Satelliten keine Geometrie hinzufügt, rauschfreie Rückgewinnung von Position, Uhr und Bias und mit Seed erzeugte Fehler gegen die Kovarianz. Nur interne Prüfungen; nicht mit der Ausgabe eines Empfängers verglichen. { "0.30" } externer Vergleich, ein Befund (bleibt MODELLED): an einem Multi-GNSS-IGS-Tag (ABMF 2018-05-13, GPS und Galileo C1C, Broadcast-Ephemeride, Klobuchar) stimmt der Intersystem-Bias mit RTKLIB v2.4.2-p13 rnx2rtkp überein (mittlere Differenz -0.11 ns nach der Korrektur der Broadcast-Gruppenlaufzeit { "0.30" }, -0.35 ns davor; Zielwert { "1" } ns), aber nur { "93.6" } % von { "280" } Epochen ({ "93.2" } % vor der Korrektur) liegen innerhalb von { "3" } m der ITRF2020-Koordinate gegen die vorab festgelegten { "95" } %. RTKLIB selbst erreicht { "88.2" } % mit denselben Daten, sodass der Zielwert jenseits der Einfrequenz-Broadcast-Positionierung an dieser Station und diesem Tag liegt und keine Abweichung des Lösers ist; der Vergleichstest ist ignoriert festgeschrieben. { "0.30" } Runde { "2" }, strengere Eingaben beim unveränderten Zielwert von { "3" } m / { "95" } % / { "1" } ns, ein Befund (bleibt MODELLED): Mit dem ionosphärenfreien Galileo-Paar E1/E5a (vorab festgelegt { "6927e039" }) liegen { "79.9" } % der Epochen innerhalb von { "3" } m (RTKLIB { "67.9" } %); mit präzisen CODE-MGEX-Bahnen, -Uhren, Satellitenantennenversätzen und Code-Biases (vorab festgelegt 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %), und der Intersystem-Bias weicht von RTKLIB um -1.03 ns ab, weil der Einzelmodus von RTKLIB Satellitenantennenversätze ignoriert (+{ "0.04" } ns, wenn beide sie auslassen)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) auf { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } Seeds, über den Lauf gemittelter NEES-Mittelwert in [{ "2.4" }, { "3.6" }] und mindestens { "75" } % der Epochen innerhalb des zweiseitigen Chi-Quadrat-Bandes von { "95" } %; gemessen mit { "150" } Seeds, Mittelwert { "2.84" } nur GNSS und { "2.87" } mit LEO; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-91df984eb133 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz: der veröffentlichte Ausdruck für den Versatz von Hand ausgewertet, der normierte Fehler über { "40" } Seeds und die durch die Unsicherheit des Versatzes gesetzte Untergrenze. Die NIST-Zahl für Iridium-Zeitgebungsempfänger mit einer Miniatur-Atomuhr (unter { "40" } ns von UTC(NIST) über { "40" } Tage) ist nur ein Vergleich; das mitgelieferte Iridium-Szenario ergibt { "10" } bis { "11" } ns RMS bei nomineller Leistung mit seinem repräsentativen Entfernungsfehler von { "5" } m. Flicker-Frequenzrauschen und ionosphärische Verzögerung werden nicht simuliert

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-7472a819bf01 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Transkription der zitierten öffentlichen Werte, auf Struktur geprüft (jede öffentliche Quelle hat eine URL, Walker-Muster teilen sich gleichmäßig, das C/N0 aus der Empfangsleistung über kT bei { "290" } K), nicht gegen eine externe Referenz. Repräsentative Werte sind in jedem Preset benannt und illustrativ

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: Quelltext-Scans von src, scenarios und tests); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-2e45cedea59a = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Selbstkonsistenz der Übergaben: Jeder weitergereichte Wert gleicht der eigenen Ausgabe der vorgelagerten Stufe, und das Verändern einer vorgelagerten Eingabe bewegt jede nachgelagerte Zahl, die von ihr abhängt. Die Stufen behalten ihre eigenen Kennzeichnungen; die Kette fügt keine Physik und keine externe Referenz hinzu

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: ein stärkeres EIRP, ein längeres Anpassungsintervall und ein größerer Term der Bahnbestimmung bewegen jeweils den weitergereichten Wert und den fusionierten Fix; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-7d9265f54059 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Formen und Identitäten, keine externe Messung: der Gradient der Entfernungsrate gegen eine zentrale Differenz, die Statistik in Informationsform gegen die dichte Kovarianzform, eine reine Uhrendrift, die null ergibt, ein durch das Prior erklärter Schub, der höchstens |dx|^2/sigma_p^{ "2" } ergibt, die in einem Sprung quadratische Statistik. Keine Erkennungszahl wird mit einem gemessenen Angriff verglichen; der Spoofer ist idealisiert (keine Signatur aus Leistung, Einfallswinkel oder Korrelationsspitze)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-38269e21c514 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Identitäten: Der Einsatzsprung eines ionosphärenfreien Spoofers gleicht der modellierten Differenz der ionosphärischen Verzögerung des Paars, die Schwelle ist das zweiseitige Normalquantil mal der Standardabweichung des Sprungs plus die Ratenschranke. Das ionosphärische Modell des Empfängers ist das der Engine, sodass das authentische Residuum konstruktionsbedingt im Mittel null ist; keine externe Referenz

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-3deb19ed1dc7 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Die Dispersionsidentität erster Ordnung, konstruktionsbedingt exakt gegen die eigene Verzögerung erster Ordnung der Engine (deren Skalierung 1/f^{ "2" } in ihrer eigenen Zeile gegen IS-GPS-200 VALIDATED ist); die Präzision ist nur thermisches Coderauschen, ohne Mehrwegeausbreitung oder Interfrequenz-Biases. { "0.30" } Runde { "2" }, gemessen (vorab festgelegt 5e795f93), ein Befund (bleibt MODELLED): Die globale Ionosphärenkarte CODG1330.18I von CODE gegen ABMF-C1C/C2W-Code mit den CODE-Biases ergibt { "33" } von { "36" } Bogenmittelwerten innerhalb von { "3" } TECU (schlechtester Wert +{ "6.84" } TECU an einem Abendbogen; RMS je Epoche { "3.95" } TECU), gegen einen Zielwert von jedem Bogen; nicht validiert

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: gleicht dem schrägen TEC des Überflugs im Scheitelpunkt auf { "1e-9" }, und sein Sigma gleicht dem RSS des Coderauschens über { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-6c6a0c044754 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Implementierung gegen Spezifikation, KEINE externe Referenz: Eine Clean-Room-Neuimplementierung in Python (scripts/maritime_score_cleanroom.py), geschrieben von einem Leser, dem nur docs/RECEIVER-TRUST.md und docs/MARITIME-TRUST.md und nicht der Rust-Quelltext gegeben wurden, stimmt mit score_from_ratios auf { "600" } Verhältnisvektoren überein (Wert, Band, Punkte und die Reihenfolge der Abzüge, Differenz { "0" }), nachdem die Dokumentation dort vervollständigt wurde, wo der erste Leser sie als schweigend oder inkonsistent fand (Reihenfolge bei Gleichstand, Rundung, das Verhältnis eines Monitors mit Bestehen oder Nichtbestehen, zwei Beispiele, deren Zahlen nicht zur Formel passten). Das zeigt, dass die Dokumentation ausreicht und der Code tut, was sie sagt. WAS NICHT GEPRÜFT WIRD, und warum die Zeile MODELLED bleibt: Die Regel selbst (die Gewichte, die Rampe, die Bandgrenzen, das Halten des Nachweises) ist die eigene dieses Projekts, vorab registriert, aber ohne externe Quelle, und nichts hier zeigt, dass ein Wert von { "80" } oder { "40" } bei realer Störung bedeutet, was ein Navigator sich darunter wünschen würde; eine Zahl dieser Art wird nicht angegeben. Die Schwellen der Monitore sind ebenso die eigenen dieses Projekts (Zeile A prüft nur ihre Arithmetik).

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monoton in jeder Statistik, ein hinzugefügter Monitor hebt den Wert nie an, gesunde Statistiken bleiben bei { "100" })

# text
seg-26753cc49103 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — WAS GEPRÜFT WIRD: die eigenen Tests dieses Crates mit exakten Zeichenketten für die dokumentierte Feldzuordnung von LEEF und die Envelope-Felder von RFC { "5424" }; es existiert kein gepflegter quelloffener LEEF-Parser (eine Suche im Python-Paketindex fand keinen), sodass das Format gegen seine eigene Spezifikation geprüft wird, vom selben Autor gelesen, nicht gegen eine externe Referenz. WAS NICHT: ob die LEEF-Nutzdaten vom Parser oder SIEM irgendeines Herstellers akzeptiert werden; die Escaping-Regeln über die dokumentierten hinaus; das Verhalten eines echten Syslog-Collectors.

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (exakte LEEF-Zeichenketten, Escaping, Schweregrad, Envelope von RFC { "5424" }, Zustelltimeouts und Wiederverbindung); tests/telemetry_cli.rs

# text
seg-3b7d744f5fd2 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Die veröffentlichten Ereignislogs des Datensatzes (attack_log-Fenster) als Ereigniswahrheit, unter der Vorregistrierung xval/jammertest-trust/PREREGISTRATION.md (allein festgeschrieben, 0fa012b, bevor die Harness lief). Erster und einziger Lauf (xval/jammertest-trust/RESULTS.md): { "14" } von { "24" } Ordnern auswertbar ({ "7" } mit Jamming), { "3,502" } saubere und { "9,560" } Jamming-Epochen. Zurückgehaltene Fehlalarmwahrscheinlichkeit bei sauberen Daten: cn0_drop_db { "0.0231" } (81/3502) gegen einen Zielwert von { "0.02" }, FAIL; agc_k_sigma { "0.0003" }, bestanden; jam_ind_threshold { "0.0094" }, bestanden; Vereinigung der drei: Fehlalarme { "0.0328" }, Erkennung { "0.807" } gegen { "0.05" } und { "0.50" }, bestanden. Nach der registrierten Regel ist die Zeile MODELLED (ein Zielwert verfehlt). Eng: ein Empfängertyp (u-blox ZED-F9P), ein Ereignis, geplante Ein-Minuten-Slots als Wahrheit (Erkennung eine Untergrenze; sauber bedeutet außerhalb der protokollierten Fenster); kalibriert an den CSV-Logs, und der UBX-Leser liefert in zwei Ordnern mehr Fehlalarme. Die Bänder des Maritime-Vertrauenswerts sind nicht kalibriert

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoriert, datengesteuert durch KSHANA_JAMMERTEST_DIR: die festgehaltene Auswahl, zurückgehaltene Zählungen, Zielwert-Urteile und Urteil); receiver_trust::calibration::tests (Zeitstempel, Fensterpaarung und die Zeitzonenverschiebung, Labels, Schutzbänder, Ausschluss, Auswahl); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-b0810b04ec30 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Die Slot-Zahlen des Plans je Testbereich ({ "76" }, { "77" } und { "45" } Slots, von denen { "61" }, { "63" } und { "32" } senden) wurden unabhängig mit einem Skript über dasselbe JSON gezählt; die attack_log-Fenster des Datensatzes von { "2024" } als Ereigniswahrheit, unter xval/jammertest-score/PREREGISTRATION.md (allein festgeschrieben, c2e6d3b, bevor der Scorer lief). Erster und einziger Lauf (xval/jammertest-score/RESULTS.md): Die registrierte Regel für die Mindestdatenmenge FAILED ({ "4" } bewertbare Jamming-Fenster aus { "4" } von { "12" } UBX-Ordnern gegen ein Minimum von { "10" } Fenstern aus { "2" } Ordnern: { "5" } Ordner durch die Basislinienregel ausgeschieden, { "3" } UBX-Logs tragen nur die GPS-Wochenzeit), sodass die Zielwerte B1 bis B4 nicht bewertbar sind; nichts wurde gelockert oder neu ausgeführt. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, allein festgeschrieben, nur Datenbehandlung: Logs mit nur GPS-Zeit anhand des Datums eingeordnet, die { "12" } Ordner nur mit CSV, eine Sitzung mit bewegter Plattform für bewegte Rover; gleiche Zielwerte und Regel für die Mindestdatenmenge): { "14" } von { "24" } Ordnern behalten, aber { "7" } bewertbare Jamming-Fenster, Regel für die Mindestdatenmenge erneut verfehlt, kein Zielwert bewertbar (RESULTS-v2.md). Geplante Wahrheit: Ein geplanter Slot ist keine Aufzeichnung der Aussendung, ein Fehlschlag kann ein Test sein, der nie lief, eine Latenz wird vom geplanten Beginn gerechnet, und sauber bedeutet außerhalb der geplanten Slots. Erkennung durch Monitore im Messbereich sagt nichts über einen Spoofer mit geringer Leistung. Ein Empfängertyp (u-blox ZED-F9P). Der SimulaMet-NMEA-Datensatz von { "2025" } wird nicht verwendet (keine angegebene Lizenz, hinter Anmeldung)

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (datengesteuert durch KSHANA_JAMMERTEST_PLAN_DIR: Slot-Zahlen je Testbereich des Plans von { "2025" }, Katalog-IDs, TOML-Hin-und-zurück); tests/jammertest_score.rs (ein synthetisches Log mit einem bekannten Abfall: erkannt, verfehlt, nicht auswertbar, Lauf mit Fehlalarm, signiertes Paket mit der Scorecard); jammertest::plan::tests; tests/jammertest_score_2024.rs (datengesteuert durch KSHANA_JAMMERTEST_DIR: der festgehaltene Lauf)

# text
seg-c70f3f97d479 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Verweise, geprüft gegen einen per Skript extrahierten Überschriftenindex der zitierten öffentlichen Dokumente, gelesen am 2026-10-10 (tests/compliance_references.rs). WAS GEPRÜFT WIRD: { "49" } zitierte Verweise auf Klauseln, Abschnitte, Absätze oder Überschriften existieren im zitierten Dokument, und { "7" } zitierte URLs lösten am festgehaltenen Datum auf ({ "2" } über einen zweiten Weg); Negativkontrollen scheitern. WAS NICHT: dass irgendeine Paraphrase, Zuordnung oder Lücke richtig ist; Klauseln von EN { "16803" } (kostenpflichtig, nur Katalogtext); spätere Revisionen; der Index ist keine unabhängige Implementierung.

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-ce743c3eca62 = IntegrationRun

# text
seg-1729005fdd5c = gegen eine echte Host-Anwendung ausgeführt; ein Integrationslauf ist keine unabhängige Referenz — WAS GEPRÜFT WIRD, eng gefasst: dass diese Integrationen mit der echten Software funktionieren, für die sie geschrieben sind. Der NACHWEIS ist festgeschrieben in integrations/signalk/evidence/README.md (mit seinen JSON-Dateien) und integrations/opencpn/evidence/README.md (mit seinen Screenshots und Logs), jeweils mit dem Skript, das ihn reproduziert. ({ "1" }) Signal K: das Plugin, geladen in das festgelegte npm-Paket signalk-server { "2.33.0" }, in einem privaten Netzwerk-Namespace nur mit Loopback, gespeist mit synthetischen Daten. Die eigenen REST- und WebSocket-Schnittstellen des Servers zeigten die veröffentlichten Pfade, die Metadaten des Wertes und eine Benachrichtigung, die über absent, warn, alarm, normal (nach dem Halten) und erneut warn ging, als die Daten ausblieben. Mit dem echten kshana-Lauf durch das Plugin auf den NMEA-Daten, die der Server selbst empfing, ging die Benachrichtigung auf warn und dann auf alarm, und die berichtete Position wurde veröffentlicht; die eigene navigation.position des Servers wurde von seinem NMEA-Provider geschrieben, nie vom Plugin. Erneut gegen das aktuelle JSON-Schema { "1.2" } ausgeführt. ({ "2" }) OpenCPN: das Plugin, gebaut gegen den Header der OpenCPN-Plugin-API und wxWidgets { "3.2.4" }, geladen in das Ubuntu-{ "24.04" }-Paket von OpenCPN { "5.8.4" } unter einem virtuellen Display; OpenCPN lud es, führte seine Initialisierung aus und übergab ihm die PKSHT-Sätze des gefilterten Stroms, und das Panel wurde auf dem nicht vertrauenswürdigen Band rot. In einem sauberen Lauf hörte die eigene Schiffsposition von OpenCPN auf, sich zu aktualisieren, und seine Fix-Anzeige fiel ab, als das Gate den Fix als ungültig markierte. Ein zweiter Lauf, direkt vom TCP-Listener des Gates gespeist, zeigte die Zustellung an das Plugin, aber kein sauberes Vorher-Nachher. ({ "3" }) Die Relay-Tests spielen einen aufgezeichneten Ausschnitt des gefilterten Stroms über einen echten TCP-Socket ab und prüfen, was ein Verbraucher empfängt (die Bytes unverändert, gültige Prüfsummen bei jedem Satz einschließlich der umgeschriebenen, GGA und RMC in Übereinstimmung, ein PKSHT je Zyklus mit dem Gate-Feld, wo der Fix ungültig ist), und das End-to-End-Skript prüft, dass ein Verbraucher des Listeners des Gates genau die Bytes empfängt, die dasselbe Gate auf die Standardausgabe schreibt. ({ "4" }) Die PKSHT-Parser (JavaScript und C++) laufen über aus kshana-Ausgaben aufgezeichnete Sätze und lehnen eine falsche Prüfsumme, Version oder einen Wert außerhalb von { "0" } bis { "100" } ab. ({ "5" }) Die systemd-Units werden mit systemd-analyze verify (systemd { "255" }, Binärdateien als Stubs) und mit Sicherungen für eine Shell in ExecStart, die Neustartrichtlinie und die Sandbox-Schlüssel geprüft; die Argumentbehandlung des Container-Entrypoints wird mit einer Stub-Binärdatei geprüft. WAS NICHT: Es gibt keine externe Referenz für irgendeinen Wert, den diese Integrationen zeigen. Die Vertrauenswerte selbst sind die Zeilen oben, und ein Integrationslauf zeigt nur, dass die Verkabelung sie weiterträgt; deshalb ist diese Zeile MODELLED und nicht VALIDATED (docs/VALIDATION.md). Es wurden kein reales Schiff, kein realer Empfänger, kein langer Lauf, keine andere Version eines der beiden Hosts, kein anderes Betriebssystem und kein anderer Desktop verwendet; alle Daten sind synthetischer Text, und nichts hier ist eine Messung. Die Behandlung der Benachrichtigung in Ton und Darstellung durch einen echten Signal-K-Client, die Symbolleistenschaltfläche von OpenCPN, die Einstellungen und der veraltete Zustand sowie die Paketierung für den Plugin-Manager von OpenCPN wurden nicht geprüft. Die systemd-Sandbox-Schlüssel wurden nur auf Syntax geprüft, nicht unter einem laufenden systemd ausgeführt, und für den Bau des Container-Images und seine Gesundheitsprüfung liegt hier kein festgeschriebener Nachweis vor. Es wird keine Erkennungs- oder Fehlalarmzahl behauptet. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
seg-5614947f4e8e = receiver_trust (live: das Gate, sein TCP-Listener, PKSHT); außerhalb des Crates: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-Relay, natives C++-Plugin), deploy/reference-build (systemd-Units, Container)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (das Gate und sein TCP-Listener, Rust-Seite); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js und integrations/signalk/test/plugin.test.js ({ "24" } Node-Tests auf aufgezeichneter synthetischer Ausgabe); integrations/opencpn/test/relay.test.mjs ({ "5" } Node-Tests); integrations/opencpn/test/e2e-live.mjs (die echte Binärdatei an einen TCP-Verbraucher, von Hand und in CI ausgeführt); integrations/opencpn/plugin/test/pksht_test.cpp und integrations/opencpn/plugin/test/trust_state_test.cpp (C++-Prüfungen des PKSHT-Parsers und des Panel-Zustands); deploy/reference-build/check-units.sh und deploy/reference-build/test-entrypoint.sh

# text
seg-efccd283c368 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz gegen eingespeiste Wahrheit und geschlossene Formen, unter Zielwerten, die bei 6b68f6cc vorab festgelegt wurden (docs/design/evidence/boc-bump-jump/). Ein BeiDou-B1C-Datensignal (PRN { "19" }, { "5" } MS/s), erzeugt durch iq::scene: Bei ausgeschalteter Option bleibt ein Start auf der Nebenspitze am vorhergesagten Chip bei ±({ "0.5" } + d/4) falsch eingerastet (gemessen ±{ "0.549" }); bei eingeschalteter Option ein Sprung zur Hauptspitze bei { "0.08" } s und ein RMS im späten Fenster von { "0.0008" } Chip bei { "45" } dB-Hz und { "0.0048" } Chip bei { "35" } dB-Hz; kein Sprung von der Hauptspitze bei { "35" }, { "40" } und { "45" } dB-Hz über { "4" } s; die skalierte Steigung des EMLP { "0.94" } bis { "0.99" } auf dem abgetasteten Signal (unskaliert { "3.6" } bis { "3.8" }). Der Bump-Jump-Detektor allein, auf Korrelatortripeln mit der exakten Rauschkovarianz von BOC({ "1,1" }), machte in { "100 000" } Aktualisierungen bei { "25" } bis { "45" } dB-Hz keinen falschen Sprung und erkannte { "1000" } von { "1000" } Starts auf der Nebenspitze bei { "35" } dB-Hz. NOT MET (Befund F1): Das vorab festgelegte Gitter der Unit-Tests für die Skalierung enthält Versätze außerhalb des linearen Bereichs der Diskriminatoren, wo die skalierten Messwerte den Versatz um bis zu { "48" } % verfehlen. WAS NICHT GEPRÜFT WIRD: IQ aus dem Feld, bandbegrenzte Frontends, zusammengesetzte MBOC/QMBOC-Replikate und jeder externe Empfänger.

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (die Bump-Jump-Abgriffe und Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); Unit-Tests von iq::track::boc (b4_unit_grid_misses_are_the_recorded_ones: der vorab festgelegte Zielwert des Unit-Tests B4 bleibt wie geschrieben, seine festgehaltenen Verfehlungen werden als Befund F1 bestätigt)

# text
seg-d2d08312c05d = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Gemessene Daten unter Zielwerten, die bei b6ccb499 vorab festgelegt wurden (xval/scint-malindi/): Zenodo-Eintrag { "16941224" } (INGV, Malindi, { "18" }. März { "2023" }, GPS PRN { "26" }, { "50" } Hz Intensität und Trägerphase, CC BY { "4.0" }, SHA-256 geprüft). { "22" } qualifizierende Fenster von { "60" } s (N1 met). MET: die Intensitätsverteilung (Kolmogorov-Smirnov D { "0.0415" }, Zielwert { "0.05" }) und die an S4 gebundene Phasenszintillation (Median gemessen/Modell sigma-phi { "0.779" }, Zielwert 2/3 bis 3/2). NOT MET (Befund F1): Der Anteil tiefer Fades des Modells ist das { "2.38" }-Fache des gemessenen (Zielwert { "0.5" } bis { "2" }) und sein mittlerer Fade { "3.51" }-mal so lang (Zielwert 2/3 bis 3/2). Befund F2: Die registrierte Verarbeitung liest die umbrochene Phase des Modells, was eine Selbstprüfung aufdeckte; B3 nachträglich mit entfalteter Phase wiederholt ergibt { "0.804" }. WAS NICHT GEPRÜFT WIRD: andere Nächte, Stationen, Breitengrade oder Signale; Empfängerrauschen im Modell. Die Zeile bleibt MODELLED.

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, das registrierte Urteil als festgehalten bestätigt, Befund F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, nur berichtet; datengesteuert, abgerufen durch scripts/fetch_scint_malindi.sh); Unit-Tests von realdata::scint50 (model_data_through_the_harness_shows_the_wrapped_phase_finding, Befund F2)

# text
seg-16578e7dd2fe = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Geschlossene Form, unter Zielwerten, die bei 3724aefa vorab festgelegt wurden (docs/design/evidence/acq-cfar/). Die Fehlalarmwahrscheinlichkeit von CA-CFAR für Gamma(M)-Zellen, gegen Monte-Carlo des exakten Modells: { "18" } von { "18" } Fällen innerhalb von { "3" } binomialen Sigma. In jeder Zelle der Suchen von iq::acq (GPS L1 C/A, { "2.5" } MS/s, je { "210 000" } Zellen) bei einem Entwurf von { "1" } %: { "0.977" } % und { "0.969" } % bei gaußschem Rauschen und { "1.006" } % und { "0.999" } % bei 2-Bit-quantisiertem Rauschen (M = { "1" } und { "4" }; Zielwert plus/minus { "20" } %); Entscheidungen unverändert, wenn die Eingabe skaliert wird. NOT MET (Befund F1): Bei einem rauschfreien 2-Bit-Signal sind die Detektion und ihre Zelle richtig, aber { "1.28" } % der Zellen außerhalb der Spitze in der Zeile der Spitze (Zielwert { "1" } %) überschreiten die Schwelle, bei den deterministischen Korrelationsnebenkeulen des Codes. WAS NICHT GEPRÜFT WIRD: andere CFAR-Varianten, zweidimensionale Fenster, bandbegrenzte Frontends, Felddaten.

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, das registrierte Urteil als festgehalten bestätigt, Befund F1, festgelegt durch finding_noise_free_sidelobes_exceed_the_cfar_rate); Unit-Test von iq::acq ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-7bd7522eabed = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Veröffentlichte Schnittstellenkontrolldokumente und geschlossene Formen, unter Zielwerten, die bei 5806f28b vorab festgelegt wurden (docs/design/evidence/spectrum-bands/): GLONASS ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } und B3I { "1.0" }, Galileo OS SIS ICD Issue { "2.1" }. MET: jeder Träger, jede Chiprate und jede Empfangsleistung wie transkribiert ({ "28" } GLONASS-Kanäle), BPSK-erste Nullstellen bei der Chiprate, das B1C-Komposit gleich MBOC(6,1,1/11), wie es die Leistungstabelle seines ICD angibt, die Identität des C/N0-Pfads und byteidentische Spektrumszenarien. NOT MET: der Zielwert der Einheitsfläche, der wie geschrieben unerreichbar war (Befund F1; die Flächen gleichen dem Anteil im Band in geschlossener Form), und die Übereinstimmung je Bin der B1I- und B1C-Wellenformen der IQ-Schicht mit der Modellhüllkurve ({ "1.26" } und { "1.56" } dB gegen { "0.5" } dB, Befund F2; GLONASS { "0.07" } dB), weil Gold- und Weil-Codes ungleichmäßige Linienspektren haben; bandgemittelt stimmen die Hauptkeulen innerhalb von { "0.25" } dB überein. WAS NICHT GEPRÜFT WIRD: aufgezeichnete IQ-Daten, andere Signale, Störung innerhalb eines Systems.

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, Befund F1, festgelegt durch finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, Befund F2, festgelegt durch finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, nur berichtet)

# text
seg-07554505b56b = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — LSIS-AFS V1.0 (wie oben): die Legendre-Folge der Länge 1499 (Tabelle E-1, identisch) und die ersten und letzten { "24" } Chips der tertiären Codes (Tabellen E-2 bis E-6: { "419" } von { "420" } Spalten identisch; das Dokument druckt dieselben letzten { "24" } Chips, A14850, für PRN { "147" } und PRN { "151" }, und der Generator reproduziert die von PRN { "151" }, sodass der Eintrag für PRN { "147" } höchstwahrscheinlich ein Druckfehler ist; der Zielwert von { "420" } von { "420" } ist NOT MET und die Verfehlung ist festgelegt); das durchgerechnete Beispiel in Abbildung { "8" } des Codes SB1 (ein Beispiel: 0x045 kodiert zu 0x229F61DBB84A0); CRC-24Q gegen den Katalogprüfwert 0xCDE703 für ASCII { "123456789" }; die eigene Rahmenarithmetik des Dokuments. Zielwerte vorab festgelegt bei b3ba5d5. Eine Verfehlung in den Akten und ein durchgerechnetes Beispiel für die Nachrichtenschicht, sodass die Zeile MODELLED bleibt. WAS NICHT GEPRÜFT WIRD: LDPC und die CRC-Wörter in den Unterrahmen { "2" } bis { "4" }, Nachrichteninhalt und jeder aufgezeichnete Strom

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
seg-e9bde2e0a342 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, das Ubuntu-{ "24.04" }-Paket, als separates Programm ausgeführt; nur abgeleitete Zahlen festgeschrieben) verfolgt dieselben numpy-Aufzeichnungen (unabhängig von der Engine), beide gemessen gegen die analytische Wahrheit. Zielwerte vorab festgelegt bei 48edd4a5, geändert vor jeder Testaufzeichnung bei 1e4288c4 (ein FLL mit { "10" } Hz nur während des Einzugs in beiden Empfängern, nachdem die registrierte Kalibrierung an einer falschen Übergabe von GNSS-SDR scheiterte, Befund F3). MET bei { "30" }, { "35" }, { "40" } und { "45" } dB-Hz: Trägerjitter innerhalb von { "4.3" } %, Codejitter innerhalb von { "4.6" } % und Doppler-Mittelwert und -Streuung von denen von GNSS-SDR. NOT MET: Das NWPR-C/N0 der Engine liest { "2.3" } bis { "7.1" } dB unter dem SNV von GNSS-SDR (Befund F4, die bekannte Grenze von NWPR; sein M2M4 liegt innerhalb von { "0.06" } dB der Wahrheit); die Phasenlock-Indikatoren unterscheiden sich per Definition (F5); bei { "30" } dB-Hz glitt GNSS-SDR zweimal ab und die Engine nicht (F6). Die eigene Übergabe von GNSS-SDR rastete in { "3" } von { "30" } Kalibrierungsläufen auf einer falschen Frequenz ein. WAS NICHT GEPRÜFT WIRD: andere Signale, Entfernen der Datenbits, Wiedererfassung, Feldaufzeichnungen. Die Zeile bleibt MODELLED.

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), auf Zahlen, die von tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py abgeleitet wurden

# text
seg-5d76e6627df0 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Eine unabhängige numpy-Neuberechnung (xval/crpa-jamming/oracle.py, kein gemeinsamer Code: numpy-Steuervektoren, numpy.linalg.solve und inv) jedes Glieds der Geometrie der Jamming-Demo mit einem quadratischen Array aus 4 Elementen, unter beiden Gewichtungen. Zielwerte vorab festgelegt bei 08d83b4d. MET: A1 (alle { "150" } Szenarioergebnisse byteidentisch ohne den Abschnitt, nach einer Korrektur: Der erste Bau fügte die crpa-Einheiten der Einheitentabelle jedes Jamming-Laufs hinzu), A2 (ein Element gleicht keinem Array auf { "1e-12" } dB), A3 für den Rauschgewinn des Arrays und das effektive C/N0 ({ "912" } Link-Gewichtungen innerhalb von { "1e-9" } dB, schlechtester Wert { "2.1e-14" } dB) und für die Null des Störers bei Nullsteuerung (unter -200 dB auf beiden Seiten), A4 (MVDR innerhalb von { "0.1" } dB der Nullsteuerung bei einem JNR von { "80" } dB). NOT MET: A3 am Störergewinn von MVDR, { "194" } von { "456" } Links über { "1e-9" } dB bei portabler Mathematik { "0.36" } ({ "202" } bei Host-Mathematik; docs/revisions/STUDIO15-batch4-rebaseline.md) (schlechtester Wert { "1.7e-6" } dB) bei Residuen von -100 bis -188 dB, wo float64-Auslöschung beide Implementierungen begrenzt (inv und solve von numpy weichen auf { "169" } Links voneinander ab, schlechtester Wert { "7.9e-7" } dB); das effektive C/N0, das davon gespeist wird, bleibt unberührt. WAS NICHT GEPRÜFT WIRD: gegenseitige Kopplung, Elementfehlanpassung, Breitbandverarbeitung, mehrere Störer, jede Antennenhardware. Eine Neuberechnung derselben Gleichungen, keine externe Referenz; die Zeile bleibt MODELLED.

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), gegen xval/crpa-jamming/expected.json aus xval/crpa-jamming/oracle.py

# text
seg-400cb0737968 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Eine unabhängige numpy-Neuberechnung (xval/jamming-terrain/oracle.py, kein gemeinsamer Code: eigenes Lesen von .hgt, bilineare Interpolation, WGS-{ "84" }-Hin-und-zurück, Profil, Bulge, nu und J(nu)) von zehn Störerplatzierungen um einen Empfänger im Badwater Basin auf der festgeschriebenen echten SRTM-Kachel tests/fixtures/terrain/N36W117_sub6.hgt. Zielwerte und Platzierungen vorab festgelegt bei 92cd2bfd. Alle MET: Additivität (alle { "150" } Szenarioergebnisse byteidentisch ohne den Abschnitt); Profilpunkte und Hindernis jeder Platzierung gleich und nu und Verlust innerhalb von { "1.6e-10" } (Zielwert { "1e-9" }); der Verlust steigt nie, wenn der Störer von { "2" } auf { "4902" } m steigt; der Verlust senkt jedes J/S um genau sich selbst und nichts anderes; J(nu) innerhalb von { "1e-12" } dB von dem der Referenz. Befunde: Platzierungen jenseits der Black und Funeral Mountains verlieren { "44" } bis { "48" } dB; zwei Platzierungen am Talboden verlieren allein durch die Erdkrümmung { "8" } und { "15" } dB bei Antennenhöhen von { "2" } m, dem Streiffall des Modells mit einer einzelnen Schneide. WAS NICHT GEPRÜFT WIRD: jede gemessene Ausbreitung, Mehrfachschneidenbeugung, Bodenreflexion, Clutter, der eigene Fehler des DEM. Eine Neuberechnung desselben Modells, keine externe Referenz; die Zeile bleibt MODELLED.

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), gegen xval/jamming-terrain/expected.json aus xval/jamming-terrain/oracle.py

# text
seg-db6e518a15d1 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — Eine unabhängige Python-Neuberechnung jedes Akquisitionsflags (xval/jamming-acq-agc/hysteresis.py) aus dem effektiven C/N0 je Epoche der Engine, eine unabhängige numpy-Monte-Carlo-Rechnung des Quantisiererverlusts (xval/jamming-acq-agc/quantiser_mc.py, eigene Suche nach der optimalen Schrittweite, { "2" }^{ "22" } Stichproben) und die AGC-Schleife der IQ-Schicht. Zielwerte vorab festgelegt bei 70c72fcc, mit einem ergänzenden Laufsatz bei { "37793290" }. MET: Additivität (alle { "150" } Szenarioergebnisse byteidentisch ohne die Abschnitte); jedes Flag gleich in den ergänzenden Läufen ({ "1824" } Links, davon { "732" } mit Hysterese); monoton in der Schwelle; der Quantisiererverlust innerhalb von { "0.0007" } dB der Monte-Carlo-Rechnung bei { "1" } bis { "4" } Bit (Zielwert { "0.02" } dB); die AGC-Ablesung innerhalb von { "0.012" } dB der AGC-Schleife (Zielwert { "0.05" } dB). NOT MET: Die registrierten Hysterese-Läufe (jamming-demo bei { "10" } bis { "30" } dBW) waren nicht aussagekräftig, da jeder Link verloren ging, und ihre H2 und H4 sind nur trivial erreicht. Befund: Mit einem CW-Störer verliert ein 1-Bit-ADC etwa { "5" } dB mehr als die gaußsche Zahl, die die Engine anwendet, und wird als nicht gültig markiert. WAS NICHT GEPRÜFT WIRD: die Akquisitionssuche selbst, AGC-Dynamik in der Zeit, jede Empfängerhardware. Neuberechnungen desselben Modells, keine externe Referenz; die Zeile bleibt MODELLED.

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), gegen xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json und expected_quantiser.json

# text
seg-19788df00e45 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Interne Konsistenz gegen eingespeiste Wahrheit: eine synthetische datenfreie GPS-L1-C/A-Quelle (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, zehn Rauschseeds), deren Trägerphase bekannt ist, unter Zielwerten, die bei 58789af0 vorab festgelegt wurden (docs/design/evidence/fll-handover-floor/). MET: die Kontrolle (der unbegrenzte Standard übergibt bei { "33" } dB-Hz in { "9" } von { "10" } Seeds nie); Additivität (Standard-Hash und die bestehenden Tracking-Tests unverändert); Einzug einer Übergabe mit { "100" } Hz Versatz bei { "45" } dB-Hz. NOT MET: mit einer Begrenzung von { "1.0" } s Übergabe und Halten in jedem Lauf ({ "16" } von { "20" } bei { "33" } dB-Hz, { "8" } von { "20" } bei { "31" } dB-Hz; der Rest wechselt zwischen erzwungenen Übergaben und der Rückkehr des FLL) und Phasenjitter innerhalb von { "25" } % des PLL allein ({ "10.8" } gegen { "6.1" } Grad bei { "33" } dB-Hz). WAS NICHT GEPRÜFT WIRD: Datenbits, andere Signale und Abtastraten, Feldaufzeichnungen. Der Standard ist unverändert; die Zeile bleibt MODELLED.

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (das FLL-Gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), auf tests/fixtures/fll_handover_floor/results.csv

# text
seg-0718b0c21f9b = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe: Es wurde keine von RTKLIB erzeugte Datei gelesen, und das Spaltenlayout stammt aus dem RTKLIB-Handbuch. Nur an selbst geschriebenen Dateien geprüft; die ECEF-Umrechnung verwendet frames::ecef_to_geodetic wieder, das eigene Zeilen hat

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (Lat/Lon-Epochen, Woche/TOW und ECEF, dms abgelehnt, feindselige Eingabe); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-32c8918c596c = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe als Bestehensgrenze. Die Feldlayouts und die CRC folgen der öffentlichen OEM7-Dokumentation (docs.novatel.com); die CRC-Routine wurde einmal gegen die CRC geprüft, die die Dokumentation für ihr eigenes BESTPOSA-Beispiel angibt (zitiert, nicht wörtlich übernommen). Die Fixtures sind selbst geschrieben; es wurde kein Log eines echten Empfängers gelesen

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (festgelegte CRC, ASCII- und Binärdatensätze, fehlerhafte CRC übersprungen, feindselige Eingabe); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-9fd8d7111160 = gegen eine separate Implementierung in derselben Codebasis geprüft — unabhängig von der geprüften Einheit, aber nicht extern maßgeblich — ReferenceImpl in einer einmaligen Prüfung, kein Test der Suite: Der Decoder von pyrtcm { "1.2.0" } liest dieselben selbst geschriebenen Frames zum selben C/N0 und zur selben Epochenzeit. Er teilt die Quelle seiner Tabellen mit diesem Leser, prüft also die Bitbehandlung, nicht das Layout. Es wurde keine Aufzeichnung eines echten Empfängers oder einer Basisstation gelesen

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (CRC-24Q-Katalogprüfwert, MSM4/MSM7-C/N0 und Zusammenführen von Epochen, GLONASS-Zeit und Zuordnung der SBAS-ID, fehlerhafte CRC und andere Nachrichten)

# text
seg-15841bb986fe = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe: Die Feldnamen stammen aus der Dokumentation von GNSS-SDR; weder der Leser noch relay.py wurde gegen ein laufendes GNSS-SDR oder eine echte Aufzeichnung ausgeführt

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-b101c8376109 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe: Die Anpassung wird an synthetischen Logs mit weißem Rauschen und bekannten Koeffizienten geprüft, die Peilung an Logs mit konstanter Gierrate. Es wurde kein reales IMU-Log angepasst, und q_aa wird nicht angepasst

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (bekannte Koeffizienten weißen Rauschens innerhalb von { "10" } % zurückgewonnen, Ablehnungen, TOML wird als AccelCfg geparst); tests/receiver_trust_machines.rs (Übereinstimmung und Abweichung der Peilung, Inline-Träger, imu_fit)

# text
seg-93283b08d1f9 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe: Die Pakete wurden von einem für den Test geschriebenen Loopback-Listener gelesen, nicht von einem echten Broker, und Home Assistant wurde nicht ausgeführt

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (Paket-Bytes, Loopback-Broker, toter Broker gezählt); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-4f354fdb164b = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe: Der ROS-Knoten wurde nicht auf einem laufenden ROS-{ "2" }-Graphen ausgeführt, und die Feldnamen von ublox_ubx_msgs wurden nicht gegen einen laufenden Treiber geprüft. gnss_lib_py (MIT) wurde für den Bridge-Test ausgeführt

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: das Format, das die Bridge von gnss_lib_py schreibt, durch receiver-trust geführt); die Python-Tests der Bridges sind integrations/ros2/kshana_trust/test/test_bridge.py (Bridge mit einer Mock-Engine), integrations/ros2/kshana_trust/test/test_engine_integration.py (das echte Wheel bewertet einen stetigen Fix als nominal und einen Sprung von { "1.1" } km als nicht vertrauenswürdig) und integrations/gnss_lib_py/test_bridge.py (echtes gnss_lib_py { "1.1.0" } und das Wheel), ausgeführt mit pytest, nicht mit cargo

# text
seg-e7d71a9d77a6 = { "208" } Fähigkeiten mit der Kennzeichnung MODELLED.

# text
seg-7a0503f925c1 = <s1>Zurück</s1>Referenz der Fähigkeiten

# text
seg-b5832e94f926 = <s1>Weiter</s1>Aussagen über die Wirklichkeit

# text
seg-37b0efd0a7e5 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe: Das Pack verknüpft Hashes und eine Bewertung des Empfängerlogs der Stufe MODELLED, geprüft an synthetischen Daten (das exportierte NMEA eines mitgelieferten Szenarios, behandelt als Log des Empfängers). Es wird kein Laborlauf behauptet

# text
seg-3a9a9d15186c = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe Referenz — Keine externe für die Szenarioergebnisse: Jeder Pack-Test führt eine Szenarioart der Stufe MODELLED aus. Die Zielwerte sind das angegebene Profil des Pack-Autors (der Rahmen des DHS nennt keine Werte; die Genauigkeitsgrenzen der IMO sind Tabelle C-1 von MSC.1/Circ.1575, vollständig gelesen; das ICAO-Pack folgt der eigenen Präsentation des RFI Mitigation Plan der ICAO, weil Doc { "9849" } eine kostenpflichtige Veröffentlichung ist und nicht gelesen wurde), festgeschrieben vor jedem bewerteten Lauf in Dateien PREREGISTRATION.md im Stil von xval unter standards/. Ein Zielwert mit MET besagt, dass ein modelliertes Szenario einen angegebenen Zielwert erreicht hat, nichts über ein Produkt

# text
seg-af88df24ce81 = gegen die eigene geschlossene Form bzw. analytische Identität geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Nur interne Konsistenz: Die per Bisektion bestimmte Zeit bis zur Schwelle wird gegen die Umkehrung in geschlossener Form des dominanten Rauschtyps der Uhr geprüft und der Term der freilaufenden Uhr gegen den eigenen Uhrenterm des Budgets. Die Uhrenklassen beruhen auf veröffentlichten Eintagesspezifikationen (ihre eigenen Zeilen); die LTC-Rate wird hier nicht neu hergeleitet und behält ihre eigene Zeile VALIDATED (Lunare Koordinatenzeit); das Steuerungsresiduum ist ILLUSTRATIVE, das Realisierungsresiduum ist eine Budgetzuteilung, und es ist kein thermisches Modell enthalten. Das Ziel auf Nanosekundenniveau, das im Material des ICG WG-B zu Lunar PNT vom Juni { "2024" } beschrieben ist, wird als Quellenaussage zitiert und nicht als Anspruch übernommen; nichts hier ist eine Aussage über irgendeine reale Stationsuhr

# text
seg-d0dd931332c8 = gegen die eigene Identität in geschlossener bzw. analytischer Form geprüft — fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz — Transkription veröffentlichter Konstanten, jede dort zitiert, wo sie definiert ist: Gravitationsparameter aus den Körperdatensätzen von JPL Horizons und der Tabelle der physikalischen Satellitenparameter des JPL, Radien aus den Tabellen der physikalischen Parameter des JPL (IAU WGCCRE { "2015" }), Pole und Nullmeridiane von der IAU Working Group on Cartographic Coordinates and Rotational Elements (Mittelwerte, ohne die T-Rate und die periodischen Terme), J2 von Smith et al. { "2012" }, Iess et al. { "2018" } und { "2019" } sowie Jacobson { "2009" } und { "2014" }. Auf interne Konsistenz geprüft (die Rotationsperiode des Jupiter gegen die Rate des Systems III, jedes J2 gegen seinen Bezugsradius), nicht gegen eine externe unabhängige Referenz. { "0.30" } Runde { "2" }: Die GM-Werte wurden aus gm_de440 übernommen und die Elemente von Phobos und Deimos aus pck00011, sodass nun { "0" } von { "84" } Konstanten der vierzehn hinzugefügten Körper von NAIF abweichen (zuvor { "12" }); dies ist eine Transkriptionsprüfung und wird nicht mitgezählt. { "0.36" }: Die körperfeste Orientierung nach IAU und das GM der vierzehn hinzugefügten Körper sind in eine eigene VALIDATED Zeile ausgelagert ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); diese Zeile behält den Rest. J2 und der mittlere Radius sind zitiert, nicht validiert; die Positionen im Bericht beruhen auf ihren eigenen Zeilen; und der berichtete prime_meridian_deg für Erde, Mond und Mars bleibt bei konventionellen Konstanten (bis zu { "6.6e-3" }, { "2.8e-2" } und { "9.6e-4" } rad von IAU_<BODY>). Revisionen { "0.30" }: Phobos-GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Äquatorradius von Phobos { "13.1" } -> { "13.0" } km; prime_meridian_deg enthält jetzt die quadratischen und periodischen Terme

# text
seg-e86eb864ba1a = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Der Chi-Quadrat-Test der NEES ist eine Prüfung der internen Konsistenz (Wahrheit und Filter teilen das Modell). Der Trend wird mit Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2 verglichen: Multi-GNSS { "9.6" } min verkürzt auf { "7.0" }, { "3.2" }, { "2.1" } und { "1.3" } min mit { "60" }, { "96" }, { "192" } und { "288" } LEO-Satelliten. Das mitgelieferte Szenario ergibt { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } und { "2.3" } min mit seinen eigenen repräsentativen { "1000" } km, { "60" } deg Schalen, Rauschen und Stationen; die Konstellationen, das Rauschen und die Konvergenzdefinition der Veröffentlichung werden nicht reproduziert, daher ist dies eine MODELLED Konsistenz des Trends (monotone Verkürzung, die größte Konstellation unter einem Drittel der Zeit nur mit GNSS), keine Validierung

# text
seg-6613341c6bc0 = ein Teilanspruch wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert — Referenz: die numerischen Aussagen von fünf öffentlichen Quellen, registriert mit URL, Abrufdatum, SHA-256 und Lizenz in tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; Folien des IOAG Cislunar PNT Workshop { "2025" } und { "2026" }; UNOOSA ICG WG-B Lunar PNT, Juni { "2024" }), mit Seitenverweisen abgeschrieben in tests/fixtures/lunar_station_published/CLAIMS.md. Zielwerte, Fälle und Eingaben wurden in tests/fixtures/lunar_station_published/PREREGISTRATION.md vorregistriert (Revision { "2" }, 05bf9a19, allein vor dem Lauf eingecheckt). { "0.36" }, erster Lauf, ein Befund (bleibt MODELLED): { "1" } von { "6" } Zielwerten besteht. Die Abdeckung beträgt { "0.00" } auf beiden Kreisen gegenüber >= { "0.95" }, und der korrigierte p95-Fehler in 3-D beträgt { "280.6" } m ({ "300" } km) und { "293.0" } m bei { "600" } s Latenz, gegenüber <= { "1.5" } m. Der Zielwert im Dezimeterbereich (K4) konnte beim Coderauschen der Quellen von { "0.30" } m nicht bestehen, was einen Widerspruch zwischen den Quellen widerspiegelt und kein Modellergebnis ist. K6 besteht (Verhältnis { "1.39" } gegenüber <= { "1.5" }), aber als Verhältnis zweier von der Geometrie dominierter Zahlen ist es in keiner Richtung ein Beleg für die Dekorrelation. Ursache: Die Elemente der Satelliten sind nicht öffentlich, und mit den ILLUSTRATIVE Elementen im Baum teilen sich ein Nutzer und die Station vier Satelliten über { "5" } Grad nur in { "8.2" } % ({ "300" } km) und { "6.3" } % ({ "600" } km) der Epochen, bei fast singulärer Geometrie (unkorrigiertes p95 { "3.8" } km gegenüber < { "10" } m der Quellen). Die Simulationen der Quellen verwendeten einen Filter, eine Höhenbeschränkung und drei Satelliten in gemeinsamer Sicht, was die Art Schnappschuss nicht modelliert. Der Vergleich bestätigt daher das veröffentlichte 'unter einem Meter über den gesamten Südpol' weder noch widerlegt er es. Er zeigt, dass das Ergebnis dieses Modells von Bahnen abhängt, die nicht veröffentlicht sind. Keine Aussage über ein reales System; nicht mit einer Behörde verbunden und von keiner gebilligt
