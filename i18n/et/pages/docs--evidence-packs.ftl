# docs--evidence-packs: translations (et)

# text
seg-2247a2344710 = Tähendus

# text
seg-ade1d7072512 = vt allpool

# text
seg-245fe1f87b08 = Fail

# text
# c1: docs/EVIDENCE-PACKS.md
seg-802d8b6f3afd = Allikas: <c1/>

# text
seg-710e7e630acb = Tõendipaketid: GNSS-i usaldussündmuse allkirjastatud kirje

# text
seg-dbc796deac2a = <b>Pakett on tehniline kirje, mitte õiguslik arvamus.</b> See väidab, mida Kshana mootor arvutas kindlaksmääratud vastuvõtja logist kindlaksmääratud konfiguratsiooni korral, ning laseb igaühel kontrollida, et midagi pole hiljem muudetud. See ei ütle, mis sündmuse põhjustas, kes vastutas, kas mõni kohustus sai täidetud ega seda, et logi näitab seda, mida vastuvõtja tegelikult vastu võttis. Seda ütlevad nii manifest kui ka kokkuvõte.

# text
seg-d99cb540310c = Tõendipakett on mõeldud intsidendiaruande, kindlustaja või reguleerija küsimuse jaoks: „mida teie süsteem ütles GNSS-i signaali kohta nende kahe ajahetke vahel ja kas me võime seda kirjet usaldada?“

# text
seg-2fa31fe443b4 = Paketi tegemine

# text
# c1: --lab-attestation lab.toml
# c2: HARDWARE-SAFETY.md
seg-983924cb2eea = Laborisessioonist tehtud paketi puhul salvestab <c1/> operaatori avalduse seadistuse kohta (juhtmega või varjestatud, sumbuvus või korpus, mis RF-i kiirgas) allkirjastatud manifesti; vt <a1><c2/></a1>. See salvestatakse sellisena, nagu see on antud, ning seda ei kontrollita kunagi.

# text
# c1: --from
# c2: --to
# c3: --out
# c4: --created-utc
# c5: 2026-01-02T03:04:05Z
# c6: none
seg-f01e59c876a3 = <c1/> ja <c2/> on sekundid logi esimesest epohhist või ISO-8601 UTC-aeg, kui logi ütleb ise oma algusaja. <c3/> ei tohi juba faile sisaldada. <c4/> võtab vastu tegeliku UTC-aja, näiteks <c5/> (kõik muu lükatakse tagasi), või väärtuse <c6/>, mis jätab loomisaja välja ja teeb paketi bait-baidilt reprodutseeritavaks. Loomisaeg on see, mida allkirjastaja väidab; midagi ei kontrolli seda kella vastu, mille jaoks on valikuline ajatempli token.

# text
# c1: keygen
# c2: kshana
# c3: .gitignore
# c4: *.evidence-key
seg-c72ddd97ad0b = Võtmefail sisaldab 32-baidist Ed25519 algväärtust (seed) { "64" } kuueteistkümnendnumbrina; esitage oma võti (näiteks võtmehaldussüsteemis hoitav) või laske <c1/>-l see teha. <c2/> hoiatab, kui fail on teistele kasutajatele loetav. <c3/> välistab <c4/>; nimetage oma võti nii, kui see asub tööpuus.

# text
seg-077cbd944c5d = Mis on paketis

# attr:alt
seg-7cf2608b2b2f = Tõendipaketi struktuur. Vastuvõtja logi (NMEA, u-blox UBX, RINEX { "3" } või Androidi logi) ja ajaaken lähevad käsule kshana receiver-trust evidence, mis kirjutab seitse faili: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, manifest.sig ja valikuline timestamp.tsr. Manifest salvestab kogu logi ja iga faili SHA-256 ning failide üle räsiahela; allkiri katab manifesti. kshana evidence verify kontrollib allkirja, iga faili räsi, ahelat ja seda, et loetlemata faili pole, ning väljub koodiga { "0" }, kui kontroll õnnestus, { "1" }, kui midagi ebaõnnestus, ja { "3" }, kui allkirjastajat polnud kinnitatud. Pakett on tehniline kirje, mitte õiguslik arvamus.

# text
seg-e305279d5b11 = Sisu

