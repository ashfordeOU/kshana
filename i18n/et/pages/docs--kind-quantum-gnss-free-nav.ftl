# docs--kind-quantum-gnss-free-nav: translations (et)

# text
seg-619127334cf3 = Ükski maatriksirida ei nimeta seda liiki nimepidi; selle tulemuse silt on mootori enda, ülal.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-195347c63a8a = m/s^{ "2" }

# text
seg-451a304052c4 = <b>MODELLED</b> Külmaatomi interferomeetri akseleromeeter esimestest printsiipidest (k_eff·T², QPN). Oraakel (sõltumatu etalon) (ExternalDataset): Avaldatud CAI esmaartiklite arvvektorid (Cheineti { "2008" } ülekandefunktsioon; Petersi/Freieri tundlikkus): k_eff·T² ühtib täpselt, footonimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (päris seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Vahemik, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), tulemus (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. vastu.

# text
seg-9955b1b1c018 = Kvantinertsiaalsensori toimivus on MODELLED, mitte valideeritud: alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
seg-496b17a8d3b9 = Teemaleht: <a1>QUANTUM-MODELS.md</a1>

# text
seg-753f0302eeef = Teemaleht: <a1>QUANTUM.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Ei paku — ainult toimivusmudelid; külmaatomi/kella riistvara on partneri oma. Oraakel (sõltumatu etalon) (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-f44afe581836 = { $version }

# text
seg-c37642bb24fe = <b>MODELLED</b> Üks reprodutseeritav TradeEvidence objekt (fikseeritud raam: scenario+seed+engine; ühised kvant-vs-klassikalised väärtused FoM-i kohta polaarsuse poolest õige kasuga, valikuline { "95" }%. Oraakel (sisemine kooskõla; InternalConsistency): kinnise kuju kasu/võitja samasused + olemasoleva quantum_trade::TradeResult'i truu ümbris; ausus seotud esinduslikkuse registri ja kontrollisiltidega

# text
seg-eb75c6a4dcec = Kvant-vs-klassikaline kompromissitõend (ühine kuju) on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
# c1: docs/kinds/by-kind/quantum-gnss-free-nav.md
seg-bfbcc7e8f620 = Allikas: <c1/>

# text
# c1: quantum-gnss-free-nav
seg-cfa59601df4a = <c1/> (stsenaariumi liik)

# text
seg-790fbfdd80f0 = MODELLED GNSS-ita kvantnavigatsioon: GNSS-i katkestuse ajal kvant- (külmaatomi interferomeeter) inertsiaalne eelarve vs klassikaline navigatsioonitaseme INS — asukohavea kasv libisemisperioodi jooksul, holdover asukohalävendini ja kvant-vs-klassikaline kompromiss ausa TradeEvidence'ina koos esinduslikkusega. Aus jälgitavuse märkus: välise määranguta ei ole kiirendusmõõturi nihe jälgitav, mistõttu viga kasvab; kvantandur aeglustab seda, kuid ei sulge lõhet. Illustratiivsed avaliku allika seadme parameetrid; mudeldab klassi, TRL-i/lennutõendit/sertifitseerimist ei ole.

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-dd74f248373d = Ühe <c1/> käivituse kokkuvõte: quantum-gnss-free-nav | katkestus 300s | kvant asukohaviga { "0.00" } m vs klassikaline { "37.31" } m (8289.5x) | holdover kvant 44721s vs klassikaline 534s (lävi { "100" } m) | kompromiss kvant võidab 2/2 | MODELLED

# text
# c1: outage_s
# c2: threshold_m
# c3: quantum_bias_m_s2
# c4: classical_bias_m_s2
seg-960491d74173 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-gnss-free-nav.toml
seg-88d9dfe0353a = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-1bdbf1a737b2 = Diagramm, mille mootor kirjutab failile scenarios/quantum-gnss-free-nav.toml, liik quantum-gnss-free-nav

# text
seg-d196391dcf4f = <b>MODELLED</b> Kvant- (külmaatomi interferomeeter) vs klassikaline navigatsioonitaseme INS-i arvestusnavigatsioon GNSS-i katkestuse ajal: asukohavea kasv, holdover asukohalävendini,. Oraakel (sisemine kooskõla; InternalConsistency): taaskasutatud inertsiaalsed eelarved ristkontrollitud sõltumatu Octave'i kahekordse integreerimisega samast arvestusnavigatsiooni ODE-st (erinev käitusaeg, ühine mudel → ReferenceImpl) ning avaldatud Freier-2016 lühiajalise müraga ühepoolse ankruna; kvant-vs-klassikaline liitnäitaja jääb MODELLED

# text
# c1: kshana kinds --json
seg-af35cccc4e2c = MODELLED GNSS-ita kvantnavigatsioon: GNSS-i katkestuse ajal kvant- (külmaatomi interferomeeter) inertsiaalne eelarve vs klassikaline navigatsioonitaseme INS — asukohavea kasv libisemisperioodi jooksul, holdover asukohalävendini ja kvant-vs-klassikaline kompromiss ausa TradeEvidence'ina koos esinduslikkusega. (liikide kataloog (<c1/>))

# text
seg-9b9ce7600ffc = GNSS-ita kvantnavigatsioon — kvant- (külmaatomi interferomeeter) vs klassikaline navigatsioonitaseme INS-i arvestusnavigatsioon GNSS-i katkestuse ajal. MODELLED; illustratiivsed, avaliku allika seadme parameetrid; mudeldab klassi, TRL-i/lennuväidet ei ole. (stsenaariumifaili kommentaar, read { "1" }–{ "3" })

# text
seg-9d67411151e3 = GNSS-ita kvantnavigatsioon on MODELLED, mitte valideeritud: kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e1d502e1ed6d = <s1>Eelmine</s1>quantum-anomaly-detect

# text
seg-1f3705925b3c = <s1>Järgmine</s1>quantum-time-transfer
