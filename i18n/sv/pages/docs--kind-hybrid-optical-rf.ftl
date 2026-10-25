# docs--kind-hybrid-optical-rf: translations (sv)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-0482fec5b0f6 = Källa: <c1/>

seg-830c574e871b = <c1/> (scenario kind)

seg-72ad48275ebe = Scenariotyp i motorn v{ $version }, familj <a1>Optisk PNT</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-e6839b50b560 = MODELLED heterogent gemensamt kvalitetsmått för optisk + RF PNT (P5): sätter ihop den tvåvägs optiska länkbudgeten för { "1550" } nm (fotonbegränsad tvåvägsavståndsmätning CRLB σ_τ/√N och diffraktionsfotavtryck λ/D·avstånd), en korsmodal RAIM-skyddsnivå med lösningsseparation (position OCH tidssynkronisering) som fusionerar de lösa RF-lösningarna och de täta optiska lösningarna med olikartade kovarianser, den optiska tillgängligheten vid klar himmel för N stationer (oberoende union { "1" }−Π({ "1" }−a_i) och en rumsligt korrelerad variant), en överlämning av tillstånd/kovarians mellan optik och RF med ett BEVISAT bitkontinuerligt (hoppfritt) medelvärde och en NEES χ²-konsistensspärr, samt ett gemensamt poängtal P(tillgänglig OCH precisionsklass OCH integritetssäkrad) med korrelationshantering. VALIDATED sluten form: avstånds-CRLB, diffraktionsfotavtrycket, χ²-kvantilen för skyddsnivån, unionskombinatoriken, överlämningens medelvärdeskontinuitet + NEES-spärren och den gemensamma oberoende produkten. MODELLED: de optiska förlustfördelningarna, storleksordningarna för RF-/optisk σ, indata om molnklimatologi, korrelationerna och P_HMI-budgeten. Ingen certifierad tillgänglighets-/integritetsprodukt.

seg-30904e2367fc = En körning av <c1/> sammanfattas som: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

seg-73e5cf56c92c = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Exemplet <c1/> anger bland annat:

seg-7b9ce4689508 = Resultatetikett (motorns egen): Heterogent gemensamt kvalitetsmått för tillgänglighet / precision / integritet för optisk + RF PNT (P5). VALIDATED sluten form: den fotonbegränsade avstånds-CRLB (σ_τ/√N) och diffraktionsfotavtrycket (λ/D·avstånd), χ²-kvantilen för korsmodal skyddsnivå, den oberoende unionstillgängligheten för N stationer ({ "1" } − Π(

seg-5cea5229815e = Diagrammet som motorn skriver för scenarios/hybrid-optical-rf.toml, kind hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Rapporten hybrid-optical-rf anger den länkkonfiguration som den faktiskt kördes med (bärvågens våglängd, sändar- och mottagarapertur, avstånd, pulsbredd, integratio. Oracle (InternalConsistency): Ingen extern oberoende referens, och ingen är möjlig: detta är självbeskrivning, inte en mätning. Den registreras eftersom frånvaron av den var en brist -- P5 var tvungen att hämta bärvågens våglängd och sändaraperturen från standardvärden i källkoden, och att sluta sig till att en ensam <c1/> var i kvadratmeter utifrån en intern konsistenskontroll. Slutsatsen var riktig, vilket är just varför det spelade roll: ingenting hade fångat att den var fel

seg-28abb5a84eaa = <b>MODELLED</b> Rapporten hybrid-optical-rf anger en tillgänglighet för RF-länken, sammansatt av storheter som motorn redan beräknar snarare än av en importerad klimatologi, och. Oracle (InternalConsistency): Ingen extern oberoende referens, och ExternalDataset avstås från. De två indata är en Eb/N0-marginal och en C/N0-tröskelpassage, båda funktioner av en MODELLED EIRP, ett kvalitetsmått och en klumpad förlustfördelning; det finns ingen uppmätt tillgänglighetsregistrering för en optisk/RF-hybridtjänst mellan jorden och månen att kontrollera det sammansatta måttet mot. De kontroller som finns är interna och anges som sådana: sammansättningen räknas om från r

seg-888004543d37 = <b>MODELLED</b> Rapporten hybrid-optical-rf ger kvoten mellan optisk och RF-avståndsmätning med den ENA konfiguration som båda grenarna utvärderades med i samma objekt: sa. Oracle (InternalConsistency): Ingen extern oberoende referens för KVOTEN, och ExternalDataset avstås från medvetet. Den underliggande RF-kedjan har en -- tests/validate_p5_rf_ranging_precision.rs kontrollerar linkbudget::link_budget och navsignal::dll_code_jitter_chips mot en oberoende Python/NumPy-fixtur och mot det hårdkodade räknade värdet av Kaplan & Hegarty ({ "2.814e-3" } chip / { "0.825" } m vid { "45" } dB-Hz) -- och den optiska CRLB har sin egen slutna rad

seg-db5ff373b50f = <b>MODELLED</b> Rapporten hybrid-optical-rf anger vad den korsmodala kikvadratövervakaren faktiskt kan UPPTÄCKA, inte bara att den klarar ett felfritt fall: det minsta detekterbara. Oracle (InternalConsistency): Två interna oberoende referenser, ingen extern datamängd. ({ "1" }) Rundtur i sluten form: den minsta detekterbara biasen tas fram genom att invertera den icke-centrala kikvadratsvansen på den icke-centrala parametern (raim::pbias) och verifieras genom att mata tillbaka den resulterande icke-centrala parametern genom raim::noncentral_chi2_cdf vid övervakarens egen tröskel, vilket måste ge P_md. ({ "2" }) Injektion mot analys: en bias skrivs in i RF-skattningen för en axel

seg-24f31f6b353f = Heterogent gemensamt kvalitetsmått för tillgänglighet / precision / integritet för optisk + RF PNT (P5). VALIDATED sluten form: den fotonbegränsade avstånds-CRLB (σ_τ/√N) och diffraktionsfotavtrycket (λ/D·avstånd), χ²-kvantilen för korsmodal skyddsnivå, den oberoende unionstillgängligheten för N stationer ({ "1" } − Π({ "1" }−a_i)), invarianten för medelvärdeskontinuitet vid överlämning mellan optik och RF (bit för bit utan hopp) och NEES χ²-spärren samt det gemensamma FoM:ets oberoende (result <c1/>)

seg-bec90783ad8b = MODELLED heterogent gemensamt kvalitetsmått för optisk + RF PNT (P5): sätter ihop den tvåvägs optiska länkbudgeten för { "1550" } nm (fotonbegränsad tvåvägsavståndsmätning CRLB σ_τ/√N och diffraktionsfotavtryck λ/D·avstånd), en korsmodal RAIM-skyddsnivå med lösningsseparation (position OCH tidssynkronisering) som fusionerar de lösa RF-lösningarna och de täta optiska lösningarna med olikartade kovarianser, den optiska tillgängligheten vid klar himmel för N stationer (oberoende un (kind catalogue (<c1/>))

seg-15abc895e477 = MODELLED: de optiska förlustfördelningarna, storleksordningarna för RF-/optisk σ, indata om molnklimatologi, korrelationerna och P_HMI-budgeten. (kind catalogue (<c1/>))

seg-9fafa5ffb521 = MODELLED. Validerade slutna former: avstånds-CRLB (sigma_tau/sqrt(N)), diffraktionsfotavtryck (lambda/D * avstånd), kikvadratkvantil för skyddsnivå, unionskombinatorik, överlämningens medelvärdeskontinuitet + NEES-spärr och den gemensamma oberoende produkten. Förlustfördelningarna, sigma-storleksordningarna, indata om molnklimatologi, korrelationerna och P_HMI-budgeten är Modelled representativa indata. Varje fält nedan är valfritt och visas vid sitt (scenario file comment, lines { "10" } to { "14" })

seg-e5f964e5d422 = --- G15 bias / ramp fault injection against the cross-modality monitor --- Den minsta detekterbara biasen och detekteringskraftkurvan är ANALYTISKA (inversion av icke-central kikvadrat), så de behöver inga egna indata. Dessa två anger bara den ramphastighet som den redovisade tiden till detektering är en hastighetsomvandling av. Båda MODELLED. (scenario file comment, lines { "56" } to { "59" })

seg-70f50a62aa12 = --- G17 post-handover coast: process noise and the alert-limit crossing --- Slumpvandring på det befintliga överlämningsfiltret med 4 tillstånd (öst, nord, upp, klocka). Larmgränserna är de som redan deklarerats ovan; bara processbruset och täckningsfaktorn är nya. Båda PSD:erna är MODELLED representativa indata och passagetiderna skalar direkt med dem. (scenario file comment, lines { "63" } to { "67" })

seg-9fb4240fb0ef = Självbeskrivningen i hybridrapporten för optik/RF är MODELLED, inte validerad: kontrollerad mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Familjesida: <a1>Optisk PNT</a1>

seg-1586d90cdf1b = <s1>Föregående</s1>holdover-test

seg-211275a00df0 = <s1>Nästa</s1>hybrid-ukf
