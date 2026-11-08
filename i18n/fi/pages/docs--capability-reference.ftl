# docs--capability-reference: translations (fi)

seg-f4f59f19e091 = Ominaisuuskortit

seg-501d3a72ea43 = Eheys

seg-20db2c79b998 = Validoitu

seg-29e58493fdd4 = Mallinnettu

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

seg-1c37702cc5f2 = Radan propagointi ja määritys

seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + häiriöt, eräkohtainen/peräkkäinen OD

seg-c84585f43297 = AIAA 2006-6753 SGP4-verifiointivektorit

seg-50c545872e4f = Numeerinen Cowell-propagaattori ja voimamalli

seg-74f8c585bcfd = Cowellin numeerinen propagaattori hierarkkisella voimamallilla (kahden kappaleen, J2–J6-zonaalinen, Auringon/Kuun kolmannen kappaleen, kanuunankuula-SRP, eksponentiaalinen ilmanvastus); RK4-askelkaksinnus / DP5({ "4" }) / DOP853

seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853, riippumaton kirjasto, eri integraattori ja pallofunktiorekursio. Konservatiiviset tasot (kahden kappaleen → J2–J6-zonaalinen → Auringon/Kuun kolmas kappale → kanuunankuula-SRP) täsmäävät alle metrin tarkkuudella { "24" } tunnin kaarella, mikä validoi integraattorin ja voima-algebran; ilmanvastustaso sekä Auringon/Kuun efemeridin absoluuttinen ja tiheyssyötteen tarkkuus pysyvät MODELLED-tasolla (vain karakterisointi)

seg-d38c4be472ac = Litistyneen Maan SRP-varjo (valinnainen)

seg-ab8247c6b4d2 = SRP:n valaistu osuus, kun WGS-84-ellipsoidi on peittävä kappale (Maan näennäinen säde ellipsoidin reunalta Aurinkoa kohti, kahden kiekon linssikaava; srp_shadow::oblate_conical_shadow), valinnainen Cowellin voimamallissa kentän propagator::ForceModel::srp_shadow kautta (oletus: pallomainen kartiovarjo, muuttumaton)

seg-01066d639b39 = Laatikko-siipi- ja ECOM2-auringonpaine osittaisderivaattoineen (valinnainen)

seg-2a5fc9708bd0 = Ei-kanuunankuulamainen SRP: laatikko-siipi-levymalli (Vallado yhtälö 8-44; yksipuoliset runkopaneelit, Aurinkoon osoittavat siivet) GSC:n satelliittimetadatan Galileo FOC-, IOV- ja IOV-elinkaaren lopun taulukoilla, nimellisellä GNSS-yaw-ohjauksella, analyyttisillä osittaisderivaatoilla säteilykertoimelle ja jokaisen paneelin peilimäiselle ja diffuusille kertoimelle; sekä ECOM2-empiirinen malli (D2/B1) osittaisderivaattoineen. Laatikko-siipi on valinnainen Cowell-propagaattorissa (propagator::ForceModel::box_wing_srp, asettaa sen kentän srp_boxwing) ja tarkassa radanmääritysmallissa (precise_od::PreciseForceModel::box_wing_srp), ja se korvaa kanuunankuulatermin cr:llä säteilykertoimena; molemmat ovat oletuksena None, jolloin jokainen olemassa oleva polku pysyy tavu tavulta ennallaan. ECOM2:ta ei ole kytketty voimamalliin

seg-bde1b3a94a47 = Auringon reunatummennettu SRP-varjo (valinnainen)

seg-eaaec545dd68 = SRP:n valaistu osuus reunatummennetun aurinkovuon peittämättömänä osuutena (Eddingtonin approksimaation laki I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss–Legendre-kvadratuuri) pallomaisen tai WGS-84-Maan yli (srp_shadow::limb_darkened_shadow, ShadowModel-variantti OblateEarthLimbDarkened)

seg-76cb4b668ad5 = Ei ulkoista: Orekitissa { "12.2" } ei ole reunatummennettua valaistussuhdetta. Tarkistettu vain saman lain suljettuja muotoja vasten

seg-673b17e9dcf7 = NRLMSISE-00:n termosfäärin tiheys

seg-09e997231de8 = NRLMSISE-00:n empiirisen termosfäärin portti (gtd7 ja gtd7d: lajien tiheydet, kokonaismassatiheys poikkeavalla hapella, lämpötilat; { "24" } kytkintä; päivittäisen Ap:n ja 3-tuntisen ap-taulukon tilat) NRL:n Fortran-koodin julkisen alueen C-versiosta

seg-12977f65b2ea = NRLMSISE-00:n ilmanvastuksen tiheystaso (valinnainen)

seg-17aec847b675 = forces::DensityModel (Exponential-oletus, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) ja propagator::ForceModel::drag_density: neliöllinen ilmanvastus yhdessä pyörivän ilmakehän kanssa NRLMSISE-00:n tiheydellä WGS-84:n geodeettisessa pisteessä (Maan pyörimiskulma UT1 = TT, paikallinen aurinkoaika UT + lon/15), vakioavaruussää mallia kohti; oletuksena pois päältä ja bittitarkasti identtinen

seg-1ac7430e88fc = Oletuseksponentiaalinen ilmanvastus riippumatonta toteutusta vasten (päiväntasaaja)

seg-a9c41b03f2ca = Cowell-propagaattorin oletusilmanvastus: neliöllinen ilmanvastus pyörivän ilmakehän suhteen funktiolla forces::atmospheric_density, Valladon taulukon 8-4 paloittain eksponentiaalinen taulukko pallomaisella korkeudella (propagator::ForceModel::drag forces::DensityModel-tyypin oletusvariantilla Exponential)

seg-9e15970435c3 = DE440:n Aurinko ja Kuu Cowellin voimamallissa (valinnainen)

seg-de6831cf7785 = Valinnainen efemeriditaso numeerisen Cowell-ForceModelin kolmannen kappaleen ja SRP:n termeille: geosentrinen Aurinko ja Kuu minkä tahansa EphemerisProviderin (DE440 SPK -kernel kohteen KernelEphemeris kautta) antamina ajanhetkellä TDB = TT + (TDB - TT); hylkää tarjoajan, joka ei voi palvella ajanhetkeä, ja laskee kaikki paluut analyyttiseen sarjaan; oletuksena pois päältä

seg-057c21daf4f2 = S1-ilmakehän vuorovesi (valinnainen)

seg-f600a39f297e = Vuorokautinen S1-ilmanpainevuorovesi geopotentiaalihäiriönä: Biancale ja Bode ({ "2006" }) malli N1, asteet { "2" }–{ "6" }, IERS { "2010" } yhtälön { "6.21" } kuormakaavan kautta (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valinnainen Cowell- ja tarkoissa voimamalleissa (air_tide_s1, oletuksena pois päältä)

seg-7dd9fccac779 = Ei ulkoista geopotentiaalivaikutukselle. { "24" } kerrointa on jäljennetty GFZ STR06/01 -taulukosta { "1" } malli N1 ja tarkistettu rivi riviltä raporttia vasten (SHA-256 890865ae); asteita { "0" }, { "1" }, { "7" } ja { "8" } ei käytetä. Ray ja Ponte ({ "2003" }) eivät julkaise pallofunktiotaulukkoa, joten toista lähdettä ei verrattu

seg-b150b1bdb599 = S2-ilmakehän vuorovesikertoimet IERS-konventiossa

seg-87e9238b8c53 = Rayn ({ "2001" }) S2-ilmanpaineharmoniset (n <= { "4" }, myötäkulkuiset ja vastakulkuiset) muunnettuna IERS { "2010" } yhtälöiden 6.20–6.21 täysin normalisoituun sini-johtavaan muotoon (amplitudi jaettuna N_nm:llä, epsilon = { "90" } astetta - psi) ja sovellettuna funktion tides::atmospheric_tide S2-termiksi

seg-444f0a65b6fd = Tesseraalinen geopotentiaali Cowell-propagaattorissa

seg-ad475816bc78 = Valinnainen EGM2008-tesseraalikenttä (asteeseen/kertalukuun { "70" } asti) numeerisen Cowell-ForceModelin keskeisenä painovoimana, laskettuna Maahan kiinnitetyssä koordinaatistossa, jota pyöritetään IAU { "2000" } -Maan pyörimiskulmalla (tai CIO GCRS–ITRS-ketjulla); oletuksena pois päältä, joten mikään olemassa oleva tuloste ei muutu

seg-e8f5ff8c9149 = Korkea-asteinen pallofunktiopainovoima (EGM2008 asteeseen { "2190" } asti)

seg-d3b2f32dcecb = Alivuototurvallinen ja napaturvallinen täysin normalisoidun kentän laskenta asteeseen { "2190" } asti (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes–Featherstone { "2002" } muokattu eteenpäin etenevä sarake, jonka gradientissa ei ole termiä 1/cos phi), suoratoistava ICGEM .gfc -lataaja (from_gfc_file / from_gfc_reader; täysi EGM2008 haetaan ajon aikana, ei sisällytetä mukaan) sekä Holmes–Featherstone-laskin, joka on valittavissa valinnaiseen Cowell-Geopotential-kohteeseen

seg-e81b7418c382 = DOP853-integraattori

seg-e6e3638aa68e = Hairerin DOP853 { "8" }({ "5,3" }) eksplisiittinen Runge–Kutta yhdistetyllä 5./3. kertaluvun virhe-estimaattorilla, SciPyn/Hairerin askelsäätimellä, automaattisella alkuaskeleella, suljetusti epäonnistuvalla askelvartijalla ja 7. kertaluvun tiheällä ulostulolla; valittavissa propagaattorin Integrator-variantiksi Dop853 / propagator::propagate_dop853

seg-9ad7c1f4da77 = Robusti Keplerin yhtälön ratkaisija

seg-4b9d812fd13e = Elliptinen Keplerin ratkaisija kaikille { "0" } <= e < { "1" } ja kaikille keskianomalioille: Markleyn ({ "1995" }) kuutiollinen alkuarvaus ja viidennen kertaluvun korjaus, kumoutumisvapaa residuaali (1-e)E + e(E - sin E) - M ja suojattu Newton-hionta (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

seg-1960804ef2f4 = Etäisyysnopeuden ja atsimuutti/korkeuskulman eräkohtainen radanmääritys aseman maskauksella

seg-4c185244bc66 = Palauttaa epookin tilan sekoitetusta etäisyys-, etäisyysnopeus- ja atsimuutti/korkeuskulma-seurannasta korkeuskulmamaskin yläpuolella Gauss–Newton-menetelmällä H = (dh/dx(t)) Phi(t, t0): analyyttiset mittausosittaisderivaatat ja variaatiotilansiirtymämatriisi, jossa on analyyttiset kahden kappaleen + J2-osittaisderivaatat (RK4-integroitu, ei suljetun muodon STM)

seg-bc3d1ee7c639 = SP3-tarkkuuskoodin havaintopainotus

seg-63b1fab84f85 = Kuvaa SP3-tarkkuuskoodit (otsikon ++-eksponentit muodossa { "2" }^n mm, %f-kanta, tietuekohtaiset kanta^n mm -keskihajonnat) havaintokohtaisiksi paikan sigmoiksi tarkan radanmäärityksen moottorille (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

seg-ebecb8906506 = Ei ulkoista: painot ovat mallinnusvalinta (SP3-muoto määrittelee koodin vain tuottajan tarkkuusindikaattorina; se luetaan tässä akselikohtaisena yhden sigman arvona). Olemassa olevat tallennetut virastoajot ovat muuttumattomia

seg-e35df6881c80 = Planeettojen painovoimakentät PDS SHADR -taulukoista

seg-f78b73ae8742 = Lukee PDS SHADR -pallofunktiotaulukot (from_shadr, tyypillä SphericalHarmonicField tiedostossa src/gravity_pds.rs: yksikkömuunnos, C00 = { "1" } annettu, täydellisyys- ja normalisointitarkistukset) ja laskee Marsin GMM-3:n (d/o { "120" }) ja Kuun GRAIL-kentän GL0660B (d/o { "660" }) kappaleeseen kiinnitetyn painovoiman

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

seg-278ca396127a = RINEX { "4" } -havaintotiedoston luku

seg-e0883aa933eb = RINEX 4.0x -havaintojen otsakkeet (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; selitteet sovitettu sarakkeisiin 61–80 versiosta { "4" } alkaen) ja epookkitietueet

seg-971fb1203a6d = Muotoyhteensopivuus todellisella julkaistulla RINEX { "4.00" } -tiedostolla (takaisin luetut arvot ovat yhtä kuin tiedoston painetut literaalit) ja määrittelystä johdetulla otsakkeella; riippumatonta lukijaa ei ajettu, joten MODELLED

seg-33e5c74720ff = BeiDou GEO:n lähetetty satelliittipaikka

seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } geostationaarisen satelliitin paikka lähetetystä efemeridistä (inertiaalin kaltainen koordinaatisto, sitten Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valinnainen NavParseOptions-tyypin kentän include_beidou_geo kautta, joten oletuslukija ohittaa yhä GEO:t

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

seg-c866a5bd4318 = CR3BP:n pyörivän koordinaatiston tilat kuvattuna Kuun keskipisteiseen ICRF:ään DE440:n Maa–Kuu-linjalla

seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf kuvaa dimensiottoman Maa–Kuu CR3BP:n pyörivän koordinaatiston tilan Kuun keskipisteisen ICRF:n paikaksi ja nopeudeksi hetkellisellä Maa–Kuu-linjalla (pituusyksikkönä Maa–Kuu-etäisyys, aikayksikkönä käänteinen kiertonopeus, koordinaatiston täysi kulmanopeus mukaan lukien sen tason ulkopuolinen nopeus Kuun kiihtyvyydestä), käänteisellä funktiolla from_moon_centred_icrf, ja cr3bp::to_moon_centred_icrf_de440 lukee geosentrisen Kuun tilan DE440 SPK:sta. Se kuvaa tiloja; se ei tee CR3BP-radasta efemeridimallin rataa

seg-d543e3e84f36 = Aurinkokunta-tyyppi JPL-kernelilla (planetary_kernel_path)

seg-e8a96f29afc7 = <c1/>-tyyppi asetuksella planetary_kernel_path: jokainen raportoitu kappale, jonka oman NAIF-koodin SPK sisältää, ottaa heliosentrisen J2000-paikkansa ja -nopeutensa kernelistä moottorin oman lukijan kautta (selite KERNEL); linkki, jonka kumpikin pää on kernelissä, lasketaan sen pohjalta; barycentrejä ei koskaan korvata planeetalla, ja jokainen muu kappale pysyy analyyttisenä omalla selitteellään; raportti saa kernel-lohkon (polku, SHA-256, kernelistä otetut kappaleet ja linkit) vain, kun asetus on käytössä. Tiedostolla de440s.bsp ne ovat Merkurius, Venus, Maa ja Kuu

seg-7f3d53b4e8d1 = Porkchop DE440-efemeridillä

seg-bd813d7e0b58 = maneuver::porkchop_kernel: laukaisupäivä x saapumispäivä -pyyhkäisy lähtö-C3:lle (km²/s²) ja saapumisen V-infinity:lle (km/s) yhden kierroksen myötäkulkuisella Lambert-ratkaisijalla ja { "0.5" } asteen kollineaarisuusvartijalla, minkä tahansa kahden NAIF-kappaleen heliosentrisillä J2000-tiloilla, jotka paketin oma lukija lukee JPL DE440 SPK:sta. Yksi kierros, myötäkulkuinen, ei laukaisulaite- tai saapumisrajoitteita: pyyhkäisy, ei tehtäväsuunnitelma

seg-b1401bed5da8 = Impulsiivinen siirtoradan optimoija DE440-efemeridillä

seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: yhden kierroksen ballistisen kahden impulssin siirtoradan lähtö- ja saapumispäivät, jotka minimoivat lähtö-C3:n tai saapumisen V-infinity:n tyypin I tai tyypin II sisällä, jatkuvana optimina (2 vuorokauden ruudukko molempien ikkunoiden yli, sitten 2D Nelder–Mead) DE440 SPK:n heliosentrisillä tiloilla. Päivämääräoptimoija yhdelle osuudelle, ei tehtäväsuunnitelma: ei laukaisulaite-, pysäköintirata-, syväavaruuskäänne- eikä monikierrosvaihtoehtoja

seg-6c695aef043b = Riippumaton optimoija: NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.3.0" } kautta) heliosentriset tilat samalla de440s-leikkeellä, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) ja SciPy { "1.18.1" } Nelder–Mead, kutsumatta mitään Kshana-koodia. NASAn Maa–Mars-käsikirja (MIDAS, efemeridiä ei ilmoitettu, 2 vuorokauden päiväruudukko) on toissijainen julkaistu vertailu eikä määritä tilaa

seg-93f3cdbb7297 = Monikierroksinen Lambert-siirtoratkaisija

seg-995a6a995b78 = Jokainen Lambertin ongelman ratkaisu enintään kolmella täydellä kierroksella (maneuver::lambert_multirev: yhden kierroksen ratkaisu, sitten kunkin kierroslukumäärän vasen ja oikea haara, Izzo { "2015" }), reunanopeuksilla v1 ja v2, myötä- ja vastapäiväisille siirtoradoille, kanonisissa ja heliosentrisissä SI-yksiköissä, mukaan lukien siirtoradat, joiden lentoaika on { "1" } %:n sisällä kierroslukumäärän vähimmäislentoajasta, sekä lähes 180 asteen geometriat. Vain kahden kappaleen ratkaisija (ei häiriöitä)

seg-ff9c6140fe1c = Lambertin kahden kappaleen siirtoratkaisija

seg-d8c39ced64b2 = Izzo-2015 yhden kierroksen Lambert-ratkaisija (r1, r2, lentoaika → reunanopeudet) LEO→GEO→heliosentristen siirtoratojen yli, myötä- ja vastapäivään

seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT), riippumaton kolmannen osapuolen Lambert-ratkaisija. Yhden kierroksen (M={ "0" }) Lambertin ongelmalla on yksikäsitteinen ratkaisu, joten kirjasto vastaan kirjasto -vastaavuus on aito ulkoinen tarkistus; täsmäsi tarkkuudella < { "1e-4" } m/s (havaittu ~{ "1e-11" }), samanlainen validointi kuin DOP:lla vs. gnss_lib_py

seg-347cece5df63 = Koordinaatistot ja aika-asteikot

seg-5a4bc2c15eaa = IAU 2006/2000A -prekessio-nutaatio, CIO GCRS↔ITRS, karkaussekuntiaika-asteikot

seg-51d28ab9d256 = IAU SOFA / ERFA -vertailuvektorit; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-c3d4b9bef817 = Kaksiosaiset Julian-päivät ja karkaussekunnit Maan kiertoradan aikapolulla

seg-5e859e3aa613 = UTC-kalenteripäivä ja -aika kaksiosaiseksi UTC Julian -päiväksi SOFA dtf2d -konventiolla päiville, jotka päättyvät karkaussekuntiin ({ "86 401" } s pitkiä, { "23" }:{ "59" }:{ "60" }.x kelvollinen), UTC TAI:ksi ja takaisin sekä UT1 UTC:stä TAI:n kautta kaksiosaisilla päivillä alkaen 1972-01-01: aikapolku, jonka SGP4 (Sgp4::propagate_at, mitattuna kaksiosaisesta epookista) ja IAU 2006/2000A Maahan kiinnitetty pyöriminen (sgp4::teme_to_itrs_matrix_eop kaksiosaisella Maan pyörimiskulmalla) ottavat

seg-f1c7bc235a6b = Kaksiosaiset Julian-päivät Maan pyörimisen läpi kiertoradan polulla

seg-cee11d4bad08 = Maan pyöriminen kaksiosaisesta UT1 Julian -päivästä kiertoradan polulla, jotta Maahan kiinnitetty paikka säilyttää mikrosekunnin, jonka yksittäinen f64-päivä menettää (noin { "3e-9" } rad lähellä vuotta { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME-konventio, kahdelle osalle), cio::gcrs_to_itrs_matrix_jd2 (CIO GCRS–ITRS-matriisi Maan pyörimiskulmalla kahdesta osasta) ja näiden päälle rakennettuina ja sisäisesti tarkistettuina frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 ja own_jd2_utc, efemeridiskenaarion valinnainen two_part_jd (ECEF-paikka, maanpintajälki ja asemanäkymä; oletuksena pois päältä, muuttumaton) sekä häviöttömät From-muunnokset jd2::Jd2 ja timescales::TwoPartJd välillä. Prekessio-nutaatio ja Cowellin voimamallin epookki pysyvät yksittäisenä f64:nä, missä { "40" } us:n pyöristys on alle { "1e-15" } rad tai selvästi alle analyyttisen Auringon/Kuun efemeridin virheen

seg-096df3971f5f = Koordinaatistomatriisit ERFA-vektoreita vasten: IAU { "2006" } bias-prekessio, TEME GCRS:ksi ja CIO-ketju taivaan navan poikkeamilla

seg-731a5ed967b3 = Kolme koordinaatistomatriisia verrattuna alkio alkiolta tai kiertokulmalla ERFA:an mielivaltaisilla epookeilla: precession::precession_matrix (IAU { "2006" } bias-prekessio Fukushima–Williams-kulmilla), nutation::teme_to_gcrs_matrix (TEME GCRS:ksi -kierto P^T N^T Rz(-EE) IAU { "2006" } -prekessiolla, IAU 2000B -nutaatiolla ja päiväntasausten yhtälöllä kahdella johtavalla komplementaaritermillä) ja cio::gcrs_to_cirs_matrix_with_offsets (GCRS CIRS:ksi -kierto IERS-taivaan navan poikkeamilla dX, dY lisättynä mallin CIP X, Y -arvoihin ennen kiertoa, SOFA cookbook -konventio; uusi). Mallivalintoja itseään (2000B-nutaatio TEME-polulla, kahden termin komplementaarisarja) ei validoida, vain niiden toteutus

seg-4e2fe2e3dabb = Ennen vuotta 1972 oleva UTC (ajautuvan nopeuden aika) kaksiosaisella Julian-päivän aikapolulla

seg-1d086e669f09 = UTC 1960-01-01 – 1971-12-31, jolloin UTC kulki TAI:hin nähden poikkeavalla nopeudella ja siirtyi sekunnin murto-osilla, kaksiosaisella Julian-päivän polulla: TAI - UTC kunkin jakson ajautumataulukosta (timescales::tai_minus_utc_on_date), UTC-kalenteripäivä kaksiosaiseksi UTC Julian -päiväksi päivän pituudella { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC TAI:ksi päivän osuus UTC:stä SI-sekunteihin skaalattuna (jd2::utc_to_tai) ja TAI takaisin UTC:ksi (jd2::tai_to_utc), SOFA dtf2d:n, utctai:n ja taiutc:n mukaisesti. Ennen vuotta { "1960" } TAI - UTC otetaan arvoksi { "0" } (SOFAn arvo; UTC määrittelemätön) ja se on väitteen ulkopuolella. Yksittäinen f64 timescales::tai_minus_utc rajaa yhä arvoon { "10" } s ennen vuotta { "1972" }, eikä sitä katettu

seg-efacec095051 = GLONASSin lähetetty satelliittikello ja lähetetyn radan propagointi

seg-821b9c01b56e = GLONASSin lähetetty satelliittikellon poikkeama -tau_n + gamma_n (t - t_b) satelliittikellosta luetulla ajalla (glonass::GlonassEphemeris::sv_clock_bias_s, poikkeama korjattuna kellon poikkeamalla kahdella kiintopisteiteraatiolla) ja lähetetyn tilavektorin PZ-90 Maahan kiinnitetty paikka propagoituna RK4:llä GLONASS ICD:n liikeyhtälöillä +/-15 min:n sisällä vertailuepookista (GlonassEphemeris::position_ecef), todellisista RINEX { "3" } GLONASS-navigointitietueista. PZ-90.11:stä ITRF:ään ei sovelleta muunnosta (ne täsmäävät senttimetritasolla vuodesta { "2014" } alkaen; RTKLIB ei sovella sellaista), ei kytketty skenaarion tulosteeseen: kirjastofunktio

seg-d3b72a6fbb18 = Yksi Maan kiertoradan polku: SGP4-elementtijoukot GCRS:ään ja ITRS:ään IAU 2006/2000A -ketjulla Maan orientaatioparametreilla

seg-e4eca7205b5e = Propagointi- ja koordinaatistopolku, jonka jokainen reititetty Maan kiertoradan tyyppi jakaa: SGP4-keskielementtijoukko kaksiosaisella UTC-epookilla (sgp4::MeanElementSet, luettu tähdistösuunnittelun elementeistä funktiolla MeanElementSet::from_earth_fixed) propagoituna SGP4/SDP4:llä TEME:en (sgp4::SgpOrbit), sekä TEME -> ITRS- ja GCRS -> ITRS -kierrot IAU 2006/2000A -ketjussa UT1 - UTC:llä ja napaliikkeellä (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, nollaparametriset muodot teme_to_itrs_matrix ja gcrs_to_itrs_matrix). TEME on päivän todellinen päiväntasaaja keskimääräisellä päiväntasauksella, johon päästään GCRS:stä IAU { "2006" } bias-prekessiolla, IAU 2000B -nutaatiolla ja päiväntasausten yhtälöllä

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

seg-bbb1828b3db1 = Katukanjonin, sektorien ja maaston supistaminen taulukoksi

seg-2864aec7be88 = skyline: katukanjoni suljetussa muodossa (leikkaus atan((h - a) / d), jossa d = (w/2) / abs(sin(az - s)), avoimet päät äärelliselle pituudelle), teräväreunaiset sektorit myötäpäivään kiertäen sekä maastopisteet taulukoksi supistettuina kaarevuuspudotuksella d^2/({ "2" } * 4/3 R); horisonttiviiva on niiden pisteittäinen maksimi minkä tahansa taulukon kanssa

seg-50f1df206b30 = Sisäinen: suljetut muodot tarkistetaan käsin laskettuja arvoja vasten (annetun kadun seinien yläreunojen korkeuskulmat, avoimen pään ehto, annetun pisteen kaarevuuspudotus). Ulkoista oraakkelia ei ole: suunnitteluselosteessa nämä supistukset rajataan tasolle MODELLED, ja Orekitin ElevationMask ottaa taulukon, joten rivin 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' vertailu lukee niiden 360 pisteen taulukot syötteinä eikä tarkista niitä

seg-3f3d657854ce = Horisonttiesiasetukset (kaupungin katu, satamaan lähestyminen, vuono, konttiterminaali)

seg-b915c06fa3f1 = skyline::PRESETS: neljä REPRESENTATIVE-geometriaa suunnitteluselosteen ilmoittamilla mitoilla ja kullakin yhden rivin alkuperämerkintä: city-street (kanjoni, katu { "0" } astetta, { "20" } m { "30" } m korkeiden seinien välissä, antenni { "1.5" } m), harbour-approach (sektorit: avoin merelle { "180" } asteen alalla, satamarakennukset { "8" } astetta { "90" } asteen alalla, aallonmurtaja { "3" } astetta), fjord (maasto: seinät { "600" } m antennin yläpuolella { "1.5" } km:n päässä molemmin puolin pohjois-eteläsuuntaista väylää, kaarevuuspudotus huomioitu), container-terminal (sektorit: kontit { "12" } astetta maanpuoleisella puoliskolla, nosturin puomit { "35" } ja { "25" } astetta kahdella kapealla sektorilla); ohitettavissa kenttä kerrallaan

seg-44ae9b6289d9 = Ei mitään: valitut ja ilmoitetut mitat, ei minkään kadun, sataman, vuonon tai terminaalin kartoitus (kadun sivusuhde on Oken ({ "1988" }) vaihteluvälillä 0.5–2; vuono on länsinorjalaisten vuonojen suuruusluokkaa; kontit käyttävät ISO { "668" } -high-cube-korkeutta). Testi tarkistaa esiasetukset niiden omia ilmoitettuja mittoja vastaan, mikä on kirjoitusvirheiden tarkistus, jota validointisääntö ei laske

seg-2c53381d48ae = Vaakavirheen ellipsi ja järjestelmäkohtainen kofaktori geometrian kovarianssista

seg-15fea5c05cbd = geometry::sky_geometry: ENU-ja-kello-kofaktori (H^T H)^-1, jossa yksi vastaanottimen kello on yhteinen tai yksi järjestelmää kohti (ydin orbit::cofactor_from_los), sekä vaakavirheen ellipsi sen itä-pohjoinen-lohkosta (isoakselit k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), pääakselin atsimuutti pohjoisesta)

seg-6012113b4836 = Taivaan geometriafunktiot: näkyvyys, DOP, kovarianssi, virhe-ellipsi, Monte Carlo -pilvi

seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> ja <c2/>, Python- ja WASM-funktiot samoilla nimillä, MCP <c3/>): paikasta, ajasta ja tähdistöesiasetuksista (tai atsimuutti/korkeuskulma- tai ECEF-satelliiteista) lasketaan näkyvät ja horisontin alla maskatut satelliitit, GDOP/PDOP/HDOP/VDOP/TDOP, yksikkövarianssin kofaktori (H^T H)^-1 ja kovarianssi itä-pohjoinen-ylös-koordinaatistossa yhdellä vastaanottimen kellolla järjestelmää kohti tai yhdellä yhteisellä, vaakavirheen ellipsi (isoakselit k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), suunta { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) pohjoisesta) sekä n siemenellä alustettua pienimmän neliösumman virhettä riippumattomilla gaussisilla etäisyysvirheillä, niiden empiirinen kovarianssi, RMS ja { "95" } %:n kattavuus. Kofaktori on orbit::cofactor_from_los, ainoa ydin orbit::dop:n ja orbit::dop_cov:n takana (dop on dop_cov:n supistus): ei toista DOP-toteutusta

seg-aa0da1028636 = Yhden kellon DOP-tekijät nojaavat ytimeen, joka on validoitu gnss_lib_py { "1.0.4" } -kirjastoa vastaan (rivi 'GNSS geometry / dilution of precision (DOP)'); tämän rivin omat tarkistukset ovat sisäisiä: sky_geometry toistaa orbit::dop:n ja dop_cov:n samalla geometrialla, ellipsi toistaa analyyttisen 2x2-ominaishajotelman, ECEF- ja atsimuutti/korkeuskulma-syötteet täsmäävät, ja siemenellä alustetun pilven RMS ja { "95" } %:n kattavuus täsmäävät geometrian kanssa. ENU-kovarianssi yhdellä kellolla järjestelmää kohti ja ellipsi ovat VALIDATED rivillä 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); tasolle MODELLED jää tässä yhdistelmä: esiasetusten eteneminen edustavaksi taivaaksi, Monte Carlo -pilvi (tarkistettu sen näytteistämää geometriaa vasten, itsejohdonmukaisuustarkistus) ja pinnat. Tähdistöesiasetukset antavat edustavan taivaan, eivät päivättyä; gaussinen virhemalli ja UERE ovat ilmoitettuja syötteitä, eivät mitattu tarkkuus eivätkä eheysraja

seg-7f66be0f15c8 = GNSS-vapaa kellon holdover

seg-4d8f87668a0f = Suljetun muodon vapaaliukuvirheen kasvu + holdover kynnykseen; kvanttikelloluokat

seg-2d260626e3d2 = Monivaiheinen clock_state-kovarianssirekursio (saman koodikannan ristiintarkistus); taustalla oleva vapaaliuku-varianssin ja holdover-käänteisfunktion ydin on validoitu ulkoisesti scipyä vasten (ks. 'Clock-holdover coast-variance & threshold inversion'). Luokkakohtaiset punaisen kohinan lattian holdover-luvut pysyvät tasolla MODELLED

seg-29b482d88916 = Mitatut kellolaitekortit (pidätetty ennuste)

seg-8c68c5b25004 = clock_library: laitekortti (valkoinen vaihe, valkoinen, flicker- ja random-walk-FM sekä lineaarinen taajuuden ajautuma) sovitettuna yhteen kolmasosaan nimetystä mitatusta kellotallenteesta lokatun esikäsittelykierroksen jälkeen (aukot, vaiheen poikkeavat arvot, vaihehypyt ja purskeet poistettu; taajuushypyt lokattu), painotettuna lag-1-menetelmällä tunnistetuilla kohinatyyppien vapausasteilla, ja sen ennustettu Allanin poikkeama pisteytetään pidätetyillä kahdella kolmasosalla; lukijat RINEX- ja IGS-kellotiedostoille, BIPM:n laboratoriokohtaisille tiedostoille ja Circular T:n osalle { "1" }; kortin muunnos aikaväliajoituksen kohinamalliksi, laajennetuksi Kalman-kellomalliksi ja harhautusmonitorin kohinatasoiksi

seg-5097a0e6460d = Mitatut GPS Block IIF -kellokortit kierroskohtaisilla termeillä (pidätetty ennuste)

seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: laitekortti, joka sisältää yhden–neljän kierroskohtaisen vaihetermin (jakso T/k, T = { "43 082.05" } s), sovitettuna yhdessä toisen asteen termin kanssa pienimmän neliösumman menetelmällä yhteen kolmasosaan mitatusta satelliittikellotallenteesta, kunkin termin suljetun muodon Allan-osuus { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ennustetussa Allanin poikkeamassa

seg-0d72fcc0fbea = Aluksen kellotilan estimointi

seg-6db5391f8ebe = 3-tilainen (vaihe/taajuus/ajautuma) van-Loan-Kalman-kello, Joseph-vakautettu

seg-3f0a9d7c2971 = Ajansiirron virhebudjetointi

seg-216f46b43860 = Kaksisuuntainen/TWSTFT (Sagnac), GNSS-yhteisnäkymä, PPP; linkin jitter→etäisyys

seg-e7b6aac2ec58 = Sagnac-suuruus tarkistettu arvovaltaista JULKAISTUA ARVOA vasten – N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), yhtälö { "1.29" }: itäsuuntainen päiväntasaajan kiertomatka kerryttää { "207.4" } ns (2ωA_E/c²); kshana toistaa arvon { "207.386" } ns. Riippumattomasti vahvistettu RTKLIB { "2.4.3" } geodist()-funktiolla (Takasu, BSD-2-Clause), jossa on sama 2Aω/c²-geometria. Yhdistetyllä BIPM TWSTFT -transponderin/yhteisnäkymän/PPP-budjetilla ei ole ulkoista oraakkelia, joten kyvykkyys pysyy tasolla Modelled

seg-157fadeb5d67 = Navigointisignaalin modulaatio ja koodinseurannan analyysi

seg-ab633d191396 = BPSK-R/BOC-PSD, spektrierotus κ, Gaborin kaistanleveys, DLL-jitter, monitie-eteneminen

seg-589e0053e3e8 = GPS L1 C/A -hajotuskoodin generointi

seg-782d4da75b59 = G1/G2 LFSR -C/A-koodigeneraattori, joka toistaa IS-GPS-200:n julkaistut ensimmäisten 10 piirin oktaaliset varmennusvektorit PRN-koodeille { "1" }–{ "9" } (sekä 1023 piirin pituuden, 512 ykkösen tasapainon ja kolmiarvoisen jaksollisen autokorrelaation)

seg-473f24d4e06a = IS-GPS-200 Table 3-Ia 'Code Phase Assignments' – arvovaltaiset Yhdysvaltain hallinnon julkisen alueen julkaisemat ensimmäisten 10 piirin OKTAALISET varmennusvektorit (GPS Directorate, navcen.uscg.gov); kshanan oma G1/G2 LFSR tuottaa uudelleen jokaisen PRN-vektorin { "1" }–{ "9" } täsmälleen. Jatkossa käytettävät modulaation, SSC:n ja DLL:n suljetut muodot pysyvät tasolla Modelled (erillinen rivi)

seg-e6c08e1e6ae3 = Kvanttiinertia-anturin suorituskyky

seg-d28e1f6a430f = Kylmäatomi-interferometrikiihtyvyysanturi ensiperiaatteista (k_eff·T², QPN)

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

seg-ff90679d1de9 = Harhautuksen (spoofing) havaitseminen

seg-b843f63e77e6 = Kellon avustama χ², RAIM, AGC ja SQM yhdistettynä epookkikohtaiseksi turvallisuuden laatumittariksi

seg-b10d07921f5e = Ajoituksen suojaustaso harhautuksen (spoofing) aikana

seg-2a829711b997 = Suljetun muodon yläraja pahimman tapauksen havaitsemattomalle aikavirheelle = monitorin lattia + oskillaattorin vapaaliuku-σ CUSUM-havaitsemisviiveen aikana, raportoituna punaisen kohinan lattiakaistana

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

seg-29bedb28c34f = CCSDS OEM -yhteentoimivuus (GMAT/Orekit/STK-efemeridituonti)

seg-edb58ffbbb5b = CCSDS { "502.0" } OEM -tuoja (parse_oem), joka sietää COMMENT-rivejä / ylimääräisiä metatietosanoja / kovarianssilohkoja ja on kirjoittajan tarkka käänteistoiminto; edestakaisajo + ulkoisen tiedoston sisäänotto nopeuden johdonmukaisuustarkistuksella. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/oem-interop.toml)

