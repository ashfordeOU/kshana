# docs--kind-hybrid-ukf: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-451a304052c4 = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN). Sõltumatu etalon (ExternalDataset): Avaldatud CAI esmaartiklite arvvektorid (Cheineti { "2008" } ülekandefunktsioon; Petersi/Freieri tundlikkus): k_eff·T² ühtib täpselt, footonimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (päris seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Vahemik, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), tulemus (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. vastu.

# text
seg-9955b1b1c018 = Kvantinertsiaalsensori toimivus on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
seg-ea4498cc0324 = <b>VALIDATED</b> 15-olekuline veaoleku EKF, lõdvalt seotud (valideeritud päris IMU/GNSS sõidul NaveGo vastu); tihedalt seotud pseudovahemaa/Doppleri UKF ja seotud kell+pos. Sõltumatu etalon (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, jooksutatud tööriistana GNU Octave'is, mitte kunagi lingitud): selle lõdvalt seotud ins_gnss oma päris Ekinox IMU/GNSS maismaasõiduki sõidul, mõlemad lahendid hinnatud Ekinoxi etalontrajektoori vastu. Mõlemad filtrid loevad sama { "20" } Hz float32 sisendit ja Kshana konfiguratsioon on kaardistatud mehaaniliselt andmestiku avaldatud parameetritest. Kshana horisontaalne ja vertikaalne positsiooni RMS ning selle

# text
# c1: docs/kinds/by-kind/hybrid-ukf.md
seg-4b84d9846715 = Allikas: <c1/>

# text
# c1: hybrid-ukf
seg-d8da1a3f1798 = <c1/> (stsenaariumi liik)

# text
seg-c6edf89eb8d4 = 17-olekuline hübriidne kvant+klassikaline tihedalt seotud GNSS/INS UKF (MODELLED): { "15" } INS-i veaolekut + CAI-st tuletatud kiirendusnihke korrektsioon + 2-olekuline (faas+sagedus) kell q-parameetri kellamootorist, mida juhib piiritletud CAI veamudel. Kvaliteedinäitaja on filtri sisemine kooskõla (NEES + innovatsiooni valgeus vs χ² piirid) — sisemise kooskõla väide, MITTE reaalmaailma täpsuse garantii. Ainult simulatsioon; TRL>{ "3" } ei ole, lennupärandit ei ole, välist valideerimist ei ole.

# text
# c1: scenarios/hybrid-ukf.toml
seg-d43a562eb9c2 = Ühe <c1/> jooksu kokkuvõte: scenario e8be19a6199e | hybrid-ukf (17 olekut, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | kell q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 vahemikus [10.12,{ "14.04" }] | NEES 7.11/8 vahemikus [6.48,{ "9.68" }] | CONSISTENT | toetatud 0.4m -> libisemine 7.7m 120s jooksul | sisemine kooskõla, mitte täpsus

# text
# c1: seed
# c2: time
# c3: gnss
# c4: accel
# c5: clock
seg-be1b25b8551d = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: residual_accel_bias_m_s2
# c2: speed_m_s
# c3: sigma_pr_m
# c4: sigma_rr_mps
# c5: consistency_seeds
# c6: q_factor
# c7: r_factor
seg-139800576fb7 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/hybrid-ukf.toml
seg-40773fa1ab5f = Näide <c1/> määrab muu hulgas:

# text
seg-5e9c8b22ed24 = Külmaatomi (Rb-87 D2) interferomeetriline akseleromeeter; piiritle

# text
seg-4c8e2caeba5b = Ülistabiilne/optiline pardaostsillaatori klass, valge-FM sigm

# attr:alt
seg-2968660fa880 = Diagramm, mille mootor kirjutab failile scenarios/hybrid-ukf.toml, liik hybrid-ukf

# text
seg-5719161d0b2a = <b>MODELLED</b> Piiritletud (parim/nominaalne/konservatiivne) külmaatomi-interferomeetri toimivus — nihke ebastabiilsus, kiiruse/nurga juhuslik ekslemine, skaalateguri stabiilsus, küsitlus. Sõltumatu etalon (InternalConsistency): Sisemine kooskõla: viidatud VRW piirang, mida on risttõendatud CaiAccelerometer::accel_asd füüsika ja triibumitmetähenduslikkuse piirist arvutatud toore dünaamilise ulatusega; arvud on MODELLED kirjanduse ülevaate piirangud (needs_source_confirmation), ühtegi seadet ei ole valideeritud, valideerimise halo puudub

# text
# c1: modelled_note
seg-8632967dc5f8 = MODELLED SIMULATSIOON. Filtri sisemine kooskõla (NEES + innovatsiooni valgeus) piiritletud CAI ja kella müra sisendite all — sisemise kooskõla väide, MITTE reaalmaailma täpsuse garantii. Mitte välja-/lennutulemused; TRL>{ "3" } ei ole, lennupärandit ei ole, välist valideerimist ei ole. CAI riistvara kuulub partnerile. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-e55c8e2bc619 = 17-olekuline hübriidne kvant+klassikaline tihedalt seotud GNSS/INS UKF (MODELLED): { "15" } INS-i veaolekut + CAI-st tuletatud kiirendusnihke korrektsioon + 2-olekuline (faas+sagedus) kell q-parameetri kellamootorist, mida juhib piiritletud CAI veamudel. (liikide kataloog (<c1/>))

# text
seg-b06538ca3a8c = 17-olekuline hübriidne kvant + klassikaline tihedalt seotud GNSS/INS UKF (MODELLED). (stsenaariumifaili kommentaar, rida { "1" })

# text
seg-b5fc96916b4e = KVALITEEDINÄITAJA — filtri sisemine kooskõla (NEES + innovatsiooni valgeus), ainus, mida simulatsioon saab hindaja kohta ausalt väita. Monte Carlo ansambli üle, mille tõde on genereeritud täpselt filtri eeldatud müraga, peavad ühendatud NIS-i (valgeus) ja NEES-i keskmised jääma oma { "95" }% hii-ruut vahemikesse. See on SISEMISE KOOSKÕLA väide, MITTE reaalmaailma täpsuse garantii. (stsenaariumifaili kommentaar, read { "21" } kuni { "25" })

# text
seg-91afdc2d3ee2 = AUSUS: kõik siin on MODELLED / SIMULATSIOON. CAI ja kella sisendid on piiritletud, kirjandust esindavad väärtused, mitte mõõdetud riistvara; CAI riistvara ja selle Key-Person jäävad partneri omaks. TRL>{ "3" } ei ole, lennupärandit ei ole, välist valideerimist ei ole. (stsenaariumifaili kommentaar, read { "27" } kuni { "29" })

# text
seg-9b94bd3ce7df = Monte Carlo algväärtused (seed), mille üle sisemise kooskõla sõltumatu etalon koondab, ja filtri väärhäälestuse kordajad. { "24" } algväärtust (seed) annavad jooksupõhised hii-ruut NEES-i vahemikud ({ "8" }*{ "24" } DOF), mis on piisavalt kitsad, et eristada sobitatud filtrit väärhäälestatud filtrist, hoides jooksu odavana. Seades q_factor / r_factor väärtusest { "1.0" } eemale, saab filtrit väärhäälestada ja jälgida, kuidas kooskõlaväravas see tagasi lükatakse (q_factor skaleerib eeldatud protsessimüra, r_factor eeldatud mõõtmismüra (stsenaariumifaili kommentaar, read { "44" } kuni { "48" })

# text
seg-496b17a8d3b9 = Teemaleht: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Teemaleht: <a1>QUANTUM.md</a1>

# text
seg-963425965e64 = <s1>Eelmine</s1>hybrid-optical-rf

# text
seg-437eb2e463b3 = <s1>Järgmine</s1>hybrid
