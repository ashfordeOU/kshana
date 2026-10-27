# docs--osnma: translations (et)

# text
seg-fcd0ebea49bc = Käsurida

# attr:aria-label, text
seg-6816f4e1a0a0 = Versioon

# text
seg-94058315dfe4 = Sisend

# text
# c1: docs/OSNMA.md
seg-23746ba370c2 = Allikas: <c1/>

# text
seg-1e9c104231db = Galileo OSNMA vastuvõtjapoolne kontrollija

# text
seg-17fd702f5997 = Galileo avatud teenuse navigatsioonisõnumi autentimise (OSNMA) vastuvõtjapoolne kontrollija puhtas Rustis. See loeb I/NAV lehti ning teatab satelliidi ja epohhi kohta, kas navigatsiooniandmed on krüptograafiliselt autenditud, ja miks kontroll ebaõnnestus.

# text
seg-ae081f55c4f1 = <b>Nõuandev.</b> See on analüüsi- ja seireväljund ning mitte tüübikinnitust omav navigatsiooniseade. Siin teatatud autentimisstaatus ei ole navigatsiooni terviklikkuse teenus ja seda ei tohi kasutada ainsa alusena ühegi navigatsiooni- ega ohutusotsuse tegemisel.

# text
seg-84d7260098b1 = MÄRKUS: intellektuaalomand Galileo OSNMA liideses

# text
seg-6d78ccef53d5 = Kshana ei anna mingeid õigusi Euroopa Liidu intellektuaalomandi alusel Galileo OSNMA Signal-in-Space Interface Control Documentis („ICD IPR-id“). ICD kannab oma enda volitust (selle lisa E), mis on mitteainuõiguslik ja tasuta ning millel on oma tingimused, ulatus ja piirangud. Igaüks, kes kasutab, ehitab või levitab sellel moodulil põhinevat tarkvara, tugineb otse sellele volitusele ja peab selle tingimused ise läbi lugema ja vastu võtma. Kshana litsents (AGPL-3.0-only või kommertslitsents) katab ainult Kshana enda koodi.

# text
seg-c13ad334bf9a = See moodul realiseerib algoritme, mida allpool toodud dokumendid kirjeldavad. ICD teksti ei reprodutseerita; arvväärtused (väljade paigutused, loendid, MAC-i otsingutabel) on väljendatud Kshana enda tähistuses, allikas viidatud koodis. ICD ja vastuvõtja juhised on © Euroopa Liit; allikat tunnustatakse siin. Kshanat ei arenda, kasuta, kiida heaks ega toeta Euroopa Liit, Euroopa Komisjon, EUSPA ega ükski muu asutus.

# text
seg-860096b04999 = Viitedokumendid

# text
seg-04c1e1a6278d = Avaldanud Euroopa GNSS-teenuskeskus.

# text
seg-278dd0f9df58 = Dokument

# text
seg-3427e40d7bee = Kuupäev

# text
seg-54d15cb428d3 = Galileo OSNMA Signal-in-Space ICD („SIS ICD“)

# text
seg-f63fbc1175cf = Väljaanne { "1.1" }

# text
seg-fa85e4db2c93 = oktoober { "2023" }

# text
seg-b89aa2b88558 = Galileo OSNMA vastuvõtja juhised

# text
seg-907e4e46056c = Väljaanne { "1.3" }

# text
seg-a9b75bc7f063 = jaanuar { "2024" }

# text
seg-530ae6421157 = Koodis ja siin viidatud jaotiste ja tabelite numbrid viitavad nendele versioonidele.

# text
seg-143726cc3d5f = Mida kontrollitakse

# text
seg-029a9bb7608f = Usaldusahel juurest andmeteni:

# text
seg-886f1b6556ce = <b>Avalik võti (ICD { "3.2.2" }, { "6.2" }).</b> DSM-PKR pannakse plokkidest uuesti kokku ja selle Merkle'i teed käiakse usaldatud Merkle'i juureni (SHA-256).

