# docs--schema: translations (fi)

seg-2247a2344710 = Merkitys

seg-f42465f7d066 = ns

seg-f63dd3d7aad4 = Lähde

seg-6940543aa3c0 = merkkijono

seg-f5e7215e6835 = objekti

seg-9da5d92757bd = objekti, valinnainen

seg-c353e7bec219 = Avain

seg-a129b9e613d0 = Tyyppi

seg-e28387d70be0 = Lähde: <c1/>

seg-49d2afecf5f1 = Tulosskeema — Kshana-tiedoston <c1/> lukeminen

seg-c128455c353c = Jokainen ajo kirjoittaa skenaarion viereen versioidun, itsekuvaavan JSON-artefaktin (JavaScript Object Notation). Tämä sivu on käsin kirjoitettu lukijan opas vaihtokuoreen ja <b>kellon ja radan</b> tulosmuotoihin: kunkin kentän <b>yksikkö</b>, missä se lasketaan lähdekoodissa ja miten se luetaan. Kanoninen tyyppi on <c1/> tiedostossa <a1><c2/></a1>; laatumittarit ovat <c3/> tiedostossa <a2><c4/></a2>.

seg-092ea1e33a05 = Se <b>ei</b> ole täydellinen kenttäviite. Moottori välittää paljon useampaan tyyppiin kuin nämä kaksi, ja jokainen tuottaa oman tyyppipakettinsa. Täydellinen viite — yksikkö, alkuperäluokka ja määritelmä jokaiselle sisäänrakennetun tyypin numeeriselle kentälle — on generoitu, ei käsin kirjoitettu: katso alla <a1>Yksiköt ja alkuperä kenttäkohtaisesti kaikille tyypeille</a1>.

seg-e4c4b66a2f46 = Vaihtokuori (KIF, Kshana Interchange Format) — artefaktin tunnistaminen ja version tarkistus

seg-9b83bb817814 = Kshana-artefaktit voidaan kääriä neutraaliin, itsekuvaavaan <b>vaihtokuoreen</b>, jotta kolmannen osapuolen työkalu voi tunnistaa tiedoston ja päättää, voiko se lukea sen <em>ennen</em> kuin se sitoutuu hyötykuormaskeemaan. Kanoninen tyyppi on <c1/> tiedostossa <a1><c2/></a1>.

seg-e4fd08930644 = Aina <c1/> (<c2/>) — miten vieras työkalu tunnistaa Kshana-artefaktin.

seg-abd853f2ce49 = Skeemaversio <c1/> (<c2/>, koko paketin (crate) ainoa totuuden lähde).

seg-ee9f238072f1 = Artefaktin tyyppi, esim. <c1/>, <c2/>, <c3/> — antaa kuluttajan reitittää jäsentämättä runkoa.

seg-29ad4bedd64f = Hyötykuorman tuottaneen paketin (crate) versio (<c1/>).

seg-52f3e962c049 = Kääritty artefakti kanonisena JSON-muotona (<c1/>, <c2/>, …).

seg-6fe0d7cd4165 = <b>Yhteensopivuussopimus.</b> Versiot ovat muotoa <c1/>. Uudet kentät lisätään määreellä <c2/> (<em>additiivinen kuri</em>), joten lukija voi jäsentää minkä tahansa artefaktin, jolla on <b>sama pääversio ja yhtä vanha tai vanhempi alaversio</b> (<c3/>). Tiukasti <b>uudempi alaversio</b> (<c4/>) voi sisältää kenttiä, joita tämä lukija ei voi noudattaa, ja <b>eri pääversio</b> (<c5/>) on rakenteellinen katkos — molemmat hylkää <c6/>, joka tarkistaa muototunnisteen ja version rajalla sen sijaan, että jäsentäisi vierasta syötettä hiljaa väärin.

seg-f7ae91002e56 = <b>Determinismi.</b> Kuori ei sisällä <b>aikaleimaa</b> — Kshana-ohjelmiston toistettavuuslupaus (<c1/> toistaa ajon) vaatii sen. Alkuperä on kentässä <c2/> ja hyötykuorman omassa kentässä <c3/>.

