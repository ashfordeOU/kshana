# docs--glossary: translations (de)

# attr:aria-label, text
seg-daf25c6479c1 = Normen

# attr:title, text
seg-c851aa23ea42 = kommagetrennte Werte

# text
seg-366c59b03b4f = CSV

# text
seg-cb273d6705c6 = SVG

# text
seg-49a994d77d2f = temperaturkompensierter Quarzoszillator

# text
seg-1bac97ee312a = Rubidium-Atomfrequenznormal

# text
seg-b09ffb8a9095 = Monte-Carlo

# text
seg-9939da5da283 = JSON

# text
seg-e464509f3abb = Träger-zu-Rauschleistungsdichte-Verhältnis

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = Digital Object Identifier

# text
seg-d41af8f18aed = GLONASS

# text
seg-1df73b95ae4d = IAU

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Internationale Raumstation

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256 Bit

# text
seg-8104773e1484 = STK

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = Ultrahochfrequenz

# text
# c1: docs/GLOSSARY.md
seg-6ce4c2164aee = Quelle: <c1/>

# text
seg-bee5d056ef03 = Allgemeinverständliche Definitionen der in Kshana verwendeten Begriffe. Jeder Eintrag beginnt mit einem einzeiligen „in einfachen Worten" und ergänzt dann die genaue Bedeutung, wo es hilft. Abkürzungen, die in einem Abschnitt nicht definiert sind, stehen in der A-bis-Z-Tabelle nahe dem Ende, <a1>Jede andere Abkürzung, A bis Z</a1>.

# text
seg-f8c5433d1026 = Navigation & Zeitgebung

# text
seg-2a42d84608ea = <b>PNT — Positioning, Navigation, and Timing (Positionierung, Navigation und Zeitgebung).</b> Zu wissen, <em>wo</em> man ist, <em>in welche Richtung</em> man fährt und <em>wie spät es ist</em> — genau. Modernes PNT stammt meist aus Satellitensignalen (GNSS, die als Nächstes definierten globalen Satellitennavigationssysteme); Kshana untersucht, was mit <em>Zeit</em> und <em>Position</em> geschieht, wenn diese Signale verloren gehen.

# text
seg-6227db2c94e1 = <b>GNSS — Global Navigation Satellite System.</b> Die Satellitenkonstellationen, die PNT bereitstellen: GPS (das Global Positioning System, USA (Vereinigte Staaten von Amerika)), Galileo (EU), GLONASS (Russlands Global Navigation Satellite System), BeiDou (China). Ein Empfänger, der ≥ { "4" } Satelliten sehen kann, kann eine vollständige 3D-Positions- und Zeitlösung berechnen.

# text
seg-f8eda357e640 = <b>GNSS-Ausfall / verweigert / herabgesetzt / gestört (jammed).</b> Wenn die Satellitensignale nicht verfügbar sind (blockiert, gestört oder außer Sicht). Während eines Ausfalls muss das System mit seinen eigenen Bordsensoren „durchhalten". Der gesamte Zweck von Kshana ist zu messen, wie gut es durchhält.

# text
seg-a3ade199f465 = <b>Holdover.</b> In einfachen Worten: <em>wie lange die Uhr nach dem Verlust von GNSS allein die richtige Zeit halten kann.</em> Eine bessere Uhr hält länger, bevor ihr Fehler die zulässige Grenze überschreitet.

# text
seg-83b33c15312f = <b>Dead-Reckoning (Koppelnavigation).</b> In einfachen Worten: <em>den eigenen Standort schätzen, indem man die gemessene Bewegung aufsummiert, ganz ohne äußere Referenz.</em> Fehler häufen sich an, sodass ein besserer Inertialsensor langsamer driftet.

# text
seg-da9bcc994b9c = <b>Spezifikation / Schwelle.</b> Der größte Fehler, der erlaubt ist, bevor die Lösung als „außerhalb der Spezifikation" gilt — z. B. „die Zeitgebung muss innerhalb von { "20" } ns bleiben" oder „die Position innerhalb von { "100" } m".

# text
seg-6f37a60a30c7 = Die Sensoren, die Kshana vergleicht

# text
seg-308b59d89586 = <b>Uhr (Atomuhr).</b> Ein Gerät, das die Zeit hält, indem es die natürliche Schwingung eines Atoms zählt. Zwei Beispiele hier:

# text
seg-3389d08be6bc = <b>CSAC — Chip-Scale Atomic Clock.</b> Eine kleine, im Einsatz befindliche, kommerzielle Uhr (die „klassische" Referenz). Gut, driftet aber bei einem langen Ausfall spürbar.

# text
seg-3e121d8e6400 = <b>Optische Gitteruhr (z. B. Strontium).</b> Eine weit stabilere „Quanten"-Uhr; der Stand der Technik in Laboren, noch nicht im Weltraum geflogen.

# text
seg-4daa6cdf8ae2 = <b>Beschleunigungsmesser.</b> Misst die Beschleunigung (Bewegungsänderung). Zweifach integriert ergibt er die Position — daher wächst jeder Fehler schnell. <b>Kaltatom-Beschleunigungsmesser</b> ist die Quantenversion mit deutlich besserer Langzeitstabilität; <b>Navigationsklasse</b> ist die klassische.

# text
seg-91793676c57c = <b>Gyroskop.</b> Misst die Drehung. Ein kleiner Drehfehler kippt die Plattform, wodurch Schwerkraft in die horizontale Richtung gelangt und die Positionsschätzung verfälscht.

# text
seg-2d36110effc3 = <b>IMU — Inertial Measurement Unit (Inertiale Messeinheit).</b> Das Paket aus Beschleunigungsmesser und Gyroskop selbst: je drei Achsen, die die spezifische Kraft und die Drehrate melden. Sie misst Bewegung; für sich allein weiß sie nicht, wo sie ist.

# text
seg-e3b6b40e0cd0 = <b>INS — Inertial Navigation System (Inertiales Navigationssystem).</b> Eine IMU plus die „Mechanisierung", die ihre Ausgabe zu Lage, Geschwindigkeit und Position integriert. Das INS ist es, das durch einen GNSS-Ausfall koppelnavigiert, und seine Genauigkeit wird durch die unten aufgeführten Fehlerprozesse der IMU bestimmt.

# text
seg-a618ff7ee429 = <b>Zeitübertragung.</b> Das Senden eines präzisen Zeitsignals zwischen zwei Orten (z. B. von Satellit zu Satellit). <b>Optische</b> Strecken sind weit präziser als <b>HF</b>-Strecken (Hochfrequenz).

# text
seg-847fbbeecfae = Wie Fehler modelliert werden (Uhrenrauschen)

# text
seg-5cf197bdbbad = Der Uhrenfehler wird aus Standard-„Rauscharten" aufgebaut, jede mit einer bekannten Signatur:

# text
# c1: q_wf
seg-3806d1b1cb50 = <b>Weißes FM (weiße Frequenzmodulation).</b> In einfachen Worten: <em>schnelles, zufälliges Zittern der Rate der Uhr.</em> Durch Mitteln nimmt es mit der Zeit ab. Parameter <c1/>.

# text
# c1: q_rw
seg-0793fdd3abab = <b>Random-Walk-FM.</b> In einfachen Worten: <em>die Rate der Uhr wandert langsam.</em> Dies dominiert lange Ausfälle. Parameter <c1/>.

# text
# c1: flicker_floor
seg-42b74c8b88ff = <b>Flicker-FM (1/f-Rauschen).</b> In einfachen Worten: <em>ein hartnäckiger Rauschboden, unter den die Uhr durch Mitteln nie kommt.</em> Er ist über die Mittelungszeiten hinweg flach. Parameter <c1/>.

# text
# c1: drift
seg-b3bd841a5a2d = <b>Alterung / Drift.</b> Eine langsame, <em>vorhersagbare</em> Änderung der Rate über die Zeit; weil sie vorhersagbar ist, entfernt der Schätzer von Kshana sie. Parameter <c1/>.

# text
# c1: q_va
seg-d929960492e4 = <b>VRW — Velocity Random Walk.</b> Das Gegenstück des Beschleunigungsmessers zum weißen Rauschen: zufällige Stöße auf die Geschwindigkeit, die sich zu einem Positionsfehler aufbauen. Parameter <c1/>.

# text
# c1: q_arw
seg-4a97f8d14174 = <b>ARW — Angular Random Walk.</b> Das Gegenstück des Gyroskops: zufällige Stöße auf die Orientierung. Parameter <c1/>.

# text
seg-dcd03b326110 = Wie Stabilität gemessen wird

# text
# c1: σ_y(τ)
# c2: τ
# c3: σ_y(1 s) = 3×10⁻¹⁰
seg-2181832c6253 = <b>Allan-Abweichung (<c1/>).</b> In einfachen Worten: <em>die Standardart, anzugeben, wie stabil eine Uhr über eine gegebene Mittelungszeit <c2/> ist.</em> Ein Uhren-Datenblatt nennt z. B. <c3/>. Kshana validiert sein Uhrenmodell, indem es die Allan-Abweichung seiner eigenen Ausgabe berechnet und prüft, ob sie mit dem veröffentlichten Wert übereinstimmt. (Referenz: Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

# text
seg-11cbe561e633 = <b>PSD — Power Spectral Density (Leistungsdichtespektrum).</b> Wie die Leistung eines Rauschens über die Frequenzen verteilt ist; die formale Art, weißes Rauschen, Random-Walk-Rauschen und Flicker-Rauschen anzugeben.

# text
seg-0737d620eb5f = Die Gütemaße (wie ein Lauf bewertet wird)

# text
seg-20b66e0d4809 = Die sechs operativen PNT-Gütemaße, die Kshana meldet (siehe die Tabelle „Output" in der README):

# text
seg-b17d08246e49 = <b>FoM — Figure of Merit (Gütemaß).</b> Eine Zahl, die einen Aspekt eines Laufs bewertet, gemeldet mit ihrer Einheit und der Angabe, ob sie validiert oder modelliert ist. Die sechs unten sind die operativen FoMs von Kshana.

# text
seg-b229a69fb4ac = <b>Positionierungs- / Zeitgebungsleistung</b> — die Größe des Fehlers, als RMS (Root Mean Square, der quadratische Mittelwert) und als 95. Perzentil.

# text
seg-ba3ed5a28518 = <b>Autonomie</b> — die Holdover-Dauer (wie lange es ohne GNSS innerhalb der Spezifikation bleibt).

# text
seg-13ecdd037098 = <b>Resilienz</b> — wie schnell der Fehler wächst, sobald GNSS verloren ist.

# text
seg-be0168f24d6e = <b>Verfügbarkeit</b> — der Anteil des Laufs, der eine Lösung innerhalb der Spezifikation hat.

# text
seg-44ef500b371d = <b>Integrität</b> — <em>kann man der eigenen Schätzung des Systems über seinen Fehler vertrauen?</em> Kshana meldet den Anteil der Ausfallstichproben, deren wahrer Fehler innerhalb der Schutzgrenze des Filters bleibt.

# text
seg-d1cc3819cde9 = <b>Sicherheit (Security)</b> — Robustheit gegen Spoofing: ein auf der Uhrenstabilität beruhender Wert für die Erkennbarkeit von Spoofing (seit { "v0.3.0" }), nur aussagekräftig, wenn ein Spoofing-Angriffsszenario konfiguriert ist. Sie ist <em>keine</em> Integrität im Sinne der Luftfahrt: Sie berechnet keinen horizontalen oder vertikalen Schutzpegel (HPL/VPL) und führt keine Receiver Autonomous Integrity Monitoring (RAIM) aus, weder erweitert noch anders. Diese stammen aus den getrennten Szenarioarten für Integrität und ARAIM (Advanced RAIM) und sind unten unter „Integrität & Augmentation" definiert. Exportsensibel.

# text
seg-5cae59204d9e = Begriffe, die zusammen mit den Gütemaßen verwendet werden:

# text
seg-7adc0e49a981 = <b>Spoofing.</b> In einfachen Worten: <em>ein gefälschtes Satellitensignal, das über Position oder Zeit lügt.</em> Ein Spoofer gibt dem Empfänger eine plausible, aber falsche Antwort, was schlimmer ist als jamming, weil der Empfänger es möglicherweise nicht bemerkt.

# text
seg-2d2e6cbeade6 = <b>1-DOF — ein Freiheitsgrad.</b> Eine einzelne Achse. Der Positionsfehler im Szenariopaket von Kshana ist einachsig; eine vollständige 3D-Antwort braucht das dreiachsige Modell.

# text
seg-14a32d281c4b = <b>Monte-Carlo-Ensemble.</b> Dasselbe Szenario viele Male mit verschiedenen Zufalls-Seeds ausführen und die Streuung der Ergebnisse melden statt eines Laufs.

# text
seg-fcbea49a3592 = <b>CI — Konfidenzintervall.</b> Der Bereich, in den eine Statistik mit einer angegebenen Wahrscheinlichkeit fällt (zum Beispiel { "95" } %). In den Tabellen und Abzeichen der README bedeutet „CI" häufiger <b>Continuous Integration</b> — den automatisierten Build- und Testlauf bei jeder Änderung; der Zusammenhang sagt, was gemeint ist.

# text
seg-310abfd6a64c = <b>k-Sigma-Grenze.</b> Eine Grenze bei <em>k</em> Standardabweichungen der eigenen Unsicherheit des Filters; das Gütemaß Integrität zählt, wie oft der wahre Fehler innerhalb davon bleibt.

# text
# c1: src/fom.rs
seg-ad26afbaa7b4 = <b>CEP / 2DRMS — Circular Error Probable / doppelter quadratischer Mittelwert der Entfernung.</b> Zwei Standardarten, die horizontale 2D-Genauigkeit anzugeben: CEP ist der Radius, der { "50" } % der Fixes enthält; 2DRMS ist der doppelte quadratische Mittelwert des horizontalen Fehlers. Die Bibliothek kann beide aus einer Positionskovarianz berechnen (<c1/>), aber keine Szenarioart meldet sie bisher.

# text
seg-fd93c1effba8 = Ein Ergebnis lesen: die Begriffe in der Ausgabe

# text
seg-3432498093cf = Das sind die Namen, denen Sie in einer Ergebnisdatei oder in der Zusammenfassung des Playgrounds begegnen, zuerst in einfachen Worten.

# text
# c1: holdover_s
seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> In einfachen Worten: <em>wie viele Sekunden das System nach dem Verlust von GNSS innerhalb seiner Fehlergrenze blieb.</em> Kshana meldet den kürzesten solchen Durchhaltezeitraum über alle Ausfälle des Laufs, gemessen auf dem Zeitraster des Laufs, sodass es eine untere Schranke bei der Auflösung des Zeitschritts ist. Ein Holdover, der der Ausfalldauer entspricht, bedeutet, dass die Grenze nie überschritten wurde.

# text
# c1: timing_p95_ns
# c2: 0.0
seg-e68708a219f1 = <b>p95 (<c1/>).</b> In einfachen Worten: <em>zu { "95" } % der Zeit war der Zeitgebungsfehler so klein oder kleiner.</em> Es ist das 95. Perzentil des Fehlers über den Ausfall. Ein sehr kleiner Wert kann in einer kurzen Zusammenfassung als <c2/> angezeigt werden; die JSON-Datei (JavaScript Object Notation) des Ergebnisses enthält die Zahl in voller Genauigkeit.

# text
# c1: integrity
# c2: INTEGRITY.md
seg-4dfaee63262d = <b>Integrität (<c1/>).</b> In einfachen Worten: <em>wie oft die eigene Fehlerschätzung des Systems ehrlich war.</em> Es ist der Anteil der Ausfallstichproben, deren wahrer Fehler innerhalb der k-Sigma-Grenze des Filters blieb (unten definiert). Ein Wert nahe { "1" } bedeutet, dass der Schätzer seinen Fehler nicht zu niedrig angegeben hat. Es ist kein Schutzpegel der Luftfahrt; siehe „Integrität & Augmentation" unten und <a1><c2/></a1>.

# text
# c1: security
# c2: P_md
# c3: security n/a (no attack)
# c4: applicable: false
# c5: figure_tiers
seg-5af09f5129e0 = <b>Sicherheitswert (<c1/>).</b> In einfachen Worten: <em>wie wahrscheinlich ein Spoofing-Angriff entdeckt wird.</em> Es ist die Wahrscheinlichkeit, dass der konfigurierte Angriff erkannt wird — eins minus die Wahrscheinlichkeit der Nichterkennung <c2/> — abgeleitet aus der Stabilität der Uhr. Er bedeutet nur etwas, wenn das Szenario einen Spoofing-Angriff konfiguriert. Ist kein Angriff konfiguriert, gibt die einzeilige Zusammenfassung <c3/> aus, und das Ergebnis markiert das Maß im Block <c5/> mit <c4/>; der Wert bleibt im Dokument und bedeutet „nicht anwendbar", nicht „keine Sicherheit".

# text
# c1: pdop_min
seg-70113d509997 = <b>PDOP — Position Dilution of Precision (Schlüssel wie <c1/>).</b> In einfachen Worten: <em>wie stark die Satellitengeometrie den Entfernungsfehler zu einem Positionsfehler vergrößert.</em> Der Positionsfehler ist ungefähr PDOP mal der Entfernungsfehler, daher ist niedriger besser. Siehe <b>DOP</b> unter „Schätzung & Geometrie".

# text
# c1: σ_y(τ)
# c2: τ
# c3: sigma_y(1 s) = 3e-10
seg-a445bf9a3c5f = <b>sigma_y (<c1/>, die Allan-Abweichung).</b> In einfachen Worten: <em>wie stark die Rate einer Uhr schwankt, wenn über eine Zeit <c2/> gemittelt wird.</em> Eine Datenblattzeile wie <c3/> bedeutet, dass die über eine Sekunde gemittelte Rate um etwa { "3" } Teile in 10¹⁰ variiert. Kleiner ist eine stabilere Uhr. Siehe „Wie Stabilität gemessen wird" oben.

# text
# c1: σ_y²(τ) = q_wf / τ
# c2: q_wf = sigma_y(1 s)²
# c3: q_rw
# c4: drift
seg-03b4bb05148d = <b>q_wf — Intensität des weißen Frequenzrauschens.</b> In einfachen Worten: <em>die Stärke des schnellen, zufälligen Zitterns der Rate einer Uhr.</em> Es ist der Koeffizient in <c1/> für weißes Frequenzrauschen, daher setzt ein Szenario <c2/> aus der Allan-Abweichung des Datenblatts bei einer Sekunde. Seine Begleiter sind <c3/> (Random-Walk-Frequenzrauschen) und <c4/> (Alterung); siehe „Wie Fehler modelliert werden" oben.

# text
seg-074a1337ed99 = Begriffe der Telekom-Zeitgebung

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-9f61398628e4 = Telekommunikationsnetze verteilen die Zeit über Paketnetze (Precision Time Protocol) von einer GNSS-gespeisten Referenzuhr aus, und die Internationale Fernmeldeunion, Sektor Standardisierung (ITU-T), legt Grenzen für den Zeitfehler fest, den jede Uhr hinzufügen darf. Diese Begriffe kommen in der Art <c1/> vor; siehe <a1><c2/></a1>.

# text
seg-f48712300b30 = <b>TE — Time Error (Zeitfehler).</b> In einfachen Worten: <em>wie weit die Zeit einer Uhr zu einem Zeitpunkt von der Referenzzeit entfernt ist.</em> Positiv oder negativ, meist in Nanosekunden.

# text
seg-ceda70656c6a = <b>max|TE| — maximaler absoluter Zeitfehler.</b> In einfachen Worten: <em>der schlimmste Zeitfehler während der Messung, ohne Beachtung seines Vorzeichens.</em> Es ist die Hauptgrenze, die die meisten Masken setzen.

# text
seg-38d2922cd91d = <b>cTE — konstanter Zeitfehler.</b> In einfachen Worten: <em>der gleichbleibende Versatzanteil des Zeitfehlers</em> — der mittlere Fehler, der sich während der Messung nicht ändert.

# text
seg-a4a61df332cd = <b>dTE — dynamischer Zeitfehler.</b> In einfachen Worten: <em>der schwankende Anteil des Zeitfehlers</em> — was übrig bleibt, nachdem der konstante Versatz entfernt wurde. Er wird mit MTIE und TDEV beurteilt.

# text
seg-31c0a85788b1 = <b>MTIE — Maximum Time Interval Error.</b> In einfachen Worten: <em>der größte Ausschlag des Zeitfehlers innerhalb eines Fensters gegebener Länge.</em> Für jede Fensterlänge schiebt es ein Fenster über die Aufzeichnung und nimmt die größte Spitze-Spitze-Änderung; eine Maske gibt den größten erlaubten Wert je Fensterlänge an.

# text
seg-53fa12cab0c6 = <b>TDEV — Time Deviation (Zeitabweichung).</b> In einfachen Worten: <em>das typische (quadratisch gemittelte) Wandern des Zeitfehlers bei einer gegebenen Mittelungszeit,</em> nachdem kurzzeitiges Zittern herausgemittelt wurde. Es ist ein Verwandter der Allan-Abweichung im Zeitbereich und wird wie MTIE gegen eine Maske geprüft.

# text
seg-62b5eea14f6c = <b>PRTC — Primary Reference Time Clock (primäre Referenzzeituhr).</b> Die Uhr an der Spitze einer Telekom-Zeitgebungskette, normalerweise von GNSS geführt. Ihre Leistungsgrenzen stehen in ITU-T-Empfehlung G.8272.

# text
seg-8d6d4538981b = <b>ePRTC — Enhanced Primary Reference Time Clock (erweiterte primäre Referenzzeituhr).</b> Eine PRTC mit engerer Zeitfehlergrenze, gestützt auf eine hochstabile lokale Atomuhr, damit sie die Zeit durch einen langen GNSS-Verlust halten kann. ITU-T-Empfehlung G.8272.1.

# text
seg-93fa4ac7c6fa = <b>T-BC — Telecom Boundary Clock.</b> Eine Netzuhr, die die Zeit von stromaufwärts empfängt und stromabwärts weitergibt und dabei selbst etwas Zeitfehler hinzufügt. ITU-T-Empfehlung G.8273.2.

# text
seg-52d32a5db6b8 = <b>T-TSC — Telecom Time Slave Clock.</b> Die Uhr am Ende der Kette, die die Zeit empfängt und an die Ausrüstung weitergibt, die sie braucht (zum Beispiel eine Funkbasisstation). Ebenfalls von ITU-T-Empfehlung G.8273.2 abgedeckt.

# text
seg-04d8ed12ca88 = <b>OCXO — Oven-Controlled Crystal Oscillator (ofengeregelter Quarzoszillator).</b> Ein Quarzoszillator, der in einem kleinen Ofen auf konstanter Temperatur gehalten wird, was ihn viel stabiler macht als einen gewöhnlichen Quarzoszillator. Eine übliche Holdover-Uhr in Netzausrüstung; sie altert (driftet) über Tage spürbar.

# text
seg-6742f7ba35ac = <b>CSAC — Chip-Scale Atomic Clock.</b> Eine sehr kleine Atomuhr (siehe „Die Sensoren, die Kshana vergleicht" oben). Über lange Holdover-Zeiten stabiler als ein OCXO, bei höheren Kosten und höherem Stromverbrauch.

# text
seg-c0e0c18bd867 = Evidenzstufen: VALIDATED, MODELLED, PARTNER

# text
# c1: VERIFICATION-MATRIX.md
seg-61c0aa107fd9 = Jede Fähigkeit in der maschinell geprüften Verifikationsmatrix (<a1><c1/></a1>) trägt eine von drei Stufen.

# text
# c1: MODELLED-RATIONALE.md
seg-a5dfb48e4dcb = <b>MODELLED.</b> In einfachen Worten: <em>aus solider Physik aufgebaut und auf interne Konsistenz geprüft, aber noch nicht mit einer äußeren Antwort verglichen.</em> Die Zahlen sind für Vergleiche und Entwurfsabwägungen aussagekräftig; sie sind kein Beleg dafür, dass ein reales Gerät sich so verhalten wird. <a1><c1/></a1> erklärt, warum jede solche Zeile modelliert ist.

# text
seg-0512b2d2145a = <b>PARTNER.</b> In einfachen Worten: <em>dieser Teil gehört einem Hardware- oder Produktsicherungspartner, und Kshana behauptet nichts darüber.</em> Die Zeile existiert, damit die Lücke sichtbar ist statt stillschweigend.

# text
seg-278dee6d3d4c = Begriffe zu Spektrum und Störung

# text
# c1: spectrum
# c2: SPECTRUM.md
seg-285a240c9958 = Diese Begriffe kommen in der Art <c1/> vor; siehe <a1><c2/></a1>.

# text
seg-db4fdef1c562 = <b>BPSK(n) — Binary Phase-Shift Keying bei n × { "1.023" } Mchip/s.</b> Die Rechteck-Chip-Modulation von GPS L1 Coarse/Acquisition (C/A) und L2 Civil (L2C) (n = { "1" }) sowie von GPS L5 und Galileo E5a (n = { "10" }). Ihr Spektrum ist ein sinc² mit Nullstellen alle n × { "1.023" } MHz.

# text
seg-cdd0f4194f42 = <b>BOC(m, n) — Binary Offset Carrier.</b> Ein Spreizcode bei n × { "1.023" } Mchip/s, multipliziert mit einem Rechteck-Hilfsträger bei m × { "1.023" } MHz, der das Spektrum in zwei Keulen beiderseits des Trägers aufspaltet.

# text
seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — Multiplexed Binary Offset Carrier.</b> Das Leistungsdichtespektrum 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), vereinbart für den Galileo-E1-Open-Service und GPS L1C; Galileo sendet es als Composite BOC (CBOC).

# text
seg-7423f94e3018 = <b>CW — Continuous Wave (Dauerstrich).</b> Ein unmodulierter Träger: ein einzelner Ton.

# text
seg-55d03dd4af03 = <b>J/S — Jammer-zu-Signal-Verhältnis.</b> Empfangene Jammerleistung über empfangener Signalleistung, in Dezibel.

# text
seg-b0f2974647d4 = <b>SSC — Spectral Separation Coefficient.</b> κ = ∫ G_s(f) G_j(f) df über das Empfängerband: wie viel vom Spektrum eines Störers mit Einheitsleistung dort landet, wo das Signal liegt. Die effektive Träger-Rauschdichte ist [1/(C/N₀) + (J/S)·κ]⁻¹.

# text
seg-c5affeee5269 = <b>Rauschzahl.</b> Wie viel ein Empfänger zum thermischen Rauschen hinzufügt, als Verhältnis F in Dezibel; die Systemrauschtemperatur ist T_ant + { "290" } K × (F − { "1" }).

# text
seg-5307c38d3036 = <b>Wasserfall.</b> Ein Zeit-Frequenz-Bild eines Spektrums: Frequenz quer, Zeit nach unten, Farbe für die Leistung.

# text
seg-3b1ac094fdc5 = <b>Welch-Schätzung.</b> Ein Leistungsdichtespektrum, geschätzt durch Mitteln gefensterter, überlappender Periodogramme (Welch { "1967" }).

# text
# c1: .sigmf-meta
# c2: .sigmf-data
# c3: cf32_le
# c4: ci16_le
# c5: ci8
seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Ein offenes Aufzeichnungsformat: eine JSON-Datei <c1/>, die eine rohe Datei <c2/> mit Samples beschreibt (hier komplex <c3/>, <c4/> oder <c5/>).

# text
seg-83041671f422 = <b>IQ — In-Phase und Quadratur.</b> Die zwei Komponenten eines komplexen Basisband-Samples.

# text
seg-39e6ea8506b3 = Begriffe zu LEO-PNT-Signalen

# text
# c1: leo-signal
# c2: spectrum
# c3: LEO-SIGNAL.md
seg-36452ee3f5cc = Diese Begriffe kommen in der Art <c1/> und den Multiband-Szenarien <c2/> vor; siehe <a1><c3/></a1>.

# text
seg-5907283b71da = Abkürzung

# text
seg-900c7c7e99cd = GMAT

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = Bias zwischen Systemen

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = Quantenprojektionsrauschen

# text
seg-430b3c681347 = RTKLIB

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-8363a15f3c5a = <b>LEO-PNT — Positionierung, Navigation und Zeitgebung im niedrigen Erdorbit.</b> Navigationssignale, die von Satelliten in einigen hundert bis etwa { "1200" } km Höhe ausgesendet werden: stärker und schneller bewegt als GNSS aus dem mittleren Erdorbit.

# text
seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — Radionavigations-Satellitendienst, Funkortungs-Satellitendienst, mobiler Satellitendienst, Erderkundungs-Satellitendienst.</b> Dienstzuweisungen der ITU (Internationale Fernmeldeunion), in denen ein Band liegen kann.

# text
seg-d1e494623341 = <b>Pilot-, Daten- und Erfassungskomponenten.</b> Die Teile eines Signals: ein datenfreier Pilot für die Entfernungsmessung, eine Datenkomponente, die die Navigationsnachricht trägt, und eine kurze Erfassungskomponente mit niedriger Rate, die leicht zu finden ist.

# text
seg-cce232b7cd6a = <b>FDMA — Frequenzmultiplex-Vielfachzugriff.</b> Komponenten oder Satelliten, die durch die Trägerfrequenz statt durch den Code getrennt sind.

# text
seg-9d9476ee62b1 = <b>Gabor-Bandbreite (RMS).</b> β = √(∫ f² G df / ∫ G df) über das Empfängerband: die Streuung der Leistung eines Signals in der Frequenz, die bestimmt, wie fein es messen kann.

# text
seg-6febe9c2e506 = <b>DLL — Verzögerungsregelschleife (delay lock loop).</b> Die Code-Nachführschleife; der Abstand ihres Früh-Spät-Korrelators und ihre Rauschbandbreite bestimmen den thermisch bedingten Jitter der Entfernungsmessung.

# text
seg-5a55da97daf9 = <b>EFQPSK — verbesserte Feher-Quadratur-Phasenumtastung.</b> Eine Modulation mit konstanter Hüllkurve (Xona Pulsar); hier durch ein Spektrum rechteckiger Chips angenähert.

# text
seg-6dcbf1de9904 = <b>OFDM — orthogonales Frequenzmultiplex.</b> Eine Mehrträger-Wellenform (der Starlink-Downlink); hier als flaches Band gezeichnet.

# text
seg-548b285c7c8e = <b>TEC — Gesamtelektronengehalt.</b> Elektronen pro Quadratmeter entlang des Pfads; { "1" } TECU = 10¹⁶ el/m². Die ionosphärische Verzögerung erster Ordnung beträgt { "40.3" }·TEC/f² Meter.

# text
seg-dd7e0743f364 = <b>EIRP — äquivalente isotrope Strahlungsleistung.</b> Sendeleistung mal Antennengewinn in Richtung des Empfängers.

# text
seg-aba3b3eaba85 = Integrität & Augmentierung

# text
seg-eab1b2c6728e = Integrität ist die Frage des <em>Vertrauens</em>: nicht „wie groß ist mein Fehler?“, sondern „kann ich ihn begrenzen, und erfahre ich es, wenn die Schranke gebrochen wird?“ Dies sind die Begriffe der Luftfahrt dafür.

# text
# c1: src/raim.rs
seg-696a73449c49 = <b>RAIM — Überwachung der Integrität durch den Empfänger selbst.</b> Einfach gesagt: <em>Der Empfänger prüft die Satelliten gegeneinander.</em> Bei mehr Satelliten als den vier, die eine Positionsbestimmung braucht, sollten die Überschüsse (die Residuen) klein sein; ein großes Residuum bedeutet, dass ein Satellit lügt, und der Empfänger kann das ohne Hilfe vom Boden sagen. Umgesetzt in <a1><c1/></a1>.

# text
# c1: ARAIM_REFERENCE.md
seg-89237433f01a = <b>ARAIM — fortgeschrittene Überwachung der Integrität durch den Empfänger selbst.</b> Die moderne Form von RAIM mit zwei Frequenzen und mehreren Konstellationen. Sie erhält eine Integritäts-Stützungsnachricht, die den angenommenen Fehler und die Fehlerwahrscheinlichkeit jedes Satelliten angibt, und liefert Schutzniveaus statt eines Bestanden/Nicht-bestanden-Flags. Vollständige Behandlung mit jeder Annahme in <a1><c1/></a1>.

# text
# c1: leo-navmsg
seg-4cc13de05193 = <b>SISRE — Signal-in-Space-Entfernungsfehler.</b> Einfach gesagt: <em>wie weit die ausgesendete Bahn und Uhr eines Satelliten die Entfernung, die ein typischer Nutzer misst, danebenliegen lassen.</em> Der Bahnfehler wird in radiale, Along-Track- und Cross-Track-Anteile zerlegt und danach gewichtet, wie stark sich jeder entlang einer mittleren Sichtlinie zeigt, und dann mit dem Uhrenfehler kombiniert (Montenbruck et al. { "2018" }). Bei einem Satelliten im niedrigen Erdorbit wiegen die Along- und Cross-Track-Anteile weit mehr als bei GPS, weil Nutzer ihn weit abseits des Nadirs sehen. Verwendet von der Art <c1/>.

# text
# c1: leo-navmsg
# c2: kepler-rac
seg-847e40a033e1 = <b>RAC — radial, Along-Track, Cross-Track.</b> Die drei Richtungen, in die ein Bahnfehler zerlegt wird: vom Erdmittelpunkt weg, in Flugrichtung und senkrecht zur Bahnebene. Das Modell <c2/> der Art <c1/> fügt in jeder ein Korrekturpolynom hinzu.

# text
seg-b725d23c839e = <b>SVID — Satellitenkennung.</b> Die Nummer, mit der eine Navigationsnachricht den Satelliten benennt, der sie gesendet hat.

# text
seg-b0f850eb04b1 = <b>IOD — Datenausgabestand (Issue of Data).</b> Ein Zähler, der sich ändert, sobald sich der Inhalt der Navigationsnachricht eines Satelliten ändert, damit ein Empfänger eine neue Nachricht von einer Wiederholung unterscheiden kann. (Nicht zu verwechseln mit einer In-Orbit-Demonstration, ebenfalls mit IOD abgekürzt, wie bei Celeste IOD der ESA.)

# text
seg-985a5e9c9ce9 = <b>TOW — Zeit der Woche (Time of Week).</b> Sekunden seit Beginn der laufenden GNSS-Woche (Sonntag { "00" }:{ "00" }).

# text
# c1: 0x1864CFB
seg-1fc62dca46d6 = <b>CRC-24Q — 24-Bit-zyklische Redundanzprüfung (Qualcomm-Polynom).</b> Die fehlererkennende Prüfung, die RTCM { "10403" } und Galileo-Nachrichten tragen: ein 24-Bit-Rest der durch das Polynom <c1/> geteilten Nachrichtenbits. Ein Empfänger berechnet ihn neu und verwirft eine Nachricht, die nicht passt.

# text
# c1: sigma_ure_m
# c2: src/raim.rs
seg-abb4679dab23 = <b>URE — Nutzer-Entfernungsfehler.</b> Einfach gesagt: <em>wie falsch die eigene ausgesendete Bahn und Uhr eines Satelliten jede Entfernung zu ihm machen.</em> Auch Signal-in-Space-Fehler (SISE) genannt; es ist das Fehlerbudget je Satellit, mit dem ARAIM und RAIM gespeist werden (<c1/> in <a1><c2/></a1>).

# text
seg-158c210fd3fe = <b>MHSS — Lösungstrennung bei mehreren Hypothesen (Multiple Hypothesis Solution Separation).</b> Die Methode, die ARAIM verwendet. Für jede Art, wie die Konstellation fehlerbehaftet sein könnte, bildet sie eine Lösung, die die verdächtigen Satelliten ausschließt, und begrenzt, wie weit diese Teillösung von der Lösung mit allen sichtbaren Satelliten entfernt liegen kann.

# text
seg-671711003a6f = <b>HPL / VPL — horizontales / vertikales Schutzniveau.</b> Einfach gesagt: <em>der Radius, innerhalb dessen das System bei einem angegebenen Integritätsrisiko zusagt, dass der wahre Fehler liegt.</em> Es ist eine Schranke, die der Algorithmus berechnet, kein gemessener Fehler. Ein Lauf ist verfügbar, wenn das Schutzniveau unter der Alarmgrenze bleibt, die der Betrieb zulässt (VAL, die vertikale Alarmgrenze; HAL, die horizontale).

# text
# c1: src/sbas.rs
seg-5bbd2d664862 = <b>SBAS — satellitengestütztes Augmentierungssystem.</b> Ein Bodennetz, das GNSS beobachtet, Korrekturen und Integritätsschranken berechnet und sie von geostationären Satelliten aussendet. <b>WAAS — Wide Area Augmentation System</b> ist das US-amerikanische; EGNOS (der European Geostationary Navigation Overlay Service) ist das europäische Gegenstück. Kshana berechnet Schutzniveaus in der DO-229E-Form der gewichteten kleinsten Quadrate (DO-229E ist die Mindestanforderung der RTCA an die Betriebsleistung für SBAS-Empfänger; RTCA hieß früher Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

# text
seg-ba8b448582af = Schätzung & Geometrie

# text
seg-2eb6e72496b8 = <b>Schätzer.</b> Der Algorithmus, der die wahre Position/Zeit während eines Ausfalls aus dem Sensormodell vorhersagt. Kshana hat einen analytischen Holdover-Prädiktor und einen <b>Kalman-Filter</b>.

# text
seg-9b4aa612c5a9 = <b>Kalman-Filter.</b> Einfach gesagt: <em>ein Algorithmus, der eine Größe verfolgt und auch verfolgt, wie unsicher sie ist.</em> Kshana nutzt seine Unsicherheitsschranke, um die Integrität zu berechnen.

# text
seg-8fda81dfccc9 = <b>EKF — erweiterter Kalman-Filter.</b> Ein Kalman-Filter für ein nichtlineares Problem: Er linearisiert das Modell in jedem Schritt um die aktuelle Schätzung. Die übliche Wahl, um GNSS an ein INS zu koppeln.

# text
seg-9bc2c6f74b29 = <b>UKF — Unscented-Kalman-Filter.</b> Dieselbe Aufgabe ohne Linearisierung: Er schickt eine kleine Menge deterministisch gewählter Stützpunkte durch das wahre nichtlineare Modell und baut Mittelwert und Kovarianz aus der Lage zusammen, in der sie landen. Besser verhalten, wenn die Nichtlinearität stark ist, weshalb ihn die Bahnbestimmung verwendet.

# text
seg-a1e52820e3a0 = <b>DOP — Verdünnung der Genauigkeit (Dilution Of Precision).</b> Einfach gesagt: <em>wie stark die Geometrie der Satelliten Entfernungsmessfehler in Positions- oder Zeitfehler verstärkt.</em> Positionsfehler ≈ PDOP × Entfernungsmessfehler, ein niedriger Wert ist also gute Geometrie. Die Familie: <b>GDOP</b> (geometrisch — Position und Zeit zusammen), <b>PDOP</b> (Position), <b>HDOP</b> (horizontal), <b>VDOP</b> (vertikal), <b>TDOP</b> (Zeit).

# text
seg-e769a91a3e4b = <b>Walker-Konstellation.</b> Eine übliche Art, eine Satellitenkonstellation durch die Zahl ihrer Bahnebenen und der Satelliten je Ebene zu beschreiben (GPS ist grob eine Walker-Schale 24/6).

# text
seg-b557933a4e4d = <b>Elevationsmaske.</b> Der Mindestwinkel über dem lokalen Horizont, ab dem ein Satellit als nutzbar gilt; zu tiefe Signale werden ausgeschlossen.

# text
seg-3ac8e11c3e33 = <b>Verdeckung.</b> Wenn die Erde die Sichtlinie zu einem Satelliten physisch blockiert.

# text
# c1: max(elevation mask, skyline)
# c2: SKYLINE.md
seg-249bf472cb00 = <b>Horizontlinie (Skyline-Maske).</b> Einfach gesagt: <em>die Silhouette von Gebäuden, Kränen oder Hügeln gegen den Himmel, als Elevation für jeden Azimut.</em> Ein Satellit gilt nur oberhalb von <c1/> bei seinem Azimut als in Sicht, und einer über der Maske, aber hinter der Horizontlinie, ist „von der Horizontlinie verdeckt“. Kshana baut eine aus einer Tabelle, einer Straßenschlucht, Sektoren und Gelände (ihr punktweises Maximum) oder einer Voreinstellung REPRESENTATIVE; nur Sichtlinie, keine Reflexion oder Beugung (<a1><c2/></a1>).

# text
# c1: SKYLINE.md
seg-620a88820a2d = <b>Himmelsgeometrie.</b> Welche Satelliten ein Standort unter einer Horizontlinie sieht und was das für die Lösung bedeutet: die DOP-Faktoren, die Ost-Nord-Oben-Kovarianz der Positionsbestimmung nach kleinsten Quadraten und ihre <b>Fehlerellipse</b>, das horizontale Gebiet, das den angegebenen Anteil der Positionsbestimmungen enthält (standardmäßig { "95" } %) bei unabhängigen, gleichen gaußschen Entfernungsfehlern. MODELLED Geometrie unter einem angegebenen Fehlermodell, nicht der wirkliche Fehler eines Empfängers (<a1><c1/></a1>).

# text
# c1: src/integrity/mod.rs
seg-f0e610122425 = <b>CTI — zusammengesetzte Zeitintegrität (Composed Timing Integrity).</b> Schutzniveaus für die <em>Zeit</em> statt der Position, berechnet über eine Übergabe zwischen verschiedenen Zeitquellen — zum Beispiel von einer satellitengeprüften (RAIM-verfügbaren) Uhr zu einer freilaufenden im Holdover —, sodass die Schranke durch den Übergang gültig bleibt (<a1><c1/></a1>).

# text
# c1: src/benchmark/mod.rs
seg-56642f614c3f = <b>TIB — Timing Integrity Benchmark.</b> Ein Maßstab für die Zeitmonitore <em>anderer</em>: Er speist eine Auswahl von Fehlern ein und prüft, ob das angegebene Schutzniveau des Monitors seinen Fehler tatsächlich begrenzt hat. Er erhebt keinen eigenen Genauigkeitsanspruch und kann daher keinen überzeichnen (<a1><c1/></a1>).

# text
seg-8b89f8b913b9 = Bahnen & cislunar

# text
# c1: src/cr3bp.rs
seg-ba6b669eb8ba = <b>CR3BP — kreisförmiges eingeschränktes Dreikörperproblem.</b> Das Erde-Mond-System, behandelt als zwei Körper auf Kreisbahnen um ihren gemeinsamen Schwerpunkt, plus ein Raumfahrzeug, das zu leicht ist, um zurückzuwirken. In der Nähe des Mondes ist eine Zweikörper-Kepler-Ellipse schlicht die falsche Form; das CR3BP ist die günstigste Dynamik, die stimmt (<a1><c1/></a1>).

# text
seg-2726a22bf14c = <b>NRHO — nahezu geradlinige Halo-Bahn.</b> Eine periodische CR3BP-Bahn, die nahe über dem einen Mondpol schwingt und weit hinaus über dem anderen, sodass sie von der Stirnseite fast eine gerade Linie ist — daher „nahezu geradlinig“. Sie ist die für das Mond-Gateway gewählte Bahn und hält nahezu durchgehende Sichtlinie zur Erde.

# text
seg-2b2e6d04376c = <b>DRO — weite retrograde Bahn (Distant Retrograde Orbit).</b> Eine weitere CR3BP-Familie: eine große, stabile Bahn, die den Mond im rotierenden Bezugssystem gesehen rückwärts umkreist.

# text
# c1: finals2000A
# c2: --eop
seg-6bb9229aee5c = <b>EOP — Erdorientierungsparameter.</b> Das gemessene, leicht unregelmäßige Taumeln und Drehen der Erde (Polbewegung, UT1 (Universalzeit { "1" }, Erdrotationszeit)−UTC — Erdrotationszeit minus koordinierte Weltzeit — und Tageslänge), das nötig ist, um eine erdfeste Position auf besser als Meter in eine inertiale umzurechnen. Der IERS (International Earth Rotation and Reference Systems Service) veröffentlicht sie; Kshana liest seine Datei <c1/> über <c2/>.

# text
seg-7f1e7e523e5b = Normen, Formate & Organisationen

# text
seg-5d8d6144c13a = Die Abkürzungen, die die README und die Paketseiten für Normen, Dateiformate, Zeitskalen, Bezugssysteme und die dahinterstehenden Stellen verwenden. Jede wird auf diesen Seiten bei der ersten Verwendung auch ausgeschrieben.

# text
seg-800d42de0777 = Bahnen, Bezugssysteme und Zeit

# text
seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Die analytischen Standardpropagatoren für veröffentlichte Satellitenbahnen.

# text
seg-87a098568846 = <b>TLE — Zweizeilen-Elementesatz.</b> Das öffentliche Bahnformat, das SGP4 liest.

# text
seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — niedriger Erdorbit / mittlerer Erdorbit / geostationärer Transferorbit / geneigter geosynchroner Orbit.</b> Bahnbereiche; die meisten GNSS-Satelliten fliegen im MEO.

# text
seg-1ec323dbd7a6 = LMO — niedriger Marsorbit.

# text
seg-d0be640282af = <b>ECI / ECEF — erdzentriert inertial / erdzentriert, erdfest.</b> Ein Bezugssystem, das sich nicht mit der Erde dreht, und eines, das es tut.

# text
seg-09a937adc1db = <b>TEME — wahrer Äquator, mittleres Äquinoktium.</b> Das Bezugssystem, in dem SGP4 ausgibt.

# text
seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — geozentrisches himmelsfestes Referenzsystem / internationales terrestrisches Referenzsystem / seine Realisierung, der International Terrestrial Reference Frame.</b> Die modernen inertialen und erdfesten Bezugssysteme.

# text
seg-56b24c3734be = <b>CIO — himmelsfester Zwischenursprung (Celestial Intermediate Origin).</b> Der Bezugspunkt der modernen, äquinoktiumfreien Kette der Erdrotation.

# text
seg-a23b05c85a63 = <b>LVLH — lokale Vertikale, lokale Horizontale.</b> Ein Bezugssystem, das sich mit dem Raumfahrzeug bewegt.

# text
seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> Das Erdellipsoid, das GPS verwendet.

# text
seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — koordinierte Weltzeit / Internationale Atomzeit / Terrestrische Zeit / Universalzeit { "1" } (Erdrotationszeit) / baryzentrische dynamische Zeit.

# text
seg-ea7eb1f34cae = <b>LTC / TCL — Mond-Koordinatenzeit (Temps-Coordonnée Lunaire).</b> Die vorgeschlagene Zeitskala für den Mond.

# text
seg-c6e5976d9dff = <b>OD — Bahnbestimmung.</b> Eine Bahn aus Verfolgungsmessungen gewinnen.

# text
seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> und <b>DRO</b> sind oben unter „Bahnen & cislunar“ definiert.

# text
seg-2e6ba9069396 = Dateiformate und Nachrichten

# text
seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> Das Dateiformat für präzise Bahnen des International GNSS Service (IGS), in den Versionen c und d.

# text
seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format.</b> Das Standarddateiformat für GNSS-Beobachtungen und ausgesendete Ephemeriden.

# text
seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format.

# text
seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Standardnachrichten für Bahnen und Verfolgungsdaten des Consultative Committee for Space Data Systems (CCSDS).

# text
seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Das Klartextformat der Szenarien von Kshana.

# text
seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Der versionierte, selbstbeschreibende Ergebnisumschlag von Kshana.

# text
seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Mindestanforderungen der RTCA an die Betriebsleistung für SBAS-Empfänger und für GPS-Bordausrüstung mit flugzeugbasierter Augmentierung.

# text
seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> Die GPS-Schnittstellenspezifikationen (die zweite deckt das L5-Signal ab).

# text
seg-2230000aa30b = <b>NIST SP { "1065" }.</b> Das <em>Handbook of Frequency Stability Analysis</em> des National Institute of Standards and Technology.

# text
seg-8b89719c1859 = <b>TRL — Technologie-Reifegrad.</b> Eine Skala von 1 bis 9 für die Reife von Hardware.

# text
seg-16c972f4ea0a = Organisationen

# text
seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — die Europäische Weltraumorganisation, ihr Europäisches Raumflugkontrollzentrum und ihr Europäisches Netz zur Raumfahrzeugverfolgung.

# text
seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — die US-amerikanische National Aeronautics and Space Administration, ihr Jet Propulsion Laboratory, ihre Navigation and Ancillary Information Facility (die das Toolkit SPICE — Spacecraft, Planet, Instrument, C-matrix, Events — veröffentlicht) und ihr Deep Space Network.

# text
seg-eaa5a2a51169 = <b>IGS</b> — der International GNSS Service. <b>IERS</b> — der International Earth Rotation and Reference Systems Service. <b>IAU</b> — die Internationale Astronomische Union (deren Bibliothek SOFA, Standards of Fundamental Astronomy, und deren offener Port ERFA, Essential Routines for Fundamental Astronomy, die Bezugsquellen von Kshana für Bezugssysteme sind).

# text
seg-81af4c0f4c48 = <b>CCSDS</b> — das Consultative Committee for Space Data Systems. <b>AIAA</b> — das American Institute of Aeronautics and Astronautics. <b>RTCA</b> — früher Radio Technical Commission for Aeronautics.

# text
seg-aa0b395df17f = Software und Lieferkette

# text
seg-b42188d3a6f4 = CLI — Befehlszeilenschnittstelle.

# text
seg-198c591514ab = <b>MCP — Model Context Protocol</b>, das Protokoll, das der Agentenserver von Kshana spricht. <b>IDE — integrierte Entwicklungsumgebung.</b>

# text
seg-287bf61a1a16 = SBOM — Software-Stückliste.

# text
seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, das Rahmenwerk für die Herkunft von Builds, unter dem die Releases von Kshana attestiert werden.

# text
seg-7487c6f9ed18 = Jede andere Abkürzung, von A bis Z

# text
# c1: docs/
seg-56f6039bb38a = Jede Abkürzung, die in der Repository-Dokumentation (<c1/> und den vier READMEs) vorkommt und die kein Abschnitt oben definiert, dazu einige, die einer definiert, zum Nachschlagen wiederholt. Jede Seite schreibt ihre Abkürzungen bei der ersten Verwendung auch aus; diese Tabelle ist die eine Stelle, um sie alle nachzuschlagen. Einige Einträge sind Kennungen oder Namen statt Abkürzungen und sagen das auch.

# text
seg-c0dfa446e523 = Steht für

# text
seg-f272d28225ae = Wo es vorkommt

# text
seg-ffb0596f134b = Third Generation Partnership Project

# text
seg-77c1b4478387 = die Stelle, die die 5G-Normen schreibt, einschließlich nichtterrestrischer Netze

# text
seg-eaf19768b977 = Mobilfunknetz der fünften Generation

# text
seg-692ddc163c55 = einschließlich seiner Positionierung über nichtterrestrische Netze (NTN)

# text
seg-9524be916f07 = ABI

# text
seg-0e8332db764b = binäre Anwendungsschnittstelle

# text
seg-762ea76708dc = Python-Wheel-Tags

# text
seg-d419d06ed622 = ABMF

# text
seg-b294c714487d = die IGS-Station in Le Moule, Guadeloupe

# text
seg-586a8ea87638 = eine vierstellige Stationskennung

# text
seg-4cc9a09495e6 = AC

# text
seg-620e2dc5e4ca = Wechselstrom

# text
seg-9cfb5dc4b4bc = wie beim AC-Stark-Effekt (Lichtverschiebung)

# text
seg-90308009c536 = ADD

# text
seg-49d97c65662d = Algorithm Description Document

# text
seg-493b5ceaa0fb = der Referenzalgorithmus von WG-C für ARAIM an Bord

# text
seg-3fe5d7f41dcd = ADEV / OADEV

# text
seg-089ac7d5ac94 = Allan-Abweichung / überlappende Allan-Abweichung

# text
seg-23c38ecbc543 = siehe Allan-Abweichung oben

# text
seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

# text
seg-4b642742f2d4 = Teilenummern von Inertialsensoren (Analog Devices; Safran Sensonor; MicroStrain)

# text
seg-c4c0a93477a8 = Kennungen, keine Abkürzungen

# text
seg-36743c7fe98e = AEM

# text
seg-142ca108a070 = Attitude Ephemeris Message

# text
seg-c34185a83d8e = eine CCSDS-Nachricht

# text
seg-dd89e1deb663 = AESS

# text
seg-898b29aaef84 = Aerospace and Electronic Systems Society

# text
seg-78692bf5addf = des IEEE

# text
seg-f429be16014e = AF

# text
seg-afa04bc28b42 = Mittelungsfaktor

# text
seg-b3db60632b92 = das ganzzahlige Vielfache des Abtastintervalls in einem Schätzer vom Allan-Typ

# text
seg-6097c4709542 = AFS

# text
seg-7043ab3fe32b = Augmented Forward Signal

# text
seg-20380d29d286 = das Mondnavigationssignal von LunaNet

# text
seg-b33d60fa5832 = AGC

# text
seg-98c9c2809bd6 = automatische Verstärkungsregelung

# text
seg-750b8717220b = ein jamming-Indikator in einem Empfänger-Frontend

# text
seg-31b864b910d5 = AHP

# text
seg-f956cbe86552 = Analytic Hierarchy Process

# text
seg-c2b63847e2dc = ein Gewichtungsverfahren mit mehreren Kriterien (Saaty)

# text
seg-0e00edd7e222 = AI / ML

# text
seg-6d804a116a08 = künstliche Intelligenz / maschinelles Lernen

# text
seg-079020f86d22 = AL / HAL / VAL

# text
seg-1981b764715b = Alarmgrenze / horizontale Alarmgrenze / vertikale Alarmgrenze

# text
seg-1e52f04eb047 = der Fehler, den ein Integritätsmonitor begrenzen muss

# text
seg-c7ce4d3299b8 = AltBOC

# text
seg-f630bcd1d523 = alternative binary offset carrier

# text
seg-e3acb231cf4d = die Modulation von Galileo E5

# text
seg-79b130764f97 = Ungleichung vom arithmetischen und harmonischen Mittel

# text
seg-190b782b70ce = AOCS

# text
seg-6459d9bce282 = Lage- und Bahnregelungssystem

# text
seg-14ec3e19c990 = AOS / TCA / LOS

# text
seg-7cdb4a7e6df4 = Signalbeginn / Zeitpunkt der größten Annäherung / Signalverlust

# text
seg-8b73e2c51498 = die Ereignisse eines Überflugs einer Bodenstation (LOS bedeutet auch Sichtlinie; der Zusammenhang sagt, was gemeint ist)

# text
seg-27ceb7163571 = API

# text
seg-7903f5ff4027 = Programmierschnittstelle

# text
seg-d6bea5dea0dc = APID

# text
seg-d468b4555dbf = Kennung des Anwendungsprozesses

# text
seg-55730824c8cf = das Feld im Kopf des CCSDS-Space-Packets

# text
seg-611cd7a0d378 = APS

# text
seg-55842a648c47 = American Physical Society

# text
seg-07dcfba8a3c9 = APV

# text
seg-1a7fbb0deef2 = Anflug mit vertikaler Führung

# text
seg-69a6cc8a532a = APV-I: { "40" } m horizontale, { "50" } m vertikale Alarmgrenzen

# text
seg-f357a0a03c60 = ARL

# text
seg-b4ce3803afa6 = mittlere Lauflänge

# text
seg-08a5d53f813c = die mittlere Zeit, die ein Änderungsdetektor bis zum Alarm braucht

# text
seg-519e65f68c85 = ARM / ARM64

# text
seg-1db3bdee5f76 = die Prozessorarchitektur von Arm / ihre 64-Bit-Form

# text
seg-33f6dff869b2 = ASD

# text
seg-dd98c69872e0 = spektrale Amplitudendichte

# text
seg-9fb629e35a25 = die Quadratwurzel einer spektralen Leistungsdichte

# text
seg-a020de5e94e5 = AU

# text
seg-2342680bc7a6 = astronomische Einheit

# text
seg-894bf4353ce3 = { "149 597 870.7" } km

# text
seg-611aec9d1dce = AUC / ROC

# text
seg-a11aa1d8f433 = Fläche unter der Kurve / Empfänger-Betriebskennlinie

# text
seg-4d65dbf47a5c = Bewertung von Detektoren

# text
seg-25dc893d746a = AWS

# text
seg-20979dc817ba = Amazon Web Services

# text
seg-569160c6e52d = hostet eine offene Spiegelung der SRTM-Höhenkacheln

# text
seg-298c6a00085d = BEL

# text
seg-c7ce8fa2c544 = Gebäudeeindringdämpfung

# text
seg-b714453f9b2c = ITU-R P.2109

# text
seg-b9aec1857aa9 = BI

# text
seg-40ea7b7e321e = Bias-Instabilität

# text
seg-ff2ba8692cbc = das flache Minimum der Allan-Abweichung eines Inertialsensors

# text
seg-e7c1cfecd45e = BIPM

# text
seg-dc138478d882 = Bureau International des Poids et Mesures (Internationales Büro für Maß und Gewicht)

# text
seg-6ec98084ac58 = veröffentlicht Circular T

# text
seg-4ff08facda60 = BKG

# text
seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie

# text
seg-ac4765a77015 = betreibt eine Spiegelung der IGS-Daten

# text
seg-a85954d9176e = BSD

# text
seg-eb42c5807e5a = Berkeley Software Distribution

# text
seg-a332a259125a = wie in den BSD-Lizenzen

# text
seg-97764c651815 = BSP

# text
seg-8f85848ee08a = binärer SPK

# text
seg-6e01dca47581 = eine binäre SPICE-Ephemeridendatei (Kernel)

# text
seg-0157bbd7a064 = BSTAR

# text
seg-23772d56a24c = der Widerstandsterm eines Zweizeilen-Elementesatzes

# text
seg-628e6c686508 = CAI

# text
seg-a2418a88886c = Kaltatom-Interferometer

# text
seg-273a3b8d5385 = siehe QUANTUM.md

# text
seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

# text
seg-fa257dda6d45 = CC / CC BY

# text
seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

# text
seg-a1f55ee72524 = eine Lizenz für Daten oder Text

# text
seg-1b8df20680a0 = CDDIS

# text
seg-0a158229f571 = Crustal Dynamics Data Information System

# text
seg-5b3f50bed1f6 = das Archiv der NASA für Weltraumgeodäsie

# text
seg-ee2ac06a3023 = CDF

# text
seg-0a54599e470d = kumulative Verteilungsfunktion

# text
seg-6100157bdc02 = CFAR

# text
seg-43ef1f6cd71d = konstante Falschalarmrate

# text
seg-b38b56b63da6 = eine Schwellwertregel für Erfassungsdetektoren

# text
seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

# text
seg-4dab086e5c3d = das Datum von BeiDou

# text
seg-8f7751d39781 = CIP

# text
seg-e34a194da574 = Celestial Intermediate Pole

# text
seg-c9b37d94f70b = CIRS

# text
seg-29e69d7f32aa = Celestial Intermediate Reference System

# text
seg-a543c4d02ace = CISA

# text
seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

# text
seg-59c481cb5741 = des US DHS

# text
seg-4f7ba1fd1f4c = CM / CL

# text
seg-4fb8507eb747 = civil moderate / civil long

# text
seg-cc0c8f1524f8 = die beiden im Zeitmultiplex gesendeten GPS-L2C-Codes

# text
seg-2ea49f6a1ae9 = CMPL

# text
seg-68b147628ea1 = Schutzniveau für Gleichtaktfehler

# text
seg-d469cd44d9d4 = die Schranke für Fehler, die ein Residuentest nicht sehen kann

# text
seg-4e25d07b13c9 = CN

# text
seg-e775ec496f2b = converged Newtonian

# text
seg-5d679a981a34 = die Laufzeit-Aberrationskorrektur von SPICE

# text
seg-3da9a2841b6c = C/N0 (C/N₀)

# text
seg-cf60da0631b4 = in dB-Hz

# text
seg-f4488db8194d = COPRAS

# text
seg-6379891c1750 = COmplex PRoportional ASsessment

# text
seg-b99fe66bd09c = ein Rangbildungsverfahren mit mehreren Kriterien

# text
seg-a562dbafa35f = COSPAR

# text
seg-c09ea7bc49b0 = Committee on Space Research

# text
seg-235850ad0d1f = vergibt internationale Satellitenbezeichnungen

# text
seg-dbc3e7c90fe0 = CPR

# text
seg-1fd5b461cc3d = Zyklus pro Umlauf

# text
seg-a1d4080ce019 = eine empirische Bahnbeschleunigung bei der Umlauffrequenz

# text
seg-96cd47b07b44 = CPU / GPU / NPU

# text
seg-10ad2f10bec0 = zentrale / grafische / neuronale Verarbeitungseinheit

# text
seg-93621c1a1e37 = CRB / CRLB

# text
seg-70b6a0b19705 = Cramér-Rao-Schranke / untere Cramér-Rao-Schranke

# text
seg-6eb684e34f56 = die kleinste Varianz, die ein erwartungstreuer Schätzer erreichen kann

# text
seg-93c4fe0f2990 = CRD

# text
seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

# text
seg-eb95135f849c = Normalpunkt-Dateien des ILRS

# text
seg-f23ff835b9b0 = CRPA

# text
seg-b5c26297e11b = Antenne mit gesteuerter Empfangscharakteristik

# text
seg-7111b9c4d382 = ein Anti-jamming-Antennenfeld

# text
seg-404133a74afc = CR / RI

# text
seg-d35896b2bb24 = Konsistenzverhältnis / Zufallsindex

# text
seg-cfa91dc02138 = die AHP-Konsistenzprüfung (CR < { "0.10" } akzeptieren)

# text
seg-8572a3faf46a = CS GROUP

# text
seg-5e00428ed929 = das französische Unternehmen, das Orekit pflegt

# text
seg-58d5f143ff3b = ein Firmenname, keine aufzulösende Abkürzung

# text
seg-be388831a3e1 = CSK

# text
seg-9cf6cad11f64 = Codeverschiebungstastung

# text
seg-a3bd162146d6 = CSS

# text
seg-75ddcc97f9e2 = Cascading Style Sheets

# text
seg-0d5c127b2ee5 = CUSUM

# text
seg-d40da5f47035 = kumulative Summe

# text
seg-66f752e15abc = ein sequenzieller Änderungsdetektor

# text
seg-92ac0357d01e = CV

# text
seg-28f75c073917 = (gemeinsame Sicht bei der Zeitübertragung; der Zusammenhang sagt, was gemeint ist)

# text
seg-507b8c235614 = CZML

# text
seg-0b76641dee1a = Cesium Language

# text
seg-fd0a7af2ebeb = das JSON-Szenenformat von CesiumJS

# text
seg-1aefbc0b799d = dB / dBW / dB-Hz

# text
seg-8a0d954bd13b = Dezibel / Dezibel-Watt / Dezibel-Hertz

# text
seg-c485de5bcd85 = Leistungsverhältnis, absolute Leistung und eine Einheit für C/N0

# text
seg-6c0cbce59df5 = DC

# text
seg-ddd7d412fce7 = Gleichstrom

# text
seg-0ea7fccee332 = der Grenzwert bei der Frequenz null

# text
seg-521e2abbe12d = DCM

# text
seg-3db4487dc2a4 = Richtungskosinusmatrix

# text
seg-9d3d9ca79a9d = eine Rotationsmatrix

# text
seg-364a2fcec10b = DCO

# text
seg-110b1eb4f532 = Developer Certificate of Origin

# text
seg-1545bd59f5ef = DCT

# text
seg-8b6866288bea = Design-Control-Tabelle

# text
seg-80d95f099e9a = eine Link-Bilanz-Tabelle (das X-Band-Beispiel Galileo von JPL DESCANSO)

# text
seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

# text
seg-ed8d5c361e79 = JPL Development Ephemeris (Versionen { "421" }, { "430" }, { "440" }, { "441" })

# text
seg-748af19e3f0b = Planeten- und Mondephemeriden; „DE-grade“ bedeutet Genauigkeit dieser Klasse

# text
seg-6f880928ce0c = DEM

# text
seg-eed6ad669d4c = digitales Höhenmodell

# text
seg-920f5ff86fa2 = DESCANSO

# text
seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

# text
seg-2e11a1976171 = Monografienreihe des JPL

# text
seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München

# text
seg-e7cedd55549e = hostet das EUROLAS Data Center

# text
seg-4389ecd5c81a = DGNSS

# text
seg-fb8c5992354b = differentielles GNSS

# text
seg-3fed847ae9ec = DHS

# text
seg-2845322fad33 = Department of Homeland Security

# text
seg-6b487421c547 = US

# text
seg-9e06c8655623 = DoD

# text
seg-7a7ea4a3f0d5 = Department of Defense

# text
seg-1f6c4757bee5 = DOF / DoF

# text
seg-e1daefad0696 = Freiheitsgrad

# text
seg-bf5bc69cb873 = siehe 1-DOF oben

# text
seg-3b5c7c9b324d = DOR / Δ-DOR

# text
seg-3e0b6392f4d9 = differentielle Einweg-Entfernungsmessung / Delta-differentielle Einweg-Entfernungsmessung

# text
seg-6ba2d3b5b724 = Winkelverfolgung im Weltraum

# text
seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

# text
seg-ea9b38a5d810 = Dormand-Prince { "5" }({ "4" }) / Runge-Kutta { "4" } / Runge-Kutta { "5" } / Dormand-Prince { "8" }({ "5,3" })

# text
seg-00ecc6de9912 = numerische Integratoren

# text
seg-16c4bf2faef3 = DRMS

# text
seg-8128cc0c1482 = quadratischer Mittelwert des Abstands

# text
seg-a8ed04890ded = siehe 2DRMS

# text
seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

# text
seg-371644e70b75 = Dokumentnummern von Microchip-Datenblättern

# text
seg-f25e5c4de1e5 = DSAC

# text
seg-aa0d8d4b3a3b = Deep Space Atomic Clock

# text
seg-e80350ed521f = die Uhr der NASA mit gefangenen Quecksilberionen

# text
seg-52e838301c0b = UT1 minus UTC

# text
seg-fbce3b3b7b80 = die Korrektur der Erdrotation

# text
seg-8aa996f34920 = Energie pro Bit über der Rauschdichte

# text
seg-463b21c0b791 = das inertiale Bezugssystem, das zu Beginn eines Laufs mit dem erdfesten ausgerichtet ist

# text
seg-4dc987bd9dbf = verwendet von den Interop-Exporten von leo-pass

# text
seg-61f975df5e21 = ECMAScript / ES

# text
seg-c66e728cd2fa = der Standard hinter JavaScript / ein ES-Modul

# text
seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

# text
seg-2967e958f353 = ein Modell des Strahlungsdrucks der Sonne für GNSS (CODE: Center for Orbit Determination in Europe)

# text
seg-244af4062ccc = ECSS

# text
seg-b74029376aba = European Cooperation for Space Standardization

# text
seg-d452e23d503a = ECSS-E-ST-10-02 ist ihre Verifikationsnorm

# text
seg-becb6685ff13 = ED

# text
seg-b6448e14a567 = EUROCAE-Dokument

# text
seg-ee4ada9c4c6e = wie in ED-259A

# text
seg-8a57ce8403b1 = EDL

# text
seg-0f065f2290f3 = Eintritt, Abstieg und Landung

# text
seg-69f37001de44 = EEE

# text
seg-18a1b66286ee = elektrische, elektronische und elektromechanische (Bauteile)

# text
seg-f814c1301059 = Produktsicherung in der Raumfahrt

# text
seg-08e455b17435 = EGM / EGM2008

# text
seg-1ed72a253035 = Earth Gravitational Model (die Ausgabe von { "2008" })

# text
seg-074e3ceb394e = NGA

# text
seg-69ba7307ea4c = EIGEN

# text
seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

# text
seg-a49ce7809382 = ELECTRE

# text
seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (Ausschluss und Wahl, die die Wirklichkeit ausdrücken)

# text
seg-efb2f919955a = ein Überrangierungsverfahren mit mehreren Kriterien

# text
seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, die Version MPP02 (Chapront)

# text
seg-b1d699d70339 = eine analytische Mondtheorie

# text
seg-aee5eeb23064 = mittlerer Erdäquator und Äquinoktium von J2000

# text
seg-16d9b8eac95d = ein inertiales Bezugssystem

# text
seg-e676d5eec6e3 = EML

# text
seg-f4bba0abbda7 = ein Code-Diskriminator

# text
seg-0e4110d33849 = EMT

# text
seg-103c6de62575 = wirksamer Monitor-Schwellwert

# text
seg-4b2101113387 = eine Ausgabe von ARAIM

# text
seg-0e2817aec74a = ENU / NED

# text
seg-56d5cf1544d9 = Ost-Nord-Oben / Nord-Ost-Unten

# text
seg-aae7610833a7 = lokale Horizontsysteme

# text
seg-c7d5c5d5c5b2 = EO

# text
seg-24907930c730 = Erdbeobachtung

# text
seg-38f9c209c4ac = EPM / EPM2021

# text
seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (die Ausgabe von { "2021" })

# text
seg-bd2a27a17f6d = Ephemeride des IAA RAS

# text
seg-01a8e43fb6c7 = ERA

# text
seg-eb78ffaf7e1d = Erdrotationswinkel

# text
seg-966ed500f705 = ESKF

# text
seg-e79112a3132a = Kalman-Filter für den Fehlerzustand

# text
seg-25c6b6b19d75 = ESS

# text
seg-fe2b7be913f0 = effektive Stichprobengröße

# text
seg-57ce1c1b617b = eines Partikelfilters

# text
seg-f529300f944b = ESSR

# text
seg-869be8388d26 = European Space Software Repository

# text
seg-536d66d208e4 = ESA

# text
seg-27be9c1d7090 = ET

# text
seg-7cc2ef5b0748 = Ephemeridenzeit

# text
seg-e0c49639649e = der Name von SPICE für TDB

# text
seg-80de6914a5ec = EUROCAE

# text
seg-76897dd8c3be = Europäische Organisation für Ausrüstung der Zivilluftfahrt

# text
seg-b4f12b7813dd = EUROLAS

# text
seg-857527c69d6e = Europäisches Lasernetz

# text
seg-fa7025d88c88 = Laserentfernungsmessung zu Satelliten und zum Mond

# text
seg-13fc009b947c = FAQ

# text
seg-f5581b33ae89 = häufig gestellte Fragen

# text
seg-67d10fd4a4e0 = FCC

# text
seg-0a558c281968 = Federal Communications Commission

# text
seg-f6ade8c24d27 = FCNN

# text
seg-6098513947b8 = vollständig verbundenes neuronales Netz

# text
seg-1de7b4410369 = FD

# text
seg-4e73ff36d37f = finite Differenz

# text
seg-e43312a5fbbe = FDE

# text
seg-d6c9fb239b59 = Fehlererkennung und -ausschluss

# text
seg-8f9d11564223 = FES / FES2004

# text
seg-1a1cf1501056 = Finite Element Solution (die Ausgabe von { "2004" })

# text
seg-878b4a645ae9 = ein Modell der Meeresgezeiten

# text
seg-55c14f474a10 = FIM

# text
seg-b68c86e68570 = Fisher-Informationsmatrix

# text
seg-d39671724dfc = Fowler-Noll-Vo-Hash, Variante 1a

# text
seg-3354ad42f7dd = dient dazu, Referenzausgaben festzuschreiben

# text
seg-efca4decfec0 = FOC / IOV

# text
seg-793d96ab9856 = volle Betriebsfähigkeit / Validierung im Orbit

# text
seg-ce13cca7f222 = Satellitengenerationen (Galileo, Xona Pulsar)

# text
seg-58df7305e218 = FOV / IFOV

# text
seg-cafe1f8733ec = Sichtfeld / momentanes Sichtfeld

# text
seg-4f7168e895d2 = FPGA / MCU / RTOS

# text
seg-abde801ec70b = im Feld programmierbare Gatteranordnung / Mikrocontroller / Echtzeitbetriebssystem

# text
seg-a082e4570309 = FSL / FSPL

# text
seg-3a8ee2932a46 = Freiraumdämpfung / Freiraum-Pfaddämpfung

# text
seg-4535dadf79df = ITU-R P.525

# text
seg-c0209066dc76 = GB / KB / MB

# text
seg-184bb3d8b345 = Gigabyte / Kilobyte / Megabyte

# text
seg-8094e61fdd76 = GCRF

# text
seg-6c6337c7a855 = Geocentric Celestial Reference Frame

# text
seg-f050f2b8dee1 = GDAL

# text
seg-98b12fcceb01 = Geospatial Data Abstraction Library

# text
seg-1cef8718c772 = GEO

# text
seg-6131e4ea7858 = geostationärer Orbit

# text
seg-bf09433a7342 = GeoJSON

# text
seg-f8654e88af67 = Geographic JavaScript Object Notation

# text
seg-70dc52cd5059 = IETF RFC { "7946" }

# text
seg-bb8fbd2ebc28 = GG

# text
seg-b93ed4ab2b79 = Schweregradient

# text
seg-d8ef4d361e86 = wie im Schweregradienten-Moment

# text
seg-12fd4eb15c4d = GHz / kHz

# text
seg-0769cc8be024 = Gigahertz / Kilohertz

# text
seg-3946b69535e4 = GIM

# text
seg-ef5fc608b0e5 = globale Ionosphärenkarte

# text
seg-8cbbff1bc1d1 = GINS / KF-GINS

# text
seg-fbe37a571772 = GNSS/INS-Integration / der Datensatz und Code der Universität Wuhan für Kalman-Filter GNSS/INS

# text
seg-deca3cbe41ac = GIS

# text
seg-36275ece527d = Geoinformationssystem

# text
seg-ebe8194d12b3 = GIVE

# text
seg-6a99c12984b5 = vertikaler Ionosphärenfehler im Gitter

# text
seg-20a40777d78a = ein Begriff aus SBAS-Nachrichten

# text
seg-6fbfc5108833 = gLAB

# text
seg-1be22ebbedc3 = GNSS-Lab Tool

# text
seg-93b2c5b68af0 = eine von der ESA verbreitete Software-Suite zur Verarbeitung von GNSS-Daten

# text
seg-2aa0f3147ad5 = GLIBC

# text
seg-096e00cb9d9b = die GNU-C-Bibliothek

# text
seg-2630ae5f0bc5 = das russische globale Satellitennavigationssystem (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

# text
seg-361f1f18d454 = GLS

# text
seg-397d58b727ee = verallgemeinerte kleinste Quadrate

# text
seg-9bb2492e5d5d = GM

# text
seg-6bd8e46e9131 = Gravitationsparameter

# text
seg-e3a296392ac0 = die Gravitationskonstante mal der Masse eines Körpers

# text
seg-45a8f50bce06 = General Mission Analysis Tool

# text
seg-60d33e61b446 = NASA

# text
seg-1edd65c52f46 = Goddard Mars Model { "3" }

# text
seg-45abee95253b = ein Gravitationsfeld des Mars

# text
seg-558ea1e07042 = GMST

# text
seg-d3c4914f0d13 = mittlere Greenwich-Sternzeit

# text
seg-d853b1084a52 = GNC

# text
seg-34a9ddce3d5f = Führung, Navigation und Regelung

# text
seg-d33e343f6635 = GPOD

# text
seg-2ef6bb5a52fc = Grid Processing On Demand

# text
seg-14782f821cde = GR

# text
seg-762f364a05f3 = allgemeine Relativitätstheorie

# text
seg-3e3f45ad1178 = GRGM / GRGM660PRIM

# text
seg-948167f5f1c3 = die Mondgravitationsmodelle von GRAIL aus NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

# text
seg-220fae5cfc61 = Geodetic Reference System { "1980" }

# text
seg-bb3c2a337ae8 = GSD

# text
seg-691791646eb3 = Bodenauflösung (ground sample distance)

# text
seg-448d7036fefe = GSE

# text
seg-d05b88e7d5c5 = Bodenunterstützungsausrüstung

# text
seg-95d29f8138f9 = GSFC

# text
seg-2e1460089fed = Goddard Space Flight Center

# text
seg-7680e0663a5b = HDEV / OHDEV

# text
seg-1fd1e3322c86 = Hadamard-Abweichung / überlappende Hadamard-Abweichung

# text
seg-bb846135ceb4 = ein driftunempfindliches Stabilitätsmaß

# text
seg-0edc4eed2775 = HIL

# text
seg-956a26e1ff6d = Hardware in der Schleife

# text
seg-48523cdbbbf5 = HMI / MI

# text
seg-d77e079194df = gefährlich irreführende Information / irreführende Information

# text
seg-1cbf9d6f135d = Bereiche des Stanford-Diagramms

# text
seg-b320746fafa5 = HP

# text
seg-465a952272f3 = HTML

# text
seg-45a46390d3ba = HyperText Markup Language

# text
seg-25206f1161f0 = IAA RAS

# text
seg-1a4f063e3583 = Institute of Applied Astronomy der Russischen Akademie der Wissenschaften

# text
seg-9f434fdc21f2 = IAG

# text
seg-08fb84d2e01a = Internationale Assoziation für Geodäsie

# text
seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

# text
seg-01880debd7e0 = Internationale Assoziation für Geomagnetismus und Aeronomie / ihre Arbeitsgruppe V-MOD (Modellierung des Erdmagnetfelds)

# text
seg-28805f15bae8 = pflegt das IGRF

# text
seg-d4ce72152bf2 = IC

# text
seg-fa95c4e7fdc2 = Anfangsbedingung

# text
seg-e4c4373d0c76 = ICAO

# text
seg-2fccffbaf4dc = Internationale Zivilluftfahrt-Organisation

# text
seg-c2d2d459177d = ICD

# text
seg-a018300615e2 = Schnittstellenkontrolldokument

# text
seg-433b45040abd = wie im Galileo OS SIS ICD

# text
seg-5e1e49c5000e = ICGEM

# text
seg-c17be0db9e83 = International Centre for Global Earth Models

# text
seg-e9650a618b38 = ID

# text
seg-e40875ab1090 = Kennung (oder Identifikation, wie bei der Rauschtyp-ID)

# text
seg-c643488ba1ea = IEEE

# text
seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

# text
seg-91966e2931d4 = IETF / RFC

# text
seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

# text
seg-ce9375732735 = IF

# text
seg-746eae5ce367 = Zwischenfrequenz

# text
seg-ed568f55aa8f = Abtastwerte des Empfängers

# text
seg-cb4aaa2581bb = die IGS-Realisierung von ITRF2014

# text
seg-bfa8e6d5d0d1 = IGRF / IGRF14

# text
seg-55fed0afea05 = International Geomagnetic Reference Field

# text
seg-669611e731d0 = IGRF-14 (Datei IGRF14.shc) ist die 14. Generation

# text
seg-f7cf8ff44256 = IGSO

# text
seg-4833bd1e9c03 = geneigter geosynchroner Orbit

# text
seg-2080ff6f98fd = IIF

# text
seg-cf7a31e569cd = GPS Block II Follow-on

# text
seg-8a19be8033a9 = eine GPS-Satellitengeneration

# text
seg-68cc1c937ce9 = ILRS

# text
seg-53cc8d1f6824 = International Laser Ranging Service

# text
seg-fb5255ba4bc1 = ILS

# text
seg-b8af4d02e031 = ganzzahlige kleinste Quadrate

# text
seg-a214c483b8a8 = Auflösung der Mehrdeutigkeiten

# text
seg-4740fb9ef0b9 = IMCCE

# text
seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

# text
seg-22048a770612 = Pariser Observatorium; veröffentlicht INPOP

# text
seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, Version 21a

# text
seg-577acd29f11b = eine Planetenephemeride

# text
seg-cdb9ea77f5a6 = IOAG

# text
seg-87f308314cd4 = Interagency Operations Advisory Group

# text
seg-690414990ad8 = ION / ITM

# text
seg-b2fbe0c3507a = Institute of Navigation / ihr International Technical Meeting

# text
seg-53abad80634c = IoT

# text
seg-9b766d557bd1 = Internet der Dinge

# text
seg-1b41d114662e = IR

# text
seg-ff2d89b32d07 = Integritätsrisiko

# text
seg-2dc9fcadccd6 = die Wahrscheinlichkeit gefährlich irreführender Information

# text
seg-02aeac5e2435 = IRE

# text
seg-9c9c0011de8c = Institute of Radio Engineers

# text
seg-3fbae7e11fca = ein Vorgänger des IEEE

# text
seg-9e3d84279d56 = der Uhrenversatz zwischen zwei GNSS

# text
seg-2ffee4396fbd = ISL

# text
seg-505dee046f7a = Inter-Satelliten-Verbindung

# text
seg-010ea5a76e2e = ISM

# text
seg-330b25f923db = Integritäts-Stützungsnachricht

# text
seg-1f5a14efd417 = ARAIM

# text
seg-0ee7fcdaf5a9 = ISO

# text
seg-8c1341375f17 = Internationale Organisation für Normung

# text
seg-8291ac1ccba6 = ISO { "8601" } ist ihr Format für Datum und Uhrzeit

# text
seg-5b4dee02dccc = ITRF93 / ITRF2020

# text
seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

# text
seg-14dc2a58e2c3 = Funksektor der Internationalen Fernmeldeunion

# text
seg-0e8094e4d45c = ihre Empfehlungen der P-Serie modellieren die Ausbreitung

# text
seg-3e325d97365e = IVS

# text
seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

# text
seg-2dd00d470e14 = JD / MJD

# text
seg-107e6683f70d = Julianisches Datum / modifiziertes Julianisches Datum

# text
seg-996d4952554f = JMLR

# text
seg-a1ef35b98931 = Journal of Machine Learning Research

# text
seg-d370f89393c7 = JOSA

# text
seg-12c154fcd073 = Journal of the Optical Society of America

# text
seg-58fb16c8a046 = JRC / JRC122785

# text
seg-82f85268028f = Gemeinsame Forschungsstelle der Europäischen Kommission / eine ihrer Berichtsnummern

# text
seg-23f5be8ff49e = JS

# text
seg-516ee91e60c5 = JavaScript

# text
seg-02d421e784cd = JavaScript Object Notation

# text
seg-4da0210abab0 = JSTSP

# text
seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

# text
seg-919a951f3d02 = KF

# text
seg-436a208697f1 = Kalman-Filter

# text
seg-9c92e0bc42aa = KML

# text
seg-caf09d501881 = Keyhole Markup Language

# text
seg-ffe25881cef6 = ein OGC-Standard, den Google Earth liest

# text
seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

# text
seg-e1552da90a21 = Satzartkennungen des eigenen Textformats von Kshana für LEO-Navigationsnachrichten

# text
seg-3269a4e6b3e3 = eine Erweiterung von Kshana, kein Standard

# text
seg-b7f0168b6037 = KPI

# text
seg-a5ff89f0923d = Leistungskennzahl

# text
seg-1c4a7ccef434 = KSC

# text
seg-73a4bf4da46f = Kennedy Space Center

# text
seg-e401e5d923f0 = KVN

# text
seg-09f93b4d4d0b = Keyword = Value Notation

# text
seg-7379ade4ee0e = die Textform von CCSDS-Nachrichten

# text
seg-a24cf86216d0 = LANS

# text
seg-2ee81a2bc69b = Lunar Augmented Navigation Service

# text
seg-849e3161b64b = LAPACK

# text
seg-3b4f3c08a5ba = Linear Algebra PACKage

# text
seg-69cd99d2f937 = LCG

# text
seg-bcddea3df96d = linearer Kongruenzgenerator

# text
seg-8927ca404e64 = der Generator der Testreihe aus NIST SP { "1065" }

# text
seg-0b9b908055cf = LCNS

# text
seg-f9200a1b7246 = Lunar Communications and Navigation Services

# text
seg-5253cae4b05b = der Dienst Moonlight der ESA

# text
seg-2361aef1e2e3 = LCRNS

# text
seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

# text
seg-8fc87d3026e5 = LFSR

# text
seg-bfecf2f88f17 = rückgekoppeltes Schieberegister

# text
seg-5b09c8e3f127 = Erzeugung von Spreizcodes

# text
seg-944b45f65820 = LGPL

# text
seg-1e1bf7d7dc79 = GNU Lesser General Public License

# text
seg-0d4d5316b1d8 = LIL

# text
seg-6d040101c6fa = Gesetz vom iterierten Logarithmus

# text
seg-e48d4b1feeaf = LLI / SSI

# text
seg-81ace10136b6 = Indikator für Verriegelungsverlust / Indikator für Signalstärke

# text
seg-7d95179a5a1f = RINEX-Beobachtungsflags

# text
seg-2ac0ebb389e7 = LLR

# text
seg-29bcbb78931b = Laserentfernungsmessung zum Mond

# text
seg-20deda97c876 = LLVM

# text
seg-5a84a3219546 = die Compiler-Infrastruktur LLVM (ursprünglich Low Level Virtual Machine)

# text
seg-277ed5c4cbcc = LNAV

# text
seg-d2fa9c420999 = ältere Navigationsnachricht

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-6379745571a9 = LNCSS

# text
seg-b8c48f2bfaf0 = Satellitensystem für Navigation und Kommunikation am Mond

# text
seg-4ce3c0ea7a31 = die Fallstudien zu Konstellationen in NAVIGATION { "70" }({ "4" }), navi.613

# text
seg-b13c5776e35b = LNIS

# text
seg-7c67c5753d20 = LunaNet Interoperability Specification

# text
seg-881578d31056 = LNSS

# text
seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

# text
seg-97ff1706b4bd = eine vorgeschlagene Mondkonstellation

# text
seg-ec733de1adc5 = LPV / LPV-200

# text
seg-40d72ae4bc9a = Localiser Performance with Vertical guidance / seine Kategorie mit { "200" } ft Entscheidungshöhe

# text
seg-090ba62634a8 = Anflug in der Luftfahrt

# text
seg-b4921e83ddc9 = LRO

# text
seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

# text
seg-8f782bde5659 = LS

# text
seg-c5bc49526464 = Schaltsekunden

# text
seg-54ea05b82cb4 = wie in Δt_LS

# text
seg-15111a93c6d7 = LT

# text
seg-35231d8b9b39 = Lichtlaufzeit

# text
seg-4729314afd46 = LTE

# text
seg-1a7e158f020f = Long-Term Evolution

# text
seg-3c1b3acc46d9 = der 4G-Mobilfunkstandard

# text
seg-3530cdaca137 = LU

# text
seg-58ad64b9d450 = Zerlegung in untere und obere Dreiecksmatrix (lower–upper)

# text
seg-ef1a45eba6aa = LuGRE

# text
seg-72ec36312101 = Lunar GNSS Receiver Experiment

# text
seg-84874825a5d1 = flog { "2025" } zum Mond

# text
seg-e6719690faa2 = LuPNT

# text
seg-be19fb902b36 = die Mond-PNT-Bibliothek von Stanford

# text
seg-893ba320da76 = ein Name

# text
seg-fc68b2fb9529 = MAAST

# text
seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

# text
seg-a24b3840d248 = Stanford

# text
seg-71063143c8be = MAIT

# text
seg-2d7aa60c26ba = Fertigung, Montage, Integration und Test

# text
seg-0397322eae11 = MAR099 / JUP365 / SAT441

# text
seg-bd57191f860b = Lösungen des JPL für die Satellitenephemeriden der Monde von Mars, Jupiter und Saturn

# text
seg-9b0688bfc31e = Kennungen

# text
seg-a8748c38de15 = MASPS

# text
seg-e25a3738b952 = Mindestanforderungen an die Leistung von Luftfahrtsystemen

# text
seg-16a3c8f74c1c = MATLAB

# text
seg-bebc110fded7 = MATrix LABoratory

# text
seg-e722ea781fdf = ein Produkt für numerisches Rechnen

# text
seg-7c03fb6e56f6 = MAUT

# text
seg-e409f72ac9ab = multiattributive Nutzentheorie

# text
seg-4a29ddd9b24e = MC

# text
seg-19a7ad528cf3 = MCD

# text
seg-202b82bfefcf = Mars Climate Database

# text
seg-371da1e857e8 = MCDA

# text
seg-17d89019fd4a = Entscheidungsanalyse mit mehreren Kriterien

# text
seg-b522fc3d6c82 = MCI / MCMF

# text
seg-f5544acf642a = mondzentriert inertial / mondzentriert, mondfest

# text
seg-f7b59f61da60 = MDB

# text
seg-0c674a59d087 = minimal erkennbarer Bias

# text
seg-c769430226c3 = MDEV

# text
seg-33a4628c6e67 = modifizierte Allan-Abweichung

# text
seg-bde3f0e5dfa7 = MEMS

# text
seg-8b08f307de8a = mikroelektromechanische Systeme

# text
seg-c960c0e048b7 = MeO / MLRO

# text
seg-48623f76be86 = MéO (Métrologie Optique), die Laserstation in Grasse / Matera Laser Ranging Observatory

# text
seg-a8fcbefbbf4c = Stationen für Laserentfernungsmessung zum Mond

# text
seg-8b597c678c3f = ME / PA

# text
seg-cb56efe2fb70 = mittlere Erde / Hauptachsen

# text
seg-f30f1a2778cf = die beiden mondfesten Bezugssysteme (MOON_ME, MOON_PA)

# text
seg-308d4c93a8a3 = MGEX

# text
seg-b2b632cd52d2 = Multi-GNSS Experiment

# text
seg-86fd2d84ed21 = IGS

# text
seg-79f8412f30f2 = MIT

# text
seg-70012b81c998 = Massachusetts Institute of Technology

# text
seg-e9d7062835a9 = wie in der MIT-Lizenz

# text
seg-a0b70e8c4c38 = MLP

# text
seg-77abd5634603 = mehrschichtiges Perzeptron

# text
seg-6975432180f6 = ein kleines neuronales Netz

# text
seg-a4be7b1d83e3 = MOD / TOD

# text
seg-421b9611e897 = mittlere Lage des Datums / wahre Lage des Datums

# text
seg-1af66f9b771d = Bezugssysteme aus Äquator und Äquinoktium

# text
seg-b5db821f8008 = MOORA

# text
seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

# text
seg-d26a24b5d9f0 = MOPS

# text
seg-e8707522cf5f = Mindestanforderungen an die Betriebsleistung

# text
seg-cd0720a78dbb = MPL

# text
seg-bcdaf8567381 = Mozilla Public License

# text
seg-0f45b55420be = MRO110 / MRO110B2

# text
seg-61415a003e40 = Gravitationsmodelle { "110" } und 110B2 des Mars Reconnaissance Orbiter

# text
seg-8404f70361e7 = MSRV

# text
seg-26a6a79755f9 = minimal unterstützte Rust-Version

# text
seg-959fe8ad53df = MTF

# text
seg-70d61ab4eb42 = Modulationsübertragungsfunktion

# text
seg-7f60d1ac40ad = optische Bildgebung

# text
seg-8598e499c145 = MVDR

# text
seg-c767dc9ae21a = verzerrungsfreie Antwort mit minimaler Varianz

# text
seg-83f57219e5b7 = adaptive Strahlformung

# text
seg-e1ee50b3ea0a = MWL

# text
seg-12d9510328d2 = Mikrowellenverbindung

# text
seg-639266912f59 = die Zeitübertragungsverbindung von ACES

# text
seg-5ac07401e4f8 = NaN

# text
seg-722d679807ee = keine Zahl (not a number)

# text
seg-0e4abc653325 = NavIC

# text
seg-355821380384 = Navigation with Indian Constellation

# text
seg-fc13b86a8365 = NAVISP

# text
seg-2eb6cc573946 = Navigation Innovation and Support Programme

# text
seg-b518d44847fa = NAV / OBS

# text
seg-c6965d4d7202 = Navigation (Nachricht) / Beobachtung

# text
seg-1729ddf0eafa = die beiden RINEX-Dateitypen; das NAV Lab in Stanford ist das Navigation and Autonomous Vehicles Laboratory

# text
seg-f239334e4928 = NBS / NBS14

# text
seg-c8e5edff04d7 = das frühere National Bureau of Standards der USA / der Referenzdatensatz NBS14 zur Frequenzstabilität

# text
seg-3d1ac5146fea = dient zur Prüfung von Allan-Schätzern

# text
seg-37879f5ad9e0 = NEES / NIS

# text
seg-9610f0449fb2 = normiertes Quadrat des Schätzfehlers / normiertes Quadrat der Innovation

# text
seg-af167a77a1dc = Konsistenztests von Filtern

# text
seg-beb7a86721ec = National Geospatial-Intelligence Agency

# text
seg-7aa223cbfe13 = NGS / NOAA

# text
seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

# text
seg-4a1040c5f2fa = NIMA / TR8350

# text
seg-4cf62b739fc6 = National Imagery and Mapping Agency / ihr technischer Bericht TR8350.2 (die Definition von WGS { "84" })

# text
seg-ffa6025b5a70 = NIMA ist der frühere Name der NGA

# text
seg-af4be907e56c = NLOS

# text
seg-22ab7d58324b = ein nur reflektiertes Signal

# text
seg-9887902c13a1 = NNLS

# text
seg-b4cb6d6bfce4 = nichtnegative kleinste Quadrate

# text
seg-af8ca8550600 = NORAD

# text
seg-07428e7224cf = North American Aerospace Defense Command

# text
seg-4edb033e3432 = führt den öffentlichen Satellitenkatalog

# text
seg-dd984e16dbcd = NP

# text
seg-f92816d7c936 = Neyman-Pearson

# text
seg-fc214695fa83 = Detektionstheorie

# text
seg-3ef8006482bb = NPA

# text
seg-81a072ee0520 = Nichtpräzisionsanflug

# text
seg-b9fd2cf6a2b9 = Luftfahrt

# text
seg-e6cb557ee6d1 = NPB

# text
seg-18510a95b308 = Nutation-Präzession-Bias

# text
seg-b4562efbafdf = die Matrix IAU 2006/2000A

# text
seg-c5d8932f6956 = NRL / NRLMSISE-00

# text
seg-9c9f5eac83b2 = Naval Research Laboratory / sein Atmosphärenmodell Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

# text
seg-bf373b9cd0c6 = NTN

# text
seg-0ae939342934 = nichtterrestrisches Netz

# text
seg-1ae0305d8455 = 5G von Satelliten

# text
seg-20b98c32226f = NTRS

# text
seg-1470d2af037a = NASA Technical Reports Server

# text
seg-243d375db224 = OC-0 … OC-13

# text
seg-d36b43dd505c = Kennungen für Überbehauptungen

# text
seg-47ba87f3730b = Zeilen von CLAIMS-VS-REALITY.md

# text
seg-e0689f1fc932 = OCI

# text
seg-1a3377171d89 = Open Container Initiative

# text
seg-b5bf07ed6c8c = Format für Container-Images

# text
seg-7b56c21cca93 = ODE / SDE

# text
seg-722bdf2ca73a = gewöhnliche / stochastische Differentialgleichung

# text
seg-a4da10cb1150 = ODM

# text
seg-b1c25bfe0612 = Bahndatennachrichten

# text
seg-35fe6a2f3de3 = die CCSDS-Familie, zu der OEM und OMM gehören

# text
seg-c06d6aa8ba3a = OGC

# text
seg-eb1feb23de1c = Open Geospatial Consortium

# text
seg-9737495b035c = OLS / WLS

# text
seg-63bf35c31a6a = gewöhnliche / gewichtete kleinste Quadrate

# text
seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

# text
seg-4be3f4155fc8 = der Satellit der ESA als Softwarelabor im Orbit / sein Datensatz zur Anomalieerkennung

# text
seg-14b642ea59e1 = OSIP

# text
seg-4871060090a0 = Open Space Innovation Platform

# text
seg-251b3ff3eb9b = OSNMA / TESLA

# text
seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

# text
seg-95b6b14facf1 = Signalauthentifizierung bei Galileo

# text
seg-501a89e8b32b = OS / OSes

# text
seg-5a526cda4166 = Open Service (Galileo, BeiDou) oder Betriebssystem(e)

# text
seg-6db10af375e3 = der Zusammenhang sagt, was gemeint ist

# text
seg-584a7e7d4f5e = OU

# text
seg-937187abcdf6 = Ornstein-Uhlenbeck

# text
seg-9be9042ec983 = ein zum Mittelwert zurückkehrender Rauschprozess

# text
seg-08c583f40405 = PA

# text
seg-9a24d9f45aa4 = Produktsicherung (auch Präzisionsanflug, wie in K_H,PA)

# text
seg-65ad442b3faa = PCK

# text
seg-c788fe80678e = Kernel für Planetenkonstanten

# text
seg-46a00fdc9d5b = SPICE

# text
seg-417a52c9c154 = PDF

# text
seg-c462c83b47df = Portable Document Format

# text
seg-98aa544ec4de = Pd / Pfa

# text
seg-0c89f304435e = Detektionswahrscheinlichkeit / Falschalarmwahrscheinlichkeit

# text
seg-5bde4fd55ead = PEF

# text
seg-eb11dcb816ff = das Bezugssystem zwischen TEME und ITRF

# text
seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

# text
seg-47cc346307a6 = Satellitenkennungen: eine SP3-Bezeichnung eines GPS-Satelliten, eine SBAS-Pseudozufallscode-Nummer, ein Galileo-Satellitenname

# text
seg-6ad2383f8545 = PHARAO

# text
seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

# text
seg-302c8cb738ac = die Caesium-Uhr von ACES

# text
seg-2e823cd9d9a6 = PL

# text
seg-099bd07ef3cf = Schutzniveau

# text
seg-7d7eaa5eb223 = PLL

# text
seg-9272ad22c094 = Phasenregelschleife

# text
seg-80e051b734dd = PMC / PMC10301026

# text
seg-1f2a21c5e09f = PubMed Central / eine ihrer Artikelkennungen

# text
seg-3e4617444a63 = PM / FM

# text
seg-c79b1246fb61 = Phasenmodulation / Frequenzmodulation

# text
seg-279251adb2eb = Rauschen auf der Phase oder auf der Frequenz einer Uhr

# text
seg-685fc49957e2 = PN

# text
seg-209dacf76ff3 = wie bei der PN-Entfernungsmessung

# text
seg-f9cfe4e70f9a = PNG

# text
seg-bde68df8ee7e = Portable Network Graphics

# text
seg-06998de7b6be = POD

# text
seg-178f55858efb = präzise Bahnbestimmung

# text
seg-b7919977bf20 = PPN

# text
seg-ed81960f1282 = parametrisiert postnewtonsch

# text
seg-9683f98bec2d = PPP / RTK / SPP

# text
seg-73d777100ecd = präzise Punktpositionierung / kinematisch in Echtzeit / Einzelpunktpositionierung

# text
seg-edb97cd7ef8b = PPS

# text
seg-197b06571b4d = Puls pro Sekunde

# text
seg-2619e854281a = PR

# text
seg-66c53cdfc3d9 = Pull Request

# text
seg-e4dd8a3101cb = PRN

# text
seg-6fb1378e889a = Pseudozufallsrauschen (Codenummer)

# text
seg-6f384580af80 = wie GNSS-Satelliten in Signalen benannt werden

# text
seg-e8ca48eb958b = PROMETHEE

# text
seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

# text
seg-d92234e26d53 = PRX

# text
seg-c5774fede0a9 = Physical Review X

# text
seg-8687e6badb6b = eine Fachzeitschrift

# text
seg-78a947083d45 = PSD

# text
seg-6eb799bd1582 = spektrale Leistungsdichte

# text
seg-ab1af8b3d968 = siehe oben

# text
seg-f7c4f1cff2a4 = PS / SPS

# text
seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

# text
seg-2800b3a8cd2e = das GPS SPS PS

# text
seg-c8aa5ca0a4ea = PTB

# text
seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

# text
seg-611e7e4a34f4 = das nationale Metrologieinstitut Deutschlands

# text
seg-2d4bc9f59158 = PTP

# text
seg-6291d09d3a93 = Precision Time Protocol

# text
seg-44a14eeae3dd = IEEE { "1588" }

# text
seg-bc4ad791804e = PVT

# text
seg-1939c4e19702 = Position, Geschwindigkeit und Zeit

# text
seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

# text
seg-95cead42b0d0 = die Rust-Python-Anbindungsbibliothek / Python Packaging Authority / Python Package Index

# text
seg-96b2c707a6b8 = Parametry Zemli { "1990" }

# text
seg-3d5012a62544 = das geodätische Datum von GLONASS

# text
seg-9d14fb150c09 = QA

# text
seg-582cb8ea13ac = Qualitätssicherung

# text
seg-7025be647972 = QEMU

# text
seg-d2209c7eea42 = Quick Emulator

# text
seg-d23b9bd48594 = QPSK

# text
seg-45db179e8e49 = Quadratur-Phasenumtastung

# text
seg-b6d487bd53ed = QZSS

# text
seg-c0484340bc52 = Quasi-Zenith Satellite System

# text
seg-531943b17837 = Japan

# text
seg-697c55525b36 = RAAN

# text
seg-85cd6997e07e = Rektaszension des aufsteigenden Knotens

# text
seg-79e641db1aae = RAFS

# text
seg-9fa6a6b0e193 = RDRR

# text
seg-19b00c5b9270 = Resist–Detect–Respond–Recover (widerstehen, erkennen, reagieren, wiederherstellen)

# text
seg-76da7c5bf39a = das Resilienzmodell von RethinkPNT/Firesmith

# text
seg-7bb5ed20c788 = RF

# text
seg-35b036272c8e = Hochfrequenz

# text
seg-404104795160 = RHEL

# text
seg-dd1bb2300eb5 = Red Hat Enterprise Linux

# text
seg-34b1e77b1ff0 = RHS

# text
seg-0b4bdbcd1476 = rechte Seite

# text
seg-f801cff658be = RMS / RSS

# text
seg-6b758beecbfc = quadratischer Mittelwert / Wurzel aus der Quadratsumme

# text
seg-8b2bd83256f1 = RNG

# text
seg-b90957003307 = Zufallszahlengenerator

# text
seg-354b42e3a5d0 = RNTF

# text
seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

# text
seg-43d17f884c69 = ROI

# text
seg-597432415e53 = Kapitalrendite

# text
seg-7abb945359d0 = RPCF

# text
seg-8c71df162ddd = Resilient PNT Conformance Framework

# text
seg-2f030c1d70c1 = US DHS

# text
seg-82b81c1e28d6 = RTCM

# text
seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

# text
seg-4a7703f1b605 = ihr Nachrichtenstandard trägt CRC-24Q

# text
seg-520c91fa0ef0 = eine quelloffene Bibliothek zur GNSS-Positionierung (Bibliothek für kinematische Echtzeit-Positionierung)

# text
seg-a8b2e577e381 = RTN

# text
seg-6ddf35119d08 = radial, transversal, normal

# text
seg-b1b635ff08e4 = ein bahnfestes Bezugssystem

# text
seg-04f4b26e9283 = RW

# text
seg-b8b1a31739aa = Random Walk

# text
seg-8b593d7d5dbd = wie beim Bias-Random-Walk

# text
seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

# text
seg-928fe3abcd5b = Random-Walk-, weiße und Flicker-Frequenzmodulation / weiße und Flicker-Phasenmodulation

# text
seg-7fced178bcc5 = die Potenzgesetz-Rauschtypen von Uhren

# text
seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

# text
seg-0c397d845610 = Produktnamen von Microchip (zwei chipgroße Atomuhren, ein ofengeregelter Quarzoszillator)

# text
seg-8a1ae00c4a52 = Namen, keine Abkürzungen

# text
seg-a58426a850fd = SD

# text
seg-d46cb77d53f6 = Standardabweichung

# text
seg-e29dd726165f = SDD

# text
seg-0ebb68e4b6fd = Service Definition Document

# text
seg-9415da7a79ab = wie im Galileo OS SDD

# text
seg-1022626b788c = SDK

# text
seg-2076da4dd4dd = Software-Entwicklungskit

# text
seg-9fb492bced01 = SDR

# text
seg-1a1082059103 = softwaredefiniertes Funkgerät

# text
seg-0a647acd4355 = SDS

# text
seg-d0f6ae60b687 = Space Defense Squadron

# text
seg-c3f6fc1456ed = die 18th SDS führt den Satellitenkatalog der USA

# text
seg-cf28e3e14401 = SEP

# text
seg-a67fb04e0911 = Sonne-Erde-Sonde-Winkel (auch wahrscheinlicher sphärischer Fehler)

# text
seg-0c7631f367e8 = SGD

# text
seg-d58ce1e25c08 = stochastisches Gradientenverfahren

# text
seg-2f25205204e4 = SHM

# text
seg-f2e2253a31b3 = einfache harmonische Bewegung

# text
seg-b0973ab206ed = SI

# text
seg-35624e5e4630 = Internationales Einheitensystem

# text
seg-02aa435dc884 = SIB

# text
seg-262a811c8b69 = Safety Information Bulletin

# text
seg-b9ee445609f5 = EASA; EASA ist die Agentur der Europäischen Union für Flugsicherheit

# text
seg-8d6d4fe3d155 = SINEX

# text
seg-e5c071685532 = Solution INdependent EXchange format

# text
seg-3466519e4c62 = geodätische Lösungen

# text
seg-b21a3d7fb59d = SIR

# text
seg-303809c700e2 = Resampling mit Wichtigkeitsstichprobe

# text
seg-7a2e0e9cac08 = ein Partikelfilter

# text
seg-6da637028ef8 = SIS / SISA

# text
seg-9779a20e50d2 = Signal im Raum / Genauigkeit des Signals im Raum

# text
seg-c0e9f44b333d = SITAN

# text
seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

# text
seg-ceee87dd4b5e = SLR

# text
seg-c8e722f1609c = Laserentfernungsmessung zu Satelliten

# text
seg-76d80b0d2deb = SMAD

# text
seg-7fbda47e3858 = Space Mission Analysis and Design

# text
seg-dfc105c0178b = das Lehrbuch

# text
seg-5278559437c5 = SNR

# text
seg-b97c29ce3b37 = Signal-Rausch-Verhältnis

# text
seg-ff2faf259a15 = SOS / SSE

# text
seg-5a2e327af384 = Quadratsumme / Summe der quadrierten Residuen

# text
seg-453c4506fd59 = SOTA

# text
seg-7eaa0caa6916 = Stand der Technik

# text
seg-127e73a3610b = NIST Special Publication { "1065" }

# text
seg-bedc9a3d8d9f = dasselbe Dokument wie NIST SP { "1065" }

# text
seg-cf2491c1a488 = SPD / PD

# text
seg-eade81634bf5 = symmetrisch positiv definit / positiv definit

# text
seg-5fedf0f7b5c0 = SPDX

# text
seg-3aba3c5a5c19 = Software Package Data Exchange

# text
seg-c10b1f20f37e = die Lizenzkennungen in Dateiköpfen

# text
seg-b377a91a047f = SPK

# text
seg-5603642c612d = SPICE-Kernel für Ephemeriden von Raumfahrzeugen und Planeten

# text
seg-cf18ba9c86d8 = SPOF

# text
seg-cfab8d8a2cdf = einzelne Fehlerstelle

# text
seg-c06f64211c40 = SQM

# text
seg-7e58d6a4a92c = Überwachung der Signalqualität

# text
seg-a4e75468e6f9 = spoofing-Prüfungen über die Korrelatorform

# text
seg-0bb7a4875914 = SRIF

# text
seg-82da1a1f1be4 = Wurzel-Informationsfilter

# text
seg-970edb8ec42f = SRP

# text
seg-ae097fbdabf9 = Strahlungsdruck der Sonne

# text
seg-edc814ba451b = SRTM / SRTMHGT

# text
seg-b756bc93d2ea = Shuttle Radar Topography Mission / ihr Format für Höhendateien

# text
seg-4692354a98de = Kacheln werden nach ihrer südwestlichen Ecke benannt, zum Beispiel N36W117

# text
seg-00f36f1678d6 = SSD

# text
seg-532285d8e6ce = Solar System Dynamics

# text
seg-1d8167212f57 = die Gruppe des JPL

# text
seg-d21315ea8c52 = STEC

# text
seg-84689b829867 = Gesamtelektronengehalt entlang der Schrägstrecke

# text
seg-eabee4bfb30e = Systems Tool Kit

# text
seg-a7ff60ab0bd9 = ein Produkt zur Missionsanalyse

# text
seg-17d792c12885 = der Positionierungs- und Zeitdienst von Iridium

# text
seg-3efaadad9c96 = STM

# text
seg-da395fa674ec = Zustandsübergangsmatrix

# text
seg-d116578b987b = SV

# text
seg-caa37a1e7d12 = Raumfahrzeug (ein Satellit)

# text
seg-845e6f3a37ec = SVD

# text
seg-e775c436db4b = Singulärwertzerlegung

# text
seg-3e5561868a7f = Scalable Vector Graphics

# text
seg-4c48f567e37c = TAES

# text
seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

# text
seg-39b93d9b401a = TC / TM

# text
seg-b0df03cff98a = Fernbefehl / Telemetrie

# text
seg-fafb84a9796a = TDD

# text
seg-ec3b92ad43c3 = testgetriebene Entwicklung

# text
seg-40defa915d0d = TDOA / FDOA

# text
seg-e7db8768b023 = Laufzeitdifferenz / Frequenzdifferenz der Ankunft

# text
seg-aecac9c9d2d0 = passive Ortung von Sendern

# text
seg-01861b3d63bf = TERCOM

# text
seg-9ef3f9cbbe77 = Abgleich von Geländekonturen

# text
seg-5da9ae904ae0 = TEXBAT

# text
seg-e90183a6fc69 = Texas Spoofing Test Battery

# text
seg-941eccec7400 = aufgezeichnete GNSS-spoofing-Daten (OAKBAT ist ein Datensatz derselben Klasse)

# text
seg-e71c15afe44e = TIE

# text
seg-19bfea0d5c88 = Zeitintervallfehler

# text
seg-eb12660210bd = TIES

# text
seg-9335f08b6381 = Telecommunication Information Exchange Service

# text
seg-12f4af2b48c1 = Konten von Mitgliedern der ITU

# text
seg-c05ba396ac1e = ToA

# text
seg-78a41e672189 = Ankunftszeit

# text
seg-7d821e75fdf7 = TOL

# text
seg-4c7600f40479 = Toleranz

# text
seg-1f8b3be77dcc = TOPSIS

# text
seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

# text
seg-c9a6058c9715 = TOTDEV / TOTVAR

# text
seg-53a19d838c2d = Gesamtabweichung / Gesamtvarianz

# text
seg-7350da5c5c30 = Stabilitätsschätzer mit erweitertem Bereich

# text
seg-91d2f49dc7c0 = TPAMI

# text
seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

# text
seg-85692b01a12d = TPL

# text
seg-123ed92776a3 = Zeitschutzniveau

# text
seg-10c9563602b7 = siehe SLOT-TIMING.md

# text
seg-d1e3f93bc0aa = TPS

# text
seg-579b1467ca5f = Hitzeschutzsystem

# text
seg-3b7fe44cc552 = TRN

# text
seg-5239a432b919 = geländebezogene Navigation

# text
seg-1df3bcf7eb97 = TR / TN

# text
seg-ef0ff09dc412 = technischer Bericht / technische Notiz

# text
seg-643fa447bcee = TU Delft

# text
seg-5c5492ecd86f = Technische Universität Delft

# text
seg-f3f22590bc57 = TWSTFT / TWTFT

# text
seg-28c80c27a136 = Zwei-Wege-Zeit- und Frequenzübertragung über Satelliten / Zwei-Wege-Zeit- und Frequenzübertragung

# text
seg-e1a149ff6c43 = UBX

# text
seg-fa0e9838530e = das binäre Empfängerprotokoll von u-blox

# text
seg-9555546fed38 = UDRE

# text
seg-5fd7aec5beda = Restfehler der differentiellen Entfernung für den Nutzer

# text
seg-a3f5dda611b0 = SBAS

# text
seg-b6f0baa6e478 = UERE

# text
seg-4d1cb1c3ade9 = nutzeräquivalenter Entfernungsfehler

# text
seg-7d87e82154ed = UFFC

# text
seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

# text
seg-f4da31f92a79 = eine IEEE Transactions

# text
seg-573db7b5995b = { "300" } MHz bis { "3" } GHz

# text
seg-3688c8d84cdc = UI / UX

# text
seg-42162760360f = Benutzeroberfläche / Nutzererlebnis

# text
seg-7a56f7e38c5a = ULA

# text
seg-4f4d9da7855c = gleichmäßiges lineares Antennenfeld

# text
seg-db65f4a7586d = ULP

# text
seg-ae7458813685 = Einheit der letzten Stelle

# text
seg-d7f4df5a9d13 = Genauigkeit von Gleitkommazahlen

# text
seg-81dc0f4f1b2c = URA / URE

# text
seg-c92cbc3e3954 = Genauigkeit der Nutzerentfernung / Nutzer-Entfernungsfehler

# text
seg-17e8fb142c6c = URA begrenzt für die Integrität, URE ist der RMS der Genauigkeit

# text
seg-1e02dfc0a52b = URL

# text
seg-f726bcd9d4ad = einheitlicher Ressourcenzeiger

# text
seg-088e05d67af1 = USGS

# text
seg-ffed8eca324d = United States Geological Survey

# text
seg-1ded2eb40061 = USNO

# text
seg-2b5f7bbe22e9 = United States Naval Observatory

# text
seg-39ed84639c60 = USO

# text
seg-f9f684640e53 = ultrastabiler Oszillator

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-ba97a4005ee8 = VIKOR

# text
seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (Optimierung mit mehreren Kriterien und Kompromisslösung)

# text
seg-7fe170288e4e = Interferometrie mit sehr langer Basislinie

# text
seg-2e95d53160df = WAAS / EGNOS

# text
seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

# text
seg-1746693259e0 = SBAS; siehe oben

# text
seg-98f4f946a7ac = WASM

# text
seg-257c477dc510 = WebAssembly

# text
seg-eaf260aa0e21 = WASPAS

# text
seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

# text
seg-c9710476b8b5 = Working Group C der Zusammenarbeit zwischen der Europäischen Union und den Vereinigten Staaten bei der Satellitennavigation

# text
seg-79f0e87410bf = veröffentlicht die Referenzdokumente zu ARAIM

# text
seg-199e55106e0f = WGCCRE

# text
seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

# text
seg-d1939d914701 = WGN

# text
seg-6bbc3adc6a53 = weißes gaußsches Rauschen

# text
seg-1e422c9001d4 = WGS72 / WGS84

# text
seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

# text
seg-5964aa61f847 = SGP4 verwendet Konstanten von WGS72

# text
seg-f4ea25131d04 = WHU

# text
seg-7d30c759d92f = Universität Wuhan

# text
seg-5d028f5e2120 = WSM / WPM

# text
seg-ce407535733f = Modell der gewichteten Summe / Modell des gewichteten Produkts

# text
seg-cc68c85bb2b9 = Aggregation über mehrere Kriterien (WPM bedeutet auch weiße Phasenmodulation; der Zusammenhang sagt, was gemeint ist)

# text
seg-9041c866d202 = XML

# text
seg-0e55c3adc568 = Extensible Markup Language

# text
seg-93e0e8702167 = XOR

# text
seg-cfa3197f8c1d = ausschließendes Oder

# text
seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

# text
seg-195082605699 = die Komponenten des Erdmagnetfelds: Nord, Ost, Unten, Gesamtintensität; Deklination, Inklination

# text
seg-94835748fcbb = YAGNI

# text
seg-76430d755d74 = you aren't gonna need it (du wirst es nicht brauchen)

# text
seg-e4e177088376 = ein Entwurfsprinzip

# text
seg-565c1908393c = ZHD

# text
seg-77a0948bc15d = hydrostatische Verzögerung im Zenit

# text
seg-749be52554c5 = Reproduzierbarkeit & Lizenzierung

# text
# c1: scenario + seed + version → identical result
seg-d78d9bbb905c = <b>Reproduzierbar (deterministisch).</b> Dieselbe Eingabe liefert immer bitgenau dieselbe Ausgabe — <c1/>. Kein versteckter Zufall.

# text
seg-1412347e2298 = <b>Seed.</b> Die Zahl, die den (deterministischen) Zufallsgenerator initialisiert, damit Läufe wiederholbar sind.

# text
seg-3a35740e04a8 = <b>Open Core.</b> Das Geschäftsmodell: Die Engine ist frei und quelloffen (AGPL-3.0, die unten definierte GNU Affero General Public License; zusätzlich kommerziell doppelt lizenziert); das tragende Geschäft sind Support, Integration, kommerzielle Lizenzen und proprietäre Erweiterungen — keine Platzgebühren für die offene Engine.

# text
seg-8ea21ebded3c = <b>AGPL-3.0.</b> Die GNU Affero General Public License v3 — eine von der OSI (Open Source Initiative) anerkannte, starke Copyleft-Open-Source-Lizenz. Wie die GPL (GNU General Public License), aber mit einer zusätzlichen Klausel (§{ "13" }) für Software, die Nutzern <b>über ein Netz</b> angeboten wird: Eine geänderte Version, die über ein Netz erreichbar ist, muss diesen Nutzern ihren zugehörigen Quelltext anbieten. Die offene Lizenz von Kshana.

# text
# c1: LICENSING.md
seg-f87860d8197d = <b>Doppellizenzierung.</b> Denselben Code unter zwei Lizenzen anbieten, sodass Nutzer wählen: hier die AGPL-3.0 (offen, Copyleft) <b>oder</b> eine kommerzielle Lizenz von Ashforde OÜ (einer estnischen Gesellschaft mit beschränkter Haftung; OÜ = osaühing) für proprietäre/geschlossene Nutzung, für die die AGPL nicht passt. Siehe <c1/>.

# text
seg-dd5f4a1bbbf5 = Auch auf kshana.dev verwendet

# text
seg-9d0c42560a90 = Abkürzungen, die die Website verwendet und die nicht im Glossar des Repositorys oben stehen.

# text
seg-67a54ce8c89e = Global Positioning System

# text
seg-814b0d29bbb2 = Träger-Rausch-Leistungsdichte, in dB-Hz

# text
seg-f22a269bc575 = das Funkband von { "1" } bis { "2" } GHz, das GNSS verwendet

# text
seg-1f4360a0405c = Grob-/Erfassungscode von GPS L1

# text
seg-6f7910207534 = Augmented Forward Signal (Mond)

# text
seg-74f02864ce32 = mikroelektromechanische Systeme

# text
seg-0f931242ecc0 = UAS

# text
seg-dddfd223a3b1 = unbemanntes Luftfahrtsystem

# text
seg-7091aabf8b6d = PL · AL

# text
seg-12d88ab45197 = Schutzniveau · Alarmgrenze

# text
seg-78134bcc48da = Anflug mit vertikaler Führung, Stufe I

# text
seg-27328b36b476 = LEO · GEO

# text
seg-b1ae7014a663 = niedriger Erdorbit · geostationärer Orbit

# text
seg-c1d933dd3965 = OEM · OMM · TDM

# text
seg-5d0ebe2bc51c = CCSDS-Nachrichten für Bahnephemeriden, mittlere Bahnelemente und Verfolgungsdaten

# text
seg-fa9240660ec4 = IGRF

# text
seg-c19fd59fdca0 = DSN

# text
seg-7979317c75d2 = Deep Space Network

# text
seg-c194401c2039 = TCXO · OCXO

# text
seg-5c9d0b4c561d = temperaturkompensierter · ofengeregelter Quarzoszillator

# text
seg-f3a7cc221b63 = PHM

# text
seg-08d5cfc5b460 = passiver Wasserstoff-Maser

# text
seg-5ed928b1c6d0 = USO · DSAC

# text
seg-b77f2ea4a521 = ultrastabiler Oszillator · Deep Space Atomic Clock

# text
seg-553814463110 = MTIE · TDEV

# text
seg-2d9b8af50414 = maximaler Zeitintervallfehler · Zeitabweichung

# text
seg-5b155b60152f = PRTC · ePRTC

# text
seg-93d590e6408d = primäre Referenzzeituhr · verbesserte PRTC

# text
seg-8541a73eef89 = ADEV · σy(τ)

# text
seg-a2ae4a40f486 = Allan-Abweichung bei der Mittelungszeit τ

# text
seg-96fae3b4fb8e = Internationale Fernmeldeunion, Sektor für Standardisierung der Telekommunikation

# text
seg-24cab92c0fd3 = NIS · NEES

# text
seg-7e82e2927d59 = normiertes Quadrat der Innovation · normiertes Quadrat des Schätzfehlers

# text
seg-7175ab55e707 = JSON · CSV · SVG

# text
seg-a9a2906d15de = JavaScript Object Notation · durch Kommas getrennte Werte · Scalable Vector Graphics

# text
seg-d3a9009a35c0 = CLI · API · IDE

# text
seg-c6418e1f785d = Befehlszeilenschnittstelle · Programmierschnittstelle · integrierte Entwicklungsumgebung

# text
seg-8df86177107a = SBOM · SLSA

# text
seg-e54326c78ab0 = Software-Stückliste · Supply-chain Levels for Software Artifacts

# text
seg-347b23148b8f = NDA

# text
seg-969d2489de28 = Geheimhaltungsvereinbarung

# text
seg-564cfa0d3084 = Digital Object Identifier

# text
seg-5cbd99859d90 = C/N₀-Wasserfall

# text
seg-ed4a9e041a83 = ein Diagramm der Träger-Rausch-Leistungsdichte je Satellit über die Zeit

# text
seg-1cb49c7e6c7f = HPL · VPL

# text
seg-ccdc7d672c8f = horizontales · vertikales Schutzniveau

# text
seg-c7a40ebac7e1 = LROC

# text
seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

# text
seg-c5da9d350518 = <s1>Zurück</s1>Einführung in die Konzepte

# text
seg-670504be0531 = <s1>Weiter</s1>Studio-Leitfaden

# text
seg-13fb20435df3 = <b>VALIDATED.</b> In einfachen Worten: <em>gegen die Antwort eines anderen geprüft.</em> Die Ausgabe der Fähigkeit wurde mit einer unabhängigen externen Referenz verglichen — echten Messdaten, einer unabhängigen, von jemand anderem geschriebenen Bibliothek oder veröffentlichten Referenzwerten — und stimmte innerhalb einer angegebenen Toleranz überein. Eine Prüfung in der Continuous Integration weist eine Zeile der Stufe VALIDATED zurück, die keine externe Referenz nennt.

seg-6c10aaedf2fc = <s1>Weiter</s1>Sprachen
