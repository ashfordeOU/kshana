# docs--nmea-training: translations (de)

# text
seg-2247a2344710 = Bedeutung

# text
seg-45425f378b61 = Bedeutung

# text
seg-6940543aa3c0 = Zeichenfolge

# text
seg-f5e7215e6835 = Objekt

# text
seg-c5fb6b91dc68 = Grad

# text
seg-99427ab75a03 = Feld

# text
seg-bbcdd898d24d = Ganzzahl

# text
# c1: docs/NMEA-TRAINING.md
seg-ba00d0453fbf = Quelle: <c1/>

# text
# c1: kshana nmea-scenario
seg-738956d0a4b9 = NMEA-Trainingsströme: <c1/>

# text
seg-3663955f80c7 = Seefahrtsakademien und Simulatorzentren können von Kshana erzeugtes NMEA { "0183" } in einen Brückensimulator oder einen Kartenplotter einspeisen, um Besatzungen darin zu schulen, GNSS-jamming und -spoofing zu erkennen.

# text
# c1: $PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION
# c2: --no-marker
seg-4012bc6376aa = <b>Nur für Training und Tests.</b> Die erzeugten Ströme sind synthetisch. Sie dürfen niemals in die laufenden Navigationssysteme eines Schiffes eingespeist werden. Kshana ist beratend, keine typzugelassene Navigationsausrüstung. Jeder Strom beginnt mit einem proprietären Markierungssatz und wiederholt ihn alle zehn Sekunden, <c1/>, den Empfänger ignorieren; <c2/> entfernt ihn für einen Simulator, der unbekannte Sätze ablehnt. Dies schreibt NMEA <b>nur als Text</b>: Es gibt keine HF-, IQ- oder Wellenformausgabe, und nichts sendet außer dem Text an die Adresse, die Sie benennen.

# attr:alt
seg-b66ff9ca2ff4 = Trainingsstrom aus dem Szenario coastal-drag-off (Engine v{ $version }, Seed { "22" }, { "25" } Minuten bei einem Fix je { "10" } s des Ausbilderlogs). Eine Karte zeigt die wahre Spur des Schiffes und die vom Empfänger berichtete Spur: Sie stimmen überein, bis bei { "421" } s ein geskriptetes Wegziehen der Position beginnt, die berichtete Spur sich dann von der wahren entfernt, während der Empfänger einen gültigen Fix behält, und bei { "1140" } s, wenn das Ereignis endet, zurückspringt. Daneben der Abstand zwischen den beiden Spuren über die Zeit und die mittlere Träger-Rausch-Leistungsdichte, die der Empfänger berichtet und die während des Ereignisses auf einen einzigen erhöhten Pegel steigt. Synthetische Trainingsdaten, von Kshana erzeugt. Nur für Training und Tests: Speisen Sie diesen Strom niemals in die laufenden Navigationssysteme eines Schiffes ein. Beratend, keine typzugelassene Navigationsausrüstung. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich. Positionen, Daten und Spuren sind erfunden.

# text
# c1: scenarios/training/coastal-drag-off.toml
seg-1f70c2c761ac = Die Abbildung ist aus dem Ausbilderlog von <c1/> gezeichnet.

# text
seg-32b620b3574e = Verwendung

# text
seg-9cbd24964be4 = Option

# text
# c1: <name>.nmea
seg-aadcf289aed2 = den Strom in eine Datei schreiben; ohne Netzwerkausgabe ist der Standard <c1/>

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-a3fc46437059 = <c1/> und <c2/> schreiben (Standard: neben der Datei)

# text
# c1: --tcp <addr:port>
# c2: <port>
seg-14dad363af8a = <c1/> oder <c2/>

# text
# c1: --wait-clients <n>
# c2: 127.0.0.1
seg-8e105cf0979b = TCP-Server; der Lauf beginnt, wenn sich ein Client verbunden hat (<c1/>). Ein bloßer Port lauscht nur auf <c2/>

# text
# c1: --udp <addr:port>
# c2: <port>
seg-63ee193b90b4 = <c1/> oder <c2/>

# text
# c1: --broadcast
# c2: 127.0.0.1
seg-fc322c7ce2db = UDP, ein Satz je Datagramm; <c1/> erlaubt eine Broadcast-Adresse. Ein bloßer Port sendet an <c2/>

