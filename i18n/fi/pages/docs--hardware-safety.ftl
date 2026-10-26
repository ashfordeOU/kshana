# docs--hardware-safety: translations (fi)

seg-fdbb9db68f1d = ei mitään

seg-2015f437e669 = Lähde: <c1/>

seg-10c7eaab58c5 = Laitteistoturvallisuus: mitä Kshana tekee laitteistolla ja mitä se ei koskaan tee

seg-fe4873962140 = <b>Tila: omistajan juridinen tarkastus kesken.</b> Alla olevat juridiset huomautukset ovat ylläpitäjien tulkinta julkisista lähteistä, ja ne on kirjoitettu, jotta käyttäjä tietää, missä rajat ovat. Ne eivät ole oikeudellista neuvontaa, lakimies ei ole tarkistanut niitä, ja lainsäädäntö vaihtelee maittain. Lue ne syynä kysyä lakimieheltä, älä lupana.

seg-bd2fbb355834 = Kshana on ohjeellinen ohjelmisto tutkimukseen, simulointiin ja testaukseen. Se ei ole tyyppihyväksytty laite, eikä se arvioi tai hyväksy vastaanotinta, kelloa tai laboratoriota. Katso ohjeellisuutta koskeva lausunto README-tiedostosta.

seg-f27c286787b1 = Sääntö

seg-88638e41faab = Vastaanotto on tuote. Lähettäminen ei koskaan kuulu avoimeen moottoriin.

seg-614d381dd0d0 = Kshana ei sisällä lähetintä ohjaavaa koodia. SDR-lähetyspolkua ei ole (ei UHD-, HackRF-, bladeRF- eikä Soapy-lähetyskutsua), eikä mitään häirinnän tai harhautuksen aaltomuotoa kirjoiteta toistoa varten tarkoitettuun tiedostoon.

seg-2e370a1c6c4c = Kshanan kirjoittamat tiedostot (IQ-kohtaukset, SigMF-tallenteet ja ION-tallenteet (<c1/>), NMEA- ja bench-viennit) kuvaavat <b>simuloituja, sallittuja</b> signaaleja tai liikettä, ja Kshanan kohtaukselle kirjoittama metadata kertoo, että sen on kirjoittanut <c2/> (ION-tiedoston (<c3/>) kommentti kertoo, että kyseessä on simuloitu kohtaus, ei tallenne).

seg-8ce652bc1af6 = Kun koe tarvitsee RF-signaalia laboratoriopöydällä, sen tuottaa <b>käyttäjän oma laitteisto</b> käyttäjän omassa kotelossa käyttäjän oman luvan nojalla. Kshana kirjaa sen, minkä käyttäjä sanoo tehdyn, eikä koskaan päättele sitä.

seg-c74fc5d82071 = Vaiheet

seg-01e7633921dc = Jokainen vaihe nimeää, mitä Kshana tekee, mitä laitteistoa on mukana, kuka lähettää RF-signaalia (jos kukaan), ja portin, jonka on täytyttävä, ennen kuin Kshana käsittelee tuloksen todisteena.

seg-324e16b11186 = Vaihe

seg-bb269645d988 = Kshanan rooli

seg-76c0861cbe83 = Laitteisto

seg-92ab27525ed1 = RF-lähetys

seg-c822f981cfcf = Portti

seg-00727bb577f9 = Tila versiossa { "0.38" }

seg-1c566ec98a03 = Tiedostot: toistolokit, IQ, bench-viennit, reaaliaikainen NMEA tai UBX stdin-, TCP- tai UDP-kautta

seg-0435986aa760 = toimitettu

seg-56b9a4399108 = Passiivinen vastaanotto: vastaanottimet vain luku -tilassa; ajoituslokit (linuxptp, chrony, TICC); IMU-CSV; <c1/> kasvavalla SigMF-tiedostolla

seg-608fc0a99107 = käyttäjän vastaanottimet, grandmaster-kello, SDR vastaanottotilassa

seg-786d9e5ccf93 = vastaanottimen jokainen asetusten kirjoitus vaatii nimenomaisen valitsimen <c1/>; oletus on vain luku

seg-ab8874046283 = osittain toimitettu: ajoituslokien formaatit, <c1/>, <c2/>; sarjaporttivastaanottimen syöte on suunniteltu

seg-6b0a194d3f64 = Laboratorion orkestrointi ilman Kshanan RF-lähetystä: testiolosuhteiden määrittely, operaattorin vaiheet (antennin irrotus, simulaattorin käynnistys) kehotettuna ja aikaleimattuna, kierrospisteytys ja todisteet

seg-8e2847bce9ac = laboratorion omat simulaattorit, suojatut kotelot

