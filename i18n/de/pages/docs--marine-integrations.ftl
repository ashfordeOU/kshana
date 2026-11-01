# docs--marine-integrations: translations (de)

# text
seg-2e34ace70d11 = Signal-K-Plugin

# text
seg-0857a94a948e = Grenzen

# text
seg-2247a2344710 = Bedeutung

# text
seg-c3c260b7063e = Tests

# text
seg-06ff6eed7e99 = OpenCPN

# text
seg-ab1af8b3d968 = siehe oben

# text
seg-c353e7bec219 = Schlüssel

# text
seg-df52127d74b6 = Wo

# text
seg-7670cf4ceda3 = Standard

# text
# c1: docs/MARINE-INTEGRATIONS.md
seg-7e304f816037 = Quelle: <c1/>

# text
seg-fb2b0841a172 = Maritime Integrationen: der Vertrauenswert auf der Brücke

# text
# c1: MARITIME-TRUST.md
seg-a88b3968c706 = Der maritime Vertrauenswert von Kshana (<a1><c1/></a1>) ist aus Software erreichbar, die Bootsfahrer bereits nutzen: ein <b>Signal K</b>-Server-Plugin und <b>OpenCPN</b> über Gate-Modus-NMEA per TCP. Ein Referenzaufbau bringt ihn auf einen kleinen Rechner neben dem Empfänger.

# text
seg-eb8043b9e269 = <b>Beratende Software.</b> Kshana ist keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }) und wurde an keinem Leistungsstandard bewertet. Alles auf dieser Seite ist eine Hilfe für das Urteil des Navigators. Der Betreiber bleibt für die sichere Navigation des Schiffes und für jede Entscheidung verantwortlich, sich auf eine Lösung zu verlassen oder sich nicht mehr auf sie zu verlassen. Nichts hier sendet, und nichts hier macht eine Lösung genauer.

# text
seg-dab66f260e56 = Baustein

# text
seg-40fd2019e974 = Status in { "0.35" }

# text
seg-7bcecf49199c = ausgeliefert, an aufgezeichneter synthetischer Ausgabe einem Unit-Test unterzogen; nicht auf npm veröffentlicht

# text
seg-d5278e683d37 = OpenCPN über Gate-Modus-NMEA per TCP

# text
seg-a876f5d43e39 = ausgeliefert und getestet (Wiedergabe auf Verbraucherseite); die Benutzeroberfläche von OpenCPN selbst wird von keinem Test gesteuert

# text
seg-4a6d2f45b403 = natives Score-Panel-Plugin für OpenCPN

# text
# c1: integrations/opencpn/evidence/
seg-b0d4d32612e9 = gebaut, Logik einem Unit-Test unterzogen und in OpenCPN { "5.8.4" } unter einem virtuellen Display ausgeführt (Nachweis in <c1/>); nicht für den Plugin-Manager paketiert; wird erst nach Prüfung ausgeliefert

# text
seg-2e0058b5e057 = Referenzaufbau

# text
seg-959d93e3a56d = Teile, Betriebssystemschritte, systemd-Units (per Trockenlauf geprüft), eine Container-Option; nicht auf einem Schiff getestet

# text
# c1: kshana receiver-trust live
# c2: $PKSHT
# c3: MARITIME-TRUST.md
# c4: integrations/signalk/lib/adapter.js
seg-8524cb32f0a3 = Alles liest eine einzige Sache: die Ausgabe von <c1/> (JSON-Zeilen, der Satz <c2/>, das Gate). Die Übertragungsformate stehen in <a1><c3/></a1>. Das Signal-K-Plugin hält sein Wissen darüber in einer einzigen Datei, <c4/>; eine Formatänderung ist eine Änderung an einer Datei.

# text
# c1: signalk-server
# c2: integrations/signalk/
# c3: node_modules
# c4: ~/.signalk/node_modules/signalk-kshana-trust
seg-e5b08ab63d78 = Keine npm-Abhängigkeiten. Das Plugin selbst läuft auf Node { "18" } oder neuer; aktuelle <c1/>-Versionen brauchen Node { "22" } oder neuer, nutzen Sie in der Praxis also { "22" }. Kopieren oder verknüpfen Sie <c2/> in das <c3/> des Servers (zum Beispiel <c4/>), starten Sie den Server neu und aktivieren Sie <b>Kshana GNSS trust</b> unter Server, Plugin Config.

