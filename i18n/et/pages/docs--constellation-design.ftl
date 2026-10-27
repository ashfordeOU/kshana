# docs--constellation-design: translations (et)

# text
seg-f63dd3d7aad4 = Allikas

# text
# c1: docs/CONSTELLATION-DESIGN.md
seg-8f0e4021404d = Allikas: <c1/>

# text
# c1: constellation-design
# c2: src/body.rs
# c3: solar-system
# c4: body-pnt
# c5: src/constellation.rs
seg-44196ab9678c = Stsenaariumi liik <c1/> ehitab ühe või mitu satelliidikonstellatsiooni Maa, Kuu, Marsi või mis tahes muu Päikesesüsteemi kataloogi keha (<c2/>: kaheksa planeeti, Pluuto, Kuu, Phobos, Deimos, neli Galilei kuud ja Titan, samade konstantidega, mida kasutavad stsenaariumi liigid <c3/> ja <c4/>; vt <a1>SOLAR-SYSTEM.md</a1>) ümber ja kaardistab nende katvuse ja täpsuse halvenemise teguri (DOP) laius-/pikkuskraadi ruudustikul. Allikas: <c5/>.

# text
# c1: body
# c2: earth
# c3: duration_s
# c4: step_s
# c5: mask_deg
# c6: grid_step_deg
# c7: lat_min_deg
# c8: lat_max_deg
# c9: lon_min_deg
# c10: lon_max_deg
# c11: j2 = true
seg-61385c509a3d = Keha valitakse välja <c1/> abil (vaikimisi <c2/>). Käitus hõlmab kestust <c3/> (vaikimisi üks tähepäev, { "86 164" } s) sammuga <c4/> (vaikimisi { "600" } s), üle <c5/> (vaikimisi { "5" } kraadi), ruudustikul <c6/> (vaikimisi { "10" } kraadi), mida võivad piirata <c7/>, <c8/>, <c9/> ja <c10/>; <c11/> lisab sekulaarse triivi J2-st, keha gravitatsioonivälja teisest tsonaalharmoonilisest.

# text
seg-d02f6d747522 = Mis sisse läheb

# text
# c1: T/P/F
# c2: T
# c3: P
# c4: F
# c5: k
# c6: raan0 + k·ΔΩ
# c7: j
# c8: m0 + j·360·P/T + k·360·F/T
seg-743e68478333 = <b>Walkeri kestad</b> konventsioonis <c1/>: <c2/> satelliiti <c3/> võrdsete vahedega tasandil faasimisega <c4/>. <em>Delta</em> muster jaotab tõusvad sõlmed { "360" } kraadile, <em>star</em> muster { "180" } kraadile. Tasand <c5/> asub sõlmes <c6/> ja selle satelliit <c7/> keskmise anomaaliaga <c8/>.

# text
seg-d86b01d633a0 = <b>Selgesõnalised elementide komplektid</b>: poolsuurtelg või kõrgus, ekstsentrilisus, kaldenurk, tõusva sõlme rektastsensioon (RAAN), periapsise argument ja keskmine anomaalia.

# text
seg-0737ef1ddb72 = <b>Eelseaded</b> avaldatud nominaalsetest elementidest (ainult Maa; eelseade mõne muu keha ümber on viga):

# text
seg-587beeccaa11 = Eelseade

# text
seg-1ff32b87e030 = Satelliidid

# text
seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5. väljaanne, aprill { "2020" }, tabelid 3.2-1 ja 3.2-3

# text
seg-fb6956d09acc = { "24" } kuni { "30" }

# text
# c1: expanded
seg-f679ee0f3a3f = SPS PS tabel 3.2-2: kõik kuus laiendatavat pesa (B1, D2, F2, A2, C4, E3), mis on nimetatud väljal <c1/>, asendatakse nende ees- ja tagapaariga; vaikimisi kõik kuus

# text
seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), väljaanne { "1.1" }: Walker 24/3/1, poolsuurtelg { "29 599.801" } km, { "56" } kraadi (tabel { "1" }), tabeli { "23" } pesad

# text
seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), jaotis { "4.1" }: keskmine Maa orbiit (MEO) Walker 24/3/1 kõrgusel { "21 528" } km ja { "55" } kraadi, pluss kolm geostatsionaarset (GEO) satelliiti { "80" }, { "110.5" } ja { "140" } kraadi E juures ning kolm kaldega geosünkroonset (IGSO) satelliiti { "55" } kraadi juures

# text
seg-70a32cd2402d = GLONASS Interface Control Document (ICD), väljaanne { "5.1" } ({ "2008" }), jaotis { "5.2" }: pesavalem, { "19 100" } km, { "64.8" } kraadi

