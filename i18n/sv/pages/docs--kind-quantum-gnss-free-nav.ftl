# docs--kind-quantum-gnss-free-nav: translations (sv)

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-7b2721b7588d = Scenariotyp i motorn v{ $version }, familj <a1>Tröghets-, fusions- och kvantsensorer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Accelerometer med kallatomsinterferometer från grundprinciper (k_eff·T², QPN). Oracle (ExternalDataset): Publicerade numeriska vektorer från primärartiklar om CAI (Cheinet { "2008" } överföringsfunktion; Peters/Freier känslighet): k_eff·T² stämde exakt, skottbrus-ASD ett ensidigt golv inom ~{ "2" }× av varje publicerat instrument (verkliga enheter har tekniskt brus över kvantgolvet). Ett intervall, inte paritet. { "0.30" } round { "2" } (pre-registered fcb9ac64), ett fynd (förblir MODELLED): det rena QPN-rotationsbruset mot det uppmätta Gauguet et al.

seg-9955b1b1c018 = Prestanda hos kvantinertialsensorer är MODELLED, inte validerad: ett delpåstående kontrolleras externt, men hela förmågan består av modellerade delar, så förmågan förblir Modelled. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Familjesida: <a1>Tröghets-, fusions- och kvantsensorer</a1>

seg-496b17a8d3b9 = Ämnessida: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Ämnessida: <a1>QUANTUM.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Tillhandahålls inte — endast prestandamodeller; kallatoms-/klockhårdvaran är en partners. Oracle (NoneKind): ingen: en disciplin som ägs av partner, utan modul och utan test av utformning

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Ett reproducerbart TradeEvidence-objekt (fast ram: scenario+frö+motor; gemensamma värden per kvalitetsmått för kvant mot klassisk med fördel med rätt polaritet, valfritt { "95" } %. Oberoende referens (InternalConsistency): Identiteter i sluten form för fördel/vinnare + en trogen inpackning av den befintliga quantum_trade::TradeResult; ärligheten är knuten till representativitetsregistret och verifieringsetiketterna

seg-eb75c6a4dcec = Jämförande evidens för kvant mot klassisk (gemensam form) är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-bfbcc7e8f620 = Källa: <c1/>

seg-cfa59601df4a = <c1/> (scenariotyp)

seg-790fbfdd80f0 = MODELLED GNSS-fri kvantnavigering: under ett GNSS-bortfall, en inertiell budget för kvant (kall-atom-interferometer) mot en klassisk INS av navigeringsklass — tillväxt av positionsfel under glidflygningen, holdover till ett positionströskelvärde och avvägningen kvant mot klassisk som ärlig TradeEvidence med representativitet. Ärlig anmärkning om observerbarhet: utan extern positionsbestämning är accelerometerns bias inte observerbar, så felet växer; kvantsensorn bromsar men sluter inte det gapet. Illustrativa enhetsparametrar från offentliga källor; modellerar klassen, ingen TRL/flygerfarenhet/certifiering.

seg-dd74f248373d = En körning av <c1/> sammanfattas som: quantum-gnss-free-nav | outage 300s | quantum pos err { "0.00" } m vs classical { "37.31" } m (8289.5x) | holdover quantum 44721s vs classical 534s (thr { "100" } m) | trade quantum wins 2/2 | MODELLED

seg-960491d74173 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-88d9dfe0353a = Exemplet <c1/> anger bland annat:

seg-1bdbf1a737b2 = Diagrammet som motorn skriver för scenarios/quantum-gnss-free-nav.toml, typ quantum-gnss-free-nav

seg-d196391dcf4f = <b>MODELLED</b> Kvant (kall-atom-interferometer) mot klassisk navigeringsklassad INS-koppelnavigering under ett GNSS-bortfall: tillväxt av positionsfel, holdover till ett positionströskelvärde,. Oberoende referens (InternalConsistency): Återanvända inertiella budgetar korskontrollerade mot en oberoende dubbelintegrering i Octave av samma ODE för koppelnavigering (annan körmiljö, delad modell → ReferenceImpl) plus det publicerade kortsiktiga bruset från Freier-2016 som ett ensidigt ankare; den sammansatta jämförelsen kvant mot klassisk förblir MODELLED

seg-af35cccc4e2c = MODELLED GNSS-fri kvantnavigering: under ett GNSS-bortfall, en inertiell budget för kvant (kall-atom-interferometer) mot en klassisk INS av navigeringsklass — tillväxt av positionsfel under glidflygningen, holdover till ett positionströskelvärde och avvägningen kvant mot klassisk som ärlig TradeEvidence med representativitet. (typkatalog (<c1/>))

seg-9b9ce7600ffc = GNSS-fri kvantnavigering — kvant (kall-atom-interferometer) mot klassisk INS-koppelnavigering av navigeringsklass under ett GNSS-bortfall. MODELLED; illustrativa enhetsparametrar från offentliga källor; modellerar klassen, inget TRL-/flygpåstående. (kommentar i scenariofilen, rad { "1" } till { "3" })

seg-9d67411151e3 = GNSS-fri kvantnavigering är MODELLED, inte validerad: kontrollerad mot sin egen slutna analytiska identitet. Det fångar överförings- och koefficientfel, men är ingen extern oberoende referens. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-e1d502e1ed6d = <s1>Föregående</s1>quantum-anomaly-detect

seg-1f3705925b3c = <s1>Nästa</s1>quantum-time-transfer

seg-a349aa76b0ed = PARTNER
