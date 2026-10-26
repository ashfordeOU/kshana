# docs--example-multi-tool: translations (fi)

seg-077d900655af = Lähde: <c1/>

seg-42e93cd44e94 = Esimerkki käytännössä: Kshana monityökalupohjaisen tehtäväanalyysin liimakerroksena

seg-286cf0e7bb71 = Tässä viedään yksi rata läpi standardipohjaisten yhteentoimivuuden ja tehtäväanalyysin skenaariolajien päästä päähän, ja nähdään, miten Kshana asettuu niiden korkean tarkkuuden työkalujen <em>väliin</em>, joita ohjelma jo käyttää, eikä kilpaile niiden kanssa: GMAT (General Mission Analysis Tool), Orekit ja STK (Systems Tool Kit) ratasuunnitteluun sekä Basilisk tai { "42" } asennon- ja radanhallintajärjestelmän (AOCS) simulointiin. Jokainen vaihe on ajettava skenaariolaji, ja jokaisessa tuloksessa on <c1/>, joka ilmoittaa sen soveltamisalan ja todisteiden tason.

seg-7198d05bece6 = Rehellisyysmerkintä: tämä on <em>geometrinen/analyyttinen</em> putki esivaihe-A- ja vaihtoehtovertailun tasolla (ennen tehtävän ensimmäistä muodollista suunnitteluvaihetta). Se ei ole lentodynamiikan sertifiointi; katso kunkin skenaariolajin kenttä <c1/>.

seg-70c18138497b = Muut jäljempänä käytetyt lyhenteet: FDS (lentodynamiikkajärjestelmä), CCSDS (Consultative Committee for Space Data Systems, avaruusdatajärjestelmien neuvoa-antava komitea), OEM (Orbit Ephemeris Message, ratakertoimien viesti), SGP4 (Simplified General Perturbations { "4" }, kaksirivisen elementtijoukon propagaattori), TOML (skenaariotiedoston muoto) ja CLI (komentorivikäyttöliittymä).

seg-7cc0d4d15c4a = Putki

seg-09a321d36a10 = Vaiheet ovat erillisiä ajoja: kukin ottaa syötteensä omasta skenaariotiedostostaan, joten luku siirretään vaiheesta toiseen muokkaamalla seuraavaa tiedostoa (esimerkiksi vinoetäisyys lajista <c1/> lajiin <c2/>). Skenaariolaji <c3/> voi sisältää useita lajeja yhdessä ajossa yhteisin ehdoin; katso <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Jokainen alla oleva komento ajetaan repositorion juuresta, ja sen alla oleva yhteenveto on ensimmäinen rivi, jonka kshana { $version } tulostaa mukana toimitetulle skenaariolle.

seg-7939b15235c8 = { "1" }. Tuodaan suunnittelijan tuottama rata (<c1/>)

seg-4b732dd54291 = GMAT, Orekit ja STK kaikki <em>vievät</em> CCSDS-ratakertoimien viestejä (OEM). Kshana tuo ne (sillan toinen suunta), joten Kshana-analyysi voi alkaa täsmälleen siitä radasta, jonka ratasuunnittelija on hyväksynyt, eikä uudelleen johdetusta approksimaatiosta:

seg-3136cfd5a40e = Se raportoi segmentit, kohteet, koordinaatistot ja epookkivälin sekä nopeuden johdonmukaisuustarkistuksen, mikä osoittaa efemeridin tuodun uskollisesti (edestakaisvirhe alle { "1" }×{ "10" }⁻⁶ km). Kun kentässä <c1/> annetaan sen sijaan ulkoinen tiedosto, se raportoi, mitä se jäsensi: kun sille syötetään OEM, jonka <c2/> kirjoittaa, se tulostaa <c3/>. Kenttä <c4/> sanoo selvästi, että tämä on rakenteellinen ja fysikaalinen tuontitarkistus, ei lähteen ratatarkkuuden validointi.

seg-e2c563fcb8cb = { "2" }. Milloin se näkyy maa-asemalle? (<c1/>)

