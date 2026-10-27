# docs--real-tle-guide: translations (fi)

seg-a6da23b43f90 = <s1>Seuraava</s1>Kampanjat

seg-bc9ae2eda129 = Lähde: <c1/>

seg-68b27f011ced = Todellisten satelliittitähdistön TLE-tietojen käyttö

seg-109e8a920fc2 = Mukana toimitettu <c1/> sisältää jo <b>todellisia TLE-tietoja</b> (two-line element set): Celestrakin tilannekuvan <c2/> toiminnassa olevasta GPS-tähdistöstä (Global Positioning System), luetteloituna 2021-07-28, { "30" } satelliittia, asetuksella <c3/>. Jokainen satelliitti propagoidaan SGP4/SDP4:llä (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }), joka on validoitu virallisia AIAA 2006-6753 -vektoreita (American Institute of Aeronautics and Astronautics) vasten. Sama tilannekuva on vendoroitu tiedostoksi <c4/>, ja <c5/> noutaa tuoreen. Lue osio { "3" } ennen kuin siteeraat siitä geometrialukua: tuo skenaario propagoi jokaisen satelliitin sen omasta epookista.

seg-faed28835cb2 = Synteettistä, itsenäistä esimerkkiä varten <c1/> antaa kuusi GPS:n kaltaista satelliittia pelkkinä rivin 2 tietueina, propagoituna analyyttisinä Kepler-alkioina, ja jokainen skenaario, jonka tyyppi on <c2/>, ilman lohkoa <c3/> rakentaa Walker-tähdistön.

seg-1c9b96a07f5b = Tutkiaksesi <b>nykyistä</b> GPS-tähdistöä (tai mitä tahansa muuta), lisää tuore tilannekuva.

seg-95bb71044de0 = { "1" }. Lataa tuore tilannekuva

seg-ab93ab55ddd9 = <a1>Celestrak</a1> jakelee NORAD-luettelon (North American Aerospace Defense Command) elementtijoukkoja, päivitettynä vähintään päivittäin. GPS:lle:

seg-da7b4b89848b = Muita hyödyllisiä ryhmiä: <c1/>, <c2/> (GLONASS, Venäjän maailmanlaajuinen satelliittinavigointijärjestelmä), <c3/>, <c4/> (ISS eli kansainvälinen avaruusasema ja muut miehitetyt asemat).

seg-d7fe0dccbc36 = Tiedosto on kolmen rivin tietueiden jono (nimi, rivi { "1" }, rivi { "2" }). Kshanan jäsennin ohittaa nimirivit, joten voit liittää tiedoston sellaisenaan.

seg-c2d6ca2089a1 = { "2" }. Lisää se skenaarioon

seg-6e221c5b640a = Aseta missä tahansa rata-skenaariossa tähdistön lohko <c1/> tilannekuvan sisällöksi:

seg-f2b0e78ef568 = (PRN on pseudosatunnaiskoodin numero, jonka GPS-satelliitti lähettää.)

seg-976bcb48df94 = Rivin { "1" } + rivin { "2" } pari propagoidaan <b>SGP4/SDP4:llä</b> (vastus- ja syväavaruustermit); pelkkä rivi { "2" } käsitellään analyyttisinä Keplerin keskialkioina. Näitä voi sekoittaa.

seg-fa1d59fc7817 = Asetus <c1/> hylkää jokaisen rivin, jonka sarakkeen 69 modulo-10-tarkistussumma on väärä — hyvä eheystarkistus juuri ladatulle tiedostolle. Oletus on <c2/>, koska synteettiset opetusskenaariot käyttävät paikkamerkkitarkistussummia.

seg-90d3872ebf87 = { "3" }. Huomioita epookeista — lue tämä ennen kuin siteeraat geometrialukua

seg-5e9056a30d53 = SGP4 propagoi jokaisen satelliitin <b>sen oman TLE-epookin</b> mukaan, ja <c1/> (tiedostossa <c2/>) palauttaa vain propagaattorit, joten skenaarioaika <c3/> sovelletaan jokaiseen satelliittiin erikseen muodossa <c4/>. Se on oikea käytäntö vain, jos kaikilla tiedoston elementtijoukoilla on yhteinen epookki.

