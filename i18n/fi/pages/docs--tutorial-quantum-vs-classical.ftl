# docs--tutorial-quantum-vs-classical: translations (fi)

seg-501d3a72ea43 = Eheys

seg-8980b5ae869b = Luku

seg-e5f926d1055b = Sudenkuopat ja yksiköt

seg-cb457294fc53 = Mihin seuraavaksi

seg-a3686dd6817d = Lähde: <c1/>

seg-0c2365600795 = Opetusohjelma { "3" } — Kvantti vs. klassinen GNSS-kestävyys (päätösosa)

seg-cc4017642043 = <c1/> + <c2/> · <b>Skenaariot:</b> <c3/>, <c4/> (opetuskopiot: <a1><c5/></a1>, <a2><c6/></a2>) · <b>Vaikeustaso:</b> keskitaso · <b>~{ "35" } min</b>

seg-5de2e6656527 = Päätösosa. Ajat harhautuksen ilmaisimen skenaarion sekä täyden fuusioidun PNT-paketin (paikannus, navigointi ja ajanmääritys) ja opit lukemaan <b>tietoturvaa</b>, <b>eheyttä</b> ja <b>inertiapaikannusta (dead-reckoning)</b> yhdessä — koko teesi: kvantti-inertia ja optinen ajoitus tuovat kestävyyttä, jonka GNSS:n (maailmanlaajuinen satelliittinavigointijärjestelmä) estäminen muuten veisi.

seg-ffa5242638c2 = Osa A — Tietoturva: aika-harhautuksen kiinniotto

seg-23c18da1415f = Hyökkääjä syöttää hitaasti kasvavan väärän GNSS-ajan ({ "0.1" } ns/s, alkaen hetkestä t = { "60" } s). Vastaanotin vertaa väitettyä aikaa oman kellonsa ajautumisennusteeseen ja liputtaa harhautuksen, kun poikkeama ylittää havaitsemisrajan. Ilmaisin on kaksipuolinen <b>χ²₁ / Neyman–Pearson-energiatesti</b> väärän hälytyksen todennäköisyydellä P_fa = { "0.01" }; tietoturvan laatumittari on <b><c1/></b> (yksi miinus havaitsematta jäämisen todennäköisyys) määrittelyn mukaisella ({ "20" } ns) harhautuksen suuruudella.

seg-46aa0e01b330 = <b>Kvantti: <c1/>, havaittu ajanhetkellä { "70" } s.</b> Optisen kellon havaitsemiskynnys on murto-osa nanosekunnista, joten se liputtaa harhautuksen lähes heti — selvästi alle { "20" } ns määrittelyn.

seg-022573b3dcc4 = <b>Klassinen: <c1/>, havaittu ajanhetkellä { "430" } s.</b> Sirutason atomikellon (CSAC) oma ajautumiskohina ikkunan aikana on verrattavissa arvoon { "20" } ns, joten se usein ei erota harhautusta omasta ajautumisestaan — se ei havaitse { "44" } % tapauksista.

seg-27b2b715efcb = Kehäpäättelystä vapaa oraakkeli: analyyttinen vs. Monte Carlo P_md

seg-c85651eebd32 = Ilmaisimen havaitsematta jäämisen todennäköisyys lasketaan <b>kahdella toisistaan riippumattomalla tavalla</b>, joiden on oltava samaa mieltä: <b>suljetun muodon χ²₁-häntä</b> (Neyman–Pearson-tulos) ja <b>Monte Carlo</b> (MC) -estimaatti. CSAC:lle analyyttinen P_md on <c1/> ja MC P_md on <c2/> — ne eroavat vain { "0.002" }, selvästi otantavirheen (<c3/>) rajoissa. Optiselle kellolle molemmat ovat { "0.000" }. Se, että kaksi erillistä laskentaa <em>samasta</em> todennäköisyydestä täsmää, on kehäpäättelystä vapaa ristiintarkistus (Kay, <em>Fundamentals of Statistical Signal Processing: Detection Theory</em>; tavanomainen NP / χ²-havaitseminen). Testi <c4/> varmistaa ehdon <c5/> molemmille kelloille ja ehdon <c6/>.

