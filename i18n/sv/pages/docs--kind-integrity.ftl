# docs--kind-integrity: translations (sv)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenariotyp i motor v{ $version }, familj <a1>GNSS-mätningar, positionering och integritet</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-f6b7ca020692 = Familjesida: <a1>GNSS-mätningar, positionering och integritet</a1>

seg-f4cf8b629797 = Ämnessida: <a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> Det valfria avsnittet [integrity] i typen clock (clock_integrity::run): från en angiven plats och konstellationsförinställningar (geometry::sky_geometry), vid varje integritetsepok medan GNSS-tidslinjen inte är nekad, ögonblicks-RAIM (raim::snapshot_ Tester: <a1>clock_integrity.rs</a1>.

seg-ee7dd15019d0 = Ämnessida: <a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-lösning med multipla hypoteser och lösningsseparation enligt ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels och add_v42_protecti. Oracle (ExternalDataset): Tre oberoende verktyg, förhandsregistrerade (0123cee1) innan någon fixtur eller referensutdata fanns, toleranser fastställda då. ({ "1" }) ARAIM: Stanford MAAST för ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, körd som separat program under GNU Octave { "8.4" } med ett kompatibilitetsskal för unique() på drivrutinssidan (redovisat, ingen algoritmändring), vid ADD TOL_PL på { "0.05" } m: Rust återskapar ADD-referensimplementationen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP från siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-uppdelning. Oracle (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — oberoende bibliotek, överensstämmande till { "1e-6" } relativt

seg-78ff7db5ad3d = <b>VALIDATED</b> Den fördelningsmässiga kärnan som varje skyddsnivå vilar på: tröskeln för felupptäckt i ögonblicksbilden χ²₁₋ₚfₐ(dof), den icke-centrala parametern för missad detektering pbias=√λ, och . Oracle (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — oberoende bibliotek (Cephes/Boost), en annan algoritm än Kshanas inkompletta gammaserie; överensstämmande till ≤{ "1e-6" } rel. Endast kärnan. ARAIM MHSS P_HMI-budgetens <em>fördelning</em> saknar inte längre ett publicerat numeriskt oberoende referensvärde — WG-C ARAIM Technical Subgroups eget räknade exempel stöder nu den separata raden 'ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Källa: <c1/>

seg-dd304550e695 = <c1/> (scenario kind)

seg-eb7e0c2feb2b = RAIM med ögonblicksbild / lösningsseparation / ARAIM med HPL/VPL och ett Stanford-diagram.

seg-706887c285d8 = En körning av <c1/> sammanfattas som: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Exemplet <c1/> anger bland annat:

seg-ce7f6130ddee = Diagrammet som motorn skriver för scenarios/integrity-raim.toml, kind integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: raderna i <a1>verifieringsmatrisen</a1> som nämner denna kind.

seg-dff469738ec3 = <b>VALIDATED</b> TPL med skalär tid och lösningsseparation över heterogena källor; PL styrs av bruset i den sämsta uteslutningsdelmängden + UTC(k)-bias

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); nedåt halvkontinuerlig PL({ "0" }+)≥PL({ "0" }−); K(IR/2) löpande maximum; τ/τ³/τ⁵ fasexponenter

seg-4787b0b565df = <b>VALIDATED</b> Envelopp med löpande maximum överskyddar (utan genomstick) en verklig metrologisk serie vid varje testad fördröjning tau>=90d på ett disjunkt segment; kort tau (<=30d) är en redovisad Modelled gräns Tests: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = och { "6" } fler i matrisen.

seg-b4bc9ccbcee2 = <s1>Föregående</s1>ins-trn-coast

seg-f1ba804baade = <s1>Nästa</s1>jamming
