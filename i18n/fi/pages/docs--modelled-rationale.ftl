# docs--modelled-rationale: translations (fi)

seg-2db69c58f694 = Kuun differentiaalinen PNT

seg-1ff1d8ebf1e7 = Compliance-kartoitus julkisiin kehyksiin

seg-aab745a65e76 = Moduuli

seg-d6476863f862 = Ominaisuus

seg-60a43431ebe0 = Vaatimus

seg-bde1b3a94a47 = Auringon reunatummennettu SRP-varjo (valinnainen)

seg-eaaec545dd68 = SRP:n valaistu osuus reunatummennetun aurinkovuon peittämättömänä osuutena (Eddingtonin approksimaation laki I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss–Legendre-kvadratuuri) pallomaisen tai WGS-84-Maan yli (srp_shadow::limb_darkened_shadow, ShadowModel-variantti OblateEarthLimbDarkened)

seg-9e15970435c3 = DE440:n Aurinko ja Kuu Cowellin voimamallissa (valinnainen)

seg-de6831cf7785 = Valinnainen efemeriditaso numeerisen Cowell-ForceModelin kolmannen kappaleen ja SRP:n termeille: geosentrinen Aurinko ja Kuu minkä tahansa EphemerisProviderin (DE440 SPK -kernel kohteen KernelEphemeris kautta) antamina ajanhetkellä TDB = TT + (TDB - TT); hylkää tarjoajan, joka ei voi palvella ajanhetkeä, ja laskee kaikki paluut analyyttiseen sarjaan; oletuksena pois päältä

seg-057c21daf4f2 = S1-ilmakehän vuorovesi (valinnainen)

seg-f600a39f297e = Vuorokautinen S1-ilmanpainevuorovesi geopotentiaalihäiriönä: Biancale ja Bode ({ "2006" }) malli N1, asteet { "2" }–{ "6" }, IERS { "2010" } yhtälön { "6.21" } kuormakaavan kautta (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valinnainen Cowell- ja tarkoissa voimamalleissa (air_tide_s1, oletuksena pois päältä)

seg-e8f5ff8c9149 = Korkea-asteinen pallofunktiopainovoima (EGM2008 asteeseen { "2190" } asti)

seg-d3b2f32dcecb = Alivuototurvallinen ja napaturvallinen täysin normalisoidun kentän laskenta asteeseen { "2190" } asti (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes–Featherstone { "2002" } muokattu eteenpäin etenevä sarake, jonka gradientissa ei ole termiä 1/cos phi), suoratoistava ICGEM .gfc -lataaja (from_gfc_file / from_gfc_reader; täysi EGM2008 haetaan ajon aikana, ei sisällytetä mukaan) sekä Holmes–Featherstone-laskin, joka on valittavissa valinnaiseen Cowell-Geopotential-kohteeseen

seg-1960804ef2f4 = Etäisyysnopeuden ja atsimuutti/korkeuskulman eräkohtainen radanmääritys aseman maskauksella

seg-4c185244bc66 = Palauttaa epookin tilan sekoitetusta etäisyys-, etäisyysnopeus- ja atsimuutti/korkeuskulma-seurannasta korkeuskulmamaskin yläpuolella Gauss–Newton-menetelmällä H = (dh/dx(t)) Phi(t, t0): analyyttiset mittausosittaisderivaatat ja variaatiotilansiirtymämatriisi, jossa on analyyttiset kahden kappaleen + J2-osittaisderivaatat (RK4-integroitu, ei suljetun muodon STM)

seg-bc3d1ee7c639 = SP3-tarkkuuskoodin havaintopainotus

seg-63b1fab84f85 = Kuvaa SP3-tarkkuuskoodit (otsikon ++-eksponentit muodossa { "2" }^n mm, %f-kanta, tietuekohtaiset kanta^n mm -keskihajonnat) havaintokohtaisiksi paikan sigmoiksi tarkan radanmäärityksen moottorille (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ae3e8833a5ef = Liitä julkaistu painovoimakenttä kappaleeseen

seg-ffb2b20e5f32 = with_gravity_field (tyypillä Body, tiedostossa src/gravity_pds.rs): liittää minkä tahansa ladatun pallofunktiokentän (esimerkiksi GMM-3 tai GL0660B) kappaleeseen Body, jolloin propagaattori laskee sen kappaleeseen kiinnitettynä; valinnainen, oletuskappaleet muuttumattomia

seg-9762cf428435 = Navigointiviestien koodaimet GPS LNAV:n lisäksi (GPS CNAV, Galileo I/NAV ja F/NAV)

seg-9b703b9607d8 = GPS CNAV -viestityypit 10/11/30, Galileo I/NAV -sanatyypit 1–5 nimellisillä parillisilla/parittomilla sivuilla ja Galileo F/NAV -sivutyypit 1–4: ICD-kenttien pakkaus ja kvantisointi, CRC-24Q, nopeuden 1/2 K={ "7" } konvoluutiokoodaus (G2 käännettynä Galileolle), lohkolomitus ja synkronointikuviot, vastaavilla testidekoodereilla

seg-974d8c1f7876 = Koodin Hatch-kantoaaltotasoitus todellisilla RINEX-havainnoilla

seg-f26b5da0f52e = Hajaantumaton Hatch-suodatin (ionosfäärivapaa koodi ionosfäärivapaan kantoaallon kantamana, ikkuna N epookkia, uudelleenkäynnistys lukituksen menetyksessä, geometriavapaassa hypyssä tai aukossa) tarkan yhden pisteen paikannuksen kokoonpanossa

seg-278ca396127a = RINEX { "4" } -havaintotiedoston luku

seg-e0883aa933eb = RINEX 4.0x -havaintojen otsakkeet (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; selitteet sovitettu sarakkeisiin 61–80 versiosta { "4" } alkaen) ja epookkitietueet

seg-33e5c74720ff = BeiDou GEO:n lähetetty satelliittipaikka

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } geostationaarisen satelliitin paikka lähetetystä efemeridistä (inertiaalin kaltainen koordinaatisto, sitten Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valinnainen NavParseOptions-tyypin kentän include_beidou_geo kautta, joten oletuslukija ohittaa yhä GEO:t

seg-71f48628ebb2 = Kantoaaltovaiheeseen perustuva tiukasti kytketty GNSS/INS float-epävarmuuksilla

seg-5a156aa81275 = Virhetila-EKF { "15" } INS-tilan, kaksitilaisen vastaanottimen kellon ja yhden float-kantoaaltoepävarmuuden yli seurattua satelliittia kohti; pseudoetäisyys, kantoaallon vaihe ja valinnainen etäisyysnopeus SGP4 Walker -tähdistöstä (valon kulkuaika ja Sagnac), Klobuchar- ja Saastamoinen/Niell-korjaukset sovellettuna silmukassa suodattimen omassa paikassa; aikaerotettu kantoaaltohyppyjen havaitseminen satelliittikohtaisella kynnyksellä, jota nopeuden epävarmuus levittää; epävarmuuden uudelleenalustus hypyissä ja uudelleenhankinnassa

seg-7d644516b1ec = GNSS/INS-paketit meri-, rautatie- ja ilmailukäyttöön tiukan kytkennän valinnalla

seg-cbb03a8baf73 = Kolme gnss-ins-skenaariota liikeratakirjastossa (alus, joka kiemurtelee nopeudella { "8" } m/s viiden minuutin katkolla; juna kahden satelliitin leikkauksen ja tunnelin läpi; ilma-alus, jonka katko kattaa 25 asteen kallistetun käännöksen) ja paketin valinnainen [tight]-taulukko: pseudoetäisyydet SGP4 Walker -tähdistöstä yhdistetään suljetun silmukan navigaattorilla, nimellisesti jokainen maskin yläpuolella oleva satelliitti ja heikentyneenä korkeimmat muutama

seg-f4dab73c4eda = Kytketty pseudoetäisyys-PNT-suodatin vinoumatilalla ja 3D-laajennus fuusiopaketissa

seg-742b60089361 = Yksi pinottu Kalman-suodatin paikan, nopeuden, kellon vaiheen ja taajuuden yli, jota syötetään paikan ja kellon kytkevillä pseudoetäisyyksillä (Joseph-muotoiset päivitykset, jotka kantavat ristikovarianssin); 1-DOF-variantti, jota on laajennettu vakiokiihtyvyysmittarin vinoumatilalla ja jota fuusiopaketti ajaa kohdassa [coupled]; sekä 3D:n 8-tilainen versio näkölinjariveillä

seg-2db2b9dc3b45 = GNSS/INS-liikeratakirjasto ja CSV-totuuden tuonti

seg-e1fe83c75a6c = Valittavat liikeprofiilit gnss-ins-paketille (suora, figure-8-rata, kaupunkimainen pysähtely, ilma-aluksen nousu ja koordinoitu käännös, kartoitusdrooni), määriteltyinä Euler-nopeus- ja ratakiihtyvyyskomennoilla, jotka suljetaan totuustilaan kinemaattisella IMU:lla (keskeisvoima-, painovoima- ja Coriolis-termit), sekä tuotu CSV-totuus muunnettuna sen toistavaksi IMU:ksi; historiallinen ajo muuttumattomana, kun profiilia ei anneta

seg-86f9186bb884 = Maa–Kuu CR3BP { "9" }:{ "2" } NRHO CAPSTONEn lentämää rataa vasten

seg-d4127cf241f3 = Ympyräratainen rajoitettu { "9" }:{ "2" } L2:n eteläinen lähes suoraviivainen haloperrata, jonka cr3bp::differential_correct_halo korjaa (Gatewayn ja CAPSTONEn rataperhe), verrattuna keskimääräisen geometrian (jakso, perilunen säde, apolunen säde) osalta rataan, jonka CAPSTONE todella lensi. Mittaus siitä, kuinka hyvin CR3BP-jäsen kuvaa todellista rataa; CR3BP-rata ei ole efemeridimallin rata, eikä sitä verrata epookki epookilta

seg-1a5623c81b48 = Paikkavirhe geometriasta: RMS-virhe = sigma_UERE x DOP moottorin pienimmän neliösumman paikanteelle

seg-7a94b44a8738 = dop_error_mc::run_geometry ja check: siemenluvulla toistettava Monte Carlo (N = { "20,000" } epookkia geometriaa kohti, sigma = { "1.5" } m, ChaCha8-siemenluku { "36" } + i) moottorin oman iteroidun pienimmän neliösumman paikanteen (pvt::solve_spp, yksikköpainot, ratkaistu todellisesta paikasta) yli tiedoston tests/fixtures/dop/dop_reference.csv { "8" } geometrialla, vertaillen itä-, pohjois-, ylös- ja kellovirheen variansseja, H/V/P-RMS:ää, itä–pohjoinen-korrelaatiota, keskivirheitä ja { "95" } %:n vaakaellipsin sisään osuvaa osuutta sigma^{ "2" } Q:lla, missä Q on orbit::dop-ytimen kovarianssitekijä (orbit::dop_cofactor, sama aritmetiikka) samalla geometrialla

seg-9acfde1b57f7 = Geometriatietoinen luottamusluokitus: satelliittigeometria vastaanottimen luottamuspistemäärän rinnalla ja luokka jokaiselle vähennykselle

seg-6138c41e13ff = receiver_trust::geometry: epookkikohtainen satelliittigeometria (hyvä, heikentynyt syillä few-satellites/high-pdop/high-hdop/sky-blocked, tai tuntematon, kun loki ei anna GSV-, NAV-SAT- tai GSA-tietoa) johdettuna raportoiduista korkeus- ja atsimuuttikulmista funktiolla orbit::dop tai otettuna GSA:sta, jolloin selite raportoidaan aina eikä sitä koskaan pisteytetä (good, fair, poor, unknown), sekä HDOP, PDOP, VDOP, satelliittien lukumäärä ja signaalin menetys sanoin; aluksen pistemäärän geometriavalvonta, joka ei vähennä mitään ellei geometria ole huono (suhde max(hdop/4, pdop/6, 5/n_used) yli { "1" }) ja nousee sitten { "15" } pisteen kattoon arvolla { "1.5" }, jota pelkkä geometria ei voi viedä heikentyneen vyöhykkeen alle (katto, nousun loppu ja lattia kohdassa [geometry]; ei hälytystä); luokka jokaiselle vähennykselle (geometry, environment, inconsistency), jossa lukituksen menetys alle { "15" } asteen satelliiteille luokitellaan geometry, näkyvissä mutta seuraamatta olevat satelliitit environment, ja huonon geometrian vähennys, jonka ilmoitettu HDOP on yli max({ "1.0" }, { "25" } % johdetusta HDOP:sta) ilmoitetusta taivaasta, luokitellaan inconsistency

seg-bbb1828b3db1 = Katukanjonin, sektorien ja maaston supistaminen taulukoksi

seg-2864aec7be88 = skyline: katukanjoni suljetussa muodossa (leikkaus atan((h - a) / d), jossa d = (w/2) / abs(sin(az - s)), avoimet päät äärelliselle pituudelle), teräväreunaiset sektorit myötäpäivään kiertäen sekä maastopisteet taulukoksi supistettuina kaarevuuspudotuksella d^2/({ "2" } * 4/3 R); horisonttiviiva on niiden pisteittäinen maksimi minkä tahansa taulukon kanssa

seg-3f3d657854ce = Horisonttiesiasetukset (kaupungin katu, satamaan lähestyminen, vuono, konttiterminaali)

seg-b915c06fa3f1 = skyline::PRESETS: neljä REPRESENTATIVE-geometriaa suunnitteluselosteen ilmoittamilla mitoilla ja kullakin yhden rivin alkuperämerkintä: city-street (kanjoni, katu { "0" } astetta, { "20" } m { "30" } m korkeiden seinien välissä, antenni { "1.5" } m), harbour-approach (sektorit: avoin merelle { "180" } asteen alalla, satamarakennukset { "8" } astetta { "90" } asteen alalla, aallonmurtaja { "3" } astetta), fjord (maasto: seinät { "600" } m antennin yläpuolella { "1.5" } km:n päässä molemmin puolin pohjois-eteläsuuntaista väylää, kaarevuuspudotus huomioitu), container-terminal (sektorit: kontit { "12" } astetta maanpuoleisella puoliskolla, nosturin puomit { "35" } ja { "25" } astetta kahdella kapealla sektorilla); ohitettavissa kenttä kerrallaan

seg-6012113b4836 = Taivaan geometriafunktiot: näkyvyys, DOP, kovarianssi, virhe-ellipsi, Monte Carlo -pilvi

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> ja <c2/>, Python- ja WASM-funktiot samoilla nimillä, MCP <c3/>): paikasta, ajasta ja tähdistöesiasetuksista (tai atsimuutti/korkeuskulma- tai ECEF-satelliiteista) lasketaan näkyvät ja horisontin alla maskatut satelliitit, GDOP/PDOP/HDOP/VDOP/TDOP, yksikkövarianssin kofaktori (H^T H)^-1 ja kovarianssi itä-pohjoinen-ylös-koordinaatistossa yhdellä vastaanottimen kellolla järjestelmää kohti tai yhdellä yhteisellä, vaakavirheen ellipsi (isoakselit k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), suunta { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) pohjoisesta) sekä n siemenellä alustettua pienimmän neliösumman virhettä riippumattomilla gaussisilla etäisyysvirheillä, niiden empiirinen kovarianssi, RMS ja { "95" } %:n kattavuus. Kofaktori on orbit::cofactor_from_los, ainoa ydin orbit::dop:n ja orbit::dop_cov:n takana (dop on dop_cov:n supistus): ei toista DOP-toteutusta

seg-7f66be0f15c8 = GNSS-vapaa kellon holdover

seg-4d8f87668a0f = Suljetun muodon vapaaliukuvirheen kasvu + holdover kynnykseen; kvanttikelloluokat

seg-29b482d88916 = Mitatut kellolaitekortit (pidätetty ennuste)

seg-8c68c5b25004 = clock_library: laitekortti (valkoinen vaihe, valkoinen, flicker- ja random-walk-FM sekä lineaarinen taajuuden ajautuma) sovitettuna yhteen kolmasosaan nimetystä mitatusta kellotallenteesta lokatun esikäsittelykierroksen jälkeen (aukot, vaiheen poikkeavat arvot, vaihehypyt ja purskeet poistettu; taajuushypyt lokattu), painotettuna lag-1-menetelmällä tunnistetuilla kohinatyyppien vapausasteilla, ja sen ennustettu Allanin poikkeama pisteytetään pidätetyillä kahdella kolmasosalla; lukijat RINEX- ja IGS-kellotiedostoille, BIPM:n laboratoriokohtaisille tiedostoille ja Circular T:n osalle { "1" }; kortin muunnos aikaväliajoituksen kohinamalliksi, laajennetuksi Kalman-kellomalliksi ja harhautusmonitorin kohinatasoiksi

seg-5097a0e6460d = Mitatut GPS Block IIF -kellokortit kierroskohtaisilla termeillä (pidätetty ennuste)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: laitekortti, joka sisältää yhden–neljän kierroskohtaisen vaihetermin (jakso T/k, T = { "43 082.05" } s), sovitettuna yhdessä toisen asteen termin kanssa pienimmän neliösumman menetelmällä yhteen kolmasosaan mitatusta satelliittikellotallenteesta, kunkin termin suljetun muodon Allan-osuus { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ennustetussa Allanin poikkeamassa

seg-0d72fcc0fbea = Aluksen kellotilan estimointi

seg-6db5391f8ebe = 3-tilainen (vaihe/taajuus/ajautuma) van-Loan-Kalman-kello, Joseph-vakautettu

seg-3f0a9d7c2971 = Ajansiirron virhebudjetointi

seg-216f46b43860 = Kaksisuuntainen/TWSTFT (Sagnac), GNSS-yhteisnäkymä, PPP; linkin jitter→etäisyys

seg-157fadeb5d67 = Navigointisignaalin modulaatio ja koodinseurannan analyysi

seg-ab633d191396 = BPSK-R/BOC-PSD, spektrierotus κ, Gaborin kaistanleveys, DLL-jitter, monitie-eteneminen

seg-e6c08e1e6ae3 = Kvanttiinertia-anturin suorituskyky

seg-d28e1f6a430f = Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN)

seg-4b79d03cecf5 = Kvanttiinertia-anturin vyöhykeepäselvyys / dynaaminen alue

seg-deb2850546d5 = Mach–Zehnder-vyöhykeepäselvyyden dynaaminen alue: 2π-jaksollinen vyölukema asettaa suurimman yksiselitteisen ominaisvoiman a_max=π/(k_eff·T²), ja yksiselitteinen alue erottelusoluina a_max/σ_a=π/σ_Φ on riippumaton optisesta asteikkokertoimesta – T²-herkkyyshyöty maksaa yksiselitteistä aluetta täsmälleen samassa suhteessa (kyselyaika vaihtaa erottelukykyä alueeseen, ja solujen lukumäärän määrää vyölukeman vaihekohina)

seg-d04bf321d4a1 = Kvanttiinertiaalinen koneellinen paikanlasku (dead reckoning) kestävyytenä

seg-c4989abb5d40 = Koottu harha + asteikkokerroin + VRW + vakauden vaimenemisen paikkabudjetti holdoverin aikana

seg-5692c7b936b6 = GNSS-vapaa häirinnän kestävyys

seg-f4ff77caa47b = Geometrinen J/S-linkkibudjetti, häirinnänsietävä C/N₀, satelliittikohtainen lukituksen menetys

seg-ff90679d1de9 = Harhautuksen (spoofing) havaitseminen

seg-b843f63e77e6 = Kellon avustama χ², RAIM, AGC ja SQM yhdistettynä epookkikohtaiseksi turvallisuuden laatumittariksi

seg-b10d07921f5e = Ajoituksen suojaustaso harhautuksen (spoofing) aikana

seg-2a829711b997 = Suljetun muodon yläraja pahimman tapauksen havaitsemattomalle aikavirheelle = monitorin lattia + oskillaattorin vapaaliuku-σ CUSUM-havaitsemisviiveen aikana, raportoituna punaisen kohinan lattiakaistana

seg-f1d49eac89f8 = Vaihtoehtoinen / täydentävä PNT

seg-023dda973f66 = Painovoimakarttasovitus, maastoon perustuva (TERCOM/SITAN), magneettinen poikkeama

seg-791e7285c291 = Toistettavuus ja ohjelmistovarmistus

seg-7177355a482c = Deterministiset, skenaariotiivisteellä varustetut, SBOM- ja alustojen välisten golden-porttien tarkistukset

seg-241f2eeaef12 = Nimiöity synteettinen häiriökorpus + ilmaisimesta riippumaton ROC/AUC/sekaannus/Pfa-Pmd-testialusta; vuotosuoja, kerrostettu jako, jakaumasiirtymän (alueen sisällä vs ulkopuolella) optimismiraportti. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/impairment-eval.toml)

seg-642087659fda = Kontrolloitu synteettinen tutkimus jakauman sisäisen ja ulkopuolisen AUC-optimismikuilun suuruudesta julkaistuilla menetelmillä ja opituilla (logistinen regressio / yhden piilokerroksen MLP) ilmaisimilla: luokkakohtaiset skaalauslakitrendit (Spearmanin ρ + kulmakerroin muuttujalla { "1" }−vakavuus) ja vain jakauman sisäisiin diagnostiikkoihin perustuva harjanneregressio-ennustin, joka arvioi kuilun, pisteytettynä jättämällä yksi ilmaisin pois ja jättämällä yksi luokka pois. Toistettavissa komennolla <c1/>

seg-fd6424213d1f = Kvantti- ja klassisen PNT:n vertailu sekä GNSS-vapaa kestävyys ({ "13503" })

