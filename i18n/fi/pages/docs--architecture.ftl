# docs--architecture: translations (fi)

seg-e366c6dd500e = Lähde: <c1/>

seg-1f25b7fa1187 = Kshana — Arkkitehtuuri

seg-b0136a82669c = Kshana on <b>yksi moottori</b>, joka on järjestetty kerroksiin jaetun ytimen päälle: <b>anturipaketit</b> (kello, inertia, ajansiirto, hybridi); <b>astrodynamiikan / numeerinen</b> kerros (analyyttinen SGP4/SDP4 (SGP4: Simplified General Perturbations { "4" }; SDP4: Simplified Deep-space Perturbations { "4" }), numeerinen Cowell-propagaattori seitsemän häiriön voimamalleineen, ratamuutossuunnittelu, radanmääritys maa-asemien etäisyyksistä ja voimamallin sovitus virastojen tarkkoihin efemerideihin); <b>aika- ja koordinaatistokerros</b> (IERS (International Earth Rotation and Reference Systems Service) aika-asteikot, IAU (International Astronomical Union) 2006/2000A prekessio–nutaatio ja CIO (Celestial Intermediate Origin) GCRS↔ITRS (GCRS: Geocentric Celestial Reference System; ITRS: International Terrestrial Reference System) -redukointi); <b>fuusiokerros</b> (GNSS/INS (GNSS: maailmanlaajuinen satelliittinavigointijärjestelmä; INS: inertianavigointijärjestelmä) -estimaattorit); sekä <b>eheys-, kestävyys-, vaihtoehtoisen PNT:n (PNT: paikannus, navigointi ja ajanmääritys) ja Kuun</b> kerrokset (RAIM/ARAIM/SBAS (RAIM: receiver autonomous integrity monitoring; ARAIM: advanced receiver autonomous integrity monitoring; SBAS: satelliittipohjainen täydennysjärjestelmä), häirintä ja monikerroksinen harhautuksen havaitseminen, gravitaatio-, maasto- ja magneettikarttasovitus sekä kuunläheinen PNT); ja uudemmat kerrokset: <b>LEO-PNT</b> (matalan Maan kiertoradan PNT), <b>spektri</b>, <b>aurinkokunta ja tähdistösuunnittelu</b>, <b>verkkoajoitus</b> ja <b>kampanjat</b>, sekä raportti-, animaatio- ja yhteentoimivuuskirjoittimet, joita jokainen ajo voi käyttää (§1d). Kaikissa näissä moottori ei tiedä mitään ”kvantti” vs ”klassinen” -erosta: se ajaa anturien <em>virhemalleja</em> GNSS-katkoskenaarion läpi, ajaa estimaattorin ja pisteyttää lopputuloksen. Kvanttilaite ja klassinen laite vertaillaan siksi samassa skenaariossa, ja ne eroavat vain (julkaistujen, siteerattujen) virheparametriensa ja riippumattomien kohinasiemenlukujensa osalta.

seg-02110864419e = Tämä asiakirja kokoaa rakenteelliset ja käyttäytymiskaaviot. §{ "1" } on anturipakettiydin; §1a kartoittaa sen jälkeen lisätyt astrodynamiikan, fuusion ja vaihtoehtoisen PNT:n kerrokset; §1b–§1d tutkimus-, aluekerrokset ja tulostekerrokset. Käyttöä varten katso <a1>README</a1>; sen, mikä on ja mikä ei ole validoitu, osalta <a2>VALIDATION</a2>; ominaisuuskohtaiselle kypsyystaulukolle <a3>CAPABILITY</a3>.

