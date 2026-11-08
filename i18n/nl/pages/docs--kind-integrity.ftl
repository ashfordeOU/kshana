# docs--kind-integrity: translations (nl)

seg-37d29d8303fe = km

seg-8e845ce908ee = Scenariokind van de engine v{ $version }, familie <a1>GNSS-metingen, positiebepaling en integriteit</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f6b7ca020692 = Familiepagina: <a1>GNSS-metingen, positiebepaling en integriteit</a1>

seg-f4cf8b629797 = Onderwerppagina: <a1>INTEGRITY.md</a1>

seg-5b3dbe0aed82 = <b>MODELLED</b> De optionele sectie [integrity] van het kind clock (clock_integrity::run): vanuit een vermelde locatie en constellatievoorinstellingen (geometry::sky_geometry), bij elk integriteitstijdstip zolang de GNSS-tijdlijn niet geweigerd wordt, snapshot-RAIM (raim::snapshot_ Tests: <a1>clock_integrity.rs</a1>.

seg-ee7dd15019d0 = Onderwerppagina: <a1>CAMPAIGNS.md</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-oplossingsscheiding met meerdere hypothesen volgens het ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels en add_v42_protecti. Onafhankelijke referentie (ExternalDataset): Drie onafhankelijke hulpmiddelen, vooraf vastgelegd (0123cee1) voordat er een fixture of referentie-uitvoer bestond, toleranties toen vastgesteld. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als afzonderlijk programma uitgevoerd onder GNU Octave { "8.4" } met een unique()-compatibiliteitsshim aan de driverkant (bekendgemaakt, geen algoritmewijziging), bij de ADD TOL_PL van { "0.05" } m: de Rust-code reproduceert de ADD-referentie-implementatie op

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP uit de zichtlijngeometrie via Q=(HᵀH)⁻¹ met een lokale ENU-splitsing. Onafhankelijke referentie (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, een onafhankelijke bibliotheek, overeenkomstig tot { "1e-6" } relatief

seg-78ff7db5ad3d = <b>VALIDATED</b> De verdelingskern waarop elk beschermingsniveau rust: de drempel voor foutdetectie op een momentopname χ²₁₋ₚfₐ(dof), de niet-centraliteit voor gemiste detectie pbias=√λ, en . Onafhankelijke referentie (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), een onafhankelijke bibliotheek (Cephes/Boost), een ander algoritme dan de incomplete-gammareeks van Kshana; overeenkomstig tot ≤{ "1e-6" } rel. Alleen de kern. De <em>allocatie</em> van het ARAIM-MHSS-P_HMI-budget is niet langer zonder gepubliceerde numerieke referentie: het eigen uitgewerkte voorbeeld van de WG-C ARAIM Technical Subgroup ondersteunt nu de afzonderlijke 'ARAIM MHSS protection levels against published referen

seg-4bec24cd43f6 = Bron: <c1/>

seg-dd304550e695 = <c1/> (scenariosoort)

seg-eb7e0c2feb2b = Snapshot-/oplossingsscheidings-/ARAIM-RAIM met HPL/VPL en een Stanford-diagram.

seg-706887c285d8 = Eén run van <c1/> vat samen als: integrity | { "24" } satellites | 344/361 epochs available ({ "95.3" }%) | HAL { "40" } m VAL { "50" } m | sigma { "1.0" } m | Stanford(V): { "0" } integrity events, { "0" } HMI

seg-c3f7debf260a = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-7b28ab6567df = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-581a5231b230 = Het voorbeeld <c1/> stelt onder meer in:

seg-ce7f6130ddee = De grafiek die de engine schrijft voor scenarios/integrity-raim.toml, soort integrity

seg-c8c38ffbb63f = MODELLED { "6" } · VALIDATED { "4" }: de rijen van de <a1>verificatiematrix</a1> die deze soort noemen.

seg-dff469738ec3 = <b>VALIDATED</b> TPL met oplossingsscheiding voor scalaire tijd over heterogene bronnen; PL bepaald door de ruis van de slechtste uitsluitingssubset + UTC(k)-bias

seg-33a94111e9d9 = <b>MODELLED</b> PL(τ)=max(TPL_handover,HPL(τ)); laag-semicontinu PL({ "0" }+)≥PL({ "0" }−); K(IR/2) lopend maximum; τ/τ³/τ⁵ fasevenexponenten

seg-4787b0b565df = <b>VALIDATED</b> De lopende-maximumenvelop overbegrenst (zonder doorboring) een echte metrologische reeks bij elke geteste lag tau>=90d op een disjunct segment; korte tau (<=30d) is een bekendgemaakte gemodelleerde grens Tests: <a1>cti_holdover_coverage_reference.rs</a1>.

seg-090415eca3b7 = en { "6" } meer in de matrix.

seg-b4bc9ccbcee2 = <s1>Vorige</s1>ins-trn-coast

seg-f1ba804baade = <s1>Volgende</s1>jamming
