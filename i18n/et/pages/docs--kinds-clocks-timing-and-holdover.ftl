# docs--kinds-clocks-timing-and-holdover: translations (et)

# text
seg-b03d56f501c3 = Liik

# text
seg-78cba87823f7 = Kella holdover võrreldes spetsifikatsiooniga; valikuline Monte Carlo ansambel (jooksud > { "1" }).

# attr:alt
seg-cb0b7da83f5c = Diagramm, mille mootor kirjutab failile scenarios/clock-ensemble.toml, liik clock

# text
seg-c0924aa36e64 = MODELLED ajastussüsteemi holdover-test, hinnatud ajavea kirjest, mille OPERAATOR annab (linuxptp ptp4l, phc2sys või ts2phc logi, chrony jälgimis- või statistikalogi, TICC, TimeLab või RINEX kellalogi või time_s,time_error_ns paarid). Testil on neli sammu ja Kshana ei tee ühtegi neist: lukustatud LÄHTETASE, GNSS EEMALDATUD operaatori poolt (antennikaabel või simulaatori väljund; Kshana ei saada ega juhi midagi) väljaöeldud ajal, HOLDOVER süsteemi enda ostsillaatoril ja TAASTUMINE pärast seda, kui operaator taastab GNSS-i teisel väljaöeldud ajal. Kirje jaotatakse nende kahe aja kohal. Lähtetase: ajavea statistika ja ITU-T maskid, mis on kirjutatud lukustatud kella jaoks. Holdover: statistika, murdosaline sageduse nihe, mida süsteem hoidis (vähimruutude sirge), maskid, mis on kirjutatud holdover-i või autonoomse kella jaoks, ePRTC-A holdover-i ümbrik väljaöeldud lukustatud kestuse põhjal ning aeg, mil iga ajavea eelarve ületatakse. Taastumine: kas ja millal |TE| jõudis väljaöeldud riba sisse ja jäi sinna, tipp ja suurim hüpe. Iga piir on ümber kirjutatud avalikust ITU-T tabelist (telekommunikatsiooni ajastusmaskid); sõnastus on „mõõdetud maski suhtes“ ning need kaks aega on operaatori väide, mitte kontrollitud. Maski jaoks liiga lühike kirje on INCOMPLETE, mitte kunagi ekstrapoleeritud. Vt docs/TIMING-HIL.md.

# attr:alt
seg-8ce93392747b = Diagramm, mille mootor kirjutab failile scenarios/holdover-test-ptp4l.toml, liik holdover-test

# text
seg-540545e6f846 = MODELLED usaldusväärse kvantajastuse ahel: otsast lõpuni kvant- (optilise võrega kell + põimumise/üksikfootoni link) vs klassikaline (CSAC + RF kahesuunaline) aja edastamise eelarve, taaskasutatud ajastuse kaitsetase + viivitus-/kordusründe turvalisuse FoM (1-P_md), kella anomaalia tuvastamise tõenäosus + CUSUM-i latentsus ning kvant-vs-klassikaline kompromiss ausa TradeEvidence'ina koos esinduslikkuse + lennuvalmiduse lünkade kirjega. Illustratiivsed avaliku allika seadme/lingi parameetrid; mudeldab klassi, TRL-i/lennutõendit/sertifitseerimist ei väideta.

# attr:alt
seg-09760f892c7b = Diagramm, mille mootor kirjutab failile scenarios/quantum-time-transfer.toml, liik quantum-time-transfer

