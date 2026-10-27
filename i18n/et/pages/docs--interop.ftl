# docs--interop: translations (et)

# text
seg-f917e7fcac09 = Mis see on

# text
seg-cae10fb9bff8 = Stsenaarium

# text
seg-f2ce7fc60cdf = Vorming

# text
seg-8c718f7f9f5d = SigMF

# text
seg-507b8c235614 = CZML

# text
seg-bf09433a7342 = GeoJSON

# text
seg-9c92e0bc42aa = KML

# text
seg-b03d56f501c3 = Liik

# text
seg-357c2320b43a = jah

# text
# c1: docs/INTEROP.md
seg-c8c964a11462 = Allikas: <c1/>

# text
# c1: --export
seg-881ec6f8fbe0 = Käivitus kirjutab tulemusdokumendi, diagrammi ja aruande. <c1/> kirjutab ka stsenaariumi geomeetria või selle sünteesitud signaali vormingutes, mida teised tööriistad juba loevad: gloobusevaatur, töölauakaart, geoinfosüsteem (GIS), missioonianalüüsi pakett või tarkvaraliselt defineeritud raadio (SDR) tööriist. Siin ei loe miski kella ega võrku ja ükski eksport ei kanna genereerimise ajatemplit, nii et sama stsenaarium annab igal käivitusel baidi-baidilt identsed failid.

# text
# c1: jamming-demo.czml
# c2: jamming-demo.kml
# c3: jamming-demo.geojson
# c4: jamming-demo.<object>.e
# c5: jamming-demo.e
# c6: l-band-waterfall-jamming.sigmf-meta
# c7: .sigmf-data
# c8: --study-name
seg-736f2dc67a3c = Failid kirjutatakse stsenaariumi kõrvale, nimega nagu tulemusdokument: <c1/>, <c2/>, <c3/>, üks <c4/> iga liikuva objekti kohta (või <c5/>, kui see on üks), ja paar <c6/> / <c7/>. Võtmega <c8/> kasutavad need uuringu nime, nagu teised väljundid.

# text
# c1: all
# c2: kshana::interop::export(src, format)
# c3: kshana::interop::plan(src)
# c4: kshana::interop::geojson::apply_route(src, geojson)
# c5: export_interop
# c6: list_export_formats
# c7: import_route
# c8: mcp/kshana-mcp/README.md
seg-21d3fba059d5 = Selgesõnaliselt nimetatud vorming, mis stsenaariumile ei kehti, on viga, mis trükib põhjuse; võtme <c1/> korral trükitakse põhjus ja vorming jäetakse vahele. Teegi sisendpunktid on <c2/>, <c3/> ja <c4/>; need võtavad stsenaariumi teksti ja tagastavad baite, ühtegi faili puudutamata, mistõttu need töötavad ka WebAssembly versioonis. Model Context Protocol (MCP) server pakub samu kolme tööriistadena <c5/>, <c6/> ja <c7/> (vt <c8/>).

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
seg-77200201db88 = Kood: <c1/> (<c2/> ehitab stsenaariumist ühe geomeetrilise kirjelduse, <c3/>, <c4/>, <c5/> ja <c6/> kirjutavad selle), <c7/> ja <c8/> signaali jaoks. Testid: <c9/>.

# text
seg-f13ab6bb2e47 = Vormingud

# text
seg-fc52229b569c = Järgitav spetsifikatsioon

# text
seg-3f237c8956eb = Cesium Language: JSON (JavaScript Object Notation) massiiv ajamärgendiga pakettidest, mida loeb CesiumJS

# text
# c1: gx:Track
seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, Open Geospatial Consortiumi (OGC) standard, mida loevad Google Earth ja enamik GIS-tööriistu; ajamärgendiga rajad kasutavad Google'i laiendust <c1/>

# text
# c1: http://www.opengis.net/kml/2.2
# c2: http://www.google.com/kml/ext/2.2
seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (skeemi nimeruum <c1/>; laienduse nimeruum <c2/>)

# text
seg-4cfac7667dbc = geograafiline JSON, Internet Engineering Task Force'i (IETF) Request for Comments (RFC) { "7946" }

# text
# c1: .e
seg-de0feb450ae1 = STK <c1/>

# text
# c1: EphemerisTimePosVel
seg-96173e7b4238 = Ansys Systems Tool Kiti (STK) efemeriidifail, aja-asukoha-kiiruse vorm <c1/>

