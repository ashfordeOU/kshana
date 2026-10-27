# docs--kind-impairment-eval: translations (da)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-2e6b437f3e99 = Kilde: <c1/>

seg-134407946837 = <c1/> (scenarietype)

seg-304496607bd7 = Scenarietype i motoren v{ $version }, familie <a1>Jamming, spoofing og spektret</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-98e740d32860 = Testbed til evaluering af maskinlæringsbaseret detektion af RF-forstyrrelser ({ "13494" }): generér et mærket, parameterforankret SYNTETISK korpus (nominal/jamming/spoof-time/spoof-position/multipath), bedøm en detektor (energy|agc|sqm|parity|fused) med den detektoruafhængige harness, og rapportér AUC/ROC/forvekslingsmatrix + Pd pr. klasse ved en mål-Pfa samt optimismegabet mellem fordeling inden for og uden for træning. Kun MODELLED driftskarakteristika, aldrig felt/IQ, ingen dom om god/dårlig.

seg-41c3f9559282 = Én kørsel af <c1/> opsummeres sådan: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Eksemplet <c1/> angiver blandt andet:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out bruger en mere subtil out-of-tuning-reg

seg-667d26b3a2fe = Resultatmærkat (motorens): MODELLED, syntetisk parameterforankret korpus (aldrig felt/IQ); kun driftskarakteristika, ingen dom om god/dårlig

seg-7e7b07bc5545 = Diagrammet, som motoren skriver for scenarios/impairment-eval.toml, scenarietype impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, uafgjorte ½), forvekslingsmatrix ved tærskel, P_d/P_md/P_fa/præcision/nøjagtighed/F1 Tests: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + bootstrap-CI, der adskiller reelle mærkede anomalier; gennemsigtig detektor (gengiver mærkater) Tests: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Mærket syntetisk korpus af forstyrrelser + detektoruafhængig ROC/AUC/forvekslingsmatrix/Pfa-Pmd-harness; lækagebeskyttelse, stratificeret opdeling, optimismerapport for fordelingsskift (inden for mod uden for regimet).

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, uafgjorte ½), forvekslingsmatrix ved tærskel, P_d/P_md/P_fa/præcision/nøjagtighed/F1. Uafhængig reference (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }), uafhængigt bibliotek, præcis overensstemmelse

seg-c719d4060e1a = <b>MODELLED</b> Mærket syntetisk korpus af forstyrrelser + detektoruafhængig ROC/AUC/forvekslingsmatrix/Pfa-Pmd-harness; lækagebeskyttelse, stratificeret opdeling, optimismerapport for fordelingsskift (inden for mod uden for r. Uafhængig reference (InternalConsistency): Lukkede AUC-grænser (Mann–Whitney) + en detektor med perfekt reference; korpusset er SYNTETISK (parameterforankret, ikke felt/IQ)

seg-5565108cc4d1 = MODELLED, syntetisk parameterforankret korpus (aldrig felt/IQ); kun driftskarakteristika, ingen dom om god/dårlig (resultat <c1/>)

seg-d2a9f35ea8cc = MODELLED kun driftskarakteristika, aldrig felt/IQ, ingen dom om god/dårlig. (typekatalog (<c1/>))

seg-376f86fbdcb7 = ÆRLIGT OMFANG: kun MODELLED driftskarakteristika. Korpusset er syntetisk og parameterforankret (sammensat af Kshanas modeller for jamming/AGC/SQM/parity), aldrig feltoptagelser eller rå IQ. Harnessen er en dommer; den rapporterer karakteristika, den afsiger ikke en dom om god/dårlig. Kør: kshana scenarios/impairment-eval.toml (kommentar i scenariefilen, linje { "9" } til { "12" })

seg-882d67b9474f = Evaluering af maskinlæringsbaseret detektion af RF-forstyrrelser ({ "13494" }) er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Familieside: <a1>Jamming, spoofing og spektret</a1>

seg-6cf4bb2d7f7a = Emneside: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Forrige</s1>hybrid

seg-1e68310f2dc6 = <s1>Næste</s1>inertial
