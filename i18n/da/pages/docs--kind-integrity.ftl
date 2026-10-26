# docs--kind-integrity: translations (da)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Emneside: <a1>INTEGRITY.md</a1>

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-løsningsseparation med flere hypoteser efter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protecti. Uafhængig reference (ExternalDataset): Tre uafhængige værktøjer, præregistreret (0123cee1), før noget fixture- eller referenceoutput fandtes, med tolerancer fastsat dengang. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, kørt som et separat program under GNU Octave { "8.4" } med en kompatibilitets-shim for unique() på driversiden (oplyst, ingen algoritmeændring), ved ADD TOL_PL på { "0.05" } m: Rust gengiver ADD-referenceimplementeringen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP ud fra sigtelinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-opdeling. Uafhængig reference (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uafhængigt bibliotek, stemmer til { "1e-6" } relativt

seg-78ff7db5ad3d = <b>VALIDATED</b> Den fordelingsmæssige kerne, som hvert beskyttelsesniveau hviler på: snapshot-tærsklen for fejldetektion χ²₁₋ₚfₐ(dof), ikke-centraliteten for overset detektion pbias=√λ, og . Uafhængig reference (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), uafhængigt bibliotek (Cephes/Boost), en anden algoritme end Kshanas ufuldstændige gamma-række; stemmer til ≤{ "1e-6" } rel. Kun kernen. Den ARAIM MHSS P_HMI-budget-<em>fordeling</em> er ikke længere uden en offentliggjort numerisk reference: WG-C ARAIM Technical Subgroups eget gennemregnede eksempel understøtter nu den separate 'ARAIM MHSS protection levels against published referen
