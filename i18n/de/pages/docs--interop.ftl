# docs--interop: translations (de)

# text
seg-f917e7fcac09 = Was es ist

# text
seg-cae10fb9bff8 = Szenario

# text
seg-f2ce7fc60cdf = Format

# text
seg-8c718f7f9f5d = SigMF

# text
seg-b03d56f501c3 = Typ

# text
seg-357c2320b43a = ja

# text
seg-507b8c235614 = CZML

# text
seg-bf09433a7342 = GeoJSON

# text
seg-9c92e0bc42aa = KML

# text
# c1: docs/INTEROP.md
seg-c8c964a11462 = Quelle: <c1/>

# text
# c1: --export
seg-881ec6f8fbe0 = Ein Lauf schreibt ein Ergebnisdokument, ein Diagramm und einen Bericht. <c1/> schreibt zusätzlich die Geometrie des Szenarios oder sein synthetisiertes Signal in Formaten, die andere Werkzeuge bereits lesen: einen Globus-Viewer, eine Desktop-Karte, ein Geoinformationssystem (GIS), ein Missionsanalyse-Paket oder ein Werkzeug für Software-Defined Radio (SDR). Nichts davon liest eine Uhr oder das Netz, und kein Export trägt einen Erzeugungszeitstempel, sodass dasselbe Szenario bei jedem Lauf byte-identische Dateien liefert.

# text
# c1: jamming-demo.czml
# c2: jamming-demo.kml
# c3: jamming-demo.geojson
# c4: jamming-demo.<object>.e
# c5: jamming-demo.e
# c6: l-band-waterfall-jamming.sigmf-meta
# c7: .sigmf-data
# c8: --study-name
seg-736f2dc67a3c = Die Dateien werden neben dem Szenario geschrieben und heißen wie das Ergebnisdokument: <c1/>, <c2/>, <c3/>, je bewegtem Objekt eine <c4/> (oder <c5/>, wenn es eines gibt) und das Paar <c6/> / <c7/>. Mit <c8/> tragen sie stattdessen den Namen der Studie, wie die anderen Ausgaben auch.

# text
# c1: all
# c2: kshana::interop::export(src, format)
# c3: kshana::interop::plan(src)
# c4: kshana::interop::geojson::apply_route(src, geojson)
# c5: export_interop
# c6: list_export_formats
# c7: import_route
# c8: mcp/kshana-mcp/README.md
seg-21d3fba059d5 = Ein ausdrücklich genanntes Format, das auf das Szenario nicht zutrifft, ist ein Fehler, der den Grund ausgibt; unter <c1/> wird der Grund ausgegeben und das Format übersprungen. Die Einstiegspunkte der Bibliothek sind <c2/>, <c3/> und <c4/>; sie nehmen den Szenariotext entgegen und geben Bytes zurück, ohne eine Datei zu berühren, sodass sie auch im WebAssembly-Build laufen. Der Server für das Model Context Protocol (MCP) stellt dieselben drei als die Werkzeuge <c5/>, <c6/> und <c7/> bereit (siehe <c8/>).

# text
# c1: src/interop/
# c2: scene.rs
# c3: czml.rs
# c4: kml.rs
# c5: geojson.rs
# c6: stk.rs
# c7: src/sigmf.rs
# c8: src/spectrum.rs
# c9: tests/interop_formats.rs
seg-77200201db88 = Code: <c1/> (<c2/> baut eine geometrische Beschreibung des Szenarios, <c3/>, <c4/>, <c5/> und <c6/> schreiben sie), <c7/> und <c8/> für das Signal. Tests: <c9/>.

# text
seg-f13ab6bb2e47 = Formate

# text
seg-fc52229b569c = Befolgte Spezifikation

# text
seg-3f237c8956eb = Cesium Language: ein JSON-Array (JavaScript Object Notation) zeitmarkierter Pakete, gelesen von CesiumJS

# text
# c1: gx:Track
seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, ein Standard des Open Geospatial Consortium (OGC), gelesen von Google Earth und den meisten GIS-Werkzeugen; zeitmarkierte Spuren verwenden die Google-Erweiterung <c1/>

# text
# c1: http://www.opengis.net/kml/2.2
# c2: http://www.google.com/kml/ext/2.2
seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (Schema-Namensraum <c1/>; Erweiterungs-Namensraum <c2/>)

# text
seg-4cfac7667dbc = geografisches JSON, Request for Comments (RFC) { "7946" } der Internet Engineering Task Force (IETF)

# text
# c1: .e
seg-de0feb450ae1 = STK <c1/>

# text
# c1: EphemerisTimePosVel
seg-96173e7b4238 = die Ephemeridendatei von Ansys Systems Tool Kit (STK), Zeit-Position-Geschwindigkeit-Form <c1/>

# text
seg-a2284e8c0034 = Signal Metadata Format: eine JSON-Metadatendatei und eine Rohdatei mit komplexen Inphase- und Quadratur-Abtastwerten (IQ)