# text
seg-27b4935fe47b = <b>KROOT (ICD { "3.2.3" }, { "6.3" }).</b> DSM-KROOT pannakse uuesti kokku; selle ECDSA allkirja (P-256/SHA-256 või P-521/SHA-512) kontrollitakse nimetatud avaliku võtme vastu, NMA päise ja ahela parameetrite üle.

# text
seg-acc1f06cf63a = <b>TESLA võtmed (ICD { "5.5" }, { "6.4" }).</b> Iga MACK-sõnumis olev võti käiakse tagasi KROOT-ini või varasema kontrollitud võtmeni, ahela räsifunktsiooniga.

# text
seg-274285216a96 = <b>MACSEQ (ICD { "4.1.2" }, { "6.6" }).</b> Paindlikud Tag-Info väljad kontrollitakse MACSEQ vastu võtmega, mis selle MACK-i avab.

# text
seg-41ba810d7c8d = <b>Sildid (ICD { "4.2" }, { "6.7" }).</b> Iga silt arvutatakse uuesti (HMAC-SHA-256 või CMAC-AES, kärbitud ahela sildi pikkuseni) satelliitide identiteetide, alamkaadri aja, sildi positsiooni, NMA staatuse ja selle hõlmatud navigatsiooniandmete üle ning võrreldakse. ADKD { "0" } (efemeriid, kell ja staatus), ADKD { "4" } (ajastuse parameetrid) ja ADKD { "12" } (aeglane MAC, võti avaldatakse kümme alamkaadrit hiljem) on toetatud, koos selliste satelliitide ristautentimisega, mis ise OSNMA-d ei kanna, ja näivsiltidega (COP { "0" }).

# text
# c1: discarded
seg-1be16a4ca722 = Silt, mis nimetab reserveeritud väärtust või mille ADKD ei vasta MAC-i otsingutabeli pesale, jäetakse kõrvale (vastuvõtja juhised ütlevad selle kõrvale heita) ja sellest teatatakse kui <c1/>, mitte kui ebaõnnestumisest.

# text
# c1: bad_crc
seg-eb993b3a0d17 = Lehti kontrollitakse nende CRC vastu (Galileo CRC-24Q) enne kõike muud; ebaõnnestunud leht jäetakse välja ja sellest teatatakse (<c1/>).

# text
seg-c414a30d0840 = Staatuse väärtused

# text
# c1: authenticated
# c2: failed
# c3: tag_mismatch
# c4: macseq_mismatch
# c5: key_chain_mismatch
# c6: key_conflict
# c7: pending
# c8: no_chain
# c9: awaiting_key
# c10: no_nav_data
# c11: unknown_maclt
# c12: unsupported_function
# c13: service_not_usable
# c14: chain_mismatch
# c15: discarded
# c16: authenticated
seg-268f61b565b9 = Sildi kohta: <c1/>, <c2/> põhjusega (<c3/>, <c4/>, <c5/>, <c6/>), <c7/> põhjusega (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) või <c15/>. Näivsilt (COP { "0" }) kuvatakse sildi tasemel kui <c16/>, sest see tõestab võtit, kuid see ei hõlma ühtki navigatsiooniandmet ja seda ei arvestata kunagi satelliidi puhul.

# text
seg-331a6ab821f3 = Satelliidi kohta, kujul, mida vastuvõtja usaldusmonitor tarbib:

# text
# c1: Authenticated
seg-9912068c5b34 = <c1/> ainult seni, kuni uusim kontrollitud efemeriidi- ja kellaandmete (ADKD { "0" } või

# text
# c1: Unavailable
seg-38e7f56293e7 = selle satelliidi oma on hiljutine (vaikimisi kontrollija ajast mitte rohkem kui { "600" } s eemal) ja on endiselt kasutusel olevad andmed. Kontroll tehakse andmetele, mitte IODnav-ile: kontrollija hoiab autenditud bitijada (Word Types { "1" } kuni { "5" }, kuna ADKD { "0" } need hõlmab) ja uusima sellise satelliidi saadetud jada SHA-256 ning need peavad olema võrdsed. Kopeeritud IODnav muude sõnade kohal või muudetud Word Type { "5" } bitid (mis IODnav-i ei kanna) loetakse <c1/>-ks, kuni uued andmed autenditakse. Alamkaader, mis kannab efemeriidisõnu, kuid mitte täielikku Word Types { "1" } kuni { "5" } komplekti ühe IODnav-i all, võtab staatuse samal viisil ära (iga tõeline E1-B alamkaader kannab kõiki viit); see, millel pole efemeriidisõnu üldse, ei ütle midagi. Teise satelliidi sildid (ristautentimine) arvestatakse selle satelliidi kasuks, kelle andmeid need hõlmavad.

# text
# c1: Failed
seg-233109ef4428 = <c1/>, kui satelliidi andmete kontroll ebaõnnestus rikkemälu piires (vaikimisi { "600" } s kontrollija ajast), isegi kui hilisemad andmed kontrollitakse. Mittevastavus kirjutatakse selle satelliidi arvele, kelle andmeid silt hõlmab, ja selle satelliidi arvele, mis silti edastas, sest kumbki võis olla süüdi; MACSEQ mittevastavus kirjutatakse edastava satelliidi arvele.

# text
# c1: Unavailable
seg-8ba1d89bcf91 = <c1/> muul juhul ning iga satelliidi puhul pärast kontrollitud häiresõnumit, NMA staatusega „don't use“ või reserveeritud staatusega ja kuni esimene võti on kontrollitud.

# text
# c1: Failed
# c2: Authenticated
# c3: Unavailable
# c4: $PKSOS,<A|F|N>[,<sat>:<A|F|N>...]
# c5: kshana::osnma::pksos_sentence
seg-7fceea6e23f8 = Üldväärtus on <c1/>, kui mõni satelliit ebaõnnestus, <c2/>, kui vähemalt üks on autenditud ja ükski ei ebaõnnestunud, muul juhul <c3/>. <c4/> on vastav lause; <c5/> ehitab selle.

# text
seg-446a3218ccbb = Aeg

# text
# c1: set_reference_time
# c2: --reference-time
seg-18e91e6aa160 = Võtmeahel näitab, et võti kuulub antud alamkaadrisse, mitte seda, et alamkaader on praegune. Seetõttu ei võta kontrollija kunagi „praegust“ aega kontrollimata lehelt. Selle aeg on hilisem kahest: võrdlusaeg, mis on antud käsuga <c1/> (<c2/>), ja viimase kontrollitud TESLA võtme alamkaader (võtit ei saa teada enne selle pesa, seega see tõestab, et aeg ei ole varasem). Rikkemälu, autentimise kehtivusaken ja vanade andmete väljaviimine töötavad selle aja järgi. Alamkaader, mille tempel on rohkem kui kolm alamkaadrit viimasest kontrollitud võtmest hilisem, jäetakse kõrvale, välja arvatud juhul, kui selle enda võti tõestab selle aja; selles olevaid võtme- ja häiresõnumeid töödeldakse siiski, sest need kannavad oma tõestust (allkirja või Merkle'i juurt).

# text
# c1: set_reference_time
# c2: poll_clock
# c3: KeyStall
seg-318323322a3a = Kell seisab paigal, kui OSNMA lakkab, sest seda liigutavad ainult võtmed. Reaalajas kutsuja peab iga alamkaadri järel kutsuma <c1/> hostiajaga; autentimine aegub siis ise ja <c2/> (käitatakse samuti iga alamkaadriga) tagastab sündmuse <c3/>, kui ükski võti ei ole kontrollitud kauem kui autentimise aken.

# text
# c1: freshness: NOT enforced
seg-5338d8f5de77 = Mida see ei anna, on värskus. Ilma võrdlusajata allikast, mida ründaja ei saa liigutada, autenditakse vanade autentsete andmete kordusesitus vanade templite all ja lehetemplid on sama head kui nende allikas: käsurida ütleb seda (<c1/>) alati, kui võrdlusaega ei ole antud. Võrdlusajaga on tolerants alla ühe alamkaadri (vaikimisi { "29" } s; suuremad väärtused lükatakse tagasi). Võrdlusaeg on üks hetk: sellest tolerantsist kaugemal olevad alamkaadrid jäetakse kõrvale ja loendatakse, seega sobib see reaalajas või just salvestatud andmetele, mitte pikale salvestusele. Salvestuse puhul tuleb võrdlusaeg ära jätta ja lugeda tulemust kui „autentne, mitte tingimata värske“. Vastuvõtja juhised annavad ametliku nõude.

# text
seg-aa37ce329914 = u-blox voo lehetemplid pärinevad autentimata andmetest endist (vt Sisend), seega ei paku need samuti värskuskaitset.

# text
seg-a33d72076025 = Ahelad, võtmed ja häired

# text
# c1: chain_mismatch
seg-be2d9588df65 = Kontrollitud ahelaid hoitakse ahela id (CID) järgi; silte kontrollitakse ahelaga, mille NMA päis nimetab, ja päis, mis nimetab kontrollimata ahela, jätab alamkaadri sildid kontrollimata (<c1/>). Kehtiva ahela teine KROOT lisab ankru; teise ahela KROOT hoitakse kõrval, seega vana ahela uuesti väljakuulutamine pärast uuendamist ei tühista uut.

# text
# c1: stale
seg-bbb6574fa258 = NMA päist ei autendita, seega see, mida see kuulutab, loeb ainult kinnitatuna: kui rohkem kui üks satelliit saadab samas alamkaadris sama päise või kui kontrollitud KROOT-i allkirjastatud sõnum seda kannab (päis on selle sõnumi osa). Need kaks ei ole võrdsed. Mitme satelliidi nõustumine kaitseb üksiku satelliidi anomaalia vastu, mitte spuufija vastu: üks spuufija võib võltsida kaks satelliidi id-d. See annab talle teenusetõkestuse ja midagi enamat, sest kinnitatud „don't use“ tühistab iga satelliidi autenditud andmed: selle tühistamine, võltsitud või tõeline, ei taasta midagi, kuni uued sildid on tõeliste operatiivsete alamkaadrite all kontrollitud. (Enne seda tühjendamist võis võltsitud tühistamine tuua tagasi, kuni autentimise aknani, andmed, mis olid juba autenditud.) Tegelik kinnitus on KROOT-iga allkirjastatud päis, mis tühistab „don't use“ taas, kui see kannab operatiivset staatust. Üksiku satelliidi päis ei muuda midagi peale oma alamkaadri sildikontrolli. KROOT, mille kohaldatavuse aeg ei ole hilisem kui sama id jaoks hoitud ahela oma (vanema kordusesitus), lükatakse tagasi (<c1/>); sama ahela KROOT lisab ankru.

# text
seg-5c08dbaa8d43 = Kinnitatud päise staatus ja CPKS väärtus juhivad tühistamist. NMA staatusega „don't use“ viskab CPKS „chain revoked“ maha päise nimetatud ahela ja lükkab selle KROOT-i sellest ajast tagasi; CPKS „public key revoked“ viskab maha selle ahela allkirjastanud avaliku võtme ja iga sellega allkirjastatud ahela. Kui selle id asendusahel võeti kasutusele enne päise kinnitamist, olenemata sellest, kui kaua enne, on tühistatud võti eelmise ahela oma, mitte uue oma; see mälu hoitakse, kuni tühistamine on teostatud või kinnitatakse teise protseduuri päis, ja igas alamkaadris korduv tühistuspäis teostatakse üks kord. Samad CPKS väärtused staatusega operational tähistavad üleminekut asendusele ega tühista midagi. Päist ennast ei autendita, seega võltsitud tühistamine saab ainult autentimise ära võtta ja see on lõplik, kuni kontrollija taaskäivitatakse. See lõplikkus hõlmab ka kehtivat võtit: võltsitud avaliku võtme tühistamine lähtestab asendatud võtme mälu ja tühistab kasutusel oleva võtme ning ainult taaskäivitus teeb selle tagasi.

# text
# c1: Unavailable
seg-e7d43eb18c24 = NPKT { "4" } DSM-PKR on häiresõnum; see kontrollitakse Merkle'i puu kaudu nagu võti, selle juhuslik NPK väli on lehe osa. Kontrollitud häire tühjendab kõik ahelad ja avalikud võtmed, lükkab tagasi iga hilisema KROOT-i ja avaliku võtme ning muudab iga satelliidi <c1/>-ks, nagu vastuvõtja juhised ette näevad, kuni kontrollija taaskäivitatakse.

# text
seg-4068e9bda7c1 = DSM-KROOT-i täitevälja on allkirjastatud sõnumi ja allkirja räsi. Seda kontrollitakse enne allkirja ning see ütleb ka, millise NMA päisega allkirjastatud sõnum ehitati, kui päis muutus sõnumi koostamise ajal.

# text
seg-8ea31bf25ef0 = Mida ei kontrollita või ei katsetata

# text
seg-3d0808cab632 = <b>Värskus.</b> Vt Aeg ülal: see vajab võrdlusaega väljastpoolt.

# text
seg-b3d63950baa4 = <b>Uuendamine ja tühistamine.</b> Ahelaid ja võtmeid jälgitakse nii, nagu avaldatud vektorite vood neid katsetavad (uuendamine, ahela lõpp, ahela ja võtme tühistamine, uus avalik võti, uus Merkle'i puu, häire), mitte iga juhtumit, mida ICD lubab. Autentimata päise teatatud tühistamist võetakse sõna-sõnalt ja see on seansi jaoks lõplik. Uus Merkle'i puu võetakse kasutusele ainult kontrollijale antud Merkle'i juure kaudu.

# text
seg-f01d90a44585 = <b>Merkle'i puu räsi.</b> DSM-PKR sõnumeid kontrollitakse SHA-256 puuga. SHA3-256 puud, mida ICD tulevikus lubab, ei toetata. Ahela räsifunktsioon võib olla SHA-256 või SHA3-256.

# text
seg-d9ca4e69ffc9 = <b>Võtmestaatuse loendid.</b> Tühistamist jälgitakse NMA päise ja voos olevate sõnumite kaudu; sertifikaadi tühistusloendeid ei loeta.

# text
seg-73e0b16d03c7 = <b>Autenditud andmete katvus.</b> ADKD { "4" } paaritus alamkaadris saadetud COP { "1" } korral ei saa autentida (Word Type { "10" } võidakse saata üks või kaks alamkaadrit varem); see maksab ainult kättesaadavust, mitte kunagi õigsust.

# text
seg-acc28dcced83 = <b>Konstantse ajaga töö.</b> Ei ole pakutud ega vajalik: kontrollija ei hoia saladusi (ainult avalikud võtmed, avaldatud ahelavõtmed ja vastuvõetud andmed).

# text
seg-b2f8ec90ae39 = <b>Signaali ja andmete kvaliteet.</b> Lehti kontrollitakse CRC-ga ja häirelehed jäetakse välja, kuid signaali kohta, millel need saabusid, ei teata midagi. I/NAV sõnade { "1" } kuni { "4" } Reed-Solomoni taastamist ei kasutata: andmed tuleb vastu võtta otse.

# text
seg-97313ba2bf88 = <b>Mitte asukoha terviklikkuse teenus.</b> Autentimine ütleb, et andmed tulid süsteemist. See ei ütle midagi signaali kohta, millel need saabusid, ega fiksi kvaliteedi kohta.

# text
# c1: <svid> <gst_seconds> <60 hex digits>
# c2: #
# c3: gst_seconds
# c4: week * 604800 + time of week
seg-d696f298c4a2 = <b>Lihtne lehevorming.</b> Üks lehepaar real: <c1/>, <c2/> kommentaarid lubatud. <c3/> on GST sekundites (<c4/>) lehe alguses; kuueteistkümnendsüsteemi kood on paaris- ja paaritu poole { "240" } bitti (sabad kaasa arvatud), kõrgeim bitt ees.

# text
# c1: SVID,NumNavBits,NavBitsHEX
# c2: --start-gst
seg-e436d96b12cf = <b>Testvektorite CSV.</b> Avaldatud vektorite paigutus (<c1/>). Algusaeg tuleb võtmest <c2/> või kuupäevastatud failinimest.

# text
# c1: --format ubx
# c2: src/osnma/ubx.rs
# c3: src/realdata/ubx.rs
seg-72132e3796bc = <b>u-blox UBX-RXM-SFRBX.</b> Toores UBX baidivoog (<c1/>, tuvastatakse automaatselt). Galileo E1-B I/NAV sõnumid ehitatakse uuesti lehepaarideks (<c2/>); muud süsteemid, E5b, häirelehed ja vigase kontrollsummaga kaadrid ignoreeritakse. SFRBX ei kanna aega, seega iga leht templitakse oma andmetes oleva aja järgi (sõnatüübid { "5" } ja { "0" }) ning aktsepteeritakse ainult siis, kui järjestikused ajaga lehed ühtivad nende vahel vastuvõetud lehtede arvuga; lehed, mida ei saa paigutada, jäetakse välja, mitte kunagi ei arvata. See aeg tuleb andmetest endist ega paku värskuskaitset (vt Aeg ülal). Signaali id { "0" } (E1-C) ei kanna andmeid, seega selle aktsepteerimine E1-B kõrval on kahjutu. Eksinud sünkroonipaar absurdse pikkusega ei hoia lugejat tagasi. Raamimiskood on UBX raamimise kolmas koopia puus (<c3/>, receiver-trust sissevõtt); see hoitakse eraldi, et receiver-trust käitumine jääks muutmata, ja need kolm võiksid hiljem jagada ühte lugejat. SFRBX sõnumi sõnapaigutus on võetud avalikest kirjeldustest ja kontrollitud ainult sünteetilistel kaadritel, mitte reaalajas vastuvõtjal.

# text
# c1: --epochs
# c2: --json
seg-47118a577876 = Tekstiväljund annab staatuse satelliidi kohta ja võtmega <c1/> sildi ja epohhi kohta; <c2/> annab sama sildiloendiga. Väljumisstaatus { "3" } tähendab, et mõne satelliidi andmete kontroll ebaõnnestus, { "2" } tähendab kasutus- või sisendviga. Ülaltoodud nõuandev trükitakse esimesena igal teel, vead ja kasutus kaasa arvatud.

# text
seg-e2af23b756f5 = Pythonist ja WebAssemblyst

# text
# c1: kshana.osnma_verify(data, format="", start_gst=None, merkle_root_hex="", public_keys=None, reference_time=None, max_time_error=None)
# c2: osnma_verify(input_base64, format, start_gst, merkle_root_hex, public_keys, reference_time, max_time_error)
# c3: kshana osnma verify --json
seg-4edf83a818d1 = <c1/> (Python) ja <c2/> (WebAssembly) käitavad sama kontrollijat mälus olevatel baitidel ja tagastavad JSON-i, mida <c3/> trükib, nõuandev kaasa arvatud. MCP server seda ei kanna: sisend on pikk toores vastuvõtjavoog, mida teenindavad paremini käsurida ja Python, ning agendi tööriist lisaks suure sisendi pinna ilma kasuta. Kehtivad sama nõuandev ja samad piirangud; staatus ei ole navigatsiooni terviklikkuse teenus.

# text
seg-0987c3b00a14 = Testid ja testandmed

# text
# c1: tests/osnma_synthetic.rs
seg-2acc9fa7212b = Testandmed on sünteetilised ning genereeritud Kshana enda koodi ja testide poolt. Selles repositooriumis ei hoita ICD või juhiste vektoreid, läbitöötatud näiteid ega võtmematerjali. Vaiketestid (<c1/> ja ühiktestid) ehitavad võrranditest ahela, lehed ja sildid ning kontrollivad kooskõla ja seda, et tahtlik riknemine tabatakse: ümberpööratud navigatsioonibitt, ümberpööratud võtmebitt, kordusesitatud sildid, valed ajatemplid, võrdlusest väljas aeg, puuduvad andmed ning rünnakud, mille ülevaatus leidis (spuufitud kauge tuleviku alamkaader, mis ei tohi ebaõnnestumist kustutada, autentimine, mis peab aeguma ja järgima IODnav-i, häire, NMA staatus „don't use“, näivsildid, MACSEQ mittevastavus, vastuolulised võtmed, ahela tühistamine ja uuendamine, vigane täide või allkiri), kusjuures CMAC-AES, SHA3-256 ahel ja P-521 allkiri viiakse läbi kontrollija. Kuna need andmed pärinevad meie enda ICD lugemisest, näitab see enesekooskõla, mitte standardi järgimist.

# text
seg-4906b14a33a3 = Primitiive kontrollitakse avaldatud teadaoleva vastuse testide vastu, ühtki ei ole võetud ICD-st: RFC { "4231" } (HMAC-SHA-256), RFC { "4493" } (CMAC-AES-128), FIPS { "197" } (AES), FIPS { "202" } (SHA3-256) ja RFC { "6979" } (ECDSA P-256). P-521 allkirju kontrollitakse kodeeringu ja räsi valiku osas testis tehtud ühekordse võtmega; kõvera aritmeetika on teegi oma.

# text
# c1: tests/osnma_official_vectors.rs
# c2: KSHANA_OSNMA_VECTORS
seg-82ee90adf7ed = Standardi järgimist kontrollib <c1/>, mis on vabatahtlik: see loeb ametliku testvektorite arhiivi koopiat, mille tuleb ise alla laadida, kataloogist, mille nimetab <c2/>, ega tee midagi, kui muutuja on seadmata. See ei salvesta ega levita midagi ja vaiketestide käitused ei kasuta võrku. See annab kontrollijale ainult Merkle'i juure ja ühe puu avalikud võtmed, nagu vastuvõtjal oleks, seega ahelad luuakse voos olevast allkirjastatud DSM-KROOT-ist ja kogu tee käitatakse: Merkle, allkiri, võtmeahel, MACSEQ ja sildid. See kinnitab vektorikomplekti kohta autenditud siltide alampiiri, et ükski ei ebaõnnestunud, millised ahelad ja võtmed voog kuulutab, ADKD { "0" }, { "4" } ja { "12" } autenditud sildid, et autentimine jätkub pärast ahela lõppu, ahela tühistamist, võtme tühistamist ja uut avalikku võtit, et häiresõnum kontrollitakse ja jätab midagi autentimata, ning et iga vektor kasutab ainult HMAC-SHA-256, SHA-256 ahelat, 128-bitiseid võtmeid, 40-bitiseid silte ja otsingukirjeid { "33" } ja { "34" }. ICD muud algoritmi- ja parameetrivalikud on seega kaetud ainult ülaltoodud teadaoleva vastuse ja sünteetiliste testidega.

# text
seg-70bb026ce655 = Sõltuvused

# text
# c1: hmac
# c2: cmac
# c3: aes
# c4: sha3
# c5: p256
# c6: p521
# c7: ecdsa
# c8: sha2
# c9: wasm32-unknown-unknown
# c10: cargo deny
seg-00a3dd901039 = RustCrypto crates, puhas Rust, MIT OR Apache-2.0, ehitatud ilma vaikefunktsioonideta: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> ja <c6/> (funktsioon <c7/>, kasutatud ainult kontrollimiseks), lisaks puus juba olevale <c8/>. Need ehitatakse sihtmärgile <c9/> ja läbivad <c10/>.

# text
seg-7ab62b91d469 = <s1>Eelmine</s1>Usaldus turvatelemeetriana

# text
seg-5dc48294fbb2 = <s1>Järgmine</s1>LunaNet täiendatud edasisignaal