# text
seg-654d7aceff94 = GPS-i tabeli RAAN on inertsiaalne oma epohhil; eelseade teisendab selle Maaga seotud sõlme pikkuskraadiks tabelis toodud Greenwichi tunninurgaga ({ "100.765" } kraadi). GLONASS annab absoluutsed (Greenwichi) sõlmede pikkuskraadid otse. Galileo dokument ei anna tunninurka, seega kasutatakse selle RAAN-i sõlme pikkuskraadina. BeiDou standard ei anna MEO faasi ega IGSO sõlmi; eelseade alustab MEO mustrit sõlmes { "0" } ja keskmise anomaaliaga { "0" } ning paneb kolm IGSO-d ühele maapinnajäljele, mis ristub ekvaatorit { "118" } kraadi E juures. Need kaks valikut on modelleeritud.

# text
# c1: clock = "per-constellation"
# c2: clock = "common"
seg-b2bbdd23c13b = Mitu konstellatsiooni võivad jagada ühte käitust. Valikuga <c1/> (vaikimisi) hindab vastuvõtja ühte kella nähtava süsteemi kohta, nagu teeb multi-GNSS (ülemaailmne satelliitnavigatsioonisüsteem) vastuvõtja; <c2/> jagab ühte kella.

# text
seg-27db52482bdd = Mis välja tuleb

# text
# c1: pdop_threshold
# c2: track_points
# c3: max_tracks
seg-2405196cfccb = Ruudustiku lahtri kohta: keskmine, vähim ja suurim satelliitide arv maski kohal; epohhide osa lahendiga ja asukoha DOP-iga (PDOP) väärtusel <c1/> või madalamal; keskmine geomeetriline, asukoha, horisontaalne ja vertikaalne DOP (GDOP, PDOP, HDOP, VDOP); suurim PDOP. Globaalselt, kaalutuna laiuskraadi koosinusega, nii et iga lahter loeb oma pindala järgi: kättesaadavus, halvima koha kättesaadavus ning iga DOP-i keskmine, mediaan, 90., 95. ja 99. protsentiil ning maksimum. Satelliidi kohta: allavalimitud maapinnajälg (<c2/> valimit, vaikimisi { "24" }, kuni <c3/> satelliidi jaoks, vaikimisi { "120" }). Diagramm on kaks kaarti, kättesaadavus ja keskmine PDOP.

# text
seg-6cb532d0bca9 = Kuidas see skaleerub

# text
# c1: r
# c2: ε
# c3: λ = arccos((R/r)·cos ε) − ε
# c4: cos λ
# c5: φ
# c6: λ_max
# c7: φ
# c8: work
# c9: leo-pnt-mega-shell
seg-988ae3272c1f = Satelliit raadiusel <c1/> on kõrgusmaski <c2/> kohal täpselt siis, kui selle kesknurk kasutajast on kuni <c3/>, nii et nähtavuse test on üks skalaarkorrutis väärtusega <c4/>. Igal epohhil sorditakse satelliidid ka alamsatelliidi laiuskraadi järgi ja ruudustiku rida laiuskraadil <c5/> testib ainult satelliite, mis on <c6/> piires väärtusest <c7/>. Mõlemad on täpsed sfäärilise keha puhul ja ühiktest võrdleb iga kaarti toore jõu skaneeringuga otsese kõrgusetestiga. Plokk <c8/> annab paaritestide arvu, mida toore jõu skaneering teeks, ja tegelikult tehtud testide arvu. Ühiktesti { "5" } 000 satelliidi disain { "10" } kraadi ruudustikul ({ "648" } punkti, { "6" } epohhi) säilitab { "9.9" } % toore jõu { "19 440 000" } paaritestist; kaasasolev stsenaarium <c9/> ({ "5 000" } satelliiti, { "648" } punkti, { "12" } epohhi) käitub umbes { "0.14" } s Apple-silicon sülearvutil väljalaske käsurea binaariga. Seinakella ajad varieeruvad masina ja selle koormuse järgi. Mootor ei kasuta lõimi, kella ega failisüsteemi, seega töötab see muutmata kujul WebAssemblyna.

# text
seg-abba032ee1c7 = Mida kontrollitakse ja mille vastu

# text
seg-2342ed239300 = VALIDATED, avaldatud dokumentide vastu:

# text
seg-dc7fe92fcf05 = Walkeri generaator taastoodab kõik { "24" } rida Galileo OS SDD tabelist { "23" } ja GLONASS ICD pesavalem on sama { "24" } pesa komplekt mis Walker 24/3/1;

