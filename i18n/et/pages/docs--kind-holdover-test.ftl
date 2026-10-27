# docs--kind-holdover-test: translations (et)

# text
seg-f42465f7d066 = ns

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-c61e88721556 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kellad, ajastus ja holdover</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-849c08d3ce70 = Perekonna leht: <a1>Kellad, ajastus ja holdover</a1>

# text
# c1: docs/kinds/by-kind/holdover-test.md
seg-73929aeded02 = Allikas: <c1/>

# text
# c1: holdover-test
seg-218f00012d0e = <c1/> (stsenaariumi liik)

# text
seg-c0924aa36e64 = MODELLED ajastussüsteemi holdover-test, hinnatud ajavea kirjest, mille OPERAATOR annab (linuxptp ptp4l, phc2sys või ts2phc logi, chrony jälgimis- või statistikalogi, TICC, TimeLab või RINEX kellalogi või time_s,time_error_ns paarid). Testil on neli sammu ja Kshana ei tee ühtegi neist: lukustatud LÄHTETASE, GNSS EEMALDATUD operaatori poolt (antennikaabel või simulaatori väljund; Kshana ei saada ega juhi midagi) väljaöeldud ajal, HOLDOVER süsteemi enda ostsillaatoril ja TAASTUMINE pärast seda, kui operaator taastab GNSS-i teisel väljaöeldud ajal. Kirje jaotatakse nende kahe aja kohal. Lähtetase: ajavea statistika ja ITU-T maskid, mis on kirjutatud lukustatud kella jaoks. Holdover: statistika, murdosaline sageduse nihe, mida süsteem hoidis (vähimruutude sirge), maskid, mis on kirjutatud holdover-i või autonoomse kella jaoks, ePRTC-A holdover-i ümbrik väljaöeldud lukustatud kestuse põhjal ning aeg, mil iga ajavea eelarve ületatakse. Taastumine: kas ja millal |TE| jõudis väljaöeldud riba sisse ja jäi sinna, tipp ja suurim hüpe. Iga piir on ümber kirjutatud avalikust ITU-T tabelist (telekommunikatsiooni ajastusmaskid); sõnastus on „mõõdetud maski suhtes“ ning need kaks aega on operaatori väide, mitte kontrollitud. Maski jaoks liiga lühike kirje on INCOMPLETE, mitte kunagi ekstrapoleeritud. Vt docs/TIMING-HIL.md.

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-cd6d840a1382 = Ühe <c1/> jooksu kokkuvõte: holdover-test: holdover { "1795" } s, maks|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; taastus { "0" } s pärast GNSS-i naasmist (MODELLED, mõõdetud maski suhtes)

# text
# c1: test
# c2: series
seg-6a3dc8804be5 = Kohustuslikud väljad: <c1/>, <c2/>

# text
# c1: masks
# c2: budgets
seg-4792040e4773 = Valikulised väljad: <c1/>, <c2/>

# text
# c1: scenarios/holdover-test-ptp4l.toml
seg-ad4f9c40e317 = Näide <c1/> määrab muu hulgas:

# text
seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

# text
seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

# text
seg-a0f9749e9ca1 = master

# text
seg-cd857523297f = phase

# text
seg-29a012ae4735 = refuse

# text
seg-d578fc8e6052 = Tulemuse silt (mootori oma): MODELLED — holdover-test, hinnatud operaatori antud ajavea kirjest. Iga piir on ümber kirjutatud nimetatud avalikust ITU-T soovitusest ja tulemus on mõõdetud maski suhtes; see ei ütle midagi selle kohta, kas mõni kell või süsteem vastab soovitusele, ning keegi ei ole hinnanud ega kiitnud heaks

# attr:alt
seg-8ce93392747b = Diagramm, mille mootor kirjutab failile scenarios/holdover-test-ptp4l.toml, liik holdover-test

