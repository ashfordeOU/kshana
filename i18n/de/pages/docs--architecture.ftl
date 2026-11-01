# docs--architecture: translations (de)

# text
# c1: docs/ARCHITECTURE.md
seg-e366c6dd500e = Quelle: <c1/>

# text
seg-1f25b7fa1187 = Kshana — Architektur

# text
seg-b0136a82669c = Kshana ist <b>eine Engine</b>, in Schichten über einem gemeinsamen Kern organisiert: die <b>Sensorpakete</b> (Uhr, inertial, Zeitübertragung, hybrid); eine <b>astrodynamische / numerische</b> Schicht (analytisches SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), ein numerischer Cowell-Propagator mit seinem Kraftmodell aus sieben Störungen, Manöverentwurf, Bahnbestimmung aus Bodenstations-Entfernungen und die Anpassung des Kraftmodells an präzise Ephemeriden von Agenturen); eine Schicht für <b>Zeit & Bezugssysteme</b> (IERS-Zeitskalen (International Earth Rotation and Reference Systems Service), IAU-Präzession–Nutation 2006/2000A (International Astronomical Union) und die CIO-Reduktion (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System)); eine <b>Fusions</b>schicht (die GNSS/INS-Schätzer (GNSS: globales Satellitennavigationssystem; INS: inertiales Navigationssystem)); und die Schichten für <b>Integrität, Resilienz, alt-PNT (PNT: Positionierung, Navigation und Zeitgebung) und Mond</b> (RAIM/ARAIM/SBAS (RAIM: Empfängerautonome Integritätsüberwachung; ARAIM: erweiterte empfängerautonome Integritätsüberwachung; SBAS: satellitengestütztes Erweiterungssystem), jamming und mehrschichtige spoofing-Erkennung, Karten-Abgleich mit Gravitation/Gelände/Magnetfeld und cislunare PNT); sowie die neueren Schichten <b>LEO-PNT</b> (PNT in niedriger Erdumlaufbahn), <b>Spektrum</b>, <b>Sonnensystem und Konstellationsentwurf</b>, <b>Netzzeitgebung</b> und <b>Kampagnen</b>, mit den Bericht-, Animations- und Interoperabilitäts-Schreibern, die jeder Lauf nutzen kann (§1d). In allen kennt die Engine nichts von „quantum“ gegenüber „classical“: Sie treibt Sensor-<em>Fehlermodelle</em> durch ein GNSS-Ausfallszenario, führt einen Schätzer aus und bewertet das Ergebnis. Ein Quanten- und ein klassisches Gerät werden daher im selben Szenario verglichen und unterscheiden sich nur in ihren (veröffentlichten, zitierten) Fehlerparametern und ihren unabhängigen Rauschseeds.

# text
seg-02110864419e = Dieses Dokument sammelt die strukturellen und verhaltensbezogenen Diagramme. §{ "1" } ist der Kern der Sensorpakete; §1a bildet die seither hinzugekommenen Schichten für Astrodynamik, Fusion und alt-PNT ab; §1b–§1d die Schichten für Studien, Anwendungsbereiche und Ausgaben. Zur Nutzung siehe die <a1>README</a1>; zu dem, was validiert ist und was nicht, siehe <a2>VALIDATION</a2>; für die Reifetabelle je Fähigkeit siehe <a3>CAPABILITY</a3>.

# text
seg-7bcc7b5cd049 = In den Diagrammen verwendete Abkürzungen, die dort nicht ausgeschrieben sind: ADEV, Allan-Abweichung; BW, Bandbreite; CAI, Kaltatom-Interferometer; CZML, die Cesium Language; Δ-DOR, Delta Differential One-way Ranging; DO-229E, der RTCA-Empfängerstandard (Radio Technical Commission for Aeronautics) für SBAS; EKF, erweitertes Kalman-Filter; FM, Frequenzmodulation; GSE, Bodenunterstützungsausrüstung; HPL/VPL, horizontales/vertikales Schutzniveau; IMU, inertiale Messeinheit; IOAG, Interagency Operations Advisory Group; IQ, Gleichphasen-/Quadratur-Abtastwerte; ISL, Intersatellitenverbindung; ITU-T, der Sektor für Telekommunikationsstandardisierung der Internationalen Fernmeldeunion; J2–J6, die zonalen Gravitationsharmonischen der Erde vom Grad { "2" } bis { "6" }; KIF, das Kshana Interchange Format; KML, Keyhole Markup Language; KPI, Leistungskennzahl; L1/L5, GNSS-Trägerbänder (das L2 der CR3BP-Halo-Orbits ist stattdessen der Lagrange-Punkt { "2" } von Erde–Mond); LEO, niedrige Erdumlaufbahn; LOO, Leave-one-out; LTC, koordinierte Mondzeit; MEO, mittlere Erdumlaufbahn; MTIE, maximaler Zeitintervallfehler; N2, die Hill-Diversitätszahl der Ordnung 2; NED, Nord-Ost-Unten; NTN, nichtterrestrisches Netz; OD, Bahnbestimmung; OPS-SAT, der Satellit der Europäischen Weltraumorganisation als Software-Labor im Orbit; PPP, präzise Punktpositionierung; PSD, spektrale Leistungsdichte; PVT, Position, Geschwindigkeit und Zeit; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), Runge–Kutta-Integratoren vierter Ordnung und eingebettet fünfter (vierter) Ordnung; SH, Kugelflächenfunktion; SigMF, Signal Metadata Format; SIR, Sampling Importance Resampling; SRIF, Wurzel-Informationsfilter; SRP, Strahlungsdruck der Sonne; SSC, spektraler Trennungskoeffizient; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, Zeitabweichung; TDM, die Tracking Data Message des CCSDS (Consultative Committee for Space Data Systems); TLE, Two-Line-Element-Satz; TPL, Zeitgebungs-Schutzniveau; UBX, das binäre Protokoll von u-blox; UHF, Ultrahochfrequenz; VLBI, Interferometrie mit sehr langer Basislinie; VRW / ARW, Random Walk der Geschwindigkeit / des Winkels; WASM, WebAssembly.

