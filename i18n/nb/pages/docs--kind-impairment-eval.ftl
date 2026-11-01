# docs--kind-impairment-eval: translations (nb)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-2e6b437f3e99 = Kilde: <c1/>

seg-134407946837 = <c1/> (scenariotype)

seg-304496607bd7 = Scenariotype i motoren v{ $version }, familie <a1>Jamming, spoofing og spekteret</a1>. Veiledende: analyseresultat fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en safety-of-life-tjeneste. Hver etikett her kommer fra motoren eller verifikasjonsmatrisen; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett oppnås: avsnittet Evidence i README).

seg-98e740d32860 = Evalueringstestbenk for maskinlæringsbasert deteksjon av RF-forstyrrelser ({ "13494" }): generer et merket, parameterforankret SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), vurder en detektor (energy|agc|sqm|parity|fused) med den detektoruavhengige harnessen, og rapporter AUC/ROC/forvekslingsmatrise + Pd per klasse ved en målsatt Pfa, samt optimismegapet mellom i og utenfor distribusjonen. Kun MODELLED driftskarakteristikker, aldri felt-/IQ-data, ingen dom om bra/dårlig.

seg-41c3f9559282 = Én kjøring av <c1/> oppsummeres slik: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Eksemplet <c1/> setter blant annet:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out bruker et mer subtilt regime utenfor tuningen

seg-667d26b3a2fe = Resultatetikett (motorens): MODELLED — syntetisk parameterforankret korpus (aldri felt-/IQ-data); kun driftskarakteristikker, ingen dom om bra/dårlig

seg-7e7b07bc5545 = Diagrammet motoren skriver for scenarios/impairment-eval.toml, typen impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, uavgjort ½), forvekslingsmatrise ved terskel, P_d/P_md/P_fa/presisjon/treffsikkerhet/F1. Tester: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + bootstrap-KI som skiller virkelige merkede anomalier; gjennomsiktig detektor (gjengir merkene). Tester: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Merket syntetisk korpus av forstyrrelser + detektoruavhengig ROC/AUC/forvekslings-/Pfa-Pmd-harness; lekkasjevern, stratifisert deling, rapport om optimisme ved distribusjonsskift (i mot utenfor regimet).

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, uavgjort ½), forvekslingsmatrise ved terskel, P_d/P_md/P_fa/presisjon/treffsikkerhet/F1. Uavhengig referanse (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }), uavhengig bibliotek, eksakt treff

seg-c719d4060e1a = <b>MODELLED</b> Merket syntetisk korpus av forstyrrelser + detektoruavhengig ROC/AUC/forvekslings-/Pfa-Pmd-harness; lekkasjevern, stratifisert deling, distribusjonsskift (i mot utenfor re. Uavhengig referanse (InternalConsistency): Lukkede AUC-grenser (Mann–Whitney) + en detektor med perfekt uavhengig referanse; korpuset er SYNTETISK (parameterforankret, ikke felt-/IQ-data)

seg-5565108cc4d1 = MODELLED — syntetisk parameterforankret korpus (aldri felt-/IQ-data); kun driftskarakteristikker, ingen dom om bra/dårlig (resultat <c1/>)

seg-d2a9f35ea8cc = Kun MODELLED driftskarakteristikker, aldri felt-/IQ-data, ingen dom om bra/dårlig. (typekatalog (<c1/>))

seg-376f86fbdcb7 = ÆRLIG AVGRENSNING: kun MODELLED driftskarakteristikker. Korpuset er syntetisk og parameterforankret (satt sammen fra Kshanas modeller for jamming/AGC/SQM/parity), aldri feltopptak eller rå IQ. Harnessen er en dommer; den rapporterer karakteristikker, den avgir ingen dom om bra/dårlig. Kjør: kshana scenarios/impairment-eval.toml (kommentar i scenariofilen, linjene { "9" } til { "12" })

seg-882d67b9474f = Evaluering av maskinlæringsbasert deteksjon av RF-forstyrrelser ({ "13494" }) er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet, noe som fanger opp transkripsjons- og koeffisientfeil, men ikke er en ekstern uavhengig referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Familieside: <a1>Jamming, spoofing og spekteret</a1>

seg-6cf4bb2d7f7a = Temaside: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Forrige</s1>hybrid

seg-1e68310f2dc6 = <s1>Neste</s1>inertial