# text
seg-05107c0bd3c8 = akna vastuvõtja logi toorbaidid

# text
# c1: geometry_model
# c2: [geometry]
seg-b19ce12544a5 = käivitatud stsenaarium (iga monitori lävi, sündmus ja võrdlusreegel), käivitatud monitorid, kalibreerimise lähtetase ja stsenaariumi räsi; laeva puhul ka nõuandev avaldus, mida kannab iga laeva väljund (nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade); alates versioonist { "0.36" } <c1/> (tegelikult kasutatud tabel <c2/>, geomeetriamonitori kaal, iga päritolu ja klassireeglid). Katalooginimed ja sisseehitatud andmed eemaldatakse.

# text
# c1: geometry
# c2: class
# c3: geometry
# c4: environment
# c5: inconsistency
seg-e3c2457161bc = iga akna epohh koos mootori statistikaga, alarmid (põhjused) ja usaldusseisund; alates versioonist { "0.36" } ka selle satelliidi <c1/> (hea, halvenenud koos põhjustega või teadmata, kui logi satelliidigeomeetriat ei anna) ja iga järelduse <c2/> (<c3/>, <c4/>, <c5/>)

# text
seg-2e309765271f = iseseisev, skriptivaba kokkuvõte: tuvastusandmed, räsid, tulemused, põhjused, geomeetriarada (epohhid geomeetriaoleku järgi), mis on eraldi järelduste klassidest ({ "0.36" }), iga lävi, epohhikaupa tabel ja kirje piirangud

# text
seg-467277f816d2 = mootori versioon, aken, loomisaeg, logi vorming ja nimi, <b>kogu logi SHA-256</b>, lõigu vahemik ja SHA-256, allkirjastaja avalik võti ja sõrmejälg, iga faili suurus ja SHA-256 ning failide üle räsiahel

# text
# c1: manifest.json
seg-7a92ff70ed7f = Ed25519 allkiri faili <c1/> täpsete baitide üle

# text
seg-b517814b077d = valikuline RFC { "3161" } ajatempli token

# text
# c1: byte-range
# c2: whole-log
seg-6ad4c5f3afbe = <b>Logilõik.</b> Lugeja teatab iga epohhi lähtebaitide vahemiku, nii et lõik on väikseim baitide vahemik, mis sisaldab kõiki akna epohhe (<c1/>): NMEA, u-blox UBX, RINEX { "3" } vaatlused ja Androidi logid. See räsitakse toorbaitidena, mitte kunagi dekodeeritud tekstina. Reaalajas voo või RINEX { "2" } puhul vahemikku pole; siis pakitakse kogu logi ja manifest ütleb <c2/> (aken piirab, millised epohhid raporteeritakse, mitte seda, millised baidid kaasatakse). Kokkuvõte ütleb, kumb kehtib. Lõik on akna baitide kirje, mitte iseseisev logi: näiteks RINEX-i lõigul puudub faili päis.

# text
# c1: link₀ = SHA-256("kshana- evidence-chain/1")
# c2: linkᵢ = SHA-256(linkᵢ₋₁ ‖ SHA-256(file) ‖ len(name) ‖ name)
# c3: chain_head
seg-c4c81cbd4981 = <b>Räsiahel.</b> Manifest loetleb failid kindlas järjekorras. <c1/>; iga faili puhul <c2/> (pikkus { "4" } baidina, big-endian). Viimane lüli on <c3/>. Faili ümberjärjestamine, eemaldamine või asendamine muudab ahelat; allkiri katab ahela.

# text
seg-1147c5b0d348 = Paketi kontrollimine

# text
seg-e716ddf7bcc9 = Väljumiskood { "0" } tähendab, et kontroll õnnestus; { "1" } tähendab, et midagi ebaõnnestus; { "2" } tähendab kasutusviga; { "3" } tähendab, et pakett on terve, kuid selle allkirjastajat polnud kinnitatud (vt allpool). Iga kontroll raporteerib läbimise, ebaõnnestumise või vahelejätmise ning iga ebaõnnestumine nimetatakse:

# text
seg-f6f2cebd9cb0 = Veakood

# text
seg-312a5d784f42 = manifesti ei saa lugeda

