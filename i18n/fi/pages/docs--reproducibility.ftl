# docs--reproducibility: translations (fi)

seg-03cb5fb3dd8f = Kyllä

seg-a7d5633dbcc0 = Toistettavuus ja alkuperä

seg-ab939e90efad = Lähde: <c1/>

seg-1c48a3edda84 = Kshana on rakennettu toistettavaksi: samat syötteet tuottavat samat tulokset, ja käännösartefaktit voidaan jäljittää lähteeseen, josta ne syntyivät. Tämä asiakirja kertoo täsmälleen, mitä taataan, mitä ei, ja miten takuut pannaan täytäntöön.

seg-95b0eba44abe = Determinismitakuut

seg-1f637144697d = Moottorissa ei ole kellonaikariippuvuutta, ei suoritussäikeestä riippuvuutta eikä siementämätöntä satunnaisuutta. Jokaista stokastista prosessia ohjaa virta <c1/>, jonka avaimena on skenaarion kenttä <c2/> ja josta arvot vedetään kiinteässä järjestyksessä. Seurauksia:

seg-14df30025491 = Ominaisuus

seg-f0badf8cb640 = Taattu

seg-9f6678ac42f5 = Varmistaa

seg-cfc934af2c75 = Sama skenaario, sama kone → tavu tavulta sama tiedosto <c1/>

seg-917da569fdd7 = <c1/> (ajaa vertailuskenaarion kahdesti, vertaa SHA-256-tiivisteitä (SHA: Secure Hash Algorithm))

seg-27351cbdc2b5 = Sama skenaario → samat laatumittarit kenttä kentältä

seg-bdeaf344acf8 = Kyllä, alustakohtaisesti

seg-debbc6540baf = <c1/> lukitsee jokaisen laatumittarin (FoM) neljälle vertailuskenaariolle

seg-f7c5427c88f9 = Skenaarion syötetiiviste (<c1/>) ei riipu alustasta

seg-2bdf4b2d80be = kanonisen skenaarion sisältöosoitteinen SHA-256, lukittu tiedostossa <c1/>

seg-45861afe0994 = Syötteen sormenjälki + tulosteen <b>muoto</b> identtinen eri käyttöjärjestelmissä (OS)

seg-49345663b97c = <c1/> lukitsee tarkan SHA-256-tiivisteen skenaariota kohti (kymmenen skenaariota, yksi tiedosto <c2/> kutakin kohti hakemistossa <c3/>), ja se tarkistetaan 3 käyttöjärjestelmän CI-matriisissa (jatkuva integrointi)

seg-e54b5ff80782 = Tulosteen <b>arvot</b> täsmäävät käyttöjärjestelmien kesken (ubuntu/macOS/Windows)

seg-271bcbff6287 = Kyllä, tarkkuudella { "1e-6" }

seg-3c25e00debff = CI-työ <c1/> ajaa testit <c2/> ({ "1e-6" }), <c3/> ({ "2e-5" } km) ja <c4/> kaikilla kolmella käyttöjärjestelmällä

seg-3876618cc821 = Matalan Maan kiertoradan (LEO) navigointiviestin kehys on samat tavut kaikilla alustoilla ja kaikissa käännösprofiileissa, WebAssembly (WASM) -käännös mukaan lukien

seg-8aff3ee31c7e = <c1/> (jokainen transkendenttifunktio ja jokainen normaalijakautunut poikkeama tyypissä <c2/> kulkee puhtaan Rust-paketin (crate) <c3/> kautta); <c4/> lukitsee kokonaisen kehyksen ilman alustarajausta

seg-69750a5db756 = Siemenellä tehdyt indeksiarvonnat (bootstrap-uudelleenotanta, sekoitukset) ovat samat 32- ja 64-bittisillä kohteilla

seg-01e0601aa7fc = <c1/> otantaa aina tyyppinä <c2/>; lukittu kohdassa <c3/>

seg-e42899fd8a4e = Sama työkaluketju kaikkialla

seg-0bdd9769d5fb = <c1/> lukitsee kanavan; <c2/> kaataa koontiversion poikkeaman sattuessa; CI ja julkaisu lukitsevat saman version

seg-b0a3fd993614 = Sama riippuvuusjoukko

seg-5a3daf9f0468 = <c1/> on versionhallinnassa, ja <c2/> käytetään SBOM-luettelon (ohjelmistokomponenttiluettelo) tuottamiseen

seg-3ec3fae0dc5e = Jokainen komentorivin ajo kirjoittaa raporttiinsa myös toistettavuustiedot (<c1/> ja <c2/>): moottorin version, skenaariotiedoston ja tulosasiakirjan SHA-256-tiivisteen, siemenluvun, alustan ja tarkan komennon, jonka <c3/> ajaa uudelleen tavu tavulta samaan tulokseen. Raportti on itsessään ajon puhdas funktio: kaksi ajoa skenaariosta <c4/> kirjoittaa saman tiedoston <c5/> tavu tavulta. Katso <a1>REPORTS.md</a1>.

