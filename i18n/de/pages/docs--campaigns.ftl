# docs--campaigns: translations (de)

# text
seg-f917e7fcac09 = Was es ist

# text
seg-cae10fb9bff8 = Szenario

# text
# c1: docs/CAMPAIGNS.md
seg-7603033b1c87 = Quelle: <c1/>

# text
# c1: campaign
# c2: kind
# c3: api::run_toml
# c4: kshana <file>.toml
seg-699c946d7d09 = Ein einzelnes Szenario beantwortet eine Frage zu einer Situation. Eine Mission ist eine Folge von Situationen, und eine Entwurfsstudie ist eine Familie davon. Die Szenarioart <c1/> setzt die bestehenden Arten zu einem Lauf zusammen, ohne eine davon neu zu implementieren: Jedes Mitglied ist eine gewöhnliche Szenariotabelle mit eigenem <c2/>, wird über <c3/> genau so abgewickelt, wie <c4/> es ausführen würde, und die Kampagne liest nur Zahlen aus den Ergebnisdokumenten zurück.

# text
seg-cb4f48673970 = Eine Kampagne ist <b>MODELLED</b>. Ihre Kompositionsidentitäten sind getestet (siehe unten), aber das Verketten von Phasen ist eine Modellierungsentscheidung, und jede Phase ist nur so gut wie die Art, die sie ausgeführt hat.

# text
seg-80e367fbc391 = Führen Sie eine aus wie jedes andere Szenario:

# text
seg-9f9995ebc904 = Eine Kampagne kann jede Kombination von vier Abschnitten enthalten; eine ohne Abschnitte läuft, und ihre Zusammenfassung besagt, dass sie nichts zusammengesetzt hat.

# text
# c1: [[phases]]
seg-002ddd72b3a2 = <c1/>: eine verkettete Mission auf einer Zeitleiste

# text
# c1: [timeline] step_s
seg-e99c4453b79d = Jede Phase führt ein oder mehrere Szenarien über ein Fenster einer gemeinsamen Missionszeitleiste aus, zum Beispiel eine Uhr im holdover und ein Trägheitsnavigationssystem (INS) im Auslauf zur selben Zeit. Die Ausgaben jedes Laufs werden in benannte <b>Kanäle</b> gelesen, zur Startzeit der Phase platziert und per Zero-Order-Hold auf ein gemeinsames Raster (<c1/>) umgetastet: Ein Rasterzeitpunkt übernimmt den letzten Abtastwert des Laufs der zugehörigen Phase zu oder vor diesem Zeitpunkt und ist null, wo kein Lauf dieser Phase den Kanal liefert.

# text
seg-842b77a21c5f = Kanal

# text
seg-b2eb598fab2a = Voreingestellte Quelle

# text
seg-f42465f7d066 = ns

# text
seg-fdb4600bf100 = Zeitfehler der Uhr

# text
seg-aef6b877191d = Zeitfehler-Wächter

# text
# c1: threshold_ns
seg-cc989ca58f1d = das eigene <c1/> des Laufs

# text
seg-5e9f7cd33017 = mittleres effektives Träger-zu-Rauschdichte-Verhältnis (C/N0) über die sichtbaren Satelliten

# text
# c1: jamming
# c2: epochs[].sats[].cn0_effective_dbhz
seg-af6f07319f2d = <c1/>: Mittelwert von <c2/>

# text
seg-f6b4ea158327 = Untergrenze des Tracking-Verlusts

# text
# c1: jamming
# c2: tracking_threshold_dbhz
seg-126535297c32 = <c1/>: das <c2/> des Szenarios, wenn es eines angibt

# text
seg-f8f430695a88 = Satelliten, die noch verfolgt werden

# text
seg-3f9a9f33010b = vertikales Schutzniveau

# text
seg-2cfc68fa1c15 = vertikale Alarmgrenze

# text
seg-d165177a255c = Positionsfehler

# text
seg-29651ae6be6f = Schwelle für den Positionsfehler

# text
seg-c893c5e3ace5 = { "1" }, solange irgendein Monitor der Phase alarmiert

# text
seg-ade1d7072512 = siehe unten

