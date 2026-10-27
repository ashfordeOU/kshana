# docs--kinds-clocks-timing-and-holdover: translations (fi)

seg-b03d56f501c3 = Tyyppi

seg-78cba87823f7 = Kellon holdover suhteessa määritykseen; valinnainen Monte Carlo -otosjoukko (runs > { "1" }).

seg-cb0b7da83f5c = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/clock-ensemble.toml, skenaariotyyppi clock

seg-c0924aa36e64 = MODELLED ajoitusjärjestelmän holdover-testi, pisteytettynä aikavirhetallenteesta, jonka OPERAATTORI toimittaa (linuxptp ptp4l-, phc2sys- tai ts2phc-loki, chrony tracking- tai statistics-loki, TICC-, TimeLab- tai RINEX-kellolokki, tai time_s,time_error_ns-parit). Testissä on neljä vaihetta, eikä Kshana suorita yhtäkään niistä: lukittu LÄHTÖTASO, operaattorin tekemä GNSS:N POISTO (antennikaapeli tai simulaattorin lähtö; Kshana ei lähetä eikä ohjaa mitään) ilmoitettuna ajankohtana, HOLDOVER järjestelmän omalla oskillaattorilla ja PALAUTUMINEN sen jälkeen, kun operaattori palauttaa GNSS:n toisena ilmoitettuna ajankohtana. Tallenne jaetaan näissä kahdessa ajankohdassa. Lähtötaso: aikavirhetilastot ja lukitulle kellolle kirjoitetut ITU-T-maskit. Holdover: tilastot, järjestelmän pitämä suhteellinen taajuuspoikkeama (pienimmän neliösumman suora), holdoverille tai autonomiselle kellolle kirjoitetut maskit, ePRTC-A-holdover-verhokäyrä ilmoitetusta lukitusajasta ja aika kunkin aikavirhebudjetin ylittymiseen. Palautuminen: tuliko |TE| ilmoitetun kaistan sisälle ja milloin, ja pysyikö se siellä, huippu ja suurin askel. Jokainen raja on kopioitu julkisesta ITU-T-taulukosta (telecom-timing-maskit); sanamuoto on 'mitattu maskia vasten', ja kaksi ajankohtaa ovat operaattorin ilmoitus, ei varmennettu. Maskiin liian lyhyt tallenne on INCOMPLETE, ei koskaan ekstrapoloitu. Katso docs/TIMING-HIL.md.

seg-8ce93392747b = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/holdover-test-ptp4l.toml, skenaariotyyppi holdover-test

seg-540545e6f846 = MODELLED luotettu kvanttiajoitusketju: päästä päähän ulottuva kvantti- (optinen hilakello + lomittuminen/yksifotonilinkki) vs. klassinen (CSAC + RF-kaksisuuntainen) ajansiirtobudjetti, uudelleenkäytetty ajoituksen suojaustaso + viive-/toistohyökkäyksen turvallisuuden laatumittari (1-P_md), kellopoikkeaman havaitsemistodennäköisyys + CUSUM-latenssi sekä kvantti-vs.-klassinen-kauppa rehellisenä TradeEvidencena edustavuuden ja lentoon-puuttuvien-asioiden-tietueen kanssa. Havainnollistavat julkisista lähteistä kootut laite-/linkkiparametrit; mallintaa luokan, ei TRL-/lento-/sertifiointiväitettä.

seg-09760f892c7b = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-time-transfer.toml, tyyppi quantum-time-transfer

# text
seg-1b61962464c5 = Slot timing: sekunnit siihen asti, kun vapaasti käyvä kello poistuu aikaindeksoidun reitityksen tai tehtävänannon aikavälin suoja-alueelta (suurin absoluuttinen aikavirhe, jonka aikaväli sietää), jokaisen termin osuus tuolla hetkellä niin, että hallitseva termi nimetään (kiinnityksen epävarmuus, valkoinen vaihekohina, valkoinen, flicker-, satunnaiskävely- ja satunnaisajelutaajuuskohina, jäännöstaajuuspoikkeama, lämpötila, ikääntyminen), viimeisestä kiinnityksestä jäljellä oleva aika sekä suurin kiinnitysväli, joka pitää kellon rajojen sisällä kiinnityksen viive vähennettynä. Oskillaattori on LUOKKAOLETUS (csac, uso, dsac, tcxo, ocxo tai rafs: yksi viitattu yhden sekunnin Allanin poikkeama ja oletettu punakohinan lattia), telekommunikaation ajoituksen TIETOLEHTI-ESIASETUS tai rivinsisäinen TIETOLEHTI (Allanin poikkeaman maksimit sovitettuna verhokäyränä sekä ikääntyminen ja lämpötilakerroin) tai rivinsisäinen MEASURED-vaihetallenne (sen limittyvä Allanin poikkeama sovitettuna painotetulla pienimmän neliösumman menetelmällä valkoisen vaiheen ja IEEE Std { "1139" } -taajuusmodulaatiokannassa, joten punakohinan lattia on mitattu eikä oletettu). Ylitys, joka ylittää pisimmän keskiarvoistusajan, jota tietolehti tai tallenne tukee, merkitään ekstrapoloiduksi. Valinnainen spoofing-osio lisää kiertoradalla olevan vastaanottimen ajoituksen suojaustason: kiertonopeus ja kiertoaika, kuinka kauan yksittäinen maassa oleva harhautuslähetin yltää satelliittiin yhdellä ylilennolla, kelloavusteisen monitorin lattia ja CUSUM-havaitsemisviive, ehdollinen raja, vetäytymä, jonka harhautuslähetin ilmoitetulla suurimmalla nousunopeudella kerryttää ennen kuin satelliitti poistuu sen kantamalta tai riippumaton tarkistus suoritetaan, sekä onko jokainen maayhteyden tai ristiinlinkin tarkistus riippumaton tuosta harhautuslähettimestä. VALIDATED: holdover-käänteisratkaisu sovitetusta tallenteesta, pidätettynä oikealla cesiumkellolla, jota mitattiin vetymaseria vastaan (tests/slot_timing_cs5071a_holdout.rs, dataportitettu); mitatulla kideoskillaattorilla pidätetty ennuste on konservatiivinen mutta ei kynnyksen sisällä, joten kideoskillaattoritapaus on MODELLED. MODELLED: luokka- ja tietolehtilähteet, deterministiset termit ja harhautusarvio.