seg-21b2b54200a8 = Mitatun ADEV:n sisäänotto (NNLS), vertailutaulukko (ajoituksen/inertian holdover + hyöty), kestävyys-aika-verhokäyrä; lattiaa koskeva varoitus kulkee artefaktin mukana. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/quantum-trade.toml)

seg-1fa865bfddd1 = Avaruussääympäristö ja aktiivisuudesta riippuva termosfäärin tiheys

seg-47308f611c7e = Aurinko- ja geomagneettiset indeksit (määritelmällinen Kp↔ap-taulukko), Jacchia-1971:n eksosfäärin lämpötila ja Jacchia { "1971" } -termosfääritiheys (SAO Special Report { "332" }: staattiset diffuusioprofiilit, jotka toistavat sen taulukon { "7" }, sekä vuorokausi-, geomagneettiset, puolivuotis-, vuodenaika-leveysaste- ja heliumvaihtelut) staattista USSA76-ilmakehää vasten. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/space-weather.toml)

seg-c76b8c395ef0 = Laukaisuikkuna ja nousugeometria (tehtäväanalyysi)

seg-6066c634faba = Kahden kappaleen laukaisuatsimuutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräradan nopeus, Maan pyörimisen itäsuuntainen hyöty, dogleg-tasonmuutoksen Δv ja päivittäiset mahdollisuudet sekä, kun annetaan epookki ja IERS finals2000A -rivit, aseman nopeus todellisen navan ympäri (launch::site_rotation_speed_at). Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistinen paluukäytävä (Allen–Eggers)

seg-c3f3422f96e4 = Huippuhidastuvuus (ballistisesta kertoimesta riippumaton), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus eksponentiaalisen ilmakehän ballistiselle paluulle. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/reentry.toml)

seg-7b4a8e25c3c9 = DVB-S2 mukautuva koodaus ja modulaatio LEO-alalinkin ylilennon aikana

seg-3912fb8ccb15 = Alalinkin Es/N0 yhden satelliitin jokaisen ylilennon aikana yhden aseman yli (EIRP, vapaan tilan häviö, kosekanttilain ilmakehähäviö, muut häviöt, G/T, Boltzmannin vakio, symbolinopeus), tehokkain DVB-S2 MODCOD, joka ylittää ETSI EN { "302" } 307-1 V1.4.1 taulukon { "13" } lähes virheettömän kynnyksen lisättynä toteutusmarginaalilla kussakin vaiheessa, ylilennon ACM-datamäärä sekä vakiokoodauksen vertailutaso, joka sulkeutuu maskilla ja pisimmällä etäisyydellä. Ajettavissa skenaariolajina <c1/>. Havainnollistavat syötteet; MODELLED.

seg-19603a7e0fe8 = Usean satelliitin ja usean aseman maayhteyksien aikataulutus konfliktinratkaisulla

seg-40edeae6e48b = Ehdokasyhteydet jokaisesta satelliitti-asema-ylilennosta ACM-datamäärineen; konfliktit, joissa yksi antenni palvelisi kahta satelliittia käännösaikansa sisällä tai yksi satelliitti lähettäisi alalinkillä kahdelle asemalle yhtä aikaa; prioriteettipainotettu toimitustavoite, jota rajoittaa kunkin satelliitin kertymä; laiska rajahyötyyn perustuva ahne suunnitelma, ensin tullut ensin palvellaan -vertailutaso ja tarkka branch and bound enintään { "26" } ehdokkaalle, ahneen ratkaisun optimaalisuuskuilu raportoituna. Ajettavissa skenaariolajina <c1/>. Havainnollistavat syötteet; MODELLED.

seg-3742d2aea62a = Taloudellinen kustannus/kattavuus- ja ROI-kehystys

seg-4228311689f8 = Kustannus per kattavuusprosentti + kattavuus per euro -ROI tähdistön mitoitusmoottorin päälle; satelliittikohtainen kustannus on kutsujan hankkima matala/nimellinen/korkea-haarukka (ei keksittyjä hintoja)

seg-8ba6ee9acc8a = Havaitsemattoman häiriön eheysvaikutus (kontekstitietoinen HPL/VPL vs hälytysraja)

seg-f5985399d0d5 = Kuvaa havaitsemattoman harhautus- (spoofing) tai häirintäharhan (jamming) tehokkaaksi virheeksi → Stanford-alue (available/unavailable/MI/HMI) kontekstikohtaisia HAL/VAL-arvoja vasten (avoin taivas vs kaupunki)

seg-37d43b5b918a = CAI:n viitattu virhemalliparametrilehti ({ "13503" })

seg-0b6a901f5ad2 = Haarukoitu (paras/nimellinen/konservatiivinen) kylmäatomi-interferometrin suorituskyky – harhan epävakaus, nopeus-/kulmasatunnaiskävely, asteikkokertoimen vakaus, kyselyajan rajoittama näytteenottotaajuus, vyöepäselvyyden dynaaminen alue – jokainen lähdeviitteen kautta jäljitettävissä; syöttää QuantumNavBudgetia mallintamatta laitteistoa

seg-c93f2d3a3167 = Ajoituksen eheyden yhdenmukaisuusbenchmark – Stanford-eheyskaavion epookkiluokittelija

seg-712d5c35a6a6 = TIB:n Stanford-eheyskaavion epookkiluokittelu (nominal / unavailable / MI / HMI)

seg-573aa0193cb3 = Ajoituksen eheyden yhdenmukaisuusbenchmark – eheyskattavuuden pisteytin

seg-4d86f3c2d8f5 = TIB:n eheyskattavuuden pisteytys (HMI/MI/saatavuusluvut + ylärajan kattavuusverdikti)

seg-372dd0fdb025 = Ajoituksen eheyden yhdenmukaisuusbenchmark – vikakatalogi (parametriset generaattorit)

seg-2604e7cf27d2 = TIB:n vikavalikoima (domain-divergence, clock-slam, holdover-coast, staattinen/inkrementaalinen/symmetrinen/epäsymmetrinen viive, replay-within-freshness, path-selective, k-of-N quorum)

seg-90c0eb1e7c14 = Ajoituksen eheyden yhdenmukaisuusbenchmark – havaitsemattoman absorboitumisen verdikti

seg-f713acf042ff = TIB:n havaitsemattoman absorboitumisen verdikti (symmetrinen/replay on absorboitava PL:ään, ei koskaan raportoitava havaituksi)

seg-8adbbd2cdb74 = Hybridi optinen/RF-raportin itsekuvaus

seg-2a5e48b558e1 = Raportti hybrid-optical-rf ilmoittaa linkkikonfiguraation, jolla se todella ajettiin (kantoaallon aallonpituus, lähetys- ja vastaanottoapertuuri, etäisyys, pulssin leveys, integrointiaika, hyötysuhteet ja häviöt, oletukset ratkaistuina) ja sisältää yksikkölohkon, joka antaa jokaisen sellaisen suureen yksikön ja alkuperäluokan, jonka artikkeli todennäköisesti lainaa, mukaan lukien siirtokovarianssin jäljet neliömetreinä

seg-0691f3dee8cb = Hybridi optisen/RF-linkin saatavuus RF-puolella

seg-72ccb655caf0 = Raportti hybrid-optical-rf ilmoittaa RF-linkin saatavuuden, joka on koottu suureista, jotka moottori jo laskee, ei tuodusta ilmastotiedosta, ja ilmoittaa koostamisen nimettynä sääntönä: A_rf = I_closure * I_track, jossa I_closure on yksisuuntaisen CCSDS-401 / DSN-810-005 -linkkibudjetin (linkbudget::link_budget, Eb/N0-marginaali >= { "0" }) sulkeutumisverdikti skenaarion omalla etäisyydellä ja I_track on seurantasilmukan verdikti (jamming::lock_status) siitä C/N0:sta, jonka SAMA budjetti palautti. Jokainen tekijä vie syötteensä alkuperäluokan läpi tulosteeseen, ja tekijät, jotka tarkoituksella EIVÄT ole tulossa mukana – geometrinen näkyvyys, häiriön aiheuttama esto ja RF-katkosten ilmastotiedot – nimetään syineen sen sijaan, että ne asetettaisiin hiljaa arvoon { "1" }. Ratkaistu RF-osuus toistetaan omana rf_link_configuration-lohkonaan, ja indikaattorin vieressä olevat jatkuvat luvut (linkin marginaali, C/N0-marginaali, suljetun muodon sulkeutumis- ja seurantaetäisyydet sekä etäisyyden käyttöaste) ovat saman budjetin etäisyyskäänteisfunktioita. Raportti toteaa täydessä laajuudessaan lohkossa ja yksikkömerkinnässä, johon lukija päätyy, että tämä luku on MARGINAALIN/GEOMETRIAN RAJOITTAMA ja DETERMINISTINEN, kun taas optinen saatavuus on SÄÄN/ILMASTOTIEDON RAJOITTAMA ja todennäköisyyspohjainen, joten niitä ei voi koskaan esittää vertailukelpoisena prosenttilukuparina

seg-22c5df9b6c7c = Vertailukelpoinen optisen ja RF-etäisyysmittauksen vertailu

seg-70eb396f40af = Raportti hybrid-optical-rf antaa optisen ja RF-etäisyysmittauksen suhteen siten, että YKSI konfiguraatio, jolla molemmat osuudet arvioitiin, kulkee samassa oliossa: sama yksisuuntainen reitti, sama etäisyys ja sama kertymäaika. Optinen osuus on moottorin fotonirajoitteinen ToA-CRLB yksisuuntaisella fotonimäärällä; RF-osuus on moottorin DLL:n early-late-lämpökoodinseurantajitter sillä C/N0:lla, jonka moottorin oma linkkibudjetti palauttaa samalle yksisuuntaiselle etäisyydelle. Silmukan kohinakaistanleveys johdetaan, ei valita: B_L = 1/({ "2" }*integration_s) asettaa RF-osuuden täsmälleen optiseen kertymäaikaan, ja jos kutsuja ohittaa sen niin, että kaksi keskiarvoistusaikaa eroavat, suhde on REFUSED – null, ristiriita ja molemmat ajat nimettyinä – sen sijaan, että se esitettäisiin kahdessa toimintapisteessä. Suhdetta ei muodosteta skenaarion VALITTUA parametrista rf_position_sigma_m -arvoa vasten, ja kieltäytyminen kertoo syyn: tuo syöte ei sisällä lainkaan konfiguraatiota. Julkaistu kaksisuuntainen optinen otsikkoluku ja tarkka kerroin, joka yhdistää sen yksisuuntaiseen vertailuosuuteen, annetaan suhteen vieressä, jotta raporttia ei voi lukea kahden keskenään ristiriitaisen optisen sigman kantajana

seg-3f26f598e013 = Linkkibudjettiraportin itsekuvaus

seg-b88bf41d6d4c = Linkkibudjettiraportti ilmoittaa jokaisen absoluuttisen vakion, josta sen oma marginaali laskettiin – kantoaaltotaajuuden, jota vapaan tilan häviö käytti, EIRP:n, laatuluvun, summatun häviön ja Boltzmannin termin – sekä vaaditun G/T:n, jolla marginaali on nolla, linkkivakion (EIRP - häviöt - vaadittu Eb/N0), joka on ainoa yhdistelmä, jonka julkaistu nopeus/vahvistus-taulukko voi koskaan kiinnittää, ja kun kutsuja ilmoittaa järjestelmän kohinalämpötilan, vastaanottoantennin vahvistuksen, jonka tuo laatuluku edellyttää

seg-a7b192e27cb5 = Kelloluokkakohtainen Kuun ajan risteystaulukko

seg-cab605dc6ea2 = Yksi Kuun aikabudjetin ajo tuottaa kello-vs-koordinaatisto-risteysrivin jokaiselle kelloluokalle yhtä jaettua koordinaatistotermiä vasten, joten kello on ainoa vertailun muuttuja; jokainen rivi kantaa kahdella tavalla saavutetun risteyksen – bisektiolla yleisestä potenssilakiaikavirhekäyrästä ja algebrallisesti käänteisfunktiolla rivin hallitsevasta kohinatyypistä – sekä niiden suhteellisen eron

seg-18c72a7565d6 = Kaappausjalanjälki korkeuden ja keilanleveyden funktiona

seg-9c30a0ab5233 = Kaksiakselinen pyyhkäisy kuviopainotetusta, korkeusrajoitetusta pintakaappausjalanjäljestä lähettimen korkeuden ja antennin halkaisijan yli, yksi rivi toimintapistettä kohti ja kunkin halkaisijan edellyttämä puolitehokeilanleveys, sekä limbin kaappaus raportoituna KYNNYKSENÄ – riviä kohti limbin J/S, sen marginaali ja lähetysteho, joka sulkisi sen; ruudukkoa kohti paikannetut ylitykset tai nimenomainen toteamus siitä, ettei limbiä saavuteta missään ruudukossa, vajeen kanssa

seg-fc0a64b9a280 = Kuun aikavirhebudjetin toistettavuus

seg-5d5970506b9c = Skenaario lunar-time-budget julkaisee taulukkoarvoiset tulosteensa pitkän muodon (ruudukkoindeksi, keskiarvoistusaika, termi) taulukkona raportin rinnalla, joten seitsemän termikohtaista x(tau)-käyrää ja neliösummakokonaisuus ovat moottorin tulostetta eikä jotain, minkä lukija rakentaa uudelleen menetelmäosiosta

seg-675887733454 = Kuun aseman aikalaboratorio: miniRAFS-holdover vs LTC

seg-7dfedc40da6a = Skenaarion lunar-time-budget valinnainen [time_lab]-lohko mallintaa Kuun vertailuaseman kelloa (oletuksena miniRAFS-luokka, tai mikä tahansa nimetty luokka, tai ilmoitettuihin vakauspisteisiin sovitettu laitekortti), joka ohjataan Kuun koordinaattiaikaan ja sen jälkeen joko vapaasti käyvänä tai uudelleenohjattuna N sekunnin välein: aikavirhekäyrä x(t) kellon potenssilakitermin, vakioisen ohjausjäännöksen (ILLUSTRATIVE), vakioisen LTC-toteutusjäännöksen ja valinnaisesti mukaan otettavan aseman korkeuden nopeustermin neliösummana; ohjauksen jälkeinen aika arvoihin { "1" }, { "10" } ja { "100" } ns (tai ilmoitetut kynnykset) bisektiolla hallitsevan kohinatyypin suljetun muodon käänteisfunktion rinnalla sekä hallitseva termi kullakin ilmoitetulla horisontilla, kaikki yksiköineen

seg-af3ff120b707 = Kuun geodeettinen VLBI

seg-cfd7d0126028 = Lähikentän VLBI-viive Maa-peruslinjalle, joka havaitsee Kuun majakan + osittaisderivaatat

seg-e08e98908f3a = Maan GNSS Kuun etäisyydellä

seg-dd8ce373d1f6 = Maan GNSS:n vastaanotto Kuun etäisyydellä: heikon signaalin kerros, jonka P7:n taulukko { "1" } nimeää ja jolle moottorilla ei ollut mallia. Satelliittia ja epookkia kohti se laskee poikkeaman keilan akselista suhteessa lähettimen nadiriin, peittääkö Maa suoran reitin, vinoetäisyyden ja sen vapaan tilan häviön, lähetysvahvistuksen tässä kulmassa, vastaanotetun tehon ja kantoaalto-kohinatiheyden; sen jälkeen se aggregoi vain linkit, jotka ylittävät seurantakynnyksen, ja pyyhkäisee koko tähdistökierroksen, jotta vastaus on JAKAUMA eikä yksittäinen otos. Kolme tosiasiaa ohjaa tulosta, ja raportti toteaa jokaisen: Maa näkyy { "13.90" } asteen kulmassa tähdistön säteeltä, joten keilan HUIPPU ei ole geometrisesti saatavilla yhdellekään Kuuhun suuntautuvalle säteelle; jäljelle jää pääkeilan reuna ja sivukeilat, se alue, jossa LuGRE toimi Kuussa { "2025" }; ja L1-polun häviö on noin { "208" } dB, noin { "25" } dB enemmän kuin maanpäällinen käyttäjä maksaa. MEASURED mukana toimitetulla 24 satelliitin GPS-luokan geometrialla { "64" } epookin yli yhden kiertojakson ajan: SIGNAALIN saatavuus { "0.375" } parhaan linkin ollessa { "30.93" } dB-Hz ja PAIKKARATKAISUN saatavuus { "0.000" } – enintään kaksi samanaikaista seurattavaa linkkiä, ei koskaan neljää, jonka paikka vaatii. Näiden kahden saatavuuden erottelu on koko pointti, ja raportti ei salli niiden sekoittamista: Maan GNSS Kuun etäisyydellä on AJOITUSLUOKAN kerros, ei paikkaluokan, ja kerroksellisen kestävyyden priorin on otettava paikkaratkaisun saatavuus. Ehdollisuus annetaan samasta syystä – jokainen näkyvä satelliitti on Kuusta nähtynä muutaman asteen levyisen kartion sisällä, joten näkölinjat ovat rakenteellisesti lähes yhdensuuntaisia. Ajettavissa lajina <c1/> Uudelleenmuotoiltu D7:n mukaan: väite Kuun etäisyydellä on satelliittien välinen SUHTEELLINEN kantoaalto-kohinatiheys yhdessä epookissa, mitatuista kaksiulotteisista lähetyskuvioista (NAVCEN Block IIR/IIR-M) sekä geometrinen näkyvyys; absoluuttista C/N0:aa ei väitetä (Parker ym. raportoivat yhteisen { "7" } – { "12" } dB:n häviön).

seg-29df5b40a3f9 = Kuun radanmääritys: Maan GNSS vs maalta tehty radiometrinen mittaus