# text
# c1: <side>
# c2: classical
# c3: side = "quantum"
# c4: [[phases.runs.series]]
# c5: []
# c6: epochs[].t
# c7: input:
# c8: mean
# c9: min
# c10: max
# c11: count
seg-e8c7ac7d117f = <c1/> ist <c2/>, sofern der Lauf nicht <c3/> setzt. Jede andere Größe wird mit einem expliziten Eintrag <c4/> gelesen: ein Zeitpfad mit einem <c5/>, das die Zeilen benennt (<c6/>), ein Wertpfad, der diese Zeilen teilt, oder ein Skalar, der an jede Zeile gesendet wird (das Präfix <c7/> liest das Szenario des Laufs statt seines Ergebnisses), eine optionale Reduktion (<c8/>, <c9/>, <c10/>, <c11/>) für mehrere Werte unter einer Zeile, ein Maßstab und eine Einheit für einen Kanal, den die Kampagne nicht kennt.

# text
seg-7d7bc5d19a61 = <b>Alarme</b> stammen aus drei Quellen, innerhalb einer Phase per logischem ODER verknüpft:

# text
# c1: jamming
# c2: integrity
seg-74a10f5283ec = voreingestellte Flags, die aus dem Lauf gelesen werden: <c1/> alarmiert, solange weniger als vier Satelliten verfolgt werden (seine eigene Verfügbarkeitsdefinition); <c2/> alarmiert in Epochen, die es als nicht verfügbar markiert;

# text
# c1: carry
# c2: clock
# c3: guard_ns
# c4: gnss-ins
# c5: position_threshold_m
# c6: [[phases.runs.alarms]]
seg-f22be2880015 = voreingestellte Regeln auf den Kanälen der Phase, ausgewertet <b>nach</b> <c1/>: <c2/> alarmiert, solange der absolute Zeitfehler <c3/> überschreitet; <c4/>, solange der Positionsfehler <c5/> überschreitet; explizite Regeln stehen in <c6/>;

# text
# c1: spoof
# c2: detect_time_s
# c3: spoof-detect
seg-ccd94a7cb652 = alarmierende Ereignisse: <c1/> löst eines bei <c2/> seines uhrengestützten Monitors aus; <c3/> löst eines zu Beginn der Phase aus, wenn seine fusionierte Entscheidung alarmiert.

# text
seg-f88b8ad5672f = <b>Der Zustand wird weitergereicht</b> zwischen Phasen, auf drei ausdrückliche Arten:

# text
# c1: carry = ["time_error_ns"]
seg-0e3a0ee8e172 = <c1/> addiert den Wert des Kanals am Ende der vorigen Phase zu den Werten dieser Phase dafür. Die von einem Spoofer verstellte Uhrenphase ist der Punkt, von dem der holdover ausgeht. Das Addieren des Versatzes ist für die Uhrenphase exakt, die Frequenz integriert; bei einem Positionsfehler setzt es voraus, dass die beiden Fehler kollinear sind, der pessimistische Fall.

# text
# c1: [[phases.handoff]]
# c2: channel:<name>
seg-4db8b11391a5 = <c1/> schreibt vor dem Lauf eine Zahl aus der vorigen Phase (<c2/> für den Endwert eines Kanals oder jeden Ergebnispfad eines früheren Laufs) in einen gepunkteten Schlüssel des Szenarios dieser Phase, mit optionalem Maßstab und Versatz.

# text
# c1: end_at = "<result path>"
# c2: duration_s
# c3: classical.detect_time_s
seg-fdd5aa8b9627 = <c1/> beendet die Phase zu einem Zeitpunkt, den ein Lauf berechnet hat, begrenzt durch <c2/>. Die mitgelieferte Mission beendet ihre Spoofing-Phase bei <c3/>.

# text
# c1: skip_s
seg-cdd64676f509 = <c1/> verwirft vor dem Phasen-Nullpunkt die ersten Sekunden der eigenen Zeitleiste eines Laufs (einen Einschwingvorlauf).

# text
seg-d48bcd9890d3 = Die mitgelieferte Mission

# text
# c1: scenarios/campaign-jam-spoof-holdover-integrity.toml
seg-52fc5abca41f = <c1/> führt { "18" } Mitgliedsszenarien über sechs Phasen auf einem { "10" }-s-Raster aus:

