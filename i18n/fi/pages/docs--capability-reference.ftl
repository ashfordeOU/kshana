# docs--capability-reference: translations (fi)

seg-f4f59f19e091 = Ominaisuuskortit

seg-501d3a72ea43 = Eheys

seg-20db2c79b998 = Validoitu

seg-298cc35fe9d1 = Inertia

seg-b03984610dc0 = Kuu

seg-f1f903f1b9ff = Kestävyys

seg-bd64cfb4dc52 = Ratojen eteneminen ja satelliittitähdistön suunnittelu

seg-a7cfe6f135f1 = Rata ja geometria

seg-3060564c3e21 = 666/666 AIAA-vektoria · { "4.12" } mm

seg-5b265eaf8f29 = SGP4/SDP4-eteneminen todellisista kaksirivisistä elementeistä (sitoutettu Celestrak GPS -tilannekuva) tai synteettisistä Walker-satelliittitähdistöistä, joiden keskielementit toteuttavat i:T/P/F-kaavan alle { "1" } km:n tarkkuudella { "24" } h aikana. Moni-tähdistön näkyvyys, tarkkuuden heikkenemiskerroin ja GNSS-saatavuus, satelliittitähdistön suunnitteluoptimoija, streets-of-coverage-mitoitus sekä Walker-mallien pyyhkäisy, joka raportoi Pareto-optimaaliset mallit ratatasojen × satelliittien ruudukossa.

seg-66e33b899daf = Cowell-etenemislaskija ja kuuden häiriön voimamalli

seg-a5a572db3bed = Numeerinen etenemislaskija

seg-52a4410a54da = konservatiiviset tasot < { "0.08" } m / { "24" } h vs Orekit { "12.2" }

seg-463ed85c6e40 = Numeerinen (Cowell) etenemislaskija, joka täydentää analyyttistä SGP4/SDP4-polkua hierarkkisella voimamallilla: kahden kappaleen malli + täysi J2–J6-zonaalikenttä, valinnainen EGM2008-tesseraalinen geopotentiaali asteeseen/kertalukuun { "70" }, ajanhetken ohjaama Auringon ja Kuun kolmannen kappaleen painovoima (sisäänrakennettu efemeridi, ei DE/SPK-ydintä), aurinkosäteilypaine kartiomaisella umbra/penumbra-varjolla, ilmakehän vastus, postnewtonilainen Schwarzschildin relativistinen korjaus ja Lense–Thirring-kehysvetotermi — ohjattuna valinnalla RK4-askeleenkaksinkertaistus tai Dormand–Prince RK5({ "4" }) -adaptiivisilla integraattoreilla.

seg-797370a2faef = Polttot, Lambert ja porkchop

seg-57b120fb0aac = Ratamuutokset ja lentoradan suunnittelu

seg-5081c84dfdd7 = Tsiolkovsky < { "0.01" } % · Lambert palaa kahden kappaleen totuuteen

seg-da6b16ebd59b = Impulsiiviset ΔV-solmut { "6" }×{ "6" } kovarianssin etenemisellä, äärellisen polton integrointi tarkistettuna Tsiolkovskyn rakettiyhtälöä vasten alle { "0.01" } %:n tarkkuuteen, Izzo-2015 yhden kierroksen Lambert-ratkaisija ja tarkka universaalimuuttujainen Kepler-etenemislaskija sekä porkchop-pyyhkäisy (laukaisu × saapuminen) C3 / saapumis-V∞ JSON-käyräruudukkona — suorituskykysimulaatiokerros GMAT/Orekitin yläpuolella.

seg-831552a45712 = Aika-asteikot ja Maan orientaatiokoordinaatistot

seg-76b323512350 = Aikajärjestelmät

seg-60208bd726eb = bitti bitiltä vs SOFA/ERFA · Vallado päästä päähän { "4" } mm

seg-42373dd9ca64 = IERS:n karkaussekunnillinen UTC / TAI / TT / UT1 -asteikko, Julian-päivämäärä-API, IAU-2000:n Maan pyörimiskulma, GMST-pohjaiset TEME ↔ ECEF- ja WGS-84-geodeettiset koordinaatistot, täysi IAU 2000A/2000B -nutaatio ja IAU { "2006" } -prekessio sekä päiväntasausvapaa CIO-pohjainen IAU 2006/2000A GCRS↔ITRS-redukointi IERS-napaliikkeellä — validoitu bitti bitiltä SOFA/ERFA-vektoreita vasten ja tarkistettu riippumattomasti ANISEa (puhdas Rust-SPICE) vasten: GCRS→ITRS vs ANISE ITRF93, sama IERS EOP, täsmäävät ≤ { "0.86" } m maanpinnalla / ≤ { "3.6" } m GNSS-radalla.

seg-dd766880e73a = Reaaliaikainen Maan orientaation ennuste

seg-54169bca19e9 = { "12" } ennustehorisonttia arkistoitua Bulletin A:ta vasten: UT1 { "2.93" } ms, napaliike { "1.76" } mas

seg-81be07e41d1c = Operatiivisen tyylin Maan orientaation ennustin — pienimmän neliösumman sovitus vakiotermin, muutosnopeuden ja pääasiallisten jaksollisten termien yli liukuvassa ikkunassa — mitattuna aidosti arkistoituja Bulletin A -ennusteita vasten eikä pysyvyyttä vasten. Offline-oletussyöte on todellinen IERS finals2000A -tuote, joka sisältää Bulletin A -ennusterivit, joten paljas ajo tuottaa täytetyn horisonttikohtaisen taulukon tyhjän sijaan. UT1 ja napaliike raportoidaan yhteisellä rivijoukolla yhdessä yhdistelmänsä kanssa, joten yhteisluku on yksi tilasto eikä kahden eri otoksen neliösumma.

seg-0e18bc4add10 = Strapdown-INS ja karttatuettu navigointi

seg-26561c9a96a7 = ensimmäisistä periaatteista johdettu CAI-kiihtyvyysanturi · johdettu VRW tarkistettu riippumatonta integraattoria vasten

seg-d18714ee32fb = Kolmiakselinen strapdown-INS — kvaternioniasento, WGS-84 NED -mekanisaatio, coning/sculling-kompensointi ja täysi deterministinen IMU-virhemalli — sekä ensimmäisistä periaatteista johdettu kylmäatomi-interferometrikiihtyvyysanturi (Mach–Zehnder-vaihe, projektiokohina, kontrastin vaimeneminen, tärinäkytkentä) ja hiukkassuodatin maastoon tai painovoimaan viittaavalle GPS-vapaalle navigoinnille.

seg-0e44bdf12d16 = Inertiaalinen ja maastoon suhteutettu vapaa-aika katkon läpi

seg-07cb40aa5cd1 = { "10" } m ajassa { "249" } s, { "50" } m ajassa { "595" } s, kiihtyvyysanturin harha hallitseva molemmissa

seg-d5df17e4425b = Paikkavirhe suhteessa vapaa-ajan kestoon IMU-virhebudjetista — harha, satunnaiskävely ja asteikkokerroin, kullakin oma kasvulakinsa ja oma osuutensa ylityksestä — joten navigointikatkon hinta on laskettu käyrä eikä pyyhkäisty ajautumisnopeus. Kynnysylitykset ovat moottorin tulostetta, ja hallitseva osuus nimetään kunkin kohdalla, neljälle IMU-luokalle, ja maastopaikkaratkaisun väli pisteytetään omassa lohkossaan, jotta pääluvut säilyvät tukemattomina.

seg-6631a5d69c84 = Painovoima-, maasto- ja magneettikarttasovitus

seg-6af8e99df46d = Vaihtoehtoinen PNT (GPS-vapaa)

seg-72527f4459c7 = 60 min GPS-vapaa · ~{ "145" } m (< { "500" } m)

seg-89bd5fb3e90b = Kylmäatomigravimetrin mittausmalli, jonka valkoisen kohinan lattia johdetaan CAI-kiihtyvyysanturin fysiikasta, matala-asteinen täysin normalisoitu pallofunktiopainovoima-anomaliakenttä plus synteettiset mascon-massat ja painovoimakarttasovituksen hiukkassuodatin — laajennettuna maastoon viittaavaan navigointiin SRTM-korkeusmallia (TERCOM/SITAN) vasten, IGRF-14-geomagneettiseen pääkenttään asteeseen/kertalukuun { "13" } sekä yhdistettyyn painovoima + magneettikenttä + maasto -navigaattoriin, joka yhdistää kaikki kolme skalaarikanavaa. 60 minuutin GPS-vapaa benchmark — noin { "700" } km / yhden tunnin katko, jossa inertiaratkaisu ajautuu noin { "70" } km — palautetaan noin { "145" } m:iin hierarkkisella karkeasta hienoon -sovittimella: ESA NAVISP Quantum Wayfarer -tavoite.

seg-dbd63be796ff = GNSS / INS -sensorifuusio

seg-f9582184adea = Fuusio

seg-f2166e96405f = tiukasti kytketty UKF · { "0.77" } m RMS

seg-d6ad19d1d47b = 15-tilainen virhetila-EKF, joka liitää GNSS-katkojen läpi kalibroidulla inertiaratkaisulla; tiukasti kytketty pseudoetäisyystila, joka jatkaa korjaamista alle neljällä satelliitilla; kytketty kello + paikka -suodatin; yleinen unscented (sigma-piste) Kalman-estimaattori; tiukasti kytketty GNSS/INS UKF -navigaattori, validoitu { "0.77" } m RMS:ään { "120" } s katkon läpi kaarevalla LEO-ohituksella; sekä täysi 17-tilainen tiukasti kytketty GNSS/INS UKF, jonka kvantti-CAI-koplaus liitää katkon kylmäatomikiihtyvyysanturin johdetun nopeuden satunnaiskävelyn varassa.

seg-4af862bd1307 = Eräajo- ja sekventiaalinen OD

seg-ca67c864635c = Radanmääritys

seg-948441304a32 = eräajo- + sekventiaalinen OD vs Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

seg-22e738b2ab57 = Ratatilan palautus maa-aseman etäisyysseurannasta, yhdistäen kahden kappaleen + J2-voimamallin ja RK4-integraattorin Gauss–Newton-eräkorjaimeen (alle metri / mm·s⁻¹ kohinattomista etäisyyksistä, ~{ "2" } m { "5" } m:n kohinalattialla) ja sekventiaaliseen unscented-suodatinvarianttiin.

seg-06406b3d0b88 = Fisherin informaatio ja havaittavuus

seg-4e28248ef77b = Havaittavuus ja estimointiteoria

seg-a5b38d0a8d64 = ominaisarvot vs numpy.linalg.eigh · CRLB vs σ²(XᵀX)⁻¹ numpy.linalg.inv:n kautta · GNSS DOP informaatiomatriisista, kaikki tarkkuudella { "1e-9" } · Kayn ({ "1993" }) suljetut muodot + Monte Carlo -CRLB:n saavutus

seg-3ee5597d6f8a = Yleinen, uudelleenkäytettävä Fisherin informaation / Cramér–Raon kerros (src/fim.rs): informaatiomatriisi M = HᵀWH, Cramér–Raon alaraja, havaittavuuden aste ja datumivajeen nollatila (Moore–Penrose-pseudoinverssi) sekä D/A/E/T-optimaaliset koesuunnittelun skalaarit symmetrisestä Jacobi-ominaisarvoratkaisijasta. Se on DOP-moottorin, passiivisen geopaikannusrajan ja Kuun absoluuttisen asemahavaittavuuden tuloksen perusta — sisäinen etäisyydenmittaus jättää kuuden vapausasteen jäykän kappaleen datumivajeen, jonka Maan peruslinjan VLBI-sidonta palauttaa harvalle satelliittitähdistölle ja terävöittää runsaalle, ja absoluuttinen datumi sulkeutuu kolmella ei-samalla suoralla olevalla Maan asemalla.

seg-ed467622dbd0 = CR3BP-eteneminen ja LunaNet-eheys

seg-e386dced1d16 = Kuu ja Maa–Kuu-avaruus

seg-f444bc39efbe = Toistaa julkaistun L2 { "9" }:{ "2" } NRHO:n (~{ "6.57" } d kiertoaika · ~{ "3,250" } km perilune); STM tarkistettu äärellisillä differensseillä

seg-272afbca5e48 = Maan ja Kuun pyöreä rajoitettu kolmen kappaleen (CR3BP) etenemislaskija pyörivässä koordinaatistossa — säilyvä Jacobin vakio ja kaikki viisi Lagrangen pistettä — { "6" }×{ "6" } tilansiirtomatriisilla ja yhden ammunnan differentiaalikorjaimella, joka tuottaa aidosti jaksollisia halo- / lähes suoraviivaisia halo-ratoja (NRHO): se toistaa julkaistun L2-eteläisen { "9" }:{ "2" } NRHO:n (Gateway-rata) noin { "6.57" } päivän kiertoajalla ja noin { "3,250" } km:n perilunella. Lisäksi LunaNet / LNIS Maa–Kuu-avaruuden PNT-geometria (MCI↔MCMF-redukointi, selenografiset koordinaatit) Kuun etelänavan ARAIM-ohituksella, joka tuo rehellisesti esiin eheysvajeen: noin { "30" } m:n σ_URE ajaa suojaustason selvästi hälytysrajan { "50" } m yläpuolelle.

seg-619f89bf160c = Kuun koordinaatiston toteutus

seg-c6b12768a219 = vs numpy/scipy Umeyama–Horn SVD

seg-29327b86ea27 = Toteuttaa Kuun kappalekiinteän koordinaatiston havaintokampanjasta: painotettu Gauss–Newton-yhdenmuotoisuussovitus asema–heijastin-geometrian yli, raportoiden datumin, sen kovarianssin ja huonoimmin määräytyvän akselin. Kytketty koordinaatiston ja aika-asteikon gauge kuljetetaan mukana nimenomaisesti eikä sitä absorboida, joten asteen puute näkyy raportissa eikä ole haudattu pseudoinverssiin.

seg-b3ba1e7b197d = Kuun navigoinnin palvelualue ja ARAIM

seg-353878596468 = ANISE { "0.10.2" } -radat · RTKLIB 2.4.2-p13

seg-70b9c02c1f6a = Pyyhkäisee havainnollistavan Moonlight/LCNS-luokan satelliittitähdistön selenografisen ruudukon yli: näkyvyys, tarkkuuden heikkenemiskerroin, kattavuus ja ajanhetkikohtaiset ARAIM-suojaustasot säädettävää hälytysrajaa vasten. Avaruussignaalin etäisyydenmittaustarkkuus on parametri, joten pyyhkäisy vastaa etäisyydenmittausvaatimukseen koko alueella eikä anna läpäisy/hylkäys-tulosta yhdellä kiinteällä arvolla.

seg-a94db5b03c9c = Palveluntarjoajien välinen Kuun yhteentoimivuusbudjetti

seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 calcephin kautta

seg-646a00230694 = Mittaa, kuinka paljon kolme riippumatonta arvovaltaista Kuun efemeridiä todella poikkeavat toisistaan, ja muuttaa sen suunnittelulaiksi: koordinaatisto–efemeridi-virhebudjetti, jonka sekapalveluntarjoajan käyttäjä perii, ja yhdenmukaisuustoleranssi, jonka palveluntarjoajan on pidettävä, jotta budjetti pysyy ilmoitetun rajan sisällä.

seg-0f359c118090 = Autonominen vapaan verkon vikojen havaittavuus

seg-ae99396c03bd = vs riippumaton numpy/scipy-pariteettialgebra

seg-51828c93731b = Lineaarialgebra, jota itseensä viittaava Kuun satelliittitähdistö tarvitsee havaitakseen omat vikansa ilman maatotuutta: painotettu pariteettiprojektori asteeltaan vajaan pseudoinverssin muodossa, joka selviää datumin ja aika-asteikon gaugesta, solmukohtainen havaittavuus, Baardan pienin havaittava harha sekä Byzantine-lohkokipinän havaitsemis-/tunnistuslukumäärät todellisen DE440-solmujenvälisen geometrian yli.

seg-65d239fc4894 = Kuun koordinaatiston datum oikeasta laseretäisyysmittauksesta

seg-c92dd319fa36 = { "337" } ILRS-normaalipistettä · mediaani { "5.13" } mm

seg-2f7f950518be = Korvaa simuloidun kampanjan oikealla datalla: { "337" } arkistoitua ILRS:n kuun laseretäisyysmittauksen normaalipistettä viideltä retroreflektoriryhmältä, ja jokainen havainto painotetaan tiedostoon tallennetulla omalla toistotarkkuudellaan. Reflektorien koordinaatit ovat pääakselien DE440-luettelo, joka on pidetty omassa tiedostossaan erillään keskimääräisen maapallon DE430-taulukosta: toisen syöttäminen toisen kierrolle siirtää reflektoria satoja metrejä, eikä mikään huomauta siitä, koska molemmat ovat kelvollisia koordinaatteja.

seg-2db69c58f694 = Kuun differentiaalinen PNT

seg-32adcb9b1b02 = Täsmällinen yhteismuotoidentiteetti · mallinnettu dekorrelaatio

seg-d4ac8cbac83e = Differentiaalikorjaukset kuun vertailuaseman ja käyttäjän välillä. Yhteismuodon kumoutuminen on täsmällinen identiteetti; avaruudellisen dekorrelaation jäännös on ensimmäisen kertaluvun geometrinen malli, joka kasvaa perusviivan mukana, ja korjausyhteyden jäännösbudjetti raportoidaan sen rinnalla, jotta rajoittava tekijä pysyy näkyvissä eikä sulaudu yhteen lukuun.

seg-9b83e78dcd7b = Kuun aika-asteikot ja geodeettinen VLBI

seg-bcd769beab07 = Kelloluokkakohtainen ylityskohtien taulukko

seg-80107b7841bf = Kelloluokkakohtaiset ylitysajat kuun aika-asteikolle eli hetki, jolloin kunkin oskillaattoriluokan ajoitus ei enää pysy ilmoitetussa rajassa ilman päivitystä, sekä kuun geodeettinen VLBI-havaittava suure ja Fisherin informaatio, jonka se tuo datumiin.

seg-99084680c321 = Oikea, noudettu kuun satelliittitähdistön geometria

seg-a7be7d68e767 = { "5" } tallennettua testiaineistoa, jotka kukin voidaan luoda uudelleen tallennetusta lähteestään

seg-d3591b4b4633 = Palvelualue lasketaan julkaistuilla satelliittitähdistön suunnitelmilla havainnollistavan sijaan: viiden satelliitin LANS-yhteentoimivuuden demonstraation vertailujoukko, LNCSS-tapaustutkimukset { "8" }, { "12" } ja { "16" } satelliitilla sekä neljä satelliittia, jotka olivat todella kuun kiertoradalla 2023-01-01 JPL Horizonsin mukaan. Jokainen tiedosto ilmoittaa oman koordinaatistonsa ja oman alkuperäluokkansa, taulukoidun efemeridin lopun yli menevä aikajänne hylätään eikä sitä ekstrapoloida, ja havainnollistava Keplerin tulos annetaan noudetun rinnalla niiden välisen eron kanssa eikä koskaan sen korvaajana.

seg-807b9fc7b517 = Kuun kieltokontuuri mitatusta C/N₀-hajonnasta

seg-a908030a9fcc = Etäisyys { "49.2" } km tehosuhteen mukaan, { "19.4" } km kytkennän menetyksen mukaan

seg-3ee440e8b619 = Satelliittikohtainen häirintäsignaalin ja signaalin suhde todellisilla kuun vinoetäisyyksillä, ja haluttu signaali pidetään jakaumana eikä romahduteta mediaaniksi, jolloin kieltokontuuri kantaa epävarmuusvyöhykkeen, jonka välitysgeometria todella tuottaa. Kaksi kriteeriä raportoidaan rinnakkain: tehosuhteen kynnys ja seurantasilmukan dynamiikasta laskettu kytkennän menetys. Kiertoradan kaappausjalanjälki pyyhkäistään lähettimen korkeuden ja keilanleveyden yli, ja jos ruudukko ei koskaan yllä horisonttireunan kaappaukseen, raportti sanoo sen ja tulostaa vajeen.

seg-229134190045 = VLBI-aikataulusta asemakoordinaattien kovarianssiin

seg-547181855481 = Aste { "6" }, vaje { "0" }; vapaan verkon vaje { "1" } nimetty yhteiseksi translaatioksi

seg-6d147beefb43 = Kerää kuun VLBI:n viiveosittaisderivaatat Fisherin informaatiomatriisiksi kantaviivat-kertaa-hetket-aikataulun yli ja palauttaa asemakoordinaattien kovarianssin, joten askel viiveen toistotarkkuudesta koordinaatin sigmaan estimoidaan eikä oleteta. Vapaa verkko raportoidaan datumiin sidotun rinnalla, ja sen asteen vaje ja havaitsematon suunta nimetään. Pintapisteen kovarianssi pidetään erillään Maa-aseman kovarianssista, koska lähikentän majakan osittaisderivaatta on kahden asemayksikkövektorin erotus eikä käyttäydy kuin kaukokentän tapaus.

seg-028833cc45bc = Radiometrinen navigointi ja välitys-PNT

seg-6c94ae122721 = Kaukoavaruuden ja Marsin PNT

seg-ef21cd4b1962 = Simuloinnilla validoitu (kovarianssin ja suljetun silmukan laatumittarit, ei sertifioituja suojaustasoja); Aurinko-keskeinen Marsin dynamiikka on tarkistettu ristiin JPL DE440:n kanssa tasolle { "137" } m @ 1 päivän kaari; Mars-LMO OD ≈ { "0.2" } m.

seg-469988966702 = Avoin kaukoavaruuden ja Marsin radiometrinen navigointimoottori: iteratiivinen valoaika ja Shapiro-viive, kaksi-, yksi- ja kolmisuuntainen Doppler ja etäisyys (Moyerin kaksiosainen malli), koherentti transponderin kääntö, regeneratiivinen ja PN-etäisyysmittaus sekä Δ-DOR; CCSDS-TDM-syöttö ja -tuloste; vähennetyn dynamiikan neliöjuuri-informaatiosuodatin (empiiriset kiihtyvyydet + aluksen kello + Marsin ilmanvastus), joka tekee Marsin LMO-radanmäärityksen synteettisessä suljetussa silmukassa; yksisuuntaisen ja kaksisuuntaisen datan yhdistäminen; sekä MARCONI-areostationaarinen välityssatelliittitähdistö päästä päähän -GSE-suorituskykysimulaattorilla.

seg-b4284bd2629e = Optinen ja RF-siirto ristiinmodaalisella eheydellä

seg-ae131bc1ba67 = Optinen / RF PNT

seg-1b25468c9780 = Pienin havaittava harha { "8.20" } m vaakasuunnassa, { "12.30" } m pystysuunnassa, { "24.6" } ns ajoituksessa

seg-a5387333ab2d = Vikainjektio antaa ristiinmodaaliselle monitorille havaitsemistehon vikatiloittoman läpäisyn sijaan: pienin havaittava harha akselia kohti ilmoitetulla väärän hälytyksen ja havaitsematta jääneen tapahtuman budjetilla. Siirron jälkeen kovarianssin uudelleenkasvu propagoidaan hälytysrajoja vasten, joten raportti kertoo, kuinka kauan yhden modaliteetin ratkaisu pysyy niiden sisällä, eikä vain sitä, että siirto oli jatkuva. Optisen ja RF-etäisyysmittauksen osuuksia verrataan vain vastaavalla kertymäajalla ja reitillä, ja raportti kieltäytyy muodostamasta suhdetta arvoon, joka valittiin eikä mitattu.

seg-00cb9df27979 = Vastaanottimen autonominen eheys (ARAIM)

seg-f86ecc2fda8e = MHSS oikealla GPS + Galileo -tilannekuvalla · DO-316 kaksoistähdistö

seg-841a6f3f0277 = Tilannekuva- ja ratkaisuerotus-RAIM vaaka- ja pystysuuntaisilla suojaustasoilla (HPL/VPL), vian havaitseminen ja poissulkeminen sekä Stanford-eheyskaaviot, lisäksi nimenomainen eheysriskibudjettiin (MHSS) perustuva suojaustaso kaksois- ja monitähdistön koko tähdistön vikatilalla (EU ARAIM / DO-316).

seg-695aa5c57d83 = ARAIM julkaistuja vertailuvektoreita vasten

seg-08f9dd480ba7 = Suurin virhe { "0.044" } m lähteiden oman { "0.05" } m toleranssin rinnalla

seg-68185dd65478 = Moottorin MHSS-suojaustasot ajetaan EU:n ja Yhdysvaltain työryhmä C:n vertailuilma-algoritmin omia julkaistuja työstettyjä esimerkkejä vastaan, jotka on kukin kirjattu noutoverkko-osoitteen, päivämäärän, sivun ja tiedoston SHA-256:n kanssa ja säilytetty kahdessa paikassa, joiden yhtäpitävyyden testi varmistaa. Hyväksymisvektori on sisäisesti johdonmukainen Reference Airborne Algorithm Description Document v3.1, liite D. Milestone { "3" } -raportti sisältää kaksi sisäistä virhettä: etumerkkivirheen geometriassa ja väärän hälytyksen kertoimen, joka on laskettu { "57" } vikatilalla vaikka teksti ilmoittaa yhden. Siksi sen suojaustasot raportoidaan mitattuina poikkeamina eikä arvioida, ja virheet osoitetaan ajamalla asiakirjan omat luvut.

seg-17b28b3cf1fa = SBAS / WAAS -suojaustasot ja kaksoistaajuus

seg-99766b79a00a = Täydennys (SBAS)

seg-4cfec990b19b = DO-229E K-kertoimet · L1/L5 ionosfääristä vapaa

seg-ef3a5513bbd8 = SBAS / WAAS -suojaustasot DO-229E:n painotetun pienimmän neliösumman muodossa (tarkkuuslähestymisen ja lentoreitin K-kertoimet) sekä L1/L5-kaksoistaajuuden ionosfääristä vapaa yhdistelmä (IS-GPS-705), joka on DO-316:n perusta; suojaustason geometria on tarkistettu ristiin lineaarialgebran vertailutoteutuksella.

seg-0a5bd5230c32 = Holdover, vakaus ja ajan- ja taajuudensiirto

seg-69a0269c4732 = Kello ja ajoitus

seg-641ae762b453 = kalibroitu kellojen datalehtiin · holdover tarkistettu ristiin van Loanin kovarianssirekursiota vasten

seg-6f1c2e1f0bf4 = Kaksitilainen Kalman-holdover, Allan-perheen vakaus (ADEV / MDEV / TDEV / HDEV) luottamusväleineen ja täysi IEEE-1139:n viiden kertoimen potenssilakisovitus sekä operatiiviset siirtomenetelmät: TWSTFT BIPM:n Sagnac-suljetulla muodolla, GNSS-yhteisnäkymä, PPP:n ionosfääristä vapaa siirto, vapaan tilan optinen yhteys turbulenssin skintillaatiolla ja käänteisvarianssipainotettu kelloyhtyeen aika-asteikko. GNSS:n estetyn tilan kellon holdover-laskuri kääntää van Loanin vapaan kulun virhekasvun holdoveriksi kynnykseen asti eli siihen, kuinka kauan kello käy vapaasti ennen kuin sen aikavirhe ylittää budjetin, klassisissa ja kvanttikelloluokissa; mallinnettu, ja rehellisesti todetaan, että erittäin vakaalla kellolla holdover tiukkaan kynnykseen määräytyy oletetusta pitkän tau:n kohinalattiasta eikä siteeratusta ADEV:stä.

seg-85b181275293 = Pseudoetäisyys, ionosfääri ja troposfääri

seg-835df2d05f2a = GNSS-mittausalue

seg-ef01abb1cfe8 = Saastamoinen ZHD ≈ { "2.3" } m · Niell yksi zeniitissä · Klobuchar IS-GPS-200:n mukaan

seg-43c0372fe6e7 = Eteenpäin laskettu pseudoetäisyyden ja Dopplerin synteesi Klobucharin (lähetetty) ja IONEX / TEC-ruudukon (mitattu) ionosfäärillä, mukaan lukien IONEX-tiedostojäsennin, ajallinen interpolointi ja ohutkuoren vinouskartoitus, sekä Saastamoinen- ja Niell-troposfääri ja tilannekuva-RAIM.

seg-3458cb02f156 = Yksipistepaikannus (PVT)

seg-640e4cd9f008 = GNSS-paikannus

seg-4fa43feda96a = Validoitu oikealla IGS-datalla (asema ABMF, 2018-05-13) tasolle { "5.7" } m 3D RMS / { "1.1" } m vaakasuunnassa mitattua koordinaattia vasten.

seg-b107ba0607b0 = Oikea vastaanottimen sijainti ratkaistu oikeista RINEX-koodipseudoetäisyyksistä ja lähetetystä efemeridistä iteroidulla painotetulla pienimmän neliösumman menetelmällä: Sagnacin ja Maan pyörimisen korjaus, lähetetty kello TGD:llä, kaksoistaajuuden L1/L2 ionosfääristä vapaa yhdistelmä (tai yksitaajuinen Klobuchar), Saastamoinen/Niell-troposfääri, korkeuskulmapainotus, DOP ja tilannekuva-RAIM.

seg-5819c351d123 = Häirintä ja monikerroksinen harhautuksen havaitseminen

seg-9a03f3db9ef0 = χ²₁ NP-ilmaisin · suljetun muodon ja Monte Carlon P_fa/P_md täsmäävät

seg-788fdc9a22a1 = Linkkibudjettiin perustuva häirintämalli (J/S → tehollinen C/N₀ → kytkennän menetys), stokastinen aikaharhautuksen ilmaisin (Neyman–Pearson / χ²₁-energiatesti Monte Carlo -P_fa/P_md:llä ja turvallisuuden laatumittarilla { "1" } − P_md) sekä monikerroksinen harhautuksen ilmaisin, joka yhdistää RAIM-johdonmukaisuuden pariteettitestin, RF:n AGC-tehomonitorin ja signaalinlaatumonitorin (SQM). Lisäksi kvantti-inertiaalinen laskennallisen paikannuksen virhebudjetti, joka yhdistää kylmäatomi-interferometrin valkoisen kohinan ajautuman jäännösharhaan (tarkistettu ristiin riippumattomalla integraattorilla) ja asteikkokerroinvirheen paikan ajautumaluvuksi holdoverin aikana: kellon holdoverin inertiaalinen vastine.

seg-87bca15c6939 = Modulaatio, häirinnänsieto ja koodiseuranta

seg-c7d3ff7ea829 = Navigointisignaalin suorituskyky

seg-1aec700caefe = BPSK itse-SSC = 2/(3R_c) · metrin alittava C/A DLL -jitter tasolla { "45" } dB-Hz · GPS C/A Gold -ristikorrelaatio -23.9 dB

seg-304803ee178d = Signaalin suorituskykykerros linkkibudjetin ja mittausalueen välillä: yksikköalaiset tehospektritiheydet BPSK-R(n):lle ja sini-BOC(m,n):lle, spektrinen erotuskerroin, joka johtaa häirinnänsiedon Q:n, jonka häirintämalli käyttää, suoraan todellisista signaali- ja häirintäspektreistä, RMS (Gabor) -kaistanleveys, joka määrää etäisyysmittauksen informaatiosisällön (BOC > BPSK), koherentin aikaisen–myöhäisen DLL-koodiseurannan terminen kohinajitter ja koherentti aikaisen-miinus-myöhäisen monitievirheen verhokäyrä kapean korrelaattorin vaimennuksella, sekä etäisyyskoodin suunnittelukompromissi (m-sekvenssin/Goldin autokorrelaation sivukeila ja kolmiarvoinen Goldin ristikorrelaation raja sekä koodipituuden ja yksiselitteisen etäisyyden käänteisfunktio). Tämä on signaalin suorituskykyanalyysia, ei RF-hyötykuorman tai antennilaitteiston suunnittelua.

seg-684494a7877c = Passiivinen RF-paikannus (TDOA/FDOA)

seg-414872cdf952 = Passiivinen RF-paikannus

seg-bed5944d15dd = kohinaton TDOA eteenpäin→käänteinen tasolle { "1e-6" } m · J·CRLB = I · GDOP monotoninen vastaanottimien suhteen · estimaattori saavuttaa CRLB:n { "4000" } Monte Carlo -toistossa

seg-be8f2a419275 = Paikanna häirintälähetin tai harhauttaja (tai opportunistinen lähde käänteistä PNT:tä varten) vastaanotinverkon saapumisaikaerojen hyperboloideista, ratkaistuna Gauss–Newtonin pienimmän neliösumman menetelmällä; taajuuserojen (FDOA) lisääminen liikkuvilla vastaanottimilla palauttaa yhdessä lähettimen sijainnin ja nopeuden, ja sijainnin kovarianssin Cramér–Raon raja saadaan verkon geometriasta. Pistelähteen näköyhteysmalli: ei monitie-, NLOS-, vastaanottimen kellovinouma- tai taittumatermejä.

seg-48e98ff7065e = RINEX-, SP3- ja CCSDS-muodot

seg-7c6f4dc6bcba = Yhteentoimivuus

seg-ae8dc649ab26 = lähetetty efemeridi + SP3-interpolointi RTKLIB:tä vastaan; OEM riippumatonta CCSDS-jäsennintä vastaan

seg-75aae4d201fd = Usean GNSS:n RINEX-3-lähetetyn efemeridin sisäänluku (GPS, Galileo, QZSS, BeiDou, GLONASS), RINEX-3-havaintojäsennin (RINEX { "4.00" } -havaintoasettelun odotetaan jäsentyvän, mutta yhtään { "4.00" } -tiedostoa ei ole luettu sen läpi; RINEX { "4" } -navigointitiedostot hylätään nimeltä), SP3-c/d-tarkkaefemeridin lukija/kirjoittaja Lagrange-interpolaatiolla sekä CCSDS OEM { "2.0" } + OMM (keskielementit) -vienti lentodynamiikan työkaluille (GMAT, Orekit, STK) ja CCSDS-TDM ({ "503" }) -seurantadataviestin jäsennys ja tuotto kaukoavaruuden radiometriseen seurantaan.

seg-1f379e235f5f = Koneellisesti tarkistettu varmennusmatriisi

seg-a4d10bb41065 = Varmennus ja varmistus

seg-72ec664ea7ae = validoidut rivit vaativat ulkoisen oraakkelin (invariantti valvotaan CI:ssä)

seg-cab165105f32 = Vaatimus–moduuli–testi–oraakkeli–tila-ristiviittaus, joka tuotetaan moottorista itsestään (Markdown/CSV) ja jossa on yksikkötestatut rehellisyysinvariantit: rivi saa saada validoitu-merkinnän vain, jos sillä on riippumaton ulkoinen oraakkeli (NIST / AIAA / SOFA / IGS / julkaistu arvo), joten sisäinen itsejohdonmukaisuustarkistus ei voi esiintyä validointina; laitteisto- ja PA-ominaisuudet, joita Kshana ei tarjoa, kirjataan kumppanin omistamiksi aukoiksi. Suoritettava runko ECSS-E-ST-10-02-varmennusristiviittaukselle.

seg-190cdf3ca8dc = Yksikkö ja alkuperä jokaisella raportoidulla suureella

seg-1c7bb8c3e887 = { "87" } / { "87" } lajia, { "3127" } / { "3127" } numeerista kenttää

seg-3e7fb040a7c4 = Jokaisella skenaarion tuottamalla numeerisella kentällä on yksikkö ja suljetusta sanastosta otettu alkuperäluokka sekä määritelmä, jos sellainen on, ja ne julkaistaan koneluettavana skeemana moottorin rinnalla. Kiristyvä portti ajaa jokaisen sisäänrakennetun lajin ja hylkää kentän, jolla ei ole yhtään; lajit, jotka eivät vielä ole täydellisiä, nimetään yksitellen sen syyn kanssa, miksi kukin on yhä avoin, ja lista voi vain lyhentyä. Raportit, jotka ilmoittavat omat vakionsa (yksisuuntainen linkkibudjetti, optinen ja RF-budjetti), antavat lukijan laskea pääluvun uudelleen pelkästä raportista.

seg-0e1a01c9158a = Laukaisun, paluun, kattavuuden ja suuntauksen budjetit

seg-f5cf9e86d3c9 = Tehtäväanalyysi

seg-767b2cd5f4ba = tarkistettu suljettua muotoa vasten (laukaisuazimuutti · Allen-Eggers · SMAD)

seg-23bac81d700b = Ensimmäisen kertaluvun tehtäväsuunnittelun budjetit, kukin ajettava skenaario: kaksikappaleinen laukaisu- ja nousugeometria (laukaisuazimuutti, vähimmäiskaltevuus, Maan pyörimisen etu, dogleg-tasonvaihdon Δv, päivittäiset mahdollisuudet), Allen–Eggersin ballistinen paluukäytävä (huippuhidastuvuus, huippu-g:n ja huippulämmityksen nopeudet), Maan havainnoinnin kattavuusgeometria (kaistanleveys / nadirin GSD / nadirista poikkeava pääsy / uudelleenkäynti SMAD-avaruuskolmion kautta), 3-DOF-asennon ja suuntauksen virhebudjetti (gravitaatiogradienttimomentti + RSS-suuntausbudjetti), maa-aseman ylilentoennuste (AOS/TCA/LOS, enimmäiskorkeuskulma, pääsy) sekä yksisuuntainen linkkibudjetti CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä (FSPL, C/N₀, Eb/N₀, marginaali, sulkeutuminen). Laitteistoa edeltävä analyyttinen kerros STK:n/GMAT:n/Basilisk:n alapuolella: mallinnetut ensimmäisen kertaluvun budjetit, ei 6-DoF- tai radiometrisen laskennan korvike.

seg-43f53b910042 = Navigoinnin ja viestinnän apertuurin jakaminen

seg-989637b0c6fc = Istuntokohtainen katkos ja kilpailu, ei yhtä käyttöastelukua

seg-5c63a4559aff = Sisään kontaktisuunnitelma ja apertuurien lukumäärä; ulos navigoinnin käyttöaste, viestinnän käyttöaste, istuntokohtainen katkos ja kilpailu. Välitysperiaate nimetään raportissa eikä jätetä oletetuksi, ja istunto, jota ei voida palvella täysin, raportoi menetetyn osuutensa eikä katoa keskiarvoon.

seg-c8eb43aeb31a = Avaruussää ja termosfäärin tiheys

seg-37b8c9397544 = Avaruusympäristö

seg-25e24a6c0ba3 = Jacchia-71 validoitu julkaistuja auringon minimi- / keski- / maksimiarvoja vasten

seg-1eff250f41c3 = Avaruussääympäristön malli: auringon (F10.7 / keskitetty 81 päivän F10.7a) ja geomagneettisen (Kp, määritelmällinen Kp↔ap-taulukko) aktiivisuuden indeksit, niiden ohjaama Jacchia-1971:n eksosfäärinen lämpötila sekä aktiivisuuskorjattu ja staattinen termosfäärin neutraalitiheys korkeudella: auringon syklin tiheysriippuvuus, jonka staattinen ilmakehä jättää pois. Kalibroitu ensimmäisen kertaluvun skaalakorkeuskytkentä, ei datalla validoitu NRLMSISE-ilmakehä.

seg-49bac998eb07 = RF-häiriön havaitsemisen arviointi ja PNT-vertailu

seg-dca720256d85 = Koneoppimisen arviointi ja vertailu

seg-5f0a39efe160 = AUC-testikehys varmennettu binormaalia suljettua muotoa Φ(d′/√{ "2" }) vasten (Gneiting & Vogel { "2018" }); arviointimittarit validoitu bitti bitiltä scikit-learn { "1.9.0" } -kirjastoa vasten: synteettinen korpus, ei raaka-IQ/TEXBAT

seg-0dc3a7135442 = RF-häiriön havaitsemisen arviointialusta: nimetty, parametreihin perustuva synteettinen korpus (nimellinen / häirintä / aikaharhautus / paikkaharhautus / monitie), ilmaisimesta riippumaton ROC/AUC-testikehys, joka pisteyttää minkä tahansa ilmaisimen luokkakohtaisella Pd:llä tavoite-Pfa:lla, sekä jakauman sisäisen ja ulkopuolisen optimismiaukko. Syvempi optimismiaukkotutkimus laajentaa tämän 13 ilmaisimen paneeliin (energia / AGC / SQM / pariteetti sekä siemenluvulla alustetut logistisen regression ja yhden piilokerroksen MLP-ilmaisimet), jakauman sisäisiin ja ulkopuolisiin skaalauslakeihin permutaationollalla ja jakauman ulkopuolisen heikkenemisen leave-one-out-ennustimeen; ohjelmistomääritelty vastaanottimen etupää (raaka IQ/IF korrelaattorin aikaisiin/pääasiallisiin/myöhäisiin haaroihin ja SQM:ään) ja oikean datan sisäänluku-adapterit (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) antavat samojen ilmaisimien toimia paikallisesti toimitetuilla tallenteilla. Lisäksi kvantti vastaan klassinen PNT-vertailu, joka kvantifioi ehdokaskellon ajoituksen ja inertiaalisen holdover-hyödyn mitatusta ADEV-käyrästä klassista lähtötasoa vasten, GNSS:n estetyn tilan kestävyys–aika-verhokäyrällä. Mallinnetut toimintaominaisuudet: ei koskaan kenttä- tai IQ-dataa, ei hyvä/huono-tuomiota.

seg-8766e058334d = Kvantti vastaan klassinen: kestävyyden ylityskohtakartta

seg-8f851e9cf8c2 = luo uudelleen inertiaaliset ja kellon ylityskohtatutkimukset Results-kuvaajien taustalla; vertailuytimet validoitu scipy { "1.17.1" } -kirjastoa vasten

seg-a057ad4c89ce = Toistettava kartta siitä, missä kvanttisensori ohittaa klassisen vastineensa parametriepävarmuuden alaisena: kylmäatomi vastaan navigointiluokan laskennallinen paikannus sekä optinen vastaan sirumittakaavan kellon holdover, katkoksen keston ja alustan tärinän yli, ja jokaisella käyrällä on teknologian valmiustason merkintä. Toistettavissa komennolla cargo run --bin crossover_study. Mallinnetut suorituskykybudjetit: syötteet ovat julkaistuja tai rajattuja kertoimia, eivät lentodataa.

seg-6347618838dd = Ehdollinen ajoituksen suojaustaso

seg-a846e806e577 = Ajoituksen eheys

seg-762bc9f28716 = koostumus tarkistettu ristiin moniaskelisella clock_state-kovarianssirekursiolla; kalibroitu JammerTest { "2024" } -aineistolla (Zenodo { "15911589" })

seg-3622798325cd = Holdoverin rajoittama yläraja havaitsemattomalle aikavirheelle GNSS-harhautuksen aikana: kun käytössä on riippumaton ristiintarkistus, tarjotun ajan virhettä rajoittavat k-sigman monitorin lattia, van Loanin vapaan kulun varianssi havaitsemisviiveen yli ja CUSUM-aika hälytykseen. Kalibroitu oikealla tallennetulla harhautuksella (JammerTest { "2024" }) ja toistettavissa komennolla cargo run --example tpl_jammertest. Mallinnettu koostumus, ehdollinen havaitsemiselle: äärellistä ehdotonta rajaa ei ole, koska riittävän hidas ramppi ohittaa yksittäisen kelloavusteisen monitorin.

seg-734a93b6a809 = PNT-kestävyyden pisteytys ja päätösepästabiilius

seg-c25b4e240fb5 = Kestävyysarviointi

seg-f42ae8719e02 = { "35" } käsin johdettua oraakkelitestiä; tavutasolla deterministinen tutkimusartefakti (kiinteä siemenluku); mukautettu DHS RPCF v2.0:aan

seg-8e69193ca540 = Kehykseen mukautettu pisteytysmoottori (DHS RPCF -luokat), joka kuvaa arkkitehtuurin simuloidun käyttäytymisen ulottuvuuskohtaisiksi osapisteiksi ja kysyy sitten, onko yksittäinen yhdistelmäpistemäärä tai kypsyystaso vakaa päätöksen perusta: Dirichlet'n painotussimpleksin, Kendallin tau -järjestysepävakauden, top-1-voittajan vaihtumisasteen ja yhteismuodon monimuotoisuuden romahtamisen (Hill-N2) avulla, ja mukana on eheyshajautettu varmistusraportti. Toistettavissa komennolla cargo run --example resilience_report. Mallinnetut synteettiset arkkitehtuurit, mukautettu RPCF v2.0:aan; itsearviointi, ei sertifiointi.

seg-62ef40799af4 = Havaitsematta jääminen → eheysalueet

seg-52e55797d77c = Eheysvaikutus

seg-99025f66f277 = Stanford-ESA-eheysalueet (Tossaint ym., NAVIGATION { "2007" })

seg-13f23ffe5840 = Silta havaitsematta jääneestä tapahtumasta eheyteen: havaitsematta jääneen harhautuksen, häirinnän tai RAIM-havainnon jättämä havaitsematon harha kasvattaa tehollista paikkavirhettä, joka kontekstikohtaisia hälytysrajoja vasten luokitellaan Stanford-ESA-eheysalueisiin (käytettävissä / ei käytettävissä / harhaanjohtava / vaarallinen). Rakentuu ulkoisesti ankkuroidun RAIM-Stanford-luokituksen päälle; ei lisää uutta eheysmatematiikkaa.

seg-3a7572774192 = Kustannus per kattavuus -ROI

seg-797d137dc022 = Päätöksenteon tuki

seg-d77993b6ef59 = Kustannus per kattavuus -ROI-näkökulma: kustannus toimitettua kattavuusyksikköä kohti satelliittitähdistön / arkkitehtuurin vertailussa. Kattavuuskomponentti rakentuu validoidun kattavuusgeometrian päälle ja laskenta on yksikkötestattu, mutta kustannus on käyttäjän syöte, joten suhde on suunnittelun apuväline eikä ulkoisesti validoitu suure (siksi rehellisesti ei todistusmerkkiä).

seg-690b4cb0df55 = Kshana Interchange Format (KIF)

seg-558523b5e0ac = Artefaktien siirtomuoto

seg-b882cccf5cee = versioitu kirjekuori · edestakainen kierto ja eteenpäin yhteensopiva luku varmennettu

seg-ff5a4ead87fe = Versioitu, itsekuvaava kirjekuori, joka kietoo skenaarion tuloksen sen lajin, skeemaversion sekä mallinnettu/validoitu-merkintöjen kanssa, jotta tallennettu artefakti pysyy itsedokumentoivana ja vanhemmat kirjekuoret pysyvät eteenpäin yhteensopivasti luettavina.

seg-5052e1720602 = Aluksen vastaanottimen luottamuspistemäärä

seg-70144aeea2d1 = monitorien laskenta tarkistettu pynmea2:ta ja GeographicLibiä vasten

seg-9d9329128f06 = Pisteyttää, voiko aluksen navigointiratkaisuun luottaa siitä NMEA { "0183" } -datasta, jota sen vastaanotin ja instrumentit jo lähettävät: pistemäärä 0–100, kolme kaistaa ja niiden perusteet, hetki kerrallaan, eräajona, livenä tai porttina. Monitorit vertaavat ratkaisua aluksen omaan liikkeeseen, suuntaanturiin, nopeusmittariin ja satelliittisignaalien tasoihin. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite: käyttäjä vastaa edelleen. Monitorien laskenta on tarkistettu riippumattomia kirjastoja vasten; pisteytyksen sääntö ja kynnykset ovat projektin omia ja pysyvät mallinnettuina.

seg-a47934361f43 = Miehistön koulutuksen NMEA-virrat

seg-c6492d4a7dae = { "225,227" } lausetta jäsennetty ja dekoodattu pynmea2:lla

seg-9ca765cc09fc = Kirjoittaa synteettistä sillan NMEA { "0183" } -dataa käsikirjoitetulle matkalle ohjaajan käsikirjoittamilla häirinnän, paikan harhauttamisen, aikaharhautuksen ja toiston tapahtumilla sekä ohjaajan lokilla, jotta miehistö näkee, miltä heikentynyt ratkaisu näyttää omilla instrumenteillaan. Vain tekstiä, ei koskaan aluksen live-navigointijärjestelmiin; mitään ei lähetetä eikä radiosignaalia synny. Lauseet ja niiden dekoodatut arvot on tarkistettu; vastaanotin-, taivas- ja tapahtumamallit ovat mallinnettuja.

seg-39f61b88209e = koodien merkitykset ja geometria tarkistettu pyModeS:ää, pyaisia, shapelya ja GeographicLibiä vasten

seg-4c1667d3d453 = Rakentaa päiväkohtaisen GeoJSON-kartan paikoista, joissa ilma-alukset (ADS-B) ja alukset (AIS) raportoivat heikentynyttä navigointidataa, avoimesti lisensoiduista syötteistä, sekä sen osuuden reitistä, joka kulkee heikentyneiden solujen läpi. Heikentynyt solu on toteamus raportoiduista tarkkuuskentistä tai epäuskottavista sijainneista, ei havainto häiriöstä, eikä solu, jota kukaan ei havainnut, ole todiste vapaasta reitistä. Menneitä raportteja, ei ennuste.

seg-e0962980e96f = Luottamustelemetria tietoturvaoperaatioihin

seg-9b538e790bd7 = Prometheus, OTLP ja CEF luettu takaisin riippumattomilla jäsentimillä

seg-f33e062790d9 = Vie luottamusvirran Prometheus-mittareina, OpenTelemetrynä (OTLP/HTTP) ja CEF- tai LEEF-syslog-tapahtumina stdoutin, HTTP:n, UDP:n tai TCP:n yli, jotta tietoturvaoperaatiokeskus näkee navigointivian muiden hälytystensä vieressä. Kuollut keräin ei pysäytä arviointia eikä jää huomaamatta. Prometheus, OTLP ja CEF luetaan takaisin riippumattomilla jäsentimillä; LEEF tarkistetaan vain omaa määrittelyään vasten.

seg-c74f3b9569b1 = Allekirjoitetut todistepaketit

seg-28016686504c = RFC { "8032" } -vektorit tavu tavulta; puhtaalta pöydältä tehty varmentaja on samaa mieltä { "71" } paketista

seg-123fa1de2e23 = Niputtaa luottamustapahtuman ympärillä olevan ikkunan hajautusketjutetuksi, Ed25519:llä allekirjoitetuksi paketiksi, jonka kuka tahansa voi varmentaa offline-tilassa: muuttunut, poistettu, vaihdettu tai lisätty tiedosto, uudelleenallekirjoitettu paketti tai väärä kiinnitetty avain nimetään. Valinnainen RFC { "3161" } -aikaleimatunniste sidotaan siihen. Tekninen tietue, ei oikeudellinen lausunto, tosiasiakonstatointi eikä todistus.

seg-ee2e250497f9 = Test-bench-vienti

seg-ea618add831e = muunnokset ja koodaukset tarkistettu PROJ:ia, GeographicLibiä, pynmea2:ta ja SciPyta vasten

seg-be8af88f4f99 = Kirjoittaa skenaarion ajoneuvon liikkeen ja tapahtumat CSV-lentoratana ja NMEA { "0183" } -dataa laboratorion GNSS-simulaattorille: Maan kiinteän, geodeettisen ja paikallisen nopeuden sarakkeet, asento ja UTC. Vain liike ja tapahtumat: signaalia ei kirjoiteta eikä simulaattorin tai vastaanottimen suorituskykyä väitetä.

seg-1ff1d8ebf1e7 = Compliance-kartoitus julkisiin kehyksiin

seg-83af3fa21509 = Kartoittaa Kshanan tulosteet julkisten kehysten kohtiin (IMO:n ohjeistus aluksille, EU:n NIS2 artikla { "21" }, EN { "16803" }, Yhdysvaltain DHS:n kestävän PNT:n kehys ja EASAn ilmailun ohjeistus) pelkän kohdenumeron mukaan, täytettynä annetuista ajoista, ja kertoo, mitä rivejä ajojoukko tukee todisteilla, sekä kunkin rivin aukon. Se ei ole toteamus siitä, että jokin kehys täyttyy, eikä kenenkään antama luokitus tai hyväksyntä.

seg-1b784a8701ac = GNSS-todennus

seg-2b5a6095013a = kaikki { "18" } virallista testivektorijoukkoa: { "186,382" } tunnistetta todennettu, { "0" } epäonnistui

seg-0419e9af208d = Avoin, puhtaasti Rust-kielinen vastaanottimen puolen varmentaja Galileon avoimen palvelun navigointiviestin todennukselle: se tarkistaa, minkä satelliittien navigointidatan vastaanotin voi todentaa I/NAV-sivuista tai u-blox UBX -virrasta, signaali avaruudessa -määrittelyn julkisen avaimen, avainketjun ja tunnisteen tarkistusten kautta, ja raportoi todennuksen satelliittikohtaisesti ja ajan mukaan. Se todentaa dataa; se ei väitä mitään harhautuksenestosuorituskykyä.

seg-d8bb6226f2e3 = Horisonttiprofiilimaskattu näkyvyys, DOP ja virheellipsi

seg-6c6e7248496f = Taivaan geometria

seg-94ff262653a6 = { "1173" } katselukulmaa ja { "142" } näkyvää joukkoa täsmäävät Orekit { "12.2" }:n ja gnss_lib_py { "1.0.4" }:n kanssa tasolle { "1e-12" }; ellipsi täsmää numpyn kanssa { "270" } tapauksessa

seg-309521d4c9e1 = Mitkä satelliitit paikka näkee, kun rakennukset, laiturit, nosturit tai maasto peittävät osan taivaasta, ja mitä se tekee tarkkuuden heikkenemiskertoimelle (DOP) ja vaakasuuntaiselle virheellipsille. Atsimuutista riippuva horisonttiprofiili korvaa yksittäisen korkeuskulmarajan; näkyvä joukko, sen DOP ja ellipsi saadaan hetkeä ja satelliittitähdistöä kohti. Horisonttiprofiili poistaa näköyhteyssatelliitteja eikä mitään muuta: se ei mallinna heijastuksia, diffraktiota eikä signaalin voimakkuutta.

seg-448e81d36ca4 = Horisonttiprofiilien esiasetukset ja taivaan geometrian funktiot

seg-6483f9d89f15 = käsin laskettuja arvoja ja geometria, jota pilvi otostaa; ei ulkoista oraakkelia

seg-ebc2904904d3 = Katukanjonin, sektorin ja maaston supistukset horisonttiprofiilitaulukoksi, neljä edustavaa esiasetusta (kaupungin katu, satamaan lähestyminen, vuono, konttiterminaali) ja funktiot, jotka yhdistävät ne taivaskartaksi ja Monte Carlo -pilveksi, komentoriviltä, MCP:stä, Pythonista ja selaimesta. Esiasetukset ovat edustavia geometrioita valituilla, ilmoitetuilla mitoilla, eivät mittauksia, ja supistukset on tarkistettu vain käsin laskettuja arvoja vasten.

seg-c2a5a6a7bcb0 = Geometriatietoinen luottamusluokitus

seg-2f51e4da63b4 = luokitussääntö ja kynnykset ovat projektin omia, tarkistettu itseään vasten

seg-b664ce284745 = Asettaa satelliittigeometrian vastaanottimen luottamuspistemäärän viereen ja nimeää luokan jokaiselle vähennykselle: signaalin menetys, huono geometria tai ristiriita vastaanottimen ilmoittaman DOP:n ja näkyvistä satelliiteista johdetun DOP:n välillä. Geometria arvioidaan vain, kun se tunnetaan, ja merkintä on pääosassa: vain huono geometria maksaa pisteitä. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite.

seg-5026aab26cb8 = Kuun vertailuasematutkimus

seg-d6935d32272b = rakentuu testattujen kuun differentiaali-, kello- ja koordinaatistofunktioiden päälle; tarkistettu itseään ja numpy-vertailua vasten, ei ulkoista lentodataa

seg-4f9696706384 = Yksi toistettava tutkimus siitä, mitä kuun etelänavan vertailuasema voisi tehdä julkisilla oletuksilla: napa-alueen kattavuus- ja tarkkuuskartta (korjatun ja korjaamattoman paikkavirheen persentiilit, saatavuus syineen jokaiselle ei-saatavalle hetkelle, suojaustasot ja korjausyhteyden budjetti), aikalaboratorio, joka pitää kuun aikavertailun atomikellolla, sekä lisätyn laserretroreflektorin ja VLBI-majakan geodesia viiden ryhmän datumia vasten. Jokainen syöte on merkitty julkisella lähteellään tai havainnollistavaksi. Se ei ole toteamus minkään todellisen järjestelmän suorituskyvystä, eikä Kshana ole sidoksissa mihinkään virastoon.

seg-cad8be3b66a3 = Optiset ajoituslinkit pilvien ja turbulenssin läpi

seg-e86745da72f0 = { "7" } / { "7" } ennalta rekisteröityä numeerista kynnystä täyttyi riippumatonta mpmath-ohjelmaa vasten; mitattua saatavuustietuetta ei ole verrattu

seg-dd98aa94f8c8 = Kuinka usein optinen ajansiirtolinkki on käytössä, kun ilmakehä on reitillä. Moottori antaa jokaiselle maa-asemalle kirkkaan ilman häviön, Hufnagel-Valley-turbulenssitilan gamma-gamma-skintillaatiohäipymillä ja apertuurikeskiarvoistuksella, saatavuuden linkkimarginaalia vasten ilmoitetusta pilviklimatologiasta, katon, jota mikään marginaali ei voi nostaa, katkoksen kestojakauman ja aikavirheen, jonka katkos maksaa holdover-kellolle. Sitten se näyttää, mitä lisäasemat, suurempi apertuuri, toinen aallonpituus tai adaptiivinen optiikka tuovat. Mukana tulevat pilviklimatologiat ovat havainnollistavia, eivät mitattuja; tuloste on ohjeellinen.

seg-861d57389dd7 = GNSS tähdistön tuolla puolen: avaruuspalvelualue ja sen yli

seg-8705c276af61 = ICG SSV -kirjasen taulukot, ennalta rekisteröity; useimmat kynnykset NOT MET (xval/gnss-ssv/RESULTS.md)

seg-2dc82174942a = Avaruusalukselle pallolla (ICG:n avaruuspalvelualuekirjasen globaali kuori) tai Keplerin radalla LEO:sta kuun siirtoon laskee satelliittitähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kaikille yhdessä signaalit C/N0-kynnyksen yläpuolella: yhden ja neljän signaalin saatavuus, pisin katkos, vastaanotettu C/N0, tarkkuuden heikkenemiskerroin sekä pääkeila- ja sivukeilalinkit. Lähetyskuviot ovat kirjasen, parametrinen korvike tai itse toimitettu; reunasäteen ionosfääri-, plasmasfääri- ja ilmakehämalli sekä heikon signaalin vastaanotinsuunnittelu ovat valinnaisia; mukana ovat aluksella toimiva GNSS-suodatin korkeille ja kuun siirtoradoille sekä muodostelman suhteellinen navigointi. MODELLED: verrattuna kirjasen taulukoihin ennen ajoa kirjatun ennakkorekisteröinnin alaisena vähimmäissäteilyteho-vakiot ja kuun kynnys täsmäävät, muut kynnykset ovat NOT MET ennakkorekisteröidyn tulkinnan mukaan (lähes kaikki kirjasen epäjohdonmukaisen GLONASS-keilakulman vuoksi), eikä parametrinen sivukeilakorvike toista mitattuja GPS-paneelikuvioita.

seg-61817375c8ea = Kuun kiertorata ja pinta navigoinnin ja geodesian infrastruktuurina

seg-d2439abaeabb = laskennan numpy/scipy-oraakkelit; kolme ennalta rekisteröityä kynnystä NOT MET (xval/lunar-infra/RESULTS.md)

seg-db45ac2940af = Viisi tutkimusta rajoitetussa kolmen kappaleen mallissa: aluksella tehtävä Maa-GNSS-radanmääritys lähes suoralla halokiertoradalla riippumatonta maassa tehtävää etäisyys- ja etäisyysnopeusmääritystä vasten; yhteinen pinta-aseman ja kiertäjän kantoaallon vaiheen kokonaislukuepävarmuuden kiinnitys (LAMBDA); seitsemän parametrin kuun datumin Fisherin informaatio kiertäjä–pinta-etäisyysmittausten kanssa ja ilman; GNSS-, VLBI- ja laseretäisyysmittausten siirtymät paikallista sidosta vasten; sekä herkkyys kuun vuorovesi- ja libraatioparametreille. MODELLED havainnollistavilla syötteillä: laskenta on tarkistettu riippumattomia numpy- ja scipy-ohjelmia vasten, ei fysiikkaa. Ennalta rekisteröidyistä kynnyksistä kolme on NOT MET: syötettyä voimavirhettä ei havaita ilmoitetulla osuudella (C3), bootstrap-menetelmällä saatu onnistumisosuus eroaa numpy-oraakkelista { "1.7e-6" } kynnyksen ollessa { "1e-9" } (Q3), ja etäisyysmittausperheen lisääminen ei aina pienennä pseudoinverssin jälkeä (G3, jäljen puolikas).

seg-aab745a65e76 = Moduuli

seg-d6476863f862 = Ominaisuus

seg-ad856ad710eb = Tila

seg-6962adaa6a1f = Tuotettu arkiston skenaariotiedostoista ja varmennusmatriisista käännösvaiheessa.

seg-6f44f45f6bf9 = Tiedoston <c1/> { "61" } ominaisuuskorttia ja sen jälkeen varmennusmatriisin kaikki { "388" } riviä.

seg-30200bb5be58 = Aja orbit-sgp4-gps.toml Kshana Studiossa

seg-ecacc78711a1 = Aja realtime-frame-eop.toml Kshana Studiossa

seg-fe9baedab7f0 = Aja imu-deadreckoning.toml Kshana Studiossa

seg-58a3232bc4cf = Aja ins-trn-coast.toml Kshana Studiossa

seg-27ffc4dfa394 = Aja gps-denied-gravity-nav.toml Kshana Studiossa

seg-eb0c08082d24 = Aja gnss-ins.toml Kshana Studiossa

seg-8d0f45d119a9 = Aja lunanet-araim.toml Kshana Studiossa

seg-09641b89ad3a = Aja lunar-frame-realisation.toml Kshana Studiossa

seg-4eea1b7d77cd = Aja moonlight-service-volume.toml Kshana Studiossa

seg-3cd4cd7d7c16 = Aja lunar-interop-export.toml Kshana Studiossa

seg-d767de2fa87a = Aja lunar-llr-datum.toml Kshana Studiossa

seg-29266e8878ac = Aja lunar-differential-pnt.toml Kshana Studiossa

seg-0955d6ded82d = Aja lunar-time-budget.toml Kshana Studiossa

seg-ab41004755ea = Aja lunar-jamming.toml Kshana Studiossa

seg-edbe5cf449a0 = Aja lunar-vlbi-fim.toml Kshana Studiossa

seg-d706c2d59dd1 = Aja mars-pnt-lmo.toml Kshana Studiossa

seg-71586c459df8 = Aja hybrid-optical-rf.toml Kshana Studiossa

seg-87634a6d41b5 = Aja integrity-raim.toml Kshana Studiossa

seg-a281aa02ddc7 = Aja araim-reference-check.toml Kshana Studiossa

seg-9184b54b1173 = Aja clock-holdover.toml Kshana Studiossa

seg-2f270136b41d = Aja gnss-sim-raim.toml Kshana Studiossa

seg-f2f3ede70967 = Aja pvt-abmf.toml Kshana Studiossa

seg-eac325fbeed1 = Aja spoof-attack.toml Kshana Studiossa

seg-07d55d3e7bdc = Aja oem-interop.toml Kshana Studiossa

seg-5b70a59accce = Aja aperture-duty-cycle.toml Kshana Studiossa

seg-d3df277fd118 = Aja space-weather.toml Kshana Studiossa

seg-7dc863bf8f7b = Aja impairment-eval.toml Kshana Studiossa

seg-1c3083a77264 = Aja conflict-resilience.toml Kshana Studiossa

seg-b3f2b2d88d8c = Aja gnss-ssv-shell.toml Kshana Studiossa

seg-e42b759ccbaf = Aja lunar-infrastructure-od-consistency.toml Kshana Studiossa

seg-60a43431ebe0 = Vaatimus

seg-cbf0f9bcd2d8 = Oraakkeli

seg-1603e76bcf66 = Potenssilakikohinan tunnistus lag-1-autokorrelaatiolla

seg-d95fe5878ee3 = allan::lag1_noise_id: Rileyn ja Greenhallin ({ "2004" }) lag-1-autokorrelaatioon perustuva kohinan tunnistin (desimoitu vaihe neliöllinen komponentti poistettuna tai ryhmäkeskiarvoistettu taajuus suora poistettuna; toistuvat ensimmäiset erotukset kunnes delta = r1/({ "1" }+r1) < { "0.25" } tai d = dmax), joka palauttaa potenssilain eksponentin alfa (+{ "2" } valkoinen PM … -2 satunnaiskävely-FM) sekä kokonaislukuna että pyöristämättä millä tahansa keskiarvoistustekijällä; se asettaa mitatun kellokirjaston laitekorttien kohinatyypin vapausasteet

seg-6e0cb6acc073 = VALIDATED

seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin ja avustajat, LGPL-3.0-or-later, ajettu erillisenä ohjelmana fikstuurigeneraattorista): julkaistun Riley–Greenhall-algoritmin riippumaton toteutus, yksikäsitteisesti määritelty suure annetuilla konventioilla. Validoi tunnistimen, ei minkään todellisen kellon kohinasisältöä

seg-aedf395f3597 = Galileo OSNMA -navigointidatan todennus vastaanottimen puolella

seg-1e6e62438dad = osnma + <c1/>: avoin, puhtaasti Rust-kielellä tehty vastaanottimen puolen todentaja Galileo OSNMA:lle (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) I/NAV-sivuista tai u-bloxin UBX-RXM-SFRBX-virrasta: Merkle-puun julkiset avaimet (DSM-PKR), DSM-KROOTin ECDSA P-256/P-521 -allekirjoitus, TESLA-avainketjun todennus (SHA-256 tai SHA3-256), MACSEQ:n ja tunnisteiden todennus (HMAC-SHA-256 tai CMAC-AES) ADKD-arvoille { "0" }, { "4" } ja { "12" } ristiintodennuksella, ketjun pää/mitätöinti/uusiminen, julkisen avaimen uusiminen ja mitätöinti sekä hälytysviesti; satelliittikohtainen tila Authenticated/Failed/Unavailable ja syy jokaiselle virheelle tai viiveelle. Ohjeellinen: ei tyyppihyväksytty navigointilaite eikä navigoinnin eheyspalvelu; mitään harhautuksenestosuorituskykyä ei väitetä

seg-a6bd60ed728f = Euroopan GNSS-palvelukeskuksen Receiver Guidelinesin liitteenä julkaisemat viralliset Galileo OSNMA -testivektorit (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } joukkoa { "18" }:sta, { "186,382" } tunnistetta todennettu, { "0" } epäonnistui, ajettu offline 2026-10-10 (todistetiedosto kshana-pro docs/evidence). Rajaus: vektorit validoivat kryptografisen todennuksen (Merkle, KROOT/ECDSA, TESLA-ketju, MACK-tunnisteet, ADKD 0/4/12) ja sen tulokset julkaistuissa skenaarioissa; ne käyttävät vain HMAC-SHA-256:ta, SHA-256-ketjua, 128-bittisiä avaimia, 40-bittisiä tunnisteita ja hakumerkintöjä { "33" } ja { "34" }, joten CMAC-AES, SHA3-256-ketjut ja muut parametrit katetaan vain julkaistuilla primitiivien tunnettujen vastausten testeillä ja synteettisillä testeillä. Luotetun ajan, datan sidonnan, vanhenemisen ja otsakevahvistuksen koventaminen testataan synteettisillä hyökkäystesteillä, ei ulkoisella oraakkelilla. Ei tarkistettu: varmenteiden mitätöintilistat, live-signaalit tai live-vastaanotin (UBX-sanarakenne tarkistetaan vain synteettisillä kehyksillä), SHA3-256 Merkle-puut, tuoreus ilman riippumatonta aikaa. Ei EU:n palvelu

seg-27a61718eb95 = Taajuusvakauden karakterisointi

seg-56174d771190 = Allanin/modifioitu/Hadamardin poikkeama + potenssilakikohinan tunnistus χ²-luottamusväleillä

seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / Stable32-vertailupoikkeamat NBS14:llä

seg-25b78672c194 = Taajuusvakaus todellisella mitatulla kellolla

seg-fd378f5fe04a = Limittäinen Allanin poikkeama + limittäinen Hadamardin poikkeama todellisella cesiumnormaalilla

seg-64fd49d58394 = Stable32:n limittäinen ADEV/HDEV mitatulla 5071A-cesiumin vaihesarjalla (allantools)

seg-f305dbc83f2b = Allan-estimaattorin vastaavuus kanonisella Stable32-vertailusarjalla

seg-5bfca5dcfb7c = Limittäinen Allan + modifioitu Allan + aikapoikkeama koko AF-tikapuilla

seg-327ab6dcf16a = Stable32-vertailupoikkeamat tiedostolle PHASE.DAT (Riley; vakioregressiosarja)

seg-96c4275f5a89 = Laajennetun alueen taajuusvakaus (Theo1 / TOTDEV)

seg-7f59c3631ca4 = Theo1 ja kokonaispoikkeama (TOTVAR): laajennetun alueen pitkän tau:n vakausestimaattorit, jotka yltävät noin { "75" } %:iin tallenteesta, kun Allanin poikkeama menettää tehonsa noin { "50" } %:n kohdalla; niiden päälle rakennettu harhapoistettu ThêoH-hybridi (allan::theoh_curve) pysyy MODELLED-tasolla

seg-a38edc2526f5 = allantools { "2024.06" }, riippumaton kolmannen osapuolen taajuusvakauskirjasto: theo1 (NIST SP { "1065" } yhtälö { "30" }) ja totdev (NIST SP { "1065" } yhtälö { "25" }) hermeettisellä NIST SP { "1065" } §{ "12.4" } LCG-aineistolla; uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

seg-cc40472fbcbf = Suurin aikaintervallivirhe (MTIE), telealan wander-mittari

seg-5c54ba2748f7 = MTIE(τ): suurin huipusta huippuun -aikavirheen heilahdus minkä tahansa τ = m·tau0 -mittaisen liukuvan ikkunan yli; ITU-T G.810/G.823/G.8261 wander-tilasto, jota vasten synkronointiverkkojen rajat (MTIE-maskit) on kirjoitettu. Ääriarvosuure (max/min), joka eroaa RMS-pohjaisesta Allan-perheestä

seg-300fd3f945a0 = allantools { "2024.06" }, riippumaton kolmannen osapuolen taajuusvakauskirjasto: mtie() hermeettisellä NIST SP { "1065" } §{ "12.4" } LCG-vaihesarjalla; MTIE on puhdas max/min-tilasto, joten estimaattorin tulos on bittitarkasti sama kuin allantoolsin identtisesti rakennetulla vaihetaulukolla (arkistoidut 15 merkitsevän numeron vertailuvakiot ovat { "1" } ULP:n sisällä). Uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mtie/generate_mtie_reference.py

seg-67d73f3ca14d = Modifioitu Allan / aikapoikkeama (MDEV / TDEV)

seg-9ac9d2b0bdf8 = MDEV(τ): limittäinen modifioitu Allanin poikkeama (toisen differenssin liukuvan ikkunan estimaattori, joka erottaa valkoisen vaihekohinan flicker-vaihekohinasta) ja TDEV(τ) = τ/√{ "3" }·MDEV(τ), ITU-T G.811/G.812/G.823 -aikatason wander-tilasto, jota vasten synkronointimaskit on kirjoitettu

seg-24a441f32375 = allantools { "2024.06" }, riippumaton kolmannen osapuolen taajuusvakauskirjasto: mdev() ja tdev() hermeettisellä NIST SP { "1065" } §{ "12.4" } LCG-vaihesarjalla (sama sarja kuin Theo1/TOTDEV/MTIE-riveillä), laskien samat yksikäsitteisesti määritellyt estimaattorit; vastaavuus < { "1e-9" } suhteellisena. Uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Datarajattu phasedat_reference.rs tarkistaa nämä myös Stable32:ta vasten tarkkuudella { "1e-3" }; tämä on tiukka, aina päällä oleva hermeettinen ristiintarkistus)

seg-e4b6d707cbf5 = Optisen kellon taajuusvakaus todellisella mitatulla käyrällä

seg-e9077554a08f = Potenssilain (valkoinen FM + punaisen kohinan lattia) NNLS-palautus julkaistusta mitatusta ⁸⁸Sr-optisen kellosiirtymän Allanin poikkeamasta: toistaa σ_y(τ):n ja pääotsikon 4.7e-16/√τ lyhyen τ:n skaalauksen aidolla mitatulla pitkän τ:n lattialla, eikä sillä synteettisellä optisen luokan lattialla, jonka holdover.rs muuten olettaa

seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), kuva { "4" } mitattu ADEV; käyrä otettu sellaisenaan Zenodosta 10.5281/zenodo.3382347 (CC-BY-4.0). Rajattu julkaistun mitatun vakauskäyrän toistamiseen; kellon luokan laitearvot holdoverille kynnykseen asti pysyvät MODELLED-tasolla

seg-cc95c8615d39 = Eheys (RAIM/ARAIM/SBAS)

seg-d4ad9cfa4f9b = ARAIM-moniolettamusten ratkaisuerotus ARAIM Airborne Design Documentin (ADD) v4.2 mukaan (araim_reference::add_v42_protection_levels ja add_v42_protection_levels_ecef: osajoukkojen määritys P_THRES- ja FC_THRES-säännöillä, VPL, HPL, tehollinen valvontakynnys EMT ja sigma_acc); χ²-testiin perustuva hetkellinen RAIM-vian havaitseminen yhden satelliitin poissulkemisella (raim::snapshot_raim, raim::snapshot_raim_fde) ja kaltevuuteen perustuva HPL/VPL geodeettisella paikallisella tasolla; sekä SBAS DO-229E -suojaustasojen yhdistely (sbas::sbas_protection_level) L1-palvelussa. EI katettu, sanottuna suoraan: yhtenäisen sigman apufunktiot raim::araim_raim ja raim::araim_dual_raim eivät vastaa ADD-määritystä (vastaavilla syötteillä ne jäävät Stanford MAAST:sta { "0.75" } m VPL / { "4.04" } m HPL ja { "0.39" } m VPL / { "1.93" } m HPL, löydös); kaksitaajuuksisen monitähdistöisen (DFMC) L5 SBAS -vertailun löydös on, että { "308" } käyttäjähetkiparia, joissa GEO ei ole näkyvissä, Kshana suojaa mutta MAAST ei, koska Kshana ei mallinna MAASTin GEO-vastaanottoporttia; raim::solution_separation_raim:lla ei ole ulkoista vertailua

seg-a83c68500982 = Kolme riippumatonta työkalua, ennalta rekisteröity (0123cee1) ennen kuin mitään fikstuuria tai oraakkelin tulosta oli olemassa, toleranssit lukittu silloin. ({ "1" }) ARAIM: Stanford MAAST ARAIM { "2" }:lle (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, ajettu erillisenä ohjelmana GNU Octave { "8.4" } -ympäristössä ajurin puolen unique()-yhteensopivuuskerroksella (ilmoitettu, ei algoritmimuutosta), ADD:n TOL_PL-arvolla { "0.05" } m: Rust toistaa ADD-vertailutoteutuksen { "270" } todellisella tapauksella. Ilmoitettu: Kshanan ADD-polku kirjoitettiin ennakkorekisteröinnin jälkeen noudattaen ADD:tä siten kuin MAAST sen toteuttaa; arvioijan riippumaton holdout ({ "270" } uutta käyttäjägeometriaa ja toinen eheystukiviesti, MAAST ajettu uudelleen jäädytettyä koodia vasten) läpäisi saman kynnyksen. ({ "2" }) Hetkellinen RAIM: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde erillisessä C-testiympäristössä havaitsemiselle ja poissulkemiselle; kaltevuus-PL RTKLIBin matinv/xyz2enu:sta sekä SciPy { "1.18.1" } chi2/ncx2, missä molemmat puolet laskevat saman suljetun muodon (Brown; Parkinson ja Axelrad), joten PL-tarkistus kattaa toteutuksen, ei kaavaa. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, muuttamattomana, MAASTin omilla tallennetuilla WAAS-lähetyksillä: L1-tasot { "1e-4" } m:n sisällä K-uudelleenskaalauksen jälkeen ja yhtä suuri suojattu joukko. Samat vertailut tuottivat ominaisuudessa mainitut löydökset: yhtenäisen sigman ARAIM-funktiot eivät vastaa ADD-määritystä, ja L5-joukkojen yhtäsuuruus pettää { "308" } parilla, joissa GEO ei ole näkyvissä (tasot { "3267" } parilla, jotka molemmat työkalut suojaavat, täsmäävät { "1e-13" } m:n tarkkuudella). DO-229E/DO-316 K-kertoimet ovat jäljennettyjä vakioita ja todellinen geometria on syöte; kumpaakaan ei lasketa oraakkeliksi. Versiomuutos { "0.30" }: snapshot_raim-suojaustasot siirrettiin radiaalitasolta geodeettiselle paikalliselle tasolle (jopa { "0.31" } m HPL ja { "0.14" } m VPL leveysasteella { "16" } N)

seg-1c37702cc5f2 = Radan propagointi ja määritys

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + häiriöt, eräkohtainen/peräkkäinen OD

seg-c84585f43297 = AIAA 2006-6753 SGP4-verifiointivektorit

seg-50c545872e4f = Numeerinen Cowell-propagaattori ja voimamalli

seg-74f8c585bcfd = Cowellin numeerinen propagaattori hierarkkisella voimamallilla (kahden kappaleen, J2–J6-zonaalinen, Auringon/Kuun kolmannen kappaleen, kanuunankuula-SRP, eksponentiaalinen ilmanvastus); RK4-askelkaksinnus / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853, riippumaton kirjasto, eri integraattori ja pallofunktiorekursio. Konservatiiviset tasot (kahden kappaleen → J2–J6-zonaalinen → Auringon/Kuun kolmas kappale → kanuunankuula-SRP) täsmäävät alle metrin tarkkuudella { "24" } tunnin kaarella, mikä validoi integraattorin ja voima-algebran; ilmanvastustaso sekä Auringon/Kuun efemeridin absoluuttinen ja tiheyssyötteen tarkkuus pysyvät MODELLED-tasolla (vain karakterisointi)

seg-d38c4be472ac = Litistyneen Maan SRP-varjo (valinnainen)

seg-ab8247c6b4d2 = SRP:n valaistu osuus, kun WGS-84-ellipsoidi on peittävä kappale (Maan näennäinen säde ellipsoidin reunalta Aurinkoa kohti, kahden kiekon linssikaava; srp_shadow::oblate_conical_shadow), valinnainen Cowellin voimamallissa kentän propagator::ForceModel::srp_shadow kautta (oletus: pallomainen kartiovarjo, muuttumaton)

seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio WGS-84- ja pallomaisella OneAxisEllipsoid-peittävällä kappaleella, ajettu erillisenä ohjelmana Aurinko kiinnitettynä samaan inertiaaliseen paikkaan. Kynnykset ennalta rekisteröity tiedostossa xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } molemmille sekä > { "1e-2" } litistyneen ja pallon välinen hajonta; kaikki täyttyivät. Ellipsoidin akseli on inertiaalinen z-akseli molemmilla puolilla (ei prekessiota-nutaatiota)

seg-01066d639b39 = Laatikko-siipi- ja ECOM2-auringonpaine osittaisderivaattoineen (valinnainen)

seg-2a5fc9708bd0 = Ei-kanuunankuulamainen SRP: laatikko-siipi-levymalli (Vallado yhtälö 8-44; yksipuoliset runkopaneelit, Aurinkoon osoittavat siivet) GSC:n satelliittimetadatan Galileo FOC-, IOV- ja IOV-elinkaaren lopun taulukoilla, nimellisellä GNSS-yaw-ohjauksella, analyyttisillä osittaisderivaatoilla säteilykertoimelle ja jokaisen paneelin peilimäiselle ja diffuusille kertoimelle; sekä ECOM2-empiirinen malli (D2/B1) osittaisderivaattoineen. Laatikko-siipi on valinnainen Cowell-propagaattorissa (propagator::ForceModel::box_wing_srp, asettaa sen kentän srp_boxwing) ja tarkassa radanmääritysmallissa (precise_od::PreciseForceModel::box_wing_srp), ja se korvaa kanuunankuulatermin cr:llä säteilykertoimena; molemmat ovat oletuksena None, jolloin jokainen olemassa oleva polku pysyy tavu tavulta ennallaan. ECOM2:ta ei ole kytketty voimamalliin

seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft FixedPanelilla ja PointingPanelilla, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), GenericGNSS nimellinen yaw ja ECOM2(nD = { "2" }, nB = { "1" }), ajettu erillisenä ohjelmana Aurinko kiinteissä inertiaalisissa paikoissa; säteilykertoimen derivaatta Hipparchus Gradientista, paneelikohtaiset derivaatat Orekitin keskeisdifferensseinä (Orekitissa ei ole). Kynnykset ennalta rekisteröity tiedostossa xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf) ennen kuin Orekitin tulosta oli olemassa: { "1e-12" } suhteellisena ({ "1e-11" } päästä päähän, { "1e-9" } erotuksille); kaikki täyttyivät (RESULTS.md). VALIDATED kattaa vain mallin evaluoinnin: GSC-taulukot ovat jäljennettyjä syötteitä, eikä laatikko-siiven riittävyyttä todellisille Galileo-radoille, lämpöuudelleensäteilyä, muokattua matalan beta-kulman yaw-lakia eikä varjokäännöksiä kateta; Galileon SRP-ennuste pysyy MODELLED-tasolla

seg-bde1b3a94a47 = Auringon reunatummennettu SRP-varjo (valinnainen)

seg-eaaec545dd68 = SRP:n valaistu osuus reunatummennetun aurinkovuon peittämättömänä osuutena (Eddingtonin approksimaation laki I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss–Legendre-kvadratuuri) pallomaisen tai WGS-84-Maan yli (srp_shadow::limb_darkened_shadow, ShadowModel-variantti OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Ei ulkoista: Orekitissa { "12.2" } ei ole reunatummennettua valaistussuhdetta. Tarkistettu vain saman lain suljettuja muotoja vasten

seg-673b17e9dcf7 = NRLMSISE-00:n termosfäärin tiheys

seg-09e997231de8 = NRLMSISE-00:n empiirisen termosfäärin portti (gtd7 ja gtd7d: lajien tiheydet, kokonaismassatiheys poikkeavalla hapella, lämpötilat; { "24" } kytkintä; päivittäisen Ap:n ja 3-tuntisen ap-taulukon tilat) NRL:n Fortran-koodin julkisen alueen C-versiosta

seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, joka ajaa NRL:n Fortran GTD7D:n yksittäisellä tarkkuudella, ja NRLMSISE-00:n C-portti (julkaisu { "20190709" }, julkinen alue) käännettynä erillisenä ohjelmana, sekä C-jakelun { "17" } julkaistua testituloa. Kynnykset ennalta rekisteröity tiedostossa xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) ennen kuin portti oli olemassa; kaikki täyttyivät (RESULTS.md). Validoi portin, ei mallin tarkkuutta mitattua tiheyttä vasten

seg-12977f65b2ea = NRLMSISE-00:n ilmanvastuksen tiheystaso (valinnainen)

seg-17aec847b675 = forces::DensityModel (Exponential-oletus, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) ja propagator::ForceModel::drag_density: neliöllinen ilmanvastus yhdessä pyörivän ilmakehän kanssa NRLMSISE-00:n tiheydellä WGS-84:n geodeettisessa pisteessä (Maan pyörimiskulma UT1 = TT, paikallinen aurinkoaika UT + lon/15), vakioavaruussää mallia kohti; oletuksena pois päältä ja bittitarkasti identtinen

seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 ja DragForce Orekitin omalla NRLMSISE00-toteutuksella, ajettu erillisenä ohjelmana samalla Maan pyörimiskulmakoordinaatistolla, WGS-84-muodolla, paikallisen aurinkoajan konventiolla (keskimääräinen Aurinko) ja TT:llä UT:na; konventioasetus tarkistettiin oraakkeli oraakkelia vasten (Orekit vs. pymsis, { "5.2e-5" } tiheydessä). Kynnykset ennalta rekisteröity tiedostossa xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } ilmanvastuksen siirtymästä, sekä kaksi > { "100" } m:n herkkyystarkistusta; kaikki täyttyivät. Ei katettu: mallin tarkkuus mitattua tiheyttä vasten, ajan mukana muuttuva avaruussää, GMAT-osuus

seg-1ac7430e88fc = Oletuseksponentiaalinen ilmanvastus riippumatonta toteutusta vasten (päiväntasaaja)

seg-a9c41b03f2ca = Cowell-propagaattorin oletusilmanvastus: neliöllinen ilmanvastus pyörivän ilmakehän suhteen funktiolla forces::atmospheric_density, Valladon taulukon 8-4 paloittain eksponentiaalinen taulukko pallomaisella korkeudella (propagator::ForceModel::drag forces::DensityModel-tyypin oletusvariantilla Exponential)

seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole Exponential-ilmakehällä (sama 28 kaistan taulukko), pistemassa-Maalla ja PrinceDormand78:lla, ajettu, ei koskaan sisällytetty mukaan. Kynnykset ennalta rekisteröity tiedostossa xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) kummankin puolen ilmanvastuksen siirtymälle (ilmanvastusajo miinus ilman ilmanvastusta -ajo), mikä kumoaa kaksi Maan mu-arvoa ja integraattoria; kaikki täyttyivät (RESULTS.md). GMAT käyttää geodeettista korkeutta ja kshana pallomaista korkeutta: ne ovat samat vain päiväntasaajalla, joten VALIDATED kattaa päiväntasaajan radat; päiväntasaajan ulkopuolella mallit eroavat suunnitellusti ({ "10.4" } % { "24" } tunnin siirtymästä kulmassa { "51.6" } astetta, { "400" } km). GMATin julkisessa versiossa ei ole NRLMSISE-00:aa (lisäosa puuttuu), joten NRLMSISE-00-tasolla on vain Orekit-oraakkeli. Taulukon tarkkuutta mitattua tiheyttä vasten ei katettu

seg-9e15970435c3 = DE440:n Aurinko ja Kuu Cowellin voimamallissa (valinnainen)

seg-de6831cf7785 = Valinnainen efemeriditaso numeerisen Cowell-ForceModelin kolmannen kappaleen ja SRP:n termeille: geosentrinen Aurinko ja Kuu minkä tahansa EphemerisProviderin (DE440 SPK -kernel kohteen KernelEphemeris kautta) antamina ajanhetkellä TDB = TT + (TDB - TT); hylkää tarjoajan, joka ei voi palvella ajanhetkeä, ja laskee kaikki paluut analyyttiseen sarjaan; oletuksena pois päältä

seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 ThirdBodyAttraction- ja SolarRadiationPressure-voimilla Orekitin omalla DE440-lukijalla (orekit-data lnxp1990.440), ajettu erillisenä ohjelmana; kshana lukee bitti bitiltä SPICE-tarkistetun leikkeen NAIFin de440s.bsp-tiedostosta. Kynnykset ennalta rekisteröity tiedostossa xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Rataa koskeva kynnys ({ "0.5" } m) ja herkkyyskontrolli täyttyivät, mutta Auringon/Kuun paikkaa koskeva kynnys ({ "3" } m / { "0.2" } m) jäi saavuttamatta: tulokset olivat { "6.39" } m / { "0.244" } m. SPICE, joka lukee saman kernelin tarkalla TDB-hetkellään, poikkeaa Orekitista yhtä paljon ({ "6.25" } m / { "0.240" } m), joten ero on NAIFin de440s-polun ja Orekitin DE440-lukijan tai aika-asteikon välillä; syytä ei eristetty. Kirjattu ja lukittu, joten rivi pysyy MODELLED-tasolla

seg-057c21daf4f2 = S1-ilmakehän vuorovesi (valinnainen)

seg-f600a39f297e = Vuorokautinen S1-ilmanpainevuorovesi geopotentiaalihäiriönä: Biancale ja Bode ({ "2006" }) malli N1, asteet { "2" }–{ "6" }, IERS { "2010" } yhtälön { "6.21" } kuormakaavan kautta (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valinnainen Cowell- ja tarkoissa voimamalleissa (air_tide_s1, oletuksena pois päältä)

seg-7dd9fccac779 = Ei ulkoista geopotentiaalivaikutukselle. { "24" } kerrointa on jäljennetty GFZ STR06/01 -taulukosta { "1" } malli N1 ja tarkistettu rivi riviltä raporttia vasten (SHA-256 890865ae); asteita { "0" }, { "1" }, { "7" } ja { "8" } ei käytetä. Ray ja Ponte ({ "2003" }) eivät julkaise pallofunktiotaulukkoa, joten toista lähdettä ei verrattu

seg-b150b1bdb599 = S2-ilmakehän vuorovesikertoimet IERS-konventiossa

seg-87e9238b8c53 = Rayn ({ "2001" }) S2-ilmanpaineharmoniset (n <= { "4" }, myötäkulkuiset ja vastakulkuiset) muunnettuna IERS { "2010" } yhtälöiden 6.20–6.21 täysin normalisoituun sini-johtavaan muotoon (amplitudi jaettuna N_nm:llä, epsilon = { "90" } astetta - psi) ja sovellettuna funktion tides::atmospheric_tide S2-termiksi

seg-4745148b6c60 = Biancale ja Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), taulukko { "5" }, malli A2: Ray ({ "2001" }) julkaistuna täysin normalisoiduilla harmonisilla sini-johtavilla vaiheilla, saman mallin riippumaton esitys. Ennalta rekisteröity tiedostossa xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) yhdessä korjauksen kanssa, jonka se validoi. Kattaa vain kerroinmuunnoksen; ilmavuoroveden geopotentiaalivaikutukselle ei ole ulkoista oraakkelia

seg-444f0a65b6fd = Tesseraalinen geopotentiaali Cowell-propagaattorissa

seg-ad475816bc78 = Valinnainen EGM2008-tesseraalikenttä (asteeseen/kertalukuun { "70" } asti) numeerisen Cowell-ForceModelin keskeisenä painovoimana, laskettuna Maahan kiinnitetyssä koordinaatistossa, jota pyöritetään IAU { "2000" } -Maan pyörimiskulmalla (tai CIO GCRS–ITRS-ketjulla); oletuksena pois päältä, joten mikään olemassa oleva tuloste ei muutu

seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 ja HolmesFeatherstoneAttractionModel samoilla kertoimilla (tools/egm2008_to70.gfc) kappalekoordinaatistossa, jota pyöritetään samalla Maan pyörimiskulman kaavalla, ajettu erillisenä ohjelmana. Kynnykset ennalta rekisteröity (f0e0e65, muutettu ennen mitään vertailua tiedostossa 2da899a): |dr| <= { "0.5" } m ja |dv| <= { "5e-4" } m/s, ja molemmat negatiiviset kontrollit ohittavat > { "100" } m; kaikki täyttyivät, minkä jälkeen kynnykset kiristettiin arvoihin { "0.1" } m ja { "1e-4" } m/s. Ei validoitu: Maan orientaation tarkkuus (molemmat puolet käyttävät UT1 = TT ilman prekessiota-nutaatiota Era-koordinaatistossa), Cio-koordinaatiston valinta (vain sisäinen tarkistus), asteet yli { "70" }

seg-e8f5ff8c9149 = Korkea-asteinen pallofunktiopainovoima (EGM2008 asteeseen { "2190" } asti)

seg-d3b2f32dcecb = Alivuototurvallinen ja napaturvallinen täysin normalisoidun kentän laskenta asteeseen { "2190" } asti (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes–Featherstone { "2002" } muokattu eteenpäin etenevä sarake, jonka gradientissa ei ole termiä 1/cos phi), suoratoistava ICGEM .gfc -lataaja (from_gfc_file / from_gfc_reader; täysi EGM2008 haetaan ajon aikana, ei sisällytetä mukaan) sekä Holmes–Featherstone-laskin, joka on valittavissa valinnaiseen Cowell-Geopotential-kohteeseen

seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel ja pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, ajettu erillisinä ohjelmina; kynnykset ennalta rekisteröity tiedostoissa xval/high-degree-gravity/PREREGISTRATION.md (276c869f) ja xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit täsmää kaikkialla, missä se on määritelty, mutta pyshtools jää ennalta rekisteröidystä kynnyksestään kahdessa napojen lähellä olevassa pisteessä (enintään { "7.3e-10" } m/s^{ "2" }; 50-numeroinen mpmath-tarkistus osoittaa virheen olevan pyshtoolsissa), napa-akselilla täsmälleen ei ole oraakkelin arvoa, ja { "24" } tunnin radan ennalta rekisteröity asteen 70 herkkyyskontrolli jäi alle kynnyksen ({ "0.726" } m vs. > { "1" } m). Jokainen alitus on kirjattu eikä sitä ole viritetty pois, joten rivi pysyy MODELLED-tasolla

seg-e81b7418c382 = DOP853-integraattori

seg-e6e3638aa68e = Hairerin DOP853 { "8" }({ "5,3" }) eksplisiittinen Runge–Kutta yhdistetyllä 5./3. kertaluvun virhe-estimaattorilla, SciPyn/Hairerin askelsäätimellä, automaattisella alkuaskeleella, suljetusti epäonnistuvalla askelvartijalla ja 7. kertaluvun tiheällä ulostulolla; valittavissa propagaattorin Integrator-variantiksi Dop853 / propagator::propagate_dop853

seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) ja sen yksittäisaskel-, virhenormi-, tiheä ulostulo- ja alkuaskelrutiinit, riippumaton toteutus; tarkat kahden kappaleen tilat mpmath { "1.3.0" }:lla { "40" } numerolla. Kynnykset ennalta rekisteröity tiedostossa xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) ennen ensimmäistä vertailua; kaikki täyttyivät (xval/dop853-scipy/RESULTS.md). SciPyn ensimmäinen askel annetaan molemmille ratkaisijoille täysissä ajoissa; alkuaskelrutiinia verrataan erikseen. Ei katettu: RKF7({ "8" }), jäykkyyden havaitseminen, tapahtumien paikannus

seg-9ad7c1f4da77 = Robusti Keplerin yhtälön ratkaisija

seg-4b9d812fd13e = Elliptinen Keplerin ratkaisija kaikille { "0" } <= e < { "1" } ja kaikille keskianomalioille: Markleyn ({ "1995" }) kuutiollinen alkuarvaus ja viidennen kertaluvun korjaus, kumoutumisvapaa residuaali (1-e)E + e(E - sin E) - M ja suojattu Newton-hionta (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause) 50-numeroiset juuret tarkoista binäärisyötteistä. Kynnykset ennalta rekisteröity tiedostossa xval/kepler-mpmath/PREREGISTRATION.md (df22174), ilmaistuna suhteessa |E|:hen ja e -> { "1" }, M -> { "0" } -ehdollisuusperustelulla; kaikki täyttyivät (xval/kepler-mpmath/RESULTS.md). Vanhat ratkaisijat (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) ovat numeerisesti muuttumattomia, koska arkistoidut tulosteet riippuvat niistä, eikä tämä rivi kata niitä

seg-1960804ef2f4 = Etäisyysnopeuden ja atsimuutti/korkeuskulman eräkohtainen radanmääritys aseman maskauksella

seg-4c185244bc66 = Palauttaa epookin tilan sekoitetusta etäisyys-, etäisyysnopeus- ja atsimuutti/korkeuskulma-seurannasta korkeuskulmamaskin yläpuolella Gauss–Newton-menetelmällä H = (dh/dx(t)) Phi(t, t0): analyyttiset mittausosittaisderivaatat ja variaatiotilansiirtymämatriisi, jossa on analyyttiset kahden kappaleen + J2-osittaisderivaatat (RK4-integroitu, ei suljetun muodon STM)

seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator mukautetuilla hetkellisillä geometrisilla RangeRate- ja AzEl-mittauksilla (ristiintarkistettu Orekitin TopocentricFramea vasten), ajettu erillisenä ohjelmana identtisillä maskatuilla, siemenluvulla toistettavilla havainnoilla. Kynnykset ennalta rekisteröity tiedostossa xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Jokainen kynnys täyttyi paitsi B4, kohinattoman tilan yhtäpitävyys { "1" } cm:n sisällä, joka jäi saavuttamatta { "2" } skenaariossa { "4" }:stä ({ "1.46" }, { "1.74" } cm): Orekitin oma kohinaton estimaatti on näin kaukana sen simuloidusta totuudesta (syytä Orekitin puolella ei eristetty). Kirjattu ja lukittu, joten rivi pysyy MODELLED-tasolla. Ei mallinnettu: valon kulkuaika, aberraatio, refraktio, Maan pyöriminen, peräkkäinen suodatin näille mittaustyypeille

seg-bc3d1ee7c639 = SP3-tarkkuuskoodin havaintopainotus

seg-63b1fab84f85 = Kuvaa SP3-tarkkuuskoodit (otsikon ++-eksponentit muodossa { "2" }^n mm, %f-kanta, tietuekohtaiset kanta^n mm -keskihajonnat) havaintokohtaisiksi paikan sigmoiksi tarkan radanmäärityksen moottorille (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Ei ulkoista: painot ovat mallinnusvalinta (SP3-muoto määrittelee koodin vain tuottajan tarkkuusindikaattorina; se luetaan tässä akselikohtaisena yhden sigman arvona). Olemassa olevat tallennetut virastoajot ovat muuttumattomia

seg-e35df6881c80 = Planeettojen painovoimakentät PDS SHADR -taulukoista

seg-f78b73ae8742 = Lukee PDS SHADR -pallofunktiotaulukot (from_shadr, tyypillä SphericalHarmonicField tiedostossa src/gravity_pds.rs: yksikkömuunnos, C00 = { "1" } annettu, täydellisyys- ja normalisointitarkistukset) ja laskee Marsin GMM-3:n (d/o { "120" }) ja Kuun GRAIL-kentän GL0660B (d/o { "660" }) kappaleeseen kiinnitetyn painovoiman

seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause) lukee samat PDS-tiedostot ja laskee pistepainovoiman, ajettu erillisenä ohjelmana, sekä julkaistut PDS-tuotteiden otsakkeet ja selitteet. Kynnykset ennalta rekisteröity tiedostossa xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); kaikki täyttyivät (RESULTS.md). Data: NASA PDS Geosciences Node, julkinen alue; asteen 20 leikkeet mukana NOTICE-tiedoston kanssa, täydet tiedostot haetaan testin aikana

seg-ae3e8833a5ef = Liitä julkaistu painovoimakenttä kappaleeseen

seg-ffb2b20e5f32 = with_gravity_field (tyypillä Body, tiedostossa src/gravity_pds.rs): liittää minkä tahansa ladatun pallofunktiokentän (esimerkiksi GMM-3 tai GL0660B) kappaleeseen Body, jolloin propagaattori laskee sen kappaleeseen kiinnitettynä; valinnainen, oletuskappaleet muuttumattomia

seg-bcb731f7a9b5 = Vain sisäinen johdonmukaisuus. Jokainen julkaistu kenttä on määritelty tuottajansa kappaleeseen kiinnitetyssä koordinaatistossa (GMM-3 Konopliv ym. { "2006" } Mars-koordinaatistossa, GL0660B DE421-kuun pääakselikoordinaatistossa), kun taas kenttä lasketaan IAU-koordinaatistossa; poikkeamaa ei mallinneta

seg-659bfeba459c = Eräkohtainen ja peräkkäinen radanmääritys

seg-dbc98f498941 = Palauttaa epookin tilan [r,v] maa-aseman etäisyyksistä Gauss–Newton-eräkohtaisella differentiaalikorjaajalla ja peräkkäisellä suodattimella kahden kappaleen + J2-voimamallin yli

seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF), riippumaton kolmannen osapuolen estimointikirjasto vastaavalla voimamallilla; palautettu epookin tila + jälkisovituksen jäännöksen RMS täsmäävät tarkkuudella < { "1e-3" } m kohinattomana ja < { "3" } m { "5" } m:n kohinalattialla

seg-acdac055acb9 = Syväavaruuden radiometrinen valon kulkuajan ratkaisija

seg-62a478e40850 = Viivästetty (alas-osuuden) yksisuuntainen valon kulkuaikaratkaisu τ = |r_rx − r_target(t−τ)|/c syväavaruuden radiometriseen navigointiin (Maa→Mars/Aurinko/Kuu)

seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) konvergoitunut newtonilainen aberraatiovalon kulkuaika (Aberration::CN; SPICE spkapo -vastine) JPL DE440:n päällä, riippumaton Rust-pohjainen SPICE-toteutus; kshanan kiintopisteiteraatioon perustuva viivästetty ratkaisija täsmäsi alle nanosekunnin tarkkuudella. Laajemmat Doppler- / Shapiro- / reduced-dynamic OD -tunnusluvut pysyvät MODELLED-tasolla

seg-c69ef9342160 = Lähetetyn efemeridin satelliittipaikka (multi-GNSS RINEX)

seg-62702fc6f242 = IS-GPS-200 / Galileo-OS / BeiDou-OS -lähetetyn efemeridin Kepler-elementeistä ECEF-satelliittipaikkaan jäsennetystä RINEX-3-navigointitietueesta

seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos() käännettynä C-lähdekoodista (T. Takasu, BSD-2-Clause), riippumaton IS-GPS-200/SIS-ICD-toteutus, syötteenä identtiset RINEX-3-navigointitietueet; satelliitin ECEF-paikka täsmäsi noin { "62" } nm:n tarkkuudella. (SP3-tarkan efemeridin interpolointi validoidaan erikseen: ks. ’SP3 precise-ephemeris interpolation’)

seg-c807a782b20e = SP3-tarkan efemeridin interpolointi

seg-238de70daab9 = IGS-standardin mukainen SP3-tarkkojen efemeridien satelliittipaikkojen Lagrange-interpolointi solmukohtaisella Maan pyörimisen korjauksella (kukin solmu pyöritetään ω⊕·(t_node−t) verran kyselyhetken Maahan kiinnitettyyn koordinaatistoon ennen polynomisovitusta)

seg-e9249ae44a11 = RTKLIB peph2pos() käännettynä C-lähdekoodista (preceph.c; T. Takasu, BSD-2-Clause), tosiasiallinen IGS-vertailu ja riippumaton toteutus; kshanan interpolaattori (joka nyt sisältää saman Maan pyörimisen solmukorjauksen) täsmäsi noin { "15" } nm:n tarkkuudella todellisella SP3-tuotteella, aiemmin noin { "5.5" } cm ennen korjausta

seg-9762cf428435 = Navigointiviestien koodaimet GPS LNAV:n lisäksi (GPS CNAV, Galileo I/NAV ja F/NAV)

seg-9b703b9607d8 = GPS CNAV -viestityypit 10/11/30, Galileo I/NAV -sanatyypit 1–5 nimellisillä parillisilla/parittomilla sivuilla ja Galileo F/NAV -sivutyypit 1–4: ICD-kenttien pakkaus ja kvantisointi, CRC-24Q, nopeuden 1/2 K={ "7" } konvoluutiokoodaus (G2 käännettynä Galileolle), lohkolomitus ja synkronointikuviot, vastaavilla testidekoodereilla

seg-7939b210e83c = Sisäinen edestakainen kierto ja ICD:n tunnetut vastaukset; kolmannen osapuolen dekooderia ei ole ajettu (RTKLIB/GNSS-SDR-testiympäristö, joka lukee KSHANA_NAVMSG_ORACLE_JSON, on datarajattu). MODELLED

seg-5ce7cd3d6011 = IONEX-globaalin ionosfäärikartan lukija ja interpolointi todellisella CODE GIM:llä

seg-502656556ddf = IONEX { "1.0" } -lukija (otsake, kiinteäsarakkeiset I5-arvot, TEC- ja RMS-kartat, absoluuttiset epookit, puuttuvat arvot) bilineaarisella paikkainterpoloinnilla, muodon lähimmän / peräkkäisen / pyöritetyn kartan aikainterpoloinnilla (yhtälöt 1–3) ja ohutkuorisella vinolla TEC:llä

seg-1575dc4cfb4a = CODE GIM:n painetut arvot (täsmälleen jokaisessa solmussa; kartta haetaan testin aikana, ei sisällytetä mukaan, koska sen lisenssiä ei ole vahvistettu) ja riippumaton Python-stdlib-uudelleentoteutus IONEX { "1.0" } -interpolointikaavoista, arkistoituna fikstuurin kanssa (kynnykset ennalta rekisteröity e4d8b1f, { "1e-9" } TECU). Kolmannen osapuolen tarkistus (B6, ennalta rekisteröity, ensimmäinen ajo): RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, ajettu erillisenä työkaluna) täsmää { "6885" } kyselypisteessä funktion IonexFile::vtec_at kanssa tarkkuudella { "3.6e-13" } TECU molemmissa interpolointitiloissa { "1e-5" } TECU:n kynnystä vasten. Datarajattu: CODE GIM haetaan testin aikana, SHA-lukittuna; RTKLIB lukee koko tiedoston, koska sen getindex hylkää leveysastealueen rajauksen. tests/fixtures/ionex_code_gim/fetch.sh hakee sen ja tarkistaa SHA-256:n, testi epäonnistuu kaikilla muilla tavuilla, ja run_rtklib.sh on dokumentoitu toistopolku (vaatii verkkoyhteyden). Ylennetty VALIDATED-tasolle omistajan päätöksellä datarajatun todisteen perusteella (2026-10-13)

seg-974d8c1f7876 = Koodin Hatch-kantoaaltotasoitus todellisilla RINEX-havainnoilla

seg-f26b5da0f52e = Hajaantumaton Hatch-suodatin (ionosfäärivapaa koodi ionosfäärivapaan kantoaallon kantamana, ikkuna N epookkia, uudelleenkäynnistys lukituksen menetyksessä, geometriavapaassa hypyssä tai aukossa) tarkan yhden pisteen paikannuksen kokoonpanossa

seg-fac84cb9b256 = LÖYDÖS julkaistua ITRF2020 WTZR -koordinaattia vasten: ennalta rekisteröidyt kynnykset (tasoitettu mediaani ja p95 enintään { "0.6" } x raaka; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) eivät täyttyneet, suhteet { "0.718" } ja { "0.923" }; jäljelle jäävä metrin tason virhe on vinoumamainen (C1C-koodivinouma, antenni, vuorovesi, pitkäjaksoinen monitie-eteneminen), ei sitä valkoista kohinaa, jonka tasoitus poistaa. MODELLED: suodattimen tilastot tarkistetaan sisäisesti

seg-2eec513ae8c8 = RTK-kaksoisdifferenssit LAMBDA-kokonaislukuratkaisulla todellisilla RINEX-havainnoilla

seg-6571676bf918 = Lyhyen peruslinjan suhteellinen paikannus todellisesta kaksitaajuuksisesta GPS-koodista ja kantoaallon vaiheesta: kaksoisdifferenssit korkeinta satelliittia vasten täydellä kovarianssillaan, float-Kalman-suodatin peruslinjalle ja yksittäisdifferenssien epävarmuuksille hyppyjen uudelleenalustuksella, LAMBDA-kokonaislukujen pienin neliösumma ratio-testillä ja peruslinja ehdollistettuna kiinteisiin kokonaislukuihin

seg-e50c5d4b65c7 = WTZR:n ja WTZZ:n julkaistut ITRF2020-koordinaatit (IGN ITRF2020_GNSS.SSC, ratkaisu { "3" }, RINEX-antennikorkeuksilla), jotka antavat vertailuperuslinjan; kynnykset ennalta rekisteröity tiedostossa tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md ennen koodin kirjoittamista. Vain lyhyt peruslinja: ionosfäärin tai troposfäärin kaksoisdifferenssejä ei mallinneta

seg-f9aa0c529393 = PPP:n vastaanottimen kellon aikaratkaisu IGS:n lopullista asemakelloa vasten

seg-83ad9e893db9 = Staattisen float-PPP-suodattimen estimoima vastaanottimen kello todellisella kaksitaajuuksisella GPS-koodilla ja -vaiheella IGS:n lopullisilla radoilla ja kelloilla: ajansiirto vastaanottimelta IGS-aikaan, PPP:n ionosfäärivapaa aikaratkaisu.

seg-91a882dd71e8 = IGS:n lopullinen yhdistetty kello asemalle WTZR (AR-tietueet IGS0OPSFIN_20250550000_01D_05M_CLK, SHA-256 d19f3d45...993d, usean analyysikeskuksen verkkoratkaisujen yhdistelmä; IGS-tuotteet, vapaa käyttö nimeämällä); kynnykset ennalta rekisteröity tiedostossa xval/ppp-time/PREREGISTRATION.md ennen mitään vertailua; kaikki pitivät ensimmäisellä ajolla. MITÄ EI OLE: yksi asema ja yksi kaksituntinen konvergoitunut ikkuna; IGS-aika, ei UTC(k); vakiopoikkeama sisältää vastaanottimen koodivinoumat ja on rajattu, ei kalibroitu; ei Circular T -jäljitettävyyttä.

seg-a9b2a93401a3 = Float-tarkka pistepaikannus todellisilla RINEX-havainnoilla

seg-cc991ccec112 = Staattinen float-PPP:n laajennettu Kalman-suodatin todellisella kaksitaajuuksisella GPS-koodilla ja kantoaallon vaiheella IGS:n lopullisilla radoilla ja kelloilla: ionosfäärivapaa yhdistelmä, satelliitin ja vastaanottimen antennipoikkeamat (vastaanottimen vaihtelut), kiinteän Maan vuorovesi, vaiheen wind-up, Shapiro-viive, estimoitu zeniitin märkäviive, kaarikohtaiset float-epävarmuudet geometriavapaalla / Melbourne–Wübbena-hyppyjen havaitsemisella

seg-36e7c9286af7 = WTZR:n julkaistu ITRF2020-koordinaatti (IGN ITRF2020_GNSS.SSC, ratkaisu { "3" }, propagoituna sen nopeudella); kynnykset ennalta rekisteröity tiedostossa tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md ennen suodattimen kirjoittamista; kehitys vain samalla paikalla olevalla asemalla WTZZ. Ei mallinnettu: merenpinnan kuormitus, satelliitin PCV, kokonaislukuepävarmuuden ratkaisu

seg-c8d87abed330 = RINEX { "4" } -navigointitiedoston luku

seg-28913a01af00 = RINEX 4.00-4.02 -navigointitiedostot: GPS LNAV:n, Galileo I/NAV:n ja F/NAV:n, BeiDou D1/D2:n ja QZSS LNAV:n <c1/>-tietueet dekoodattuna lähetetyn efemeridin tyyppiin; CNAV-, CNV1-3-, FDMA-, SBAS-, STO-, EOP- ja ION-tietueet ohitetaan seuraavaan tietueotsakkeeseen; tietue, jonka otsake nimeää toisen satelliitin, tai katkaistu tietue hylätään

seg-687b3b159691 = IGS:n saman päivän RINEX { "3" } -yhdistetty lähetetty tiedosto (julkaistu data, kirjoitettu eri tiedostogeneraattorilla samoista lähetetyistä viesteistä); kynnykset ennalta rekisteröity tiedostossa tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) ennen ensimmäistä ajoa

seg-278ca396127a = RINEX { "4" } -havaintotiedoston luku

seg-e0883aa933eb = RINEX 4.0x -havaintojen otsakkeet (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; selitteet sovitettu sarakkeisiin 61–80 versiosta { "4" } alkaen) ja epookkitietueet

seg-971fb1203a6d = Muotoyhteensopivuus todellisella julkaistulla RINEX { "4.00" } -tiedostolla (takaisin luetut arvot ovat yhtä kuin tiedoston painetut literaalit) ja määrittelystä johdetulla otsakkeella; riippumatonta lukijaa ei ajettu, joten MODELLED

seg-33e5c74720ff = BeiDou GEO:n lähetetty satelliittipaikka

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } geostationaarisen satelliitin paikka lähetetystä efemeridistä (inertiaalin kaltainen koordinaatisto, sitten Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valinnainen NavParseOptions-tyypin kentän include_beidou_geo kautta, joten oletuslukija ohittaa yhä GEO:t

seg-06d500099814 = Ennalta rekisteröity (7aa264b, 110fef9) IGS MGEX -tarkkaa rataa vasten GEO:illa; sitä rakentaneesta istunnosta ei ollut saatavilla sellaista tuotetta, joten vertailu on kesken ja rivi on MODELLED (tarkistettu vain julkaistuja nimellisiä GEO-paikkoja vasten)

seg-559814996a4c = SP3-tarkan kellon interpolointi

seg-8e7a0dbd1755 = Satelliitin kellopoikkeama taulukoitujen SP3-kellosolmujen välillä lineaarisella interpoloinnilla kahden ympäröivän kelvollisen solmun yli (RTKLIBin pephclk-malli; huonon kellon merkkiarvo ohitetaan) ja samat solmut syötettynä tarkkojen tuotteiden ketjuun RINEX-kellon vastaavina tietueina

seg-1f4f0f841802 = IGS:n lopullinen { "30" } s satelliittikellojen yhdistelmä (IGS0OPSFIN 30S CLK, 2025-02-24): julkaistut kelloestimaatit kyselyhetkillä, ei interpoloitu SP3:sta; kynnykset ennalta rekisteröity tiedostossa tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md ennen ensimmäistä ajoa (RMS { "0.15" } ns, p95 { "0.30" } ns, solmun mediaani { "1e-12" } s, erottelu 2x)

seg-71f48628ebb2 = Kantoaaltovaiheeseen perustuva tiukasti kytketty GNSS/INS float-epävarmuuksilla

seg-5a156aa81275 = Virhetila-EKF { "15" } INS-tilan, kaksitilaisen vastaanottimen kellon ja yhden float-kantoaaltoepävarmuuden yli seurattua satelliittia kohti; pseudoetäisyys, kantoaallon vaihe ja valinnainen etäisyysnopeus SGP4 Walker -tähdistöstä (valon kulkuaika ja Sagnac), Klobuchar- ja Saastamoinen/Niell-korjaukset sovellettuna silmukassa suodattimen omassa paikassa; aikaerotettu kantoaaltohyppyjen havaitseminen satelliittikohtaisella kynnyksellä, jota nopeuden epävarmuus levittää; epävarmuuden uudelleenalustus hypyissä ja uudelleenhankinnassa

seg-00576e8c1032 = Sisäinen johdonmukaisuus: mittaukset synteettisesti tuotetaan suodattimen käyttämistä malleista (χ² NEES/NIS siemenluvuilla, kohinaton konvergenssi, hyppyjen injektointi). MODELLED; todellisia vastaanotindatoja tai kolmannen osapuolen suodatinta ei verrata

seg-7d644516b1ec = GNSS/INS-paketit meri-, rautatie- ja ilmailukäyttöön tiukan kytkennän valinnalla

seg-cbb03a8baf73 = Kolme gnss-ins-skenaariota liikeratakirjastossa (alus, joka kiemurtelee nopeudella { "8" } m/s viiden minuutin katkolla; juna kahden satelliitin leikkauksen ja tunnelin läpi; ilma-alus, jonka katko kattaa 25 asteen kallistetun käännöksen) ja paketin valinnainen [tight]-taulukko: pseudoetäisyydet SGP4 Walker -tähdistöstä yhdistetään suljetun silmukan navigaattorilla, nimellisesti jokainen maskin yläpuolella oleva satelliitti ja heikentyneenä korkeimmat muutama

seg-273c14256d4c = Sisäinen: kunkin paketin laatumittarit omaa totuuttaan vasten sekä löyhä/tiukka-vertailu identtisillä syötteillä. MODELLED; auditoinnin NaveGo-vertailua ei ole ajettu

seg-f4dab73c4eda = Kytketty pseudoetäisyys-PNT-suodatin vinoumatilalla ja 3D-laajennus fuusiopaketissa

seg-742b60089361 = Yksi pinottu Kalman-suodatin paikan, nopeuden, kellon vaiheen ja taajuuden yli, jota syötetään paikan ja kellon kytkevillä pseudoetäisyyksillä (Joseph-muotoiset päivitykset, jotka kantavat ristikovarianssin); 1-DOF-variantti, jota on laajennettu vakiokiihtyvyysmittarin vinoumatilalla ja jota fuusiopaketti ajaa kohdassa [coupled]; sekä 3D:n 8-tilainen versio näkölinjariveillä

seg-9558d7aad3af = Sisäinen johdonmukaisuus: totuus simuloitu suodattimien omista malleista (χ² NEES Monte Carlo -siemenluvuilla, irrotettu paketti identtisillä antureilla). MODELLED

seg-4a64aa1fe3ca = Löyhästi kytketty GNSS/INS-EKF vipuvarrella KF-GINS-aineistolla

seg-30f503856ac5 = Suljetun silmukan 15-tilainen virhetila-EKF, jota ohjaavat IMU-lisäykset ja jossa GNSS-antennipaikat yhdistetään vipuvarsimallilla H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }], konfiguroituna KF-GINS-YAML-tiedostosta (alkutila ja sigmat, ARW/VRW, Gauss–Markov-vinoumat)

seg-b01d28a09abe = Aineiston julkaistu vertailuliikerata ja KF-GINS C++ -ohjelma (GPL-3.0, commit 8291a93e, ajettu erillisenä työkaluna); kynnykset ennalta rekisteröity tiedostossa xval/kfgins/PREREGISTRATION.md, eikä KF-GINS:ää ajettu tällä datalla ennen tuota rekisteröintiä (tarkistettu sen Results-osiossa). Kaikki kuusi kynnystä pitivät ensimmäisellä ajolla. DATARAJATTU: KF-GINS-demoaineistolla (todellinen Leador-A15 IMU ja RTK GNSS vertailuliikeradalla) ei ole lisenssiä, joten sitä ei sisällytetä mukaan; xval/kfgins/fetch.sh hakee sen testin aikana kunkin tiedoston SHA-256 lukittuna, ja testi epäonnistuu poikkeamassa; toistopolku, joka vaatii verkkoyhteyden, on tiedostossa xval/kfgins/PREREGISTRATION.md. Ylennetty VALIDATED-tasolle omistajan päätöksellä datarajatun todisteen perusteella (2026-10-13)

seg-e6b6c605564c = Testipenkin vienti, jonka lukee simulaattorin liiketiedostojen lukijat (gps-sdr-sim)

seg-a07429aa1998 = Avoimen lähdekoodin GNSS-simulaattorin omille lukijoille annetut testipenkin vientiliiketiedostot palautuvat viedyksi liikeradaksi: NMEA GGA -tiedosto (-g), liike-CSV:n aika/leveysaste/pituusaste/korkeus-leike (-x) ja sen aika/x/y/z-leike (-u), { "6" } gnss-ins-skenaariossa (mukaan lukien meri-, rautatie- ja ilmailupaketit, luettuna simulaattorin 3000 näytteen ylärajaan asti) ja { "2" } paikallaan olevassa. Vain liike; signaalia ei kirjoiteta eikä tuoteta.

seg-07b5f46a900f = MITÄ ULKOISESTI TARKISTETAAN, suppeasti ilmaistuna: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion ja readUserMotionLLH omalla WGS { "84" } llh2xyz-funktiollaan, kutsuttuna tiedoston xval/testbench-gpssdrsim/driver.c kautta (signaalifunktiota ei kutsuta), liike-CSV:n Maahan kiinnitettyjä sarakkeita vasten rivi riviltä, kynnykset ennalta rekisteröity tiedostossa xval/testbench-gpssdrsim/PREREGISTRATION.md ennen mitään ajoa: jokainen näyte luettu kaikissa { "8" } skenaariossa; NMEA pahin { "1.21" } mm (kynnys { "1" } cm); LLH-leike pahin { "0.145" } mm (kynnys { "1" } mm); nelisarakkeinen Maahan kiinnitetty leike tarkka (kynnys { "1" } um, muutos { "1" }); gnss-ins-rivit simulaattorin { "10" } Hz:n ruudukolla tarkkuudella { "2.3e-13" } s. LÖYDÖS (ajo { "1" }, lukittu): otsakkeeton täysleveä CSV ei ole luettavissa valinnalla -u, koska lukijan 100 merkin rivipuskuri jakaa jokaisen 161-merkkisen rivin kahdeksi näytteeksi; docs/TEST-BENCH.md antaa nelisarakkeisen leikkeen. MITÄ EI: skenaarion totuusliikeradan fysiikka; gps-sdr-simin signaalituloste; minkään toisen simulaattorin lukija; mikään vastaanotin.

seg-2db2b9dc3b45 = GNSS/INS-liikeratakirjasto ja CSV-totuuden tuonti

seg-e1fe83c75a6c = Valittavat liikeprofiilit gnss-ins-paketille (suora, figure-8-rata, kaupunkimainen pysähtely, ilma-aluksen nousu ja koordinoitu käännös, kartoitusdrooni), määriteltyinä Euler-nopeus- ja ratakiihtyvyyskomennoilla, jotka suljetaan totuustilaan kinemaattisella IMU:lla (keskeisvoima-, painovoima- ja Coriolis-termit), sekä tuotu CSV-totuus muunnettuna sen toistavaksi IMU:ksi; historiallinen ajo muuttumattomana, kun profiilia ei anneta

seg-30ea002a06a0 = Sisäinen: jäykän kappaleen kinematiikan identiteetit, CSV:n edestakainen kierto ja suodattimen oma kovarianssi. MODELLED (todellista ajolokia ei verrata)

seg-8685fd899e3c = Strapdown-INS-mekanisaatio

seg-ba942e322f8a = Kvaternioasenteinen, WGS-84 NED -strapdown-inertiamekanisaatio (coning/sculling-kompensoitu), joka propagoi navigointitilaa (Δθ, Δv) -lisäyksistä

seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez ym., LGPL-3) ajettuna Octavella, riippumaton julkaistu INS-työkalupakki, jota ohjaa identtinen (Δθ,Δv)-lisäysvirta. Asenne täsmää bitti bitiltä (samat NED- / skalaari ensin -kvaternio- / Maan nopeus- / kuljetusnopeuskonventiot); nopeus/paikka täsmäävät kahta dokumentoitua eroa lukuun ottamatta: pystysuoran poikkeaman pohjoinen painovoimatermi, jonka NaveGo sisältää ja kshana jättää suunnitellusti pois (luotiviivapainovoima; täsmäsi Grovesin suljettuun muotoon joka numerolla, järkevyyslattian assertilla), sekä O(dt²)-integraattorierot; nämä eivät ole mekanisaatiovirheitä

seg-d1a5c8e7ca74 = Painovoimakentän funktionaalin synteesi (painovoima-avusteinen / GNSS-vapaa navigointikartta)

seg-8336eb12eb7b = Pallofunktiopainovoiman suuruus + häiriö (mGal) mistä tahansa ICGEM .gfc -mallista; GRS80:n normaalipainovoima

seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) Somiglianan normaalipainovoima + julkaistut γ_e/γ_p; todellinen ICGEM EGM2008 -kenttä

seg-86f9186bb884 = Maa–Kuu CR3BP { "9" }:{ "2" } NRHO CAPSTONEn lentämää rataa vasten

seg-d4127cf241f3 = Ympyräratainen rajoitettu { "9" }:{ "2" } L2:n eteläinen lähes suoraviivainen haloperrata, jonka cr3bp::differential_correct_halo korjaa (Gatewayn ja CAPSTONEn rataperhe), verrattuna keskimääräisen geometrian (jakso, perilunen säde, apolunen säde) osalta rataan, jonka CAPSTONE todella lensi. Mittaus siitä, kuinka hyvin CR3BP-jäsen kuvaa todellista rataa; CR3BP-rata ei ole efemeridimallin rata, eikä sitä verrata epookki epookilta

seg-e0cc33dfb10b = Mitattu JPL Horizonsin rekonstruoitua CAPSTONE-efemeridiä vasten (NAIF -1176, CAPSTONE_merged, Kuun keskipisteinen ICRF, 2023-03-01..31 { "10" } min:n välein), arkistoitu tavu tavulta (tests/fixtures/capstone_horizons/, NOTICE.md), ennalta rekisteröity { "4e868170" } ennen sen hakemista, mittauksena kynnyksin keskimääräisestä geometriasta. Ei validointi: CR3BP jättää pois Auringon, Kuun eksentrisyyden ja CAPSTONEn tekemän ratojen ylläpidon, joten kynnykset kuvaavat, kuinka edustava mallirata on, eivät tarkkuutta. Tulokset: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

seg-c866a5bd4318 = CR3BP:n pyörivän koordinaatiston tilat kuvattuna Kuun keskipisteiseen ICRF:ään DE440:n Maa–Kuu-linjalla

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf kuvaa dimensiottoman Maa–Kuu CR3BP:n pyörivän koordinaatiston tilan Kuun keskipisteisen ICRF:n paikaksi ja nopeudeksi hetkellisellä Maa–Kuu-linjalla (pituusyksikkönä Maa–Kuu-etäisyys, aikayksikkönä käänteinen kiertonopeus, koordinaatiston täysi kulmanopeus mukaan lukien sen tason ulkopuolinen nopeus Kuun kiihtyvyydestä), käänteisellä funktiolla from_moon_centred_icrf, ja cr3bp::to_moon_centred_icrf_de440 lukee geosentrisen Kuun tilan DE440 SPK:sta. Se kuvaa tiloja; se ei tee CR3BP-radasta efemeridimallin rataa

seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.3.0" } kautta) sxform kahden vektorin dynaamiselle koordinaatistolle (ensisijainen +X pitkin Kuun paikkaa Maan suhteen, toissijainen +Y pitkin sen nopeutta, de440s), sovellettuna SPICEn omasta Kuun tilasta rakennettuun dimensionaaliseen pyörivään tilaan, erillisellä ohjelmalla, joka ei kutsu mitään Kshana-koodia (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Ennalta rekisteröity 2313eb1b, muutettu ennen mitään ajoa tiedostossa d5ef79b3 sisältämään koordinaatiston tason ulkopuolisen kulmanopeuden (ilman sitä nopeus olisi enintään { "8e-2" } m/s pielessä). Vain muunnoksen Library-tarkistus. Tulokset: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

seg-d543e3e84f36 = Aurinkokunta-tyyppi JPL-kernelilla (planetary_kernel_path)

seg-e8a96f29afc7 = <c1/>-tyyppi asetuksella planetary_kernel_path: jokainen raportoitu kappale, jonka oman NAIF-koodin SPK sisältää, ottaa heliosentrisen J2000-paikkansa ja -nopeutensa kernelistä moottorin oman lukijan kautta (selite KERNEL); linkki, jonka kumpikin pää on kernelissä, lasketaan sen pohjalta; barycentrejä ei koskaan korvata planeetalla, ja jokainen muu kappale pysyy analyyttisenä omalla selitteellään; raportti saa kernel-lohkon (polku, SHA-256, kernelistä otetut kappaleet ja linkit) vain, kun asetus on käytössä. Tiedostolla de440s.bsp ne ovat Merkurius, Venus, Maa ja Kuu

seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.3.0" } kautta) spkezr heliosentriset tilat koko de440s.bsp-tiedostolla, erillinen ohjelma, joka ei kutsu mitään Kshana-koodia (tests/fixtures/solar_system_kernel/, NOTICE.md); moottori lukee bitti bitiltä de440s-leikkeitä. Ennalta rekisteröity f8e946ea. Kytkennän Library-tarkistus: DE440:ää itseään ja analyyttisiä kappaleita ei validoida tässä. Tulokset: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

seg-7f3d53b4e8d1 = Porkchop DE440-efemeridillä

seg-bd813d7e0b58 = maneuver::porkchop_kernel: laukaisupäivä x saapumispäivä -pyyhkäisy lähtö-C3:lle (km²/s²) ja saapumisen V-infinity:lle (km/s) yhden kierroksen myötäkulkuisella Lambert-ratkaisijalla ja { "0.5" } asteen kollineaarisuusvartijalla, minkä tahansa kahden NAIF-kappaleen heliosentrisillä J2000-tiloilla, jotka paketin oma lukija lukee JPL DE440 SPK:sta. Yksi kierros, myötäkulkuinen, ei laukaisulaite- tai saapumisrajoitteita: pyyhkäisy, ei tehtäväsuunnitelma

seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.3.0" } kautta) heliosentriset tilat tiedostolla de440s.bsp ja pykep { "3.0.1" } lambert_problem (ESA, C++ kep3 -ydin, MPL-2.0), riippumaton Lambert-ratkaisija, ajettu erillisenä ohjelmana, joka ei kutsu mitään Kshana-koodia (tests/fixtures/porkchop_de440/, NOTICE.md); moottori lukee bitti bitiltä de440s-leikkeen. Ennalta rekisteröity 2d857fb1. Pyyhkäisyn Library-tarkistus. Tulokset: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

seg-b1401bed5da8 = Impulsiivinen siirtoradan optimoija DE440-efemeridillä

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: yhden kierroksen ballistisen kahden impulssin siirtoradan lähtö- ja saapumispäivät, jotka minimoivat lähtö-C3:n tai saapumisen V-infinity:n tyypin I tai tyypin II sisällä, jatkuvana optimina (2 vuorokauden ruudukko molempien ikkunoiden yli, sitten 2D Nelder–Mead) DE440 SPK:n heliosentrisillä tiloilla. Päivämääräoptimoija yhdelle osuudelle, ei tehtäväsuunnitelma: ei laukaisulaite-, pysäköintirata-, syväavaruuskäänne- eikä monikierrosvaihtoehtoja

seg-6c695aef043b = Riippumaton optimoija: NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.3.0" } kautta) heliosentriset tilat samalla de440s-leikkeellä, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) ja SciPy { "1.18.1" } Nelder–Mead, kutsumatta mitään Kshana-koodia. NASAn Maa–Mars-käsikirja (MIDAS, efemeridiä ei ilmoitettu, 2 vuorokauden päiväruudukko) on toissijainen julkaistu vertailu eikä määritä tilaa

seg-93f3cdbb7297 = Monikierroksinen Lambert-siirtoratkaisija

seg-995a6a995b78 = Jokainen Lambertin ongelman ratkaisu enintään kolmella täydellä kierroksella (maneuver::lambert_multirev: yhden kierroksen ratkaisu, sitten kunkin kierroslukumäärän vasen ja oikea haara, Izzo { "2015" }), reunanopeuksilla v1 ja v2, myötä- ja vastapäiväisille siirtoradoille, kanonisissa ja heliosentrisissä SI-yksiköissä, mukaan lukien siirtoradat, joiden lentoaika on { "1" } %:n sisällä kierroslukumäärän vähimmäislentoajasta, sekä lähes 180 asteen geometriat. Vain kahden kappaleen ratkaisija (ei häiriöitä)

seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, C++ kep3 -ydin, MPL-2.0), riippumaton kirjasto, ajettu erillisenä ohjelmana skriptillä scripts/gen_lambert_multirev_ref.py; vain sen numeerinen tuloste on arkistoitu. Ennalta rekisteröity a75de851 (tapausjoukko, kynnykset, tulossääntö) ennen mitään vertailua; vertailu tuotettiin uudelleen riippumattomasti ja on tavu tavulta identtinen. Tulokset: docs/design/evidence/lambert-multirev/RESULTS.md

seg-ff9c6140fe1c = Lambertin kahden kappaleen siirtoratkaisija

seg-d8c39ced64b2 = Izzo-2015 yhden kierroksen Lambert-ratkaisija (r1, r2, lentoaika → reunanopeudet) LEO→GEO→heliosentristen siirtoratojen yli, myötä- ja vastapäivään

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT), riippumaton kolmannen osapuolen Lambert-ratkaisija. Yhden kierroksen (M={ "0" }) Lambertin ongelmalla on yksikäsitteinen ratkaisu, joten kirjasto vastaan kirjasto -vastaavuus on aito ulkoinen tarkistus; täsmäsi tarkkuudella < { "1e-4" } m/s (havaittu ~{ "1e-11" }), samanlainen validointi kuin DOP:lla vs. gnss_lib_py

seg-347cece5df63 = Koordinaatistot ja aika-asteikot

seg-5a4bc2c15eaa = IAU 2006/2000A -prekessio-nutaatio, CIO GCRS↔ITRS, karkaussekuntiaika-asteikot

seg-51d28ab9d256 = IAU SOFA / ERFA -vertailuvektorit; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Kaksiosaiset Julian-päivät ja karkaussekunnit Maan kiertoradan aikapolulla

seg-5e859e3aa613 = UTC-kalenteripäivä ja -aika kaksiosaiseksi UTC Julian -päiväksi SOFA dtf2d -konventiolla päiville, jotka päättyvät karkaussekuntiin ({ "86 401" } s pitkiä, { "23" }:{ "59" }:{ "60" }.x kelvollinen), UTC TAI:ksi ja takaisin sekä UT1 UTC:stä TAI:n kautta kaksiosaisilla päivillä alkaen 1972-01-01: aikapolku, jonka SGP4 (Sgp4::propagate_at, mitattuna kaksiosaisesta epookista) ja IAU 2006/2000A Maahan kiinnitetty pyöriminen (sgp4::teme_to_itrs_matrix_eop kaksiosaisella Maan pyörimiskulmalla) ottavat

seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; ERFA-projektin julkaisemat SOFA-algoritmit), riippumaton kirjasto: erfa.dtf2d("UTC"), erfa.utctai ja erfa.taiutc arkistoiduilla hetkillä, ero muodostettu osa osalta kaksiosaisilla päivillä, kynnys { "1e-6" } s lukittu ennen ajoa (ennalta rekisteröity e947e69d). Pahin ero { "9.6e-12" } s (dtf2d) ja { "1.9e-11" } s (utctai, taiutc). Jos jokainen UTC-päivä otetaan { "86 400" } s:ksi tai karkauspäivän osuutta ei skaalata, testi muuttuu punaiseksi. UT1 TAI:n kautta (iauUtcut1) tarkistetaan Earth-orbit path -rivin ERFA-osuudessa. Rajaus: UTC alkaen 1972-01-01; aiempaa ajautuvan nopeuden UTC:tä ei mallinneta

seg-f1c7bc235a6b = Kaksiosaiset Julian-päivät Maan pyörimisen läpi kiertoradan polulla

seg-cee11d4bad08 = Maan pyöriminen kaksiosaisesta UT1 Julian -päivästä kiertoradan polulla, jotta Maahan kiinnitetty paikka säilyttää mikrosekunnin, jonka yksittäinen f64-päivä menettää (noin { "3e-9" } rad lähellä vuotta { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventio, kahdelle osalle), cio::gcrs_to_itrs_matrix_jd2 (CIO GCRS–ITRS-matriisi Maan pyörimiskulmalla kahdesta osasta) ja näiden päälle rakennettuina ja sisäisesti tarkistettuina frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 ja own_jd2_utc, efemeridiskenaarion valinnainen two_part_jd (ECEF-paikka, maanpintajälki ja asemanäkymä; oletuksena pois päältä, muuttumaton) sekä häviöttömät From-muunnokset jd2::Jd2 ja timescales::TwoPartJd välillä. Prekessio-nutaatio ja Cowellin voimamallin epookki pysyvät yksittäisenä f64:nä, missä { "40" } us:n pyöristys on alle { "1e-15" } rad tai selvästi alle analyyttisen Auringon/Kuun efemeridin virheen

seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; ERFA-projektin julkaisemat SOFA-algoritmit), riippumaton kirjasto: gmst82 ja c2t06a arkistoiduilla kaksiosaisilla päivillä, napaliike { "0.1" } ja { "0.3" } kaarisekuntia. Ennalta rekisteröity b10475ee (päivät, kynnykset) ennen kuin funktiot kirjoitettiin ja ennen kuin oraakkeli ajettiin. Sisäiset testit (skenaariovalinta, TEME/ITRF-edestakainen kierto, tyyppimuunnokset) ovat tukevaa itsejohdonmukaisuutta

seg-096df3971f5f = Koordinaatistomatriisit ERFA-vektoreita vasten: IAU { "2006" } bias-prekessio, TEME GCRS:ksi ja CIO-ketju taivaan navan poikkeamilla

seg-731a5ed967b3 = Kolme koordinaatistomatriisia verrattuna alkio alkiolta tai kiertokulmalla ERFA:an mielivaltaisilla epookeilla: precession::precession_matrix (IAU { "2006" } bias-prekessio Fukushima–Williams-kulmilla), nutation::teme_to_gcrs_matrix (TEME GCRS:ksi -kierto P^T N^T Rz(-EE) IAU { "2006" } -prekessiolla, IAU 2000B -nutaatiolla ja päiväntasausten yhtälöllä kahdella johtavalla komplementaaritermillä) ja cio::gcrs_to_cirs_matrix_with_offsets (GCRS CIRS:ksi -kierto IERS-taivaan navan poikkeamilla dX, dY lisättynä mallin CIP X, Y -arvoihin ennen kiertoa, SOFA cookbook -konventio; uusi). Mallivalintoja itseään (2000B-nutaatio TEME-polulla, kahden termin komplementaarisarja) ei validoida, vain niiden toteutus

seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; ERFA-projektin julkaisemat SOFA-algoritmit), riippumaton kirjasto: pmat06; numat(obl06, nut00b) päiväntasausten yhtälöllä funktiosta eect00 (täysi komplementaarisarja), koostettuna P^T N^T Rz(-EE); xys06a sitten c2ixys(X + dX, Y + dY, s). Ennalta rekisteröity 979c1e39 (epookit, poikkeamat ja kynnykset) ennen oraakkelin ajoa. { "1.1e-10" } rad:n TEME-jäännös on kahden komplementaaritermin säilyttämisen ennustettu vaikutus (noin { "3" } mm GNSS-radalla)

seg-4e2fe2e3dabb = Ennen vuotta 1972 oleva UTC (ajautuvan nopeuden aika) kaksiosaisella Julian-päivän aikapolulla

seg-1d086e669f09 = UTC 1960-01-01 – 1971-12-31, jolloin UTC kulki TAI:hin nähden poikkeavalla nopeudella ja siirtyi sekunnin murto-osilla, kaksiosaisella Julian-päivän polulla: TAI - UTC kunkin jakson ajautumataulukosta (timescales::tai_minus_utc_on_date), UTC-kalenteripäivä kaksiosaiseksi UTC Julian -päiväksi päivän pituudella { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC TAI:ksi päivän osuus UTC:stä SI-sekunteihin skaalattuna (jd2::utc_to_tai) ja TAI takaisin UTC:ksi (jd2::tai_to_utc), SOFA dtf2d:n, utctai:n ja taiutc:n mukaisesti. Ennen vuotta { "1960" } TAI - UTC otetaan arvoksi { "0" } (SOFAn arvo; UTC määrittelemätön) ja se on väitteen ulkopuolella. Yksittäinen f64 timescales::tai_minus_utc rajaa yhä arvoon { "10" } s ennen vuotta { "1972" }, eikä sitä katettu

seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; ERFA-projektin julkaisemat SOFA-algoritmit), riippumaton kirjasto: erfa.dtf2d("UTC"), erfa.utctai ja erfa.taiutc arkistoiduilla hetkillä, ero muodostettu osa osalta. Ennalta rekisteröity 23c40661 (hetket, toleranssi ja { "1972" }+-tarkistussumma) ennen moottorin muutosta ja ennen oraakkelin ajoa. Ajautumataulukko on jäljennetty samasta SOFA iauDat -taulukosta, jota oraakkeli käyttää, joten vertailu kattaa muunnoksen aritmetiikan (päivän pituus, UTC:n SI-skaalaus, iterointi), ei itse historiallista taulukkoa

seg-efacec095051 = GLONASSin lähetetty satelliittikello ja lähetetyn radan propagointi

seg-821b9c01b56e = GLONASSin lähetetty satelliittikellon poikkeama -tau_n + gamma_n (t - t_b) satelliittikellosta luetulla ajalla (glonass::GlonassEphemeris::sv_clock_bias_s, poikkeama korjattuna kellon poikkeamalla kahdella kiintopisteiteraatiolla) ja lähetetyn tilavektorin PZ-90 Maahan kiinnitetty paikka propagoituna RK4:llä GLONASS ICD:n liikeyhtälöillä +/-15 min:n sisällä vertailuepookista (GlonassEphemeris::position_ecef), todellisista RINEX { "3" } GLONASS-navigointitietueista. PZ-90.11:stä ITRF:ään ei sovelleta muunnosta (ne täsmäävät senttimetritasolla vuodesta { "2014" } alkaen; RTKLIB ei sovella sellaista), ei kytketty skenaarion tulosteeseen: kirjastofunktio

seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa) geph2clk ja geph2pos, käännettynä C-lähdekoodista erillisessä testiympäristössä (xval/rtklib-glonass), joka lukee saman RINEX-tiedoston RTKLIBin omalla lukijalla, joten jäsennys, merkki -tau_n, yksiköt ja iterointi tulevat verratuiksi kellon ja radan lisäksi. Ennalta rekisteröity e099c42a ennen kuin funktio oli olemassa ja ennen kuin testiympäristö rakennettiin. Molemmat puolet laskevat saman kellon suljetun muodon, joten kellovertailu kattaa toteutuksen, ei kaavaa. Rataintegraattorit eroavat (RTKLIB askeltaa { "60" } s ja sitten jäännös, Kshana yhtä suurilla enintään { "60" } s:n askelilla) ja niin eroavat vakiot (RTKLIB mu { "3.9860044e14" }, Kshana PZ-90.11:n { "3.986004418e14" }); pahin tapaus { "1.1" } mm on tämä ero, kuten ennustettiin ennen ajoa. Rajaus: lähetetty efemeridi voimassaoloaikanaan, ei todellinen rata tai kello (ei vertailua tarkkoihin tuotteisiin)

seg-d3b72a6fbb18 = Yksi Maan kiertoradan polku: SGP4-elementtijoukot GCRS:ään ja ITRS:ään IAU 2006/2000A -ketjulla Maan orientaatioparametreilla

seg-e4eca7205b5e = Propagointi- ja koordinaatistopolku, jonka jokainen reititetty Maan kiertoradan tyyppi jakaa: SGP4-keskielementtijoukko kaksiosaisella UTC-epookilla (sgp4::MeanElementSet, luettu tähdistösuunnittelun elementeistä funktiolla MeanElementSet::from_earth_fixed) propagoituna SGP4/SDP4:llä TEME:en (sgp4::SgpOrbit), sekä TEME -> ITRS- ja GCRS -> ITRS -kierrot IAU 2006/2000A -ketjussa UT1 - UTC:llä ja napaliikkeellä (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, nollaparametriset muodot teme_to_itrs_matrix ja gcrs_to_itrs_matrix). TEME on päivän todellinen päiväntasaaja keskimääräisellä päiväntasauksella, johon päästään GCRS:stä IAU { "2006" } bias-prekessiolla, IAU 2000B -nutaatiolla ja päiväntasausten yhtälöllä

seg-44f28276f859 = Osuus { "1" }: python-sgp4 { "2.24" } (MIT-lisenssi; D. Valladon C++-vertailu-SGP4, koodi, joka tuotti AIAA 2006-6753 -verifiointivektorit), WGS-72, parannettu tila. Osuus { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, SOFA-rutiinit): c2t06a TT:llä funktioista utctai/taitt ja UT1:llä funktiosta utcut1, ja TEME:lle c2t06a . pnm06a^T . rz(-ee06a). Kynnykset lukittu ennen ajoa (ennalta rekisteröity 72ea9eb0). Ilmoitettu: ensimmäinen ajo epäonnistui osuudessa { "2" } hetkellä 2016-12-31T23:{ "59" }:{ "59.5" } yhden sekunnin pyörimisellä (UT1 otettu UTC:n kvasi-Julian-päivästä karkaussekuntipäivänä); moottori korjattiin (jd2::utc_to_ut1) ja toinen ajo täsmää muuttumattomilla kynnyksillä. Napaliikkeen pudottaminen ({ "46" } epäonnistumista) tai WGS-84-vakiot WGS-72:n sijasta ({ "4432" } epäonnistumista) tekevät testistä punaisen. Tämä kolmen osuuden rakenne korvasi päästä päähän -Orekit-vertailun, joka epäonnistui Orekitin SDP4:ssä kun e = { "0" } ja sen IERS { "1996" } TEME:ssä (löydös pysyy lukittuna tiedostossa tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

seg-f650a11458b8 = Etäisyyskoodin suunnittelukompromissi

seg-071e552a7179 = m-sekvenssin/Goldin sivukeilan ja ristikorrelaation rajat, pituus↔epävarmuus

seg-65b7902a2d8f = Julkaistu GPS C/A Goldin ristikorrelaatio (−{ "23.9" } dB); Goldin { "1967" } raja

seg-5ec4c0730280 = GNSS-geometria / DOP (tarkkuuden heikkenemiskerroin)

seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP näkölinjageometriasta kaavalla Q=(HᵀH)⁻¹ paikallisella ENU-jaolla

seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, riippumaton kirjasto, täsmää tarkkuudella { "1e-6" } suhteellisena

seg-1a5623c81b48 = Paikkavirhe geometriasta: RMS-virhe = sigma_UERE x DOP moottorin pienimmän neliösumman paikanteelle

seg-7a94b44a8738 = dop_error_mc::run_geometry ja check: siemenluvulla toistettava Monte Carlo (N = { "20,000" } epookkia geometriaa kohti, sigma = { "1.5" } m, ChaCha8-siemenluku { "36" } + i) moottorin oman iteroidun pienimmän neliösumman paikanteen (pvt::solve_spp, yksikköpainot, ratkaistu todellisesta paikasta) yli tiedoston tests/fixtures/dop/dop_reference.csv { "8" } geometrialla, vertaillen itä-, pohjois-, ylös- ja kellovirheen variansseja, H/V/P-RMS:ää, itä–pohjoinen-korrelaatiota, keskivirheitä ja { "95" } %:n vaakaellipsin sisään osuvaa osuutta sigma^{ "2" } Q:lla, missä Q on orbit::dop-ytimen kovarianssitekijä (orbit::dop_cofactor, sama aritmetiikka) samalla geometrialla

seg-90f18c774d57 = Sisäinen johdonmukaisuus suljettua muotoa vasten: lineaarisessa gaussisessa mallissa pienimmän neliösumman kovarianssi on sigma^{ "2" } (H^T H)^-1 (Kaplan ja Hegarty (toim.), Understanding GPS: Principles and Applications, 2. painos, Artech House, { "2006" }, luku { "7" }). Menetelmä ja toleranssit { "0.36" } -geometriasuunnitelman muistiosta, kohta { "5.2" }, lukittu ennakkorekisteröintiin ennen ensimmäistä ajoa: kukin varianssi { "5" } %:n sisällä ({ "5" } otosvarianssin keskivirhettä kun N = { "20,000" }), kukin RMS { "2.5" } %:n sisällä, itä–pohjoinen-korrelaatio { "0.035" }:n sisällä (5/sqrt(N)), kukin keskiarvo { "5" } keskivirheen sisällä, { "95" } %:n ellipsiosuus { "0.95" } +/- { "0.0077" } ({ "5" } binomiaalista keskivirhettä); negatiivisten kontrollien (PDOP kaksinkertaistettuna; virheet kasvavat kuten 1/sin(korkeuskulma) painottamatonta Q:ta vasten) on epäonnistuttava. MITEN SE KOOSTUU: Q on orbit::dop-ytimen kovarianssitekijä, VALIDATED gnss_lib_py { "1.0.4" } -kirjastoa vasten samoilla { "8" } geometrialla tiedostossa tests/dop_reference.rs (rivi ’GNSS geometry / dilution of precision’); tämä rivi lisää askeleen näistä tekijöistä metreihin moottorin ratkaisijan kautta eikä lainaa sen rivin tilaa. MIKSI MODELLED: mukana ei ole ulkoista aineistoa; vastaavuus osoittaa, että estimaattori ja kohina toteuttavat sigma x DOP -tuloksen oppikirjamallissa, ei että minkään vastaanottimen virhe olisi UERE x DOP, ja sigma_UERE on syöte

seg-9acfde1b57f7 = Geometriatietoinen luottamusluokitus: satelliittigeometria vastaanottimen luottamuspistemäärän rinnalla ja luokka jokaiselle vähennykselle

seg-6138c41e13ff = receiver_trust::geometry: epookkikohtainen satelliittigeometria (hyvä, heikentynyt syillä few-satellites/high-pdop/high-hdop/sky-blocked, tai tuntematon, kun loki ei anna GSV-, NAV-SAT- tai GSA-tietoa) johdettuna raportoiduista korkeus- ja atsimuuttikulmista funktiolla orbit::dop tai otettuna GSA:sta, jolloin selite raportoidaan aina eikä sitä koskaan pisteytetä (good, fair, poor, unknown), sekä HDOP, PDOP, VDOP, satelliittien lukumäärä ja signaalin menetys sanoin; aluksen pistemäärän geometriavalvonta, joka ei vähennä mitään ellei geometria ole huono (suhde max(hdop/4, pdop/6, 5/n_used) yli { "1" }) ja nousee sitten { "15" } pisteen kattoon arvolla { "1.5" }, jota pelkkä geometria ei voi viedä heikentyneen vyöhykkeen alle (katto, nousun loppu ja lattia kohdassa [geometry]; ei hälytystä); luokka jokaiselle vähennykselle (geometry, environment, inconsistency), jossa lukituksen menetys alle { "15" } asteen satelliiteille luokitellaan geometry, näkyvissä mutta seuraamatta olevat satelliitit environment, ja huonon geometrian vähennys, jonka ilmoitettu HDOP on yli max({ "1.0" }, { "25" } % johdetusta HDOP:sta) ilmoitetusta taivaasta, luokitellaan inconsistency

seg-6987737c5fe4 = Sisäinen johdonmukaisuus: luokitus tarkistetaan sen ilmoittamia sääntöjä vasten ja käsin johdettuja suhteita vasten arkistoidun demolokin synteettisillä muokkauksilla, ja ei-muutos-lukitukset pitävät { "0.35.0" } -tulosteet: pistemäärä ei muutu ellei geometria ole huono; selite raportoidaan aina. MIKSI MODELLED: kynnykset on valittu, ei sovitettu (alkuperä kunkin ajon geometry_model-kentässä; IEC 61108-1- ja GPS SPS -luvut sellaisina kuin ne on siteerattu, tarkistettava standardien tekstistä), eikä ole ulkoista nimettyä aineistoa luonnollisesta geometrian heikkenemisestä hyökkäyksiä vasten, jota vasten luokitus voitaisiin validoida. Johdettu DOP käyttää uudelleen orbit::dop-ydintä, VALIDATED gnss_lib_py:ta vasten, jonka tilaa tämä rivi ei lainaa. Geometrialuokka on lausuma taivaasta, ei löydös siitä, ettei hyökkäystä tapahtunut

seg-540420863a5a = Lähetetty ionosfäärimalli (Klobuchar, IS-GPS-200)

seg-fd157c537502 = Klobucharin yksitaajuuksinen L1 viistoionosfäärin ryhmäviive kahdeksasta lähetetystä α/β-kertoimesta

seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c), riippumaton vertailutoteutus käännettynä lähdekoodista; täsmää tarkkuudella < { "1e-4" } m

seg-0af6b1a073ce = RAIM/ARAIM-eheyden tilastollinen ydin (χ² / ei-keskeinen χ² / normaalijakaumat)

seg-224a6c4200cd = Jakaumaydin, jolle jokainen suojaustaso perustuu: hetkellisen vianhavaitsemisen kynnys χ²₁₋ₚfₐ(dof), havaitsematta jääneen tapahtuman epäkeskisyys pbias=√λ ja K_fa/K_md/K_V-ratkaisuerotuskertoimet

seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), riippumaton kirjasto (Cephes/Boost), eri algoritmi kuin Kshanan epätäydellinen gammasarja; täsmää tarkkuudella ≤{ "1e-6" } suhteellisena. Vain ydin. ARAIM MHSS:n P_HMI-budjetin *allokaatiolla* ei enää ole julkaisematonta numeerista oraakkelia: WG-C ARAIM Technical Subgroupin oma työstetty esimerkki tukee nyt erillistä riviä ’ARAIM MHSS protection levels against published reference vectors’, täsmäten vertailun omalla TOL_PL = { "5e-2" } m -arvolla; tämän rivin rajaus on siis tilastollinen ydin ja tuo rivi kantaa allokaation (ks. docs/ARAIM_REFERENCE.md)

seg-03578217425f = SBAS-suojaustaso (DO-229E painotettu LS HPL/VPL)

seg-df640d6c7a5d = DO-229E Appendix J:n painotetun pienimmän neliösumman suojaustasot: D=(GᵀWG)⁻¹ satelliittikohtaisesta korkeus-/atsimuuttikulmasta ja virhebudjetista, vaakavirheellipsin pääakseli ja pystysuuntainen σ, skaalattuna julkaistuilla K-kertoimilla

seg-39aed7b4bffd = RTKLIB SBAS-PL-haarukka: zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, ”DO-229D Appendix J”), ajettu komennolla rnx2rtkp -ws todellisilla EGNOS GEO-PRN120 -viesteillä + todellisella BUTE/Budapest RINEX:llä; riippumaton kolmannen osapuolen toteutus, HPL täsmäsi tarkkuudella < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) vahvisti identtisen konvention. Molemmat oraakkelit pyöristävät K_V→{ "5.33" } vs. Kshanan tarkka Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } (~{ "0.06" } %), joten pystysuuntaa tarkistetaan K-kertoimettomana d_U:na

seg-8f32eb9c8167 = ML-ilmaisimen arviointimittarit (ROC/AUC/sekaannusmatriisi/Pfa-Pmd)

seg-b0d8e1b45bf9 = AUC (Mann–Whitney, tasatilanteet ½), sekaannusmatriisi kynnyksellä, P_d/P_md/P_fa/tarkkuus/tarkkuusaste/F1

seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa ym., JMLR { "2011" }), riippumaton kirjasto, täsmällinen vastaavuus

seg-e7af87ce5e72 = Poikkeamien havaitsemisen pisteytys todellisella avaruusaluksen telemetrialla

seg-9659b33fca5b = ROC AUC + bootstrap-luottamusväli, joka erottaa todelliset nimetyt poikkeamat; läpinäkyvä ilmaisin (toistaa merkinnät)

seg-b4ed67ce7e7e = scikit-learn roc_auc_score OPSSAT-AD-testijaolla (Ruszczak ym. { "2025" }, CC BY { "4.0" }), todellinen OPS-SAT-telemetria

seg-5c3f1057c6cc = Kvanttikompromissin numeeriset ytimet (NNLS / χ²-kaistat / van-Loan Q)

seg-f82113ccb30b = Mitatun ADEV:n NNLS-sovitus, NEES/NIS χ²-johdonmukaisuuskaistat ja kellon van-Loan-diskreetin prosessikohinan (holdover-rullaus) kovarianssi, kompromissimoottorin laskennallinen selkäranka

seg-823da1deb3af = scipy { "1.17.1" }: optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q täsmällinen, χ² <{ "5e-4" } käyttöasteilla. Vain ytimet; laitesuorituskykyluvut pysyvät mallinnettuina (seuraava rivi)

seg-6f3099e7562c = Geomagneettinen vertailukenttä (IGRF-14-synteesi)

seg-e9534723cb34 = IGRF-14-pääkentän pallofunktiosynteesi: X/Y/Z/F-komponentit, deklinaatio ja inklinaatio, syöttäen magneettisen anomalian vaihtoehtoisen PNT:n kerrosta

seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT), IAGA-VMOD:n puhtaasti Pythonilla tehty IGRF-vertailutoteutus, joka toimittaa viralliset IGRF14.shc-kertoimet (IAGA 14. sukupolvi, Zenodo 10.5281/zenodo.14012302); riippumaton kolmannen osapuolen koodikanta, joka laskee yksikäsitteisesti määritellyn IGRF-14-kentän, täsmäsi globaalilla ruudukolla

seg-cb3fea409de7 = Havaitsemistilastot: gaussinen AUC ja pienin havaittava vika

seg-ca677becb465 = Analyyttinen binormaalinen ROC AUC = Φ(μ/(σ√{ "2" })) ja pienin havaittava vika σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), joka tukee kvanttivika- ja poikkeamailmaisimia

seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa ym., JMLR { "2011" }), molemmat BSD-3-Clause, riippumattomia kirjastoja, jotka laskevat samat yksikäsitteisesti määritellyt gaussisen hännän / AUC-suureet, täsmäten A&S-erf-lattiaan (~{ "7e-8" }). Niiden päälle rakennettu kvantti vs. klassinen -etu pysyy MODELLED-tasolla

seg-1ed12110fb74 = Järjestystilastojen ydin (Kendall-τ / Dirichlet / persentiili)

seg-0fb003404a5b = Järjestyskorrelaation ja uudelleenotannan ytimet kestävyyden päätösepävakauden tutkimuksen alla: Kendall τ-b, Dirichlet-keskiarvo, kilpailujärjestys ja persentiililuottamusvälit

seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause), riippumattomia toteutuksia (merge-sort τ) yksikäsitteisesti määritellyistä järjestystilastoista, täsmäten tarkkuudella { "1e-12" }. Näiden ytimien päälle rakennettu päätösepävakauden tutkimus pysyy MODELLED-tasolla

seg-fdd2ba203d5b = MCDA-prioriteettien johtamisen ydin (AHP-ominaisvektori / johdonmukaisuussuhde)

seg-d01c155fbddf = Analytic Hierarchy Processin prioriteettipainot = resiprookkisen parittaisen vertailumatriisin normalisoitu pääominaisvektori (Perron) potenssi-iteraatiolla, Saatyn johdonmukaisuusindeksillä / johdonmukaisuussuhteella ja CR<{ "0.10" } -hyväksymisportilla

seg-d1947f2f2b3b = Saatyn ({ "1980" }) kanoninen satunnaisindeksitaulukko (RI({ "5" })={ "1.12" }) toistettuna täsmälleen + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) riippumattomana ominaisratkaisijana, joka laskee saman yksikäsitteisesti määritellyn Perronin ominaisvektorin/ominaisarvon, täsmäten tarkkuudella <{ "1e-9" }. Tämän ytimen päälle rakennettu Pareto / herkkyys / MAUT-päätöskerros pysyy MODELLED-tasolla (WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE-aggregaattorit validoidaan erikseen ulkoisesti, ks. alla olevat rivit)

seg-73e933220afb = MCDA:n painotetun aggregoinnin ytimet (WSM / WPM)

seg-c436cdc991a2 = Weighted Sum Model (min–max-normalisoitu additiivinen aggregaatti + järjestys) ja Weighted Product Model (summanormalisoitu, kustannukselle käänteisluku, multiplikatiivinen aggregaatti), kaksi arvoaggregoinnin kompromissitutkimuksen pisteyttäjää

seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization), riippumaton, laajasti käytetty kolmannen osapuolen Python-MCDA-kirjasto, joka laskee samat yksikäsitteisesti määritellyt painotetut aggregaatit; täsmää tarkkuudella <{ "1e-9" }. Uudelleentuotettavissa offline-tilassa hakemistoilla tests/fixtures/mcda_wsm/ ja tests/fixtures/mcda_wpm/. Roskaa sisään, roskaa ulos syötteille; herkkyys-/robustiuskerros pysyy MODELLED-tasolla

seg-f00bdb66a052 = MCDA:n etäisyys ihanteeseen -järjestys (TOPSIS)

seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution: min–max-normalisointi, painotetut positiiviset/negatiiviset ihanneratkaisut, suhteellinen läheisyys Cᵢ = d⁻/(d⁺+d⁻) ja järjestys

seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization, riippumaton kolmannen osapuolen MCDA-kirjasto, joka laskee samat yksikäsitteisesti määritellyt läheisyyskertoimet; täsmää tarkkuudella <{ "1e-9" }. Uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mcda_topsis/generate_topsis_reference.py

seg-ef33d848c985 = MCDA:n kompromissijärjestys (VIKOR)

seg-cf879fb770f2 = VlseKriterijumska Optimizacija: ryhmähyöty Sᵢ, yksilöllinen katumus Rᵢ ja kompromissi-indeksi Qᵢ strategiapainolla v={ "0.5" }, pienempi-on-parempi-järjestyksellä

seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) – riippumaton kolmannen osapuolen MCDA-kirjasto, joka laskee saman yksikäsitteisesti määritellyn vaihteluvälillä normalisoidun S/R/Q-aggregaation; täsmäytys tarkkuuteen <{ "1e-9" }. Uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mcda_vikor/generate_vikor_reference.py

seg-790176ba8196 = MCDA-ohittavuuden nettovirtajärjestys (PROMETHEE II)

seg-b25cedf6da6e = Preference Ranking Organization METHod – pareittainen preferenssi-indeksi kuudella standardilla yleistetyn kriteerin muodolla, positiiviset ja negatiiviset ohittavuusvirrat sekä täydellinen nettovirtajärjestys (tavallinen kriteeri validoitu)

seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') – riippumaton kolmannen osapuolen MCDA-kirjasto, joka laskee saman yksikäsitteisesti määritellyn nettoohittavuusvirran; täsmäytys tarkkuuteen <{ "1e-9" }. Uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mcda_promethee/generate_promethee_reference.py. Kynnysarvoilla varustetut (q/p/σ) preferenssimuodot palautuvat samaan yleistetyn kriteerin algebraan, ja niiden ominaisuudet tarkistetaan edelleen

seg-72248291c388 = MCDA-ohittavuuden valintaydin (ELECTRE I)

seg-a40e985d369d = ELimination Et Choix Traduisant la REalité – konkordanssi- ja diskordanssimatriisit, konkordanssin ja ei-veton dominanssirelaatio sekä ohittavuuden valintaydin (kaikki hyötykriteerejä, summalla normalisoidut painot, yksi yhteinen asteikko)

seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) – riippumaton kolmannen osapuolen monikriteeripäätöskirjasto, joka laskee saman yksikäsitteisesti määritellyn konkordanssin, diskordanssin, dominanssin ja ytimen; täsmäytys alkio alkiolta tarkkuuteen <{ "1e-9" }. Uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mcda_electre/generate_electre_reference.py. Kynnysten ĉ/d̂ valinnat ovat analyytikon syötteitä (herkkyysanalyysi pysyy tasolla MODELLED)

seg-95942c6a2689 = MCDA-aggregointiytimet (WASPAS / MOORA)

seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (lineaarisesti normalisoitu konveksi yhdistelmä λ·WSM+({ "1" }−λ)·WPM arvolla λ={ "0.5" }) ja MOORA-suhdejärjestelmä (vektorinormalisoitu painotettu hyötysumma miinus painotettu kustannussumma) – vakautettu arvoyhdistelmä ja etumerkillinen suhdejärjestelmän pisteytin

seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA ratio system, vector normalisation) – riippumaton, laajalti käytetty kolmannen osapuolen Python-MCDA-kirjasto, joka laskee samat yksikäsitteisesti määritellyt aggregaatit; täsmäytys tarkkuuteen <{ "1e-9" }. Uudelleentuotettavissa offline-tilassa hakemistoilla tests/fixtures/mcda_waspas/ ja tests/fixtures/mcda_moora/. Roskaa sisään, roskaa ulos syötteiden osalta; herkkyys- ja robustisuuskerros pysyy tasolla MODELLED

seg-7de67fedc1da = MCDA-suhteellinen järjestys (COPRAS)

seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment – sarakesummalla normalisoitu hyötymerkitys S⁺ sekä käänteiskustannusmerkityksen termi, suhteellinen merkitys Q ja hyötyaste U = Q/max Q (paras vaihtoehto = { "1" })

seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) – riippumaton kolmannen osapuolen MCDA-kirjasto, joka laskee saman yksikäsitteisesti määritellyn COPRAS-suhteellisen merkityksen ja hyödyn. pyDecision on valittu tarkoituksella: pymcdm { "1.4.0" } -kirjaston COPRAS supistuu algebrallisesti triviaaliksi lausekkeeksi S⁺+S⁻, eikä se ole uskollinen vertailu, kun taas pyDecision toteuttaa kanonisen lausekkeen Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Täsmäytys tarkkuuteen <{ "1e-9" }; uudelleentuotettavissa offline-tilassa tiedostolla tests/fixtures/mcda_copras/generate_copras_reference.py

seg-bdb2917a2520 = CUSUM-muutoksenhavaitsemisen viive ja ARL

seg-302f5db625df = Taulukkomuotoisen CUSUM-ilmaisimen pahimman tapauksen havaitsemisviive (⌊h/(z−k)⌋+{ "1" }) ja hallinnan ulkopuolinen keskimääräinen ajopituus, joita käyttävät ajoituksen suojaustason ja harhautuksen monitorit

seg-691a506ce13f = Julkaistu taulukkomuotoinen CUSUM-ARL: Siegmundin ({ "1985" }) Brownin liikkeen approksimaatio (Hawkins & Olwell { "1998" }, yhtälö { "3.7" }), ristiinankkuroitu Montgomeryn teoksen Introduction to Statistical Quality Control (Wiley) ARL-taulukoihin arvoilla k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministinen viive täsmää tarkasti ensiläpäisyoraakkeliin. Koottu TPL-raja pysyy tasolla MODELLED

seg-d923a77bd31a = Kellon holdover-vaiheen varianssi ja kynnyksen käänteisfunktio

seg-4fafaf5f919d = Holdover-vaiheen vaihevirheen varianssin kasvu q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 ja sen monotoninen käänteisfunktio aikavirheen holdover-kynnykseksi

seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm laskee Van-Loanin { "1978" } diskreetin prosessikohinan Q₀₀ = ∫₀ᵗ ΦQcΦᵀds Padé-skaalaus-ja-neliöinti-menetelmällä laajennetusta matriisista, jonka koko on { "6" }×{ "6" } – riippumaton reitti, joka ei koskaan näe kshanan polynomikertoimia; lisäksi optimize.brentq kääntää saman monotonisen käyrän kshanan bisektiota vasten. Luokkakohtaiset punaisen kohinan lattialuvut (ClockClass) pysyvät tasolla MODELLED

seg-eb3cd9e92d8d = Käänteinen Simpson-monimuotoisuusydin

seg-244d57819f2b = Tehokas arkkitehtuurinen monimuotoisuus = käänteinen Simpson / Hillin kertaluvun 2 luku 1/Σpᵢ² riippumattomuusryhmäkohtaisten lähdelaatujen yli (kestävyyspisteytyksen monimuotoisuustermi)

seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald ym., BSD-3-Clause) – riippumaton kolmannen osapuolen kirjasto, joka laskee yksikäsitteisesti määritellyn käänteisen Simpson-indeksin; toistettu tavu tavulta. Sen päälle rakennettu DHS-RPCF-pisteytyskehys (painot/tasot) pysyy tasolla MODELLED

seg-c14b8fe46517 = Atsimuutista riippuva horisonttimaski: näkyvä joukko, atsimuutti ja korkeuskulma sekä DOP maskin alla

seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: satelliitin geodeettinen (WGS-84) atsimuutti ja korkeuskulma maa-asemalta, atsimuutti/korkeuskulma-maskitaulukko, joka interpoloidaan lineaarisesti atsimuutin suhteen kiertäen kohdassa { "360" } astetta, näkyvä joukko el >= max(mask_deg, mask(az)) sekä tämän joukon yhteisen kellon DOP ja ENU-ja-kello-kofaktorimatriisi (ytimen, jonka varassa orbit::dop on). Näin [skyline]-osio ratkaisee näkyvyyden skenaariolajeissa gnss-sim, jamming, leo-pvt, leo-pass ja nmea-scenario sekä maa-aseman user_site kanssa lajeissa orbit ja integrity

seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): TopocentricFrame WGS-84 OneAxisEllipsoid -pinnalla katselukulmia varten ja ElevationMask taulukkoa kohti; ajaa xval/orekit-skyline/OrekitSkyline.java sitoutetuilla Maan kiinteän koordinaatiston tiloilla (etenemistä ei verrata), ja gnss_lib_py { "1.0.4" } (wheel-metatiedot MIT) get_dop laskee DOP:n sekä Orekitin näkyviksi toteamien joukkojen ENU-ja-kello-DOP-matriisin. Ennakkorekisteröity (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) ennen kuin kumpaakaan oraakkelia ajettiin vertailusyötteillä; Orekitin lineaarinen kiertävä interpolointi varmistettiin etukäteen synteettisellä koetinkokeella. Laajuus: taulukkomaskit, geodeettiset katselukulmat, maskattu näkyvä joukko ja sen yhteisen kellon DOP sekä kofaktori. Tässä EI tarkisteta: kanjoni-, sektori- ja maastovähennyksiä eikä esiasetuksia (niiden 360 pisteen taulukot tulevat syötteinä; rivit 'Street-canyon, sector and terrain reductions to a table' ja 'Skyline presets'), järjestelmäkohtaisia kellotiloja eikä virhe-ellipsiä (rivi 'Horizontal error ellipse and per-system cofactor from the geometry covariance'), maa-aseman user_site GMST-kiertoa tiloissa orbit/integrity eikä sitä, että kukin propagaattori ajoitetaan yhteen hetkeen (Orekitille annetaan Maan kiinteän koordinaatiston tilat), eikä todellista näkemäestettä (vain näköyhteys)

seg-bbb1828b3db1 = Katukanjonin, sektorien ja maaston supistaminen taulukoksi

seg-2864aec7be88 = skyline: katukanjoni suljetussa muodossa (leikkaus atan((h - a) / d), jossa d = (w/2) / abs(sin(az - s)), avoimet päät äärelliselle pituudelle), teräväreunaiset sektorit myötäpäivään kiertäen sekä maastopisteet taulukoksi supistettuina kaarevuuspudotuksella d^2/({ "2" } * 4/3 R); horisonttiviiva on niiden pisteittäinen maksimi minkä tahansa taulukon kanssa

seg-50f1df206b30 = Sisäinen: suljetut muodot tarkistetaan käsin laskettuja arvoja vasten (annetun kadun seinien yläreunojen korkeuskulmat, avoimen pään ehto, annetun pisteen kaarevuuspudotus). Ulkoista oraakkelia ei ole: suunnitteluselosteessa nämä supistukset rajataan tasolle MODELLED, ja Orekitin ElevationMask ottaa taulukon, joten rivin 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' vertailu lukee niiden 360 pisteen taulukot syötteinä eikä tarkista niitä

seg-3f3d657854ce = Horisonttiesiasetukset (kaupungin katu, satamaan lähestyminen, vuono, konttiterminaali)

seg-b915c06fa3f1 = skyline::PRESETS: neljä REPRESENTATIVE-geometriaa suunnitteluselosteen ilmoittamilla mitoilla ja kullakin yhden rivin alkuperämerkintä: city-street (kanjoni, katu { "0" } astetta, { "20" } m { "30" } m korkeiden seinien välissä, antenni { "1.5" } m), harbour-approach (sektorit: avoin merelle { "180" } asteen alalla, satamarakennukset { "8" } astetta { "90" } asteen alalla, aallonmurtaja { "3" } astetta), fjord (maasto: seinät { "600" } m antennin yläpuolella { "1.5" } km:n päässä molemmin puolin pohjois-eteläsuuntaista väylää, kaarevuuspudotus huomioitu), container-terminal (sektorit: kontit { "12" } astetta maanpuoleisella puoliskolla, nosturin puomit { "35" } ja { "25" } astetta kahdella kapealla sektorilla); ohitettavissa kenttä kerrallaan

seg-44ae9b6289d9 = Ei mitään: valitut ja ilmoitetut mitat, ei minkään kadun, sataman, vuonon tai terminaalin kartoitus (kadun sivusuhde on Oken ({ "1988" }) vaihteluvälillä 0.5–2; vuono on länsinorjalaisten vuonojen suuruusluokkaa; kontit käyttävät ISO { "668" } -high-cube-korkeutta). Testi tarkistaa esiasetukset niiden omia ilmoitettuja mittoja vastaan, mikä on kirjoitusvirheiden tarkistus, jota validointisääntö ei laske

seg-2c53381d48ae = Vaakavirheen ellipsi ja järjestelmäkohtainen kofaktori geometrian kovarianssista

seg-15fea5c05cbd = geometry::sky_geometry: ENU-ja-kello-kofaktori (H^T H)^-1, jossa yksi vastaanottimen kello on yhteinen tai yksi järjestelmää kohti (ydin orbit::cofactor_from_los), sekä vaakavirheen ellipsi sen itä-pohjoinen-lohkosta (isoakselit k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), pääakselin atsimuutti pohjoisesta)

seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv matriisille G^T G ja numpy.linalg.eigh sen vaakalohkolle sitoutetuilla syötteillä, riippumaton numeerinen kirjasto, joka suorittaa käänteismatriisin ja ominaishajotelman omilla algoritmeillaan (standardi P2). Ennakkorekisteröity tiedostossa xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) ennen ajoa; ajurin tulostusmuotoilu korjattiin kerran ennakkorekisteröinnin jälkeen (numpy-skalaari kirjoitettuna muodossa np.float64(...)), ilman muutosta protokollaan tai toleransseihin. Validoitu väite on lineaarialgebra näillä syötteillä; gaussinen virhemalli ja UERE ovat ilmoitettuja syötteitä, eivät mitattu tarkkuus eivätkä eheysraja

seg-6012113b4836 = Taivaan geometriafunktiot: näkyvyys, DOP, kovarianssi, virhe-ellipsi, Monte Carlo -pilvi

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> ja <c2/>, Python- ja WASM-funktiot samoilla nimillä, MCP <c3/>): paikasta, ajasta ja tähdistöesiasetuksista (tai atsimuutti/korkeuskulma- tai ECEF-satelliiteista) lasketaan näkyvät ja horisontin alla maskatut satelliitit, GDOP/PDOP/HDOP/VDOP/TDOP, yksikkövarianssin kofaktori (H^T H)^-1 ja kovarianssi itä-pohjoinen-ylös-koordinaatistossa yhdellä vastaanottimen kellolla järjestelmää kohti tai yhdellä yhteisellä, vaakavirheen ellipsi (isoakselit k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), suunta { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) pohjoisesta) sekä n siemenellä alustettua pienimmän neliösumman virhettä riippumattomilla gaussisilla etäisyysvirheillä, niiden empiirinen kovarianssi, RMS ja { "95" } %:n kattavuus. Kofaktori on orbit::cofactor_from_los, ainoa ydin orbit::dop:n ja orbit::dop_cov:n takana (dop on dop_cov:n supistus): ei toista DOP-toteutusta

seg-aa0da1028636 = Yhden kellon DOP-tekijät nojaavat ytimeen, joka on validoitu gnss_lib_py { "1.0.4" } -kirjastoa vastaan (rivi 'GNSS geometry / dilution of precision (DOP)'); tämän rivin omat tarkistukset ovat sisäisiä: sky_geometry toistaa orbit::dop:n ja dop_cov:n samalla geometrialla, ellipsi toistaa analyyttisen 2x2-ominaishajotelman, ECEF- ja atsimuutti/korkeuskulma-syötteet täsmäävät, ja siemenellä alustetun pilven RMS ja { "95" } %:n kattavuus täsmäävät geometrian kanssa. ENU-kovarianssi yhdellä kellolla järjestelmää kohti ja ellipsi ovat VALIDATED rivillä 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); tasolle MODELLED jää tässä yhdistelmä: esiasetusten eteneminen edustavaksi taivaaksi, Monte Carlo -pilvi (tarkistettu sen näytteistämää geometriaa vasten, itsejohdonmukaisuustarkistus) ja pinnat. Tähdistöesiasetukset antavat edustavan taivaan, eivät päivättyä; gaussinen virhemalli ja UERE ovat ilmoitettuja syötteitä, eivät mitattu tarkkuus eivätkä eheysraja

seg-7f66be0f15c8 = GNSS-vapaa kellon holdover

seg-4d8f87668a0f = Suljetun muodon vapaaliukuvirheen kasvu + holdover kynnykseen; kvanttikelloluokat

seg-2d260626e3d2 = Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva vapaaliuku-varianssin ja holdover-käänteisfunktion ydin on validoitu ulkoisesti scipyä vasten (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punaisen kohinan lattian holdover-luvut pysyvät tasolla MODELLED

seg-29b482d88916 = Mitatut kellolaitekortit (pidätetty ennuste)

seg-8c68c5b25004 = clock_library: laitekortti (valkoinen vaihe, valkoinen, flicker- ja random-walk-FM sekä lineaarinen taajuuden ajautuma) sovitettuna yhteen kolmasosaan nimetystä mitatusta kellotallenteesta lokatun esikäsittelykierroksen jälkeen (aukot, vaiheen poikkeavat arvot, vaihehypyt ja purskeet poistettu; taajuushypyt lokattu), painotettuna lag-1-menetelmällä tunnistetuilla kohinatyyppien vapausasteilla, ja sen ennustettu Allanin poikkeama pisteytetään pidätetyillä kahdella kolmasosalla; lukijat RINEX- ja IGS-kellotiedostoille, BIPM:n laboratoriokohtaisille tiedostoille ja Circular T:n osalle { "1" }; kortin muunnos aikaväliajoituksen kohinamalliksi, laajennetuksi Kalman-kellomalliksi ja harhautusmonitorin kohinatasoiksi

seg-af2d78e2986c = Mitatut tallenteet, pidätetyt: IGS:n lopulliset yhdistetyt { "30" } s:n kellot GPS Block IIF -satelliiteilta, joita on { "11" } ajalta 2026-03-01 – { "14" } (ikkuna, jota yksikään testi ei ollut avannut; IGS, avoin lähteen mainiten) ja JammerTest { "2024" } u-blox ZED-F9P -vastaanotin sen pisteyttämättömissä paikallaan olleissa sessioissa (GPL-3.0-or-later). D9:n ulkoinen vertailu (ennakkorekisteröity 2ec76864, jokaisen kortin ennustettu / mitattu Allanin poikkeama välillä [1/1.5, { "1.5" }] sovitetuilla keskiarvoistusajoilla), havainto (pysyy tasolla MODELLED): GPS IIF -korteista { "11" } kappaleesta { "10" } on kynnyksen sisällä; G27 on optimistinen kahden tunnin mittakaavassa ({ "0.662" } kohdassa { "7680" } s, pahin kerroin { "1.510" }), jaksollinen tuntiluokan virhe, jota potenssilakikortti ei kata. Vastaanottimen TCXO-kortti on estynyt: lokattujen lähetysten ulkopuolella aineiston muut sessiot jättävät { "167" } epookkia vaaditun { "3600" } sijaan. Raportoitu, ei sokko (aiempien rivien avaamat tallenteet): 5071A-cesiumkortti on kynnyksen sisällä (pahin { "1.070" } arvoon { "4096" } s asti), OCXO-kortti on konservatiivinen ja sen ulkopuolella ({ "2.348" } kohdassa { "128" } s; sen kohinalattia muuttuu tallenteen aikana), ja kolmelle lyhimmälle julkaistulle pisteelle sovitettu Norcian strontiumkortti on sen sisällä kahdessa pisteytetyssä pisteessä ({ "1.291" }, { "1.405" }). Galileon passiiviset vetymaserit (lopullisia Galileo-kelloja ei ole saatavilla ilman kirjautumista) ja Deep Space Atomic Clock (yksi avoin avaruusarvo) ovat estyneitä. D9:n kierros { "2" }, ZED-F9P-vastaanottimen TCXO malliluokkana { "14" } päivältä { "12" } staattiselta Wrocławin asemalta (Zenodo { "6488497" }, CC BY { "4.0" }; ennakkorekisteröity fb475550), havainto: rekisteröidyllä putkella asemista { "12" } kappaleesta { "11" } ei ollut arvioitavissa (RAIM hylkäsi useimmat ionosfääristä vapaat epookit) ja BX14 epäonnistui; julkistettu uusinta-ajo korjatulla putkella (ennakkorekisteröity c9cc0d49) läpäisee sokoista asemista { "11" } kappaleesta { "1" } (BX12, { "1.412" }; BX07 { "1.532" } ja BX13 { "1.542" } juuri sen ulkopuolella), koska katkonaisista { "30" } s:n tiedostoista saadut yhden pisteen vastaanotinkellot eivät ole puhdas oskillaattoritallenne

seg-5097a0e6460d = Mitatut GPS Block IIF -kellokortit kierroskohtaisilla termeillä (pidätetty ennuste)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: laitekortti, joka sisältää yhden–neljän kierroskohtaisen vaihetermin (jakso T/k, T = { "43 082.05" } s), sovitettuna yhdessä toisen asteen termin kanssa pienimmän neliösumman menetelmällä yhteen kolmasosaan mitatusta satelliittikellotallenteesta, kunkin termin suljetun muodon Allan-osuus { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ennustetussa Allanin poikkeamassa

seg-83981cd13a17 = Mitatut tallenteet, pidätetyt: IGS:n lopulliset yhdistetyt { "30" } s:n kellot GPS Block IIF -satelliiteilta, joita on { "11" } ajalta 2026-04-01 – { "14" } (ikkuna, jota yksikään testi ei ollut avannut; IGS, avoin lähteen mainiten). D9:n ulkoinen vertailu (ennakkorekisteröity fb475550, ennustettu / mitattu Allanin poikkeama välillä [1/1.5, { "1.5" }] jokaisella sovitetulla keskiarvoistusajalla jokaisella satelliitilla), havainto (pysyy tasolla MODELLED): korteista { "11" } kappaleesta { "9" } on kynnyksen sisällä; G03 ({ "1.947" }) ja G25 ({ "1.581" }) ovat optimistisia välillä { "60" } s – { "2000" } s, koska niiden pidätetyt tallenteet ovat kohinaisempia kuin niiden sovituskolmannekset (G25:n pidätetyssä osassa on { "16" } aukkoa ja { "29" } vaiheen poikkeavaa arvoa), mikä on kellon muutos eikä puuttuva jaksollinen termi. Jaksollisten termien pudottaminen ennusteesta epäonnistuttaa kaikki { "11" } korttia ({ "1.77" } – { "4.96" }), joten termit kantavat ennusteen

seg-0d72fcc0fbea = Aluksen kellotilan estimointi

seg-6db5391f8ebe = 3-tilainen (vaihe/taajuus/ajautuma) van-Loan-Kalman-kello, Joseph-vakautettu

seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F laskettuna scipy.linalg.expm:llä ja Q Van-Loanin { "1978" } lohkomatriisilla – riippumaton vertailutoteutus, joka toistaa kshanan koko suotimen liikeradan. Toteutusten välinen johdonmukaisuus: kellofysiikkaa ja Allan-kalibrointia ei ole validoitu ulkoisesti, joten tämä pysyy tasolla MODELLED. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): GPS Block IIF -satelliittien (yhteensä { "11" }) IGS:n lopullisilla { "30" } s:n kelloilla (2025-08-17 – { "30" }), kun Q sovitetaan ensimmäisen puoliskon ADEV:iin ja suodin pisteytetään pidätetyllä toisella puoliskolla, suodin on johdonmukainen yhden askeleen eteenpäin ({ "0.906" } – { "0.971" } epookeista sen { "95" } %:n kaistan sisällä, kynnys { "90" } %), mutta ylivarma yhden tunnin kohdalla kelloista { "11" } kappaleesta { "9" } ({ "0.486" } – { "0.829" }), ja sen innovaatiosummat jäävät välin [{ "2.4" }, { "3.6" }] ulkopuolelle { "5" } kellolla. Sovitettu valkoisen vaiheen kohina on nolla jokaisella satelliitilla, eikä tuntiluokan virhe (jaksolliset termit, flicker-FM) sisälly 3-tilaiseen malliin. { "0.30" } kierros { "2" }, laajennettu suodin (flicker-FM sekä kerran ja kahdesti kierroksessa toistuvat tilat) tuoreilla pidätetyillä IGS-kelloilla ajalta 2025-09-01 – { "14" } (ennakkorekisteröity 4b1a841e), havainto (pysyy tasolla MODELLED): yhden askeleen ja yhden tunnin johdonmukaisuuskriteerit täyttyvät kaikilla { "11" } satelliitilla ({ "0.948" } – { "0.988" } ja { "0.907" } – { "0.996" }), mutta innovaatiosumman kriteeri ei täyty satelliiteilla G24 ({ "0.964" }) ja G30 ({ "1.929" }) välillä [{ "2.4" }, { "3.6" }]. D9:n kierros { "3" }, kierroksen 2 laajennettu suodin, viritys ja kriteerit muuttamatta jäädytetyn clock_library-esikäsittelyilmaisimen jälkeen, tuoreilla IGS-kelloilla ajalta 2026-04-01 – { "14" } (ennakkorekisteröity fb475550), havainto (pysyy tasolla MODELLED): (a) yksi askel { "0.941" } – { "0.968" } ja (c) kolminkertaisen NIS:n keskiarvo { "2.641" } – { "3.549" } täyttyvät kaikilla { "11" } satelliitilla; (b) yksi tunti ei täyty satelliiteilla G09 ({ "0.894" }) ja G26 ({ "0.876" }) rajaa { "0.90" } vasten

seg-3f0a9d7c2971 = Ajansiirron virhebudjetointi

seg-216f46b43860 = Kaksisuuntainen/TWSTFT (Sagnac), GNSS-yhteisnäkymä, PPP; linkin jitter→etäisyys

seg-e7b6aac2ec58 = Sagnac-suuruus tarkistettu arvovaltaista JULKAISTUA ARVOA vasten – N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), yhtälö { "1.29" }: itäsuuntainen päiväntasaajan kiertomatka kerryttää { "207.4" } ns (2ωA_E/c²); kshana toistaa arvon { "207.386" } ns. Riippumattomasti vahvistettu RTKLIB { "2.4.3" } geodist()-funktiolla (Takasu, BSD-2-Clause), jossa on sama 2Aω/c²-geometria. Yhdistetyllä BIPM TWSTFT -transponderin/yhteisnäkymän/PPP-budjetilla ei ole ulkoista oraakkelia, joten kyvykkyys pysyy tasolla Modelled

seg-157fadeb5d67 = Navigointisignaalin modulaatio ja koodinseurannan analyysi

seg-ab633d191396 = BPSK-R/BOC-PSD, spektrierotus κ, Gaborin kaistanleveys, DLL-jitter, monitie-eteneminen

seg-94f0c4fc2930 = GPS C/A Gold -ristikorrelaatio ja autokorrelaatio täsmäävät TARKASTI (kokonaisluvut ±65/−1/63) riippumattomaan IS-GPS-200-koodigenerointiin; BPSK-R({ "1" })/BOC({ "1,1" }) PSD:n muoto riippumatonta scipy-periodogrammia vasten. Modulaation, SSC:n ja DLL:n suljetut muodot (Betz { "2001" } / Kaplan & Hegarty) ovat edelleen analyyttisiä, joten rivi pysyy tasolla MODELLED, mutta koodikorrelaation osaväite täsmää ulkoisesti. { "0.30" } kierros { "2" }, Betzin { "2001" } ja Hein ym. { "2006" } painettuja arvoja vasten (ennakkorekisteröity 9f4f2ce8, puoli painettua yksikköä), havainto (pysyy tasolla MODELLED): kaikki { "45" } taulukon { "1" } spektrisolua, { "1" } GHz:n korrelaatioarvot, MBOC-häiriöluvut ja kuvan { "17" } siirtymistä { "3" } kappaleesta { "2" } täsmäävät; { "24" } MHz:n ensimmäiset sivukeilat, BOC({ "8,4" }) kuvan { "17" } siirtymä ja kaikki kuvien 18–21 pahimman tapauksen monitie-eteneminen vääristymät ({ "11" } – { "15" } % liian matalia) eivät täsmää. Kshana ja riippumaton NumPy-laskenta ennakkorekisteröidystä tulkinnasta täsmäävät keskenään, joten ero on tulkinnassa tai artikkelin ilmoittamattomassa yksityiskohdassa; syy on ratkaisematta

seg-589e0053e3e8 = GPS L1 C/A -hajotuskoodin generointi

seg-782d4da75b59 = G1/G2 LFSR -C/A-koodigeneraattori, joka toistaa IS-GPS-200:n julkaistut ensimmäisten 10 piirin oktaaliset varmennusvektorit PRN-koodeille { "1" }–{ "9" } (sekä 1023 piirin pituuden, 512 ykkösen tasapainon ja kolmiarvoisen jaksollisen autokorrelaation)

seg-473f24d4e06a = IS-GPS-200 Table 3-Ia 'Code Phase Assignments' – arvovaltaiset Yhdysvaltain hallinnon julkisen alueen julkaisemat ensimmäisten 10 piirin OKTAALISET varmennusvektorit (GPS Directorate, navcen.uscg.gov); kshanan oma G1/G2 LFSR tuottaa uudelleen jokaisen PRN-vektorin { "1" }–{ "9" } täsmälleen. Jatkossa käytettävät modulaation, SSC:n ja DLL:n suljetut muodot pysyvät tasolla Modelled (erillinen rivi)

seg-e6c08e1e6ae3 = Kvanttiinertia-anturin suorituskyky

seg-d28e1f6a430f = Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN)

seg-57fd0a6e5d72 = Julkaistut CAI:n päälähdeartikkeleiden numeeriset vektorit (Cheinetin { "2008" } siirtofunktio; Peters/Freier-herkkyys): k_eff·T² täsmää tarkasti, laukauskohinan ASD on yksipuolinen lattia noin { "2" }× sisällä kustakin julkaistusta laitteesta (todellisissa laitteissa on tekninen kohina kvanttilattian yläpuolella). Haarukka, ei yhtäpitävyys. { "0.30" } kierros { "2" } (ennakkorekisteröity fcb9ac64), havainto (pysyy tasolla MODELLED): pelkän QPN:n rotaatiokohina mitattuja Gauguet ym. { "2009" } kuvan { "14" } pisteitä vasten antaa suhteet { "0.695" } – { "0.788" } kolmessa hyväksytyssä pisteessä ({ "0.751" } toimintapisteessä) ja ohittaa ennakkorekisteröidyn { "30" } %:n kynnyksen { "0.5" } prosenttiyksiköllä; QPN-lattia on { "21" } – { "31" } % mitatun kohinan alapuolella, kuten laser- ja ilmaisinkohinaa vailla olevalta mallilta odottaa. Gradiometrikoostumus täsmää Janvier ym. { "2022" } QPN-mallin viivaan (suhde { "1.013" } – { "1.017" }, Reference). Mitattu testi ei erottele sqrt({ "2" })-koostumusvirhettä; vain epätasaisen kontrastin Janvier-viiva voi

seg-4b79d03cecf5 = Kvanttiinertia-anturin vyöhykeepäselvyys / dynaaminen alue

seg-deb2850546d5 = Mach–Zehnder-vyöhykeepäselvyyden dynaaminen alue: 2π-jaksollinen vyölukema asettaa suurimman yksiselitteisen ominaisvoiman a_max=π/(k_eff·T²), ja yksiselitteinen alue erottelusoluina a_max/σ_a=π/σ_Φ on riippumaton optisesta asteikkokertoimesta – T²-herkkyyshyöty maksaa yksiselitteistä aluetta täsmälleen samassa suhteessa (kyselyaika vaihtaa erottelukykyä alueeseen, ja solujen lukumäärän määrää vyölukeman vaihekohina)

seg-7603ff7a7693 = Interferometrin vyömallin itsejohdonmukaisuus: puolivyön reuna, 2π-jaksollinen laskostumisrakenne ja asteikkokertoimen supistuminen alue/erottelu-suhteessa ovat suljetun muodon algebrallisia identiteettejä, jotka tarkistetaan moottorin omia Mach–Zehnder-vaihe- ja herkkyysfunktioita vasten – sisäisiä johdonmukaisuustarkistuksia, EI ulkoinen aineisto, joten rivi pysyy tasolla InternalConsistency. MODELLED ihanteellinen kolmipulssinen vyöepäselvyys; ei aaltorintaman poikkeaman tai kontrastin menetyksen rajoja yksiselitteiselle alueelle

seg-d04bf321d4a1 = Kvanttiinertiaalinen koneellinen paikanlasku (dead reckoning) kestävyytenä

seg-c4989abb5d40 = Koottu harha + asteikkokerroin + VRW + vakauden vaimenemisen paikkabudjetti holdoverin aikana

seg-bfe4085115c1 = Riippumaton numpy-Monte Carlo-SDE-integrointi kahdesti integroidulle valkoisen kiihtyvyyden kohinalle (validoi analyyttisen VRW-varianssin aidosti riippumattomalla algoritmilla) + Grovesin { "2013" } julkaistu arvoankkuri harha- ja asteikkokerrointermeille; CAI-laitteen luvut kvantifioivat kumppanin laitteistoa ja pysyvät tasolla MODELLED

seg-bc6e733c39b3 = GNSS/INS-anturifuusio

seg-16514286bb51 = 15-tilainen virhetila-EKF, löyhästi kytketty (validoitu todellisella IMU/GNSS-ajolla NaveGoa vasten); tiukasti kytketty pseudoetäisyys/Doppler-UKF ja kytketty kello+paikka-suodin (vain johdonmukaisuus, validoidun väitteen ulkopuolella)

seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, ajettu työkaluna GNU Octavessa, ei koskaan linkitetty): sen löyhästi kytketty ins_gnss omalla todellisella Ekinox-IMU/GNSS-maa-ajoneuvoajollaan, molemmat ratkaisut pisteytettynä Ekinoxin vertailuliikerataa vasten. Molemmat suotimet lukevat saman { "20" } Hz:n float32-syötteen, ja Kshanan konfiguraatio kuvataan mekaanisesti aineiston julkaistuista parametreista. Kshanan vaaka- ja pystypaikan RMS sekä paikkainnovaation RMS ovat 1.2x NaveGon sisällä (mitattu { "0.912" }, { "0.940" } ja { "0.861" }) ja sen keskimääräinen normalisoitu innovaatio on enintään { "1.5" } (mitattu { "0.395" }: noin 2.5x alivarma aineiston ilmoittamilla GNSS-sigmoilla); toleranssit lukittu ennen vertailua. Laajuus: GNSS on läsnä { "5" } Hz:llä koko ajon ajan, joten katkoa tai vapaaliukua ei testata ja tarkistus havaitsee suotimen karkeat viat, ei hienosäätöä (vipuvarsikorjatut raakaratkaisut päätyisivät lähelle pystykynnystä); vipuvarsimuunnos lasketaan testiympäristössä. Tiukasti kytketty UKF ja kytketty kello+paikka-suodin säilyttävät filterpy { "1.4.5" } -johdonmukaisuustarkistuksensa (lineaariset posteriorit tarkkuuteen { "2.4e-12" }) ja pysyvät validoidun väitteen ulkopuolella

seg-5692c7b936b6 = GNSS-vapaa häirinnän kestävyys

seg-f4ff77caa47b = Geometrinen J/S-linkkibudjetti, häirinnänsietävä C/N₀, satelliittikohtainen lukituksen menetys

seg-daf317735edb = Häirinnänsietävän C/N₀:n linkkibudjettiyhtälö ristiintarkistettu riippumattomalla numpy-uudelleenjohdolla (jakaa saman suljetun muodon → InternalConsistency) sekä todellisen JammerTest-2024-aineiston C/N₀-heikkenemän karakterisointi. { "0.30" } kierros { "2" }, estynyt (pysyy tasolla MODELLED): mitattua JammerTest { "2024" } C/N0-pudotusta linkkibudjettiennustetta vasten (ennakkorekisteröity 6a66994b, { "3" } dB:n sisällä) ei ajettu, koska F8.1-antennin sijaintia ja suuntausta Bleikissä eikä monikaistaisen rampin { "1.6.4" } tehon L1-osuutta ole dokumentoitu testikatalogissa tai viranomaisen lokissa

seg-ff90679d1de9 = Harhautuksen (spoofing) havaitseminen

seg-b843f63e77e6 = Kellon avustama χ², RAIM, AGC ja SQM yhdistettynä epookkikohtaiseksi turvallisuuden laatumittariksi

seg-baeb1c3db11f = TEXBAT-skenaarioiden parametrit (Humphreys { "2012" }) – karakterisointi, ei lukittuja vektoreita. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): JammerTest { "2024" } -aineistossa (Bleik; GPL-3.0-data) havaintotason monitorit (kellon avustama khiin neliö, RAIM, ratkaisun epäonnistuminen) eivät antaneet hälytystä { "10" } s:n sisällä yhdestäkään { "8" } arvioitavasta julkaistusta harhautuksen alkuhetkestä (kun alkua edeltävä ikkuna oli puhdas, ensimmäinen hälytys tuli { "10.2" } – { "39" } s julkaistun ajanjakson alun jälkeen), ja kolmessa alkua edeltävässä ikkunassa kellomonitori antoi vääriä hälytyksiä ({ "81" }, { "64" } ja { "173" } epookkia). Ensimmäinen havaittava vaikutus oli kaksitaajuisen GPS-seurannan menetys, ei RAIM-ristiriita. Julkaistut alkuhetket ovat minuuttitarkkuuden aikataulun jaksojen alkuja; se, että ne edeltävät RF-tallennetta, on tulkinta, ei mittaus. { "0.30" } kierros { "2" }, järjestäjien virallista JammerTest { "2024" } -lokia vasten (sekuntitarkkuus; ennakkorekisteröity 6a66994b Hadamard-kalibroidulla kolmitilaisella kellomonitorilla ilman lukitusta), havainto (pysyy tasolla MODELLED): monitori hälyttää { "10" } s:n sisällä { "4" } kohdalla { "10" } lokatusta alkuhetkestä; muissa kuudessa se on { "18" } – { "211" } s myöhässä tai antaa alkua edeltäviä kellon vääriä hälytyksiä ({ "1" } kohdassa { "2.1.4" }, { "85" } kohdassa { "2.3.15" }). D9:n kierros { "3" } (vastaanotinkortti JammerTest-laitteen muista sessioista, ennakkorekisteröity 2ec76864) estynyt: { "167" } opetusepookkia vaaditun { "3600" } sijaan. D9:n kierrokset { "4" } ja 4b (kohinatasot u-blox ZED-F9P -malliluokkakortista, Wrocław { "2021" }, ennakkorekisteröity fb475550; 4b julkistettu uusinta-ajo korjatulla poiminnalla, c9cc0d49), havainto (pysyy tasolla MODELLED): nolla alkua edeltävää väärää hälytystä kaikissa { "10" } lokatussa alkuhetkessä ja { "6" } kohdalla { "10" } alkuhetkestä hälytys tulee { "10" } s:n sisällä; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } ja { "2.6.1" } jäävät myöhäisiksi (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), eikä kellon kohinataso muuta sitä

seg-b10d07921f5e = Ajoituksen suojaustaso harhautuksen (spoofing) aikana

seg-2a829711b997 = Suljetun muodon yläraja pahimman tapauksen havaitsemattomalle aikavirheelle = monitorin lattia + oskillaattorin vapaaliuku-σ CUSUM-havaitsemisviiveen aikana, raportoituna punaisen kohinan lattiakaistana

seg-682251b2e3c7 = Kokoaa Validated-primitiivejä (allan/holdover van-Loan, turvallisuuslattia); kalibroitu JammerTest { "2024" } -skenaariolla { "2.1.1" } (~{ "1.01" } ms todellinen palveltu aikavetäytyminen vs ≤{ "51" } ns väitetty). Silta Validated-osien yli – ei itsessään ulkoinen validointi. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): JammerTest { "2024" } -harhautusskenaarioissa mitattu havaitsematon palveltu aikavirhe ylittää nimellisen TPL:n { "3" } kohdalla { "8" } havaitusta alkuhetkestä: { "184.3" } vs { "34.6" } ns ({ "2.1.4" }), { "295.7" } vs { "159.3" } ns ({ "2.3.5" }) ja { "143.0" } vs { "69.0" } ns ({ "2.3.11" }); kolme viidestä rajan sisällä olevasta on triviaaleja (lukittu alkua edeltävä väärä hälytys). Todennäköinen syy: { "60" } s:n kalibroinnista nollan ajautumiskohinalla saatu vapaaliukutermi ei kata vastaanottimen TCXO:n taajuuden vaellusta { "15" } – { "39" } s:n aikana. Mitattu virhe on Kshanan oma yhden pisteen kelloestimaatti verrattuna omiin alkua edeltäviin estimaatteihin sovitettuun suoraan, joten sopivuuskaan ei olisi ollut täysin riippumaton. { "0.30" } kierros { "2" }, virallisen JammerTest { "2024" } -lokin alkuhetkiä ja mitattua vastaanottimen aikavirhettä vasten (ennakkorekisteröity 6a66994b), havainto (pysyy tasolla MODELLED): { "4" } kohdalla { "10" } lokatusta alkuhetkestä havaitsematon virhe ylittää ajautumistilan TPL:n ({ "634.7" } vs { "458.5" } ns kohdassa { "2.1.1" }, { "232.6" } vs { "16.2" } ns kohdassa { "2.3.5" }, { "41.3" } vs { "6.0" } ns kohdassa { "2.3.10" }, { "218.6" } vs { "47.4" } ns kohdassa { "2.6.3" })

seg-0ec37553bbc4 = Kuunläheisen avaruuden (Maa–Kuu-avaruus) tehtäväanalyysi

seg-a47465f682ba = CR3BP STM + yhden ammunnan differentiaalikorjain; L2 eteläinen NRHO

seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; Maa–Kuu L2 eteläinen halo-perhe, Howell/Davis-menetelmä) – ulkoisesti julkaistu jakso T, Jacobin vakio C ja kohtisuoran ylityksen alkuehdot; kshanan yhden ammunnan STM-korjain, jonka siemenenä on katalogin alkuehto ja joka häiritään, konvergoi takaisin katalogin jäseniin

seg-f1d49eac89f8 = Vaihtoehtoinen / täydentävä PNT

seg-023dda973f66 = Painovoimakarttasovitus, maastoon perustuva (TERCOM/SITAN), magneettinen poikkeama

seg-da869d48e505 = IGRF-14-kertoimet; ensiperiaatteisiin perustuva sovitettu suodin CRLB. Todellisen kentän painovoimabenchmarkin kenttä on tarkistettu ulkoisesti (rivi 'Gravity-anomaly synthesis from a spherical-harmonic model'), mutta sen navigointitulokselle ei ole ulkoista oraakkelia

seg-db7767ab661d = Painovoimapoikkeaman synteesi pallofunktiomallista

seg-2db367c4a473 = Painovoimapoikkeama pallomaisessa approksimaatiossa (Barthelmes STR09/02 yhtälö { "126" }, ICGEM gravity_anomaly_sa) täysin normalisoiduista kertoimista suljetun muodon tasapintaellipsoidia (WGS84/GRS80) vasten nollannen asteen termin kanssa, ruudukoituna painovoimakarttasovittimelle

seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), riippumaton toteutus: EGM2008 katkaistuna asteeseen { "70" }, gravity_anomaly_sa, WGS84, tide-free, nollannen asteen termi, h = { "0" }. Palvelun tulosteella ei ole nimenomaista lisenssiä, joten ruudukot haetaan testin aikana lukitulla SHA-256-tiivisteellä (tools/fetch_icgem_grid.sh) ja vain kymmenen arvoa esitetään lähteen mainiten

seg-31f51d4998cb = SRTM-korkeusmallin lukija todellisella maastolla

seg-08ea4ae0b671 = Käsin kirjoitettu SRTM .hgt -jäsennin (16-bittinen big-endian, pohjoisrivi ensin, aukkotietoinen) + bilineaarinen näytteistin, joka lukee todellisen julkisen alueen DEM-ruudun ja ratkaisee dokumentoidun maastomittauksen vertailuarvon

seg-aae487789add = NASA/USGS SRTM v3 (1 kaarisekunti) N36W117-ruutu – Yhdysvaltain hallinnon PUBLIC-DOMAIN-korkeusdataa AWS:n elevation-tiles-prod-avoimesta peilistä, harvennettuna 6 kaarisekuntiin ja sitoutettuna hakemistoon tests/fixtures/terrain/ (ks. NOTICE.md), sekä N36W117:n ja N36W119:n täysresoluutioiset rajaukset, ristiintarkistettu solmu solmulta GDAL:n riippumatonta SRTMHGT-lukijaa vasten, sekä Mount Whitneyn ({ "4421" } m) ja Badwaterin (−{ "86" } m) maastomittausten vertailuarvot. Dokumentoitu Badwater Basinin vertailuarvo (−{ "86" } m, Pohjois-Amerikan matalin) ankkuroi georeferoidun lukemisen. DEM:iä käyttävä maastosovitus/TERCOM-navigointiratkaisu pysyy tasolla Modelled (erillinen Alternative/complementary PNT -rivi)

seg-791e7285c291 = Toistettavuus ja ohjelmistovarmistus

seg-7177355a482c = Deterministiset, skenaariotiivisteellä varustetut, SBOM- ja alustojen välisten golden-porttien tarkistukset

seg-6cf9d570cc51 = SBOM:n vastaavuus virallista CycloneDX { "1.5" } JSON Schemaa vastaan (+ kelvolliset SPDX-tunnisteet) – ulkoinen julkaistu standardi, nolla validointivirhettä koko riippuvuusgraafissa; FoM-determinismi / tavutason toistettavuus on edelleen lukittu itsejohdonmukaisuustarkistus, joten rivi pysyy tasolla MODELLED

seg-89b2114542bb = Tekoäly/koneoppiminen: RF-häiriöiden havaitsemisen arviointi ({ "13494" })

seg-241f2eeaef12 = Nimiöity synteettinen häiriökorpus + ilmaisimesta riippumaton ROC/AUC/sekaannus/Pfa-Pmd-testialusta; vuotosuoja, kerrostettu jako, jakaumasiirtymän (alueen sisällä vs ulkopuolella) optimismiraportti. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/impairment-eval.toml)

seg-72a3c97ef04b = Suljetun muodon AUC-rajat (Mann–Whitney) + täydellinen oraakkeli-ilmaisin; korpus on SYNTHETIC (parametreihin perustuva, ei kenttädataa/IQ-dataa)

seg-c38ebee794b3 = Tekoäly/koneoppiminen: RF-häiriöiden optimismikuilututkimus ja vain jakauman sisäisiin tietoihin perustuva kuilun ennustin

seg-642087659fda = Kontrolloitu synteettinen tutkimus jakauman sisäisen ja ulkopuolisen AUC-optimismikuilun suuruudesta julkaistuilla menetelmillä ja opituilla (logistinen regressio / yhden piilokerroksen MLP) ilmaisimilla: luokkakohtaiset skaalauslakitrendit (Spearmanin ρ + kulmakerroin muuttujalla { "1" }−vakavuus) ja vain jakauman sisäisiin diagnostiikkoihin perustuva harjanneregressio-ennustin, joka arvioi kuilun, pisteytettynä jättämällä yksi ilmaisin pois ja jättämällä yksi luokka pois. Toistettavissa komennolla <c1/>

seg-c46973920f5b = Käsin johdetut tunnusluvut suljettuja muotoja vasten (binormaalinen AUC Φ(d'/√{ "2" }), DeLongin varianssi, sidosjärjestyksen Spearman, tarkka OLS-palautus) + yksi pois -ristiinvalidointi keskiarvon ennustavaa lähtötasoa vasten. Korpus on SYNTHETIC (parametreihin perustuva, ei koskaan kenttädataa/IQ-dataa), ja optimismikuilu on synteettisestä synteettiseen kohdistuva vakavuussiirtymä, EI simulaatiosta kenttään -tulos

seg-fd6424213d1f = Kvantti- ja klassisen PNT:n vertailu sekä GNSS-vapaa kestävyys ({ "13503" })

seg-21b2b54200a8 = Mitatun ADEV:n sisäänotto (NNLS), vertailutaulukko (ajoituksen/inertian holdover + hyöty), kestävyys-aika-verhokäyrä; lattiaa koskeva varoitus kulkee artefaktin mukana. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/quantum-trade.toml)

seg-37d11937c966 = Mitatun ADEV→PSD-sovituksen (NNLS) ydin täsmää scipy.optimize.nnls:ään (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) – riippumaton ulkoinen ydin; mutta vertailun LUVUT kvantifioivat (eivät koskaan validoi) kumppanin kelloa/CAI:ta, joten itse vertailu pysyy tasolla MODELLED, ilman validointikehää

seg-1fa865bfddd1 = Avaruussääympäristö ja aktiivisuudesta riippuva termosfäärin tiheys

seg-47308f611c7e = Aurinko- ja geomagneettiset indeksit (määritelmällinen Kp↔ap-taulukko), Jacchia-1971:n eksosfäärin lämpötila ja Jacchia { "1971" } -termosfääritiheys (SAO Special Report { "332" }: staattiset diffuusioprofiilit, jotka toistavat sen taulukon { "7" }, sekä vuorokausi-, geomagneettiset, puolivuotis-, vuodenaika-leveysaste- ja heliumvaihtelut) staattista USSA76-ilmakehää vasten. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/space-weather.toml)

seg-1cad4329e226 = Määritelmällinen Kp↔ap-taulukko + Jacchia-1971:n eksosfäärin lämpötilan suljettu muoto (täsmäytetty tarkkuuteen <{ "1" } K julkaistuja ankkureita vasten, tests/space_weather_reference.rs); tiheys karakterisoidaan pymsis NRLMSISE-00:aa (riippumaton NRL-malli) vasten: { "800" } km:n aurinkosyklin heilahdus on 10.4x NRLMSISE-00:n 13.6x:ää vastaan. { "0.30" } -versiomuutos: kalibroitu ensimmäisen kertaluvun aktiivisuuskerroin korvattiin Jacchia { "1971" } -mallilla (oletusskenaarion tiheys { "400" } km:ssä { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k poistettu, mean_exospheric_temperature_k lisätty). { "0.30" } kierros { "2" }, mitatut TOLEOS CHAMP/GRACE/GRACE-FO-kiihtyvyysmittaritiheydet (ESA Swarm DISC; ennakkorekisteröity 20eed695), havainto (pysyy tasolla MODELLED): kiertokeskiarvot { "400" } – { "500" } km:ssä ovat kertoimen { "2" } sisällä aurinkomaksimissa myrskyjen ulkopuolella (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), mutta Jacchia { "1971" } on noin 1.7x liian tiheä vuoden { "2008" } aurinkominimissä (GRACE-A 412/544 kertoimen { "2" } sisällä), joten tiheyttä ei ole validoitu

seg-29bedb28c34f = CCSDS OEM -yhteentoimivuus (GMAT/Orekit/STK-efemeridituonti)

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM -tuoja (parse_oem), joka sietää COMMENT-rivejä / ylimääräisiä metatietosanoja / kovarianssilohkoja ja on kirjoittajan tarkka käänteistoiminto; edestakaisajo + ulkoisen tiedoston sisäänotto nopeuden johdonmukaisuustarkistuksella. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/oem-interop.toml)

seg-bc507f96c4df = Riippumaton kolmannen osapuolen CCSDS-502-jäsennin <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) – erillinen koodikanta, joka dekoodaa kshanan tuottaman EME2000/UTC-OEM:n tavu tavulta identtisesti ({ "24" } tilaa { "2" } testitiedostossa, paikka/nopeus Δ = { "0" }) ja jonka tiukka lukija vahvistaa metatietotunnisteet; kshanan jäsennin samoin täsmää sen kanssa toimitetulla ulkoisella OEM:llä. Kaksi rehellistä yhteentoimivuushavaintoa (oem-kirjasto hylkää kshanan satelliittikohtaisen moniosaisen segmenttikäytännön ja sen monialkioiset kovarianssirivit) on dokumentoitu testissä – siksi tämä validoi vain yhden kohteen vaihtomuodon, ei kaikkien kshanan muunnelmien täyttä CCSDS-502-yhdenmukaisuutta

seg-c76b8c395ef0 = Laukaisuikkuna ja nousugeometria (tehtäväanalyysi)

seg-6066c634faba = Kahden kappaleen laukaisuatsimuutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräradan nopeus, Maan pyörimisen itäsuuntainen hyöty, dogleg-tasonmuutoksen Δv ja päivittäiset mahdollisuudet sekä, kun annetaan epookki ja IERS finals2000A -rivit, aseman nopeus todellisen navan ympäri (launch::site_rotation_speed_at). Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/launch-window.toml)

seg-2515ab37f99b = Suljetun muodon pallotrigonometrinen laukaisugeometria julkaistuja esimerkkilaskuja vasten (Vallado, Fundamentals of Astrodynamics, 4. painos, algoritmi { "37" } laukaisuatsimuutti + luku 6 tasonmuutos; tests/launch_window_ascent_geometry_reference.rs). Nämä käyttävät samaa suljettua muotoa, jonka kshana toteuttaa (julkaistun arvon yhtäpitävyys / kirjoitusvirheiden tarkistus, InternalConsistency); MODELLED kahden kappaleen malli, ei pyörivän Maan nopeuskolmiota / nousu- / vastushäviömallia. { "0.30" } ulkoinen vertailu Orekitia { "12.2" } (Apache-2.0) vasten, havainto (pysyy tasolla MODELLED): geometria täsmää pyöristystarkkuudella (inklinaatio luettuna takaisin polttoloppuatsimuutista { "158" } tapauksessa, pahin { "2.6e-15" } rad; pienin inklinaatio, ympyräradan nopeus ja doglegin delta-v tarkkuuteen { "3e-16" }), mutta Maan pyörimisen aseman nopeus ohittaa ennakkorekisteröidyn suhteellisen { "1e-6" } leveysasteella { "62.9" } astetta ({ "1.12e-6" }). Ero kasvaa kuten tan(lat), mikä sopii Orekitin Maa-koordinaatiston noin { "5.8e-7" } rad:n napaliikkeen napapoikkeamaan, jota pallomainen ω·R·cos(lat) ei sisällä. Väitettä ei rajattu ennen ajoa, joten rivi ei voi nousta tämän vertailun perusteella. { "0.30" } kierros { "2" } (ennakkorekisteröity 71bebf63): epookin ja IERS-rivien kanssa todellisen navan aseman nopeus (skenaariokenttä site_rotation_speed_true_pole_m_s) täsmää Orekitin kanssa tarkkuudella { "1e-6" } { "24" } asemalla neljällä pituuspiirillä (pahin { "4.9e-8" }), mutta nimellinen epookiton nopeus, jonka skenaario antaa oletuksena Maan pyörimisen hyötynä, ohittaa edelleen arvolla { "1.12e-6" }, joten rivi pysyy tasolla MODELLED, kunnes oletustulosteesta päätetään

seg-ff2cd766bb52 = Ballistinen paluukäytävä (Allen–Eggers)

seg-c3f3422f96e4 = Huippuhidastuvuus (ballistisesta kertoimesta riippumaton), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus eksponentiaalisen ilmakehän ballistiselle paluulle. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/reentry.toml)

seg-121f02d79ae0 = Suljetun muodon Allen–Eggers-analyyttinen paluu, lisäksi ristiintarkistettu scipy { "1.18" } solve_ivp (DOP853) -numeerista integrointia vasten SAMALLE vain vastusta sisältävälle paluun ODE:lle (tests/ballistic_re_entry_corridor_reference.rs, { "36" } tapausta, pahin a_max suhteellinen { "2.9e-9" }) – numeerinen integraali vs oma analyyttinen muoto, joten edelleen InternalConsistency, EI ulkoinen validointi. MODELLED ballistinen (ei nostovoimaa), ei aerotermistä/TPS-mallia – lämmitystuloste on nopeus, ei lämpövuo. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): Stardust SRC -paluun rekonstruktiota vasten (Desai ja Qualls, NASA NTRS { "20080008567" }) Allen–Eggersin huippuhidastuvuus painetulle inertiaaliselle paluutilalle ({ "12.9" } km/s, -8.2 astetta, H { "7200" } m) on { "61.8" } g parhaaksi arvioitua lentorataa vastaavan { "32.89" } g:n rinnalla, +{ "88" } % { "15" } %:n toleranssia vasten: vakiolentorataulma ja ei-gravitaatio-ratkaisu likimain kaksinkertaistaa matalan, pakonopeutta nopeamman paluun huipun. Stardustissa ei ollut kiihtyvyysmittaria, joten rekonstruktio on lentoradan arvio. { "0.30" } kierros { "2" }, estynyt (pysyy tasolla MODELLED): integroitu tasomainen pistemassaratkaisu (reentry::simulate_planar_entry, US76, käänteisneliögravitaatio, kaarevuus) täsmää Stardustin ja Genesisin parhaaksi arvioituihin lentoratoihin { "15" } %:n sisällä (+{ "11.3" } %, +{ "5.6" } %), mutta nämä maksimit ovat virastojen simulaatiotulosteita, eivät mittauksia, joten kyseessä on vain ristiintarkistus. Kiihtyvyysmittarivertailu (ennakkorekisteröity a94a283d) on estynyt, koska Hayabusa2 REMM -analyysin luettavaa kopiota ei ole (doi 10.57350/jesa.16)

seg-8c10b50407d3 = EO-hyötykuorman jalanjälki ja kattavuusgeometria

seg-45c1e799c87c = SMAD:n avaruuskolmiogeometria: Maan kulmasäde, kaistan leveys, nadirin GSD, suurin nadirista poikkeava saavutettavuus ja ympyräradan jakso, sekä ensimmäisen kertaluvun J2-solmujakso (eo_payload::j2_nodal_period) ja päiväntasaajan maanpintajäljen väli R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) yhtenäisen kattavuuden lipulla, kun annetaan radan korkeus, inklinaatio ja anturin FOV/IFOV. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/eo-coverage.toml); sen oletusinklinaatio on aurinkosynkroninen eo_payload::sun_synchronous_inclination -funktiosta, mukavuusoletus, joka ei kuulu validoituun väitteeseen

seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) ja GeographicLib { "2.1" } (MIT), molemmat ajettuina erillisinä ohjelmina, ennakkorekisteröity (766823f3) ennen moottorimuutosta ja ennen oraakkelien ajoa: pallosuureet suhteellisen { "1e-9" } sisällä (pahin: kulmasäde { "5.4e-16" }, kaista { "7.0e-13" }, saavutettavuus { "1.9e-14" }), jakso { "1e-12" } ({ "1.6e-16" }), nadirin GSD { "1e-7" } ({ "2.9e-10" }), J2-solmujakso ja solmuväli { "0.1" } %:n sisällä Orekitin numeerisesta J2-etenemisestä solmuilmaisimella ({ "1.2e-5" } ja { "6.7e-5" }), yhtenäisyyslippu täsmälleen (168/168), ja WGS-84-ellipsoidia vasten horisontti { "0.3" } asteen sisällä ({ "0.186" } astetta) ja suurin maanpintaetäisyys { "0.5" } %:n sisällä ({ "3.2e-3" }). Solmun regressiotermin poistaminen epäonnistuttaa { "35" } solmupistettä, joita on yhteensä { "42" }. MODELLED-laajuus: pallomainen Maa -jalanjälki; ei radiometriaa, MTF:ää, ilmakehää, jitteriä eikä kiiltoa; aurinkosynkronista oletusinklinaatiota ei verrata. Aiempi Skyfield/SGP4-ristiintarkistus säilytetään regressiotestinä. { "0.30" } -versiomuutos: väli sisältää nyt J2-solmun regression (oletusskenaario { "2756.37" } -> { "2752.17" } km)

seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC-kehystys

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet -pääotsikon koodaus/dekoodaus (versio/tyyppi/toissijainen otsikko/APID/järjestyslaput/laskuri/datan pituus) + kehystysskenaario. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/space-packet.toml)

seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) – riippumaton kolmannen osapuolen toteutus standardista CCSDS 133.0-B-2; kshanan encode_packet/decode_packet täsmäsi tavu tavulta (6 oktetin pääotsikko { "33" } tapauksessa + koko koodattu paketti { "12" } tapauksessa)

seg-5510c82f671a = CCSDS Space Packet -toissijainen otsikko, paketin virheenhallinta ja segmentointi

seg-7503bf761df9 = CCSDS 133.0-B-2 Space Packet -laajennukset pääotsikon rinnalla: toissijainen otsikko, joka kuljettaa CCSDS 301.0-B -aikakoodin (CUC tai CDS, eksplisiittinen tai implisiittinen P-kenttä) ja lisädataa, CRC-16-paketin virheenhallintakenttä, suuren käyttäjädatayksikön segmentointi ja kokoaminen takaisin, virran dekoodaus järjestysaukojen ja järjestyksen tarkistuksilla sekä PUS-TM-paketit. Pääotsikon tuloste on tavu tavulta sama kuin ennen

seg-4123d600477a = Ennakkorekisteröity (003ef3eb) ennen mitään vertailua; neljä riippumatonta toteutusta, yksikään ei ole GPL, mitään ei ole vendoroitu: ccsdspy { "2.0.1" } (BSD-3-Clause) dekoodaa { "34" } Kshanan kirjoittamaa pakettia { "5" } virrassa (pääotsikko, P-kenttä, karkea ja hieno aika, CDS-kentät, lisädata, käyttäjädata, PEC), ja molemmat 1000 oktetin segmentoidut yksiköt rakennetaan sen käyttäjädatasta { "0" } erolla, ja se merkitsee pudotetun ja vaihdetun paketin virrat, jotka Kshana hylkää; { "8" } viestin ja { "57" } PEC-kentän CRC on sama kuin CPythonin binascii.crc_hqx ja spacepackets-rs { "0.18.0" } (tarkistusarvo 0x29B1); { "66" } CUC- ja CDS-aikakooditapausta vastaavat spacepackets-rs { "0.18.0" } -kirjoitusta ja -lukua oktetti oktetilta ({ "3" } CDS-tapausta myös spacepackets-py { "0.32.0" }); { "4" } spacepackets-py { "0.32.0" } PusTm -pakettia on tavu tavulta samat kuin Kshanan. Ei katettu: viraston epookin aikakoodit ({ "7" } tapausta nojaa yksikkötesteihin), TC-siirtokehykset ja kaikki pakettia alempi linkkikerros

seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, paketin virheenhallinta, segmentointi ja kokoaminen, virran dekoodaus)</s1>

seg-7c61da52b8f8 = SPICE SPK -vienti (tyypit { "9" } ja { "13" })

seg-582ce23522f6 = NAIF SPICE SPK -ydinten kirjoittaja ja lukija tyypeille { "9" } (Lagrange, epätasaiset aika-askeleet) ja { "13" } (Hermite, epätasaiset aika-askeleet), DAF-rakenteella, segmenttikuvaajilla ja epookkihakemistoilla, sekä CCSDS OEM:n vienti SPK-ytimeksi (UTC- tai TDB-epookit efemeridiajaksi)

seg-194c37ac787f = CSPICE N0067 spiceypy { "8.3.0" } kautta, sekuntihyppytiedosto naif0012.tls, ennakkorekisteröity (5059fd2a) ennen kuin SPICE luki yhtäkään Kshanan ydintä: SPICEn inventaario Kshanan neljästä ytimestä on tarkka; spkpvn ja spkgeo { "5 516" } epookilla ja { "690" } ketjuarvioinnilla ovat bitti bitiltä samat kuin Kshanan oma arviointi ja pysyvät kynnyksen sisällä jokaisessa solmussa (pahin { "0.022" } siitä); Kshana lukee SPICEn kirjoittamat ytimet bitti bitiltä identtisesti; samoilla syötteillä Kshanan ytimet ovat tavu tavulta samat kuin SPICEn ({ "0" } eroavaa tavua neljässä tiedostossa); OEM-epookit muunnetaan efemeridiajaksi { "6.0e-8" } s:n sisällä str2et:stä (kynnys { "1e-6" } s) ja SPICE arvioi OEM-viennin kynnyksen sisällä (pahin { "0.060" }). Synteettiset Kepler-kaaret: ei mitään fyysisestä tarkkuudesta. Muita SPK-tyyppejä ei kirjoiteta

seg-d699104fc2af = SPICE SPK -tyypit { "3" } ja { "21" } (Chebyshev, laajennetut erotusrivit)

seg-7d3e8b5b40af = NAIF SPICE SPK -segmenttien kirjoittaja ja lukija tyypeille { "3" } (Chebyshev-polynomit paikalle ja nopeudelle kiinteillä väleillä, aste { "0" } – { "27" }) ja { "21" } (laajennetut muunnetut erotustaulukot, JPL-integraattorien erotusrivit, MAXDIM { "15" } – { "25" }), annetuista tietueista, tiedostoissa, jotka sisältävät myös tyyppien { "9" } ja { "13" } segmenttejä; tietueen valinta ja arviointi SPICE-lukijoiden järjestyksessä. Kshana ei sovita Chebyshev-kertoimia eikä tuota erotusrivejä

seg-40323a2adce1 = CSPICE N0067 spiceypy { "8.3.0" } kautta (spkw03, spkw13 ja samasta kirjastosta sen f2c-symbolilla spkw21; spkpvn, spkgeo), ennakkorekisteröity (e1cf80d8) ennen koodin olemassaoloa, synteettiset tietueet arvottu kyseisen commitin SHA-1:stä: kolmessa tiedostossa (tyyppi { "3" } asteet { "0" }, { "12" } ja { "27" } { "3" } – { "150" } tietueella; tyyppi { "21" } MAXDIM { "15" }, { "20" } ja { "25" } { "1" } – { "250" } rivillä, nollasta kahteen hakemistomerkintään ja keskusketju; tyypit { "3" }, { "21" } ja { "13" } yhdessä tiedostossa kommenttien kanssa) SPICEn inventaario Kshanan ytimistä on tarkka, Kshanan ytimet ovat tavu tavulta samat kuin SPICEn samoista tietueista kirjoittamat, ja spkpvn ja spkgeo ovat bitti bitiltä samat kuin Kshanan lukija sekä Kshanan että SPICEn tiedostoilla ({ "48 876" } komponenttia kumpaankin suuntaan, kynnys suhteellinen { "1e-12" }). Synteettiset tietueet: ei mitään fyysisestä tarkkuudesta; todellisia JPL:n tuottamia tyypin { "21" } ytimiä ei ole tapausjoukossa

seg-39517faae95c = CCSDS-asentoviestit (AEM, APM)

seg-f88f6ea002c8 = CCSDS 504.0-B-2 -asentoviestien kirjoittaja ja lukija KVN- ja NDM/XML-muodoissa: AEM-versio { "2.0" } (ja { "1.0" } KVN:ssä, tunnisteineen ATTITUDE_DIR, QUATERNION_TYPE ja numeeriset kiertojärjestykset) kvaternioni-, Euler-kulma- ja spin-asentotyypeillä sekä niiden derivaatta-, kulmanopeus- ja nutaatiovariaateilla, useita segmenttejä; APM-versio { "2.0" } kvaternioni-, Euler-, kulmanopeus-, spin-, inertia- ja manööverilohkoilla; tietueen A-B-kvaternioni (504.0-B-2 liite F)

seg-8853058de1f3 = Orekit { "13.1.8" } (Apache-2.0) -jäsentimet ja -kirjoittajat, ajettuina erillisenä ohjelmana (xval/adm-orekit), ennakkorekisteröity (7a6a05fe) ennen mitään vertailua: Orekit jäsentää jokaisen Kshanan kirjoittaman viestin ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) ja jokainen arvo on kynnyksensä sisällä (kvaternionit { "1e-14" }, kulmat { "1e-9" } astetta; pahin { "0.054" } kynnyksestä); Kshana jäsentää { "31" } viestiä, jotka Orekit kirjoittaa samoista syötteistä, jokaisen kynnyksen sisällä; kunkin { "135" } kvaternioni-, Euler- ja spin-tietueen rotaatio on sama kuin AemSegment.getAngularCoordinates tarkkuudella { "1e-12" } (pahin { "0.0071" } kynnyksestä). Kaikki { "15" } Kshanan XML-viestiä validoituvat NDM/XML { "4.0.0" } -skeemaa vasten (data-portitettu, haettu lukitulla SHA-256-tiivisteellä). Havainto: Orekitin APM-kirjoittaja kieltäytyy manööveristä ilman MAN_DELTA_MASS-kenttää (valinnainen standardissa), joten APM-manööverit katetaan vain Kshanan kirjoitussuunnassa. Tapausjoukon ulkopuolella: AEM { "1.0" } */RATE-tyypit ja XML, toistuvat APM-lohkot

seg-5f26f879037e = CCSDS-ratadataviestit (OPM, OMM, OCM)

seg-eaddfd311fea = CCSDS 502.0-B-3 -ratadataviestien kirjoittaja ja lukija KVN- ja NDM/XML-muodoissa: OPM { "3.0" } ja { "2.0" } (tilavektori, oskuloivat Kepler-elementit, avaruusaluksen parametrit, kovarianssi, manööverit, käyttäjän määrittelemät parametrit), OMM { "3.0" } ja { "2.0" } (keskiarvoelementit keskiliikkeellä tai isolla puoliakselilla, TLE:hen liittyvät parametrit BSTAR- tai BTERM-kentällä ja AGOM, kovarianssi) sekä OCM { "3.0" } radalla (CARTP, CARTPV, CARTPVA; absoluuttiset tai suhteelliset epookit), fysikaalisten ominaisuuksien, kovarianssin (CARTP, CARTPV LTM-järjestyksessä), manööverin ja käyttäjän määrittelemien lohkojen kanssa; täystarkkuuksinen OMM SGP4-elementtijoukosta muuttumattoman OmmFile::to_omm_kvn -funktion rinnalla

seg-d4c7896b5963 = Orekit { "13.1.8" } (Apache-2.0) OPM-, OMM- ja OCM-jäsentimet ja -kirjoittajat, ajettuina erillisenä ohjelmana (xval/odm-orekit), ennakkorekisteröity (cc6841da) ennen mitään vertailua: Kshanan kirjoittamista viesteistä, joita on { "30" }, { "27" } ({ "6" } OPM-, { "5" } OMM- ja { "5" } OCM-tapausta KVN:ssä sekä XML versiolle { "3.0" }) jäsentyy Orekitissa siten, että jokainen arvo on suhteellisen { "1e-14" } sisällä ja jokainen epookki { "1e-9" } s:n sisällä ({ "904" } arvoa, pahin { "0.021" } kynnyksestä), ja Kshana lukee kaikki { "25" } viestiä, jotka Orekit kirjoittaa takaisin, samojen kynnysten sisällä ({ "858" } arvoa, pahin { "0.020" }); kaikki { "14" } Kshanan XML-viestiä validoituvat NDM/XML { "4.0.0" } -skeemaa vasten (data-portitettu). Havainnot, lukittuina, väitettä rajaten: Orekit vaatii ELEMENT_SET_NO-kentän (valinnainen standardissa 502.0-B-3), kieltäytyy COMMENT-kentästä XML:n käyttäjän määrittelemissä parametreissa (skeema sallii sen), ei kirjoita BTERM-kenttää ilman BSTAR-kenttää (joten BTERM ja AGOM katetaan vain Kshanan kirjoitussuunnassa) ja lisää OCM:n suhteelliset epookit SI-sekunteina, joten TDB:ssä ne eroavat TDB-kalenterilukemasta noin { "1.9e-10" } s/s (UTC, TAI ja TT täsmäävät). Vanha OmmFile::to_omm_kvn -tuloste, joka kääri OMM:n metatiedot META_START/META_STOP-merkkeihin, jää Orekitin hylkäämäksi (kirjattu). Laajuuden ulkopuolella: OCM:n PERT- ja OD-lohkot, ei-karteesiset elementtijoukot, muut kovarianssijärjestykset

seg-1e5ea1d9918d = 3-DOF-asennon ja suuntauksen virhebudjetti (AOCS)

seg-21f2f8efcf19 = Gravitaatiogradientin pahimman tapauksen häiriömomentti ((3/2)(μ/R³)ΔI) asennon yli otettuna huippuarvona (validoitu väite) sekä RSS-suuntausvirhebudjetti nimetyistä 1σ-osuuksista ja hallitsevasta termistä (kutsujan antamien lukujen neliösumma, validoidun väitteen ulkopuolella). Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/attitude-budget.toml)

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), riippumaton C++-toteutus täyden tensorin gravitaatiogradienttimomentista: Kshanan huippuarvo (3/2)(μ/R³)ΔI on sama kuin Basiliskin momentti { "45" } asteen asennossa suhteellisen { "1e-12" } sisällä (pahin { "2.1e-15" }) { "5" } korkeudella ja { "8" } inertiatensorilla, ja rajaa Basiliskin momentin { "2000" } satunnaisessa asennossa tapausta kohti; toleranssi lukittu ennen vertailua. Validoitu väite: gravitaatiogradienttimomentin huippu. RSS-suuntausbudjetti on kutsujan antamien lukujen neliösumma ilman ulkoista totuutta ja jää sen ulkopuolelle; käsin koodattu Hipparchuksen täyden tensorin maksimointi säilyy tukevana itsejohdonmukaisuustarkistuksena. Ei säätösilmukan / 6-DoF- / joustavien moodien simulaatiota

seg-1461aa14a7ff = Maa-aseman ylilentojen ennustus (maasegmentti)

seg-e1cf1ec4f005 = Aikatason näkyvyysylilennot (AOS/TCA/LOS, maksimikorkeuskulma, kesto) moottorin propagaattorille aseman yli korkeuskulmamaskin yläpuolella, interpoloiduin nousu- ja laskuylityksin sekä kokonaissaavutettavuus: passes::predict_passes, geometrinen aikataulutin (ei refraktiota eikä valon kulkuaikaa). Skenaariolaji <c1/> ajaa rivin 'Apparent ground-station pass prediction with refraction and light time' näennäisen ennustimen

seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } – riippumaton lentodynamiikkakirjasto: ElevationDetector (Brentin juurenhaku) + EventsLogger ITRF-efemeridin yli, asema WGS-84 TopocentricFramena. AOS/LOS/maksimikorkeuskulma/ylilentojen lukumäärä/kokonaissaavutettavuus täsmäytetty identtisellä radalla+asemalla+maskilla+ikkunalla (sitoutettu testiaineisto; ajuri xval/orekit-passes)

seg-1dd8b2655b18 = Maa-aseman näennäisten ylilentojen ennustus refraktiolla ja valon kulkuajalla

seg-46f93d3c24d2 = Näkyvyysylilennot (AOS, TCA, LOS, suurin näennäinen korkeuskulma, kesto) SGP4-elementtijoukolle WGS-84-aseman yli validoidulla Maa-radan polulla (IAU 2006/2000A, valinnaiset Maan orientaatioparametrit), ITU-R P.834-9 -troposfäärirefraktiolla (yhtälöt { "9" } – { "14" }, suosituksen painetut kertoimet) ja alalinkin valon kulkuajalla, kumpikin kytkettävissä; ylitykset ratkaistaan bisektiolla tarkkuuteen { "1e-7" } s ja kulminaatio kultaisen leikkauksen haulla. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/passes.toml), molemmat korjaukset oletuksena päällä

seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) ja Hipparchus { "4.0.3" }: TLEPropagator samoille elementtijoukoille TEME-koordinaatistossa, jonka Orekit rakentaa ilmoitetun määritelmän mukaan (sen IERS { "2010" } TOD kierrettynä GAST - GMST), ElevationDetector ja ElevationExtremumDetector ITURP834AtmosphericRefraction-refraktiolla ja ilman sitä, sekä AngularAzEl AngularRadioRefractionModifier-muokkaajalla valon kulkuajan tapaukselle, ylitykset ja maksimi ratkaistu Hipparchuksella; { "60" } tapausta (neljä rataa, viisi merenpinnan tason asemaa, maskit { "0" }, { "5" } ja { "10" } astetta, { "24" } tuntia). Kynnykset lukittu ennen ajoa (ennakkorekisteröity e947e69d, 72ea9eb0:n osa { "3" }). Jos valon kulkuaika sivuutetaan ({ "9777" } epäonnistumista) tai P.834-vakio { "1.728" } muutetaan arvoon { "1.828" } ({ "7883" } epäonnistumista), testi muuttuu punaiseksi. Laajuus: asemat merenpinnan tasolla; Orekitin P.834 h*theta0^{ "2" } -kerroin on { "0.011380" }, kun suositus painaa { "0.01380" } (lukittu), joten merenpinnan yläpuolella olevia korkeuksia ei verrata. Kierros { "1" }, Orekitin oletus-IERS { "1996" } TEME:ä vasten, täytti jokaisen ylilentokynnyksen mutta ohitti suuntakynnyksen { "72" } mas:n TEME-käytäntöerolla (lukittu)

seg-7b4a8e25c3c9 = DVB-S2 mukautuva koodaus ja modulaatio LEO-alalinkin ylilennon aikana

seg-3912fb8ccb15 = Alalinkin Es/N0 yhden satelliitin jokaisen ylilennon aikana yhden aseman yli (EIRP, vapaan tilan häviö, kosekanttilain ilmakehähäviö, muut häviöt, G/T, Boltzmannin vakio, symbolinopeus), tehokkain DVB-S2 MODCOD, joka ylittää ETSI EN { "302" } 307-1 V1.4.1 taulukon { "13" } lähes virheettömän kynnyksen lisättynä toteutusmarginaalilla kussakin vaiheessa, ylilennon ACM-datamäärä sekä vakiokoodauksen vertailutaso, joka sulkeutuu maskilla ja pisimmällä etäisyydellä. Ajettavissa skenaariolajina <c1/>. Havainnollistavat syötteet; MODELLED.

seg-a7f26e3a6030 = Sisäinen johdonmukaisuus: suljetussa muodossa taulukon 5a K_bch:stä ja kehyspituuksista laskettu spektrinen hyötysuhde täsmää taulukon { "13" } painettuihin hyötysuhteisiin (kynnystaulukon kirjoitusvirhetarkistus); linkkibudjetin osat täsmäävät suljettuihin muotoihinsa; valinta on monotoninen Es/N0:n suhteen ja kunnioittaa marginaalia; ACM siirtää vähintään vakiokoodauksen datamäärän. Ylilennon geometria tulee erikseen VALIDATED-tasoisesta näennäisten ylilentojen ennustimesta. MITÄ EI OLE: mitään ulkoista työkalua tai mitattua linkkiä ei ole verrattu; kynnykset ovat standardin ihanteelliset AWGN-arvot, eivät modeemin; sadevaimennusta, suuntausvirhettä ylilennon aikana ja pilottisymboleja ei mallinneta.

seg-19603a7e0fe8 = Usean satelliitin ja usean aseman maayhteyksien aikataulutus konfliktinratkaisulla

seg-40edeae6e48b = Ehdokasyhteydet jokaisesta satelliitti-asema-ylilennosta ACM-datamäärineen; konfliktit, joissa yksi antenni palvelisi kahta satelliittia käännösaikansa sisällä tai yksi satelliitti lähettäisi alalinkillä kahdelle asemalle yhtä aikaa; prioriteettipainotettu toimitustavoite, jota rajoittaa kunkin satelliitin kertymä; laiska rajahyötyyn perustuva ahne suunnitelma, ensin tullut ensin palvellaan -vertailutaso ja tarkka branch and bound enintään { "26" } ehdokkaalle, ahneen ratkaisun optimaalisuuskuilu raportoituna. Ajettavissa skenaariolajina <c1/>. Havainnollistavat syötteet; MODELLED.

seg-bc520db98f9a = Sisäinen johdonmukaisuus: tarkka branch and bound täsmää raakaan kaikkien vaihtoehtojen läpikäyntiin pienillä satunnaisjoukoilla, jokainen suunnitelma tarkistetaan toteuttamiskelpoiseksi konfliktisääntöjä vasten, eikä ahne ratkaisu koskaan voita tarkkaa optimia. MITÄ EI OLE: mitään ulkoista aikatauluttajaa tai operatiivista suunnitelmaa ei ole verrattu; yhteydet otetaan kokonaisina (ei jakamista), kertymä on kiinteä ikkunan alussa, kiinteän käännösajan ylittävää kääntöaikaa ja aluksen tallennustilaa ei mallinneta.

seg-ddf2bc2f13a9 = Yksisuuntainen linkkibudjetti (viestintä / linkin suunnittelu)

seg-83331f513dba = Vapaan tilan etenemishäviö, C/N₀, Eb/N₀, marginaali ja sulkeutuminen CCSDS { "401" } / DSN 810-005 -linkkiyhtälöllä arvoille EIRP/G·T/etäisyys/nopeus/kaista vaadittua Eb/N₀:aa vasten. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/link-budget.toml)

seg-195bf7e31f24 = Julkaistu syväavaruuden tietoliikenteen suunnitteluohjaustaulukko lukittuina numeerisina vektoreina: DESCANSO / J. H. Yuen (toim.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, taulukko 1-1 (Galileo X-kaista) – kshana kokoaa taulukon rivikohdat uudelleen ja toistaa sen julkaistun päästä päähän L_fs { "290.54" } dB ja Pr/N0 { "54.6" } dB-Hz; vapaan tilan häviö tarkistettu myös ITU-R P.525:tä vasten

seg-3742d2aea62a = Taloudellinen kustannus/kattavuus- ja ROI-kehystys

seg-4228311689f8 = Kustannus per kattavuusprosentti + kattavuus per euro -ROI tähdistön mitoitusmoottorin päälle; satelliittikohtainen kustannus on kutsujan hankkima matala/nimellinen/korkea-haarukka (ei keksittyjä hintoja)

seg-d542ac64c31c = Suljetun muodon kustannuslaskenta käsin johdettuja arvoja vasten; mallinnetun kattavuusluvun taloudellinen KEHYSTYS, ei tarjous eikä validoitu kustannusmalli

seg-8ba6ee9acc8a = Havaitsemattoman häiriön eheysvaikutus (kontekstitietoinen HPL/VPL vs hälytysraja)

seg-f5985399d0d5 = Kuvaa havaitsemattoman harhautus- (spoofing) tai häirintäharhan (jamming) tehokkaaksi virheeksi → Stanford-alue (available/unavailable/MI/HMI) kontekstikohtaisia HAL/VAL-arvoja vasten (avoin taivas vs kaupunki)

seg-124d0ffe959e = Kokoaa ulkoisesti validoidun RAIM-Stanford-luokittelun (raim::classify_stanford); havaitsematta jääneen tapahtuman → AL-kuvaus itsessään on mallinnettu, ei sertifioitu eheysallokaatio

seg-37d43b5b918a = CAI:n viitattu virhemalliparametrilehti ({ "13503" })

seg-0b6a901f5ad2 = Haarukoitu (paras/nimellinen/konservatiivinen) kylmäatomi-interferometrin suorituskyky – harhan epävakaus, nopeus-/kulmasatunnaiskävely, asteikkokertoimen vakaus, kyselyajan rajoittama näytteenottotaajuus, vyöepäselvyyden dynaaminen alue – jokainen lähdeviitteen kautta jäljitettävissä; syöttää QuantumNavBudgetia mallintamatta laitteistoa

seg-4b66096727b8 = Sisäinen johdonmukaisuus: viitattu VRW-haarukka ristiintarkistettu CaiAccelerometer::accel_asd-fysiikkaa vasten + raaka dynaaminen alue laskettuna vyöepäselvyysrajasta; luvut ovat MODELLED-tasoisia kirjallisuuskatsauksen haarukoita (needs_source_confirmation), yhtäkään laitetta ei ole validoitu, ei validointikehää

seg-c93f2d3a3167 = Ajoituksen eheyden yhdenmukaisuusbenchmark – Stanford-eheyskaavion epookkiluokittelija

seg-712d5c35a6a6 = TIB:n Stanford-eheyskaavion epookkiluokittelu (nominal / unavailable / MI / HMI)

seg-93b913e60063 = Riippumaton numpy-uudelleentoteutus neljän alueen säännöstä (scripts/gen_tib_scorer_reference.py) identtisellä näytejoukolla; menetelmä viitattu Stanford–ESA-eheyskaaviosta (Tossaint ym., ION GNSS { "2007" }) ja RTCA DO-229 WAAS MOPS:sta. EI ExternalDataset-tarkkuusoraakkeli – benchmark on rehellisyydelle immuuni.

seg-573aa0193cb3 = Ajoituksen eheyden yhdenmukaisuusbenchmark – eheyskattavuuden pisteytin

seg-4d86f3c2d8f5 = TIB:n eheyskattavuuden pisteytys (HMI/MI/saatavuusluvut + ylärajan kattavuusverdikti)

seg-645eb084ae8e = Riippumaton numpy-aluelaskenta tiedostossa tests/fixtures/tib/reference.json; vain pisteyttimen koneiston ristiintarkistus, ei tarkkuusväitettä.

seg-372dd0fdb025 = Ajoituksen eheyden yhdenmukaisuusbenchmark – vikakatalogi (parametriset generaattorit)

seg-2604e7cf27d2 = TIB:n vikavalikoima (domain-divergence, clock-slam, holdover-coast, staattinen/inkrementaalinen/symmetrinen/epäsymmetrinen viive, replay-within-freshness, path-selective, k-of-N quorum)

seg-b907aecaccd0 = Edustavat parametriset vikageneraattorit (mallinnettu); havaitsematon joukko (symmetrinen viive, replay-within-freshness) on viitattu lähteistä Mizrahi RFC { "7384" } ja Narula & Humphreys (IEEE JSTSP { "2018" }). Ei ulkoista oraakkelia – vikakatalogi ei esitä mitattua väitettä.

seg-90c0eb1e7c14 = Ajoituksen eheyden yhdenmukaisuusbenchmark – havaitsemattoman absorboitumisen verdikti

seg-f713acf042ff = TIB:n havaitsemattoman absorboitumisen verdikti (symmetrinen/replay on absorboitava PL:ään, ei koskaan raportoitava havaituksi)

seg-6840c2467c63 = Ominaisuustarkistus siitä, että Verdict-enum ei rakenteellisesti voi raportoida havaitsematonta vikaa havaituksi (Mizrahi RFC { "7384" }); absorboitunut ⟺ PL ≥ siirtymä. Ei tarkkuusoraakkelia.

seg-3652a591eefc = Avaruusaluksen alustan suunnittelu (AOCS/lämpö/rakenteet/propulsio/teho)

seg-50a9c1c7dff0 = Ei tarjota – Kshana on navigointisuorituskyvyn simulaattori, ei alustatoimittaja

seg-a349aa76b0ed = PARTNER

seg-b28dd62dca1c = Navigoinnin RF-hyötykuorman ja antennilaitteiston suunnittelu

seg-76c983a23e7b = Ei tarjota – Kshana mallintaa signaalin suorituskykyä, ei hyötykuorma- tai antennilaitteistoa

seg-7bba3b35214c = Kvanttihyötykuorman laitteiston suunnittelu ja kypsytys

seg-15fcc200b859 = Ei tarjota – vain suorituskykymalleja; kylmäatomi- ja kellolaitteisto on kumppanin

seg-d69dd4c5167b = Lentolaitteiston tuotevarmistus (säteily/EEE/MAIT)

seg-b1540f78ffd4 = Ei tarjota – Kshana käsittelee vain ohjelmiston tuotevarmistusta; lentotuotevarmistus on kumppanin

seg-1f200f8efc71 = Kuun koordinaattiaika

seg-2e6961dbffe9 = Relativistinen Maa–Kuu-kellonopeus (LTC/TCL) + TT/TAI/UTC-ketjutus + kokonaisuus

seg-3f52d6e04361 = Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; IAU/IAG LunaNet LTC:n perusta): Kuun pinnan itsepotentiaali L_m = { "3.13881e-11" } ja pitkäaikainen kokonaisarvo { "56.02" } µs/vrk täsmäytetty julkaistuina numeerisina arvoina; geosentrinen Kuun nopeus ristiintarkistettu JPL DE440:tä vasten (de440s.bsp SPICEn kautta)

seg-8adbbd2cdb74 = Hybridi optinen/RF-raportin itsekuvaus

seg-2a5e48b558e1 = Raportti hybrid-optical-rf ilmoittaa linkkikonfiguraation, jolla se todella ajettiin (kantoaallon aallonpituus, lähetys- ja vastaanottoapertuuri, etäisyys, pulssin leveys, integrointiaika, hyötysuhteet ja häviöt, oletukset ratkaistuina) ja sisältää yksikkölohkon, joka antaa jokaisen sellaisen suureen yksikön ja alkuperäluokan, jonka artikkeli todennäköisesti lainaa, mukaan lukien siirtokovarianssin jäljet neliömetreinä

seg-23f0c10237f4 = Ei ulkoista oraakkelia, eikä sellainen ole mahdollinen: tämä on itsekuvaus, ei mittaus. Se kirjataan, koska sen puute oli vika – P5:n piti lainata kantoaallon aallonpituus ja lähetysapertuuri lähdekoodin oletuksista ja päätellä sisäisen johdonmukaisuustarkistuksen avulla, että pelkkä <c1/> oli neliömetreinä. Päätelmä oli oikea, ja juuri siksi sillä oli väliä: mikään ei olisi havainnut sen olleen väärä

seg-0691f3dee8cb = Hybridi optisen/RF-linkin saatavuus RF-puolella

seg-72ccb655caf0 = Raportti hybrid-optical-rf ilmoittaa RF-linkin saatavuuden, joka on koottu suureista, jotka moottori jo laskee, ei tuodusta ilmastotiedosta, ja ilmoittaa koostamisen nimettynä sääntönä: A_rf = I_closure * I_track, jossa I_closure on yksisuuntaisen CCSDS-401 / DSN-810-005 -linkkibudjetin (linkbudget::link_budget, Eb/N0-marginaali >= { "0" }) sulkeutumisverdikti skenaarion omalla etäisyydellä ja I_track on seurantasilmukan verdikti (jamming::lock_status) siitä C/N0:sta, jonka SAMA budjetti palautti. Jokainen tekijä vie syötteensä alkuperäluokan läpi tulosteeseen, ja tekijät, jotka tarkoituksella EIVÄT ole tulossa mukana – geometrinen näkyvyys, häiriön aiheuttama esto ja RF-katkosten ilmastotiedot – nimetään syineen sen sijaan, että ne asetettaisiin hiljaa arvoon { "1" }. Ratkaistu RF-osuus toistetaan omana rf_link_configuration-lohkonaan, ja indikaattorin vieressä olevat jatkuvat luvut (linkin marginaali, C/N0-marginaali, suljetun muodon sulkeutumis- ja seurantaetäisyydet sekä etäisyyden käyttöaste) ovat saman budjetin etäisyyskäänteisfunktioita. Raportti toteaa täydessä laajuudessaan lohkossa ja yksikkömerkinnässä, johon lukija päätyy, että tämä luku on MARGINAALIN/GEOMETRIAN RAJOITTAMA ja DETERMINISTINEN, kun taas optinen saatavuus on SÄÄN/ILMASTOTIEDON RAJOITTAMA ja todennäköisyyspohjainen, joten niitä ei voi koskaan esittää vertailukelpoisena prosenttilukuparina

seg-319705ea0166 = Ei ulkoista oraakkelia, ja ExternalDataset on hylätty. Kaksi syötettä ovat Eb/N0-marginaali ja C/N0-kynnyksen ylitys, molemmat MODELLED-tasoisen EIRP:n, laatuluvun ja summattujen häviöiden allokaation funktioita; Maa–Kuu-optiselle/RF-hybridipalvelulle ei ole mitattua saatavuustallennetta, jota vasten koostettua lukua voisi tarkistaa. Olemassa olevat tarkistukset ovat sisäisiä ja ilmoitetaan sellaisiksi: koostaminen lasketaan uudelleen raportin omista julkaistuista marginaaleista eikä lähettäjän sisäisistä arvoista, ja sulkeutumisetäisyys varmistetaan ajamalla linkkiyhtälö uudelleen SILLÄ etäisyydellä ja vaatimalla marginaalin häviävän – käänteisfunktion edestakaisajo, ei riippumaton toteutus. Luvun rehellinen raja kirjataan itse raporttiin: se on deterministinen 0/1-indikaattori, ei todennäköisyys, koska mikään tässä moottorissa ei mittaa RF-linkin katkosjakaumaa tällä kaistalla ja geometrialla. Tuo puuttuva syöte nimetään kentässä rf_availability.factors_not_included eikä keksitä, ja sen toimittaminen on se, mitä todennäköisyyspohjainen RF-saatavuus vaatisi

seg-22c5df9b6c7c = Vertailukelpoinen optisen ja RF-etäisyysmittauksen vertailu

seg-70eb396f40af = Raportti hybrid-optical-rf antaa optisen ja RF-etäisyysmittauksen suhteen siten, että YKSI konfiguraatio, jolla molemmat osuudet arvioitiin, kulkee samassa oliossa: sama yksisuuntainen reitti, sama etäisyys ja sama kertymäaika. Optinen osuus on moottorin fotonirajoitteinen ToA-CRLB yksisuuntaisella fotonimäärällä; RF-osuus on moottorin DLL:n early-late-lämpökoodinseurantajitter sillä C/N0:lla, jonka moottorin oma linkkibudjetti palauttaa samalle yksisuuntaiselle etäisyydelle. Silmukan kohinakaistanleveys johdetaan, ei valita: B_L = 1/({ "2" }*integration_s) asettaa RF-osuuden täsmälleen optiseen kertymäaikaan, ja jos kutsuja ohittaa sen niin, että kaksi keskiarvoistusaikaa eroavat, suhde on REFUSED – null, ristiriita ja molemmat ajat nimettyinä – sen sijaan, että se esitettäisiin kahdessa toimintapisteessä. Suhdetta ei muodosteta skenaarion VALITTUA parametrista rf_position_sigma_m -arvoa vasten, ja kieltäytyminen kertoo syyn: tuo syöte ei sisällä lainkaan konfiguraatiota. Julkaistu kaksisuuntainen optinen otsikkoluku ja tarkka kerroin, joka yhdistää sen yksisuuntaiseen vertailuosuuteen, annetaan suhteen vieressä, jotta raporttia ei voi lukea kahden keskenään ristiriitaisen optisen sigman kantajana

seg-acbb3ac98ee3 = Ei ulkoista oraakkelia SUHTEELLE, ja ExternalDataset on hylätty tarkoituksella. Taustalla olevalla RF-ketjulla sellainen on – tests/validate_p5_rf_ranging_precision.rs tarkistaa linkbudget::link_budget- ja navsignal::dll_code_jitter_chips-funktiot riippumatonta Python/NumPy-testiaineistoa vasten sekä kovakoodattua Kaplan & Hegarty -esimerkkiarvoa vasten ({ "2.814e-3" } piiriä / { "0.825" } m kohdassa { "45" } dB-Hz) – ja optisella CRLB:llä on oma suljetun muodon rivinsä. Kummankin ankkurin väittäminen tälle riville olisi lainattua validointia, jonka estämiseksi matriisin invariantit ovat olemassa: tässä suure on SUHDE konfiguraatiossa, jonka EIRP, laatuluku, lähetysteho ja apertuuri ovat MODELLED-tasoisia, eikä mitattua optisen ja RF-etäisyysmittauksen vertailua yhteisessä toimintapisteessä ole, jota vasten sitä voisi tarkistaa. Sisäisesti tarkistetaan se, minkä suhde voi todella tehdä väärin: että kaksi osuutta ovat yhdessä toimintapisteessä. Se mitataan skaalaamalla yhteistä kertymäaikaa ja vaatimalla, että molemmat osuudet liikkuvat saman neliöjuurilain mukaan ja suhde pysyy paikallaan, ja se pakotetaan hylkäämällä suhde kokonaan, kun keskiarvoistusajat eroavat. Molemmat osuudet ovat lämpö-/laukauskohinarajoja ja molemmat jättävät pois median viiveen, kellovirheen ja epäselvyyden, joten poisjättö on identtinen kummallakin puolella; raportti sanoo tämän eikä jätä sitä pääteltäväksi

seg-3f26f598e013 = Linkkibudjettiraportin itsekuvaus

seg-b88bf41d6d4c = Linkkibudjettiraportti ilmoittaa jokaisen absoluuttisen vakion, josta sen oma marginaali laskettiin – kantoaaltotaajuuden, jota vapaan tilan häviö käytti, EIRP:n, laatuluvun, summatun häviön ja Boltzmannin termin – sekä vaaditun G/T:n, jolla marginaali on nolla, linkkivakion (EIRP - häviöt - vaadittu Eb/N0), joka on ainoa yhdistelmä, jonka julkaistu nopeus/vahvistus-taulukko voi koskaan kiinnittää, ja kun kutsuja ilmoittaa järjestelmän kohinalämpötilan, vastaanottoantennin vahvistuksen, jonka tuo laatuluku edellyttää

seg-52f98f50522f = Ei ulkoista oraakkelia: tämä on itsekuvaus yhtälöstä, joka on jo validoitu julkaistua suunnitteluohjaustaulukkoa vasten (ks. rivi yksisuuntainen linkkibudjetti). Se kirjataan, koska sen puute oli mitattu vika – tiedoston d1_rate_gain_beamwidth.csv toistaminen vaati yhden tehollisen vakion takaisinratkaisua tarkkuuteen { "0.0034" } dB kaikilta kolmeltakymmeneltä riviltä, ja moottori sekä nimeää nyt tuon yhdistelmän että todistaa testillä, ettei mikään julkaistu taulukko olisi voinut koskaan erottaa sen kolmea osaa

seg-a7b192e27cb5 = Kelloluokkakohtainen Kuun ajan risteystaulukko

seg-cab605dc6ea2 = Yksi Kuun aikabudjetin ajo tuottaa kello-vs-koordinaatisto-risteysrivin jokaiselle kelloluokalle yhtä jaettua koordinaatistotermiä vasten, joten kello on ainoa vertailun muuttuja; jokainen rivi kantaa kahdella tavalla saavutetun risteyksen – bisektiolla yleisestä potenssilakiaikavirhekäyrästä ja algebrallisesti käänteisfunktiolla rivin hallitsevasta kohinatyypistä – sekä niiden suhteellisen eron

seg-ccec15f0b125 = Kaksi eri koodikannan sisäistä laskentaa samalle suureelle, ei yhden toistoa: IEEE-1139-potenssilakikäyrän bisektio ei tiedä mitään kohinatyypistä, kun taas suljettu muoto kääntää hallitsevan tyypin algebrallisesti, joten väärin luokiteltu kohinatyyppi tai huono haarukka näkyy ei-pienenä suhteellisena erona. Neljä arvoa toistavat myös artikkelin julkaistun taulukon puoleen viimeisestä painetusta numerosta – mutta tuo taulukko rekonstruoitiin itse samasta suljetusta muodosta, joten se on toistettavuustarkistus eikä ulkoinen oraakkeli, ja koordinaatistotermi, jota vasten se mitataan, on mallinnettu allokaatio

seg-ff32b78acb8c = Yhteinen UT1- ja napaliikevirhe yhteisellä rivijoukolla

seg-561e588153af = Yksi taulukko raportoi UT1-ennustevirheen, napaliikkeen napavirheen ja niiden neliösummayhdistelmän Kuussa IDENTTISELLÄ epookkijoukolla horisonttia kohti ja antaa epookit, joissa kukin komponentti mitattiin. Lisäksi skenaario nimeää käytössä olevan EOP-syötteen ja purkaa sen rivilaskennan, ja antaa aina ennustettu vs lopullinen -horisonttitaulukon sekä nimenomaisen toteamuksen siitä, miksi se on tyhjä, kun se on tyhjä

seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3), joka lukee IERS finals2000A -tuotteen omalla Bulletin-B-muuten-A-säännöllään, ja pyerfa { "2.0.1.5" } (SOFA) täydet taivaallisesta maanpäälliseen -rotaatiot (c2i06a, sp00, pom00, c2tcio; Maan kiertokulma IERS { "2010" } yhtälön { "5.15" } mukaan tarkassa aritmetiikassa), ajettuina erillisinä ohjelmina jäädytetyn 2026-09-30 finals2000A.all -tiedoston sanatarkoilla riveillä; ennakkorekisteröity (455b8fb5) muutoksilla A1 ja A2, jotka kiinnittivät vain oraakkelin numeerisen tarkkuuden (molemmat julkistettu ajojen kanssa, joita ne seurasivat): jokainen taulukon { "3" } epookkilista sama, UT1- ja napatunnusluvut { "6e-16" } sisällä, yhdistelmä { "1.9e-7" } sisällä, 12/12 ennustettu vs lopullinen -tapausta. Yhdistelmätarkistus ei erottele napatermin virheitä alle noin { "1e-4" } suhteellisen, koska UT1 hallitsee sitä; navan tarkkuus nojaa napatunnuslukutarkistukseen, jonka kynnys on { "1e-9" }. Epookkijoukko- ja varasäännöt ovat generaattorin peilaamia Kshanan määritelmiä, ja tyhjän taulukon tilat ovat suunnittelukäyttäytymistä ilman ulkoista totuutta. Suuruusluokat: IERS Annual Report { "2019" } taulukon 3a toteutuneet ennustevirheet, Kshana/IERS { "1.001" } – { "1.100" } arvoilla { "1" } – { "90" } vrk (kynnys [{ "0.8" }, { "1.25" }], mitattu). Rivilaskenta: astropy (offline-syöterivi). Kierros { "1" } (säilytetty regressiotestinä): { "178" } Bulletin A -julkaisun painettua tarkkuuskaavaa vasten napa täsmää 1.5x:n sisällä eikä UT1 täsmää, mikä testaa IERS-kaavaa sen toteutunutta virhettä vasten

seg-3692f1fc89e6 = Offline-oletuksena oleva Maan orientaatiosyöte on todellinen IERS-tuote

seg-f9a9d385fd26 = <c1/>-ajonaikainen oletus on kirjaston oma sulautettu kopio sanatarkasta IERS finals2000A -otteesta (tools/finals2000A_20260930.txt: { "174" } peräkkäistä päivärivia, MJD 61224-61397, leikattu 2026-09-30:n finals2000A.all -tiedostosta), ja se sisältää kaikki kolme rivivintagea, jotka muoto määrittelee, luokiteltuna IERS:n I/P-lipuilla (eop::row_vintage): { "30" } Bulletin B finals -riviä, { "54" } nopeaa mitattua riviä (lippu I ilman Bulletin B -lohkoa) ja { "90" } Bulletin A -ennustetta (lippu P). Paljas ajo ilman tiedostoargumenttia ja ilman verkkoa antaa täytetyn horisonttikohtaisen taulukon, rivilaskennan rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) ja predicted_rows.n = { "90" } välillä MJD 61308-61397; ennustettu vs lopullinen -vertailujen julkaisuhetken katkaisu on viimeinen mitattu rivi. Aiempi 32 rivin ote (tools/finals2000A_2026.txt, jokaisen rivin lippu I) ja viiden rivin vain lopullisia sisältävä ote pysyvät toimitettuina ja käytössä: niillä predicted_rows.n on { "0" }, mikä on syötetiedoston ominaisuus eikä jäsentimen tulos

seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), joka lukee samat tavut omalla lukijallaan, ja IERS Bulletin A Vol. XXXIX No. { "039" } -taulukko kopioituna numero numerolta; ennakkorekisteröity (6fdae01b) kuudella tarkalla kriteerillä ennen kuin astropy ajettiin. Kaikki kuusi täyttyvät: { "30" } lopullista, { "54" } nopeaa ja { "90" } ennustettua riviä yhtäpitävillä MJD-listoilla, jokaisen ennustetun rivin lippu P, oletusajon rivilaskenta sama ja ennusteet täsmäävät Bulletin A:han viimeisen painetun numeron tarkkuudella. Julkistettu: leikkaus valittiin lippujen ja Bulletin B -lohkon pelkällä sarakeviipaloinnilla, joka näytti 30/54/90, ennen commitia; ote on sanatarkka viipale, jonka tämä repositorio leikkasi IERS-tuotteesta (SHA-256 testiaineiston NOTICE-tiedostossa). Validoitu väite on toimitetun oletussyötteen vintage-luokittelu ja rivilaskenta sekä sen ennustetut rivit; mielivaltaiset käyttäjäsyötteet luokitellaan samalla lippusäännöllä mutta eivät kuulu vertailuun. { "0.30" } kierros { "1" } (korvattu): aiempi oletus kutsui { "12" } lippu-I-riviä Bulletin A -ennusteiksi; moottori luokittelee nyt lipun mukaan. REVISIONS: oletusajon solut, jotka muuttuivat, on lueteltu vanhasta uuteen tiedostossa docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, napalattia { "0.06776" } -> { "0.05550" } mas, Maan orientaatiotermi { "14.01601" } -> { "14.01583" } m, kokonaisuus { "20.09759" } -> { "20.09746" } m ja { "67.03834" } -> { "67.03790" } ns, tiedoston tests/golden/realtime-frame-eop.csv taulukon { "2" } rivit ja operatiivisen ennustimen yhtäpitävyysluvut); aiemmat tiedostossa docs/revisions/G12-default-eop-cell-changes.md

seg-18c72a7565d6 = Kaappausjalanjälki korkeuden ja keilanleveyden funktiona

seg-9c30a0ab5233 = Kaksiakselinen pyyhkäisy kuviopainotetusta, korkeusrajoitetusta pintakaappausjalanjäljestä lähettimen korkeuden ja antennin halkaisijan yli, yksi rivi toimintapistettä kohti ja kunkin halkaisijan edellyttämä puolitehokeilanleveys, sekä limbin kaappaus raportoituna KYNNYKSENÄ – riviä kohti limbin J/S, sen marginaali ja lähetysteho, joka sulkisi sen; ruudukkoa kohti paikannetut ylitykset tai nimenomainen toteamus siitä, ettei limbiä saavuteta missään ruudukossa, vajeen kanssa

seg-4d866b62d4f7 = Joukkoon sisältyminen: häiriö-signaali-suhde tulee tasaisena desibelisiirtymänä, joten kaapattu joukko suuremmalla lähetysteholla sisältää joukon pienemmällä ja osuus voi vain kasvaa – ominaisuus, jota Airy-kuvio EI anna keilanleveyden tai korkeuden suhteen, jossa kaapattu alue hajoaa renkaiksi ja osuus on aidosti ei-monotoninen. Mikään julkaistu taulukko ei anna Kuun kiertoradalla olevan lähettimen kaapatun kiekon osuutta korkeuden ja keilanleveyden funktiona, joten näille soluille ei ole mitään ulkoista tarkistuskohdetta; alla oleva kuvio on erikseen validoitu julkaistuja Bessel-arvoja vasten ja pitää oman rivinsä

seg-fc0a64b9a280 = Kuun aikavirhebudjetin toistettavuus

seg-5d5970506b9c = Skenaario lunar-time-budget julkaisee taulukkoarvoiset tulosteensa pitkän muodon (ruudukkoindeksi, keskiarvoistusaika, termi) taulukkona raportin rinnalla, joten seitsemän termikohtaista x(tau)-käyrää ja neliösummakokonaisuus ovat moottorin tulostetta eikä jotain, minkä lukija rakentaa uudelleen menetelmäosiosta

seg-62df6258bc62 = Vain itsejohdonmukaisuus: julkaistu kokonaisuus tarkistetaan saman tiedoston termien neliösummaa vasten, ja tuotettu käyrä toistaa julkaistun p3_time_budget_curve.csv-tiedoston kaikissa { "57" } pisteessä. Molemmat tarkistukset jakavat tämän moottorin omat termimääritelmät, joten kumpikaan ei ole riippumaton. Kellotermi nojaa julkaistuihin kellomäärittelyihin, mutta linkin, koordinaatiston, relativistisen ja efemeridilattian SUURUUDET ovat dokumentoituja budjettiallokaatioita ilman ulkoista oraakkelia

seg-675887733454 = Kuun aseman aikalaboratorio: miniRAFS-holdover vs LTC

seg-7dfedc40da6a = Skenaarion lunar-time-budget valinnainen [time_lab]-lohko mallintaa Kuun vertailuaseman kelloa (oletuksena miniRAFS-luokka, tai mikä tahansa nimetty luokka, tai ilmoitettuihin vakauspisteisiin sovitettu laitekortti), joka ohjataan Kuun koordinaattiaikaan ja sen jälkeen joko vapaasti käyvänä tai uudelleenohjattuna N sekunnin välein: aikavirhekäyrä x(t) kellon potenssilakitermin, vakioisen ohjausjäännöksen (ILLUSTRATIVE), vakioisen LTC-toteutusjäännöksen ja valinnaisesti mukaan otettavan aseman korkeuden nopeustermin neliösummana; ohjauksen jälkeinen aika arvoihin { "1" }, { "10" } ja { "100" } ns (tai ilmoitetut kynnykset) bisektiolla hallitsevan kohinatyypin suljetun muodon käänteisfunktion rinnalla sekä hallitseva termi kullakin ilmoitetulla horisontilla, kaikki yksiköineen

seg-3801e9b32309 = Vain sisäinen johdonmukaisuus: bisektiolla saatu aika kynnykseen tarkistetaan kellon hallitsevan kohinatyypin suljetun muodon käänteisfunktiota vasten ja vapaasti käyvä kellotermi budjetin omaa kellotermiä vasten. Kelloluokat nojaavat julkaistuihin yhden vuorokauden määrittelyihin (niiden omat rivit); LTC-nopeutta ei johdeta tässä uudelleen ja sillä on oma VALIDATED-rivinsä (Lunar coordinate time); ohjausjäännös on ILLUSTRATIVE, toteutusjäännös on budjettiallokaatio, eikä lämpömallia sisällytetä. ICG WG-B:n Lunar PNT -aineiston kesäkuun { "2024" } nanosekuntitason tavoite lainataan lähteen toteamuksena, ei omaksuta väitteeksi; mikään tässä ei ole väite minkään todellisen asemakellon ominaisuuksista

seg-af3ff120b707 = Kuun geodeettinen VLBI

seg-cfd7d0126028 = Lähikentän VLBI-viive Maa-peruslinjalle, joka havaitsee Kuun majakan + osittaisderivaatat

seg-d1943f9932af = Tasoaaltomallin delta_dor (sama koodikanta) kaukokentän rajalla; äärelliset differenssiosittaisderivaatat. { "0.30" } ulkoinen vertailu, havainto (pysyy tasolla MODELLED): ANISE { "0.10" } konvergoituja valon kulkuaikoja vasten DE440:n kautta ({ "75" } viivettä 2024-01-01 kolmella DSN-peruslinjalla, tuotettu ilman Kshanan koodia työkalulla xval/anise-lunar-od), yksikään viive ei ole { "1" } ps:n toleranssin sisällä. Suurin ero on { "24" } µs, joka johtuu analyyttisestä Kuun keskipisteestä (noin { "200" } km DE440:stä), yhdestä hetkellisestä geometriasta ilman valon kulkuajan iterointia ({ "3.6" } µs) ja pudotetusta napaliikkeestä; majakan osittaisderivaatat eroavat jopa { "2.9e-3" } suhteellisesti kynnyksen { "1e-6" } sijaan. Moduulidokumentaation väite, että koordinaatistoapproksimaatiot ovat mallin tarkkuuden alapuolella, ei pidä tällä tasolla. { "0.30" } kierros { "2" }: ydinpolku (lunar_vlbi::KernelGeometry) on validoitu NAIF SPICEn valon kulkuaikoja vasten omalla rivillään, Lunar geodetic VLBI, kernel path; tämän polun ANISE-vertailu (75/75 { "1" } ps:n sisällä, pahin { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) on vain ytimen arvioinnin ristiintarkistus, koska valon kulkuajan ratkaisu kyseisessä testialustassa on tämän projektin oma. Tämä rivi (analyyttinen oletuspolku) pysyy tasolla MODELLED ylläolevan havainnon kanssa

seg-d12d4565b01d = Kuun geodeettinen VLBI, ydinpolku

seg-11e1c942e41c = Lähikentän VLBI-viive Maa-peruslinjalle, joka havaitsee Kuun majakan, majakan ja aseman osittaisderivaatoilla, ydinpolulla (lunar_vlbi::KernelGeometry): DE440:n Maa ja Kuu, DE440:n Kuun pääakselit, ITRF93-Maan orientaatio UT1:llä ja napaliikkeellä, kukin valon kulkuaika konvergoitu barycentric-koordinaatistossa, osittaisderivaatat valon kulkuaikakertoimella 1/(c - u.V). Ajettavissa skenaariona <c1/>, kun planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path on asetettu; validoidut tulosteet ovat ydinpolun geometric_delay_s-sarja ja epoch_partials. Ydinpolulla delay_s lisää analyyttisen erotetun Shapiro-termin, jota ei verrata, eikä delay_rate- ja near_field_correction_us -arvoja verrata

seg-c7f6842b6019 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) konvergoidut newtonilaiset valon kulkuajat (spkcpt/spkcpo, CN) MOON_PA_DE440-koordinaatistoon kiinnitetystä majakasta DSN-asemille DSS-14, DSS-43 ja DSS-63 NAIF:n asemaytimestä earthstns_itrf93_260814.bsp, tiedostoilla de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec ja naif0012; osittaisderivaatat ovat SPICEn valon kulkuaikojen viiden pisteen keskeisdifferenssejä, eivät Kshanan kaavaa 1/(c - u.V). Ennakkorekisteröity (a689c797, { "2024" } epookkia) kynnyksillä { "1" } ps jokaiselle viiveelle ja { "1e-6" } suhteellinen jokaiselle osittaisderivaatalle. Tuo ensimmäinen ajo epäonnistui (17/75 viivettä { "1" } ps:n sisällä, pahin { "1.03e-11" } s): SPICE kantaa ET:tä yhtenä double-arvona, jonka väli vuonna { "2024" } pyöristää lähetysepookin jopa { "6e-8" } s, noin { "6" } ps valon kulkuaikaa, ja jäännös täsmää tähän pyöristykseen korrelaatiolla { "0.99999" } (lukittu; tarkastaja toisti sen riippumattomasti). Muutos 66e365d4, kirjoitettu tuon tuloksen jälkeen ja ennen kuin sen testiaineistoa oli olemassa, siirsi saman oraakkelin ja kynnykset { "25" } tunnin välein oleviin epookkeihin lähelle J2000:aa, jossa ET-väli on enintään { "1.5e-11" } s: 75/75 viivettä { "1" } ps:n sisällä (pahin { "6.2e-14" } s), 75/75 majakan osittaisderivaattaa (pahin { "7.4e-9" }), 150/150 aseman osittaisderivaattaa (pahin { "3.8e-11" }). Väitteen ulkopuolella: analyyttinen oletuspolku (sarjamuotoinen Kuu ja keskimääräinen Kuun koordinaatisto, { "24" } µs ANISEsta DE440:n kautta, rivi Lunar geodetic VLBI), erotettu Shapiro-termi, jonka skenaario lisää analyyttisesti, media sekä barycentric-geosentrinen asteikko

seg-1f10810131be = NAIF-ytimen lukija: DAF-säiliö, SPK-tyyppi { "2" } ja binäärinen PCK-tyyppi { "2" }

seg-7da4847e7a28 = Moottorin oma puhtaasti Rust-kielinen NAIF-binääriytimien lukija (naif_kernel): DAF-säiliö (molemmat tavujärjestykset, linkitetyt yhteenvetotietueet), SPK-tyypin 2 Chebyshev-paikkasegmentit ketjutettuna keskustensa kautta alimpaan yhteiseen kantaan, ja binäärisen PCK-tyypin 2 Euler-kulmasegmentit muutettuna J2000-koordinaatistosta kappaleen koordinaatistoon -rotaatioksi, epookit kaksiosaisena ET:nä niin, että alle mikrosekunnin siirtymä säilyttää tarkkuutensa. Sen kautta lukevat DE440:n KernelEphemeris (ephem_provider) sekä lunar_vlbi-, lunar_llr- ja lunar_vlbi_fim-moduulien ydinpolut. Väite on, että se lukee JPL:n ytimiä oikein; se ei ole väite siitä, että DE440 tai moottorin analyyttiset Aurinko- ja Kuu-sarjat olisivat tarkkoja

seg-09773b73d785 = Kaksi riippumatonta ytimenlukijaa samoilla NAIF-tiedostoilla: NAIF SPICE Toolkit N0067 (CSPICE spiceypy { "8.2.0" } kautta, MIT; spkezr ja pxform) ja ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate ja Almanac.rotate), molemmat ajettuina erillisinä ohjelmina tiedostoilla de440s.bsp ja moon_pa_de440_200625.bpc. Ennakkorekisteröity (abcd9133) ennen kuin mitään testiaineistoa tai oraakkeliarvoa oli olemassa: ruudukon siemen on kyseisen commitin tiivisteen { "16" } ensimmäistä heksadesimaalinumeroa, joten kumpaakaan { "200" } epookkia tai kappalepareja ei voitu valita tulos silmien edessä; jokainen epookki kantaa myös Kuun ja Auringon suhteessa Maahan. Kynnykset kiinnitetty etukäteen kaksoistarkkuuden Chebyshev-arvioinnista (enintään { "15" } kerrointa, n^{ "2" } u = { "2.5e-14" } arviointia kohti, kaksi arviointia ja enintään kaksi hyppyä puolta kohti): paikka { "1e-13" } R + { "1e-5" } m, nopeus { "1e-13" } V + { "1e-10" } m/s, R ja V suurempi suuruus suhteessa alimpaan yhteiseen kantaan; rotaatioalkio { "1e-13" } W + { "1e-15" }, W kattavan tietueen kerroinsumma; ANISE lisää { "2" } ns suhteellista liikettä nanosekuntiepookeilleen. Tulos: jokainen { "600" } tilasta ja { "200" } rotaatiosta on kynnyksensä sisällä molempia oraakkeleita vasten, sekä leikatuilla että täysillä ytimillä; pahin { "6.0e-3" } kynnyksestä (paikka), { "5.9e-3" } (nopeus), { "3.7e-3" } (rotaatio). Mutaatio: kunkin tietueen arviointi arvolla -s epäonnistuttaa { "3597" } vertailua. Julkistettu: aiempi 25 epookin tarkistus SPICEä vasten ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) nähtiin ennen tätä riviä eikä se ole sen todiste; testiaineiston generaattorin ensimmäinen ajo keskeytyi tyhjään ruudukkoväliin ennen kuin se tuotti yhtään arvoa ja korjattiin. Molemmat puolet lukevat DE440:n, joten yhtäpitävyys validoi lukijan, ei efemeridiä

seg-e08e98908f3a = Maan GNSS Kuun etäisyydellä

seg-dd8ce373d1f6 = Maan GNSS:n vastaanotto Kuun etäisyydellä: heikon signaalin kerros, jonka P7:n taulukko { "1" } nimeää ja jolle moottorilla ei ollut mallia. Satelliittia ja epookkia kohti se laskee poikkeaman keilan akselista suhteessa lähettimen nadiriin, peittääkö Maa suoran reitin, vinoetäisyyden ja sen vapaan tilan häviön, lähetysvahvistuksen tässä kulmassa, vastaanotetun tehon ja kantoaalto-kohinatiheyden; sen jälkeen se aggregoi vain linkit, jotka ylittävät seurantakynnyksen, ja pyyhkäisee koko tähdistökierroksen, jotta vastaus on JAKAUMA eikä yksittäinen otos. Kolme tosiasiaa ohjaa tulosta, ja raportti toteaa jokaisen: Maa näkyy { "13.90" } asteen kulmassa tähdistön säteeltä, joten keilan HUIPPU ei ole geometrisesti saatavilla yhdellekään Kuuhun suuntautuvalle säteelle; jäljelle jää pääkeilan reuna ja sivukeilat, se alue, jossa LuGRE toimi Kuussa { "2025" }; ja L1-polun häviö on noin { "208" } dB, noin { "25" } dB enemmän kuin maanpäällinen käyttäjä maksaa. MEASURED mukana toimitetulla 24 satelliitin GPS-luokan geometrialla { "64" } epookin yli yhden kiertojakson ajan: SIGNAALIN saatavuus { "0.375" } parhaan linkin ollessa { "30.93" } dB-Hz ja PAIKKARATKAISUN saatavuus { "0.000" } – enintään kaksi samanaikaista seurattavaa linkkiä, ei koskaan neljää, jonka paikka vaatii. Näiden kahden saatavuuden erottelu on koko pointti, ja raportti ei salli niiden sekoittamista: Maan GNSS Kuun etäisyydellä on AJOITUSLUOKAN kerros, ei paikkaluokan, ja kerroksellisen kestävyyden priorin on otettava paikkaratkaisun saatavuus. Ehdollisuus annetaan samasta syystä – jokainen näkyvä satelliitti on Kuusta nähtynä muutaman asteen levyisen kartion sisällä, joten näkölinjat ovat rakenteellisesti lähes yhdensuuntaisia. Ajettavissa lajina <c1/> Uudelleenmuotoiltu D7:n mukaan: väite Kuun etäisyydellä on satelliittien välinen SUHTEELLINEN kantoaalto-kohinatiheys yhdessä epookissa, mitatuista kaksiulotteisista lähetyskuvioista (NAVCEN Block IIR/IIR-M) sekä geometrinen näkyvyys; absoluuttista C/N0:aa ei väitetä (Parker ym. raportoivat yhteisen { "7" } – { "12" } dB:n häviön).

seg-bed2679f88e5 = Suljetun muodon identiteetit ja sisäinen johdonmukaisuus; ulkoista oraakkelia EI väitetä. Limbin puolikulma tarkistetaan lausekkeella asin(R_earth/r_orbit) ja geometria sitä vasten; vapaan tilan häviö, DOP-ydin ja tämän kokoama SGP4-eteneminen on kukin validoitu ulkoisesti omilla riveillään, eikä tämä rivi lainaa niiden asemaa. MIKSI MODELLED, ja se on lähetyskuvio: vahvistus kulman funktiona on tasaisesti valaistu ympyräapertuuri, Airy-kuvio, kun taas todellinen GPS L1 -antenni on kahdentoista elementin kierukkaryhmä, jonka muotoiltu pääkeila huipentuu akselin ulkopuolelle tasoittaakseen tehoa Maan kiekon yli ja jonka sivukeilat eivät ole Airy-muotoisia. Julkaistuja mitattuja kuvioita on olemassa, eikä niitä ole vendoroitu tänne, joten järjestykset ja suuruusluokat pitävät, mutta yksittäisen satelliitin dB ei. TÄMÄN RIVIN ENSIMMÄINEN TOTEUTUS OLI VÄÄRIN TAVALLA, JOKA ON KIRJAAMISEN ARVOINEN: Airy-lauseke on voimassa vain eteenpäin suuntautuvalla pallonpuoliskolla, sen argumentti kulkee kuten sin(theta), ja kulman theta ollessa lähellä { "180" } astetta se kiertyy ympäri ja palauttaa TÄYDEN KEILAN AKSELIN VAHVISTUKSEN apertuurin takana – joten ensimmäisen raportin kaksi vahvinta linkkiä olivat satelliitteja, jotka osoittivat antenninsa pois Kuusta, ja ne olivat ainoat kaksi, jotka ylittivät kynnyksen. Apertuurin takana malli soveltaa nyt tasaista takakeilan lattiaa, ilmoitettuna rajana eikä keksittynä kuviomuotona. Tarkoituksella poissa, kukin tekee budjetista OPTIMISTISEN: ei ionosfääri- tai troposfäärihäviötä limbiä hipovilla säteillä, ei polarisaatio-, suuntaus- tai toteutushäviötä, ja pallomainen Maa ilman refraktiivista laajennusta. Kuun paikka on SYÖTE, ei efemeridihaku, koska testattava suure on linkki ja keilageometria. Rivin nostaminen tasolle validoitu edellyttää mitattua lähetyskuviota ja LuGRE:n normaalipisteitä, joita vasten tarkistaa; kumpikaan ei ole repositoriossa eikä kumpaakaan keksitä tässä. { "0.30" } kierros { "2" }, havainto (pysyy tasolla MODELLED): mitattuihin syötteisiin perustuva linkkipolku (todelliset SP3-paikat, lohkokohtainen lähetysteho, taulukoidut lähetys- ja vastaanottokuviot, kaappauksen ja seurannan hystereesi) tarkistettiin Montenbruck ym. { "2023" } taulukkoa { "3" } vasten GENESIS:lle { "6000" } km:ssä (ennakkorekisteröity 5b414f0a): zeniittiantennin keskiarvot täsmäävät { "6" } tapauksesta { "5" } yhden dB:n sisällä artikkelin herkkyydestä; nadir-antennin keskiarvot ovat { "1.0" } – { "2.4" } satelliittia painettua korkeampia, todennäköisesti koska artikkeli käytti atsimuutista riippuvia GPS:n sivukeilakuvioita, joita ei ole julkaistu. Tämän rivin Kuun etäisyyden luvut käyttävät edelleen Airy-sijaiskuviota. { "0.30" }+ D7, havainto (pysyy tasolla MODELLED): uudelleenmuotoiltu suure, Block IIR/IIR-M-satelliittien yhdessä epookissa seurattujen C/N0-ERO, ennustettuna NAVCENin satelliittikohtaisilla (SVN) mitatuilla L1-kuvioilla (kaksiulotteiset, yaw-ohjauskoordinaatisto) LuGRE-lennon C/N0:aa vasten (ennakkorekisteröity 768cb62b: { "99" } % näkyvä, parin RMS <= { "3.0" } dB, mediaani <= { "2.0" } dB, vähintään { "50" } tietuetta ja { "30" } paria) sisältää liian vähän dataa: { "26" } kelpuutettua siirto- ja Kuun kiertoradan epookkia sisältävät { "15" } seurattua IIR/IIR-M-tietuetta (useimmat seuratut ovat IIF ja III) ja yhden parin. Kaikki { "15" } ennustetaan näkyviksi ja yhden parin jäännös on -0.06 dB; mitään ei väitetä

seg-29df5b40a3f9 = Kuun radanmääritys: Maan GNSS vs maalta tehty radiometrinen mittaus

seg-647902ebcee3 = Radanmääritys lähes suoraviivaisella haloradalla (tai elliptisellä jäädytetyllä radalla) kahdesta riippumattomasta datatyypistä: aluksella vastaanotetut Maan GNSS:n pseudoetäisyydet (rivin Earth-GNSS-at-lunar-distance linkkisääntö sekä Kuun peitto) ja kolmen Deep Space Network -aseman maalta tehdyt kaksisuuntaiset etäisyys- ja etäisyysnopeusmittaukset. Kumpikin on yhden askeleen eräkäsittelyn pienimmän neliösumman ratkaisu vertailuradan ympäri formaalilla kovarianssillaan; siemenellä alustettu Monte Carlo kahden estimaatin erolle testaa, selittävätkö kaksi kovarianssia eron (q = d' (P_G + P_R)^-1 d, khiin neliö kuudella vapausasteella, kun mallit täsmäävät) ja mitä mallintamaton kiihtyvyys tekee tunnusluvulle.

seg-226dedaba243 = Riippumaton scipy/numpy-ohjelma integroi samat variaatioyhtälöt (kynnys O1). Mitään ei verrata Kuun radan mittaukseen. Oraakkeli tarkistaa ilmoitettujen kaavojen numeriikan, ei fysiikkaa, joten rivi pysyy tasolla MODELLED. Rajoitettu kolmen kappaleen malli: ei Aurinkoa, ei Kuun harmonisia, Maan pyörimisakseli radan normaalin suuntaan, ILLUSTRATIVE vastaanotin- ja asemasyötteet.

seg-652bdc29deea = Kuun kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu: pinta ja kiertolainen

seg-02496f9e9af2 = Vastaanottimien välinen yksittäisdifferentioitu Maan GNSS:n kantoaallon vaihe ja koodi Kuun pinta-asemalla ja kiertolaisella, epookkikohtainen kellosta aiheutuva ero profiloituna pois, yksi kokonaislukuepävarmuus jatkuvaa ylilentoa kohti ja pisin ylilento mittapuuna. Float-ratkaisun kovarianssi on Schurin komplementti; LAMBDA ratkaisee kokonaisluvut, bootstrap-menetelmän onnistumisosuus raportoidaan siemenellä alustetun Monte Carlo -kokonaislukuvähimmäisneliösumman onnistumisosuuden sekä float- ja kiinnitettyjen paikkasigmojen rinnalla. Raportoitu sellaisena kuin löydettiin: rekisteröidyllä { "12" } dBi:llä kaksoisdifferenssiongelmaa ei voida muodostaa (muutos { "1" } siirsi oletuksen arvoon { "25" } dBi vasta kun vain saatavuuslaskennat oli nähty), ja { "25" } dBi:llä kokonaislukukiinnitystä EI saavuteta – se on ulottumattomissa (korkeintaan muutama prosentti), vaikka float-ratkaisu paranee kaaren myötä.

seg-8d8296752eb8 = Riippumaton numpy-ratkaisu samoille normaaliyhtälöille viedyistä riveistä (Q3) ja raakaan voimaan perustuva kokonaislukuluettelointi (Q4). Mitään GNSS- tai Kuun kantoaaltovaihemittausta ei verrata. MODELLED.

seg-11dd1bb8e4e1 = Kuun koordinaatiston yhteisestimointi: pinta-asemat ja kiertolaiset

seg-a38c8d95e6c9 = Seitsenparametrisen Kuun koordinaatiston datumin Fisher-informaatio Maa-aseman laseretäisyysmittauksesta viiteen heijastimeen yksin ja kiertolaisen ja pinta-aseman välisten etäisyyksien kanssa: informaatiomatriisi, aste, Cramér–Rao-sigmat, Kuun tunnistettavuusmoduulin degeneroituneisuusmitta ja siemenellä alustetut satunnaiset asemajoukot. Rata oletetaan tunnetuksi Kuun akseleissa (sen virhe kulkee kiertolaisen etäisyyssigman mukana).

seg-47d2afc53b3d = Riippumaton numpy-äärellinen differenssi eteenpäinmallista (F2). Mitään ei verrata todellisiin Kuun koordinaatiston ratkaisuihin. Tekijä on ehdollinen oletetulle tunnetulle radalle ja { "1" } m:n etäisyyssigmalle. MODELLED.

seg-862977c4bb01 = Avaruussidoksen koordinaatistosidoksen toistotarkkuus: samassa paikassa sijaitseva GNSS, VLBI ja laseretäisyysmittaus

seg-a9ae8e99f00d = GNSS-, VLBI- ja laseretäisyysmittauskoordinaatistojen välisten tekniikkojen välisten siirto-, mittakaava- ja kiertosiirtymien Cramér–Rao-toistotarkkuus, kun yksi avaruusalus kantaa kaikkia kolmea, avaruusaluksen paikka eliminoituna jokaisessa epookissa ja yhdeksän paikallisen sidoksen häiriöparametria priorilla, pyyhkäisty paikallisen sidoksen tarkkuuden yli. Kovarianssit neliöjuurireittiä (normaaliyhtälöt menettävät numerot, kun tekniikat ovat lähes täydellisiä).

seg-b37ac7294112 = Riippumaton numpy-pinottu järjestelmä, jossa paikkatuntemattomat on eliminoitu eksplisiittisillä Schurin komplementeilla (T3). Mitään GRASP-, Genesis- tai muuta tehtäväaineistoa ei verrata. MODELLED.

seg-ae627996875e = Kuun Love-lukujen ja libraation herkkyys

seg-28780d07c4a7 = Suureiden h2, k2, l2 ja fysikaalisten libraatioamplitudien Fisher-informaatio laseretäisyysmittauksesta (säteittäinen ja vaakasuuntainen vuorovesisiirtymä, heijastimen kierto), kiertolaisen seurannasta (asteen 2 k2-kiihtyvyys integroituna näkölinjaa pitkin, trendi poistettuna), pinta-gravimetristä (gravimetrinen tekijä { "1" } + h2 - { "1.5" } k2) ja pintakellosta (suhteellinen nopeus ({ "1" } + k2 - h2) W2/c2, sidottu Kuun aikavakioihin). Suureiden h2 ja l2 nimellisarvot ovat linearisointipisteitä; tutkimus kertoo, mikä on herkkä millekin, ei sitä, mitä luvut ovat.

seg-180d74388339 = Riippumaton numpy-äärellisen differenssin kokoonpano (G2) ja suljetun muodon arviointi (G4). Kiertolaisperheen k2-herkkyys on ylärajan luku (radan tila absorboi tässä vain vakion ja trendin). Mitään Kuun vuoroveden tai libraation mittausta ei verrata; k2 lainataan Lemoine ym. { "2014" } nimellisarvona. MODELLED.

seg-da712b740519 = Kuun pintamajakoiden DOP-täydennys

seg-83e6341e01b1 = Majakoilla täydennetty tarkkuuden heikkenemiskerroin (DOP) Kuun pinnan käyttäjälle: näkyvien satelliittien näkölinjarivit ja näkyvien pintamajakoiden etäisyysmittausrivit yhdistetään yhdeksi suunnittelumatriisiksi ja arvioidaan jaetun DOP-ytimen kautta, ja tuloksena oleva DOP kuvataan toteutuneeksi 1-sigman tarkkuudeksi METREINÄ majakkakohtaisen käyttäjän vastaavan etäisyysvirheen kautta, joka kootaan kellosynkronoinnin, monitie-etenemisen ja kartoitustermien neliösummana. Majakan näkyvyys on ilmattoman Kuun kahden korkeuden geometrinen horisontti, jolla ei ole refraktiivista laajennusta ja joka on siksi tarkka eikä likimääräinen. Ajettavissa skenaariolajina <c1/>, joka raportoi pelkät satelliitit, satelliitit plus majakat ja suuremman tähdistön kilpailevana reittinä samaan geometriaan. MEASURED mukana toimitetulla golden-geometrialla (käyttäjä -80 asteessa, kolme kartoitettua majakkaa, kuuden satelliitin havainnollistava LCNS hetkellä t={ "0" }, { "5" } asteen maski): { "5" } näkyvää satelliittia antaa PDOP-arvon { "9.6941" } ja 3D-1-sigman { "11.222" } m; lisäämällä majakat, jotka todella ylittävät horisontin, saadaan PDOP { "4.1160" } ja { "4.765" } m, kerroin { "2.355" }; 24 satelliitin palvelu antaa sen sijaan PDOP-arvon { "2.4226" } ja { "2.804" } m, kerroin { "4.002" }. Raportti tulostaa NÄKYVIEN majakoiden määrän eikä määritettyä, ja tällä geometrialla vain YKSI kolmesta majakasta ylittää horisontin: kaksi reunimmaista paikkaa ovat noin { "333" } km:n päässä käyttäjästä { "2" } m:n antennin { "86" } km:n horisonttia vasten, joten lukijan ei koskaan jätetä olettamaan kaikkien kolmen vaikuttaneen

seg-179fb996fc72 = DOP-aritmetiikka on crate::orbit::dop-ydin, joka on erikseen validoitu ulkoisesti gnss_lib_py:tä vasten tiedostossa tests/dop_reference.rs; tämä rivi ei lainaa uudelleen kyseisen rivin asemaa. Majakan näkyvyyshorisontti on L01-suljettu muoto, ja sigma = DOP x sigma_URE on standardi GNSS-suhde (Kaplan ja Hegarty, Understanding GPS/GNSS, luku { "7" }). Tällä rivillä täydennys itse tarkistetaan riippumatonta repositorion sisäistä DOP-polkua vasten ja lukitaan sitoutettuun golden-tiedostoon. MIKSI MODELLED: tähdistösuunnittelu, majakoiden sijoittelu, antennikorkeudet ja kaikki kolme virhebudjetin suuruutta ovat havainnollistavia syötteitä eivätkä käyttöönotettu kartoitus tai mitattu linkki, joten raportoidut metrit ovat valitun skenaarion ominaisuus eivätkä minkään käytössä olevan palvelun. HUOMAUTUS ALKUPERÄSTÄ: tämä kyvykkyys mainostettiin README:ssä ja sitä harjoitti kaksi validointitestiä, mutta sillä EI ollut matriisirivia eikä skenaariolajia, joten sitä ei voinut saavuttaa ajosta lainkaan. Se väitettiin proosassa, puuttui kirjanpidosta (ledger) ja oli moottorissa tavoittamattomissa yhtä aikaa. Rivi ja laji lisättiin yhdessä. { "0.30" } kierros { "2" } (ennakkorekisteröity db0eb9ec), estynyt (pysyy tasolla MODELLED): ANISE { "0.10.6" } -näkyvyys ja numpy-DOP rivin geometrialla täsmäävät (näkyvät joukot tarkasti, mukaan lukien { "72" } horisontin lähellä olevaa ja { "48" } maskin lähellä olevaa tapausta; DOP { "7.2e-13" } sisällä), mutta raportoidut metrit ovat DOP kertaa havainnollistava { "1.158" } m:n neliösummaetäisyysvirhe ilman oraakkelia; rajaus, joka sulkisi ne pois, odottaa omistajan päätöstä

seg-b0b618abf402 = Yhteismoodin eheyssokeus

seg-e732ac99a9ae = Tarkka pariteettialiavaruuden jako mittausvirheestä osaan, jota RAIM ei näe, ja osaan, jonka se näkee. Linearisoidulle hetkellismallille y = G·x + e mikä tahansa virhe dy hajoaa yksikäsitteisesti SOKEAKSI komponentiksi avaruudessa range(G) – absorboituu tilavirheenä S·dy ja nollautuu residuaaliprojektorissa Pperp = I − G·S, joten se on näkymätön MILLE TAHANSA residuaalitestille, ei vain tietylle kynnykselle – ja HAVAITTAVAKSI komponentiksi pariteettiavaruudessa. Moduuli palauttaa projektorin, jaon ja sokean osuuden, jotta kutsuja voi kvantifioida, kuinka suuren osan tietystä virheestä hetkellinen monitori ei rakenteellisesti kykene raportoimaan. Sovellettuna todelliseen efemeridien väliseen lattiaan: metritasoinen DE440 vs INPOP21a ja DE440 vs EPM2021 -ero geosentrisessä Kuun paikassa absorboituu lähes kokonaan käyttäjän paikkavirheeksi (sokean osuuden mediaani { "1.000000" }; sokean paikkavirheen mediaani { "2.3955" } m ja { "2.0050" } m) pariteettijäännöstä vasten tasolla { "1e-15" } m

seg-077303e9dd72 = P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) laskee pienimmän neliösumman jaon uudelleen sitoutetuilla syötteillä, joissa on todellinen pariteettiosa (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), siemen { "20261001" }) 8 satelliitin geometrialla ja 6 satelliitin osajoukolla, { "1464" } tapausta molemmilla todellisilla efemeridien välisillä pareilla, ennakkorekisteröity (f672a314): blind_dx, residual, blind_norm ja detectable_norm suhteellisen { "1e-12" } sisällä arvoon |dy| nähden ja blind_fraction absoluuttisen { "1e-12" } sisällä (pahin blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). numpy rakentaa G:n itse sitoutetuista paikoista, kun taas moottori käyttää normaaliyhtälöitä Gauss–Jordanilla; vino vasen käänteismatriisi tekee testistä punaisen arvolla { "5.5e-2" } |dy|. Muutos { "1" } (86c53301, ensimmäisen ajon jälkeen, julkistettu) lievensi vain syötteen esiehtoa pariteettiosuudelle (jokainen tapaus vähintään { "1e-3" } ja { "95" } % kustakin geometriasta vähintään { "0.05" }), ei täsmäävyyskynnystä. Validoitu väite, kuten P2 sallii: jaon lineaarialgebra näillä syötteillä; efemeridien välisen lattian suuruudet ja havainnollistava Kuun geometria ({ "8" } LCNS-tyyppistä solmua { "5000" } km:ssä) ovat syötteitä, eivät validoituja, ja sokeus on kaikkien hetkellisten RAIM-menetelmien tunnettu ominaisuus. Kierroksen 1 numpy-vertailu (tests/lunar_common_mode_integrity_reference.rs) tarkisti vain identiteetin S·G = I, koska sen syötteet olivat avaruudessa range(G); se säilytetään regressiotestinä. Efemeridien alkuperä: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

seg-845e9f5eec81 = Yhteismoodin suojaustaso ja eheyden kokonaisverhokäyrä

seg-2246ffa73869 = cmpl_horizontal rajaa sokean yhteismoodiluokan aiheuttaman k-sigman vaakapaikkavirheen muodostamalla blind_position_covariance = S*Cov*S^T ja projisoimalla sen ENU-koordinaatistoon; integrity_envelope raportoi hpl_total = hpl_araim + cmpl. Ero, jonka tekemiseksi pari on olemassa: RAIM/ARAIM-RESIDUAALItesti on todistettavasti sokea range(G)-virheille, mutta ARAIM-SUOJAUSTASO ei ole – sen vikaton termi rajaa ne jo tarjoajan URA:han plus nimelliseen harhaan asti. CMPL on siksi vain tarjoajien välinen YLIMÄÄRÄ, jota yhden tarjoajan tarjoajakohtainen URA/ISM ei ylärajaa, ja summa on konservatiivinen kolmioepäyhtälöraja eikä RSS, voimassa vain siellä, missä tämä ylimäärä ei jo sisälly URA:han.

seg-ffc59a7ed497 = Analyyttinen projektorialgebra tarkistettuna itseään vasten: range(G):hen rajoittuvan kovarianssin on annettava positiivinen CMPL, pariteettiavaruuteen rajoittuvan kovarianssin likimain nolla, ja verhokäyrän on summattava kaksi mittausavaruudessa ortogonaalista osuutta. Yhteismoodin kovarianssi, tähdistön geometria ja k ovat edustavia mallinnettuja syötteitä, EI sertifioitu budjetti, eikä väitetä, että kolmioraja olisi tiukka. HUOMAUTUS ALKUPERÄSTÄ: cmpl_horizontal, blind_position_covariance ja integrity_envelope ovat julkisia ja toimitettuja, ja niiden yksikkötesteihin oli jo viitattu yhteismoodin sokeusrivillä, mutta itse VERHOKÄYRÄVÄITTEELLÄ ei ollut riviä – joten ainoaa varoitusta, joka pitää sen rehellisenä, eli että summa on kolmioraja eikä RSS, ei ollut kirjattu minnekään kirjanpidossa (ledger). Rivi rekisteröi väitteen ja varoituksen yhdessä.

seg-5ed34a5b402e = Kuun yhteinen monitekniikka-OD + kello

seg-5ace1caff5a9 = VLBI:n + Kuun paikallisen etäisyysmittauksen + satelliittien välisen etäisyysmittauksen eräfuusio aseman ja tähdistön paikkojen ja kellojen palauttamiseksi

seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq LAPACK gelsd:llä, numpy.linalg.inv; BSD-3) laskee uudelleen jokaisen Gauss–Newton-askeleen, suppenneen painotetun pienimmän neliösumman ratkaisun, formaalit sigmat ja aseman virheen kuuden simuloidun verkon sitoutetuilla jakobiaaneilla ja havainnoilla, ennakkorekisteröity (5094bc31) tarkkuudella max({ "1e-8" }, { "100" } kappa eps) suhteellinen. Ensimmäinen ajo ei läpäissyt VLBI-vapaata verkkoa ({ "6.1e-7" } kynnystä { "1e-8" } vasten, normaaliyhtälön käänteismatriisi ehtoluvulla { "1.4e5" }); tuon tuloksen jälkeen kirjoitettu moottorikorjaus (batch_ls::gauss_newton_qr, Householder-QR-askel, jota käyttävät estimate ja formal_covariance) ajettiin uudelleen muuttumattomalla kynnyksellä: askeleet { "1.1e-14" } – { "2.4e-11" }, sigmat enintään { "1.3e-11" }. Validoitu väite on fuusioratkaisun lineaarialgebra näillä syötteillä, ei simuloidun verkon fysikaaliset suuruudet eikä sen havaintomallit: Kuun geodeettisen VLBI-viiveen rivi pysyy tasolla MODELLED (sen analyyttinen polku eroaa ANISEsta jopa { "24" } µs), ja koordinaatistoilla on omat rivinsä. Injektoidun simuloidun totuuden palautus ja NEES-johdonmukaisuus ovat edelleen sisäisiä tarkistuksia; aiempi Orekit { "12.2" } / Hipparchus Levenberg–Marquardt -ristiintarkistus (tests/lunar_joint_multi_technique_od_reference.rs) harjoittaa funktiota batch_ls::gauss_newton, jota estimate ei enää kutsu, ja se säilytetään kyseisen primitiivin tarkistuksena. { "0.30" } -versiomuutos: oletuksena lunar-joint-od-clock-aseman virheet { "3.541344" } -> { "3.541350" } m VLBI:n kanssa ja { "2183.119" } -> { "2183.558" } m ilman (QR-ratkaisu). { "0.36" } -versiomuutos (STUDIO-15, siirrettävä matematiikka; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m VLBI:n kanssa ja { "2183.558" } -> { "2184.021" } m ilman, ja VLBI-vapaa ratkaisu pysähtyy { "5" } iteraation jälkeen, ei { "2" } (pyöristysvirheen rajoittama pysähdys huonosti ehdollistetussa verkossa); ennakkorekisteröity vertailu ajettiin uudelleen uudelleenviedyillä syötteillä muuttumattomalla kynnyksellä (numpy { "2.4.6" }, kaikki kuusi verkkoa läpäisevät)

seg-69fbe488dec5 = Fisher-informaatio ja Cramér–Rao-havaittavuus

seg-043d4c7a2d6a = Fisher-informaatio M=HᵀWH, Cramér–Rao-alaraja, havaittavuuden aste ja datumvajeen nolla-avaruus (Moore–Penrose-pseudokäänteismatriisi) sekä D/A/E/T-optimaaliset koesuunnittelun skalaarit symmetrisestä Jacobin ominaisarvoratkaisijasta

seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-pohjainen) — riippumaton kolmannen osapuolen auktoriteetti, joka laskee samat yksikäsitteisesti määritellyt ominaisarvot, σ²(XᵀX)⁻¹ Cramér–Rao -kovarianssin ja GNSS-tarkkuuden heikkenemiskertoimet (DOP) eri algoritmilla (LAPACK divide-and-conquer + LU) kuin Kshanan syklinen Jacobi-pyyhkäisy ja spektraalinen pseudokäänteismatriisi; tulokset täsmäävät toleranssilla { "1e-9" }. Sama ulkoisen kirjaston luokka validoi jo DOP-moottorin (gnss_lib_py-kirjastoa vastaan) ja χ²- ja erf-ytimet (SciPyta vastaan). Lisäksi ristiintarkistettu Kayn ({ "1993" }) suljetun muodon CRLB-arvoja ja Monte Carlo -CRLB:n saavuttamista vastaan (sisäinen)

seg-e4ec41d0f5e1 = Kuun absoluuttisen aseman havaittavuus (datumvaje)

seg-b3e4160042d2 = Yhteisen Kuun ratkaisun Fisher-informaatiohavaittavuus: ilman Maa-peruslinjoja absoluuttisen koordinaatiston datum on matriisin HᵀWH nolla-avaruudessa (aseman sijaintia ei voi havaita); ≥{ "3" } peruslinjaa palauttaa täyden asteen ja rajaa aseman Cramér–Rao-virheen, jonka estimaattori saavuttaa

seg-238597f6aa01 = Analyyttinen datumvajeen rakenne — havaitsematon absoluuttisen koordinaatiston moodi on Fisher-informaation nolla-avaruudessa (suljettu muoto), asteen kynnys vastaa julkaistua 3 aseman suunnitteluperustetta ja estimaattori saavuttaa tuloksena olevan CRLB:n Monte Carlossa. Kuun geometria itsessään on edustava verkko (ei lennetty efemeridi), joten rivi pysyy MODELLED; taustalla oleva FIM/CRLB-moottori tarkistetaan erikseen Kayn ({ "1993" }) suljettuja muotoja vastaan. { "0.30" } kierros { "2" } (ennakkorekisteröity fab02df9), estynyt (pysyy MODELLED): NumPy/SciPy laskevat uudelleen asteen ja vajeen ilmoitetulla kynnyksellä { "1e-9" }, aseman akselien osuuden nolla-avaruudesta (poikkeama enintään { "8.4e-10" }) ja aseman CRLB:n (poikkeama enintään { "1.2e-10" }) { "17" } sitoutetulla Kshanan tuottamalla kokoonpanolla (P2). Ei ylennetty: väitteellä, että estimaattori saavuttaa rajan (Monte Carlo -tehokkuus noin { "0.98" }), ei ole oraakkelia, ja rajaus, joka jättäisi rivin tilaan MODELLED, odottaa omistajan päätöstä

seg-ae4b71d54dfa = 7-parametrinen Helmert-datumisovitus + ICRF-orientaatiosidonta pisteverkosta

seg-9e434924b34c = Riippumaton suljetun muodon painotettu Umeyama (Horn) -yhdenmuotoisuusmuunnosratkaisija (numpy/scipy, SVD-pohjainen; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — eri algoritmi kuin kshanan iteratiivinen Gauss–Newton-sovitus, ja se päätyy samaan yksikäsitteisesti määriteltyyn painotetun pienimmän neliösumman optimiin tavu tavulta identtisillä pisteverkoilla

seg-4bcec6e2dd9f = Kuun navigointipalvelun tilavuus

seg-dba98ad5df1c = Moonlight-luokan Kuun DOP / kattavuus / saatavuus + yleistetyt Kuun ARAIM-suojaustasot palvelutilavuudessa

seg-7e981d90a806 = Riippumaton kolmannen osapuolen auktoriteetti ANISE { "0.10.2" } astro::Orbit -Kepler-propagaattori (Nyx Space, MPL-2.0) — ekvinoktiaalinen kahden kappaleen koodipolku, joka eroaa kshanan Newton–Raphson-Keplerista; satelliittikohtainen MCI-paikka täsmää arvolla <{ "1e-3" } m, ja johdettu näkyvien satelliittien lukumäärä ja joukko täsmäävät täsmälleen jokaisessa ruudukkopisteessä. DOP-ydin on validoitu gnss_lib_py-kirjastolla; eheys käyttää julkaistuja LunaNet/LCNS-parametreja

seg-2ed7181c97dd = LunaNet AFS -levityskoodien generointi (LSIS V1.0)

seg-13ff6c381275 = LSIS V1.0:n Augmented Forward Signal -koodit ({ "29" } tammikuuta { "2025" }): AFS-Q:n 10230 sirun primäärikoodi generoituna IS-GPS-800 L1C -pilottirakenteesta IS-GPS-800J-indekseillä (samat { "210" } määritystä, jotka LSIS:n liite D tulostaa), AFS-I:n 2046 sirun Gold-koodit generoituna polynomeista g1 = x^{ "11" } + x^{ "2" } + { "1" } ja g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, kunkin PRN:n G2-viive palautettuna standardin liitteen { "3" } tiedostosta, neljä sekundäärikoodia, 1500 sirun tertiäärikoodit, välivaiheen taulukon { "11" } solmumääritys ja portaittainen pilottikoodi. LSIS-sisältö luetaan ajon aikana SHA-256-varmennetusta paikallisesta välimuistista, joka täytetään NASAn ylläpitämästä PDF-tiedostosta; sitä ei koskaan jaeta edelleen

seg-dc1dd144b107 = Viite: arvot, jotka LSIS V1.0 tulostaa validointia varten (taulukot C-1 – C-5, D-1 – D-6, E-1 – E-6), ja sen liitteen { "3" } sähköiset koodi-tiedostot, nollan eroavuuden kriteerillä, joka on asetettu ennen vertailua. Kriteeri ei täyty yhden tulostetun solun osalta, joka on sisäisesti ristiriidassa standardin oman liitteen { "3" } tiedoston kanssa, joten rivi pysyy MODELLED; virheluettelomerkintä on luonnosteltu. Samat sirut vastaavat myös LANS-AFS-SIM:n siruja (rivi ”LunaNet AFS -kantataajuuden renderöinti riippumatonta generaattoria vastaan, kun sen kanavatila on annettu”)

seg-ea20909686ea = LunaNet AFS -kantataajuuden renderöinti riippumatonta generaattoria vastaan, kun sen kanavatila on annettu (LSIS V1.0)

seg-c0f021c38842 = AFS-kantataajuuden renderöintiydin (LSIS-130: kompleksinen verhokäyrä I + jQ, I = AFS-I Gold -koodi kerrottuna { "500" } symbolia/s kehyksellä nopeudella { "1.023" } Mchip/s, Q = portaittainen AFS-Q-pilotti nopeudella { "5.115" } Mchip/s, kantoaallon pyöritys, sirun ja symbolin kohdistus) tuottaa uudelleen riippumattoman generaattorin näytteet, kun sitä ohjataan kyseisen generaattorin oman tallennetun kanavatilan avulla (koodivaiheet ja -nopeudet, kantoaallon vaihe ja taajuus, kanavakohtainen amplitudi). Ei katettu: solmumalli, joka johtaa tilan Dopplerista, viiveestä ja kantoaalto-kohinatiheydestä, 50/50-tehojako, joka lasketaan kantoaalto-kohinatiheydestä (amplitudit otetaan simulaattorista), sekä SigMF-metadata ja 8-bittisten näytteiden kirjoitus

seg-dd1142957a05 = Kirjasto: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-band-versio, ajettu erillisenä ohjelmana); Kshanan näytteitä ohjataan vain simulaattorin tallennetulla kanavatilalla, ja pelkän tulostusjäljen sisältävä versio tarkistetaan tavu tavulta identtiseksi korjaamattoman kanssa. Ennen ajoa asetetut kynnykset: nolla sirun ja symbolin eroavuutta, |rho| >= { "0.999" } koko ajon yli ja >= { "0.99" } jokaisella lohkolla ({ "2" } ms), vaihe enintään { "0.05" } rad. Yhtäsuuret I- ja Q-amplitudit ovat vertailun syöte, joten sillä ei testata tehojakoa. LANS-AFS-SIM lukee tertiäärikoodinsa LSIS-liitteen { "3" } tiedostosta, joten tämä osa ei ole riippumaton koodirivistä. LANS-AFS-SIM ja PocketSDR-AFS jakavat tekijän ja lasketaan yhdeksi riippumattomaksi toteutukseksi. Dataehto: LANS-AFS-SIM-vertailu tarvitsee paikallisen LSIS V1.0 -välimuistin (xval/lunar-afs/fetch_lsis.sh, SHA-256-varmennettu) ja ohitetaan ilmoituksella ilman sitä

seg-5d79da539912 = LunaNet AFS -kehyksen kanavakoodaus, FID { "0" } (LSIS V1.0)

seg-6ed2b4c792e6 = LSIS V1.0:n { "12" } s:n, 6000 symbolin FID { "0" } -kehys: 68 symbolin synkronointikuvio, BCH ({ "51" }, { "8" }) -alikehys { "1" } (oktaali-763-generaattori), CRC-24 (({ "1" } + X)·P(X)) alikehyksillä 2-4, nopeuden 1/2 LDPC-koodaus painetuilla A, B^-1, C, D (LSIS-liite { "1" }, luettu ajon aikana SHA-256-varmennetusta paikallisesta välimuistista) ja standardin lävistyksellä, { "60" } x { "98" } lohko-interleaver; tyhjentävä alikehyksen 1 dekooderi, joka merkitsee TOI-arvon, joka on alueen { "0" }..99 ulkopuolella, ja normalisoitu min-sum-LDPC-dekooderi, joka on kirjoitettu pelkästä matriisista H = [[A, B, { "0" }], [C, D, I]]

seg-46879e2e8ab5 = Kirjasto: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), jonka omat BCH, CRC, LDPC ja interleaver tuottavat samalle sisällölle symboli symbolilta identtisiä kehyksiä Kshanan kanssa (nolla eroavuutta, kynnys asetettu ennen ajoa). Vahvistavat viitearvot: LSIS V1.0:n kuvan { "8" } BCH-esimerkki ja CRC-24/LTE-A-tarkistusarvo (Greg Cookin parametrisoitujen CRC-algoritmien luettelo), molemmat bittitarkasti; sekä se, että PocketSDR-AFS dekoodasi kolmessa ajossa jokaisen alikehyksen niistä kehyksistä, jotka se synkronoi, CRC läpäisten ja alikehyksen 2 bittien täsmätessä. Pariteettitarkistustesti on lähellä sisäistä identiteettiä (se vahvistaa, että painettu B^-1 kääntää painetun B:n) eikä sitä lasketa oraakkeliksi. Dataehto: LANS-AFS-SIM-vertailu tarvitsee paikallisen LSIS V1.0 -välimuistin (xval/lunar-afs/fetch_lsis.sh, SHA-256-varmennettu) ja ohitetaan ilmoituksella ilman sitä

seg-56c7aeac59c1 = LunaNet AFS:n suljetun silmukan dekoodattavuus riippumattomalla vastaanottimella (LSIS V1.0)

seg-da2d29d437b0 = Kshanan AFS-tallenne, jonka riippumaton ohjelmistovastaanotin sieppasi, seurasi ja dekoodasi ja jota verrattiin tallenteen omiin totuusmerkintöihin. Tämä osoittaa vain, että tallenne vastaa standardia ja että merkinnät ovat johdonmukaisia; se ei ole väite kanavafysiikasta, etenemisestä, vastaanotetusta tehosta tai linkkibudjeteista, joiden arvot tallenteessa ovat valittuja syötteitä

seg-8211583afc64 = Kirjasto: PocketSDR-AFS (T. Ebinuma T. Takasun PocketSDR-ohjelman (versio { "0.13" }) pohjalta, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-band-versio, vain tulostava lokitason kopio), ennen kutakin ajoa asetetuilla kriteereillä. Kolmas ennakkorekisteröity vertailu täyttää dekoodauksen ja seurannan kynnykset C1 ja C2 kokonaan mutta ei suojaehtoaan G0 sellaisenaan (kaksi muuttamattoman vastaanottimen ajoa eroavat samoissa neljässä sieppaustietueessa), ja toinen ei täyttänyt kynnystä, rikkomuksia oli { "5" }, joten rivi pysyy MODELLED. LANS-AFS-SIM ja PocketSDR-AFS jakavat tekijän ja lasketaan yhdeksi riippumattomaksi toteutukseksi; kehyskoodausrivin painettujen vektorien tarkistukset suojaavat yhteistä virhelukemaa vastaan

seg-780369fb9a54 = GPS L1 C/A -generaattorien välinen vertailu

seg-ee47b60515f1 = GPS L1 C/A -levityskoodit (sdr::CaCode) ja LNAV-alikehykset 1-3 (gps_lnav: IS-GPS-200-kenttien kvantisointi spesifikaation piin arvolla, kahden komplementin pakkaus, TLM- ja HOW-sanat, taulukon 20-XIV pariteetti D29*/D30*-inversiolla, sanojen { "2" } ja { "10" } pariteettia ratkaisevat bitit) verrattuna bitti bitiltä gps-sdr-simiin sen mukana tulevalla tiedostolla brdc0010.22n ({ "32" } satelliittia)

seg-39b0d6a58d29 = gps-sdr-sim (MIT, commit 28ca29a6, ajettu erillisenä ohjelmana sitoutetun harnessin kautta), ennakkorekisteröity f88f2969, bittitarkka kynnys (A) C/A-siruille, (B) jokaiselle lasketulle LNAV-kentälle, (C) jokaiselle pariteettibitille. HAVAINTO: (A) { "32 736" } sirusta { "0" } eroaa, (C) { "1 920" } sanasta { "0" } sanan pariteetti eroaa, (B) { "1 152" } lasketusta kentästä { "230" } eroaa yhdellä yksiköllä: gps-sdr-simin eph2sbf typistää kohti nollaa C-tyyppimuunnoksilla siellä, missä lähetettävä kokonaisluku vaatii pyöristystä (jokainen eroava arvo on enintään { "0.01" } yksikön päässä Kshanan pyöristetystä kokonaisluvusta). Pysyy MODELLED: rekisteröity kynnys oli konjunktio

seg-325900ed59ea = GNSS IQ -kohtauksen signaaligeometria riippumatonta kantataajuusgeneraattoria vastaan

seg-ee5625b30ff2 = IQ-kohtausgeneraattorin satelliittikohtainen totuus GPS L1 C/A -broadcast-efemeridikohtaukselle (iq::scene: broadcast-efemeridi SatGeometry, generoituna TruthRecord-totuustietueiksi): mitkä satelliitit ovat horisontin yläpuolella, pseudoetäisyys, koodivaihe ensimmäisessä näytteessä, kantoaallon Doppler ja katselukulmat staattiselle vastaanottimelle, verrattuna kanavatilaan, josta gps-sdr-sim rakentaa oman I/Q-tulosteensa ensimmäisen lohkon samalle efemeridille, vastaanottimelle ja aloitusajalle (ionosfääri pois molemmilla puolilla)

seg-59c06411d647 = gps-sdr-sim (T. Ebinuma, MIT, commit 28ca29a6), riippumaton GPS L1 C/A -kantataajuusgeneraattori, käännetty omalla Makefilellään ja ajettu erillisenä ohjelmana mukana tulevalla tiedostolla brdc0010.22n sen käyttötekstin esimerkkisijainnissa (scripts/gen_iq_gpssdrsim_ref.sh); samaan käännökseen linkitetty sitoutettu harness tulostaa kanavatilan (computeRange, computeCodePhase) ohjelman ensimmäisen lohkon takaa. Kynnykset asetettu ennen generaattorin ajoa (ennakkorekisteröity 7777da53). Rajaus: GPS L1 C/A -geometria staattiselle vastaanottimelle ilman ionosfääriä, troposfääriä tai vastaanottimen kelloa; kohtauksen kanavamallit, kohina ja navigointidatan sisältö eivät kuulu tähän riviin

seg-bf429c8f00fb = GNSS IQ -sieppaus riippumattomasti generoiduilla I/Q-näytteillä

seg-9a0c52bfb06e = iq::acq::acquire (FFT-rinnakkainen koodivaihehaku neliölakisella Marcum-Q-kynnyksellä) GpsL1Ca-replikalla, gps-sdr-simin oman 8-bittisen I/Q-tulosteen jaksolta { "20" } ms, jonka iq::io-näytedekooderi on dekoodannut (ci8, { "2.6" } MHz, { "11" } satelliittia, ei kohinaa): jokainen PRN { "1" }–{ "32" } haettu kahdessa ikkunassa (kukin { "10" } ms), tulosta verrattu koodivaiheeseen ja Doppleriin, jonka gps-sdr-sim moduloi

seg-fb96290003e1 = gps-sdr-simin (MIT, commit 28ca29a6) I/Q-näytteet ja sen oma kanavatila, ennakkorekisteröity 7777da53: (B1) jokainen simuloitu PRN sieppautuu, (B2) mikään muu PRN ei sieppaudu, (B3) koodivaihe enintään { "0.5" } sirun päässä, (B4) Doppler enintään { "125" } Hz päässä. HAVAINTO: B1, B3 ja B4 pätevät molemmissa ikkunoissa (pahin { "0.195" } sirua, { "72" } Hz), mutta B2 ei päde: kaikki { "21" } PRN:ää, joita gps-sdr-sim ei simuloinut, ylittävät myös kynnyksen (tunnusluku { "151" }–{ "206" } kynnystä { "79.5" } vastaan; simuloitujen PRN:ien arvot { "1 300" } ja ylöspäin). Kynnys on asetettu mitatun näytetehon Gaussin kohinalle; gps-sdr-sim ei lisää kohinaa, joten poissaolevan PRN:n solut sisältävät muiden satelliittien ristikorrelaation. Pysyy MODELLED: rekisteröity kynnys oli konjunktio

seg-f40dc3dac990 = Laboratoriotoistokampanjoissa pisteytetyt IQ-monitorit: havaitseminen, havaitsematta jääneet tapahtumat, väärät hälytykset ja väärän hälytyksen suljetun muodon luvut

seg-93fb3109728c = iq::campaign::detect ja kampanjan ajaja: valinnainen [monitors]-taulukko ajaa IQ-monitorit jokaisessa solussa ajajan yhdellä läpikäynnillä. Teho- ja spektrimonitorit näkevät näytteet kunkin etupään ketjun jälkeen; C/N0-, SQM- ja lukitusmonitorit näkevät kunkin seuratun kanavan silmukkapäivitykset. Jokainen hälytys pisteytetään ilmoitettuja tapahtumia vasten: havaittu tai havaitsematta jäänyt per (tapahtuma, hälytyslaji, kanava), havaitsemisaika ja tapahtumien ulkopuoliset väärät hälytykset suhteessa niiden altistukseen. Kunkin testin suljetun muodon väärän hälytyksen luku ilmoitetaan: teho per lohko (tarkka Gamma-häntä), spektrin ylijäämä per lohko (approksimaatio), huipukkuus (yksipuolinen Gaussin), pulssit (binomiyläraja), SQM per keskiarvoistettu päivitys (2Q(k) = Q(1/2, k^2/2), uusi) ja C/N0 CUSUM:n ARL0 (Siegmund). Ilman taulukkoa solut, avaimet ja tiivisteet pysyvät ennallaan. Mitään häiriöaaltomuotoa ei synteesoida

seg-4c4fff313585 = Monitorien omat suljetut muodot Kshanan omissa GPS L1 C/A -kohtauksissa (kohina ja lailliset signaalit; satelliittien omien signaalien vaimennustapahtumat), kynnyksiä vasten, jotka on ennakkorekisteröity tiedostossa docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). HAVAINTO: M1, M2 ja M4 täyttyivät. M3 täyttyi havaitsemisen osalta ({ "18" } / { "18" } vaimennusta, P_md { "0" }) ja NOT MET sen ajoituslausekkeen osalta: havaitsemisajan mediaani on { "1.001" } s, kun vaatimus on { "2" } x ARL1 näytettä = { "0.433" } s. CUSUM näkee yhden estimaatin kunkin ikkunan ({ "1" } s) osalta, joten näytemäärän yläraja on alle yhden näytteen. Vain sisäinen johdonmukaisuus: mitään todellista vastaanotinta tai tallennettua häiriötä ei tarkisteta

seg-5b7eb7ddb474 = IQ-monitorien havaitsemis-ROC pisteytetystä laboratoriotoistokampanjasta

seg-57fe85965c9c = iq::campaign::detect (windows, roc) ja iq::campaign::report::rocs: monitoreilla varustetun kampanjan jokainen solu säilyttää hälytyslajia ja kanavaa kohti monitorin oman testitunnusluvun maksimin kunkin ilmoitetun tapahtumaikkunan yli (positiivinen) ja tapahtumien ulkopuolisten laatoitettujen roc_window_s-ikkunoiden yli (negatiivinen). Tunnusluvut ovat lohkotehon poikkeama, PSD-ylijäämä, huipukkuus z, keskiarvoistetun metriikan SQM |z| ja C/N0 CUSUM. Raportti yhdistää ne lajeittain empiiriseksi ikkunatason ROC-käyräksi, jossa on AUC ja toimintapiste asetetulla kynnyksellä, kirjoitettuna tiedostoon roc.json (kshana.campaign-roc/1) ja tiedoston report.html Detection ROC -osioon. Ilman monitoreita kampanja ei kirjoita kumpaakaan

seg-e882dd678998 = Synteettiset kampanjat Kshanan omista GPS L1 C/A -kohtauksista (satelliittien omien signaalien vaimennukset), kynnyksiä vasten, jotka on ennakkorekisteröity tiedostossa docs/design/DETECTION-ROC.md (b47e358d). HAVAINTO: R2 täyttyi (satunnaistaso, kun havaittavaa ei ole). R1 NOT MET: cn0_drop AUC { "0.7855" } kynnystä { "0.95" } vastaan, koska jokainen tapahtuman jälkeinen negatiivinen ikkuna perii CUSUMin vaimenemisen havainnosta (kaikki { "18" } tapahtuman jälkeistä negatiivista saavuttavat arvon { "81" } tai suuremman; kaikki { "18" } ennen tapahtumaa olevaa pysyvät arvossa { "0" }). Vain sisäinen johdonmukaisuus: mitään todellista vastaanotinta tai tallennettua häiriötä ei tarkisteta

seg-3a3cfa322f01 = Avoimen vastaanottimen C/N0- ja lukitusmallien kalibrointi IQ-kampanjatuloksiin ilmoitetulla ennustevirheellä

seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) ja <c1/>, komento <c2/>, Python-moduuli <c3/> ja MCP-labfit-työkalu (vain sen työhakemiston sisällä olevat kampanjakansiot): lukee kampanjan tulostekansion (<c4/>) tiivisteensä (DIGEST) perusteella ja ryhmittelee pisteytetyt solut sovitusyksiköiksi (signaali x silmukan rakenne x etupään ketju x häirintälaitteen tyyppi, ei koskaan yhdistetä). Kullekin yksikölle se sovittaa mitatun C/N0:n ilmoitettua J/S:ää vasten spektrierotusmuodolla. Q_eff ei ole tunnistettavissa C/N0-datasta ilman riippumatonta häirintälaitteen ja signaalin tehojen mittausta, joten Q ilmoitetaan eikä koskaan sovitetaan (tyyppitaulukko, tapahtuman q tai tuntemattomalle tyypille vahingollisin ilmoitettu arvo, cw Q = { "1" }). Sovitettava parametri on tunnistettava siirtymä delta_eff = delta - { "10" } log10 Q, ja korrelaatiosuoja raportoi degeneraation. C/N0-binit, jotka ovat lukittuina alle { "90" } % ajasta, sensuroidaan ja luetellaan. Kynnys-J/S annetaan suoraan ja suljetulla muodolla; seurantasilmukka- ja empiiriset lukitusmallit kytketään C/N0-mallin kautta pudotus- ja uudelleenlukitusviipymillä. Siemenluvulla ajettu klusteribootstrap tallenteiden yli ({ "1000" } toistoa) antaa persentiilivälit; { "90" } %:n ennustevälit tulevat residuaaliotannoista; leave-one-recording-out-holdoutit jaetaan interpolaatioon ja ekstrapolaatioon; ennakkorekisteröity [validation]-taulukko tiivistetään ja jokainen kynnys arvioidaan PASS/FAIL. Raportti kshana.labfit-iq/1 JSON-, CSV- ja generoituna Markdown-muodossa, yksikkölohkolla. Vain synteettinen (ei kolmannen osapuolen tallennetta, ei häirintäaaltomuotoa). Vastaanottimen lokin labfit-polku on ennallaan

seg-f9abecb1eea6 = Synteettinen parametrien palautus Kshanan omissa GPS L1 C/A -kohtauksissa, joihin on pakotettu tunnettu C/N0-profiili osion { "3.1" } kaavasta, seurattuna ja pisteytettynä komennolla kshana iq campaign, kynnyksiä vasten, jotka on ennakkorekisteröity tiedostossa docs/design/LABFIT-FROM-IQ.md (osio { "5.1" }, muutettu 2026-10-12 commitissa b7117bf, osio { "13" }). Kampanjoiden C/N0-estimaattori (M2M4) lukittiin commitissa 5b13e3c2, joka työnnettiin ennen ensimmäistä kynnysarviointia (sitoutettu yhdessä sovituskoodin kanssa, ei yksinään), yhden ilmoitetun diagnostisen seuranta-ajon jälkeen. HAVAINTO 18 tapahtuman kynnyskampanjassa: (c) PASS; (a') NOT MET, delta_eff-virhe -1.097 dB kynnystä { "0.5" } dB vastaan (yhä -0.89 dB biniloilla tasolla { "38" } dB-Hz ja sen yli); (b') NOT MET, { "50" } kampanjasta { "0" } kattaa totuuden (virhe -1.189 +/- { "0.093" } dB, väli noin { "0.3" } dB); (d) NOT MET, suljettu muoto { "2.20" } dB suoran J/S:n alapuolella lukituksen menetyshetkellä, noin sovitettu pudotusviipymä kertaa ramppinopeus ({ "2.09" } dB); (a):n ja (b):n alkuperäiset Q-lausekkeet ovat NOT MET, koska Q ei ole tunnistettavissa. JATKOTOIMI (kynnykset ennakkorekisteröity commitissa 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): porrastetun J/S:n kampanjassa delta_eff palautuu +{ "0.185" } dB sisällä (S1 MET: ramppivirhe on estimaattorin viive); (d) sellaisenaan täyttyy seurantasilmukkamallilla ({ "0.45" } dB) mutta ei empiirisellä mallilla ({ "6.42" } dB), joten S2 on NOT MET; uudessa ramppikampanjassa (d), kun sovitettuun pudotusviipymään lisätään kunkin tapahtuman ramppinopeus, poikkeama on enintään { "1" } dB molemmilla malleilla (R1 MET), ja (a') ja (d) sellaisenaan eivät jälleen täyty (-1.25 dB; { "2.32" } ja { "9.47" } dB). Menetelmä tarkistetaan, ei yhtään vastaanotinta: sitä ei voi saada tilaan VALIDATED synteettisestä datasta

seg-9537d301c95e = GPS LNAV -koodaus dekoodattuna riippumattomalla vastaanotinkirjastolla

seg-909415621881 = Kshanan LNAV-alikehykset 1-3 (gps_lnav::encode_subframes) { "32" } efemeridille tiedostosta brdc0010.22n, syötettynä RTKLIBin funktioille decode_word ja decode_frame: jokaisen sanan pariteetti, alikehysten dekoodaus johdonmukaisella tietojen julkaisutunnuksella (issue of data) ja jokainen dekoodattu parametri Kshanan kokonaislukua ja syöttöarvoa vastaan

seg-9b21219e9572 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame erillisenä ohjelmana, ennakkorekisteröity ca5f0142: R1 pariteetti ja dekoodaus, R2 dekoodattu arvo yhtä suuri kuin Kshanan kokonaisluku kertaa IS-GPS-200-skaalaus suhteellisella tarkkuudella { "2" }^-52, R3 enintään puolen kvantin päässä syötteestä. HAVAINTO: R1 { "960" } / { "960" } sanaa ja { "96" } / { "96" } alikehystä; R3 jokainen parametri, viikko ja vertailuaika täsmälleen; R2 epäonnistuu { "41" } arvolla (af1, delta-n, IDOT), joissa ero on { "1" }–{ "4" } yksikköä viimeisellä numerosijalla, koska RTKLIBin P2_43 on desimaaliluku { "1.136868377216160E-13" }, { "2.6e-16" } suhteessa arvoon { "2" }^-43; RTKLIBin vakiolla jakaminen palauttaa Kshanan kokonaisluvun joka tapauksessa. Pysyy MODELLED: rekisteröity R2-kynnys oli liian tiukka oraakkelin oman vakion kannalta

seg-f66855e35c53 = GPS LNAV -navigointiviestin koodaus

seg-8caf8366e2f8 = IS-GPS-200 LNAV-alikehykset 1-3 (gps_lnav::encode_subframes: jokaisen kello- ja rataparametrin lähimpään pyöristävä kvantisointi spesifikaation skaalauskertoimilla ja piin arvolla, kahden komplementin pakkaus, TLM- ja HOW-sanat, taulukon 20-XIV pariteetti D29*/D30*-inversiolla, sanojen { "2" } ja { "10" } pariteettia ratkaisevat bitit), viesti, jonka GPS L1 C/A -signaaligeneraattori lähettää

seg-2b71b166b9d5 = RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx jäsentää IGS:n päivittäisen broadcast-tiedoston BRDC00IGS_R_20250610000_01D_MN.rnx ja decode_word/decode_frame dekoodaa Kshanan sanat, ajettu erillisenä ohjelmana; ennakkorekisteröity d4d9eb9d ennen tiedoston hakua, tarkka kokonaislukukynnys. Mutaatio: pyöristyksen sijaan typistäminen antaa { "235" } virhettä. Saman enkooderin aiemmat vertailut on tallennettu havaintoina: gps-sdr-simiä vastaan, joka typistää ({ "230" } kenttää), ja RTKLIBin skaalattuja arvoja vastaan, joiden desimaalinen { "2" }^-43-vakio ei täyttänyt yhden ulpin kynnystä ({ "41" } arvoa). Integraattorin jälkivarmennus (pysyy MODELLED): vertailu täsmää ja pariteettijoukon mutaatio myös saa testin epäonnistumaan, mutta ennakkorekisteröinti d4d9eb9d saavutti julkisen haaran kello { "20" }:{ "02" }:{ "29" } UTC, kaksi sekuntia tulos-commitin 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC) jälkeen, joka jo sisältää RTKLIBin tulosteen tiedostolle, joten järjestystä ”rekisteröity ennen tiedoston hakua” ei voida osoittaa; uusi rekisteröinti, joka työnnetään ennen näkemättömän broadcast-tiedoston hakua, ratkaisisi asian

seg-c5c944357643 = Sieppaus ja C/N0-estimointi todellisessa Kuun IQ-datassa

seg-f5dcb5e06bf4 = Rinnakkainen koodivaihehaku (acquisition::pcps_acquire: siirrettävä FFT, koherentti laskostus, epäkoherentti akkumulointi, khii-toisen kynnys koko haun väärän hälytyksen todennäköisyydelle), tarkennus, avoimen silmukan prompt-korrelaatio koodin Dopplerilla ja M2M4 C/N0 -estimaattori, ajettuna LuGRE L1 4-bittisille IQ-erille, jotka on luettu moduulin realdata::ion_sdr kautta

seg-c53c795135d6 = GNSS-SDR { "0.0.19" } (GPL-3.0, erillinen ohjelma, kiinnitetty konfiguraatio) yhdeksällä ei-pinta L1-erällä ja lentovastaanottimen RAW C/N0:lla (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), ennakkorekisteröity 768cb62b. HAVAINTO: Kshanan lukija dekoodaa kaikki { "288" } vertailtua jaksoa identtisesti riippumattoman muuntimen kanssa; GNSS-SDR julistaa { "288" } haun joukosta { "266" } positiivisiksi ja Kshana on samaa mieltä kaikissa { "266" } päätöksessä, mutta vain { "250" } sijaitsee GNSS-SDR:n solussa (A2 epäonnistuu); C/N0-haara on tyhjä, koska yksikään lennon RAW-epookki ei ole lähempänä kuin { "30" } s mitään erää (lähin { "141" } s). Useimmat positiiviset ovat artefakteja: paljaat kahden komplementin tasot sisältävät keskiarvon -0.5 sekä I:ssä että Q:ssa, ja nollataajuuslinja on { "32" } dB kohinan yläpuolella kaistassa, jonka leveys on { "1" } kHz, ja molemmat vastaanottimet sieppaavat sen. Kaksi erää (OP5, OP12) suljettiin pois virheellisesti: niiden metadatan numerot poistanut luenta luultiin ristiriidaksi niiden otsakkeiden kanssa; todellinen syy oli, että lukija ei osannut lukea sanaa leveämpää näytettä (korjattu sittemmin). Pysyy MODELLED

seg-709626569a5c = Sieppaus todellisessa Kuun IQ-datassa kiertoradasta ennustettua Doppleria vasten (näytetehopäätös)

seg-784ebd80c425 = acquisition::pcps_acquire näytetehopäätöksellään yhdeksällä ei-pinta LuGRE L1 -erällä, joissa on mid-rise-tasot; sieppattujen satelliittien väliset Doppler-erot verrattuna eroihin, jotka on ennustettu ESAn lopullisista radoista ja Firefly-rekonstruoidusta Blue Ghost -radasta

seg-38b8127db267 = Ennustettu Doppler ESA/ESOCin lopullisista radoista ja NAIF CLPS -rekonstruoidusta radasta (xval/lugre-predicted-doppler/predict.py, Kshanasta riippumaton), ennakkorekisteröity 0d1839d2. HAVAINTO: kaikki { "288" } hakua ylittävät kynnyksen kohinalla (näytetehotunnusluvut noin { "430" }–{ "520" } kynnystä { "346.3" } vastaan), joten P1 pätee triviaalisti ja P3 pätee ({ "288" } haun joukosta { "274" } ennustettu näkyviksi), kun taas P2 epäonnistuu { "4033" } parilla { "4036" } parista. Kaistarajoitettu etupää nostaa jokaisen solun kohinaa noin { "1.46" } kertaa (kiinnitetty: kohinalattia { "292" } valkoisen kohinan { "200" } sijaan kohteessa OP2 PRN { "1" }), jota näytetehotunnusluku ei näe. Pysyy MODELLED

seg-89875d67b253 = Sieppaus todellisessa Kuun IQ-datassa, pisteytettynä kiertoradasta ennustetulla Dopplerilla

seg-956bcfeaf319 = acquisition::pcps_acquire solujen keskiarvoistavalla päätöksellä (huippu verrattuna ruudukon keskimääräiseen soluun, kestävä kaistarajoitetulle kohinalle) yhdeksällä ei-pinta LuGRE L1 -erällä, joissa on mid-rise-tasot; sieppattujen satelliittien väliset Doppler-erot verrattuna eroihin, jotka on ennustettu ESAn lopullisista radoista ja Firefly-rekonstruoidusta Blue Ghost -radasta

seg-f80a751bc49b = Ennustettu Doppler ESA/ESOCin lopullisista radoista ja NAIF CLPS -rekonstruoidusta radasta (xval/lugre-predicted-doppler/predict.py, Kshanasta riippumaton), ennakkorekisteröity a81a9a4e. HAVAINTO: P1 ja P3 pätevät ({ "4" } erää, { "12" } / { "12" } sieppausta ennustettu näkyviksi) mutta P2 epäonnistuu kaikissa pareissa ({ "8" } / { "8" }). Kaksi vahvinta paria vastaa ennustetta suuruudeltaan mutta päinvastaisella etumerkillä (OP2 PRN 18/24: +{ "7670.0" } Hz mitattu, -7693.9 ennustettu; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), joten rekisteröity I-matalassa-nibblessä-järjestys on erien konjugaatti; kuusi juuri kynnyksen yläpuolella olevaa havaintoa ei vastaa kumpaakaan etumerkkiä. Rekisteröinti aliarvioi myös tarkennuksen Dopplerin hajonnan ({ "30" }–{ "50" } Hz kahden ajon välillä). Pysyy MODELLED

seg-8fa779dd1788 = Sieppaus holdout-datana olevassa todellisessa Kuun IQ-datassa kiertoradasta ennustettua Doppleria vasten

seg-484868771231 = acquisition::pcps_acquire (solujen keskiarvoistava päätös, väärän hälytyksen todennäköisyys { "1e-7" }) ja refine_doppler_coherent Kuun pinnalla tallennetuilla LuGRE L1 -erillä (I ylemmässä nibblessä, mid-rise-tasot); sieppattujen satelliittien väliset Doppler-erot verrattuna eroihin, jotka on ennustettu ESAn lopullisista radoista ja Firefly-laskeutumispaikan kernelistä

seg-8bfd18bb6478 = Ennustettu Doppler ESA/ESOCin lopullisista radoista ja NAIF CLPS Firefly -laskeutumispaikan kernelistä (xval/lugre-predicted-doppler/predict_surface.py, Kshanasta riippumaton), ennakkorekisteröity 2108e6ff erillä, joita ei ollut aiemmin avattu. HAVAINTO: ei-tyhjyys epäonnistuu; yhdessäkään erässä ei ole kahta sieppausta. OP40 suljettu pois (metadata nimeää puuttuvan tiedoston); OP38, OP73, OP77_0, OP77_1 eivät sieppaa mitään eivätkä näytä väärää hälytystä tasolla { "1e-7" } (ylimmät tunnusluvut { "325" }–{ "356" } kynnystä { "385.9" } vastaan); OP74 ja OP76 sieppaavat PRN:n { "31" } ja OP78_0 ja OP78_1 PRN:n { "12" }, kukin yksinään, kaikki ennustettu näkyviksi. Pysyy MODELLED. Ilmoitetut poikkeamat: rekisteröity Doppler-kynnys { "10" } Hz perustuu koherentin tarkennuksen synteettiseen Monte Carloon, ei jo nähtyjen erien hajontaan, jota integraattori pyysi; OP40 suljettiin pois ennen ajoa, koska sen metadata nimeää näytetiedoston, jota aineisto ei sisällä

seg-758af035b3ce = Kuun yhteinen viestintä- ja navigointigeometria

seg-11f861bdc6bf = Satelliittikohtaiset topocentriset katselukulmat (atsimuutti myötäpäivään pohjoisesta, korkeuskulma) ja vinoetäisyys nimetyssä selenografisessa sijainnissa, kun satelliitti on annettu sijainnin Kuun kappalekiinteässä koordinaatistossa (validoitu väite). Avaruussignaalin etäisyysmittaustarkkuus on skenaarioparametri, jotta palvelutilavuuden pyyhkäisy tuottaa etäisyysmittauksen VAATIMUKSEN eikä läpäisy/hylkäys-tulosta yhdellä kiinteällä sigmalla; kyseinen parametri on suunnittelusyöte validoidun väitteen ulkopuolella

seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, ajettu työkaluna hakemistosta xval/anise-service-geometry, binääri lunar-look-angles-xval, joka ei kutsu Kshana-koodia): ANISEn oma atsimuutti-, korkeuskulma- ja etäisyysrutiini (azimuth_elevation_range_sez) sijainneille, jotka on rakennettu sen leveys-pituus-korkeus-konstruktorilla pck00011-Kuulle (pallo { "1737.4" } km), ja satelliitit on kierretty koordinaatistoon MOON_PA_DE440 tiedoston moon_pa_de440_200625.bpc kautta. { "768" } näytettä { "8" } sijainnissa (nimettyjä sijainteja { "4" } ja muita { "4" }, horisontin ylä- ja alapuolella), { "12" } epookkia ja { "8" } satelliittia täsmäävät: poikkeama on enintään { "1e-6" } deg atsimuutissa ja korkeuskulmassa ja { "1" } mm etäisyydessä ja sijainnissa (asetettu ennen vertailua); mitatut poikkeamat { "2.2e-12" } deg, { "2.1e-13" } deg ja { "5.6e-9" } m. Väite: sijainnin asettaminen ja katselukulmat, kun satelliitti on annettu sijainnin kappalekiinteässä koordinaatistossa. Kshanan oma keskimääräiseen kiertoon perustuva Kuun kappalekiinteän koordinaatiston toteutus ja etäisyysmittaustarkkuuden parametri jäävät sen ulkopuolelle; suljetun muodon geometrian yksikkötestit säilyvät tukevina tarkistuksina

seg-10af60b488b9 = NovaMoon-luokan differentiaalinen referenssiasema: yhteismoodin kumoutuminen + peruslinjan mukana kasvava jäännös + DGNSS-suojaustasot

seg-96b2627b388a = Differentiaalisen virheenkumoamisen identiteetti + DO-229E SBAS PL -koneiston uudelleenkäyttö; yksittäisero- ja WLS-ratkaisu on lisäksi ristiintarkistettu RTKLIBin lsq()/matinv()-funktioita vastaan (Takasu, BSD-2-Clause, käännetty C) — riippumaton ratkaisijakoodi, mutta sama ensimmäisen asteen LOS-eroalgebra, joten edelleen InternalConsistency

seg-c04a3591074c = Kuun yhteentoimivuusvienti

seg-91f4a066b3c0 = LunaNet/IOAG-linjattu Kuun koordinaatisto-, aika- ja efemeridivienti (CCSDS OEM + KIF) edestakaisen kierron vastaavuudella

seg-f5f8ed69bea7 = kshanan Kuun OEM-vienti jäsennettynä uudelleen riippumattomalla kolmannen osapuolen kirjastolla <c1/> (R. J. Anderson): koordinaatisto- ja aikatunnisteet sekä epookkikohtainen tila täsmäävät kirjoitustarkkuuteen ({ "1" } mm / { "1e-9" } km/s), ja vienti, josta TIME_SYSTEM on pudotettu, hylätään — rakenteellinen tiedonvaihdon edestakainen kierto; Kuun koordinaatiston ja ajan fysikaalinen semantiikka validoidaan omilla riveillään, joten tämä pysyy MODELLED. { "0.30" } ulkoinen vertailu, havainto (pysyy MODELLED): toinen riippumaton lukija, Orekit { "12.2" } CCSDS OEM -jäsennin (Apache-2.0, tiukat oletukset), hylkää molemmat Kuun tiedostot, koska se ei toteuta aikajärjestelmiä LTC ja TCL (se dekoodaa kirjaston (crate) EME2000/UTC OEM:n ja dekoodaa Kuun tiedostot, kun TIME_SYSTEM korvataan arvolla TDB); oem { "0.4.5" } dekoodaa ne kirjoitustarkkuuden rajoissa vain perääntymällä tukemattomasta aikajärjestelmästä. Näiden Kuun tiedostojen tiedonvaihtoa valtavirran CCSDS-lukijoiden kanssa ei ole osoitettu

seg-8ab65cbefb75 = PNT-kestävyyden viitekehykseen linjattu pisteytys

seg-c48198f31d63 = Dimensiokohtaiset osapisteet Kshanan omien seitsemän kestävyysluokan (ei DHS-termejä), RethinkPNT RDRR -funktioiden ja Yangin kriteerien yli, kukin merkitty mallinnetuksi ja sen ajurilla; alustava RPCF-taso rajatun heikkenemisen portilla. Simulaatiopohjainen itsearviointi, ei koskaan sertifiointia.

seg-f905aeb203bb = Käsin johdetut mittarikohtaiset kaavat: käänteinen Simpson-monimuotoisuus, painotettu keskiarvo-komposiitti, rajatut/rajoittamattomat aikajanojen kestot, heikoimman lenkin tasoportaikko

seg-d7bdb6fe186e = Kestävyyspistemäärän päätösten epävakaustutkimus

seg-5fcf18a68bb1 = Kvantifioi, miten yksittäinen komposiittipistemäärä / RPCF-taso järjestää arkkitehtuurit uudelleen perustellun painotussimpleksin ja uhkajoukon alla (top-1-kääntymisaste, Kendall-tau-hajonta, tasonkääntymisaste, järjestysalueet); ilmoitettu vs. mitattu -analyysit ja monimuotoisuuden romahtamisen analyysit.

seg-b6bf76a752a0 = Suljetun muodon järjestystunnuslukujen identiteetit (tau välillä [-1,{ "1" }] käsin lasketuilla arvoilla; deterministinen siemenluvulla ajettu Dirichlet) ja konstruoidut vakaat/epävakaat todistajat

seg-1bf03544a010 = Demonstraation edustavuus ja aukot lentoon

seg-db24d16d38c9 = Tuloskohtainen rehellisyyskirjanpito (ledger), joka kvalifioi demonstraatiotulosteen: sen ulkoiset ankkurit, mallinnetut oletukset, aukot lentoon ja edustava TRL-alue, pakotetuilla invarianteilla (Validoitu vaatii ulkoisen ankkurin; Mallinnettu vaatii aukon eikä voi väittää tasoa yli TRL { "4" }).

seg-81d3adb239c5 = Suljetun muodon invariantit, jotka kuvautuvat ”edustavuus perusteltu + aukot lentoon tunnistettu” -compliance-käytäntöön; sidottu varmennuksen tilan ja oraakkelilajin rajaan

seg-52ab936eb5f5 = Kvantti- ja klassisen ratkaisun kompromissitodisteet (yhteinen muoto)

seg-a6679ed5bed7 = Yksi toistettava TradeEvidence-olio (kiinteä kehys: skenaario+siemenluku+moottori; yhteiset kvantti vs. klassinen -arvot laatumittaria kohti polariteetiltaan oikealla hyödyllä, valinnainen luottamusväli { "95" } %, validoitu/mallinnettu-merkintä) edustavuustietueen kera, jotta jokainen kvantti-PNT-vertikaali raportoi kompromissin samalla rehellisellä tavalla.

seg-70da3e15ea8b = Suljetun muodon hyöty/voittaja-identiteetit + uskollinen kääre olemassa olevalle quantum_trade::TradeResult-tyypille; rehellisyys sidottu edustavuuskirjanpitoon (ledger) ja varmennusmerkintöihin

seg-20fee61b3107 = Kvanttilaitteiden virhemallikirjasto

seg-e42eabe9bc2a = Laitekortit (optinen/ioniloukku/elohopea-ioni + klassiset kellot, jotka on käytetty uudelleen moduuleista holdover/clock_state; kylmäatomi-interferometri; klassiset + lomittuneisuus-/yksifotoniajansiirtolinkit), joista jokainen kantaa edustavuustietueen; lomittuneisuuslinkki lisää laukauskohinarajoitetun ajoituksen toistotarkkuusmallin (~jitter/sqrt(R*tau), pimeälaskennan rangaistus, systemaattinen lattia).

seg-632600203e1f = Uudelleenkäytetyt kello-/CAI-kertoimet (holdover/clock_state, julkaistut arvot) + suljetun muodon laukauskohina- ja häviöidentiteetit lomittuneisuuslinkille

seg-86d71fd89f26 = Luotettu kvanttiajoitus (ajansiirto + turvallinen jakelu + poikkeama)

seg-d2a3d37825ef = Päästä päähän -kvantti vs. klassinen ajansiirtoketju (kellon holdover + linkin toistotarkkuus neliöllisesti), uudelleenkäytetty ajoituksen suojaustaso, viive-/toistohyökkäyksen turvallisuuslaatumittari (1-P_md) sekä kellopoikkeaman havaitsemistodennäköisyys + CUSUM-viive, ilmoitettuna rehellisenä TradeEvidence-oliona edustavuustietueen kera.

seg-ac95d112a17a = Suljetun muodon neliösummabudjetti uudelleenkäytettyjen validoitujen ydinten yli (ADEV vs. Stable32/NIST; TPL-raja; havaitseminen analytic_pd/pmd); rehellisyys sidottu edustavuuskirjanpitoon (ledger)

seg-eaf341ff4522 = GNSS-vapaa kvanttinavigointi

seg-908a44a9f7c7 = Kvantti- (kylmäatomi-interferometri) vs. klassinen navigointiluokan INS-dead-reckoning GNSS-katkon yli: paikkavirheen kasvu, holdover paikkakynnykseen asti ja kvantti vs. klassinen -kompromissi rehellisenä TradeEvidence-oliona; rehellinen havaittavuushuomautus (bias ei ole havaittavissa ilman paikannusta, joten virhe kasvaa).

seg-508f2c8884e2 = Uudelleenkäytetyt inertiabudjetit ristiintarkistettu riippumatonta saman dead-reckoning-ODE:n Octave-kaksoisintegrointia vastaan (eri ajoympäristö, jaettu malli → ReferenceImpl) sekä julkaistua Freier-2016-lyhyen aikavälin kohinaa yksipuolisena ankkurina; kvantti vs. klassinen -komposiitti pysyy MODELLED

seg-914132833f5a = Vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille

seg-f20392820b9d = Merkitty kvanttivikojen luettelo (kellotaajuushyppy/-ajelehtiminen/lukituksen menetys; anturin bias-askel/katkos), havaitsemistunnusluvun ROC AUC bootstrap-luottamusvälillä ja pienin havaittava vika kiinteällä väärän hälytyksen asteella; kvanttikellolla tuettu monitori havaitsee pienempiä vikoja kuin klassinen, ilmoitettuna rehellisenä TradeEvidence-oliona.

seg-a689ab2ebb84 = Suljetun muodon Gaussin AUC = Phi(mu/(sigma*sqrt2)), ristiintarkistettu ulkoisesti validoitua eval_stats::bootstrap_auc_ci-funktiota vastaan (vs. scikit-learn) + analyyttiset havaitsemiskynnykset

seg-0633e05d393f = Vääntömomentiton jäykän kappaleen asentodynamiikka

seg-23f43007bcbf = Eulerin pyörimisliikeyhtälöt (I ω̇ = τ − ω × Iω, pääakseli ja yleinen inertiatensori) kytkettynä kvaternioniasentokinematiikkaan (q̇ = ½ q ⊗ ω) ja propagoituna kiinteäaskeleisella RK4-integraattorilla, joka renormalisoi kvaternionin joka askeleella

seg-2d21a01ea132 = Basilisk { "2.9.1" } avaruusaluksen hubin jäykän kappaleen propagointi (AVSLab, ISC; MRP-asento omilla kytketyillä hub-yhtälöillään, svIntegratorRKF78 suhteellisella toleranssilla { "1e-12" }), vääntömomentittomien jäykän kappaleen yhtälöiden riippumaton toteutus: Kshanan RK4-kvaternioni (dt { "0.01" } s) ja kappalekiinteät kulmanopeudet täsmäävät toleranssilla { "1e-9" } jaksolla { "1e4" } s kahdella yleisellä ei-diagonaalisella inertialla (pahimmat { "3.3e-11" } ja { "3.4e-12" } rad/s); toleranssi asetettu ennen vertailua. Validoitu väite: vääntömomentiton liike; ulkoisen vääntömomentin termiä ei vertailla. Säilymislaki- ja symmetrinen-pyörrä-tarkistukset säilyvät tukevana itsejohdonmukaisuutena. Ei joustavaa kappaletta / ohjaussilmukkaa / ulkoisen vääntömomentin ympäristöä

seg-93b8ba1ba0e5 = Clohessy–Wiltshire / Hill -suhteellisen liikkeen dynamiikka

seg-17f27a95d009 = Jahtaajan suhteellinen liike kohteen ympärillä ympyräratainen viiteradalla LVLH-kehyksessä: linearisoidut Clohessy–Wiltshire-yhtälöt (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }) ratkaistuna suljetun muodon { "6" }×{ "6" } tilansiirtymämatriisilla Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) ja rajatun suhteellisen radan ehdolla ẏ₀=−2n·x₀, sekä suljetun muodon toisen asteen korjaus (cw_dynamics::second_order_correction, CW-vaste tarkkojen ympyräratainen chief -yhtälöiden neliöllisille termeille; Karlgaard ja Lutze { "2003" }, Newman, Lovell ja Pratt { "2015" }) koottuna funktioksi cw_dynamics::propagate_second_order. Validoitu tuloste on propagate_second_order; pelkkä lineaarinen Φ on karakterisoitu epälineaarista totuutta vastaan, ei validoitu

seg-29adc2d68a7b = Orekit { "12.2" } (Apache-2.0) NumericalPropagator, kahden kappaleen, LOFType.QSW, ajettu erillisenä ohjelmana (fixture muuttumaton kierroksesta { "1" } lähtien). Ennakkorekisteröity kynnys { "1e-3" } m jokaisessa jokaisen tapauksen näytteessä; toisen asteen moottorikorjaus ajettiin uudelleen sitä vasten muuttumattomana (muutos 8c8e768d, kirjoitettu ennen propagaattorin olemassaoloa, ilmoittaen että ensimmäisen asteen erot olivat tiedossa). propagate_second_order täsmää: poikkeama on enintään { "1.15e-7" } m (C1), { "9.8e-8" }, { "5.4e-8" } ja { "2.2e-8" } m; toisen asteen termin puolittaminen epäonnistuu virheillä { "1.85e-3" }–{ "3.14e-3" } m. Pelkkä lineaarinen Φ poikkeaa epälineaarisesta totuudesta { "1.2" }–{ "6.3" } mm etäisyydellä { "100" } m kolmanneksen kierroksen yli (poisjätetty toisen asteen termi; sen tiukka testi on pidetty ohitettuna), joten se on karakterisoitu, ei validoitu. Säilytetyt sisäiset tarkistukset: Φ RK4-integrointia vastaan Hillin yhtälöille, Φ(t)Φ(−t)=I, rajatun radan ja −12π·x₀-ajelehtimisen identiteetit sekä toisen asteen termin kolmannen asteen jäännöksen skaalautuminen. Rajaus: ympyräratainen chief, etäisyydet lähellä { "100" } m, korkeintaan kolmannes kierroksesta; ei eksentrisyyttä (Tschauner–Hempel), J2- tai differentiaalisen ilmanvastuksen termejä; pienen erotuksen oletus

seg-d31be81dfd8f = TDOA/FDOA-passiivinen lähettimen geopaikannus

seg-aa870cee16f6 = Paikantaa lähettimen (häirintälaite/harhauttaja tai oportunistinen lähde käänteis-PNT:tä varten) vastaanotinverkon saapumisaikaerosta (TDOA) — τᵢ=(Rᵢ−R₀)/c-hyperboloidien leikkaus ratkaistuna Gauss–Newton-pienimmällä neliösummalla — ja lisäämällä taajuuserot (FDOA, etäisyysnopeuksien erot) liikkuvilla vastaanottimilla palauttaa yhdessä sijainnin ja nopeuden; sijaintikovarianssin Cramér–Rao-alaraja mittausgeometriasta

seg-17b45796fd43 = Estimaattorin ja geometrian itsejohdonmukaisuus: eteen→taakse -edestakaiset kierrokset, Fisher/CRLB-identiteetti J·CRLB=I, GDOP:n monotonisuus ja estimaattori, joka saavuttaa oman Cramér–Rao-rajansa Monte Carlo -kohinassa — sisäisen johdonmukaisuuden tarkistuksia, EI ulkoinen aineisto, joten rivi pysyy InternalConsistency. MODELLED passiivinen geopaikannus — pistelähteen näköyhteysmalli; ei monitie-etenemistä / NLOS:ia, vastaanottimen kellobiasta eikä ilmakehän refraktion termejä. { "0.30" } kierros { "2" }, Ho ja Chan { "1993" } ja Ho ja Xu { "2004" } vastaan (ennakkorekisteröity f89018b8, kynnys { "1" } % kustakin painetusta arvosta), havainto (pysyy MODELLED): pintarajoitettu TDOA-raja toistaa { "40" } N geometriset kertoimet (-0.11 %, -0.02 %) ja suurimman TDOA:n; yhteinen TDOA+FDOA-raja toistaa kuvan { "6" } (+{ "0.06" } %, -0.17 %) ja lähteessä, jonka tekijöiden oma koodi nimeää kuvalle { "7" } (muutos kirjoitettu tuloksen näkemisen jälkeen, ilmoitettu), kuvan { "7" } (+{ "0.11" } %, -0.02 %); se on yhtä suuri kuin tekijöiden julkaistu rajakoodi (BSD-tyylinen, ajettu GNU Octavella) tarkkuudella { "3e-12" }; kovarianssipainotettu suurimman uskottavuuden ratkaisija saavuttaa painetun rajan (+{ "0.3" } – +{ "0.4" } %). Ottawa-kertoimet, jotka paperi tulostaa Monte Carlosta ({ "251" }, { "7.1" }), poikkeavat +{ "1.3" } % ja +{ "4.4" } %, ylittäen kynnyksen { "1" } %

seg-36b74b49f82f = 3-DoF-ballistisen paluun huippuhidastuvuus verrattuna julkaistuun Stardustin nimellisarvoon

seg-a05ca2fde6fc = 3-DoF-pistemassapaluu pyörivän pallomaisen Maan yli US Standard Atmosphere -mallin ({ "1976" }) läpi, integroituna RK4:llä inertiaalisesta paluutilasta, raportoiden huippuhidastuvuuden ja sen korkeuden; planeettasuhteellinen paluutila johdettuna inertiaalisesta. Ajettavissa skenaariotyyppinä <c1/>.

seg-5ab7065c0803 = Desain, Mitcheltreen ja Cheatwoodin Stardust-nimellistapaus ({ "1999" }, NASA NTRS { "20050042027" }): maksimihidastuvuus { "33.4" } g nopeudesta { "12.6" } km/s planeettaan nähden, laukaisumassa { "45.8" } kg, 6-DoF POST -lentorata täydellä aerodynaamisella tietokannalla; paluurajapinta Desailta, Lyonsilta, Tooleylta ja Kangasilta (NTRS { "20090004445" }): säde { "6503.14" } km, inertiaalinen { "12.9" } km/s kulmassa -8.2 deg. Kynnykset ennakkorekisteröity tiedostossa xval/entry-stardust/PREREGISTRATION.md ennen yhtäkään ajoa näillä syötteillä; molemmat kynnykset täyttyivät ensimmäisellä ajolla. MITÄ EI: yksi julkaistu tapaus ja yksi suure (huippuhidastuvuus, joka ballistisessa approksimaatiossa ei riipu ballistisesta kertoimesta); paluun leveysaste ja suunta on oletettu; lämmitystä, lämpökuormaa ja laskeutumispistettä ei tarkisteta sitä vasten; pistemassa vakio-C_D:llä, ei 6-DoF.

seg-5bd3882531b6 = Pysähtymispisteen konvektiivinen paluulämmitys (Sutton-Graves) 3-DoF-paluulla

seg-4f97036ed72f = Pysähtymispisteen konvektiivinen lämpövuo q = k sqrt(rho/R_n) V^{ "3" } Sutton-Graves-vakioilla Maan ilmalle ja Marsin ilmakehälle (NASA TR R-376, { "1971" }), sen huippu ja integroitu lämpökuorma 3-DoF-paluulla pitkin, ballistisella tai nostavalla vakiokallistuksella, Maassa tai Marsissa.

seg-5a203ecfeaee = Sisäinen johdonmukaisuus: relaatio ja vakiot sellaisina kuin ne on painettu julkaisussa NASA TR R-376, puoliaskelkonvergenssitarkistus ja lämmitys- ja hidastuvuushuippujen odotettu järjestys. MITÄ EI: mitään julkaistua lämmitysarvoa ei ole verrattu (Stardust-julkaisut antavat suunnitteluraja-arvon ja konvektiivis-säteilevän arvion noin { "1200" } W/cm2, johon pelkkä konvektiivinen relaatio ei voi yltää); ei säteilylämmitystä, seinälämpötila- tai katalyyttisyyskorjausta eikä lämpösuojan vastetta.

seg-1b96577665fc = Sähköoptisen kuvantimen radiometria, MTF, suhteellinen reunavaste ja GIQE { "4" } NIIRS

seg-38902593e841 = Nadir-kuvantimen signaali-kohinabudjetti (Lambert-kohtauksen radianssi, kameran yhtälö, laukaus-, pimeä-, luku- ja kvantisointikohina), järjestelmän MTF Nyquistissa esteettömän aukon diffraktion, ilmaisimen aukon, lineaarisen smearin ja Gaussin jitterin tulona, tästä MTF:stä integroitu reunavaste ja suhteellinen reunavaste, Q = lambda F / p sekä GIQE:n versio { "4" } NIIRS ilman MTF-kompensaatiota. Ajettavissa skenaariotyyppinä <c1/>.

seg-bb3a01edc95d = Suljetut muodot: diffraktio-MTF puolikatkotaajuudella, puhtaan ilmaisinaukon yhden pikselin ramppireuna (RER { "1" }), Gaussin sumennuksen normaali-CDF-reuna (RER = erf(0.5/(sigma sqrt { "2" }))), laukauskohinan skaalaus ja GIQE-kertoimet (versio { "4" }) julkaistuina (Leachtenauer ym., Applied Optics { "36" }({ "32" }), { "1997" }). MITÄ EI: ulkoista kuvainta, mitattua MTF:ää tai arvioitua kuvaa ei ole verrattu; GIQE on empiirinen regressio omalla virheellään; ei hajavaloa, ilmakehän MTF:ää, MTF-kompensaatiota eikä aliasoitumista.

seg-07ca77a67207 = Laukaisun nousuvaiheen painovoima-, ilmanvastus-, ohjaus- ja vastapainehäviöt

seg-7a1802cf2c80 = Monivaiheisen kantoraketin tasomainen painovoimakäännöksellinen nousu ei-pyörivän pallomaisen Maan yli US Standard Atmosphere -mallin ({ "1976" }) läpi (tiheys ja paine), pitch-potkulla, suuttimen vastapaineen vähentämällä työntövoimalla, vaiheiden loppuun palamisilla tarkoilla askelrajoilla sekä painovoima-, ilmanvastus-, ohjaus- ja vastapainehäviöillä integroituna tilan rinnalla. Ajettavissa skenaariotyyppinä <c1/>.

seg-174ed29adbbe = Sisäinen johdonmukaisuus: tarkka identiteetti loppuun palamisnopeus = summa Isp g0 ln(m0/mf) miinus neljä integroitua häviötä (jäännös alle { "1e-6" } m/s), Tsiolkovskin yhtälö pystysuoralla tyhjiöpoltolla, jossa painovoima on ainoa häviö, sekä US76:n merenpinnan ja tropopaussin paineet. MITÄ EI: minkään julkaistun kantoraketin häviöitä ei ole verrattu; ei Maan pyörimistä, vapaata lentoa (coast), kaasutuksen säätöä eikä ohjausta potkun lisäksi; vakio-C_D; ei lentoratojen optimoija.

seg-55e8345def8b = TWSTFT-kaksisuuntainen yhtälö, epävarmuusbudjetti ja linkin vakaus flicker- ja vuorokautisella epäresiprookkisuudella

seg-5ca5226c24ec = TWSTFT-kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B aseman lähetys- ja vastaanottoviiveillä, Ku-kaistan ionosfäärin ylös/alas-epäsymmetrialla, transponderin viive-erolla ja Sagnac-termeillä, tarkkaa suoraa mallia vasten; neliöllinen epävarmuusbudjetti, jossa linkin TDEV on tyypin A termi; kaksisuuntainen sarja valkoisella ja flicker-vaihekohinalla (Kasdin–Walter), vuorokautinen epäresiprookkisuus ja vakioresiprookkisuusjäännös; sekä toimitettujen Circular T-, MJD-CSV- tai IGS RINEX -asemakellosarjojen nopeus, jäännös-RMS, TDEV ja ADEV. Ajettavissa skenaariotyyppinä <c1/>.

seg-244f7396ac25 = Sisäinen johdonmukaisuus: suora malli ja ratkaistu yhtälö täsmäävät toleranssilla { "1e-15" } s, Sagnac-termi on yhtä suuri kuin moduulin riippumaton silmukkamuoto BIPM 2A omega/c^{ "2" }, ionosfäärin termi on { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, ja kohinaprosessit näyttävät odotetut TDEV-muotonsa. MITÄ EI: mitään todellista TWSTFT-mittausta tai kalibrointiraporttia ei ole verrattu; ilmoitetut viiveet ja epävarmuudet ovat syötteitä, eivät mitattuja; toimitettujen sarjojen vakaudet raportoidaan, ei validoida.

seg-2f9be02c92bc = Optisen vinoreitin ilmakehän numeriikka: Rytov-varianssi, tuikinta, gamma-gamma-häipymätodennäköisyys, aukon keskiarvoistus, pilven ja kirkkaan ilman optinen syvyys

seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integroituna vinoreittiä pitkin tasoaallon ja pallo-aallon Rytov-varianssille (ylä- ja alalinkki), Andrews–Phillips-tuikintaindeksille ja gamma-gamma-parametreille, gamma-gamma-häipymätodennäköisyydelle ja häipymävaralle, heikon turbulenssin aukon keskiarvoistuskertoimelle, nestemäisen veden pylvään pilven optiselle syvyydelle ja Kim-näkyvyyden sekä Rayleigh-kirkkaan ilman optiselle syvyydelle, korvaten optisen linkkibudjetin kasatun ilmakehähäviön, kun ilmakehä on annettu. Ajettavissa skenaariotyypin sisällä (<c1/>).

seg-7ca512adff99 = Numeriikkaa verrataan riippumattomaan ohjelmaan (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } tarkkuudella { "30" } numeroa, tanh-sinh-kvadratuuri alkuperäisellä korkeusmuuttujalla ja Bessel-K gamma-gamma-tiheyksillä), joka ei jaa koodia Kshanan kanssa, kynnyksillä, jotka on asetettu ennen kuin mitään toteutusta oli olemassa (xval/optical-atmosphere/PREREGISTRATION.md). MIKSI MODELLED: tämä oraakkeli evaluoi samat julkaistut kaavat, joten se tarkistaa ilmoitettujen kaavojen toteutuksen eikä ilmakehää; mitään ITU-R-validointiesimerkkiä ja mitattua tuikinta- tai vinoreittivaimennustallennetta ei käytetä (ITU-arvot ovat avoin lisenssipäätös ja pidetään poissa repositoriosta). Cn2-profiilin taso, näkyvyys, aerosolin ja molekyylien skaalakorkeudet, aukon keskiarvoistuksen reitin pituus ja momenttisovitus, jolla aukon keskiarvoistus sovelletaan gamma-gamma-parametreihin, ovat ilmoitettuja syötteitä tai konventioita. Moduulin lähderivi kirjaa, että yksi laajasti kopioitu katsaus tulostaa toisen tuikintaeksponentin muodossa 7/6, kun Andrews ja Phillips antavat 5/6; muoto 5/6 on toteutettu

seg-a2faab92e760 = Säästä riippuva optisen maa-aseman saatavuus ja etäisyyskorreloitu asemadiversiteetti

seg-7f4e4e763d62 = Optisen linkin saatavuus ilmoitettua linkkivarausta vasten log-normaalista pilven nestevesi-ilmastosta (ITU-R P.840 -määrä, geometrisen optiikan vaimennus) ja riippumattomasta gamma-gamma-turbulenssihäipymästä, tavoitesaatavuuksiin tarvittava linkkivara ja katto, jota mikään vara ei nosta, log-normaalit katkon kestot, parannustekniikoiden mitä-jos-tarkastelut sekä yhden tekijän Gaussin kopula-verkkosaatavuus, jonka parikorrelaatio on exp(-etäisyys/dekorrelaatiopituus). Ajettavissa skenaariotyyppinä <c1/>.

seg-20eab6e9b925 = Sisäinen johdonmukaisuus: diversiteettimallin suljetun muodon rajat ja monotonisuus, pilvikaton suljettu muoto ja log-normaalit katkoidentiteetit. EI väitetä ulkoista oraakkelia eikä sellaista ole verrattu: mitään mitattua optisen maa-aseman saatavuutta tai pilvettömän näköyhteyden tallennetta ei käytetä. MIKSI MODELLED: pilvi-ilmasto (pilven todennäköisyys, nestevesipylvään mediaani ja hajonta, katkojen kestot), pilven ja turbulenssin riippumattomuus, Gaussin kopulan muoto, dekorrelaatiopituus ja jokainen tekniikkahyöty ovat oletuksia; mukana toimitetut skenaariot ilmoittavat ILLUSTRATIVE-ilmastoja, eivät aineistoa. Tämän rivin ylentäminen vaatii siteeratun mitatun saatavuustallenteen ja kynnyksen, joka on rekisteröity ennen vertailua

seg-043ece801e72 = Ajoituksen ja etäisyysmittauksen jatkuvuus optisten katkojen läpi

seg-bb9cb3fe4180 = Optisen aseman katkon kestojakauma kytkettynä holdover-mallin suljetun muodon vapaa-ajovarianssiin: ajoitus- ja etäisyysmittausvirhe ilmoitetuilla katkokvantiileilla, holdover ajoituskynnykseen asti, katkojen ja katkoajan osuus, joka jää sen sisään, sekä ajoitussaatavuus A + U E[min(D, T_h)]/E[D], klassisille ja kvanttikelloluokille. Ajettavissa skenaariotyypin sisällä (<c1/>).

seg-ab2a33c1b1a4 = Sisäinen johdonmukaisuus holdover-moduulin kanssa, bitti bitiltä; EI väitetä ulkoista oraakkelia. Luokkien PSD:t ovat synteettisiä pitkän tau:n lattioita, jotka holdover-moduuli jo sisältää, joten luvut perivät sen ilmoitetun varauksen, että holdover tiukkaan kynnykseen asti määräytyy oletetun punaisen kohinan lattian eikä siteeratun Allanin poikkeaman mukaan. Katkojen kestot ovat log-normaali malli ilmoitetuilla parametreilla, ei mitattu pilvessäoloaikojen tallenne

seg-b119df65d2a7 = Optisen linkin vara ajan funktiona: yksi siemenluvulla ajettu aseman sään realisaatio

seg-06125f3cae90 = Valinnainen taulukko <c1/> (kesto, askel, siemenluku) saa skenaariotyypin <c2/> kirjoittamaan myös kullekin asemalle yhden siemenluvulla ajetun realisaation ilmoitetusta asemamallista ajan yli: pilvijaksot (kirkkaat jaksot eksponentiaalisia, pilvikatkot log-normaaleja ilmoitetulla keskiarvolla ja hajonnalla, pilvessä vietetty aikaosuus asetettu ilmoitettuun pilven todennäköisyyteen), yksi log-normaali nestevesipylväs per pilvijakso, yksi gamma-gamma-tuikintanäyte per askel, ja niistä linkkivara, pilvi- ja tuikintahäipymät ja linkki ylhäällä -lippu, sekä toteutunut saatavuus, pilviosuus, katkojen lukumäärä ja pisin katko. Ilman taulukkoa tulos on asiakirja versiosta { "0.37" }. Arvonnat kulkevat siirrettävien jakauma- ja matematiikkareittien kautta, joten natiivi ja wasm32 antavat samat tavut.

seg-d25e5d2449bd = Vain sisäinen johdonmukaisuus; EI väitetä ulkoista oraakkelia, eikä sellaista ole säärealisaatiolle. Tarkistukset vertaavat yhtä arvontaa saman mallin tilastolliseen tulosteeseen, joten läpäisy kertoo, että generaattori ottaa näytteitä ilmoitetuista jakaumista (arvonnan saatavuus ja pilviosuus ovat ennakkorekisteröityjen toleranssien sisällä ilmoitetuista luvuista), ei että mikään todellinen asema käyttäytyy niin. Sarja on yksi realisaatio, ei ilmasto: sen saatavuus eroaa ilmoitetusta arvonnan otantavirheen verran, ja eri askelten tuikintanäytteet ovat riippumattomia, mikä on ilmoitettu yksinkertaistus prosessista, joka dekorreloituu millisekunneissa. Sääsyötteet pysyvät skenaarion oletuksina.

seg-58cbf576c959 = TRK-2-18 Orbit Data File -lukija ja Marsin rampitettu 2-suuntainen Doppler-malli

seg-d1055650a77f = DSN:n Orbit Data File -tiedostojen (TRK-2-18) lukija: 36-tavun tietueryhmät (tiedostotunniste, tunniste, ratadata, asemakohtaiset rampit, kellopoikkeamat, yhteenveto, tiedoston loppu) ja kussakin ratadatatietueessa aikaleima alkaen vuodesta { "1950" }, alalinkin ja ylälinkin viiveet, havaintosuure, asemat, datatyyppi, kaistat, voimassaolo, kanava, avaruusalus, 46-bittinen viitetaajuus ja pakkausaika; rampin alku- ja loppuajat, nopeudet ja alkutaajuudet. Sen päälle rampitettu 2-suuntainen X-kaistan Doppler-malli (integroidut ylälinkin rampit, kiertomatkan valoaika Shapiron ja troposfäärin kera, DSN-asemat IAU 2006/2000A CIO -ketjun ja IERS EOP:n kautta, asema-aika) ja Marsin kiertoradan eräradanmääritys (GMM-3-kenttä, kolmannet kappaleet, SRP, ilmanvastus).

seg-6d533149f6f0 = PDS3-tunniste, jonka DSN:n navigoinnin datan esikäsittelyprosessi tuotti tiedoston mukana (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), tarkistettuna kynnyksiä vasten, jotka on ennakkorekisteröity tiedostossa xval/mro-odf/PREREGISTRATION.md ennen lukijan olemassaoloa. MODELLED, koska yksi rekisteröity kynnys (tiedoston loppu -taulukon rivit, { "121" } tiedostossa ja { "120" } tunnisteessa) ei täyttynyt; tunniste on siinä sisäisesti ristiriitainen. Vaihe { "2" } (xval/mro-od/PREREGISTRATION.md, muutokset A1 ja A2 ennen pisteytettyä tulosta): MRO:n navigointitiimin rekonstruktiosta (mro_psp5, NAIF) ennustettu Doppler vastaa havaittua rampitettua 2-suuntaista Dopplera tarkkuudella { "12.5" } mHz kehityksessä käyttämättömillä ohituksilla, kynnys täyttyi; rekisteröity ratamääritys epäonnistui pisteytetyllä kaarella (normaalimatriisi ei positiivisesti definiitti) eikä tuottanut rataa, joten ratakynnykset eivät täyttyneet. Ajo { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, vaimennettu estimaattori, sama kaari ja kynnykset, pisteytysmuutos R2-A1 ilmoitettu tiedostossa docs/revisions) suppeni: estimoidun radan poikkeama rekonstruktiosta on { "0.36" } km RMS ({ "0.53" } km maksimi), kynnykset täyttyivät, mutta jälkisovituksen Doppler-RMS on { "48.6" } mHz kynnystä { "30" } mHz vastaan, ei täyttynyt, joten rivi pysyy MODELLED. MITÄ EI: yksikään estimoitu rata ei ole täyttänyt kaikkia rekisteröityjä kynnyksiä; ionosfääriä, aurinkoplasmaa ja suurinta osaa antennin offsetista (säteittäinen offset { "1.5" } m sovitetaan kehitysohitukseen) ei mallinneta.

seg-c7d292f14693 = Suljetun silmukan MRP-takaisinkytkentäinen asennonohjaus reaktiopyörillä

seg-f33781b74cc2 = Jäykän hubin inertiaalinen asennonosoituksen ohjaus kolmella tai useammalla tasapainotetulla reaktiopyörällä: MRP-takaisinkytkentälaki L_r = -K sigma_BR - P omega_BR (Schaub ja Junkins), miniminormin pyörän moottorimomentit G_s u = -L_r rajattuna kunkin pyörän rajaan, kytketty hubin ja pyörien dynamiikka, jossa hubin inertia kantaa pyörien spin-inertian, kvaternionikinematiikka, RK4 nollannen asteen pidolla. Ajettavissa skenaariotyyppinä <c1/> (todellisen tilan silmukka).

seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; bsk-pyöräajo erillisenä työkaluna, ei koskaan linkitetty eikä vendoroitu): avaruusaluksen hubi, reactionWheelStateEffector (BalancedWheels, vääntömomenttiraja päällä), simpleNav, inertial3D, attTrackingError, mrpFeedback (ei integraalitermiä) ja rwMotorTorque arvolla dt = { "0.1" } s omalla RK4:llään, Kshanan omaa toteutusta vastaan kolmella tapauksella (kolme ortogonaalista pyörää; neljän pyörän pyramidi; saturoituva neljän pyörän tapaus), kynnykset ennakkorekisteröity tiedostossa xval/aocs-basilisk/PREREGISTRATION.md ennen koodia ja ajoa. Kaikki kynnykset täyttyivät ensimmäisellä ajolla. MITÄ EI: anturikohina silmukassa, integraalitakaisinkytkentä, seurantaohjaus, pyörän kitka, jitter, nopeusrajat ja teho, minkään todellisen avaruusaluksen vahvistukset; vertailu tarkistaa lain ja dynamiikan toteutuksen riippumatonta toteutusta vastaan, ei lentoohjainta.

seg-455dc946c965 = Multiplikatiivinen EKF-asennonestimointi gyrosta ja tähtiseurantalaitteesta

seg-553d043438b4 = Lefferts–Markley–Shuster-multiplikatiivinen EKF: kappalekoordinaatiston asentovirhe- ja gyron bias-tilat, propagointi gyron nopeudella vähennettynä biasestimaatilla ja Farrenkopfin diskreetillä prosessikohinalla (kulma- ja nopeussatunnaiskävely), tähtiseurantalaitteen päivitykset residuaalilla { "2" } vec(q^-1 q_st) Joseph-muodossa ja multiplikatiivinen nollaus; Farrenkopfin diskreetti gyro- ja tähtiseurantalaitesimulaattori. Skenaariotyyppi <c1/> voi sulkea ohjaussilmukan oman estimaattinsa varaan.

seg-846cb1eeb35c = Sisäinen johdonmukaisuus: suodattimen normalisoitu estimointivirheen neliö totuutta vastaan, joka on simuloitu samoista anturimalleista Monte Carlo -siemenluvuilla, sekä asennon ja biasin estimaattien suppeneminen. MITÄ EI: ulkoista estimaattoria tai lentodataa ei ole verrattu (Basilisk { "2.9.1" } ei sisällä MEKF-moduulia); anturimallit ovat oppikirjamalleja, ilman virheasentoa, skaalauskerrointa tai tähtiseurantalaitteen näkökentän vaikutuksia.

seg-059732bda693 = Wahba/TRIAD/QUEST-asennonmääritys

seg-3ee6e56d790f = Optimaalinen kolmiakselinen asento painotetuista vektorihavainnoista (tähti/aurinko/magnetometrisuunnat): deterministinen kahden vektorin TRIAD, Davenportin q-menetelmä (tarkka Wahba-häviön minimoija — optimaalinen kvaternioni on { "4" }×{ "4" } Davenportin matriisin K suurimman ominaisarvon ominaisvektori, ratkaistuna symmetrisellä Jacobin ominaisarvoratkaisulla) ja QUEST (K:n karakteristisen yhtälön Newton/sekantti-juuri, aloitettuna painojen summasta Σ, sitten Gibbs-vektorikvaternionin palautus)

seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen ym., Nature Methods { "2020" }) — Wahban ongelman Kabsch/Markley-SVD-ratkaisu, aidosti riippumaton algoritmi (asenneprofiilimatriisin SVD) ja koodikanta verrattuna kshanan Davenport-K-ominaisarvoratkaisuun / QUEST-karakteristisen juuren menetelmään, ja se laskee SAMAN yksikäsitteisesti määritellyn Wahba-optimaalisen asennon. Kohinattomilla painotetuilla vektorihavaintojoukoilla TRIAD, q-menetelmä ja QUEST toistavat scipyn optimaalisen rotaation toleranssilla <{ "1e-9" } rad (vertailtuna etumerkki-invariantin asentovirhekulman kautta). Kohinainen Monte Carlo -tilastollinen väite ”optimaalinen voittaa TRIADin” pysyy MODELLED (ei ulkoista oraakkelia); vain pistesuunta-yksikkövektorihavainnot — ei anturin näkökentän/biasin/ajallisen korrelaation mallinnusta, ja QUEST on singulaarinen kulmassa { "180" }° (q-menetelmä kattaa tapauksen)

seg-cd342cc48afc = GNSS-neliölakisen sieppauksen havaitsemistunnusluvut

seg-6d97452de33e = Neliölakinen (epäkoherentti) sieppausilmaisin koodivaihe × Doppler -haun yli: väärän hälytyksen todennäköisyys (keskeinen χ² vapausasteilla 2M), tavoite-P_fa:n saavuttava kynnys (χ²-CDF käännetty bisektiolla) ja havaitsemistodennäköisyys (ei-keskeinen χ² epäkeskeisyysparametrilla 2M·ρ solukohtaiselle korrelaation jälkeiselle SNR:lle ρ), yleistetyllä Marcum Q -funktiolla Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — riippumaton algoritmi (jatkuvamurtolukuinen ei-keskeinen/keskeinen χ²) verrattuna kshanan epätäydellisen gammafunktion sarjaan (raim::chi2_cdf / noncentral_chi2_cdf), ja se laskee saman yksikäsitteisesti määritellyn havaitsemistunnuslukujen YTIMEN: yleistetyn Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), havaitsemistodennäköisyyden P_d, väärän hälytyksen todennäköisyyden P_fa ja käänteisen P_fa→kynnys, täsmäten tarkkuudella ~{ "1e-6" } — sama riippumattomuuden perusta kuin validoidulla rivillä ”RAIM/ARAIM-eheyden tilastollinen ydin”. VAIN YTIMEN: solukohtainen CFAR-solukeskiarvo ja koodi/Doppler-binin ylittämishäviö pysyvät MODELLED

seg-77f425a38aa2 = GNSS-kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu (LAMBDA)

seg-410ce8b6cebf = Kokonaislukuepävarmuuden kiinnitys pienimmän neliösumman kokonaislukumenetelmällä LAMBDA-tapaan: tilavuutta säilyttävä kokonaislukuinen (Z) dekorrelaatiomuunnos (L D Lᵀ-tekijän integer-Gauss-kokoreduktio) + tarkka Schnorr–Euchner-syvyyssuuntainen branch-and-bound-kokonaislukuhaku pienimmällä neliösummalla, ja kahden parhaan ehdokkaan suhdetesti (validoitu väite); sekä suljetun muodon bootstrapattu onnistumisaste P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), joka tarkistetaan vain sisäisesti ja on validoidun väitteen ulkopuolella

seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (sen lähdetiedosto lambda.c, T. Takasu, BSD-2-Clause), riippumaton LAMBDA-reduktio ja MLAMBDA-haku käännettynä C:stä ja ajettuna työkaluna, { "300" } satunnaiskovarianssilla (n { "2" }–{ "10" }): kokonaislukujen pienimmällä neliösummalla on yksikäsitteinen minimoija, joten kiinnitettyjen kokonaislukujen on oltava identtiset ({ "0" } eroavuutta) ja kaksi parasta neliönormia, jotka syöttävät suhdetestiä, täsmäävät suhteellisella toleranssilla { "1e-9" } (mitattu { "5.6e-13" }); toleranssi asetettu ennen vertailua. Validoitu väite: ILS-ratkaisu ja sen kaksi parasta normia. RTKLIB ei laske bootstrapattua onnistumisastetta, joka pysyy tarkistettuna sisäisesti Monte Carlo -simulaatiota vastaan pyöristysprosessista; Z-muunnoksen invariantit ja raakaenumeraatio säilyvät tukevina tarkistuksina. Vain integer-Gauss-dekorrelaatio (täyden LAMBDA-reduktion uudelleenjärjestelypermutaatiot nopeuttavat hakua mutta eivät muuta tarkkaa ILS-vastausta eivätkä bootstrapattua astetta)

seg-4ad1ec05610f = B-tasokohdistus ja patched-conic-painovoima-avusteinen lento

seg-d249aea7c3ea = Hyperbolisen ohilennon geometria (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, kääntökulma δ={ "2" }·asin(1/e), törmäysparametri |B|=|a|·√(e²−{ "1" })), B-tason Ŝ/T̂/R̂-tähtäyspistekoordinaatisto ja B·T̂/B·R̂-hajotelma, sekä patched-conic-painovoima-apu (v∞-suuruus säilyy, suunta taipuu kulman δ verran, heliosentrinen Δv={ "2" }·v∞·sin(δ/2) ilman ponneainekustannusta) Tisserandin parametrilla T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

seg-1ec7b0d8a32c = GMAT R2026a (Apache-2.0, ajettu erillisenä ohjelmana) { "192" } hyperbolisella Maan tilalla: B.T, B.R ja |B| toleranssilla { "1e-6" } km (pahin { "1.35e-8" } km), kääntökulma ja molemmat asymptootit toleranssilla { "1e-9" } rad (pahin { "9.3e-15" } rad); avun nopeusmuutos GMAT:n C3:sta ja asymptooteista toleranssilla { "1e-9" } v_inf (pahin { "5.6e-14" }); heliosentrinen SMA, ECC ja INC { "350" } Aurinko-keskisellä tilalla ennen ja jälkeen avun suhteellisella toleranssilla { "1e-9" } ja { "1e-12" } rad (pahimmat { "2.2e-14" } ja { "4.1e-14" } rad); Tisserandin parametri sbpy { "0.6.0" } (BSD-3) vastaan GMAT-elementeillä toleranssilla { "1e-9" } (pahin { "1.3e-15" }) ja lauseketta { "3" } - C3/v_c^{ "2" } vastaan ({ "8.9e-16" }); sekä Tisserandin suljettu muoto Kasugan ja Jewittin ({ "2019" }) taulukkoa { "8.1" } vastaan { "12" } kohteelle painetun pyöristysrajan sisällä (pahin { "0.39" } rajasta; P1 julkaistu työstetty arvo). Ennakkorekisteröity (436293bf; heliosentrinen korjaus 6fd9f5e6); muutos 374c806b, kirjoitettu oraakkelitiedostojen generoinnin jälkeen ja ennen yhtäkään Kshanan arvoa, laajensi inklinaation syötesuodattimen arvosta { "1e-2" } arvoon { "1e-3" } rad, säilyttäen enemmän ja huonommin ehdollisia tiloja. Rajaus (MODELLED): patched-conic kahden kappaleen ohilento ympyräratainen planeettaradalla, ei vaikutuspiirin siirtymää, kohtaamishäiriöitä eikä efemeridiä

seg-8e82da17a463 = CRPA-häiriönestoryhmän keilanmuodostus

seg-1744f527b4d1 = Kontrolloidun vastaanottokuvion antennin nollaus: kompleksiset ryhmän ohjausvektorit a(û)=exp(j·k·pₙ·û), deterministinen nollaohjaus (yksikkövahvistus kohti SV:tä, tarkat nollat kohti enintään N−{ "1" } häirintälaitetta minimi-normi-ratkaisulla w=Aᴴ(AAᴴ)⁻¹b) ja MVDR-adaptiiviset painot w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv), jotka ohjaavat syvät nollat itse voimakkaisiin häiriölähteisiin (alusta asti kirjoitetulla kompleksisella lineaarialgebraytimellä)

seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK zgesv -kompleksiratkaisu) — riippumaton lineaarialgebrakoodikanta verrattuna kshanan alusta kirjoitettuun kompleksiytimeen, ja se laskee SAMAT yksikäsitteisesti määritellyt painot: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) ja minimi-normi-nollaohjaus w=Aᴴ(AAᴴ)⁻¹b, sekä tuloksena olevat ryhmävasteen vahvistukset, täsmäten tarkkuudella ~{ "1e-9" } — sama oraakkeliluokka kuin validoiduilla DOP- (gnss_lib_py) ja Fisher-informaatio- (numpy) riveillä. MODELLED kapeakaistainen kaukokenttäryhmä identtisillä isotrooppisilla elementeillä — ei keskinäistä kytkeytymistä, elementtikohtaista epäsuhtaa, äärellistä kaistanleveyttä (STAP) eikä ohjausvektorin estimointivirhettä

seg-f2c973f14d52 = IEEE-1139-potenssilakikellokohina + flicker-FM-lattia

seg-4a0159558671 = Viiden kertoimen IEEE-1139 PSD↔Allan-varianssi-muunnos S_y(f)=Σh_α f^α → σ_y²(τ) (valkoinen/flicker-PM, valkoinen/flicker/satunnaiskävely-FM), flicker-FM-lattia σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) ensiluokkaisena sovitettavana termina, ja ei-negatiivinen FM-perheen sovitus kannassa { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }, joka palauttaa lattian, jota ajelehtimiskanta { "{" }1/τ,τ,τ³{ "}" } ei voi esittää

seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; Kasdinin & Walterin { "1992" } / Vernotten { "2015" } kertoimet) — riippumaton kolmannen osapuolen koodikanta ja viittausjuuret, jotka laskevat SAMAN yksikäsitteisesti määritellyn IEEE-1139 PSD→Allan-muunnoksen σ_y(τ) kullekin viidelle potenssilakikohinatyypille. kshanan powerlaw::allan_deviation täsmää allantoolsin suljettuihin muotoihin (valkoinen/flicker-FM, RW-FM ja valkoinen PM suhteellisella toleranssilla <{ "5e-9" }; flicker-PM tarkkuudella ~{ "1e-5" } — aito riippumattomuussignaali, kun kshana käyttää NIST-SP-1065-taulukoitua vakiota { "1.038" } ja allantools täyttä 3γ−ln2), ja flicker-FM-lattia √({ "2" } ln2·h_{ "{" }-1{ "}" }) täsmää allantoolsin kanssa koko τ-portaikon yli — sama kynnys, jonka validoidut MDEV/TDEV/Theo1/MTIE-rivit täyttävät. MODELLED stationaarinen potenssilakimalli — ei determinististä ajelehtimis- (τ²) termiä; laitekohtaiset kertoimet / mitatut lattiat pysyvät mallinnettuina

seg-cc1ac065e684 = CCSDS OEM -kovarianssilohkon tiedonvaihto

seg-ec4d44e7cf78 = Sarjallistaa ja jäsentää CCSDS { "502.0" } OEM COVARIANCE_START…COVARIANCE_STOP -lohkon — { "6" }×{ "6" } paikka/nopeus-kovarianssin kirjoitettuna sen 21-alkioisena alakolmiona (kanoninen CX_X … CZ_DOT_Z_DOT-järjestys) valinnaisella COV_REF_FRAME-kentällä, täydentäen olemassa olevaa OEM-tilavektorin kirjoitinta/jäsennintä, jotta radanmääritys- ja suodinkovarianssit kiertävät edestakaisin standardimuodossa

seg-891b86506bf6 = oem { "0.4.5" } (MIT, https://pypi.org/project/oem/) — SAMA riippumaton CCSDS-502-jäsennin, johon validoitu rivi ”CCSDS OEM -yhteentoimivuus” luottaa, täysin erillinen koodikanta (oma KVN-tokenisoija, kovarianssiosion tilakone ja numpy-matriisikokoonpano). kshana emittoi täyden OEM-segmentin, joka kantaa sen merkitsemättömän paljasnumeroisen alakolmio-COVARIANCE-lohkon; oem jäsentää sen ja rekonstruoi symmetrisen matriisin { "6" }×{ "6" }, täsmäten kshanan syötekovarianssiin alkio alkiolta f64-pyöristysvirheen tarkkuudella — aito kirjasto vs. kirjasto -tiedonvaihdon edestakainen kierto (verrattuna oemin rekonstruktioon, ei kshana-uudelleenjäsennykseen), sulkien rivin aiemman ”ei kolmannen osapuolen fixturea” -aukon

seg-ae061c7f082c = INS/TRN-vapaalentovirheen kasvu ja kynnysylitykset

seg-7bacdc8aa0d8 = Paikkavirhe vs. vapaalennon kesto -budjetti, joka on rakennettu IMU-kertoimista, kukin virhelähde (kiihtyvyysanturin bias, gyron bias, nopeuden satunnaiskävely, kulman satunnaiskävely, skaalauskerroin risteilyssä ja jatkuvan ominaisvoiman alla) propagoituna yhdeksän tilan paikallisen tason INS-virhemallin läpi Schuler-takaisinkytkennällä (inertial::coast::ErrorDynamics Grovesin 2. painoksen luvun { "14" } mukaan: asento-, nopeus- ja paikkavirheet, pystykanava painovoimagradienttineen, WGS-84-säteet ja normaalipainovoima, pohjoiseen suuntautuva vaakatasoalusta konfiguroidulla nopeudella, latitude_deg ja height_m; systemaattiset termit augmentoidulla matriisieksponentilla, satunnaiskävelyt Van Loanilla), litteän Maan monomit säilytettynä vain nimellä leading_order_m; osuudet yhdistettynä ilmoitetulla säännöllä (rss / linear-sum / deterministic-sum-with-stochastic-rss); vapaalennon kestot, jotka saavuttavat kutsujan antamat paikkakynnykset (oletuksena { "10" } m ja { "50" } m) paikannettuna eteenpäin kulkevalla haulla ensimmäiseen ylitykseen (first_crossing_s, koska Schuler-rajatut käyrät eivät ole monotonisia), ja hallitseva lähde kussakin ylityksessä; sekä TRN-rajattu moodi, joka antaa suurimman maastopaikannusvälin, joka pitää kunkin kynnyksen. Ajettavissa skenaariotyyppinä <c1/>

seg-622af0bd27de = NaveGo v1.4 (commit 24d9488, LGPL-3.0), ajettu erillisenä ohjelmana GNU Octave { "8.4.0" } -ympäristössä: vapaa-inertiaaliset vapaalentoajot samalla IMU-virheprofiililla, yhdellä korjatulla numeerisella kuolleella kaistalla sen kvaternioniupdatessa (qua_update.m: kynnysehto nopeudelle alle { "1e-8" } rad/s korvattu lausekkeella wnorm == { "0" }, sovellettu ajonaikaiseen kopioon ja varmistettu täsmäämään kerran; kynnysehdon ollessa paikallaan hitaasti ajelehtiva alustan asento jäätyi ja katkaisi Schuler-takaisinkytkennän). Ennakkorekisteröity (4262b969) korjatulla generaattorilla ennen sen ajoa; moottori (440b3877) sitoutettiin ennen kuin yhtään korjattua tulostetta avattiin; sama kynnys { "5" } %, { "48" } pistettä, termit, siemenluvut ja tunnusluku kuin kierroksella { "1" }. Tulos: 48/48 täyttää kynnyksen { "5" } % (pahin +{ "3.70" } % nopeuden satunnaiskävely kohdassa { "1200" } s, +{ "3.33" } % kulman satunnaiskävely kohdassa { "1800" } s); kohdassa { "3600" } s NaveGo/Kshana antavat 2375.4/2376.2 m kiihtyvyysanturin biasille ja { "130" } 885/131 { "675" } m gyron biasille. Schuler-kuljetusnopeustakaisinkytkennän nollaaminen epäonnistuttaa testin (+{ "695" } % kohdassa { "3600" } s). Ilmoitettu: yksikanavaiset Schuler-ennusteet ja kierroksen 1 NaveGo-arvot olivat tiedossa; mallissa ei ole sovitettua parametria. Rajaus: termikohtaiset virhekäyrät taktisen luokan IMU:lla, { "45" } deg N, vaakatasossa ja pohjoiseen suunnattuna, enintään { "3600" } s; ylitykset, yhdistämissääntö ja TRN-moodi ovat näiden käyrien deterministisiä funktioita. IMU-luokan kertoimet (Grovesin { "2013" } taulukon { "4.1" } kaistaluvut) ja TRN-paikannusjäännös pysyvät syötteinä tilassa MODELLED. Kierros { "1" } (korvattu): litteän Maan monomit, nyt leading_order_m, yliarvioivat yli { "600" } s (2.2x–8x tunnin kohdalla). { "0.30" } revisio: jokainen ins-trn-coast-tulos muuttuu (mukana toimitettu skenaarion TRN-huippu { "52.932679" } -> { "44.711834" } m)

seg-a971ff07592a = Aukon navigointi vs. viestintä -käyttöaste

seg-5b0ba97379bf = Yksi ajo ottaa kontaktisuunnitelman (aos_s/los_s-ikkunoiden luettelo, jossa kukin pyytää aukkoa navigointiin tai viestintään — sama ikkunasanasto, jonka <c1/> tuottaa, muunnettuna funktiolla <c2/>), aukkojen lukumäärän ja eksplisiittisen välitysperiaatteen, ja palauttaa navigointikäyttöasteen, viestintäkäyttöasteen, joutokäyttöasteen ja istuntokohtaisen katkon. Periaate on syöte dokumentoidulla oletuksella (<c3/>; myös <c4/> ja ei-keskeyttävä <c5/>), ja raportti kantaa ratkaistun periaatteen, sen täyden määritelmän sekä käyttöasteen ja katkon määritelmät, koska ilman välityssääntöään mainittu käyttöasteluku ei ole toistettavissa. Aikataulu on tarkka intervallipyyhkäisy ikkunarajojen yli, joten ikkuna, joka päättyy täsmälleen siihen, mihin seuraava alkaa, ei koskaan kilpaile, ja navigoinnin, viestinnän ja joutoaukon sekunnit kertyvät toisistaan riippumatta tässä yhdessä pyyhkäisyssä. Ajettavissa skenaariotyyppinä <c6/>

seg-656fd7d44a9e = Sisäinen johdonmukaisuus kolmesta suureesta, jotka lasketaan eri lausekkeilla samassa pyyhkäisyssä ja joiden sitten vaaditaan sulkeutuvan. Navigoinnin aukkosekunnit, viestinnän aukkosekunnit ja joutoaukkosekunnit kertyvät erikseen — joutoaukko lausekkeesta (aukot − |palveltu|) alkeisväliä kohti, ei koskaan jäännöksenä — ja niiden summa varmistetaan arvoa aukot × horizon_s vastaan, minkä väärin sidottu raja, kahdesti laskettu väli tai pudotettu väli rikkoo välittömästi; istuntokohtaisten palveluaikojen vaaditaan erikseen summautuvan takaisin kahteen palvelukokonaissummaan. Aikataulutuksen rakenteelliset ominaisuudet mitataan eikä oleteta: palveltu aika varmistetaan ei-vähenevänä aukkojen lukumäärässä { "200" } pseudosatunnaisen suunnitelman yli kaikille kolmelle periaatteelle (ei ilmeistä ei-keskeyttävälle periaatteelle, jossa ylimääräinen aukko muuttaa, kuka pitää mitäkin jokaisella myöhemmällä rajalla), ja rajalaskenta lukitaan koskettavaan/yhden sekunnin päällekkäisyyden pariin, jossa off-by-one muuten piiloutuisi. Ohitusennustinsilta tarkistetaan tulostetta <c1/> vastaan: yhdellä aukolla ja ilman kilpailevaa palvelua navigoinnin aukkosekunnit ovat yhtä suuret kuin ennustimen oma yhteenlaskettu ohituskesto. Ulkoista oraakkelia ei väitetä eikä sellaista ole: kyky korvaa käsilaskennan sen sijaan, että se tarkistettaisiin sitä vastaan, mukana toimitettu kontaktisuunnitelma on havainnollistava eikä lennetty, eikä mikään operatiivinen aikatauluttaja julkaise suunnitelma-plus-vastaus-paria välitysperiaate ilmoitettuna — määrittelemättömällä periaatteella laskettu käyttöaste ei ole vertailukelpoinen ilmoitetulla periaatteella lasketun kanssa, ja periaatteesta riippuvuus mitataan (navigointikäyttöasteet 100/150 vs. 50/150 identtisellä suunnitelmalla). Kääntö- ja vaihtoaika, datavolyymi, puskurin tila, energia ja linkin sulkeutuminen jätetään pois raportin otsakkeessa sen sijaan että ne mallinnettaisiin hiljaa

seg-43cd7aa7ab53 = Kuun pintanavigoinnin RF-häirintä (satelliittikohtainen J/S)

seg-e0566f37ad8f = Kuun-natiivi häirintä-signaalisuhde, efektiivinen C/N₀ ja lukituksen menetys selenografiselle pintakäyttäjälle Kuun pinnalla (tai korotetulla) olevan häirintälaitteen alla, havainnollistavan, julkisiin lähteisiin perustuvan Moonlight/LCNS-luokan satelliittitähdistön yli. Koostaa avoimen häirintäketjun (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) avoimen Kuun taivasgeometrian kanssa (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geometriaa tai radiometriaa ei johdeta uudelleen. Toisin kuin Maan skenaariotyypissä <c1/> signaalihaara ei ole kiinteä vastaanotettu teho: kunkin satelliitin isotrooppinen vastaanotettu teho on sen oma linkkibudjetti-EIRP − FSPL(vinoetäisyys), joten J/S vaihtelee satelliitista toiseen Kuun etäisyyden ja korkeuskulman mukaan. Emittoi YHDEN RIVIN JOKAISTA NÄKYVÄÄ (epookki, satelliitti) -LINKKIÄ kohti JSONina ja *.table.csv-artefaktina, ja molemmat vastaanotetut tehot, joiden erotus J/S on, tulostetaan sen rinnalle; yhteenvetolaatumittarit ovat taulukon vieressä, eivät sen tilalla. Ajettavissa skenaariotyyppinä <c2/>

seg-2a4393ae7c52 = Koostamisen ristiintarkistus riippumatonta repon sisäistä koodipolkua vastaan: jokainen linkkikohtainen J/S johdetaan uudelleen kahden linkkibudjetin erotuksena, jotka on laskettu funktiolla linkbudget::received_signal_power_dbw, jonka vapaan tilan häviö on yksittäinen lauseke { "20" }·log10(4πRf/c) eikä kolmen termin summa, jota jamming::free_space_path_loss_db käyttää — nämä täsmäävät toleranssilla < { "1e-9" } dB jokaisella rivillä (mitattu pahin tapaus { "7.11e-14" } dB, eli liukuluvun pyöristys). Taustalla oleva häiriöketju, jonka tämä koostaa, on erikseen ulkoisesti ankkuroitu tiedostossa tests/gnss_denied_jamming_resilience_reference.rs (riippumaton numpy/scipy-uudelleenjohto J/S:lle ja efektiiviselle C/N₀:lle, kiinnitetty lähteeseen Kaplan & Hegarty §{ "9.4" }, sekä JammerTest { "2024" } mitattu C/N₀, Zenodo 10.5281/zenodo.15910563); Kuun geometria, jonka se koostaa, on lunar_service/lunar-geometria omine oraakkeleineen. Täällä tarkistetut suljetun muodon identiteetit: puolitettu häirintälaitteen etäisyys lisää täsmälleen { "20" }·log10({ "2" }) dB jokaiselle riville; J/S on täsmälleen invariantti käyttäjäantennin boresight-vahvistukselle, kun taas C/N₀ liikkuu täsmälleen sen vahvistuksen verran; korkeuskulmamaski ei muuta yhtään säilyvää riviä bitti bitiltä. Rivi itse pysyy tasolla ReferenceImpl/mallinnettu: mitattua Kuun häirintäkampanjaa ei ole, jota vasten validoida, ja tähtistö on havainnollistava julkisiin lähteisiin perustuva Moonlight/LCNS-luokan geometria, ei lennetty efemeridi

seg-4c116e25c5c5 = Kuun kieltokontuuri epävarmuuskaistalla mitatusta C/N₀-hajonnasta

seg-77828c25f3ab = Raportti <c1/> ei enää perusta kieltokontuuriaan yhteen skalaariin. Se emittoi koko mitatun toivotun signaalin C/N₀-jakauman satelliittikohtaisen taulukon yli — n, min, p05, p25, mediaani, p75, p95, max, keskiarvo, otoshajonta ja otoksen oma epäsymmetria (p95 − mediaani) − (mediaani − p05) — rivikohtaisten rivien rinnalla, jotka ovat ennallaan. Kontuuri raportoidaan sitten kussakin näistä järjestystunnusluvuista MOLEMPIEN moottorin tunnistamien kieltokriteerien mukaan, ei koskaan toisen sijaan: vakiintunut tehosuhdekriteeri (J/S = { "30" } dB, sama kynnys, jota attack_surface ja tracking_loop käyttävät ja jonka varassa on julkaistun Kuun linkkihäirintätaulukon sarake <c2/>), ja lukituksen menetyksen kriteeri (efektiivinen C/N₀ putoaa tasolle tracking_threshold_dbhz), jolla tämän raportin oma links[].status-sarake pisteytetään. Kukin kontuuripiste annetaan kieltotason kummallakin akselilla — vaadittu häirintälaitteen EIRP skenaarion etäisyydellä ja kieltoetäisyys skenaarion EIRP:llä — joten kaista on väli samoilla akseleilla, joilla kontuurikuvaaja piirretään. Kaistan reunat OVAT contour(p05) ja contour(p95): sama suljetun muodon kuvaus sovellettuna otoksen omiin kvantiileihin, ei otokseen sovitettu sigma eikä mediaani ± k·stdev, ja raportti sanoo niin merkkijonossa band_definition lukujen vieressä. stdev emittoidaan jatkuvuuden vuoksi eikä mikään käytä sitä. Kvantiili, jonka C/N₀ on jo seurantakynnyksen tasolla tai alle, ei ole äärellistä kieltävää J/S:ää; nämä sarakkeet emittoidaan arvolla null ja lasketulla syyllä, ei äärettömänä eikä rajattuna säteenä

seg-f7457156f960 = Sisäinen johdonmukaisuus moottorin omia eteenpäin-funktioita vasten, mikä on kaikki, mitä tämä kyky voi rehellisesti väittää. Jokainen kontuuripiste on suljetun muodon inversio, ja jokainen inversio tarkistetaan työntämällä sen vastaus takaisin siihen ETEENPÄIN-funktioon, jolla raportin omat rivit pisteytettiin: J/S-sarake funktion jamming::effective_cn0_dbhz kautta (jonka on palautettava tracking_threshold_dbhz toleranssilla < { "1e-9" } dB-Hz), etäisyyssarake funktioiden jamming::free_space_path_loss_db ja jamming::j_over_s_db kautta (sama J/S toleranssilla < { "1e-9" } dB), EIRP-sarake funktion jamming::j_over_s_db kautta skenaarion omalla etäisyydellä. Kontuurin tarkistetaan lisäksi olevan kieltojoukon RAJA eikä sen sisällä oleva piste — lock_status menettää lukituksen tiukalla epäyhtälöllä, joten tuomion mitataan kääntyvän tilasta DEGRADED tilaan LOST, kun J/S vaihtelee { "1e-4" } dB kontuurin molemmin puolin; epsilonin verran pielessä oleva kontuuri epäonnistuisi tässä. Vahvin tarkistus on linkkikohtainen eikä kvantiilikohtainen: saman kuvauksen soveltaminen jokaisen rivin omaan C/N₀:hon toistaa raportin status-sarakkeen täsmälleen — { "0" } erimielisyyttä { "38" } / { "38" } rivillä dokumentoidussa toimintapisteessä (kind = lunar-jamming, jokainen syöte oletus paitsi jammer.range_m = { "25 000" } m), jossa { "26" } riviä ovat LOST ja { "12" } eivät ole. Monotonisuus mitataan eikä oleteta: { "20 001" } näytettä välillä [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } rikkomusta tiukasti laskevalle etäisyydelle ja tiukasti kasvavalle vaaditulle teholle, joten kaistan kvantiilijärjestys osoitetaan eikä väitetä. ExternalDataset on evätty ja sen mukana validoitu-tila: mitattua Kuun häirintäkampanjaa ei ole, jota vasten kieltosädettä voisi verrata, tähtistö on havainnollistava julkisiin lähteisiin perustuva Moonlight/LCNS-luokan geometria eikä lennetty efemeridi, ja kontuurin syötteet (EIRP, häirintälaitteen teho, antennivahvistukset, kohinalämpötila) ovat edustavia suuruuksia. ReferenceImpl harkittiin ja evättiin myös — käänteis- ja eteenpäin-lauseke ovat SAMAA algebraa luettuna kahteen suuntaan, joten edestakainen kierto tavoittaa kirjoitus- ja etumerkkivirheet mutta ei ole riippumaton toteutus; sen kutsuminen ristiintarkistukseksi olisi lainattua riippumattomuutta koskeva veto, jonka estämiseksi matriisin invariantit ovat olemassa. Mitä kaista tuo, mitataan ja siteerataan eikä väitetä: kyseisessä toimintapisteessä yksittäisen skalaarin kontuuri on { "27.402916" } km ja asettaa etäisyyden { "25" } km kielletylle puolelle kaikille { "38" } riville, kun taas kaista { "21.256108" } .. { "29.921360" } km sisältää toimintapisteen ja raportoi siksi jaon, jonka taulukko todella näyttää. Kahden kriteerin mitataan myös olevan eri mieltä — tehosuhdekaista ({ "38.186527" } .. { "53.691675" } km) ei sisällä lainkaan arvoa { "25" } km — minkä vuoksi molemmat tulostetaan

seg-2d3944107ba0 = Ristimodaalisen eheysmonitorin havaitsemisteho

seg-38bc7c0bfe57 = Raportti hybrid-optical-rf kertoo, mitä ristimodaalinen khii-toinen-monitori todella voi HAVAITA, ei vain että se läpäisee virheettömän tapauksen: pienin havaittava bias monitoroitua akselia kohti (itä, pohjoinen, ylös, kello) skenaarion ilmoitetuilla väärän hälytyksen ja havaitsematta jäämisen todennäköisyyksillä, havaitsemistehokäyrä sen kummallakin puolella, kohinaton biaskerroin, jolla toteutunut tunnusluku ensimmäisen kerran ylittää kynnyksen, sekä havaitsemisaika biasrampille ilmoitetulla nopeudella. Viat myös injektoidaan todellisen monitorin läpi ja sen palauttama tunnusluku raportoidaan analyyttisen ennusteen rinnalla

seg-b6b8dec4dcff = Kaksi sisäistä oraakkelia, ei ulkoista aineistoa. ({ "1" }) Suljetun muodon edestakainen kierto: pienin havaittava bias tuotetaan kääntämällä ei-keskeisen khii-toisen häntä epäkeskeisyysparametrille (raim::pbias) ja varmistetaan syöttämällä saatu epäkeskeisyysparametri takaisin funktion raim::noncentral_chi2_cdf läpi monitorin omalla kynnyksellä, jonka on palautettava P_md. ({ "2" }) Injektio vs. analyysi: bias kirjoitetaan yhden akselin RF-estimaattiin ja cross_raim::run_cross_raim ajetaan uudelleen, joten analyyttiseen epäkeskeisyysparametriin verrattu tunnusluku on se, jonka monitori laski, ei uudelleenjohto. Siemenluvulla ajettu Monte Carlo itse tunnusluvusta kuljetetaan testeissä kolmantena tarkistuksena; se on tarkoituksella EI raportissa, koska otosestimaatti olisi hitaampi eikä toistettavissa bitti bitiltä. ExternalDataset evätty: suure on TÄMÄN monitorin havaitsemisteho TÄMÄN skenaarion sigma-allokaatiolla, ja sigma-suuruudet, joilla MDB skaalataan, ovat mallinnettuja edustavia syötteitä, eivät mittauksia. ReferenceImpl harkittiin ja evättiin myös — Monte Carlo ottaa näytteitä samasta tunnusluvusta, jota analyysi kuvaa, joten se tavoittaa kirjoitus- ja kerroinvirheet mutta ei ole riippumaton monitorin toteutus. { "0.30" } kierros { "2" } (ennakkorekisteröity 0135a9e4), estynyt (pysyy MODELLED): SciPy { "1.18.1" } chi2/ncx2/brentq toistavat raportin kynnyksen (poikkeama enintään { "5.4e-12" }), akselikohtaisen MDB:n, tehokäyrän, ylitysmonikerran ja ramppi-havaitsemisajan (poikkeama enintään { "5.3e-10" }) viidellä konfiguraatiolla; injektoiduilla vikatunnusluvuilla ei ole riippumatonta oraakkelia ja sigma-suuruudet ovat mallinnettuja syötteitä, joten rajaus odottaa omistajan päätöstä

seg-90307f07e0ef = Kuun vertailuaseman ratkaisutilat: korkeusrajoite, kolme satelliittia, staattisen käyttäjän ikkuna

seg-366c7ad03fb2 = Valinnainen [solution]-osio skenaariolajissa lunar-station-coverage (LRS-06): korkeuden pseudomittausrivi up . dx = e_h, jonka ilmoitettu 1-sigma painotetaan etäisyysrivejä vasten; kolmen satelliitin vähimmäismäärä sallitaan vain sen kanssa; lisäksi painotettu pienimmän neliösumman ratkaisu viimeisten window_epochs epookin yli, jossa on yhteinen staattinen sijainti ja yksi kello epookkia kohden (suodattimen vastaus staattiselle sijainnille ilman prosessikohinaa samalla datalla; epookkien virheitä käsitellään riippumattomina). Jos osiota ei ole, hetkellinen ratkaisu ja jokainen dokumentti pysyvät ennallaan. Lisäys julkaistujen väitteiden vertailuun lähteiden ratkaisutyylillä, ennakkorekisteröity yksinään

seg-bfe05379b7aa = Hetkellinen pelkistys ja ratkaisijan suljetun muodon tapaukset (InternalConsistency). Lisäys (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, ennakkorekisteröity yksinään tunnisteella 001ca100), jossa korkeusrajoitteen arvo on { "1" } m, satelliitteja on kolme ja ikkuna on 6 epookkia (asetukset ILLUSTRATIVE; lähteet mainitsevat suodattimen, korkeusrajoitteen ja kolme satelliittia mutta eivät niiden asetuksia): K1–K5 eivät läpäise ja K6 läpäisee, { "1" } / { "6" } kuten tallennetussa ajossa; tapauksen R300 korjattu p95 3-D -virhe pienenee arvosta { "280.6" } m arvoon { "2.11" } m (vaakasuunta { "0.90" } m, ei pisteytetty), ja kattavuus pysyy arvossa { "0" }. Ikkunan riippumattomuusoletus suosii sitä. Ei väite mistään todellisesta järjestelmästä

seg-611ba369ed00 = Kuun vertailuaseman tarkkuus ja kattavuus julkaistuja väitteitä vastaan

seg-4fe4f1cffa2b = Skenaariolaji lunar-station-coverage ajettuna Kuun differentiaaliselle vertailuasemalle julkaistun aineiston julkisilla oletuksilla (neljä navigointisatelliittia { "24" } h jäädytetyillä elliptisillä radoilla, { "10" } m, { "95" } % SISE, { "0.30" } m koodikohina, { "1" } s ja { "600" } s korjausviive, alle desimetrin aseman mittaus, julkaistu esimerkkiasemapaikka, { "300" } km ja { "600" } km etelänapa-alueen ympyrät) ja pisteytettynä lähteiden numeerisia väitteitä vastaan kuuden yksipuolisen kynnyksen mukaan, jotka ennakkorekisteröitiin ennen ajoa: koko etelänavan kattavuus alle metrin p95-tasolla (K1, K2), alle metrin ja desimetritason korjattu p95 (K3, K4), alle metrin taso säilyy { "600" } s viiveellä (K5) ja tarkkuus säilyy perusviivan välillä { "10" } km - { "500" } km (K6)

seg-eb6d3be85fec = Viite: viiden julkisen lähteen numeeriset väitteet, jotka on rekisteröity URL-osoitteineen, hakupäivineen, SHA-256-tiivisteineen ja lisensseineen tiedostoon tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; IOAG Cislunar PNT Workshop { "2025" } ja { "2026" } -diat; UNOOSA ICG WG-B Lunar PNT, kesäkuu { "2024" }), litteroituina sivuviittauksineen tiedostoon tests/fixtures/lunar_station_published/CLAIMS.md. Kynnykset, tapaukset ja syötteet ennakkorekisteröitiin tiedostossa tests/fixtures/lunar_station_published/PREREGISTRATION.md (versio { "2" }, 05bf9a19, tallennettu yksinään ennen ajoa). { "0.36" } ensimmäinen ajo, löydös (pysyy MODELLED): kynnyksistä läpäisee { "1" } / { "6" }. Kattavuus on { "0.00" } molemmilla ympyröillä, kun vaatimus on >= { "0.95" }, ja korjattu p95 3-D -virhe on { "280.6" } m ({ "300" } km) ja { "293.0" } m { "600" } s viiveellä, kun vaatimus on <= { "1.5" } m. Desimetrikynnys (K4) ei voinut läpäistä lähteiden { "0.30" } m koodikohinalla, mikä kuvastaa lähteiden välistä ristiriitaa eikä mallin tulosta. K6 läpäisee (suhde { "1.39" }, kun vaatimus on <= { "1.5" }), mutta kahden geometrian hallitseman luvun suhteena se ei ole todiste dekorrelaatiosta kumpaankaan suuntaan. Syy: satelliittien elementit eivät ole julkisia, ja ILLUSTRATIVE-elementeillä (koodipuussa olevilla) käyttäjä ja asema jakavat neljä satelliittia yli { "5" } asteen korkeuskulmalla vain { "8.2" } %:ssa ({ "300" } km) ja { "6.3" } %:ssa ({ "600" } km) epookeista, lähes singulaarisella geometrialla (korjaamaton p95 { "3.8" } km, kun lähteiden arvo on < { "10" } m). Lähteiden simulaatiot käyttivät suodatinta, korkeusrajoitetta ja kolmea yhteisessä näkyvyydessä olevaa satelliittia, joita hetkellinen skenaariolaji ei mallinna. Vertailu ei siksi vahvista eikä kumoa julkaistua väitettä ”alle metrin koko etelänavan alueella”. Se osoittaa, että tämän mallin tulos riippuu radoista, joita ei ole julkaistu. Ei väite mistään todellisesta järjestelmästä; ei sidoksissa mihinkään virastoon eikä sen hyväksymä

seg-478225d0a8e1 = Kuun ARAIM-suojaustason ydin

seg-863690a44f21 = Kuun suojaustason geometriasta kovarianssiin -vaihe — (GᵀG)⁻¹ kaikkien näkyvissä olevien satelliittien ja jokaisen yksittäisen vian aligeometrian yli, projisoituna paikalliselle pystysuunnalle ja vaakalohkon jäljelle — sekä sen tilastollinen ydin: Bonferronin ilmaisinkerroin, jokaisen vikahypoteesin gaussinen yläpyrstö ja juurenratkaisu, joka kuvaa eheysriskibudjetin suojaustasoksi, 7 pisteen Kuun palvelutilavuudessa

seg-8191906fc700 = Kaksi vakiintunutta kolmannen osapuolen toteutusta yhdistettynä, molemmat ajettu offline-tilassa, ja fixture luotu uudelleen päästä päähän ja varmennettu tavu tavulta identtiseksi. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c käännettynä C-lähdekoodista lipulla -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() kääntää normaalimatriisin Croutin LU-hajotelmalla osittaisella pivotoinnilla, algoritmilla, jolla ei ole yhteyttä kshana-toteutuksen käsin kirjoitettuun Gauss-Jordan-käänteisfunktioon invert4(); numpy.linalg.inv (LAPACK getrf/getri) kääntää jokaisen uudelleen kolmantena riippumattomana käänteismatriisina ja on RTKLIB:n kanssa yhtä mieltä suhteellisella tarkkuudella { "1.112e-12" }. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) tarjoavat funktiot norm.isf, norm.sf (Cephes ndtri/ndtr) ja optimize.brentq, joita verrataan kshana-toteutuksen Numerical-Recipes-epätäydellisen gammafunktion sarjaan, puolittamalla haettuun käänteisfunktioon ja 200-askeleiseen puolitukseen — ja SciPyn suora sf on eri numeerinen reitti kauas pyrstöön kuin kshana-toteutuksen { "1" } − Φ, joten syvän pyrstön kumoutuminen mitataan eikä peilata. Pystyakseli on radiaaliyksikkövektori (paikallisen pystysuunnan määritelmä pallomaisella Kuulla) ja vaakavarianssi on vaakalohkon jälki, joten mitään itä/pohjoinen-atsimuuttikäytäntöä ei jaeta. NIMENOMAAN EI VALIDATED TÄLLÄ RIVILLÄ: σ_URE, satelliittikohtainen vika-priori ja havainnollistava Moonlight/LCNS-luokan satelliittitähdistö ovat MODELLED-syötteitä, jotka annetaan oraakkelille sellaisinaan; ja yhden vian MHSS-eheysyhtälön MUOTO on litteroitu samasta julkaistusta rajasta, jonka kshana-toteutus toteuttaa — jaettu suljettu muoto on jaettu oletus, joten tämä rivi kattaa kyseisen yhtälön virheellisen evaluoinnin, ei sen virheellistä valintaa. Kolmannen osapuolen MHSS ARAIM -toteutusta ei ole saatavilla (RTKLIB ei tarjoa suojaustason sisäänkäyntiä, sellaista PyPI-jakelua ei ole, Stanford MAAST on MATLAB-pohjainen), mikä on avoin parannuskohde

seg-0ec1699f5754 = ARAIM MHSS -suojaustasot julkaistuja vertailuvektoreita vastaan

seg-fbaaf3ad7648 = Usean hypoteesin ratkaisuerotteluun perustuva suojaustasoyhtälö itse: kaikkien näkyvissä olevien satelliittien ja vikamoodikohtaiset painotetut pienimmän neliösumman ratkaisut itä/pohjoinen/ylös-geometrialla yhdellä kellotilalla satelliittitähdistöä kohden, aliratkaisujen sigmat, ratkaisuerotuksen sigmat ja yksipuoliset nimellisbiasten projektiot, Bonferronin K_fa-kynnykset, valvomattomien vikojen riskin allokointi sekä VPL/HPL, jotka ratkaisevat eheysriskiyhtälön. Ajettavissa skenaariolajina <c1/>

seg-7bfcb5c6a985 = ARAIM usean satelliitin samanaikaisilla vikahypoteeseilla

seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2:n osajoukon määrityssääntö (P_THRES, FC_THRES, valvotut osajoukot vähiten poistetut ensin) yleistettynä pareista enintään max_order satelliitti- ja tähdistötapahtuman samanaikaisiin yhdistelmiin, täsmällisellä priorilla P_no fault prod q_e; add_v42_protection_levels_to_order ajaa ADD v4.2:n suojaustasopolun sen päällä (kertaluku { "2" } on täsmälleen nykyinen polku). raim::araim_subset_raim (valinnainen): edistynyt RAIM tämän hypoteesijoukon yli, jokainen valvottu osajoukko yksi (p_fault, T, b, sigma) -moodi eheysriskisummassa, havaitsemattomat osajoukot siirretty valvomattomaan riskiin, budjetti skaalattu ADD:n valvomattoman riskin allokoinnilla, ja suurimman normalisoidun erotuksen osajoukko raportoidaan, kun vika havaitaan. Priorit, jotka vaativat syvempiä osajoukkoja kuin max_order, hylätään eikä koskaan katkaista

seg-6c6076ea1eee = Sisäinen johdonmukaisuus (InternalConsistency): kertaluvun 2 palautuminen MAAST-tarkistettuun ADD v4.2 -polkuun, prioreiden riippumaton uudelleenjohto ja rakennettu kahden satelliitin vika. MAAST- tai RTKLIB-ajoa paria pidemmälle ei ole tehty, joten syvemmät hypoteesijoukot ja osajoukko-RAIMin suojaustasot eivät ole ulkoisesti tarkistettuja. araim_subset_raim jakaa funktion araim_dual_raim yksinkertaistukset (yksi sigma eheydelle ja tarkkuudelle, yksi kello, tavallinen normaalipyrstö): se ei noudata ADD-määrittelyä

seg-48ca01332f8f = RAIM holdover-laatumittareiden rinnalla

seg-890f1006a75d = Kellolajin valinnainen [integrity]-osio (clock_integrity::run): ilmoitetusta paikasta ja tähdistöesiasetuksista (geometry::sky_geometry), jokaisella eheysepookilla niin kauan kuin GNSS-aikajanaa ei ole estetty, hetkellinen RAIM (raim::snapshot_raim: pariteetin khiin neliö -testi, kaltevuussuojaustasot) maskin yläpuolella oleville satelliiteille siemenluvulla tuotetuilla gaussisilla residuaaleilla, joilla on ilmoitettu sigma ja valinnainen ilmoitettu bias; erillinen integrity_fom-lohko epookkikohtaisine tuomioineen, suojaustasoineen ja saatavuuksineen. Estetyt epookit raportoidaan ei-saatavilla-tilaisina eikä niitä koskaan ekstrapoloida; holdover-laatumittarit pysyvät ennallaan ja ilman osiota tuloste on tavu tavulta identtinen

seg-c2860bf4b562 = Sisäinen johdonmukaisuus (InternalConsistency): suojaustasot ovat funktion snapshot_raim tasot, joka on validoitu RTKLIB:a vastaan omalla rivillään, laskettuna uudelleen samalla geometrialla; vioitta ja syötetyn vian käyttäytyminen. Taivas on edustava esiasetusgeometria (ei päivätty almanakka), residuaalit ovat synteettisiä ja sigma, hälytysrajat ja todennäköisyydet ovat ilmoitettuja syötteitä; mikään tässä ei ole väite todellisen vastaanottimen saatavuudesta

seg-9cbb4ee7588a = Avaruudellinen, kohinainen, usean perheen kuunläheinen kaarenpituuden havaittavuus

seg-5ebd771deef8 = Kuunläheisen kaarenpituuden havaittavuuskynnys AVARUUDELLISESSA kuusitilaisessa CR3BP-mallissa tasomaisen nelitilaisen sijaan, DRO-, L2-halo- ja L2-lähes-suoraviivaisten halo-perheiden yli, mittauskohinan päästessä Gramin matriisiin, ja KAKSI kriteeriä raportoidaan, koska yhtä rehellistä kriteeriä ei ole: julkaistu astekriteeri, joka on todistettavasti invariantti homoskedastisen mittaussigman suhteen (valkaisu kertoo havaittavuusmatriisin skalaarilla, jolloin suhteellinen singulaariarvojen spektri ja siten aste, defekti ja ehtoluku eivät muutu), sekä arvioitavuuskriteeri — ensimmäinen kaari, jolla päätähden alkutilan muodollinen 1σ:n paikkaepävarmuus alittaa ilmoitetun rajan — joka on se, joka liikkuu kohinan mukana. Jokainen kynnys kantaa mukanaan sen epookkiruudukon haarukan, jossa se sijaitsee; saavuttamaton kriteeri on null ja siihen liittyy perustelu. Tasomainen tila pysyy oletuksena ja tason ulkopuoliset perheet hylätään siellä eikä litistetä tilaksi, joka ei pysty esittämään niitä

seg-046231819882 = Riippumaton rivi-porrasmuodon aste Gaussin eliminoinnilla osittaisella pivotoinnilla vahvistaa jokaisen kuusitilaisen asteen tuomion — eri algoritmi, joka ei jaa koodia testattavan ominais-/SVD-reitin kanssa. Tämän muodostama { "6" }×{ "6" } CR3BP-tilasiirtymämatriisi kantaa oman ReferenceImpl-oraakkelinsa SciPyn variaatiointegrointia vastaan, ja halo-/NRHO-alkuehdot tulevat korjaajasta, joka toistaa julkaistun L2-eteläisen { "9" }:{ "2" } Gateway-radan. Nykyistä neliöjuuri-informaatiosuodatinhaaraa EI nimenomaisesti lasketa vahvistukseksi: se käyttää samoja jakobiaaneja ja johtaa samaan normaalimatriisiin, joten se on kahden numeerisen koneen välinen johdonmukaisuustarkistus, ja tuotettu laajennustunniste sanoo niin. EI ankkuroitu ulkoisesti, ja ExternalDataset jätetään siksi kieltäytyen eikä lainata tilasiirtymämatriisin riviltä: itse kynnyskaarenpituudet riippuvat MODELLED-tähdistösuunnittelusta, epookkiruudukosta ja — mitattavasti, jopa { "40" }× — singulaariarvotoleranssista. Julkaistu tasomainen { "2.09" } h toistuu täsmälleen arvolla rel_tol = { "1e-6" } ja on itse toleranssiriippuvainen ({ "10.25" } h arvolla { "1e-4" }, { "0.42" } h arvolla { "1e-8" }), mikä on kriteerin ominaisuus eikä radan. Mikään julkinen aineisto ei julkaise kaarenpituuden havaittavuuskynnystä valitulle kuunläheiselle satelliittitähdistölle. MEASURED-TULOS: avaruudellinen kuusitilainen kynnys on { "22.17" } h L2 NRHO:lle ja { "40.42" } h L2-halolle, ja se EI OLE OLEMASSA tasomaiselle DRO-perheelle, jolla julkaistu väite johdettiin — aste { "4" } / { "6" }, datumin defekti { "2" } ja kaksi täsmälleen nollaominaisarvoa, rakenteellinen defekti, jota mikään kaarenpituus ei korjaa

seg-e250321394bc = Operatiivisen tyylin Maan orientaation ennustevirhe, mitattu ennustettu vastaan lopullinen

seg-0e443d241460 = Pienimmän neliösumman bias-plus-vauhti-sovitus liukuvan ikkunan yli sekä pääasialliset jaksolliset termit — vuotuinen, puolivuotinen ja kaksi pääasiallista vyöhykevuorovesitermiä UT1:lle; Chandler, vuotuinen ja puolivuotinen navalle — ekstrapoloituna viimeisen ikkunan sisäisen residuaalin kuljettamana eteenpäin: IERS Bulletin A:n käyttämä luokka, julkaistun horisontin perustana olleen pysyvyysennustimen tilalla. Pisteytetty ainoalla rehellisellä tavalla: T+h:n ennuste, joka on rakennettu nopeista Bulletin A -riveistä hetkellä T tai sitä ennen, mitattuna MYÖHEMMIN JULKAISTUA Bulletin B -lopullista arvoa vastaan hetkellä T+h, ja pysyvyysennuste pisteytetään samalla epookkijoukolla samoja lopullisia arvoja vastaan rinnalla. Kohdeepookki, jolle ei ole julkaistua lopullista arvoa, pudotetaan eikä pisteytetä uudelleen nopeaa saraketta vastaan; jaksollinen termi, jota ikkuna ei voi rajoittaa, raportoidaan hylättynä sillä jaksomäärällä, jonka ikkuna todellisuudessa kattaa; epätäydellinen ikkuna hylätään eikä sitä lyhennetä hiljaa

seg-822a1ce99154 = Kolme riippumatonta reittiä, joista mikään ei ole julkaistu ennustetarkkuusluku. ({ "1" }) Analyyttinen signaali tunnetuilla kertoimilla — ainoa tapa harjoittaa jaksollista koneistoa, koska mikään tallennettu sarja ei ole riittävän pitkä sisältämään vuotuista termiä. ({ "2" }) Oppikirjan suljetun muodon pienimmän neliösumman ratkaisu, eri algebra kuin testattava matriisiratkaisu, todellisilla riveillä. ({ "3" }) Todelliset arkistoidut Bulletin A -ennusterivit, jotka todellinen { "2026" } tuote julkaisee, verrattuna ennustusajoittain YHTEENSOPIVUUSTILASTONA eikä nimenomaan virheenä: { "0.256" } ms ({ "1" } vrk), { "0.695" } ms ({ "2" } vrk), { "1.252" } ms ({ "3" } vrk), ajautuen arvoon { "3.885" } ms ({ "9" } vrk). Tämä on siis Bulletin A:n LUOKKA, lähellä lyhyellä ennustusajalla, ei Bulletin A. Ennustetut-vastaan-lopulliset residuaalit ovat todellisia mitattuja suureita todellisilla IERS-riveillä, mutta niiden suuruus tarkistetaan vain vertailun SUUNTAA vasten, ei koskaan IERSin julkaisemaa tarkkuuslukua vasten — todellisen tuotteen lukeminen on alkuperä, ei oraakkeli. MEASURED: päivänä { "1" } operatiivinen ennustin antaa { "3.78" } m Kuun koordinaatiston virhettä, kun pysyvyysennusteella se on { "11.39" } m ({ "3.01" }×), päivänä { "2" } { "10.23" } m vastaan { "21.72" } m ({ "2.12" }×), päivänä { "3" } { "20.33" } m vastaan { "30.57" } m ({ "1.50" }×) — ja se on HUONOMPI kolmen päivän jälkeen ({ "0.87" }× kohdassa { "5" } vrk, { "0.43" }× kohdassa { "10" }), minkä raportti tuottaa eikä näytä vain horisontteja, jotka imartelevat sitä. EI toistettu: autoregressiivinen residuaalisuodatin ja taulukoitu vyöhykevuorovesireduktio, 365 päivän operatiivinen ikkuna ei ole saavutettavissa tallennetulla datalla, eikä tässä repositoriossa ole MITÄÄN arkistoitua aiempaa sarjaversiota — joten arkistoitujen versioiden taulukko raportoi nolla riviä eikä pisteytä synteettistä riviä. { "0.30" } ulkoinen vertailu, löydös (pysyy MODELLED): pisteytettynä samoja lopullisia arvoja vastaan { "178" } arkistoidun Bulletin A -julkaisun yli kirjaston oletusikkunalla 15 päivää, ennustimen UT1 MAE on 2.4x - 12.6x Bulletin A:n arvosta ennustusajoilla { "1" } - { "10" } vrk (kynnys 1.5x) ja { "5.32" } ms arvolla { "10" } vrk, 2nd EOP PCC:n alueen { "0.36" } - { "3.13" } ms ulkopuolella; napa on 1.5x - 1.85x Bulletin A:n arvosta (1.5x:n sisällä vain ennustusajoilla { "6" } ja { "7" } vrk); { "21" } ennakkorekisteröidystä ehdosta { "19" } epäonnistuu. Reitin ({ "3" }) korjaus: { "2026" } tuoterivit, joihin sitä verrattiin, kantavat IERS I (mitattu) -lipun, eivät P:tä, joten nuo yhteensopivuusluvut ovat mitattuja nopeita arvoja vastaan, eivät Bulletin A:n ennusteita vastaan. { "0.30" } kierros { "2" }, pienimmän neliösumman plus autoregressiivinen ennustin vyöhykevuorovedet analyyttisesti poistettuina, { "178" } arkistoitua Bulletin A -julkaisua vastaan kierroksen 1 kynnyksellä (ennakkorekisteröity c93605b4), löydös (pysyy MODELLED): { "21" } ehdosta { "12" } pätee; UT1 MAE on { "1.73" } - 2.11x Bulletin A:n arvosta ennustusajoilla { "2" } - { "10" } vrk (kynnys 1.5x) kun taas napa on 1.27x:n sisällä jokaisella ennustusajalla. { "0.30" } tarkistus: kun offline-syöte on nyt luokiteltu IERS-lipun mukaan, reitin ({ "3" }) yhteensopivuusluvut ovat todellisia Bulletin A -ennusteita vastaan (0.256/0.695/1.252/3.885 ms 1/2/3/9 vrk nopeita rivejä vastaan -> 0.133/0.421/0.839/2.786 ms)

seg-f4efd94dd746 = Kuun koordinaatiston datumi havaintokampanjasta

seg-a6972eb89d7d = Seitsemän parametrin Helmert-datumi, joka on propagoitu SIMULOIDUSTA HAVAINTOKAMPANJASTA eikä palautettu syötetystä muunnoksesta. Maa-asemat havaitsevat lähteistetyn Kuun pinnan majakkaluettelon nimenomaisella aikataululla; Kuun VLBI-viiveosittaisderivaatat kertyvät majakkakoordinaattien Fisherin informaatiomatriisiin ja viedään Helmert-suunnittelumatriisin A = [I₃ | [p]ₓ | p] kautta muotoon H = AᵀM_bA, joten raportoitu datumin tarkkuus on havaintoohjelman funktio — täsmälleen lineaarinen viivesigmassa ja monotoninen kaaressa libraation kautta, jonka raportti MITTAA. Datumin defekti on aihe eikä alaviite: aste, defekti, ehtoluku, spektri, havaitsemattomat suunnat seitsemän parametrin kannassa, heikoin suunta myös täydellä asteella ja kunkin parametrin osuus siitä raportoidaan jokaisella ajolla, ja mikä tahansa parametri, jota kampanja ei rajoita, julkaistaan arvona NULL tilan kanssa. Majakkavirheen korrelaatio on MEASURED, ei oletettu — täsmälleen nolla asemien ollessa kiinnitettyjä, ja se tulostetaan hintoineen, kun asemat estimoidaan. Ajettavissa skenaariolajina <c1/>

seg-8eedf0240350 = Suljetun muodon identiteetit ja riippumaton koodipuun sisäinen reitti, ilman väitettyä ulkoista oraakkelia. Helmert-suunnittelu — moduulin ainoa uusi derivaatta — johdetaan uudelleen funktion lunar_frame_realise::apply_helmert keskeisellä äärellisellä erotuksella, polulla, joka ei jaa lauseketta analyyttisen muodon kanssa. Sen muodostama kertymä on lunar-vlbi-fim:n, jonka jakobiaani on äärellisesti derivoitu funktiota lunar_vlbi::vlbi_delay_s vasten siellä ja jonka lineaarialgebraydin on erikseen ankkuroitu ulkoisesti numpya vasten tiedostossa tests/fim_observability_reference.rs — tämä rivi ei lainaa kumpaakaan tilaa. Fysiikan oraakkeli on rakenteellinen eikä numeerinen: majakan viiveen osittaisderivaatta on kahden lähes yhdensuuntaisen yksikkövektorin lähikentän EROTUS, joten huonoiten määritetyn translaatiosuunnan TÄYTYY olla kappalekiinteä suunta Maahan, ja testi vahvistaa lasketun vastauksen erikseen mitattua suuntaa vasten. MEASURED: kampanjasta johdettu translaatiosigma { "6.3975" } m vastaan syötetyn muunnoksen skenaarion { "0.3125" } m palautusvirhe ({ "20.5" }× tiukempi), kun taas rotaatio ja skaala menevät TOISEEN suuntaan { "2.32" }× ja { "13.5" }× löysempinä — syötetty polku olettaa yhden isotrooppisen sigman ja levittää siten virheensä tasaisesti seitsemälle parametrille, mitä viivehavaintosuure ei tee. Aste 7/7 mutta ehtoluku { "3.8e5" }, yhdellä suunnalla { "99.57" } % puhdasta translaatiota kohti Maata ja neljäkymmentä kertaa huonommin kuin mikään muu. MITÄ TÄMÄ RIVI EI VÄITÄ: että kampanjan luku on oikein absoluuttisesti. Se osoittaa, että luku JOHTUU nyt aikataulusta, geometriasta ja virhemallista eikä istutetusta vastauksesta. Pysyy ReferenceImpl/MODELLED: julkaistua Kuun VLBI -kampanjan ja datumikovarianssin paria ei ole, asemaverkko ja viivesigma ovat ILLUSTRATIVE-syötteitä (majakkaluettelo on lähteistetty, kampanja ei), havaintoja käsitellään riippumattomina vaikka todellisen session troposfääri ja kello korreloivat lähekkäisten skannausten välillä, ja efemeridi, kellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ. { "0.30" } ulkoinen vertailu, löydös (pysyy MODELLED): kun jokainen majakkajakobiaanin rivi on rakennettu uudelleen NAIF SPICE -valoajoista (DE440, ITRF93, MOON_ME; ennakkorekisteröity { "50863551" }), aikataulu, Helmert-aste, datumisigmat ({ "4.7e-3" } sisällä), ehtoluku, heikoin suunta ({ "0.07" } astetta), libraatiopyyhkäisy ja kaarijärjestys täsmäävät kuudessa skenaariossa ennakkorekisteröidyn { "1" } % / { "0.2" } / { "0.05" } asteen sisällä. NumPy tallennetulla moottorijakobiaanilla täsmää tarkkuudella { "3e-14" }, kun asemat on kiinnitetty. Asemien ollessa estimoituja ero on { "6.8e-6" } ennakkorekisteröityä { "1e-9" } vastaan, jonka ehtolukuoletus oli väärä (Helmert-ehtoluku { "2.1e8" }; riippumattomat NumPy-reitit eroavat toisistaan { "3e-6" }; moottorin { "1e-9" } pseudokäänteisen varareitin osuutta ei suljeta pois), joten riviä ei ylennetä tämän ennakkorekisteröinnin perusteella. { "0.36" } uudelleenrekisteröinti ehtolukuun skaalatulla kynnyksellä (ennakkorekisteröity b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) yhteisen informaation ja sen Helmert-reduktion ehtoluvusta), löydös (pysyy MODELLED, NOT MET): vaihe { "0" } sulkee pseudokäänteisen varareitin POIS { "6.8e-6" } -erolle (mikään Helmert-matriisin ylävirran matriisi ei turvaudu varareittiin kuudessa alkuperäisessä skenaariossa, tiukin marginaali kerroin { "2.6" }), SPICE-haara pitää edelleen kaikissa kuudessa, ja NumPy täsmää kynnyksen sisällä kuudessa kahdeksasta skenaariosta (oletus, kaksi kaarta, 3x viivesigma, kollineaarinen defekti ja tuore asemat kiinnitetty -ajo päivältä 2026-12-01; pahin { "0.13" } kynnyksestään). Se epäonnistuu skenaariossa stations_estimated (datumisigmat jopa { "6.8e-6" }, ehtoluku { "9.1e-6" }, riippumattomuuden hylkäämä normi { "3.5e-6" }, kun t = { "5.9e-7" }), ja tuoreena päivänä etelänavan majakalla ei ole havaintoa, joten majakan informaatio on asteeltaan vajaa (pseudokäänteinen varareitti Helmert-matriisin ylävirrassa molemmissa tuoreissa skenaarioissa) ja muuttumaton NumPy-oraakkeli ei voi evaluoida skenaariota stations_estimated_fresh (singulaarinen matriisi). Tulokset: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

seg-ca481f2d8f9e = Kuunläheisen kaarenpituuskynnyksen riippumattoman estimaattorin vahvistus

seg-3d5fbf896209 = Eräpienimmän neliösumman estimaattori, joka PALAUTTAA päätähden alkutilan simuloiduista satelliittien välisistä mittauksista saman epookkiruudukon kasvavien alkuosien yli, jota aste-vastaan-kaari-taulukko käyttää, mittausosittaisderivaatat otettuina yhdistetyn eteenpäinmallin keskeisinä äärellisinä erotuksina. Se ei käytä mitään koneistoa, jolla kynnys mitattiin — ei analyyttistä jakobiaanirivia, ei variaatiotilasiirtymämatriisia, ei singulaariarvo- tai ominaisarvohajotelmaa, ei asteen toleranssia, ei neliöjuuri-informaatiosuodatinta — ja jakaa vain dynamiikan, alkuehdot, skalaarihavaintosuureen ja epookkiruudukon, jotka kaikki on nimetty tuotetussa asiakirjassa. Kaksi kriteeriä, molemmat pyyhkäistään: kohinaton palautus (asteen vastine) ja Monte Carlo -arvioitavuus (arvioitavuuden vastine, mitattuna tunnettua totuutta vasten eikä kovarianssista ennustettuna). Ajettavissa skenaariolajina <c1/>

seg-60e30948cee7 = Erillinen estimaattori tässä koodikannassa eri algoritmilla ja irrallisella koodipolulla: epälineaarinen painotettu Gauss-Newton äärellisen erotuksen osittaisderivaatoilla, jonka tuomio luetaan mitattuna tilanpalautusvirheenä yksiköissä km ja mm/s. Sillä ei ole mitään yhteistä lauseketta Gramin matriisin aste-ja-kovarianssireitin kanssa, ja erottelu PAKOTETAAN lähdetekstin vartijalla eikä väitetä. MEASURED julkaistulla tasomaisella DRO-ruudukolla: ARVIOITAVUUSkriteeri on CORROBORATED — mitattu Monte Carlo -raja on { "5.739130" } h muodollista { "5.739130" } h vastaan (suhde { "1.0000" }), ja mitattu RMS toistaa muodollisen 1σ:n { "21" } kaarenpituuden yli geometrisen keskiarvon suhteella { "0.9804" }. ASTEKRITEERIÄ ei ole vahvistettu palautettavuuden rajana: estimaattori palauttaa arvosta { "0.782609" } h Gramin matriisin arvon { "2.086957" } h sijaan, suhde { "0.375" }, ja arvolla { "1.826087" } h — viimeinen alkuosa, jonka astelukema pisteyttää { "3" } / { "4" } — palauttaa tarkkuudella { "1.96e-5" } a priori -siirtymästä. Palautusraja ei liiku oman rajansa kolmen dekadin yli, kun taas asteen kynnys kattaa ”ei koskaan” - { "0.782609" } h rel_tol-arvon neljän dekadin yli, ja kaksi osuvat täsmälleen yhteen arvolla rel_tol = { "1e-8" }. Tämä alue kirjattiin ensin yltävän arvoon { "0.260870" } h; tuo luku oli ARTEFAKTI, jonka tuotti astelukema, joka laski { "4" } suuntaa { "2" } mittausrivistä f64-kohinalattian alapuolella, ja se korjataan tässä eikä jätetä voimaan. Astelukema rajataan nyt Sylvesterin epäyhtälöllä ja syy tuotetaan, ja korjattu alue saturoituu täsmälleen kaarelle, jolla riippumaton estimaattori palauttaa, mikä vahvistaa tämän rivin ristiinvalidointia eikä heikennä sitä: julkaistu { "1e-6" } on konservatiivinen singulaariarvon KONVENTIO, ei väite palautettavuudesta. Sama kuvio avaruudellisesti: NRHO { "9.290323" } h vastaan { "21.677419" } h, halo { "22.978723" } h vastaan { "39.829787" } h, arvioitavuuden täsmätessä täsmälleen molemmissa. Tasomainen DRO:n kuusitilainen ei palaudu millään kaarella, mikä toistaa riippumattomasti tuon perheen rakenteellisen datumidefektin estimaattorista, jolle siitä ei kerrottu mitään. EI ankkuroitu ulkoisesti — dynamiikka ja alkuehdot jaetaan testattavan analyysin kanssa eikä mikään julkinen aineisto julkaise tällaista kynnystä — joten ExternalDataset jätetään kieltäytyen

seg-2797643153dc = Ajoituksen suojaustaso kiertoradalla olevalle vastaanottimelle GNSS-harhautuksen aikana

seg-cb412a2ffadf = orbital_timing::orbital_timing, saatavilla tyypin <c1/> harhautusosiona: ympyräradan nopeus ja jaksonaika, pisin aika, jonka maassa oleva harhauttaja voi tavoittaa satelliitin yhdellä ylilennolla, kellotuettu valvonnan alaraja ja CUSUM-havaitsemisviive, ehdollinen suojaustaso (alaraja lisättynä viiveen aikaisella liukumalla), poikkeama, jonka harhauttaja ilmoitetulla enimmäisramppinopeudella ehtii kerätä ennen kuin satelliitti poistuu jalanjäljeltään tai riippumaton tarkistus suoritetaan, sekä onko jokainen maayhteyden tai ristilinkin tarkistus riippumaton yhdestä maassa olevasta harhauttajasta

seg-3d441db3a373 = Palautus nykyiseen ajoituksen suojaustasoon sekä ympyräradan ja pallomaisen Maan näkyvyyden suljettuihin muotoihin. Ehdollinen havaitsemiselle, yhdelle maanpäälliselle harhauttajalle ilmoitetulla rampin nopeudella ja yläpuoliselle ylilennolle pyörimättömällä Maalla; ei validoitu kiertoradalla olevalla harhautetulla vastaanottimella

seg-158a99d40b0d = Suljetun muodon L-kaistan signaalien tehospektritiheydet ja spektrinerotuskertoimet

seg-17060c71fa54 = Yksikköpinta-alaiset tehospektritiheydet signaaleille GPS L1 C/A ja L2C (BPSK({ "1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), sini-BOC({ "1,1" }) sekä Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, MBOC-muunnoksella täydennettynä), niiden numeerisesti paikannetut nollakohdat ja maksimit (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz) sekä signaalin spektrinerotuskerroin mitä tahansa spektriä vastaan millä tahansa siirtymällä (navsignal::spectral_separation_coeff_offset) tai sävyä, tasaista kohinaa, chirppiä tai sovitettua kohinaa vastaan (spectrum::Jammer::ssc), häirinnänestokertoimella Q = 1/(R_c kappa)

seg-d8fadba57203 = Julkaistut oppikirja-arvot: BPSK(n):n pääkeila 2n x { "1.023" } MHz nollasta nollaan sekä häirinnänestokertoimet Q = { "1" } kapeakaistaiselle (CW) häirijälle ja Q = { "1.5" } C/A:han sovitetulle hajaspektrihäirijälle (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed., section { "9.4" }); BOC(m,n)-pääkeilat keskitettyinä kohtiin plus tai miinus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); spektrinerotuskertoimet -61.8, -64.8 ja -67.8 dB/Hz parille C/A ja C/A, BOC({ "1,1" }) ja BOC({ "1,1" }) sekä C/A ja BOC({ "1,1" }) (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, May/June { "2006" }), toistettuna tässä niiden Parsevalin autokorrelaation suljetuista muodoista. BOC({ "1,1" }):n maksimi ei ole kohdassa { "1.023" } MHz: keila ulottuu kantoaallon nollakohdasta kohtaan { "2.046" } MHz ja saavuttaa huippunsa kohdassa { "0.759" } MHz, ja testi lukitsee molemmat. MBOC-sekoitus on ICD:n määritelmä, ja siitä tarkistetaan vain yksikköpinta-ala ja lineaarisuus

seg-f134975d4ffa = L-kaistan spektrin vesiputouskuvaaja kaistakohtaisella J/S-arvolla ja efektiivisellä C/N0:lla skriptatun häirijäaikajanan alla

seg-86ad8f89a822 = Tyyppi <c1/>: L-kaistan tehospektritiheyden taajuus–aika-ruudukko (terminen lattia k T_sys, kun T_sys = T_ant + { "290" } K (F - { "1" }), signaalit rajapintamäärittelyn pienimmillä vastaanotetuilla tehoilla sekä jatkuva-aaltoinen, kapeakaistainen, chirp- ja sovitettu kohinahäirijä päälle- ja poiskytkentäajoin), jokainen solu keskiarvoistettuna kaistansa ja rivinsä yli (chirpit tarkasti kokonaisten ja osittaisten pyyhkäisyjen yli, häirijät käyttösuhteen mukaan), kaistakohtainen efektiivinen C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1 riviä kohti, J/S kaistaa kohti, kaistan sisäinen J/S sekä SVG-vesiputouskuvaaja C/N0-palkeilla. Raportti sisältää ristiintarkistuksen tyypin <c2/> ketjuun samoilla linkkisyötteillä

seg-deead3dc3c43 = Palautus nykyisen tyypin <c1/> häirinnänestoyhtälöön ja linkkibudjettiin (sama koodi, kutsuttuna samoilla syötteillä) sekä k T0 F -kohinalattian suljettuun muotoon. Alla olevat signaalispektrit ovat yllä oleva validoitu rivi; häirijöiden tehot, aikajana ja etupään kaistanleveydet ovat skenaarion syötteitä, spektrit ovat jatkuvia (ei hajautuskoodin viivoja), eikä automaattinen vahvistuksen säätö, tyhjennys tai antennikuvio vaikuta häirijään. Tietovarastossa ei ole mitattua häirittyä spektriä, jota vasten yhdistelmän voisi tarkistaa. Tyypin <c2/> Q-taulukko (CW ja kapeakaistainen { "1" }, laajakaistainen ja pyyhkäisevä { "2" } versiosta { "0.36" } alkaen: oppikirja-arvot, lukittu navsignalin suljettuihin muotoihin) on yhdenmukainen tämän mallin CW-arvon kanssa ja poikkeaa siitä, mitä se johtaa C/A:han sovitetulle kohinalle ({ "1.5" }) ja tasaiselle nollasta nollaan -kohinalle ilman kaistansisäistä normalisointia ({ "2.2" }); raportti tulostaa molemmat

seg-1461dcaed6be = SigMF-tallenteiden luku ja kirjoitus sekä kompleksisen IQ:n Welch-spektriestimaatit

seg-2195d95299b2 = sigmf: lukee ja kirjoittaa Signal Metadata Format -tallenteita (JSON .sigmf-meta kentillä core global, captures ja annotations; raaka .sigmf-data muodossa cf32_le, ci16_le tai ci8, kokonaislukudekooderit jaettuina funktion realdata::iqif::load_iq kanssa), kaikki merkkijonoilla ja tavupuskureilla. spectrum::welch_psd: Hann-ikkunoidut, limittyvät, keskiarvoistetut periodogrammit, tiheysskaalattuina, crate-sisäisellä radix-2-muunnoksella (spectrum::fft_in_place). Nämä kaksi ovat validoitu väite. spectrum::synthesise_iq piirtää mallin IQ:na, ja tyypin <c1/> [iq]-osio ajaa mallin IQ:ksi, SigMF:ksi ja Welchiksi ja vertaa mallin kanssa; sen [recording]-osio estimoi todellisen tallenteen (natiivit koontiversiot); synteesi ja nämä mallivertailut ovat validoidun väitteen ulkopuolella

seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) samalla jaksollisella Hann-ikkunalla, limityksellä, tiheysskaalauksella, ilman trendinpoistoa ja kaksipuolisella keskiarvoistuksella: jokainen lokero { "1e-12" } suhteellisen virheen sisällä (havaittu { "6.0e-14" }) { "27" } tapauksessa, segmenttimäärät otettuna scipyn omasta spektrogrammista. sigmf-python { "1.13.0" } (LGPL-3.0, ajettuna työkaluna) kirjoittaa viisi kolmannen osapuolen tallennetta (cf32_le, ci16_le, ci8, kaksi tallennetta merkinnöillä, nollasta poikkeava ensimmäinen sample_start), jotka crate dekoodaa bitintarkasti identtisillä core-kentillä, ja lukee craten tallenteet takaisin bitintarkasti; SigMF { "v1.2.6" } -metadataskeema raportoi nolla virhettä craten metadatasta. Toleranssit lukittu ennen ensimmäistä vertailua. Väitteen ulkopuolella: spectrum::synthesise_iq sekä [iq]- ja [recording]-vertailut mallin kanssa (synteesillä ei ole yhtä oikeaa vastausta; jaksollinen chirp näyttää viivoja, Fresnel-aaltoilua ja reunahäntiä, joita sileä malli ei sisällä, kokonaisteho { "2" } %:n sisällä), kokonaisluvusta liukulukuun skaalauskäytäntö (crate jakaa luvuilla { "32767" } ja { "127" }, sigmf-pythonin autoscale luvuilla { "2" }^{ "15" } ja { "2" }^{ "7" }, minkä spesifikaatio jättää avoimeksi; vertailu käyttää raakakoodeja), monikanavaiset tallenteet ja datatyypit, jotka lukija hylkää

seg-bf2d02d76762 = Planeettojen paikat koko aurinkokunnassa JPL:n Standish-Kepler-elementeistä

seg-c9d3549045eb = Merkuriuksen, Venuksen, Maa–Kuu-barycentrin, Maan, Marsin, Jupiterin ja Saturnuksen heliosentriset paikat Standishin taulukosta { "1" } ({ "1800" } AD – { "2050" } AD) sekä kaikkien kahdeksan planeetan taulukoista 2a/2b ({ "3000" } BC – { "3000" } AD, b-, c-, s- ja f-keskianomaliatermein), JPL-sivun algoritmia askel askeleelta noudattaen ja ICRF:ään (International Celestial Reference Frame) käännettynä sivun kaltevuuskulmalla; Maa erotetaan barycentristä Montenbruck & Gill -kuusarjalla ja massasuhteella. Koottu muotoon ephem_provider::AnalyticSolarSystem, jolloin mikä tahansa kappale on saatavilla suhteessa mihin tahansa toiseen, ja ajettavissa tyyppinä <c1/>

seg-24e058d4d094 = JPL Horizons DE441 geometriset heliosentriset vektorit (ekliptika ja ICRF), haettu ennakkorekisteröintiversioiden { "80451866" }, 8d38a28b ja 558cc807 jälkeen. Kynnys: planeettaa ja komponenttia kohti RMS enintään 1.0x Explanatory Supplement 3rd ed. -teoksen taulukon { "8.10.1" } likimääräisistä virheistä (EMB-rivi Maalle); Maa–EMB-erotus tarkistetaan suoraan DE441:tä vastaan { "399" } miinus { "3" }, enintään { "0.3" } astetta ja { "8.1" } km jokaisena ajankohtana 1950–2050 (pituuskynnys { "8.1" } km tulee Kshanan oman efemeridi-dokumentaation kuusarjan tarkkuudesta, joka viittaa Montenbruckiin ja Gilliin, eikä sitä tarkistettu kirjaa vastaan; mitattu { "6.09" } km on lähellä sitä). RMS-tunnusluku valittiin tietäen, että aiempi 27 ajankohdan vertailu saavutti maksimissaan 1.87x nimellisestä; yksittäisen ajankohdan virheet yltävät 3.83x:ään (3.87x ICRF-tapauksessa). Supplement ei määrittele lukujaan RMS-arvoina. Tapaus B kääntää molemmat puolet testissä kirjoitetulla IAU { "1976" } -kaltevuuskulmalla, joten kierrosta ei tarkisteta itseään vastaan. AnalyticSolarSystemin oletustaulukkovalintaa ei harjoiteta (testit pakottavat taulukon { "1" }). Uranus ja Neptunus taulukosta { "1" } ovat erillinen MODELLED-rivi

seg-4ea08a296b37 = Auringon, Kuun, Merkuriuksen ja Venuksen paikat DE440-kernelistä UTC-ajankohtina (KernelEphemeris)

seg-8d47467c36e4 = Auringon, Merkuriuksen, Venuksen, Maan ja Kuun geometriset paikat toistensa suhteen (J2000/ICRF-akselit, metreinä) JPL DE440 -kernelistä funktion ephem_provider::KernelEphemeris kautta UTC-ajankohtina: kappaleiden nimet kuvattuna NAIF-koodeiksi, UTC vietynä karkaussekuntitaulukon läpi ja TT TDB:ksi kaksitermisellä TDB-TT-sarjalla, kernel luettuna moottorin omalla lukijalla. Kappale, jonka kernel sisältää vain järjestelmän barycentrinä (Mars–Neptunus, Pluto tiedostossa de440s), hylätään eikä sitä koskaan korvata. Kernelitön Standish-rivi säilyy selain- ja varapolkuna

seg-f0e09f78814a = Skyfield { "1.54" } (MIT), omalla karkaussekuntitaulukollaan, omalla TDB-TT:llään ja omalla lukijallaan samalle NAIF de440s.bsp -tiedostolle (jplephem), ajettuna erillisenä ohjelmana UTC-ajankohtina. Ennakkorekisteröity (0bfafe6d) ennen kuin fikstuuri oli olemassa, ruudukko siemennetty kyseisen commitin tiivisteestä, kynnyksenä { "5e-5" } s kertaa suhteellinen nopeus (moottorin ilmoittama kaksitermisen TDB-TT:n tarkkuus) plus { "1e-13" } barycentrisestä etäisyydestä plus { "1e-5" } m komponenttia kohti. Tulos: kaikki { "600" } sisäpuolella, pahin { "0.66" } kynnyksestä ({ "2.96" } m nopealla parilla, TDB-TT-sarjan oma virhe). Mutaatio: TDB:n tilalla käytetty TT epäonnistuu { "33" }-kertaisella kynnyksellä. Molemmat puolet lukevat DE440:n: tämä validoi tarjoajan ja sen aikaketjun, ei DE440:ää. Väitteen ulkopuolella: Venuksen ulkopuoliset planeetat kappaleina (de440s sisältää vain niiden barycentrit), planeettojen kuut sekä kaksitermisen TDB-TT-sarjan alittava tarkkuus (muutama metri nopeimmille pareille)

seg-b59153f28d69 = Valoaika aurinkokunnan kappaleiden välillä

seg-48ebe0983725 = Newtonin mukainen yksisuuntainen valoaika mistä tahansa kappaleesta mihin tahansa toiseen, vastaanotettuna ajankohtana, ratkaistuna radiometrisellä kiintopistevaloaikaratkaisijalla (radiometric::light_time_solution, lähetin viivästetyssä paikassaan) funktion solar_system::link_on kautta millä tahansa EphemerisProvider-tarjoajalla; tyyppi solar-system ajaa sen analyyttisellä aurinkokunnalla heliosentrisessä koordinaatistossa (solar_system::link). Kaksisuuntainen etäisyys funktiosta radiometric::two_way_range ja Auringon Shapiro-viive funktiosta radiometric::shapiro_delay raportoidaan erikseen, eikä niitä verrata ulkoisesti. Tuotetaan jokaiselle kappaleelle havaitsijaa vastaan ja mille tahansa lisälinkille tyypillä <c1/> sekä kappaleelta Maahan suuntautuvalle alalinkille tyypillä <c2/>

seg-0685ab1ef2d3 = JPL Horizons DE441 yksisuuntainen alasuuntainen Newtonin valoaika LT (VEC_CORR=LT, havaitsija Maan keskipiste), ennakkorekisteröity (480037d3, muutos 54d5c86f, joka muutti vain interpolaatiosolmujen välystä sen jälkeen kun ensimmäinen haku ei täyttänyt { "10" } m:n interpolaatioesiehtoa, ennen kuin yhtäkään valoaikaa oli verrattu) kynnyksellä { "1e-6" } s valoaikaa kohti, ratkaisijalle syötettynä DE441:n barycentriset paikat, jotta viivästetyn lähettimen iteraatio näkyy (ensimmäisen iteraation ratkaisija erehtyy jopa { "0.1" } s). Analyyttisillä Standish-paikoilla valoaika on vain niin hyvä kuin nuo paikat (ks. planeettojen paikkojen rivi); toimitettu linkki käsittelee Aurinkoa inertiaalisena keskipisteenä, mikä pysyy tuon paikkavirheen sisällä mutta ei ole erikseen validoitu. two_way_range ja shapiro_delay eivät ole ulkoisesti verrattuja

seg-6e0b9687e8ee = Uranus ja Neptunus Standishin taulukosta { "1" }, Pluto ja planeettojen nopeudet

seg-df3bf502dfe9 = Uranuksen ja Neptunuksen paikat Standishin taulukosta { "1" } (oletus välillä { "1800" } AD – { "2050" } AD), Pluto vuoden { "1992" } taulukon { "1" } rivistä, jota nykyinen JPL-sivu ei enää listaa, sekä jokaisen planeetan heliosentrinen nopeus: kahden kappaleen derivaatta elementtien implikoimalla keskiliikkeellä lisättynä ellipsin kiertymisellä periheliin, inklinaation ja solmun muutosnopeuksista

seg-f49245efe44f = Mitattu JPL Horizons DE441:tä vastaan (samat committoidut fikstuurit), mutta ei validoitu: taulukon { "1" } ilmoittamat luvut Uranukselle ja Neptunukselle ylittyvät jopa { "2.0" }- ja { "5.2" }-kertaisesti DE441:n heliosentrisiin paikkoihin verrattuna (Neptunus täyttää ne barycentrisiin paikkoihin verrattuna, mikä viittaa siihen, ettei sovitus ollut heliosentrinen), sivu ei ilmoita virhettä Plutolle, eikä nopeuksille ole julkaistua rajaa. Taulukot 2a/2b täyttävät omat lukunsa Uranukselle ja Neptunukselle, ja ne kuuluvat validoidun rivin piiriin

seg-a50be56f605a = Kuun ja seitsemän suuren kuun paikat (Phobos, Deimos, Galilein kuut, Titan)

seg-2cfbe5a1eece = Geosentrinen Kuu Montenbruck & Gill -sarjasta (jonka termi -1.3972 astetta vuosisadassa jo viittaa sen J2000-päiväntasaukseen) sekä Phobosin, Deimosin, Ion, Europan, Ganymedeen ja Callisto planeettakeskiset paikat ja nopeudet JPL Solar System Dynamics -keskielementeistä kunkin kuun Laplace-tasossa, keskipituuden muutosnopeus otettuna IAU:n synkronisesta pyörimisnopeudesta (taulukko ilmoittaa jakson liian harvoin numeroin vaiheen säilyttämiseksi), sekä Titanin IAU:n pyörimismallista (kuu kappaleenkiinteän x-akselin miinuspuolella keskietäisyydellä), koska Titanin ilmoitettu Laplace-tason rivi ei toista Horizonsia edes omalla ajankohdallaan

seg-6c81bd570fe5 = Mitattu JPL Horizons -satelliittiefemerideistä (DE441, MAR099, JUP365, SAT441), jotka on committoitu tiedostoon tests/fixtures/solar_system/horizons_satellites_icrf.csv kyselyn ja hakupäivän kanssa; keskielementeille tai pyörimismallin sijoitukselle ei ole julkaistua tarkkuutta, joten lukitut kynnykset havaitsevat regressiot eivätkä validoi. Keskielementit jättävät pois resonanssi- ja aurinkohäiriöt, eikä Phobosin sekulaarista kiihtyvyyttä mallinneta

seg-8b8c8e28ece9 = Jokaisen aurinkokunnan kappaleen fysikaaliset vakiot ja koko järjestelmän raportti

seg-d225a30de35c = Body saa Merkuriuksen, Venuksen, Jupiterin, Saturnuksen, Uranuksen, Neptunuksen, Pluton, Phobosin, Deimosin, Ion, Europan, Ganymedeen, Callisto ja Titanin (gravitaatioparametri, vertailusäde, J2 siellä missä se on julkaistu sen säteen kanssa, johon se viittaa, IAU:n napa ja nollameridiaani), nimihaun ja BodyFacts-tietueen (NAIF-koodi, luokka, emokappale, ekvatoriaalinen ja keskisäde); tyyppi <c1/> raportoi ne kaikille kahdelleksantoista kappaleelle yhdessä paikkojen, valoaikojen ja yhden kierroksen rataviivan kanssa, ja jokainen kappale on merkitty VALIDATED tai MODELLED

seg-6adc29de51fd = Julkaistujen vakioiden transkriptio, kukin viitattuna siellä missä se määritellään: gravitaatioparametrit JPL Horizonsin kappaletietueista ja JPL:n satelliittien fysikaalisten parametrien taulukosta, säteet JPL:n fysikaalisten parametrien taulukoista (IAU WGCCRE { "2015" }), navat ja nollameridiaanit IAU:n Working Group on Cartographic Coordinates and Rotational Elements -ryhmältä (keskiarvot, ilman T-nopeus- ja jaksollisia termejä), J2 lähteistä Smith et al. { "2012" }, Iess et al. { "2018" } ja { "2019" } sekä Jacobson { "2009" } ja { "2014" }. Tarkistettu sisäisen johdonmukaisuuden osalta (Jupiterin pyörimisjakso System III -nopeutta vasten, kukin J2 viitesäteensä vasten), ei ulkoista oraakkelia vasten. { "0.30" } kierros { "2" }: GM-arvot otettiin funktiosta gm_de440 sekä Phobosin ja Deimosin elementit tiedostosta pck00011, joten { "0" } / { "84" } lisättyjen neljäntoista kappaleen vakiosta poikkeaa nyt NAIFista (aiemmin { "12" }), mikä on transkriptiotarkistus eikä sitä lasketa. { "0.36" }: IAU:n kappaleenkiinteä orientaatio ja lisättyjen neljäntoista kappaleen GM on eroteltu omalle VALIDATED-riville ("IAU body orientation and gravitational parameter of the fourteen added solar-system bodies"); tämä rivi säilyttää jäljelle jääneen. J2 ja keskisäde on viitattu, ei validoitu; raportin paikat nojaavat omiin riveihinsä; ja raportin prime_meridian_deg Maalle, Kuulle ja Marsille pysyy perinteisissä vakioissa (jopa { "6.6e-3" }, { "2.8e-2" } ja { "9.6e-4" } rad arvosta IAU_<BODY>). { "0.30" }-tarkistukset: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimos { "9.62e4" } -> { "9.615569648120313e4" }, Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptune { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Phobosin ekvatoriaalinen säde { "13.1" } -> { "13.0" } km; prime_meridian_deg sisältää nyt neliöllisen ja jaksolliset termit

seg-fa8a4b082cd5 = IAU:n kappaleorientaatio ja gravitaatioparametri neljällätoista lisätyllä aurinkokunnan kappaleella

seg-fc8d277aa2fd = Body::iau_rotation_et, kierto J2000:sta IAU:n kappaleenkiinteään koordinaatistoon Merkuriukselle, Venukselle, Jupiterille, Saturnukselle, Uranukselle, Neptunukselle, Plutolle, Phobosille, Deimosille, Iolle, Europalle, Ganymedeelle, Callistolle ja Titanille jokaisella vuosisatanopeudella, neliöllisellä termillä ja jaksollisella termillä, jotka kappaleella on tiedostossa pck00011, sekä samojen neljäntoista kappaleen gravitaatioparametrikenttä mu. Aurinko, Maa, Kuu ja Mars käyttävät muiden rivien omistamia perinteisiä vakioita, eikä niitä kateta

seg-29bad4bd8e09 = NAIF SPICE Toolkit (CSPICE N0067 spiceypyn kautta) pxform('J2000', 'IAU_<BODY>') tiedostolla pck00011.tpc, saman IAU:n pyörimismallin riippumaton toteutus, ja NAIF gm_de440.tpc GM:lle, fikstuurit tuotettuna erillisellä ohjelmalla, joka ei kutsu Kshana-koodia (tests/fixtures/body_orientation_spice_oracle/, NOTICE.md). Ennakkorekisteröity 154bc54 (alkuperäisellä { "1e-9" } rad -kynnyksellä c2434204) ennen kuin tuore ajankohtafikstuuri oli olemassa; tuore fikstuuri luotiin uudelleen riippumattomasti ja on tavu tavulta identtinen. GM on DE440:n transkriptio, joka on tarkistettu julkaistua tiedostoa vasten, ei GM:n riippumaton määritys. Tulokset: docs/design/evidence/mr08-body-orientation/RESULTS.md

seg-87ab655f8270 = Paikannus minkä tahansa aurinkokunnan kappaleen ympärillä paikallisella satelliittitähdistöllä ja syväavaruuslinkillä Maasta

seg-d9b1b0ac97d3 = Tyyppi <c1/>: nimellä valitun kappaleen ympärillä oleva kiertäjä tai pintalaskeutuja navigoi yksisuuntaisilla pseudoetäisyyksillä kappaleen ympärillä olevasta Walker-navigointisatelliittitähdistöstä (kahden kappaleen radat kappaleen J2-sekulaarisella ajautumalla, tuntematon käyttäjän kello) ja valinnaisella kellovapaalla kaksisuuntaisella etäisyydellä Maasta, Maan suunta ja etäisyys analyyttisestä efemeridistä jokaisena ajankohtana; kappaleen pallon estämät näkölinjat ja pinnan korkeuskulmamaski; ajankohtaa kohti pelkän satelliittitähdistön GDOP ja PDOP (orbit::dop), muodollinen paikkaepävarmuus Maa-rivin kanssa ja ilman sitä sekä siemennetyt Gauss–Newton-ratkaisut (batch_ls::gauss_newton) kumpaakin tapaa, kappaleelta Maahan kulkevalla valoajalla ja edestakaisella ajalla

seg-3538c49df107 = Suljetut muodot ja itsejohdonmukaisuus: Keplerin kolmas laki releen jaksolle, radan säde ja pinnan säde pysyvät vakioina ajon yli, mittauksen lisääminen ei koskaan kasvata muodollista epävarmuutta, ja siemennetyt virheet ovat yhdenmukaisia kovarianssin kanssa. Relerata ohittaa kolmannet kappaleet (Jupiterin vetoa Europan ympärillä oleviin releisiin ei mallinneta), kohina on Gaussin jakaumaa ilmoitetuilla tasoilla ja mittausmalli on hetkellinen, joten tätä ei ole validoitu minkään tehtävän navigointidataa vasten

seg-281b680a9897 = Walker-satelliittitähdistön geometria ja GPS:n, Galileon ja GLONASSin julkaistut nimellispaikat

seg-cba54289b732 = Tyypin <c1/> generaattorit: Walker delta- ja star-kuviot T/P/F-käytännössä (solmuväli 360/P tai 180/P, tasonsisäinen väli { "360" }·P/T, tasojen välinen vaihesiirtymä { "360" }·F/T) sekä GPS:n perus- ja laajennettava 24 paikan, Galileon ja GLONASSin esiasetukset, rakennettuina niiden julkaistuista nimellis-elementeistä ja sijoitettuina Maahan kiinnitettyyn koordinaatistoon Greenwichin tuntikulmalla, jonka niiden dokumentit ilmoittavat

seg-bdf83007af50 = Julkaistut virastojen dokumentit: Galileo Open Service Service Definition Document issue { "1.1" } (European GNSS Service Centre) Tables { "1" } ja { "23" }, vertailusatelliittitähdistö ajankohtana 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edition { "5.1" } ({ "2008" }) section { "5.2" }, paikkakaava solmun pituuspiirille ja leveysargumentille; GPS Standard Positioning Service Performance Standard 5th edition (April { "2020" }) Tables 3.2-1, 3.2-2 ja 3.2-3, mukaan lukien maajäljen päiväntasaajan ylityksen sarake, joka on riippumaton ilmoitus Maahan kiinnitetystä geometriasta, jonka esiasetuksen on toistettava. Validoi generaattorit ja transkription; BeiDoun keskiratavaihetta ja kallistettujen geosynkronisten ratojen solmuja ei ole julkaistu, eikä niitä kateta

seg-0f1d49ab5d51 = GPS-perustähdistön globaali tarkkuuden heikkenemiskerroin

seg-83775b77f5ca = Peittomoottori <c1/> GPS:n 24 paikan perusesiasetuksella GPS Standard Positioning Service Performance Standardin (SPS PS) liitteen B ehdoilla (yksi tähtivuorokausi, { "287" } viiden minuutin askelta, { "4" } x { "4" } asteen globaali ruudukko leveyspiirin kosinilla painotettuna, kaikki näkyvissä, { "5" } asteen maski, yksi vastaanottimen kello): globaali HDOP-jakauma, PDOP:n mediaani ja PDOP enintään 6 -saatavuus globaalisti ja pahimmassa pisteessä

seg-6fb3c2028c4a = GPS SPS PS 5th edition (April { "2020" }) Appendix B sections B.3.2.2 ja B.3.2.3, täysin miehitetyn 24 paikan perustähdistön julkaistu globaalin keskiarvon HDOP-jakauma (mediaani { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, keskiarvo { "0.96" }), Table 3.8-1 (PDOP-saatavuus) ja Table B.3-1 (heikentyneen satelliittitähdistön ensemble-PDOP, käytetty vain ylärajana) sekä käsin johdettu suljettu muoto yhdelle ajankohdalle. Täyden satelliittitähdistön VDOP- ja PDOP-jakaumat on julkaistu vain kuvana, joten PDOP lukitaan yksipuolisesti; pahin aika–paikka-piste (tässä HDOP { "2.40" } ja VDOP { "5.22" }, julkaistuna { "2.49" } ja { "5.43" }) riippuu ruudukosta ja raportoidaan, ei lukita

seg-7d4d7200cbca = Peitto- ja tarkkuuden heikkenemiskerroinkartat mielivaltaisille usean satelliittitähdistön malleille laajassa mittakaavassa, minkä tahansa keskuskappaleen ympärillä

seg-b78b79e9fae4 = Tyyppi <c1/> kahden lukitun tapauksen ulkopuolella: eksplisiittiset ja moniverhoiset mallit, useita satelliittitähdistöjä ajoa kohti yhdellä vastaanottimen kellolla tähdistöä kohti, Maa, Kuu ja Mars kappalevakioista, BeiDoun esiasetus (keskiratavaihe ja { "118" } asteen E kallistetun geosynkronisen radan ylitys mallinnettuina), soluittain näkyvissä olevat satelliitit, GDOP, PDOP, HDOP, VDOP ja saatavuus, harvennetut maajäljet sekä sub-satelliittileveyspiirin näkyvyyden esisuodatin, joka ajaa { "5" } 000 satelliitin mallin { "10" } asteen ruudukolla sekunnin murto-osassa

seg-2c0f28426ab9 = Sisäinen johdonmukaisuus: raa'an voiman korkeuskulmaskannaus, käsin lasketut ja orbit::dop-palautukset sekä suljetun muodon Walker- ja geosynkroninen geometria. Kahden kappaleen radat valinnaisella sekulaarisella J2:lla, pallomainen kappale paikallisella pystysuoralla säteen suuntaisena, vain geometrinen näkyvyys (ei signaalitehoa, satelliitin terveyttä, maastoa tai kolmannen kappaleen häiriötä), ja järjestelmien välinen suhteellinen vaihe otettuna eri vertailuajankohdista, joten se ei ole minkään päivämäärän tilannekuva. { "0.30" }-katselmus, havainto (pysyy MODELLED): esiasetukset täyttävät julkaistut yksipuoliset DOP-saatavuuden alarajat (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) { "100" } %:n tasolla, mutta kun moottorin PDOP kaksinkertaistetaan työkopiossa, ne silti täyttyvät (pahin piste { "99.36" } %), joten alarajat eivät pysty havaitsemaan edes { "100" } %:n virhettä tällä rivillä lasketussa suureessa; niiden kiristäminen ajon jälkeen olisi jälkikäteinen toleranssi. Ylentäminen edellyttää DOP-arvojen kaksipuolista vertailua identtisellä geometrialla ennalta asetetulla toleranssilla. { "0.30" } kierros { "2" } (tests/coverage_dop_full_oracle.rs, ennakkorekisteröity add671d6), havainto (pysyy MODELLED): Orekit { "12.2" } -paikat, korkeuskulma, atsimuutti ja maajäljet sekä gnss_lib_py { "1.0.4" } GDOP/PDOP/HDOP/VDOP (yhteinen kello) ja numpy-käänteismatriisi (yksi kello tähdistöä kohti) ovat yhtä mieltä kaikilla kynnyksillä Galileon, GPS:n, BeiDoun, Galileo+GPS:n (yksi kello kummallekin) ja 1584 satelliitin Maa-mallin kohdalla (DOP { "2e-14" } suhteellisen virheen sisällä, identtinen ratkaisu, saatavuus ja näkyvyyslukumäärät). Kuu- ja Mars-malleissa elementit, paikat, näkyvyys ja jäljet täsmäävät, mutta DOP ylittää ennalta asetetun { "1e-9" } suhteellisen kynnyksen soluissa, joiden suurin PDOP on { "1434" } tai enemmän (jopa { "8e-6" }), ja { "4" } solua eroaa yhden ratkaisuajankohdan verran numeerisesti singulaarisella geometrialla (moottorin pivot { "1e-10" } numpyn astetta vastaan), joten riviä ei ole validoitu. { "0.30" }-tarkistukset: TDOP/GDOP-vertailukello on nyt pienimmän numeron näkyvissä oleva tähdistö (constellation-multi-gnss-coverage globaali GDOP max { "2.2236" } -> { "2.1205" }, keskiarvo { "1.122" } -> { "1.131" }), ja tähdistökohtaiset näkyvien lukumäärät summataan kokonaislukuina

seg-278c77438493 = Ketjutettu tehtävä skenaariotyyppien yli yhdellä yhteisellä aikajanalla

seg-3dcfb26f6234 = Tyypin <c1/> vaiheet: jokainen vaihe ajaa yhden tai useamman olemassa olevan tyypin skenaarion funktiolla run_toml, lukee niiden tulosteet nimettyihin kanaviin (kellon aikavirhe ja suoja, keskimääräinen efektiivinen kantoaalto–kohinatiheyssuhde ja seurantalattia, pystysuora suojaustaso ja hälytysraja, paikkavirhe, seuraavat satelliitit, hälytyslaput) tyyppikohtaisilla esiasetuksilla tai eksplisiittisillä tulospoluilla, sijoittaa ne vaiheen alkuun ja pitää ne yhteisellä ruudukolla, vaiheiden rajoilla ja tapahtumilla; tila siirretään eteenpäin carry-toiminnolla (kanava jatkuu edellisen vaiheen loppuarvosta), handoff-toiminnolla (edellisen vaiheen numero kirjoitetaan seuraavaan skenaarioon) ja end_at-toiminnolla (vaihe päättyy ajon laskemaan aikaan, kuten harhautusvalvonnan havaitsemisaikaan); kampanjatiiviste ja yhteenvetotiiviste jokaisen jäsentuloksen yli

seg-fd018ef7bc3b = Koostamisidentiteetit saman tyypin erillisajoja vastaan: yksivaiheinen kampanja toistaa erillisajon tulosteen bitti bitiltä, siirretty offset on yhtä suuri kuin edellisen ajon oma viimeinen näyte, ja end_at-toiminnolla päätetyn vaiheen pituus on täsmälleen ajon havaitsemisaika. Additiivinen siirto vaiheen rajan yli ja nollannen asteen pito ovat mallinnusvalintoja, ja kukin vaihe on yhtä hyvä kuin sen ajanut tyyppi; mitään ketjutettua tehtävää ei ole tarkistettu mitattua vasten

seg-ad6105af464c = Parametripyyhkäisyt ja siemennetyt Monte Carlo -ensemblet minkä tahansa skenaariotyypin yli

seg-65a8361b4a22 = Jammertest-pisteytys: vastaanottimen loki pisteytetään jokaista ajoitettua testiä kohden (havaitsemisviive, havaitsematta jääneet hälytykset, väärät hälytykset, palautumisaika) julkaistua testisuunnitelmaa vastaan

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA:n testiluettelo ja lähetyssuunnitelma (MIT, haettu kiinnitetyllä SHA-256-tiivisteellä, ei koskaan mukaan kopioituna) luetaan ajoitettuna totuutena luettelotunnukset säilyttäen; receiver-trust-ajo pisteytetään testeittäin (ensimmäinen hälytys miinus suunniteltu alku, havaittu/myöhäinen/ohi mennyt toleranssia vasten, aika ensimmäiseen hälytyksettömään jaksoon, hälytykset jokaisen ajanjakson ja sen suojavälin ulkopuolella), ja allekirjoitettu todistepaketti kuljettaa tuloskortin. Aikataulu koostuu suunnitelluista ajanjaksoista, ei tallennetuista lähetysajoista

seg-49b912adb7a9 = Suunnitelman ajanjaksojen lukumäärät testialueittain ({ "76" }, { "77" } ja { "45" } ajanjaksoa, joista { "61" }, { "63" } ja { "32" } lähettää) laskettiin riippumattomasti skriptillä samasta JSON-tiedostosta; { "2024" }-aineiston attack_log-ikkunat tapahtumien totuutena, tiedoston xval/jammertest-score/PREREGISTRATION.md mukaisesti (kirjattu yksinään, c2e6d3b, ennen pisteyttimen ajoa). Ensimmäinen ja ainoa ajo (xval/jammertest-score/RESULTS.md): rekisteröity vähimmäisaineistosääntö FAILED ({ "4" } pisteytettävää häirintäikkunaa { "4" }:stä { "12" } UBX-kansiosta, kun vähimmäisvaatimus oli { "10" } ikkunaa { "2" } kansiosta: { "5" } kansiota hylättiin lähtötasosäännön perusteella, { "3" } UBX-lokissa on vain GPS-viikon aika), joten kynnyksiä B1–B4 ei voida arvioida; mitään ei löysätty eikä ajettu uudelleen. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, kirjattu yksinään, vain aineiston käsittely: pelkkää GPS-aikaa sisältävät lokit sijoitettiin päivämäärän mukaan, { "12" } vain CSV-tiedostoja sisältävää kansiota, liikkuvan alustan istunto liikkuville roverreille; samat kynnykset ja vähimmäisaineistosääntö): { "14" } kansiota { "24" }:stä säilytettiin, mutta pisteytettäviä häirintäikkunoita oli { "7" }, vähimmäisaineistosääntö ei jälleen täyttynyt, mitään kynnystä ei voida arvioida (RESULTS-v2.md). Ajoitettu totuus: suunniteltu ajanjakso ei ole lähetystallenne, ohi mennyt tapahtuma voi olla testi, jota ei koskaan ajettu, viive lasketaan suunnitellusta alusta, ja puhdas tarkoittaa suunniteltujen ajanjaksojen ulkopuolista. Mittausalueen monitorien tekemä havaitseminen ei kerro mitään pienitehoisesta harhauttajasta. Yksi vastaanotintyyppi (u-blox ZED-F9P). { "2025" }-vuoden SimulaMetin NMEA-aineistoa ei käytetä (lisenssiä ei ole ilmoitettu, tilausmuurin takana)

seg-0d227bbcb5f1 = Testipenkin vienti (kshana bench-export): Maahan kiinnitetyt, geodeettiset ja paikallisen nopeuden sarakkeet, asentosarakkeet ja NMEA { "0183" } -tuloste

seg-c6a6e08afadd = Liike-CSV:n Maahan kiinnitetyn koordinaatiston paikka, geodeettinen paikka, Maahan kiinnitetyn koordinaatiston nopeus, suunta/nousu/kallistus ja UTC-sarakkeet sekä NMEA GGA/RMC -sanomat, kirjoitettuna synteettisistä skenaarioista (gnss-ins mukaan lukien automotive-urban-canyon, jamming, gnss-sim). Vain liike ja tapahtumat; signaalia ei kirjoiteta, eikä mitään simulaattorin tai vastaanottimen suorituskykyä väitetä.

seg-f953ad11fe08 = MITÄ TARKISTETAAN ULKOISESTI, suppeasti ilmaistuna: pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } ja scipy { "1.18.1" } vasten, ajettuna skriptillä scripts/gen_testbench_ref.py { "4" } synteettisellä skenaariolla, toleranssit kiinnitettynä ennen ensimmäistä vertailua (kukin kirjoittajan pyöristyksen pahin tapaus): Maahan kiinnitetyt sarakkeet vastaavat geodeettisten sarakkeiden WGS { "84" } -muunnosta (pahin { "1.3e-4" } m, kynnys { "3e-4" }) ja käänteismuunnosta ({ "1.3e-9" } astetta, kynnys { "2e-9" }; korkeus { "1.3e-4" } m, kynnys { "3e-4" }) jokaisella rivillä; PROJ:n toposentrisellä operaatiolla pohjois-itä-alas-muotoon kierretty Maahan kiinnitetty nopeus vastaa moottorin todellista NED-nopeutta ({ "7.5e-5" } m/s, kynnys { "2e-4" }); suunta, nousu ja kallistus vastaavat scipyn yaw-pitch-roll-arvoja moottorin todellisesta kvaternionista ({ "5.0e-7" } astetta, kynnys { "1e-6" }); jokainen NMEA-sanoma jäsentyy pynmea2:ssa kelvollisella tarkistussummalla, ja sen dekoodattu paikka ({ "1.2e-3" } m, kynnys { "5e-3" }), korkeus, nopeus, kulkusuunta ({ "5.0e-4" } astetta, kynnys { "1e-3" }) ja aika vastaavat liikearvoja; UTC-sarake vastaa riippumatonta päivämäärän ja ajan laskentaa. Tarkistettujen CSV- ja NMEA-tavujen tarkka SHA-256 on kiinnitetty. MITÄ EI TARKISTETA: skenaarion todellista rataa itsessään (ajoprofiili ja sen integrointi); konventioita (suunta on rungon kääntökulma, ei kulkusuunta, ja se poikkeaa siitä enintään noin { "77" } astetta skenaariossa automotive-urban-canyon; GGA:n laatukenttä, satelliittien lukumäärä ja HDOP ovat paikkamerkkejä); lukeeko mikään laboratoriosimulaattori tiedostot tarkoitetulla tavalla; mitään simulaattorin tai vastaanottimen suorituskykyä. Oraakkelit tarkistavat muunnokset ja koodaukset, eivät skenaarion fysiikkaa. Paikallisen koordinaatiston käsittely tarkistetaan vain nopeuden kierron sekä NMEA-nopeuden ja -kulkusuunnan kautta (CSV:ssä ei ole paikallista paikkasaraketta).

seg-ee99388f7b15 = compliance (kshana compliance-report): kuvaus Kshanan tulosteista julkisten kehysten kohtiin pelkästään numeroin, täytettynä annetuista ajoista; tulos lasketaan jonkin ominaisuuden hyväksi vain, kun se sisältää kuvauksen nimeämän todisteen, tyhjä joukko ei todista mitään, ja sanamuoto on "tukee todisteita" (supports evidence for); raportti ei ole toteamus siitä, että jokin kehys täyttyisi, eikä kenenkään antama luokitus tai hyväksyntä.

seg-8659260fd38e = Viitteet tarkistettu skriptillä poimittua otsikkoindeksiä vasten, joka perustuu viitattuihin julkisiin asiakirjoihin, luettu 2026-10-10 (tests/compliance_references.rs). MITÄ TARKISTETAAN: { "49" } viitattua lauseketta, kohtaa, kappaletta tai otsikkoviitettä on olemassa viitatussa asiakirjassa, ja { "7" } viitattua URL-osoitetta aukesi merkittynä päivänä ({ "2" } toisen reitin kautta); negatiiviset verrokit epäonnistuvat. MITÄ EI TARKISTETA: että mikään parafraasi, kuvaus tai aukko on oikein; EN { "16803" } -standardin lausekkeet (maksullinen, vain luettelon teksti); myöhemmät versiot; indeksi ei ole riippumaton toteutus.

seg-98c360d82d56 = Merenkulun integraatiot: Signal K -liitännäinen, OpenCPN:n portin virta ja pisteytyspaneeli, viitekäännös

seg-7af9ce566646 = Luottamuspistemäärä, kaista, syyt, portin tila ja vastaanottimen ilmoittama paikka julkaistaan polussa navigation.gnss.kshana Signal K -palvelimessa varoitus-, hälytys- ja normaali-ilmoituksin (integrations/signalk); porttitettu NMEA-virta, jossa paikka on merkitty virheelliseksi luottamuksen romahtaessa ja jossa on yksi PKSHT-sanoma kierrosta kohden, jonka portti itse tai pieni välittäjä tarjoaa OpenCPN:lle TCP:n yli, sekä OpenCPN:n natiivi pisteytyspaneeli, joka lukee PKSHT-sanoman (integrations/opencpn); sekä systemd-yksiköt ja kontti, jotka ajavat porttia (deploy/reference-build). Kun nämä näyttävät tulosteen, siinä on ohjeellinen ilmoitus: Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-475397d05dd0 = <s1>receiver_trust (live: portti, sen TCP-kuuntelija, PKSHT); crate-paketin ulkopuolella: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-välittäjä, C++-natiiviliitännäinen), deploy/reference-build (systemd-yksiköt, kontti)</s1>

seg-89ab9ef155eb = BOC({ "1,1" })-seuranta: DLL-skaalaus ja bump-jump-ambiguiteetin ratkaisu (valinnainen)

seg-ef24be9b5917 = iq::track::LoopConfig-rakenteen boc-kenttä (valinnainen, oletuksena None): kolme DLL-diskriminaattoria skaalataan lukemaan koodivirhe chippeinä yksikkökaltevuudella sini-BOC({ "1,1" }) -pääpiikissä, ja bump-jump-monitori hyvin aikaisilla ja hyvin myöhäisillä korrelaattoreilla yhden alikantoaallon puolijakson ({ "0.5" } chippiä) etäisyydellä hyppäyttää koodin NCO:n kohti pääpiikkiä, kun ylös/alas-laskuri saavuttaa arvon N (oletuksena { "8" }). Ilman valintaa jokainen tuloste on ennallaan.

seg-416ce4dfc6f5 = Sisäinen johdonmukaisuus syötettyä totuutta ja suljettuja muotoja vasten, kynnyksin, jotka on ennakkorekisteröity versiossa 6b68f6cc (docs/design/evidence/boc-bump-jump/). BeiDoun B1C-datasignaali (PRN { "19" }, { "5" } MS/s), jonka tuottaa iq::scene: kun valinta on pois, sivupiikistä alkava seuranta pysyy väärään lukittuna ennustetussa kohdassa ±({ "0.5" } + d/4) chippiä (mitattu ±{ "0.549" }); kun valinta on päällä, yksi hyppy kohti pääpiikkiä kohdassa { "0.08" } s ja myöhäisen ikkunan RMS { "0.0008" } chippiä tasolla { "45" } dB-Hz ja { "0.0048" } chippiä tasolla { "35" } dB-Hz; ei hyppyä pääpiikistä tasoilla { "35" }, { "40" } ja { "45" } dB-Hz { "4" } sekunnin aikana; skaalattu EMLP-kaltevuus { "0.94" }–{ "0.99" } näytteistetyllä signaalilla (skaalaamaton { "3.6" }–{ "3.8" }). Pelkkä bump-jump-ilmaisin korrelaattorikolmikoilla, joissa oli tarkka BOC({ "1,1" })-kohinakovarianssi, ei tehnyt yhtään väärää hyppyä { "100 000" } päivityksessä tasoilla { "25" }–{ "45" } dB-Hz ja havaitsi { "1000" } sivupiikkialkua { "1000" }:sta tasolla { "35" } dB-Hz. NOT MET (löydös F1): skaalauksen ennakkorekisteröity yksikkötestiruudukko sisältää siirtymiä diskriminaattorien lineaarisen alueen ulkopuolelta, missä skaalatut lukemat ohittavat siirtymän enintään { "48" } %. MITÄ EI TARKISTETA: kenttä-IQ, kaistarajoitetut etupäät, yhdistetyt MBOC/QMBOC-replikat ja mikään ulkoinen vastaanotin.

seg-2c32955cbfb3 = IQ:n ionosfäärin tuikekanava (Cornellin malli) mitattua { "50" } Hz:n GPS L1 -tuikintaa vasten

seg-2fdcb373ab25 = iq::channel::scint, Cornellin tuikintamalli (Rice-intensiteetti, toisen asteen Butterworth-spektri, vaihe arg z), jota ohjataan mitatun ikkunan S4-arvolla ja intensiteetin dekorrelaatioajalla, verrattuna siihen, mitä se tuottaa näiden kahden syötteen lisäksi; realdata::scint50 lukee mitatun lokin, poistaa siitä trendin ja ajaa vertailun.

seg-bdc9fe963c5c = Mitattu data kynnyksin, jotka on ennakkorekisteröity versiossa b6ccb499 (xval/scint-malindi/): Zenodo-tietue { "16941224" } (INGV, Malindi, { "18" }. maaliskuuta { "2023" }, GPS PRN { "26" }, { "50" } Hz:n intensiteetti ja kantoaallon vaihe, CC BY { "4.0" }, SHA-256 tarkistettu). { "22" } kelpuutettua { "60" } sekunnin ikkunaa (N1 täyttyi). MET: intensiteettijakauma (Kolmogorov–Smirnov D { "0.0415" }, kynnys { "0.05" }) ja S4:ään sidottu vaihetuikinta (mitatun ja mallin sigma-phi:n mediaani { "0.779" }, kynnys 2/3–3/2). NOT MET (löydös F1): mallin syvien häipymien osuus on { "2.38" }-kertainen mitattuun verrattuna (kynnys { "0.5" }–{ "2" }) ja sen keskimääräinen häipymä { "3.51" }-kertaisesti pidempi (kynnys 2/3–3/2). Löydös F2: rekisteröity käsittely lukee mallin kiedotun vaiheen, minkä itsetarkistus paljasti; B3 toistettuna jälkikäteen vaihe avattuna antaa { "0.804" }. MITÄ EI TARKISTETA: muut yöt, asemat, leveysasteet tai signaalit; vastaanottimen kohina mallissa. Rivi pysyy tasolla MODELLED.

seg-160507ac3702 = Solukeskiarvoistava CFAR-valinta IQ-signaalin haussa

seg-7c0a1adc9ae6 = iq::acq::ca_cfar ja ca_cfar_cells (valinnainen): hakuruudukon solua verrataan oman Doppler-rivinsä vertailusolujen keskiarvoon (suoja- ja askelviiveet, jaksolla ympäri kiertäen), kertoimella alpha, joka asetetaan suljetun muodon CA-CFAR-väärähälytystodennäköisyydestä M epäkoherentille lohkolle (ca_cfar_pfa, ca_cfar_alpha). Näytetehoilmaisin pysyy oletuksena, ja jokainen olemassa oleva tuloste on ennallaan.

seg-ba35daac2aed = Suljettu muoto, kynnyksin, jotka on ennakkorekisteröity versiossa 3724aefa (docs/design/evidence/acq-cfar/). CA-CFAR-väärähälytystodennäköisyys Gamma(M)-soluille tarkan mallin Monte Carlo -ajoa vasten: { "18" } tapausta { "18" }:sta { "3" } binomisen sigman sisällä. Jokaisella iq::acq-hakujen solulla (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } solua kussakin) suunnitteluarvolla { "1" } %: { "0.977" } % ja { "0.969" } % gaussisella kohinalla sekä { "1.006" } % ja { "0.999" } % 2-bittisesti kvantisoidulla kohinalla (M = { "1" } ja { "4" }; kynnys plus tai miinus { "20" } %); päätökset ennallaan, kun syöte skaalataan. NOT MET (löydös F1): kohinattomalla 2-bittisellä signaalilla havaitseminen ja sen solu ovat oikein, mutta { "1.28" } % piikin rivin piikin ulkopuolisista soluista (kynnys { "1" } %) ylittää kynnyksen koodin deterministisissä korrelaation sivukeiloissa. MITÄ EI TARKISTETA: muut CFAR-variantit, kaksiulotteiset ikkunat, kaistarajoitetut etupäät, kenttädata.

seg-5bd3bf0c22a7 = Spektrimalli: GLONASS-, BeiDou- ja Galileo E6 -kaistat (valinnainen)

seg-9c16189c63ac = spectrum::default_band ratkaisee pelkän nimen perusteella (MORE_BAND_NAMES) GLONASSin L1OF:n ja L2OF:n jokaisella FDMA-kanavalla K = -7–{ "6" } (BPSK, { "0.511" } Mchip/s), BeiDoun B1I:n (BPSK({ "2" })), B1C:n (MBOC(6,1,1/11)), B2a:n ja B3I:n (BPSK({ "10" })) sekä Galileon E6:n (BPSK({ "5" })), niiden rajapintakuvausasiakirjojen kantoaalloilla ja vähimmäisvastaanottotehoilla; oletuskaistajoukko ja jokainen olemassa oleva tuloste ovat ennallaan.

seg-6d674bc4b40a = Julkaistut rajapintakuvausasiakirjat ja suljetut muodot, kynnyksin, jotka on ennakkorekisteröity versiossa 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD Edition { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } ja B3I { "1.0" }, Galileo OS SIS ICD Issue { "2.1" }. MET: jokainen kantoaalto, chip-nopeus ja vastaanottoteho kuten ne on litteroitu ({ "28" } GLONASS-kanavaa), BPSK:n ensimmäiset nollakohdat chip-nopeudella, B1C-yhdistelmä yhtä suuri kuin MBOC(6,1,1/11), kuten sen ICD:n tehotaulukko antaa, C/N0-polun identiteetti ja tavu tavulta identtiset spektriskenaariot. NOT MET: yksikköalakynnys, joka oli saavuttamaton sellaisena kuin se oli kirjoitettu (löydös F1; alat vastaavat suljetun muodon kaistansisäistä osuutta), sekä IQ-kerroksen B1I- ja B1C-aaltomuotojen binikohtainen yhtäpitävyys mallin verhokäyrän kanssa ({ "1.26" } ja { "1.56" } dB kynnyksellä { "0.5" } dB, löydös F2; GLONASS { "0.07" } dB), koska Gold- ja Weil-koodien viivaspektrit ovat epätasaisia; kaistakeskiarvoistettuna pääkeilat täsmäävät { "0.25" } dB:n sisällä. MITÄ EI TARKISTETA: tallennettu IQ, muut signaalit, järjestelmän sisäinen häiriö.

seg-63b7da996265 = BeiDou B1I:n ensisijaiset etäisyydenmittauskoodit riippumatonta generaattoria vasten

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits ja b1i: BDS-SIS-ICD-B1I-3.0:n Gold-koodit typistettyinä { "2046" } chippiin, PRN { "1" }–{ "63" }, sellaisina kuin IQ-kerros ne tuottaa, hakee ja seuraa.

seg-690d6ea43d80 = GNSS-SDR { "v0.0.19" } (tagi { "v0.0.19" }, commit 1ddd4562), saman ICD:n riippumaton avoimen lähdekoodin toteutus: sen beidou_b1i_code_gen_int, käännettynä erillisenä, tuotti kaikki { "63" } koodia. Vain sen ohjelmatuloste on kirjattu: tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt, 64 chipin etuliite ja kunkin 2046 chipin koodin SHA-256. Tuo tuloste on ne BeiDou B1I -PRN-koodit, jotka julkinen BDS-SIS-ICD-B1I-3.0 määrittelee; varastossa ei ole GNSS-SDR:n lähdekoodia eikä binääriä. Kynnys ennakkorekisteröity versiossa 911106d1 (xval/beidou-b1i-gnss-sdr/): kaikki { "2046" } chippiä kaikista { "63" } PRN-koodista identtisiä, ei inversiota, siirtoa tai uudelleennimeämistä. Tulos: { "63" } { "63" }:sta identtistä; vakiopaketti luotiin uudelleen tuoreesta { "v0.0.19" }-checkoutista (lähdetiedoston SHA-256 kirjatun mukainen) ja on tavu tavulta identtinen. MITÄ EI TARKISTETA: NH20-toissijainen koodi, GEO-PRN-luettelo, kantoaalto ja chip-nopeus.

seg-b4787b04338e = GPS L1C:n etäisyydenmittaus- ja peittokoodit IS-GPS-800J:n painettuja tarkistussarakkeita vasten

seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits ja l1c_o_bits: L1CP- ja L1CD-Weil-etäisyydenmittauskoodit (laskettu Legendre-jono, Weil-indeksi, ennen chippiä p lisätty laajennusjono) ja L1CO S1 -peittokoodit, PRN { "1" }–{ "63" }.

seg-3f4bbdd3666b = IS-GPS-800J (01-AUG-2022, jakelulauselma A), tarkistussarakkeet, jotka se painaa generaattorin parametrien viereen: Taulukko 3.2-2 jokaisen L1CP- ja L1CD-koodin alku- ja loppu-{ "24" } chippiä, Taulukko 3.2-3 jokaisen L1CO-koodin alku- ja loppu-{ "11" } bittiä, Taulukko 6.2-1 pituuden 10223 Legendre-jono; litteroitu skriptillä scripts/extract_is_gps_800_tables.py PDF-tiedostosta (SHA-256 c4aad710...). Kynnykset ennakkorekisteröity versiossa fe372e26 (docs/design/evidence/l1c-codes/): { "252" } { "252" }:sta saraketta, { "63" } { "63" }:sta peittokoodia ja { "10 223" } { "10 223" }:sta Legendre-bittiä identtisiä; poiminnan --check läpäisee; negatiivinen verrokki epäonnistuu uudelleennimetyillä, käännetyillä ja siirretyillä koodeilla. MITÄ EI TARKISTETA: itse generaattorin parametreja (ne tulevat samoista taulukoista), painettujen sarakkeiden välisiä chippejä, TMBOC-alikantoaaltokuviota ja L1CO S2 -koodeja.

seg-5cba09089e09 = LunaNetin AFS-I- ja AFS-Q-ensisijaiset koodit LSIS-AFS V1.0:n painettuja tarkistussarakkeita vasten

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits ja afs_q_primary_bits (signaalien nimet lunanet-afs-i ja lunanet-afs-q komennossa kshana iq): AFS-I-Gold-koodi ({ "2047" } lyhennettynä syklillä { "2046" }:een, G2 viivästetty PRN-koodin mukaan) ja AFS-Q-Weil-ensisijaiskoodi (laskettu Legendre-jono, Weil-indeksi, ennen chippiä p lisätty laajennusjono), PRN { "1" }–{ "210" }.

seg-330ed84e8e78 = LSIS-AFS V1.0:n painettuja taulukoita vasten (merkitty määrittelyssä TBC): LunaNet Interoperability Specification V5, Applicable Document { "1" } Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS) V1.0, { "29" }. tammikuuta { "2025" } (NASA; PDF:n SHA-256 { "986e0795" }...), tarkistussarakkeet, jotka se painaa generaattorin parametrien viereen: Taulukot C-1–C-5 ja D-2–D-6 jokaisen AFS-I- ja AFS-Q-koodin ensimmäiset ja viimeiset { "24" } chippiä, Taulukko D-1 pituuden 10223 Legendre-jono; poimittu skriptillä scripts/extract_lunanet_afs_tables.py (xval/lunanet-afs/oracle/). Kynnykset ennakkorekisteröity versiossa b3ba5d5 (xval/lunanet-afs/PREREGISTRATION.md) ennen generaattorin olemassaoloa: B1 { "420" } { "420" }:sta, B2 identtinen, B3 { "420" } { "420" }:sta. Asiakirja merkitsee koodi taulukkonsa { "{" }LSIS-TBC{ "}" } ja toteaa niiden olevan vain testaukseen ja integrointiin, joten tämä validoi rakenteen kyseisen painoksen taulukoita vasten, ei myöhemmän. Ennakkorekisteröity väite painetusta G2:n alkutilasta (B1b) oli esitetty väärään suuntaan ja on NOT MET ({ "0" } { "210" }:stä), kiinnitetty; korjattu suhde ({ "2047" } miinus viive) pätee { "210" } { "210" }:stä ja on kirjattu jälkikäteen tehdyksi. MITÄ EI TARKISTETA: itse generaattorin parametreja (samat taulukot), painettujen sarakkeiden välisiä chippejä, kolmannen tason koodia, viestikerrosta ja LDPC-koodausta.

seg-7b1ae0c7ca28 = LunaNet AFS:n kolmannen tason koodit ja viestikerros (SB1 BCH, CRC-24Q, lomittaja) LSIS-AFS V1.0:aa vasten

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkronointikuvio, SB1 BCH({ "51,8" }) -enkooderi ja 256 hypoteesin dekooderi, CRC-24Q, { "60" } x { "98" } -lohkolomittaja, symbolivirran tarkistin (kshana lunanet-afs-check) ja testivirran generaattori paikkamerkkialikehyksin. Alikehysten { "2" }–{ "4" } nopeuden 1/2 LDPC-koodausta ei ole toteutettu (sen matriisit ovat erillisessä liitteessä).

seg-b6f39f180fdd = LSIS-AFS V1.0 (kuten yllä): pituuden 1499 Legendre-jono (Taulukko E-1, identtinen) ja kolmannen tason ensimmäiset ja viimeiset { "24" } chippiä (Taulukot E-2–E-6: { "419" } { "420" }:stä saraketta identtisiä; asiakirja painaa samat viimeiset { "24" } chippiä, A14850, koodeille PRN { "147" } ja PRN { "151" }, ja generaattori toistaa PRN { "151" }:n arvon, joten PRN { "147" }:n merkintä on todennäköisimmin painovirhe; kynnys { "420" } { "420" }:stä on NOT MET ja ohi meno on kiinnitetty); SB1-koodin kuvan { "8" } työstetty esimerkki (yksi esimerkki: 0x045 koodautuu muotoon 0x229F61DBB84A0); CRC-24Q luettelon tarkistusarvoa 0xCDE703 vasten ASCII-merkkijonolle { "123456789" }; asiakirjan oma kehysaritmetiikka. Kynnykset ennakkorekisteröity versiossa b3ba5d5. Yksi kirjattu ohi meno ja yksi työstetty esimerkki viestikerrokselle, joten rivi pysyy tasolla MODELLED. MITÄ EI TARKISTETA: LDPC ja CRC-sanat alikehyksissä { "2" }–{ "4" }, viestin sisältö ja mikään tallennettu virta

seg-0d7b17524c04 = Standardipaketit: skenaariot pisteytettynä ennen ajoa asetettuja kynnyksiä vasten

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): DHS Resilient PNT -kehyksen testiprofiilit tasoille { "1" }–{ "4" }, IMO MSC.1/Circ.1575:n tarkkuustasot ja eheyden arviointi sekä ICAO Doc { "9849" } Appendix F:n monitoroi, arvioi ja lievennä -paketit: jokainen testi ajaa mukana toimitetun skenaariotyypin ja vertaa tuloskenttiä paketissa asetettuihin kynnyksiin, ja testit, jotka tarvitsevat vastaanottimen lokin, on merkitty NEEDS INPUT eikä niitä pisteytetä.

seg-d9ea966abdd6 = Ei ulkoista skenaariotuloksille: jokainen paketin testi ajaa MODELLED-skenaariotyypin. Kynnykset ovat paketin laatijan ilmoittama profiili (DHS-kehys ei ilmoita arvoja; IMO:n tarkkuusrajat ovat MSC.1/Circ.1575:n Taulukko C-1, luettu kokonaan; ICAO-paketti seuraa ICAO:n omaa RFI Mitigation Plan -esitystä, koska Doc { "9849" } on maksullinen julkaisu eikä sitä luettu), kirjattu ennen yhtäkään pisteytettyä ajoa xval-tyylisiin PREREGISTRATION.md-tiedostoihin hakemistossa standards/. MET-kynnys kertoo, että mallinnettu skenaario täytti ilmoitetun kynnyksen, ei mitään tuotteesta

seg-8a8f2c85e0c3 = Laboratorion kiertomatkan todistepaketti (skenaario, testiolosuhteet, vastaanottimen loki, pisteytys)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) ja komennon kshana bench-export vastaanottimen lokin vienti kshana.test-conditions/1: allekirjoitettu paketti, joka kirjaa skenaarion tiivisteen, ilmoitettujen olosuhteiden tiivisteen, lokin tiivisteen ja pisteytyksen ilmoitettuja tapahtumia vasten, ja joka hylkää olosuhteet, jotka ovat ristiriidassa pisteytyksen tapahtumien kanssa, sekä lokin, jonka tiiviste ei ole ilmoitettu. Signaalia ei kirjoiteta, toisteta eikä ajoiteta.

seg-76da58fe670a = Ei ulkoista: paketti linkittää tiivisteet ja MODELLED-vastaanotinlokin pisteytyksen, tarkistettuna synteettisellä datalla (mukana toimitetun skenaarion viety NMEA käsiteltynä vastaanottimen lokina). Mitään laboratorioajoa ei väitetä

seg-a9189e4fe413 = IQ-seurantamoottori GNSS-SDR { "0.0.19" }:ää vasten riippumattomilla tallenteilla

seg-364de05e5b1b = Koko IQ-kerroksen seurantamoottori (iq::track komennon kshana iq track kautta: haun luovutus, korrelaattorit, NCO:t, toisen asteen { "15" } Hz:n Costas-PLL, ensimmäisen asteen { "2" } Hz:n kantoaaltoavusteinen EML-verhokäyrä-DLL, lukitusilmaisin ja C/N0-estimaattorit) GPS L1 C/A:lla tasoilla { "30" }–{ "45" } dB-Hz.

seg-c2a8434c32a8 = GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, Ubuntu { "24.04" } -paketti, ajettuna erillisenä ohjelmana; vain johdetut luvut kirjattu) seuraa samoja numpy-tallenteita (riippumattomia moottorista), molempia mitattuna analyyttistä totuutta vasten. Kynnykset ennakkorekisteröity versiossa 48edd4a5, muutettu ennen yhtäkään testitallennetta versiossa 1e4288c4 ({ "10" } Hz:n FLL vain sisäänvedon aikana molemmissa vastaanottimissa, sen jälkeen kun rekisteröity kalibrointi epäonnistui GNSS-SDR:n väärän luovutuksen vuoksi, löydös F3). MET tasoilla { "30" }, { "35" }, { "40" } ja { "45" } dB-Hz: kantoaallon värinä { "4.3" } %:n, koodin värinä { "4.6" } %:n sisällä sekä Dopplerin keskiarvo ja hajonta GNSS-SDR:n arvojen mukaiset. NOT MET: moottorin NWPR-C/N0 lukee { "2.3" }–{ "7.1" } dB GNSS-SDR:n SNV:n alapuolella (löydös F4, tunnettu NWPR-raja; sen M2M4 on { "0.06" } dB:n sisällä totuudesta); vaiheen lukitusilmaisimet eroavat määritelmänsä mukaan (F5); tasolla { "30" } dB-Hz GNSS-SDR luisti kahdesti ja moottori ei (F6). GNSS-SDR:n oma luovutus lukittui väärälle taajuudelle { "3" } kalibrointiajossa { "30" }:stä. MITÄ EI TARKISTETA: muut signaalit, databittien poisto, uudelleenhaku, kenttätallenteet. Rivi pysyy tasolla MODELLED.

seg-259d201c2ff8 = CRPA-antennivahvistukset häirintätyypissä riippumatonta numpy-uudelleenlaskentaa vasten

seg-192144c57783 = Häirintätyypin valinnainen [crpa]-osio: kanavakohtainen keila kohti kutakin satelliittia (nollan ohjaus häirittäjä nollana, tai MVDR kaavalla sigma^{ "2" } I + P_j a_j a_j^H), joka skaalaa kunkin linkin kohinaa tekijällä ||w||^{ "2" } ja häirittäjää tekijällä |w^H a_j|^{ "2" } ennen olemassa olevaa häirinnänestoyhtälöä C/N0:lle.

seg-232d040b575d = Riippumaton numpy-uudelleenlasku (xval/crpa-jamming/oracle.py, ei yhteistä koodia: numpy-ohjausvektorit, numpy.linalg.solve ja inv) jamming-demo-geometrian jokaiselle linkille 4-elementtisellä neliöryhmällä, molemmilla painotuksilla. Kynnykset ennakkorekisteröity versiossa 08d83b4d. MET: A1 (kaikki { "150" } skenaariotulosta tavu tavulta identtisiä ilman osiota, korjauksen jälkeen: ensimmäinen rakennus lisäsi crpa-yksiköt jokaisen häirinta-ajon yksikkötaulukkoon), A2 (yksi elementti vastaa ryhmän puuttumista { "1e-12" } dB:n tarkkuudella), A3 ryhmän kohinavahvistukselle ja tehokkaalle C/N0:lle ({ "912" } linkkipainotusta { "1e-9" } dB:n sisällä, pahin { "2.1e-14" } dB) sekä nollan ohjauksen häirittäjänollalle (alle -200 dB molemmilla puolilla), A4 (MVDR { "0.1" } dB:n sisällä nollan ohjauksesta JNR-arvolla { "80" } dB). NOT MET: A3 MVDR:n häirittäjävahvistukselle, { "194" } linkkiä { "456" }:stä yli { "1e-9" } dB:n { "0.36" }-siirrettävällä matematiikalla ({ "202" } isäntämatematiikalla; docs/revisions/STUDIO15-batch4-rebaseline.md) (pahin { "1.7e-6" } dB) residuaaleilla -100–-188 dB, missä float64:n kumoutuminen rajoittaa molempia toteutuksia (numpyn inv ja solve ovat keskenään eri mieltä { "169" } linkillä, pahin { "7.9e-7" } dB); näiden syöttämä tehokas C/N0 ei kärsi. MITÄ EI TARKISTETA: keskinäinen kytkentä, elementtien epäsovitus, laajakaistakäsittely, useat häirittäjät, mikään antennilaitteisto. Samojen yhtälöiden uudelleenlasku, ei ulkoinen oraakkeli; rivi pysyy tasolla MODELLED.