# text
# c1: --speed 0
seg-8ca50e2a4b8d = den Strom takten; <c1/> ist so schnell wie möglich. Die Netzwerkausgabe läuft standardmäßig in Echtzeit, Dateien so schnell wie möglich

# text
seg-97b82dfe97a7 = den Seed des Szenarios ersetzen

# text
seg-86ac66fd2771 = den Markierungssatz weglassen

# text
seg-f6cc05a6d39a = <b>Es gibt keine Authentifizierung.</b> Ein TCP-Server mit einer nicht lokalen Adresse liefert den Strom an jeden, der ihn erreichen kann, und UDP sendet an jede Adresse, die Sie benennen. Ein TCP-Client, der seine Daten nicht innerhalb von zwei Sekunden abnimmt, wird getrennt, sodass ein blockierter Verbraucher die anderen nicht aufhalten kann.

# text
seg-b4abb5a132ba = Derselbe Seed ergibt auf einer Plattform dieselben Bytes, und das Takten ändert die Bytes nie. Plattformübergreifend ist die eigene Arithmetik des Generators bitidentisch (er verwendet die portable Mathematikschicht), aber Satellitenpositionen und Blickwinkel stammen aus Funktionen der Engine, die die Mathematikbibliothek des Hosts aufrufen, sodass in einem seltenen Grenzfall eine gerundete Stelle von Elevation, Azimut oder C/N0 in GSV sich zwischen Plattformen unterscheiden kann.

# text
seg-97e31fc7f0d1 = Was geschrieben wird

# text
# c1: GN
seg-632a4ca26567 = Jede Epoche ({ "1" }, { "2" }, { "5" } oder { "10" } je Sekunde) enthält: <b>RMC, GGA, GNS</b> (Fix, Position, Zeit), <b>GSA</b> (verwendete Satelliten und DOP, einer je Konstellation), <b>GSV</b> (Satelliten in Sicht mit Elevation, Azimut und SNR in dB-Hz, ein Satz je Konstellation, NMEA-{ "4.10" }-Signal-ID), <b>VTG</b> (Kurs und Geschwindigkeit über Grund), <b>ZDA</b> (Zeit und Datum), <b>HDT</b> (Kreiselpeilung) und <b>VBW</b> (Wasser- und Grundgeschwindigkeit aus dem Log). Der Talker ist <c1/> bei mehreren Konstellationen, sonst der eigene der Konstellation. Zeilen enden in CRLF und haben gültige Prüfsummen.

# text
seg-942803ad8c49 = HDT und VBW stehen für unabhängige Sensoren (einen Kreiselkompass und ein Doppler-Log). <b>Kein Ereignis berührt sie</b>, was beabsichtigt ist: Die Lücke zwischen dem, was GNSS berichtet, und dem, was Kreisel und Log sagen, ist ein Hinweis für die Nachbesprechung.

# text
# c1: V
seg-2d9a9ea38dde = Wenn der Fix verloren geht, ist die Qualität von GGA { "0" }, der Status von RMC <c1/>, die Positionsfelder sind leer und die Zeitfelder laufen weiter (die Uhr des Empfängers läuft weiter), wie bei echten Empfängern.

# text
seg-c1c51ff381e7 = Das Schiff

# text
# c1: [vessel]
# c2: [[waypoint]]
# c3: max_rot_deg_per_min
# c4: max_rot_accel_deg_per_s2
# c5: max_accel_kn_per_min
# c6: speed_kn
# c7: [environment]
# c8: stop_at_end
seg-ada150c912eb = <c1/> und <c2/> geben eine Startposition, eine Geschwindigkeit und die Punkte an, durch die gesteuert wird. Das Schiff wird unter einer <b>Begrenzung der Drehrate</b> (<c3/>, Standard { "30" }), einer Begrenzung, wie schnell die Drehrate anwächst (<c4/>), und einer <b>Begrenzung der Geschwindigkeitsänderung</b> (<c5/>) zum nächsten Wegpunkt gesteuert. Die Geschwindigkeit eines Abschnitts ist der Wert <c6/> des Wegpunkts. <c7/> fügt eine Strömung hinzu, sodass sich die Geschwindigkeit über Grund von der Geschwindigkeit durchs Wasser und der Steuerkurs vom Kurs über Grund unterscheidet, sowie eine magnetische Missweisung. <c8/> bringt das Schiff am letzten Wegpunkt zum Stillstand.

