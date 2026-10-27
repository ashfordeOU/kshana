# docs--kind-body-pnt: translations (et)

# text
seg-5b561b4fd201 = Marss

# text
seg-debc2f07db78 = true

# text
seg-37d29d8303fe = km

# text
# c1: scenarios/
seg-51362910dcb7 = { "2" } kaasasolevat stsenaariumi kasutab seda liiki; ülejäänud on kaustas <a1><c1/></a1>.

# text
seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: selle liigi nimetavad <a1>kontrollimaatriksi</a1> read.

# text
# c1: docs/kinds/by-kind/body-pnt.md
seg-02b8d1f1b7df = Allikas: <c1/>

# text
# c1: body-pnt
seg-e28ba749a2a1 = <c1/> (stsenaariumi liik)

# text
seg-11e8c29ecb45 = Mootori v{ $version } stsenaariumi liik, perekond <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-e7dad1a1ecba = Positsioneerimine ümber suvalise Päikesesüsteemi keha: orbiter või pinnaleandur nimega valitud keskkeha ümber (Marss, Kuu, Europa, Ganymedes, Titan ja ülejäänud Päikesesüsteemi kataloog), navigeerides ühesuunaliste pseudovahemaadega keha ümber oleva väikese Walkeri navigatsioonikonstellatsiooni abil (kahe keha orbiidid keha enda J2 sekulaarse triiviga, tundmatu kasutaja kell) ja soovi korral kellavaba süvakosmose kahesuunalise vahemaaga Maalt, mille suund ja kaugus tulevad analüütilisest Päikesesüsteemi efemeriidist igal epohhil. Vaatejooned blokeerib keha keskmine sfäär ja pinnakasutaja vajab ka kõrgusmaski. Epohhi kohta: nähtavad releed, kas Maa on limbuse kohal, ainult konstellatsiooni GDOP ja PDOP (geomeetriline ja positsiooni täpsuse halvenemise tegur), formaalne ühe sigma positsiooni määramatus Maa reaga ja ilma ning algväärtusega (seed) Gauss-Newtoni vähimruutude lahendi viga mõlemal juhul; jooksu üle: kättesaadavus, Maa nähtavus, PDOP-i mediaan, RMS-viga ja formaalse sigma mediaan, pluss Maa ja keha vaheline valguse levimisaeg, edasi-tagasi aeg, Shapiro viivitus ja Päikese nurkkaugus epohhil. MODELLED: releeorbiidid, mürataseme ja hetkeline mõõtemudel on modelleerimisvalikud, mitte missiooni navigatsiooniandmete vastu valideeritud; keha konstandid on body.rs-is viidatud avaldatud väärtused ning Maa geomeetria pärib Päikesesüsteemi efemeriidi sildid.

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-c90c1a79f88b = Ühe <c1/> jooksu kokkuvõte: Positsioneerimine ümber Marsi — orbiteri kasutaja, { "12" } releed kõrgusel { "10000" } km, { "296" } epohhi Maa valguse levimisaeg { "338.3" } s ühesuunaline, { "676.6" } s edasi-tagasi; Päike-Maa-keha nurk { "175.4" } kraadi kättesaadavus: { "1.000" } ainult konstellatsioon, { "1.000" } Maa vahemaaga (Maa nähtaval { "0.811" }) PDOP-i mediaan { "1.375" } ; RMS-viga { "1.883" } m ainult konstellatsioon, { "1.629" } m Maa vahemaaga formaalse sigma mediaan { "1.375" } m ainult konstellatsioon, { "1.304" } m Maa vahemaaga

# text
# c1: body
# c2: epoch
# c3: epoch_jd_tdb
# c4: duration_s
# c5: step_s
# c6: seed
# c7: table
# c8: user
# c9: constellation
# c10: earth_link
seg-31bacf177d9c = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

# text
# c1: scenarios/mars-orbit-pnt.toml
seg-3f1989254167 = Näide <c1/> määrab muu hulgas:

# text
seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

# text
seg-753b1683fb7b = m^3/s^{ "2" }

