# docs--kind-quantum-trade: translations (sv)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-496b17a8d3b9 = Ämnessida: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Tillhandahålls inte — endast prestandamodeller; kallatoms-/klockhårdvaran är en partners. Oracle (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-51cac2f918e0 = Ämnessida: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Källa: <c1/>

seg-f9af2813532e = <c1/> (scenariotyp)

seg-eb55d253dd11 = Avvägning kvant mot klassisk för PNT ({ "13503" }): fördelen i holdover för tidssynkronisering + inertiell holdover hos en kandidatklocka (en uppmätt ADEV-kurva — den avgörande punkten för försvarbarhet — eller en kvantklockklass) mot en klassisk baslinjeklass, med förbehållet om antagande om golv för lång tau bärt på artefakten, plus ett envelopp för GNSS-nekad resiliens mot tid. MODELLED; kvantifierar (validerar aldrig) en partnerenhet. Kandidatklockan är en uppmätt kurva (<c1/> + <c2/>, lika lång, minst { "2" } punkter; den vinner när båda formerna anges) eller en <c3/>.

seg-4f470bc1d82c = En körning av <c1/> sammanfattas som: quantum-trade | candidate measured-ADEV | timing holdover 2621947s vs 203s (12943.62x) | inertial 14108s vs 378s (37.34x) | resilience coast 14108s | MODELLED [floor-assumed caveat]

seg-2639560aeff2 = Obligatoriska fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Exemplet <c1/> anger bland annat:

seg-ee5bcbbe0167 = csac

seg-f5fa445702c6 = Resultatetikett (motorns egen): MODELLED — kvantifierar (validerar aldrig) en partnerklocka/-sensor; inte demonstrerad i flygning

seg-c74c63ffd859 = Diagrammet som motorn skriver för scenarios/quantum-trade.toml, typ quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> NNLS-återskapande av potenslag (vitt FM + golv av rött brus) från en publicerad uppmätt Allan-avvikelse för en optisk klockövergång i ⁸⁸Sr — återger σ_y(τ) och den centrala skalningen 4.7e-16/√τ för kort τ med ett genuint uppmätt golv för lång τ, i stället för Tester: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> NNLS-anpassning av uppmätt ADEV, χ²-konsistensband för NEES/NIS och klockans van Loan-kovarians för diskret processbrus (holdover-glidflygning) — avvägningsmotorns beräkningsmässiga ryggrad Tester: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Inläsning av uppmätt ADEV (NNLS), avvägningstabell (holdover för tidssynkronisering/inertiell + fördel), envelopp för resiliens mot tid; förbehållet om golvet bärs på artefakten.

seg-b577b8464cf7 = <b>VALIDATED</b> NNLS-anpassning av uppmätt ADEV, χ²-konsistensband för NEES/NIS och klockans van Loan-kovarians för diskret processbrus (holdover-glidflygning) — avvägningsmotorns beräkningsmässiga. Oberoende referens (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exakta, χ² <{ "5e-4" } vid aktuella frihetsgrader. Endast kärnor — enhetsprestanda förblir Modelled (nästa rad)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Inläsning av uppmätt ADEV (NNLS), avvägningstabell (holdover för tidssynkronisering/inertiell + fördel), envelopp för resiliens mot tid; förbehållet om golvet bärs på artefakten. Kan köras fr. Oberoende referens (ExternalDataset): Kärnan för anpassning av uppmätt ADEV→PSD (NNLS) matchas mot scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — en oberoende extern kärna; men avvägningens TAL kvantifierar (validerar aldrig) en partnerklocka/CAI, så avvägningen i sig förblir MODELLED, ingen validerings-gloria

seg-3d678f64e41c = MODELLED — kvantifierar (validerar aldrig) en partnerklocka/-sensor; inte demonstrerad i flygning (resultat <c1/>)

seg-20ba66ae9518 = Avvägning kvant mot klassisk för PNT ({ "13503" }): fördelen i holdover för tidssynkronisering + inertiell holdover hos en kandidatklocka (en uppmätt ADEV-kurva — den avgörande punkten för försvarbarhet — eller en kvantklockklass) mot en klassisk baslinjeklass, med förbehållet om antagande om golv för lång tau bärt på artefakten, plus ett envelopp för GNSS-nekad resiliens mot tid. (typkatalog (<c1/>))

seg-45a1d84eef18 = MODELLED; kvantifierar (validerar aldrig) en partnerenhet. (typkatalog (<c1/>))

seg-15275d27252a = Beräknar fördelen i holdover för tidssynkronisering och inertiell holdover hos en KANDIDATklocka jämfört med en KLASSISK baslinje, plus ett envelopp för GNSS-nekad resiliens mot tid. Kandidatens golv drivs av en partnerklockas MEASURED överlappande ADEV-kurva (den avgörande punkten för försvarbarhet) anpassad med icke-negativ minsta kvadrat-metod — så holdover-budgeten vilar på verkliga data, inte på ett antaget golv för lång tau. (kommentar i scenariofilen, rad { "3" } till { "7" })

seg-ecbdbc9b163e = ÄRLIG AVGRÄNSNING: MODELLED — den KVANTIFIERAR en partners fördel med kvantklocka; den validerar INTE enheten och lånar aldrig valideringsöarna för SGP4/Allan/IGS. När golvet på någon rad är ett antaget standardvärde för klassen visas ett förbehåll om golvet på artefakten. Kör: kshana scenarios/quantum-trade.toml (kommentar i scenariofilen, rad { "9" } till { "12" })

seg-4b59ac409819 = Avvägning kvant mot klassisk för PNT & GNSS-nekad resiliens ({ "13503" }) är MODELLED, inte validerad: ett delpåstående är externt kontrollerat, men hela förmågan sammansätts av modellerade delar, så förmågan förblir Modelled. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Föregående</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Nästa</s1>realtime-frame-eop

seg-a349aa76b0ed = PARTNER
