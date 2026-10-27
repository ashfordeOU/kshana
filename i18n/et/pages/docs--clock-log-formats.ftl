# docs--clock-log-formats: translations (et)

# text
# c1: docs/CLOCK-LOG-FORMATS.md
seg-ca2fcdd60f65 = Allikas: <c1/>

# text
seg-0dfd1160c5d7 = Kellalogi vormingud

# text
# c1: src/clock_log.rs
# c2: (time_s, phase_s)
# c3: tau0
seg-f52a62872493 = <c1/> loeb mõõdetud kellalogi üheks normaliseeritud faasireaks: ühtlane ruudustik valimitest <c2/>, kus valimi intervall <c3/> on öeldud või leitud, iga lünk on loetud ja logi ühikud nimetatud. Loetakse kaheksat vormingut, igaüks dokumenteeritud alamhulgana. Kõik, mis jääb alamhulgast välja, lükatakse tagasi veaga, mis nimetab leitud sisu, mitte ei loeta ligikaudselt.

# text
# c1: tau0
seg-dbdbfec37ab6 = <b>Lühendid.</b> RINEX on Receiver Independent Exchange Format. TICC on TAPR (Tucson Amateur Packet Radio) ajaintervalli loendur. ADEV on kattuv Alani hälve, TDEV ajahälve ja MTIE maksimaalne ajaintervalli viga. <c1/> on valimi intervall sekundites.

# text
seg-1d5a6c2090af = Kus logi saab kasutada

# text
# c1: telecom-timing
# c2: [series.clock_log]
# c3: series.samples
# c4: series.csv_path
# c5: clock_log
seg-2a391645eeeb = <b><c1/></b>: <c2/> asemel <c3/> või <c4/>. Logi faas ns-des on ajavea rida, mida kontrollitakse maskide vastu, ning aruandesse lisandub plokk <c5/>, mis ütleb, kuidas seda loeti.

# text
# c1: [clock_log]
# c2: measured
# c3: input_sha256
# c4: scenario_hash
# c5: runs = 1
seg-4c2a67008451 = <b>Stsenaariumi liik „clock“</b>: tabel <c1/> lisab käitusele ploki <c2/>: kuidas logi loeti, tabeli SHA-256 (<c3/>; käituse <c4/> tabelit ei kata) ning faasivalimite räsi ning kattuv ADEV, TDEV ja MTIE oktaavkeskmistamise teguritel. See vajab <c5/>. Simuleeritud holdover on muutmata.

# text
seg-2f464fe709c9 = Ilma tabelita parsitakse, räsitakse ja esitatakse mõlemad stsenaariumi liigid täpselt nagu varem.

# text
seg-c931c5ec2f4a = Vormingud

# text
# c1: rinex-clk
# c2: TIME SYSTEM ID
# c3: END OF HEADER
# c4: AS
# c5: AR
# c6: CR
# c7: DR
# c8: MS
seg-7f608c733407 = <b><c1/></b>: RINEX-i kellafailid, versioonid { "2" } ja { "3.00" } kuni { "3.04" } (sh { "3.04" } üheksamärgiline nimeväli). Päist loetakse ainult välja <c2/> jaoks ja see jäetakse vahele kuni reani <c3/>. Andmekirjetest hoitakse ainult ühe nime järgi valitud kella kirjed <c4/> (satelliit) ja <c5/> (vastuvõtja või jaam). Nende esimene väärtusväli, kella nihe sekundites, on faas. Jätkuread ning kirjed <c6/>, <c7/> ja <c8/> jäetakse vahele. Epohhid on kirje kalendriväljad sekunditena alates 1980-01-06 { "00" }:{ "00" }:{ "00" } faili enda ajasüsteemis, ilma teisenduseta.