# text
seg-a2284e8c0034 = Signal Metadata Format: JSON-metaandmete fail ja kompleksete faasi- ja kvadratuurvalimite (IQ) toorfail

# text
seg-b38ee3ebd012 = Mida iga fail sisaldab

# text
seg-7d873bc11593 = Iga georuumiline vorming kirjutatakse samast stseenist, seega ei saa need olla erinevat meelt selles, kus miski asub. Stseenis on kuni neli liiki objekte:

# text
seg-1fc686f6a7ea = <b>Liikuvad objektid</b> — satelliidid ja kasutajaplatvorm, kui see liigub — diskreeditud stsenaariumi enda ajavõrgul liigi käivituse kasutatavate propagaatoritega.

# text
seg-3db28cb6adc5 = <b>Fikseeritud kohad</b> — vastuvõtja, maajaam, segaja või kohaliku navigatsioonisüsteemi alguspunkt.

# text
seg-0def04909935 = <b>Ajata rajad</b> — teekonnapunktid, mida maastiku-, gravitatsiooni- või kombineeritud alternatiivse positsioneerimise, navigatsiooni ja aja (PNT) liik lendab. Neil liikidel ei ole ajatelge, seega rajad ei kanna ühtegi.

# text
# c1: jamming
seg-e14d49ae7330 = <b>Segaja jalajäljed</b> — liigi <c1/> jaoks kaks ringi segaja ümber: maapealne ulatus, mille sees zeniidis olev satelliit (kõige tugevam) langeb alla jälgimisläve, nii et kõik satelliidid kaovad, ja ulatus, mille sees kõrgusmaskil olev satelliit (kõige nõrgem) seda teeb, nii et jälgimine hakkab ebaõnnestuma. Mõlemad tulevad liigi enda lingivõrranditest (Kaplan ja Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3. väljaanne, §{ "9.4" }), segaja asukoht vastuvõtja silmapiiril ja vabaruumi sumbuvusega, ning testikomplekt kontrollib, et tõhus kandja ja müratiheduse suhe igal raadiusel võrdub lävega { "1e-6" } dB täpsusega. Ring joonistatakse Maa keskmise raadiusega sfäärile.

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
seg-e1dd97c47993 = Esimene pakett on dokumendipakett (<c1/>, <c2/>) ajavõrku katva kellaga. Iga liikuv objekt on pakett, mille <c3/> sisaldab ISO { "8601" } (rahvusvahelise standardiorganisatsiooni kuupäeva ja kellaaja vorming) UTC (koordineeritud maailmaaeg) <c4/>, <c5/> <c6/> ja <c7/> valimeid <c8/>: sekundid epohhist, meetrid geotsentrilises taevases tugisüsteemis (GCRS). CesiumJS võtab <c9/> rahvusvahelise taevase tugisüsteemina (ICRF), mille teljed GCRS jagab. Fikseeritud kohad ja jalajälgede keskpunktid on konstantsed Maaga seotud <c10/> asukohad väärtusega <c11/> <c12/>. Jalajälg on <c13/>, mille mõlemad pooltelge võrduvad selle raadiusega; ajata rada maapinnale kinnitatud <c14/>. Iga paketi <c15/> ütleb tugisüsteemi sõnadega uuesti.

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
seg-be6362f4c7e7 = Üks <c1/> ühe <c2/>-ga objektiklassi kohta. Liikuv objekt on <c3/>, mis sisaldab <c4/>: üks <c5/> valimi kohta (ISO { "8601" } UTC), seejärel üks <c6/> valimi kohta (pikkuskraad, laiuskraad, kõrgus). Kohad on <c7/>-id, jalajäljed <c8/>-id, mille rõngas on suletud ja vastupäeva, ajata rajad <c9/>-id. Koordinaadid on World Geodetic System { "1984" } (WGS { "84" }) pikkus- ja laiuskraad kümnendkraadides ja kõrgus meetrites WGS { "84" } ellipsoidi kohal, kirjutatud kujul <c10/> <c11/>. KML loeb <c12/> kõrgusena keskmise merepinna kohal; vahe, geoidi undulatsioon, on umbes ±{ "110" } m piires ja seda ei rakendata. Dokumendi kirjeldus ütleb seda.

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
seg-37dc14626a6c = Üks <c1/>. Asukohad on <c2/> või <c3/> — pikkuskraad esimesena, nagu RFC { "7946" } nõuab — WGS { "84" } kraadides, kõrgus meetrites ellipsoidi kohal. Liikuv objekt on <c4/> omadusega <c5/>, mis sisaldab ühte ISO { "8601" } aega asukoha kohta; rada, mis ristub { "180" }° meridiaani, kirjutatakse seal lõigatud <c6/>-ina, nagu RFC { "7946" } §{ "3.1.9" } palub (ristumispunkt interpoleeritakse ja <c7/> loetleb seejärel ainult algsed valimid). Kohad on <c8/>-id, jalajäljed <c9/>-id suletud vastupäeva välisrõngaga (§{ "3.1.6" }), ajata rajad <c10/>-id. Igal objektil on omadus <c11/>, mis nimetab iga arvulise liikme ühiku.

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
seg-ea28a2bd431c = Üks fail liikuva objekti kohta, kuna STK efemeriid kirjeldab ühte sõidukit. Päis annab <c1/> (võrdne andmeridade arvuga), <c2/> (UTC, <c3/>), <c4/> koos <c5/>, <c6/>, <c7/> ja <c8/>; read all <c9/> on sekundid epohhist, asukoht meetrites ja kiirus meetrites sekundis GCRS-is. Stseen, kus on ainult fikseeritud kohad või ajata rajad, ei kirjuta <c10/> faili: fikseeritud punkt on STK Facility, mitte efemeriid. Id, mis ei ole tavaline failinime osa (konstellatsiooni kest ja satelliit, <c11/>), kirjutatakse iga muu märgiga kui <c12/>, nummerdatud, kui kaks id-d seejärel kokku langevad.

