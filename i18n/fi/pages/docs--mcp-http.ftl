# docs--mcp-http: translations (fi)

seg-c8bab9114d57 = Lähde: <c1/>

seg-4bd138b7d28a = Ajetaan kshana-mcp HTTP:n kautta (itse ylläpidettynä)

seg-7ca89d6e0201 = Kolmansien osapuolten tekoälyasiakkaita nimeävä kappale on jätetty tästä pois; se on tiedostossa <a1>docs/deploy/mcp-http.md</a1> GitHubissa.

seg-2f5b3bdb7d0b = <b>Kshana ei isännöi päätepistettä.</b> Ei ole yhteistä palvelinta <c1/>, johon asiakkaan voisi osoittaa. Se ajetaan omalla koneella, kontissa tai pilviprojektissa, ja pääsynhallinta ja kustannukset ovat ajajan vastuulla. Version { $version } palvelin on se, joka on tässä repositoriossa: sen luvuissa on merkinnät VALIDATED tai MODELLED täsmälleen kuten stdion kautta.

seg-113a79ece785 = Turvalliset oletukset

seg-2bdbe06123c8 = Hallinta

seg-640f28207e8a = Toiminta

seg-9bc8fe53a948 = Sidontaosoite

seg-82001913f285 = Vain loopback (<c1/>, <c2/>). Pelkkä portti (<c3/>) tarkoittaa osoitetta <c4/>.

seg-f2adda2d3e22 = Vaatii valitsimen <c1/> <b>ja</b> bearer-tunnuksen ympäristömuuttujassa <c2/> ({ "16" } merkkiä tai enemmän). Ilman molempia palvelin kieltäytyy käynnistymästä. Kun molemmat on annettu, se tulostaa varoituksen siitä, että se kuuntelee tämän koneen ulkopuolelta tulevia yhteyksiä.

seg-6fbe07565c36 = Todennus

seg-d5cbeb0cd3d6 = <c1/> jokaisessa pyynnössä, kun tunnus on asetettu (se voidaan asettaa myös loopbackille). Vertailu tehdään vakioajassa. Puuttuva tai väärä: <c2/>.

seg-1962f434458b = Tiedostojärjestelmä

seg-1a9e048d348d = Ei yhtään. IQ-tiedostotyökalut (<c1/>) on kytketty pois HTTP-tilassa riippumatta siitä, mitä <c2/> sanoo; kaikki muut työkalut ottavat skenaarionsa suoraan syötteenä ja kieltäytyvät sellaisesta, joka nimeää tiedoston. Mikään työkalun argumentti ei lue eikä kirjoita polkua.

seg-19261cdd2ef0 = Pyynnön koko

seg-c4db8c1454f4 = <c1/>, oletus { "5" } MiB (skenaarion yläraja on { "4" } MiB). Sen ylittävä: <c2/>, olipa pituus ilmoitettu tai runko lohkoitettu.

seg-da9103d627dd = Vasteaika

seg-3f013a632773 = <c1/>, oletus { "120" }. Sen ylittävä: <c2/>. <b>Tämä rajaa, kuinka kauan kutsuja odottaa, ei työtä</b>: jo käynnissä olevaa ajoa ei voi pysäyttää, joten se jatkuu vastauksen <c3/> jälkeen ja valmistuu taustalla.

seg-a588b12596b7 = Samanaikaisuus

seg-aa2214db3bdc = <c1/>, oletus { "8" }. Sen jälkeen pyyntö saa heti vastauksen <c2/> ja otsakkeen <c3/>; mikään ei jää jonoon.

seg-87576ded5272 = Työpooli

seg-7f9c63e3e5e6 = Jokainen työkalukutsu ajetaan estävässä säikeessä poolissa, jonka paikkamäärä on <c1/>, eikä koskaan asynkronisilla työläisillä, joten pitkä ajo ei voi estää palvelinta vastaamasta. Paikka vapautuu vasta, kun itse ajo päättyy, ei silloin, kun kutsuja luovuttaa: hylätyt ajot eivät siksi voi kasaantua yli poolin koon, ja kutsu, joka havaitsee poolin täyden, hylätään varattuna.

seg-4a97b035483c = Työbudjetti

