# docs--kind-impairment-eval: translations (sv)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: raderna i <a1>verifieringsmatrisen</a1> som nämner den här typen.

seg-2e6b437f3e99 = Källa: <c1/>

seg-134407946837 = <c1/> (scenario kind)

seg-304496607bd7 = Scenariotyp i motorn v{ $version }, familj <a1>Jamming, spoofing och spektrum</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en tjänst för skydd av människoliv. Varje etikett här är motorns eller verifieringsmatrisens; en kind är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidence i README).

seg-98e740d32860 = Utvärderingsbädd för maskininlärd detektering av RF-störningar ({ "13494" }): generera en märkt, parameterförankrad SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), poängsätt en detektor (energy|agc|sqm|parity|fused) med den detektoroberoende ramen och redovisa AUC/ROC/förväxlingsmatris + Pd per klass vid ett mål-Pfa, samt optimismgapet mellan inom och utanför fördelningen. Endast MODELLED driftkaraktäristik — aldrig fält/IQ, inget bra/dåligt-utlåtande.

seg-41c3f9559282 = En körning av <c1/> sammanfattas som: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Exemplet <c1/> anger bland annat:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out uses a subtler out-of-tuning-reg

seg-667d26b3a2fe = Resultatetikett (motorns egen): MODELLED — syntetisk parameterförankrad korpus (aldrig fält/IQ); endast driftkaraktäristik, inget bra/dåligt-utlåtande

seg-7e7b07bc5545 = Diagrammet som motorn skriver för scenarios/impairment-eval.toml, kind impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, lika värden ½), förväxlingsmatris vid tröskel, P_d/P_md/P_fa/precision/korrekthet/F1 Tests: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + bootstrap-konfidensintervall som skiljer verkliga märkta anomalier; transparent detektor (återskapar etiketterna) Tests: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Märkt syntetisk korpus av störningar + detektoroberoende ram för ROC/AUC/förväxlingsmatris/Pfa-Pmd; läckageskydd, stratifierad delning, rapport om optimism vid fördelningsskifte (inom mot utanför regimen).

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, lika värden ½), förväxlingsmatris vid tröskel, P_d/P_md/P_fa/precision/korrekthet/F1. Oracle (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — oberoende bibliotek, exakt överensstämmelse

seg-c719d4060e1a = <b>MODELLED</b> Märkt syntetisk korpus av störningar + detektoroberoende ram för ROC/AUC/förväxlingsmatris/Pfa-Pmd; läckageskydd, stratifierad delning, fördelningsskifte (inom mot utanför r. Oracle (InternalConsistency): Gränser för AUC i sluten form (Mann–Whitney) + en detektor med perfekt referens; korpusen är SYNTETISK (parameterförankrad, inte fält/IQ)

seg-5565108cc4d1 = MODELLED — syntetisk parameterförankrad korpus (aldrig fält/IQ); endast driftkaraktäristik, inget bra/dåligt-utlåtande (result <c1/>)

seg-d2a9f35ea8cc = MODELLED endast driftkaraktäristik — aldrig fält/IQ, inget bra/dåligt-utlåtande. (kind catalogue (<c1/>))

seg-376f86fbdcb7 = ÄRLIG AVGRÄNSNING: enbart MODELLED driftkaraktäristik. Korpusen är syntetisk och parameterförankrad (sammansatt av Kshanas modeller för jamming/AGC/SQM/parity) — aldrig fältinspelningar eller rå IQ. Ramen är en domare; den redovisar karaktäristik och avger inget bra/dåligt-utlåtande. Run: kshana scenarios/impairment-eval.toml (scenario file comment, lines { "9" } to { "12" })

seg-882d67b9474f = Utvärdering av maskininlärd detektering av RF-störningar ({ "13494" }) är MODELLED, inte validerad: kontrollerad mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Familjesida: <a1>Jamming, spoofing och spektrum</a1>

seg-6cf4bb2d7f7a = Ämnessida: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Föregående</s1>hybrid

seg-1e68310f2dc6 = <s1>Nästa</s1>inertial
