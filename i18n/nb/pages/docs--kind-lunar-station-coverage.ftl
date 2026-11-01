# docs--kind-lunar-station-coverage: translations (nb)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED. (typekatalog (<c1/>))

seg-1f17ef6a853e = Scenariotype i motoren v{ $version }, familie <a1>Måne og cislunart rom</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rom</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-6f4246bd8f6f = <b>MODELLED</b> Differensiell referansestasjon av NovaMoon-klassen: opphevelse av felles feil + rest som vokser med grunnlinjen + DGNSS-beskyttelsesnivåer. Uavhengig referanse (InternalConsistency): Identitet for differensiell feilopphevelse + gjenbruk av DO-229E SBAS PL-maskineriet; enkeltdifferansen + WLS-løsningen er i tillegg kryssjekket mot RTKLIBs lsq()/matinv() (Takasu, BSD-2-Clause, kompilert C): uavhengig løserkode, men den samme førsteordens LOS-differansealgebraen, så den er fortsatt InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> De tre leddene en differensialkorreksjon får mellom epoken den beregnes ved og epoken den brukes ved, hver tidligere latt stå som umodellert rom:. Uavhengig referanse (InternalConsistency): Lukkede identiteter og selvkonsistens: variansen step²/12 til den uniforme kvantisereren, den eksakte kovarianspropagasjonen (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ som kollapser til σ·PDOP for lik σ, overføringen { "1" }:{ "1" } for oppmålingsleddet som en følge av û_user ≈ û_ref, og kvadraturlukking ved frakobling. PDOP-kryssjekken mot orbit::dop deler normalmatrisen [−û, { "1" }], så den er en konsistenskontroll og er merket som det i stedet for en

seg-7171b2e3f29d = Differensiell PNT på månen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Differensiell PNT på månen, restbudsjett for korreksjonslinken, er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Temaside: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-f3231c08fa26 = Kilde: <c1/>

seg-1a28838279fe = <c1/> (scenariotype)

seg-f7ea776e70c9 = Modellert dekning av referansestasjon på månen: et Monte Carlo-sveip av modellen for differensiell PNT på månen over et brukerrutenett ved sørpolen og et døgn av epoker. En differensiell referansestasjon på et kjent sted ved sørpolen korrigerer en oppgitt konstellasjon (illustrativ keplersk eller en tabellert efemeride) med en oppgitt feil i signalet i rommet, oppmålingsfeil, korreksjonsforsinkelse og linkkvantisering; per punkt og over regionen rapporterer den persentilen av korrigert og ukorrigert posisjonsfeil (3D, horisontal, vertikal), tilgjengelighet, dekning mot en oppgitt terskel, DO-229E-beskyttelsesnivåer, dekningsradius per asimut og budsjettet for korreksjonslinken ved stasjonen og ved det verste punktet. Ikke en påstand om ytelsen til noe virkelig system; ikke tilknyttet eller støttet av noe byrå. MODELLED.

seg-d18c93c2e136 = Én kjøring av <c1/> oppsummeres slik: lunar-station-coverage | { "346" } punkter x { "144" } epoker x { "200" } forsøk | tilgjengelighet { "92.2" } % | dekning { "76.5" } % (p95 <= { "20" } m) | korrigert p95 3D { "15.592" } m (ukorrigert { "1056.892" } m) | HPL maks { "480.385" } m | MODELLED; ikke en påstand om noe virkelig system

seg-cb73ac0d57de = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

seg-0c3460704315 = Eksempelet <c1/> setter blant annet:

seg-2d84b341a41f = Resultatetikett (motorens egen): MODELLED

seg-922b8656fcae = Diagrammet motoren skriver for scenarios/lunar-station-coverage.toml, type lunar-station-coverage

seg-4f5941f12127 = <b>MODELLED</b> Monte Carlo-sveip av modellen for differensiell PNT på månen over et brukerrutenett ved sørpolen og et døgn av epoker (typen <c1/>): for en differensiell referansestasjon på et kjent sted ved sørpolen, per punkt og over regionen, den Tester: <a1>lunar_station_coverage_reference.rs</a1>.

seg-d547d600ee2d = <b>MODELLED</b> Monte Carlo-sveip av modellen for differensiell PNT på månen over et brukerrutenett ved sørpolen og et døgn av epoker (typen <c1/>): for en differensiell r. Uavhengig referanse (InternalConsistency): Aritmetikk beregnet på nytt av et uavhengig numpy-skript på eksporterte tilfeller (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; forhåndsregistrert i tests/fixtures/lunar_station/PREREGISTRATION.md, innsjekket alene i 9caedf97 før første kjøring): på { "20" } tilfeller med hvert feilledd påslått er de synlige mengdene og statusen identiske, de rå avstandsfeilene stemmer til { "1.4e-14" } m, posisjonsfeilvektorene og størrelsene til { "1.4e-9" } m mot

seg-626ab55f0424 = MODELLED (resultat <c1/>)

seg-6f09def22469 = ÆRLIGHET: MODELLED. Under de oppgitte forutsetningene nedenfor gir modellen disse verdiene. Ikke en påstand om ytelsen til noe virkelig system; ikke tilknyttet eller støttet av noe byrå; ingen påstand om TRL eller heritage. Utelatt: terreng- og horisontmaskering ved polen (den første begrensningen), flerveis, mottakermaskinvare. (kommentar i scenariofilen, linje { "15" } til { "18" })

seg-db27cc015952 = Dekning og nøyaktighetskart for referansestasjon på månen er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet; fanger opp avskrivings- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Forrige</s1>lunar-llr-datum

seg-625c1973128e = <s1>Neste</s1>lunar-time-budget

seg-bf7d64a925dd = <s1>Forrige</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>Neste</s1>lunar-surface
