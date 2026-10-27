# docs--kind-aocs: translations (da)

seg-99ef7c1d552c = Scenarietype i motoren v{ $version }, familien <a1>Missionsanalyse, forbindelser og rumoperationer</a1>. Vejledende: analyseoutput fra et forsknings- og udviklingsværktøj, ikke typegodkendt navigationsudstyr og ikke en tjeneste til beskyttelse af menneskeliv. Hver etiket her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en etiket optjenes: afsnittet Evidence i README'en).

seg-8f1e7d3f5a07 = Familieside: <a1>Missionsanalyse, links og rumoperationer</a1>

seg-5cd8b3d8c098 = Kilde: <c1/>

seg-7f2ade997df5 = <c1/> (scenarietype)

seg-7eff466eb018 = Rumfartøjets attitudestyring: en slew-manøvre med inertial pegning af en stiv krop med tre eller flere afbalancerede reaktionshjul under MRP-tilbagekobling (L = -K sigma - P omega), minimumsnorm-hjulmomenter begrænset til hver motors grænse, RK4 med zero-order hold; eventuelt lukket på et multiplikativt EKF ud fra en simuleret gyro (vinkel- og rate-random-walk) og en stjernesensor. Rapporterer indsvingningstid, endelig og maksimal pegefejl, maksimal hjulhastighed og maksimalt hjulmoment, den mættede andel, drift i impulsmoment og, med estimatoren, dens attitudefejl og NEES. Sløjfen for den sande tilstand er VALIDATED mod Basilisk { "2.9.1" }; estimatoren er MODELLED.

seg-a499721d08b1 = Én kørsel af <c1/> opsummeres som: aocs: { "4" } hjul, { "600" } s slew fra { "82.06" } deg -> indsvinger under { "0.1" } deg ved { "481.0" } s | endelig { "2.37e-2" } deg | maksimalt hjul { "1797" } rpm | sløjfe for den sande tilstand

seg-2ad4d3f07a6a = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Eksemplet <c1/> angiver blandt andet:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-b054c73f22e5 = ingen værdi

seg-6e22c97374b0 = Resultatmærkat (motorens egen): VALIDATED styringslov og hjuldynamik (mod Basilisk { "2.9.1" } på sløjfen for den sande tilstand); denne kørsels input er scenariets egne — reaktionshjulsbaseret attitudestyring under MRP-tilbagekobling, inertial pegning, ingen sensorstøj, ingen friktion

seg-08c624d5324d = Diagrammet, som motoren skriver for scenarios/aocs-slew.toml, type aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-d69a588facf1 = <b>VALIDATED</b> Attitudestyring med inertial pegning af en stiv krop med tre eller flere afbalancerede reaktionshjul: MRP-tilbagekoblingsloven L_r = -K sigma_BR - P omega_BR (Schaub og Junkins), minimumsnorm-hjulmotormomenter G_s u = -L_r begrænset til hvert hjuls l Tests: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> Det multiplikative EKF af Lefferts-Markley-Shuster: attitudefejl i kropskoordinater og gyrobias som tilstande, propagering med gyrorate minus biasestimatet og Farrenkopfs diskrete processtøj (vinkel- og rate-random-walk), stjernesensoropdatering

seg-7e3e0dcc936f = <b>VALIDATED</b> Attitudestyring med inertial pegning af en stiv krop med tre eller flere afbalancerede reaktionshjul: MRP-tilbagekoblingsloven L_r = -K sigma_BR - P omega_BR (Schaub og J. Uafhængig reference (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; bsk-hjulkørslen som et separat værktøj, aldrig linket eller medleveret): rumfartøjskrop, reactionWheelStateEffector (BalancedWheels, momentgrænse slået til), simpleNav, inertial3D, attTrackingError, mrpFeedback (uden integralled) og rwMotorTorque ved dt = { "0.1" } s med dens RK4, mod Kshanas egen implementering på tre tilfælde (tre ortogonale hjul; en firehjuls pyramide; et mættende firehjulstilfælde),

seg-d7889856073b = <b>MODELLED</b> Det multiplikative EKF af Lefferts-Markley-Shuster: attitudefejl i kropskoordinater og gyrobias som tilstande, propagering med gyrorate minus biasestimatet og Farre. Uafhængig reference (InternalConsistency): Intern konsistens: filterets normaliserede kvadrerede estimeringsfejl mod en sandhed simuleret ud fra de samme sensormodeller over Monte Carlo-seeds samt konvergens af attitude- og biasestimaterne. HVAD DER IKKE ER: ingen ekstern estimator eller flyvedata er sammenlignet (Basilisk { "2.9.1" } har intet MEKF-modul); sensormodellerne er lærebogsmodellerne, uden fejljustering, skalafaktor eller effekter af stjernesensorens synsfelt.

seg-3b71575e0c23 = Sløjfen for den sande tilstand er VALIDATED mod Basilisk { "2.9.1" }; estimatoren er MODELLED. (typekatalog (<c1/>))

seg-c7ff0ddbd040 = Multiplikativ EKF-attitudeestimering ud fra en gyro og en stjernesensor er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-cc4e7274d409 = Emneside: <a1>AOCS.md</a1>

seg-b022bad77259 = <s1>Forrige</s1>acm-link

seg-1fb6e680fd4a = <s1>Næste</s1>aperture-duty-cycle
