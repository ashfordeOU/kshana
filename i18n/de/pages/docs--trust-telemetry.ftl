# docs--trust-telemetry: translations (de)

# text
seg-2247a2344710 = Bedeutung

# text
seg-d4e48c972084 = Kennzeichnungen

# text
seg-ca448daf5ec7 = nominal

# text
seg-a129b9e613d0 = Typ

# text
seg-2672b7f55371 = degraded

# attr:alt
seg-c711c7fecbfc = Ein Vertrauensergebnis in drei Exportformaten, aus echten Läufen der Engine v{ $version } (`kshana trust-telemetry`) auf examples/maritime-trust: Prometheus-Textdarstellung (der letzte Vertrauenswert ist { "5.9" } und das nicht vertrauenswürdige Band ist das gesetzte) sowie die letzten CEF- und LEEF-Nachrichten. Der Befehl veröffentlicht nichts, wenn kein Ziel angegeben ist, hält keine Zugangsdaten und sendet kein Funksignal. Beratende Software, keine typzugelassene Navigationsausrüstung (IEC { "61108" }, IEC { "61162" }): Der Betreiber bleibt für die Navigation des Schiffes verantwortlich.

# text
# c1: docs/TRUST-TELEMETRY.md
seg-15fcf05d16c5 = Quelle: <c1/>

# text
seg-05919ac6cf31 = GNSS-Vertrauen als Sicherheitstelemetrie

# text
# c1: kshana trust-telemetry
seg-8978c6508ebd = <c1/> wandelt den GNSS-Vertrauensstrom pro Epoche (Wert 0-100, Band, Gründe) in Signale um, die ein Betriebs- oder Sicherheitszentrum bereits aufnimmt: Prometheus-Metriken, Syslog-Ereignisse in CEF oder LEEF für ein SIEM und optional OpenTelemetry. Es liest den Strom; es ändert nie die Vertrauensbewertung und sendet nichts außer Telemetrie.

# text
# c1: docs/MARITIME-TRUST.md
# c2: t_s
# c3: state
# c4: calibrating|nominal|degraded|untrusted
# c5: score
# c6: time
# c7: gate
# c8: off|passed|withheld
# c9: position
# c10: lat_deg
# c11: lon_deg
# c12: height_m
# c13: deductions
# c14: alarms
# c15: geometry
# c16: status
# c17: hdop
# c18: pdop
# c19: n_used
# c20: class
# c21: kshana_trust_input_errors_total
# c22: src/telemetry/sample.rs
seg-14ad6b7911d6 = Die Eingabe ist das in <c1/> dokumentierte Live-JSON-Lines-Schema v1.1. Gelesen werden: <c2/>; <c3/> (<c4/>, das Band); <c5/> (0-100 oder null); <c6/> (die Zeit der Epoche wie angegeben); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> oder null); Gründe sind die Monitore in <c13/>, dann weitere in <c14/>; ab Schema { "1.3" } <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) und die <c20/> jedes Abzugs. Andere Schlüssel werden ignoriert, da das Schema nur durch angehängte Schlüssel wächst. Eine Zeile, die sich nicht parsen lässt, wird in <c21/> gezählt und übersprungen; Werte außerhalb von 0-100 werden abgelehnt, nicht begrenzt, damit eine Formatänderung auffällt. Der einzige Code, der dieses Format kennt, ist <c22/>.

# text
# c1: /metrics
# c2: 127.0.0.1:9464
seg-2c94f3717f82 = <c1/> wird ohne Authentifizierung bereitgestellt und verwendet standardmäßig <c2/>. Das Binden an eine andere Adresse gibt eine Warnung aus; stellen Sie es hinter Ihre eigene Zugriffskontrolle. Der Endpunkt bearbeitet jeweils eine Verbindung mit einem Leselimit von { "2" } s, sodass ein untätiger Client einen Abruf um bis zu diese Zeit verzögern kann; er ist für einen einzelnen Scraper gedacht, nicht für das offene Netz.

# text
seg-7e66e43f15a8 = Home Assistant und NTP-Geräte (MQTT)