# text
# c1: leo-pass
# c2: leo-pnt-chain
# c3: [pass]
seg-52a78be5db9f = Liik <c1/> ja liik <c2/> (selle etapi <c3/> kaudu) ekspordivad iga madala Maa orbiidi (LEO) satelliidi ja kasutaja liigi enda propagaatoritest ja ajavõrgust. Liik töötab ECI0-s, Maa-tsentrilises inertsiaalsüsteemis, mis on epohhil joondatud Maaga seotud süsteemiga; iga valim pööratakse Maaga seotud süsteemi selle enda ajal liigi Maa pöörlemisega ja sealt GCRS-i läbi tõelise ekvaatori ja keskmise pööripunkti (TEME) süsteemi, milles Simplified General Perturbations { "4" } (SGP4) propagaator väljundi annab, sellel hetkel, kusjuures UT1 (maailmaaeg, Maa pöördenurk) võetakse võrdseks UTC-ga ja polaarliikumist eiratakse, nagu teiste eksportide puhul. Teised LEO liigid ütlevad, miks vorming ei kehti (allolev tabel).

# text
# c1: campaign
# c2: <phase>
# c3: <phase>-<k>
# c4: sweep
# c5: monte-carlo
# c6: campaign-shared-jammer-sea-road.toml --export kml
# c7: campaign-shared-jammer-sea-road.ship-strait.kml
# c8: campaign-shared-jammer-sea-road.car-coast-road.kml
seg-b134baf33fba = <c1/> ekspordib iga geomeetriaga liikmestsenaariumi oma failikomplektina, liikme silt lisatud vormingu laiendi ette: iga faasi käivitus (<c2/> või <c3/>, kui faasil on mitu käivitust), pühkimise baasstsenaarium (<c4/>), Monte Carlo stsenaarium (<c5/>) ja iga komponeeritud liige (selle silt, koos seotud jagatud väärtustega, mis on sisse kirjutatud). <c6/> kirjutab <c7/> ja <c8/>. Liige, mis on identne varasemaga, kirjutatakse üks kord, ja väärtusi, mida kampaania rakendab käivitusajal (üleandmised, pühkimisväärtused, algväärtused (seed)), ei ole eksporditud liikmes. Vorming kehtib kampaaniale, kui see kehtib mõne liikme kohta; vastasel juhul on põhjus allpool oleva tabeli märkus { "4" }. Vt <a1>CAMPAIGNS.md</a1>.

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
seg-6579b6941d10 = Liigi <c1/> hetktõmmis <c2/> — modelleeritud L-riba, joonistatud kompleksvalimitena ühel hetkel — paarina <c3/> / <c4/>, andmetüübis, mille nimetab <c5/> (<c6/> või <c7/>). See on sama salvestis, mille käivitus kirjutab ja loeb tagasi oma järjepidevuskontrolliks: eksporditud metaandmed võrduvad tulemusdokumendi plokiga <c8/> ja andmefailil on pikkus <c9/>. Kirjutaja on <c10/>, moodul, mida liik <c11/> juba kasutas; midagi ei dubleerita.

