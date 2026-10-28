# docs--rust: translations (fi)

seg-d4a762001549 = Lisenssi

seg-4dbf41c0ec3b = Funktio

seg-81a87d14efda = Kshana: tunnus, kompassin ristikko, joka merkitsee täsmällisen hetken, sanamerkin kshana vieressä

# text
seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>tarkka hetki</em></b><br/> Avoimen lähdekoodin PNT-kestävyyssimulaattori (paikannus, navigointi ja ajanmääritys).

# text
seg-3b861b2f08b8 = Julkaisu v{ $version }

# text
seg-6a1906d8d4ad = Noin { "95" } %:n rivikattavuus, jatkuvassa integroinnissa kynnyksenä { "85" } %

# text
seg-a9f4f2795fb5 = Lisenssi: AGPL-3.0-only tai kaupallinen lisenssi

# text
seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

# attr:alt
seg-7fcbe854ebc4 = Harjoittele hetkeä, kun GNSS sammuu: Kshanan tehtäväkonsoli, piirretty moottorin todellisesta ajosta, ketjutettu häirinnän, harhautuksen, holdoverin ja eheyden kampanja GPS:n, Galileon, BeiDoun ja GLONASSin { "102" } satelliitin yli

# text
seg-d1153c5e9112 = Harjoittele hetkeä, kun GNSS sammuu

# text
seg-d1a3f78ad8e0 = Kokeile ensin ilman asennusta: <a1>Kshana Studio</a1> ajaa koko moottorin selaimessasi WebAssemblyksi käännettynä eikä lähetä mitään.

# text
seg-12a295fba8a5 = Jokainen varmennusmatriisin ominaisuus on merkitty tilaan <b>validoitu</b> (tarkistettu riippumatonta ulkoista oraakkelia vastaan), <b>mallinnettu</b> tai <b>kumppanin omistama</b>; optisten kellojen luvut ovat avaruustavoitteita maanpäällisellä laitteistolla (strontium-optista kelloa ei ole lennetty). Kypsyys <em>ei</em> ole tasaista eri aloilla: Maan PNT on validoitu oikeaa dataa vastaan; syväavaruuden ja Marsin navigointi on mallinnettua, ja vain sen rakennuspalikat (valon kulkuaika, planeettojen paikat) on validoitu ulkoisia oraakkeleita vastaan; oikean tehtävän syväavaruuden radanmääritys (OD, orbit determination) on tiekartalla.

# text
# c1: kshana kinds
# c2: gnss-ssv
# c3: lunar-infrastructure
# c4: holdover-test
seg-3de57431d3e6 = Moottorissa on { "87" } skenaariolajia; <c1/> listaa ne kenttineen. Uutta versiossa { "0.38.0" }: <c2/> (GNSS-signaalit avaruusaluksille GNSS-ratojen yläpuolella, ympärillä ja ohi) ja <c3/> (kuun kiertorata ja pinta navigointi- ja geodeettisenä infrastruktuurina), molemmat MODELLED, sekä <c4/> (aikavirhetallenne ITU-T-maskeja vastaan).

# text
seg-68ed88ec0b32 = <b>Spektri</b>: miten häirintälähde valtaa GNSS:n L-kaistan, kaista kerrallaan.

# text
seg-f04a0aeeee33 = <b>Kellot ja ajoitus</b>: holdover kynnystä vastaan, ajansiirto ja telealan holdover Kansainvälisen televiestintäliiton standardointisektorin (ITU-T) maskeja vastaan.

# text
seg-7e38ac603ef2 = <b>Satelliittitähdistöt minkä tahansa kappaleen ympärillä</b>: kattavuus, DOP (tarkkuuden heikkenemiskerroin) ja saatavuus Maan, Kuun tai Marsin ympärillä sekä aurinkokunta yhdellä epookilla.

# text
seg-82708b06dcc6 = <b>Matalan Maan kiertoradan navigointi</b>: signaali, ylitys ja yhteys, navigointiviesti sekä yhdistetty paikkaratkaisu vaihe vaiheelta.

# text
seg-e21e9bb02d00 = <b>Kampanjat</b>: ketjutettu tehtävä, pyyhkäisy tai Monte Carlo -joukko yhdessä skenaariossa.

# text
seg-ba5057da54e4 = <b>Raportit, animaatio ja viennit</b>: jokainen luku yksikköineen ja tunnisteineen; ajon animoitu piirros; SP3- (Standard Product { "3" }), CCSDS:n (Consultative Committee for Space Data Systems) rataviestit sekä CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON-, STK- (Systems Tool Kit) ja SigMF-tiedostot (Signal Metadata Format).

