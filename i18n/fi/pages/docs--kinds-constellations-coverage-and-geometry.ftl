# docs--kinds-constellations-coverage-and-geometry: translations (fi)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Tyyppi

seg-e7dad1a1ecba = Paikannus minkä tahansa aurinkokunnan kappaleen ympärillä: kiertäjä tai pintalaskeutuja nimellä valitun keskuskappaleen (Mars, Kuu, Europa, Ganymede, Titan ja muu aurinkokunnan luettelo) ympärillä, joka navigoi yhdensuuntaisilla pseudoetäisyyksillä pienestä Walker-navigointisatelliittitähdistöstä kappaleen ympärillä (kaksikappaleradat kappaleen oman J2-sekulaariajautuman kanssa, tuntematon käyttäjän kello) ja valinnaisesti kellosta riippumattomalla syväavaruuden kaksisuuntaisella etäisyydellä Maasta, jonka suunta ja etäisyys tulevat analyyttisestä aurinkokunnan efemeridistä jokaisella epookilla. Näkölinjat estää kappaleen keskimääräinen pallo, ja pintakäyttäjä tarvitsee lisäksi korkeuskulmamaskin. Epookkia kohden: näkyvissä olevat releet, onko Maa horisontin yläpuolella, pelkän satelliittitähdistön GDOP ja PDOP (geometrinen ja paikan tarkkuuden heikkenemiskerroin), muodollinen yhden sigman paikkaepävarmuus Maa-rivin kanssa ja ilman sitä sekä siemenluvulla alustetun Gauss–Newton-pienimmän neliösumman ratkaisun virhe kummallakin tavalla; ajon yli: saatavuus, Maan näkyvyys, PDOP:n mediaani, RMS-virhe ja muodollisen sigman mediaani sekä Maa–kappale-valoaika, edestakainen matka, Shapiro-viive ja Auringon erotuskulma epookilla. MODELLED: releiden radat, kohinatasot ja hetkellinen mittausmalli ovat mallinnusvalintoja, joita ei ole validoitu tehtävän navigointidataa vastaan; kappaleen vakiot ovat tiedostossa body.rs siteeratut julkaistut arvot, ja Maan geometria perii aurinkokunnan efemeridin nimikkeet.

seg-6f341acbe994 = Moottorin kirjoittama kaavio skenaariolle scenarios/mars-orbit-pnt.toml, laji body-pnt

seg-de173c9f4034 = Tähdistösuunnittelu mittakaavassa: Walker DELTA- ja Walker STAR -kuviot i: T/P/F-merkintätavassa (solmut jakautuneina { "360" } tai { "180" } asteelle, ratatason sisäinen väli { "360" }<em>P/T, ratatasojen välinen vaihesiirtymä { "360" }</em>F/T), eksplisiittiset elementtilistat ja monikuorisuunnitelmat, useita tähdistöjä yhdessä ajossa, Maan, Kuun, Marsin tai minkä tahansa muun planeetan, Pluton tai suuren kuun ympärillä body-moduulin vakioilla (samoilla, joita solar-system- ja body-pnt-tyypit käyttävät). ESIASETUKSET julkaistuista nimellisistä elementeistä: gps-baseline ja gps-expandable ({ "24" } paikkaa ja kuusi eteen/taakse laajennettavaa paria GPS Standard Positioning Service Performance Standardin 5. painoksesta { "2020" }, taulukot 3.2-1–3.2-3), galileo (Walker 24/3/1 korkeudella { "29 599.801" } km ja { "56" } astetta, Galileo Open Service Service Definition Document issue { "1.1" } taulukot { "1" } ja { "23" }), beidou ja beidou-meo (Walker 24/3/1 korkeudella { "21 528" } km ja { "55" } astetta sekä kolme geostationaarista satelliittia pituuspiireillä { "80" }, { "110.5" } ja { "140" } astetta itään ja kolme kallistettua geosynkronista satelliittia { "55" } asteen kaltevuudella, BeiDou Open Service Performance Standard { "3.0" } kohta { "4.1" }; MEO-vaihe ja { "118" } asteen itäisen pituuden kallistetun geosynkronisen radan leikkaus on mallinnettu, koska standardi ei esitä niitä) ja glonass (24/3/1 korkeudella { "19 100" } km ja { "64.8" } astetta GLONASS Interface Control Document edition { "5.1" } kohdan { "5.2" } paikkakaavasta). PEITTO JA TARKKUUDEN HEIKKENEMISKERROIN: leveys-/pituusasteruudukossa ja otetussa aikaikkunassa korkeuskulmamaskilla näkyvien satelliittien lukumäärä, GDOP, PDOP, HDOP ja VDOP ruutua kohti, saatavuus (paikannus, jonka PDOP on enintään kynnys, oletuksena { "6" }) ruutua kohti, maailmanlaajuisesti (pinta-alapainotettuna) ja huonoimmassa paikassa, yhdellä vastaanottimen kellolla tähdistöä kohti, ellei clock = "common". Se skaalautuu tuhansiin satelliitteihin: näkyvyys on pistetulo kunkin satelliitin kattavuuden puolikulmaa vastaan, ja satelliitit jaetaan kullakin epookilla kaistoihin satelliitin alapisteen leveysasteen mukaan, jotta ruudukon rivi testaa vain ne, jotka voivat olla näkyvissä; raportti laskee säästetyt paritestit. JSON sisältää ruudukkokartat ja harvennetut satelliittikohtaiset maanpintajäljet. VALIDATED: Walker-generaattori Galileo OS SDD:n taulukkoa { "23" } ja GLONASS ICD:n paikkakaavaa vastaan, GPS-esiasetus SPS PS:n taulukon 3.2-1 julkaistua päiväntasaajan ylityssaraketta vastaan ja GPS-lähtötason globaali HDOP-jakauma SPS PS:n liitettä B vastaan (mediaani { "0.94" }, { "95" }% { "1.25" }, keskiarvo { "0.96" }, toleranssi { "0.03" }). MODELLED: kahden kappaleen radat valinnaisella sekulaarisella J2:lla, pallomainen kappale, vain geometrinen näkyvyys (ei signaalitehoa, terveystilaa eikä maastoa) ja eri järjestelmien välinen suhteellinen vaihe, joka ei ole minkään todellisen päivämäärän tilannekuva.