seg-bb0b742d2df8 = Tyypitetty takaisinluku (<c1/>) toimii mille tahansa hyötykuormalle, joka toteuttaa <c2/> (esim. <c3/>). Tulosartefaktit ovat suunnitellusti vain serialisoitavia, ja ne luetaan raakana JSON-arvona <c4/>.

seg-87be7aa00b17 = Ylätaso (kello- ja ratatyyppipaketit)

seg-cc22d9206eb4 = Tyyppi / yksikkö

seg-3a821855c582 = Tulosskeeman versio (riippumaton moottorin versiosta).

seg-cc6dded799f9 = Tiedoston tuottaneen paketin (crate) versio (<c1/>).

seg-5a69a99b9a87 = heksamerkkijono

seg-441eb1f43399 = SHA-256 (SHA: Secure Hash Algorithm) kanonisesta skenaario-JSONista — ajo on toistettavissa kohdasta <c1/>.

seg-ba73ba76873e = Kvanttiajon satunnaislukugeneraattorin (RNG) siemenluku (klassinen käyttää arvoa <c1/>).

seg-a688dd98c588 = nanosekuntia

seg-24e0f04033fa = Ajoitusmääritys: virhe, joka on välillä ±<c1/>, on ”määrityksen sisällä”.

seg-f52388753a1a = skenaario

seg-15b4082a6455 = objekti (<c1/>)

seg-7d3b92769bf5 = Kvanttianturin ajo (katso alla).

seg-aa665b955931 = Klassisen anturin ajo vertailua varten.

seg-152ae43896b3 = Asiakirjan kenttäkohtainen yksikkö-/alkuperäkartta, avaimena kentän polku. Katso §Yksiköt ja alkuperä alla.

seg-119bac9b3e6f = Kunkin raportoidun laatumittarin varmennustaso, ja aina asiakirjan viimeinen avain. <c1/> luettelee yhden merkinnän kutakin läsnä olevaa lukua kohti: <c2/> (esim. <c3/>), <c4/> (<c5/> = tarkistettu riippumatonta ulkoista oraakkelia vasten, <c6/> = ensiperiaatteista, sisäisesti testattu), <c7/> (varmennusmatriisin rivi, josta taso luetaan) ja <c8/>. <c9/> on <c10/>, ja mukana on <c11/>, kohteelle <c12/> jokaisessa skenaariossa, jossa ei ole hyökkäystä konfiguroitu: raja pysyy kohdassa <c13/>, mutta se ei vastaa mihinkään kysymykseen, jonka skenaario esittää. <c14/> luettelee kaikki luvut, joita mikään matriisin rivi ei omista (paikkaluvut <c15/> ja <c16/>), sen sijaan että antaisi niille tason. Sen antavat tyypit <c17/> (yksittäinen ajo ja Monte Carlo -joukko), <c18/>, <c19/> ja <c20/>, jotka rakentavat sen ajonsa sisällä, ja ({ "0.36" }, RM-04) jokainen muu tyyppi pääluvuilleen, liitettynä ajon jälkeen tyyppikohtaisesta taulukosta <c21/>; <c22/> poistaa sen takaisin tasottomaksi asiakirjaksi tavu tavulta. Sitä eivät anna <c23/>, jonka tulos on jäädytetty ennakkorekisteröity ennuste (<c24/>): kyseisellä tyypillä ei ole kohtaa <c25/>, ennen kuin uusi päivätty ennuste korvaa sen. Sitä eivät myöskään anna <c26/>, <c27/>, <c28/> ({ "0.37" }; asemakohtaiset taulukot), <c29/> ja <c30/>, joilla ei ole skalaarista pääsuuretta, eikä <c31/>, jonka asiakirja on kompakti JSON (<c32/> antaa kunkin syyn), eikä kampanjan upotetut jäsenasiakirjat. Ei sisällä lukuarvoja.

seg-1448f90f0086 = Ratapaketin geometriayhteenveto: <c1/>, <c2/>, <c3/> (m, mallinnettu satelliittikohtainen etäisyysvirhebudjetti), <c4/> / <c5/> (dimensioton) ja <c6/> / <c7/> (m, PDOP (paikan tarkkuuden heikkenemiskerroin) × <c8/>). <b>Vain ratapaketti.</b>

seg-ae4f8eed06ac = taulukko <c1/> (km), valinnainen

