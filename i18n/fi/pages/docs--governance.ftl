# docs--governance: translations (fi)

seg-26440a254ba8 = Lähde: <c1/>

seg-5f8e9a4a15be = Kshanan hallinto

seg-b20b74b77755 = Tämä asiakirja kuvaa, miten Kshanaa hallitaan: kuka tekee päätökset, miten, ja mitä projekti ottaa vastaan ja mitä ei. Se on tarkoituksella <b>kevyt</b> — projektin nykyiseen kokoon sopiva — ja kertoo rehellisesti nykyisestä yhden ylläpitäjän tilanteesta ja tiestä laajempaan hallintoon yhteisön kasvaessa.

seg-1e0c276811e2 = Tehtävä ja laajuus

seg-5dcc38148cf4 = Kshana on <b>puolueeton, toistettava ja rehellisesti validoitu vertailukohta hybridille kvantti- ja klassiselle PNT:n suorituskyvylle ja kestävyydelle</b>. Tehtävä asettaa kynnyksen jokaiselle päätökselle: oikeellisuus, lähdeviitteet ja toistettavuus ovat tärkeämpiä kuin laajuus. Rehellinen laajuus on kuvattu tiedostossa <a1><c1/></a1> ja validoinnin tila tiedostossa <a2><c2/></a2>; ehdotuksia punnitaan tätä laajuutta vasten, ei ominaisuuksien lukumäärää vasten.

seg-d331a1cfc60b = Roolit

seg-88bb2a831125 = <b>Ylläpitäjä.</b> Kshanaa ylläpitää tällä hetkellä sen perustaja Ashforde OÜ (yhteystieto: <c1/>). Ylläpitäjä tekee lopullisen päätöksen laajuudesta, suunnittelusta, julkaisuista ja siitä, mitä yhdistetään. Kyseessä on hyväntahtoisen ylläpitäjän malli, joka sanotaan suoraan sen sijaan, että se naamioitaisiin olemattomaksi komiteaksi.

seg-8e1da46f9b0b = <b>Osallistujat.</b> Kuka tahansa, joka avaa issuen tai pull requestin. Osuuksilta edellytetään tiedostossa <a1><c1/></a1> asetettu kynnys — alkuperä jokaiselle numeeriselle parametrille, validointi julkaistua relaatiota vasten ja rehellisyys kypsyydestä.

seg-d212e17ac218 = <b>Tulevat commit-oikeuden haltijat.</b> Kun jatkuva, laadukas osallistuminen sitä oikeuttaa, luotetuille osallistujille myönnetään commit-oikeudet, ja tämä asiakirja päivitetään usean ylläpitäjän malliin (päätökset laiskalla konsensuksella, erimielisyydet ratkaisee ylläpitäjäryhmä). Siihen asti tie on: osallistu, ansaitse maine ja tule kutsutuksi.

seg-91e3f1919016 = Miten päätökset tehdään

seg-0d45899c92f4 = <b>Keskustelu avoimesti.</b> Merkittävät muutokset alkavat GitHub-issuena, jotta perustelut, vaihtoehdot ja kompromissit tulevat kirjatuiksi.

seg-88916dd2357b = <b>Laiska konsensus.</b> Ehdotus, johon ei kohdistu kestävää vastustusta kohtuullisen ajan jälkeen ja joka täyttää alla olevan teknisen kynnyksen, etenee.

seg-788566515dad = <b>Ylläpitäjä ratkaisee erimielisyyden.</b> Kun konsensukseen ei päästä, ylläpitäjä päättää ja kirjaa perusteen. Erimielisyys ratkaistaan tehtävän ja teknisen kynnyksen perusteella, ei virka-iän tai äänekkyyden perusteella.

seg-e45e1b565e62 = Tekninen kynnys (ei neuvoteltavissa)

seg-2c397872e2f5 = Nämä ovat ehdottomia invariantteja, joita CI ja katselmointi valvovat ja joita mikään päätös ei ohita:

seg-70cb5a174c2f = <c1/> on pystyttävä toistamaan ajo bitilleen. Muutos, joka tekee tästä epädeterministisen, on virhe, ei ominaisuus.

seg-b8733ea97546 = <b>Alkuperä.</b> Ei nimettömiä numeerisia vakioita — jokaisella parametrilla on lähde.

seg-55a09b775418 = <b>Validoinnin rehellisyys.</b> Jokaisella ominaisuudella on merkintä <c1/> (ulkoista oraakkelia vasten) tai <c2/> / <c3/>. Mitään ei väitetä todisteita enempää. Katso koneellisesti tarkistettu matriisi tiedostossa <c4/>.

seg-dd339a396698 = <b>Hygienia.</b> Automaattisten työkalujen tekijämainintoja ei esiinny missään commiteissa, sisällössä eikä historiassa (valvoo <c1/>).

seg-45733fea1709 = Muutos, joka ei voi täyttää kynnystä, hylätään, vaikka se olisi kuinka hyödyllinen.

