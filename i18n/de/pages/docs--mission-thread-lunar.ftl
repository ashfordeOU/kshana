# docs--mission-thread-lunar: translations (de)

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-3b01a756c305 = Was es berechnet

seg-b478421b21bb = Quelle: <c1/>

seg-dbd59cc01982 = Das Mondsegment des Missionsstrangs im Stil von Artemis

seg-7b56ed698c30 = Vier Szenarioarten, jede zugleich eine Phasenart der Schnittstelle <c1/> (<c2/>): Sie tragen ein Fehlerbudget für Navigation und Zeitgebung durch eine Mondmission zum Südpol, vom Rendezvous in der Mondumlaufbahn bis zur Landung, dem Aufenthalt an der Oberfläche und dem Aufstieg zurück in die Umlaufbahn. <b>Jede Zahl hier ist MODELLED</b>: ein genanntes Modell mit ILLUSTRATIVE Eingaben, nichts davon eine Aussage über eine Mission, ein System oder einen Standort. „Artemis-Klasse“ benennt eine Klasse von Missionskonzepten, nicht mehr; Daten, Produkte oder Billigung einer Agentur werden weder verwendet noch beansprucht, und nichts hier ist mit einer verbunden. Beratende Software, keine zertifizierte Navigationsausrüstung. Kshana sendet nichts und steuert keine Hardware an.

seg-5282ad2c498a = Phase und Art

seg-9b927127e042 = Beispielszenario

seg-40f3e1b2d58b = Kern

seg-2cfaaa8be402 = Relativnavigation bis zum Andocken, kreisförmig polar in { "100" } km oder elliptisch polar von { "100" } km mal { "3000" } km

seg-9ee09d63fed3 = das Landestreuungsbudget an einem Standort am Südpol

seg-c4568984e75c = <c1/>, <c2/> (braucht das DEM, einen Checkout)

seg-a098e14e6a63 = Verfügbarkeit von Positionierung und Zeitgebung nach Standort und Jahreszeit

seg-8278ae655fcc = <c1/>, <c2/> (braucht das DEM, einen Checkout)

seg-249eff5159d0 = Aufstieg in die Rendezvous-Umlaufbahn und die in die Umlaufbahn zurückgetragene Kovarianz

seg-36184e593ade = Jeder Kern ist eine Funktion von <c1/>; ein eigenständiger Lauf baut den Standardeintritt auf (eine mondzentrierte inertiale Kovarianz von { "100" } m und { "0.1" } m/s, eine LTC-Uhr von { "1" } Mikrosekunde) sowie die Standardepoche 2028-01-01, und ein Lauf im Strang übernimmt den Eintritt aus der vorigen Phase. Der Strang, nicht ein Kern, rechnet Bezugssysteme und Zeitskalen um und wendet die Übergaberegel an: Ein Phasen-Wrapper rechnet den Eintrittszustand über die Umrechnungen des Strangs auf <c2/> (oder <c3/> für die Oberflächenkarte) und eine LTC-Uhr um, und die Umrechnungszeilen werden dem Budget der Phase hinzugefügt. Ein Bezugssystem oder eine Zeitskala, die der Strang nicht umrechnen kann (zum Beispiel ITRF), wird mit der Meldung des Strangs abgelehnt; ein Kern, der direkt mit einem Bezugssystem aufgerufen wird, das er nicht verwenden kann, lehnt es mit der Begründung ab. Eine Phase setzt nie eine Kovarianz zurück, sondern gibt nur die weiter, mit der sie endet.

seg-59f4a1a2684e = Was jede Phase tut

seg-e112a34ef118 = Zwei Fahrzeuge, ein Verfolger und ein Ziel, fliegen dieselbe Bahn unter dem Mondkraftmodell des Crates (ein Gravitationsfeld sowie Erde und Sonne als dritte Körper). Eine Gauß-Newton-Batchschätzung über den Bogen gewinnt beide Anfangszustände aus:

seg-33bb01b1e72a = einer absoluten Positionslösung je Fahrzeug aus einer ILLUSTRATIVE Relaisgruppe der LCNS-Klasse (Relais hinter dem Mond werden verworfen, vier sind nötig), deren weißer Anteil die Code-Tracking-Schranke des AFS-Piloten (BPSK({ "5" }), { "5.115" } Mchip/s) beim genannten C/N0 mal dem DOP-Kofaktor ist;

seg-b061f6742a86 = einem <b>beständigen</b> Fehler im Signalraum bei jeder Lösung: Relaisfehler mitteln sich über einen Bogen von Stunden nicht weg, daher wird er als konstante Positionsbiase getragen, einer beiden Fahrzeugen gemeinsam (<c1/> der Varianz, Standard { "0.9" }, ILLUSTRATIVE) und einer unabhängig je Fahrzeug. Ein konstanter Bias bringt keinen Mittelungsgewinn, die konservative Lesart;

seg-437ac74b1400 = einer Querverbindungsentfernung aus demselben Signal bei dessen eigenem C/N0.

