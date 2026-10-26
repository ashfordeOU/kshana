# docs--kind-integrity: translations (da)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenarietype i motoren v{ $version }, familie <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f6b7ca020692 = Familieside: <a1>GNSS-målinger, positionsbestemmelse og integritet</a1>

seg-f4cf8b629797 = Emneside: <a1>INTEGRITY.md</a1>

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-løsningsseparation med flere hypoteser efter ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels og add_v42_protecti. Uafhængig reference (ExternalDataset): Tre uafhængige værktøjer, præregistreret (0123cee1), før noget fixture- eller referenceoutput fandtes, med tolerancer fastsat dengang. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, kørt som et separat program under GNU Octave { "8.4" } med en kompatibilitets-shim for unique() på driversiden (oplyst, ingen algoritmeændring), ved ADD TOL_PL på { "0.05" } m: Rust gengiver ADD-referenceimplementeringen på

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP ud fra sigtelinjegeometri via Q=(HᵀH)⁻¹ med en lokal ENU-opdeling. Uafhængig reference (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, uafhængigt bibliotek, stemmer til { "1e-6" } relativt

seg-78ff7db5ad3d = <b>VALIDATED</b> Den fordelingsmæssige kerne, som hvert beskyttelsesniveau hviler på: snapshot-tærsklen for fejldetektion χ²₁₋ₚfₐ(dof), ikke-centraliteten for overset detektion pbias=√λ, og . Uafhængig reference (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), uafhængigt bibliotek (Cephes/Boost), en anden algoritme end Kshanas ufuldstændige gamma-række; stemmer til ≤{ "1e-6" } rel. Kun kernen. Den ARAIM MHSS P_HMI-budget-<em>fordeling</em> er ikke længere uden en offentliggjort numerisk reference: WG-C ARAIM Technical Subgroups eget gennemregnede eksempel understøtter nu den separate 'ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Kilde: <c1/>

seg-dd304550e695 = <c1/> (scenarietype)

seg-eb7e0c2feb2b = Snapshot-/løsningsseparations-/ARAIM-RAIM med HPL/VPL og et Stanford-diagram.

seg-706887c285d8 = Én kørsel af <c1/> opsummeres sådan: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Eksemplet <c1/> angiver blandt andet:

seg-ce7f6130ddee = Diagrammet, som motoren skriver for scenarios/integrity-raim.toml, scenarietype integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-dff469738ec3 = <b>VALIDATED</b> Skalar-tids-TPL med løsningsseparation over heterogene kilder; PL drevet af støjen i den værste udeladelsesdelmængde + UTC(k)-bias

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); nedre halvkontinuert PL({ "0" }+)≥PL({ "0" }−); K(IR/2) løbende maksimum; τ/τ³/τ⁵ faseeksponenter

seg-4787b0b565df = <b>VALIDATED</b> Kuvert med løbende maksimum overgrænser (uden gennemtrængning af nul) en reel metrologisk serie ved hver testet lag tau>=90d på et disjunkt segment; kort tau (<=30d) er en oplyst modelleret grænse Tests: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = og { "6" } flere i matrixen.

seg-b4bc9ccbcee2 = <s1>Forrige</s1>ins-trn-coast

seg-f1ba804baade = <s1>Næste</s1>jamming