# text
# c1: timelab
# c2: tau0
# c3: time value
seg-0b758195e7eb = <b><c1/></b>: TimeLabi stiilis ASCII faasi- või sageduslogid, lihttekstivorming, mida TimeLab ekspordib ning mida selle ASCII import ja Stable32 loevad. Ühel real on üks lugem: kas üks veerg ühtlase <c2/> juures või kaks veergu <c3/>. Veerge võivad eraldada tühikud, komad või semikoolonid.

# text
# c1: #
# c2: ;
# c3: %
# c4: key = value
# c5: key: value
# c6: tau0
# c7: units
# c8: s
# c9: ms
# c10: us
# c11: ns
# c12: ps
# c13: data
# c14: phase
# c15: frequency
# c16: time_units
# c17: s
# c18: mjd
seg-a7ae9e712bea = Read, mis algavad märgiga <c1/>, <c2/> või <c3/>, on kommentaarid. Kommentaar kujul <c4/> (või <c5/>) määrab <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> või <c12/>, faasi jaoks), <c13/> (<c14/> või <c15/>) või <c16/> (<c17/> või <c18/>, kahe veeru esimese jaoks).

# text
seg-84cf463d5e74 = Üks eelnev mittenumbriline rida loetakse veeru päiseks.

# text
# c1: x[i+1] = x[i] + y[i]·tau0
seg-84f4b59bcdbf = Sageduse andmeid (suhteline sagedus) aktsepteeritakse ainult ühe veeruna. See integreeritakse faasiks kujul <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

# text
# c1: .tim
seg-8cc445eb84f3 = TimeLabi binaar- ja <c1/> projektifaile ei loeta.

# text
# c1: ticc
seg-3d8853fa9c92 = <b><c1/></b>: TAPR TICC loenduri logid (TICC Operation Manual, { "23" }. novembri { "2016" } redaktsioon, „measurement modes“). Iga andmeväli on sekundid { "12" } kümnendkohaga.

# text
# c1: <seconds> chA
# c2: <seconds> chB
# c3: chC
# c4: x[k] = t[k] − t[0] − n[k]·tau0
# c5: n[k]
# c6: tau0
seg-3af6e4e7bc73 = Ajatempli režiimi read (<c1/>, <c2/>) ja TimeLabi režiimi pseudoajatempli kanal (<c3/>) on sündmuste ajatemplid. Valitud kanali faas on selle ajatempel miinus nominaalne tikk: <c4/>, kus <c5/> on täisarv <c6/> esimesest sündmusest alates. Vahele jäänud sündmus on lünk.

# text
# c1: <seconds> TI(A->B)
# c2: TI
# c3: tau0
# c4: tau0_s
seg-cecf9df4ff10 = Intervalli režiimi read (<c1/> või mis tahes silt, mis algab <c2/>) loetakse otse faasina, üks lugem <c3/> kohta. Stsenaarium peab ütlema <c4/>, sest rida ei sisalda aega.

# text
seg-75301936698f = Perioodi režiimi ja silumisrežiimi väljund lükatakse tagasi. Kanal, mille lugemid ei kasva, esitatakse perioodi režiimina.

# text
# c1: #
# c2: <number> <label>
seg-5ec2509907dd = Read, mis algavad märgiga <c1/>, ja read, mis ei ole kujul <c2/> (näiteks käivitusmenüü), jäetakse vahele ja loetakse.

# text
seg-cb4b7062dd5a = linuxptp ja chrony logid

# text
seg-c6c70813a988 = Need viis vormingut loevad seda, mida töötav ajadeemon oma kella kohta kirjutab. Need on mõeldud ajastusahela järelkontrolliks (piirikell, suurmeistri PHC, chrony klient) samade hindajatega nagu teised logid. Need ei loe deemoni seadistust ja siin ei räägi miski deemoniga.

# text
# c1: ptp4l
# c2: phc2sys
# c3: ts2phc
seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: linuxptp servo read, iga vorming loeb ainult oma programmi ridu. Lugem on rida kujul

