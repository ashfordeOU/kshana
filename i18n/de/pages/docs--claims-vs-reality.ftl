# docs--claims-vs-reality: translations (de)

# text
seg-a47934361f43 = NMEA-Datenströme für Besatzungstraining

# text
seg-ee2e250497f9 = Export für den Prüfstand

# text
seg-2bd2101ce454 = Oberfläche

# text
seg-ad856ad710eb = Status

# text
seg-98d0bc6b40ce = Compliance-Zuordnung zu öffentlichen Rahmenwerken

# text
seg-80f3f0aae42c = Störungskarte

# text
# c1: docs/CLAIMS-VS-REALITY.md
seg-28b1885c4ca7 = Quelle: <c1/>

# text
seg-bf5c2811ce29 = Behauptungen vs. Wirklichkeit — Register der Übertreibungen

# text
# c1: OC-0
# c2: OC-13
seg-592e007bc3cf = Ein unabhängiges Audit einer früheren Version von Kshana hat vierzehn <b>Übertreibungen</b> katalogisiert (<c1/>…<c2/>): Stellen, an denen eine öffentlich sichtbare Oberfläche (README, Playground, Beschriftungen der Gütemaße (FoM, figure of merit), Szenariopakete) eine Fähigkeit stärker beschrieb, als der Code sie lieferte. Diese Seite ist das Abschlussregister: Jede Zeile nennt die ursprüngliche Übertreibung, wie sie aufgelöst wurde, und den Beleg. Es kommen zwei Arten der Auflösung vor:

# text
seg-39250970dbbf = <b>Zurückgenommen</b> — die Formulierung wurde an den Code angepasst (ehrliche Neufassung, keine Änderung der Fähigkeit). „Null Code = null Behauptung.“

# text
seg-fb7da0f79ead = <b>Abgelöst</b> — die reale Fähigkeit wurde nachträglich gebaut und getestet, sodass die starke Behauptung <em>zutreffend</em> wurde.

# text
# c1: tests/no_overclaims.rs
# c2: README.md
# c3: docs/CAPABILITY.md
# c4: docs/GLOSSARY.md
# c5: web/capabilities.json
# c6: web/index.html
# c7: web/README.md
# c8: README.crates.md
# c9: README.pypi.md
# c10: README.npm.md
seg-5292f7162e2b = Eine Regressionssicherung (<c1/>) durchsucht bei jedem Lauf der CI (kontinuierliche Integration) die aktuellen öffentlichen Oberflächen (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> sowie die Startseiten von crates.io, PyPI (Python Package Index) und npm <c8/>, <c9/>, <c10/>) und schlägt fehl, wenn eine der ausgemusterten nackten Formulierungen von Übertreibungen ohne Einschränkung wieder auftaucht — sodass eine Zeile nicht unbemerkt aus GREEN zurückfallen kann.

# text
seg-dafc6f322f34 = Alle vierzehn Zeilen sind <b>GREEN</b>.

# text
seg-5cf7bf2d1889 = OC (Übertreibung)

# text
seg-0e01d4053d7f = Ursprüngliche Übertreibung

# text
seg-36bf87638923 = Auflösung

# text
seg-70a952c4150b = „gemeinsamer Kalman-Fusionsschätzer“ legte ein einziges Filter mit Kreuzkovarianz nahe; der Code führte zwei unabhängige Schätzer aus

# text
seg-d5682a7fdb11 = <b>Abgelöst</b> — ein reales gekoppeltes Kalman-Filter für Uhr+Position mit Kreuzkovarianz wurde gebaut

# text
# c1: src/fusion/coupled.rs
seg-1008020cd9e4 = <c1/> ({ "7" } Tests, darunter ein Ensemble mit 100 Läufen gekoppelt vs. entkoppelt, das verlangt, dass der RMS (quadratischer Mittelwert) der Position beim gekoppelten Filter unter dem { "0.6" }-Fachen des entkoppelten liegt und das gekoppelte Filter mindestens { "90" } der { "100" } Läufe gewinnt); CAPABILITY „Sensor fusion“ → full

# text
seg-334fc345d501 = „RAIM (Receiver Autonomous Integrity Monitoring) zur Spoofing-Erkennung mit Uhrenstützung“ legte einen RAIM-Detektor mit mehreren Satelliten nahe

# text
seg-cf0795c2ee02 = <b>Zurückgenommen → Abgelöst</b> — neu gefasst als Erkennbarkeitsschranke für Spoofing aus der Uhrenstabilität; das echte RAIM/ARAIM (HPL/VPL (HPL: horizontales Schutzniveau; VPL: vertikales Schutzniveau)) kam danach hinzu

