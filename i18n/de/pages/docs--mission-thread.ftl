# docs--mission-thread: translations (de)

seg-e27476e37522 = Erde

seg-34bdcfd66ded = Im Repository-Zweig, aus dem diese Dokumente stammen; noch nicht auf GitHub

seg-092dd691ca17 = Der Bericht

seg-f942b36a11c4 = Noch nicht auf GitHub

seg-b03d56f501c3 = Art

seg-2afa300864a9 = Parameter

seg-b7cf72949a21 = Quelle: <c1/>

seg-32755afa0f78 = Der Missionsstrang

seg-d4af67363efc = Beratende Software, keine zertifizierte Navigationsausrüstung. Nur öffentliche Quellen; weder mit einer Agentur verbunden noch von ihr gebilligt, und nichts hier behauptet eine Konformität mit den Anforderungen irgendeines Programms.

seg-816770c97995 = <c1/> verkettet Phasen einer Mission, jede eine von acht registrierten Arten mit eigenen Sensoren und eigenem Filter, und gibt das <b>Fehlerbudget für Navigation und Zeitgebung</b> der ganzen Kette an: für jede Phase das 1-Sigma von Position, Geschwindigkeit und Uhrenbias beim Eintritt, am Spitzenwert und beim Austritt; jeden Beitrag dazu mit seiner Einheit; die Marge gegenüber einer von Ihnen genannten Anforderung; das schwächste Glied; die datierten Ereignisse; und eine Zeitleistengrafik. Jede Zahl ist <b>MODELLED</b>: eine genannte Eingabe oder ein Modell einer solchen. Die einzigen Zeilen mit externer unabhängiger Referenz stehen in <s1><c2/></s1> und sagen, was sie prüfen.

seg-c29a19879c84 = Führen Sie das Beispiel aus einem Checkout aus (es liest einen eingecheckten Ausschnitt des Mondkernels):

seg-00f84b734853 = Das Dokument

seg-9979b2c873df = <b>Ein Dokument wird abgelehnt, nicht erraten,</b> wenn eine Phasenkennung sich wiederholt, eine Liste <c1/> leer ist, ein Name unbekannt ist, ein Modellschlüssel nicht einer ist, den die Art kennt, ein Längenschlüssel von <c2/> abweicht oder eine Phase eine Quelle aufführt, für die ihr Modell keine Zahlen liefert.

seg-9b1e6ac618b5 = Was eine Übergabe tut

seg-0e965f3e30fa = Der weitergegebene Zustand ist die volle 6x6-Kovarianz von <c1/> in SI-Einheiten, die Uhr (Bias, Drift und ihre Kovarianz, mit einer Zeitskala gekennzeichnet), das Bezugssystem, die Missionszeit und eine Nachweiskennzeichnung. Eine Übergabe setzt nie eine Kovarianz zurück.

seg-47599d03571d = Regel

seg-023113cc5afb = gibt den Zustand unverändert weiter

seg-43967d0b6dd8 = weißes Beschleunigungsrauschen der PSD <c1/> über <c2/> bei einem geradlinigen Modell; die Zeile nennt beides

seg-2c791ab0fd0f = Koppelnavigation für <c1/>, danach wird eine Achse nur dort auf die Quellgrenze gesetzt, wo die Grenze kleiner ist; nie unter der Grenze, nie ein Zurücksetzen

seg-36b9117f5379 = Bezugssysteme und Zeitskalen

seg-5853aaba827f = Der Strang rechnet bei der Übergabe um, nie innerhalb einer Phase, und jede Umrechnung ist eine eigene Budgetzeile. Bezugssysteme: GCRF, MCI, MCMF (ITRF und LVLH werden mit der Begründung abgelehnt). <c1/> verschiebt den Ursprung um den geozentrischen Zustand des Mondes: den Zustand in DE440-Güte aus dem Kernel, wo er die Epoche abdeckt (Platzhalter { "5" } m und { "1" } mm/s; gemessen schlechtester Wert { "2.6" } m gegen festgelegte JPL-Horizons-Werte), andernfalls die analytische Reihe mit ihren gemessenen { "195.7" } km RMS, was die Zeile angibt; ein Mondbeispiel muss daher einen Kernel tragen, der seine Epoche abdeckt. <c2/> ist die mittlere siderische Rotation mit zur Epoche ausgerichteten Achsen und ohne Libration. Zeitskalen laufen über TT: <c3/> exakt, <c4/> addiert { "14" } us, <c5/> verwendet die säkulare Rate von <c6/> mit ihrem Band von { "56" } bis { "59" } us/Tag als Ratenunsicherheit.

