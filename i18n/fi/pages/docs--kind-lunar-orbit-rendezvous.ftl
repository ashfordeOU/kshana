# docs--kind-lunar-orbit-rendezvous: translations (fi)

seg-34bdcfd66ded = Siinä repositorion haarassa, josta nämä dokumentit tulevat; ei vielä GitHubissa

seg-f942b36a11c4 = Ei vielä GitHubissa

seg-51362910dcb7 = { "2" } mukana toimitettua skenaariota käyttää tätä tyyppiä; muut ovat hakemistossa <a1><c1/></a1>.

seg-1f17ef6a853e = Moottorin v{ $version } skenaariotyyppi, perhe <a1>Kuu ja kuunläheinen avaruus</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva merkintä on moottorin tai varmennusmatriisin antama; tyyppi on MODELLED, ellei matriisi muuta sano (miten merkintä ansaitaan: README:n Evidence-osio).

seg-1c1eeb2dcaa0 = Perhesivu: <a1>Kuu ja kuunläheinen avaruus</a1>

seg-6a26b9ab59fe = Aihesivu: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Tuloksen merkintä (moottorin oma): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Kuutyyppien jakama propagaattori (GRAIL GL0660B aste ja kertaluku { "150" }, Maa ja Aurinko kolmansina kappaleina, suhteellisuus, DE440-Kuun orientaatio) verrattuna julk. Oraakkeli (ExternalDataset): JPL Horizons -avaruusalusefemeridit LRO:lle ja CAPSTONElle, kynnyksiä vasten, jotka on ennalta rekisteröity tiedostossa xval/mission-thread-lunar/PREREGISTRATION.md (muutokset { "1" }–{ "6" }). LRO: MET, suurin 3D-ero { "33" } m ja radiaalinen RMS { "2.4" } m, kun kynnykset ovat { "500" } m ja { "60" } m. CAPSTONE: NOT MET, loppupaikan ero { "136.8" } km, kun kynnys on { "25" } km, ja periapsiksen ero { "28.4" } km, kun kynnys on { "10" } km, syitä ei eristetty. Rivi on mallinnettu, koska CAPSTON

seg-626ab55f0424 = MODELLED (tulos <c1/>)

seg-e482c9896140 = Kuun voimamallin propagointi julkisia rekonstruoituja kuukiertäjien ja kuunläheisiä lentoratoja vasten on MODELLED, ei validoitu: osaväite tarkistetaan ulkoisesti, mutta koko ominaisuus koostuu mallinnetuista osista, joten ominaisuus pysyy mallinnettuna. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Aihesivu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Lähde: <c1/>

seg-8beb22a0eb0b = <c1/> (skenaariolaji)

seg-2deefd8c547b = MODELLED suhteellinen navigointi Orion–laskeutuja-tyyppiselle telakoinnille matalalla Kuun kiertoradalla tai elliptisellä napakiertoradalla (Artemis-luokka). Takaa-ajaja ja kohde lentävät samaa rataa paketin Kuun voimamallin mukaan; yhteinen 21-parametrinen eräpohjainen Gauss–Newton-estimaatti kaaren yli (kaksi ajoneuvon tilaa ja pysyvät signaalitien harhat) yhdistää ajoneuvokohtaisen absoluuttisen paikkakorjauksen ILLUSTRATIVE LCNS-luokan releiden joukosta (Kuun taakse jäävät releet pudotetaan, neljä tarvitaan, yhteismoodin signaalitien virhe kumoutuu ajoneuvojen välillä) ja ristikkäislinkin etäisyysmittauksen, jonka etäisyysmittauksen tarkkuus tulee LunaNet AFS -pilotin koodiseurannan rajasta. Raportoi muodollisen ja Monte Carlo -suhteellisen paikka- ja nopeusvirheen kohteen LVLH-akseleissa, korjausten saatavuuden, keskimääräisen normalisoidun estimointivirheen neliön suhteessa odotusarvoonsa, kaikki kokeet, joiden iteraatio ei suppennut, gravitaatioharmonisten sivuuttamisesta aiheutuvan ajautuman sekä eteenpäin siirretyn täyden 6x6-kovarianssin. Suljetun muodon Hill/Clohessy–Wiltshire-tarkistus koskee ympyräratatapausta. MODELLED: havainnollistava releiden joukko, virhebudjetti ja priorit; totuus ja estimaattori käyttävät samaa voimamallia, joten NEES tarkistaa itsejohdonmukaisuutta eikä mallivirhettä. Ei minkään viraston suosittelema; ohjeellinen ohjelmisto, ei virallisesti hyväksytty navigointilaite.

