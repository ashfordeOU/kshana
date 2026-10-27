# docs--kind-ins-trn-coast: translations (et)

# text
seg-bf51947657c0 = navigatsioon

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-c4ed27a559df = Teemaleht: <a1>RESILIENCE-CROSSWALK.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
# c1: docs/kinds/by-kind/ins-trn-coast.md
seg-f7305f3a0b5a = Allikas: <c1/>

# text
# c1: ins-trn-coast
seg-92b90cb4a839 = <c1/> (stsenaariumi liik)

# text
seg-5b9a6efe6337 = INS/TRN inertsiaalliikumise veamudel: asukoha viga sõltuvalt inertsiaalliikumise kestusest, ehitatud IMU koefitsientidest, mitte läbi pühitud eeldatava triivikiirusena. Viis kasvupanust — kiirendusmõõturi nihe, güroskoobi nihke kalle gravitatsiooni kaudu, kiiruse juhuslik kõndimine, nurga juhuslik kõndimine ja läbitud vahemaaga seotud skaalategur — kõiki levitatakse läbi üheksa olekuga kohaliku horisondi inertsiaalvea mudeli Schuleri tagasisidega kindlaksmääratud laiuskraadil ja kõrgusel (lühikese inertsiaalliikumise juhtivat järku seadused t², t³, t^{ "1.5" }, t^{ "2.5" } ja t¹/t² esitatakse selle kõrval) ning ühendatakse SELGESTI ÜTLEDUD reegli alusel (vaikimisi ruutude summa ruutjuur, või lineaarsumma, või deterministlik summa koos stohhastilise rss-iga; kõik kolm arvutatakse igal käivitusel, et valik oleks nähtav, mitte peidetud). Inertsiaalliikumise kestused, mis jõuavad kutsuja antud asukohalävedeni (vaikimisi { "10" } m ja { "50" } m), leitakse mootori olemasoleva poolitusmeetodiga, igaühe juures panuste kaupa lahutus, mis nimetab domineeriva allika, ning iga üksiku panuse ületus pööratakse lisaks algebraliselt ümber, et mõlemad lahendused ühtiksid. Maastikusuhtelise navigatsiooni režiim piirab inertsiaalliikumist perioodiliste asukohafikseerimistega ja esitab suurima fikseerimisintervalli, mis iga läve hoiab; ainult asukohta sisaldav fikseering jätab kiiruse vea ja kalde fikseeringu üle elama, mistõttu see ei piira inertsiaalliikumist alati ühegi fikseerimissageduse korral, ja aruanne ütleb seda välja, mitte ei anna nulli. MODELLED: IMU klassi koefitsiendid on esinduslikud vahemikuarvud, mitte andmelehe väärtused, ja maastikufikseeringu jääk on sisend. Saavutamata lävi esitatakse väärtusega null ja olekuga, mitte kunagi nullina. Mitte sertifitseeritud inertsiaalnavigatsiooni toimivustoode.

# text
# c1: scenarios/ins-trn-coast.toml
seg-bbd497aa3ba6 = Ühe <c1/> käivituse kokkuvõte: ins-trn-coast | navigatsiooni-IMU, { "250" } m/s, kombineerimine rss | { "10" } m juures { "251.0" } s (accel_bias) | { "50" } m juures { "608.8" } s (accel_bias) | TRN ainult asukoha tipp { "44.7" } m { "1200" } s jooksul

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
seg-e0555ca683b1 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/ins-trn-coast.toml
seg-95887c4551c7 = Näide <c1/> määrab muu hulgas:

# text
seg-4db5a594afc1 = rss

# text
seg-5868f641c089 = ug

# text
seg-1918189ac2bf = ppm

