# docs--kind-contact-schedule: translations (fi)

seg-99ef7c1d552c = Moottorin v{ $version } skenaariolaji, perhe <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>. Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu. Jokainen tässä oleva nimike on moottorin tai varmennusmatriisin; laji on MODELLED, ellei matriisi toisin sano (miten nimike ansaitaan: README:n Evidence-osio).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Alalinkin Es/N0 yhden satelliitin jokaisen ylilennon varrella yhden aseman yllä (EIRP, vapaan tilan vaimennus, kosekanttilain mukainen ilmakehän vaimennus, muut häviöt, G/T, Boltzmannin vakio, symbolinopeus), tehokkain DVB-S2 MODCOD, joka ylittää ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Näkyvyysylilennot (AOS, TCA, LOS, suurin näennäinen korkeuskulma, kesto) SGP4-elementtijoukosta WGS-84-aseman yllä validoidulla Maan kiertoradan laskentapolulla (IAU { "2006" }. Oraakkeli (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) ja Hipparchus { "4.0.3" }: TLEPropagator samoilla elementtijoukoilla TEME-koordinaatistossa, jonka Orekit rakentaa ilmoitetun määritelmän mukaan (sen IERS { "2010" } TOD kierrettynä GAST - GMST), ElevationDetector ja ElevationExtremumDetector ITURP834AtmosphericRefraction-taittumalla ja ilman sitä, sekä AngularAzEl ja AngularRadioRefractionModifier valoaikatapausta varten, ylitykset ja maksimi ratkaistuina Hipparchuksella; { "60" } tapausta (f

seg-35588ca8e9bb = <b>MODELLED</b> Alalinkin Es/N0 yhden satelliitin jokaisen ylilennon varrella yhden aseman yllä (EIRP, vapaan tilan vaimennus, kosekanttilain mukainen ilmakehän vaimennus, muut häviöt, G/T, Boltzmannin vakio,. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: suljetussa muodossa Table 5a K_bch:sta ja kehyspituuksista laskettu spektritehokkuus täsmää tehokkuuksiin, jotka Table { "13" } tulostaa (kirjoitusvirhetarkistus kynnystaulukolle); linkkibudjetin osat täsmäävät suljettuihin muotoihinsa; valinta on monotoninen Es/N0:n suhteen ja noudattaa marginaalia; ACM siirtää vähintään vakiokoodauksen datamäärän. Ylilentogeometria tulee erikseen VALIDATED a

seg-cd04f5662884 = MODELLED. (lajiluettelo (<c1/>))

seg-7f8667e8d8fe = DVB-S2-mukautuva koodaus ja modulaatio LEO-alalinkin ylilennon aikana on MODELLED, ei validoitu: tarkistettu omaa suljetun muodon / analyyttistä identiteettiään vastaan — havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Perhesivu: <a1>Tehtäväanalyysi, linkit ja avaruusoperaatiot</a1>

seg-72fd0321e4af = Aihesivu: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Lähde: <c1/>

seg-040d160b3fdd = <c1/> (skenaariotyyppi)

seg-be4e928a5865 = Maayhteyksien suunnittelu usealle satelliitille usealla asemalla: näennäiset yhteysikkunat (SGP4, IAU 2006/2000A Maan mukana pyörivä koordinaatisto, ITU-R P.834 -refraktio, valon kulkuaika), kunkin ohikulun DVB-S2 ACM -datamäärä (ETSI EN { "302" } 307-1 taulukon { "13" } kynnykset) ja ristiriidaton aikataulu (yksi satelliitti antennia kohti käännösajalla, yksi asema satelliittia kohti, prioriteettipainotettu toimitus rajattuna kunkin jonon kokoon) marginaaliarvoon perustuvalla ahneella menetelmällä, ensin tulleen palvelun lähtötasolla ja tarkalla branch and bound -haulla pienillä joukoilla, sekä ahneen menetelmän optimaalisuusvälillä. MODELLED.

seg-7a3fad06a9fc = Yksi ajo tiedostolla <c1/> tiivistyy seuraavasti: contact-schedule: { "3" } satellites x { "3" } stations over { "12" } h -> { "31" } candidate contacts, { "22" } scheduled; { "797266" } of { "860000" } Mbit delivered (MODELLED)

seg-a03d83f5866a = Valinnaiset kentät: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Esimerkki <c1/> asettaa muun muassa seuraavat:

seg-cade59b5a371 = Tulosmerkintä (moottorin oma): MODELLED — usean satelliitin ja usean aseman yhteyssuunnitelma: näennäiset yhteysikkunat (SGP4, IAU 2006/2000A, ITU-R P.834 -refraktio, valon kulkuaika), DVB-S2 ACM -datamäärä ohikulkua kohti selkeän taivaan linkkibudjetista (ETSI EN { "302" } 307-1 taulukon { "13" } kynnykset) ja ristiriitojen ratkaisu (yksi satelliitti antennia kohti käännösa

seg-e26b549579e2 = Kaavio, jonka moottori kirjoittaa tiedostolle scenarios/contact-schedule.toml, skenaariotyyppi contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Ehdokasyhteydet jokaisesta satelliitti–asema-ohikulusta ACM-datamäärineen; ristiriidat, joissa yksi antenni palvelisi kahta satelliittia käännösaikansa sisällä tai yksi satelliitti lähettäisi alalinkkinä kahdelle asemalle yhtä aikaa; prioriteettipainotettu deliver

seg-60431931082a = <b>MODELLED</b> Ehdokasyhteydet jokaisesta satelliitti–asema-ohikulusta ACM-datamäärineen; ristiriidat, joissa yksi antenni palvelisi kahta satelliittia käännösaikansa sisällä tai o. Oraakkeli (InternalConsistency): Sisäinen johdonmukaisuus: tarkka branch and bound on yhtäpitävä raa'an voiman luettelointiin pienillä satunnaisjoukoilla, jokainen suunnitelma tarkistetaan toteuttamiskelpoiseksi ristiriitasääntöjä vastaan, eikä ahne menetelmä koskaan voita tarkkaa optimia. MITÄ EI OLE: ulkoista aikatauluttajaa tai operatiivista suunnitelmaa ei ole verrattu; yhteydet otetaan kokonaisina (ei jakamista), jono on kiinteä ikkunan alussa, kiinteän käännösajan ylittävää kääntöaikaa ja laitteen sisäistä s

seg-9941b9f6d4a8 = MODELLED — usean satelliitin ja usean aseman yhteyssuunnitelma: näennäiset yhteysikkunat (SGP4, IAU 2006/2000A, ITU-R P.834 -refraktio, valon kulkuaika), DVB-S2 ACM -datamäärä ohikulkua kohti selkeän taivaan linkkibudjetista (ETSI EN { "302" } 307-1 taulukon { "13" } kynnykset) ja ristiriitojen ratkaisu (yksi satelliitti antennia kohti käännösajalla, yksi asema satelliittia kohti) marginaaliarvoon perustuvalla ahneella menetelmällä, joka on tarkistettu tarkkaa branch and bound -hakua vastaan; ei sadevaimennusta, (tulos <c1/>)

seg-f8ef88bc82b5 = Jokainen alla oleva luku on ILLUSTRATIVE: ei minkään operaattorin ratoja, asemia tai linkkibudjettia. MODELLED: aikatauluttaja on tarkistettu sen oman tarkan ratkaisijan, ei ulkoisen työkalun, avulla. (skenaariotiedoston kommentti, rivit { "11" }–{ "12" })

seg-fe2b4799b397 = Usean satelliitin ja usean aseman maayhteysaikataulutus ristiriitojen ratkaisulla on MODELLED, ei validoitu: se on tarkistettu sen omaa suljetun muodon / analyyttistä identiteettiä vasten — se havaitsee kirjoitus- ja kerroinvirheet, mutta ei ole ulkoinen oraakkeli. (varmennusmatriisi (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Edellinen</s1>constellation-design

seg-3784be57d6df = <s1>Seuraava</s1>earth-gnss-lunar
