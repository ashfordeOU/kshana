# docs--studio: translations (fi)

seg-c3c260b7063e = Testit

seg-ca497f6e51d4 = Lähde: <c1/>

seg-256705861db0 = Sivusto kshana.dev

seg-82b7ed4e70af = <c1/> on puu, jota GitHub Pages tarjoaa osoitteena <a1>https://kshana.dev</a1>: sivut (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), dokumentaatio hakemiston <c8/> alla ja Kshana Studio hakemiston <c9/> alla (tarjolla osoitteessa <a2>https://kshana.dev/studio/</a2>), sovellus, joka ajaa moottorin selaimessa WebAssemblyna (WASM) ilman palvelinpuolen laskentaa ja ilman mitään lähetystä. Studiossa on kaksi näkymää yhteen moottoriin: Yksinkertainen näkymä (<c10/>, vastaus ensin selkokielellä) ja Laaja näkymä (<c11/>, koko hallintanäkymä), joka jakaa Yksinkertaisen näkymän moottorin, workerin, moduulit ja datan kohteen <c12/> kautta.

seg-2b76ce9ee32c = Versiosta { "0.35.0" } lähtien Studiossa on neljä lisänäkymää, kukin oma sivunsa, jossa on <c1/>, ei hakuindeksointia ja kansio synteettisiä näytteitä, jota sen testi lukee:

seg-e3d0762bb726 = <c1/>: meriluottamusnäkymä, aluksen paikkavirran vastaanottimen luottamuspistemäärä, demoradalla hakemistossa <c2/>.

seg-e608cdeac977 = <c1/>: miehistökoulutuksen purku, joka toistaa synteettistä NMEA:ta häirinnän, drag-off-, aikaharhautus- tai toistotapahtumalla (<c2/>).

seg-f2ce6a93a58d = <c1/>: häiriökartta ja reitin altistus (<c2/>).

seg-3f6cf51eb439 = <c1/>: yksi sivu työkalukortteja esimerkeillä (<c2/>, <c3/>), mukaan lukien allekirjoitetut todistepaketit (<c4/>), bench-vienti (<c5/>), compliance-kartoitus (<c6/>), Galileo OSNMA -varmennus (<c7/>) ja tekoälyavustajakanavat (<c8/>).

seg-fb02aba9149f = Mistä tiedostot tulevat

seg-a58fb92bab82 = Täällä on kolmenlaisia tiedostoja, ja niitä muutetaan kolmella eri tavalla.

seg-d404d216114c = <b>Siirretyt tiedostot.</b> Sivut, <c1/>, <c2/>, <c3/>, <c4/>, sivustodata hakemistossa <c5/> (<c6/>, <c7/>, <c8/>) ja kaikki hakemiston <c9/> alla kirjoittaa <c10/> sivustokoontiversiosta ja Studion lähteestä. <c11/> luettelee jokaisen SHA-256 (Secure Hash Algorithm, 256-bittinen) -tarkistussummineen. <b>Älä muokkaa niitä täällä</b>: <c12/> epäonnistuu käsin tehdyssä muokkauksessa. Muuta lähdettä ja aja siirto uudelleen:

seg-b681e66130e5 = Siirto on deterministinen: toinen ajo ei kirjoita mitään, ja <c1/> poistuu koodilla { "1" }, jos <c2/> ei ole sitä, mitä siirto kirjoittaisi. Se kuljettaa sivustokoontiversion indeksointitiedostot muuttamattomina (jokaisen sivun canonical-, sosiaalikortti- ja schema.org-tunnisteet, <c3/>, <c4/>, <c5/>, <c6/>), tarkistaa ne, kirjoittaa <c7/>, <c8/> ja Studion vanhassa osoitteessa olevan ohjaussivun (<c9/>, kohteeseen <c10/>) ja osoittaa jokaisen sivun paikallisiin fontteihin ja skriptikirjastoihin (alla).

seg-9be72ec8d40e = <b>Hakemiston <c1/> omistamat tiedostot.</b> Nämä ovat omia lähteitään, eikä siirto koske niihin koskaan:

seg-23b6ea71fede = <c1/> on rakenteinen lähde kykykorteille ja standardiruudukolle. <b>Muokkaa sitä, ei HTML:ää.</b>

seg-e1ee8cd0af21 = <c1/> generoidaan (<c2/>) ja lukitaan testillä <c3/>; älä muokkaa sitä käsin. <c4/>, <c5/> ja <c6/> ovat käsin ylläpidettyjä kartoituksia, jotka sama testi tarkistaa generoitua matriisia vasten. Studion kopiot hakemiston <c7/> alla ovat nämä tiedostot tavu tavulta.

seg-8901229c76ba = <c1/>, <c2/> ja <c3/> ovat sosiaalinen kortti (<c4/>).

seg-89d78af0258c = <c1/> ja <c2/>: sivujen käyttämät fonttitiedostot ja skriptikirjasto, haettu kerran komennolla <c3/> ja tallennettu (katso ”Ei kolmannen osapuolen pyyntöjä”).

