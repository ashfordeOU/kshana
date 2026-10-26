# docs--kind-cislunar-arc-recovery: translations (da)

seg-debc2f07db78 = true

seg-330cbcd04718 = brøkdel (dimensionsløs)

seg-8f21a5462b09 = Kilde: <c1/>

seg-e4858b0a33c9 = <c1/> (scenarietype)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-f994c81583bf = MODELLED test med uafhængig estimator af tærsklen for observerbarhed ved cislunar buelængde. Denne tærskel er en RANG-aflæsning på observerbarhedsmatrixen, opbygget af de ANALYTISKE rækker i afstandsjacobianen og den ANALYTISKE variationelle tilstandsovergangsmatrix, og dens krydskontrol med kvadratrodsinformationsfilteret folder de samme rækker — en konsistenskontrol mellem to numeriske maskiner, ikke en bekræftelse. Denne type leverer den manglende voldgiftsdommer: en batch-estimator med mindste kvadrater, der faktisk GENFINDER chiefens begyndelsestilstand ud fra simulerede målinger, med målingernes partielle afledede taget som CENTRALE DIFFERENSKVOTIENTER af den sammensatte fremadmodel. Den kalder ingen analytisk jacobirække, ingen variationel STM, ingen singulærværdi- eller egenværdidekomposition, ingen ranktolerance og intet kvadratrodsinformationsfilter — en kildetekstvagt i tests/cislunar_arc_recovery_reference.rs gør det kontrollerbart — mens dynamikken (det samme RK4 CR3BP-flow), begyndelsesbetingelserne (den samme differentialkorrigerede konstellation), den skalære observabel og epokegitteret deles bevidst og navngives i den udsendte <c1/>-blok, fordi to analyser af ét fysisk problem må være enige om fysikken for at være sammenlignelige. To kriterier, hvert gennemsøgt over fem dekader af sin egen grænse: STØJFRI GENFINDING (hvert seedet forsøgs endelige tilstandsfejl højst recovery_factor gange dets a priori-forskydning — rang-analogen, uden singulærværdi-tolerance) og MONTE CARLO-ESTIMERBARHED (den målte RMS-positionsfejl over et seedet støjensemble under en angivet grænse — estimerbarhedsanalogen, målt frem for forudsagt). Understøtter den plane firetilstands- og den rumlige seks-tilstandsmodel, familierne DRO / L2-halo / L2-NRHO, observabler for afstand og afstandsrate samt en Måne-centreret polær parametrisering, hvor transformationen anvendes på TILSTANDEN, og fremadmodellen differentieres påny dér. MÅLT på det publicerede plane DRO-gitter: estimatoren genfinder firetilstanden fra { "0.782609" } h mod rangkriteriets { "2.086957" } h ved rel_tol { "1e-6" } (forhold { "0.375" }) — rangtærsklen er IKKE bekræftet som en grænse for genfindelighed — mens den målte estimerbarhedsgrænse ligger i samme gitterfelt som den formelle, { "5.739130" } h, og den målte fejlkurve gengiver den formelle 1-sigma over { "21" } buelængder med et geometrisk gennemsnitsforhold på { "0.98" }. MODELLED: konstellationsdesignet, epokegitteret, det ene sporede link, forskydningens størrelse, målesigmaen og de to angivne grænser. Ikke et certificeret navigationsydelsesprodukt.

seg-ada71f37b21b = Én kørsel af <c1/> opsummeres som: cislunar-arc-recovery | dro-familie, 4-tilstand, { "4" } s/c, afstandsobservabel, kartesisk parametrisering | { "6.0" } h bue, { "24" } epoker (gitter { "0.260870" } h), { "32" } forsøg, seed { "20260920" } | partielle afledede med differenskvotienter, ingen analytisk Jacobian / STM / SVD / SRIF | støjfri genfinding fra { "0.782609" } h (faktor { "1e-2" }) mod Gramianens rangtærskel { "2.086957" } h | Monte Carlo-estimerbarhed fra { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) mod Gramianens estimerbarhed { "5.739130" } h | RMS pos ved buens slutning { "0.6026" } km

seg-3d4a2773c32f = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Eksemplet <c1/> angiver blandt andet:

seg-6d584e86deba = forhold (dimensionsløst)

seg-f7f4d06e661f = cislunar-observability på den identiske

seg-a6cb7ed2ff6d = Resultatmærkat (motorens egen): MODELLED test af genfinding af cislunar buelængde (bekræftelse med uafhængig estimator af P6-tærsklen for observerbarhed). VALIDATED kerne: estimatoren er crate'ens eksisterende vægtede Gauss-Newton-batchkorrektor (crate::batch_ls), hvis designmatrix er en CENTRAL DIFFERENSKVOTIENT af den sammensatte fo

seg-2fe411ae2153 = Diagrammet, som motoren skriver for scenarios/cislunar-arc-recovery.toml, type cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> En batch-estimator med mindste kvadrater, der GENFINDER chiefens begyndelsestilstand ud fra simulerede målinger mellem satellitter over voksende præfikser af det samme epokegitter, som tabellen rang-mod-bue bruger, med målingernes partielle afledede taget som central differenskvotient Tests: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> En batch-estimator med mindste kvadrater, der GENFINDER chiefens begyndelsestilstand ud fra simulerede målinger mellem satellitter over voksende præfikser af det samme epokegitter. Uafhængig reference (ReferenceImpl): En separat estimator i denne kodebase på en anden algoritme og en usammenhængende kodesti: ikke-lineær vægtet Gauss-Newton med differenskvotient-partielle afledede, hvis udfald aflæses som en målt fejl i tilstandsgenfinding i km og mm/s. Den har intet udtryk til fælles med Gramianens rang-og-kovarians-vej, og adskillelsen HÅNDHÆVES af en kildetekstvagt frem for blot at blive påstået. MÅLT på det publicerede plane DRO-gitter: th

seg-7be582874f98 = MODELLED test af genfinding af cislunar buelængde (bekræftelse med uafhængig estimator af P6-tærsklen for observerbarhed). VALIDATED kerne: estimatoren er crate'ens eksisterende vægtede Gauss-Newton-batchkorrektor (crate::batch_ls), hvis designmatrix er en CENTRAL DIFFERENSKVOTIENT af den sammensatte fremadmodel - den kalder ingen analytisk måle-jacobirække, ingen variationel tilstandsovergangsmatrix, ingen singulærværdi- eller (resultat <c1/>)

seg-52fe686b1fdf = MODELLED test med uafhængig estimator af tærsklen for observerbarhed ved cislunar buelængde. (typekatalog (<c1/>))

seg-48e6e57a0b40 = MODELLED: konstellationsdesignet, epokegitteret, det ene sporede link, forskydningens størrelse, målesigmaen og de to angivne grænser. (typekatalog (<c1/>))

seg-75f275dcb2d2 = MODELLED: konstellationsdesignet, epokegitteret, det ene sporede link, forskydningens størrelse, målesigmaen og de to angivne grænser. Ikke et certificeret navigationsydelsesprodukt. (kommentar i scenariefilen, linje { "33" } til { "35" })

seg-ea82d9fd6506 = Bekræftelse af tærsklen for cislunar buelængde med uafhængig estimator er MODELLED, ikke valideret: kontrolleret mod en separat implementering i denne samme kodebase — uafhængig af den enhed, der afprøves, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-53d57e6dafa6 = <s1>Forrige</s1>campaign

seg-fe3ecf4b55fe = <s1>Næste</s1>cislunar-observability