# text
# c1: source
seg-fd80525d7dd1 = Woher die Epochen kommen (<c1/>)

# text
seg-013478c9a701 = Was das Plugin tut

# text
# c1: spawn-signalk-nmea
seg-abbd00e9cacf = <c1/> (Standard)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: nmea0183
# c3: spawn-args
# c4: --tcp
# c5: tcp-pksht
seg-8ca5f95ed09d = Führt <c1/> aus und schreibt jeden rohen NMEA-{ "0183" }-Satz, den der Server empfängt (das Ereignis <c2/> des Servers), auf dessen Standardeingabe. Startet es mit Back-off neu, wenn es endet | <b>Verwenden Sie es nur auf einem Server mit einer einzigen NMEA-Quelle</b>: Es speist jeden Satz von jedem Provider verschachtelt ein, sodass ein zweiter GNSS-Empfänger oder AIS wie ein Empfänger aussieht, dessen Position springt, und als Spoofing bewertet werden kann. Bei mehr als einer Quelle verwenden Sie <c3/> mit dem eigenen <c4/>-Strom dieses Empfängers oder <c5/> von einem Gate.

# text
# c1: kshana receiver-trust live <sessionFile> <inputArgs...>
# c2: ["--tcp","192.0.2.10:10110"]
# c3: ["--udp","10110"]
seg-3b3eadcffb90 = Führt <c1/> aus, zum Beispiel <c2/> oder <c3/>

# text
# c1: kshana
# c2: integrations/opencpn/
seg-d69b5ebe1042 = Verbindet sich mit einem Feed der JSON-Zeilen, die <c1/> schreibt (zum Beispiel vom Relay in <c2/>)

# text
# c1: $PKSHT
seg-cd5a419844cc = Verbindet sich mit einem NMEA-Strom (etwa der Gate-Ausgabe des Dienstes oder Containers im Referenzaufbau, Port { "10110" }) und liest nur dessen <c1/>-Sätze

# text
# c1: calibration_s
seg-f17c9b7d7abc = Ein Strom, der bereits gespooft wird, wenn sich der Monitor zum ersten Mal verbindet, hat keine saubere Basislinie (die ersten <c1/> Sekunden werden nie bewertet). Starten Sie ihn vor der Fahrt.

# text
seg-33fc47100aa6 = Veröffentlichte Pfade

# text
# c1: kshana-trust
seg-f032afe8b331 = Jede Epoche aktualisiert (Quelle <c1/>):

# text
seg-b809eaf502ad = Pfad

# text
# c1: calibrating
# c2: nominal
# c3: degraded
# c4: untrusted
seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> oder <c4/>

# text
# c1: null
seg-d4d4d5d5ec1f = { "0" } bis { "100" } oder <c1/> während der Kalibrierung

# text
# c1: [{monitor, points}]
seg-5280497b5d9f = <c1/>, größte zuerst: welche Prüfungen den Wert gesenkt haben

# text
seg-6089a3166c91 = die Monitore, die derzeit über ihrem Schwellenwert liegen

# text
# c1: off
# c2: passed
# c3: withheld
# c4: null
# c5: $PKSHT
seg-55280b62eb19 = <c1/>, <c2/> oder <c3/> (wenn anderswo ein Gate läuft; <c4/> von <c5/>, wenn keines vorhanden ist)

# text
# c1: {latitude, longitude, altitude}
# c2: $PKSHT
# c3: kshana
# c4: navigation.position
seg-963da9c0d2a3 = <c1/>: die Position, die der zu prüfende Empfänger in dieser Epoche gemeldet hat (JSON-Schema { "1.1" } oder neuer; nicht veröffentlicht, wenn der Strom keine trägt, zum Beispiel von <c2/> oder einem älteren <c3/>). <b>Nur Vertrauenskontext</b>: Das Plugin schreibt nie <c4/>, sodass der eigene Positionspfad des Schiffes unberührt bleibt

# text
# c1: {state, method, message}
seg-50599cef740d = ausgelöst, wenn sich der Zustand ändert: <c1/>