seg-bc507f96c4df = Riippumaton kolmannen osapuolen CCSDS-502-jäsennin <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) – erillinen koodikanta, joka dekoodaa kshanan tuottaman EME2000/UTC-OEM:n tavu tavulta identtisesti ({ "24" } tilaa { "2" } testitiedostossa, paikka/nopeus Δ = { "0" }) ja jonka tiukka lukija vahvistaa metatietotunnisteet; kshanan jäsennin samoin täsmää sen kanssa toimitetulla ulkoisella OEM:llä. Kaksi rehellistä yhteentoimivuushavaintoa (oem-kirjasto hylkää kshanan satelliittikohtaisen moniosaisen segmenttikäytännön ja sen monialkioiset kovarianssirivit) on dokumentoitu testissä – siksi tämä validoi vain yhden kohteen vaihtomuodon, ei kaikkien kshanan muunnelmien täyttä CCSDS-502-yhdenmukaisuutta

seg-c76b8c395ef0 = Laukaisuikkuna ja nousugeometria (tehtäväanalyysi)

seg-6066c634faba = Kahden kappaleen laukaisuatsimuutit (sin Az = cos i / cos lat), pienin saavutettavissa oleva inklinaatio, ympyräradan nopeus, Maan pyörimisen itäsuuntainen hyöty, dogleg-tasonmuutoksen Δv ja päivittäiset mahdollisuudet sekä, kun annetaan epookki ja IERS finals2000A -rivit, aseman nopeus todellisen navan ympäri (launch::site_rotation_speed_at). Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/launch-window.toml)

seg-ff2cd766bb52 = Ballistinen paluukäytävä (Allen–Eggers)

seg-c3f3422f96e4 = Huippuhidastuvuus (ballistisesta kertoimesta riippumaton), nopeus ja korkeus huippu-g:n kohdalla sekä huippulämmityksen nopeus eksponentiaalisen ilmakehän ballistiselle paluulle. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/reentry.toml)

seg-8c10b50407d3 = EO-hyötykuorman jalanjälki ja kattavuusgeometria

seg-45c1e799c87c = SMAD:n avaruuskolmiogeometria: Maan kulmasäde, kaistan leveys, nadirin GSD, suurin nadirista poikkeava saavutettavuus ja ympyräradan jakso, sekä ensimmäisen kertaluvun J2-solmujakso (eo_payload::j2_nodal_period) ja päiväntasaajan maanpintajäljen väli R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) yhtenäisen kattavuuden lipulla, kun annetaan radan korkeus, inklinaatio ja anturin FOV/IFOV. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/eo-coverage.toml); sen oletusinklinaatio on aurinkosynkroninen eo_payload::sun_synchronous_inclination -funktiosta, mukavuusoletus, joka ei kuulu validoituun väitteeseen

seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC-kehystys

seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet -pääotsikon koodaus/dekoodaus (versio/tyyppi/toissijainen otsikko/APID/järjestyslaput/laskuri/datan pituus) + kehystysskenaario. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/space-packet.toml)

seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) – riippumaton kolmannen osapuolen toteutus standardista CCSDS 133.0-B-2; kshanan encode_packet/decode_packet täsmäsi tavu tavulta (6 oktetin pääotsikko { "33" } tapauksessa + koko koodattu paketti { "12" } tapauksessa)

seg-5510c82f671a = CCSDS Space Packet -toissijainen otsikko, paketin virheenhallinta ja segmentointi

seg-7503bf761df9 = CCSDS 133.0-B-2 Space Packet -laajennukset pääotsikon rinnalla: toissijainen otsikko, joka kuljettaa CCSDS 301.0-B -aikakoodin (CUC tai CDS, eksplisiittinen tai implisiittinen P-kenttä) ja lisädataa, CRC-16-paketin virheenhallintakenttä, suuren käyttäjädatayksikön segmentointi ja kokoaminen takaisin, virran dekoodaus järjestysaukojen ja järjestyksen tarkistuksilla sekä PUS-TM-paketit. Pääotsikon tuloste on tavu tavulta sama kuin ennen

seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, paketin virheenhallinta, segmentointi ja kokoaminen, virran dekoodaus)</s1>

seg-7c61da52b8f8 = SPICE SPK -vienti (tyypit { "9" } ja { "13" })

seg-582ce23522f6 = NAIF SPICE SPK -ydinten kirjoittaja ja lukija tyypeille { "9" } (Lagrange, epätasaiset aika-askeleet) ja { "13" } (Hermite, epätasaiset aika-askeleet), DAF-rakenteella, segmenttikuvaajilla ja epookkihakemistoilla, sekä CCSDS OEM:n vienti SPK-ytimeksi (UTC- tai TDB-epookit efemeridiajaksi)

seg-d699104fc2af = SPICE SPK -tyypit { "3" } ja { "21" } (Chebyshev, laajennetut erotusrivit)

seg-7d3e8b5b40af = NAIF SPICE SPK -segmenttien kirjoittaja ja lukija tyypeille { "3" } (Chebyshev-polynomit paikalle ja nopeudelle kiinteillä väleillä, aste { "0" } – { "27" }) ja { "21" } (laajennetut muunnetut erotustaulukot, JPL-integraattorien erotusrivit, MAXDIM { "15" } – { "25" }), annetuista tietueista, tiedostoissa, jotka sisältävät myös tyyppien { "9" } ja { "13" } segmenttejä; tietueen valinta ja arviointi SPICE-lukijoiden järjestyksessä. Kshana ei sovita Chebyshev-kertoimia eikä tuota erotusrivejä

seg-39517faae95c = CCSDS-asentoviestit (AEM, APM)

seg-f88f6ea002c8 = CCSDS 504.0-B-2 -asentoviestien kirjoittaja ja lukija KVN- ja NDM/XML-muodoissa: AEM-versio { "2.0" } (ja { "1.0" } KVN:ssä, tunnisteineen ATTITUDE_DIR, QUATERNION_TYPE ja numeeriset kiertojärjestykset) kvaternioni-, Euler-kulma- ja spin-asentotyypeillä sekä niiden derivaatta-, kulmanopeus- ja nutaatiovariaateilla, useita segmenttejä; APM-versio { "2.0" } kvaternioni-, Euler-, kulmanopeus-, spin-, inertia- ja manööverilohkoilla; tietueen A-B-kvaternioni (504.0-B-2 liite F)

seg-5f26f879037e = CCSDS-ratadataviestit (OPM, OMM, OCM)

seg-eaddfd311fea = CCSDS 502.0-B-3 -ratadataviestien kirjoittaja ja lukija KVN- ja NDM/XML-muodoissa: OPM { "3.0" } ja { "2.0" } (tilavektori, oskuloivat Kepler-elementit, avaruusaluksen parametrit, kovarianssi, manööverit, käyttäjän määrittelemät parametrit), OMM { "3.0" } ja { "2.0" } (keskiarvoelementit keskiliikkeellä tai isolla puoliakselilla, TLE:hen liittyvät parametrit BSTAR- tai BTERM-kentällä ja AGOM, kovarianssi) sekä OCM { "3.0" } radalla (CARTP, CARTPV, CARTPVA; absoluuttiset tai suhteelliset epookit), fysikaalisten ominaisuuksien, kovarianssin (CARTP, CARTPV LTM-järjestyksessä), manööverin ja käyttäjän määrittelemien lohkojen kanssa; täystarkkuuksinen OMM SGP4-elementtijoukosta muuttumattoman OmmFile::to_omm_kvn -funktion rinnalla

seg-1e5ea1d9918d = 3-DOF-asennon ja suuntauksen virhebudjetti (AOCS)

seg-21f2f8efcf19 = Gravitaatiogradientin pahimman tapauksen häiriömomentti ((3/2)(μ/R³)ΔI) asennon yli otettuna huippuarvona (validoitu väite) sekä RSS-suuntausvirhebudjetti nimetyistä 1σ-osuuksista ja hallitsevasta termistä (kutsujan antamien lukujen neliösumma, validoidun väitteen ulkopuolella). Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/attitude-budget.toml)

seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), riippumaton C++-toteutus täyden tensorin gravitaatiogradienttimomentista: Kshanan huippuarvo (3/2)(μ/R³)ΔI on sama kuin Basiliskin momentti { "45" } asteen asennossa suhteellisen { "1e-12" } sisällä (pahin { "2.1e-15" }) { "5" } korkeudella ja { "8" } inertiatensorilla, ja rajaa Basiliskin momentin { "2000" } satunnaisessa asennossa tapausta kohti; toleranssi lukittu ennen vertailua. Validoitu väite: gravitaatiogradienttimomentin huippu. RSS-suuntausbudjetti on kutsujan antamien lukujen neliösumma ilman ulkoista totuutta ja jää sen ulkopuolelle; käsin koodattu Hipparchuksen täyden tensorin maksimointi säilyy tukevana itsejohdonmukaisuustarkistuksena. Ei säätösilmukan / 6-DoF- / joustavien moodien simulaatiota

seg-1461aa14a7ff = Maa-aseman ylilentojen ennustus (maasegmentti)

seg-e1cf1ec4f005 = Aikatason näkyvyysylilennot (AOS/TCA/LOS, maksimikorkeuskulma, kesto) moottorin propagaattorille aseman yli korkeuskulmamaskin yläpuolella, interpoloiduin nousu- ja laskuylityksin sekä kokonaissaavutettavuus: passes::predict_passes, geometrinen aikataulutin (ei refraktiota eikä valon kulkuaikaa). Skenaariolaji <c1/> ajaa rivin 'Apparent ground-station pass prediction with refraction and light time' näennäisen ennustimen

seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } – riippumaton lentodynamiikkakirjasto: ElevationDetector (Brentin juurenhaku) + EventsLogger ITRF-efemeridin yli, asema WGS-84 TopocentricFramena. AOS/LOS/maksimikorkeuskulma/ylilentojen lukumäärä/kokonaissaavutettavuus täsmäytetty identtisellä radalla+asemalla+maskilla+ikkunalla (sitoutettu testiaineisto; ajuri xval/orekit-passes)

seg-1dd8b2655b18 = Maa-aseman näennäisten ylilentojen ennustus refraktiolla ja valon kulkuajalla

seg-46f93d3c24d2 = Näkyvyysylilennot (AOS, TCA, LOS, suurin näennäinen korkeuskulma, kesto) SGP4-elementtijoukolle WGS-84-aseman yli validoidulla Maa-radan polulla (IAU 2006/2000A, valinnaiset Maan orientaatioparametrit), ITU-R P.834-9 -troposfäärirefraktiolla (yhtälöt { "9" } – { "14" }, suosituksen painetut kertoimet) ja alalinkin valon kulkuajalla, kumpikin kytkettävissä; ylitykset ratkaistaan bisektiolla tarkkuuteen { "1e-7" } s ja kulminaatio kultaisen leikkauksen haulla. Ajettavissa CLI:stä/sidonnoista skenaariolajina <c1/> (scenarios/passes.toml), molemmat korjaukset oletuksena päällä

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

seg-3692f1fc89e6 = Offline-oletuksena oleva Maan orientaatiosyöte on todellinen IERS-tuote

seg-f9a9d385fd26 = <c1/>-ajonaikainen oletus on kirjaston oma sulautettu kopio sanatarkasta IERS finals2000A -otteesta (tools/finals2000A_20260930.txt: { "174" } peräkkäistä päivärivia, MJD 61224-61397, leikattu 2026-09-30:n finals2000A.all -tiedostosta), ja se sisältää kaikki kolme rivivintagea, jotka muoto määrittelee, luokiteltuna IERS:n I/P-lipuilla (eop::row_vintage): { "30" } Bulletin B finals -riviä, { "54" } nopeaa mitattua riviä (lippu I ilman Bulletin B -lohkoa) ja { "90" } Bulletin A -ennustetta (lippu P). Paljas ajo ilman tiedostoargumenttia ja ilman verkkoa antaa täytetyn horisonttikohtaisen taulukon, rivilaskennan rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) ja predicted_rows.n = { "90" } välillä MJD 61308-61397; ennustettu vs lopullinen -vertailujen julkaisuhetken katkaisu on viimeinen mitattu rivi. Aiempi 32 rivin ote (tools/finals2000A_2026.txt, jokaisen rivin lippu I) ja viiden rivin vain lopullisia sisältävä ote pysyvät toimitettuina ja käytössä: niillä predicted_rows.n on { "0" }, mikä on syötetiedoston ominaisuus eikä jäsentimen tulos

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

seg-1f10810131be = NAIF-ytimen lukija: DAF-säiliö, SPK-tyyppi { "2" } ja binäärinen PCK-tyyppi { "2" }

seg-7da4847e7a28 = Moottorin oma puhtaasti Rust-kielinen NAIF-binääriytimien lukija (naif_kernel): DAF-säiliö (molemmat tavujärjestykset, linkitetyt yhteenvetotietueet), SPK-tyypin 2 Chebyshev-paikkasegmentit ketjutettuna keskustensa kautta alimpaan yhteiseen kantaan, ja binäärisen PCK-tyypin 2 Euler-kulmasegmentit muutettuna J2000-koordinaatistosta kappaleen koordinaatistoon -rotaatioksi, epookit kaksiosaisena ET:nä niin, että alle mikrosekunnin siirtymä säilyttää tarkkuutensa. Sen kautta lukevat DE440:n KernelEphemeris (ephem_provider) sekä lunar_vlbi-, lunar_llr- ja lunar_vlbi_fim-moduulien ydinpolut. Väite on, että se lukee JPL:n ytimiä oikein; se ei ole väite siitä, että DE440 tai moottorin analyyttiset Aurinko- ja Kuu-sarjat olisivat tarkkoja

seg-e08e98908f3a = Maan GNSS Kuun etäisyydellä

seg-dd8ce373d1f6 = Maan GNSS:n vastaanotto Kuun etäisyydellä: heikon signaalin kerros, jonka P7:n taulukko { "1" } nimeää ja jolle moottorilla ei ollut mallia. Satelliittia ja epookkia kohti se laskee poikkeaman keilan akselista suhteessa lähettimen nadiriin, peittääkö Maa suoran reitin, vinoetäisyyden ja sen vapaan tilan häviön, lähetysvahvistuksen tässä kulmassa, vastaanotetun tehon ja kantoaalto-kohinatiheyden; sen jälkeen se aggregoi vain linkit, jotka ylittävät seurantakynnyksen, ja pyyhkäisee koko tähdistökierroksen, jotta vastaus on JAKAUMA eikä yksittäinen otos. Kolme tosiasiaa ohjaa tulosta, ja raportti toteaa jokaisen: Maa näkyy { "13.90" } asteen kulmassa tähdistön säteeltä, joten keilan HUIPPU ei ole geometrisesti saatavilla yhdellekään Kuuhun suuntautuvalle säteelle; jäljelle jää pääkeilan reuna ja sivukeilat, se alue, jossa LuGRE toimi Kuussa { "2025" }; ja L1-polun häviö on noin { "208" } dB, noin { "25" } dB enemmän kuin maanpäällinen käyttäjä maksaa. MEASURED mukana toimitetulla 24 satelliitin GPS-luokan geometrialla { "64" } epookin yli yhden kiertojakson ajan: SIGNAALIN saatavuus { "0.375" } parhaan linkin ollessa { "30.93" } dB-Hz ja PAIKKARATKAISUN saatavuus { "0.000" } – enintään kaksi samanaikaista seurattavaa linkkiä, ei koskaan neljää, jonka paikka vaatii. Näiden kahden saatavuuden erottelu on koko pointti, ja raportti ei salli niiden sekoittamista: Maan GNSS Kuun etäisyydellä on AJOITUSLUOKAN kerros, ei paikkaluokan, ja kerroksellisen kestävyyden priorin on otettava paikkaratkaisun saatavuus. Ehdollisuus annetaan samasta syystä – jokainen näkyvä satelliitti on Kuusta nähtynä muutaman asteen levyisen kartion sisällä, joten näkölinjat ovat rakenteellisesti lähes yhdensuuntaisia. Ajettavissa lajina <c1/> Uudelleenmuotoiltu D7:n mukaan: väite Kuun etäisyydellä on satelliittien välinen SUHTEELLINEN kantoaalto-kohinatiheys yhdessä epookissa, mitatuista kaksiulotteisista lähetyskuvioista (NAVCEN Block IIR/IIR-M) sekä geometrinen näkyvyys; absoluuttista C/N0:aa ei väitetä (Parker ym. raportoivat yhteisen { "7" } – { "12" } dB:n häviön).

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

seg-b0b618abf402 = Yhteismoodin eheyssokeus

seg-e732ac99a9ae = Tarkka pariteettialiavaruuden jako mittausvirheestä osaan, jota RAIM ei näe, ja osaan, jonka se näkee. Linearisoidulle hetkellismallille y = G·x + e mikä tahansa virhe dy hajoaa yksikäsitteisesti SOKEAKSI komponentiksi avaruudessa range(G) – absorboituu tilavirheenä S·dy ja nollautuu residuaaliprojektorissa Pperp = I − G·S, joten se on näkymätön MILLE TAHANSA residuaalitestille, ei vain tietylle kynnykselle – ja HAVAITTAVAKSI komponentiksi pariteettiavaruudessa. Moduuli palauttaa projektorin, jaon ja sokean osuuden, jotta kutsuja voi kvantifioida, kuinka suuren osan tietystä virheestä hetkellinen monitori ei rakenteellisesti kykene raportoimaan. Sovellettuna todelliseen efemeridien väliseen lattiaan: metritasoinen DE440 vs INPOP21a ja DE440 vs EPM2021 -ero geosentrisessä Kuun paikassa absorboituu lähes kokonaan käyttäjän paikkavirheeksi (sokean osuuden mediaani { "1.000000" }; sokean paikkavirheen mediaani { "2.3955" } m ja { "2.0050" } m) pariteettijäännöstä vasten tasolla { "1e-15" } m

seg-845e9f5eec81 = Yhteismoodin suojaustaso ja eheyden kokonaisverhokäyrä

seg-2246ffa73869 = cmpl_horizontal rajaa sokean yhteismoodiluokan aiheuttaman k-sigman vaakapaikkavirheen muodostamalla blind_position_covariance = S*Cov*S^T ja projisoimalla sen ENU-koordinaatistoon; integrity_envelope raportoi hpl_total = hpl_araim + cmpl. Ero, jonka tekemiseksi pari on olemassa: RAIM/ARAIM-RESIDUAALItesti on todistettavasti sokea range(G)-virheille, mutta ARAIM-SUOJAUSTASO ei ole – sen vikaton termi rajaa ne jo tarjoajan URA:han plus nimelliseen harhaan asti. CMPL on siksi vain tarjoajien välinen YLIMÄÄRÄ, jota yhden tarjoajan tarjoajakohtainen URA/ISM ei ylärajaa, ja summa on konservatiivinen kolmioepäyhtälöraja eikä RSS, voimassa vain siellä, missä tämä ylimäärä ei jo sisälly URA:han.

seg-ffc59a7ed497 = Analyyttinen projektorialgebra tarkistettuna itseään vasten: range(G):hen rajoittuvan kovarianssin on annettava positiivinen CMPL, pariteettiavaruuteen rajoittuvan kovarianssin likimain nolla, ja verhokäyrän on summattava kaksi mittausavaruudessa ortogonaalista osuutta. Yhteismoodin kovarianssi, tähdistön geometria ja k ovat edustavia mallinnettuja syötteitä, EI sertifioitu budjetti, eikä väitetä, että kolmioraja olisi tiukka. HUOMAUTUS ALKUPERÄSTÄ: cmpl_horizontal, blind_position_covariance ja integrity_envelope ovat julkisia ja toimitettuja, ja niiden yksikkötesteihin oli jo viitattu yhteismoodin sokeusrivillä, mutta itse VERHOKÄYRÄVÄITTEELLÄ ei ollut riviä – joten ainoaa varoitusta, joka pitää sen rehellisenä, eli että summa on kolmioraja eikä RSS, ei ollut kirjattu minnekään kirjanpidossa (ledger). Rivi rekisteröi väitteen ja varoituksen yhdessä.

seg-5ed34a5b402e = Kuun yhteinen monitekniikka-OD + kello

seg-5ace1caff5a9 = VLBI:n + Kuun paikallisen etäisyysmittauksen + satelliittien välisen etäisyysmittauksen eräfuusio aseman ja tähdistön paikkojen ja kellojen palauttamiseksi

seg-69fbe488dec5 = Fisher-informaatio ja Cramér–Rao-havaittavuus

seg-043d4c7a2d6a = Fisher-informaatio M=HᵀWH, Cramér–Rao-alaraja, havaittavuuden aste ja datumvajeen nolla-avaruus (Moore–Penrose-pseudokäänteismatriisi) sekä D/A/E/T-optimaaliset koesuunnittelun skalaarit symmetrisestä Jacobin ominaisarvoratkaisijasta

seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-pohjainen) — riippumaton kolmannen osapuolen auktoriteetti, joka laskee samat yksikäsitteisesti määritellyt ominaisarvot, σ²(XᵀX)⁻¹ Cramér–Rao -kovarianssin ja GNSS-tarkkuuden heikkenemiskertoimet (DOP) eri algoritmilla (LAPACK divide-and-conquer + LU) kuin Kshanan syklinen Jacobi-pyyhkäisy ja spektraalinen pseudokäänteismatriisi; tulokset täsmäävät toleranssilla { "1e-9" }. Sama ulkoisen kirjaston luokka validoi jo DOP-moottorin (gnss_lib_py-kirjastoa vastaan) ja χ²- ja erf-ytimet (SciPyta vastaan). Lisäksi ristiintarkistettu Kayn ({ "1993" }) suljetun muodon CRLB-arvoja ja Monte Carlo -CRLB:n saavuttamista vastaan (sisäinen)

seg-e4ec41d0f5e1 = Kuun absoluuttisen aseman havaittavuus (datumvaje)

seg-b3e4160042d2 = Yhteisen Kuun ratkaisun Fisher-informaatiohavaittavuus: ilman Maa-peruslinjoja absoluuttisen koordinaatiston datum on matriisin HᵀWH nolla-avaruudessa (aseman sijaintia ei voi havaita); ≥{ "3" } peruslinjaa palauttaa täyden asteen ja rajaa aseman Cramér–Rao-virheen, jonka estimaattori saavuttaa

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

seg-325900ed59ea = GNSS IQ -kohtauksen signaaligeometria riippumatonta kantataajuusgeneraattoria vastaan

seg-ee5625b30ff2 = IQ-kohtausgeneraattorin satelliittikohtainen totuus GPS L1 C/A -broadcast-efemeridikohtaukselle (iq::scene: broadcast-efemeridi SatGeometry, generoituna TruthRecord-totuustietueiksi): mitkä satelliitit ovat horisontin yläpuolella, pseudoetäisyys, koodivaihe ensimmäisessä näytteessä, kantoaallon Doppler ja katselukulmat staattiselle vastaanottimelle, verrattuna kanavatilaan, josta gps-sdr-sim rakentaa oman I/Q-tulosteensa ensimmäisen lohkon samalle efemeridille, vastaanottimelle ja aloitusajalle (ionosfääri pois molemmilla puolilla)

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

seg-d31be81dfd8f = TDOA/FDOA-passiivinen lähettimen geopaikannus

seg-aa870cee16f6 = Paikantaa lähettimen (häirintälaite/harhauttaja tai oportunistinen lähde käänteis-PNT:tä varten) vastaanotinverkon saapumisaikaerosta (TDOA) — τᵢ=(Rᵢ−R₀)/c-hyperboloidien leikkaus ratkaistuna Gauss–Newton-pienimmällä neliösummalla — ja lisäämällä taajuuserot (FDOA, etäisyysnopeuksien erot) liikkuvilla vastaanottimilla palauttaa yhdessä sijainnin ja nopeuden; sijaintikovarianssin Cramér–Rao-alaraja mittausgeometriasta

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

seg-38cabd4921c1 = Kovarianssin uudelleenkasvu luovutuksen jälkeen hälytysrajaa vasten

seg-9287268bbada = Raportti hybrid-optical-rf paljastaa suodattimen prosessikohinamallin ja kertoo, kuinka kauan luovutuksen jälkeinen ratkaisu pysyy hälytysrajan sisällä: kummallekin luovutussuunnalle se ottaa luovutuksen jättämän akselikohtaisen kovarianssin, etenee sillä eteenpäin ilmoitetulla satunnaiskulun prosessikohinalla ja raportoi hetken, jolloin kattavuuskertoimella skaalattu 1σ saavuttaa vaaka-, pysty- ja ajoitushälytysrajan, minkä raja ensin sitoo, varianssin kaksinkertaistumisen aikavakion sekä otannalla muodostetun vapaan etenemisen profiilin, joka haarukoi ylityskohdan. Prosessikohinan PSD:t, kattavuuskerroin ja hälytysrajat ovat kaikki syötteitä dokumentoiduin oletuksin

seg-c85b822227f3 = Ei ulkoista oraakkelia. Ylitys on satunnaiskulun varianssin kasvun suljetun muodon ratkaisu, ja testit laskevat sen uudelleen riippumattomasti raportin itse julkaisemista arvoista eikä lähettäjän sisäisistä arvoista. Lähtökovarianssi on lukittu bitti bitiltä jäljelle, jonka olemassa oleva luovutuslohko jo raportoi, joten vapaa eteneminen ei voi edetä kovarianssilla, jota kukaan muu ei nähnyt. Prosessikohinan PSD:t ovat MODELLED edustavia syötteitä, ja ylitysajat skaalautuvat suoraan niiden mukana, minkä skaalaustesti toteaa mitattuna ominaisuutena eikä väitteenä. ExternalDataset on tarkoituksella hylätty: vapaan etenemisen aika on suora funktio kahdesta mallinnetusta PSD:stä ja hälytysrajoista, jotka ovat itsekin edustavia, eikä mitattua kuun optisen ja RF-luovutuksen vapaata etenemistä ole vertailtavaksi. Ulkoinen oraakkeli vaatisi tässä julkaistun luovutuksen jälkeisen kovarianssin kasvun tai holdover-tarkkuuden käyrän vertailukelpoiselle vastaanottimelle, jonka prosessikohinamalli on ilmoitettu, tarkistettuna toleranssiin

seg-a3b8272862aa = Keilan suunnan ulkopuolinen antennikuvio kuun geometrian viennissä

seg-27d246503a48 = Satelliittikohtainen geometrian vienti sisältää kullekin (epookki, satelliitti) -parille keilan suunnan poikkeaman SATELLIITILLA ja lähetysvahvistuksen kohti paikkaa todellisesta tasaisesti valaistusta ympyräaukon (Airy) kuviosta ja raportoi keilan sisällä olevien satelliittien lukumäärän tällä kuviolla SYMMETRISEN vahvistus–keilanleveys-approksimaation (θ_3dB[deg] = √(31000/G_lin)) mukaisen lukumäärän VIERESSÄ; erotus annetaan eksplisiittisenä korjauksena linkeissä, satelliiteissa epookkia kohti ja pahimpana yksittäisenä epookkina. Approksimaation molemmat implisiittiset aukkohyötysuhteet annetaan ({ "0.641" } verrattuna sääntöön { "70" }·λ/D astetta, jolla se esitetään, { "0.920" } verrattuna tasaiseen ympyräaukkoon), jotta sen hiljaisesti olettama hyötysuhde on ilmoitettu eikä pääteltävä. Oletuksena pois: lohko näkyy vain, kun sekä vientipaikka että aukko on annettu

seg-6fbfa234ef3e = Seurantasilmukan lukituksen menetys ja harhautuksen sisäänveto häiriön alla

seg-f78c1f28a3f7 = Lukituksen menetys lasketaan silmukkadynamiikasta tehosuhteen sijaan: kantoaallon (Costas) ja koodin (epäkoherentti early/late) 1σ:n terminen värinä C/N₀:n funktiona neliöintihäviöllä, ilmoitettuja sääntöjä 3σ_PLL + θ_e ≤ { "45" }° ja 3σ_DLL + ramppiviive ≤ d/2 sirua vasten; pudotuksen ja uudelleenlukituksen C/N₀-kynnykset sitovaa silmukkaa nimeten ja hystereesi JOHDETTU leveämmästä sisäänvetokaistanleveydestä eikä väitettynä; ilmoitettu lukituksen menetyksen aika kahden kynnyksen lukitusilmaisimesta vahvistusviipeillä, raportoituna erikseen fysikaalisesta vaiheen karkaamisajasta (Viterbin keskimääräinen aika syklihyppyjen välillä, log₁₀ s -yksikössä, koska se kattaa satoja kymmenpotensseja); suurin koodin liukuma ja kantoaallon Doppler-muutosnopeus, joita uhrin silmukat pystyvät seuraamaan; sekä silmukkadynamiikan implikoima ESTOSÄDE raportoituna olemassa olevan tehosuhdesäteen rinnalla niiden etumerkillisellä erotuksella omana nimettynä kenttänään. Ajettavissa skenaariotyyppinä <c1/>

seg-69155fb79ebd = Kuun VLBI-aseman koordinaattikovarianssi seurantaaikataulusta

seg-141285301f58 = Viivepartiaalit kertyvät kantaviiva × epookki -aikataulusta Fisherin informaatiomatriisiksi, joka käännetään aseman koordinaattikovarianssiksi ja koordinaattikohtaiseksi aseman sigmaksi ja korvaa oletetun isotrooppisen tasajaon linkin skalaariviiveen toistotarkkuudesta. Tila sisältää Maa-kiinteät (ITRS) asemakoordinaatit, joten Jacobin matriisi on inertiaalinen partiaali kierrettynä kunkin epookin GCRS→ITRS-matriisilla, ja Maan pyöriminen tekee koordinaateista havaittavia: raportti MITTAA Maa-kiinteän näkölinjan pyyhkäisyn ja majakan deklinaation eikä oleta niitä. Aste, datumin vajaus, ehtoluku, informaatiospektri ja vapaan verkon nolla-avaruus annetaan jokaisella ajolla, ja asteen puutteessa otsikkosigma julkaistaan arvona NULL tilan kera sen sijaan, että se luettaisiin lähes singulaarisesta käänteismatriisista. Tasajakoarvo c·σ_τ·√(g/N) SAMALLE aikataululle tulostetaan lasketun arvon viereen niiden suhteella sekä isotrooppisella jälkirajalla √(p/trace(M)), jonka AM-HM tekee kovaksi alarajaksi. Ajettavissa skenaariotyyppinä <c1/>

seg-0f4d023fe2d4 = Kuun pintapisteen koordinaattikovarianssi VLBI-viiveaikataulusta, erillään Maa-aseman kovarianssista

seg-47352405133b = Kolmas datumvaihtoehto, <c1/>, joka pitää kaikki Maa-asemat kiinteinä ja estimoi vain MAJAKAN Kuu-kiinteät koordinaatit: juuri tämä on konfiguraatio, jolle kuun pintapisteen epävarmuus todellisuudessa ilmoitetaan, koska Maa-asemien koordinaatit ovat viivemallin syöte eivätkä sen tuntematon. Se on olemassa, koska asematason kovarianssi ja pintapistekovarianssi ovat ERI SUUREITA, joita erottaa vipuvarsi ρ/B, eikä mikään aiemmin estänyt ilmoittamasta toista toista vasten. Lähetetty lohko <c2/> sisältää arvon ρ, pisimmän kantaviivan, vipuvarren, tasajakolinkin pintapistemuodon c·σ_τ·(ρ/B)·√(g/N), lasketun koordinaattikohtaisen majakan sigman ja niiden suhteen: suhde on null eikä harhaanjohtava aina, kun majakkaa ei estimoida tai matriisi on asteeltaan vajaa. B otetaan PISIMPÄNÄ läsnä olevana kantaviivana, edullisimpana, joten suhde voi vain aliarvioida. Ajettavissa muodossa <c3/> asetuksella <c4/>, joka evätään viestillä, joka nimeää puuttuvan syötteen, kun majakkaa ei estimoida

seg-18096ae23d96 = Suljetun muodon identiteetit, joille ei väitetä eikä ole saatavilla ulkoista oraakkelia. Vipuvarsi on tarkistettu suhdetta ρ/B vasten ja kaksi tasajakomuotoa toisiaan vasten tarkkuudella { "1e-15" }: algebrallisia identiteettejä, jotka siis havaitsevat kytkentävirheen eivätkä muuta, ja ne on merkitty sellaisiksi. Olennainen tulos on MEASURED eikä väitetty: kiinteän kantaviivan viive rajoittaa majakan SUUNTAA, joten näkölinjan komponentti pääsee informaatiomatriisiin vain lähikentän etäisyystermin kautta, ja testi lukee tuloksena olevan anisotropian lähetetystä spektristä eikä johda sitä. AM-HM tekee √(p/trace(M)):stä kovan alarajan, joten isotrooppinen tasajakolinkki voi vain aina ALIARVIOIDA, ja laskettu / tasajako -suhde on täsmälleen se anisotropia, jonka se hylkäsi. MEASURED Goldstone-tyyppisen ja Canberra-tyyppisen parin osalta, jonka jänne on { "10726.748" } km: { "112" } otospäivän aikana { "36" } ei salli lainkaan molemminpuolisesti näkyvää epookkia { "10" }°:n maskilla, suurin koskaan molemminpuolisesti näkyvä määrä on { "17" } 49 otoksen aikataulusta, ja { "73" } kelvollisella päivällä kolmen komponentin suhde vaihtelee arvosta { "113.9" }× neljään suuruusluokkaan isommaksi, mediaani { "1513" }×, kun taas rajaus kahteen poikittaissuuntaan, joita näkölinja ei näännytä, antaa { "3.94" }×–{ "25.8" }×, mediaani { "7.8" }×. MITÄ TÄMÄ RIVI EI VÄITÄ: yhtäkään näistä luvuista todellisen kampanjan ominaisuutena. Se osoittaa, että pintapistesuure LASKETAAN nyt eikä oleteta, ja ettei sitä voi hiljaa vaihtaa asematason suureen. Pysyy tasolla ReferenceImpl/MODELLED: julkaistua kuun VLBI-pintapistekovarianssia ei ole olemassa vertailuun, asemat ja majakan paikka ovat havainnollistavia eivätkä mitattuja, ja efemeridi, kellot, troposfääri ja Maan orientaatioparametrit pidetään KIINTEINÄ, joten tämä on Cramér–Rao-raja supistetulle parametrijoukolle ja itsessään optimistinen. Sama suure ydinpolulla (majakka DE440-Kuulla) on validoitu omalla rivillään ”…, kernel path”; tällä analyyttisellä polulla pienin majakan sigma on { "3.9" } % alle sen rivin SPICE-oraakkelin, minkä vuoksi tämä rivi pysyy tasolla MODELLED

seg-8958521eedf7 = Kuun pintapisteen koordinaattikovarianssi VLBI-viiveaikataulusta, ydinpolku

