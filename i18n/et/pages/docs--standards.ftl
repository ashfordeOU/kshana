# docs--standards: translations (et)

# text
seg-4a2ce9f33ab2 = kirjutamine

# text
seg-9120d3e96e5e = lugemine

# text
seg-5ad814c7ef9e = Märkused

# text
seg-aab745a65e76 = Moodul

# text
seg-bf09433a7342 = GeoJSON

# text
seg-906440b861cd = Kaader

# text
seg-32b620b3574e = Kasutus

# text
seg-8ba331635865 = Standardid ja koostalitlus

# text
# c1: docs/STANDARDS.md
seg-96a449a63d11 = Allikas: <c1/>

# text
seg-3ed65a16e7d0 = Kshana kõneleb GNSS (ülemaailmne satelliitnavigatsioonisüsteem), lennudünaamika ja ajastuse kogukondade standardseid vahetusvorminguid, et see saaks töötada koos RTKLIB-i (avatud lähtekoodiga reaalajas kinemaatilise positsioneerimise teek), gLAB-i, Ginani, GMAT-i (General Mission Analysis Tool), Orekit-i ja IGS (International GNSS Service) analüüsikeskuste tööriistadega, mitte privaatsel saarel. See leht seostab <b>vahetusvormingud</b>, mida mootor parsib või väljastab, neid realiseeriva mooduli ja autoriteetse spetsifikatsiooniga.

# text
# c1: VERIFICATION-MATRIX.md
seg-d1aa512ad4ee = See on piiratud vormingutega — asjadega, millel on lugemis-/kirjutussuund. Signaali- ja algoritmistandardid, mida mootor <em>realiseerib</em>, mitte ei parsi (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (varem Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), ARAIM (täiustatud vastuvõtja autonoomne terviklikkuse seire) WG-C (WG: töörühm) etalon, CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)), on tõendatud rida-realt hoopis failis <a1><c1/></a1>.

# text
seg-656920618fb7 = Vormingud, mida mootor kõneleb

# text
seg-4fe4920a3fa1 = Standard

# text
seg-d08f1943c53b = Suund

# text
seg-968a1d48364c = Spetsifikatsioon / autoriteet

# text
seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

# text
seg-68d762928f76 = loeb <b>ja</b> kirjutab

# text
seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, KVN (võti-väärtus-notatsioon) kuju

# text
# c1: parse_oem
# c2: tests/ccsds_reference.rs
# c3: COVARIANCE_START … COVARIANCE_STOP
# c4: COV_REF_FRAME
# c5: covariance_block_kvn
# c6: parse_covariance_block
# c7: src/oem.rs
seg-be700901c03e = Tabelina esitatud olekuvektori efemeriid, mida loevad GMAT, Orekit, STK (Systems Tool Kit). <c1/> loeb selle tagasi; <b>kontrollitud sõna-sõnalt CCSDS 502.0-B-3 Figure G-11 Blue Book näite taastamisega</b> (<a1><c2/></a1>). Valikuline { "6" }×{ "6" } positsiooni/kiiruse <b>kovariatsiooniplokk</b> (<c3/>, 21-elemendiline alumise kolmnurga KVN serialiseerimine valikulise <c4/>-ga) on nii kirjutatud (<c5/>) kui loetud (<c6/>), edasi-tagasi sümmeetriline (<a2><c7/></a2> testid).

# text
seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

# text
seg-8e9f975d443b = CCSDS 502.0-B-2, KVN kuju

# text
# c1: orbit
# c2: --export-omm <out.omm>
# c3: export_omm = true
# c4: tests/sp3_export_roundtrip.rs
seg-fb5218415d68 = SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: kaherealine elemendikomplekt) keskmiste elementide standardirajal avaldamine (keskmine liikumine, e, i, Ω, ω, M, BSTAR (orbiidilevitaja takistusliige)). CLI kaudu (CLI: käsurea liides) kättesaadav stsenaariumil <c1/> käskudega <c2/> või <c3/> (üks OMM iga TLE-ga määratletud satelliidi kohta, selle tegeliku NORAD (North American Aerospace Defense Command) id, COSPAR (Committee on Space Research) tähise ja epohhiga; <a1><c4/></a1>). XML (Extensible Markup Language) kuju ja lugeja on järgmised sammud.

