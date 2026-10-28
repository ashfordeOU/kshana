# docs--kind-lunar-ascent: translations (de)

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunar</a1>. Hinweis: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit des Lebens. Jede Kennzeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Kennzeichnung erworben wird: der Abschnitt Evidenz der README).

seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunar</a1>

seg-6a26b9ab59fe = Themenseite: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Quelle: <c1/>

seg-b8ef47331221 = <c1/> (Szenarioart)

seg-ae3053a1f6c8 = MODELLED angetriebener Aufstieg von einem Oberflächenstandort am Südpol in die Rendezvous-Umlaufbahn und die Positions-Geschwindigkeits-Kovarianz, die er zurück in die Umlaufbahn trägt (Artemis-Klasse). Das inertiale Fehlermodell mit fünf Zuständen je Achse aus lunar-descent (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Lagekippung, Kreisel-Bias, angetrieben durch die spezifische Kraft) läuft auf allen drei Standortachsen ab dem Oberflächenzustand, mit dem die Phase beginnt; eine AFS-Positionslösung aus den sichtbaren Relais einer ILLUSTRATIVE Konstellation der LCNS-Klasse (eigenständig oder differenziell mit dem Residuum der Korrekturverbindung aus lunar-differential-pnt, mit gestützter Uhr, wenn nur drei Relais sichtbar sind) wird in einem genannten Intervall genommen, wobei die Mondzeit über die Fahrzeuguhr und ein Zeitmarkenfehler entlang der Bahn eingehen. Sie gibt die geschlossenen inertialen Quellen an, den Beitrag der Stützung, die Ablation, die Navigations-1-Sigma über den Aufstieg, die Streuung beim Triebwerksabschalten neben dem Navigationswissen und die volle 6x6-MCI-Kovarianz beim Einschwenken, wobei die Positions-Geschwindigkeits-Korrelation erhalten bleibt. MODELLED: illustrative IMU-Klasse, spezifische Kraft, Relaisgruppe und Streuung beim Abschalten; Fehler in den Achsen des Startstandorts gehalten; der nominale Endzustand ist ein Platzhalter. Nicht von einer Agentur gebilligt; beratende Software, keine zertifizierte Navigationsausrüstung.

seg-fc4d2ba3f99e = Ein Lauf von <c1/> fasst sich so zusammen: lunar-ascent | -89.50 deg | nur inertial { "785" } m / { "3.49" } m/s | mit AFS { "11.4" } m / { "0.071" } m/s | Einschwenkstreuung { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Das Beispiel <c1/> setzt unter anderem:

seg-ebc18c9bcbac = differenziell

seg-3843825d0733 = us

seg-2d84b341a41f = Ergebniskennzeichnung (der Engine): MODELLED

seg-463a919e84d5 = Das Diagramm, das die Engine für scenarios/lunar-ascent.toml schreibt, Art lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Die Art und Phase <c1/>: das inertiale Fehlermodell mit fünf Zuständen je Achse über einen angetriebenen Aufstieg mit spezifischer Kraft entlang des Pfads, gestützt durch AFS-Lösungen und Mondzeit, mit Angabe der Positions- und Geschwindigkeitskovarianz beim Einschwenken, die in die Umlaufbahn getragen wird

seg-4e0c4b02eac0 = <b>MODELLED</b> Die Art und Phase <c1/>: das inertiale Fehlermodell mit fünf Zuständen je Achse über einen angetriebenen Aufstieg mit spezifischer Kraft entlang des Pfads, gestützt durch AFS-Lösungen. Unabhängige Referenz (InternalConsistency): Die geschlossene inertiale Drift und Monotonieprüfungen in den Tests. Kein geflogener Aufstieg wird verglichen

seg-8732ad9f7e07 = <b>MODELLED</b> Der von den Mondarten gemeinsam genutzte Propagator (GRAIL GL0660B Grad und Ordnung { "150" }, Erde und Sonne als dritte Körper, Relativität, DE440-Mondorientierung), verglichen mit den öff. Unabhängige Referenz (ExternalDataset): JPL-Horizons-Ephemeriden der Raumfahrzeuge LRO und CAPSTONE, gegen Zielwerte, die in xval/mission-thread-lunar/PREREGISTRATION.md vorab festgelegt wurden (Änderungen { "1" } bis { "6" }). LRO: MET, { "33" } m größte 3D-Differenz und { "2.4" } m RMS radial gegenüber { "500" } m und { "60" } m. CAPSTONE: NOT MET, eine Differenz der Endposition von { "136.8" } km gegenüber { "25" } km und eine Perilundifferenz von { "28.4" } km gegenüber { "10" } km, die Ursachen nicht isoliert. Die Zeile ist Modelled, weil der CAPSTON

seg-626ab55f0424 = MODELLED (Ergebnis <c1/>)

seg-745dfc03a929 = MODELLED angetriebener Aufstieg von einem Oberflächenstandort am Südpol in die Rendezvous-Umlaufbahn und die Positions-Geschwindigkeits-Kovarianz, die er zurück in die Umlaufbahn trägt (Artemis-Klasse). (Artenkatalog (<c1/>))

seg-3fd0cca78937 = MODELLED: illustrative IMU-Klasse, spezifische Kraft, Relaisgruppe und Streuung beim Abschalten; Fehler in den Achsen des Startstandorts gehalten; der nominale Endzustand ist ein Platzhalter. (Artenkatalog (<c1/>))

seg-2cfb37d39847 = EHRLICHKEIT: MODELLED. Die IMU-Klasse, die Ausrichtung, die spezifische Kraft und die Streuung beim Abschalten sind ILLUSTRATIVE Eingaben, keine Messungen. Die Fehler werden in den Ost-Nord-Oben-Achsen des Startstandorts gehalten, ohne die Krümmung des Pfads in Flugrichtung, und der nominale Endzustand ist ein Platzhalter an der lokalen Vertikalen des Standorts: Nur die Kovarianz ist das Ergebnis. Es wird keine Übereinstimmung mit einem realen Fahrzeug behauptet. Beratende Software, keine zertifizierte (Kommentar in der Szenariodatei, Zeilen { "11" } bis { "15" })

seg-6faf49cac41a = Angetriebener Aufstieg von einem Standort am Mondpol in eine Einschwenkbahn (<c1/>) ist MODELLED, nicht validiert: gegen seine eigene geschlossene / analytische Identität geprüft – fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = Die Fortschreibung mit dem Mondkraftmodell gegen öffentliche rekonstruierte Trajektorien von Mondorbitern und cislunaren Flugkörpern ist MODELLED, nicht validiert: Eine Teilbehauptung wird extern geprüft, aber die gesamte Fähigkeit setzt sich aus modellierten Teilen zusammen, daher bleibt die Fähigkeit Modelled. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Themenseite: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Zurück</s1>link-budget

seg-59d4cb995cb9 = <s1>Weiter</s1>lunar-attack-surface