# text
# c1: --print-mqtt
# c2: --mqtt-tcp <host:port>
# c3: homeassistant/...
# c4: untrusted
# c5: <prefix>/state
# c6: kshana/trust/state
# c7: state
# c8: score
# c9: untrusted
# c10: t_s
# c11: time
# c12: reasons
# c13: gate
# c14: --mqtt-prefix
# c15: --mqtt-node
# c16: --mqtt-discovery
seg-fbe56ff7f1ed = <c1/> gibt ein JSON-Zustandsdokument und Home-Assistant-MQTT-Discovery-Nachrichten aus, <c2/> veröffentlicht sie. Die Discovery (retained, unter <c3/>) erzeugt drei Entitäten: Vertrauenswert, Vertrauensband (mit den Gründen als Attribute) und einen Problemsensor <c4/>. Das Zustandsdokument geht an <c5/> (Standard <c6/>, retained): <c7/>, <c8/> (null, solange keiner vorliegt), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> und den Hinweis zur beratenden Software; die Position wird nie aufgenommen. Optionen: <c14/>, <c15/>, <c16/>.

# text
# c1: format = "mqtt"
# c2: topic<TAB>payload
seg-252025356c0e = Der Publisher spricht MQTT { "3.1.1" } mit QoS { "0" } und liest nur das CONNACK des Brokers. Er hat keine Zugangsdaten und kein TLS, verwenden Sie daher einen Broker im lokalen Netz (oder ein lokales Relay, das sie ergänzt). Die Zustellung läuft in einem eigenen Thread hinter einer Warteschlange von { "1024" }: Ein ausgefallener Broker lässt Nachrichten fallen, was gezählt und am Ende gemeldet wird, und blockiert nie den Strom. Ein NTP-Gerät oder jeder andere Verbraucher, der reines JSON will, kann dieselbe Zustandszeile lesen. Nichts wird an einen Empfänger oder eine Uhr geschrieben. Python, WebAssembly und MCP nehmen <c1/> entgegen und liefern dieselben <c2/>-Zeilen zurück (dort wird nichts veröffentlicht).

# text
seg-ed95ebb0ba1b = Aus Python, WebAssembly und MCP

# text
# c1: kshana.trust_telemetry(input, format, host="", input_kind="jsonl", expose_position=False, syslog_all=False, unix_nano=0)
# c2: trust_telemetry(input, format, host, input_kind, options_json)
# c3: trust_telemetry
# c4: /kshana-trust-telemetry
# c5: format
# c6: prometheus
# c7: cef
# c8: leef
# c9: otlp
# c10: input_kind
# c11: jsonl
# c12: result
# c13: --print-metrics
# c14: --print-syslog
# c15: host
# c16: syslog_all
seg-93be007cdfda = Die Encoder stehen auch als Aufrufe mit Text als Ein- und Ausgabe zur Verfügung, ohne Prozess, Socket oder Uhr: Python <c1/>, der WebAssembly-Export <c2/> und das MCP-Werkzeug <c3/> (Plugin-Befehl <c4/>). <c5/> ist <c6/>, <c7/>, <c8/> oder <c9/>; <c10/> ist <c11/> (der Strom) oder <c12/> (ein Stapelergebnis). Sie liefern denselben Text, den die Befehlszeile ausgibt (<c13/>, <c14/>), mit denselben Grenzen: Syslog-Zeilen tragen keinen Zeitstempel, <c15/> besteht aus höchstens { "255" } druckbaren ASCII-Zeichen ohne Leerzeichen (andernfalls abgelehnt, hier wie in der Befehlszeile), und eine Antwort, die größer als das Limit der Oberfläche ist ({ "4" } MiB bei MCP), wird abgelehnt, weil CEF und LEEF mit <c16/> ein Ereignis pro Epoche schreiben. Nichts wird gesendet, bereitgestellt oder geschrieben; die laufenden Exporter bleiben ein Prozess in der Befehlszeile.

# text
seg-f8c367611a9e = Die Zustellung blockiert nie die Bewertung

# text
# c1: /metrics
seg-3853bb63c7ad = Syslog- und OpenTelemetry-Zustellung laufen in eigenen Threads. Die Eingangsschleife übergibt ihnen nur eine Nachricht oder einen Schnappschuss und wartet nie, sodass ein ausgefallener, langsamer oder nicht lesender Collector den Live-Strom nicht zurückstauen oder <c1/> einfrieren kann:

# text
seg-589d02c31dfe = jeder Verbindungsaufbau und jeder Schreibvorgang hat ein Limit von { "2" } s; eine fehlgeschlagene Verbindung wird verworfen und träge neu aufgebaut, mit exponentiellem Backoff von { "1" } s bis zu { "60" } s;

# text
# c1: kshana_trust_syslog_send_failures_total
seg-3c272ded25a3 = eine Nachricht, die nicht zugestellt werden kann (Collector ausgefallen, Schreibvorgang abgelaufen, Warteschlange von { "1024" } voll), wird verworfen und in <c1/> gezählt; alarmieren Sie auf deren Rate;

# text
seg-4a7cd2065731 = der OpenTelemetry-Exporter erhält eine Kopie des Registers, sodass während der Netzwerk-E/A keine Sperre gehalten wird; läuft ein Export noch, wird der neue Schnappschuss übersprungen (der nächste trägt dieselben kumulativen Summen).

# text
seg-57c3bbe405c8 = Am Ende der Eingabe wird den Sender-Threads ihre verbleibende Zeit zum Abschluss gelassen.

# text
seg-14c13ed8c509 = Prometheus-Metriken

# text
seg-d060b2163513 = Metrik

# text
seg-45c41bf74eb8 = gauge

# text
seg-e43a6814d13c = konstant { "1" }

# text
seg-3662d2b8a789 = letzter Wert 0-100; fehlt, wenn die Quelle keinen liefert

# text
seg-1c50874472fc = { "1" } für das aktuelle Band, { "0" } für die übrigen

# text
# c1: off
# c2: passed
# c3: withheld
# c4: unknown
seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } für den aktuellen Zustand, { "0" } für die übrigen; fehlt ohne Gate

# text
# c1: --expose-position
seg-3e01cab63c59 = vom Empfänger gemeldete Position; <b>nur mit <c1/></b> (der Endpunkt ist nicht authentifiziert, und eine Position kann einen Standort oder ein Schiff identifizieren)

# text
seg-280a5ca2e5d9 = { "1" }, wenn in der letzten Epoche vorhanden

# text
seg-22ded4fe7f29 = counter

# text
seg-800b23c30e2f = empfangene Epochen

# text
seg-be11849d8a9b = Epochen, in denen der Grund vorlag

# text
seg-0475fe7b26ba = nicht parsbare Eingabezeilen

# text
# c1: reason="other"
seg-65f1db183cbc = Vorkommen von Gründen, die in <c1/> zusammengefasst wurden (siehe unten)

# text
seg-e756633e7d5c = nicht zugestellte Syslog-Ereignisse

# text
seg-2de3258f83ee = Versatz der letzten Epoche vom Stromanfang

# text
seg-c02fe207663e = Empfangszeit nach Wanduhr; alarmieren Sie auf deren Alter

# text
# c1: good
# c2: degraded
# c3: unknown
seg-67d5bbbde75a = Satellitengeometrie in der letzten Epoche, <c1/>, <c2/>, <c3/>: { "1" } für die aktuelle <em>(Eingaben des Schemas { "1.3" })</em>

# text
seg-4878afc243e3 = { "1" } verschlechtert, { "0" } gut; fehlt, wenn die Geometrie unbekannt ist

# text
# c1: geometry_degraded
seg-c21f54522128 = { "1" }, wenn sichtbare Satelliten nicht verfolgt werden, obwohl ihre Geometrie gut ist (das Signal ging verloren, nicht der Himmel; <c1/> zeigt weiterhin { "1" }), sonst { "0" }; fehlt, wenn die Geometrie unbekannt ist oder die Eingabe es nicht angibt

# text
seg-db29584bb51c = HDOP, PDOP und verwendete Satelliten in der letzten Epoche; jeweils fehlend, wenn keiner vorliegt

# text
seg-c60ca4530e92 = Epochen nach Geometriestatus

# text
# c1: good
# c2: fair
# c3: poor
# c4: unknown
# c5: poor
seg-fd6bf7764eca = Geometrie-Label in der letzten Epoche, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } für das aktuelle; wird nie bewertet (der Wert zieht nur bei <c5/> ab); aus Eingaben, die das Label tragen ({ "0.36" })

