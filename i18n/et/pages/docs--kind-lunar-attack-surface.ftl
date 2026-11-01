# docs--kind-lunar-attack-surface: translations (et)

# text
seg-8784979d6569 = dBW

# text
seg-37d16b499bc5 = dB

# text
seg-98151954f217 = false

# text
seg-cc2ad9e12064 = <b>MODELLED</b> Geomeetriline J/S lingibilanss, segamisvastane C/N₀, satelliidi kaupa sünkroonsuse kadu. Sõltumatu etalon (InternalConsistency): Segamisvastase C/N₀ lingibilansi võrrand, mida on risttõendatud sõltumatu numpy uuestituletusega (jagab sama suletud kuju → InternalConsistency) pluss tegeliku JammerTest-2024 C/N₀ halvenemise iseloomustusega. { "0.30" } ring { "2" }, blokeeritud (jääb MODELLED): mõõdetud JammerTest { "2024" } C/N0 langust lingibilansi ennustuse vastu (eelregistreeritud 6a66994b, { "3" } dB piires) ei jooksutatud, sest F8.1 antenni asukoht ja suunamine at

# text
seg-143f3f1cc521 = GNSS-ita segamisvastane vastupidavus on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
# c1: docs/kinds/by-kind/lunar-attack-surface.md
seg-c14d2343d802 = Allikas: <c1/>

# text
# c1: lunar-attack-surface
seg-9c0b5e933472 = <c1/> (stsenaariumi liik)

# text
seg-004c56ded47f = Kuu pinnanavigatsiooni signaaliturbe ründepind (P1): ühendab avatud signaaliturbe analüüsid üheks kahendfailist ligipääsetavaks käivituseks. Esitab ({ "1" }) AFS vastuvõetud võimsuse ja selle võimsuse ÜLEJÄÄGI maapealse GPS etaloni suhtes, pluss 12-18 dB tundlikkusriba tõelise mitmetelgse pühkimisena üle lingisisendite (etalontase x EIRP x kaldvahemaa) koos 25x-ümardatud / 28x-ümardamata lineaarteguri ühildamisega. PARANDATUD (reegel R4): see esitas { "15.6" } dB võimsuse PUUDUJÄÄGI ja teguri 32x/36x, kuni GPS etalon parandati väärtustelt -125 / -128.5 (mis on dBm arvud) väärtustele -155 / -158.5 dBW, ICD-GPS-200 väärtused, mida segamismoodul on alati kandnud. Märk pöördub: modelleeritud Kuu AFS signaal on { "14.4" } dB TUGEVAM kui maapealne GPS L1 C/A, mitte nõrgem. Vastuvõetud võimsus ise ei nihkunud bittigi ja lineaartegur on vana jagatud täpselt { "1000" }-ga, mis on täpselt { "30" } dB dBm-st dBW-sse nihe; ({ "2" }) nõutav ründaja edastusvõimsus võltsimiseks (J/S = { "3" } dB) ja keelamiseks (J/S = { "30" } dB) igal eemalseisul, J/S lingi pöördväärtus; ({ "3" }) orbitaalne haaramisjalajälg päris ühtlase ava antenni mustri all (Airy [{ "2" } J1(x)/x]^{ "2" }), kõrgusega piiratud alampoolkerakujuline kübar, mille serv EI OLE haaratud; ({ "4" }) arvutatud jälgimissilmuse võltsimise haaramise sissetõmbe tulemus (kas sobitatud koodiga võltsija antud võimsuseeelise ja koodinihkega tõesti tõmbab DLL/PLL kaasa), mitte väidetud { "3" } dB lävi; ({ "5" }) õhuta keha geomeetriline horisondi ulatus tõstetud pinnasaatjal; ja ({ "6" }) OSNMA/TESLA autentimise eelarve ({ "20" } bit/s lisakulu = ~{ "40" } % { "50" } bit/s AFS navigatsioonisõnumist, võtme avalikustamise viivitus, { "2" }^-40 võltsimine). Tühi sisu reprodutseerib P1 lähtetaseme; iga sisend on vaikimisi antud ja tühistatav. VALIDATED alamtulemused kannavad oma lähtemooduli sõltumatut etaloni (suletud kujul dB radiomeetria; pöördvõrdelise J/S ringkäik; Airy muster vs A&S Besseli ja sfäärilise kübara geomeetria; DLL/PLL sissetõmme vs Kaplan & Hegarty; sfäärilise puutuja horisondi samasus vs eo_payload; OSNMA SIS-ICD väljade mõõtmine). MODELLED: esinduslikud geomeetria/võimsuse suurusjärgud ja haaramiskaardi konkreetsed lahtriväärtused. Mitte sertifitseeritud turbetoode.