seg-121fe22c92ec = vain <b>laboratorion</b> simulaattorilta, johdettuna

seg-0a704c5443c5 = allekirjoitettu <c1/> (jäljempänä) kirjataan todistepakettiin; Kshana kieltäytyy pisteyttämästä laboratorioajoa ilman sitä

seg-9e94d44cd197 = kirjaus on toteutettu todistepaketeissa; kieltäytyminen pisteyttää ilman sitä ei vielä (laboratorioajokomentoa ei ole)

seg-ee5333e346ad = <b>Sallittujen</b> GNSS-IQ-kohtausten johdettu toisto: Kshana kirjoittaa kohtaustiedoston, ja käyttäjä toistaa sen omalla työkalullaan kaapelin kautta, jossa on vaimentimet ja testattava laite RF-kotelossa

seg-fa5b0f1b41f7 = käyttäjän SDR, vaimentimet ja kotelo

seg-9049203a2a6e = vain johdettuna, käyttäjän vastuulla

seg-b4392e583cb8 = avoimessa moottorissa ei ole lähetyskoodia; häirinnän ja harhautuksen aaltomuodot jäävät soveltamisalan ulkopuolelle; vientivalvonnan tarkastus; lakimies

seg-ced2afbf108f = ei avoimessa moottorissa; kaupallisen version kohde, joka tehdään lakimiehen kanssa

seg-0f8a0fce4d20 = Reaaliaikainen suljetun silmukan RF-laitteisto silmukassa (hardware-in-the-loop)

seg-d109f8e36ce8 = kumppanin laitteisto

seg-fb26b352f56e = kumppani

seg-38c768d5faa7 = integroi sen sijaan vaiheen { "2" } määrittelyn kautta

seg-458f37b807ba = ei suunniteltu

seg-2e59d363e31b = ”Toimitettu” tarkoittaa, että koodi on tässä julkaisussa. Mikään tämän taulukon kohta ei sano, että jotakin vaihetta olisi käytetty minkään kumppanin, laboratorion tai viranomaisen kanssa; yhtäkään ei ole käytetty.

seg-1524fb5b0aba = Periaatteet

seg-82b8ed15bbe6 = Vastaanotto on tuote, eikä lähettäminen koskaan kuulu avoimeen koodiin.

seg-63c000eccfc2 = Jokaisesta laitteistoistunnosta syntyy todistepaketti, jossa on syötteiden, olosuhteiden ja käytettyjen kynnysten tiivisteet.

seg-63cc5d9513ff = Johdettu tai suojattu vahvistus kirjataan, ei koskaan päätellä.

seg-da1e4f5da956 = Laitteistosta saadut luvut pysyvät <b>MODELLED</b>-tasolla, kunnes riippumaton ulkoinen oraakkeli on samaa mieltä (esimerkiksi laboratorion todellinen reitti tai vertailukello). Ennalta rekisteröityä kynnystä ei löysennetä ajon jälkeen.

seg-d8e445427d02 = Hallitun kuvion antennit, inertiayksiköt ja sirumittakaavan atomikellot käsitellään datalähteinä (kuviot, lokit, julkaistut vakauskäyrät), ei laitteina, joita Kshana ohjaa.

seg-7a22a9591fa3 = Sanamuoto: tulos on ”mitattu maskia vasten” tai ”tukee todisteita (supports evidence for)” jostakin vaatimuksesta. Kshana ei sano, että laite täyttää standardin, eikä kukaan ole arvioinut tai hyväksynyt sitä.

seg-913509e5d6b2 = Juridiset huomautukset (omistajan juridinen tarkastus kesken)

seg-c18b68936406 = GNSS-signaalien vastaanotto on laillista lähes kaikkialla. Lähettäminen GNSS-kaistoilla ei ole.