# text
seg-6e7c5f0e34f3 = Tugisüsteemid ja aeg

# text
# c1: nutation::teme_to_gcrs
# c2: frames::teme_to_ecef
seg-01d1bedb0595 = Mootor propageerib TEME-s (tõeline ekvaator, kuupäeva keskmine pööripunkt), oma natiivses süsteemis. Liikuvad objektid pööratakse GCRS-i redutseerimisega <c1/> (IAU { "2006" } pretsessioon ja IAU 2000B nutatsioon, kus IAU on Rahvusvaheline Astronoomia Liit), mis taastoodab Vallado avaldatud TEME-st GCRF-i (geotsentriline taevane tugisüsteem) näite täpsusega { "0.11" } m, CZML-i ja STK jaoks, ning Maaga seotud süsteemi funktsiooniga <c2/> KML-i ja GeoJSON-i jaoks. Maaga seotud pööre on Greenwichi keskmine tähtnurk, kus UT1 võetakse võrdseks UTC-ga ja polaarliikumist ei rakendata — sama redutseerimine, mida kasutab SP3 (Standard Product { "3" }) eksport. GPS-orbiidi raadiusel nihutab eiratud UT1−UTC kuni { "0.9" } s satelliidi pikkuskraadi kuni umbes { "1.7" } km; maajaamu see ei mõjuta, kuna need on antud laius- ja pikkuskraadis.

