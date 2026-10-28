# docs--tutorials: translations (fi)

seg-501402fc366f = Kellon holdover

seg-cae10fb9bff8 = Skenaario

seg-a0b63210b807 = Lue lisää

seg-a7cfe6f135f1 = Rata ja geometria

seg-835df2d05f2a = GNSS-mittausalue

seg-3a0e724a8a2b = Taso

seg-28e87f407a10 = Alue

seg-d6476863f862 = Ominaisuus

seg-029de6b99be0 = Inertiapaikannus (dead-reckoning)

seg-9ef8f99ca6e4 = Ajansiirto

seg-b03d56f501c3 = Tyyppi

seg-ec26df467b88 = Yhteinen Kalman-anturifuusio-PNT samoilla hybridisyötteillä.

# text
seg-4f19d4fb1341 = Yleinen N-ulotteinen pyyhkäisy minkä tahansa paketin yli pisteytettyjen TOML-avainten / JSON-metriikkapolkujen avulla.

# text
seg-e7ab7b55c969 = 1-ulotteinen vaihtoehtovertailun pyyhkäisy kellopaketin parametrin yli.

seg-e43910de5fd8 = Muistikirjat

seg-d78822583c64 = Notebook

seg-3959aefa12be = Lähde: <c1/>

seg-a5ebe4befda8 = Käytännönläheisiä, läpikäytyjä esimerkkejä, jotka vievät sinut vaiheesta ”aja toimitettu skenaario” vaiheeseen ”kvantifioi ja puolusta tulosta”. Jokainen kolmessa opetusohjelmassa mainittu luku on todellinen moottorin tuloste, ankkuroitu ulkoiseen (kehäpäättelystä vapaaseen) auktoritatiiviseen oraakkeliin ja <b>lukittu integraatiotestillä</b> (<c1/>), joten opetusohjelma ei voi huomaamatta ajautua erilleen siitä, mitä moottori todella tekee. Jos opetusohjelma sanoo, että optinen kello pitää { "6600" } s, testi kaataa koonnin sinä päivänä, kun se lakkaa pitämästä paikkansa.

