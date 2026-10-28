# docs--glossary: translations (fi)

seg-daf25c6479c1 = Standardit

seg-c851aa23ea42 = pilkuilla erotetut arvot

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = lämpötilakompensoitu kideoskillaattori

seg-1bac97ee312a = rubidiumatomitaajuusnormaali

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-5907283b71da = Lyhenne

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = järjestelmien välinen harha

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvanttiprojektiokohina

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = kantoaalto-kohinatiheyssuhde

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital object identifier

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Kansainvälinen avaruusasema

seg-865e7d1794b6 = Secure Hash Algorithm, 256-bittinen

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrakorkea taajuus

seg-6ce4c2164aee = Lähde: <c1/>

seg-bee5d056ef03 = Kshanassa käytettyjen termien selkokieliset määritelmät. Jokainen merkintä alkaa yhdellä rivillä ”selkokielellä” ja lisää sitten tarkan merkityksen, kun siitä on hyötyä. Lyhenteet, joita ei ole määritelty jossakin jaksossa, ovat A–Ö-taulukossa lähellä loppua, <a1>Kaikki muut lyhenteet, A–Z</a1>.

seg-f8c5433d1026 = Navigointi ja ajoitus

seg-2a42d84608ea = <b>PNT — paikannus, navigointi ja ajanmääritys (Positioning, Navigation, and Timing).</b> Tietää tarkasti, <em>missä</em> ollaan, <em>mihin suuntaan</em> mennään ja <em>mikä kellonaika</em> on. Nykyaikainen PNT tulee enimmäkseen satelliittisignaaleista (GNSS, maailmanlaajuiset satelliittinavigointijärjestelmät, jotka määritellään seuraavaksi); Kshana tutkii, mitä <em>ajalle</em> ja <em>paikalle</em> tapahtuu, kun nämä signaalit menetetään.

seg-6227db2c94e1 = <b>GNSS — maailmanlaajuinen satelliittinavigointijärjestelmä (Global Navigation Satellite System).</b> Satelliittitähdistöt, jotka tarjoavat PNT:n: GPS (Global Positioning System, USA (Yhdysvallat)), Galileo (EU), GLONASS (Venäjän maailmanlaajuinen satelliittinavigointijärjestelmä), BeiDou (Kiina). Vastaanotin, joka näkee ≥ { "4" } satelliittia, voi laskea täyden 3D-paikka- ja aikaratkaisun.

seg-f8eda357e640 = <b>GNSS-katko / estetty / heikentynyt / häiritty.</b> Kun satelliittisignaalit eivät ole saatavilla (estetty, häiritty tai näkyvyyden ulkopuolella). Katkon aikana järjestelmän on ”liukuttava” omien kyytianturiensa varassa. Kshanan koko tarkoitus on mitata, kuinka hyvin se liukuu.

seg-a3ade199f465 = <b>Holdover (ajanpito ilman ulkoista viitettä).</b> Selkokielellä: <em>kuinka kauan kello pitää hyvää aikaa omillaan GNSS:n menetyksen jälkeen.</em> Parempi kello pitää pidempään, ennen kuin sen virhe ylittää sallitun rajan.

seg-83b33c15312f = <b>Dead reckoning (laskennallinen paikanmääritys).</b> Selkokielellä: <em>paikan arviointi laskemalla yhteen mitattu liike ilman ulkopuolista viitettä.</em> Virheet kasautuvat, joten parempi inertia-anturi ajautuu hitaammin.

seg-da9bcc994b9c = <b>Määrittely / kynnys.</b> Suurin sallittu virhe, ennen kuin ratkaisu lasketaan ”määrittelyn ulkopuoliseksi”, esimerkiksi ”ajoituksen on pysyttävä { "20" } ns:n sisällä” tai ”paikan { "100" } m:n sisällä”.

seg-6f37a60a30c7 = Anturit, joita Kshana vertaa

seg-308b59d89586 = <b>Kello (atomikello).</b> Laite, joka pitää aikaa laskemalla atomin luonnollisia värähtelyjä. Kaksi esimerkkiä:

seg-3389d08be6bc = <b>CSAC — sirumittakaavan atomikello (Chip-Scale Atomic Clock).</b> Pieni, käytössä oleva kaupallinen kello (”klassinen” vertailukohta). Hyvä, mutta ajautuu havaittavasti pitkän katkon aikana.

seg-3e121d8e6400 = <b>Optinen hilakello (esim. strontium).</b> Paljon vakaampi ”kvanttikello”; laboratorioiden huippua, ei vielä lennetty avaruudessa.

seg-4daa6cdf8ae2 = <b>Kiihtyvyysanturi.</b> Mittaa kiihtyvyyttä (liikkeen muutosta). Kahdesti integroituna se antaa paikan, joten kaikki virheet kasvavat nopeasti. <b>Kylmäatomikiihtyvyysanturi</b> on kvanttiversio, jonka pitkän aikavälin vakaus on paljon parempi; <b>navigointiluokan</b> anturi on klassinen.

seg-91793676c57c = <b>Gyroskooppi.</b> Mittaa kiertoa. Pieni kiertovirhe kallistaa alustaa, mikä vuotaa painovoiman vaakasuuntaan ja turmelee paikka-arvion.

seg-2d36110effc3 = <b>IMU — inertiamittausyksikkö (Inertial Measurement Unit).</b> Itse kiihtyvyysanturi- ja gyroskooppipaketti: kolme akselia kumpaakin, jotka raportoivat ominaisvoiman ja kulmanopeuden. Se mittaa liikettä; yksinään se ei tiedä, missä on.

seg-e3b6b40e0cd0 = <b>INS — inertiaalinen navigointijärjestelmä (Inertial Navigation System).</b> IMU sekä ”mekanisaatio”, joka integroi sen tulosteen asennoksi, nopeudeksi ja paikaksi. INS on se, joka laskee paikan GNSS-katkon läpi, ja sen tarkkuuden asettavat alla luetellut IMU-virheprosessit.

seg-a618ff7ee429 = <b>Ajansiirto.</b> Tarkan aikasignaalin lähettäminen kahden paikan välillä (esim. satelliitista satelliittiin). <b>Optiset</b> yhteydet ovat paljon tarkempia kuin <b>RF</b>-yhteydet (radiotaajuus).

seg-847fbbeecfae = Miten virheet mallinnetaan (kellokohina)

seg-5cf197bdbbad = Kellovirhe rakennetaan tavallisista ”kohinatyypeistä”, joista jokaisella on tunnettu tunnusomainen piirre:

seg-3806d1b1cb50 = <b>Valkoinen FM (valkoinen taajuusmodulaatio).</b> Selkokielellä: <em>nopea satunnainen häilyntä kellon nopeudessa.</em> Sen keskiarvoistaminen paranee ajan myötä. Parametri <c1/>.

seg-0793fdd3abab = <b>Satunnaiskävely-FM.</b> Selkokielellä: <em>kellon nopeus vaeltaa hitaasti.</em> Tämä hallitsee pitkiä katkoja. Parametri <c1/>.

seg-42b74c8b88ff = <b>Flicker-FM (1/f-kohina).</b> Selkokielellä: <em>itsepäinen kohinalattia, jonka alle kello ei voi koskaan keskiarvoistaa.</em> Se on tasainen keskiarvoistusaikojen yli. Parametri <c1/>.

seg-b3bd841a5a2d = <b>Vanheneminen / ajautuminen.</b> Hidas, <em>ennustettava</em> nopeuden muutos ajan myötä; koska se on ennustettavissa, Kshanan estimaattori poistaa sen. Parametri <c1/>.

seg-d929960492e4 = <b>VRW — nopeuden satunnaiskävely (Velocity Random Walk).</b> Kiihtyvyysanturin vastine valkoiselle kohinalle: satunnaisia nopeuspotkuja, jotka kasautuvat paikkavirheeksi. Parametri <c1/>.

seg-4a97f8d14174 = <b>ARW — kulman satunnaiskävely (Angular Random Walk).</b> Gyroskoopin vastine: satunnaisia potkuja asentoon. Parametri <c1/>.

seg-dcd03b326110 = Miten vakaus mitataan

seg-2181832c6253 = <b>Allanin poikkeama (<c1/>).</b> Selkokielellä: <em>vakiotapa ilmoittaa, kuinka vakaa kello on tietyllä keskiarvoistusajalla <c2/>.</em> Kellon datalehti ilmoittaa esim. <c3/>. Kshana validoi kellomallinsa laskemalla oman tulosteensa Allanin poikkeaman ja tarkistamalla, että se vastaa julkaistua lukua. (Lähde: Riley, NIST SP { "1065" }, National Institute of Standards and Technology Special Publication { "1065" }.)

seg-11cbe561e633 = <b>PSD — tehospektritiheys (Power Spectral Density).</b> Miten kohinan teho jakautuu taajuuksille; muodollinen tapa määritellä valkoinen / satunnaiskävely- / flicker-kohina.

seg-0737d620eb5f = Laatumittarit (miten ajo pisteytetään)

seg-20b66e0d4809 = Kuusi Kshanan raportoimaa operatiivista PNT-laatumittaria (katso README:n ”Output”-taulukko):

seg-b17d08246e49 = <b>FoM — laatumittari (Figure of Merit).</b> Yksi luku, joka pisteyttää yhden ajon osa-alueen ja raportoidaan yksikön kanssa sekä sen kanssa, onko se validoitu vai mallinnettu. Alla olevat kuusi ovat Kshanan operatiiviset FoM:t.

seg-b229a69fb4ac = <b>Paikannus- / ajoitussuorituskyky</b> — virheen suuruus RMS-arvona (neliöllinen keskiarvo) ja 95. persentiilinä.

seg-ba3ed5a28518 = <b>Autonomia</b> — holdover-kesto (kuinka kauan se pysyy määrittelyssä ilman GNSS:ää).

seg-13ecdd037098 = <b>Kestävyys</b> — kuinka nopeasti virhe kasvaa GNSS:n menetyksen jälkeen.

seg-be0168f24d6e = <b>Saatavuus</b> — ajon osuus, jolla on määrittelyn mukainen ratkaisu.

seg-44ef500b371d = <b>Eheys</b> — <em>voiko luottaa järjestelmän omaan virhearvioon?</em> Kshana raportoi katkon näytteiden osuuden, joiden todellinen virhe pysyy suodattimen suojarajan sisällä.

