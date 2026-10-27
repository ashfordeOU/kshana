# docs--machine-inputs: translations (fi)

seg-e9650a618b38 = ID

seg-b9f561201fda = Lähde: <c1/>

seg-536f71da4541 = Kone- ja anturisyötteet ({ "0.38" })

seg-1a91f96f22ab = Lukijat, jotka tuovat muita vastaanottimia, ratkaisijoita ja antureita skenaariolajiin <c1/>. Jokainen on vain luku: puhtaita funktioita tavuille tai tekstille, jotka palauttavat saman aikajanan kuin UBX-, RINEX-, Android- ja NMEA-lukijat, ohittaen ja laskien vioittuneet tietueet epäonnistumisen sijaan. Kaikki täällä on MODELLED: formaatit luetaan julkisesta dokumentaatiosta, eikä mitään tulosta ole validoitu ulkoista oraakkelia vastaan sen lisäksi, mitä on ilmoitettu.

seg-3176ffff1e44 = <b>Ohjeellinen ohjelmisto.</b> Ei tyyppihyväksytty navigointilaite. Käyttäjä vastaa edelleen aluksen turvallisesta navigoinnista.

seg-367ac9b4a8a6 = Mitä `kshana imu-fit` lukee paikallaan olevasta IMU-lokista, moottorin v{ $version } todellisesta ajosta tekaistulla lokilla ({ "20,000" } näytettä taajuudella { "100" } Hz, { "200" } s): kiihtyvyysmittarin nopeuden satunnaiskävely q_va = { "4.02e-06" }, gyron kulman satunnaiskävely q_arw = { "9e-08" }, harhan epävakaus { "0.00296" } ja Allanin poikkeaman varhaiset kulmakertoimet (-0.51 ja -0.49; noin -0.5, missä valkoinen kohina hallitsee). Vieressä oleva taulukko on komennon tulostama TOML. Estimaattori on tarkistettu vain synteettisillä lokeilla. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-a048ba8ff88e = RTKLIB-tiedosto <c1/> (<c2/>)

seg-3ba911ed9541 = Ratkaisutiedosto, jonka kirjoittavat RTKLIBin <c1/> ja RTKPOST. Luetaan: aika (kalenteri <c2/> tai GPS-viikko ja viikon sekunnit), paikka (leveys- ja pituusaste asteina korkeuden kanssa tai ECEF X/Y/Z muunnettuna geodeettiseksi) ja satelliittien määrä. Sarakeotsikon aika-asteikko (<c3/>, <c4/>, <c5/>) kuljetetaan tunnisteessa. Aste-minuutti-sekunti-tiedostot hylätään. Rivit, jotka alkavat merkillä <c6/>, ovat otsikkorivejä.

seg-24ebc9ea6e4e = NovAtel OEM7 (<c1/>)

seg-b73d1465ed67 = ASCII-lokit (<c1/>) ja binaarilokit (otsikko <c2/>) vapaasti sekoitettuina. Rakenteet noudattavat julkista OEM7-dokumentaatiota (docs.novatel.com): viestiotsikot, 32-bittinen CRC ja kolmen lokin kenttätaulukot. Tietueet, joiden CRC ei täsmää, ohitetaan ja lasketaan.

seg-078e047b9f82 = Loki

seg-5b59f661e68b = Käytetty

seg-286c3fb8ac5c = ratkaisun tila (vain <c1/> antaa paikkaratkaisun), leveysaste, pituusaste, korkeus keskimerenpinnan yläpuolella plus undulaatio (paikkaratkaisun korkeus on ellipsoidinen), käytetyt satelliitit

seg-3edaffed5d65 = C/No signaalia kohden (dB-Hz); järjestelmä seurannan tilabiteistä 16-18, signaalityyppi biteistä 21-25

seg-5663c6812797 = vastaanottimen tilabitti { "15" } (häirintä havaittu) muuttuu epookin arvoksi <c1/> (häirintä: { "2" } merkitty, { "1" } ei merkitty; RXSTATUS:ssa ei ole harhautuslippua), verrattuna Kshanan hälytyksiin kohdalla <c2/>; apuhäirintäbitit { "1" } (RF1-RF6) palautetaan kohdassa <c3/>

seg-61d8ec169a17 = CRC-rutiini tarkistettiin sitä CRC-arvoa vasten, jonka dokumentaatio ilmoittaa omalle esimerkilleen <c1/> (viitattu, ei lainattu sanasta sanaan); testit käyttävät itse kirjoitettuja rivejä. Ei luettu: lyhennetty ASCII, muut lokit. Häirintälähettimen lippu on vastaanottimen oma ilmoitus, ei Kshanan havainto; yhtäpitävyys Kshanan monitorien kanssa ei ole validointia.

seg-b6c3919c87ad = GNSS-SDR (<c1/>)

seg-0cc992f8d61b = Katso <a1><c1/></a1>. GNSS-SDR:n NMEA- ja RINEX-tulosteet luetaan jo muodoilla <c2/> ja <c3/>; Monitor- ja PVT-monitor-UDP-virrat (Protocol Buffers) välitetään JSON-riveiksi skriptillä <c4/> ja luetaan muodolla <c5/>.

seg-cf1bf4944f6a = IMU (<c1/>)