# text
# c1: manifest.json
seg-6f1b5d9d6711 = allkiri puudub, ei ole 64-baidine väiketähtedega kuueteistkümnendallkiri või see ei kontrolli faili <c1/> üle õigeks

# text
seg-129b78f142f1 = võti ei ole kehtiv või erineb esitatud võtmest

# text
seg-c86b25543d55 = loetletud fail puudub või erineb manifestist; fail nimetatakse

# text
seg-f98d26abf045 = fail on paketis, kuid mitte manifestis

# text
seg-842bac6a9e69 = lüli ei ole see, mida selle sisendid annavad; fail nimetatakse

# text
# c1: epochs.json
seg-413034467a64 = manifest on iseendaga või failiga <c1/> vastuolus

# text
# c1: --log
seg-ef4bfbedca33 = lipuga <c1/>: teie käes olev logi ei ole salvestatud logi või lõik ei ole selle logi see vahemik

# text
seg-dcd686ac77f7 = Mis tahes faili ühe baidi muutmine põhjustab kontrolli ebaõnnestumise vastava põhjusega: muudetud artefakt raporteeritakse selle faili räsi mittevastavusena ja mitte millegi muuna; muudetud manifest ebaõnnestub allkirja kontrollil. Räside ja ahela ümberarvutamine pärast faili redigeerimist ei aita ilma allkirjastamisvõtmeta; siis ebaõnnestub ainult allkiri.

# text
# c1: --pubkey
# c2: --allow-unpinned
# c3: --pubkey
# c4: .pub
seg-066fe7c07bf6 = <b>Kinnitage võti.</b> Ilma lipuga <c1/> tõendab pakett vaid seda, et see on terve oma enda nimetatud võtme suhtes, mille igaüks saab genereerida. Seepärast väljub kontroll siis koodiga { "3" } ja ütleb „INTACT, BUT THE SIGNER IS NOT PINNED“, mitte „VERIFIED“; <c2/> võtab paketi enda võtme teadlikult vastu ja prindib „VERIFIED against the key the pack names itself (signer NOT pinned; pass --pubkey)“. Hankige allkirjastaja avalik võti allkirjastajalt usaldatava kanali kaudu (mitte paketist) ja edastage see lipuga <c3/>: { "64" } kuueteistkümnendnumbrit või fail <c4/>. Privaatvõtme eksikombel edastamine tuvastatakse ja lükatakse tagasi. Sõrmejälg (võtme SHA-256 esimesed { "128" } bitti, { "32" } kuueteistkümnendnumbrit) prinditakse silmaga võrdlemiseks; kogu võtme kinnitamine on usaldusväärne tee.

# text
seg-a01c7ba606c9 = Paketi vorming ja kontrollimenetlus (normatiivne)

# text
seg-fa43e16b6aba = See jaotis on spetsifikatsioon, mille põhjal kirjutatakse sõltumatu kontrollija. Suurtähtedega sõnad on nõuded. Pakett on kataloog (või mis tahes kujutis failinimedelt baitidele), mille failid on nimetatud täpselt allpool toodud viisil; kontrollija töötab iga faili baitidega nii, nagu need on salvestatud, ega serialiseeri midagi uuesti.

# text
# c1: log-slice.bin
# c2: config.json
# c3: epochs.json
# c4: summary.html
# c5: manifest.json
# c6: manifest.sig
# c7: timestamp.tsr
seg-1fbabb3f1092 = <b>Failid.</b> Artefaktifailid selles kindlas järjekorras on <c1/>, <c2/>, <c3/>, <c4/>. Paketis on ka <c5/> ja <c6/> ning sellel VÕIB olla <c7/>. Mis tahes muu nimi on <em>loetlemata fail</em>.

# text
# c1: 0-9a-f
seg-3ed6e38ad2ee = <b>Kuueteistkümnendsüsteem.</b> Iga kuueteistkümnendsõne on ainult väiketähtedega <c1/>, ilma tühikuteta; suurtähti ei aktsepteerita. SHA-256 väärtused on { "64" } numbrit, avalik võti on { "64" } numbrit, allkiri on { "128" } numbrit.