seg-647902ebcee3 = Radanmääritys lähes suoraviivaisella haloradalla (tai elliptisellä jäädytetyllä radalla) kahdesta riippumattomasta datatyypistä: aluksella vastaanotetut Maan GNSS:n pseudoetäisyydet (rivin Earth-GNSS-at-lunar-distance linkkisääntö sekä Kuun peitto) ja kolmen Deep Space Network -aseman maalta tehdyt kaksisuuntaiset etäisyys- ja etäisyysnopeusmittaukset. Kumpikin on yhden askeleen eräkäsittelyn pienimmän neliösumman ratkaisu vertailuradan ympäri formaalilla kovarianssillaan; siemenellä alustettu Monte Carlo kahden estimaatin erolle testaa, selittävätkö kaksi kovarianssia eron (q = d' (P_G + P_R)^-1 d, khiin neliö kuudella vapausasteella, kun mallit täsmäävät) ja mitä mallintamaton kiihtyvyys tekee tunnusluvulle.

seg-652bdc29deea = Kuun kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu: pinta ja kiertolainen

seg-02496f9e9af2 = Vastaanottimien välinen yksittäisdifferentioitu Maan GNSS:n kantoaallon vaihe ja koodi Kuun pinta-asemalla ja kiertolaisella, epookkikohtainen kellosta aiheutuva ero profiloituna pois, yksi kokonaislukuepävarmuus jatkuvaa ylilentoa kohti ja pisin ylilento mittapuuna. Float-ratkaisun kovarianssi on Schurin komplementti; LAMBDA ratkaisee kokonaisluvut, bootstrap-menetelmän onnistumisosuus raportoidaan siemenellä alustetun Monte Carlo -kokonaislukuvähimmäisneliösumman onnistumisosuuden sekä float- ja kiinnitettyjen paikkasigmojen rinnalla. Raportoitu sellaisena kuin löydettiin: rekisteröidyllä { "12" } dBi:llä kaksoisdifferenssiongelmaa ei voida muodostaa (muutos { "1" } siirsi oletuksen arvoon { "25" } dBi vasta kun vain saatavuuslaskennat oli nähty), ja { "25" } dBi:llä kokonaislukukiinnitystä EI saavuteta – se on ulottumattomissa (korkeintaan muutama prosentti), vaikka float-ratkaisu paranee kaaren myötä.

seg-11dd1bb8e4e1 = Kuun koordinaatiston yhteisestimointi: pinta-asemat ja kiertolaiset

seg-a38c8d95e6c9 = Seitsenparametrisen Kuun koordinaatiston datumin Fisher-informaatio Maa-aseman laseretäisyysmittauksesta viiteen heijastimeen yksin ja kiertolaisen ja pinta-aseman välisten etäisyyksien kanssa: informaatiomatriisi, aste, Cramér–Rao-sigmat, Kuun tunnistettavuusmoduulin degeneroituneisuusmitta ja siemenellä alustetut satunnaiset asemajoukot. Rata oletetaan tunnetuksi Kuun akseleissa (sen virhe kulkee kiertolaisen etäisyyssigman mukana).

seg-862977c4bb01 = Avaruussidoksen koordinaatistosidoksen toistotarkkuus: samassa paikassa sijaitseva GNSS, VLBI ja laseretäisyysmittaus

seg-a9ae8e99f00d = GNSS-, VLBI- ja laseretäisyysmittauskoordinaatistojen välisten tekniikkojen välisten siirto-, mittakaava- ja kiertosiirtymien Cramér–Rao-toistotarkkuus, kun yksi avaruusalus kantaa kaikkia kolmea, avaruusaluksen paikka eliminoituna jokaisessa epookissa ja yhdeksän paikallisen sidoksen häiriöparametria priorilla, pyyhkäisty paikallisen sidoksen tarkkuuden yli. Kovarianssit neliöjuurireittiä (normaaliyhtälöt menettävät numerot, kun tekniikat ovat lähes täydellisiä).

seg-ae627996875e = Kuun Love-lukujen ja libraation herkkyys

seg-28780d07c4a7 = Suureiden h2, k2, l2 ja fysikaalisten libraatioamplitudien Fisher-informaatio laseretäisyysmittauksesta (säteittäinen ja vaakasuuntainen vuorovesisiirtymä, heijastimen kierto), kiertolaisen seurannasta (asteen 2 k2-kiihtyvyys integroituna näkölinjaa pitkin, trendi poistettuna), pinta-gravimetristä (gravimetrinen tekijä { "1" } + h2 - { "1.5" } k2) ja pintakellosta (suhteellinen nopeus ({ "1" } + k2 - h2) W2/c2, sidottu Kuun aikavakioihin). Suureiden h2 ja l2 nimellisarvot ovat linearisointipisteitä; tutkimus kertoo, mikä on herkkä millekin, ei sitä, mitä luvut ovat.

seg-da712b740519 = Kuun pintamajakoiden DOP-täydennys

seg-83e6341e01b1 = Majakoilla täydennetty tarkkuuden heikkenemiskerroin (DOP) Kuun pinnan käyttäjälle: näkyvien satelliittien näkölinjarivit ja näkyvien pintamajakoiden etäisyysmittausrivit yhdistetään yhdeksi suunnittelumatriisiksi ja arvioidaan jaetun DOP-ytimen kautta, ja tuloksena oleva DOP kuvataan toteutuneeksi 1-sigman tarkkuudeksi METREINÄ majakkakohtaisen käyttäjän vastaavan etäisyysvirheen kautta, joka kootaan kellosynkronoinnin, monitie-etenemisen ja kartoitustermien neliösummana. Majakan näkyvyys on ilmattoman Kuun kahden korkeuden geometrinen horisontti, jolla ei ole refraktiivista laajennusta ja joka on siksi tarkka eikä likimääräinen. Ajettavissa skenaariolajina <c1/>, joka raportoi pelkät satelliitit, satelliitit plus majakat ja suuremman tähdistön kilpailevana reittinä samaan geometriaan. MEASURED mukana toimitetulla golden-geometrialla (käyttäjä -80 asteessa, kolme kartoitettua majakkaa, kuuden satelliitin havainnollistava LCNS hetkellä t={ "0" }, { "5" } asteen maski): { "5" } näkyvää satelliittia antaa PDOP-arvon { "9.6941" } ja 3D-1-sigman { "11.222" } m; lisäämällä majakat, jotka todella ylittävät horisontin, saadaan PDOP { "4.1160" } ja { "4.765" } m, kerroin { "2.355" }; 24 satelliitin palvelu antaa sen sijaan PDOP-arvon { "2.4226" } ja { "2.804" } m, kerroin { "4.002" }. Raportti tulostaa NÄKYVIEN majakoiden määrän eikä määritettyä, ja tällä geometrialla vain YKSI kolmesta majakasta ylittää horisontin: kaksi reunimmaista paikkaa ovat noin { "333" } km:n päässä käyttäjästä { "2" } m:n antennin { "86" } km:n horisonttia vasten, joten lukijan ei koskaan jätetä olettamaan kaikkien kolmen vaikuttaneen

seg-845e9f5eec81 = Yhteismoodin suojaustaso ja eheyden kokonaisverhokäyrä

seg-e4ec41d0f5e1 = Kuun absoluuttisen aseman havaittavuus (datumvaje)

seg-b3e4160042d2 = Yhteisen Kuun ratkaisun Fisher-informaatiohavaittavuus: ilman Maa-peruslinjoja absoluuttisen koordinaatiston datum on matriisin HᵀWH nolla-avaruudessa (aseman sijaintia ei voi havaita); ≥{ "3" } peruslinjaa palauttaa täyden asteen ja rajaa aseman Cramér–Rao-virheen, jonka estimaattori saavuttaa

seg-2ed7181c97dd = LunaNet AFS -levityskoodien generointi (LSIS V1.0)

seg-13ff6c381275 = LSIS V1.0:n Augmented Forward Signal -koodit ({ "29" } tammikuuta { "2025" }): AFS-Q:n 10230 sirun primäärikoodi generoituna IS-GPS-800 L1C -pilottirakenteesta IS-GPS-800J-indekseillä (samat { "210" } määritystä, jotka LSIS:n liite D tulostaa), AFS-I:n 2046 sirun Gold-koodit generoituna polynomeista g1 = x^{ "11" } + x^{ "2" } + { "1" } ja g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, kunkin PRN:n G2-viive palautettuna standardin liitteen { "3" } tiedostosta, neljä sekundäärikoodia, 1500 sirun tertiäärikoodit, välivaiheen taulukon { "11" } solmumääritys ja portaittainen pilottikoodi. LSIS-sisältö luetaan ajon aikana SHA-256-varmennetusta paikallisesta välimuistista, joka täytetään NASAn ylläpitämästä PDF-tiedostosta; sitä ei koskaan jaeta edelleen

seg-56c7aeac59c1 = LunaNet AFS:n suljetun silmukan dekoodattavuus riippumattomalla vastaanottimella (LSIS V1.0)

seg-da2d29d437b0 = Kshanan AFS-tallenne, jonka riippumaton ohjelmistovastaanotin sieppasi, seurasi ja dekoodasi ja jota verrattiin tallenteen omiin totuusmerkintöihin. Tämä osoittaa vain, että tallenne vastaa standardia ja että merkinnät ovat johdonmukaisia; se ei ole väite kanavafysiikasta, etenemisestä, vastaanotetusta tehosta tai linkkibudjeteista, joiden arvot tallenteessa ovat valittuja syötteitä

seg-780369fb9a54 = GPS L1 C/A -generaattorien välinen vertailu

seg-ee47b60515f1 = GPS L1 C/A -levityskoodit (sdr::CaCode) ja LNAV-alikehykset 1-3 (gps_lnav: IS-GPS-200-kenttien kvantisointi spesifikaation piin arvolla, kahden komplementin pakkaus, TLM- ja HOW-sanat, taulukon 20-XIV pariteetti D29*/D30*-inversiolla, sanojen { "2" } ja { "10" } pariteettia ratkaisevat bitit) verrattuna bitti bitiltä gps-sdr-simiin sen mukana tulevalla tiedostolla brdc0010.22n ({ "32" } satelliittia)

seg-bf429c8f00fb = GNSS IQ -sieppaus riippumattomasti generoiduilla I/Q-näytteillä

seg-9a0c52bfb06e = iq::acq::acquire (FFT-rinnakkainen koodivaihehaku neliölakisella Marcum-Q-kynnyksellä) GpsL1Ca-replikalla, gps-sdr-simin oman 8-bittisen I/Q-tulosteen jaksolta { "20" } ms, jonka iq::io-näytedekooderi on dekoodannut (ci8, { "2.6" } MHz, { "11" } satelliittia, ei kohinaa): jokainen PRN { "1" }–{ "32" } haettu kahdessa ikkunassa (kukin { "10" } ms), tulosta verrattu koodivaiheeseen ja Doppleriin, jonka gps-sdr-sim moduloi

seg-f40dc3dac990 = Laboratoriotoistokampanjoissa pisteytetyt IQ-monitorit: havaitseminen, havaitsematta jääneet tapahtumat, väärät hälytykset ja väärän hälytyksen suljetun muodon luvut

seg-93fb3109728c = iq::campaign::detect ja kampanjan ajaja: valinnainen [monitors]-taulukko ajaa IQ-monitorit jokaisessa solussa ajajan yhdellä läpikäynnillä. Teho- ja spektrimonitorit näkevät näytteet kunkin etupään ketjun jälkeen; C/N0-, SQM- ja lukitusmonitorit näkevät kunkin seuratun kanavan silmukkapäivitykset. Jokainen hälytys pisteytetään ilmoitettuja tapahtumia vasten: havaittu tai havaitsematta jäänyt per (tapahtuma, hälytyslaji, kanava), havaitsemisaika ja tapahtumien ulkopuoliset väärät hälytykset suhteessa niiden altistukseen. Kunkin testin suljetun muodon väärän hälytyksen luku ilmoitetaan: teho per lohko (tarkka Gamma-häntä), spektrin ylijäämä per lohko (approksimaatio), huipukkuus (yksipuolinen Gaussin), pulssit (binomiyläraja), SQM per keskiarvoistettu päivitys (2Q(k) = Q(1/2, k^2/2), uusi) ja C/N0 CUSUM:n ARL0 (Siegmund). Ilman taulukkoa solut, avaimet ja tiivisteet pysyvät ennallaan. Mitään häiriöaaltomuotoa ei synteesoida

seg-5b7eb7ddb474 = IQ-monitorien havaitsemis-ROC pisteytetystä laboratoriotoistokampanjasta

seg-57fe85965c9c = iq::campaign::detect (windows, roc) ja iq::campaign::report::rocs: monitoreilla varustetun kampanjan jokainen solu säilyttää hälytyslajia ja kanavaa kohti monitorin oman testitunnusluvun maksimin kunkin ilmoitetun tapahtumaikkunan yli (positiivinen) ja tapahtumien ulkopuolisten laatoitettujen roc_window_s-ikkunoiden yli (negatiivinen). Tunnusluvut ovat lohkotehon poikkeama, PSD-ylijäämä, huipukkuus z, keskiarvoistetun metriikan SQM |z| ja C/N0 CUSUM. Raportti yhdistää ne lajeittain empiiriseksi ikkunatason ROC-käyräksi, jossa on AUC ja toimintapiste asetetulla kynnyksellä, kirjoitettuna tiedostoon roc.json (kshana.campaign-roc/1) ja tiedoston report.html Detection ROC -osioon. Ilman monitoreita kampanja ei kirjoita kumpaakaan

seg-3a3cfa322f01 = Avoimen vastaanottimen C/N0- ja lukitusmallien kalibrointi IQ-kampanjatuloksiin ilmoitetulla ennustevirheellä

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) ja <c1/>, komento <c2/>, Python-moduuli <c3/> ja MCP-labfit-työkalu (vain sen työhakemiston sisällä olevat kampanjakansiot): lukee kampanjan tulostekansion (<c4/>) tiivisteensä (DIGEST) perusteella ja ryhmittelee pisteytetyt solut sovitusyksiköiksi (signaali x silmukan rakenne x etupään ketju x häirintälaitteen tyyppi, ei koskaan yhdistetä). Kullekin yksikölle se sovittaa mitatun C/N0:n ilmoitettua J/S:ää vasten spektrierotusmuodolla. Q_eff ei ole tunnistettavissa C/N0-datasta ilman riippumatonta häirintälaitteen ja signaalin tehojen mittausta, joten Q ilmoitetaan eikä koskaan sovitetaan (tyyppitaulukko, tapahtuman q tai tuntemattomalle tyypille vahingollisin ilmoitettu arvo, cw Q = { "1" }). Sovitettava parametri on tunnistettava siirtymä delta_eff = delta - { "10" } log10 Q, ja korrelaatiosuoja raportoi degeneraation. C/N0-binit, jotka ovat lukittuina alle { "90" } % ajasta, sensuroidaan ja luetellaan. Kynnys-J/S annetaan suoraan ja suljetulla muodolla; seurantasilmukka- ja empiiriset lukitusmallit kytketään C/N0-mallin kautta pudotus- ja uudelleenlukitusviipymillä. Siemenluvulla ajettu klusteribootstrap tallenteiden yli ({ "1000" } toistoa) antaa persentiilivälit; { "90" } %:n ennustevälit tulevat residuaaliotannoista; leave-one-recording-out-holdoutit jaetaan interpolaatioon ja ekstrapolaatioon; ennakkorekisteröity [validation]-taulukko tiivistetään ja jokainen kynnys arvioidaan PASS/FAIL. Raportti kshana.labfit-iq/1 JSON-, CSV- ja generoituna Markdown-muodossa, yksikkölohkolla. Vain synteettinen (ei kolmannen osapuolen tallennetta, ei häirintäaaltomuotoa). Vastaanottimen lokin labfit-polku on ennallaan

seg-9537d301c95e = GPS LNAV -koodaus dekoodattuna riippumattomalla vastaanotinkirjastolla

seg-909415621881 = Kshanan LNAV-alikehykset 1-3 (gps_lnav::encode_subframes) { "32" } efemeridille tiedostosta brdc0010.22n, syötettynä RTKLIBin funktioille decode_word ja decode_frame: jokaisen sanan pariteetti, alikehysten dekoodaus johdonmukaisella tietojen julkaisutunnuksella (issue of data) ja jokainen dekoodattu parametri Kshanan kokonaislukua ja syöttöarvoa vastaan

seg-f66855e35c53 = GPS LNAV -navigointiviestin koodaus

seg-8caf8366e2f8 = IS-GPS-200 LNAV-alikehykset 1-3 (gps_lnav::encode_subframes: jokaisen kello- ja rataparametrin lähimpään pyöristävä kvantisointi spesifikaation skaalauskertoimilla ja piin arvolla, kahden komplementin pakkaus, TLM- ja HOW-sanat, taulukon 20-XIV pariteetti D29*/D30*-inversiolla, sanojen { "2" } ja { "10" } pariteettia ratkaisevat bitit), viesti, jonka GPS L1 C/A -signaaligeneraattori lähettää

seg-c5c944357643 = Sieppaus ja C/N0-estimointi todellisessa Kuun IQ-datassa

seg-f5dcb5e06bf4 = Rinnakkainen koodivaihehaku (acquisition::pcps_acquire: siirrettävä FFT, koherentti laskostus, epäkoherentti akkumulointi, khii-toisen kynnys koko haun väärän hälytyksen todennäköisyydelle), tarkennus, avoimen silmukan prompt-korrelaatio koodin Dopplerilla ja M2M4 C/N0 -estimaattori, ajettuna LuGRE L1 4-bittisille IQ-erille, jotka on luettu moduulin realdata::ion_sdr kautta

seg-709626569a5c = Sieppaus todellisessa Kuun IQ-datassa kiertoradasta ennustettua Doppleria vasten (näytetehopäätös)

seg-784ebd80c425 = acquisition::pcps_acquire näytetehopäätöksellään yhdeksällä ei-pinta LuGRE L1 -erällä, joissa on mid-rise-tasot; sieppattujen satelliittien väliset Doppler-erot verrattuna eroihin, jotka on ennustettu ESAn lopullisista radoista ja Firefly-rekonstruoidusta Blue Ghost -radasta

seg-89875d67b253 = Sieppaus todellisessa Kuun IQ-datassa, pisteytettynä kiertoradasta ennustetulla Dopplerilla

seg-956bcfeaf319 = acquisition::pcps_acquire solujen keskiarvoistavalla päätöksellä (huippu verrattuna ruudukon keskimääräiseen soluun, kestävä kaistarajoitetulle kohinalle) yhdeksällä ei-pinta LuGRE L1 -erällä, joissa on mid-rise-tasot; sieppattujen satelliittien väliset Doppler-erot verrattuna eroihin, jotka on ennustettu ESAn lopullisista radoista ja Firefly-rekonstruoidusta Blue Ghost -radasta

seg-8fa779dd1788 = Sieppaus holdout-datana olevassa todellisessa Kuun IQ-datassa kiertoradasta ennustettua Doppleria vasten

seg-484868771231 = acquisition::pcps_acquire (solujen keskiarvoistava päätös, väärän hälytyksen todennäköisyys { "1e-7" }) ja refine_doppler_coherent Kuun pinnalla tallennetuilla LuGRE L1 -erillä (I ylemmässä nibblessä, mid-rise-tasot); sieppattujen satelliittien väliset Doppler-erot verrattuna eroihin, jotka on ennustettu ESAn lopullisista radoista ja Firefly-laskeutumispaikan kernelistä

seg-10af60b488b9 = NovaMoon-luokan differentiaalinen referenssiasema: yhteismoodin kumoutuminen + peruslinjan mukana kasvava jäännös + DGNSS-suojaustasot

seg-c04a3591074c = Kuun yhteentoimivuusvienti

seg-91f4a066b3c0 = LunaNet/IOAG-linjattu Kuun koordinaatisto-, aika- ja efemeridivienti (CCSDS OEM + KIF) edestakaisen kierron vastaavuudella

seg-8ab65cbefb75 = PNT-kestävyyden viitekehykseen linjattu pisteytys

seg-c48198f31d63 = Dimensiokohtaiset osapisteet Kshanan omien seitsemän kestävyysluokan (ei DHS-termejä), RethinkPNT RDRR -funktioiden ja Yangin kriteerien yli, kukin merkitty mallinnetuksi ja sen ajurilla; alustava RPCF-taso rajatun heikkenemisen portilla. Simulaatiopohjainen itsearviointi, ei koskaan sertifiointia.

seg-d7bdb6fe186e = Kestävyyspistemäärän päätösten epävakaustutkimus

seg-5fcf18a68bb1 = Kvantifioi, miten yksittäinen komposiittipistemäärä / RPCF-taso järjestää arkkitehtuurit uudelleen perustellun painotussimpleksin ja uhkajoukon alla (top-1-kääntymisaste, Kendall-tau-hajonta, tasonkääntymisaste, järjestysalueet); ilmoitettu vs. mitattu -analyysit ja monimuotoisuuden romahtamisen analyysit.

seg-1bf03544a010 = Demonstraation edustavuus ja aukot lentoon

seg-db24d16d38c9 = Tuloskohtainen rehellisyyskirjanpito (ledger), joka kvalifioi demonstraatiotulosteen: sen ulkoiset ankkurit, mallinnetut oletukset, aukot lentoon ja edustava TRL-alue, pakotetuilla invarianteilla (Validoitu vaatii ulkoisen ankkurin; Mallinnettu vaatii aukon eikä voi väittää tasoa yli TRL { "4" }).

seg-52ab936eb5f5 = Kvantti- ja klassisen ratkaisun kompromissitodisteet (yhteinen muoto)

seg-a6679ed5bed7 = Yksi toistettava TradeEvidence-olio (kiinteä kehys: skenaario+siemenluku+moottori; yhteiset kvantti vs. klassinen -arvot laatumittaria kohti polariteetiltaan oikealla hyödyllä, valinnainen luottamusväli { "95" } %, validoitu/mallinnettu-merkintä) edustavuustietueen kera, jotta jokainen kvantti-PNT-vertikaali raportoi kompromissin samalla rehellisellä tavalla.

seg-20fee61b3107 = Kvanttilaitteiden virhemallikirjasto

seg-e42eabe9bc2a = Laitekortit (optinen/ioniloukku/elohopea-ioni + klassiset kellot, jotka on käytetty uudelleen moduuleista holdover/clock_state; kylmäatomi-interferometri; klassiset + lomittuneisuus-/yksifotoniajansiirtolinkit), joista jokainen kantaa edustavuustietueen; lomittuneisuuslinkki lisää laukauskohinarajoitetun ajoituksen toistotarkkuusmallin (~jitter/sqrt(R*tau), pimeälaskennan rangaistus, systemaattinen lattia).

seg-86d71fd89f26 = Luotettu kvanttiajoitus (ajansiirto + turvallinen jakelu + poikkeama)

seg-d2a3d37825ef = Päästä päähän -kvantti vs. klassinen ajansiirtoketju (kellon holdover + linkin toistotarkkuus neliöllisesti), uudelleenkäytetty ajoituksen suojaustaso, viive-/toistohyökkäyksen turvallisuuslaatumittari (1-P_md) sekä kellopoikkeaman havaitsemistodennäköisyys + CUSUM-viive, ilmoitettuna rehellisenä TradeEvidence-oliona edustavuustietueen kera.

seg-eaf341ff4522 = GNSS-vapaa kvanttinavigointi

seg-908a44a9f7c7 = Kvantti- (kylmäatomi-interferometri) vs. klassinen navigointiluokan INS-dead-reckoning GNSS-katkon yli: paikkavirheen kasvu, holdover paikkakynnykseen asti ja kvantti vs. klassinen -kompromissi rehellisenä TradeEvidence-oliona; rehellinen havaittavuushuomautus (bias ei ole havaittavissa ilman paikannusta, joten virhe kasvaa).

seg-914132833f5a = Vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille

seg-f20392820b9d = Merkitty kvanttivikojen luettelo (kellotaajuushyppy/-ajelehtiminen/lukituksen menetys; anturin bias-askel/katkos), havaitsemistunnusluvun ROC AUC bootstrap-luottamusvälillä ja pienin havaittava vika kiinteällä väärän hälytyksen asteella; kvanttikellolla tuettu monitori havaitsee pienempiä vikoja kuin klassinen, ilmoitettuna rehellisenä TradeEvidence-oliona.

seg-d31be81dfd8f = TDOA/FDOA-passiivinen lähettimen geopaikannus

seg-aa870cee16f6 = Paikantaa lähettimen (häirintälaite/harhauttaja tai oportunistinen lähde käänteis-PNT:tä varten) vastaanotinverkon saapumisaikaerosta (TDOA) — τᵢ=(Rᵢ−R₀)/c-hyperboloidien leikkaus ratkaistuna Gauss–Newton-pienimmällä neliösummalla — ja lisäämällä taajuuserot (FDOA, etäisyysnopeuksien erot) liikkuvilla vastaanottimilla palauttaa yhdessä sijainnin ja nopeuden; sijaintikovarianssin Cramér–Rao-alaraja mittausgeometriasta

seg-5bd3882531b6 = Pysähtymispisteen konvektiivinen paluulämmitys (Sutton-Graves) 3-DoF-paluulla

seg-4f97036ed72f = Pysähtymispisteen konvektiivinen lämpövuo q = k sqrt(rho/R_n) V^{ "3" } Sutton-Graves-vakioilla Maan ilmalle ja Marsin ilmakehälle (NASA TR R-376, { "1971" }), sen huippu ja integroitu lämpökuorma 3-DoF-paluulla pitkin, ballistisella tai nostavalla vakiokallistuksella, Maassa tai Marsissa.

seg-1b96577665fc = Sähköoptisen kuvantimen radiometria, MTF, suhteellinen reunavaste ja GIQE { "4" } NIIRS

