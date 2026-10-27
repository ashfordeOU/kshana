# docs--slot-timing: translations (de)

# text
seg-f917e7fcac09 = Was es ist

# text
seg-adc34608c46b = Klasse

# text
seg-3a0e724a8a2b = Stufe

# text
seg-fffbeccd4266 = Symbol

# text
seg-2247a2344710 = Bedeutung

# text
seg-582fd72f1a1a = Bewertung

# text
seg-f63dd3d7aad4 = Quelle

# text
seg-1ff32b87e030 = Satelliten

# text
seg-430edd66bda0 = Nicht modelliert

# text
# c1: docs/SLOT-TIMING.md
seg-f23c8bd5f203 = Quelle: <c1/>

# text
# c1: slot-timing
seg-1f2727dc4ca4 = Die Szenarioart <c1/> beantwortet drei Fragen für eine Uhr, die zwischen Synchronisationen frei läuft und den Verkehr innerhalb eines <b>zeitindizierten Slots</b> halten muss: ein Routing-, Aufgaben- oder Kontakt-Slot, dessen <b>Guard</b> der größte absolute Zeitfehler auf jeder Seite ist, bei dem der Slot noch funktioniert.

# text
seg-6b39d8afeb5d = <b>Wann bricht der Guard?</b> Sekunden vom letzten Fix, bis der vorhergesagte Zeitfehler den Guard erreicht, mit allen beitragenden Termen einzeln aufgeführt und dem dominierenden benannt.

# text
seg-60476d723e1a = <b>Wie viel Zeit bleibt jetzt?</b> Dieselbe Größe abzüglich der seit dem Fix bereits verstrichenen Zeit.

# text
seg-84010982db35 = <b>Wie oft muss die Uhr einen Fix nehmen?</b> Das größte Intervall zwischen Fixes, das den Fehler innerhalb des Guards hält, abzüglich der Latenz, bevor ein Fix wirksam wird.

# text
# c1: spoofing
seg-3388d46925f1 = Ein optionaler Abschnitt <c1/> fügt das Timing-Schutzniveau (TPL) für einen Empfänger im Orbit hinzu; siehe <a1>Spoofing eines Empfängers im Orbit</a1>.

# text
# c1: kshana example slot-timing-ocxo-leo
seg-2eb266d992b0 = Führen Sie das mitgelieferte Beispiel mit <c1/> aus.

# text
seg-624e7a70c4f6 = Abkürzungen: GNSS, Global Navigation Satellite System; TCXO, temperaturkompensierter Quarzoszillator; OCXO, thermostatgeregelter Quarzoszillator; RAFS, Rubidium-Atomfrequenznormal; CSAC, Atomuhr im Chip-Format; USO, ultrastabiler Oszillator; DSAC, Atomuhr für den tiefen Raum; ADEV, Allan-Abweichung; FM, Frequenzmodulation (hier Rauschen auf der Frequenz der Uhr); PM, Phasenmodulation (Rauschen auf ihrer Phase); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, der Sektor Telekommunikationsstandardisierung der Internationalen Fernmeldeunion; TIE, Zeitintervallfehler; MTIE, maximaler Zeitintervallfehler; TDEV, Zeitabweichung; max|TE|, maximaler absoluter Zeitfehler; CUSUM, Änderungsdetektor mit kumulativer Summe; TPL, Timing-Schutzniveau; LEO, niedrige Erdumlaufbahn; NIST SP, National Institute of Standards and Technology Special Publication; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (eine IEEE Transactions); IGS, International GNSS Service; GPS, Global Positioning System; Block IIF, die GPS-Satelliten der Block-II-Folgegeneration; SHA-256, der 256-Bit Secure Hash Algorithm; PPS, Puls pro Sekunde.

# text
seg-f2a0c73ef648 = Das Fehlermodell

# text
# c1: t
seg-6bc3f9e78346 = Der vorhergesagte Zeitfehler nach <c1/> Sekunden freiem Lauf ab einem Fix ist

# text
seg-3fbb186c716a = Abdeckungsfaktor ({ "3" } entspricht etwa { "99.7" } % eines gaußschen Fehlers)

# text
seg-883965151598 = Ein-Sigma-Zeitfehler des Fixes

# text
# c1: W
# c2: σ_y(W)
seg-b63c0447865f = Ein-Sigma-Fehler der beim Fix bekannten Frequenz; eine über ein Fenster <c1/> geschätzte Frequenz trägt etwa <c2/>