# text
seg-baea4e05ad26 = Phase

# attr:aria-label, text
seg-9d3ee6a5613e = Läufe

# text
seg-87fbeeb9abb9 = Was die Zeitleiste zeigt

# text
seg-82bebc2bb038 = nominal, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-cf54dae64cb7 = <c1/>, <c2/> (kein Jammer), <c3/>

# text
seg-5cb80e4a7d4d = Zeitfehler { "0" } ns; C/N0 { "43.0" } dB-Hz gegenüber einer Untergrenze von { "25" } dB-Hz; vertikales Schutzniveau { "9.1" } bis { "21.6" } m gegenüber einer Alarmgrenze von { "50" } m

# text
seg-13c92a72544a = jamming, { "600" } s

# text
seg-f9c01304734d = dasselbe, Jammer bei -30 dBW, { "1" } km

# text
seg-27d3b65152b0 = C/N0 fällt auf { "27.7" } dB-Hz, alle { "8" } Satelliten werden noch verfolgt

# text
# c1: end_at
seg-6a052db03815 = Spoofing, bei { "370" } s durch <c1/> beendet

# text
# c1: spoof
# c2: spoof-detect
# c3: jamming
seg-89856c1f83f8 = <c1/> (Zeitrampe von { "0.1" } ns/s), <c2/>, <c3/>

# text
seg-cfcdd96b1132 = der Zeitfehler steigt rampenförmig auf { "36" } ns; der Hochfrequenzdetektor alarmiert zu Phasenbeginn, der uhrengestützte Monitor bei { "370" } s

# text
seg-92c8a76b84c2 = holdover, { "1800" } s

# text
# c1: clock
# c2: gnss-ins
# c3: jamming
seg-8a6e0b2898d1 = <c1/> (verweigert, trägt { "37.0" } ns), <c2/> (taktische Einheit im Auslauf), <c3/> bei { "10" } dBW

# text
seg-1948491e25ec = jeder Satellit verloren (C/N0 etwa -12 dB-Hz); Zeitfehler { "36.4" } bis { "62.7" } ns gegenüber dem Wächter von { "50" } ns; Positionsfehler bis { "24" } km

# text
seg-93e59087dd44 = integrity-alarm, { "600" } s

# text
# c1: clock
# c2: jamming
# c3: integrity
seg-f28f37baf8fe = <c1/> (trägt { "59.6" } ns), <c2/> und <c3/> mit einer Maske von { "25" } Grad

# text
seg-83d890c819f8 = { "5" } Satelliten werden verfolgt; Schutzniveau { "19" } bis { "135" } m, fehlend zu { "18" } von { "60" } Rasterzeitpunkten; der übernommene Zeitfehler, { "52.1" } bis { "61.7" } ns, bleibt über dem Wächter von { "50" } ns, sodass der Alarm die ganze Phase über aktiv ist

# text
seg-1ab40b7893db = recovery, { "600" } s

# text
seg-181d2a2f800b = Zeitfehler wieder bei { "0" } ns; Alarm ruhig

# text
# c1: integrity
seg-26ef3dc422ff = Die Integritätsläufe verwenden die eigene Nutzerspur des Beispiels <c1/> (eine Kreisspur in { "0.4" } km Höhe), nicht den festen Standort des jamming-Empfängers, und die Maske von { "25" } Grad steht für den Teilhimmel eines Empfängers, der neu erfasst. Das sind Szenarioentscheidungen, die in der Datei festgehalten sind.

# text
seg-03ae98f17988 = Eine vom L-Band-Spektrum getriebene Mission

# text
# c1: scenarios/campaign-spectrum-holdover-integrity.toml
# c2: spectrum
# c3: jamming
# c4: scenarios/l-band-waterfall-jamming.toml
seg-5daf8c8fdd83 = <c1/> führt { "8" } Mitgliedsszenarien über drei Phasen auf einem { "1" }-s-Raster aus, wobei das C/N0 von GPS L1 C/A und Galileo E1 aus der Art <c2/> gelesen wird (siehe <a1>SPECTRUM.md</a1>) statt aus der Satellitentabelle der Art <c3/>. Die Jammer sind die aus <c4/>.