# text
# c1: manifest.sig
# c2: manifest.json
# c3: \n
seg-6609210d003a = <b><c1/>.</b> 64-baidise Ed25519 allkirja (RFC { "8032" }, puhas Ed25519 skeem) 128-kohaline väiketähtedega kuueteistkümnendkuju faili <c2/> täpsete baitide üle, millele järgneb täpselt üks <c3/> ja mitte miski muu. Allkirja PEAB kontrollima rangelt: allkiri, mille S-väärtus ei ole väiksem rühma järgust L, on kehtetu.

# text
# c1: manifest.json
seg-b163e9f5db66 = <b><c1/>.</b> UTF-8 JSON-objekt. Selle liikmed (kontrollija PEAB leidma igaühe nimetatud JSON-tüübiga; lisaliikmeid ignoreeritakse):

# text
seg-ace92bcbfd8a = liige

# text
seg-04f69a0edb2f = tüüp

# text
seg-45425f378b61 = tähendus

# text
seg-6940543aa3c0 = string

# text
# c1: kshana-evidence/1
seg-48d303baac62 = PEAB võrduma väärtusega <c1/>

# text
seg-6e57561e7f01 = kirjeldav

# text
seg-abec93a4a488 = string või null

# text
seg-7d059c0b6372 = loomisaeg, kirjeldav

# text
# c1: {from_s, to_s}
seg-507d53a53380 = objekt <c1/>

# text
seg-bb2bcbbf404a = arvud, sekundid

# text
seg-64572c65426f = mittenegatiivne täisarv

# text
# c1: epochs.json
seg-14d421e391dd = JSON-massiivi kirjete arv failis <c1/>

# text
seg-f5e7215e6835 = objekt

# text
# c1: format
# c2: file_name
# c3: full_sha256
# c4: full_bytes
# c5: start_label
# c6: slice
seg-a4117217030c = <c1/> string, <c2/> string, <c3/> kuueteistkümnendsõne, <c4/> mittenegatiivne täisarv, <c5/> string või null ning <c6/>

# text
# c1: kind
# c2: byte-range
# c3: whole-log
# c4: start
# c5: end
# c6: sha256
seg-02389e71a339 = <c1/> (täpselt <c2/> või <c3/>; mis tahes muu väärtus muudab manifesti väära vormiga), <c4/> ja <c5/> mittenegatiivsed täisarvud (baidinihked, lõpp välja arvatud), <c6/> kuueteistkümnendsõne

# text
# c1: algorithm
# c2: ed25519
# c3: public_key
# c4: fingerprint
seg-6c9176965aae = <c1/> string (<c2/>), <c3/> kuueteistkümnendsõne ({ "32" } baiti), <c4/> string

# text
seg-dcba59304030 = objektide massiiv

# text
# c1: name
# c2: role
# c3: bytes
# c4: sha256
# c5: link
seg-e42ed5e07430 = üks iga artefaktifaili kohta, kindlas järjekorras: <c1/> string, <c2/> string, <c3/> mittenegatiivne täisarv, <c4/> kuueteistkümnendsõne, <c5/> kuueteistkümnendsõne

# text
seg-b79c9500b744 = kuueteistkümnendsõne

# text
seg-697592bd3757 = viimane lüli

# text
seg-9da5d92757bd = objekt, valikuline

# text
# c1: --lab-attestation
# c2: operator
# c3: organisation
# c4: date
# c5: setup
# c6: conducted
# c7: shielded
# c8: attenuation_db
# c9: enclosure
# c10: emitter
# c11: statement
# c12: signature
seg-2032c208038d = olemas ainult laborisessioonist tehtud paketis (<c1/>): operaatori avaldus <c2/>, <c3/>, <c4/>, <c5/> (<c6/> või <c7/>), <c8/> või <c9/>, <c10/>, <c11/> ja valikuliselt <c12/>, salvestatud sellisena, nagu see on antud. Seda katab manifesti allkiri ning seda ei kontrollita kunagi; kontrollija raporteerib seda kui „attested by the named operator; not verified by Kshana“. Muidu puudub ning ilma selleta pakett ei muutu

# text
# c1: signer.fingerprint
seg-9411be425a80 = <c1/> on SHA-256 esimesed { "32" } kuueteistkümnendnumbrit { "32" } avaliku võtme baidi üle.

# text
seg-80e55f2d3496 = Räsiahel.

