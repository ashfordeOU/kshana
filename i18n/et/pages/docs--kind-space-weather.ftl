# docs--kind-space-weather: translations (et)

# text
seg-37d29d8303fe = km

# text
seg-8e845ce908ee = Mootori v{ $version } stsenaariumi liik, perekond <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
seg-f6b7ca020692 = Perekonna leht: <a1>GNSS-i mõõtmised, positsioneerimine ja terviklikkus</a1>

# text
# c1: docs/kinds/by-kind/space-weather.md
seg-95f8bd8e0078 = Allikas: <c1/>

# text
# c1: space-weather
seg-24c21b5b0cc3 = <c1/> (stsenaariumi liik)

# text
seg-5f25c5b71f0c = Kosmoseilma keskkonnamudel: päikese (F10.7/F10.7a) ja geomagnetilise (Kp, koos definitsioonilise Kp↔ap tabeliga) aktiivsusindeksid, nende juhitav Jacchia-1971 eksosfääri temperatuur (valideeritud avaldatud päikese miinimumi/keskmise/maksimumi vastu) ning Jacchia-1971 termosfääri neutraaltihedus ööpäeva keskmise eksosfääri temperatuuri juures vs aktiivsusvaba staatiline profiil kõrguste hulgal — päikesetsükli tihedussõltuvus, mida staatiline atmosfäär ei sisalda. MODELLED: tihedus ühtib kiirendusmõõturitest tuletatud tihedustega (TOLEOS CHAMP ja GRACE) teguri { "2" } piires päikese maksimumil, kuid on { "2008" }. aasta päikese miinimumil umbes 1.7x liiga tihe.

# text
# c1: scenarios/space-weather.toml
seg-f2c2860db799 = Ühe <c1/> käivituse kokkuvõte: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; tihedus x1.49 kõrgusel { "300" } km (MODELLED)

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6bb05c41eba2 = Valikulised väljad: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-weather.toml
seg-c367f1aacd0b = Näide <c1/> määrab muu hulgas:

# text
seg-02dc0d42fb21 = sfu

# text
seg-1dd966268e12 = { "2" } nT

# text
seg-d245f215f331 = Tulemuse silt (mootori oma): MODELLED — päikese/geomagnetilised indeksid, Jacchia-71 eksosfääri temperatuur ja Jacchia-71 staatiline tihedus ööpäeva keskmisel temperatuuril

# attr:alt
seg-c1c6f2f73fb5 = Diagramm, mille mootor kirjutab failile scenarios/space-weather.toml, liik space-weather

# text
seg-15587da59e8e = <b>MODELLED</b> Päikese/geomagnetilised indeksid (definitsiooniline Kp↔ap tabel), Jacchia-1971 eksosfääri temperatuur ja Jacchia { "1971" } termosfääri tihedus (SAO Special Report { "332" }: staatilised difusiooniprofiilid, mis reprodutseerivad selle tabelit { "7" }, koos ööpäevase, geomagne

# text
seg-f8eef6eabfb2 = <b>MODELLED</b> Päikese/geomagnetilised indeksid (definitsiooniline Kp↔ap tabel), Jacchia-1971 eksosfääri temperatuur ja Jacchia { "1971" } termosfääri tihedus (SAO Special Report { "33" }. Sõltumatu etalon (sõltumatu etalon; ExternalDataset): definitsiooniline Kp↔ap tabel + Jacchia-1971 eksosfääri temperatuuri kinnine kuju (ühtib <{ "1" } K täpsusega avaldatud ankrutega, tests/space_weather_reference.rs); tihedust iseloomustatakse pymsis NRLMSISE-00 (sõltumatu NRL-i mudel) vastu: { "800" } km päikesetsükli kõikumine on 10.4x NRLMSISE-00 13.6x vastu. { "0.30" } redaktsioon: kalibreeritud esimese järgu aktiivsusteguri asendas Jacchia { "1971" } (vaikestsenaariumi tihedus kõrgusel { "40" }

# text
# c1: label
seg-72979b637644 = MODELLED — päikese/geomagnetilised indeksid, Jacchia-71 eksosfääri temperatuur ja Jacchia-71 staatiline tihedus ööpäeva keskmisel temperatuuril (tulemus <c1/>)

# text
# c1: kshana kinds --json
seg-0306ee022298 = MODELLED: tihedus ühtib kiirendusmõõturitest tuletatud tihedustega (TOLEOS CHAMP ja GRACE) teguri { "2" } piires päikese maksimumil, kuid on { "2008" }. aasta päikese miinimumil umbes 1.7x liiga tihe. (liikide kataloog (<c1/>))

# text
seg-b86a312077b5 = AUS ULATUS: MODELLED. Kp<->ap teisendus on definitsiooniline IAGA tabel ja eksosfääri temperatuur on valideeritud avaldatud päikese miinimumi/keskmise/maksimumi suuruste vastu, kuid tiheduse korrektsioon on KALIBREERITUD ESIMESE JÄRGU skaalakõrguse sidestus — see tabab õige märgi, monotoonsuse ja suurusjärgu, MITTE andmetega valideeritud (NRLMSISE-00) atmosfääri absoluutset täpsust. Käivitamine: kshana scenarios/space-weath (stsenaariumifaili kommentaar, read { "10" }–{ "15" })

# text
seg-10cf16c12a2a = Kosmoseilma keskkond ja aktiivsusest juhitud termosfääri tihedus on MODELLED, mitte valideeritud: alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele. (kontrollimaatriks (docs/MODELLED-RATIONALE.md))

# text
seg-3dd29f8fba14 = <s1>Eelmine</s1>space-packet

# text
seg-ff9d9a41692b = <s1>Järgmine</s1>spectrum
