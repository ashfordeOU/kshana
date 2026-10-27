# docs--kinds-inertial-fusion-and-quantum-sensors: translations (et)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Liik

# text
seg-ec26df467b88 = Ühine Kalmani sensorite liitmise PNT samade hübriidsisendite üle.

# attr:alt
seg-c8a1c797f4b1 = Diagramm, mille mootor kirjutab failile scenarios/fusion-pnt.toml, liik fusion

# text
seg-38df285a3f25 = Lõdvalt ja tihedalt seotud GNSS/INS veaoleku EKF.

# attr:alt
seg-7d993b676006 = Diagramm, mille mootor kirjutab failile scenarios/gnss-ins.toml, liik gnss-ins

# text
seg-c6edf89eb8d4 = 17-olekuline hübriidne kvant+klassikaline tihedalt seotud GNSS/INS UKF (MODELLED): { "15" } INS-i veaolekut + CAI-st tuletatud kiirendusnihke korrektsioon + 2-olekuline (faas+sagedus) kell q-parameetri kellamootorist, mida juhib piiritletud CAI veamudel. Kvaliteedinäitaja on filtri sisemine kooskõla (NEES + innovatsiooni valgeus vs χ² piirid) — sisemise kooskõla väide, MITTE reaalmaailma täpsuse garantii. Ainult simulatsioon; TRL>{ "3" } ei ole, lennupärandit ei ole, välist valideerimist ei ole.

# attr:alt
seg-2968660fa880 = Diagramm, mille mootor kirjutab failile scenarios/hybrid-ukf.toml, liik hybrid-ukf

# text
seg-22cd963c7042 = Hübriidne PNT-i tippsaavutus: kell + IMU + aja edastamise toetus.

# attr:alt
seg-52378a7b074c = Diagramm, mille mootor kirjutab failile scenarios/hybrid-pnt.toml, liik hybrid

# text
seg-bdedf28adc48 = 1-DOF inertsiaalne kursiarvestus GNSS-i katkestuse ajal.

# attr:alt
seg-873c402bb724 = Diagramm, mille mootor kirjutab failile scenarios/imu-deadreckoning.toml, liik inertial

# text
seg-5b9a6efe6337 = INS/TRN inertsiaalliikumise veamudel: asukoha viga sõltuvalt inertsiaalliikumise kestusest, ehitatud IMU koefitsientidest, mitte läbi pühitud eeldatava triivikiirusena. Viis kasvupanust — kiirendusmõõturi nihe, güroskoobi nihke kalle gravitatsiooni kaudu, kiiruse juhuslik kõndimine, nurga juhuslik kõndimine ja läbitud vahemaaga seotud skaalategur — kõiki levitatakse läbi üheksa olekuga kohaliku horisondi inertsiaalvea mudeli Schuleri tagasisidega kindlaksmääratud laiuskraadil ja kõrgusel (lühikese inertsiaalliikumise juhtivat järku seadused t², t³, t^{ "1.5" }, t^{ "2.5" } ja t¹/t² esitatakse selle kõrval) ning ühendatakse SELGESTI ÜTLEDUD reegli alusel (vaikimisi ruutude summa ruutjuur, või lineaarsumma, või deterministlik summa koos stohhastilise rss-iga; kõik kolm arvutatakse igal käivitusel, et valik oleks nähtav, mitte peidetud). Inertsiaalliikumise kestused, mis jõuavad kutsuja antud asukohalävedeni (vaikimisi { "10" } m ja { "50" } m), leitakse mootori olemasoleva poolitusmeetodiga, igaühe juures panuste kaupa lahutus, mis nimetab domineeriva allika, ning iga üksiku panuse ületus pööratakse lisaks algebraliselt ümber, et mõlemad lahendused ühtiksid. Maastikusuhtelise navigatsiooni režiim piirab inertsiaalliikumist perioodiliste asukohafikseerimistega ja esitab suurima fikseerimisintervalli, mis iga läve hoiab; ainult asukohta sisaldav fikseering jätab kiiruse vea ja kalde fikseeringu üle elama, mistõttu see ei piira inertsiaalliikumist alati ühegi fikseerimissageduse korral, ja aruanne ütleb seda välja, mitte ei anna nulli. MODELLED: IMU klassi koefitsiendid on esinduslikud vahemikuarvud, mitte andmelehe väärtused, ja maastikufikseeringu jääk on sisend. Saavutamata lävi esitatakse väärtusega null ja olekuga, mitte kunagi nullina. Mitte sertifitseeritud inertsiaalnavigatsiooni toimivustoode.

# attr:alt
seg-134a4c91da3a = Mootori joonistatud diagramm failile scenarios/ins-trn-coast.toml, liik ins-trn-coast

# text
seg-04310cd6cbec = MODELLED rikete/anomaaliate tuvastamine kvant-PNT-süsteemides: sildistatud rikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; anduri nihkeastang/väljalangemine), tuvastusstatistiku ROC AUC (bootstrap-usaldusvahemikuga väliselt valideeritud eval_stats-ist) ja minimaalne tuvastatav rike fikseeritud valehäire määra juures, kusjuures kvantkellaga toetatud monitor (väiksema müraga) tuvastab väiksemaid rikkeid — ausa TradeEvidence'ina + esinduslikkusena. Gaussi tuvastusstatistiku mudel (AUC = Phi(mu/(sigma*sqrt2))); mudeldab klassi, illustratiivsed avaliku allika parameetrid, TRL-i/lennutõendit/sertifitseerimist ei ole.

# attr:alt
seg-2f1d14239d1a = Diagramm, mille mootor kirjutab failile scenarios/quantum-anomaly-detect.toml, liik quantum-anomaly-detect

