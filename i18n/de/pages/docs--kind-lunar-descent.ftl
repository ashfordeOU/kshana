# docs--kind-lunar-descent: translations (de)

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die übrigen stehen in <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunar</a1>. Hinweis: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit des Lebens. Jede Kennzeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Kennzeichnung erworben wird: der Abschnitt Evidenz der README).

seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunar</a1>

seg-6a26b9ab59fe = Themenseite: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differenziell

seg-2d84b341a41f = Ergebniskennzeichnung (der Engine): MODELLED

seg-626ab55f0424 = MODELLED (Ergebnis <c1/>)

seg-e66e2ca31e54 = Themenseite: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Quelle: <c1/>

seg-d4df5aa9b7b0 = <c1/> (Szenarioart)

seg-2cd0d5385530 = MODELLED Landestreuungsbudget für einen angetriebenen Abstieg zu einem Standort am Südpol (Artemis-Klasse). Je horizontaler Achse wird ein inertiales Fehlermodell mit fünf Zuständen (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Lagekippung, Kreisel-Bias) von der spezifischen Kraft des Abstiegs angetrieben; ein sequentieller Filter nimmt Positionslösungen aus den aktivierten Stützungen: eine AFS-Lösung aus den sichtbaren Relais einer ILLUSTRATIVE Konstellation der LCNS-Klasse (eigenständig oder differenziell mit dem Residuum der Korrekturverbindung aus lunar-differential-pnt, mit gestützter Uhr, wenn nur drei Relais sichtbar sind) und eine geländerelative Lösung (der TERCOM/SITAN-Abgleicher des Crates auf einem synthetischen Relief oder die Cramer-Rao-Schranke des Abgleichs eines Höhenfensters des echten LOLA-DEM des Südpols). Die Mondzeit geht bei den Lösungen über die Fahrzeuguhr ein (der LTC-TT-Versatz aus lunar-time-offset oder die Unsicherheit seines veröffentlichten Bandes) und als Zeitmarkenfehler entlang der Bahn. Sie gibt die 3-Sigma-Landeellipse an, R95, die geschlossenen inertialen Quellen, den Beitrag jeder Stützung, die Ablation jeder Kombination von Stützungen, eine Monte-Carlo-Kalibrierung der Ellipse und die weitergegebene Kovarianz. MODELLED: illustrative IMU-Klasse, Relaisgruppe, Abstiegsprofil und Lenkterm; terrain-nav verwendet ein synthetisches Relief auf einer irdischen Meterskala; die AFS-Verfügbarkeit ist eine Epoche bei einer flachen Maske. Nicht von einer Agentur gebilligt; beratende Software, keine zertifizierte Navigationsausrüstung.

seg-c6c1a8f184ed = Ein Lauf von <c1/> fasst sich so zusammen: lunar-descent | -89.50 deg | nur inertial 517/517 m (E/N) | mit Stützungen 7.6/4.8 m | Streuung R95 { "51" } m | 3-Sigma-Ellipse { "64" } x { "62" } m | { "99.1" } % innerhalb (erwartet { "98.9" } %) (MODELLED)

seg-dfdb7de68515 = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Das Beispiel <c1/> setzt unter anderem:

seg-8073ece4c900 = Das Diagramm, das die Engine für scenarios/lunar-descent.toml schreibt, Art lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Die Art und Phase <c1/>: ein inertiales Fehlermodell mit fünf Zuständen je Achse (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Neigung, Kreisel-Bias) über einen angetriebenen Abstieg, gestützt durch AFS-Lösungen (eigenständig oder differenziell, mit dem uhrgestützten Fall mit drei Relai

seg-bfe4c0a04288 = <b>MODELLED</b> Die Art und Phase <c1/>: ein inertiales Fehlermodell mit fünf Zuständen je Achse (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Neigung, Kreisel-Bias) über einen angetriebenen Abstieg,. Unabhängige Referenz (InternalConsistency): Die geschlossene inertiale Drift, die eigenen Ergebnisse der wiederverwendeten Arten und die Kalibrierung der 3-Sigma-Ellipse (der Anteil darin stimmt mit seiner Erwartung überein) in den Tests. Keine geflogene oder getestete Landung wird verglichen

seg-ed286f215c96 = MODELLED Landestreuungsbudget für einen angetriebenen Abstieg zu einem Standort am Südpol (Artemis-Klasse). (Artenkatalog (<c1/>))

seg-c1bd92ba429b = MODELLED: illustrative IMU-Klasse, Relaisgruppe, Abstiegsprofil und Lenkterm; terrain-nav verwendet ein synthetisches Relief auf einer irdischen Meterskala; die AFS-Verfügbarkeit ist eine Epoche bei einer flachen Maske. (Artenkatalog (<c1/>))

seg-85714bc3cf2a = EHRLICHKEIT: MODELLED. Die IMU-Klasse, das Abstiegsprofil, die Relaisgruppe, der Fehler im Signalraum und der Lenkterm sind ILLUSTRATIVE Eingaben, keine Messungen. Der Modus terrain-nav verwendet das eigenständige synthetische Relief und eine irdische Meterskala, sodass der Geländeterm hier das Verhalten des Abgleichers an einem Platzhalter ist, keine Aussage über das Relief am Südpol: Die Variante lola-crlb (lunar-descent-lola.toml) verwendet das echte (Kommentar in der Szenariodatei, Zeilen { "14" } bis { "20" })

seg-3eb1b3b03600 = Das Landestreuungsbudget an einem Standort am Mondpol (<c1/>) ist MODELLED, nicht validiert: gegen seine eigene geschlossene / analytische Identität geprüft – fängt Übertragungs- und Koeffizientenfehler ab, ist aber keine externe unabhängige Referenz. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Zurück</s1>lunar-beacon

seg-ca9b68783354 = <s1>Weiter</s1>lunar-differential-pnt