# text
seg-a87f668a8f97 = { "1" }. Modulstruktur

# text
# c1: api::run_toml
# c2: types
# c3: scenario
# c4: allan
# c5: hybrid
# c6: orbit
# c7: navsignal
# c8: κ
# c9: jamming
# c10: Q = 1/(R_c·κ)
seg-0388999448a6 = Die CLI (Befehlszeilenschnittstelle) und beide Bindings laufen über einen einzigen Einstiegspunkt <c1/>, sodass sie nie auseinanderlaufen. Die Pakete verwenden den gemeinsamen Kern wieder (<c2/>, <c3/>, <c4/>); Paket { "4" } (<c5/>) setzt die Modelle und Schätzer der Pakete { "1" }–{ "3" } zusammen, statt sie neu zu implementieren; <c6/> leitet aus der Geometrie eine GNSS-Zeitleiste ab, die dann den Lauf von Paket { "1" } speist. Das Modul <c7/> sitzt auf Signalebene zwischen dem Link-Budget und dem Messungsbereich: Es leitet den spektralen Trennungskoeffizienten <c8/> aus den tatsächlichen Leistungsspektren von Signal und Störer ab, woraus <c9/> nun sein Anti-Jam-<c10/> berechnet, statt eine repräsentative Konstante zu nehmen (in der CI (Continuous Integration) gegengeprüft); es trägt außerdem den Entwurfskompromiss der Entfernungsmesscodes (m-Folge/Gold).

# text
# c1: holdover
# c2: clock_state
# c3: inertial::quantum_imu
# c4: QuantumNavBudget
# c5: AccelModel
# c6: verification
seg-cee4eb61a8e9 = Drei weitere Module bilden das Rückgrat der <b>GNSS-verweigerten Resilienz</b>. <c1/> beantwortet die operative Frage unmittelbar — <em>wie lange kann diese Uhr frei laufen, bevor ihr Zeitfehler das Budget überschreitet?</em> —, indem es die geschlossene van-Loan-Form des Auslauffehlers als Inversion von holdover zu Schwelle bereitstellt, gegengeprüft gegen die mehrstufige Kovarianzrekursion von <c2/>. Sein inertialer Zwilling lebt in <c3/> (<c4/>), das die Weißrauschdrift des Kaltatom-Interferometers mit Bias- und Skalenfaktorfehler zu einem Budget der Positionsdrift über holdover zusammensetzt (der Bias-Term ist gegen den unabhängigen Integrator <c5/> gegengeprüft). <c6/> stellt die Matrix der gesamten Engine von Anforderung zu Modul zu Test zu unabhängiger Referenz zu Status dar, mit unit-getesteten Invarianten, die ein Label <em>validiert</em> ohne unabhängige externe Referenz verbieten — damit sich die Zusicherung nicht vom Code entfernen kann.

# text
seg-c7bee352c04d = 1a. Schichten für Astrodynamik, Fusion und alt-PNT

# text
# c1: orbit
# c2: kind
seg-99c44e3a86d5 = Über den Kern der Sensorpakete hinaus teilen sich drei Subsysteme denselben gemeinsamen Kern und speisen <c1/> (oder werden davon gespeist). Die <b>astrodynamische / numerische</b> Schicht fügt neben dem analytischen SGP4/SDP4-Pfad einen nichtanalytischen Cowell-Propagator hinzu; die <b>Fusions</b>schicht trägt die GNSS/INS-Schätzer; und die <b>alt-PNT</b>-Schicht ist GPS-verweigerter (GPS: Global Positioning System) Gravitationskarten-Abgleich. Dies sind Bibliotheks-/Szenariofähigkeiten (siehe <a1>CAPABILITY</a1>, welche an eine Szenarioart <c2/> angebunden sind und welche als Rust-API (Programmierschnittstelle) erreichbar sind).

# text
# c1: forces
# c2: integrator
seg-69f93294d2c8 = Die Kraftterme des numerischen Propagators sind standardmäßig aus, sodass ihr Einschalten die freigegebenen Goldens nie verändert. Das eng gekoppelte UKF (Unscented Kalman Filter) mit 17 Zuständen überbrückt einen GNSS-Ausfall mit dem abgeleiteten Geschwindigkeits-Random-Walk des Quanten-CAI-Beschleunigungsmessers; die Bahnbestimmung verwendet dieselben <c1/>/<c2/> wieder, um einen Kandidatenzustand über den Verfolgungsbogen zu propagieren.

