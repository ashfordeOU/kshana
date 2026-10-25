# docs--kind-leo-pnt-chain: translations (de)

# text
seg-f42465f7d066 = ns

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } mitgelieferte Szenarien verwenden diesen Typ; die übrigen stehen in <a1><c1/></a1>.

# text
seg-7f5ad6ab8c23 = GPS

# text
# c1: kshana kinds --json
seg-cd04f5662884 = MODELLED. (Artenkatalog (<c1/>))

# text
seg-cb91473bfdda = Themenseite: <a1>LEO-PNT.md</a1>

# text
seg-49964654d5f4 = Szenario-Kind der Engine v{ $version }, Familie <a1>Low-Earth-orbit navigation</a1>. Hinweis (beratend): Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Bezeichnung hier stammt von der Engine oder der Verifikationsmatrix; ein Kind ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Bezeichnung erworben wird: der Abschnitt Evidence der README).

# text
seg-c5478f572d21 = Familienseite: <a1>Low-Earth-orbit navigation</a1>

# text
seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 Abschnitt { "2.4.1" } Schritte { "3" } bis { "9" } (Referenz-Sigma aus N_wet, effektive Weglänge, Antennenmittelungsfaktor, Schwundtiefe für { "0.01" } % bis { "50" } % der Zei. Orakel (ExternalDataset): Validierungsbeispiele der ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) für die Szintillation nach P.618-14, wobei das N_wet nach P.453-14 jedes Standorts aus denselben Beispielen stammt; eingecheckt in tests/fixtures/leo_link/p618_14_scintillation.csv mit den URLs und dem Abrufdatum. Der Ausdruck für die feuchte Refraktivität aus Temperatur und Feuchte wird von dieser Zeile nicht abgedeckt

