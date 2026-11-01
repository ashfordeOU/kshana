# docs--partner-data: translations (fi)

seg-2247a2344710 = Merkitys

seg-6e0cb6acc073 = VALIDATED

seg-a349aa76b0ed = PARTNER

seg-34bdcfd66ded = Siinä repositorion haarassa, josta nämä dokumentit tulevat; ei vielä GitHubissa

seg-f942b36a11c4 = Ei vielä GitHubissa

seg-7338b6210228 = Rivi

seg-c5ce76c91ff7 = Nimike

seg-3a04afee76ec = Lähde: <c1/>

seg-e6d8549f24b9 = Kumppanidata: mikä mitattu data voisi nostaa tasoa riville, jonka taso on MODELLED

seg-7b9ff34db2c4 = Kshana merkitsee jokaisen ominaisuuden koneellisesti tarkistettuun kirjanpitoon (ledger) (<a1>varmennusmatriisi</a1>). Useimmat ajoitus- ja anturirivit ovat <b>MODELLED</b>: ne perustuvat ilmoitettuihin malleihin, julkaistuihin datalehtiin ja sisäisiin tarkistuksiin, eikä laiteluokasta ole verrattu niihin yhtään mitattua tallennetta. Tällaisen tallenteen haltija voi muuttaa tämän. Tällä sivulla kerrotaan, mitkä rivit, mitä lähettää, miten lähetys tarkistetaan, miten se pisteytetään ja miten se hyvitetään. Sivu on kirjoitettu laboratoriolle, valmistajalle tai yliopistoryhmälle; se ei ole työtarjous eikä väitä kenenkään tukevan sitä. Vain ohjeellinen: Kshana on tutkimusväline, ei tyyppihyväksytty navigointi- tai ajoituslaite.

seg-1cf5536037d4 = Mitä merkinnät tarkoittavat

seg-5f43f341fa27 = riippumaton ulkoinen oraakkeli on samaa mieltä ominaisuuden kanssa kynnyksellä, joka on kiinnitetty ennen vertailua. Kumppanin mitattu tallenne voi olla tuo oraakkeli sille alaväitteelle, jonka se kattaa; matriisin invariantit kieltävät merkinnän ilman sellaista

seg-0d182b8c7430 = sisäisesti johdonmukainen ja sanottu ääneen; mikään ulkoinen oraakkeli ei kata väitettä. Rivi, jonka taso on MODELLED ja jota verrataan mitattuun dataan ja joka ei täytä kynnystä, pysyy tasolla MODELLED, ja alitus julkaistaan

seg-8a45367544a0 = osa-alue, johon ajo nojaa ja jonka omistaa laitteistokumppani eikä Kshana tarjoa, esimerkiksi luvut, jotka kuvaavat kumppanin omaa kelloa tai interferometriä. Kshana mallintaa, mitä tällainen laite tekisi navigointi- tai ajoitusketjulle; se ei takaa laitetta

seg-553a1db0e11d = Lähetys voi nostaa rivin tasolle VALIDATED vain sille väitteelle, jota data todella testaa, ja vain jos vertailu täyttää kynnyksensä. Se ei voi tehdä laitteen omista luvuista sellaisia, joista Kshana vastaisi: ne pysyvät kumppanin (PARTNER). Rivin merkinnän muuttuminen on omistajan päätös, kirjattu sen muuttavaan committiin, ja oraakkelitekstissä sanotaan tarkasti, mitä verrattiin mihin.

seg-bac61cc47097 = Rivit, joita kumppanin data voisi nostaa

seg-bd4f5d3f9399 = Jokainen alla oleva rivi on matriisin sellaisen rivin, jonka taso on MODELLED, tarkka <c1/>-teksti (testi pitää tämän sivun ja matriisin synkassa). ”Voisi muuttaa” kertoo, mitä ennalta rekisteröity vertailu mitattuun dataan tukisi, jos kynnys täyttyy; se ei ole koskaan lupaus.

seg-fb5ceb1d62f0 = Data, joka testaisi sen

seg-812eae6bbea9 = Voisi muuttaa

seg-f46d009d9380 = usean päivän tallenne nimetyn luokan kellosta, joka käy vapaasti viimeisen ulkoisella viitteellä ohjaamisen jälkeen, verrattuna parempaan viitteeseen, näytteenottovälillä enintään minuutti

seg-2a73fc59a03d = luokkakohtaiset punaisen kohinan lattiat, jotka rajaavat holdover-lukuja, pysyvät tällä hetkellä tasolla MODELLED; mitattua pitkän keskiarvoistusajan vakautta voisi verrata kyseisen luokan lattiaan, vain sille luokalle

seg-abe6b657ce1b = kumppanin kellon tai atomi-interferometrin mitattu Allanin poikkeama, taulukkona tai vaihetallenteena

seg-6ba2b7faa909 = kompromissivertailun luvut kvantifioivat (eivät koskaan validoi) kumppanin laitetta, joten ne merkittäisiin kumppanin luvuiksi (PARTNER); mitatun Allan-datan sisäänotto kohinamalliin on jo täsmäytetty riippumattomaan ratkaisijaan