# text
# c1: end_at
seg-7f34a00af961 = Einsatz, bei { "10" } s durch <c1/> beendet

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-471ec0d86f76 = <c1/>, <c2/> (Chirp ab { "10" } s), <c3/>

# text
# c1: timeline.bands[0].first_loss_t_s
seg-00b032242ebc = L1 C/A { "43.48" } und E1 { "44.73" } dB-Hz; die Phase endet beim eigenen ersten Verlust von L1 C/A im Spektrumlauf (<c1/>); Schutzniveau { "21.6" } m gegenüber { "50" } m

# text
seg-50220d719d5d = holdover, { "600" } s

# text
# c1: clock
# c2: spectrum
seg-50de7cd69ac0 = <c1/> (verweigert, trägt den Einsatzfehler, hier { "0" } ns), <c2/> (Chirp an)

# text
seg-1d59e94d94e5 = L1 C/A { "3.38" } und E1 { "4.44" } dB-Hz, beide unter der Untergrenze von { "25" } dB-Hz; Zeitfehler -0.07 bis { "5.06" } ns gegenüber dem Wächter von { "50" } ns; Alarm aktiv

# text
seg-6c56497d74fb = galileo-fallback, { "300" } s

# text
# c1: clock
# c2: spectrum
# c3: integrity
seg-62bcfd3e8732 = <c1/> (neu synchronisiert), <c2/> (CW-Ton auf dem L1-Träger), <c3/> auf einem Galileo-ähnlichen Walker 24/3/1

# text
seg-d455f0c06ee6 = L1 C/A bleibt bei { "17.98" } dB-Hz, E1 wieder bei { "44.73" } dB-Hz; Schutzniveau { "6.1" } bis { "17.7" } m; Alarm ruhig

# text
seg-2db37e292efe = Dass sich E1 unter dem CW-Ton erholt, beruht auf der Behandlung des kontinuierlichen Spektrums durch die Spektrumart: Der Ton sitzt in der Nullstelle des MBOC-Spektrums und koppelt nichts ein. Ein echter Ton würde über die Spektrallinien des Codes einkoppeln; das ist in der Datei und in SPECTRUM.md festgehalten.

# text
# c1: [sweep]
seg-fb8d8636c554 = <c1/>: ein Parameterraster über jede Art

# text
# c1: sweep-nd
# c2: runs > 1
# c3: k
# c4: k
# c5: scenarios/campaign-sweep-jammer-power.toml
seg-b14a11d60e9f = Ein bis drei gepunktete Szenarioschlüssel, jeweils über einen linearen oder logarithmischen Bereich, auf denselben Achsenwerten, die die Art <c1/> verwendet. Jede Achse hat einen Namen und eine Einheit; jede Metrik hat einen Namen und einen Ergebnispfad, und ihre Einheit wird aus dem eigenen Einheitenblock der durchlaufenen Art gelesen, sofern die Kampagne keine deklariert. Mit <c2/> ist jeder Knoten ein Monte-Carlo-Ensemble mit Startwerten (Realisierung <c3/> beim Startwert des Knotens plus <c4/>), das mit den unten genannten Statistiken berichtet wird. <c5/> durchläuft einen Jammer in { "1" } km Entfernung vom Empfänger von -50 bis +{ "10" } dBW: Das mittlere Verhältnis von Jammer zu Signal verschiebt sich genau um { "1" } dB je dB ({ "12.2" } bis { "72.2" } dB), und die Verfügbarkeit fällt zwischen -30 und -25 dBW von { "1" } auf { "0" }.

# text
# c1: system.2.sisre_m
# c2: sisre_m
# c3: [[system]]
# c4: case.0.system.0.shell.0.altitude_km
seg-c1931e311cca = Ein gepunkteter Schlüssel kann ein Array von Tabellen nach Position indizieren: <c1/> ist das <c2/> der dritten Tabelle <c3/>, und <c4/> reicht drei Ebenen tief.

# text
# c1: [monte_carlo]
seg-e774c578906d = <c1/>: ein Ensemble mit Startwerten

