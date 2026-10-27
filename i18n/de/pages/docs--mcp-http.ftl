# docs--mcp-http: translations (de)

# text
# c1: docs/deploy/mcp-http.md
seg-c8bab9114d57 = Quelle: <c1/>

# text
seg-4bd138b7d28a = kshana-mcp über HTTP betreiben (selbst gehostet)

# text
seg-7ca89d6e0201 = Eine Passage, die KI-Clients von Drittanbietern nennt, ist hier weggelassen; sie steht in <a1>docs/deploy/mcp-http.md</a1> auf GitHub.

# text
# c1: kshana
seg-2f5b3bdb7d0b = <b>Kshana hostet keinen Endpunkt.</b> Es gibt keinen gemeinsamen <c1/>-Server, auf den ein Client zeigen könnte. Sie betreiben es auf Ihrer eigenen Maschine, Ihrem eigenen Container oder Cloud-Projekt und besitzen seine Zugriffskontrolle und Kosten. Der Server { $version } ist der in diesem Repository: Seine Werte tragen ihre Kennzeichnungen VALIDATED oder MODELLED genau wie über stdio.

# text
seg-113a79ece785 = Die sicheren Voreinstellungen

# text
seg-2bdbe06123c8 = Kontrolle

# text
seg-640f28207e8a = Verhalten

# text
seg-9bc8fe53a948 = Bind-Adresse

# text
# c1: 127.0.0.1
# c2: ::1
# c3: --http 8080
# c4: 127.0.0.1:8080
seg-82001913f285 = Nur Loopback (<c1/>, <c2/>). Ein bloßer Port (<c3/>) bedeutet <c4/>.

# text
# c1: --allow-remote
# c2: KSHANA_MCP_HTTP_TOKEN
seg-f2adda2d3e22 = Braucht <c1/> <b>und</b> ein Bearer-Token in der Umgebungsvariable <c2/> ({ "16" } Zeichen oder mehr). Ohne beides weigert sich der Server zu starten. Mit beidem gibt er eine Warnung aus, dass er über diese Maschine hinaus lauscht.

# text
seg-6fbe07565c36 = Authentifizierung

# text
# c1: Authorization: Bearer <token>
# c2: 401
seg-d5cbeb0cd3d6 = <c1/> bei jeder Anfrage, wenn ein Token gesetzt ist (es kann auch auf Loopback gesetzt werden). In konstanter Zeit verglichen. Fehlend oder falsch: <c2/>.

# text
seg-1962f434458b = Dateisystem

# text
# c1: iq_*
# c2: KSHANA_MCP_IQ_DIR
seg-1a9e048d348d = Keines. Die IQ-Dateiwerkzeuge (<c1/>) sind im HTTP-Modus abgeschaltet, was auch immer <c2/> sagt; jedes andere Werkzeug nimmt sein Szenario inline und lehnt eines ab, das eine Datei nennt. Kein Werkzeugargument liest oder schreibt einen Pfad.

# text
seg-19261cdd2ef0 = Körpergröße

# text
# c1: --max-body-bytes
# c2: 413
seg-c4db8c1454f4 = <c1/>, Standard { "5" } MiB (die Szenariogrenze ist { "4" } MiB). Darüber: <c2/>, ob die Länge deklariert ist oder der Körper in Chunks gesendet wird.

# text
seg-da9103d627dd = Antwortzeit

# text
# c1: --request-timeout-secs
# c2: 408
# c3: 408
seg-3f013a632773 = <c1/>, Standard { "120" }. Darüber: <c2/>. <b>Dies begrenzt, wie lange ein Aufrufer wartet, nicht die Arbeit</b>: Ein bereits laufender Lauf kann nicht gestoppt werden, daher läuft er nach dem <c3/> weiter und endet im Hintergrund.

# text
seg-a588b12596b7 = Nebenläufigkeit

# text
# c1: --max-concurrent
# c2: 503
# c3: Retry-After
seg-aa2214db3bdc = <c1/>, Standard { "8" }. Darüber hinaus erhält eine Anfrage sofort <c2/> mit <c3/>; keine wird eingereiht.

# text
seg-87576ded5272 = Arbeitspool

# text
# c1: --max-concurrent
seg-7f9c63e3e5e6 = Jeder Werkzeugaufruf läuft auf einem blockierenden Thread innerhalb eines Pools von <c1/> Plätzen, nie auf den asynchronen Workern, sodass ein langer Lauf den Server nicht daran hindern kann zu antworten. Ein Platz wird erst frei, wenn der Lauf selbst endet, nicht wenn der Aufrufer aufgibt: Aufgegebene Läufe können sich daher nicht über die Poolgröße hinaus ansammeln, und ein Aufruf, der den Pool voll findet, wird als ausgelastet abgelehnt.

# text
seg-4a97b035483c = Arbeitsbudget

# text
# c1: runs
# c2: kshana
seg-91c788b33b25 = Ein Szenario, das weit mehr verlangt als die mitgelieferten Beispiele, wird vor dem Lauf abgelehnt: mehr als { "1000" } Monte-Carlo-Realisierungen (<c1/>), ein Parameter-Gitter mit mehr als { "1000" } Knoten, mehr als { "5000" } Mitgliedsläufe (Gitterknoten mal Realisierungen) oder ein Zeitgitter mit mehr als { "2" } Millionen Epochen. Der Fehler nennt das Feld, das zu senken ist. Dasselbe Budget gilt über stdio; die Befehlszeile <c2/> hat keines.