seg-d1cc3819cde9 = <b>Turvallisuus</b> — kestävyys harhautusta vastaan: kellon vakauteen perustuva harhautuksen havaittavuuspistemäärä (versiosta { "v0.3.0" } alkaen), jolla on merkitystä vain, kun harhautushyökkäysskenaario on määritetty. Se <em>ei</em> ole ilmailuluokan eheys: se ei laske vaakasuuntaista eikä pystysuuntaista suojaustasoa (HPL/VPL) eikä aja vastaanottimen autonomista eheysvalvontaa (RAIM), ei edistynyttäkään. Ne tulevat erillisistä eheys- ja ARAIM-skenaariolajeista (edistynyt RAIM), ja ne määritellään alla kohdassa ”Eheys ja täydennys”. Vientirajoituksen alainen.

seg-5cae59204d9e = Laatumittarien rinnalla käytettyjä termejä:

seg-7adc0e49a981 = <b>Harhautus (spoofing).</b> Selkokielellä: <em>väärennetty satelliittisignaali, joka valehtelee paikasta tai ajasta.</em> Harhauttaja syöttää vastaanottimelle uskottavan mutta väärän vastauksen, mikä on häirintää pahempaa, koska vastaanotin ei välttämättä huomaa sitä.

seg-2d2e6cbeade6 = <b>1-DOF — yksi vapausaste.</b> Yksi akseli. Kshanan skenaariopaketin paikkavirhe on yksiakselinen; täysi 3D-vastaus vaatii kolmiakselisen mallin.

seg-14a32d281c4b = <b>Monte Carlo -ensemble.</b> Saman skenaarion ajaminen monta kertaa eri satunnaisilla siemenluvuilla ja tulosten hajonnan raportointi yhden ajon sijaan.

seg-fcbea49a3592 = <b>CI — luottamusväli (confidence interval).</b> Väli, jolle tilastoluvun odotetaan osuvan ilmoitetulla todennäköisyydellä (esimerkiksi { "95" } %). README:n taulukoissa ja merkeissä ”CI” tarkoittaa useammin <b>jatkuvaa integrointia</b> (continuous integration) — automaattista rakennus- ja testiajoa jokaisella muutoksella; asiayhteys kertoo, kumpi.

seg-310abfd6a64c = <b>k-sigma-raja.</b> Raja, joka asetetaan <em>k</em> keskihajonnan päähän suodattimen omasta epävarmuudesta; Eheys-laatumittari laskee, kuinka usein todellinen virhe pysyy sen sisällä.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS — ympyräsäteinen todennäköinen virhe / kaksinkertainen neliöllinen keskietäisyys.</b> Kaksi vakiotapaa ilmoittaa 2D-vaakatarkkuus: CEP on säde, joka sisältää { "50" } % paikkaratkaisuista; 2DRMS on kaksi kertaa vaakavirheen neliöllinen keskiarvo. Kirjasto voi laskea molemmat paikan kovarianssista (<c1/>), mutta mikään skenaariolaji ei vielä raportoi niitä.

seg-fd93c1effba8 = Tuloksen lukeminen: tulosteen termit

seg-3432498093cf = Nämä ovat nimet, joita tulostiedostossa tai leikkikentän yhteenvedossa kohdataan, ensin selkokielellä.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> Selkokielellä: <em>kuinka monta sekuntia järjestelmä pysyi virherajansa sisällä GNSS:n menetyksen jälkeen.</em> Kshana raportoi lyhimmän tällaisen liukumisen ajon kaikkien katkojen yli, mitattuna ajon aikaruudukolla, joten se on alaraja aika-askeleen tarkkuudella. Holdover, joka on yhtä suuri kuin katkon pituus, tarkoittaa, ettei rajaa koskaan ylitetty.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> Selkokielellä: <em>{ "95" } % ajasta ajoitusvirhe oli tämän suuruinen tai pienempi.</em> Se on virheen 95. persentiili katkon yli. Hyvin pieni arvo voi näkyä lyhyessä yhteenvedossa muodossa <c2/>; tulos-JSON-tiedostossa (JavaScript Object Notation) on koko tarkkuuden luku.

seg-4dfaee63262d = <b>Eheys (<c1/>).</b> Selkokielellä: <em>kuinka usein järjestelmän oma virhearvio oli rehellinen.</em> Se on katkon näytteiden osuus, joiden todellinen virhe pysyi suodattimen k-sigma-rajan sisällä (määritelty alla). Arvo lähellä { "1" } tarkoittaa, ettei estimaattori aliarvioinut virhettään. Se ei ole ilmailun suojaustaso; katso ”Eheys ja täydennys” alla ja <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Turvallisuuspistemäärä (<c1/>).</b> Selkokielellä: <em>kuinka todennäköisesti harhautushyökkäys jää kiinni.</em> Se on todennäköisyys, että määritetty hyökkäys havaitaan, eli yksi miinus havaitsematta jäämisen todennäköisyys <c2/>, johdettuna kellon vakaudesta. Sillä on merkitystä vain, kun skenaario määrittää harhautushyökkäyksen. Kun hyökkäystä ei ole määritetty, yhden rivin yhteenveto tulostaa <c3/> ja tulos merkitsee luvun <c4/> lohkossaan <c5/>; arvo pysyy asiakirjassa ja tarkoittaa ”ei sovellettavissa”, ei ”nollaturvallisuutta”.

seg-70113d509997 = <b>PDOP — paikan tarkkuuden heikkenemiskerroin (avaimet kuten <c1/>).</b> Selkokielellä: <em>kuinka paljon satelliittigeometria suurentaa etäisyysvirheen paikkavirheeksi.</em> Paikkavirhe on suunnilleen PDOP kertaa etäisyysvirhe, joten pienempi on parempi. Katso <b>DOP</b> kohdasta ”Estimointi ja geometria”.

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, Allanin poikkeama).</b> Selkokielellä: <em>kuinka paljon kellon nopeus heiluu, kun se keskiarvoistetaan ajalla <c2/>.</em> Datalehden rivi kuten <c3/> tarkoittaa, että yhden sekunnin yli keskiarvoistettu nopeus vaihtelee noin { "3" } osaa luvussa 10¹⁰. Pienempi on vakaampi kello. Katso ”Miten vakaus mitataan” yllä.

seg-03b4bb05148d = <b>q_wf — valkoisen taajuuskohinan intensiteetti.</b> Selkokielellä: <em>kellon nopeuden nopean satunnaisen häilynnän voimakkuus.</em> Se on kerroin lausekkeessa <c1/> valkoiselle taajuuskohinalle, joten skenaario asettaa arvon <c2/> datalehden yhden sekunnin Allanin poikkeamasta. Sen kumppanit ovat <c3/> (satunnaiskävelytaajuuskohina) ja <c4/> (vanheneminen); katso ”Miten virheet mallinnetaan” yllä.

seg-074a1337ed99 = Telealan ajoitustermit

seg-9f61398628e4 = Telekommunikaatioverkot jakavat aikaa pakettiverkkojen yli (Precision Time Protocol) GNSS-syötteisestä vertailukellosta, ja International Telecommunication Union Telecommunication Standardization Sector (ITU-T) asettaa rajat aikavirheelle, jonka kukin kello saa lisätä. Nämä termit esiintyvät skenaariolajissa <c1/>; katso <a1><c2/></a1>.

seg-f48712300b30 = <b>TE — aikavirhe (time error).</b> Selkokielellä: <em>kuinka kaukana kellon aika on vertailuajasta yhdellä hetkellä.</em> Positiivinen tai negatiivinen, yleensä nanosekunteina.

seg-ceda70656c6a = <b>max|TE| — suurin absoluuttinen aikavirhe.</b> Selkokielellä: <em>mittauksen aikana nähty pahin aikavirhe etumerkistä riippumatta.</em> Se on pääraja, jonka useimmat maskit asettavat.

seg-38d2922cd91d = <b>cTE — vakioaikavirhe (constant time error).</b> Selkokielellä: <em>aikavirheen tasainen siirtymäosa</em> — keskimääräinen virhe, joka ei muutu mittauksen aikana.

seg-a4a61df332cd = <b>dTE — dynaaminen aikavirhe (dynamic time error).</b> Selkokielellä: <em>aikavirheen heilahteleva osa</em> — mitä jää jäljelle, kun vakiosiirtymä on poistettu. Sitä arvioidaan MTIE:llä ja TDEV:llä.

seg-31c0a85788b1 = <b>MTIE — suurin aikaväliryhmän virhe (maximum time interval error).</b> Selkokielellä: <em>suurin aikavirheen heilahdus, joka nähdään missä tahansa tietyn pituisessa ikkunassa.</em> Jokaiselle ikkunan pituudelle se liu'uttaa ikkunaa tietueen yli ja ottaa suurimman huipusta huippuun -muutoksen; maski antaa suurimman sallitun arvon kullekin ikkunan pituudelle.

seg-53fa12cab0c6 = <b>TDEV — aikapoikkeama (time deviation).</b> Selkokielellä: <em>aikavirheen tyypillinen (neliöllinen keskiarvo) vaellus tietyllä keskiarvoistusajalla,</em> kun lyhytaikainen häilyntä on keskiarvoistettu pois. Se on Allanin poikkeaman aika-alueen serkku ja sitä tarkistetaan MTIE:n tavoin maskia vasten.

seg-62b5eea14f6c = <b>PRTC — ensisijainen vertailuaikakello (primary reference time clock).</b> Telealan ajoitusketjun huipulla oleva kello, jota tavallisesti ohjaa GNSS. Sen suorituskykyrajat ovat ITU-T:n suosituksessa G.8272.

seg-8d6d4538981b = <b>ePRTC — parannettu ensisijainen vertailuaikakello (enhanced primary reference time clock).</b> PRTC, jolla on tiukempi aikavirherajoitus ja jonka tukena on erittäin vakaa paikallinen atomikello, jotta se voi pitää aikaa pitkän GNSS-menetyksen läpi. ITU-T:n suositus G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC — telealan rajakello (telecom boundary clock).</b> Verkkokello, joka vastaanottaa aikaa ylävirrasta ja välittää sen alavirtaan lisäten hieman omaa aikavirhettään. ITU-T:n suositus G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC — telealan aikaorjakello (telecom time slave clock).</b> Ketjun päässä oleva kello, joka vastaanottaa aikaa ja tarjoaa sen laitteille, jotka sitä tarvitsevat (esimerkiksi tukiasemalle). Sekin kuuluu ITU-T:n suositukseen G.8273.2.

seg-04d8ed12ca88 = <b>OCXO — uunistabiloitu kideoskillaattori (oven-controlled crystal oscillator).</b> Kvartsioskillaattori, joka pidetään vakiolämpötilassa pienessä uunissa, mikä tekee siitä paljon vakaamman kuin tavallisen kvartsioskillaattorin. Yleinen holdover-kello verkkolaitteissa; se vanhenee (ajautuu) havaittavasti päivien kuluessa.