seg-7bcc7b5cd049 = Kaavioissa käytetyt lyhenteet, joita ei ole avattu niiden esiintymiskohdassa: ADEV, Allanin poikkeama; BW, kaistanleveys; CAI, kylmäatomi-interferometri; CZML, Cesium Language; Δ-DOR, delta differential one-way ranging; DO-229E, RTCA (Radio Technical Commission for Aeronautics) SBAS-vastaanotinstandardi; EKF, laajennettu Kalman-suodatin; FM, taajuusmodulaatio; GSE, maatukilaitteisto; HPL/VPL, vaaka-/pystysuojaustaso; IMU, inertiamittausyksikkö; IOAG, Interagency Operations Advisory Group; IQ, vaihe-/kvadratuurinäytteet; ISL, satelliittien välinen linkki; ITU-T, Kansainvälisen televiestintäliiton telealan standardointisektori; J2–J6, Maan zonaaliset gravitaatioharmoniset asteilla { "2" }–{ "6" }; KIF, Kshana Interchange Format; KML, Keyhole Markup Language; KPI, keskeinen suorituskykymittari; L1/L5, GNSS-kantoaaltokaistat (CR3BP-haloratojen L2 on sen sijaan Maa–Kuu-Lagrangen piste { "2" }); LEO, matala Maan kiertorata; LOO, yksi-pois-menetelmä (leave-one-out); LTC, Kuun koordinoitu aika (Coordinated Lunar Time); MEO, keskikorkea Maan kiertorata; MTIE, suurin aikavälivirhe; N2, kertaluvun 2 Hillin diversiteettiluku; NED, pohjoinen-itä-alas; NTN, ei-maanpäällinen verkko; OD, radanmääritys; OPS-SAT, Euroopan avaruusjärjestön kiertoradalla toimiva ohjelmistolaboratoriosatelliitti; PPP, tarkka pistepaikannus; PSD, tehospektritiheys; PVT, paikka, nopeus ja aika; RINEX, Receiver Independent Exchange Format; RK4 / RK5({ "4" }), neljännen asteen ja upotettu viidennen (neljännen) asteen Runge–Kutta-integraattorit; SH, palloharmoninen; SigMF, Signal Metadata Format; SIR, sampling importance resampling; SRIF, neliöjuuri-informaatiosuodatin; SRP, auringon säteilypaine; SSC, spektrierotuskerroin; STK, Systems Tool Kit; SVG, Scalable Vector Graphics; TDEV, aikapoikkeama; TDM, CCSDS (Consultative Committee for Space Data Systems) Tracking Data Message; TLE, kaksirivinen elementtijoukko; TPL, ajoituksen suojaustaso; UBX, u-blox-binääriprotokolla; UHF, ultrakorkeat taajuudet; VLBI, pitkäbaselinjainen interferometria; VRW / ARW, nopeuden / kulman satunnaiskävely; WASM, WebAssembly.

seg-a87f668a8f97 = { "1" }. Moduulirakenne

seg-0388999448a6 = CLI (komentoriviliittymä) ja molemmat sidokset kulkevat yhden sisäänkäyntipisteen <c1/> kautta, joten ne eivät koskaan eriydy. Paketit käyttävät jaettua ydintä uudelleen (<c2/>, <c3/>, <c4/>); paketti { "4" } (<c5/>) yhdistää pakettien { "1" }–{ "3" } mallit ja estimaattorit eikä toteuta niitä uudelleen; <c6/> johtaa GNSS-aikajanan geometriasta, joka syöttää sitten paketin { "1" } ajon. Moduuli <c7/> sijaitsee signaalitasolla linkkibudjetin ja mittausalueen välissä: se johtaa spektrierotuskertoimen <c8/> todellisista signaalin ja häirintälähteen tehospektreistä, ja siitä <c9/> laskee nyt häirinnänestonsa <c10/> edustavan vakion ottamisen sijaan (ristiintarkistettu CI:ssä (jatkuva integrointi)); se sisältää myös paikannuskoodin (m-sekvenssi/Gold) suunnittelukompromissin.

seg-cee4eb61a8e9 = Kolme muuta moduulia muodostavat <b>GNSS-estoympäristön kestävyyden</b> selkärangan. <c1/> vastaa operatiiviseen kysymykseen suoraan — <em>kuinka kauan tämä kello voi käydä vapaasti, ennen kuin sen aikavirhe ylittää budjetin?</em> — esittämällä van-Loanin vapaaliikevirheen suljetun muodon holdover-kynnys-inversiona, ristiintarkistettuna monivaiheista kovarianssirekursiota <c2/> vastaan. Sen inertiakaksonen sijaitsee moduulissa <c3/> (<c4/>), joka yhdistää kylmäatomi-interferometrin valkoisen kohinan ajautuman harhan ja skaalakerroinvirheen kanssa sijainnin ajautuma-holdover-budjetiksi (harhatermi ristiintarkistettu riippumatonta integraattoria <c5/> vastaan). <c6/> renderöi koko moottorin vaatimus–moduuli–testi–oraakkeli–tila-matriisin, jossa yksikkötestatut invariantit kieltävät <em>validoitu</em>-merkinnän ilman riippumatonta ulkoista oraakkelia — joten varmuusväite ei voi ajautua koodista.

seg-c7bee352c04d = 1a. Astrodynamiikan, fuusion ja vaihtoehtoisen PNT:n kerrokset

seg-99c44e3a86d5 = Anturipakettiytimen lisäksi kolme alijärjestelmää jakavat saman jaetun ytimen ja syöttävät (tai saavat syötteen) moduulilta <c1/>. <b>Astrodynamiikan / numeerinen</b> kerros lisää ei-analyyttisen Cowell-propagaattorin analyyttisen SGP4/SDP4-polun rinnalle; <b>fuusiokerros</b> kantaa GNSS/INS-estimaattorit; ja <b>vaihtoehtoisen PNT:n</b> kerros on GPS-estoympäristön (GPS: Global Positioning System) gravitaatiokarttasovitus. Nämä ovat kirjasto-/skenaariokykyjä (katso <a1>CAPABILITY</a1>, mitkä on kytketty skenaariotyyppiin <c2/> ja mitkä ovat tavoitettavissa Rust-API:na (ohjelmointirajapinta)).