seg-ab64a0754907 = <c1/>: otsikkorivi, joka nimeää sarakkeet, ja sen jälkeen yksi näyte riviä kohti. Sarakkeet (missä tahansa järjestyksessä, nimet kirjainkoosta riippumattomia): <c2/> sekunnit vastaanottimen lokin kellolla, <c3/>, <c4/>, <c5/> kulmanopeus yksikössä rad/s, <c6/>, <c7/>, <c8/> ominaisvoima yksikössä m/s². <c9/>: EuRoC MAV -asettelu, jossa luetaan <c10/> <c11/> (otsikot <c12/>, <c13/>, <c14/>); ensimmäinen näyte on <c15/>. Rivit, joita ei voi jäsentää, ja rivit, joiden aika ei kasva, ohitetaan. Katso <a1><c16/></a1>, miten gyrosuuntimaa käytetään.

seg-f7007cf35f53 = IMU hybrid- ja fusion-skenaarioihin (<c1/>)

seg-3fc254763f67 = Skenaariot <c1/> ja <c2/> (17-tilainen UKF) ovat simulaatioita: ne ottavat syötteenä anturikohinaparametreja (<c3/>, <c4/>: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>), ei mitattua sarjaa. <c10/> lukee nämä parametrit paikallaan olevan IMU:n lokista, joten skenaario voidaan ajaa juuri sillä anturilla, joka on todellisuudessa käytössä:

seg-86efab73b2e6 = Menetelmä: integroidun signaalin limittäinen Allanin poikkeama (<c1/>): <c2/>, sama z-gyrolle (<c3/>), <c4/> ja <c5/> keskiarvoina sekä <c6/> käyrän minimiarvona, kun käyrä kääntyy sen jälkeen ylöspäin. <c7/> ei soviteta (se vaatisi lokin, joka on paljon pidempi kuin vähimmäispituus). Raportissa on lokin näytteenottotaajuus ja kesto sekä kunkin kanavan varhainen Allanin kulmakerroin (noin -0.5 siellä, missä valkoinen kohina hallitsee); loki, joka ei ole paikallaan, on liian lyhyt (alle { "2000" } näytettä) tai epätasaisesti näytteistetty, hylätään tai antaa parametreja, jotka kulmakertoimet merkitsevät. Taulukon alkuperätiedoissa mainitaan lokin SHA-256. MODELLED: estimaattori on tarkistettu synteettisillä valkoisen kohinan lokeilla, joiden kertoimet tunnetaan (kertoimet palautuvat enintään { "10" } % virheellä), ei ulkoista oraakkelia vasten. Saatavilla komentorivillä, Pythonissa (<c8/>), WebAssemblyssä (<c9/>), MCP:ssä (<c10/>) ja liitännäisessä (<c11/>).

seg-b3c592f63798 = RTCM { "3" } MSM4 ja MSM7 (<c1/>)

seg-0f8b986cff40 = Tavuvirta, jossa on RTCM { "3" } kehyksiä (tukiaseman tai vastaanottimen havaintotuloste). Luetaan: MSM4- ja MSM7-viestit (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS 1114/1117, BeiDou 1124/1127, NavIC 1134/1137): epookki ja jokaisen signaalisolun kantoaalto-kohinasuhde (MSM4: { "6" } bittiä, dB-Hz; MSM7: { "10" } bittiä, 1/16 dB-Hz), jota C/N0-monitorit tarvitsevat. Pseudoetäisyys- ja vaihekentät ohitetaan, niitä ei käytetä, joten RTCM antaa luottamusmonitoreille C/N0:n eikä muuta; MSM ei sisällä sijaintia. Kehykset, joiden CRC-24Q on virheellinen, ohitetaan ja lasketaan.

seg-d70038a737dc = <b>Mistä asettelu tulee.</b> Ei RTCM-standardista (maksullinen asiakirja, jota ei ole käytetty), vaan avoimen lähdekoodin pyrtcm-dekooderista { "1.2.0" }, BSD 3-Clause, jonka lisenssi ja huomautus ovat tiedostossa <c1/> (omistajan päätös { "18" }. lokakuuta { "2026" }: ”käytä avoimia dekoodereita”). pyrtcm ilmoittaa taulukoidensa noudattavan standardia RTCM { "10403.3" }; Kshana nojaa julkaistuihin taulukoihin pyrtcm:n lisenssillä eikä esitä väitteitä standardista. Aika: MSM ei sisällä viikkoa, joten merkinnät ovat muotoa <c2/>; GLONASS-epookit (Moskovan aika) siirretään GPS-aikaan arvolla GPS-UTC = { "18" } s (arvo 2017-01-01 alkaen).

seg-ee04a86f8f00 = Tarkistettu seuraavia vasten: CRC-24Q-luettelon tarkistusarvo (<c1/> antaa <c2/>) ja kertaluonteisesti kehityksen aikana pyrtcm:n oma dekooderi samoilla itse kirjoitetuilla kehyksillä (sama C/N0). Testiaineisto on itse kirjoitettu; todellisesta vastaanottimesta ei ole otettu tallennetta, joten lukija on MODELLED, kunnes se on lukenut sellaisen.

seg-94f0e4db92df = <s1>Edellinen</s1>Jammertest erotuomarina

seg-8d660b4049e4 = <s1>Seuraava</s1>Luetut vastaanotinprotokollat

seg-c5412c255f99 = RTKLIB .pos (format = "rtklib-pos")

seg-c86a9b2ce59b = NovAtel OEM7 (format = "novatel")

seg-61748cf7559e = GNSS-SDR (format = "gnss-sdr")

seg-b0b5f9a66eed = IMU ([log.imu])

seg-03a6e15dce0a = IMU hybrid- ja fusion-skenaarioihin (kshana imu-fit)

seg-53ce2c4ba434 = RTCM { "3" } MSM4 ja MSM7 (format = "rtcm3")