seg-a6d29fc5f19b = Yksi tiedoston <c1/> ajo tiivistyy seuraavasti: lunar-orbit-rendezvous | llo 100x100 km | etäisyys { "2000" } m | korjaukset { "74" } % | suht. paikka 1-sigma R/A/C 0.03/0.06/0.04 m | keskim. NEES { "6.51" } ({ "6" } odotettu) | suppeni arvolla { "2000" } s (MODELLED)

seg-b7c86affeac1 = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Ohjeellinen ohjelmisto, ei virallisesti hyväksytty navigoi

seg-4466fb6f4043 = eräpohjainen Gauss–Newton kaaren yli

seg-d97b2505ac72 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/lunar-orbit-rendezvous.toml, laji lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Laji ja vaihe <c1/>: yhteinen kahden ajoneuvon eräpohjainen Gauss–Newton-estimaatti kaaren yli (kaksikymmentäyksi parametria: molemmat tilat ja pysyvät signaalitien paikkaharhat, yhteiset ja riippumattomat), kasvatettu neljänneksen, puolen Tests: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Laji ja vaihe <c1/>: yhteinen kahden ajoneuvon eräpohjainen Gauss–Newton-estimaatti kaaren yli (kaksikymmentäyksi parametria: molemmat tilat ja pysyvät signaalitien. Oraakkeli (InternalConsistency): Itsejohdonmukaisuus ennakkorekisteröinnin alaisena (xval/mission-thread-lunar/PREREGISTRATION.md, tulokset ja estimaattorin historia tiedostossa RESULTS.md): suhteellisen tilan keskimääräinen NEES on { "5.85" }–{ "5.93" } kaistaa { "5.2" }–{ "6.8" } vasten neljässä kokoonpanossa, MET neljännellä estimaattorirakenteella sen jälkeen, kun kolme peräkkäissuodinrakennetta oli jäänyt vajaaksi; totuus ja estimaattori käyttävät samaa voimamallia, joten tämä ei kerro mallivirheestä mitään. The p

seg-b2f273ea732d = MODELLED suhteellinen navigointi Orion–laskeutuja-tyyppiselle telakoinnille matalalla Kuun kiertoradalla tai elliptisellä napakiertoradalla (Artemis-luokka). (lajiluettelo (<c1/>))

seg-9d4f99557cc5 = MODELLED: havainnollistava releiden joukko, virhebudjetti ja priorit; totuus ja estimaattori käyttävät samaa voimamallia, joten NEES tarkistaa itsejohdonmukaisuutta eikä mallivirhettä. (lajiluettelo (<c1/>))

seg-158e44d47c0b = REHELLISYYS: MODELLED. Releiden joukko, signaalitien virhe, yhteismoodin osuus ja priorit ovat ILLUSTRATIVE syötteitä, eivät mittauksia; totuus ja estimaattori käyttävät samaa voimamallia (sisäänrakennettu keskustermi, J2 ja C22). Ennakkorekisteröity johdonmukaisuustarkistus B1 (keskimääräinen NEES välillä [{ "5.2" }, { "6.8" }]) täyttyy kaikissa neljässä kokoonpanossa eräpohjaisella rakenteella: ks. xval/mission-thread-lunar/RESULTS.md. Ei yhtään sopivuutta minkään todellisen kanssa (skenaariotiedoston kommentti, rivit { "10" }–{ "14" })

seg-2a88a9650804 = Suhteellinen navigointi telakointiin Kuun kiertoradalla (<c1/>) on MODELLED, ei validoitu: tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vastaan, mikä paljastaa kirjoitus- ja kerroinvirheet mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Edellinen</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Seuraava</s1>lunar-station-coverage