seg-38902593e841 = Nadir-kuvantimen signaali-kohinabudjetti (Lambert-kohtauksen radianssi, kameran yhtälö, laukaus-, pimeä-, luku- ja kvantisointikohina), järjestelmän MTF Nyquistissa esteettömän aukon diffraktion, ilmaisimen aukon, lineaarisen smearin ja Gaussin jitterin tulona, tästä MTF:stä integroitu reunavaste ja suhteellinen reunavaste, Q = lambda F / p sekä GIQE:n versio { "4" } NIIRS ilman MTF-kompensaatiota. Ajettavissa skenaariotyyppinä <c1/>.

seg-07ca77a67207 = Laukaisun nousuvaiheen painovoima-, ilmanvastus-, ohjaus- ja vastapainehäviöt

seg-7a1802cf2c80 = Monivaiheisen kantoraketin tasomainen painovoimakäännöksellinen nousu ei-pyörivän pallomaisen Maan yli US Standard Atmosphere -mallin ({ "1976" }) läpi (tiheys ja paine), pitch-potkulla, suuttimen vastapaineen vähentämällä työntövoimalla, vaiheiden loppuun palamisilla tarkoilla askelrajoilla sekä painovoima-, ilmanvastus-, ohjaus- ja vastapainehäviöillä integroituna tilan rinnalla. Ajettavissa skenaariotyyppinä <c1/>.

seg-55e8345def8b = TWSTFT-kaksisuuntainen yhtälö, epävarmuusbudjetti ja linkin vakaus flicker- ja vuorokautisella epäresiprookkisuudella

seg-5ca5226c24ec = TWSTFT-kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B aseman lähetys- ja vastaanottoviiveillä, Ku-kaistan ionosfäärin ylös/alas-epäsymmetrialla, transponderin viive-erolla ja Sagnac-termeillä, tarkkaa suoraa mallia vasten; neliöllinen epävarmuusbudjetti, jossa linkin TDEV on tyypin A termi; kaksisuuntainen sarja valkoisella ja flicker-vaihekohinalla (Kasdin–Walter), vuorokautinen epäresiprookkisuus ja vakioresiprookkisuusjäännös; sekä toimitettujen Circular T-, MJD-CSV- tai IGS RINEX -asemakellosarjojen nopeus, jäännös-RMS, TDEV ja ADEV. Ajettavissa skenaariotyyppinä <c1/>.

seg-2f9be02c92bc = Optisen vinoreitin ilmakehän numeriikka: Rytov-varianssi, tuikinta, gamma-gamma-häipymätodennäköisyys, aukon keskiarvoistus, pilven ja kirkkaan ilman optinen syvyys

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integroituna vinoreittiä pitkin tasoaallon ja pallo-aallon Rytov-varianssille (ylä- ja alalinkki), Andrews–Phillips-tuikintaindeksille ja gamma-gamma-parametreille, gamma-gamma-häipymätodennäköisyydelle ja häipymävaralle, heikon turbulenssin aukon keskiarvoistuskertoimelle, nestemäisen veden pylvään pilven optiselle syvyydelle ja Kim-näkyvyyden sekä Rayleigh-kirkkaan ilman optiselle syvyydelle, korvaten optisen linkkibudjetin kasatun ilmakehähäviön, kun ilmakehä on annettu. Ajettavissa skenaariotyypin sisällä (<c1/>).

seg-a2faab92e760 = Säästä riippuva optisen maa-aseman saatavuus ja etäisyyskorreloitu asemadiversiteetti

seg-7f4e4e763d62 = Optisen linkin saatavuus ilmoitettua linkkivarausta vasten log-normaalista pilven nestevesi-ilmastosta (ITU-R P.840 -määrä, geometrisen optiikan vaimennus) ja riippumattomasta gamma-gamma-turbulenssihäipymästä, tavoitesaatavuuksiin tarvittava linkkivara ja katto, jota mikään vara ei nosta, log-normaalit katkon kestot, parannustekniikoiden mitä-jos-tarkastelut sekä yhden tekijän Gaussin kopula-verkkosaatavuus, jonka parikorrelaatio on exp(-etäisyys/dekorrelaatiopituus). Ajettavissa skenaariotyyppinä <c1/>.

seg-043ece801e72 = Ajoituksen ja etäisyysmittauksen jatkuvuus optisten katkojen läpi

seg-bb9cb3fe4180 = Optisen aseman katkon kestojakauma kytkettynä holdover-mallin suljetun muodon vapaa-ajovarianssiin: ajoitus- ja etäisyysmittausvirhe ilmoitetuilla katkokvantiileilla, holdover ajoituskynnykseen asti, katkojen ja katkoajan osuus, joka jää sen sisään, sekä ajoitussaatavuus A + U E[min(D, T_h)]/E[D], klassisille ja kvanttikelloluokille. Ajettavissa skenaariotyypin sisällä (<c1/>).

seg-b119df65d2a7 = Optisen linkin vara ajan funktiona: yksi siemenluvulla ajettu aseman sään realisaatio

seg-06125f3cae90 = Valinnainen taulukko <c1/> (kesto, askel, siemenluku) saa skenaariotyypin <c2/> kirjoittamaan myös kullekin asemalle yhden siemenluvulla ajetun realisaation ilmoitetusta asemamallista ajan yli: pilvijaksot (kirkkaat jaksot eksponentiaalisia, pilvikatkot log-normaaleja ilmoitetulla keskiarvolla ja hajonnalla, pilvessä vietetty aikaosuus asetettu ilmoitettuun pilven todennäköisyyteen), yksi log-normaali nestevesipylväs per pilvijakso, yksi gamma-gamma-tuikintanäyte per askel, ja niistä linkkivara, pilvi- ja tuikintahäipymät ja linkki ylhäällä -lippu, sekä toteutunut saatavuus, pilviosuus, katkojen lukumäärä ja pisin katko. Ilman taulukkoa tulos on asiakirja versiosta { "0.37" }. Arvonnat kulkevat siirrettävien jakauma- ja matematiikkareittien kautta, joten natiivi ja wasm32 antavat samat tavut.

seg-58cbf576c959 = TRK-2-18 Orbit Data File -lukija ja Marsin rampitettu 2-suuntainen Doppler-malli

seg-d1055650a77f = DSN:n Orbit Data File -tiedostojen (TRK-2-18) lukija: 36-tavun tietueryhmät (tiedostotunniste, tunniste, ratadata, asemakohtaiset rampit, kellopoikkeamat, yhteenveto, tiedoston loppu) ja kussakin ratadatatietueessa aikaleima alkaen vuodesta { "1950" }, alalinkin ja ylälinkin viiveet, havaintosuure, asemat, datatyyppi, kaistat, voimassaolo, kanava, avaruusalus, 46-bittinen viitetaajuus ja pakkausaika; rampin alku- ja loppuajat, nopeudet ja alkutaajuudet. Sen päälle rampitettu 2-suuntainen X-kaistan Doppler-malli (integroidut ylälinkin rampit, kiertomatkan valoaika Shapiron ja troposfäärin kera, DSN-asemat IAU 2006/2000A CIO -ketjun ja IERS EOP:n kautta, asema-aika) ja Marsin kiertoradan eräradanmääritys (GMM-3-kenttä, kolmannet kappaleet, SRP, ilmanvastus).

seg-455dc946c965 = Multiplikatiivinen EKF-asennonestimointi gyrosta ja tähtiseurantalaitteesta

seg-553d043438b4 = Lefferts–Markley–Shuster-multiplikatiivinen EKF: kappalekoordinaatiston asentovirhe- ja gyron bias-tilat, propagointi gyron nopeudella vähennettynä biasestimaatilla ja Farrenkopfin diskreetillä prosessikohinalla (kulma- ja nopeussatunnaiskävely), tähtiseurantalaitteen päivitykset residuaalilla { "2" } vec(q^-1 q_st) Joseph-muodossa ja multiplikatiivinen nollaus; Farrenkopfin diskreetti gyro- ja tähtiseurantalaitesimulaattori. Skenaariotyyppi <c1/> voi sulkea ohjaussilmukan oman estimaattinsa varaan.

seg-a971ff07592a = Aukon navigointi vs. viestintä -käyttöaste

seg-5b0ba97379bf = Yksi ajo ottaa kontaktisuunnitelman (aos_s/los_s-ikkunoiden luettelo, jossa kukin pyytää aukkoa navigointiin tai viestintään — sama ikkunasanasto, jonka <c1/> tuottaa, muunnettuna funktiolla <c2/>), aukkojen lukumäärän ja eksplisiittisen välitysperiaatteen, ja palauttaa navigointikäyttöasteen, viestintäkäyttöasteen, joutokäyttöasteen ja istuntokohtaisen katkon. Periaate on syöte dokumentoidulla oletuksella (<c3/>; myös <c4/> ja ei-keskeyttävä <c5/>), ja raportti kantaa ratkaistun periaatteen, sen täyden määritelmän sekä käyttöasteen ja katkon määritelmät, koska ilman välityssääntöään mainittu käyttöasteluku ei ole toistettavissa. Aikataulu on tarkka intervallipyyhkäisy ikkunarajojen yli, joten ikkuna, joka päättyy täsmälleen siihen, mihin seuraava alkaa, ei koskaan kilpaile, ja navigoinnin, viestinnän ja joutoaukon sekunnit kertyvät toisistaan riippumatta tässä yhdessä pyyhkäisyssä. Ajettavissa skenaariotyyppinä <c6/>

seg-43cd7aa7ab53 = Kuun pintanavigoinnin RF-häirintä (satelliittikohtainen J/S)

seg-e0566f37ad8f = Kuun-natiivi häirintä-signaalisuhde, efektiivinen C/N₀ ja lukituksen menetys selenografiselle pintakäyttäjälle Kuun pinnalla (tai korotetulla) olevan häirintälaitteen alla, havainnollistavan, julkisiin lähteisiin perustuvan Moonlight/LCNS-luokan satelliittitähdistön yli. Koostaa avoimen häirintäketjun (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) avoimen Kuun taivasgeometrian kanssa (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geometriaa tai radiometriaa ei johdeta uudelleen. Toisin kuin Maan skenaariotyypissä <c1/> signaalihaara ei ole kiinteä vastaanotettu teho: kunkin satelliitin isotrooppinen vastaanotettu teho on sen oma linkkibudjetti-EIRP − FSPL(vinoetäisyys), joten J/S vaihtelee satelliitista toiseen Kuun etäisyyden ja korkeuskulman mukaan. Emittoi YHDEN RIVIN JOKAISTA NÄKYVÄÄ (epookki, satelliitti) -LINKKIÄ kohti JSONina ja *.table.csv-artefaktina, ja molemmat vastaanotetut tehot, joiden erotus J/S on, tulostetaan sen rinnalle; yhteenvetolaatumittarit ovat taulukon vieressä, eivät sen tilalla. Ajettavissa skenaariotyyppinä <c2/>

seg-4c116e25c5c5 = Kuun kieltokontuuri epävarmuuskaistalla mitatusta C/N₀-hajonnasta

seg-77828c25f3ab = Raportti <c1/> ei enää perusta kieltokontuuriaan yhteen skalaariin. Se emittoi koko mitatun toivotun signaalin C/N₀-jakauman satelliittikohtaisen taulukon yli — n, min, p05, p25, mediaani, p75, p95, max, keskiarvo, otoshajonta ja otoksen oma epäsymmetria (p95 − mediaani) − (mediaani − p05) — rivikohtaisten rivien rinnalla, jotka ovat ennallaan. Kontuuri raportoidaan sitten kussakin näistä järjestystunnusluvuista MOLEMPIEN moottorin tunnistamien kieltokriteerien mukaan, ei koskaan toisen sijaan: vakiintunut tehosuhdekriteeri (J/S = { "30" } dB, sama kynnys, jota attack_surface ja tracking_loop käyttävät ja jonka varassa on julkaistun Kuun linkkihäirintätaulukon sarake <c2/>), ja lukituksen menetyksen kriteeri (efektiivinen C/N₀ putoaa tasolle tracking_threshold_dbhz), jolla tämän raportin oma links[].status-sarake pisteytetään. Kukin kontuuripiste annetaan kieltotason kummallakin akselilla — vaadittu häirintälaitteen EIRP skenaarion etäisyydellä ja kieltoetäisyys skenaarion EIRP:llä — joten kaista on väli samoilla akseleilla, joilla kontuurikuvaaja piirretään. Kaistan reunat OVAT contour(p05) ja contour(p95): sama suljetun muodon kuvaus sovellettuna otoksen omiin kvantiileihin, ei otokseen sovitettu sigma eikä mediaani ± k·stdev, ja raportti sanoo niin merkkijonossa band_definition lukujen vieressä. stdev emittoidaan jatkuvuuden vuoksi eikä mikään käytä sitä. Kvantiili, jonka C/N₀ on jo seurantakynnyksen tasolla tai alle, ei ole äärellistä kieltävää J/S:ää; nämä sarakkeet emittoidaan arvolla null ja lasketulla syyllä, ei äärettömänä eikä rajattuna säteenä

seg-2d3944107ba0 = Ristimodaalisen eheysmonitorin havaitsemisteho

seg-38bc7c0bfe57 = Raportti hybrid-optical-rf kertoo, mitä ristimodaalinen khii-toinen-monitori todella voi HAVAITA, ei vain että se läpäisee virheettömän tapauksen: pienin havaittava bias monitoroitua akselia kohti (itä, pohjoinen, ylös, kello) skenaarion ilmoitetuilla väärän hälytyksen ja havaitsematta jäämisen todennäköisyyksillä, havaitsemistehokäyrä sen kummallakin puolella, kohinaton biaskerroin, jolla toteutunut tunnusluku ensimmäisen kerran ylittää kynnyksen, sekä havaitsemisaika biasrampille ilmoitetulla nopeudella. Viat myös injektoidaan todellisen monitorin läpi ja sen palauttama tunnusluku raportoidaan analyyttisen ennusteen rinnalla

seg-38cabd4921c1 = Kovarianssin uudelleenkasvu luovutuksen jälkeen hälytysrajaa vasten

seg-9287268bbada = Raportti hybrid-optical-rf paljastaa suodattimen prosessikohinamallin ja kertoo, kuinka kauan luovutuksen jälkeinen ratkaisu pysyy hälytysrajan sisällä: kummallekin luovutussuunnalle se ottaa luovutuksen jättämän akselikohtaisen kovarianssin, etenee sillä eteenpäin ilmoitetulla satunnaiskulun prosessikohinalla ja raportoi hetken, jolloin kattavuuskertoimella skaalattu 1σ saavuttaa vaaka-, pysty- ja ajoitushälytysrajan, minkä raja ensin sitoo, varianssin kaksinkertaistumisen aikavakion sekä otannalla muodostetun vapaan etenemisen profiilin, joka haarukoi ylityskohdan. Prosessikohinan PSD:t, kattavuuskerroin ja hälytysrajat ovat kaikki syötteitä dokumentoiduin oletuksin

seg-a3b8272862aa = Keilan suunnan ulkopuolinen antennikuvio kuun geometrian viennissä

seg-27d246503a48 = Satelliittikohtainen geometrian vienti sisältää kullekin (epookki, satelliitti) -parille keilan suunnan poikkeaman SATELLIITILLA ja lähetysvahvistuksen kohti paikkaa todellisesta tasaisesti valaistusta ympyräaukon (Airy) kuviosta ja raportoi keilan sisällä olevien satelliittien lukumäärän tällä kuviolla SYMMETRISEN vahvistus–keilanleveys-approksimaation (θ_3dB[deg] = √(31000/G_lin)) mukaisen lukumäärän VIERESSÄ; erotus annetaan eksplisiittisenä korjauksena linkeissä, satelliiteissa epookkia kohti ja pahimpana yksittäisenä epookkina. Approksimaation molemmat implisiittiset aukkohyötysuhteet annetaan ({ "0.641" } verrattuna sääntöön { "70" }·λ/D astetta, jolla se esitetään, { "0.920" } verrattuna tasaiseen ympyräaukkoon), jotta sen hiljaisesti olettama hyötysuhde on ilmoitettu eikä pääteltävä. Oletuksena pois: lohko näkyy vain, kun sekä vientipaikka että aukko on annettu

seg-6fbfa234ef3e = Seurantasilmukan lukituksen menetys ja harhautuksen sisäänveto häiriön alla

seg-f78c1f28a3f7 = Lukituksen menetys lasketaan silmukkadynamiikasta tehosuhteen sijaan: kantoaallon (Costas) ja koodin (epäkoherentti early/late) 1σ:n terminen värinä C/N₀:n funktiona neliöintihäviöllä, ilmoitettuja sääntöjä 3σ_PLL + θ_e ≤ { "45" }° ja 3σ_DLL + ramppiviive ≤ d/2 sirua vasten; pudotuksen ja uudelleenlukituksen C/N₀-kynnykset sitovaa silmukkaa nimeten ja hystereesi JOHDETTU leveämmästä sisäänvetokaistanleveydestä eikä väitettynä; ilmoitettu lukituksen menetyksen aika kahden kynnyksen lukitusilmaisimesta vahvistusviipeillä, raportoituna erikseen fysikaalisesta vaiheen karkaamisajasta (Viterbin keskimääräinen aika syklihyppyjen välillä, log₁₀ s -yksikössä, koska se kattaa satoja kymmenpotensseja); suurin koodin liukuma ja kantoaallon Doppler-muutosnopeus, joita uhrin silmukat pystyvät seuraamaan; sekä silmukkadynamiikan implikoima ESTOSÄDE raportoituna olemassa olevan tehosuhdesäteen rinnalla niiden etumerkillisellä erotuksella omana nimettynä kenttänään. Ajettavissa skenaariotyyppinä <c1/>

seg-0f4d023fe2d4 = Kuun pintapisteen koordinaattikovarianssi VLBI-viiveaikataulusta, erillään Maa-aseman kovarianssista

seg-47352405133b = Kolmas datumvaihtoehto, <c1/>, joka pitää kaikki Maa-asemat kiinteinä ja estimoi vain MAJAKAN Kuu-kiinteät koordinaatit: juuri tämä on konfiguraatio, jolle kuun pintapisteen epävarmuus todellisuudessa ilmoitetaan, koska Maa-asemien koordinaatit ovat viivemallin syöte eivätkä sen tuntematon. Se on olemassa, koska asematason kovarianssi ja pintapistekovarianssi ovat ERI SUUREITA, joita erottaa vipuvarsi ρ/B, eikä mikään aiemmin estänyt ilmoittamasta toista toista vasten. Lähetetty lohko <c2/> sisältää arvon ρ, pisimmän kantaviivan, vipuvarren, tasajakolinkin pintapistemuodon c·σ_τ·(ρ/B)·√(g/N), lasketun koordinaattikohtaisen majakan sigman ja niiden suhteen: suhde on null eikä harhaanjohtava aina, kun majakkaa ei estimoida tai matriisi on asteeltaan vajaa. B otetaan PISIMPÄNÄ läsnä olevana kantaviivana, edullisimpana, joten suhde voi vain aliarvioida. Ajettavissa muodossa <c3/> asetuksella <c4/>, joka evätään viestillä, joka nimeää puuttuvan syötteen, kun majakkaa ei estimoida

seg-0315968c8214 = Kuun differentiaalinen PNT: korjauslinkin jäännösbudjetti

seg-c6785166a44c = Kolme termiä, jotka differentiaalikorjaus kerää sen hetken, jona se lasketaan, ja sen hetken, jona sitä käytetään, välillä, kukin aiemmin jätetty mallintamattomaksi varaksi: referenssiaseman mittausvirhe (korreloitunut satelliittien kesken, kantaviivasta riippumaton, ~{ "1" }:{ "1" } paikan siirto ja todistetusti DOP:n vahvistamaton), korjauksen vanheneminen (jäädytetty ratavirhevektori projisoituna uudelleen näkölinjalle, jolle moottorin oma propagaattori asettaa satelliitin yhden viiveen myöhemmin, sekä c·σ_y(τ)·τ-kellon ajautuma kalibroidusta potenssilaista) ja tasainen linkin kvantisointi täsmällisellä ±(orbit_err + clock_err) -täyden asteikon alueella varianssilla step²/12. Raportoidaan sekä etäisyys- että paikka-alueella olemassa olevan jäännöksen ja suojaustason rinnalla, ei koskaan niiden tilalla, viivekäyrä yksittäisen luvun vieressä

seg-c42646ae4707 = Kuun referenssiaseman kattavuus- ja tarkkuuskartta

seg-1f9834b32629 = Kuun differentiaalisen PNT-mallin Monte Carlo -pyyhkäisy etelänapaisen käyttäjäruudukon ja vuorokauden epookkien yli (tyyppi <c1/>): tunnetulla etelänapaisella paikalla olevalle differentiaaliselle referenssiasemalle pisteittäin ja alueen yli: korjatun ja korjaamattoman paikkavirheen persentiilit (3D, vaaka, pysty), saatavuus syineen jokaiselle ei-saatavilla olevalle epookille (user_lt4, station_missing_sat), ennen ajoa ilmoitettua kynnystä vasten mitattu kattavuus, DO-229E-suojaustasot, kattavuussäde atsimuuttisektoreittain sekä korjauslinkin budjetti asemalla ja pahimmassa pisteessä. Ei lausuma minkään todellisen järjestelmän suorituskyvystä; ei yhteydessä mihinkään virastoon eikä sen hyväksymä

seg-7ecf4b0038b0 = Kuun maaston horisonttimaskit ilmoitetusta profiilista tai napa-DEM:stä

seg-7102948907bc = Paikkakohtaiset atsimuutista riippuvat horisonttimaskit tyypille lunar-station-coverage (referenssiasema ja jokainen käyttäjäpiste) sekä moonlight-service-volume-ruudukolle ja sen satelliittikohtaiselle vientipaikalle (jokainen vientirivi saa kentän clears_terrain), versiossa { "0.36" } olevassa skyline-taulukkomuodossa (skyline::Skyline, lineaarinen atsimuutissa kierrolla kohdassa { "360" } astetta; ilmoitettu profiili ja DEM-horisontti yhdessä paikassa yhdistyvät pisteittäisenä maksimina): ilmoitettu [terrain] station_horizon tai user_horizon lähteellä merkittynä ja/tai horisontti, joka on säteenseurattu etelänapaisen stereografisen DEM:n yli (LRO LOLA -ruudukotettu napaasettelu, luettu kuvaajasta, joka kiinnittää sen koon ja SHA-256:n, tai leveys-/pituuspiiriin perustuva realdata::lola_dem-laatta asetuksella [terrain] dem_tile_path, kaiuttuna SHA-256:lla) Kuun pallon isoympyröitä pitkin täsmällisellä kaarevuudella, ilmoitetusta mastokorkeudesta, ilmoitetulla atsimuuttiaskeleella ja kantamalla. Satelliitti lasketaan paikassa mukaan, kun se ylittää tasaisen mask_deg-maskin ja horisontin atsimuutissaan (lunar_service::topocentric); epookki, jonka horisontti jättää alle neljään satelliittiin pisteessä, jossa tasainen maski antaa neljä, lasketaan ei-saatavuuden syyksi terrain_masked. Mukana toimitettu DEM on julkisen alueen LOLA LDEM_75S_240M -tuotteen rajaus, { "5" } x { "5" } -lohkokeskiarvolla uudelleennäytteistetty tarkkuuteen { "1200" } m (data/lunar-dem/NOTICE.md). Poissa ollessa jokainen paikka pitää tasaisen maskin ja jokainen asiakirja on tavu tavulta identtinen

seg-d37bb01e270b = Kuun referenssiaseman monitie-eteneminen ja vastaanottimen laitteistotermit

seg-1103199f019b = Tyypin lunar-station-coverage valinnainen [receiver]-osio (LRS-02): korkeuskulmasta riippuva monitie-sigma sigma(el) = a + b exp(-el / el0) käyttäjällä ja asemalla (RTCA DO-229:n ilmaan sijoitetun käytön funktiomuoto, oletuksina a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } astetta; Kuulla jokainen arvo on ILLUSTRATIVE), valkoinen käyttäjällä ja ensimmäisen kertaluvun Gauss–Markov epookkien yli asemalla (rho = exp(-dt / tau)); early-minus-late-DLL:n terminen koodikohina sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); kanavien väliset kanavakohtaiset harhat vakiona kokeen ajan käyttäjällä ja asemalla. Aseman termit vaikuttavat sen korjauksiin, käyttäjän termit raaka- ja korjattuihin mittauksiin, kukin omalla siemenluvulla generoidulla virrallaan. Poissa ollessa jokainen asiakirja on muuttumaton