# text
# c1: link0
# c2: kshana-evidence-chain/1
# c3: link = SHA-256( previous_link (32 bytes) ‖ SHA-256(file) (32 bytes) ‖ len(name) as 4 bytes big-endian ‖ name as UTF-8 )
# c4: SHA-256(file)
# c5: sha256
seg-9346fe50efac = <c1/> on { "23" } ASCII-baidi <c2/> SHA-256. Iga artefakti puhul järjekorras <c3/>, kus <c4/> võetakse manifesti salvestatud <c5/> sellele artefaktile (seega on ahel manifesti omadus ja seda kontrollitakse manifesti, mitte failide vastu).

# text
# c1: code
# c2: name
# c3: pin
seg-9dd985d8cb03 = <b>Menetlus.</b> Kontrollija sooritab need sammud järjekorras ja kogub kõik ebaõnnestumised; tulemus on ebaõnnestumiste <em>hulk</em>, kus igaüks on <c1/> ja, kus seda öeldakse, fail <c2/>. See EI TOHI peatuda esimesel ebaõnnestumisel, välja arvatud seal, kus seda öeldakse. <c3/> on avalik võti, mida kontrollijal kästi usaldada, kui üldse.

# text
# c1: manifest.json
# c2: manifest-missing
seg-abb1d2635143 = Faili <c1/> pole: ebaõnnestumine <c2/>; peatu.

# text
# c1: manifest.json
# c2: artifacts
# c3: log.slice
# c4: manifest-malformed
# c5: format
# c6: unsupported-format
seg-73a4aeb463e8 = Kui <c1/> ei ole JSON-objekt, millel on iga ülaltoodud liige nimetatud tüüpidega (sealhulgas <c2/> kirjed, millel on iga liige, ning <c3/>): ebaõnnestumine <c4/>. Muidu, kui <c5/> ei ole ülaltoodud väärtus: <c6/>.

# text
# c1: signer.public_key
# c2: public-key-malformed
# c3: signer.fingerprint
# c4: public-key-malformed
# c5: pin
# c6: public-key-mismatch
# c7: pin
# c8: pin
# c9: manifest.sig
# c10: signature-missing
# c11: \n
# c12: signature-malformed
# c13: public-key-malformed
# c14: manifest.json
# c15: signature-invalid
seg-36c9df2abf34 = Allkirjafaas. See faas sooritatakse sõltumata sellest, kas manifesti sai lugeda. Kui manifesti sai lugeda, on <em>nimetatud võti</em> <c1/>; kui see ei ole { "64" } väiketähtedega kuueteistkümnendnumbrit, ebaõnnestumine <c2/> (nimetatud võtit pole); muidu, kui <c3/> ei ole selle sõrmejälg, ebaõnnestumine <c4/> (võti jääb kasutatavaks). Kui on olemas nii <c5/> kui ka nimetatud võti ja need erinevad: ebaõnnestumine <c6/>. <em>Kontrollvõti</em> on <c7/>, kui see anti, muidu nimetatud võti, kui see on olemas; kummagi puudumisel kontrollvõtit pole (see hõlmab iga juhtu, kus manifesti ei saanud lugeda ja <c8/> polnud antud). Kui faili <c9/> pole: <c10/>. Muidu, kui fail ei ole täpselt { "128" } väiketähtedega kuueteistkümnendnumbrit pluss üks <c11/>: <c12/>. Muidu, kui on olemas kontrollvõti, mis ei ole kehtiv Ed25519 avaliku võtme kodeering: <c13/>. Muidu, kui on olemas kontrollvõti ja allkiri ei kontrolli rangelt faili <c14/> baitide üle (mis need ka ei oleks): <c15/>. (Kontrollvõtme puudumisel allkirja ei kontrollita ja selle kohta ebaõnnestumist ei tekitata.)

# text
# c1: manifest-malformed
seg-3dbe07af8fa8 = Kui manifesti ei saanud lugeda (samm { "2" } andis <c1/>): peatu siin.