seg-ad537759d084 = vaihetallenne jonkin neljän esiasetetun mallin oskillaattorista, vähintään vuorokauden ajalta

seg-44a55f6ebef6 = toistaako esiasetuksen datalehdestä johdettu kohinamalli mitatun yksilön vakauden datalehden omilla keskiarvoistusajoilla

seg-3da5a93abde6 = vaihetallenne kellosta, jonka luokalle ei vielä ole korttia (OCXO, rubidium, cesium, maseri, optinen kello)

seg-72f248aa4438 = ensimmäiselle kolmannekselle sovitettu kortti, joka ennustaa lopun Allanin poikkeaman ennalta rekisteröidyn kertoimen sisällä, kuten jo on tehty GNSS-satelliittikelloille ja yhdelle vastaanottimelle

seg-54971e473811 = loki todellisesta asennuksesta (mikä tahansa daemon-versio) ja daemonin omat yhteenvetorivit

seg-bccf188b7636 = lukijat on rakennettu julkisista rivirakenteista ja testiaineistoista; todellinen loki verrattuna riippumattomaan lukijaan olisi ensimmäinen ulkoinen tarkistus

seg-e83b73ab2d5d = todellinen laskurin tai analyysiohjelmiston vienti

seg-80b69f559ea5 = sama näille muodoille

seg-0c279732d132 = todellinen holdover-testi: tallenne, hetket, jolloin käyttäjä poisti ja palautti viitteen, sekä laboratorion omat MTIE-, TDEV- ja maskitulokset sen analyysiohjelmistosta

seg-cfad71161af0 = riippumaton laskenta samoista suureista, jota verrataan moottorin laskentaan

seg-97c65b646eae = loki paikallaan olevasta inertiayksiköstä, jonka kohinaparametrit joku muu on julkaissut tai mitannut

seg-77f9d22ec624 = sovite palauttaa riippumattomat parametrit ilmoitetun kertoimen sisällä

seg-c9544eadc55d = staattinen loki tai kumppanin kylmäatomi-inertia-anturin kohinaparametrit

seg-062dd193ab20 = laitteen luvut ovat kumppanin (PARTNER); ne yhdistävä paikkavirhebudjetti pysyy Kshana-järjestelmän omana mallina

seg-078be7f5769f = Aloita kahdella ensimmäisellä: ne ratkaisevat, nojaavatko luokkakohtaiset holdover-lattiat ja kvantti–klassinen-kompromissivertailu mihinkään omaan mitattuun dataan.

seg-c325655738e0 = Mitä lähettää

seg-ca24fa511ffe = Lähetys on kaksi tiedostoa yhdessä kansiossa: data ja sen pieni kuvaus, TOML-tiedosto (<c1/>; toimiva, keksitty esimerkki on <c2/>).

seg-a3e30cf27adb = <b>Kellodata.</b> Jokin muodoista, jotka Kshana lukee (ks. <a1>kellologimuodot</a1>): TAPR TICC -lokit, TimeLab-tyyppinen ASCII-vaihe tai -taajuus, RINEX-kello, linuxptp-lokit <c1/>, <c2/> ja <c3/>, chronyn seuranta- ja tilastolokit. Vaihe on parempi kuin taajuus; ilmoita yksiköt ja näytteenottoväli. Anna pisin keskeytymätön tallenne, joka sinulla on: vakaus pitkillä keskiarvoistusajoilla vaatii päiviä, ja alle vuorokauden tallenne otetaan vastaan mutta siitä varoitetaan.

seg-a14b0c961637 = <b>Inertiadata.</b> Nimetyillä sarakkeilla varustettu CSV (<c1/>, rad/s ja m/s^{ "2" }) tai EuRoC-asettelu, paikallaan olevasta laitteesta, riittävän pitkä sovitteelle (vähintään { "2000" } näytettä; tunnit on parempi).

seg-a1f2cd79bcc0 = <b>Kuvaus</b> kertoo seuraavat, ja tarkistin varmentaa ne, missä voi:

seg-cfeee5da56d7 = organisaation tyyppi (tyyppi kuten ”kansallinen ajoituslaboratorio”, ei nimi; nimi on valinnainen ja vain hyvitystä varten);

seg-4bd30d68101c = laite (laji, luokka ja malli luokalle <c1/>);

seg-e8222178a0ee = miten data otettiin: mihin sitä verrattiin, aloitusaika (UTC), ympäristö ja onko se raakaa vai käsiteltyä (ja mitä sille tehtiin);

seg-7ac28bd566f2 = datatiedoston SHA-256, jotta pisteytetty tiedosto on kuvattu tiedosto;

seg-0eba30c3a5b8 = rivit, joiden taso on MODELLED ja joita vasten data tarjotaan, yllä olevan tarkan vaatimustekstin mukaan;