seg-03796cb741b6 = Kuun referenssiaseman efemeridivirheen kasvu korjausviiveen aikana

seg-13b0ae9a874a = Tyypin lunar-station-coverage valinnainen syöte orbit_err_growth_m_per_s (LRS-03): korjaus, joka sovelletaan latency_s sen laskemisen jälkeen, ohittaa lähetetyn ratavirheen kasvun g latency_s, g isotrooppinen 3D-RMS-nopeudella, arvottuna satelliittia ja koetta kohti omalla siemenluvulla generoidulla virrallaan (alueen 1-sigma-nopeus tau / sqrt({ "3" })), jäädytetyn virheen näkölinjalle uudelleenprojisoinnin lisäksi. Poissa ollessa jokainen asiakirja on muuttumaton. K5-lisäys julkaistujen väitteiden vertailuun, ennakkorekisteröity yksin, ajaa K5:n arvoilla { "0.001" }, { "0.01" } ja { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Kuun vertailuaseman ratkaisutilat: korkeusrajoite, kolme satelliittia, staattisen käyttäjän ikkuna

seg-366c7ad03fb2 = Valinnainen [solution]-osio skenaariolajissa lunar-station-coverage (LRS-06): korkeuden pseudomittausrivi up . dx = e_h, jonka ilmoitettu 1-sigma painotetaan etäisyysrivejä vasten; kolmen satelliitin vähimmäismäärä sallitaan vain sen kanssa; lisäksi painotettu pienimmän neliösumman ratkaisu viimeisten window_epochs epookin yli, jossa on yhteinen staattinen sijainti ja yksi kello epookkia kohden (suodattimen vastaus staattiselle sijainnille ilman prosessikohinaa samalla datalla; epookkien virheitä käsitellään riippumattomina). Jos osiota ei ole, hetkellinen ratkaisu ja jokainen dokumentti pysyvät ennallaan. Lisäys julkaistujen väitteiden vertailuun lähteiden ratkaisutyylillä, ennakkorekisteröity yksinään

seg-611ba369ed00 = Kuun vertailuaseman tarkkuus ja kattavuus julkaistuja väitteitä vastaan

seg-4fe4f1cffa2b = Skenaariolaji lunar-station-coverage ajettuna Kuun differentiaaliselle vertailuasemalle julkaistun aineiston julkisilla oletuksilla (neljä navigointisatelliittia { "24" } h jäädytetyillä elliptisillä radoilla, { "10" } m, { "95" } % SISE, { "0.30" } m koodikohina, { "1" } s ja { "600" } s korjausviive, alle desimetrin aseman mittaus, julkaistu esimerkkiasemapaikka, { "300" } km ja { "600" } km etelänapa-alueen ympyrät) ja pisteytettynä lähteiden numeerisia väitteitä vastaan kuuden yksipuolisen kynnyksen mukaan, jotka ennakkorekisteröitiin ennen ajoa: koko etelänavan kattavuus alle metrin p95-tasolla (K1, K2), alle metrin ja desimetritason korjattu p95 (K3, K4), alle metrin taso säilyy { "600" } s viiveellä (K5) ja tarkkuus säilyy perusviivan välillä { "10" } km - { "500" } km (K6)

seg-7bfcb5c6a985 = ARAIM usean satelliitin samanaikaisilla vikahypoteeseilla

seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2:n osajoukon määrityssääntö (P_THRES, FC_THRES, valvotut osajoukot vähiten poistetut ensin) yleistettynä pareista enintään max_order satelliitti- ja tähdistötapahtuman samanaikaisiin yhdistelmiin, täsmällisellä priorilla P_no fault prod q_e; add_v42_protection_levels_to_order ajaa ADD v4.2:n suojaustasopolun sen päällä (kertaluku { "2" } on täsmälleen nykyinen polku). raim::araim_subset_raim (valinnainen): edistynyt RAIM tämän hypoteesijoukon yli, jokainen valvottu osajoukko yksi (p_fault, T, b, sigma) -moodi eheysriskisummassa, havaitsemattomat osajoukot siirretty valvomattomaan riskiin, budjetti skaalattu ADD:n valvomattoman riskin allokoinnilla, ja suurimman normalisoidun erotuksen osajoukko raportoidaan, kun vika havaitaan. Priorit, jotka vaativat syvempiä osajoukkoja kuin max_order, hylätään eikä koskaan katkaista

seg-48ca01332f8f = RAIM holdover-laatumittareiden rinnalla

seg-890f1006a75d = Kellolajin valinnainen [integrity]-osio (clock_integrity::run): ilmoitetusta paikasta ja tähdistöesiasetuksista (geometry::sky_geometry), jokaisella eheysepookilla niin kauan kuin GNSS-aikajanaa ei ole estetty, hetkellinen RAIM (raim::snapshot_raim: pariteetin khiin neliö -testi, kaltevuussuojaustasot) maskin yläpuolella oleville satelliiteille siemenluvulla tuotetuilla gaussisilla residuaaleilla, joilla on ilmoitettu sigma ja valinnainen ilmoitettu bias; erillinen integrity_fom-lohko epookkikohtaisine tuomioineen, suojaustasoineen ja saatavuuksineen. Estetyt epookit raportoidaan ei-saatavilla-tilaisina eikä niitä koskaan ekstrapoloida; holdover-laatumittarit pysyvät ennallaan ja ilman osiota tuloste on tavu tavulta identtinen

seg-9cbb4ee7588a = Avaruudellinen, kohinainen, usean perheen kuunläheinen kaarenpituuden havaittavuus

seg-5ebd771deef8 = Kuunläheisen kaarenpituuden havaittavuuskynnys AVARUUDELLISESSA kuusitilaisessa CR3BP-mallissa tasomaisen nelitilaisen sijaan, DRO-, L2-halo- ja L2-lähes-suoraviivaisten halo-perheiden yli, mittauskohinan päästessä Gramin matriisiin, ja KAKSI kriteeriä raportoidaan, koska yhtä rehellistä kriteeriä ei ole: julkaistu astekriteeri, joka on todistettavasti invariantti homoskedastisen mittaussigman suhteen (valkaisu kertoo havaittavuusmatriisin skalaarilla, jolloin suhteellinen singulaariarvojen spektri ja siten aste, defekti ja ehtoluku eivät muutu), sekä arvioitavuuskriteeri — ensimmäinen kaari, jolla päätähden alkutilan muodollinen 1σ:n paikkaepävarmuus alittaa ilmoitetun rajan — joka on se, joka liikkuu kohinan mukana. Jokainen kynnys kantaa mukanaan sen epookkiruudukon haarukan, jossa se sijaitsee; saavuttamaton kriteeri on null ja siihen liittyy perustelu. Tasomainen tila pysyy oletuksena ja tason ulkopuoliset perheet hylätään siellä eikä litistetä tilaksi, joka ei pysty esittämään niitä

seg-e250321394bc = Operatiivisen tyylin Maan orientaation ennustevirhe, mitattu ennustettu vastaan lopullinen

seg-0e443d241460 = Pienimmän neliösumman bias-plus-vauhti-sovitus liukuvan ikkunan yli sekä pääasialliset jaksolliset termit — vuotuinen, puolivuotinen ja kaksi pääasiallista vyöhykevuorovesitermiä UT1:lle; Chandler, vuotuinen ja puolivuotinen navalle — ekstrapoloituna viimeisen ikkunan sisäisen residuaalin kuljettamana eteenpäin: IERS Bulletin A:n käyttämä luokka, julkaistun horisontin perustana olleen pysyvyysennustimen tilalla. Pisteytetty ainoalla rehellisellä tavalla: T+h:n ennuste, joka on rakennettu nopeista Bulletin A -riveistä hetkellä T tai sitä ennen, mitattuna MYÖHEMMIN JULKAISTUA Bulletin B -lopullista arvoa vastaan hetkellä T+h, ja pysyvyysennuste pisteytetään samalla epookkijoukolla samoja lopullisia arvoja vastaan rinnalla. Kohdeepookki, jolle ei ole julkaistua lopullista arvoa, pudotetaan eikä pisteytetä uudelleen nopeaa saraketta vastaan; jaksollinen termi, jota ikkuna ei voi rajoittaa, raportoidaan hylättynä sillä jaksomäärällä, jonka ikkuna todellisuudessa kattaa; epätäydellinen ikkuna hylätään eikä sitä lyhennetä hiljaa

seg-f4efd94dd746 = Kuun koordinaatiston datumi havaintokampanjasta

seg-a6972eb89d7d = Seitsemän parametrin Helmert-datumi, joka on propagoitu SIMULOIDUSTA HAVAINTOKAMPANJASTA eikä palautettu syötetystä muunnoksesta. Maa-asemat havaitsevat lähteistetyn Kuun pinnan majakkaluettelon nimenomaisella aikataululla; Kuun VLBI-viiveosittaisderivaatat kertyvät majakkakoordinaattien Fisherin informaatiomatriisiin ja viedään Helmert-suunnittelumatriisin A = [I₃ | [p]ₓ | p] kautta muotoon H = AᵀM_bA, joten raportoitu datumin tarkkuus on havaintoohjelman funktio — täsmälleen lineaarinen viivesigmassa ja monotoninen kaaressa libraation kautta, jonka raportti MITTAA. Datumin defekti on aihe eikä alaviite: aste, defekti, ehtoluku, spektri, havaitsemattomat suunnat seitsemän parametrin kannassa, heikoin suunta myös täydellä asteella ja kunkin parametrin osuus siitä raportoidaan jokaisella ajolla, ja mikä tahansa parametri, jota kampanja ei rajoita, julkaistaan arvona NULL tilan kanssa. Majakkavirheen korrelaatio on MEASURED, ei oletettu — täsmälleen nolla asemien ollessa kiinnitettyjä, ja se tulostetaan hintoineen, kun asemat estimoidaan. Ajettavissa skenaariolajina <c1/>

seg-ca481f2d8f9e = Kuunläheisen kaarenpituuskynnyksen riippumattoman estimaattorin vahvistus

seg-3d5fbf896209 = Eräpienimmän neliösumman estimaattori, joka PALAUTTAA päätähden alkutilan simuloiduista satelliittien välisistä mittauksista saman epookkiruudukon kasvavien alkuosien yli, jota aste-vastaan-kaari-taulukko käyttää, mittausosittaisderivaatat otettuina yhdistetyn eteenpäinmallin keskeisinä äärellisinä erotuksina. Se ei käytä mitään koneistoa, jolla kynnys mitattiin — ei analyyttistä jakobiaanirivia, ei variaatiotilasiirtymämatriisia, ei singulaariarvo- tai ominaisarvohajotelmaa, ei asteen toleranssia, ei neliöjuuri-informaatiosuodatinta — ja jakaa vain dynamiikan, alkuehdot, skalaarihavaintosuureen ja epookkiruudukon, jotka kaikki on nimetty tuotetussa asiakirjassa. Kaksi kriteeriä, molemmat pyyhkäistään: kohinaton palautus (asteen vastine) ja Monte Carlo -arvioitavuus (arvioitavuuden vastine, mitattuna tunnettua totuutta vasten eikä kovarianssista ennustettuna). Ajettavissa skenaariolajina <c1/>

seg-f839285852d9 = Kuun palvelualue todellisesta, haetusta tähdistögeometriasta

seg-c3059fcced49 = Hyväksyy taulukoidun Kuu-keskisen tilaefemeridin (SPK/BSP-ytimen evaluaatio) tai julkaistun tähdistömäärittelyn kohdassa <c1/>, ajaa saman kattavuus-, DOP- ja suojaustasopyyhkäisyn sitä vasten ja antaa siitä seuraavan σ_URE-etäisyysvaatimuksen muuttumattoman havainnollistavan Kepler-tuloksen ja häiriöillä lasketun tuloksen VIERESSÄ, erotuksen omana nimettynä suureenaan. Jokaisella luvulla on alkuperäluokka, joka erottaa ytimestä johdetun, julkaistuista elementeistä johdetun ja mallinnetun toisistaan, jotta näitä ei voi koskaan sekoittaa jatkokäytön lainauksessa

seg-36a6cfaf5afa = Yksikkö ja alkuperä ilmoitettu jokaiselle raportoidulle suureelle

seg-12460501e82b = Koneluettava skeema, joka antaa yksikön, alkuperäluokan ja määritelmän jokaiselle skenaarioraportin numeeriselle kentälle, sekä yksi yleinen portti, joka ajaa jokaisen rekisteröidyn skenaariotyypin ja epäonnistuu, jos lähetetyltä numeeriselta kentältä puuttuu jompikumpi. Alkuperäsanasto on suljettu ja jokaisella luokalla on todistetaso, kahden luokan ollessa tarkoituksella kuvattu arvoihin <c1/> ja <c2/> sen sijaan, että niille annettaisiin taso, jota luokka ei määrää

seg-c815cb90dcde = Kuun referenssiaseman geodesia: lisätty retroreflektori ja VLBI-majakka viiden ryhmän datumia vasten

seg-103cf21173ac = Valinnaiset syötteet extra_reflectors ja extra_beacons skenaariossa lunar-llr-datum lisäävät lohkon station_geodesy: viiden ryhmän Helmert-informaatio arkistoidusta kuulaseretäisyysviipaleesta sekä informaatio, jonka lisätty retroreflektori (mitattu niinä arkistoitujen normaalipisteiden epookkeina, joilla etäisyysmittausasema on horisontin yläpuolella, kullakin kyseisen normaalipisteen arkistoitu paino) ja lisätty VLBI-majakka (havaittu lunar-frame-campaign-verkolla ja -aikataululla Maa-asemien ollessa kiinteät, lunar-vlbi-fim-viivepartiaalien kautta) ilmoitetuilla paikoilla lisäävät seitsemän parametrin datumiin, ratkaistuna uudelleen, kunkin Helmert-parametrin 1-sigma ennen ja jälkeen, niiden suhde, normit ennen ja jälkeen sekä Fisher-erotuksen ääriominaisarvot. Poissa ollessa tai tyhjänä raportti on muuttumaton

seg-44f582b17fa9 = Portin eheys: vihreä, joka tarkoittaa sitä, mitä se sanoo

seg-43fbcfbe990c = Kolme rakenteellista suojaa itse verifiointiprosessin ympärillä, kukin sulkien virheluokan, joka pääsi kanoniseen porttiin ajoittaisena tai virheellisenä punaisena. ({ "1" }) Jokaisella Rust-lähteissä muodostetulla väliaikaisella polulla on oltava kutsukohtaisesti yksilöllinen osa; prosessitunnus hylätään, koska cargo ajaa kirjastotestit yhden PROSESSIN rinnakkaisina säikeinä ja pid on yhteinen kaikille. ({ "2" }) Jokaisen tavu tavulta -lukituksen tai tiivistelukituksen on ilmoitettava vieressään tai moduulin otsakkeessa, mitä se kattaa ja mitä se tarkoituksella jättää pois, jotta läpileikkaava muutos näkee yhdellä silmäyksellä, mitkä lukitukset ovat soveltamisalassa ja mistä on hiljaa tullut koko repositorion muutostunnistimia. ({ "3" }) Vihreä voidaan väittää vain KOKO testisarjasta: scripts/gate.sh ajaa <c1/>, tallentaa todellisen poistumiskoodin ilman putkea tiellä ja kirjoittaa kuitin, joka nimeää commitin, integraatiobinäärien lukumäärän, testien lukumäärän ja keston; push-tarkistus kieltäytyy pushista, jonka commitia mikään kelvollinen kuitti ei nimeä, puhtaalla työpuulla. Toistettavuutta otantana mittaa erikseen scripts/check-repeatability.sh, joka ajaa kirjastosarjan N kertaa ja epäonnistuu, jos läpäisevien testien joukko eroaa.

seg-b7cd952ff133 = Koostettu ajoituksen PL: P0-siemennetty holdover-läpiajo

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); alhaalta puolijatkuva PL({ "0" }+)≥PL({ "0" }−); K(IR/2) juokseva maksimi; τ/τ³/τ⁵ vaihe-eksponentit

seg-096b6cdfe2dc = Koostettu ajoituksen PL: LIL a.s. -verhokäyrä (mahdottomuus + johdonmukaisuus)

seg-1671add2210d = Äärellistä pahimman tapauksen holdoveria ei ole (Brownin supremum hajaantuu); IR-allokoitu HPL on johdonmukainen Hartman–Wintner-verhokäyrän kanssa, kun IR→{ "0" }

seg-5a27c9f0a67d = Heterogeenisen UTC(k)-jäljitettävyysharhan eheyden yläraja

seg-fd09ab2adbf6 = Lähdekohtainen harhan yläraja b = (U/k_cov)·Phi^-1(1-tail/2) + ikääntyminen, joka paisuttaa julkaistun tyypin B laajennetun epävarmuuden allokoiduksi eheyshännäksi; silta tpl_scalar-tyyppiin muodossa bias_s

seg-d75b900ad25f = Korreloitunut jäljitettävyysharhan ristikovarianssi (yhteismuototurvaton allokointi)

seg-0641f6d38c23 = N×N-harhan ristikovarianssi rho·b_i·b_j-ei-diagonaalialkioilla lähteille, jotka jakavat UTC(k)-realisoijan; TODISTETTU correlated_fused_bias >= independent_fused_bias (naivi riippumaton allokointi aliarvioi fuusioidun harhan -> optimistinen -> vaarallinen)

seg-1a3bb032960f = Yhteismuodon johdonmukaisuustilasto (ratkaisuerotukselle sokea jaetun viitteen vika)

seg-1b03f522b8fc = Pistetilasto ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 yhteismuotosiirtymälle, jota ratkaisuerotus (kontrastit ovat ortogonaalisia vektoriin { "1" } nähden) ei näe; yhteismuotosiirtymä paisuttaa sitä, kun taas pareittaiset erotukset pysyvät tasaisina

seg-3359eee713a5 = Kuun datumin nolla-avaruuden luokittelu (LLR:n asteen additiivisuus + libraation vajauksen nosto)

seg-6d722c176052 = Sisäisen etäisyydenmittauksen datumongelman luokittelu: yksittäinen etäisyyshavainto tuottaa asteen { "1" } (6-ulotteinen nolla-avaruus); origo-X:n ja skaalan pari on lähes nolla, ja fysikaalinen DE440-libraatio nostaa vajauksen nollaan, vaikka pari pysyy lähes degeneroituneena

seg-3fd19007ea67 = Usean tekniikan kuun datuminformaatio (LLR + kuun VLBI + kiertäjän etäisyys)

seg-23d0dd7d0666 = Datum-Jacobin rivit Maa–heijastin-LLR-etäisyydelle, kahden aseman kuun VLBI-differentiaaliviiveelle ja kiertäjä–majakka-etäisyydelle 7-parametrisen datumin yli, yhdistettynä yhdeksi johdonmukaisesti esiehdollistetuksi Fisheriksi; osoittaa, että radiaalisuunnan ulkopuolinen (kiertäjä / syvyysmoninainen) seuranta rikkoo origo-X:n ja skaalan degeneroituneisuuden, kun taas poikittainen VLBI auttaa vain epäsuorasti