seg-8ac12ca0f272 = Skenaarion lunar-vlbi-fim kaikki asemat kiinteinä -majakkakovarianssi (kaikki Maa-asemat pidetään, majakan Kuu-kiinteät koordinaatit estimoidaan yksin), majakka sijoitettuna JPL:n DE440-Kuulle, jonka moottorin oma ydinlukija lukee (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Vain Kuun keskipiste eroaa analyyttisestä polusta; IAU { "2015" } -kappaleen pyöriminen, asemat, Maan pyöriminen ja lineaarialgebra ovat samat. Validoidut tulosteet ovat havaintojoukko, { "3" } x { "3" } -informaatiospektri, aste ja ehtoluku, kolme Kuu-kiinteää majakan sigmaa ja niiden RMS, vipuvarsi sekä laskettu / tasajako -suhde oletusaikataululla. Ajettavissa skenaariona <c1/> asetuksilla datum = "all-stations-fixed", estimate_beacon = true ja planetary_kernel_path asetettuna

seg-0315968c8214 = Kuun differentiaalinen PNT: korjauslinkin jäännösbudjetti

seg-c6785166a44c = Kolme termiä, jotka differentiaalikorjaus kerää sen hetken, jona se lasketaan, ja sen hetken, jona sitä käytetään, välillä, kukin aiemmin jätetty mallintamattomaksi varaksi: referenssiaseman mittausvirhe (korreloitunut satelliittien kesken, kantaviivasta riippumaton, ~{ "1" }:{ "1" } paikan siirto ja todistetusti DOP:n vahvistamaton), korjauksen vanheneminen (jäädytetty ratavirhevektori projisoituna uudelleen näkölinjalle, jolle moottorin oma propagaattori asettaa satelliitin yhden viiveen myöhemmin, sekä c·σ_y(τ)·τ-kellon ajautuma kalibroidusta potenssilaista) ja tasainen linkin kvantisointi täsmällisellä ±(orbit_err + clock_err) -täyden asteikon alueella varianssilla step²/12. Raportoidaan sekä etäisyys- että paikka-alueella olemassa olevan jäännöksen ja suojaustason rinnalla, ei koskaan niiden tilalla, viivekäyrä yksittäisen luvun vieressä

seg-29b8e6c12471 = Suljetun muodon identiteetit ja itseyhdenmukaisuus: tasaisen kvantisoijan step²/12-varianssi, täsmällinen (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹-kovarianssin eteneminen supistuen arvoon σ·PDOP yhtäsuurilla σ:illa, mittausvirhetermin { "1" }:{ "1" }-siirto seurauksena yhtälöstä û_user ≈ û_ref sekä pois kytketyn kvadratuurin sulkeutuminen. PDOP-ristiintarkistus funktiota orbit::dop vasten jakaa [−û, { "1" }]-normaalimatriisin, joten se on johdonmukaisuustarkistus ja merkitty sellaiseksi eikä riippumaton oraakkeli. ExternalDataset-tasoa ei ole saatavilla eikä väitetä: millään kuun pinta-asemalla ei ole julkaistua mitattua tarkkuutta, millään kuun differentiaalikorjauslinkillä ei ole julkaistua viivettä tai viestimuotoa, ja kvantisointitulos on suljettu muoto eikä mittaus. RTKLIB, joka on jo ulkoinen koodioraakkeli yksittäisdifferenssi- ja painotetun pienimmän neliösumman ytimelle, voitaisiin ajaa tahallaan virheellisesti mitatulla tukiasemalla { "1" }:{ "1" }-mittausvirhesiirron vahvistamiseksi, mutta se on riippumatonta koodia saman ensimmäisen kertaluvun näkölinja-algebran päällä. SUURUUDET OVAT MODELLED: mittausvirheen oletus on tämän kirjaston oma kuun koordinaatiston realisaatiovaraus eikä mitattu asema, viive ja bittimäärä ovat ILLUSTRATIVE syötteitä, eikä lähetetyn efemeridivirheen VEKTORIN itsensä kasvua mallinneta lainkaan: tämä on ilmoitettu lähetetyssä vanhenemislakimerkkijonossa, koska se on termi, joka todennäköisimmin dominoi todellista linkkiä

seg-c42646ae4707 = Kuun referenssiaseman kattavuus- ja tarkkuuskartta

seg-1f9834b32629 = Kuun differentiaalisen PNT-mallin Monte Carlo -pyyhkäisy etelänapaisen käyttäjäruudukon ja vuorokauden epookkien yli (tyyppi <c1/>): tunnetulla etelänapaisella paikalla olevalle differentiaaliselle referenssiasemalle pisteittäin ja alueen yli: korjatun ja korjaamattoman paikkavirheen persentiilit (3D, vaaka, pysty), saatavuus syineen jokaiselle ei-saatavilla olevalle epookille (user_lt4, station_missing_sat), ennen ajoa ilmoitettua kynnystä vasten mitattu kattavuus, DO-229E-suojaustasot, kattavuussäde atsimuuttisektoreittain sekä korjauslinkin budjetti asemalla ja pahimmassa pisteessä. Ei lausuma minkään todellisen järjestelmän suorituskyvystä; ei yhteydessä mihinkään virastoon eikä sen hyväksymä

seg-7ecf4b0038b0 = Kuun maaston horisonttimaskit ilmoitetusta profiilista tai napa-DEM:stä

seg-7102948907bc = Paikkakohtaiset atsimuutista riippuvat horisonttimaskit tyypille lunar-station-coverage (referenssiasema ja jokainen käyttäjäpiste) sekä moonlight-service-volume-ruudukolle ja sen satelliittikohtaiselle vientipaikalle (jokainen vientirivi saa kentän clears_terrain), versiossa { "0.36" } olevassa skyline-taulukkomuodossa (skyline::Skyline, lineaarinen atsimuutissa kierrolla kohdassa { "360" } astetta; ilmoitettu profiili ja DEM-horisontti yhdessä paikassa yhdistyvät pisteittäisenä maksimina): ilmoitettu [terrain] station_horizon tai user_horizon lähteellä merkittynä ja/tai horisontti, joka on säteenseurattu etelänapaisen stereografisen DEM:n yli (LRO LOLA -ruudukotettu napaasettelu, luettu kuvaajasta, joka kiinnittää sen koon ja SHA-256:n, tai leveys-/pituuspiiriin perustuva realdata::lola_dem-laatta asetuksella [terrain] dem_tile_path, kaiuttuna SHA-256:lla) Kuun pallon isoympyröitä pitkin täsmällisellä kaarevuudella, ilmoitetusta mastokorkeudesta, ilmoitetulla atsimuuttiaskeleella ja kantamalla. Satelliitti lasketaan paikassa mukaan, kun se ylittää tasaisen mask_deg-maskin ja horisontin atsimuutissaan (lunar_service::topocentric); epookki, jonka horisontti jättää alle neljään satelliittiin pisteessä, jossa tasainen maski antaa neljä, lasketaan ei-saatavuuden syyksi terrain_masked. Mukana toimitettu DEM on julkisen alueen LOLA LDEM_75S_240M -tuotteen rajaus, { "5" } x { "5" } -lohkokeskiarvolla uudelleennäytteistetty tarkkuuteen { "1200" } m (data/lunar-dem/NOTICE.md). Poissa ollessa jokainen paikka pitää tasaisen maskin ja jokainen asiakirja on tavu tavulta identtinen

seg-d37bb01e270b = Kuun referenssiaseman monitie-eteneminen ja vastaanottimen laitteistotermit

seg-1103199f019b = Tyypin lunar-station-coverage valinnainen [receiver]-osio (LRS-02): korkeuskulmasta riippuva monitie-sigma sigma(el) = a + b exp(-el / el0) käyttäjällä ja asemalla (RTCA DO-229:n ilmaan sijoitetun käytön funktiomuoto, oletuksina a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } astetta; Kuulla jokainen arvo on ILLUSTRATIVE), valkoinen käyttäjällä ja ensimmäisen kertaluvun Gauss–Markov epookkien yli asemalla (rho = exp(-dt / tau)); early-minus-late-DLL:n terminen koodikohina sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); kanavien väliset kanavakohtaiset harhat vakiona kokeen ajan käyttäjällä ja asemalla. Aseman termit vaikuttavat sen korjauksiin, käyttäjän termit raaka- ja korjattuihin mittauksiin, kukin omalla siemenluvulla generoidulla virrallaan. Poissa ollessa jokainen asiakirja on muuttumaton

seg-4fbc7d86b491 = Suljetut muodot ja mallin omien arvontojen tilastot (InternalConsistency): DLL-kaava käsinlaskentaa vasten, DO-229-muoto, kahden vastaanottimen nollakantaviivan erotus, Gauss–Markovin lag-1-korrelaatio. Vertailtavaa kuun monitie-etenemis- tai vastaanotinmittausta ei ole; arvot ovat ILLUSTRATIVE, eikä mikään tässä ole lausuma minkään todellisen vastaanottimen suhteen

seg-03796cb741b6 = Kuun referenssiaseman efemeridivirheen kasvu korjausviiveen aikana

seg-13b0ae9a874a = Tyypin lunar-station-coverage valinnainen syöte orbit_err_growth_m_per_s (LRS-03): korjaus, joka sovelletaan latency_s sen laskemisen jälkeen, ohittaa lähetetyn ratavirheen kasvun g latency_s, g isotrooppinen 3D-RMS-nopeudella, arvottuna satelliittia ja koetta kohti omalla siemenluvulla generoidulla virrallaan (alueen 1-sigma-nopeus tau / sqrt({ "3" })), jäädytetyn virheen näkölinjalle uudelleenprojisoinnin lisäksi. Poissa ollessa jokainen asiakirja on muuttumaton. K5-lisäys julkaistujen väitteiden vertailuun, ennakkorekisteröity yksin, ajaa K5:n arvoilla { "0.001" }, { "0.01" } ja { "0.1" } m/s (ILLUSTRATIVE)

seg-90307f07e0ef = Kuun vertailuaseman ratkaisutilat: korkeusrajoite, kolme satelliittia, staattisen käyttäjän ikkuna

seg-366c7ad03fb2 = Valinnainen [solution]-osio skenaariolajissa lunar-station-coverage (LRS-06): korkeuden pseudomittausrivi up . dx = e_h, jonka ilmoitettu 1-sigma painotetaan etäisyysrivejä vasten; kolmen satelliitin vähimmäismäärä sallitaan vain sen kanssa; lisäksi painotettu pienimmän neliösumman ratkaisu viimeisten window_epochs epookin yli, jossa on yhteinen staattinen sijainti ja yksi kello epookkia kohden (suodattimen vastaus staattiselle sijainnille ilman prosessikohinaa samalla datalla; epookkien virheitä käsitellään riippumattomina). Jos osiota ei ole, hetkellinen ratkaisu ja jokainen dokumentti pysyvät ennallaan. Lisäys julkaistujen väitteiden vertailuun lähteiden ratkaisutyylillä, ennakkorekisteröity yksinään

seg-611ba369ed00 = Kuun vertailuaseman tarkkuus ja kattavuus julkaistuja väitteitä vastaan

seg-4fe4f1cffa2b = Skenaariolaji lunar-station-coverage ajettuna Kuun differentiaaliselle vertailuasemalle julkaistun aineiston julkisilla oletuksilla (neljä navigointisatelliittia { "24" } h jäädytetyillä elliptisillä radoilla, { "10" } m, { "95" } % SISE, { "0.30" } m koodikohina, { "1" } s ja { "600" } s korjausviive, alle desimetrin aseman mittaus, julkaistu esimerkkiasemapaikka, { "300" } km ja { "600" } km etelänapa-alueen ympyrät) ja pisteytettynä lähteiden numeerisia väitteitä vastaan kuuden yksipuolisen kynnyksen mukaan, jotka ennakkorekisteröitiin ennen ajoa: koko etelänavan kattavuus alle metrin p95-tasolla (K1, K2), alle metrin ja desimetritason korjattu p95 (K3, K4), alle metrin taso säilyy { "600" } s viiveellä (K5) ja tarkkuus säilyy perusviivan välillä { "10" } km - { "500" } km (K6)

seg-478225d0a8e1 = Kuun ARAIM-suojaustason ydin

seg-863690a44f21 = Kuun suojaustason geometriasta kovarianssiin -vaihe — (GᵀG)⁻¹ kaikkien näkyvissä olevien satelliittien ja jokaisen yksittäisen vian aligeometrian yli, projisoituna paikalliselle pystysuunnalle ja vaakalohkon jäljelle — sekä sen tilastollinen ydin: Bonferronin ilmaisinkerroin, jokaisen vikahypoteesin gaussinen yläpyrstö ja juurenratkaisu, joka kuvaa eheysriskibudjetin suojaustasoksi, 7 pisteen Kuun palvelutilavuudessa

seg-8191906fc700 = Kaksi vakiintunutta kolmannen osapuolen toteutusta yhdistettynä, molemmat ajettu offline-tilassa, ja fixture luotu uudelleen päästä päähän ja varmennettu tavu tavulta identtiseksi. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c käännettynä C-lähdekoodista lipulla -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() kääntää normaalimatriisin Croutin LU-hajotelmalla osittaisella pivotoinnilla, algoritmilla, jolla ei ole yhteyttä kshana-toteutuksen käsin kirjoitettuun Gauss-Jordan-käänteisfunktioon invert4(); numpy.linalg.inv (LAPACK getrf/getri) kääntää jokaisen uudelleen kolmantena riippumattomana käänteismatriisina ja on RTKLIB:n kanssa yhtä mieltä suhteellisella tarkkuudella { "1.112e-12" }. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) tarjoavat funktiot norm.isf, norm.sf (Cephes ndtri/ndtr) ja optimize.brentq, joita verrataan kshana-toteutuksen Numerical-Recipes-epätäydellisen gammafunktion sarjaan, puolittamalla haettuun käänteisfunktioon ja 200-askeleiseen puolitukseen — ja SciPyn suora sf on eri numeerinen reitti kauas pyrstöön kuin kshana-toteutuksen { "1" } − Φ, joten syvän pyrstön kumoutuminen mitataan eikä peilata. Pystyakseli on radiaaliyksikkövektori (paikallisen pystysuunnan määritelmä pallomaisella Kuulla) ja vaakavarianssi on vaakalohkon jälki, joten mitään itä/pohjoinen-atsimuuttikäytäntöä ei jaeta. NIMENOMAAN EI VALIDATED TÄLLÄ RIVILLÄ: σ_URE, satelliittikohtainen vika-priori ja havainnollistava Moonlight/LCNS-luokan satelliittitähdistö ovat MODELLED-syötteitä, jotka annetaan oraakkelille sellaisinaan; ja yhden vian MHSS-eheysyhtälön MUOTO on litteroitu samasta julkaistusta rajasta, jonka kshana-toteutus toteuttaa — jaettu suljettu muoto on jaettu oletus, joten tämä rivi kattaa kyseisen yhtälön virheellisen evaluoinnin, ei sen virheellistä valintaa. Kolmannen osapuolen MHSS ARAIM -toteutusta ei ole saatavilla (RTKLIB ei tarjoa suojaustason sisäänkäyntiä, sellaista PyPI-jakelua ei ole, Stanford MAAST on MATLAB-pohjainen), mikä on avoin parannuskohde

seg-0ec1699f5754 = ARAIM MHSS -suojaustasot julkaistuja vertailuvektoreita vastaan

seg-fbaaf3ad7648 = Usean hypoteesin ratkaisuerotteluun perustuva suojaustasoyhtälö itse: kaikkien näkyvissä olevien satelliittien ja vikamoodikohtaiset painotetut pienimmän neliösumman ratkaisut itä/pohjoinen/ylös-geometrialla yhdellä kellotilalla satelliittitähdistöä kohden, aliratkaisujen sigmat, ratkaisuerotuksen sigmat ja yksipuoliset nimellisbiasten projektiot, Bonferronin K_fa-kynnykset, valvomattomien vikojen riskin allokointi sekä VPL/HPL, jotka ratkaisevat eheysriskiyhtälön. Ajettavissa skenaariolajina <c1/>

seg-483b91a7aace = EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" }. kesäkuuta { "2019" }), liite D, numeerinen esimerkki — julkaistut SYÖTTEET (10 satelliitin, 2 tähdistön geometriamatriisi, C_int/C_acc-diagonaalit, b_nom, P_sat, P_const, LPV-200-vakiot) ja julkaistut TULOKSET (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } sekä kuusi tähdistövian välitulosta), haettu 2026-09-20, lähteen SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Täsmää viitteen OMALLA ilmoitetulla toleranssilla TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT ja σ_v_acc painetulla tarkkuudellaan. Saman alaryhmän Milestone { "3" } Report ({ "2016" }), liite A §A.IX, esittää saman esimerkin mutta on sisäisesti ristiriitainen — merkkivirhe G:n rivillä { "3" } (+{ "0.7477" }, kun asiakirja { "2019" } painaa −{ "0.7477" }; plusmerkillä asiakirjan oma σ_v_acc on { "0.8690" } m, kun sen julkaistu arvo on { "1.47" } m), ja K_fa_3 evaluoidaan { "57" } vikamoodilla, vaikka asiakirja ilmoittaa N_fault_max = { "1" }, eli { "12" }, joten sen EMT noudattaa 57 moodin kynnystä mutta sen VPL/HPL eivät. Mikään määrittelyä noudattava toteutus ei voi toistaa kaikkia sen tuloksia yhtä aikaa. Sen geometrian välitulokset toistuvat täsmälleen ja sen suojaustasot kirjataan mitatuiksi poikkeamiksi (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), jotka jätetään pois hyväksyntäluvusta; toleranssia ei laajennettu niiden sisällyttämiseksi. RAJAUS: vain N_fault_max = { "1" } — usean tapahtuman vikaosajoukot hylätään eikä katkaista, ja poissulkeminen, khiin neliö -johdonmukaisuustarkistus ja kaksoislaskennan uudelleenallokointivaihe pysyvät MODELLED

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

seg-f4efd94dd746 = Kuun koordinaatiston datumi havaintokampanjasta

seg-a6972eb89d7d = Seitsemän parametrin Helmert-datumi, joka on propagoitu SIMULOIDUSTA HAVAINTOKAMPANJASTA eikä palautettu syötetystä muunnoksesta. Maa-asemat havaitsevat lähteistetyn Kuun pinnan majakkaluettelon nimenomaisella aikataululla; Kuun VLBI-viiveosittaisderivaatat kertyvät majakkakoordinaattien Fisherin informaatiomatriisiin ja viedään Helmert-suunnittelumatriisin A = [I₃ | [p]ₓ | p] kautta muotoon H = AᵀM_bA, joten raportoitu datumin tarkkuus on havaintoohjelman funktio — täsmälleen lineaarinen viivesigmassa ja monotoninen kaaressa libraation kautta, jonka raportti MITTAA. Datumin defekti on aihe eikä alaviite: aste, defekti, ehtoluku, spektri, havaitsemattomat suunnat seitsemän parametrin kannassa, heikoin suunta myös täydellä asteella ja kunkin parametrin osuus siitä raportoidaan jokaisella ajolla, ja mikä tahansa parametri, jota kampanja ei rajoita, julkaistaan arvona NULL tilan kanssa. Majakkavirheen korrelaatio on MEASURED, ei oletettu — täsmälleen nolla asemien ollessa kiinnitettyjä, ja se tulostetaan hintoineen, kun asemat estimoidaan. Ajettavissa skenaariolajina <c1/>

seg-ca481f2d8f9e = Kuunläheisen kaarenpituuskynnyksen riippumattoman estimaattorin vahvistus

seg-3d5fbf896209 = Eräpienimmän neliösumman estimaattori, joka PALAUTTAA päätähden alkutilan simuloiduista satelliittien välisistä mittauksista saman epookkiruudukon kasvavien alkuosien yli, jota aste-vastaan-kaari-taulukko käyttää, mittausosittaisderivaatat otettuina yhdistetyn eteenpäinmallin keskeisinä äärellisinä erotuksina. Se ei käytä mitään koneistoa, jolla kynnys mitattiin — ei analyyttistä jakobiaanirivia, ei variaatiotilasiirtymämatriisia, ei singulaariarvo- tai ominaisarvohajotelmaa, ei asteen toleranssia, ei neliöjuuri-informaatiosuodatinta — ja jakaa vain dynamiikan, alkuehdot, skalaarihavaintosuureen ja epookkiruudukon, jotka kaikki on nimetty tuotetussa asiakirjassa. Kaksi kriteeriä, molemmat pyyhkäistään: kohinaton palautus (asteen vastine) ja Monte Carlo -arvioitavuus (arvioitavuuden vastine, mitattuna tunnettua totuutta vasten eikä kovarianssista ennustettuna). Ajettavissa skenaariolajina <c1/>

seg-60e30948cee7 = Erillinen estimaattori tässä koodikannassa eri algoritmilla ja irrallisella koodipolulla: epälineaarinen painotettu Gauss-Newton äärellisen erotuksen osittaisderivaatoilla, jonka tuomio luetaan mitattuna tilanpalautusvirheenä yksiköissä km ja mm/s. Sillä ei ole mitään yhteistä lauseketta Gramin matriisin aste-ja-kovarianssireitin kanssa, ja erottelu PAKOTETAAN lähdetekstin vartijalla eikä väitetä. MEASURED julkaistulla tasomaisella DRO-ruudukolla: ARVIOITAVUUSkriteeri on CORROBORATED — mitattu Monte Carlo -raja on { "5.739130" } h muodollista { "5.739130" } h vastaan (suhde { "1.0000" }), ja mitattu RMS toistaa muodollisen 1σ:n { "21" } kaarenpituuden yli geometrisen keskiarvon suhteella { "0.9804" }. ASTEKRITEERIÄ ei ole vahvistettu palautettavuuden rajana: estimaattori palauttaa arvosta { "0.782609" } h Gramin matriisin arvon { "2.086957" } h sijaan, suhde { "0.375" }, ja arvolla { "1.826087" } h — viimeinen alkuosa, jonka astelukema pisteyttää { "3" } / { "4" } — palauttaa tarkkuudella { "1.96e-5" } a priori -siirtymästä. Palautusraja ei liiku oman rajansa kolmen dekadin yli, kun taas asteen kynnys kattaa ”ei koskaan” - { "0.782609" } h rel_tol-arvon neljän dekadin yli, ja kaksi osuvat täsmälleen yhteen arvolla rel_tol = { "1e-8" }. Tämä alue kirjattiin ensin yltävän arvoon { "0.260870" } h; tuo luku oli ARTEFAKTI, jonka tuotti astelukema, joka laski { "4" } suuntaa { "2" } mittausrivistä f64-kohinalattian alapuolella, ja se korjataan tässä eikä jätetä voimaan. Astelukema rajataan nyt Sylvesterin epäyhtälöllä ja syy tuotetaan, ja korjattu alue saturoituu täsmälleen kaarelle, jolla riippumaton estimaattori palauttaa, mikä vahvistaa tämän rivin ristiinvalidointia eikä heikennä sitä: julkaistu { "1e-6" } on konservatiivinen singulaariarvon KONVENTIO, ei väite palautettavuudesta. Sama kuvio avaruudellisesti: NRHO { "9.290323" } h vastaan { "21.677419" } h, halo { "22.978723" } h vastaan { "39.829787" } h, arvioitavuuden täsmätessä täsmälleen molemmissa. Tasomainen DRO:n kuusitilainen ei palaudu millään kaarella, mikä toistaa riippumattomasti tuon perheen rakenteellisen datumidefektin estimaattorista, jolle siitä ei kerrottu mitään. EI ankkuroitu ulkoisesti — dynamiikka ja alkuehdot jaetaan testattavan analyysin kanssa eikä mikään julkinen aineisto julkaise tällaista kynnystä — joten ExternalDataset jätetään kieltäytyen

seg-f839285852d9 = Kuun palvelualue todellisesta, haetusta tähdistögeometriasta

seg-c3059fcced49 = Hyväksyy taulukoidun Kuu-keskisen tilaefemeridin (SPK/BSP-ytimen evaluaatio) tai julkaistun tähdistömäärittelyn kohdassa <c1/>, ajaa saman kattavuus-, DOP- ja suojaustasopyyhkäisyn sitä vasten ja antaa siitä seuraavan σ_URE-etäisyysvaatimuksen muuttumattoman havainnollistavan Kepler-tuloksen ja häiriöillä lasketun tuloksen VIERESSÄ, erotuksen omana nimettynä suureenaan. Jokaisella luvulla on alkuperäluokka, joka erottaa ytimestä johdetun, julkaistuista elementeistä johdetun ja mallinnetun toisistaan, jotta näitä ei voi koskaan sekoittaa jatkokäytön lainauksessa

seg-36a6cfaf5afa = Yksikkö ja alkuperä ilmoitettu jokaiselle raportoidulle suureelle

seg-12460501e82b = Koneluettava skeema, joka antaa yksikön, alkuperäluokan ja määritelmän jokaiselle skenaarioraportin numeeriselle kentälle, sekä yksi yleinen portti, joka ajaa jokaisen rekisteröidyn skenaariotyypin ja epäonnistuu, jos lähetetyltä numeeriselta kentältä puuttuu jompikumpi. Alkuperäsanasto on suljettu ja jokaisella luokalla on todistetaso, kahden luokan ollessa tarkoituksella kuvattu arvoihin <c1/> ja <c2/> sen sijaan, että niille annettaisiin taso, jota luokka ei määrää

seg-a8c4a6fd4989 = Lähetetty asiakirja itse: jokaisen numeerisen lehden on ratkettava merkintään kyseisen asiakirjan omassa units-lohkossa. Ulkoista yksikkörekisteriä, jota vasten ILMOITETTU yksikkö tarkistettaisiin, ei ole, joten ilmoitettu yksikkö on tarkastettu väite eikä varmennettu: portti varmentaa TÄYDELLISYYDEN ja MUOTOILUN OIKEELLISUUDEN, ei totuutta, ja Validoitu-merkintä olisi väärin, koska mikään ulkoinen ei vahvista, että <c1/> on oikea yksikkö kentälle nimeltä <c2/>. Riippumaton nimen pääteristiintarkistus ajettiin KYSEISENÄ AIKANA kuvatuille kentille, joita oli { "1,434" }: niistä { "691" }:ssä on yksikköä kantava pääte, { "40" } on ristiriidassa ilmoitetun yksikön kanssa ja kaikki { "40" } on selitetty (sekuntikohtaiset päätteet, minimit, aukkosekunnit, newtonmetrit nanometriltä näyttävää päätettä vasten), joten väärää yksikköä ei noussut esiin. Tuota ristiintarkistusta ei ole ajettu uudelleen sen jälkeen, ja kattavuus on kasvanut sen ohi: luku on jätetty siihen, mitä todella mitattiin, eikä toistettu nykyisellä kokonaismäärällä. Kyseisen muutoksen ({ "0.27.0" }) aikaan kattavuus siirtyi tilasta, jossa { "56" } tyypistä { "7" } oli katettu, tilaan, jossa { "61" } tyypistä { "60" } on katettu, ja tilasta, jossa { "1354" } kentästä { "389" } oli katettu, tilaan, jossa { "1,744" } kentästä { "1,742" } on katettu (docs/field-units-schema.json, jota vanhentumistarkistus pitää ajan tasalla). YHTÄÄN tyyppiä ei jää kattamatta (katto { "0" }, FUT-28, { "0.36" }): viimeinen oli <c3/>, jonka kahden sarakkeen yksiköt ovat kutsujan avaimeamia, joten niiden yksiköt ovat dataa; ne kuvataan nyt arvolla <c4/> ja jokaisen paikan yksikkö luetaan PYYHKÄISTYN paketin omasta yksikkötaulukosta kenttiin <c5/> ja <c6/> (tai otetaan akselin ilmoitetusta arvosta <c7/>, jonka on oltava sama kuin paketin, kun molemmat ovat olemassa; null, kun kumpaakaan ei ole, ilmoitettuna eikä arvattuna). <c8/> oli sitä edeltävä, ja se poistui luettelosta, kun sen julkaistu asiakirja sai units-lohkon: additiivisuuslukitus, joka oli nimennyt avaimen <c9/> kielletyksi, TODISTAA nyt lisäyksen additiiviseksi: poista lohko takaisin ja asiakirjan tiiviste on yhä kaksi ennen sen olemassaoloa jäädytettyä vakiota, joten lisäyksen alla liikkunut julkaistu arvo epäonnistuu edelleen. Työ toi myös esiin kaksitoista olemassa olevan koodin yksikkö- tai dokumentaatiovirhettä, jotka raportoitiin eikä korjattu säännön R1 mukaan

seg-cf779c468eed = Kuun koordinaatiston datum TODELLISESTA havaintokampanjasta

seg-96151f13a92b = Seitsemän parametrin Helmert-datumkovarianssi, jossa kaksi simuloitua syötettä on korvattu mitatuilla: aikataulu on { "337" } arkistoidun ILRS-kuulaseretäisyyden normaalipisteen maasta lähetyksen epookit (2015-04-08–2015-06-27, Grasse MeO { "7845" } ja Matera MLRO { "7941" }, kaikki viisi retroreflektoriryhmää) ja jokainen havaintopaino on kyseisen pisteen oma arkistoitu toistotarkkuus bin_rms/√n_raw: mediaani { "5.13" } mm yksisuuntaista etäisyyttä, luettuna tiedostosta. Asemakoordinaatit IERS ITRF2020, heijastinkoordinaatit JPL DE430 Taulukko { "7" }. Ajettavissa skenaariotyyppinä <c1/>. Validoitu väite ({ "0.36" }) on suppea: analyyttisellä oletuspolulla datumkovarianssin laskenta täsmää riippumattomaan SPICE-valoaika- ja NumPy-oraakkeliin tuoreilla mitatuilla normaalipisteillä; se ei ole LLR-tarkkuus eikä todiste siitä, että analyyttinen Kuu on tarkka

seg-c815cb90dcde = Kuun referenssiaseman geodesia: lisätty retroreflektori ja VLBI-majakka viiden ryhmän datumia vasten

seg-103cf21173ac = Valinnaiset syötteet extra_reflectors ja extra_beacons skenaariossa lunar-llr-datum lisäävät lohkon station_geodesy: viiden ryhmän Helmert-informaatio arkistoidusta kuulaseretäisyysviipaleesta sekä informaatio, jonka lisätty retroreflektori (mitattu niinä arkistoitujen normaalipisteiden epookkeina, joilla etäisyysmittausasema on horisontin yläpuolella, kullakin kyseisen normaalipisteen arkistoitu paino) ja lisätty VLBI-majakka (havaittu lunar-frame-campaign-verkolla ja -aikataululla Maa-asemien ollessa kiinteät, lunar-vlbi-fim-viivepartiaalien kautta) ilmoitetuilla paikoilla lisäävät seitsemän parametrin datumiin, ratkaistuna uudelleen, kunkin Helmert-parametrin 1-sigma ennen ja jälkeen, niiden suhde, normit ennen ja jälkeen sekä Fisher-erotuksen ääriominaisarvot. Poissa ollessa tai tyhjänä raportti on muuttumaton

seg-479a7e6bbedb = Vain sisäinen johdonmukaisuus: jokainen lisätty paikka on erillinen piste ja laseretäisyys tai kiinteän aseman VLBI-viive koskettaa yhtä pistettä, joten sen informaatio A_p^T M_p A_p on positiivisesti semidefiniitti ja lisääntyy; testi tarkistaa Fisher-erotuksen ja jokaisen varianssin sitä vasten. Viiden ryhmän tulos on olemassa oleva todellisen datan rivi ja on muuttumaton. Lisätty heijastin käyttää uudelleen viidelle olemassa olevalle ryhmälle ajoitettuja epookkeja, ILLUSTRATIVE aikataulua, ja lisätyn majakan verkko, aikataulu ja viivesigma ovat ILLUSTRATIVE lunar-frame-campaign-syötteitä; paikka on ILLUSTRATIVE etelänapainen sijainti. Etelänapainen paikka näkee Maan matalalla horisontissa tai ei lainkaan, minkä olemassa olevat katsekulmatestit ilmaisevat; kumpaakaan paikkaa ei mitata jatkuvasti. Luvut ovat Cramér–Rao-rajoja supistetulle parametrijoukolle, eivät ratkaistu datum eivätkä lausuma minkään todellisen aseman suhteen

seg-d9f033ebf109 = Kuun koordinaatiston datum TODELLISESTA havaintokampanjasta, ydin-Kuun keskipiste

seg-6f272a06c9f3 = Tyypin lunar-llr-datum seitsemän parametrin Helmert-datumkovarianssi arkistoiduista ILRS-normaalipisteistä ja niiden mitatuista painoista ydinpolulla: geosentrinen Kuun keskipiste luetaan JPL DE440:stä moottorin oman ydinlukijan kautta (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Vain Kuun keskipiste eroaa analyyttisestä rivistä; IAU { "2015" } -orientaatio, puuttuva napaliike ja UT1, luettelot, valintasäännöt, painot ja lineaarialgebra ovat samat. Validoitu väite on vain, että tämän polun datumkovarianssi täsmää riippumattomaan SPICE- ja NumPy-oraakkeliin tuoreilla, näkemättömillä normaalipisteillä. Vertailu ei erota Kuu-malleja eikä tarkista Kuun keskipistettä: samalla viipaleella analyyttinenkin Kuu läpäisee jokaisen kynnyksen, ennakkorekisteröity mutaatio (ydin-Kuu luettuna tunnin myöhässä) jäi havaitsematta, ja noin { "4,650" } km väärä Kuun keskipiste läpäisee myös (katso oraakkelitekstiä). Se ei ole todiste siitä, että ydin-Kuu parantaa datumia. Ajettavissa skenaariona <c1/> asetuksella planetary_kernel_path (ja normal_points_dir toista viipaletta varten)

seg-bd3af378b613 = Sisäänrakennettu analyyttinen kuun efemeridi: sen ILMOITETTU TARKKUUSRAJA tarkistettu todellista dataa vasten

seg-a51c4e234a4f = ephem::moon_position, matalatarkkuuksinen geosentrinen kuusarja, johon kirjasto palaa, kun DE/SPK-ydintä ei ole, mitattuna todellista kuulaseretäisyysmittausta ja julkaistua planeettaefemeridiä vasten samalla ajanjaksolla. Tämä rivi validoi rajan, jonka moduuli ilmoittaa itsestään, EI tarkkuutta: sarjan on vahvistettu olevan ei huonompi kuin se sanoo, ei vahvistettu hyväksi

seg-81dff68ddd9c = KAKSI riippumatonta ulkoista aineistoa, jotka eivät jaa mitään. ({ "1" }) { "337" } arkistoitua ILRS-kuulaseretäisyyden normaalipistettä (EUROLAS Data Center, DGFI-TUM, 2015-04-08–2015-06-27, viisi retroreflektoriryhmää, sitoutettu tiedostokohtaisin SHA-256-tiivistein ja uudelleenlataus-ja-varmenna-skriptillä): havaittu miinus laskettu yksisuuntainen etäisyys { "156,494" } m RMS, asemakoordinaatit IERS ITRF2020:sta ja heijastinkoordinaatit JPL DE430 Taulukosta { "7" }, joten jäännöksessä hallitsee Kuun keskipistesarja. ({ "2" }) JPL Horizonsin geometriset geosentriset Kuun tilat samalle ajanjaksolle: { "112,567" } m RMS radiaalinen, { "195,655" } m RMS vektori, pahin epookki { "360,324" } m = { "0.0536" }°. Etäisyysjäännös reagoi efemeridivirheen RADIAALIOSAAN, joten ({ "1" }) ja ({ "2" }) ovat sama suure saavutettuna kahta kautta ja täsmäävät { "1.39" }× tarkkuudella, mikä oikeuttaa skenaarion lunar-llr-datum lukemaan jäännöksensä efemeridin piikkiin. Moottorin oma moduulidokumentaatio väittää ~{ "0.3" }° / ~muutama·10² km; molemmat mittaukset ovat sen sisällä, kulmaväite { "5.6" }×:n marginaalilla. RAJAUS, ilmoitettu niin, ettei lukija voi ymmärtää väärin: tämä validoi ilmoitetun RAJAN, ei tarkkuuslukua. Sarja pysyy sopimattomana mihin tahansa sovellukseen, joka tarvitsee parempaa kuin ~{ "1e5" } m, ja tämä rajoitus on rivin sisältöä siinä missä yhtäpitävyyskin. Regeneroitavissa offline sitoutetuilla haku-ja-varmenna-skripteillä

seg-44f582b17fa9 = Portin eheys: vihreä, joka tarkoittaa sitä, mitä se sanoo

seg-43fbcfbe990c = Kolme rakenteellista suojaa itse verifiointiprosessin ympärillä, kukin sulkien virheluokan, joka pääsi kanoniseen porttiin ajoittaisena tai virheellisenä punaisena. ({ "1" }) Jokaisella Rust-lähteissä muodostetulla väliaikaisella polulla on oltava kutsukohtaisesti yksilöllinen osa; prosessitunnus hylätään, koska cargo ajaa kirjastotestit yhden PROSESSIN rinnakkaisina säikeinä ja pid on yhteinen kaikille. ({ "2" }) Jokaisen tavu tavulta -lukituksen tai tiivistelukituksen on ilmoitettava vieressään tai moduulin otsakkeessa, mitä se kattaa ja mitä se tarkoituksella jättää pois, jotta läpileikkaava muutos näkee yhdellä silmäyksellä, mitkä lukitukset ovat soveltamisalassa ja mistä on hiljaa tullut koko repositorion muutostunnistimia. ({ "3" }) Vihreä voidaan väittää vain KOKO testisarjasta: scripts/gate.sh ajaa <c1/>, tallentaa todellisen poistumiskoodin ilman putkea tiellä ja kirjoittaa kuitin, joka nimeää commitin, integraatiobinäärien lukumäärän, testien lukumäärän ja keston; push-tarkistus kieltäytyy pushista, jonka commitia mikään kelvollinen kuitti ei nimeä, puhtaalla työpuulla. Toistettavuutta otantana mittaa erikseen scripts/check-repeatability.sh, joka ajaa kirjastosarjan N kertaa ja epäonnistuu, jos läpäisevien testien joukko eroaa.

seg-17a5f9da54a4 = Suljettu muoto: jokainen suoja ajetaan kiinteän tunnetusti virheellisen palan yli, jonka on laukaistava, ja kiinteän tunnetusti oikean palan yli, jonka on pysyttävä hiljaa, molemmat kirjaimellisia vakioita, joihin ilmaisin ei voi vaikuttaa. Kaksi tunnetusti virheellistä palaa ovat F22- ja F25-virheet alkuperäisessä muodossaan. Tämä on SISÄINEN oraakkeli ja rivi on MODELLED sen mukaisesti: se todistaa, että suojat erottavat virheen sen korjauksesta, ei sitä, että niiden kuvaamat luokat ovat tyhjentäviä. Niiden ilmoitetut sokeat pisteet, jaettu tila, joka ei ole polku, lyhyeen nimettyyn vakioon sidottu lukitus, harvinainen kisatila, jota kolme ajoa ei otanna, ja kuitti, jonka kuka tahansa tiedoston kirjoittaja voi väärentää, on kirjoitettu auki tiedoston tests/source_guards.rs moduulidokumentaatiossa ja kunkin skriptin otsakkeessa sen sijaan, että ne jätettäisiin löydettäviksi.

seg-178192c9c87a = Koostettu ajoituksen PL: skalaarinen MHSS-erikoistapaus (H=1_N)

seg-431aaf94ec31 = Skalaariaikainen ratkaisuerotus-TPL heterogeenisille lähteille; PL ajettuna pahimman poissulkuosajoukon kohinalla + UTC(k)-harhalla

seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq ja scipy { "1.18.1" } (norm.isf, norm.sf, brentq) laskevat omilla algoritmeillaan uudelleen osajoukkojen painotetut pienimmän neliösumman estimaattorit, yleisen erotuskovarianssin sqrt(Δ Σ Δᵀ), harhat ja niistä suojaustason { "300" } sitoutetulla syötteellä (tests/fixtures/tpl_scalar_numpy_oracle); PL täsmää { "1e-9" } suhteellisen tarkkuuden sisällä (pahin { "1.2e-10" }) ja ohjaava poissulkuosajoukko on identtinen, toleranssi kiinnitetty ennen vertailua. Kertoimet, priorit ja harhan ylärajat ovat syötteitä, ja PL-yhtälön rakenne (moodilista, ir/2-jako, harhaprojektio) on ilmoitettu syöte, kuten Lunar ARAIM -suojaustasoytimen rivillä; validoitu väite on lineaarialgebra ja PL näillä syötteillä, ei ajoitusskenaarion fysikaaliset suuruudet. ARAIM-sukulinja Blanch { "2015" } / Joerger { "2014" }

seg-b7cd952ff133 = Koostettu ajoituksen PL: P0-siemennetty holdover-läpiajo

seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); alhaalta puolijatkuva PL({ "0" }+)≥PL({ "0" }−); K(IR/2) juokseva maksimi; τ/τ³/τ⁵ vaihe-eksponentit