# text
seg-b38ee3ebd012 = Was jede Datei enthält

# text
seg-7d873bc11593 = Jedes Geodatenformat wird aus derselben Szene geschrieben, sodass sie sich nicht darüber widersprechen können, wo etwas liegt. Eine Szene hat bis zu vier Arten von Objekten:

# text
seg-1fc686f6a7ea = <b>Bewegte Objekte</b> — Satelliten und eine Nutzerplattform, wenn sie sich bewegt — abgetastet auf dem eigenen Zeitraster des Szenarios mit den Propagatoren, die der Lauf der Art verwendet.

# text
seg-3db28cb6adc5 = <b>Feste Standorte</b> — ein Empfänger, eine Bodenstation, ein Jammer oder der Ursprung eines lokalen Navigationssystems.

# text
seg-0def04909935 = <b>Zeitlose Spuren</b> — die Wegpunkte, die eine Art für alternative Positionierung, Navigation und Zeitgebung (PNT) mit Gelände, Gravitation oder beidem abfliegt. Diese Arten haben keine Zeitachse, daher tragen die Spuren keine.

# text
# c1: jamming
seg-e14d49ae7330 = <b>Jammer-Fußabdrücke</b> — für die Art <c1/> zwei Kreise um den Jammer: die Bodenreichweite, innerhalb der ein Satellit im Zenit (der stärkste) unter die Tracking-Schwelle fällt, sodass jeder Satellit verloren geht, und die Reichweite, innerhalb der es ein Satellit auf der Elevationsmaske (der schwächste) tut, sodass das Tracking zu versagen beginnt. Beide stammen aus den eigenen Linkgleichungen der Art (Kaplan und Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3. Aufl., §{ "9.4" }) mit dem Jammer am Horizont des Empfängers und Freiraumdämpfung, und die Testsuite prüft, dass das effektive Träger-Rausch-Dichte-Verhältnis bei jedem Radius der Schwelle auf { "1e-6" } dB entspricht. Der Kreis wird auf einer Kugel mit dem mittleren Erdradius gezeichnet.

# text
# c1: "id": "document"
# c2: "version": "1.0"
# c3: position
# c4: epoch
# c5: referenceFrame
# c6: "INERTIAL"
# c7: cartesian
# c8: [t, x, y, z, ...]
# c9: INERTIAL
# c10: cartesian
# c11: referenceFrame
# c12: "FIXED"
# c13: ellipse
# c14: polyline
# c15: description
seg-e1dd97c47993 = Das erste Paket ist das Dokumentpaket (<c1/>, <c2/>) mit einer Uhr, die das Zeitraster umspannt. Jedes bewegte Objekt ist ein Paket, dessen <c3/> ein ISO-{ "8601" }-UTC-<c4/> (Datums- und Zeitformat der Internationalen Organisation für Normung, Koordinierte Weltzeit), <c5/> <c6/> und <c7/>-Abtastwerte <c8/> hat: Sekunden nach der Epoche, Meter im Geocentric Celestial Reference System (GCRS). CesiumJS nimmt <c9/> als International Celestial Reference Frame (ICRF), dessen Achsen das GCRS teilt. Feste Standorte und Fußabdruckmittelpunkte sind konstante erdfeste <c10/>-Positionen mit <c11/> <c12/>. Ein Fußabdruck ist eine <c13/> mit beiden Halbachsen gleich seinem Radius; eine zeitlose Spur eine am Boden verankerte <c14/>. Die <c15/> jedes Pakets nennt das Bezugssystem noch einmal in Worten.

# text
# c1: <Document>
# c2: <Folder>
# c3: <Placemark>
# c4: <gx:Track>
# c5: <when>
# c6: <gx:coord>
# c7: <Point>
# c8: <Polygon>
# c9: <LineString>
# c10: altitudeMode
# c11: absolute
# c12: absolute
seg-be6362f4c7e7 = Ein <c1/> mit einem <c2/> je Objektklasse. Ein bewegtes Objekt ist ein <c3/> mit einem <c4/>: ein <c5/> je Abtastwert (ISO { "8601" } UTC), dann ein <c6/> je Abtastwert (Länge, Breite, Höhe). Standorte sind <c7/>s, Fußabdrücke <c8/>s, deren Ring geschlossen und gegen den Uhrzeigersinn orientiert ist, zeitlose Spuren <c9/>s. Koordinaten sind Länge und Breite des World Geodetic System { "1984" } (WGS { "84" }) in Dezimalgrad und Höhe in Metern über dem WGS-{ "84" }-Ellipsoid, geschrieben mit <c10/> <c11/>. KML liest <c12/> als Höhe über dem mittleren Meeresspiegel; der Unterschied, die Geoidundulation, liegt innerhalb von etwa ±{ "110" } m und wird nicht angewendet. Die Beschreibung des Dokuments sagt das.