# attr:alt
seg-97a91c8a60cd = Moottorin kirjoittama kaavio skenaariolle scenarios/slot-timing-ocxo-leo.toml, laji slot-timing

# text
seg-4f19d4fb1341 = Yleinen N-ulotteinen pyyhkäisy minkä tahansa paketin yli pisteytettyjen TOML-avainten / JSON-metriikkapolkujen avulla.

# attr:alt
seg-621a18c07044 = Moottorin kirjoittama kaavio skenaariolle scenarios/sweep-nd-inertial.toml, laji sweep-nd

# text
seg-e7ab7b55c969 = 1-ulotteinen vaihtoehtovertailun pyyhkäisy kellopaketin parametrin yli.

# attr:alt
seg-c784b8f22f12 = Moottorin kirjoittama kaavio skenaariolle scenarios/sweep-clock-stability.toml, laji sweep

# text
seg-a448b24ded2b = Telekommunikaation ajoitus: GNSS-holdoverin aikavirhe, suurin aikavälivirhe (MTIE) ja aikapoikkeama (TDEV) tarkistettuna ITU-T-maskeja vastaan siten, että jokaiselle maskille annetaan PASS tai FAIL ja marginaali. Syöte on joko SYNTEETTINEN HOLDOVER (oskillaattoriesiasetus -- ocxo, rubidium, caesium tai csac, kukin nimetyn julkisen Microchipin tietolehden vakaus-, ikääntymis- ja lämpötilaluvuin -- sekä GNSS:n menetysaika, tallenteen pituus ja näytteenottoväli; vapaasti käyvä kello kantaa valkoista, flicker- ja, kun tietolehtisovitus sitä tarvitsee, satunnaiskävelytaajuuskohinaa, lineaarista ikääntymistä ja sinimuotoista lämpötilatermiä) tai SISÄÄNOTETTU SARJA [time_s, time_error_ns]-pareja rivinsisäisesti annettuna (ja vain natiivirakennelmissa CSV-tiedostona). Maskit: ITU-T G.8272 (07/2025) PRTC-A ja PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE taulukot 1-2, TDEV taulukot 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukittuna ({ "30" } ns, taulukot 1-2) ja ePRTC-A holdover (taulukon { "3" } aikavirheen verhokäyrä, joka nousee arvosta { "30" } ns arvoon { "100" } ns holdover-jakson H aikana, jonka lukitun keston määrää, MTIE taulukko { "4" }, TDEV taulukko { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC-luokat A-C (max|TE|, vakioaikavirhe, alipäästösuodatettu MTIE ja TDEV) ja luokka D (max|TE_L| { "5" } ns, ainoa luokan D luku, jota ei ole jätetty jatkotutkimukseen); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) vertailupiste C (max|TE_L| { "1100" } / { "600" } / { "100" } ns MTIE-taulukoin 7-1–7-3 kanssa). Jokainen kohta, jonka Suositus merkitsee jatkotutkimukseen, puuttuu sen sijaan että se täytettäisiin, ja jokainen raportti luettelee, mitä ei ole toteutettu. Raportoi myös ajan, jossa kukin enimmäisaikavirhebudjetti ylittyy (oletukset: { "100" } ns ePRTC max|TE_HO|, { "400" } ns verkon holdover-varaus, { "1100" } ns piste C, { "1.5" } us luokka { "4" }), MTIE-/TDEV-käyrät CSV-taulukkona jokaisen maskin rajan kanssa sekä yksiköt ja alkuperä -merkinnän jokaiselle numeeriselle kentälle. VALIDATED: MTIE- ja TDEV-estimaattorit allantools-pakettia vastaan committoidulla holdover-sarjalla. MODELLED: maskitaulukot ovat transkriptioita, ja synteettinen holdover on tietolehden maksimeista rakennettu malli, ei minkään yksilön mittaus. Ei vaatimustenmukaisuustesti.

# attr:alt
seg-ec7745a09d08 = Moottorin kirjoittama kaavio skenaariolle scenarios/telecom-synce-eec.toml, laji telecom-timing

# text
seg-9a2bb9809aed = Kaksisuuntainen satelliittiaika- ja taajuudensiirto kahden aseman välillä geostationaarisen releen kautta: kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B jokaisen ei-resiprookkisen termin kanssa (aseman laitteiston viiveet, Ku-kaistan ionosfääri, transponderi, Sagnac), neliöllinen epävarmuusbudjetti, jonka tyypin A termi on simuloidun linkin TDEV keskiarvoistusajalla, simuloitu linkki valkoisella ja flicker-vaihekohinalla sekä vuorokautisella ei-resiprookkisuudella, sekä minkä tahansa annetun BIPM Circular T Section { "1" } -sarjan, MJD,ns-CSV:n tai IGS RINEX -aseman kellotallenteiden vakaus (nopeus, residuaalin RMS, TDEV, ADEV). MODELLED.

# attr:alt
seg-92d3c84024d7 = Moottorin kirjoittama kaavio skenaariolle scenarios/time-transfer-budget.toml, laji time-transfer-budget

# text
seg-ccb244e60d60 = Optinen vastaan RF-kaksisuuntainen aika- ja taajuudensiirto.

# attr:alt
seg-bd76bd68eab3 = Moottorin kirjoittama kaavio skenaariolle scenarios/timetransfer.toml, laji timetransfer

# text
seg-4e31c8daf798 = Kirjanpito

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Lähde: <c1/>

# text
seg-3b549536beed = Kellot, ajoitus ja holdover (skenaariolajiperhe)

# text
seg-9095869ec445 = { "9" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Aihesivut: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Aja yksi: <c1/>. Kaikki perheet: <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Kuvakooste moottorin kirjoittamista kaavioista perheen Kellot, ajoitus ja holdover lajeille

# text
seg-efd15cff3d32 = MODELLED (tuloksen tunniste)

# text
seg-ff7dca09f0f2 = Telekommunikaation ajoitus: GNSS-holdoverin aikavirhe, suurin aikavälivirhe (MTIE) ja aikapoikkeama (TDEV) tarkistettuna ITU-T-maskeja vastaan siten, että jokaiselle maskille annetaan PASS tai FAIL ja marginaali.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Slot timing: sekunnit siihen asti, kun vapaasti käyvä kello poistuu aikaindeksoidun reitityksen tai tehtävänannon aikavälin suoja-alueelta (suurin absoluuttinen aikavirhe, jonka aikaväli sietää), jokaisen termin osuus tuolla

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Kaksisuuntainen satelliittiaika- ja taajuudensiirto kahden aseman välillä geostationaarisen releen kautta: kaksisuuntainen yhtälö ratkaistuna suureelle T_A - T_B jokaisen ei-resiprookkisen termin kanssa (aseman laitteiston viiveet, Ku

# text
seg-a2a710b3204f = MODELLED holdover-testi ajoitusjärjestelmälle, pisteytetty aikavirhetallenteesta, jonka KÄYTTÄJÄ toimittaa (linuxptp ptp4l-, phc2sys- tai ts2phc-loki, chrony tracking- tai statistics-loki, TICC, TimeLab tai RINEX

# text
seg-1da440dd525c = MODELLED luotetun kvanttiajoituksen ketju: päästä päähän kvantti (optinen hilakello + lomittumis-/yksifotonilinkki) vastaan klassinen (CSAC + RF-kaksisuuntainen) ajansiirtobudjetti, uudelleenkäytetty ajoituksen suojaus

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
# c7: runs
# c8: integrity
seg-50d75d48ed43 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valinnaiset: <c7/>, <c8/>.

# text
seg-3273244f755c = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>clock</a1>.

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
# c7: scale
seg-ee8d6e20c844 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valinnaiset: <c7/>.

# text
seg-e359cc42506e = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Pakolliset kentät: <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Kirjanpito:</b> MODELLED { "5" } · VALIDATED { "1" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Pakolliset kentät: <c1/>, <c2/>. Valinnaiset: <c3/>.

# text
seg-cc04bc2d43c5 = <b>Kirjanpito:</b> MODELLED { "2" } · VALIDATED { "1" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>timetransfer</a1>.

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
# c8: uplink_ghz
# c9: downlink_ghz
# c10: true_offset_ns
# c11: flicker_noise_ns
# c12: diurnal_amplitude_ns
# c13: reciprocity_bias_ns
# c14: step_s
# c15: span_days
# c16: averaging_s
# c17: seed
# c18: series
seg-5134a01b60a0 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Valinnaiset: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-09b554a74d49 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Pakolliset kentät: <c1/>, <c2/>. Valinnaiset: <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>holdover-test</a1>.

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-76bb4110ea36 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-bb6d7df61e2f = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Edellinen</s1>Kampanjat

# text
seg-960d5c757310 = <s1>Seuraava</s1>Satelliittitähdistöt, kattavuus ja geometria
