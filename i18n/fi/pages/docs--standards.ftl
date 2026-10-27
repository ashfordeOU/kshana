# docs--standards: translations (fi)

seg-4a2ce9f33ab2 = kirjoitus

seg-9120d3e96e5e = luku

seg-5ad814c7ef9e = Huomautukset

seg-aab745a65e76 = Moduuli

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Kehys

# text
seg-32b620b3574e = Käyttö

seg-8ba331635865 = Standardit ja yhteentoimivuus

seg-96a449a63d11 = Lähde: <c1/>

seg-3ed65a16e7d0 = Kshana puhuu GNSS-, lentodynamiikka- ja ajoitusyhteisöjen standardeja vaihtoformaatteja, jotta se voi toimia RTKLIBin (avoimen lähdekoodin reaaliaikainen kinemaattinen paikannuskirjasto), gLABin, Ginanin, GMATin (General Mission Analysis Tool), Orekitin ja IGS:n (International GNSS Service) analyysikeskusten työkalujen rinnalla eikä yksityisellä saarella. Tämä sivu yhdistää moottorin jäsentämät tai tuottamat <b>vaihtoformaatit</b> kutakin toteuttavaan moduuliin ja auktoriteettiseen määrittelyyn.

seg-d1aa512ad4ee = Se on rajattu formaatteihin — asioihin, joilla on luku-/kirjoitussuunta. Signaali- ja algoritmistandardit, jotka moottori <em>toteuttaa</em> eikä jäsennä (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (aiemmin Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), ARAIM-viite WG-C (advanced receiver autonomous integrity monitoring; WG: Working Group), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) todistetaan rivi riviltä tiedostossa <a1><c1/></a1>.

seg-656920618fb7 = Formaatit, joita moottori puhuu

seg-4fe4920a3fa1 = Standardi

seg-d08f1943c53b = Suunta

seg-968a1d48364c = Määrittely / auktoriteetti

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = lukee <b>ja</b> kirjoittaa

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, KVN-muoto (avainsana–arvo-merkintä)

