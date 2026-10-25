# docs--timing-hil: translations (de)

# text
seg-f8cf777c0caa = Oberflächen

# text
seg-f2ce7fc60cdf = Format

# text
seg-d00b65801e9b = Schritt

# attr:alt
seg-0d580ea8043d = Ein Holdover-Test, bewertet aus einer Zeitfehleraufzeichnung, aus einem echten Lauf der Engine v{ $version } auf scenarios/holdover-test-example.toml ({ "601" } Proben alle { "5" } s). GNSS wird vom Betreiber bei { "600" } s entfernt und bei { "2400" } s wiederhergestellt; der Zeitfehler driftet am Ende des Holdovers auf { "299" } ns, überschreitet das Budget von { "100" } ns nach { "675" } s und kehrt { "70" } s nach der Wiederherstellung in das Band von { "100" } ns zurück. Urteile: Basismasken PASS, Holdover-Masken FAIL, Holdover-Hüllkurve FAIL, Erholung RECOVERED. Gegen die Maske gemessen, keine Zulassung. Die Zeiten sind die Angabe des Betreibers, von Kshana nicht verifiziert. Beratend: Analyseausgabe eines Forschungs- und Entwicklungswerkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit von Menschenleben.

# text
# c1: docs/TIMING-HIL.md
seg-7a1246297c82 = Quelle: <c1/>

# text
seg-6ea3dec83080 = Zeitgebung Hardware-in-the-Loop: die Antenne abziehen, den Holdover bewerten

# text
# c1: holdover-test
# c2: scenarios/holdover-test-example.toml
# c3: scenarios/holdover-test-ptp4l.toml
seg-5901f0b26939 = Telecom- und Energiebetreiber prüfen ein Zeitgebungssystem, indem sie ihm GNSS wegnehmen und beobachten, was die Uhr tut. Kshana tut das nicht für sie und berührt ihre Geräte nicht. Es liest die Zeitfehleraufzeichnung, die die eigenen Instrumente des Betreibers erzeugt haben, teilt sie an den beiden vom Betreiber angegebenen Zeiten auf und <b>misst jeden Schritt an öffentlichen ITU-T-Masken</b>. Die Szenarioart ist <a1><c1/></a1>; die Beispielszenarien sind <c2/> und <c3/>.

# text
# c1: HARDWARE-SAFETY.md
seg-daf4b071bad0 = Dies ist <b>Stufe { "1" }</b> der Hardware-Sicherheit: passiv, nur empfangend, kein HF von Kshana (<a1><c1/></a1>). Beratende Software, kein typzugelassenes Gerät. Niemand hat dieses Verfahren bewertet, genehmigt oder geprüft, und es sagt nichts darüber aus, ob ein System eine Empfehlung erfüllt.

# text
seg-da0c48bbe011 = Das Verfahren

# text
seg-e753ca7a1c99 = Der Betreiber führt vier Schritte aus. Kshana führt keinen davon aus.

# text
seg-0c338b956741 = Was der Betreiber tut

# text
seg-ebd95b343349 = Was die Aufzeichnung zeigt

# text
seg-03999de98059 = { "1" }. Basislinie

# text
seg-730f2037d22a = Lässt das System so lange auf GNSS synchronisiert laufen, wie der Test es braucht (und vermerkt, wie viele Tage es zuvor synchronisiert war).

# text
seg-f45aae4139bd = Den Zeitfehler im nachgeführten Zustand.

# text
seg-0f050dcede80 = { "2" }. GNSS entfernt

# text
seg-50c0df832eda = Entfernt GNSS vom System unter Test, zum Beispiel das Antennenkabel am Empfänger oder den Ausgang des laboreigenen Simulators, und <b>notiert die Zeit</b>. Prüfen Sie vorher das Handbuch des Empfängerherstellers: Manche Empfänger speisen die Antenne, und manche brauchen einen Abschlusswiderstand am offenen Anschluss.