# attr:alt
seg-6b43a8c3031e = Yksi avoin moottori keskellä, kshana { $version }, tyypitetyllä lähetyksellä { "75" } lajiin; sen ympärillä komentorivi, Rust-kirjasto, Python, WebAssembly ja Kshana Studio, MCP-palvelin, Docker-image ja JetBrains-liitännäinen; sen alla Kshana Pro, suljettu kerros, joka riippuu avoimesta moottorista eikä koskaan haarauta sitä

# text
# c1: kshana-mcp
seg-ea6f46d62e7b = Sama skenaariotiedosto antaa samat tavut jokaisella pinnalla. MCP on Model Context Protocol: <a1><c1/></a1> antaa tekoälyavustajan (AI) ajaa moottoria.

# text
seg-f51b0a8cd30e = Kuusi arXiv-artikkelia perustuu avoimeen moottoriin, kukin komentoineen: <a1>arXiv:{ "2606.22054" }</a1> (häiriöilmaisimien optimismikuilu), <a2>arXiv:{ "2606.24210" }</a2> (ehdollinen ajoituksen suojaustaso), <a3>arXiv:{ "2607.05415" }</a3> (kuinka vakaa PNT-kestävyyspistemäärä on), <a4>arXiv:{ "2607.02566" }</a4> (Kuun pinta-aseman havaittavuus pitkän kantaman interferometrialla), <a5>arXiv:{ "2607.06212" }</a5> (Kuun etelänapaisen alueen geometria ja pintamajakat) ja <a6>arXiv:{ "2610.23871" }</a6> (kuunläheinen navigointi havaittavuusongelmana: kaaren pituus, Gramin matriisin ehtoluku ja Dopplerin vipuvarsi). Ks. <a7>Tutkimus</a7>.

# text
seg-dad7832bf2d2 = Koko moottori on vapaa AGPL-3.0-lisenssillä. Kshana Pro, suljettu kerros, joka riippuu avoimesta moottorista eikä koskaan haarauta sitä, sekä räätälöidyt tutkimukset ovat saatavilla sopimuksella Ashforde® OÜ:ltä: <a1>contact@ashforde.org</a1>. Hintoja ei ole; ks. <a2>docs/PRO.md</a2>.

# text
seg-d217f23af0c2 = Lue lisää

# text
seg-0e8320f8ea91 = <b>Koko README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

# text
seg-acba56f9ed36 = <b>Kshana Studio</b> (moottori selaimessasi WebAssemblynä) → <a1>https://kshana.dev</a1>

# text
seg-13426521456e = <b>Ominaisuudet</b> → <a1>docs/CAPABILITY.md</a1>

# text
seg-a42cfefa5e6d = <b>Validointi ja alkuperä</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

# text
seg-07b9e03942cb = <b>Varmennusmatriisi</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

# text
seg-9390336ecc01 = <b>Viittaa</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

# text
seg-d059e9fc67e1 = Vapaa ja avoimen lähdekoodin ohjelmisto lisenssillä <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, vain versio { "3" }). <b>Kaupallinen lisenssi</b> on saatavilla yritykseltä <a1>Ashforde® OÜ</a1> (virolainen osakeyhtiö; OÜ = osaühing) suljettua integrointia varten; ks. <a2>LICENSING.md</a2>. Ashforde® OÜ kehittää ja ylläpitää ohjelmistoa ammattimaisesti.

seg-8c83544270b5 = Allekirjoitus

seg-8a438548bf52 = Lähde: <c1/>

seg-9a65e21abcf4 = Kshana toistaa häirinnän, harhautuksen ja kellon holdoverin GNSS-signaalien (Global Navigation Satellite System) pettäessä ja kertoo, kuinka kauan järjestelmä pitää ajan ja paikan budjettinsa sisällä sekä mikä kello tai anturi tuo eniten marginaalia. Tämä on Rust-paketti (crate): moottori kirjastona ja komento <c1/>. Jokainen ajo on toistettavissa bitilleen skenaariosta, siemenluvusta ja moottorin versiosta.

seg-991c428a8063 = Käyttö — kirjasto

