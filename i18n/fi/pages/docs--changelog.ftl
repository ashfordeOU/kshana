# docs--changelog: translations (fi)

seg-9a2a5f0a8a02 = Aurinkokunta

seg-20db2c79b998 = Validoitu

seg-a20b4a6e8f53 = sirumittakaavan atomikello

seg-49a994d77d2f = lämpötilakompensoitu kideoskillaattori

seg-2247a2344710 = Merkitys

seg-5770537524d3 = Alue

seg-40d4fc0d3922 = Lähde: <c1/>

seg-7333b85d448f = Kaikki Kshanan merkittävät muutokset on dokumentoitu tässä.

seg-bbc8f38627f1 = Muoto perustuu <a1>Keep a Changelog</a1> -ohjeeseen, ja tämä projekti noudattaa <a2>Semantic Versioning</a2> -versiointia. Kun projekti on vielä ennen versiota 1.0, julkinen skenaario- ja tulosskeema voi yhä muuttua; yhteensopivuutta rikkovat muutokset mainitaan erikseen.

seg-985f7b4c001a = Julkaisematon

seg-66749e5be121 = [{ $version }] - 2026-10-22

seg-a2f583aadd0b = Ei uusia ominaisuuksia: yksi komentorivikorjaus, riippuvuuspäivityksiä ristiinvalidointityökaluissa ja dokumentaatiota. Moottorin tulokset ovat muuttumattomia versioon { "0.38.0" } nähden.

seg-c9a8a5898ced = Korjattu

seg-3cc8ba4d1be6 = Komentorivi päättyy hiljaa tilakoodiin { "141" }, kun sen vakiotuloste sulkeutuu (<c1/>), sen sijaan että se kaatuisi virheeseen "failed printing to stdout: Broken pipe". { "141" } on { "128" } plus SIGPIPE, tila, jonka komentotulkki ilmoittaa komennolle <c2/>. Vain suljettu putki käsitellään: täysi levy tai mikä tahansa muu kirjoitusvirhe ilmoittaa yhä itsensä, ja suljettuun pistokkeeseen kirjoittava elävä syöte saa yhä kirjoitusvirheensä. <c3/> sulkee lukijan ennen ohjelman käynnistymistä, joten ensimmäinen kirjoitus epäonnistuu joka ajolla.

seg-2a47e785cc1d = Riippuvuuspäivityksiä ristiinvalidointityökaluissa (<c1/>); ei muutoksia toimitettuihin crateihin, wheel-paketteihin eikä pakettiin.

seg-9df898fb24be = <c1/> { "0.9.10" } -> { "0.9.11" } (RUSTSEC-2026-0186) ANISE-ristiintarkistuksen lukkotiedostoissa (<c2/>, <c3/>); lukot synkronoivat myös uudelleen repositorion sisäisen polkuriippuvuuden <c4/>.

seg-835e9d6058f8 = <c1/> { "12.3.0" } -> { "13.0.0" } ja <c2/> { "2026.7.22" } -> { "2026.10.19" } oraakkeliympäristön kiinnityksissä (<c3/>, <c4/>): korjatut julkaisut kahdeksaan pillow-tietoturvailmoitukseen ja yhteen certifi-tietoturvailmoitukseen.

seg-902fc421a851 = <c1/>, README ja tämä tiedosto luettelevat jokaisen kshana-benchin kynnyksen, joka on NOT MET, sellaisena kuin se on kirjattu tiedostoon <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } vähintään { "0.80" } vastaan testijaolla), <b>D1</b> (suurin ero { "0.0301" }) ja <b>tehtävä (b) R1</b> (siirretty, ei ajettu uudelleen). Yhtään kynnystä ei ole löysennetty.

seg-44d9c9622c24 = README:n täydentämiskierros: sisällysluettelo; skenaariolajit ryhmiteltynä perheisiin, kullakin sivu hakemistossa <c1/> (moottorin kuvaus ja kentät, esimerkkiajon syötteet ja tulokset, kirjanpitorivit ja oraakkelit, ajon raportin ilmoittamat rajoitukset ja moottorin kirjoittama kaavio), yhteenvetosivu perhettä kohti, kaikki indeksoituna tiedostolla <c2/>; jokainen komento tiedostossa <c3/>; jokainen pinta, lisäosan komento, taito ja Studion sivu tiedostossa <c4/>; jokainen kyvykkyysalue tiedostossa <c5/>; upotetut Mermaid-kaaviot (järjestelmän yleiskuva, pinnat, sisäsilmukka, vastaanottimen luottamus, laboratorion edestakaiskierros, Studio, testi- ja julkaisuvirta, moduulikartta, jakelu). Kirjoittanut <c6/>, <c7/> ja <c8/>; auditoinut <c9/>; vartioi <c10/>, joka kiinnittää myös jokaisen merkinnän kuvauksen ja kentät moottoriin.

seg-b953186d5726 = <c1/>: renderöi Mermaid-kaavion SVG:ksi ja PNG:ksi Linuxilla ja päivittää renderöintitietueen.

seg-68e19f94faed = README: avaruuskäyttäjän ja Kuun kuvat käyttivät polkuja suhteessa hakemistoon <c1/>, joten ne eivät latautuneet README:stä; yksi linkki osoitti tiedostoon <c2/>.

seg-850e1574e2d6 = Poistettu kaksi vanhentunutta käsin kopioitua kaaviotiedostoa (<c1/>, <c2/>), joita mikään sivu ei käyttänyt ja jotka eivät enää vastanneet moottoria; <c3/> sisältää nykyiset kaaviot.

seg-033d52126d8a = Lisätty

seg-090bf5ae96b6 = <b>GNSS tähdistön tuolla puolen (<c1/>).</b> Uusi skenaariolaji avaruusaluksille GNSS-ratojen yläpuolella, ympärillä ja ulkopuolella (<a1><c2/></a1>): yhden ja neljän signaalin saatavuus, katkojen kestot, C/N0, DOP sekä pääkeila- ja sivukeilalinkit GPS:lle, GLONASSille, Galileolle, BDS:lle, QZSS:lle ja NavIC:lle kuorella tai LEO-, MEO-, GEO-, HEO- ja Kuuhun siirtymäradoilla; julkaisun, parametriset tai käyttäjän toimittamat lähetyskuviot; reunasäteen ionosfääri-, plasmasfääri- ja ilmakehämalli; heikon signaalin vastaanottimen suunnittelu; aluksella toimiva GNSS-laajennettu Kalman-suodatin HEO:lle ja Kuuhun siirtymälle; sekä muodostelman suhteellinen navigointi. Verrattu ICG:n Space Service Volume -julkaisuun ennen ajoa tallennetun ennakkorekisteröinnin mukaisesti: vähimmäissäteilytehovakiot ja Kuun kynnys ovat samaa mieltä, muut kynnykset eivät täyty ennakkorekisteröidyllä tulkinnalla (lähes kaikki julkaisun epäjohdonmukaisen GLONASS-keilakulman kautta), eikä parametrinen sivukeilakorvike toista mitattuja GPS-paneelin kuvioita. Kaikki pysyy MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Kuun kiertorata ja pinta navigointi- ja geodeettisena infrastruktuurina (<c1/>).</b> Uusi skenaariolaji viidellä asetuksella <c2/> valittavalla tutkimuksella (<a1><c3/></a1>): lähes suoraviivaisella halokiertoradalla toimivan aluksella tehtävän Maa-GNSS-radanmäärityksen johdonmukaisuus riippumatonta maanpäällistä etäisyys- ja etäisyysnopeusmääritystä vasten; yhteinen pinta-aseman ja kiertäjän kaksoiserotettu kantoaallon vaihe LAMBDA-kokonaislukuratkaisulla; seitsenparametrisen Kuun datumin Fisherin informaatio kiertäjältä pinnalle -etäisyyksillä ja ilman niitä; GNSS-, VLBI- ja laseretäisyysmittausten tekniikoiden väliset siirtymät paikallista sidosta vasten; sekä herkkyys suureille h2, k2, l2 ja fysikaaliselle libraatiolle. MODELLED, ILLUSTRATIVE-syötteillä: numeriikka tarkistetaan riippumattomilla numpy- ja scipy-ohjelmilla, eikä mitään verrata Kuun suureen mittaukseen. Kynnykset kiinnitettiin tiedostossa <c4/> ja kahdessa ilmoitetussa muutoksessa. Kolme on NOT MET ja kukin on kiinnitetty testillä, joka vahvistaa epäonnistumisen: C3 (syötettyä voimavirhettä ei havaita ennakkorekisteröidyllä osuudella), Q3 (bootstrapattu onnistumisaste poikkeaa numpy-oraakkelista { "1.7e-6" } kynnyksen { "1e-9" } sijaan, LAMBDAn normaalijakauman kertymäfunktion approksimaatiosta) ja G3:n jälkipuolisko (etäisyysmittausperheen lisääminen ei aina pienennä pseudokäänteismatriisin jälkeä). Loput täyttyvät (<a2><c5/></a2>).

seg-022859135e79 = <b>Kuudes artikkeli Research-taulukossa.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) osoittaa, että tarkkuuden heikkenemiskerroin on määrittelemätön pelkkään etäisyyteen perustuvalle kuunläheiselle seurannalle, ja käyttää sen sijaan havaittavuusgramiania neljällä tasomaisella kaukaisella vastakulkuisella radalla: pelkkä etäisyys on astetta { "2" } { "4" }:stä hetkellä ja tarvitsee noin { "2.09" } h:n kaaren, etäisyysnopeus (Doppler) antaa asteen { "4" } heti, ja aseman estimointi yhdessä satelliittitilojen ja kellojen kanssa jää yhden asteen vajaaksi ilman ulkoista interferometristä havaintosuuretta. Sen luvut luo uudelleen laji <c1/> (<c2/>); <c3/> testaa kynnyksen riippumattomalla estimaattorilla. README:n tutkimuskortti, crate-, npm- ja PyPI-README:t sekä generaattori sisältävät sen.

seg-d74a1b2dcb38 = Neutraali erotuomari, mitattavaksi tehtynä.

seg-bf568567fe06 = <c1/> lukee julkaistun NPRA Jammertest -luettelon ja lähetyssuunnitelman ajoitettuna totuutena (luettelotunnisteet säilytetty) ja <c2/> pisteyttää vastaanottimen lokin sitä vastaan testi kerrallaan (havaitsemisviive, havaitsematta jääneet hälytykset, väärät hälytykset, palautumisaika), valinnaisesti allekirjoitettuna todistepakettina (<a1><c3/></a1>). Pisteytyskynnykset ennakkorekisteröitiin ennen yhtään pisteytettyä ajoa (<c4/>). JammerTest { "2024" } -aineistolla (haettu, ei koskaan mukana) ennakkorekisteröity vähimmäisdatasääntö epäonnistui sekä ensimmäisellä ajolla että datankäsittelyn revisiossa, joten mikään kynnys ei ole arvioitavissa eikä mitään väitetä; molemmat ajot on kirjattu ja kiinnitetty. MODELLED: aikataulu on aineiston kirjatut ikkunat, ei tallennettuja lähetysaikoja. { "2025" } SimulaMet NMEA -aineistoa ei sovitettu (sen sivulla ei ilmoiteta lisenssiä).

seg-0a2bcad8d645 = <b>Vastaanottimen omat liput Kshanan rinnalla.</b> UBX-NAV-STATUS <c1/> ja UBX-SEC-SIG luetaan kentään <c2/> jokaisella epookilla, ja tuloksen vertailu <c3/> asettaa ne Kshanan valvontoja vasten (molemmat, vain vastaanotin, vain Kshana, ei kumpikaan); se ei nosta hälytystä eikä muuta pistemäärää. Septentrio SBF -lukija (PVTGeodetic, MeasEpoch, RFStatus, vain luku, MIT-lisensoidulla <c4/>-crate-kirjastolla) ja <c5/> (sarja- tai USB-NMEA-syöte, vain luku; se ei koskaan kirjoita vastaanottimelle) liittyvät niihin.

seg-90d9927fe3e2 = <b>Ajoitus ja laitteiston turvallisuus</b> (<a1><c1/></a1>, <a2><c2/></a2>). Skenaariolaji <c3/> pisteyttää ajoitusjärjestelmän holdover-testin (operaattori poistaa GNSS:n, holdover, palautuminen) mitatusta aikavirhetallenteesta, mitattuna julkisista taulukoista saatuja ITU-T-maskeja vastaan. <c4/> lukee linuxptp- (<c5/>, <c6/>, <c7/>) ja chrony-lokeja (<c8/>, <c9/>). <c10/> kirjoittaa ION GNSS SDR -metadataa ja <c11/> valvoo SigMF-tallennetta sen kasvaessa (vain vastaanotto). <c12/> saa NIST IR 8323r1 Foundational PNT Profile -profiilin ({ "15" } parafrasoitua riviä, tukee todisteita (supports evidence for)). Todistepaketti voi kirjata operaattorin <c13/>-tiedon allekirjoitettuun manifestiinsa, ei koskaan varmennettuna; laitteiston vaiheet { "0" } – { "4" } ja oikeudelliset huomautukset ovat tiedostossa <c14/> (odottaa oikeudellista tarkastusta). Minkäänlaista lähetyspolkua ei ole.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): kiinteät tehtävät, jaot ja mittarit GNSS-häirinnän havaitsemiselle vastaanotinlokeista (JammerTest { "2024" }) ja IQ:sta, ajoituksen holdover-ennusteelle (IGS-kellot) ja jakauman ulkopuolisen optimismin aukolle; jakomanifestit kiinnitetyillä tiivisteillä ja hakuskripteillä (dataa ei ole mukana), sinetöity holdout sitoutumalla ja paljastamalla, tulostiedoston skeema ja staattinen tulostaulusivu. Lähtötasot kynnyksillä, jotka on ennakkorekisteröity tiedostossa <c4/>: pisteyttäjän kynnykset täyttyvät, C1–C3 täyttyvät, D2 täyttyy; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } vähintään { "0.80" } vastaan testijaolla), <b>D1 NOT MET</b> (suurin ero { "0.0301" }) ja <b>tehtävä (b) R1 NOT MET</b> (siirretty, ei ajettu uudelleen), kukin kiinnitettynä (<c6/>). Jokainen pistemäärä on MODELLED. Python <c7/>, <c8/>; WebAssembly sama; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Häiriöobservatorio</b> (<c1/>, <c2/>, <a1><c3/></a1>): toistettava päivittäinen GeoJSON, PNG ja tapausraportti-JSON kolmella tilalla (degraded, not degraded, not observed), { "24" } h:n vähimmäisviive, solut { "0.5" } astetta tai karkeammat, syytä ei oleteta ja OpenSky-data hylätään; ennakkorekisteröityjen parametrien herkkyystutkimus; 30 päivän Itämeren takautuva katalogi adsb.lol:sta.

seg-497ae18bfb03 = <b>Kone- ja anturisyötteet kohteelle <c1/></b> (<a1><c2/></a1>). Uudet <c3/>-arvot, kaikki vain luku, MODELLED, itse kirjoitetuin vertailuaineistoin ja ilman mukana toimitettua dataa: <c4/> (RTKLIB <c5/> -ratkaisutiedostot), <c6/> (OEM7 ASCII ja binääri <c7/>, <c8/> C/No ja <c9/>; vastaanottimen häirintälipusta tulee epookin <c10/>, jota verrataan Kshanan hälytyksiin vertailulla <c11/>), <c12/> (MSM4:n ja MSM7:n C/N0 GPS:lle, GLONASSille, Galileolle, SBAS:lle, QZSS:lle, BeiDoulle ja NavIC:lle; rakenteet BSD-lisensoiduista pyrtcm-taulukoista, joiden huomautus on tiedostossa <c13/>, ei RTCM-standardista) ja <c14/> (GNSS-SDR Monitor- ja PVT-monitor-viestit JSON-riveinä, välittäjänä <c15/>).

seg-22e8b434782f = IMU-lokit toisena anturina.

seg-5491196d6421 = <c1/> (<c2/> tai <c3/>) integroi gyron kääntymisnopeuden suunnaksi, jonka <c4/>-valvonta lukee; inline jokaisella pinnalla ja viety todistepakettien mukana. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, lisäosa <c9/>, JetBrains-toiminto) sovittaa skenaarioiden <c10/> ja <c11/> kiihtyvyysanturin ja gyron parametrit paikallaan olevasta lokista Allan-poikkeamalla ja tulostaa taulukon <c12/>, jonka provenanssissa on lokin SHA-256.

seg-f48fdf6252cd = <b>Integraatiot:</b> ROS { "2" } -paketti (<c1/>: NavSatFix ja <c2/> sisään, luottamusaiheet ulos; sen ROS-vapaa silta on testattu todellista moottoria vasten, solmua itse ei ole ajettu elävällä ROS-graafilla), <c3/>-silta (<c4/>, MIT-riippuvuus, valinnainen) ja GNSS-SDR-välittäjä.

seg-1a8727ad42bb = <b>Home Assistant MQTT -viejä</b> luottamustelemetrialle: <c1/> ja <c2/> (löytöviestit ja JSON-tila-asiakirja; vain julkaisu, ei tunnuksia eikä TLS:ää) sekä <c3/> tekstinä Pythonissa, WebAssemblyssä ja MCP:ssä.

seg-f1cb2c2881c9 = Seitsemän MODELLED kirjanpitoriviä edellä mainitulle. Mikään tässä ei ole VALIDATED: yhtään tallennetta todellisesta vastaanottimesta, tukiasemasta, IMU:sta, GNSS-SDR-ajosta, ROS-graafista tai MQTT-välittäjästä ei luettu.

seg-12c7a28c80b5 = <b>Optisen linkin marginaali ajan funktiona.</b> Laji <c1/> ottaa valinnaisen taulukon <c2/> (<c3/>, <c4/>, <c5/>) ja kirjoittaa sen jälkeen myös kohdetta kohti yhden siemenluvulla tuotetun toteuman ilmoitetusta kohdemallista ajan yli: pilvijaksot, nestevesipatsas jaksoa kohti, yksi gamma-gamma-skintillaationäyte askelta kohti, ja niistä linkin marginaali, pilvi- ja skintillaatiovaimennukset ja linkki päällä -lippu, sekä toteutunut saatavuus, pilvisyysosuus, katkojen lukumäärä ja pisin katko. MODELLED (yksi otos mallista, ei ilmasto; ei ulkoista oraakkelia). Ilman taulukkoa tulos on { "0.37" } -asiakirja. Kaksi mukana toimitettua optista skenaariota sisältää taulukon ({ "336" } h, { "600" } s, siemenluku { "37" }). Kynnykset ennakkorekisteröity tiedostossa <c6/> ennen ensimmäistä ajoa.

seg-78524dbb3bd2 = Testiolosuhteiden määrittely ja laboratorion edestakaiskierros.

seg-fbf034925641 = <c1/> julkaistaan nimellä <a1><c2/></a1> JSON-skeemalla, ja se saa arvon <c3/>. <c4/> kirjoittaa myös <c5/>. <c6/> rakentaa allekirjoitetun paketin, joka linkittää skenaarion tiivisteen, ilmoitettujen olosuhteiden tiivisteen, vastaanottimen lokin tiivisteen ja ilmoitettuja tapahtumia vasten lasketun pistemäärän, ja hylkää olosuhteet, jotka ovat ristiriidassa pisteytystapahtumien kanssa. Työstetty esimerkki, jossa gps-sdr-sim kirjoittaa vain tiedoston; toisto on operaattorin vastuulla eikä sitä koskaan automatisoida. Python <c7/>, MCP <c8/>, lisäosa <c9/>.

seg-8bda4472d561 = <b>Standardipaketit</b> (<c1/>, <c2/>): DHS Resilient PNT -kehyksen testiprofiilit tasoille { "1" } – { "4" }, IMO MSC.1/Circ.1575:n tarkkuustasot ja eheysarviointi sekä ICAO Doc { "9849" } liitteen F monitor, assess and mitigate, kukin joukko skenaarioita, jotka pisteytetään ennen ajoa ilmoitettuja kynnyksiä vasten, niiden tukemin compliance-report-rivein (tukee todisteita, supports evidence for). Epäonnistumiset on kirjattu ja kiinnitetty: DHS L4-T1 ja neljä IMO:n tarkkuustestiä. Doc { "9849" } -asiakirjaa itseään ei luettu (maksullinen); ICAO-paketti seuraa ICAOn omaa RFI Mitigation Plan -esitystä. <c3/> saa standardipakettiosion. Kaikki MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): AFS-I Gold- ja AFS-Q Weil -koodit PRN:ille { "1" } – { "210" }, signaalit <c2/> ja <c3/> kohteessa <c4/>, SB1 BCH -koodi, CRC-24Q ja lomittaja sekä <c5/> (<c6/>, <c7/>, <c8/>), kiinnitettynä LNIS V5 Applicable Document { "1" } Volume A:han (LSIS-AFS V1.0, { "29" } tammikuuta { "2025" }). Koodit VALIDATED asiakirjan painettuja taulukoita vasten (jotka se merkitsee TBC:ksi); yksi painettu tertiäärisarake (PRN { "147" }) on todennäköisesti painovirhe ja epäonnistuminen on kiinnitetty. Alikehysten { "2" } – { "4" } LDPC-koodausta ei ole toteutettu.

seg-5a5720500b6d = <b>Kurssin muistikirjat</b> (<c1/>): häirintä, harhautus, holdover, eheys, OSNMA ja häiriökartta, kukin harjoituksineen.

seg-3d543433051c = <b>EU-US WG-C ARAIM, Milestone { "3" }: enimmäis-URA-tutkimus</b> (<c1/>, <c2/>), joka korvaa peruutetun suunnitelman ”Table A-3”; MODELLED ilmoitetuin poikkeamin.

seg-4f1f786e2658 = <b>Omistajan hyväksyntää odottavat luonnokset</b> hakemistossa <c1/>: JOSS-artikkeli, TSC:n peruskirjan muutos, oraakkelirekisterin prosessi ja ehdotus hakemiston <c2/> jakamisesta. Mitään niistä ei ole otettu käyttöön.

seg-49a758039871 = <b>Studio-näkymät versiossa { "0.38" } lisättyihin ominaisuuksiin</b> (kshana.dev/studio/). Komentosillan toisto (kaksi synteettistä ajoa samalla kellolla: reitti, luottamuspistemäärä, satelliitit, jotka loki kuulee, ja tuomio, vastaanottimen omat liput Kshanan hälytysten vieressä); optinen PNT (kaksi tyypin <c1/> skenaariota, valinnaisella siemenluvulla ajetulla toteutumalla (<c2/>), MODELLED); holdover-testi (tyypin <c3/> tulos mitattuna ITU-T-maskeja vasten, piirrettynä tuloksen omasta kentästä <c4/>); häiriöobservatorion katselin, joka avaa itse tuottamasi tiedostot eikä toimita yhtään; Työkalut-sivulla Jammertest-pisteytin, IMU-sovitus ja MQTT telemetriamuotona; sekä Vastaanottimen luottamus -näkymässä lokimuodon valitsin (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) ja valinnainen IMU-tiedosto. Jokainen näkymä lukee tiedostot selaimessa eikä lähetä mitään; jokainen luku säilyttää nimiön, jonka kirjanpito sille antaa, ja kukin sisältää ohjeellisuusilmoituksen. Sivuston sivu <c6/> näyttää katkelman <c7/>.

seg-91f6beb29f8e = <b>Issue #36: tavutarkat pin-kerrokset.</b> Tavutarkat pin-kerrokset ajetaan vain isännällä, joka on julistettu lähtötasoksi (<c1/>, asettaja <c2/>), ei jokaisella Apple siliconia käyttävällä Macilla, koska Applen matematiikkakirjasto eroaa macOS-versioiden välillä; siirrettävä kerros ajetaan kaikkialla, ja <c3/> estää sen, että tavutarkan kerroksen ajoa ehdollistettaisiin enää pelkän alustan perusteella. Oraakkelivertailut itse menevät läpi macOS:ssä. Yhtään literaalia ei otettu uudelleen eikä toleranssia muutettu. <c4/> ja <a1><c5/></a1> kertovat, miten ero luokitellaan; <c6/> on manuaalinen ja viikoittainen diagnostiikka, ei portti.

seg-15070f7dcc0a = <b>CodeQL: ankkuroimaton kuvio Studion trust-open-apufunktiossa</b> täsmää nyt koko otsikkoon (<c1/>).

seg-56856063519f = <b>CI: ajajan levytila.</b> Työ <c1/> rakentaa dev- ja test-profiilit ilman debug-tietoja, joten linkitys ei enää täytä levyä.

seg-38c59868835e = <b>Lähdesuojat.</b> Jokainen lähdetiedosto, joka sisältää pin-testiaineistoa, ilmoittaa pin-alueensa, ja tilapäisiä tiedostoja kirjoittavat testit käyttävät kutsukohtaisesti yksilöllistä polkua, joten rinnakkaisajot eivät voi törmätä.

seg-884f693585fa = <b><c1/></b> luodaan uudelleen optical-atmosphere-tyypin valinnaista kenttää <c2/> varten.

seg-e16d328f3967 = <b>JetBrains-liitännäinen: ei vanhentuneen tai poistettavaksi ajoitetun alustarajapinnan käyttöä.</b> IntelliJ Plugin Verifier (<c1/>) IntelliJ IDEA -koontiversiota { "263" } vasten ({ "2026.3" }: { "263.6800.24" } ja { "263.7031.23" }) löysi yhden vanhentuneen kutsun, <c2/>, toiminnossa Insert Example; se avaa nyt uuden tiedoston kutsulla <c3/>. Liitännäinen on yhteensopiva ja ongelmaton versiossa { "2024.3" } (since-build, ennallaan) sekä molemmissa koontiversioissa { "263" }. CI ajaa nyt työkalun <c4/> ja epäonnistuu yhteensopivuusongelmien sekä poistettavaksi ajoitetun rajapinnan käytön vuoksi.

seg-07ce053c906a = <b>Optinen PNT ilmakehän läpi</b> (skenaariotyyppi <c1/>, <a1><c2/></a1>, suunnitelmamuistio <c3/>). Optiselle linkille ja joukolle maa-asemia se raportoi aallonpituudesta ja korkeuskulmasta riippuvan selkeän ilman vaimennuksen, Hufnagel-Valley-turbulenssitilan (Rytovin varianssi, skintillaatioindeksi, gamma-gamma-häipymät, aukon keskiarvoistus), saatavuuden suhteessa linkkimarginaaliin ilmoitetusta pilviklimatologiasta, tavoitesaatavuuksiin tarvittavan marginaalin ja katon, jota mikään marginaali ei nosta, katkosten kestojakauman, ajoitus- ja etäisyysmittausvirheen katkosta kohti kellon holdover-mallin kautta, etäisyydestä riippuvasti korreloituneen paikkadiversiteetin sekä mitä-jos-hyödyt aallonpituuden vaihdolle, suuremmalle aukolle, adaptiiviseen optiikkaan perustuvalle skintillaation vaimennukselle ja lisämarginaalille. <c4/> saa ilmakehätietoisen budjetin; ilman sitä sen tuloste on bittitarkasti sama kuin versiossa { "0.36" } (kynnys A5). Kaksi mukana toimitettua skenaariota sisältää ILLUSTRATIVE-pilviklimatologiat. MODELLED: kolme kirjanpitoriviä. Numeriikka täyttää kynnykset A1–A6, jotka on ennakkorekisteröity tiedostossa <c5/> riippumatonta mpmath-ohjelmaa vasten; se tarkistaa ilmoitettujen kaavojen toteutuksen, ei ilmakehää, eikä mitattua saatavuustallennetta ole verrattu, joten mikään rivi ei ole VALIDATED. Kynnys A4 ei aluksi täyttynyt, ero oli { "3e-9" }, koska käytössä ollut normaalijakauman kertymäfunktio oli approksimaatio, jonka virhe oli { "1.5e-7" }; kertymäfunktio vaihdettiin ja kynnys jätettiin rekisteröidyksi. Natiivi- ja WebAssembly-koontiversiot palauttavat tavu tavulta identtiset asiakirjat molemmille mukana toimitetuille skenaarioille (A7, ajettu integrointicommitilla { "0.37.0" }).

seg-eb589aff44ad = <b>IQ-monitorien havaitsemis-ROC</b> (PRO-32, <a1><c1/></a1>). Monitoreja käyttävä kampanja säilyttää kunkin testisuureen maksimin ilmoitettujen tapahtumien ikkunoissa (positiiviset) ja tapahtumien ulkopuolisissa tiilitetyissä ikkunoissa (negatiiviset, <c2/>). Raportti yhdistää ne hälytyslajeittain ROC-käyräksi, jonka mukana ovat AUC ja toimintapiste asetetulla kynnyksellä, tiedostona <c3/> ja raporttiosiona. Synteettisillä kampanjoilla satunnaistason tarkistus täyttyy. C/N0-AUC-kynnys ({ "0.95" }) ei täyty ({ "0.79" }), koska tapahtuman jälkeen heti tulevat negatiiviset ikkunat perivät havaitsemisesta CUSUM-suureen vaimenemisen; tämä on kirjattu. MODELLED.

seg-d25a34e23f1a = <b>IQ-monitorit lab-replay-kampanjassa</b> (PRO-31, <a1><c1/></a1>). Kampanjatiedoston valinnainen taulukko <c2/> ajaa IQ-monitorit ajajan yhdellä läpikäynnillä: teho ja spektri kunkin etupäätyketjun jälkeen sekä C/N0, SQM ja lukitus kutakin seurattua kanavaa kohti. Niiden hälytykset pisteytetään ilmoitettuja tapahtumia vasten: havaittu tai havaitsematta jäänyt, havaitsemisaika ja väärät hälytykset altistustuntia kohti. Kunkin testin suljetun muodon väärän hälytyksen luku on ilmoitettu, mukaan lukien uusi kaksisuuntainen Gaussin luku SQM-testeille (<c3/>). Ilman taulukkoa mikään ei muutu. Synteettisillä kampanjoilla tehon ja SQM:n väärän hälytyksen kynnykset sekä C/N0:n väärän hälytyksen kynnys täyttyvät; havaitaan { "18" } / { "18" } vaimennusta, mutta havaitsemisaikaraja, joka on rakenteensa mukaan alle yhden ilmaisinnäytteen, ei täyty, ja tämä on kirjattu. MODELLED; kirjanpitorivi ”IQ monitors scored in lab-replay campaigns”.

seg-8eb0f650065e = <b>Laboratoriosovitus IQ-kampanjoista, jatkokoe</b> (<c1/>, CI-työ <c2/>). Se testaa kaksi hypoteesia, jotka tiedoston <c3/> kohta §{ "13.6" } jätti auki, kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 1e532f84. Se lisää kaksi synteettistä kampanjaa: S, jossa J/S on porrastettu (siemenluku 2026_1014), ja R, uusi ramppi (siemenluku 2026_1015). Tulokset ovat tiedostossa <c4/>.

seg-ce60405d0005 = S1 täyttyi: kun kukin J/S-taso pidetään vakiona, <c1/> palautuu tarkkuudella +{ "0.185" } dB. Ramppikampanjoiden virhe −{ "1.1" } dB johtuu estimaattorin viiveestä.

seg-ea9f206c2999 = S2 ei täyttynyt, ja tulos on kiinnitetty testillä, joka toteaa kynnyksen jäävän täyttymättä: (d) sellaisena kuin se on kirjoitettu pätee porrastetussa kampanjassa seurantasilmukkamallille ({ "0.45" } dB) mutta ei empiiriselle mallille ({ "6.42" } dB).

seg-fab0653558e4 = R1 täyttyi: uudessa ramppikampanjassa (d), kun sovitettuun pudotusviipymään lisätään kunkin tapahtuman ramppinopeus, poikkeaa enintään { "1" } dB molemmilla malleilla.

seg-24c6725c2c7d = Kynnysten (a′) ja (d) täyttymättä jääminen toistuu kampanjassa R.

seg-7cbbce356973 = Kampanja voi nyt ilmoittaa J/S-arvonsa profiilina tyyppiä <c1/> testikehikossa.

seg-34007ba58a9f = Mikään tuomio kohdassa §{ "13" } ei muutu, ja kirjanpitorivi pysyy tasolla MODELLED.

seg-df2c3f2532d6 = <b>Rajattu FLL-sisäänveto, valinnainen</b> (DS-LOOP-05): uusi silmukkasuunnittelun avain <c1/> (s), Rust <c2/>. Kun <c3/> on käytössä, se pakottaa FLL:stä PLL:ään tapahtuvan luovutuksen tämän ajan kuluttua PLI:stä riippumatta. Oletuksena asettamatta, jolloin se on suunnittelutiivisteen ulkopuolella; oletussuunnittelu ja sen tiiviste ovat ennallaan.

seg-ae2794b2d3d5 = Tarkistettu kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 58789af0, injektoidulla totuudella. Kontrolli täyttyy: oletus ei koskaan luovuta osuudella { "9" } / { "10" } siemenluvuista arvolla { "33" } dB-Hz.

seg-6d9483874b35 = Ei täyttynyt: kun raja on { "1.0" } s, lukitus säilyy ajoista { "16" } / { "20" } arvolla { "33" } dB-Hz ja { "8" } / { "20" } arvolla { "31" } dB-Hz; muissa ajoissa kierretään pakotettujen luovutusten ja FLL:n paluun välillä. Vaihejitteri on { "1.8" }× pelkän PLL:n jitteri arvolla { "33" } dB-Hz.

seg-deeefaf50e3e = Sisäänvetolattia ~{ "35" } dB-Hz pysyy oletuksen dokumentoituna rajoituksena.

seg-780de73c01e1 = MODELLED; kirjanpitorivi ”Capped FLL pull-in below the default design's FLL-to-PLL hand-over floor (opt-in)”.

seg-ace6b53749bd = <b>Hankinnan hystereesi ja etupään kvantisoija skenaariotyypissä jamming</b> (CAP-06c): kaksi valinnaista osiota tyypin <c1/> skenaariolle.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, vähintään seurantakynnyksen suuruinen) ja <c3/> (s, oletus { "0" }). Satelliitti hankitaan, kun se on vähintään hankintakynnyksen tasolla ja on ollut hankkimatta viiveen ajan. Se pidetään, kun se on vähintään seurantakynnyksen tasolla. Tulosteet: <c4/> (tosi/epätosi), <c5/> (lukumäärä) ja <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> ({ "1" }–{ "16" }) ja <c3/> (MHz, oletus kaksi kertaa sirunopeus). Tulostaa lohkon <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, vähennetään jokaisen linkin efektiivisestä C/N0:sta) ja <c8/>. Häviö on Gaussin syötteen häviö, ja se on merkitty pätemättömäksi CW-, kapeakaistaisille ja pyyhkäiseville häirintälähettimille.

seg-0dad81736863 = Ilman osioita jokainen tuloste on tavu tavulta identtinen.

seg-92007bfb6680 = Tarkistettu kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 70c72fcc. Kvantisointihäviö poikkeaa riippumattomasta Monte Carlo -laskennasta enintään { "0.0007" } dB ja AGC-lukema IQ-kerroksen AGC-silmukasta enintään { "0.012" } dB.

seg-973e451df99d = Rekisteröidyt hystereesiajot eivät kertoneet mitään (jokainen linkki menetettiin), joten tuo kynnys on NOT MET. Täydentävä ajosarja, joka rekisteröitiin commitissa { "37793290" }, täyttää sen: jokainen lippu vastaa riippumatonta uudelleenlaskentaa, ja linkeistä { "732" } / { "1824" } näkyy hystereesi.

seg-912e9f1a4d5b = Havainto: CW-häirintälähettimellä 1-bittinen ADC menettää noin { "5" } dB enemmän kuin Gaussin arvo.

seg-a19aee81b581 = MODELLED; kirjanpitorivi ”Acquisition hysteresis and the front-end quantiser in the jamming kind against independent recomputations”.

seg-97f43a4fe71d = <b>Häirintälähettimen maastovarjostus skenaariotyypissä jamming</b> (CAP-06b): valinnainen osio <c1/> tyypin <c2/> skenaariossa, jossa on häirintälähetin. Kentät:

seg-6d59a2857ab9 = <c1/>: SRTM-ruutu (<c2/>), suhteessa työhakemistoon;

seg-fa5b15500405 = <c1/>, <c2/> ja <c3/> (deg): ruudun koko ja kulma;

seg-09a35655f010 = <c1/> (m, oletus { "0" }), <c2/> (oletus 4/3) ja <c3/> (m, oletus { "30" }).

seg-ad58fe7ff627 = Moottori näytteistää suurympyrän maastoprofiilin häirintälähettimen ja vastaanottimen väliltä ja löytää hallitsevan veitsenterän. Häirintälähettimen vastaanotettu teho ja siten jokainen J/S laskee yksittäisen veitsenterähäviön verran, kuten ITU-R P.526-15 kohdassa §{ "4.1" }.

seg-001d7b88b26d = Tulokseen tulee lohko <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) ja <c7/> (lukumäärä).

seg-b9696f5eda4b = Ilman osiota jokainen tuloste on tavu tavulta identtinen.

seg-593b6a5b4480 = Tarkistettu kynnyksiä ja kymmentä sijoitusta vasten, jotka on ennakkorekisteröity commitissa 92cd2bfd, Kuolemanlaakson sitoutetulla todellisella SRTM-ruudulla, riippumatonta numpy-uudelleenlaskentaa vasten. Kaikki täyttyivät: suurin ero { "1.6e-10" } suureessa <c1/> ja häviössä (kynnys { "1e-9" }), häviö on monotoninen häirintälähettimen korkeuden suhteen, ja häviö saavuttaa J/S-arvon täsmälleen.

seg-62e07defd715 = MODELLED; kirjanpitorivi ”Terrain shadowing of the jammer in the jamming kind against an independent numpy recomputation on a real SRTM tile”.

seg-378e9052e2c4 = <b>CRPA-antennivahvistukset skenaariotyypissä jamming</b> (CAP-06a): valinnainen osio <c1/> tyypin <c2/> skenaariossa. Kentät: <c3/> (alkioiden sijainnit paikallisessa itä-pohjoinen-ylös-koordinaatistossa, m), <c4/> (<c5/> tai <c6/>) ja <c7/> (MVDR-kohinakaistanleveys, MHz, oletus kaksi kertaa sirunopeus).

seg-ca39fefc0fb3 = Jokainen kanava muodostaa vääristymättömän keilan satelliittiaan kohti. Linkin kohinaa skaalataan suureella <c1/> ja häirintälähetintä suureella <c2/> ennen nykyistä häirinnänestoyhtälöä C/N0:lle.

seg-1f1ddc11ad94 = Jokaiseen linkkiin tulee lohko <c1/>: <c2/> (dB) ja <c3/> (dB).

seg-790ecc6a1bd4 = Virheellinen osio (tyhjä alkioluettelo, tuntematon painotus, ei-positiivinen kaistanleveys) on virhe rajapintojen <c1/> ja <c2/> sekä <c3/> kautta.

seg-2464d9dde85f = Tarkistettu kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 08d83b4d. Täyttyivät: additiivisuus (korjauksen jälkeen: ensimmäinen koontiversio lisäsi uudet yksiköt jokaisen jamming-ajon yksikkötaulukkoon); yksittäinen alkio ei ole ryhmä; kohinavahvistus ja efektiivinen C/N0 riippumatonta numpy-uudelleenlaskentaa vasten erolla enintään { "1e-9" } dB; MVDR lähestyy nollausta korkealla JNR:llä.

seg-c04495f7a65a = Ei täyttynyt: MVDR-häirintälähettimen vahvistus, { "194" } / { "456" } linkillä versiosta { "0.36" } siirrettävällä matematiikalla ({ "202" } isäntämatematiikalla; <c1/>) (pahin { "1.7e-6" } dB). Jäännökset välillä −{ "100" } ja −{ "188" } dB ovat float64:n resoluution alapuolella tuolla kynnyksellä, ja numpy poikkeaa itsestään samassa suuruusluokassa.

seg-c10e1c72eb15 = MODELLED; kirjanpitorivi ”CRPA antenna gains in the jamming kind against an independent numpy recomputation”.

seg-0a3adfa7271c = <b>IQ-seurantamoottori verrattuna GNSS-SDR-ohjelmaan { "0.0.19" }</b> (PRO-33): <c1/> ja GNSS-SDR seuraavat samoja riippumattomia numpy-tallenteita GPS L1 C/A -signaalista arvoilla { "30" }–{ "45" } dB-Hz.

seg-cc73857e38e8 = Kynnykset ennakkorekisteröitiin commitissa 48edd4a5. Rekisteröity kalibrointi epäonnistui virheellisen GNSS-SDR-luovutuksen vuoksi (F3), joten muutos { "1" } (1e4288c4) lisää molempiin vastaanottimiin pelkästään sisäänvetoa tekevän FLL:n, sitoutettuna ennen mitään testitallennetta.

seg-1d651ff134f9 = Täyttyi: kantoaallon ja koodin jitteri sekä Doppler poikkeavat enintään { "5" } % jokaisella C/N0-arvolla.

seg-bc9c9a0247d1 = Ei täyttynyt: moottorin NWPR-C/N0 lukee { "2.3" }–{ "7.1" } dB alle GNSS-SDR:n SNV-arvon (F4, tunnettu estimaattorin rajoitus; M2M4 poikkeaa totuudesta enintään { "0.06" } dB); lukitusindikaattorit eroavat määritelmän mukaan (F5); yksi jaksohyppyä koskeva erimielisyys arvolla { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; kirjanpitorivi ”IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings”.

seg-6ba057fab559 = <b>Kaksi riviä tasolla VALIDATED IQ-kerroksen koodeille</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Kaikki { "63" } B1I-primäärikoodia täsmäävät GNSS-SDR-ohjelman { "v0.0.19" } riippumattoman generaattorin kanssa siru sirulta (kynnys ennakkorekisteröity commitissa 911106d1). Vain sen ohjelman tuloste on sitoutettu: julkisen ICD:n määrittelemät B1I PRN -koodit etuliitteenä ja tiivisteenä.

seg-37437a09dd67 = <b>GPS L1C.</b> Kaikki { "126" } L1CP/L1CD-koodia ja { "63" } L1CO-peitettä täsmäävät asiakirjan IS-GPS-800J tulostamiin tarkistussarakkeisiin, ja laskettu Legendre-jono täsmää sen taulukkoon 6.2-1 (kynnykset ennakkorekisteröity commitissa fe372e26).

seg-f445784a7f2d = Rivit: ”BeiDou B1I primary ranging codes against an independent generator” ja ”GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns”.

seg-001f48d86a3c = <b>GLONASS-, BeiDou- ja Galileo E6 -kaistat spektrimallissa</b> (CAP-12, signaalit): uudet kaistanimet <c1/> ja <c2/> (mikä tahansa FDMA-kanava muodossa <c3/>, K = −{ "7" }–{ "6" }), <c4/>, <c5/>, <c6/>, <c7/> ja <c8/>. Kukin sisältää ICD:n mukaisen kantoaallon, modulaation ja pienimmän vastaanotetun tehon. Ne otetaan käyttöön nimellä: oletuskaistajoukko ja kaikki nykyiset tulosteet ovat ennallaan.

seg-158a6ec19d6b = Tarkistettu kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 5806f28b: ICD-arvot, nollat, B1C-komposiitti ja C/N0-polku täyttyvät.

seg-805092ae8ca2 = Kaksi kynnystä ei täyttynyt. Yksikköpinta-alan kynnys oli saavuttamaton sellaisena kuin se oli kirjoitettu (F1). IQ-kerroksen B1I- ja B1C-aaltomuodot vastaavat mallia vain kaistakeskiarvoistettuina, koska niiden koodien viivaspektrit ovat epätasaisia (F2).

seg-db88f07d97bb = MODELLED; kirjanpitorivi ”Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)”.

seg-b0147cf3acc8 = <b>Solukeskiarvoistava CFAR-vaihtoehto IQ-hankinnassa</b> (PRO-37): <c1/> ja <c2/> päättävät hankintaruudukolla vertaamalla kutakin solua sen Doppler-rivin vertailusolujen keskiarvoon. Kynnys saadaan suljetun muodon CA-CFAR-väärän hälytyksen todennäköisyydestä <c3/> epäkoherentille lohkolle (<c4/>, <c5/>), joten päätös ei riipu näytetehon normalisoinnista. Se on valinnainen; oletusilmaisin ja kaikki nykyiset tulosteet ovat ennallaan.

seg-a56e74b1e091 = Tarkistettu kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 3724aefa: suljettu muoto Monte Carloa vasten ({ "18" } / { "18" } tapausta), ja { "1" } prosentin suunnitteluosuus mitattiin arvoksi { "0.97" }–{ "1.01" } % Gaussin ja 2-bittisesti kvantisoidun kohinan osalta.

seg-f88fe97e0ee6 = Yksi kynnys ei täyttynyt: kohinattomassa 2-bittisessä signaalissa { "1.28" } % huipun ulkopuolisista soluista ylittää kynnyksen koodin korrelaatiosivukeiloissa (havainto F1).

seg-8d88b626c31e = MODELLED; kirjanpitorivi ”Cell-averaging CFAR option in IQ acquisition”.

seg-d596329195cf = <b>Skintillaatiomalli mitattua dataa vasten</b> (PRO-34): IQ-kanavan Cornell-skintillaatiomallia verrattiin mitattuun { "50" } Hz GPS L1 -intensiteettiin ja -vaiheeseen päiväntasaajan skintillaatioyöltä (Zenodo-tietue { "16941224" }, INGV, Malindi, CC BY { "4.0" }), kynnyksiä vasten, jotka on ennakkorekisteröity commitissa b6ccb499. Täyttyi: intensiteettijakauma ja S4:ään sidottu vaihesintillaatio. Ei täyttynyt: malli häipyy { "2.4" } kertaa useammin alle −{ "10" } dB ja { "3.5" } kertaa pidempään (havainto F1). Rekisteröity käsittely lukee mallin käärityn vaiheen (havainto F2); vaihetulos pätee myös, kun vaihe on avattu. <c1/> hakee datan. Rivi pysyy tasolla MODELLED: ”IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation”.

seg-d6740cab2271 = <b>Korjattu LuGRE-näytteenlukija</b> (MR-09): <c1/> lukee LuGRE IQ -erän, jossa I on korkeassa nibblessä ja mid-rise-tasot <c2/> (<c3/>), jotka poistavat −½:n keskiarvon, jonka pelkät kahden komplementin kokonaisluvut tuovat I- ja Q-komponentteihin. <c4/> antaa GNSS-SDR:lle saman luennan. Yleinen ION-lukija ja kaikki nykyiset tulosteet ovat ennallaan: { "149" } skenaarion tulosta ja yksi tutkimus ovat tavu tavulta identtisiä ennen ja jälkeen, ja kiinnitetyt LuGRE-havainnot luetaan kuten rekisteröitiin (<c5/>). Mikään kirjanpitorivi ei muutu.

seg-5adf36c03c14 = <b>Valinnainen BOC({ "1,1" })-seuranta</b> (CAP-07 (a)): <c1/> skaalaa DLL-erottimet siniaalto-BOC({ "1,1" })-pääpiikille ja lisää bump-jump-monitorin (hyvin aikaiset ja hyvin myöhäiset korrelaattorit ±{ "0.5" } sirun kohdalla, ylös-/alaslaskurit, <c2/>), joka siirtää koodi-NCO:n pois sivupiikiltä; <c3/> luettelee hypyt. Oletuksena pois, ja kaikki nykyiset tulosteet ovat ennallaan. Tarkistettu kynnyksiä vasten, jotka on ennakkorekisteröity commitissa 6b68f6cc synteettisellä BeiDou B1C -signaalilla: sivupiikkialku, joka pysyy { "0.55" } sirun verran pielessä ilman valintaa, vedetään pääpiikille yhdellä hypyllä ajanhetkellä { "0.08" } s valinnan kanssa, eikä pääpiikiltä havaittu väärää hyppyä. Yksi kynnys ei täyttynyt: skaalauksen yksikkötestiruudukko ulottuu erottimien lineaarisen alueen ulkopuolelle (havainto F1 tiedostossa <c4/>). MODELLED; kirjanpitorivi ”BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)”.

seg-89345aa385f7 = <b>Laboratoriosovitus IQ-kampanjoista</b> (B7.1, <a1><c1/></a1>). Labfit-skenaarion <c2/> sovittaa kansion, jonka komento <c3/> tulosti, komentorivillä (<c4/>), Pythonissa (<c5/>) ja MCP:n labfit-työkalussa (vain sen työhakemiston sisällä olevat kansiot). Se sovittaa yhden yksikön signaalia, silmukkasuunnittelua, etupääketjua ja häirintälähetintyyppiä kohti:

seg-1726361b81c4 = C/N0-malli ilmoitettua J/S-arvoa vasten, sensuroinnin kanssa;

seg-e1b8a27b06fd = seurantakynnys, suoraan ja suljetussa muodossa;

seg-8dce89923619 = seurantasilmukka- ja empiiriset lukitusmallit, kytkettyinä C/N0-mallin kautta, viipymineen;

seg-108646713c97 = siemenluvulla ajettu klusteribootstrap tallenteiden yli, { "90" } % ennustevälit ja leave-one-recording-out-pidätysaineistot;

seg-ee5deb4d5d4b = ennakkorekisteröity taulukko <c1/>, tiivistetty, ja PASS/FAIL kutakin kynnystä kohti.

seg-4d58263106af = Raportti on <c1/> JSON-, CSV- ja Markdown-muodossa, yksikkölohkon kanssa. <b><c2/> ei ole tunnistettavissa C/N0-datasta</b> ilman riippumatonta tehomittausta. Se ilmoitetaan, ei koskaan soviteta, ja sovitettu parametri on <c3/> (suunnittelumuutos 2026-10-12). Tuntematon häirintälähetintyyppi saa vahingollisimman ilmoitetun arvon <c4/> (cw, { "1" }). Kshanan omista kohtauksista tehdyillä synteettisillä kampanjoilla pidätysaineiston kattavuuskynnys (c) menee läpi. Suureen <c5/> kynnykset (a') ja (b') ({ "0" } / { "50" } kampanjaa katettu) sekä suljetun muodon kynnyskriteeri (d) eivät täyty: ne on kirjattu arvoineen. MODELLED; kirjanpitorivi ”Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error”. Vastaanottimen lokin labfit-polku ja sen tulosteet ovat ennallaan.

seg-308d19be658d = <b>Tyyppi <c1/> JPL-kernelillä</b> (CAP-31): <c2/> ottaa kunkin SPK:n sisältämän kappaleen (de440s:llä: Merkurius, Venus, Maa, Kuu) kernelistä, nimiö <c3/>, ja lisää lohkon <c4/> vain, kun se on asetettu. Uusi rivi, VALIDATED SPICE-ohjelmaa vasten (ennakkorekisteröity f8e946ea; pahin { "3.3e-5" } m, { "1.0e-11" } m/s). Oletusraportti on ennallaan.

seg-fe16c24eae60 = <b>Porkchop DE440-efemeridillä</b> (CAP-20b): <c1/> pyyhkäisee C3:n ja saapumis-V∞:n heliosentrisillä tiloilla DE440 SPK:sta. Uusi rivi, VALIDATED seuraavia vasten: SPICE-tilat ja

seg-a8632f3c86e9 = pykep { "3.0.1" } (ennakkorekisteröity 2d857fb1; Maasta Marsiin 2026-2028, { "304" } solua, pahin { "2.6e-14" }, sama pienimmän C3:n solu).

seg-266cffab38a7 = <b>LRO:n ei-gravitaatiomakromalli: NOT MET</b> (DS-LRO-10, ennakkorekisteröity e82047e2). <c1/> (valinnainen kautta <c2/>): tasolevyn suora aurinkosäteily Kuun varjolla, Aurinkoa seuraava paneeli sekä kuun albedo ja lämpö-IR; <c3/> on nimetty yleinen LRO-approksimaatio julkaistuista tosiasioista (ei bussilevyjä: levytaulukkoa ei saatu). LRO-kaarella, jonka pituus on { "4" } h, se jättää pelkistetyn dynaamisen RMS:n arvoon { "6.668" } m ja dynaamisen arvoon { "11.94" } m, epäuskottavalla säteilykertoimella (noin +{ "21" } / −{ "22" }), joten kaikki kolme kynnystä jäävät täyttymättä. Havainto on kiinnitetty testillä, eikä oletustuloste muutu (<c4/>). Valinnainen kuun kanuunankuula-SRP käyttää nyt Kuun kartiovarjoa Maan sijaan (<c5/>).

seg-e4ed6e0e5048 = <b>Kuun OD: valinnainen k2-kiinteän kappaleen vuorovesi ja selenosentrinen suhteellisuus</b> (DS-LRO-11), oletuksena pois (<c1/>, <c2/>); kytkin <c3/> ANISE-ristiinvalidointia varten (DS-LRO-04); LRO-kaaren testiaineisto, pituus { "24" } h, ja vain tiedoksi tarkoitettu pitkän kaaren sovitus (DS-LRO-09). Tietoajot on kirjattu tiedostoon <c4/>; mikään julkaistu luku ei muutu.

seg-b065138adba8 = <b>CR3BP { "9" }:{ "2" } NRHO verrattuna CAPSTONE-lentoon</b> (CAP-29d): uusi rivi tasolla MODELLED, joka mittaa moottorin ympyrärajoitetun NRHO:n suhteessa CAPSTONE-luotaimen lentämään rataan (JPL Horizons, maaliskuu { "2023" }; ennakkorekisteröity { "4e868170" }): jakso { "1.07" } %, apolune { "0.05" } %, perilune { "4.1" } % CAPSTONEn keskiarvoista, rekisteröityjen kynnysten { "3" } / { "5" } / { "20" } % sisällä. Mittaus, ei validointi.

seg-954bd2771180 = <b>CR3BP:n pyörivät tilat Kuu-keskiseen ICRF:ään</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> kuvaavat dimensiottoman Maa-Kuu-pyörivän tilan hetkelliselle DE440 Maa-Kuu-suoralle, mukaan lukien koordinaatiston tason ulkopuolisen kulmanopeuden. Uusi rivi, VALIDATED SPICE-kaksivektorikoordinaatistoa vasten (ennakkorekisteröity 2313eb1b, muutettu ennen yhtään ajoa d5ef79b3; { "72" } tapausta, pahin { "1.8e-7" } m ja { "1.2e-9" } m/s).

seg-14599ab79300 = <b>CR3BP-perheen jäsenet JPL Three-Body Periodic Orbits API:a vasten: NOT MET</b> (RM-35, ennakkorekisteröity a9074f65). <c1/> (halo-, NRHO- ja DRO-korjaus, monodromian stabiilisuusindeksi, pseudokaarenpituusjatkuminen) täsmää { "54" } API-jäseneen { "58" } jäsenestä kaikilla kynnyksillä (tila, jakso ja Jacobi alle { "1e-10" } kaikkialla). Yksi L1-halon stabiilisuusindeksi ({ "9.5e-2" }) ja kolme pienen DRO:n sulkeutumista ({ "1.5e-8" }–{ "3.3e-8" } kynnystä { "1e-8" } vasten) eivät täytä kynnystä, joten moduuli on merkitty <c2/>, eikä mikään rivi väitä sitä. Tulokset: <c3/>.

seg-0cd0e67a2e28 = <b>Valinnainen DE440-kuun orientaatio ja ympäristö</b> (FUT-05, DS-LRO-08; oletukset ennallaan): <c1/>, <c2/> / <c3/> (epookkiin ankkuroitu, DE440 pääakselit) ja <c4/> (upotettu DE440 PA -orientaatio sekä geosentrinen Aurinko ja Kuu käyttäjän toimittamasta DE440 SPK:sta). ANISE-ohjelmaa vasten (ennakkorekisteröity ea537710): orientaatio erolla enintään { "3.5e-7" } rad ja LRO-sovitukset erolla enintään { "1" } mm, mutta efemeridihaara ei täyttänyt kynnystään (Aurinko { "30.7" } m, Kuu { "1.1" } m, ANISE-puolella aikapoikkeama ~{ "1" } ms), joten se ei ole validoitu rivi. Tulokset: <c5/>.

seg-92cc171c69da = <b>Kuun koordinaatiston kampanjadatum, kuntoluvulla skaalattu NumPy-kynnys: NOT MET</b> (ennakkorekisteröity b887eb05; pysyy MODELLED). Vaihe { "0" } sulkee pois pseudoinverssivarapolun syynä stations-estimated-eroon { "0.30" }; NumPy täsmää kynnyksen sisällä kuudessa skenaariossa kahdeksasta, mutta stations_estimated ei täytä sitä ({ "6.8e-6" } kynnystä { "5.9e-7" } vasten), ja tuoreella päivämäärällä 2026-12-01 havaitsematon etelänavan majakka tekee majakan informaatiosta rankkivajaan, jota muuttumaton oraakkeli ei pysty evaluoimaan. Tulokset: <c1/>.

seg-8d2f1e9708ff = <b>Kuun koordinaatiston datum todellisesta havaintokampanjasta (analyyttinen Kuu) VALIDATED</b> tuoreilla { "2025" } EDC-normaalipisteillä (ennakkorekisteröity 31f5283 ennen kuin yhtäkään haettiin): muuttumaton SPICE- ja NumPy-oraakkeli on samaa mieltä kirjanpidosta, rankeista ja nollakytkennästä, sekä sigmoissa erolla { "1.11e-3" } (kynnys { "1e-2" }), kuntoluvussa { "8.95e-4" } ja poikittais-/pitkittäissuhteissa { "1.79e-3" } (kynnys { "2e-2" }). Vain kovarianssilaskennan Library-tarkistus; kynnykset eivät erottele Kuu-malleja. Tulokset: <c1/>.

seg-058d7d490111 = <b>Neljäntoista lisätyn aurinkokunnan kappaleen IAU-orientaatio ja GM</b> erotettu rivistä ”Physical constants of every solar-system body” omaksi riviksi tasolla VALIDATED (ennakkorekisteröity 154bc54): <c1/> täsmää SPICEn funktioon <c2/> aineistolla pck00011 erolla enintään { "1e-9" } rad { "574" } matriisissa alkuperäisillä epookeilla ja { "574" } matriisissa { "41" } tuoreella epookilla, joita ei ole ennen verrattu (pahin Phobos { "1.38e-10" } rad), ja <c3/> on yhtä suuri kuin gm_de440 kaikille neljällätoista kappaleelle. Alkuperäisen rivin loppuosa (J2, keskisäde, raportti) pysyy MODELLED. Tulokset: <c4/>.

seg-56c445aa8d9e = <b>Monikierroksinen Lambert</b> (<c1/>): kaikki ratkaisut enintään kolmella kierroksella, molemmat haarat. Uusi kirjanpitorivi, VALIDATED ohjelmaa pykep { "3.0.1" } vasten (ennakkorekisteröity a75de851; { "382" } tapausta, { "1058" } ratkaisua, pahin nopeusero { "1.6e-13" } kynnystä { "1e-8" } vasten). Sisäinen Kepler-laskeutumissuoja löysi yhden funktion <c2/> rajoituksen kaarella e = { "0.994" }; se on kirjattu tiedostoon <c3/>.

seg-b62dc38b09e9 = Laatikko-siipi- ja ECOM2-auringonsäteilypaine (DS-PA-14), valinnainen.

seg-fd50e846d10e = <c1/>: tasolevyinen laatikko-siipimalli Galileo FOC/IOV -taulukoilla GSC:n satelliittimetatiedoista, nimellisessä GNSS-yaw-ohjauksessa, säteilykertoimen ja paneelikohtaisten osittaisderivaattojen kanssa, sekä empiirinen ECOM2-malli osittaisderivaattoineen. Valitaan kutsulla <c2/> / <c3/> (kentät <c4/>, oletus <c5/>: kanuunankuulapolku ja jokainen golden-vertailuarvo ovat ennallaan); laatikko-siipijoukon kanssa <c6/> on sen säteilykerroin. Verrattu ohjelmaan Orekit { "12.2" } ennakkorekisteröinnin alla (<c7/>): jokainen kynnys täyttyi, noin { "1e-15" } suhteellisesti; VALIDATED mallin evaluointina, Galileo-SRP-ennuste pysyy MODELLED.

seg-fd7a7fe09705 = <b>Litistyneen Maan SRP-varjo ja auringon reunatummuminen (FUT-09, RM-11).</b> Uusi moduuli <c1/>: <c2/> (WGS-84-peittävä ellipsoidi), <c3/> (Eddingtonin laki) ja <c4/>, valitaan kutsulla <c5/> (oletus: nykyinen pallomainen kartiovarjo, ennallaan); <c6/>. Litistynyt varjo täsmää ohjelman Orekit { "12.2" } valaistussuhteeseen erolla enintään { "7.4e-9" } { "2400" } geometrialla (VALIDATED, <c7/>); reunatummumisella ei ole ulkoista oraakkelia (MODELLED).

seg-f09d4b831dfe = NRLMSISE-00-termosfääri (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: portti funktioista <c2/> ja <c3/> (kytkimet, päivittäinen Ap ja 3-tuntinen ap-taulukkotila) NRL:n Fortranin julkisesta C-versiosta (public domain). Se on bitti bitiltä identtinen sen C-portin kanssa ja suhteellisesti erolla enintään { "1.9e-6" } ohjelmasta pymsis { "0.13.0" } (NRL Fortran, yksinkertainen tarkkuus) 720 pisteen ruudukolla, ja se toistaa { "17" } julkaistua testitapausta (VALIDATED; <c4/>). Tämä validoi portin, ei mallin tarkkuutta mitattua tiheyttä vasten.

seg-9e8e9018dbaf = Valinnainen NRLMSISE-00-ilmanvastuksen tiheystaso.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> ja <c4/>. Staattinen eksponentiaalimalli pysyy oletuksena, bitti bitiltä. Avaruussää on vakio mallia kohti. VALIDATED ratatasolla ohjelman Orekit { "12.2" } oman NRLMSISE-00-ilmanvastuksen suhteen { "24" } h ajan (pahin { "0.03" } m, kun ilmanvastuksen siirtymä on jopa { "142" } km; <c5/>).

seg-b1b2ac9ac91e = Valinnainen DE440 Aurinko ja Kuu Cowell-propagaattorissa (RM-33, FUT-10).

seg-4f323703b251 = <c1/> ottaa minkä tahansa <c2/> (esim. DE440 <c3/>) kolmannen kappaleen ja SRP-termeille; se hylkää tarjoajan, joka ei voi palvella epookkia, laskee siirtymät analyyttiseen sarjaan ja on oletuksena pois. <c4/> säilyttää kaksiosaisen tarkkuuden. Verrattuna ohjelmaan Orekit { "12.2" } sen omalla DE440-lukijalla { "24" } h pitkät radat täsmäävät erolla enintään { "0.017" } m; ennakkorekisteröity Auringon/Kuun sijaintikynnys ei täyttynyt ({ "6.4" } m / { "0.24" } m; SPICE näyttää saman eron), joten MODELLED (<c5/>).

seg-6ac7f3f65b33 = Valinnainen S1-ilmakehän vuorovesi (DS-PA-03).

seg-35da1ed0dc83 = <c1/> ja <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 taulukon { "1" } malli N1, asteet { "2" }–{ "6" }), otetaan käyttöön kutsulla <c3/> kohteissa <c4/> ja <c5/>; oletuksena pois. MODELLED (kertoimet tarkistettu uudelleen julkaistua taulukkoa vasten; voiman vaikutukselle ei ole ulkoista oraakkelia).

seg-c62d816a93cf = Etäisyyden muutosnopeuden ja atsimuutti/korkeuskulma-eräradanmääritys korkeuskulmamaskilla (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variaatio-STM analyyttisillä kahden kappaleen + J2 -osittaisderivaatoilla), <c5/>, <c6/>; <c7/>. Pelkän etäisyyden polku on ennallaan. Verrattu ohjelman Orekit { "12.2" } eräpienimmän neliösumman ratkaisuun { "8" } ennakkorekisteröidyssä skenaariossa: jokainen kynnys täyttyi paitsi kohinattoman tilan yhtäpitävyys (≤ { "1" } cm), joka ei täyttynyt skenaarioissa { "2" } / { "4" } arvoilla { "1.46" } ja { "1.74" } cm, kun kshana on enintään { "1e-8" } m päässä totuudesta; kirjattu, MODELLED.

seg-223f1e39669f = SP3-tarkkuuspainotus (DS-PA-06).

seg-b5560ff1c426 = <c1/> ja <c2/> kuvaavat otsikko- ja tietuekohtaiset tarkkuuskoodit havaintojen sigmoiksi; SP3-painotettu Galileo-sovitusvariantti (Tier-2 3D RMS { "0.035" } m verrattuna painottamattomaan { "0.070" } m) lisätään muuttumattomien tallennettujen ajojen viereen. MODELLED.

seg-831d35c5f97e = <b>Swarm-A-täyskaaren dispatch-työ (DS-PA-08)</b> tiedostossa <c1/>.

seg-cc5e8af7cb0d = Planeettojen gravitaatio PDS SHADR -taulukoista (CAP-30; osa CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) lukee Marsin GMM-3:n (d/o { "120" }) ja GRAIL GL0660B:n (d/o { "660" }); <c3/> liittää minkä tahansa ladatun kentän (oletukset ennallaan). Astetta 20 olevat rajaukset sisältyvät mukaan (NASA PDS, public domain; <c4/>); täydet tiedostot haetaan skriptillä <c5/>. VALIDATED ohjelmaa pyshtools { "4.14.1" } vasten (kokonaisgravitaatio erolla enintään { "4e-15" } arvolla d/o { "120" } koko pallon yli, { "5e-14" } arvolla d/o { "660" }, kun |lat| ≤ { "60" }°); kappalekoordinaatiston kytkentä pysyy MODELLED (kunkin kentän natiivi koordinaatisto ei ole käytetty IAU-koordinaatisto).

seg-afb5fbf86ffc = Korkea-asteinen gravitaatio asteeseen { "2190" } asti (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (Holmes–Featherstonen muokattu eteenpäin-sarake, ei alivuotoa, ei napasingulariteettia), <c3/>, suoratoistava ICGEM-lataaja <c4/> / <c5/> (normi- ja maksimiastetarkistukset, vuorovesijärjestelmä kirjattu, aikamuuttuvat termit hylätään) ja <c6/> (täysi EGM2008, SHA-256 kiinnitetty, ei mukana; testit ehdollistettu muuttujaan <c7/>). <c8/> valitsee sen valinnaisessa <c9/>. Täsmää ohjelmaan Orekit { "12.2" } erolla { "7.3e-17" } m/s² asteeseen { "2190" } asti, ja { "24" } h kestävä { "200" }×{ "200" } rata täsmää erolla { "0.13" } m. MODELLED: pyshtools ei täyttänyt ennakkorekisteröityä napa-alueen kynnystä (jäljitetty pyshtoolsiin) ja radan asteen 70 herkkyyskontrolli ei täyttynyt ({ "0.73" } m < { "1" } m); molemmat on kirjattu tiedostoon <c10/>.

seg-4ef4f74f21c1 = DOP853-integraattori (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (7. kertaluvun tiheä tuloste), <c4/>, <c5/>, askelsuojalla, joka estää epäonnistuessaan (fail-closed); <c6/>, <c7/>, <c8/>. Oletusajuri on ennallaan. VALIDATED ohjelmistoa SciPy { "1.18.1" } vasten <c9/>: yksittäiset askeleet erolla enintään { "5.6e-15" }, vastaavat askelsarjat, lopputilat erolla enintään { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Robusti Kepler-ratkaisija (FUT-12).</b> Uusi moduuli <c1/>: <c2/> (Markleyn { "1995" } aloitusarvio, kumoutumisvapaa residuaali) kaikille { "0" } ≤ e < { "1" }, kääritty funktioon <c3/>. VALIDATED 50-numeroisia mpmath-juuria vasten tarkkuudella { "0.9" } ε·|E| aina arvoon e = { "0.999999" } asti (<c4/>).

seg-5e82deb7c853 = Valinnainen tesseraalinen Maan gravitaatio Cowell-propagaattorissa (RM-09).

seg-e1a7ad42211e = <c1/> saa kentän <c2/> (<c3/>, <c4/>). Se evaluoi kentän <c5/> (mukana oleva EGM2008 asteeseen/kertalukuun { "70" } asti tai mikä tahansa ICGEM-tiedosto <c6/>) Maahan kiinnitetyssä koordinaatistossa, joka saavutetaan Maan kiertokulmalla (<c7/>) tai CIO GCRS–ITRS-ketjulla (<c8/>). Oletus <c9/>: mikään nykyinen tuloste ei muutu. VALIDATED ohjelman Orekit { "12.2" } Holmes–Featherstone-toteutusta vasten { "24" } h ajalla ({ "6" } tapausta, pahin { "0.036" } m), kynnykset ennakkorekisteröity tiedostossa <c10/>.

seg-957686bb351e = <b>Kaksiosaiset Julian-päivämäärät Maan pyörimisen läpi rataketjussa</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> ja <c6/>, muunnokset <c7/> tyyppien <c8/> ja <c9/> välillä sekä valinnainen <c10/> skenaariotyypille <c11/> (ECEF, maajälki ja asemanäkymä; oletuksena pois ja ennallaan, ja avain jätetään skenaariotiivisteestä pois, kun se on pois). Uusi kirjanpitorivi, VALIDATED ohjelmaa pyerfa vasten (<c12/>/<c13/>) (ennakkorekisteröity b10475ee; { "40" } päivämäärää: GMST bitti bitiltä identtinen, matriisi erolla enintään { "2.7e-14" }, kierto { "1" } µs askelilla erolla enintään { "1.1e-14" } rad, kun taas polku, jossa on vain yksi <c14/>, ei täytä niitä). Cowell-voimamallin epookki pysyy yksiosaisena (tyyppi <c15/>); syy on sen dokumentaatiossa.

seg-0680b1f4c98b = <b>EOP-ennuste taulukon jälkeen</b> (<c1/>, <c2/>): IERS:n Maan orientaatiosarjan valinnainen jatko LS+AR-ennustimella, joka on laskettu sen viimeiseltä riviltä, joten myöhemmän epookin koordinaatiston argumentit seuraavat ennustetta sen sijaan, että kiinnittyisivät viimeiseen riviin. Taulukon sisäiset vastaukset ovat bitti bitiltä identtiset (testattu); sarja kiinnittyy edelleen viimeiseen riviin, ellei tätä kutsuta. Ennusteen tarkkuus pysyy nykyisenä LS+AR-havaintona Bulletin A:ta vasten (MODELLED).

seg-a7d272a1ddd6 = <b>Taivaannapaoffsetit dX, dY CIO-ketjussa</b> (<c1/>) sekä funktioiden <c2/>, <c3/> ja uuden funktion suorat ERFA-vektoritarkistukset. Uusi kirjanpitorivi, VALIDATED ohjelmaa pyerfa vasten (ennakkorekisteröity 979c1e39; { "40" } epookkia { "1950" }–{ "2100" }: prekessio ja CIO bitti bitiltä identtiset, TEME→GCRS erolla enintään { "1.1e-10" } rad, kahden termin equation-of-the-equinoxes-sarjan ennustettu vaikutus). Nykyiset funktiot ovat ennallaan.

seg-20d19a2d65ec = <b>Ennen vuotta 1972 oleva UTC kaksiosaisella aikapolulla</b> (<c1/> sekä <c2/>, <c3/> ja <c4/> päivästä 1960-01-01 alkaen): liukuvanopeuksinen (”kumisekunti”) aika, SOFAn drift-taulukolla, murtoluvulla päivän lopun askelilla ja päivän murto-osan UTC–SI-skaalauksella. Uusi kirjanpitorivi, VALIDATED ohjelmaa pyerfa vasten (<c5/>/<c6/>/<c7/>) (ennakkorekisteröity 23c40661; { "117" } hetkeä { "1960" }–{ "1971" }, pahin { "2.9e-11" } s kynnystä { "1" } µs vasten). Jokainen tulos vuodesta { "1972" } alkaen on bitti bitiltä identtinen (tarkistussumma kiinnitetty ennen muutosta). Ennen vuotta { "1960" } TAI − UTC on { "0" }, kuten SOFAssa. Yksiosainen funktio <c9/> (tyyppi <c8/>) on ennallaan.

seg-3ff0d080d9e6 = <b>GLONASS-yleislähetyksen satelliittikello</b> (<c1/>): <c2/> RINEX-tietueesta, satelliittikellosta luettavalla ajalla (kaksi kiinteän pisteen iteraatiota, RTKLIB-käytäntö). Jäsennettyjä <c3/> ja <c4/> ei aiemmin käytetty. Uusi kirjanpitorivi ”GLONASS broadcast satellite clock and broadcast-orbit propagation”, VALIDATED ohjelmaa RTKLIB 2.4.2-p13 vasten (<c5/>/<c6/>) (ennakkorekisteröity e099c42a; { "292" } tapausta todellisessa { "2013" } yleislähetystiedostossa: kelloero { "0" } s, pahin sijainti { "1.1" } mm kynnystä { "1" } cm vasten). Kirjastofunktio; mikään skenaariotuloste ei muutu. PZ-90.11 → ITRF -muunnosta ei sovelleta, ja moduuli kertoo sen.

seg-71ae2ee163e0 = <b>PPP-aikaratkaisu IGS-asemakelloa vasten</b> ({ "0.36" }, FUT-19): WTZR:n float-PPP-suotimen vastaanotinkello täsmää aseman IGS-finaalin yhdistettyyn kelloon (keskihajonta { "0.075" } ns) vakiosiirtymällä −{ "0.66" } ns konvergoituneiden kahden tunnin aikana. Kynnykset ennakkorekisteröitiin tiedostossa <c1/>. VALIDATED (uusi kirjanpitorivi). Uusi testiaineisto <c2/>, aiemmin satelliittikelloille käytetyn IGS:n finaalikellotiedoston asemakellotietueet.

seg-463ac67600b1 = <b>PPP-vastaavuus gLAB-ohjelman kanssa</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } ajettiin samoilla WTZR-syötteillä erillisenä työkaluna (Apache-2.0-ydin; latauksen tarkistussumma varmennettu julkaistua luetteloa vasten), komentorivillä, joka oli menettelymuutoksessa sitoutettu ennen ajoa. Ensimmäisellä rekisteröidyllä ajolla Kshanan float-PPP ja gLABin ovat samoilla { "240" } / { "240" } epookilla erolla enintään { "0.05" } m ja viimeisellä { "5.0" } mm. SPP-kynnys ei täyttynyt (mediaani { "1.187" } m kynnystä { "0.50" } m vasten) ja on kirjattu havaintona: gLABin ja RTKLIBin omat SPP-ratkaisut eroavat toisistaan { "0.852" } m. Rekisteröity sääntö jättää siksi molempien työkalujen haarat kokonaisuutena täyttämättä, vaikka PPP-vastaavuus pätee.

seg-158717c78c80 = <b>RINEX { "4" } -navigointisanomien luku</b> ({ "0.36" }, WP-07, PRO-41): <c1/> lukee RINEX 4.00-4.02 -navigointitiedostot (<c2/> GPS LNAV, Galileo I/NAV ja F/NAV, BeiDou D1/D2, QZSS LNAV; muut tietueet ohitetaan seuraavaan tietueotsikkoon), ja <c3/> ottaa vastaan asetuksia. VALIDATED saman päivän IGS RINEX { "3" } -yhdistettyä tiedostoa vasten: jokainen dekoodattu kenttä identtinen ja { "0" } m sijainnissa. RINEX 2/3:n luku on ennallaan.

seg-57aa5c6ef4f8 = <b>BeiDou GEO -yleislähetyssijainnit</b> (valinnainen): <c1/> ja <c2/> (BDS ICD, −{ "5" } asteen kallistus). <c3/> ohittaa edelleen GEO-satelliitit. MODELLED: ennakkorekisteröity vertailu tarkkaan rataan on dataehtoinen eikä sitä ole vielä ajettu.

seg-416f58111d1f = <b>RINEX { "4" } -havaintotiedostot</b>: todellinen RINEX { "4.00" } MGEX -havaintotiedosto luetaan testeissä (MODELLED, muotovastaavuus).

seg-64b4664c0ff6 = <b>RTK ja LAMBDA todellisella RINEX-datalla</b> ({ "0.36" }, WP-07 ★): <c1/>, lyhyen perusviivan kaksoiserot kaksitaajuisesta GPS-koodista ja vaiheesta float-Kalman-suotimella ja LAMBDA-kokonaislukulukituksella (suhdetesti). VALIDATED IGS-asemilla WTZR ja WTZZ ({ "1.4" } m etäisyydellä toisistaan) niiden ITRF2020-perusviivaa vasten ennakkorekisteröidyillä kynnyksillä: kokonaisluku ratkaistu jokaisella epookilla ensimmäisten kymmenen minuutin jälkeen, perusviivavirheen mediaani { "4.5" } mm ja 95. prosenttipiste { "5.5" } mm.

seg-69db4437ebbb = <b>Todellisen datan PPP:n RTKLIB-vastaavuus</b> (RM-31): <c1/> ja <c2/> ennakkorekisteröidyillä kynnyksillä. RTKLIB v2.4.2-p13 PPP samoilla WTZR-syötteillä täsmää Kshanaan erolla enintään { "5" } cm jokaisella viimeisten kahden tunnin epookilla ({ "9.7" } mm lopussa) kolmannella rekisteröinnillä; kaksi ensimmäistä ajoa, jotka kirjattiin havainnoiksi, olivat kiinteä vuorovesi pois päältä ja vastaanottimen antenni RTKLIBin perusslotissa. Yhden pisteen vastaavuuskynnys ei täyttynyt ({ "1.09" } m mediaani kynnystä { "0.5" } m vasten). gLAB-haaraa ei ole ajettu (dataehtoinen).

seg-fb6e053a0a9d = <b>LNAVin jälkeiset navigointisanomakooderit</b> ({ "0.36" }, WP-07, PRO-40): <c1/> koodaa GPS CNAV:n (sanomatyypit { "10" }, { "11" }, { "30" }; CRC-24Q; jatkuva nopeuden 1/2 K={ "7" } -koodaus), Galileo I/NAV:n (sanatyypit 1-5 parillisilla/parittomilla nimellissivuilla; 30x8-lomittaja; synkronointi <c2/>) ja Galileo F/NAV:n (sivutyypit 1-4; 61x8-lomittaja; synkronointi <c3/>), testidekoodereineen. MODELLED: edestakaiset kierrokset ja ICD:n tunnetut vastaukset; ennakkorekisteröity tarkistus, että yleislähetetyt Galileo-efemeridit ovat kooderin LSB-ruudukossa, piti (pahin { "3.6e-3" } LSB), mutta satelliittimäärän kynnys ei täyttynyt ({ "15" } / { "20" }), kirjattu. Kooderit ovat kirjastofunktioita; skenaariokytkentä ei kuulu tähän muutokseen.

seg-562f36eb18e6 = <b>IONEX-tiedostonlukija</b> ({ "0.36" }, WP-07): <c1/> tyypeillä <c2/>, <c3/>, <c4/>, <c5/> ja <c6/>: tiukka kiinteäsarakkeinen IONEX { "1.0" } -lukija, jossa epookit lasketaan ensimmäisen kartan päivästä, <c7/> luetaan puuttuvaksi, RMS-kartat sekä formaatin lähimmän, peräkkäisen ja kierrettyjen karttojen aikainterpolaatiot; vinon TEC:n laskenta otsikon kuorikorkeudella. Tarkistettu sitoutetulla synteettisellä kartalla ja, dataehtoisesti (haettu testin aikana kiinnitetyllä SHA-256:lla, ei vendoroitu), oikean CODE GIM:n rajauksella: jokainen solmu tarkka; interpolaatio täsmää kaavaviitteeseen erolla { "4e-13" } TECU. RTKLIBin <c8/> täsmää erolla { "3.6e-13" } TECU { "6885" } pisteessä (ennakkorekisteröity B6). VALIDATED dataehtoisella todistusaineistolla (omistajan päätös, 2026-10-13): testi epäonnistuu millä tahansa muulla kartalla kuin SHA-kiinnitetyllä.

seg-9fac2e8535c8 = <b>Hatchin kantoaaltotasoitus</b> ({ "0.36" }, WP-07): <c1/> ja <c2/>, divergenssivapaa (ionosfäärivapaa) muoto tarkassa yhden pisteen kokoonpanossa. MODELLED kirjatulla havainnolla: IGS-asemalla WTZR se laskee yhden pisteen virheen mediaanin arvosta { "1.55" } m arvoon { "1.12" } m ja 95. prosenttipisteen arvosta { "3.47" } m arvoon { "3.21" } m, mikä jää vajaaksi ennakkorekisteröidystä { "40" } prosentin vähennyksestä (jäännösvirhe on harhamaista, ei kohinaa).

seg-7e4c7639d102 = <b>Float-PPP todellisella RINEX-datalla</b> ({ "0.36" }, WP-07): <c1/>, staattinen float-tarkka pistepaikannussuodin todellisella kaksitaajuisella GPS-koodilla ja vaiheella ja IGS-finaalituotteilla (antennisiirtymät ja -vaihtelut, kiinteän Maan vuorovesi, vaiheen wind-up, Shapiro-viive, estimoitu märkäviive, jaksohyppyjen havaitseminen), ja <c2/>. VALIDATED pidätetyllä IGS-asemalla WTZR sen ITRF2020-koordinaattia vasten ennakkorekisteröidyillä kynnyksillä: kun on kulunut { "6" } h, virhe on { "1.5" } mm vaakasuunnassa ja { "2.9" } cm pystysuunnassa, ja jokainen viimeisten kahden tunnin epookki on enintään { "10" } cm päässä.

seg-173aa308e3e8 = <b>SP3-tarkan kellon interpolointi</b> ({ "0.36" }, WP-07): <c1/> ja <c2/> interpoloivat taulukoidut SP3-satelliittikellot lineaarisesti kahden ympäröivän kelvollisen solmun välillä (huonon kellon sentinel ohitetaan), ja <c3/> syöttää ne kohteeseen <c4/>, joten tarkka ketju toimii pelkällä SP3:lla. VALIDATED IGS:n finaalin { "30" } s kelloja vasten päivältä 2025-02-24 ennakkorekisteröidyillä kynnyksillä: { "32" } GPS-satelliittia, keskipisteen RMS { "0.121" } ns (kynnys { "0.15" } ns), 95. prosenttipiste { "0.265" } ns (kynnys { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM kellon holdover-laatumittarien rinnalla</b> (CAP-05b): kellotyypin valinnainen osio <c1/> raportoi erillisen lohkon <c2/> (hetkellinen RAIM esiasetetulla taivaalla ilmoitetusta paikasta: epookkikohtainen tuomio ja suojaustasot, saatavuus; ei saatavilla, kun GNSS on estetty, ei koskaan ekstrapoloida). Holdover-luvut ovat ennallaan; ilman osiota tuloste on tavu tavulta identtinen. MODELLED.

seg-99d9a67fc2f3 = <b>JammerTest { "2024" } -dataan kalibroidut vastaanottimen luottamuskynnykset</b> (CAP-13): ennakkorekisteröity C/N0-pudotuksen, AGC:n ja häirintäindikaattorin monitorien kalibrointi julkisella JammerTest { "2024" } -aineistolla (haettu ajon aikana, ei koskaan vendoroitu; <c1/>), toimitetaan vain valinnaisena <c2/> ({ "1.5" } dB, { "3.5" } sigmaa, { "29" }). Pidätetty aineisto: AGC-, häirintäindikaattori- ja unionikynnykset menevät läpi; C/N0:n väärän hälytyksen kynnys epäonnistuu ({ "0.023" } kynnystä { "0.02" } vasten), joten rivi on MODELLED (<c3/>). Oletukset ja tulosteet ilman profiilia ovat ennallaan.

seg-8ccd18c54b4b = <b>Usean satelliitin ARAIM-vikahypoteesit</b> (CAP-05a): ADD v4.2 -osajoukkosääntö yleistettynä pareja pidemmälle (<c1/>, <c2/>; kertaluku { "2" } on täsmälleen nykyinen MAAST-tarkistettu polku) ja valinnainen kehittynyt RAIM näille hypoteeseille (<c3/>), joka raportoi suurimman erotuksen osajoukon, kun vika havaitaan. Priorit, jotka vaativat syvempiä osajoukkoja, hylätään, ei koskaan typistetä. MODELLED.

seg-02f1f2d72263 = <b>Taivaanrantaprofiili vastaanottimen luottamuksessa</b> (FUT-01): vastaanottimen luottamusistunto voi ilmoittaa <c1/>; sen takana olevat satelliitit menetetään taivaan osalta (<c2/>, <c3/>, <c4/>) ja niiden menetykset luokitellaan <c5/>, ei koskaan <c6/>; ilman sitä atsimuuttiaukon varapolku ja kaikki tulosteet ovat kuten ennen. Miehistökoulutusgeneraattori saa tapahtuman <c7/> (tukittu taivas, ei häiriö) ja skenaarion <c8/>. UERE x DOP Monte Carlo saa suunnitelmamuistion kaksi maskattua taivaanrantageometriaa, ennakkorekisteröity yksin: kaikki { "26" } tarkistusta menevät läpi.

seg-69fa2ecdc4e9 = <b>RFC { "3161" } -aikaleiman varmennus</b> (CAP-14): <c1/> tarkistaa aikaleimatunnisteen allekirjoituksen (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 ja P-384), sen ESS-allekirjoitussertifikaattisidonnan, allekirjoittajan timeStamping-käytön ja sen ketjun luotettuun ankkuriin tunnisteen genTime-hetkellä, offline; <c2/> soveltaa sitä paketin tiedostoon <c3/> (valinnainen; ilman sitä raportti on ennallaan). VALIDATED, suppeasti: kaikki { "27" } itse generoitua tapausta täsmäävät OpenSSL { "3.0.13" } -ohjelman kanssa tuomiossa ja genTimessa, vertailussa, joka ennakkorekisteröitiin ennen kuin varmentaja kirjoitettiin. Peruutusta ei tarkisteta.

seg-1b7777e600a8 = <b>Lukukohtaiset varmennustasot jokaiselle tyypille</b> (RM-04): jokaisen skenaariotyypin tulos päättyy nyt lohkoon <c1/>, joka nimeää sen pääluvut, kunkin luvun omistavan varmennusmatriisin rivin ja riviltä luetun tason (luvut, joita mikään rivi ei omista, luetellaan tasottomina). Lohko liitetään ajon jälkeen ja riisutaan takaisin edelliseksi asiakirjaksi tavu tavulta (<c2/>). Tyypillä <c3/> ei ole lohkoa <c4/>, ennen kuin uusi päivätty ennuste korvaa sen jäädytetyn; tyypeillä <c5/>, <c6/>, <c7/> ja <c8/> ei ole skalaaripäälukua, ja <c9/> kirjoittaa kompaktia JSONia. Kampanjan jäsenet pitävät tasottomat asiakirjansa.

seg-54aec3e311cf = <b>Kvanttiesiasetus <c1/></b> (CAP-08c): mukana toimitettu inertiaskenaario, jossa kylmäatomi-interferometrikiihtyvyysmittari, määritelty interferometrifysiikallaan (<c2/> ilmoitetulla alustan tärinätasolla), kulkee navigointiluokan kvartsikiihtyvyysmittaria vastaan 110 minuutin GNSS-katkon läpi. MODELLED.

seg-21d2b7fd2a21 = <b>Greenhallin tarkka ekvivalenttinen vapausasteluku</b> (CAP-03): <c1/>, täysi Greenhallin ja Rileyn ({ "2003" }) algoritmi (erotuskertaluvut { "1" }–{ "3" }, kohinaeksponentit väliltä +{ "2" } ja -4, limittäiset ja limittymättömät, modifioidut ja modifioimattomat, suurten J-arvojen taulukoilla), ADEV-, MDEV- ja HDEV-kääreillä. VALIDATED ohjelmaa allantools { "2024.6" } vasten ennakkorekisteröidyllä vertailulla: { "4 876" } ruudukkopistettä suhteellisella erolla enintään { "6.0e-13" }; allantools epäonnistuu { "32" } lisäpisteessä, jotka kirjataan ilman oraakkeliarvoa. Funktion <c2/> luottamusvälit ovat ennallaan bitti bitiltä.

seg-8e04ebc15045 = <b>Kylmäatomi-interferometrin virhetermit</b> (RM-26/27/28): Raman-laserin vaihekohina (retroheijastusviivetermin kanssa), termisen pilven aaltorintaman kaarevuusharha (puhdas defokus, havaintosäteellä) ja interferenssijuovan epäselvyyden ratkaisu (klassisesti avustettu ja kaksi kyselyaikaa), kirjastofunktioina tiedostossa <c1/>, kukin suljettu muoto tarkistettu kvadratuuria tai Monte Carloa vasten. MODELLED; ei vielä tavoitettavissa skenaariotyypistä (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Kellolokimuodot</b> (RM-03): <c1/> lukee RINEX-kellotiedostot, TimeLab-tyyliset ASCII-vaihe- tai taajuuslokit ja TAPR TICC -laskurilokit yhdeksi normalisoiduksi vaihesarjaksi (tau0 ilmoitettu tai löydetty, aukot laskettu, aukkokäytäntö). Valinnainen: telecom-timing-sarja voi nimetä lokin (<c2/>), ja kelloskenaarion taulukko <c3/> lisää lohkon <c4/> (ADEV, TDEV, MTIE). Ilman taulukkoa molemmat tyypit ovat tavu tavulta identtisiä (<a1><c5/></a1>). Ennakkorekisteröity vertailu kolmella synteettisellä lokilla täytti vaihe- ja kytkentäkynnyksensä; estimaattorit täsmäävät allantoolsin kanssa erolla enintään { "2.5e-14" } kaikkialla, missä se evaluoi, eikä se evaluoi koko tallenteen MTIE-pistettä (kirjattu). MODELLED.

seg-53369a5c3749 = <b>Taajuussynkronoinnin wander-maskit</b> (RM-01): tyyppi <c1/> saa seitsemän vakiolämpötilan MTIE- ja TDEV-wander-generointimaskia, ITU-T G.811 PRC, G.812 Types I–III, G.8262 EEC Options { "1" } ja { "2" } sekä G.8262.1 eEEC, taulukoiden kirjoittamilla potenssilakiosilla, ja viiteskenaario <c2/> (vapaasti käyvä OCXO EEC-maskeja vasten: se epäonnistuu kohdassa { "1 000" } s, missä silmukan on tehtävä työ). Jokainen rivi luettiin uudelleen itu.int-tekstiä vasten; G.812 (06/2004) on korvattu ennakkojulkaistulla 08/2026-painoksella, jota ei voitu lukea. MODELLED (transkriptio); nykyiset maskit ja tulosteet ovat ennallaan.

seg-5e84b35ee4e7 = <b>Suodatinpriorin ohjeet tyypille <c1/></b> ({ "0.36" }, WP-09, RM-21, havainto): paketin oletussuodattimen priori sopii taktisen luokan IMU:lle. Navigointiluokan IMU:lla oletus voi tehdä sulautetusta liukumasta huonomman kuin vapaa INS: { "52" } m vastaan { "11" } m lentokoneprofiilissa, jonka nopeus on { "70" } m/s. Aseta <c2/> anturin luokkaa vastaavaksi, kuten uudet meri-, rautatie- ja ilmailupaketit tekevät. Mikään mukana toimitettu skenaario ei yhdistä navigointiluokan IMU:ta oletuspriorin kanssa: jokaisella, joka käyttää oletusta, on jäännöskiihtyvyysmittarin harhoja vähintään { "0.015" } m/s². Vain dokumentaatiota; mikään tuloste ei muutu.

seg-f74b3c265f3a = <b>Test-bench-vienti tarkistettu simulaattorin omilla lukijoilla</b> ({ "0.36" }, WP-09, CAP-16): { "8" } mukana toimitetun skenaarion liikesiedostot, jotka komento <c1/> tuottaa, luettiin takaisin gps-sdr-simin NMEA-, leveys-/pituus-/korkeus- ja Maahan kiinnitetyn liikkeen lukijoilla (MIT, commit 28ca29a6, käytetty erillisenä työkaluna polun <c2/> kautta; mitään signaalifunktiota ei kutsuta). Ne palauttavat viedyn lentoradan erolla { "1.2" } mm, { "0.15" } mm ja täsmälleen. HAVAINTO: kyseisen simulaattorin Maahan kiinnitetty lukija ei pysty lukemaan täysleveää CSV:tä, koska sen 100 merkin rivipuskuri pilkkoo jokaisen rivin. <c3/> antaa nyt käytettävät sarakeleikkaukset ja simulaattorin rajan, { "300" } s. VALIDATED (uusi kirjanpitorivi); viennin tavut ovat ennallaan.

seg-e77e1ac87dd5 = <b>GNSS/INS KF-GINS-aineistolla</b> ({ "0.36" }, WP-09, FUT-17): moduulin <c1/> lataajat ja ajaja sekä vipuvarsimittausmalli suljetun silmukan EKF:ssä. KF-GINS-demoaineistolla (haettu testin aikana, ei vendoroitu) Kshanan horisontaalinen RMS referenssilentorataan nähden on { "1.09" } cm, kun KF-GINSin oma on { "1.11" } cm, ja jokainen ennakkorekisteröity kynnys piti. VALIDATED dataehtoisella todistusaineistolla (omistajan päätös, 2026-10-13): aineisto haetaan SHA-256-kiinnityksillä ja toistopolku on tiedostossa <c2/>.

seg-4d5a503c5c9c = <b>Kytketty PNT-suodin fusion-paketissa</b> ({ "0.36" }, WP-09, FUT-16): tyyppi <c1/> ottaa valinnaisen taulukon <c2/>, joka ajaa yhden pinotun suodattimen pseudoetäisyyksillä ja kiihtyvyysmittarin harhatilalla (<c3/>), ja <c4/> on 3D 8-tilainen versio. Uusi mukana toimitettu skenaario <c5/>: harhaisilla kiihtyvyysmittareilla kytketty tila pitää kvanttipaketin sijainnin tasolla { "18.7" } m (95. prosenttipiste) täydellä eheydellä, kun erilliset suotimet yltävät arvoon { "430" } m. Ilman taulukkoa sekä <c6/> että <c7/> ovat ennallaan (kiinnitetty); <c8/> hylkää taulukon. MODELLED.

seg-b7f07e3693df = <b>Meri-, rautatie- ja ilmailu-GNSS/INS-paketit</b> ({ "0.36" }, WP-09, RM-21): mukana toimitetut skenaariot <c1/>, <c2/> ja <c3/> lentoratakirjastolla sekä valinnainen taulukko <c4/> tyypille <c5/>, joka sulauttaa pseudoetäisyydet SGP4-Walker-tähdistöstä (kaikki satelliitit nimellisenä, korkeimmat muutama heikennettynä). Rautatiepaketissa tiukka kytkentä pitää navigointiluokan ratkaisun tasolla { "5.3" } m läpi leikkauksen ja tunnelin, kun löyhästi kytketyllä ratkaisulla se on { "12.9" } m. Ilman taulukkoa <c6/> paketti on ennallaan (kiinnitetty). MODELLED.

seg-0daf8b2646ad = <b>Kantoaaltovaiheen tiukka kytkentä</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, virhetilainen EKF, jossa on eksplisiittinen kaksitilainen vastaanotinkello ja float-kantoaaltoepäselvyydet, jota ajaa SGP4-Walker-tähdistö Klobuchar- ja Saastamoinen-korjauksin mittaussilmukassa, aikaerotettu kantoaaltojen jaksohyppyjen havaitseminen ja epäselvyyksien uudelleenalustus, sekä pelkällä koodilla ajettu vertailuajo samoilla mittauksilla. MODELLED: 8-kuvioajolla kantoaaltoratkaisu on { "2.5" } cm vastaan { "47" } cm pelkällä koodilla, ja NIS/NEES ovat johdonmukaisia eri siemenluvuilla.

seg-7032646c0bc4 = <b>GNSS/INS-lentoratakirjasto</b> ({ "0.36" }, WP-09, RM-24): tyyppi <c1/> ottaa valinnaisen taulukon <c2/> asetuksella <c3/>. Profiilit komentavat Euler-nopeudet ja ratakiihtyvyyden totuustilasta ja johtavat todellisen IMU:n jäykän kappaleen kinematiikasta (koordinoidut käännökset, nousut, Coriolis); <c4/> tuo totuuslentoradan (<c5/>) ja ratkaisee IMU:n, joka sen toistaa. Ilman taulukkoa paketti lentää historiallisen ajonsa bitti bitiltä (kiinnitetty). MODELLED.

seg-e6b31bf61185 = <b>Leveys-/pituusasteen DEM-ruudut kuun horisontille</b>: <c1/> lukee tekstiruudun <c2/> (korkeudet keskipallon yläpuolella leveys-/pituusasteruudukossa) napastereografisen <c3/> sijaan, sekä tyypille <c4/> että <c5/>; raportti toistaa ruudun (<c6/>, SHA-256:nsa kanssa). <c7/> on nyt kytketty horisonttisäteen marssiin. Mukana olevasta rajauksesta uudelleennäytteistetty ruutu antaa asemalle rajauksen horisontin tarkkuudella { "0.22" } astetta. MODELLED.

seg-0c7ebb6c7d0d = <b>Maasto palvelutilavuuden vientipaikalla</b>: kun osio <c1/> on, tyypin <c2/> satelliittikohtaisen geometrian viennin jokainen rivi sisältää <c3/> (satelliitti ohittaa tasaisen maskin ja vientipaikan horisontin sen atsimuutissa), raportti sisältää paikan horisontin (<c4/>), ja ajonaikainen CSV saa sarakkeen. Ilman maastoa vienti on ennallaan. MODELLED.

seg-7c8789777c26 = <b>Pääkentät moottorilta</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> ja WebAssembly-funktio <c3/> kertovat kahdelletoista tyypille, mitkä skenaarion kentät vastaavat sen kysymykseen, parhaat ensin, pistepolkuina (<c4/>). Studio lukee ne ennen omaa järjestystään. Vain näyttömetadataa: moottori ei koskaan lue sitä, mikään skenaariotiedosto ei tarvitse sitä, mikään tulos ei riipu siitä. <c5/> epäonnistuu, jos tyyppi ei ole ajettavissa tai polku ei löydy yhdestäkään tyypin mukana toimitetusta skenaariosta (se löysi kaksi polkua, jotka Studion litistetyt tunnisteet olivat kirjoittaneet ilman taulukon hakasulkeita).

seg-7528700924b2 = <b>Tyyppi–moduuli-taulukko moottorilta</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> ja WebAssembly-funktio <c3/> antavat jokaiselle skenaariotyypille, jonka varmennusmatriisin rivit nimeävät muun moduulin kuin sen oman, moduulien nimet. Studion ominaisuuskartta käytti omaa käsin kirjoitettua kopiotaan; <c4/> epäonnistuu, jos taulukon tyyppi ei ole ajettavissa tai moduuli ei esiinny missään matriisirivissä. Mikään tuloste ei muuttunut.

seg-af7d28b7fb0e = <b>Lyhyt IQ-ajo selainkoontiversiossa</b> ({ "0.36" }): <c1/> ja <c2/> WebAssembly-moduulissa rakentavat synteettisen kohtauksen, hankkivat kunkin satelliitin ja seuraavat hankitut, kaikki muistissa, rajattuna arvoihin { "0.25" } s, { "1 000 000" } näytettä ja { "8" } satelliittia. Kohtausrakentaja ja signaalihaku nimellä siirrettiin pois vain natiivista <c3/> (kohteisiin <c4/> ja <c5/>), jotta molemmat koontiversiot jakavat ne; komentorivin tuloste on ennallaan. Natiivitesti ja <c6/> vertaavat samaa pyyntöä yhteen golden-tiedostoon (<c7/>) tavu tavulta: siirrettävän matematiikan muutoksen (STUDIO-15, alla) jälkeen selainkoontiversio ja natiivikoontiversio antavat samat bitit.

seg-c0eab9b97b7d = <b>Tyypitetyt Python- ja TypeScript-rajapinnat</b> (CAP-34): <c1/> tyypittää suljetut sanastot (<c2/>, jokainen tyypin nimi; <c3/>; <c4/>) sekä sanakirjat <c5/> ja <c6/>; <c7/> ja <c8/> palauttavat ne. WebAssembly-paketti lisää <c9/> (yksi ajo tyypitettynä oliona <c10/>, jäsennetty asiakirja kentässä <c11/>) ja <c12/> (jäsennetty <c13/>), ja sen <c14/> sisältää saman sanaston; <c15/> on tyypiltään <c16/>. <c17/> pitää molemmat luettelot yhtä suurina moottorin kanssa.

seg-b097c2f105c3 = <b>Yksiköt jokaiselle tyypin <c1/> sarakkeelle</b> (FUT-28): tyypin <c2/> tulos sisältää nyt <c3/> ja <c4/>, kunkin pyyhkäistyn avaimen ja kunkin tallennetun mittarin yksikön, luettuna pyyhkäistyn paketin omasta yksikkötaulukosta. Akseli voi ilmoittaa <c5/> avaimelle, jota paketti ei toista; ilmoitettu yksikkö, joka on ristiriidassa paketin kanssa, hylätään, ja yksikkö, jota kumpikaan ei anna, on <c6/>, ei koskaan arvattu. <c7/> ja <c8/> kuvataan, joten jokainen { "76" } tyypistä on nyt täysin katettu kenttäyksikköportilla (kattamattomien tyyppien katto { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>NumPy-taulukot kohteesta <c1/></b> (FUT-26): Pythonin <c2/> saa funktiot <c3/>, <c4/> ja <c5/>, jotka palauttavat taulukoita (<c6/>) numeerisesta listasta, tietueluettelon numeerisista sarakkeista tai asiakirjan jokaisesta tietuesarjasta. Jokainen taulukko on yhtä suuri kuin <c7/> samoista arvoista kohteesta <c8/> (dtype ja bitit). NumPy tuodaan vain, kun jotakin niistä kutsutaan, eikä se kuulu ajonaikaisiin vaatimuksiin. Tyypitetty tiedostossa <c9/> ja stubtestillä tarkistettu.

seg-1c7a22dabad3 = <b>Kampanjaoptimoija</b> (CAP-32): tyypin <c1/> uusi valinnainen osio <c2/> hakee yhdestä kolmeen skenaarioavainta ilmoitettujen rajojen sisällä yhden mittarin parasta arvoa: minimoi, maksimoi tai osu tavoitteeseen. Se hakee tyhjentävästi ruudukolla tai deterministisellä rajatulla Nelder–Mead-simpleksillä. Jokainen evaluointi on nimetyn tyypin oikea ajo ja luetteloidaan tuloksen kohdassa <c3/>. Esimerkki: <c4/>. Kynnykset ennakkorekisteröitiin (<c5/>):

seg-f4e79236b6bf = Rosenbrockin funktio täyttyy (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = suljetun muodon 1-D-tavoiteratkaisu täyttyy ({ "6e-15" } suhteellinen);

seg-5ab478e03354 = ruudukko on bittitasolla yhtä suuri kuin riippumaton raakavoima;

seg-ea0a04c6e713 = simpleksi suoriutuu vähintään yhtä hyvin kuin ruudukko { "41" } × { "41" }, kun ajoja on { "177" }.

seg-161d8c5b55e8 = Kierros { "1" }: 1-D-kynnys kirjattiin NOT MET, koska ennakkorekisteröity laatikko sulki ratkaisun pois. MODELLED; kirjanpitorivi ”Bounded optimisation of one metric over campaign parameters”. Additiivinen: kampanjat ilman osiota ovat ennallaan.

seg-83d40a636fcb = <b>Kalibrointiensemblet</b> (CAP-10): kolme yhden siemenluvun tarkistusta ajettu uudelleen { "200" } riippumattomalla siemenluvulla ennakkorekisteröityjä kynnyksiä vasten, tiedostossa <a1><c1/></a1> (generoi <c2/>; siemenluvukohtaiset arvot tiedostossa <c3/>).

seg-b163e53e06e9 = Kampanjan Monte Carlo -bootstrapin { "95" } prosentin luottamusväli kattaa todellisen keskiarvon ensembleissa { "192" } / { "200" }, ja sen khiin neliö -tarkistus menee läpi { "196" } tapauksessa.

seg-022a7fbee13a = Yhden siemenluvun persentiilitoleranssi menee läpi vain { "183" } / { "200" } ensemblessa: NOT MET, kuten ennustettiin. Se on noin 2-sigman kynnys, kirjattu eikä löysätty.

seg-096f36d21b02 = Valkoisen FM:n ADEV-kalibroinnit menevät läpi jokaisella siemenluvulla, ja niiden pahin virhe on selvästi toleranssin sisällä.

seg-369c7f2a115c = <b>Sisäänrakennetut tyypit trait-ominaisuuden <c1/> kautta</b> (FUT-27, kesken): trait <c2/> (<c3/>, lukukohtaisella tasokoukulla ja <c4/>) ja ensimmäiset siihen siirretyt tyypit (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Tuloste on ennallaan: koko katalogin manifesti jokaisen tulosteen SHA-256:sta on identtinen ennen ja jälkeen (<c10/>).

seg-fd6e68ff5e5d = <b>Playgroundin no-fetch-tarkistus</b> (RM-07): <c1/> tarkistaa kolme asiaa:

seg-3e424188f6e1 = jokainen Studion kirjastoskenaario on selainpaketissa;

seg-2803ccf8b9ae = paketti on tavu tavulta identtinen hakemiston <c1/> kanssa;

seg-b98016a4a844 = jokainen selainskenaario ajetaan tyhjästä työhakemistosta.

seg-efc143b4f2a9 = <b>Alt-PNT-kartat: todellinen gravitaatiokenttä, karttavirheen Monte Carlo, täysresoluutioinen SRTM</b> ({ "0.36" }, WP-10). Tyyppi <c1/> ottaa valinnaisen <c2/>: EGM2008-kertoimista syntetisoitu gravitaatioanomalia (tai ICGEM-tiedosto (<c3/>) kentän <c4/> kautta, vain natiivit koontiversiot). Tämä synteesi täsmää ICGEM Calculation Serviceen noin { "1e-8" } mGal tarkkuudella { "794" } solmussa kahdella alueella, ennakkorekisteröityjä kynnyksiä { "0.005" } mGal RMS ja { "0.02" } mGal max vasten (VALIDATED; kirjanpitorivi ”Gravity-anomaly synthesis from a spherical-harmonic model”). Uusi mukana toimitettu skenaario <c5/> ajaa 60 minuutin benchmarkin tällä todellisella asteen 70 kentällä. Ennakkorekisteröity tulos: sovitettu virhe { "3106" } m, joten kynnys < { "500" } m on NOT MET, kuten ennustettiin (aste { "70" } on liian tasainen), ja liukuman kymmenkertainen leikkaus on MET (MODELLED). Valinnainen <c6/> ajaa benchmarkin uudelleen siemenluvuilla tuotetuilla Gaussin korreloiduilla karttavirheillä ja raportoi sovitetun virheen jakauman (mukana toimitettu skenaario <c7/>). Tutkiva eikä ennakkorekisteröity: kun karttavirhe on { "2" } mGal ja se korreloi { "0.2" } asteen yli (koko, jonka sovittimen oma sigma budjetoi), toteutumista { "1" } / { "20" } pysyy enintään { "500" } m päässä (mediaani { "2.9" } km, p95 { "14.7" } km), kun täydellisellä kartalla tulos on { "144" } m. Synteettisen benchmarkin ratkaisu, joka on alle 500 m, olettaa kartan tarkaksi. Ilman kumpaakaan valintaa asiakirja on tavu tavulta identtinen aiempien julkaisujen kanssa. <c8/> ottaa valinnaisen <c9/> (<c10/>, <c11/>), joka lukee magneettikanavan EMAG2v3-muotoisesta CSV:stä. EMAG2:ta ei vendoroida, koska sen ehdot eivät ole yksiselitteiset: <c12/> hakee sen kiinnitetyllä SHA-256:lla ja rajaa laatikon. Todellisella EMAG2-ruudukolla ei väitetä mitään navigointitulosta. Yhteinen karttaestimointi (maasto-SLAM, RM-18): <c13/> ajaa sekventiaalisen maastonavigaattorin tallennetun kartan yli, joka poikkeaa totuudesta, joko luottaen siihen tai estimoiden solukohtaisen karttakorjauksen FastSLAM-tyylisellä Rao-Blackwell-suotimella. Ennakkorekisteröity tunnettua karttaa käyttävää SITANia vasten { "15" } m:n korreloidulla karttavirheellä { "20" } siemenluvun yli: { "1.5" } % keskimääräinen hyöty, parempi tapauksissa { "10" } / { "20" }, joten molemmat parannuskynnykset ovat NOT MET ({ "10" } % ja { "12" } / { "20" }), eikä täydellisellä kartalla ole haittaa (MET). Yksi läpikäynti ilman uudelleenkäyntejä ei salli kartan oppimista (<c14/>, MODELLED). Tyypin <c15/> asiakirjat ovat tavu tavulta identtisiä. Todellisen SRTM:n testit ajetaan nyt CI:ssä kahdella sitoutetulla täysresoluutioisella rajauksella; kaikki ennakkorekisteröidyt kynnykset täyttyvät, ja lähin solmu on yhtä suuri kuin GDAL { "3.8.4" } pisteissä { "8" } / { "8" } (<c16/>).

seg-aa7ac7a47111 = <b>Yhteentoimivuus, WP-08</b> ({ "0.36" }; jokainen kohta ennakkorekisteröitiin ja sitoutettiin yksin ennen oraakkeliajoaan, kukin uusi kirjanpitorivi tasolla VALIDATED paitsi telemetriakohta, joka laajentaa olemassa olevaa riviä):

seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 ja OCM { "3.0" } (TRAJ-, PHYS-, COV-, MAN-, USER-lohkot) kirjoitettu ja luettu KVN- ja NDM/XML-muodossa, sekä täystarkkuuksinen OMM SGP4-alkioista (<c2/>); funktion <c3/> tuloste on ennallaan. Ohjelmaa Orekit { "13.1.8" } vasten molempiin suuntiin: Kshana-viesteistä { "27" } / { "30" } jäsentyy Orekitissa ja Kshana lukee jokaisen Orekitin kirjoittaman, arvot suhteellisella erolla enintään { "1e-14" } ja epookit erolla enintään { "1e-9" } s; neljä havaintoa kiinnitetty (Orekit vaatii kentän <c4/>, hylkää kentän <c5/> XML-muotoisissa käyttäjän määrittelemissä parametreissa, ei kirjoita kenttää <c6/> ilman kenttää <c7/> ja lukee OCM:n suhteelliset epookit TDB:ssä SI-sekunteina). Vanhan OMM-kirjoittajan kenttä <c8/> hylätään Orekitissa (kirjattu). Rivi ”CCSDS Orbit Data Messages (OPM, OMM, OCM)”.

seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 ja APM { "2.0" } KVN- ja XML-muodossa ohjelmaa Orekit { "13.1.8" } vasten, jokainen kynnys täyttyi; Orekitin APM-kirjoittaja hylkää manööverin ilman kenttää <c3/> (kiinnitetty). Rivi ”CCSDS Attitude Data Messages (AEM, APM)”.

seg-bdfce382a98c = <b>SPICE SPK -vienti</b> (<c1/>): SPK-tyyppien { "9" } ja { "13" } kirjoittaja ja lukija sekä OEM–SPK-vienti; ohjelmaa CSPICE N0067 vasten kernelit ovat tavu tavulta identtisiä SPICEn kanssa ja evaluoituvat bitti bitiltä identtisesti. Rivi ”SPICE SPK export (types { "9" } and { "13" })”.

seg-ce217acb9fe7 = <b>SPICE SPK -tyypit { "3" } ja { "21" }</b> (<c1/>): tyypin { "3" } (Chebyshev) ja tyypin { "21" } (laajennetut erotusrivit) segmentit kirjoitettu annetuista tietueista ja evaluoitu kuten SPICE; ohjelmaa CSPICE N0067 vasten kernelit ovat tavu tavulta identtisiä SPICEn kanssa ja jokainen evaluointi täsmää bitti bitiltä molempiin suuntiin. Rivi ”SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)”.

seg-72b8edbc74dc = <b>Space Packet -laajennukset</b> (<c1/>): toissijainen otsikko CUC/CDS-aikakoodeilla, pakettivirheen hallinta, segmentointi- ja virtatarkistukset, ohjelmia ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } ja CPythonin funktiota <c2/> vasten, ei yhtään poikkeamaa. Rivi ”CCSDS Space Packet secondary header, packet error control and segmentation”.

seg-c5fcf933b656 = <b>Telemetriaskeema { "1.3" } todellisten kuluttajien läpi</b>: synteettisen skeema-1.3-virran Prometheus-esitys ja OTLP/HTTP JSON, mukaan lukien geometriasarja ja nimiö <c1/>, luettu täsmälleen prometheus_client- ja OTLP-protolla, hyväksytty ohjelmalla promtool { "3.5.0" } (<c2/>) ilman lint-ongelmaa ja läpäissyt muuttumattomana OpenTelemetry Collector contrib { "0.135.0" } -ohjelman (dataehtoinen: työkalut haettu kiinnitetyllä SHA-256:lla, tulosteet sitoutettu).

seg-013344665417 = <b>Marsin radanmääritys, ajo { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skaalaa normaalimatriisin diagonaalillaan ja vaimentaa askelta (Levenberg–Marquardt), kun rekisteröity Gauss–Newton-sovitus epäonnistui matriisilla, jonka raaka diagonaali ulottuu kahdeksan kertaluokkaa. Rekisteröity erikseen (<c2/>, sama kaari, kynnykset ja muokkaus). Pisteytetyillä MRO-ylilennoilla radan RMS-ero MRO:n navigointirekonstruktioon nähden on { "0.36" } km ({ "0.53" } km maksimi), kynnykset täyttyivät. Sovituksen jälkeinen Doppler on { "48.6" } mHz kynnystä { "30" } mHz vasten, ei täyttynyt (havainto kiinnitetty). Vain pisteytystä koskeva muutos R2-A1 on julkistettu tiedostossa <c3/>. Rivi pysyy MODELLED.

seg-fee311480417 = <b>Marsin rampattu 2-suuntainen Doppler-malli ja radanmääritys</b> ({ "0.36" }, WP-14, CAP-30 osa, vaihe { "2" }): <c1/> ennustaa DSN:n rampatun X-kaistan 2-suuntaisen Dopplerin ODF-ramppitaulukoista (valon kulkuaika, Shapiro, troposfääri, asema-aika, DSN-asemat CIO-ketjun ja IERS EOP:n kautta) ja sovittaa Marsin kiertäjän (GMM-3, kolmannet kappaleet, SRP, ilmanvastus). <c2/> lukee SPK-tyypin { "1" } (tarkistettu CSPICEen verraten) ja <c3/> lukee PDS SHADR -kentät. Ennakkorekisteröity MRO:n navigointirekonstruktiota vasten todellisilla MRO-ylilennoilla (dataehtoinen, <c4/>, kuukausittainen CI): ennustettu Doppler täsmää havaintoihin erolla { "12.5" } mHz (kynnys { "30" } mHz, täyttyi); rekisteröity radansovitus epäonnistui pisteytetyllä kaarella eikä tuottanut rataa (havainto kiinnitetty). Rivi pysyy MODELLED.

seg-d8212aa309ef = <b>DSN Orbit Data File -lukija</b> ({ "0.36" }, WP-14, CAP-30 osa): <c1/> lukee TRK-2-18 ODF:t. Todellisella Mars Reconnaissance Orbiter ODF:llä (NASA PDS, vendoroitu) lukija täsmää PDS-nimiön tietueiden lukumäärään, ryhmien sijainteihin, asemiin ja aikoihin, ja kaikki sen datatyypit tunnetaan. Nimiön tiedostonlopputaulukko on yhden rivin vajaa tiedostoon nähden, nimiön epäjohdonmukaisuus kirjattu havainnoksi. MODELLED. Radanmääritystä näillä datoilla ei ole vielä tehty.

seg-bf26920a50bc = <b>TWSTFT-budjetti ja ajansiirron stabiilius: tyyppi <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Kaksisuuntainen yhtälö:

seg-c1fdd431db57 = <c1/> ratkaisee sen suureelle T_A − T_B asemalaitteiden viiveiden, Ku-kaistan ionosfäärin ylös-/alas-epäsymmetrian, transponderin viive-eron ja Sagnac-termien kanssa ja palauttaa suoran mallin tarkkuudella { "1e-15" } s.

seg-a5468765380d = <b>Epävarmuusbudjetti:</b> yhdistetty neliöllisesti, linkin TDEV tyypin A termina.

seg-7f365f91bb3e = <b>Linkin kohina:</b> kaksisuuntainen sarja saa flicker-vaihekohinalattian, vuorokausittaisen ei-vastavuoroisuuden ja vakiovastavuusjäännöksen. Valkoisen jitterin paketti <c1/> on ennallaan.

seg-8b40e74db08c = <b>Todellinen sarja:</b> toimitetun BIPM Circular T:n, <c1/> CSV:n tai IGS-asemakellosarjan stabiilius.

seg-267fd20d823c = MODELLED. Uusi mukana toimitettu skenaario <c1/>. PPP-aikaratkaisu on erikseen VALIDATED IGS-asemakelloa vasten GNSS-todellisen datan haarassa.

seg-ae33b92da4a6 = <b>Sisääntulolämpeneminen, EO-radiometria ja nousuhäviöt</b> ({ "0.36" }, WP-14, CAP-28): kolme uutta tyyppiä.

seg-34951878aa49 = <c1/>: 3-DoF-pistemassan sisääntulo pyörivän Maan tai Marsin yli Sutton–Graves-pysähdyspisteen lämpenemisellä.

seg-98fe7a4c464a = <c1/>: kuvaajan SNR, MTF Nyquistilla, suhteellinen reunavaste ja GIQE { "4" } NIIRS.

seg-173dfbe3cc3e = <c1/>: monivaiheinen gravitaatiokäännösnousu gravitaatio-, ilmanvastus-, ohjaus- ja vastapainehäviöillä, tarkistettu täsmällisellä ideaali-dv-miinus-häviöt-identiteetillä.

seg-0c9e7aacec80 = Sisääntulon huippuhidastuvuus tarkistettiin julkaistua Stardust-nimellisarvoa vasten ennakkorekisteröidyllä kynnyksellä: { "35.44" } g vastaan { "33.4" } g (+{ "6.1" } %, kynnys { "10" } %). Se rivi on VALIDATED. Lämpeneminen, radiometria ja nousu ovat MODELLED. Uutta myös: <c1/>, mukana toimitetut skenaariot <c2/>, <c3/> ja <c4/> sekä <c5/>.

seg-d4648c4e6655 = <b>Asennonhallinta reaktiopyörillä: tyyppi <c1/></b> ({ "0.36" }, WP-14, CAP-21). Jäykän navan inertiaalinen osoituskäännös kolmella tai useammalla tasapainotetulla reaktiopyörällä MRP-takaisinkytkennällä, minimi-normin pyörämomentit rajattuna kunkin moottorin rajaan (<c2/>). Se voi myös sulkea silmukan multiplikatiivisella EKF:llä simuloidusta gyrosta ja tähtiseurannasta (<c3/>). Todellisen tilan silmukkaa verrattiin ohjelmaan Basilisk { "2.9.1" } kolmella tapauksella, jotka ennakkorekisteröitiin ennen kuin koodia oli olemassa (kolme ortogonaalista pyörää, nelipyöräinen pyramidi, kyllästyvä tapaus). Jokainen MRP-komponentti, kulmanopeus, pyörän nopeus ja moottorin momentti täsmäsi jokaisessa näytteessä, pahin { "2.4e-14" } sigmassa ja { "2.9e-11" } rad/s pyörän nopeudessa. Tämä rivi on VALIDATED; MEKF on MODELLED (NEES-johdonmukaisuus). Uudet mukana toimitetut skenaariot <c4/> ja <c5/> sekä <c6/>.

seg-8ce699586340 = <b>Maayhteyksien aikataulutus ja DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): kaksi uutta skenaariotyyppiä. <c1/> antaa yhdelle satelliitille yhden aseman yllä kunkin ylilennon Es/N0:n ja sen aikana valitun DVB-S2 MODCODin (ETSI EN { "302" } 307-1 taulukon { "13" } kynnykset plus marginaali). Se antaa myös datamäärän, jonka ACM siirtää vakiokoodauksen lähtötasoon verrattuna. <c2/> tekee saman usealle satelliitille usean aseman yllä ja rakentaa ristiriidattoman yhteysaikataulun (antennin kääntöaika, yksi asema satelliittia kohti, prioriteettipainotettu toimitus rajattuna kunkin jonon määrään). Se raportoi rajahyötyyn perustuvan ahneen suunnitelman, ensin tulleen lähtötason ja tarkan optimin pienillä joukoilla sekä ahneen suunnitelman optimaalisuusvälin. Näkyvyysikkunat tulevat ylilentoennustimesta, jonka taso on VALIDATED. Uudet mukana toimitetut skenaariot <c3/> ja <c4/> (havainnollistavat syötteet) sekä <c5/>. MODELLED (kaksi uutta kirjanpitoriviä).

seg-cd6dbcc3a78b = <b>Starlink-Doppler-paikannus julkaistua koetta vasten</b> ({ "0.36" }, WP-14, CAP-11 osa, MODELLED). Tämä on ennakkorekisteröity proxy-vertailu tyypin <c1/> Doppler-tilasta esiasetuksella <c2/> julkaisun ”Unveiling Starlink for PNT” (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685) datajoukon 3 persentiileihin. Malli käytti { "3" } satelliittia ({ "47" } asteen maski kiinteän säännön mukaan), ei korkeusapua ja Doppler-sigmaa { "30" } Hz, { "200" } siemenluvulla. Sen 90. prosenttipisteen 3D-virhe on { "92.2" } m kohdassa { "20" } s ja { "870" } m kohdassa { "8" } s, kun julkaistut ovat { "2" } m ja { "10" } m, joten molemmat kaksinkertaisuuskynnykset ovat NOT MET. Malli on pessimistinen, ei optimistinen kuten ennustettiin: kolme kiinteää satelliittia antavat paljon vähemmän geometrista monimuotoisuutta kuin kokeen { "63" } satelliittia { "10" } minuutin aikana kanavan vaihdolla joka { "15" } s. Molempien kynnysten täyttymättä jääminen on todettu testissä (<c3/>).

seg-ffeb1b66cda5 = <b>Impulsiivinen siirtoradan optimoija DE440:llä</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> löytää yhden kierroksen ballistisen kaksi-impulssisen siirron lähtö- ja saapumispäivät, jotka minimoivat lähtö-C3:n tai saapumis-V∞:n tyypissä I tai II. Se hakee 2 päivän ruudukolta ja tarkentaa sitten 2D Nelder–Mead -menetelmällä, heliosentrisillä tiloilla DE440-kernelistä; se rakentuu funktiolle <c2/>. Vertailu ennakkorekisteröitiin (bf0439e8) riippumatonta SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } -optimoijaa vasten Maa–Mars-mahdollisuudella { "2026" }: kaikki neljä optimointia täsmäävät suhteellisella erolla { "8.7e-13" }, päivämäärät erolla enintään { "1e-5" } päivää (VALIDATED, uusi kirjanpitorivi). Toissijaisena julkaistuna viitteenä NASA/TM-2010-216764 (2026-2045 Maa–Mars-käsikirja) täsmää tyypin II minimi-C3:lle ({ "9.182" } vs { "9.144" }) ja tyypin II minimisaapumis-V∞:lle ({ "2.564" } vs { "2.565" }). Sen tyypin I minimi-C3 ei täsmää: { "10.535" } vs { "11.11" } (-5.18 %), missä kirjastooraakkeli on samaa mieltä Kshanan kanssa. Tämä täyttymättä jääminen on kirjattu ja todettu testissä.

seg-91fe2e2625a1 = <b>Kuun referenssiasematutkimus</b> ({ "0.36" }, julkaistun aineiston innoittama suunnitellusta kuun etelänavan referenssiasemasta; lähteet tiedostossa <a1><c1/></a1>): tyyppi <c2/>, kuun differentiaali-PNT-mallin Monte Carlo -pyyhkäisy etelänapa-alueen käyttäjäruudukon ja vuorokauden epookkien yli, joka antaa pistettä ja aluetta kohti korjatun ja korjaamattoman virheen persentiilit, saatavuuden syineen, kattavuuden ilmoitettua kynnystä vasten, suojaustasot, kattavuussäteen atsimuuttia kohti ja korjauslinkin budjetin. Se supistuu täsmälleen malliksi <c3/> yhdessä pisteessä, epookissa ja kokeilussa; sen aritmetiikka laskettiin uudelleen numpylla ennakkorekisteröidyllä kynnyksellä (sijainnit ja persentiilit täyttyivät; aseman korjaukset eivät täyttäneet omaansa kaksoistarkkuuden pyöristyksen vuoksi, kirjattu). MODELLED; kirjanpitorivi ”Lunar reference-station coverage and accuracy map”. Ei yhteyttä mihinkään virastoon eikä minkään viraston tukema; ei lausuntoa minkään todellisen järjestelmän suorituskyvystä.

seg-3d0cd9692787 = <b>Ennakkorekisteröity ennuste: kuun referenssiaseman kattavuus</b> (ei validointi; MODELLED). <a1><c1/></a1> jäädyttää commitissa c05dac1d tyypin <c2/> tulokset julkisesti ilmoitetuilla oletuksilla, syötteiden ja tulosten SHA-256-tiivisteillä ja nyt kiinnitetyllä pisteytysprotokollalla (kerroin { "2" } tarkkuuksille ja suojaustasoille, { "10" } prosenttiyksikköä saatavuudelle ja kattavuudelle; muuttunut oletus saa uuden päivätyn ennusteen, ei koskaan muokkausta; ennusteen epäonnistuminen julkaistaan yhtä näkyvästi kuin osuma). Jokaista lukua hallitsee nelisatelliittitähdistön julkaisematon alkiojoukko, joka on ILLUSTRATIVE ja ilmoittaa sen itse. <c3/> suojaa sitä; <c4/> saa osion ”Pre-registered predictions”. Ei kirjanpitoriviä.

seg-00ec7ccd4d0d = <b>Kuun referenssiaseman laajennukset</b> ({ "0.36" }; aseman tutkimuksen rajoitukset { "2" } ja { "3" } sekä lähteiden ratkaisutyyli), kukin valinnainen tyypillä <c1/> ja oletuksena poissa, joten jokainen nykyinen asiakirja, jäädytetty ennuste mukaan lukien, on ennallaan: <c2/> (monitie-eteneminen <c3/> käyttäjällä ja asemalla, aseman valinnaisesti Gauss–Markov epookkien yli, DLL-koodikohina C/N0:sta, kanavien väliset harhat; arvot ILLUSTRATIVE Kuulla); <c4/> (lähetetyn ratavirheen lineaarinen kasvu korjausviiveen aikana, ILLUSTRATIVE); <c5/> (korkeusrajoite, sen kanssa kolmen satelliitin minimi, staattisen käyttäjän ikkuna epookkien yli). Kaksi lisäystä julkaistujen väitteiden vertailuun, kumpikin ennakkorekisteröity yksin ennen ajoaan, sijaitsevat muokkaamattoman tallennetun ajon vieressä: K5 kasvulla epäonnistuu jokaisella nopeudella; lähteiden ratkaisutyylillä K1–K5 epäonnistuvat ja K6 menee läpi ({ "1" } / { "6" }), ja R300:n korjattu p95 3D-virhe laskee arvosta { "280.6" } m arvoon { "2.11" } m. MODELLED; kolme kirjanpitoriviä.

seg-1d0a0dcd42de = <b>Kuun maaston horisonttimaskit</b> ({ "0.36" }; kuun referenssiasematutkimuksen ensimmäinen rajoitus): valinnainen osio <c1/> tyypillä <c2/> (asema ja jokainen käyttäjäpiste) ja <c3/> (jokainen ruudukkopiste) antaa kullekin paikalle atsimuutista riippuvan horisontin versiossa { "0.36" } esitellyssä taivaanrantataulukon muodossa, ilmoitetusta profiilista, joka on merkitty lähteellään (<c4/>, <c5/>), ja/tai napa-DEM:n yli säteen marssilla (<c6/>) Kuun pallon isoympyröitä pitkin tarkalla kaarevuudella. Sisältää vendoroidun rajauksen (koko { "0.98" } MB) public domain -aineistosta LRO LOLA <c7/> etelänapa-DEM, { "5" } x { "5" } lohkokeskiarvolla uudelleennäytteistettynä tarkkuuteen { "1200" } m (<c8/>, NOTICE-tiedostoineen, SHA-256:ineen ja <c9/>), sekä vain repositoriossa olevan skenaarion <c10/>. Tarkistettu suljetun muodon horisontteja vasten (paljas pallo, kraatteri tasangolla, rasteroitu kartio); MODELLED, kirjanpitorivi ”Lunar terrain horizon masks from a stated profile or a polar DEM”. Ilman osiota jokainen asiakirja, yksikkölohko mukaan lukien, on tavu tavulta identtinen.

seg-ca0c6ca7396a = <b>Geometriatietoinen luottamus</b> (version { "0.36" } geometriasuunnitelmamuistio, osa { "4" }). Jokainen tyypin <c1/> epookki, staattinen tai alus, erä tai live, sisältää satelliittigeometriansa: <c2/>, <c3/> (syyt <c4/>, <c5/>, <c6/> ja tiedoksi <c7/>) tai <c8/>, kun loki ei anna satelliittigeometriaa, sekä HDOP, PDOP, VDOP ja käytetyt satelliitit. Se johdetaan vastaanottimen ilmoittamista korkeuskulmista ja atsimuuteista (NMEA GSV, UBX NAV-SAT) nykyisen ytimen <c9/> kautta tai otetaan NMEA GSA:sta. Jokainen epookki sisältää myös nimiön, <c10/>, <c11/> tai <c12/>, aina raportoituna eikä koskaan pisteytettynä, sekä huomautuksen, jossa HDOP, PDOP, VDOP, satelliittien lukumäärä ja signaalin menetys kerrotaan sanoin. Aluksen pistemäärä saa monitorin <c13/>, joka ei vähennä mitään, ellei geometria ole huono (HDOP yli { "4" }, PDOP yli { "6" } tai alle { "5" } käytettyä satelliittia), ja sitten nousee rampilla katoon { "15" } pistettä; pelkkä geometria yltää enintään heikentyneeseen kaistaan, ei koskaan ei-luotettuun kaistaan (ei hälytystä). Jokainen vähennys saa luokan, <c14/>, <c15/> tai <c16/>, jotta huono taivas ei näytä hyökkäykseltä. <c17/> on <c18/>, kun menetetyt satelliitit olivat kaikki alle { "15" } asteessa viimeisimmällä raportillaan; huonon geometrian vähennys on <c19/>, kun vastaanottimen ilmoittama HDOP on ristiriidassa sen ilmoittaman taivaan kanssa yli max({ "1.0" }, { "25" } % johdetusta HDOP:sta), joten väärennetty huono taivas ei voi ostaa nimiötä. Uusi taulukko <c20/> ilmoittaa jokaisen kynnyksen alkuperineen (HDOP { "4" }, PDOP { "6" }, vähintään { "5" } käytettyä, sigma_UERE { "1.5" } m, HDOP-toleranssi max({ "1.0" }, { "25" } % johdetusta HDOP:sta), jossa { "25" } % on edustava valinta vastaanottimille, joilla on tähdistökohtaiset kellot tai osajoukkoratkaisut, { "15" } astetta; IEC 61108-1- ja GPS SPS -luvut siteerattuina, tarkistettava standardien tekstiä vasten). Täyttä signaalin menetystä ei nimetä taivaaksi: kun näkyvissä olevia satelliitteja ei seurata ja näkyvissä olevien satelliittien DOP on hyvä (eivätkä seuraamattomat rajoitu horisontin toiselle puolelle), epookki sisältää <c21/> ja geometrian vähennys on <c22/>. Ilmoitettu HDOP tai PDOP, joka on { "99" } tai enemmän, GGA-laatu { "0" } ja GSA-tila { "1" } luetaan ratkaisun puutteeksi, ei DOP:ksi. Katto (<c23/> { "15" }), rampin loppu (<c24/> { "1.5" }) ja lattia (<c25/>, oletuksena pistemäärän <c26/>) ovat osiossa <c27/>, samoin nimiön hyvät tasot (HDOP { "2" }, PDOP { "3" }, { "6" } satelliittia, edustava); voimassa oleva katto on <c28/>, joten taulukko <c29/>, joka nostaa arvoa <c30/> (myös { "0.35" }), laskee kattoa eikä hylkää sitä, ja lattia arvon <c31/> alapuolella hylätään. MODELLED; ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }): käyttäjä vastaa edelleen aluksen navigoinnista.

seg-d976d3495695 = Geometria ulottuu jokaiselle pinnalle: tulos-JSON (<c1/>, <c2/> jokaisella vähennyksellä, <c3/>, <c4/>), live-JSON-rivit (skeema { "1.3" }), Pythonin ja WebAssemblyn <c5/>, <c6/> ja <c7/>, MCP-työkalut <c8/>, todistepaketit (<c9/>, <c10/>, geometriakaista yhteenvetosivulla) ja <c11/> (Prometheus <c12/> ja nimiö <c13/> kohteessa <c14/>, OTLP <c15/>, CEF-mukautetut kentät <c16/> (geometrian tila ja luokat), <c17/> (HDOP) ja <c18/> (PDOP), tarkistettu molemmilla CEF-oraakkelijäsentäjillä, sekä LEEF <c19/>, <c20/>, <c21/>). Geometrianimiö viedään myös, lisättynä kaikkien aiempien sarjojen ja kenttien jälkeen ja vain syötteille, jotka sen sisältävät: Prometheus <c22/> ja <c23/>, OTLP <c24/> ja <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, ja CEF kolmas kenttä <c30/> (nimiö) ja <c31/> (käytetyt satelliitit); VDOP ei ole CEFissä (liukulukuiset mukautetut kentät on jo varattu). Molemmat CEF-oraakkelijäsentäjät lukevat nimiötapaukset takaisin sellaisinaan (muutos { "5" }: { "176" } riviä, { "172" } jäsentyi pycefillä, { "176" } Logstashilla). Ilmoitettu HDOP, jota ilmoitettu taivas ei selitä, merkitään jokaiselle epookille ja lasketaan (<c32/>, rivi todistusyhteenvetosivulla), pisteytetään vain kun geometria on huono. Signaalin menetys viedään erikseen, koska geometrian tila pysyy tilassa <c33/> sen ollessa voimassa: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; CEFissä se näkyy luokkana <c37/> kentässä <c38/>.

seg-5030e5214ed0 = <c1/>: kovarianssitekijä <c2/> funktion <c3/> takana, erotettuna siitä samalla aritmetiikalla.

seg-c6cc061a3ed6 = Kirjanpitorivi ”Position error from geometry: RMS error = sigma_UERE x DOP” (<b>MODELLED</b>, sisäinen johdonmukaisuus): siemenluvulla ajettu Monte Carlo moottorin pienimmän neliösumman ratkaisusta { "8" } gnss_lib_py-sovitetulla DOP-geometrialla validoidun DOP-ytimen kovarianssitekijää vasten, toleransseilla, jotka ennakkorekisteröitiin ennen ensimmäistä ajoa, ja kahdella negatiivisella kontrollilla, jotka epäonnistuvat vaaditusti; sen rinnalla aiempi tarkistus neljällä käsin valitulla taivaalla khiin neliö -luottamusväleillä, raportoitu ajettuna ennen ennakkorekisteröintiä.

seg-b87b6eafd465 = <b>Atsimuutista riippuvat taivaanrantamaskit</b> (<c1/>, <a1><c2/></a1>, suunnitelmamuistion kohta { "1" }): atsimuutista riippuva korkeuskulmaleikkaus, taulukoiden pistekohtainen maksimi (kukin interpoloidaan erikseen, kierretty kohdassa { "360" }°), katukuilu suljetussa muodossa (valinnaisilla avoimilla päillä), teräväreunaiset sektorit ja maastoprofiili Maan kaarevuudella; tehollinen leikkaus on <c3/>. Neljä esiasetusta (REPRESENTATIVE) ilmoitetulla alkuperällä (<c4/>, <c5/>, <c6/>, <c7/>), ohitettavissa kenttä kerrallaan. Valinnainen osio <c8/> tyypeissä <c9/>, <c10/>, <c11/> (kaikki tilat, napapyyhkäisy mukaan lukien) sekä koulutustiedostoissa <c12/> ja <c13/>, ja tyypeissä <c14/> ja <c15/> uuden maa-asemakäyttäjän kautta, <c16/> (geodeettiset katselukulmat pyörivällä Maalla, geodeettisella ylöspäin ARAIMin vaaka-/pystyjaolle; kukin näyte on yksi absoluuttinen hetki, <c17/>, johon alkiojoukot, yleislähetetyt efemeridit ja SP3-tiedostot edistetään omista epookeistaan, päivättynä uusimmasta satelliittiepookista, kun <c18/> ei ole ilmoitettu; kiertävä <c19/> hylkää taivaanrantaprofiilin). Tuloksiin tulee <c20/> ja näytekohtainen <c21/>. Ilman osiota jokainen skenaario on tavu tavulta identtinen version { "0.35.0" } kanssa, tarkistettu julkaisucommitin tiivisteitä vasten. Kuusi mukana toimitettua esimerkkiä: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> ja kampanja <c27/> (autonomisen ajoneuvon kuilu tasaisena leikkauksena ja katuna; nykyinen kampanja on ennallaan). MODELLED.

seg-95cdecf341d6 = <b>Taivaan geometriafunktiot</b> (<c1/>, suunnitelmamuistion kohta { "2" }): <c2/> (näkyvät ja maskatut satelliitit paikasta, ajasta ja tähdistöesiasetuksista, kaksirivisistä alkiojoukoista (<c3/>, enintään { "4" } MiB, moottorin SGP4:llä propagoitu UTC-epookkiin <c4/>) tai annetuista satelliiteista; <c5/> ja <c6/> kertovat, onko taivas edustava vai alkiojoukkojen antama taivas kyseisellä epookilla, ei mittaus; <c7/> luettelee jokaisen käyttämättömän rivin syineen; syötekatot { "2000" } horisontin yläpuolella olevaa satelliittia, tarkistettu ennen järjestelmätaulukon rakentamista, ja { "16" } vastaanotinkelloa; viisi DOP:ia; ENU-kofaktori ja kovarianssi yhdellä kellolla järjestelmää kohti tai yhdellä yhteisellä; vaakavirhe-ellipsi yhden sigman tasolla ja ilmoitetulla luottamustasolla), <c8/> (siemenluvulla ajetut pienimmän neliösumman virheet, enintään { "5000" }), <c9/>, <c10/> ja <c11/>. <c12/> paljastaa kovarianssin funktion <c13/> takana, joka on nyt sen redusoitu muoto (validoidut skalaarit ennallaan). Pinnat: <c14/> ja <c15/>, samannimiset Python- ja WASM-funktiot sekä MCP-työkalu <c16/> ({ "40" } työkalua), ja muistikirja <c17/> (sen peilitiedosto <c18/>; ajaa testi <c19/>). Jokainen tulos sisältää nimiön MODELLED, virhemallin lausuman ja ohjeellisuusilmoituksen.

seg-9414d387cf79 = Kirjanpito: viisi taivaanranta- ja taivaan geometria -riviä. <b>VALIDATED</b>, kukin vertailussa, joka ennakkorekisteröitiin ennen oraakkelin ajoa: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> ohjelmaa Orekit { "12.2" } (<c1/>, <c2/>) ja gnss_lib_py { "1.0.4" } (<c3/>) vasten, pahimmat katselukulma- ja maskierot { "1.1e-12" }° kynnystä { "1e-9" }° vasten, identtiset näkyvät joukot, DOP { "3.3e-13" } suhteellisesti (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> numpyn funktioita <c5/> ja <c6/> vasten (standardi P2), { "270" } tapausta, akselit { "5.1e-13" } suhteellisesti (<c7/>). <b>MODELLED</b>: kuilu-, sektori- ja maastoredusoinnit; esiasetukset; taivaan geometrian koostumus (esiasetustaivas, Monte Carlo -pilvi).

seg-8f5ebce999fe = Kun mukana ovat geometrialuottamus-, taivaanranta- ja kuun referenssiasemarivit, kirjanpidossa on { "274" } riviä: { "134" } validoitua, { "136" } mallinnettua ja { "4" } kumppanirivi.

seg-686b1211d7bb = <b>Kuun referenssiasema: asemakellolaboratorio</b> (<b>MODELLED</b>). Valinnainen lohko <c1/> tyypillä <c2/> (<c3/>). Se mallintaa asemakellon (oletuksena miniRAFS-luokka, mikä tahansa nimetty luokka tai laitekortti, joka on sovitettu ilmoitettuihin stabiiliuspisteisiin) ohjattuna LTC:hen, sitten vapaasti käyvänä tai uudelleenohjattuna joka N sekunti. Se tuottaa aikavirhekäyrän x(t), ajan, joka kuluu arvoihin { "1" }, { "10" } ja { "100" } ns (bisektio suljetun muodon rinnalla) ja hallitsevan termin horisonttia kohti, kaikki yksiköin. Ohjausjäännös on ILLUSTRATIVE. LTC-nopeutta ei johdeta uudelleen, ja sillä on oma rivinsä tasolla VALIDATED. Julkisen ICG WG-B:n Lunar PNT -aineiston (kesäkuu { "2024" }) nanosekuntitason tavoite siteerataan lähdelausumana, ei väitteenä. Kellojärjestys optinen < PHM < RAFS < miniRAFS pätee arvosta { "1" } s arvoon { "7e5" } s, ja testi kiinnittää PHM- ja RAFS-käyrien leikkauskohdan lähelle { "7.5e5" } s. Tämä leikkauskohta on yhden kohinatyypin kellomallien ominaisuus (puhdas flicker FM vastaan puhdas valkoinen FM), ei fysikaalinen tulos. Ilman lohkoa raportti, sen taulukko ja sen yhteenveto ovat ennallaan. Esimerkki: <c4/>. Lisää yhden kirjanpitorivin, jonka nimiö on MODELLED.

seg-863c2c7a5f0b = <b>Kuun referenssiasema: aseman geodesia</b> (<b>MODELLED</b>). Valinnaiset syötteet <c1/> ja <c2/> tyypillä <c3/> lisäävät lohkon <c4/>. Arkistoidusta laseretäisyysviipaleesta saatu viiden ryhmän datum-informaatio yhdistetään siihen, mitä lisätty retroreflektori ja lisätty VLBI-majakka ilmoitetuilla paikoilla toisivat. Reflektori etäisyysmitataan arkistoiduilla epookeilla, jotka se näkee, niiden arkistoiduilla painoilla. Majakka käyttää verkkoa ja aikataulua <c5/>, asemat kiinnitettyinä. Lohko antaa kunkin Helmertin 1-sigman ennen ja jälkeen sekä niiden suhteen. Nämä ovat Cramer–Rao-rajoja pelkistetylle parametrijoukolle, aikataululla ja paikalla, jotka ovat ILLUSTRATIVE. Puuttuvat tai tyhjät syötteet jättävät raportin tavu tavulta identtiseksi. Esimerkit: <c6/> ja <c7/>. Lisää yhden kirjanpitorivin, jonka nimiö on MODELLED.

seg-45c6febcc7fc = <b>Kuun referenssiasema: vertailu julkaistuihin väitteisiin</b> (<b>MODELLED</b>). Jokainen numeerinen väite viidessä julkisessa lähteessä luetellaan täsmällisine sanamuotoineen, sivuineen ja ilmoitettuine oletuksineen ja luokitellaan vertailukelpoiseksi, osittain vertailukelpoiseksi tai ei vertailukelpoiseksi (<c1/>; lähteet URL-osoitteineen, hakupäivineen, SHA-256:ineen ja lisensseineen tiedostossa <c2/>). Osittain vertailukelpoiset väitteet pisteytettiin kuudella yksipuolisella kynnyksellä, jotka ennakkorekisteröitiin ennen ajoa (<c3/>, revisio { "2" }, 05bf9a19): { "1" } / { "6" } väitettä ennakkorekisteröidyn kynnyksen sisällä (ennakkorekisteröity 05bf9a19). Kattavuus on { "0.00" } kynnystä >= { "0.95" } vasten molemmilla etelänapa-alueen ympyröillä, ja korjattu p95 on { "280.6" } m kynnystä <= { "1.5" } m vasten. Syynä ovat satelliittien ratalementit, joita mikään lähde ei julkaise: puussa olevilla alkioilla (ILLUSTRATIVE) neljä satelliittia on yhteisessä näkyvyydessä { "8" } % epookeista, lähes singulaarisella geometrialla. Ajo ei toista väitteitä näillä alkioilla eikä ole todiste siitä, että väitteet ovat vääriä. Kiinnitetty tiedostossa <c4/>. Yksi kirjanpitorivi, jonka nimiö on MODELLED, havainnon kanssa.

seg-2b01d2ccb666 = <b>Kuun referenssiasema: kellotiedoston datavalmius</b>. <c1/> ilmoittaa nyt epookkiensa aikajärjestelmän. Se on arvo <c2/> tai, kun sitä ei ole ilmoitettu, otsikon satelliittijärjestelmän oletus. Tulos kertoo myös, ilmoitettiinko järjestelmä. Funktio hylkää tuntemattoman aikajärjestelmän (esimerkiksi kuun aika-asteikon), ilmoittamattoman sekajärjestelmätiedoston ja tiedostot, jotka ovat keskenään ristiriidassa, sen sijaan että lukisi ne GPS-aikana. Se toimittaa synteettisen asemakellotestiaineiston. Korjaustiedostomuotoa ei ole määritelty, koska julkista muotoa ei ole.

seg-0fb89eb36003 = Muutettu

seg-b63c95f12bc4 = Moduulien <c1/>, <c2/> ja <c3/> moduulidokumentaatio ei enää kutsu 17-tilaista UKF-navigaattoria, koko-INS-tiukkaa kytkentää ja eksplisiittistä kellotilaa tulevaksi työksi; ne viittaavat kohteisiin <c4/>, <c5/> ja <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } ei enää hylätä</b> ({ "0.36" }, WP-07): RINEX { "4" } -navigointitiedosto hylättiin ennen tarkoituksella; nyt se luetaan (ks. Lisätty). Versioiden { "4" } ja uudempien havaintotiedostoissa otsikkonimiöt täsmätään vain sarakkeissa 61-80, jotta uudet vapaatekstitietueet eivät voi esiintyä nimiöinä.

seg-5829841b58d7 = <b><c1/> lukee todellisia IONEX-tiedostoja</b> ({ "0.36" }, WP-07): täysi 16 arvon tietue täyttää sarakkeet 61-80, jotka lukija piti nimiönä, joten se palautti <c2/> jokaisella todellisella IONEX-tiedostolla. Se lukee nyt tietueen, jonka nimiökenttä on numeerinen, arvoina. Mikään toimitettu tuloste ei käyttänyt sitä.

seg-a66bd6592b93 = <b>Galileo E1- ja E5a-vastaanotetut tehot standardin OS SIS ICD Issue { "2.1" } mukaan</b> (revisio, 2026-10-14). Spektrikaistat <c1/> ja <c2/> sekä LEO-signaalien GNSS-uhrit, jotka ottavat tehonsa niistä, käyttävät nyt Galileo OS SIS ICD Issue { "2.1" } taulukon { "12" } pienimpiä vastaanotettuja tehoja: −{ "157.25" } dBW (aiemmin −{ "157.0" }) ja −{ "155.25" } dBW (aiemmin −{ "155.0" }).

seg-b0386f62923f = Yhdeksän skenaarion tulosta muuttuu: spektriesimerkit, spektrikampanja, kolme LEO-kestävyysvertikaalia ja kolme LEO-signaalisuunnitelmaa. Efektiivinen C/N0 muuttuu −{ "0.25" } dB ja J/S +{ "0.25" } dB näillä kaistoilla.

seg-2af90bfcefae = Jokainen muuttunut arvo ({ "1766" }, vanha → uusi) on lueteltu tiedostossa <c1/> ja sen CSV:ssä, yhdessä muuttuneiden dokumentaatiotaulukoiden kanssa. Mikään kirjanpitorivi ei muuta tilaansa.

seg-d468174b2d4c = Toinen osa, samana päivänä: LEO-signaalien uhrit <c1/> (−{ "155.0" } → −{ "155.25" } dBW, taulukko { "12" } E5b) ja <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD:ssä ei ole koko kaistan E5-riviä, joten AltBOC-arvo on taulukon { "12" } E5a- ja E5b-kokonaisarvojen tehosumma, rakennettu kuten vanha arvo. Kolme LEO-signaalisuunnittelun tulosta muuttuu ({ "64" } arvoa: nämä vastaanotetut tehot ja LEO:sta GNSS:ään suuntautuva C/N0-heikkeneminen kahdella uhrilla), luetteloituna samassa revisiossa (§{ "5" }) ja CSV:ssä. Mikään muu ei muutu.

seg-a96992246ef8 = <b>S2-ilmakehän vuorovesikorjaus</b> (<c1/>). Rayn ({ "2001" }) S2-ilmanpaineharmoniset ovat normalisoimattomien <c2/> kertoimia kosinivaiheviiveillä; niitä käytettiin täysin normalisoituina ja viive IERS-sinijohtona. Ne tulevat nyt jaettuina arvolla <c3/>, kun <c4/>; uusi <c5/> toistaa GFZ STR06/01 Table { "5" } mallin A2 kaikille { "21" } aallolle (pahin { "0.0005" } cm, { "0.05" }°; VALIDATED). Vain vuorovesi käytössä olevat tulokset muuttuvat: Galileo CI -sovitus { "0.132" } → { "0.133" } m, Swarm-A-komponentit { "1" }–{ "2" } mm (ennakkorekisteröity tiedostossa <c6/>).

seg-6fa076226c01 = Vain dokumentaatio: <c1/>, <c2/> ja <c3/> dokumentoidaan vanhoiksi ratkaisijoiksi, numeerisesti ennallaan, viitaten kohteeseen <c4/>.

seg-a757fd7ca793 = <b>D9 kierros { "3" } (<c1/>) tila.</b> BIPM Circular T { "465" } ilmestyi 2026-10-12. Ennakkorekisteröityä prospektiivista pisteytystä ei ole vielä ajettu: numero { "465" } sisältää noin { "285" } testiarvoa, ja pysäytyssääntö vaatii { "1000" }, eli noin numerot { "465" }–{ "468" }. Ajo tarvitsee myös arkistoidut 2026-09-30 laboratoriokohtaiset tiedostot, koska BIPM on sittemmin kirjoittanut uudelleen niistä { "87" } / { "113" }. Kirjanpitorivi ja testin otsikko kertovat tämän; testi, sen kynnykset ja sen jako ovat ennallaan.

seg-e064546d05ec = <b>Dokumentaation totuustarkistus ({ "0.36" }).</b> Tiekartta, ominaisuusrivit, suunnitteludokumenttien tilarivit ja moduulikommentit saatettu vastaamaan koodia; mikään tuloste ei muutu. Kohdat, jotka on jo rakennettu mutta jotka oli edelleen listattu avoimina, on nyt merkitty tehdyiksi: ITU-T-maskitarkistukset, holdover-skenaario, jonka pituus on { "24" } h, ja kellolokin sisäänluku (telecom timing), ensimmäisen minuutin pikaoppaat, Lense–Thirring ja Orekit-propagaattorin ristiintarkistus, ITRF-tarkka GCRS-ketju, golden- ja alustojen väliset tiivisteet, alkuperä, usean vian ARAIM (ADD v4.2), yhden satelliitin FDE, CRPA-kirjasto, CAI-juovaepäselvyysraja, streets-of-coverage-mitoitus ja 3D-ratanäkymä, jäykän kappaleen asennon dynamiikka, OMM-kirjoittaja ja NAIF-kernelilukija, DE440-kuun libraatio, ajon merkitys -lause playgroundissa, <c1/>, 17-tilainen tiukasti kytketty navigaattori ja gravity-map-tyyppi. Rivit kertovat myös täsmällisesti, mikä on yhä avoinna (esimerkiksi kaksiosainen JD kohteessa <c2/>, lukija <c3/> todellista tuotetta vasten ja usean satelliitin poissulkeminen kohteessa <c4/>). Puuttuva <c5/> on kirjoitettu sen testien tuoreesta ajosta (M1–M4 menevät läpi), ja kumppaneille suunnatulla IQ-validointiluonnoksella on ajantasaiset kirjanpidon luvut.

seg-e2290a640df7 = Galileo E1 -muistikoodit eivät enää kuulu mukana toimitettavaan aineistoon.

seg-80f8ca869682 = Tiedostot <c1/> ja <c2/> (ICD:n liite C.7/C.8) on poistettu repositoriosta ja paketeista. ICD:n ehdot (lainattu tiedostossa <c3/>) sallivat käyttäjän tallentaa koodit lähde mainiten ja käyttää niitä tuotteessa, mutta sallivat uudelleenjakelun vain ei-kaupallisiin tarkoituksiin, ja Kshanaa tarjotaan myös kaupallisella lisenssillä. Funktiot <c4/> / <c5/> palauttavat nyt arvon, jonka tyyppi on <c6/>, ja lukevat käyttäjän oman kopion ympäristömuuttujista <c7/> / <c8/> tai lähdekoodin työkopiossa hakemistosta <c9/>, johon uusi komentosarja <c10/> poimii ne ICD:n PDF-tiedostosta (tiivisteellä tarkistettuna). Vakiot <c11/> / <c12/> on poistettu. Ilman taulukoita Galileo E1 -signaalit (<c13/>, <c14/>) palauttavat virheen, joka kertoo, miten taulukot toimitetaan, ja E1-testit ohitetaan viestin kera. Kun taulukot ovat paikallaan, jokainen E1-tuloste on ennallaan. Mikään skenaario-, golden- tai spektritulosteista ei käytä kooditaulukoita. E5a-liitteen C.3/C.4 testiaineisto (LFSR-oraakkeli tiedostossa <c15/>) käsitellään samoin: sama komentosarja hakee sen, se on git-ignored, ja testi ohitetaan ilman sitä.

seg-654d0358137b = <b>Siirrettävä matematiikka kaikkialla</b> ({ "0.36" }, STUDIO-15): jokainen tyypin <c1/> transsendenttifunktio kirjastossa sekä kirjastosta <c2/> peräisin olevat normaali-, gamma- ja eksponenttijakauman otantafunktiot laskevat nyt puhtaan Rust-toteutuksen <c3/> kautta (<c4/>, <c5/>), joten natiivi- ja WebAssembly-käännös palauttavat tavu tavulta identtisen tulos-JSON-tiedoston kaikille { "141" } mukana toimitetulle skenaariolle ja lyhyelle IQ-ajolle. Hintana isännän matematiikkakirjastolla lasketuissa tuloksissa viimeiset bitit siirtyivät: { "98" } mukana toimitetusta { "141" } skenaariosta muuttui, { "43" } ei; { "5" } muuttui suurimmassa kentässään yli { "1e-3" }, ja loput vähemmän. Jokainen muuttunut arvo on lueteltu muodossa vanha -> uusi tiedostossa <a1><c6/></a1> (mukana CSV kaikista { "136,127" } muuttuneesta luvusta); mikään kynnys, toleranssi tai raja-arvo ei muuttunut. Muuttuneet julkaistut luvut: skenaarion <c7/> saatavuus Maa-etäisyydellä { "0.719" } -> { "0.713" } ja RMS-virhe { "86.147" } -> { "86.499" } m (yksi saatavuuden rajalla oleva epookki ratkeaa nyt kaikkialla samoin; macOS arm64:llä se tulosti { "0.725" } / { "85.800" } m); skenaarion <c8/> asemavirhe { "3.541350" } -> { "3.536885" } m VLBI:n kanssa ja { "2183.558" } -> { "2184.021" } m ilman; tiedosto <c9/>, jossa kahdeksan arvoa kohteessa <c10/> muuttui { "3" } yksikköä viimeisellä numerosijalla (korjaus teknisessä raportissa); julkaistu asiakirja <c11/> pyöristyslattian suureissa (kahdeksan arvoa kuudennen merkitsevän numeron jälkeen, suhteellisesti enintään { "6.8e-5" }; mikään järjestys tai raja ei siirtynyt). Tavuidenttisyyssuojien (<c12/>, <c13/>, <c14/>) kiinnitetyt tiivisteet on asetettu uudelle nimetylle ”{ "0.36" } portable” -lähtötasolle, ja arvot versiosta { "0.35.0" } säilytetään historiallisena tietueena; jäädytetty kuun vertailuaseman ennuste on koskematon, ja sen siirrettävällä matematiikalla tehty uusinta-ajo on tallennettu sen viereen (<c15/>). Testi <c16/> (validoitu kuun yhteisen radanmäärityksen (OD) rivi): testiaineisto vietiin uudelleen ja numpy-vertailu ajettiin uudelleen versiolla numpy { "2.4.6" }, rekisteröity versio, komentosarja ja kynnys ennallaan; kaikki kuusi verkkoa läpäisevät kynnyksen (<a2><c17/></a2>). Erän 2-3 työ, joka yhdistettiin STUDIO-15:n jälkeen, käyttää myös siirrettävää matematiikkaa ({ "457" } kutsukohtaa { "62" } tiedostossa); sen aiheuttamat muutokset on kirjattu tiedostoon <a3><c18/></a3>: { "12" } mukana toimitettua skenaariota (suurin suhteellinen muutos { "5.2e-8" }, mikään tulostettu luku ei siirry), { "28" } skyline-suojarivin hyväksyminen uudelleen, kampanjan <c19/> M2M4-tiiviste, vanhan kohteen <c20/> totuustiivisteet, havaitsemattoman majakan datumin sigma ({ "632.3769" } -> { "632.3772" } m) sekä kaksi kirjattua löydöstä (CR3BP DRO -sulkeumat; CRPA A3, { "456" } linkistä { "194" }). Greenhallin tarkka edf säilyttää validoidun kynnyksensä, kun sen ytimessä on double-double-logaritmi (<a4><c21/></a4>), ja gps-sdr-sim test-bench-oraakkeli ajettiin uudelleen muuttuneille NMEA-viennille, ja kaikki kynnykset pitävät (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: kuun sarjan rivi ilmoittaa kunkin osan todisteiden tason (aiemmin siinä luki, että kaikki olivat MODELLED).

seg-ffb14764a7a9 = <c1/> palauttaa <c2/> (sarja, ruudukointiloki, aikajärjestelmä, ilmoitettiinko se, tietuetyyppi) monikon <c3/> sijaan. Se palaa nyt satelliittitietueista (<c4/>) pyydetyn nimisiin vastaanotin- tai asematietueisiin (<c5/>).

seg-6777ca96624a = Pisteet eivät muutu, ellei geometria ole heikko; merkintä raportoidaan aina. Hyvällä tai kohtalaisella geometrialla (mukaan lukien vain GPS:ää käyttävä avoin taivas, jossa on { "8" } satelliittia) tai tuntemattomalla geometrialla (monitori ei ole käynnissä) jokainen pistemäärä on sama kuin versiossa { "0.35" }: testi <c1/> kiinnittää molempien esimerkki-istuntojen tulosteet ja testi <c2/> jokaisen tallennetun aluksen NMEA-aineiston (myös vain GPS:ää käyttävänä avoimena taivaana) sekä miehistökoulutuksen skenaariot version { "0.35.0" } tavuihin, kun lisätyt avaimet on poistettu; kahdessa koulutusskenaariossa, joissa häirintä heikentää geometrian, heikot epookit eroavat pelkän geometriavähennyksen verran. Heikon geometrian loki menettää enintään { "15" } pistettä, joita se ei menettänyt versiossa { "0.35" }. Muut tarkoitetut muutokset ovat kaikki lisäyksiä: yllä mainitut avaimet tulos-JSON-tiedostossa ja todistepaketeissa (<c3/> ei muutu); live-JSON-lines-skeema muuttuu versiosta { "1.2" } versioon { "1.3" } (<c4/> lisätty loppuun, <c5/> jokaiseen vähennykseen); otteen yhteenvetoon tulee <c6/>; telemetriaan tulee geometriasarjat, kentät ja merkintä <c7/> vain syötteille, jotka sisältävät ne, joten version { "0.35" } virta tai tulos piirtyy tavu tavulta kuten ennen. Nimi <c8/> on 17. monitorin nimi; se luetellaan viimeisenä kohdassa <c9/>, kun se on ratkaissut (alus, jonka loki antaa geometrian; version { "0.35" } luettelo säilyttää järjestyksensä ja yhteenvedon monitorien lukumäärä kasvaa yhdellä), eikä sillä ole merkintää kohdassa <c10/> (sen asettaminen evätään: sen vähennys asetetaan kohdassa <c11/>).

seg-45b44c851937 = <c1/> ilmoitti kirjaston gnss_lib_py lisenssiksi Apache-2.0; julkaisu { "1.0.4" } on MIT-lisenssillä.

seg-a1a670a9c63e = NMEA-lukija lukee nyt GSA:n (lyhyt GSA ohitetaan eikä lasketa ohitetuksi) ja säilyttää GSV-korkeuskulmat ja -atsimuutit, myös ilman signaalia lueteltujen satelliittien osalta; UBX-lukija säilyttää NAV-SAT-korkeuskulman ja -atsimuutin. C/N0 luetaan täsmälleen kuten ennenkin.

seg-0bafbea5c75d = <b>Tuloksen muutos: laajakaistaiset ja pyyhkäisevät häirintälähteet käyttävät nyt arvoa Q = { "2" }.</b> Häirinnänestoyhtälö käyttää näille häirintälähteille oppikirjan hajaspektrikorjausta Q, kun se aiemmin käytti arvoa { "1" }. Q = { "2" } on valkoinen kohina pääkeilan yli, kun kaistan sisäinen signaaliteho on normalisoitu; se on kiinnitetty testeissä suljettuun muotoon, joka on peräisin moduulista <c1/>.

seg-21f31ec302de = <b>Ennallaan:</b> CW- ja kapeakaistaiset häirintälähteet (Q = { "1" }), tunnistamaton häirintälähteen tyyppi (Q = { "1" }, vahingollisin arvo) ja <c1/>.

seg-f362499d2ed0 = <b>Vaikutus:</b> siellä, missä laajakaistainen tai pyyhkäisevä häirintälähde vaikuttaa, tehollinen C/N0 nousee enintään { "3.0103" } dB, johdetut J/S-kynnykset nousevat { "3.0103" } dB ja vapaan tilan estosäteet kutistuvat kertoimella { "0.7071" }.

seg-088dcd34cc88 = <b>Muuttuneet mukana toimitetut skenaariot:</b> { "144" } skenaariosta { "12" } muuttuu, kaikki ennakkorekisteröidysti (<c1/>, tulokset tiedostossa <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: menetettyjä satelliitteja { "26" } → { "0" }, lukituksen menetyksen turvaetäisyyden mediaani { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: silmukkadynamiikan estosäde { "75.2" } → { "53.2" } km;

seg-096a24491872 = sekä niitä sisältävät kampanjat ja spektrin ristiintarkistukset.

seg-ecdf60335064 = <b>Vaikutuksen kohteet:</b> tyypit <c1/>, <c2/>, <c3/> ja <c4/>, spektrityyppien tarkistus <c5/>, IQ-kampanjan viitekäyrä (MODELLED) ja labfit-oletus Q sekä interop-kohtauksen vienti.

seg-89672d99e9e2 = JetBrains-lisäosa: ei käytöstä poistettuja eikä poistettavaksi ajoitettuja alustan rajapintoja. Viisi valintaikkunaa käyttää pientä luokkaa <c1/>, jossa on pudotusvalikko, käytöstä poistetun <c2/> tilalla; yhden tiedoston valitsimet käyttävät konstruktoria <c3/> käytöstä poistetun <c4/> tilalla; animaatio avataan kutsulla <c5/> käytöstä poistetun <c6/> tilalla, jonka alusta { "2026.3" } ajoittaa poistettavaksi. Since-build pysyy arvossa { "243" }. IntelliJ Plugin Verifier raportoi Compatible ilman käytöstä poistettujen tai poistettavaksi ajoitettujen rajapintojen käyttöä versioita { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) ja { "2026.3" } EAP (IU-263.6259.32) vastaan; tehtävä <c7/> tarkistaa oletuksena version { "2024.3" } ja minkä tahansa luettelon, joka on annettu muuttujassa <c8/>.

seg-58ee61cbd633 = Funktiot <c1/> ja <c2/> palauttavat tyypin <c3/>: virheellinen osio <c4/> on virhe, kun funktiota kutsutaan suoraan, kuten se jo oli kutsuttaessa funktion <c5/> kautta, eikä hiljainen paluu tasaiseen maskiin. <b>Rikkova muutos</b> näiden kahden funktion Rust-kutsujille.

seg-9b4113258e1e = <b>Kampanjan pisteytys: todellista seurantasilmukan väärää lukitusta ei koskaan laskettu</b> (<c1/>). Seurantasilmukan väärän lukituksen tarkistus siirtää kanavan tilasta LOCKED tilaan LOST sen laukeamisen yhteydessä. Pisteyttäjä merkitsi kanavan seuraavan päivityksen, joka oli silloin jo lukitukseton eikä siksi koskaan tullut lasketuksi. Tilasta LOCKED raportoitu tapahtuma <c2/> on nyt yksi jakso ajanhetkellään, ajossa ja jokaisessa sen sisältävässä ilmoitetussa tapahtumassa. Yksi, joka havaitaan sisäänvedon aikana, tai sellainen, jonka toistaa jo tilassa LOST oleva kanava, ei ole uusi jakso. Uusi testi ajaa todellisen väärän lukituksen: oikea GPS L1 C/A -kantoaalto, joka askeltaa 1/(2T) lukittuna ollessaan (<c3/>).

seg-ac508954b6a6 = Tiedoston <c1/> vertailukampanjassa muuttuu vain ramp/agc-3bit-ajon PRN { "11" } (väärän lukituksen jaksot { "0" } → { "1" }, { "426" } ja { "437" } lukittua tuntia kohti).

seg-cfc47d9d9237 = Sen solujen DIGEST-arvot kiinnitetään uudelleen.

seg-fcfa0de18b05 = Ennakkorekisteröity pisteytettyjen tulosten kiinnitys pysyy voimassa ja toistuu edelleen täsmälleen: sen tiivisteessä vain nämä kuusi kenttää, joita rekisteröinnin jälkeen tehty korjaus muutti, kuvataan takaisin korjausta edeltäviin arvoihinsa. Korjatut arvot kiinnitetään erikseen.

seg-b96d34bb1d36 = Mitään kynnystä ei muutettu, eikä mikään VALIDATED-rivi, kuva tai verkkosivun luku siirtynyt.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: majakka ilman havaintoa raportoidaan nyt</b> (löytyi MR-05:llä). Raporttiin tulevat <c1/> ja <c2/> vain silloin, kun jollakin majakalla ei ole havaintoa, ja tällöin havaittujen majakoiden sigmat tulevat niiden omasta informaatiosta sen sijaan, että ne olisivat kaikki null. Datumi ei muutu, eikä mikään oletus-, mukana toimitettu tai julkaistu tuloste siirry (<c3/>).

seg-c223c1fc1323 = <b>Kuun pääakselikoordinaatisto</b> (<c1/>, jota käyttävät <c2/> ja LRO-sovitus): tiedoston <c3/> DE421:n keskimääräisen Maan ja pääakselin välinen siirtymä oli sovellettu väärään suuntaan ja väärällä Eulerin kiertojärjestyksellä, joten analyyttinen PA-koordinaatisto oli noin { "208" }″ päässä PA:sta sen päällä olemisen sijaan. Se on nyt kirjattu siten kuin SPICE:n Frames Required Reading sen määrittää, ja se vastaa SPICE:n kutsua <c4/> tarkkuudella { "2.6e-16" } rad; analyyttinen PA-koordinaatisto on { "6" }″–{ "8" }″ päässä DE440:n PA:sta (ennakkorekisteröity e1ead19b, rekisteröity uudelleen be33382e sen jälkeen, kun ensimmäinen ehdotettu muutos ei täyttänyt kynnystä { "1e-12" }; <c5/>). Muuttuvat julkaistut luvut: LRO-sovitus (<c6/>), raaka päällekkäisyys { "53.8" } → { "39.9" } m, dynaaminen { "12.6" } → { "12.05" } m, redusoidusti dynaaminen { "6.65" } → { "6.67" } m (kynnykset ennallaan). Analyyttinen pino vastaa nyt ANISE DE -luokan ristiinvalidointia ({ "12.0" } / { "6.67" } m) molemmilla tasoilla; aiempi dynaamisen tason ero johtui tästä virheestä.

seg-ef2b49d4ad48 = <b>MCP-palvelin kieltäytyy asetuksesta <c1/></b> (CAP-06b-jatkotoimi). Häirintätyypin maastolaatan polku on nyt kohdassa <c2/>. Inline-rajapinta kieltäytyy skenaariosta, joka nimeää sellaisen, viestillä, jossa ei ole polkua eikä käyttöjärjestelmän virhettä. Tiedostolähteen suojatesti merkitsee nyt myös kentät, jotka päättyvät merkkijonoon <c3/>.

seg-ef005d2e3d42 = Kutsu <c1/> murtoluvullisella päiväosalla pudotti murto-osan UTC-, TAI-, UT1- ja Maan kiertymisen muunnoksissa (yhden tunnin päiväosa käänsi Maata { "15" }° väärin); päiväosa normalisoidaan nyt kokonaisluvuksi. Mikään moottorin kutsuja ei kärsinyt: jokainen välittää kokonaisen päivän, ja jokainen toimitettu tuloste on bitti bitiltä identtinen.

seg-144d90307ec6 = Suunniteltu

seg-7ef4cd25cb87 = Geometria ilmoitetusta horisonttiprofiilista ({ "0.36" } kohta { "1" }, nyt moottorissa kohdassa <c1/>): <c2/> ja <c3/> horisonttiprofiilista, kun syöte antaa sellaisen (atsimuuttiaukko varana), luonnollisen heikkenemisen (vuono tai terminaali) tapahtuma skenaariossa <c4/> sekä suunnitteluhuomautuksen kaksi maskattua geometriaa sigma_UERE x DOP -rivillä, ennakkorekisteröitynä lisäyksenä.

seg-49481d2fdf31 = Geometria RINEX-lokeille navigoinnilla (moottorin oman paikkaratkaisun perusteella) ja Android-lokeille (rivien <c1/> perusteella); molempien arvo on nykyisin <c2/>. Geometria kohteessa <c3/> (versio { "1" } ennallaan versiossa { "0.36" }) sekä Signal K- ja OpenCPN-integraatiot.

seg-57df1332ff87 = Olemassa ollut aukko, ei versiossa { "0.36" } tuotu: kun jokaisen satelliitin SNR-kenttä on tyhjä, ei laukea mikään vähennys kohteesta <c1/> eikä C/N0:n perusteella; täydellinen signaalin menetys näkyy vain geometriamonitorin arvon <c2/> kautta (luokka <c3/>). Vähennys sitä varten on suunniteltu.

seg-a5a7a10ee11c = Skeemaversion { "1.3" } virta ulkoisissa telemetria-oraakkeleissa (Prometheusin tekstimuodon jäsennin ja OTLP-keräin), jotka kattavat nykyisin vain version { "1.2" } virrat.

seg-caa1977b5b5e = Kaksipuolinen peitto (kanjoni tai kapea vuono) luetaan signaalin menetykseksi eikä estetyksi taivaaksi, kunnes horisonttiprofiili on integroitu.

seg-4bd0f178ca4e = Kolmannen osapuolen tekoälyasiakkaita nimeävä kohta on jätetty tästä pois; se on tiedostossa <a1>CHANGELOG.md</a1> GitHubissa.

seg-b2689beaba9e = Galileo OSNMA -varmennin

seg-d16c9b4bf537 = <b>Uusi moduuli <c1/> ja komento <c2/>: avoin, puhtaasti Rustilla toteutettu vastaanottimen puolen varmennin Galileo OSNMA:lle.</b> Se lukee I/NAV-sivuja ja raportoi satelliittia ja epookkia kohti, onko navigointidata todennettu, ja antaa syyn jokaiselle epäonnistumiselle tai viiveelle: HKROOT:n ja MACK:n jäsennys, DSM-KROOT:n ja DSM-PKR:n uudelleenkokoaminen, julkisen avaimen Merkle-varmennus, TESLA-avainketjun varmennus, MACSEQ:n ja tunnisteiden varmennus ADKD { "0" }, { "4" } ja { "12" } ristiintodennus mukaan lukien, sekä tulos muodossa <c3/> vastaanottimen luottamusmonitorille. Tuloste sisältää ohjeellisen huomautuksen, että tila ei ole navigoinnin eheyspalvelu. Tiedosto <c4/> kertoo, mikä varmennetaan ja mitä ei, aikavaatimuksen ja sen, ettei Kshana myönnä mitään oikeuksia EU:n OSNMA ICD:n immateriaalioikeuksien (IPR) nojalla (käyttäjät nojaavat ICD:n liitteen E valtuutukseen). Toteutettu SIS ICD:n version { "1.1" } ja Receiver Guidelines -ohjeen version { "1.3" } mukaan. Sivut CRC-tarkistetaan, ja u-bloxin UBX-RXM-SFRBX-tavuvirran voi lukea suoraan (<c5/>). Oletustestit käyttävät synteettistä dataa ja julkaistuja primitiivien tunnetun vastauksen testejä; erikseen käyttöön otettava testi lukee paikallisesti ladatun kopion virallisista testivektoreista. Riippumattoman katselmoinnin jälkeen varmennin ottaa aikansa vain varmennetuista TESLA-avaimista (harhautettu kaukaiseen tulevaisuuteen osoittava alikehys ei enää voi pyyhkiä pois epäonnistumista), antaa todennuksen vanhentua ja seurata käytössä olevaa IODnav-arvoa, noudattaa varmennettuja hälytysviestejä (joiden Merkle-lehti sisältää nyt satunnaisen NPK-kentän) ja NMA-tilaa ”älä käytä”, pitää täytetunnisteet pois satelliitin tilasta, säilyttää ketjut CID:n mukaan peruutuksen ja uusinnan kanssa, tarkistaa KROOT-täytteen tiivisteen sekä rajoittaa UBX-kehysten pituuksia ja TESLA-varmennuksen työmäärää. Satelliitti luetaan todennetuksi vain niin kauan kuin sen lähettämä uusin efemeridi- ja kellodata on bitti bitiltä sama data, joka todennettiin (ei pelkästään saman IODnav-arvon alla), todentamattoman NMA-otsakkeen tila tai peruutus lasketaan vain, kun kaksi satelliittia on samaa mieltä tai varmennettu KROOT kantaa sen, toistettu vanhempi KROOT ei voi korvata ketjua, ja pysähtynyt avainvirta raportoidaan.

seg-3e7df5c888ca = Lisätty (MCP-palvelimen kanavat)

seg-4e70d8b85211 = <b><c1/>, suoratoistettava HTTP, itse ylläpidetty.</b> Oletuksena vain loopback; ei-loopback-osoite vaatii asetuksen <c2/> ja bearer-tunnuksen muuttujassa <c3/>; mikään työkalu ei lue eikä kirjoita polkua (IQ-tiedostotyökalut ovat pois päältä); pyynnön koon, ajan ja samanaikaisuuden rajat; ei CORS-otsaketta; Host- ja Origin-tarkistukset. Kshana ei ylläpidä päätepistettä (<c4/>, mukana Docker-, Fly.io- ja Cloud Run -mallit).

seg-c392cde151c9 = Lisätty (rajapinnat)

seg-19ab5c068b6e = <b><c1/> Pythonissa ja WebAssemblyssä.</b> Komennon <c2/> takana oleva varmennin muistissa oleville tavuille, joka palauttaa JSON-tuloksen, jonka <c3/> tulostaa (ohjeellinen huomautus kentässä <c4/>; vain todennuksen tila, ei navigoinnin eheyspalvelu). Samat kieltäytymiset kuin komentorivillä. Ei MCP:ssä: syöte on pitkä raaka vastaanotinvirta, jolle CLI ja Python sopivat paremmin. Tiedostot <c5/> ja <c6/> kertovat tämän.

seg-6128929994b4 = <b><c1/> WebAssemblyssä, Pythonissa ja MCP:ssä, mukana lisäosan komento ja JetBrains-toiminto.</b> Renderöi luottamusvirran tai tuloksen <c2/> Prometheus-tekstinä, CEF- tai LEEF-syslog-riveinä tai OTLP JSON -hyötykuormana käyttäen koodereita, joita komento <c3/> käyttää (<c4/>); ei socketia eikä kelloa. Lisäosa: <c5/> ja skill <c6/>. JetBrains: Render Trust Telemetry. Ominaisuudet <c7/> ja <c8/> sekä MCP-palvelin ottavat nyt käyttöön myös ominaisuuden <c9/>, joka ei lisää yhtään crate-pakettia.

seg-83d01411c6d4 = <b>Pariteettipyyhkäisy.</b> JetBrains-toiminnot Validate Scenario, List Scenario Kinds ja Assess Receiver Stream; komento <c1/> luettelee nyt <c2/>, <c3/>, <c4/> ja <c5/>; notebook <c6/> (compliance-kartoitus ja test-bench-vienti); ja jokainen jäljellä oleva JetBrainsin ”vain CLI” -solu tiedostossa <c7/> on nyt nimenomainen N/A perusteluineen.

seg-062ef0cf7ee7 = Lisätty (todistepaketit)

seg-9889575c2df1 = <b><c1/> ja <c2/>: allekirjoitetut, varmennettavat todistepaketit GNSS-luottamustapahtumalle.</b> Paketti sisältää raakalokin viipaleen ja koko lokin SHA-256:n, asetukset kaikkine kynnyksineen, epookkikohtaiset tulokset ja syyt, moottorin version, hajautusketjutetun manifestin ja itsenäisen HTML-yhteenvedon, allekirjoitettuna Ed25519:llä (avain komennosta <c3/> tai oma tiedostosi; avaimia ei koskaan tallenneta pakettiin, ja <c4/> on git-ignored). Komento <c5/> tarkistaa jokaisen tiivisteen, ketjun ja allekirjoituksen ja nimeää täsmälleen, mikä epäonnistuu; valitsimella <c6/> se kiinnittää allekirjoittajan. RFC { "3161" } -aikaleimatunniste (token) voidaan liittää, ja se luetaan ja sidotaan manifestiin (tämä koontiversio ei tarkista viranomaisen omaa allekirjoitusta; <c7/> kattaa sen). Lokiviipale on ikkunan täsmälliset tavut, kun lukija raportoi lähdevälit (NMEA, UBX, RINEX { "3" }, Android), muuten koko loki, ja manifesti kertoo kumpi. Luonti ja varmennus ovat puhtaita julkisia funktioita (<c8/>), jotka rakentuvat kohteelle <c9/>. Paketit toteavat olevansa tekninen tallenne, eivät oikeudellinen lausunto. Uudet riippuvuudet ovat puu <c10/> (BSD-3-Clause ja Apache-2.0/MIT, minimiominaisuudet) ja suora <c11/> (jo siinä puussa) avainaineiston pyyhkimiseen. Katso <c12/>.

seg-280fd37126c1 = Lisätty (luottamustelemetria)

seg-ebd269c618b0 = <b><c1/>: GNSS-luottamus tietoturvatelemetrian lähteenä.</b> Lukee epookkikohtaisen luottamusvirran (JSON lines: pistemäärä 0-100, kaista, syyt) tai erätuloksen komennosta <c2/> ja syöttää Prometheus-päätepistettä <c3/> (oletuksena localhost), CEF- tai LEEF-muotoisia syslog-tapahtumia RFC { "5424" } -kehyksessä (UDP tai TCP) ja oletuksena pois päältä olevan ominaisuuden <c4/> takana OTLP/HTTP JSON -vientiä. Toimitus ajetaan työsäikeissä, joilla on yhteyden muodostuksen ja kirjoituksen aikarajat, rajoitettu uudelleenyhdistämisen viive ja laskuri <c5/>, joten kuollut tai jumittunut kerääjä ei voi pysäyttää reaaliaikaista arviota eikä jäädyttää päätepistettä <c6/>; syytunnisteet rajataan { "64" } sarjaan. Ei uusia riippuvuuksia. Esimerkki-Grafana-kojelauta on hakemistossa <c7/>. Mittarien nimet, tunnisteet ja CEF/LEEF-kenttäkartoitus ovat tiedostossa <c8/>. Virran muoto on eristetty tiedostoon <c9/>.

seg-fa5e803edb44 = Merenkulun luottamus: reaaliaikainen luottamuspistemäärä 0-100 liikkuvan aluksen paikkaratkaisulle, vastaanottimen jo tulostamasta NMEA { "0183" } -datasta, erikseen käyttöön otettavalla portilla (gate).

seg-c5b3fcb9bba8 = Komento <c1/> ottaa vastaan taulukon <c2/> (<c3/> tai <c4/>, aluksen suurin nopeus, kiihtyvyys ja kääntymisnopeus, antennin korkeus vesilinjan yläpuolella ja valinnainen suuntima-anturi; jokainen oletus on dokumentoitu perusteluineen). Alukselle staattinen paikkahyppymonitori, joka mittaa etäisyyttä kalibrointikeskiarvosta ja on väärä liikkeellä olevalla aluksella, korvataan kausaalisilla liikkuvan alustan monitoreilla: paikan kinemaattinen johdonmukaisuus raportoituun nopeuteen ja kulkusuuntaan sekä aluksen rajoihin nähden, gyrosuuntima suhteessa maan suhteen kuljettuun kurssiin, nopeusloki suhteessa maanopeuteen, antennin korkeus suhteessa ilmoitettuun korkeuteen vesilinjan yläpuolella, C/N0-hajonnan romahtaminen ja samanaikainen nousu kalibrointilähtötasoon verrattuna sekä aikojen johdonmukaisuus (live-tilassa myös tämän tietokoneen kelloon nähden). Se lukee myös raportoidun todennustilan, kokonaisuutena tai satelliittikohtaisesti (vain raportoitu tila: ei OSNMA-kryptografiaa). Jokainen kynnys ilmoitetaan taulukossa <c5/> ennen ajoa. Sen jälkeen jokainen epookki saa pistemäärän { "0" }–{ "100" } deterministisellä, ennakkorekisteröidyllä kuvauksella (ei oppimista, mitään ei sovitettu tapahtumiin; painot, kaistarajat ja todisteet ovat taulukossa <c6/>), joka kuvataan olemassa oleviin luottamustiloihin, ja mukana ovat vähennyksen tehneet monitorit pisteineen. Staattiset skenaariot eivät muutu, ja niiden tiiviste on ennallaan. Komento <c7/> lukee stdinia, lisättävää tiedostoa, TCP:tä tai UDP:tä ja kirjoittaa yhden JSON-rivin epookkia kohti sekä valmistajakohtaisen lauseen <c8/>; valitsimella <c9/> se päästää virran läpi muuttumattomana niin kauan kuin paikkaratkaisuun luotetaan, ja merkitsee paikkaratkaisun virheelliseksi (GGA-laatu { "0" }, RMC- ja GLL-tila <c10/>, GNS- ja VTG-tila <c11/>), kun siihen ei luoteta. Portti on pois päältä, ellei sitä pyydetä; valitsin <c12/> tarjoaa portitetun virran mille tahansa määrälle TCP-asiakkaita (oletuksena loopback, hidas asiakas pudotetaan sen sijaan, että se estäisi muut). Tämä on ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC { "61108" }, IEC { "61162" }); käyttäjä vastaa edelleen. Hakemisto <c13/> sisältää synteettisen Tallinnasta Helsinkiin kulkevan lokin, kirjoitettu vain tekstinä, ja sen puolivälissä on paikan harhautuminen (drag-off), jonka aikana vastaanotin jatkaa kelvollisen paikkaratkaisun raportointia; sen odotettu tuloste on kiinnitetty testillä. Opas: <c14/>. Tarkistukset eivät näe harhauttajaa, jonka paikkaratkaisu on johdonmukainen kaiken väylällä olevan kanssa; opas kertoo tämän.

seg-80f3f0aae42c = Häiriökartta

seg-8539a42718cb = <b><c1/> ja <c2/>: julkinen kuva siitä, missä ilma-alukset ja alukset ilmoittivat heikentyneestä navigointidatasta, ja kuinka suuren osan reitistä se koskettaa.</b> Syötteet ovat paikallisia CSV-tiedostoja, jotka on tehty avoimesti lisensoidusta ADS-B- (adsb.lol, ODbL { "1.0" }) ja AIS-datasta (NOAA MarineCadastre, Kystverket lisenssillä NLOD { "2.0" }); jokainen tulostiedosto on yksi lähde ja yksi UTC-päivä GeoJSONia, ja siinä on menetelmä, sen kynnykset, datan lisenssi, tekijänoikeusmaininta ja lähteen kattavuusharha. ADS-B-menetelmä kokoaa NIC:n ja NACp:n kiinteälle ruudukolle ja kutsuu solua heikentyneeksi erillisten ilma-alusten osuuden perusteella, suojauksin laitteille, jotka eivät koskaan raportoi tarkkuutta, matalalle korkeudelle ja laajan alueen syille. AIS-menetelmä ajaa viisi ilmaisinta: sijainnit maalla (käyttäjän antamaa rantaviivaa vasten), ympyräradat, epäuskottavat hypyt, epäuskottavat nopeudet ja monta alusta samassa paikassa. Kynnykset ovat nimetyn menetelmäversion ennakkorekisteröityjä vakioita. Vain aggregaatit: tunnisteet tiivistetään muistissa eikä niitä koskaan kirjoiteta, eikä soluja, joissa on alle { "5" } erillistä ilma-alusta tai alusta, julkaista. Heikentynyt solu ei ole havainto häirinnästä. Oletuskomennot eivät käytä verkkoa; erikseen käyttöön otettava apuohjelma <c3/> lataa Natural Earthin maapolygonit sitoumukseen kiinnitetystä osoitteesta ja säilyttää tiedoston vain, jos sen SHA-256 täsmää. ADS-B-syöte on CSV tai suoraan adsb.lolin readsb-historiatiedostot (uusi riippuvuus: <c4/> puhtaasti Rust-taustajärjestelmällään, gzipiä varten). Molemmat menetelmät ovat versiota { "2" }: heikentynyt tai poikkeava luokitus vaatii vähintään { "5" } ilma-alusta tai alusta (julkaisun vähimmäismäärä), jokainen solukohtainen lukumäärä alle { "5" } pidätetään arvona <c5/>, ja päivä, jonka taustaa ei voi arvioida, pidättää luokituksensa. Tulostiedostojen nimi on <c6/>, eikä niitä koskaan ylikirjoiteta; syöte luetaan virtana rivi riviltä; reittialtistus käsittelee antimeridiaanin. Testit käyttävät vain synteettistä dataa. Katso <c7/> ja lisenssikatselmointi tiedostossa <c8/>.

seg-7a54dfab93dc = Lisätty (koulutusvirrat)

seg-0b01d1d871e2 = <b><c1/>: synteettinen silta-NMEA { "0183" } miehistön koulutukseen GNSS-häirinnän ja -harhautuksen tunnistamisessa.</b> Skenaario-TOML:stä se kirjoittaa tiedoston tai suoratoistaa TCP:n tai UDP:n yli (unicast tai broadcast; reaaliajassa, kiihdytettynä tai niin nopeasti kuin mahdollista) koko siltasarjan GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT ja VBW aluksen radalle, jolla on kääntymisnopeuden, kiihtyvyyden ja virran rajat, ja satelliittigeometrialla moottorin omista nimellisistä satelliittitähdistöistä. Aikajanalle käsikirjoitetut tapahtumat: häirintä, paikan harhautuminen (drag-off) (kelvollinen paikkaratkaisu, joka kulkeutuu pois), aikaharhautus ja toistoviive, kullakin alku- ja palautumisrampit. Ohjaajan loki (JSON ja teksti) kirjaa, mitä syötettiin ja milloin, sekä todellisen radan raportoitua rataa vasten. Kirjasto hakemistossa <c2/> (avomeren häirintä, rannikon drag-off, satamaantulon aikaharhautus, yhdistetty) sisältää ohjaajan muistiinpanot. Tuloste on tarkistussummaltaan kelvollinen ja deterministinen siemenlukua kohti; testit kiinnittävät yhden golden-otteen skenaariota kohti ja lukevat jokaisen lauseen komennon <c3/> NMEA-lukijalla. Vain teksti: ei RF-, IQ- eikä aaltomuototulostetta; virrat on tarkoitettu koulutukseen ja testaukseen, eikä niitä saa koskaan syöttää aluksen live-navigointijärjestelmiin. Katso <c4/>.

seg-bb8d508c92fa = Merenkulun integraatiot ({ "0.35.0" }, työnkulku B)

seg-538cdf145ac1 = <b>Signal K -lisäosa</b> (<c1/>, ei julkaistu npm:ään): ajaa komentoa <c2/> tai yhdistyy siihen (palvelimen oma NMEA-syöte, mukautetut syöteargumentit, JSON-lines-TCP-syöte tai portitetun virran lauseet <c3/>), julkaisee luottamuspistemäärän, kaistan, syyt, hälytykset ja portin tilan nimiavaruudessa <c4/> (mukaan lukien vastaanottimen raportoima paikka kontekstina, ei koskaan kohteena <c5/>) ja nostaa Signal K -ilmoituksen (taso <c6/> heikentyneessä ja <c7/> ei-luotetussa tilassa, pito-, tyhjennys- ja vanhentumiskynnyksin, kaikki asetusskeemassa). Ei npm-riippuvuuksia. Testattu tallennetulla synteettisellä tulosteella.

seg-b6eb7110291e = <b>OpenCPN</b>: portitetun tilan NMEA:n tarjoaa suoraan komento <c1/> (suositeltu); riippuvuuksista vapaa TCP-välittäjä (<c2/>) on valinnainen vaihtoehto. Kummassakin tapauksessa OpenCPN näkee virheellisen paikkaratkaisun, kun luottamus romahtaa, ja lauseen <c3/> NMEA-vianetsintäikkunassaan; testit toistavat synteettisen portitetun virran oikean TCP-socketin kautta ja tarkistavat, mitä kuluttaja vastaanottaa. Natiivi pistemääräpaneelin lisäosa (<c4/>, lisäosan API { "1.18" }, CMake) lukee lauseen <c5/> OpenCPN:n omasta NMEA-virrasta ja hälyttää ei-luotetulla kaistalla; se rakentuu, sen logiikka on yksikkötestattu, ja se ajettiin OpenCPN-version { "5.8.4" } sisällä virtuaalinäytöllä (todisteet ja toistoskripti hakemistossa <c6/>); sitä ei ole paketoitu lisäosahallintaan.

seg-bb26e8c1aff0 = <b>Viitetoteutus</b> (<c1/>): yleinen osaluettelo, käyttöjärjestelmän asennus, systemd-yksiköt ohjeelliselle monitorille ja erikseen käyttöön otettavalle portille (tarkistettu komennolla <c2/> skriptillä <c3/>), konttivaihtoehto, Signal K -kytkentä.

seg-6695d4c1f13b = Signal K -lisäosa hyväksyy live-JSON-skeeman { "1.2" } (perään lisättiin avain <c1/> ja sen jälkeen avain <c2/>; tuntemattomat perään lisätyt avaimet ohitetaan), tarkistettu oikealla { "1.2" }-tulosteella ja oikeaa signalk-serveriä vasten.

seg-622c2d3dd8fa = Katselmointikorjaukset: systemd-yksiköt käynnistyvät aina uudelleen ja ajetaan hiekkalaatikossa (ei shelliä, ei verkkoa siellä, missä sitä ei tarvita), logrotate-pätkä, tarkistus <c1/> epäonnistuu mistä tahansa löydöksestä; kontti ajaa portin ympäristömuuttujista terveystarkistuksella ja tiivisteellä kiinnitetyillä peruskuvilla; Signal K:n pistemäärän metadata, vanhentunut ilmoitus korvataan datan jatkuessa, lapsiprosessin virheet säilytetään ja tappamiset eskaloituvat, vaaralliset syöteargumentit (<c2/>) evätään, ja ilmoitus on polussa <c3/>; välittäjä rajoittaa pidätetyn osittaisen rivin; lauseen <c4/> jäsentimet hylkäävät pistemäärät alueen { "0" }–{ "100" } ulkopuolelta; dokumentaatiolinkkien tarkistus; CI-työnkulku (<c5/>), joka ajaa kaiken, mukaan lukien oikean binäärin päästä päähän.

seg-7c615a62ca26 = <c1/>. Ohjeellinen ohjelmisto, ei tyyppihyväksytty laite; käyttäjä vastaa edelleen. Vain ohjelmisto: mikään ei lähetä, eikä havaitsemis- tai väärän hälytyksen lukua väitetä.

seg-72cb9f45ce99 = Lisätty: compliance-kartoitus ja test-bench-vienti

seg-15aae04a9490 = <b><c1/> ja <c2/>.</b> Kartoitus Kshanan tulosteista viiteen kestävyyskehykseen ja -standardiin (Yhdysvaltain DHS:n Resilient PNT Conformance Framework v2.0, IMO:n ohjeistus aluksille, EASA:n ohjeistus ilmailulle, NIS2:n artikla { "21" }, EN { "16803" }, maksullinen standardi, johon viitataan osan ja muutaman luettelotekstissä näkyvän kohtanumeron perusteella), yksi taulukko kehystä kohti: viite, mitä se vaatii meidän parafraasissamme, tulosteet, jotka tukevat todisteita sille, ja aukko. Lähdeversiot, URL-osoitteet ja se, mitä luettiin ja mitä ei, on kirjattu. Komento <c3/> täyttää kartoituksen annetuista ajoista ja merkitsee jokaisen rivin <c4/>, <c5/>, <c6/> tai <c7/>, Markdownina ja JSONina, aukko säilytettynä jokaisella rivillä. Sanamuoto on ”tukee todisteita” (supports evidence for); mitään ei arvioida eikä hyväksytä. Testit käyttävät synteettisiä ajoja ja epäonnistuvat, kun tallennettu taulukko poikkeaa koodista.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Kirjoittaa skenaarion (tyyppi <c2/>, <c3/> tai <c4/>) ajoneuvon liikkeen ja tapahtumat laboratorion GNSS-simulaattoria varten: käyttäjäliike-CSV dokumentoiduin koordinaatistoin ja metadatasivutiedosto, NMEA { "0183" } <c5/>/<c6/>, reittipistetekstiä sekä tapahtumat CSV:nä ja kohteen <c7/> lohkoina <c8/> (<c9/>). Vain liike ja tapahtumat: signaalia ei kirjoiteta. Jokainen tiedosto luetaan takaisin testissä <c10/> ja verrataan sen ilmoitetun toleranssin sisällä. <a1><c11/></a1> antaa menetelmän viennin toistamiseksi simulaattorin läpi ja vastaanottimen lokin pisteyttämiseksi komennolla <c12/>.

seg-fc0fe915ed3d = <b>Mikä lasketaan todisteeksi.</b> Tulos lasketaan jonkin ominaisuuden todisteeksi vain, kun se sisältää kentät, jotka sen tyyppi kirjoittaa; pelkkä tyyppitunniste ei lasketa miksikään. Tuntemattomat tyypit, tulos, joka on ristiriidassa sisarskenaarionsa kanssa, ei-heksadesimaaliset tiivisteet ja virheelliset vastaanottimen luottamuslaskurit luetellaan käyttämättöminä syineen. Raportti suojaa Markdown-solut (escape) eikä kaadu (panic) ei-ASCII-tiivisteeseen. Funktiot <c1/> ja <c2/> ottavat vastaan tekstejä, eivät polkuja.

seg-6b46de1164d8 = Test-bench-vienti.

seg-c48a4dd4134b = Valitsin <c1/> tarkistetaan alueelle (<c2/>); reittipistetiedosto tarkistaa jokaisen välin, ja komento kertoo syyn, kun jokin jätetään pois; dokumentaatio toteaa, että suuntima tyypille <c3/> on rungon kääntökulma eikä kurssi, paikkamerkkikentät <c4/> ja skenaarion oman korkeusmuutoksen. Komennot <c5/> ja <c6/> ovat käyttöohjetekstissä.

seg-eb2e415ec540 = Funktio <c1/> paljastaa tyypin <c2/> ajoprofiilin todellisen tilahistorian (sama askellus, jota tyypin oma totuus käyttää), ja <c3/> saa NMEA-päivämäärä- ja aikakentät.

seg-fbfc1a59e99b = Häiriökartan validointi

seg-a68d88381eea = <b>Häiriökartan dekoodaussemantiikka ja geometria tarkistetaan riippumattomia toteutuksia vastaan synteettisillä syötteillä.</b> NIC- ja NACp-koodien merkitykset pyModeS-dekoodausta vastaan synteettisillä ADS-B-kehyksillä, AIS:n ei saatavilla -arvot pyais-dekoodausta vastaan synteettisillä AIVDM-lauseilla, ruutusolun osoitus shapelyä vastaan, reitin pituus solutilaa kohti shapelyä ja GeographicLibiä vastaan sekä sisämaan maskaus shapelyä ja pyprojia vastaan, kukin toleranssilla, joka asetettiin ennen ensimmäistä vertailua (<c1/>). Tämä validoi, miten koodit ja kenttäarvot luetaan, sekä geometrian, ei sitä, että liputettu solu olisi häiriötä. Maapolygonien lukija sulkee nyt renkaan, joka ei toista ensimmäistä kärkeään ja jonka se luki aiemmin ilman viimeistä sivua. Dokumentaatio toteaa NACp:n ja NIC:n matalan tarkkuuden kynnykset rajana, jota kukin koodi edustaa (NACp { "6" } tarkoittaa EPU-rajaa { "556" } m, NIC { "5" } sisältymisrajaa { "1" } NM).

seg-cf4ffdbba1a6 = Lisätty (telemetriamuotojen ja todistepakettien validointi)

seg-ad6730e0e891 = <b>Ulkoiset tarkistukset todistepakettien kryptografialle, pakettivarmentimelle ja telemetrian siirtomuodoille.</b> RFC { "8032" } -standardin kohdan { "7.1" } Ed25519-testivektorit ({ "1" }, { "2" }, { "3" } ja { "1024" }) ja FIPS 180-4 SHA-256 -esimerkit ajetaan paketin omien allekirjoitus-, varmennus- ja tiivistefunktioiden läpi, täsmälliseen yhtäsuuruuteen. Pythonilla pelkästään tiedoston <c1/> normatiivisen osan perusteella kirjoitettu varmennin (hashlib ja kirjasto <c2/>) on samaa mieltä Rust-varmentimen kanssa { "71" } ehjällä ja peukaloidulla paketilla: johtopäätös, epäonnistumisjoukko, allekirjoituksen johtopäätös ja molemmat ketjun päät. Prometheus-esityksemme luetaan virallisen Python-asiakkaan jäsentimellä ja OTLP JSON virallisella viestityypillä <c3/>, tiukasti, ja molemmat ovat samaa mieltä tilan kanssa, josta ne tehtiin. CEF:llä ja LEEF:llä ei ole riippumatonta avointa validaattoria, ja ne pysyvät mallinnettuina. Tiedosto <c4/> sai normatiivisen pakettimuodon ja varmennusmenettelyn, josta puhtaan huoneen varmennin kirjoitettiin; tyyppi <c5/> sai kentän <c6/>. Oraakkelit ja testiaineisto: <c7/>, <c8/> ja <c9/>, <c10/>; testit <c11/>, <c12/> ja <c13/>. CI ei tarvitse Pythonia.

seg-20d1b02bfda4 = Lisätty (CEF-tapahtumien validointi)

seg-8c464e43e43d = Telemetrian CEF-tapahtumat luetaan takaisin oikein kahdella riippumattomalla avoimen lähdekoodin jäsentimellä.

seg-a6321d13b0ab = <c1/> { "1.11" } ja Logstashin CEF-koodekki (<c2/> { "6.2.7" } Logstashissa { "8.15.3" }) jäsentävät { "157" } CEF-riviä (jokaisen kaistanmuutoksen ja jokaisen epookin talletetussa telemetriavirrassa sekä vastapuolen tekstiä, joka sisältää merkin <c3/>, kenoviivoja, putkia, rivinvaihtoja, sarkaimia ja monitavuista tekstiä) ja palauttavat jokaisen otsikkokentän, vakavuuden, täsmällisen laajennusavainjoukon ja jokaisen arvon täsmälleen. Logstash-koodekki lukee myös neljä riviä, joiden otsikkoteksti vaatii escape-merkintää, mitä <c4/> ei osaa. Kynnys rekisteröitiin ennen kuin kumpaakaan jäsennintä ajettiin (<c5/>); testiaineisto hakemistossa <c6/>, oraakkeliskriptit <c7/> ja <c8/>; CI ei tarvitse Pythonia eikä Logstashia. LEEF:llä ei ole ylläpidettyä avointa jäsennintä, ja se pysyy mallinnettuna. CEF-tapahtumat kuljettavat nyt luottamuspistemäärän ja epookkisiirtymän CEF-sanakirjan liukulukuisissa mukautetuissa kentissä (<c9/>, <c10/>) kokonaislukukenttien <c11/> ja <c12/> sijaan, jotka eivät sopineet kummallekaan arvolle; CEF on uusi tässä julkaisussa, joten mikään toimitettu ei muutu.

seg-65b362fa8711 = MCP: <c1/> hyväksyy lokin muodossa <c2/> tai <c3/>; työkalun syöte on rajattu kokoon { "4" } MiB.

seg-8999974aa1fa = Häirintäkaavio ottaa värinsä myös paletista.

seg-8c8ff384dbf6 = Moduuli <c1/> oli ainoa moduuli, jonka Observatory-palettirevisio jätti omille väreilleen häirintälähteen Q-työn tullessa mukaan; sen kaaviotiedostot <c2/> (skenaariot <c3/>, <c4/> ja muut tyypin <c5/> skenaariot) lukevat nyt moduulia <c6/>, ja sallittujen luettelo tiedostossa <c7/> on tyhjä. Vain värit ja fontti: kaaviot <c8/> ja <c9/> ovat yhtä suuret kuin aiemmin tallennetut renderöinnit, kun väri, <c10/> ja versioalatunniste on normalisoitu. Mikään piirretty arvo ei siirtynyt. Hakemiston <c11/> tallennetut Studio-kopiot tallennettiin uudelleen versioiden { "0.33.0" } ja { "0.34.0" } uudelleenporttauksissa (vain versioleima): ne sisältävät yhä häirintäkaavion vanhan värityksen ja saavat palettivärityksen seuraavassa uudelleenporttauksessa.

seg-a059d10c5330 = <b>Kelloyhtyeen 3-sigma-raja kattaa nyt flicker-lattian, ja suodattimen terveystarkistus näkee sen.</b> Kun asetuksena oli <c1/>, tosikello kantoi flicker-FM:ää, mutta kaksitilainen suodatin, joka antaa eheysrajan, ei, joten mukana toimitetun skenaarion <c2/> 3-sigma-kattavuus oli { "0.41" } (klassinen) ja { "0.33" } (kvantti), ja NIS/NEES-tarkistus, joka veti oman totuutensa suodattimen mallista, raportoi identtiset arvot lattian kanssa ja ilman. Raja on nyt kaksitilainen varianssi plus viimeisen synkronoinnin jälkeen kertyneen flicker-vaiheen täsmällinen varianssi, laskettuna samasta generaattorijoukosta, jota tosikello käyttää; NIS/NEES-tarkistus vetää totuutensa laajennetusta mallista tällä generaattorijoukolla ja ajaa vastaavan laajennetun suodattimen (ja kaksitilainen suodatin flicker-totuutta vasten raportoi <c3/>). Tulosteen muutos vain kelloille, joilla <c4/> on nollasta poikkeava: <c5/> skenaariossa <c6/> muuttuu arvoista { "0.40866" } / { "0.33026" } arvoihin { "0.99970" } / { "1.0" } (klassinen / kvantti), ja <c7/> NIS/NEES sisältää nyt flickerin; ajoitusvirhe, <c8/> ja <c9/> ovat ennallaan, ja skenaariot ilman lattiaa ovat tavu tavulta identtisiä. Myös tiedosto <c10/> (rata-tyyppi, siemenluku { "7" }, lattiat { "1e-16" } / { "2e-11" }) muuttuu: <c11/> klassinen { "0.7734" } → { "1.0" } ja kvantti { "0.9796" } → { "1.0" }, ja NIS/NEES-arvot kohteessa <c12/> ja niiden kaistat muuttuvat. Sen kvanttiarvo <c13/> kääntyy arvosta <c14/> arvoon <c15/>: otantatapahtuma 16 siemenluvun × 60 askeleen flicker-ensemblessa (NIS { "0.8815" } kaistaa [{ "0.9125" }, { "1.0914" }] vasten), ei vika. Kaista on { "95" } % kaista, joten noin { "5" } % siemenluvuista liputtaa vastaavan suodattimen rakenteen vuoksi ({ "40" } tuoretta siemenlukua tästä skenaariosta: kvantti { "1" } ja klassinen { "2" } liputettu); koossa { "64" } × { "200" } sama siemenluku on kaistan sisällä molemmille kelloille (NIS { "0.990" } ja { "1.001" }). Tunnettu jatkotoimi: tyypillä fusion on sama aukko (klassinen eheys { "0.80" } lattian kanssa); tyyppi hybrid pysyy yli { "0.99" }.

seg-c7308350b6d4 = <b>MCP-palvelimen syöte koventettu.</b> MCP-palvelimen skenaariotyökalut hyväksyvät nyt vain inline-sisältöä ja kieltäytyvät tiedostolähdekentistä; syötteen koko on rajattu. Tietoturvatiedote: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Laboratoriotoisto (lab replay): seurantamoottori, havaitsemismonitorit ja kampanja-ajuri GNSS-IQ-tallenteille, sekä niihin kuuluvat silmukkamallit, C/N0-estimaattorit ja pisteytykset. Todistetaso: kaikki alla on <b>MODELLED</b> tai tarkistettu sisäisen johdonmukaisuuden suhteen suljettuja muotoja ja siemenlukuun perustuvaa simulaatiota vasten; mikään siitä ei lisää VALIDATED-riviä, ja varmennuksen kirjanpito (ledger) on ennallaan ({ "251" } riviä: { "124" } validoitua, { "123" } mallinnettua, { "4" } kumppanin osuutta). Se on ohjelmistopohjainen analyysikerros: mikään tässä ei syntetisoi häirintälähteen tai harhauttajan aaltomuotoa, eikä mikään lähetä.

seg-912ecb44cee4 = Laboratoriotoisto: testiolosuhteet, kampanja-ajuri ja pisteytys ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> toistaa tallenteet × etupäiden ketjut × silmukkamallit (<c2/>) ja pisteyttää jokaisen solun tallennekohtaisen testiolosuhdetiedoston (<c3/>, TOML tai JSON) vasten. Tämä tiedosto kertoo, mitä laboratorio tietää tallenteesta: odotetut satelliitit ja kustakin tapahtumasta sen tyyppitunniste, alku ja loppu, kohteena olevat satelliitit ja ilmoitettu J/S- tai häirintälähteen tehoprofiili. Se on vain metadataa. Pisteet satelliittia kohti, koko ajolle ja tapahtumaa kohti ovat:

seg-180447aaf31e = saatavuus, aika lukituksen menetykseen ja ilmoitettu J/S menetyshetkellä;

seg-1ababddb0d87 = uudelleenhankinnan aika tapahtuman päättymisestä ja menetyksestä;

seg-a6468323c971 = mitattu C/N0-heikkeneminen ilmoitettua J/S-lokeroa kohti;

seg-4cb6f510e159 = väärän lukituksen jaksot lukittua tuntia kohti (seurantasilmukan lippu tai Doppler totuussivutiedostoa vasten);

seg-97c6243bac2e = PLL:n ja DLL:n diskriminaattorin värinä.

seg-014b28f61db8 = Jokaisen mitatun heikkenemiskäyrän vieressä piirretään analyyttinen spektrierotteluviite (<c1/> tyypin arvolla <c2/>) ja merkitään MODELLED kaikkialla, missä se esiintyy.

seg-eb5c38197dab = Solut ajetaan rinnakkain seurantaistunnon lukitustilakoneen läpi, ja kukin kirjoitetaan atomisesti sisältötiivisteavaimen alle. Avain kattaa tallenteen SHA-256:n, ehdon, etupään, mallin, ajon ja pisteytyksen tiivisteet, vaaditun arvon <c1/> (<c2/> | <c3/>) ja moottorin version. Kun asetus <c4/> on päällä, myös kunkin solun virta <c5/> ja lukitustapahtumat säilytetään, nimettynä solun avaimen mukaan ja tiivistettynä soluun. <c6/> ja <c7/> ovat julkisia, joten kuluttaja voi johtaa uudelleen jokaisen avaimen ja tiivisteen. Uudelleenajo ohittaa siten valmiit solut, eivätkä tulosteet koskaan riipu työsäikeiden määrästä. Ajo kirjoittaa <c8/>/<c9/>, itsenäisen <c10/> ja tiedoston <c11/>. Läpäisy-/hylkäyskynnykset (<c12/>, ohitettavissa tallennekohtaisesti) sovelletaan raporttia rakennettaessa.

seg-beec1c1264c9 = Asetus <c1/> (oletus <c2/>, osa pisteytyksen tiivistettä) valitsee C/N0:n, jonka perusteella raportoitu C/N0 ja heikkenemiskäyrä lasketaan. Molemmat estimaatit pisteytetään ja raportoidaan aina (koko ajon ja lähtötason mediaanit sekä J/S-lokeroittain), ja solu ja pistekortti kirjaavat estimaattorin. NWPR antaa silmukan oman värinän alla noin { "8" } dB × Bn·T liian pienen arvon; M2M4 ei.

seg-baf1a2422a66 = Myös uutta:

seg-f36e22ff54c3 = Komento <c1/> rakentaa pistekortit, raportin ja tiivisteen uudelleen soluista;

seg-aad7fcc28bc8 = Komento <c1/> tarkistaa testiolosuhdetiedoston skeemaansa vasten;

seg-c3e5e4461aaa = Asetus <c1/> tuo SigMF-tallenteen annotaatiot <c2/> tapahtumina;

seg-c1a2ebb844c5 = Python saa funktiot <c1/>, <c2/> ja <c3/>;

seg-cd69258ccc09 = Palvelin <c1/> saa työkalun <c2/>, joka on inkrementaalinen ja jatkettavissa kutsukohtaisen näytebudjetin puitteissa ja jonka jokainen tiedosto on rajattu työhakemistoon, sekä työkalun <c3/>.

seg-c398b66a7058 = Testit: <c1/> ajaa synteettisen kampanjan, jossa on { "3" } tallennetta × { "2" } etupäätä × { "2" } mallia. Sen kohtauksissa on ilmoitetut C/N0-profiilit, ja se kattaa:

seg-3f2fbdecb101 = jokaisen mittarin tarkistuksen injektoitua totuutta vasten;

seg-e103a30260db = jatkamisen osittaisen yhden työsäikeen ajon jälkeen, jossa on korruptoitunut solu, tavu tavulta identtisesti keskeytymättömän neljän työsäikeen ajon kanssa;

seg-79164d8b0b22 = solukohtaiset epookkitiedostot;

seg-9470016f056a = kolmen satelliitin { "20" } s uudelleenhankintaregressio: kun <c1/> on päällä, jokainen kanava on takaisin { "2" } s kuluessa { "2" } s katkoksesta; tulos, kun <c2/> on pois päältä, on kiinnitetty;

seg-1deb4ab83054 = kynnykset arvioidaan uudelleen ajamatta uudelleen;

seg-351f9cdcbcd6 = CLI;

seg-2c35af369a36 = ohitetut release-tilan läpisyöttö- ja muistitarkistukset, mukaan lukien tallenne kooltaan { "4" } GB ({ "5.45" }× reaaliaika, huippumuisti { "2" } MB aloitus-RSS:n yläpuolella; yhden koneen mittauksia, ei kynnyksiä).

seg-efbaf5a00ea2 = Vain ohjelmisto: mikään ei lähetä, eikä häirintä- tai harhautusaaltomuotoa syntetisoida. Suunnittelu- ja toteutushuomautukset: <c1/>.

seg-c9871226c82f = Seurantamoottori laboratoriotoistoon ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Silmukkamallitiedostot</em>: <c1/> TOML (<c2/>; jäsennin <c3/>). Yksi tai useampi nimetty malli asettaa jokaisen silmukkakentän:

seg-0437148324ca = kantoaaltotyyppi (PLL, FLL tai FLL-avusteinen PLL), asteet ja kaistanleveydet;

seg-4e722960f8c6 = PLL-, FLL- ja DLL-diskriminaattorit ja kantoaaltoavustus;

seg-44976e3ad4e7 = välit ja integrointi;

seg-5c06173036d6 = lukituskynnykset ja C/N0-ikkunat sekä bittisynkronointi;

seg-405e693dd757 = lukitustilakone;

seg-e6908584e2f4 = luovutushankinta (<c1/> tai nimenomainen).

seg-8844cc963705 = Mallit voivat periä toisiltaan avaimella <c1/>. Tuntemattomat avaimet evätään. Jokaisella ratkaistulla mallilla on SHA-256-tiiviste kanonisen JSON-muodon yli (avaimet lajiteltu joka tasolla, kiinteä lukujen muotoilu), joten tiiviste ei riipu kenttien järjestyksestä; jokainen tuloste kirjaa sen. Rajapinnat:

seg-5c32182634f7 = <c1/>, jossa nimenomaiset liput ohittavat mallin ja kirjataan;

seg-9356751a6b98 = <c1/>, joka ajaa jokaisen tiedoston mallin;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP-työkalu <c1/>, parametrit <c2/>/<c3/>.

seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, seurantaepookkisarake <c2/> sarakkeen <c3/> jälkeen; Pythonin epookkisanakirjat). Toisen ja neljännen momentin estimaatti samoissa ikkunoissa kuin NWPR, vain prompt-tehosta: NWPR antaa silmukan oman kantoaaltovärinän alla liian pienen arvon (noin { "8" } dB × Bn_PLL·T), M2M4 ei. GPS L2C CM -signaalilla ({ "20" } ms, nimellinen { "40" } dB-Hz, PLL { "1" }–{ "10" } Hz) se lukee { "39.93" } dB-Hz jokaisella kaistanleveydellä, kun taas NWPR laskee arvosta { "39.55" } arvoon { "38.22" }; kun L1 C/A -signaali on { "45" } dB-Hz, se lukee { "45.34" }. NWPR ja kaikki muut tulosteet ovat ennallaan (bitti bitiltä -kiinnitys). Binääritietue pysyy { "184" } tavun kokoisena (arvo käyttää varattua float-kenttää ja lippubittiä { "6" }).

seg-c02d07475717 = Ylimääräiset korrelaattoritapit (monikorrelaattori / SQM).

seg-70fcdc903413 = <c1/> (siirtymät chippeinä promptista, positiivinen aikaiseen suuntaan; enintään { "16" }, kukin alueella ±{ "2" }) korreloi ylimääräisiä replikoita E/P/L:n rinnalla ja palauttaa ne kenttänä <c2/> (<c3/> mallin järjestyksessä). Silmukat eivät koskaan käytä niitä. Avain jätetään pois kanonisesta JSON-muodosta, kun se on tyhjä, joten oletusmallin tiiviste ja jokainen tapiton tuloste ovat ennallaan (<c4/> pysyy; tapiton CSV/JSONL/binääri on bitti bitiltä identtinen). Tapeilla: CSV/JSONL-sarakkeet ja binääritietue, jonka koko tavuina on <c5/> ja jonka otsikko kantaa kenttää <c6/>, joten vanha lukija kieltäytyy tiedostosta sen sijaan, että jäsentäisi sen väärin. <c7/> (CLI), <c8/> (Python) ja <c9/> (MCP <c10/>). Yhden ajon mallien täytyy olla samaa mieltä tapeista.

seg-66d494267598 = <em>Rinnakkaiset kanavat</em> (<c1/> / <c2/>; Rust <c3/>). Kunkin lohkon kanavat ajetaan enintään N säikeellä (<c4/>; <c5/> pysyy sarjallisena). Kanavan korrelaatio ja lukitustilakone koskevat vain sitä kanavaa; sen epookit ja tapahtumat puskuroidaan ja kirjoitetaan nieluihin kanavajärjestyksessä, joten tuloste (CSV, JSONL, binääri, tapahtumat, yhteenveto) on tavu tavulta identtinen sarja-ajon kanssa millä tahansa N:llä. Oletus pysyy { "1" } säikeenä. Mitattu 12 kanavan, { "4" } s, { "4.092" } MHz tallenteella { "4" } ytimellä: { "19.5" } s sarjassa, { "11.5" } s { "2" } säikeellä, { "6.3" } s { "4" } säikeellä ({ "3.1" }×; alkuhankinta on sarjallinen).

seg-cf59911d458f = <em>Hankintapinnan vienti</em> (<c1/>; <c2/>, <c3/>). <c4/> (yksi PRN; CSV, JSON tai binääri), Pythonin funktio <c5/> ja MCP:n työkalu <c6/> parametrilla <c7/> kirjoittavat koko Doppler × koodivaihe -korrelaatiotehopinnan, jonka haku laskee (sen solut ovat funktion <c8/> soluja bitti bitiltä), sekä huipun ja kaksi hienon Dopplerin tarkennusta: paraabelinen estimaatti ja 1/16 lokeron hieno haku (≈{ "5" } Hz, kun koherentti aika on { "4" } ms, verrattuna { "167" } Hz leveisiin lokeroihin). Itse <c9/> ja kaikki oletukset ovat ennallaan.

seg-a01bf371cc4f = <em>Suoratoistettu epookkitulostus</em> (<c1/>; <c2/>). Jokainen silmukkapäivitys sisältää:

seg-ff549f07ce78 = aikaisen, promptin ja myöhäisen korrelaattorit;

seg-00457c1bb059 = kaikki kolme diskriminaattoritulostetta;

seg-b17d335f6cac = PLL-, FLL- ja DLL-NCO-tilat ja kantoaallon vaihe;

seg-a3bf3f1034cd = PLI- ja lukituslipukkeet;

seg-7912a72da79b = molemmat C/N0-estimaatit ja bitit;

seg-8d105d656041 = lukitustila.

seg-6af6331255fb = Se kirjoitetaan sitä mukaa kuin se tapahtuu, CSV:nä, JSON Linesinä tai versioituna binäärimuotona, ja lukijat ovat Rustissa (<c1/>) ja Pythonissa (<c2/>).

seg-aa081bfd9878 = Komento <c1/> saa valitsimet <c2/>, <c3/> ja <c4/> (<c5/>), ja komento <c6/> saa valitsimet <c7/> ja <c8/>. MCP-työkalu <c9/> saa parametrit <c10/>/<c11/> ja rakentaa vastauksensa rajatun muistin yhteenvedosta.

seg-8cb2f8b27bad = Ajon keko ei enää kasva tallenteen pituuden mukana: <c1/> mittaa sen laskevalla allokaattorilla ({ "6" }× pituus, sama huippu { "64" } KiB:n tarkkuudella) ja kontrollilla, joka osoittaa, että muistinsisäinen polku kasvaa.

seg-e3eff59db445 = Suoratoistettu tuloste on bitti bitiltä identtinen muistinsisäisen toiston kanssa.

seg-c602902313f8 = <em>Lukitustilakone</em> (<c1/>, <c2/>): sisäänveto → lukittu → menetetty → uudelleenhankinta → sisäänveto, tai poistettu käytöstä, kun menetys kestää yli <c3/> (oletus { "30" } s). Epäonnistuneita hakuja toistetaan asetuksen <c4/> ({ "0.1" } s) mukaisin, tasavälein sijoitetuin yrityksin, joten uudelleenyritysaikataulu lisää mitattuun uudelleenhankinta-aikaan enintään { "0.1" } s. Valinnainen perääntyminen (<c5/> yli <c6/>) on oletuksena pois, ja <c7/> on valinnainen yläraja ({ "0" }, ei mitään, oletuksena). { "2" } s kestävä katko kolmella PRN:llä nopeudella { "4.092" } MS/s päättyy nyt siihen, että jokainen kanava on hankittu uudelleen ja lukittu. 3 yrityksen budjetilla jokainen kanava poistettiin käytöstä { "0.2" } s kuluessa menetyksestä.

seg-56bc109dbef9 = Kynnykset (<c1/>, <c2/>, uudelleenhankinnan Doppler-ikkuna) tulevat mallista. Jokainen siirtymä on tapahtuma syineen.

seg-b1c551e48389 = Väärän lukituksen tarkistus hakee seurattua Dopplerin arvoa sen ±1/(2T) FLL/PLL-aliasta vasten. Se havaitsee väärän lukituksen, jonka PR #38 mittasi (seurattu −{ "2400" } Hz, { "500" } Hz pielessä). Kun uudelleenhankinta on päällä, kanava päätyy lukittuna injektoidulle Dopplerille.

seg-39409dd0b4bc = { "0.8" } s signaalikatko julistetaan menetetyksi ja hankitaan uudelleen viimeistään { "0.3" } s kuluttua signaalin paluusta.

seg-ce3162720ce5 = Kenttä <c1/> (ja taulukon sarake) on tila viimeisen siirtymän jälkeen, joten kanava, joka poistettiin käytöstä viimeisen silmukkapäivityksensä jälkeen, näyttää arvoa <c2/>.

seg-520ab6d84a6c = <b>FLL-avustus vain sisäänvedon aikana</b> (<c1/>, oletus; <c2/> säilyttää aiemman käyttäytymisen bitti bitiltä). FLL luovuttaa PLL:lle, kun tasoitettu PLI on pysynyt arvossa <c3/> ({ "0.8" }) tai sen yli ajan <c4/> ({ "0.1" } s), ja palaa, kun se laskee alle arvon <c5/> ({ "0.6" }). Päälle jätettynä { "10" } Hz FLL -polku rikkoi vaihelukituksen alle noin { "38" } dB-Hz puhtailla signaaleilla: tasolla { "35" } dB-Hz vaihelukitusosuus oli { "10" }–{ "16" } %, todellisen vaihevirheen ollessa { "38" }–{ "41" }°. Portitettuna oletus pitää { "100" } % tasolla { "35" } dB-Hz virheellä { "4.5" }°, samoin kuin pelkkä PLL. Sisäänveto { "100" } Hz luovutusvirheestä on ennallaan. Todisteet ennakkorekisteröidyillä kynnyksillä: <c6/>. <b>Oletussilmukat eivät siksi ole bitti bitiltä samoja kuin oletusmallin aiemmat ajot.</b> Käytä asetusta <c7/> niiden toistamiseen. Tunnettu rajoitus: tasolla { "35" } dB-Hz luovutus tapahtuu { "1.9" }–{ "2.6" } s seurannan alkamisesta, ja tasolla { "33" } dB-Hz { "10" } Hz FLL pitää PLI:n luovutuskynnyksen alapuolella, joten sisäänveto ei koskaan valmistu.

seg-1a911b958f8e = Uudet silmukkamallin avaimet ja API, lueteltuna:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, ja <c5/> muutettu oletusarvosta { "3" } valinnaiseksi ylärajaksi (oletus { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = Mallin tiiviste lasketaan kanonisen JSON-muodon yli, ja sisäänrakennetun oletuksen tiiviste on <c1/> (kiinnitetty testillä).

seg-2405be1bc0c6 = Tulosteen yhteensopivuushuomautukset:

seg-77670b7dd608 = taulukossa <c1/> on lopussa sarake <c2/>;

seg-a52d9bbdd1a4 = komennon <c1/> CSV:ssä on lopussa sarake <c2/>, ja sen JSON-tuloksessa on <c3/> ja <c4/>;

seg-3fa0f9243806 = pyyhkäisyn kenttä <c1/> on nyt keskiarvo kaikista päivityksistä, joilla on NWPR-estimaatti (rajatun muistin yhteenveto), ei enää ajon jälkimmäiseltä puoliskolta.

seg-d542c1616f35 = Uudelleenhankinta on <b>pois sisäänrakennetussa oletuksessa</b>, jossa tilakone vain tarkkailee ja silmukat toimivat bitti bitiltä kuten ilman sitä. (Oletussilmukat itse kuitenkin muuttuivat: katso FLL-avustus yllä.) Ota se käyttöön mallikohtaisesti (<c1/>), valitsimella <c2/> tai asetuksella <c3/>.

seg-61d6b3122888 = <b>Varoitus <c1/></b>: kun fs on { "1e-6" } sisällä puolen chip-nopeuden monikerrasta (<c2/>), komennot <c3/>/<c4/> (tuloste, <c5/>, pyyhkäisyn JSON), työkalun <c6/> MCP-vastaus ja funktion <c7/> Python-tulos varoittavat, että koodisilmukan värinä ja harha eivät ole edustavia. Perimmäinen syy on dokumentoitu ennakkorekisteröidyin kynnyksin hakemistossa <c8/>. Täsmälleen { "2" } näytteellä chippiä kohti ja 0.5 chipin välillä DLL:n S-käyrä on yksittäinen askel ja silmukka väpättää: ≈ { "0.09" } chipin RMS-koodivirhe (≈ { "26" } m) tasolla { "45" } dB-Hz, kun taas ≈ { "0.004" } chipiä epäkommensuraabelilla nopeudella. ~{ "2" } dB liian matala NWPR-C/N0 tällä nopeudella johtuu samasta syystä. Kun koodi-Doppler on täsmälleen { "0" } Hz ja näytteitä on { "4" } chippiä kohti, koodi ei koskaan ylitä ±0.21 chipin kuollutta aluetta, joten jopa noin { "0.2" } chipin koodivaiheharha voi säilyä näkymättä värinässä (mitattu: 0.5 chipin väli antaa { "2.0" }× kontrollin koodivirheen keskiarvolla +{ "0.011" } chipiä; 0.25 chipin väli antaa +{ "0.125" } chipiä); varoitus kattaa nopeuden.

seg-8fbfb3f0bee2 = <b>Tunnettu rajoitus: oletusmalli ei luovuta FLL→PLL alle noin { "35" } dB-Hz</b> (~{ "35" } dB-Hz sisäänvetolattia; katso FLL-avustus yllä ja <c1/>).

seg-43f02bc861be = Väärän lukituksen tai uudelleenhankinnan haku, jota ei voi ajaa (nopeus, jolla ei ole kokonaislukua näytteitä koodijaksoa kohti), ei enää pysäytä seurantaa.

seg-14f4e9edc443 = Testit: <c1/>, <c2/>, <c3/>, <c4/> ja MCP:n IQ-kiertotesti.

seg-60141bb08f64 = C/N0-profiilit synteettisissä kohtauksissa ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> ajoittaa ajassa vaihtelevan C/N0:n satelliittia kohti Kshanan omissa kohtauksissa, dB-siirtyminä suhteessa kohtauksen C/N0:aan. Muodot: askel, ramppi, paloittain lineaarinen sekä siemenlukuun perustuvat scintillaation kaltaiset Rice-häipymät ilmoitetulla S4:llä ja dekorrelaatioajalla. Ne sovelletaan olemassa olevan kohtauskanavan koukun (<c2/>) kautta, yhdistettynä ionosfääri-, troposfääri-, scintillaatio- ja monitie-eteneminen-vaikutuksiin, ilman muutoksia kohtauksen ytimeen. Totuussivutiedoston kenttä <c3/> seuraa profiilia.

seg-548eeca516ff = Rajapinnat: <c1/> ja <c2/>.

seg-a242e4d9f071 = Mihin se on tarkoitettu: silmukat, monitorit ja kampanjapisteytys voidaan stressitestata tunnettua totuutta vasten. Se muuttaa vain laillisten signaalien voimakkuutta.

seg-ff4df7c343dc = Tarkistukset (<c1/>). Kynnykset: häipymän keskimääräisen intensiteetin poikkeama arvosta { "1" } enintään { "5" } %, S4:n poikkeama tavoitteesta enintään { "8" } % (kun S4 = { "0.3" }, { "0.7" } ja { "1" }), intensiteettikorrelaatio yli { "0.9" } kohdassa { "0.05" } τ ja alle { "0.05" } kohdassa { "5" } τ; totuus täsmälleen ilmoitettu C/N0 plus profiili; seurattu NWPR-C/N0:n pudotus, jonka poikkeama askeleesta { "6" } dB on enintään { "0.7" } dB. Mitattu: S4:n poikkeama tavoitteesta { "1.3" } %, ja seurattu pudotus { "6.26" } dB.

seg-e214458cd1b6 = <b>IQ-polun havaitsemismonitorit ({ "0.34.0" } ”Lab replay”).</b> Uusi moduuli <c1/>, komento <c2/> ja sidonta <c3/>. Ne tarkkailevat tallennetta ja raportoivat aikasarjoja sekä liputettuja tapahtumia (alku-, hälytys- ja loppuajat, huippu, kynnys). Ne vain havaitsevat ja mittaavat; mikään tässä ei generoi signaalia.

seg-5b05b2a54fab = <b>Kokonaisteho / AGC</b>: lohkoteho ja vahvistus, jonka ideaalinen AGC soveltaisi; liputtaa nousut ja laskut.

seg-2a84a640d7f1 = <b>Esikorrelaatiospektri</b>: Welchin PSD lohkoa kohti opittua lähtötasoa vasten. Ylitekynnys tulee väärän hälytyksen tavoitteesta. Myös kompleksinen kurtoosi ja pulssi-ilmaisin. Pulssi-ilmaisin laskee kynnyksen ylittävät näytteet kussakin lohkossa ja nostaa tapahtuman, kun tämän lukumäärän tarkka binomiyläpyrstö on alle <c1/> (oletus { "1e-4" } lohkoa kohti), ei kun z-arvo ylittää rajan: lyhyiden lohkojen pienillä odotetuilla lukumäärillä yksi näyte on jo useita sigmoja.

seg-7704ac807c38 = <b>Kanavakohtainen C/N0</b>: kaksi yksipuolista CUSUM-muutosilmaisinta (lasku ja nousu), joille syötetään riippumattomat estimaatit (askelväli asetetaan silmukan C/N0-ikkunan mukaan).

seg-f965a68d388b = <b>SQM korrelaattoreista</b>: delta <c1/> ja suhde <c2/> sekä epäsymmetriatestit lisäkorrelaattoreista, kun kanava tarjoaa niitä.

seg-a4006c2e8692 = <b>Lukitusindikaattorisarjat</b>: PLI ja taajuuslukitusindikaattori peräkkäisistä prompteista raakasignaaleina. Lukitus- ja lukituksen menetyksen päätökset jäävät seurantamoottorin lukitustilakoneelle.

seg-da72318f44cc = Yksi suoratoistoajo (<c1/>) ajaa kaiken TOML/JSON-asetustiedostolla (<c2/>); kampanja-ajuri käyttää samaa sisäänmenopistettä. Kaikki ovat MODELLED. Jokainen tilasto tarkistetaan suljettua muotoaan vasten siemenlukuun perustuvalla simulaatiolla (<c3/>):

seg-0ff96e4c5a20 = lohkotehon ylitykset Gamma-hännän suhteen;

seg-97b559ea0897 = kurtoosin keskiarvo { "2" } ja hajonta <c1/>;

seg-2b941c702b7f = pulssiosuus <c1/>;

seg-e8f068c41f0c = CUSUM-ajopituudet Siegmundin approksimaatiota vasten (mitattu { "330" } ja { "8.46" } näytettä, kun approksimaatio antaa { "338" } ja { "8.34" });

seg-e2cd6a55e49b = vaihelukitusindikaattori Rician-vaiheen keskiarvoa vasten;

seg-06291b1c6274 = seurattavalla C/A-signaalilla SQM-deltan ja -suhteen hajonnat poikkeavat ensimmäisen kertaluvun suljetuista muodoista noin { "6" } % (mitattu { "5.97" } %; testin kynnys { "12" } %).

seg-12deb36a2e3a = Spektriylitteen väärän hälytyksen kaava on approksimaatio; mitattu osuus oli { "1.3" }× kaava. Päästä päähän monitorit liputtavat:

seg-b002c66c7881 = C/N0-askeleen { "6" } dB (muutoksen ajoitus yhden estimaatin tarkkuudella);

seg-2e828d106393 = tallenteen puolivälissä ilmaantuvan heijastuneen reitin (suhdetesti);

seg-68063f036e2c = signaalikatkon (PLI putoaa arvosta { "0.999" } arvoon −{ "0.3" } ja FLI arvosta { "0.93" } arvoon { "0.03" } sen aikana);

seg-0cd95f0197ec = kapeakaistaisen sävyn ja harvat suuriamplitudiset näytteet (spektri-, pulssi- ja kurtoositestit). Nämä ovat yleisiä DSP-testisyötteitä, eivät häiriömalleja.

seg-7128b9000cc2 = <c1/>/<c2/> suoratoistavat uuden istunnon kautta (katso Lisätty).

seg-98891d33e48c = Valitsin <c1/> säilyttää version { "0.32" } sarakkeensa mutta suoratoistetaan nyt, joten usean kanavan rivit lomittuvat aikajärjestyksessä sen sijaan, että ne ryhmiteltäisiin kanavittain. Valitsin <c2/> säilyttää version { "0.32" } muotonsa ja pitää yhä jokaisen epookin muistissa: käytä pitkille tallenteille valitsinta <c3/>.

seg-2ef2d5771ade = Komento <c1/> mittaa värinän ajon keston jälkimmäisen puoliskon päivityksistä (aiemmin päivitysmäärän jälkimmäinen puolisko), ja sen CSV/JSON saa sarakkeen <c2/>.

seg-f23b6db96748 = Seurantataulukko saa sarakkeen <c1/>.

seg-a5769fbc201e = Käyttöohjeteksti ei enää väitä, että <c1/> ottaa etupään liput; vain <c2/> soveltaa niitä.

seg-cf28fa21786a = Pythonin funktion <c1/> asetukset <c2/> ja <c3/> ovat nyt oletuksena <c4/> (mallin arvot, { "1" } ja { "5000" } Hz sisäänrakennetussa mallissa). Sen epookit saavat aikaiset ja myöhäiset korrelaattorit, <c5/>, <c6/>, <c7/> ja <c8/>, ja tulos saa <c9/> ja <c10/>.

seg-666b9e3faa5d = <b>Oletushankinta-askel ei enää anna Galileo E1 -seurannalle jäännöstä, jota FLL ei pysty vetämään sisään.</b> Askel <c1/> jättää luovutushetkelle enintään <c2/> Doppler-virhettä, mutta oletuksena oleva kaksikvadrantti-FLL vetää sisään vain <c3/>. Jokaiselle koodille, jonka pituus on { "4" } ms tai enemmän (<c4/>), mukaan lukien Galileo E1-B ja E1-C, jäännös ({ "83.3" } Hz, kun koodi on { "4" } ms) oli sisäänvedon { "62.5" } Hz ulkopuolella ja seuranta lukittui väärin kohtaan +{ "125" } Hz, ja vaihelukitusindikaattori { "0.97" } peitti sen. Oletusaskel rajataan nyt myös arvoon <c5/> (<c6/>), { "0.8" } kertaa sisäänveto, joten luovutus pysyy sen sisällä, vaikka viereinen lokero voittaisi. ({ "0.4" } kokeiltiin ensin: se lukittui väärin { "1" } / { "42" } ajossa E1-B:llä, ja koherentti { "1" } ms GPS L1 C/A -haku valitsi lokeron, joka oli { "350" } Hz pielessä, ja lukittui kohtaan +{ "500" } Hz; { "0.25" } ja { "0.2" } eivät aiheuttaneet yhtään samoissa ajoissa.) Hinta: Galileo E1-B/E1-C siirtyvät lokeroista { "166.7" } Hz lokeroihin { "50" } Hz, lokeroita { "201" } alueella ±{ "5" } kHz eikä { "61" }; koodit, joiden pituus on { "1" } ms ({ "166.7" } Hz, <c7/>), ovat ennallaan. <c8/> silmukkamallissa tarkoittaa tätä; nimenomaista <c9/> tai <c10/> käytetään sellaisenaan, ja <c11/> (ei seurannan luovutusta) säilyttää oppikirjan askeleen. Epookkiotsake ja yhteenveto (<c12/>) kirjaavat nyt ratkaistun askeleen ja silmukan kaistanleveydet kutakin kanavaa kohti (<c13/>). Oletusmallin tiiviste on ennallaan. Tulosteen muutos: koodeilla, joiden pituus on { "4" } ms tai enemmän, havainnot voivat osua eri Doppler-lokeroihin.

seg-9150dc89e186 = <b>GPS L2C CM ({ "20" } ms silmukkapäivitys) pitää lukituksen oletusmallilla.</b> Oletuksena olevan { "15" } Hz PLL:n ja { "10" } Hz FLL:n <c1/> on { "0.3" } ja { "0.2" } arvolla T = { "20" } ms, ja silmukka menetti lukituksen jopa täydellisestä alusta (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Uusi mallin avain <c2/> (oletus { "0.1" }) rajaa PLL:n ja FLL:n kohinakaistanleveydet arvoon <c3/>, kun silmukan päivitysaika on pidempi kuin { "4" } ms (<c4/>): { "5" } Hz ja { "5" } Hz arvolla { "20" } ms, { "10" } Hz ja { "10" } Hz BeiDou B1C:llä, jonka päivitys on { "10" } ms; koodit, joiden pituus on { "1" } ms ja { "4" } ms, säilyttävät { "15" } ja { "10" } Hz. Se koskee myös nimenomaisia kaistanleveyksiä; <c5/> kytkee sen pois. Avain jätetään kanonisesta muodosta pois oletusarvossaan, joten oletustiiviste on ennallaan; malli, joka asettaa jonkin muun arvon, saa eri tiivisteen. Tasolla { "45" } dB-Hz L2C CM antaa nyt PLI { "0.996" }, Doppler-virheen { "0.00" } Hz ja M2M4 { "42.71" } dB-Hz. Tunnettu avoin kohta: NWPR-C/N0 lukee siellä { "1.76" } dB liian matalaa (ja { "2.45" } dB liian matalaa B1C:llä, kun päivitys on { "10" } ms), joten matriisin T5 L2C:lle pysyy ohitettuna löydöksenä.

seg-74517bee3f6f = <b>Kuva <c1/> generoitu uudelleen: tallennettu kuva oli vanhentunut oman skenaarionsa suhteen (datan muutos, ei uudelleenpiirto).</b> Kaavio piirrettiin 2026-06-02 tiedostosta <c2/>; kaksi päivää myöhemmin 67fed19e asetti flicker-FM-lattiat siihen skenaarioon (kvantti <c3/>, CSAC <c4/>), eikä kuvaa koskaan piirretty uudelleen. Se näytti lattiaa edeltävän ajon: y-akseli { "0" }–{ "47" } ns, CSAC:n ajokohtainen katkon p95 { "10.5" }–{ "47.6" } ns (keskiarvo { "25.2" } ns), klassinen holdover { "4050" } s keskiarvo. Toimitettu skenaario (kuten opas ja CLI-yhteenveto jo toteavat) antaa y-akselin { "0" }–{ "407" } ns, CSAC:n ajokohtainen p95 { "40.8" }–{ "374.0" } ns (keskiarvo { "167.0" } ns), klassinen holdover { "844" } s [{ "220" }–{ "2130" } s]; { "20" } ns spesifikaatioviiva on edelleen tasolla { "20" } ns, mutta noin yhdeksän kertaa korkeammalla akselilla. Moottori on ennallaan: nykyinen moottori kesäkuun skenaariotiedostolla toistaa vanhan kuvan akselin täsmälleen. Kuvaan ei viitata READMEstä eikä dokumentaatiosta.

seg-75636f9419b2 = Tunnetut rajoitukset

seg-2c607b56048e = <b>NWPR-C/N0 lukee liian matalaa suurella prompt-kohtaisella C/N0·T-arvolla, ja BOC({ "1,1" }) nopeudella { "5" } MS/s menettää noin { "1" } dB.</b> NWPR on harhaton ideaaleilla prompteilla, mutta silmukan oma PLL-värinä maksaa noin sovitetun { "8" } dB × Bn·T (yksi kohtaus, neljä pistettä: −0.24/−0.44/−0.77/−{ "1.58" } dB arvoilla 1/2.5/5/10 Hz ja { "20" } ms; noin −{ "1" } dB oletusasetuksella <c1/>); M2M4 ei ole herkkä. BeiDou B1C -data nopeudella { "5" } MS/s menettää myös noin { "1" } dB prompt-tehoa kaistanrajoituksen vuoksi (käytä { "10" } MS/s tai enemmän). Kumpikaan ei ole estimaattorin vika; signaalimatriisin T5-rivit GPS L2C:lle ja BeiDou B1C:lle pysyvät ohitettuina löydöksinä näillä syillä.

seg-ff195e575023 = <b>Kaavioteksti ja Studion kaavioiden käyttöönotto koventettu.</b> Teksti, jonka skenaario kuljettaa generoituun kaavioon, escapetetaan nyt yhdenmukaisesti yhdellä jaetulla rutiinilla, ja Studio ottaa kaaviosta käyttöön vain piirtomerkinnät. Studion osoiteparametrit, tyyppiavaimiset haut ja skenaarionoudot rajataan tunnettuihin arvoihin. Mukana toimitetut kaaviot, tallennetut tulokset ja julkaistut luvut ovat ennallaan. Päivitystä suositellaan kaikille, jotka avaavat skenaariotiedostoja epäluotettavista lähteistä Studiossa tai upottavat generoituja kaavioita verkkosivuille. Tietoturvatiedote: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>IQ-kerroksen häirintä- ja harhautusalue, kuvattuna tarkasti.</b> Alla olevat versioiden { "0.31.0" } ja { "0.32.0" } merkinnät sanovat, että IQ-kerros lisää ”ei häirinnän tai harhautuksen aaltomuodon synteesiä”. Se pitää paikkansa IQ-kerroksesta itsestään (moduuli <c1/> generoi vain laillisia GNSS-signaaleja), mutta se luettiin lausumana koko moottorista, eikä se ole sellainen: versiosta { "0.29.0" } lähtien tyypin <c2/> osio <c3/> kirjoittaa SigMF-tilannekuvan analyyttisestä mallistaan, jossa on määritetyt häirintälähteet (kohinan kaltaiset lähteet lokero lokerolta, sävyt ja chirpit aaltomuotoina), ja asetus <c4/> summaa aidon ja harhauttajan replikasignaalin muistissa silmukan sieppauksen testaamiseksi (komposiittia ei koskaan kirjoiteta ulos). Moottorilla on ollut myös ohjelmistopohjainen GNSS-vastaanotin versiosta { "0.20.0" } lähtien (<c5/>: hankinta ja seuranta; versiosta { "0.31.0" } myös <c6/> ja <c7/>). Mikään Kshanassa ei lähetä eikä ohjaa radiolaitteistoa. README:n tilarivi, <c8/>, <c9/> ja IQ-suunnitteluhuomautukset sanovat tämän nyt; julkaistut merkinnät on jätetty sellaisiksi kuin ne julkaistiin. Käyttäytyminen ei muutu.

seg-61befd8b474d = <b>Tunnettu rajoitus: kommensuraabeli näytteenotto.</b> Näytteenottonopeudella, joka on chip-nopeuden kokonaisluku- tai puolikokonaislukumonikerta, näytteet osuvat samoille chip-vaiheille jokaisessa chipissä, ja koodidiskriminaattorista tulee porrasfunktio. Synteettisellä GPS L1 C/A -signaalilla tasolla { "45" } dB-Hz ja 0.5 chipin välillä { "2.046" } MHz ({ "2" } näytettä/chip) antaa ≈ { "0.09" } chipin (≈ { "26" } m) RMS-koodivirheen ja −{ "0.09" } chipin harhan, kun taas ≈ { "0.003" } chipiä epäkommensuraabelilla nopeudella. NWPR-C/N0 lukee siellä ≈ { "2.4" } dB liian matalaa. Nopeudella { "4.092" } MHz se riippuu välistä ja koodi-Dopplerista. Arvolla { "0.5" } chipiä se on vaaraton Dopplerilla { "1500" } Hz, mutta { "2" }× koodivirhe harhalla { "0.011" } chipiä Dopplerilla { "0" } Hz, ja välillä { "0.25" } tai { "0.1" } chipiä se on { "8" }–{ "10" }× koodivirhe. Kantoaaltoseuranta ei kärsi. Tiedosto <c1/> sisältää mittaukset.

seg-3a30bd47380a = GNSS-IQ-kerros MCP-palvelimella (vaihe B.1).

seg-ef81eca03bca = Palvelin <c1/> saa kuusi työkalua, jotka ohjaavat kerrosta <c2/> agentilta: <c3/> (hyväksytyt signaalinimet ja IQ-asetukset), <c4/> (kuvaa tallenne), <c5/> (generoi ilmoitetun profiilin tai broadcast-efemeridin kohtaus, valinnaisella signaalitason kanavalla), <c6/> (FFT-hankinta, valinnaisesti etupään vaiheiden takana), <c7/> (hanki, sitten DLL/PLL/FLL-ryhmä) ja <c8/> (kaistanpäästö, lovisuodatus, tyhjennys, poisto, AGC, kvantisoija). IQ-näytteet eivät koskaan kulje protokollan yli: jokainen työkalu ottaa tiedostopolkuja yhden työhakemiston sisällä, jonka asettaa ympäristömuuttuja <c9/> (asettamatta jättäminen jättää IQ-tiedostotyökalut pois päältä ja kaikki muut työkalut ennalleen), kieltäytyy poluista, jotka ratkeavat sen ulkopuolelle, ja jo olemassa olevista tulosteista, ellei <c10/> ole asetettu, valvoo kutsukohtaista näytebudjettia (<c11/>, oletus { "50 000 000" }) ennen mitään työtä, kieltäytyy tuntemattomista argumenteista ja vastaa tiiviillä JSON-yhteenvedolla (havainnot, C/N0, lukitustila ja jokainen kirjoitettu tiedosto tavumääränsä kanssa). Epookkikohtainen tuloste menee vain tiedostoihin, jotka kutsuja nimeää. Työkalut ajavat saman koodipolun kuin CLI uuden julkisen saumakohdan <c12/> kautta, joka palauttaa CLI:n viestin sen tulostamisen sijaan (stdout on MCP:n JSON-RPC-kanava); <c13/> ja <c14/> ovat nyt myös julkisia. Vain ohjelmistoa ja lisäävä: IQ-kerros ei lisää häirinnän tai harhauttajan synteesiä, mitään ei koskaan lähetetä, eikä uusia riippuvuuksia ole. Tiedosto <c15/> ilmoittaa nämä kaksi ympäristömuuttujaa. Tiedoston <c16/> kiertotestit generoivat lyhyen kahden satelliitin kohtauksen ja tarkistavat hankinnan kohtauksen oman totuussivutiedoston suhteen, seurannan lukituksen ja C/N0:n, etupään, SigMF-tulosteen, budjetin, polkujen rajauksen ja pois päältä -tilan.

seg-6963f3fa1db7 = <b>GNSS-IQ-kerros varmennuksen kirjanpidossa (ledger).</b> Ennakkorekisteröity ristiintarkistus gps-sdr-simiä vastaan (riippumaton GPS L1 C/A -kantataajuusgeneraattori, MIT, commit 28ca29a6) kuuluu nyt aina päällä olevaan testisarjaan (<c1/>). Sen tallennettu vertailutuloste (<c2/>: { "20" } ms gps-sdr-simin omaa 8-bittistä I/Q:ta, sen kanavaluettelo ja sen takana oleva kanavatila samaan koontiversioon linkitetystä harnessista) generoidaan skriptillä <c3/>. Mikään testiaikana ei tarvitse verkkoa tai ulkoista työkalua. Kaksi kirjanpidon riviä lisätään ({ "251" } riviä: { "124" } validoitua, { "123" } mallinnettua, { "4" } kumppanin osuutta):

seg-21d005e2ef0e = <em>GNSS-IQ-kohtauksen signaaligeometria riippumatonta kantataajuusgeneraattoria vasten</em>: <b>validoitu</b>. Broadcast-efemeridikohtauksen totuus (näkyvä joukko, pseudoetäisyys, koodivaihe, Doppler, katselukulmat) vastaa gps-sdr-simin kanavatilaa kaikilla { "11" } kanavalla: pahin { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } astetta, kynnyksiä { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz ja { "1e-4" } astetta vasten, jotka asetettiin ennen ajoa.

seg-5c8858182d41 = <em>GNSS-IQ-hankinta riippumattomasti generoiduilla I/Q-näytteillä</em>: <b>mallinnettu, löydöksellä</b>. <c1/> löytää jokaisen simuloidun satelliitin gps-sdr-simin näytteistä rekisteröityjen kynnysten sisällä (koodivaihe enintään { "0.195" } chipiä, Doppler enintään { "72" } Hz). Rekisteröity kynnys ”ei muuta PRN:ää havaittu” kuitenkin epäonnistuu: gps-sdr-simin kohinattomassa tulosteessa Gaussin kohinan kynnyksen ylittää muiden satelliittien ristikorrelaatio kaikilla { "21" } poissaolevalla PRN:llä. Tiukka testi säilytetään, ohitettuna löydöksen kera, ja kiinnitetty testi kirjaa sen. Mikään moottorin koodi tai julkinen API ei muutu. Näyte-I/Q:ta ei vertailla näyte näytteeltä: gps-sdr-simin kokonaislukusinitaulukko, vahvistukset, nollan alkukantoaaltovaihe ja katkaistut LNAV-kentät eivät ole suureita, joista vastaanottimen tarvitsee olla samaa mieltä. Vertailu tehdään havaintosuureilla, joita vastaanotin mittaa.

seg-a2be63287ce4 = <b>Komento <c1/> luovuttaa oletuksena ≈{ "4" } ms hankinnasta (käyttäytymisen muutos).</b> Hankinta, joka alustaa kunkin seurantakanavan, integroi nyt koherentisti <c2/> koodijaksoa yhden sijaan, missä <c3/> on koodin täysi jakso (monitasoiselle koodille primäärin ja sekundäärin pituuden tulo, yksikkö, jonka yli hankinta integroi). Yksitasoiset { "1" } ms koodit (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) hakevat nyt { "4" } jaksoa ({ "4" } ms), joten oletus-Doppler-askel <c4/> on ~{ "167" } Hz eikä ~{ "667" } Hz. Jokainen koodi, jonka täysi jakso on jo { "4" } ms tai pidempi, säilyttää { "1" } jakson: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) sekä monitasoiset GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q ja E1-C ({ "10" }–{ "100" } ms peittokoodeineen) ja GPS L2C. Jokainen signaali siis integroi vähintään ~{ "4" } ms. Yhden jakson haku saattoi luovuttaa kanavan jopa ~{ "333" } Hz pielessä, FLL:n sisäänvedon ulkopuolella, ja se seurasi sitten väärää lukitusta ~{ "500" } Hz päässä raportoiden puhdasta seurantaa. Siemenlukuun perustuvassa pyyhkäisyssä { "180" } GPS L1 C/A -kanavalla (Doppler välillä ±{ "5" } kHz, { "38" }–{ "47" } dB-Hz, puolella navigointidata; <c5/>, uudelleenajettavissa) väärät lukitukset putoavat luvusta { "27" } / { "180" } lukuun { "1" } / { "180" } ja ohi menneet hankinnat luvusta { "102" } lukuun { "11" }, ~{ "40" } ms lisähaulla PRN:ää kohti GPS L1:llä ({ "11" } → { "52" } ms). Ainoa jäljelle jäävä väärä lukitus on tasolla { "38" } dB-Hz, { "36" } Hz pielessä. Jokainen rajapinta on yhtenäinen: <c6/> ja <c7/> (<c8/>), Pythonin <c9/> (<c10/> on nyt auto; stub päivitetty) ja MCP-työkalu <c11/>. Käyttäjät, jotka nojasivat vanhaan oletukseen, voivat antaa <c12/> (<c13/>). Komennon <c14/> oma oletus valitsimelle <c15/> pysyy arvossa { "1" }. Uudet julkiset <c16/> ja <c17/>; regressiotesti <c18/>.

seg-52768eb8e3d5 = <b>Jokainen generoitu grafiikka noudattaa nyt sivuston Observatory-teemaa: jokaisen kaavion tavut muuttuvat.</b> Tämä on julkaistujen kuvien harkittu revisio, vain värit ja fontit; mikään piirretty arvo, koordinaatti tai nimiö ei siirtynyt. Jokaisen skenaarion kaaviotiedosto <c1/> (ja siten Studion kaaviovientien ja READMEn demokaavioiden), ajoraportti-HTML (<c2/>), aikajana-animaatio (<c3/>), skenaariotulos- ja tutkimus-HTML-sivut, validointiyhteenveto sekä dokumentaation kuvat ja kaaviot käyttivät lämmintä tummaa heinäkuun palettia (<c4/> pohja, <c5/> kulta) ja lämpimän paperin raporttiteemaa. Ne ottavat nyt jokaisen värin ja fontin yhdestä moduulista, <c6/>, joka peilaa tiedostoa <c7/>: kaaviot piirretään instrumenttitummina Observatory-pohjalle (<c8/>) Geist-kirjasinpinolla; raportti, animaatiosoitin ja tulossivut seuraavat katsojan vaalea/tumma-asetusta Observatoryn vaaleilla ja tummilla tunnuksilla. Kuusi vika-aluetta säilyttää yhden värin kukin (häiriö koralli, harhautus magenta, ajoitus sininen, radat syaani, eheys lime, navigointi meripihka), ja todistetasot luetaan seuraavasti: validoitu limenvihreä, mallinnettu meripihka, kumppani magenta. Vesiputouksen rampit säilyttävät havainnollisen (inferno) järjestyksensä, uudelleenankkuroituna uuteen pohjaan.

seg-d967e354a966 = Testi <c1/> sitoo moduulin vastaamaan tiedostoa <c2/> molemmissa teemoissa, tarkistaa, että <c3/> ja <c4/> (molemmat generoitu moduulista Python-kuvatyökaluille ja mermaid-clille) ovat ajan tasalla, ja epäonnistuu, jos heksavärivakio esiintyy hakemistossa <c5/> paletin ulkopuolella.

seg-3bc4056fd57e = Komentosarja <c1/> lukee paletin ja generoi nyt myös kolme README-tuloskuvaa, joilla ei ollut tallennettua generaattoria (<c2/>, <c3/>, <c4/>), oikeilla tekstielementeillä, tiedostosta <c5/>, tuloksesta <c6/> ja tiedostosta <c7/>. Komentosarja <c8/> lukee saman paletin, mikä korjaa sen vaalean teeman ajautumisen sivustosta. Kuvan <c9/> arvot ovat tuon testiaineiston pahimman tapauksen sarake <c10/> ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } ja { "4.12e-6" } km), ennallaan Matplotlib-kuvasta, ja <c11/> epäonnistuu nyt, jos tallennettu kuva ja testiaineisto eivät täsmää.

seg-3196836a2a0d = <b>Kuva <c1/> päivitetty ajan tasalle (datan muutos, ei uudelleenpiirto).</b> Kuva ilmoitti { "28" } ominaisuutta { "8" } alueella ({ "11" } validoitua, { "17" } mallinnettua), vanhentuneena oman ilmoitetun lähteensä suhteen; nyt uuden generaattorinsa piirtämänä tiedostosta <c2/> se ilmoittaa { "46" } ominaisuutta { "8" } alueella ({ "17" } validoitua, { "29" } mallinnettua).

seg-55d5b16379aa = <b>CW-/kapeakaistahäirintälähteen Q on nyt { "1.0" }, ei { "1.5" }.</b> Oppikirja-arvo kantoaallolla olevalle sävylle on { "1" } (sävy säilyttää signaalin spektrihuipun, <c1/>, <c2/>); vanha { "1.5" } teki sävystä vähemmän vahingollisen kuin laajakaistakohina yhtä suurella J/S:llä. Tulosteen muutos: noin −{ "1.8" } dB tehollinen C/N0 CW-/kapeakaistahäirintälähteillä suurella J/S:llä tyypeissä <c3/>, <c4/> ja interop (mukana toimitetun esimerkin <c5/> sävy: { "17.98" } dB-Hz taulukosta, oli { "19.74" }). Laajakaistainen Q pysyy { "1.0" } (konservatiivinen, noin { "3" } dB oppikirjan ~{ "2" } alapuolella) odottamassa version { "0.34" } katselmointia. Aseta <c6/> säilyttääksesi vanhan arvon { "1.5" }.

seg-99fab1936170 = <b>Komennon <c1/> kokonaislukutuloste käyttää kokonaislukualuetta.</b> Yksikkötehoisella kohinalla ja kirjoittajan skaalalla { "1" } kohtaukset muodoissa <c2/>/<c3/> tulivat noin { "{" }-1, { "0" }, { "1" }{ "}" } ja 2-bittisten kohtausten kynnykset olivat tasolla { "2.8" } sigmaa. Kokonaislukumuodot skaalataan nyt niin, että odotettu komponenttikohtainen RMS on neljännes täydestä asteikosta ({ "31.75" } LSB muodossa ci8, { "8191.75" } muodossa ci16) tai { "2" } LSB 2-bittisessä. Skaala ja leikattujen alkioiden määrä tulostetaan ja kirjoitetaan sivutiedostoon. Liukulukutuloste on ennallaan.

seg-b6c354fa0c28 = <b>Komennot <c1/> ja <c2/> soveltavat etupään lippuja.</b> Käyttöohjeteksti mainosti valitsimia <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> komennolle <c9/>, mutta komennot <c10/> ja <c11/> eivät koskaan rakentaneet ketjua: liput ohitettiin hiljaa, ja arvoton lippu kuten <c12/> nielaisi sitä seuraavan lipun. Molemmat komennot jäsentävät ne nyt kuten <c13/> ja asettavat tuoreen etupään ketjun hankintakierroksen ja seurantakierroksen eteen. Tuloste on sama kuin komennon ajaminen tiedostolla, jonka <c14/> kirjoittaa samoille lipuille.

seg-d7238dab610e = IQ-kohtauksen data sijoitetaan signaalikohtaisesti.

seg-46ace9a3e008 = <c1/> (ja <c2/>) panivat bitit nopeudella { "50" } bit/s jokaiselle signaalille, pilotit mukaan lukien, ja GPS LNAV -nopeudella Galileolle ja BeiDoulle. Data seuraa nyt kunkin signaalin omaa symbolien ajoitusta, jonka ilmoittaa uusi <c3/> (<c4/>, jonka jokainen konstruktori moduulissa <c5/> asettaa). Se on { "10" } ms L5-I5:llä, { "4" } ms E1-B:llä, { "2" } ms BeiDou B1I GEO:lla (D2) ja bitit, joiden pituus on { "20" } ms, ja { "10" } ms meander GLONASS L1OF:llä. Data evätään pilotilta, GPS L2C:ltä yhtenä CM/CL-virtana, ja <c6/> evätään kaikilta muilta kuin L1 C/A -signaaleilta. Mukautetut koodit säilyttävät aiemman ajoituksen { "20" } ms oletuksena. Ohjelmallinen kohtaus <c7/>, joka pyysi <c8/> muulla kuin L1 C/A -koodilla tai <c9/> pilotilla, generoi aiemmin hiljaa ja palauttaa nyt virheen ensimmäisellä lukemisella.

seg-9dd38fa39d14 = GLONASS L1OF -kanavat hankitaan ja seurataan niiden omalla FDMA-kantoaallolla.

seg-a775751ed6f6 = Funktio <c1/> ja seurantakanavat sekoittivat jokaisen koodin alas pelkästään arvosta <c2/>. Usean kanavan GLONASS-tallenteessa kanavan +{ "3" } haku löysi siksi kanavan { "0" } signaalin (kaikki kanavat jakavat yhden etäisyyskoodin) eikä koskaan katsonut { "1.6875" } MHz korkeammalle. Molemmat käyttävät nyt lauseketta <c3/>. Kantoaaltotermi on nolla jokaiselle tallenteelle, jonka keskitaajuus on signaalin oma kantoaalto, ja se jätetään pois, kun keskitaajuus ei ole tiedossa, joten CDMA-käsittely ei muutu. Jos kierrit vanhan käyttäytymisen sisällyttämällä <c4/> sivutiedoston arvoon <c5/>, poista tuo termi: siirtymä sovelletaan nyt kantoaallosta ja keskitaajuudesta, joten sen jättäminen paikalleen soveltaa sen kahdesti. Tunnettu rajoitus, ennallaan tässä: GLONASS-kohtaus tunnistaa jokaisen satelliitin taajuuskanavansa <c6/> mukaan, ja satelliitin tunnus tyypissä <c7/> kiertää negatiivisen kanavan ympäri. Totuussivutiedosto kirjoittaa arvon <c8/> kentässä <c9/> muodossa { "4294967289" } (<c10/>). Lue se takaisin arvona <c11/> tyyppimuunnoksella <c12/>.

seg-1c88bffc605b = <b>GNSS-IQ-kerros CLI:ssä ja Pythonissa ({ "0.32.0" } vaihe A).</b> Olemassa oleva moduuli <c1/> on nyt käytettävissä ilman Rustin kirjoittamista. Viisi uutta komentoa komentoryhmässä <c2/> liittyy datankäsittelyryhmään: <c3/> generoi pitkän usean satelliitin IQ-kohtauksen tiedostoon totuussivutiedoston kanssa; <c4/> ajaa yhden tai useamman PRN:n FFT-hankinnan tallenteen yli ja raportoi jokaisen havainnon (PRN, Doppler, koodivaihe, tilasto, kynnys); <c5/> hankkii ja ajaa sitten DLL/PLL/FLL-ryhmän tallenteen yli ja tuottaa epookkikohtaisen seurantatulosteen (CSV/JSON) säädettävillä silmukan kaistanleveyksillä, integrointiajalla ja korrelaattoriavälillä; <c6/> toistaa yhden tallenteen usean silmukkamallin läpi ja raportoi syntyvän värinän ja lukitusmittarit mallia kohti; ja <c7/> sovittaa seurantasilmukan lukituksen menetyksen mallin vastaanottimen luottamusaikajanaan. Sama ydin on tarjolla Pythonille (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), ja se palauttaa NumPy-ystävällisiä listoja ja sanakirjoja. Vain ohjelmistoa ja lisäävä: ei uusia riippuvuuksia, ei lähetystä, ei häirinnän tai harhautuksen aaltomuodon synteesiä; moottori, hankinta, seuranta ja silmukkamallit ovat paketin omia, joten CLI- tai Python-kutsuja saa samat bitit kuin Rust-testit. Uusi moduuli <c13/>; kohtauksen oma totuussivutiedosto on riippumaton oraakkeli tiedostossa <c14/> (hankinta palauttaa jokaisen injektoidun koodivaiheen ja Dopplerin, seuranta suppenee injektoituun Doppleriin). Julkaistu skenaariotyyppien määrä tai varmennusmatriisin rivi ei muutu.

seg-1971e3e9cfe6 = <b>Jäljellä olevat GNSS-IQ-kirjaston ominaisuudet komentoryhmässä <c1/> CLI:ssä ja Pythonissa ({ "0.32.0" } vaihe A.2).</b> Rakentuu vaiheen A päälle ja tuo esiin loput kerroksesta <c2/> ilman Rustin kirjoittamista:

seg-67c485097357 = <b>Etenemiskanava komennossa <c1/></b> (ja Pythonin funktiossa <c2/>): ensimmäisen asteen ionosfääri (<c3/>/<c4/> tai <c5/>), Saastamoinen/Niell-troposfääri (<c6/>), Cornellin scintillaatiomalli (<c7/>, <c8/>, <c9/>), peilimäinen maan monitie-eteneminen (<c10/>/<c11/>), kolmitilainen land-mobile-kanava (<c12/>) ja ei-näköyhteyslohko (<c13/>) vaikuttavat jokaiseen satelliittiin uuden crate-sisäisen sillan (<c14/>) kautta, joka muuntaa kanavamallien absoluuttiset polut kohtauksen geometrian ylittävän lisäosan muotoon.

seg-d736671f2251 = <b>SigMF-tuloste komennossa <c1/></b> (<c2/>): kirjoittaa näytteet parina <c3/>/<c4/> capture- ja satelliittikohtaisilla annotaatioilla; <c5/>/<c6/> lukevat jo SigMF:ää, joten kohtaus kiertää edestakaisin.

seg-c59ae97779ae = <b>Etupään DSP</b>: uusi komento <c1/> ja samat liput komennoilla <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) ajavat vaiheet moduulista <c10/> (kaistanpäästö-FIR, adaptiivinen lovisuodin, pulssien tyhjennys, taajuusalueen poisto, AGC, kvantisoija); peilattu Pythonissa nimellä <c11/>.

seg-878d66b73571 = <b>Broadcast-efemeridikohtaukset</b>: <c1/> (valitsimilla <c2/>/<c3/>/<c4/>) sijoittaa jokaisen terveen GPS-satelliitin sen todelliseen lähetettyyn geometriaan moottorin RINEX-lukijalla, joten totuussivutiedosto kantaa todellisen satelliittikohtaisen etäisyyden, Dopplerin ja koodivaiheen; peilattu Pythonissa nimellä <c5/>. Vain ohjelmistoa ja lisäävä: ei uusia riippuvuuksia, ei lähetystä, ei häirinnän tai harhautuksen aaltomuodon synteesiä (kanavan etenemisvaikutukset vaikuttavat vain laillisiin signaaleihin). Jokainen numeerinen väite testataan riippumatonta viitettä vasten (suljettu muoto tai injektoitu totuus) kanava- ja etupääyksikkötesteissä sekä tiedostossa <c6/>.

seg-1e71370d87d8 = <b>GNSS-IQ-kerros: signaalitason simulaatio ja ohjelmistovastaanottimen käsittely.</b> Uusi moduuli <c1/> vie Kshanan yhden satelliitin, lyhyen lohkon L1 C/A -etupäästä täyteen signaalitason kerrokseen, joka on tavoitettavissa komentoryhmästä <c2/>. Se generoi pitkiä usean satelliitin raaka-IQ-kohtauksia epookkikohtaisella totuussivutiedostolla (<c3/>); soveltaa etenemistä signaalitasolla — ionosfääri koodi-kantoaaltoerkaantumisella, troposfääri, amplitudi- ja vaiheen scintillaatio (Cornell-malli), Fresnel-monitie ja kolmitilainen land-mobile-kanava, ei-näköyhteydellä (<c4/>); hankkii ja seuraa FFT-hankinnalla ja usean kanavan DLL/PLL/FLL-ryhmällä, toistaen yhden tallenteen monen silmukkamallin läpi (<c5/>, <c6/>); mallintaa etupään — FIR/IIR-suodatus, 1–14-bittinen kvantisointi, AGC, lovisuodin, pulssien tyhjennys ja taajuusalueen poisto (<c7/>); suoratoistaa suuria tallennettuja aineistoja rajatulla muistilla — int8/int16/float32/pakattu 2-bittinen ja reaali-IF-muodot, usean tiedoston SigMF, uudelleennäytteistys, aineistoluettelo tiedostokohtaisella SHA-256:lla ja eräajuri (<c8/>); lisää hajotuskoodit GPS L5/L2C:lle, Galileo E1:lle (CBOC, todelliset ICD-muistikoodit) ja E5a:lle, BeiDou B1C/B1I:lle ja GLONASS L1OF:lle, kukin tarkistettuna oman rajapintakuvauksensa (ICD) suhteen (<c9/>); ja sovittaa seurantasilmukan lukituksen menetyksen mallin todellisen vastaanottimen havaittuun käyttäytymiseen laboratorioajoissa, pois jätettävän ajon holdout-virheellä (leave-one-run-out) ja ekstrapolaatiolla, joka on merkitty ennusteeksi (<c10/>). Jokainen numeerinen väite testataan riippumatonta viitettä vasten (ICD-taulukko, suljettu muoto tai riippumaton vastaanotin, joka palauttaa injektoidun totuuden); fysikaalinen kanava ja silmukkamallit pysyvät MODELLED. Tämä on vain ohjelmistokerros: se kirjoittaa IQ-tiedostoja ohjelmistovastaanottimille eikä syntetisoi häirinnän tai harhautuksen aaltomuotoja eikä ohjaa radiolaitteistoa. Julkaistu skenaariotyyppien määrä tai varmennusmatriisin rivi ei muutu. Suunnittelu: <c11/>.

seg-943e21ccb25f = Vastaanottimen luottamus: arvioi todellinen GNSS-vastaanottimen loki.

seg-f8274120bff2 = <c1/> lukee u-bloxin UBX-, RINEX { "3" } (valinnaisella broadcast-navigointitiedostolla), Android GnssLogger- tai NMEA { "0183" } -lokin yhdeksi aikaleimatuksi aikajanaksi ja ajaa sen yli luottamusmonitoreja: kantoaalto-kohinatiheyden (C/N0) lasku, lukituksen menetys, automaattinen vahvistuksensäätö (AGC), u-bloxin häirintäindikaattori, paikkahyppy ja, RINEX:llä ja navigoinnilla, moottorin oma yhden pisteen paikkaratkaisu pariteettipohjaisella vastaanottimen autonomisella eheyden valvonnalla (RAIM) ja kelloavusteinen monitori. Jokainen epookki on nominaali, heikentynyt tai ei-luotettu, ja tulos kertoo milloin ja miksi. Skenaariossa ilmoitetut tapahtumat ja ennustetut C/N0-laskut pisteytetään samassa tiedostossa ilmoitettuja toleransseja vasten: havaittu, myöhässä tai havaitsematta jäänyt, sekä samaa mieltä tai eri mieltä. Tulosteet ovat tulos-JSON, epookkikohtainen CSV ja kaavio; tulos kantaa lokin SHA-256:n ja jokaisen kynnyksen. Tavoitettavissa myös Pythonista (<c2/>), WebAssembly-paketista (<c3/>, lokit inline) ja Model Context Protocol (MCP) -palvelimen uudesta työkalusta <c4/>. Opas: <c5/>; esimerkki: <c6/>. JammerTest { "2024" } -harhautuslokeilla moottoripolku toistaa ennakkorekisteröidyn oraakkeliputken ensimmäisen hälytyksen jokaisella julkaistulla alkuhetkellä (<c7/>). Monitorit pysyvät MODELLED; mikään varmennusmatriisin rivi ei muutu.

seg-55669fe92932 = Pienempi julkaisu. Validointikierrokset { "2" } ja aallon 1 paketit nostavat varmennusmatriisin { "223" } rivistä ({ "93" } VALIDATED) versiossa { "0.29.3" } { "249" } riviin ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); jokainen ylennys tarkistettiin riippumatonta oraakkelia vasten toleranssilla, joka asetettiin ennen ajoa, ja jokainen ristiriita julkaistaan löydöksenä. Uutta: natiivi NAIF-kernel-lukija ja DE440-polku, yksi validoitu SGP4:stä ITRS:ään -propagointi- ja aikapolku, mitattu kellokirjasto, LunaNet AFS -vertailugeneraattori, laajennetun tarkkuuden ja neliöjuuri-informaatioratkaisijat sekä todellinen kuun IQ-käsittely LuGRE-datalla. Muuttuneet julkaistut luvut on lueteltu alla revisioina.

seg-f75f1878045e = Kaksikymmentäseitsemän varmennusmatriisin riviä muuttuu VALIDATED-tasoisiksi, kun riippumaton oraakkeli oli samaa mieltä toleranssin sisällä, joka asetettiin ennen ensimmäistä vertailua (ylennyssääntö tiedostossa <c1/>): kymmenen ensimmäisellä validointikierroksella ja seitsemäntoista toisella. Viisikymmentäyksi MODELLED-riviä vietiin ulkoiselle oraakkelille ensimmäisellä kierroksella ja jäljellä olevat reititettävät rivit toisella; jokainen ristiriita kirjataan alla löydöksenä eikä viritetä pois. Kolme riviä jaettiin niin, ettei validoitu osa kanna validoimatonta jäännöstä, mikä nostaa matriisin { "223" } rivistä { "226" } riviin; sen jälkeen yhdistetyt validointipaketit nostavat sen { "249" } riviin. Luvut luetaan generoidusta tiedostosta <c2/>.

seg-8d542741fa77 = kierroksen { "1" } jälkeen

seg-ae3743f976c5 = Varmennusmatriisin rivit

seg-6c4b1fd56a31 = joista VALIDATED ulkoista oraakkelia vasten

seg-90450fe87280 = joista MODELLED

seg-86972e4c7f12 = joista PARTNER

seg-61c5c5e308ed = Tässä merkinnässä käytetyt lyhenteet

seg-5907283b71da = Lyhenne

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (ARAIM:n); edistynyt vastaanottimen autonominen eheyden valvonta; Stanfordin yliopiston Matlab Algorithm Availability Simulation Tool

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = Allanin poikkeama; nopeuden satunnaiskävely; kulman satunnaiskävely

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = avoimen lähdekoodin astrodynamiikkatyökalupaketti (Nyx Space); NASA:n Navigation and Ancillary Information Facility -yksikön Spacecraft, Planet, Instrument, C-matrix, Events -työkalupaketti; planeettavakiokernel

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = barysentrinen taivaallinen koordinaatisto; barysentrinen dynaaminen aika; maanpäällinen aika

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Kansainvälinen paino- ja mittatoimisto; laboratorion toteutus yleisestä koordinoidusta ajasta

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems (avaruusdatajärjestelmien neuvoa-antava komitea); Orbit Ephemeris Message; kuun aikajärjestelmät, jotka kirjoitetaan viestin TIME_SYSTEM-kenttään

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = Cramér–Rao-alaraja

seg-a1fff77503b4 = CW

seg-064470740a35 = Clohessy–Wiltshire-suhteellinen liike

seg-d70a9b3e92a7 = Jet Propulsion Laboratoryn kehitysefemeridi { "440" }

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = tarkkuuden heikkenemiskerroin; paikan tarkkuuden heikkenemiskerroin

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = laajennettu Kalman-suodatin; unscented Kalman -suodatin; inertianavigointijärjestelmä; maailmanlaajuinen satelliittinavigointijärjestelmä; inertiamittausyksikkö

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = tehollinen monitorikynnys; pystysuuntainen ja vaakasuuntainen suojaustaso

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = Maan orientaatioparametrit; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; keskimääräinen itseisvirhe

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = NASA:n General Mission Analysis Tool

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = ei-maanpäällinen verkko (3GPP); synkronointisignaalilohko

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = kokonaislukujen pienimmän neliösumman menetelmä; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = järjestelmien välinen harha

seg-743c3303e01c = LEO

seg-d7b83e7c427f = matala Maan kiertorata

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = usean hypoteesin ratkaisuerottelu; suojaustaso; ajoituksen suojaustaso

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = tehotiheysspektri; vaihe- ja kvadratuurinäytteet (in-phase ja quadrature); Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kvanttiprojektiokohina

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = vastaanottimen autonominen eheyden valvonta

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = satelliittipohjainen täydennysjärjestelmä; Yhdysvaltain Wide Area Augmentation System; kaksitaajuinen usean tähdistön; geostationaarinen SBAS-satelliitti

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = neliöllinen keskiarvo; signal-in-space-etäisyysvirhe

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = avoimen lähdekoodin GNSS-paikannuskirjasto

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = erittäin pitkän kantaviivan interferometria

seg-c3bc7d828ecc = Jokainen alla oleva rivi nimeää oraakkelinsa lajin (Kirjasto: riippumaton kolmannen osapuolen kirjasto, joka laskee yksikäsitteisesti määritellyn suureen; Mitattu: todellinen mitattu data; P2: riippumaton numeerinen kirjasto, joka laskee lineaarialgebran suureen uudelleen talletetuilla syötteillä), oraakkelin, ennen ajoa asetetun toleranssin ja tuloksen. Jokainen ylennys ajettiin uudelleen toisen katselmoijan toimesta, joka generoi testiaineiston uudelleen tavu tavulta ja osoitti, että harkittu moottorimutaatio värjää testin punaiseksi.

seg-be0a4e3ac81c = <b>GNSS/INS-sensorifuusio</b> (Kirjasto), rajattuna löyhästi kytkettyyn 15-tilaiseen virhetila-EKF:ään: NaveGo v1.4 (LGPL-3.0, ajettu GNU Octavella) omalla todellisella Ekinox IMU/GNSS -ajollaan. Kshanan vaaka-, pysty- ja paikkainnovaation RMS ovat { "0.912" }, { "0.940" } ja { "0.861" } NaveGon vastaavista (kynnys { "1.2" }) ja sen keskimääräinen normalisoitu innovaatio on { "0.395" } (kynnys { "1.5" }). GNSS on läsnä koko ajon, joten katkoa ei testata. Tiukasti kytketty UKF ja kytketty kellosuodatin jäävät väitteen ulkopuolelle.

seg-0c82afd5ba30 = <b>3-DOF-asento ja osoitusvirhebudjetti</b> (Kirjasto), rajattuna gravitaatiogradienttimomentin huippuun: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } tapausta, suhteellinen poikkeama enintään { "1e-12" } (pahin { "2.1e-15" }). RSS-osoitusbudjetti on kutsujan antamien lukujen summa ja jää sen ulkopuolelle.

seg-71cf58e91a09 = <b>Kuun yhteinen viestintä- ja navigointigeometria</b> (Kirjasto), rajattuna paikan sijoitukseen, atsimuuttiin, korkeuskulmaan ja etäisyyteen: ANISE { "0.10.2" }, { "768" } näytettä, enintään { "1e-6" } astetta ja { "1" } mm (pahin { "2.2e-12" } astetta ja { "5.6e-9" } m). Etäisyysmittauksen tarkkuusparametri on suunnittelusyöte väitteen ulkopuolella.

seg-0687c757231b = <b>Vääntömomentiton jäykän kappaleen asentodynamiikka</b> (Kirjasto): Basilisk { "2.9.1" } -avaruusaluksen runko, { "1e4" } s kahdella yleisellä inertiatensorilla, kvaternio ja kulmanopeudet enintään { "1e-9" } (pahin { "3.3e-11" } ja { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>GNSS-kantoaallon vaiheen kokonaislukuepävarmuuden ratkaisu (LAMBDA)</b> (Kirjasto), rajattuna ILS-ratkaisuun ja sen kahteen parhaaseen normiin: RTKLIB v2.4.2-p13, funktio <c1/>, { "300" } kovarianssia, { "0" } kokonaisluvun ristiriitaa, normit suhteellisesti enintään { "1e-9" } poikkeamalla (pahin { "5.6e-13" }). Bootstrap-onnistumisosuus pysyy vain sisäisesti tarkistettuna.

seg-c23196cbdc96 = <b>Koostettu ajoituksen PL, skalaari-MHSS</b> (P2): numpy { "2.3.5" } ja scipy { "1.18.1" } { "300" } talletetulla syötteellä, PL suhteellinen poikkeama enintään { "1e-9" } (pahin { "1.2e-10" }), ajava osajoukko identtinen.

seg-8f524d815949 = <b>GLS-yhteismuotovalkaisu ja Mahalanobis-identiteetti</b> (P2): numpy { "2.3.5" } LAPACK { "201" } talletetulla kovarianssilla, suhteellinen poikkeama enintään { "1e-12" } (pahin { "7.9e-16" }); ehtoluvut enintään { "19.3" }.

seg-b4136cdb8a98 = <b>DE440 kuun pääakselin orientaatiolähde</b> (Kirjasto): SPICE:n funktio <c1/> binäärisellä PCK:lla { "2 000" } solmun ulkopuolisella epookilla, enintään { "1.7e-5" } rad (pahin { "1.7e-6" } rad, noin { "3" } m pinnalla), kohdassa ”Korjattu” luetellun korjauksen jälkeen.

seg-c28de00a491c = <b>SigMF-tallenteen syöte ja tuloste sekä Welchin spektrit</b> (Kirjasto), rajattuna SigMF:n lukuun ja kirjoitukseen sekä funktioon <c1/>: scipy { "1.18.1" } <c2/> suhteellinen poikkeama enintään { "1e-12" } lokeroa kohti (pahin { "6.0e-14" }); sigmf-python { "1.13.0" } -tallenteet dekoodattu bitti bitiltä identtisesti; paketin metadata kelvollinen SigMF { "v1.2.6" } -skeemaa vasten. IQ-synteesi ja sen mallivertailut jäävät sen ulkopuolelle.

seg-a7756d2e124a = <b>LEO-broadcast-efemeridisovitin ja SISRE sovitusvälin suhteen</b> (Mitattu), rajattuna 16-parametriseen Kepler-sovitukseen ja sen pelkän radan SISRE:hen: TU Grazin ITSG-tarkat radat neljälle satelliitille Liu ym. { "2025" } tilastoja vasten, komponentit 1.5x sisällä ({ "0.804" }–{ "1.087" }) ja SISRE 1.5x sisällä ({ "0.716" }–{ "0.809" }).

seg-99debd58724a = Löydökset

seg-3f5b2f54c7bf = Oraakkeli oli eri mieltä näiden rivien kanssa, joten ne pysyvät MODELLED. Jokainen löydös kirjataan myös rivin oraakkelitekstiin (ja siten tiedostoon <c1/>), ja testi kiinnittää sen.

seg-e28fac875d8c = <b>Satelliittiin sijoitetun kellon tilan estimointi:</b> pidätetyillä (holdout) IGS-kelloilla { "11" } GPS Block IIF -satelliitille kolmitilainen suodatin on johdonmukainen yhden askeleen eteenpäin mutta ylivarma tunnin kohdalla satelliiteilla { "9" } / { "11" } (jaksolliset ja flicker-termit eivät ole mallissa).

seg-5900ce454dc7 = <b>Harhautuksen havaitseminen:</b> JammerTest { "2024" } -aineistossa mikään havaintotason monitori ei hälyttänyt { "10" } s:n kuluessa yhdestäkään { "8" } julkaistusta alkuhetkestä, ja kolme ennen alkua olevaa ikkunaa sisälsi vääriä hälytyksiä.

seg-08b6e6aa7d08 = <b>Ajoituksen suojaustaso harhautuksessa:</b> mitattu havaitsematon aikavirhe ylittää TPL:n { "3" } / { "8" } havaitusta alkuhetkestä (1.9x–5.3x); { "60" } s:n kellokalibrointi ei kata vastaanottimen TCXO:n vaellusta.

seg-a2f4df11d9cc = <b>Laukaisuikkuna ja nousun geometria:</b> Orekit { "12.2" } vasten geometria täsmää pyöristykseen asti, mutta Maan pyörimisen paikkanopeus ei täytä suhteellista toleranssia { "1e-6" } leveysasteella { "62.9" } astetta ({ "1.12e-6" }, napaliike, jonka pallomalli jättää pois). Kierros { "2" }: todellisen navan nopeus epookilla täsmää, oletusnopeus ilman epookkia ei vieläkään täytä toleranssia (katso alla).

seg-f6b6c9251a17 = <b>Ballistinen paluukäytävä (Allen–Eggers):</b> ennustettu huippuhidastuvuus Stardust-paluulle on { "61.8" } g rekonstruoitua { "32.89" } g vasten (+{ "88" } %, toleranssi { "15" } %).

seg-5d83648dd867 = <b>Yhteinen UT1- ja napaliikevirhe:</b> { "178" } IERS Bulletin A -numeron tulostamaa tarkkuuskaavaa vasten napa täsmää 1.5x sisällä, mutta UT1 ei ({ "0.48" } { "10" } päivän kohdalla, { "1.59" } { "40" } päivän kohdalla). Korvattu kierroksella { "2" }: rivi on nyt VALIDATED (katso alla).

seg-98a99bcba894 = <b>Offline-oletuksena oleva Maan orientaatiotieto:</b> astropy vahvistaa rivimäärän, mutta { "12" } riviä, joita crate kutsuu Bulletin A:n ennusteiksi, on merkitty mitatuiksi (I), ei ennustetuiksi (P). Operatiivisen ennustimen rivin yhtäpitävyysluvut olivat siis mitattuja rivejä vastaan. Korvattu kierroksella { "2" }: moottori luokittelee rivit lipun mukaan ja rivi on VALIDATED.

seg-d96fbfa4be79 = <b>Operatiivisen tyylinen Maan orientaation ennustevirhe:</b> ennustimen UT1-virhe on 2.4x–12.6x Bulletin A:n virheeseen verrattuna ajanjaksolla { "1" }–{ "10" } vrk, ja { "5.32" } ms { "10" } vuorokauden kohdalla, mikä on 2. EOP PCC:n { "0.36" }–{ "3.13" } ms:n vaihteluvälin ulkopuolella.

seg-1833bf6e3b6f = <b>Kuun geodeettinen VLBI:</b> ANISE:n DE440:n kautta laskemia valoaikoja vastaan yksikään viive ei ole { "1" } ps:n sisällä; suurin ero on { "24" } µs, pääosin analyyttisen Kuun keskipisteen takia (noin { "200" } km DE440:stä). Kierros { "2" }: kernel-polku on VALIDATED omalla rivillään; tämä analyyttinen polku pysyy MODELLED-tasolla.

seg-0ec8a2a91702 = <b>Kuun yhteentoimivuusvienti:</b> Orekit { "12.2" } kieltäytyy LTC- ja TCL-aikajärjestelmistä, joten Kuun OEM-tiedostojen vaihtoa toisen lukijan kanssa ei ole osoitettu.

seg-09cfd4e61b7b = <b>Clohessy–Wiltshiren suhteellinen liike:</b> Orekitin epälineaariseen liikkeeseen verrattuna { "100" } m:n kohdalla ero on { "1.2" }–{ "6.3" } mm eli yli { "1" } mm; se skaalautuu pois jätetyn toisen kertaluvun termin mukana, joten ennakkorekisteröity toleranssi oli linearisointivirheen alapuolella. Korvattu kierroksella { "2" }: toisen kertaluvun korjaus on VALIDATED samaa kynnystä vasten.

seg-af1bdd974ba5 = <b>INS/TRN-vapaaliikkumisen virheen kasvu:</b> NaveGon vapaa-inertiaalista Monte Carlo -ajoa vastaan kasvulait pitävät { "5" } %:n tarkkuudella { "600" } s asti ja yliarvioivat sen jälkeen (2.2x–8x tunnin kohdalla), koska ne jättävät pois Schuler-takaisinkytkennän. Korvattu kierroksella { "2" }: Schuler-virhemalli on VALIDATED.

seg-8459bc50f8b4 = <b>Kuun palvelualue todellisesta tähdistögeometriasta:</b> { "4" } julkaistusta { "12" } saatavuustilastosta poikkeaa yli { "2" } prosenttiyksikköä (enimmillään { "22.5" }).

seg-7a0fd1377b9c = <b>Heterogeenisen UTC(k)-jäljitettävyysharhan ylärajaus:</b> { "105 024" } BIPM-rivillä ylärajaus ylittyy { "50.8" } %:ssa riveistä; julkaistu epävarmuus rajaa BIPM:n suorittaman poikkeaman mittauksen, ei itse poikkeamaa.

seg-814acf34cffd = <b>Kuun datumin nolla-avaruuden luokittelu:</b> julkaistulla viiden heijastimen geometrialla korrelaatio on -0.78 verrattuna arvoon -0.97, ja origon CRLB on { "96" }–{ "98" } % alempi kuin artikkelissa.

seg-da01b5e08a87 = <b>Kuun LLR-datumin geometria-alusta:</b> { "192" } ILRS:n vuoden { "2024" } Kuun normaalipistettä vastaan yksisuuntaisen residuaalin RMS oli { "96" } m aiemmalla orientaation interpoloinnilla ja on { "22.7" } m jäljempänä kuvatun korjauksen jälkeen, edelleen yli { "10" } m:n kynnyksen (pyöristetyt asemakoordinaatit, ei napaliikettä). Orientaatiosarja katkaisee arvot äänettömästi vuosien 2024–2025 ulkopuolella. Kierros { "2" }: mitatun etäisyyden malli on VALIDATED omalla rivillään ({ "2.81" } m); sarja kattaa nyt vuodet 2014–2030 ja antaa virheen sen ulkopuolella.

seg-fd9ad94680e9 = <b>Relativistinen kellotaajuuden ja koordinaatiston kytkentä:</b> itsepotentiaalitermi on { "3.18e-4" } julkaistun arvon yläpuolella (toleranssi { "1e-4" }); artikkeli arvioi eri potentiaalin, joten tämän suljetun muodon julkaistua arvoa ei ole. Korvattu kierroksella { "2" }: asteen 2 päiväntasaajapotentiaali on VALIDATED samaa artikkelia vastaan.

seg-e002819c1e2d = <b>Kaikkien aurinkokunnan kappaleiden fysikaaliset vakiot:</b> { "12" } lisättyjen kappaleiden { "84" } vakiosta poikkeaa NAIF:n pck00011- ja gm_de440-arvoista (vanhemmat Marsin kuiden elementit; muut GM-ratkaisut Uranukselle, Neptunukselle ja Plutolle). Kierros { "2" }: vakiot noudattavat nyt NAIF:ia (siirto sellaisenaan, ei lasketa), ja laskettu orientaatio vastaa SPICEa; rivi pysyy MODELLED-tasolla.

seg-e722d242e78e = <b>Valittavat LEO-efemeridimallit:</b> 22 parametrin sovitus jättää 1.71x ja 1.86x julkaistusta ratasuuntaisesta virheestä { "20" } min:n kaarilla, yli 1.5x. Korvattu kierroksella { "2" }: 22 parametrin malli ja sovitus ovat VALIDATED omalla rivillään.

seg-c136023752df = <b>Yhteinen GNSS- ja LEO-paikannus:</b> järjestelmien välinen harha vastaa RTKLIBiä, mutta { "93.2" } % epookeista on { "3" } m:n sisällä ITRF2020:sta verrattuna lukuun { "95" } %; RTKLIB itse yltää aineistolla { "88.2" } %:iin ({ "93.6" } % kierroksen 2 ryhmäviivekorjauksen jälkeen).

seg-e5f0e3c21def = <b>Yhteismuotoinen eheyssokeus</b> ja <b>kattavuus- ja DOP-kartat:</b> molemmat vertailut menivät läpi, mutta ne hylättiin katselmoinnissa, koska tarkoituksellisesti väärä moottori läpäisee ne myös (ensimmäinen tarkistaa vain sisäisen identiteetin; toisen julkaistut alarajat eivät huomaa kaksinkertaistettua PDOPia). Kierros { "2" }: yhteismuotoinen eheyssokeus on VALIDATED pariteettia sisältävillä syötteillä; kattavuuskartat pysyvät löydöksenä (katso jäljempänä).

seg-688e1753cd53 = Validointikierros { "2" }

seg-b320fbdb72c3 = Toinen kierros otti mukaan jokaisen rivin, jonka ensimmäinen kierros jätti reitittävissä olevaksi: tuoreet ennakkorekisteröinnit tallennettiin ennen kuin yhtään fixturea haettiin tai oraakkelia ajettiin, vastakkainen toinen katselmoija ajoi jokaisen vertailun uudelleen, ja tarkoituksellinen moottorimutaatio piti saada jokaisen testin punaiseksi. Omistaja hyväksyi Omegan ulkopuolisen rajan rivin korjatun sanamuodon 2026-10-02 ennen sen ylentämistä (sen vanha teksti oli ristiriidassa koodin kanssa).

seg-7b7c584caaaf = <b>Ylennetty tasolle VALIDATED ({ "17" }).</b> Oraakkelin laji sulkeissa; toleranssi asetettu ennen ajoa.

seg-555e6ad454d2 = <b>Relativistinen kellotaajuuden ja koordinaatiston kytkentä</b> (Viite): Ashby ja Patla { "2024" } L_m { "2.8e-6" }:n sisällä (kynnys { "1e-4" }) artikkelin siteeraamien kahden kentän asteen 2 päiväntasaajapotentiaalista; pyshtoolsin asteen 350 painovoima radiaalimerkinnälle ({ "8.3e-5" }); DE441:n Kuun nopeus ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Offline-oletuksena oleva Maan orientaatiotieto</b> (Kirjasto): astropy { "8.0.1" } ja IERS Bulletin A No. { "039" } vahvistavat uudelleenleikatun otteen { "30" } lopullista, { "54" } nopeaa ja { "90" } ennustettua riviä.

seg-b77253dd26b5 = <b>Yhteinen UT1- ja napaliikevirhe</b> (Kirjasto): astropyn ja pyerfan täydet rotaatiot toistavat yhteistaulukon (UT1 ja napa { "6e-16" }:n sisällä, yhdistelmä { "1.9e-7" }:n sisällä); IERS Annual Report { "2019" }:n toteutuneet virheet antavat suhdeluvut { "1.001" }–{ "1.100" }.

seg-378414f812c1 = <b>EO-hyötykuorman jalanjälki ja kattavuus</b> (Kirjasto): Orekit { "12.2" } ja GeographicLib { "2.1" } jokaisella ennakkorekisteröidyllä kynnyksellä, J2-solmuregressio nyt mukana solmuvälissä.

seg-792bf58a1c1e = <b>Clohessy–Wiltshiren suhteellinen liike</b> (Kirjasto): suljetun muodon toisen kertaluvun korjauksella { "1.2e-7" } m:n sisällä Orekitin epälineaarisesta liikkeestä kynnyksellä { "1e-3" } m; pelkkä lineaarinen matriisi pysyy luonnehdittuna ({ "1.2" }–{ "6.3" } mm).

seg-423437d90022 = <b>B-tason kohdistus ja patched-conic-painovoima-apu</b> (Kirjasto): GMAT R2026a B-taso, asymptootit, C3 ja heliosentriset elementit; sbpy { "0.6.0" } sekä Kasuga ja Jewitt { "2019" } Tisserandin parametrille.

seg-b29b0dfcd3a4 = <b>INS/TRN-vapaaliikkumisen virheen kasvu</b> (Kirjasto): yhdeksän tilan Schuler-virhemalli { "5" } %:n sisällä korjatuista NaveGon vapaaliikeajoista kaikissa { "48" } pisteessä (pahin { "3.70" } %).

seg-8cc49496b4c6 = <b>Yhteismuotoinen eheyssokeus</b> (P2): numpy <c1/> { "1464" } pariteettia sisältävällä syötteellä { "1e-12" }:n sisällä (pahin { "1.06e-14" }).

seg-f0ff538b7329 = <b>Kuun yhteinen monitekniikkainen OD ja kello</b> (P2): numpy laskee uudelleen jokaisen Gauss–Newton-askeleen, sigman ja asemavirheen kuudessa verkossa ({ "2.4e-11" }:n sisällä) QR-ratkaisun korjauksen jälkeen.

seg-7ed9b059f888 = <b>Kuun VLBI-asemakoordinaattien kovarianssi</b> (Kirjasto): SPICEllä rakennettu Jacobin matriisi toistaa aikataulun, spektrin, sigmat ja nolla-avaruuden { "1" } %:n ja { "0.1" } asteen sisällä; numpy { "2e-13" }:een.

seg-0e4e1c3fc899 = <b>Omegan ulkopuolisen residuaalin havaitsematon yhteismuotoinen raja</b> (P2, omistajan päätöksellä korjattu sanamuoto): numpy LAPACK { "256" } tapauksessa { "1e-12" }:n sisällä, kuusi tarkkaa äärettömyyttä.

seg-0fc8ce9cde6c = <b>Kantainvariantti nolla-avaruuden luokittelu</b> (P2): SciPyn ja NumPyn aliavaruuksien leikkaus { "72" } konstruoidulla matriisilla, kokonaisluvut tarkat, projektorin normi { "6.0e-15" }:n sisällä.

seg-4e5e7a6072bc = <b>LEO-navigointisanoman yksitaajuiset ionosfääri- ja UTC-palvelut</b> (Kirjasto): GNSSTk { "15.3.1" } Klobucharille, atsimuutille ja UTC-ajautumalle; ERFA kolmelle karkaussekuntitapaukselle.

seg-a644bf49c816 = <b>5G:n ei-maanpäällisen verkon paikannusraja</b> (P1): Bachlin, Lein ja Nabeelin { "2026" } yhden SSB:n rajat puolen painetun numeron sisällä; numpy paikkaratkaisun kovariansseille.

seg-b326f6fc55ad = <b>LLR:n mitatun etäisyyden malli</b> (Mitattu, uusi LLR-datumialustan rivistä erotettu rivi): { "192" } ILRS:n Kuun normaalipistettä { "2.81" } m RMS vastaan { "10" } m:n kynnys, IERS { "2010" }:n barycentrisellä valoajalla; kynnyksen alle jäävät osatekijät ratkaistaan ei yksitellen, ja rivi sanoo sen.

seg-82e9fba684dc = <b>Kuun geodeettinen VLBI, kernel-polku</b> (Kirjasto, uusi Kuun VLBI -rivistä erotettu rivi): SPICEn konvergoituneet valoajat { "1" } ps:n sisällä ja osittaisderivaatat { "1e-6" }:n sisällä J2000:n lähellä olevilla epookeilla; analyyttinen oletuspolku pysyy MODELLED-tasolla.

seg-03c47d262ff3 = <b>Liun ym. { "2025" } 22 parametrin LEO-efemeridimalli ja sen sovitus</b> (Mitattu, uusi valittavien mallien rivistä erotettu rivi): oikeat tarkat radat 1.5x:n sisällä julkaistuista tilastoista artikkelin päivinä ja pidätetyillä päivillä ({ "0.683" }–{ "1.186" }); n_dot-skaalauskonventio on kopioitu eikä tämä vertailu validoi sitä, ja pysäytyssääntö on Kshanan parametrikonvergenssisääntö, ei artikkelin RMS-muutossääntö. ATOMIC-polynomi ja viiden korkeuden taulukko pysyvät MODELLED-tasolla.

seg-b49f96eb52ad = Olemassa olevat VALIDATED-rivit tuettu uudelleen (määrä ei muutu).

seg-4e26bec3297c = <b>Planeettojen paikat JPL:n Standish-elementeistä</b> ja <b>valoaika aurinkokunnan kappaleiden välillä</b>: jälkikäteen asetetut kaksinkertaisen nimellisarvon kynnykset korvataan ennakkorekisteröidyillä vertailuilla JPL Horizons DE441:een (RMS enintään Explanatory Supplementin taulukon { "8.10.1" } luku, pahin { "0.778" }, Maan jako ja ICRF-rotaatio mukaan lukien; valoajat { "1e-6" } s:n sisällä Horizonsista DE441-paikoilla, pahin { "6.7e-9" } s). Niiden lippu "raja asetettu vertailun jälkeen" poistetaan.

seg-d3b745392d29 = <b>Eheys (RAIM/ARAIM/SBAS)</b>: rivi ei enää nojaa uskottavuustarkistuksiin. Se kertoo nyt: ADD v4.2:n ARAIM-monihypoteesinen ratkaisuerotus vastaa Stanford MAASTia ARAIM { "2" }:lle { "270" } todellisessa tapauksessa (pahin VPL-ero { "2.2e-3" } m kynnyksellä { "0.05" } m); hetkellinen RAIM-havaitseminen ja -poissulkeminen vastaavat RTKLIBin <c1/> { "2016" }:ta { "2016" }:sta päätöksestä, kaltevuussuojaustaso { "2.7e-12" } m:n sisällä; SBAS DO-229E:n L1-suojaustasot vastaavat Stanford MAASTia todellisilla WAAS-lähetyksillä ({ "2868" } paria { "1.6e-5" } m:n sisällä). Se toteaa suoraan, että tasasigmaiset funktiot <c2/> ja <c3/> EIVÄT vastaa ADD-määritystä (vastaavilla syötteillä erot 0.75/4.04 m ja 0.39/1.93 m VPL/HPL, löydös), että DFMC L5 SBAS -vertailu on löydös ({ "308" } paria, joissa ei ole GEO-satelliittia näkyvissä, Kshana suojaa mutta MAAST ei) ja että <c4/> ei ole ulkoista vertailua. Sen itselippu poistetaan.

seg-d059b9953c3f = <b>LEO-lähetysefemeridin sovitin:</b> integroitu totuusrata lisätään validoituun osaan (Orekit { "12.2" } { "4.55" } mm:n sisällä { "6" } tunnin aikana, kynnys { "2" } cm); korjauspolynomit, kellosovitus ja päivitysjakson kompromissi pysyvät mallinnettuina.

seg-166d511bbba3 = <b>Löydökset ja estyneet rivit (pysyvät MODELLED-tasolla).</b> Jokaisen rivin oraakkelitekstissä on löydös ja sen kiinnitetty testi.

seg-7f233dbdf110 = Navigointisignaalin modulaatio (Betz { "2001" }, Hein { "2006" }): spektrit ja korrelaatiot vastaavat; { "24" } MHz:n sivukeilat ja jokainen monitie-etenemisen harha ({ "11" }–{ "15" } % liian pieni) eivät vastaa, syy ratkaisematta.

seg-4d5a6bb44d64 = TDOA/FDOA-paikannus: rajat vastaavat Hon ja Chanin sekä Hon ja Xun tuloksia ja kirjoittajien koodia { "3e-12" }:n tarkkuudella; Monte Carlosta painetut Ottawan kertoimet poikkeavat { "1.3" } % ja { "4.4" } %.

seg-5fa189f788ca = Maan GNSS Kuun etäisyydellä: GENESIS-seniittikeskiarvot vastaavat Montenbruck ym. { "2023" } tuloksia { "5" }:ssä { "6" }:sta; nadiirikeskiarvot ovat { "1.0" }–{ "2.4" } satelliittia liian korkeita.

seg-d7e5b5a64f43 = Kattavuus- ja DOP-kartat: Maan mallit vastaavat Orekitia, gnss_lib_pyta ja numpya jokaisella kynnyksellä; Kuun ja Marsin mallit ylittävät { "1e-9" } vain lähes singulaarisissa soluissa.

seg-3c8fb07d83ec = Yhteinen GNSS-paikannus: kaksitaajuinen { "79.9" } % ja tarkat tuotteet { "94.2" } % { "3" } m:n sisällä verrattuna lukuun { "95" } % (RTKLIB { "67.9" } % ja { "94.1" } %); tarkkojen tuotteiden ISB-ero johtuu siitä, että RTKLIB ohittaa antennipoikkeamat.

seg-5d3d4d99fbc4 = Seurantasilmukat (GNSS-SDR { "0.0.19" }): vastaavat tasolla { "35" }–{ "45" } dB-Hz; tasolla { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, kynnykset +{ "1.5" } dB; liukumisajat { "0.5" }–{ "2" } dekadia lyhyempiä.

seg-0dd24947169c = Kuun palvelualue (Orekit ja Hipparchus): { "155" } arvoa { "160" }:stä vastaa; huonoimman otoksen vaatimus ei täyty lähes singulaarisessa LNCSS B -geometriassa.

seg-74002245287f = Kvantti-inertiasensori: pelkän QPN:n lattia on { "21" }–{ "31" } % Gauguetin { "2009" } mitattua kohinaa alempi (kynnys { "30" } %, ylitetty { "0.5" } prosenttiyksiköllä).

seg-ab8b17cf325e = Oskillaattoriesiasetukset: mitatut yksilöt ylittävät rubidiumin holdoverin, cesiumin lyhytaikaisen ja CSAC:n huonoimman yksilön esiasetukset; OCXO-esiasetukselle ei ole mitattua tallennetta.

seg-81ad9b839a28 = Avaruussäätiheys: Jacchia { "1971" } on kertoimen { "2" } sisällä kiihtyvyysmittaritiheyksistä aurinkomaksimissa mutta noin 1.7x liian tiheä vuoden { "2008" } minimissä.

seg-68e5d0942847 = Geometriavapaa vinoTEC: { "33" } kaarta { "36" }:sta { "3" } TECU:n sisällä CODE-kartasta (pahin { "6.84" }).

seg-f410ce9cf195 = Harhautuksen havaitseminen ja TPL virallista JammerTest { "2024" } -lokia vastaan: { "4" } alkamishetkeä { "10" }:stä havaittiin ajoissa; TPL ylitetään { "4" }:ssä { "10" }:stä.

seg-41eb2c318469 = Kellosuodin tuoreilla IGS-kelloilla: kaksi { "11" } satelliitista ei täytä innovaatiosummakriteeriä.

seg-064b623e918b = Pienimmän neliösumman ja autoregressiivinen EOP-ennustin: UT1 { "1.73" }–2.11x Bulletin A:han verrattuna { "2" }–{ "10" } vuorokauden kohdalla.

seg-d98571cc21f4 = UTC(k):n toteutuneen poikkeaman ylärajaus: yhdistetty ylitys { "0.0333" } verrattuna lukuun { "1e-2" }.

seg-527aca91ec7c = Kuun koordinaatiston datumi kampanjasta: SPICE-haara vastaa; asemat estimoiva P2-haara ei yllä tasolle { "1e-9" } ehtoluvun 2.1e8 tehtävässä.

seg-9805c4c821f9 = Kuun koordinaatiston datumi todellisesta LLR:stä: { "15" } lukua { "16" }:sta vastaa SPICEa; z-translaation sigma on { "1.03" } % liian suuri kynnykseen { "1" } % nähden.

seg-08e6c541b59e = Paluu ilmakehään (Allen–Eggers): pistemassaratkaisu vastaa virastojen rekonstruktioita (vain ristiintarkistus); kiihtyvyysmittarivertailu on estetty, kunnes luettava Hayabusa2-lähde on saatavilla.

seg-0bb78ffbd915 = ITU-T-maskit: painetut laskuesimerkkiarvot vastaavat; G.8273.2-luokkarajoilla ei ole sellaisia (estetty).

seg-308c1bca3fd9 = Laukaisuikkunan geometria: todellisen navan paikan nopeus epookin kanssa vastaa Orekitia ({ "4.9e-8" }); oletusarvoinen epookiton nopeus ei vielä täytä kynnystä ({ "1.12e-6" }). Ei ylennetty; jatkotoimi kesken.

seg-f0b7c3d60df8 = Kaikkien kappaleiden fysikaaliset vakiot: nyt { "0" }/{ "84" } poikkeaa NAIF:sta (siirto sellaisenaan), ja laskettu orientaatio vastaa SPICEa tarkkuudella { "1.4e-10" } rad. Ei ylennetty; jatkotoimi kesken.

seg-a5a787c9a761 = Estetty omistajan rajauspäätökseen, kustakin sitoutettuna vastaava vertailu: Kuun absoluuttisten asemien havaittavuus, pintamajakan DOP, akselin ulkopuolinen vienti, ristimodaliteettisen havaitsemisen teho, yhteismuotoinen yhdenmukaisuustunnusluku ja polaarisen LEOn kattavuus.

seg-cf638ec9878b = Estetty datan vuoksi: ajansiirron virhebudjetointi (tarvitsee todellisen datan redusoinnin), JammerTestin C/N0 (antennin paikkaa ja tehojakoa ei ole dokumentoitu).

seg-e8709509eef3 = Revisiot (siirtyneet julkaistut luvut, vanha -> uusi).

seg-5e93ab237b15 = <c1/>-suojaustasot ovat nyt geodeettisella paikallistasolla radiaalisen sijaan: enintään { "0.31" } m HPL ja { "0.14" } m VPL asemalla ABMF ({ "16" } astetta N); mikään golden ei siirtynyt, mutta <c2/>-tutoriaalin tallennettu yhteenveto siirtyy keskiarvosta HPL { "22.1" } m / VPL { "40.0" } m arvoihin { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Kuun nopeuskoordinaatiston kytkennän oletukset: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } metriä kohti.

seg-8ac9cb8c5631 = Offline-oletus-EOP-ajo (<c1/>, solut luetteloitu tiedostossa <c2/>): predicted_rows { "12" } -> { "90" }; napalattia { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; tiedoston <c3/> taulukon { "2" } rivit; operatiivisen ennustimen yhtäpitävyys 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

seg-dd93329245ba = <c1/> liu22 SISRE rata/kellon kanssa: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

seg-e4205dfdb0d2 = Liun korkeustaulukko, Kshana (suhde): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = LEO-navigointisanoman <c1/>-skaala { "2" }^-60 -> { "2" }^-58 (ei ennakkorekisteröity, ilmoitettu; sovitusvertailun ulkopuolella); liu22-näytekehyksen CRC 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = <c1/>-varmennustaulukko: Liun ja ATOMICin rivi jaettu VALIDATED 22 parametrin riviin ja MODELLED ATOMICin ja viiden korkeuden riviin.

seg-537f5d80b66c = DE440:n Kuun pääakseliorientaatiorivin teksti: jakso 2024-2025 / { "731" } riviä -> 2014-2030 / { "6 209" } riviä; "katkaisee äänettömästi" -> virhe jakson ulkopuolella.

seg-17a5dd090566 = <c1/>-skenaario: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; uudet kentät inclination_deg ({ "98.19" }) ja nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (TDOP/GDOP-vertailukello on nyt näkyvissä olevan pienimmin numeroidun tähdistön kello): globaali GDOP max { "2.2236" } -> { "2.1205" }, keskiarvo { "1.122" } -> { "1.131" }, mediaani { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" } sekä solukohtainen GDOP-kartta; mean_visible_by_constellation summataan kokonaislukuina (noin { "1e-12" } suhteellisesti, näkymätön { "4" } desimaalilla).

seg-e48b212c4881 = Yhteinen yksitaajuinen GNSS-paikkaratkaisu lähetetyn ryhmäviivekorjauksen jälkeen: { "93.2" } % -> { "93.6" } % { "3" } m:n sisällä; ISB:n mediaani -0.351 -> -0.114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costas-silmukan SNR rho/4): kynnyksellä { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; tasolla { "25" } dB-Hz { "9.55" } -> { "1.60" }; tasolla { "22" } dB-Hz { "2.24" } -> -0.14.

seg-789a302679f7 = <c1/>: jokainen tuloste siirtyy Schuler-virhemallin mukana; mukana toimitetun skenaarion TRN-huippu { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = <c1/>-raportti: uusi avain geometry_path ("analytic" oletusajossa, mikään numeerinen arvo ei muuttunut); uudet valinnaiset kentät planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path, kernel-polulla epoch_partials; lajin kuvaus on kirjoitettu uudelleen. Varmennusrivin kernel-polun oraakkeli on SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) muuttuu kernel-evaluoinnin ristiintarkistukseksi.

seg-3631a31e7b26 = Kappalevakiot: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptune { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); Phoboksen päiväntasaajasäde { "13.1" } -> { "13.0" } km; Phoboksen ja Deimoksen napa ja nollameridiaani pck00011:stä; aurinkokunnan prime_meridian_deg sisältää nyt toisen asteen ja jaksolliset termit.

seg-ac1251d7a0fd = <c1/> (<c2/> Europalla), Europan täydestä pck00011-orientaatiosta (7cfd66b4; orientaatio vastaa SPICEn pxformia tarkkuudella { "1.4e-10" } rad), joka siirtää laskeutujaa inertiaalitilassa: saatavuus pelkät releet / Maan etäisyyden kanssa { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } / { "171" } epookista pelkät releet), PDOP:n mediaani { "5.266" } -> { "5.360" }, paikkaratkaisun RMS-virhe { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, formaalin sigman mediaani { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tiedoston <c3/> taulukko ja tiedoston <c4/> kiinnitys seuraavat; <c5/> ei muutu.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), kalibroitu kerroin korvattu Jacchia { "1971" }:llä: activity_density_kg_m3 korkeuksilla 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k poistettu, mean_exospheric_temperature_k lisätty ({ "1186.7" } K); <c2/>: { "800" } km:n aurinkosyklin heilahdus on nyt 10.4x (NRLMSISE-00 13.6x) ja korkeusväite seuraa NRLMSISEn nousua korkeuteen { "500" } km ja laskua korkeudella { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (yhteenvetoteksti ennallaan { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (QR-ratkaisu): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> kirjoitettu uudelleen yllä olevia uusia ja poistettuja kenttiä varten.

seg-717c51e1cca0 = Validointipaketit

seg-4ec44f8a5f8e = D12, laajennettu tarkkuus ja neliöjuuriratkaisija (kaksi uutta VALIDATED-riviä: { "226" } -> { "228" } riviä, { "110" } -> { "112" } validoitua).

seg-d28005966948 = Osa { "1" }, laajennetun tarkkuuden oraakkeli:

seg-9a5f94973450 = Kuun koordinaatiston datumi asemat estimoituna: 50-numeroinen mpmath-laajennetun tarkkuuden oraakkeli (ennakkorekisteröity 804662d5, ehtoluvulla skaalatut kynnykset a priori -taaksepäinvirhekaavasta) vastaa uutena kampanjapäivänä (2026-03-18) ja alkuperäisessä 2024-01-01-skenaariossa; uusi VALIDATED-rivi tasolla P2. Se ratkaisee aiemman kaksoistarkkuuden kiistan: moottorin datumisigmat poikkeavat enintään { "9.7e-6" }, NumPyn käänteis- ja ominaisarvoreitit enintään { "6.2e-6" }, ja sen Cholesky- ja QR-reitit noin { "1e-8" }. Moottori on virherajansa sisällä mutta noin tuhat kertaa epätarkempi kuin faktorointireitti.

seg-b055435a2138 = Oraakkeliympäristö: mpmath { "1.3.0" } lisätty.

seg-d0c2b2a8e635 = Revisiot: ei yhtään. Mikään golden-tiedosto tai julkaistu luku ei muutu; rivi "Kuun koordinaatiston datumi havaintokampanjasta" pysyy MODELLED-tasolla (perustajan päätös 2026-10-02, vaihtoehto A: se ei lainaa erillisen rivin tilaa); sen testiteksti viittaa uuteen testiin ja sen löydökseen.

seg-50b53908fb7c = Osa { "2" }, neliöjuuri-informaatiodatumiratkaisija:

seg-4c6089cfac5e = Uusi valinnainen neliöjuuri-informaatioratkaisija (<c1/>; <c2/> lunar-frame-campaign-skenaariossa): Householder-QR, marginalisointi kolmiotekijän kautta, Jacobin SVD spektrille ja kompensoidut tulot vain oikein pyöristetyistä operaatioista. 50-numeroista oraakkelia vastaan (ennakkorekisteröity b41908c9) sen datumisigmat vastaavat { "3e-13" }:n tarkkuudella uutena päivänä (2026-06-09); päivien 2026-03-18 ja 2024-01-01 syötteillä oletusratkaisija poikkeaa enintään { "1e-5" }. Uusi VALIDATED-rivi tasolla P2. Oletusratkaisija ja sen tuloste eivät muutu. Ennakkorekisteröidyt kynnykset osoittavat luotettavasti virheet vasta noin { "2e-7" } suhteellisen tason yläpuolella: ne hylkäävät oletusratkaisijan mutta eivät käännettyä Householder-merkkiä, kompensoimatonta pistetuloa tai spektristä loppukäänteistä, ja rivi sanoo sen.

seg-de9aeb2adde0 = Valinnaiset neliöjuurireitit muuttumattomien oletusten rinnalla: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> ja <c6/>, uusilla <c7/> ja <c8/>. Jokainen vastaa oletustaan, missä molemmat ovat tarkkoja (sisäinen tarkistus, ei riviä; niille ei väitetä validointia). <c9/> delegoi nyt jaetulle rutiinille; sen tuloste ja jokaisen skenaarion oletustuloste ovat ennallaan.

seg-87a632404f32 = Kuun koordinaatiston kampanjan astepäätökset: ennakkorekisteröity laajennetun tarkkuuden tarkistus { "40" } päivälle vahvistaa jokaisen ratkaistavissa olevan asemalohkon ja täysiasteisen Helmert-päätöksen. A priori -raja ei voi varmentaa { "20" } asteeltaan vajaata Helmert-päivää; tarkassa aritmetiikassa niiden vajaus on geometrinen, ja { "1e-9" } kynnys on kampanjan ominaisarvosuhteiden luonnollisella vaihteluvälillä. Ei riviä.

seg-3b24e7fa36bf = Laajennetun tarkkuuden kampanjarivin väite rajataan muotoon "pahimman tapauksen rajan sisällä", ja sen asemat kiinteinä -heikoimman suunnan tarkistus mittaa nyt todellisen kulman ({ "6.6e-16" } rad; vertailija vaihdettiin funktiosta acos jänteeseen, kynnys ei muuttunut).

seg-4fad02ab4b6d = Revisiot: ei yhtään. Mikään golden-tiedosto tai julkaistu luku ei muutu; rivi "Kuun koordinaatiston datumi havaintokampanjasta" on ennallaan ja pysyy MODELLED-tasolla (perustajan päätös 2026-10-02, vaihtoehto A).

seg-627d3357d620 = D4, JPL:n kernel-efemeridirunko, vaihe { "1" } (neljä uutta VALIDATED-riviä: { "228" } -> { "232" } riviä, { "112" } -> { "116" } validoitua).

seg-30e8a645191f = NAIF-kernelin lukijalla on oma rivinsä.

seg-98ff121aa2a9 = <c1/> (DAF-säiliö, SPK-tyyppi { "2" }, binäärinen PCK-tyyppi { "2" }) vastaa SPICE Toolkitia (CSPICE N0067 spiceypyn { "8.2.0" } kautta) ja ANISE { "0.10.6" }:ää kaikissa { "600" } DE440-tilassa ja { "200" } Kuun orientaatiorotaatiossa satunnaisessa ruudukossa, joka on arvottu ennakkorekisteröintikommitin oman tiivisteen (abcd9133) perusteella, kynnysten sisällä, jotka johdettiin etukäteen kaksoistarkkuuden Chebyshev-evaluoinnista (pahin { "0.6" } % kynnyksestä, { "1.95e-3" } m). Rivi väittää, että moottori lukee JPL-kernelit oikein, ei että DE440 tai analyyttinen sarja olisi tarkka (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: DE440:n (tai minkä tahansa tyypin 2 SPK:n) paikat moottorin oman lukijan kautta, kaksiosaisilla TDB-epookeilla ja kernelin SHA-256 talletettuna raportteja varten; se ei koskaan korvaa planeettaa järjestelmän barycentrellä. <c2/> antaa geometriapolun valita analyyttisen sarjan (oletus) tai kernelin.

seg-6c7dae98601e = <b>Valinnainen kernel-Kuu kohteille <c1/> ja <c2/></b>: avain <c3/> lukee geosentrisen Kuun keskipisteen kernelistä; muu ei muutu, ja raportti saa <c4/>-lohkon, joka nimeää kernelin ja sen SHA-256:n. Ilman avainta molemmat raportit ovat tavu tavulta samat kuin ennen.

seg-74e8def84747 = <b>Kuun pintapisteen kovarianssi kernel-polulla</b> (uusi VALIDATED-rivi): kun jokainen asema on kiinteä ja majakka DE440:n Kuussa, majakan kovarianssi vastaa SPICEn valoaikaa koskevaa Jacobin matriisia (pahin { "1.7e-3" } kynnyksellä { "1" } %) ja NumPyn käänteismatriisia ({ "4e-14" } kynnyksellä { "1e-9" }), ennakkorekisteröity 4a51256 (<c1/>). Analyyttisen polun rivi pysyy MODELLED-tasolla: analyyttisellä Kuulla pienin majakan sigma on { "3.9" } % oraakkelia pienempi.

seg-55002d236ab0 = <b>Kuun koordinaatiston datumi todellisesta kampanjasta, kernel-Kuun keskipiste</b> (uusi VALIDATED-rivi): { "447" } näkemättömällä 2019-Q2-normaalipisteellä, ennakkorekisteröity 830d945a ennen kuin yhtään pistettä haettiin, datumin kovarianssi kernel-polulla vastaa muuttumatonta SPICE- ja NumPy-oraakkelia { "7.6e-5" }:n sisällä kynnyksillä { "1" } % ja { "2" } % (<c1/>). Perustaja päätti, että tämä rivi ylennetään vain tuoreilla pisteillä; nähdyn datan diagnostiikka (c51f8b2) on löydös, ei todiste. Kynnys ei erottele Kuun malleja: analyyttinenkin Kuu läpäisee saman osajoukon (pahin { "3.8e-3" }), suunniteltua mutaatiota (kernel-Kuu tunnin myöhässä) ei havaittu, ja taitekohdassa noin { "4,650" } km väärä Kuun keskipiste (Kuu otettuna Maan ja Kuun barycentren ympäri) läpäisi myös. Rivi väittää kovarianssin kyseisellä polulla, ei Kuun keskipistettä, ja sanoo sen.

seg-f147f9257b8b = <b>Auringon, Kuun, Merkuriuksen ja Venuksen paikat DE440:stä UTC-epookeilla</b> (uusi VALIDATED-rivi): <c1/> vastaa Skyfieldiä { "1.54" } { "600" } paikalla vuosien { "1973" } ja { "2026" } välillä, pahin { "2.96" } m, ennakkorekisteröidyn kynnyksen (0bfafe6d) sisällä, jonka asettaa kaksitermisen TDB − TT -sarjan (<c2/>). Planeettojen paikat saavat tämän uuden kernel-rivin nyt; Standish-rivi ja planeettakuiden rivi ovat ennallaan, ja kuut odottavat skenaariota, joka tarvitsee niitä (perustajan päätös).

seg-bb840641c655 = Löydökset: LLR-datumivertailun ainoa ohitus (z-translaation sigma { "1.025" } % kynnyksellä { "1" } %) putoaa arvoon { "0.049" } %, kun vain Kuun keskipiste luetaan DE440:stä, nähdyllä datalla (<c1/>); tuoreella { "2019" } osajoukolla analyyttinen Kuu läpäisee myös, joten vuoden { "2015" } ohitus oli marginaalinen kyseisen neljänneksen geometrialle. Analyyttiset rivit "Kuun koordinaatiston datumi TODELLISESTA havaintokampanjasta" ja "Kuun pintapisteen koordinaattikovarianssi … erillään Maan asemasta" pysyvät MODELLED-tasolla; niiden oraakkelitekstit osoittavat nyt kernel-polun riveihin.

seg-64c9f3b96392 = <c1/> ei enää sano, ettei moottorilla ole binäärikernelin lukijaa; se osoittaa lukijan riviin ja selittää, miksi avaruusalusten kernelit (tyypit { "13" } ja { "21" }) tulevat edelleen Horizonsin kautta.

seg-841deceb80e6 = Revisiot: ei yhtään. Mikään golden-tiedosto, julkaistu luku tai olemassa olevan testin arvo ei muutu; analyyttiset <c1/>-, <c2/>- ja kaikki asemat kiinteinä -<c3/>-raportit ovat tavu tavulta samat kuin ennen (tuloksen SHA-256-etuliitteet 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, mitattu kellokirjasto "Clock Atlas" (kolme uutta riviä, yksi VALIDATED: { "232" } -> { "235" } riviä, { "116" } -> { "117" } validoitua).

seg-1f8644486f5d = <b>Mitattu kellokirjasto (<c1/>).</b> Laitekortit (valkoinen vaihe, valkoinen, flicker- ja random-walk-taajuusmodulaatio, lineaarinen taajuusajautuma ja valinnaisesti kerran–neljä kertaa kierrosta kohti -vaihetermit) sovitettuina nimettyyn mitattuun kellotallenteeseen ja pisteytettyinä pidätetyllä datalla; aukkotietoiset Allanin ja Hadamardin varianssit; ehdollistusilmaisin, joka kirjaa jokaisen aukon, vaihepoikkeaman, vaihehypyn, purskeen ja taajuushypyn eikä tiedä mitään tiedosto- tai vuorokausirajoista; kortin muunnos paikka-ajoituksen kohinamalliksi, laajennetuksi Kalman-kellomalliksi ja harhautusvalvonnan kohinatasoiksi. Lukijat RINEX- ja IGS-kellotiedostoille, BIPM:n laboratoriokohtaisille tiedostoille ja Circular T:n osalle { "1" } (<c2/>); UTC(k):n yhdistetty hierarkkinen ikääntymisraja (<c3/>, ei vielä pisteytetty).

seg-93add052ae56 = <b>Viive-1-autokorrelaatiokohinan tunnistus</b> (<c1/>, Riley ja Greenhall { "2004" }), uusi VALIDATED-rivi (Kirjasto): vastaa allantoolsia { "2024.6" } <c2/> { "140" } tapauksessa, kokonaisluvut identtiset, pahin ero { "9.6e-13" } kynnyksellä { "1e-9" } (ennakkorekisteröity 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Mitatut laitekortit pidätetyllä ennusteella</b>, uusi MODELLED-rivi (löydös): sovitus yhdellä kolmanneksella, kahden muun kolmanneksen Allanin poikkeaman ennuste kertoimen { "1.5" } sisällä (ennakkorekisteröity 2ec76864). GPS Block IIF tuoreessa IGS-ikkunassa (2026-03-01–{ "14" }): { "10" }/{ "11" }; G27 on optimistinen kahden tunnin skaalalla (pahin kerroin { "1.510" }). Cesium (sisällä, { "1.070" }), OCXO (ulkopuolella, { "2.348" }) ja strontium (sisällä) raportoidaan, ei sokkona. JammerTest-vastaanottimen kortti sekä Galileon maserin ja Deep Space Atomic Clockin kortit ovat estetty. ZED-F9P-vastaanottimen TCXO-mallilaji { "12" } staattisella Wroclawin asemalla (Zenodo { "6488497" }) ei täytä kynnystä: { "1" }/{ "11" } sokea asema ilmoitetussa korjatussa uusintaajossa (<c1/>, <c2/>).

seg-26fa898f6272 = <b>GPS Block IIF -kortit kierroskohtaisilla termeillä</b>, uusi MODELLED-rivi (löydös): toisessa tuoreessa ikkunassa (2026-04-01–{ "14" }) { "9" }/{ "11" } kynnyksen sisällä; G03 ({ "1.947" }) ja G25 ({ "1.581" }) ovat optimistisia, koska niiden pidätetyt tallenteet ovat kohinaisempia kuin niiden sovituskolmannekset; jaksollisten termien pudottaminen epäonnistuu kaikilla { "11" } (ennakkorekisteröity fb475550; <c1/>).

seg-ef456da29319 = <b>M002, kellotilan estimointi aluksella, kierros { "3" }</b> (löydös, pysyy MODELLED-tasolla): jäädytetyn ehdollistusilmaisimen jälkeen kierroksen 2 laajennettu suodin, viritys ja kriteerit muuttumattomina täyttävät (a) ja (c) kaikilla { "11" } satelliitilla ensimmäistä kertaa; (b) ei täyty G09:llä ({ "0.894" }) ja G26:lla ({ "0.876" }) (ennakkorekisteröity fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, harhautuksen havaitseminen, kierrokset { "3" }–4b</b> (pysyy MODELLED-tasolla): kierros { "3" } estynyt ({ "167" } harjoitusepookkia JammerTest-yksikön muista sessioista vaaditun { "3600" } sijaan); ZED-F9P-mallilajikortilla (kierrokset { "4" } ja 4b) kellovalvonta antaa nolla ennen alkua tulevaa väärää hälytystä kaikilla { "10" } kirjatulla alkamishetkellä (kierros { "2" }: { "86" }) ja { "6" }/{ "10" } alkamishetkestä havaitaan { "10" } s:n sisällä (kierros { "2" }: { "4" }); samat neljä jäävät edelleen myöhäisiksi (<c1/>).

seg-79757abc69e3 = <b>M083, UTC(k):n ylärajaus, kierros { "3" }</b>: ennakkorekisteröity ennakoivasti (fb475550) Circular T -numeroille alkaen { "465" }, ei vielä ajettu (<c1/>).

seg-09abf996ed16 = Oraakkeliympäristö: Wroclawin ZED-F9P-tallenne on datalukittu kohteessa <c1/> (CC BY { "4.0" }, noin { "1.5" } GB); IGS-kellofixturet on mukana toimituksessa (IGS-tuotteet, lähdeviittauksella).

seg-b05fa0811a3e = Revisiot: ei yhtään. Mikään golden-tiedosto, julkaistu luku tai olemassa olevan testin arvo ei muutu; M001:een (holdoverin uudelleenankkurointi) ei ryhdytä toimiin, koska mikään kelloluokka ei ylennetty.

seg-986f4075210b = D8, yksi validoitu propagointi-, koordinaatisto- ja aikapolku (kolme uutta VALIDATED-riviä ja M131 ylennetty: { "235" } -> { "238" } riviä, validoituja { "117" } -> { "121" }).

seg-d7a612528765 = Maan kiertoratalajit, joilla oli omat kahden kappaleen, sekulaarin J2:n tai pelkän sideraaliajan mallinsa, jakavat nyt yhden polun: SGP4/SDP4-elementtijoukot kaksiosaisilla juliaanisilla päivämäärillä, vietynä GCRS:ään ja ITRS:ään (International Terrestrial Reference System) IAU:n (International Astronomical Union) 2006/2000A-ketjun kautta, valinnaisilla Maan orientaatioparametreilla.

seg-016507ccdb8f = Uudet <c1/>, <c2/>, <c3/>, <c4/> ja <c5/>; <c6/> ja <c7/> ottavat kaksiosaiset epookit. Uudet <c8/> (SOFAn <c9/>-konventio karkaussekuntipäiville), <c10/>, <c11/>, <c12/> (TAI:n kautta, kuten SOFAn <c13/>), <c14/> ja kaksiosainen <c15/>.

seg-158c39fff817 = Tilan <c1/> polaarimoodi propagoi SGP4:llä hetkellä 2026-01-01T00:{ "00" }:{ "00" } UTC IAU-ketjussa (<c2/> ottaa minkä tahansa epookin); SGP4-Walker-generaattori kiertää Maahan kiinnitettyyn koordinaatistoon IAU-ketjun kautta.

seg-86ecad91a601 = Laji <c1/> ajaa uutta näennäisen ylilennon ennustinta (<c2/>, <c3/>): SGP4 IAU-ketjussa, ITU-R P.834-9 -refraktio ja alalinkin valoaika (uudet <c4/>- ja <c5/>-kytkimet, oletuksena päällä), Maan orientaatioparametrit (<c6/>, <c7/>, <c8/>, oletus { "0" }), ylitykset ratkaistu { "1e-7" } s:n tarkkuudella ja kulminaatio kultaisen leikkauksen haulla. Geometrinen <c9/> ei muutu.

seg-9ce091899bf1 = <c1/> estää paketin geometria-, aika- ja propagointiytimiä sisältämästä yksityistä Kepler-propagointia, sekulaareja J2-nopeuksia tai pelkkää sideraaliaikaa käyttävää rotaatiota; nimetyt nopeat tasot ja fysiikka, joka on rivin aihe, ovat perusteltuja poikkeuksia.

seg-cf4ae964c5d1 = Uusi VALIDATED-rivi "Kaksiosaiset juliaaniset päivämäärät ja karkaussekunnit Maan kiertoradan aikapolulla": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> { "224" } hetkellä kaikkien { "27" } karkaussekunnin ympärillä { "1e-6" } s:n sisällä (ennakkorekisteröity e947e69d); pahin { "1.9e-11" } s.

seg-c0dec16ea932 = Uusi VALIDATED-rivi "Yksi Maan kiertoradan polku": { "232" } elementtijoukon TEME-paikat python-sgp4 { "2.24" }:ää (Vallanon vertailu-SGP4) vastaan { "6.1e-8" } m:n sisällä (kynnys { "1" } cm) sekä GCRS -> ITRS- ja TEME -> ITRS-rotaatiot ERFAa vastaan: <c1/>, <c2/> ja <c3/> { "2.9e-6" } mas:n ja { "0.41" } mas:n sisällä (kynnykset { "0.1" } ja { "2" } mas), Maan orientaatioparametreilla (ennakkorekisteröity 72ea9eb0). Ilmoitettu: ensimmäinen ajo epäonnistui hetkellä 2016-12-31T23:{ "59" }:{ "59.5" } yhden sekunnin rotaatiolla; UT1 otettiin UTC:n kvasijuliaanisesta päivämäärästä karkaussekuntipäivänä, moottori kulkee nyt TAI:n kautta, ja toinen ajo vastaa muuttumattomilla kynnyksillä.

seg-a72ccdc2516e = M131 "LEO:n kattavuus ja tarkkuuden heikkenemiskerroin polaarisille ja arktisille käyttäjille MEO GNSS:ään verrattuna" muuttuu VALIDATED-tasoiseksi: Orekit { "13.1.8" } ottaa moottorin GCRS-tilat, kiertää ne ja laskee näkyvyyden ja DOP:n (NumPy usean kellon ryhmille); paikat { "6.8e-5" } m:n sisällä (kynnys { "0.2" } m), näkyvien lukumäärät identtiset 4040/4040 otoksessa, DOP:n mediaani { "2.3e-11" } suhteellisesti sisällä.

seg-db498ac8e135 = Uusi VALIDATED-rivi "Maa-aseman näennäisen ylilennon ennuste refraktiolla ja valoajalla": Orekit { "13.1.8" } propagoi samat elementtijoukot itse rakentamassaan TEMEssä ilmoitetun määritelmän mukaan, ITU-R P.834 -refraktiolla ja sen valoajan mittausmallilla, { "60" } tapauksessa merenpinnan tasolla olevilla asemilla: { "1210" } ylilentoa, ylitykset { "3.4e-6" } s:n sisällä (kynnys { "5" } ms), maksimikorkeuskulma { "5.5e-7" } asteen sisällä, näennäinen suunta { "8.8e-7" } asteen sisällä (kynnys { "1e-4" } astetta).

seg-ab87bb0ee63d = Löydökset, pidetty kiinnitettynä: ensimmäiset koko väitteen vertailut Orekitiin päästä päähän ohittivat paikka- ja suuntakynnyksensä, ei moottorin vuoksi vaan koska Orekit { "13.1.8" }:n SDP4 poikkeaa vertailu-SGP4:stä pyöreillä (e = { "0" }) syvän avaruuden radoilla (enintään { "67" } m) ja sen oletus-TEME on rakennettu IERS { "1996" } (IAU { "1980" }) -nutaatiolle, noin { "72" } millikaarisekuntia IAU 2006/2000A -ketjusta ({ "2.7" } m LEO:ssa). Orekitin ITU-R P.834 -kerroin termille h*theta0^{ "2" } on { "0.011380" }, kun suositus painaa { "0.01380" }; vertailu tehdään merenpinnan tasolla, jossa termi katoaa, ja ero sen yläpuolella on kiinnitetty.

seg-49978e6a73b2 = "Maa-aseman ylilentoennuste (maasegmentti)" pysyy VALIDATED-tasoisena, väite rajattuna geometriseen <c1/>-polkuun; laji <c2/> kuuluu uudelle riville.

seg-60d6ac0011f1 = Oraakkeliympäristö: Orekit { "13.1.8" } ja Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Revisiot: mukana toimitettu <c1/> kokonaissaatavuus { "1675" } s -> { "1659" } s (viisi ylilentoa kuten ennen; paras maksimikorkeuskulma { "73.25" } astetta -> { "70.08" } astetta), ja jokainen <c2/>-tuloste siirtyy uuden polun mukana (tiedoston <c3/> painettu rivi ja tiedoston <c5/> merkintä <c4/> kertovat sen nyt); mukana toimitettu <c6/> GNSS VDOP päiväntasaajalla { "1.19669" } -> { "1.19710" }, { "89.9" } asteessa { "1.50645" } -> { "1.50590" }, yhdistetty VDOP { "89.9" } asteessa { "1.14388" } -> { "1.14250" } (julkaistut kahden desimaalin luvut { "1.20" }, { "1.51" } ja { "1.14" } ovat ennallaan). Mikään golden-tiedosto ei muutu.

seg-b65f3186a7e9 = Ei vielä reititetty: <c1/>, doppler-, joint- ja timing-tilat kohteessa <c2/> ja <c3/>-totuusrata (niiden mallit ovat kohteissa <c4/> ja <c5/>) sekä Maan mallit kohteessa <c6/> (nimetty kahden kappaleen nopea taso).

seg-03f638f20376 = D6, LunaNet AFS -vertailugeneraattori, LSIS V1.0 (neljä uutta riviä, kaksi VALIDATED: { "238" } -> { "242" } riviä, validoituja { "121" } -> { "123" }).

seg-1d09f0582781 = <b>LunaNet Augmented Forward Signal (AFS) -vertailugeneraattori</b> (<c1/>), kiinnitetty LunaNet Signal-In-Space Recommended Standardin (LSIS) V1.0:aan päivämäärältä { "29" } January { "2025" } ja nimeää tämän version jokaisessa tulosteessa: { "2492.028" } MHz:n kantoaalto; AFS-I BPSK({ "1" }) -datakanava { "500" } symbolilla sekunnissa ja sen 2046 chipin Gold-koodi; AFS-Q BPSK({ "5" }) -pilotti sen 10230 chipin Weil-primäärikoodilla, 4 chipin sekundäärikoodilla ja 1500 chipin tertiäärikoodilla; kehystunniste { "0" } -kehys (synkronointikuvio, BCH ({ "51" }, { "8" }) -alikehys { "1" }, CRC-24, puolen koodinopeuden LDPC-alikehykset { "2" }–{ "4" }, { "60" } x { "98" } -lohkolomittaja) tyhjentävällä alikehyksen 1 dekooderilla ja pelkästä pariteettitarkistusmatriisista kirjoitetulla min-sum-LDPC-dekooderilla; sekä kantataajuinen IQ-synteesi totuusmerkinnöin kirjoitettuna SigMF-tallenteeksi. Koodit generoidaan standardin siirtorekistereistä ja Legendre/Weil-konstruktioista. Mitään standardista kopioitua ei levitetä edelleen (siinä ei ole uudelleenkäyttöehtoja): AFS-Q:n primääri-indeksit tulevat IS-GPS-800J:stä, ja se, mikä määritellään vain standardin liitteissä (AFS-I G2 -viiveet, tertiäärikoodit, LDPC-aliatriisit), luetaan ajon aikana paikallisesta välimuistista, jonka <c2/> täyttää NASAn isännöimästä PDF:stä, jokainen tiedosto tarkistettuna kiinnitettyä SHA-256:ta vastaan (<c3/>). Malli on standardinmukaisuuden vertailugeneraattori, ei kanava-, etenemis- tai linkkibudjettimalli.

seg-7b8cb0461377 = <c1/> ja <c2/>: tallenne voi sisältää nimiavaruudellisia laajennuskenttiä, jotka on ilmoitettu kohteessa <c3/>.

seg-a9465820a1fc = Uusi VALIDATED-rivi "LunaNet AFS:n kantataajuinen renderöinti riippumatonta generaattoria vastaan sen kanavatilan perusteella": LANS-AFS-SIMiä vastaan (BSD-2-Clause, commit 480c6bf3, S-kaistan build) nolla chip-eroa PRN-koodeissa { "1" }–{ "210" }, nolla symbolieroa ajon kolmessa kehyksessä ja normalisoitu kompleksikorrelaatio { "0.999990" } oman { "23.9" } s:n näytteistön yli (huonoin { "2" } ms:n lohko { "0.999948" }), ennen vertailua asetettujen kynnysten sisällä (ennakkorekisteröity 986ac280). Se ohjaa renderöijää simulaattorin omalla kanavatilalla eikä kata tehonjakoa kantoaalto-kohinatiheydestä eikä SigMF- ja 8-bittistä kirjoitusta.

seg-07edced2764a = Uusi VALIDATED-rivi "LunaNet AFS:n kehyksen kanavakoodaus, FID { "0" }": 6000 symbolin kehykset ovat symboli symbolilta samat kuin LANS-AFS-SIMin (ennakkorekisteröity 986ac280); alikehyksen 1 koodi toistaa LSIS:n kuvan { "8" } laskuesimerkin ja CRC-24 CRC-24/LTE-A-luettelon tarkistusarvon.

seg-ab94ac9f41fc = Molemmat ylennetyt rivit ovat datalukittuja LSIS-välimuistiin: niiden oraakkelitesti ohitetaan ilmoituksella, kunnes <c1/> on ajettu.

seg-89a4bc4a766e = Löydös (uusi MODELLED-rivi), "LunaNet AFS:n levityskoodien generointi": { "2 937 232" } generoidusta chipistä ja bitistä, joita verrattiin standardin taulukoihin ja liitteen { "3" } tiedostoihin, yksi poikkeaa: taulukon E-5 tertiääriselle PRN { "147" }:lle painamat "viimeiset { "24" } chipiä", jotka kopioivat PRN { "151" }:n solun, kun taas standardin oma liitteen { "3" } tiedosto vastaa generaattoria. Nollapoikkeaman kriteeri ei täyty.

seg-d4e76301323f = Löydös (uusi MODELLED-rivi), "LunaNet AFS:n suljetun silmukan dekoodattavuus": kolme ennakkorekisteröityä ajoa PocketSDR-AFS:ää vastaan; kolmas täytti seuranta- ja dekoodauskynnyksensä täysin mutta ei suojaehtoaan, että vain tulostava vastaanotinbuild toistaa kiinnitetyn buildin lokin, koska kaksi muokkaamattoman vastaanottimen ajoa poikkeavat jo hankintatietueissaan.

seg-93cfa05a1923 = Korjattu: kohteiden <c1/> (<c2/>), <c3/> ja <c4/> oletuskantoaalto oli pyöristetty { "2.4" } GHz; se on nyt LSIS-020 AFS -kantoaalto, { "2492.028" } MHz. Vanhalla oletuksella vapaan tilan vaimennus aliarvioitiin { "0.327" } dB.

seg-ed7c170ccc2c = Revisiot: ei yhtään. Jokainen mukana toimitettu skenaario nimeää kantoaaltonsa, ja kaikkien { "138" } skenaariotiedoston tulokset ovat tavu tavulta samat kuin edellisellä main-haaralla.

seg-3ec7f5b17122 = D7, todellinen Kuun IQ ja GPS LNAV (seitsemän uutta riviä, yksikään ei VALIDATED: { "242" } -> { "249" } riviä, validoituja { "123" } ennallaan).

seg-0c3dcf4f2b0f = <c1/>: sekaradiksinen pikafourier-muunnos (FFT), jonka tuloste on samat bitit jokaisella alustalla; 8000- ja 24000-pisteisten muunnosten SHA-256-kiinnitys läpäisee x86_64:llä ja wasm32-wasip1:llä (ajuri kohteessa <c2/>).

seg-150d9809c584 = <c1/>: rinnakkainen koodivaiheen haku näytteistetyllä IQ:lla (<c2/>, <c3/>) koherentilla laskostuksella, epäkoherentilla akkumuloinnilla, khii-toiseen-kynnyksellä koko haun väärän hälytyksen todennäköisyydelle ja solukeskiarvotilastolla kaistarajoitetulle kohinalle; <c4/>, <c5/> koodi-Dopplerilla sekä M2M4- ja ruudukon huippuun perustuvat kantoaalto-kohinatiheyden (C/N0) estimaattorit.

seg-46bda8ecf2cd = <c1/>: IS-GPS-200:n legacy-navigointisanoman (LNAV) kooderi alikehyksille { "1" }–{ "3" } taulukon 20-XIV pariteetilla ja kenttädekooderilla.

seg-43444792974c = <c1/>: lukija ION GNSS SDR Metadata Standardille (<c2/>) ja sen näytetiedostoille, ja <c3/> kahden komplementin tasoille.

seg-a7dfc3475923 = <c1/>: LuGRE-vastaanottimen (Lunar GNSS Receiver Experiment) IQS-erän otsikko, RAW-, ACQ- ja NAV-telemetria sekä CLK-tiedostot, ja tarkistus, joka luettelee, missä <c2/>-metadata on ristiriidassa binääriotsikon kanssa.

seg-f0125531c4f8 = <c1/> ja kohteessa <c2/> yaw-ohjattu runkokoordinaatisto, lähetysatsimuutti ja nadiirista poikkeamakulmat sekä <c3/> suhteelliselle C/N0:lle mitatuilla keilakuvioilla.

seg-679aa02de1d0 = GPS LNAV -navigointisanoman koodaus (uusi rivi, pysyy MODELLED-tasolla integraattorin jälkitarkistuksen jälkeen): { "2" } March { "2025" } IGS-lähetystiedostolla, RTKLIB v2.4.2-p13:n jäsentämänä ja dekoodaamana, kaikki { "960" } sanaa läpäisevät pariteetin, kaikki { "96" } alikehystä dekoodautuvat ja kaikki { "608" } lähetettyä kokonaislukua vastaavat Kshanan lukuja (<c1/>), mutta ennakkorekisteröinti (d4d9eb9d) saapui julkiseen haaraan kaksi sekuntia tuloksen sisältävän commitin jälkeen, joten järjestystä "rekisteröity ennen tiedoston hakua" ei voida osoittaa eikä riviä ylennetä.

seg-2875ba2d8f5f = <c1/> täyttää sanat merkitsevimmästä bitistä alkaen (I korkeassa nibblessä LuGRE-tavussa; aiempi luenta tuotti konjugaattisignaalin), säilyttää vanhan luennan nimellä <c2/> ja lukee sanaa leveämpiä näytteitä.

seg-f6e0e3b9b166 = <c1/>: vaihekoherentti Dopplerin tarkennus ({ "0.2" } Hz RMS tasolla { "30" } dB-Hz { "200" } ms:n yli simulaatiossa).

seg-b0f6a61acce0 = GPS L1 C/A gps-sdr-simiä vastaan: chipit ja pariteettibitti bittitarkasti; { "230" }/{ "1152" } LNAV-kentästä poikkeaa yhdellä yksiköllä, koska gps-sdr-sim katkaisee, missä lähetetty kokonaisluku vaatii pyöristyksen.

seg-1c525ca495c0 = LNAV RTKLIBillä dekoodattuna: kaikki pariteetit ja alikehykset läpäisevät ja jokainen parametri on puolen kvantin sisällä; { "41" } skaalattua arvoa poikkeaa muutamalla viimeisen numeron yksiköllä RTKLIBin desimaalisen { "2" }^-43-vakion kautta, rekisteröidyn kynnyksen yläpuolella.

seg-14e26e69777b = LuGRE-hankinta GNSS-SDR { "0.0.19" }:ää vastaan: { "266" }/{ "266" } päätöstä vastaa, { "250" } sijoittuu samaan soluun; useimmat positiiviset ovat artefakteja paljaiden 4-bittisten tasojen −{ "0.5" } keskiarvosta; C/N0-haaralla ei ollut samanaikaista lentodataa. Kaksi erää (OP5, OP12) jätettiin virheellisesti pois: niiden metadata vastaa niiden otsikoita, mutta lukija ei tuolloin voinut lukea sanaa leveämpää näytettä.

seg-3a32ff9d66fc = LuGRE-hankinta kiertoradalta ennustettua Doppleria vastaan: näytetehopäätöksellä jokainen haku ylittää kynnyksen kaistarajoitetulla kohinalla; solukeskiarvopäätöksellä vahvimmat parit vastaavat suuruudeltaan käänteisellä etumerkillä, mikä osoittaa rekisteröidyn I/Q-järjestyksen olevan datan konjugaatti.

seg-2bb618ba4059 = Sokea hankinta Kuun pinnan erissä: neljä erää hankkii kukin yhden satelliitin (ennustettu näkyväksi, ei väärää hälytystä tasolla { "1e-7" }), yksikään ei kahta, joten Doppler-erokynnyksellä ei ole pisteytettävää paria.

seg-f95606e17fd1 = Suhteellinen C/N0 Kuun etäisyydellä (M039 uudelleenmuotoiltuna): { "15" } Block IIR/IIR-M -tallennetta ja yksi pari, liian vähän rekisteröidylle kynnykselle.

seg-9306cf44fc44 = Revisiot: ei yhtään; mikään julkaistu luku, golden-tiedosto tai dokumentaation luku ei muuttunut.

seg-2a3cb68c94d6 = M039-rivi "Maan GNSS Kuun etäisyydellä" muotoilee väitteensä Kuun etäisyydellä uudelleen satelliittien väliseksi suhteelliseksi C/N0:ksi yhtenä epookkina sekä näkyvyydeksi (absoluuttista C/N0:aa ei väitetä); se pysyy MODELLED-tasolla. Ylimmän tason NOTICE sisältää LuGREn CC BY { "4.0" } -lähdeviittauksen.

seg-e1e4094a186a = DE440:n Kuun pääakseliorientaatio interpoloidaan nyt geodeettisesti päivittäisten solmujen välillä. Aiempi alkiokohtainen interpolointi oli virheellinen enintään { "2.0e-4" } rad ({ "340" } m Kuun pinnalla) kunkin päivän neljännespisteiden lähellä, ei "noin { "14" } m", kuten rivi väitti. Sen käyttäjät (Kuun laseretäisyysmittauksen geometria, Kuun datumi, Kuun vikojen havaittavuus) saavat korjatun orientaation.

seg-a2071d345923 = Kierroksen { "2" } moottorikorjaukset, kukin ajettu uudelleen muuttumatonta ennakkorekisteröityä toleranssiaan vastaan: EOP-rivin IERS-vintage luetaan sen I/P-lipuista tyhjän Bulletin B -lohkon sijaan; <c1/> käyttää geodeettista paikallistasoa; Kuun nopeuskoordinaatiston kytkentä käyttää päiväntasaajasädettä, J2:ta ja pyörimistä; liu22-sovitus alkaa nollakorjauksista ilman priorit ja käyttää artikkelin keskiliikkeen nopeutta; EO-solmuväli sisältää J2-solmuregression; Costas-silmukan liukumisaika käyttää kaavaa rho/4; yhteinen paikkaratkaisu soveltaa parin lähetettyä ryhmäviivettä; Kuun yhteinen ratkaisu käyttää QR-askelta; NTN-raja arvioidaan todellisessa paikassa; tähdistösuunnittelun kellovertailu on näkyvissä oleva pienimmin numeroitu tähdistö; DE440:n orientaatiosarja kattaa vuodet 2014-2030 ja antaa virheen sen ulkopuolella katkaisun sijaan.

seg-74f397ad9c16 = <c1/>, taulukoiduista Maahan kiinnitetyistä tiloista rakennettu totuusrata, jota käytetään todellisen radan sovitinvertailussa.

seg-7293b717d978 = Yllä olevien vertailujen testitiedostot ja fixturet, kukin generaattorinsa ja tiedoston <c1/> kanssa, joka antaa lähteen, lisenssin, hakupäivän ja SHA-256:n.

seg-920fe965bda9 = Kierros { "2" }: <c1/> ja <c2/> (ADD v4.2:n vianhavaitseminen, Stanford MAASTia seuraten ARAIM { "2" }:lle, BSD-3-ilmoitus lähteessä); <c3/>; <c4/> ja <c5/>; yhdeksän tilan INS-virhemalli <c6/>; <c7/>-osittaisderivaatat ja kernel-polun <c8/>-syötteet; <c9/>, lukija SPK-tyypille { "2" } ja binäärisille PCK-kerneleille; <c10/> ITRF2020-asemilla; Jacchia { "1971" } -tiheys; <c11/> minkä tahansa efemeridin tarjoajan yli; <c12/>; <c13/> ja <c14/>; <c15/>; <c16/> (RINEX-kello-, ANTEX- ja DCB-lukijat).

seg-e3336e670d51 = Paikkausjulkaisu versiolle { "0.29.2" }. Kshana Studio on rakennettu uudelleen kahden näkymän ympärille: Yksinkertainen näkymä, joka vastaa ensin ja selittää tavallisin sanoin, ja Laaja näkymä, jossa on koko hallintapaneeli. Mukana tulee kaksi pientä korjausta sivustolle kshana.dev. Moottori ei muutu: jokainen mukana toimitettu skenaario antaa tavu tavulta saman tuloksen kuin { "0.29.2" } versiotunnusta lukuun ottamatta.

seg-c40ab967ace6 = <b>Kshana Studiossa on Yksinkertainen näkymä.</b> Studio avautuu siihen.

seg-6a5ae001d00e = Vastaus tulee ensin: skenaario avautuu tulokseensa, joka esitetään yhdellä selkeällä lauseella. Jokaisella mukana toimitetulla skenaariolla on oma lauseensa, kirjoitettu sen mukaan, mitä kyseinen skenaario mittaa.

seg-375421534e4c = Enintään viisi asetusta on esillä, ne, jotka muuttavat vastausta eniten. Loput ovat kohdassa "Lisäasetukset", taitettuna piiloon, kunnes avaat ne.

seg-d8650ae64549 = "Miten tämä lasketaan" selittää menetelmän muutamalla rivillä, ja "Tutkijoille" antaa moottorin omat luvut, skenaariotiedoston ja tuloksen taustalla olevat todisteet.

seg-36af7640e6ad = <b>Koko hallintapaneeli on Laaja näkymä.</b> Aiemman Studion jokainen paneeli, kaavio, vienti ja raportti on siellä.

seg-0428d0a7921b = <b>Kytkin siirtää näkymästä toiseen ja säilyttää paikkasi.</b> Skenaario, näkymä, jossa olit, ja muokkaamasi asetukset siirtyvät mukana. Studio muistaa, kumpaa näkymää käytit viimeksi. Sivuston ja dokumentaation linkit avaavat Yksinkertaisen näkymän; linkki, jossa on <c1/>, avaa Laajan näkymän, ja jokainen aiempi Studio-linkki avaa edelleen saman skenaarion ja näkymän.

seg-2c98ed084c10 = <b>Nopeampi ensimmäinen näkymä hitailla yhteyksillä.</b> Skenaarion tallennettu vastaus piirretään ennen kuin loppu Studiosta latautuu, joten hitaalla mobiiliyhteydellä vastaus näkyy noin kahdessa sekunnissa noin yhdeksän sijaan.

seg-2214d2dcfab4 = <b>Parempi haku.</b> Haku listaa nyt ensin skenaariot, joiden alue tai otsikko vastaa sanoja, ennen skenaarioita, jotka mainitsevat ne vain tiedostonimessä tai tekstissä.

seg-aa8d43280c19 = <b>Etusivun maapallo ei enää tyhjene, kun vähennetty liike on päällä.</b> Kun järjestelmän asetus vähennetylle liikkeelle on päällä, ikkunan koon muuttaminen saattoi jättää etusivun maapallon tyhjäksi, kunnes sivu vieritettiin. Maapallo piirtyy nyt uudelleen samassa ruudussa kuin koonmuutos.

seg-da4b78816df1 = <b>Etusivun L-kaistakonsoli selittää tyhjän kaistansa.</b> Kohdassa "Watch a jammer take the band" GPS L5 / Galileo E5a -paneeli pysyi tummana koko minuutin, mikä näytti rikkinäiseltä. Tässä skenaariossa mikään häirintälähetin ei lähetä kyseisellä kaistalla, ja satelliittisignaalit ovat kohinalattian alapuolella, joten mikään ei nouse sen yläpuolelle. Hiljainen merkintä kertoo nyt tämän jokaisessa paneelin jaksossa, jossa mikään ei ole lattian yläpuolella (L5 / E5a -paneeli ja L2C-paneeli ennen kuin sen kohinahäirintälähetin käynnistyy), ja näyttää jokaisen kaistan C/N0:n ja lukitustilan samasta ajosta. Se sijoitetaan vain sinne, missä mikään ei ole lattian yläpuolella, joten se ei koskaan peitä häirintälähettimen energiaa.

seg-e353fdee7033 = Paikkausjulkaisu versiolle { "0.29.1" }. Se poistaa päällekkäistä koodia LEO-navigointisanoman, fuusion ja spektrin moduuleista, lisää vaalean teeman sivustolle kshana.dev, siirtää Kshana Studion omaan osoitteeseensa, tekee sivustosta luettavan hakukoneille ja tekoälyavustajille, korjaa useita pieniä asioita Studiossa ja antaa npm-julkaisujen julkaista ilman tallennettua tokenia. Mikään moottorin tuloste ei muutu: jokainen mukana toimitettu skenaario antaa tavu tavulta saman tuloksen kuin { "0.29.1" } versiotunnusta lukuun ottamatta.

seg-e8bf0a4fdc35 = <b>Vaalea teema sivustolle kshana.dev.</b> Jokaista sivua voi lukea vaaleana tai tummana. Sivusto noudattaa lukijan järjestelmäasetusta, ja siinä on kytkin sen vaihtamiseen.

seg-8e7cabc14c40 = <b>Hakukoneet ja tekoälyavustajat voivat lukea sivuston.</b> Jokaisella sivulla on nyt oma otsikko, kuvaus, kanoninen osoite, sosiaalisen median korttien tunnisteet ja schema.org-jäsennelty data sekä pelkkää tekstiä osioille, jotka skripti piirtää. Sivusto julkaisee <c1/>-tiedoston, <c2/>-tiedoston, jossa on kunkin sivun viimeisin muutospäivä, sekä <c3/> ja <c4/> (lyhyt ja täysi pelkkä tekstiopas tekoälyavustajille) ja IndexNow-avaimen, jotta julkaisu voi kertoa hakukoneille, mikä muuttui.

seg-804ba71be9ed = <b>npm-julkaisut voivat julkaista ilman tallennettua tokenia.</b> npm-työ ajaa nyt Node { "24" }:ää ja npm { "11.5.1" }:tä tai uudempaa, jotka tukevat npm trusted publishingia: npm vaihtaa julkaisutyön GitHub-identiteetin lyhytikäiseen tunnistetietoon. Salaisuus <c1/> toimii edelleen ja sitä käytetään, kun se on asetettu, joten mikään ei muutu ennen kuin trusted publishing on otettu käyttöön paketille npmjs.comissa. Tiedosto <c2/> luettelee vaiheet.

seg-81405e5a5e06 = <b>Etusivun otsikko on luettavissa maapallon päällä.</b> Pehmeä varjostus on nyt otsikon ja sen tekstin takana ja himmentää animoidun maapallon ratojen viivat ja satelliittipisteet kohdissa, joissa ne ylittävät sen.

seg-24b8363acc14 = <b>Kshana Studiolla on oma osoitteensa: <a1>https://kshana.dev/studio/</a1>.</b> Jokainen sivuston ja dokumentaation linkki osoittaa sinne. Vanha osoite <c1/> toimii edelleen ja ohjaa uuteen säilyttäen skenaarion, näkymän ja muut linkin asetukset.

seg-12f223b986bd = <b>Studio-korjaukset.</b> Moottoritiedosto ladataan kerran kahden sijaan. Latauksen aikana Studio näyttää skenaarion tallennetun tuloksen heti, merkittynä tallennetuksi, tyhjän ruudun sijaan. Puhelimessa otsikko on yksi tiivis rivi. Keskeiset luvut rivittyvät kaksi riviä kohti, jotta mikään ei jää piiloon ruudun reunan taakse. Kenttien nimet käyttävät skenaarion omia sanoja, kentän nimi niiden vieressä, ja haku löytää kentät kummallakin.

seg-c130d8a4dc5e = <b>Vähemmän päällekkäistä koodia.</b> LEO-navigointisanoman yksikkötaulukko kirjoitti samat kymmenen SISRE-tilastoriviä neljälle sovitusyhteenvedolle. Makro kirjoittaa ne nyt kerran. Kaksi spektrin vesiputouskaaviota jakavat yhden aika-akselin, värimittarin ja C/N0-palkkipaneelin. Pääruudukon alasnäytteistys käyttää uudelleen kohdetta <c1/>, ja Simpsonin integraali käyttää uudelleen kohdetta <c2/>. LEO-ylilentolajin kaksi sisääntulopistettä jakavat yhden alustusvaiheen. <c3/> tuo <c4/>-vektoriapurit kopioinnin sijaan. Laaja raportti tuo API-raportin HTML-escapen kopioinnin sijaan. Jokainen kansion <c5/> { "139" } skenaariotiedostosta ajettiin versiolla { "0.29.1" } ja tällä koodilla, ja jokainen tulostetiedosto on tavu tavulta sama.

seg-166b0435c96f = <b>leo-navmsg- ja leo-pvt-yksikkötaulukoilla on omat tiedostonsa.</b> Ne siirrettiin moduuleista, joissa on myös logiikkaa, tiedostoihin <c1/> ja <c2/>. <c3/> säilyttää julkisen polkunsa. Vain nämä kaksi taulukkotiedostoa liitetään kopiointitunnistuksen poikkeuksiin deklaratiivisille katalogeille tiedostossa <c4/>, jota <c5/> tarkistaa.

seg-f8b372e08ef9 = <b>READMEn CI-merkki näyttää mainiin tehtyjen pushien tuloksen.</b> Merkki laski jokaisen tapahtuman ajot mainissa, joten se saattoi näyttää "failing", vaikka jokainen push-ajo oli vihreä; se pyytää nyt vain push-ajoja (<c1/>).

seg-7c41a482c7d8 = Paikkausjulkaisu versiolle { "0.29.0" }: mitattu kattavuusluku, projektin nimirivi sivustolla kshana.dev, nopeampi kattavuustyö ja päivitetty README. Mikään moottorin tuloste ei muutu: jokainen skenaario antaa saman tuloksen kuin versiolla { "0.29.0" }.

seg-997490bd1696 = Julkaistujen lukujen revisiot

seg-ed4b071e4bd9 = <b>Rivikattavuus: ~{ "96" } % → ~{ "95" } %.</b> Kattavuustyö mittasi julkaistun { "0.29.0" }-koodin uudelleen (commit <c1/>, CI-ajo { "36809850252" }, 2026-10-01): <c2/>, { "55,970" }/{ "58,697" } riviä hakemistossa <c3/>. Julkaistu luku oli { "95.63" } % ({ "37,697" }/{ "39,419" } riviä), mitattuna commitilla <c4/> ennen versiota { "0.28.0" }; se pyöristyi lukuun ~{ "96" } %. Uusi luku pyöristyy lukuun ~{ "95" } %, joten kaikki pinnat, jotka <c5/> kiinnittää, siirtyvät yhdessä: <c6/>, READMEn merkki, Evidence-rivi ja CI-taulukko, crates.io-, PyPI- ja npm-merkit, tekninen raportti ja kshana.devin kattavuussivu. { "85" } %:n lattia ei muutu.

seg-577baa03af04 = <b>Nimirivi sivustolla kshana.dev.</b> "Kshana · क्षण · the precise instant" avaa nyt Home-herotilan ja on kunkin sivun alatunnisteessa tuotenimen alla. kshana.dev ei edelleenkään tee pyyntöjä toiselle isännälle: devanagari on itse isännöity Noto Sans Devanagari -osajoukko kolmesta क्षण-sanan kirjaimesta ({ "1,692" } tavua, <c1/>, SIL Open Font License -teksti ja sen SHA-256 tiedostossa <c2/>). <c3/> osaa nyt tallentaa Google Fontsin <c4/>-osajoukon sisältöosoitteistetulla tiedostonimellä.

seg-35b5bc4ee466 = <b>Sivuston linkit päätyvät sinne, minne ne osoittavat, siisteillä osoitteilla.</b> Linkki osioon asettaa nyt osion juuri otsikon alle sekä puhelimella että työpöydällä: Missions-sektorin linkki avaa sektorin paneeli ylhäällä; Capabilities- ja Editions-linkit pitävät paikkansa, kun niiden yläpuolella olevat kaaviot piirtyvät; Editions ei enää lisää toista otsikkosiirtymää; ja linkki dokumenttisivun taitettuun osaan avaa sen. Jokaiseen sivuun linkitetään sen siistillä osoitteella (<c1/>, <c2/>, <c3/> etusivulle), ja kanoniset linkit, sivukartta ja vanhojen osoitteiden uudelleenohjaukset nimeävät samat; <c4/>-osoitteet toimivat edelleen. Research-sivulla on oma linkkinsä otsikossa Evidencen ja Developersin välissä sekä alatunnisteessa. Dokumentaatio ei enää näytä tiekarttaa (<c5/> pysyy repositoriossa): Project-ryhmä on Changelog, Licensing, Security, Contributing, Governance ja Code of conduct, ja Glossary siirtyi kohtaan Get started.

seg-3da9f00f5ce6 = <b>Kattavuustyö on nopeampi.</b> Versiolla { "0.29.0" } se kesti { "143" } minuuttia, kun terve aika oli { "91" } –

seg-85d502773367 = <c1/>-fuzzer, edellisen kerran syyllinen, vei niistä { "4" }. Mukana toimitettu korpus kasvoi { "74" }:stä { "139" } skenaarioon, ja kolme testibinääriä kävi läpi sen kaiken yksi tiedosto kerrallaan (<c2/> kahdesti, <c3/> ja <c4/> kerran): yhteensä { "37" } minuuttia kattavuusinstrumentoinnin alla, kun versiolla { "0.27.2" } se oli { "3" }. Ne jakavat nyt tiedoston <c5/>, joka ajaa skenaariokohtaisen työn kaikilla ytimillä ja palauttaa tulokset lajiteltuina; jokainen skenaario ja jokainen väite säilyy. Arm64-kannettavalla, debug-buildilla: <c6/> kestää { "143" } s { "14" } ytimellä verrattuna { "612" } s:iin asetuksella <c7/> (vanha sarjakäynti).

seg-bb69dbadbc81 = <b>README, päivitettynä.</b> Se alkaa samalla nimirivillä kuin sivusto; Studio-kuvakaappaukset on otettu uudelleen versiosta { "0.29.1" } Studio, uusi kuva Studiosta puhelimella ja sen alareunan vaihepalkki; uusi "The site" -kaista näyttää kolme kshana.dev-sivua versiosta { "0.29.1" } (<c1/>, koostettu tiedostolla <c2/> ja tallennettu tiedostoon <c3/>); kattavuusluku on ~{ "95" } %; ja tutkimuskuvan alt-teksti, joka toisti arkkitehtuurikuvan tekstiä, kuvaa nyt artikkeleita. Otsikkomerkit ovat pienempiä ja lyhyempiä ({ "18" } px korkeita; "~{ "95" }%", "83/223", "quality", "AGPL-3.0", "zenodo.20528627"), joten kaikki yksitoista mahtuvat kahdelle riville; jokainen linkki ja alt-teksti säilyttää täyden merkityksensä.

seg-f61ef3e16884 = <b>Konttikuvatyö saa { "90" } minuuttia.</b> Versiolla { "v0.29.0" } kuvan <c1/> emuloitu linux/arm64-build ylitti vanhan 45 minuutin rajan viimeistä crate-pakettiaan käännettäessä, joten kuva, MCP-rekisterimerkintä ja kanavatarkistus eivät julkaistuneet. Raja on nyt { "90" } minuuttia; kuva ei muutu.

seg-1688bf9f0fec = <b>Kahdeksan liukulukuvakiota ryhmitelty uudelleen</b> tiedostoissa <c1/> ja <c2/> (<c3/> → <c4/>): SonarQube Cloud luki viimeisen ryhmän <c5/> tai <c6/> puuttuvaksi <c7/>- tai <c8/>-päätteeksi (sääntö S7454). Arvot ovat samat luvut, joten jokainen tulos pysyy ennallaan.

seg-81fd160937db = Kaksitoista uutta skenaariolajia ja kolme uutta tapaa lukea ajo. Moottori kattaa nyt radiospektrin, koko aurinkokunnan, tähdistöt minkä tahansa kappaleen ympärillä, kampanjat, jotka ketjuttavat skenaariot yhdeksi tehtäväksi, sekä paikannuksen, navigoinnin ja ajanmäärityksen (PNT) matalalta Maan kiertoradalta (LEO) signaalista paikkaratkaisuun. Jokainen ajo voidaan myös kirjoittaa animaationa, täytenä raporttina ja joukkona yhteentoimivuustiedostoja muille työkaluille.

seg-118be64d7cb2 = Moottorin ympärillä: uudistettu kshana.dev (monisivuinen sivusto ja uusi Kshana Studio -hallintapaneeli, joka ajaa jokaisen ominaisuuden selaimessa), uudelleenkirjoitettu README, neljätoista työkalua Model Context Protocol (MCP) -palvelimella, selainbuild, joka antaa samat luvut kuin natiivi, ja julkinen sivu Kshana Prolle.

seg-ea31356bc17d = Skenaariotiedostot (plus yksi sarjamanifesti)

seg-26654cd81de1 = { "138" }, joista { "132" } on toimitettu mukana komennolle <c1/>

seg-3d1a85e93e48 = joista MODELLED (esitetty malli, sisäinen johdonmukaisuus tarkistettu)

seg-e77f9d273ee1 = joista PARTNER (tarvitsee kumppanin laitteiston tai datan)

seg-e94cd6b3561a = Mistä kasvu tulee:

seg-1759a8cce7d6 = Lajit

seg-94de9433d99f = Skenaariotiedostot

seg-03d7aea335dc = Matriisirivit (validoidut + mallinnetut)

seg-fdd674722717 = Spektri

seg-59583fa40da3 = Aurinkokunta ja paikannus minkä tahansa kappaleen ympärillä

seg-fafa167623df = Meri-, tie- ja raidekulkuskenaariot

seg-fc571c46e522 = Animaatio, raportit, yhteentoimivuusviennit

seg-2746e0d9f787 = LEO-signaalisuunnitelmat ja monikaistainen spektri

seg-d40ec114d1f9 = LEO-paikannus, ajanmääritys ja fuusio

seg-0157f649e65b = LEO:n päästä päähän -ketju

seg-423283112128 = LEO:n kestävyys-, painopistealue- ja loppukäyttäjäskenaariot

seg-395beca13299 = Lisätty yhteensä

seg-ea9dc4093d8a = LEO-ominaisuus on järjestelmäagnostinen: se toimii yleisillä, ilmoitetuilla parametreilla eikä tarvitse nimettyä järjestelmää. Nimetyt järjestelmät ovat valinnaisia esiasetuksia, kukin omassa tiedostossaan ja julkisine lähteineen. Yksi esiasetus, Celeste IOD (in-orbit demonstration), käyttää lukuja, jotka esitettiin ESA NAVISP LEO-PNT -työpajassa, { "2026" } (ESA on Euroopan avaruusjärjestö; NAVISP on sen Navigation Innovation and Support Programme); se on yhdessä tiedostossa, <c1/>, viiden vain repositoriossa olevan skenaarionsa kanssa, joten se voidaan pidättää ilman lähdemuutosta, eikä yhtäkään sen työpajan lukua toisteta tässä muutosluettelossa.

seg-c36a5015c03c = <b>Lue "Julkaistujen lukujen revisiot" ennen päivitystä.</b> Yksi moottorin tuloste muuttuu (lajin <c1/> inertiaalikoordinaatiston sarakkeet nutaatiomatriisin etumerkkikorjauksen jälkeen), ja dokumentaatiotarkastus korjasi lukuja, jotka aiemmat dokumentit olivat painaneet.

seg-7fe505d3232b = Tilat: <b>VALIDATED</b> tarkoittaa tarkistettua riippumatonta ulkoista oraakkelia vastaan (julkaistu taulukko, toisen ryhmän ohjelmisto tai mitattu data); <b>MODELLED</b> tarkoittaa esitettyä mallia, joka on tarkistettu vain sisäisen johdonmukaisuuden osalta; <b>PARTNER</b> tarkoittaa, että tarkistus tarvitsee kumppanin laitteiston tai datan.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project; viidennen sukupolven matkaviestinverkko; ei-maanpäällinen verkko

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = ajanlaskun kaudet (anno Domini, ennen Kristusta)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternative binary offset carrier; binary offset carrier; binary phase-shift keying; multiplexed binary offset carrier (signaalimodulaatioita)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (julkaistu LEO-efemeridimalli)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = karkea/hankintakoodi (coarse/acquisition) sekä Global Positioning Systemin kantoaallon ja siviilisignaalien nimet

seg-e464509f3abb = kantoaalto-kohinatiheyssuhde

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = komentorivikäyttöliittymä

seg-9aa3c2e54398 = 24-bittinen syklinen redundanssitarkistus (Qualcommin polynomi)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = comma-separated values; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform resource locator

seg-3ad592244ea8 = jatkuva aalto

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (kartta- ja maapallomuotoja)

seg-3415aa029e39 = Jet Propulsion Laboratoryn Development Ephemeris { "441" }

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital object identifier

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = tarkkuuden heikkenemiskerroin: geometrinen, paikka, vaaka, pysty

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = Galileon signaalien nimet

seg-544f4fcbd68f = paikan nimi Global Positioning Systemin tähdistötaulukossa

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = Maakeskinen, Maahan kiinnitetty

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = päiväntasausten yhtälö

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = ekvivalentti isotrooppisesti säteilevä teho

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (tähtitieteen vertailukirjastoja)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = Euroopan avaruusjärjestö; sen Navigation Innovation and Support Programme

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = taajuusjakoinen monikäyttö

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = Venäjän maailmanlaajuinen satelliittinavigointijärjestelmä

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = maailmanlaajuinen satelliittinavigointijärjestelmä; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = International Astronomical Union

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = rajapintamäärittely (interface control document); Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Kansainvälinen merenkulkujärjestö

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = inertiaalinavigointijärjestelmä; mikrosähkömekaaninen järjestelmä

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = in-orbit demonstration (kiertoratademonstraatio)

seg-92cd0058a058 = IQ

seg-c7fa50165400 = samavaiheinen ja kvadratuuri (in-phase and quadrature)

seg-41471e51e661 = Global Positioning Systemin rajapintamäärittely

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Kansainvälinen avaruusasema

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-Earth-fixed; true equator, mean equinox (koordinaatistoja)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Kansainvälinen televiestintäliitto; sen radioviestintäsektori

seg-a524e4c4a670 = häirintä-signaalisuhde

seg-5d93361e20d4 = J2–J6, J2000

seg-50255586b303 = painovoimakentän zonaaliset harmoniset; epookki 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Jet Propulsion Laboratory

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = matala Maan kiertorata; keskikorkea Maan kiertorata

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = mallipohjainen järjestelmäsuunnittelu

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = normalisoitu estimointivirheen neliö

seg-56d5135d987d = Galileon ionosfäärimalli

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (tarkat radat); kaksirivinen elementtijoukko (two-line element set)

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = paikannus, navigointi ja ajanmääritys; tarkka pistepaikannus

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = tehospektritiheys; spektrinen erotuskerroin

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = vastaanottimen autonominen eheyden valvonta; signaalin laadun valvonta

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = neliöllinen keskiarvo (root mean square)

seg-e1c3c49833fc = avoimen lähdekoodin GNSS-paikannuskirjasto, jota käytetään tässä oraakkelina

seg-9ead536db4aa = Simplified General Perturbations { "4" } (kaksirivisten elementtijoukkojen ratamalli)

seg-865e7d1794b6 = Secure Hash Algorithm, 256-bittinen

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = avaruudessa kulkevan signaalin etäisyysvirhe (signal-in-space range error)

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (sen <c1/>-efemeriditiedostomuoto)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = avaruusaluksen tunniste (space vehicle identifier)

seg-de4e841ce8a2 = Walker-tähdistön satelliittien kokonaismäärä, tasot ja vaiheistus

seg-4d6ebfefc096 = TEC

seg-5149401781dd = elektronien kokonaismäärä (total electron content)

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrakorkea taajuus

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = Coordinated Universal Time (yleisaika)

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = Xona Pulsar -järjestelmän signaalien nimet

seg-d6a3f210958a = Muuttunut julkaistu luku on revisio, ja se kirjataan, eikä sitä koskaan korjata äänettömästi. Tämä julkaisu sisältää yhden moottorin tulosteen revision ja useita dokumentaatiossa painettujen lukujen revisioita.

seg-1669eb4224f1 = Moottorin tuloste

seg-185961ebab61 = TEME→GCRS-redusointi kiertyi { "2" }·Δψ: nutaatiomatriisissa Δψ:n etumerkki oli käännetty.

seg-504b78f30c54 = <c1/> rakensi <c2/> siellä, missä SOFAn <c3/> rakentaa <c4/>, joten <c5/>, <c6/>, <c7/> ja <c8/> kiersivät kaksinkertaisen pituuskulman nutaation verran, noin { "25" } kaarisekuntia. Jokainen ketjun tarkistus oli ominaisuustesti (aito rotaatio, edestakainen muunnos, nollasta poikkeava nutaatiopanos), jonka etumerkkivirhe läpäisee; päästä päähän -Vallado-testi kattoi TEME→PEF, TEME→ITRF ja GCRS→ITRS mutta ei TEME→GCRS. Vallanon esimerkissä (AIAA 2006-6753, 2004-04-06) ketju ohitti julkaistun GCRF:n { "1 145" } m:llä; se on nyt { "0.11" } m:n päässä siitä, ja matriisi vastaa ERFAn <c9/>:ää tarkkuudella { "1e-14" }. <c10/> ja <c11/> epäonnistuvat molemmat vanhalla etumerkillä. Tiedoston <c12/> CIO-yhdenmukaisuustesti (Celestial Intermediate Origin) oli selittänyt tuloksena olleen ~{ "130" } m:n poikkeaman "≈ { "2" }·EE":llä; residuaali on nyt { "5" } cm ja sen raja on tiukennettu { "250" } m:stä { "1" } m:iin. <b>Tämä siirtää julkaistuja lukuja, jotka kirjataan tähän revisiona:</b> lajin <c13/> sarakkeet <c14/> ja <c15/> (noin { "0.8" }–{ "1.0" } km mukana toimitetussa ISS-skenaariossa (International Space Station); sen TEME-, Maahan kiinnitetyt, maanpintajälki-, katselukulma- ja Doppler-sarakkeet eivät muutu) sekä <c16/> / <c17/> GCRS- ja ITRS-koordinaatistoille. Minkään mukana toimitetun skenaarion yhteenvetorivi, kaavio tai golden-tiiviste ei lue näitä sarakkeita. Uudet yhteentoimivuusviennit käyttävät korjattua ketjua: ensimmäisen <c18/>-satelliitin CZML-paikka vastaa saman TLE:n ERFA-redusointia (propagoituna <c19/>-Python-paketilla) { "2.3" } cm:n tarkkuudella.

seg-a0a4026d22ed = <b>Laji <c1/>, natiivisti ja selainbuildissa.</b> Laji laskee nyt jokaisen transkendenttifunktion yhden siirrettävän matematiikkakirjaston kautta, joten sen kehys on samat tavut jokaisella alustalla ja jokaisessa buildissa (katso Korjattu). Jokainen <c2/>-luku siirtyy sen mukana, samoin <c3/>-vaihe tiedostossa <c4/>. Laji on uusi tässä julkaisussa, joten mikään aiemmasta julkaisusta ei siirry, mutta ennen korjausta painetut luvut siirtyvät: tiedoston <c5/> tarkistusarvo koodaus-ja-dekoodaus-skenaariolle oli <c6/> ja on <c7/>, ja dekoodatun sanoman SISRE on { "0.129" } cm. Sivustolla kshana.dev Missions-kortti kohteelle <c8/> näytti pahimmaksi etäisyysvirheeksi { "1.6" } mm { "60" } s:n sovituksella ja { "40.3" } mm { "900" } s:n sovituksella; sivusto rakennetaan nyt tämän julkaisun moottorilla ja näyttää { "1.8" } mm ja { "46.6" } mm.

seg-77f441bfc3c3 = <b>Häirinnän jalanjälkikartta sivustolla kshana.dev (Missions).</b> Jokainen sen { "875" } solusta on yksi ajo kohteesta <c1/>, jossa vain vastaanottimen paikka muuttuu. Solut lasketaan nyt samoista kolmen desimaalin koordinaateista, jotka solun "avaa tämä ajo" -linkki antaa Kshana Studiolle, joten solu näyttää täsmälleen sen, minkä sen linkki toistaa. { "30" } solun keskimääräinen häirintä-signaalisuhde (J/S) siirtyy { "0.1" } dB, ylös tai alas; minkään solun seurantasaatavuus ei muutu. Moottori antaa identtiset tulokset jokaiselle solulle versioissa { "0.28.0" } ja { "0.29.0" }.

seg-146588a39e7c = <b>Siemennetty uudelleenotanta WebAssembly (WASM) -paketissa.</b> Selainbuild arpoi samasta siemenluvusta eri bootstrap- ja sekoitusindeksit kuin natiivibuild (katso Korjattu). Käyrän alle jäävän alan <c1/>-väli selaimessa oli <c2/> ja on nyt natiivi <c3/>. Mikään natiiviluku ei siirry.

seg-017810049453 = Dokumentaatiossa painetut luvut

seg-85ab2a364a37 = Dokumentaatio tarkastettiin sana sanalta tämän julkaisun moottorin ajoja vasten. Missä painettu luku ei vastannut ajoa, dokumentti korjattiin, ja jokainen korjaus on lueteltu tässä muodossa vanha → uusi. Kaikissa alla olevissa tapauksissa moottorin tuloste ei muuttunut; dokumentti oli lukenut väärin, pyöristänyt väärin tai jäänyt tuloksesta jälkeen.

seg-1eacdefbfda2 = <b>Spektri-, tähdistö-, kampanja-, animaatio-, raportti- ja yhteentoimivuussivujen dokumentaatiotarkastus sekä uusi <c1/>.</b> Jokainen luku ajettiin uudelleen tällä moottorilla. Kaksi julkaistua lukua siirtyy: <c2/> antoi { "5" } 000 satelliitin kattavuustestin ajaksi "noin { "0.13" } s debug-buildissa"; tämä ei toistunut ({ "1.24" } s kuormitetulla kannettavalla), joten sivu antaa nyt esisuodattimen osuuden, jonka testi tulostaa ({ "9.9" } % { "19 440 000" } paritestistä), ja release-binäärin { "0.14" } s mukana toimitetulle <c3/>:lle. Sama sivu antoi E3F:n ylityksen "{ "0.050" } asteen poikkeamana"; mikään testi ei tulosta tätä lukua, joten sivu toteaa nyt vain testin valvoman { "0.06" } asteen kynnyksen ja sen taustalla olevan johdon { "7.30" } vastaan { "7.36" } astetta. Mikään moottorin tuloste ei muutu.

seg-2ad182e2db15 = LEO-PNT-dokumentit: korjatut julkaistut luvut (ajettu uudelleen tämän julkaisun moottorilla).

seg-6c2401365dd5 = <c1/> kaistakompromissi: kohteen <c2/> ensimmäisen kertaluvun ionosfäärinen viive on { "3.24" } m (painettu { "3.25" } m) ja kohteen <c3/> { "0.77" } m (oli { "0.78" } m). <c4/> koodaus ja dekoodaus: dekoodatun sanoman SISRE oli painettu { "0.119" } cm, kun ajo antoi { "0.122" } cm; sivu painaa nyt { "0.129" } cm, luvun alustariippumattomuuskorjauksen jälkeen (katso Korjattu alla). <c5/> LEO vastaan GNSS -ylilento: { "32" } dB vähemmän vapaan tilan vaimennusta ylilennon huipulla (oli "{ "26" }–{ "32" } dB"). Signaali- ja ylilentoluvuille moottorin tuloste ei muuttunut; dokumentit olivat lukeneet tai pyöristäneet sen väärin.

seg-fc3c8ba1b789 = <b>Tutoriaalit, läpikäyty putkiesimerkki ja komento <c1/>, tarkastettu tämän julkaisun moottoria vasten.</b> Julkaistujen lukujen revisiot, vanha → uusi: lajeja, jotka kirjoittavat <c2/>, on kuusi, ei neljä (<c3/> ja <c4/> puuttuivat; <c5/>, <c6/>); kylmäatomien ½bT²-ylitys Tutoriaalissa { "3" } on { "18,443" } s, ei { "18,440" } s; <c7/>-edestakaisvirhe tiedostossa <c8/> on mitattu { "4.88e-7" } km, ei "~{ "1e-7" } km"; Tutoriaalin { "2" } CSAC-holdover-kaista on testin väittämä { "2000" }–{ "3200" } s, ei "~{ "2600" }–{ "4400" } s"; Tutoriaali { "1" } siteeraa SP3-rivit ja geometrialohkon tarkkuudella, jolla moottori ne kirjoittaa. Mikään moottorin tuloste ei muuttunut.

seg-4c613cabb87b = Validointi-, kvantti-, SGP4-, animaatio-, väite- ja eheyssivut.

seg-c49d5cdb36e1 = <c1/>: valkoisen taajuuskohinan kellon simuloidun yhden sekunnin Allanin poikkeaman valvottu raja on { "20" } % (painettu { "25" } %; { "25" } %:n raja on käyrän raja kohdissa { "1" }, { "10" } ja { "100" } s); nopeuden satunnaiskulun rivi toteaa nyt valvotun { "20" } %:n rajansa havaitun noin { "12" } %:n vieressä; ja sirumittakaavaisen atomikellon saatavuus kohteessa <c2/> on noin { "0.73" } (painettu noin { "0.83" }). <c3/>: tärinän rajoittama laukauskohtainen kohina sivun kylmäatomiesimerkissä on noin { "46" } kertaa sen laukauskohinalattia (oli "~{ "45" }×"; { "46.49" } laskettuna uudelleen), ja alue "{ "1" }–{ "50" } µg/√Hz" kenttälaitteille, joka oli ristiriidassa laitteen kanssa, jonka sivu itse siteeraa, korvataan kahden siteeratun laitteen julkaistuilla luvuilla. <c4/>: pahin paikkaero on { "4.12" } mm (oli "≈ { "4" } mm"), satelliitti nimettynä. <c5/>: videokooderiesimerkki luki { "24" } ruutua sekunnissa -kehykset arvolla { "12" }; se käyttää nyt arvoa { "24" }, jonka kehysmanifesti ilmoittaa. <c6/>: häirintämallilla on { "10" } testiä (oli { "8" }), ja kytketyn suodattimen "{ "2.97" } m vastaan { "48.8" } m" korvataan sillä, mitä sen testi väittää (kytketty paikkavirhe alle { "0.6" } kertaa irrotetun virhe, voittaen vähintään { "90" }/{ "100" } kokeesta). <c7/>: "Today"-leima luki { "v0.22.0" }; se nimeää nyt tämän julkaisun, ja kaksi sen jälkeen rakennettua ominaisuutta (tähdistön laajuinen vikatila ja eheystukisanoma) poistuvat sen aukkoluettelosta.

seg-4fde8788f95f = <b>Skenaariolaji <c1/>: L-kaistan spektrimalli ja vesiputous</b> (<c2/>, <c3/>, <c4/>). Koko GNSS:n L-kaista yhtenä tehospektritiheytenä (PSD): GPS L1 coarse/acquisition (C/A) ja L2 civil (L2C) (BPSK({ "1" })), Galileo E1 (multiplexed binary offset carrier, MBOC(6,1,1/11), tai BOC({ "1,1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), kT-kohinalattia vastaanottimen kohinaluvulla sekä jatkuva-aaltoiset (CW), kapeakaistaiset, chirp- ja sovitetun kohinan häirintälähettimet käsikirjoitetulla aikajanalla. Jokainen häirintälähetin pisteytetään kaistakohtaisesti spektrisellä erotuskertoimellaan (SSC), mikä antaa häirintä-signaalisuhteen (J/S) ja tehollisen kantoaalto-kohinatiheyden (C/N0) kaistaa ja riviä kohti. Kaavio on SVG-vesiputous C/N0-palkeilla; result.json sisältää ruudukon tehossa lohkokeskiarvoistettuna. Valinnainen <c5/> piirtää mallin IQ-näytteinä, kirjoittaa ja lukee Signal Metadata Format (SigMF) -tallenteen (<c6/>, <c7/>) ja vertaa Welch-estimaattia malliin; valinnainen <c8/> estimoi todellisen SigMF-tiedoston. Mukana toimitettu esimerkki <c9/>: chirp vie L1 C/A:n ja E1:n tasolla { "10" } s, L1-kantoaallolla oleva CW-sävy pitää C/A:n tasolla { "17.98" } dB-Hz chirpin loppumisen jälkeen, kun taas E1, jonka spektrissä on siinä nolla, toipuu; L5 ja E5a eivät kärsi.

seg-fa9976349886 = Uusi VALIDATED-rivi: signaalien PSD:t ja SSC:t, verrattuna BPSK(n):n pääkeilaan 2n x { "1.023" } MHz, BOC({ "1,1" }) -keiloihin keskitettynä +/-1.023 MHz:iin, Parsevalin suljettuihin muotoihin julkaistujen -61.8 / -64.8 / -67.8 dB/Hz SSC:iden takana sekä oppikirjan arvoihin Q = { "1" } (CW) ja { "1.5" } (sovitettu). BOC({ "1,1" }) -PSD:n maksimi on kohdassa +/-0.759 MHz, ei keilan keskellä; testi kiinnittää molemmat.

seg-411431a9b26b = Kaksi uutta MODELLED-riviä: vesiputous ja C/N0-aikajana, jotka palautuvat täsmälleen lajin <c1/> ketjuun (ristiintarkistettu jokaisessa raportissa), sekä SigMF-kodekki ja Welch-estimaattori. Mitään kolmannen osapuolen tallennetta ei ole repositoriossa.

seg-5c5c695e7c0a = <c1/>: MBOC-variantti ja <c2/>.

seg-bb346f4942a9 = Raportti painaa C/N0:n, jonka lajin <c1/> edustava Q-taulukko antaisi, spektristä johdetun vieressä; C/A-kantoaallolla olevalle CW-sävylle ne poikkeavat { "1.8" } dB. Kolme uutta matriisiriviä: yksi validoitu (signaalispektrit ja spektriset erotuskertoimet) ja kaksi mallinnettua.

seg-673dfe048dad = <b>Aurinkokunnan efemeridi ja paikannus minkä tahansa kappaleen ympärillä.</b> Kaksi uutta skenaariolajia.

seg-3e1b0e8e99e9 = <c1/>: Aurinko, kahdeksan planeettaa, Pluto, Kuu, Phobos, Deimos, Io, Europa, Ganymede, Callisto ja Titan yhtenä epookkina: heliosentrinen paikka ja nopeus International Celestial Reference Framessa (ICRF), gravitaatioparametri, säteet, J2 (toinen zonaalinen harmoninen) missä julkaistu, sideerinen pyöriminen, International Astronomical Unionin (IAU) napa ja nollameridiaani, rataviiva yhden kierroksen yli sekä valoaika, yksisuuntainen ja kaksisuuntainen etäisyys, Auringon Shapiro-viive ja Auringon etäisyys havaitsijakappaleesta ja mille tahansa lisälinkille. Planeetat tulevat Jet Propulsion Laboratoryn (JPL) Standishin ja Williamsin Kepler-elementeistä (taulukko { "1" }, { "1800" } AD–{ "2050" } AD; taulukot 2a/2b, { "3000" } BC–{ "3000" } AD); kuut JPL:n keskielementeistä IAU:n synkronisella pyörimisnopeudella ja Titan IAU:n pyörimismallista. Esimerkki: <c2/>.

seg-6a094973208b = <c1/>: kiertoradalla oleva alus tai pintalaskeutuja minkä tahansa näiden kappaleiden ympärillä, navigoiden pseudoetäisyyksillä kappaleen ympärillä olevasta Walker-tähdistöstä ja kellovapaalla kaksisuuntaisella etäisyydellä Maasta; tarkkuuden heikkenemiskerroin, formaali epävarmuus ja siemennetyt pienimmän neliösumman paikkaratkaisut Maa-yhteyden kanssa ja ilman. Esimerkit: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> saa Merkuriuksen, Venuksen, Jupiterin, Saturnuksen, Uranuksen, Neptunuksen, Pluton ja seitsemän kuuta, nimihaun ja fysikaalisen tietueen; <c2/> antaa minkä tahansa kappaleen suhteessa mihin tahansa toiseen olemassa olevan <c3/>-liitännän kautta.

seg-8b5c2fbe91f7 = VALIDATED JPL Horizonsia (Development Ephemeris DE441; fixturet ja kyselyt kansiossa <c1/>) vastaan: Merkurius–Saturnus ja Maa taulukosta { "1" } kaksinkertaisen ilmoitetun nimellisvirheen sisällä (pahin { "1.87" } kertaa), kaikki kahdeksan planeettaa taulukoista 2a/2b (pahin { "1.71" } kertaa) sekä Maan ja Marsin sekä Jupiterin valoaika. MODELLED: Uranus ja Neptunus taulukosta { "1" }, jotka ylittävät ilmoitetun virheen DE441:ää vastaan ({ "2.0" } ja { "5.2" } kertaa), Pluto, kuut, kappalevakiot ja <c2/>-tulokset.

seg-a3c83f6d2078 = Löydös: Montenbruckin & Gillin Kuun sarja tiedostossa <c1/> on jo viitattu J2000-päiväntasaukseen oman prekessiotermin avulla ({ "0.05" } astetta Horizonsista), joten sitä käytetään ilman lisäprekessiorotaatiota. Kuusi uutta matriisiriviä: kaksi validoitua (planeettojen paikat, valoaika) ja neljä mallinnettua.

seg-564133d6a0c4 = Tähdistöt minkä tahansa kappaleen ympärillä

seg-d1ddb76d8bf3 = <b>Tähdistösuunnittelu mittakaavassa (laji <c1/>, <c2/>).</b> Walker delta- ja Walker star -kuviot (T/P/F), eksplisiittiset elementtilistat ja monikuorisuunnitelmat, useita tähdistöjä ajoa kohti, Maan, Kuun, Marsin tai minkä tahansa muun planeetan, Pluton tai suuren kuun ympärillä lajin <c3/> lisäämistä kappalevakioista. Esiasetukset julkaistuista nimellisistä elementeistä: Global Positioning Systemin (GPS) perustaso ja laajennettava 24 paikan tähdistö (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, versio { "1.1" }), BeiDou keskikorkea Maan kiertorata Walker 24/3/1 sekä geostationaariset ja kallistetut geosynkroniset satelliitit (Open Service Performance Standard { "3.0" }) ja GLONASS 24/3/1 (Interface Control Document { "5.1" }). Kattavuus ja tarkkuuden heikkenemiskerroin (DOP) leveys-/pituusasteruudukossa: näkyvät satelliitit, GDOP, PDOP, HDOP ja VDOP (geometrinen, paikka, vaaka, pysty) ja saatavuus soluittain, globaalisti ja huonoimmalla paikalla, yksi vastaanottimen kello tähdistöä kohti. Näkyvyyden esisuodatin (kattavuuden puolikulma plus sub-satelliittileveyskaista, tarkka pallomaisella kappaleella) ajaa { "5 000" } satelliittia { "10" } asteen ruudukossa noin { "0.13" } s:ssa debug-buildissa.

seg-8f4ebd177f3d = VALIDATED: Walker-generaattori toistaa Galileo OS SDD:n taulukon { "23" } ja GLONASS ICD:n paikkakaavan; GPS-esiasetus toistaa SPS PS:n päiväntasaajan ylityssarakkeen ({ "35" }/{ "36" } paikasta { "0.0108" } asteen sisällä; E3F { "0.06" } asteen sisällä, taulukon oma rivi on epäyhtenäinen); GPS-perustason globaali HDOP-jakauma vastaa SPS PS:n liitettä B (mediaani { "0.940" } vastaan { "0.94" }, { "95" } % { "1.255" } vastaan { "1.25" }, keskiarvo { "0.965" } vastaan { "0.96" }; kynnys { "0.03" }).

seg-65658a896a73 = MODELLED: mielivaltaiset suunnitelmat, muut kappaleet, BeiDoun vaihe ja kallistetut geosynkroniset solmut, kahden kappaleen radat valinnaisella J2:lla, vain geometria.

seg-3dfe470e8a5c = Skenaariot: <c1/> ({ "102" } satelliittia, saatavuus { "100" } %, PDOP:n mediaani { "0.95" }, { "31.0" } näkyvissä yli { "10" } asteen), <c2/> ({ "5 000" } satelliittia, saatavuus { "99.22" } % PDOP:lla { "3" } tai pienemmällä yli { "20" } asteen, { "0" } % napa-alueilla, esisuodatin säilyttää { "11.5" } % paritesteistä), <c3/> ({ "14" } satelliittia Kuun ympärillä, saatavuus { "21.33" } % kokonaisuudessaan ja korkein etelänapa-alueella). Kaikki kolme on toimitettu mukana komennolle <c4/>. Huomautukset: <c5/>. Kolme uutta matriisiriviä: kaksi validoitua (Walker-generaattori ja GNSS-esiasetukset, GPS:n globaali DOP) ja yksi mallinnettu.

seg-79e2d2c42166 = Spektrimallin ohjaama kampanja ja tähdistöt minkä tahansa kappaleen ympärillä.

seg-4ab5f6f6bbbb = <c1/> ketjuttaa lajin <c2/> kellon holdoverin ja eheysvalvonnan kanssa (chirp vie L1 C/A:n ja E1:n; CW-sävy pitää sitten C/A:n alhaalla, kun E1 toipuu ja vastaanotin siirtyy pelkkää Galileoa sisältävään taivaaseen), kiinnitettynä itsenäiseen vesiputousesimerkkiin tiedostossa <c3/>. <c4/> ratkaisee nyt keskuskappaleensa kohteen <c5/> kautta, joten tähdistö voidaan sijoittaa minkä tahansa planeetan, Pluton tai suuren kuun ympärille lajin <c6/> käyttämillä vakioilla.

seg-dc904f639fed = <b>Kampanjat: monta skenaariota koottuna yhdeksi ajoksi.</b> Uusi laji <c1/> (<c2/>, dokumentoitu tiedostossa <c3/>) ajaa olemassa olevien lajien jäseniä saman komentorivin dispatchin kautta ja lukee numerot takaisin niiden tuloksista. Neljä osiota, missä tahansa yhdistelmässä:

seg-903ee141047a = <c1/>: ketjutettu tehtävä yhdellä aikajanalla. Lajikohtaiset esiasetukset lukevat kellon aikavirheen sen vartijaa vastaan, keskimääräisen tehollisen kantoaalto-kohinatiheyssuhteen (C/N0) seurantalattiaa vastaan, pystysuuntaisen suojaustason hälytysrajaa vastaan, paikkavirheen, seuraavat satelliitit ja hälytyslippuja, pidettyinä yhteisessä ruudukossa vaiherajojen ja tapahtumien kanssa. Tila siirretään eteenpäin kohteilla <c2/>, <c3/> ja <c4/>.

seg-4eeedde09a77 = <c1/>: yhdestä kolmeen pisteavainta mistä tahansa lajista, valinnaisesti siemennetyllä ensemblellä jokaisessa solmussa.

seg-4c113198cbb7 = <c1/>: realisaatio k perussiemenellä + k, keskiarvolla, hajonnalla, persentiileillä ja kiinteällä siemenellä toteutetulla bootstrap-{ "95" } %:n luottamusvälillä.

seg-df107253752d = <c1/>: jaetut arvot sidottuina useisiin jäseniin, yhdistetyllä parhaan ja huonoimman yhteenvedolla. Jokainen tulos sisältää kampanjatiivisteen ja tiivisteen kaikkien jäsentulosten yli. Neljä mukana toimitettua skenaariota: <c2/> (nimellinen, häirintä, harhautus päättyen kellovalvonnan { "370" } s:n havaitsemiseen, holdover kantaen { "37.0" } ns:n harhautettua poikkeamaa inertiayksikön vapaaliikkuessa, eheyshälytys, toipuminen), <c3/>, <c4/> ja <c5/>. <c6/> kiinnittää koostamisidentiteetit: yksivaiheinen kampanja toistaa itsenäisen ajon bitti bitiltä kolmella lajilla, kiinteällä siemenellä toteutettu ensemble on tavutason vakaa, ja valkoisen taajuuskohinan kellolla ensemblen keskiarvo on ilmoitetun välin sisällä ja hajonta khii-toiseen-välin sisällä arvolle sqrt(q_wf * tau) = { "16.459" } ns. Kolme uutta mallinnettua matriisiriviä.

seg-c611ee59301a = Animaatio

seg-14b2d3cc9e7c = <b>Animaatiovienti (<c1/>, <c2/>, <a1><c3/></a1>).</b> Mikä tahansa ajo, jonka tulos sisältää aikasarjan, voidaan nyt kirjoittaa animoituna Scalable Vector Graphics (SVG) -tiedostona (Cascading Style Sheets -avainkehykset, ei skriptiä: jäljet piirtyvät liikkuvan aikakursorin taakse), yhtenä itsenäisenä HyperText Markup Language (HTML) -soittimena (toisto ja tauko, kelaus, nopeus, jokainen paneeli yhdellä synkronoidulla kursorilla, tapahtumamerkit, jotka hakevat napsautuksella; ei ulkoista resurssia) tai numeroituna SVG-kehysjonona, jossa <c4/> ilmoittaa kuvataajuuden, keston ja kehysten ajat videokooderia varten. Kampanja toistetaan vaiheinaan hälytyksineen merkittyinä; spektriajo animoi vesiputouksensa rivi riviltä. Soitin noudattaa asetusta <c5/>, ja asetuksella <c6/> sekä SVG että soitin näyttävät valmiin kuvan liikkumisen sijaan. <c7/> ja <c8/> asettavat toiston; <c9/> ja <c10/> ovat kirjastojen sisääntulopisteet, ja <c11/> saa <c12/>-lohkon vain, kun <c13/> ajetaan. Tuloste on puhdas funktio tuloksesta ja asetuksista, tavu tavulta sama uusintaajossa, ilman aikaleimaa. Laji, jolla ei ole näytteistettyä aika-akselia, kieltäydytään käsittelemästä viestillä "no time series to animate" eikä mitään kirjoiteta. Viejä piirtää ajon omat näytteet eikä lisää mitään lukua, joten se on MODELLED (sisäinen johdonmukaisuus) eikä sillä ole varmennusmatriisin riviä; mikään julkaistu luku ei muutu. Testit: <c14/> (determinismi, kehysmäärä, ei ulkoista osoitetta, hyvin muodostettu XML, vähennetyn liikkeen polku ja jokainen mukana toimitettu aikasarjallinen skenaario animoituu).

seg-c01b78b64065 = Raportit

seg-2662fdb991f3 = <b>Laajat ajoraportit (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Jokainen komentorivikäyttöliittymän (CLI) ajo kirjoittaa nyt <c2/>:n, tulostettavan HyperText Markup Language (HTML) -raportin, ja <c3/>:n, saman sisällön koneluettavana JavaScript Object Notation (JSON) -dokumenttina. Osiot: tiivistelmä; jokainen skenaarion syöte yksikköineen, luettuna kenttäyksikkökaaviosta (tuloksen <c4/>-lohko), muuten kentän nimen jälkiliitteestä, muuten ilmoitettuna ilmoittamattomaksi; tulokset ajon kaavion, jokaisen skalaarin ja jokaisen numeerisen sarakkeen yhteenvedon kanssa; kampanjalle sweep-solmutaulukko, Monte Carlo -keskiarvo, keskihajonta, 5., 50. ja 95. persentiili ja bootstrap-luottamusväli histogrammin kanssa jokaista metriikkaa kohti, ketjun vaihetaulukko tai koostamisen jäsenet ja yhdistetty yhteenveto (sekä lajin <c5/> tai <c6/> ajon ruudukko); tapahtumien aikajana; ajon lajien käyttämän jokaisen varmennusmatriisin rivin VALIDATED / MODELLED / PARTNER -merkintä, oraakkeli ja testitodisteet, luettuna matriisista laji-rivi-ristiintaulukon kautta (rivi, joka arvioi yhden syöttöpolun, kuten lajin <c7/> Simplified General Perturbations { "4" } (SGP4) -polun tai lajin <c8/> mitatun tallenteen polun, luetellaan vain, kun ajo kulki sen polun, ja Shuttle Radar Topography Mission (SRTM) -lukijan rivi luetellaan millekään lajille, koska mikään skenaariokenttä ei lue SRTM-ruutua); ei-mallinnetut väitteet ja oletukset, kukin lainattuna lähteineen; sekä toistettavuustietue (moottorin versio, lähde-commit, kun build asettaa <c9/>:n, skenaariotiedoston ja tulosdokumentin Secure Hash Algorithm 256-bit (SHA-256) -tiivisteet, siemenluku, alusta ja tarkka komento). Raportti ei lue kelloa: sama skenaario, siemenluku ja moottoribuild antavat tavu tavulta saman raportin, ja ainoa aikaleima, jonka se voi näyttää, on se, jonka <c10/> jo kirjoittaa. Tulostustyylitiedosto sopii A4:ään ja US Letteriin, toistaa taulukkojen otsikot ja pitää rivit ja kuvat eheinä sivujen yli; Portable Document Format (PDF) -tiedosto tehdään selaimen "Tallenna PDF:ksi" -toiminnolla. Valintaa <c11/> ei ole, koska kaavioiden renderöinti PDF:ään vaatisi uuden, raskaan riippuvuuden. Testit: <c12/> raportoi jokaisen mukana toimitetun skenaarion (ei tyhjää osiota, ei paikkamerkkitekstiä, merkinnät vastaavat matriisia, skenaarion tiiviste vastaa tiedostoa, tavu tavulta sama uusintaajossa) ja <c13/> ajaa tallennetun komennon uudelleen tuoreessa hakemistossa ja vaatii tavu tavulta saman tiedoston <c14/>. Mikään julkaistu luku ei muutu, eivätkä laji-, skenaariotiedosto- ja matriisirivimäärät muutu.

seg-ce45e75c6d67 = <b>Raportti, animaatio ja viennit toimivat yhdessä.</b> Laaja raportti saa osion "Animation and exports": ajon animoitu piirros upotettuna passiivisena kuvana (tai syy, miksi sellaista ei ole), linkit sen viereen kirjoitettuihin animaatio- ja vientitiedostoihin sekä jokainen yhteentoimivuusmuoto sen kanssa, soveltuuko se, miksi ei, ja sen määritys; <c1/> sisältää saman <c2/>-lohkon. HTML-animaatiosoitin luettelee sen viereen kirjoitetut vientitiedostot. Komentorivikäyttöliittymä (CLI) renderöi nyt viennit ennen raportin kirjoittamista, jotta molemmat voivat nimetä tiedostot.

seg-c60dc5b92a60 = Yhteentoimivuusviennit

seg-5bfce52c5a13 = Yhteentoimivuusviennit ja -tuonnit (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> kirjoittaa skenaarion geometrian CZML:nä (Cesium Language), KML:nä (Keyhole Markup Language { "2.2" }, Open Geospatial Consortiumin standardi, <c2/>-aikaleimatuilla radoilla), GeoJSONina (Internet Engineering Task Force Request for Comments { "7946" }) ja Ansys STK:n (Systems Tool Kit) <c3/>-efemerideinä (<c4/>, metriä, yksi tiedosto liikkuvaa kohdetta kohti) sekä lajin <c5/> syntetisoidun IQ-näytteen (in-phase and quadrature) SigMF-parina (Signal Metadata Format) olemassa olevan <c6/>:n kautta. <c7/> kirjoittaa jokaisen soveltuvan muodon ja tulostaa, miksi muut eivät sovellu; <c8/> raportoi ajamatta. Liikkuvat kohteet kirjoitetaan Geocentric Celestial Reference Systemissä (CZML <c9/>, STK <c10/>) ja Maahan kiinnitettynä WGS { "84" } (World Geodetic System { "1984" }) -pituutena, leveytenä ja korkeutena (KML, GeoJSON); kiinteät paikat CZML:ssä ovat <c11/>. Laji <c12/> lisää kaksi häirintälähettimen jalanjälkeä omista linkkiyhtälöistään. <c13/> kirjoittaa GeoJSON-geometrian <c14/> lajien <c15/>, <c16/>, <c17/> ja <c18/> ratasyötteisiin. Viennit ovat tavutasolla deterministisiä eivätkä sisällä aikaleimaa. <c19/> validoi jokaisen viennin julkaistua määritystään vasten, vertaa viedyt satelliittitilat moottorin omiin { "1" } mm:n tarkkuudella ja ajaa jokaisen mukana toimitetun skenaarion jokaisen muodon läpi, kukin joko vie tai ilmoittaa miksi ei (taulukko tiedostossa docs/INTEROP.md). Mikään julkaistu luku ei muutu: lajin <c20/> IQ-synteesi siirtyi yhteen jaettuun funktioon ja sen tulosdokumentti on tavu tavulta sama, ja <c21/> saa <c22/> ja <c23/>, joita sen oma ajo käyttää. Laji-, skenaariotiedosto- ja varmennusmatriisimäärät eivät muutu. Rata- tai eheysskenaario ilman <c24/> ajoitetaan sen satelliittien omalla datalla: <c25/> on varhaisin TLE (two-line element set), lähetysefemeridi tai SP3 (Standard Product { "3" }) -epookki, ja jokainen tällainen satelliitti kierretään GCRS- ja Maahan kiinnitettyihin koordinaatistoihin omalla hetkellään; 2000-01-01T00:{ "00" }:00Z käytetään vain, kun mikään satelliitti ei sisällä epookkia. SP3- ja OEM-(Orbit Ephemeris Message) viennit säilyttävät merkintänsä 2000-01-01. Tämän tukemiseksi lisätään <c26/>, <c27/> ja <c28/>; mikään aiemmin olemassa ollut ei lue niitä.

seg-12c151a800f9 = Matalan Maan kiertoradan navigointi: signaali

seg-9b665682695a = <b>LEO-PNT-signaalisuunnitelmat ja monikaistainen spektri.</b> Uusi laji <c1/> ja laji <c2/>, joka ulottuu L-kaistan ulkopuolelle: yksi laji, neljä skenaariotiedostoa (kolme mukana toimitettua; Celeste IOD -tiedosto on vain repositoriossa) ja neljä matriisiriviä (kaksi VALIDATED, kaksi MODELLED).

seg-b355b28bfd1b = <c1/>: parametrisoidut matalan Maan kiertoradan (LEO) paikannus-, navigointi- ja ajanmääritys (PNT) -signaalisuunnitelmat mille tahansa järjestelmälle (kaista, lähetyskaistanleveys, ITU-allokaatio; hankinta-, data- ja pilottikomponentit BPSK(n)-, BOC(m,n)-, MBOC- tai tasaspektrein, tehoosuudet, FDMA-aliaaltoalueet, koodipituudet ja datanopeudet), käännettyinä mukaan julkisista esiasetustiedostoista kansiossa <c2/> (Xona Pulsar X1/X5, Iridium STL, Starlink-opportunistinen signaali, CentiSpace, edustava C-kaistan suunnitelma ja edustavat UHF/L/S/C/leveä-C-suunnitelmat, kukin kukin lähde-URL:ineen) tai kirjoitettuina suoraan. Signaalia kohti: kaistarajoitettu PSD ja kaistansisäiset tehoosuudet, Gaborin kaistanleveys, kaistarajoitettu early-late-koodiseurannan jitter suhteessa C/N0:aan ja välistykseen (Betz & Kolodziejski { "2009" }) ja etäisyysmittaustarkkuus, hankinnan hakuavaruus, havaitsemistodennäköisyys ja keskimääräinen sarja- ja koodirinnakkaishankinta-aika, SSC GPS L1 C/A:han, Galileo E1:een, GPS L5:een, Galileo E5a:han, E5b:hen ja AltBOC:iin ja niistä C/N0-häviöllä, CW-, laajakaistainen ja sovitettu J/S-sieto spektrilajin SSC-koodista, kaistakompromissi (ionosfäärinen viive, vapaan tilan vaimennus, etäisyysmittaus yhtäläisellä C/N0:lla ja yhtäläisellä EIRP:llä, häirinnänsieto) sekä valinnaiset muototarkistukset kuvattua mittausta vasten. Esimerkit: <c3/>, <c4/>, <c5/> (Celeste IOD -kaistat ja signaalikonfiguraatio, jotka esitettiin ESA NAVISP LEO-PNT -työpajassa, { "2026" }; pidätetty Celeste IOD -esiasetuksen mukana, katso "LEO-PNT end to end" alla). Huomautukset tiedostossa <c6/>.

seg-8f58debf721f = <c1/>: kaistat voivat nyt olla esiasetettu signaalisuunnitelma (jokainen komponentti piirretty, kaistarajoitettu, C/N0 ja J/S viitattu seurattuun komponenttiin) tai mukautettu kantoaalto ja modulaatio; <c2/> lisäävät vesiputouksia muille taajuusalueille yhdellä aikajanalla; <c3/> (barrage) -häirintälähetin liittyy neljään aaltomuotoon. Raportti lisää <c4/>, <c5/> ja <c6/> sekä yhden <c7/>-merkinnän. Tavalliset kaistat antavat samat luvut kuin ennen. Esimerkki: <c8/>.
