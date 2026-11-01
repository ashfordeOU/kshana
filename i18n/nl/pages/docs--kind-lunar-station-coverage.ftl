# docs--kind-lunar-station-coverage: translations (nl)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED. (kindcatalogus (<c1/>))

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-3bc1761c76ab = { "3" } meegeleverde scenario's gebruiken dit kind; de overige staan in <a1><c1/></a1>.

seg-6f4246bd8f6f = <b>MODELLED</b> Differentieel referentiestation van het type NovaMoon: wegvallen van gemeenschappelijke fouten + met de basislijn groeiend residu + DGNSS-beschermingsniveaus. Onafhankelijke referentie (InternalConsistency): Identiteit voor het wegvallen van differentiële fouten + hergebruik van de SBAS-PL-machinerie van DO-229E; de oplossing met enkelvoudig verschil + WLS wordt daarnaast gecontroleerd aan lsq()/matinv() van RTKLIB (Takasu, BSD-2-Clause, gecompileerde C) — onafhankelijke solvercode, maar dezelfde eerste-orde-algebra van het LOS-verschil, dus nog steeds InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De drie termen die een differentiële correctie oploopt tussen de epoch waarop ze wordt berekend en de epoch waarop ze wordt gebruikt, elk eerder als ongemodelleerde marge gelaten:. Onafhankelijke referentie (InternalConsistency): Identiteiten in gesloten vorm en zelfconsistentie: de variantie step²/12 van de uniforme kwantisator, de exacte voortplanting van de covariantie (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ die voor gelijke σ terugvalt op σ·PDOP, de overdracht { "1" }:{ "1" } van de opmetingsterm als gevolg van û_user ≈ û_ref, en sluiting van de kwadratuur bij uitschakeling. De PDOP-controle ten opzichte van orbit::dop deelt de normaalmatrix [−û, { "1" }], dus het is een consistentiecontrole en wordt ook als zodanig benoemd in plaats van als een on

seg-7171b2e3f29d = Differentiële PNT op de maan is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Differentiële PNT op de maan — residubudget van de correctielink is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Onderwerppagina: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-f3231c08fa26 = Bron: <c1/>

seg-1a28838279fe = <c1/> (scenariosoort)

seg-f7ea776e70c9 = Gemodelleerde dekking van een referentiestation op de maan: een Monte Carlo-sweep van het differentiële PNT-model voor de maan over een gebruikersraster bij de zuidpool en een dag aan epochs. Een differentieel referentiestation op een bekende locatie bij de zuidpool corrigeert een vermelde constellatie (illustratief met keplerbanen of een getabelleerde efemeride) met een vermelde signal-in-space-fout, opmetingsfout, correctielatentie en kwantisatie van de link; per punt en over de regio rapporteert het de percentielen van de gecorrigeerde en niet-gecorrigeerde positiefout (3D, horizontaal, verticaal), beschikbaarheid, dekking ten opzichte van een vermelde drempel, beschermingsniveaus volgens DO-229E, de dekkingsstraal per azimut en het linkbudget van de correctielink bij het station en bij het ongunstigste punt. Geen uitspraak over de prestaties van enig echt systeem; niet gelieerd aan of onderschreven door enige organisatie. MODELLED.

seg-d18c93c2e136 = Eén run van <c1/> vat zich samen als: lunar-station-coverage | { "346" } punten x { "144" } epochs x { "200" } proeven | beschikbaarheid { "92.2" } % | dekking { "76.5" } % (p95 <= { "20" } m) | gecorrigeerd p95 3D { "15.592" } m (niet gecorrigeerd { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; geen uitspraak over enig echt systeem

seg-cb73ac0d57de = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

seg-0c3460704315 = Het voorbeeld <c1/> stelt onder meer in:

seg-2d84b341a41f = Resultaatlabel (dat van de engine): MODELLED

seg-922b8656fcae = De grafiek die de engine schrijft voor scenarios/lunar-station-coverage.toml, soort lunar-station-coverage

seg-4f5941f12127 = <b>MODELLED</b> Monte Carlo-sweep van het differentiële PNT-model voor de maan over een gebruikersraster bij de zuidpool en een dag aan epochs (de soort <c1/>): voor een differentieel referentiestation op een bekende locatie bij de zuidpool, per punt en over de regio, de Tests: <a1>lunar_station_coverage_reference.rs</a1>.

seg-d547d600ee2d = <b>MODELLED</b> Monte Carlo-sweep van het differentiële PNT-model voor de maan over een gebruikersraster bij de zuidpool en een dag aan epochs (de soort <c1/>): voor een differentieel r. Onafhankelijke referentie (InternalConsistency): Rekenwerk opnieuw berekend door een onafhankelijk numpy-script op geëxporteerde gevallen (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; preregistratie in tests/fixtures/lunar_station/PREREGISTRATION.md, afzonderlijk vastgelegd in 9caedf97 vóór de eerste run): bij { "20" } gevallen met elke foutterm aan zijn de zichtbare verzamelingen en de status identiek, komen de ruwe afstandsfouten overeen tot { "1.4e-14" } m, de positiefoutvectoren en -groottes tot { "1.4e-9" } m ten opzichte van

seg-626ab55f0424 = MODELLED (resultaat <c1/>)

seg-6f09def22469 = EERLIJKHEID: MODELLED. Onder de hieronder vermelde aannames geeft het model deze cijfers. Geen uitspraak over de prestaties van enig echt systeem; niet gelieerd aan of onderschreven door enige organisatie; geen claim over TRL of heritage. Weggelaten: terrein- en horizonafscherming bij de pool (de eerste beperking), multipad, ontvangerhardware. (commentaar in het scenariobestand, regels { "15" } tot { "18" })

seg-db27cc015952 = De dekkings- en nauwkeurigheidskaart van een referentiestation op de maan is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Vorige</s1>lunar-llr-datum

seg-625c1973128e = <s1>Volgende</s1>lunar-time-budget

seg-bf7d64a925dd = <s1>Vorige</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>Volgende</s1>lunar-surface
