# docs--kind-integrity: translations (nb)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenariotype i motoren v{ $version }, familie <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Temaside: <a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> Den valgfrie [integrity]-delen av typen clock (clock_integrity::run): fra et oppgitt sted og konstellasjonsforhåndsinnstillinger (geometry::sky_geometry), ved hver integritetsepoke mens GNSS-tidslinjen ikke er avvist, øyeblikks-RAIM (raim::snapshot_ Tester: <a1>clock_integrity.rs</a1>.

seg-ee7dd15019d0 = Temaside: <a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-løsningsseparasjon med flere hypoteser etter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protecti. Uavhengig referanse (ExternalDataset): Tre uavhengige verktøy, forhåndsregistrert (0123cee1) før noen fixture eller referanseutdata fantes, toleranser fastsatt da. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, kjørt som et separat program under GNU Octave { "8.4" } med en kompatibilitetsshim for unique() på driversiden (oppgitt, ingen algoritmeendring), ved ADD TOL_PL på { "0.05" } m: Rust gjengir ADD-referanseimplementasjonen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP fra siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-oppdeling. Uavhengig referanse (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uavhengig bibliotek, samsvarte til { "1e-6" } relativt

seg-78ff7db5ad3d = <b>VALIDATED</b> Den distribusjonelle kjernen som hvert beskyttelsesnivå hviler på: terskelen for øyeblikksbildets feildeteksjon χ²₁₋ₚfₐ(dof), ikke-sentraliteten for tapt deteksjon pbias=√λ, og . Uavhengig referanse (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), uavhengig bibliotek (Cephes/Boost), en annen algoritme enn Kshanas rekke for den ufullstendige gammafunksjonen; stemte til ≤{ "1e-6" } rel. Kun kjernen. Budsjettets <em>fordeling</em> av ARAIM MHSS P_HMI er ikke lenger uten en publisert numerisk uavhengig referanse: WG-C ARAIM Technical Subgroups eget gjennomgåtte eksempel støtter nå den separate 'ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Kilde: <c1/>

seg-dd304550e695 = <c1/> (scenariotype)

seg-eb7e0c2feb2b = RAIM med øyeblikksbilde / løsningsseparasjon / ARAIM med HPL/VPL og et Stanford-diagram.

seg-706887c285d8 = Én kjøring av <c1/> oppsummeres slik: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Eksemplet <c1/> setter blant annet:

seg-ce7f6130ddee = Diagrammet motoren skriver for scenarios/integrity-raim.toml, typen integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-dff469738ec3 = <b>VALIDATED</b> Skalar-tid TPL med løsningsseparasjon over heterogene kilder; PL drevet av støy i den verste ekskluderingsdelmengden + UTC(k)-bias

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); nedre semikontinuerlig PL({ "0" }+)≥PL({ "0" }−); K(IR/2) løpende maksimum; τ/τ³/τ⁵ fase-eksponenter

seg-4787b0b565df = <b>VALIDATED</b> Løpende maksimum-envelope overgrenser (null gjennomtrengning) en virkelig metrologisk serie ved hver testede lag tau>=90d på et disjunkt segment; kort tau (<=30d) er en oppgitt Modelled-grense. Tester: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = og { "6" } til i matrisen.

seg-b4bc9ccbcee2 = <s1>Forrige</s1>ins-trn-coast

seg-f1ba804baade = <s1>Neste</s1>jamming
