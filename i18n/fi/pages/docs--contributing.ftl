# docs--contributing: translations (fi)

seg-c3c260b7063e = Testit

seg-5dce5694e6ec = Lähde: <c1/>

seg-3fa173b79e8f = Osallistuminen Kshana-projektiin

seg-c3a47c614836 = Kiitos kiinnostuksestasi. Kshana pyrkii olemaan <b>neutraali, toistettava, rehellisesti validoitu</b> viite hybridikvantti-/klassiselle PNT:lle. Kontribuutioilta vaaditaan tämä taso: oikeellisuus, lähdeviitteet ja toistettavuus ennen laajuutta.

seg-5a82a55f7fb2 = Tapa, jolla projektia hallitaan — kuka päättää, tekninen taso sekä avoimen ja suljetun raja — on dokumentoitu tiedostossa <a1><c1/></a1>.

seg-cc8491af7a6f = Kehitys

seg-0163ccdfaa2b = Valinnaiset kielisidonnat on suojattu ominaisuuslipuilla ja ovat oletuksena pois päältä (joten yllä oleva build ja riippuvuuksien auditointiportti eivät koske niihin koskaan). Niiden parissa työskentelyyn:

seg-edc8bbab6e92 = Ennen jokaista committia — nopea silmukka

seg-6a7eda7d82b7 = Nämä kestävät sekunteja. Ne ovat osajoukko tiedoston <c1/> työstä <c2/>, samassa järjestyksessä, joten epäonnistuminen täällä on epäonnistuminen siellä:

seg-d62c1fe22fc4 = <b>Toistettavuus on kova invariantti.</b> Muutos, jonka vuoksi tulos ei ole deterministinen suhteessa kolmikkoon <c1/>, on virhe. Satunnaisuuden on kuljettava siemenlukuun perustuvan RNG:n kautta; kvantti- ja klassiset ajot käyttävät riippumattomia, deterministisesti johdettuja siemenlukuja.

seg-66ea0748c10f = <b>Repositorion hygienia.</b> Commiteissa ja sisällössä ei saa olla automaattisten työkalujen attribuutiorivejä tai -alatunnisteita, eikä tekoälyavustajaa saa nimetä tekijäksi missään sisällössä, tiedostonimissä tai historiassa. Suoja valvoo tätä.

seg-fbf423f6fb31 = Ennen kuin pushaat — täysi portti

seg-a9176352d3b4 = <c1/> on kanoninen portti: se ajaa <c2/> lyhentämättömänä ja sitten <c3/> ajaakseen kirjastosuiten vielä muutaman kerran, koska säikeiden lomittumiskilpailu ei näy yksittäisessä ajossa. Vain onnistuessaan se kirjoittaa <c4/> (ei seurattu — konetila yhdestä ajosta, ei sisältöä).

seg-29815bd89ce2 = Se on tarkoituksella hidas — 62-79 minuuttia terveessä vakaassa tilassa, tiedoston <c1/> otsikon mukaan, joka kantaa ajantasaisen luvun — eikä aikakatkaisua ole, koska riittävän lyhyt hyödyllinen aikakatkaisu tappaisi terveen ajon. Osajoukkoajo, joka palasi vihreänä, ei ole portti: molemmat viat, joita varten tämä mekanismi on olemassa, pääsivät sen läpi juuri niin.

seg-408da9a8b8bb = Forkista työskentelevien kontribuuttoreiden ei tarvitse kuittikoukkua — se on paikallinen ylläpitäjän portti, ja <b>CI on se, mikä oikeasti portittaa pull requestin</b>. Tiedoston <c1/> ajaminen ennen pull requestin avaamista tarkoittaa vain, ettei CI kerro mitään, mitä et jo tiennyt.

seg-9394727b21c3 = Anturimallin lisääminen tai muuttaminen

seg-d9c891ca6827 = <b>Jokainen numeerinen parametri tarvitsee alkuperätiedon.</b> Laita viite mallin merkkijonoon <c1/> ja skenaariotiedostoon. Ei anonyymejä vakioita.

seg-d30cb836d4c4 = <b>Validoi standardisuhdetta vasten,</b> ei vain sisäistä johdonmukaisuutta — esim. Allanin poikkeama kelloille, Grovesin dead-reckoning-virheenkasvu inertialle, ajoitus→etäisyys-muunnos ajansiirrolle. Lisää testi, joka toteaa simuloidun tulosteen toistavan julkaistun/suhteen arvon ilmoitetun toleranssin sisällä.

seg-b52dd0dd550e = <b>Ole rehellinen kypsyydestä.</b> Tilarekisteri on <c1/> — lisää tai muuta rivi siellä, nimeä sen ulkoinen oraakkeli (tai sano selvästi, ettei sellaista ole, mikä tekee siitä tilan <c2/>), ja generoi sitten julkaistut artefaktit uudelleen komennolla <c3/>. <c4/>, <c5/> ja <c6/> generoidaan kaikki tuosta funktiosta, ja niissä lukee ”do not edit by hand” syystä. Päivitä myös kertomus <c7/>, kun proosa sitä tarvitsee, ja merkitse tavoitteina tai maapohjaisen demonstraattorin tuloksina olevat luvut sellaisiksi.

seg-34b9c8b6f70c = Testilähtöinen: kirjoita ensin epäonnistuva testi, ja odotettu arvo <b>johdettu käsin</b> fysiikasta/suhteesta ennen toteutusta.