# text
# c1: score
# c2: reasons[].points
seg-ad58b4599f78 = Das Plugin sendet außerdem einmal beim Start Signal-K-Metadaten für diese Pfade. <c1/> ist der Vertrauenswert von Kshana von { "0" } bis { "100" }, ein Wert und kein Verhältnis oder eine Wahrscheinlichkeit, daher trägt er keine SI-Einheit; seine Metadaten geben den Bereich, eine Beschreibung und Zonen an, die den Schwellenwerten unten folgen. <c2/> sind Wertpunkte, die von diesem Wert von { "0" } bis { "100" } abgezogen werden.

# text
# c1: normal
# c2: alert
# c3: warn
# c4: alarm
# c5: normal
# c6: null
# c7: null
# c8: normal
# c9: warn
# c10: alarm
# c11: method: ["visual","sound"]
# c12: clearAfterEpochs
# c13: staleAfterS
# c14: $PKSHT
# c15: alarms
seg-bf0c90f5c02a = Die Benachrichtigung ist <c1/>, <c2/>, <c3/> oder <c4/>. Sie wird gelöscht, indem der Zustand <c5/> veröffentlicht wird, nicht <c6/>: Ein Verbraucher, der nur <c7/> als gelöscht behandelt, sollte auch <c8/> als gelöscht behandeln. Standardmäßig ergibt das Band <b>degraded</b> den Wert <c9/> und das Band <b>untrusted</b> den Wert <c10/>, mit <c11/>. Sie wird nach <c12/> Epochen bei einem besseren Zustand zurückgenommen. Trifft für <c13/> Sekunden keine Epoche ein, warnt sie, dass der Wert nicht aktualisiert wird. Die Kalibrierung löst nie eine Benachrichtigung aus. Die Quelle <c14/> trägt keine Liste <c15/> (der Satz hat nur das Band, den Wert und die beiden wichtigsten Gründe).

# text
seg-89cdf02b58e3 = Konfiguration (jeder Schwellenwert)

# text
seg-d7bdd78470ec = die ausführbare Datei (Spawn-Modi). <b>Sie führt jede ausführbare Datei als Benutzer des Servers aus</b>: Nur ein Administrator des Signal-K-Servers sollte die Plugin-Konfiguration ändern können

# text
seg-73091c431bcf = die Grenzen, Schwellenwerte und Wertgewichte des Schiffes (Spawn-Modi)

# text
# c1: kshana receiver-trust live <sessionFile>
# c2: spawn-args
# c3: --replay
# c4: spawn-signalk-nmea
# c5: --gate
# c6: --listen
# c7: --json
# c8: --pksht
# c9: kshana
# c10: spawn-signalk-nmea
# c11: --stdin
# c12: --file
# c13: --tcp
# c14: --udp
# c15: --follow
# c16: --from-end
seg-f5f08c50abc7 = Argumente, die in beiden Spawn-Modi zu <c1/> hinzugefügt werden: die Eingabe für <c2/>, zusätzliche Flags wie <c3/> (ein gespeichertes Log, schneller als in Echtzeit eingespeist) für <c4/>. Das Plugin lehnt <c5/>, <c6/>, <c7/> und <c8/> ab (es liest das JSON von <c9/> auf der Standardausgabe), und für <c10/> auch die Eingabe-Flags (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>)

# text
# c1: tcp-pksht
seg-01caf7ed213f = TCP-Modi (das Gate bedient auf { "10110" }: setzen Sie den Port für <c1/>)

# text
# c1: band
# c2: score
seg-72b911dea6bd = <c1/>: das Band, das Kshana meldet, mit den Grenzen in der Sitzungsdatei. <c2/>: die beiden Werte unten

# text
# c1: score
# c2: degradedState
seg-76ca56821979 = Modus <c1/>: darunter ist der Zustand <c2/> (die Standardgrenze von Kshana für nominal)

# text
# c1: score
# c2: alarm
seg-429d8fc4570f = Modus <c1/>: darunter ist der Zustand <c2/> (die Standardgrenze von Kshana für degraded)

# text
# c1: normal
# c2: alert
# c3: warn
seg-6d5c9e402211 = Zustand für das Band degraded: <c1/>, <c2/> oder <c3/>

# text
seg-e88a2979ef07 = aufeinanderfolgende Epochen bei einem schlechteren Zustand, bevor die Benachrichtigung ausgelöst wird

