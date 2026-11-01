# docs--kind-inertial: translations (nb)

seg-51362910dcb7 = { "2" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-b054c73f22e5 = ingen verdi

seg-98151954f217 = false

seg-be831b52a339 = og { "4" } til i matrisen.

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Kaldatom-interferometer-akselerometer fra grunnprinsipper (k_eff·T², QPN). Uavhengig referanse (ExternalDataset): Publiserte numeriske vektorer fra primærartikler om CAI (Cheinet { "2008" } overføringsfunksjon; Peters/Freier-følsomhet): k_eff·T² stemte nøyaktig, skuddstøy-ASD et ensidig gulv innenfor ~{ "2" }× av hvert publiserte instrument (virkelige enheter har teknisk støy over kvantegulvet). Et intervall, ikke likhet. { "0.30" } runde { "2" } (forhåndsregistrert fcb9ac64), et funn (forblir MODELLED): rotasjonsstøyen kun fra QPN mot den målte Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Sammensatt posisjonsbudsjett over holdover fra bias + skalafaktor + VRW + stabilitetsforfall. Uavhengig referanse (ReferenceImpl): Uavhengig numpy Monte Carlo-SDE-integrasjon av dobbeltintegrert hvit akselerasjonsstøy (validerer den analytiske VRW-variansen med en genuint uavhengig algoritme) + et publisert Groves { "2013" }-verdianker for bias-/skalafaktorleddene; CAI-enhetenes tall kvantifiserer partnerens maskinvare og forblir MODELLED

seg-9955b1b1c018 = Ytelsen til kvanteinertisensorer er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Robustheten til kvanteinertisk dødregning er MODELLED, ikke validert: kontrollert mot en separat implementasjon i den samme kodebasen, uavhengig av enheten som testes, men ikke eksternt autoritativ. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Temaside: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Temaside: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Kvartsakselerometer i navigasjonsklassen (Honeywell QA-2000 / G

seg-cead54058894 = Kilde: <c1/>

seg-783be547f01e = <c1/> (scenariotype)

seg-bdedf28adc48 = Treghetsbasert dødregning med 1 frihetsgrad under et GNSS-avbrudd.

seg-55b5599ef867 = Én kjøring av <c1/> oppsummeres slik: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Valgfrie felt: <c1/>

seg-bd021b5dff80 = Eksemplet <c1/> setter blant annet:

seg-8a9e52e38b05 = Exail hybrid kvanteakselerometer-triade: biasstabilitet 6e-

seg-873c402bb724 = Diagrammet motoren skriver for scenarios/imu-deadreckoning.toml, typen inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-41f3a20fadfb = <b>VALIDATED</b> Kvaternion-holdning, WGS-84 NED strapdown treghetsmekanisering (coning/sculling-kompensert) som propagerer en navigasjonstilstand fra (Δθ, Δv)-inkrementer. Tester: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Kaldatom-interferometer-akselerometer fra grunnprinsipper (k_eff·T², QPN). Tester: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Dynamisk område for fringe-flertydighet i Mach–Zehnder: den 2π-periodiske fringe-avlesningen setter en maksimal entydig spesifikk kraft a_max=π/(k_eff·T²), og det entydige området i oppløsningsceller a_max/σ_a=π/σ_Φ er uavhengig av den optiske skalafaktoren

seg-89ec2e65cf4f = <b>MODELLED</b> Sammensatt posisjonsbudsjett over holdover fra bias + skalafaktor + VRW + stabilitetsforfall. Tester: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Ikke levert: kun ytelsesmodeller; kaldatom-/klokkemaskinvare er en partners. Uavhengig referanse (NoneKind): ingen: en disiplin eid av en partner, uten modul og uten test etter utforming

seg-fab4c926e628 = <s1>Forrige</s1>impairment-eval

seg-aa783749183d = <s1>Neste</s1>ins-trn-coast