# text
seg-81d4cd54bd62 = Tulemuse silt (mootori oma): MODELLED: kahe keha releeorbiidid J2 sekulaarse triiviga, geomeetriline nähtavus, Gaussi vahemaamüra ja hetkeline mõõtemudel keha ümber avaldatud konstantidest; mitte missiooni navigatsiooniandmete vastu valideeritud. Maa ja keha geomeetria pärib Päikesesüsteemi efemeriidi sildi

# attr:alt
seg-6f341acbe994 = Diagramm, mille mootor kirjutab failile scenarios/mars-orbit-pnt.toml, liik body-pnt

# text
seg-dae4184bb004 = <b>VALIDATED</b> Newtoni ühesuunaline valguse levimisaeg suvalisest kehast suvalise teiseni, vastu võetud epohhil, lahendatud radiomeetrilise fikspunkti valguse levimisaja lahendajaga (radiometric::light_time_solution, saatja oma hilinenud asukohas) funktsiooni solar_system::link_o kaudu Testid: <a1>solar_system_light_time_preregistered.rs</a1>.

# text
# c1: body-pnt
seg-45259ad33a01 = <b>MODELLED</b> Liik <c1/>: orbiter või pinnaleandur nimega valitud keha ümber navigeerib ühesuunaliste pseudovahemaadega keha ümber oleva Walkeri navigatsioonikonstellatsiooni abil (kahe keha orbiidid keha J2 sekulaarse triiviga, tundmatu kasutaja c

# text
# c1: body-pnt
seg-5c3f8ac041d3 = <b>MODELLED</b> Liik <c1/>: orbiter või pinnaleandur nimega valitud keha ümber navigeerib ühesuunaliste pseudovahemaadega Walkeri navigatsioonikonstellatsiooni abil keha ümber. Oraakel (sõltumatu etalon) (InternalConsistency): Suletud kujud ja sisemine kooskõla: Kepleri kolmas seadus releeperioodi jaoks, orbiidi raadius ja pinna raadius, mis püsivad jooksu vältel, mõõtmise lisamine, mis ei suurenda kunagi formaalset ebakindlust, ning algväärtusega (seed) vead, mis ühtivad kovariatsiooniga. Releeorbiidid ignoreerivad kolmandaid kehasid (Jupiteri tõmmet releedele Europa ümber ei modelleerita), müra on Gaussi väljaöeldud tasemetel ja mõõtemudel on hetkeline

# text
# c1: label
seg-64920deda9cd = MODELLED: kahe keha releeorbiidid J2 sekulaarse triiviga, geomeetriline nähtavus, Gaussi vahemaamüra ja hetkeline mõõtemudel keha ümber avaldatud konstantidest; mitte missiooni navigatsiooniandmete vastu valideeritud. Maa ja keha geomeetria pärib Päikesesüsteemi efemeriidi sildid. (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-bcb5cbf9cbe3 = MODELLED: releeorbiidid, mürataseme ja hetkeline mõõtemudel on modelleerimisvalikud, mitte missiooni navigatsiooniandmete vastu valideeritud; keha konstandid on body.rs-is viidatud avaldatud väärtused ning Maa geomeetria pärib Päikesesüsteemi efemeriidi sildid. (liikide kataloog (<c1/>))

# text
seg-04cd882741e2 = MODELLED. Releeorbiidid, { "1" } m vahemaamüra ja hetkeline mõõtemudel on modelleerimisvalikud; siin pole midagi missiooni navigatsiooniandmete vastu valideeritud. Marsi konstandid on src/body.rs-is viidatud avaldatud väärtused. (stsenaariumifaili kommentaar, read { "20" } kuni { "22" })

# text
seg-df6bae4c422e = Positsioneerimine ümber suvalise Päikesesüsteemi keha kohaliku konstellatsiooni ja Maalt tuleva süvakosmose lingiga on MODELLED, mitte valideeritud: kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-a4f1e7d2041e = Perekonna leht: <a1>Satelliidikonstellatsioonid, katvus ja geomeetria</a1>

# text
seg-670191cf797f = Teemaleht: <a1>SOLAR-SYSTEM.md</a1>

# text
seg-cef32ee7d521 = Teemaleht: <a1>CONSTELLATION-DESIGN.md</a1>

# text
seg-a4c650a0eb7a = <s1>Eelmine</s1>attitude-budget

# text
seg-96170e5c8e3f = <s1>Järgmine</s1>campaign
