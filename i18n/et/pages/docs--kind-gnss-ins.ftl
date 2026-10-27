# docs--kind-gnss-ins: translations (et)

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-ee7dd15019d0 = Teemaleht: <a1>CAMPAIGNS.md</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN). Oraakel (sõltumatu etalon) (ExternalDataset): Avaldatud CAI esmaartiklite arvvektorid (Cheineti { "2008" } ülekandefunktsioon; Petersi/Freieri tundlikkus): k_eff·T² ühtib täpselt, footonimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (päris seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Vahemik, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), tulemus (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. vastu.

# text
seg-9955b1b1c018 = Kvantinertsiaalsensori toimivus on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
# c1: docs/kinds/by-kind/gnss-ins.md
seg-fd8fad481c81 = Allikas: <c1/>

# text
# c1: gnss-ins
seg-e726a6d74d81 = <c1/> (stsenaariumi liik)

# text
seg-38df285a3f25 = Lõdvalt ja tihedalt seotud GNSS/INS veaoleku EKF.

# text
# c1: scenarios/gnss-ins.toml
seg-e1e235215947 = Ühe <c1/> jooksu kokkuvõte: scenario c55a6246bd6f | gnss-ins | kvant katkestuse RMS fused 1.9m vs vaba 130.7m (hold 60s, kättesaadavus { "1.00" }) | klassikaline fused 3.1m vs vaba 314.3m (hold 60s, kättesaadavus { "1.00" })

# text
# c1: seed
# c2: threshold_m
# c3: time
# c4: gnss
# c5: imu_quantum
# c6: imu_classical
seg-e3112eac77af = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

# text
# c1: fix_interval_s
# c2: sigma_pos_m
# c3: sigma_vel_mps
# c4: lat_deg
# c5: lon_deg
# c6: alt_m
# c7: trajectory
# c8: tight
seg-6c128eb60a91 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/gnss-ins.toml
seg-79c75d3e461d = Näide <c1/> määrab muu hulgas:

# text
seg-ca448daf5ec7 = nominaalne

# text
seg-49f2fa051719 = keelatud

# text
seg-327a2c4885bd = Taktikalise klassi MEMS/kvarts inertsiaalmoodul: suurem jääk-bi

# text
# c1: scenarios/
seg-d1beb62cf742 = { "6" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# attr:alt
seg-7d993b676006 = Diagramm, mille mootor kirjutab failile scenarios/gnss-ins.toml, liik gnss-ins

# text
seg-ea4498cc0324 = <b>VALIDATED</b> 15-olekuline veaoleku EKF, lõdvalt seotud (valideeritud päris IMU/GNSS sõidul NaveGo vastu); tihedalt seotud pseudovahemaa/Doppleri UKF ja seotud kell+pos. Oraakel (sõltumatu etalon) (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, jooksutatud tööriistana GNU Octave'is, mitte kunagi lingitud): selle lõdvalt seotud ins_gnss oma päris Ekinox IMU/GNSS maismaasõiduki sõidul, mõlemad lahendid hinnatud Ekinoxi etalontrajektoori vastu. Mõlemad filtrid loevad sama { "20" } Hz float32 sisendit ja Kshana konfiguratsioon on kaardistatud mehaaniliselt andmestiku avaldatud parameetritest. Kshana horisontaalne ja vertikaalne positsiooni RMS ning selle

# text
seg-742a29ca1fb7 = Teemaleht: <a1>TEST-BENCH.md</a1>

# text
seg-f3cc3d82aba8 = <s1>Eelmine</s1>fusion

# text
seg-af503aa1d900 = <s1>Järgmine</s1>gnss-sim