seg-317c42219bd7 = <c1/>, <c2/>, <c3/>, <c4/> ja <c5/>.

seg-5071806d230f = <b>Koontituotteet</b>, joita git ohittaa ja jotka tuottaa <c1/>: <c2/> (paketti <c3/>, josta myös npm-paketti rakennetaan), <c4/> (sama paketti, josta Studio sen tuo) ja <c5/> (jokainen viiteskenaario osoitteessa, josta aiempi yhden sivun sivusto ne tarjosi).

seg-5042f55f78b5 = Rakenna ja tarjoa paikallisesti

seg-f393a52f7794 = Ilman WASM-työkaluketjua <c1/> asettaa olemassa olevan paketin sen kääntämisen sijaan. Pages-työnkulku ei koskaan käytä tätä.

seg-35094cb7ed04 = Jokainen moduuli hakemistossa <c1/> on puhdasta logiikkaa ja siihen kuuluu vastaava <c2/>; Studion DOM (Document Object Model, sivun elementtipuu) -ohjaimet ovat <c3/> (Yksinkertainen näkymä) ja <c4/> (Laaja näkymä). Jatkuva integraatio ajaa jokaisen näistä omana vaiheenaan ja epäonnistuu, jos hakemiston <c5/> alla olevalla testitiedostolla ei ole vaihetta.

seg-ba24be498f87 = Ei kolmannen osapuolen pyyntöjä

seg-7215806f98d4 = kshana.dev tarjoaa omat fonttinsa, tyylinsä ja skriptinsä. Sivu ei tee pyyntöä fonttipalvelimelle tai skriptipalvelimelle, joten kävijän osoitetta ei luovuteta sellaiselle.

seg-30fc8da50592 = Sivusto ja Studio on kirjoitettu Google Fontsia ja skriptipalvelinta vasten. Siirto korvaa jokaisen sivun Google Fonts -linkin vastaavalla tyylitiedostolla hakemistossa <c1/> (samat säännöt <c2/> ja samat fonttitiedostot, kaikki osajoukot, joten teksti piirtyy kuten ennen) ja jokaisen skriptipalvelinosoitteen tiedostolla hakemiston <c3/> alla. <c4/> ja <c5/> kirjaavat, mistä kukin tiedosto tuli, ja sen tarkistussumman; fontit ovat SIL Open Font License -lisenssillä (<c6/>) ja three.js MIT-lisenssillä (<c7/>).

seg-68a02a54db3b = <c1/> on ainoa vaihe, joka käyttää verkkoa. Aja se uudelleen vain, kun sivu pyytää fonttijoukkoa tai kirjastoversiota, jota ei ole täällä: siirto kieltäytyy ja kertoo sen. <c2/> epäonnistuu, jos jokin siirretty sivu, tyylitiedosto tai skripti nimeää fonttipalvelimen tai lataa mitään toiselta palvelimelta.

seg-4ff8a4accad4 = Sivu { "404" }

seg-763503746a48 = GitHub Pages vastaa puuttuvaan osoitteeseen sivulla <c1/> ja tilakoodilla { "404" }. Siirto tekee sen sivun etusivun oman kuoren (navigointi, alatunniste, haku) ympärille lyhyellä viestillä ja linkeillä Etusivulle, Dokumentaatioon ja Studioon. Jokainen siinä oleva osoite kirjoitetaan sivuston juuresta, koska sitä tarjotaan millä tahansa syvyydellä.

seg-9126631f595b = Vanhat osoitteet

seg-a64ed190233a = Versioon { "v0.28.0" } asti sivusto oli yksi sivu, ja kaikki oli osoitteen <c1/> fragmentin takana (<c2/>, <c3/>, jakolinkit muodossa <c4/>, upotukset muodossa <c5/>; upotuslinkin vanha välilehden nimi, kuten <c6/>, avaa sen korvanneen Studion välilehden). <c7/> luettelee jokaisen sellaisen osoitteen, jota julkaistu aineisto käyttää, ja minne se nyt päätyy; etusivu lataa tiedoston <c8/>, joka on generoitu tuosta luettelosta, ohjatakseen ne sinne. Lisää tapaus luetteloon ennen minkään osoitteen poistamista.

seg-a9db9b0675e2 = Käyttöönotto

seg-0316a3f12053 = GitHub Actions -työnkulku <c1/> ottaa käyttöön julkaisutunnisteen, ei haaraa <c2/>: <c3/> käynnistää sen, kun julkaisu on tehty, ja manuaalinen käynnistys ottaa nimetyn tunnisteen uudelleen käyttöön. Se ajaa <c4/>, kokoaa julkaistavaksi sisällön <c5/> ilman testejä, koontiskriptiä, hakemistoa <c6/>, manifestia ja tätä tiedostoa sekä julkaisee tuloksen GitHub Pages -palveluun.

seg-6aa2e78078ae = <s1>Edellinen</s1>Sanasto

seg-419353a4fb30 = <s1>Seuraava</s1>Opastukset