seg-1438193381be = Ominaisuustestit (monotonisuus, ei pudotusta luovutuksessa) + eksponenttilint funktiota holdover::coast_phase_variance vasten

seg-3ab4509b62a2 = Koostettu ajoituksen PL: holdover-verhokäyrän kattavuus, usean vuoden alue (tau>=90d)

seg-d9520f6c1769 = Juokseva maksimiverhokäyrä ylärajaa (nollaa lävistämättä) todellisen metrologisen sarjan jokaisella testatulla viiveellä tau>=90d erillisellä jaksolla; lyhyt tau (<=30d) on ilmoitettu Modelled-raja

seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5 päivän sarja MJD 56074-60429 ({ "872" } pistettä, webtai API); erilliset sovitus/testi, usean vuoden nollaa lävistämätön kattavuus

seg-096b6cdfe2dc = Koostettu ajoituksen PL: LIL a.s. -verhokäyrä (mahdottomuus + johdonmukaisuus)

seg-1671add2210d = Äärellistä pahimman tapauksen holdoveria ei ole (Brownin supremum hajaantuu); IR-allokoitu HPL on johdonmukainen Hartman–Wintner-verhokäyrän kanssa, kun IR→{ "0" }

seg-c9ed8bbede70 = Suljetun muodon a.s.-verhokäyrän √(2Dt·lnln t) identiteetti + HPL-dominanssitarkistus; Baweja arXiv:{ "2606.24210" } -mahdottomuussauma

seg-5a27c9f0a67d = Heterogeenisen UTC(k)-jäljitettävyysharhan eheyden yläraja

seg-fd09ab2adbf6 = Lähdekohtainen harhan yläraja b = (U/k_cov)·Phi^-1(1-tail/2) + ikääntyminen, joka paisuttaa julkaistun tyypin B laajennetun epävarmuuden allokoiduksi eheyshännäksi; silta tpl_scalar-tyyppiin muodossa bias_s

seg-d75b900ad25f = Korreloitunut jäljitettävyysharhan ristikovarianssi (yhteismuototurvaton allokointi)

seg-0641f6d38c23 = N×N-harhan ristikovarianssi rho·b_i·b_j-ei-diagonaalialkioilla lähteille, jotka jakavat UTC(k)-realisoijan; TODISTETTU correlated_fused_bias >= independent_fused_bias (naivi riippumaton allokointi aliarvioi fuusioidun harhan -> optimistinen -> vaarallinen)

seg-72359f29aab1 = Riippumaton numpy-toisto ristikovarianssista ja korreloituneen vs. riippumattoman fuusioidun harhan epäyhtälöstä (InternalConsistency). Edustava lähdejoukko; Modelled-skenaario.

seg-0359a9194c60 = GLS-yhteismuodon valkaisu (Aitken) + Mahalanobis-identiteetti

seg-67b11ff6d055 = Käsin kirjoitettu Cholesky Omega=LL^T ja eteenpäinsijoitusvalkaisu z=L^-1 r (Cov(z)=I kun Cov(r)=Omega); Mahalanobis-neliö z^T z = r^T Omega^-1 r

seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) ja inv { "201" } sitoutetulla SPD-syötteellä (tests/fixtures/gls_whitening_numpy_oracle) tarkistavat käsin kirjoitetun tekijän, valkaistun jäännöksen ja valkaisuoperaattorin; Mahalanobis-neliö tarkistetaan funktiota solve(Omega, r) vasten, joka ei käytä Choleskya, joten identiteetti z^T z = r^T Omega^-1 r varmistetaan erillistä reittiä. Kaikki { "1e-12" } suhteellisen tarkkuuden sisällä (pahin { "7.9e-16" }), toleranssi kiinnitetty ennen vertailua. Suurin ehtoluku on { "19.3" }, joten huonosti ehdollistetut matriisit eivät sisälly. GLS/Aitken { "1935" } -valkaisu on Cited.

seg-1a3bb032960f = Yhteismuodon johdonmukaisuustilasto (ratkaisuerotukselle sokea jaetun viitteen vika)

seg-1b03f522b8fc = Pistetilasto ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 yhteismuotosiirtymälle, jota ratkaisuerotus (kontrastit ovat ortogonaalisia vektoriin { "1" } nähden) ei näe; yhteismuotosiirtymä paisuttaa sitä, kun taas pareittaiset erotukset pysyvät tasaisina

seg-91fc18cde833 = Omegan ulkopuolinen jäännös: havaitsematon yhteismuodon yläraja

seg-0cc2c0f033c8 = Havaitsematon yhteismuodon katto: suurin vikasuuruus suuntaan d, joka välttää SEKÄ erotuksen (alpha_ss = T_ss / d:n valkaistun kontrastin normi) ETTÄ yhteismuotoilmaisimen (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), raportoituna arvona min(alpha_ss, alpha_cm). Positiivisesti definiitillä Omegalla kaksi sokeaa suuntaa (d verrannollinen suuntaan { "1" }, ja { "1" }^T Omega^-1 d = { "0" }) ovat toisensa poissulkevia, joten katto on ÄÄRELLINEN jokaiselle nollasta poikkeavalle d:lle; se on ääretön vain nollasuunnalle tai ei-positiivisesti definiitille Omegalle. Mallinnetun yhteisakselin ulkopuolinen suunta on sokea vain yhteismuotoilmaisimelle ja sen rajaa erotus

seg-a7a33523bb1c = Kuun datumin identifioituvuus: hajotelman lineaarialgebra

seg-bd59cc76557a = 7-parametrisen Helmert-datumin Fisherin { "{" }lunocenter-X, scale{ "}" } -lohkon Schur-komplementtimarginaali: skalaarinen degeneroituneisuusmitta lambda_min(S), origo-X:n CRLB ja origon ja skaalan korrelaatio

seg-0f7e4fb31c44 = Riippumaton SciPy/NumPy-vertailu (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): Schur-komplementti, sen ominaisarvot ja 2x2-käänteismatriisi laskettuna riippumattomalla kirjastolla. Rajattu hajotelman LINEAARIALGEBRAAN; kuun korrelaation ja CRLB:n SUURUUDET todellisesta geometriasta ovat edelleen MODELLED.

seg-3359eee713a5 = Kuun datumin nolla-avaruuden luokittelu (LLR:n asteen additiivisuus + libraation vajauksen nosto)

seg-6d722c176052 = Sisäisen etäisyydenmittauksen datumongelman luokittelu: yksittäinen etäisyyshavainto tuottaa asteen { "1" } (6-ulotteinen nolla-avaruus); origo-X:n ja skaalan pari on lähes nolla, ja fysikaalinen DE440-libraatio nostaa vajauksen nollaan, vaikka pari pysyy lähes degeneroituneena

seg-ae6dc4e6ea8b = Moottorin toistama geometrinen rakenne sekä suljetun muodon 2x2-Schur-identiteetti; RAKENTEELTAAN johdonmukainen Sosnican ym. { "2025" } (arXiv:{ "2510.15484" }) kanssa, jonka raportoituja suuruuksia EI toisteta tässä. Luokittelu on rakenteellinen; korrelaation ja CRLB:n suuruudet todellisella geometrialla ovat MODELLED (heijastinkoordinaatit ja orientaatio pidetään kiinteinä). { "0.30" } ulkoinen vertailu, havainto (pysyy MODELLED): Sosnicaa ym. { "2025" } vasten etäisyys-Fisherin origon ja skaalan korrelaatio (-0.993 / -0.988) poikkeaa julkaistusta -0.97:stä alle { "0.05" }, mutta artikkelin omalla viiden heijastimen geometrialla yhtäpainoinen 7-parametrinen Helmert-korrelaatio on -0.78 (julkaistu arvo perustuu heijastinkohtaisiin virheisiin, joita artikkeli ei tulosta), ja origon CRLB ({ "0.6" }–{ "1.2" } mm { "3" } mm:n etäisyyskohinalla) on { "96" }–{ "98" } % artikkelin { "3.07" } cm:n alapuolella { "20" } %:n toleranssia vasten. Suuruuksia ei toisteta

seg-3fd19007ea67 = Usean tekniikan kuun datuminformaatio (LLR + kuun VLBI + kiertäjän etäisyys)

seg-23d0dd7d0666 = Datum-Jacobin rivit Maa–heijastin-LLR-etäisyydelle, kahden aseman kuun VLBI-differentiaaliviiveelle ja kiertäjä–majakka-etäisyydelle 7-parametrisen datumin yli, yhdistettynä yhdeksi johdonmukaisesti esiehdollistetuksi Fisheriksi; osoittaa, että radiaalisuunnan ulkopuolinen (kiertäjä / syvyysmoninainen) seuranta rikkoo origo-X:n ja skaalan degeneroituneisuuden, kun taas poikittainen VLBI auttaa vain epäsuorasti

seg-b2f5715c4577 = Analyyttis- ja differenssipohjaiset ristiintarkistukset kunkin tekniikan partiaaleille (sisäinen); parannuksen SUUNTA on geometrinen tosiasia. Majakoiden sijainnit, aikataulut ja kohina ovat MODELLED/edustavia (katso tests/fixtures/llr_geometry/NOTICE.md).

seg-f9796a4c9a85 = DE440:n kuun pääakselien orientaation tarjoaja

seg-ebe4519a40e4 = MOON_PA_DE440 → J2000 -kierto mielivaltaisilla epookeilla välillä 2014-01-01–2030-12-31 TDB, geodeesisella interpolaatiolla R0·Exp(f·Log(R0ᵀR1)) sitoutetun { "6" } 209 rivin päivittäisen sarjan solmujen välillä (try_-funktiot palauttavat virheen OrientationSpanError sen ulkopuolella, ei-virheelliset paniikkaavat; ei koskaan rajaa arvoa); upotettu käännösaikaan, joten ajonaikaista tiedostojärjestelmän I/O:ta ei ole ja WASM-käännös kantaa sen mukanaan

seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 spiceypy { "8.2.0" } kautta, ajettu työkaluna): pxform MOON_PA_DE440:stä J2000:een evaluoiden JPL:n binäärisen PCK-tiedoston moon_pa_de440_200625.bpc suoraan NAIFin oman kehyskernelin moon_de440_250416.tf kanssa { "2 000" } satunnaisella solmujen ulkopuolisella epookilla upotetussa ikkunassa. Kshanan ja SPICEn matriisien välinen kiertokulma on { "1.7e-5" } rad:n sisällä ({ "30" } m keskisäteellä { "1737.4" } km, kiinnitetty ennen vertailua); mitattu pahin { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad ja pahin { "1.75e-6" } rad vielä { "6 000" } epookilla, jotka varmentaja arpoi. Päivittäiset solmut oli itse poimittu samasta kernelistä (scripts/gen_de440_moon_pa.py, aineiston SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), joten tämä vertailu testaa niiden välistä interpolaatiota, mikä on väite. Tämän vertailun löytämä ja korjaama: aiempi alkioittainen lineaarinen interpolaatio Gram–Schmidt-ortogonalisoinnilla säilytti akselin mutta ei kulmaa { "13.2" } astetta/vuorokausi -pyörimisessä ja oli virheellinen jopa { "2.0e-4" } rad ({ "340" } m) neljännespisteiden lähellä; aiempi noin { "14" } m:n luku tuli suojasta, joka otanta vain välien keskipisteet. Sarja kattaa 2014-01-01–2030-12-31 ja virhe sen ulkopuolella (kierros { "2" }); sen 2024–2025-solmut regeneroituvat samasta kernelistä tarkkuudella { "4.3e-13" }. Yllä oleva SPICE-vertailu solmujen ulkopuolella kattaa vain 2024–2025, mikä on validoitu ikkuna; laajennetut solmut ovat samasta kernelistä ja skriptistä, mutta niitä ei ole vertailtu solmujen ulkopuolella. Geometriasubstraatti identifioituvuusanalyysille, ei alle metrin orientaatiotuote

seg-ab96cfc8d48c = Kuun LLR-datumin geometriasubstraatti (pääakselien heijastimet, maa-asemat, analyyttiset etäisyyspartiaalit)

seg-40e91288f81a = Viisi lähipuolen retroreflektoriryhmää PA-kappalekoordinaatistossa metreinä ja LLR-maa-asemat geodeettisina koordinaatteina; heijastimen kappale–inertia-sijoitus DE440:n PA-orientaation kautta; Maa–heijastin-etäisyyden analyyttiset partiaalit 4-parametrisen datumin suhteen; sekä pelkkä LLR-Fisher-matriisi, joka osoittaa lunokeskipisteen X:n ja skaalan degeneroituneisuuden, joka motivoi 7-parametrista analyysiä

seg-89ce1f95d9f6 = Laskenta tarkistetaan sisäisesti: jokainen analyyttinen partiaali differenssiä vasten ja nollatapaus nimellisetäisyyttä vasten. LUETTELO tarkistetaan ulkoisesti ja riippumattomasti: DE440:n pääakselikoordinaatit (Park ym. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) on ristiintarkistettu DE430-pintakoordinaattimuistion Taulukkoa { "6" } vasten (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, koneellisesti poimittu SHA-256-varmennetusta PDF:stä tiedostolla tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) ja täsmäävät { "1.12" } m:iin, kun taas saman viiden ryhmän keskimääräinen Maa-realisaatio eroaa { "672" }–{ "871" } m. DEGENEROITUNEISUUSRAKENNE tarkistetaan julkaistua tulosta vasten: Sosnica ym. { "2025" }, ”Definition and Realization of the International Lunar Reference Frame”, arXiv:{ "2510.15484" }, raportoi kuun pääakselikoordinaatistolle lunokeskipisteen X:n ja skaalan korrelaatiokertoimen r = -0.97 ja että LLR ei tavoita Kuun todellista massakeskipistettä paremmalla kuin { "12" } cm:n tarkkuudella tämän korrelaation vuoksi. Tämä moduuli toistaa saman rakenteen (|corr(t_x, scale)| välillä { "0.9" } ja { "0.9999" }, datumin vajaus <= { "1" }) pelkästä LLR-Fisher-suunnitelmasta. Vahvistus on efemeridien välinen eikä kierrätetty: artikkeli yhdistää INPOP21a:n, DE430:n ja EPM2021:n, kun taas tätä moduulia ajaa DE440-libraatio. Mitä EI toisteta, on suuruus: korrelaatio täällä on noin -0.988 heidän -0.97:ään nähden, ja 4-parametrinen CRLB on alle millimetrin heidän { "12" } cm:n saavutettua pohjaansa vasten, koska orientaatio ja heijastinkoordinaatit pidetään täällä kiinteinä mutta ratkaistaan siellä. Vain geometria ja degeneroituneisuusrakenne; ei tarkkuusväitettä ratkaistusta datumista. { "0.30" } ulkoinen vertailu: tämän moduulin mitatut etäisyysosat (reflectors(), stations_itrf(), DE440:n PA-sijoitus ja barycentrinen valoaika llr_bcrs_one_way_m) on validoitu omalla rivillään, LLR measured-range model, { "192" } ILRS-normaalipistettä vasten (RMS { "2.81" } m kynnystä { "10" } m vasten). Tämä rivi pysyy tasolla MODELLED, koska mitattu vertailu ei koettele muuta väitettä. Geodeettinen asemaluettelo stations() pyöristää APOLLO:n tarkkuuteen { "0.001" } astetta; geosentrisellä valoajalla se antaa { "22.7" } m samoilla pisteillä (testi reflector_ranges_against_ilrs_normal_points; { "96" } m aiemmalla alkioittaisella orientaatiointerpolaatiolla). Analyyttiset etäisyyspartiaalit ja pelkkä LLR-Fisher lasketaan funktioiden llr_range_m ja reflector_inertial kautta analyyttisellä Kuu-sarjalla (ephem::moon_position, noin { "0.3" } astetta GCRS:stä) ja ilman valoaikaa

seg-a78ba110b64c = LLR:n mitattu etäisyysmalli (heijastinluettelo, ITRF2020-asemat, DE440:n pääakselisijoitus, IERS { "2010" } -barycentrinen valoaika)

seg-c9827c1a427b = Kuulaseretäisyyden normaalipisteen yksisuuntainen Maa-asema–heijastin-etäisyys: viisi lähipuolen retroreflektoriryhmää DE440:n pääakselien (PA) kappalekoordinaatistossa metreinä (lunar_llr_geometry::reflectors); funktion stations_itrf() asemat, nimittäin Grasse { "7845" } ja Matera { "7941" } ITRF2020:sta epookilla { "2015.0" } nopeuksineen, sijoitettuna Geocentric Celestial Reference Systemiin (GCRS) IERS { "2010" } -muunnoksella Bulletin A:n napaliikkeen kanssa (lunar_vlbi::station_inertial_position_itrs), ja APOLLO { "7045" } operaattorin julkaisemassa likimääräisessä geosentrisessä sijainnissa (ei nopeutta); heijastimen kappale–inertia-sijoitus DE440:n PA-orientaation kautta (lunar_orientation::try_de440_moon_pa_body_to_inertial, joka antaa virheen välin 2014–2030 ulkopuolella); sekä IERS Conventions { "2010" } Section { "11.2" } -barycentrinen valoaika (lunar_llr_geometry::llr_bcrs_one_way_m: Eq. { "11.19" } aseman ja heijastimen kappale–BCRS-muunnos sekä Eq. { "11.17" } Shapiro-viive Auringosta, Maasta ja Kuusta). SYÖTTEET, eivät osa väitettä: barycentriset Maan, Kuun ja Auringon tilat ja potentiaalit (DE440 SPICEn kautta), IERS UT1-UTC ja napaliike sekä mitattu kiertomatka muunnettuna TT:stä TDB:hen. TESTIVALJASTOPUOLI, ei osa väitettä: Mendes–Pavlis-zeniittiviive FCULa-kuvauksella testissä, korkeuskulma geodeettisesta stations()-luettelosta. Ei mallinnettu: vuorovedet, aseman eksentrisyydet, heijastimen lämpötermit

seg-9b1dfa736cb6 = Kytketty kuun koordinaatisto- ja aikaskaalamittaus: yhteinen spatiaalisen datumin, kellon offsetin ja kellon nopeuden nolla-avaruus

seg-a000ef6ab2e0 = assemble_coupled_info rakentaa 9-parametrisen kytketyn Fisherin parametreille [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space palauttaa sen nolla-avaruuden kantainvariantin hajotelman vain spatiaaliseen, vain ajalliseen ja aidosti kytkettyyn ulottuvuuteen sekä spatiaalinen–ajallinen projektori -kytkentänormin; coupled_marginal_eigs antaa { "{" }scale, offset{ "}" } -Schur-komplementtimarginaalin. Sitoutetuilla verkoilla moottori raportoi täysiasteisen datumin (vajaus { "0" }) hyvin asetetulle tapaukselle ja täsmällisen yksittäisen nopeussuunnan vajauksen yhden epookin tapaukselle (kulunut aika nolla, joten nopeus on rakenteellisesti havaitsematon), ja laskee { "{" }s, d_tau{ "}" } -marginaalin molemmissa.

seg-35eebbc8a2e9 = MITÄ TARKISTETAAN ULKOISESTI, ilmoitettu suppeasti: kshana laskee ominaisarvohajotelman omalla käsin kirjoitetulla Jacobi-ratkaisijallaan (fim::sym_eig) ja marginaalin omalla pseudokäänteismatriisillaan; oraakkeli laskee molemmat uudelleen numpy/LAPACKilla (np.linalg.eigvalsh/eigh/pinv) skriptillä scripts/gen_coupled_gauge_ref.py. Yhtäpitävyys suhteellisella tarkkuudella < { "1e-3" } on siksi riippumaton kirjastotarkistus TÄMÄN KIRJASTON ARITMETIIKASTA vakiototeutusta vasten, mikä on validoitu väite ja sen kokonaisuus. MITÄ EI: kokoaminen ja nolla-avaruuden luokittelu ovat tämän moduulin omia sääntöjä, ja oraakkeli toistaa ne samasta spesifikaatiosta eikä riippumattomasta lähteestä: se vahvistaa toteutuksen, ei sääntöä. Majakka- ja kiertäjägeometria on Modelled ja edustava. Havaintorivit kantavat todellista DE440:n Kuun PA-orientaatiota (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), mutta se on SYÖTE, jonka molemmat puolet saavat, ei todiste vastauksesta, ja se on kirjattu tähän alkuperätietona eikä aseman perusteena: sama ero, jonka main jo tekee yhteismuodon eheysrivillä. Jokainen rivin liukuluku pyöristetään { "6" } desimaaliin ennen tiedoston network.json kirjoittamista, joten molemmat puolet lukevat identtiset IEEE-754-doublet ja ainoa jäljelle jäävä ero on ratkaisija.

seg-63a8571f8eb0 = Etäisyyden ja kellon offsetin degeneroituneisuus yksisuuntaisessa kuun etäisyydenmittauksessa sekä geometrisen moninaisuuden suunnittelulaki

seg-cdd70f56051a = Solmukohtainen radiaalietäisyyden ja vastaanottimen kellon offsetin degeneroituneisuus on täsmällinen: { "1" } m vastaa { "3.336" } ns (yksi per c). { "{" }scale, offset{ "}" } -Schur-komplementtimarginaali (coupled_marginal_fisher) osoittaa, että geometrisesti moninaisessa verkossa kaksisuuntainen etäisyydenmittaus nostaa marginaalia suunnilleen samalla tekijällä kuin yhtä suuri määrä lisäyksisuuntaista dataa, kun taas idealisoidussa yhden solmun tilanteessa kaksisuuntainen nosto on suuruusluokkia suurempi. Siitä seuraava suunnittelulaki: geometrinen moninaisuus, ei kaksisuuntainen etäisyydenmittaus sellaisenaan, erottaa kuun koordinaatiston skaalan aikaskaalan offsetista yksisuuntaisessa etäisyydenmittauksessa; kaksisuuntainen tai ulkoinen aikasidonta tarvitaan vain vähäisen moninaisuuden tai yhden käyttäjän tilanteessa.

seg-25dd0e9134c8 = Kytketyn informaatiomatriisin Schur-komplementtimarginaali-Fisher suljetun muodon lineaarialgebrassa, tarkistettu kahta rajatilannetta vasten, jotka se ennustaa. { "1" } m:n ja { "3.336" } ns:n vastaavuus on metrin määritelmä c:n kautta eikä empiirinen tulos. Havaintoverkot ovat edustavaa Modelled-geometriaa, joten suunnittelulaki on lausuma sille annetusta geometriasta eikä väitä mitään mistään käytössä olevasta kuun verkosta.

seg-16ec8283f9b4 = Relativistinen kellonopeuden ja koordinaatiston kytkentä kuun aikaskaalalle

seg-d9a426dc8620 = rate_frame_jacobian(_with) antaa kuun aikaskaalan nopeuden herkkyyden koordinaatiston realisaatiolle päiväntasaajan efektiivisestä potentiaalista, katkaistuna asteessa { "2" } (GM, päiväntasaajan säde, J2, pyöriminen; LunarSurfacePotential): d_alpha/d_scale = L_m, noin +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, noin -1.11e-14 (aikariippuvainen); d_alpha/d_r_radial = g_eff/c^{ "2" }, noin +{ "1.806e-17" } metriä kohti. { "1" } m:n radiaaliselle datumsiirrolle tämä on nopeushäiriö noin { "1.8e-17" } (radiaalialkion aritmeettinen seuraus), selvästi alle kuun aikaskaalan noin { "1.7e-11" } nopeusoffsetin TT:hen nähden

seg-a666792106d9 = Kytketyn koordinaatisto- ja aikaskaalanolla-avaruuden kantainvariantti luokittelu

seg-5ee36574d1b4 = classify_null_space hajottaa datumin nolla-avaruuden vain spatiaaliseen (ulottuvuus d miinus aste U_T), vain ajalliseen (d miinus aste U_S) ja aidosti kytkettyyn (aste U_S plus aste U_T miinus d) osaan, sekä spatiaalinen–ajallinen projektori -kytkentänormiin p_st_norm, nolla-avaruuden projektorin ei-diagonaalilohkon Frobenius-normiin. Jokainen näistä on PROJEKTORIN eikä valitun kannan funktio, joten ne ovat invariantteja nollavektorien minkä tahansa ortonormaalin valinnan suhteen, mikä tekee luokittelun raportoitavaksi lainkaan.

seg-2c074d6260ba = Edustava usean tekniikan mittausvalikoima ja additiivinen Fisher-yhdistämissääntö

seg-beefac5c1b13 = MeasurementBlock pitää yhden ehdokasmittauskampanjan 7x7-Fisher-informaatiopanoksena sekä skalaarisena suhteellisena kustannuksena; block_from_rows rakentaa sellaisen raakoista datum-Jacobin riveistä, jotta jokainen lohko esiehdollistetaan identtisesti funktion lunar_identifiability::assemble_multi_info kautta; combine summaa valitun osajoukon informaation, mikä on oikea sääntö, koska Fisher-informaatio on additiivinen riippumattomien mittausten yli; representative_lunar_menu tarjoaa deterministisen nelilohkoisen valikoiman (LLR, poikittainen VLBI-limbimajakka, lähipuolen kiertäjä ja kaukopuolen kiertäjä). Budjettirajoitteinen suunnitteluoptimoija, joka kuluttaa tämän valikoiman, ei kuulu tähän kirjastoon.

seg-d83a9942ee72 = Fisher-informaation additiivisuus riippumattomien mittausten yli on suljetun muodon ominaisuus, tarkistettu tässä riippumattomasti kirjoitettua alkioittaista summaa vasten sekä siitä seuraavaa järjestysinvarianssia ja monotonisuutta vasten. HUOMAUTUS TODISTEISTA: yhdistäjällä ei aiemmin ollut lainkaan testiä, ja moduulin ainoa testi summasi kaksi informaatiomatriisia suoraan sen kutsumisen sijaan, joten rikkinäinen yhdistäjä olisi jättänyt moduulin vihreäksi; testi kulkee nyt funktion combine kautta ja epäonnistuu, kun sitä mutatoidaan. Kaikki majakoiden sijainnit, kiertäjägeometria, tekniikkakohtaiset tarkkuudet ja suhteelliset kustannukset ovat edustavia valintoja eivätkä tehtäväarvoja (katso tests/fixtures/llr_geometry/NOTICE.md), joten jokainen tämän valikoiman kautta saavutettu degeneroituneisuusmitta ja CRLB-luku perii funktion lunar_identifiability::decompose Modelled-aseman.

seg-341eedfc47da = Palveluntarjoajien välinen kuun koordinaatiston ja dynamiikan johdonmukaisuus (todellinen efemeridien välinen)

seg-f8d94c0771cc = DE440:n/INPOP21a:n/EPM2021:n geosentrisen Kuun erimielisyyden vain-rotaatio-hajotelma (6-parametrinen translaatio+rotaatio) vähennettävään yhteiseen ICRF-koordinaatistosidokseen ja palautumattomaan kuun radan orientaatioylimäärään (täysi 7-parametrinen Helmert-sovitus on erillinen julkinen funktio, jota tämä ulkoinen tarkistus EI kata: sen todistus on sisäinen analyyttinen palautusyksikkötesti sekä tests/lunar_helmert_fit_cross_check.rs, joka täsmää sen validoituun tarkkaan Gauss–Newton-sovitukseen funktiossa lunar_frame_realise ja lukitsee näiden kahden välisen vastakkaisen kiertomerkkikäytännön)

seg-c69fd3fc645b = Kolme riippumatonta auktoritatiivista efemeridiä, DE440 (JPL), INPOP21a (IMCCE) ja EPM2021 (IAA RAS), otettu IMCCE calcephin kautta, ristiintarkistettu riippumattomalla numpy-SVD-pienimmän neliösumman sovituksella. MIKSI TÄMÄ ON validoitu, KUN lunar_common_mode EI OLE, samoilla kolmella efemeridillä: tässä raportoitu suure ON julkaistun datan ominaisuus, niiden keskinäinen erimielisyys, joten efemeridit ovat oraakkeli eivätkä syöte. Funktiossa lunar_common_mode sama erimielisyys syöttää MODELLED tähdistögeometriaa ja vastaus on kyseisen mallin ominaisuus, minkä vuoksi tuo rivi on oikein Modelled/ReferenceImpl.

seg-2d3347bcb15e = Palveluntarjoajien välinen johdonmukaisuustoleranssi sekapalveluntarjoajan käyttäjälle

seg-9decf2cb6b0c = consistency_tolerance: kääntää käyttäjän paikkabudjetin parametrikohtaiseksi palveluntarjoajien väliseksi Helmert-yhtäpitävyysvaatimukseksi (origo/skaala/rotaatio) viitevipuvarrella, valinnaisesti paisutettuna P1-yhden palveluntarjoajan realisaation CRLB:llä

seg-b8dc68eb4bda = Pahimman tapauksen kolmioepäyhtälöraja Helmertin pistejacobin vaikutukselle (suljettu muoto)

seg-5450d921dfc9 = Usean palveluntarjoajan kuun yhteentoimivuusvirhebudjetti ja koordinaatisto vs. efemeridi -suunnittelulaki

seg-e1e30f5c17a6 = interop_budget: vähennettävä (yhteinen koordinaatistosidos) vs. palautumaton (dynamiikka) jako käytännöillä PerProvider / CommonFrameTie / CommonEphemeris, palautumattoman osuuden suunnittelulakimittarilla (~{ "0.69" } todellisilla DE440/INPOP/EPM-arvoilla: pelkkä yhteinen koordinaatistotunniste jättää hallitsevan pohjan)

seg-46304ae1efa4 = Validoitujen pariskohtaisten jakojen RMS-aggregointi kunkin käytännön alla (suljettu muoto)

seg-a01f394a36d3 = Autonominen vapaan verkon vikojen havaittavuuden lineaarialgebraketju (pariteettiprojektori, havaittavuus, MDB-epäkeskisyys, Byzantine-lohkokipinä)

seg-b3389bb90e8d = Todellisella DE440-solmukohtaisella kuun verkolla (jokainen rivi differentiaalinen solmujen välinen yksisuuntainen etäisyys, rakennettu funktiolla pernode_range_row todellisella DE440:n Kuun PA-koordinaatiston näkölinjalla) moottori laskee painotetun pariteettiprojektorin P⊥ = I − G(GᵀWG)⁺GᵀW (asteeltaan vajaa pseudokäänteismuoto, joka selviää 8-ulotteisesta datum⊕aikaskaala-mittauksesta), T1-havaittavuusjäännöksen ‖P⊥·b‖ (alueen sisäiset viat annihiloituvat, yleiset viat havaittavissa), Baardan MDB-epäkeskisyysneliömuodon cᵀWP⊥c (oikea yhden P⊥:n painotettu muoto, EI kahden P⊥:n muoto cᵀP⊥WP⊥c) arvolla MDB = √(λ₀/cᵀWP⊥c), sekä pinottujen efektiivisten vertaissignatuurien P⊥·B_T Byzantine-lohkokipinän havaitsemis-/tunnistuslukumäärät (sarakeaste, ei pelkkä nollasta poikkeavuus)

seg-8cb248423fd0 = Riippumaton numpy/scipy-lineaarialgebran toisto todellisilla DE440:n Kuun PA-koordinaatiston näkölinjariveillä (P⊥ valkaistun suunnittelumatriisin W^{ "{" }1/2{ "}" }G SVD-hajotelmasta; MDB:n epäsentraalisuusparametri klassisen Baarda-menetelmän ({ "1968" }) pariteettialiavaruuden neliönormista; lohkon aste numpyn SVD:n singulaariarvojen lukumäärästä) — numeerisesti aidosti eri reitti kuin crate-kirjaston GᵀWG:n syklinen Jacobi-ominaishajotelma. Soveltamisala (tiedoston tests/fixtures/faultobs/NOTICE.md mukaan): tämä validoi VAIN LINEAARIALGEBRAPUTKEN näillä riveillä. Solmugeometria on mallinnettu. Se EI ole operatiivinen eheystakuu, suojaustason sertifiointi eikä mikään RAIM- tai ARAIM-saatavuusväite, eikä Bysantin vikasietoisuuden tehtävätakuu — tämän verkon siedettyjen vikojen LUKUMÄÄRÄ on mallinnettu, kun taas detect>f / identify>2f -lohkokipinä-RAJA on lainattu (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; Donoho–Eladin lohkokohtainen kipinä { "2003" }) ja koodissa todistettu esiintymä

seg-ebb827739614 = Bysantin lohkokipinän havaitsemis- ja tunnistusraja autonomisessa solmukohtaisessa Kuun verkossa (T3)

seg-4fb935e6193d = byzantine_bound soveltaa turvallisen tilaestimoinnin koodaus- ja harvan havaittavuuden rajaa solmukohtaiseen verkkogeometriaan: Bysantin vertaissolmu syöttää mielivaltaisen lineaarikombinaation mittauksista, joihin se osallistuu, ja verkko HAVAITSEE jokaisen enintään f = block_spark − { "1" } vertaissolmun koalition sekä TUNNISTAA yksikäsitteisesti jokaisen enintään ⌊(block_spark − { "1" })/2⌋ solmun koalition; block_spark on pienin vertaissolmujen koalitio, jonka pinotut tehokkaat allekirjoitukset P⊥·B_T ovat sarakeasteeltaan vajaita. Vertaissolmun havaittavuus tarkoittaa matriisin P⊥·B_j TÄYTTÄ SARAKEASTETTA (nollasta poikkeava mutta asteeltaan vajaa lohko on nollasta poikkeava hyökkäys, joka päätyy avaruuteen range(G) eikä jätä jäännöstä), ei pelkästään ehtoa P⊥·B_j ≠ { "0" }

seg-3b8b54db475d = Lohkokohtaisen kipinä- ja turvallisen tilaestimoinnin rajan geometrinen sovellus (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; Donoho–Eladin lohkokohtainen kipinä { "2003" }; Candès–Tao { "2005" }) — EI Lamportin–Shostakin–Peasen 3f+{ "1" } -konsensuskynnys (’Bysantin’ nimeää vain mielivaltaisen tai yhteistoiminnassa toimivan vikamallin). Tietty siedettyjen vikojen lukumäärä on edustavan verkkogeometrian mallinnettu ominaisuus, jonka sisäinen johdonmukaisuus tarkistetaan käsin rakennetuilla analyyttisillä tapauksilla ja lukumääräkaavoilla

seg-4f57f586cf82 = Autonomisen holdoverin ajallisen mittakaavavapauden alaraja itseensä viittaavassa Kuun satelliittitähdistössä (T4)

seg-eb690e8f5c9b = holdover_floor osoittaa, että pelkillä solmujen välisillä mittauksilla yhdistetyssä autonomisten solmujen joukossa yhteinen kellotaajuus (δα_j += { "1" } ∀j) on joukon aikaskaalan vapaa parametri, joka kuuluu avaruuteen N(GᵀWG): mikään määrä lisää solmujen välistä etäisyydenmittausta ei tee siitä havaittavaa (rate_in_gauge = true, temporal_gauge_dim = { "2" } yhteisen siirtymän kanssa). Tämä on aito holdover-alaraja — jäykän koordinaatiston paikkavapauden ajallinen vastine. Yhden ulkoisen absoluuttisen taajuussidonnan lisääminen (suora yhteys verkon ulkopuoliseen vertailuun) poistaa yhteisen taajuuden nollavaruudesta (rate_in_gauge = false, temporal_gauge_dim = { "1" }), mikä osoittaa, että alaraja on todellinen mittakaavavapaus eikä oskillaattorimallin keinotekoinen artefakti

seg-097f126797bb = Joukon aikaskaalan vapaan parametrin argumentti (Percival { "1978" }; Lewandowski & Thomas { "1991" }) sovellettuna edustavaan todelliseen DE440-solmukohtaiseen verkkoon: analyyttisen yhteisen taajuusgeneraattorin suhteellisen jäännöksen nollatesti suhteessa matriisiin GᵀWG, jossa tasapeliä ratkaiseva kontrasti erottaa aidon mittakaavavapauden oskillaattorimallin artefaktista. Edustava mallinnettu geometria, ei sertifioitu ajoitusbudjetti

seg-25ffd6e1979c = Palveluntarjoajien yhteinen ja erotuskomponentti, yhden asteen puutteen yhtenäistäminen ja suojausvälin kulmakerroin (T5 / §{ "0" } / g7)

seg-72c7ec3724bf = Kolme puolta yhdestä hajotelmasta ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), jossa 8-ulotteinen datum⊕aikaskaala-vapaus on N(G) ja state_dim − { "8" } = { "32" } havaittavaa suuntaa muodostavat avaruuden range(G): (T5) provider_mismatch_split luokittelee usean palveluntarjoajan yhteisen harhan (∈ range(G)) HAVAITSEMATTOMAKSI — se vaatii ulkoisen sidonnan — ja erotusharhan (∉ range(G)) itse valvotuksi / HAVAITTAVAKSI; (§{ "0" }) yhtenäistäminen tarkoittaa, että SAMA range(G)-sokea aliavaruus hallitsee havaitsemattomien vikojen luokkaa, joten datum-vapaus N(G) ja vikasokea aliavaruus range(G) ovat yksi geometria, eivät kaksi; (g7) slope palauttaa Brownin suojausvälin kulmakertoimen ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ viasta b ∈ range(G) (estimaattori vääristyy nollapariteetilla) ja äärellisen havaittavasta viasta

seg-e0fd3860fce9 = Suljetun muodon pariteettiprojektorin ja pseudo-käänteismatriisin algebra edustavassa todellisessa DE440-solmukohtaisessa verkossa: yhteinen ja erotuskomponentti, yhtenäistäminen N(G) ⊕ range(G) ja Brownin ({ "1992" }) suojausvälin kulmakerroin seuraavat kaikki avaruuden annihilaatiosta P⊥·G = { "0" }. Edustava mallinnettu geometria, ei sertifioitu suojaustaso

seg-101b0551d987 = Telecom-ajoituksen MTIE ja TDEV holdover-aikavirhesarjasta

seg-b4762fd3cb9d = Suurin aikavälivirhe ja aikapoikkeama, jotka skenaariolaji <c1/> raportoi telecom-mittakaavan holdover-tallenteesta: O(n)-monotonisella jonolla toteutettu liukuikkunainen MTIE (telecom_timing::mtie_sliding, jota tarvitaan, jotta vuorokauden yhden sekunnin näytteet pysyvät nopeina) ja moottorin TDEV (allan::time_deviation), laskettuna lajin raportoimalla hilalla ja luettuna takaisin sarjan sisältävästä täydestä ajosta

seg-59cb2711355c = allantools { "2024.06" } — riippumaton kolmannen osapuolen taajuusvakauskirjasto — mtie() ja tdev() tiedostossa tests/fixtures/telecom_timing/holdover_te_series.csv; sarja jäsennetään samasta 17 merkitsevän numeron tekstistä molemmilla puolilla; vertailuaineisto tallentaa sarjan SHA-256-tiivisteen ja on luotavissa uudelleen offline-tilassa tiedostolla tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Validoi ESTIMAATTORIT tällä tallenteella, ei sen tuottanutta synteettistä holdoveria

seg-632add2dbd3c = ITU-T-telecom-synkronointimaskit PASS/FAIL-tuloksella ja marginaalilla

seg-47687529aee7 = Transkriboidut rajat: ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukittuna ja ePRTC-A holdover (mukaan lukien taulukon { "3" } aikavirheen verhokäyrä), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-luokat A-D ja G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) vertailupiste C, kukin avoin tai suljettu väli sellaisena kuin taulukko sen ilmoittaa, kaikki ’jatkotutkimuksen kohteena’ -merkinnät pois jätettyinä; jokaisesta tarkistuksesta tulos ja marginaali sitovassa pisteessä sekä aika kunkin budjetin ylittymiseen. Ajettavissa skenaariolajina <c1/>