seg-3513a55e44e5 = Sie gibt den formalen und den Monte-Carlo-Fehler von Relativposition und -geschwindigkeit in den lokalen Achsen des Ziels an, den Anteil der Epochen mit Lösungen auf beiden Fahrzeugen, den mittleren normierten quadrierten Schätzfehler (NEES) des Relativzustands gegenüber seinem Erwartungswert von { "6" }, die relative Drift durch Vernachlässigung der Gravitationsharmonischen, eine geschlossene Hill-Prüfung (Clohessy-Wiltshire) für den Kreisfall, die Modelle der Relativsensoren in der Endphase aus <c1/> des Strangs (ILLUSTRATIVE Parameter) neben dem Wert nur aus Signalen und am Ende die 6x6-Kovarianz des Verfolgers.

seg-5d3fa3e8486c = <b>Was das Ergebnis sagt.</b> Allein mit Signalen legt die Querverbindungsentfernung die Relativposition entlang der Sichtlinie fest, aber die Relativposition quer dazu ist durch den unabhängigen Fehler im Signalraum und durch das begrenzt, was die Dynamik liefert; das Andocken braucht einen Relativsensor, und die Zeilen <c1/> zeigen, bei welcher Entfernung jedes Sensormodell des Strangs die Signale übertrifft. Das Ergebnis hängt außerdem davon ab, dass die Wahrheit und der Schätzer ein Kraftmodell teilen; die Schätzeroption <c2/> zeigt die Kosten der Vernachlässigung der Harmonischen, und von diesem Lauf wird keine Konsistenz erwartet.

seg-66c4eb27641b = Die Phase fliegt ihre eigene nominale Umlaufbahn (die Felder <c1/>), sodass der Positions- und Geschwindigkeitsvektor des Eintritts nicht verwendet wird, nur seine Kovarianz, sein Bezugssystem und seine Uhr; ein Ereignis im Strang sagt das.

seg-751f29ab7a35 = Je horizontaler Achse ein inertiales Fehlermodell mit fünf Zuständen (Position, Geschwindigkeit, Beschleunigungsmesser-Bias, Lagekippung, Kreisel-Bias, angetrieben durch die spezifische Kraft des Abstiegs) aus der Eintrittskovarianz und der IMU, danach ein sequentieller Filter über die aktivierten Stützungen:

seg-c2eae4508a2f = <b>AFS-Lösung</b>: aus den über einer flachen Maske sichtbaren Relais, mit dem ENU-DOP-Kofaktor mal einem Entfernungsfehler des Nutzers. <c1/> verwendet den Fehler im Signalraum; <c2/> verwendet das Residuum der Korrekturverbindung aus <c3/>. Bei genau drei sichtbaren Relais wird die Uhr gestützt, nicht geschätzt, und die Lösung trägt dann <c4/>: Hier geht die Mondzeit in die Lösung ein.

seg-39c938fb24e9 = <b>Geländerelative Lösung</b>: <c1/> führt den TERCOM/SITAN-Abgleicher des Crates auf seinem synthetischen Relief und einer irdischen Meterskala aus (ein Platzhalter, kein Relief am Südpol); <c2/> nimmt die Cramer-Rao-Schranke des Abgleichs eines Höhenfensters des echten LOLA-DEM am Standort, <c3/>, und beansprucht keine Lösung, wo das Relief nur eine Richtung festlegt (das Blendenproblem).

seg-795ef82edc61 = <b>Mondzeit</b>: Der Uhrenfehler bei der Lösung verbindet die Eintrittsuhr, ihr Wachstum seit der Synchronisation und den LTC-TT-Term aus <c1/>. Bei <c2/> tickt das Fahrzeug in TT, und der angesammelte Versatz ist ein unkorrigierter Bias; bei <c3/> bleibt nur die Unsicherheit des veröffentlichten Bandes von { "56" } bis { "59" } Mikrosekunden pro Tag über den Horizont. Ein Zeitmarkenfehler verschiebt eine Lösung entlang der Bahn um <c4/>.

seg-82b71e26bc89 = <b>Lesen Sie es mit Vorsicht.</b> Die Standardstreuung wird vom angenommenen Lenkterm dominiert, und an jedem Standort am Südpol ist die Relaisgeometrie nahezu dieselbe, sodass sich die Standorte kaum unterscheiden. Die Mondzeit spielt über die Zeitmarkierung kaum eine Rolle ({ "150" } m/s mal einige Mikrosekunden liegen unter einem Millimeter); sie spielt eine Rolle, wenn die Geometrie auf drei Relais abfällt.

seg-f5af0aef6649 = Für jeden Standort und jede Jahreszeit (eine Epoche und ein Fenster danach): Relaispositionierung (vier oder mehr Relais in Sicht über der Maske und dem Geländehorizont des Standorts mit PDOP unter der Schwelle, aus denselben Funktionen und derselben Konstellation wie <c1/>; das Ergebnis für einen einzelnen Standort ist bitgenau gleich seinem Wert), ob Erde und Sonne über dem Horizont stehen (analytische Sonne, analytischer Mond und analytische Mondorientierung, Libration eingeschlossen) und die Zeitgebungsverfügbarkeit (ein Relais oder die Erde in Sicht) mit der längsten Strecke ohne beides. Der Relaiswert ändert sich in diesem Modell nicht mit der Jahreszeit (Kepler-Gruppe, mittlere Rotation); die Werte für Erde und Sonne schon. Die Phase gibt die Kovarianz unverändert weiter und führt die Uhr auf eine Zeitgebungsuntergrenze (ILLUSTRATIVE, { "50" } ns), sodass nur die längste Zeitgebungslücke zu überbrücken bleibt.

