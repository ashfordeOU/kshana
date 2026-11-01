# docs--kind-gnss-sim: translations (da)

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-d5f4762f8455 = Kilde: <c1/>

seg-b634bbba2197 = <c1/> (scenarietype)

seg-2ffccc9c1eff = Pseudoafstandssimulering i måledomænet (Klobuchar-iono, Saastamoinen/Niell-tropo) + RAIM.

seg-db93cbad6c6d = Én kørsel af <c1/> opsummeres sådan: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Eksemplet <c1/> angiver blandt andet:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = Diagrammet, som motoren skriver for scenarios/gnss-sim-raim.toml, scenarietype gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchar enkeltfrekvens L1 skrå ionosfærisk gruppeforsinkelse ud fra de otte udsendte α/β-koefficienter. Tests: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-løsningsseparation med flere hypoteser efter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protecti. Uafhængig reference (ExternalDataset): Tre uafhængige værktøjer, præregistreret (0123cee1), før noget fixture- eller referenceoutput fandtes, med tolerancer fastsat dengang. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, kørt som et separat program under GNU Octave { "8.4" } med en kompatibilitets-shim for unique() på driversiden (oplyst, ingen algoritmeændring), ved ADD TOL_PL på { "0.05" } m: Rust gengiver ADD-referenceimplementeringen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP ud fra sigtelinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-opdeling. Uafhængig reference (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uafhængigt bibliotek, stemmer til { "1e-6" } relativt

seg-752829346523 = <b>VALIDATED</b> Klobuchar enkeltfrekvens L1 skrå ionosfærisk gruppeforsinkelse ud fra de otte udsendte α/β-koefficienter. Uafhængig reference (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c), uafhængig referenceimplementering kompileret fra kildekode; stemmer til < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> Den fordelingsmæssige kerne, som hvert beskyttelsesniveau hviler på: snapshot-tærsklen for fejldetektion χ²₁₋ₚfₐ(dof), ikke-centraliteten for overset detektion pbias=√λ, og . Uafhængig reference (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), uafhængigt bibliotek (Cephes/Boost), en anden algoritme end Kshanas ufuldstændige gamma-række; stemmer til ≤{ "1e-6" } rel. Kun kernen. Den ARAIM MHSS P_HMI-budget-<em>fordeling</em> er ikke længere uden en offentliggjort numerisk reference: WG-C ARAIM Technical Subgroups eget gennemregnede eksempel understøtter nu den separate 'ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Emneside: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Emneside: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Forrige</s1>gnss-ins

seg-7d677a362edd = <s1>Næste</s1>gnss-ssv