# text
seg-4fc2cb8a1388 = Satellitengeometrie

# text
# c1: constellation::satellite_positions_fixed
# c2: [receiver]
# c3: track_threshold_dbhz
# c4: use_threshold_dbhz
# c5: max_used
# c6: reacquire_s
seg-b97bd86ed3a4 = Satelliten stammen aus den eigenen nominalen Konstellationen der Engine (GPS-Slot-Tabelle, Walker-Muster für Galileo und BeiDou MEO, GLONASS-ICD), propagiert durch <c1/> (Zweikörper plus säkulares J2, Erdrotation) und vom Schiff aus mit den WGS-84-Blickwinkeln der Engine gesehen. Die sichtbare Anzahl, die Elevationen und Azimute in GSV sind für den Ort und die Tageszeit plausibel. <b>Dies ist ein nominaler Himmel, keine Ephemeride für das Datum des Stroms</b>: PRNs werden in der Reihenfolge der Slots vergeben, und jede Konstellation behält ihr veröffentlichtes Slot-Layout, kontinuierlich ab der Epoche der GPS-Slot-Tabelle (2016-12-31) unter J2 propagiert, sodass das Layout intakt ist, seine Orientierung aber nicht die des realen Himmels am Datum des Stroms. C/N0 folgt der Elevation (ein nominaler Zenitpegel, gesetzt in <c2/>), mit einem festen Versatz je Satellit, langsamem Fading und Rauschen. Ein Satellit unter <c3/> hat ein leeres SNR-Feld; einer unter <c4/> wird verfolgt, aber nicht verwendet. Bis zu <c5/> (Standard { "12" }, die Obergrenze von NMEA GGA) nutzbare Satelliten werden verwendet, nach der Geometrie gewählt (zuerst der höchste Satellit in jedem Azimutsektor von { "30" } Grad). Weniger als vier nutzbare Satelliten verlieren den Fix, und er kehrt nach <c6/> nutzbaren Signals zurück.

# text
seg-f2be7442bdf2 = Ereignisse

# text
# c1: [[event]]
# c2: kind
# c3: start_s
# c4: duration_s
# c5: ramp_s
# c6: recovery_s
# c7: ramp_s
# c8: recovery_s
# c9: 0
seg-db86ed4b40a9 = Jedes <c1/> hat ein <c2/>, einen Einsatz <c3/>, eine <c4/> (vom Einsatz bis zum Beginn der Freigabe), eine Einsatzrampe <c5/> und eine Freigaberampe <c6/>. Die Stärke steigt linear über <c7/>, wird gehalten und fällt dann über <c8/>; <c9/> ist ein Sprung. Alle Wirkungen skalieren mit dieser Stärke. Parameter, die nicht zur Art gehören, werden abgelehnt.

# text
seg-3255e99c7265 = Art

# text
seg-9285a9d699c0 = Parameter

# text
seg-e83c9db4f9c7 = Wirkung

# text
# c1: cn0_drop_db
# c2: spread_db
seg-e96ef358529d = <c1/>, <c2/> (Standard { "6" })

# text
# c1: cn0_drop_db
# c2: reacquire_s
seg-cd6030834371 = das C/N0 jedes Satelliten fällt um bis zu <c1/> (Streuung je Satellit), Satelliten fallen zuerst mit dem niedrigsten Wert aus, der Fix geht verloren, wenn weniger als vier nutzbar sind, und kehrt nach der Freigabe und <c2/> zurück

# text
# c1: final_offset_m
# c2: bearing_deg
# c3: relative_bearing_deg
# c4: max_accel_mps2
# c5: counterfeit_cn0_dbhz
seg-e5a66c9c3627 = <c1/>, eines von <c2/> (wahr) oder <c3/> (zum Kurs <b>beim Einsatz</b>, dann gehalten), optional <c4/>, <c5/>