# text
# c1: FeatureCollection
# c2: [longitude, latitude]
# c3: [longitude, latitude, height]
# c4: LineString
# c5: times_utc
# c6: MultiLineString
# c7: times_utc
# c8: Point
# c9: Polygon
# c10: LineString
# c11: units
seg-37dc14626a6c = Eine <c1/>. Positionen sind <c2/> oder <c3/> — Länge zuerst, wie RFC { "7946" } es verlangt — in WGS-{ "84" }-Grad, mit der Höhe in Metern über dem Ellipsoid. Ein bewegtes Objekt ist ein <c4/> mit einer Eigenschaft <c5/>, die je Position eine ISO-{ "8601" }-Zeit enthält; eine Spur, die den { "180" }°-Meridian quert, wird als dort geschnittenes <c6/> geschrieben, wie RFC { "7946" } §{ "3.1.9" } es verlangt (der Kreuzungspunkt wird interpoliert, und <c7/> listet dann nur die ursprünglichen Abtastwerte). Standorte sind <c8/>s, Fußabdrücke <c9/>s mit geschlossenem, gegen den Uhrzeigersinn orientiertem äußerem Ring (§{ "3.1.6" }), zeitlose Spuren <c10/>s. Jedes Feature hat eine Eigenschaft <c11/>, die die Einheit jedes numerischen Members benennt.

# text
# c1: NumberOfEphemerisPoints
# c2: ScenarioEpoch
# c3: d Mon yyyy hh:mm:ss.ssssss
# c4: InterpolationMethod Lagrange
# c5: InterpolationSamplesM1 5
# c6: CentralBody Earth
# c7: CoordinateSystem ICRF
# c8: DistanceUnit Meters
# c9: EphemerisTimePosVel
# c10: .e
# c11: Pulsar inclined/S1-0163
# c12: -
seg-ea28a2bd431c = Eine Datei je bewegtem Objekt, da eine STK-Ephemeride ein Fahrzeug beschreibt. Der Kopf enthält <c1/> (gleich der Zahl der Datenzeilen), <c2/> (UTC, <c3/>), <c4/> mit <c5/>, <c6/>, <c7/> und <c8/>; die Zeilen unter <c9/> sind Sekunden nach der Epoche, Position in Metern und Geschwindigkeit in Metern pro Sekunde, im GCRS. Eine Szene mit nur festen Standorten oder zeitlosen Spuren schreibt keine <c10/>-Datei: Ein fester Punkt ist eine STK-Facility, keine Ephemeride. Eine Kennung, die kein schlichter Dateinamensteil ist (eine Konstellationsschale und ein Satellit, <c11/>), wird mit <c12/> für jedes andere Zeichen geschrieben, nummeriert, wenn zwei Kennungen dann zusammenfallen.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: [pass]
seg-52a78be5db9f = Die Art <c1/> und die Art <c2/> (über ihre Stufe <c3/>) exportieren jeden Satelliten in niedriger Erdumlaufbahn (LEO) und den Nutzer aus den eigenen Propagatoren und dem Zeitraster der Art. Die Art arbeitet in ECI0, dem erdzentrierten inertialen Bezugssystem, das zur Epoche mit dem erdfesten Bezugssystem ausgerichtet ist; jeder Abtastwert wird durch die Erddrehung der Art zu seiner eigenen Zeit in das erdfeste Bezugssystem überführt und von dort in das GCRS über das Bezugssystem True Equator, Mean Equinox (TEME), in dem der Propagator Simplified General Perturbations { "4" } (SGP4) zu diesem Zeitpunkt ausgibt, wobei UT1 (Universalzeit, der Erdrotationswinkel) gleich UTC angenommen und die Polbewegung vernachlässigt wird, wie bei den anderen Exporten. Die anderen LEO-Arten geben an, warum ein Format nicht zutrifft (die Tabelle unten).

# text
# c1: campaign
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
# c6: campaign-shared-jammer-sea-road.toml --export kml
# c7: campaign-shared-jammer-sea-road.ship-strait.kml
# c8: campaign-shared-jammer-sea-road.car-coast-road.kml
seg-b134baf33fba = Eine <c1/> exportiert jedes Mitgliedsszenario mit Geometrie als eigenen Dateisatz, wobei die Bezeichnung des Mitglieds vor dem Formatsuffix eingefügt wird: jeden Phasenlauf (<c2/> oder <c3/>, wenn die Phase mehrere Läufe hat), das Basisszenario des Sweeps (<c4/>), das Monte-Carlo-Szenario (<c5/>) und jedes zusammengesetzte Mitglied (seine Bezeichnung, mit den gebundenen gemeinsamen Werten eingeschrieben). <c6/> schreibt <c7/> und <c8/>. Ein Mitglied, das einem früheren gleicht, wird einmal geschrieben, und Werte, die eine Kampagne zur Laufzeit anwendet (Übergaben, Sweep-Werte, Seeds), stehen nicht im exportierten Mitglied. Ein Format trifft auf eine Kampagne zu, wenn es auf ein Mitglied zutrifft; andernfalls steht der Grund in Anmerkung { "4" } der Tabelle unten. Siehe <a1>CAMPAIGNS.md</a1>.