# text
# c1: timescales
# c2: jd2
# c3: precession
# c4: nutation
# c5: cio
# c6: frames
# c7: eop
# c8: ephemeris
# c9: raim
# c10: sbas
# c11: jamming
# c12: spoof
# c13: spoof_detect
# c14: spoof_monitors
# c15: detection
# c16: navsignal
# c17: κ
# c18: jamming
# c19: Q
# c20: lunar
# c21: lunar_frame
# c22: lunar_od
# c23: cr3bp
# c24: cr3bp_jacobian
# c25: propagate_state_stm
# c26: differential_correct_halo
# c27: precise_od
# c28: lunar_od
# c29: tides
# c30: gravity_sh
# c31: igrf
# c32: altpnt/terrain
# c33: gravimeter
seg-bd87e20c284b = Derselbe gemeinsame Kern trägt außerdem vier weitere Subsysteme, die oben nicht gezeichnet sind (ihre Pakete erscheinen im Dispatch von §{ "4" }): eine Schicht für <b>Zeit & Bezugssysteme</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), die TEME↔GCRS↔ITRS reduziert (TEME: true equator, mean equinox) und das Paket <c8/>/Bodenspur speist; eine <b>Integritäts</b>schicht (<c9/>, <c10/>) für RAIM/ARAIM/SBAS; eine <b>Resilienz</b>schicht (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) für jamming und mehrschichtige spoofing-Erkennung, mit einer <b>Navigationssignal</b>schicht (<c16/>) auf Signalebene — spektrale Leistungsdichten von BPSK-R (BPSK: binäre Phasenumtastung) / Sinus-BOC (BOC: binärer Offsetträger), der spektrale Trennungskoeffizient <c17/>, der nun das Anti-Jam-<c19/> von <c18/> ableitet, die RMS-Entfernungsbandbreite (Gabor), der Jitter der kohärenten Early–Late-Codeverfolgung des DLL (Delay-Locked Loop) und die Mehrwege-Fehlerhüllkurve (Signalleistungsanalyse, <b>nicht</b> Entwurf von RF-Nutzlast- (RF: Hochfrequenz) / Antennenhardware — die Rolle eines Nutzlastpartners); und eine <b>Mond-/cislunare</b> Schicht (<c20/>, <c21/>, <c22/>, <c23/>) für CR3BP-Dynamik (eingeschränktes kreisförmiges Dreikörperproblem) — einschließlich der Zustandsübergangsmatrix { "6" }×{ "6" } und eines Differenzialkorrektors mit Einzelschießverfahren (<c24/>, <c25/>, <c26/>), der echte periodische Halo-/NRHO-Bahnen (NRHO: nahezu geradlinige Halo-Bahn) erzeugt und die veröffentlichte südliche L2-NRHO { "9" }:{ "2" } (die Gateway-Bahn) bei Periode ≈ { "6.57" } d / Perilun ≈ { "3,250" } km reproduziert (veröffentlicht ≈ { "6.56" } d / ≈ { "3,370" } km); die selenozentrische MCI/MCMF-Transformation (MCI: mondzentriert inertial; MCMF: mondzentriert, mondfest) einer korrigierten Bahn und die Familienfortsetzung bleiben Folgearbeiten, und die NRHO ist eine CR3BP-Lösung (kreisförmig, ohne Sonne), nicht gegen eine reale LANS/Gateway-Ephemeride (LANS: Lunar Augmented Navigation Service) validiert — und die LunaNet-Integrität. Die Anpassung des Kraftmodells an Ephemeriden von Agenturen (<c27/>, <c28/>, <c29/>, <c30/>) und der volle Satz an alt-PNT-Feldern (<c31/>, <c32/>, <c33/>) runden die Modulliste ab; zur Reife je Modul siehe <a1>CAPABILITY</a1>.

# text
seg-05f8c8c84d15 = 1b. Resilienzstudien, Auswertung von maschinellem Lernen und reproduzierbare Artefakte

# text
# c1: kind
# c2: cargo run --example
# c3: --bin
seg-7350971daf4e = Fünf weitere Modulgruppen bilden die <b>offene, reproduzierbare Studien</b>-Schicht hinter den Forschungsarbeiten des Projekts. Anders als die Szenarioarten <c1/> werden diese als Generatoren <c2/> / <c3/> erreicht, die <b>byte-deterministische</b> Artefakte schreiben (feste Seeds, festgehaltene Engine-Version + Konfigurations-Hash). Alle sind <b>MODELLED</b> (synthetische oder öffentliche Datensatz-Kalibrierung) und tragen ehrliche Validierungskennzeichnungen — keine ist eine Zertifizierung.

# text
# c1: tpl
seg-86b177166f0e = <b><c1/></b> — das bedingte Zeitgebungs-Schutzniveau: eine durch holdover begrenzte Schranke für den <em>unentdeckten</em> Zeitfehler unter spoofing, zusammengesetzt aus einer k-σ-Monitor-Untergrenze, der van-Loan-Auslaufvarianz über die Erkennungslatenz und einer CUSUM-Zeit-bis-Alarm (kumulative Summe); kalibriert an einem real aufgezeichneten Spoofing (JammerTest { "2024" }). Es gibt keine endliche <em>unbedingte</em> Schranke — das TPL ist daran gebunden, dass eine unabhängige Gegenprüfung den Angriff erkennt.

