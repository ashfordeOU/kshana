# docs--tutorial-first-orbit: translations (fi)

seg-51ae9468b92a = Mikä tämä skenaario on

seg-08f3fdc9252a = Lue yhden rivin yhteenveto

seg-def5271a207d = Mitä testi lukitsee

seg-e5f926d1055b = Sudenkuopat ja yksiköt

seg-cb457294fc53 = Mihin seuraavaksi

seg-dcb2d0b170c1 = Lähde: <c1/>

seg-f57d8b38bf08 = Opetusohjelma { "1" } — Ensimmäinen kiertoratani: missä GPS-satelliitit ovat

seg-1b9e1178555d = <c1/> · <b>Skenaario:</b> <c2/> (opetuskopio: <a1><c3/></a1>) · <b>Vaikeustaso:</b> aloittelija · <b>~{ "15" } min</b>

seg-d065731294a1 = Lopuksi olet laskenut <em>todellisen</em> operatiivisen GPS-satelliittitähdistön satelliittien radat ajassa eteenpäin, lukenut sen saatavuuden ja geometrian ja viennyt taulukon siitä, missä jokainen satelliitti todella on avaruudessa — ja tiedät, että taulukko on validoitu ulkoista vertailua vasten, ei itseään vasten.

seg-b07bb365235d = GPS (Global Positioning System) -satelliitit kertovat käyttäjälle, <em>missä se on</em> ja <em>mitä kello on</em>. Ennen sitä on tiedettävä, <b>missä satelliitit ovat</b> ja <b>montako niistä käyttäjä näkee</b>. Se on geometriaa, ja geometria asettaa alarajan sille, kuinka tarkasti sijainti voidaan määrittää (tarkkuuden heikkenemiskerroin eli DOP). Tämä opetusohjelma:

seg-dec5079e7715 = ottaa GPS-satelliittitähdistön aidon Celestrak-tilannekuvan (ryhmä <c1/>; 2021-07-28, { "30" } satelliittia, oikeat kaksirivisiä elementtijoukkoja eli TLE),

seg-693859c435d8 = laskee jokaisen satelliitin radan ajassa eteenpäin validoidulla SGP4/SDP4-mallilla (Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }),

seg-74b73260c7bc = selvittää jokaisella aika-askeleella, mitkä satelliitit matalan Maan kiertoradan käyttäjä näkee (näköyhteys, Maan peitto ja { "5" }° korkeuskulmamaski),

seg-605c40b73e96 = muuttaa geometrian <b>PDOP</b>-arvoksi (sijainnin tarkkuuden heikkenemiskerroin) ja <b>sijaintitarkkuudeksi</b>, ja

seg-356e96d219b5 = vie satelliittien todelliset Maan keskipisteeseen sidotut, Maan mukana pyörivät (ECEF) sijainnit SP3-tiedostoon (Standard Product { "3" }, kansainvälisen GNSS-palvelun (International GNSS Service, IGS) tarkka rataformaatti; GNSS on maailmanlaajuinen satelliittinavigointijärjestelmä).

seg-ff1666fe175e = Runko on: <b>TLE → SGP4-ratalaskenta → ECEF aikahetkittäin → näkyvyys → näkyvien satelliittien määrä → PDOP → sijainti-sigma = PDOP · σ_UERE</b>, missä σ_UERE on käyttäjän ekvivalentti etäisyysvirhe (kunkin satelliitin 1-σ-etäisyysmittausvirhe).

seg-379da723ae57 = Tai avaa <a1>selaimen Studio</a1> ja valitse kiertorata-skenaario.

seg-441743833f1e = Deterministinen ajo (siemenluku = { "17" }) tulostaa:

seg-918a30fea48a = Kenttä kerrallaan:

seg-375fad797dcf = <b><c1/></b> — 12-merkkinen skenaarion tiiviste (hash). Se tunnistaa täsmälliset syötteet (siemenluvun, kynnykset, malliparametrit, TLE-lohkon). Muuta mitä tahansa syötettä, ja tiiviste muuttuu; pidä ne samoina, ja toistat ajon bitilleen. Sama tiiviste leimataan kaavion alatunnisteeseen ja tulos-JSON-tiedostoon (JavaScript Object Notation).