# text
# c1: spectrum
# c2: [iq]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: [iq]
# c6: cf32_le
# c7: ci16_le
# c8: iq.sigmf.meta
# c9: iq.sigmf.data_bytes
# c10: src/sigmf.rs
# c11: spectrum
seg-6579b6941d10 = Der Schnappschuss <c2/> der Art <c1/> — das modellierte L-Band, als komplexe Abtastwerte zu einem Zeitpunkt gezeichnet — als Paar <c3/> / <c4/>, im Datentyp, den <c5/> benennt (<c6/> oder <c7/>). Es ist dieselbe Aufnahme, die der Lauf schreibt und für seine eigene Konsistenzprüfung zurückliest: Die exportierten Metadaten entsprechen dem Block <c8/> des Ergebnisdokuments, und die Datendatei hat die Länge <c9/>. Der Schreiber ist <c10/>, das Modul, das die Art <c11/> bereits verwendete; nichts wird dupliziert.

# text
seg-6e7c5f0e34f3 = Bezugssysteme und Zeit

# text
# c1: nutation::teme_to_gcrs
# c2: frames::teme_to_ecef
seg-01d1bedb0595 = Die Engine propagiert in TEME (True Equator, Mean Equinox of Date), ihrem nativen Bezugssystem. Bewegte Objekte werden durch die Reduktion <c1/> (IAU-{ "2006" }-Präzession und IAU-2000B-Nutation, wobei IAU die Internationale Astronomische Union ist) in das GCRS gedreht, die für CZML und STK Vallados veröffentlichtes Beispiel TEME zu GCRF (Geocentric Celestial Reference Frame) auf { "0.11" } m reproduziert, und durch <c2/> in das erdfeste Bezugssystem für KML und GeoJSON. Die erdfeste Drehung ist der mittlere Greenwich-Sternzeitwinkel, wobei UT1 gleich UTC angenommen und die Polbewegung nicht angewendet wird — dieselbe Reduktion, die der SP3-Export (Standard Product { "3" }) verwendet. Bei einem GPS-Bahnradius verschiebt das vernachlässigte UT1−UTC von bis zu { "0.9" } s die Länge eines Satelliten um bis zu etwa { "1.7" } km; Bodenstandorte bleiben unberührt, da sie in Breite und Länge angegeben sind.

# text
# c1: ephemeris
seg-4eaa7b3e6946 = Die Art <c1/> ist die Ausnahme: Ihre Engine-Ausgabe enthält bereits GCRS- und erdfeste Positionen (mit UT1−UTC und Polbewegung des Szenarios oder einer realen Reihe des International Earth Rotation and Reference Systems Service (IERS)), und diese werden unverändert geschrieben.

# text
seg-2299da743a4c = Jede Zeit ist UTC. Schaltsekunden werden nicht modelliert: Ein Versatz über eine Schaltsekunde hinweg wird so gezählt, als hätte jeder Tag { "86 400" } s, wie es die Zeitraster der Engine zählen.

# text
# c1: t = 0
# c2: orbit
# c3: epoch
# c4: epoch
# c5: epoch
# c6: t
# c7: t = 0
# c8: jamming
# c9: gnss-sim
# c10: passes
# c11: epoch
# c12: ephemeris
# c13: epoch
# c14: integrity
# c15: t = 0
seg-4f7a0b8b4358 = Die Epoche von <c1/> ist die, die der Lauf der Art verwendet, und jede Datei nennt sie: das <c3/> der Art <c2/>; fehlt es, die früheste Epoche, die die eigenen Daten der Satelliten tragen (eine Epoche eines Two-Line-Element-Satzes (TLE), die Bezugszeit einer ausgesendeten Ephemeride, der Beginn einer SP3-Datei), und 2000-01-01T00:{ "00" }:00Z nur, wenn kein Satellit eine trägt (Kepler-Elemente). Die SP3- und OEM-Exporte (Orbit Ephemeris Message) behalten 2000-01-01T00:{ "00" }:00Z für ein Szenario ohne <c4/>, sodass sich für ein solches Szenario ihre Daten von denen dieser Dateien unterscheiden. Ohne <c5/> des Szenarios wird jeder Satellit, der seine eigene Epoche trägt, zu seinem eigenen Zeitpunkt (seine Epoche plus <c6/>) in das GCRS und in die erdfesten Bezugssysteme gedreht, da dies das Datum ist, zu dem seine TEME-Position gehört; wo sich die Epochen der Satelliten unterscheiden, folgen die gemeinsamen Zeitmarken der Prämisse der Engine, dass jeder Satellit bei <c7/> beginnt, und die Datei gibt an, um wie viele Stunden sie sich unterscheiden. Die SGP4-Elementepoche der Walker-Konstellationen der Arten <c8/> und <c9/> (2018-06-12T00:{ "00" }:00Z), die ihre Läufe auch für die Erddrehung verwenden; das <c11/> der Art <c10/>; die <c13/> oder TLE-Epoche der Art <c12/>. Die Art <c14/> hat keine Kalenderepoche; ihr Export datiert <c15/> wie bei einem Bahnszenario ohne eine.