# text
# c1: resilience/
seg-8c9d1d90dc8e = <b><c1/></b> — eine am Rahmenwerk ausgerichtete Bewertungs-Engine für PNT-Resilienz (Kategorien des DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework)) plus eine Studie zur Entscheidungsinstabilität: ein Dirichlet-Gewichtungssimplex, Kendall-τ-Ranginstabilität, Top-1-Gewinner-Wechselrate und <b>Diversitätskollaps</b> durch gemeinsame Ursachen (Hill-N2), mit einem integritätsgehashten Zusicherungsbericht und { "35" } von Hand abgeleiteten Referenztests. Siehe <a1>RESILIENCE-CROSSWALK</a1>. Synthetische Architekturen, ausgerichtet an RPCF v2.0 — eine Selbstbewertung, keine Zertifizierung.

# text
# c1: impairment_eval
# c2: impairment_study
# c3: impairment_ml
# c4: eval_stats
seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — die Studie zur Optimismuslücke bei RF-Beeinträchtigungen: ein beschrifteter synthetischer Korpus und ein detektorunabhängiges ROC/AUC-Harness (ROC: Receiver Operating Characteristic; AUC: Fläche unter der Kurve), ein Panel aus 13 Detektoren (Energie/AGC/SQM/Parität (AGC: automatische Verstärkungsregelung; SQM: Signalqualitätsüberwachung) plus Detektoren mit festem Seed aus logistischer Regression und einem MLP mit einer verborgenen Schicht (MLP: mehrschichtiges Perzeptron)), Skalierungsgesetze innerhalb gegenüber außerhalb der Verteilung mit einer Permutations-Nullverteilung und ein Leave-one-out-Prädiktor der Degradation außerhalb der Verteilung. Die Auswertungsmetriken sind bitgenau gegen scikit-learn validiert.

# text
# c1: sdr
# c2: realdata
seg-36206681024f = <b><c1/> / <c2/></b> — ein Front-End eines softwaredefinierten Empfängers (rohe IQ/IF (IQ: Gleichphasen/Quadratur; IF: Zwischenfrequenz) → Korrelator-Early/Prompt/Late-Abgriffe → SQM) und Einlese-Adapter (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid), mit denen dieselben Detektoren über lokal bereitgestellte Aufzeichnungen laufen; es werden keine Datensätze im Repository eingecheckt.

# text
# c1: crossover
# c2: quantum_trade
seg-fefd78868fc2 = <b><c1/> / <c2/></b> — die Karte des Resilienz-Übergangs zwischen Quanten und klassisch unter Parameterunsicherheit und der Kompromiss beim Nutzen von holdover aus gemessener ADEV; die numerischen Kerne des Kompromisses sind gegen scipy validiert.

# text
seg-5749f1300772 = 1c. Schichten für Integrität, GNSS, Weltraum, Mond und Missionen

# text
# c1: api
# c2: verification
seg-f44755d6d921 = Die übrigen Bereiche schließen an denselben Dispatch <c1/> an und verwenden den gemeinsamen Kern, die Bezugssysteme und die Geometrie wieder. Alles hier ist <b>MODELLED</b>, sofern keine Zeile der Matrix <c2/> eine externe unabhängige Referenz nennt (RAIM-Kern gegen SciPy, SBAS gegen den Fork von RTKLIB (eine quelloffene Bibliothek für kinematische Echtzeit-Positionierung), der DOP-Kern (Dilution of Precision) von gnss_lib_py, die OPS-SAT-Auswertung, der ARAIM-Schutzniveau-Kern für den Mond, die anbieterübergreifende Konsistenz der Mond-Ephemeriden) — der Rest der Mond-Suite und der Quanten-Demonstrator sind modelliert, illustrativ, aus öffentlichen Quellen und tragen keine Aussage zu TRL (Technologiereifegrad) / Heritage / Agenturbefürwortung.

# text
seg-044940c8d052 = 1d. LEO-PNT, Spektrum, Sonnensystem, Netzzeitgebung, Kampagnen und Ausgaben

# text
# c1: kind
# c2: api
seg-253a26d9cc5d = Die neuesten Schichten folgen demselben Muster: Jede ist eine oder mehrere Szenarioarten <c1/>, aus <c2/> dispatcht, auf dem gemeinsamen Kern gebaut und MODELLED, sofern keine Zeile der Matrix eine externe unabhängige Referenz nennt.

# text
seg-e47cccd54da3 = Die Einzelheiten je Art stehen in <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> und <a13>INTEROP</a13>.

# text
seg-d04b21c7cb6c = 1e. Schichten für Empfängervertrauen, Nachweise, Telemetrie, Ausbildung und compliance ({ "0.35" })

# text
# c1: api
# c2: receiver-trust
seg-84ee122959b4 = Diese Schichten lesen das eigene Protokoll eines Empfängers oder schreiben Dateien für andere Werkzeuge; keine von ihnen synthetisiert oder sendet ein Hochfrequenzsignal. Sie sitzen neben <c1/> statt unter den Szenarioarten, mit Ausnahme von <c2/> selbst, das eine Szenarioart ist. Alle sind MODELLED, sofern keine Zeile der Matrix eine externe unabhängige Referenz nennt, und die maritimen Ausgaben sind beratend, keine typzugelassene Navigationsausrüstung.

# text
seg-aab745a65e76 = Modul

# text
seg-9d17ad3e87c8 = Dokumentiert in

# text
seg-920b6b14c0e2 = bewertet ein Empfängerprotokoll Epoche für Epoche mit den Vertrauensmonitoren; eine Schiffsplattform fügt die maritimen Monitore und die Bewertung von 0 bis 100 mit Gründen hinzu