# text
# c1: ephemeris
seg-4eaa7b3e6946 = Liik <c1/> on erand: selle mootori väljund kannab juba GCRS-i ja Maaga seotud asukohti (stsenaariumi UT1−UTC ja polaarliikumisega või päris International Earth Rotation and Reference Systems Service'i (IERS) reaga) ning need kirjutatakse muutmata kujul.

# text
seg-2299da743a4c = Iga aeg on UTC. Liigsekundeid ei modelleerita: nihe üle liigsekundi loetakse nii, nagu igal päeval oleks { "86 400" } s, nagu mootori ajavõrgud loevad.

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
seg-4f7a0b8b4358 = Epohh <c1/> on see, mida liigi käivitus kasutab, ja iga fail nimetab selle: liigi <c2/> väli <c3/>; kui see puudub, varaseim epohh, mida satelliitide enda andmed kannavad (kaherealise elemendikomplekti (TLE) epohh, edastatava efemeriidi etalonaeg, SP3 faili algus), ning 2000-01-01T00:{ "00" }:00Z ainult siis, kui ükski satelliit seda ei kanna (Kepleri elemendid). SP3 ja OEM (Orbit Ephemeris Message) eksport säilitavad stsenaariumi puhul ilma <c4/> väärtuse 2000-01-01T00:{ "00" }:00Z, nii et sellise stsenaariumi puhul nende kuupäevad erinevad nende failide omadest. Stsenaariumi <c5/> puudumisel pööratakse iga satelliit, mis kannab oma epohhi, GCRS-i ja Maaga seotud süsteemi oma hetkel (selle epohh pluss <c6/>), kuna sellele kuupäevale kuulub selle TEME asukoht; kus satelliitide epohhid erinevad, järgivad jagatud ajamärgendid mootori eeldust, et iga satelliit algab hetkel <c7/>, ja fail ütleb, mitme tunni võrra need erinevad. Liikide <c8/> ja <c9/> Walkeri konstellatsioonide SGP4 elemendi epohh (2018-06-12T00:{ "00" }:00Z), mida nende käivitused kasutavad ka Maa pöörlemiseks; liigi <c10/> <c11/>; liigi <c12/> <c13/> või TLE epohh. Liigil <c14/> ei ole kalendriepohhi; selle eksport dateerib <c15/> nagu orbiidistsenaarium ilma selleta.

# text
# c1: G01
# c2: G02
seg-ee8eeb47f41b = Satelliidid säilitavad positsioonilised identifikaatorid <c1/>, <c2/>, ... mille SP3 ja OEM eksport neile annab, kuna propagaatorid ei kanna TLE nimeridu.

# text
seg-0491624c5f12 = Impordid

# text
seg-798f3ae1b77d = GeoJSON marsruut.

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
seg-2a04d7d4bafc = <c1/> (teek: <c2/>) loeb GeoJSON-dokumendi esimese <c3/> — üksik geomeetria, <c4/> või <c5/> — ja kirjutab selle liikide <c6/>, <c7/>, <c8/> ja <c9/> rajasisenditesse (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) enne käivitust. Need liigid lendavad <c15/>, seega marsruut aktsepteeritakse, kui see on täpselt see: selle kaks otsa (stsenaariumi <c16/> arv säilitatakse) või kolm või rohkem asukohta, mis on ühtlaselt paigutatud sirgjoonele laius- ja pikkuskraadis, täpsusega { "1e-7" } kraadi (umbes { "1" } cm). Iga teine marsruut lükatakse tagasi ja viga nimetab joonest kõige kaugema asukoha. Marsruut liigile, millel ei ole trajektoorisisendit, lükatakse selle põhjusega tagasi. Pikkus- ja laiuskraadi vahemikku kontrollitakse, mis tabab laiuskraad-ees faili.

# text
# c1: spectrum
# c2: [recording]
# c3: .sigmf-meta
# c4: .sigmf-data
# c5: src/sigmf.rs
# c6: kshana::sigmf::read
seg-be9fddebd47a = <b>SigMF salvestis.</b> Liigi <c1/> plokk <c2/> loeb paari <c3/> / <c4/> läbi <c5/> ja joonistab selle Welchi hinnangu mudeli kõrvale (vt <a1>SPECTRUM.md</a1>). Failide lugemine on natiivse ehituse funktsioon; WebAssembly ehitus võtab baidid läbi <c6/>.

# text
seg-f1ca9cee1065 = Kuidas eksporte kontrollitakse

# text
# c1: tests/interop_formats.rs
seg-afe73c19e369 = <c1/> sõelub iga ekspordi valideerijaga, mis on kirjutatud vormingu spetsifikatsiooni järgi, mitte kirjutaja enda koodiga:

# text
# c1: version
# c2: referenceFrame
# c3: FIXED
# c4: INERTIAL
# c5: [t, x, y, z, ...]
seg-bdc892a450c0 = CZML: JSON-massiiv, mille esimene pakett on dokumendipakett väljaga <c1/>; unikaalsed paketi identifikaatorid; iga asukoht ütleb <c2/> <c3/> või <c4/>; diskreeditud asukohad on <c5/> ISO { "8601" } epohhi ja kasvavate aegadega.

# text
# c1: lon,lat[,alt]
# c2: altitudeMode
# c3: styleUrl
# c4: gx:Track
# c5: <when>
# c6: <gx:coord>
seg-a28abb42c103 = KML: korrektselt vormistatud XML (Extensible Markup Language) dokument OGC KML { "2.2" } nimeruumis ühe juurobjektiga; skeemi elementide järjekord Placemark'is; kuni üks geomeetria Placemark'i kohta; suletud lineaarsed rõngad neljast või enamast asukohast; <c1/> korteežid vahemikus; kehtivad <c2/> väärtused; <c3/>-id, mis lahenduvad; <c4/>, millel on sama palju <c5/> kui <c6/>, ja deklareeritud laienduse nimeruum.

# text
# c1: crs
# c2: units
seg-8e0f4e4c2309 = GeoJSON: pikkuskraad esimesena ja vahemikus, laiuskraad vahemikus, kaks või kolm arvu asukoha kohta, joonestringid kahest või enamast asukohast, suletud vastupäeva välisrõngad, ükski lõik ei ristu { "180" }° meridiaani, ei ole liiget <c1/>, igal objektil on omadus <c2/>.

# text
# c1: stk.v.
# c2: BEGIN Ephemeris
# c3: END Ephemeris
# c4: DistanceUnit Meters
# c5: NumberOfEphemerisPoints
seg-57bf7f9291e1 = STK: versioonirida <c1/>, plokk <c2/> / <c3/> nõutud märksõnadega, <c4/>, <c5/> võrdne andmeridade arvuga, seitse arvu rea kohta, kasvavad ajad.

# text
# c1: core:datatype
# c2: core:version
# c3: global
# c4: captures
# c5: annotations
# c6: core:sample_start
seg-e474c11480d8 = SigMF: <c1/> ja <c2/> massiivides <c3/>, <c4/> ja <c5/>, <c6/> igal püüdmisel ja täisvalimitest andmefail.

# text
# c1: ephemeris
# c2: orbit-sgp4-gps
# c3: orbit-sgp4-gps
# c4: sgp4
# c5: orbit-rinex
# c6: jamming
seg-82b7b39e7cad = Peale struktuuri võrreldakse CZML-i ja STK-sse eksporditud satelliiti mootori enda olekuga pärast sama tugisüsteemi redutseerimist ning see ühtib { "1" } mm täpsusega asukohas (failid kannavad { "0.1" } mm): liigi <c1/> enda GCRS-i väljundi vastu ja konstellatsiooni <c2/> sõltumatu TEME-st GCRS-i propageerimise vastu, iga satelliit dateeritud oma TLE epohhiga, mis on loetud stsenaariumi tekstist. Kaks kontrolli lähevad mootorist välja: esimese <c3/> satelliidi CZML-i asukohad ühtivad täpsusega { "0.1" } m (mõõdetud { "2.3" } cm) sama TLE-ga, mida propageeris Pythoni pakett <c4/> ja redutseeris GCRS-i ERFA (Essential Routines for Fundamental Astronomy, IAU SOFA teegi avatud realisatsioon), ning <c5/> satelliitide Maaga seotud asukohad võrduvad Global Positioning Systemi liidesespetsifikatsiooni edastatava efemeriidi asukohtadega täpsusega { "1" } mm. Ekspordi <c6/> Maaga seotud asukohti võrreldakse asukohtadega, mida segamiskäivitus hindab, täpsusega { "5" } mm. GeoJSON-i marsruut käib rajastsenaariumi kaudu edasi-tagasi, SigMF-i paar loetakse tagasi samadeks baitideks ja iga eksport on baidi tasemel deterministlik.

# text
seg-20fbf9a3fba7 = Need on kontrollid avaldatud spetsifikatsioonide ja mootori enda vastu. Faile ei ole testikomplekti osana CesiumJS-i, Google Earthi, Ansys STK-sse ega SDR-tööriista laaditud, seega nende tööriistade konkreetse versiooni poolt vastuvõtmist siin ei testita.

# text
seg-7349c09206ac = Orbiidi, asendi ja tuumade vahetus (teek, { "0.36" })

# text
# c1: --export
seg-d5e34188aa96 = Lisaks vormingutele <c1/> lisas { "0.36" } teegi lugejad ja kirjutajad standardfailidele, mida missioonianalüüsi tööriistad vahetavad. Need võtavad ja tagastavad teksti või baite ega puuduta ühtegi faili. Iga neist on <a1>kontrollimaatriksi</a1> VALIDATED rida, mis on kontrollitud seal nimetatud sõltumatu realisatsiooni vastu:

# text
# c1: kshana::odm
# c2: kshana::ndm_xml
seg-cd8b6f2d43be = <b>CCSDS-i orbiidiandmesõnumid</b> (<c1/>, XML-vormi jaoks <c2/>): OPM, OMM ja OCM võtme-väärtuse kirjaviisis (KVN) ja NDM/XML, vastavalt CCSDS 502.0-B-3 (OPM ja OMM versioonid { "3.0" } ja { "2.0" }, OCM { "3.0" }). Kontrollitud mõlemas suunas Orekiti vastu: Orekit loeb Kshana faile ja Kshana loeb Orekiti faile. Allesjäänud leiud on fikseeritud testidega.

# text
# c1: kshana::adm
# c2: kshana::ndm_xml
seg-00b9fc226c06 = <b>CCSDS-i asendiandmesõnumid</b> (<c1/>, koos <c2/>): AEM ja APM vastavalt CCSDS 504.0-B-2, KVN-is ja NDM/XML-is. Kontrollitud Orekiti vastu samamoodi ning kirjete pöörded Orekiti omade vastu.

# text
# c1: kshana::spk_writer
seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): NAIF SPK segmentide tüüpide { "9" } ja { "13" } (koos CCSDS OEM-i eksportimisega SPK tuumaks) ning tüüpide { "3" } ja { "21" } (Tšebõšovi polünoomid ja laiendatud vaheread) kirjutajad ja lugejad, mida on kontrollitud NAIF SPICE tööriistakomplekti enda lugejate vastu baidi-identsuseni. Kshana kirjutab segmendid temale antud kirjetest: ta ei sobita Tšebõšovi koefitsiente ega koosta vahelugusid.

