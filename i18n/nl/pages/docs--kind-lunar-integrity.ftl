# docs--kind-lunar-integrity: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-aec7fc2a4070 = <b>VALIDATED</b> ARAIM-oplossingsscheiding met meerdere hypothesen volgens het ARAIM Airborne Design Document (ADD) v4.2 (araim_reference::add_v42_protection_levels en add_v42_protecti. Onafhankelijke referentie (ExternalDataset): Drie onafhankelijke hulpmiddelen, vooraf vastgelegd (0123cee1) voordat er een fixture of referentie-uitvoer bestond, toleranties toen vastgesteld. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, als afzonderlijk programma uitgevoerd onder GNU Octave { "8.4" } met een unique()-compatibiliteitsshim aan de driverkant (bekendgemaakt, geen algoritmewijziging), bij de ADD TOL_PL van { "0.05" } m: de Rust-code reproduceert de ADD-referentie-implementatie op

seg-8ed008b206de = Bron: <c1/>

seg-26f0cf6d63c0 = <c1/> (scenariosoort)

seg-4b6daea39f5c = Doorgangsbeoordeling van het ARAIM-beschermingsniveau bij de zuidpool van de maan tegenover een representatieve LunaNet-relayset. sigma_ure_m legt de afstandsnauwkeurigheid van het signal-in-space bloot (beschermingsniveaus schalen er lineair mee, dus door die te sweepen volgt welke afstandsnauwkeurigheid een alarmgrens vereist). Standaard het historische geval van het type LNIS bij de zuidpool.

seg-a6eb6de27cb5 = Eén run van <c1/> vat zich samen als: lunar-integrity | zuidpool | 0/24 epochs beschikbaar ({ "0.0" }%) | AL { "50" } m | σ_URE { "30" } m | HPL { "263" }–{ "452" } m

seg-79da500e2726 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-21d10aa98c33 = Het voorbeeld <c1/> stelt onder meer in:

seg-610fa190a393 = De grafiek die de engine schrijft voor scenarios/lunanet-araim.toml, soort lunar-integrity

seg-1903c67a762d = <b>VALIDATED</b> De stap van geometrie naar covariantie van het maanbeschermingsniveau — (GᵀG)⁻¹ over de geometrie met alles in zicht en elke subgeometrie met één enkele fout, geprojecteerd op de lokale verticaal a. Onafhankelijke referentie (ExternalDataset): Twee gevestigde implementaties van derden samengesteld, beide offline uitgevoerd, waarbij de fixture van begin tot eind opnieuw is gegenereerd en byte-identiek is bevonden. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c gecompileerd uit C-broncode met -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() inverteert de normaalmatrix met Crout-LU en partiële pivotering, een algoritme dat geen verband houdt met de met de hand geschreven Gauss-Jordan invert4() van kshana

seg-3c54da43686e = <s1>Vorige</s1>lunar-infrastructure

seg-f6b399c3fd4a = <s1>Volgende</s1>lunar-interop-export
