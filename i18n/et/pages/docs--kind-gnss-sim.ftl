# docs--kind-gnss-sim: translations (et)

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-8e845ce908ee = Mootori v{ $version } stsenaariumi liik, perekond <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-3068552e4ab4 = VALIDATED: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-f6b7ca020692 = Perekonna leht: <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>

# text
# c1: docs/kinds/by-kind/gnss-sim.md
seg-d5f4762f8455 = Allikas: <c1/>

# text
# c1: gnss-sim
seg-b634bbba2197 = <c1/> (stsenaariumi liik)

# text
seg-2ffccc9c1eff = Mõõtmispiirkonna pseudovahemaa simulatsioon (Klobuchari ionosfäär, Saastamoineni/Niell'i troposfäär) + RAIM.

# text
# c1: scenarios/gnss-sim-raim.toml
seg-db93cbad6c6d = Ühe <c1/> jooksu kokkuvõte: scenario ab854d9d7886 | gnss-sim | keskmine iono 19.9m tropo 6.8m | RAIM kättesaadavus { "0.82" } keskmine HPL 22.2m VPL 39.9m rikkemäär { "0.000" }

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
seg-55ee4fdf9240 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: iono
# c2: tropo
# c3: mask_deg
# c4: noise_sigma_m
# c5: multipath_m
# c6: sat_clock_rms_m
# c7: uere_m
# c8: p_fa
# c9: p_md
# c10: alert_limit_h_m
# c11: alert_limit_v_m
# c12: skyline
seg-ee0d38971d08 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

# text
# c1: scenarios/gnss-sim-raim.toml
seg-c7b57e696bc3 = Näide <c1/> määrab muu hulgas:

# text
seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

# attr:alt
seg-47ee40d4eb73 = Diagramm, mille mootor kirjutab failile scenarios/gnss-sim-raim.toml, liik gnss-sim

# text
seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchari ühesagedusliku L1 kaldionosfäärne grupiviivitus kaheksast edastatud α/β koefitsiendist Testid: <a1>klobuchar_reference.rs</a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM mitme hüpoteesi lahendite eraldatus vastavalt ARAIM Airborne Design Document (ADD) v4.2-le (araim_reference::add_v42_protection_levels ja add_v42_protecti. Sõltumatu etalon (ExternalDataset): Kolm sõltumatut tööriista, eelregistreeritud (0123cee1) enne mis tahes fikstuuri või sõltumatu etaloni väljundi olemasolu, tolerantsid fikseeritud siis. ({ "1" }) ARAIM: Stanfordi MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, jooksutatud eraldi programmina GNU Octave { "8.4" } all draiveripoolse unique() ühilduvuskihiga (avalikustatud, algoritmi muudatust ei ole), ADD TOL_PL juures { "0.05" } m: Rust reprodutseerib ADD etalonteostuse

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP vaatejoone geomeetriast kaudu Q=(HᵀH)⁻¹ kohaliku ENU lahutusega. Sõltumatu etalon (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — sõltumatu teek, ühtib { "1e-6" } suhtelise täpsusega

# text
seg-752829346523 = <b>VALIDATED</b> Klobuchari ühesagedusliku L1 kaldionosfäärne grupiviivitus kaheksast edastatud α/β koefitsiendist. Sõltumatu etalon (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — sõltumatu etalonteostus, kompileeritud lähtekoodist; ühtib < { "1e-4" } m

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> Jaotuslik tuum, millel iga kaitsetase põhineb: hetktõmmise rikke tuvastamise lävi χ²₁₋ₚfₐ(dof), tuvastamata jäänud sündmuse mittetsentraalsus pbias=√λ ja . Sõltumatu etalon (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — sõltumatu teek (Cephes/Boost), Kshana mittetäieliku gamma rea suhtes erinev algoritm; ühtib ≤{ "1e-6" } suhtelise täpsusega. Ainult tuum. ARAIM MHSS P_HMI eelarve <em>jaotus</em> ei ole enam ilma avaldatud arvulise sõltumatu etalonita — WG-C ARAIM-i tehnilise alamrühma enda läbitöötatud näide toetab nüüd eraldi rida „ARAIM MHSS protection levels against published referen

# text
seg-cc7018560c2c = Teemaleht: <a1>REAL_TLE_GUIDE.md</a1>

# text
seg-53a78e98af12 = Teemaleht: <a1>SKYLINE.md</a1>

# text
seg-659e6288ad72 = <s1>Eelmine</s1>gnss-ins

# text
seg-7d677a362edd = <s1>Järgmine</s1>gnss-ssv