# text
# c1: scenarios/lunar-attack-surface.toml
seg-e5edd5b9ef27 = Ühe <c1/> käivituse kokkuvõte: lunar-attack-surface | AFS -140.6 dBW, ülejääk { "14.4" } dB (riba -17.9–-12.0, { "25" }×/28× ülejääk) | võltsimine@{ "1000" } m { "0.000" } W | jalajälg { "3" }% kübar, serv väär | võltsimise haaramine tõene (haakumine { "0.00" } s) | masti ulatus { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% väärtusest { "50" } bit/s), { "30" } s viivitus | jalajälje pühkimine 7x5 (kõrgus 20-500 km x HPBW 1.83-29.20 kraadi), haaramine 0.6-42.9% | serva EI saavutatud sellel ruudustikul (parim -0.8 dB, { "3.8" } dB puudu; vajab { "19.8" } dBW vs { "16.0" } dBW)

# text
# c1: afs_eirp_dbw
# c2: user_gain_dbi
# c3: slant_range_m
# c4: slant_range_max_m
# c5: carrier_hz
# c6: gps_reference_dbw
# c7: gps_reference_min_dbw
# c8: afs_isotropic_signal_dbw
# c9: transmitter_altitude_m
# c10: transmitter_power_dbw
# c11: antenna_diameter_m
# c12: footprint_grid
# c13: spoof_power_advantage_db
# c14: spoof_code_offset_chips
# c15: attacker_gain_dbi
# c16: spoof_capture_js_db
# c17: jam_denial_js_db
# c18: standoffs_m
# c19: mast_height_m
# c20: user_antenna_height_m
# c21: footprint_altitude_min_m
# c22: footprint_altitude_max_m
# c23: footprint_altitude_steps
# c24: footprint_altitude_scale
# c25: footprint_diameter_min_m
# c26: footprint_diameter_max_m
# c27: footprint_diameter_steps
# c28: footprint_diameter_scale
seg-781a7094b955 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

# text
# c1: scenarios/lunar-attack-surface.toml
seg-87e0c97de011 = Näide <c1/> määrab muu hulgas:

# text
seg-6ea8f1132b57 = lineaarne

# text
seg-8b701f465117 = log

# attr:alt
seg-de295af20c55 = Mootori joonistatud diagramm failile scenarios/lunar-attack-surface.toml, liik lunar-attack-surface

# text
seg-c853e3e832c0 = <b>MODELLED</b> Kahetelgne pühkimine mustriga kaalutud, kõrgusega piiratud pinna haaramisjalajälje üle saatja kõrguse ja antenni läbimõõdu, esitatud üks rida tööpunkti kohta. Sõltumatu etalon (InternalConsistency): Hulga sisaldumine: segaja ja signaali suhe siseneb ühtlase detsibellinihkena, nii et kõrgema edastusvõimsuse haaratud hulk sisaldab madalama oma hulka ja osa saab ainult kasvada -- omadus, mida Airy muster EI anna kiirelaiuse ega kõrguse suhtes, kus haaratud piirkond laguneb rõngasteks ja osa on tõeliselt mittemonotoonne. Ükski avaldatud tabel ei anna Kuu orbitaalse saatja haaratud ketta osa

# text
# c1: kshana kinds --json
seg-d11486381332 = MODELLED: esinduslikud geomeetria/võimsuse suurusjärgud ja haaramiskaardi konkreetsed lahtriväärtused. (liikide kataloog (<c1/>))

# text
seg-95be70748647 = Haaramisjalajälg kõrguse ja kiirelaiuse suhtes on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-1a1799e01ac4 = <s1>Eelmine</s1>link-budget

# text
seg-4b0efe4b9b85 = <s1>Järgmine</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Eelmine</s1>lunar-ascent