# text
# c1: src/raim.rs
# c2: docs/INTEGRITY.md
seg-f46432acbfa0 = <c1/> ({ "30" } Tests — Snapshot + ARAIM mit Lösungstrennung, HPL/VPL, FDE (Fehlererkennung und -ausschluss), Stanford-Diagramme); <c2/>

# text
seg-8b47f69dbb76 = „Jamming-Demonstrator“ ohne Jamming-Code dahinter

# text
seg-bfff34d5a250 = <b>Abgelöst</b> — ein Jamming-Modell auf Basis des Link-Budgets J/S → effektives C/N₀ → Loss-of-Lock wurde gebaut

# text
# c1: src/jamming.rs
seg-5f75628b8201 = <c1/> ({ "10" } Tests); Zeile „Resilience“ des README

# text
seg-bae512770cd6 = „Vollständiges Rauschmodell nach Allan-Varianz für eine IMU (Inertial Measurement Unit) auf einer IMU-Triade“ — das Modell war einachsig

# text
seg-50c0b5855cb9 = <b>Zurückgenommen → Abgelöst</b> — neu gefasst als Fehlerbudget mit 1 Freiheitsgrad (DOF: degree of freedom); danach wurde ein dreiachsiges Strapdown-INS (Inertialnavigationssystem) ausgeliefert

# text
# c1: src/inertial
seg-501bf7d8fff0 = <c1/> dreiachsiges Strapdown (Lage als Quaternion, Mechanisierung NED (North-East-Down), Coning/Sculling); ROADMAP „Inertial“

# text
seg-ad250a99b05f = „Hybride Integration von PNT (Positionierung, Navigation und Zeitgebung)“ legte ein gekoppeltes GNSS/INS-Filter (GNSS: globales Satellitennavigationssystem) nahe; es war ein Fehlerbudget der Koppelnavigation

# text
seg-85fb58d37a5d = <b>Zurückgenommen → Abgelöst</b> — neu gefasst als Koppelnavigation mit konfigurierbarem Wiederanlauf der Verfolgung; danach wurde eine reale eng gekoppelte GNSS/INS-Fusion ausgeliefert

# text
# c1: src/fusion/tightly_coupled17.rs
seg-9e6b092d5656 = <c1/> (UKF (Unscented-Kalman-Filter) mit 17 Zuständen und Quanten-CAI (CAI: Kaltatom-Interferometer) für die Koppelnavigation); CAPABILITY „Sensor fusion“ → full

# text
seg-46a637f8e967 = „validiert auf ~{ "2" } %“ legte ein enges, erzwungenes Gate nahe

# text
# c1: VALIDATION.md
seg-5e98d7664558 = <b>Zurückgenommen</b> — <c1/> nennt das <em>erzwungene</em> Gate ({ "20" }–{ "25" } % gemittelt über Seeds); „~{ "2" } %“ bezeichnete eine typische Beobachtung, nicht das Gate

# text
# c1: docs/VALIDATION.md
seg-84f4fcdc7e50 = <c1/> Kopfzeile „On tolerances“

# text
seg-85ec2fe9c7f7 = „plattformübergreifend deterministisch“ ohne eingecheckten Beleg

# text
seg-6e516f04db89 = <b>Zurückgenommen</b> — Toolchain auf ein exaktes Release festgelegt; Golden-Hashes je Szenario eingecheckt, mit einem Gate für Reproduzierbarkeit. (Bitgleichheit <em>über</em> Betriebssystem/Architektur (OS: Betriebssystem) hinweg bleibt ein offener Punkt, ehrlich benannt.)

# text
# c1: rust-toolchain.toml
# c2: 1.93.0
# c3: tests/golden.rs
# c4: tests/cross_platform_golden.rs
# c5: scripts/check-reproducible.sh
seg-9db327be56c3 = <c1/> (Kanal <c2/>); <c3/> (numerische Werte auf { "1e-6" }); <c4/> (Hash des Eingabe-Fingerabdrucks und der Form jedes Ergebnisses, ausgeführt in der CI-Matrix für Linux, macOS und Windows); <c5/>

# text
seg-2708139388ed = „hybrider quantenklassischer PNT-Simulator“ legte Quantenphysik aus ersten Prinzipien nahe

# text
seg-717167714e83 = <b>Zurückgenommen → Abgelöst</b> — neu gefasst als Simulator für die Resilienz von PNT mit Leistungsmodellen für Quantensensoren; danach kam die Physik des Mach–Zehnder-CAI aus ersten Prinzipien hinzu