seg-ab96cfc8d48c = Kuun LLR-datumin geometriasubstraatti (pääakselien heijastimet, maa-asemat, analyyttiset etäisyyspartiaalit)

seg-40e91288f81a = Viisi lähipuolen retroreflektoriryhmää PA-kappalekoordinaatistossa metreinä ja LLR-maa-asemat geodeettisina koordinaatteina; heijastimen kappale–inertia-sijoitus DE440:n PA-orientaation kautta; Maa–heijastin-etäisyyden analyyttiset partiaalit 4-parametrisen datumin suhteen; sekä pelkkä LLR-Fisher-matriisi, joka osoittaa lunokeskipisteen X:n ja skaalan degeneroituneisuuden, joka motivoi 7-parametrista analyysiä

seg-63a8571f8eb0 = Etäisyyden ja kellon offsetin degeneroituneisuus yksisuuntaisessa kuun etäisyydenmittauksessa sekä geometrisen moninaisuuden suunnittelulaki

seg-cdd70f56051a = Solmukohtainen radiaalietäisyyden ja vastaanottimen kellon offsetin degeneroituneisuus on täsmällinen: { "1" } m vastaa { "3.336" } ns (yksi per c). { "{" }scale, offset{ "}" } -Schur-komplementtimarginaali (coupled_marginal_fisher) osoittaa, että geometrisesti moninaisessa verkossa kaksisuuntainen etäisyydenmittaus nostaa marginaalia suunnilleen samalla tekijällä kuin yhtä suuri määrä lisäyksisuuntaista dataa, kun taas idealisoidussa yhden solmun tilanteessa kaksisuuntainen nosto on suuruusluokkia suurempi. Siitä seuraava suunnittelulaki: geometrinen moninaisuus, ei kaksisuuntainen etäisyydenmittaus sellaisenaan, erottaa kuun koordinaatiston skaalan aikaskaalan offsetista yksisuuntaisessa etäisyydenmittauksessa; kaksisuuntainen tai ulkoinen aikasidonta tarvitaan vain vähäisen moninaisuuden tai yhden käyttäjän tilanteessa.

seg-2c074d6260ba = Edustava usean tekniikan mittausvalikoima ja additiivinen Fisher-yhdistämissääntö

seg-beefac5c1b13 = MeasurementBlock pitää yhden ehdokasmittauskampanjan 7x7-Fisher-informaatiopanoksena sekä skalaarisena suhteellisena kustannuksena; block_from_rows rakentaa sellaisen raakoista datum-Jacobin riveistä, jotta jokainen lohko esiehdollistetaan identtisesti funktion lunar_identifiability::assemble_multi_info kautta; combine summaa valitun osajoukon informaation, mikä on oikea sääntö, koska Fisher-informaatio on additiivinen riippumattomien mittausten yli; representative_lunar_menu tarjoaa deterministisen nelilohkoisen valikoiman (LLR, poikittainen VLBI-limbimajakka, lähipuolen kiertäjä ja kaukopuolen kiertäjä). Budjettirajoitteinen suunnitteluoptimoija, joka kuluttaa tämän valikoiman, ei kuulu tähän kirjastoon.

seg-2d3347bcb15e = Palveluntarjoajien välinen johdonmukaisuustoleranssi sekapalveluntarjoajan käyttäjälle

seg-9decf2cb6b0c = consistency_tolerance: kääntää käyttäjän paikkabudjetin parametrikohtaiseksi palveluntarjoajien väliseksi Helmert-yhtäpitävyysvaatimukseksi (origo/skaala/rotaatio) viitevipuvarrella, valinnaisesti paisutettuna P1-yhden palveluntarjoajan realisaation CRLB:llä

seg-5450d921dfc9 = Usean palveluntarjoajan kuun yhteentoimivuusvirhebudjetti ja koordinaatisto vs. efemeridi -suunnittelulaki

seg-e1e30f5c17a6 = interop_budget: vähennettävä (yhteinen koordinaatistosidos) vs. palautumaton (dynamiikka) jako käytännöillä PerProvider / CommonFrameTie / CommonEphemeris, palautumattoman osuuden suunnittelulakimittarilla (~{ "0.69" } todellisilla DE440/INPOP/EPM-arvoilla: pelkkä yhteinen koordinaatistotunniste jättää hallitsevan pohjan)

seg-ebb827739614 = Bysantin lohkokipinän havaitsemis- ja tunnistusraja autonomisessa solmukohtaisessa Kuun verkossa (T3)

seg-4fb935e6193d = byzantine_bound soveltaa turvallisen tilaestimoinnin koodaus- ja harvan havaittavuuden rajaa solmukohtaiseen verkkogeometriaan: Bysantin vertaissolmu syöttää mielivaltaisen lineaarikombinaation mittauksista, joihin se osallistuu, ja verkko HAVAITSEE jokaisen enintään f = block_spark − { "1" } vertaissolmun koalition sekä TUNNISTAA yksikäsitteisesti jokaisen enintään ⌊(block_spark − { "1" })/2⌋ solmun koalition; block_spark on pienin vertaissolmujen koalitio, jonka pinotut tehokkaat allekirjoitukset P⊥·B_T ovat sarakeasteeltaan vajaita. Vertaissolmun havaittavuus tarkoittaa matriisin P⊥·B_j TÄYTTÄ SARAKEASTETTA (nollasta poikkeava mutta asteeltaan vajaa lohko on nollasta poikkeava hyökkäys, joka päätyy avaruuteen range(G) eikä jätä jäännöstä), ei pelkästään ehtoa P⊥·B_j ≠ { "0" }

seg-4f57f586cf82 = Autonomisen holdoverin ajallisen mittakaavavapauden alaraja itseensä viittaavassa Kuun satelliittitähdistössä (T4)

seg-eb690e8f5c9b = holdover_floor osoittaa, että pelkillä solmujen välisillä mittauksilla yhdistetyssä autonomisten solmujen joukossa yhteinen kellotaajuus (δα_j += { "1" } ∀j) on joukon aikaskaalan vapaa parametri, joka kuuluu avaruuteen N(GᵀWG): mikään määrä lisää solmujen välistä etäisyydenmittausta ei tee siitä havaittavaa (rate_in_gauge = true, temporal_gauge_dim = { "2" } yhteisen siirtymän kanssa). Tämä on aito holdover-alaraja — jäykän koordinaatiston paikkavapauden ajallinen vastine. Yhden ulkoisen absoluuttisen taajuussidonnan lisääminen (suora yhteys verkon ulkopuoliseen vertailuun) poistaa yhteisen taajuuden nollavaruudesta (rate_in_gauge = false, temporal_gauge_dim = { "1" }), mikä osoittaa, että alaraja on todellinen mittakaavavapaus eikä oskillaattorimallin keinotekoinen artefakti

seg-25ffd6e1979c = Palveluntarjoajien yhteinen ja erotuskomponentti, yhden asteen puutteen yhtenäistäminen ja suojausvälin kulmakerroin (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Kolme puolta yhdestä hajotelmasta ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), jossa 8-ulotteinen datum⊕aikaskaala-vapaus on N(G) ja state_dim − { "8" } = { "32" } havaittavaa suuntaa muodostavat avaruuden range(G): (T5) provider_mismatch_split luokittelee usean palveluntarjoajan yhteisen harhan (∈ range(G)) HAVAITSEMATTOMAKSI — se vaatii ulkoisen sidonnan — ja erotusharhan (∉ range(G)) itse valvotuksi / HAVAITTAVAKSI; (§{ "0" }) yhtenäistäminen tarkoittaa, että SAMA range(G)-sokea aliavaruus hallitsee havaitsemattomien vikojen luokkaa, joten datum-vapaus N(G) ja vikasokea aliavaruus range(G) ovat yksi geometria, eivät kaksi; (g7) slope palauttaa Brownin suojausvälin kulmakertoimen ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ viasta b ∈ range(G) (estimaattori vääristyy nollapariteetilla) ja äärellisen havaittavasta viasta

seg-632add2dbd3c = ITU-T-telecom-synkronointimaskit PASS/FAIL-tuloksella ja marginaalilla

seg-47687529aee7 = Transkriboidut rajat: ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukittuna ja ePRTC-A holdover (mukaan lukien taulukon { "3" } aikavirheen verhokäyrä), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-luokat A-D ja G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) vertailupiste C, kukin avoin tai suljettu väli sellaisena kuin taulukko sen ilmoittaa, kaikki ’jatkotutkimuksen kohteena’ -merkinnät pois jätettyinä; jokaisesta tarkistuksesta tulos ja marginaali sitovassa pisteessä sekä aika kunkin budjetin ylittymiseen. Ajettavissa skenaariolajina <c1/>

