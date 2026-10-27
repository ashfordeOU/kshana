# docs--kind-quantum-anomaly-detect: translations (et)

# text
seg-29e58493fdd4 = Modelleeritud

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
seg-496b17a8d3b9 = Teemaleht: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Ei paku — ainult toimivusmudelid; külmaatomi/kella riistvara on partneri oma. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
# c1: docs/kinds/by-kind/quantum-anomaly-detect.md
seg-836d5102f0d1 = Allikas: <c1/>

# text
# c1: quantum-anomaly-detect
seg-ad4ce0110e8d = <c1/> (stsenaariumi liik)

# text
seg-04310cd6cbec = MODELLED rikete/anomaaliate tuvastamine kvant-PNT-süsteemides: sildistatud rikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; anduri nihkeastang/väljalangemine), tuvastusstatistiku ROC AUC (bootstrap-usaldusvahemikuga väliselt valideeritud eval_stats-ist) ja minimaalne tuvastatav rike fikseeritud valehäire määra juures, kusjuures kvantkellaga toetatud monitor (väiksema müraga) tuvastab väiksemaid rikkeid — ausa TradeEvidence'ina + esinduslikkusena. Gaussi tuvastusstatistiku mudel (AUC = Phi(mu/(sigma*sqrt2))); mudeldab klassi, illustratiivsed avaliku allika parameetrid, TRL-i/lennutõendit/sertifitseerimist ei ole.

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-442310afbb13 = Ühe <c1/> käivituse kokkuvõte: quantum-anomaly-detect | AUC kvant { "0.9908" } vs klassikaline { "0.7603" } | minimaalne tuvastatav rike kvant { "1.312" } vs klassikaline { "4.372" } | { "5" } rikkeklassi | kompromiss kvant võidab 2/2 | MODELLED

# text
# c1: fault_mu
# c2: quantum_sigma
# c3: classical_sigma
# c4: pfa
# c5: pd
# c6: samples
# c7: seed
seg-335b8d87e27d = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-anomaly-detect.toml
seg-c2b10c0bdaf8 = Näide <c1/> määrab muu hulgas:

# text
seg-f44afe581836 = { $version }

# text
seg-25da07e56aa8 = kvant- vs klassikalise PNT anomaaliate tuvastami

# attr:alt
seg-2f1d14239d1a = Diagramm, mille mootor kirjutab failile scenarios/quantum-anomaly-detect.toml, liik quantum-anomaly-detect

# text
seg-af9aaf95d4f8 = <b>VALIDATED</b> Analüütiline binormaalne ROC AUC = Φ(μ/(σ√{ "2" })) ja minimaalne tuvastatav rike σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), mis on kvantrikete ja anomaaliatuvastite aluseks. Oraakel (sõltumatu etalon; ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), mõlemad BSD-3-Clause — sõltumatud teegid, mis arvutavad samu üheselt määratletud Gaussi saba / AUC suurusi, ühtivad A&S-erf põhjatasemeni (~{ "7e-8" }). Selle peale ehitatud kvant-vs-klassikaline eelis jääb MODELLED

# text
seg-c37642bb24fe = <b>MODELLED</b> Üks reprodutseeritav TradeEvidence objekt (fikseeritud raam: scenario+seed+engine; ühised kvant-vs-klassikalised väärtused FoM-i kohta polaarsuse poolest õige kasuga, valikuline { "95" }%. Oraakel (sisemine kooskõla; InternalConsistency): kinnise kuju kasu/võitja samasused + olemasoleva quantum_trade::TradeResult'i truu ümbris; ausus seotud esinduslikkuse registri ja kontrollisiltidega

# text
seg-b854cedc8a51 = <b>MODELLED</b> Sildistatud kvantrikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; anduri nihkeastang/väljalangemine), tuvastusstatistiku ROC AUC bootstrap-usaldusvahemikuga ja minimaalne . Oraakel (sisemine kooskõla; InternalConsistency): kinnise kuju Gaussi AUC = Phi(mu/(sigma*sqrt2)) ristkontrollitud väliselt valideeritud eval_stats::bootstrap_auc_ci vastu (vs scikit-learn) + tuvastuse analüütilised läved

# text
# c1: kshana kinds --json
seg-7b465c2bb7cf = MODELLED rikete/anomaaliate tuvastamine kvant-PNT-süsteemides: sildistatud rikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; anduri nihkeastang/väljalangemine), tuvastusstatistiku ROC AUC (bootstrap-usaldusvahemikuga väliselt valideeritud eval_stats-ist) ja minimaalne tuvastatav rike fikseeritud valehäire määra juures, kusjuures kvantkellaga toetatud monitor (väiksema müraga) tuvastab väiksemaid rikkeid — ausa TradeEvidence'ina + esindus (liikide kataloog (<c1/>))

# text
seg-7f43972b246d = Rikete/anomaaliate tuvastamine kvant-PNT-süsteemides — sildistatud rikete kataloog + ROC AUC + minimaalne tuvastatav rike, kvantkellaga toetatud vs klassikaline monitor. MODELLED; illustratiivsed avaliku allika parameetrid; mudeldab klassi, TRL-i/lennuväidet ei ole. (stsenaariumifaili kommentaar, read { "1" }–{ "3" })

# text
seg-eb75c6a4dcec = Kvant-vs-klassikaline kompromissitõend (ühine kuju) on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-3f92aec2b92a = Rikete/anomaaliate tuvastamine kvant-PNT-süsteemides on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-6524a69e4835 = <s1>Eelmine</s1>pvt

# text
seg-aa689568cf84 = <s1>Järgmine</s1>quantum-gnss-free-nav
