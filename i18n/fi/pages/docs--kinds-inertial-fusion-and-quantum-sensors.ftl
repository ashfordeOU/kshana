# docs--kinds-inertial-fusion-and-quantum-sensors: translations (fi)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Tyyppi

seg-ec26df467b88 = Yhteinen Kalman-anturifuusio-PNT samoilla hybridisyötteillä.

seg-c8a1c797f4b1 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/fusion-pnt.toml, skenaariotyyppi fusion

seg-38df285a3f25 = Löyhästi ja tiukasti kytketty GNSS/INS-virhetila-EKF.

seg-7d993b676006 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/gnss-ins.toml, skenaariotyyppi gnss-ins

seg-c6edf89eb8d4 = 17-tilainen hybridi kvantti+klassinen tiukasti kytketty GNSS/INS-UKF (MODELLED): { "15" } INS-virhetilaa + CAI-johdettu kiihtyvyysanturin harhakorjaus + 2-tilainen (vaihe+taajuus) kello q-parametrikellomoottorista, jota ohjaa haarukoitu CAI-virhemalli. Laatumittari on suodattimen itsejohdonmukaisuus (NEES + innovaatioiden valkoisuus vs χ²-rajat) — itsejohdonmukaisuusväite, EI todellisen maailman tarkkuustakuu. Vain simulaatio; ei TRL>{ "3" }, ei lentoperintöä, ei ulkoista validointia.

seg-2968660fa880 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/hybrid-ukf.toml, skenaariotyyppi hybrid-ukf

seg-22cd963c7042 = Hybridi-PNT-kokonaisuus: kello + IMU + ajansiirtoavustus.

seg-52378a7b074c = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/hybrid-pnt.toml, skenaariotyyppi hybrid

seg-bdedf28adc48 = 1-DOF inertiaalinen dead reckoning GNSS-katkon aikana.

seg-873c402bb724 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/imu-deadreckoning.toml, skenaariotyyppi inertial

seg-5b9a6efe6337 = INS/TRN-liukumavirhemalli: paikkavirhe liukuajan funktiona, rakennettu IMU-kertoimista eikä pyyhkäisty oletettuna ajautumisnopeutena. Viisi kasvutekijää — kiihtyvyysmittarin harha, gravitaation kautta vaikuttava gyroharhan kallistuma, nopeuden satunnaiskävely, kulman satunnaiskävely ja asteikkokerroin kuljettua matkaa vastaan — etenee kukin yhdeksäntilaisen paikallistasoisen inertiavirhemallin läpi Schuler-takaisinkytkennällä ilmoitetulla leveysasteella ja korkeudella (lyhyen liukumisen johtavan asteen lait t², t³, t^{ "1.5" }, t^{ "2.5" } ja t¹/t² raportoidaan sen rinnalla) ja yhdistetään ILMOITETULLA säännöllä (oletuksena neliösumman neliöjuuri (rss), tai lineaarinen summa, tai deterministinen summa ja stokastinen rss; kaikki kolme lasketaan jokaisella ajolla, jotta valinta näkyy eikä ole piilossa). Liukuajat, joilla kutsujan antamat paikkakynnykset ({ "10" } m ja { "50" } m oletuksena) saavutetaan, paikannetaan moottorin olemassa olevalla puolitushaulla, ja kullekin annetaan osatekijäkohtainen erittely, joka nimeää hallitsevan lähteen; lisäksi jokaisen yksittäisen osatekijän ylitys käännetään algebrallisesti, jotta nämä kaksi täsmäävät. Maastosuhteisen navigoinnin (TRN) tila rajaa liukumisen jaksollisilla paikkapäivityksillä ja raportoi suurimman päivitysvälin, jolla kukin kynnys pitää; pelkkä paikkapäivitys jättää nopeusvirheen ja kallistuman voimaan päivityksen yli, joten se ei aina rajaa liukumista millään päivitystaajuudella, ja raportti sanoo tämän eikä palauta nollaa. MODELLED: IMU-luokan kertoimet ovat edustavia kaistaarvoja, eivät datalehti, ja maastopäivityksen jäännös on syöte. Saavuttamaton kynnys raportoidaan arvona null ja tilatiedolla, ei koskaan nollana. Ei ole sertifioitu inertianavigoinnin suorituskykytuote.

seg-134a4c91da3a = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/ins-trn-coast.toml, tyyppi ins-trn-coast