# text
# c1: holdover-test
seg-3361819ae321 = <b>MODELLED</b> Liik <c1/>: ajavea kirje (linuxptp, chrony, TICC, TimeLab või RINEX kellalogi või time_s,time_error_ns paarid) jaotatakse kahe operaatori väljaöeldud aja kohal GNSS-i eemaldamiseks ja taastamiseks lähtetasemeks, holdover-iks ja

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> Maksimaalne ajaintervalli viga ja ajahälve, mida stsenaarium liigiga <c1/> annab, telekommunikatsiooni mastaabis holdover-kirjel: O(n) monotoonne järjekorra libisev. Oraakel (sõltumatu etalon) (ExternalDataset): allantools { "2024.06" } — sõltumatu kolmanda osapoole sagedusstabiilsuse teek — mtie() ja tdev() failil tests/fixtures/telecom_timing/holdover_te_series.csv, rida parsitud samast 17 olulise numbriga tekstist mõlemal poolel; etalon salvestab rea SHA-256 ja on võrguühenduseta taasloodav failiga tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valideerib selle kirje HINNANGUFUNKTSIOONE, mitte sün

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukustatud ja ePRTC-A holdover-i ümber kirjutatud piirid (sealhulgas tabeli { "3" } ajavea ümbrik. Oraakel (sõltumatu etalon) (InternalConsistency): Nimetatud soovituste ümberkirjutus (vabalt allalaetav aadressilt itu.int), iga piir kannab oma tabelit või punkti, loetletud koos iga kinnitamata või realiseerimata punktiga failis docs/TELECOM-TIMING.md; tabelitest tulenevad murdepunktide pidevuse samasused kontrollitakse testides. Standardi ümberkirjutus sisemise kooskõla kontrollidega, mitte standardi järgimise test ega väline valideerimine. { "0.30" } ring { "2" } (eelregistree

# text
# c1: holdover-test
seg-142528f34e66 = <b>MODELLED</b> Liik <c1/>: ajavea kirje (linuxptp, chrony, TICC, TimeLab või RINEX kellalogi või time_s,time_error_ns paarid) jaotatakse kahe aja kohal. Oraakel (sõltumatu etalon) (InternalConsistency): Käsitsi arvutus kirjetel, mis on ehitatud valemitest, mille kalle, hüpe, ekstreemum ja taastumisaeg on enne jooksu teada (testid väljendavad need), ning ülalolevate telekommunikatsiooni ajastuse ridade maskid, ümbrik ja eelarved. Päris holdover-i laborimõõtmist ei hinnatud ja ühtegi välist sõltumatut etaloni ei võrreldud, seega liik ei esita väidet ühegi kella või süsteemi kohta; enne mis tahes kellaklassikohast fi vajatakse ajastuslabori partnerit

# text
# c1: label
seg-59ff0b0e3d2d = MODELLED — holdover-test, hinnatud operaatori antud ajavea kirjest. Iga piir on ümber kirjutatud nimetatud avalikust ITU-T soovitusest ja tulemus on mõõdetud maski suhtes; see ei ütle midagi selle kohta, kas mõni kell või süsteem vastab soovitusele, ning keegi ei ole seda hinnanud ega heaks kiitnud. Ajad, mil GNSS eemaldati ja taastati, on operaatori väide ja neid ei ole kontrollitud. Nõuandev tark (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-daeb4ad7aa35 = MODELLED ajastussüsteemi holdover-test, hinnatud ajavea kirjest, mille OPERAATOR annab (linuxptp ptp4l, phc2sys või ts2phc logi, chrony jälgimis- või statistikalogi, TICC, TimeLab või RINEX kellalogi või time_s,time_error_ns paarid). (liikide kataloog (<c1/>))

# text
seg-ff3008c250cc = ITU-T telekommunikatsiooni sünkroniseerimise maskid koos PASS/FAIL ja varuga on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-8ccd0f911626 = Operaatori antud ajavea kirjest hinnatud holdover-test on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-72bad5444282 = Teemaleht: <a1>TIMING-HIL.md</a1>

# text
seg-3b3a24664dae = Teemaleht: <a1>HARDWARE-SAFETY.md</a1>

# text
seg-b754be35fb52 = <s1>Eelmine</s1>gravity-map

# text
seg-e7665ee5e30e = <s1>Järgmine</s1>hybrid-optical-rf