# text
# c1: k
# c2: base_seed + k
# c3: classical.series[-1].error_ns
seg-bbacb9c66f92 = Realisierung <c1/> führt das Szenario mit seinem auf <c2/> gesetzten Startwertschlüssel aus, der Konvention, die das Uhrenensemble bereits verwendet, sodass das Ensemble exakt reproduzierbar ist. Jede Metrik berichtet den Mittelwert, die Standardabweichung der Grundgesamtheit, das 5., 50. und 95. Perzentil nach dem Nearest-Rank-Verfahren, ein Perzentil-Bootstrap-{ "95" }-%-Konfidenzintervall des Mittelwerts mit festem Startwert ({ "2000" } Neuziehungen) und standardmäßig jede Stichprobe in der Reihenfolge der Startwerte. Ergebnispfade dürfen Arrays indizieren: <c3/> ist die letzte Stichprobe.

# text
# c1: [compose]
seg-ed182d15151d = <c1/>: mehrere Szenarien unter gemeinsamen Bedingungen

# text
# c1: scenarios/campaign-shared-jammer-sea-road.toml
seg-26fab14de534 = Benannte gemeinsame Werte (eine Zahl oder ein Array von Zahlen, mit einer Einheit) werden in jedes Mitglied an die Schlüssel geschrieben, an die es sie bindet, sodass die Mitglieder über die gemeinsame Bedingung nicht uneins sein können. Jedes Mitglied läuft, und für jede Metrik nennt die zusammengefasste Übersicht den kleinsten, größten und mittleren Wert über die Mitglieder und benennt das beste und das schlechteste. <c1/> setzt einen Jammer mit { "8" } dBW zwischen ein Schiff im Finnischen Meerbusen (etwa { "30" } km entfernt) und ein Auto auf einer Küstenstraße bei Helsinki (etwa { "50" } km): Das Schiff verliert jeden Satelliten (mittleres Verhältnis von Jammer zu Signal { "39.0" } dB), während das Auto mindestens vier behält ({ "34.6" } dB).

# text
# c1: [optimize]
seg-c888630c92d7 = <c1/>: der beste Wert einer Metrik

# text
# c1: [lo, hi]
# c2: lin
# c3: log
# c4: goal = "minimize"
# c5: "maximize"
# c6: "target"
# c7: target
seg-b54f0deedd0f = Ein bis drei gepunktete Szenarioschlüssel, jeweils auf <c1/> auf einer <c2/>- oder <c3/>-Skala begrenzt, werden nach dem besten Wert einer Metrik durchsucht (<c4/>, <c5/> oder <c6/>, das den Abstand von <c7/> minimiert).

# text
seg-b57ec5e5168a = Es gibt zwei Verfahren:

# text
# c1: method = "grid"
# c2: steps
seg-8fba07ce0cde = <c1/> führt jeden Knoten eines Rasters mit <c2/> je Schlüssel aus, auf den Achsenwerten des Sweeps.

# text
# c1: method = "nelder-mead"
# c2: max_evals
# c3: step
# c4: ftol
# c5: xtol
seg-844a7c1e3578 = <c1/> (der Standard) führt ein deterministisches Nelder-Mead-Simplex in je Schlüssel auf [{ "0" }, { "1" }] normierten Koordinaten aus. Probepunkte werden auf die Box projiziert. Der Abschnitt nimmt <c2/>, einen anfänglichen <c3/> und die Abbruchtoleranzen <c4/> und <c5/> entgegen.

# text
# c1: runs > 1
# c2: best_coords
# c3: best_metric
# c4: best_score
# c5: evals
# c6: stop_reason
# c7: trace
seg-2b1159b467f8 = Ein Lauf, dessen Metrik fehlt oder nicht endlich ist, wird als schlechtester bewertet und bleibt in der Spur erhalten. Mit <c1/> ist die Metrik bei jeder Auswertung der Mittelwert über dieselben Startwerte. Das Ergebnis liefert <c2/>, <c3/>, <c4/>, <c5/>, <c6/> und jede Auswertung in <c7/>.

