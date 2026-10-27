# docs--kind-quantum-trade: translations (et)

# text
seg-debc2f07db78 = true

# text
seg-98151954f217 = false

# text
seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
seg-7b2721b7588d = Mootori v{ $version } stsenaariumi liik, perekond <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f7f12029e0ec = Perekonna leht: <a1>Inertsiaal-, liitmis- ja kvantsensorid</a1>

# text
seg-496b17a8d3b9 = Teemaleht: <a1>QUANTUM-MODELS.md</a1>

# text
seg-bb07c8ee153f = <b>PARTNER</b> Ei paku — ainult toimivusmudelid; külmaatomi/kella riistvara on partneri oma. Sõltumatu etalon (NoneKind): puudub: partneri vastutusala, kujundatud nii, et mooduli ega testi ei ole

# text
seg-51cac2f918e0 = Teemaleht: <a1>POSITIONING.md</a1>

# text
# c1: docs/kinds/by-kind/quantum-trade.md
seg-3a8c76a2396f = Allikas: <c1/>

# text
# c1: quantum-trade
seg-f9af2813532e = <c1/> (stsenaariumi liik)

# text
# c1: candidate_adev_taus
# c2: candidate_adev_values
# c3: candidate_clock_class
seg-eb55d253dd11 = Kvant-vs-klassikaline PNT kompromiss ({ "13503" }): kandidaatkella ajastuse-holdover-i + inertsiaalse holdover-i kasu (mõõdetud ADEV kõver — kaitstavuse hingedetail — või kvantkella klass) vs klassikaline lähteklass, kusjuures pika tau põhjataseme eelduse hoiatus kantakse artefaktil kaasa, pluss GNSS-ita vastupidavuse-ajas ümbris. MODELLED; kvantifitseerib (mitte kunagi ei valideeri) partneri seadet. Kandidaatkell on mõõdetud kõver (<c1/> + <c2/>, võrdse pikkusega, vähemalt { "2" } punkti; mõlema vormi andmisel see võidab) või <c3/>.

# text
# c1: scenarios/quantum-trade.toml
seg-4f470bc1d82c = Ühe <c1/> käivituse kokkuvõte: quantum-trade | kandidaat mõõdetud ADEV | ajastuse holdover 2621947s vs 203s (12943.62x) | inertsiaalne 14108s vs 378s (37.34x) | vastupidavuse libisemine 14108s | MODELLED [põhjataseme-eelduse hoiatus]

# text
# c1: timing_threshold_s
# c2: position_threshold_m
# c3: baseline_clock_class
# c4: candidate_adev_taus+candidate_adev_values|candidate_clock_class
seg-2639560aeff2 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: baseline_ins
# c2: candidate_ins
# c3: resilience_times_s
# c4: alt_pnt_bound_m
seg-d66f1ef84201 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/quantum-trade.toml
seg-f2cc0830b53f = Näide <c1/> määrab muu hulgas:

# text
seg-ee5bcbbe0167 = csac

# text
seg-a6551a61cf69 = klassikaline lähtetase

# text
seg-f5fa445702c6 = Tulemuse silt (mootori oma): MODELLED — kvantifitseerib (mitte kunagi ei valideeri) partneri kella/andurit; lennul demonstreerimata

# attr:alt
seg-c74c63ffd859 = Diagramm, mille mootor kirjutab failile scenarios/quantum-trade.toml, liik quantum-trade

# text
seg-93310aaa6ead = <b>VALIDATED</b> Astmeseaduse (valge FM + punase müra põhjatase) NNLS-taastamine avaldatud mõõdetud ⁸⁸Sr optilise kellaülemineku Alani hälbest — reprodutseerib σ_y(τ) ja peamise 4.7e-16/√τ lühikese τ skaleerumise tegeliku mõõdetud pika τ põhjatasemega, mitte Testid: <a1>optical_clock_adev_reference.rs</a1>.

# text
seg-fc46e95688ba = <b>VALIDATED</b> Mõõdetud ADEV NNLS-sobitus, NEES/NIS χ² kooskõlavahemikud ja kella van-Loani diskreetse protsessimüra (holdover-libisemise) kovariatsioon — kompromissimootori arvutuslik selgroog Testid: <a1>scipy_reference.rs</a1>.