seg-d13d827f54b0 = Käyttäjäavaruusaluksen propagoitu Maan keskipisteen inertiaalinen rata, yksi merkintä kutakin otettua ajanhetkeä kohti. <b>Vain ratapaketti</b>; muuten jätetty pois. Vain tulosteena — ei sisälly tiivisteeseen.

seg-8f511d5de657 = objekti (<c1/>), valinnainen

seg-ea152e097d6f = Additiivinen raportin metatieto (tutkimuksen otsikko, luontileima, tekijä, vastuuvapauslauseke). Jätetään pois, kun sitä ei ole, joten metatiedoton ajo on tavu tavulta sama kuin vanha tuloste. Vain tulosteena — ei sisälly tiivisteeseen.

seg-1041873fba1b = <c1/> (kukin kohdista <c2/> / <c3/>)

seg-3fa81140c10d = Anturin tunniste (esim. <c1/>).

seg-80765d202558 = Mallityyppi (esim. <c1/>).

seg-6bf458d964fe = Anturin parametrien lainaus/lähde.

seg-9145f04a557f = Käytetyt mallin raakaparametrit.

seg-697940342a28 = taulukko <c1/>

seg-b5f4216b55a2 = Askelkohtainen aikasarja: <c1/> sekunteja, <c2/> ajoitusvirhe <b>nanosekunteina</b>, <c3/> yksi arvoista <c4/>/<c5/>/<c6/>.

seg-7fba0b91b75e = objekti (<c1/>)

seg-5c4b60012f0e = Pisteytetyt laatumittarit (alla).

seg-1308a29c6a5b = taulukko <c1/>

seg-bbd42065492c = Päällekkäinen Allanin poikkeama: <c1/> keskiarvoistusaika (s), <c2/> dimensioton suhteellisen taajuuden vakaus σ_y(τ), <c3/> kyseisen pisteen takana oleva päällekkäisyyksien lukumäärä, <c4/> MDEV:n (modifioitu Allanin poikkeama) kaltevuudesta tunnistettu potenssilakityyppi (esim. <c5/>), <c6/> kohinatyyppikohtaiset tehokkaat vapausasteet ja <c7/>/<c8/> χ²-pohjainen luottamuskaista ({ "95" }%) suureelle <c9/> kyseisellä τ:lla. Laskettu tiedostossa <c10/>.

seg-1e61fd18257f = Kalman-suodattimen johdonmukaisuusarvio (NIS/NEES (NIS: normalisoitu innovaationeliö; NEES: normalisoitu estimointivirheen neliö) χ²-kaistojaan vasten), laskettu tiedostossa <c1/>; jätetään pois ajoilta, jotka eivät arvioi sitä.

seg-9333864652b0 = <c1/> (objekti <c2/>)

seg-ce9caeaefd87 = Varauma

seg-b24de276d788 = Kellovaiheen (ajoituksen) virheen RMS (neliökeskiarvo) katkon aikana.

seg-53e5018ae276 = <b>ajoitusmittari</b>, ei paikka

seg-8cdec6da2072 = Ajoitusvirheen 95. persentiili katkon aikana.

seg-95f058adb809 = Huonoin (lyhin) määrityksen sisällä pysyvä ylläpito katkojaksojen yli.

seg-48babfd3bd95 = <b>ruudukon rajaama</b> — alaraja aika-askeleen tarkkuudella

seg-41c08973baa1 = |virheen| pienimmän neliösumman kasvunopeus katkon aikana.

seg-707ee74c5c06 = osuus [{ "0,1" }]

seg-32e5fe6415f8 = Koko ajon osuus, jolla on määrityksen sisäinen ratkaisu.

seg-361b3b923a45 = osuus [{ "0,1" }] tai null

seg-5d55682f9349 = <b>Suodattimen itseyhdenmukaisuus</b>: niiden katkonäytteiden osuus, joiden todellinen virhe pysyy Kalmanin k-σ-rajan sisällä.

seg-636106cb4a40 = <b>EI</b> HPL/VPL/RAIM (HPL: horisontaalinen suojaustaso; VPL: vertikaalinen suojaustaso; RAIM: vastaanottimen autonominen eheysvalvonta) -eheyttä — katso <a1><c1/></a1>

