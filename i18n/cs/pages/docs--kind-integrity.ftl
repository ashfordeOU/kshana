# docs--kind-integrity: translations (cs)

seg-37d29d8303fe = km

seg-8e845ce908ee = Druh scénáře enginu v{ $version }, rodina <a1>Měření GNSS, určování polohy a integrita</a1>. Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života. Každé označení zde pochází z enginu nebo z verifikační matice; druh je MODELLED, pokud matice neuvádí jinak (jak se označení získává: oddíl Evidence v README).

seg-f6b7ca020692 = Stránka rodiny: <a1>Měření GNSS, určování polohy a integrita</a1>

seg-f4cf8b629797 = Tematická stránka: <a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> Volitelný oddíl [integrity] druhu clock (clock_integrity::run): z uvedeného stanoviště a předvoleb konstelace (geometry::sky_geometry) v každé epoše integrity, dokud časová osa GNSS není odepřena, snapshot RAIM (raim::snapshot_ Testy: <a1>clock_integrity.rs</a1>.

seg-ee7dd15019d0 = Tematická stránka: <a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = Tento druh používají { "3" } přibalené scénáře; ostatní jsou v <a1><c1/></a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> Řešení ARAIM s oddělováním řešení pro více hypotéz podle dokumentu ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels a add_v42_protecti. Orákulum (ExternalDataset): Tři nezávislé nástroje, předregistrované (0123cee1) dříve, než existoval jakýkoli fixture nebo výstup orákula, tolerance stanoveny tehdy. ({ "1" }) ARAIM: Stanford MAAST pro ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, spuštěné jako samostatný program pod GNU Octave { "8.4" } s kompatibilní vrstvou unique() na straně ovladače (zveřejněno, bez změny algoritmu), při ADD TOL_PL { "0.05" } m: kód v Rustu reprodukuje referenční implementaci ADD na

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrie přímé viditelnosti přes Q=(HᵀH)⁻¹ s lokálním rozkladem ENU. Orákulum (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — nezávislá knihovna, shoda na { "1e-6" } relativně

seg-78ff7db5ad3d = <b>VALIDATED</b> Distribuční jádro, na kterém stojí každá ochranná úroveň: práh detekce poruchy ve snímku χ²₁₋ₚfₐ(dof), necentralita nezachycené události pbias=√λ a . Orákulum (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — nezávislá knihovna (Cephes/Boost), jiný algoritmus než řada neúplné funkce gama v Kshaně; shoda na ≤{ "1e-6" } rel. Pouze jádro. <em>Přidělení</em> rozpočtu P_HMI v ARAIM MHSS už není bez publikovaného číselného orákula — vlastní řešený příklad Technické podskupiny ARAIM WG-C nyní podporuje samostatnou položku „ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Zdroj: <c1/>

seg-dd304550e695 = <c1/> (druh scénáře)

seg-eb7e0c2feb2b = Snímkové RAIM / RAIM s oddělováním řešení / ARAIM s HPL/VPL a Stanfordským diagramem.

seg-706887c285d8 = Jeden běh <c1/> se shrnuje takto: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = Povinná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Volitelná pole: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Příklad <c1/> mimo jiné nastavuje:

seg-ce7f6130ddee = Graf, který engine zapisuje pro scenarios/integrity-raim.toml, druh integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: řádky <a1>verifikační matice</a1>, které tento druh uvádějí.

seg-dff469738ec3 = <b>VALIDATED</b> Skalární časové TPL s oddělováním řešení přes heterogenní zdroje; PL řízená šumem nejhorší vyloučené podmnožiny + biasem UTC(k)

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); zdola polospojitá PL({ "0" }+)≥PL({ "0" }−); K(IR/2) klouzavé maximum; fázové exponenty τ/τ³/τ⁵

seg-4787b0b565df = <b>VALIDATED</b> Obálka klouzavého maxima nadhodnocující (bez protnutí nuly) skutečnou metrologickou řadu při každém testovaném zpoždění tau>=90d na disjunktním úseku; krátké tau (<=30d) je zveřejněná hranice úrovně vypočtené z modelu. Testy: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = a { "6" } dalších v matici.

seg-b4bc9ccbcee2 = <s1>Předchozí</s1>ins-trn-coast

seg-f1ba804baade = <s1>Další</s1>jamming