# text
seg-6e2b62136cef = <b>MODELLED</b> Mõõdetud ADEV sisestus (NNLS), kompromissitabel (ajastuse/inertsiaalne holdover + kasu), vastupidavuse-ajas ümbris; põhjataseme hoiatus kantakse artefaktil kaasa.

# text
seg-b577b8464cf7 = <b>VALIDATED</b> Mõõdetud ADEV NNLS-sobitus, NEES/NIS χ² kooskõlavahemikud ja kella van-Loani diskreetse protsessimüra (holdover-libisemise) kovariatsioon — kompromissimootori arvutuslik. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q täpne, χ² <{ "5e-4" } töö vabadusastmetel. Ainult tuumad — seadme jõudlusnumbrid jäävad modelleeritud tasemele (järgmine rida)

# text
seg-6b8aa8cd6d3e = <b>MODELLED</b> Mõõdetud ADEV sisestus (NNLS), kompromissitabel (ajastuse/inertsiaalne holdover + kasu), vastupidavuse-ajas ümbris; põhjataseme hoiatus kantakse artefaktil kaasa. Käivitatav alates. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): mõõdetud ADEV→PSD sobituse (NNLS) tuum ühtib scipy.optimize.nnls-iga (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — sõltumatu väline tuum; kuid kompromissi ARVUD kvantifitseerivad (mitte kunagi ei valideeri) partneri kella/CAI-d, mistõttu kompromiss ise jääb MODELLED, ilma valideerimise sära

# text
# c1: label
seg-3d678f64e41c = MODELLED — kvantifitseerib (mitte kunagi ei valideeri) partneri kella/andurit; lennul demonstreerimata (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-20ba66ae9518 = Kvant-vs-klassikaline PNT kompromiss ({ "13503" }): kandidaatkella ajastuse-holdover-i + inertsiaalse holdover-i kasu (mõõdetud ADEV kõver — kaitstavuse hingedetail — või kvantkella klass) vs klassikaline lähteklass, kusjuures pika tau põhjataseme eelduse hoiatus kantakse artefaktil kaasa, pluss GNSS-ita vastupidavuse-ajas ümbris. (liikide kataloog (<c1/>))

# text
# c1: kshana kinds --json
seg-45a1d84eef18 = MODELLED; kvantifitseerib (mitte kunagi ei valideeri) partneri seadet. (liikide kataloog (<c1/>))

# text
seg-15275d27252a = Arvutab ajastuse-holdover-i ja inertsiaalse holdover-i kasu KANDIDAATkellale KLASSIKALISE lähtetaseme ees, pluss GNSS-ita vastupidavuse-ajas ümbrise. Kandidaadi põhjataseme määrab partneri kella MEASURED kattuv ADEV kõver (kaitstavuse hingedetail), mis on sobitatud mittenegatiivsete vähimruutudega — seega põhineb holdover-i eelarve tegelikel andmetel, mitte eeldatud pika tau põhjatasemel. (stsenaariumifaili kommentaar, read { "3" }–{ "7" })

# text
seg-ecbdbc9b163e = AUS ULATUS: MODELLED — see KVANTIFITSEERIB partneri kvantkella kasu; see EI valideeri seadet ega laena kunagi SGP4/Alani/IGS-i valideerimissaari. Kui mis tahes rea põhjatase on eeldatud klassi vaikeväärtus, kuvatakse artefaktil põhjataseme hoiatus. Käivitamine: kshana scenarios/quantum-trade.toml (stsenaariumifaili kommentaar, read { "9" }–{ "12" })

# text
seg-4b59ac409819 = Kvant-vs-klassikaline PNT kompromiss ja GNSS-ita vastupidavus ({ "13503" }) on MODELLED, mitte valideeritud: alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-e6498fae3ba7 = <s1>Eelmine</s1>quantum-time-transfer

# text
seg-50d4bbb7486b = <s1>Järgmine</s1>realtime-frame-eop
