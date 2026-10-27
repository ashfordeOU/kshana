# docs--concepts: translations (de)

# text
seg-501402fc366f = Uhren-Holdover

# text
seg-9c0eb89a2fbe = Paket

# text
# c1: docs/CONCEPTS.md
seg-41b3740e1db9 = Quelle: <c1/>

# text
seg-8ab3fd09812d = Konzepte — eine Einführung in einfacher Sprache

# text
seg-0f86d0a815d2 = Diese Seite erklärt, <em>was Kshana tut und warum</em>, beginnend bei null und aufbauend bis zur Physik. Für den ersten Teil wird kein Vorwissen vorausgesetzt; die späteren Abschnitte ergänzen die genauen Beziehungen für Fachleute. Wortgenaue Definitionen stehen im <a1>Glossar</a1>.

# text
seg-34f76bad58cb = { "1" }. Das Problem in einem Absatz

# text
seg-45c0199e2224 = Fast alles, was wissen muss, <em>wo es ist</em> oder <em>wie spät es ist</em> — Telefone, Flugzeuge, Schiffe, Satelliten, Stromnetze, Finanzsysteme — stützt sich auf Signale von Navigationssatelliten (GPS (Global Positioning System) und seine Verwandten, zusammen <b>GNSS</b> (globales Satellitennavigationssystem)). Diese Signale sind schwach und gehen leicht verloren: gestört, abgeschattet oder im Weltraum schlicht nicht in Sicht. Wenn das geschieht, muss ein System <b>aus eigener Kraft weiterlaufen</b> und dazu Sensoren an Bord nutzen — eine Uhr, die die Zeit hält, und Inertialsensoren, die die Bewegung verfolgen. Die Frage, die Kshana beantwortet, ist leicht zu stellen und schwer zu messen: <b>Wie lange und wie gut kann es weiterlaufen?</b>

# text
seg-ea1895772e76 = { "2" }. Warum „Quanten“?

# text
seg-dd6871645f37 = Sensoren an Bord driften. Eine Uhr verliert langsam Zeit; ein Inertialsensor verliert langsam die Position aus den Augen. <b>Quanten</b>-Uhren und -Inertialsensoren driften <em>weit langsamer</em> als die heute eingesetzten klassischen Bauteile — ein Fahrzeug könnte also einen viel längeren GNSS-Ausfall überbrücken und dabei innerhalb seiner Genauigkeitsgrenzen bleiben. Dieser Vorteil ist das gesamte Versprechen von Quanten-PNT (Positionierung, Navigation und Zeitgebung). Aber „weit langsamer“ muss in <b>Zahlen</b> übersetzt werden: Wie viele zusätzliche Minuten Holdover? Wie viele Meter weniger Drift? Diese Zahlen entscheiden, ob sich eine Quanten-Nutzlast angesichts von Kosten, Masse und Leistung lohnt.

# text
seg-a5d9dc0fb159 = { "3" }. Was Kshana tatsächlich tut

# text
seg-cb3a35ba696f = Kshana ist ein <b>Simulator</b>, keine Hardware und kein Hardwareentwurf. Es:

# text
seg-cb7fdaf6738b = Nimmt ein <b>Szenario</b> — eine Zeitleiste mit einem Abschnitt GNSS-Ausfall und den veröffentlichten Leistungsangaben eines Sensors.

# text
seg-701c8c6d0e55 = Treibt ein <b>Sensorfehlermodell</b> durch diese Zeitleiste: Solange GNSS verfügbar ist, wird das Modell an die Wahrheit nachgeführt; während des Ausfalls läuft es frei und häuft genau den Fehler an, den die Physik vorgibt.

# text
seg-bc68e3d54e4c = <b>Bewertet</b> das Ergebnis gegen betriebliche Gütemaße (wie groß der Fehler wird, wie lange er innerhalb der Spezifikation bleibt, wie vertrauenswürdig die Schätzung ist).

# text
seg-32d31a9beb71 = Bei den Sensorpaketen geschieht das <b>zweimal</b> — einmal für einen Quantensensor, einmal für sein klassisches Gegenstück — im <em>selben</em> Szenario, sodass der Vergleich fair ist.

# text
seg-07d8c6eb84e9 = Entscheidend: Die Engine weiß nichts von „Quanten“ gegenüber „klassisch“. Beides sind nur Fehlermodelle mit unterschiedlichen (veröffentlichten, zitierten) Parametern. Der Unterschied in der Ausgabe ist der Unterschied in der veröffentlichten Physik — nichts wird von Hand eingestellt, um eine Seite zu begünstigen.

# text
seg-e20a7d3f32dc = { "4" }. Die vier Bausteine („Pakete“)

# text
seg-638b8d451550 = Sensor

# text
seg-f891ee876b96 = Was es beantwortet

# text
seg-d1b122c389d4 = Atomuhr