# text
seg-e371e7e357e3 = Den Augenblick, in dem der Zeitfehler zu wandern beginnt.

# text
seg-f05dc0acb396 = { "3" }. Holdover

# text
seg-a98186503e0f = Lässt das System für die geplante Zeit auf seinem eigenen Oszillator laufen.

# text
seg-1da66cdca856 = Den Holdover des Systems.

# text
seg-61197c9bad91 = { "4" }. Wiederherstellung

# text
seg-75af1f4fec83 = Stellt GNSS wieder her und <b>notiert die Zeit</b>.

# text
seg-1259d36fc78c = Die Rückkehr des Zeitfehlers (oder ihr Ausbleiben).

# text
seg-c09b1ea8f1a4 = Zwei Dinge muss der Betreiber tun, weil Kshana sie nicht kann:

# text
seg-31f6c357864b = Die beiden Zeiten angeben.

# text
# c1: gnss_removed_s
# c2: gnss_restored_s
seg-59f9eb10035a = <c1/> und <c2/> sind die Angabe des Betreibers. Kshana erkennt das Entfernen nicht in der Aufzeichnung und prüft die Zeiten nicht. Eine falsche Zeit verschiebt die Schrittgrenzen und damit das Ergebnis.

# text
seg-6d0d3186fbe3 = <b>Verwenden Sie für die Aufzeichnung und die Zeiten dieselbe Uhr.</b> Bei einem Uhrenprotokoll beginnt die Zeitachse mit dem ersten Messwert, daher sind die beiden Zeiten Sekunden ab der ersten Zeile des Protokolls.

# text
seg-bd181a831803 = Was aufzuzeichnen ist

# text
# c1: clock_log
# c2: CLOCK-LOG-FORMATS.md
seg-52758c10be0a = Eines davon, über die vorhandenen <c1/>-Leser (<a1><c2/></a1>):

# text
seg-fef0034cb88b = Instrument

# text
seg-ad6f33d70f3f = Wie die Aufzeichnung entsteht

# text
# c1: ptp4l
seg-ef7f547609ad = linuxptp <c1/> (der Servo der Slave- oder Boundary-Clock)

# text
# c1: -m
# c2: ptp4l[time]: master offset N sK freq ...
seg-f548a2ae96e5 = mit <c1/> ausführen und die Zeilen <c2/> aufbewahren

# text
# c1: phc2sys
seg-9a3b58be1b0b = linuxptp <c1/>

# text
# c1: phc2sys[time]: CLOCK_REALTIME phc offset N sK ...
seg-77255f8f5fef = die Zeilen <c1/>

# text
# c1: ts2phc
seg-2cf9256bd790 = linuxptp <c1/>

# text
# c1: ts2phc[time]: /dev/ptpN offset N sK ...
seg-c667a97b92a8 = die Zeilen <c1/>

# text
# c1: tracking.log
seg-ed305bcea4f8 = chrony <c1/>

# text
# c1: log tracking
# c2: chrony.conf
seg-021b760aae59 = <c1/> in <c2/>

# text
# c1: statistics.log
seg-a7f2d72a5cb7 = chrony <c1/>

# text
# c1: log statistics
# c2: chrony.conf
seg-a70952a099d5 = <c1/> in <c2/>

# text
seg-6ad29120ffe7 = ein TAPR-TICC-Zähler

# text
seg-32f703bfcab7 = Zeitstempelmodus gegen die Referenz

# text
seg-6862a9ac9a68 = ein ASCII-Export von TimeLab

# text
seg-b5e7e3a272d6 = Phase in einer angegebenen Einheit

# text
seg-8af4aac4426f = eine RINEX-Uhrendatei

# text
seg-21d5c43719f2 = eine Uhr

# text
seg-3a82b5295ab1 = alles andere

# text
# c1: samples
# c2: csv_path
seg-6bebda4a3c6c = <c1/> oder <c2/>

