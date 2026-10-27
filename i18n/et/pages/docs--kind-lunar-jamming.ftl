# docs--kind-lunar-jamming: translations (et)

# text
seg-37d16b499bc5 = dB

# text
seg-59afd80736c5 = <b>PARTNER</b> Ei paku — Kshana modelleerib signaali toimivust, mitte kasulikkoormuse/antenni riistvara. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
seg-a3697ad561db = Hz

# text
seg-9521a296d617 = dBi

# text
seg-f85a85f0c7e4 = MHz

# text
seg-7154243aabbe = lairibaline

# text
seg-cec5c06d38af = <b>MODELLED</b> Kuupõhine segaja ja signaali suhe, efektiivne C/N₀ ja haakumise kadu selenograafilise pinnakasutaja jaoks Kuu pinna (või kõrgendatud) segaja all, illustratiivse avaliku allikaga Moonlight/LCNS-klassi satelliidikonstellatsiooni üle.

# text
# c1: lunar-jamming
seg-edcd55ccc993 = <b>MODELLED</b> Aruanne <c1/> ei toetu enam oma keelukontuuris ühele skalaarile.

# text
# c1: docs/kinds/by-kind/lunar-jamming.md
seg-bcb02ffed4d0 = Allikas: <c1/>

# text
# c1: lunar-jamming
seg-612388918e36 = <c1/> (stsenaariumi liik)