# text
seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

# text
seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, KVN kuju

# text
# c1: tests/ccsds_reference.rs
seg-cd96db42ab43 = Kauguse / Doppleri / nurga jälgimiskirjed, mida DSN/ESTRACK (ESTRACK: European Space Tracking network) ülelend OD (orbiidi määramise) süsteemile esitab. <b>Kontrollitud sõna-sõnalt CCSDS 503.0-B-2 Figure E-9 Blue Book näite taastamisega</b> (<a1><c1/></a1>).

# text
seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

# text
seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

# text
# c1: spacepackets-py
# c2: src/space_packet.rs
seg-ed9c8bdddd6d = 6-oktetine TM/TC (TM: telemeetria; TC: telekäsk) esipäise kaadrimine, mida maapealsed süsteemid vahetavad. <b>Kodeerija reprodutseerib sõltumatu <c1/> teegi avaldatud baidipõhised testvektorid</b> (<a1><c2/></a1> testid).

# text
seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, täppisorbiidi vorming) / SP3-d</b> (täppisefemeriid)

# text
seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

# text
# c1: gps-ops
# c2: tests/sp3_export_roundtrip.rs
seg-8d1089fbd59d = Maa suhtes fikseeritud (ECEF) asukoha + kellaaja ajarida. Edasi-tagasi teisendus kontrollitud täpsuseni < { "0.5" } m päris <c1/> hetktõmmisel (<a1><c2/></a1>).

# text
seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (edastatud navigatsioon)

# text
seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (liidese juhtdokument), BeiDou ICD, GLONASS (Venemaa ülemaailmne satelliitnavigatsioonisüsteem) ICD)

# text
# c1: Propagator
seg-1b7710db3abf = Mitme GNSS-i NAV sisestus (GPS LNAV (pärandnavigatsioonisõnum), Galileo F/NAV, QZSS (Jaapani Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: keskmine Maa orbiit; IGSO: kaldus geosünkroonne orbiit), GLONASS olekuvektor); kasutatav esmaklassilise <c1/> allikana.

# text
seg-44991b52d1ff = <b>TLE / 3LE</b> (kahe-/kolmerealised elemendid)

# text
seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

# text
seg-8d4dd42edc89 = Levitatud kontrollitud SGP4/SDP4 (SDP4: Simplified Deep-space Perturbations { "4" }) tuumaga ({ "4.12" } mm versus { "666" } ametlikku AIAA vektorit).

# text
seg-498aac915067 = <b>RINEX 3.0x</b> (vaatlus)

# text
seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } peaks parsima, kunagi ei ole { "4.00" } failiga kasutatud)

# text
# c1: parse_obs
# c2: pvt
# c3: tests/pvt_abmf.rs
seg-ac97f77f142c = RINEXi teine pool: vastuvõtja enda kood/kandja/Doppler/SNR (SNR: signaali ja müra suhe) kirjed (<c1/>). See on sisend, mida lahendaja <c2/> (üksikpunkti positsioneerimine) tarbib koos edastatud navigatsioonifailiga (<a1><c3/></a1>, päris IGS jaam ABMF).

# text
seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globaalsed TEC (täielik elektronsisaldus) kaardid)

# text
seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS ionosfääriprodukt)

# text
# c1: parse_ionex
seg-af9efa0df270 = <c1/> loeb IGS globaalseid täieliku elektronsisalduse ruudustikke — edastatud Klobucharu korrektsiooni <em>mõõdetud</em> alternatiivi — bilineaarse ruumilise ja ajalise interpolatsiooni ning kaldviivituseks teisendava kaldekaardistusega.

# text
# c1: finals2000A
seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (Maa orientatsioon)