seg-5cf0d909bac7 = Osa B — Hybridi-PNT: täysi fuusioitu paketti

seg-498a57aae11d = Nyt päätösskenaario fuusioi optisen kellon ja kylmäatomi-inertiamittausyksikön (IMU) (kvanttipaketti) sekä CSAC:n ja navigointiluokan IMU:n (klassinen paketti) saman { "6600" } s ({ "1.83" } h) GNSS-katkon läpi, kun ajoitusmäärittely on { "20" } ns ja sijaintimäärittely { "100" } m. Molemmat paketit ankkuroivat kellonsa uudelleen { "60" } s välein saman optisen satelliittien välisen ajansiirtolinkin kautta, joka on mallinnettu { "1" } ps uudelleensynkronointikohtaisella jitterillä (<c1/> skenaariossa; <c2/> rakentaa kummallekin paketille yhden linkin <c3/>).

seg-61934559c7a0 = Lue jako <c1/> — ajoituksen holdover vs. sijainnin holdover:

seg-dee5b1a35bdd = <b>Kvantti: PNT-holdover { "6600" } s</b> — pitää sekä ajoituksen (t { "6600" } s) että sijainnin (p { "6600" } s) koko katkon ajan.

seg-6441dfa026dc = <b>Klassinen: PNT-holdover { "350" } s</b> — <em>ajoitus</em> pitää koko { "6600" } s (t { "6600" } s), koska optisen ajansiirron uudelleensynkronointi pitää lukittuna jopa <em>klassisen kellon</em>. Paketti on <b>sijainnin rajoittama kohdassa p { "350" } s</b>: navigointiluokan IMU on heikko lenkki. Tämä on fuusioteesi — eristä klassisen paketin vika sen inertia-anturiin.

seg-12e9b7192733 = <b>Kvanttipaketin luku <c1/> on todellinen eikä ole bugi.</b> Se on suodattimen itsejohdonmukaisuus kohinaisessa uudelleensynkronoinnissa — <b>ei</b> ilmailun eheysluku (vaaka- tai pystysuuntainen suojaustaso, HPL/VPL). Älä tulkitse sanaa ”eheys” tässä liikaa; katso <a1><c2/></a1>.

seg-587efcdcbc13 = Kehäpäättelystä vapaa oraakkeli: sijainnin holdover { "350" } s

seg-a70ad8fc122f = Luku { "350" } s on inertiapaikannuksen fysiikkaa, ei sovitettu luku. Vakio kiihtyvyysmittarin harha <c1/> kasvattaa sijaintivirhettä kaavalla <b>½·b·T²</b>. { "100" } m:n määrittelyn ylitys:

seg-778e817e3e9b = Moottori ilmoittaa { "350" } s, viimeisen { "10" } s ruudukkopisteen ennen ylitystä ja { "2" } % alle pelkän harhan antaman { "357" } s: skenaarion kiihtyvyysmittareissa on myös nopeuden satunnaiskävelykohinaa (<c1/>), joka lisätään harhan ajautumaan, joten mallinnettu virhe saavuttaa { "100" } m hieman aiemmin.

seg-e105a8ab605b = Auktoritatiivinen laki: Groves, <em>Principles of GNSS, Inertial, and Multisensor Integrated Navigation</em> (2nd ed.), inertiapaikannuksen virheen kasvu. Nämä kaksi ½bT²-arvoa selittävät moottorin { "350" } s / { "6600" } s -jaon: suljetun muodon fysiikkatarkistus, joka on suodattimen ulkopuolinen.

seg-c2515e55dffa = Inertia-heikon lenkin näet suoraan inertiapaikannusskenaariosta (<a1><c1/></a1>, tyyppi <c2/>): <c3/>: navigointiluokan anturi hajaantuu kymmeniin kilometreihin.

seg-6c688f2e7136 = Kuinka kolme lukua luetaan yhdessä

