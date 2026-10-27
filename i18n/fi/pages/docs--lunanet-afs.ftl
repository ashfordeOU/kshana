# docs--lunanet-afs: translations (fi)

seg-33f4c7af9c53 = Kantoaalto

seg-53a7343c076e = Väite

seg-da9970bcbab7 = Lähde: <c1/>

seg-4013a17a3517 = LunaNet Augmented Forward Signal: koodit, viestimuoto ja <c1/>

seg-c1a27b995345 = Kshana toteuttaa LunaNet <b>Augmented Forward Signal (AFS)</b> -signaalin hajautuskoodit ja viestikerroksen sellaisina kuin eritelmän yksi painos ne määrittelee, ja tarkistaa itsensä kyseisen painoksen painettuja taulukoita vastaan.

seg-e9bd99bbddb5 = <b>Kiinnitys.</b> LunaNet Interoperability Specification (LNIS) <b>versio { "5" }</b>, sovellettava asiakirja { "1" }, osa A: <em>LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal</em> (LSIS-AFS) <b>versio { "1.0" }, { "29" }. tammikuuta { "2025" }</b> (NASA). Haettu 2026-10-18; PDF:n SHA-256 <c1/> (<a1>alkuperä</a1>). Myöhempi painos on eri kiinnitys ja voi muuttaa koodeja: asiakirja merkitsee koodintaulukkonsa { "{" }LSIS-TBC{ "}" } ja sanoo niiden olevan ”included to facilitate test and integration efforts only”. Jokainen raportti nimeää tämän painoksen.

seg-6845e671bf24 = Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.

seg-69a98d01f489 = LunaNet AFS -koodigeneraattori tarkistettuna eritelmän painettuja sarakkeita vastaan, moottorin v{ $version } todellisesta ajosta (`kshana lunanet-afs-check spec`, kiinnitetty versioon LNIS V5, AD1 osa A (LSIS-AFS) V1.0, { "29" }. tammikuuta { "2025" }; asiakirja merkitsee koodintaulukkonsa { "{" }LSIS-TBC{ "}" }). { "10" } tarkistuksesta täyttyy { "9" }; B4 on NOT MET ({ "421" } kohdasta { "420" } täsmäsi). Se tarkistaa symbolivirran yhtä julkaistun eritelmän painosta vastaan eikä kerro mitään yhdestäkään LunaNet-solmusta tai -palvelusta. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Se tarkistaa symbolivirran yhtä julkaistun eritelmän painosta vastaan eikä kerro mitään yhdestäkään LunaNet-solmusta tai -palvelusta.

seg-4c3f77d97294 = Mitä on toteutettu

seg-a0b684e44fb0 = Kerros

seg-5d987fca539c = Mitä

seg-df52127d74b6 = Missä

seg-637035a0b1c1 = AFS-I (data)

seg-dbee58df4c92 = Gold-koodi { "2047" } lyhennettynä { "2046" } chipiin (short-cycled), G2 viivästetty PRN-kohtaisella määrällä chippejä, { "1.023" } Mchip/s, BPSK({ "1" }), { "500" } symbol/s, PRN { "1" }–{ "210" }

seg-d4480ead20d1 = <c1/>, signaalin nimi <c2/>

seg-6d84dce7f6d0 = AFS-Q (pilotti)

seg-2ebf619c9cb6 = Weil-koodi { "10230" } (GPS L1C:n rakenne) kerrostettuna 4 chipin sekundaarikoodiin (S0–S3) ja 1500 chipin tertiääriseen Weil-koodiin ({ "12" } s), { "5.115" } Mchip/s, BPSK({ "5" }), ei dataa. <c1/> ja signaalin nimi <c2/> ovat vastaanottimen replika, primääri x sekundääri ({ "8" } ms): { "12" } s tertiäärinen kehyssynkronointipeite on jätetty siitä pois, koska hankinta ja seuranta eivät korreloi { "12" } s replikaa vastaan. <c3/> on koko { "12" } s koodi

seg-03805fa6d5b1 = { "2492.028" } MHz (LSIS-020)

seg-906440b861cd = Kehys

seg-20bc4439d3d7 = SP { "68" } + SB1 { "52" } + { "5880" } lomitettua symbolia = { "6000" } symbolia = { "12" } s nopeudella { "500" } symbol/s