# text
seg-ab58ab4e7dc6 = <b>VALIDATED</b> Gruppenlaufzeit { "40.3" } STEC/f^{ "2" } je Band; die ionosphärenfreien Koeffizienten f1^2/(f1^{ "2" } - f2^{ "2" }) und -f2^2/(f1^{ "2" } - f2^{ "2" }) und die Rauschverstärkung sqrt(a1^{ "2" } s1^{ "2" } + a2^. Orakel (ExternalDataset): IS-GPS-200 Abschnitt { "20.3.3.3.3.2" }, der das L1/L2-Gruppenlaufzeitverhältnis gamma = (77/60)^{ "2" } nennt, das aus der Skalierung erster Ordnung mit 1/f^{ "2" } folgt, und die Friis-Übertragungsformel (Proc. IRE, { "1946" }). Validiert die Skalierungsgesetze, kein schräger TEC

# text
seg-ae15d15bf151 = Themenseite: <a1>LEO-PASS.md</a1>

# text
# c1: docs/kinds/by-kind/leo-pnt-chain.md
seg-d24f2cccc926 = Quelle: <c1/>

# text
# c1: leo-pnt-chain
seg-3a66efa79aa2 = <c1/> (Szenario-Kind)

# text
seg-81d1604171a5 = Ein LEO-PNT-System (Positionierung, Navigation und Zeitgebung aus dem niedrigen Erdorbit) von Anfang bis Ende, für jede Konstellation und jedes Signal: Das mit signal_design benannte leo-signal-Design (eine öffentliche Voreinstellung oder ein Inline-Design [signal]) legt Mitte, Bandbreite, Chiprate und EIRP-Aufteilung eines Bandes [pass] fest, das Link-Budget von leo-pass liefert das verfolgte C/N0 und den bandbegrenzten Codejitter über den Überflug, eine C/N0-Gerade in sin(Elevation) und das ausgesendete SISRE der Nachricht [navmsg] (angepasst in der Höhe des Überflugsatelliten) speisen jedes LEO-System des gemeinsamen Fixes leo-pvt unter [fusion] und optional die Fälle leo-ppp unter [ppp]; jede Übergabe wird mit Wert und Einheit aufgelistet. MODELLED.

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-9dec9cd6fbfc = Ein Lauf von <c1/> fasst sich so zusammen: LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

# text
# c1: signal_design
# c2: pass
# c3: fusion
seg-21babf07292a = Pflichtfelder: <c1/>, <c2/>, <c3/>

# text
# c1: name
# c2: description
# c3: seed
# c4: signal
# c5: navmsg
# c6: od_sisre_m
# c7: ppp
seg-f7bd59312f9b = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/leo-pnt-end-to-end.toml
seg-585a1b0d5950 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-be21370c2446 = joint

# text
seg-f9c560b3c318 = Galileo

# text
seg-28b34c8ae7c5 = galileo

# text
seg-0093705edf63 = Ergebnisbezeichnung (der Engine): MODELLED — die Kette reicht die Ausgabe jeder Stufe an die nächste weiter; die Stufen behalten ihre eigenen Bezeichnungen (die Zeilen leo-signal, leo-pass, leo-navmsg, leo-pvt und leo-ppp der Verifikationsmatrix).

# attr:alt
seg-abe0599498c9 = Das Diagramm, das die Engine für scenarios/leo-pnt-end-to-end.toml schreibt, Kind leo-pnt-chain

# text
# c1: leo-pnt-chain
seg-d8b7c2c82566 = <b>MODELLED</b> Das Kind <c1/>: Ein leo-signal-Design (öffentliche Voreinstellung oder inline) legt Mitte, Bandbreite, Chiprate und EIRP-Aufteilung eines Bandes von leo-pass fest; der Überflug liefert je Epoche das C/N0 der verfolgten Komponente und den bandbegrenzten Codejitter; ein C/ Tests: <a1>leo_pnt_chain.rs</a1>.

# text
seg-59b976838ef1 = <b>VALIDATED</b> navsignal: das Sinusintegral (sine_integral), der BPSK-R-Leistungsanteil innerhalb eines doppelseitigen Bandes in geschlossener Form (bpsk_power_in_band_closed_form), das Band. Orakel (ExternalDataset): Extern festgelegt: { "90.3" } Prozent Hauptkeulenleistung, der kohärente Early-Late-Jitter am angegebenen Arbeitspunkt, die Tabellenwerte des Sinusintegrals und der spektrale Selbst-Trennungskoeffizient von BPSK 2/({ "3" } R_c) bei Nullversatz. Nur interne Gegenprüfungen, keine externe Validierung: die geschlossene Form der bandbegrenzten BPSK-Gabor-Bandbreite und ihre Asymptote sowie der spektrale Trennungskoeffizient von BPSK mit Versatz bei von null verschiedenen Versätzen, beide

# text
# c1: leo-signal
seg-faf2775f3003 = <b>MODELLED</b> Das Kind <c1/>: parametrisierte Signaldesigns (Band, Sendebandbreite, ITU-Zuweisung; Akquisitions-, Daten- und Pilotkomponenten mit BPSK(n), BOC(m,n), MB. Orakel (InternalConsistency): Die validierten geschlossenen Formen der beiden Zeilen darüber, die Quadratgesetz-Identität des Fehlalarms P_d(snr = { "0" }) = P_fa und die mittlere Akquisitionszeit nach Holmes sowie die Reduktion auf die eigene SSC-Kette des Spektrum-Kinds (derselbe Code Jammer::ssc). Die Designs selbst sind Eingaben: Als REPRESENTATIVE oder WORKSHOP markierte Voreinstellungen sind keine veröffentlichten Spezifikationen, erweiterte Feher-QPSK-, Code-Shift-Keying- und OFDM-Spektren werden angenähert, und die Form

# text
# c1: limitations[0]
seg-752b6d88fc9c = Die Positionierungsstufe modelliert C/N0 als Gerade im Sinus der Elevation zwischen Maske und Zenit; die Kette passt diese Gerade an das verfolgte C/N0 des Überflugs an, sodass eine überflugspezifische Form (ein Isoflux-Plateau, ein Strahlrand) auf zwei Zahlen reduziert wird. (Ergebnis <c1/>)

# text
# c1: limitations[1]
seg-f609a2991c7f = Das SISRE, das an die Positionierungsstufen weitergegeben wird, ist der Darstellungsfehler der Navigationsnachricht gegen eine von Kshana integrierte Wahrheitsbahn, zuzüglich des im Szenario angegebenen od_sisre_m als Wurzel der Quadratsumme; die Nachrichtenstufe selbst modelliert keine Bahnbestimmung oder -vorhersage. (Ergebnis <c1/>)

# text
# c1: limitations[2]
seg-f75f874cdfaa = Die Positionierungsstufe berechnet ihren eigenen Delay-Lock-Loop-Jitter aus dem weitergegebenen C/N0 mit einer Formel für unbegrenzte Bandbreite; der Überflug gibt daneben den bandbegrenzten Jitter des tatsächlichen Designs an. (Ergebnis <c1/>)

# text
# c1: limitations[3]
seg-174ce18ade58 = Die Stufe der präzisen Punktpositionierung übernimmt das SISRE der Nachricht als LEO-Bahn-und-Uhr-Fehler; ihr Code- und Phasenrauschen bleiben die eigenen Eingaben der Stufe. (Ergebnis <c1/>)

# text
# c1: limitations[4]
seg-0aaff940eacb = Ein Satellit, der erste, dessen Band das Design trägt, steht in den Stufen für Überflug und Nachricht für das gesamte LEO-System. (Ergebnis <c1/>)

# text
# c1: label
seg-65930be43134 = MODELLED — die Kette reicht die Ausgabe jeder Stufe an die nächste weiter; die Stufen behalten ihre eigenen Bezeichnungen (die Zeilen leo-signal, leo-pass, leo-navmsg, leo-pvt und leo-ppp der Verifikationsmatrix). (Ergebnis <c1/>)

# text
seg-bf452e9ae07f = MODELLED: Jede Stufe behält ihre eigene Bezeichnung; die Kette fügt keine Physik hinzu. (Kommentar in der Szenariodatei, Zeile { "25" })

# text
seg-0bff72185f12 = <s1>Zurück</s1>leo-pass

# text
seg-851e55b87d01 = <s1>Weiter</s1>leo-ppp