seg-4f1a49d61cee = Mitä se tarkoittaa tässä

seg-2e91989b1a89 = Mitä se <b>ei</b> tarkoita

seg-b403ce86b14d = analyyttinen harhautuksen <em>havaittavuuden</em> raja (<c1/>) määritetylle hyökkäykselle; tyypin <c2/> yhteenveto tulostaa <c3/>, koska skenaariossa ei ole sellaista

seg-e04c25dd278d = ei usean satelliitin RAIM-ilmaisin (vastaanottimen autonominen eheyden valvonta)

seg-7e678dd4409e = suodattimen itsejohdonmukaisuus (näytteet k-σ-rajan sisällä)

seg-1643e7e71209 = ei ilmailun HPL/VPL/RAIM-eheys

seg-4095f7ab4b14 = määrittelyn mukainen aika GNSS-menetyksen jälkeen, jaettuna ajoitukseen ja sijaintiin

seg-5b90536cdfd5 = ei 2-D CEP (todennäköinen ympyrävirhe) tai 2DRMS (kaksinkertainen neliökeskiarvoetäisyys) -tarkkuus

seg-4b11ef3b6dba = Todellinen vastaanottimen autonominen eheys — oikeat HPL/VPL hälytysrajoilla ja Stanford-diagrammi — sijaitsee paketissa <c1/> (<a1><c2/></a1>); se on tason 3 lukuharjoitus.

seg-28cddec341ed = Mitä testit lukitsevat

seg-a27c3195acf3 = <c1/> — analyyttinen ja MC P_md eroavat alle { "0.05" } molemmilla kelloilla; <c2/>.

seg-78a5a0066e09 = Hybridiyhteenveto ({ "6600" } s / { "350" } s) ja inertiajako lukitaan opetusskenaarioiden (<a1><c1/></a1>, <a2><c2/></a2>) kautta testillä <c3/>, joka vertaa kunkin moottoriyhteenvedon tiedostoon kirjattuun riviin <c4/>. Yllä oleva ½bT²-oraakkeli on fysiikkatarkistus näille luvuille.

seg-a4371822e379 = <b>Ajoituksen laatumittari on nanosekunteina; sijainnin laatumittari on metreinä ja 1-DOF</b> (yksi vapausaste: yksiakselinen, ei CEP/2DRMS).

seg-1331ea80a427 = <c1/> on itsejohdonmukaisuutta, ei ilmailun eheyttä.

seg-87c49084032c = Klassisen paketin <em>ajoitus</em> säilyy vain optisen ajansiirron uudelleensynkronoinnin ansiosta; lue jako <c1/>, älä vain otsikkoa PNT-holdover.

seg-1c93115bf118 = Aja rehellisen epäonnistumisen tapaus: <c1/> (tyyppi <c2/>) raportoi etelänavan ARAIM-läpikäynnin (kehittynyt RAIM), jossa suojaustasot <em>ylittävät</em> hälytysrajan (HPL { "263" }–{ "452" } m > { "50" } m, saatavilla oli { "0" } epookkia yhteensä { "24" } epookista), joten järjestelmä raportoidaan <b>ei saatavilla olevaksi</b>: ominaisuus, ei bugi.

seg-ac70d3131064 = Vie tarina matalalle Maan kiertoradalle (LEO): <c1/> (tyyppi <c2/>) ketjuttaa GNSS-häirintävaiheen, LEO-paikannuskerroksen, joka kantaa käyttäjää sen läpi, ja eheystarkistuksen yhdelle aikajanalle. Katso muut kestävyys- ja vertikaaliskenaariot sivulta <a1>uudemmat ominaisuudet</a1>.

seg-063422d3c70b = Puolusta tulosta: tee <a1>tason 3 harjoitus</a1> — Monte Carlo -välit, toistettavuus ja suojaustason lukeminen.

seg-4f7275a21f44 = <s1>Edellinen</s1>{ "2" } · Kellon holdover

seg-8b0c90f82aab = <s1>Seuraava</s1>Työstetty esimerkki: usean työkalun putki