# text
# c1: G01
# c2: G02
seg-ee8eeb47f41b = Satelliten behalten die Positionskennungen <c1/>, <c2/>, ..., die ihnen die SP3- und OEM-Exporte geben, weil die Propagatoren die TLE-Namenszeilen nicht tragen.

# text
seg-0491624c5f12 = Importe

# text
seg-798f3ae1b77d = GeoJSON-Route.

# text
# c1: --import-route <file>
# c2: interop::geojson::apply_route
# c3: LineString
# c4: Feature
# c5: FeatureCollection
# c6: terrain-nav
# c7: terrain-slam
# c8: gravity-map
# c9: combined-altpnt
# c10: start_lat_deg
# c11: start_lon_deg
# c12: step_lat_deg
# c13: step_lon_deg
# c14: waypoints
# c15: start + i·step
# c16: waypoints
seg-2a04d7d4bafc = <c1/> (Bibliothek: <c2/>) liest den ersten <c3/> eines GeoJSON-Dokuments — eine reine Geometrie, ein <c4/> oder eine <c5/> — und schreibt ihn vor dem Lauf in die Spureingaben von <c6/>, <c7/>, <c8/> und <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>). Diese Arten fliegen <c15/>, daher wird eine Route akzeptiert, wenn sie genau das ist: ihre beiden Enden (die Anzahl <c16/> des Szenarios bleibt erhalten), oder drei oder mehr Positionen, gleichmäßig verteilt auf einer Geraden in Breite und Länge, bis auf { "1e-7" } Grad (etwa { "1" } cm). Jede andere Route wird zurückgewiesen, und der Fehler nennt die am weitesten von der Geraden entfernte Position. Eine Route für eine Art ohne Trajektorieneingabe wird mit diesem Grund zurückgewiesen. Länge und Breite werden auf ihren Wertebereich geprüft, was eine Datei mit der Breite zuerst abfängt.

# text
# c1: spectrum
# c2: [recording]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: src/sigmf.rs
# c6: kshana::sigmf::read
seg-be9fddebd47a = <b>SigMF-Aufnahme.</b> Der Block <c2/> der Art <c1/> liest ein Paar <c3/> / <c4/> über <c5/> und zeichnet seine Welch-Schätzung neben das Modell (siehe <a1>SPECTRUM.md</a1>). Das Lesen von Dateien ist ein Merkmal des nativen Builds; der WebAssembly-Build nimmt die Bytes über <c6/> entgegen.

# text
seg-f1ca9cee1065 = Wie die Exporte geprüft werden

# text
# c1: tests/interop_formats.rs
seg-afe73c19e369 = <c1/> parst jeden Export mit einem Validator, der nach der Spezifikation des Formats geschrieben ist, nicht mit dem eigenen Code des Schreibers:

# text
# c1: version
# c2: referenceFrame
# c3: FIXED
# c4: INERTIAL
# c5: [t, x, y, z, ...]
seg-bdc892a450c0 = CZML: ein JSON-Array, dessen erstes Paket das Dokumentpaket mit einem <c1/> ist; eindeutige Paketkennungen; jede Position nennt <c2/> <c3/> oder <c4/>; abgetastete Positionen sind <c5/> mit einer ISO-{ "8601" }-Epoche und aufsteigenden Zeiten.

# text
# c1: lon,lat[,alt]
# c2: altitudeMode
# c3: styleUrl
# c4: gx:Track
# c5: <when>
# c6: <gx:coord>
seg-a28abb42c103 = KML: ein wohlgeformtes XML-Dokument (Extensible Markup Language) im OGC-KML-{ "2.2" }-Namensraum mit einem Wurzel-Feature; die Elementreihenfolge des Schemas innerhalb eines Placemark; höchstens eine Geometrie je Placemark; geschlossene lineare Ringe aus vier oder mehr Positionen; <c1/>-Tupel im Wertebereich; gültige <c2/>-Werte; <c3/>s, die sich auflösen lassen; ein <c4/> mit ebenso vielen <c5/> wie <c6/> und der deklarierte Erweiterungs-Namensraum.

# text
# c1: crs
# c2: units
seg-8e0f4e4c2309 = GeoJSON: Länge zuerst und im Wertebereich, Breite im Wertebereich, zwei oder drei Zahlen je Position, Linienzüge aus zwei oder mehr Positionen, geschlossene äußere Ringe gegen den Uhrzeigersinn, kein Segment über den { "180" }°-Meridian, kein Member <c1/>, eine Eigenschaft <c2/> an jedem Feature.