seg-899e728ad9bd = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/leo-pnt-mega-shell.toml, skenaariotyyppi constellation-design

seg-24266bc264df = Efemeridi ja maanpintajälki: propagoi yksi satelliitti (TLE→SGP4 tai analyyttinen rata) ja anna sen TEME/GCRS-tila (paikka + nopeus), ITRF/ECEF-paikka, WGS-84 alapisteen leveys/pituus/korkeus sekä askelkohtainen aseman atsimuutti/korkeuskulma/etäisyys + etäisyysnopeus (Doppler). Satelliitti tulee kentästä <c1/> tai analyyttisestä radasta, jonka kuvaa kenttä <c2/> yhdessä kentän <c3/> kanssa (kenttä <c4/> voittaa, kun molemmat on annettu); kun kenttä <c5/> on annettu, kenttä <c6/> ohittaa TLE:n oman epookin hetkenä t = { "0" }.

seg-0fd3c58fde09 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/ephemeris.toml, skenaariotyyppi ephemeris

seg-3f749aef8d89 = Syväavaruuden Mars-PNT: simuloitu MARCONI-releiden tähdistö (areostationaariset + kallistetut releet, jotka lähettävät yksisuuntaisesti + välittävät kaksisuuntaisesti syväavaruuden asemalle) navigoi viitekäyttäjän (transfer | lmo | surface) yhteisen yksi-/kaksisuuntaisen radiometrisen fuusioestimaattorin kautta. Raportoi epookkikohtaisen geometrian ja näkyvyyden, saavutetun RMS:n todellista tilaa vastaan sekä muodollisen kovarianssin (1σ / 3σ paikka) — rehellinen simuloitu laatumittari, EI sertifioitu suojaustaso.

seg-c564dca90854 = Moottorin kirjoittama kaavio skenaariolle scenarios/mars-pnt-lmo.toml, tyyppi mars-pnt

seg-cb4262b66b8f = GNSS-saatavuus + DOP kiertoratatähdistöstä (Walker / TLE / RINEX).

seg-3b652c0da6de = Moottorin kirjoittama kaavio skenaariolle scenarios/orbit-rinex.toml, tyyppi orbit

seg-a4bdfc291fce = Maa-aseman ylilentoennuste: ympyräradan aika-alueen näkyvyysylilennot (AOS/TCA/LOS, suurin näennäinen korkeuskulma, kesto), SGP4-keskielementteinä ikkunan alussa, korkeuskulmamaskin yläpuolella olevan aseman yli ikkunan aikana, kokonaissaavutusaikoineen. SGP4/SDP4-propagointi IAU 2006/2000A -Maahan kiinnitetyssä koordinaatistossa (valinnainen UT1 - UTC ja napaliike), ITU-R P.834-9 -troposfäärirefraktio ja alalinkin valon kulkuaika (molemmat oletuksena päällä), ylitykset ratkaistuna tarkkuuteen { "1e-7" } s ja kulminaatio kultaisen leikkauksen haulla. Ylilennon geometria on VALIDATED Orekitia { "13.1.8" } vasten merenpinnan tasolla olevilla asemilla; skenaarion rata ja asema ovat havainnollistavia syötteitä.