seg-070d8a8d5494 = <b>Yhdysvallat.</b> Tahallinen radioviestinnän häiritseminen on kielletty säännöksellä { "47" } U.S.C. §{ "333" }, ja FCC ryhtyy täytäntöönpanotoimiin häirintälaitteita vastaan (<a1>https://www.fcc.gov/general/jammer-enforcement</a1>). Laboratoriopöydältä lähetetty signaali voi ulottua pöytää kauemmas.

seg-336b48c6f5f2 = <b>Muualla.</b> Ylläpitäjät eivät ole tarkastaneet muiden maiden lainsäädäntöä. gps-sdr-simin ympärillä oleva yhteisö toteaa, että sen tulosteen lähettäminen on lailla kielletty useimmissa maissa; pidä tätä työoletuksena kaikkialla, missä lakimies ei ole sanonut toisin.

seg-8d31cbd38718 = <b>Suojattu tai johdettu kokoonpano on turvatoimi, ei lupa.</b> Jäljempänä oleva vahvistus kirjaa turvatoimen, jonka operaattori sanoo olleen käytössä. Se ei tee lähetyksestä laillista.

seg-7373bfd21035 = <b>Tallentaminen.</b> Radiosignaalien tallentaminen voi herättää yksityisyyteen ja laillisuuteen liittyviä kysymyksiä joissakin paikoissa. <c1/> ja kaikki tallennusohjeet ovat vain vastaanottavia, ja operaattori vastaa siitä, missä ja mitä hän tallentaa.

seg-2edf9b14e62c = <b>Vientivalvonta.</b> Signaaligeneraattoreita ohjaava hardware-in-the-loop-ohjelmisto voi kuulua vientivalvontasääntöjen piiriin. Siksi vaihe { "3" } on avoimen moottorin ulkopuolella.

seg-bcd59f201022 = <b>Mikään tässä ei ole suositus tai sopimus.</b> Mitään sääntelyviranomaista, testialuetta, laboratoriota tai toimittajaa ei ole konsultoitu tästä asiakirjasta, eikä kukaan ole sopinut mistään sen sisällöstä.

seg-81091020e648 = Kenttä <c1/>

seg-64918fd6895d = Vaiheesta { "2" } alkaen ajoon, jossa oli mukana laboratoriolaitteita, liittyy olio <c1/>, joka kirjataan todistepakettiin syötteiden tiivisteiden viereen. Se on nimetyn operaattorin lausuma, ei mittaus, eikä Kshana varmenna sitä.

seg-3bf153c63fa3 = Mitä on toteutettu versiossa { "0.38" }:

seg-bf212e141046 = <c1/> tarkistaa tiedoston ja kirjaa vahvistuksen paketin tiedostoon <c2/>. Manifesti on paketin Ed25519-allekirjoituksen kattama, joten kirjausta ei voi muokata rikkomatta varmennusta. Sama on käytettävissä Python-funktion <c4/> argumenttina <c3/> ja MCP-työkalun <c6/> argumenttina <c5/> (selainversio ei luo paketteja).

seg-431036f13a37 = Paketti, joka on tehty ilman vahvistusta, on tavu tavulta sama kuin ennen.

seg-4360b8fbdafb = <c1/> raportoi vahvistuksen ja toteaa sen olevan ”nimetyn operaattorin vahvistama; Kshana ei ole varmentanut” (attested by the named operator; not verified by Kshana).

seg-438bbe788314 = Vahvistus, joka on puutteellinen tai jonka <c1/> ei ole <c2/> eikä <c3/> (ilmateitse toimivaa kokoonpanoa ei hyväksytä laboratorioajoksi), hylätään, eikä pakettia tehdä.

seg-c8c40ed88dde = Mitä <b>ei</b> ole vielä toteutettu: vaiheen { "2" } sääntö, jonka mukaan Kshana kieltäytyy <em>pisteyttämästä</em> laboratorioajoa, jolla ei ole vahvistusta. Mikään komento ei ota laboratorioajolippua versiossa { "0.38" }, joten kieltäydyttävää ei ole; sääntö tulee laboratorion orkestrointikomentojen mukana. Vahvistus kirjaa operaattorin lausuman turvatoimesta. Se ei tee mistään lähetyksestä laillista eikä muuta tuloksen merkintää: pisteytetty laboratorioajo on MODELLED, ellei ulkoinen oraakkeli ole samaa mieltä.

seg-b0db377bce58 = Mitä tämä tarkoittaa osallistujalle

seg-c2e215edd86c = Älä lisää lähetyspolkua, lähetysriippuvuutta tai lähetysesimerkkiä avoimeen moottoriin.

seg-452b44a9ca8a = Älä lisää aaltomuotogeneraattoria, jonka tuloste on toistoa varten tarkoitettu häirintä- tai harhautussignaali.

seg-4df4d15a5f1c = Uudet laitteistosyötteet ovat oletuksena vain luku -tilassa; kirjoitus vaatii nimenomaisen lipun ja rivin tässä tiedostossa.

seg-ee5f1fa9b822 = Uusi laitteistoon koskeva komento tulee jokaiselle pinnalle tai merkitään N/A:ksi perusteluineen tiedostossa <a1><c1/></a1>, ja sen vaihe ilmoitetaan tässä.

seg-7d65c3565acd = <s1>Edellinen</s1>Kellolokien formaatit

seg-82eb53d4efbd = <s1>Seuraava</s1>Eheys ja tietoturva

seg-8a78e520fc9e = Kenttä lab-attestation
