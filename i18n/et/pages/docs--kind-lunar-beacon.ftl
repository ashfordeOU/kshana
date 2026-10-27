# docs--kind-lunar-beacon: translations (et)

# text
seg-1f17ef6a853e = Mootori v{ $version } stsenaariumi liik, perekond <a1>Kuu ja tsislunaarne ruum</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-1c1eeb2dcaa0 = Perekonna leht: <a1>Kuu ja tsislunaarne ruum</a1>

# text
# c1: docs/kinds/by-kind/lunar-beacon.md
seg-3c4e3d725bb6 = Allikas: <c1/>

# text
# c1: lunar-beacon
seg-5e402fc935cb = <c1/> (stsenaariumi liik)

# text
seg-142ad48fe422 = Pinnamajakate täiendus Kuu orbitaalsele navigatsiooniteenusele, käivitatava enne/pärast tabelina. Lõunapooluse kasutaja näeb hõredat orbitaalset komplekti kitsal taevalaigul, seega on ulatuse mõõtmise geomeetria halvasti tingitud; mõned MÕÕDISTATUD PINNAMAJAKAD annavad madala elevatsiooni ja laia asimuudiga otsenähtavuse read, mida täielikult pea kohal olev komplekt ei oma, ning horisontaalne täpsuse halvenemise tegur kukub kokku. Stsenaarium esitab kolm konfiguratsiooni ühel epohhil — ainult satelliidid, satelliidid pluss nähtavad majakad ja suurem konstellatsioon alternatiivse teena samale geomeetriale — igaühel oma nähtavate allikate arv, täielik DOP ja realiseeritud 1-sigma täpsus MEETRITES, saadud korrutades läbi majaka kohta kasutajaekvivalentse ulatuse veaga, mis on kokku pandud kella sünkroniseerimise, mitmeteelevi ja mõõdistuse liikmete ruutude summa ruutjuurena. Majaka nähtavus on õhuta Kuu kahe kõrguse geomeetriline horisont (atmosfääri ei ole, nii et piir on täpne) ja DOP-i koostamine on sama tuum, mis on ristkontrollitud gnss_lib_py vastu failis tests/dop_reference.rs. MIKS SEE LIIK OLEMAS ON: selle taga olev moodul on olnud mootoris ja kontrollitud sõltumatu DOP-i tee vastu alates L08/L09, kuid see ei olnud käivitusest kättesaadav — ei liiki, ei hargnemisharu, ei kaasasolevat faili. README reklaamis võimekust ja kontrollimaatriksil EI OLNUD selle jaoks üldse rida, nii et seda väideti samaaegselt proosas ja ei väidetud registris (ledger), olles samal ajal mootoris kättesaamatu. Vaikeväärtused on geomeetria, mis kannab juba kinnitatud kuldset etaloni (kasutaja asukohas -80 kraadi { "2" } m antenniga, kolm majakat asukohtades -80/0, -79/+{ "60" } ja -79/-60 kõrgusel { "2" } km, kuue satelliidiga illustratiivne LCNS hetktõmmis hetkel t={ "0" }, { "5" } kraadi mask), nii et paljas käivitus reprodutseerib tabeli, mida oraakel (sõltumatu etalon) juba katab, mitte ei leiuta uusi arve. MODELLED: konstellatsiooni kavand, majakate paigutus ja iga veaeelarve suurusjärk on illustratiivsed sisendid, mitte kasutusel olev mõõdistus ega mõõdetud link; ainult DOP-i aritmeetika, horisondi suletud kuju ja seos sigma = DOP x sigma_URE on väliselt ankurdatud. Mitte teenuse toimivuse kohustus.