# text
seg-1b61962464c5 = Pesa ajastus: sekundid, kuni vabalt töötav kell väljub ajaindekseeritud marsruutimis- või ülesandepesa kaitsevahemikust (suurim absoluutne ajaviga, mida pesa talub), iga liikme panus sel hetkel koos domineeriva liikme nimetamisega (määrangu määramatus, valge faasimüra, valge, flicker-, juhuslikku kõnni ja juhusliku jooksu sagedusmüra, jääksageduse nihe, temperatuur, vananemine), viimasest määrangust järelejäänud aeg ning suurim määrangute intervall, mis hoiab kella sees, määrangu latentsuse võrra vähendatult. Ostsillaator on KLASSI vaikeväärtus (csac, uso, dsac, tcxo, ocxo või rafs: üks viidatud ühesekundiline Alani hälve ja eeldatud punase müra põhjatase), telekommunikatsiooni ajastuse ANDMELEHE EELSEADE või sisseehitatud ANDMELEHT (Alani hälbe maksimumid sobitatud ümbrikuna, pluss vananemine ja temperatuurikoefitsient) või sisseehitatud MEASURED PHASE RECORD (selle kattuv Alani hälve sobitatud kaalutud vähimruutudega valge faasi ja IEEE Std { "1139" } sagedusmodulatsiooni baasis, nii et punase müra põhjatase on mõõdetud, mitte eeldatud). Rikkumine pikema keskmistamisajaga, kui andmeleht või kirje toetab, märgitakse ekstrapoleeritud. Valikuline spuufimise jaotis lisab orbiidil oleva vastuvõtja ajastuse kaitsetaseme: orbitaalkiirus ja -periood, kui kaua üks maapealne spuufer suudab satelliidini ühe läbimise jooksul ulatuda, kellaga toetatud monitori põhjatase ja CUSUM-i tuvastuslatentsus, tingimuslik piir, tõmme, mille spuufer kindlaksmääratud maksimaalse tõusukiirusega kogub, enne kui satelliit lahkub tema ulatusest või sõltumatu kontroll käivitub, ning kas iga maakontakti- või ristlingi kontroll on sellest spuuferist sõltumatu. VALIDATED: holdover-i pöördarvutus sobitatud kirjest, hoitud tagasi päris tseesiumikellal, mõõdetud vesinikmaseri vastu (tests/slot_timing_cs5071a_holdout.rs, andmetega piiratud); mõõdetud kristallostsillaatoril on tagasihoitud ennustus konservatiivne, kuid ei mahu läve sisse, seega on kristallijuhtum MODELLED. MODELLED: klassi- ja andmelehe allikad, deterministlikud liikmed ja spuufimise hinnang.

# attr:alt
seg-97a91c8a60cd = Diagramm, mille mootor kirjutab failile scenarios/slot-timing-ocxo-leo.toml, liik slot-timing

# text
seg-4f19d4fb1341 = Üldine N-D pühkimine mis tahes paketi kohal punktiga eraldatud TOML-võtmete / JSON-i mõõdikuteede kaudu.

# attr:alt
seg-621a18c07044 = Diagramm, mille mootor kirjutab failile scenarios/sweep-nd-inertial.toml, liik sweep-nd

# text
seg-e7ab7b55c969 = 1-D kompromissiuuringu pühkimine kellapaketi parameetri kohal.

# attr:alt
seg-c784b8f22f12 = Diagramm, mille mootor kirjutab failile scenarios/sweep-clock-stability.toml, liik sweep