# text
seg-d6f04ef7adfb = VDOP in der letzten Epoche; fehlt, wenn keiner vorliegt

# text
# c1: kshana_trust_geometry_label
# c2: kshana.geometry.label
# c3: cs6
# c4: geoLabel
# c5: poor
# c6: degraded
# c7: sky-blocked
# c8: kshana_trust_geometry_degraded
seg-cb8feee01192 = <b>Das Geometrie-Label ist die wichtigste Größe.</b> Stellen Sie <c1/> grafisch dar und alarmieren Sie darauf (OTLP <c2/>, CEF das dritte Feld <c3/>, LEEF <c4/>): <c5/> ist das einzige Label, bei dem der Wert abzieht. Der Geometriestatus ist beschreibend: <c6/> umfasst den informativen Fall <c7/>, der mit gutem oder ausreichendem DOP auftreten kann, alarmieren Sie daher nicht allein auf <c8/>.

# text
# c1: kshana_trust_reason_active
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
# c6: geometry
# c7: unknown
# c8: kshana_trust_reason_active{class="inconsistency"}
# c9: geometry
# c10: docs/RECEIVER-TRUST.md
seg-70343708da03 = Bei Eingaben des Schemas { "1.3" } trägt <c1/> außerdem ein Label <c2/> (<c3/>, <c4/>, <c5/>) an jedem Grund, der eines mitbrachte: die Klasse des Abzugs in der letzten Epoche. Die Geometrie-Reihen kommen nach allen anderen und nur, sobald eine Eingabeepoche <c6/> trägt (Live-Schema { "1.3" }, ein Ergebnis der Engine { "0.36" } oder später), sodass ein Strom oder Ergebnis von { "0.35" } byte-genau wie zuvor ausgegeben wird. Label-Werte sind feste Mengen (ein unbekannter Status lautet <c7/>; eine unbekannte Klasse wird verworfen). Alarmieren Sie auf <c8/> statt allein auf das Band, damit ein schlechter Himmel nicht als Angriff alarmiert; eine Klasse <c9/> ist eine Aussage über den Himmel, keine Feststellung, dass kein Angriff stattfand (siehe <c10/>).

# text
# c1: class
# c2: loss-of-lock
# c3: environment
# c4: geometry
# c5: geometry
# c6: inconsistency
# c7: reason
# c8: max by (reason)
# c9: class
seg-3f45b21003d5 = Das Label <c1/> gehört zur Identität einer Reihe: Wechselt die Klasse eines Grundes zwischen Epochen (<c2/> von <c3/> zu <c4/>, wenn die verlorenen Satelliten niedrig standen, oder <c5/> zu <c6/>, wenn das angegebene HDOP dem angegebenen Himmel widerspricht), wird die alte Reihe nicht mehr exportiert und eine neue beginnt. Fragen Sie nach <c7/> mit <c8/> ab, wenn die Klasse keine Rolle spielt, und rechnen Sie damit, dass ein solcher Wechsel wie das Ende einer Reihe und der Beginn einer anderen aussieht. Die Reihen des Schemas { "1.3" }, das Label <c9/> und die CEF/LEEF-Geometriefelder werden durch die eigenen Tests der Engine und durch die CEF-Referenzen (pycef, Logstash) geprüft; die externen Referenzen für Prometheus und OTLP haben noch keinen Strom nach { "1.3" }.

# text
# c1: reason="other"
# c2: kshana_trust_reason_overflow_total
seg-17ca55cea260 = Namen von Gründen werden auf { "128" } Zeichen gekürzt, und höchstens { "64" } verschiedene Gründe erhalten eine eigene Reihe; spätere werden unter <c1/> und in <c2/> gezählt, sodass eine feindliche oder fehlerhafte Eingabe keine unbegrenzte Label-Kardinalität erzeugen kann.

# text
# c1: band
# c2: calibrating
# c3: nominal
# c4: degraded
# c5: untrusted
# c6: unknown
# c7: kinematic
# c8: heading-course
# c9: cn0-drop
# c10: agc
# c11: raim
seg-35f3faf39d1c = <c1/> ist eines von <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Namen von Gründen sind die Monitornamen des Stroms (<c7/>, <c8/>, ...; beim Stapelergebnis <c9/>, <c10/>, <c11/>).

