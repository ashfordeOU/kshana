# docs--lunanet-afs: translations (et)

# text
seg-33f4c7af9c53 = Kandelaine

# text
seg-53a7343c076e = Väide

# text
# c1: docs/LUNANET-AFS.md
seg-da9970bcbab7 = Allikas: <c1/>

# text
# c1: lunanet-afs-check
seg-4013a17a3517 = LunaNet Augmented Forward Signal: koodid, sõnumivorming ja <c1/>

# text
seg-c1a27b995345 = Kshana realiseerib LunaNet <b>Augmented Forward Signal (AFS)</b> hajutuskoodid ja sõnumikihi nii, nagu spetsifikatsiooni üks väljaanne neid määratleb, ning kontrollib end selle väljaande trükitud tabelite vastu.

# text
# c1: 986e0795…e61b6
seg-e9bd99bbddb5 = <b>Fikseering.</b> LunaNet Interoperability Specification (LNIS) <b>versioon { "5" }</b>, Applicable Document { "1" } Volume A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>versioon { "1.0" }, { "29" }. jaanuar { "2025" }</b> (NASA). Hangitud 2026-10-18; PDF-i SHA-256 <c1/> (<a1>päritolu</a1>). Hilisem väljaanne on teine fikseering ja võib koode muuta: dokument märgib oma koodtabelid { "{" }LSIS-TBC{ "}" } ja ütleb, et need on „included to facilitate test and integration efforts only“. Iga aruanne nimetab seda väljaannet.

# text
seg-6845e671bf24 = Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.

# attr:alt
seg-69a98d01f489 = LunaNet AFS koodigeneraator, mida on kontrollitud spetsifikatsiooni trükitud veergude vastu, mootori v{ $version } tegelikust käivitusest (`kshana lunanet-afs-check spec`, fikseeritud versioonile LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, { "29" }. jaanuar { "2025" }; dokument märgib oma koodtabelid { "{" }LSIS-TBC{ "}" }). { "9" } kontrollist { "10" }-st on täidetud; B4 on NOT MET ({ "420" } { "421" }-st kattus). See kontrollib sümbolivoogu avaldatud spetsifikatsiooni ühe väljaande vastu ega ütle midagi ühegi LunaNet-i sõlme ega teenuse kohta. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. See kontrollib sümbolivoogu avaldatud spetsifikatsiooni ühe väljaande vastu ega ütle midagi ühegi LunaNet-i sõlme ega teenuse kohta.

# text
seg-4c3f77d97294 = Mis on realiseeritud

# text
seg-a0b684e44fb0 = Kiht

# text
seg-5d987fca539c = Mis

# text
seg-df52127d74b6 = Kus

# text
seg-637035a0b1c1 = AFS-I (andmed)

# text
seg-dbee58df4c92 = Gold-kood { "2047" }, lühendatud tsükliga { "2046" } kiibini, G2 viivitatud PRN-i kohta eraldi kiipide arvu võrra, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } sümbolit/s, PRN { "1" } kuni { "210" }

# text
# c1: iq::signals::lunanet::afs_i
# c2: lunanet-afs-i
seg-d4480ead20d1 = <c1/>, signaali nimi <c2/>

# text
seg-6d84dce7f6d0 = AFS-Q (pilootsignaal)

# text
# c1: afs_q
# c2: lunanet-afs-q
# c3: afs_q_tiered
seg-2ebf619c9cb6 = Weili kood { "10230" } (GPS L1C konstruktsioon), mis on kihistatud 4-kiibise sekundaarkoodiga (S0 kuni S3) ja 1500-kiibise tertsiaarse Weili koodiga ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), andmeteta. <c1/> ja signaali nimi <c2/> on vastuvõtja koopia, primaarne x sekundaarne ({ "8" } ms): { "12" } s tertsiaarne kaadrisünkroniseerimise ülekate on sellest välja jäetud, sest hõivamine ja jälgimine ei korreleeru { "12" } s koopiaga. <c3/> on täielik { "12" } s kood

# text
seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

# text
seg-906440b861cd = Kaader

# text
seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } põimitud sümbolit = { "6000" } sümbolit = { "12" } s kiirusel { "500" } sümbolit/s