seg-5ee610d8ab89 = Die acht Phasenarten

seg-70b73f1acebf = Segment

seg-0e39a468de1d = angetriebener Aufstieg in eine Parkbahn: Kovarianz bei konstanter Geschwindigkeit mit weißem Beschleunigungsrauschen, GNSS-Erfassung und -Abschwächung, Uhren-holdover

seg-d359ae5982a6 = Schlüssel <c1/> in <c2/>

seg-57c44fd6e061 = Relativnavigation über Sensorabschnitte: Clohessy-Wiltshire-Übergang in LVLH, 6x6-Kalman-Kovarianz, Andockfenster

seg-7dce961e2c67 = unten

seg-4b233c6cdf8b = TLI-Manöver und cislunarer Flug: Cowell-Fortschreibung, Zustandsübergangsmatrix aus finiten Differenzen, gnss-ssv- und Bodenverfolgungsaktualisierungen

seg-352e27d02c86 = Rückflug bis zur Eintrittsschnittstelle; Sigma des Bahnneigungswinkels, Korridorwahrscheinlichkeit, Spitzenverzögerung, Landeellipse

seg-95eb34012fe8 = Mond

seg-cc72d2fc8a43 = Relativnavigation bis zum Andocken in einer Mondumlaufbahn

seg-2cfa6846c937 = Landestreuungsbudget an einem Standort am Pol

seg-e9f5fc58fe12 = gleich

seg-ba3c65a210dd = PNT- und Zeitgebungsverfügbarkeit an der Oberfläche nach Standort und Jahreszeit

seg-8b9c5124dd3c = angetriebener Aufstieg in eine Einschwenkbahn

seg-4ce0fa85457c = Die Mondarten sind auch eigenständige Szenarioarten; der Entwurf und die Nachweise stehen in <a1><c1/></a1>.

seg-d16877f38793 = Das Budget trägt die <b>relativen</b> Sigmas; die absolute Kovarianz des Verfolgers wird unverändert weitergegeben, und eine Zeile sagt das, weil diese Phase die Fahrzeuge gegeneinander misst, nicht gegen die Erde. Die Start-Relativkovarianz ist die absolute des Verfolgers plus die genannten Sigmas des Ziels, addiert, als wären sie unabhängig (konservativ). Schlüssel: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, optional <c6/> und <c7/>, und ein oder mehrere <c8/> mit <c9/>, <c10/>, <c11/>, <c12/> (<c13/>, <c14/> oder <c15/>, ILLUSTRATIVE Parameter in <c16/>) und <c17/>; die Dauern der Abschnitte addieren sich zu der der Phase. Das Andockfenster ist die Zeit ab dem Punkt, an dem das relative Sigma innerhalb der Fanghülle bleibt, bis zum Ende der Phase. Wiederholungen sind eigene Phasen mit eigenen Kennungen.

seg-088b78574ab4 = Der Mittelwertzustand stammt vom Cowell-Propagator der Engine mit Erdgravitation und J2 sowie Sonne und Mond als dritten Körpern. Die Kovarianz durchläuft jedes Segment <c1/> mit einer Zustandsübergangsmatrix aus Vorwärtsdifferenzen (der nominale Lauf und sechs gestörte Läufe) und einem weißen Beschleunigungsrauschen. Das Manöver verläuft entlang der Eintrittsgeschwindigkeit mit einem genannten Größenanteil und Richtungsfehler. <b>Genannte Grenze:</b> Die eingecheckten Ausschnitte des Mondkernels enthalten den Mond, aber nicht die Sonne, daher nimmt der Propagator den Mond aus dem Kernel und die Sonne aus der analytischen Reihe (der Term der Sonne als dritter Körper ist gegenüber dem Fehler dieser Reihe unempfindlich); die Phase sagt in einem Ereignis, welches sie verwendet hat, und wo kein Kernel ein Segment abdeckt, verwendet sie für beide die analytische Reihe. Das Manöver ist <b>nicht gezielt</b>: Der nominale Zustand ist dort, wohin das genannte Manöver führt, und die Mondphasen übernehmen nur die Kovarianz.