# text
# c1: src/inertial/quantum_imu.rs
# c2: 1/√(N·C²·T²)
# c3: docs/QUANTUM.md
seg-c67fb22add4b = <c1/> ({ "26" } Tests — Phase nach Mach–Zehnder, Projektionsrauschen <c2/>, Übertragungsfunktion der Vibration, Systematiken von Coriolis + AC-Stark (AC: Wechselstrom)); <c3/>

# text
seg-5c6b7d4f2029 = Das Gütemaß „Integrity Performance“ legte Integrität der Luftfahrt nach HPL/VPL/RAIM nahe

# text
seg-ee5487da890c = <b>Zurückgenommen + Abgelöst (in Schichten)</b> — das Gütemaß des Szenarios je Lauf ist ehrlich mit <em>Selbstkonsistenz des Filters</em> beschriftet (<b>nicht</b> Integrität der Luftfahrt); das echte ARAIM HPL/VPL wird <em>getrennt</em> ausgewiesen, sodass beide nie vermischt werden

# text
# c1: src/fom.rs:80
# c2: integrity
# c3: src/raim.rs
# c4: docs/INTEGRITY.md
seg-31aacdf17b02 = <c1/> (<c2/>: Selbstkonsistenz, mit Einschränkung); <c3/> + <c4/> (echtes ARAIM)

# text
seg-0686fa147c96 = Das Gütemaß Security wurde als stets aussagekräftig dargestellt, auch ohne Angriff

# text
# c1: 1 − P_md
seg-d6d9296422fc = <b>Zurückgenommen</b> — das Gütemaß Security (<c1/>) ist im Kontext des Spoofing-Detektors gerahmt und nur aussagekräftig, wenn ein Angriffsszenario konfiguriert ist

# text
seg-8f7b211b5a0c = Zeile „Resilience“ des README; das Gütemaß Security ist am operativ schädlichen Spezifikationspunkt definiert

# text
seg-d66421174e94 = Das Gütemaß „Positioning Performance“ legte vollständige Genauigkeit im Positionsbereich nahe

# text
# c1: pos_rms_m
seg-9eeb13a16350 = <b>Zurückgenommen</b> — für die Pakete Inertial/Hybrid als <c1/> mit 1 Freiheitsgrad beschriftet, ausdrücklich <b>nicht</b> als 2D-CEP/2DRMS (CEP: Kreisfehler-Wahrscheinlichkeit) oder DOP-gewichtete (DOP: Verdünnung der Genauigkeit) Genauigkeit

# text
seg-e8115df73c10 = Tabelle der Gütemaße im README (Zeile „Positioning Performance“)

# text
seg-5c73759a2454 = Zahlen der inertialen Gütemaße wurden als Ensemble-Statistik gelesen, stammten aber aus einzelnen Seeds

# text
# c1: monte_carlo: false
# c2: runs = N
seg-3db3a41ce848 = <b>Zurückgenommen</b> — ein einzelner Lauf wird mit <c1/> markiert; <c2/> weist Mittelwert/Streuung/Bootstrap-KI von { "95" } % aus

# text
seg-bf737455e6f2 = Tabelle der Gütemaße im README; Tests zur Abdeckung des Betriebsbereichs der Szenarien

# text
seg-aa362992b5da = das Szenario „SGP4 (Simplified General Perturbations { "4" }) GPS (Global Positioning System)-Konstellation“ verwendete synthetische Platzhalter-TLEs (Zweizeilen-Elementsätze)

# text
# c1: gps-ops
seg-ebae20813a52 = <b>Abgelöst</b> — das Szenario bettet nun einen echten, mit Datum versehenen Celestrak-Snapshot <c1/> mit strengen Prüfsummen ein

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: gps-ops
# c3: strict_checksum
# c4: tests/scenario_coverage.rs
seg-2d49f6101571 = <c1/> (echtes <c2/>, <c3/>); <c4/>

# text
# c1: Cargo.toml
seg-cdefa4ee436a = Die Versionszeichenfolge im README wich von <c1/> ab

# text
# c1: Cargo.toml
seg-8e66b9485565 = <b>Zurückgenommen</b> — ein CI-Gate stellt fest, dass das Status-Badge im README zu <c1/> passt

# text
seg-347fd8c1f334 = { "0.35" }: Behauptungen eng gehalten, und eine Korrektur