seg-133711d1ad9f = <b><c1/></b> — { "361" } aika-askeleesta käyttäjällä on käyttökelpoinen paikkaratkaisu { "345" } askeleella ({ "95.6" } %). Ajo on { "12" } h pituinen läpikäynti ({ "43,200" } s), ja askel on { "120" } s.

seg-a500c0473784 = <b><c1/></b> — läpikäynnin paras (pienin) sijainnin tarkkuuden heikkenemiskerroin. PDOP lähellä lukua { "1" } on erinomainen geometria; mitä pienempi, sen parempi.

seg-98a24f0170d2 = <b><c1/></b> — paras sijaintitarkkuus: <b>sijainti-sigma = PDOP · σ_UERE</b>. Tässä skenaariossa pätee <c2/>, joten kaksi lukua ovat tässä <em>numeerisesti yhtä suuret</em> — mutta sääntö on PDOP × UERE, <b>ei</b> ”sijainti = PDOP”. Jos UERE olisi { "3" } m, sijainti-sigma olisi ~{ "3.2" } m. (Katso sudenkuoppa lopussa.)

seg-410081c6dcab = Kelloluvut (<c1/>, <c2/>, <c3/>, <c4/>) tulevat mukaan, koska kiertoratapaketti kuljettaa läpikäynnin ajan myös kelloa; ne ovat <a1>opetusohjelman { "2" }</a1> aihe, eivät tämän. (Kentän <c5/> arvo on <c6/>, koska hyökkäystä ei ole määritetty.)

seg-95ccef0d94ae = JSON-tiedoston geometrialohko sisältää taustalla olevat luvut:

seg-89cb7db9b9eb = Missä satelliitit ovat? (palkinto)

seg-81678afa0cee = Geometria on hyvä, <em>koska</em> satelliitit ovat todella GPS-kuoressa. Todista se — vie niiden Maan mukana pyörivät sijainnit:

seg-1452dfac9e06 = Kolme ensimmäistä satelliittia ensimmäisellä näytteenottoaskeleella, ECEF km:nä (SP3-tiedostossa on neljäs, kellosarake, joka on kirjoitettu ”ei arvoa” -merkinnällä { "999999.999999" }):

seg-4fd0f95da0cf = Otetaan PG01:n geosentrinen säde:

seg-cb02d7c01561 = Kehäpäättelystä vapaa oraakkeli: onko tämä todella GPS-rata?

seg-a7c478360464 = Opetusohjelma, joka tarkistaa moottorin itseään vasten, ei todista mitään. Tässä on ulkoinen, <em>kehäpäättelystä vapaa</em> ankkuri jokaiselle yllä olevalle väitteelle.

seg-eec62069a957 = <b>{ "1" }. Satelliitit ovat todellisessa GPS:n keskikorkean Maan kiertoradan (MEO) kuoressa.</b> GPS:n nimellinen isoakselin puolikas on <b>a = { "26,560" } km</b>, korkeus ≈ { "20,180" } km keskimääräisen Maan säteen { "6,378" } km yläpuolella (IS-GPS-200, GPS:n rajapintamäärittely; GPS Standard Positioning Service (SPS) Performance Standard, US Department of Defense (DoD); Misra & Enge, <em>Global Positioning System</em>, 2nd ed.). PG01:n hetkellinen säde <b>{ "26,480.9" } km</b> on muutaman sadan km:n päässä arvosta <c1/> — täsmälleen sen, minkä todellinen GPS:n eksentrisyys (~{ "0.005" }–{ "0.02" }) tuottaa. Testi <c2/> varmistaa ehdon <c3/> tätä julkaistua arvoa <c4/> vasten, joka on <b>Kshana-ohjelmiston ulkopuolinen</b>.

