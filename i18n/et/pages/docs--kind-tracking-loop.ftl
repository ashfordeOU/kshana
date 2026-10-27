# docs--kind-tracking-loop: translations (et)

# text
seg-37d16b499bc5 = dB

# text
seg-37d29d8303fe = km

# text
seg-b054c73f22e5 = väärtus puudub

# text
seg-59afd80736c5 = <b>PARTNER</b> Ei paku — Kshana modelleerib signaali toimivust, mitte kasulikkoormuse/antenni riistvara. Sõltumatu etalon (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-a3697ad561db = Hz

# text
seg-304496607bd7 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Segamine, spuufimine ja spekter</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-5d23d7f8f872 = Perekonna leht: <a1>Segamine, spuufimine ja spekter</a1>

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Aruanne <c1/> ei toetu enam oma keelukontuuris ühele skalaarile.

# text
seg-05e8854de548 = kiip

# text
# c1: docs/kinds/by-kind/tracking-loop.md
seg-4f57723d340e = Allikas: <c1/>

# text
# c1: tracking-loop
seg-e84aabe07c43 = <c1/> (stsenaariumi liik)

# text
seg-f6ff1c8c78db = Jälgimissilmuse lukustuse kadu: C/N0 -> lukustus/lukustuse vabastus HÜSTEREESIGA, lukustuse kaotamise aeg ning spuufimise sissetõmme koodi ja kandelaine nihke KIIRUSE funktsioonina. Mootori olemasolevad keelamise ja haaramise kriteeriumid on vastuvõetud võimsuse suhted (segaja keelab juures J/S = { "30" } dB, spuufer haarab juures { "3" } dB); tegelik lukustuse kadu ei ole võimsuse suhe, see on koht, kus silmuse värin pluss dünaamiline koormus väljub selle jälgimislävendi eelarvest. Annab aru ({ "1" }) kandelaine (Costas) ja koodi (mittekoherentne varajane/hiline) 1-sigma termilisest värinast versus C/N0, ruutimiskadu kaasa arvatud, nimetatud reeglite { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-kraadine reegel kolme sigma kujul) ja { "3" }</em>sigma_DLL + kaldviivitus <= d/2 chipi vastu; ({ "2" }) väljalangemise ja taaslukustumise C/N0 läved koos piirava silmuse nimetamisega, taaslukustumise lävi TULETATUD laiemast ribalaiusest, millega vastuvõtja uuesti sisse tõmbub, mitte väidetud, nii et hüstereesi laius peab jääma vahemikku { "5" }<em>log10(suhe) kuni { "10" }</em>log10(suhe) dB; ({ "3" }) kuulutatud lukustuse kaotamise aeg kahe lävega lukustusdetektorist kinnitusviibimistega, käivitatuna üle C/N0 kallaku, esitatuna eraldi füüsilisest faasipõgenemise ajast (Viterbi keskmine aeg tsüklihüpete vahel, log10 s-ides, sest see ulatub üle sadade dekaadide); ({ "4" }) spuufimise sissetõmbe piirid — suurim koodi libisemine ja kandelaine Doppleri kiirus, mida ohvri silmused suudavad järgida, koos kaardiga mõlema telje kohta, sest spuufer, mis libiseb neist kiiremini, ei haara silmust, vaid jookseb sellest ette; ning ({ "5" }) silmuse dünaamikast tulenev KEELAMISRADIUS esitatud olemasoleva võimsussuhte raadiuse KÕRVAL, mitte kunagi selle asemel, nende märgiga vahe omaette nimetatud väljana (denial_radius_delta_km) ja definitsioon selle kõrval. Iga väljastatud arvuväli kannab ühikut ja päritoluklassi. VALIDATED kinnised kujud: kandelaine ja koodi värina avaldised, silmusefiltri taandus sqrt({ "2" }<em>B_n</em>T) ja esimese järgu kaldviivitus on ristkontrollitud mootori enda sdr korrelaatori vastu, mida sammutatakse edasi algväärtustatud sünteetilisel IF-il — erinev tee samade arvudeni — vastavalt täpsusega { "0.6" } %, { "3.7" } % ja { "0.17" } %, ning tsüklihüppe aja taga olev modifitseeritud Besseli I0 tavaliste tabelväärtuste vastu täpsusega { "1e-7" }. Alumine kehtivuspiir on kinnitatud, mitte ainult nimetatud: alla ~{ "32" } dB-Hz juures { "1" } ms küllastub tegelik atan-diskriminaator oma +-pi/2 vahemiku vastu ja mõõdab väiksemat värinat kui ükski lineaarne teooria. MODELLED: silmuse ribalaiused, integreerimisaeg, korrelaatori vahe, sissetõmbe ribalaiuse suhe, kinnitusviibimised, segaja võimsus ja antennivõimendused on esindusliku riba arvud, mitte andmeleht. EI modelleerita: ostsillaatori (Alani hälbe) ja vibratsiooni värinat, sisendotsa ribalaiuse piiramist, mitmeteeleviivet, AGC dünaamikat, andmebiti ülemineku kadu, välist toetamist ega Costase tsüklihüppe valemi mis tahes poolsüklilist korrektsiooni. Silmuse dünaamika korral ei ole spuufimise haaramisel üldse raadiust — piirav tingimus on nihke kiirus, mitte võimsus — seega on see väli null koos põhjendusega, mitte väljamõeldud arv. Mitte sertifitseeritud vastuvõtja toimivuse toode.

# text
# c1: scenarios/tracking-loop.toml
seg-62d230dfccce = Ühe <c1/> käivituse kokkuvõte: tracking-loop: B_pll { "10.0" } Hz / B_dll { "1.0" } Hz, T { "1" } ms, d { "0.50" } chipi -> väljalangemine { "25.4744" } dB-Hz (kandelaine piirab), taaslukustumine { "27.4413" } dB-Hz, hüsterees { "1.9669" } dB | lukustuse kadu kuulutatud { "39.101" } s kallakusse | keelamisraadius lävi(J/S { "30" } dB) { "127.413" } km vs silmuse dünaamika { "53.1694" } km, vahe -74.2438 km | spuufimise sissetõmme <= { "0.966" } chipi/s koodi ja { "41.45" } Hz/s kandelaine (MODELLED silmus, VALIDATED kinnised kujud)

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-7614718317f4 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>

# text
# c1: scenarios/tracking-loop.toml
seg-41162ed2743b = Näide <c1/> määrab muu hulgas:

# text
seg-773fff0feaf7 = sulgudes

# text
seg-23f3aa5c2064 = Tulemuse silt (mootori oma): MIXED — VALIDATED silmuse kinnised kujud, MODELLED silmuse konfiguratsioon. Kandelaine ja koodi termilise värina avaldised, silmusefiltri taandus sqrt({ "2" }<em>B_n</em>T) ja esimese järgu kaldviivitus on ristkontrollitud mootori enda sdr korrelaatori vastu, mida sammutatakse edasi algväärtustatud sünteetilisel IF-il (erinev tee

# attr:alt
seg-72182c1aecd9 = Diagramm, mille mootor kirjutab failile scenarios/tracking-loop.toml, liik tracking-loop

# text
seg-346594a654f2 = <b>MODELLED</b> Lukustuse kadu arvutatud silmuse dünaamikast võimsussuhte asemel: kandelaine (Costas) ja koodi (mittekoherentne varajane/hiline) 1σ termiline värin versus C/N₀ ruutimiskaoga, nimetatud reeglite 3σ_PLL + θ_e ≤ { "45" }° ja 3σ_DLL + kaldviivitus vastu

# text
seg-3aa7f9748dc2 = <b>MODELLED</b> Lukustuse kadu arvutatud silmuse dünaamikast võimsussuhte asemel: kandelaine (Costas) ja koodi (mittekoherentne varajane/hiline) 1σ termiline värin versus C/N₀ ruutimiskaoga,. Sõltumatu etalon (viiteteostus; ReferenceImpl): mootori enda sdr korrelaator (sdr::correlate / synth_if / CaCode), mida sammutatakse edasi algväärtustatud sünteetilisel IF-il kalibreeritud C/N₀ juures — eraldi koodirada, mis jõuab samade arvudeni valimiga IQ arvulise korrelatsiooni, mitte algebralise värinaavaldise kaudu, seega on see erinev tee, mitte ümbersõnastus — pluss tavalised tabelväärtustega modifitseeritud Besseli I₀ väärtused tsüklihüppe liikme jaoks. Silmuseteooria Kaplani ja Hegar järgi

# text
# c1: label
seg-de048f9cf1f6 = MIXED — VALIDATED silmuse kinnised kujud, MODELLED silmuse konfiguratsioon. Kandelaine ja koodi termilise värina avaldised, silmusefiltri taandus sqrt({ "2" }<em>B_n</em>T) ja esimese järgu kaldviivitus on ristkontrollitud mootori enda sdr korrelaatori vastu, mida sammutatakse edasi algväärtustatud sünteetilisel IF-il (erinev tee samade arvudeni), ning modifitseeritud Besseli I0 tavaliste tabelväärtuste vastu. MODELLED: silmuse ribalaiused, integ (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-0dc70b7607f0 = MODELLED: silmuse ribalaiused, integreerimisaeg, korrelaatori vahe, sissetõmbe ribalaiuse suhe, kinnitusviibimised, segaja võimsus ja antennivõimendused on esindusliku riba arvud, mitte andmeleht. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-a679a9732b2a = EI modelleerita: ostsillaatori (Alani hälbe) ja vibratsiooni värinat, sisendotsa ribalaiuse piiramist, mitmeteeleviivet, AGC dünaamikat, andmebiti ülemineku kadu, välist toetamist ega Costase tsüklihüppe valemi mis tahes poolsüklilist korrektsiooni. (liikide kataloog (<c1/>))

# text
seg-f8d50cbc6f2c = Iga allolev silmuse parameeter on MODELLED esindusliku riba arv, mitte andmeleht. (stsenaariumifaili kommentaar, rida { "22" })

# text
seg-9241a57823cd = --- silmuse geomeetria ----------------------------------------------------------------- { "10" } Hz Costase kandelaine silmus ja { "1" } Hz kandelainega toetatud koodisilmus, { "1" } ms koherentne integreerimine (üks C/A koodiperiood, seega ei eeldata andmebitiga sünkroniseerimist), kitsas { "0.5" } chipi korrelaator. (stsenaariumifaili kommentaar, read { "25" }–{ "28" })

# text
seg-3a677e343081 = Jälgimissilmuse lukustuse kadu ja spuufimise sissetõmme häire korral on MODELLED, mitte valideeritud: kontrollitud sama koodibaasi eraldi teostuse vastu — kontrollitavast üksusest sõltumatu, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e3a8f20108f3 = <s1>Eelmine</s1>timetransfer