# text
seg-0eec67224385 = aufeinanderfolgende Epochen bei einem besseren Zustand, bevor sie zurückgenommen wird

# text
# c1: 0
seg-76b52e312539 = warnt, wenn so lange keine Epoche eintrifft; <c1/> schaltet es ab

# text
seg-87d3fcf7fec9 = Benachrichtigungsmethoden

# text
seg-9a455cf4a2f9 = Das Plugin sperrt nicht: Es verändert nie eine Lösung. Eine Lösung für ein Kartensystem als ungültig zu markieren ist das Gate, unten.

# text
# c1: node:test
# c2: 127.0.0.1
# c3: $PKSHT
# c4: kshana receiver-trust live
seg-30f48b177c1c = <c1/>, keine Abhängigkeiten, kein Netzwerk außer <c2/>. Die Tests parsen und spielen einen Auszug von 66 Epochen der JSON-Zeilen und <c3/>-Sätze ab, die <c4/> für die synthetische Ostsee-Demo geschrieben hat (erfundene Daten, nur Text), und prüfen die Übereinstimmung der beiden Formate, das Halte- und Lösch-Verhalten, den Score-Modus, Veraltung und die drei Eingabepfade gegen einen lokalen Feed und einen Stellvertreter-Kindprozess. Diese Tests starten keinen echten Signal-K-Server; ein separater skriptgesteuerter Lauf tut es, siehe unten.

# text
seg-024928983177 = In einem echten Signal-K-Server ausgeführt

# text
# c1: integrations/signalk/evidence/
# c2: signalk-server
# c3: kshana
# c4: reportedPosition
# c5: navigation.position
seg-80b5a217d13c = <c1/> enthält ein Skript, das das Plugin in das festgelegte Paket <c2/> { "2.33.0" } lädt (in einem privaten Netzwerk-Namensraum nur mit Loopback) und aufzeichnet, was die eigenen REST- und WebSocket-APIs des Servers zeigen. Die Vertrauenspfade erscheinen, die Benachrichtigung geht auf warn, alarm, normal (nach der Haltezeit) und wieder auf warn, wenn die Daten ausbleiben, und mit dem echten <c3/>, das über die eigene NMEA-Eingabe des Servers gespeist wurde, veröffentlichte es auch <c4/>, nie <c5/>. Eine Serverversion, ein Lauf, kein echtes Schiff; Grenzen und Reproduktion im Nachweis-README.

# text
# c1: kshana receiver-trust live --gate
seg-fea2e7d140c3 = OpenCPN liest NMEA aus dem Netzwerk, und <c1/> kann den gesperrten Strom selbst auf einem TCP-Port bereitstellen.

# text
seg-92981e13bc6f = Empfohlen: die direkte Verbindung.

# text
# c1: some-nmea-source
# c2: stty
# c3: cat
# c4: --tcp
# c5: --udp
# c6: kshana
# c7: kshana-gate.service
# c8: --listen tcp:<port>
seg-e6caa4d53b9a = (<c1/> ist der serielle Port des Empfängers, gelesen mit <c2/> und <c3/>, ein Multiplexer oder die Eingaben <c4/>/<c5/> von <c6/> selbst; das <c7/> des Referenzaufbaus tut dies unter systemd.) <c8/> bindet an die Loopback-Adresse; beliebig viele nur lesende Clients können sich verbinden, und einer, der nicht mithalten kann, wird fallen gelassen, ohne die anderen zu verzögern.

# text
seg-311e4379acf1 = Alternative: das Relay.

# text
# c1: integrations/opencpn/nmea-tcp-relay.mjs
# c2: kshana
# c3: --listen
seg-11b4c4791f55 = <c1/> ist ein abhängigkeitsfreier Node-Fan-out, der dasselbe für ein <c2/> ohne <c3/> leistet oder jeden anderen Zeilenstrom bereitstellt (die Container-Option nutzt es für die JSON-Epochen):

# text
seg-93cb82966313 = Es leitet Bytes unverändert weiter, nur ganze Zeilen, und lässt einen Client fallen, der nicht liest. Bevorzugen Sie die direkte Verbindung: ein Prozess weniger in der Kette.