# text
seg-7eba4c5ee1e4 = Tulemuse silt (mootori oma): MODELLED INS/TRN inertsiaalliikumise veaeelarve. Iga panust levitatakse läbi üheksa olekuga kohaliku horisondi inertsiaalvea mudeli Schuleri tagasisidega (horisontaalne platvorm põhja suunas kindlaksmääratud asukohas, vabainertsiaalne, sealhulgas ebastabiilne vertikaalkanal); selle lühikese inertsiaalliikumise juhtivat järku seadused (nihe t^{ "2" }, gy

# attr:alt
seg-134a4c91da3a = Mootori joonistatud diagramm failile scenarios/ins-trn-coast.toml, liik ins-trn-coast

# text
seg-7bb77ec86a0a = <b>VALIDATED</b> Asukohavea ja inertsiaalliikumise kestuse eelarve, mis on ehitatud IMU koefitsientidest, iga veaallikas (kiirendusmõõturi nihe, güroskoobi nihe, kiiruse juhuslik kõndimine, nurga juhuslik kõndimine, skaalategur püsiliikumisel ja püsiva erijõu all) levitatud läbi n

# text
seg-d69247df315f = <b>VALIDATED</b> Asukohavea ja inertsiaalliikumise kestuse eelarve, mis on ehitatud IMU koefitsientidest, iga veaallikas (kiirendusmõõturi nihe, güroskoobi nihe, kiiruse juhuslik kõndimine, nurga juhuslik kõndimine, . Oraakel (sõltumatu etalon) (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), käivitatud eraldi programmina GNU Octave { "8.4.0" } all: vabainertsiaalsed inertsiaalliikumise käivitused sama IMU veaprofiiliga, ühe parandatud numbrilise surnud tsooniga selle kvaterniooni uuenduses (qua_update.m: kaitse, mis käsitles kiirust alla { "1e-8" } rad/s, asendati väljendiga wnorm == { "0" }, rakendatud käitusaegsele koopiale ja kinnitatud, et see sobib üks kord; kaitse olemasolul platvormi aeglaselt triivinud asend külmus ja lõikas

# text
# c1: label
seg-498cb2f96fa7 = MODELLED INS/TRN inertsiaalliikumise veaeelarve. Iga panust levitatakse läbi üheksa olekuga kohaliku horisondi inertsiaalvea mudeli Schuleri tagasisidega (horisontaalne platvorm põhja suunas kindlaksmääratud asukohas, vabainertsiaalne, sealhulgas ebastabiilne vertikaalkanal); selle lühikese inertsiaalliikumise juhtivat järku seadused (nihe t^{ "2" }, güroskoobi nihke kalle t^{ "3" }, kiiruse juhuslik kõndimine t^{ "1.5" }, nurga juhuslik kõndimine t^{ "2.5" }, skaalategur x läbitud vahemaa) on ristkontrollitud (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-63c221a546f7 = INS/TRN inertsiaalliikumise veamudel: asukoha viga sõltuvalt inertsiaalliikumise kestusest, ehitatud IMU koefitsientidest, mitte läbi pühitud eeldatava triivikiirusena. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-164504645f4a = MODELLED: IMU klassi koefitsiendid on esinduslikud vahemikuarvud, mitte andmelehe väärtused, ja maastikufikseeringu jääk on sisend. (liikide kataloog (<c1/>))

# text
seg-ee0281a1f401 = Küsimus, millele see vastab: kui GNSS-i (või ava töötsükliga) uuring ütleb „eeldatakse arvestusnavigatsiooni triivi { "0.001" }–{ "0.050" } m/s“, siis kust see arv tuleb? See tuleb IMU-st ja see stsenaarium arvutab selle välja, mitte ei pühi seda läbi. Viis kasvuliiget — kiirendusmõõturi nihe (t^{ "2" }), güroskoobi nihke kalle gravitatsiooni kaudu (t^{ "3" }), kiiruse juhuslik kõndimine (t^{ "1.5" }), nurga juhuslik kõndimine (t^{ "2.5" }) ja skaalategur korrutatud läbitud vahemaaga (stsenaariumifaili kommentaar, read { "4" } kuni { "11" })

# text
seg-32d4adcfe249 = <s1>Eelmine</s1>inertial

# text
seg-47366ab55be3 = <s1>Järgmine</s1>integrity
