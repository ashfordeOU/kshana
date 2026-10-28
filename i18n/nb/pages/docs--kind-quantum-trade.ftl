# docs--kind-quantum-trade: translations (nb)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-496b17a8d3b9 = Temaside: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ikke levert: kun ytelsesmodeller; kaldatom-/klokkemaskinvare er en partners. Uavhengig referanse (NoneKind): ingen: en disiplin eid av en partner, uten modul og uten test etter utforming

seg-51cac2f918e0 = Temaside: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Kilde: <c1/>

seg-f9af2813532e = <c1/> (scenariotype)

seg-eb55d253dd11 = Avveining mellom kvante og klassisk PNT ({ "13503" }): fordelen for holdover i tid og holdover i inertial av en kandidatklokke (en målt ADEV-kurve, som er det avgjørende punktet for forsvarbarhet, eller en kvanteklokkeklasse) mot en klassisk grunnlinjeklasse, med forbeholdet om antakelsen for langtidsgulvet (long-tau) ført på artefakten, pluss en omhylling av robusthet mot tid uten GNSS. MODELLED; kvantifiserer (validerer aldri) en partnerenhet. Kandidatklokken er en målt kurve (<c1/> + <c2/>, lik lengde, minst { "2" } punkter; den vinner når begge formene er oppgitt) eller en <c3/>.

seg-4f470bc1d82c = En kjøring av <c1/> oppsummeres slik: quantum-trade | candidate measured-ADEV | timing holdover 2621947s vs 203s (12943.62x) | inertial 14108s vs 378s (37.34x) | resilience coast 14108s | MODELLED [floor-assumed caveat]

seg-2639560aeff2 = Obligatoriske felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Eksempelet <c1/> angir blant annet:

seg-ee5bcbbe0167 = csac

seg-f5fa445702c6 = Resultatetikett (motorens): MODELLED — kvantifiserer (validerer aldri) en partnerklokke eller -sensor; ikke demonstrert i flyging

seg-c74c63ffd859 = Diagrammet motoren skriver for scenarios/quantum-trade.toml, type quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> NNLS-gjenvinning av potenslov (hvit FM + rødstøygulv) fra et publisert målt Allan-avvik for ⁸⁸Sr optisk klokkeovergang, som gjengir σ_y(τ) og den fremtredende skaleringen 4.7e-16/√τ for kort τ med et ekte målt langtidsgulv (long-tau), framfor Tester: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> NNLS-tilpasning av målt ADEV, χ²-konsistensbånd for NEES/NIS og klokkens van-Loan-kovarians for diskret prosessstøy (holdover-utløp), som er den beregningsmessige ryggraden i avveiningsmotoren Tester: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Innlesing av målt ADEV (NNLS), avveiningstabell (holdover i tid og i inertial + fordel), omhylling av robusthet mot tid; forbeholdet om gulvet føres på artefakten.

seg-b577b8464cf7 = <b>VALIDATED</b> NNLS-tilpasning av målt ADEV, χ²-konsistensbånd for NEES/NIS og klokkens van-Loan-kovarians for diskret prosessstøy (holdover-utløp), som er den beregningsmessige ryggraden i avveiningsmotor. Uavhengig referanse (ExternalDataset): scipy { "1.17.1" }, optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q nøyaktig, χ² <{ "5e-4" } ved driftsfrihetsgrader. Kun kjerner: tall for enhetsytelse forblir modellerte (neste rad)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Innlesing av målt ADEV (NNLS), avveiningstabell (holdover i tid og i inertial + fordel), omhylling av robusthet mot tid; forbeholdet om gulvet føres på artefakten. Kjørbar fr. Uavhengig referanse (ExternalDataset): kjernen for tilpasning av målt ADEV→PSD (NNLS) stemmer med scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs), en uavhengig ekstern kjerne; men TALLENE i avveiningen kvantifiserer (validerer aldri) en partnerklokke eller CAI, så selve avveiningen forblir MODELLED, ingen validerings-glorie

seg-3d678f64e41c = MODELLED — kvantifiserer (validerer aldri) en partnerklokke eller -sensor; ikke demonstrert i flyging (resultat <c1/>)

seg-20ba66ae9518 = Avveining mellom kvante og klassisk PNT ({ "13503" }): fordelen for holdover i tid og holdover i inertial av en kandidatklokke (en målt ADEV-kurve, som er det avgjørende punktet for forsvarbarhet, eller en kvanteklokkeklasse) mot en klassisk grunnlinjeklasse, med forbeholdet om antakelsen for langtidsgulvet (long-tau) ført på artefakten, pluss en omhylling av robusthet mot tid uten GNSS. (typekatalog (<c1/>))

seg-45a1d84eef18 = MODELLED; kvantifiserer (validerer aldri) en partnerenhet. (typekatalog (<c1/>))

seg-15275d27252a = Beregner fordelen for holdover i tid og holdover i inertial av en KANDIDATklokke over en KLASSISK grunnlinje, pluss en omhylling av robusthet mot tid uten GNSS. Kandidatens gulv styres av en partnerklokkes MEASURED overlappende ADEV-kurve (det avgjørende punktet for forsvarbarhet) tilpasset med ikke-negative minste kvadrater, så holdover-budsjettet hviler på virkelige data, ikke på et antatt langtidsgulv (long-tau). (kommentar i scenariofilen, linje { "3" } til { "7" })

seg-ecbdbc9b163e = ÆRLIG AVGRENSNING: MODELLED — den KVANTIFISERER fordelen av en partners kvanteklokke; den validerer IKKE enheten, og låner aldri valideringsøyene for SGP4/Allan/IGS. Når gulvet i en rad er en antatt klassestandard, vises et forbehold om gulvet på artefakten. Kjør: kshana scenarios/quantum-trade.toml (kommentar i scenariofilen, linje { "9" } til { "12" })

seg-4b59ac409819 = Avveining mellom kvante og klassisk PNT og robusthet uten GNSS ({ "13503" }) er MODELLED, ikke validert: en delpåstand er kontrollert eksternt, men hele funksjonen setter sammen modellerte deler, så funksjonen forblir modellert. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Forrige</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Neste</s1>realtime-frame-eop