# text
# c1: finals2000A.all
seg-197dfa18ca19 = IERS Conventions; IERS EOP (Maa orientatsiooniparameetrid) { "14" } C04 / <c1/>

# text
# c1: tests/operational_eop_predictor_reference.rs
seg-0d102d904cfe = UT1 (Universal Time { "1" }, Maa pöörlemise aeg)−UTC (koordineeritud ülemaailmne aeg) ja poolusliikumine ametlikust tootest, sealhulgas <b>prognoositud</b> read, nii et süsteemi taandamist saab käivitada reaalajas ja selle prognoosivea kasvu eelarvestada (<a1><c1/></a1>).

# text
seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

# text
# c1: SCHEMA.md
seg-193b33461507 = see hoidla — vt <a1><c1/></a1>

# text
# c1: format
# c2: schema_version
# c3: kind
# c4: engine_version
# c5: payload
seg-33ef8d792a90 = Neutraalne, versioonitud ümbrik, millesse iga artefakti saab pakkida: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, tarbijale selge pea- ja alamversiooni ühilduvusotsusega. Ei ole väline standard; dokumenteeritud siin, sest võõras tööriist peab seda ära tundma.

# text
seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) Kuu vahetus

# text
seg-b19cf72da934 = kirjutab (ajametaandmeid ka loeb)

# text
seg-d641c72a6449 = LunaNet koostalitlusvõime spetsifikatsioon / IOAG Kuu sidearhitektuur, CCSDS { "502.0" } peal

# text
# c1: export_lunar_oem
# c2: export_kif_lunar
# c3: export_lunar_time_metadata
# c4: tests/lunar_interoperability_export_reference.rs
seg-cc796afe7a72 = Kuu tugisüsteem, Kuu ajaskaala ja Kuu efemeriid väljastatuna LunaNet/IOAG-ga joondatud CCSDS kujudes (<c1/>, <c2/>, <c3/>), väljastatud OEM väljakontrolliga (<a1><c4/></a1>).

# text
seg-5abc05382382 = <b>CZML</b> (Cesium Language)

# text
seg-da7e20d3786b = CesiumJS CZML pakettide vorming

# text
# c1: INERTIAL
# c2: --export czml
seg-8d3a73646be3 = JSON (JavaScript Object Notation) voog ajamärgisega pakettidest CesiumJS gloobuse jaoks; liikuvad objektid kirjutatud süsteemis GCRS (<c1/>). <c2/> mis tahes liigil, mis paigutab objekte Maale.

# text
seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

# text
seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

# text
# c1: --export kml
seg-57468e6d97f2 = Maa suhtes fikseeritud pikkus, laius ja kõrgus Google Earthi ja GIS (geoinfosüsteem) tööriistade jaoks. <c1/>.

# text
seg-46d977015b07 = kirjutab <b>ja</b> loeb (marsruut)

# text
seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

# text
# c1: --export geojson
# c2: LineString
# c3: --import-route <route.geojson>
seg-425a83b44545 = Maa suhtes fikseeritud geomeetria veebikaartide ja GIS tööriistade jaoks (<c1/>); <c2/> loetakse tagasi sirge trajektoori sisendina liikidele, mis seda lendavad (<c3/>).

# text
# c1: .e
# c2: EphemerisTimePosVel
seg-d9b137e11514 = <b>STK efemeriid</b> (<c1/>, <c2/>)

# text
seg-347ee6f6c1df = Ansys STK efemeriidifaili vorming

# text
# c1: ICRF
# c2: --export stk
seg-45576578d357 = Inertsiaalne (<c1/>) asukoht ja kiirus STK jaoks ja tööriistadele, mis loevad selle efemeriidivormingut. <c2/>.

# text
seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

# text
seg-42272f73f456 = SigMF spetsifikatsioon

