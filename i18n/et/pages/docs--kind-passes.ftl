# docs--kind-passes: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
seg-0f4c2ab525ac = <b>MODELLED</b> Allalingi Es/N0 piki iga ühe satelliidi läbilendu ühe jaama kohal (EIRP, vabaruumi sumbuvus, kosekansi-seadusel põhinev atmosfäärisumbuvus, muud kaod, G/T, Boltzmanni konstant, sümbolkiirus), kõige tõhusam DVB-S2 MODCOD, mis ületab oma ETSI EN { "302" } 307-

# text
seg-72fd0321e4af = Teemaleht: <a1>CONTACT-SCHEDULING.md</a1>

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
seg-4636d450ef60 = <b>MODELLED</b> Üks jooks võtab kontaktiplaani (aos_s/los_s akende loend, millest igaüks küsib apertuurilt navigatsiooni või sidet — sama akende sõnavara, mida annab <c1/>, teisendatud funktsiooniga <c2/>), apertuuri

# text
seg-11e8c29ecb45 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-a4f1e7d2041e = Perekonna leht: <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>

# text
seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-df90e5910fb4 = h

# text
# c1: docs/kinds/by-kind/passes.md
seg-2544da673115 = Allikas: <c1/>

# text
# c1: passes
seg-0db3f4e2402e = <c1/> (stsenaariumi liik)

# text
seg-a4bdfc291fce = Maajaama läbimiste ennustus: ringorbiidi ajaplaanilised nähtavusläbimised (AOS/TCA/LOS, maksimaalne näiv tõusunurk, kestus), SGP4 keskmiste elementidena akna alguses, jaama kohal üle tõusunurga maski kogu akna jooksul, koos kogu juurdepääsuajaga. SGP4/SDP4 propageerimine IAU 2006/2000A Maaga seotud tugisüsteemis (valikuline UT1 - UTC ja poolusliikumine), ITU-R P.834-9 troposfääri murdumine ja allalingi valguse levimisaeg (mõlemad vaikimisi sees), ületused lahendatud täpsusega { "1e-7" } s ja kulminatsioon kuldlõike otsinguga. Läbimise geomeetria on VALIDATED Orekit { "13.1.8" } vastu merepinna kõrgusel asuvates jaamades; stsenaariumi orbiit ja jaam on illustratiivsed sisendid.

# text
# c1: scenarios/passes.toml
seg-3050cc7fdc79 = Ühe <c1/> käivituse kokkuvõte: passes: { "5" } läbimist { "550" } km / { "97.6" }° orbiidil punkti ({ "52.2" }°, { "4.4" }°) kohal > { "10" }° { "24" } h jooksul; { "1659" } s kogu juurdepääsu (MODELLED)

# text
# c1: altitude_km
# c2: inclination_deg
# c3: raan_deg
# c4: arg_lat_deg
# c5: station_lat_deg
# c6: station_lon_deg
# c7: station_alt_m
# c8: epoch
# c9: mask_deg
# c10: duration_hours
# c11: step_s
# c12: refraction
# c13: light_time
# c14: ut1_minus_utc_s
# c15: xp_arcsec
# c16: yp_arcsec
seg-699b650604d4 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

# text
# c1: scenarios/passes.toml
seg-9d2941ba37e2 = Näide <c1/> määrab muu hulgas:

# text
seg-6f849331e33c = Tulemuse silt (mootori oma): MODELLED — ajaplaaniline maajaama läbimiste ennustus; SGP4/SDP4 propageerimine, IAU 2006/2000A Maaga seotud tugisüsteem (UT1 = UTC, poolusliikumist pole, kui Maa orientatsiooniparameetreid ei anta), näiv tõusunurk ITU-R P.834-9 murdumise ja valguse levimisajaga sisselülitatuna, ületused ja kulminatsioon täpsustatud

# attr:alt
seg-a09be8c586e3 = Diagramm, mille mootor kirjutab failile scenarios/passes.toml, liik passes

# text
seg-db35e4ebd275 = <b>VALIDATED</b> Mootori propageerija ajaplaanilised nähtavusläbimised (AOS/TCA/LOS, maksimaalne tõusunurk, kestus) jaama kohal üle tõusunurga maski, interpoleeritud tõusu-/loojanguületustega ja kogu juurdepääsuga: passes::predict_passes, geomeetriline planeerija (ilma Testid: <a1>ground_station_pass_prediction_reference.rs</a1>.

# text
seg-6799a54acee6 = <b>VALIDATED</b> SGP4 elemendikomplekti nähtavusläbimised (AOS, TCA, LOS, maksimaalne näiv tõusunurk, kestus) WGS-84 jaama kohal valideeritud Maa orbiidi rajal (IAU 2006/2000A, valikulised Maa orientatsiooniparameetrid), koos ITU-R P.834-9 troposfääri Testid: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

# text
seg-42d4290ed718 = <b>VALIDATED</b> Mootori propageerija ajaplaanilised nähtavusläbimised (AOS/TCA/LOS, maksimaalne tõusunurk, kestus) jaama kohal üle tõusunurga maski, interpoleeritud tõusu-/loojanguga . Sõltumatu etalon (sõltumatu etalon; ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — sõltumatu lennudünaamika teek: ElevationDetector (Brenti juureleidja) + EventsLogger ITRF-efemeriidi kohal, jaam WGS-84 TopocentricFrame'ina. AOS/LOS/maksimaalne tõusunurk/läbimiste arv/kogu juurdepääs ühtisid identse orbiidi+jaama+maski+akna korral (kinnistatud testandmestik; draiver xval/orekit-passes)

# text
# c1: label
seg-eb79c117f1df = MODELLED — ajaplaaniline maajaama läbimiste ennustus; SGP4/SDP4 propageerimine, IAU 2006/2000A Maaga seotud tugisüsteem (UT1 = UTC, poolusliikumist pole, kui Maa orientatsiooniparameetreid ei anta), näiv tõusunurk ITU-R P.834-9 murdumise ja valguse levimisajaga sisselülitatuna, ületused ja kulminatsioon täpsustatud alla sammu (tulemus <c1/>)

# text
seg-a7ddc8eeaf1e = <s1>Eelmine</s1>orbit

# text
seg-3079cfb8decc = <s1>Järgmine</s1>pvt
