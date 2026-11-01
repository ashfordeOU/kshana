# docs--sgp4-validation: translations (de)

# text
seg-3c513ef2fd3b = Größe

# text
# c1: docs/SGP4-VALIDATION.md
seg-09da3685124b = Quelle: <c1/>

# text
seg-dd68e234a5cd = SGP4/SDP4-Validierung gegen die Referenz der Community

# text
# c1: SGP4-VER.TLE
# c2: tcppver.out
seg-d7567fa218fe = Der Bahnpropagator von Kshana wird gegen die <b>kanonische Referenz der Community</b> für SGP4/SDP4 validiert (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }): die mit Vallado et al., <em>"Revisiting Spacetrack Report #3"</em> (AIAA (American Institute of Aeronautics and Astronautics) 2006-6753), veröffentlichten Verifikationsvektoren, verteilt als <c1/> (die Test-TLEs (Two-Line-Element-Sätze)) und <c2/> (der erwartete TEME-Zustand (True Equator, Mean Equinox) zu jedem Zeitpunkt). Das ist dieselbe Referenz, gegen die die öffentlichen C++/Python/MATLAB-Implementierungen validieren; Übereinstimmung hier ist also Übereinstimmung mit dem De-facto-Standard.

# text
seg-b99fb640886c = Verglichene Referenzzustände

# text
# c1: tcppver.out
seg-b16a220a41b7 = (alle Zeilen in <c1/>, im Test festgeschrieben)

# text
seg-e7d45e243571 = Größter Positionsfehler

# text
# c1: 2e-5
seg-af3129dd345c = <b>{ "4.12" } mm</b> ({ "4.120e-6" } km, Satellit { "23333" }; < <c1/> km Toleranz)

# text
seg-01da72026e56 = Größter Geschwindigkeitsfehler

# text
# c1: 1e-6
seg-483a7f8f4104 = <b>{ "1.85e-9" } km/s</b> (Satellit { "23333" }; < <c1/> km/s Toleranz)

# text
seg-041cbc679ed7 = Abgedeckte Fälle

# text
seg-283f3c571a7c = erdnahes SGP4, SDP4 für den tiefen Raum (Mond-Sonne + { "12" }-h-/24-h-Resonanz) und die absichtlichen Fehlercode-Fälle

# text
seg-75c2bd004348 = Die Fälle des tiefen Raums und der Resonanz sind für dieses Projekt besonders wichtig: GNSS-Satelliten (Globales Satellitennavigationssystem) befinden sich auf Bahnen von ~{ "12" } h, die zum tiefen Raum gehören und resonant sind; ein Zweikörper-Modell mit säkularem J2 kann sie nicht nachbilden – SGP4/SDP4 kann es.

# text
seg-613697670501 = Methode

# text
# c1: src/sgp4.rs
# c2: improved
# c3: afspc
seg-d753e2f76b4a = Die Implementierung (<c1/>) ist eine abhängigkeitsfreie Rust-Portierung des gemeinfreien Vallado-Algorithmus; die Epochenbehandlung zählt Tage seit 1950, es wird der Modus <c2/> (nicht <c3/>) verwendet, und WGS-72-Schwerekonstanten (WGS: World Geodetic System) werden angewendet, wie es die Referenz vorgibt.

# text
# c1: tests/sgp4_verification.rs
# c2: SGP4-VER.TLE
# c3: tcppver.out
# c4: tests/fixtures/sgp4/
# c5: 666
seg-ebc18c4cb8ad = Der Test (<c1/>) liest die mitgelieferten Fixtures <c2/> und <c3/> (<c4/>) ein, propagiert jeden Testsatelliten zu jedem Referenzzeitpunkt und prüft, dass TEME-Position und -Geschwindigkeit innerhalb der oben genannten Toleranzen übereinstimmen. Die Zahl der verglichenen Zeilen ist auf genau <c5/> festgeschrieben, damit eine Regression bei den Fixtures oder beim Überspringen die Abdeckung nicht unbemerkt verringern kann.

# attr:aria-label, text
seg-d0566d4db829 = Nachvollziehen

# text
seg-ba3ed7f0aba7 = Der Test gibt die Zahl der verglichenen Zeilen sowie die größten Positions- und Geschwindigkeitsfehler aus. Die Fixtures sind eingecheckt, daher läuft die Prüfung vollständig offline und deterministisch.