# text
# c1: scenarios/campaign-optimize-link-budget.toml
seg-778a40736e7b = <c1/> sucht Reichweite und Datenrate für eine Verbindungsreserve von { "3" } dB. Das Optimum ist lokal zur Box und zum Start. Es ist MODELLED, nie eine globale Aussage.

# text
# c1: docs/design/evidence/cap32-optimize/
# c2: tests/campaign_optimize_reference.rs
seg-b94ab5e6dad4 = Das Protokoll und seine vorab festgelegten Zielwerte stehen in <c1/>. Der Test ist <c2/>. Die Ergebnisse:

# text
seg-232c68472fa4 = eine 1-D-Zielwertlösung stimmt mit der geschlossenen Form auf { "6e-15" } überein;

# text
seg-22f7abf70fc4 = das Rasterverfahren stimmt bitgenau mit einer unabhängigen Brute-Force-Schleife überein;

# text
seg-faea43f01e37 = das Simplex schneidet mindestens so gut ab wie das Raster { "41" } × { "41" }, mit etwa einem Zehntel seiner Läufe.

# text
seg-df1533fe6b95 = Der 1-D-Zielwert von Runde { "1" } ist als NOT MET festgehalten: Die vorab festgelegte Box schloss die Lösung aus.

# text
# c1: scenario_hash
# c2: reproducibility
# c3: run_digest
# c4: scenario_hash
seg-0862a4e9aa61 = Jedes Kampagnenergebnis trägt <c1/>, den SHA-256 (Secure Hash Algorithm { "2" }, 256-Bit-Digest) der kanonischen JavaScript-Object-Notation-Form (JSON) des Kampagnendokuments (Schlüsselreihenfolge und Formatierung ändern ihn nicht), und einen Block <c2/> mit der Zahl der Mitgliedsläufe und <c3/>, einem SHA-256 über den Digest jedes Mitgliedsergebnisses in Dispatch-Reihenfolge. Zwei Läufe mit demselben Digest haben byteidentische Mitgliedsergebnisse erzeugt. Jeder Phasenlauf hält außerdem seine Art fest, sein eigenes <c4/>, wo die Art eines hat, und den SHA-256 seines Ergebnisdokuments. Jede Zahl im Dokument hat einen Einheiteneintrag.

# text
seg-2eeddb87e889 = Der Kern ist sequenziell und liest keine Dateien, sodass eine Kampagne im WebAssembly-Build unverändert läuft. Kampagnen dürfen keine Kampagnen enthalten.

# text
seg-f9b8b78dd64a = Exporte

# text
# c1: --export
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
seg-c4443bf160f7 = <c1/> bei einer Kampagne schreibt jedes Mitgliedsszenario mit Geometrie als eigenen Dateisatz, wobei die Bezeichnung des Mitglieds vor das Formatsuffix eingefügt wird: jeden Phasenlauf (<c2/> oder <c3/>, wenn die Phase mehrere Läufe hat), das Basisszenario des Sweeps (<c4/>), das Monte-Carlo-Szenario (<c5/>) und jedes zusammengesetzte Mitglied (mit seiner eigenen Bezeichnung, mit den eingeschriebenen gebundenen gemeinsamen Werten). Ein Mitglied, das einem früheren gleicht, wird einmal geschrieben; Übergaben sowie zur Laufzeit angewandte Sweep- oder Startwerte stehen nicht in den exportierten Szenarien.

# text
seg-0ba270495309 = Ein Format, das keines der Mitglieder beschreiben kann, wird mit dieser Begründung zurückgewiesen. Die Tabelle je Szenario steht in <a1>INTEROP.md</a1>.

# text
seg-c20904c9d3b5 = LEO-PNT-Kampagnen

# text
seg-a598e2c06f51 = Fünfzehn mitgelieferte Kampagnen rahmen Fragen der Positionierung, Navigation und Zeitgebung (PNT) im niedrigen Erdorbit (LEO); <a1>LEO-PNT.md</a1> beschreibt, was jede zeigt. Was jede ausführt, wie es die Kommandozeile zusammenfasst:

# text
seg-f65b1f2b4182 = Modus

# text
seg-e7d7defa7e71 = Frage

# text
seg-08ab59acfe62 = compose, { "4" } Mitglieder

