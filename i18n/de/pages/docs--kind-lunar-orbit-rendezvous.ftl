# docs--kind-lunar-orbit-rendezvous: translations (de)

seg-34bdcfd66ded = Im Repository-Zweig, aus dem diese Dokumente stammen; noch nicht auf GitHub

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die übrigen stehen in <a1><c1/></a1>.

seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunar</a1>. Hinweis: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit des Lebens. Jede Kennzeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Kennzeichnung erworben wird: der Abschnitt Evidenz der README).

seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunar</a1>

seg-6a26b9ab59fe = Themenseite: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Ergebniskennzeichnung (der Engine): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Der von den Mondarten gemeinsam genutzte Propagator (GRAIL GL0660B Grad und Ordnung { "150" }, Erde und Sonne als dritte Körper, Relativität, DE440-Mondorientierung), verglichen mit den öff. Unabhängige Referenz (ExternalDataset): JPL-Horizons-Ephemeriden der Raumfahrzeuge LRO und CAPSTONE, gegen Zielwerte, die in xval/mission-thread-lunar/PREREGISTRATION.md vorab festgelegt wurden (Änderungen { "1" } bis { "6" }). LRO: MET, { "33" } m größte 3D-Differenz und { "2.4" } m RMS radial gegenüber { "500" } m und { "60" } m. CAPSTONE: NOT MET, eine Differenz der Endposition von { "136.8" } km gegenüber { "25" } km und eine Perilundifferenz von { "28.4" } km gegenüber { "10" } km, die Ursachen nicht isoliert. Die Zeile ist modelliert, weil der CAPSTON

seg-626ab55f0424 = MODELLED (Ergebnis <c1/>)

seg-e482c9896140 = Die Fortschreibung mit dem Mondkraftmodell gegen öffentliche rekonstruierte Trajektorien von Mondorbitern und cislunaren Flugkörpern ist MODELLED, nicht validiert: Eine Teilbehauptung wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit modelliert. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Themenseite: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Quelle: <c1/>

seg-8beb22a0eb0b = <c1/> (Szenarioart)

seg-2deefd8c547b = MODELLED Relativnavigation für ein Andocken im Stil von Orion und Lander in einer niedrigen Mondumlaufbahn oder einer elliptischen Polarbahn (Artemis-Klasse). Ein Verfolger und ein Ziel fliegen dieselbe Bahn unter dem Mondkraftmodell des Crates; eine gemeinsame Gauß-Newton-Batchschätzung mit 21 Parametern über den Bogen (zwei Fahrzeugzustände und beständige Biase im Signalraum) fusioniert je Fahrzeug eine absolute Positionslösung aus einer ILLUSTRATIVE Relaisgruppe der LCNS-Klasse (Relais hinter dem Mond werden verworfen, vier sind nötig, der Gleichtakt-Fehler im Signalraum hebt sich zwischen den Fahrzeugen auf) und eine Querverbindungsentfernung, mit einer Entfernungsmessgenauigkeit aus der Code-Tracking-Schranke des LunaNet-AFS-Piloten. Sie gibt den formalen und den Monte-Carlo-Fehler von Relativposition und -geschwindigkeit in den LVLH-Achsen des Ziels an, die Verfügbarkeit der Lösung, den mittleren normierten quadrierten Schätzfehler gegenüber seinem Erwartungswert und jeden Versuch, dessen Iteration nicht konvergiert ist, die Drift durch Vernachlässigung der Gravitationsharmonischen und die weitergegebene volle 6x6-Kovarianz. Für den Kreisfall gilt eine geschlossene Hill/Clohessy-Wiltshire-Prüfung. MODELLED: illustrative Relaisgruppe, Fehlerbudget und Priors; die Wahrheit und der Schätzer teilen ein Kraftmodell, daher prüft der NEES die Selbstkonsistenz und nicht den Modellfehler. Nicht von einer Agentur gebilligt; beratende Software, keine zertifizierte Navigationsausrüstung.

seg-a6d29fc5f19b = Ein Lauf von <c1/> fasst sich so zusammen: lunar-orbit-rendezvous | llo 100x100 km | sep { "2000" } m | Lösungen { "74" } % | rel pos 1-Sigma R/A/C 0.03/0.06/0.04 m | mittlerer NEES { "6.51" } ({ "6" } erwartet) | konvergiert bei { "2000" } s (MODELLED)

seg-b7c86affeac1 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Das Beispiel <c1/> setzt unter anderem:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Beratende Software, keine zertifizierte Navigat

seg-4466fb6f4043 = Batch-Gauß-Newton über den Bogen

seg-d97b2505ac72 = Das Diagramm, das die Engine für scenarios/lunar-orbit-rendezvous.toml schreibt, Art lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Die Art und Phase <c1/>: eine gemeinsame Gauß-Newton-Batchschätzung zweier Fahrzeuge über den Bogen (einundzwanzig Parameter: beide Zustände und beständige Positionsbiase im Signalraum, gemeinsame und unabhängige), ausgebaut über ein Viertel, die Hälfte Tests: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Die Art und Phase <c1/>: eine gemeinsame Gauß-Newton-Batchschätzung zweier Fahrzeuge über den Bogen (einundzwanzig Parameter: beide Zustände und beständige Signalraumbiase. Unabhängige Referenz (InternalConsistency): Selbstkonsistenz unter einer Vorregistrierung (xval/mission-thread-lunar/PREREGISTRATION.md, Ergebnisse und die Geschichte der Schätzer in RESULTS.md): Der mittlere NEES des Relativzustands beträgt { "5.85" } bis { "5.93" } gegenüber dem Band { "5.2" } bis { "6.8" } in vier Konfigurationen, MET beim vierten Schätzerentwurf, nachdem drei Entwürfe mit sequentiellem Filter verfehlt wurden; die Wahrheit und der Schätzer teilen ein Kraftmodell, daher sagt dies nichts über Modellfehler aus. Der Pro

seg-b2f273ea732d = MODELLED Relativnavigation für ein Andocken im Stil von Orion und Lander in einer niedrigen Mondumlaufbahn oder einer elliptischen Polarbahn (Artemis-Klasse). (Artenkatalog (<c1/>))

seg-9d4f99557cc5 = MODELLED: illustrative Relaisgruppe, Fehlerbudget und Priors; die Wahrheit und der Schätzer teilen ein Kraftmodell, daher prüft der NEES die Selbstkonsistenz und nicht den Modellfehler. (Artenkatalog (<c1/>))

seg-158e44d47c0b = EHRLICHKEIT: MODELLED. Die Relaisgruppe, der Fehler im Signalraum, der Gleichtaktanteil und die Priors sind ILLUSTRATIVE Eingaben, keine Messungen; die Wahrheit und der Schätzer teilen das Kraftmodell (einen eingebauten Zentralterm, J2 und C22). Die vorab festgelegte Konsistenzprüfung B1 (mittlerer NEES in [{ "5.2" }, { "6.8" }]) ist in allen vier Konfigurationen beim Batch-Entwurf erreicht: siehe xval/mission-thread-lunar/RESULTS.md. Keine Übereinstimmung mit irgendeinem re (Kommentar in der Szenariodatei, Zeilen { "10" } bis { "14" })

seg-2a88a9650804 = Relativnavigation bis zum Andocken in einer Mondumlaufbahn (<c1/>) ist MODELLED, nicht validiert: gegen seine eigene geschlossene / analytische Identität geprüft – fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Zurück</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Weiter</s1>lunar-station-coverage