seg-165ed2bc771a = ITU-T-taajuussynkronoinnin wander-generointimaskit (G.811, G.812, G.8262, G.8262.1)

seg-953793d4446a = Seitsemän vakiolämpötilan MTIE- ja TDEV-wander-generointimaskia lajille <c1/>: G.811 (09/1997) PRC (autonominen), G.812 (06/2004) tyypit I, II ja III, G.8262 (10/2024) EEC-vaihtoehdot { "1" } ja { "2" } sekä G.8262.1 (11/2025) eEEC (lukittu tila), mukaan lukien taulukoiden kirjoittamat potenssilakiosat (<c2/> ja vastaavat), kukin väli avoimena tai suljettuna kuten painettu, mitattuna lausekkeiden ilmoittaman { "10" } Hz:n suodattimen läpi (oletettu sovellettavan ennen näytteistystä); vertailuskenaario scenarios/telecom-synce-eec.toml asettaa vapaasti käyvän OCXO:n kolmea EEC-maskia vasten. Ei toteutettu: muuttuvan lämpötilan sallitut poikkeamat, holdover, transientit, jitter ja G.811:n taajuustarkkuus

seg-ca16d9c98dc5 = Mainittujen suositusten transkriptio (ladattu osoitteesta itu.int 2026-10-13), jokainen rivi luettu uudelleen tekstiä vasten, ja painettujen kertoimien implikoima taitepisteiden jatkuvuus rajattu testeissä (esimerkiksi { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns verrattuna G.812:n taulukon { "4" } { "100" } ns:n tasanteeseen). Standardien transkriptio sisäisine johdonmukaisuustarkistuksineen, ei vaatimustenmukaisuustesti eikä ulkoinen validointi. G.812 (06/2004) on merkitty korvatuksi esijulkaistulla 08/2026-painoksella ja G.811:llä on Amd. { "1" } (04/2016); kumpaakaan ei voitu lukea, joten kumpaakaan ei tarkisteta. Vapaasti käyvä OCXO-skenaario yliarvioi oskillaattorin osuuden havaintoväleillä, jotka ovat pitkiä silmukan aikavakioon nähden; se ei kerro mitään mistään laitteen kellosta

seg-5fc2ad88faf0 = Kellolokien formaatit (RINEX clock, TimeLab ASCII, TAPR TICC) luettuna normalisoiduksi vaihesarjaksi

seg-5b5bcbdea166 = clock_log::read_input: yksi jäsennyskerros, joka muuntaa RINEX-kellotiedoston (yhden nimetyn kellon AS/AR-tietueet, versiot { "2" } ja { "3.00" } – { "3.04" }), TimeLab-tyylisen ASCII-vaihe- tai taajuuslokin tai TAPR TICC -aikaleima- tai intervallilokin yhtenäiseksi vaihehilaksi, jossa tau0 on ilmoitettu, otsakkeesta tai mediaaniväli, jokainen aukko, hilan ulkopuolinen lukema ja kaksoiskappale lasketaan, ja käytössä on kieltäytymis-, pisimmän jakson tai lineaarinen aukkokäytäntö; kytketty valinnaisesti telecom-ajoitussarjaan (<c1/>, lisää <c2/>-lohkon) ja kellolajiin (<c3/>, lisää <c4/>-lohkon, jossa ADEV, TDEV ja MTIE, taulukon SHA-256 ja vaiheen SHA-256; runs = { "1" }). Ilman taulukkoa molemmat lajit ovat tavu tavulta identtisiä

seg-acdb0337bce7 = Kellolokien formaatit linuxptp (ptp4l, phc2sys, ts2phc) ja chrony (tracking, statistics) luettuna normalisoiduksi vaihesarjaksi

seg-e87b3dba2072 = clock_log::read_input formaateilla ptp4l, phc2sys, ts2phc, chrony-tracking ja chrony-statistics: linuxptp-servorivin kirjattu siirtymä (ns, rivin oma hakasulkeissa oleva aikaleima; ennen kuin servo ensimmäisen kerran raportoi s2, luetut arvot jätetään pois ja lasketaan) tai chrony-tracking- tai -statistics-lokin siirtymä (s, sarakkeen sijainnin mukaan, UTC-päivämäärä ja -aika) muuttuu yhtenäiseksi vaihehilaksi samoilla aukkokäytännöillä kuin muut formaatit; lähdevalitsin (<c1/>) nimeää yhden useista rajapinnoista, kelloista tai osoitteista; lokit syöttävät telecom-ajoitussarjaa, kellolajia ja holdover-testilajia

seg-fb9393044576 = Vertailuaineistot kirjoitettu Kshanaa varten daemonien julkisista rivirakenteista keksityin arvoin (NOTICE.md vertailuaineistokansiossa); yhtään lokia todellisesta asennuksesta ei luettu, eikä mikään oraakkeli vertaa jäsennystä toiseen lukijaan, joten daemonien versioiden välillä eroava rakenne voidaan silti hylätä tai lukea väärin. Vaihesarjan syöttämät estimaattorit ovat samat, jotka on validoitu allantoolsia vastaan yllä olevilla riveillä

seg-97aebb84576e = Operaattorin toimittamasta aikavirhetallenteesta pisteytetty holdover-testi

seg-ab533cf99c56 = Laji <c1/>: aikavirhetallenne (linuxptp-, chrony-, TICC-, TimeLab- tai RINEX-kellaloki tai time_s,time_error_ns-parit) jaetaan kahdesta operaattorin ilmoittamasta GNSS:n poiston ja palautuksen ajankohdasta perusvaiheeksi, holdover-vaiheeksi ja palautumisvaiheeksi; perusvaihe mitataan lukitulle kellolle kirjoitettuja ITU-T-maskeja vastaan ja holdover-vaihe holdoveria tai autonomista kelloa varten kirjoitettuja maskeja, ePRTC-A holdover -verhokäyrää ja aikavirhebudjetteja vastaan; holdover-vaihe raportoi pienimmän neliösumman taajuussiirtymän, jonka järjestelmä piti, ja palautumisvaihe sen, tuliko |TE| ilmoitetun kaistan sisään ja milloin, ja pysyikö se siellä ilmoitetun viipymäajan, sekä huipun ja suurimman askeleen. Jokainen raja on sama, jonka telecom-ajoituslaji transkriboi; kaksi ajankohtaa ovat operaattorin ilmoitus eikä niitä varmenneta

seg-a54380cf95ea = Käsin tehty laskenta tallenteille, jotka on rakennettu kaavoista, joiden kulmakerroin, askel, ääriarvo ja palautumisaika tunnetaan ennen ajoa (testit ilmoittavat ne), sekä yllä olevien telecom-ajoitusrivien maskit, verhokäyrä ja budjetit. Todellisen holdoverin laboratoriomittausta ei pisteytetty eikä ulkoista oraakkelia verrattu, joten laji ei esitä väitettä mistään kellosta tai järjestelmästä; ajoituslaboratoriokumppani tarvitaan ennen kuin mitään kellaluokkakohtaista lukua voitaisiin ylentää

seg-94cbac97a1aa = GNSS-signaalin saatavuus avaruuspalvelualueella ja sen ulkopuolella verrattuna ICG:n SSV-julkaisuun

seg-c59e349fdc9e = Lajin <c1/> saatavuuspyyhkäisyt: tähdistöittäin (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja yhdistettynä sellaisten (käyttäjä, epookki) -parien osuus, joilla on vähintään yksi ja vähintään neljä signaalia, sekä pisin katko, käyttäjälle pallolla (julkaisun 2,562 pisteen maailmanlaajuinen kuori, { "14" } päivää { "1" } minuutin välein) tai lentoradalla (GEO, HEO, Kuuhun siirtymärata), julkaisun liitteen C Kepler-radoista, vakiomääräisellä vähimmäissäteilyteholla vertailupoikkeamakulman sisällä, Maan peittymisellä pallo plus { "50" } km sekä C/N0-kynnyksellä; käyttäjäantennit julkaisun taulukosta B10

seg-d71c9d361342 = ICG:n Space Service Volume -julkaisu (UN OOSA ST/SPACE/75, { "2018" }), joka on itsekin simulaatio, johon verrattiin ennen ajoa tallennetun ennakkorekisteröinnin mukaisesti (xval/gnss-ssv/PREREGISTRATION.md; tulokset tiedostossa xval/gnss-ssv/RESULTS.md, kiinnitetty testillä tests/ssv_booklet_results.rs, myös epäonnistumiset mukana). Ajo { "1" } ennakkorekisteröidyllä tulkinnalla: vähimmäissäteilytehovakiot ja Kuun kynnys ovat samaa mieltä (S0, S6 täyttyvät); ylemmän ja alemman SSV:n, RF-kynnyksen, GEO:n ja HEO:n kynnykset ovat NOT MET, lähes kaikki GLONASSin kautta, jolle julkaisu antaa { "20" } ja { "28" } astetta taulukoissa B2 ja B6 sekä { "26" } ja { "34" } astetta taulukossa { "4.2" }. Diagnostiikkavariantti taulukon { "4.2" } kulmilla on samaa mieltä ylemmän SSV:n, alemman SSV:n ja kuuden GEO-tehtävän jokaisessa solussa (se ei korvaa ajoa { "1" }; RF-, HEO- ja Kuun solut silti ohittavat kynnyksen). Mitattuja GPS L1 -paneelin kuvioita parametrinen korvike ei toista (RMS { "6" } – { "9" } dB kynnyksen { "3" } dB sijaan). Yhtäpitävyys osoittaa, että julkaisun ilmoittama menetelmä toistuu, ei sitä, että GNSS-signaalit käyttäytyvät niin

seg-d2f04991c8a4 = Reunasäteen ionosfääri-, plasmasfääri- ja ilmakehävaikutukset hipoviin GNSS-signaaleihin sekä heikon signaalin vastaanottimen suunnittelu lajissa <c1/>

seg-1a1786ba90b6 = Chapman-ionosfääri, Gallagher-tyyppinen plasmasfääri ja neutraali ilmakehä (taitekertoimen taipuma, hapen absorptio, defokusointi) integroituna lähettimen ja käyttäjän välistä suoraa sädettä pitkin: vinon suuntaisen kokonaiselektronisisällön, sen plasmasfäärisen osan, ylimääräisen viiveen, tangenttikorkeuden ja hipovien yhteyksien häviön laskenta; sekä heikon signaalin vastaanottimen suunnittelu (koherentti ja epäkoherentti integrointi, databittirajoitus, avustus, Doppler-haku), joka asettaa C/N0-kynnyksen hankinta- ja seurantasilmukkamalleista

seg-4ca1217472ab = Suljetun muodon ratkaisut ja julkaistut suuruusluokat testeissä (Chapman-kerroksen huippu ja pinnan reunan taipuma, muutama TECU plasmasfääriä GPS–GEO-säteellä); vastaanottimen suunnittelu käyttää uudelleen hankinta- ja seurantasilmukkamalleja ja niiden testejä. Mitään mitattua reunasondaus- tai heikon signaalin vastaanottoaineistoa ei verrata siihen

seg-6b8f9f3ca2a3 = Aluksella toimiva GNSS-navigointisuodatin korkean radan ja Kuuhun siirtymäradan avaruusaluksille

seg-39ddc494f103 = Lajin <c1/> tila <c2/>: yhdeksäntilainen laajennettu Kalman-suodatin (paikka, nopeus, vastaanottimen kellon harha ja ajautuma, auringon säteilypaineen skaala) pseudoetäisyyksillä, joiden saatavuus, kohina ja C/N0 tulevat samasta yhteysgeometriasta kuin pyyhkäisyissä; totuus integroidaan J2:lla, Auringon ja Kuun kolmannen kappaleen vaikutuksella ja säteilypaineella varjo huomioiden, suodatin mallintaa J2:n ja kolmannet kappaleet ja estimoi säteilypaineen; raportoi paikka- ja nopeusvirheet GNSS-ratojen sisä- ja yläpuolella, pisimmän mittausaukon ja keskimääräisen NEES:n

seg-469602656ab4 = Simuloitu totuus suodattimen omaa estimaattia vasten (johdonmukaisen suodattimen keskimääräinen normalisoitu estimointivirheen neliö on paikalle noin { "3" }) ja determinismi kiinteällä siemenluvulla. Lento- tai tallennettua korkean radan GNSS-dataa ei verrata; Aurinko ja Kuu ovat matalan tarkkuuden ympyräratakorvikkeita

seg-5fc242476828 = Usean avaruusaluksen muodostelman suhteellinen navigointi erittäin elliptisellä radalla GNSS:n avulla

seg-f67eb29d4483 = Lajin <c1/> tila <c2/>: päällikkö ja apulaiset ajavat kukin absoluuttista suodatinta; apulaisen paikka suhteessa päällikköön estimoidaan vähentämällä absoluuttiset estimaatit ja suhteellisella suodattimella molempien alusten seuraamien signaalien yksittäiserotetuilla pseudoetäisyyksillä, jolloin suhteellinen dynamiikka on kahden epälineaarisen lentoradan erotus

seg-69c078b57fc8 = Sama simuloitu totuus kuin absoluuttisella suodattimella: suhteellisen suodattimen virhe todelliseen suhteelliseen tilaan nähden sekä tarkistus, että se suoriutuu vähintään yhtä hyvin kuin kahden riippumattoman absoluuttisen paikan vähentäminen. Lentomuodostelman dataa ei verrata

seg-7038f6902820 = Kylmäatomi-interferometrin virhetermit: Raman-laserin vaihekohina, aaltorintaman kaarevuusharha ja vyöhykeepäselvyyden ratkaisu

seg-4d9690207607 = inertial::cai_error_terms (kirjastofunktiot, joihin ei vielä pääse skenaariolajista): neliöpulssisen kolmipulssisen interferometrin Raman-vaiheen painotusfunktio (Cheinet ym. { "2008" }, yhtälö { "8" }) valkoisen vaiheen suljetun muodon ratkaisulla (pi/2)^{ "2" } S_phi0/tau_R ja numeerisella reitillä mille tahansa spektrille; laserin taajuuskohina, jota takaisinheijastuksen viive ei kumoa (Le Gouet ym. { "2007" }, yhtälöt { "9" } – { "11" }); lämpöpilven puhtaan defokusoinnin aaltorintamaharha sigma_v^2/R ja sen pieneneminen ilmaisusäteellä; väärän vyöhykeindeksin todennäköisyys erfc(pi/(sqrt({ "2" }) s)) klassisen kiihtyvyysanturin avulla ja kahdella kyselyajalla sekä sen käänteisfunktio

seg-a7b220763674 = Jokainen suljetun muodon ratkaisu riippumatonta numeerista reittiä vasten testeissä (tarkan siirtofunktion ja viivesuodattimen taajuusalueen kvadratuuri, atomien yli tehty Monte Carlo aaltorintamaharhalle, laukausten yli tehty Monte Carlo vyöhykeindeksille) ja sen rajatapaukset. Yksi julkaistu laskettu esimerkkiarvo: Cheinet ym. { "2008" } (arXiv:physics/0510197, luku IV) toteavat, että arvolla tau_R = { "20" } us tarvitaan alle -111 dB rad^2/Hz:n valkoinen Raman-vaihekohina, jotta saavutetaan { "1" } mrad laukausta kohti; pelkkä valkoinen termi antaa { "0.99" } mrad (artikkeli johtaa tason yhtälöllään { "17" }, flicker plus valkoinen). Sisäinen johdonmukaisuus ja yksi laskettu esimerkkiarvo, ei ulkoinen validointi; korkeamman asteen aberraatioita ja minkään tietyn laserin kohinaa ei mallinneta

seg-c380ec16a4f8 = Greenhallin ja Rileyn tarkat ekvivalentit vapausasteet Allanin, muunnellun Allanin ja Hadamardin varianssille

seg-dee2a54c5019 = allan::edf_greenhall (kääreillä edf_greenhall_adev, _mdev ja _hdev): Greenhallin ja Rileyn koko algoritmi, Proc. 35th PTTI ({ "2003" }), luku { "3" } (yhtälöt { "7" } – { "13" } ja taulukoiden { "1" } – { "3" } suuren J:n kertoimet), erotusasteille { "1" } – { "3" }, kohinaeksponenteille +{ "2" } – -4 aina kun alpha + 2d > { "1" }, limittyville ja ei-limittyville, muunnelluille ja muuntelemattomille estimaattoreille; NaN, kun se ei päde, mukaan lukien muuntelematon valkoisen PM:n tapaus, jossa ceil(M/S) <= d ja jonka suljettua muotoa ei ole toteutettu. assurance::uncertainty::edf käyttää nyt samaa koodia ja säilyttää tulosteensa bitilleen

seg-363705e03bac = Oskillaattorin holdover-esiasetukset julkisista datalehdistä

seg-9750d9e0ec7a = Neljä esiasetusta — OCXO (Microchip OX-208), rubidium (Microchip 8040C), cesium (Microchip 5071A high-performance tube) ja CSAC (Microchip SA.45s) — kussakin datalehden Allan-poikkeaman maksimit, ikääntyminen ja lämpötilaraja; ei-negatiivisella pienimmän neliösumman menetelmällä sovitettu valkoisen + flicker + satunnaiskävelyn taajuuskohinan sovite, skaalattu verhoamaan jokainen datalehden piste, flicker-lattia, joka ei ole koskaan pidemmän τ:n lukua pienempi, lineaarinen ikääntyminen ja sinimuotoinen lämpötilatermi, syntetisoituna siemenluvulla tuotettuna holdoverina GNSS:n katoamisen jälkeen

seg-69f93d5ec864 = Mitatusta kellotallenteesta tehty holdover-ennuste, tarkistettu pidätetyllä datalla

seg-8bdc5a24c66d = Lajin <c1/> mitattu tallennepolku: vaihetallenteen limittyvä Allan-poikkeama sovitettuna edf-painotetulla ei-negatiivisella pienimmän neliösumman menetelmällä valkoisen vaiheen ja IEEE Std { "1139" } -taajuusmodulaatiopohjassa (slot_timing::fit_weighted) ja sitten käännettynä rantautumisajaksi, jolloin aikavirhe saavuttaa kynnyksen (slot_timing::slot_budget). Punakohinan lattia mitataan tallenteesta sen sijaan, että se oletettaisiin

seg-c888226296fe = Todellinen vapaasti käyvä atomikello: { "556 990" } yhden sekunnin vaihenäytettä 5071A-cesiumstandardista mitattuna vetymaseria vasten (A. Wallin, jaettu allantoolsin mukana; kiinnitetty commit ja SHA-256 skriptissä scripts/fetch_cs5071a.sh), sama tallenne, jota tests/cs5071a_reference.rs käyttää estimaattoreille. Pidätetyt kaksi kolmasosaa ovat ulkoinen mittaus, jota ennuste ei koskaan nähnyt. Datariippuvainen: realdata-clock-työnkulku hakee tallenteen ja ajaa testin asetuksella KSHANA_REQUIRE_REALDATA={ "1" }. Validoi sovita-ja-käännä-polun valkoisen FM:n hallitsemalla atomistandardilla rantautumisille noin { "50 000" } s asti; ei datalehti- tai luokkalähteitä, ei deterministisiä termejä. EI kideoskillaattori: mitatussa OCXO-tallenteessa (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h vetymaseria vasten) pidätetty ennuste on konservatiivinen, { "0.59" } – { "0.70" } mitatusta ylityksestä, ja useimmiten kynnyksen ulkopuolella, koska oskillaattorin kohinalattia puolittui tallenteen aikana; otoksen sisällä se on { "0.98" } – { "1.17" } sisällä. Kidetapaus pysyy MODELLED. EI myöskään kiertoradalla olevat atomikellot: { "10" } GPS Block IIF -satelliittikellolla (tests/slot_timing_igs_holdout.rs, IGS:n lopulliset { "30" } s kellot, { "14" } päivää, protokolla kirjoitettu ennen lataamista) { "8" } osuu kynnyksen sisään ja { "2" } (G25, G30) ovat optimistisia jopa noin 2x, joten protokollan mukaan kiertoratatapaus pysyy MODELLED

seg-d7e03158b972 = Sekunnit, kunnes vapaasti käyvä kello poistuu aikaindeksoidun ajanjakson suojakaistalta, ja korjausten tahti, joka pitää sen sisällä

seg-0b4d8815f756 = Laji <c1/>: ennustettu virhe E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² käännettynä ylitykselle, jäljellä olevalle ajalle, uudelleensynkronointivälille korjausviiveen jälkeen ja korjauksille vuorokaudessa, kukin termi eriteltynä ja hallitseva nimettynä; kellot kuudesta ClockClass-oletuksesta (TCXO, OCXO ja RAFS lisätty, kukin viittaa yhteen datalehteen), telecom-ajoituksen esiasetuksista, inline-datalehdestä tai mitatusta tallenteesta; lähteen pisintä keskiarvotusaikaa pidemmälle ulottuva ylitys merkitään ekstrapoloiduksi

seg-cc0464060e58 = Suljetun muodon ratkaisut kullekin termille erikseen ja riippumaton holdover::holdover_seconds-juurenetsintä; datalehtien luvut ovat nimetyt asiakirjat (docs/SLOT-TIMING.md). Luokan oletus perustuu oletettuun punakohinan lattiaan ja datalehtilähde on maksimien verhokäyrä, joten kumpikaan ei ole minkään yksikön mittaus

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

seg-4ea08a296b37 = Auringon, Kuun, Merkuriuksen ja Venuksen paikat DE440-kernelistä UTC-ajankohtina (KernelEphemeris)

seg-8d47467c36e4 = Auringon, Merkuriuksen, Venuksen, Maan ja Kuun geometriset paikat toistensa suhteen (J2000/ICRF-akselit, metreinä) JPL DE440 -kernelistä funktion ephem_provider::KernelEphemeris kautta UTC-ajankohtina: kappaleiden nimet kuvattuna NAIF-koodeiksi, UTC vietynä karkaussekuntitaulukon läpi ja TT TDB:ksi kaksitermisellä TDB-TT-sarjalla, kernel luettuna moottorin omalla lukijalla. Kappale, jonka kernel sisältää vain järjestelmän barycentrinä (Mars–Neptunus, Pluto tiedostossa de440s), hylätään eikä sitä koskaan korvata. Kernelitön Standish-rivi säilyy selain- ja varapolkuna

seg-b59153f28d69 = Valoaika aurinkokunnan kappaleiden välillä

seg-48ebe0983725 = Newtonin mukainen yksisuuntainen valoaika mistä tahansa kappaleesta mihin tahansa toiseen, vastaanotettuna ajankohtana, ratkaistuna radiometrisellä kiintopistevaloaikaratkaisijalla (radiometric::light_time_solution, lähetin viivästetyssä paikassaan) funktion solar_system::link_on kautta millä tahansa EphemerisProvider-tarjoajalla; tyyppi solar-system ajaa sen analyyttisellä aurinkokunnalla heliosentrisessä koordinaatistossa (solar_system::link). Kaksisuuntainen etäisyys funktiosta radiometric::two_way_range ja Auringon Shapiro-viive funktiosta radiometric::shapiro_delay raportoidaan erikseen, eikä niitä verrata ulkoisesti. Tuotetaan jokaiselle kappaleelle havaitsijaa vastaan ja mille tahansa lisälinkille tyypillä <c1/> sekä kappaleelta Maahan suuntautuvalle alalinkille tyypillä <c2/>

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

seg-278c77438493 = Ketjutettu tehtävä skenaariotyyppien yli yhdellä yhteisellä aikajanalla

seg-3dcfb26f6234 = Tyypin <c1/> vaiheet: jokainen vaihe ajaa yhden tai useamman olemassa olevan tyypin skenaarion funktiolla run_toml, lukee niiden tulosteet nimettyihin kanaviin (kellon aikavirhe ja suoja, keskimääräinen efektiivinen kantoaalto–kohinatiheyssuhde ja seurantalattia, pystysuora suojaustaso ja hälytysraja, paikkavirhe, seuraavat satelliitit, hälytyslaput) tyyppikohtaisilla esiasetuksilla tai eksplisiittisillä tulospoluilla, sijoittaa ne vaiheen alkuun ja pitää ne yhteisellä ruudukolla, vaiheiden rajoilla ja tapahtumilla; tila siirretään eteenpäin carry-toiminnolla (kanava jatkuu edellisen vaiheen loppuarvosta), handoff-toiminnolla (edellisen vaiheen numero kirjoitetaan seuraavaan skenaarioon) ja end_at-toiminnolla (vaihe päättyy ajon laskemaan aikaan, kuten harhautusvalvonnan havaitsemisaikaan); kampanjatiiviste ja yhteenvetotiiviste jokaisen jäsentuloksen yli

seg-fd018ef7bc3b = Koostamisidentiteetit saman tyypin erillisajoja vastaan: yksivaiheinen kampanja toistaa erillisajon tulosteen bitti bitiltä, siirretty offset on yhtä suuri kuin edellisen ajon oma viimeinen näyte, ja end_at-toiminnolla päätetyn vaiheen pituus on täsmälleen ajon havaitsemisaika. Additiivinen siirto vaiheen rajan yli ja nollannen asteen pito ovat mallinnusvalintoja, ja kukin vaihe on yhtä hyvä kuin sen ajanut tyyppi; mitään ketjutettua tehtävää ei ole tarkistettu mitattua vasten

seg-ad6105af464c = Parametripyyhkäisyt ja siemennetyt Monte Carlo -ensemblet minkä tahansa skenaariotyypin yli

seg-95921611839e = Tyypin <c1/> sweep-osio (yhdestä kolmeen pisteillä erotettua avainta mistä tahansa tyypistä, yleisen pyyhkäisyn akseliarvoilla, valinnaisesti ensemble jokaisessa solmussa) ja monte_carlo-osiot: realisaatio k ajetaan siemenluvulla base_seed + k; jokaisesta mittarista raportoidaan keskiarvo, keskihajonta, lähimmän sijan 5., 50. ja 95. persentiili sekä kiinteällä siemenluvulla laskettu persentiili-bootstrap-{ "95" } %:n luottamusväli keskiarvolle (inertial::metric_stat); mittarien yksiköt luetaan pyyhkäistyn tyypin omasta units-lohkosta

seg-03d15c27b3b9 = Vaiheen satunnaiskävelyn suljettu muoto valkoisen taajuuskohinan alla, varianssi q_wf tau (NIST Technical Note { "1337" }), tilastokoneistolle, sekä tavuyhtäläisyys erillisajojen kanssa siementämiselle. Se tarkistaa ensemble-aritmetiikan moottorin omalla kellomallilla, ei ulkoista aineistoa

seg-24327a0ed82e = Useita skenaarioita yhteisissä olosuhteissa, yhdistetyllä yhteenvedolla

seg-5833fb3b06e3 = Tyypin <c1/> compose-osio: nimetyt yhteiset arvot (esimerkiksi yhden häirijän teho ja paikka) kirjoitetaan jokaiseen jäseneen avaimiin, joihin ne on sidottu, jokainen jäsen ajetaan, ja mittaria kohti raportoidaan jäsenten pienin, suurin ja keskimääräinen arvo nimettynä jäsenenä; mittarien yksiköiden on oltava samat kaikissa jäsenissä

seg-67ffd6684b1c = Koostamisidentiteetti erillisajoa vastaan. Yhteisten olosuhteiden aritmetiikka on kirjanpitoa; fysiikka on jäsentyyppien, joilla kullakin on oma rivinsä

seg-0bc866720bde = Rajattu optimointi yhdelle mittarille kampanjaparametrien yli

seg-f9bdb89c2b4f = Tyypin <c1/> optimize-osio (CAP-32): yhdestä kolmeen pisteillä erotettua skenaarioavainta rajattuna välille [lo, hi] lin- tai log-asteikolla, yksi tulospolulla luettu mittari, tavoite minimize, maximize tai target; menetelmä grid (pyyhkäisyn akseliarvot) tai deterministinen Nelder–Mead-simpleksi normalisoiduissa koordinaateissa laatikkoprojektiolla ja tavallisilla kertoimilla; puuttuva tai ei-äärellinen mittari saa huonoimman pistemäärän ja pysyy jäljessä; kun runs > { "1" }, mittari on keskiarvo yhteisten siemenlukujen yli; jokainen arviointi on nimetyn tyypin todellinen ajo, listattuna kohdassa trace ja laskettuna toistettavuustiivisteeseen

seg-e3a2f80b04dc = Vain sisäinen: linkkiyhtälön tarkka -20 log10(range) -suljettu muoto, riippumaton raa'an voiman ruudukko samalle tyypille ja Rosenbrockin funktio. Kierroksen { "1" } 1-ulotteinen kynnys on NOT MET (ennalta rekisteröity laatikko sulki pois { "3" } dB:n ratkaisun; optimoija pysähtyi rajaan), kirjattu tiedostoon docs/design/evidence/cap32-optimize/RESULTS.md eikä pisteytetty uudelleen. Optimi on paikallinen laatikolle ja aloituspisteelle; globaalia optimia ei väitetä

seg-b9b1637d326c = Kaistarajoitetut suljetut muodot mille tahansa etäisyydenmittaussignaalille: kaistan sisäinen teho ja varhais–myöhäis-koodiseurannan jitter julkaistuja arvoja vastaan, Gabor-kaistanleveys ja siirretty spektrinerotus ristiintarkistettuina

seg-6cfdc433b120 = navsignal: sini-integraali (sine_integral), BPSK-R:n tehon osuus kaksipuolisen kaistan sisällä suljetussa muodossa (bpsk_power_in_band_closed_form), kaistarajoitetun BPSK:n Gabor-kaistanleveys suljetussa muodossa (bpsk_gabor_bandwidth_closed_form_hz), kaistarajoitettu koherentti ja epäkoherentti varhais–myöhäis-viivelukitussilmukan jitter mille tahansa yksikköpinta-alaiselle spektrille Betzin & Kolodziejskin { "2009" } mukaan (dll_jitter_bandlimited_s) ja sen häviävän välin Gabor-raja (dll_jitter_small_spacing_limit_s), siirretty BPSK:n spektrinerotuskerroin suljetussa muodossa (bpsk_offset_ssc_closed_form), Galileo E5 AltBOC({ "15,10" }) -spektri (altboc_15_10_psd) ja modulaatiotunnisteen jäsennin (parse_modulation); tyyppi <c1/> käyttää näitä jokaiselle signaalimallille

seg-15d8c44be46f = Ulkoisesti lukittu: { "90.3" } prosenttia pääkeilan tehoa, koherentti varhais–myöhäis-jitter ilmoitetussa toimintapisteessä, sini-integraalitaulukon arvot sekä BPSK:n itse-spektrinerotuskerroin 2/({ "3" } R_c) nollasiirtymällä. Vain sisäisiä ristiintarkistuksia, ei ulkoista validointia: kaistarajoitetun BPSK:n Gabor-kaistanleveyden suljettu muoto ja sen asymptootti sekä siirretty BPSK:n spektrinerotuskerroin nollasta poikkeavilla siirtymillä, molemmat johdettu tässä ja tarkistettu kvadratuurilla. Julkaistut suljetut muodot: BPSK-R:n sinc-neliöspektri ja sen { "90" } prosentin pääkeilan teho (Kaplan & Hegarty, Understanding GPS/GNSS, 3rd ed.); koherentti varhais–myöhäis-koodiseurannan jitter sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, section { "8" }) ja kaistarajoitettu yleistys Gabor-kaistanleveysrajoineen (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); Abramowitzin & Stegunin sini-integraalitaulukot (Table { "5.1" }); spektrinerotuskerroin autokorrelaation neliön Fourier-muunnoksena (Betz { "2001" }). AltBOC-spektristä tarkistetaan vain yksikköpinta-ala ja keilan paikka (Galileo Open Service Signal-in-Space Interface Control Document -lauseke integroituu arvoon { "8" }, ja se jaetaan sillä).

seg-def449efa852 = Matalan Maan kiertoradan navigointisatelliitin suurin Doppler, joka mitoittaa hakualueen

seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: suurin satelliitin Doppler yläpuolisella ylilennolla korkeuskulmamaskin kohdalla ympyräradalle, v R_E cos(el) / (R_E + h) kertaa f / c, kunkin esiasetuksen omasta kantoaallosta ja ratakorkeudesta; tyyppi <c1/> lisää oskillaattori- ja käyttäjätermit ja muuttaa sen Doppler-lokeroiksi

seg-c26e0c7c6821 = Julkaistut luvut: Xona Pulsar X1 suurin Doppler { "32" }–{ "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, https://arxiv.org/abs/2509.19551); Iridiumin Doppler enintään +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Maan pyöriminen on jätetty pois, mikä muuttaa lukua enintään noin { "2.3" } kHz; molemmat julkaistut luvut täyttyvät ilman sitä.

seg-652e28dfa10f = Matalan Maan kiertoradan paikannus-, navigointi- ja ajanmääritysjärjestelmien signaalimallit: koodiseuranta, havaitseminen, GNSS-yhteensopivuus ja kaistavertailu mille tahansa järjestelmälle

seg-c0ba5c7e708e = Tyyppi <c1/>: parametrisoidut signaalimallit (kaista, lähetyskaistanleveys, ITU-allokaatio; havainto-, data- ja pilottikomponentit BPSK(n)-, BOC(m,n)-, MBOC- tai tasaisilla spektreillä, tehonjaot, FDMA-alikantoaallot, koodipituudet ja datanopeudet) käännetyistä julkisista esiasetustiedostoista (Xona Pulsar, Iridium STL, Starlink-opportunistinen signaali, CentiSpace, yleinen C-kaistan malli sekä yleiset UHF/L/S/C/laaja-C-mallit, kullakin lähde-URL ja julkaisemattomat arvot merkittyinä REPRESENTATIVE) tai kirjoitettuna suoraan; signaalia kohti kaistarajoitettu tehospektritiheys, kaistansisäiset tehoosuudet, Gabor-kaistanleveys, koodijitter suhteessa C/N0:aan ja välitykseen sekä etäisyydenmittaustarkkuus, hakuavaruus, neliölakihavaitsemisen todennäköisyys sekä keskimääräinen sarja- ja koodirinnakkaishankinta-aika, spektrinerotuskerroin signaaleihin GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b ja AltBOC ja niistä C/N0-heikkenemän kanssa sekä CW-, laajakaista- ja sovitettu J/S-sieto spektrityypin SSC-ketjusta; ionosfäärin viiveen, vapaan tilan vaimennuksen, yhtäläisellä C/N0:lla ja yhtäläisellä EIRP:llä saavutettavan etäisyydenmittaustarkkuuden ja häirinnänsiedon kaistavertailu; sekä mallin laadulliset muototarkistukset kuvattua mittausta vasten

seg-040b3f5cc70e = Yllä olevien kahden rivin validoidut suljetut muodot, neliölakihavaitsemisen väärän hälytyksen identiteetti P_d(snr = { "0" }) = P_fa ja Holmesin keskimääräinen hankinta-aika sekä palautus spektrityypin omaan SSC-ketjuun (sama Jammer::ssc-koodi). Mallit itse ovat syötteitä: esiasetukset, jotka on merkitty REPRESENTATIVE tai WORKSHOP, eivät ole julkaistuja määrittelyjä, parannetut Feher-QPSK-, koodinsiirtoavainnus- ja OFDM-spektrit on approksimoitu, ja muototarkistukset vertaavat muotoja, ei kalibroituja tasoja.

seg-c2b9c8e4a364 = Monikaistainen spektrin vesiputouskuvaaja (UHF, L, S, C) suunnitelluilla signaaleilla ja kaistakohtaisilla häirijöillä

seg-609df4e0a085 = Tyyppi <c1/> laajennettuna L-kaistan ulkopuolelle: kaistat annettuna esiasetettuna signaalimallina (piirrettynä jokaisella komponentilla, kaistarajoitettuna lähetyskaistanleveyteen, C/N0 ja J/S viitattuna seurattuun komponenttiin) tai mukautettuna kantoaaltona ja modulaationa; ylimääräiset vesiputouspaneelit millä tahansa taajuusalueella samalla aikajanalla ja värikaavalla; laajakaistainen (barrage) häirijä CW-, kapeakaista-, chirp- ja sovitetun kohinan rinnalla; kaistakohtainen J/S ja efektiivinen C/N0 muuttumattomasta spektrinerotuskerroinketjusta

seg-a3b398f66ad3 = Palautus nykyiseen spektriketjuun ja häirintätyypin häirinnänestoyhtälöön (yhden komponentin kaista antaa samat luvut kuin ennen laajennusta) sekä validoitujen rivien signaalispektreihin. Häirijöiden tehot, aikajana, etupään kaistanleveydet ja suunnitellut signaalit ovat syötteitä, ja suunniteltu signaali katkaistaan lähetyskaistallaan (ei kaistan ulkopuolista emissiota).

seg-f92d6cbc58d4 = Sateen ominaisvaimennuskertoimet mille tahansa LEO-PNT-linkin käyttämälle kaistalle

seg-96b6a118d374 = ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 -yhtälöt ({ "1" })–({ "5" }): k_H, alpha_H, k_V, alpha_V taulukoiden { "1" }–{ "4" } käyräsovituksista, reitistä ja polarisaatiosta riippuvat (k, alpha) ja ominaisvaimennus k R^alpha; tyypin <c1/> sadetermi käyttää niitä

seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) Table { "5" }, suosituksen oma taulukoitu k_H, alpha_H, k_V, alpha_V, committoitu tiedostoon tests/fixtures/leo_link/p838_3_table5.csv PDF-URL:n ja hakupäivän kanssa. Taulukko on pyöristetty painettuihin numeroihinsa, joten kynnys on tuo pyöristys

seg-f4a311f936de = Pitkän aikavälin vinon reitin sadevaimennus Maa–avaruus-linkillä

seg-2b2dba8bf5a7 = ITU-R P.618-14 section { "2.2.1.1" } steps { "2" }–{ "10" } (vino ja vaakasuora reitti sadekorkeuden alapuolella, vaakasuuntainen supistus- ja pystysuuntainen korjauskerroin, A0.01 ja sen skaalaus arvoihin { "0.001" } %–{ "5" } % keskimääräisestä vuodesta), sadekorkeus (P.839) ja R0.01 (P.837) syötteinä, koska moottori ei sisällä kumpaakaan digitaalista karttaa; tyyppi <c1/> soveltaa kaistaa ja ajankohtaa kohti

seg-325d1bb9c26d = ITU-R Study Group { "3" } -validointiesimerkkitiedosto CG-3M3J-13-ValEx-Rev8.3.0 suositukselle P.618-14, ITU-Rpy-validointisivujen taulukoimana, kunkin paikan P.839-4-sadekorkeus samoista esimerkeistä; committoitu tiedostoon tests/fixtures/leo_link/p618_14_rain_attenuation.csv URL-osoitteiden ja hakupäivän kanssa. Validoi menettelyn kun h_R ja R0.01 on annettu, ei karttoja

seg-6b51ec84bdce = Troposfäärin amplitudisintillaatio Maa–avaruus-linkillä

seg-869894dec004 = ITU-R P.618-14 section { "2.4.1" } steps { "3" }–{ "9" } (vertailu-sigma arvosta N_wet, efektiivinen reitin pituus, antennin keskiarvoistuskerroin, häipymän syvyys { "0.01" } %:lle–{ "50" } %:lle ajasta), N_wet syötteenä tai laskettuna lämpötilasta, kosteudesta ja paineesta ITU-R P.453-14 -lausekkeilla; alle { "4" } GHz tyyppi <c1/> merkitsee arvon ekstrapoloinniksi

seg-7fc4a1e7960a = ITU-R Study Group { "3" } -validointiesimerkit (CG-3M3J-13-ValEx-Rev8.3.0) P.618-14-sintillaatiolle, kunkin paikan P.453-14 N_wet samoista esimerkeistä; committoitu tiedostoon tests/fixtures/leo_link/p618_14_scintillation.csv URL-osoitteiden ja hakupäivän kanssa. Märän refraktiivisuuden lauseketta lämpötilasta ja kosteudesta ei kata tämä rivi

seg-e0d40cf4ea79 = Rakennuksen läpäisyvaimennus sisätiloissa olevalle LEO-PNT-käyttäjälle

seg-4f06274e38ec = ITU-R P.2109-2 Annex { "1" } equations ({ "1" })–({ "10" }) ja Table { "1" }: vaimennus, jota ei ylitetä todennäköisyydellä P, perinteisille ja lämpötehokkaille rakennuksille reitin korkeuskulmassa julkisivulla, { "80" } MHz–{ "100" } GHz; tyyppi <c1/> soveltaa kaistaa ja ajankohtaa kohti sisätiloissa olevaan käyttäjään (UHF-sisätilatapaus)

seg-99c648f9c6eb = ITU-R Study Group { "3" } Clutter and BEL -validointityökirjan arvot sellaisina kuin ne on transkriboitu vertailu-MATLAB-toteutuksen validointiskriptissä (github.com/eeveetza/p2109), committoitu tiedostoon tests/fixtures/leo_link/p2109_bel.csv URL-osoitteen ja hakupäivän kanssa. Työkirja tulostaa kolme desimaalia

seg-8c5e291c8ff8 = Ensimmäisen asteen ionosfäärin viive kaistaa kohti, ionosfäärivapaa yhdistelmä ja vapaan tilan vaimennus

seg-89df726127f9 = Ryhmäviive { "40.3" } STEC/f^{ "2" } kaistaa kohti; ionosfäärivapaat kertoimet f1^2/(f1^{ "2" } - f2^{ "2" }) ja -f2^2/(f1^{ "2" } - f2^{ "2" }) sekä kohinan vahvistus sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) mille tahansa kaistaparille; vapaan tilan vaimennus { "20" } log10({ "4" } pi R f/c) funktiosta linkbudget::free_space_loss_db sen kilometri–megahertsi-muodossa

