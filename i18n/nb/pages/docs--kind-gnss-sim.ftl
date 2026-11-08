# docs--kind-gnss-sim: translations (nb)

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-8e845ce908ee = Scenariotype i motoren v{ $version }, familie <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-3068552e4ab4 = VALIDATED: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, posisjonsbestemmelse og integritet</a1>

seg-d5f4762f8455 = Kilde: <c1/>

seg-b634bbba2197 = <c1/> (scenariotype)

seg-2ffccc9c1eff = Pseudoavstandssimulering i måledomenet (Klobuchar-iono, Saastamoinen/Niell-tropo) + RAIM.

seg-db93cbad6c6d = Én kjøring av <c1/> oppsummeres slik: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Eksemplet <c1/> setter blant annet:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = Diagrammet motoren skriver for scenarios/gnss-sim-raim.toml, typen gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchar enkeltfrekvens L1 skrå ionosfærisk gruppeforsinkelse fra de åtte kringkastede α/β-koeffisientene. Tester: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-løsningsseparasjon med flere hypoteser etter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protecti. Uavhengig referanse (ExternalDataset): Tre uavhengige verktøy, forhåndsregistrert (0123cee1) før noen fixture eller referanseutdata fantes, toleranser fastsatt da. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, kjørt som et separat program under GNU Octave { "8.4" } med en kompatibilitetsshim for unique() på driversiden (oppgitt, ingen algoritmeendring), ved ADD TOL_PL på { "0.05" } m: Rust gjengir ADD-referanseimplementasjonen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP fra siktlinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-oppdeling. Uavhengig referanse (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uavhengig bibliotek, samsvarte til { "1e-6" } relativt

seg-752829346523 = <b>VALIDATED</b> Klobuchar enkeltfrekvens L1 skrå ionosfærisk gruppeforsinkelse fra de åtte kringkastede α/β-koeffisientene. Uavhengig referanse (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c), uavhengig referanseimplementasjon kompilert fra kildekode; stemte til < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> Den distribusjonelle kjernen som hvert beskyttelsesnivå hviler på: terskelen for øyeblikksbildets feildeteksjon χ²₁₋ₚfₐ(dof), ikke-sentraliteten for tapt deteksjon pbias=√λ, og . Uavhengig referanse (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), uavhengig bibliotek (Cephes/Boost), en annen algoritme enn Kshanas rekke for den ufullstendige gammafunksjonen; stemte til ≤{ "1e-6" } rel. Kun kjernen. Budsjettets <em>fordeling</em> av ARAIM MHSS P_HMI er ikke lenger uten en publisert numerisk uavhengig referanse: WG-C ARAIM Technical Subgroups eget gjennomgåtte eksempel støtter nå den separate 'ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Temaside: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Temaside: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Forrige</s1>gnss-ins

seg-7d677a362edd = <s1>Neste</s1>gnss-ssv