seg-69f93294d2c8 = Numeerisen propagaattorin voimatermit ovat oletuksena pois päältä, joten niiden käyttöönotto ei koskaan häiritse julkaistuja golden-tiedostoja. 17-tilainen tiukasti kytketty UKF (unscented Kalman filter) ylittää GNSS-katkon kvantti-CAI-kiihtyvyysmittarin johdetun nopeuden satunnaiskävelyn varassa; radanmääritys käyttää samoja <c1/>/<c2/> ehdokastilan propagointiin seurantakaaren yli.

seg-bd87e20c284b = Sama jaettu ydin kantaa myös neljää muuta alijärjestelmää, joita ei ole piirretty yllä (niiden paketit esiintyvät kohdan §{ "4" } dispatchissa): <b>aika- ja koordinaatistokerros</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>), joka redusoi TEME↔GCRS↔ITRS (TEME: true equator, mean equinox) ja syöttää pakettia <c8/> / maanpintajälki; <b>eheyskerros</b> (<c9/>, <c10/>) RAIM/ARAIM/SBAS:lle; <b>kestävyyskerros</b> (<c11/>, <c12/>, <c13/>, <c14/>, <c15/>) häirinnälle ja monikerroksiselle harhautuksen havaitsemiselle, sekä <b>navigointisignaalikerros</b> (<c16/>) signaalitasolla — BPSK-R (BPSK: binary phase-shift keying) / sini-BOC (BOC: binary offset carrier) -tehospektritiheydet, spektrierotuskerroin <c17/>, joka johtaa nyt moduulin <c18/> häirinnänestosuhteen <c19/>, RMS (Gabor) -paikannuskaistanleveys, koherentti early–late DLL (delay-locked loop) -koodinseurantajitteri ja monitie-virheen verhokäyrä (signaalisuorituskykyanalyysi, <b>ei</b> RF-hyötykuorman (RF: radiotaajuus) / antennilaitteiston suunnittelua — hyötykuormakumppanin rooli); ja <b>Kuun / kuunläheinen</b> kerros (<c20/>, <c21/>, <c22/>, <c23/>) CR3BP (circular restricted three-body problem) -dynamiikalle — mukaan lukien { "6" }×{ "6" } tilansiirtomatriisi ja yhden ammunnan differentiaalikorjain (<c24/>, <c25/>, <c26/>), joka tuottaa aidosti jaksollisia halo-/NRHO (NRHO: near-rectilinear halo orbit) -ratoja, toistaen julkaistun L2-eteläisen { "9" }:{ "2" } NRHO:n (Gateway-rata) jaksolla ≈ { "6.57" } d / perilune ≈ { "3,250" } km (julkaistu ≈ { "6.56" } d / ≈ { "3,370" } km); korjatun radan selenosentrinen MCI/MCMF (MCI: Kuun keskipisteeseen sidottu inertiaali; MCMF: Kuun keskipisteeseen sidottu, Kuuhun kiinnitetty) -muunnos ja perhejatkuminen ovat jatkotöitä, ja NRHO on CR3BP-ratkaisu (ympyrärata, Auringoton), ei validoitu todellista LANS/Gateway (LANS: Lunar Augmented Navigation Service) -efemeridiä vasten — sekä LunaNet-eheys. Virastoefemeridin voimamallisovitus (<c27/>, <c28/>, <c29/>, <c30/>) ja täysi vaihtoehtoisen PNT:n kenttäjoukko (<c31/>, <c32/>, <c33/>) täydentävät moduulilistan; katso moduulikohtainen kypsyys <a1>CAPABILITY</a1>.

seg-05f8c8c84d15 = 1b. Kestävyystutkimukset, koneoppimisen arviointi ja toistettavat artefaktit

seg-7350971daf4e = Viisi muuta moduuliryhmää muodostavat projektin tutkimusjulkaisujen takana olevan <b>avoimen, toistettavan tutkimuksen</b> kerroksen. Toisin kuin skenaariotyypit (<c1/>), näihin päästään generaattoreina <c2/> / <c3/>, jotka kirjoittavat <b>tavu tavulta deterministisiä</b> artefakteja (kiinteät siemenluvut, tallennettu moottorin versio + konfiguraation hash). Kaikki ovat <b>MODELLED</b> (synteettinen tai julkisen aineiston kalibrointi) ja niillä on rehelliset validointimerkinnät — mikään niistä ei ole sertifiointi.

seg-86b177166f0e = <b><c1/></b> — ehdollinen ajoituksen suojaustaso (TPL): holdover-rajoitettu raja <em>havaitsemattomalle</em> aikavirheelle harhautuksen alla, joka yhdistää k-σ-monitorilattian, van-Loanin vapaaliikevarianssin havaitsemisviiveen yli ja CUSUMin (cumulative sum) hälytysajan; kalibroitu todelliseen tallennettuun harhautukseen (JammerTest { "2024" }). Äärellistä <em>ehdotonta</em> rajaa ei ole — TPL on ehdollinen sille, että riippumaton ristiintarkistus havaitsee hyökkäyksen.

