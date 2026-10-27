# docs--maritime-trust: translations (fi)

seg-2247a2344710 = Merkitys

seg-6940543aa3c0 = merkkijono

seg-abec93a4a488 = merkkijono tai null

seg-f5e7215e6835 = objekti

seg-b993ef559bd0 = Koodista

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> tai <c4/>

seg-2896f449bffb = Lähde: <c1/>

seg-342f34403ac5 = Merenkulun luottamus: voiko silta luottaa tähän paikkaratkaisuun?

seg-49b609a9655c = <c1/> voi pisteyttää <b>liikkuvalle alukselle</b> jokaiselle paikkaratkaisulle reaaliaikaisen luottamusluvun 0-100 siitä, mitä mikä tahansa vastaanotin jo syöttää väylälle (ensin NMEA { "0183" }), ja kertoa, mitkä tarkistukset laskivat sitä. Se on ohjelmistokerros vastaanottimen vieressä. Se ei ole vastaanotin, se ei korvaa sellaista, eikä se tee paikkaratkaisusta tarkempaa.

seg-3c66739c9250 = <b>Ohjeellinen ohjelmisto.</b> Kshana ei ole tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }), eikä sitä ole arvioitu suhteessa mihinkään suorituskykystandardiin. Sen pistemäärä ja gate ovat apuvälineitä navigoijan harkinnalle. Käyttäjä vastaa edelleen aluksen turvallisesta navigoinnista ja kaikista päätöksistä luottaa paikkaratkaisuun tai lopettaa sen luottaminen.

seg-a9899ca66661 = Tämä sivu kertoo, mitä tarkistukset katsovat, mitä kukin voi ja ei voi havaita, miten se ajetaan reaaliaikaisesti ja mitä gate tekee. Pistemäärän kuvaus ja kaikki oletukset ovat tiedostossa <a1><c1/></a1>.

seg-05e79b6c5a58 = Mitä se lukee

seg-e784fdbe26e6 = Alus ilmoitetaan istuntotiedostossa, ja sen rajat esitetään ennen ajoa:

seg-e8e9ee2965cf = Lause

seg-e127f2f26824 = Luettu

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = sijainti, paikkaratkaisun laatu ({ "0" } = ei paikkaratkaisua), korkeus keskimerenpinnasta, geoidin erotus, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = tila (<c1/> kelvollinen, <c2/> ei), maanopeus ja -kurssi, päivämäärä, toimintatila

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = maanopeus ja -kurssi, kun RMC:ssä ei ole sellaisia

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = suunta (THS vain, kun sen toimintatila ei ole <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = nopeus veden suhteen (VBW vain, kun sen tila on <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = aika

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = satelliittikohtainen signaalinvoimakkuus (dB-Hz), korkeuskulma ja atsimuutti (geometriaa varten)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = DOP (tarkkuuden heikkenemiskerroin) ja käytetyt satelliitit (geometriaa varten, kun GSV ei anna taivasta; ja ilmoitettu HDOP, jota tarkistus vertaa)

seg-305f423d3ead = vastaanottimen ilmoittama OSNMA-tila, jonka vastaanotinta lukeva sovitin on muuntanut tähän lauseeseen: <c1/> todennettu, <c2/> epäonnistui, <c3/> ei tulosta

seg-7ce1d69e710e = Epookkeja, joista vastaanotin itse sanoo, etteivät ne ole satelliittipaikkaratkaisu (GGA-laatu { "0" } tai { "6" } – { "8" }: arvioitu, manuaalinen, simulaattori; RMC-tila <c1/> tai toimintatila <c2/>, <c3/>, <c4/>, <c5/>), ei käytetä paikkatarkistuksiin eikä ne ole todiste suuntaan eikä toiseen: vastaanotin on jo sen sanonut.

seg-a0ae80781c6e = Ensimmäiset <c1/> sekuntia muodostavat lähtötason, eikä niitä koskaan pisteytetä. Jokainen monitori katsoo vain nykyistä ja aiempia epookkeja, joten päätös epookilla ei muutu myöhempien tietojen saapuessa, ja reaaliaikainen virta antaa saman pistemäärän kuin sama teksti tiedostona luettuna.

seg-068593ad0a52 = Mitä kukin tarkistus havaitsee ja mitä ei

seg-094b90f0c701 = Paikkaratkaisujen väliset suunnat (käännösnopeustarkistuksen käyttämä raidesuunta, kahden sijainnin implikoima kurssi) ovat niiden välisen jänteen suunta, joka on geodeesin <b>keskimääräinen atsimuutti</b> paikkaratkaisujen välillä, ei eteenpäinatsimuutti ensimmäisessä paikkaratkaisussa; nämä kaksi eroavat noin puolella paikkaratkaisujen välisten meridiaanien suppenemisesta ({ "0.001" } astetta peruslinjalla, jonka pituus on { "260" } m, leveysasteella { "59.5" } astetta).

seg-ed3cdfcfbff5 = Väärennetyn sijainnin on täsmättävä aluksen fysiikkaan ja aluksen muihin antureihin. Jokainen tarkistus vertaa paikkaratkaisua yhteen niistä. Tarkistus on vain niin riippumaton kuin sen toinen lähde: GNSS-kompassin suunta tai GNSS:stä johdettu ”nopeus veden suhteen” ei ole riippumaton testattavasta vastaanottimesta eikä tuo mitään lisää.