# text
seg-79c6b146637c = CORS

# text
# c1: Access-Control-*
# c2: Origin
# c3: 403
# c4: --allow-origin <scheme://host[:port]>
# c5: *
seg-68fa7d9f1321 = Es wird nie ein <c1/>-Header gesendet. Eine Anfrage mit einem Header <c2/> wird abgelehnt (<c3/>), es sei denn, er wird mit <c4/> genannt; <c5/> wird nicht akzeptiert.

# text
seg-d7f157fdf003 = Host-Header

# text
# c1: --allowed-host
# c2: --allowed-host your.domain
# c3: 403
seg-d7966e93ef1a = Geprüft gegen Loopback-Namen oder die Bind-Adresse plus jedes <c1/>. Hinter einem Proxy oder bei einer Plattform-URL übergeben Sie <c2/>. Alles andere: <c3/>.

# text
seg-12d5cf72f363 = Sitzungen

# text
seg-58dfe5665877 = Keine. Jeder POST erhält eine JSON-Antwort; es wird keine Sitzungstabelle und kein Server-Sent-Event-Strom offen gehalten.

# text
# c1: kshana-mcp
seg-adbc92ebc196 = TLS wird nicht von <c1/> terminiert. Ist es über eine Maschine hinaus erreichbar, stellen Sie HTTPS davor (das TLS Ihrer Plattform oder einen Reverse Proxy) und halten Sie das Token geheim; ein Bearer-Token über einfaches HTTP kann auf der Leitung gelesen werden.

# text
seg-1b21740b9c63 = Lokal

# text
seg-a6194f5a52f8 = Client-Konfiguration (ein URL-Client; fügen Sie den Header nur hinzu, wenn ein Token gesetzt ist):

# text
seg-a683980168f7 = Docker

# text
# c1: 0.0.0.0
# c2: --allow-remote
# c3: 127.0.0.1:8080:8080
# c4: 127.0.0.1:
# c5: docker compose
# c6: mcp-http/
seg-81df4f5cd02e = Im Container muss der Server auf <c1/> lauschen, daher braucht er <c2/> und das Token. Das Veröffentlichen des Ports als <c3/> hält ihn auf Ihrer Maschine; lassen Sie das <c4/> nur weg, wenn Sie ihn freigeben wollen, und terminieren Sie dann TLS davor. Vorlagen für <c5/> sowie Fly.io und Cloud Run stehen in <a1><c6/></a1>.

# text
seg-8b8bef7174e8 = Vorlagen (Sie setzen sie ein; Kshana betreibt keine)

# text
# c1: mcp-http/fly.toml
# c2: fly secrets set KSHANA_MCP_HTTP_TOKEN=...
seg-198bea1e0595 = <a1><c1/></a1>: Setzen Sie das Token mit <c2/>

# text
# c1: mcp-http/cloudrun.service.yaml
seg-c33701cb9ca2 = <a1><c1/></a1>: Nehmen Sie das Token aus dem Secret Manager

# text
# c1: --allowed-host
seg-b86ddb72b916 = Jede führt das veröffentlichte Image aus, setzt <c1/> auf den Hostnamen der Plattform, den Sie in der Datei ersetzen, und verlässt sich für HTTPS auf die Plattform.

# text
seg-ce3a5326cb95 = Legen Sie auf der Plattform eine CPU- und Speichergrenze fest

# text
# c1: cpus
# c2: mem_limit
# c3: [[vm]]
# c4: resources.limits
# c5: --max-concurrent
seg-e1fc13672597 = Timeout, Pool und Budget begrenzen, wie viel Arbeit zugelassen wird, aber ein zugelassener Aufruf kann dennoch lange einen Kern nutzen, und ein großes Ergebnis kann Hunderte Megabyte nutzen. Setzen Sie auch am Container eine harte Grenze: Die Vorlagen fordern { "2" } CPUs und { "1" } GiB (<c1/> und <c2/> in Compose, <c3/> in Fly, <c4/> in Cloud Run). Halten Sie <c5/> auf oder unter der CPU-Anzahl.

# text
seg-058781b052c4 = Was es nicht ist

# text
seg-90edc7ff2a55 = Kein mandantenfähiger Dienst. Jeder, der das Token hat, führt Simulationen auf Ihrer Hardware aus; es gibt keine Quoten je Benutzer über die obigen Grenzen hinaus.

# text
seg-5b3b9c610f31 = Beratend, keine typzugelassene Navigationsausrüstung: Der Betreiber bleibt für die Navigation verantwortlich. Die Ausgaben des Simulators sind modellierte oder validierte Werte für die Analyse, wie überall sonst in Kshana.

# text
seg-c33947d44b06 = <s1>Zurück</s1>MCP-Server: jeder Installationskanal

# text
seg-a9d67efe493a = <s1>Weiter</s1>Kshana aus einem Agenten verwenden