# text
seg-768230c2eb02 = Wie lange bleibt die <em>Zeit</em> ohne GNSS genau?

# text
seg-029de6b99be0 = Inertiale Koppelnavigation

# text
seg-f66f2d7b1d6d = Beschleunigungsmesser (+ Kreisel)

# text
seg-e067a035f656 = Wie schnell driftet die <em>Position</em> ohne GNSS?

# text
seg-9ef8f99ca6e4 = Zeitübertragung

# text
seg-1267f82791f9 = optische / Funk-Verbindung (Hochfrequenz)

# text
seg-6f240700790d = Wie genau können zwei Fahrzeuge die Zeit teilen?

# text
seg-90be2a6a29b1 = Hybride Fusion

# text
seg-780cf1f1127e = alles Obige

# text
seg-6080a05ace19 = Trägt die <em>kombinierte</em> PNT-Lösung?

# text
seg-3f74a708a746 = Das Hybridpaket ist die Pointe: Eine Navigationslösung braucht <em>sowohl</em> gute Zeit <em>als auch</em> gute Position. Es zeigt, dass eine optische Zeitverbindung selbst eine bescheidene Uhr synchron halten kann — damit wird der <b>Inertial</b>sensor zum schwächsten Glied, und genau dort lohnt sich ein Quanten-Beschleunigungsmesser.

# text
seg-5f55bb0fd7c5 = Jenseits der vier Pakete

# text
# c1: kshana kinds
seg-60191a2cd150 = Dieselbe Engine führt viele weitere Szenario-<em>Arten</em> aus; <c1/> listet sie alle auf. Sie reichen über die Sensoren hinaus zu den Signalen und der Geometrie, von denen die Sensoren abhängen:

# text
seg-995ed414d83d = <b>Wo die Satelliten sind</b> — Bahnausbreitung, Konstellationsentwurf um die Erde, den Mond oder einen anderen Körper und die Positionen der Körper des Sonnensystems.

# text
seg-bc8abce2a748 = <b>Was der Empfänger sehen kann</b> — eine azimutabhängige Horizontlinie (eine Straße, ein Kai, ein Fjord) über der Elevationsmaske und die Himmelsgeometrie, die sie übrig lässt: die sichtbaren Satelliten, ihre Verdünnung der Genauigkeit (DOP) und die Fehlerellipse.

# text
seg-b7a2c252c41c = <b>Was der Empfänger hört</b> — das L-Band-Spektrum unter einem Störsender, jamming und spoofing sowie der Verlust der Verriegelung der Nachführschleife.

# text
seg-f354743045c4 = <b>Ob der Antwort zu trauen ist</b> — Integritätsüberwachung (RAIM, Überwachung der Integrität durch den Empfänger selbst, und ihre fortgeschrittene Form ARAIM) mit Schutzniveaus.

# text
seg-69aa01a29a49 = <b>Alternativen zu GNSS</b> — Abgleich mit Schwere- und Geländekarten sowie Positionierung, Navigation und Zeitgebung aus Satelliten im niedrigen Erdorbit (LEO), vom Signalentwurf über die Link-Bilanz und die Navigationsnachricht bis zur Positionsbestimmung.

# text
seg-297c98214b5b = <b>Zeitgebung für Netze</b> — Telekom-Holdover, geprüft gegen die internationalen Masken, und Zeitschlitz-Zeitgebung für zeitindizierte Pläne.

# text
seg-7eba216a9bf2 = <b>Jenseits der Erde</b> — Mondzeit und Bezugssysteme, Dienstvolumen am Mond und Relaisnavigation am Mars.

# text
seg-b796f49570ed = <b>Viele Läufe auf einmal</b> — Kampagnen verketten Arten auf einer Zeitleiste, durchfahren einen Parameter oder führen ein Monte-Carlo-Ensemble aus.

# text
seg-ef7f4e025018 = { "5" }. Ehrlichkeit durch Konstruktion

# text
seg-65fb8703baf9 = Ein Simulator ist nur nützlich, wenn man ihm trauen kann. Kshana ist so gebaut, dass Sie das können:

# text
# c1: provenance
seg-de8fd160db6d = <b>Jeder Parameter ist zitiert.</b> Jede Sensorangabe trägt eine <c1/>-Zeichenkette, die das Datenblatt oder die Veröffentlichung nennt, aus der sie stammt. Keine anonymen Konstanten.

# text
seg-09d5cd11b127 = <b>Jedes Modell wird gegen eine Lehrbuchbeziehung geprüft,</b> nicht nur gegen sich selbst — z. B. muss die Allan-Abweichung der simulierten Uhr zur veröffentlichten Stabilitätsangabe passen, und die Inertialdrift muss zum Standardgesetz des Fehlerwachstums passen. Eine Fähigkeit heißt nur dann <em>validiert</em>, wenn eine unabhängige externe Referenz (ein echter Datensatz, eine unabhängige Implementierung oder veröffentlichte Referenzvektoren) übereinstimmt; der Rest ist <em>modelliert</em>, und die <a1>Verifikationsmatrix</a1> sagt, was was ist.