# text
# c1: spectrum
# c2: --export sigmf
# c3: [recording]
seg-202b559c30a6 = Kompleksed baasribasalvestised pluss JSON metaandmed: liik <c1/> kirjutab oma sünteesitud faasi-/kvadratuurkomponendi (IQ) valimid (<c2/>) ja loeb salvestise läbi oma <c3/> bloki.

# text
seg-60e7c8505cb5 = <b>LEO navigatsioonisõnumi tekst</b> (RINEX-4-laadne ja CSV (komadega eraldatud väärtused))

# text
seg-f22442e0e8ea = RINEX { "4" } navigatsiooni paigutus, kohandatud

# text
# c1: leo-navmsg
seg-8338e445b3a5 = Liigi <c1/> edastatud efemeriid ja kell madala Maa orbiidi (LEO) satelliidile, eksporditud ja uuesti imporditud; dokumenteeritud kohandus, mitte registreeritud RINEX sõnumitüüp (MODELLED kontrollimaatriksis).

# text
seg-1b89ab4e93f7 = Tugisüsteemid ja aeg

# text
# c1: src/cio.rs
# c2: src/frames.rs
# c3: src/nutation.rs
# c4: VALIDATION.md
seg-dbbd023631b6 = Mootori väljastatav tugisüsteem on selgesõnaline, mitte kaudne. CIO-põhine (CIO: Celestial Intermediate Origin) IAU (International Astronomical Union) 2006/2000A taandus (<a1><c1/></a1>) ja pööripunkti/GMST (GMST: Greenwichi keskmine tähtaeg) TEME (tõeline ekvaator, keskmine pööripunkt) taandus (<a2><c2/></a2>, <a3><c3/></a3>) on kontrollitud bitt-bitti SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) etalonvektorite vastu (vt <a4><c4/></a4>).

# text
seg-819d28bd9361 = Realisatsioon

# text
seg-69aca96b7e42 = TEME

# text
seg-ec81608934a6 = SGP4 natiivne

# text
seg-7631c594fd1a = Tõeline ekvaator, keskmine pööripunkt — SGP4/SDP4 väljundsüsteem.

# text
seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

# text
seg-745285e29202 = IAU { "2006" } pretsessioon + IAU 2000A/2000B nutatsioon

# text
# c1: teme_to_gcrs
seg-3747add299d5 = <c1/> (pööripunkti ahel).

# text
seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

# text
seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

# text
seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

# text
seg-a28e26cd2481 = ERA (Maa pöörlemisnurk) + IERS poolusliikumine (CIO) või GMST + poolusliikumine (pööripunkt)

# text
# c1: gcrs_to_itrs_matrix
# c2: eraC2tcio
# c3: teme_to_itrf
seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (pööripunkt).

# text
seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodeetiline

# text
seg-b58a44eaaa39 = täpne + iteratiivne pöördteisendus

# text
seg-4d9472dd73d3 = Ajaskaala

# text
seg-cbe7a7ce7317 = <b>TT</b> (maine aeg)

# text
# c1: jd_tt
seg-25191c1a4135 = Pretsessiooni/nutatsiooni/CIO argumendi hindamine (<c1/>).

# text
# c1: jd_ut1
seg-8c478d6b4786 = Maa pöörlemisnurk / GMST (<c1/>).

# text
seg-f7033ca0c13f = <b>Kaheosaline JD</b> (Juliuse kuupäev)

# text
# c1: Jd2
seg-64a5adeacd5b = <c1/> alla-µs epohhi lahutuse jaoks.

# text
seg-210f40885a8e = Väljundvälja → standardi vastavus (CCSDS { "502.0" })

# text
# c1: scenarios/orbit-sgp4-gps.toml
# c2: --export-oem
# c3: --export-omm
seg-e9dbc25a3ee9 = Mida kaks orbiidisõnumi kirjutajat paigutavad igasse CCSDS ODM (Orbit Data Messages, { "502.0" }) välja, loetuna käivituse <c1/> väljadega <c2/> ja <c3/>:

# text
seg-d2b91c300b82 = Kshana väljund

# text
seg-119884b009cc = CCSDS ODM väli