# text
seg-ab28fc69d3ac = Varianz des weißen Phasenrauschens: Jitter des Zeitfehlers, ein konstanter Sockel

# text
# c1: holdover::coast_phase_variance
seg-8792541a7b6d = Dichten von weißem FM, Random-Walk-FM und Random-Run-FM (die Van-Loan-Terme von <c1/>)

# text
seg-5d36b32c4de8 = Flicker-FM-Sockel der Allan-Varianz

# text
seg-65da5a90685f = nach dem Fix verbleibender relativer Frequenzversatz

# text
# c1: ΔT
# c2: c_T
seg-816e427d51f9 = Frequenzversatz durch eine Temperaturänderung <c1/> über den Temperaturkoeffizienten <c2/>

# text
seg-e23d0ac960aa = lineare Alterungsrate

# text
# c1: t²·σ_y²(t)
# c2: σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20
# c3: t
# c4: E(t) = guard
seg-43e5f75b369c = Jeder FM-Term ist für seine eigene Rauschart gleich <c1/>, mit <c2/> (Zucca und Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Für weißes FM, Random-Walk-FM und Random-Run-FM ist diese Beziehung exakt. Für Flicker-FM ist sie die übliche Schätzung des Zeitvorhersagefehlers (Riley, NIST SP { "1065" }): Flicker-FM hat ohne eine Grenzfrequenz nach unten keine geschlossene Form. Die Frequenzversätze addieren sich im Betrag, weil ihre Vorzeichen unbekannt sind, der deterministische Anteil ist also ein ungünstigster Fall. Jeder Term ist nicht negativ und in <c3/> nicht fallend, daher hat <c4/> eine Wurzel, die durch Einschließen und Bisektion gefunden wird.

# text
seg-f9038fba23e2 = Woher die Uhr kommt

# text
seg-5c44b2f8d015 = Szenarioschlüssel

# text
seg-cb92ae98c231 = Klassenstandard

# text
seg-7594664253f2 = eine zitierte ADEV für eine Sekunde und ein rotes Rauschniveau, synthetisiert zwei und vier Dekaden darunter

# text
seg-794e4932b470 = MODELLED: die Antwort für eine stabile Uhr wird vom angenommenen Sockel bestimmt

# text
seg-5ea820aaa69f = Datenblatt-Voreinstellung

# text
# c1: ocxo
# c2: rubidium
# c3: caesium
# c4: csac
seg-c943490619f3 = die Voreinstellungen für Telekom-Zeitgebung (<c1/>, <c2/>, <c3/>, <c4/>), jede ein benanntes Microchip-Datenblatt

# text
seg-a20353d50011 = MODELLED: eine Hüllkurve der Datenblatt-Höchstwerte

# text
seg-b543f3dcd11a = Eingebettetes Datenblatt

# text
seg-4983ec096617 = die eigene ADEV-Tabelle des Kunden, Alterung und Temperaturkoeffizient

# text
seg-b079bca8a611 = MODELLED: eine Hüllkurve der angegebenen Höchstwerte

# text
seg-119d94700cab = Gemessene Aufzeichnung

# text
seg-ae6835f0c3c5 = eine Phasenaufzeichnung; ihre überlappende ADEV wird durch gewichtete kleinste Quadrate angepasst

# text
seg-6e1c4702186d = die Inversion ist an einer zurückgehaltenen realen Aufzeichnung VALIDATED (unten)

# text
seg-f4cc2be238b7 = Die drei in { "0.28.0" } hinzugefügten Klassen zitieren jeweils ein öffentliches Datenblatt:

# text
seg-47f6ddc3bd02 = ADEV für eine Sekunde

# text
seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, Spalte für einfaches TCXO

# text
seg-becbff195fff = Microchip-Datenblatt OX-208, Rev 12-1-2021

# text
seg-19d8d32203f6 = Microchip-Datenblatt 8040C Rubidium Frequency Standard, DS00003047A

# text
seg-48babc170b93 = Die Zeilen von EndRun für lange Mittelungszeiten laufen über diese Tabelle hinweg zusammen ({ "4e-13" } für jeden Oszillator außer dem TCXO, { "8e-13" }, bei { "10 000" } s, und { "6e-14" } für alle bei { "100 000" } s), was nahelegt, dass sie das nachgeführte Produkt beschreiben und nicht den freilaufenden Oszillator; sie werden daher nicht verwendet.

# text
# c1: edf
# c2: 2σ⁴/edf
# c3: √(edf/2)·(model/σ² − 1)
# c4: extrapolated
seg-85c7211bb49b = <b>Die Anpassung an die Aufzeichnung ist gewichtet.</b> Eine Schätzung der Allan-Varianz mit <c1/> äquivalenten Freiheitsgraden hat eine Varianz von etwa <c2/>, sodass jeder Punkt mit dem Residuum <c3/> eingeht. Eine ungewichtete Anpassung ließ die kurzen Mittelungszeiten über die Terme der langen Mittelungszeiten entscheiden: Bei einer Testaufzeichnung mit weißem FM erzeugte sie einen scheinbaren Flicker-Sockel, der eine Überschreitung nach { "2 000" } s um { "30" } % verkürzte. Ein Datenblatt oder eine Aufzeichnung stützt nur Mittelungszeiten bis zu ihrem längsten Punkt; eine Überschreitung darüber hinaus wird mit <c4/> gekennzeichnet.

# text
seg-5b61a42c76c2 = Validierung: die Inversion an einer zurückgehaltenen realen Uhr

# text
# c1: tests/slot_timing_cs5071a_holdout.rs
# c2: allantools
# c3: tests/cs5071a_reference.rs
seg-2220a1490923 = <c1/> verwendet die Aufzeichnung mit { "556" } 990 Messwerten eines Cäsium-Normals 5071A, gemessen gegen einen Wasserstoff-Maser (A. Wallin, verteilt mit <c2/>; dieselbe Aufzeichnung, die die Schätzer-Referenz <c3/> verwendet). Mit dem Maser als Referenz ist die Aufzeichnung ein freier Lauf von 6,4 Tagen.

# text
seg-9bae4571f67c = Das Rauschmodell nur am <b>ersten Drittel</b> der Aufzeichnung anpassen.

# text
seg-15b2cb621db7 = Aus diesem Modell die Auslaufzeit vorhersagen, bei der der Ein-Sigma-Zeitfehler { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } und { "2.5" } ns erreicht.

# text
seg-1bd9ac435bfa = An den <b>anderen zwei Dritteln</b> alle { "997" } s ab einem Synchronisationspunkt auslaufen lassen, mit der aus dem vorhergehenden Drittel geschätzten Frequenz, und messen, wo der quadratische Mittelwert des Auslauffehlers jede Schwelle erreicht.

# text
# c1: scripts/fetch_cs5071a.sh
# c2: realdata-clock
# c3: KSHANA_REQUIRE_REALDATA=1
seg-d7640a2ec444 = Der Zielwert für das Bestehen, festgelegt, bevor der Test erstmals lief, ist: jede vorhergesagte Überschreitung liegt innerhalb eines Faktors von { "1.5" } der gemessenen. Eine Kontrolle, die als weißes FM gelesene ADEV für eine Sekunde, muss diesen Zielwert verfehlen, damit der Zielwert ein gutes Modell von einem schlechten unterscheiden kann. Der Test gibt seine Tabelle aus; eine Mutation, die den Pegel des weißen FM halbiert, lässt ihn fehlschlagen. Die Rohaufzeichnung sind von git ignorierte Drittanbieterdaten: <c1/> lädt sie, und der Workflow <c2/> führt den Test mit <c3/> aus, sodass eine fehlende Datei dort fehlschlägt, statt übersprungen zu werden.

# text
seg-3d11f7c6d4ab = Was dies validiert: den Pfad Anpassen-dann-Invertieren, an einem von weißem FM dominierten Atomnormal, über Auslaufzeiten bis etwa { "50 000" } s. Was nicht: die Datenblatt- und Klassenquellen, die deterministischen Terme und einen Quarzoszillator (nächster Abschnitt).

# text
seg-bfcc5555ed50 = Dieselbe Vorhersage an einem realen Quarzoszillator: konservativ, nicht validiert

# text
# c1: tests/slot_timing_ocxo_holdout.rs
# c2: allantools
# c3: scripts/fetch_ocxo.sh
# c4: fix_frequency_sigma
seg-b77b3f503ca2 = <c1/> verwendet einen gemessenen OCXO: { "19 982" } Frequenzmesswerte im Sekundentakt des { "10" }-MHz-Oszillators in einem HP-Impedanzanalysator, gegen einen Wasserstoff-Maser (A. Wallin, { "2015" }, verteilt mit <c2/>; <c3/>). Das Rauschmodell und eine lineare Drift werden am ersten Drittel angepasst; jeder Auslauf an den anderen zwei Dritteln beginnt mit einer über die vorhergehenden { "100" } s geschätzten Frequenz, und das Modell trägt die Unsicherheit dieser Schätzung (<c4/>, die eigene Allan-Abweichung des Modells bei { "100" } s).

# text
seg-e05821406c28 = Angepasst an

# text
seg-c70aadbd47d4 = Vorhergesagte ÷ gemessene Überschreitung, { "0.2" } bis { "10" } ns

# text
seg-d71582148b20 = Ablesung

# text
seg-dcc3fd23bede = das erste Drittel (zurückgehalten)

# text
seg-f9bb286f5868 = { "0.59" } bis { "0.70" }

# text
seg-612784f70090 = konservativ: nie später als gemessen, überwiegend außerhalb des Zielwerts von { "1.5" }

# text
seg-121fa832c30f = das Auswertungssegment selbst (Diagnose)

# text
seg-b4be9afa69ac = { "0.98" } bis { "1.17" }

# text
seg-75e1515b970a = die Inversion ist richtig; die Lücke beim zurückgehaltenen Teil ist der sich verändernde Oszillator

# text
seg-c91da69e9c09 = Das Rauschniveau des Oszillators halbierte sich während der Aufzeichnung: Die Allan-Abweichung des ersten Drittels flacht bei etwa { "7.5e-12" } ab, die des Rests bei etwa { "3.5e-12" }. Ein früh angepasstes Modell überschätzt das Rauschen, was die sichere Richtung ist. <b>Der Quarzfall ist daher nicht validiert und bleibt MODELLED.</b> Bei einem Quarz an einer eingeschwungenen Aufzeichnung anpassen und mit dem Altern des Bauteils neu anpassen.

# text
# c1: fix_frequency_sigma
seg-6230fed0e164 = <b>Wie das Protokoll gewählt wurde, angegeben, weil es nicht blind war.</b> Ein erster explorativer Lauf verwendete das Cäsium-Protokoll wieder (Frequenz aus dem vorhergehenden Drittel, kein Frequenzterm) und sagte Überschreitungen { "1.4" } bis { "2.5" } Mal später voraus als gemessen: optimistisch, die gefährliche Richtung. Die Frequenz eines Quarzes wandert, sodass eine Stunden vor dem Fix geschätzte Frequenz veraltet ist, und das Modell hatte keinen Term dafür, wie gut die Frequenz beim Fix bekannt ist. Der Term <c1/> wurde aus diesem Grund hinzugefügt und dieses Protokoll festgelegt, bevor der Test geschrieben wurde; der Zielwert für das Bestehen wurde nicht verschoben. Der Test prüft außerdem, dass ohne den Term die Vorhersage in der Stichprobe bei jeder Schwelle optimistisch ist, der Term also tragend ist.

# text
seg-88e01cac525a = Dieselbe Vorhersage an Atomuhren im Orbit: { "8" } von { "10" }, nicht validiert

# text
# c1: tests/slot_timing_igs_holdout.rs
# c2: scripts/fetch_igs_clocks.sh
seg-17962966b6d6 = <c1/> verwendet kombinierte finale IGS-Uhren mit { "30" } s über { "14" } Tage ({ "17" } bis { "30" } August { "2025" }; <c2/>, jede Datei durch SHA-256 festgelegt): die Uhr jedes GPS-Satelliten des Blocks IIF gegen die IGS-Zeitskala. Das Protokoll (Satellitenmenge, Lückenregel, Anpassungsfenster, eine Synchronisation alle { "3 570" } s mit der Frequenz aus der vorhergehenden Stunde, Schwellen von { "1" } bis { "20" } ns, der Zielwert von { "1.5" } und die Regel, dass die Klasse nur besteht, wenn jeder Satellit besteht) wurde aufgeschrieben, bevor irgendwelche Daten heruntergeladen wurden.

# text
seg-1b5832633c87 = Vorhergesagte ÷ gemessene Überschreitung

# text
seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

# text
seg-9a6fac366156 = { "0.76" } bis { "1.46" }

# text
seg-c14941cb5537 = innerhalb des Zielwerts

# text
seg-dbaaf875f1fb = { "1.51" } bis { "1.99" }

# text
seg-3601e13c39b6 = optimistisch

# text
seg-ea41cf6dbec2 = { "1.20" } bis { "1.61" }

# text
seg-099fb000bf57 = nicht ausgewertet

# text
seg-a7699b256ee1 = durch die Lückenregel ausgeschlossen (ein fehlender Tag)

# text
seg-eb71202e0b91 = Acht von zehn sind ein brauchbarer Beleg, aber bei zwei Satelliten wird vorhergesagt, dass sie länger halten, als sie es taten, was die gefährliche Richtung ist, und das Protokoll verlangt, dass jeder Satellit besteht. <b>Der Orbitalfall bleibt daher MODELLED.</b> Satelliten des Blocks IIF tragen sowohl Rubidium- als auch Cäsium-Normale, und die IGS-Dateien geben nicht an, welches aktiv ist, daher gilt das Ergebnis für die Satelliten und nicht für einen Uhrentyp. Warum sich G25 und G30 unterscheiden, wurde nicht untersucht.

# text
seg-a9be8a92b6b9 = Ein bench-Lauf für ein flugrepräsentatives Bauteil (umrissen, nicht durchgeführt)

# text
seg-43597df55508 = Die öffentliche OCXO-Aufzeichnung ist { "5.5" } Stunden lang, stammt von einem Laborinstrument, und der Oszillator schwingt noch ein. Den Quarzfall würde ein längerer gemessener freier Lauf eines flugrepräsentativen OCXO oder eines CSAC gegen eine Referenz validieren:

# text
seg-e2698f00a84a = ein Zeitintervallzähler, der den { "1" }-PPS des Oszillators mit einer GNSS-nachgeführten oder Maser-Referenz vergleicht, mindestens { "10" } Tage bei einer Stichprobe pro Sekunde, Temperatur protokolliert;

# text
seg-c4c902ac028e = dasselbe Protokoll mit zurückgehaltenen Daten: am ersten Drittel anpassen, die Überschreitungen vorhersagen, am Rest messen, mit demselben Zielwert und derselben Kontrolle;

# text
seg-0faaa6279195 = die Aufzeichnung und ihr Hash neben dem Test veröffentlicht, damit die Zeile reproduzierbar ist.

# text
seg-9b2255563582 = Es hängt vom Zugang zu Referenzhardware ab und wird nicht zugesagt.

# text
seg-6cb2dc94d1bf = Gegen welche Wander-Metrik sollte ein Slot akzeptiert werden?

# text
seg-f6d24245dca6 = Zeitnormen bieten drei Familien von Metriken. Für einen zeitindizierten Slot misst nur eine davon das, was den Slot bricht.

# text
seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) ist der größte Spitze-Spitze-TIE innerhalb eines beliebigen Fensters gegebener Länge. Er ist blind für einen konstanten Versatz: Eine Uhr, die um { "1" } µs danebenliegt, aber vollkommen gleichmäßig läuft, hat einen MTIE nahe null und verfehlt jeden Slot. Er misst, wie stark sich der Fehler <em>ändert</em>, nicht, wo er <em>liegt</em>.

