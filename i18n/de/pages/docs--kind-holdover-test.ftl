# docs--kind-holdover-test: translations (de)

# text
seg-f42465f7d066 = ns

# text
seg-c61e88721556 = Szenariotyp der Engine v{ $version }, Familie <a1>Uhren, Zeitgebung und Holdover</a1>. Nur beratend: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Safety-of-Life-Dienst. Jede Kennzeichnung hier stammt von der Engine oder von der Verifikationsmatrix; ein Typ ist MODELLED, sofern die Matrix nichts anderes angibt (wie eine Kennzeichnung erworben wird: Abschnitt „Evidence“ der README).

# text
seg-849c08d3ce70 = Familienseite: <a1>Uhren, Zeitgebung und Holdover</a1>

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die anderen sind in <a1><c1/></a1>.

# text
# c1: docs/kinds/by-kind/holdover-test.md
seg-73929aeded02 = Quelle: <c1/>

# text
# c1: holdover-test
seg-218f00012d0e = <c1/> (Szenario-Kind)

# text
seg-c0924aa36e64 = MODELLED Holdover-Test eines Zeitgebungssystems, bewertet anhand eines Zeitfehlerprotokolls, das der BETREIBER liefert (ein linuxptp-Protokoll von ptp4l, phc2sys oder ts2phc, ein chrony-Tracking- oder Statistikprotokoll, ein TICC-, TimeLab- oder RINEX-Uhrenprotokoll oder Paare aus time_s,time_error_ns). Der Test hat vier Schritte, und Kshana führt keinen davon aus: eine eingerastete BASISLINIE, GNSS ENTFERNT durch den Betreiber (das Antennenkabel oder der Simulatorausgang; Kshana sendet nichts und steuert nichts an) zu einem angegebenen Zeitpunkt, HOLDOVER auf dem eigenen Oszillator des Systems und WIEDERHERSTELLUNG, nachdem der Betreiber GNSS zu einem zweiten angegebenen Zeitpunkt wiederherstellt. Das Protokoll wird an diesen beiden Zeitpunkten geteilt. Basislinie: Zeitfehlerstatistik und die für eine eingerastete Uhr geschriebenen ITU-T-Masken. Holdover: Statistik, der Bruchteil des Frequenzversatzes, den das System gehalten hat (eine Ausgleichsgerade nach kleinsten Quadraten), die für Holdover oder eine autonome Uhr geschriebenen Masken, die ePRTC-A-Holdover-Hüllkurve aus der angegebenen Dauer im eingerasteten Zustand und die Zeit bis zur Überschreitung jedes Zeitfehlerbudgets. Wiederherstellung: ob und wann |TE| in ein angegebenes Band gelangte und dort blieb, der Spitzenwert und der größte Sprung. Jeder Grenzwert ist aus einer öffentlichen ITU-T-Tabelle übertragen (die Masken für Telekom-Zeitgebung); die Formulierung lautet 'gegen die Maske gemessen', und die beiden Zeitpunkte sind die Angabe des Betreibers, nicht verifiziert. Ein für eine Maske zu kurzes Protokoll ist INCOMPLETE, nie extrapoliert. Siehe docs/TIMING-HIL.md.

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-cd6d840a1382 = Ein Lauf von <c1/> fasst sich so zusammen: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

# text
# c1: test
# c2: series
seg-6a3dc8804be5 = Pflichtfelder: <c1/>, <c2/>

# text
# c1: masks
# c2: budgets
seg-4792040e4773 = Optionale Felder: <c1/>, <c2/>

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-ad4f9c40e317 = Das Beispiel <c1/> setzt unter anderem:

# text
seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

# text
seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

# text
seg-a0f9749e9ca1 = master

# text
seg-cd857523297f = phase

# text
seg-29a012ae4735 = refuse

# text
seg-d578fc8e6052 = Ergebnisbezeichnung (der Engine): MODELLED — ein Holdover-Test, bewertet anhand eines Zeitfehlerprotokolls, das der Betreiber geliefert hat. Jeder Grenzwert ist aus der benannten öffentlichen ITU-T-Empfehlung übertragen, und das Ergebnis wird gegen die Maske gemessen; es sagt nichts darüber aus, ob eine Uhr oder ein System eine Empfehlung erfüllt, und niemand hat es bewertet oder genehmigt

# attr:alt
seg-8ce93392747b = Das Diagramm, das die Engine für scenarios/holdover-test-ptp4l.toml schreibt, Kind holdover-test

