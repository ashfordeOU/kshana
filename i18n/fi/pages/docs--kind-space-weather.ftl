# docs--kind-space-weather: translations (fi)

seg-37d29d8303fe = km

seg-8e845ce908ee = Moottorin v{ $version } skenaariolaji, perhe <a1>GNSS-mittaukset, paikannus ja eheys</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-f6b7ca020692 = Perhesivu: <a1>GNSS-mittaukset, paikannus ja eheys</a1>

# text
# c1: docs/kinds/by-kind/space-weather.md
seg-95f8bd8e0078 = Lähde: <c1/>

# text
# c1: space-weather
seg-24c21b5b0cc3 = <c1/> (skenaariolaji)

# text
seg-5f25c5b71f0c = Avaruussään ympäristömalli: aurinko- (F10.7/F10.7a) ja geomagneettiset (Kp, määritelmällisellä Kp↔ap-taulukolla) aktiivisuusindeksit, niiden ohjaama Jacchia-1971-eksosfäärilämpötila (validoitu julkaistuja aurinkominimiä/keskiarvoa/maksimia vastaan) sekä Jacchia-1971-termosfäärin neutraalitiheys päivittäisessä keskimääräisessä eksosfäärilämpötilassa verrattuna aktiivisuudesta riippumattomaan staattiseen profiiliin usealla korkeudella — aurinkosyklin tiheysriippuvuus, jonka staattinen ilmakehä jättää pois. MODELLED: tiheys vastaa kiihtyvyysmittareista johdettuja tiheyksiä (TOLEOS CHAMP ja GRACE) kertoimen { "2" } sisällä aurinkomaksimissa, mutta on noin 1.7x liian tiheä vuoden { "2008" } aurinkominimissä.

# text
# c1: scenarios/space-weather.toml
seg-f2c2860db799 = Yksi ajo, jossa on <c1/>, tiivistyy seuraavasti: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; density x1.49 at { "300" } km (MODELLED)

# text
# c1: f107
# c2: f107a
# c3: kp
# c4: altitudes_km
seg-6bb05c41eba2 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>

# text
# c1: scenarios/space-weather.toml
seg-c367f1aacd0b = Esimerkki <c1/> asettaa muun muassa seuraavat:

# text
seg-02dc0d42fb21 = sfu

# text
seg-1dd966268e12 = { "2" } nT

# text
seg-d245f215f331 = Tuloksen tunniste (moottorin oma): MODELLED — aurinko- ja geomagneettiset indeksit, Jacchia-71-eksosfäärilämpötila ja Jacchia-71-staattinen tiheys päivittäisessä keskimääräisessä lämpötilassa

# attr:alt
seg-c1c6f2f73fb5 = Moottorin kirjoittama kaavio skenaariolle scenarios/space-weather.toml, laji space-weather

# text
seg-15587da59e8e = <b>MODELLED</b> Aurinko- ja geomagneettiset indeksit (määritelmällinen Kp↔ap-taulukko), Jacchia-1971-eksosfäärilämpötila ja Jacchian { "1971" } termosfäärin tiheys (SAO Special Report { "332" }: staattiset diffuusioprofiilit, jotka toistavat sen taulukon { "7" }, päivittäisellä, geomagne

# text
seg-f8eef6eabfb2 = <b>MODELLED</b> Aurinko- ja geomagneettiset indeksit (määritelmällinen Kp↔ap-taulukko), Jacchia-1971-eksosfäärilämpötila ja Jacchian { "1971" } termosfäärin tiheys (SAO Special Report { "33" }. Oraakkeli (ExternalDataset): Määritelmällinen Kp↔ap-taulukko + Jacchia-1971-eksosfäärilämpötilan suljettu muoto (vastaa julkaistuja ankkuripisteitä tarkkuudella <{ "1" } K, tests/space_weather_reference.rs); tiheys on luonnehdittu pymsis NRLMSISE-00:aa (riippumaton NRL-malli) vastaan: { "800" } km:n aurinkosyklin vaihtelu on 10.4x NRLMSISE-00:n 13.6x vastaan. { "0.30" }-versio: kalibroitu ensimmäisen kertaluvun aktiivisuuskerroin korvattiin Jacchialla { "1971" } (oletusskenaarion tiheys korkeudella { "40" }

# text
# c1: label
seg-72979b637644 = MODELLED — aurinko- ja geomagneettiset indeksit, Jacchia-71-eksosfäärilämpötila ja Jacchia-71-staattinen tiheys päivittäisessä keskimääräisessä lämpötilassa (tulos <c1/>)

# text
# c1: kshana kinds --json
seg-0306ee022298 = MODELLED: tiheys vastaa kiihtyvyysmittareista johdettuja tiheyksiä (TOLEOS CHAMP ja GRACE) kertoimen { "2" } sisällä aurinkomaksimissa, mutta on noin 1.7x liian tiheä vuoden { "2008" } aurinkominimissä. (lajiluettelo (<c1/>))

# text
seg-b86a312077b5 = REHELLINEN RAJAUS: MODELLED. Kp<->ap-muunnos on määritelmällinen IAGA-taulukko ja eksosfäärilämpötila on validoitu julkaistuja aurinkominimin/keskiarvon/maksimin suuruusluokkia vastaan, mutta tiheyskorjaus on KALIBROITU ENSIMMÄISEN KERTALUVUN skaalakorkeuskytkentä — se tavoittaa oikean etumerkin, monotonisuuden ja suuruusluokan, EI datalla validoidun (NRLMSISE-00) ilmakehän absoluuttista tarkkuutta. Ajo: kshana scenarios/space-weath (skenaariotiedoston kommentti, rivit { "10" }–{ "15" })

# text
seg-10cf16c12a2a = Avaruussään ympäristö ja aktiivisuuden ohjaama termosfäärin tiheys on MODELLED, ei validoitu: osaväite on tarkistettu ulkoisesti, mutta koko ominaisuus koostuu mallinnetuista osista, joten ominaisuus pysyy tasolla Modelled. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

# text
seg-3dd29f8fba14 = <s1>Edellinen</s1>space-packet

# text
seg-ff9d9a41692b = <s1>Seuraava</s1>spectrum
