# docs--compliance-mapping: translations (fi)

seg-6555ff9a6d8e = Tuloste

seg-2247a2344710 = Merkitys

seg-d6476863f862 = Ominaisuus

seg-ad856ad710eb = Tila

seg-8d216d42c776 = Vastaanottimen lokin luottamusarviointi

seg-ff808ce8ec48 = Vaihtoehtoiset ja monimuotoiset PNT-lähteet

seg-3621a68a508c = Toistettavan ajon alkuperätieto

seg-50fe2a3ff712 = Eheyden valvonta ja suojaustasot

seg-554a16dc7965 = Lähde: <c1/>

seg-76db63e8d2de = Ostajien ja vastaanotinvalmistajien on vastattava julkisten kestävyysviitekehysten vaatimuksista. Tämä kansio kartoittaa, mitä Kshana laskee ja tallentaa näihin viitekehyksiin, rivi riviltä, ja <c1/> täyttää kartoituksen niistä ajoista, jotka sinulla todella on.

seg-e22a3aca9550 = <b>Sanamuoto.</b> Kshana-tuotokset <em>tukevat todisteita</em> vaatimukselle. Ne eivät ole minkään tuotteen luokitus tai hyväksyntä, eikä mikään näistä tiedostoista ole arviointielimen lausunto; Kshana ei ole sellainen. Vaatimusteksti on parafraasi, ei koskaan toisto.

seg-2602c3f5aff6 = Viitekehys

seg-245fe1f87b08 = Tiedosto

seg-d104ce416298 = US DHS Resilient PNT Conformance Framework, v2.0

seg-0f7279ffb619 = IMO:n GNSS-häiriöitä koskeva ohje aluksille

seg-f318176b86de = EASA:n GNSS-häiriöitä koskeva ohje ilmailulle

seg-7939ac1eea3b = EU:n NIS2-direktiivi, artikla { "21" }

seg-f2eccc9b815f = EN { "16803" } (maksullinen standardi; vain osan ja luettelossa näkyvien lausekenumeroiden mukaan)

seg-4970f6c15605 = NIST IR 8323r1, Foundational PNT Profile (tammikuu { "2023" })

seg-499fc17fb83a = <b>Standardipaketit</b> ({ "0.38" }) muuttavat viitekehyksen pisteytetyiksi skenaarioiksi: jokaisessa paketissa on skenaarioita, ennen ajoa asetetut kynnykset ja rivit, joille se tukee todisteita. <c1/> näyttää ne.

seg-9c0eb89a2fbe = Paketti

seg-191baf9f2738 = DHS Resilient PNT Conformance Framework, testiprofiilit tasoille { "1" }–{ "4" }

seg-13e63b993f26 = IMO MSC.1/Circ.1575, aluksen PNT-datan käsittely: tarkkuustasot ja eheys

seg-aa77ffe0acbf = ICAO Doc { "9849" } Appendix F, GNSS-häiriöiden valvonta, arviointi ja lievennys

seg-b9387be0e4f1 = Jokainen tiedosto listaa lähdeasiakirjansa version, URL:n, lukupäivän sekä sen, mitä tarkistettiin ja mitä ei. Lähteet luettiin 2026-10-09 (NIST-profiili 2026-10-18; EASA:n tiedote ja EN { "16803" } -luettelosivut tarkistettiin uudelleen 2026-10-10). Jos lähde voitiin lukea vain peilin tai luettelosivun kautta, tiedosto kertoo sen.

seg-e98e25897176 = Kolmen pisteytetyn standardipaketin jokainen testi, moottorin v{ $version } oikeista ajoista (`kshana standards-pack run`): dhs-rpcf: { "6" } täyttyi, { "1" } ei täyttynyt, { "2" } tarvitsee syötteen; imo-circ-1575: { "1" } täyttyi, { "4" } ei täyttynyt, { "2" } tarvitsee syötteen; icao-doc9849-appf: { "6" } täyttyi, { "0" } ei täyttynyt, { "2" } tarvitsee syötteen. Yhteensä { "13" } täyttyi, { "5" } ei täyttynyt ja { "6" } tarvitsee syötteen, jota moottorilla ei ole (vastaanottimen loki tai laitteiston dokumentaatio). Jokainen kynnys asetettiin ennen ajoa; täyttämättä jäänyt kynnys kirjataan täyttämättä jääneeksi. Täyttynyt kynnys kertoo, että mallinnettu skenaario täytti ilmoitetun kynnyksen, ei mitään tuotteesta. Paketit tukevat todisteita riveille, joihin ne viittaavat; ne eivät ole arviointi. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu; sitä ei saa käyttää ainoana perusteena navigointia tai turvallisuutta koskevalle päätökselle.

seg-092dd691ca17 = Raportti

seg-10fac3e641e0 = kirjoittaa <c1/> ja <c2/> (<c3/> muuttaa nimen). Syötteet ovat aiempien ajojen tulostiedostoja: skenaarioajo kirjoittaa tuloksen <c4/> tiedoston <c5/> viereen, ja <c6/> kirjoittaa omansa. Kunkin ajon laji luetaan tuloksen vieressä olevasta skenaariotiedostosta, receiver-trust-tuloksen sisällöstä tai ylätason kentästä <c7/>, ja sen on oltava moottorin tuntema laji. Tulos listataan ”ei käytetyksi” syyn kanssa eikä se vaikuta mihinkään, kun sen lajia ei löydy, laji ei ole tunnettu tai viereinen skenaario ja tuloksen oma <c8/> ovat ristiriidassa. (Tuloksen <c9/> ja skenaariotiedoston tiiviste eivät ole vertailtavia: moottori laskee ensimmäisen jäsennetystä skenaariostaan ja tiedoston tiiviste lasketaan tekstistä, joten ne ovat eri suureita.)