seg-a09be8c586e3 = Moottorin kirjoittama kaavio skenaariolle scenarios/passes.toml, tyyppi passes

# text
seg-0549bc926a9b = Koko aurinkokunta yhdellä epookilla PNT:tä (paikannus, navigointi ja ajanmääritys) varten minkä tahansa kappaleen ympärillä. Auringolle, kahdeksalle planeetalle, Plutolle, Kuulle, Phobokselle, Deimokselle, Iolle, Europalle, Ganymedeelle, Callistolle ja Titanille se raportoi heliosentrisen paikan ja nopeuden ICRF:ssä (International Celestial Reference Frame, ekvatoriaalinen J2000), heliosentrisen etäisyyden sekä J2000-ekliptisen pituuden ja leveyden, gravitaatioparametrin, ekvatoriaalisen ja keskisäteen, J2:n silloin kun se on julkaistu ja sen vertailusäteen, sideerisen pyörimisjakson, IAU:n navan ja nollameridiaanin epookilla, yhden kierroksen yli otetun rataprofiilin (heliosentrinen planeetoille, emokappaleen keskipisteeseen suhteutettu kuille) sekä valoajan, yksi- ja kaksisuuntaisen etäisyyden, Auringon Shapiro-viiveen ja Auringon erotuskulman havaitsijakappaleesta (oletuksena Maa); lisäksi annetut from/to-linkit saavat saman käsittelyn. Paikat: Standishin ja Williamsin JPL:n Kepler-elementit (Taulukko { "1" } vuosille { "1800" } AD–{ "2050" } AD, taulukot 2a/2b vuosille { "3000" } BC–{ "3000" } AD) kunkin planeetan nimellisvirheineen, Montenbruckin ja Gillin kuusarja Maa–Kuu-jakoon, JPL:n keskielementit IAU:n synkronisella pyörimisnopeudella Marsin ja Galileon kuille sekä IAU:n pyörimismalli Titanille. Valoaika: radiometrinen kiintopisteratkaisu, lähetin takaisinviivästetyssä paikassaan; newtonilainen, Shapiro-viive raportoituna erikseen. VALIDATED JPL Horizonsia (DE441) vastaan kaksinkertaisen nimellisvirheen sisällä: Merkurius–Saturnus ja Maa taulukosta { "1" } (pahin { "1.87" } kertaa nimellinen) ja kaikki kahdeksan planeettaa taulukoista 2a/2b (pahin { "1.71" } kertaa) sekä Maa–Mars- ja Maa–Jupiter-valoaika. MODELLED, jokainen rivi merkittynä: Uranus ja Neptunus taulukosta { "1" } ({ "2.0" } ja { "5.2" } kertaa nimellinen virhe DE441:tä vastaan), Pluto (vuoden { "1992" } rivi; ei ilmoitettua virhettä), Kuu ja seitsemän kuuta (mitattu Horizonsia vastaan, ei julkaistua rajaa).

# attr:alt
seg-537aa8010e50 = Moottorin kirjoittama kaavio skenaariolle scenarios/solar-system-tour.toml, laji solar-system

# text
seg-4e31c8daf798 = Kirjanpito

# text
# c1: docs/kinds/constellations-coverage-and-geometry.md
seg-44bbec836934 = Lähde: <c1/>

# text
seg-34a6079984a7 = Satelliittitähdistöt, kattavuus ja geometria (skenaariolajiperhe)