seg-a242d95d701f = { "9" } bittiä (FID { "2" }, TOI { "7" }), BCH({ "51,8" }), generaattori { "763" } oktaalina, asiakirjan 256 hypoteesin korrelaatiodekooderilla

seg-df8894e1304f = CRC

seg-a04ccd611398 = CRC-24Q, generaattori ({ "1" }+X)P(X) (liite H)

seg-e225f10d7848 = Lomittaja

seg-cb075da6f8cf = { "60" } riviä x { "98" } saraketta, kirjoitetaan riveittäin ja luetaan sarakkeittain

seg-d544025254af = Kaksi komponenttia hyväksyvät komennot <c1/>, <c2/>, <c3/> ja <c4/> kuten minkä tahansa muun signaalin, joten tallenteesta voi hakea AFS-I:tä tai AFS-Q:ta (<c5/>) ja synteettisen kohtauksen voi tehdä ohjelmistovastaanotintestejä varten. Synteettinen kohtaus on, kuten jokaisella muullakin signaalilla, tiedosto ohjelmistovastaanotinta varten; mikään täällä ei ohjaa radiolaitteistoa.

seg-6d7a9d17946d = Mitä <b>ei</b> ole toteutettu

seg-95731dbf3333 = <b>Alikehysten { "2" }–{ "4" } nopeuden 1/2 LDPC-koodaus.</b> Sen tarkistusmatriisit ovat liitteessä { "1" }, erillisessä tiedostossa, joka ei ole PDF:ssä eikä ole mukana toimitettuna. Alikehykset { "2" }–{ "4" } kuljetetaan ja tarkistetaan läpinäkymättöminä symbolilohkoina määritellyn pituisina, eikä niiden sisällä olevia CRC-24Q-sanoja tarkisteta. Virran, joka läpäisee komennon <c1/>, ei ole osoitettu sisältävän päteviä koodisanoja.

seg-67bb5d1038c7 = <b>Viestisisältö</b> (MSG-G1, MSG-G2, MSG-G4, ...): asiakirja jättää useita määritelmiä kirjoitettavaksi (TBW).

seg-bff5304c6187 = <b>Koodien osoitus LunaNet-solmua kohden</b> (taulukko F-1 on TBD). PRN-numeroilla { "1" }–{ "12" } on väliaikaiset testiosoitukset (taulukko { "11" }). <c1/> käyttää PRN-numeron <em>n</em> primäärikoodia sekundaarikoodilla S((n-1) mod { "4" }); PRN-numeron { "12" } jälkeen se on tämän toteutuksen kuvio, ei asiakirjan. <c2/> ja <c3/> hyväksyvät minkä tahansa yhdistelmän, ja tertiäärikoodi voi olla minkä tahansa PRN-numeron.

seg-6588307842fe = Linkkibudjetti, signaalin avaruusvirhe, teho- ja koherenssivaatimukset (LSIS-100 ja seuraavat).

seg-e0f2ddce6dff = <c1/> ajaa toteutuksen asiakirjan painettuja taulukoita ja laskuesimerkkejä vastaan (<a1>ennakkorekisteröinnin</a1> kynnykset B1–B10) ja tulostaa kunkin lukumäärän ja tilan kanssa. <c2/> poistuu arvolla { "1" }, ellei jokainen kynnys täyty.

seg-dafa47406a38 = <c1/> lukee kovan päätöksen symbolivirran (teksti merkeistä <c2/> ja <c3/>; välilyönnit ohitetaan) ja tarkistaa synkronointikuvion, SB1:n dekoodauksen, FID:n (vain { "0" } on määritelty), TOI-jatkuvuuden (etenee yhdellä modulo { "100" }) ja kehysvälin ({ "6000" } symbolia). Se poistuu arvolla { "1" } mistä tahansa ongelmasta.

seg-f12425044025 = <c1/> kirjoittaa testivirran: asiakirjan synkronointikuvion, SB1- ja kehyspituudet, joissa alikehykset { "2" }–{ "4" } ovat <b>paikkamerkkejä</b> (LSIS-300:n vuorotteleva täyte, ei LDPC-koodattu, ei viestiä). Se on symboleja tarkistimen tai dekooderin testaamiseen, ei aaltomuoto; Kshana ei kirjoita signaalia.

