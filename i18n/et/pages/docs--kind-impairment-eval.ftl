# docs--kind-impairment-eval: translations (et)

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
# c1: docs/kinds/by-kind/impairment-eval.md
seg-2e6b437f3e99 = Allikas: <c1/>

# text
# c1: impairment-eval
seg-134407946837 = <c1/> (stsenaariumi liik)

# text
seg-304496607bd7 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Segamine, spuufimine ja spekter</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-98e740d32860 = Masinõppel põhineva RF-häirete tuvastamise hindamise katsestend ({ "13494" }): genereeri märgendatud, parameetritest lähtuv SÜNTEETILINE korpus (nominaalne/segamine/spuufimine-aeg/spuufimine-positsioon/mitmeteelevi), hinda detektorit (energy|agc|sqm|parity|fused) detektorist sõltumatu raamistikuga ning anna aru AUC/ROC/segadusmaatriks + klassikohane Pd sihtmärgi Pfa juures, pluss jaotusesisese ja jaotusevälise optimismilõhe. Ainult MODELLED tööomadused — mitte kunagi väli-/IQ-andmed, head/halba otsust ei ole.

# text
# c1: scenarios/impairment-eval.toml
seg-41c3f9559282 = Ühe <c1/> jooksu kokkuvõte: impairment-eval | detektor fused(max-z) | AUC { "0.998" } sees / { "0.981" } väljas (lõhe { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ sihtmärk { "0.05" } | { "1000" } juhtu | MODELLED sünteetiline

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-9b0d7ebaa1f0 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

# text
# c1: scenarios/impairment-eval.toml
seg-283510d17885 = Näide <c1/> määrab muu hulgas:

# text
seg-6a64be3b3f07 = fused

# text
seg-3db71c5bdd0a = auc_out kasutab peenemat häälestusvälist reg

# text
seg-667d26b3a2fe = Tulemuse silt (mootori oma): MODELLED — sünteetiline parameetritest lähtuv korpus (mitte kunagi väli-/IQ-andmed); ainult tööomadused, head/halba otsust ei ole

# attr:alt
seg-7e7b07bc5545 = Diagramm, mille mootor kirjutab failile scenarios/impairment-eval.toml, liik impairment-eval

# text
seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, viigid ½), segadusmaatriks läveväärtusel, P_d/P_md/P_fa/täpsus/korrektsus/F1 Testid: <a1>eval_metrics_reference.rs</a1>.

# text
seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + bootstrap usaldusvahemik, mis eraldab tegelikke märgendatud anomaaliaid; läbipaistev detektor (reprodutseerib märgendeid) Testid: <a1>opssat_ad_reference.rs</a1>.

# text
seg-0ee5b31cfd09 = <b>MODELLED</b> Märgendatud sünteetiline häirekorpus + detektorist sõltumatu ROC/AUC/segadusmaatriksi/Pfa-Pmd raamistik; lekkekaitse, kihiline jaotus, jaotusnihke (režiimisisese vs -välise) optimismiaruanne.

# text
seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, viigid ½), segadusmaatriks läveväärtusel, P_d/P_md/P_fa/täpsus/korrektsus/F1. Sõltumatu etalon (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — sõltumatu teek, täpne vaste

# text
seg-c719d4060e1a = <b>MODELLED</b> Märgendatud sünteetiline häirekorpus + detektorist sõltumatu ROC/AUC/segadusmaatriksi/Pfa-Pmd raamistik; lekkekaitse, kihiline jaotus, jaotusnihke (režiimisisese vs -välise. Sõltumatu etalon (InternalConsistency): Suletud kujul AUC piirid (Mann–Whitney) + täiusliku sõltumatu etaloni detektor; korpus on SÜNTEETILINE (parameetritest lähtuv, mitte väli-/IQ-andmed)

# text
# c1: label
seg-5565108cc4d1 = MODELLED — sünteetiline parameetritest lähtuv korpus (mitte kunagi väli-/IQ-andmed); ainult tööomadused, head/halba otsust ei ole (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-d2a9f35ea8cc = Ainult MODELLED tööomadused — mitte kunagi väli-/IQ-andmed, head/halba otsust ei ole. (liikide kataloog (<c1/>))

# text
seg-376f86fbdcb7 = ÕIGLANE ULATUS: ainult MODELLED tööomadused. Korpus on sünteetiline ja parameetritest lähtuv (koostatud Kshana segamise/AGC/SQM/pariteedi mudelitest) — mitte kunagi väljasalvestused ega toor-IQ. Raamistik on kohtunik; see annab teada omadustest, kuid ei anna head/halba otsust. Käivitus: kshana scenarios/impairment-eval.toml (stsenaariumifaili kommentaar, read { "9" } kuni { "12" })

# text
seg-882d67b9474f = Masinõppel põhineva RF-häirete tuvastamise hindamine ({ "13494" }) on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-5d23d7f8f872 = Perekonna leht: <a1>Segamine, spuufimine ja spekter</a1>

# text
seg-6cf4bb2d7f7a = Teemaleht: <a1>BENCH.md</a1>

# text
seg-dde90de4270b = <s1>Eelmine</s1>hybrid

# text
seg-1e68310f2dc6 = <s1>Järgmine</s1>inertial
