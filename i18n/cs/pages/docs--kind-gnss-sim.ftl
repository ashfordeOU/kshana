# docs--kind-gnss-sim: translations (cs)

seg-37d29d8303fe = km

seg-51362910dcb7 = Tento druh používají { "2" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-8e845ce908ee = Druh scénáře enginu v{ $version }, rodina <a1>Měření GNSS, určování polohy a integrita</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-3068552e4ab4 = VALIDATED: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-f6b7ca020692 = Stránka rodiny: <a1>Měření GNSS, určování polohy a integrita</a1>

seg-d5f4762f8455 = Zdroj: <c1/>

seg-b634bbba2197 = <c1/> (druh scénáře)

seg-2ffccc9c1eff = Simulace pseudovzdáleností v oblasti měření (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM.

seg-db93cbad6c6d = Jeden běh <c1/> se shrnuje takto: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Příklad <c1/> mimo jiné nastavuje:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = Graf, který engine zapisuje pro scenarios/gnss-sim-raim.toml, druh gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Klobucharovo jednofrekvenční šikmé ionosférické skupinové zpoždění na L1 z osmi vysílaných koeficientů α/β. Testy: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> Řešení ARAIM s oddělováním řešení pro více hypotéz podle dokumentu ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels a add_v42_protecti. Orákulum (ExternalDataset): Tři nezávislé nástroje, předregistrované (0123cee1) dříve, než existoval jakýkoli fixture nebo výstup orákula, tolerance stanoveny tehdy. ({ "1" }) ARAIM: Stanford MAAST pro ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, spuštěné jako samostatný program pod GNU Octave { "8.4" } s kompatibilní vrstvou unique() na straně ovladače (zveřejněno, bez změny algoritmu), při ADD TOL_PL { "0.05" } m: kód v Rustu reprodukuje referenční implementaci ADD na

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrie přímé viditelnosti přes Q=(HᵀH)⁻¹ s lokálním rozkladem ENU. Orákulum (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — nezávislá knihovna, shoda na { "1e-6" } relativně

seg-752829346523 = <b>VALIDATED</b> Klobucharovo jednofrekvenční šikmé ionosférické skupinové zpoždění na L1 z osmi vysílaných koeficientů α/β. Orákulum (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — nezávislá referenční implementace přeložená ze zdrojového kódu; shoda na < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> Distribuční jádro, na kterém stojí každá ochranná úroveň: práh detekce poruchy ve snímku χ²₁₋ₚfₐ(dof), necentralita nezachycené události pbias=√λ a . Orákulum (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — nezávislá knihovna (Cephes/Boost), jiný algoritmus než řada neúplné funkce gama v Kshaně; shoda na ≤{ "1e-6" } rel. Pouze jádro. <em>Přidělení</em> rozpočtu P_HMI v ARAIM MHSS už není bez publikovaného číselného orákula — vlastní řešený příklad Technické podskupiny ARAIM WG-C nyní podporuje samostatnou položku „ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Tematická stránka: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Tematická stránka: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Předchozí</s1>gnss-ins

seg-7d677a362edd = <s1>Další</s1>gnss-ssv