# text
seg-bb97cbb1ab9f = CCSDS OEM-i importija ja kirjutaja ning OEM-i kovariatsiooniplokk on vanemad ja neid kirjeldatakse ülalolevate importide all ning maatriksis.

# text
# c1: CentralBody Earth
seg-8932eba75c68 = Geomeetriat eksporditakse ainult allolevas tabelis olevatest liikidest. Liike, mille geomeetria on keskendunud Kuule, Marsile või muule kehale, ei ekspordita: CZML, KML ja GeoJSON kirjeldavad asukohti Maa ümber ning see väljalase kirjutab STK faile ainult väärtusega <c1/>, kuigi STK vorming ise lubab ka teisi keskkehi.

# text
# c1: constellation-design
# c2: earth-gnss-lunar
# c3: oem-interop
seg-a0593ad77202 = Liikidel <c1/>, <c2/> ja <c3/> on Maaga seotud geomeetria, mida see väljalase ei ekspordi; tabel annab iga kohta põhjuse.

# text
# c1: gnss-ins
seg-2bb9237839f3 = Liik <c1/> lendab oma trajektoori lameda kohaliku puutujatasandi peal, mistõttu eksporditakse ainult tasandi alguspunkt, mitte trajektoor.

# text
seg-6049ab4ca3c9 = Maaga seotud satelliidiasukohad eiravad UT1−UTC-d ja polaarliikumist (vt Tugisüsteemid ja aeg); KML kõrgused on ellipsoidsed, mitte keskmise merepinna kohal.