# text
seg-a448b24ded2b = Telekommunikatsiooni ajastus: GNSS-i holdover-i ajaviga, maksimaalne ajaintervalli viga (MTIE) ja ajahälve (TDEV), kontrollitud ITU-T maskide vastu hinnetega PASS või FAIL ja varuga iga maski kohta. Sisend on kas SÜNTEETILINE HOLDOVER (ostsillaatori eelseade -- ocxo, rubiidium, tseesium või csac, igaüks kannab nimetatud avaliku Microchipi andmelehe stabiilsuse, vananemise ja temperatuuri arve -- pluss GNSS-i kaotuse aeg, kirje pikkus ja valimiintervall; vabalt töötav kell kannab valget, flicker- ja, kus andmelehe sobitus seda nõuab, juhusliku kõnni sagedusmüra, lineaarset vananemist ja siinuselist temperatuuriliiget) või SISESTATUD SARI [time_s, time_error_ns] paaridest, antud sisseehitatult (ja ainult natiivsetes ehitustes CSV-fail). Maskid: ITU-T G.8272 (07/2025) PRTC-A ja PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE tabelid 1-2, TDEV tabelid 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukustatud ({ "30" } ns, tabelid 1-2) ja ePRTC-A holdover (tabeli { "3" } ajavea ümbris, mis tõuseb { "30" } ns-ilt { "100" } ns-ni holdover-i perioodi H jooksul, mille määrab lukustatud kestus, MTIE tabel { "4" }, TDEV tabel { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC klassid A-C (max|TE|, konstantne ajaviga, madalpääsfiltreeritud MTIE ja TDEV) ja klass D (max|TE_L| { "5" } ns, ainus klassi D arv, mis ei ole jäetud edasiseks uurimiseks); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) tugipunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns koos MTIE tabelitega 7-1 kuni 7-3). Iga kirje, mille Soovitus märgib edasiseks uurimiseks, puudub, mitte ei ole täidetud, ja iga aruanne loetleb, mis ei ole teostatud. Annab aru ka ajast, mil iga maksimaalse ajavea eelarve ületatakse (vaikeväärtused: { "100" } ns ePRTC max|TE_HO|, { "400" } ns võrgu holdover-i eraldis, { "1100" } ns punkt C, { "1.5" } us klass { "4" }), MTIE/TDEV kõveratest CSV-tabelina koos iga maski piiriga ja ühikute-ja-päritolu kirjest iga arvulise välja kohta. VALIDATED: MTIE ja TDEV hinnangud allantools paketi vastu kinnistatud holdover-i seerial. MODELLED: maskitabelid on ärakirjad ning sünteetiline holdover on andmelehe maksimumidest ehitatud mudel, mitte ühegi üksuse mõõtmine. Mitte standardi järgimise test.

# attr:alt
seg-ec7745a09d08 = Diagramm, mille mootor kirjutab failile scenarios/telecom-synce-eec.toml, liik telecom-timing

# text
seg-9a2bb9809aed = Kahesuunaline satelliitaja ja sageduse edastus kahe jaama vahel geostatsionaarse releesatelliidi kaudu: kahesuunaline võrrand lahendatud suuruse T_A - T_B suhtes koos iga mittevastastikuse liikmega (jaama seadmete viivitused, Ku-riba ionosfäär, transponder, Sagnac), ruutude summa määramatuse eelarve, mille A-tüübi liige on simuleeritud lingi TDEV keskmistamisajal, simuleeritud link valge ja flicker-faasimüra ning ööpäevase mittevastastikkusega ning mis tahes antud BIPM Circular T jaotise { "1" } seeria, MJD,ns CSV või IGS RINEX jaamakella kirjete stabiilsus (kalle, jääk-RMS, TDEV, ADEV). MODELLED.

# attr:alt
seg-92d3c84024d7 = Diagramm, mille mootor kirjutab failile scenarios/time-transfer-budget.toml, liik time-transfer-budget

# text
seg-ccb244e60d60 = Optiline vs RF kahesuunaline aja/sageduse edastus.

# attr:alt
seg-bd76bd68eab3 = Diagramm, mille mootor kirjutab failile scenarios/timetransfer.toml, liik timetransfer

# text
seg-4e31c8daf798 = Register (ledger)

# text
# c1: docs/kinds/clocks-timing-and-holdover.md
seg-45a59bc9ac90 = Allikas: <c1/>

# text
seg-3b549536beed = Kellad, ajastus ja holdover (stsenaariumi liikide perekond)