seg-165ed2bc771a = ITU-T-taajuussynkronoinnin wander-generointimaskit (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Seitsemän vakiolämpötilan MTIE- ja TDEV-wander-generointimaskia lajille <c1/>: G.811 (09/1997) PRC (autonominen), G.812 (06/2004) tyypit I, II ja III, G.8262 (10/2024) EEC-vaihtoehdot { "1" } ja { "2" } sekä G.8262.1 (11/2025) eEEC (lukittu tila), mukaan lukien taulukoiden kirjoittamat potenssilakiosat (<c2/> ja vastaavat), kukin väli avoimena tai suljettuna kuten painettu, mitattuna lausekkeiden ilmoittaman { "10" } Hz:n suodattimen läpi (oletettu sovellettavan ennen näytteistystä); vertailuskenaario scenarios/telecom-synce-eec.toml asettaa vapaasti käyvän OCXO:n kolmea EEC-maskia vasten. Ei toteutettu: muuttuvan lämpötilan sallitut poikkeamat, holdover, transientit, jitter ja G.811:n taajuustarkkuus

seg-5fc2ad88faf0 = Kellolokien formaatit (RINEX clock, TimeLab ASCII, TAPR TICC) luettuna normalisoiduksi vaihesarjaksi

seg-5b5bcbdea166 = clock_log::read_input: yksi jäsennyskerros, joka muuntaa RINEX-kellotiedoston (yhden nimetyn kellon AS/AR-tietueet, versiot { "2" } ja { "3.00" } – { "3.04" }), TimeLab-tyylisen ASCII-vaihe- tai taajuuslokin tai TAPR TICC -aikaleima- tai intervallilokin yhtenäiseksi vaihehilaksi, jossa tau0 on ilmoitettu, otsakkeesta tai mediaaniväli, jokainen aukko, hilan ulkopuolinen lukema ja kaksoiskappale lasketaan, ja käytössä on kieltäytymis-, pisimmän jakson tai lineaarinen aukkokäytäntö; kytketty valinnaisesti telecom-ajoitussarjaan (<c1/>, lisää <c2/>-lohkon) ja kellolajiin (<c3/>, lisää <c4/>-lohkon, jossa ADEV, TDEV ja MTIE, taulukon SHA-256 ja vaiheen SHA-256; runs = { "1" }). Ilman taulukkoa molemmat lajit ovat tavu tavulta identtisiä

seg-acdb0337bce7 = Kellolokien formaatit linuxptp (ptp4l, phc2sys, ts2phc) ja chrony (tracking, statistics) luettuna normalisoiduksi vaihesarjaksi

seg-e87b3dba2072 = clock_log::read_input formaateilla ptp4l, phc2sys, ts2phc, chrony-tracking ja chrony-statistics: linuxptp-servorivin kirjattu siirtymä (ns, rivin oma hakasulkeissa oleva aikaleima; ennen kuin servo ensimmäisen kerran raportoi s2, luetut arvot jätetään pois ja lasketaan) tai chrony-tracking- tai -statistics-lokin siirtymä (s, sarakkeen sijainnin mukaan, UTC-päivämäärä ja -aika) muuttuu yhtenäiseksi vaihehilaksi samoilla aukkokäytännöillä kuin muut formaatit; lähdevalitsin (<c1/>) nimeää yhden useista rajapinnoista, kelloista tai osoitteista; lokit syöttävät telecom-ajoitussarjaa, kellolajia ja holdover-testilajia

seg-97aebb84576e = Operaattorin toimittamasta aikavirhetallenteesta pisteytetty holdover-testi

seg-ab533cf99c56 = Laji <c1/>: aikavirhetallenne (linuxptp-, chrony-, TICC-, TimeLab- tai RINEX-kellaloki tai time_s,time_error_ns-parit) jaetaan kahdesta operaattorin ilmoittamasta GNSS:n poiston ja palautuksen ajankohdasta perusvaiheeksi, holdover-vaiheeksi ja palautumisvaiheeksi; perusvaihe mitataan lukitulle kellolle kirjoitettuja ITU-T-maskeja vastaan ja holdover-vaihe holdoveria tai autonomista kelloa varten kirjoitettuja maskeja, ePRTC-A holdover -verhokäyrää ja aikavirhebudjetteja vastaan; holdover-vaihe raportoi pienimmän neliösumman taajuussiirtymän, jonka järjestelmä piti, ja palautumisvaihe sen, tuliko |TE| ilmoitetun kaistan sisään ja milloin, ja pysyikö se siellä ilmoitetun viipymäajan, sekä huipun ja suurimman askeleen. Jokainen raja on sama, jonka telecom-ajoituslaji transkriboi; kaksi ajankohtaa ovat operaattorin ilmoitus eikä niitä varmenneta

seg-94cbac97a1aa = GNSS-signaalin saatavuus avaruuspalvelualueella ja sen ulkopuolella verrattuna ICG:n SSV-julkaisuun

seg-c59e349fdc9e = Lajin <c1/> saatavuuspyyhkäisyt: tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja yhdistettynä sellaisten (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi ja vähintään neljä signaalia, sekä pisin katko, käyttäjälle pallolla (julkaisun 2,562 pisteen maailmanlaajuinen kuori, { "14" } päivää { "1" } minuutin välein) tai lentoradalla (GEO, HEO, Kuuhun siirtymärata), julkaisun liitteen C Kepler-radoista, vakiomääräisellä vähimmäissäteilyteholla vertailupoikkeamakulman sisällä, Maan peittymisellä pallo plus { "50" } km sekä C/N0-kynnyksellä; käyttäjäantennit julkaisun taulukosta B10

seg-d2f04991c8a4 = Reunasäteen ionosfääri-, plasmasfääri- ja ilmakehävaikutukset hipoviin GNSS-signaaleihin sekä heikon signaalin vastaanottimen suunnittelu lajissa <c1/>

seg-1a1786ba90b6 = Chapman-ionosfääri, Gallagher-tyyppinen plasmasfääri ja neutraali ilmakehä (taitekertoimen taipuma, hapen absorptio, defokusointi) integroituna lähettimen ja käyttäjän välistä suoraa sädettä pitkin: vinon suuntaisen kokonaiselektronisisällön, sen plasmasfäärisen osan, ylimääräisen viiveen, tangenttikorkeuden ja hipovien yhteyksien häviön laskenta; sekä heikon signaalin vastaanottimen suunnittelu (koherentti ja epäkoherentti integrointi, databittirajoitus, avustus, Doppler-haku), joka asettaa C/N0-kynnyksen hankinta- ja seurantasilmukkamalleista

seg-6b8f9f3ca2a3 = Aluksella toimiva GNSS-navigointisuodatin korkean radan ja Kuuhun siirtymäradan avaruusaluksille

seg-39ddc494f103 = Lajin <c1/> tila <c2/>: yhdeksäntilainen laajennettu Kalman-suodatin (paikka, nopeus, vastaanottimen kellon harha ja ajautuma, auringon säteilypaineen skaala) pseudoetäisyyksillä, joiden saatavuus, kohina ja C/N0 tulevat samasta yhteysgeometriasta kuin pyyhkäisyissä; totuus integroidaan J2:lla, Auringon ja Kuun kolmannen kappaleen vaikutuksella ja säteilypaineella varjo huomioiden, suodatin mallintaa J2:n ja kolmannet kappaleet ja estimoi säteilypaineen; raportoi paikka- ja nopeusvirheet GNSS-ratojen sisä- ja yläpuolella, pisimmän mittausaukon ja keskimääräisen NEES:n

seg-5fc242476828 = Usean avaruusaluksen muodostelman suhteellinen navigointi erittäin elliptisellä radalla GNSS:n avulla

seg-f67eb29d4483 = Lajin <c1/> tila <c2/>: päällikkö ja apulaiset ajavat kukin absoluuttista suodatinta; apulaisen paikka suhteessa päällikköön estimoidaan vähentämällä absoluuttiset estimaatit ja suhteellisella suodattimella molempien alusten seuraamien signaalien yksittäiserotetuilla pseudoetäisyyksillä, jolloin suhteellinen dynamiikka on kahden epälineaarisen lentoradan erotus

seg-7038f6902820 = Kylmäatomi-interferometrin virhetermit: Raman-laserin vaihekohina, aaltorintaman kaarevuusharha ja vyöhykeepäselvyyden ratkaisu

seg-4d9690207607 = inertial::cai_error_terms (kirjastofunktiot, joihin ei vielä pääse skenaariolajista): neliöpulssisen kolmipulssisen interferometrin Raman-vaiheen painotusfunktio (Cheinet ym. { "2008" }, yhtälö { "8" }) valkoisen vaiheen suljetun muodon ratkaisulla (pi/2)^{ "2" } S_phi0/tau_R ja numeerisella reitillä mille tahansa spektrille; laserin taajuuskohina, jota takaisinheijastuksen viive ei kumoa (Le Gouet ym. { "2007" }, yhtälöt { "9" } – { "11" }); lämpöpilven puhtaan defokusoinnin aaltorintamaharha sigma_v^2/R ja sen pieneneminen ilmaisusäteellä; väärän vyöhykeindeksin todennäköisyys erfc(pi/(sqrt({ "2" }) s)) klassisen kiihtyvyysanturin avulla ja kahdella kyselyajalla sekä sen käänteisfunktio

seg-363705e03bac = Oskillaattorin holdover-esiasetukset julkisista datalehdistä

seg-9750d9e0ec7a = Neljä esiasetusta — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A high-performance tube) ja CSAC (Microchip SA.45s) — kussakin datalehden Allan-poikkeaman maksimit, ikääntyminen ja lämpötilaraja; ei-negatiivisella pienimmän neliösumman menetelmällä sovitettu valkoisen + flicker + satunnaiskävelyn taajuuskohinan sovite, skaalattu verhoamaan jokainen datalehden piste, flicker-lattia, joka ei ole koskaan pidemmän τ:n lukua pienempi, lineaarinen ikääntyminen ja sinimuotoinen lämpötilatermi, syntetisoituna siemenluvulla tuotettuna holdoverina GNSS:n katoamisen jälkeen

seg-d7e03158b972 = Sekunnit, kunnes vapaasti käyvä kello poistuu aikaindeksoidun ajanjakson suojakaistalta, ja korjausten tahti, joka pitää sen sisällä

seg-0b4d8815f756 = Laji <c1/>: ennustettu virhe E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² käännettynä ylitykselle, jäljellä olevalle ajalle, uudelleensynkronointivälille korjausviiveen jälkeen ja korjauksille vuorokaudessa, kukin termi eriteltynä ja hallitseva nimettynä; kellot kuudesta ClockClass-oletuksesta (TCXO, OCXO ja RAFS lisätty, kukin viittaa yhteen datalehteen), telecom-ajoituksen esiasetuksista, inline-datalehdestä tai mitatusta tallenteesta; lähteen pisintä keskiarvotusaikaa pidemmälle ulottuva ylitys merkitään ekstrapoloiduksi

seg-2797643153dc = Ajoituksen suojaustaso kiertoradalla olevalle vastaanottimelle GNSS-harhautuksen aikana

seg-cb412a2ffadf = orbital_timing::orbital_timing, saatavilla tyypin <c1/> harhautusosiona: ympyräradan nopeus ja jaksonaika, pisin aika, jonka maassa oleva harhauttaja voi tavoittaa satelliitin yhdellä ylilennolla, kellotuettu valvonnan alaraja ja CUSUM-havaitsemisviive, ehdollinen suojaustaso (alaraja lisättynä viiveen aikaisella liukumalla), poikkeama, jonka harhauttaja ilmoitetulla enimmäisramppinopeudella ehtii kerätä ennen kuin satelliitti poistuu jalanjäljeltään tai riippumaton tarkistus suoritetaan, sekä onko jokainen maayhteyden tai ristilinkin tarkistus riippumaton yhdestä maassa olevasta harhauttajasta

seg-f134975d4ffa = L-kaistan spektrin vesiputouskuvaaja kaistakohtaisella J/S-arvolla ja efektiivisellä C/N0:lla skriptatun häirijäaikajanan alla

seg-86ad8f89a822 = Tyyppi <c1/>: L-kaistan tehospektritiheyden taajuus–aika-ruudukko (terminen lattia k T_sys, kun T_sys = T_ant + { "290" } K (F - { "1" }), signaalit rajapintamäärittelyn pienimmillä vastaanotetuilla tehoilla sekä jatkuva-aaltoinen, kapeakaistainen, chirp- ja sovitettu kohinahäirijä päälle- ja poiskytkentäajoin), jokainen solu keskiarvoistettuna kaistansa ja rivinsä yli (chirpit tarkasti kokonaisten ja osittaisten pyyhkäisyjen yli, häirijät käyttösuhteen mukaan), kaistakohtainen efektiivinen C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1 riviä kohti, J/S kaistaa kohti, kaistan sisäinen J/S sekä SVG-vesiputouskuvaaja C/N0-palkeilla. Raportti sisältää ristiintarkistuksen tyypin <c2/> ketjuun samoilla linkkisyötteillä

seg-6e0b9687e8ee = Uranus ja Neptunus Standishin taulukosta { "1" }, Pluto ja planeettojen nopeudet

seg-df3bf502dfe9 = Uranuksen ja Neptunuksen paikat Standishin taulukosta { "1" } (oletus välillä { "1800" } AD – { "2050" } AD), Pluto vuoden { "1992" } taulukon { "1" } rivistä, jota nykyinen JPL-sivu ei enää listaa, sekä jokaisen planeetan heliosentrinen nopeus: kahden kappaleen derivaatta elementtien implikoimalla keskiliikkeellä lisättynä ellipsin kiertymisellä periheliin, inklinaation ja solmun muutosnopeuksista

seg-a50be56f605a = Kuun ja seitsemän suuren kuun paikat (Phobos, Deimos, Galilein kuut, Titan)

seg-2cfbe5a1eece = Geosentrinen Kuu Montenbruck & Gill -sarjasta (jonka termi -1.3972 astetta vuosisadassa jo viittaa sen J2000-päiväntasaukseen) sekä Phobosin, Deimosin, Ion, Europan, Ganymedeen ja Callisto planeettakeskiset paikat ja nopeudet JPL Solar System Dynamics -keskielementeistä kunkin kuun Laplace-tasossa, keskipituuden muutosnopeus otettuna IAU:n synkronisesta pyörimisnopeudesta (taulukko ilmoittaa jakson liian harvoin numeroin vaiheen säilyttämiseksi), sekä Titanin IAU:n pyörimismallista (kuu kappaleenkiinteän x-akselin miinuspuolella keskietäisyydellä), koska Titanin ilmoitettu Laplace-tason rivi ei toista Horizonsia edes omalla ajankohdallaan

seg-8b8c8e28ece9 = Jokaisen aurinkokunnan kappaleen fysikaaliset vakiot ja koko järjestelmän raportti

seg-d225a30de35c = Body saa Merkuriuksen, Venuksen, Jupiterin, Saturnuksen, Uranuksen, Neptunuksen, Pluton, Phobosin, Deimosin, Ion, Europan, Ganymedeen, Callisto ja Titanin (gravitaatioparametri, vertailusäde, J2 siellä missä se on julkaistu sen säteen kanssa, johon se viittaa, IAU:n napa ja nollameridiaani), nimihaun ja BodyFacts-tietueen (NAIF-koodi, luokka, emokappale, ekvatoriaalinen ja keskisäde); tyyppi <c1/> raportoi ne kaikille kahdelleksantoista kappaleelle yhdessä paikkojen, valoaikojen ja yhden kierroksen rataviivan kanssa, ja jokainen kappale on merkitty VALIDATED tai MODELLED

seg-87ab655f8270 = Paikannus minkä tahansa aurinkokunnan kappaleen ympärillä paikallisella satelliittitähdistöllä ja syväavaruuslinkillä Maasta

seg-d9b1b0ac97d3 = Tyyppi <c1/>: nimellä valitun kappaleen ympärillä oleva kiertäjä tai pintalaskeutuja navigoi yksisuuntaisilla pseudoetäisyyksillä kappaleen ympärillä olevasta Walker-navigointisatelliittitähdistöstä (kahden kappaleen radat kappaleen J2-sekulaarisella ajautumalla, tuntematon käyttäjän kello) ja valinnaisella kellovapaalla kaksisuuntaisella etäisyydellä Maasta, Maan suunta ja etäisyys analyyttisestä efemeridistä jokaisena ajankohtana; kappaleen pallon estämät näkölinjat ja pinnan korkeuskulmamaski; ajankohtaa kohti pelkän satelliittitähdistön GDOP ja PDOP (orbit::dop), muodollinen paikkaepävarmuus Maa-rivin kanssa ja ilman sitä sekä siemennetyt Gauss–Newton-ratkaisut (batch_ls::gauss_newton) kumpaakin tapaa, kappaleelta Maahan kulkevalla valoajalla ja edestakaisella ajalla

seg-7d4d7200cbca = Peitto- ja tarkkuuden heikkenemiskerroinkartat mielivaltaisille usean satelliittitähdistön malleille laajassa mittakaavassa, minkä tahansa keskuskappaleen ympärillä

seg-b78b79e9fae4 = Tyyppi <c1/> kahden lukitun tapauksen ulkopuolella: eksplisiittiset ja moniverhoiset mallit, useita satelliittitähdistöjä ajoa kohti yhdellä vastaanottimen kellolla tähdistöä kohti, Maa, Kuu ja Mars kappalevakioista, BeiDoun esiasetus (keskiratavaihe ja { "118" } asteen E kallistetun geosynkronisen radan ylitys mallinnettuina), soluittain näkyvissä olevat satelliitit, GDOP, PDOP, HDOP, VDOP ja saatavuus, harvennetut maajäljet sekä sub-satelliittileveyspiirin näkyvyyden esisuodatin, joka ajaa { "5" } 000 satelliitin mallin { "10" } asteen ruudukolla sekunnin murto-osassa

seg-278c77438493 = Ketjutettu tehtävä skenaariotyyppien yli yhdellä yhteisellä aikajanalla

seg-3dcfb26f6234 = Tyypin <c1/> vaiheet: jokainen vaihe ajaa yhden tai useamman olemassa olevan tyypin skenaarion funktiolla run_toml, lukee niiden tulosteet nimettyihin kanaviin (kellon aikavirhe ja suoja, keskimääräinen efektiivinen kantoaalto–kohinatiheyssuhde ja seurantalattia, pystysuora suojaustaso ja hälytysraja, paikkavirhe, seuraavat satelliitit, hälytyslaput) tyyppikohtaisilla esiasetuksilla tai eksplisiittisillä tulospoluilla, sijoittaa ne vaiheen alkuun ja pitää ne yhteisellä ruudukolla, vaiheiden rajoilla ja tapahtumilla; tila siirretään eteenpäin carry-toiminnolla (kanava jatkuu edellisen vaiheen loppuarvosta), handoff-toiminnolla (edellisen vaiheen numero kirjoitetaan seuraavaan skenaarioon) ja end_at-toiminnolla (vaihe päättyy ajon laskemaan aikaan, kuten harhautusvalvonnan havaitsemisaikaan); kampanjatiiviste ja yhteenvetotiiviste jokaisen jäsentuloksen yli

seg-ad6105af464c = Parametripyyhkäisyt ja siemennetyt Monte Carlo -ensemblet minkä tahansa skenaariotyypin yli

seg-95921611839e = Tyypin <c1/> sweep-osio (yhdestä kolmeen pisteillä erotettua avainta mistä tahansa tyypistä, yleisen pyyhkäisyn akseliarvoilla, valinnaisesti ensemble jokaisessa solmussa) ja monte_carlo-osiot: realisaatio k ajetaan siemenluvulla base_seed + k; jokaisesta mittarista raportoidaan keskiarvo, keskihajonta, lähimmän sijan 5., 50. ja 95. persentiili sekä kiinteällä siemenluvulla laskettu persentiili-bootstrap-{ "95" } %:n luottamusväli keskiarvolle (inertial::metric_stat); mittarien yksiköt luetaan pyyhkäistyn tyypin omasta units-lohkosta

seg-24327a0ed82e = Useita skenaarioita yhteisissä olosuhteissa, yhdistetyllä yhteenvedolla

seg-5833fb3b06e3 = Tyypin <c1/> compose-osio: nimetyt yhteiset arvot (esimerkiksi yhden häirijän teho ja paikka) kirjoitetaan jokaiseen jäseneen avaimiin, joihin ne on sidottu, jokainen jäsen ajetaan, ja mittaria kohti raportoidaan jäsenten pienin, suurin ja keskimääräinen arvo nimettynä jäsenenä; mittarien yksiköiden on oltava samat kaikissa jäsenissä

seg-0bc866720bde = Rajattu optimointi yhdelle mittarille kampanjaparametrien yli

seg-f9bdb89c2b4f = Tyypin <c1/> optimize-osio (CAP-32): yhdestä kolmeen pisteillä erotettua skenaarioavainta rajattuna välille [lo, hi] lin- tai log-asteikolla, yksi tulospolulla luettu mittari, tavoite minimize, maximize tai target; menetelmä grid (pyyhkäisyn akseliarvot) tai deterministinen Nelder–Mead-simpleksi normalisoiduissa koordinaateissa laatikkoprojektiolla ja tavallisilla kertoimilla; puuttuva tai ei-äärellinen mittari saa huonoimman pistemäärän ja pysyy jäljessä; kun runs > { "1" }, mittari on keskiarvo yhteisten siemenlukujen yli; jokainen arviointi on nimetyn tyypin todellinen ajo, listattuna kohdassa trace ja laskettuna toistettavuustiivisteeseen

seg-652e28dfa10f = Matalan Maan kiertoradan paikannus-, navigointi- ja ajanmääritysjärjestelmien signaalimallit: koodiseuranta, havaitseminen, GNSS-yhteensopivuus ja kaistavertailu mille tahansa järjestelmälle

seg-c0ba5c7e708e = Tyyppi <c1/>: parametrisoidut signaalimallit (kaista, lähetyskaistanleveys, ITU-allokaatio; havainto-, data- ja pilottikomponentit BPSK(n)-, BOC(m,n)-, MBOC- tai tasaisilla spektreillä, tehonjaot, FDMA-alikantoaallot, koodipituudet ja datanopeudet) käännetyistä julkisista esiasetustiedostoista (Xona Pulsar, Iridium STL, Starlink-opportunistinen signaali, CentiSpace, yleinen C-kaistan malli sekä yleiset UHF/L/S/C/laaja-C-mallit, kullakin lähde-URL ja julkaisemattomat arvot merkittyinä REPRESENTATIVE) tai kirjoitettuna suoraan; signaalia kohti kaistarajoitettu tehospektritiheys, kaistansisäiset tehoosuudet, Gabor-kaistanleveys, koodijitter suhteessa C/N0:aan ja välitykseen sekä etäisyydenmittaustarkkuus, hakuavaruus, neliölakihavaitsemisen todennäköisyys sekä keskimääräinen sarja- ja koodirinnakkaishankinta-aika, spektrinerotuskerroin signaaleihin GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja AltBOC ja niistä C/N0-heikkenemän kanssa sekä CW-, laajakaista- ja sovitettu J/S-sieto spektrityypin SSC-ketjusta; ionosfäärin viiveen, vapaan tilan vaimennuksen, yhtäläisellä C/N0:lla ja yhtäläisellä EIRP:llä saavutettavan etäisyydenmittaustarkkuuden ja häirinnänsiedon kaistavertailu; sekä mallin laadulliset muototarkistukset kuvattua mittausta vasten

seg-c2b9c8e4a364 = Monikaistainen spektrin vesiputouskuvaaja (UHF, L, S, C) suunnitelluilla signaaleilla ja kaistakohtaisilla häirijöillä

seg-609df4e0a085 = Tyyppi <c1/> laajennettuna L-kaistan ulkopuolelle: kaistat annettuna esiasetettuna signaalimallina (piirrettynä jokaisella komponentilla, kaistarajoitettuna lähetyskaistanleveyteen, C/N0 ja J/S viitattuna seurattuun komponenttiin) tai mukautettuna kantoaaltona ja modulaationa; ylimääräiset vesiputouspaneelit millä tahansa taajuusalueella samalla aikajanalla ja värikaavalla; laajakaistainen (barrage) häirijä CW-, kapeakaista-, chirp- ja sovitetun kohinan rinnalla; kaistakohtainen J/S ja efektiivinen C/N0 muuttumattomasta spektrinerotuskerroinketjusta

seg-d9eb3e7e69c2 = LEO-PNT-ylilento ja sen kaistakohtainen linkkibudjetti näkyvissä oleviin MEO-GNSS-satelliitteihin verrattuna

seg-d986e44443dd = Tyyppi <c1/>: satelliitit suunnitellusta ylilennosta, elementeistä, TLE:stä SGP4:n kautta tai Walker-satelliittitähdistöstä tyypistä constellation-design; kaistaa ja ajankohtaa kohti katselukulmat, etäisyys, suljetun muodon etäisyyden muutosnopeus ja etäisyyden kiihtyvyys (tarkistettu joka ajolla keskeisdifferensseillä ja raportoitu), vapaan tilan vaimennus, EIRP isoflux-, Gauss- tai tasaisella kuviolla, patch-, puolipallo- tai isotrooppinen käyttäjäantenni, ITU-R P.676-10 Annex { "2" } -kaasuvaimennus, P.618-sade ja -sintillaatio, P.2109-rakennuksen läpäisyvaimennus, polarisaatiosovittumattomuus, järjestelmän kohinalämpötila, C/N0, Doppler ja Dopplerin muutosnopeus sekä ensimmäisen asteen viive Klobucharin tai pystysuoran TEC:n vinosta TEC:stä satelliitin alapuolisella Chapman-osuudella skaalattuna; ionosfäärivapaat parit koodikohinalla ylilennon huipulla; Galileo- tai GPS-kantoaallot niiden rajapintadokumenttien vastaanotetuista tehoista saman vastaanottimen kautta

seg-95a077a980b6 = Nimetyt LEO-PNT-järjestelmäesiasetukset ilmoitetuin lähtein sekä järjestelmäagnostinen moottori

seg-4b47033cda24 = leo_link::presets: yleinen monikaista (UHF, L, S, C), yleinen C-kaista, Xona Pulsar X1/X5, Iridium STL, Starlink vain Doppler-signaalina opportunistisena signaalina, CentiSpace ja valinnainen Celeste IOD -esiasetus, kunkin lähde merkittynä PUBLIC (URL-osoitteen kanssa), REPRESENTATIVE tai WORKSHOP, työpajaesiasetus valinnaisessa Celeste IOD -esiasetustiedostossa ja käännetään mukaan vain jos tuo tiedosto on olemassa; jokainen kaista ja rata on ohitettavissa skenaariossa, ja skenaario voi olla nimeämättä mitään esiasetusta

seg-a39f34973373 = Matalaenergiapaikannus: aika ensimmäiseen ratkaisuun ja energia ratkaisua kohti suhteessa käyttösuhteeseen

seg-f3b9b669a76f = leo_link::energy ja tyypin <c1/> [iot]-osio: Doppler-nopeuden rajoittama koherentti integrointi, neliölakiset epäkoherentit summat havaitsemiskynnykseen, Doppler-lokerohaku radan staattisen käyttäjän verhokäyrän yli (kylmä) tai tuettu ikkuna (kuuma), rinnakkainen tai sarjahaku koodille, navigointiviestin aika kylmäkäynnistyksessä, energia ratkaisua kohti ja akun kesto ratkaisuvälien yli, jokaiselle LEO-kaistalle ja GNSS-signaalille

seg-8121e7db3db3 = LEO-navigointisanoman päivitys ylilennon aikana ja jatkuvuustarkistus vaihtohetkellä

seg-34c310d85c42 = Tyypin <c1/> ylilennon aikaisen päivityksen analyysi: käyttäjän korkein ylilento hakujaksolla, sanomat yleisellä aikataululla ja käyttöjaksot keskitettynä sovitusikkunoihinsa, ja jokaisella vaihtohetkellä 3D-paikkahyppy, kellohyppy, käyttäjän pseudoetäisyyshyppy, suurin hyppy minkä tahansa näkyvän näkölinjan yli (suljettu muoto nadiirikartion yli), etäisyysvirhe ennen ja jälkeen sekä PASS/FAIL kynnystä vasten

seg-7635a8339e78 = LEO-navigointisanoman dokumentoitu binäärikoodaus ja kvantisointivirhebudjetti

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanan oma kehys (johdanto, versio, malli, pituus, hyötykuorma, CRC-24Q) neljälle efemeridimallille, kellopolynomille, SVID:lle, datan julkaisutunnukselle, kaistalle, terveydelle, Klobuchar-joukolle, NeQuick-G-kertoimille ja UTC-parametreille, jokaiselle kentälle ilmoitettu leveys ja askel (field_table), kvantisointi alueen ylityksen hylkäyksellä sekä budjetti suurimmalle paikan ja kellon muutokselle, jonka kunkin kentän puolen askeleen muutos aiheuttaa voimassaoloaikana

seg-17ca41d7fd71 = LEO-navigointisanomien RINEX-4-tyyliset ja CSV-viennit

seg-185e12ccef0d = leo_navmsg::text: RINEX-4-tyylinen lohko (> EPH-tietueen otsikko, satelliitti- ja epookkirivi kolmella kellotermillä, D19.12-lähetetyn radan rivit) järjestelmäkirjaimella L ja tietuetyypeillä KP16, KRAC, LU22 ja APOL, jokaisessa otsikossa merkittynä Kshana-laajennukseksi, joka ei kuulu RINEX { "4.02" } -standardiin, sekä CSV-taulukko oletussarakeskeemalla ja esiasetetuilla skeemoilla, kullekin tuoja

seg-e79047fc95af = ATOMIC-nollakello-ECEF-polynomi ja synteettinen viiden korkeuden LEO-mallivertailu

seg-e261843e35b1 = leo_navmsg::elements::EphemerisModel-tyypin EcefPoly-variantti: akselikohtainen ECEF-polynomi ilman kellotermejä, relativistinen termi lausekkeesta -2 r.v/c^{ "2" }, pisteytettynä ohjattua kelloa vasten. Lisäksi mallivertailuanalyysi (liu_comparison yli LIU2025_TABLE), joka sovittaa 22-parametrisen mallin artikkelin viidellä korkeudella Kshanan integroimalle radalle 20 minuutin kaarilla ja tulostaa tuloksen julkaistun SISRE:n viereen

seg-d2e18c8bdc14 = Paikannus LEO-Dopplerista, yhden ja usean satelliitin, kellon ajautuma- ja nopeustiloilla

seg-de6cb3c06490 = Eräajona tehtävä Gauss–Newton-paikannus etäisyysnopeudesta analyyttisillä osittaisderivaatoilla (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), vaihtoehtona vakiokäyttäjänopeus, korkeuspseudomittaus pintakäyttäjälle, vaimennetut askeleet; muodollinen kovarianssi todellisessa pisteessä; ratasuuntaiset, ratapoikittaiset ja pystysuuntaiset projektiot; yhden ylilennon tarkkuus suhteessa käyttäjän ratapoikittaiseen siirtymään; lähimmän lähestymisen aika. Lajin <c1/> Doppler-tila lisää virheen ikkunan pituuden funktiona ja vain Doppleriin perustuvan opportunistisen signaalin tilan (esiasetus starlink-sop)

seg-7f462969d2d4 = Yhteinen GNSS- ja LEO-pseudoetäisyyspaikannus järjestelmien välisillä harhoilla ja signaalikohtaisilla virhemalleilla

seg-b9b5298e3408 = Painotetun pienimmän neliösumman Gauss–Newton-ratkaisut mille tahansa järjestelmien yhdistelmälle, yksi vastaanottimen kello järjestelmää kohti (järjestelmien välinen harha estimoidaan paikan mukana) tai tunnettu lähetetty siirtymä vertailuaika-asteikolla; mittauskohtaiset sigmat kutsujan antamina, oletuksena moottorin viivelukitussilmukan lämpökohina (navsignal::dll_code_jitter_chips) korkeuskulman C/N0-arvolla yhdistettynä signaali avaruudessa -etäisyysvirheeseen; painottamaton DOP (GDOP, PDOP, HDOP, VDOP, TDOP) paikallisessa geodeettisessa koordinaatistossa, muodolliset itä–pohjoinen–ylös-sigmat ja harhasigmat; lajin <c1/> yhteinen tila vertaa vain GNSS:n, vain LEO:n ja yhdistettyjä ratkaisuja ja pyyhkäisee DOP:n lisättyjen LEO-satelliittien lukumäärää vastaan

seg-ee9a4a0cb530 = Tarkan pistepaikannuksen (PPP) konvergenssi pelkällä GNSS:llä ja LEO-täydennyksellä

seg-a54f36c27d90 = Float-PPP-laajennettu Kalman-suodatin ionosfäärivapaalla koodilla ja vaiheella: staattiset koordinaatit, valkoinen vastaanottimen kello, yksi järjestelmien välinen harha jokaista lisäjärjestelmää kohti, satunnaiskävelyn zeniitin märkäviive kuvattuna kertoimella 1/sin(korkeuskulma), float-kokonaislukuepävarmuus jokaiselle satelliittikaarelle lisättynä nousussa ja pudotettuna laskussa sekä satelliitin koodille ja vaiheelle yhteinen tarkan radan ja kellon virhe, käsiteltynä yhtenä korreloituna kaksirivisenä päivityksenä Joseph-vakautetussa muodossa; mittaukset simuloidaan samasta mallista; konvergenssiaika (virheet kynnysarvojen alla ajon loppuun asti), virhekäyrät ja ajon keskiarvoistettu paikan NEES pelkälle GNSS:lle ja kullekin LEO-tapaukselle, ajettuna lajina <c1/>

seg-9306f1c06081 = LEO-avusteinen ajansiirto UTC-aikaan suhteessa C/N0:hon ja vastaanottimen oskillaattoriin

seg-c618feb01476 = Kellomittaukset jokaiselta näkyvissä olevalta LEO-satelliitilta tunnetussa paikassa, yhdistettynä käänteisvarianssilla pseudoetäisyyden kohinamallista, suodatettuna kaksitilaisella (vaihe, taajuus) Kalman-suodattimella, jonka prosessikohina on oskillaattoriluokan valkoinen ja satunnaiskävelytaajuuskohina (slot_timing::ClockNoise, clock_state::ClockClass; holdover::coast_phase_variance-funktion vapaaliikevarianssi), samoista tasoista siemenluvulla tuotettu todellinen kello ja IS-GPS-200:n kohdan { "20.3.3.5.2.4" } järjestelmäaika–UTC-lauseke, johon lähetetyn siirtymän epävarmuus lisätään ajokohtaisena harhana; lajin <c1/> ajoitustila pyyhkäisee oskillaattoreita ja C/N0-siirtymiä

seg-d92777401093 = Nimetyt LEO-PNT-järjestelmät valinnaisina dataesiasetuksina, kullekin lähde

seg-5130bfe2410c = Järjestelmäriippumattomat syötteet: jokainen järjestelmä on Walker-kuoria, eksplisiittisiä elementtejä tai GNSS-esiasetus, signaali (kantoaalto, chip-nopeus, kaistanleveys, vastaanotettu teho tai C/N0-alue), SISRE, Doppler-sigma ja kellomalli; esiasetukset täyttävät vain sen, minkä skenaario jättää pois, yksi tiedosto kutakin, lähteet merkittynä PUBLIC (URL-osoitteella), WORKSHOP tai JOHDETTU ja julkaisemattomat arvot lueteltuna edustavina: Xona Pulsar X1/X5, Iridium STL, Starlink-opportunistiset signaalit, CentiSpace, edustava C-kaistajärjestelmä, ATOMIC-nollakellon efemeridimalli ja yksi työpajassa johdettu esiasetus valinnaisessa Celeste IOD -esiasetustiedostossa, joka poistetaan käytöstä poistamalla tuo tiedosto ja sen skenaariot

seg-dec52b5b9cd6 = Yksi LEO-PNT-järjestelmä päästä päähän: signaalisuunnittelu, ylilennon linkkibudjetti, navigointiviesti ja yhdistetty paikannus, kunkin vaiheen tuloste annettuna seuraavalle

seg-39443b31d418 = Laji <c1/>: leo-signal-suunnittelu (julkinen esiasetus tai inline) asettaa leo-pass-kaistan keskitaajuuden, kaistanleveyden, chip-nopeuden ja EIRP-jaon; ylilento antaa seurattavan komponentin C/N0:n ja kaistarajoitetun koodijitterin epookeittain; pienimmän neliösumman C/N0-suora muuttujassa sin(korkeuskulma), leo-navmsg-viestin SISRE (sovitettuna ylilennon satelliitin radalle, plus ilmoitettu radanmääritystermi neliöiden summan neliöjuurena) sekä suunnittelun kantoaalto ja chip-nopeus siirtyvät jokaiselle leo-pvt-yhteisratkaisun LEO-järjestelmälle ja valinnaisesti leo-ppp:n LEO-tapauksille; jokainen luovutus raportoidaan arvona ja yksikkönä

seg-55ca63edff02 = Harhautuksen havaitseminen LEO-Dopplerin ja ylilentogeometrian johdonmukaisuudella

seg-b12fc1728220 = Lajin <c1/> osio <c2/>: harhauttaja väärentää etäisyyden ja etäisyysnopeuden suhteen itsejohdonmukaisesti väitetyssä paikassa nähdyt signaalit, ja paikka hyppää ja/tai työntyy pois todellisesta alkamisen jälkeen (LEO-kaistaa kohti ja MEO-GNSS-signaalille); vastaanotin ennustaa jokaisen etäisyysnopeuden lähetetyltä radalta ja riippumattomasta ennakkopaikasta ja -nopeudesta ja testaa mitatut etäisyysnopeudet yleistetyn pienimmän neliösumman khiin neliö -tunnusluvulla epookkien ikkunan yli (kellon ajautuma haittaparametrina tai ennakkotiedolla), GNSS-kanavilla, LEO-kanavilla ja kaikilla kanavilla taajuuslukitussilmukan lämpökohinalla C/N0:sta (Kaplan & Hegarty { "2006" }, kohta { "5.6.2" }); havaitsemistodennäköisyys ei-sentraalisesta khiin neliö -jakaumasta ilmoitetulla väärän hälytyksen todennäköisyydellä, havaitseminen julistetaan ilmoitetulla havaitsematta jäämisen todennäköisyydellä

seg-5f341f85ac07 = Harhautuksen havaitseminen monikaistaisen LEO-signaalin kaistojen välisellä johdonmukaisuudella

seg-2f9c4d351b0f = Jokaiselle LEO-satelliitille ja etäisyydenmittauskaistojen parille osio <c1/> muodostaa geometriasta vapaan pseudoetäisyysyhdistelmän, poistaa vastaanottimen ionosfäärimallin ja testaa sen epookista toiseen tapahtuvaa askelta kahden kaistan koodikohinaa ja ilmoitettua siedettyä mallintamatonta ionosfäärinopeutta vasten (kaksipuolinen Gauss, tarkka havaitsemistodennäköisyys); harhauttaja, joka väärentää osan kaistoista mutta ei toisia, tai kaikki kaistat ilman ionosfääriä, havaitaan alkamishetkellä; sellaista, joka väärentää jokaisen kaistan ja simuloi ionosfäärin, ei havaita, minkä tulos ilmoittaa

seg-97dbcd5f2728 = Ionosfäärin luotaus: vino TEC LEO-ylilennon kaksikaistaisesta viiveestä

seg-844de34fd2f3 = Jokaiselle lajin <c1/> satelliitin kaistaparille raportti antaa vinon kokonaiselektronisisällön, jonka geometriasta vapaa koodiyhdistelmä palauttaa ylilennon huipulla, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), ja sen 1-sigman kahden kaistan lämpökoodikohinasta, jotta mitä tahansa monikaistaista LEO-PNT-suunnitelmaa voidaan punnita ionosfäärisondina