seg-9bf00f744174 = IS-GPS-200 section { "20.3.3.3.3.2" }, joka ilmoittaa L1/L2-ryhmäviiveen suhteen gamma = (77/60)^{ "2" }, joka seuraa ensimmäisen asteen 1/f^{ "2" }-skaalauksesta, sekä Friisin siirtokaava (Proc. IRE, { "1946" }). Validoi skaalauslait, ei vinoa TEC:iä

seg-c584a867fcda = Suurin Doppler, jonka staattinen käyttäjä näkee LEO- tai MEO-radalta

seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: haku ympyräradan jokaisen rataspaikan ja jokaisen satelliitin horisontilla olevan käyttäjän yli, Maan pyöriessä, suurimmalle etäisyyden muutosnopeudelle, sekä rata- ja suurin Maahan kiinnitetty satelliitin nopeus; tyyppi <c1/> raportoi kaistaa kohti Doppler-verhokäyränä ja käyttää sitä sen matalaenergiamallin kylmäkäynnistyksen hakuikkunana

seg-4abd3afebad2 = Leclere, Marathe and Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, Table { "1" } (staattinen vastaanotin { "6371" } km:n pallolla, Maan pyöriminen ainoa muu vaikutus): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz L1:llä. Kattaa ympyrämäiset kahden kappaleen radat

seg-d9eb3e7e69c2 = LEO-PNT-ylilento ja sen kaistakohtainen linkkibudjetti näkyvissä oleviin MEO-GNSS-satelliitteihin verrattuna

seg-d986e44443dd = Tyyppi <c1/>: satelliitit suunnitellusta ylilennosta, elementeistä, TLE:stä SGP4:n kautta tai Walker-satelliittitähdistöstä tyypistä constellation-design; kaistaa ja ajankohtaa kohti katselukulmat, etäisyys, suljetun muodon etäisyyden muutosnopeus ja etäisyyden kiihtyvyys (tarkistettu joka ajolla keskeisdifferensseillä ja raportoitu), vapaan tilan vaimennus, EIRP isoflux-, Gauss- tai tasaisella kuviolla, patch-, puolipallo- tai isotrooppinen käyttäjäantenni, ITU-R P.676-10 Annex { "2" } -kaasuvaimennus, P.618-sade ja -sintillaatio, P.2109-rakennuksen läpäisyvaimennus, polarisaatiosovittumattomuus, järjestelmän kohinalämpötila, C/N0, Doppler ja Dopplerin muutosnopeus sekä ensimmäisen asteen viive Klobucharin tai pystysuoran TEC:n vinosta TEC:stä satelliitin alapuolisella Chapman-osuudella skaalattuna; ionosfäärivapaat parit koodikohinalla ylilennon huipulla; Galileo- tai GPS-kantoaallot niiden rajapintadokumenttien vastaanotetuista tehoista saman vastaanottimen kautta

seg-c558a6519038 = Suljetut muodot ja itsejohdonmukaisuus: etäisyyden muutosnopeuden ja etäisyyden kiihtyvyyden identiteetit numeerisia derivaattoja vasten, isoflux-vahvistus kumoaa etäisyyden kasvun, oppikirjan polarisaatiohäviön rajat, laadullinen LEO–GNSS-havainto (kellonmuotoinen, minuuttien mittainen ylilento, jonka huippu on useita dB tasaisten 44–51 dB-Hz GNSS-kantoaaltojen yläpuolella). EIRP:t ja kuviot ovat julkaistuja vastaanotettuja tehoja muutettuna EIRP:ksi tai edustavia valintoja, kaasutermi on korvattu P.676-10:n yksinkertaistettu menetelmä, eikä mitään verrata mitattuun LEO:n C/N0:aan

seg-95a077a980b6 = Nimetyt LEO-PNT-järjestelmäesiasetukset ilmoitetuin lähtein sekä järjestelmäagnostinen moottori

seg-4b47033cda24 = leo_link::presets: yleinen monikaista (UHF, L, S, C), yleinen C-kaista, Xona Pulsar X1/X5, Iridium STL, Starlink vain Doppler-signaalina opportunistisena signaalina, CentiSpace ja valinnainen Celeste IOD -esiasetus, kunkin lähde merkittynä PUBLIC (URL-osoitteen kanssa), REPRESENTATIVE tai WORKSHOP, työpajaesiasetus valinnaisessa Celeste IOD -esiasetustiedostossa ja käännetään mukaan vain jos tuo tiedosto on olemassa; jokainen kaista ja rata on ohitettavissa skenaariossa, ja skenaario voi olla nimeämättä mitään esiasetusta

seg-399dc53ceafb = Lainattujen julkisten lukujen transkriptio ja johdonmukaisuustarkistus: julkaistusta pienimmästä vastaanotetusta tehosta asetettu EIRP ennustaa julkaistun suurimman { "0.5" } dB:n sisällä tasaisella kuviolla. Se on etäisyysvaihtelun tarkistus, ei minkään satelliitin antennin validointi; edustavat esiasetukset eivät väitä mitään todellisesta järjestelmästä

seg-a39f34973373 = Matalaenergiapaikannus: aika ensimmäiseen ratkaisuun ja energia ratkaisua kohti suhteessa käyttösuhteeseen

seg-f3b9b669a76f = leo_link::energy ja tyypin <c1/> [iot]-osio: Doppler-nopeuden rajoittama koherentti integrointi, neliölakiset epäkoherentit summat havaitsemiskynnykseen, Doppler-lokerohaku radan staattisen käyttäjän verhokäyrän yli (kylmä) tai tuettu ikkuna (kuuma), rinnakkainen tai sarjahaku koodille, navigointiviestin aika kylmäkäynnistyksessä, energia ratkaisua kohti ja akun kesto ratkaisuvälien yli, jokaiselle LEO-kaistalle ja GNSS-signaalille

seg-a5fa1ef1be9b = Ilmoitetun mallin sisäinen johdonmukaisuus: jokainen teho-, kynnys- ja hakuvalinta on syöte, ja malli jättää huomiotta bittireunan epäselvyyden, havaitsematta jäämisen ja uudelleenhankinnan. Ei verrata mitattuun vastaanottimeen

seg-7e94f8b38cff = Globaalin keskiarvon signaali avaruudessa -etäisyysvirheen painot mille tahansa ratakorkeudelle

seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: radiaalipaino w_R ja poikittaispainon neliö w_AC^{ "2" } näkölinjan nadiirikulman cos^{ "2" }:n ja puolikkaan sin^{ "2" }:n keskiarvoina korkeuskulmamaskin yläpuolella näkyvällä Maan kalotilla tasaisesti jakautuneiden käyttäjien yli, mille tahansa ratasäteelle, Simpsonin integroinnilla; jokainen leo-navmsg-SISRE-luku käyttää sitä (korkeudella { "510" } km w_R { "0.46" } ja w_AC^{ "2" } 1/2.5)

seg-b9b5fe9d3b25 = Julkaistu SISRE-painokerrointaulukko, Montenbruck, Steigenberger ja Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } ja 1/49, GLONASS { "0.98" } ja 1/45, Galileo { "0.98" } ja 1/61, BeiDou MEO { "0.98" } ja 1/54, BeiDou IGSO/GEO { "0.99" } ja 1/126. Sama keskiarvo laskettuna LEO-ratasäteillä antaa LEO-painot; julkaistua LEO-taulukkoa ei ole kiinnitetty, joten LEO-arvot ovat validoidun menetelmän soveltamista, eivät erikseen validoituja

seg-3cbb8b6afe3c = Galileon ICD:n lähetetyn efemeridin käyttäjäalgoritmi LEO-navigointisanoman perustana

seg-88efbce1f836 = leo_navmsg::elements::kepler_point: Galileo OS SIS ICD:n mukainen Kepler-ratojen laskenta (Keplerin yhtälö, toisen harmonisen korjaukset, Maahan sidottu solmu), kirjoitettu erikseen moottorin RINEX-laskijasta; se palauttaa paikan sekä leveysargumentin, inklinaation ja solmun, joiden varaan pitkin-, poikki- ja säteissuuntainen korjauskehys rakennetaan, sekä Liu et al. { "2025" } -laajennustermit

seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos ECEF-paikat (saman ICD-algoritmin riippumaton toteutus) todellisille BKG/IGS-lähetetyille tietueille ajalta 2024-09-10; molemmat on tallennettu alkuperätietoineen hakemistoon tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). Tämä validoi Kepler-käyttäjäalgoritmin; sen päälle lisättyjä pitkin-, poikki- ja säteissuuntaisia korjauksia kattavat niiden omat rivit ja Liu-termejä Liu et al. { "2025" } -mallin 22 parametrin rivi

seg-d65102fd4a1d = CRC-24Q-kehystarkistus LEO-navigointisanomalle

seg-aed568016867 = leo_navmsg::codec::crc24q: generaattoripolynomi 0x1864CFB, alkuarvo { "0" }, ei peilausta, ei lopullista XOR-operaatiota; tarkistus, jonka Kshana-LEO-kehys kantaa kaikkien edeltävien tavujen yli