# text
seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) wird aus zweiten Differenzen der gemittelten Phase gebildet. Er entfernt einen konstanten Versatz und einen konstanten Frequenzfehler, und genau das sind die Terme, die einen Auslauf dominieren. Er kennzeichnet die Rauschart; er ist keine Akzeptanzmetrik für absolute Zeitgebung.

# text
seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; die Budgetmetrik von G.8271) ist der größte absolute Zeitfehler gegen die Referenzzeitskala. Er lässt sich direkt mit einem Guard vergleichen.

# text
# c1: E(t)
# c2: t
# c3: T
# c4: E(T)
# c5: L
seg-7eefc395a118 = <b>Schlussfolgerung.</b> Einen Slot gegen max|TE| akzeptieren, bezogen auf die Referenzzeitskala des Netzes, ausgewertet als vorhergesagte Hüllkurve ab dem letzten Fix bei einem angegebenen Abdeckungsfaktor. Das ist, was <c1/> ist: Weil jeder Term mit <c2/> wächst, ist das Maximum über einen Auslauf der Länge <c3/> gleich <c4/>. MTIE und TDEV bleiben als Diagnosen nützlich: TDEV, um zu erkennen, welchen Rauschterm man angehen sollte, MTIE(L), um zu begrenzen, wie stark sich der Fehler während eines Slots der Länge <c5/> bewegt.

