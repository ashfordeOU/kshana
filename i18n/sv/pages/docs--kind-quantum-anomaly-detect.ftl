# docs--kind-quantum-anomaly-detect: translations (sv)

seg-29e58493fdd4 = Modelled

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-496b17a8d3b9 = Ämnessida: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Tillhandahålls inte — endast prestandamodeller; kallatoms-/klockhårdvaran är en partners. Oracle (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-836d5102f0d1 = Källa: <c1/>

seg-ad4ce0110e8d = <c1/> (scenariotyp)

seg-04310cd6cbec = MODELLED fel-/anomalidetektering för kvant-PNT-system: en märkt felkatalog (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en ROC-AUC för detektionsstatistiken (med ett bootstrap-konfidensintervall från den externt validerade eval_stats) och ett minsta detekterbart fel vid en fast falsklarmsfrekvens, där den kvantklockstödda övervakaren (lägre brus) detekterar mindre fel — som ärlig TradeEvidence + representativitet. Gaussisk modell för detektionsstatistik (AUC = Phi(mu/(sigma*sqrt2))); modellerar klassen, illustrativa parametrar från offentliga källor, ingen TRL/flygerfarenhet/certifiering.

seg-442310afbb13 = En körning av <c1/> sammanfattas som: quantum-anomaly-detect | AUC quantum { "0.9908" } vs classical { "0.7603" } | min-detectable fault quantum { "1.312" } vs classical { "4.372" } | { "5" } fault classes | trade quantum wins 2/2 | MODELLED

seg-335b8d87e27d = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Exemplet <c1/> anger bland annat:

seg-f44afe581836 = { $version }

seg-2f1d14239d1a = Diagrammet som motorn skriver för scenarios/quantum-anomaly-detect.toml, typ quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analytisk binormal ROC-AUC = Φ(μ/(σ√{ "2" })) och det minsta detekterbara felet σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) som ligger till grund för kvantfels- och anomalidetektorerna. Oberoende referens (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), båda BSD-3-Clause — oberoende bibliotek som beräknar samma entydigt definierade storheter för Gauss-svans / AUC, matchade till A&S-erf-golvet (~{ "7e-8" }). Fördelen för kvant mot klassisk som byggs ovanpå förblir MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Ett reproducerbart TradeEvidence-objekt (fast ram: scenario+frö+motor; gemensamma värden per kvalitetsmått för kvant mot klassisk med fördel med rätt polaritet, valfritt { "95" } %. Oberoende referens (InternalConsistency): Identiteter i sluten form för fördel/vinnare + en trogen inpackning av den befintliga quantum_trade::TradeResult; ärligheten är knuten till representativitetsregistret och verifieringsetiketterna

seg-b854cedc8a51 = <b>MODELLED</b> Märkt kvantfelskatalog (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en ROC-AUC för detektionsstatistiken med ett bootstrap-konfidensintervall och ett minst. Oberoende referens (InternalConsistency): Gaussisk AUC i sluten form = Phi(mu/(sigma*sqrt2)) korskontrollerad mot den externt validerade eval_stats::bootstrap_auc_ci (mot scikit-learn) + analytiska detektionströsklar

seg-7b465c2bb7cf = MODELLED fel-/anomalidetektering för kvant-PNT-system: en märkt felkatalog (klockans frekvenshopp/drift/låsförlust; sensorns biassteg/bortfall), en ROC-AUC för detektionsstatistiken (med ett bootstrap-konfidensintervall från den externt validerade eval_stats) och ett minsta detekterbart fel vid en fast falsklarmsfrekvens, där den kvantklockstödda övervakaren (lägre brus) detekterar mindre fel — som ärlig TradeEvidence + representativ (typkatalog (<c1/>))

seg-7f43972b246d = Fel-/anomalidetektering för kvant-PNT-system — märkt felkatalog + ROC-AUC + minsta detekterbara fel, kvantklockstödd mot klassisk övervakare. MODELLED; illustrativa parametrar från offentliga källor; modellerar klassen, inget TRL-/flygpåstående. (kommentar i scenariofilen, rad { "1" } till { "3" })

seg-eb75c6a4dcec = Jämförande evidens för kvant mot klassisk (gemensam form) är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Fel-/anomalidetektering för kvant-PNT-system är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Föregående</s1>pvt

seg-aa689568cf84 = <s1>Nästa</s1>quantum-gnss-free-nav

seg-a349aa76b0ed = PARTNER
