# docs--kind-lunar-station-coverage: translations (da)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-6f4246bd8f6f = <b>MODELLED</b> Differentiel referencestation af NovaMoon-klassen: ophævelse af fælles fejl + rest, der vokser med baseline + DGNSS-beskyttelsesniveauer. Uafhængig reference (InternalConsistency): Identitet for differentiel fejlophævelse + genbrug af DO-229E SBAS PL-maskineriet; single-difference + WLS-løsningen er desuden krydskontrolleret mod RTKLIB's lsq()/matinv() (Takasu, BSD-2-Clause, kompileret C) — uafhængig solverkode, men den samme førsteordens LOS-differensalgebra, så den er stadig InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De tre led, som en differentialkorrektion opsamler mellem den epoke, den beregnes ved, og den epoke, den anvendes ved, hver tidligere efterladt som ikke-modelleret spillerum:. Uafhængig reference (InternalConsistency): Identiteter i lukket form og selvkonsistens: kvantiseringens trinvarians step²/12, den præcise kovariansudbredelse (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹, der falder sammen til σ·PDOP ved ens σ, opmålingsleddets overførsel { "1" }:{ "1" } som en følge af û_user ≈ û_ref og kvadraturlukning ved frakobling. PDOP-krydskontrollen mod orbit::dop deler normalmatrixen [−û, { "1" }], så den er en konsistenskontrol og er mærket som sådan i stedet for en uafhængig

seg-7171b2e3f29d = Lunar differentiel PNT er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Lunar differentiel PNT — restbudget for korrektionslinket er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Emneside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-f3231c08fa26 = Kilde: <c1/>

seg-1a28838279fe = <c1/> (scenarietype)

seg-f7ea776e70c9 = Modelleret dækning af lunar referencestation: et Monte Carlo-sweep af den lunare differentielle PNT-model over et sydpolart brugergitter og et døgn af epoker. En differentiel referencestation på et kendt sted ved sydpolen korrigerer en angivet konstellation (illustrativ Kepler-konstellation eller en tabuleret efemeride) med en angivet signal-in-space-fejl, opmålingsfejl, korrektionsforsinkelse og kvantisering af linket; pr. punkt og over regionen rapporterer den percentilen af korrigeret og ukorrigeret positionsfejl (3D, horisontal, vertikal), tilgængelighed, dækning mod en angivet tærskel, DO-229E-beskyttelsesniveauer, dækningsradius pr. azimut og korrektionslinkets budget ved stationen og ved det værste punkt. Ikke en udtalelse om ydeevnen af noget reelt system; ikke tilknyttet eller støttet af nogen myndighed. MODELLED.

seg-d18c93c2e136 = Én kørsel af <c1/> opsummeres som: lunar-station-coverage | { "346" } points x { "144" } epochs x { "200" } trials | availability { "92.2" } % | coverage { "76.5" } % (p95 <= { "20" } m) | corrected p95 3-D { "15.592" } m (uncorrected { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; not a statement about any real system

seg-cb73ac0d57de = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

seg-0c3460704315 = Eksemplet <c1/> sætter blandt andet:

seg-2d84b341a41f = Resultatmærkat (motorens egen): MODELLED

seg-922b8656fcae = Diagrammet, som motoren skriver for scenarios/lunar-station-coverage.toml, type lunar-station-coverage

seg-4f5941f12127 = <b>MODELLED</b> Monte Carlo-sweep af den lunare differentielle PNT-model over et sydpolart brugergitter og et døgn af epoker (typen <c1/>): for en differentiel referencestation på et kendt sted ved sydpolen, pr. punkt og over regionen, de Tests: <a1>lunar_station_coverage_reference.rs</a1>.

seg-d547d600ee2d = <b>MODELLED</b> Monte Carlo-sweep af den lunare differentielle PNT-model over et sydpolart brugergitter og et døgn af epoker (typen <c1/>): for en differentiel r. Uafhængig reference (InternalConsistency): Aritmetik genberegnet af et uafhængigt numpy-script på eksporterede tilfælde (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; præregistreret i tests/fixtures/lunar_station/PREREGISTRATION.md, committet alene i 9caedf97 før første kørsel): på { "20" } tilfælde med alle fejlled slået til er de synlige mængder og status identiske, de rå afstandsfejl stemmer til { "1.4e-14" } m, positionsfejlvektorerne og deres størrelser til { "1.4e-9" } m mod

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-6f09def22469 = ÆRLIGHED: MODELLED. Under de nedenfor angivne antagelser giver modellen disse tal. Ikke en udtalelse om ydeevnen af noget reelt system; ikke tilknyttet eller støttet af nogen myndighed; intet krav om TRL eller heritage. Udeladt: terræn- og horisontmaskering ved polen (den første begrænsning), flervejsudbredelse, modtagerhardware. (kommentar i scenariefilen, linje { "15" } til { "18" })

seg-db27cc015952 = Dækning og nøjagtighedskort for lunar referencestation er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger afskrivnings- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Forrige</s1>lunar-llr-datum

seg-625c1973128e = <s1>Næste</s1>lunar-time-budget