seg-be700901c03e = Taulukoitu tilavektoriefemeridi, jota GMAT, Orekit ja STK (Systems Tool Kit) ottavat vastaan. <c1/> lukee sen takaisin; <b>validoitu palauttamalla sanatarkka CCSDS 502.0-B-3 -kuvan G-11 Blue Book -esimerkki</b> (<a1><c2/></a1>). Valinnainen { "6" }×{ "6" } paikka/nopeus-<b>kovarianssilohko</b> (<c3/>, 21 alkion alakolmio-KVN-serialisointi valinnaisella <c4/>) sekä kirjoitetaan (<c5/>) että luetaan (<c6/>), edestakaisin symmetrinen (testit: <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, KVN-muoto

seg-fb5218415d68 = SGP4/TLE:n (SGP4: Simplified General Perturbations { "4" }; TLE: kaksirivinen elementtijoukko) keskielementtien (keskiliike, e, i, Ω, ω, M, BSTAR (kiertoradan propagaattorin vastustermi)) standardiraidan julkaisu. Komentoriviltä (CLI) käytettävissä tyypin <c1/> skenaariossa valitsimella <c2/> tai <c3/> (yksi OMM TLE:llä määriteltyä satelliittia kohti, sen todellisella NORAD-tunnisteella (North American Aerospace Defense Command), COSPAR-nimikkeellä (Committee on Space Research) ja epookilla; <a1><c4/></a1>). XML-muoto (Extensible Markup Language) ja lukija ovat jatkokehitystä.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, KVN-muoto

seg-cd96db42ab43 = Etäisyys-, Doppler- ja kulmaseurantatietueet, jotka DSN/ESTRACK (ESTRACK: European Space Tracking network) -ylilento toimittaa OD-järjestelmälle (radanmääritys). <b>Validoitu palauttamalla sanatarkka CCSDS 503.0-B-2 -kuvan E-9 Blue Book -esimerkki</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = Maajärjestelmien vaihtama 6 oktetin TM/TC (TM: telemetria; TC: kaukokomento) -pääotsikkokehystys. <b>Kooderi toistaa riippumattoman kirjaston <c1/> julkaistut tavutason testivektorit</b> (testit: <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, tarkka ratamuoto) / SP3-d</b> (tarkka efemeridi)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Maahan sidottu (ECEF) paikka- ja kelloaikasarja. Edestakainen ajo validoitu tarkkuuteen < { "0.5" } m todellisella tilannekuvalla <c1/> (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (lähetetty navigointi)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (rajapintamäärittely), BeiDou ICD, GLONASS (Venäjän maailmanlaajuinen satelliittinavigointijärjestelmä) ICD)

seg-1b7710db3abf = Moni-GNSS-NAV-sisäänluku (GPS LNAV (legacy navigation message), Galileo F/NAV, QZSS (Japanin Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: keskikorkea Maan kiertorata; IGSO: kallistunut geosynkroninen rata), GLONASS-tilavektori); käytettävissä ensiluokkaisena lähteenä tyyppiä <c1/>.

seg-44991b52d1ff = <b>TLE / 3LE</b> (kaksi-/kolmirivistä elementtiä)

seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

seg-8d4dd42edc89 = Propagoidaan validoidulla SGP4/SDP4-ytimellä (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm vasten { "666" } virallista AIAA-vektoria).

seg-498aac915067 = <b>RINEX 3.0x</b> (havainto)

seg-437d07b5aa4f = RINEX 3.0x OBS ({ "4.00" } odotetaan jäsentyvän, ei koskaan kokeiltu tiedostolla, jonka versio on { "4.00" })

seg-ac97f77f142c = RINEXin toinen puoli: vastaanottimen oma koodi-/kantoaalto-/Doppler-/SNR-tietue (SNR: signaali–kohinasuhde) (<c1/>). Tämä on syöte, jota yhden pisteen paikannusratkaisija <c2/> kuluttaa lähetetyn navigointitiedoston rinnalla (<a1><c3/></a1>, todellinen IGS-asema ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globaalit TEC-kartat (total electron content, ionosfäärin kokonaiselektronisisältö))

seg-bf1bb42f04c4 = IONEX { "1" }.x (IGS:n ionosfääristuote)

seg-af9efa0df270 = <c1/> lukee IGS:n globaalit kokonaiselektronisisältöruudukot — <em>mitatun</em> vaihtoehdon lähetetylle Klobuchar-korjaukselle — bilineaarisella spatiaalisella ja ajallisella interpoloinnilla ja viistoviiveen vinouskartoituksella.

seg-6f0da4b59d7c = <b>IERS (International Earth Rotation and Reference Systems Service) <c1/> / Bulletin B</b> (Maan orientaatio)

seg-197dfa18ca19 = IERS Conventions; IERS EOP (Earth orientation parameters, Maan orientaatioparametrit) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (Universal Time { "1" }, Maan pyörimisaika)−UTC (Coordinated Universal Time) ja napaliike virallisesta tuotteesta, mukaan lukien <b>ennustetut</b> rivit, jotta koordinaatistoreduktio voidaan ajaa reaaliajassa ja sen ennustevirheen kasvu budjetoida (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = tämä repositorio — katso <a1><c1/></a1>

seg-33ef8d792a90 = Neutraali, versioitu kirjekuori, johon jokaisen artefaktin voi kääriä: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, ja kuluttajalle eksplisiittinen suuri–pieni-versioyhteensopivuustuomio. Ei ulkoinen standardi; dokumentoitu tässä, koska vieraan työkalun on tunnistettava se.

seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) -kuutiedonvaihto

seg-b19cf72da934 = kirjoittaa (aikametatiedot myös luetaan)

seg-d641c72a6449 = LunaNetin yhteentoimivuusmäärittely / IOAG:n kuuviestintäarkkitehtuuri, CCSDS { "502.0" } pohjalla

seg-cc796afe7a72 = Kuun koordinaatisto, kuun aika-asteikko ja kuun efemeridi tuotettuna LunaNet/IOAG-linjatuissa CCSDS-muodoissa (<c1/>, <c2/>, <c3/>), tuotetun OEM:n kenttätarkistuksella (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = CesiumJS CZML -pakettiformaatti

seg-8d3a73646be3 = JSON (JavaScript Object Notation) -virta aikaleimatuista paketeista CesiumJS-karttapallolle; liikkuvat kohteet kirjoitettu GCRS:ssä (<c1/>). <c2/> millä tahansa tyypillä, joka sijoittaa kohteita Maahan.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Maahan sidottu pituus-, leveys- ja korkeuskoordinaatti Google Earthille ja GIS-työkaluille (paikkatietojärjestelmä). <c1/>.

seg-46d977015b07 = kirjoittaa <b>ja</b> lukee (reitti)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Maahan sidottu geometria verkkokartoille ja GIS-työkaluille (<c1/>); <c2/> luetaan takaisin sellaisten tyyppien suoran radan syötteenä, jotka lentävät sellaisen (<c3/>).

seg-d9b137e11514 = <b>STK-efemeridi</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = Ansys STK -efemeriditiedostoformaatti

seg-45576578d357 = Inertiaalinen (<c1/>) paikka ja nopeus STK:lle ja työkaluille, jotka lukevat sen efemeridiformaattia. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = SigMF-määrittely

seg-202b559c30a6 = Kompleksiset kantataajuustallenteet plus JSON-metatiedot: tyyppi <c1/> kirjoittaa syntetisoidut vaihe/kvadratuuri-näytteensä (IQ) (<c2/>) ja lukee tallenteen lohkonsa <c3/> kautta.

seg-60e7c8505cb5 = <b>LEO-navigointisanomateksti</b> (RINEX-4-tyylinen ja CSV (pilkuin erotetut arvot))

seg-f22442e0e8ea = RINEX { "4" } -navigointiasettelu, mukautettu

seg-8338e445b3a5 = Tyypin <c1/> lähetetty efemeridi ja kello matalan Maan kiertoradan (LEO) satelliitille, viety ja tuotu takaisin; dokumentoitu mukautus, ei rekisteröity RINEX-sanomatyyppi (MODELLED varmennusmatriisissa).

seg-1b89ab4e93f7 = Koordinaatistot ja aika

seg-dbbd023631b6 = Moottorin tuottama koordinaatisto on eksplisiittinen, ei implisiittinen. CIO-pohjainen (CIO: Celestial Intermediate Origin) IAU:n (International Astronomical Union) 2006/2000A-reduktio (<a1><c1/></a1>) ja päiväntasaaja-/GMST (GMST: Greenwichin keskimääräinen tähtiaika) TEME (true equator, mean equinox) -reduktio (<a2><c2/></a2>, <a3><c3/></a3>) on validoitu bitti bitiltä SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) -vertailuvektoreita vasten (katso <a4><c4/></a4>).

seg-819d28bd9361 = Toteutus

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = SGP4 natiivi

seg-7631c594fd1a = True equator, mean equinox — SGP4/SDP4:n tulostekoordinaatisto.

seg-eeb28cc286b3 = GCRS (Geocentric Celestial Reference System) / J2000

seg-745285e29202 = IAU:n { "2006" } prekessio + IAU 2000A/2000B -nutaatio

seg-3747add299d5 = <c1/> (päiväntasausketju).

seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (International Terrestrial Reference System) / ECEF

seg-a28e26cd2481 = ERA (Maan pyörimiskulma) + IERS:n napaliike (CIO) tai GMST + napaliike (päiväntasaus)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (päiväntasaus).

seg-74a4801fd685 = WGS-84 (WGS: World Geodetic System) geodeettinen

seg-b58a44eaaa39 = tarkka + iteratiivinen käänteisratkaisu

seg-4d9472dd73d3 = Aika-asteikko

seg-cbe7a7ce7317 = <b>TT</b> (Terrestrial Time)

seg-25191c1a4135 = Prekession/nutaation/CIO:n argumentin evaluointi (<c1/>).

seg-8c478d6b4786 = Maan pyörimiskulma / GMST (<c1/>).

seg-f7033ca0c13f = <b>Kaksiosainen JD</b> (juliaaninen päivämäärä)

seg-64a5adeacd5b = <c1/> mikrosekunnin alittavalle epookkitarkkuudelle.

seg-210f40885a8e = Tulostekenttä → standardi -kartoitus (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Mitä kaksi ratasanomakirjoitinta laittaa kuhunkin CCSDS ODM (Orbit Data Messages, { "502.0" }) -kenttään, luettuna ajosta <c1/> valitsimilla <c2/> ja <c3/>:

seg-d2b91c300b82 = Kshanan tuloste

seg-119884b009cc = CCSDS ODM -kenttä

seg-8b0593f67c7f = Arvo / yksikkö

seg-d33eb162d179 = OEM-segmentin metatiedot

seg-4b338284e56a = <c1/> / <c2/> / <c3/> — koordinaatisto, jossa propagaattorit integroivat, ja epookkiruudukon aika-asteikko, ei uudelleennimetty

seg-e0a44af9aaf8 = OEM-tilan epookki

seg-b0623bab9fcc = kunkin datarivin ensimmäinen sarake

seg-410bd5a9ba14 = ISO-8601 (ISO: International Organization for Standardization) -kalenteriaika, GPS-aika-asteikko

seg-a7c95802e01a = OEM:n paikka, nopeus

seg-0539cafabf60 = datasarakkeet <c1/>

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = OMM-metatiedot

seg-e2c63414d7c2 = OMM-epookki

seg-5109e5948d2a = ISO-8601 vuodenpäivämuoto (TLE-epookki)

seg-b74289a29c24 = OMM-keskielementit

seg-f3492fa95178 = kierrosta/vrk, –, astetta, 1/Maan sädettä

seg-fc82185abe10 = Tyypin <c1/> tulos-JSON (JavaScript Object Notation) sisältää saman tilan SI-yksiköissä (International System of Units) näytettä kohti: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), sekä <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Rehellinen rajaus

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF ja LEO-navigointisanomateksti ovat <b>luku ja kirjoitus</b>; OMM, CZML, KML ja STK-efemeridi ovat <b>kirjoittimia</b> (OMM-lukija ja XML-serialisointi ovat jatkokehitystä); GeoJSON kirjoitetaan ja luetaan takaisin reittinä; RINEX NAV, RINEX OBS, IONEX, IERS EOP -tuotteet ja TLE ovat <b>lukijoita</b>; LunaNet/IOAG-kuuvienti on kirjoitin, jonka aikametatiedot kulkevat edestakaisin. <a1><c1/></a1> luettelee, mikä vienti koskee kutakin mukana toimitettua skenaariota.

seg-68b4f5116419 = Yllä oleva CCSDS/IGS-kenttäkartoitus on dokumentaatiota, ei väite siitä, että jokin standardi täyttyy; muodollinen arviointi näitä standardeja vasten (ja rekisteröinti ESA:n (European Space Agency) ESSR:n (European Space Software Repository) / NASA:n (National Aeronautics and Space Administration) avoimeen katalogiin) seurataan erikseen ja on odottamassa tarkastelua.

seg-e461587ad2cf = Riippumaton SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhdas Rust-planeettageometriatyökalu) -numeerinen ristiintarkistus koordinaatistoreduktiolle toimitetaan erillisessä, työtilasta pois jätetyssä crate-paketissa <c1/>: <c2/> ANISEn GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) -rotaatiota vasten kahdeksalla epookilla { "2020" }–{ "2023" } täsmää tasolle ≤ { "0.86" } m maassa ja ≤ { "3.6" } m GNSS-radalla (katso <a1><c3/></a1>). Se tarvitsee SPICE-ytimiä, joten se ei ole oletusarvoinen jatkuvan integraation (CI) portti.

seg-f6d67027d669 = <s1>Edellinen</s1>Ominaisuuskartta

seg-01b6270b6c6a = <s1>Seuraava</s1>Rivikattavuus
