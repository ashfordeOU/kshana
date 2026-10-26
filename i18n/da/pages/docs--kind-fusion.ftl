# docs--kind-fusion: translations (da)

seg-03442e4be82d = Datablad for Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-f4cf8b629797 = Emneside: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = og { "4" } flere i matrixen.

seg-4de09fe367df = Kilde: <c1/>

seg-53e498cffeba = <c1/> (scenarietype)

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-ec26df467b88 = Fælles Kalman-sensorfusion til PNT over de samme hybride input.

seg-25708bf88728 = Én kørsel af <c1/> opsummeres sådan: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Valgfrie felter: <c1/>

seg-56bca36cabba = Eksemplet <c1/> angiver blandt andet:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Kvartsaccelerometer i navigationsklasse; illustrativ støj-dr

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Koldatom-accelerometer, lav velocity-random-walk ved lang tau;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Kvartsaccelerometer i navigationsklasse; i

seg-c8a1c797f4b1 = Diagrammet, som motoren skriver for scenarios/fusion-pnt.toml, scenarietype fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-46c0903ff7b5 = <b>VALIDATED</b> Gendan en epoketilstand [r,v] ud fra afstandsmålinger til jordstationer med en Gauss–Newton-batch-differentialkorrektor og et sekventielt filter over en kraftmodel med tolegemeproblem + J2. Tests: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> Fejltilstands-EKF over { "15" } INS-tilstande, et tilstands-ur i modtageren med to tilstande og én flydende bærebølge-multiplicitet pr. sporet satellit; pseudoafstand, bærebølgefase og valgfri afstandsrate fra en SGP4 Walker-konstellation (lysrejsetid og Sagnac), Klobuchar an Tests: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Tre gnss-ins-scenarier på trajektoriebiblioteket (et fartøj, der sno sig med { "8" } m/s med et udfald på fem minutter; et tog gennem en indskæring med to satellitter og en tunnel; et fly, hvis udfald dækker et 25 graders krængende sving) og pakkens valgfrie Tests: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Ét stablet Kalman-filter over position, hastighed, urfase og frekvens, fodret med pseudoafstande, der kobler position og ur (Joseph-form-opdateringer, der bærer krydskovariansen); en 1-DOF-variant udvidet med en konstant accelerometer-bias s Tests: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN). Uafhængig reference (ExternalDataset): Offentliggjorte numeriske vektorer fra CAI-primærartikler (Cheinet { "2008" }, overføringsfunktion; Peters/Freier, følsomhed): k_eff·T² stemte præcist, skudstøjens ASD et ensidet gulv inden for ca. { "2" }× af hvert offentliggjort instrument (rigtige enheder har teknisk støj over kvantegulvet). Et interval, ikke paritet. { "0.30" } runde { "2" } (præregistreret fcb9ac64), et fund (forbliver MODELLED): rotationsstøjen med kun QPN mod den målte Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Sammensat positionsbudget af bias + skalafaktor + VRW + stabilitetsforfald over holdover. Uafhængig reference (ReferenceImpl): Uafhængig numpy Monte Carlo-SDE-integration af dobbeltintegreret hvid accelerationsstøj (validerer den analytiske VRW-varians med en reelt uafhængig algoritme) + et offentliggjort værdianker fra Groves { "2013" } for bias- og skalafaktorleddene; CAI-enhedstallene kvantificerer partnerens hardware og forbliver MODELLED

seg-9955b1b1c018 = Kvanteinertial sensorydelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Robusthed for kvanteinertial dødregning er MODELLED, ikke valideret: kontrolleret mod en separat implementering i samme kodebase, uafhængig af den enhed, der testes, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-a849735fcc6e = Emneside: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Forrige</s1>ephemeris

seg-d14a7850df1c = <s1>Næste</s1>gnss-ins
