# docs--kind-inertial: translations (sv)

seg-51362910dcb7 = { "2" } medföljande scenarier använder den här typen; de övriga finns i <a1><c1/></a1>.

seg-b054c73f22e5 = inget värde

seg-98151954f217 = false

seg-be831b52a339 = och { "4" } till i matrisen.

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Accelerometer med kallatomsinterferometer från grundprinciper (k_eff·T², QPN). Oracle (ExternalDataset): Publicerade numeriska vektorer från primärartiklar om CAI (Cheinet { "2008" } överföringsfunktion; Peters/Freier känslighet): k_eff·T² stämde exakt, skottbrus-ASD ett ensidigt golv inom ~{ "2" }× av varje publicerat instrument (verkliga enheter har tekniskt brus över kvantgolvet). Ett intervall, inte paritet. { "0.30" } round { "2" } (pre-registered fcb9ac64), ett fynd (förblir MODELLED): det rena QPN-rotationsbruset mot det uppmätta Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Sammansatt positionsbudget för bias + skalfaktor + VRW + stabilitetsavklingning över holdover. Oracle (ReferenceImpl): Oberoende numpy Monte Carlo-SDE-integrering av dubbelintegrerat vitt accelerationsbrus (validerar den analytiska VRW-variansen med en genuint oberoende algoritm) + ett publicerat värdeankare från Groves { "2013" } för bias-/skalfaktortermerna; CAI-enhetens siffror kvantifierar partnerhårdvara och förblir MODELLED

seg-9955b1b1c018 = Prestanda hos kvantinertialsensorer är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Motståndskraft hos kvantinertial dödräkning är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Ämnessida: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Ämnessida: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Navigation-grade quartz accelerometer (Honeywell QA-2000 / G

seg-cead54058894 = Källa: <c1/>

seg-783be547f01e = <c1/> (scenario kind)

seg-bdedf28adc48 = Tröghetsbaserad 1-DOF-dödräkning under ett GNSS-bortfall.

seg-55b5599ef867 = En körning av <c1/> sammanfattas som: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Valfria fält: <c1/>

seg-bd021b5dff80 = Exemplet <c1/> anger bland annat:

seg-8a9e52e38b05 = Exail hybrid quantum accelerometer triad: bias stability 6e-

seg-873c402bb724 = Diagrammet som motorn skriver för scenarios/imu-deadreckoning.toml, kind inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner denna kind.

seg-41f3a20fadfb = <b>VALIDATED</b> Strapdown-tröghetsmekanisering i WGS-84 NED med kvaternionsattityd (coning-/sculling-kompenserad) som propagerar ett navigationstillstånd från (Δθ, Δv)-inkrement Tests: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Accelerometer med kallatomsinterferometer från grundprinciper (k_eff·T², QPN) Tests: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Dynamiskt omfång för Mach–Zehnder-fringe-osäkerhet: den 2π-periodiska fringe-avläsningen sätter en maximal entydig specifik kraft a_max=π/(k_eff·T²), och det entydiga omfånget i upplösningsceller a_max/σ_a=π/σ_Φ är oberoende av den optiska skalfakt

seg-89ec2e65cf4f = <b>MODELLED</b> Sammansatt positionsbudget för bias + skalfaktor + VRW + stabilitetsavklingning över holdover Tests: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Tillhandahålls inte — endast prestandamodeller; kallatoms-/klockhårdvaran är en partners. Oracle (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-fab4c926e628 = <s1>Föregående</s1>impairment-eval

seg-aa783749183d = <s1>Nästa</s1>ins-trn-coast