# text
# c1: 1.5 D/T
# c2: 6 D/T^2
# c3: T
# c4: D
# c5: max_accel_mps2
# c6: ramp_s = 0
seg-d7d967a60275 = der Empfänger behält einen <b>gültigen Fix</b>, dessen Position sich von der Wahrheit entfernt; SOG und COG enthalten das Wegziehen. Das Wegziehen folgt auf den Rampen einer Smoothstep-Funktion, sodass die falsche Spur ohne Geschwindigkeitssprung beginnt und endet; seine Spitzen sind <c1/> m/s und <c2/> m/s zum Quadrat bei einer Rampe von <c3/> s über <c4/> m (beide protokolliert), und ein Szenario, das <c5/> überschreiten würde, wird abgelehnt. Ein Sprung (<c6/>) verschiebt die Position, ohne die Geschwindigkeit zu berühren

# text
seg-7da039c3262e = Die Zeit von RMC, GGA, GNS und ZDA wird von der wahren UTC verschoben; die Position bleibt wahr

# text
# c1: delay_s
# c2: affect_time
# c3: counterfeit_cn0_dbhz
seg-ead3ce0162fb = <c1/>, <c2/> (Standard true), <c3/>

# text
# c1: delay_s
# c2: 1 - d(delay)/dt
seg-a1bdb89334df = Position, Geschwindigkeit (und Zeit) sind die des Schiffes von vor <c1/>, wobei die Verzögerung auf ihren Rampen einer Smoothstep-Funktion folgt und die berichtete Geschwindigkeit mit <c2/> skaliert wird, solange sie sich ändert: eine vereinfachte Abstraktion im Stil von meaconing, kein Ausbreitungsmodell

# text
# c1: counterfeit_cn0_dbhz
# c2: reacquire_s
# c3: combined-event
# c4: ramp_s = 0
seg-6f435224f7fb = <c1/>: Solange ein Wegziehen, ein Zeit-Spoofing oder eine Wiedergabeverzögerung aktiv ist, zeigt jeder verfolgte Satellit diesen einen erhöhten Pegel, ein klassisches Zeichen. Lassen Sie es bei einem subtilen Ereignis weg, bei dem das echte C/N0-Muster erhalten bleibt. Solange irgendein Fälschungsereignis aktiv ist, folgt der Empfänger dem gefälschten Signal, sodass jamming ihn nicht ausfallen lässt; ein durch früheres jamming verlorener Fix kehrt nach <c2/> auf dem gefälschten Signal zurück (siehe <c3/>). Eine Zeitänderung, die die berichtete Zeit anhalten oder rückwärts laufen ließe (Rate von { "1" } s je Sekunde oder mehr), wird abgelehnt, außer sie ist ein Sprung (<c4/>).

# text
# c1: onset
# c2: start_s
seg-894aceb32c5c = Ereignisse dürfen sich überlappen; ihre Wirkungen addieren sich (Versätze, Zeitänderungen, Verzögerungen) oder die stärkste gilt (jamming). Der <c1/> der Zeitleiste ist die erste Epoche, in der das Ereignis eine Wirkung hat, eine Epoche nach dem geskripteten <c2/>, wenn das Ereignis eingerampt wird.

# text
seg-09e311ade9e6 = Das Ausbilderlog

# text
# c1: <prefix>.instructor.json
# c2: <prefix>.instructor.txt
seg-80933b9bdf0d = Zusammen mit dem Strom liefern <c1/> und <c2/>:

# text
seg-51930977a6fe = die Ereignisse wie eingespeist, in einfacher Sprache mit jedem Parameter, und ihren UTC-Einsatz;

# text
# c1: fix-lost
# c2: fix-regained
seg-4eab197c487b = eine Zeitleiste: Einsatz, volle Wirkung, Beginn der Erholung, erholt, und die eigenen <c1/> und <c2/> des Empfängers;

# text
# c1: log_interval_s
seg-af2eb88f14d0 = die wahre Spur gegen die berichtete im Abstand <c1/>: wahre und berichtete Position, Geschwindigkeit und Kurs, Positionsfehler in Metern, Zeitversatz, verwendete und verfolgte Satelliten, mittleres C/N0 und welche Ereignisse aktiv waren;

# text
seg-303f5fbe0351 = die Spitzengeschwindigkeit und -beschleunigung der wahren und der berichteten Spur;

# text
# c1: trainer_note
seg-593a4a1ef296 = der <c1/> des Szenarios.

# text
seg-8c4aebcd0eff = Zeigen Sie das Log erst bei der Nachbesprechung.

# text
# c1: kshana-nmea-training/1
seg-dd1780910af7 = JSON-Felder (Schema <c1/>)