seg-e5a67295a5ae = Aktualisierungen, nur verwendet, wenn das Dokument die Quelle aufführt: <c1/> (Positionslösungen mit Verfügbarkeit und PDOP aus dem Sweep des Raumdienstvolumens der Engine entlang einer oskulierenden Erdbahn, die den Bogen vertritt, ein Sweep je <c2/>; Sigma der Lösung = Median-PDOP mal <c3/>; die Form mit erwarteter Information hält den Lauf deterministisch) und <c4/> (Entfernung und Entfernungsrate entlang der geozentrischen Richtung, sodass die Himmelsebene nicht beobachtet wird; die Varianz der Aktualisierung wird durch den Verfolgungseinsatz geteilt). Schlüssel: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, optional <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-3a69ca6723ba = Der Rückflug ist der Flug von <c1/> ohne Manöver, der an der Eintrittsschnittstelle endet; seine Schlüssel sind die obigen Flugschlüssel. An der Schnittstelle liest die Phase den Bahnneigungswinkel und sein Sigma aus der vollen Kovarianz, die Wahrscheinlichkeit, dass der Winkel innerhalb eines genannten Korridors liegt, die Spitzenverzögerung beim nominalen Winkel und an beiden Korridorrändern (der ebene ballistische Wiedereintritt der Engine neben der geschlossenen Allen-Eggers-Form) gegen eine optionale Grenze sowie die Landeellipse: in Flugrichtung aus einer genannten Empfindlichkeit, quer dazu aus der Schnittstellenkovarianz quer zur Bahnebene. Schlüssel: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, optional <c8/>, <c9/> und <c10/> (der nominale Rückkehrzustand, sechs Zahlen, wenn die Kette kein Trans-Earth-Manöver hat, das ihn erzeugt). Nichts hier modelliert Auftrieb, Lenkung oder Erwärmung einer Kapsel.

seg-352783ef7181 = Die Bodennetz-Überlagerung

seg-69d6ab8e93bc = Eine optionale Tabelle <c1/> gibt Stationen und die niedrigste Verfolgungselevation an; für jede Phase, die sie nennt, berechnet der Strang den Anteil der Phase, den eine Station verfolgen kann, und gibt ihn an die Phase als Einsatzdauer weiter, die ihre Aktualisierungsrate der Bodenverfolgung skaliert. Geometrien: <c2/> (der Eintrittszustand, zweikörperig mit J2 geflogen, für Phasen in niedriger Umlaufbahn), <c3/> (das Fahrzeug an der Position des Mondes, für den cislunaren Flug) und <c4/> (eine von Ihnen angegebene Einsatzdauer). Ein Stationswechsel verliert <c5/>; das Budget der Phase erhält das längste Intervall ohne Station in Sicht, und ein Ereignis gibt die Einsatzdauer an. Nichts modelliert die Antennen oder Zeitpläne eines Netzes.

seg-467b14d7ef59 = <c1/>: <c2/> (Index, Kennung, Art, Zeiten, Kennzeichnung, Navigations- und Zeitquellen, begrenzende Quelle, Sigmas bei Eintritt, Spitze und Austritt, Anforderung, Marge, <c3/> mit einer Einheit je Zeile, <c4/>), das <c5/> (kleinste Marge gegenüber einer genannten Anforderung, sonst die größte Spitzenposition), die <c6/>, die <c7/> des Strangs (die Kennzeichnung der schwächsten Phase) und ein Block <c8/>. Die Grafik zeigt das 1-Sigma von Position und Uhrenbias gegen die Missionszeit, ein Band je Phase.

seg-a3c40c51c2ff = Was der Nachweis ist

seg-1168810d4407 = Die Kennzeichnung des Strangs ist die Kennzeichnung der schwächsten Phase, und jede Phase ist MODELLED. Der Mondpropagator wird mit LRO und CAPSTONE verglichen (<s1><c1/></s1>); der cislunare Bogen wird mit einer öffentlichen Horizons-Trajektorie verglichen (<s2><c2/></s2>). Eine Zeile besteht einen Zielwert, der vor dem Lauf in einer eingecheckten Datei festgelegt wurde, oder verfehlt ihn, und eine Verfehlung wird als Verfehlung festgehalten. Nichts ist VALIDATED, sofern das Register es nicht sagt.

seg-ee3c5b58e6fa = <s1>Zurück</s1>Mondumlaufbahn und Mondoberfläche als Infrastruktur

seg-b963f8a02aed = <s1>Weiter</s1>Missionsstrang: das Mondsegment

seg-af81a8087ca7 = Eintritt