# text
seg-a242d95d701f = { "9" } bitti (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generaator { "763" } kaheksandsüsteemis, dokumendi 256-hüpoteesilise korrelatsiooni dekooderiga

# text
seg-df8894e1304f = CRC

# text
seg-a04ccd611398 = CRC-24Q, generaator ({ "1" }+X)P(X) (lisa H)

# text
seg-e225f10d7848 = Põimija

# text
seg-cb075da6f8cf = { "60" } rida x { "98" } veergu, kirjutatud ridade kaupa ja loetud veergude kaupa

# text
# c1: kshana iq scene
# c2: acquire
# c3: track
# c4: sweep
# c5: kshana iq acquire --signal lunanet-afs-i
seg-d544025254af = Mõlemad komponendid võetakse vastu käskudega <c1/>, <c2/>, <c3/> ja <c4/> nagu iga teine signaal, nii et salvestusest saab otsida AFS-I või AFS-Q (<c5/>) ning tarkvaravastuvõtja testideks saab teha sünteetilise stseeni. Sünteetiline stseen on nagu kõigi teiste signaalide puhul fail tarkvaravastuvõtjale; siin ei juhita ühtegi raadioseadet.

# text
seg-6d7a9d17946d = Mis <b>ei</b> ole realiseeritud

# text
# c1: lunanet-afs-check symbols
seg-95731dbf3333 = <b>Alamkaadrite { "2" } kuni { "4" } kiirusega 1/2 LDPC-kodeerimine.</b> Selle kontrollmaatriksid on lisas { "1" }, eraldi failis, mida PDF-is ei ole ja mida ei hoita kaasatuna. Alamkaadreid { "2" } kuni { "4" } kantakse ja kontrollitakse läbipaistmatute sümbliplokkidena määratud pikkusega ning nende sees olevaid CRC-24Q sõnu ei kontrollita. Voogu, mis läbib käsu <c1/>, ei ole näidatud kehtivaid koodsõnu sisaldavana.

# text
seg-67bb5d1038c7 = <b>Sõnumi sisu</b> (MSG-G1, MSG-G2, MSG-G4, ...): dokument jätab mitu määratlust kirjutamata (TBW).

# text
# c1: afs_q(prn)
# c2: afs_q_with
# c3: afs_q_tiered
seg-bff5304c6187 = <b>Koodide omistamine LunaNet-i sõlme kohta</b> (tabel F-1 on TBD). PRN-idel { "1" } kuni { "12" } on esialgsed testomistused (tabel { "11" }). <c1/> kasutab PRN-i <em>n</em> primaarkoodi koos sekundaarkoodiga S((n-1) mod { "4" }); PRN-ist { "12" } edasi on see selle realisatsiooni muster, mitte dokumendi oma. <c2/> ja <c3/> võtavad vastu mis tahes kombinatsiooni, mis tahes PRN-i tertsiaarkoodiga.

# text
seg-6588307842fe = Lingibilanss, signaali-ruumis viga, võimsus ja koherentsuse nõuded (LSIS-100 ja järgnevad).

# text
# c1: spec
# c2: --strict
seg-e0f2ddce6dff = <c1/> käivitab realisatsiooni dokumendi trükitud tabelite ja läbitöötatud näidete vastu (<a1>eelregistreerimise</a1> lävendid B1 kuni B10) ning prindib iga kohta selle arvu ja seisu. <c2/> lõpetab väärtusega { "1" }, kui iga lävi ei ole täidetud.

# text
# c1: symbols
# c2: 0
# c3: 1
seg-dafa47406a38 = <c1/> loeb range otsusega sümbolivoogu (tekst, mis koosneb märkidest <c2/> ja <c3/>; tühimärke ignoreeritakse) ning kontrollib sünkroniseerimismustrit, SB1 dekodeerimist, FID-i (määratletud on ainult { "0" }), TOI järjepidevust (kasv ühe võrra modulo { "100" }) ja kaadrite vahet ({ "6000" } sümbolit). See lõpetab väärtusega { "1" } igasuguse probleemi korral.

# text
# c1: generate
seg-f12425044025 = <c1/> kirjutab testvoo: dokumendi sünkroniseerimismustri, SB1 ja kaadri pikkused, koos <b>kohatäite</b> alamkaadritega { "2" } kuni { "4" } (LSIS-300 vahelduv täide, mitte LDPC-kodeeritud, sõnumita). See on sümbolid kontrollija või dekooderi testimiseks, mitte lainekuju; Kshana ei kirjuta ühtegi signaali.

# text
# c1: lunanet_afs_check_spec
# c2: lunanet_afs_check_symbols
# c3: lunanet_afs_generate
# c4: lunanet_afs_check
# c5: mode
# c6: /kshana-lunanet-afs-check
seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: samad nimed. MCP: <c4/> (<c5/> spec, symbols või generate). Plugin: <c6/>. Studio ja JetBrains: N/A (<a1>SURFACES.md</a1>).

# text
# c1: xval/lunanet-afs/PREREGISTRATION.md
# c2: tests/lunanet_afs_codes.rs
seg-2133870991ca = Lävendid, mis on sätestatud failis <c1/> enne generaatori olemasolu; testid failis <c2/>.

# text
seg-b74d5800a039 = Lävi

# text
seg-e75915599d5e = AFS-I esimesed ja viimased { "24" } kiipi, { "210" } PRN-i

# text
seg-f654db18922f = <b>MET</b>, { "420" } { "420" }-st

# text
seg-55d0d7168ceb = trükitud G2 algseisund on seisund pärast trükitud viivitust

# text
seg-41590da4d1ac = <b>NOT MET</b>, { "0" } { "210" }-st: väide oli suunalt vale. Post hoc (B1c, ei ole eelregistreeritud): trükitud seisund on seisund pärast { "2047" } miinus viivitus, { "210" } { "210" }-st

# text
seg-b94947c99f9a = Legendre({ "10223" }) võrdub tabeliga D-1

# text
seg-75c8da01c0f1 = MET

# text
seg-e3402e2420bd = AFS-Q primaarsed esimesed ja viimased { "24" } kiipi, { "210" } PRN-i

# text
seg-678604d6e463 = Legendre({ "1499" }) võrdub tabeliga E-1 ning tertsiaarsed esimesed ja viimased { "24" } kiipi, { "210" } PRN-i

# text
# c1: A14850
seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } { "421" }-st: Legendre'i jada kattub ja { "419" } { "420" }-st koodiveerust kattub. PRN-i { "147" } jaoks trükitud viimased { "24" } kiipi (<c1/>) on sama väärtus, mis on trükitud PRN-i { "151" } jaoks, mille koodi generaator taastoodab; kaks erinevat Weili indeksit ({ "607" } ja { "612" }) ei anna samu viimaseid { "24" } kiipi, seega on PRN-i { "147" } kirje kõige tõenäolisemalt dokumendi trükiviga. Seda ei saa lahendada ilma eraldi lisa { "3" } koodifailita. Fikseeritud testiga