# text
seg-4dda05aefd2b = Jalajäljed eeldavad vabaruumi levi, segajat vastuvõtja silmapiiril ja sfäärilist Maad ringi jaoks.

# text
seg-2dd0656c518f = Iga stsenaariumifail

# text
# c1: kshana <scenario> --export <format>
# c2: scenarios/
# c3: cargo run --bin gen_validation_artifacts
# c4: tests/interop_formats.rs
seg-e024f5c1cab1 = Mida <c1/> teeb iga faili jaoks kaustas <c2/> (komplekti manifest ei ole stsenaarium ja on välja jäetud). „jah“ tähendab, et vorming kirjutatakse ja läbib oma valideerija; vastasel juhul osutab number põhjusele. Genereerib <c3/>; <c4/> ebaõnnestub, kui see on aegunud.

# text
seg-c27f67dfbb37 = ei [{ "1" }]

# text
seg-3468244e2385 = ei [{ "2" }]

# text
seg-d0cf3f74cd10 = ei [{ "3" }]

# text
seg-62c880979169 = ei [{ "4" }]

# text
seg-9229b499c702 = ei [{ "5" }]

# text
seg-d9d6561c9e5b = ei [{ "6" }]

# text
seg-7d4a6538c638 = ei [{ "7" }]

# text
seg-f170ed4d8dca = ei [{ "8" }]

# text
seg-1c5eb5dca942 = ei [{ "9" }]

# text
seg-a930bb0d2e42 = ei [{ "10" }]

# text
seg-236853169f42 = ei [{ "11" }]

# text
seg-411e4f3aeae7 = ei [{ "12" }]

# text
seg-34fabcbb82f2 = ei [{ "13" }]

# text
seg-772bd344bbce = ei [{ "14" }]

# text
seg-460fd74c7c7e = ei [{ "15" }]

# text
seg-e1d91ce54b8b = ei [{ "16" }]

# text
seg-f3e0486f02e3 = ei [{ "17" }]

# text
seg-884160b0ed12 = ei [{ "18" }]

# text
seg-8202f4a426b0 = ei [{ "19" }]

# text
seg-a4e9a36289e5 = ei [{ "20" }]

# text
seg-034364e38105 = ei [{ "21" }]

# text
seg-3e3b6ecc7b43 = Miks vorming ei kehti:

# text
# c1: contact-schedule
# c2: acm-link
# c3: passes
seg-d7bd20cb8710 = liigid <c1/> ja <c2/> planeerivad allalingi kontakte ja kodeerimist; sama satelliidi ja jaama geomeetria nägemiseks tuleb eksportida stsenaarium <c3/>

# text
# c1: spectrum
seg-f587b4df1635 = SigMF sisaldab komplekseid baasribasignaali valimeid, mida sünteesib ainult liik <c1/>

# text
# c1: aocs
seg-d102fb18ce8d = liik <c1/> simuleerib asendit massikeskme ümber ilma orbiidi või maapealse asukohata, seega ei ole midagi, mida Maale paigutada

# text
seg-ecc0e31b0369 = stsenaariumi sisend ei kanna horisontaalset asukohta (ei laius- ja pikkuskraadi, ei Maa-tsentrilisi koordinaate, ei orbiidielemente, välja arvatud kõige rohkem kõrgus), seega ei ole midagi, mida Maale paigutada

# text
# c1: eo-radiometry
# c2: ascent-losses
seg-2e0825b27359 = liigid <c1/> ja <c2/> arvutavad energiabilansse ilma Maa asukohata

