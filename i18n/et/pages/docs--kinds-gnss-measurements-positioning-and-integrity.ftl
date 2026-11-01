# docs--kinds-gnss-measurements-positioning-and-integrity: translations (et)

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-b03d56f501c3 = Liik

# text
# c1: published
seg-06197409c717 = Avaldatud ARAIM-i sertifitseerimise etalonvektorid: mootori ARAIM-i horisontaalne ja vertikaalne kaitsetase käivitatud WG-C ARAIM-i tehnilise alamrühma ENDA läbitöötatud arvnäidete vastu, tolerantsiga (TOL_PL = { "5e-2" } m), mille need dokumendid ise väidavad. Kaks vektorit on kaasatud fikseeritud andmetena, millest kumbki kannab oma hankimise URL-i, hankimise kuupäeva, lähtefaili SHA-256 ja lehekülge: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) lisa D — sisemiselt kooskõlaline ja vastuvõtuvektor — ning Milestone { "3" } Report ({ "2016" }) lisa A jaotis A.IX, väide, mida uurimisbibliograafiad tsiteerivad. Iga avaldatud sisend (10 satelliidi ja 2 satelliidikonstellatsiooni geomeetriamaatriks, C_int ja C_acc dispersioonidiagonaalid, b_nom, P_sat, P_const ja LPV-200 konstantide komplekt) ja iga avaldatud väljund (VPL, HPL, EMT, sigma_v_acc, K_fa_3 ning kahe konstellatsiooniriketerežiimi sigma_3, sigma_ss_3 ja b_3) on esitatud mootori enda arvu ja nende absoluutse erinevuse kõrval. Kaitsetaseme võrrandit EI lahendata siin uuesti: etaloni režiimide loend antakse mootori olemasolevale funktsioonile raim::araim_protection_level / araim_integrity_risk, nii et katsetatav poolitamine ja Gaussi sabaalgebra on mootori enda; selle jaoks on ehitatud ainult geomeetria, alamlahendid, tuvastuslävendid ja avaldatud eelarvejaotus. VÄLISELT KONTROLLITUD { "2019" } vektori vastu: VPL { "18.2926" } m vs avaldatud { "18.3" } m, HPL { "13.4063" } m vs { "13.45" } m, EMT { "7.2997" } m vs { "7.2998" } m, sigma_v_acc { "1.3694" } m vs { "1.3694" } m ning kõik kuus avaldatud vahetulemust poole ühiku täpsusega viimases trükitud kümnendkohas. { "2016" } vektor sisaldab kaht sisemist viga, mida aruanne ütleb välja, mitte ei peida — märgitrükiviga G reas { "3" } ja K_fa_3, mis on hinnatud { "57" } rikkerežiimi juures, kuigi dokument ütleb N_fault_max = { "1" } ({ "12" } režiimi) — seega selle geomeetria vahetulemused taastuvad täpselt, kuid selle kaitsetasemed on esitatud mõõdetud lahknevustena ja jäetud vastuvõtunäitajast välja; tolerantsi ei laiendata kunagi neid neelamaks. Iga väljastatud arvväli kannab ühikut ja päritoluklassi ning ümberkirjutatud arv on märgitud <c1/>, et seda ei saaks kunagi arvutatuga segi ajada. ULATUS: realiseeritud on ainult N_fault_max = { "1" } (üksiksatelliidi ja üksikkonstellatsiooni rikkerežiimid) ning juhtum, mille eelhinnangud nõuavad üheaegseid mitmesündmuselisi rikkealamhulki, on REFUSED, mitte vaikselt kärbitud; rikke tuvastamine, välistamine, hii-ruut kooskõlakontroll ja etalonalgoritmi topeltarvestuse ümberjaotamise samm on ulatusest väljas. See reprodutseerib avaldatud etalonalgoritmi läbitöötatud näidet — see ei ole sertifikaat, lennukõlblikkuse artefakt ega kinnitus.

# attr:alt
seg-693c823c85d1 = Diagramm, mille mootor kirjutab failile scenarios/araim-reference-check.toml, liik araim-reference-check