seg-f686ade3da21 = <b>Analyyttinen harhautuksen havaittavuusraja</b> kellon vakaudesta.

seg-f8783db25141 = merkityksellinen vain konfiguroidulla hyökkäyksellä, joten kello- ja ratapaketit (jotka eivät konfiguroi mitään) merkitsevät sen arvolla <c1/> kohdassa <c2/> ja tulostavat sen yhteenvedossa muodossa <c3/>; <b>ei</b> monisatelliittinen RAIM-ilmaisin

seg-90e2980430b9 = Miltä ”hyvä” näyttää

seg-c1afc6f3c545 = <b>Hiljaisempi kello</b> (pienempi <c1/>) antaa pidemmän arvon <c2/> ja korkeamman havaittavuusrajan <c3/> — se on kvantti vs. klassinen -vastakohta.

seg-0fa38207813a = Arvo <c1/> lähellä lukua { "1.0" } tarkoittaa, että järjestelmä pysyi määrityksen sisällä lähes koko ajon; pitkän katkon aikana se laskee kohinaisemmalle kellolle.

seg-4dcba241d5a6 = Arvo <c1/> lähellä lukua { "1.0" } tarkoittaa, että suodattimen oma epävarmuusraja oli rehellinen virheestään — <em>itseyhdenmukaisuutta</em> koskeva väite, ei ihmishengen turvaamiseen liittyvä takuu.

seg-3099d75a04a5 = Muut skenaariotyypit

seg-43cd9f67f384 = Jokainen muu tyyppi tuottaa oman tulosmuotonsa. Muutama yleinen:

seg-6b59ef9dfe85 = <b>inertial</b>: paikka-alueen laatumittarit <b>metreinä</b> (<c1/>, <c2/>) — yksiakselinen (1-DOF (DOF: vapausaste)), yhden siemenluvun (katso <a1><c3/></a1>).

seg-3e3ec8985dde = <b>hybrid / fusion</b>: <c1/> ja <c2/> ylätasolla, ja puolta kohti yhden anturikokonaisuuden ajoitus- ja paikkaluvut (<c3/>, <c4/> ja <c5/>, aika kunnes jompikumpi määritys rikkoutuu), lohkon <c6/> kanssa kuten kellopaketissa, jossa paikkaluvut on lueteltu merkinnällä <c7/>.

seg-e38e8a8adec8 = <b>spoof</b>: askelkohtainen harhautuspoikkeama vs. kellon havaitsemisraja sekä se, saavuttiko harhautus määrityksen ennen havaitsemista (<c1/>).

seg-dfd972d160e1 = <b>horisonttiprofiili</b> (<c1/> ja <c2/> tyypeillä <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; mukana vain, kun skenaariossa on osio <c8/>, joten skenaario ilman sitä on ennallaan): ylätason objekti <c9/>, jossa <c10/> (merkkijono: <c11/>, <c12/> tai <c13/>), <c14/> (osuus [{ "0,1" }] ylemmän puolipallon avaruuskulmasta kohdan <c15/> yläpuolella) ja <c16/> (merkkijono); näytettä kohti <c17/> (maskin yläpuolella mutta horisonttiprofiilin takana olevien satelliittien lukumäärä: <c18/> tyypeissä <c19/> ja <c20/>, <c21/> tyypissä <c22/>, <c23/> tyypissä <c24/>); ja tyypille <c25/> kenttä <c26/> (epookkien lukumäärä). Niiden yksiköt ja alkuperäluokat ovat lohkossa <c27/> (<c28/> <c29/>; <a1><c30/></a1>).

seg-d113122b7454 = Minkä tahansa tyypin tarkan kenttäjoukon löydät sen merkinnästä tiedostossa <a1><c1/></a1> (alla), tyypin osiosta tiedostossa <a2><c2/></a2> tai vastaavasta rakenteesta <c3/> hakemistossa <c4/>.

seg-e0c63207c019 = Muut tiedostot, jotka ajo kirjoittaa