seg-dd694deec626 = lisenssi (SPDX-tunniste tai sanoin) ja miten dataa saa käyttää arkistossa: <c1/> (tallennetaan attribuutiolla), <c2/> (vain sen tiiviste ja pisteet julkaistaan) tai <c3/> (pisteet jaetaan vain lähettäjälle);

seg-7cea4b7c1df8 = kolme lausuntoa: se on mittaus eikä simulaatio, lähettäjä saa lisensoida sen tähän käyttöön, ja tiedostot eivät sisällä henkilötietoja.

seg-caa6696f3f5f = <b>Ei lähetettäväksi.</b> Mitään henkilökohtaista tai yhteystietoja sisältävää (tarkistin hylkää kuvauksessa olevan sähköpostiosoitteen tai puhelinnumeron), mitään vientivalvonnan alaista tai sopimuksella rajoitettua, eikä simuloitua dataa, joka esitetään mitattuna.

seg-a2f0067b6da5 = Miten lähetys tarkistetaan

seg-f1d4c097691e = Muoto ja metatiedot, sinun tai meidän toimestamme, ennen kuin mitään ajetaan.

seg-c3cd90222eaa = Tarkistus vahvistaa skeeman, pakolliset kentät, tiivisteen, lisenssi- ja attribuutiosäännöt, että kohderivit ovat olemassa ja niiden taso on MODELLED, ja että data luetaan moottorin omalla lukijalla; se raportoi, mitä luki (näytteet, väli, kesto, aukot), ja varoittaa lyhyistä tallenteista. Poistumistila { "0" } tarkoittaa täydellistä ja luettavaa; { "1" } luettelee korjattavat. <b>Se ei pisteytä dataa, validoi riviä eikä lupaa, että dataa käytetään.</b>

seg-7dd95552a6fb = <b>Ennakkorekisteröinti ennen mitään pisteytettyä ajoa.</b> Jokaiselle riville asiakirja hakemistossa <c1/> kiinnittää seuraavat, ja se kirjataan committiin ennen datan ajoa: rivi, datatiedoston SHA-256, mikä osa datasta pidetään erillään (pidätetty, holdout; mikään sovitettu ei saa nähdä sitä), mittari ja kynnys. Kellokorteille nykyinen malli on IGS- ja vastaanotintallenteille käytetty pidätetty ennuste: sovita tallenteen ensimmäiseen kolmannekseen, ennusta lopun Allanin poikkeama ja vaadi ennustetun ja mitatun suhteen olevan ilmoitetun kertoimen sisällä jokaisella sovitetulla keskiarvoistusajalla. Kynnystä ei koskaan löysennetä ajon jälkeen.

seg-10dc9f8cf394 = <b>Yksi pisteytetty ajo.</b> Tulos, jokainen luku ja jokainen alitus mukaan lukien, julkaistaan komennon ja commitin kera, ja testi lukitsee sen. Alitus on havainto, ei piilotettava epäonnistuminen: rivi pysyy tasolla MODELLED ja sivu kertoo sen.

seg-e5704c43a6b8 = <b>Kirjanpitopäätös (ledger) on omistajan</b>, kirjallisesti, riviä muuttavassa commitissa. Ylennetyn rivin oraakkeliteksti nimeää aineiston, sen lisenssin ja hyvityksen, mitä verrattiin ja mitä ei.

seg-6d467ffb4199 = Hyvitys ja oikeudet

seg-e82f31e7d9cc = Data pysyy sinun ilmoittamasi lisenssin mukaisesti. <c1/> ja <c2/> pitävät tiedoston arkiston ulkopuolella.

seg-156499ebc142 = Lähetys, jonka käyttötapa on <c1/>, hyvitetään antamasi attribuutiorivin mukaan rivin oraakkelitekstissä ja tulostiedostossa.

seg-a5c01115d23a = Mitään ei julkaista nimelläsi ilman kirjallista suostumustasi; lähteeksi nimetty organisaatio mainitaan lähteenä, ei koskaan kannattajana. Kumppanin puolesta tai kumppanista ei esitetä väitettä hyväksynnästä eikä kannatuksesta.

seg-6c9ed423e51d = Voit peruuttaa lähetyksen ennen kuin sen tulos julkaistaan. Sen jälkeen tulos pysyy kirjattuna; jos peruutat datan lisenssin, tiedosto poistetaan arkistosta ja tiiviste sekä pisteet jäävät.

seg-2cc3c091ba0f = Kshana ei lähetä mitään eikä ohjaa laitteistoa. Lähetys on tiedostoja sisään, raportti ulos.

seg-01b0ee9973dc = Yhteydenotto

seg-b5cb4dc0493f = Yhden sivun muistio laboratoriolle on laadittu omistajalle tiedostoon <s1><c1/></s1>. Se on luonnos: mitään ei lähetetä eikä kehenkään oteta yhteyttä ennen kuin omistaja päättää.

seg-83b30e1ca261 = <s1>Edellinen</s1>Todistepaketit

seg-09c0b5fa6e52 = <s1>Seuraava</s1>Optiset linkit ilmakehän läpi