seg-6742f7ba35ac = <b>CSAC — sirumittakaavan atomikello (chip-scale atomic clock).</b> Hyvin pieni atomikello (katso ”Anturit, joita Kshana vertaa” yllä). Vakaampi pitkissä holdover-jaksoissa kuin OCXO, korkeammalla hinnalla ja tehonkulutuksella.

seg-c0e0c18bd867 = Todisteiden tasot: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Jokaisella koneellisesti tarkistetun varmennusmatriisin (<a1><c1/></a1>) ominaisuudella on yksi kolmesta tasosta.

seg-13fb20435df3 = <b>VALIDATED.</b> Selkokielellä: <em>tarkistettu jonkun muun vastausta vasten.</em> Ominaisuuden tulosta verrattiin riippumattomaan ulkoiseen oraakkeliin — todelliseen mitattuun dataan, jonkun muun kirjoittamaan riippumattomaan kirjastoon tai julkaistuihin vertailuarvoihin — ja se vastasi ilmoitetun toleranssin sisällä. Jatkuvan integroinnin tarkistus hylkää VALIDATED-rivin, joka ei nimeä mitään ulkoista oraakkelia.

seg-a5dfb48e4dcb = <b>MODELLED.</b> Selkokielellä: <em>rakennettu järkevästä fysiikasta ja tarkistettu sisäisen johdonmukaisuuden osalta, mutta ei vielä verrattu ulkopuoliseen vastaukseen.</em> Luvuilla on merkitystä vertailussa ja suunnitteluvaihtoehdoissa; ne eivät ole todiste siitä, että todellinen laite toimisi niin. <a1><c1/></a1> selittää, miksi kukin tällainen rivi on mallinnettu.

seg-0512b2d2145a = <b>PARTNER.</b> Selkokielellä: <em>tämä osa kuuluu laitteisto- tai tuotevarmistuskumppanille, eikä Kshana väitä siitä mitään.</em> Rivi on olemassa, jotta aukko on näkyvä eikä hiljainen.

seg-278dee6d3d4c = Spektri- ja häiriötermit

seg-285a240c9958 = Nämä termit esiintyvät skenaariolajissa <c1/>; katso <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n) — binäärinen vaihesiirtoavainnus nopeudella n × { "1.023" } Mchip/s.</b> GPS L1:n karkean hankinnan (C/A) ja L2:n siviilisignaalin (L2C) suorakulmainen sirumodulaatio (n = { "1" }) sekä GPS L5:n ja Galileo E5a:n (n = { "10" }). Sen spektri on sinc², jonka nollakohdat ovat n × { "1.023" } MHz:n välein.

seg-cdd0f4194f42 = <b>BOC(m, n) — binäärinen offset-kantoaalto.</b> Hajotuskoodi nopeudella n × { "1.023" } Mchip/s kerrottuna neliöaaltoaliantokantoaallolla taajuudella m × { "1.023" } MHz, mikä jakaa spektrin kahteen keilaan kantoaallon kummallekin puolelle.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multipleksattu binäärinen offset-kantoaalto.</b> Tehospektritiheys 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), sovittu Galileo E1:n avoimelle palvelulle ja GPS L1C:lle; Galileo lähettää sen yhdistelmä-BOC:na (CBOC).

seg-7423f94e3018 = <b>CW — jatkuva aalto (continuous wave).</b> Moduloimaton kantoaalto: yksi sävy.

seg-55d03dd4af03 = <b>J/S — häirintä-signaalisuhde (jammer-to-signal ratio).</b> Vastaanotetun häirintätehon suhde vastaanotettuun signaalitehoon, desibeleinä.

