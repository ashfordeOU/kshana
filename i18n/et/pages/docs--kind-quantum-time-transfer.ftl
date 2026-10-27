# docs--kind-quantum-time-transfer: translations (et)

# text
seg-f42465f7d066 = ns

# text
seg-37d16b499bc5 = dB

# text
seg-c61e88721556 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kellad, ajastus ja holdover</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-849c08d3ce70 = Perekonna leht: <a1>Kellad, ajastus ja holdover</a1>

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-a3697ad561db = Hz

# text
seg-496b17a8d3b9 = Teemaleht: <a1>QUANTUM-MODELS.md</a1>

# text
seg-a1810bbca337 = <b>MODELLED</b> Kahesuunaline/TWSTFT (Sagnac), GNSS common-view, PPP; lingi värin→vahemaa. Oraakel (sõltumatu etalon) (ExternalDataset): Sagnaci suurust kontrollitakse autoriteetse AVALDATUD VÄÄRTUSE vastu — N. Ashby, „Relativity in the GPS“, Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), valem { "1.29" }: idasuunaline ekvatoriaalne ümbermaailmareis kogub { "207.4" } ns (2ωA_E/c²); kshana reprodutseerib { "207.386" } ns. Sõltumatult kinnitatud RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), mis kannab sama 2Aω/c² geomeetriat. Komposiitne BIPM TWSTFT transponder/common-view/

# text
seg-a8beb8dfc757 = Aja edastamise veaeelarve koostamine on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-bb07c8ee153f = <b>PARTNER</b> Ei paku — ainult toimivusmudelid; külmaatomi/kella riistvara on partneri oma. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Üks reprodutseeritav TradeEvidence objekt (fikseeritud raam: scenario+seed+engine; ühised kvant-vs-klassikalised väärtused FoM-i kohta polaarsuse poolest õige kasuga, valikuline { "95" }%. Oraakel (sisemine kooskõla; InternalConsistency): kinnise kuju kasu/võitja samasused + olemasoleva quantum_trade::TradeResult'i truu ümbris; ausus seotud esinduslikkuse registri ja kontrollisiltidega

# text
seg-eb75c6a4dcec = Kvant-vs-klassikaline kompromissitõend (ühine kuju) on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-time-transfer.md
seg-eee91dc5741d = Allikas: <c1/>

# text
# c1: quantum-time-transfer
seg-05060df7f0b7 = <c1/> (stsenaariumi liik)

# text
seg-540545e6f846 = MODELLED usaldusväärse kvantajastuse ahel: otsast lõpuni kvant- (optilise võrega kell + põimumise/üksikfootoni link) vs klassikaline (CSAC + RF kahesuunaline) aja edastamise eelarve, taaskasutatud ajastuse kaitsetase + viivitus-/kordusründe turvalisuse FoM (1-P_md), kella anomaalia tuvastamise tõenäosus + CUSUM-i latentsus ning kvant-vs-klassikaline kompromiss ausa TradeEvidence'ina koos esinduslikkuse + lennuvalmiduse lünkade kirjega. Illustratiivsed avaliku allika seadme/lingi parameetrid; mudeldab klassi, TRL-i/lennutõendit/sertifitseerimist ei väideta.

# text
# c1: scenarios/quantum-time-transfer.toml
seg-ed79bfe80fe7 = Ühe <c1/> käivituse kokkuvõte: quantum-time-transfer | kvantahel 1.233e-12s vs klassikaline 5.292e-9s | PL { "555.24" } ns | turvalisus Pd { "1.000" } (Pfa { "1e-3" }) | anomaalia Pd { "0.761" } | kompromiss kvant võidab 2/2 | MODELLED

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-80e94491c3df = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

# text
# c1: scenarios/quantum-time-transfer.toml
seg-6b03fa15a60d = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-09760f892c7b = Diagramm, mille mootor kirjutab failile scenarios/quantum-time-transfer.toml, liik quantum-time-transfer

# text
seg-873de4d05663 = <b>VALIDATED</b> Tabelaarse CUSUM-i detektori halvima juhu tuvastuslatentsus (⌊h/(z−k)⌋+{ "1" }) ja kontrolli alt väljas keskmine jooksupikkus, mida kasutavad ajastuse kaitsetaseme ja spuufimise monitorid. Oraakel (sõltumatu etalon; ExternalDataset): avaldatud tabelaarne CUSUM ARL: Siegmundi ({ "1985" }) Browni liikumise lähend (Hawkins & Olwell { "1998" }, valem { "3.7" }) ristankurdatud Montgomery teose Introduction to Statistical Quality Control (Wiley) ARL-tabelitega, k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministlik latentsus ühtib täpselt esmakordse läbimise etaloniga. Koostatud TPL-i piir jääb MODELLED

# text
# c1: kshana kinds --json
seg-b51e62b8dc63 = MODELLED usaldusväärse kvantajastuse ahel: otsast lõpuni kvant- (optilise võrega kell + põimumise/üksikfootoni link) vs klassikaline (CSAC + RF kahesuunaline) aja edastamise eelarve, taaskasutatud ajastuse kaitsetase + viivitus-/kordusründe turvalisuse FoM (1-P_md), kella anomaalia tuvastamise tõenäosus + CUSUM-i latentsus ning kvant-vs-klassikaline kompromiss ausa TradeEvidence'ina koos esinduslikkuse + lennuvalmiduse lünkade kirjega. (liikide kataloog (<c1/>))

# text
seg-dee0faf63e7f = Usaldusväärne kvantajastus — otsast lõpuni aja edastamise ahel, turvaline levitamine, anomaaliate tuvastamine ja kvant-vs-klassikaline kompromiss. MODELLED; illustratiivsed, avaliku allika seadme/lingi parameetrid; mudeldab klassi, TRL-i/lennuväidet ei ole. (stsenaariumifaili kommentaar, read { "1" }–{ "3" })

# text
seg-6e9f5dfca6b0 = Usaldusväärne kvantajastus (aja edastamine + turvaline levitamine + anomaalia) on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-d3665be74ff1 = <s1>Eelmine</s1>quantum-gnss-free-nav

# text
seg-0d4b1f97541f = <s1>Järgmine</s1>quantum-trade
