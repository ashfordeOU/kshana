# docs--kind-eo-coverage: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-3068552e4ab4 = VALIDATED: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-98151954f217 = false

seg-8e62cc4af6ea = Onderwerppagina: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Bron: <c1/>

seg-d72c017ca1fa = <c1/> (scenariokind)

seg-47b4aea6ed01 = Voetafdruk van een aardobservatiepayload en dekkingsgeometrie (SMAD-ruimtedriehoek): hoekstraal van de Aarde, zwadbreedte, grondafstand van een sample in nadir, maximale toegang buiten nadir, cirkelvormige periode, J2-knoopperiode en equatoriale grondspoorafstand met een vlag voor aaneengesloten dekking, voor een baanhoogte, inclinatie (standaard zonsynchroon) en sensor-FOV/IFOV. MODELLED bolvormige-Aardegeometrie (geen radiometrie/MTF/atmosfeer/jitter/glint); knoopafstand R_e·(ω − Ω̇)·T_nodal met eerste-orde seculaire J2-snelheden.

seg-105bb8a3c33f = Eén run van <c1/> vat samen als: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> zwad van { "184" } km, { "9.8" } m GSD in nadir, toegang tot { "745" } km buiten nadir; knoopafstand { "2752" } km (met gaten) (MODELLED)

seg-609c5b7bc6f1 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Het voorbeeld <c1/> stelt onder meer in:

seg-834408a40783 = min

seg-ade2ba71a96c = Resultaatlabel (van de engine): MODELLED — ruimtedriehoeksgeometrie van een bolvormige Aarde; zwad/GSD/toegang zijn geometrisch (geen radiometrie/MTF/atmosfeer/jitter/glint), de grondspoorafstand is R_e·(ω − Ω̇)·T_nodal met eerste-orde seculaire J2-snelheden

seg-c2a8332f2ee2 = De grafiek die de engine schrijft voor scenarios/eo-coverage.toml, kind eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> SMAD-ruimtedriehoeksgeometrie: hoekstraal van de Aarde, zwadbreedte, GSD in nadir, maximale toegang buiten nadir en cirkelvormige periode, plus de eerste-orde J2-knoopperiode (eo_payload::j2_nodal_period) en de equatoriale grondspoorafstand R_e (omega_ Tests: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> SMAD-ruimtedriehoeksgeometrie: hoekstraal van de Aarde, zwadbreedte, GSD in nadir, maximale toegang buiten nadir en cirkelvormige periode, plus de eerste-orde J2-knoopperiode (. Onafhankelijke referentie (ExternalDataset): Orekit { "12.2" } (Apache-2.0) en GeographicLib { "2.1" } (MIT), beide als afzonderlijke programma's uitgevoerd, vooraf vastgelegd (766823f3) vóór de engine-wijziging en vóór enige referentierun: bolgrootheden binnen { "1e-9" } relatief (slechtste: hoekstraal { "5.4e-16" }, zwad { "7.0e-13" }, toegang { "1.9e-14" }), periode { "1e-12" } ({ "1.6e-16" }), GSD in nadir { "1e-7" } ({ "2.9e-10" }), de J2-knoopperiode en de knoopafstand binnen { "0.1" } % van een numerieke J2-propagatie in Orekit met een knoopdetector ({ "1" }

seg-45625167e59f = MODELLED — ruimtedriehoeksgeometrie van een bolvormige Aarde; zwad/GSD/toegang zijn geometrisch (geen radiometrie/MTF/atmosfeer/jitter/glint), de grondspoorafstand is R_e·(ω − Ω̇)·T_nodal met eerste-orde seculaire J2-snelheden (resultaat <c1/>)

seg-cf22f13c78d3 = MODELLED bolvormige-Aardegeometrie (geen radiometrie/MTF/atmosfeer/jitter/glint); knoopafstand R_e·(ω − Ω̇)·T_nodal met eerste-orde seculaire J2-snelheden. (kindcatalogus (<c1/>))

seg-153325fb00d3 = EERLIJKE REIKWIJDTE: alleen MODELLED bolvormige-Aardegeometrie -- geen model voor radiometrie / MTF / atmosfeer / richtjitter / zonneglinstering. De grondspoorafstand is R_e*(omega - dOmega/dt)*T_nodal met eerste-orde seculaire J2-snelheden; de inclinatie staat standaard op de zonsynchrone voor de hoogte. Run: kshana scenarios/eo-coverage.toml (opmerking in het scenariobestand, regels { "7" } tot { "11" })

seg-5dc02c3d10f7 = <s1>Vorige</s1>entry-heating

seg-33f408d48d13 = <s1>Volgende</s1>eo-radiometry