seg-04310cd6cbec = MODELLED vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille: nimetty vikaluettelo (kellon taajuushyppy/ajautuma/lukituksen menetys; anturin harha-askel/katkos), havaitsemistunnusluvun ROC AUC (bootstrap-luottamusväli ulkoisesti validoidusta eval_statsista) ja pienin havaittava vika kiinteällä väärän hälytyksen asteella, kun kvanttikelloavusteinen monitori (pienempi kohina) havaitsee pienempiä vikoja — rehellisenä TradeEvidencena + edustavuutena. Gaussin havaitsemistunnusluvun malli (AUC = Phi(mu/(sigma*sqrt2))); mallintaa luokan, havainnollistavat julkisista lähteistä kootut parametrit, ei TRL-/lento-/sertifiointiväitettä.

seg-2f1d14239d1a = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-anomaly-detect.toml, tyyppi quantum-anomaly-detect

seg-790fbfdd80f0 = MODELLED GNSS-vapaa kvanttinavigointi: GNSS-katkon aikana kvantti- (kylmäatomi-interferometri) inertiabudjetti vs. klassinen navigointiluokan INS — paikkavirheen kasvu vapaaliikkeen aikana, holdover paikkakynnykseen ja kvantti-vs.-klassinen-kauppa rehellisenä TradeEvidencena edustavuuden kanssa. Rehellinen havaittavuushuomautus: ilman ulkoista paikannusta kiihtyvyysmittarin harha on havaitsematon, joten virhe kasvaa; kvanttianturi hidastaa mutta ei sulje tuota eroa. Havainnollistavat julkisista lähteistä kootut laiteparametrit; mallintaa luokan, ei TRL-/lento-/sertifiointiväitettä.

seg-1bdbf1a737b2 = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-gnss-free-nav.toml, tyyppi quantum-gnss-free-nav

seg-eb55d253dd11 = Kvantti-vs.-klassinen PNT-kauppa ({ "13503" }): ehdokaskellon ajoitus-holdover- ja inertia-holdover-hyöty (mitattu ADEV-käyrä — puolustettavuuden ratkaiseva tekijä — tai kvanttikelloluokka) vs. klassinen lähtötasoluokka, pitkän tau:n lattiaoletuksen varauma mukana artefaktissa, sekä GNSS-estetty kestävyys–aika-verhokäyrä. MODELLED; kvantifioi (ei koskaan validoi) kumppanin laitetta. Ehdokaskello on mitattu käyrä (<c1/> + <c2/>, yhtä pitkät, vähintään { "2" } pistettä; se voittaa, kun molemmat muodot on annettu) tai <c3/>.

seg-c74c63ffd859 = Moottorin kirjoittama kaavio skenaariolle scenarios/quantum-trade.toml, tyyppi quantum-trade

# text
seg-4e31c8daf798 = Kirjanpito

# text
seg-9095869ec445 = { "9" } skenaariolajia, moottorin v{ $version }. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva tunniste on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten tunniste ansaitaan: READMEn Evidence-osio).

# text
seg-efd15cff3d32 = MODELLED (tuloksen tunniste)

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/inertial-fusion-and-quantum-sensors.md
seg-e6f2ab1647e2 = Lähde: <c1/>

# text
seg-23762f3a250b = Inertia-anturit, fuusio ja kvanttianturit (skenaariolajiperhe)

# text
# c1: kshana scenarios/gnss-ins.toml
seg-6ec3ad751007 = Aihesivut: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Aja yksi: <c1/>. Kaikki perheet: <a4>KINDS.md</a4>.

# attr:alt
seg-0e73a37b716b = Kuvakooste moottorin kirjoittamista kaavioista perheen Inertia-anturit, fuusio ja kvanttianturit lajeille

# text
seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

# text
seg-084cf4eeccb5 = 17-tilainen hybridi kvantti+klassinen tiukasti kytketty GNSS/INS UKF (MODELLED): { "15" } INS-virhetilaa + CAI:sta johdettu kiihtyvyysmittarin biaskorjaus + 2-tilainen (vaihe+taajuus) kello q-parametrikellomoottorista

# text
seg-a7d3c32b29b3 = INS/TRN-rannikointivirhemalli: paikkavirhe suhteessa rannikointiaikaan, rakennettu IMU-kertoimista eikä pyyhkäisty oletettuna ajautumanopeutena.