# text
# c1: scenarios/lunar-beacon.toml
seg-22ea11fcf367 = Ühe <c1/> käivituse kokkuvõte: Kuu pinnamajakate täiendus — mask { "5.0" } kraadi, epohh +{ "0" } s, majaka kohta sigma_URE { "1.1576" } m { "6" } satelliiti, majakateta sat { "5" } majakat { "0" } GDOP { "11.6627" } PDOP { "9.6941" } HDOP { "3.4868" } VDOP { "9.0454" } TDOP { "6.4840" } realiseeritud 1-sigma: 3D { "11.222" } m H { "4.036" } m V { "10.471" } m { "6" } satelliiti + { "1" } nähtavat majakat sat { "5" } majakat { "1" } GDOP { "4.9979" } PDOP { "4.1160" } HDOP { "1.9721" } VDOP { "3.6128" } TDOP { "2.8350" } realiseeritud 1-sigma: 3D { "4.765" } m H { "2.283" } m V { "4.182" } m { "24" } satelliiti, majakateta sat { "19" } majakat { "0" } GDOP { "2.8929" } PDOP { "2.4226" } HDOP { "1.0199" } VDOP { "2.1974" } TDOP { "1.5811" } realiseeritud 1-sigma: 3D { "2.804" } m H { "1.181" } m V { "2.544" } m majakad parandavad PDOP-i 2.355x; suurem konstellatsioon selle asemel 4.002x MODELLED: konstellatsioon, majakate paigutus ja veaeelarve on illustratiivsed sisendid. Aluseks olev DOP-i tuum on gnss_lib_py abil valideeritud ja majaka horisont on L01 suletud kuju.

# text
# c1: user
# c2: beacons
# c3: n_satellites
# c4: comparison_n_satellites
# c5: epoch_s
# c6: elevation_mask_deg
# c7: clock_sync_m
# c8: multipath_m
# c9: survey_m
seg-25522022cf9a = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

# text
# c1: scenarios/lunar-beacon.toml
seg-acfef3f325e4 = Näide <c1/> määrab muu hulgas:

# attr:alt
seg-a53e353706f6 = Mootori joonistatud diagramm failile scenarios/lunar-beacon.toml, liik lunar-beacon

# text
seg-89e2f6bb2540 = <b>MODELLED</b> Majakaga täiendatud täpsuse halvenemise tegur Kuu pinnakasutaja jaoks: nähtavate satelliitide otsenähtavuse read ja nähtavate pinnamajakate ulatuse mõõtmise read liidetakse üheks kavandimaatriksiks ja hinnatakse jagatud DOP-i tuuma kaudu ning t Testid: <a1>validate_p2_beacon_before_after_table.rs</a1>.

# text
seg-654a3554b1e3 = <b>MODELLED</b> Majakaga täiendatud täpsuse halvenemise tegur Kuu pinnakasutaja jaoks: nähtavate satelliitide otsenähtavuse read ja nähtavate pinnamajakate ulatuse mõõtmise read liidetakse. Oraakel (sõltumatu etalon) (ReferenceImpl): DOP-i aritmeetika on tuum crate::orbit::dop, mida on eraldi väliselt valideeritud gnss_lib_py vastu failis tests/dop_reference.rs; see rida ei laena uuesti selle rea staatust. Majaka nähtavuse horisont on L01 suletud kuju ja sigma = DOP x sigma_URE on standardne GNSS seos (Kaplan and Hegarty, Understanding GPS/GNSS, section { "7" }). Selle rea sees on täiendust ennast kontrollitud sõltumatu

# text
# c1: kshana kinds --json
seg-4d1fc06e907b = MODELLED: konstellatsiooni kavand, majakate paigutus ja iga veaeelarve suurusjärk on illustratiivsed sisendid, mitte kasutusel olev mõõdistus ega mõõdetud link; ainult DOP-i aritmeetika, horisondi suletud kuju ja seos sigma = DOP x sigma_URE on väliselt ankurdatud. (liikide kataloog (<c1/>))

# text
seg-aaafed663400 = MIS ON ANKURDATUD JA MIS MITTE Ankurdatud: DOP-i koostamine on tuum, mis on ristkontrollitud gnss_lib_py vastu failis tests/dop_reference.rs; majaka nähtavus on õhuta Kuu kahe kõrguse geomeetrilise horisondi suletud kuju (atmosfääri ei ole, seega ei ole murdumislaiendust ja piir on täpne); ja sigma = DOP x sigma_URE on standardne seos (Kaplan & Hegarty, Understanding GPS/GNSS, section { "7" }). MITTE ankurdatud — MODELL (stsenaariumifaili kommentaar, read { "40" } kuni { "49" })

# text
seg-2516c4208769 = Kuu pinnamajakate DOP-i täiendus on MODELLED, mitte valideeritud: kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-ebb9724de60a = <s1>Eelmine</s1>lunar-attack-surface

# text
seg-ca9b68783354 = <s1>Järgmine</s1>lunar-differential-pnt