# text
# c1: time_s,time_error_ns
seg-9a443cc0c444 = <c1/>-Paare, gleichmäßig abgetastet

# text
seg-b8d1d45df70b = <b>Was die Aufzeichnung misst, ist wichtig.</b> Ein Servo-Protokoll (linuxptp, chrony) zeichnet den Versatz auf, den der Daemon gemessen hat und korrigiert: Es ist der unter Servoregelung verbleibende Zeitfehler, keine unabhängige Messung der Uhr gegen UTC. Während des Holdover-Schritts eines Tests, der die Referenz wirklich entfernt, zeigt ein Servo-Protokoll weiterhin, was der Daemon annahm, was vom wahren Fehler abweichen kann. Ein TICC oder ein anderer Zähler gegen eine unabhängige Referenz ist die stärkere Aufzeichnung; geben Sie bei der Berichterstattung des Ergebnisses an, welche Sie verwendet haben.

# text
seg-6d4e25914d1c = Das Szenario

# text
# c1: budgets
# c2: max_abs_te_ns
# c3: clock = "..."
# c4: [series.clock_log]
seg-ca1244db2387 = Optionale Schlüssel: <c1/> (Name, <c2/>, Quelle; die Telecom-Timing-Standardwerte, wenn nicht vorhanden) und <c3/> innerhalb von <c4/>, um aus einem Protokoll mit mehreren Uhren eine Quelle auszuwählen.

# text
seg-38eb634b7f8f = Was der Bericht enthält

# text
# c1: steps
seg-6a64755e11d6 = <b><c1/></b>: für die Basislinie, den Holdover und die Wiederherstellung Anfang und Ende, die Anzahl der Abtastwerte sowie Mittelwert, Effektivwert, größten Wert und Endwert des Zeitfehlers.

# text
# c1: masks
seg-cd11d0838c44 = <b><c1/></b>: jede genannte Maske, gemessen an dem Schritt, den ihre Bedingung nennt. Eine für eine synchronisierte Uhr geschriebene Maske wird an der Basislinie gemessen; eine für Holdover oder eine autonome Uhr geschriebene am Holdover. Jede Prüfung hat ihren Grenzwert, den gemessenen Wert, die Marge und die Tabelle, aus der sie übertragen ist. Eine Maske, die eine längere Aufzeichnung braucht, als der Schritt lieferte, ist <b>INCOMPLETE</b> und wird nie extrapoliert; eine, die die Engine für das Abtastintervall der Aufzeichnung nicht auswerten kann, ist <b>NOT-EVALUATED</b> mit Angabe des Grundes.

# text
# c1: holdover
seg-cb54e67ca4eb = <b><c1/></b>: der relative Frequenzversatz, den das System hielt (die Steigung einer Ausgleichsgeraden nach kleinsten Quadraten durch den Holdover-Zeitfehler, in ns/s, also parts per billion), die Restabweichung um diese Gerade, der größte absolute Zeitfehler und wann er auftrat sowie der Sprung im Moment des Entfernens.

# text
# c1: holdover_envelope
# c2: locked_duration_days
seg-daa40ac07396 = <b><c1/></b>: die ePRTC-A-Holdover-Hüllkurve aus ITU-T G.8272.1 Tabelle { "3" }, aus <c2/>, mit dem Zeitpunkt ihrer ersten Überschreitung.

# text
# c1: budgets
seg-cd480a1bf901 = <b><c1/></b>: die Zeit nach dem Entfernen, zu der jedes Zeitfehlerbudget erstmals überschritten wird.

# text
# c1: recovery
# c2: |TE|
seg-007a0393cb39 = <b><c1/></b>: ob <c2/> in das Band kam und für die Verweilzeit darin blieb, wie lange nach der Rückkehr von GNSS das begann, die Spitze nach der Wiederherstellung und der größte Sprung zwischen aufeinanderfolgenden Abtastwerten während der Wiederherstellung.