seg-91c788b33b25 = Skenaario, joka pyytää paljon enemmän kuin mukana toimitetut esimerkit, hylätään ennen ajoa: yli { "1000" } Monte Carlo -realisaatiota (<c1/>), yli { "1000" } solmun parametriruudukko, yli { "5000" } jäsenajoa (ruudukon solmut kertaa realisaatiot) tai yli { "2" } miljoonan epookin aikaruudukko. Virhe nimeää kentän, jota on pienennettävä. Sama budjetti on voimassa stdiolla; komentorivillä (<c2/>) sellaista ei ole.

seg-79c6b146637c = CORS

seg-68fa7d9f1321 = Otsaketta <c1/> ei koskaan lähetetä. Pyyntö, jossa on otsake <c2/>, hylätään (<c3/>), ellei sitä ole nimetty valitsimella <c4/>; <c5/> ei kelpaa.

seg-d7f157fdf003 = Host-otsake

seg-d7966e93ef1a = Verrataan loopback-nimiin tai sidontaosoitteeseen sekä jokaiseen annettuun valitsimeen <c1/>. Välityspalvelimen takana tai alustan URL-osoitteessa anna <c2/>. Kaikki muu: <c3/>.

seg-12d5cf72f363 = Istunnot

seg-58dfe5665877 = Ei yhtään. Jokainen POST saa JSON-vastauksen; istuntotaulua ei ole eikä palvelimen lähettämien tapahtumien (server-sent event) virtaa pidetä auki.

seg-adbc92ebc196 = Palvelin <c1/> ei päätä TLS:ää. Kun se on tavoitettavissa yhden koneen ulkopuolelta, aseta sen eteen HTTPS (alustan TLS tai käänteinen välityspalvelin) ja pidä tunnus salassa; bearer-tunnus selväkielisen HTTP:n yli voidaan lukea linjalta.

seg-1b21740b9c63 = Paikallinen

seg-a6194f5a52f8 = Asiakkaan asetukset (URL-asiakas; lisää otsake vain, kun tunnus on asetettu):

seg-a683980168f7 = Docker

seg-81df4f5cd02e = Kontin sisällä palvelimen on kuunneltava osoitteessa <c1/>, joten se tarvitsee valitsimen <c2/> ja tunnuksen. Kun portti julkaistaan muodossa <c3/>, se pysyy omalla koneellasi; poista <c4/> vain, kun tarkoitus on avata se ulkopuolelle, ja päätä silloin TLS sen edessä. Mallit seuraaville: <c5/>, Fly.io ja Cloud Run, ovat kansiossa <a1><c6/></a1>.

seg-8b8bef7174e8 = Mallit (ne otetaan käyttöön itse; Kshana ei aja yhtäkään)

seg-198bea1e0595 = <a1><c1/></a1>: aseta tunnus komennolla <c2/>

seg-c33701cb9ca2 = <a1><c1/></a1>: hae tunnus Secret Managerista

seg-b86ddb72b916 = Jokainen ajaa julkaistun imagen, asettaa valitsimen <c1/> tiedostossa korvattavaan alustan isäntänimeen ja luottaa HTTPS:n osalta alustaan.

seg-ce3a5326cb95 = Aseta alustalla CPU- ja muistiraja

seg-e1fc13672597 = Aikakatkaisu, pooli ja budjetti rajaavat, kuinka paljon työtä päästetään sisään, mutta yksi sisään päästetty kutsu voi silti käyttää ydintä pitkään ja suuri tulos voi käyttää satoja megatavuja. Aseta kontille myös kova raja: mallit pyytävät { "2" } CPU:ta ja { "1" } GiB muistia (<c1/> ja <c2/> Composessa, <c3/> Flyssä, <c4/> Cloud Runissa). Pidä <c5/> enintään CPU-määrän suuruisena.

seg-058781b052c4 = Mitä se ei ole

seg-90edc7ff2a55 = Ei monivuokraajapalvelu. Jokainen, jolla on tunnus, ajaa simulaatioita ylläpitäjän laitteistolla; käyttäjäkohtaisia kiintiöitä ei ole yllä mainittujen rajojen lisäksi.

seg-5b3b9c610f31 = Ohjeellinen, ei tyyppihyväksytty navigointilaite: käyttäjä vastaa edelleen navigoinnista. Simulaattorin tulosteet ovat mallinnettuja tai validoituja lukuja analyysiä varten, kuten kaikkialla muualla tuotteessa Kshana.

seg-c33947d44b06 = <s1>Edellinen</s1>MCP-palvelin: kaikki asennuskanavat

seg-a9d67efe493a = <s1>Seuraava</s1>Käytä tuotetta Kshana agentista
