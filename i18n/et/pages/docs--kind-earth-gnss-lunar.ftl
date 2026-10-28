# docs--kind-earth-gnss-lunar: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-59afd80736c5 = <b>PARTNER</b> Ei paku — Kshana modelleerib signaali toimivust, mitte kasulikkoormuse/antenni riistvara. Sõltumatu etalon (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
# c1: docs/kinds/by-kind/earth-gnss-lunar.md
seg-9a399fed06c4 = Allikas: <c1/>

# text
# c1: earth-gnss-lunar
seg-886b3796afaa = <c1/> (stsenaariumi liik)

# text
seg-c8a8be4b8894 = Maa-GNSS-i vastuvõtt Kuu kaugusel, nõrga signaali kiht, mida nimetab konfliktivastupidavuse artikkel ja mille jaoks mootoril mudelit ei olnud. GNSS-i satelliit suunab oma antenni Maa poole; Kuu lähedal olev vastuvõtja asub umbes viisteist korda orbiidi raadiuse kaugusel, nii et kolm asja mõjuvad korraga. Maa PIMENDAB PEATELJE: kaugusel { "26,560" } km katab see { "13.9" } kraadi poolnurga, nii et iga Kuu poole suunduv kiir peab lahkuma saatjast vähemalt selle võrra nadiirist eemal, mis eemaldab kiirgusdiagrammi tipu enne mis tahes võimsuse arvutamist. Järele jääb PEALOOPE SERV JA KÜLGLOOBID, režiim, milles LuGRE kasulikkoormus { "2025" } tegelikult töötas. Ja vabaruumi sumbuvus on L1 juures umbes { "208" } dB, umbes { "25" } dB rohkem kui maapealne kasutaja maksab. Aruanne väljastab ühe rea satelliidi kohta (telje-väline nurk, Maa varjutus, vahemaa, teekadu, saatevõimendus selle nurga all, vastuvõetud võimsus, kandja ja müra tihedus) ja koondab ainult lingid, mis ületavad jälgimislävi. SEE ANNAB TEADA KA TINGITUSE, sest just see määratleb selle kihi: iga nähtav satelliit asub Kuult vaadatuna paarikraadise laiusega koonuse sees, nii et vaatejooned on peaaegu paralleelsed, täpsuse halvenemise tegur on tohutu ning Maa-GNSS-i lahend Kuu kaugusel on palju rohkem AJASTUSE-klassi kui positsiooniklassi vaatlus. MODELLED, ja põhjus on saatemuster: võimendus nurga all on ühtlane ümmargune apertuur (Airy), samas kui tegelik GPS L1 antenn on kaheteistkümne elemendiga heeliksmassiiv kujundatud peaga ja mitte-Airy külglooblitega. Mõõdetud mustrid on olemas ja neid siin kaasatud ei ole, seega järjestused ja suurusjärgud on tähenduslikud, kuid ühegi üksiku satelliidi dB mitte. Tahtlikult PUUDUVAD, igaüks teeb bilansi optimistlikuks: ionosfääri- ega troposfäärikadu piki limbust riivavaid kiiri ei ole, polarisatsiooni-, suunamis- ega teostuskadu ei ole ning sfääriline Maa ilma murdumislaiendita. Kuu asukoht on SISEND (vahemaa pluss inertsiaalsuund), mitte efemeriidi otsing, sest testitav suurus on link ja kiire geomeetria. Selle rea tõstmiseks valideeritud tasemele on vaja mõõdetud saatemustrit ja LuGRE normaalpunkte; kumbagi ei ole hoidlas ja kumbagi ei ole siin välja mõeldud.

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-75b6814c0091 = Ühe <c1/> jooksu kokkuvõte: Maa-GNSS Kuu kaugusel — { "24" } satelliiti, vastuvõtja { "384400" } km Maa limb konstellatsioonist: { "13.90" } kraadi nadiirist eemal — iga Kuu poole suunduv kiir peab seda ületama { "22" } / { "24" } ei ole varjutatud; { "0" } ületab { "25.0" } dB-Hz jälgimislävi ükski link ei jõua lävendini vähem kui kaks jälgitavat linki; nurkhajuvust ei ole millest teatada vähem kui neli jälgitavat linki või singulaarne geomeetria: DOP puudub PÜHKIMINE üle { "64" } epohhi / { "43082" } s: signaali kättesaadavus { "0.375" }, LAHENDI kättesaadavus { "0.000" } jälgitavaid linke keskmiselt { "0.75" }, maks { "2" }; parim C/N0 { "30.93" } dB-Hz; parim PDOP puudub Selle kihi eelhinnanguks tuleb võtta LAHENDI kättesaadavus, mitte signaali kättesaadavus: üks link on kellavaatlus, neli on positsioon. MODELLED: saatevõimendus on ühtlase apertuuri (Airy) asendaja, mitte mõõdetud GPS-i kiir, ning atmosfääri-, polarisatsiooni- ega teostuskadu ei rakendata — seega on siinne bilanss optimistlik. Suurusjärgud ja järjestused on tähenduslikud; üksiku satelliidi dB mitte.