seg-5322d5b2188c = Deterministiset testit väittävät täsmällisiä (käsin johdettuja) arvoja; tilastolliset testit väittävät ilmoitetun toleranssin ja mieluiten keskiarvoistavat siemenlukujen yli hajonnan hallitsemiseksi.

seg-7f76a26c4d5f = Commitit ja versiointi

seg-a1cfb9064694 = <b>Conventional Commits</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> …).

seg-1a13616ca0ac = <b>Semantic Versioning.</b> Ennen versiota 1.0 skenaario-/tulosskeema voi muuttua; nosta rikkovat muutokset esiin.

seg-0e3036c27aa8 = <b>Julkaisut leikataan tagilla <c1/>, ja julkaisu on automaattinen mutta järjestetty.</b> Auto-tag-työnkulku pushaa tagin, kun CI on vihreä haarassa <c2/> versionnoston yhteydessä. Release-työnkulku ajaa täyden varmennuksen tagatulla commitilla, ja vain kun se läpäisee, se julkaisee crates.io:hon, Python Package Indexiin (PyPI), npm:ään, ghcr.io:hon, Model Context Protocol (MCP) -rekisteriin ja JetBrains Marketplaceen; sitten se tarkistaa, että jokainen kanava tarjoaa version, ja rakentaa kshana.dev:n tagista uudelleen. Kukaan ei aja komentoa <c3/> käsin. Vaiheet ja epäonnistuneen julkaisun uudelleenyritys ovat tiedostossa <a1><c4/></a1>.

seg-18ca89a2c573 = Changelogin ylläpito (pakollinen)

seg-1f7e1d73c2ef = Jokainen käyttäjälle näkyvä muutos päivittää tiedostoa <a1><c1/></a1>:

seg-1448e96afbbc = Lisää merkintä osion <b><c1/></b> alle oikeaan ryhmään (<c2/> / <c3/> / <c4/> / <c5/> / <c6/> / <c7/>).

seg-76ddc53c752e = Julkaisussa nimeä <c1/> uudelleen uudeksi <c2/>, aloita uusi <c3/>, nosta <c4/> tiedostossa <c5/> (jotta tulos-JSONin <c6/> vastaa), päivitä vertailulinkit alareunassa ja lisää tagi <c7/>.

seg-ed680e59377c = Pidä merkinnät ytimekkäinä ja käyttäjälähtöisinä; linkitä issuet/PR:t, kun siitä on hyötyä.

seg-fe83216ebeed = Pull request, joka muuttaa käyttäytymistä ilman changelog-merkintää, on keskeneräinen.

seg-776cd2ef0b0c = Vientivalvonta

seg-d0f1db9798a6 = PNT-kestävyys ja kvanttianturointi voivat sivuta kaksikäyttötuotteiden vientivalvontaa. Pidä julkinen repositorio yleisissä, julkaistuissa malleissa ja menetelmissä. Kaikki vientiarkaluonteista kestävyys-/harhautuksenestosyvyyttä muistuttava kuuluu yksityiseen overlayhin, ei tänne. Jos olet epävarma, kysy ennen kontribuutiota.

seg-506a29aafc12 = Lisenssi

seg-c0409a1226ca = Kshana on kaksoislisensoitu (AGPL-3.0 <b>tai</b> kaupallinen lisenssi, jonka myöntää Ashforde OÜ — ks. <a1><c1/></a1>). Jotta tämä toimisi edelleen, kontribuutioiden on oltava käytettävissä <b>molempien</b> lisenssien alla. Siksi kontribuoimalla hyväksyt, että:

seg-da7b02ac890c = kontribuutiosi lisensoidaan sisääntulevana lisenssillä <b>AGPL-3.0-only</b>; ja

seg-8d6ed0d3a17f = myönnät <b>myös yhtiölle Ashforde OÜ</b> pysyvän, maailmanlaajuisen, rojaltittoman, peruuttamattoman lisenssin käyttää, muokata ja <b>lisensoida uudelleen kontribuutiosi osana Kshanan kaupallisesti lisensoitua versiota</b> (eli jakaa se myös muilla kuin AGPL-pohjaisilla kaupallisilla ehdoilla). Säilytät tekijänoikeuden kontribuutioosi.

seg-3b1a0dd6b5aa = Tämä kevyt kaksoislisenssimyöntö — ei tekijänoikeuden luovutus — mahdollistaa sen, että projekti pysyy avoimena <em>ja</em> tarjoaa kaupallisen version. Jos et voi myöntää kohtaa ({ "2" }) (esimerkiksi työnantajan omistama koodi), sano se pull requestissasi ennen kontribuutiota.

seg-6630d0ac4ad5 = <b>Poikkeus: <c1/>.</b> Tämä hakemisto on lisensoitu <b>GPL-3.0-or-later</b> (ks. sen <c2/>) eikä kuulu kaupallisen lisenssin piiriin. Sen kontribuutiot lisensoidaan sisääntulevina <b>vain</b> GPL-3.0-or-later-lisenssillä; myöntö ({ "2" }) ei koske niitä.

seg-0a78a12b1188 = Allekirjoita jokainen commit (sign-off) ja vahvista siten <a1>Developer Certificate of Origin</a1>: <c1/> (lisää rivin <c2/>).

seg-9f86d8f58b17 = <s1>Edellinen</s1>Tietoturva

seg-fc760238e9a5 = <s1>Seuraava</s1>Hallinto
