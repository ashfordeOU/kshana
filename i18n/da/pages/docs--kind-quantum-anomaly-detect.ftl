# docs--kind-quantum-anomaly-detect: translations (da)

seg-29e58493fdd4 = Modelleret

seg-7b2721b7588d = Scenarietype i motoren v{ $version }, familie <a1>Inertial-, fusions- og kvantesensorer</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-f7f12029e0ec = Familieside: <a1>Inertial-, fusions- og kvantesensorer</a1>

seg-496b17a8d3b9 = Emneside: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Ikke leveret: kun ydelsesmodeller; koldatom-/urhardware er en partners. Uafhængig reference (NoneKind): ingen: en disciplin, som partneren ejer, uden modul og uden test i designet

seg-836d5102f0d1 = Kilde: <c1/>

seg-ad4ce0110e8d = <c1/> (scenarietype)

seg-04310cd6cbec = MODELLED detektion af fejl og anomalier for kvante-PNT-systemer: et mærket fejlkatalog (urets frekvensspring, drift og tab af lås; sensorens biastrin og udfald), en ROC-AUC for detektionsstatistikken (med et bootstrap-konfidensinterval fra den eksternt validerede eval_stats) og en mindste detekterbare fejl ved en fast falsk alarmrate, hvor den kvanteur-støttede monitor (lavere støj) detekterer mindre fejl — som ærlig TradeEvidence + repræsentativitet. Gaussisk model af detektionsstatistikken (AUC = Phi(mu/(sigma*sqrt2))); modellerer klassen, illustrative parametre fra offentlige kilder, ingen TRL/flyvning/certificering.

seg-442310afbb13 = Én kørsel af <c1/> opsummeres som: quantum-anomaly-detect | AUC kvante { "0.9908" } mod klassisk { "0.7603" } | mindste detekterbare fejl kvante { "1.312" } mod klassisk { "4.372" } | { "5" } fejlklasser | afvejning: kvante vinder 2/2 | MODELLED

seg-335b8d87e27d = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Eksemplet <c1/> angiver blandt andet:

seg-f44afe581836 = { $version }

seg-25da07e56aa8 = kvante- vs. klassisk PNT-anomalidetekti

seg-2f1d14239d1a = Diagrammet, som motoren skriver for scenarios/quantum-anomaly-detect.toml, type quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analytisk binormal ROC-AUC = Φ(μ/(σ√{ "2" })) og den mindste detekterbare fejl σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), som ligger til grund for detektorerne for kvantefejl og anomalier. Uafhængig reference (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), begge BSD-3-Clause — uafhængige biblioteker, der beregner de samme entydigt definerede størrelser for gaussisk hale og AUC, afstemt til A&S-erf-gulvet (~{ "7e-8" }). Fordelen for kvante frem for klassisk, som er bygget oven på, forbliver MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Ét reproducerbart TradeEvidence-objekt (fast ramme: scenarie+seed+motor; fælles værdier for kvante mod klassisk pr. kvalitetsmål med polaritetskorrekt fordel, valgfri { "95" }%. Uafhængig reference (InternalConsistency): identiteter i lukket form for fordel og vinder + tro indpakning af det eksisterende quantum_trade::TradeResult; ærligheden er knyttet til registeret over repræsentativitet og verifikationsmærkaterne

seg-b854cedc8a51 = <b>MODELLED</b> Mærket katalog over kvantefejl (urets frekvensspring, drift og tab af lås; sensorens biastrin og udfald), en ROC-AUC for detektionsstatistikken med bootstrap-konfidensinterval og en mindste. Uafhængig reference (InternalConsistency): gaussisk AUC i lukket form = Phi(mu/(sigma*sqrt2)) krydskontrolleret mod den eksternt validerede eval_stats::bootstrap_auc_ci (mod scikit-learn) + analytiske detektionstærskler

seg-7b465c2bb7cf = MODELLED detektion af fejl og anomalier for kvante-PNT-systemer: et mærket fejlkatalog (urets frekvensspring, drift og tab af lås; sensorens biastrin og udfald), en ROC-AUC for detektionsstatistikken (med et bootstrap-konfidensinterval fra den eksternt validerede eval_stats) og en mindste detekterbare fejl ved en fast falsk alarmrate, hvor den kvanteur-støttede monitor (lavere støj) detekterer mindre fejl — som ærlig TradeEvidence + repræsentativ (typekatalog (<c1/>))

seg-7f43972b246d = Detektion af fejl og anomalier for kvante-PNT-systemer — mærket fejlkatalog + ROC-AUC + mindste detekterbare fejl, kvanteur-støttet mod klassisk monitor. MODELLED; illustrative parametre fra offentlige kilder; modellerer klassen, ingen påstand om TRL eller flyvning. (kommentar i scenariefilen, linje { "1" } til { "3" })

seg-eb75c6a4dcec = Afvejning mellem kvante og klassisk (fælles form) er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Detektion af fejl og anomalier for kvante-PNT-systemer er MODELLED, ikke valideret: kontrolleret mod dens egen identitet i lukket/analytisk form — det fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Forrige</s1>pvt

seg-aa689568cf84 = <s1>Næste</s1>quantum-gnss-free-nav