seg-18c79d18e4e4 = CRC-luettelon tarkistusarvo näille parametreille (reveng.sourceforge.io CRC catalogue, CRC-24/LTE-A: leveys { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), jotka ovat RTCM { "10403" }:n ja Galileo OS SIS ICD:n CRC-24Q-parametrit, sekä RTCM { "10403" }:ssa painettu viestityypin { "1005" } esimerkkikehys

seg-82b9b0f7b07c = LEO-lähetetyn efemeridin sovitin ja signaali avaruudessa -etäisyysvirhe suhteessa sovitusvälin pituuteen ja päivitysjaksoon

seg-8c7065aa22bd = Tyypin <c1/> sovitin ja kompromissi: valittuun asteeseen asti vyöhykkeisellä J2-J6- tai EGM2008-painovoimalla ja ilmanvastuksella integroitu todellinen rata sekä siemenluvulla alustettu vapaa tai ohjattu kello; Galileon Kepler-parametrijoukon Levenberg-Marquardt-sovitus ei-singulaarisille elementeille heikoin priorein, minkä jälkeen pitkin-, poikki- ja säteissuuntaiset korjauspolynomit lineaarisella pienimmän neliösumman menetelmällä; kellopolynomi sovitettuna käyttäjän relativistisen termin vähentämisen jälkeen; SISRE (pelkkä rata ja kellon kanssa) käyttöjaksoilla, jotka on keskitetty sovitusikkunoihinsa, suhteessa sovitusväliin ja päivitysjaksoon. Validoitu osa: 16 parametrin Kepler-sovitus ja sen pelkän radan SISRE suhteessa sovitusväliin todellisilla tarkoilla radoilla sekä integroitu J2-J6/EGM2008({ "20" }, { "70" })/ilmanvastus-todellinen rata Orekit { "12.2" } -ohjelmaa vasten { "4.6" } mm:n sisällä { "6" } tunnin ajalla (kynnys { "2" } cm, sama tiheyssyöte); korjauspolynomit, kellosovitus (siemenluvulla alustettu vapaa tai ohjattu kello) ja päivitysjakson kompromissi pysyvät mallinnettuina

seg-8121e7db3db3 = LEO-navigointisanoman päivitys ylilennon aikana ja jatkuvuustarkistus vaihtohetkellä

seg-34c310d85c42 = Tyypin <c1/> ylilennon aikaisen päivityksen analyysi: käyttäjän korkein ylilento hakujaksolla, sanomat yleisellä aikataululla ja käyttöjaksot keskitettynä sovitusikkunoihinsa, ja jokaisella vaihtohetkellä 3D-paikkahyppy, kellohyppy, käyttäjän pseudoetäisyyshyppy, suurin hyppy minkä tahansa näkyvän näkölinjan yli (suljettu muoto nadiirikartion yli), etäisyysvirhe ennen ja jälkeen sekä PASS/FAIL kynnystä vasten

seg-418f2cd21141 = Sisäinen johdonmukaisuus (hyppyidentiteetti ja kartiorajoite raa'an voiman otantaa vasten). Kynnys on syöte; julkaistua LEO-jatkuvuusvaatimusta ei ole kiinnitetty

seg-7635a8339e78 = LEO-navigointisanoman dokumentoitu binäärikoodaus ja kvantisointivirhebudjetti

seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshanan oma kehys (johdanto, versio, malli, pituus, hyötykuorma, CRC-24Q) neljälle efemeridimallille, kellopolynomille, SVID:lle, datan julkaisutunnukselle, kaistalle, terveydelle, Klobuchar-joukolle, NeQuick-G-kertoimille ja UTC-parametreille, jokaiselle kentälle ilmoitettu leveys ja askel (field_table), kvantisointi alueen ylityksen hylkäyksellä sekä budjetti suurimmalle paikan ja kellon muutokselle, jonka kunkin kentän puolen askeleen muutos aiheuttaa voimassaoloaikana

seg-4261a9fac5d9 = Kierrosidentiteetit ja itse budjetti. Muoto on Kshanan oma, mallinnettu julkaistuihin sanomakomponentteihin ja Galileo ICD:n kenttäjoukkoon; se ei ole Celesten tai minkään muun järjestelmän bittiasettelu (mikään ei ole julkinen), joten ulkoista asettelua vasten ei voi validoida

seg-17ca41d7fd71 = LEO-navigointisanomien RINEX-4-tyyliset ja CSV-viennit

seg-185e12ccef0d = leo_navmsg::text: RINEX-4-tyylinen lohko (> EPH-tietueen otsikko, satelliitti- ja epookkirivi kolmella kellotermillä, D19.12-lähetetyn radan rivit) järjestelmäkirjaimella L ja tietuetyypeillä KP16, KRAC, LU22 ja APOL, jokaisessa otsikossa merkittynä Kshana-laajennukseksi, joka ei kuulu RINEX { "4.02" } -standardiin, sekä CSV-taulukko oletussarakeskeemalla ja esiasetetuilla skeemoilla, kullekin tuoja

seg-5cc5b6382437 = Kierrokset ja kalenterilaskenta. RINEX { "4.02" } ei määrittele LEO-navigointitietueita (IGS RINEX { "4.02" }), joten asettelu on dokumentoitu laajennus, jossa arXiv { "2401.17767" } on mainittu aiempana tekniikkana; sen tarkistamiseen ei ole ulkoista lukijaa

seg-ff15935ba1b3 = Liu et al. { "2025" } -mallin 22 parametrin LEO-efemeridimalli ja sen sovitus todellisille tarkoille radoille

seg-6af1b6f3bbd4 = leo_navmsg::elements::EphemerisModel-tyypin Liu22-variantti, jonka kepler_point laskee Liu22Extra-rakenteella: 16 parametrin joukko sekä isoakselin muutosnopeus a_dot, keskiliikkeen muutosnopeus n_dot, joka tulee mukaan muodossa n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk ja on kirjattu artikkelin yhtälöstä { "1" } (sovitusvertailu ei riipu tästä skaalakonventiosta, joten lähetetyn nDot-arvon merkitystä ei validoida tässä), sekä kerran ja kolmesti kierrosta kohden esiintyvät sädeharmoniset Crs1, Crc1, Crs3, Crc3 korjaamattomalla leveysargumentilla. Sen sovitus leo_navmsg::fit::fit_message-funktiolla noudattaa artikkelin kohdan { "2.3" } alkutilaa ja estimaattoria (jokainen korjaus alkaa nollasta; tavallinen pienin neliösumma ilman prioreita; artikkelin 100 iteraation raja), mutta pysähtyy Kshanan parametrikonvergenssisääntöön (jokainen askel alle { "1e-3" } sen muodollisesta sigmasta) artikkelin säännön, RMS-muutos alle { "0.1" } mm, sijaan. Sovitettu { "20" } ja { "30" } minuutin kaarille taulukoidusta tarkasta radasta

seg-e79047fc95af = ATOMIC-nollakello-ECEF-polynomi ja synteettinen viiden korkeuden LEO-mallivertailu

seg-e261843e35b1 = leo_navmsg::elements::EphemerisModel-tyypin EcefPoly-variantti: akselikohtainen ECEF-polynomi ilman kellotermejä, relativistinen termi lausekkeesta -2 r.v/c^{ "2" }, pisteytettynä ohjattua kelloa vasten. Lisäksi mallivertailuanalyysi (liu_comparison yli LIU2025_TABLE), joka sovittaa 22-parametrisen mallin artikkelin viidellä korkeudella Kshanan integroimalle radalle 20 minuutin kaarilla ja tulostaa tuloksen julkaistun SISRE:n viereen

seg-a3b92fdcc591 = ATOMIC-mallin tosiasiat InsideGNSS-lehdestä (6. asteen polynomi, noin yhden minuutin voimassaoloaika, { "30" } s päivitys, kello ohjattu, { "24" } cm kellovirhe). Nämä ovat kuvailevia tosiasioita, joille ei ole julkaistuja vertailulukuja. Viiden korkeuden taulukko tulostaa Liu ym. { "2025" } SISRE-arvot ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } ja { "0.75" } cm korkeuksilla { "320" }, { "475" }, { "786" }, { "966" } ja { "1336" } km 20 minuutin kaarella) Kshanan omalle integroidulle radalleen tekemän sovituksen ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } ja { "0.51" } cm; suhteet { "0.46" } – { "0.77" }) viereen, ei kiinnitetty, koska artikkelissa sovitettiin todellisia tarkkoja ratoja ja totuudet eroavat. 22-parametrinen malli ja sovite itse validoidaan todellisia ratoja vastaan rivillä Liu et al. { "2025" } 22-parametrinen LEO-efemeridimalli ja sen sovitus todellisille tarkoille radoille. Revisio { "0.30" }: taulukon luvut muuttuivat artikkelin käytännön mukaisen sovituksen myötä (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

seg-7a9fca5166d4 = LEO-navigointiviestin yksitaajuiset ionosfääri- ja UTC-palvelut

seg-bc73bfeca68e = leo_navmsg::services: Klobucharin lähetetty viive millä tahansa kantoaallolla (moottorin L1-malli skaalattuna kertoimella (f_L1/f)^{ "2" }), NeQuick-G:n tehokas ionisaatiotaso Az = ai0 + ai1 mu + ai2 mu^{ "2" } nollasääntöineen ja [{ "0" }, { "400" }] sfu -sääntöineen sekä järjestelmäaika UTC-aikaan ICD:n kolmella karkaussekuntitapauksella

seg-0af8030f4d21 = Doppler, jota maanpäällisen vastaanottimen on käsiteltävä LEO-navigointisatelliitilta

seg-9714103964d6 = Sellaisen satelliitin tarkka etäisyysnopeus, jonka Maahan kiinnitetty paikka ja nopeus tulevat kahden kappaleen radalta sekulaarisella J2-ajautumalla ja Maan pyörimisellä (leo_fusion::geom::EarthOrbit::state, nopeus on paikan tarkka aikaderivaatta), muunnettuna Doppleriksi kantoaallolla; suurin absoluuttinen Doppler, Doppler-nopeus ja nykäys korkeuskulmamaskin yläpuolella ikkunassa (leo_fusion::doppler::doppler_envelope), raportoituna LEO-järjestelmittäin lajissa <c1/> Doppler-tilassa

seg-ebf6cee8ec4c = Julkaistut luvut toistettuna ilmoitetulta radalta ja kantoaallolta: Iridium-Doppler enintään plus tai miinus { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) ja Xona Pulsar X1:n suurin Doppler { "32" } – { "34" } kHz (Leclère, Marathe ja Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Iridium-luku on pyöristetty yläraja, minkä vuoksi kynnys on { "5" }%. Doppler-nopeus ja nykäys raportoidaan mutta niitä ei validoida: Pulsar X1:n mallinnettu ylilentonykäys on noin { "1.0" } Hz/s^{ "2" } julkaistua lukua { "1.26" } vastaan

seg-d2e18c8bdc14 = Paikannus LEO-Dopplerista, yhden ja usean satelliitin, kellon ajautuma- ja nopeustiloilla

seg-de6cb3c06490 = Eräajona tehtävä Gauss–Newton-paikannus etäisyysnopeudesta analyyttisillä osittaisderivaatoilla (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), vaihtoehtona vakiokäyttäjänopeus, korkeuspseudomittaus pintakäyttäjälle, vaimennetut askeleet; muodollinen kovarianssi todellisessa pisteessä; ratasuuntaiset, ratapoikittaiset ja pystysuuntaiset projektiot; yhden ylilennon tarkkuus suhteessa käyttäjän ratapoikittaiseen siirtymään; lähimmän lähestymisen aika. Lajin <c1/> Doppler-tila lisää virheen ikkunan pituuden funktiona ja vain Doppleriin perustuvan opportunistisen signaalin tilan (esiasetus starlink-sop)

seg-84e2eb636579 = Sisäinen johdonmukaisuus: kohinaton palautus, kinemaattinen identiteetti rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho derivoituna numeerisesti, nolla-Doppler lähimmän lähestymisen hetkellä, yksittäisen ylilennon peiliratkaisu ja siemenluvulla tuotetut virheet muodollista kovarianssia vasten. Kozhayan, Saroufimin ja Kassasin Starlink-luku (NAVIGATION { "72" }({ "1" }), { "2025" }: noin { "2" } m { "20" } sekunnissa kolmella satelliitilla) on vain vertailu: mallinnettu vastaanotin täydellisellä efemeridillä ja kaikilla virheillä { "30" } Hz:n Doppler-sigmassa on samassa ikkunassa useita kertoja epätarkempi, eikä artikkelin vastaanotinta ja mittaustahtia toisteta

seg-7f462969d2d4 = Yhteinen GNSS- ja LEO-pseudoetäisyyspaikannus järjestelmien välisillä harhoilla ja signaalikohtaisilla virhemalleilla

seg-b9b5298e3408 = Painotetun pienimmän neliösumman Gauss–Newton-ratkaisut mille tahansa järjestelmien yhdistelmälle, yksi vastaanottimen kello järjestelmää kohti (järjestelmien välinen harha estimoidaan paikan mukana) tai tunnettu lähetetty siirtymä vertailuaika-asteikolla; mittauskohtaiset sigmat kutsujan antamina, oletuksena moottorin viivelukitussilmukan lämpökohina (navsignal::dll_code_jitter_chips) korkeuskulman C/N0-arvolla yhdistettynä signaali avaruudessa -etäisyysvirheeseen; painottamaton DOP (GDOP, PDOP, HDOP, VDOP, TDOP) paikallisessa geodeettisessa koordinaatistossa, muodolliset itä–pohjoinen–ylös-sigmat ja harhasigmat; lajin <c1/> yhteinen tila vertaa vain GNSS:n, vain LEO:n ja yhdistettyjä ratkaisuja ja pyyhkäisee DOP:n lisättyjen LEO-satelliittien lukumäärää vastaan

seg-ee9a4a0cb530 = Tarkan pistepaikannuksen (PPP) konvergenssi pelkällä GNSS:llä ja LEO-täydennyksellä

seg-a54f36c27d90 = Float-PPP-laajennettu Kalman-suodatin ionosfäärivapaalla koodilla ja vaiheella: staattiset koordinaatit, valkoinen vastaanottimen kello, yksi järjestelmien välinen harha jokaista lisäjärjestelmää kohti, satunnaiskävelyn zeniitin märkäviive kuvattuna kertoimella 1/sin(korkeuskulma), float-kokonaislukuepävarmuus jokaiselle satelliittikaarelle lisättynä nousussa ja pudotettuna laskussa sekä satelliitin koodille ja vaiheelle yhteinen tarkan radan ja kellon virhe, käsiteltynä yhtenä korreloituna kaksirivisenä päivityksenä Joseph-vakautetussa muodossa; mittaukset simuloidaan samasta mallista; konvergenssiaika (virheet kynnysarvojen alla ajon loppuun asti), virhekäyrät ja ajon keskiarvoistettu paikan NEES pelkälle GNSS:lle ja kullekin LEO-tapaukselle, ajettuna lajina <c1/>

seg-be4593802ccf = NEES:n khiin neliö -testi on sisäinen johdonmukaisuustarkistus (totuus ja suodatin jakavat mallin). Suuntausta verrataan julkaisuun Li ym., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: usean GNSS:n { "9.6" } min lyheni arvoihin { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min, kun LEO-satelliitteja on { "60" }, { "96" }, { "192" } ja { "288" }. Mukana toimitettu skenaario antaa { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min omilla edustavilla { "1000" } km:n, { "60" } asteen kuorillaan, kohinallaan ja asemillaan; artikkelin tähdistöjä, kohinaa ja konvergenssimääritelmää ei toisteta, joten tämä on suuntauksen MODELLED-johdonmukaisuus (yksitoikkoinen lyheneminen, suurin tähdistö alle kolmanneksessa pelkän GNSS:n ajasta), ei validointi

seg-8ef013b46d0f = 5G-ei-maanpäällisen verkon (NTN) paikannustarkkuus signaalin kaistanleveydestä

seg-12b1e4657370 = Cramér–Rao-raja saapumisajalle neliöllisen keskiarvon (Gabor) kaistanleveydestä, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), tasaiselle OFDM-spektrille (beta = B/sqrt({ "12" })), kaistarajoitetulle BPSK-spektrille (suljetun muodon osoittaja) tai mille tahansa spektrille kvadratuurilla, sekä kompleksisen sävelen taajuudelle, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); alalinkin saapumisaikaan perustuvat ratkaisut tuntemattomalla vastaanottimen kellolla ja yhden satelliitin Doppler-ratkaisu ylilennon aikana 3GPP:n n256 MSS S -kaistalla, ajettuna lajina <c1/>

seg-9306f1c06081 = LEO-avusteinen ajansiirto UTC-aikaan suhteessa C/N0:hon ja vastaanottimen oskillaattoriin

seg-c618feb01476 = Kellomittaukset jokaiselta näkyvissä olevalta LEO-satelliitilta tunnetussa paikassa, yhdistettynä käänteisvarianssilla pseudoetäisyyden kohinamallista, suodatettuna kaksitilaisella (vaihe, taajuus) Kalman-suodattimella, jonka prosessikohina on oskillaattoriluokan valkoinen ja satunnaiskävelytaajuuskohina (slot_timing::ClockNoise, clock_state::ClockClass; holdover::coast_phase_variance-funktion vapaaliikevarianssi), samoista tasoista siemenluvulla tuotettu todellinen kello ja IS-GPS-200:n kohdan { "20.3.3.5.2.4" } järjestelmäaika–UTC-lauseke, johon lähetetyn siirtymän epävarmuus lisätään ajokohtaisena harhana; lajin <c1/> ajoitustila pyyhkäisee oskillaattoreita ja C/N0-siirtymiä

seg-4a878bd4a90f = Sisäinen johdonmukaisuus: julkaistu siirtymälauseke laskettuna käsin, normalisoitu virhe { "40" } siemenluvulla ja siirtymän epävarmuuden asettama lattia. NIST:n luku Iridium-ajoitusvastaanottimille pienoisatomikellolla (alle { "40" } ns UTC(NIST):stä { "40" } päivän aikana) on vain vertailu; mukana toimitettu Iridium-skenaario antaa { "10" } – { "11" } ns RMS nimellisteholla edustavalla { "5" } m:n etäisyysvirheellään. Flicker-taajuuskohinaa ja ionosfäärin viivettä ei simuloida

seg-cef79d82f0d4 = LEO-peitto ja tarkkuuden heikkenemiskerroin napa- ja arktisille käyttäjille MEO-GNSS:ään verrattuna

seg-462a5e95d480 = Näkyvissä olevat satelliitit ja mediaani-PDOP, -HDOP ja -VDOP saatavuuksineen leveysasteen funktiona, otoksina valituilla pituuksilla ja epookeilla, pelkille MEO-GNSS-järjestelmille, pelkille LEO-järjestelmille ja kaikille yhdessä, kullekin järjestelmälle oma maski ja kellomalli, ajettuna lajin <c1/> napatilana; radat ovat SGP4/SDP4-elementtijoukkoja pyyhkäisyn epookilla (2026-01-01T00:{ "00" }:{ "00" } UTC napatilassa) vietynä Maahan kiinnitettyyn koordinaatistoon validoitua Maa-radan polkua pitkin (IAU 2006/2000A, UT1 = UTC, ei napaliikettä)

seg-d92777401093 = Nimetyt LEO-PNT-järjestelmät valinnaisina dataesiasetuksina, kullekin lähde

seg-5130bfe2410c = Järjestelmäriippumattomat syötteet: jokainen järjestelmä on Walker-kuoria, eksplisiittisiä elementtejä tai GNSS-esiasetus, signaali (kantoaalto, chip-nopeus, kaistanleveys, vastaanotettu teho tai C/N0-alue), SISRE, Doppler-sigma ja kellomalli; esiasetukset täyttävät vain sen, minkä skenaario jättää pois, yksi tiedosto kutakin, lähteet merkittynä PUBLIC (URL-osoitteella), WORKSHOP tai JOHDETTU ja julkaisemattomat arvot lueteltuna edustavina: Xona Pulsar X1/X5, Iridium STL, Starlink-opportunistiset signaalit, CentiSpace, edustava C-kaistajärjestelmä, ATOMIC-nollakellon efemeridimalli ja yksi työpajassa johdettu esiasetus valinnaisessa Celeste IOD -esiasetustiedostossa, joka poistetaan käytöstä poistamalla tuo tiedosto ja sen skenaariot

seg-c6f71b3937cd = Siteerattujen julkisten arvojen transkriptio, tarkistettu rakenteen osalta (jokaisella julkisella lähteellä on URL-osoite, Walker-kuviot jakautuvat tasan, C/N0 vastaanotetusta tehosta kT:hen { "290" } K:n lämpötilassa), ei ulkoista oraakkelia vasten. Edustavat arvot on nimetty kussakin esiasetuksessa ja ovat havainnollistavia

seg-dec52b5b9cd6 = Yksi LEO-PNT-järjestelmä päästä päähän: signaalisuunnittelu, ylilennon linkkibudjetti, navigointiviesti ja yhdistetty paikannus, kunkin vaiheen tuloste annettuna seuraavalle

seg-39443b31d418 = Laji <c1/>: leo-signal-suunnittelu (julkinen esiasetus tai inline) asettaa leo-pass-kaistan keskitaajuuden, kaistanleveyden, chip-nopeuden ja EIRP-jaon; ylilento antaa seurattavan komponentin C/N0:n ja kaistarajoitetun koodijitterin epookeittain; pienimmän neliösumman C/N0-suora muuttujassa sin(korkeuskulma), leo-navmsg-viestin SISRE (sovitettuna ylilennon satelliitin radalle, plus ilmoitettu radanmääritystermi neliöiden summan neliöjuurena) sekä suunnittelun kantoaalto ja chip-nopeus siirtyvät jokaiselle leo-pvt-yhteisratkaisun LEO-järjestelmälle ja valinnaisesti leo-ppp:n LEO-tapauksille; jokainen luovutus raportoidaan arvona ja yksikkönä

seg-854d3c1428d0 = Luovutusten itseyhtenevyys: jokainen eteenpäin annettu arvo on yhtä suuri kuin edeltävän vaiheen oma tuloste, ja edeltävän syötteen muuttaminen siirtää jokaista siitä riippuvaa jälkimmäisen vaiheen lukua. Vaiheet säilyttävät omat merkintänsä; ketju ei lisää fysiikkaa eikä ulkoista oraakkelia

seg-55ca63edff02 = Harhautuksen havaitseminen LEO-Dopplerin ja ylilentogeometrian johdonmukaisuudella

seg-b12fc1728220 = Lajin <c1/> osio <c2/>: harhauttaja väärentää etäisyyden ja etäisyysnopeuden suhteen itsejohdonmukaisesti väitetyssä paikassa nähdyt signaalit, ja paikka hyppää ja/tai työntyy pois todellisesta alkamisen jälkeen (LEO-kaistaa kohti ja MEO-GNSS-signaalille); vastaanotin ennustaa jokaisen etäisyysnopeuden lähetetyltä radalta ja riippumattomasta ennakkopaikasta ja -nopeudesta ja testaa mitatut etäisyysnopeudet yleistetyn pienimmän neliösumman khiin neliö -tunnusluvulla epookkien ikkunan yli (kellon ajautuma haittaparametrina tai ennakkotiedolla), GNSS-kanavilla, LEO-kanavilla ja kaikilla kanavilla taajuuslukitussilmukan lämpökohinalla C/N0:sta (Kaplan & Hegarty { "2006" }, kohta { "5.6.2" }); havaitsemistodennäköisyys ei-sentraalisesta khiin neliö -jakaumasta ilmoitetulla väärän hälytyksen todennäköisyydellä, havaitseminen julistetaan ilmoitetulla havaitsematta jäämisen todennäköisyydellä

seg-787c07c08c7f = Suljetun muodon ratkaisut ja identiteetit, ei ulkoinen mittaus: etäisyysnopeuden gradientti keskeisdifferenssiä vasten, informaatiomuotoinen tunnusluku tiheää kovarianssimuotoa vasten, puhdas kellon ajautuma antaa nollan, ennakkotiedolla selitetty työntö antaa enintään |dx|^2/sigma_p^{ "2" }, tunnusluku on hypyn suhteen neliöllinen. Mitään havaitsemislukua ei verrata mitattuun hyökkäykseen; harhauttaja on idealisoitu (ei tehoa, saapumiskulmaa eikä korrelaatiopiikin tunnusta)

seg-5f341f85ac07 = Harhautuksen havaitseminen monikaistaisen LEO-signaalin kaistojen välisellä johdonmukaisuudella

seg-2f9c4d351b0f = Jokaiselle LEO-satelliitille ja etäisyydenmittauskaistojen parille osio <c1/> muodostaa geometriasta vapaan pseudoetäisyysyhdistelmän, poistaa vastaanottimen ionosfäärimallin ja testaa sen epookista toiseen tapahtuvaa askelta kahden kaistan koodikohinaa ja ilmoitettua siedettyä mallintamatonta ionosfäärinopeutta vasten (kaksipuolinen Gauss, tarkka havaitsemistodennäköisyys); harhauttaja, joka väärentää osan kaistoista mutta ei toisia, tai kaikki kaistat ilman ionosfääriä, havaitaan alkamishetkellä; sellaista, joka väärentää jokaisen kaistan ja simuloi ionosfäärin, ei havaita, minkä tulos ilmoittaa

seg-87fd44fa1d94 = Identiteetit: ionosfäärivapaan harhauttajan alkamisaskel on yhtä suuri kuin parin mallinnettu ionosfäärin viive-ero, kynnys on kaksipuolinen normaalikvantiili kertaa askeleen keskihajonta plus nopeuden raja. Vastaanottimen ionosfäärimalli on moottorin oma, joten aito jäännös on keskiarvossa nolla rakenteen vuoksi; ei ulkoista oraakkelia

seg-97dbcd5f2728 = Ionosfäärin luotaus: vino TEC LEO-ylilennon kaksikaistaisesta viiveestä

seg-844de34fd2f3 = Jokaiselle lajin <c1/> satelliitin kaistaparille raportti antaa vinon kokonaiselektronisisällön, jonka geometriasta vapaa koodiyhdistelmä palauttaa ylilennon huipulla, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), ja sen 1-sigman kahden kaistan lämpökoodikohinasta, jotta mitä tahansa monikaistaista LEO-PNT-suunnitelmaa voidaan punnita ionosfäärisondina

seg-0a63a69e181d = Kuun koordinaatiston datumin kovarianssi asemat estimoituna, 50 numeron laajennettua tarkkuutta vasten

seg-de2ee45f6527 = Kuun koordinaatiston kampanjaskenaarion seitsenparametrinen Helmert-datumin kovarianssi Maa-asemat estimoituna (asema { "1" } ankkuroituna), sellaisena kuin lunar_frame_campaign laskee sen binary64-tarkkuudella: viiveen Jacobin matriisista kertyvä asemien ja majakoiden yhteinen Fisherin informaatio, asemalohko marginalisoituna Schurin komplementilla Jacobin spektraalisen käänteismatriisin kautta, H = AᵀSA muodostettuna Helmertin suunnittelumatriisilla ja käännettynä spektraalisesti. Ongelma on rakenteeltaan huonosti ehdollistettu (Helmertin ehtoluku { "2.1e8" } – { "2.3e8" }, yhteisen informaation ehtoluku { "1.6e12" } – { "3.0e13" }): { "1e-9" } suhteellinen muutos Schurin korjauksessa siirtää datumin sigmoja jopa { "28" } %. Raportoidaan: seitsemän datum-sigmaa, Helmertin ehtoluku ja heikoin suunta. VÄITE, RAJATTUNA: moottorin datum-sigmat ja ehtoluku ovat taaksepäin vakaan kaksoistarkkuusputken a priori pahimman tapauksen virherajan sisällä tässä ongelmassa; tämä ei väitä niiden olevan niin tarkkoja kuin kaksoistarkkuus sallii (tekijöihinjakoreitti on samoilla syötteillä noin tuhat kertaa tarkempi ja valinnainen neliöjuuriratkaisija noin kymmenen miljoonaa kertaa), ja heikoin suunta validoidaan vain siellä, missä sen kynnys on alle suoran kulman (asemat kiinnitetty -kontrolli)

seg-71b463388e80 = Neliöjuuri-informaatiodatumratkaisija 50 numeron laajennettua tarkkuutta vasten

seg-5ec3e3c2bf19 = Valinnainen neliöjuuri-informaatioratkaisija (lunar-frame-campaign solver = "srif"; oletus muuttumaton), joka ei koskaan muodosta eikä käännä informaatiomatriisia datumille: valkaistun viiveen Jacobin matriisin Householder-QR (ortogonaali-kolmiohajotelma) neliöjuuri-informaatiosuodattimen mittauspäivityksenä, Maa-asemat marginalisoituna perässä olevan kolmiolohkon kautta (jonka Gram-tulo on Schurin komplementti), toinen QR matriisille R_bb A seitsenparametriselle Helmert-datumille, sigmat kolmiomatriisin käänteismatriisin rivinormeina ja spektri (ehtoluku, heikoin suunta) yksipuolisesta Jacobin singulaariarvohajotelmasta. Sisätulot kompensoidaan Dekker-jaetulla virheettömällä tulolla, joten jokainen operaatio on oikein pyöristetty IEEE-754-peruslaskutoimitus tai neliöjuuri; identtiset tulokset kaikilla alustoilla perustellaan tästä, niitä ei testata alustojen välillä

seg-433b52bf0ba2 = Merenkulun luottamusvalvonnat: aritmetiikka, jolle ne perustuvat (NMEA-dekoodaus, geodeettiset siirtymät, kinemaattiset tunnusluvut ja anturijäännösten tunnusluvut)

seg-c61c575f9c38 = Aluksella <c1/> dekoodaa NMEA { "0183" } -lauseet, joita vastaanotin ja sen instrumentit lähettävät (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), muodostaa paikannusten välisen itä–pohjoinen-siirtymän (<c2/>) ja näistä tunnusluvut, joihin sen valvonnat perustavat päätöksensä: implikoitu nopeus, dead reckoning -jäännös, implikoitu kiihtyvyys ja implikoitu kääntymisnopeus { "30" } s:n ikkunoissa, suunnan ja kulkusuunnan, nopeusmittarin ja maanopeuden sekä antennin korkeuden jäännökset ({ "10" } s:n mediaanit) sekä satelliittisignaalin signaalikohinasuhteen hajonta ja nousu.

seg-32fcf6956dac = MITÄ ULKOISESTI TARKISTETAAN, suppeasti sanottuna: ({ "1" }) jokaisen kentän dekoodaus, jonka valvonnat lukevat, pynmea2-kirjastoa { "1.19.0" } (MIT) vastaan { "8" } synteettisellä lokilla ({ "1,086" } epookkia), kentän yksikössä tarkkuudella { "1e-9" } (leveys- ja pituusaste, korkeus, geoidin erotus, HDOP, nopeudet, kulkusuunta, suunta, signaalikohinasuhde; kokonaisluvut ja päivämäärät tarkasti; vuorokaudenaika tarkkuudella { "1e-6" } s), suurimmat erot doublen viimeisen numeron tasolla; ({ "2" }) kahden paikannuksen välinen itä–pohjoinen-siirtymä etäisyytenä ja suuntakulmana geographiclib-kirjaston { "2.1" } (MIT) WGS84-geodeettista viivaa vastaan { "223" } paikannusparilla, joiden lähtöviivat ovat enintään { "2" } km, leveysasteilla -45 – { "70" } astetta ja antimeridiaanin yli, tarkkuudella { "0.01" } m ja { "0.001" } astetta (suuntakulma verrattuna geodeettisen viivan keskiazimuttiin, jänteen suuntaan); ({ "3" }) valvontojen syötetunnusluvut { "341" } pisteytetyllä epookilla { "400" } s:n synteettisellä matkalla, jossa on käännös ja paikka-askel, Python-uudelleenlaskentoja vastaan, jotka käyttävät geographiclibiä etäisyydelle ja azimutille, pynmea2:ta dekoodaukseen ja numpya mediaaneille ja keskihajonnoille: implikoitu nopeus tarkkuudella { "0.005" } m/s, dead reckoning -jäännös { "0.02" } m, kiihtyvyys { "5e-4" } m/s^{ "2" }, kääntymisnopeus { "1e-3" } deg/s, jäännösmediaanit sekä signaalikohinasuhteen hajonta ja nousu { "1e-6" }. MITÄ EI: valvontojen ikkunapituudet, sallitut poikkeamat ja kynnykset ovat tämän projektin omia sääntöjä; Python toistaa ne samasta dokumentaatiosta, joten yhtäpitävyys tukee aritmetiikan toteutusta, ei sääntöjä. THS-lauseella ei ole pynmea2-luokkaa eikä ROT-lausetta lueta; kumpikaan ei ole katettu. Taulukko NMEA-lähettäjästä ja satelliittinumerosta RINEX-tyyliseen satelliittitunnukseen on tämän projektin oma (vain numero, lähettäjä ja arvo verrataan). Aika-askeleen, isäntäkellon ja todennustilan syötteillä ei ole oraakkelia. Kaikki data on synteettistä tekstiä, jonka tuottaa receiver_trust::synth; mikään tässä ei ole mittaus eikä mitään väitetä siitä, miten mikään valvonta toimii todellisessa häiriössä. Suuntakulma: verrattu geodeettisen viivan keskiazimuttiin. Ennakkorekisteröity vertailu paikannuksen { "1" } etuazimuttiin epäonnistui tarkkuudella { "0.001" } astetta ({ "77" } paritapausta { "223" }:sta, pahin { "8.3e-3" } astetta) määritelmäeron eikä aritmetiikan vuoksi; muutos tehtiin ensimmäisen ajon jälkeen ja molemmat tulokset on kirjattu (etuazimuttivertailu pysyy testissä kuvailevana, ei ennakkorekisteröitynä rajana { "0.01" } astetta). Ilmoitettu: ensimmäiset ajot paljastivat, että syötteet kuormittivat liian vähän (kiihtyvyys ja kääntymisnopeus rajattiin nollaan joka epookilla, eikä antimeridiaanin raita koskaan ylittänyt sitä), virheen synteettisessä generaattorissa (ei pituuden kiertoa) ja suuntakulman osalta sen, että rekisteröity oraakkelisuure (geodeettisen viivan etuazimutti ensimmäisessä paikannuksessa) poikkeaa jänteen suunnasta noin puolella meridiaanikonvergenssista ({ "77" } paritapausta { "223" }:sta rajan { "0.001" } astetta ulkopuolella, pahin { "8.3e-3" }); syötteet korjattiin ja suuntakulma verrattiin keskiazimuttiin samalla toleranssilla (muutokset { "1" } – { "3" } ennakkorekisteröinnissä, tehty tulosten näkemisen jälkeen eikä siis sokkona); kulkusuunta- ja suuntavertailut tehtiin ympyrämäisiksi ({ "360" } ja { "0" } astetta ovat yksi kulkusuunta, muutos { "5" }). Mutaatio: itäsiirtymän { "1e-4" }-skaalaus epäonnistuu geodesiavertailussa.

seg-1fdbb476c8ab = Merenkulun luottamuspistemäärä: valvontojen todisteiden kokoaminen 0–100 pistemääräksi ja sen kolmeksi vyöhykkeeksi

seg-0d76b33144f1 = Jokainen valvonta tiivistää todisteensa tunnusluvun ja kynnyksen suhteeksi; pistemäärä on { "100" } miinus valvontojen yli laskettu painon ja suhteen rajatun lineaarisen rampin tulo ({ "0" } arvoon { "0.5" } asti, { "1" } kohdassa { "1.5" }) summattuna, rajattuna välille { "0" } – { "100" } ja pyöristettynä tarkkuuteen { "0.1" }, vyöhykerajoina { "90" } ja { "55" }; jokainen epookki luettelee valvonnat, jotka vähensivät pisteitä, ja niiden pisteet.

seg-b2d3c6d6ac36 = Toteutus määrittelyä vasten, EI ulkoinen oraakkeli: puhtaalta pöydältä tehty Python-uudelleentoteutus (scripts/maritime_score_cleanroom.py), jonka kirjoitti lukija, jolle annettiin vain docs/RECEIVER-TRUST.md ja docs/MARITIME-TRUST.md eikä Rust-lähdekoodia, on samaa mieltä score_from_ratios-funktion kanssa { "600" } suhdevektorilla (pistemäärä, vyöhyke, pisteet ja vähennysten järjestys, ero { "0" }), kun dokumentaatio oli täydennetty niiltä osin, joissa ensimmäinen lukija havaitsi sen vaikenevan tai olevan epäjohdonmukainen (tasapelien järjestys, pyöristys, hyväksytty-tai-hylätty-valvonnan suhde, kaksi esimerkkiä, joiden luvut eivät vastanneet kaavaa). Se osoittaa, että dokumentaatio riittää ja koodi tekee sen, mitä sanoo. MITÄ EI TARKISTETA, ja miksi rivi pysyy MODELLED: sääntö itse (painot, ramppi, vyöhykerajat, todisteen pito) on tämän projektin oma, ennakkorekisteröity mutta ilman ulkoista lähdettä, eikä mikään tässä osoita, että pistemäärä { "80" } tai { "40" } tarkoittaa sitä, mitä navigoija haluaisi sen tarkoittavan todellisessa häiriössä; sellaista lukua ei anneta. Valvontojen kynnykset ovat samoin tämän projektin omia (rivi A tarkistaa vain niiden aritmetiikan).

seg-f52fceaf06ca = NMEA { "0183" } -harjoitusvirran vaatimustenmukaisuus ja dekoodatut arvot

seg-684f86418933 = Synteettiset komentosillan NMEA { "0183" } -virrat miehistön harjoitteluun (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW ja PKSHT-merkki, tuotettuna todellisesta kulkuraidasta mallinnetuin vastaanotin-, taivas-, häirintä- ja harhautusvaikutuksin. Vain tekstitulostetta; mitään ei lähetetä.

seg-4591ed75149c = MITÄ ULKOISESTI TARKISTETAAN, suppeasti sanottuna: kaikki { "225,227" } kahdeksan synteettisen harjoitusvirran lausetta (neljä kirjastoskenaariota, siemenluvut { "1" } ja { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW ja PKSHT-merkki) jäsentyvät pynmea2:ssa { "1.19.0" }, riippumattomassa NMEA-jäsentäjässä, kelvollisella tarkistussummalla sekä odotetulla lähettäjällä ja tyypillä. Paikka, maanopeus, maakulkusuunta, suunta, UTC-aika ja -päivämäärä, paikannustila ja GGA:n satelliittimäärä, jotka se dekoodaa, ovat yhtä suuria kuin generaattorin todellinen kulkuraita ennen ensimmäistä vertailua kiinnitettyjen toleranssien sisällä ({ "1.5e-6" } deg, { "0.06" } kn, { "0.07" } km/h, { "0.11" } deg kulkusuunta, { "0.5" } deg suunta, { "0.02" } s), ajettuna skriptillä scripts/gen_nmea_training_ref.py vertailuaineistolla kansiossa tests/fixtures/nmea_training_ref/. GGA:n satelliittimääräodotus korjattiin ensimmäisen ajon jälkeen NMEA-käytännön mukaiseksi ({ "00" } ilman paikannusta); numeeriset toleranssit pysyivät ennakkorekisteröinnin commitin mukaisina. MITÄ EI: että mikään vastaanotin, karttaplotteri tai komentosillan järjestelmä hyväksyy virrat; vastaanotin-, taivas-, häirintä- tai harhautusmallien realistisuus (nimellistaivas, mallinnettu kohina, vetämis- ja toistoprofiilit, kaikki MODELLED); HDOP, korkeus sekä DOP- ja GSA/GSV-sisältö syntaksia ja lukumääriä pidemmälle; ohjaajan loki. Mitään ei lähetetä, eikä häirinnänsietoa tai harhautuksensietoa väitetä.

seg-1be1cfcb95c8 = Häiriökartta: tarkkuuskoodien merkitykset, AIS:n ei-saatavilla-arvot, ruutusolun osoitus, reitin pituus solun tilaa kohti ja sisämaan peittäminen

seg-71cff2a675e8 = Kartan käyttämien ADS-B:n navigoinnin tarkkuus- ja eheyskoodien tulkinta (NACp-koodia vastaava EPU-raja, NIC-koodia vastaava rajoitussäteen raja sekä menetelmän niistä johtamat matala ja hyvä luokka); AIS:n paikan ja nopeuden ei-saatavilla-arvot, jotka AIS-lukija hylkää; kiinteä leveys- ja pituusasteen ruutusolu, johon paikka osuu; reitin pituus ja sen jako solun tilan mukaan (degraded, not degraded, unassessed, not observed), jonka reittialtistus raportoi; sekä se, onko paikka maapolygonin sisämaan puolella enemmän kuin puskurin verran. Solu, joka on merkitty degraded tai anomalous, on lausuma ilmoitetuista tarkkuuskentistä tai epäuskottavista paikoista, ei havainto häiriöstä, eikä mikään tässä tarkista sitä.

seg-beee15333c89 = MITÄ ULKOISESTI TARKISTETAAN, suppeasti sanottuna: viisi riippumatonta toteutusta lukee samat synteettiset syötteet. ({ "1" }) pyModeS { "2.21" } dekoodaa synteettiset DF17-käyttötilan ja ilmassa olevan paikan kehykset; Kshanan NACp:n EPU-rajat ovat samaa mieltä tarkkuudella { "0.5" } m (suurin ero { "0.4" } m), sen NIC:n rajoitusrajat koodeille { "5" } – { "11" } tarkkuudella { "1" } m, ja sen matala ja hyvä luokka asettavat kaikki { "12" } NACp-koodia ja jokaisen oraakkelin tuottaman NIC-koodin ({ "0" } – { "11" }) samalle puolelle kynnyksistä, jotka oraakkelin rajat implikoivat ({ "0" } erimielisyyttä). ({ "2" }) pyais { "3.3.0" } dekoodaa AIVDM-tyypin { "1" } lauseet, joiden hyötykuorman bitit skripti pakkaa raaoista ITU-R M.1371 -kenttäarvoista; Kshana hylkää täsmälleen dekoodatut ei-saatavilla-paikat (leveysaste { "91" }, pituusaste { "181" }) ja nopeuden ({ "102.3" } kn) ja pitää arvot { "0" } – { "102.2" } kn dekoodattuina ({ "0" } erimielisyyttä { "94" } kehyksellä). ({ "3" }) shapely { "2.2.0" } covers() solupolygoneilla on samaa mieltä funktion grid::Grid::cell_of kanssa { "1770" } pisteelle solukooilla { "0.5" }, { "0.25" }, { "1" } ja { "0.07" } astetta, mukaan lukien reunan lähellä olevat pisteet, molemmat navat ja antimeridiaani ({ "0" } erimielisyyttä). ({ "4" }) shapely { "2.2.0" } reitin ja solun leikkaus GeographicLib { "2.1" } WGS84-geodeettisilla pituuksilla on samaa mieltä reittialtistuksen kanssa { "8" } synteettisellä reitillä, joista kaksi ylittää antimeridiaanin: kokonaispituus tarkkuudella { "0.6" }% (suurin ero { "0.49" }%, pallo ellipsoidia vastaan) ja kunkin solun tilan pituus tarkkuudella { "0.6" }% plus { "125" } m kappaletta kohti (suurin { "21" }% tuosta toleranssista). ({ "5" }) shapely { "2.2.0" } contains() pyprojin atsimutaalisella ekvidistanttietäisyydellä rannikkoon on samaa mieltä { "2000" } m:n sisämaamaskin kanssa { "992" } hilakeskipisteellä neljän synteettisen saaren ympärillä, yksi järvellä ({ "0" } erimielisyyttä; { "4" } pistettä { "20" } m:n sisällä puskurista jätettiin pois ja laskettiin). Toleranssit kiinnitettiin tiedostossa tests/fixtures/interference_map_ref/PREREGISTRATION.md ennen mitään vertailua, eikä niitä muutettu jälkikäteen; kaksi ensimmäisen ajon löytämää virhettä synteettisissä syötteissä on kirjattu sinne. MITÄ EI: Kshana ei dekoodaa raakoja Mode S -kehyksiä eikä AIVDM-lauseita, joten tämä validoi sen jo dekoodattujen arvojen luennan, ei dekooderia. Oraakkelin NIC-rajoitussäteet koodeille { "1" }, { "2" } ja { "4" } poikkeavat DO-260B:stä ({ "20" }, { "8" } ja { "2" } NM), joten numeerisesti verrataan vain koodeja { "5" } – { "11" }. Paikkasääntö ({ "0" }, { "0" }), korkeusalaraja, lähdetyyppisuodatin, tunnisteiden tiivistäminen, menetelmän kynnykset ja tunnusluvut sekä solukoon valinta ovat Kshanan omia, eikä niitä tarkisteta mitään vasten. Reittivertailu käyttää samaa suoraa leveys- ja pituusasteen mukaista polun määritelmää molemmilla puolilla, joten se tarkistaa pituudet ja soluosoituksen, ei sitä, että tämä polku on oikea alukselle tai ilma-alukselle. Mikään tässä ei osoita, että merkitty solu on häiriötä. Syötteet ovat synteettisiä; oraakkelivertailuaineistot kirjoittaa skripti scripts/gen_interference_map_ref.py (pyModeS on GPL-3.0 ja sitä käytetään vain siinä offline-skriptissä; CI ei tarvitse Pythonia).

seg-57ace69bdf1a = Luottamustelemetrian siirtomuodot: Prometheus-tekstialtistus ja OpenTelemetry OTLP/HTTP JSON

seg-654126a9d073 = GNSS-luottamus (pistemäärä, vyöhyke, syyt, portti ja pyynnöstä paikka) Prometheus-tekstialtistuksena osoitteessa /metrics ja OTLP/HTTP JSON -mittareina, syy-nimikkeiden kardinaliteetti rajattuna.

seg-b037c999443b = Luottamustelemetrian SIEM-tapahtumat: Common Event Format (CEF) syslogin yli

seg-ffd8d7062055 = Vyöhykemuutos- (tai epookkikohtaiset) tapahtumat Common Event Format -hyötykuormina RFC { "5424" } -kuoressa UDP:n tai TCP:n yli, dokumentoidulla kenttäkartoituksella ja CEF-escapauksella.

seg-51640405c9b7 = Luottamustelemetrian SIEM-tapahtumat: Log Event Extended Format (LEEF) syslogin yli

seg-1b3245506847 = Vyöhykemuutos- (tai epookkikohtaiset) tapahtumat Log Event Extended Format { "2.0" } -hyötykuormina RFC { "5424" } -kuoressa UDP:n tai TCP:n yli, dokumentoidulla kenttäkartoituksella.

seg-563ccb0adbe5 = MITÄ TARKISTETAAN: tämän crate-kirjaston omat täsmällisen merkkijonon testit dokumentoidulle LEEF-kenttäkartoitukselle sekä RFC { "5424" } -kuoren kentät; ylläpidettyä avoimen lähdekoodin LEEF-jäsentäjää ei ole (Python-pakettihakemiston haku ei löytänyt yhtään), joten muoto tarkistetaan omaa määrittelyään vasten, jonka sama tekijä luki, ei ulkoista oraakkelia vasten. MITÄ EI: hyväksyykö jokin toimittajan jäsentäjä tai SIEM LEEF-hyötykuormat; dokumentoitujen sääntöjen ulkopuoliset escapaussäännöt; todellisen syslog-keräimen käyttäytyminen.

seg-96a95b89faa5 = Todistepaketin eheys: allekirjoitus, tiivisteketju ja varmennusmenettely

seg-943a853d8a4a = Allekirjoitettu, tiivisteketjutettu todistepaketti GNSS-luottamustapahtumasta: SHA-256 jokaisen tiedoston yli ja ketju manifestin yli, Ed25519-allekirjoitus manifestin täsmällisten tavujen yli sekä varmentaja, joka nimeää jokaisen virheen (muuttunut, poistettu, uudelleennimetty, vaihdettu tai lisätty tiedosto, uudelleenjärjestetty tai muokattu manifesti, ilman avainta uudelleentiivistetty manifesti, uudelleenallekirjoitettu paketti, väärä kiinnitetty avain sekä aikaleimatunniste, joka on poistettu, korvattu, roskaa tai toisen asiakirjan päällä).

seg-c15736afcbc9 = RFC { "3161" } -aikaleimatunnisteen allekirjoituksen ja ketjun varmennus

seg-cd64bbf39459 = evidence::tsa::verify_token ja valinnainen <c1/> paketin tiedostolle timestamp.tsr: RFC { "3161" } TimeStampResp tai paljas TimeStampToken (CMS SignedData TSTInfon yli) tarkistettuna offline-tilassa luotettuja ankkureita vasten samoin kuin <c2/> sen tarkistaa: allekirjoitettujen attribuuttien sisältötyyppi ja sanomatiiviste TSTInfon yli; allekirjoitus allekirjoitettujen attribuuttien yli (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 ja P-384; RSA:n julkiset operaatiot crypto-bigintillä); ESS signing-certificate v1 (SHA-1) tai v2 -tiiviste, joka nimeää allekirjoittajan varmenteen, löydettynä tunnisteen ja kutsujan epäluotettujen varmenteiden joukosta; allekirjoittajan kriittinen, ainoa timeStamping-laajennettu avainkäyttö; ketju luotettuun itse myönnettyyn ankkuriin kunkin varmenteen allekirjoituksen, CA-tilan ja avainkäytön kanssa, ja jokainen varmenne voimassa tunnisteen genTime-hetkellä; sekä sanomatiiviste dataa vasten. Ei tarkisteta: peruutus (CRL, OCSP), nimi- ja käytäntörajoitteet, nonce

seg-c04042b0270a = JammerTest { "2024" } -aineistolla kalibroidut vastaanottimen luottamuksen häiriökynnykset

seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: C/N0-pudotuksen, AGC:n ja häirintäindikaattorin valvontojen ennakkorekisteröity kalibrointi julkisella JammerTest { "2024" } -aineistolla (Zenodo { "15911589" }, GPL-3.0-or-later, haettu ajon aikana, ei koskaan mukana): kansiota kohti { "1" } s:n aikajana tiedostoista mon_rf.csv ja rinex.csv, valvonnat ajetaan kerran, jokainen kalibroinnin jälkeinen epookki merkitään puhtaaksi tai häirityksi kansion attack_log-tiedoston perusteella (siirretty CEST:stä UTC:hen, { "60" } s:n suoja), jokainen kynnys pyyhkäistään kiinteällä hilalla, valitaan pienin kynnys, jolla yhdistetty puhtaan väärän hälytyksen todennäköisyys on enintään { "0.01" }, ja jätä yksi kansio pois -pidätetyt lukumäärät; UBX-lukijan ristiintarkistus. Valinta toimitetaan vain valinnaisena profiilina [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); oletussääntö ja jokainen tuloste ilman sitä ovat muuttumattomia

seg-65a8361b4a22 = Jammertest-pisteytys: vastaanottimen loki pisteytetään jokaista ajoitettua testiä kohden (havaitsemisviive, havaitsematta jääneet hälytykset, väärät hälytykset, palautumisaika) julkaistua testisuunnitelmaa vastaan

seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA:n testiluettelo ja lähetyssuunnitelma (MIT, haettu kiinnitetyllä SHA-256-tiivisteellä, ei koskaan mukaan kopioituna) luetaan ajoitettuna totuutena luettelotunnukset säilyttäen; receiver-trust-ajo pisteytetään testeittäin (ensimmäinen hälytys miinus suunniteltu alku, havaittu/myöhäinen/ohi mennyt toleranssia vasten, aika ensimmäiseen hälytyksettömään jaksoon, hälytykset jokaisen ajanjakson ja sen suojavälin ulkopuolella), ja allekirjoitettu todistepaketti kuljettaa tuloskortin. Aikataulu koostuu suunnitelluista ajanjaksoista, ei tallennetuista lähetysajoista

seg-0d227bbcb5f1 = Testipenkin vienti (kshana bench-export): Maahan kiinnitetyt, geodeettiset ja paikallisen nopeuden sarakkeet, asentosarakkeet ja NMEA { "0183" } -tuloste

seg-c6a6e08afadd = Liike-CSV:n Maahan kiinnitetyn koordinaatiston paikka, geodeettinen paikka, Maahan kiinnitetyn koordinaatiston nopeus, suunta/nousu/kallistus ja UTC-sarakkeet sekä NMEA GGA/RMC -sanomat, kirjoitettuna synteettisistä skenaarioista (gnss-ins mukaan lukien automotive-urban-canyon, jamming, gnss-sim). Vain liike ja tapahtumat; signaalia ei kirjoiteta, eikä mitään simulaattorin tai vastaanottimen suorituskykyä väitetä.

seg-f953ad11fe08 = MITÄ TARKISTETAAN ULKOISESTI, suppeasti ilmaistuna: pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } ja scipy { "1.18.1" } vasten, ajettuna skriptillä scripts/gen_testbench_ref.py { "4" } synteettisellä skenaariolla, toleranssit kiinnitettynä ennen ensimmäistä vertailua (kukin kirjoittajan pyöristyksen pahin tapaus): Maahan kiinnitetyt sarakkeet vastaavat geodeettisten sarakkeiden WGS { "84" } -muunnosta (pahin { "1.3e-4" } m, kynnys { "3e-4" }) ja käänteismuunnosta ({ "1.3e-9" } astetta, kynnys { "2e-9" }; korkeus { "1.3e-4" } m, kynnys { "3e-4" }) jokaisella rivillä; PROJ:n toposentrisellä operaatiolla pohjois-itä-alas-muotoon kierretty Maahan kiinnitetty nopeus vastaa moottorin todellista NED-nopeutta ({ "7.5e-5" } m/s, kynnys { "2e-4" }); suunta, nousu ja kallistus vastaavat scipyn yaw-pitch-roll-arvoja moottorin todellisesta kvaternionista ({ "5.0e-7" } astetta, kynnys { "1e-6" }); jokainen NMEA-sanoma jäsentyy pynmea2:ssa kelvollisella tarkistussummalla, ja sen dekoodattu paikka ({ "1.2e-3" } m, kynnys { "5e-3" }), korkeus, nopeus, kulkusuunta ({ "5.0e-4" } astetta, kynnys { "1e-3" }) ja aika vastaavat liikearvoja; UTC-sarake vastaa riippumatonta päivämäärän ja ajan laskentaa. Tarkistettujen CSV- ja NMEA-tavujen tarkka SHA-256 on kiinnitetty. MITÄ EI TARKISTETA: skenaarion todellista rataa itsessään (ajoprofiili ja sen integrointi); konventioita (suunta on rungon kääntökulma, ei kulkusuunta, ja se poikkeaa siitä enintään noin { "77" } astetta skenaariossa automotive-urban-canyon; GGA:n laatukenttä, satelliittien lukumäärä ja HDOP ovat paikkamerkkejä); lukeeko mikään laboratoriosimulaattori tiedostot tarkoitetulla tavalla; mitään simulaattorin tai vastaanottimen suorituskykyä. Oraakkelit tarkistavat muunnokset ja koodaukset, eivät skenaarion fysiikkaa. Paikallisen koordinaatiston käsittely tarkistetaan vain nopeuden kierron sekä NMEA-nopeuden ja -kulkusuunnan kautta (CSV:ssä ei ole paikallista paikkasaraketta).

seg-ee99388f7b15 = compliance (kshana compliance-report): kuvaus Kshanan tulosteista julkisten kehysten kohtiin pelkästään numeroin, täytettynä annetuista ajoista; tulos lasketaan jonkin ominaisuuden hyväksi vain, kun se sisältää kuvauksen nimeämän todisteen, tyhjä joukko ei todista mitään, ja sanamuoto on "tukee todisteita" (supports evidence for); raportti ei ole toteamus siitä, että jokin kehys täyttyisi, eikä kenenkään antama luokitus tai hyväksyntä.

seg-8659260fd38e = Viitteet tarkistettu skriptillä poimittua otsikkoindeksiä vasten, joka perustuu viitattuihin julkisiin asiakirjoihin, luettu 2026-10-10 (tests/compliance_references.rs). MITÄ TARKISTETAAN: { "49" } viitattua lauseketta, kohtaa, kappaletta tai otsikkoviitettä on olemassa viitatussa asiakirjassa, ja { "7" } viitattua URL-osoitetta aukesi merkittynä päivänä ({ "2" } toisen reitin kautta); negatiiviset verrokit epäonnistuvat. MITÄ EI TARKISTETA: että mikään parafraasi, kuvaus tai aukko on oikein; EN { "16803" } -standardin lausekkeet (maksullinen, vain luettelon teksti); myöhemmät versiot; indeksi ei ole riippumaton toteutus.

seg-98c360d82d56 = Merenkulun integraatiot: Signal K -liitännäinen, OpenCPN:n portin virta ja pisteytyspaneeli, viitekäännös

seg-7af9ce566646 = Luottamuspistemäärä, kaista, syyt, portin tila ja vastaanottimen ilmoittama paikka julkaistaan polussa navigation.gnss.kshana Signal K -palvelimessa varoitus-, hälytys- ja normaali-ilmoituksin (integrations/signalk); porttitettu NMEA-virta, jossa paikka on merkitty virheelliseksi luottamuksen romahtaessa ja jossa on yksi PKSHT-sanoma kierrosta kohden, jonka portti itse tai pieni välittäjä tarjoaa OpenCPN:lle TCP:n yli, sekä OpenCPN:n natiivi pisteytyspaneeli, joka lukee PKSHT-sanoman (integrations/opencpn); sekä systemd-yksiköt ja kontti, jotka ajavat porttia (deploy/reference-build). Kun nämä näyttävät tulosteen, siinä on ohjeellinen ilmoitus: Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-00a0f52f7458 = MITÄ TARKISTETAAN, suppeasti ilmaistuna: että nämä integraatiot toimivat sen oikean ohjelmiston kanssa, jota varten ne on kirjoitettu. TODISTEET on kirjattu tiedostoihin integrations/signalk/evidence/README.md (JSON-tiedostoineen) ja integrations/opencpn/evidence/README.md (kuvakaappauksineen ja lokeineen), kummankin mukana skripti, joka toistaa ne. ({ "1" }) Signal K: liitännäinen ladattiin kiinnitettyyn signalk-server { "2.33.0" } -npm-pakettiin yksityisessä, vain paluuosoitteeseen rajatussa verkon nimiavaruudessa, syötteenä synteettistä dataa. Palvelimen omat REST- ja WebSocket-rajapinnat näyttivät julkaistut polut, pisteytyksen metatiedot sekä ilmoituksen, joka eteni tilasta ei ilmoitusta tilaan varoitus, hälytys, normaali (pitoajan jälkeen) ja uudelleen varoitukseen, kun data lakkasi tulemasta. Kun liitännäinen ajoi todellisen kshanan palvelimen itsensä vastaanottamalla NMEA-datalla, ilmoitus eteni varoituksesta hälytykseen ja vastaanottimen ilmoittama paikka julkaistiin; palvelimen oman navigation.position-arvon kirjoitti sen NMEA-tarjoaja, ei koskaan liitännäinen. Ajettu uudelleen live-JSON-skeemaa { "1.2" } vasten. ({ "2" }) OpenCPN: liitännäinen käännettiin OpenCPN:n liitännäisrajapinnan otsikkoa ja wxWidgets { "3.2.4" } -kirjastoa vasten, ladattiin OpenCPN { "5.8.4" } -ohjelman Ubuntu { "24.04" } -pakettiin virtuaalinäytöllä; OpenCPN latasi sen, ajoi sen alustuksen ja välitti sille porttitetun virran PKSHT-sanomat, ja paneeli muuttui punaiseksi epäluotetulla kaistalla. Yhdessä puhtaassa ajossa OpenCPN:n oma aluksen paikka lakkasi päivittymästä ja sen paikkamerkki putosi, kun portti merkitsi paikan virheelliseksi. Toinen ajo, jota syötti suoraan portin TCP-kuuntelija, osoitti toimituksen liitännäiselle mutta ei puhdasta ennen ja jälkeen -vertailua. ({ "3" }) Välittäjätestit toistavat tallennetun otteen porttitetusta virrasta oikean TCP-pistokkeen kautta ja tarkistavat, mitä vastaanottaja saa (tavut muuttumattomina, kelvolliset tarkistussummat jokaisessa sanomassa uudelleenkirjoitetut mukaan lukien, GGA ja RMC yhtäpitävinä, yksi PKSHT kierrosta kohden portti-kenttineen siellä, missä paikka on virheellinen), ja päästä päähän -skripti tarkistaa, että portin kuuntelijan vastaanottaja saa täsmälleen ne tavut, jotka sama portti kirjoittaa vakiotulosteeseen. ({ "4" }) PKSHT-jäsentimet (JavaScript ja C++) ajetaan kshana-tulosteesta tallennettujen sanomien yli, ja ne hylkäävät väärän tarkistussumman, version tai pistemäärän, joka on alueen { "0" }–{ "100" } ulkopuolella. ({ "5" }) systemd-yksiköt tarkistetaan komennolla systemd-analyze verify (systemd { "255" }, binäärit korvattuina tynkillä) sekä suojilla, jotka koskevat shelliä kohdassa ExecStart, uudelleenkäynnistyskäytäntöä ja hiekkalaatikon avaimia; kontin sisääntulopisteen argumenttien käsittely tarkistetaan tynkäbinäärillä. MITÄ EI TARKISTETA: mitään näiden integraatioiden näyttämää arvoa varten ei ole ulkoista oraakkelia. Luottamusarvot itse ovat yllä olevat rivit, ja integraatioajo osoittaa vain, että putkisto kuljettaa ne; siksi tämä rivi on MODELLED eikä VALIDATED (docs/VALIDATION.md). Mitään todellista alusta, vastaanotinta, pitkää ajoa, kummankaan isäntäohjelman muuta versiota, muuta käyttöjärjestelmää tai työpöytää ei käytetty; kaikki data on synteettistä tekstiä, eikä mikään tässä ole mittaus. Ilmoituksen äänen ja visuaalisen käsittelyn todellisessa Signal K -asiakkaassa, OpenCPN:n työkalupalkin painiketta, asetuksia ja vanhentunutta tilaa sekä pakkaamista OpenCPN:n liitännäishallintaan ei kokeiltu. systemd:n hiekkalaatikon avaimet tarkistettiin vain syntaksin osalta, niitä ei ajettu elävässä systemd:ssä, eikä konttikuvan rakennuksesta ja sen terveystarkistuksesta ole tässä kirjattua todistetta. Mitään havaitsemis- tai väärän hälytyksen lukua ei väitetä. Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-475397d05dd0 = <s1>receiver_trust (live: portti, sen TCP-kuuntelija, PKSHT); crate-paketin ulkopuolella: integrations/signalk (JavaScript), integrations/opencpn (JavaScript-välittäjä, C++-natiiviliitännäinen), deploy/reference-build (systemd-yksiköt, kontti)</s1>

seg-89ab9ef155eb = BOC({ "1,1" })-seuranta: DLL-skaalaus ja bump-jump-ambiguiteetin ratkaisu (valinnainen)

seg-ef24be9b5917 = iq::track::LoopConfig-rakenteen boc-kenttä (valinnainen, oletuksena None): kolme DLL-diskriminaattoria skaalataan lukemaan koodivirhe chippeinä yksikkökaltevuudella sini-BOC({ "1,1" }) -pääpiikissä, ja bump-jump-monitori hyvin aikaisilla ja hyvin myöhäisillä korrelaattoreilla yhden alikantoaallon puolijakson ({ "0.5" } chippiä) etäisyydellä hyppäyttää koodin NCO:n kohti pääpiikkiä, kun ylös/alas-laskuri saavuttaa arvon N (oletuksena { "8" }). Ilman valintaa jokainen tuloste on ennallaan.

seg-2c32955cbfb3 = IQ:n ionosfäärin tuikekanava (Cornellin malli) mitattua { "50" } Hz:n GPS L1 -tuikintaa vasten

seg-2fdcb373ab25 = iq::channel::scint, Cornellin tuikintamalli (Rice-intensiteetti, toisen asteen Butterworth-spektri, vaihe arg z), jota ohjataan mitatun ikkunan S4-arvolla ja intensiteetin dekorrelaatioajalla, verrattuna siihen, mitä se tuottaa näiden kahden syötteen lisäksi; realdata::scint50 lukee mitatun lokin, poistaa siitä trendin ja ajaa vertailun.

seg-160507ac3702 = Solukeskiarvoistava CFAR-valinta IQ-signaalin haussa

seg-7c0a1adc9ae6 = iq::acq::ca_cfar ja ca_cfar_cells (valinnainen): hakuruudukon solua verrataan oman Doppler-rivinsä vertailusolujen keskiarvoon (suoja- ja askelviiveet, jaksolla ympäri kiertäen), kertoimella alpha, joka asetetaan suljetun muodon CA-CFAR-väärähälytystodennäköisyydestä M epäkoherentille lohkolle (ca_cfar_pfa, ca_cfar_alpha). Näytetehoilmaisin pysyy oletuksena, ja jokainen olemassa oleva tuloste on ennallaan.

seg-5bd3bf0c22a7 = Spektrimalli: GLONASS-, BeiDou- ja Galileo E6 -kaistat (valinnainen)

seg-9c16189c63ac = spectrum::default_band ratkaisee pelkän nimen perusteella (MORE_BAND_NAMES) GLONASSin L1OF:n ja L2OF:n jokaisella FDMA-kanavalla K = -7–{ "6" } (BPSK, { "0.511" } Mchip/s), BeiDoun B1I:n (BPSK({ "2" })), B1C:n (MBOC(6,1,1/11)), B2a:n ja B3I:n (BPSK({ "10" })) sekä Galileon E6:n (BPSK({ "5" })), niiden rajapintakuvausasiakirjojen kantoaalloilla ja vähimmäisvastaanottotehoilla; oletuskaistajoukko ja jokainen olemassa oleva tuloste ovat ennallaan.

seg-63b7da996265 = BeiDou B1I:n ensisijaiset etäisyydenmittauskoodit riippumatonta generaattoria vasten

seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits ja b1i: BDS-SIS-ICD-B1I-3.0:n Gold-koodit typistettyinä { "2046" } chippiin, PRN { "1" }–{ "63" }, sellaisina kuin IQ-kerros ne tuottaa, hakee ja seuraa.

seg-b4787b04338e = GPS L1C:n etäisyydenmittaus- ja peittokoodit IS-GPS-800J:n painettuja tarkistussarakkeita vasten

seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits ja l1c_o_bits: L1CP- ja L1CD-Weil-etäisyydenmittauskoodit (laskettu Legendre-jono, Weil-indeksi, ennen chippiä p lisätty laajennusjono) ja L1CO S1 -peittokoodit, PRN { "1" }–{ "63" }.

seg-5cba09089e09 = LunaNetin AFS-I- ja AFS-Q-ensisijaiset koodit LSIS-AFS V1.0:n painettuja tarkistussarakkeita vasten

seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits ja afs_q_primary_bits (signaalien nimet lunanet-afs-i ja lunanet-afs-q komennossa kshana iq): AFS-I-Gold-koodi ({ "2047" } lyhennettynä syklillä { "2046" }:een, G2 viivästetty PRN-koodin mukaan) ja AFS-Q-Weil-ensisijaiskoodi (laskettu Legendre-jono, Weil-indeksi, ennen chippiä p lisätty laajennusjono), PRN { "1" }–{ "210" }.

seg-7b1ae0c7ca28 = LunaNet AFS:n kolmannen tason koodit ja viestikerros (SB1 BCH, CRC-24Q, lomittaja) LSIS-AFS V1.0:aa vasten

seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: synkronointikuvio, SB1 BCH({ "51,8" }) -enkooderi ja 256 hypoteesin dekooderi, CRC-24Q, { "60" } x { "98" } -lohkolomittaja, symbolivirran tarkistin (kshana lunanet-afs-check) ja testivirran generaattori paikkamerkkialikehyksin. Alikehysten { "2" }–{ "4" } nopeuden 1/2 LDPC-koodausta ei ole toteutettu (sen matriisit ovat erillisessä liitteessä).

seg-0d7b17524c04 = Standardipaketit: skenaariot pisteytettynä ennen ajoa asetettuja kynnyksiä vasten

seg-6e5c04fd4531 = standards_pack (kshana standards-pack): DHS Resilient PNT -kehyksen testiprofiilit tasoille { "1" }–{ "4" }, IMO MSC.1/Circ.1575:n tarkkuustasot ja eheyden arviointi sekä ICAO Doc { "9849" } Appendix F:n monitoroi, arvioi ja lievennä -paketit: jokainen testi ajaa mukana toimitetun skenaariotyypin ja vertaa tuloskenttiä paketissa asetettuihin kynnyksiin, ja testit, jotka tarvitsevat vastaanottimen lokin, on merkitty NEEDS INPUT eikä niitä pisteytetä.

seg-d9ea966abdd6 = Ei ulkoista skenaariotuloksille: jokainen paketin testi ajaa MODELLED-skenaariotyypin. Kynnykset ovat paketin laatijan ilmoittama profiili (DHS-kehys ei ilmoita arvoja; IMO:n tarkkuusrajat ovat MSC.1/Circ.1575:n Taulukko C-1, luettu kokonaan; ICAO-paketti seuraa ICAO:n omaa RFI Mitigation Plan -esitystä, koska Doc { "9849" } on maksullinen julkaisu eikä sitä luettu), kirjattu ennen yhtäkään pisteytettyä ajoa xval-tyylisiin PREREGISTRATION.md-tiedostoihin hakemistossa standards/. MET-kynnys kertoo, että mallinnettu skenaario täytti ilmoitetun kynnyksen, ei mitään tuotteesta

seg-8a8f2c85e0c3 = Laboratorion kiertomatkan todistepaketti (skenaario, testiolosuhteet, vastaanottimen loki, pisteytys)

seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) ja komennon kshana bench-export vastaanottimen lokin vienti kshana.test-conditions/1: allekirjoitettu paketti, joka kirjaa skenaarion tiivisteen, ilmoitettujen olosuhteiden tiivisteen, lokin tiivisteen ja pisteytyksen ilmoitettuja tapahtumia vasten, ja joka hylkää olosuhteet, jotka ovat ristiriidassa pisteytyksen tapahtumien kanssa, sekä lokin, jonka tiiviste ei ole ilmoitettu. Signaalia ei kirjoiteta, toisteta eikä ajoiteta.

seg-76da58fe670a = Ei ulkoista: paketti linkittää tiivisteet ja MODELLED-vastaanotinlokin pisteytyksen, tarkistettuna synteettisellä datalla (mukana toimitetun skenaarion viety NMEA käsiteltynä vastaanottimen lokina). Mitään laboratorioajoa ei väitetä

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

seg-3de364392f92 = Ei mitään ulkoista: yhtään RTKLIB:n tuottamaa tiedostoa ei luettu, ja sarakerakenne on RTKLIB-käsikirjasta. Tarkistettu vain itse kirjoitetuilla tiedostoilla; ECEF-muunnos käyttää uudelleen funktiota frames::ecef_to_geodetic, jolla on omat rivinsä

seg-849393517c04 = NovAtel OEM7 ASCII- ja binäärilokit (BESTPOS, RANGE, RXSTATUS) receiver-trustille

seg-7e0021922025 = Lukee BESTPOSin (paikka), RANGEn (C/No signaalia kohti) ja RXSTATUSin (vastaanottimen häirintälippu epookin omana ilmoituksena) ASCII- ja binäärimuotoisista OEM7-lokeista, CRC-tarkistettuna, vain luku (receiver_trust::machines::novatel).

seg-1f7c6d1009a8 = Ei mitään ulkoista hyväksymiskynnyksenä. Kenttärakenteet ja CRC noudattavat julkista OEM7-dokumentaatiota (docs.novatel.com); CRC-rutiini tarkistettiin kerran dokumentaation omalle BESTPOSA-esimerkilleen ilmoittamaa CRC:tä vasten (siteerattu, ei lainattu). Vertailuaineistot on kirjoitettu itse; yhtään lokia todellisesta vastaanottimesta ei luettu

seg-a45c53a9deb3 = RTCM { "3" } MSM4- ja MSM7-kantoaalto–kohinasuhdelukija receiver-trustille

seg-0a0c9976236f = Lukee RTCM { "3" } MSM4- ja MSM7-viestien jokaisen signaalisolun C/N0:n (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) kehysvirrasta, CRC-24Q-tarkistettuna (receiver_trust::machines::rtcm3). Rakenteet BSD-lisensoiduista pyrtcm-taulukoista, ei RTCM-standardin tekstistä.

seg-2af6fc1abe98 = ReferenceImpl kertaluonteisessa tarkistuksessa, ei testi testijoukossa: pyrtcm { "1.2.0" }:n dekooderi lukee samat itse kirjoitetut kehykset samaan C/N0:hon ja epookkiaikaan. Se jakaa taulukoidensa lähteen tämän lukijan kanssa, joten se tarkistaa bittikäsittelyn, ei rakennetta. Yhtään tallennetta todellisesta vastaanottimesta tai tukiasemasta ei luettu

seg-cd554a7c1649 = GNSS-SDR-valvontasovitin receiver-trustille

seg-22b587ac642d = Lukee GNSS-SDR Monitor (Gnss_Synchro) ja PVT-monitor -viestit, välitettyinä JSON-riveiksi proto-kenttien nimillä, kanavakohtaiseksi C/N0:ksi, paikannukseksi, käytetyiksi satelliiteiksi, HDOP:ksi ja taivaaksi (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

seg-d22aed9d9a16 = Ei mitään ulkoista: kenttien nimet ovat GNSS-SDR:n dokumentaatiosta; lukijaa eikä relay.py:tä ajettu elävää GNSS-SDR:ää tai todellista tallennetta vasten

seg-217e5953c128 = IMU-lokin sisäänotto, gyrosuunnan syöte ja hybridianturien parametrien Allan-sovitus

seg-9dadc819daef = Lukee IMU CSV:n (dokumentoidut sarakkeet tai EuRoC-rakenne); integroi kääntymisnopeuden suunnaksi, jonka heading-course-valvonta lukee ([log.imu]); ja sovittaa hybridi- ja fuusioskenaarioiden kiihtyvyysanturin ja gyron kohinaparametrit paikallaan olevasta lokista limittyvällä Allan-poikkeamalla (imu-fit).

seg-9099f3467e9e = Ei mitään ulkoista: sovite tarkistetaan synteettisillä valkoisen kohinan lokeilla, joiden kertoimet tunnetaan, suunta vakiokääntymisnopeuden lokeilla. Yhtään todellista IMU-lokia ei sovitettu, eikä q_aa:ta soviteta

seg-15a852a2dcb0 = Home Assistant MQTT -löytö ja tilaviejä luottamustelemetrialle

seg-6d6b07b26966 = JSON-tila-asiakirja ja Home Assistant MQTT -löytöviestit luottamusvirralle, tulostettuna tekstinä jokaisella pinnalla ja julkaistuna MQTT { "3.1.1" } QoS { "0" } -yhteydellä komentoriviltä (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

seg-79a8f3864af3 = Ei mitään ulkoista: paketit luki testiä varten kirjoitettu loopback-kuuntelija, ei todellinen välittäjä, eikä Home Assistantia ajettu

seg-68caf86157c2 = ROS { "2" } receiver-trust -paketti ja gnss_lib_py-silta

seg-e7d7d99fe538 = ROS-vapaa silta, joka kirjoittaa paikannus- ja satelliittiviestit NMEA:ksi ja pisteyttää ne Python-sidoksen kautta (integrations/ros2/kshana_trust), sekä gnss_lib_py NavData–receiver-trust-silta rtklib-pos-formaatin kautta (integrations/gnss_lib_py).

seg-05ded40b17d2 = Ei mitään ulkoista: ROS-solmua ei ajettu elävällä ROS { "2" } -graafilla, eikä ublox_ubx_msgs-kenttien nimiä tarkistettu käynnissä olevaa ajuria vasten. gnss_lib_py (MIT) ajettiin siltatestiä varten

seg-6eee4b0e40b9 = <s1>Edellinen</s1>Varmennusmatriisi

seg-c3e7639ccf1a = <s1>Seuraava</s1>Miksi rivit pysyvät mallinnettuina

seg-2fd8f2df3e6e = Tiedoston <c1/> { "61" } ominaisuuskorttia ja sen jälkeen varmennusmatriisin kaikki { "401" } riviä.

seg-65185cb68d6b = Tehtävävaiheiden ketjun navigoinnin ja ajoituksen virhebudjetti laukaisusta paluuseen (<c1/>)

seg-86a132e1a243 = Tyyppi <c1/>: vaiheiden asiakirja, jossa kukin vaihe on yksi kahdeksasta rekisteröidystä tyypistä, ajetaan järjestyksessä ja 6x6-kovarianssi, kello ja koordinaatisto siirretään eteenpäin ilmoitetun säännön mukaan (<c2/>; <c3/>, valkoinen kiihtyvyyskohina ilmoitetun välin yli suoraviivaisella mallilla; <c4/>, dead reckoning ja sitten lähteen lattia, ei koskaan sen alle, ei koskaan nollausta); koordinaatistomuunnokset GCRF, MCI ja MCMF sekä aika-asteikkomuunnokset TT:n kautta, kukin oma budjettirivinsä, ja Kuun tila valinnaisesta DE440-kernelin leikkeestä sekä analyyttinen sarja ilmoitettuna varavaihtoehtona; marginaali ilmoitettua vaatimusta vasten, heikoin lenkki, tapahtumat ja aikajanakuva. Jokainen luku on ilmoitettu syöte tai sen malli

seg-cf8a0dc4088e = Käsinlaskelmat testeissä (suoraviivaisen kovarianssin kasvu, keskimääräinen sideerinen pyöriminen, maallinen Kuun kellonopeus) ja, vain Kuun tilalle, kirjatut DE440-kernelin leikkeet kiinnitettyjä JPL Horizons -arvoja vasten (pahin { "2.6" } m ja { "7e-6" } m/s). Mitään tehtäväaineistoa ei verrata ketjuun; sen vaiheet ovat omia rivejään. Asiakirja on ilmoitettu ketju, jonka syötteet ovat ILLUSTRATIVE, vain julkisia lähteitä eikä viraston kannatusta

seg-87b2b2459b45 = Laukaisu ja nousu parkkirataan GNSS-hankinnalla ja häipymällä (<c1/>)

seg-725e7ce83533 = Vaihe <c1/>: vakionopeuden paikka- ja nopeuskovarianssi valkoisella kiihtyvyyskohinalla (dead reckoning -luokka), ilmoitetun tarkkuuden GNSS-paikannus, jota sovelletaan hankinta-ajan jälkeen ja ilmoitettujen häipymien ulkopuolella, harhan ja ajautuman sisältävä kello, jota samat paikannukset kurinalaistavat, sekä parkkiradalle saattamisen tila

seg-22e5c301626e = Riccatin vakaa tila ja ennusteen käsinlaskenta testeissä. Tässä ei mallinneta kantorakettia eikä vastaanotinta; jokainen luku on ilmoitettu syöte

seg-eb66a49b0306 = Suhteellinen navigointi telakointikaistaan matalalla Maan kiertoradalla anturijaksojen yli (<c1/>)

seg-658a0448d80d = Vaihe <c1/>: suhteellinen tila kohteen LVLH-akseleissa suljetun muodon Clohessy-Wiltshire-siirtymällä, 6x6 Kalman-kovarianssi valkoisella kiihtyvyyskohinalla ja paikkapäivitykset, joiden varianssi on anturin varianssi senhetkisellä etäisyydellä, ilmoitetun anturin jaksojen yli (ILLUSTRATIVE optisen kameran, lidarin ja radioetäisyysmittauksen muodot); telakointi-ikkuna on aika, josta alkaen suhteellinen sigma pysyy kaappauskaistan sisällä vaiheen loppuun. Lähestyvän aluksen absoluuttinen kovarianssi siirretään muuttumattomana, ja rivi kertoo sen

seg-97f4aa0575e6 = Yhden akselin käsinlaskenta ennustus- ja päivitysvaiheesta testissä; Clohessy-Wiltshire-siirtymä on se, jonka cw_dynamics tarkistaa riippumatonta numeerista integrointia vasten. Anturit ovat ILLUSTRATIVE, eikä mitään todellista kohtaamista verrata

seg-b45a8a357faf = Kuuhun suuntautuva siirtoratainjektio ja kuunläheinen matka: propagoitu keskitila ja kovarianssi seurantapäivityksin (<c1/>)

seg-ab5c79789754 = Vaihe <c1/>: keskitila moottorin Cowell-propagaattorilla (Maa pistemassana ja J2, Aurinko ja Kuu kolmansina kappaleina, Kuu ketjun DE440-kernelistä, missä se kattaa osuuden, ja Aurinko analyyttisestä sarjasta); kovarianssi tämän propagoinnin eteenpäin otetulla tilasiirtymämatriisilla (nimellisajo ja kuusi häirittyä ajoa osuutta kohti) valkoisella kiihtyvyyskohinalla; TLI-polton koko- ja suuntausvirhe; <c2/>-paikannukset, joiden saatavuus ja PDOP tulevat avaruuspalvelualueen pyyhkäisystä kaarta edustavaa oskuloivaa rataa pitkin; etäisyys- ja etäisyysnopeusseuranta geosentristä suuntaa pitkin maaverkon käyttöasteella skaalattuna, Joseph-muotoisella päivityksellä

seg-86dae517e339 = Liouvillen teoreema (konservatiivisen osan tilasiirtymämatriisin determinantti on yksi) ja hienompi differenssi testeissä; keskitilaa verrataan julkiseen lentorataan alla olevalla rivillä, ja vertailussa se ei täytä kynnystä. Polttovirhettä, päivityksiä ja kovarianssia ei verrata mihinkään

seg-7a3eb4fae324 = Paluurajapinnan kovarianssi, käytävän todennäköisyys, huippuhidastuvuus ja laskeutumisjalanjälki (<c1/>)

seg-93f07906d7bf = Vaihe <c1/>: vaiheen <c2/> paluun vapaalento ilman polttoa, päättyen paluurajapintaan; lentoratakulma ja sen sigma täydestä kovarianssista äärellisen differenssin gradientilla; todennäköisyys, että kulma on ilmoitetun käytävän sisällä; huippuhidastuvuus nimelliskulmalla ja molemmilla käytävän reunoilla moottorin tasomaisesta ballistisesta pistemassapaluusta (takaisinkimpoaminen havaittu) Allen-Eggers-suljetun muodon rinnalla; laskeutumisjalanjälki ilmoitetusta etenemän suuntaisesta herkkyydestä ja rajapinnan kovarianssista kiertoratatason poikki. Nostovoimaa, ohjausta tai lämpenemistä ei mallinneta

seg-8d5695aad35b = Käsinlaskelmat testeissä (kulman sigma on kohtisuoran nopeuden sigma jaettuna nopeudella; gaussinen massa käytävässä). Tasomainen paluu on moottorin oma ja Allen-Eggers-muoto on suljetun muodon vertailu; mitään lennettyä paluuta ei verrata

seg-3f0951532f6e = Maaverkon kattavuus ja seurantakäyttöaste tehtävän vaiheelle (<c1/>, tyyppi <c2/>)

seg-5204af351299 = Maaverkkokerros: asemat vähimmäiskorkeuskulmalla, ajoneuvon näkyvyys ilmoitetulla geometrialla (paluutila lennettynä kahden kappaleen mallilla J2:n kanssa, Kuun paikka matkaa varten tai ilmoitettu käyttöaste), asemanvaihdot, joista kukin menettää ilmoitetun ajan, ja tuloksena oleva käyttöaste, joka välitetään vaiheen maaseurannan päivitystaajuudelle; pisin väli, jossa mikään asema ei ole näkyvissä, on budjettirivi

seg-0d1d229a3ab7 = Zeniitin ja antipodin geometriatarkistukset sekä kaukaisen kohteen odotettu näkyvyys testeissä. Mitään todellista verkkoa, antennia tai aikataulua ei mallinneta

seg-4ba700726208 = Suhteellinen navigointi telakointiin Kuun kiertoradalla (<c1/>)

seg-2e30e78e49f7 = Tyyppi ja vaihe <c1/>: kahden aluksen yhteinen erä-Gauss-Newton-estimaatti kaaren yli (kaksikymmentäyksi parametria: molempien tilat ja pysyvät signal-in-space-paikkaharhat, yhteiset ja riippumattomat), kasvatettuna neljänneksen, puolen ja koko kaaren yli askelpuolituksella, aluskohtaisesta absoluuttisesta paikannuksesta (AFS-pilottikoodin seurantaraja, ILLUSTRATIVE relejoukko) ja ristilinkin etäisyydestä, crate-paketin Kuun voimamallilla; keskimääräinen normalisoitu estimointivirheen neliö, Clohessy-Wiltshire-tarkistus ympyräradalla ja eteenpäin siirretty 6x6-kovarianssi

seg-09fa0c35d004 = Itsejohdonmukaisuus ennakkorekisteröinnin alaisena (xval/mission-thread-lunar/PREREGISTRATION.md, tulokset ja estimaattorin historia tiedostossa RESULTS.md): suhteellisen tilan keskimääräinen NEES on { "5.85" }–{ "5.93" } kaistaa { "5.2" }–{ "6.8" } vasten neljässä konfiguraatiossa, MET neljännellä estimaattorisuunnittelulla sen jälkeen, kun kolme sekventiaalista suodatinsuunnittelua alitti kynnyksen; totuus ja estimaattori jakavat saman voimamallin, joten tämä ei kerro mitään mallivirheestä. Jaettua propagaattoria verrataan LRO- ja CAPSTONE-lentoratoihin alla olevalla rivillä

seg-c85d7e5e63a3 = Laskeutumishajonnan budjetti Kuun napa-alueen kohteessa (<c1/>)

seg-bd88ab3ad105 = Tyyppi ja vaihe <c1/>: viiden tilan akselikohtainen inertiavirhemalli (paikka, nopeus, kiihtyvyysmittarin harha, kallistus, gyron harha) moottoroidun laskun aikana, avustettuna AFS-paikannuksilla (itsenäinen tai differentiaalinen, kellon tukemalla kolmen releen tapauksella), maastosuhteellisella paikannuksella (moottorin terrain-nav-täsmäyttäjä synteettisellä reliefillä tai Cramer-Rao-raja LOLA DEM:llä aukko-ongelmasäännöllä) ja Kuun ajalla, Monte Carlo -alastuloellipsillä

seg-a5ddb83a5cf1 = Suljetun muodon inertiaalinen ajautuma, uudelleenkäytettyjen tyyppien omat tulokset ja 3-sigma-ellipsin kalibrointi (sisällä oleva osuus vastaa odotusarvoaan) testeissä. Mitään lennettyä tai testattua laskua ei verrata

seg-8dfc1600cf8c = Pinnan paikannuksen ja ajoituksen saatavuus kohteen ja vuodenajan mukaan Kuun navoilla (<c1/>)

seg-f91c1da9ab55 = Tyyppi ja vaihe <c1/>: releen saatavuus ja PDOP, Maan ja Auringon näkyvyys sekä kuriin pidetty pintakello kullekin kohteelle ja vuodenajalle, tyypin <c2/> maastosiluetilla; yhden kohteen ajo on bitilleen yhtä kuin sen tyypin saatavuus ja PDOP

seg-e3a782dce8be = Täsmälleen sama tulos kuin olemassa olevalla tyypillä yhdelle kohteelle sekä monotonisuustarkistukset testeissä. Relejoukko on ILLUSTRATIVE, eikä mitään pintamittausta verrata

seg-0db91d70a079 = Moottoroitu nousu Kuun napa-alueen kohteesta insertiorataan (<c1/>)

seg-b5b1125d515c = Tyyppi ja vaihe <c1/>: viiden tilan akselikohtainen inertiavirhemalli ajettuna moottoroidun nousun yli ominaisvoimalla radan suunnassa, avustettuna AFS-paikannuksilla ja Kuun ajalla, raportoiden kiertoradalle kuljetetun insertiopaikan ja -nopeuden kovarianssin sekä moottorin katkaisuhajonnan (raportoitu, ei kuljetettu)

seg-76e0d23b7483 = Suljetun muodon inertiaalinen ajautuma ja monotonisuustarkistukset testeissä. Mitään lennettyä nousua ei verrata

seg-1983ce9cc6da = Kuun voimamallin propagointi julkisia rekonstruoituja kuukiertäjien ja kuunläheisiä lentoratoja vasten

seg-57f53a7d1fa2 = Kuutyyppien jakama propagaattori (GRAIL GL0660B aste ja kertaluku { "150" }, Maa ja Aurinko kolmansina kappaleina, suhteellisuus, DE440-Kuun orientaatio) verrattuna julkisiin JPL Horizons -lentoratoihin: LRO ({ "24" } h, { "10" } minuutin välein otetut näytteet) ja CAPSTONE (yksi { "6.5" } vuorokauden kierros, tunnin välein otetut näytteet), kynnyksin, jotka on kiinnitetty kirjattuun tiedostoon ennen ajoa

seg-321d0721970d = JPL Horizons -avaruusalusefemeridit LRO:lle ja CAPSTONElle, kynnyksiä vasten, jotka on ennalta rekisteröity tiedostossa xval/mission-thread-lunar/PREREGISTRATION.md (muutokset { "1" }–{ "6" }). LRO: MET, suurin 3D-ero { "33" } m ja radiaalinen RMS { "2.4" } m, kun kynnykset ovat { "500" } m ja { "60" } m. CAPSTONE: NOT MET, loppupaikan ero { "136.8" } km, kun kynnys on { "25" } km, ja periapsiksen ero { "28.4" } km, kun kynnys on { "10" } km, syitä ei eristetty. Rivi on mallinnettu, koska CAPSTONE-kynnys alitetaan ja vertailu testaa jaettua propagaattoria, ei mitään suodatinta, signaalia tai budjettia

seg-c557d317389a = Kuunläheisen keskitilan propagointi julkista Artemis I -lentorataa vasten (<c1/>)

seg-539d4c3e9b56 = Vaiheen <c1/> keskitilan propagointi (Cowell, Maa pistemassana ja J2, Aurinko ja Kuu kolmansina kappaleina, Kuu DE440-leikkeestä) verrattuna Artemis I:n julkiseen JPL Horizons -lentorataan { "72" } h vapaalentokaaren yli alkaen 2022-11-16 { "18" }:{ "00" } TDB, { "12" } tunnin välein olevissa epookeissa, kynnyksin, jotka on kiinnitetty kirjattuun tiedostoon ennen ajoa

seg-362b1a7b9e5e = JPL Horizons -kohde -1023 (NASAn navigoinnin lennetty TLI:n jälkeinen lentorata), kynnyksiä vasten, jotka on ennalta rekisteröity tiedostossa xval/mission-thread/PREREGISTRATION.md (muutos { "1" } muuttaa vain pyyntöjaksoa). NOT MET ja todetaan alitetuksi: suurin paikkaero { "45.3" } km, kun kynnys on { "5" } km, ja nopeusero { "0.249" } m/s { "72" } h kohdalla, kun kynnys on { "0.05" } m/s. Tuomion jälkeen kirjoitettu diagnostiikka paikantaa alituksen viiteen impulsiiviseen nopeusaskeleeseen, joiden suuruus on { "0.09" }–{ "0.22" } m/s, viitteessä (ennalta rekisteröity lukutapa, että ikkunassa ei ollut polttoa, oli väärä); muiden { "67" } tunnin aikana malli toistaa seuraavan tuntitilan mediaanilla { "0.38" } m. Testaa vain yhden vapaalentokaaren keskitilaa: ei kovarianssia, suodatinta, päivitystä eikä muuta vaihetta

seg-150ae9c3d755 = Häirintälähteen alue: mahdollinen lähetinalue ilma-alusten ja alusten paikkaraporteista

seg-b5c49044a7a1 = Mahdollinen alue sille, missä heikentyneitä navigointiraportteja aiheuttava lähde voi olla, ADS-B- (NIC/NACp) tai AIS-paikkaraporteista: radion näköyhteys 4/3-maapallon säteellä raportin korkeudesta ja lähetinantennin korkeusvälistä, rajoitettu tehollinen kantama tuntemattomalle teholle, vaikutuksen alaiset yksiköt vetävät posteriorin kohti kantamaansa ja vaikutuksen ulkopuoliset yksiköt, joilla on näköyhteys, työntävät sitä vastaan, ryhmiteltyinä istunnoiksi ajassa ja paikassa. Tuloste on suurimman tiheyden alueet ilmoitetuilla luottamustasoilla, posteriorin painopiste momenttiellipsillä, istunnon alku, loppu, kesto, vaikutuksen alainen pinta-ala ja erillisten ilma-alusten lukumäärä julkaisuminimin yläpuolella, vuorokaudenaikaprofiili ja tunnit päivässä. Maastoton; yksi lähde istuntoa kohti; uskottavuus on ehdollinen mallille. Valinnainen fuusio geolocation-moduulin TDOA-paikannukseen.

seg-953a8b4f9f41 = Ei vielä ulkoista. Vain synteettisiä eteenpäin-käänteisiä kiertoajoja generaattorilta, joka jakaa estimaattorin mallin, joten ne tarkistavat koodin ja ilmoitettujen tasojen kalibroinnin tämän mallin alaisena eivätkä mitään todellisista lähettimistä. Ulkoinen tarkistus julkaistuja Jammertest { "2025" } -lähetinkohteita vasten ennalta rekisteröitiin (docs/emitter-region/PREREGISTRATION.md, omistaja kuittasi ennen yhtäkään pisteytettyä ajoa) ja ajettiin kerran (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } aikataulutettua istuntoa, vähemmän kuin rekisteröity minimi { "4" }) ja AIS NOT ASSESSABLE (ei julkaistua istuntoa), joten mitään kynnystä ei testattu ja rivi pysyy MODELLED

seg-d5a79853b72f = { "93" } / { "93" } tyyppiä, { "3334" } / { "3334" } numeerista kenttää
