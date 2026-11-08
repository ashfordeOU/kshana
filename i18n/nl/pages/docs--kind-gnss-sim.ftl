# docs--kind-gnss-sim: translations (nl)

seg-37d29d8303fe = km

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-8e845ce908ee = Scenariokind van de engine v{ $version }, familie <a1>GNSS-metingen, positiebepaling en integriteit</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-f6b7ca020692 = Familiepagina: <a1>GNSS-metingen, positiebepaling en integriteit</a1>

seg-d5f4762f8455 = Bron: <c1/>

seg-b634bbba2197 = <c1/> (scenariosoort)

seg-2ffccc9c1eff = Pseudorangesimulatie in het meetdomein (Klobuchar-iono, Saastamoinen/Niell-tropo) + RAIM.

seg-db93cbad6c6d = Eén run van <c1/> vat samen als: scenario ab854d9d7886 | gnss-sim | mean iono 19.9m tropo 6.8m | RAIM avail { "0.82" } mean HPL 22.2m VPL 39.9m fault-rate { "0.000" }

seg-55ee4fdf9240 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-ee0d38971d08 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-c7b57e696bc3 = Het voorbeeld <c1/> stelt onder meer in:

seg-1abddf8ecdc5 = [{ "3.8200e-8" }, { "1.4900e-8" }, -1.7900e-7, { "0" }]

seg-47ee40d4eb73 = De grafiek die de engine schrijft voor scenarios/gnss-sim-raim.toml, soort gnss-sim

seg-ccc44a4ac68e = <b>VALIDATED</b> Klobuchar-groepsvertraging door de ionosfeer op de schuine weg voor enkelvoudige frequentie L1, uit de acht uitgezonden α/β-coëfficiënten Tests: <a1>klobuchar_reference.rs</a1>.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-oplossingsscheiding met meerdere hypothesen volgens het ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels en add_v42_protecti. Onafhankelijke referentie (ExternalDataset): Drie onafhankelijke hulpmiddelen, vooraf vastgelegd (0123cee1) voordat er een fixture of referentie-uitvoer bestond, toleranties toen vastgesteld. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als afzonderlijk programma uitgevoerd onder GNU Octave { "8.4" } met een unique()-compatibiliteitsshim aan de driverkant (bekendgemaakt, geen algoritmewijziging), bij de ADD TOL_PL van { "0.05" } m: de Rust-code reproduceert de ADD-referentie-implementatie op

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP uit de zichtlijngeometrie via Q=(HᵀH)⁻¹ met een lokale ENU-splitsing. Onafhankelijke referentie (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP, een onafhankelijke bibliotheek, overeenkomstig tot { "1e-6" } relatief

seg-752829346523 = <b>VALIDATED</b> Klobuchar-groepsvertraging door de ionosfeer op de schuine weg voor enkelvoudige frequentie L1, uit de acht uitgezonden α/β-coëfficiënten. Onafhankelijke referentie (ExternalDataset): RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c), een onafhankelijke referentie-implementatie gecompileerd uit de broncode; overeenkomstig tot < { "1e-4" } m

seg-78ff7db5ad3d = <b>VALIDATED</b> De verdelingskern waarop elk beschermingsniveau rust: de drempel voor foutdetectie op een momentopname χ²₁₋ₚfₐ(dof), de niet-centraliteit voor gemiste detectie pbias=√λ, en . Onafhankelijke referentie (ExternalDataset): SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq), een onafhankelijke bibliotheek (Cephes/Boost), een ander algoritme dan de incomplete-gammareeks van Kshana; overeenkomstig tot ≤{ "1e-6" } rel. Alleen de kern. De <em>allocatie</em> van het ARAIM-MHSS-P_HMI-budget is niet langer zonder gepubliceerde numerieke referentie: het eigen uitgewerkte voorbeeld van de WG-C ARAIM Technical Subgroup ondersteunt nu de afzonderlijke 'ARAIM MHSS protection levels against published referen

seg-cc7018560c2c = Onderwerppagina: <a1>REAL_TLE_GUIDE.md</a1>

seg-53a78e98af12 = Onderwerppagina: <a1>SKYLINE.md</a1>

seg-659e6288ad72 = <s1>Vorige</s1>gnss-ins

seg-7d677a362edd = <s1>Volgende</s1>gnss-ssv
