# docs--kind-lunar-beacon: translations (de)

# text
# c1: docs/kinds/by-kind/lunar-beacon.md
seg-3c4e3d725bb6 = Quelle: <c1/>

# text
# c1: lunar-beacon
seg-5e402fc935cb = <c1/> (Szenarioart)

# text
seg-142ad48fe422 = Oberflächenbaken-Ergänzung eines lunaren orbitalen Navigationsdienstes als lauffähige Vorher-Nachher-Tabelle. Ein Nutzer am Südpol sieht eine spärliche Orbitalmenge in einem schmalen Himmelsausschnitt, daher ist die Entfernungsmessgeometrie schlecht konditioniert; einige VERMESSENE OBERFLÄCHENBAKEN liefern die Sichtlinienzeilen mit niedriger Elevation und großem Azimutbereich, die einer rein im Zenit stehenden Menge fehlen, und der horizontale Dilution-of-Precision-Wert bricht ein. Das Szenario berichtet drei Konfigurationen zu einer Epoche — nur Satelliten, Satelliten plus die sichtbaren Baken und eine größere Konstellation als alternativer Weg zur selben Geometrie — jeweils mit ihren Zahlen sichtbarer Quellen, ihrem vollständigen DOP und der erzielten 1-Sigma-Genauigkeit in METERN, gewonnen durch Multiplikation mit einem Nutzer-äquivalenten Entfernungsfehler je Bake, der als Wurzel aus der Quadratsumme von Uhrensynchronisations-, Mehrwege- und Vermessungstermen zusammengesetzt ist. Die Sichtbarkeit der Baken ist der geometrische Horizont für zwei Höhen auf dem Mond ohne Atmosphäre (keine Atmosphäre, daher ist die Grenze exakt), und die DOP-Zusammensetzung ist derselbe Kern, der in tests/dop_reference.rs gegen gnss_lib_py gegengeprüft wird. WARUM ES DIESE ART GIBT: Das Modul dahinter ist seit L08/L09 in der Engine und wird gegen einen unabhängigen DOP-Pfad geprüft, war aber aus einem Lauf nicht erreichbar — keine Art, kein Dispatch-Zweig, keine mitgelieferte Datei. Die README warb mit der Fähigkeit, und die Verifikationsmatrix führte KEINE Zeile dafür, sodass sie zugleich in der Prosa behauptet und im Register nicht beansprucht wurde, während sie in der Engine unerreichbar war. Die Standardwerte sind die Geometrie, die bereits ein eingechecktes Golden trägt (ein Nutzer bei -80 deg mit einer Antenne von { "2" } m, drei Baken bei -80/0, -79/+{ "60" } und -79/-60 auf { "2" } km, ein illustrativer LCNS-Schnappschuss mit sechs Satelliten bei t={ "0" }, eine Maske von { "5" } deg), sodass ein bloßer Lauf eine Tabelle reproduziert, die eine Referenz bereits abdeckt, statt neue Zahlen zu erfinden. MODELLED: der Konstellationsentwurf, die Bakenplatzierung und jede Größe des Fehlerbudgets sind illustrative Eingaben, keine im Feld erfolgte Vermessung und keine gemessene Strecke; nur die DOP-Arithmetik, die geschlossene Form des Horizonts und die Beziehung Sigma = DOP x sigma_URE sind extern verankert. Keine Zusage einer Dienstleistung.

# text
# c1: scenarios/lunar-beacon.toml
seg-22ea11fcf367 = Ein Lauf von <c1/> fasst sich so zusammen: Lunar surface-beacon augmentation — mask { "5.0" } deg, epoch +{ "0" } s, per-beacon sigma_URE { "1.1576" } m { "6" } satellites, no beacons sats { "5" } beacons { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } realised 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satellites + { "1" } visible beacons sats { "5" } beacons { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } realised 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satellites, no beacons sats { "19" } beacons { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } realised 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m beacons improve PDOP by 2.355x; a larger constellation instead, 4.002x MODELLED: the constellation, the beacon placement and the error budget are illustrative inputs. The DOP kernel underneath is the gnss_lib_py-validated one and the beacon horizon is the L01 closed form.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-25522022cf9a = Optionale Felder: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/lunar-beacon.toml
seg-acfef3f325e4 = Das Beispiel <c1/> setzt unter anderem:

# attr:alt
seg-a53e353706f6 = Das Diagramm, das die Engine für scenarios/lunar-beacon.toml schreibt, Art lunar-beacon

# text
seg-89e2f6bb2540 = <b>MODELLED</b> Bakenergänzte Dilution of Precision für einen Nutzer auf der Mondoberfläche: Die Sichtlinienzeilen der sichtbaren Satelliten und die Entfernungsmesszeilen der sichtbaren Oberflächenbaken werden zu einer Entwurfsmatrix verkettet und über den gemeinsamen DOP-Kern ausgewertet, und t Tests: <a1>validate_p2_beacon_before_after_table.rs</a1>.

# text
seg-654a3554b1e3 = <b>MODELLED</b> Bakenergänzte Dilution of Precision für einen Nutzer auf der Mondoberfläche: Die Sichtlinienzeilen der sichtbaren Satelliten und die Entfernungsmesszeilen der sichtbaren Oberflächenbaken werden zu einer Entwurfsmatrix verkettet. Referenz (ReferenceImpl): Die DOP-Arithmetik ist der Kern crate::orbit::dop, der in tests/dop_reference.rs gegen gnss_lib_py gesondert extern validiert wird; diese Zeile übernimmt den Status jener Zeile nicht. Der Sichtbarkeitshorizont der Baken ist die geschlossene Form L01, und Sigma = DOP x sigma_URE ist die übliche GNSS-Beziehung (Kaplan und Hegarty, Understanding GPS/GNSS, Abschnitt { "7" }). Innerhalb dieser Zeile wird die Ergänzung selbst gegen eine unabhängige

# text
# c1: kshana kinds --json
seg-4d1fc06e907b = MODELLED: der Konstellationsentwurf, die Bakenplatzierung und jede Größe des Fehlerbudgets sind illustrative Eingaben, keine im Feld erfolgte Vermessung und keine gemessene Strecke; nur die DOP-Arithmetik, die geschlossene Form des Horizonts und die Beziehung Sigma = DOP x sigma_URE sind extern verankert. (Katalog der Arten (<c1/>))

# text
seg-aaafed663400 = WAS VERANKERT IST UND WAS NICHT Verankert: Die DOP-Zusammensetzung ist der Kern, der in tests/dop_reference.rs gegen gnss_lib_py gegengeprüft wird; die Sichtbarkeit der Baken ist die geschlossene Form des geometrischen Horizonts für zwei Höhen auf dem Mond ohne Atmosphäre (keine Atmosphäre, daher gibt es keine Refraktionserweiterung und die Grenze ist exakt); und Sigma = DOP x sigma_URE ist die übliche Beziehung (Kaplan & Hegarty, Understanding GPS/GNSS, Abschnitt { "7" }). NICHT verankert — MODELL (Kommentar der Szenariodatei, Zeilen { "40" } bis { "49" })

# text
seg-2516c4208769 = Die DOP-Ergänzung durch Oberflächenbaken auf dem Mond ist MODELLED, nicht validiert: Sie wird gegen eine gesonderte Implementierung in derselben Codebasis geprüft – unabhängig von der geprüften Einheit, aber nicht extern maßgeblich. (Verifikationsmatrix (docs/MODELLED-RATIONALE.md))

# text
seg-ebb9724de60a = <s1>Zurück</s1>lunar-attack-surface

# text
seg-ca9b68783354 = <s1>Weiter</s1>lunar-differential-pnt