# text
# c1: stk.v.
# c2: BEGIN Ephemeris
# c3: END Ephemeris
# c4: DistanceUnit Meters
# c5: NumberOfEphemerisPoints
seg-57bf7f9291e1 = STK: die Versionszeile <c1/>, ein Block <c2/> / <c3/> mit den erforderlichen Schlüsselwörtern, <c4/>, <c5/> gleich der Zahl der Datenzeilen, sieben Zahlen je Zeile, aufsteigende Zeiten.

# text
# c1: core:datatype
# c2: core:version
# c3: global
# c4: captures
# c5: annotations
# c6: core:sample_start
seg-e474c11480d8 = SigMF: <c1/> und <c2/> in <c3/>, die Arrays <c4/> und <c5/>, <c6/> bei jeder Aufnahme und eine Datendatei aus ganzen Abtastwerten.

# text
# c1: ephemeris
# c2: orbit-sgp4-gps
# c3: orbit-sgp4-gps
# c4: sgp4
# c5: orbit-rinex
# c6: jamming
seg-82b7b39e7cad = Über die Struktur hinaus wird ein nach CZML und nach STK exportierter Satellit mit dem eigenen Zustand der Engine nach derselben Bezugssystem-Reduktion verglichen und stimmt auf { "1" } mm in der Position überein (die Dateien tragen { "0.1" } mm): gegen die eigene GCRS-Ausgabe der Art <c1/> und gegen eine unabhängige TEME-zu-GCRS-Propagation der Konstellation <c2/>, wobei jeder Satellit mit seiner eigenen, aus dem Szenariotext gelesenen TLE-Epoche datiert ist. Zwei Prüfungen gehen über die Engine hinaus: Die CZML-Positionen des ersten Satelliten <c3/> stimmen auf { "0.1" } m (gemessen { "2.3" } cm) mit demselben TLE überein, das vom Python-Paket <c4/> propagiert und von ERFA (Essential Routines for Fundamental Astronomy, der offenen Implementierung der SOFA-Bibliothek der IAU) in das GCRS reduziert wurde, und die erdfesten Positionen der Satelliten <c5/> entsprechen den Positionen der ausgesendeten Ephemeride aus der Schnittstellenspezifikation des Global Positioning System auf { "1" } mm. Die erdfesten Positionen des Exports <c6/> werden mit den Positionen verglichen, die der Jamming-Lauf bewertet, auf { "5" } mm. Die GeoJSON-Route durchläuft über ein Spurszenario einen Round-Trip, das SigMF-Paar liest sich zu denselben Bytes zurück, und jeder Export ist byte-deterministisch.

# text
seg-20fbf9a3fba7 = Dies sind Prüfungen gegen die veröffentlichten Spezifikationen und gegen die Engine selbst. Die Dateien wurden im Rahmen der Testsuite nicht in CesiumJS, Google Earth, Ansys STK oder ein SDR-Werkzeug geladen, sodass die Akzeptanz durch eine bestimmte Version dieser Werkzeuge hier nicht getestet ist.

# text
seg-7349c09206ac = Austausch von Bahn, Lage und Kerneln (Bibliothek, { "0.36" })

# text
# c1: --export
seg-d5e34188aa96 = Neben den Formaten von <c1/> fügte { "0.36" } Bibliotheks-Leser und -Schreiber für die Standarddateien hinzu, die Missionsanalyse-Werkzeuge austauschen. Sie nehmen Text oder Bytes entgegen und geben sie zurück und berühren keine Datei. Jede ist eine VALIDATED-Zeile der <a1>Verifikationsmatrix</a1>, gegen die dort genannte unabhängige Implementierung:

# text
# c1: kshana::odm
# c2: kshana::ndm_xml
seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, mit <c2/> für die XML-Form): OPM, OMM und OCM in Schlüsselwert-Notation (KVN) und NDM/XML, nach CCSDS 502.0-B-3 (OPM und OMM in den Versionen { "3.0" } und { "2.0" }, OCM { "3.0" }). In beide Richtungen gegen Orekit geprüft: Orekit liest die Dateien von Kshana, und Kshana liest die von Orekit. Die verbleibenden Befunde sind durch Tests festgehalten.

# text
# c1: kshana::adm
# c2: kshana::ndm_xml
seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, mit <c2/>): AEM und APM nach CCSDS 504.0-B-2, in KVN und NDM/XML. Auf dieselbe Weise gegen Orekit geprüft, und die Datensatzrotationen gegen die von Orekit.

# text
# c1: kshana::spk_writer
seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): Schreiber und Leser für NAIF-SPK-Segmente der Typen { "9" } und { "13" } (mit dem Export einer CCSDS-OEM in einen SPK-Kernel) und der Typen { "3" } und { "21" } (Tschebyscheff-Polynome und erweiterte Differenzzeilen), gegen die eigenen Leser des NAIF-SPICE-Toolkits geprüft, bis hin zur Byte-Identität. Kshana schreibt die Segmente aus Datensätzen, die ihm gegeben werden: Es passt keine Tschebyscheff-Koeffizienten an und erzeugt keine Differenzzeilen.