seg-3b3548bd0b61 = Python: <c1/>, <c2/>, <c3/>. WebAssembly: samat nimet. MCP: <c4/> (<c5/> spec, symbols tai generate). Liitännäinen: <c6/>. Studio ja JetBrains: N/A (<a1>SURFACES.md</a1>).

seg-2133870991ca = Kynnykset ilmoitettu tiedostossa <c1/> ennen generaattorin olemassaoloa; testit tiedostossa <c2/>.

seg-b74d5800a039 = Kynnys

seg-e75915599d5e = AFS-I:n { "24" } ensimmäistä ja viimeistä chippiä, { "210" } PRN-numeroa

seg-f654db18922f = <b>MET</b>, { "420" } kohdasta { "420" }

seg-55d0d7168ceb = painettu G2:n alkutila on tila painetun viiveen jälkeen

seg-41590da4d1ac = <b>NOT MET</b>, { "0" } kohdasta { "210" }: väitteessä suunta oli väärin. Jälkikäteen (B1c, ei ennakkorekisteröity): painettu tila on tila, joka saadaan { "2047" } miinus viive askeleen jälkeen, { "210" } kohdasta { "210" }

seg-b94947c99f9a = Legendre({ "10223" }) vastaa taulukkoa D-1

seg-75c8da01c0f1 = MET

seg-e3402e2420bd = AFS-Q:n primäärin { "24" } ensimmäistä ja viimeistä chippiä, { "210" } PRN-numeroa

seg-678604d6e463 = Legendre({ "1499" }) vastaa taulukkoa E-1 ja tertiäärin { "24" } ensimmäistä ja viimeistä chippiä, { "210" } PRN-numeroa

seg-17b1420f8c0c = <b>NOT MET</b>, { "420" } kohdasta { "421" }: Legendre-jono täsmää ja { "419" } kohdasta { "420" } koodisarakkeesta täsmää. PRN-numerolle { "147" } painetut viimeiset { "24" } chippiä (<c1/>) ovat sama arvo, joka on painettu PRN-numerolle { "151" }, jonka koodin generaattori toistaa; kaksi eri Weil-indeksiä ({ "607" } ja { "612" }) eivät anna samoja viimeisiä { "24" } chippiä, joten PRN-numeron { "147" } merkintä on todennäköisimmin painovirhe asiakirjassa. Sitä ei voi ratkaista ilman erillistä liitteen { "3" } koodien tiedostoa. Kiinnitetty testillä

seg-aea9620e7bf1 = sekundaarikoodit S0–S3 vastaavat taulukkoa { "10" }

seg-2996e986d247 = <b>MET</b> (asiakirjan omat vakiot)

seg-23c9277f62e6 = SB1:n laskuesimerkki kuvasta { "8" }

seg-fb70493dcdcf = <b>MET</b>: 0x045 koodautuu arvoksi 0x229F61DBB84A0 ja dekoodautuu arvoiksi FID { "0" }, TOI { "69" } (yksi esimerkki)

seg-acce07c33dec = CRC-24Q-tarkistusarvo kohteelle <c1/>

seg-71c490aca8d7 = <b>MET</b>: 0xCDE703 (luettelon arvo, eritelmän ulkopuolella)

seg-789b31d53873 = kehysaritmetiikka

seg-5b5da00ad1c8 = lomitus ja sen purku

seg-80f9cd313ec4 = <b>MET</b> (ominaisuus, MODELLED)

seg-92a7addfdb8c = synkronointikuvio

seg-215913f74706 = <b>MET</b> ({ "68" } symbolia; transkriptiotarkistus)

seg-3b51bd143c19 = Kynnykset B1–B4 ovat VALIDATED siteeratun painoksen painettuja taulukoita vastaan, jotka asiakirja merkitsee { "{" }LSIS-TBC{ "}" }. Molempien komponenttien kierto kohtauksesta hankintaan ja seurantaan läpäisee samat kynnykset kuin muut signaalit (<c1/>).

seg-9edb6e5771ca = <s1>Edellinen</s1>Galileo OSNMA -varmennus

seg-d0043d0f578a = <s1>Seuraava</s1>Jammertest erotuomarina

seg-52946c9ff62a = Mitä ei ole toteutettu

seg-339c9eeb510b = kshana lunanet-afs-check