seg-273a66a3584d = Alustojen välinen varauma (ja miten kultaiset vertailuarvot sen käsittelevät)

seg-9f4ec3dc638d = Numeeriset tulokset ovat <b>bitilleen samat yhdellä alustalla</b>, mutta voivat poiketa muutamalla viimeisen numeron yksiköllä (ULP) alustojen <b>välillä</b>. Syynä on alustan matematiikkakirjasto: IEEE-754 (IEEE: Institute of Electrical and Electronics Engineers) ei vaadi funktioiden <c1/>, <c2/>, <c3/> ja vastaavien oikeaa pyöristystä, joten Linux (glibc, GNU C -kirjasto), macOS ja Windows voivat kukin palauttaa eri viimeisen bitin. Pitkässä ajossa nämä ~{ "1e-16" } erot kertyvät suhteellisesti ehkä tasolle ~{ "1e-12" }.

seg-9297c2585419 = Kaksi asiaa suurentaa tuota viimeisen numeron eroa alkuperäisestä, ja molemmat on mitattu eikä oletettu. <b>Mukautuva integraattori</b> valitsee seuraavan askeleensa virhearviosta viidennen juuren kautta, joten yksi yksikkö viimeisessä numerossa muuttaa askelsarjaa, ja kaksi alustaa täsmäävät sitten vain integroinnin toleranssin tarkkuudella. <b>Iteratiivinen estimaattori</b> (pienimmän neliösumman sovitus, radanmääritysfiltteri) voi kulkea eri polkua suppenemiseen. Näihin perustuvat tyypit voivat poiketa alustojen välillä yli { "1e-6" } yksittäisissä kentissä; <c1/> kirjaa saman tilanteen yksikkötesteille.

seg-c6bd20427abc = <b>Käännösprofiili</b> vaikuttaa samalla tavalla yhdellä koneella. Optimoitu käännös macOS:llä yhdistää yhden argumentin sinin ja kosinin yhdeksi kutsuksi järjestelmän yhdistettyyn rutiiniin, jonka sini poikkeaa yksinäisestä funktiosta <c1/> viimeisessä bitissä { "379" } argumentille joukossa, jossa on { "200 000" } argumenttia; optimoimaton käännös tekee kaksi kutsua. Mitattuna aarch64-macOS:llä { "138" } skenaariotiedoston yli debug- ja release-käännös samasta lähteestä antavat tavu tavulta samat tulosasiakirjat { "102" } tiedostolla. Muiden { "36" } tiedoston tulokset poikkeavat viimeisissä numeroissa: { "28" } niistä enintään arvolla { "1e-6" }, yksi (<c2/>) määrällä { "2.8e-6" }, ja seitsemän kampanjaa vain jäsenajojensa tiivisteissä; mikään ei poikkea merkinnässä, lukumäärässä tai tuomiossa. Tavu tavulta -takuu pätee siis yhdelle käännökselle: samalle binäärille kahdesti.

seg-ff368c627bd2 = Siemenellä tehdyt <b>normaalijakaumavedot</b> ovat kolmas, paljon harvinaisempi lähde: otantafunktio kutsuu isännän eksponentti- ja logaritmifunktiota harvinaisissa haaroissaan, ja noin yksi veto miljoonasta poikkeaa viimeisessä bitissä natiivin ja WASM-käännöksen välillä.

seg-0b7ebca1a5e3 = Kun tuloste on <b>diskreetti</b>, viimeisen numeron ero ei ole lainkaan hyväksyttävä, ja tyyppi lasketaan isäntäkirjaston sijaan tiedoston <c1/> funktioilla. Tyyppi <c2/> on ensimmäinen: sen binäärikehys on lähetettyjä kokonaislukuja, ja sama skenaario koodattiin kerran kolmeksi eri kehykseksi: release-käännöksessä, saman lähteen debug-käännöksessä ja selaimessa. Nyt se on samat tavut kaikissa kolmessa.

seg-1746a0ea22fe = Tämän vuoksi golden-testit <b>eivät</b> lukitse yhtä alustojen välistä tiivistettä liukulukutulosteesta — se olisi hauras ja kaataisi rehellisesti oikeita käännöksiä toisella käyttöjärjestelmällä. Sen sijaan:

seg-9733b0545768 = <b><c1/></b> lukitsee jokaisen laatumittarin suhteellisella toleranssilla <c2/> — neljä suuruusluokkaa tiukemmin kuin mikään todellinen regressio (joka siirtää arvoa kokonaisilla prosenteilla), mutta paljon löysemmin kuin alustojen välinen matematiikkakirjaston (libm) värinä. Ruudukon rajaamat kentät (holdover-sekunnit) ja täsmälleen nolla -kentät lukitaan täsmälleen.

seg-a3dfe1c26401 = <b><c1/></b> — <em>syötteiden</em> sisältötiiviste — on alustasta riippumaton ja lukittu täsmälleen.

