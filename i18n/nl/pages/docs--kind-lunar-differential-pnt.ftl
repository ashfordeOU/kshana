# docs--kind-lunar-differential-pnt: translations (nl)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-549a6103e711 = bit

seg-d0c9bec248b4 = Bron: <c1/>

seg-d226df2bb634 = <c1/> (scenariosoort)

seg-8ac5ac006ae7 = Gemodelleerde DIFFERENTIËLE PNT op de maan (een maananaloog van DGNSS/SBAS): een referentiestation van het type NovaMoon op een BEKENDE selenografische locatie berekent differentiële correcties per satelliet uit een ILLUSTRATIVE constellatie van het type Moonlight/LCNS uit openbare bronnen (NovaMoon alleen genoemd als systeem-KLASSE, niet gelieerd aan ESA), en een gebruiker op baseline_km afstand past ze toe zodat de GEMEENSCHAPPELIJKE baan- en klokfouten wegvallen. De kloktermijn valt EXACT weg (een algebraïsche identiteit); van de baantermijn blijft alleen de projectie van het verschil in zichtlijn over, die → { "0" } gaat als basislijn → { "0" } (de ruimtelijke decorrelatievloer) en ≈ lineair groeit met de basislijn. Rapporteert de 3D-positiefout van de gebruiker mét en zonder correcties, de reductiefactor, de curve van fout tegen basislijn, en een beschermingsniveau voor de gebruiker dat de SBAS-machinerie van DO-229E (crate::sbas) HERGEBRUIKT met het differentiële residu σ. MODELLED — exacte wegvalidentiteit + eerste-orde-decorrelatiemodel; niet getoetst aan echte gegevens; geen TRL, geen heritage, geen goedkeuring door een ruimtevaartorganisatie. Deterministisch indien van een seed voorzien.

seg-4b7355b174a3 = Eén run van <c1/> vat zich samen als: lunar-differential-pnt | { "8" } sats (illustratief, van het type LCNS, niet gelieerd) | basislijn { "50" } km | gebruikersfout { "24.46" } m → { "0.0077" } m ({ "3186" }× reductie) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Het voorbeeld <c1/> stelt onder meer in:

seg-8e67df89448a = De grafiek die de engine schrijft voor scenarios/lunar-differential-pnt.toml, soort lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> Differentieel referentiestation van het type NovaMoon: wegvallen van gemeenschappelijke fouten + met de basislijn groeiend residu + DGNSS-beschermingsniveaus. Onafhankelijke referentie (InternalConsistency): Identiteit voor het wegvallen van differentiële fouten + hergebruik van de SBAS-PL-machinerie van DO-229E; de oplossing met enkelvoudig verschil + WLS wordt daarnaast gecontroleerd aan lsq()/matinv() van RTKLIB (Takasu, BSD-2-Clause, gecompileerde C) — onafhankelijke solvercode, maar dezelfde eerste-orde-algebra van het LOS-verschil, dus nog steeds InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De drie termen die een differentiële correctie oploopt tussen de epoch waarop ze wordt berekend en de epoch waarop ze wordt gebruikt, elk eerder als ongemodelleerde marge gelaten:. Onafhankelijke referentie (InternalConsistency): Identiteiten in gesloten vorm en zelfconsistentie: de variantie step²/12 van de uniforme kwantisator, de exacte voortplanting van de covariantie (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ die voor gelijke σ terugvalt op σ·PDOP, de overdracht { "1" }:{ "1" } van de opmetingsterm als gevolg van û_user ≈ û_ref, en sluiting van de kwadratuur bij uitschakeling. De PDOP-controle ten opzichte van orbit::dop deelt de normaalmatrix [−û, { "1" }], dus het is een consistentiecontrole en wordt ook als zodanig benoemd in plaats van als een on

seg-f1e7283d2e15 = MODELLED — exacte identiteit voor het wegvallen van fouten + eerste-orde-decorrelatiemodel; niet getoetst aan echte gegevens; geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie. (soortencatalogus (<c1/>))

seg-9d54d8c07ca3 = EERLIJKHEID: MODELLED. Het wegvallen van gemeenschappelijke fouten is een EXACTE algebraïsche identiteit; het residu van ruimtelijke decorrelatie is een EERSTE-ORDE geometrisch model (de projectie van het LOS-verschil van een geïnjecteerde baanfout), geen gefit decorrelatiemodel uit echte maantracking. Het beschermingsniveau voor de gebruiker HERGEBRUIKT de machinerie voor SBAS-beschermingsniveaus van DO-229E (crate::sbas) met de sigma van het differentiële residu als de fout per satelliet (commentaar in het scenariobestand, regels { "23" } tot { "28" })

seg-4156a7515574 = ── DE CORRECTIELINK ────────────────────────────────────────────────────────────── De identiteit hierboven veronderstelt een PERFECTE correctie: berekend door een station dat precies weet waar het staat, onmiddellijk geleverd, met oneindige resolutie. Geen van de drie gaat op, en de drie invoeren hieronder modelleren wat elk kost. Ze voeden ALLEEN het blok <c1/> van het resultaatdocument -- met alle drie op de waarden die hier staan (commentaar in het scenariobestand, regels { "57" } tot { "62" })

seg-e7f016777e09 = OPMETINGSFOUT. Het station vormt zijn correctie ten opzichte van de coördinaat die het GELOOFT te hebben. Een fout daarin gaat mee met elke correctie die het uitzendt en bereikt de gebruiker als -delta . u_ref -- die helemaal geen gebruikersgeometrie bevat, zodat ze, anders dan de baanterm, noch verdwijnt bij een basislijn van nul noch groeit met de basislijn, en ongeveer één op één doorwerkt in de positie van de gebruiker. De standaardwaarde { "0.30" } m is de eigen maanreferentie van de crate (commentaar in het scenariobestand, regels { "64" } tot { "70" })

seg-e0648d9b52b4 = VEROUDERING VAN DE CORRECTIE. Een correctie die op t is berekend en op t+tau wordt toegepast, is op twee manieren verouderd. Baan: de satelliet is VERPLAATST, dus de bevroren baanfoutvector projecteert nu op een gedraaide zichtlijn; de rotatie komt uit de eigen propagator van deze crate, zodat nergens een baanfoutsnelheid wordt aangenomen. Klok: de satellietklok is gedreven met c*sigma_y(tau)*tau voor de machtswet van de volledige RAFS in crate::clock_specs, gekalibreerd de (commentaar in het scenariobestand, regels { "73" } tot { "79" })

seg-7171b2e3f29d = Differentiële PNT op de maan is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Differentiële PNT op de maan — residubudget van de correctielink is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Onderwerppagina: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Vorige</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Volgende</s1>lunar-frame-campaign

seg-e66e2ca31e54 = Onderwerppagina: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-f9d918743ec6 = <s1>Vorige</s1>lunar-descent