# text
seg-2ffccc9c1eff = Mõõtmispiirkonna pseudovahemaa simulatsioon (Klobuchari ionosfäär, Saastamoineni/Niell'i troposfäär) + RAIM.

# attr:alt
seg-47ee40d4eb73 = Diagramm, mille mootor kirjutab failile scenarios/gnss-sim-raim.toml, liik gnss-sim

# text
seg-eb7e0c2feb2b = Hetktõmmise / lahenduste eraldamise / ARAIM RAIM koos HPL/VPL-iga ja Stanfordi diagrammiga.

# attr:alt
seg-ce7f6130ddee = Mootori joonistatud diagramm failile scenarios/integrity-raim.toml, liik integrity

# text
seg-b7b67e03f125 = Reaalsete vaatluste ühepunktpositsioneerimine: vastuvõtja asukoha lahendamine RINEX { "3" } vaatlusfailist ja ringhäälestatud navigatsioonifailist (koodipseudovahemaad, ringhäälestatud efemeriid, Klobuchari ionosfäär, Saastamoineni/Niell'i troposfäär), soovi korral valideeritud mõõdistatud koordinaadi vastu.

# attr:alt
seg-d76d59644d84 = Diagramm, mille mootor kirjutab failile scenarios/pvt-abmf.toml, liik pvt

# text
seg-edfcb546d9de = Reaalajas Kuu tugisüsteemi / Maa orientatsiooni ennustuse eelarve: P4 tabel { "1" } (tugisüsteemi vea kooskõlakontroll — järeltöödeldud ~{ "0.27" } m ↔ ~{ "0.010" } ms ja reaalajas ~{ "15" } m ↔ ~{ "0.5" } ms, iga tugisüsteemi asukoht väljendatud samaväärse UT1 veana L19 õlapikkuse Δr = D_EM·ω⊕·ΔUT1 kaudu) ja tabel { "2" } (mõõdetud UT1 ennustusviga vs horisont — L18 kõver loetud otse tegelikust IERS-i finals2000A reast: Bulletin A − Bulletin B lõplik põhjatase ja mitmepäevase püsivusennustaja viga, kumbki teisendatud Kuu tugisüsteemi asukohaks L19 abil), pluss L21 ruutude summa juurena reaalajas tugisüsteemi vea eelarve (EOP + efemeriid + realisatsiooni põhjatase). VALIDATED kinnine kuju (L19 õlapikkus, ω⊕ ristkontrollitud CIO Maa pöörlemisnurga vastu) ja VALIDATED reaalsed andmed (L18 kõver otse tegelikelt finals2000A ridadelt); MODELLED on tsislunaarse releesatelliidi OD kovariatsioonide suurused ja tugisüsteemi realisatsiooni põhjatase (esindusliku jaotusega eraldised) ning püsivusennustaja (mitte IERS-i operatiivne Bulletin A algoritm). Mitte sertifitseeritud reaalajas tugisüsteemi toode.

# attr:alt
seg-2721ed7727bb = Diagramm, mille mootor kirjutab failile scenarios/realtime-frame-eop.toml, liik realtime-frame-eop

# text
seg-5f25c5b71f0c = Kosmoseilma keskkonnamudel: päikese (F10.7/F10.7a) ja geomagnetilise (Kp, koos definitsioonilise Kp↔ap tabeliga) aktiivsusindeksid, nende juhitav Jacchia-1971 eksosfääri temperatuur (valideeritud avaldatud päikese miinimumi/keskmise/maksimumi vastu) ning Jacchia-1971 termosfääri neutraaltihedus ööpäeva keskmise eksosfääri temperatuuri juures vs aktiivsusvaba staatiline profiil kõrguste hulgal — päikesetsükli tihedussõltuvus, mida staatiline atmosfäär ei sisalda. MODELLED: tihedus ühtib kiirendusmõõturitest tuletatud tihedustega (TOLEOS CHAMP ja GRACE) teguri { "2" } piires päikese maksimumil, kuid on { "2008" }. aasta päikese miinimumil umbes 1.7x liiga tihe.

# attr:alt
seg-c1c6f2f73fb5 = Diagramm, mille mootor kirjutab failile scenarios/space-weather.toml, liik space-weather

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
# c1: docs/kinds/gnss-measurements-positioning-and-integrity.md
seg-c9cf40c5e609 = Source: <c1/>

# text
seg-569fac649b5d = GNSS-i mõõtmised, positsioneerimine ja terviklikkus (stsenaariumi liikide perekond)

# text
seg-63c3a7483268 = { "6" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: kshana scenarios/integrity-raim.toml
seg-33a602147cc2 = Teemalehed: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Käivita üks: <c1/>. Kõik perekonnad: <a5>KINDS.md</a5>.

# attr:alt
seg-9c60c8803b6b = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna GNSS-i mõõtmised, positsioneerimine ja terviklikkus liikide jaoks

# text
seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

# text
seg-6698e12e148b = Reaalsete vaatluste ühepunktpositsioneerimine: vastuvõtja asukoha lahendamine RINEX { "3" } vaatlusfailist ja ringhäälestatud navigatsioonifailist (koodipseudovahemaad, ringhäälestatud efemeriid, Klobuchari ionosfäär, Saastamo

# text
seg-da89c260b1a3 = Avaldatud ARAIM-i sertifitseerimise etalonvektorid: mootori ARAIM-i horisontaalne ja vertikaalne kaitsetase käivitatuna WG-C ARAIM-i tehnilise alamrühma ENDA läbitöötatud arvnäidete vastu, tolera

# text
seg-7a750a89c9c4 = Kosmoseilma keskkonnamudel: päikese (F10.7/F10.7a) ja geomagnetilise (Kp, koos definitsioonilise Kp↔ap tabeliga) aktiivsusindeksid, nende juhitav Jacchia-1971 eksosfääri temperatuur (valideeritud avaldatud

# text
seg-d79d4d58275b = Reaalajas Kuu tugisüsteemi / Maa orientatsiooni ennustuse eelarve: P4 tabel { "1" } (tugisüsteemi vea kooskõlakontroll — järeltöödeldud ~{ "0.27" } m ↔ ~{ "0.010" } ms ja reaalajas ~{ "15" } m ↔ ~{ "0.5" } ms, iga tugisüsteemi asukoht väljendatud

# text
# c1: mask_deg
# c2: sigma_uere_m
# c3: p_fa
# c4: p_md
# c5: al_h_m
# c6: al_v_m
# c7: time
# c8: user|user_site
# c9: constellation
# c10: sigma_ura_m
# c11: b_nom_m
# c12: constellations
# c13: seed
# c14: araim_dual
# c15: p_hmi
# c16: skyline
seg-dc783268156c = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Valikulised: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-7b110aacdb27 = <b>Register (ledger):</b> MODELLED { "6" } · VALIDATED { "4" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>integrity</a1>.

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: iono
# c6: tropo
# c7: mask_deg
# c8: noise_sigma_m
# c9: multipath_m
# c10: sat_clock_rms_m
# c11: uere_m
# c12: p_fa
# c13: p_md
# c14: alert_limit_h_m
# c15: alert_limit_v_m
# c16: skyline
seg-d444fb35cae9 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>. Valikulised: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

# text
seg-b651ec58bcba = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>gnss-sim</a1>.

# text
# c1: obs_rinex
# c2: nav_rinex
# c3: truth_ecef
# c4: apriori_ecef
# c5: mask_deg
# c6: dual_frequency
seg-b9a21187317d = Kohustuslikud väljad: <c1/>, <c2/>. Valikulised: <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-143dc4fd1d44 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>pvt</a1>.

# text
# c1: vector
seg-9ca1f6783e8e = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>.

# text
seg-415f1fa78518 = <b>Register (ledger):</b> VALIDATED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>araim-reference-check</a1>.

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6c4655b35c65 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>.

# text
seg-1e5052c0bce7 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>space-weather</a1>.

# text
# c1: epoch
# c2: horizons_days
# c3: ephemeris_pos_sigma_m
# c4: ephemeris_vel_sigma_mps
# c5: latency_s
# c6: frame_realization_floor_m
# c7: delta_ut1_ms
# c8: delta_xp_mas
# c9: delta_yp_mas
# c10: eop_finals2000a
# c11: eop_finals2000a_later
# c12: frame_realization_tie_noise_m
# c13: operational_window_days
# c14: operational_min_cycle_fraction
# c15: operational_anchor_residual
seg-64c512530ee6 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

# text
seg-1c244958d3c4 = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>realtime-frame-eop</a1>.

# text
seg-d4adf4283480 = <s1>Eelmine</s1>Konstellatsioonid, katvus ja geomeetria

# text
seg-2cdfd7f8bfb3 = <s1>Järgmine</s1>GPS-ita alternatiivne PNT
