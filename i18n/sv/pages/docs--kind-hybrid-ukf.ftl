# docs--kind-hybrid-ukf: translations (sv)

seg-debc2f07db78 = true

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-451a304052c4 = <b>MODELLED</b> Accelerometer med kallatomsinterferometer från grundprinciper (k_eff·T², QPN). Oracle (ExternalDataset): Publicerade numeriska vektorer från primärartiklar om CAI (Cheinet { "2008" } överföringsfunktion; Peters/Freier känslighet): k_eff·T² stämde exakt, skottbrus-ASD ett ensidigt golv inom ~{ "2" }× av varje publicerat instrument (verkliga enheter har tekniskt brus över kvantgolvet). Ett intervall, inte paritet. { "0.30" } round { "2" } (pre-registered fcb9ac64), ett fynd (förblir MODELLED): det rena QPN-rotationsbruset mot det uppmätta Gauguet et al.

seg-9955b1b1c018 = Prestanda hos kvantinertialsensorer är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> Feltillstånds-EKF med 15 tillstånd, löst kopplat (validerat på en verklig IMU/GNSS-färd mot NaveGo); ett tätt kopplat pseudoavstånds-/Doppler-UKF och ett kopplat klock+pos. Oracle (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, körd som verktyg under GNU Octave, aldrig länkad): dess löst kopplade ins_gnss på dess egen verkliga Ekinox IMU/GNSS-färd med landfordon, båda lösningarna poängsatta mot Ekinox referensbana. Båda filtren läser samma { "20" } Hz float32-indata, och Kshanas konfiguration är mekaniskt avbildad från datamängdens publicerade parametrar. Kshanas horisontella och vertikala positions-RMS och dess

seg-4b84d9846715 = Källa: <c1/>

seg-d8da1a3f1798 = <c1/> (scenario kind)

seg-c6edf89eb8d4 = Hybrid kvant+klassiskt tätt kopplat GNSS/INS-UKF med 17 tillstånd (MODELLED): { "15" } INS-feltillstånd + CAI-härledd korrigering av accelerometerbias + en klocka med 2 tillstånd (fas+frekvens) från q-parameterns klockmotor, driven av den intervallbegränsade CAI-felmodellen. Kvalitetsmåttet är filtrets självkonsistens (NEES + innovationsvithet mot χ²-gränser) — ett självkonsistenspåstående, INTE en garanti för noggrannhet i verkligheten. Endast simulering; ingen TRL>{ "3" }, ingen flygerfarenhet, ingen extern validering.

seg-d43a562eb9c2 = En körning av <c1/> sammanfattas som: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Exemplet <c1/> anger bland annat:

seg-5e9c8b22ed24 = Cold-atom (Rb-87 D2) interferometric accelerometer; brackete

seg-4c8e2caeba5b = Ultra-stable/optical onboard oscillator class, white-FM sigm

seg-2968660fa880 = Diagrammet som motorn skriver för scenarios/hybrid-ukf.toml, kind hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Intervallbegränsad (bäst/nominell/konservativ) prestanda för kallatomsinterferometer — biasinstabilitet, hastighets-/vinkelslumpvandring, skalfaktorstabilitet, avfrågning. Oracle (InternalConsistency): Intern konsistens: det anförda VRW-intervallet korskontrollerat mot fysiken i CaiAccelerometer::accel_asd + rått dynamiskt omfång beräknat från gränsen för fringe-osäkerhet; talen är MODELLED litteraturöversiktsintervall (needs_source_confirmation), ingen enhet validerad, ingen validation halo

seg-8632967dc5f8 = MODELLED SIMULATION. Filtrets självkonsistens (NEES + innovationsvithet) under intervallbegränsade CAI- och klockbrusindata — ett självkonsistenspåstående, INTE en garanti för noggrannhet i verkligheten. Inte fält-/flygresultat; ingen TRL>{ "3" }, ingen flygerfarenhet, ingen extern validering. CAI-hårdvaran ägs av partner. (result <c1/>)

seg-e55c8e2bc619 = Hybrid kvant+klassiskt tätt kopplat GNSS/INS-UKF med 17 tillstånd (MODELLED): { "15" } INS-feltillstånd + CAI-härledd korrigering av accelerometerbias + en klocka med 2 tillstånd (fas+frekvens) från q-parameterns klockmotor, driven av den intervallbegränsade CAI-felmodellen. (kind catalogue (<c1/>))

seg-b06538ca3a8c = Hybrid kvant + klassiskt tätt kopplat GNSS/INS-UKF med 17 tillstånd (MODELLED). (scenario file comment, line { "1" })

seg-b5fc96916b4e = KVALITETSMÅTT — filtrets självkonsistens (NEES + innovationsvithet), det enda som en simulering ärligt kan hävda om en estimator. Över en Monte Carlo-ensemble vars referens genereras av exakt det brus som filtret antar måste de poolade medelvärdena för NIS (vithet) och NEES hamna inom sina kikvadratband på { "95" }%. Detta är ett SJÄLVKONSISTENSPÅSTÅENDE, INTE en garanti för noggrannhet i verkligheten. (scenario file comment, lines { "21" } to { "25" })

seg-91afdc2d3ee2 = ÄRLIGHET: allt här är MODELLED / SIMULATION. CAI- och klockindata är intervallbegränsade, litteraturrepresentativa värden, inte uppmätt hårdvara; CAI-hårdvaran och dess Key-Person förblir ägda av partner. Ingen TRL>{ "3" }, ingen flygerfarenhet, ingen extern validering. (scenario file comment, lines { "27" } to { "29" })

seg-9b94bd3ce7df = Monte Carlo-frön som konsistensreferensen poolar över, och filtrets feljusteringsmultiplikatorer. { "24" } frön ger körningsbaserade kikvadrat-NEES-band ({ "8" }*{ "24" } DOF) som är tillräckligt snäva för att skilja ett matchat från ett feljusterat filter och samtidigt hålla körningen billig. Sätt q_factor / r_factor bort från { "1.0" } för att feljustera filtret och se konsistensspärren förkasta det (q_factor skalar det antagna processbruset, r_factor det antagna mätbrus (scenario file comment, lines { "44" } to { "48" })

seg-496b17a8d3b9 = Ämnessida: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Ämnessida: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Föregående</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Nästa</s1>hybrid