seg-d66361888ede = Ennustaa nousu- ja laskuylitykset aseman yläpuolella korkeuskulmamaskin ylittävänä: signaalin hankinta (AOS), lähimmän etäisyyden hetki (TCA), signaalin menetys (LOS), suurin korkeuskulma ja kesto sekä kokonaisnäkyvyysaika. Tämä on maasegmentin suunnittelukysely. Rata on SGP4-elementtijoukko, joka on viety Maahan sidottuun koordinaatistoon IAU 2006/2000A -ketjulla, ja korkeuskulmat ovat näennäisiä: ITU-R P.834-9 -refraktio ja laskevan yhteyden valoaika, kumpikin erikseen kytkettävissä (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Onko yhteys toteutettavissa? (<c1/>)

seg-47bdb9d4700c = Syötä ylitykselle vinoetäisyys ja päätelaitteen luvut CCSDS { "401" } / DSN 810-005 (NASAn Deep Space Network) -linkkiyhtälöön:

seg-db12a99edcd2 = Raportoi vapaan tilan etenemishäviön (FSPL), kantoaallon ja kohinatiheyden suhteen (C/N₀), bittikohtaisen energian ja kohinatiheyden suhteen (Eb/N₀), marginaalin ja sen, onko yhteys <b>toteutettavissa</b> vaadittua Eb/N₀-arvoa vasten: tämä on tiedonsiirron toteutettavuustarkistus, joka muuttaa lauseen ”se näkyy” lauseeksi ”voimme todella ladata datan alas”. Luvut seuraavat suoraan tiedoston syötteistä (tässä { "55" } dBW EIRP, tehollinen isotrooppinen säteilyteho, { "53" } dB/K:n vastaanoton G/T-arvoon, vahvistuksen ja kohinalämpötilan suhteeseen); syötä oman päätelaitteen luvut ennen marginaalin lukemista. Se on deterministinen laskenta, ei kalibroitu päätelaitteen datalehti.

seg-85ad46986461 = { "4" }. Kuinka nopeasti ympäristö laskee sen rataa? (<c1/>)

seg-8977b12fd934 = Ohjaa termosfäärin neutraalitiheyttä auringon (F10.7, { "10.7" } cm:n radiovuo, ja sen 81 vuorokauden keskiarvo F10.7a) ja geomagneettisen (Kp- ja ap-indeksit) aktiivisuuden mukaan Jacchia-71-eksosfäärilämpötilan kautta. Se kuvaa aurinkosyklin ~{ "5" }–{ "10" }-kertaisen tiheysvaihtelun, jonka staattinen ilmakehä jättää pois, joten radan elinikä- tai ilmanvastusarvio heijastaa avaruussäätilaa eikä kiinteää ilmakehää. Versiosta { "0.30" } alkaen tiheys on Jacchia { "1971" } -termosfääritiheys, joka on karakterisoitu NRLMSISE-00:aa (Naval Research Laboratory, massaspektrometri ja epäkoherentti sironta) vasten mutta ei ole dataan validoitu NRLMSISE-00-ilmakehä.

seg-4b5bdadf3e7e = { "5" }. Annetaan tulos takaisin (viennit)

seg-f4a438636ea8 = Sama CLI kirjoittaa standarditiedostoja seuraavaa työkalua varten. <c1/>-skenaariossa <c2/> kirjoittaa CCSDS OEM { "2.0" } -efemeridin nopeuksineen (tiedosto, jonka GMAT, Orekit ja STK lukevat), <c3/> SP3-tarkan efemeridin (Standard Product { "3" }) ja <c4/> CCSDS Orbit Mean-Elements Message -luettelon. <c5/> kattaa katselimet: CZML (Cesium Language), KML (Keyhole Markup Language, Google Earthia varten), GeoJSON, STK-efemeriditiedostot (<c6/>, yksi satelliittia kohden sekä käyttäjä) ja SigMF-tallenteet (Signal Metadata Format) skenaariolajista <c7/>. <c8/> kertoo, mitkä pätevät skenaarioon. Kuuta varten skenaariolaji <c9/> tuottaa kuun koordinaatiston, aika-asteikon ja efemeridin CCSDS OEM -muodossa yhteensopivuustarkistuksineen. Katso <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Miksi tämä on liimakerros eikä kilpailija

seg-cd78b0435abb = Jokainen vaihe on pieni, auditoitava, toistettava skenaario selkeällä soveltamisalamerkinnällä. Korkean tarkkuuden työkalut omistavat ratojen optimoinnin, kuusivapausasteisen (6-DoF) AOCS:n ja aerotermisen laskeutumisen (EDL); Kshana omistaa <b>avoimen, siteerattavan, ajettavan yhdistävän kudoksen</b>: se tuo vakiomuodot, vastaa läpileikkaaviin geometria- ja toteutettavuuskysymyksiin ja välittää tuloksen eteenpäin tasolla, jonka mikä tahansa kumppani voi ajaa ilman lisenssiä. Katso myös täydentävät tehtäväanalyysilajit <c1/>, <c2/>, <c3/>, <c4/> ja <c5/>.

seg-af1ab3c55fe6 = <s1>Edellinen</s1>{ "3" } · Kvantti vastaan klassinen

seg-b0765a28b4ce = <s1>Seuraava</s1>Skenaariolajit

seg-dc88ec5ccc43 = { "1" }. Tuodaan suunnittelijan tuottama rata (oem-interop)

seg-cdff21ef6984 = { "2" }. Milloin se näkyy maa-asemalle? (passes)

seg-afa47b4283a3 = { "3" }. Onko yhteys toteutettavissa? (link-budget)

seg-e508e844bf2d = { "4" }. Kuinka nopeasti ympäristö laskee sen rataa? (space-weather)