seg-3d04797ae50e = <b>Celestrakin ryhmätiedosto ei anna sitä.</b> Tiedosto <em>ladataan</em> yhtenä hetkenä, mutta kunkin satelliitin elementtijoukko päivitetään omalla tahdillaan, joten tiedoston epookit ovat hajaantuneet usean päivän ajalle. Mitattuna tähän repositorioon vendoroiduista joukoista (rivi { "1" }, sarakkeet { "19" }–{ "32" }):

seg-5f67557dd207 = testiaineisto

seg-ce4855643f31 = joukot

seg-49a5b4798be4 = epookin hajonta

seg-b758a9b7ee02 = { "70.6" } h

seg-79e6ea88957c = { "76.4" } h

seg-e1e30f69fa4f = { "335.7" } h

seg-9d38cc073c94 = { "70.6" } h vastaa { "5.9" } GPS-kierrosta. Sellaisenaan propagoituna tasonsisäinen vaiheistus sekoittuu: satelliitit ovat oikeilla korkeuksilla ja inklinaatioilla, mutta eivät siellä, missä ne olivat minään yksittäisenä päivänä, joten näkyvä joukko, DOP (tarkkuuden heikkenemiskerroin) ja niistä laskettu saatavuus kuvaavat tähdistöä, jota ei ole koskaan ollut. Mikään jäsentimessä ei mittaa tätä hajontaa puolestasi, ja tyypit <c1/> ja <c2/> eivät tasaa epookkeja: skenaarion TLE-lohko propagoidaan aina satelliittikohtaisen epookin mukaan.

seg-fa82a18e4418 = <b>Tee sen sijaan näin.</b> Pidä epookki propagaattorin vierellä, valitse yksi viitehetki ja siirrä kunkin satelliitin <c1/> siihen. <c2/> on julkinen, joten jäsennyssilmukka on lyhyt; <c3/> (<c4/>) on tämän puun läpikäyty esimerkki:

seg-78092818695e = TEME on todellisen päiväntasaajan ja keskimääräisen kevätpisteen koordinaatisto, jossa SGP4 toimii; <c1/> kiertää sen Maahan kiinnitettyihin koordinaatteihin funktiolla <c2/>.

seg-78f483dfc3fa = Jos et tasaa, kerro se lukua raportoidessasi: se on lausuma kiertoradan <em>kuorista</em>, ei todellisesta taivaasta.

seg-34fddbd3d57f = Tämän merkitys on mitattu tiedostossa <c1/>, joka soveltaa samoja siirtymiä (viitehetki: yhdistettyjen GPS- + Galileo-testiaineistojen uusin epookki, 2026-06-07T07:{ "21" }:{ "04" } UTC (koordinoitu yleisaika)) kaksitähdistö-ARAIM-saatavuusajon (kehittynyt vastaanottimen autonominen eheyden valvonta) läpi, jonka kesto on { "24" } h. Kun VAL (pystysuuntainen hälytysraja) on { "12" } m, tasattu taivas antaa pelkälle GPS:lle { "0.993" }, yhdistetylle GPS+Galileolle { "1.000" } ja tähdistövikoja kestävälle kaksoisratkaisulle { "0.990" }; tasaamaton satelliittikohtaisen epookin käytäntö antaa samoilla syötteillä { "0.208" }, { "0.671" } ja { "0.031" } — eri johtopäätös, ei pieni virhe.

seg-49f6c8f71d99 = <a1><c1/></a1> — rata-skenaariot.

seg-c842884cb3e7 = <a1><c1/></a1> — tyypin <c2/> kentät; tyypit <c3/>, <c4/>, <c5/> ja <c6/> käyttävät samaa taulua <c7/>, ja <a2><c8/></a2> ottaa yhden kohteen <c9/>.

seg-a2c5db6dcf42 = <a1><c1/></a1> — ARAIM-moottori, jota todellisen taivaan testi ajaa.

seg-106047488885 = <c1/> — jäsennin (<c2/>, <c3/>).

seg-c9068c1bc579 = <s1>Edellinen</s1>Tulosskeema