seg-cc97989ca06b = Tiedoston <c1/> viereen komentorivi (CLI) kirjoittaa tiedoston <c2/>, tulostettavan <c3/> ja saman raportin tiedostona <c4/>, jonka lohko <c5/> kirjaa moottorin version, skenaariotiedoston SHA-256-tiivisteen, siemenluvun, alustan ja tarkan komennon (katso <a1><c6/></a1> ja <a2><c7/></a2>). Tyypit, jotka julkaisevat toistettavuustaulukon, kirjoittavat myös <c8/> (CSV: pilkuin erotetut arvot). <c9/> kirjoittaa vaihtotiedostot (katso <a3><c10/></a3>) ja <c11/> animaation (katso <a4><c12/></a4>).

seg-489953601f3b = Yksiköt ja alkuperä kenttäkohtaisesti kaikille tyypeille

seg-61b33dbb44dd = Tämä sivu on käsin kirjoitettu ja kattaa kello- ja ratapaketit. Koneluettava vastine kattaa <b>jokaisen</b> sisäänrakennetun tyypin:

seg-1e20fcda7f0b = <b>Itse tuloksessa.</b> Jokaisen skenaarion tulosasiakirja sisältää ylätason objektin <c1/>, joka kuvaa annetun kentän polun arvoon <c2/>. Polkukielioppi (taulukko tuottaa yhden segmentin, jonka pääte on <c3/> ja joka on yhteinen sen riveille; <c4/> on yhden segmentin jokerimerkki datalla avainnetuille objekteille) ja suljettu alkuperäsanasto on määritelty tiedostossa <a1><c5/></a1>.

seg-b8256437c0b7 = Yhtenä tiedostona.

seg-ae7136e34306 = Tiedosto <a1><c1/></a1> on kerätty yhdiste: jokaiselle tyypille jokainen numeerinen kenttä, jonka se antaa ilmoitetussa lähteessä, yksikön, alkuperäluokan, todistetason ja määritelmän kanssa — ja nimettynä eikä pois jätettynä jokainen kenttä, jolla ei vielä ole niitä. Sen lohko <c2/> sisältää lukumäärät.

seg-66af6dc065f7 = Molemmat pannaan täytäntöön testillä <c1/>, joka ajaa jokaisen rekisteröidyn tyypin ja epäonnistuu, jos annetulta numeeriselta kentältä puuttuu yksikkö ja alkuperäluokka. Vielä kattamattomat tyypit on nimetty yksitellen kyseisen tiedoston kohdassa <c2/> kunkin avoimen syyn kanssa, ja lukumäärä on lukittu, jotta luettelo voi vain lyhentyä.

seg-ca49a577a07b = Generoi JSON uudelleen minkä tahansa raportin muodon tai lohkon <c1/> muutoksen jälkeen:

seg-ce4351cf7673 = <s1>Edellinen</s1>Skenaarioviite

seg-b988dcc329a4 = <s1>Seuraava</s1>Todellisten TLE-tietojen käyttö

seg-6585c8a3643d = ClockRun (kumpikin: quantum / classical)

seg-299f8a9643f1 = FoMScores (objekti fom)

seg-d17376a1ea92 = ({ "0.40" }) Ajon todistemerkintä: <c1/> (<c2/>, <c3/> tai <c4/>: rivien <em>heikoin</em> tila, joten se ei koskaan väitä enempää kuin heikoin rivinsä), <c5/> (<c6/>), <c7/> ja <c8/>, yksi jokaista ajon käyttämää varmennusmatriisin riviä kohti (rivit, jotka sen lisäraportti luettelee, lähteestä <c9/>): <c10/> (<c11/> ja rivin vaatimustekstin SHA-256:n { "8" } ensimmäistä heksadesimaalinumeroa), <c12/> ja <c13/>, kaikki luettu matriisista, mitään ei kirjoitettu käsin. Funktio <c14/> lisää sen jokaisen tyypin tulokseen, ennen loppuosan lohkoa <c15/>, kun sellainen on (tuo lohko pysyy viimeisenä avaimena); <c16/> poistaa sen tavu tavulta. Saman ajon kaavion SVG ja CSV-taulukko kantavat saman merkinnän (<c17/> ja näkyvä rivi kaavion alla; kommenttirivit <c18/> CSV:n edessä). Toisen tyypin tulokseen upotetut kampanjajäsenet eivät kanna sellaista: ulompi asiakirja kantaa. Ei sisällä lukuja.