# text
# c1: altitude_km
# c2: inclination_deg
# c3: planes
# c4: sats_per_plane
# c5: phasing_f
# c6: epoch_s
# c7: receiver_range_m
# c8: receiver_ra_deg
# c9: receiver_dec_deg
# c10: tx_power_dbw
# c11: tx_diameter_m
# c12: tx_efficiency
# c13: freq_hz
# c14: rx_gain_dbi
# c15: system_temp_k
# c16: tracking_threshold_dbhz
# c17: back_lobe_suppression_db
# c18: epochs
# c19: span_s
seg-6c0897da2efa = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/earth-gnss-lunar.toml
seg-8c6bb203352d = Näide <c1/> määrab muu hulgas:

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# attr:alt
seg-cf1dce5fc824 = Diagramm, mille mootor kirjutab failile scenarios/earth-gnss-lunar.toml, liik earth-gnss-lunar

# text
seg-04f59a1e2ec2 = <b>MODELLED</b> Maa-GNSS-i vastuvõtt Kuu kaugusel: nõrga signaali kiht, mida nimetab P7 tabel { "1" } ja mille jaoks mootoril mudelit ei olnud.

# text
seg-9531f6b14fc8 = <b>MODELLED</b> Maa-GNSS-i vastuvõtt Kuu kaugusel: nõrga signaali kiht, mida nimetab P7 tabel { "1" } ja mille jaoks mootoril mudelit ei olnud. Satelliidi ja epohhi kohta arvutab see telje-v. Sõltumatu etalon (InternalConsistency): Suletud kujul samasused ja sisemine kooskõla; VÄLIST sõltumatut etaloni EI väideta. Limbi poolnurka kontrollitakse suhte asin(R_earth/r_orbit) vastu ja geomeetriat selle vastu; vabaruumi sumbuvus, DOP-i tuum ja SGP4 levitamine, mida see koondab, on igaüks väliselt valideeritud oma ridades ning see rida ei laena nende staatust. MIKS MODELLED, ja see on saatemuster: võimendus nurga all on ühtlaselt valgustatud

# text
# c1: kshana kinds --json
seg-6dfc5503f58f = MODELLED, ja põhjus on saatemuster: võimendus nurga all on ühtlane ümmargune apertuur (Airy), samas kui tegelik GPS L1 antenn on kaheteistkümne elemendiga heeliksmassiiv kujundatud peaga ja mitte-Airy külglooblitega. (liikide kataloog (<c1/>))

# text
seg-c40d3fd8c12e = MIS ON MODELLED JA MIKS SEE EI OLE VALIDATED Saatevõimendus nurga all on ühtlaselt valgustatud ümmargune apertuur — Airy muster. Tegelik GPS L1 antenn on kaheteistkümne elemendiga heeliksmassiiv, mille mõõdetud mustril on kujundatud pealoop, tahtlikult tipuga telje-välisel, et ühtlustada võimsust üle Maa ketta, ja külglooped, mis ei ole üldse Airy. Mõõdetud mustrid on avaldatud; neid ei ole selles re (stsenaariumifaili kommentaar, read { "29" } kuni { "35" })

# text
seg-01fa469abd95 = Maa-GNSS Kuu kaugusel on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-2fd936b76f4a = <s1>Eelmine</s1>contact-schedule

# text
seg-95a5aa0adeb3 = <s1>Järgmine</s1>entry-heating

seg-a349aa76b0ed = PARTNER