seg-1c045624a6be = Kshana on paikannuksen, navigoinnin ja ajanmäärityksen (PNT) simulaattori. Opetusohjelmissa käytetään muutamia muita lyhenteitä, jotka kukin avataan ensimmäisellä esiintymiskerralla: GNSS (Global Navigation Satellite System), GPS (Global Positioning System), CLI (komentorivikäyttöliittymä) ja TOML (Tom's Obvious Minimal Language, skenaariotiedostojen muoto).

seg-7a84a80b57d5 = Oletko uusi projektissa? Lue ensin <a1>peruskäsitteiden johdanto</a1> ja <a2>sanasto</a2> ja palaa sitten tänne.

seg-b4cd44590347 = Kolme läpikäytyä esimerkkiä

seg-eebeab9693b2 = Opetusohjelma

seg-a0bc6e585d71 = Mitä opit

seg-b6cc01b76947 = Skenaariotyyppi

seg-429bab0a0e05 = Vaikeustaso

seg-0e188f9c0f65 = ~Aika

seg-bcf40448e55d = Ensimmäinen kiertoratani: missä GPS-satelliitit ovat

seg-de1032024a69 = laske oikean GPS-satelliittitähdistön radat, lue saatavuus, sijainnin tarkkuuden heikkenemiskerroin (PDOP) ja sijaintitarkkuus, ja vie satelliittien todelliset sijainnit (SP3-tarkka rataformaatti)

seg-e7b6c262333e = aloittelija

seg-d6042fb74a5f = { "15" } min

seg-07a8d6cfc1ae = Kellon holdover: kuinka pitkään voit ajautua

seg-0e9c77468fb2 = aja GNSS-estetty kellon holdover, lue ajoituksen laatumittari ja ymmärrä sen takana oleva kasvulaki √(q_wf·T)

seg-0f6fba31626a = { "20" } min

seg-7973e9c54366 = Kvantti vs. klassinen GNSS-kestävyys

seg-4d8036091b37 = päätösosa: harhautuksen ilmaisin (<c1/>) ja täysi fuusioitu PNT-paketti (<c2/>), sekä kuinka tietoturvaa, eheyttä ja inertiapaikannusta luetaan yhdessä

seg-1b39d4927602 = keskitaso

seg-ea37ac575235 = { "35" } min

seg-1d56222dfd25 = Ajettavia Jupyter-muistikirjoja, jotka käyttävät synteettistä dataa ja vain repositoriossa säilytettäviä julkisia elementtijoukkoja, on hakemistossa <a1><c1/></a1>:

seg-9aae3a4e10dc = Aluksen luottamus ja koulutus

seg-1d680d635c6d = tuota synteettinen sillan NMEA-virta ohjatulla tapahtumalla ja pisteytä se aluksen luottamusvalvojilla (ohjeellinen, ei tyyppihyväksytty navigointilaite)

seg-739f8f5a9082 = missä navigointidata on näyttänyt heikentyneeltä ja kuinka suureen osaan reittiä se vaikuttaa

seg-443c908ff49b = Compliance-kartoitus ja testi-bench-vienti

seg-0d639065192a = minkä julkisten kehysten rivien osalta joukko ajoja tukee todisteita (supports evidence for), ei koskaan sitä, että kehys täyttyisi, sekä skenaarion liike ja tapahtumat vietynä tekstinä laboratorion GNSS-simulaattoria varten (signaalia ei kirjoiteta)

seg-981a3238794d = Kvantti vs. klassinen GDOP

seg-228ce150ee80 = sama satelliittitähdistön geometria kvantti- ja klassisella anturilla, vertailtuna tarkkuuden heikkenemiskertoimella

seg-4b82b5edd4ff = Taivaan geometria siluetin alla

seg-1186b6cd6149 = satelliitit, jotka paikka näkee kadun tai laiturin siluetin alla, niiden DOP ja virhe-ellipsi, elementtijoukoista laskettu päivätty taivas ja kovarianssia vasten ajettu siemenluvulla toistettu Monte Carlo (MODELLED)

seg-d9d06cb8e237 = Kuinka opetusohjelma ajetaan

seg-ffc4ddfc9426 = Jokainen opetusohjelma ajaa saman skenaarion kolmella tavalla; valitse sinulle sopiva. Ne kaikki kutsuvat <em>yhtä</em> moottoria, joten luvut ovat identtiset (vastaa README-tiedoston <a1>Käyttö</a1>-osiota).

seg-e7ba76a06aa6 = <b>Komentorivi.</b> CLI valitsee toiminnon skenaarion kentän <c1/> mukaan ja kirjoittaa tiedostot <c2/>, <c3/>, <c4/> ja <c5/> syötteen viereen (JSON on JavaScript Object Notation, SVG Scalable Vector Graphics, HTML HyperText Markup Language). Muutama tyyppi julkaisee myös toistettavuustaulukon tiedostona <c6/> (pilkuilla erotetut arvot): <c7/>, <c8/>, <c9/>, <c10/>, <c11/> ja <c12/>, kun vientipaikka on asetettu. Mikään kolmesta opetusohjelmasta ei ole niitä, joten et näe tätä tiedostoa tässä.

seg-5ee6f15d3b08 = <c1/> rakentaa CLI:n tästä paikallisesta kopiosta. Asennetulla binäärillä (<c2/>) sama komento on <c3/>. Ilman paikallista kopiota useimmat toimitetut skenaariot on niputettu binääriin: <c4/> luettelee ne (ja nimeää ne harvat, joita ei ole niputettu, syineen), ja <c5/> kirjoittaa yhden ulos: tiedoston <c6/> kopion, jolla binääri rakennettiin.

seg-1b7e851749d5 = <b>Python.</b> Rakenna laajennus tästä paikallisesta kopiosta kerran maturinilla aktiivisessa virtuaaliympäristössä ja kutsu sitten <c1/>:

seg-3aa10d551694 = <c1/> asentaa sen sijaan julkaistun wheel-paketin. Se voi olla tätä kopiota jäljessä: <c2/> kertoo, mitä skenaariotyyppejä versiossasi on.

seg-333b7956b06b = <b>Selaimen leikkikenttä.</b> Ei asennusta: avaa <a1>Studio</a1>, valitse skenaario, muokkaa parametreja ja lue tulos. Mitään ei lähetetä; moottori toimii asiakaspuolella WebAssemblynä.

seg-2cd8bbd1e7f0 = Opetusohjelmat esittävät <b>CLI</b>-komennot, mutta jokaisella komennolla on yllä oleva Python- ja leikkikenttävastine. Jokainen tulos on toistettavissa tiedoista <c1/>: aja se kahdesti, niin saat bitilleen identtisen tulosteen.

seg-d497caeb889a = Kommentoidut opetusskenaariot

seg-c966709a600d = Jokaista ominaisuusaluetta varten on yksi runsaasti kommentoitu tiedosto (<c1/>) hakemistossa <a1><c2/></a1>: kanonisen skenaarion <em>opetuskopio</em>, jossa jokainen kenttä on selitetty rivillä, siteerattu oraakkeli on nimetty ja odotettu yhden rivin yhteenveto on kirjattu kommenttina <c3/>. Kenttien arvot ovat identtiset vanhemman arvojen kanssa repositorion ylätason hakemistossa <c4/> (<c5/> vertaa jäsennettyä TOML-sisältöä), joten dokumentoitu tuloste pysyy todenmukaisena. Myös golden-tiivisteet ovat koskemattomia: kommentti ei koskaan muuta skenaarion tiivistettä.

seg-871fcecc5ee1 = Opetustiedosto

seg-4e852a6a1581 = Johdettu lähteestä

seg-e74e1c9b387e = Eheys (RAIM, vastaanottimen autonominen eheyden valvonta)

seg-95b6cceb76e6 = Tietoturva (harhautus)

seg-dab48471c270 = Hybridi-PNT

seg-c889e5e77121 = <b>Tietoturvan</b> opetustiedosto sisältää rivin <c1/>: tietoturvan laatumittarin (<c2/>, yksi miinus havaitsematta jäämisen todennäköisyys) tuottaa harhautuspaketti. Tiedoston nimi seuraa <em>ominaisuutta</em> (tietoturva), kenttä <c3/> seuraa <em>pakettia</em> (spoof). Tiedoston otsikko tuo tämän esiin.

seg-89fef83a9d54 = Täydellinen skenaariotyyppien luettelo

seg-0f744a3a7193 = Kellon holdover vs. määrittely; valinnainen Monte Carlo -joukko (<c1/>).

seg-9a2564fdc86a = 1-DOF (yksi vapausaste) inertiapaikannus (dead-reckoning) GNSS-katkon aikana.

seg-62f0400581b3 = GNSS-saatavuus + DOP satelliittitähdistöstä (Walker / kaksirivinen elementtijoukko / RINEX, Receiver Independent Exchange -formaatti).

seg-59fc8330ba12 = Snapshot / ratkaisun erotus / ARAIM (kehittynyt RAIM) vaaka- ja pystysuuntaisilla suojaustasoilla (HPL/VPL) + Stanford-diagrammi.

seg-22c598d57e77 = Kuun etelänavan ARAIM-suojaustason läpikäynti LunaNet-releiden joukkoa vasten.

seg-f97d8fb3b6fa = Optinen vs. radiotaajuinen (RF) kaksisuuntainen aika-/taajuussiirto.

seg-8af1c652d854 = Hybridi-PNT-päätösosa: kello + inertiamittausyksikkö (IMU) + ajansiirtoavusteisuus.

seg-d24a9596f53e = Löyhästi ja tiukasti kytketty GNSS/INS (inertianavigointijärjestelmä) virhetilan laajennettu Kalman-suodatin.

seg-3c915870476a = Mittausalueen pseudoetäisyyssimulaatio (Klobucharin ionosfääri, Saastamoinen/Niell-troposfääri) + RAIM.

seg-72284bad54e4 = Linkkibudjetin häirintä (jamming): häirintä-signaalisuhde (J/S) → tehollinen kantoaalto-kohinatiheys (C/N₀) → lukituksen menetys.

seg-2ead4d42b427 = Stokastinen aikaharhautuksen ilmaisin (Neyman–Pearson / χ²₁) Monte Carlo -pohjaisilla väärän hälytyksen ja havaitsematta jäämisen todennäköisyyksillä (P_fa/P_md).

seg-5f2f9e63093a = Opetusohjelmien jälkeen: uudemmat ominaisuudet

seg-3d6a8fd31402 = Kolme opetusohjelmaa pysyvät klassisissa kello-, kiertorata- ja tietoturvapaketeissa. Moottori on kasvanut niitä paljon pidemmälle. Jokainen alla oleva rivi on toimitettu skenaario, jonka voit ajaa sellaisenaan (<c1/> tai <c2/>); yhteenveto on ensimmäinen rivi, jonka kshana { "0.35.0" } tulosti siitä 2026-10-10. Toisin kuin opetusohjelmien luvut, nämä rivit ovat yhden ajon tallenne, eikä niitä ole lukittu tiedostolla <c3/>: aja skenaario uudelleen saadaksesi nykyisen arvon. Tulokset kertovat oman rajauksensa (useimmissa on <c4/>), ja <a1>varmennusmatriisi</a1> kertoo, mitkä ominaisuudet on VALIDATED ulkoista oraakkelia vasten ja mitkä MODELLED.

seg-2dc1d8680abb = Yhteenvedon ensimmäinen rivi

seg-abd799395f27 = L-kaistan spektri ja häirinnän vesiputouskuvaaja

seg-33453b2cfdf3 = Aurinkokunta yhdellä ajanhetkellä

seg-23bc4ff7f741 = Paikannus toisen taivaankappaleen ympärillä

seg-c135b151e469 = Satelliittitähdistön suunnittelu laajassa mittakaavassa

seg-065995e9bd5e = Kampanjat: tyypit ketjutettuina yhdelle aikajanalle

seg-dbae357e7e34 = Yksi LEO-PNT-järjestelmä päästä päähän

seg-9d3d72ea03df = Fuusioitu MEO + LEO -paikannus

seg-acc2793d1721 = LEO-signaalit, ylilennot ja navigointiviestit

seg-db2626e54a24 = <c1/> (ylilento)

seg-319ddeeb8205 = <a1>LEO-SIGNAL.md</a1>, <a2>LEO-PASS.md</a2>, <a3>LEO-NAVMSG.md</a3>

seg-aa93235e8c6d = PPP-konvergenssi LEO-kerroksella; 5G-paikannus

seg-01160980ce50 = Kestävyys: GNSS häiritty, LEO kantaa käyttäjää

seg-adf8453bc035 = Sovellusalat: rautatie, meriliikenne, telealat, ajoneuvot, arktinen alue

seg-15a5098b5045 = <c1/> (ja muut tiedostot <c2/>)

seg-e6494ed83ee3 = Telealan holdover ITU-T:n (International Telecommunication Union, Telecommunication Standardization Sector) G.8272-kellorajoja vasten

seg-dfc04f1abe82 = LEO on matala Maan kiertorata ja MEO keskikorkea Maan kiertorata; PVT on sijainti, nopeus ja aika; PPP on tarkka pistepaikannus; 5G on viidennen sukupolven mobiilistandardi; TDB on barysentrinen dynaaminen aika (Barycentric Dynamical Time); JD on juliaaninen päivämäärä; TE on aikavirhe.

seg-1d45d94f2e5b = CLI lisää minkä tahansa ajon päälle kolme tulostetta:

seg-893276648fec = <b>Raportit.</b> Jokainen ajo kirjoittaa tiedostot <c1/> ja <c2/> (katso <a1>REPORTS.md</a1>). Komento <c3/> ajaa skenaariojoukon ja tuottaa tiedostot <c4/> ja <c5/>, esimerkiksi <c6/>.

seg-e9f06d47c82c = Komento <c1/> piirtää ajon aikasarjan, esimerkiksi komento <c2/> skenaariolle <c3/> kirjoittaa tiedoston <c4/>. Tyyppi, jolla ei ole näytteistettyä aika-akselia (kuten <c5/>), hylätään virheellä; katso <a1>ANIMATION.md</a1>.

seg-f037fe5d7ffa = Yhteentoimivuusviennit.

seg-3977722b8517 = Komento <c1/> kirjoittaa tuloksen muita työkaluja varten: CZML (Cesium Language), KML (Keyhole Markup Language, Google Earthia varten), GeoJSON (geographic JSON), STK:n (Systems Tool Kit) efemeridi tai SigMF-tallenne (Signal Metadata Format). Komento <c2/> kertoo, mitkä formaatit sopivat skenaarioon; SigMF sopii vain tyyppiin <c3/>. Kiertoratapaketti vie myös <c4/>, <c5/> ja <c6/> (CCSDS, Consultative Committee for Space Data Systems, -ratasanomat). Katso <a1>INTEROP.md</a1>.

seg-3abd51182cc0 = Arvioitavat harjoitukset

seg-9513af4fb862 = Käy tikkaat läpi. Jokainen taso on edellistä vaikeampi ja puolustettavampi; esimerkkiratkaisut ovat hakemistossa <a1><c1/></a1>.

seg-89ad8eb64a54 = Tavoite

seg-0a824838ef57 = Mitä teet

seg-2463a86470b8 = Esimerkkiratkaisu

seg-7ce3ac2347b9 = Taso { "1" } — aja ja lue

seg-e1dee35aedff = aja toimitettu skenaario muuttamattomana ja lue yksi laatumittari

seg-296694716b3b = Aja tiedosto <c1/>; tulosta kvantti- ja klassinen <c2/>. CLI, leikkikenttä tai yhden rivin Python-kutsu.

seg-bad6d3afb6a0 = Taso { "2" } — muokkaa ja pyyhkäise

seg-c18da238e470 = muuta yhtä parametria ja havaitse monotoninen vaikutus

seg-598ca8efea83 = Kiristä kellon määrittelyä (<c1/>) tai pidennä katkoa ja seuraa holdoverin laskua; tai taulukoi se tyypillä <c2/>/<c3/>.

seg-1d9dfecce6fa = Taso { "3" } — kvantifioi ja puolusta

seg-5b57f2c8ffb9 = Monte Carlo, luottamusvälit, toistettavuus ja suojaustaso

seg-0fac2036b289 = Aja kellojoukko (<c1/>), lue [p05–p95]-väli, varmista että kaksi ajoa antaa identtisen arvon <c2/>, ja lue eheys- / Stanford-tulos.

seg-45dc753da682 = Esimerkkiratkaisut käyttävät Python-laajennusta (ensin <c1/>). Kun komento ajetaan repositorion juuresta, tiedosto <c2/> tulostaa sirutason atomikellon holdoverin putoavan arvosta { "2610" } s { "20" } ns:n määrittelyllä arvoon { "1140" } s { "5" } ns:n määrittelyllä.

seg-e59b1beadb98 = Haluatko tuoretta dataa?

seg-530db2e609d0 = Näiden opetusohjelmien pääluvut ajetaan kokonaan repositoriossa jo olevista skenaarioista. Mitään ei haeta, minkä ansiosta ne ovat toistettavia ja turvallisia ajaa jatkuvassa integroinnissa (CI). ”Laajenna sitä” -harjoituksiin voit hakea live-dataa:

seg-6a20ec96cb92 = <b>GPS:n kaksirivisiä elementtijoukkoja (TLE)</b> (päivitä kiertoratatähdistö): <a1>https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle</a1>, pelkkää tekstiä olevia 3-rivisiä elementtijoukkoja (nimi + rivi { "1" } + rivi { "2" }). Apuri: <c1/>. Avoin data (US Space Forcen 18th Space Defense Squadronin luettelo, Celestrakin jakelema, Dr T. S. Kelso).

seg-9bcea1d9eb12 = <b>SGP4:n (Simplified General Perturbations { "4" }) varmennusoraakkeli</b> (jo mukana, älä hae uudelleen): AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 ”Revisiting Spacetrack Report #3” -testivektorit, <a1>https://celestrak.org/publications/AIAA/2006-6753/</a1>, tiedoston <c1/> käyttämät; katso <a2><c2/></a2>.

seg-d33aa34b2762 = <b>Kellon vakauden relaatioiden oraakkeli</b>: NIST (National Institute of Standards and Technology) Special Publication { "1065" } (Riley, <em>Handbook of Frequency Stability Analysis</em>), <a1>https://tf.nist.gov/general/pdf/2220.pdf</a1>, σ_y(τ)↔vaihe-relaatiot, joihin opetusohjelma { "2" } perustuu.

seg-36be39f17e35 = <s1>Edellinen</s1>Studio-opas

seg-6f6204737a87 = <s1>Seuraava</s1>{ "1" } · Ensimmäinen kiertoratasi

seg-2fa9e002b3a2 = Moottori valitsee toiminnon skenaarion kentän <c1/> mukaan. Alla oleva taulukko luettelee yleisimmin käytetyt tyypit (yllä olevat kahdeksan opetusaluetta sekä niiden lähimmät naapurit). Se <b>ei</b> ole täydellinen joukko: <c2/> palauttaa kaikki <c3/> sisäänrakennettua tyyppiä. Tämä funktio (Python- ja WebAssembly (WASM) -sidonnoissa nimellä <c4/> ja komentorivillä komennolla <c5/>) on auktoritatiivinen, aina ajan tasalla oleva luettelo, ja <a1><c6/></a1> on sen generoitu luettelointi, yksi osio tyyppiä kohti, pakollisine ja valinnaisine TOML-kenttineen. <c7/> pakottaa, että jokainen opetusohjelmassa dokumentoitu tyyppi on todellinen toiminnon valintatyyppi, joten tämän taulukon mikään rivi ei voi nimetä olematonta tyyppiä.
