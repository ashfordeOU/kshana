# docs--kind-quantum-anomaly-detect: translations (nb)

seg-29e58493fdd4 = Modellert

seg-619127334cf3 = Ingen matriserad nevner denne typen ved navn; etiketten på resultatet er motorens egen, ovenfor.

seg-7b2721b7588d = Scenariotype i motoren v{ $version }, familie <a1>Treghets-, fusjons- og kvantesensorer</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-f7f12029e0ec = Familieside: <a1>Treghets-, fusjons- og kvantesensorer</a1>

seg-496b17a8d3b9 = Temaside: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ikke levert: kun ytelsesmodeller; kaldatom-/klokkemaskinvare er en partners. Uavhengig referanse (NoneKind): ingen: en disiplin eid av en partner, uten modul og uten test etter utforming

seg-836d5102f0d1 = Kilde: <c1/>

seg-ad4ce0110e8d = <c1/> (scenariotype)

seg-04310cd6cbec = MODELLED feil- og anomalideteksjon for kvante-PNT-systemer: en merket feilkatalog (klokkens frekvenssprang, drift og tap av lås; sensorens skjevhetssprang og bortfall), en ROC AUC for deteksjonsstatistikken (med et bootstrap-konfidensintervall fra den eksternt validerte eval_stats) og en minste detekterbare feil ved en fast falsk-alarmrate, der den kvanteklokke-støttede monitoren (lavere støy) oppdager mindre feil, som ærlig TradeEvidence + representativitet. Gaussisk modell for deteksjonsstatistikken (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametere fra offentlige kilder, ingen TRL, ingen flyging og ingen sertifisering.

seg-442310afbb13 = En kjøring av <c1/> oppsummeres slik: quantum-anomaly-detect | AUC quantum { "0.9908" } vs classical { "0.7603" } | min-detectable fault quantum { "1.312" } vs classical { "4.372" } | { "5" } fault classes | trade quantum wins 2/2 | MODELLED

seg-335b8d87e27d = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Eksempelet <c1/> angir blant annet:

seg-f44afe581836 = { $version }

seg-25da07e56aa8 = kvantum mot klassisk PNT-anomalideteksj

seg-2f1d14239d1a = Diagrammet motoren skriver for scenarios/quantum-anomaly-detect.toml, type quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analytisk binormal ROC AUC = Φ(μ/(σ√{ "2" })) og den minste detekterbare feilen σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)) som ligger til grunn for kvantefeil- og anomalidetektorene. Uavhengig referanse (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa m.fl., JMLR { "2011" }), begge BSD-3-Clause, uavhengige biblioteker som beregner de samme entydig definerte størrelsene for gaussisk hale og AUC, stemt til A&S-erf-gulvet (~{ "7e-8" }). Fordelen til kvante framfor klassisk som er bygget oppå dette, forblir MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Ett reproduserbart TradeEvidence-objekt (fast ramme: scenario+seed+motor; felles verdier per kvalitetsmål for kvante mot klassisk med fordel med riktig fortegn, valgfritt { "95" }%. Uavhengig referanse (InternalConsistency): lukkede identiteter for fordel/vinner og en tro innpakning av det eksisterende quantum_trade::TradeResult; ærligheten er knyttet til registeret over representativitet og verifikasjonsetikettene

seg-b854cedc8a51 = <b>MODELLED</b> Merket katalog over kvantefeil (klokkens frekvenssprang, drift og tap av lås; sensorens skjevhetssprang og bortfall), en ROC AUC for deteksjonsstatistikken med et bootstrap-konfidensintervall, og en minste. Uavhengig referanse (InternalConsistency): lukket gaussisk AUC = Phi(mu/(sigma*sqrt2)) kontrollert mot den eksternt validerte eval_stats::bootstrap_auc_ci (mot scikit-learn) + analytiske terskler for deteksjon

seg-7b465c2bb7cf = MODELLED feil- og anomalideteksjon for kvante-PNT-systemer: en merket feilkatalog (klokkens frekvenssprang, drift og tap av lås; sensorens skjevhetssprang og bortfall), en ROC AUC for deteksjonsstatistikken (med et bootstrap-konfidensintervall fra den eksternt validerte eval_stats) og en minste detekterbare feil ved en fast falsk-alarmrate, der den kvanteklokke-støttede monitoren (lavere støy) oppdager mindre feil, som ærlig TradeEvidence + representativ (typekatalog (<c1/>))

seg-7f43972b246d = Feil- og anomalideteksjon for kvante-PNT-systemer: merket feilkatalog + ROC AUC + minste detekterbare feil, kvanteklokke-støttet monitor mot klassisk. MODELLED; illustrative parametere fra offentlige kilder; modellerer klassen, ingen påstand om TRL eller flyging. (kommentar i scenariofilen, linje { "1" } til { "3" })

seg-eb75c6a4dcec = Handelsbevis for kvante mot klassisk (felles form) er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Feil- og anomalideteksjon for kvante-PNT-systemer er MODELLED, ikke validert: kontrollert mot sin egen lukkede eller analytiske identitet, som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Forrige</s1>pvt

seg-aa689568cf84 = <s1>Neste</s1>quantum-gnss-free-nav