# text
# c1: [seconds.fraction]
# c2: ptp4l[812]:
seg-e32842403b6b = Ajatempel on esimene <c1/> real (deemoni monotoonne kell). Seda loetakse ka syslogi prefiksi järel, kus protsessi id, näiteks <c2/>, ei sisalda murdosa ja seda ei võeta.

# text
# c1: offset
seg-72678cd6c03e = Faas on logitud <c1/> nanosekundites, teisendatud sekunditeks. See on deemoni mõõdetud orjakella ajaviga oma etaloni suhtes, nii nagu logitud: positiivne, kui ori on ees. See on servo juhtimisel järele jääv viga, mitte vabalt jooksva kella triiv.

# text
# c1: offset
# c2: master
# c3: eth0 master
# c4: [eth0]
# c5: CLOCK_REALTIME phc
# c6: /dev/ptp0
# c7: clock = "<that text>"
seg-f9080412572a = Sõnad ajatempli ja <c1/> vahel nimetavad allika (<c2/>, <c3/> prefiksi <c4/> korral, <c5/>, <c6/>). Logi, kus on rohkem kui üks allikas, vajab <c7/>; viga loetleb need.

# text
# c1: s2
# c2: n_skipped_lines
# c3: s0
# c4: s1
# c5: s2
seg-5bef874341f2 = Lugemid enne seda, kui servo esimest korda teatab <c1/> (lukustatud), jäetakse välja ja loetakse väljal <c2/>: <c3/> ja <c4/> on lukustamata ja sammu olekud, mille nihked on sissetõmbe siirded. Servo, mis ei jõua kunagi olekusse <c5/>, lükatakse tagasi. Rida, millel pole olekuvälja, loetakse sellisena, nagu see on.

# text
# c1: rms ... max ...
# c2: delay
# c3: selected best master
seg-121fbe1486cf = Kokkuvõtterid (<c1/>), teated <c2/> ja <c3/> ning teiste programmide read jäetakse vahele ja loetakse.

# text
seg-92164f4a56be = Tagurpidi liikuvad ajatemplid (taaskäivitatud deemon) lükatakse tagasi; jaga logi.

# text
# c1: chrony-tracking
# c2: chrony-statistics
# c3: log tracking
# c4: log statistics
# c5: YYYY-MM-DD HH:MM:SS
# c6: ====
seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: chrony failid <c3/> ja <c4/>, loetud veeru positsiooni järgi. Lugem on rida vähemalt { "14" } veeruga (tracking) või { "13" }-ga (statistics), mis algab UTC kuupäeva ja kellaajaga <c5/>. Veeru päise rida jäetakse vahele ja loetakse; selle all olev joon <c6/> jäetakse vahele ilma lugemata.

# text
# c1: clock
# c2: clock = "<id>"
seg-bae4f6895d14 = Tracking: veerg { "7" }, kohalik nihe kella uuenduse juures, sekundites. IP-aadress või etalon-id muutub valitud allikaga, nii et ilma <c1/> loetakse iga rida ühe kohaliku kellana. <c2/> hoiab ühe etalon-id.

# text
# c1: clock = "<address>"
seg-12b284cd7d8c = Statistics: veerg { "5" }, allika hinnanguline nihe sekundites. Allika aadressi kohta on üks rida, ja logi vajab <c1/>, kui see sisaldab rohkem kui ühte.

# text
# c1: tau0
# c2: tau0
# c3: n_duplicates
# c4: gaps = "refuse"
# c5: tau0_s
# c6: gaps = "linear"
seg-197645e3c7c5 = Epohhid on sekundid alates 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, ilma lisasekundite käsitlemiseta. Chrony kirjutab rea uuenduse või allika valimi kohta, seega vahe ei ole ühtlane. <c1/> on mediaanvahe; lugem, mis jääb alla poole <c2/> pärast säilitatud eelmist, jäetakse välja ja loetakse väljal <c3/>, ning pikem vahe on lünk, mida <c4/> teatab. Anna <c5/> ja <c6/> logi jaoks, millel on püsiv küsitlusintervall.