# text
seg-790fbfdd80f0 = MODELLED GNSS-ita kvantnavigatsioon: GNSS-i katkestuse ajal kvant- (külmaatomi interferomeeter) inertsiaalne eelarve vs klassikaline navigatsioonitaseme INS — asukohavea kasv libisemisperioodi jooksul, holdover asukohalävendini ja kvant-vs-klassikaline kompromiss ausa TradeEvidence'ina koos esinduslikkusega. Aus jälgitavuse märkus: välise määranguta ei ole kiirendusmõõturi nihe jälgitav, mistõttu viga kasvab; kvantandur aeglustab seda, kuid ei sulge lõhet. Illustratiivsed avaliku allika seadme parameetrid; mudeldab klassi, TRL-i/lennutõendit/sertifitseerimist ei ole.

# attr:alt
seg-1bdbf1a737b2 = Diagramm, mille mootor kirjutab failile scenarios/quantum-gnss-free-nav.toml, liik quantum-gnss-free-nav

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Kvant-vs-klassikaline PNT kompromiss ({ "13503" }): kandidaatkella ajastuse-holdover-i + inertsiaalse holdover-i kasu (mõõdetud ADEV kõver — kaitstavuse hingedetail — või kvantkella klass) vs klassikaline lähteklass, kusjuures pika tau põhjataseme eelduse hoiatus kantakse artefaktil kaasa, pluss GNSS-ita vastupidavuse-ajas ümbris. MODELLED; kvantifitseerib (mitte kunagi ei valideeri) partneri seadet. Kandidaatkell on mõõdetud kõver (<c1/> + <c2/>, võrdse pikkusega, vähemalt { "2" } punkti; mõlema vormi andmisel see võidab) või <c3/>.

# attr:alt
seg-c74c63ffd859 = Diagramm, mille mootor kirjutab failile scenarios/quantum-trade.toml, liik quantum-trade

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-9095869ec445 = { "9" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-efd15cff3d32 = MODELLED (tulemuse silt)

# text
seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/inertial-fusion-and-quantum-sensors.md
seg-e6f2ab1647e2 = Source: <c1/>

# text
seg-23762f3a250b = Inertsiaal-, liitmis- ja kvantandurid (stsenaariumi liikide perekond)

# text
# c1: kshana scenarios/gnss-ins.toml
seg-6ec3ad751007 = Teemalehed: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Käivita üks: <c1/>. Kõik perekonnad: <a4>KINDS.md</a4>.

# attr:alt
seg-0e73a37b716b = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Inertsiaal-, liitmis- ja kvantandurid liikide jaoks

# text
seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

# text
seg-084cf4eeccb5 = 17-olekuline hübriid kvant+klassikaline tihedalt seotud GNSS/INS UKF (MODELLED): { "15" } INS-i veaolekut + CAI-st tuletatud kiirendusmõõturi nihke korrektsioon + 2-olekuline (faas+sagedus) kell q-parameetri kellamootorist

# text
seg-a7d3c32b29b3 = INS/TRN libisemisvea mudel: asukohaviga libisemise kestuse suhtes, ehitatud IMU koefitsientidest, mitte pühitud eeldatud triivikiirusena.

# text
seg-beb568dec44f = MODELLED GNSS-ita kvantnavigatsioon: GNSS-i katkestuse ajal kvant- (külmaatomi interferomeeter) inertsiaalne eelarve vs klassikaline navigatsioonitaseme INS — asukohavea kasv libisemisperioodi jooksul, holdover

# text
seg-d948ea4d1f33 = MODELLED rikete/anomaaliate tuvastamine kvant-PNT-süsteemides: sildistatud rikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; anduri nihkeastang/väljalangemine), tuvastusstatistiku ROC AUC (bootstrap-usaldusvahemikuga

# text
seg-48e72d451a50 = Kvant-vs-klassikaline PNT kompromiss ({ "13503" }): kandidaatkella ajastuse-holdover-i + inertsiaalse holdover-i kasu (mõõdetud ADEV kõver — kaitstavuse hingedetail — või kvantkella klass) vs klassikaline lähte

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
# c7: runs
seg-5330b47bc0b6 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valikulised: <c7/>.

# text
seg-75867e8b4b4f = <b>Register (ledger):</b> MODELLED { "6" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>inertial</a1>.

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
seg-fdf140d4ce68 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

# text
seg-44c6371da5f9 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>hybrid</a1>.

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
seg-3246c9e1e0cb = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Valikulised: <c11/>.

# text
seg-e2bd8fd0d9e5 = <b>Register (ledger):</b> MODELLED { "4" } · VALIDATED { "4" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>fusion</a1>.

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
seg-d0790a2643ae = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Valikulised: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

# text
seg-85ab600e3050 = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>hybrid-ukf</a1>.

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
seg-3bbd5ce09bee = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valikulised: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

# text
seg-08ad3969f65b = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>gnss-ins</a1>.

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
seg-1703619ca20e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

# text
seg-ab3453d1ee51 = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>ins-trn-coast</a1>.

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-a77cdf6e8e31 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-b05e96ce392d = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>quantum-gnss-free-nav</a1>.

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-3f3e48045d31 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-cbefb1538dec = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>quantum-anomaly-detect</a1>.

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
# c5: baseline_ins
# c6: candidate_ins
# c7: resilience_times_s
# c8: alt_pnt_bound_m
seg-6eee03151521 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>. Valikulised: <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-6cb57dc94549 = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>quantum-trade</a1>.

# text
seg-b6c31bdda166 = <s1>Eelmine</s1>GPS-ita alternatiivne PNT

# text
seg-0585e4ae329e = <s1>Järgmine</s1>Segamine, spuufimine ja spekter
