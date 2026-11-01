# docs--kind-gnss-sim: translations (sv)

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-8e845ce908ee = Scenariotyp i motor v{ $version }, familj <a1>GNSS-mätningar, positionering och integritet</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-3068552e4ab4 = VALIDATED: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-f6b7ca020692 = Familjesida: <a1>GNSS-mätningar, positionering och integritet</a1>

seg-d5f4762f8455 = Källa: <c1/>

seg-b634bbba2197 = <c1/> (scenario kind)

seg-2ffccc9c1eff = Pseudoavståndssimulering i mätdomänen (Klobuchar-jonosfär, Saastamoinen/Niell-troposfär) + RAIM.

seg-db93cbad6c6d = En körning av <c1/> sammanfattas som: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Exemplet <c1/> anger bland annat:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = Diagrammet som motorn skriver för scenarios/gnss-sim-raim.toml, kind gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchars enfrekvens-L1-jonosfärsgruppfördröjning i snedriktning utifrån de åtta utsända α/β-koefficienterna Tests: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-lösning med multipla hypoteser och lösningsseparation enligt ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels och add_v42_protecti. Oracle (ExternalDataset): Tre oberoende verktyg, förhandsregistrerade (0123cee1) innan någon fixtur eller referensutdata fanns, toleranser fastställda då. ({ "1" }) ARAIM: Stanford MAAST för ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, körd som separat program under GNU Octave { "8.4" } med ett kompatibilitetsskal för unique() på drivrutinssidan (redovisat, ingen algoritmändring), vid ADD TOL_PL på { "0.05" } m: Rust återskapar ADD-referensimplementationen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP från siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-uppdelning. Oracle (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — oberoende bibliotek, överensstämmande till { "1e-6" } relativt

seg-752829346523 = <b>VALIDATED</b> Klobuchars enfrekvens-L1-jonosfärsgruppfördröjning i snedriktning utifrån de åtta utsända α/β-koefficienterna. Oracle (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — oberoende referensimplementation kompilerad från källkod; överensstämmande till < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> Den fördelningsmässiga kärnan som varje skyddsnivå vilar på: tröskeln för felupptäckt i ögonblicksbilden χ²₁₋ₚfₐ(dof), den icke-centrala parametern för missad detektering pbias=√λ, och . Oracle (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — oberoende bibliotek (Cephes/Boost), en annan algoritm än Kshanas inkompletta gammaserie; överensstämmande till ≤{ "1e-6" } rel. Endast kärnan. ARAIM MHSS P_HMI-budgetens <em>fördelning</em> saknar inte längre ett publicerat numeriskt oberoende referensvärde — WG-C ARAIM Technical Subgroups eget räknade exempel stöder nu den separata raden 'ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Ämnessida: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Ämnessida: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Föregående</s1>gnss-ins

seg-7d677a362edd = <s1>Nästa</s1>gnss-ssv