seg-571aea9b8115 = <b><c1/></b> lukitsee tarkan SHA-256-tiivisteen, tallennettuna skenaariokohtaisesti hakemistoon <c2/>, projektiosta, joka <em>on</em> identtinen alustojen välillä: syötteen sormenjälki sekä tulosteen <b>muoto</b> (kenttien nimet, sisäkkäisyys, lehtityypit, taulukoiden pituudet — kiinteitä deterministisen ruudukkoaritmetiikan vuoksi, eivät koskaan liukulukuarvoja). Tämä saa rakenteelliset regressiot kiinni täsmälleen, kun yllä olevat toleranssilukitukset saavat arvoregressiot kiinni.

seg-8543165b0d7d = <b><c1/></b> varmistaa tavu tavulta saman tulosteen kahdessa ajossa <em>samalla koneella</em> (determinismitakuu).

seg-8b8b4ba5de30 = <b>CI-työ <c1/></b> ajaa neljä yllä olevaa testiä (<c2/>, <c3/>, <c4/>, <c5/>) alustoilla <b>ubuntu-latest, macos-latest ja windows-latest</b>, joten alustojen välinen toistettavuus varmistetaan jokaisella pushilla — muoto- ja syötevertailut täsmälleen, numeriikka tarkkuudella { "1e-6" } ja SGP4-tilat (Simplified General Perturbations { "4" }) tarkkuudella { "2e-5" } km — yhteen käyttöjärjestelmään luottamisen sijaan.

seg-2b9915611f03 = Jos lukitut luvut täytyy luoda uudelleen (esim. tarkoituksellisen mallimuutoksen jälkeen), aja jokainen vertailuskenaario ja kopioi tulostetut FoM-arvot tiedostoon <c1/>, ja kirjaa muutos tiedostoon <c2/>.

seg-9310a7af7ff8 = Ohjelmistokomponenttiluettelo (SBOM)

seg-717baa65bbb2 = <c1/> tuottaa CycloneDX-muotoisen (versio { "1.5" }) SBOM-luettelon, joka listaa jokaisen kshana-artefaktissa toimitettavan paketin (crate) tarkkoine versioineen, lähteineen ja lisensseineen. Se on riippuvuudeton generaattori, joka perustuu komentoon <c2/> (joten se toimii pelkällä työkaluketjulla), ja se kulkee ratkaisugraafin kshana-paketista vain normaalien ja käännösriippuvuuksien kautta. Kehitysriippuvuudet (vain testeihin tarkoitetut paketit, kuten <c3/>) jätetään pois, koska yksikään artefakti ei sisällä niitä.

seg-a7886c557267 = Graafi on niiden ominaisuusjoukkojen yhdiste, joilla toimitettavat artefaktit rakennetaan: oletuskäännös (kirjasto ja komentoriviliittymä (CLI)), <c1/> (PyPI-wheel (PyPI: Python Package Index), jonka ketju <c2/> on sen vierasfunktiorajapinta) ja <c3/> (npm-paketti, joka kantaa saman SBOM-luettelon tarballinsa sisällä). Kaikkien kohteiden alustakohtaiset ehdolliset riippuvuudet ovat mukana, koska wheelit toimitetaan useille käyttöjärjestelmille ja npm-paketti kohdistuu WebAssemblyyn. Yksi asiakirja kattaa kaikki kolme artefaktia, joten yksittäiselle niistä se on ylijoukko. Se luettelee tällä hetkellä { "107" } komponenttia; lukumäärä on lukittu kohdassa <c4/>. Erillisellä palvelimella <c5/> on oma manifestinsa, eikä tämä SBOM kuvaa sitä.

seg-4c8948e9ee7d = Tuloste on deterministinen — sama riippuvuusjoukko tuottaa tavu tavulta saman asiakirjan, myös sarjanumeron, joka johdetaan lajitellusta pakettiluettelosta eikä aikaleimasta.

seg-60742bbdc583 = Julkaisutyönkulku tuottaa SBOM-luettelon (<c1/>) ja liittää sen jokaiseen merkittyyn julkaisuun; jakelutyönkulku toimittaa sen myös PyPI-wheelien rinnalla ja npm-paketin sisällä.

seg-928c3c0108a1 = Käännöksen alkuperätiedot

seg-42752467bfaa = Julkaisutyönkulku tuottaa SLSA (Supply-chain Levels for Software Artifacts) -käännösalkuperätodistuksen (<c1/>), joka kattaa jokaisen GitHub-julkaisuun liitetyn tiedoston: komentorivibinäärit kullekin alustalle, palvelinbinääri <c2/>, SBOM, validointiyhteenveto ja <c3/>. Käyttäjä voi komennolla <c4/> todentaa, että artefaktit on rakennettu tämän repositorion julkaisutyönkulussa tästä lähteestä — sulkien aukon sanojen ”tässä on binääri” ja ”tässä on binääri, jonka voin jäljittää lähteeseensä” väliltä. Esimerkiksi SBOM-luettelolle versiossa { "v0.28.0" }:

seg-06515d230d33 = <s1>Edellinen</s1>Alkuperä

seg-c6dba4e40c76 = <s1>Seuraava</s1>Ominaisuuskartta