# text
seg-aea9620e7bf1 = sekundaarkoodid S0 kuni S3 võrduvad tabeliga { "10" }

# text
seg-2996e986d247 = <b>MET</b> (dokumendi enda konstandid)

# text
seg-23c9277f62e6 = SB1 läbitöötatud näide jooniselt { "8" }

# text
seg-fb70493dcdcf = <b>MET</b>: 0x045 kodeerub väärtuseks 0x229F61DBB84A0 ja dekodeerub väärtusteks FID { "0" }, TOI { "69" } (üks näide)

# text
# c1: 123456789
seg-acce07c33dec = CRC-24Q kontrollväärtus sisendile <c1/>

# text
seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (kataloogi väärtus, väljaspool spetsifikatsiooni)

# text
seg-789b31d53873 = kaadriaritmeetika

# text
seg-5b5da00ad1c8 = põimimine ja seejärel lahtipõimimine

# text
seg-80f9cd313ec4 = <b>MET</b> (omadus, MODELLED)

# text
seg-92a7addfdb8c = sünkroniseerimismuster

# text
seg-215913f74706 = <b>MET</b> ({ "68" } sümbolit; ümberkirjutuse kontroll)

# text
# c1: tests/iq_signal_matrix.rs
seg-3b51bd143c19 = B1 kuni B4 on VALIDATED viidatud väljaande trükitud tabelite vastu, mille dokument märgib { "{" }LSIS-TBC{ "}" }. Stseeni-hõivamise-jälgimise ringkäik mõlema komponendi jaoks läbib samad lävendid kui teised signaalid (<c1/>).

# text
seg-9edb6e5771ca = <s1>Eelmine</s1>Galileo OSNMA kontrollimine

# text
seg-d0043d0f578a = <s1>Järgmine</s1>Jammertest kohtunikuna

# text
seg-52946c9ff62a = Mis ei ole realiseeritud

# text
seg-339c9eeb510b = kshana lunanet-afs-check
