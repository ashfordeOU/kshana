# docs--kind-telecom-timing: translations (et)

# text
seg-f42465f7d066 = ns

# text
seg-98151954f217 = false

# text
seg-cb91473bfdda = Teemaleht: <a1>LEO-PNT.md</a1>

# text
seg-c61e88721556 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kellad, ajastus ja holdover</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: üks parsimiskiht, mis muudab RINEX-i kellafaili (ühe nimetatud kella AS/AR kirjed, versioonid { "2" } ja { "3.00" } kuni { "3.04" }), TimeLab-stiilis ASCII faasi- või sagedusloo või TAPR TICC ajatempli- või intervallilogi ühtseks pha Testid: <a1>clock_log_allantools.rs</a1>.

# text
seg-849c08d3ce70 = Perekonna leht: <a1>Kellad, ajastus ja holdover</a1>

# text
# c1: scenarios/
seg-3bc1761c76ab = { "3" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
# c1: telecom-timing
seg-e7273fd2a640 = <b>VALIDATED</b> Maksimaalne ajaintervalli viga ja ajahälve, mida stsenaarium liigiga <c1/> annab, telekommunikatsiooni mastaabis holdover-kirjel: O(n) monotoonne järjekorra libisev. Oraakel (sõltumatu etalon) (ExternalDataset): allantools { "2024.06" } — sõltumatu kolmanda osapoole sagedusstabiilsuse teek — mtie() ja tdev() failil tests/fixtures/telecom_timing/holdover_te_series.csv, rida parsitud samast 17 olulise numbriga tekstist mõlemal poolel; etalon salvestab rea SHA-256 ja on võrguühenduseta taasloodav failiga tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valideerib selle kirje HINNANGUFUNKTSIOONE, mitte sün

# text
seg-4cf0f94f96c9 = <b>MODELLED</b> ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukustatud ja ePRTC-A holdover-i ümber kirjutatud piirid (sealhulgas tabeli { "3" } ajavea ümbrik. Oraakel (sõltumatu etalon) (InternalConsistency): Nimetatud soovituste ümberkirjutus (vabalt allalaetav aadressilt itu.int), iga piir kannab oma tabelit või punkti, loetletud koos iga kinnitamata või realiseerimata punktiga failis docs/TELECOM-TIMING.md; tabelitest tulenevad murdepunktide pidevuse samasused kontrollitakse testides. Standardi ümberkirjutus sisemise kooskõla kontrollidega, mitte standardi järgimise test ega väline valideerimine. { "0.30" } ring { "2" } (eelregistree

# text
seg-5547f1f662d3 = ja veel { "2" } maatriksis.

# text
seg-8aee75a55007 = ocxo

# text
# c1: docs/kinds/by-kind/telecom-timing.md
seg-9b72d3b3a0ab = Allikas: <c1/>

# text
# c1: telecom-timing
seg-f4dc88ffe6b5 = <c1/> (stsenaariumi liik)

# text
seg-a448b24ded2b = Telekommunikatsiooni ajastus: GNSS-i holdover-i ajaviga, maksimaalne ajaintervalli viga (MTIE) ja ajahälve (TDEV), kontrollitud ITU-T maskide vastu hinnetega PASS või FAIL ja varuga iga maski kohta. Sisend on kas SÜNTEETILINE HOLDOVER (ostsillaatori eelseade -- ocxo, rubiidium, tseesium või csac, igaüks kannab nimetatud avaliku Microchipi andmelehe stabiilsuse, vananemise ja temperatuuri arve -- pluss GNSS-i kaotuse aeg, kirje pikkus ja valimiintervall; vabalt töötav kell kannab valget, flicker- ja, kus andmelehe sobitus seda nõuab, juhusliku kõnni sagedusmüra, lineaarset vananemist ja siinuselist temperatuuriliiget) või SISESTATUD SARI [time_s, time_error_ns] paaridest, antud sisseehitatult (ja ainult natiivsetes ehitustes CSV-fail). Maskid: ITU-T G.8272 (07/2025) PRTC-A ja PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE tabelid 1-2, TDEV tabelid 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukustatud ({ "30" } ns, tabelid 1-2) ja ePRTC-A holdover (tabeli { "3" } ajavea ümbris, mis tõuseb { "30" } ns-ilt { "100" } ns-ni holdover-i perioodi H jooksul, mille määrab lukustatud kestus, MTIE tabel { "4" }, TDEV tabel { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC klassid A-C (max|TE|, konstantne ajaviga, madalpääsfiltreeritud MTIE ja TDEV) ja klass D (max|TE_L| { "5" } ns, ainus klassi D arv, mis ei ole jäetud edasiseks uurimiseks); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) tugipunkt C (max|TE_L| { "1100" } / { "600" } / { "100" } ns koos MTIE tabelitega 7-1 kuni 7-3). Iga kirje, mille Soovitus märgib edasiseks uurimiseks, puudub, mitte ei ole täidetud, ja iga aruanne loetleb, mis ei ole teostatud. Annab aru ka ajast, mil iga maksimaalse ajavea eelarve ületatakse (vaikeväärtused: { "100" } ns ePRTC max|TE_HO|, { "400" } ns võrgu holdover-i eraldis, { "1100" } ns punkt C, { "1.5" } us klass { "4" }), MTIE/TDEV kõveratest CSV-tabelina koos iga maski piiriga ja ühikute-ja-päritolu kirjest iga arvulise välja kohta. VALIDATED: MTIE ja TDEV hinnangud allantools paketi vastu kinnistatud holdover-i seerial. MODELLED: maskitabelid on ärakirjad ning sünteetiline holdover on andmelehe maksimumidest ehitatud mudel, mitte ühegi üksuse mõõtmine. Mitte standardi järgimise test.

# text
# c1: scenarios/telecom-synce-eec.toml
seg-07f81cfd606a = Ühe <c1/> käivituse kokkuvõte: telecom-timing: max|TE| { "488.2" } ns { "12000" } s jooksul; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

# text
# c1: seed
# c2: masks
# c3: budgets
# c4: holdover
# c5: series
seg-17f291bfc65d = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

# text
# c1: scenarios/telecom-synce-eec.toml
seg-d192feecd4b3 = Näide <c1/> määrab muu hulgas:

# text
seg-e7cab30ef039 = [] (elemente pole)

# text
seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

# text
seg-01b1287f233b = Tulemuse silt (mootori oma): MODELLED — ajaviga, MTIE ja TDEV kontrollitud ärakirjutatud ITU-T maskide vastu. Hinnangud on valideeritud allantools vastu; maskitabelid on nimetatud Soovituste ärakirjad; sünteetiline holdover on avaliku andmelehe arvudest ehitatud mudel, mitte ühegi üksuse mõõtmine. Mitte standardi järgimise te

# attr:alt
seg-ec7745a09d08 = Diagramm, mille mootor kirjutab failile scenarios/telecom-synce-eec.toml, liik telecom-timing

# text
seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: <a1>kontrollimaatriksi</a1> read, mis nimetavad seda liiki.

# text
# c1: telecom-timing
seg-c21ebd79f497 = <b>VALIDATED</b> Maksimaalne ajaintervalli viga ja ajahälve, mida stsenaariumi liik <c1/> teatab telekommunikatsiooni mastaabis holdover-i kirjel: O(n) monotoonse järjekorraga liugakna MTIE (telecom_timing::mtie_sliding, vajalik, et päev ühesekundilisi valimeid Testid: <a1>telecom_timing_reference.rs</a1>.

# text
seg-75aa6f7234ae = <b>MODELLED</b> ITU-T G.8272 (07/2025) PRTC-A/B ärakirjutatud piirid, G.8272.1 ({ "2024" }) Amd. Testid: <a1>telecom_timing_reference.rs</a1>.

# text
# c1: telecom-timing
seg-d0ab0ca72b80 = <b>MODELLED</b> Seitse püsitemperatuuri MTIE ja TDEV hälbe tekitamise maski liigile <c1/>: G.811 (09/1997) PRC (autonoomne), G.812 (06/2004) tüübid I, II ja III, G.8262 (10/2024) EEC valikud { "1" } ja { "2" } ning G.8262.1 (11/2025) eEEC (lukus

# text
seg-d4bd840708db = <b>MODELLED</b> Neli eelseadet — OCXO (Microchip OX-208), rubiidium (Microchip 8040C), tseesium (Microchip 5071A kõrgjõudlusega toru) ja CSAC (Microchip SA.45s) — igaüks kannab . Oraakel (sisemine kooskõla; InternalConsistency): neli nimetatud Microchipi andmelehte (dokumendinumbrid ja URL-id igas eelseades ning failis docs/TELECOM-TIMING.md) sisendarvude jaoks; kinnine vananemisrampp ja sobituse ümbriku omadus sisemiste kontrollidena. See, kuidas arvudest saab müramudel — sobitus, põhjataseme reegel, 30-päevane kuu, lineaarne temperatuurilugemine — on modelleerimisvalik; ükski eelseade ei ole üksuse mõõtmine. { "0.30" } ring { "2" }, ühepoolsed lävid vastu

# text
# c1: not_implemented[0]
seg-cbb39b4105ac = iga nõue, mille Soovitused märgivad „edasiseks uurimiseks“ (klass D peale max|TE_L|, ePRTC-B holdover, T-BC/T-TSC holdover mõlema sisendi kaotusega, TDEV võrgupiirid, ePRTC-A holdover MTIE ja TDEV üle { "10 000" } s) (tulemus <c1/>)

# text
# c1: not_implemented[1]
seg-a70f575aeb21 = kõrgpääsfiltreeritud dünaamiline ajaviga (dTE_H, G.8273.2 tabel 7-7 ja G.8271.1 punktid 7.3.2-7.3.3) (tulemus <c1/>)

# text
# c1: not_implemented[2]
seg-66446247fc49 = G.8273.2 tabeli 7-6 muutuva temperatuuri MTIE ja G.8273.2 tabeli 7-10 füüsilise kihi abil holdover-i MTIE (tulemus <c1/>)

# text
# c1: not_implemented[3]
seg-c1d601b45182 = suhteline ajaviga (cTE_R, dTE_R,L) kahe väljundi vahel (tulemus <c1/>)

# text
# c1: not_implemented[4]
seg-6146f857c2df = liikuva keskmise paketifilter, mida G.8272 ja G.8272.1 esitavad PTP liideste jaoks: seeriat käsitletakse ühe impulsi sekundis ajaintervalli veana (tulemus <c1/>)

# text
# c1: label
seg-d5e956023b48 = MODELLED — ajaviga, MTIE ja TDEV kontrollitud ärakirjutatud ITU-T maskide vastu. Hinnangud on valideeritud allantools vastu; maskitabelid on nimetatud Soovituste ärakirjad; sünteetiline holdover on avaliku andmelehe arvudest ehitatud mudel, mitte ühegi üksuse mõõtmine. Mitte standardi järgimise test. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-f163ae37b8c7 = MODELLED: maskitabelid on ärakirjad ning sünteetiline holdover on andmelehe maksimumidest ehitatud mudel, mitte ühegi üksuse mõõtmine. (liikide kataloog (<c1/>))

# text
seg-a0ddb65b00af = Kell: OCXO eelseade (Microchip OX-208 andmeleht, Rev 12-1-2021), vabalt töötav alates esimesest valimist valge, flicker- ja (kus sobitus seda nõuab) juhusliku kõnni sagedusmüraga, mis on sobitatud andmelehe Alani hälbe maksimumidele, ja selle lineaarne vananemine. Temperatuur hoitakse konstantsena (amplituud { "0" } K), nagu maskid eeldavad. (stsenaariumifaili kommentaar, read { "12" }–{ "15" })

# text
seg-101dbde1c65b = Teemaleht: <a1>CLOCK-LOG-FORMATS.md</a1>

# text
seg-c32dc02f981d = <s1>Eelmine</s1>sweep

# text
seg-8aef86c9aa68 = <s1>Järgmine</s1>terrain-nav
