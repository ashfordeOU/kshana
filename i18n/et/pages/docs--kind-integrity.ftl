# docs--kind-integrity: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Mootori v{ $version } stsenaariumi liik, perekond <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f6b7ca020692 = Perekonna leht: <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>

# text
seg-f4cf8b629797 = Teemaleht: <a1>INTEGRITY.md</a1>

# text
seg-5b3dbe0aed82 = <b>MODELLED</b> Kella liigi valikuline [integrity] jaotis (clock_integrity::run): väljaöeldud jaamast ja konstellatsiooni eelseadistustest (geometry::sky_geometry), igal terviklikkuse epohhil, kui GNSS-i ajajoon ei ole keelatud, hetktõmmis RAIM (raim::snapshot_ Testid: <a1>clock_integrity.rs</a1>.

# text
seg-ee7dd15019d0 = Teemaleht: <a1>CAMPAIGNS.md</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM mitme hüpoteesi lahendite eraldatus vastavalt ARAIM Airborne Design Document (ADD) v4.2-le (araim_reference::add_v42_protection_levels ja add_v42_protecti. Oraakel (sõltumatu etalon) (ExternalDataset): Kolm sõltumatut tööriista, eelregistreeritud (0123cee1) enne mis tahes fikstuuri või sõltumatu etaloni väljundi olemasolu, tolerantsid fikseeritud siis. ({ "1" }) ARAIM: Stanfordi MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, jooksutatud eraldi programmina GNU Octave { "8.4" } all draiveripoolse unique() ühilduvuskihiga (avalikustatud, algoritmi muudatust ei ole), ADD TOL_PL juures { "0.05" } m: Rust reprodutseerib ADD etalonteostuse

# text
seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP vaatejoone geomeetriast kaudu Q=(HᵀH)⁻¹ kohaliku ENU lahutusega. Oraakel (sõltumatu etalon) (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — sõltumatu teek, ühtib { "1e-6" } suhtelise täpsusega

# text
seg-78ff7db5ad3d = <b>VALIDATED</b> Jaotuslik tuum, millel iga kaitsetase põhineb: hetktõmmise rikke tuvastamise lävi χ²₁₋ₚfₐ(dof), tuvastamata jäänud sündmuse mittetsentraalsus pbias=√λ ja . Oraakel (sõltumatu etalon) (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — sõltumatu teek (Cephes/Boost), Kshana mittetäieliku gamma rea suhtes erinev algoritm; ühtib ≤{ "1e-6" } suhtelise täpsusega. Ainult tuum. ARAIM MHSS P_HMI eelarve <em>jaotus</em> ei ole enam ilma avaldatud arvulise sõltumatu etalonita — WG-C ARAIM-i tehnilise alamrühma enda läbitöötatud näide toetab nüüd eraldi rida „ARAIM MHSS protection levels against published referen

# text
# c1: docs/kinds/by-kind/integrity.md
seg-4bec24cd43f6 = Allikas: <c1/>

# text
# c1: integrity
seg-dd304550e695 = <c1/> (stsenaariumi liik)

# text
seg-eb7e0c2feb2b = Hetktõmmise / lahenduste eraldamise / ARAIM RAIM koos HPL/VPL-iga ja Stanfordi diagrammiga.

# text
# c1: scenarios/integrity-raim.toml
seg-706887c285d8 = Ühe <c1/> käivituse kokkuvõte: integrity | { "24" } satelliiti | 344/361 epohhi kättesaadav ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } terviklikkuse sündmust, { "0" } HMI

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
seg-c3f7debf260a = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: sigma_ura_m
# c2: b_nom_m
# c3: constellations
# c4: seed
# c5: araim_dual
# c6: p_hmi
# c7: skyline
seg-7b28ab6567df = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/integrity-raim.toml
seg-581a5231b230 = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-ce7f6130ddee = Mootori joonistatud diagramm failile scenarios/integrity-raim.toml, liik integrity

# text
seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
seg-dff469738ec3 = <b>VALIDATED</b> Skalaarajaline lahenduste eraldamise TPL heterogeensete allikate üle; PL-i määrab halvima välistamise alamhulga müra + UTC(k) nihe

# text
seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); alt poolpidev PL({ "0" }+)≥PL({ "0" }−); K(IR/2) jooksev maksimum; τ/τ³/τ⁵ faasieksponendid

# text
seg-4787b0b565df = <b>VALIDATED</b> Jooksva maksimumi ümbris ülepiirab (nullipiirangut läbimata) katvalt reaalset metroloogilist rida igal testitud viitel tau>=90d lahkuminevas lõigus; lühike tau (<=30d) on avalikustatud Modelled piir Testid: <a1>cti_holdover_coverage_reference.rs</a1>.

# text
seg-090415eca3b7 = ja veel { "6" } maatriksis.

# text
seg-b4bc9ccbcee2 = <s1>Eelmine</s1>ins-trn-coast

# text
seg-f1ba804baade = <s1>Järgmine</s1>jamming