# text
seg-ccb5b2fe93c4 = Der Reifegrad ist gekennzeichnet.

# text
# c1: validated
# c2: modelled
# c3: not modeled
seg-5a0ac98febed = <a1>VALIDATION.md</a1> kennzeichnet jeden Effekt als <c1/>, <c2/> oder <c3/> und stellt klar fest, dass die Angaben zu optischen Uhren <em>Labor- / Weltraumzielwerte</em> sind — keine optische Strontium-Uhr ist bisher geflogen.

# text
seg-de463596fcdb = <b>Ergebnisse sind bitgenau reproduzierbar:</b> Dasselbe Szenario, derselbe Seed und dieselbe Version liefern auf derselben Plattform immer dieselbe Antwort; zwischen Betriebssystemen stimmen die Zahlen auf { "1e-6" } relativ überein (siehe <a1>REPRODUCIBILITY.md</a1>).

# text
seg-f87dad1ffc98 = { "6" }. Die Physik, für Fachleute

# text
seg-8fc6db9faf83 = Die Beziehungen, die Kshana umsetzt und testet (vollständige Einzelheiten und Toleranzen in <a1>VALIDATION.md</a1>):

# text
# c1: q_wf
# c2: q_rw
# c3: σ_y(τ)
seg-ea61f869c266 = <b>Uhr-Holdover.</b> Zweizustandsmodell aus Phase und Frequenz mit weißer Frequenzmodulation (weißes FM, spektrale Leistungsdichte <c1/>), Random-Walk-FM (<c2/>), Flicker-FM (eine Summe logarithmisch verteilter Ornstein-Uhlenbeck-Prozesse, kalibriert auf einen flachen Allan-Boden) und deterministischer Alterung. Validiert durch überlappende Allan-Abweichung gegen das veröffentlichte <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

# text
# c1: ½·b·T²
# c2: σ_x(T) = √(S_a·T³/3)
# c3: g·θ
seg-4f46754c399f = <b>Inertiale Koppelnavigation.</b> Restbias des Beschleunigungsmessers → <c1/>; Geschwindigkeits-Random-Walk → <c2/>; optionaler Kreiselbias und Winkel-Random-Walk erzeugen einen Neigungsfehler, der die Schwerkraft (<c3/>) in horizontale Beschleunigung einkoppelt (Groves).

# text
# c1: range = c·dt
# c2: σ/√N
seg-d59595d00f0a = <b>Zeitübertragung.</b> Weißer Zeitjitter → Synchronisationsgenauigkeit → Einweg-Entfernungsmessung (<c1/>, { "1" } ps ≈ { "0.3" } mm); der Stichprobenmittelwert mittelt sich als <c2/>.

# text
# c1: q_wf·T + q_rw·T³/3
seg-0eb7a53fb4a6 = <b>Fusion & Integrität.</b> Ein Kalman-Filter mit zwei Zuständen, dessen Prozessrauschen zum Wahrheitsmodell passt; beim Überbrücken wächst seine Phasenfehlervarianz genau auf <c1/> — die analytische Holdover-Beziehung — und seine 1-σ-Schranke speist das Gütemaß Integrität.

# text
seg-80daa7cb8641 = <b>Geometrie.</b> Keplersche Zweikörper-Bahnausbreitung (wahlweise mit säkularem J2) oder SGP4 (Simplified General Perturbations { "4" }) aus echten Zweizeilen-Elementesätzen, Walker-Konstellationen und Sichtlinien-Sichtbarkeit (Erdverdeckung + Elevationsmaske) leiten die GNSS-Verfügbarkeit aus der Bahngeometrie ab statt aus von Hand verfassten Fenstern.

# text
seg-4ce4c6b79b93 = { "7" }. Wie es weitergeht

# text
seg-7c8344a26230 = Durcharbeiten: die <a1>Tutorials</a1> — drei durchgerechnete Beispiele + abgestufte Übungen.

# text
seg-277f1b435cf6 = Ausführen: siehe die Schnellstartanleitung in der <a1>README</a1>.

# text
seg-c349981bd4f1 = Den Aufbau verstehen: <a1>ARCHITECTURE.md</a1>.

# text
seg-f7acbf857c57 = Prüfen, was validiert ist und was nicht: <a1>VALIDATION.md</a1>.

# text
seg-04a86ea674a5 = Einen Begriff nachschlagen: <a1>GLOSSARY.md</a1>.

# text
seg-4a73b906888b = <s1>Zurück</s1>Überblick

# text
seg-2f14e84bfc99 = <s1>Weiter</s1>Glossar