seg-8c9d1d90dc8e = <b><c1/></b> — kehykseen kohdistettu PNT-kestävyyden pisteytysmoottori (DHS (Department of Homeland Security) RPCF (Resilient PNT Conformance Framework) -kategoriat) sekä päätösepästabiilisuustutkimus: Dirichlet-painotussimpleksi, Kendall-τ-järjestysepästabiilisuus, top-1-voittajan vaihtumistaajuus ja yhteismoodinen <b>diversiteettiromahdus</b> (Hill-N2), eheyshashattu varmuusraportti ja { "35" } käsin johdettua oraakkelitestiä. Katso <a1>RESILIENCE-CROSSWALK</a1>. Synteettiset RPCF v2.0:aan kohdistetut arkkitehtuurit — itsearviointi, ei sertifiointi.

seg-b347924b874e = <b><c1/> / <c2/> / <c3/> / <c4/></b> — RF-häiriöiden optimismikuilututkimus: nimetty synteettinen korpus ja detektoriagnostinen ROC/AUC (ROC: receiver operating characteristic; AUC: area under the curve) -testikehys, 13 detektorin paneeli (energia/AGC/SQM/pariteetti (AGC: automatic gain control; SQM: signal-quality monitoring) sekä siemenluvulla alustetut logistinen regressio ja yhden piilokerroksen MLP (MLP: multi-layer perceptron) -detektorit), jakaumassa ja jakauman ulkopuolella skaalauslait permutaationollalla sekä leave-one-out-ennustaja jakauman ulkopuolisen heikkenemisen ennustamiseen. Arviointimittarit on validoitu bitti bitiltä scikit-learnia vasten.

seg-36206681024f = <b><c1/> / <c2/></b> — ohjelmistovastaanottimen etupää (raaka IQ/IF (IQ: vaihe/kvadratuuri; IF: välitaajuus) → korrelaattorin early/prompt/late-tapit → SQM) ja sisäänluku-adapterit (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid), joiden avulla samat detektorit voivat toimia paikallisesti toimitettujen tallenteiden yli; repositorioon ei ole commitoitu aineistoja.

seg-fefd78868fc2 = <b><c1/> / <c2/></b> — kvantti vs klassinen -kestävyyden ristikkäisyyskartta parametrien epävarmuuden alla sekä mitatun ADEV:n holdover-hyötykompromissi; kompromissin numeeriset ytimet on validoitu scipyä vasten.

seg-5749f1300772 = 1c. Eheys-, GNSS-, syväavaruus-, Kuu- ja tehtäväkerrokset

seg-f44755d6d921 = Loput alueet kytkeytyvät samaan dispatchiin (<c1/>) ja käyttävät uudelleen jaettua ydintä, koordinaatistoja ja geometriaa. Kaikki tässä on <b>MODELLED</b>, ellei matriisin (<c2/>) rivi viittaa ulkoiseen oraakkeliin (RAIM-ydin vs SciPy, SBAS vs RTKLIB (avoimen lähdekoodin reaaliaikaisen kinemaattisen paikannuksen kirjasto) -fork, gnss_lib_py DOP (tarkkuuden heikkenemiskerroin) -ydin, OPS-SAT-arviointi, Kuun ARAIM-suojaustasoydin, palveluntarjoajien välinen Kuun efemeridien johdonmukaisuus) — loput Kuun sarjasta ja kvanttidemonstraattori ovat mallinnettuja, havainnollistavia, julkisiin lähteisiin perustuvia, eikä niissä esitetä TRL (technology readiness level) -, perintö- tai virastohyväksyntäväitettä.

seg-044940c8d052 = 1d. LEO PNT, spektri, aurinkokunta, verkkoajoitus, kampanjat ja tulosteet

seg-253a26d9cc5d = Uusimmat kerrokset noudattavat samaa mallia: kukin on yksi tai useampi skenaariotyyppi (<c1/>), joka ohjataan moduulin <c2/> kautta, rakennettu jaetun ytimen päälle, ja MODELLED, ellei matriisirivi nimeä ulkoista oraakkelia.

seg-e47cccd54da3 = Tyyppikohtaiset yksityiskohdat ovat tiedostoissa <a1>LEO-PNT</a1>, <a2>LEO-SIGNAL</a2>, <a3>LEO-PASS</a3>, <a4>LEO-NAVMSG</a4>, <a5>LEO-PNT-FUSION</a5>, <a6>SPECTRUM</a6>, <a7>CONSTELLATION-DESIGN</a7>, <a8>TELECOM-TIMING</a8>, <a9>SLOT-TIMING</a9>, <a10>CAMPAIGNS</a10>, <a11>REPORTS</a11>, <a12>ANIMATION</a12> ja <a13>INTEROP</a13>.

