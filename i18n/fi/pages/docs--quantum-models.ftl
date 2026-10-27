# docs--quantum-models: translations (fi)

seg-638b8d451550 = Anturi

seg-c35a20fa2529 = Kypsyys

seg-2f51722ab9d4 = Lähde: <c1/>

seg-39ab7752d86d = Kvanttianturimallit: mitä Kshana mallintaa ja mitä ei

seg-daf0e0c0b16f = Kshana on <b>PNT-kestävyyssimulaattori (PNT: paikannus, navigointi ja ajanmääritys), jossa on kvanttianturien suorituskykymalleja</b>. Se <em>ei</em> ole kvanttifysiikan ensiperiaatteista laskeva simulaattori. Tällä sivulla todetaan tarkasti, mitä se tarkoittaa, jotta ”kvantti”-nimitystä ei voi pitää suurempana kuin se on.

seg-6e504d97c41e = Mitä mallinnetaan

seg-7884c9a7d883 = Jokainen kvantti- (ja klassinen) anturi on <b>virhemalli</b>, jota ajavat julkaistut kohinabudjetin parametrit:

seg-cad22f39d579 = <b>Kellot</b> — valkoisen taajuuskohinan ja taajuuden satunnaiskulun tehospektritiheydet (PSD), flicker-Allanin (1/f) alaraja ja lineaarinen ajautuma, peräisin tietolehdistä ja artikkeleista: CSAC (sirumittakaavan atomikello) Microchip SA.45s; Origlian ym. strontiumin optinen hilakello (arXiv:{ "1503.08457" }), avaruuteen suuntautuva tavoite; sekä kuusi oletusta <c1/> (CSAC; USO, erittäin vakaa oskillaattori; DSAC, Deep Space Atomic Clock; TCXO, lämpötilakompensoitu kideoskillaattori; OCXO, uunistabiloitu kideoskillaattori; RAFS, rubidiumatomitaajuusnormaali), kullakin yksi lähde. Näiden tuottama Allanin poikkeama on validoitu vakiokohinatyyppien kulmakertoimia vasten (ks. <a1><c2/></a1>). Yksi optisen kellon käyrä on todellinen: Norcian ym. (<em>Science</em> { "2019" }) mitattu ⁸⁸Sr-pinsettikellon Allanin poikkeama toistuu kohinasovituksella, mikä on VALIDATED-rivi tiedostossa <a2><c3/></a2>; optiseen luokkaan perustuvat holdover-luvut pysyvät MODELLED.

seg-13c3340e773b = <b>Inertia-anturit</b> — paketeissa <c1/> ja hybridipaketeissa yksiakselinen (1-DOF, yksi vapausaste) kiihtyvyysanturin/gyron virhebudjetti: nopeuden satunnaiskulku, kulman satunnaiskulku, kiihtyvyyden satunnaiskulku ja Allanin bias-epävakauden alaraja. Tyypit <c2/> ja <c3/> sen sijaan ajavat kolmiakselisen strapdown-mekanisoinnin hakemistossa <c4/> (kvaternioasento, pohjoinen–itä–alas-navigointiyhtälöt, deterministinen IMU-virhemalli).

seg-f361d586b348 = Kvanttiskenaariotyypit — <c1/>, <c2/>, <c3/>, <c4/> ja <c5/> — rakennetaan näistä virhemalleista ja ne ovat MODELLED; tyypit <c6/>, <c7/> ja <c8/> raportoivat lisäksi edustavuustietueen ja aukot lentoon.

seg-05bbaddd4df6 = Moottori on <b>neutraali</b>: ”kvantti” ja ”klassinen” ovat sama koodipolku eri kertoimilla. Laatumittareiden ero tulee kokonaan syöttökohinaparametreista, joista jokainen on jäljitettävissä siteerattuun lähteeseen.

seg-a1a067588520 = Mitä EI mallinneta

seg-49a656243210 = Kellojen ja ajansiirtoanturien osalta mitään taustalla olevaa kvanttifysiikkaa ei simuloida — vain nettovaikutus Allanin poikkeamaan, kertoimena annettuna. <b>Kylmäatomikiihtyvyysanturille</b> on nyt olemassa ensiperiaatteista laskeva kerros (ks. alla); loput systemaattiset virheet ovat yhä kerrointasolla tai mallintamatta:

seg-844e65d52572 = atomi-interferometrin <b>Mach–Zehnder-vaihe</b> (<c1/>), <b>kvanttiprojektio- / haulikohina</b> (<c2/>), interferometrin <b>kontrastin</b> vaimeneminen, <b>sykliaika</b> ja <b>tärinäkytkennän siirtofunktio</b> (<c3/>, valkoisen PSD:n varianssi <c4/>) <em>mallinnetaan nyt ensiperiaatteista</em> CAI-kiihtyvyysanturille (kylmäatomi-interferometri) (<c5/>), ja siitä johdetaan valkoisen kiihtyvyyden PSD <c6/>, jota klassinen malli käyttää, yhdessä <b>raitaepäselvyyden dynaamisen alueen</b> (<c7/>) kanssa — ks. <a1><c8/></a1>;

seg-71a782041b89 = <b>Coriolis</b>-systemaattinen virhe (<c1/> / <c2/>, ristikytkentä <c3/>) ja <b>AC-Stark (AC: vaihtovirta) / valosiirtymä</b> -systemaattinen virhe (<c4/>, joka kumoutuu symmetrisellä kaksifotonivirityksellä) <em>mallinnetaan ja yksikkötestataan nyt</em> tiedostossa <c5/>;

seg-00c510117abc = kolme muuta CAI-virhetermiä <em>mallinnetaan nyt</em> kirjastofunktioina tiedostossa <c1/> ({ "0.36" }; MODELLED; ei vielä saavutettavissa skenaariotyypistä):

seg-fcaf6ff00974 = <b>Raman-laserin vaihekohina</b>: Cheinetin ym. ({ "2008" }) herkkyysfunktiopainotus, yhtälö { "8" }, valkoisen vaihekohinan suljetulla muodolla <c1/> (yhtälö { "18" } yhdellä syklillä) ja numeerisella reitillä mille tahansa vaihekohinaspektrille, sekä laserin taajuuskohina, jota takaisinheijastuksen viive <c2/> ei kumoa (Le Gouët ym. { "2007" }, yhtälöt { "9" }–{ "11" });

seg-6e2236c81db8 = <b>aaltorintaman kaarevuus</b> (vain puhdas defokus): lämpöpilven bias <c1/> säteellä, jonka kaarevuussäde on <c2/> sekä sen pieneneminen, kun lasketaan vain ilmaisusäteen sisällä olevat atomit (Louchet-Chauvetin ym. { "2011" } ja Schkolnikin ym. { "2015" } mukaan); korkeamman asteen poikkeamia ei mallinneta;

seg-92295ad17228 = <b>raitaepäselvyyden ratkaisu</b>: väärän raitaindeksin todennäköisyys <c1/> klassisen kiihtyvyysanturin apuna (Lautier ym. { "2014" }) ja kahdella kyselyajalla (Bonninin ym. { "2018" } mukaan), sekä käänteisfunktio, joka antaa suurimman klassisen kohinan annetulle epäonnistumistodennäköisyydelle.

seg-f383678fb806 = Jokainen suljettu muoto tarkistetaan riippumatonta numeerista reittiä vasten (taajuusalueen kvadratuuri tai Monte Carlo atomien tai laukausten yli) ja sen rajatapauksia vasten. Ainoa julkaistu toistettu luku on Cheinetin ym. valkoisen vaihekohinan taso: −{ "111" } dB·rad²/Hz, kun <c1/> = { "20" } µs, antaa noin { "1" } mrad laukausta kohti ({ "0.99" } mrad; artikkeli johtaa tason yhtälöllään { "17" }, flicker plus valkoinen). Mikään tästä ei ole minkään laitteen mittaus;

seg-150f8b9dfea4 = yhä <b>ei</b> mallinneta: korkeamman asteen aaltorintaman poikkeamat, tietyn lasersysteemin vaihekohina ja kellopuolen ensiperiaatefysiikka;