# text
# c1: artifacts
# c2: artifact-list-malformed
# c3: file-missing
# c4: bytes
# c5: file-size-mismatch
# c6: sha256
# c7: file-hash-mismatch
seg-b7e03ef2dea5 = Artefaktid. Kui <c1/> nimed ei ole täpselt need neli ülaltoodud järjekorras: <c2/>. Seejärel iga manifesti kirje kohta järjekorras: kui paketis sellenimelist faili pole, <c3/> (nimi); muidu, kui selle pikkus erineb väärtusest <c4/>, <c5/> (nimi); ja sõltumatult, kui faili SHA-256 erineb väärtusest <c6/>, <c7/> (nimi).

# text
# c1: manifest.json
# c2: manifest.sig
# c3: timestamp.tsr
# c4: artifacts
# c5: unlisted-file
seg-24cda5a1d9d8 = Loetlemata failid: iga paketis oleva faili kohta peale <c1/>, <c2/>, <c3/> ja manifesti <c4/> nimede: <c5/> (nimi).

# text
# c1: artifacts
# c2: link0
# c3: sha256
# c4: manifest-malformed
# c5: link
# c6: chain-mismatch
# c7: chain_head
# c8: chain-head-mismatch
seg-d103ade9a7c7 = Ahel. Käige manifesti <c1/> järjekorras läbi alates väärtusest <c2/>. Kui kirje <c3/> ei ole { "64" } väiketähtedega kuueteistkümnendnumbrit: <c4/> ja ahelast loobutakse (pea kontrolli ei tehta). Muidu arvutage lüli; kui see erineb kirje väärtusest <c5/>: <c6/> (nimi). Pärast läbikäiku, kui ahelast ei loobutud ja viimane lüli erineb väärtusest <c7/>: <c8/>.

# text
# c1: slice-record-inconsistent
# c2: start > end
# c3: end > full_bytes
# c4: log-slice.bin
# c5: sha256
# c6: slice.sha256
# c7: bytes
# c8: end - start
# c9: kind
# c10: whole-log
# c11: start != 0
# c12: end != full_bytes
# c13: slice.sha256 != full_sha256
# c14: epochs.json
# c15: epochs_in_window
# c16: epoch-count-mismatch
seg-be9fade3f879 = Lõik ja epohhid. Tekitage <c1/> (põhjuse kohta mitte rohkem kui üks kord, ja kontrollija raporteerib koodi ühe korra, olenemata sellest, mitu põhjust kehtib), kui kehtib mõni järgmistest: <c2/>; <c3/>; kirje <c4/> väärtus <c5/> erineb väärtusest <c6/>; selle kirje <c7/> erineb väärtusest <c8/>; või <c9/> on <c10/> ja kehtib mõni väärtustest <c11/>, <c12/>, <c13/>. Kui <c14/> on olemas ja parsitakse JSON-massiivina, mille pikkus erineb väärtusest <c15/>: <c16/>.

# text
# c1: log.full_sha256
# c2: full-log-hash-mismatch
# c3: start..end
# c4: log-slice.bin
# c5: slice-not-from-full-log
seg-0dc49ed14c1f = Kogu logi. Ainult siis, kui kontrollijale anti algse logi baidid: kui nende SHA-256 erineb väärtusest <c1/>, <c2/>; muidu, kui vahemik <c3/> ei jää logi sisse või logi baidid seal erinevad failist <c4/>, <c5/>.

# text
# c1: timestamp.tsr
# c2: timestamp-missing
# c3: timestamp-malformed
# c4: manifest.json
# c5: timestamp-imprint-mismatch
seg-a7f787d6e6df = Ajatempel. Kui faili <c1/> pole: kui kontrollijale öeldi seda nõuda, <c2/>; muidu mitte midagi. Kui see on olemas: kui seda ei saa lugeda RFC { "3161" } tokenina või vastusena (vt allpool), <c3/>; muidu, kui selle sõnumijäljend ei ole jäljendi enda algoritmi (SHA-256, SHA-384 või SHA-512) järgi faili <c4/> baitide räsi: <c5/>.

# text
seg-f7d908c6bf38 = Pakett on kontrollitud täpselt siis, kui ebaõnnestumiste hulk on tühi. Kas allkirjastaja oli kinnitatud, raporteeritakse eraldi ja see ei muuda ebaõnnestumiste hulka.