# text
seg-60b5b11cdc0b = Typ, Einheit

# text
seg-f4963d090155 = die Aussage, nur für Training zu gelten

# text
seg-7ad14e03d9e4 = aus dem Szenario

# text
seg-fac0fb50b31b = verwendeter Seed

# text
seg-f05d18516bd8 = ISO { "8601" } UTC

# text
seg-8752c09baa6a = Beginn des Laufs

# text
seg-f0d8bb5aafef = Länge des Laufs

# text
seg-0989e14f1e51 = Knoten

# text
seg-b657b979a455 = höchste wahre und berichtete Geschwindigkeit über Grund

# text
seg-24e947df31ae = m/s zum Quadrat

# text
seg-a1ca3847c8d8 = größte Geschwindigkeitsänderung je Sekunde, wahr und zwischen aufeinanderfolgenden berichteten Fixes

# text
seg-e1daadeb7d48 = eines je geskripteten Ereignis

# text
# c1: timeline[].event
# c2: track[].active_events
seg-3aaa0108ac1e = 1-basiert; verwendet von <c1/> und <c2/>

# text
seg-6bbb9db14f7b = Beschreibung in einfacher Sprache mit den Parametern

# text
seg-2f3eac27a997 = geskripteter Einsatz

# text
# c1: kind
# c2: start_s
# c3: duration_s
# c4: ramp_s
# c5: recovery_s
seg-4255c67f3db5 = das Ereignis genau wie geschrieben (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> und die eigenen Parameter der Art; fehlende werden weggelassen)

# text
seg-88db26711d77 = Grad wahr oder null

# text
seg-2f30c3d8b17b = Wegziehen: die angewandte Richtung (eine relative Peilung wird beim Einsatz aufgelöst)

# text
seg-55d6dd667365 = m/s, m/s zum Quadrat oder null

# text
seg-021df000164f = Wegziehen: die Spitzen, die das Wegziehen zur falschen Spur hinzufügt

# text
seg-d3a2c65ebcd4 = Momente für die Nachbesprechung, in zeitlicher Reihenfolge

# text
seg-b2b72301c1c9 = s ab Beginn, ISO { "8601" } UTC

# text
seg-34e24e21ac7e = wann (wahre Zeit)

# text
seg-cf29ba5ed968 = ganze Zahl oder null

# text
seg-8dbc5e7239be = die Ereignis-ID; null bei Zustandsänderungen des Empfängers

# text
# c1: onset
# c2: full-effect
# c3: recovery-begins
# c4: recovered
# c5: fix-lost
# c6: fix-regained
seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (Ereignisse); <c5/>, <c6/> (Empfänger)

# text
seg-cd7c4057601b = Erläuterung

# text
# c1: log_interval_s
seg-90e65cbe1a59 = eine Zeile je <c1/>

# text
seg-a57e27a3c470 = s, ISO { "8601" } UTC

# text
seg-24376fe24496 = wahre Position

# text
seg-f23b251a0e33 = Knoten, Grad wahr

# text
seg-242c1f2ccbd3 = wahre Geschwindigkeit und wahrer Kurs über Grund sowie Kreiselpeilung

# text
seg-696dd61f8bbb = boolesch

# text
seg-ea264ef0395c = der Empfänger berichtete einen Fix

# text
seg-b073b87a813e = Grad, Knoten, Grad wahr oder null

# text
seg-b56345697092 = was der Empfänger berichtete; null, solange der Fix verloren ist

# text
seg-c4a33c03d9da = m oder null

# text
seg-463f6fc42ae5 = horizontaler Abstand von der wahren zur berichteten Position

# text
seg-b68dfce8d81d = berichtete UTC minus wahre UTC

# text
seg-ec28faa1efcc = ganze Zahlen

# text
seg-2bf397f77392 = im Fix verwendete und verfolgte Satelliten

# text
seg-96b87348e90e = dB-Hz oder null

# text
seg-40f30b4a88cf = mittleres C/N0 der verfolgten Satelliten

# text
seg-3671c8aa3c1a = IDs der Ereignisse mit einer Wirkung in diesem Augenblick

# text
# c1: /2
seg-8401fa92aae1 = Das Hinzufügen eines Feldes ändert das Schema-Tag nicht. Das Umbenennen oder Entfernen eines Feldes oder das Ändern der Bedeutung oder Einheit eines Feldes erhöht die Nummer (<c1/>).