seg-0890ec65a04e = Das Modell mit fünf Zuständen des Abstiegs auf allen drei Standortachsen aus dem Oberflächenzustand, eine AFS-Lösung in einem genannten Intervall mit derselben Behandlung der Mondzeit und die weitergegebene volle 6x6-Positions-Geschwindigkeits-Kovarianz beim Einschwenken, wobei die Positions-Geschwindigkeits-Korrelation jeder Achse erhalten bleibt. Die Streuung beim Triebwerksabschalten verschiebt, wo sich das Fahrzeug befindet, und wird neben der Navigationskovarianz angegeben, nicht weitergetragen. Die Fehler werden in den Achsen des Startstandorts gehalten (keine Krümmung in Flugrichtung), und der nominale Endzustand ist ein Platzhalter; nur die Kovarianz ist das Ergebnis.

seg-f60b576fabcd = Wie ein Dokument eine Phase angibt

seg-be8e0001ed0c = In einem Strang ist die Tabelle <c1/> einer Phase die eigene Tabelle des eigenständigen Szenarios. Die Phasenlänge ist <c2/> des Strangs: Ein Modell, das auch einen eigenen Längenschlüssel angibt (<c3/>, <c4/>, <c5/>, <c6/>), muss damit übereinstimmen, sonst lehnt die Phase ab, und ein Modell, das den Schlüssel auslässt, übernimmt den des Strangs. Der Seed ist der nach Kennung bestimmte Phasen-Seed des Strangs, sodass eine Phase, die allein unter derselben Kennung und demselben Strang-Seed läuft, die Zahlen liefert, die sie im Strang liefert. Ein falsch geschriebener Modellschlüssel wird abgelehnt, nicht ignoriert. Die Übergabe zwischen Phasen und die dafür nötigen Umrechnungen von Bezugssystem und Zeitskala (mondzentriert inertial und mondfest, Erde zu Mond, die LTC-Paare) gehören zum Strang.

seg-52a6e2ec0a99 = Die Entwürfe, Eingaben und Zielwerte wurden vor jedem Lauf in <c1/> festgelegt, mit sechs datierten Änderungen, die jeweils in der Datei offengelegt sind; das Urteil zu jedem Zielwert, Verfehlungen und die Geschichte der Schätzer eingeschlossen, steht in <c2/>.

seg-a1cf56c505d0 = <b>A1</b> (der Propagator gegen die rekonstruierte Trajektorie von LRO, { "24" } h): MET, { "33" } m größte 3D-Differenz gegenüber { "500" } m, { "2.4" } m RMS radial gegenüber { "60" } m.

seg-25464238f6bd = <b>A2</b> (derselbe Propagator gegen den nahezu geradlinigen Halo-Orbit von CAPSTONE über einen Umlauf von 6.5 Tagen): <b>NOT MET</b>, { "136.8" } km Differenz der Endposition gegenüber { "25" } km und { "28.4" } km Differenz des oskulierenden Perilunradius gegenüber { "10" } km. Die Ursachen wurden nicht isoliert (Kandidaten sind der ausgelassene Strahlungsdruck und die Albedo, die Empfindlichkeit der Bahn gegenüber dem Anfangszustand und die analytischen Reihen für Erde und Sonne); die Zeile bleibt MODELLED.

seg-e1099ad81a5d = Diese beiden Zeilen prüfen den Propagator, den die Mondarten gemeinsam nutzen. <b>Sie prüfen keinen Navigationsfilter, kein Signal und kein Budget, und nichts sonst hier hat eine externe unabhängige Referenz.</b>

seg-9a4b2392aa92 = Alles andere ist MODELLED, und die Konsistenzprüfungen der Arten (B1 bis B8 der Vorregistrierung) prüfen eine Implementierung gegen ihr eigenes genanntes Modell, nicht gegen den Mond.

seg-3365490b59b7 = <s1>Zurück</s1>Missionsstrang: vom Start bis zum Wiedereintritt

seg-90932eed0074 = <s1>Weiter</s1>Positionierung, Navigation und Zeitgebung im LEO

seg-d655c932abbf = Die Landestreuung ist der Navigationsfehler bei der Landung plus ein unabhängiger Lenkterm (<c1/>, ILLUSTRATIVE, standardmäßig { "20" } m je Achse). Die Tabelle <c2/> führt jede Kombination der Stützungen aus. Die Ellipse wird per Monte Carlo kalibriert (der Anteil simulierter Landungen innerhalb der 3-Sigma-Kontur gegenüber den { "98.9" } %, die eine 2D-Gauß-Verteilung ergibt).