# text
seg-9095869ec445 = { "9" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: kshana scenarios/clock-holdover.toml
seg-59c2beac56b5 = Teemalehed: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Käivita üks: <c1/>. Kõik perekonnad: <a5>KINDS.md</a5>.

# attr:alt
seg-b333618375db = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Kellad, ajastus ja holdover liikide jaoks

# text
seg-efd15cff3d32 = MODELLED (tulemuse silt)

# text
seg-ff7dca09f0f2 = Telekommunikatsiooni ajastus: GNSS-i holdover-i ajaviga, maksimaalne ajaintervalli viga (MTIE) ja ajahälve (TDEV), kontrollitud ITU-T maskide vastu hinnetega PASS või FAIL ja varuga iga maski kohta.

# text
seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

# text
seg-413edbab9fa9 = Pesa ajastus: sekundid, kuni vabalt töötav kell väljub ajaindekseeritud marsruutimis- või ülesandepesa kaitsevahemikust (suurim absoluutne ajaviga, mida pesa talub), iga liikme panus sel hetkel

# text
seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

# text
seg-d425ce2b9f9c = Kahesuunaline satelliitaja ja sageduse edastus kahe jaama vahel geostatsionaarse releesatelliidi kaudu: kahesuunaline võrrand lahendatud suuruse T_A - T_B suhtes koos iga mittevastastikuse liikmega (jaama seadmete viivitused, Ku

# text
seg-a2a710b3204f = MODELLED ajastussüsteemi holdover-i test, hinnatud ajavea kirjest, mille esitab OPERAATOR (linuxptp ptp4l, phc2sys või ts2phc logi, chrony tracking- või statistics-logi, TICC, TimeLab või RINEX

# text
seg-1da440dd525c = MODELLED usaldusväärse kvantajastuse ahel: otsast lõpuni kvant- (optilise võrega kell + põimumise/üksikfootoni link) vs klassikaline (CSAC + RF kahesuunaline) aja edastamise eelarve, taaskasutatud ajastuse kaitsetase

# text
# c1: seed
# c2: threshold_ns
# c3: time
# c4: gnss
# c5: clock_quantum
# c6: clock_classical
# c7: runs
# c8: integrity
seg-50d75d48ed43 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valikulised: <c7/>, <c8/>.

# text
seg-3273244f755c = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>clock</a1>.

# text
# c1: parameter
# c2: metric
# c3: start
# c4: stop
# c5: steps
# c6: base
# c7: scale
seg-ee8d6e20c844 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Valikulised: <c7/>.

# text
seg-e359cc42506e = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>sweep</a1>.

# text
# c1: base
# c2: axes
# c3: metrics
seg-616716b33732 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>.

# text
seg-6f282be980ca = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>sweep-nd</a1>.

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-79c3d3cd6c7d = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-c23e498daa3d = <b>Register (ledger):</b> MODELLED { "5" } · VALIDATED { "1" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>telecom-timing</a1>.

# text
# c1: oscillator
# c2: slot
# c3: spoofing
seg-248e1686fddc = Kohustuslikud väljad: <c1/>, <c2/>. Valikulised: <c3/>.

# text
seg-cc04bc2d43c5 = <b>Register (ledger):</b> MODELLED { "2" } · VALIDATED { "1" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>slot-timing</a1>.

# text
# c1: seed
# c2: samples
# c3: step_s
# c4: range_spec_mm
# c5: link_quantum
# c6: link_classical
seg-50273a29deec = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

# text
seg-adf570e18299 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>timetransfer</a1>.

# text
# c1: station_a
# c2: station_b
# c3: satellite_lon_deg
# c4: transponder_ab_ns
# c5: transponder_ba_ns
# c6: white_noise_ns
# c7: uncertainty
# c8: uplink_ghz
# c9: downlink_ghz
# c10: true_offset_ns
# c11: flicker_noise_ns
# c12: diurnal_amplitude_ns
# c13: reciprocity_bias_ns
# c14: step_s
# c15: span_days
# c16: averaging_s
# c17: seed
# c18: series
seg-5134a01b60a0 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Valikulised: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

# text
seg-09b554a74d49 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>time-transfer-budget</a1>.

# text
# c1: test
# c2: series
# c3: masks
# c4: budgets
seg-58952681ea9d = Kohustuslikud väljad: <c1/>, <c2/>. Valikulised: <c3/>, <c4/>.

# text
seg-635ec95c2e86 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>holdover-test</a1>.

# text
# c1: integration_s
# c2: dissemination_interval_s
# c3: link_loss_db
# c4: classical_link_sigma_s
# c5: monitor_pfa
# c6: attack_delay_s
# c7: clock_fault_sigma
seg-76bb4110ea36 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

# text
seg-bb6d7df61e2f = <b>Register (ledger):</b> ükski maatriksirida seda liiki ei nimeta; mootor sildistab oma tulemuse ise. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>quantum-time-transfer</a1>.

# text
seg-245adc6e6766 = <s1>Eelmine</s1>Kampaaniad

# text
seg-960d5c757310 = <s1>Järgmine</s1>Konstellatsioonid, katvus ja geomeetria