seg-b0f2974647d4 = <b>SSC — spektrinen erotuskerroin (spectral separation coefficient).</b> κ = ∫ G_s(f) G_j(f) df vastaanotinkaistan yli: kuinka suuri osa yksikkötehoisen häiritsijän spektristä osuu sinne, minne signaalinkin. Tehollinen kantoaalto-kohinatiheys on [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Kohinaluku.</b> Kuinka paljon vastaanotin lisää lämpökohinaan, suhteena F desibeleinä; järjestelmän kohinalämpötila on T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Vesiputouskuva.</b> Spektrin aika-taajuuskuva: taajuus vaakasuunnassa, aika alaspäin, väri tehoa varten.

seg-3b1ac094fdc5 = <b>Welch-estimaatti.</b> Tehospektritiheys, joka on estimoitu keskiarvoistamalla ikkunoituja, limittäisiä periodogrammeja (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Avoin tallennusmuoto: JSON-tiedosto <c1/>, joka kuvaa raakanäytetiedoston <c2/> (tässä kompleksiset <c3/>, <c4/> tai <c5/>).

seg-83041671f422 = <b>IQ — samavaihe ja kvadratuuri (in-phase and quadrature).</b> Kompleksisen kantataajuisen näytteen kaksi komponenttia.

seg-39e6ea8506b3 = LEO-PNT-signaalitermit

seg-36452ee3f5cc = Nämä termit esiintyvät skenaariolajissa <c1/> ja monikaistaisissa <c2/>-skenaarioissa; katso <a1><c3/></a1>.

seg-8363a15f3c5a = <b>LEO-PNT — matalan Maan kiertoradan paikannus, navigointi ja ajanmääritys.</b> Navigointisignaalit, joita lähetetään muutaman sadan kilometrin ja noin { "1200" } km:n korkeudelta olevista satelliiteista: vahvempia ja nopeammin liikkuvia kuin keskikorkean Maan kiertoradan GNSS.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — radionavigointisatelliittipalvelu, radiopaikannussatelliittipalvelu, mobiilisatelliittipalvelu, Maan tutkimussatelliittipalvelu.</b> ITU:n (International Telecommunication Union) palvelujaot, joihin kaista voi kuulua.

seg-d1e494623341 = <b>Pilotti-, data- ja hankintakomponentit.</b> Yhden signaalin osat: datavapaa pilotti etäisyyden mittaukseen, datakomponentti, joka kantaa navigointiviestin, sekä lyhyt, matalanopeuksinen hankintakomponentti, joka on helppo löytää.

seg-cce232b7cd6a = <b>FDMA — taajuusjakoinen monikäyttö (frequency-division multiple access).</b> Komponentit tai satelliitit erotetaan kantoaaltotaajuudella eikä koodilla.

seg-9d9476ee62b1 = <b>Gaborin (RMS-) kaistanleveys.</b> β = √(∫ f² G df / ∫ G df) vastaanotinkaistan yli: signaalin tehon hajonta taajuudessa, joka määrää, kuinka tarkasti sillä voi mitata etäisyyttä.

seg-6febe9c2e506 = <b>DLL — viivelukkosilmukka (delay lock loop).</b> Koodinseurantasilmukka; sen aikaisen ja myöhäisen korrelaattorin väli ja kohinakaistanleveys määräävät lämpökohinasta johtuvan etäisyysmittauksen häilynnän.

seg-5a55da97daf9 = <b>EFQPSK — parannettu Feherin kvadratuurivaihesiirtoavainnus (enhanced Feher quadrature phase-shift keying).</b> Vakioverhokäyräinen modulaatio (Xona Pulsar); tässä approksimoitu suorakulmaisen sirun spektrillä.

seg-6dcbf1de9904 = <b>OFDM — ortogonaalinen taajuusjakomultipleksaus (orthogonal frequency-division multiplexing).</b> Monikantoaaltoaaltomuoto (Starlinkin alalinkki); piirretty tässä tasaisena kaistana.

seg-548b285c7c8e = <b>TEC — elektronien kokonaismäärä (total electron content).</b> Elektroneja neliömetriä kohden reitin varrella; { "1" } TECU = 10¹⁶ el/m². Ensimmäisen kertaluvun ionosfääriviive on { "40.3" }·TEC/f² metriä.

seg-dd7e0743f364 = <b>EIRP — tehollinen isotrooppinen säteilyteho (effective isotropic radiated power).</b> Lähetysteho kertaa antennivahvistus vastaanottimen suuntaan.

seg-aba3b3eaba85 = Eheys ja täydennys

seg-eab1b2c6728e = Eheys on <em>luottamuksen</em> kysymys: ei ”kuinka suuri virheeni on?” vaan ”voinko rajata sen, ja kerrotaanko minulle, kun raja rikkoutuu?” Nämä ovat ilmailun termit sille.

seg-696a73449c49 = <b>RAIM — vastaanottimen autonominen eheysvalvonta (Receiver Autonomous Integrity Monitoring).</b> Selkokielellä: <em>vastaanotin tarkistaa satelliitit toisiaan vasten.</em> Kun satelliitteja on enemmän kuin paikkaratkaisun vaatimat neljä, ylijäämien (residuaalien) pitäisi olla pieniä; suuri residuaali tarkoittaa, että yksi satelliitti valehtelee, ja vastaanotin voi sanoa sen ilman apua maasta. Toteutettu tiedostossa <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM — edistynyt vastaanottimen autonominen eheysvalvonta (Advanced Receiver Autonomous Integrity Monitoring).</b> RAIMin nykyaikainen kaksitaajuinen monitähdistömuoto. Sille syötetään eheystukiviesti, joka ilmoittaa kunkin satelliitin oletetun virheen ja vikatodennäköisyyden, ja se palauttaa suojaustasoja eikä läpäisy/hylkäys-lippua. Täysi käsittely kaikkine oletuksineen kohdassa <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE — signaalin avaruudessa etäisyysvirhe (Signal-in-Space Range Error).</b> Selkokielellä: <em>kuinka paljon satelliitin lähettämä rata ja kello vääristävät tyypillisen käyttäjän mittaamaa etäisyyttä.</em> Ratavirhe jaetaan radiaali-, ratasuuntaiseen ja ratatasoa vastaan kohtisuoraan osaan ja painotetaan sillä, kuinka paljon kukin näkyy keskimääräisellä näkölinjalla, ja yhdistetään sitten kellovirheeseen (Montenbruck et al. { "2018" }). Matalalla Maan kiertoradalla olevan satelliitin ratasuuntainen ja ratatasoa vastaan kohtisuora osa painavat paljon enemmän kuin GPS:llä, koska käyttäjät näkevät sen kaukana nadirista. Käyttää skenaariolaji <c1/>.

seg-847e40a033e1 = <b>RAC — radiaali, ratasuuntainen, ratatasoa vastaan kohtisuora (Radial, Along-track, Cross-track).</b> Kolme suuntaa, joihin ratavirhe jaetaan: ulospäin Maan keskipisteestä, lentosuuntaan ja kohtisuoraan ratatasoa vastaan. Skenaariolajin <c1/> malli <c2/> lisää kuhunkin korjauspolynomin.

seg-b725d23c839e = <b>SVID — satelliittitunniste (Space-Vehicle Identifier).</b> Numero, jolla navigointiviesti nimeää satelliitin, joka sen lähetti.

seg-b0f850eb04b1 = <b>IOD — datan painos (Issue of Data).</b> Laskuri, joka muuttuu aina, kun satelliitin navigointiviestin sisältö muuttuu, jotta vastaanotin erottaa uuden viestin toistosta. (Ei pidä sekoittaa kiertoradalla tehtävään demonstraatioon, jonka lyhenne on myös IOD, kuten ESAn Celeste IOD.)

seg-985a5e9c9ce9 = <b>TOW — viikon aika (Time of Week).</b> Sekunteja nykyisen GNSS-viikon alusta (sunnuntai { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q — 24-bittinen syklinen redundanssitarkistus (Qualcommin polynomi).</b> Virheitä havaitseva tarkistus, jonka RTCM { "10403" } ja Galileo-viestit sisältävät: viestibittien 24-bittinen jakojäännös polynomilla <c1/>. Vastaanotin laskee sen uudelleen ja hylkää viestin, joka ei täsmää.

seg-abb4679dab23 = <b>URE — käyttäjän etäisyysvirhe (User Range Error).</b> Selkokielellä: <em>kuinka väärin satelliitin oma lähetetty rata ja kello tekevät jokaisen etäisyyden siihen.</em> Kutsutaan myös signaalin avaruudessa virheeksi (SISE); se on satelliittikohtainen virhebudjetti, jonka ARAIM ja RAIM saavat syötteenä (<c1/> tiedostossa <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS — usean hypoteesin ratkaisuerotus (Multiple Hypothesis Solution Separation).</b> Menetelmä, jota ARAIM käyttää. Jokaiselle tavalle, jolla tähdistössä voi olla vika, se muodostaa ratkaisun, joka sulkee pois epäillyt satelliitit, ja rajaa, kuinka kauas tämä osaratkaisu voi olla kaikki näkyvissä olevat sisältävästä ratkaisusta.

seg-671711003a6f = <b>HPL / VPL — vaaka- / pystysuuntainen suojaustaso (Horizontal / Vertical Protection Level).</b> Selkokielellä: <em>säde, jonka sisällä järjestelmä lupaa todellisen virheen olevan ilmoitetulla eheysriskillä.</em> Se on raja, jonka algoritmi laskee, ei mitattu virhe. Ajo on käytettävissä, kun suojaustaso pysyy toiminnon sallimaa hälytysrajaa pienempänä (VAL, pystysuuntainen hälytysraja; HAL, vaakasuuntainen).

seg-5bbd2d664862 = <b>SBAS — satelliittipohjainen täydennysjärjestelmä (Satellite-Based Augmentation System).</b> Maaverkko, joka tarkkailee GNSS:ää, laskee korjauksia ja eheysrajoja ja lähettää ne geostationaarisilta satelliiteilta. <b>WAAS — Wide Area Augmentation System</b> on yhdysvaltalainen; EGNOS (European Geostationary Navigation Overlay Service) on eurooppalainen vastine. Kshana laskee suojaustasot DO-229E:n painotetun pienimmän neliösumman muodossa (DO-229E on RTCA:n minimivaatimusstandardi SBAS-vastaanottimille; RTCA oli aiemmin Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Estimointi ja geometria

seg-2eb6e72496b8 = <b>Estimaattori.</b> Algoritmi, joka ennustaa todellisen paikan/ajan katkon aikana anturimallista. Kshanassa on analyyttinen holdover-ennustin ja <b>Kalman-suodatin</b>.

seg-9b4aa612c5a9 = <b>Kalman-suodatin.</b> Selkokielellä: <em>algoritmi, joka seuraa suuretta ja myös sitä, kuinka epävarma se on.</em> Kshana käyttää sen epävarmuusrajaa Eheyden laskemiseen.

seg-8fda81dfccc9 = <b>EKF — laajennettu Kalman-suodatin (Extended Kalman Filter).</b> Kalman-suodatin epälineaariseen ongelmaan: se linearisoi mallin nykyisen estimaatin ympärillä joka askeleella. Vakiovalinta GNSS:n kytkemiseksi INS:ään.

seg-9bc2c6f74b29 = <b>UKF — Unscented Kalman -suodatin (Unscented Kalman Filter).</b> Sama tehtävä ilman linearisointia: se työntää pienen joukon deterministisesti valittuja näytepisteitä todellisen epälineaarisen mallin läpi ja rakentaa keskiarvon ja kovarianssin uudelleen siitä, mihin ne päätyvät. Käyttäytyy paremmin, kun epälineaarisuus on voimakas, minkä vuoksi radanmääritys käyttää sitä.

seg-a1e52820e3a0 = <b>DOP — tarkkuuden heikkenemiskerroin (Dilution Of Precision).</b> Selkokielellä: <em>kuinka paljon satelliittien geometria suurentaa etäisyysvirheen paikka- tai aikavirheeksi.</em> Paikkavirhe ≈ PDOP × etäisyysvirhe, joten pieni luku tarkoittaa hyvää geometriaa. Perhe: <b>GDOP</b> (geometrinen — paikka ja aika yhdessä), <b>PDOP</b> (paikka), <b>HDOP</b> (vaaka), <b>VDOP</b> (pysty), <b>TDOP</b> (aika).

seg-e769a91a3e4b = <b>Walker-tähdistö.</b> Vakiotapa kuvata satelliittitähdistö ratatasojen lukumäärällä ja satelliittien lukumäärällä tasoa kohden (GPS on karkeasti 24/6-Walker-kuori).

seg-b557933a4e4d = <b>Korkeuskulmamaski.</b> Pienin paikallisen horisontin yläpuolinen kulma, jolla satelliitti katsotaan käyttökelpoiseksi; liian matalat signaalit jätetään pois.

seg-3ac8e11c3e33 = <b>Peittyminen (occultation).</b> Kun Maa fyysisesti estää näkölinjan satelliittiin.

seg-249bf472cb00 = <b>Horisonttiprofiili (skyline mask).</b> Selkokielellä: <em>rakennusten, nostureiden tai kukkuloiden ääriviiva taivasta vasten, korkeuskulmana jokaiselle atsimuutille.</em> Satelliitti lasketaan näkyväksi vain arvon <c1/> yläpuolella sen atsimuutilla, ja maskin yläpuolella mutta horisonttiprofiilin takana oleva on ”horisonttiprofiilin peittämä”. Kshana rakentaa sen taulukosta, katukuilusta, sektoreista ja maastosta (niiden pistekohtainen maksimi) tai REPRESENTATIVE-esiasetuksesta; vain näkölinja, ei heijastusta eikä diffraktiota (<a1><c2/></a1>).

seg-620a88820a2d = <b>Taivaan geometria.</b> Mitkä satelliitit paikka näkee horisonttiprofiilin alla ja mitä se tekee ratkaisulle: DOP-kertoimet, pienimmän neliösumman paikkaratkaisun itä-pohjoinen-ylös-kovarianssi ja sen <b>virhe-ellipsi</b>, vaaka-alue, joka sisältää ilmoitetun osuuden paikkaratkaisuista (oletuksena { "95" } %) riippumattomille, yhtä suurille Gaussin etäisyysvirheille. MODELLED-geometria ilmoitetun virhemallin mukaan, ei vastaanottimen todellinen virhe (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI — yhdistetty ajoituksen eheys (Composed Timing Integrity).</b> Suojaustasot <em>ajalle</em> paikan sijaan, laskettuna eri aikalähteiden välisen luovutuksen yli — esimerkiksi satelliitilla tarkistetusta (RAIM-käytettävissä) kellosta vapaasti käyvään kelloon holdover-tilassa — jotta raja pysyy voimassa siirtymän läpi (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB — ajoituksen eheyden vertailu (Timing Integrity Benchmark).</b> Mittatikku <em>muiden</em> ajoitusmonitoreille: se syöttää valikoiman vikoja ja tarkistaa, rajasiko monitorin ilmoittama suojaustaso todella sen virheen. Se ei esitä omaa tarkkuusväitettä, joten se ei voi liioitella sellaista (<a1><c1/></a1>).

seg-8b89f8b913b9 = Radat ja Kuun läheisyys

seg-ba6b669eb8ba = <b>CR3BP — ympyrärajoitettu kolmen kappaleen ongelma (Circular Restricted Three-Body Problem).</b> Maa–Kuu-järjestelmä käsiteltynä kahtena kappaleena ympyräradoilla yhteisen massakeskipisteen ympäri sekä avaruusalus, joka on liian kevyt vetääkseen takaisin. Kuun lähellä kahden kappaleen Kepler-ellipsi on yksinkertaisesti väärän muotoinen; CR3BP on edullisin dynamiikka, joka on oikea (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO — lähes suora halorata (Near-Rectilinear Halo Orbit).</b> Jaksollinen CR3BP-rata, joka kiertää läheltä yhtä Kuun napaa ja kaukaa toista, joten se on päältä katsottuna lähes suora viiva — siitä ”lähes suora”. Se on Kuun Gatewayta varten valittu rata, ja se säilyttää lähes jatkuvan näkölinjan Maahan.

seg-2b2e6d04376c = <b>DRO — kaukainen vastakulkuinen rata (Distant Retrograde Orbit).</b> Toinen CR3BP-perhe: suuri, vakaa rata, joka kiertää Kuuta taaksepäin pyörivässä koordinaatistossa nähtynä.

seg-6bb9229aee5c = <b>EOP — Maan orientaatioparametrit (Earth Orientation Parameters).</b> Maan mitattu, hieman epäsäännöllinen heilahtelu ja pyöriminen (napaliike, UT1 (Universal Time { "1" }, Maan pyörimisaika)−UTC — Maan pyörimisaika miinus yleisaika (Coordinated Universal Time) — ja vuorokauden pituus), jota tarvitaan Maahan sidotun paikan muuttamiseen inertiaaliseksi metrejä tarkemmin. IERS (International Earth Rotation and Reference Systems Service) julkaisee ne; Kshana lukee sen tiedoston <c1/> asetuksella <c2/>.

seg-7f1e7e523e5b = Standardit, muodot ja organisaatiot

seg-5d8d6144c13a = Lyhenteet, joita README ja pakettisivut käyttävät standardeille, tiedostomuodoille, aika-asteikoille, koordinaatistoille ja niiden takana oleville tahoille. Jokainen on myös avattu ensimmäisellä käyttökerralla näillä sivuilla.

seg-800d42de0777 = Radat, koordinaatistot ja aika

seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Vakioanalyyttiset propagaattorit julkaistuille satelliittiradoille.

seg-87a098568846 = <b>TLE — kaksirivinen elementtijoukko (two-line element set).</b> Julkinen ratamuoto, jota SGP4 lukee.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — matala Maan kiertorata / keskikorkea Maan kiertorata / geostationaarinen siirtorata / kalteva geosynkroninen rata.</b> Ratavyöhykkeet; useimmat GNSS-satelliitit lentävät MEO:ssa.

seg-1ec323dbd7a6 = LMO — matala Marsin kiertorata (low Mars orbit).

seg-d0be640282af = <b>ECI / ECEF — Maan keskipisteeseen sidottu inertiaalinen / Maan keskipisteeseen ja Maahan sidottu (Earth-centred inertial / Earth-centred, Earth-fixed).</b> Koordinaatisto, joka ei pyöri Maan mukana, ja sellainen, joka pyörii.

seg-09a937adc1db = <b>TEME — todellinen päiväntasaaja, keskimääräinen kevätpäiväntasaus (true equator, mean equinox).</b> Koordinaatisto, jossa SGP4 antaa tuloksensa.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International Terrestrial Reference System / sen realisaatio, International Terrestrial Reference Frame.</b> Nykyaikaiset inertiaalinen ja Maahan sidottu koordinaatisto.

seg-56b24c3734be = <b>CIO — Celestial Intermediate Origin.</b> Nykyaikaisen, päiväntasausvapaan Maan pyörimisketjun vertailupiste.

seg-a23b05c85a63 = <b>LVLH — paikallinen pysty, paikallinen vaaka (local vertical, local horizontal).</b> Koordinaatisto, joka liikkuu avaruusaluksen mukana.

seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> Maan ellipsoidi, jota GPS käyttää.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — Coordinated Universal Time / International Atomic Time / Terrestrial Time / Universal Time { "1" } (Maan pyörimisaika) / Barycentric Dynamical Time.

seg-ea7eb1f34cae = <b>LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire).</b> Ehdotettu Kuun aika-asteikko.

seg-c6e5976d9dff = <b>OD — radanmääritys (orbit determination).</b> Radan palauttaminen seurantamittauksista.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> ja <b>DRO</b> on määritelty kohdassa ”Radat ja Kuun läheisyys” yllä.

seg-2e6ba9069396 = Tiedostomuodot ja viestit

seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> International GNSS Servicen (IGS) tarkkojen ratojen tiedostomuoto, versiot c ja d.

seg-1bfa0d083935 = <b>RINEX — Receiver Independent Exchange Format.</b> GNSS-havaintojen ja lähetettyjen efemeridien vakiotiedostomuoto.

seg-39ce08a9ae66 = IONEX — IONosphere map EXchange format.

seg-c23ea3515008 = <b>OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking Data Message.</b> Consultative Committee for Space Data Systemsin (CCSDS) vakioviestit radoille ja seurantadatalle.

seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Kshana-skenaarioiden pelkkä tekstimuoto.

seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Kshanan versioitu, itsensä kuvaava tulosvaippa.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> RTCA:n minimivaatimusstandardit SBAS-vastaanottimille ja GPS:n ilma-aluslaitteille, joissa on ilma-alusperusteinen täydennys.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> GPS:n rajapintamäärittelyt (jälkimmäinen kattaa L5-signaalin).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> National Institute of Standards and Technologyn <em>Handbook of Frequency Stability Analysis</em>.

seg-8b89719c1859 = <b>TRL — teknologian valmiustaso (technology readiness level).</b> Laitteiston kypsyyden asteikko 1–9.

seg-16c972f4ea0a = Organisaatiot

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — Euroopan avaruusjärjestö, sen Euroopan avaruustoimintakeskus ja sen eurooppalainen avaruusseurantaverkko.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — Yhdysvaltain ilmailu- ja avaruushallinto, sen Jet Propulsion Laboratory, sen Navigation and Ancillary Information Facility (joka julkaisee SPICE-työkalupakin — Spacecraft, Planet, Instrument, C-matrix, Events) ja sen Deep Space Network.

seg-eaa5a2a51169 = <b>IGS</b> — International GNSS Service. <b>IERS</b> — International Earth Rotation and Reference Systems Service. <b>IAU</b> — Kansainvälinen tähtitieteellinen liitto (jonka SOFA-kirjasto, Standards of Fundamental Astronomy, ja sen avoin portti ERFA, Essential Routines for Fundamental Astronomy, ovat Kshanan koordinaatistoviitteet).

seg-81af4c0f4c48 = <b>CCSDS</b> — Consultative Committee for Space Data Systems. <b>AIAA</b> — American Institute of Aeronautics and Astronautics. <b>RTCA</b> — aiemmin Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Ohjelmisto ja toimitusketju

seg-b42188d3a6f4 = CLI — komentorivikäyttöliittymä.

seg-198c591514ab = <b>MCP — Model Context Protocol</b>, protokolla, jota Kshanan agenttipalvelin puhuu. <b>IDE — integroitu kehitysympäristö.</b>

seg-287bf61a1a16 = SBOM — ohjelmiston osaluettelo (software bill of materials).

seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, rakennuksen alkuperän viitekehys, jonka alla Kshanan julkaisut on todistettu.

seg-7487c6f9ed18 = Kaikki muut lyhenteet, A–Z

seg-56f6039bb38a = Jokainen repositorion dokumentaatiossa (<c1/> ja neljä README:tä) käytetty lyhenne, jota mikään yllä oleva jakso ei määrittele, sekä muutama, jonka jokin määrittelee, toistettuna hakua varten. Jokainen sivu avaa lyhenteensä myös ensimmäisellä käyttökerralla; tämä taulukko on yksi paikka, josta ne kaikki löytää. Muutama merkintä on tunniste tai nimi lyhenteen sijaan, ja sanoo niin.

seg-c0dfa446e523 = Tarkoittaa

seg-f272d28225ae = Missä esiintyy

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = taho, joka kirjoittaa 5G-standardit, mukaan lukien ei-maanpäälliset verkot

seg-eaf19768b977 = viidennen sukupolven matkaviestinverkko

seg-692ddc163c55 = mukaan lukien sen ei-maanpäällisen verkon (NTN) paikannus

seg-9524be916f07 = ABI

seg-0e8332db764b = binäärirajapinta (application binary interface)

seg-762ea76708dc = Pythonin wheel-tunnisteet

seg-d419d06ed622 = ABMF

seg-b294c714487d = IGS-asema Le Moulessa, Guadeloupessa

seg-586a8ea87638 = nelimerkkinen asematunniste

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = vaihtovirta

seg-9cfb5dc4b4bc = kuten AC-Stark-ilmiössä (valosiirtymä)

seg-90308009c536 = ADD

seg-49d97c65662d = Algorithm Description Document

seg-493b5ceaa0fb = WG-C:n ARAIM-vertailuilma-algoritmi

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = Allanin poikkeama / limittäinen Allanin poikkeama

seg-23c38ecbc543 = katso Allanin poikkeama yllä

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = inertia-anturien osanumerot (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = tunnisteita, ei lyhenteitä

seg-36743c7fe98e = AEM

seg-142ca108a070 = Attitude Ephemeris Message

seg-c34185a83d8e = CCSDS-viesti

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Aerospace and Electronic Systems Society

seg-78692bf5addf = IEEE:n

seg-f429be16014e = AF

seg-afa04bc28b42 = keskiarvoistuskerroin (averaging factor)

seg-b3db60632b92 = näytevälin kokonaislukukerrannainen Allan-tyyppisessä estimaattorissa

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = LunaNetin Kuun navigointisignaali

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automaattinen vahvistuksen säätö

seg-750b8717220b = häirinnän ilmaisin vastaanottimen etupäässä

seg-31b864b910d5 = AHP

seg-f956cbe86552 = Analytic Hierarchy Process

seg-c2b63847e2dc = usean kriteerin painotusmenetelmä (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = tekoäly / koneoppiminen

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = hälytysraja / vaakasuuntainen hälytysraja / pystysuuntainen hälytysraja

seg-1e52f04eb047 = virhe, jonka eheysmonitorin on rajattava

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = vaihtoehtoinen binäärinen offset-kantoaalto

seg-e3acb231cf4d = Galileo E5 -modulaatio

seg-79b130764f97 = aritmeettinen keskiarvo–harmoninen keskiarvo (epäyhtälö)

seg-190b782b70ce = AOCS

seg-6459d9bce282 = asennon- ja radanhallintajärjestelmä

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = signaalin hankinta / lähimmän etäisyyden hetki / signaalin menetys

seg-8b73e2c51498 = maa-aseman ylityksen tapahtumat (LOS tarkoittaa myös näkölinjaa; asiayhteys kertoo, kumpi)

seg-27ceb7163571 = API

seg-7903f5ff4027 = ohjelmointirajapinta

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = sovellusprosessin tunniste (application process identifier)

seg-55730824c8cf = CCSDS Space Packet -otsikon kenttä

seg-611cd7a0d378 = APS

seg-55842a648c47 = American Physical Society

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = lähestyminen pystyohjauksella (approach with vertical guidance)

seg-69a6cc8a532a = APV-I: { "40" } m vaaka- ja { "50" } m pystyhälytysrajat

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = keskimääräinen ajopituus (average run length)

seg-08a5d53f813c = keskimääräinen aika, jonka muutosilmaisin tarvitsee hälyttääkseen

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = Arm-suoritinarkkitehtuuri / sen 64-bittinen muoto

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudispektritiheys

seg-9fb629e35a25 = tehospektritiheyden neliöjuuri

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = astronominen yksikkö

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = käyrän alle jäävä pinta-ala / vastaanottimen toimintakäyrä (receiver operating characteristic)

seg-4d65dbf47a5c = ilmaisimen arviointi

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = ylläpitää SRTM-korkeuskaakeleiden avointa peilausta

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = rakennukseen tulon vaimennus (building entry loss)

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = bias-epävakaus (bias instability)

seg-ff2ba8692cbc = inertia-anturin Allanin poikkeaman tasainen minimi

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Kansainvälinen paino- ja mittatoimisto)

seg-6ec98084ac58 = julkaisee Circular T:n

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Saksan kartografian ja geodesian liittovirasto)

seg-ac4765a77015 = ylläpitää IGS:n datapeiliä

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = kuten BSD-lisensseissä

seg-97764c651815 = BSP

seg-8f85848ee08a = binäärinen SPK

seg-6e01dca47581 = binäärinen SPICE-efemeridiydintiedosto

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = kaksirivisen elementtijoukon ilmanvastustermi

seg-628e6c686508 = CAI

seg-a2418a88886c = kylmäatomi-interferometri

seg-273a3b8d5385 = katso QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

seg-a1f55ee72524 = data- tai tekstilisenssi

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = NASAn avaruusgeodesiaarkisto

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = kertymäfunktio (cumulative distribution function)

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = vakio väärän hälytyksen taajuus (constant false-alarm rate)

seg-b38b56b63da6 = hankintailmaisimen kynnyssääntö

seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

seg-4dab086e5c3d = BeiDou-järjestelmän datumi

seg-8f7751d39781 = CIP

seg-e34a194da574 = Celestial Intermediate Pole

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = Celestial Intermediate Reference System

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

seg-59c481cb5741 = Yhdysvaltain DHS:n

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = siviilinen keskipitkä / siviilinen pitkä (civil moderate / civil long)

seg-cc0c8f1524f8 = kaksi aikamultipleksattua GPS L2C -koodia

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = yhteismuotoinen suojaustaso (common-mode protection level)

seg-d469cd44d9d4 = raja virheille, joita residuaalitesti ei näe

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = konvergoitu newtonilainen (converged Newtonian)

seg-5d679a981a34 = SPICEn valoaikaaberraation korjaus

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = yksikkönä dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = usean kriteerin järjestämismenetelmä

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Committee on Space Research

seg-235850ad0d1f = myöntää kansainväliset satelliittitunnukset

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = jakso kierrosta kohti (cycle per revolution)

seg-a1d4080ce019 = empiirinen radan kiihtyvyys kiertotaajuudella

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = keskus- / grafiikka- / neuroprosessointiyksikkö

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = Cramér–Rao-raja / Cramér–Rao-alaraja

seg-6eb684e34f56 = pienin varianssi, jonka harhaton estimaattori voi saavuttaa

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = ILRS:n normaalipistetiedostot

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = kontrolloidun vastaanottokuvion antenni (controlled-reception-pattern antenna)

seg-7111b9c4d382 = häirinnänestoantenniryhmä

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = johdonmukaisuussuhde / satunnaisindeksi (consistency ratio / random index)

seg-cfa91dc02138 = AHP:n johdonmukaisuustarkistus (hyväksy CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = ranskalainen yritys, joka ylläpitää Orekitia

seg-58d5f143ff3b = yrityksen nimi, ei avattava lyhenne

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = koodinsiirtoavainnus (code shift keying)

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = Cascading Style Sheets

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = kumulatiivinen summa (cumulative sum)

seg-66f752e15abc = sekventiaalinen muutosilmaisin

seg-92ac0357d01e = CV

seg-28f75c073917 = (yhteinen näkyvyys ajansiirrossa; asiayhteys kertoo, mikä)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = CesiumJS:n JSON-näyttämömuoto

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = desibeli / desibeliwatti / desibeli-hertsi

seg-c485de5bcd85 = tehosuhde, absoluuttinen teho ja C/N0-yksikkö

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = tasavirta

seg-0ea7fccee332 = nollataajuusraja

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = suuntakosinimatriisi (direction cosine matrix)

seg-9d3d9ca79a9d = kiertomatriisi

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = suunnittelun hallintataulukko (design control table)

seg-80d95f099e9a = linkkibudjettitaulukko (JPL DESCANSO Galileo X-kaista -esimerkki)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (versiot { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = planeettojen ja Kuun efemeridit; ”DE-luokka” tarkoittaa tämän luokan tarkkuutta

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = digitaalinen korkeusmalli

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = JPL:n monografiasarja

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Münchenin teknillisen yliopiston saksalainen geodeettinen tutkimuslaitos)

seg-e7cedd55549e = ylläpitää EUROLAS-datakeskusta

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = differentiaalinen GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = Department of Homeland Security

seg-6b487421c547 = Yhdysvallat

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = Department of Defense

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = vapausaste

seg-bf5bc69cb873 = katso 1-DOF yllä

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = differentiaalinen yksisuuntainen etäisyydenmittaus / delta-differentiaalinen yksisuuntainen etäisyydenmittaus

seg-6ba2d3b5b724 = syvän avaruuden kulmaseuranta

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = numeeriset integraattorit

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = neliöllinen keskietäisyys (distance root mean square)

seg-a8ed04890ded = katso 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = Microchipin datalehtien asiakirjanumerot

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = NASAn loukkuun otettuihin elohopeaioneihin perustuva kello

seg-52e838301c0b = UT1 miinus UTC

seg-fbce3b3b7b80 = Maan pyörimisen korjaus

seg-8aa996f34920 = bittikohtainen energia kohinatiheyteen nähden

seg-463b21c0b791 = inertiaalinen koordinaatisto, joka on ajon alussa kohdistettu Maahan sidottuun koordinaatistoon

seg-4dc987bd9dbf = leo-pass-yhteentoimivuusvientien käyttämä

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = JavaScriptin taustalla oleva standardi / ES-moduuli

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = GNSS:n auringonpainemalli (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = European Cooperation for Space Standardization

seg-d452e23d503a = ECSS-E-ST-10-02 on sen varmennusstandardi

seg-becb6685ff13 = ED

seg-b6448e14a567 = EUROCAE-asiakirja

seg-ee4ada9c4c6e = kuten ED-259A:ssa

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = sisääntulo, laskeutuminen ja pehmeä lasku (entry, descent and landing)

seg-69f37001de44 = EEE

seg-18a1b66286ee = sähköiset, elektroniset ja sähkömekaaniset (osat)

seg-f814c1301059 = avaruustuotteen varmistus

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model ({ "2008" }-julkaisu)

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (elimination and choice expressing reality)

seg-efb2f919955a = ohitusperusteinen usean kriteerin menetelmä

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, MPP02-versio (Chapront)

seg-b1d699d70339 = analyyttinen Kuun teoria

seg-aee5eeb23064 = Maan keskimääräinen päiväntasaaja ja kevätpäiväntasaus J2000

seg-16d9b8eac95d = inertiaalinen koordinaatisto

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = koodidiskriminaattori

seg-0e4110d33849 = EMT

seg-103c6de62575 = tehollinen monitorin kynnys (effective monitor threshold)

seg-4b2101113387 = ARAIMin tuloste

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = itä-pohjoinen-ylös / pohjoinen-itä-alas

seg-aae7610833a7 = paikallisen tason koordinaatistot

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = Maan havainnointi

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon ({ "2021" }-julkaisu)

seg-bd2a27a17f6d = IAA RAS:n efemeridi

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = Maan pyörimiskulma (Earth rotation angle)

seg-966ed500f705 = ESKF

seg-e79112a3132a = virhetilan Kalman-suodatin (error-state Kalman filter)

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = tehollinen otoskoko (effective sample size)

seg-57ce1c1b617b = partikkelisuodattimen

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = efemeridiaika

seg-e0c49639649e = SPICEn nimi TDB:lle

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = European Organisation for Civil Aviation Equipment

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = European Laser Network

seg-fa7025d88c88 = satelliittien ja Kuun laseretäisyydenmittaus

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = usein kysytyt kysymykset

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federal Communications Commission

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = täysin kytketty neuroverkko

seg-1de7b4410369 = FD

seg-4e73ff36d37f = differenssi (finite difference)

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = vian havaitseminen ja poissulkeminen

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution ({ "2004" }-julkaisu)

seg-878b4a645ae9 = valtamerten vuorovesimalli

seg-55c14f474a10 = FIM

seg-b68c86e68570 = Fisherin informaatiomatriisi

seg-d39671724dfc = Fowler–Noll–Vo-tiiviste, variantti 1a

seg-3354ad42f7dd = käytetään kultaisten tulosteiden kiinnittämiseen

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = täysi toimintakyky / kiertoradalla tapahtuva validointi (full operational capability / in-orbit validation)

seg-ce13cca7f222 = satelliittisukupolvet (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = näkökenttä / hetkellinen näkökenttä

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = kenttäohjelmoitava logiikkapiiri / mikrokontrolleri / reaaliaikakäyttöjärjestelmä

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = vapaan tilan häviö / vapaan tilan etenemishäviö

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigatavu / kilotavu / megatavu

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = Geocentric Celestial Reference Frame

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = geostationaarinen rata

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = gravitaatiogradientti

seg-d8ef4d361e86 = kuten gravitaatiogradienttimomentissa

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigahertsi / kilohertsi

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = globaali ionosfäärikartta

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = GNSS/INS-integraatio / Wuhanin yliopiston Kalman-suodatin-GNSS/INS-datajoukko ja -koodi

seg-deca3cbe41ac = GIS

seg-36275ece527d = paikkatietojärjestelmä

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = ruudukon ionosfäärin pystysuuntainen virhe (grid ionospheric vertical error)

seg-20a40777d78a = SBAS-viestitermi

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = ESAn jakama GNSS-datankäsittelypaketti

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = GNU C -kirjasto

seg-2630ae5f0bc5 = Venäjän maailmanlaajuinen satelliittinavigointijärjestelmä (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = yleistetty pienimmän neliösumman menetelmä

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = gravitaatioparametri

seg-e3a296392ac0 = gravitaatiovakio kertaa kappaleen massa

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = Marsin gravitaatiokenttä

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = Greenwichin keskimääräinen tähtiaika

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = ohjaus, navigointi ja hallinta

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = yleinen suhteellisuusteoria

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = NASA Goddardin GRAIL-Kuun gravitaatiomallit (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = maanäytteen väli (ground sample distance)

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = maatukilaitteisto

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddard Space Flight Center

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = Hadamardin poikkeama / limittäinen Hadamardin poikkeama

seg-bb846135ceb4 = ajautumisesta riippumaton vakausmitta

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = laitteisto silmukassa (hardware in the loop)

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = vaarallisen harhaanjohtava tieto / harhaanjohtava tieto

seg-1cbf9d6f135d = Stanford-diagrammin alueet

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Venäjän tiedeakatemian soveltavan tähtitieteen instituutti

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = Kansainvälinen geodesialiitto

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = International Association of Geomagnetism and Aeronomy / sen työryhmä V-MOD (geomagneettisen kentän mallinnus)

seg-28805f15bae8 = ylläpitää IGRF:ää

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = alkuehto

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = Kansainvälinen siviili-ilmailujärjestö

seg-c2d2d459177d = ICD

seg-a018300615e2 = rajapintakuvausasiakirja (interface control document)

seg-433b45040abd = kuten Galileo OS SIS ICD:ssä

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = International Centre for Global Earth Models

seg-e9650a618b38 = ID

seg-e40875ab1090 = tunniste (tai tunnistus, kuten kohinatyypin tunnistuksessa)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = välitaajuus

seg-ed568f55aa8f = vastaanottimen näytteet

seg-cb4aaa2581bb = IGS:n ITRF2014-realisaatio

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = International Geomagnetic Reference Field

seg-669611e731d0 = IGRF-14 (tiedosto IGRF14.shc) on 14. sukupolvi

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = kalteva geosynkroninen rata

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = GPS-satelliittisukupolvi

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = International Laser Ranging Service

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = kokonaislukuinen pienimmän neliösumman menetelmä

seg-a214c483b8a8 = kokonaislukuepävarmuuden ratkaisu

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Pariisin observatorio; julkaisee INPOPin

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, versio 21a

seg-577acd29f11b = planeettaefemeridi

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / sen International Technical Meeting

seg-53abad80634c = IoT

seg-9b766d557bd1 = esineiden internet

seg-1b41d114662e = IR

seg-ff2d89b32d07 = eheysriski

seg-2dc9fcadccd6 = vaarallisen harhaanjohtavan tiedon todennäköisyys

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = IEEE:n edeltäjä

seg-9e3d84279d56 = kahden GNSS:n välinen kellosiirtymä

seg-2ffee4396fbd = ISL

seg-505dee046f7a = satelliittien välinen yhteys (inter-satellite link)

seg-010ea5a76e2e = ISM

seg-330b25f923db = eheystukiviesti

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = International Organization for Standardization

seg-8291ac1ccba6 = ISO { "8601" } on sen päivämäärä- ja aikamuoto

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" }

seg-14dc2a58e2c3 = International Telecommunication Union Radiocommunication Sector

seg-0e8094e4d45c = sen P-sarjan suositukset mallintavat etenemistä

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = International VLBI Service for Geodesy and Astrometry

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = juliaaninen päivämäärä / muunnettu juliaaninen päivämäärä

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Euroopan komission yhteinen tutkimuskeskus / yksi sen raporttinumeroista

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = Kalman-suodatin

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = OGC-standardi, jota Google Earth lukee

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = Kshanan oman LEO-navigointiviestin tekstimuodon tietuetyyppimerkinnät

seg-3269a4e6b3e3 = Kshanan laajennus, ei standardi

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = keskeinen suorituskykyindikaattori

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedy Space Center

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = CCSDS-viestien tekstimuoto

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = lineaarinen kongruenssigeneraattori

seg-8927ca404e64 = NIST SP { "1065" } -testisarjan generaattori

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = ESAn Moonlight-palvelu

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = lineaarisen takaisinkytkennän siirtorekisteri

seg-5b09c8e3f127 = hajotuskoodin generointi

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = iteroidun logaritmin laki

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = lukituksen menetyksen ilmaisin / signaalin voimakkuuden ilmaisin

seg-7d95179a5a1f = RINEX-havaintolaput

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = Kuun laseretäisyydenmittaus

seg-20deda97c876 = LLVM

seg-5a84a3219546 = LLVM-kääntäjäinfrastruktuuri (alun perin Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = perinteinen navigointiviesti

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = Kuun navigointi- ja viestintäsatelliittijärjestelmä

seg-4ce3c0ea7a31 = tähdistötapaustutkimukset julkaisussa NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = ehdotettu Kuun tähdistö

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = lokalisaattorisuorituskyky pystyohjauksella / sen { "200" } ft:n päätöskorkeusluokka

seg-090ba62634a8 = ilmailun lähestyminen

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = karkaussekunnit

seg-54ea05b82cb4 = kuten Δt_LS:ssä

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = valoaika

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = 4G-matkaviestinstandardi

seg-3530cdaca137 = LU

seg-58ad64b9d450 = alakolmio–yläkolmio (hajotelma)

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = lensi Kuuhun vuonna { "2025" }

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = Stanfordin Kuun PNT-kirjasto

seg-893ba320da76 = nimi

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = valmistus, kokoonpano, integrointi ja testaus

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = JPL:n satelliittiefemeridiratkaisut Marsin, Jupiterin ja Saturnuksen kuille

seg-9b0688bfc31e = tunnisteita

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = ilmailujärjestelmän minimisuorituskykystandardit

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = numeerisen laskennan tuote

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = monen attribuutin hyötyteoria

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = monikriteerinen päätösanalyysi

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = Kuun keskipisteeseen sidottu inertiaalinen / Kuun keskipisteeseen ja Kuuhun sidottu

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = pienin havaittava harha (minimal detectable bias)

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = muunnettu Allanin poikkeama

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = mikrosähkömekaaniset järjestelmät

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), Grassen laserasema / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = Kuun laseretäisyydenmittausasemat

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = keskimääräinen Maa / pääakselit

seg-f30f1a2778cf = kaksi Kuuhun sidottua koordinaatistoa (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = kuten MIT-lisenssissä

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = monikerroksinen perceptron

seg-6975432180f6 = pieni neuroverkko

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = päivän keskimääräinen / päivän todellinen

seg-1af66f9b771d = päiväntasaaja-ja-kevätpäiväntasauskoordinaatistot

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = toiminnan minimisuorituskykystandardit

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = Mars Reconnaissance Orbiterin gravitaatiomallit { "110" } ja 110B2

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = pienin tuettu Rust-versio

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = modulaatiosiirtofunktio

seg-7f60d1ac40ad = optinen kuvantaminen

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = minimivarianssinen särötön vaste (minimum-variance distortionless response)

seg-83f57219e5b7 = adaptiivinen keilanmuodostus

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = mikroaaltoyhteys

seg-639266912f59 = ACES-ajansiirtoyhteys

seg-5ac07401e4f8 = NaN

seg-722d679807ee = ei luku (not a number)

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = navigointi(viesti) / havainto

seg-1729ddf0eafa = kaksi RINEX-tiedostotyyppiä; Stanford NAV Lab on Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = entinen Yhdysvaltain National Bureau of Standards / NBS14-taajuusvakauden vertailudatajoukko

seg-3d1ac5146fea = käytetään Allan-estimaattorien tarkistamiseen

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = normalisoitu estimointivirheen neliö / normalisoitu innovaation neliö

seg-af167a77a1dc = suodattimen johdonmukaisuustestit

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / sen tekninen raportti TR8350.2 (WGS { "84" } -määritelmä)

seg-ffa6025b5a70 = NIMA on NGA:n entinen nimi

seg-af4be907e56c = NLOS

seg-22ab7d58324b = vain heijastunut signaali

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = ei-negatiivinen pienimmän neliösumman menetelmä

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = ylläpitää julkista satelliittiluetteloa

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neyman–Pearson

seg-fc214695fa83 = havaitsemisteoria

seg-3ef8006482bb = NPA

seg-81a072ee0520 = ei-tarkkuuslähestyminen

seg-b9fd2cf6a2b9 = ilmailu

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutaatio–prekessio–harha

seg-b4562efbafdf = IAU 2006/2000A -matriisi

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / sen Mass Spectrometer and Incoherent Scatter Radar Extended -ilmakehämalli, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = ei-maanpäällinen verkko

seg-1ae0305d8455 = 5G satelliiteista

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = liioiteltujen väitteiden tunnisteet

seg-47ba87f3730b = tiedoston CLAIMS-VS-REALITY.md rivit

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = konttikuvan muoto

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = tavallinen / stokastinen differentiaaliyhtälö

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = ratadataviestit (orbit data messages)

seg-35fe6a2f3de3 = CCSDS-perhe, johon kuuluvat OEM ja OMM

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = tavallinen / painotettu pienimmän neliösumman menetelmä

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = ESAn kiertoradalla toimiva ohjelmistolaboratoriosatelliitti / sen poikkeamien havaitsemisen datajoukko

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = Galileo-signaalin todennus

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = avoin palvelu (Galileo, BeiDou) tai käyttöjärjestelmä(t)

seg-6db10af375e3 = asiayhteys kertoo, kumpi

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornstein–Uhlenbeck

seg-9be9042ec983 = keskiarvoon palaava kohinaprosessi

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = tuotevarmistus (myös tarkkuuslähestyminen, kuten K_H,PA:ssa)

seg-65ad442b3faa = PCK

seg-c788fe80678e = planeettavakioiden ydintiedosto

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = havaitsemisen todennäköisyys / väärän hälytyksen todennäköisyys

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = TEME:n ja ITRF:n välinen koordinaatisto

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = satelliittitunnisteita: SP3:n GPS-satelliittimerkintä, SBAS:n pseudosatunnaiskohinanumero, Galileo-satelliitin nimi

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = ACES-cesiumkello

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = suojaustaso

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = vaihelukittu silmukka

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / yksi sen artikkelitunnisteista

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = vaihemodulaatio / taajuusmodulaatio

seg-279251adb2eb = kellon vaiheen tai taajuuden kohina

seg-685fc49957e2 = PN

seg-209dacf76ff3 = kuten PN-etäisyysmittauksessa

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = tarkka radanmääritys

seg-b7919977bf20 = PPN

seg-ed81960f1282 = parametrisoitu post-newtonilainen

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = tarkka pistepaikannus / reaaliaikainen kinemaattinen paikannus / yhden pisteen paikannus

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = pulssi sekunnissa

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request (muutosehdotus)

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = pseudosatunnaiskohina (koodinumero)

seg-6f384580af80 = tapa, jolla GNSS-satelliitit nimetään signaaleissa

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = tieteellinen aikakauslehti

seg-78a947083d45 = PSD

seg-6eb799bd1582 = tehospektritiheys

seg-ab1af8b3d968 = katso edellä

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = GPS SPS PS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = Saksan kansallinen metrologian laitos

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = paikka, nopeus ja aika

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = Rust–Python-sidontakirjasto / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = GLONASSin geodeettinen datumi

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = laadunvarmistus

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = nelivaihesiirtoavainnus

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japani

seg-697c55525b36 = RAAN

seg-85cd6997e07e = nousevan solmun rektascensio

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover (vastusta, havaitse, vastaa, palaudu)

seg-76da7c5bf39a = RethinkPNT/Firesmith-kestävyysmalli

seg-7bb5ed20c788 = RF

seg-35b036272c8e = radiotaajuus

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = oikea puoli

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = neliöllinen keskiarvo / neliösumman neliöjuuri

seg-8b2bd83256f1 = RNG

seg-b90957003307 = satunnaislukugeneraattori

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = sijoitetun pääoman tuotto

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = Yhdysvaltain DHS

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = sen viestistandardi sisältää CRC-24Q:n

seg-520c91fa0ef0 = avoimen lähdekoodin GNSS-paikannuskirjasto (reaaliaikaisen kinemaattisen paikannuksen kirjasto)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radiaalinen, poikittainen, normaali

seg-b1b635ff08e4 = radan mukana pysyvä koordinaatisto

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = satunnaiskulku

seg-8b593d7d5dbd = kuten harhan satunnaiskulussa

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = satunnaiskulku-, valkoinen ja flicker-taajuusmodulaatio / valkoinen ja flicker-vaihemodulaatio

seg-7fced178bcc5 = potenssilain mukaiset kellokohinatyypit

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = Microchipin tuotenimiä (kaksi sirumittakaavan atomikelloa, yksi uunistabiloitu kideoskillaattori)

seg-8a1ae00c4a52 = nimiä, ei lyhenteitä

seg-a58426a850fd = SD

seg-d46cb77d53f6 = keskihajonta

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = kuten Galileo OS SDD:ssä

seg-1022626b788c = SDK

seg-2076da4dd4dd = ohjelmistokehityspaketti

seg-9fb492bced01 = SDR

seg-1a1082059103 = ohjelmistoradio

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = 18th SDS ylläpitää Yhdysvaltain satelliittiluetteloa

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = Aurinko–Maa–luotain-kulma (myös pallomainen virhetodennäköisyys)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stokastinen gradienttimenetelmä

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = yksinkertainen harmoninen liike

seg-b0973ab206ed = SI

seg-35624e5e4630 = kansainvälinen yksikköjärjestelmä

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA on Euroopan unionin lentoturvallisuusvirasto

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = geodeettiset ratkaisut

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = tärkeysotannan uudelleenotanta

seg-7a2e0e9cac08 = hiukkassuodatin

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = avaruudessa oleva signaali / signaalin tarkkuus avaruudessa

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = satelliittien laseretäisyysmittaus

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = oppikirja

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = signaali-kohinasuhde

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = neliösumma / jäännösten neliösumma

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = alan uusin taso

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = sama asiakirja kuin NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symmetrinen positiivisesti definiitti / positiivisesti definiitti

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = tiedostojen otsikoiden lisenssitunnisteet

seg-b377a91a047f = SPK

seg-5603642c612d = SPICE-ydin avaruusalusten ja planeettojen efemerideille

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = yksittäinen vikaantumispiste

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = signaalin laadun valvonta

seg-a4e75468e6f9 = korrelaattorin muotoon perustuvat harhautustarkistukset

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = neliöjuuri-informaatiosuodatin

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = auringon säteilypaine

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / sen korkeustiedostomuoto

seg-4692354a98de = laatat nimetään lounaiskulmansa mukaan, esimerkiksi N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = JPL:n ryhmä

seg-d21315ea8c52 = STEC

seg-84689b829867 = vinon reitin kokonaiselektronipitoisuus

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = tehtäväanalyysituote

seg-17d792c12885 = Iridiumin paikannus- ja ajanmäärityspalvelu

seg-3efaadad9c96 = STM

seg-da395fa674ec = tilasiirtymämatriisi

seg-d116578b987b = SV

seg-caa37a1e7d12 = avaruusalus (satelliitti)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = singulaariarvohajotelma

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = kaukokomento / telemetria

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = testilähtöinen kehitys

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = saapumisajan / saapumistaajuuden ero

seg-aecac9c9d2d0 = passiivinen lähettimen paikannus

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = maastonmuotojen sovitus

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = tallennettua GNSS-harhautusdataa (OAKBAT on samaan luokkaan kuuluva aineisto)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = aikavälivirhe

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = ITU:n jäsentilit

seg-c05ba396ac1e = ToA

seg-78a41e672189 = saapumisaika

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = toleranssi

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = kokonaispoikkeama / kokonaisvarianssi

seg-7350da5c5c30 = laajennetun ulottuvuuden vakausestimaattorit

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = ajoituksen suojaustaso

seg-10c9563602b7 = katso SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = lämpösuojajärjestelmä

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = maastoon sidottu navigointi

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = tekninen raportti / tekninen muistio

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Delftin teknillinen yliopisto

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = kaksisuuntainen satelliittipohjainen aika- ja taajuussiirto / kaksisuuntainen aika- ja taajuussiirto

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = u-bloxin binäärinen vastaanotinprotokolla

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = käyttäjän differentiaalinen etäisyysvirhe

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = käyttäjäekvivalentti etäisyysvirhe

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = IEEE Transactions -julkaisu

seg-573db7b5995b = { "300" } MHz – { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = käyttöliittymä / käyttökokemus

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = tasavälinen lineaarinen antenniryhmä

seg-db65f4a7586d = ULP

seg-ae7458813685 = viimeisen numeron yksikkö

seg-d7f4df5a9d13 = liukulukujen toistotarkkuus

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = käyttäjän etäisyystarkkuus / käyttäjän etäisyysvirhe

seg-17e8fb142c6c = URA rajaa eheyden, URE on tarkkuuden RMS

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = verkko-osoite

seg-088e05d67af1 = USGS

seg-ffed8eca324d = United States Geological Survey

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = United States Naval Observatory

seg-39ed84639c60 = USO

seg-f9f684640e53 = erittäin vakaa oskillaattori

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (monikriteerinen optimointi ja kompromissiratkaisu)

seg-7fe170288e4e = erittäin pitkän kantaviivan interferometria

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; katso edellä

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = Euroopan unionin ja Yhdysvaltain satelliittinavigointiyhteistyön työryhmä C

seg-79f0e87410bf = julkaisee ARAIMin viiteasiakirjat

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = valkoinen gaussinen kohina

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 käyttää WGS72-vakioita

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Wuhanin yliopisto

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = painotettu summamalli / painotettu tulomalli

seg-cc68c85bb2b9 = monikriteerinen aggregointi (WPM tarkoittaa myös valkoista vaihemodulaatiota; asiayhteys kertoo, kumpaa)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = poissulkeva tai

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = geomagneettisen kentän komponentit: pohjoinen, itä, alas, kokonaisvoimakkuus; deklinaatio, inklinaatio

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it (et tule tarvitsemaan sitä)

seg-e4e177088376 = suunnitteluperiaate

seg-565c1908393c = ZHD

seg-77a0948bc15d = zeniitin hydrostaattinen viive

seg-749be52554c5 = Toistettavuus ja lisensointi

seg-d78d9bbb905c = <b>Toistettava (deterministinen).</b> Sama syöte tuottaa aina bitilleen identtisen tulosteen — <c1/>. Ei piilotettua satunnaisuutta.

seg-1412347e2298 = <b>Siemenluku (seed).</b> Luku, joka alustaa (deterministisen) satunnaislukugeneraattorin, jotta ajot ovat toistettavia.

seg-3a35740e04a8 = <b>Avoin ydin (open core).</b> Liiketoimintamalli: moottori on ilmainen ja avointa lähdekoodia (AGPL-3.0, jäljempänä määritelty GNU Affero General Public License; kaupallinen kaksoislisensointi); liiketoimintaa kannattelevat tuki, integrointi, kaupalliset lisenssit ja suljetut lisäosat — ei paikkamaksut avoimesta moottorista.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3 — OSI:n (Open Source Initiative) hyväksymä vahva copyleft-avoimen lähdekoodin lisenssi. Se on kuten GPL (GNU General Public License), mutta sisältää lisäehdon (§{ "13" }), joka koskee <b>verkon yli</b> käyttäjille tarjottavaa ohjelmistoa: verkon yli käytettävän muokatun version on tarjottava näille käyttäjille vastaava lähdekoodinsa. Kshanan avoin lisenssi.

seg-f87860d8197d = <b>Kaksoislisensointi.</b> Saman koodin tarjoaminen kahdella lisenssillä, joista käyttäjä valitsee: tässä AGPL-3.0 (avoin, copyleft) <b>tai</b> kaupallinen lisenssi Ashforde OÜ:ltä (virolainen osakeyhtiö; OÜ = osaühing) suljettuun tai omistettuun käyttöön, johon AGPL ei sovellu. Katso <c1/>.

seg-dd5f4a1bbbf5 = Käytössä myös sivustolla kshana.dev

seg-9d0c42560a90 = Sivuston käyttämät lyhenteet, joita ei ole yllä olevassa repositorion sanastossa.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = kantoaalto-kohinatiheys, yksikkönä dB-Hz

seg-f22a269bc575 = GNSS:n käyttämä { "1" }–{ "2" } GHz:n radiokaista

seg-1f4360a0405c = GPS L1:n karkea hankintakoodi (coarse/acquisition)

seg-6f7910207534 = täydennetty eteenpäin lähetettävä signaali (Kuu)

seg-74f02864ce32 = mikrosähkömekaaniset järjestelmät

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = miehittämätön ilma-aluksen järjestelmä

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = suojaustaso · hälytysraja

seg-78134bcc48da = lähestyminen pystyohjauksella, taso I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = matala Maan kiertorata · geostationaarinen kiertorata

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = CCSDS:n ratojen efemeridi-, ratojen keskielementti- ja seurantadataviestit

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Deep Space Network

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = lämpötilakompensoitu · uunistabiloitu kideoskillaattori

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = passiivinen vetymaser

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = erittäin vakaa oskillaattori · syväavaruuden atomikello

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = suurin aikavälivirhe · aikapoikkeama

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = ensisijainen vertailuaikakello · parannettu PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = Allanin poikkeama keskiarvoistusajalla τ

seg-96fae3b4fb8e = Kansainvälinen televiestintäliitto, telestandardointisektori

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = normalisoitu innovaation neliö · normalisoitu estimointivirheen neliö

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · pilkuin erotetut arvot · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = komentorivikäyttöliittymä · ohjelmointirajapinta · integroitu kehitysympäristö

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = ohjelmistomateriaaliluettelo · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = salassapitosopimus

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = C/N₀-vesiputouskaavio

seg-ed4a9e041a83 = kaavio kantoaalto-kohinatiheydestä satelliittia kohti ajan funktiona

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = vaakasuuntainen · pystysuuntainen suojaustaso

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Edellinen</s1>Peruskäsitteet

seg-670504be0531 = <s1>Seuraava</s1>Studio-opas

seg-6c10aaedf2fc = <s1>Seuraava</s1>Kielet