# text
# c1: tests/no_overclaims.rs
# c2: tests/compliance_report.rs
seg-946ff389cec5 = Die Funktionen von { "0.35" } wurden mit ihren Grenzen neben der Behauptung geschrieben, und dieselben Sicherungen (<c1/> und die Sicherung der Formulierung in <c2/>) durchsuchen die Seiten, die sie beschreiben. Diese Tabelle gehört nicht zum oben stehenden Register mit vierzehn Zeilen; sie hält für die neuen Oberflächen fest, was behauptet wird und was nicht.

# text
seg-6ac3f9b26aad = Was behauptet wird

# text
seg-6f558815da86 = Was nicht

# text
# c1: receiver_trust
# c2: $PKSHT
seg-d0964d2f9bbc = Vertrauenswert für ein Schiff (<c1/>, <c2/>, Gate, Signal K, OpenCPN)

# text
seg-ee4d75006bfc = ein Wert von 0–100 und Gründe aus den eigenen NMEA-Daten eines Empfängers, MODELLED

# text
seg-59ff27c84fe4 = beratend, keine typzugelassene Navigationsausrüstung; ein Wert für ein einzelnes Log ist keine Aussage über andere Empfänger; er macht eine Positionslösung nicht genauer

# text
seg-8869e6a5c10b = synthetische NMEA-Daten einer Brücke mit geskripteten Ereignissen und einem Log für den Ausbilder

# text
seg-bc4ba77bc569 = nur Text, keine Hochfrequenzausgabe; nie für die laufenden Navigationssysteme eines Schiffes; beratend, keine typzugelassene Navigationsausrüstung

# text
seg-9482ecbb2748 = eine signierte technische Aufzeichnung, die offline verifiziert werden kann

# text
seg-20ae6dd2b780 = kein Rechtsgutachten; sagt nicht, was ein Ereignis verursacht hat, wer verantwortlich war oder dass das Log zeigt, was der Empfänger tatsächlich empfangen hat

# text
seg-4132fc36f1d3 = aggregierte Zellen mit beeinträchtigter Navigation aus offen lizenzierten Berichten

# text
seg-c64960abf9fb = keine Prognose; die Exposition einer Route ist ein Anteil von Zellen, kein Risiko

# text
seg-ed6d268e0291 = Fahrzeugbewegung und Ereignisse eines Szenarios in Dateien, die ein Simulator im Labor lesen kann

# text
seg-85c8ad22ef03 = es wird kein Signal geschrieben; es wird keine Leistung eines Simulators oder Empfängers behauptet

# text
seg-1bba9a883650 = für welche Zeilen eine Reihe von Läufen Belege liefert, mit einer Lücke in jeder Zeile

# text
seg-f2a836780831 = nie, dass ein Rahmenwerk erfüllt oder ein Produkt zugelassen ist; eine Typbezeichnung allein ist kein Beleg

# text
# c1: docs/RESILIENCE-CROSSWALK.md
seg-31c7009c9914 = <b>In { "0.35" } festgehaltene Korrektur.</b> Eine frühere Fassung von <c1/> und der Kommentare des Resilienzmoduls beschrieb sieben „Technikkategorien“ des DHS Resilient PNT Conformance Framework. Version { "2.0" } dieses Rahmenwerks definiert Kernfunktionen (Prevent, Respond, Recover), Stufen { "0" } bis { "4" } und acht nummerierte Anforderungen, aber keine Liste von sieben Kategorien. Die sieben Namen von Teilwerten, die die Bewertungs-Engine ausgibt, sind die eigenen von Kshana, und die Zuordnungstabelle sagt das nun.

# text
seg-f70787ecb194 = Wie eine Zeile GREEN bleibt

# text
# c1: tests/no_overclaims.rs
seg-f2c599e8882a = Die starken Behauptungen (OC-0/2/7/8 und die abgelösten Hälften von OC-1/3/4/12) sind GREEN, weil die Fähigkeit <b>ausgeliefert und getestet</b> ist — nicht, weil die Formulierung abgeschwächt wurde. Die zurückgenommenen Zeilen sind GREEN, weil die aktuelle Formulierung zum Code passt. Der Test der Sicherung macht die zweite Kategorie durchsetzbar: Kehrt eine ausgemusterte Formulierung einer Übertreibung auf eine öffentliche Oberfläche zurück, wird die CI rot. Siehe <c1/>.

# text
seg-39e475441b60 = <s1>Zurück</s1>Warum Zeilen modelliert bleiben

# text
seg-07ef8e1e862e = <s1>Weiter</s1>Herkunft