# text
seg-51d4ee8484d7 = Zwei Verfeinerungen, die die Wahl der Metrik nahelegt:

# text
# c1: guard/√2
# c2: guard/2
seg-a52524111ed7 = <b>Der Guard gilt für den relativen Fehler zwischen zwei Knoten.</b> Wenn Sender und Empfänger beide unabhängig auslaufen, addieren sich ihre stochastischen Fehler quadratisch und ihre deterministischen Fehler im Betrag. Wenn der stochastische Anteil dominiert, kann jedem Knoten <c1/> zugewiesen werden; wenn Alterung oder Temperatur dominieren, <c2/>.

# text
seg-073fe7cd8e63 = Der Abdeckungsfaktor ist eine Entwurfsentscheidung, keine Eigenschaft der Uhr.

# text
# c1: k = 3
seg-eb1cbf9fda2d = <c1/> begrenzt etwa { "99.7" } % der gaußschen Fehler zu einem Zeitpunkt, nicht über jeden Slot an einem Tag; ein Routingplan mit vielen Slots pro Tag braucht das Risiko pro Slot, das er tolerieren kann.

# text
seg-04734b8a115b = Spoofing eines Empfängers im Orbit

# text
# c1: spoofing
# c2: orbital_timing::orbital_timing
seg-9e734bbda345 = Der Abschnitt <c1/> wertet <c2/> für dieselbe Uhr aus:

# text
# c1: ρ
# c2: ρ
# c3: ramp_limited_pull_ns
seg-a2f21a643389 = <b>Geometrie.</b> Ein Spoofer am Boden erreicht einen LEO-Satelliten nur, solange der Satellit über seinem Horizont steht: bei { "550" } km höchstens etwa zwölf Minuten je Überflug im Zenit. Ein Spoofer, der mit der Rate <c1/> rampt, kann die Uhr daher höchstens um <c2/> mal dieses Fenster verziehen, oder mal die Lücke bis zur nächsten unabhängigen Prüfung, falls diese kürzer ist (<c3/>).

# text
seg-ff59489b08b8 = <b>Dynamik.</b> Ein gleichförmiger Zeitzug verschiebt jede Pseudoentfernung gleichermaßen und wird vom Uhrenbias aufgenommen, nicht von der Position, sodass eine Positionsprüfung mit einem Bahnpropagator nicht als Kreuzprüfung der Zeitgebung zählt.

# text
# c1: tpl
seg-4302cc49b91f = <b>Kreuzprüfungen.</b> Ein Satellit hat selten einen zweiten unabhängigen Zeitempfänger. Er hat den Auslauf seiner eigenen Uhr (den Monitor von <c1/>), einen Zwei-Wege-Zeitvergleich mit einer Bodenstation während der Kontakte und Zeitvergleiche über Inter-Satelliten-Verbindungen. Eine Querverbindung ist von einem einzelnen Boden-Spoofer nur dann unabhängig, wenn der Nachbar im selben Moment außerhalb des Einflussbereichs dieses Spoofers liegt, was der Bericht anhand der Zahl der Satelliten je Ebene prüft.