seg-d04b21c7cb6c = 1e. Vastaanottimen luottamus-, todiste-, telemetria-, harjoitus- ja compliance-kerrokset ({ "0.35" })

seg-84ee122959b4 = Nämä kerrokset lukevat vastaanottimen oman lokin tai kirjoittavat tiedostoja muille työkaluille; mikään niistä ei syntetisoi eikä lähetä radiotaajuista signaalia. Ne sijaitsevat moduulin <c1/> rinnalla eikä skenaariotyyppien alla, lukuun ottamatta tyyppiä <c2/> itseään, joka on skenaariotyyppi. Kaikki ovat MODELLED, ellei matriisirivi nimeä ulkoista oraakkelia, ja meriliikenteen tulosteet ovat ohjeellisia, eivät tyyppihyväksyttyä navigointilaitetta.

seg-aab745a65e76 = Moduuli

seg-9d17ad3e87c8 = Dokumentaatio

seg-920b6b14c0e2 = pisteyttää vastaanottimen lokin epookki epookilta luottamusmonitoreilla; alusalusta lisää merenkulun monitorit ja 0–100-pistemäärän syineen

seg-a77d1a8a62b5 = <a1>RECEIVER-TRUST</a1>, <a2>MARITIME-TRUST</a2>

seg-c311dfc2a161 = sama pisteytys virralle sen saapuessa (stdin, liitettävä tiedosto, TCP tai UDP), lause <c1/> ja valinnainen portti; <c2/> on sen ydin ilman syötettä tai tulostetta

seg-07b2d6edf7b9 = allekirjoitettu, hash-ketjutettu paketti lokin ikkunasta, sen konfiguraatiosta ja moottorin tuloksesta, todennettavissa offline-tilassa; valinnainen RFC { "3161" } -aikaleimatunniste

seg-32d08730b9c0 = luottamusvirta Prometheus-mittareina, syslog-tapahtumina (CEF tai LEEF) ja valinnaisena OpenTelemetry-tietona (ominaisuus <c1/>, oletuksena pois käytöstä)

seg-53311b8c3b93 = synteettinen sillan NMEA { "0183" } käsikirjoitetuin häirintä-, drag-off-, aikaharhautus- ja toistotapahtumin sekä ohjaajan lokilla, miehistön koulutukseen (vain teksti)

seg-f7cc3cfbdfc6 = koosteiset heikentyneen navigoinnin kartat avoimesti lisensoiduista ilma-alusten ja alusten raporteista sekä reitin altistuminen niille; vain paikalliset tiedostot

seg-83fe3c87e2d5 = vastaanotinpuolen varmennin Galileo OSNMA:lle: lukee I/NAV-sivut (pelkät sivut, vektori-CSV, UBX-virta), tarkistaa allekirjoitetun avaimen, TESLA-ketjun ja MAC-arvot ja ilmoittaa satelliittikohtaisesti, onko navigointidata todennettu; <c1/> on se yksi polku, jonka komentorivi, Python ja WebAssembly jakavat; vain todennuksen tila, ei eheyspalvelu

seg-bf8cd5a45deb = OSNMA

seg-843a83b82283 = kartoittaa Kshana-tulosteet julkisiin kestävyyden viitekehyksiin ja täyttää kartoituksen tulosasiakirjoista; <c1/> ja <c2/> ottavat vastaan tekstejä, eivät polkuja

seg-e16c483479ce = skenaarion ajoneuvon liike ja tapahtumat liike-CSV:nä, NMEA:na, reittipistetekstinä ja tapahtumatiedostoina laboratorion GNSS-simulaattoria varten; signaalia ei kirjoiteta

seg-044c58c98397 = Veneiden integraatiot (Signal K -lisäosa, OpenCPN gate mode ja viiterakennus) kutsuvat komentorivityökalua; katso <a1>MARINE-INTEGRATIONS</a1>.

seg-cb8d8ff847eb = { "2" }. Moottorin käsittelyketju (ajoa kohden)

seg-53e9e596ca44 = Jokainen ajo askeltaa yhtä anturimallia aikaruudukon läpi: sitä ohjataan aina, kun GNSS on nominaali, ja sen annetaan käydä vapaasti (holdover / dead-reckoning) katkon aikana.

seg-257407f3c375 = Skenaario ajaa tämän ketjun kahdesti — kerran kvanttianturille, kerran klassiselle anturille — <b>riippumattomilla siemenluvuilla</b> (<c1/>), jotta nämä kaksi kohinatoteumaa ovat korreloimattomia.

seg-4659e89ba5f5 = { "3" }. Virhemallirajapinta (laajennuskohta)