seg-1fdbb476c8ab = Merenkulun luottamuspistemäärä: valvontojen todisteiden kokoaminen 0–100 pistemääräksi ja sen kolmeksi vyöhykkeeksi

seg-0d76b33144f1 = Jokainen valvonta tiivistää todisteensa tunnusluvun ja kynnyksen suhteeksi; pistemäärä on { "100" } miinus valvontojen yli laskettu painon ja suhteen rajatun lineaarisen rampin tulo ({ "0" } arvoon { "0.5" } asti, { "1" } kohdassa { "1.5" }) summattuna, rajattuna välille { "0" } – { "100" } ja pyöristettynä tarkkuuteen { "0.1" }, vyöhykerajoina { "90" } ja { "55" }; jokainen epookki luettelee valvonnat, jotka vähensivät pisteitä, ja niiden pisteet.

seg-51640405c9b7 = Luottamustelemetrian SIEM-tapahtumat: Log Event Extended Format (LEEF) syslogin yli

seg-1b3245506847 = Vyöhykemuutos- (tai epookkikohtaiset) tapahtumat Log Event Extended Format { "2.0" } -hyötykuormina RFC { "5424" } -kuoressa UDP:n tai TCP:n yli, dokumentoidulla kenttäkartoituksella.

seg-c04042b0270a = JammerTest { "2024" } -aineistolla kalibroidut vastaanottimen luottamuksen häiriökynnykset

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: C/N0-pudotuksen, AGC:n ja häirintäindikaattorin valvontojen ennakkorekisteröity kalibrointi julkisella JammerTest { "2024" } -aineistolla (Zenodo { "15911589" }, GPL-3.0-or-later, haettu ajon aikana, ei koskaan mukana): kansiota kohti { "1" } s:n aikajana tiedostoista mon_rf.csv ja rinex.csv, valvonnat ajetaan kerran, jokainen kalibroinnin jälkeinen epookki merkitään puhtaaksi tai häirityksi kansion attack_log-tiedoston perusteella (siirretty CEST:stä UTC:hen, { "60" } s:n suoja), jokainen kynnys pyyhkäistään kiinteällä hilalla, valitaan pienin kynnys, jolla yhdistetty puhtaan väärän hälytyksen todennäköisyys on enintään { "0.01" }, ja jätä yksi kansio pois -pidätetyt lukumäärät; UBX-lukijan ristiintarkistus. Valinta toimitetaan vain valinnaisena profiilina [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); oletussääntö ja jokainen tuloste ilman sitä ovat muuttumattomia

seg-65a8361b4a22 = Jammertest-pisteytys: vastaanottimen loki pisteytetään jokaista ajoitettua testiä kohden (havaitsemisviive, havaitsematta jääneet hälytykset, väärät hälytykset, palautumisaika) julkaistua testisuunnitelmaa vastaan

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA:n testiluettelo ja lähetyssuunnitelma (MIT, haettu kiinnitetyllä SHA-256-tiivisteellä, ei koskaan mukaan kopioituna) luetaan ajoitettuna totuutena luettelotunnukset säilyttäen; receiver-trust-ajo pisteytetään testeittäin (ensimmäinen hälytys miinus suunniteltu alku, havaittu/myöhäinen/ohi mennyt toleranssia vasten, aika ensimmäiseen hälytyksettömään jaksoon, hälytykset jokaisen ajanjakson ja sen suojavälin ulkopuolella), ja allekirjoitettu todistepaketti kuljettaa tuloskortin. Aikataulu koostuu suunnitelluista ajanjaksoista, ei tallennetuista lähetysajoista

seg-ee99388f7b15 = compliance (kshana compliance-report): kuvaus Kshanan tulosteista julkisten kehysten kohtiin pelkästään numeroin, täytettynä annetuista ajoista; tulos lasketaan jonkin ominaisuuden hyväksi vain, kun se sisältää kuvauksen nimeämän todisteen, tyhjä joukko ei todista mitään, ja sanamuoto on "tukee todisteita" (supports evidence for); raportti ei ole toteamus siitä, että jokin kehys täyttyisi, eikä kenenkään antama luokitus tai hyväksyntä.

seg-98c360d82d56 = Merenkulun integraatiot: Signal K -liitännäinen, OpenCPN:n portin virta ja pisteytyspaneeli, viitekäännös

seg-7af9ce566646 = Luottamuspistemäärä, kaista, syyt, portin tila ja vastaanottimen ilmoittama paikka julkaistaan polussa navigation.gnss.kshana Signal K -palvelimessa varoitus-, hälytys- ja normaali-ilmoituksin (integrations/signalk); porttitettu NMEA-virta, jossa paikka on merkitty virheelliseksi luottamuksen romahtaessa ja jossa on yksi PKSHT-sanoma kierrosta kohden, jonka portti itse tai pieni välittäjä tarjoaa OpenCPN:lle TCP:n yli, sekä OpenCPN:n natiivi pisteytyspaneeli, joka lukee PKSHT-sanoman (integrations/opencpn); sekä systemd-yksiköt ja kontti, jotka ajavat porttia (deploy/reference-build). Kun nämä näyttävät tulosteen, siinä on ohjeellinen ilmoitus: Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-89ab9ef155eb = BOC({ "1,1" })-seuranta: DLL-skaalaus ja bump-jump-ambiguiteetin ratkaisu (valinnainen)

seg-ef24be9b5917 = iq::track::LoopConfig-rakenteen boc-kenttä (valinnainen, oletuksena None): kolme DLL-diskriminaattoria skaalataan lukemaan koodivirhe chippeinä yksikkökaltevuudella sini-BOC({ "1,1" }) -pääpiikissä, ja bump-jump-monitori hyvin aikaisilla ja hyvin myöhäisillä korrelaattoreilla yhden alikantoaallon puolijakson ({ "0.5" } chippiä) etäisyydellä hyppäyttää koodin NCO:n kohti pääpiikkiä, kun ylös/alas-laskuri saavuttaa arvon N (oletuksena { "8" }). Ilman valintaa jokainen tuloste on ennallaan.

seg-2c32955cbfb3 = IQ:n ionosfäärin tuikekanava (Cornellin malli) mitattua { "50" } Hz:n GPS L1 -tuikintaa vasten

seg-2fdcb373ab25 = iq::channel::scint, Cornellin tuikintamalli (Rice-intensiteetti, toisen asteen Butterworth-spektri, vaihe arg z), jota ohjataan mitatun ikkunan S4-arvolla ja intensiteetin dekorrelaatioajalla, verrattuna siihen, mitä se tuottaa näiden kahden syötteen lisäksi; realdata::scint50 lukee mitatun lokin, poistaa siitä trendin ja ajaa vertailun.

seg-160507ac3702 = Solukeskiarvoistava CFAR-valinta IQ-signaalin haussa

seg-7c0a1adc9ae6 = iq::acq::ca_cfar ja ca_cfar_cells (valinnainen): hakuruudukon solua verrataan oman Doppler-rivinsä vertailusolujen keskiarvoon (suoja- ja askelviiveet, jaksolla ympäri kiertäen), kertoimella alpha, joka asetetaan suljetun muodon CA-CFAR-väärähälytystodennäköisyydestä M epäkoherentille lohkolle (ca_cfar_pfa, ca_cfar_alpha). Näytetehoilmaisin pysyy oletuksena, ja jokainen olemassa oleva tuloste on ennallaan.

seg-5bd3bf0c22a7 = Spektrimalli: GLONASS-, BeiDou- ja Galileo E6 -kaistat (valinnainen)

seg-9c16189c63ac = spectrum::default_band ratkaisee pelkän nimen perusteella (MORE_BAND_NAMES) GLONASSin L1OF:n ja L2OF:n jokaisella FDMA-kanavalla K = -7–{ "6" } (BPSK, { "0.511" } Mchip/s), BeiDoun B1I:n (BPSK({ "2" })), B1C:n (MBOC(6,1,1/11)), B2a:n ja B3I:n (BPSK({ "10" })) sekä Galileon E6:n (BPSK({ "5" })), niiden rajapintakuvausasiakirjojen kantoaalloilla ja vähimmäisvastaanottotehoilla; oletuskaistajoukko ja jokainen olemassa oleva tuloste ovat ennallaan.

seg-7b1ae0c7ca28 = LunaNet AFS:n kolmannen tason koodit ja viestikerros (SB1 BCH, CRC-24Q, lomittaja) LSIS-AFS V1.0:aa vasten

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkronointikuvio, SB1 BCH({ "51,8" }) -enkooderi ja 256 hypoteesin dekooderi, CRC-24Q, { "60" } x { "98" } -lohkolomittaja, symbolivirran tarkistin (kshana lunanet-afs-check) ja testivirran generaattori paikkamerkkialikehyksin. Alikehysten { "2" }–{ "4" } nopeuden 1/2 LDPC-koodausta ei ole toteutettu (sen matriisit ovat erillisessä liitteessä).

seg-0d7b17524c04 = Standardipaketit: skenaariot pisteytettynä ennen ajoa asetettuja kynnyksiä vasten

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): DHS Resilient PNT -kehyksen testiprofiilit tasoille { "1" }–{ "4" }, IMO MSC.1/Circ.1575:n tarkkuustasot ja eheyden arviointi sekä ICAO Doc { "9849" } Appendix F:n monitoroi, arvioi ja lievennä -paketit: jokainen testi ajaa mukana toimitetun skenaariotyypin ja vertaa tuloskenttiä paketissa asetettuihin kynnyksiin, ja testit, jotka tarvitsevat vastaanottimen lokin, on merkitty NEEDS INPUT eikä niitä pisteytetä.

seg-8a8f2c85e0c3 = Laboratorion kiertomatkan todistepaketti (skenaario, testiolosuhteet, vastaanottimen loki, pisteytys)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) ja komennon kshana bench-export vastaanottimen lokin vienti kshana.test-conditions/1: allekirjoitettu paketti, joka kirjaa skenaarion tiivisteen, ilmoitettujen olosuhteiden tiivisteen, lokin tiivisteen ja pisteytyksen ilmoitettuja tapahtumia vasten, ja joka hylkää olosuhteet, jotka ovat ristiriidassa pisteytyksen tapahtumien kanssa, sekä lokin, jonka tiiviste ei ole ilmoitettu. Signaalia ei kirjoiteta, toisteta eikä ajoiteta.

seg-a9189e4fe413 = IQ-seurantamoottori GNSS-SDR { "0.0.19" }:ää vasten riippumattomilla tallenteilla

seg-364de05e5b1b = Koko IQ-kerroksen seurantamoottori (iq::track komennon kshana iq track kautta: haun luovutus, korrelaattorit, NCO:t, toisen asteen { "15" } Hz:n Costas-PLL, ensimmäisen asteen { "2" } Hz:n kantoaaltoavusteinen EML-verhokäyrä-DLL, lukitusilmaisin ja C/N0-estimaattorit) GPS L1 C/A:lla tasoilla { "30" }–{ "45" } dB-Hz.

seg-259d201c2ff8 = CRPA-antennivahvistukset häirintätyypissä riippumatonta numpy-uudelleenlaskentaa vasten

seg-192144c57783 = Häirintätyypin valinnainen [crpa]-osio: kanavakohtainen keila kohti kutakin satelliittia (nollan ohjaus häirittäjä nollana, tai MVDR kaavalla sigma^{ "2" } I + P_j a_j a_j^H), joka skaalaa kunkin linkin kohinaa tekijällä ||w||^{ "2" } ja häirittäjää tekijällä |w^H a_j|^{ "2" } ennen olemassa olevaa häirinnänestoyhtälöä C/N0:lle.

seg-a2f34cff9338 = Jammerin maastovarjostus jamming-lajissa riippumatonta numpy-uudelleenlaskentaa vasten todellisella SRTM-ruudulla

seg-334c569d9cae = Jamming-lajin valinnainen osio [terrain]: suurympyrän maastoprofiili jammerin ja vastaanottimen välillä SRTM .hgt -ruudulla k-kertoimen Maan pullistuman kanssa, hallitseva veitsenterä (suurin Fresnel–Kirchhoff nu) ja ITU-R P.526-15:n kohdan { "4.1" } yhden veitsenterän häviö, vähennettynä jammerin vastaanotetusta tehosta.

seg-825c121c7512 = Hankinnan hystereesi ja etupään kvantisoija jamming-lajissa riippumattomia uudelleenlaskentoja vasten

seg-f7207263d881 = Jamming-lajin valinnainen osio [acquisition] (satelliitti hankitaan hankintakynnyksellä tai sen yläpuolella uudelleenhankintaviiveen jälkeen ja pidetään, kun taso on seurantakynnyksellä tai sen yläpuolella) ja osio [front_end] (AGC-lukema { "10" } log10({ "1" } + J/N) ja ADC:n Gaussin syötteen kvantisoijahäviö, vähennettynä jokaisesta linkistä, merkittynä ei-Gaussisille jammereille pätemättömäksi).

seg-9c46f1c76486 = Rajattu FLL:n sisäänveto oletussuunnittelun FLL:stä PLL:ään siirtymän lattian alapuolella (valinnainen)

seg-efa1d1a9e904 = iq::trackin valinnainen carrier.fll_pull_in_max_s (iq::track::LoopConfig-tyypin kenttä fll_pull_in_max_s): asetuksella fll_assist = pull-in FLL luovuttaa PLL:lle kiinteän sisäänvetoajan jälkeen PLI:stä riippumatta, ja vastaava paluuviipymä kestää, kunnes PLI ensimmäisen kerran saavuttaa arvon fll_off_pli.

seg-ac0f97e945a7 = RTKLIB .pos -ratkaisulukija receiver-trustille

seg-0b8bc2c89de4 = Lukee RTKLIB-ratkaisutiedoston (kalenteri- tai GPS-viikko/TOW-aika, leveys-/pituusaste- tai ECEF-paikka, käytetyt satelliitit) receiver-trust-aikajanaksi (receiver_trust::machines::rtklib).

seg-849393517c04 = NovAtel OEM7 ASCII- ja binäärilokit (BESTPOS, RANGE, RXSTATUS) receiver-trustille

seg-7e0021922025 = Lukee BESTPOSin (paikka), RANGEn (C/No signaalia kohti) ja RXSTATUSin (vastaanottimen häirintälippu epookin omana ilmoituksena) ASCII- ja binäärimuotoisista OEM7-lokeista, CRC-tarkistettuna, vain luku (receiver_trust::machines::novatel).

seg-a45c53a9deb3 = RTCM { "3" } MSM4- ja MSM7-kantoaalto–kohinasuhdelukija receiver-trustille

seg-0a0c9976236f = Lukee RTCM { "3" } MSM4- ja MSM7-viestien jokaisen signaalisolun C/N0:n (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) kehysvirrasta, CRC-24Q-tarkistettuna (receiver_trust::machines::rtcm3). Rakenteet BSD-lisensoiduista pyrtcm-taulukoista, ei RTCM-standardin tekstistä.

seg-cd554a7c1649 = GNSS-SDR-valvontasovitin receiver-trustille

seg-22b587ac642d = Lukee GNSS-SDR Monitor (Gnss_Synchro) ja PVT-monitor -viestit, välitettyinä JSON-riveiksi proto-kenttien nimillä, kanavakohtaiseksi C/N0:ksi, paikannukseksi, käytetyiksi satelliiteiksi, HDOP:ksi ja taivaaksi (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-217e5953c128 = IMU-lokin sisäänotto, gyrosuunnan syöte ja hybridianturien parametrien Allan-sovitus

seg-9dadc819daef = Lukee IMU CSV:n (dokumentoidut sarakkeet tai EuRoC-rakenne); integroi kääntymisnopeuden suunnaksi, jonka heading-course-valvonta lukee ([log.imu]); ja sovittaa hybridi- ja fuusioskenaarioiden kiihtyvyysanturin ja gyron kohinaparametrit paikallaan olevasta lokista limittyvällä Allan-poikkeamalla (imu-fit).

seg-15a852a2dcb0 = Home Assistant MQTT -löytö ja tilaviejä luottamustelemetrialle

seg-6d6b07b26966 = JSON-tila-asiakirja ja Home Assistant MQTT -löytöviestit luottamusvirralle, tulostettuna tekstinä jokaisella pinnalla ja julkaistuna MQTT { "3.1.1" } QoS { "0" } -yhteydellä komentoriviltä (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-68caf86157c2 = ROS { "2" } receiver-trust -paketti ja gnss_lib_py-silta

seg-e7d7d99fe538 = ROS-vapaa silta, joka kirjoittaa paikannus- ja satelliittiviestit NMEA:ksi ja pisteyttää ne Python-sidoksen kautta (integrations/ros2/kshana_trust), sekä gnss_lib_py NavData–receiver-trust-silta rtklib-pos-formaatin kautta (integrations/gnss_lib_py).