# text
seg-686f9543c7c9 = GPS-i eelseade taastoodab SPS PS tabelite 3.2-1 ja 3.2-2 maapinnajälje ekvaatori ületuse veeru: { "35" } kohta { "36" }-st { "0.0108" } kraadi piires { "0.015" } kraadise ümardamislävendi vastu. E3F-i hoitakse lõdvema { "0.06" } kraadise läve all, sest tabeli enda E3F rida ei ole kooskõlas selle RAAN-i ja laiuskraadi argumendiga: selle laiuskraadi argument on { "14.60" } kraadi E3-st ees, mis nihutab ületust { "7.30" } kraadi, samas kui tabel nihutab seda { "7.36" } kraadi;

# text
seg-dc2756c75401 = GPS-i baasjoon SPS PS lisa B tingimustel (üks tähepäev, { "287" } sammu viie minuti kaupa, { "4" } kraadi ruudustik, kõik nähtaval, { "5" } kraadi mask) annab globaalse HDOP-i mediaaniks { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } ja keskmiseks { "0.965" }, avaldatud { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } ja { "0.96" } vastu (lävi { "0.03" }, fikseeritud enne esimest käitust). PDOP-i mediaan { "1.795" } on alla tabeli B.3-1 väärtuse { "1.815" }, mis kirjeldab halvenenud 20-24 satelliidi segu. PDOP { "6" } või vähem kehtib { "100" } % ajast, võrreldes { "98" } % globaalselt ja { "88" } % halvimas kohas tabelis 3.8-1.

# text
seg-9aac9d8aa228 = Kontrollitud käsitsi tuletusega, mitte välise dokumendiga: ühe epohhi DOP ühtib kinnise valemiga ühe seniidis oleva ja kolme { "30" } kraadi kõrgusel oleva satelliidi jaoks (PDOP 8/3, GDOP { "3.0732" }).

# text
seg-d946dad08e23 = MODELLED: kahe keha orbiidid valikulise sekulaarse J2 triiviga; sfääriline keha; ainult geomeetriline nähtavus (signaali võimsust, satelliidi tervist ega maastikku pole); kolmanda keha häiringut pole, millest sõltub päris Kuu külmutatud orbiit. Halvim üksik aja-ruumi punkt sõltub ruudustikust: HDOP { "2.40" } ja VDOP { "5.22" } siin vs { "2.49" } ja { "5.43" } avaldatud; neid esitatakse, mitte ei fikseerita. Nelja süsteemi eelseaded pärinevad erinevatest etalonepohhidest, seega nende suhteline faas ühes käitus ei ole ühegi kuupäeva hetktõmmis.

# text
seg-a6c63abeb7e6 = Kaasasolevad stsenaariumid

# text
seg-3e6a942c84d4 = Iga rida annab selle, mida käitus prindib versiooniga kshana { $version }.

# text
# c1: scenarios/constellation-multi-gnss-coverage.toml
seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou ja GLONASS ({ "102" } satelliiti) ühe päeva jooksul { "10" } kraadise maski kohal, üks kell süsteemi kohta. Kättesaadavus (PDOP { "6" } või vähem) { "100" } % globaalselt ja halvimas kohas, PDOP-i mediaan { "0.95" }, keskmiselt { "31.0" } satelliiti nähtaval.

# text
# c1: scenarios/leo-pnt-mega-shell.toml
seg-b65ade1eab04 = <c1/>: { "5 000" } satelliiti neljas madala Maa orbiidi (LEO) kestas positsioneerimiseks, navigatsiooniks ja ajastuseks (PNT), J2-ga, { "20" } kraadise maski kohal. Kättesaadavus (PDOP { "3" } või vähem) { "99.22" } % globaalselt ja { "0" } % halvimas kohas, PDOP-i mediaan { "1.11" }, keskmiselt { "39.4" } satelliiti nähtaval.

# text
# c1: scenarios/lunar-relay-constellation.toml
seg-7d860ca30360 = <c1/>: { "8" } satelliiti elliptilistel Kuu külmutatud orbiitidel ja 6 satelliidist koosnev ringkest Kuu ümber. Kättesaadavus (PDOP { "6" } või vähem) { "21.33" } % globaalselt ja { "0" } % halvimas kohas, PDOP-i mediaan { "5.22" }, keskmiselt { "3.2" } satelliiti nähtaval.

# text
# c1: leo-pvt
# c2: scenarios/polar-arctic-leo-coverage.toml
seg-0c331bea1f52 = LEO-PNT katvus polaar- ja Arktika kasutajatele keskmise Maa orbiidi GNSS-i vastu on stsenaariumi liigi <c1/> polaarrežiim (<c2/>; vt <a1>LEO-PNT.md</a1>).

# text
seg-9aab3bf49146 = <s1>Eelmine</s1>Liidetud MEO ja LEO positsioneerimine

# text
seg-9f717b9015e1 = <s1>Järgmine</s1>Kvantsensorite mudelid