# text
seg-a21e4db0fda9 = Dienstdaten der Navigationsnachricht gegenüber der Rahmenlänge

# text
# c1: leo-pvt
seg-6c29f4690d2c = Sweep von <c1/>, { "7" } Knoten

# text
seg-97fba77aa2ec = fusionierte MEO- und LEO-Positionierung gegenüber dem Signal-in-Space-Entfernungsfehler (SISRE) von LEO

# text
seg-7b9fbe34d38c = compose, { "2" } Mitglieder

# text
seg-28352bd0c9e3 = LEO-PNT in Gebäuden nach Band und Gebäudeklasse

# text
# c1: leo-pass
seg-a447c56022ec = Sweep von <c1/>, { "9" } Knoten

# text
seg-5b3cbfced221 = Energie je Fix im Internet der Dinge (IoT) gegenüber der LEO-UHF-Sendeleistung

# text
# c1: ntn-positioning
seg-3ebd95e5933a = Sweep von <c1/>, { "9" } Knoten

# text
seg-cfbac004ff64 = Positionierung über nichtterrestrische Netze (NTN) gegenüber der Bandbreite des Referenzsignals

# text
# c1: leo-ppp
seg-07e8765975d1 = Sweep von <c1/>, { "3" } Knoten

# text
seg-db872d35033e = Konvergenz der präzisen Punktpositionierung (PPP) gegenüber der Höhe einer LEO-Schicht mit 192 Satelliten

# text
seg-a4ec677dc4e6 = Kette, { "3" } Phasen über { "2100" } s

# text
seg-2d91ecf8455d = Globales Navigationssatellitensystem (GNSS) gestört, die LEO-Schicht trägt den Nutzer, Integrität bleibt gewahrt

# text
# c1: spectrum
seg-c44991a2a24e = Sweep von <c1/>, { "13" } Knoten

# text
seg-4b6e292d88f5 = LEO-Banddiversität gegenüber einem L-Band-Sperrjammer

# text
seg-30d86b528bee = die Spoofing-Monitore gegenüber vier Spoofern

# text
seg-1690baf3a1b8 = Kette, { "1" } Phase über { "86 400" } s

# text
seg-4d5b507c04de = Zeitgebung von 5G-Basisstationen: holdover und LEO-Zeit

# text
seg-d32a80c40470 = Kette, { "3" } Phasen über { "1440" } s

# text
seg-c38f9d3bd54e = Containerverfolgung mit LEO-UHF: Energie je Fix entlang einer Reise

# text
seg-9bf38e403696 = Kette, { "2" } Phasen über { "1500" } s

# text
seg-dea7117552f4 = ein autonomes Fahrzeug in einer Straßenschlucht mit einer LEO-Schicht

# text
seg-dbbd9ffcbfb4 = Kette, { "2" } Phasen über { "1800" } s

# text
# c1: city-street
seg-37c0c3570023 = dieselbe Straßenschlucht als flache Abschaltgrenze von { "35" } Grad und als Horizontlinie <c1/>

# text
seg-ccaa34122145 = Kette, { "2" } Phasen über { "87 000" } s

# text
seg-d16d8b2e9089 = Zeitgebung kritischer Infrastruktur: holdover mit LEO-Zeit

# text
seg-4ee0b3036f4a = Kette, { "3" } Phasen über { "10 800" } s

# text
seg-157c5bec7f5f = polare und arktische Nutzer mit einer polaren LEO-Schicht

# text
seg-64404160d0e7 = Kette, { "3" } Phasen über { "2520" } s

# text
seg-a35e1603ba32 = Eisenbahn- und Seeverkehrsnutzer mit einer LEO-Schicht

# text
seg-3d819fa3fd1c = MEO ist der mittlere Erdorbit, UHF ultrahohe Frequenz und 5G die fünfte Generation der Mobilfunknetze.

# text
seg-490920844143 = Was geprüft wird

# text
# c1: tests/campaign_composition_reference.rs
seg-483b1d4efb20 = <c1/> legt die Kompositionsidentitäten fest:

# text
# c1: clock
# c2: integrity
# c3: jamming
# c4: run_toml
seg-881d97a3fa2b = <b>Eine einphasige Kampagne reproduziert den eigenständigen Lauf bitgenau.</b> Für <c1/>, <c2/> und <c3/> ist das Ergebnisdokument des Mitglieds byteidentisch mit <c4/> auf der Szenariodatei, sein Digest ist der, den die Kampagne berichtet, und mit dem Raster im eigenen Schritt des Laufs entspricht jeder ausgerichtete Wert dem Wert der eigenständigen Reihe (das jamming-C/N0 entspricht dem unabhängig aus dem eigenständigen Dokument berechneten Mittelwert).

# text
seg-1a9e1ed5b18c = <b>Ein Sweep mit einem Knoten und eine Komposition mit einem Mitglied</b> lesen genau die eigenständige Zahl.

# text
# c1: k
# c2: seed + k
seg-883bb72e1239 = <b>Ein Ensemble mit festem Startwert ist byte-stabil</b>, und Realisierung <c1/> ist genau der eigenständige Lauf bei <c2/>; der Kampagnen-Hash ignoriert die Schlüsselreihenfolge.

# text
seg-170bc86059fa = Ein analytischer Fall.

# text
# c1: scenarios/campaign-monte-carlo-clock-holdover.toml
seg-0fd27291d6f4 = <c1/> führt { "200" } Startwerte einer Chip-Scale-Atomuhr mit ausschließlich weißem Frequenzrauschen aus (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), auf { "590" } s synchronisiert und bis { "3600" } s im Auslauf. Der Endzeitfehler ist gaußverteilt mit Mittelwert { "0" } und Standardabweichung sqrt(q_wf * { "3010" } s) = { "16.459" } ns (der Random Walk der Phase unter weißem Frequenzrauschen, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Das berichtete Intervall, [-2.52, { "1.59" }] ns, enthält den wahren Mittelwert { "0" }; die Stichprobenstandardabweichung, { "14.93" } ns, ergibt eine Chi-Quadrat-Statistik von { "164.5" } bei { "199" } Freiheitsgraden, innerhalb des zweiseitigen { "99" }-%-Intervalls [{ "151.37" }, { "254.14" }]. Bei { "3000" } Startwerten ergibt dasselbe Szenario { "16.31" } ns.

# text
seg-61b54a16243f = <b>Die spektrumgetriebene Kette</b> liest die eigenständigen Zahlen: Die Einsatzphase dauert genau so lange wie die Zeit bis zum ersten Verlust im Spektrumlauf, und jeder Wert von L1 C/A und E1 auf der Zeitleiste entspricht, auf { "1e-9" } dB, der Zeile des eigenständigen Wasserfallbeispiels für denselben Jammerzustand (nominal, Chirp allein, CW-Ton allein).

# text
seg-5ebc02a24ce1 = <b>Die Kette</b> reicht den Zustand wie dokumentiert weiter: Die Spoofing-Phase dauert genau so lange wie die Erkennungszeit des Spoofing-Laufs, der holdover übernimmt genau den Versatz des Spoofing-Laufs bei der Erkennung, recovery übernimmt nichts, und der Alarm ist überall dort aktiv, wo das Schutzniveau fehlt oder die Alarmgrenze überschreitet.

# text
seg-153e28bcb38a = Diese Prüfungen stellen sicher, dass das Zusammensetzen nichts ändert, was es nicht ändern darf. Sie validieren keine verkettete Mission gegen eine gemessene, weshalb die drei Kampagnenzeilen in <a1>VERIFICATION-MATRIX.md</a1> MODELLED sind.

# text
seg-e82860f2d902 = <s1>Zurück</s1>Echte TLEs verwenden

# text
seg-e40757a0b4cb = <s1>Weiter</s1>Laufberichte

# text
seg-e65edbaca6bf = [[phases]]: eine verkettete Mission auf einer Zeitleiste

# text
seg-a433ddf74e55 = [sweep]: ein Parameterraster über jede Art

# text
seg-7ca90ac531bf = [monte_carlo]: ein Ensemble mit Startwerten

# text
seg-03d764a4cb56 = [compose]: mehrere Szenarien unter gemeinsamen Bedingungen

# text
seg-61a0db2550ba = [optimize]: der beste Wert einer Metrik
