# docs--kind-ins-trn-coast: translations (da)

seg-bf51947657c0 = navigation

seg-3068552e4ab4 = VALIDATED: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-c4ed27a559df = Emneside: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = { "3" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-f7305f3a0b5a = Kilde: <c1/>

seg-92b90cb4a839 = <c1/> (scenarietype)

seg-5b9a6efe6337 = Fejlmodel for INS/TRN-coasting: positionsfejl mod coasting-varighed, bygget ud fra IMU-koefficienter frem for at blive sweepet som en antaget driftrate. Fem vækstbidrag (accelerometer-bias, gyro-bias-hældning via tyngdekraften, velocity random walk, angle random walk og skalafaktor mod tilbagelagt distance) propageres hver gennem en inertial fejlmodel med ni tilstande i lokalt plan med Schuler-feedback ved en angivet breddegrad og højde (de ledende ordens love for kort coasting t², t³, t^{ "1.5" }, t^{ "2.5" } og t¹/t² rapporteres ved siden af) og kombineres under en ANGIVET regel (kvadratsum som standard, eller lineær sum, eller deterministisk sum med stokastisk rss; alle tre beregnes ved hver kørsel, så valget er synligt frem for gemt væk). De coasting-varigheder, der når tærskler for position leveret af kalderen ({ "10" } m og { "50" } m som standard), findes med motorens eksisterende bisektion, hver med en opdeling pr. bidrag, der angiver den dominerende kilde, og hvert enkelt bidrags krydsning inverteres desuden algebraisk, så de to stemmer overens. En tilstand for terrænrelativ navigation afgrænser coastingen med periodiske positionsbestemmelser og rapporterer det største interval mellem bestemmelser, der holder hver tærskel; en positionsbestemmelse kun af position lader hastighedsfejl og hældning leve videre hen over bestemmelsen, så den ikke altid afgrænser coastingen ved nogen bestemmelsesrate, og rapporten siger det frem for at returnere et nul. MODELLED: IMU-klassens koefficienter er repræsentative båndtal, ikke et datablad, og terrænbestemmelsens residual er et input. En tærskel, der ikke nås, rapporteres som null med en status, aldrig som et nul. Ikke et certificeret ydelsesprodukt til inertial navigation.

seg-bbd497aa3ba6 = Én kørsel af <c1/> opsummeres sådan: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

seg-e0555ca683b1 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Eksemplet <c1/> angiver blandt andet:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Resultatmærkat (motorens): MODELLED fejlbudget for INS/TRN-coasting. Hvert bidrag propageres gennem en inertial fejlmodel med ni tilstande i lokalt plan med Schuler-feedback (plan platform med kurs mod nord på et angivet sted, fri inertial inklusive den ustabile vertikale kanal); dens ledende ordens love for kort coasting (bias t^{ "2" }, gy

seg-134a4c91da3a = Diagrammet, som motoren skriver for scenarios/ins-trn-coast.toml, scenarietype ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Budget for positionsfejl mod coasting-varighed bygget ud fra IMU-koefficienter, hver fejlkilde (accelerometer-bias, gyro-bias, velocity random walk, angle random walk, skalafaktor under krydsning og under vedvarende specifik kraft) propageret gennem en n

seg-d69247df315f = <b>VALIDATED</b> Budget for positionsfejl mod coasting-varighed bygget ud fra IMU-koefficienter, hver fejlkilde (accelerometer-bias, gyro-bias, velocity random walk, angle random walk, . Uafhængig reference (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), kørt som et separat program under GNU Octave { "8.4.0" }: kørsler med fri inertial coasting med den samme IMU-fejlprofil, med ét rettet numerisk dødt bånd i dens kvaternionopdatering (qua_update.m: vagten på en rate under { "1e-8" } rad/s erstattet af wnorm == { "0" }, anvendt på en kopi ved kørsel og kontrolleret, at den stemmer én gang; med vagten på plads frøs en langsomt drivende platformsattitude fast og skar

seg-498cb2f96fa7 = MODELLED fejlbudget for INS/TRN-coasting. Hvert bidrag propageres gennem en inertial fejlmodel med ni tilstande i lokalt plan med Schuler-feedback (plan platform med kurs mod nord på et angivet sted, fri inertial inklusive den ustabile vertikale kanal); dens ledende ordens love for kort coasting (bias t^{ "2" }, gyro-bias-hældning t^{ "3" }, velocity random walk t^{ "1.5" }, angle random walk t^{ "2.5" }, skalafaktor x tilbagelagt distance) er krydskontrolleret (resultat <c1/>)

seg-63c221a546f7 = Fejlmodel for INS/TRN-coasting: positionsfejl mod coasting-varighed, bygget ud fra IMU-koefficienter frem for at blive sweepet som en antaget driftrate. (typekatalog (<c1/>))

seg-164504645f4a = MODELLED: IMU-klassens koefficienter er repræsentative båndtal, ikke et datablad, og terrænbestemmelsens residual er et input. (typekatalog (<c1/>))

seg-ee0281a1f401 = Spørgsmålet, som dette besvarer: når et GNSS-studie (eller et studie med aperturdutycyklus) siger "antag en dødregningsdrift på { "0.001" }–{ "0.050" } m/s", hvor kommer det tal så fra? Det kommer fra IMU'en, og dette scenarie beregner det i stedet for at sweepe det. Fem vækstled: accelerometer-bias (t^{ "2" }), gyro-bias-hældning via tyngdekraften (t^{ "3" }), velocity random walk (t^{ "1.5" }), angle random walk (t^{ "2.5" }) og skalafaktor gange den tilbagelagte dist (kommentar i scenariefilen, linje { "4" } til { "11" })

seg-32d4adcfe249 = <s1>Forrige</s1>inertial

seg-47366ab55be3 = <s1>Næste</s1>integrity