# text
seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

# text
# c1: $PKSHT
# c2: LiveEngine
seg-c311dfc2a161 = dieselbe Bewertung an einem Datenstrom, während er eintrifft (stdin, eine Datei, an die angehängt wird, TCP oder UDP), der <c1/>-Satz und das optionale Gate; <c2/> ist das Ganze ohne Ein- oder Ausgabe

# text
seg-07b2d6edf7b9 = ein signiertes, per Hash verkettetes Paket aus einem Protokollfenster, seiner Konfiguration und dem Ergebnis der Engine, offline verifizierbar; optionales RFC-{ "3161" }-Zeitstempel-Token

# text
# c1: otlp
seg-32d08730b9c0 = der Vertrauensstrom als Prometheus-Metriken, syslog-Ereignisse (CEF oder LEEF) und optional OpenTelemetry (Funktion <c1/>, standardmäßig aus)

# text
seg-53311b8c3b93 = synthetische Brücken-NMEA { "0183" } mit skriptgesteuerten jamming-, Drag-off-, Zeit-Spoofing- und Replay-Ereignissen und einem Ausbilderprotokoll, für das Training von Besatzungen (nur Text)

# text
seg-f7cc3cfbdfc6 = aggregierte Karten beeinträchtigter Navigation aus offen lizenzierten Flugzeug- und Schiffsmeldungen sowie die Belastung einer Route durch diese; nur lokale Dateien

# text
# c1: osnma::cli::verify_report
seg-83fe3c87e2d5 = ein empfängerseitiger Verifizierer für Galileo OSNMA: liest I/NAV-Seiten (einfache Seiten, Vektor-CSV, einen UBX-Strom), prüft den signierten Schlüssel, die TESLA-Kette und die MACs und meldet je Satellit, ob die Navigationsdaten authentifiziert sind; <c1/> ist der eine Pfad, den Kommandozeile, Python und WebAssembly gemeinsam nutzen; nur Authentifizierungsstatus, kein Integritätsdienst

# text
seg-bf8cd5a45deb = OSNMA

# text
# c1: run_from_text
# c2: assess_texts
seg-843a83b82283 = ordnet Kshana-Ausgaben öffentlichen Resilienz-Rahmenwerken zu und füllt die Zuordnung aus Ergebnisdokumenten; <c1/> und <c2/> nehmen Texte entgegen, keine Pfade

# text
seg-e16c483479ce = die Fahrzeugbewegung und die Ereignisse eines Szenarios als Bewegungs-CSV, NMEA, Wegpunkttext und Ereignisdateien für einen GNSS-Laborsimulator; es wird kein Signal geschrieben

# text
seg-044c58c98397 = Integrationen für Boote (das Signal-K-Plugin, der OpenCPN-Gate-Modus und der Referenzaufbau) rufen das Kommandozeilenwerkzeug auf; siehe <a1>MARINE-INTEGRATIONS</a1>.

# text
seg-cb8d8ff847eb = { "2" }. Engine-Pipeline (je Lauf)

# text
seg-53e9e596ca44 = Jeder Lauf schreitet mit einem einzelnen Sensormodell das Zeitraster ab: Es wird nachgeführt, solange GNSS nominal ist, und läuft während des Ausfalls frei (holdover / Koppelnavigation).

# text
# c1: classical_seed = seed + 0x9e3779b97f4a7c15
seg-257407f3c375 = Ein Szenario durchläuft diese Pipeline zweimal, einmal für den Quantensensor und einmal für den klassischen Sensor, mit <b>unabhängigen Startwerten</b> (<c1/>), sodass die beiden Rauschrealisierungen unkorreliert sind.

# text
seg-4659e89ba5f5 = { "3" }. Die Fehlermodell-Schnittstelle (der Erweiterungspunkt)

# text
# c1: step()
seg-7b70e8b1b98a = Jeder Sensor setzt dieselbe Idee um: ein zustandsbehaftetes Objekt, dessen <c1/> seinen internen stochastischen Fehler fortschreibt und dessen aufgelaufener Zustand in jedem Takt ausgelesen wird. Uhren liefern die aufgelaufene Phase, Beschleunigungsmesser die zweifach integrierte Position, Verbindungen den Jitter je Messung.

# text
# c1: ModelSpec { id, kind, provenance, params }
# c2: provenance
seg-79ab76c6dbc0 = <c1/> wandert ins Ergebnis, sodass jede Zahl der Ausgabe auf die in <c2/> genannte veröffentlichte Quelle zurückführbar ist.

# text
# c1: HoldoverEstimator
# c2: KalmanClock
# c3: q_wf·T + q_rw·T³/3
seg-514c49659947 = Neben dem analytischen <c1/> führt das Uhrenpaket ein Kalman-Filter mit zwei Zuständen (Phase, Frequenz) aus (<c2/>), dessen Prozessrauschen dem wahren Modell entspricht. Im Auslauf durch einen Ausfall wächst seine Phasenfehlervarianz genau auf <c3/>, die analytische holdover-Beziehung, und seine Online-1-σ-Schranke dient dazu, die Gütegröße <b>Integrität</b> zu bestimmen (Anteil der Ausfallproben, deren Fehler innerhalb der k-σ-Schranke bleibt).

# text
seg-7404589deb40 = { "4" }. Dispatch (CLI und Bindings)