# text
# c1: tpl::timing_protection_level_ns
seg-16c15664a51c = <b>Bedingte Grenze.</b> Der Monitor-Sockel plus der Auslauf der Uhr über die Erkennungslatenz des CUSUM, was sich exakt auf <c1/> reduziert, wenn die Uhr keinen Flicker-, Weißphasen- oder Random-Run-Term hat. Wie diese Grenze gilt sie nur bei erfolgter Erkennung.

# text
# c1: DECEIVED-TIME.md
seg-f7678693be22 = Alles davon ist MODELLED: eine kugelförmige, nicht rotierende Erde, ein Überflug im Zenit, ein terrestrischer Spoofer mit angegebener maximaler Rampenrate. Die Ankunftsrichtung der Signale an einer zum Zenit zeigenden Antenne ist eine echte Kreuzprüfung, die ein Antennendiagramm braucht und nicht modelliert ist. <a1><c1/></a1> erklärt, warum eine signierte Steuernachricht diese Bedrohung nicht beseitigt.

# text
# c1: fix_sigma_ns
seg-070a4e72b5ea = Frequenzsprünge, Strahlungseffekte und relativistische Frequenzversätze; ein thermisches Modell (die Temperaturänderung ist ein Sprung beim Fix); das Synchronisationsprotokoll selbst (ein Fix setzt den Fehler auf <c1/> zurück).

# text
seg-a2766c0f19d0 = <s1>Zurück</s1>Optische Verbindungen durch die Atmosphäre

# text
seg-85ad3eb72a80 = <s1>Weiter</s1>Telekom-Zeitgebung