# text
seg-656ee92a3130 = Die Szenariobibliothek

# text
# c1: scenarios/training/
seg-82a888587138 = <c1/>, je einige Minuten Fahrt mit einem Trainerhinweis in ihrer TOML:

# text
seg-665b9b46b49b = Datei

# text
seg-11ed1f85d4be = was sie zeigt

# text
seg-50ffa85a1128 = C/N0 fällt gemeinsam, Satelliten fallen aus, der Fix geht verloren und kehrt zurück

# text
seg-10bc30b9c57b = ein gültiger, gesund aussehender Fix wird { "1.4" } km zum Ufer hin gezogen; einheitlich erhöhtes C/N0

# text
seg-f141692988e4 = Position korrekt, UTC läuft während einer langsamen Hafeneinfahrt { "45" } s voraus

# text
seg-ce06a5ebdd42 = jamming, dann Übernahme durch Fälschung mit Wegziehen und Zeitversatz, dann eine Wiedergabeverzögerung

# text
# c1: fjord
# c2: natural-degradation
# c3: skyline
seg-3fbcfd1dd26a = ein verdeckter Himmel, keine Störung: Die Wände eines Fjords (das REPRESENTATIVE Skyline-Preset <c1/>) verdecken die Satelliten im Osten und Westen, dann öffnet sich der Kanal wieder (Ereignis <c2/>, mit einer Tabelle <c3/>)

# text
seg-5462f6b21fae = Positionen, Daten und Spuren sind erfunden; die Bibliothek enthält kein reales Schiff, keinen realen Betreiber und keine reale Aufzeichnung. Sie trifft keine Aussage darüber, wie sich irgendein Empfänger oder System gegenüber Störung verhalten würde.

# text
seg-9831ab537b36 = Modellierungsentscheidungen

# text
# c1: [receiver]
# c2: [vessel]
seg-76a0e0eb57b3 = Der Generator ist ein Trainingswerkzeug ohne externe Referenz, und seine Zahlen sind Modellierungsentscheidungen, keine Messungen irgendeines Empfängers. Sie sind so gewählt, dass sie wie das Log eines gewöhnlichen Empfängers aussehen: die Steigung von C/N0 von { "14" } dB vom Zenit zum Horizont unterhalb des Zenitpegels (Standard { "47" } dB-Hz) und der Versatz je Satellit von +/-1.5 dB, langsames Fading von { "0.8" } dB über { "97" } s und { "0.5" } dB über { "31" } s, { "0.3" } dB Jitter; die Schwellen für Verfolgung ({ "20" } dB-Hz) und Verwendung ({ "28" } dB-Hz); das Positionsrauschen ({ "1.5" } m bei HDOP { "1" }, korreliert über { "30" } s, vertikal doppelt so groß); { "0.05" } Grad Kreiselrauschen und { "0.03" } kn Abdriftrauschen; die Zeitkonstante der Steuerung von { "20" } s und die Ankunftsradien der Wegpunkte des Schiffsmodells; und die Wahl der Satelliten nach Azimutsektor. Die Standardwerte stehen in <c1/> und <c2/> und lassen sich im Szenario alle ändern.

# text
seg-84913be532a0 = Zurücklesen

# text
# c1: kshana receiver-trust
# c2: format = "nmea"
# c3: tests/fixtures/nmea_training/
# c4: KSHANA_BLESS_GOLDEN=1
seg-fbf4002d25cd = <c1/> kann diese Dateien einlesen (<c2/>). Die Tests prüfen jeden Satz jedes Szenarios der Bibliothek gegen seine eigenen Regeln für Feldanzahl und Prüfsumme und führen die Dateien durch diesen Leser, der GGA, RMC und GSV interpretiert und die anderen Typen übergeht, ohne welche zu überspringen. Tests legen je Szenario einen goldenen Ausschnitt fest (<c3/>); nach einer beabsichtigten Änderung mit <c4/> neu erzeugen.

# text
seg-b94fbc3b1dd3 = <s1>Zurück</s1>Maritimes Vertrauen

# text
seg-ecdf748cb63d = <s1>Weiter</s1>Störungskarte und Routenexposition

# text
seg-24ad8471ff2a = JSON-Felder (Schema kshana-nmea-training/1)