# text
# c1: api::run_toml(src)
# c2: kind
# c3: { json, svg, summary, csv }
# c4: csv
# c5: report.html
# c6: report.json
# c7: --export
# c8: --animate
seg-6138513a43f7 = <c1/> ist der einzige Einstiegspunkt: Sie liest das <c2/> der obersten Ebene vorab, deserialisiert das passende Szenario, führt das Paket aus und gibt <c3/> zurück (<c4/> ist nur bei den Arten vorhanden, die eine Reproduzierbarkeitstabelle veröffentlichen). Die CLI schreibt diese in Dateien, dazu den Bericht (<c5/>, <c6/>) und jede Ausgabe von <c7/> / <c8/>; die Python- und WebAssembly-Bindings geben sie an den Host zurück. Ein Dispatch, keine Abweichung.

# text
# c1: ScenarioKind
# c2: kind
# c3: clock
# c4: serde
# c5: kind
# c6: kind
# c7: KshanaError::InvalidInput
seg-524f749be364 = Der Dispatch erfolgt über eine typisierte Enum <c1/>, die erschöpfend abgeglichen wird (siehe nächster Unterabschnitt); das Hinzufügen eines Pakets ist daher eine vom Compiler geprüfte Änderung. Ein fehlendes <c2/> fällt auf das Paket <c3/> zurück, sodass bestehende Szenarien einer einzigen Art unverändert deserialisiert werden (<c4/> ignoriert das Feld <c5/> in jeder Szenario-Struktur). Eine unbekannte <c6/> wird mit <c7/> zurückgewiesen, der bei einem wahrscheinlichen Tippfehler die nächstliegende eingebaute Art nennt.

# text
seg-eedaeae2a7e7 = Typisierter Dispatch und die strukturierte API

# text
# c1: ScenarioKind
# c2: ScenarioKind::classify(src)
# c3: kind
# c4: run_toml
seg-ca47f566eaee = Der Dispatch erfolgt über eine typisierte Enum <c1/>, nicht über einen rohen Zeichenkettenvergleich: <c2/> löst das Feld <c3/> zu einer Variante auf, und der Dispatcher gleicht sie erschöpfend ab; das Hinzufügen eines Pakets ist eine vom Compiler geprüfte Änderung, kein Zeichenketten-Tippfehler. Neben dem zeichenkettenliefernden <c4/> (für die CLI und bestehende Bindings beibehalten) gibt es zwei typisierte Oberflächen:

# text
# c1: run_scenario(src) -> Result<RunOutput, KshanaError>
# c2: InvalidInput
# c3: NonConvergence
# c4: Unsupported
# c5: IoError
# c6: kind_tag()
# c7: error_kind(toml)
seg-167c47049329 = <b><c1/></b>: der typisierte Einstieg mit einer strukturierten Fehlertaxonomie (<c2/>, <c3/>, <c4/>, <c5/>). Jeder Fehler trägt ein stabiles <c6/>, damit ein Aufrufer nach Fehlerkategorie verzweigen kann, statt die Meldung zu parsen. Die Bindings stellen dies als <c7/> bereit.

# text
# c1: list_scenario_kinds() -> Vec<ScenarioMeta>
# c2: list_scenario_kinds_json()
# c3: list_kinds()
seg-1943051b3b20 = <b><c1/></b> (und <c2/>, in den Bindings als <c3/> bereitgestellt): programmatische Introspektion, also Name, Beschreibung sowie Pflicht- und optionale Felder jeder Art, für die automatische Vervollständigung in Benutzeroberflächen (UI) und Notebooks.

# text
seg-630243592256 = Kshana mit einem externen Paket erweitern

# text
# c1: api
seg-d1adedd2c08b = Ein Paket eines Drittanbieters implementiert zwei kleine, semver-stabile Traits aus <c1/>:

# text
# c1: ExternalPack
# c2: register_into(&mut PackRegistry)
# c3: src/registry.rs
# c4: jamming
# c5: Scenario
# c6: ErrorModel
seg-d01471b13324 = <c1/> hat außerdem eine Standardmethode <c2/>, die nichts tut, sofern ein Paket sich nicht für die Registry-Dispatch-Schnittstelle in <c3/> entscheidet. Das eingebaute Paket <c4/> ist über <c5/> als durchgespieltes Beispiel angebunden; Pakete außerhalb des Repositorys folgen demselben Vertrag, ohne den Kern zu forken (entsprechend dem Erweiterungspunkt <c6/> in §{ "3" }, den das private Resilienz-Overlay nutzt).

# text
# c1: ErrorModel
# c2: Scenario
# c3: ExternalPack
seg-5b0449d96bc3 = Kshana hat daher <b>zwei stabile Erweiterungsschnittstellen</b>: einen <em>Sensor</em> hinzufügen, indem man <c1/> implementiert (§{ "3" }), oder eine ganze <em>Szenarioart</em>, indem man <c2/> + <c3/> implementiert; beide sind semver-stabil, keine verlangt einen Fork des Kerns:

# text
seg-3928a007756b = { "5" }. Das hybride Schlussstück

