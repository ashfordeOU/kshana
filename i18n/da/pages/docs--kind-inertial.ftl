# docs--kind-inertial: translations (da)

seg-51362910dcb7 = { "2" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-b054c73f22e5 = ingen værdi

seg-98151954f217 = false

seg-be831b52a339 = og { "4" } flere i matrixen.

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN). Uafhængig reference (ExternalDataset): Offentliggjorte numeriske vektorer fra CAI-primærartikler (Cheinet { "2008" }, overføringsfunktion; Peters/Freier, følsomhed): k_eff·T² stemte præcist, skudstøjens ASD et ensidet gulv inden for ca. { "2" }× af hvert offentliggjort instrument (rigtige enheder har teknisk støj over kvantegulvet). Et interval, ikke paritet. { "0.30" } runde { "2" } (præregistreret fcb9ac64), et fund (forbliver MODELLED): rotationsstøjen med kun QPN mod den målte Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Sammensat positionsbudget af bias + skalafaktor + VRW + stabilitetsforfald over holdover. Uafhængig reference (ReferenceImpl): Uafhængig numpy Monte Carlo-SDE-integration af dobbeltintegreret hvid accelerationsstøj (validerer den analytiske VRW-varians med en reelt uafhængig algoritme) + et offentliggjort værdianker fra Groves { "2013" } for bias- og skalafaktorleddene; CAI-enhedstallene kvantificerer partnerens hardware og forbliver MODELLED

seg-9955b1b1c018 = Kvanteinertial sensorydelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Robusthed for kvanteinertial dødregning er MODELLED, ikke valideret: kontrolleret mod en separat implementering i samme kodebase, uafhængig af den enhed, der testes, men ikke eksternt autoritativ. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Emneside: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Emneside: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Kvartsaccelerometer i navigationsklasse (Honeywell QA-2000 / G

seg-cead54058894 = Kilde: <c1/>

seg-783be547f01e = <c1/> (scenarietype)

seg-bdedf28adc48 = Inertial dødregning med 1 DOF under et GNSS-udfald.

seg-55b5599ef867 = Én kørsel af <c1/> opsummeres sådan: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Valgfrie felter: <c1/>

seg-bd021b5dff80 = Eksemplet <c1/> angiver blandt andet:

seg-8a9e52e38b05 = Exail hybrid kvanteaccelerometer-triade: biasstabilitet 6e-

seg-873c402bb724 = Diagrammet, som motoren skriver for scenarios/imu-deadreckoning.toml, scenarietype inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, der nævner denne type.

seg-41f3a20fadfb = <b>VALIDATED</b> Kvaternion-attitude, WGS-84 NED strapdown-inertimekanisering (coning/sculling-kompenseret), der propagerer en navigationstilstand ud fra (Δθ, Δv)-inkrementer Tests: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN) Tests: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Dynamisk rækkevidde for Mach–Zehnder-fringe-multiplicitet: den 2π-periodiske fringe-udlæsning fastsætter en maksimal entydig specifik kraft a_max=π/(k_eff·T²), og den entydige rækkevidde i opløsningsceller a_max/σ_a=π/σ_Φ er uafhængig af den optiske skalafakt

seg-89ec2e65cf4f = <b>MODELLED</b> Sammensat positionsbudget af bias + skalafaktor + VRW + stabilitetsforfald over holdover Tests: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Ikke leveret: kun ydelsesmodeller; koldatom-/urhardware er en partners. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test i designet

seg-fab4c926e628 = <s1>Forrige</s1>impairment-eval

seg-aa783749183d = <s1>Næste</s1>ins-trn-coast
