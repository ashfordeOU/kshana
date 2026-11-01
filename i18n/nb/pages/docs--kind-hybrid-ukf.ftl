# docs--kind-hybrid-ukf: translations (nb)

seg-debc2f07db78 = true

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-451a304052c4 = <b>MODELLED</b> Kaldatom-interferometer-akselerometer fra grunnprinsipper (k_eff·T², QPN). Uavhengig referanse (ExternalDataset): Publiserte numeriske vektorer fra primærartikler om CAI (Cheinet { "2008" } overføringsfunksjon; Peters/Freier-følsomhet): k_eff·T² stemte nøyaktig, skuddstøy-ASD et ensidig gulv innenfor ~{ "2" }× av hvert publiserte instrument (virkelige enheter har teknisk støy over kvantegulvet). Et intervall, ikke likhet. { "0.30" } runde { "2" } (forhåndsregistrert fcb9ac64), et funn (forblir MODELLED): rotasjonsstøyen kun fra QPN mot den målte Gauguet et al.

seg-9955b1b1c018 = Ytelsen til kvanteinertisensorer er MODELLED, ikke validert: et delkrav er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15-tilstands feiltilstands-EKF, løst koblet (validert på en reell IMU/GNSS-kjøring mot NaveGo); en tett koblet pseudoavstand/Doppler-UKF og en koblet klokke+pos. Uavhengig referanse (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, kjørt som et verktøy under GNU Octave, aldri lenket inn): dens løst koblede ins_gnss på dens egen virkelige Ekinox IMU/GNSS-kjøring med landkjøretøy, begge løsningene vurdert mot Ekinox-referansebanen. Begge filtrene leser de samme { "20" } Hz float32-inndataene, og Kshanas konfigurasjon er overført mekanisk fra datasettets publiserte parametere. Kshanas horisontale og vertikale posisjons-RMS og dens

seg-4b84d9846715 = Kilde: <c1/>

seg-d8da1a3f1798 = <c1/> (scenariotype)

seg-c6edf89eb8d4 = 17-tilstands hybrid kvante+klassisk tett koblet GNSS/INS-UKF (MODELLED): { "15" } INS-feiltilstander + CAI-avledet korreksjon av akselerometerbias + en klokke med 2 tilstander (fase+frekvens) fra q-parameter-klokkemotoren, drevet av den avgrensede CAI-feilmodellen. Kvalitetsmålet er filterets selvkonsistens (NEES + innovasjonshvithet mot χ²-grenser), en selvkonsistensuttalelse, IKKE en garanti for nøyaktighet i den virkelige verden. Kun simulering; ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering.

seg-d43a562eb9c2 = Én kjøring av <c1/> oppsummeres slik: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Eksemplet <c1/> setter blant annet:

seg-5e9c8b22ed24 = Kaldatom-akselerometer (Rb-87 D2) med interferometri; avgrenset

seg-4c8e2caeba5b = Ultrastabil/optisk oscillatorklasse om bord, white-FM sigm

seg-2968660fa880 = Diagrammet motoren skriver for scenarios/hybrid-ukf.toml, typen hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Avgrenset (beste/nominell/konservativ) ytelse for kaldatom-interferometer: biasustabilitet, hastighets-/vinkel-random-walk, skalafaktorstabilitet, avspørring. Uavhengig referanse (InternalConsistency): Intern konsistens: den siterte VRW-avgrensningen krysskontrollert mot CaiAccelerometer::accel_asd-fysikk + rått dynamisk område beregnet fra grensen for fringe-flertydighet; tallene er MODELLED litteraturbaserte avgrensninger (needs_source_confirmation), ingen enhet er validert, ingen validerings-halo

seg-8632967dc5f8 = MODELLED SIMULERING. Filterets selvkonsistens (NEES + innovasjonshvithet) under avgrensede CAI- og klokkestøyinndata, en selvkonsistensuttalelse, IKKE en garanti for nøyaktighet i den virkelige verden. Ikke felt- eller flyresultater; ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering. CAI-maskinvaren er eid av partneren. (resultat <c1/>)

seg-e55c8e2bc619 = 17-tilstands hybrid kvante+klassisk tett koblet GNSS/INS-UKF (MODELLED): { "15" } INS-feiltilstander + CAI-avledet korreksjon av akselerometerbias + en klokke med 2 tilstander (fase+frekvens) fra q-parameter-klokkemotoren, drevet av den avgrensede CAI-feilmodellen. (typekatalog (<c1/>))

seg-b06538ca3a8c = 17-tilstands hybrid kvante + klassisk tett koblet GNSS/INS-UKF (MODELLED). (kommentar i scenariofilen, linje { "1" })

seg-b5fc96916b4e = KVALITETSMÅL — filterets selvkonsistens (NEES + innovasjonshvithet), det eneste en simulering ærlig kan hevde om en estimator. Over et Monte Carlo-ensemble der sannheten genereres fra nøyaktig den støyen filteret antar, må de samlede NIS-middelverdiene (hvithet) og NEES-middelverdiene havne innenfor sine kjikvadratbånd på { "95" }%. Dette er en SELVKONSISTENS-uttalelse, IKKE en garanti for nøyaktighet i den virkelige verden. (kommentar i scenariofilen, linjene { "21" } til { "25" })

seg-91afdc2d3ee2 = ÆRLIGHET: alt her er MODELLED / SIMULERING. CAI- og klokkeinndataene er avgrensede, litteraturrepresentative verdier, ikke målt maskinvare; CAI-maskinvaren og dens Key-Person forblir eid av partneren. Ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering. (kommentar i scenariofilen, linjene { "27" } til { "29" })

seg-9b94bd3ce7df = Monte Carlo-seed som konsistenskontrollen poolér over, og multiplikatorene for feiljustering av filteret. { "24" } seed gir løpsbaserte kjikvadrat-NEES-bånd ({ "8" }*{ "24" } DOF) som er trange nok til å skille et tilpasset filter fra et feiljustert, mens kjøringen holdes billig. Sett q_factor / r_factor bort fra { "1.0" } for å feiljustere filteret og se konsistensgrinden avvise det (q_factor skalerer den antatte prosessstøyen, r_factor den antatte målestøyen (kommentar i scenariofilen, linjene { "44" } til { "48" })

seg-496b17a8d3b9 = Temaside: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Temaside: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Forrige</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Neste</s1>hybrid
