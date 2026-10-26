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