# text
# c1: ContentInfo
# c2: id-ct-TSTInfo
# c3: TimeStampResp
# c4: PKIStatusInfo
# c5: TSTInfo
# c6: genTime
# c7: --tsa-ca
seg-b0d74519122d = <b>Ajatempli token.</b> Token on DER <c1/>, mille sisutüüp on CMS SignedData ({ "1.2.840.113549.1.7.2" }) ja mille kapseldatud sisu tüüp on <c2/> ({ "1.2.840.113549.1.9.16.1.4" }); vastus on DER <c3/> (<c4/>, millele järgneb token), mille olek on { "0" } või { "1" }. Struktuuri <c5/> sõnumijäljendi algoritm peab olema SHA-256, SHA-384 või SHA-512 selle algoritmi pikkusega räsiga ning selle <c6/> tegelik UTC kalendriaeg. Määramata pikkusega BER-i ei aktsepteerita. Autoriteedi allkirja ja sertifikaadiketti kontrollitakse ainult siis, kui on antud usaldusankrud (<c7/>, vt allpool).

# text
seg-2156bf4dabb3 = RFC { "3161" } ajatempel (valikuline)

# text
# c1: manifest.json
# c2: create_bundle
seg-27a71ea73d7d = Ajatempli autoriteedi ajatempli token näitab, et manifest oli olemas ajal, mida autoriteet tõendab. Token on faili <c1/> üle, seega taotletakse seda pärast paketi tegemist (paketi loomisel ei saa seda anda ja <c2/> lükkab tagasi tokeni, mis ei ole just selle manifesti üle):

# text
# c1: kshana evidence verify
# c2: manifest.json
# c3: authority_signature_verified: false
# c4: openssl ts -verify
seg-7ae6e0326b65 = <c1/> loeb tokeni (paljas token või täisvastus), kontrollib, et see anti välja ja et selle sõnumijäljend võrdub faili <c2/> räsiga, ning prindib selles öeldud aja. Ilma usaldusankruteta lisab see „timestamp authority signature not verified by Kshana“ ja raporteerib <c3/>; selle osa jaoks käivitage ülaltoodud rida <c4/>. Token, mille jäljend erineb, või token, mida ei saa parsida, on ebaõnnestumine. Tokeni sisutüüpe, jäljendi pikkust ja genereerimisaega kontrollitakse mõistlikkuse suhtes.

# text
# c1: --tsa-ca authority-ca.pem
# c2: verify
# c3: openssl ts -verify
# c4: genTime
# c5: timestamp-authority-invalid
# c6: authority_signature_verified
# c7: tests/fixtures/evidence_tsa/PREREGISTRATION.md
seg-88359c107bf1 = Lipuga <c1/> (üks või mitu PEM-sertifikaati, kõik usaldatud) kontrollib <c2/> ka autoriteeti, võrguühenduseta, nii nagu <c3/>: allkirjastatud atribuutide sõnumiräsi, allkirja (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 või P-384), ESS allkirjastamissertifikaadi sidumist, allkirjastaja kriitilist timeStamping laiendatud võtmekasutust ning ahelat isevälja antud ankruni, kusjuures iga sertifikaat on kehtiv tokeni <c4/> ajal. Ebaõnnestumine raporteeritakse kui <c5/> koos esimese ebaõnnestunud kontrolliga ja <c6/> on tõene ainult siis, kui kõik läbis. Tühistamist (CRL või OCSP) ei kontrollita. See kontrollija nõustub OpenSSL-iga { "3.0.13" } { "27" } isegenereeritud juhtumi puhul (<c7/>).

# text
# c1: verify
# c2: --require-timestamp
# c3: timestamp-missing
# c4: attach-timestamp
# c5: --replace
seg-f534ae37f10c = <b>Token asub allkirjastatud manifesti kõrval, mitte selle sees.</b> Allkiri ega ahel seda ei kata, seega saab tokeni eemaldada või asendada teise kehtiva tokeniga, ilma et allkiri ebaõnnestuks. <c1/> märgib seetõttu, kui paketil seda pole, ja <c2/> muudab puuduva tokeni ebaõnnestumiseks (<c3/>); asendatud tokeni tabab ainult see, kui see ei vasta manifestile. <c4/> keeldub olemasolevat tokenit üle kirjutamast, kui te ei anna lippu <c5/>. Kui ajatempel on teie jaoks oluline, hoidke token ja kontrollitulemus oma arhiivis ning nõudke seda.

