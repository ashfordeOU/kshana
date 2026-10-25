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
seg-13fb20435df3 = <b>VALIDATED.</b> In einfachen Worten: <em>gegen die Antwort eines anderen geprüft.</em> Die Ausgabe der Fähigkeit wurde mit einer unabhängigen externen Referenz verglichen — echten Messdaten, einer unabhängigen, von jemand anderem geschriebenen Bibliothek oder veröffentlichten Referenzwerten — und stimmte innerhalb einer angegebenen Toleranz überein. Eine Prüfung in der Continuous Integration weist eine VALIDATED-Zeile zurück, die keine externe Referenz nennt.

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