# text
seg-1f17b963c7a6 = STK efemeriid kirjeldab sõiduki asukohta ja kiirust ajas; sellel stseenil on ainult fikseeritud punktid või ajata rajad (fikseeritud punkt on STK Facility, mitte efemeriid)

# text
seg-f79d0ce7b945 = kampaania ühelgi liikmestsenaariumil ei ole midagi, mida see vorming kirjeldab; põhjuse nägemiseks tuleb liige eraldi eksportida

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-pnt-chain
seg-08b7e027318a = liik <c1/> analüüsib signaalikavandeid (spektrid, jälgimine, hankimine, ühilduvus) ilma satelliidi või kasutaja asukohata; tuleb eksportida stsenaarium <c2/> või <c3/>, mis kavandiga lendab

# text
# c1: leo-pass
# c2: leo-pnt-chain
seg-31c8acef1aed = selles väljalaskes ei eksporditud: liitpositsioneerimise liigid paigutavad oma satelliidid Maaga seotud süsteemi epohhi suhtes, mida nad kunagi ei nimeta, seega peaks ajamärgendiga eksport kalendrikuupäeva välja mõtlema (selle asemel tuleb eksportida stsenaarium <c1/> või <c2/>)

# text
seg-3c57b084f0d7 = liigi geomeetria on keskendunud Kuule, Marsile või muule päikesesüsteemi kehale; CZML, KML ja GeoJSON kirjeldavad asukohti Maal või selle ümber ning see väljalase kirjutab STK efemeriide ainult väärtusega CentralBody Earth

# text
# c1: constellation-design
seg-2edebe91839c = selles väljalaskes ei eksporditud: <c1/> paigutab oma satelliidid kehaga seotud süsteemi epohhi suhtes, mida see kunagi ei nimeta, seega peaks ajamärgendiga eksport kalendrikuupäeva välja mõtlema

# text
# c1: earth-gnss-lunar
seg-951ac7c5f138 = selles väljalaskes ei eksporditud: väärtuse <c1/> Maa globaalse satelliitnavigatsioonisüsteemi (GNSS) konstellatsiooni nähakse Kuu kaugusel asuvast vastuvõtjast, mille trajektoori liik ajareana ei esita

# text
# c1: entry-heating
seg-3cf7f7460c55 = selles väljalaskes ei eksporditud: liik <c1/> teatab tippkoormused ja kuumenemise ega hoia ajamärgendiga maapealset jälge

# text
# c1: gnss-ssv
seg-cfc3df59e5c8 = liik <c1/> pühib kättesaadavust ja lingi tugevust kasutaja jaoks kestal või Kepleri trajektooril; sellel ei ole ühte asukohta, mida kaardile paigutada

# text
# c1: launch-window
seg-6271953188bd = stsenaarium <c1/> annab stardikoha laiuskraadi, kuid mitte pikkuskraadi, seega ei saa kohta paigutada

# text
# c1: leo-navmsg
# c2: theta0_deg
seg-c9a63dfb34db = selles väljalaskes ei eksporditud: liigi <c1/> tõeline orbiit on sobitusetalon, mille Maa pöördenurk epohhil on sisend (<c2/>, vaikimisi { "0" }), mitte kalendrikuupäevast tuletatud, seega ei ole selle Maaga seotud asukohad kuupäevaga seotud

# text
seg-a03c2f0426db = sellel spektristsenaariumil ei ole plokki [iq], seega ei sünteesita salvestamiseks ühtegi valimit

# text
# c1: oem-interop
seg-d75f8ad6903a = selles väljalaskes ei eksporditud: <c1/> loeb ja kirjutab CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Message'i, mis on ise efemeriidi vahetusfail

# text
# c1: optical-atmosphere
seg-fdbaf96ecf3e = liik <c1/> arvutab lingistatistikat maajaamade jaoks, ilma ajamärgendiga geomeetriata, mida paigutada

# text
seg-146a2e8ee590 = stsenaarium pühib teist stsenaariumi üle võrgu; pühitud stsenaarium tuleb eraldi eksportida

# text
# c1: time-transfer-budget
seg-b74484e3586b = liik <c1/> arvutab sideliini energiabilansi ja stabiilsused, ilma ajamärgendiga geomeetriata, mida paigutada

# text
seg-bcd613e62c69 = <s1>Eelmine</s1>Animatsiooni eksport

# text
seg-0525f7fbbfd2 = <s1>Järgmine</s1>Valideerimise seis

# text
seg-53a778722c16 = STK .e