# text
seg-beb568dec44f = MODELLED GNSS-vapaa kvanttinavigointi: GNSS-katkon aikana kvantti- (kylmäatomi-interferometri) inertiabudjetti vastaan klassinen navigointiluokan INS — paikkavirheen kasvu rannikoinnin aikana, holdover t

# text
seg-d948ea4d1f33 = MODELLED vika-/poikkeamahavaitseminen kvantti-PNT-järjestelmille: nimetty vikaluettelo (kellon taajuushyppy/ajautuma/lukituksen menetys; anturin biasaskel/katkos), havaitsemistunnusluvun ROC AUC (bootstrap-CI:llä

# text
seg-48e72d451a50 = Kvantti vastaan klassinen PNT-vaihtoehtovertailu ({ "13503" }): ehdokaskellon ajoituksen holdover- ja inertiaholdover-hyöty (mitattu ADEV-käyrä — puolustettavuuden sarana — tai kvanttikellon luokka) vastaan klassinen perus

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
# c7: runs
seg-5330b47bc0b6 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valinnaiset: <c7/>.

# text
seg-75867e8b4b4f = <b>Kirjanpito:</b> MODELLED { "6" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>inertial</a1>.

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
seg-fdf140d4ce68 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-44c6371da5f9 = <b>Kirjanpito:</b> MODELLED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>hybrid</a1>.

# text
# c1: seed
# c2: timing_spec_ns
# c3: position_spec_m
# c4: time
# c5: gnss
# c6: resync
# c7: clock_quantum
# c8: clock_classical
# c9: accel_quantum
# c10: accel_classical
# c11: coupled
seg-3246c9e1e0cb = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valinnaiset: <c11/>.

# text
seg-e2bd8fd0d9e5 = <b>Kirjanpito:</b> MODELLED { "4" } · VALIDATED { "4" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>fusion</a1>.

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
# c6: residual_accel_bias_m_s2
# c7: speed_m_s
# c8: sigma_pr_m
# c9: sigma_rr_mps
# c10: consistency_seeds
# c11: q_factor
# c12: r_factor
seg-d0790a2643ae = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valinnaiset: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-85ab600e3050 = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>hybrid-ukf</a1>.

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
# c7: fix_interval_s
# c8: sigma_pos_m
# c9: sigma_vel_mps
# c10: lat_deg
# c11: lon_deg
# c12: alt_m
# c13: trajectory
# c14: tight
seg-3bbd5ce09bee = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valinnaiset: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-08ad3969f65b = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>gnss-ins</a1>.

# text
# c1: imu_grade
# c2: accel_bias_ug
# c3: accel_vrw_m_s_per_sqrt_hr
# c4: accel_scale_factor_ppm
# c5: gyro_bias_deg_per_hr
# c6: gyro_arw_deg_per_sqrt_hr
# c7: speed_m_s
# c8: ref_accel_m_s2
# c9: latitude_deg
# c10: height_m
# c11: combination
# c12: crossing_thresholds_m
# c13: grades
# c14: drift_band_lo_m_per_s
# c15: drift_band_hi_m_per_s
# c16: trn_fix_mode
# c17: trn_fix_interval_s
# c18: trn_fix_residual_m
# c19: mission_duration_s
seg-1703619ca20e = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-ab3453d1ee51 = <b>Kirjanpito:</b> VALIDATED. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>ins-trn-coast</a1>.

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-a77cdf6e8e31 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-b05e96ce392d = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>quantum-gnss-free-nav</a1>.

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-3f3e48045d31 = Pakolliset kentät: ei yhtään. Valinnaiset: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-cbefb1538dec = <b>Kirjanpito:</b> yksikään matriisin rivi ei nimeä tätä lajia; moottori merkitsee oman tuloksensa. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>quantum-anomaly-detect</a1>.

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c5: baseline_ins
# c6: candidate_ins
# c7: resilience_times_s
# c8: alt_pnt_bound_m
seg-6eee03151521 = Pakolliset kentät: <c1/>, <c2/>, <c3/>, <c4/>. Valinnaiset: <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-6cb57dc94549 = <b>Kirjanpito:</b> MODELLED { "1" } · VALIDATED { "2" }. Koko sivu, jossa syötteet, tulokset, todisteet ja rajoitukset: <a1>quantum-trade</a1>.

# text
seg-b6c31bdda166 = <s1>Edellinen</s1>GPS-denied-vaihtoehtoinen PNT

# text
seg-0585e4ae329e = <s1>Seuraava</s1>Häirintä, harhautus ja spektri