# text
# c1: tests/fixtures/clock_log/linuxptp_chrony/
# c2: NOTICE.md
seg-61fbb0479c95 = Chrony veerud ja linuxptp reapaigutused on deemonite avaliku dokumentatsiooni omad. Kataloogis <c1/> olevad testandmestikud on Kshana jaoks kirjutatud väljamõeldud väärtustega (vt <c2/>); päris logi ei loetud, seega võib deemoniversioonide vahel erinev paigutus siiski tagasi lükata või valesti lugeda. Rida, mis ei vasta, jäetakse vahele ja loetakse, mitte kunagi ei arvata.

# text
# c1: tau0
seg-b120a37b7d60 = <c1/> ja lüngad

# text
# c1: tau0
# c2: tau0
# c3: median-spacing
# c4: tau0_s
# c5: input
# c6: tau0
# c7: header
seg-6fd68aad2fd7 = Kui logi kannab ajatempleid ja <c1/> pole antud, on <c2/> järjestikuste ajatemplite mediaanvahe, ümardatud neljale tüvenumbrile, ning allikaks esitatakse <c3/>. Loenduri vahe erineb nominaalsest etaloni sageduse nihke võrra, { "10" }^{ "6" } osa või vähem. Stsenaariumi <c4/> võidab alati (allikas <c5/>), seejärel päisekommentaar <c6/> (allikas <c7/>).

# text
# c1: t0 + i·tau0
# c2: tau0
seg-59e52611a7d3 = Valimid paigutatakse ruudustikule <c1/> ja puuduv epohh on lünk. Lugemid, mis on ruudustikust kaugemal kui { "1" } % väärtusest <c2/>, jäetakse välja ja loetakse, samuti duplikaadid (esimene säilitatakse). Lünga poliitika on üks järgmistest:

# text
# c1: refuse
seg-61b1664a7c48 = <c1/> (vaikimisi): iga lünk on viga, mis loeb lüngad üle;

# text
# c1: longest
seg-593c998b65e0 = <c1/>: säilita pikim lüngavaba lõik;

# text
# c1: linear
seg-f184ce746389 = <c1/>: täida sisemised lüngad lineaarse interpolatsiooniga ja teata täidetute arv.

# text
seg-1f3dc3429615 = Hindajad vajavad lüngavaba kirjet, mistõttu lüngad lahendatakse siin.

# text
# c1: src/clock_log.rs
# c2: tests/fixtures/clock_log/linuxptp_chrony/
# c3: tests/clock_log_allantools.rs
# c4: tests/fixtures/clock_log/PREREGISTRATION.md
seg-fe7d27a473aa = MODELLED. See on parser ja selle väljund toidab hindajaid, mis on mujal valideeritud allantoolsi vastu. Moodulis <c1/> olevad ühiktestid kasutavad väikesi käsitsi kirjutatud logisid ning linuxptp ja chrony vormingute puhul testandmestikke kataloogis <c2/>. <c3/> käitab võrdluse, mis on eelregistreeritud failis <c4/>: kolm algväärtusega sünteetilist logi, üks vormingu kohta, mida loeb tagasi sõltumatu lugeja, mille sama autor kirjutas sellelt lehelt, kusjuures ADEV, TDEV ja MTIE kontrollitakse allantools { "2024.6" } vastu; see võrdlus katab ainult esimest kolme vormingut ning linuxptp ja chrony lugejatel on parseritestid, kuid oraakliga (sõltumatu etalon) võrdlust pole. Logid on sünteetilised, seega ei kirjelda siin miski päris kella ega loendurit.

# text
seg-0f061f726ec5 = <s1>Eelmine</s1>Holdover-test ja ajastusriistvara ahelas

# text
seg-3c89cfcbbd04 = <s1>Järgmine</s1>Riistvara ohutus

# text
seg-9b52cd5eb4be = tau0 ja lüngad