# text
seg-8b0593f67c7f = Väärtus / ühik

# text
seg-d33eb162d179 = OEM lõigu metaandmed

# text
# c1: EARTH
# c2: TEME
# c3: GPS
seg-4b338284e56a = <c1/> / <c2/> / <c3/> — tugisüsteem, milles levitajad integreerivad, ja epohhiruudustiku ajaskaala, mitte ümbersildistatud

# text
seg-e0a44af9aaf8 = OEM oleku epohh

# text
seg-b0623bab9fcc = iga andmerea esimene veerg

# text
seg-410bd5a9ba14 = ISO-8601 (ISO: International Organization for Standardization) kalendriaeg, GPS ajaskaala

# text
seg-a7c95802e01a = OEM asukoht, kiirus

# text
# c1: X Y Z X_DOT Y_DOT Z_DOT
seg-0539cafabf60 = <c1/> andmeveerud

# text
seg-8add7e800e0e = km, km/s

# text
seg-8b386548c03c = OMM metaandmed

# text
seg-e2c63414d7c2 = OMM epohh

# text
seg-5109e5948d2a = ISO-8601 aasta päeva kuju (TLE epohh)

# text
seg-b74289a29c24 = OMM keskmised elemendid

# text
seg-f3492fa95178 = tiiru/päevas, –, kraadi, 1/Maa raadiust

# text
# c1: ephemeris
# c2: jd_utc
# c3: teme_r_m
# c4: teme_v_m_s
# c5: gcrs_r_m
# c6: gcrs_v_m_s
# c7: ecef_r_m
# c8: lat_deg
# c9: lon_deg
# c10: alt_km
seg-fc82185abe10 = Liigi <c1/> tulemuse JSON (JavaScript Object Notation) kannab sama olekut SI (rahvusvaheline mõõtühikute süsteem) ühikutes valimi kohta: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), pluss <c8/>, <c9/>, <c10/>.

# text
seg-014d1392018e = Aus ulatus

# text
# c1: INTEROP.md
seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF ja LEO navigatsioonisõnumi tekst <b>loetakse ja kirjutatakse</b>; OMM, CZML, KML ja STK efemeriid on <b>kirjutajad</b> (OMM lugeja ja XML serialiseerimine on järgmised sammud); GeoJSON kirjutatakse ja loetakse tagasi marsruudina; RINEX NAV, RINEX OBS, IONEX, IERS EOP tooted ja TLE on <b>lugejad</b>; LunaNet/IOAG Kuu eksport on kirjutaja, mille ajametaandmed liiguvad edasi-tagasi. <a1><c1/></a1> loetleb, milline eksport kehtib iga kaasasoleva stsenaariumi kohta.

# text
seg-68b4f5116419 = Ülaltoodud CCSDS/IGS väljade vastavus on dokumentatsioon, mitte väide, et ühtki standardit järgitakse; ametlik hindamine nende standardite suhtes (ja registreerimine ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration) avatud kataloogis) on eraldi jälgitav ja ootab ülevaatust.

# text
# c1: xval/anise-frames/
# c2: gcrs_to_itrs_matrix
# c3: VALIDATION.md
seg-e461587ad2cf = Sõltumatu SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhas-Rusti planeedigeomeetria tööriistakomplekt) arvuline ristkontroll tugisüsteemi taandusele on tarnitud eraldiseisvas, töökoha alt välja jäetud crate'is <c1/>: <c2/> ANISE GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) pöörde vastu kaheksal epohhil { "2020" }–{ "2023" } langeb kokku ≤ { "0.86" } m täpsusega maapinnal ja ≤ { "3.6" } m täpsusega GNSS orbiidil (vt <a1><c3/></a1>). See vajab SPICE tuumasid, seega ei ole see vaikimisi pideva integreerimise (CI) värav.

# text
seg-f6d67027d669 = <s1>Eelmine</s1>Võimekuse kaart

# text
seg-01b6270b6c6a = <s1>Järgmine</s1>Reakate