# text
seg-b993ef559bd0 = Koodist

# text
# c1: kshana::evidence::build_receiver_trust_pack
# c2: create_bundle
# c3: verify_bundle
# c4: EvidenceInput
# c5: BTreeMap<String, Vec<u8>>
# c6: Files
# c7: VerifyReport
# c8: wasm32
seg-de24fd02c7c2 = <c1/> on ainus sisenemispunkt, mida käsurida ja iga muu pind paketi tegemiseks kutsub: sisendiks stsenaarium, logi baidid (ja RINEX-i puhul navigatsioonifaili omad), aken tekstina, pealkiri ja valikuline loomisaeg ning allkirjastamise algväärtus (seed); väljundiks failid, epohhide arv, lõik, manifesti räsi ja allkirjastaja sõrmejälg. See ei loe ühtegi faili ega kella, seega annavad samad sisendid samad baidid. Selle all on <c2/> ja <c3/> puhtad funktsioonid: sisendiks baidid (<c4/>, 32-baidine algväärtus, failide <c5/>), väljundiks serialiseeritavad tulemused (<c6/>, <c7/>). Need ei kasuta faile, kella ega protsessi olekut ning ehituvad sihtplatvormile <c8/>, nii et Pythoni, WebAssembly ja serveri pinnad kutsuvad neid muutmata. Käsurida on nende peal õhuke ümbris.

# text
seg-292a5bc48548 = Mida pakett ei tee

# text
# c1: config.json
# c2: kshana receiver-trust
# c3: epochs.json
seg-852aca7fc407 = See ei käivita hindamist uuesti. Igaüks, kellel on kogu logi ja <c1/>, saab käivitada <c2/> uuesti ja võrrelda failiga <c3/>; pakett tõendab, mis salvestati, mitte seda, et mootor oli õige.

# text
seg-91639deac47d = See ei tõenda, et logi on ehtne või täielik. Kogu logi räsi seob kirje ühe failiga; kust see fail pärines, peab kindlaks tegema operaator.

# text
seg-0f721c314fa1 = See ei sisalda mingit toimivusväidet häire tuvastamise ega tagasilükkamise kohta.

# text
seg-9c361736bf27 = See on tehniline kirje, mitte õiguslik arvamus ega sertifikaat.

# text
seg-68bcf43b4e27 = <s1>Eelmine</s1>Ridade katvus

# text
seg-09c0b5fa6e52 = <s1>Järgmine</s1>Optilised lingid läbi atmosfääri

seg-bd3169455cd0 = Tõendimärgis ({ "0.40" })

seg-6fe796d2b15f = Versiooniga { "0.40" } või hilisemaga ehitatud pakett kannab failis <c1/> kirjet <c2/> (tase, <c3/>, <c4/> või <c5/>, mis on selle ridade nõrgim staatus, ning nende kontrollimaatriksi ridade id-d ja nõuded, millele paketi sisu toetub: paketi terviklikkuse rida, receiver-trust read ning jammertest-scoring või round-trip read nende pakettide jaoks) ja <c6/> <c7/>. See on failis <c8/>, seega manifesti faili räsi, räsiahel ja allkiri katavad seda: selle muutmine ebaõnnestub kontrollimisel. <c9/> teatab taseme ja ridade id-d.

seg-15b4e784361a = Muudatus on lisanduv ja ainult edasi suunatud. Manifesti <c1/> jääb <c2/>: ülaltoodud normatiivne tekst ütleb, et kontrollija PEAB selle väärtuse leidma, ja kaustas <c3/> olev puhta ruumi kontrollija teeb seda. Väiksem versioon kantakse seega väljas <c4/> (puudub enne { "0.40" } tehtud paketil, tähendab { "1.0" }), mitte uues stringis <c5/>. Enne { "0.40" } tehtud pakett ei kanna silti ja kontrollitakse muutumatuna; <c6/> ütleb „no evidence label (pre-0.40 pack)“. Testid on <c7/> (kaasa arvatud kinnitatud pre-0.40 oraakelpaketid) ja <c8/>.

seg-218641620d3e = <s1>Järgmine</s1>Andmepartnerid ja edutavad read