# text
# c1: 127.0.0.1
# c2: 10110
# c3: $PKSHT
# c4: 0
# c5: V
# c6: $PKSHT
seg-4226afc6175c = In OpenCPN: Options, Connections, Add Connection, <b>Network</b>, Protokoll <b>TCP</b>, Adresse <c1/>, Port <c2/>, Richtung <b>Input</b>. Solange das Vertrauen nicht eingebrochen ist, ist der Strom der eigene des Empfängers, plus ein Satz <c3/> je Zyklus. Solange es eingebrochen ist, hat das weitergeleitete GGA die Qualität <c4/>, RMC den Status <c5/>, und die Modusanzeigen sagen, dass keine Lösung vorliegt, mit neu berechneten Prüfsummen: Die Ausrüstung sieht, dass der Empfänger selbst die Lösung für ungültig erklärt, und löst ihren eigenen Alarm aus. Die Sätze <c6/> sind im NMEA-Debug-Fenster von OpenCPN sichtbar (Options, Connections, "NMEA debug window"). Die Positionsfelder bleiben, wie sie empfangen wurden.

# text
# c1: MARITIME-TRUST.md
seg-8549d49f1b2c = Lesen Sie "Gate mode" in <a1><c1/></a1>, bevor Sie sich darauf verlassen: Es ist ein Opt-in, fügt Latenz hinzu (ein Zyklus wird zurückgehalten, bis seine Epoche bewertet ist), ist ein einzelner Punkt in der Kette und kann eine gute Lösung zurückhalten ebenso wie eine gefälschte durchlassen.

# text
# c1: test/relay.test.mjs
# c2: kshana receiver-trust live --gate
# c3: $PKSHT
# c4: W
seg-533a911141d6 = <c1/> spielt einen aufgezeichneten Auszug des synthetischen gesperrten Stroms ab ({ "186" } Sätze um den Moment, in dem das Vertrauen einbricht, geschrieben von <c2/>) und leitet ihn über einen echten TCP-Socket durch das Relay und prüft, was ein Verbraucher empfängt: den Strom Byte für Byte bei beliebiger Zerstückelung; gültige Prüfsummen bei jedem Satz, auch bei umgeschriebenen; GGA und RMC stimmen überein, gültig und dann ungültig ohne Flackern; ein <c3/> je Zyklus, dessen Gate-Feld <c4/> genau dort steht, wo die Lösung ungültig ist; zwei Verbraucher identisch; eine unvollständige Zeile wird nie weitergeleitet. Dies prüft den Strom, den OpenCPN erhält, nicht den eigenen Bildschirm von OpenCPN.

# text
# c1: kshana
seg-12fc91a3f69b = Eine Ende-zu-Ende-Prüfung mit der echten Binärdatei, nicht Teil der Standardtests (sie braucht ein gebautes <c1/>):

# text
# c1: $PKSHT
seg-fea419a50c52 = Beide lassen die einstündige synthetische Demo laufen und prüfen, dass die Lösung gültig und dann ungültig wird, mit einem <c1/> je Epoche.

# text
seg-e76c11d8f003 = Natives Plugin

# text
# c1: integrations/opencpn/plugin/
# c2: $PKSHT
# c3: ctest
# c4: $PKSHT
# c5: integrations/opencpn/evidence/
# c6: README.md
# c7: LICENSING.md
seg-7a5ac2d2f229 = <c1/> ist ein Score-Panel für OpenCPN (Wert, Band, Gate, wichtigste Gründe, ein Alarm, wenn das Vertrauen untrusted wird), das <c2/> aus dem eigenen NMEA-Strom von OpenCPN liest und daher keine Verbindung über die oben genannte hinaus braucht. Es wird mit CMake gegen den Header der OpenCPN-Plugin-API (eingebunden, mit seinem Quell-Commit) und wxWidgets gebaut; <c3/> führt die wx-freien Logiktests aus und prüft, dass die Bibliothek die Einstiegspunkte exportiert, die OpenCPN nachschlägt. Es wurde innerhalb von OpenCPN { "5.8.4" } unter einem virtuellen Display auf dem synthetischen gesperrten Strom ausgeführt (OpenCPN reichte <c4/> an das Plugin, das Panel wurde rot, und die eigene Position von OpenCPN fror ein, als das Gate einrastete; Screenshots, Log und Skript in <c5/>), aber nicht auf einem echten Desktop, anderen Versionen oder Plattformen, und es ist nicht für den Plugin-Manager von OpenCPN paketiert. Siehe das <a1><c6/></a1> des Plugins. Es steht unter GPL-3.0-or-later, anders als der Rest des Repositorys (<a2><c7/></a2>).