# text
# c1: curves
seg-199497dfcc09 = <b><c1/></b>: MTIE und TDEV der Basislinien- und Holdover-Schritte.

# text
# c1: verdicts
seg-ce00a41a322f = <b><c1/></b>: eine Ein-Wort-Zusammenfassung pro Schritt.

# text
# c1: units
seg-c09fc305ead1 = Jede Zahl trägt ihre Einheit und ihre Herkunft im Block <c1/> des Berichts.

# text
seg-5d87a772c132 = Die Worte und die Grenzen

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-0810b24c6f3e = Das Ergebnis wird <b>an der Maske gemessen</b>. Die Masken sind aus frei herunterladbaren ITU-T-Empfehlungen übertragen (dieselben Tabellen wie bei der Szenarioart <c1/>, aufgeführt in <a1><c2/></a1>), und jeder Eintrag, den die Empfehlungen „Gegenstand weiterer Untersuchung“ lassen, fehlt, statt ergänzt zu werden. Kshana sagt nicht, dass eine Uhr oder ein System eine Empfehlung erfüllt oder gegen sie zugelassen ist, und der Bericht sagt es auch nicht.

# text
seg-527189cf37c6 = <b>MODELLED.</b> Die Schrittlogik, die Geradenanpassung und die Wiederherstellungsregel werden an Aufzeichnungen geprüft, die aus Formeln mit vor dem Lauf bekannten Ergebnissen erzeugt wurden; kein Labor-Holdover wurde gegen eine externe unabhängige Referenz bewertet, und kein Partner und kein Labor hat irgendetwas zugestimmt. Ein Zeitgebungslabor wäre nötig, bevor eine Angabe je Uhrenklasse hochgestuft werden könnte.

# text
seg-ad8160fbed46 = <b>Was nicht abgedeckt ist</b>, in jedem Bericht angegeben: ob GNSS zu den angegebenen Zeiten wirklich entfernt und wiederhergestellt wurde; jeder Schritt, den der Betreiber nicht aufgezeichnet hat; über ein { "0.1" }-Hz-Filter definierte Masken bei einer Aufzeichnung, die langsamer als einmal pro Sekunde abgetastet wurde; die eigene Messunsicherheit des Instruments; und jedes Verfahren der Empfehlungen, das über eine Zeitfehleraufzeichnung hinausgeht (Temperaturprofile, Last im Paketnetz).

# text
seg-cf681db42f05 = <b>Das Wiederherstellungsband ist die eigene Wahl des Tests.</b> Der Standardwert von { "100" } ns ist der maximale absolute Zeitfehler eines PRTC-A (ITU-T G.8272); er ist eine bequeme Linie, keine Anforderung irgendeiner Empfehlung an die Wiederherstellung.

# text
seg-4ce2f2052df4 = <b>Kein Sendepfad.</b> Kshana liest Dateien. Es erzeugt kein Signal, und das Entfernen von GNSS im Labor erfolgt mit den eigenen Geräten des Labors und unter dessen eigener Genehmigung.

# text
# c1: holdover-test
# c2: kshana <scenario.toml>
# c3: kshana::api::run_toml
# c4: kshana.run
# c5: samples
# c6: clock_log.text
# c7: run_scenario
# c8: kshana example holdover-test-example
seg-0cff831a8444 = <c1/> ist eine Szenarioart und läuft daher überall, wo Szenarioarten laufen: <c2/>, die Rust-API (<c3/>), die Python-Anbindung (<c4/>), der WebAssembly- und npm-Build (Inline-<c5/> oder <c6/>; die Dateischlüssel sind dort nicht verfügbar), der MCP-Server (<c7/>, nur Inline-Inhalt) und der Szenario-Runner von Kshana Studio. Die beiden Szenariodateien sind mitgeliefert (<c8/>).

# text
seg-432c07a8e6f5 = <s1>Zurück</s1>Getäuschte Zeit

# text
seg-8499ae539222 = <s1>Weiter</s1>Formate von Uhrenprotokollen