# text
seg-bb97cbb1ab9f = Der CCSDS-OEM-Importer und -Schreiber und der OEM-Kovarianzblock sind älter und werden bei den Importen oben und in der Matrix beschrieben.

# text
# c1: CentralBody Earth
seg-8932eba75c68 = Nur die Arten in der Tabelle unten exportieren Geometrie. Arten, deren Geometrie auf den Mond, den Mars oder einen anderen Körper zentriert ist, werden nicht exportiert: CZML, KML und GeoJSON beschreiben Positionen um die Erde, und diese Version schreibt STK-Dateien nur mit <c1/>, obwohl das STK-Format selbst andere Zentralkörper erlaubt.

# text
# c1: constellation-design
# c2: earth-gnss-lunar
# c3: oem-interop
seg-a0593ad77202 = <c1/>, <c2/> und <c3/> haben erdbezogene Geometrie, die diese Version nicht exportiert; die Tabelle nennt den Grund für jede.

# text
# c1: gnss-ins
seg-2bb9237839f3 = Die Art <c1/> fliegt ihre Trajektorie in einer ebenen lokalen Tangentialebene, daher wird nur der Ursprung der Ebene exportiert, nicht die Trajektorie.

# text
seg-6049ab4ca3c9 = Erdfeste Satellitenpositionen vernachlässigen UT1−UTC und Polbewegung (siehe Bezugssysteme und Zeit); KML-Höhen sind ellipsoidisch, nicht über dem mittleren Meeresspiegel.

# text
seg-4dda05aefd2b = Fußabdrücke nehmen Freiraumausbreitung, einen Jammer am Horizont des Empfängers und eine kugelförmige Erde für den Kreis an.

# text
seg-2dd0656c518f = Jede Szenariodatei

# text
# c1: kshana <scenario> --export <format>
# c2: scenarios/
# c3: cargo run --bin gen_validation_artifacts
# c4: tests/interop_formats.rs
seg-e024f5c1cab1 = Was <c1/> für jede Datei in <c2/> tut (das Suite-Manifest ist kein Szenario und ist ausgelassen). „yes“ bedeutet, dass das Format geschrieben wird und seinen Validator besteht; andernfalls verweist die Nummer auf den Grund. Erzeugt von <c3/>; <c4/> schlägt fehl, wenn sie veraltet ist.

# text
seg-c27f67dfbb37 = no [{ "1" }]

# text
seg-3468244e2385 = no [{ "2" }]

# text
seg-d0cf3f74cd10 = no [{ "3" }]

# text
seg-62c880979169 = no [{ "4" }]

# text
seg-9229b499c702 = no [{ "5" }]

# text
seg-d9d6561c9e5b = no [{ "6" }]

# text
seg-7d4a6538c638 = no [{ "7" }]

# text
seg-f170ed4d8dca = no [{ "8" }]

# text
seg-1c5eb5dca942 = no [{ "9" }]

# text
seg-a930bb0d2e42 = no [{ "10" }]

# text
seg-236853169f42 = no [{ "11" }]

# text
seg-411e4f3aeae7 = no [{ "12" }]

# text
seg-34fabcbb82f2 = no [{ "13" }]

# text
seg-772bd344bbce = no [{ "14" }]

# text
seg-460fd74c7c7e = no [{ "15" }]

# text
seg-e1d91ce54b8b = no [{ "16" }]

# text
seg-f3e0486f02e3 = no [{ "17" }]

# text
seg-884160b0ed12 = no [{ "18" }]

# text
seg-8202f4a426b0 = no [{ "19" }]

# text
seg-a4e9a36289e5 = no [{ "20" }]

# text
seg-034364e38105 = no [{ "21" }]

# text
seg-3e3b6ecc7b43 = Warum ein Format nicht zutrifft:

# text
# c1: contact-schedule
# c2: acm-link
# c3: passes
seg-d7bd20cb8710 = die Arten <c1/> und <c2/> planen Downlink-Kontakte und Kodierung; exportieren Sie ein Szenario <c3/> für denselben Satelliten und dieselbe Station, um die Geometrie zu sehen

# text
# c1: spectrum
seg-f587b4df1635 = SigMF enthält komplexe Basisbandabtastwerte, die nur die Art <c1/> synthetisiert

# text
# c1: aocs
seg-d102fb18ce8d = die Art <c1/> simuliert die Lage um den Massenmittelpunkt ohne Bahn oder Bodenposition, daher gibt es nichts, was auf der Erde zu platzieren wäre

# text
seg-ecc0e31b0369 = die Szenarioeingabe trägt keine horizontale Position (keine Breite und Länge, keine erdzentrierten Koordinaten, keine Bahnelemente über höchstens eine Höhe hinaus), daher gibt es nichts, was auf der Erde zu platzieren wäre