# text
# c1: integrations/opencpn/evidence/
# c2: README.md
seg-a2adfa7ff5fb = Screenshots aus diesem Lauf, in <c1/> (ein Lauf, OpenCPN { "5.8.4" } unter einem virtuellen Display, synthetische Daten; <a1><c2/></a1> nennt die Grenzen):

# attr:alt
seg-ee5e8bb5a734 = Das OpenCPN-Kartenfenster mit dem Kshana-Score-Panel-Plugin auf dem synthetischen gesperrten Strom, vor dem Vertrauenseinbruch: Kein Panel ist geöffnet (es öffnet sich selbst beim Alarm), die Schiffsposition in der Statusleiste lautet { "54" } { "32.4659" } N { "018" } { "46.1670" } E mit Geschwindigkeit { "16.48" } kn und Kurs { "088" }, und die Lösungsanzeige oben rechts zeigt drei Balken.

# attr:alt
seg-1189d82affbb = Dasselbe OpenCPN-Fenster nach dem Einbruch: Das Kshana-Panel ist rot geöffnet mit dem Wert { "47" } und dem Wort UNTRUSTED, den Zeilen gate: fix marked invalid, cn0-spread -30.0, speed-log -21.0 und Alter { "2" } s sowie der Angabe, dass dies beratende Software ist, keine typzugelassene Navigationsausrüstung, und dass der Betreiber verantwortlich bleibt. Die Statusleiste lautet weiterhin { "54" } { "32.4672" } N { "018" } { "46.2227" } E, und die Lösungsanzeige ist auf zwei Balken gefallen.

# attr:alt
seg-90c7cdee8892 = OpenCPN, direkt von kshana receiver-trust live --gate --listen gespeist: Das Kshana-Panel ist rot geöffnet mit dem Wert { "44" } und UNTRUSTED, den Zeilen gate: fix marked invalid, cn0-spread -30.0, speed-log -18.8 und Alter { "1" } s sowie der Hinweisaussage. Dieser Lauf stützt die Beobachtung des Positionseinfrierens nicht: OpenCPN arbeitete noch den anfänglichen Schwall von Epochen ab.

# text
seg-dce06383cde1 = Diese zeigen die Verkabelung und die gesperrte Lösung, die OpenCPN erreicht, nicht, dass ein Alarm für ein echtes Schiff rechtzeitig oder richtig ist. Beratende Software, kein typzugelassenes Gerät.

# text
# c1: deploy/reference-build/
# c2: deploy/reference-build/check-units.sh
# c3: systemd-analyze verify
seg-f9f39d089438 = <a1><c1/></a1>: eine generische Teileliste, Betriebssystem-Einrichtung, zwei systemd-Units (der beratende Monitor und das Opt-in-Gate), eine Container-Option und die Signal-K-Verdrahtung. <c2/> führt <c3/> auf den Units aus, ohne etwas zu starten.

# text
# c1: MARITIME-TRUST.md
seg-5e2a2e8af941 = Der Wert ist nur so gut wie die Prüfungen dahinter, die auf die Physik eines Schiffes und seine anderen Sensoren schauen; eine in sich stimmige Fälschung mit passender Uhr wird von reinen NMEA-Monitoren nicht gesehen (<a1><c1/></a1>). Das Ausbleiben eines Alarms ist kein Beleg für eine gute Lösung.

# text
seg-be1ed291f7c3 = Keine Zahl auf dieser Seite ist eine gemessene Erkennungs- oder Fehlalarmrate. Die obigen Tests prüfen die Verkabelung an synthetischem Text; sie sagen nichts darüber aus, wie sich ein Monitor bei echter Störung schlägt.

# text
seg-97d775b504c6 = Nicht typzugelassen; der Betreiber bleibt verantwortlich.

# text
seg-69222f7d5068 = <s1>Zurück</s1>Störungskarte: Datenquellen und Lizenzen

# text
seg-8eba9835d7df = <s1>Weiter</s1>Himmelsgeometrie und Skylines

# text
seg-2093a1d8a24e = Woher die Epochen kommen (source)