seg-464351dcdcc3 = <b>Pelkkä lajinimiö ei ole todiste.</b> Ajo lasketaan ominaisuudelle vain, jos sen tulos sisältää myös ne kentät, joita kyseinen laji kirjoittaa (esimerkiksi lajin <c1/> tulos tarvitsee laatumittarinsa ja epookkikohtaiset rivit; lajin <c2/> tulos tarvitsee näytemääränsä). Kentät on lueteltu tiedostossa <c3/> (<c4/>), eikä tulosta, josta yksi puuttuu, lasketa. Tiivistettä, joka ei ole heksadesimaali, ei raportoida tiivisteenä. Receiver-trust-tulos, jonka määrät eivät ole kokonaislukuja tai jonka havaittu tai yhtäpitävä määrä ylittää sen arvioitavissa olevan määrän, jätetään pois ja listataan ”ei käytetyksi”.

seg-5a316d97f37b = Jokaiselle riville raportti antaa jonkin seuraavista:

seg-2243532bd26b = jokaisella rivin nimeämällä ominaisuudella on vähintään yksi ajo joukossa

seg-e905ae20cec1 = joillakin on

seg-e23d6dfc4a00 = millään ei ole

seg-cf223ce076ce = mikään Kshana-tuloste ei koske riviä

seg-ec76997fb4d4 = Aukkosarake tulostetaan jokaiselle riville, myös todistetuille: ajo, joka tukee todisteita ominaisuudelle, jättää silti suurimman osan vaatimuksesta muun todistusaineiston varaan. Raportti toistaa sanamuotosäännön alussaan. <c1/> tulostaa staattiset taulukot ja <c2/> lähdeluettelon.

seg-f1c508a908ad = Receiver-trust-ajot lisäävät myös ilmoittamansa määrät (havaitut tapahtumat arvioitavissa olevista, yhtäpitävät ennusteet arvioitavissa olevista). Nämä kuvaavat sitä lokia, joka on pisteytetty ennen ajoa ilmoitettuja tapahtumia ja toleransseja vastaan, ja ne raportoidaan sellaisina kuin ajo ne ilmoittaa.

seg-662b717575e0 = Ajolajit

seg-4377e24c36f5 = todellisen vastaanottimen oman lokin epookkikohtainen luottamustila, hälytysajat ja yhtäpitävyys ennen ajoa ilmoitettujen tapahtumien kanssa

seg-766182e85848 = Häirinnän linkkibudjettivaikutukset

seg-6bee09017be6 = kantoaalto-kohinatiheys ja lukitustila satelliittia kohden ilmoitetulla häirintägeometrialla

seg-213117f2877a = jamming, lunar-jamming, conflict-resilience

seg-48fb757a45fc = Harhautuksen ja meaconingin havaitseminen

seg-2e4a3355a936 = ilmaisimen päätökset ja ilmaisimen erottelukyky ilmoitetun harhautushyökkäyksen alla

seg-6fdf939cef5c = spoof, spoof-detect, impairment-eval

seg-e9a55e5a015b = suojaustasot, saatavuus hälytysrajoja vastaan ja vianhavaitsemistulokset

seg-8799ac418ef0 = integrity, araim-reference-check, lunar-integrity

seg-6344bf03463c = Holdover ja coasting

seg-a643345646c3 = paikka- tai aikavirheen kasvu, kun GNSS on estetty, ilmoitettua kynnystä vastaan

seg-7483fbb49a12 = clock, inertial, gnss-ins, ins-trn-coast, hybrid, hybrid-ukf, fusion, timetransfer, quantum-gnss-free-nav, quantum-time-transfer

seg-97e06c8a9b7f = navigointi- tai ajoitussuorituskyky lähteistä, jotka ovat riippumattomia ensisijaisesta GNSS-kaistasta

seg-0cb972a92a4c = combined-altpnt, terrain-nav, terrain-slam, gravity-map, leo-pass, leo-pvt, leo-pnt-chain, hybrid-optical-rf, ntn-positioning, hybrid, fusion

seg-25291db2798d = Kestävyyspisteytys uhkaensemblien yli

seg-9eef8dd0d9b9 = selviytymis- ja kestävyyssuhteet uhkavektoria kohden ilmoitetun ensemblen yli, oletukset ilmoitettuina

seg-bdaa039247bd = conflict-resilience, campaign

seg-e4be26a0cc63 = skenaariotiiviste, moottorin versio ja siemenluku mukana jokaisessa tuloksessa, jotta ajo voidaan toistaa

seg-89edc36c3560 = mikä tahansa ajo, jonka tulos sisältää kentän <c1/>

seg-488aeabdc552 = <s1>Edellinen</s1>Vastaanottimen ajaminen skenaariota vastaan

seg-53a872636d5a = <s1>Seuraava</s1>US DHS:n PNT-kestävyysviitekehys