seg-6ef0d3fb5be0 = Esimerkki on täydellinen ohjelma: se kantaa oman skenaarionsa, kirjoitettuna TOML-kielellä (Tom's Obvious, Minimal Language), joten se toimii tiedostona <c1/> projektissa, jonka on luonut <c2/>, kun on ajettu <c3/>, eikä levyllä tarvita mitään muuta.

seg-cfb76f7da8da = <c1/> on tulosasiakirja JSON-muodossa (JavaScript Object Notation), <c2/> kaavio SVG-muodossa (Scalable Vector Graphics) ja <c3/> niille tyypeille, jotka julkaisevat taulukon, kyseinen taulukko CSV-muodossa (pilkuin erotetut arvot).

seg-95b7a8022262 = API-viite, generoitu tiedostosta src/api.rs

seg-e271e742cec7 = Jokainen moduulin <c1/> julkinen funktio moottorin versiossa v{ $version }, luettuna lähteestä käännösaikana.

seg-9a8d288b2c57 = json, josta loppuun sijoitettu lohko figure_tiers on poistettu, tavu tavulta sellaisena kuin asiakirja oli ennen kuin lohko oli olemassa; None, kun asiakirjassa ei ole sellaista lohkoa tai lohko ei ole sen viimeinen avain (jota tämä paketti ei koskaan tuota, joten testauskehyksen on käsiteltävä se virheenä sen sijaan, että se poistaisi jotain, mitä se ei voi selittää).

seg-6157f407ab8b = Luettele jokainen sisäänrakennettu skenaariotyyppi metatietoineen.

seg-e9535491e871 = Sisäänrakennetut skenaariotyypit ja niiden metatiedot JSON-taulukkona — muoto, jonka kielisidokset paljastavat ohjelmalliseen introspektioon.

seg-a3e3eeb83c46 = [KIND_MODULES] JSON-objektina, tyyppi → moduulinimien taulukko, taulukon järjestyksessä.

seg-6739ddf8bba8 = [HEADLINE_FIELDS] JSON-muodossa: { "{" }kind: { "{" }"headline": [path, ...]{ "}" }{ "}" }, taulukon järjestyksessä.

seg-f76170c699d9 = Tuota sisäänrakennettu skenaariotyyppiluettelo erillisenä Markdown-viitteenä (docs/SCENARIOS.md): jokainen kutsuttavissa oleva tyyppi yhden rivin kuvauksineen sekä vaadittuine / valinnaisine TOML-kenttineen.

seg-295c8355634f = Tarkista skenaarion TOML paketin oman introspektion avulla ja palauta ongelmaluettelo — jotta kutsujalle voidaan kertoa, mikä on pielessä ENNEN (mahdollisesti pitkää) ajoa, sen sijaan että se törmäisi myöhäiseen ajonaikaiseen virheeseen.

seg-4aab02ecf399 = Vie rata-/tähdistöskenaarion propagoitu tähdistö SP3-c-tekstinä.

seg-d577fc8351a2 = Jos src on rataskenaario, jossa export_sp3 = true, palauta sen SP3-c-teksti; muuten None.

seg-024e29ac4bde = Vie rataskenaarion TLE-keskielementit CCSDS OMM -luettelona — yksi OMM (Orbit Mean-Elements Message) jokaista TLE-määriteltyä satelliittia kohti, KVN-muodossa, kantaen todellisen NORAD-katalogiluvun, COSPAR-tunnuksen ja epookin kustakin TLE:stä.

seg-d5dc817a3a24 = Jos src on rataskenaario, jossa export_omm = true, palauta sen OMM-luettelon teksti; muuten None.

seg-3fe91ee29ac1 = Vie rataskenaarion propagoitu tähdistö CCSDS OEM -tekstinä — inertiaalinen (TEME) tilojen aikasarja, sekä paikka ETTÄ nopeus, avaruusalusten efemeridien vaihtomuodossa, jota lentodynamiikkatyökalut (GMAT/Orekit/STK) lukevat.

seg-f102088f3208 = Jos src on rataskenaario, jossa export_oem = true, palauta sen OEM-teksti; muuten None.

seg-5432a3921600 = Upota todellinen IERS finals2000A -runko skenaarion kenttään eop_finals2000a (CLI-polku --eop <file>) ja palauta yhdistetty TOML.

seg-dc707c3d1769 = Liitä tutkimuksen metatietolohko jo muodostettuun tulos-JSON-asiakirjaan ja palauta asiakirja, johon on lisätty ylätason avain ”meta” heti aloittavan aaltosulkeen perään.

seg-afa952d0c0f5 = Aja skenaario ja palauta tyypitetty tulos jäsennellyllä virheellä — sisääntulopiste, jota sidoskutsujien tulee suosia merkkijonovirheisen [run_toml]-funktion sijaan.

seg-d0a609bfd225 = Jäsennä, välitä ja aja TOML-merkkijonona annettu skenaario.

seg-c62cff9a8dba = [run_toml] ilman tyyppikohtaista figure_tiers-lohkoa, jonka [run_toml_inner] liittää (RM-04): ajolle, jonka asiakirja on upotettu toisen tyypin tulokseen (kampanjan jäsen), jotta ulompi asiakirja säilyttää tavunsa.

seg-5a316ab76a7d = json, johon block on liitetty viimeiseksi avaimeksi, figure_tiers, tavu tavulta sellaisena kuin Documented-kääre olisi sen serialisoinut: kahden välilyönnin sisennys, lohko sisennettynä yhden tason.

seg-ef3b369866c5 = Paketin vaihtoformaatit: CCSDS Tracking Data Message (TDM) -jäsennin ja -kirjoitin (<c1/>); Kshana Interchange Format (KIF) (<c2/>).

seg-36184e41b65d = Käyttö — CLI

seg-c96267c06c3b = Rekisteriasennuksessa ei ole hakemistoa <c1/>, joten CLI kantaa vertailuskenaariot mukanaan; <c2/> luettelee ne ja nimeää ne harvat, jotka se jättää pois, syineen (jokainen lukee vain repositorion mukana toimitettua dataa tai seuraa esiasetusta, jonka julkaisu voi pidättää).

seg-35965c7df95f = Ajo välittää skenaarion kentän <c1/> mukaan ja kirjoittaa <c2/>, <c3/>, <c4/> (tulostettava raporttisivu HTML-muodossa, HyperText Markup Language) ja <c5/> (sama raportti koneluettavana), sekä <c6/> niille tyypeille, jotka julkaisevat taulukon, skenaariotiedoston viereen. <c7/> lisää vaihtotiedostot: CZML (Cesium Language) ja KML (Keyhole Markup Language) maapallonäkymiin, GeoJSON kartoille, STK (Systems Tool Kit) -efemeriditiedostot ja SigMF (Signal Metadata Format) -tallenteet tyypille <c8/>. <c9/> lisää SVG-, HTML- tai kuva kuvalta -animaation.

seg-fc13b487ccc5 = Repositorion kloonista samat komennot ottavat tiedostot suoraan hakemistosta <c1/>, myös usean skenaarion tutkimuksen (<c2/>) ja skenaarion <c3/>, ainoan, joka lukee vain repositorion mukana toimitettua todellista laseretäisyysmittausdataa.

seg-509e49e5df09 = <b>Aluksen GNSS-luottamus</b> (<c1/>, mukaan lukien <c2/>): 0-100 pisteen luku perusteluineen vastaanottimen NMEA:sta, livenä tai lokista; ohjeellinen, ei tyyppihyväksytty navigointilaite.

seg-0489fa168736 = <b>Todistepaketit</b> (<c1/>): allekirjoitettu tekninen tallenne lokijaksosta, todennettavissa offline-tilassa.

seg-aa4a7de921a3 = <b>Luottamustelemetria</b> (<c1/>): luottamusvirta Prometheus-mittareina, SIEM-tapahtumina ja valinnaisesti OpenTelemetry-muodossa.

seg-d2ecb7047abe = <b>Harjoitusvirrat</b> (<c1/>): synteettinen sillan NMEA, jossa on käsikirjoitettua häirintää ja harhautusta sekä ohjaajan loki. Vain tekstiä; ei koskaan aluksen live-navigointijärjestelmiin.

seg-e16769b8fab8 = <b>Häiriökartta</b> (<c1/>): koostetut heikentyneen navigoinnin kartat ja reittialtistus.

seg-1944d0fada06 = <b>Testipenkki (bench) ja compliance-kartoitus</b> (<c1/>, <c2/>): skenaarion ajoneuvon liike ja tapahtumat laboratorion GNSS-simulaattorille sekä tulosasiakirjoista täytetty julkisen kehyksen vastaavuustaulukko.

seg-68274ce67506 = <b>GNSS IQ -laboratorio</b> (<c1/>): kohtaukset, hankinta, seuranta, monitorit ja kampanjat tallennetulla ja synteettisellä IQ-datalla.

seg-6dc7d52fef11 = <s1>Edellinen</s1>npm ja WebAssembly

seg-8ff56af64ec2 = <s1>Seuraava</s1>MCP-palvelin
