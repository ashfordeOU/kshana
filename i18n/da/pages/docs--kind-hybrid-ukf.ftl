# docs--kind-hybrid-ukf: translations (da)

seg-debc2f07db78 = true

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-451a304052c4 = <b>MODELLED</b> Koldatom-interferometer-accelerometer ud fra grundprincipper (k_eff·T², QPN). Uafhængig reference (ExternalDataset): Offentliggjorte numeriske vektorer fra CAI-primærartikler (Cheinet { "2008" }, overføringsfunktion; Peters/Freier, følsomhed): k_eff·T² stemte præcist, skudstøjens ASD et ensidet gulv inden for ca. { "2" }× af hvert offentliggjort instrument (rigtige enheder har teknisk støj over kvantegulvet). Et interval, ikke paritet. { "0.30" } runde { "2" } (præregistreret fcb9ac64), et fund (forbliver MODELLED): rotationsstøjen med kun QPN mod den målte Gauguet et al.

seg-9955b1b1c018 = Kvanteinertial sensorydelse er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15-tilstands fejltilstands-EKF, løst koblet (valideret på en rigtig IMU/GNSS-kørsel mod NaveGo); et tæt koblet pseudoafstands-/Doppler-UKF og et koblet ur+pos. Uafhængig reference (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, kørt som værktøj under GNU Octave, aldrig linket): dens løst koblede ins_gnss på dens egen rigtige Ekinox IMU/GNSS-kørsel med landkøretøj, begge løsninger bedømt mod Ekinox-referencetrajektorien. Begge filtre læser det samme float32-input med { "20" } Hz, og Kshanas konfiguration er afbildet mekanisk fra datasættets offentliggjorte parametre. Kshanas horisontale og vertikale positions-RMS og dens

seg-4b84d9846715 = Kilde: <c1/>

seg-d8da1a3f1798 = <c1/> (scenarietype)

seg-c6edf89eb8d4 = Hybrid kvante+klassisk tæt koblet GNSS/INS-UKF med 17 tilstande (MODELLED): { "15" } INS-fejltilstande + CAI-afledet korrektion af accelerometer-bias + et ur med 2 tilstande (fase+frekvens) fra q-parameter-urmotoren, drevet af den afgrænsede CAI-fejlmodel. Kvalitetsmålet er filterets selvkonsistens (NEES + innovationshvidhed mod χ²-grænser), en udtalelse om selvkonsistens, IKKE en garanti for nøjagtighed i den virkelige verden. Kun simulering; ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering.

seg-d43a562eb9c2 = Én kørsel af <c1/> opsummeres sådan: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Obligatoriske felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Eksemplet <c1/> angiver blandt andet:

seg-5e9c8b22ed24 = Koldatom-accelerometer (Rb-87 D2) med interferometri; afgrænset

seg-4c8e2caeba5b = Oscillatorklasse, ultrastabil/optisk om bord, white-FM sigm

seg-2968660fa880 = Diagrammet, som motoren skriver for scenarios/hybrid-ukf.toml, scenarietype hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Afgrænset (bedste/nominelle/konservative) ydelse for koldatom-interferometer: biasustabilitet, hastigheds-/vinkel-random-walk, skalafaktorstabilitet, interrogation. Uafhængig reference (InternalConsistency): Intern konsistens: den citerede VRW-afgrænsning krydskontrolleret mod fysikken i CaiAccelerometer::accel_asd + rå dynamisk rækkevidde beregnet ud fra grænsen for fringe-multiplicitet; tallene er MODELLED litteraturbaserede afgrænsninger (needs_source_confirmation), ingen enhed er valideret, ingen valideringshalo

seg-8632967dc5f8 = MODELLED SIMULERING. Filterets selvkonsistens (NEES + innovationshvidhed) under afgrænsede CAI- og urstøjinput, en udtalelse om selvkonsistens, IKKE en garanti for nøjagtighed i den virkelige verden. Ikke resultater fra felt eller flyvning; ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering. CAI-hardwaren ejes af partneren. (resultat <c1/>)

seg-e55c8e2bc619 = Hybrid kvante+klassisk tæt koblet GNSS/INS-UKF med 17 tilstande (MODELLED): { "15" } INS-fejltilstande + CAI-afledet korrektion af accelerometer-bias + et ur med 2 tilstande (fase+frekvens) fra q-parameter-urmotoren, drevet af den afgrænsede CAI-fejlmodel. (typekatalog (<c1/>))

seg-b06538ca3a8c = Hybrid kvante + klassisk tæt koblet GNSS/INS-UKF med 17 tilstande (MODELLED). (kommentar i scenariefilen, linje { "1" })

seg-b5fc96916b4e = KVALITETSMÅL: filterets selvkonsistens (NEES + innovationshvidhed), det eneste, en simulering ærligt kan hævde om en estimator. Over et Monte Carlo-ensemble, hvis sandhed er genereret ud fra præcis den støj, som filteret antager, skal de poolede NIS-middelværdier (hvidhed) og NEES-middelværdier ligge inden for deres { "95" }% chi-i-anden-bånd. Dette er en udtalelse om SELVKONSISTENS, IKKE en garanti for nøjagtighed i den virkelige verden. (kommentar i scenariefilen, linje { "21" } til { "25" })

seg-91afdc2d3ee2 = ÆRLIGHED: alt her er MODELLED / SIMULERING. CAI- og urinputtene er afgrænsede, litteraturrepræsentative værdier, ikke målt hardware; CAI-hardwaren og dens nøgleperson forbliver ejet af partneren. Ingen TRL>{ "3" }, ingen flyvearv, ingen ekstern validering. (kommentar i scenariefilen, linje { "27" } til { "29" })

seg-9b94bd3ce7df = Monte Carlo-seeds, som konsistensreferencen poolede over, og multiplikatorerne for filterets fejljustering. { "24" } seeds giver kørselsbaserede chi-i-anden-NEES-bånd ({ "8" }*{ "24" } DOF), der er stramme nok til at skelne et afstemt fra et fejljusteret filter, mens kørslen holdes billig. Sæt q_factor / r_factor væk fra { "1.0" } for at fejljustere filteret og se konsistensporten afvise det (q_factor skalerer den antagne processtøj, r_factor den antagne målestøj (kommentar i scenariefilen, linje { "44" } til { "48" })

seg-496b17a8d3b9 = Emneside: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Emneside: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Forrige</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Næste</s1>hybrid
