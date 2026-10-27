# docs--kind-inertial: translations (et)

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-98151954f217 = false

# text
seg-be831b52a339 = ja veel { "4" } maatriksis.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

# text
seg-cc7a61264c3f = (m/s^{ "2" })^2/s

# text
seg-451a304052c4 = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN). Oraakel (sõltumatu etalon) (ExternalDataset): Avaldatud CAI esmaartiklite arvvektorid (Cheineti { "2008" } ülekandefunktsioon; Petersi/Freieri tundlikkus): k_eff·T² ühtib täpselt, footonimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (päris seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Vahemik, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), tulemus (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. vastu.

# text
seg-7e95210bcc48 = <b>MODELLED</b> Koostatud nihke + skaalateguri + VRW + stabiilsuse hääbumise positsioonieelarve holdover-i jooksul. Oraakel (sõltumatu etalon) (ReferenceImpl): Sõltumatu numpy Monte Carlo SDE integreerimine topeltintegreeritud valge kiirenduse müra jaoks (valideerib analüütilise VRW dispersiooni tõeliselt sõltumatu algoritmiga) + Grovesi { "2013" } avaldatud väärtuse ankur nihke/skaalateguri liikmete jaoks; CAI seadme arvud kvantifitseerivad partneri riistvara ja jäävad MODELLED

# text
seg-9955b1b1c018 = Kvantinertsiaalsensori toimivus on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-5fef5e8cc64e = Kvantinertsiaalse kursiarvestuse vastupidavus on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — testitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
seg-ca448daf5ec7 = nominaalne

# text
seg-496b17a8d3b9 = Teemaleht: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Teemaleht: <a1>QUANTUM.md</a1>

# text
seg-7bebd09c614b = Navigatsiooniklassi kvartsakseleromeeter (Honeywell QA-2000 / G

# text
# c1: docs/kinds/by-kind/inertial.md
seg-cead54058894 = Allikas: <c1/>

# text
# c1: inertial
seg-783be547f01e = <c1/> (stsenaariumi liik)

# text
seg-bdedf28adc48 = 1-DOF inertsiaalne kursiarvestus GNSS-i katkestuse ajal.

# text
# c1: scenarios/imu-deadreckoning.toml
seg-55b5599ef867 = Ühe <c1/> jooksu kokkuvõte: scenario fc9191cef784 | kvant-holdover 6600s p95 41.39m | klassikaline holdover 350s p95 30629.9m

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: accel_quantum
# c6: accel_classical
seg-b05c3cb45c0d = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: runs
seg-94fd9afe6f30 = Valikulised väljad: <c1/>

# text
# c1: scenarios/imu-deadreckoning.toml
seg-bd021b5dff80 = Näide <c1/> määrab muu hulgas:

# text
seg-8a9e52e38b05 = Exail hübriidne kvantakseleromeetri kolmik: nihke stabiilsus 6e-

# attr:alt
seg-873c402bb724 = Diagramm, mille mootor kirjutab failile scenarios/imu-deadreckoning.toml, liik inertial

# text
seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-41f3a20fadfb = <b>VALIDATED</b> Kvaternioonasendiga, WGS-84 NED inertsiaalnavigatsiooni mehhaniseering (koonuse/sõudmise kompenseeritud), mis ekstrapoleerib navigatsiooniolekut (Δθ, Δv) juurdekasvudest Testid: <a1>classical_strapdown_ins_reference.rs</a1>.

# text
seg-102d2e51460e = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN) Testid: <a1>quantum_inertial_sensor_reference.rs</a1>.

# text
seg-83fa50d4859a = <b>MODELLED</b> Mach–Zehnderi triibumitmetähenduslikkuse dünaamiline ulatus: 2π-perioodiline triibu väljalugemine määrab maksimaalse üheselt mõistetava erijõu a_max=π/(k_eff·T²) ning üheselt mõistetav ulatus eraldusrakkudes a_max/σ_a=π/σ_Φ on sõltumatu optilisest skaalateguri

# text
seg-89ec2e65cf4f = <b>MODELLED</b> Koostatud nihke + skaalateguri + VRW + stabiilsuse hääbumise positsioonieelarve holdover-i jooksul Testid: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

# text
seg-bb07c8ee153f = <b>PARTNER</b> Ei paku — ainult toimivusmudelid; külmaatomi/kella riistvara on partneri oma. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-fab4c926e628 = <s1>Eelmine</s1>impairment-eval

# text
seg-aa783749183d = <s1>Järgmine</s1>ins-trn-coast