# text
seg-6800289a282d = { "7" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
# c1: kshana scenarios/orbit-gnss-challenged.toml
seg-d95cc2c1e798 = Aihesivut: <a1>CONSTELLATION-DESIGN</a1>, <a2>COVERAGE</a2>, <a3>SOLAR-SYSTEM</a3>, <a4>SKYLINE</a4>. Aja yksi: <c1/>. Kaikki perheet: <a5>KINDS.md</a5>.

# attr:alt
seg-f044822c2fab = Kuvakooste moottorin kirjoittamista kaavioista perheen Satelliittitähdistöt, kattavuus ja geometria lajeille

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-e2450f89bcc6 = Efemeridi ja maanpintajälki: propagoi yksi satelliitti (TLE→SGP4 tai analyyttinen rata) ja anna sen TEME/GCRS-tila (paikka + nopeus), ITRF/ECEF-paikka, WGS-84-alasatelliittipisteen lat/lon/alt ja askelkohtainen st

# text
seg-d021c1b23dbc = Satelliittitähdistön suunnittelu mittakaavassa: Walker DELTA- ja Walker STAR -kuviot i: T/P/F-merkinnällä (solmut jakautuneina { "360" } tai { "180" } deg:n yli, ratatasonsisäinen väli { "360" }<em>P/T, ratatasojen välinen vaihe-ero { "360" }</em>F/T), eksplisiittinen

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-f6914ea43dba = Koko aurinkokunta yhdellä epookilla PNT:tä (paikannus, navigointi ja ajanmääritys) varten minkä tahansa kappaleen ympärillä.

# text
seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

# text
seg-d71a07d8a59e = Paikannus minkä tahansa aurinkokunnan kappaleen ympärillä: kiertäjä tai pintalaskeutuja nimellä valitun keskuskappaleen ympärillä (Mars, Kuu, Europa, Ganymede, Titan ja muu aurinkokunnan luettelo), navi

# text
seg-436e412d99fd = MODELLED { "1" } · VALIDATED { "1" }

# text
seg-f6b22521b4a4 = Syväavaruuden Mars-PNT: simuloitu MARCONI-releiden tähdistö (areostationaarinen + kallistetut releet, jotka lähettävät yksisuuntaisesti + välittävät kaksisuuntaisesti syväavaruuden asemalle) navigoi vertailukäyttäjää (siirto / l

# text
seg-cc85d9962c25 = Maa-aseman ylilentojen ennustus: ympyräradan aikatason näkyvyysylilennot (AOS/TCA/LOS, suurin näennäinen korkeuskulma, kesto) SGP4:n keskielementteinä ikkunan alussa aseman yläpuolella

# text
seg-23f3c33445d1 = MODELLED { "2" } · VALIDATED { "2" }

# text
# c1: seed
# c2: threshold_ns
# c3: mask_deg
# c4: time
# c5: user|user_site
# c6: constellation
# c7: clock_quantum
# c8: clock_classical
# c9: sigma_uere_m
# c10: constellations
# c11: epoch
# c12: export_sp3
# c13: export_omm
# c14: export_oem
# c15: skyline
seg-a7bd3325080c = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>. Valinnaiset: <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-5e8a5e611ba9 = <b>Kirjanpito:</b> MODELLED { "4" } · VALIDATED { "4" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>orbit</a1>.

# text
# c1: tle|orbit+epoch
# c2: step_s
# c3: duration_s
# c4: station
# c5: dut1_s
# c6: xp_arcsec
# c7: yp_arcsec
# c8: carrier_hz
# c9: eop_finals2000a
seg-968c1512151e = Pakolliset kentät: <c1/>. Valinnaiset: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-8c5e41cef6fd = <b>Kirjanpito:</b> VALIDATED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>ephemeris</a1>.

# text
# c1: body
# c2: duration_s
# c3: step_s
# c4: mask_deg
# c5: pdop_threshold
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: clock
# c12: j2
# c13: track_points
# c14: max_tracks
# c15: constellation
seg-47aaf1afd6ec = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-bacf2a133146 = <b>Kirjanpito:</b> MODELLED { "1" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>constellation-design</a1>.

# text
# c1: epoch
# c2: epoch_jd_tdb
# c3: bodies
# c4: observer
# c5: track_points
# c6: table
# c7: links
seg-e99c2a83034e = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-d91ded1df3a2 = <b>Kirjanpito:</b> MODELLED { "2" } · VALIDATED { "3" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>solar-system</a1>.

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-fe02605b130e = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-12bc4b4b4631 = <b>Kirjanpito:</b> MODELLED { "1" } · VALIDATED { "1" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>body-pnt</a1>.

# text
# c1: user
# c2: clock_class
# c3: step_s
# c4: duration_s
# c5: nmax
# c6: range_sigma_m
# c7: doppler_sigma_mps
# c8: dynamic_tightness
# c9: two_way_period_s
# c10: seed
seg-bee590b4c9e7 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-c0394ad71cfe = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>mars-pnt</a1>.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-352823f8c5ac = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-bb4fa18e50a6 = <b>Kirjanpito:</b> MODELLED { "2" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>passes</a1>.

# text
seg-490ec99e2a38 = <s1>Edellinen</s1>Kellot, ajoitus ja holdover

# text
seg-90ff7426b999 = <s1>Seuraava</s1>GNSS-mittaukset, paikannus ja eheys
