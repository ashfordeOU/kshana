# docs--kind-lunar-surface: translations (de)

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-51362910dcb7 = { "2" } mitgelieferte Szenarien verwenden diese Art; die übrigen stehen in <a1><c1/></a1>.

seg-1f17ef6a853e = Szenarioart der Engine v{ $version }, Familie <a1>Mond und cislunar</a1>. Hinweis: Analyseausgabe eines Forschungs- und Engineering-Werkzeugs, keine typzugelassene Navigationsausrüstung und kein Dienst für die Sicherheit des Lebens. Jede Kennzeichnung hier stammt von der Engine oder der Verifikationsmatrix; eine Art ist MODELLED, sofern die Matrix nichts anderes sagt (wie eine Kennzeichnung erworben wird: der Abschnitt Evidenz der README).

seg-1c1eeb2dcaa0 = Familienseite: <a1>Mond und cislunar</a1>

seg-6a26b9ab59fe = Themenseite: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Ergebniskennzeichnung (der Engine): MODELLED

seg-626ab55f0424 = MODELLED (Ergebnis <c1/>)

seg-e66e2ca31e54 = Themenseite: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Beratende Software, keine zertifizierte Navigat

seg-feea03a2c628 = Quelle: <c1/>

seg-6c0eff9f9211 = <c1/> (Szenarioart)

seg-6c7d25f672fb = MODELLED Verfügbarkeit von Positionierung und Zeitgebung an der Oberfläche nach Standort und Jahreszeit für Standorte am Südpol im Artemis-Stil. Für jeden Standort und jede Jahreszeit (eine Epoche und ein Fenster danach) gibt sie die Relaispositionierung an (vier oder mehr Relais einer ILLUSTRATIVE Konstellation der LCNS-Klasse in Sicht und PDOP unter einer Schwelle, aus denselben Funktionen wie moonlight-service-volume und, mit einem Geländeabschnitt, dem per Strahlverfolgung berechneten Horizont des Geländes von lunar-station-coverage), ob Erde und Sonne über dem Horizont des Standorts stehen (analytische Sonne, analytischer Mond und analytische Mondorientierung, Libration eingeschlossen, was sich mit der Jahreszeit verändert) und die Zeitgebungsverfügbarkeit (ein Relais oder die Erde in Sicht) mit der längsten Strecke ohne beides, dem holdover, den eine Oberflächenuhr überbrücken muss. Ein Ergebnis für einen einzelnen Standort ist bitgenau gleich dem von moonlight-service-volume. MODELLED: illustrative Kepler-Relaisgruppe an einem Mond mit mittlerer Rotation; der Relaiswert ändert sich nicht mit der Jahreszeit; das Gelände ist der LOLA-Ausschnitt von { "1200" } m. Nicht von einer Agentur gebilligt; beratende Software, keine zertifizierte Navigationsausrüstung.

seg-3c13aefe4093 = Ein Lauf von <c1/> fasst sich so zusammen: lunar-surface | { "4" } Standorte x { "4" } Jahreszeiten | Positionierung { "41" } % bis { "41" } % | schlechteste Zeitgebungsverfügbarkeit { "100.0" } % | längste Zeitgebungslücke { "0.0" } h (MODELLED)

seg-02bc245c436e = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = Das Beispiel <c1/> setzt unter anderem:

seg-0ceb87f45323 = Südpol { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = wird unverändert durchgereicht

seg-94b84de6c958 = Das Diagramm, das die Engine für scenarios/lunar-surface.toml schreibt, Art lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> Die Art und Phase <c1/>: Relaisverfügbarkeit und PDOP, Erd- und Sonnensichtbarkeit und eine geführte Oberflächenuhr für jeden Standort und jede Jahreszeit, mit dem Geländehorizont von <c2/>; ein Lauf an einem einzelnen Standort ist gleich dem dieser Art

seg-70f63c99a478 = <b>MODELLED</b> Die Art und Phase <c1/>: Relaisverfügbarkeit und PDOP, Erd- und Sonnensichtbarkeit und eine geführte Oberflächenuhr für jeden Standort und jede Jahreszeit, mit dem Gel. Unabhängige Referenz (ReferenceImpl): Exakte Gleichheit mit der bestehenden Art für einen Standort sowie Monotonieprüfungen in den Tests. Die Relaisgruppe ist ILLUSTRATIVE, und keine Oberflächenmessung wird verglichen

seg-ab29e0e308d0 = MODELLED Verfügbarkeit von Positionierung und Zeitgebung an der Oberfläche nach Standort und Jahreszeit für Standorte am Südpol im Artemis-Stil. (Artenkatalog (<c1/>))

seg-3f948092eba6 = MODELLED: illustrative Kepler-Relaisgruppe an einem Mond mit mittlerer Rotation; der Relaiswert ändert sich nicht mit der Jahreszeit; das Gelände ist der LOLA-Ausschnitt von { "1200" } m. (Artenkatalog (<c1/>))

seg-5b217c0bb606 = EHRLICHKEIT: MODELLED. Die Relaisgruppe ist illustrativ und keplersch, wobei sich der Mond für die Relais mit der mittleren Rate dreht (keine Libration), wie in moonlight-service-volume; Erde und Sonne verwenden die analytische Orientierung, sodass sich die beiden Bezugssysteme durch diese Auslassung unterscheiden. Der Positionierungswert der Relais ändert sich in diesem Modell nicht mit der Jahreszeit; die Werte für Erde und Sonne schon. Es wird keine Übereinstimmung mit einem realen Dienst oder Standort behauptet. Adv (Kommentar in der Szenariodatei, Zeilen { "11" } bis { "15" })

seg-958f00c2d647 = Die Verfügbarkeit von Positionierung und Zeitgebung an der Oberfläche nach Standort und Jahreszeit an den Mondpolen (<c1/>) ist MODELLED, nicht validiert: gegen eine getrennte Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Zurück</s1>lunar-station-coverage

seg-625c1973128e = <s1>Weiter</s1>lunar-time-budget
