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
seg-dd8ce373d1f6 = Erde-GNSS-Empfang in Mondentfernung: die Schwachsignal-Schicht, die P7 Tabelle { "1" } nennt und für die die Engine kein Modell hatte. Je Satellit und je Epoche berechnet sie den Außeraxenwinkel gegenüber dem Nadir des Senders, ob die Erde den geraden Pfad verdeckt, die Schrägentfernung und ihre Freiraumdämpfung, den Sendegewinn bei diesem Winkel, die Empfangsleistung und die Trägerleistungsdichte zu Rauschen; anschließend aggregiert sie nur die Strecken, die eine Tracking-Schwelle überschreiten, und durchläuft einen vollen Umlauf der Konstellation, sodass die Antwort eine VERTEILUNG statt einer Momentaufnahme ist. Drei Tatsachen bestimmen das Ergebnis, und der Bericht nennt jede: Die Erde erscheint vom Konstellationsradius aus unter { "13.90" } Grad, sodass die Strahl-SPITZE für jeden zum Mond gerichteten Strahl geometrisch nicht verfügbar ist; übrig bleiben der Rand der Hauptkeule und die Nebenkeulen, das Regime, in dem LuGRE { "2025" } am Mond arbeitete; und die Pfaddämpfung auf L1 beträgt etwa { "208" } dB, rund { "25" } dB mehr als ein terrestrischer Nutzer zahlt. GEMESSEN an der mitgelieferten GPS-artigen Geometrie mit 24 Satelliten über { "64" } Epochen einer Umlaufperiode: SIGNAL-Verfügbarkeit { "0.375" } mit einer besten Strecke von { "30.93" } dB-Hz und FIX-Verfügbarkeit { "0.000" } - höchstens zwei gleichzeitig verfolgbare Strecken, nie die vier, die eine Position braucht. Die Trennung dieser beiden Verfügbarkeiten ist der Punkt, und der Bericht lässt nicht zu, dass sie verwechselt werden: Erde-GNSS in Mondentfernung ist eine Schicht der TIMING-Güteklasse, nicht der Positionsgüteklasse, und ein Layered-Resilience-Prior muss die Fix-Verfügbarkeit nehmen. Die Konditionierung wird aus demselben Grund ausgegeben - jeder sichtbare Satellit liegt vom Mond aus gesehen innerhalb eines Kegels von wenigen Grad Breite, sodass die Sichtlinien konstruktionsbedingt nahezu parallel sind. Ausführbar als Art <c1/> Neu gefasst nach D7: Die Aussage in Mondentfernung ist die RELATIVE Trägerleistungsdichte zu Rauschen zwischen Satelliten in einer Epoche, aus gemessenen zweidimensionalen Sendemustern (NAVCEN Block IIR/IIR-M), plus geometrische Sichtbarkeit; ein absolutes C/N0 wird nicht beansprucht (Parker et al. berichten einen gemeinsamen Verlust von { "7" } bis { "12" } dB).

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
seg-83e6341e01b1 = Durch Baken verbesserte Präzisionsverdünnung für einen Nutzer auf der Mondoberfläche: Die Sichtlinienzeilen der sichtbaren Satelliten und die Entfernungsmesszeilen der sichtbaren Oberflächenbaken werden zu einer Entwurfsmatrix verkettet und über den gemeinsamen DOP-Kern ausgewertet, und die resultierende DOP wird über einen Nutzeräquivalenz-Entfernungsfehler je Bake, zusammengesetzt als Wurzel aus der Quadratsumme von Uhrensynchronisations-, Mehrwege- und Vermessungstermen, auf eine realisierte 1-Sigma-Genauigkeit IN METERN abgebildet. Die Sichtbarkeit der Baken ist der geometrische Horizont des luftlosen Mondes bei zwei Höhen, der keine refraktive Erweiterung hat und daher exakt statt näherungsweise ist. Ausführbar als Szenarioart <c1/>, die Satelliten allein, Satelliten plus Baken und eine größere Konstellation als konkurrierenden Weg zur selben Geometrie angibt. GEMESSEN an der mitgelieferten Golden-Geometrie (Nutzer bei -80 Grad, drei vermessene Baken, illustratives LCNS mit sechs Satelliten bei t={ "0" }, Maske { "5" } Grad): { "5" } sichtbare Satelliten ergeben PDOP { "9.6941" } und ein 3-D-1-Sigma von { "11.222" } m; das Hinzufügen der Baken, die den Horizont tatsächlich überschreiten, ergibt PDOP { "4.1160" } und { "4.765" } m, ein Faktor von { "2.355" }; der Dienst mit 24 Satelliten ergibt stattdessen PDOP { "2.4226" } und { "2.804" } m, ein Faktor von { "4.002" }. Der Bericht gibt die Anzahl der SICHTBAREN Baken statt der konfigurierten aus, und bei dieser Geometrie überschreitet nur EINE der drei Baken den Horizont: Die beiden flankierenden Standorte liegen etwa { "333" } km vom Nutzer entfernt gegenüber einem Horizont von { "86" } km für eine Antenne von { "2" } m, sodass ein Leser nie annehmen muss, alle drei hätten beigetragen

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
seg-a6972eb89d7d = Das Helmert-Datum mit sieben Parametern, fortgepflanzt aus einer SIMULIERTEN BEOBACHTUNGSKAMPAGNE, statt aus einer eingespeisten Transformation zurückgewonnen. Erdstationen beobachten einen belegten Katalog von Baken auf der Mondoberfläche nach einem ausdrücklichen Zeitplan; die Mond-VLBI-Verzögerungspartialen werden in einer Fisher-Informationsmatrix der Bakenkoordinaten akkumuliert und durch den Helmert-Entwurf A = [I₃ | [p]ₓ | p] in H = AᵀM_bA geschoben, sodass die berichtete Datumsgenauigkeit eine Funktion des Beobachtungsprogramms ist — exakt linear im Verzögerungs-Sigma und monoton im Bogen über die Libration, die der Bericht MISST. Der Datumsdefekt ist der Gegenstand und keine Fußnote: Rang, Defekt, Konditionszahl, Spektrum, nicht beobachtbare Richtungen in der Sieben-Parameter-Basis, die schwächste Richtung selbst bei vollem Rang und der Anteil jedes Parameters daran werden bei jedem Lauf ausgegeben, und jeder Parameter, den die Kampagne nicht festlegt, wird als NULL mit einem Status veröffentlicht. Die Korrelation der Bakenfehler wird GEMESSEN, nicht angenommen — exakt null bei festgehaltenen Stationen und mit ihren Kosten ausgegeben, wenn diese geschätzt werden. Ausführbar als die Szenarioart <c1/>

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