# text
# c1: deploy/grafana/kshana-gnss-trust.json
seg-a726fc8d28c2 = Ein Beispiel-Dashboard liegt in <c1/> (importieren Sie es und wählen Sie Ihre Prometheus-Datenquelle).

# text
seg-208f33eda580 = Syslog: CEF und LEEF

# text
# c1: kshana
# c2: GNSSTRUST
# c3: --syslog-octet-counting
# c4: <length> <message>
# c5: --syslog-all
# c6: Ashforde OU
seg-0d53db66a990 = Ereignisse werden in einem RFC-{ "5424" }-Umschlag (Facility local0, App <c1/>, Nachrichten-ID <c2/>) über UDP (je ein Datagramm; IPv4 oder IPv6) oder TCP gesendet, standardmäßig durch Zeilenumbruch abgeschlossen oder, mit <c3/>, als <c4/> gerahmt wie in RFC { "6587" }. Standardmäßig wird ein Ereignis pro Bandwechsel gesendet; <c5/> sendet eines pro Epoche. Der Hersteller wird als <c6/> (ASCII) geschrieben, damit kein SIEM ihn falsch dekodiert.

# text
seg-9cb6e1b9fec0 = Konzept

# text
seg-9e4ce52ac5d9 = Syslog-Schweregrad

# text
seg-084d2e726d3f = CEF-Schweregrad

# text
# c1: sev
seg-60fa1c602748 = LEEF <c1/>

# text
seg-7948fbcf87cb = calibrating

# text
seg-453691777f9d = { "6" } info

# text
seg-2ac57280bf6a = { "4" } warning

# text
seg-f757a767bd4a = untrusted

# text
seg-8e4e2d9142f9 = { "2" } critical

# text
seg-4c5b832482cb = unknown

# text
seg-5e4f3b0222cd = { "5" } notice

# text
# c1: gnss-trust.<band>
seg-b07ec4ccabf7 = Feldzuordnung (die Ereignis-ID ist <c1/>):

# text
seg-bfad2619553e = CEF

# text
# c1: ^
seg-62108c4b1d75 = LEEF { "2.0" } (Trennzeichen <c1/>)

# text
seg-18a4ca402cd9 = Kategorie

# text
seg-d3bc36a445cb = sendender Host

# text
seg-521cea5013c8 = Band

# text
# c1: cs1
# c2: band
seg-2b9153eb068d = <c1/> (Label <c2/>)

# text
seg-f1be6ef87011 = Gründe, durch Komma getrennt

# text
seg-e77a9847bc7b = vorheriges Band

# text
seg-87b7f1652b0c = Wert

# text
# c1: cfp1
# c2: trustScore
seg-470a89a86d79 = <c1/> (<c2/>), weggelassen, wenn keiner vorliegt

# text
seg-fc2aebb988bf = Epochenversatz, s

# text
seg-9f9d0d551742 = Label der Protokollzeit

# text
seg-57ed10b00272 = Gate-Zustand

# text
# c1: ;
# c2: degraded;environment,geometry
# c3: ;
# c4: degraded;;poor
# c5: good;;fair
seg-7159f151c079 = Geometriestatus, dann <c1/> und die Klassen der Abzüge der Epoche, durch Komma getrennt (zum Beispiel <c2/>) <em>(Eingaben { "1.3" })</em>; bei Eingaben, die das Label tragen ({ "0.36" }), ein drittes Feld, <c3/> und das Label, wobei das Klassenfeld dann stets vorhanden ist (zum Beispiel <c4/>, <c5/>)

# text
# c1: geoStatus
# c2: geoClass
# c3: geoLabel
seg-973339622a60 = <c1/> (nur Status), <c2/> (Klassen) und <c3/> (Label)

# text
seg-ae3a1d06bddf = HDOP

# text
seg-c431625778a6 = PDOP

# text
seg-e10eccec5f94 = ({ "0.36" }, mit dem Label)

# text
seg-e0a712018ced = VDOP <em>({ "0.36" }, mit dem Label)</em>