# text
# c1: sgp4
seg-4f539e17926e = Unabhängige Gegenprüfung mit dem Crate <c1/>

# text
# c1: tests/sgp4_crate_comparison.rs
# c2: sgp4
# c3: from_elements
seg-0c2d2752179f = Die Übereinstimmung mit der veröffentlichten Referenz belegt die Korrektheit gegenüber einer <em>Tabelle</em>. Um die Korrektheit auch gegenüber einer <em>unabhängigen Implementierung</em> zu belegen, lässt <c1/> eine weit verbreitete unabhängige Rust-SGP4-Bibliothek laufen, das Crate <a1><c2/></a1> (neuromorphicsystems/sgp4, Version { "2.4" }), über dieselben { "666" } AIAA-Vektoren und vergleicht die beiden Codebasen direkt miteinander. Beide werden mit dem Schweremodell <b>WGS72</b> (World Geodetic System { "1972" }) betrieben, in dem die Vektoren definiert sind (das Standardverhalten von <c3/> im Crate verwendet WGS84 (World Geodetic System { "1984" }), das sich von der WGS72-Referenz um ~km unterscheidet – eine Modellierungsentscheidung, offen ausgewiesen, kein Fehler).

# text
seg-da0e4e6c9e96 = Regime

# text
seg-a6eefd68c27c = kshana ↔ Referenz

# text
seg-e725899898a3 = Crate ↔ Referenz

# text
seg-427820fec0e7 = kshana ↔ Crate

# text
seg-6305527acfa4 = erdnah (LEO/MEO (LEO: niedrige Erdumlaufbahn; MEO: mittlere Erdumlaufbahn))

# text
seg-081e28a39101 = { "7.3e-9" } km

# text
seg-e68c97a6528a = { "4.4e-10" } km

# text
seg-4c34e8e2f4c4 = tiefer Raum (nicht resonant)

# text
seg-12e758e04df0 = { "4.1e-6" } km

# text
seg-db82b835dec9 = { "2.1e-7" } km

# text
seg-d7d4f47417bc = Resonanz im tiefen Raum (½-Tag)

# text
seg-17007f8aada3 = { "8.1e-9" } km

# text
seg-895ba7518ab3 = { "7.7e-9" } km

# text
seg-be5a634658e5 = { "2.2e-9" } km

# text
seg-6cf60f32cbcd = Resonanz im tiefen Raum (1-Tag)

# text
seg-7698aecab6b4 = { "8.2e-9" } km

# text
seg-60520079d492 = { "7.8e-9" } km

# text
# c1: tests/fixtures/sgp4_comparison.md
# c2: KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison
seg-c22876d62c29 = Zwei unabhängige Implementierungen stimmen bei erdnahen und resonanten Bahnen auf <b>Submikrometer</b> überein und über alle Regime hinweg im ungünstigsten Fall auf <b>{ "4.12" } mm</b> – dieselben { "4.12" } mm, die Kshanas eigene Abweichung von der Referenz sind, d. h. die Abweichung <em>ist</em> dieser eine Fall im tiefen Raum, wobei das Crate zwischen Kshana und der Tabelle liegt. Die vollständige Tabelle (mit Zeilenzahlen je Regime und den vier pathologischen Fällen, die das Crate bei der Konstruktion zurückweist) ist unter <a1><c1/></a1> eingecheckt und wird mit <c2/> neu erzeugt.

# text
seg-3aae516df868 = Stand der „Veröffentlichung“ dieses Ergebnisses

# text
seg-2dd4b77c49d1 = Die Kreuzvalidierung selbst ist abgeschlossen und im Repository enthalten. Die Einreichung des Ergebnisses bei externen Stellen (ein Community-Katalog, eine Kurznotiz, ein per DOI (Digital Object Identifier) archivierter Datensatz) ist eine Maintainer-Aufgabe, die separat in der Roadmap verfolgt wird; dieses Dokument ist die Aufzeichnung im Repository, auf die diese Einreichungen verweisen würden.

# text
seg-b36bbcc0a0c8 = <s1>Zurück</s1>EN { "16803" }

# text
seg-4d5234d85d9f = <s1>Weiter</s1>Validierung des Kraftmodells

# text
seg-6539dbb48bca = Unabhängige Gegenprüfung mit dem Crate sgp4