# text
# c1: eo-radiometry
# c2: ascent-losses
seg-2e0825b27359 = die Arten <c1/> und <c2/> berechnen Budgets ohne Erdposition

# text
seg-1f17b963c7a6 = eine STK-Ephemeride beschreibt Position und Geschwindigkeit eines Fahrzeugs gegen die Zeit; diese Szene hat nur feste Punkte oder zeitlose Spuren (ein fester Punkt ist eine STK-Facility, keine Ephemeride)

# text
seg-f79d0ce7b945 = kein Mitgliedsszenario der Kampagne hat etwas, das dieses Format beschreibt; exportieren Sie ein Mitglied für sich, um seinen Grund zu sehen

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pnt-chain
seg-08b7e027318a = die Art <c1/> analysiert Signalentwürfe (Spektren, Tracking, Akquisition, Kompatibilität) ohne Satelliten- oder Nutzerposition; exportieren Sie das Szenario <c2/> oder <c3/>, das den Entwurf fliegt

# text
# c1: leo-pass
# c2: leo-pnt-chain
seg-31c8acef1aed = in dieser Version nicht exportiert: Die fusionierten Positionierungsarten legen ihre Satelliten in ein erdfestes Bezugssystem relativ zu einer Epoche, die sie nie nennen, sodass ein zeitmarkierter Export das Kalenderdatum erfinden müsste (exportieren Sie stattdessen das Szenario <c1/> oder <c2/>)

# text
seg-3c57b084f0d7 = die Geometrie der Art ist auf den Mond, den Mars oder einen anderen Körper des Sonnensystems zentriert; CZML, KML und GeoJSON beschreiben Positionen auf oder um die Erde, und diese Version schreibt STK-Ephemeriden nur mit CentralBody Earth

# text
# c1: constellation-design
seg-2edebe91839c = in dieser Version nicht exportiert: <c1/> legt seine Satelliten in ein körperfestes Bezugssystem relativ zu einer Epoche, die es nie nennt, sodass ein zeitmarkierter Export das Kalenderdatum erfinden müsste

# text
# c1: earth-gnss-lunar
seg-951ac7c5f138 = in dieser Version nicht exportiert: Die Erd-Konstellation des Global Navigation Satellite System (GNSS) von <c1/> wird von einem Empfänger in Monddistanz aus gesehen, dessen Trajektorie die Art nicht als Zeitreihe bereitstellt

# text
# c1: entry-heating
seg-3cf7f7460c55 = in dieser Version nicht exportiert: Die Art <c1/> meldet Spitzenlasten und Erwärmung und führt keine zeitmarkierte Bodenspur

# text
# c1: gnss-ssv
seg-cfc3df59e5c8 = die Art <c1/> durchfährt Verfügbarkeit und Linkstärke für einen Nutzer auf einer Schale oder einer Kepler-Trajektorie; sie hat keine einzelne Position, die auf einer Karte zu platzieren wäre

# text
# c1: launch-window
seg-6271953188bd = das Szenario <c1/> gibt die Breite des Startplatzes an, aber keine Länge, daher kann der Standort nicht platziert werden

# text
# c1: leo-navmsg
# c2: theta0_deg
seg-c9a63dfb34db = in dieser Version nicht exportiert: Die Wahrheitsbahn von <c1/> ist eine Anpassungsreferenz, deren Erdrotationswinkel zur Epoche eine Eingabe ist (<c2/>, Standard { "0" }) und nicht aus dem Kalenderdatum abgeleitet wird, sodass ihre erdfesten Positionen nicht an ein Datum gebunden sind

# text
seg-a03c2f0426db = dieses Spektrumszenario hat keinen Block [iq], daher werden keine Abtastwerte zur Aufnahme synthetisiert

# text
# c1: oem-interop
seg-d75f8ad6903a = in dieser Version nicht exportiert: <c1/> liest und schreibt eine Orbit Ephemeris Message des CCSDS (Consultative Committee for Space Data Systems), die selbst die Austauschdatei für Ephemeriden ist

# text
# c1: optical-atmosphere
seg-fdbaf96ecf3e = die Art <c1/> berechnet Linkstatistiken für Bodenstandorte ohne zeitmarkierte Geometrie, die zu platzieren wäre

# text
seg-146a2e8ee590 = das Szenario durchfährt ein anderes Szenario über ein Gitter; exportieren Sie das durchfahrene Szenario für sich

# text
# c1: time-transfer-budget
seg-b74484e3586b = die Art <c1/> berechnet ein Link-Budget und Stabilitäten, ohne zeitmarkierte Geometrie, die zu platzieren wäre

# text
seg-bcd613e62c69 = <s1>Zurück</s1>Animationsexport

# text
seg-0525f7fbbfd2 = <s1>Weiter</s1>Validierungsstatus

# text
seg-53a778722c16 = STK .e