# text
seg-42273c09a591 = nicht übernommen: die vier benutzerdefinierten Gleitkommafelder sind belegt

# text
seg-292efe9557d6 = verwendete Satelliten <em>({ "0.36" }, mit dem Label)</em>

# text
# c1: cn1
# c2: geometryUsedSatellites
seg-179b75fd8f06 = <c1/> (<c2/>), eine Ganzzahl

# text
seg-f69551c20173 = Signalverlust: sichtbare Satelliten werden nicht verfolgt, obwohl ihre Geometrie gut ist

# text
# c1: degraded
# c2: environment
# c3: cs6
seg-bb927aab7541 = nicht als Feld übernommen (kein CEF-Wörterbuchschlüssel ist dafür frei): Der Status lautet <c1/> und die Klasse des Geometrieabzugs <c2/> in <c3/>

# text
# c1: geoSignalLoss=1
seg-6a80d53b2163 = <c1/>, nur solange es gilt

# text
# c1: cs2=
# c2: \
# c3: |
# c4: \
# c5: =
# c6: ^
seg-b295bf5bac3e = Leere Felder werden weggelassen (kein <c1/> ohne Gründe). Der Hostname wird auf { "255" } Zeichen gekürzt. Kopfwerte in CEF maskieren <c2/> und <c3/>; Erweiterungswerte maskieren <c4/>, <c5/> und Zeilenumbrüche. In LEEF-Werten werden <c6/> und Zeilenumbrüche durch Leerzeichen ersetzt.

# text
seg-a3b77e9593eb = OpenTelemetry (standardmäßig aus)

# text
# c1: --features otlp
# c2: --otlp http://host:4318/v1/metrics
# c3: kshana.trust.score
# c4: kshana.trust.band
# c5: kshana.trust.epochs
# c6: kshana.trust.reason.epochs
# c7: kshana.geometry.status
# c8: kshana.geometry.degraded
# c9: kshana.geometry.signal_loss
# c10: kshana.geometry.hdop
# c11: kshana.geometry.pdop
# c12: kshana.geometry.used_satellites
# c13: kshana.geometry.label
# c14: label
# c15: kshana.geometry.vdop
# c16: startTimeUnixNano
# c17: --otlp-every
# c18: https://
seg-396c34d29783 = Bauen Sie mit <c1/> und übergeben Sie <c2/>. Der Exporter sendet per POST OTLP/HTTP-JSON (<c3/>, <c4/>, <c5/>, <c6/> und bei Eingaben des Schemas { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> und, bei Eingaben, die das Label tragen ({ "0.36" }), <c13/> (Attribut <c14/>) und <c15/>; die kumulativen Summen tragen <c16/>) alle <c17/> Epochen (Standard { "10" }) und am Ende der Eingabe. Er fügt keine Abhängigkeit hinzu und hat kein TLS: Senden Sie an einen Collector auf demselben Host oder in einem vertrauenswürdigen Segment, der über TLS weiterleitet. Endpunkte mit <c18/> werden abgelehnt.

# text
seg-c3111d73a8b0 = <s1>Zurück</s1>Himmelsgeometrie und Horizontlinien

# text
seg-4c539b667a05 = <s1>Weiter</s1>Galileo-OSNMA-Verifikation

# text
# c1: cs6
# c2: flexString1
# c3: flexString
# c4: tests/cef_reference.rs
seg-1f099d4ef4b6 = In CEF verwendet die Geometrie nur benutzerdefinierte Felder aus dem Wörterbuch (keine erfundenen Schlüssel); das Label läuft in <c1/> statt in <c2/>, weil der Logstash-CEF-Codec die <c3/>-Felder nicht abbildet. Die Geometrieereignisse von { "1.3" }, einschließlich der Label-Fälle, sind Teil der CEF-Zeile der Stufe VALIDATED: Beide Referenz-Parser lesen sie wie geschrieben zurück (<c4/>, Änderungen { "4" } und { "5" }, jeweils registriert, bevor einer der Parser an seinen Fällen lief). Die Felder für Label, VDOP und Satellitenzahl werden nach jedem früheren Feld und jeder früheren Reihe angehängt, und nur für Eingaben, die das Label tragen, sodass eine Eingabe ohne Label genau wie zuvor ausgegeben wird.
