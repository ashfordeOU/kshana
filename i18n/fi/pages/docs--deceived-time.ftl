# docs--deceived-time: translations (fi)

seg-d46702617926 = Lähde: <c1/>

seg-f44d01df7b1c = Allekirjoitettu komento, joka suoritetaan harhautetulla ajalla, reitittää silti väärin

seg-6497012e401e = Tekninen huomautus aikaindeksoitujen verkkojen operaattoreille: tähdistöt, jotka reitittävät, tehtävöivät tai luovuttavat aikataulun mukaan, jolloin jokainen solmu toimii, kun sen oma kello saavuttaa aikataulutetun hetken.

seg-714bce435435 = Lyhenteet: GNSS, maailmanlaajuinen satelliittinavigointijärjestelmä; TPL, ajoituksen suojaustaso; PNT, paikannus, navigointi ja ajanmääritys.

seg-a7208323de1c = Väite

seg-246715a1c559 = Ohjausviestien autentikointi, myös kvanttilaskennan jälkeisillä (post-quantum) allekirjoituksilla, todistaa, kuka viestin lähetti ja ettei sitä ole muutettu. Se ei todista, <b>milloin vastaanottaja toimii sen perusteella</b>. Solmu suorittaa aikaindeksoidun komennon omaa kelloaan vasten. Jos kelloa on vedetty arvolla <c1/>, hetkelle <c2/> pätevä komento suoritetaan todellisella ajalla <c3/>, kaikki allekirjoitukset ehjinä. Kun <c4/> ylittää slottisuojan, liikenne päätyy väärään slottiin, linkki vaihtuu vaikka toinen pää osoittaa vielä muualle, tai luovutus tapahtuu etuajassa. Verkko reitittää väärin, ja jokainen komentopolun eheystarkistus ilmoittaa onnistumisesta.

seg-8683f0749042 = Miksi kello on pehmeä kohde

seg-1af5aea2ef5b = <b>GNSS-aika on tavallinen viite, ja sitä voi harhauttaa.</b> Solmu, joka kurinalaistaa kellonsa GNSS:ään, perii minkä tahansa ajan, jota vastaanotin tarjoaa. Harhauttaja, joka pitää vastaanottimen omat laatulippuset vihreinä, voi vetää tätä aikaa hitaasti.

seg-354a4c706264 = <b>Tuoreustarkistukset käyttävät samaa kelloa.</b> Voimassaoloikkuna (”hyväksy tämä komento kunnes <c1/>”) tai aikaan sidottu toistolaskuri arvioidaan paikallista kelloa vasten, joten vedetty kello voi myös laajentaa ikkunaa, jossa kaapattu allekirjoitettu komento hyväksytään.

seg-a4b8a5db0975 = <b>Hyökkäys ei tarvitse avainta.</b> Allekirjoitettuun kanavaan ei kosketa. Vahvempi kryptografia nostaa komennon väärentämisen hintaa ja jättää tämän hinnan ennalleen.

seg-e514b03fbae3 = Tämä sijoittuu kvanttilaskennan jälkeisen kryptografian työn rinnalle, ei sitä vastaan: nämä kaksi sulkevat eri aukkoja. Allekirjoitukset pysäyttävät väärennetyn komennon. Aikaeheys pysäyttää aidon komennon suorittamisen väärällä hetkellä.

seg-09f493386dbc = Mikä sen rajaa

seg-750bd90b0ee1 = Neljä toimenpidettä, joista kukin on kvantifioitu skenaariolajilla <c1/> (<a1><c2/></a1>):

seg-77cf39b434b5 = <b>Kelloavusteinen valvonta.</b> Vertaa GNSS-aikaa solmun omaan kelloon, joka rullaa ikkunan yli, ja hälytä, kun ero on liian suuri ollakseen kellokohinaa. Ehdollinen TPL rajaa virheen, joka voi jäädä huomaamatta ennen hälytystä.

seg-e58f7fb94ac5 = <b>Riippumattomat tarkistukset, aikataulutettuina.</b> Maa-aseman kaksisuuntainen ajansiirto tai ristiyhteysvertailu naapurin kanssa, joka on harhauttajan ulottumattomissa, rajaa, kuinka kauan hidas veto voi jatkua. Niiden käyntiväli on tietoturvaparametri, ei vain operatiivinen.

seg-69590f56817c = <b>Geometria.</b> Maalla oleva harhauttaja yltää matalan Maan kiertoradan satelliittiin vain, kun se on harhauttajan horisontin yläpuolella, joten vetoa rajoittaa harhauttajan ramppinopeus kertaa tuo ikkuna. Laskuna: ramppi { "10" } ns/s, jota pidetään { "600" } s, on { "6" } µs. Mukana toimitettu esimerkki (<c1/>: kiertorata { "550" } km, enimmäisramppi { "10" } ns/s) raportoi harhauttajan altistukseksi { "732" } s ja ramppirajoitetuksi vedoksi { "7 321" } ns.

seg-e8e52ce05943 = <b>Rajasta mitoitettu suoja ja turvallinen toimenpide hälytyksessä.</b> Slottisuojan tulisi kattaa suurin havaitsematta jäävä virhe, jonka valvonta ja tarkistukset sallivat, ei vain kellon vapaasti käyvän kohinan. Hälytyksessä solmun tulisi pitää viimeisin hyvä aikataulunsa rullaavalla kellollaan GNSS:n seuraamisen sijaan.

seg-c11b66f214ac = Mitä tämä huomautus ei väitä

seg-8b0ed39ead25 = Se ei väitä, että harhautettu satelliitti olisi havaittu reitittävän väärin; se ei arvioi minkään operaattorin altistusta; ja rajat, joihin se viittaa, ovat MODELLED, ehdollisia havaitsemiselle ja ilmoitetuille uhkaoletuksille. Se perustelee kokonaisuuden: pätevä allekirjoitus ja oikea suoritusaika ovat erillisiä ominaisuuksia, ja aikaindeksoitu verkko tarvitsee molemmat.

seg-c1bf6467e3c9 = <s1>Edellinen</s1>Telealan ajoitus

seg-d4e9bfd42982 = <s1>Seuraava</s1>Holdover-testi ja ajoituslaitteisto silmukassa