seg-7b70e8b1b98a = Jokainen anturi toteuttaa saman ajatuksen: tilallinen olio, jonka metodi <c1/> etenee sen sisäistä stokastista virhettä ja jonka kertynyt tila luetaan ulos jokaisella tahdilla. Kellot paljastavat kertyneen vaiheen; kiihtyvyysmittarit kaksoisintegroidun paikan; linkit mittauskohtaisen jitterin.

seg-79ab76c6dbc0 = <c1/> kulkeutuu tulokseen, joten jokainen tulosteen luku on jäljitettävissä julkaistuun lähteeseen, joka mainitaan kentässä <c2/>.

seg-514c49659947 = Analyyttisen estimaattorin <c1/> rinnalla kellopaketti ajaa kaksitilaisen (vaihe, taajuus) Kalman-suotimen (<c2/>), jonka prosessikohina vastaa totuusmallia. Katkon läpi liukuessaan sen vaihevirheen varianssi kasvaa täsmälleen arvoon <c3/> — analyyttinen holdover-relaatio — ja sen online-1-σ-rajaa käytetään täyttämään <b>Eheys</b>-laatumittari (osuus katkon näytteistä, joissa virhe pysyy k-σ-rajan sisällä).

seg-7404589deb40 = { "4" }. Välitys (CLI ja sidonnat)

seg-6138513a43f7 = <c1/> on yksittäinen sisääntulopiste: se katsoo ylätason kentän <c2/>, deserialisoi vastaavan skenaarion, ajaa paketin ja palauttaa <c3/> (<c4/> on mukana vain niissä lajeissa, jotka julkaisevat toistettavuustaulukon). CLI kirjoittaa nämä tiedostoihin sekä raportin (<c5/>, <c6/>) ja mahdolliset tulosteet, jotka tuotetaan valitsimilla <c7/> / <c8/>; Python- ja WebAssembly-sidonnat palauttavat ne isännälle. Yksi välitys, ei ajautumista erilleen.

seg-524f749be364 = Välitys perustuu tyypitettyyn enum-tyyppiin <c1/>, joka käydään läpi tyhjentävästi (ks. seuraava alaluku), joten paketin lisääminen on kääntäjän tarkistama muutos. Puuttuva <c2/> korvautuu paketilla <c3/>, joten nykyiset yhden lajin skenaariot deserialisoituvat muuttumattomina (<c4/> ohittaa kentän <c5/> jokaisessa skenaariorakenteessa). Tunnistamaton <c6/> hylätään virheellä <c7/>, joka nimeää lähimmän sisäänrakennetun lajin, kun nimi näyttää kirjoitusvirheeltä.

seg-eedaeae2a7e7 = Tyypitetty välitys ja jäsennelty API

seg-ca47f566eaee = Välitys perustuu tyypitettyyn enum-tyyppiin <c1/>, ei raakaan merkkijonovertailuun: <c2/> ratkaisee kentän <c3/> varianttiin, ja välittäjä käsittelee sen tyhjentävästi — paketin lisääminen on kääntäjän tarkistama muutos, ei merkkijonon kirjoitusvirhe. Kaksi tyypitettyä pintaa on merkkijonon palauttavan funktion <c4/> rinnalla (säilytetty CLI:tä ja nykyisiä sidontoja varten):

seg-167c47049329 = <b><c1/></b> — tyypitetty sisääntulo, jossa on jäsennelty virhetaksonomia (<c2/>, <c3/>, <c4/>, <c5/>). Jokaisella virheellä on vakaa <c6/>, jotta kutsuja voi haarautua virheluokan mukaan viestiä jäsentämättä. Sidonnat tarjoavat tämän nimellä <c7/>.

seg-1943051b3b20 = <b><c1/></b> (ja <c2/>, joka on sidonnoissa nimellä <c3/>) — ohjelmallinen introspektio: kunkin lajin nimi, kuvaus sekä pakolliset ja valinnaiset kentät käyttöliittymän (UI) ja muistikirjan automaattitäydennystä varten.

seg-630243592256 = Kshana-ohjelmiston laajentaminen ulkoisella paketilla

seg-d1adedd2c08b = Kolmannen osapuolen paketti toteuttaa kaksi pientä, semver-vakaata traittia moduulista <c1/>:

seg-d01471b13324 = Tyyppi <c1/> sisältää myös oletusmetodin <c2/>, joka ei tee mitään, ellei paketti ota käyttöön rekisterivälityksen saumaa kohdassa <c3/>. Sisäänrakennettu paketti <c4/> on kytketty tyypin <c5/> kautta esimerkiksi; ulkopuoliset paketit noudattavat samaa sopimusta ilman ytimen haarauttamista (peilaten laajennuskohtaa <c6/> luvussa §{ "3" }, jota yksityinen kestävyyskerros käyttää).

seg-5b0449d96bc3 = Näin ollen Kshana-ohjelmistossa on <b>kaksi vakaata laajennussaumaa</b> — lisää <em>anturi</em> toteuttamalla <c1/> (§{ "3" }), tai lisää kokonainen <em>skenaariolaji</em> toteuttamalla <c2/> + <c3/> — molemmat ovat semver-vakaita, eikä kumpikaan vaadi ytimen haarauttamista:

seg-3928a007756b = { "5" }. Hybridin huipentuma

seg-7f38e825519a = Hybridipaketti ajaa <em>sarjan</em> (yksi kello + yksi inertiaanturi) ja vaatii, että <b>sekä</b> aika että paikka pysyvät spesifikaatiossa; <c1/> on aika, kunnes jompikumpi ylittää rajan. Valinnaisesti optinen satelliittien välinen linkki synkronoi <b>kellon</b> uudelleen katkon aikana — vain ajan tuki; paikkaa ei synkronoida uudelleen, koska ajansiirto antaa ajan, ei paikkaa. Tämä erottaa inertiaanturin rajoittavaksi tekijäksi.

seg-17a8683f0982 = { "6" }. Geometriasta johdettu GNSS-saatavuus

seg-afdb141ac367 = <c1/> on deterministinen, riippuvuuksista vapaa geometriakerros. <c2/> on joko analyyttinen Kepler-rata <c3/> (kahden kappaleen, valinnaisesti sekulaarinen J2) tai täysi <c4/>-propagaattori, joka on rakennettu täydestä kaksirivisestä elementtijoukosta; Walker-delta-generaattori tuottaa synteettisiä tähdistöjä, ja näkölinjan näkyvyys = Maan peittämä alue + korkeuskulmamaski. Näkyvien satelliittien lukumäärä kuvautuu GNSS-tilaksi (≥{ "4" } = nominaali, { "1" }–{ "3" } = heikentynyt, { "0" } = estetty), ja <c5/> muuttaa sen saatavuusaikajanaksi, joka ohjaa tavallista kellon holdover-ajoa. Saatavuus on siis <em>johdettu geometriasta</em> eikä käsin kirjoitettu, kun taas ajo, estimaattori ja pisteytys pysyvät ennallaan.

seg-da82c97ac5c8 = Täysinä TLE-tietoina annettu tähdistö propagoidaan SGP4/SDP4-mallilla tiedostossa <c1/> (validoitu AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 -vektoreita vastaan); vain rivin 2 elementit säilyttävät analyyttisen kahden kappaleen polun. Nämä kaksi voi sekoittaa yhdessä tähdistölohkossa.

seg-a47031620b54 = { "7" }. Sidonnat

seg-57fb29fdd9d9 = Ydin kääntyy muuttumattomana natiiviksi, Python-laajennukseksi ja WebAssemblyksi. Python-moduuli (<c1/>, PyO3 abi3) ja WebAssembly-moduuli (<c2/>, wasm-bindgen) ovat valinnaisia, ominaisuuslipuilla rajattuja riippuvuuksia (<c3/> / <c4/>): oletusrakennus ja testisarja eivät koskaan käännä niitä, kun taas riippuvuustarkastusportti (<c5/>) tarkastaa niiden riippuvuuspuut, koska nämä crate-kirjastot toimitetaan wheelin ja npm-paketin sisällä. Molemmat kutsuvat funktiota <c6/>, joten jokainen pinta palauttaa identtiset tulokset. WebAssembly-moduuli tukee selainhiekkalaatikkoa hakemistossa <c7/> ja vie kolmetoista funktiota: <c8/>, <c9/> (yksi moottoriajo, joka palauttaa tuloksen, kaavion, yhteenvedon ja taulukon yhdessä), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, jaettavan URL-osoitteen (URL: web address) koodekki <c16/> / <c17/> sekä kolme viejää <c18/> / <c19/> / <c20/>, jotka tukevat hiekkalaatikon vientivalikkoa. Kaksi muuta etuovea ulottuu samaan rajapintaan <c21/>: <b>MCP-palvelin (Model Context Protocol)</b> (<c22/>, työtilan ulkopuolelle rajattu crate <c23/>, joka tarjoaa viisitoista työkalua — <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>; kaksi esimerkkityökalua lukee mukana toimitetut skenaariot kirjaston oletuksena pois päältä olevan ominaisuuden <c39/> kautta, jonka vain tämä palvelin ottaa käyttöön) ja <b>JetBrains IDE -lisäosa (integrated development environment)</b> (<c40/>, Kotlin-projekti, joka kutsuu CLI-työkalua <c41/> kirjastoon linkittämisen sijaan).

seg-a6620e0d6eef = Ominaisuuslippujen käyttö: Python ja WASM ovat <c1/> / <c2/>; mukana toimitettu skenaariotaulukko on <c3/> (MCP-palvelimen ainoa käyttötapa); MCP-palvelin ja ristiintarkistukset (<c4/>) ovat työtilan ULKOPUOLELLE JÄTETTYJÄ crate-kirjastoja; IDE-lisäosa ei linkitä mitään — se ajaa CLI:tä.