# text
# c1: jamming
seg-a91a9ad5d8d1 = Kuupõhine RF segamine: satelliidipõhine segaja ja signaali suhe, efektiivne C/N₀ ja haakumise kadu selenograafilise pinnakasutaja jaoks Kuu pinna (või kõrgendatud) segaja all, illustratiivse avaliku allikaga Moonlight/LCNS-klassi Kuu orbiidi konstellatsiooni üle. Ühendab olemasoleva avatud segamisfüüsika (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) olemasoleva Kuu taevageomeetriaga (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geomeetriat ega radiomeetriat ei tuletata uuesti. Erinevalt Maa liigist <c1/> EI OLE signaaliosa fikseeritud vastuvõetud võimsus: iga satelliidi isotroopne vastuvõetud võimsus on selle enda lingieelarve EIRP − FSPL(kaldvahemaa), seega J/S varieerub satelliiditi Kuu vahemaa ja elevatsiooniga. Esitab ÜKS RIDA IGA NÄHTAVA (epohh, satelliit) LINGI KOHTA — asimuut, elevatsioon, kaldvahemaa, mõlemad vastuvõetud võimsused, mille vahe J/S on, J/S, nominaalne ja efektiivne C/N₀ ning haakumise olek — pluss koondnäitajad selle tabeli kõrval (mitte selle asemel) ja sama tabel CSV artefaktina. Iga väljastatav arvväli kannab ühikut ja päritoluklassi. VALIDATED alamtulemused kannavad oma lähtemooduli sõltumatut etaloni (Kaplan & Hegarty §{ "9.4" } segamisvastane võrrand ja J/S link, väliselt viidatud failis tests/gnss_denied_jamming_resilience_reference.rs; modulis lunar_service Kuu geomeetria). Koostet ennast ristkontrollitakse sõltumatu kahe lingieelarve tee vastu (linkbudget::received_signal_power_dbw, teistsugune vabaruumi kao avaldis) täpsuseni { "1e-9" } dB. MODELLED: illustratiivne konstellatsioon, esinduslik EIRP / segaja võimsus / antenni võimendused / müratemperatuur ning maastikuvarjutuse, mitmeteelevi, AGC dünaamika ja adaptiivse nullimise puudumine. Mitte sertifitseeritud teenusetõkestamise toode. Kui segaja on seadistatud, kannab aruanne ka KEELUKONTUURI KOOS MÄÄRAMATUSE VÖÖNDIGA, mitte ühest skalaarist välja loetud kontuuri: kogu mõõdetud soovitud signaali C/N₀ jaotus satelliidipõhise tabeli üle (n, min, p05, p25, mediaan, p75, p95, max, keskmine, valimi standardhälve ja valimi enda asümmeetria) ning kontuur hinnatuna igal neist järjestusstatistikutest MÕLEMA mootori tunnustatava keelukriteeriumi all — senine võimsussuhte oma (J/S = { "30" } dB, nagu attack-surface ja tracking-loop puhul) ja haakumise kao oma (efektiivne C/N₀ langeb väärtuseni tracking_threshold_dbhz, kriteerium, mida selle aruande enda olekuveerg kasutab) — keelamistasandi mõlemal teljel (nõutav segaja EIRP stsenaariumi eemalseisul, keelamise eemalseis stsenaariumi EIRP-l). Vööndi servad ON contour(p05) ja contour(p95), sama suletud kujuga kujutis rakendatud valimi enda kvantiilidele: mitte valimisse sobitatud sigma ega mediaan ± k·stdev, kusjuures stdev väljastatakse järjepidevuse huvides ja seda ei kasuta miski. Kvantiilil, mis on juba jälgimisläve juures või allpool, ei ole lõplikku keelavat J/S ja selle haakumise kao veerud on null koos loetud põhjusega, mitte kunagi piiratud raadius.

# text
# c1: scenarios/lunar-jamming.toml
seg-6693c3ebcb07 = Ühe <c1/> käivituse kokkuvõte: lunar-jamming | { "4" } sat, { "12" } epohhi, { "38" } linki asukohast (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (keskmine { "35.622" }) | { "0" } LOST | kättesaadavus { "0.167" } nominaalsest { "0.167" }

# text
# c1: n_sats
# c2: sma_km
# c3: eccentricity
# c4: inc_deg
# c5: argp_deg
# c6: site_lat_deg
# c7: site_lon_deg
# c8: site_alt_m
# c9: horizon_hours
# c10: step_min
# c11: elev_mask_deg
# c12: sat_eirp_dbw
# c13: carrier_hz
# c14: chip_rate_hz
# c15: user_boresight_gain_dbi
# c16: temp_k
# c17: tracking_threshold_dbhz
# c18: degraded_margin_db
# c19: jammer
seg-6e01b6354e40 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

# text
# c1: scenarios/lunar-jamming.toml
seg-c61fb6515ed9 = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-6fe8b3c6c584 = Mootori joonistatud diagramm failile scenarios/lunar-jamming.toml, liik lunar-jamming

# text
seg-d4ae2f589112 = <b>MODELLED</b> Kuupõhine segaja ja signaali suhe, efektiivne C/N₀ ja haakumise kadu selenograafilise pinnakasutaja jaoks Kuu pinna (või kõrgendatud) segaja all, illustratiivse. Oraakel (sõltumatu etalon) (ReferenceImpl): Koostise ristkontroll sõltumatu hoidlasisese koodiraja vastu: iga lingi J/S tuletatakse uuesti kahe lingieelarve vahena, mis on arvutatud linkbudget::received_signal_power_dbw abil, mille vabaruumi kadu on üks avaldis { "20" }·log10(4πRf/c) kolmeliikmelise summa asemel, mida kasutab jamming::free_space_path_loss_db — mõlemad ühtivad täpsusega < { "1e-9" } dB igal real (mõõdetud halvim juhtum { "7.11e-14" } dB, st ujukomaümardus)

# text
# c1: lunar-jamming
seg-dbe54e7cc800 = <b>MODELLED</b> Aruanne <c1/> ei toetu enam oma keelukontuuris ühele skalaarile. See väljastab kogu mõõdetud soovitud signaali C/N₀ jaotuse satelliidipõhise t. Oraakel (sõltumatu etalon) (InternalConsistency): Sisemine kooskõla mootori enda edasifunktsioonidega, mida see võimekus ausalt väita saab. Iga kontuuripunkt on suletud kujuga pöördamine ja iga pöördamist kontrollitakse selle vastuse tagasi surumisega läbi EDASI funktsiooni, millega aruande enda read hinnati: J/S veerg läbi jamming::effective_cn0_dbhz (mis peab tagastama tracking_threshold_dbhz täpsusega < { "1e-9" } dB-Hz), eemalseisu veerg

# text
# c1: kshana kinds --json
seg-d48926e62856 = MODELLED: illustratiivne konstellatsioon, esinduslik EIRP / segaja võimsus / antenni võimendused / müratemperatuur ning maastikuvarjutuse, mitmeteelevi, AGC dünaamika ja adaptiivse nullimise puudumine. (liikide kataloog (<c1/>))

# text
seg-c455dbcb9f8c = MODELLED. Konstellatsioon on illustratiivne, avaliku allikaga Moonlight/LCNS-klassi geomeetria (mitte päris efemeriid; seotust ega heakskiitu ei väideta) ja häiremudel on lingieelarve: ei ole segaja maastikuvarjutust (esimest järku mõju lõunapooluse maastikul), ei ole mitmeteelevi, ei ole AGC lähedal/kaugel dünaamikat, ei ole adaptiivset nullimist, ei ole omandamise-vs-jälgimise hüstereesi. (stsenaariumifaili kommentaar, read { "26" } kuni { "30" })

# text
seg-da57cc7f1aa4 = Kuu pinnanavigatsiooni RF segamine (satelliidipõhine J/S) on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-dba1589d3c1e = Kuu keelukontuur määramatuse vööndiga mõõdetud C/N₀ hajuvusest on MODELLED, mitte valideeritud: kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-a2889fb2b42a = Teemaleht: <a1>integrations.md</a1>

# text
seg-03b50b21e5a8 = <s1>Eelmine</s1>lunar-interop-export

# text
seg-02568469f628 = <s1>Järgmine</s1>lunar-joint-od-clock
