# docs--kind-quantum-trade: translations (nl)

seg-debc2f07db78 = true

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: de rijen van de <a1>verificatiematrix</a1> die dit kind noemen.

seg-7b2721b7588d = Scenariosoort van de engine v{ $version }, familie <a1>Inertiële, fusie- en kwantumsensoren</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-f7f12029e0ec = Familiepagina: <a1>Inertiële, fusie- en kwantumsensoren</a1>

seg-496b17a8d3b9 = Onderwerppagina: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Niet geleverd: alleen prestatiemodellen; koudeatoom-/klokhardware is van een partner. Onafhankelijke referentie (NoneKind): geen: een discipline van een partner, bewust zonder module en zonder test

seg-51cac2f918e0 = Themapagina: <a1>POSITIONING.md</a1>

seg-3a8c76a2396f = Bron: <c1/>

seg-f9af2813532e = <c1/> (scenariosoort)

seg-eb55d253dd11 = Afweging van PNT quantum tegenover klassiek ({ "13503" }): voordeel in holdover van tijdsynchronisatie + inertiale holdover van een kandidaatklok (een gemeten ADEV-curve — het scharnierpunt voor verdedigbaarheid — of een kwantumklokklasse) tegenover een klassieke basislijnklasse, met het voorbehoud over de aanname van de lange-tau-ondergrens meegegeven op het artefact, plus een GNSS-ontzegde envelop van veerkracht tegenover tijd. MODELLED; kwantificeert (valideert nooit) een apparaat van een partner. De kandidaatklok is een gemeten curve (<c1/> + <c2/>, even lang, minstens { "2" } punten; zij wint wanneer beide vormen zijn gegeven) of een <c3/>.

seg-4f470bc1d82c = Eén run van <c1/> vat samen als: quantum-trade | kandidaat gemeten ADEV | holdover tijdsynchronisatie 2621947s tegenover 203s (12943.62x) | inertiaal 14108s tegenover 378s (37.34x) | veerkracht-uitloop 14108s | MODELLED [voorbehoud: ondergrens aangenomen]

seg-2639560aeff2 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-d66f1ef84201 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-f2cc0830b53f = Het voorbeeld <c1/> stelt onder meer in:

seg-ee5bcbbe0167 = csac

seg-f5fa445702c6 = Resultaatlabel (van de engine): MODELLED — kwantificeert (valideert nooit) een klok/sensor van een partner; niet in vlucht gedemonstreerd

seg-c74c63ffd859 = De grafiek die de engine schrijft voor scenarios/quantum-trade.toml, soort quantum-trade

seg-93310aaa6ead = <b>VALIDATED</b> NNLS-herstel van een machtswet (white-FM + rode-ruisondergrens) uit een gepubliceerde, gemeten Allan-deviatie van de ⁸⁸Sr-optische-klokovergang — met reproductie van σ_y(τ) en de kopschaling 4.7e-16/√τ voor korte τ met een echte gemeten lange-τ-ondergrens, in plaats van Tests: <a1>optical_clock_adev_reference.rs</a1>.

seg-fc46e95688ba = <b>VALIDATED</b> NNLS-fit van gemeten ADEV, χ²-consistentiebanden voor NEES/NIS en de discrete procesruiscovariantie (holdover-uitloop) van de klok volgens van Loan — de rekenkundige ruggengraat van de afwegingsengine Tests: <a1>scipy_reference.rs</a1>.

seg-6e2b62136cef = <b>MODELLED</b> Inlezen van gemeten ADEV (NNLS), afwegingstabel (holdover van tijdsynchronisatie/inertiaal + voordeel), envelop van veerkracht tegenover tijd; voorbehoud over de ondergrens meegegeven op het artefact.

seg-b577b8464cf7 = <b>VALIDATED</b> NNLS-fit van gemeten ADEV, χ²-consistentiebanden voor NEES/NIS en de discrete procesruiscovariantie (holdover-uitloop) van de klok volgens van Loan — de rekenkundige ruggengraat van de afwegingsengine. Onafhankelijke referentie (ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q exact, χ² <{ "5e-4" } bij operationele vrijheidsgraden. Alleen kernels — cijfers voor apparaatprestaties blijven gemodelleerd (volgende rij)

seg-6b8aa8cd6d3e = <b>MODELLED</b> Inlezen van gemeten ADEV (NNLS), afwegingstabel (holdover van tijdsynchronisatie/inertiaal + voordeel), envelop van veerkracht tegenover tijd; voorbehoud over de ondergrens meegegeven op het artefact. Uitvoerbaar vanuit. Onafhankelijke referentie (ExternalDataset): de kernel voor de fit van gemeten ADEV→PSD (NNLS) komt overeen met scipy.optimize.nnls (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — een onafhankelijke externe kernel; maar de GETALLEN van de afweging kwantificeren (valideren nooit) een klok/CAI van een partner, dus de afweging zelf blijft MODELLED, zonder validatiekeurmerk

seg-3d678f64e41c = MODELLED — kwantificeert (valideert nooit) een klok/sensor van een partner; niet in vlucht gedemonstreerd (resultaat <c1/>)

seg-20ba66ae9518 = Afweging van PNT quantum tegenover klassiek ({ "13503" }): voordeel in holdover van tijdsynchronisatie + inertiale holdover van een kandidaatklok (een gemeten ADEV-curve — het scharnierpunt voor verdedigbaarheid — of een kwantumklokklasse) tegenover een klassieke basislijnklasse, met het voorbehoud over de aanname van de lange-tau-ondergrens meegegeven op het artefact, plus een GNSS-ontzegde envelop van veerkracht tegenover tijd. (soortencatalogus (<c1/>))

seg-45a1d84eef18 = MODELLED; kwantificeert (valideert nooit) een apparaat van een partner. (soortencatalogus (<c1/>))

seg-15275d27252a = Berekent het voordeel in holdover van tijdsynchronisatie en in inertiale holdover van een KANDIDAAT-klok ten opzichte van een KLASSIEKE basislijn, plus een GNSS-ontzegde envelop van veerkracht tegenover tijd. De ondergrens van de kandidaat wordt bepaald door de MEASURED overlappende ADEV-curve van de klok van een partner (het scharnierpunt voor verdedigbaarheid), gefit met niet-negatieve kleinste kwadraten — dus het holdoverbudget rust op echte data, niet op een aangenomen lange-tau-ondergrens. (opmerking in het scenariobestand, regels { "3" } tot { "7" })

seg-ecbdbc9b163e = EERLIJKE REIKWIJDTE: MODELLED — het KWANTIFICEERT het voordeel van de kwantumklok van een partner; het valideert het apparaat NIET en leent nooit de validatie-eilanden van SGP4/Allan/IGS. Wanneer de ondergrens van een rij een aangenomen klassestandaard is, wordt op het artefact een voorbehoud over de ondergrens getoond. Run: kshana scenarios/quantum-trade.toml (opmerking in het scenariobestand, regels { "9" } tot { "12" })

seg-4b59ac409819 = Afweging van PNT quantum tegenover klassiek & GNSS-ontzegde veerkracht ({ "13503" }) is MODELLED, niet getoetst: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e6498fae3ba7 = <s1>Vorige</s1>quantum-time-transfer

seg-50d4bbb7486b = <s1>Volgende</s1>realtime-frame-eop