# text
# c1: pnt_holdover
seg-7f38e825519a = Das Hybridpaket führt eine <em>Suite</em> aus (eine Uhr plus ein Inertialsensor) und verlangt, dass <b>sowohl</b> Zeitgebung als auch Position innerhalb der Spezifikation bleiben; <c1/> ist die Zeit, bis eines von beiden sie verletzt. Optional synchronisiert eine optische Inter-Satelliten-Verbindung die <b>Uhr</b> während des Ausfalls neu, ausschließlich als Zeitstützung; die Position wird nicht neu synchronisiert, weil Zeitübertragung Zeit liefert, keine Position. Dadurch wird der Inertialsensor als begrenzender Faktor isoliert.

# text
seg-17a8683f0982 = { "6" }. Aus der Geometrie abgeleitete GNSS-Verfügbarkeit

# text
# c1: orbit.rs
# c2: Propagator
# c3: Orbit
# c4: Sgp4
# c5: build_timeline
seg-afdb141ac367 = <c1/> ist eine deterministische, abhängigkeitsfreie Geometrieschicht. Ein <c2/> ist entweder die analytische Keplersche <c3/> (Zweikörperproblem, optional mit säkularem J2) oder ein vollständiger <c4/>-Propagator, der aus einem vollständigen Zweizeilen-Elementesatz aufgebaut wird; ein Walker-Delta-Generator erzeugt synthetische Konstellationen, und die Sichtlinien-Sichtbarkeit = Erdverdeckung + Elevationsmaske. Die Zahl sichtbarer Satelliten wird auf einen GNSS-Zustand abgebildet (≥{ "4" } = nominal, { "1" }–{ "3" } = degradiert, { "0" } = verweigert), und <c5/> macht daraus die Verfügbarkeitszeitleiste, die den üblichen Uhren-holdover-Lauf antreibt. Die Verfügbarkeit ist somit <em>aus der Geometrie abgeleitet</em> statt von Hand vorgegeben, während Lauf, Schätzer und Bewertung unverändert bleiben.

# text
# c1: sgp4.rs
seg-da82c97ac5c8 = Eine als vollständige TLEs gelieferte Konstellation wird mit dem SGP4/SDP4-Modell in <c1/> propagiert (gegen die Vektoren AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 validiert); Elemente, die nur aus Zeile 2 bestehen, behalten den analytischen Zweikörperpfad. Beide lassen sich innerhalb eines Konstellationsblocks mischen.

# text
seg-a47031620b54 = { "7" }. Bindings

# text
# c1: python.rs
# c2: wasm.rs
# c3: --features python
# c4: --features wasm
# c5: cargo deny --all-features
# c6: api::run_toml
# c7: web/
# c8: run
# c9: run_all
# c10: chart_svg
# c11: summary
# c12: table_csv
# c13: list_kinds
# c14: error_kind
# c15: version
# c16: encode_permalink
# c17: decode_permalink
# c18: export_sp3
# c19: export_omm
# c20: export_oem
# c21: api
# c22: mcp/kshana-mcp
# c23: rmcp
# c24: run_scenario
# c25: list_scenario_kinds
# c26: validate_scenario
# c27: list_example_scenarios
# c28: get_example_scenario
# c29: report_scenario
# c30: animate_scenario
# c31: list_export_formats
# c32: export_interop
# c33: import_route
# c34: export_sp3
# c35: export_omm
# c36: export_oem
# c37: export_table_csv
# c38: assess_receiver_log
# c39: bundled-scenarios
# c40: ide/jetbrains
# c41: kshana
seg-57fb29fdd9d9 = Der Kern lässt sich unverändert nativ, als Python-Erweiterung und als WebAssembly kompilieren. Die Python- (<c1/>, PyO3 abi3) und WebAssembly-Module (<c2/>, wasm-bindgen) sind optionale, per Feature zugeschaltete Abhängigkeiten (<c3/> / <c4/>): Der Standard-Build und die Testsuite kompilieren sie nie, während das Abhängigkeitsaudit (<c5/>) ihre Abhängigkeitsbäume sehr wohl prüft, weil diese Crates im Wheel und im npm-Paket ausgeliefert werden. Beide rufen <c6/> auf, sodass jede Oberfläche identische Ergebnisse liefert. Das WebAssembly-Modul trägt den Browser-Playground in <c7/> und exportiert dreizehn Funktionen: <c8/>, <c9/> (ein Engine-Lauf, der Ergebnis, Diagramm, Zusammenfassung und Tabelle zusammen liefert), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, den Codec <c16/> / <c17/> für teilbare URLs (URL: Webadresse) und die drei Exporter <c18/> / <c19/> / <c20/>, die das Exportmenü des Playgrounds tragen. Zwei weitere Zugänge erreichen dieselbe <c21/>: der <b>MCP-Server (Model Context Protocol)</b> (<c22/>, ein vom Workspace ausgeschlossenes Crate <c23/> mit fünfzehn Werkzeugen: <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; die beiden Beispielwerkzeuge lesen die mitgelieferten Szenarien über die standardmäßig abgeschaltete Funktion <c39/> der Bibliothek, die nur dieser Server einschaltet) und das <b>JetBrains-IDE-Plugin (integrierte Entwicklungsumgebung)</b> (<c40/>, ein Kotlin-Projekt, das die CLI <c41/> aufruft, statt die Bibliothek einzubinden).

# text
# c1: --features python
# c2: --features wasm
# c3: --features bundled-scenarios
# c4: xval/*
seg-a6620e0d6eef = Feature-Gating: Python und WASM sind <c1/> / <c2/>; die Tabelle der mitgelieferten Szenarien ist <c3/> (die einzige Nutzung durch den MCP-Server); der MCP-Server und die Gegenprüfungen <c4/> sind vom Workspace AUSGESCHLOSSENE Crates; das IDE-Plugin bindet nichts ein, es führt die CLI aus.