seg-643109601eba = kvantti–klassinen-vertailun paketti <c1/> on yksiakselinen; kolmiakselinen strapdown-polku ajetaan vain tyypeissä <c2/> ja <c3/> (ks. IMU-huomautus (inertiamittausyksikkö) README-tiedostossa ja <a1><c4/></a1>).

seg-1ff01ab9f92d = Kvanttifysiikkakerroksen viimeistely (CAI-virhetermien tuominen skenaariotyypistä saataville, korkeamman asteen aaltorintaman poikkeamat ja kellopuolen ensiperiaatefysiikka) on jäljellä oleva P2-työ tiedostossa <c1/>.

seg-f09a31b33faa = Maalaboratorion ja lentoon kelpuutetut luvut

seg-dcef4579d2a9 = Parametritaulukot sekoittavat kypsyystasoja; käsittele niitä sen mukaisesti:

seg-4f25895df32f = Lähdeluku

seg-cef61e912cd0 = CSAC (esim. SA.45s)

seg-4a016be9bca9 = tietolehti σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = <b>käytössä oleva</b> kaupallinen osa (säteilynkestäviä avaruusversioita on)

seg-d38d20629ed6 = Strontiumin optinen hilakello

seg-1f0d3ec00922 = σ_y({ "1" } s) tavoite ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>maalaboratorio</b> — Kshana ei tunne yhtään julkaistua kiertoratasuorituskykyä sellaiselle

seg-ce1d7994188b = Kylmäatomikiihtyvyysanturi

seg-b07fa6b8cebc = julkaistut laboratorion Allan-luvut

seg-60864f168701 = maalaboratorio / luotausraketti

seg-84a68aeb467d = Kshanan optisen kellon luvut ovat <em>avaruustavoitteita maalaitteistolla</em>. Lennettyä optista kelloa ei ole; README ja tuloksen alkuperätiedot sanovat sen nimenomaisesti.

seg-a204c1b854fa = Vertailukohta: ACES/PHARAO ISS-avaruusasemalla (toiminnassa huhtikuusta { "2025" } lähtien)

seg-fb88de1257bd = ESA:n (Euroopan avaruusjärjestö) <b>ACES/PHARAO</b>-hyötykuorma (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — laserjäähdytetty cesiumkello sekä aktiivinen vetymaser, toiminnassa ISS-avaruusasemalla (kansainvälinen avaruusasema) huhtikuusta { "2025" } lähtien — on nykyinen toiminnassa oleva kiertoradan kellovakauden vertailukohta (tavoitteena suhteellinen vakaus suuruusluokkaa { "1e-16" } muutaman päivän integroinnin jälkeen). Kshanan optisen kellon malli edustaa <em>kunnianhimoisempaa</em> maalaboratoriotavoitetta kuin ACES-hankkeen lennetty cesium-/maser-suorituskyky; kun Kshanan optisia lukuja verrataan siihen, ”mikä on todella lentänyt”, ACES/PHARAO on rehellinen vertailupiste, ja se on mikroaalto-/maser-järjestelmä, ei optinen hilakello.

seg-9d2e850cb986 = ACES-hankkeen tarkat kiertoradan suorituskykyluvut tulee siteerata ESA:n julkaisemista tuloksista niiden julkistamisen jälkeen; tässä on kyse <em>kypsyyserosta</em>, ei tietystä luvusta — Kshanan optiset luvut ovat tavoitteita, eivät lennettyä suorituskykyä.

seg-4b373686adf8 = <a1><c1/></a1> — parametrikohtaiset merkinnät <c2/> / <c3/>.

seg-3f0c1048aea9 = <a1><c1/></a1> — laatumittarien (FoM) määritelmät ja jokainen lyhenne.

seg-a360cd4997e2 = <a1><c1/></a1> — mitä eheyden ja turvallisuuden laatumittarit ovat ja mitä ne eivät ole.

seg-0ac025397b23 = <a1><c1/></a1> — ensiperiaatteista laskeva kylmäatomikiihtyvyysanturi.

seg-41ba2c8f70fe = <s1>Edellinen</s1>Satelliittitähdistön suunnittelu

seg-136fa589fed5 = <s1>Seuraava</s1>Kylmäatomi-interferometri
