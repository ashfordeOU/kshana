# docs--bench: translations (et)

# text
seg-5aa5efd6b7da = AUC

# text
# c1: docs/BENCH.md
seg-5fcf52aba837 = Allikas: <c1/>

# text
# c1: bench/SPEC.md
# c2: bench/LICENCES.md
# c3: xval/bench/PREREGISTRATION.md
# c4: PREREGISTRATION-v2.md
# c5: xval/bench/RESULTS-v2.md
seg-d3c3517e3bb2 = Avatud ülesannete, jaotuste ja mõõdikute kogum GNSS-i häirete tuvastamiseks ja aja holdover-iks. Spetsifikatsioon on <a1><c1/></a1> (versioon { "2.0.0" }; teksti ja manifestide litsents: CC-BY-4.0 / CC0 pakutud, omaniku otsus ootel). Andmestiku litsentsi ülevaatus on <a2><c2/></a2>. Lähtetasemete (baselines) läved fikseeriti enne esimest hinnatud käivitust dokumendis <a3><c3/></a3> ja versiooni { "2.0.0" } puhul dokumendis <a4><c4/></a4> ning nende tulemused on dokumendis <a5><c5/></a5>.

# text
# c1: agc_k_sigma
seg-6c455061baac = Seal registreeritud otsused: hindaja läved, C1 kuni C3 ja D2 on täidetud; <b>A2 on NOT MET</b> (<c1/> AUC { "0.766" } nõutud vähemalt { "0.80" } vastu testijaotusel), <b>D1 on NOT MET</b> (suurim lõhe { "0.0301" }) ja <b>ülesande (b) R1 on NOT MET</b> (üle võetud, mitte uuesti käivitatud). Ühtegi lävendit ei leevendata.

# text
seg-ebe1c987bc7c = Mis see on: viis võrrelda meetodeid samadel andmetel sama mõõdikukoodiga. Mis see ei ole: toodete pingerida, heakskiit ega tõend, et meetod töötab väljal. Iga skoor on MODELLED ning skoor kirjeldab logi või korpust, mitte kunagi toodet. Kshana tulemused on nõuandvad.

# attr:alt
seg-874effe5ee80 = Kshana-bench ülesande D (optimismilõhe) sisseehitatud lähtetasemed (baselines) testijaotusel, mootori v{ $version } tegelikust käivitusest (`kshana bench baseline`). Iga lävendipaar on ROC-kõvera alune pindala jaotusesiseste ja nihutatud juhtumite puhul; nende vaheline lõhe on optimismilõhe, mille tolerants on { "0.05" }. fused-max-z: { "0.998" } ja { "0.983" } (lõhe { "0.015" }); sqm-imbalance: { "0.882" } ja { "0.882" } (lõhe { "0.001" }); agc-excess: { "0.848" } ja { "0.819" } (lõhe { "0.030" }); raim-parity: { "0.682" } ja { "0.672" } (lõhe { "0.010" }); energy-cn0-drop: { "0.595" } ja { "0.565" } (lõhe { "0.030" }). Sildid on sünteetilise korpuse generatiivse mudeli sildid, mitte kunagi väljaandmed: MODELLED. Nõuandev: modelleeritud või mõõdetud nimetatud etalonide suhtes; see ei ole heakskiit, sertifitseerimine ega standardi järgimise kinnitus. Skoor kirjeldab logi või korpust, mitte kunagi toodet.

# text
seg-6ce7bd4525d6 = Ülesanded

# text
seg-09907c94f04d = Ülesanne

# text
seg-1c6199627b90 = Andmed

# text
seg-9cdfe78e3b22 = Peamõõdik

# text
seg-5093217f24a1 = (a) tuvastamine vastuvõtja logidel

# text
seg-809068c95ddf = üks JammerTest { "2024" } logi epohh

# text
# c1: scripts/fetch_jammertest2024.sh
seg-f87dda92fbd2 = laaditakse skriptiga <c1/> (GPL-3.0+, ei kopeerita kunagi hoidlasse)

# text
seg-9493bfc5bd64 = (b) tuvastamine IQ-andmetel

# text
seg-8d012e25aa62 = stseeni üks hinnatud aken

# text
seg-69f020ed20da = Kshana sünteetilise stseeni retsept; TEXBAT ainult viitena

# text
seg-499ae444224e = AUC häireliigi kohta

# text
seg-73028caefeb0 = (c) aja holdover-i prognoos

# text
seg-0d0b071690cf = (satelliit, lähtepunkt)

# text
seg-6cf42152f523 = IGS-i kellad sammuga { "300" } s (sissekantud väljavõte, kinnitatud räsi)

# text
seg-74bd23dfebf5 = RMSE hetkel { "3600" } s

# text
seg-3cc3545250e5 = (d) jaotusevälise optimismi lõhe

# text
seg-ab343a29b019 = üks sünteetiline juhtum

# text
# c1: impairment-eval
seg-b25d781ff536 = <c1/> korpus, jaotuse sees ja väljaspool

# text
seg-e32f49d34f7b = AUC väljund ja lõhe

# text
seg-1ad563733f12 = Käsud

# text
# c1: kshana-bench-predictions/1
# c2: scores
# c3: predictions
# c4: kshana-bench-result/1
seg-c9d00ff2e1d0 = Esitus on fail (<c1/>): ülesannete a, b ja d puhul <c2/> (üks arv juhtumi id kohta; kõrgem tähendab suurema tõenäosusega häiritud) või ülesande c puhul <c3/> (faasimuutus ns-des iga horisondi juures). Tulemusfail (<c4/>) nimetab spetsifikatsiooni versiooni, jaotuse, tõe ja prognooside SHA-256 ning mõõdikud. Erinevate spetsifikatsiooni suurversioonide tulemusi ei panda kunagi ühte tabelisse.

# text
seg-bdc715c52ab5 = Ausad piirangud

# text
# c1: bench/holdout/COMMITMENTS.json
seg-f26f0e79f2ed = Päris andmetega suletud komplektid (holdout) (a ja c) on avalikud, sest igaüks saab andmed alla laadida. Need kaitsevad jaotuse valimise eest pärast skooride nägemist, mitte nende kaustade häälestamise eest. Ülesande (d) suletud komplekt (holdout) on kinnita-ja-avalda: omanik kinnitab failis <c1/> ainult räsi ja hoiab algväärtust (seed) (veel ühtegi pole suletud).

# text
# c1: kshana jammertest score
seg-81c3f961230b = Ülesande (a) tõde on sündmuslogide ajastatud ründeaknad ühe minuti eraldusvõimega, mistõttu tuvastamise tõenäosus on alumine tõke; sündmusetaseme mõõdikud (latentsus, tuvastamata häired, valehäired) saabuvad Jammertesti hindajaga failis <c1/>.

# text
# c1: docs/design/DETECTION-ROC.md
seg-47df52b5c5e6 = Ülesande (b) IQ-lähtetase on üle võetud failist <c1/>, mitte v1 jaoks uuesti käivitatud.

# text
seg-d54342791763 = Ülesande (d) korpus on eraldatavuse ja konveieri kontroll; selle AUC on AUC mudelist tuletatud siltide üle.

# text
seg-3d8bfdeead6c = <s1>Eelmine</s1>Häirevaatluskeskus: tulemused

# text
seg-07f5b51844d1 = <s1>Järgmine</s1>Vastuvõtja käitamine stsenaariumi vastu