seg-7bc5df56e4e5 = { "8" }. Determinismi ja toistettavuus

seg-fb95c37c7bb9 = Kaikki satunnaisuus kulkee yhden, siemenluvulla alustetun generaattorin <c1/> kautta ajoa kohden; askeltamisjärjestys on kiinteä, joten <c2/>.

seg-e026c87beb26 = Tulos sisältää SHA-256-arvon (SHA: Secure Hash Algorithm) <c1/>; skripti <c2/> ajaa viiteskenaarion kahdesti ja varmistaa, että tuloste on tavu tavulta identtinen.

seg-42a3bdcbd99f = Sama moottori kääntyy natiiviksi, Python-laajennukseksi ja kohteeksi <c1/> selaimen sisäisiä ajoja varten, ja tuottaa samat luvut.

seg-12e00717c2d4 = { "9" }. Lykätty / tuleva rakenne

seg-8a8e1b93b704 = Luvun §1a astrodynamiikka-, fuusio- ja alt-PNT-kerrokset — täysi SGP4/SDP4-propagaattori, numeerinen Cowell-propagaattori seitsemän häiriön voimamallilla ja kahdella adaptiivisella integraattorilla, manööveri-/lentoratasuunnittelu, radanmääritys, 15-/8-/17-tilaiset GNSS/INS-estimaattorit, kytketty kello+paikka-suodin ja painovoimakarttasovitus — on kaikki toimitettu, samoin kuin turvallisuuden laatumittari aktiivisella harhautusdemonstraattorilla, aito TLE-/monitähdistögeometria, Monte Carlo -kaistat, kompromissitutkimusten pyyhkäisyt, tulostettava HTML-raportti (HyperText Markup Language) koneluettavine kaksoisversioineen sekä release-/publish-/wheels-/pages-työnkulut.

seg-318ad50d3826 = Useat tähän aiemmin tulevaksi työksi listatuista ominaisuuksista on sittemmin <b>toimitettu</b>, ja ne käsitellään edellä tai asiakirjassa <a1>VALIDATION</a1>: täysi IAU 2000A -nutaatio ja ekvinoksivapaa CIO-pohjainen GCRS↔ITRS / ITRF (International Terrestrial Reference Frame) -redusointi (validoitu bitti bitiltä SOFA/ERFA:a vastaan (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy)), EGM2008 (Earth Gravitational Model { "2008" }) -geopotentiaali asteeseen/kertalukuun { "70" }, <b>Lense–Thirring</b>-termi (koordinaatiston mukaanvetäminen), kiinteän maan/meren/ilmakehän vuorovedet, DE-tasoinen (DE440/ANISE (DE440: Development Ephemeris { "440" }; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — puhdas Rust-planeettageometriatyökalupakki)) efemeridin ristiinvalidointi, ulkoinen Orekit-ristiinvalidointi (versio { "12.2" }) numeeriselle Cowell-propagaattorille ({ "0.08" } m { "24" } tunnin aikana) sekä erä- ja sekventiaaliselle radanmääritykselle, ja 17-tilainen tiukasti kytketty navigaattori, joka on tuotu esiin skenaariolajina <c1/>.

seg-068119b15b27 = Jäljellä olevat jatkotyöt on kirjattu asiakirjaan <a1>CHANGELOG</a1> kohtaan <c1/> ja kykykohtainen etenemissuunnitelma asiakirjaan <a2>CAPABILITY</a2>: ulkoinen oraakkeliarvo EGM:n (Earth Gravitational Model) korkea-asteiselle evaluaattorille täsmälleen napa-akselilla ja pyshtools-puhdas napa-alueen lähivertailu (evaluaattori asteeseen { "2190" } ja sen ajonaikainen lataaja <c2/> on toimitettu, MODELLED; ks. <c3/>), ajassa muuttuva avaruussääajuri valinnaiselle NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) -vastustiheystasolle (oletusvastustiheys on staattinen eksponenttimalli, ja skenaariolajin <c4/> Jacchia-71-tiheys on karakterisoitu NRLMSISE-00:aa vastaan mutta sitä ei korvata sillä), ulkoinen tarkistus valinnaiselle auringon reunatummenemisvarjolle, kantoaaltovaiheen GNSS/INS-tiukka kytkentä sekä aito EGM2008/EIGEN (EIGEN: European Improved Gravity model of the Earth by New techniques) -painovoimakartta alt-PNT-sovittimelle.

seg-b48f69ea54b3 = Yksityinen kerrosrepo sisältää vientiherkkää kestävyyssyvyyttä; se liittyy saman rajapinnan <c1/> kautta (ja luvun §{ "4" } sopimuksen <c2/> kautta) muuttamatta julkista moottoria.

seg-2f88ab8f67e8 = <s1>Edellinen</s1>Missä Kshana toimii

seg-02b0e0fdcdbe = <s1>Seuraava</s1>Missä Kshana sijoittuu