# text
seg-7bc5df56e4e5 = { "8" }. Determinismus und Reproduzierbarkeit

# text
# c1: ChaCha8Rng
# c2: (scenario, seed, engine version) → identical bits
seg-fb95c37c7bb9 = Sämtliche Zufälligkeit läuft pro Lauf durch einen einzigen mit einem Startwert versehenen <c1/>; die Schrittreihenfolge ist fest, daher gilt <c2/>.

# text
# c1: scenario_hash
# c2: scripts/check-reproducible.sh
seg-e026c87beb26 = Das Ergebnis trägt einen SHA-256-<c1/> (SHA: Secure Hash Algorithm); <c2/> führt ein Referenzszenario zweimal aus und prüft, dass die Ausgabe byteidentisch ist.

# text
# c1: wasm32-unknown-unknown
seg-42a3bdcbd99f = Dieselbe Engine lässt sich nativ, als Python-Erweiterung und nach <c1/> für Läufe im Browser kompilieren und liefert dieselben Zahlen.

# text
seg-12e00717c2d4 = { "9" }. Zurückgestellte / künftige Struktur

# text
seg-8a8e1b93b704 = Die Astrodynamik-, Fusions- und Alt-PNT-Schichten in §1a (der vollständige SGP4/SDP4-Propagator, der numerische Cowell-Propagator mit seinem Kraftmodell aus sieben Störungen und zwei adaptiven Integratoren, Manöver-/Trajektorienentwurf, Bahnbestimmung, die GNSS/INS-Schätzer mit 15, 8 und 17 Zuständen, das gekoppelte Uhren-plus-Positions-Filter und der Schwerekarten-Abgleich) sind alle ausgeliefert, ebenso die Security-Gütegröße mit aktivem Spoofing-Demonstrator, echte TLE-/Mehrkonstellationsgeometrie, Monte-Carlo-Bänder, Trade-Study-Sweeps, der druckbare HTML-Bericht (HyperText Markup Language) mit seinem maschinenlesbaren Zwilling sowie die Workflows für Release, Publish, Wheels und Pages.

# text
# c1: hybrid-ukf
seg-318ad50d3826 = Mehrere Fähigkeiten, die hier einst als künftige Arbeit aufgeführt waren, sind inzwischen <b>ausgeliefert</b> und weiter oben oder in <a1>VALIDATION</a1> behandelt: die vollständige IAU-2000A-Nutation und die äquinoxfreie CIO-Reduktion GCRS↔ITRS / ITRF (International Terrestrial Reference Frame), bitgenau gegen SOFA/ERFA geprüft (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy), das Geopotenzial EGM2008 (Earth Gravitational Model { "2008" }) bis Grad/Ordnung { "70" }, der <b>Lense-Thirring</b>-Term der Rahmenmitführung, Fest-, Ozean- und atmosphärische Gezeiten, eine Ephemeriden-Kreuzvalidierung auf DE-Niveau (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris, ein reines Rust-Werkzeug für Planetengeometrie)), die externe Orekit-{ "12.2" }-Kreuzvalidierung des numerischen Cowell-Propagators ({ "0.08" } m über { "24" } h) und der Batch- und sequenziellen Bahnbestimmung sowie der eng gekoppelte Navigator mit 17 Zuständen, der als Szenarioart <c1/> bereitsteht.

# text
# c1: [Unreleased]
# c2: .gfc
# c3: xval/high-degree-gravity/
# c4: space-weather
seg-068119b15b27 = Die verbleibenden Folgearbeiten werden in <a1>CHANGELOG</a1> <c1/> und in der Roadmap je Fähigkeit in <a2>CAPABILITY</a2> verfolgt: ein externer Wert einer unabhängigen Referenz für den EGM-Auswerter (Earth Gravitational Model) hohen Grades genau auf der Polachse und ein pyshtools-sauberer Vergleich nahe dem Pol (der Auswerter bis Grad { "2190" } und sein Laufzeit-Lader für <c2/> sind ausgeliefert, MODELLED; siehe <c3/>), ein zeitvarianter Weltraumwetter-Treiber für die optionale Luftwiderstandsdichte-Stufe NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) (die Standarddichte ist das statische Exponentialmodell, und die Jacchia-71-Dichte der Art <c4/> wird gegen NRLMSISE-00 charakterisiert, aber nicht durch es ersetzt), eine externe Prüfung des optionalen Sonnenrand-Verdunkelungsschattens, enge Kopplung von Trägerphasen-GNSS/INS und eine echte EGM2008-/EIGEN-Schwerekarte (EIGEN: European Improved Gravity model of the Earth by New techniques) für den Alt-PNT-Abgleicher.

# text
# c1: ErrorModel
# c2: ExternalPack
seg-b48f69ea54b3 = Ein privates Overlay-Repository enthält exportsensible Resilienztiefe; es wird über dieselbe Schnittstelle <c1/> (und den Vertrag <c2/> in §{ "4" }) eingebunden, ohne die öffentliche Engine zu verändern.

# text
seg-2f88ab8f67e8 = <s1>Zurück</s1>Wo Kshana läuft

# text
seg-02b0e0fdcdbe = <s1>Weiter</s1>Wo Kshana steht