seg-3eb0831d99a2 = Avoimen ja suljetun raja

seg-ca7730a3d518 = Kshana on <b>open-core</b>. Tämä repositorio on ja pysyy täydellisenä avoimena AGPL-3.0-moottorina — puolueettomana vertailukohtana, jonka Ashforde OÜ lisensoi lisäksi kaupallisesti (katso <a1><c1/></a1>). Projekti <b>ei</b> ota avoimeen repositorioon:

seg-8c2a89a3a4e2 = <b>Vientivalvonnan alaista tai kaksikäyttöistä syvyyttä</b> — todellisia uhkakirjastoja, vastustajan aaltomuotoja tai häirinnän- ja harhautuksenestosuorituskyvyn parametreja. Julkinen repositorio pysyy yleisissä, julkaistuissa malleissa ja menetelmissä (katso <c1/> → Export control). Jos olet epävarma, kysy <em>ennen</em> osallistumista.

seg-6df31d37cfe4 = Asiakkaan tai kumppanin luottamuksellista dataa tai kalibrointia.

seg-b3b4a5384199 = <b>Copyleft-lisensoituja (GPL/AGPL/LGPL/MPL) <em>riippuvuuksia</em></b> — ei siksi, että ne olisivat ristiriidassa moottorin oman AGPL-lisenssin kanssa (eivät ole), vaan koska niitä ei voi lisensoida uudelleen <b>kaupalliseen</b> versioon: kaupallisen lisenssin voi myydä vain koodille, jonka omistamme tai joka on salliva. Copyleft-riippuvuus saastuttaisi kaupallisen version ja rikkoisi kaksoislisensoinnin. Riippuvuudet pysyvät siksi sallivina (Apache/MIT/BSD/ISC), ja tätä valvoo <a1><c1/></a1>.

seg-ce264f3e43fe = Päinvastoin, projekti <b>ei</b> tyhjennä avointa ydintä siirtääkseen arvoa suljettuun: validoitu moottori, julkiset validointiankkurit, rehellisyyskirjanpito, vaihto- ja standardimuoto sekä jakelukanavat pysyvät avoimina. Avoimen ytimen näivettäminen on open-core-mallin ainoa kohtalokas virhe, eikä se tule kysymykseen.

seg-947b3e9b1b2d = Julkaisut

seg-73e2bca0310d = <b>Semanttinen versiointi.</b> Ennen versiota 1.0 skenaario- ja tulosskeema voi muuttua; rikkovat muutokset mainitaan erikseen, ja vaihtoskeeman versio (<c1/>) on ainoa totuuden lähde artefaktien yhteensopivuudelle.

seg-71cace8b6144 = <b>Julkaisuoikeus.</b> Julkaiseminen (esim. <c1/>) on manuaalinen ylläpitäjän vaihe, joka vaatii rekisterin tunnuksen. CI ja tagilla käynnistyvä Release-työnkulku <b>eivät koskaan</b> julkaise ulkoisiin rekistereihin automaattisesti — ne vain ajavat kaikki tarkistukset uudelleen ja liittävät mukaan koontiartefaktin. Katso <c2/> → Commits and versioning.

seg-59c37ffa54f0 = Käytösohje ja tietoturva

seg-2dc8c12568bc = Käytöstä säädetään tiedostossa <a1><c1/></a1>.

seg-8574b73edbbc = Tietoturvaongelmissa noudatetaan tiedostossa <a1><c1/></a1> kuvattua yksityistä ilmoitusmenettelyä — älä avaa julkista issuea haavoittuvuudesta.

seg-d86d4e609713 = Tavaramerkki

seg-cb1314b67b2f = Kshana-nimi ja -logo ovat Ashforde OÜ:n tavaramerkkejä. Lisenssi (AGPL-3.0 tai kaupallinen lisenssi) kattaa <b>koodin</b>, ei tavaramerkkejä: forkki saa käyttää koodia lisenssin ehdoin, mutta ei Kshana-nimeä eikä virallista jakeluidentiteettiä. Tämä pitää Ashforden siteerattuna totuuden lähteenä ja on osa sitä, miten avoin ydin säilyy puolueettomana vertailukohtana.

seg-a678f6ed1af8 = Tämän asiakirjan muuttaminen

seg-db90122245fa = Hallinnon muutokset ehdotetaan itsekin pull requestina, ja niistä päätetään yllä kuvatulla menettelyllä. Projektin koon muuttuessa tähän asiakirjaan on odotettavissa usean ylläpitäjän päätösmalli; tekninen kynnys ei sen myötä madallu.

seg-0a0712cca2e7 = Kevyt tarkoituksella. Rehellinen tästä päivästä, ja huomista varten on kirjattu suunta.

seg-4bfa7cf23a41 = <s1>Edellinen</s1>Osallistuminen

seg-f67113e34738 = <s1>Seuraava</s1>Käytösohje
