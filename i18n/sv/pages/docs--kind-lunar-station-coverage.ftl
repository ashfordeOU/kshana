# docs--kind-lunar-station-coverage: translations (sv)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED. (typkatalog (<c1/>))

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-3bc1761c76ab = { "3" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-f3231c08fa26 = Källa: <c1/>

seg-1a28838279fe = <c1/> (scenariotyp)

seg-f7ea776e70c9 = Modellerad täckning för lunar referensstation: en Monte Carlo-svepning av den lunara differentiella PNT-modellen över ett användarrutnät vid sydpolen och ett dygn av epoker. En differentiell referensstation på en känd plats vid sydpolen korrigerar en angiven konstellation (illustrativ keplersk eller en tabellerad efemerid) med ett angivet fel för signal i rymden, inmätningsfel, korrektionslatens och länkkvantisering; per punkt och över regionen redovisar den percentilen för korrigerat och okorrigerat positionsfel (3D, horisontellt, vertikalt), tillgänglighet, täckning mot en angiven tröskel, skyddsnivåer enligt DO-229E, täckningsradien per azimut och korrektionslänkens budget vid stationen och vid den sämsta punkten. Inget påstående om prestandan hos något verkligt system; inte knutet till eller stött av någon myndighet. MODELLED.

seg-d18c93c2e136 = En körning av <c1/> sammanfattas som: lunar-station-coverage | { "346" } punkter x { "144" } epoker x { "200" } försök | tillgänglighet { "92.2" } % | täckning { "76.5" } % (p95 <= { "20" } m) | korrigerat p95 3D { "15.592" } m (okorrigerat { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; inget påstående om något verkligt system

seg-cb73ac0d57de = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

seg-0c3460704315 = Exemplet <c1/> anger bland annat:

seg-2d84b341a41f = Resultatetikett (motorns egen): MODELLED

seg-922b8656fcae = Diagrammet som motorn skriver för scenarios/lunar-station-coverage.toml, typ lunar-station-coverage

seg-4f5941f12127 = <b>MODELLED</b> Monte Carlo-svep av den lunara differentiella PNT-modellen över ett användarrutnät vid sydpolen och ett dygns epoker (typen <c1/>): för en differentiell referensstation på en känd plats vid sydpolen, per punkt och över regionen, de Tester: <a1>lunar_station_coverage_reference.rs</a1>.

seg-d547d600ee2d = <b>MODELLED</b> Monte Carlo-svep av den lunara differentiella PNT-modellen över ett användarrutnät vid sydpolen och ett dygns epoker (typen <c1/>): för en differentiell r. Oberoende referens (InternalConsistency): Aritmetik omräknad av ett oberoende numpy-skript på exporterade fall (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; förhandsregistrerad i tests/fixtures/lunar_station/PREREGISTRATION.md, incheckad ensam i 9caedf97 före den första körningen): för { "20" } fall med alla felkällor aktiverade är de synliga mängderna och statusen identiska, de råa avståndsfelen ligger inom { "1.4e-14" } m från varandra, positionsfelsvektorerna och deras belopp inom { "1.4e-9" } m mot

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-6f09def22469 = ÄRLIGHET: MODELLED. Under de antaganden som anges nedan ger modellen dessa värden. Det är inget påstående om prestandan hos något verkligt system; inte knutet till eller stött av någon myndighet; inga påståenden om TRL eller flygerfarenhet. Utelämnat: terräng- och horisontmaskering vid polen (den första begränsningen), flervägsutbredning, mottagarhårdvara. (kommentar i scenariofilen, rad { "15" } till { "18" })

seg-db27cc015952 = Täcknings- och noggrannhetskartan för en lunar referensstation är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Föregående</s1>lunar-llr-datum

seg-625c1973128e = <s1>Nästa</s1>lunar-time-budget