# text
# c1: holdover-test
seg-3361819ae321 = <b>MODELLED</b> Das Kind <c1/>: Ein Zeitfehlerprotokoll (ein linuxptp-, chrony-, TICC-, TimeLab- oder RINEX-Uhrenprotokoll oder Paare aus time_s,time_error_ns) wird an den beiden vom Betreiber angegebenen Zeitpunkten für das Entfernen und Wiederherstellen von GNSS in eine Basislinie, einen Holdover und

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> Das maximale Zeitintervallfehler- und Zeitabweichungsmaß, das das Szenario-Kind <c1/> auf einem Holdover-Protokoll im Telekom-Maßstab meldet: ein O(n) monotones Warteschlangen-Schiebefenster. Orakel (ExternalDataset): allantools { "2024.06" } — eine unabhängige Frequenzstabilitätsbibliothek eines Drittanbieters — mtie() und tdev() auf tests/fixtures/telecom_timing/holdover_te_series.csv, wobei die Reihe auf beiden Seiten aus demselben Text mit 17 signifikanten Stellen geparst wird; die Referenz zeichnet das SHA-256 der Reihe auf und ist offline über tests/fixtures/telecom_timing/generate_telecom_timing_reference.py neu erzeugbar. Validiert die SCHÄTZER auf diesem Protokoll, nicht die syn

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> Übertragene Grenzwerte von ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC eingerastet und ePRTC-A-Holdover (einschließlich der Zeitfehler-Hüllkurve nach Tabelle { "3" }. Orakel (InternalConsistency): Übertragung der benannten Empfehlungen (frei herunterladbar von itu.int), wobei jeder Grenzwert seine Tabelle oder Klausel trägt, aufgelistet zusammen mit jedem unbestätigten oder nicht implementierten Punkt in docs/TELECOM-TIMING.md; die Stetigkeitsidentitäten an den Knickpunkten, die die Tabellen implizieren, werden in den Tests geprüft. Eine Normübertragung mit Prüfungen auf interne Konsistenz, kein Konformitätstest und keine externe Validierung. { "0.30" } round { "2" } (pre-register

# text
# c1: holdover-test
seg-142528f34e66 = <b>MODELLED</b> Das Kind <c1/>: Ein Zeitfehlerprotokoll (ein linuxptp-, chrony-, TICC-, TimeLab- oder RINEX-Uhrenprotokoll oder Paare aus time_s,time_error_ns) wird an den beiden Zeitpunkten geteilt. Orakel (InternalConsistency): Handrechnung an Protokollen, die aus Formeln aufgebaut sind, deren Steigung, Sprung, Extremum und Wiederherstellungszeit vor dem Lauf bekannt sind (die Tests geben sie an), sowie die Masken, die Hüllkurve und die Budgets der oben stehenden Telecom-Timing-Zeilen. Es wurde keine Labormessung eines echten Holdovers bewertet und keine externe unabhängige Referenz verglichen, daher erhebt das Kind keine Aussage über irgendeine Uhr oder ein System; vor jedem Abschluss je Uhrenklasse ist ein Zeitlabor-PARTNER nötig

# text
# c1: label
seg-59ff0b0e3d2d = MODELLED — ein Holdover-Test, bewertet anhand eines Zeitfehlerprotokolls, das der Betreiber geliefert hat. Jeder Grenzwert ist aus der benannten öffentlichen ITU-T-Empfehlung übertragen, und das Ergebnis wird gegen die Maske gemessen; es sagt nichts darüber aus, ob eine Uhr oder ein System eine Empfehlung erfüllt, und niemand hat es bewertet oder genehmigt. Die Zeitpunkte, zu denen GNSS entfernt und wiederhergestellt wurde, sind die Angabe des Betreibers und nicht verifiziert. Beratende Soft (Ergebnis <c1/>)

# text
# c1: kshana kinds --json
seg-daeb4ad7aa35 = MODELLED Holdover-Test eines Zeitgebungssystems, bewertet anhand eines Zeitfehlerprotokolls, das der BETREIBER liefert (ein linuxptp-Protokoll von ptp4l, phc2sys oder ts2phc, ein chrony-Tracking- oder Statistikprotokoll, ein TICC-, TimeLab- oder RINEX-Uhrenprotokoll oder Paare aus time_s,time_error_ns). (Kind-Katalog (<c1/>))

# text
seg-ff3008c250cc = Die ITU-T-Masken für Telekom-Synchronisation mit PASS/FAIL und Marge sind MODELLED, nicht validiert: Sie werden gegen ihre eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-8ccd0f911626 = Der Holdover-Test, bewertet anhand eines vom Betreiber gelieferten Zeitfehlerprotokolls, ist MODELLED, nicht validiert: Er wird gegen seine eigene geschlossene bzw. analytische Identität geprüft - das fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-72bad5444282 = Themenseite: <a1>TIMING-HIL.md</a1>

# text
seg-3b3a24664dae = Themenseite: <a1>HARDWARE-SAFETY.md</a1>

# text
seg-b754be35fb52 = <s1>Zurück</s1>gravity-map

# text
seg-e7665ee5e30e = <s1>Weiter</s1>hybrid-optical-rf