seg-a052774de08f = <b>{ "2" }. Läpikäynnin pituus on yksi GPS-kierros.</b> Keplerin kolmas laki antaa kiertoajan <c1/>, kun <c2/> ja <c3/> (World Geodetic System { "1984" }, WGS-84; National Imagery and Mapping Agency technical report NIMA TR8350.2): <c4/>, eli puoli sideerista vuorokautta. Skenaarion kesto { "43,200" } s (”~yksi GPS-kierros”) vastaa tätä alle { "0.3" } % tarkkuudella, ja GPS:n maanpintajälki toistuu joka sideerinen vuorokausi (kaksi kierrosta) IS-GPS-200:n mukaan.

seg-067fb466e396 = <b>{ "3" }. Ratalaskennan sijainnit on validoitu, ne eivät ole vain sisäisesti johdonmukaisia.</b> SGP4/SDP4-ratalaskuri, joka tuotti tämän ECEF-taulukon, vastaa <b>kaikkia { "666" } AIAA:n (American Institute of Aeronautics and Astronautics) 2006-6753 -varmennusvektoria huonoimmassa tapauksessa { "4.12" } mm:n poikkeamalla</b> (<c1/>, <a1><c2/></a1>) ja täsmää riippumattomaan kirjastoon (crate) <c3/> alle mikrometrin tarkkuudella. Viemäsi taulukko on siis tarkistettu ulkoista vertailutoteutusta vasten, ei Kshana-ohjelmiston omaa aritmetiikkaa vasten.

seg-652ec3b3d3b8 = <b>Huomautus SP3-päivämääristä.</b> SP3-aikakauden otsikossa on paikkamerkkikalenteripäivä (2000-01-01); ratalaskenta alkaa todellisuudessa kunkin TLE:n omasta ajanhetkestä (epookista) ({ "2021" }). Lue taulukko ”ECEF-sijainnit ensimmäisellä näytteenottoaskeleella”, ei ”päivämääränä { "1" }. tammikuuta { "2000" }”.

seg-74dcb96a27a9 = <c1/> muuttaa jokaisen yllä olevan luvun CI-sopimukseksi:

seg-cbad1e83279d = <c1/> — <c2/>, <c3/> (koska <c4/>), <c5/>, ja yhteenveto sisältää <c6/>.

seg-241d75b1502b = <c1/> — PG01:n säde on GPS-kuoren kaistalla, tarkistettuna julkaistua arvoa <c2/> vasten.

seg-34328f4f148b = Jos moottori joskus lakkaa tuottamasta todellista GPS-kuorta, koonti menee punaiselle.

seg-3c23c11911cb = <b>Sijainti-sigma on PDOP × UERE, ei PDOP.</b> Ne ovat yhtä suuret <em>vain siksi</em>, että tässä pätee <c1/>. Muuta UERE-arvoa, niin ne erkanevat.

seg-6bb2f31c15dc = <b>Ajoitusluvut ovat nanosekunteina</b>, sijaintiluku metreinä. Älä sekoita niitä.

seg-5bc68d0c144d = <b><c1/> on ruudukkoon kvantisoitu</b> (alaraja aikaruudukon askeleella). Tässä läpikäynnissä käyttäjällä on käytännössä aina paikkaratkaisu, joten holdover on { "0" } s (ei katkoa, jonka yli ajautua) — se on <em>hyvä</em> tapaus.

seg-9c36a5c64af5 = Kiristä tai löysää korkeuskulmamaskia (<c1/>) ja seuraa, miten saatavuus muuttuu — se on tason 2 harjoitus.

seg-b0222934237e = Vaihda tuore TLE-tilannekuva komennolla <c1/> (tason 2 ”käytä tuoretta dataa”).

seg-e487166204f8 = Jatka kohtaan <a1>Opetusohjelma { "2" } — Kellon holdover</a1>, jossa GNSS-signaali <em>otetaan pois</em> ja aluksen kellon on pysyttävä omillaan.

seg-795315608752 = <s1>Edellinen</s1>Opetusohjelmat

seg-97ca5a3cc77e = <s1>Seuraava</s1>{ "2" } · Kellon holdover
