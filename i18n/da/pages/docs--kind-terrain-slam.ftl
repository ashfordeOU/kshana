# docs--kind-terrain-slam: translations (da)

seg-216efc4e6fba = Scenarietype i motoren v{ $version }, familie <a1>Alternativ PNT uden GPS</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-619127334cf3 = Ingen matrixrække nævner denne type ved navn; mærkaten på dens resultat er motorens egen, ovenfor.

seg-0df60ac6343f = <b>MODELLED</b> Tyngdekraftskortmatchning, terrænreferenceret (TERCOM/SITAN), magnetisk anomali. Uafhængig reference (InternalConsistency): IGRF-14-koefficienter; matched-filter-CRLB fra grundprincipper. Feltet i benchmarken med reelt tyngdefelt er eksternt kontrolleret (række 'Gravity-anomaly synthesis from a spherical-harmonic model'), men dens navigationsudfald har ingen ekstern uafhængig reference

seg-d776abd5691c = Alternativ / komplementær PNT er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familieside: <a1>Alternativ PNT uden GPS</a1>

seg-bb7c9c4d4b5d = Kilde: <c1/>

seg-562e59d703e3 = <c1/> (scenarietype)

seg-6bdc150ab25b = Sekventiel (rekursiv) terrænreferencenavigation uden GPS: et partikelfilter kører målemodellen for terrænafstemning epoke for epoke (SITAN som et løbende filter), så en tidsvarierende INS-drift følges langs sporet, hvor det batchbaserede terrain-nav kun genfinder én konstant forskydning.

seg-1e4350c2c5f0 = Én kørsel af <c1/> opsummeres som: terrain-slam | { "60" } waypoints | fri inerti-RMS { "2947" } m (slutværdi { "5082" } m) | terrænafstemt RMS { "1241" } m (slutværdi { "69" } m, 2x reduktion) | gennemsnitlig ESS 2599/4000 | afstemnings-sigma { "17.0" } m

seg-939d877137f6 = Påkrævede felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5ceb5b8597ac = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-48e022b0945e = Eksemplet <c1/> angiver blandt andet:

seg-4aca87f022dc = Diagrammet, som motoren skriver for scenarios/terrain-slam.toml, type terrain-slam

seg-832919783819 = <s1>Forrige</s1>terrain-nav

seg-1693abd546fe = <s1>Næste</s1>time-transfer-budget
