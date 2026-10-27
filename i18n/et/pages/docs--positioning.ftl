# docs--positioning: translations (et)

# attr:aria-label, text
seg-6555ff9a6d8e = Väljund

# text
seg-0be9b5747c00 = Kshana

# text
seg-94058315dfe4 = Sisend

# text
# c1: docs/POSITIONING.md
seg-09721fbcf7fc = Allikas: <c1/>

# text
seg-5b362d7b0903 = Kshana on avatud, reprodutseeritav <b>PNT (positsioneerimine, navigatsioon ja aeg) vastupidavuse tõendimootor</b>. Kirjeldatakse stsenaarium — andurid või kellad, GNSS-i (ülemaailmse satelliitnavigatsioonisüsteemi) katkestus, segamis- või spuufimisrünnak, eelarve — ja mootor ütleb, kui hästi aeg ja asukoht vastu peavad, hinnatuna operatiivsete kvaliteedinäitajate (FoM) vastu. Iga nende arvude taga olev võimekus on masinkontrollitud maatriksis märgitud kui <b>VALIDATED</b> (kontrollitud sõltumatu välise oraakli (sõltumatu etalon) vastu), <b>MODELLED</b> (sisemiselt kooskõlas, väliselt kontrollimata) või <b>PARTNER</b> (kuulub riistvarapartnerile). See leht ütleb, kus see juhib, milleks see on ja mis see ei ole.

# text
seg-48d576a345e3 = Kus see juhib: ajastus ja holdover kriitilise taristu jaoks

# text
seg-f41d8a48ff13 = Mootori kõige paremini valideeritud osa on ajastus. Telekommunikatsioonivõrgud, elektrivõrgud ja finantskohad saavad oma aja GNSS-ist ning igaühel tuleb mõõta <b>holdover</b>: kui kaua kohalik kell saab GNSS-i kaotuse ajal vabalt töötada, enne kui selle ajaviga eelarvet rikub.

# text
# c1: allantools
# c2: VERIFICATION-MATRIX.md
seg-70d00c5fe203 = <b>Mis on VALIDATED.</b> Sagedusstabiilsuse hindajad, millest holdoveri vastus on ehitatud — Alani hälve (ADEV), modifitseeritud Alani hälve (MDEV), ajahälve (TDEV), maksimaalne ajavahemiku viga (MTIE) ja laiendatud ulatusega Theo1 hindaja — on kontrollitud Stable32 etalonhälvete, sõltumatu <c1/> teegi ja päris mõõdetud tseesiumkella vastu. Holdoveri libisemise dispersiooni arvutus ja selle pöördamine holdoveri ajaks on kontrollitud SciPy vastu. Iga rida, selle test ja selle etalon on failis <a1><c2/></a1>.

# text
seg-9fbedc930565 = <b>Mis jääb MODELLED.</b> Kellaklassi kaupa müra põhjad (näiteks antud ostsillaatoriklassi pikaajaline põhi) määravad vastuse stabiilse kella jaoks ning need on esinduslikud arvud, mitte seadme mõõtmised. Arvu jaoks, mida kavatsetakse kaitsta, tuleb anda mõõdetud põhjad.

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-700df4898ede = <b>Telekommunikatsiooni ühikud.</b> Stsenaariumi liik <c1/> esitab MTIE ja TDEV, kontrollib neid Rahvusvahelise Telekommunikatsiooni Liidu telekommunikatsiooni standardimissektori (ITU-T) maskide vastu — G.8272 primaarse etalonaja kella (PRTC) jaoks, G.8272.1 täiustatud PRTC (ePRTC) jaoks, G.8273.2 telekommunikatsiooni piirikella (T-BC) jaoks ja G.8271.1 võrgu piiride jaoks referentspunktis C — ning esitab, kui kaua holdover püsib iga ajavea eelarve sees. Vt <a1><c2/></a1>.

# text
seg-50421d8247ab = Mis seda eristab

# text
seg-7ec913b140ed = Füüsika ja standardid ei ole erinevus: Simplified General Perturbations { "4" } (SGP4) levitamine, Alani hälve, tugisüsteemid ja täpsuse halvenemise tegur on teistes teekides saadaval, tasuta ja õiged ning Kshana kontrollib end mitme nende vastu. Erinevus on tõenduste distsipliin:

# text
seg-f7d466d5215b = <b>Avatud.</b> Mootor on GNU Affero General Public License (AGPL) all, nii et igaüks saab seda lugeda ja uuesti käivitada. Suletud integreerimiseks on olemas kommertslitsents.

# text
# c1: scenario + seed + engine version
seg-76ff24c1939b = <b>Reprodutseeritav.</b> Tulemuse määrab <c1/> bitthaaval ning käivituse saab jagada lingina brauseri mänguväljakule.

# text
# c1: PROVENANCE.md
seg-6df34e089b53 = <b>Päritoluga märgistatud.</b> Iga anduriparameeter on jälgitud avaldatud allikani (<a1><c1/></a1>) ja iga võimekus kannab oma taset VALIDATED / MODELLED / PARTNER. Pideva integratsiooni (CI) kaitse keeldub reast VALIDATED ilma sõltumatu välise etaloniga, nii et sisemist enesekontrolli ei saa esitada valideerimisena.

# text
seg-8bccfe110f4c = Me ei ole leidnud teist avatud tööriista, mis ühendaks need holdoveri, terviklikkuse, inertsiaalse libisemise ja kvantandurite üle, kuid otsing, mis midagi ei leia, ei ole tõend, et midagi pole olemas; me ei väida, et oleme ainsad.

# text
seg-e942b2474960 = Kvant: neutraalne kompromissimeetod, tulemused märgitud MODELLED

# text
# c1: quantum-trade
# c2: QUANTUM.md
# c3: QUANTUM-MODELS.md
seg-655769464447 = Kshana võrdleb kvant- ja klassikalisi kellasid ning inertsiaalandureid samal stsenaariumil sama koodiga: iga seade on veamudel ja mootor ei tea, milline neist on „kvant“. Seda tuleb käsitleda kui <b>neutraalset kvant-vs-klassikalist kompromissimeetodit, mille tulemused on märgitud MODELLED</b>. Enamik sisendeid on avaldatud Alani/müra-eelarve koefitsiendid; külmaatom-interferomeetri kiirendusmõõturil on esimeste printsiipide kiht, mis tuletab selle müra koefitsiendi. Partneri mõõdetud Alani hälbe andmeid saab sisestada liigi <c1/> kaudu, mis on tee konkreetse seadme arvude edutamiseks. Vt <a1><c2/></a1> ja <a2><c3/></a2>.

# text
seg-eb5d247b42aa = Kuu, tsislunaarne ja kaugkosmos: hoitakse alles, mitte pealkirjaks

# text
seg-4b9bd68b7fb1 = Kuu / tsislunaarne komplekt (Kuu terviklikkuse seire, Maa–Kuu kolme keha tuum, Kuu ajaskaalad, teenindusmahu analüüs) ja kaugkosmose radiomeetrilise navigatsiooni mootor on hooldatavad võimekused. Enamik nende ridu on MODELLED ning Kuu navigatsiooni teenindavad juba spetsiaalsed tööriistad, seega pakutakse neid sama mootori võimekustena, igaühel oma tase, mitte juhtivana.

# text
seg-26f242f1bef8 = Ülejäänud mootor

# text
seg-b9b2e29e51d9 = Sama mootor samade tasemetega katab ka:

# text
# c1: leo-signal
# c2: leo-pass
# c3: leo-navmsg
# c4: leo-pvt
# c5: leo-ppp
# c6: ntn-positioning
# c7: leo-pnt-chain
seg-89d1923b3ed9 = <b>Madala Maa orbiidi (LEO) PNT otsast lõpuni.</b> Signaalikujundus (<c1/>), läbilend ja riba kaupa sidelingi eelarve (<c2/>), edastatav navigatsioonisõnum (<c3/>), liidetud keskmise ja madala Maa orbiidi positsioneerimine (<c4/>), täpse punktpositsioneerimise (PPP) koondumine LEO täiendusega (<c5/>), positsioneerimine 5G mitte-maapealsest võrgust (<c6/>) ning <c7/>, mis annab iga etapi väljundi edasi järgmisele ühe süsteemi jaoks.

# text
# c1: spectrum
seg-2e5b57ccd454 = <b>Spekter.</b> L-riba (ning ülikõrgsagedus- (UHF), S- ja C-riba) võimsusspektri tiheduse juga skriptitud segaja ajajoone all, riba kaupa segaja ja signaali suhtega ning efektiivse kandja ja müra tihedusega (<c1/>), ja Signal Metadata Format (SigMF) salvestis sisse ja välja.

# text
# c1: solar-system
# c2: body-pnt
# c3: constellation-design
seg-0e7fd993a838 = <b>Päikesesüsteem ja mis tahes keskkeha.</b> Planeetide ja suuremate kuude asukohad ja füüsikalised konstandid (<c1/>), positsioneerimine ümber mis tahes nende kehade (<c2/>) ning Walkeri ja avaldatud pesadega konstellatsiooni kavandamine koos katvuse ja täpsuse halvenemise teguri kaartidega ümber mis tahes nende (<c3/>).

# text
# c1: campaign
seg-9d993a356eb0 = <b>Kampaaniad.</b> Olemasolevad liigid, mis on aheldatud ühele jagatud ajajoonele, pühitud, käivitatud algväärtusega Monte Carlo ansamblitena või käivitatud kõrvuti jagatud tingimuste all (<c1/>).

# text
# c1: --animate
# c2: --export
# c3: spectrum
seg-905a9aa8c47c = <b>Väljundid.</b> Iga käivitus kirjutab tulemusdokumendi, diagrammi ja aruande HTML-is (HyperText Markup Language) ja JSON-is (JavaScript Object Notation); <c1/> kirjutab SVG (Scalable Vector Graphics), HTML või kaadrijadaga animatsiooni; <c2/> kirjutab CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON või STK (Systems Tool Kit) efemeriidi neile liikidele, mis paigutavad asju Maale, ja SigMF faili <c3/> jaoks.

# text
seg-75206591a52a = Enamik neist ridadest on MODELLED; kontrollmaatriks nimetab vähesed, mis on VALIDATED (näiteks Rahvusvahelise Telekommunikatsiooni Liidu vihma ja tuikamise soovitused, Galileo edastatud efemeriidi algoritm, CRC-24Q (24-bitine tsükliline liiasuse kontroll) kaadrikontroll ja planeetide valguse käiguaja lahendaja).

# text
seg-785218a0ea66 = Mis Kshana ei ole

# text
# c1: iq
# c2: spectrum
# c3: [iq]
# c4: spoof_capture
seg-fae54ec38477 = <b>See ei ole raadiosagedus- (RF) signaalisimulaator ega riistvara-ahelas-stend (HIL).</b> Kshana ei juhi raadioriistvara ega edasta midagi. Enamik sellest töötab veamudelite ja sidelingi eelarvete tasemel, enne kui riistvara või laboriaega ostetakse. Signaalitasemel on see ainult tarkvara: GNSS IQ kiht (<c1/>) kirjutab seaduslike GNSS-i signaalide baasribas faasisisese/kvadratuurse (IQ) valimifailid tarkvaravastuvõtjatele ja käivitab neil oma tarkvaravastuvõtja; liigi <c2/> jaotis <c3/> (alates { "0.29.0" }) kirjutab oma analüütilise mudeli SigMF (Signal Metadata Format) hetktõmmise, mis sisaldab seadistatud segajaid (müra sarnased segajad ribade kaupa, toonid ja siristused lainekujudena); ning <c4/> summeerib autentse ja spuufija koopiasignaali mälus, et testida silmuse haaramist, seda välja kirjutamata. Riistvaravastuvõtja testimine päris RF-stiimuli vastu on RF-simulaatori ülesanne.

# text
seg-ca243f3f8e8d = <b>See ei asenda MATLAB/Simulinkit, STK-d ega Orekiti.</b> See asub nende kõrval. See loeb ja kirjutab vahetusvorminguid, mida need kasutavad — CCSDS (Consultative Committee for Space Data Systems) orbiidi efemeriidisõnumeid, SP3 (Standard Product { "3" }) täppisorbiite, RINEX-it (Receiver Independent Exchange Format) —, kirjutab nende vaatajatele CZML-i, KML-i, GeoJSON-it ja STK efemeriidi ning selle numbriline jõumudel on ristkontrollitud Orekitiga, mitte ei pakuta selle asemel.

# text
seg-8fa4e93c3d0e = <b>See ei ole kandelaine faasiga GNSS-i töötlusmootor ega positsioneerimisteenus</b> (vt allpool).

# text
seg-8ba4b67bc813 = <b>See ei ole sertifitseerimisasutus.</b> Silt VALIDATED tähendab, et võimekus vastab välisele oraaklile (sõltumatu etalon); see ei ole ühegi toote ega operaatori sertifitseerimine.

# text
seg-362b857140b9 = Mis Kshana on ja ei ole GNSS-i töötlusmootori kõrval

# text
# c1: leo-ppp
# c2: pvt
seg-f50951b2e9c8 = Kshana <b>ei ole</b> kandelaine faasiga GNSS-i <em>töötlus</em>mootor ja ükski stsenaariumi liik ei ole positsioneerimisteenus. Sellel on siiski jalg mõõtmisdomeenis, teegikoodina, millele tulemuslikkuse uuring toetub ja mis on kontrollitud sõltumatute etalonide vastu. Lühibaasjoonega reaalajas kinemaatiline (RTK) positsioneerimine LAMBDA (least-squares ambiguity decorrelation adjustment) täisarvufikseerimisega töötab päris kahesageduslikel RINEX-i vaatlustel, nagu ka staatiline ujuvkomaga täpse punktpositsioneerimise (PPP) filter IGS-i lõplike orbiitide ja kelladega, ning kell, mida see filter hindab, on ajalahend IGS-i lõpliku jaamakella vastu. Kõik kolm on <a1>kontrollimaatriksi</a1> VALIDATED rida, IGS-i jaamaandmete vastu, mille see seal nimetab, ning kõik töötavad staatilistel, lühikestel vaatlusakendel, mitte voogteenusena, kus oleks täisarvuliste mitmetähenduslikkuste lahendamine pikkadel baasjoontel, kandelaine silumine või kinemaatiline rover. Liik <c1/> käivitab ujuvkomaga PPP filtri koodil ja kandelaine faasil, kuid mõõtmistel, mille see ise simuleerib, et uurida koondumisaega LEO täiendusega ja ilma; see ei töötle vaatlusfaili. Liik <c2/> (asukoht, kiirus ja aeg) lahendab vastuvõtja asukoha päris RINEX-i koodipseudovahemaadest pluss edastatud efemeriidist, valideeritud rahvusvahelise GNSS-i teenistuse (IGS) mõõdistatud koordinaadi vastu (jaam ABMF, 2018-05-13) täpsusega <b>{ "5.7" } m 3-D RMS (ruutkeskmine) / { "1.1" } m horisontaalselt</b>. Kuid toode on tulemuslikkuse uuring, mitte positsioneerimisteenus, ja allolev raamistik on mõeldud säästma tulevast kasutajat valest tööriistast tulenevast pettumusest.

# text
seg-169dd778c45f = GNSS-i töötlusmootor (RTKLIB, avatud lähtekoodiga reaalajas kinemaatilise positsioneerimise teek; gLAB, Kataloonia Tehnikaülikooli gAGE rühma GNSS-i laboratooriumi tööriistakomplekt)

# text
# c1: pvt
seg-4faa1de0ef70 = stsenaarium: andurite veamudelid, katkestusaknad, geomeetria — või liigi <c1/> puhul päris RINEX-i vaatlusfail pluss edastatud navigatsioon

# text
seg-ae60d0def8af = päris GNSS-i vaatlused (RINEX), efemeriidid, parandused

# text
# c1: pvt
seg-5fce99bb803d = tulemuslikkuse kvaliteedinäitajad: holdover, ajastuse/asukoha viga, kättesaadavus, terviklikkuse/turvalisuse piirid — pluss koodi ühepunktpositsioneerimise (SPP) asukoht liigist <c1/>

# text
seg-b752bb5c3f64 = asukoha/kiiruse/aja <b>lahend</b> (SPP, PPP, RTK)

# text
seg-dd8a47d4f618 = Küsimus, millele see vastab

# text
seg-b52fd8e0c856 = „kui hea <em>oleks</em> see arhitektuur ja kus see puruneb?“

# text
seg-09672ca004ac = „kus ma nende mõõtmiste põhjal <em>praegu</em> olen?“

# text
seg-00d5ebd56088 = Kvant- / optilised andurid

# text
seg-a55f2bd6c1bf = modelleeritud veamudelitena (optilised kellad, külmaatom-inertsiaalmõõteseade (IMU), optiline aja edastamine), tulemused märgitud MODELLED

# text
seg-7ccfb3395d84 = ei modelleerita

# text
seg-ec21dbf4b910 = Päris vaatluste töötlus

# text
# c1: pvt
seg-324ef9a933d5 = koodi SPP päris RINEX-i vaatlustest (<c1/>, meetritäpsus); lühibaasjoonega RTK LAMBDA-ga ja staatiline ujuvkomaga PPP päris kandelaine faasil, teegikoodina, kontrollitud IGS-i jaamade vastu (VALIDATED, staatilised ja lühikesed aknad, mitte voogteenus); pluss geomeetria / täpsuse halvenemise tegur (DOP) / kättesaadavus

# text
seg-e15db8a33a9a = põhikompetents, kuni kandelaine faasi PPP/RTK-ni

# text
seg-e6df7ccdba96 = null — töötab brauseri vahekaardil (WebAssembly)

# text
seg-812c1c70ce63 = natiivne ehitus / tööriistaahel

# text
seg-58df67617e1a = Täiendavad, mitte konkureerivad — RTKLIB ja gLAB

# text
# c1: pvt
# c2: pvt
seg-29aeb97bd509 = <a1>RTKLIB</a1> ja <a2>gLAB</a2> on küpsed, laialt kasutatavad GNSS-i töötluskomplektid. Need võtavad päris mõõtmised ja annavad positsioneerimislahendi (SPP/PPP/RTK; gLAB on ka suurepärane õppevahend tugeva pärandiga Euroopa Kosmoseagentuuris (ESA) ja Euroopa geostatsionaarses navigatsioonilisandsüsteemis (EGNOS)). Kshana <b>ei</b> asenda neid ega püüa seda teha. Selle vaatlustee on kitsas: koodi ühepunktpositsioneerimine (<c1/>) ning kontrollitud teegikoodina lühibaasjoonega RTK LAMBDA täisarvufikseerimisega ja staatiline ujuvkomaga PPP filter päris kahesageduslikel vaatlustel, mõlemad VALIDATED IGS-i jaamaandmete vastu (PPP filter ka RTKLIB-i käivituse vastu samadel sisenditel). Sellel pole kandelaine silumist, kinemaatilist ega voogtöötlust ning pikkade baasjoonte täisarvuliste mitmetähenduslikkuste lahendamist ja <c2/> ei hinda troposfääri ega ionosfääri — see rakendab Saastamoineni/Nielli troposfäärimudeleid ja L1/L2 ionosfäärivaba kombinatsiooni, see ei lahenda neid olekutena.

# text
seg-9c4e70ce8a55 = Torujuhe on täiendav:

# text
seg-01f43da4858c = <b>RTKLIB / gLAB</b> vastavad küsimusele <em>„kus ma nende signaalide põhjal olen?“</em>

# text
seg-f5370894cdd1 = <b>Kshana</b> vastab küsimusele <em>„kui kaua jääb mul hea vastus alles, kui need signaalid lakkavad — ja kui palju annab parem kell või inertsiaalandur, klassikaline või kvant?“</em>

# text
seg-2403d6b115de = Loomulik töövoog kasutab töötlusmootorit GNSS-i olemasoleva lõigu jaoks ja Kshanat <b>holdoveri</b> käitumise ja selle ümbritseva andurikompromissi ruumi uurimiseks. Kui on vaja kandelaine faasiga positsioneerimisteenust — kinemaatiline PPP või RTK, pikad baasjooned, võrgu täisarvuliste mitmetähenduslikkuste lahendamine —, tuleb kasutada RTKLIB-i või gLAB-i; kui on vaja reprodutseeritavaid, märgistatud tõendeid vastupidavuse ja holdoveri kohta, on see ülesanne, milleks Kshana on ehitatud.

# text
seg-21631e5c6be3 = Nullpaigaldusega brauseritase

# text
seg-9b01dd6721ed = Enamik selle valdkonna simulatsioonitööriistu (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) nõuab natiivset paigaldust või litsentsi ja õppimiskõverat enne esimest tulemust. Kshana kompileeritakse WebAssemblyks ja töötab <b>täielikult brauseris</b> — <a1>mänguväljak</a1> laadib töönäite stsenaariumi, käivitab päris mootori kliendipoolselt (midagi ei laadita üles) ja näitab tulemust sekunditega. Juhitud liugurid ja ühe klõpsuga stsenaariumid tähendavad, et esimene kasulik tulemus ei vaja TOML-i (Tom's Obvious Minimal Language, stsenaariumifaili vorming) ega tööriistaahelat.

# text
seg-b1cb4b8f0ef1 = See nullpaigaldusega tase on teadlik positsioon:

# text
seg-33b361bde50d = <b>Haare</b> — ülevaataja, õpilane või hankespetsialist saab päris mootorit linkidest proovida, igal seadmel, ilma seadistuseta.

# text
# c1: scenario + seed + engine version
seg-a4a4ebf89cee = <b>Reprodutseeritavus</b> — sama mootor, mis tarnitakse brauseris, on teek, mis tarnitakse crates.io-s, Python Package Indexis (PyPI) ja npm-is; tulemus on reprodutseeritav failist <c1/> ja käivituse saab jagada URL-ina (veebiaadress).

# text
seg-3d3d4bda606c = <b>Ausus</b> — mootori ise käivitamine avatult on tugevaim vastus väitele „usalda arve“: brauseritase <em>on</em> auditipind.

# text
seg-6095bcacb725 = Brauseritase ei tee Kshanast töölaua töötluskomplekti asendajat — see teeb tulemuslikkuse kompromissiuuringu küsimuse ligipääsetavaks inimestele, kes ei paigaldaks seda kunagi.

# text
# c1: CAPABILITY.md
# c2: pvt
seg-938ca8eab04c = <a1><c1/></a1> — rida-realt ulatuse kaart (lahendaja <c2/> täielik ulatus ja jäägid on reas <b>GNSS / PNT töötlus</b>).

# text
# c1: VALIDATION.md
seg-9e94b1740386 = <a1><c1/></a1> — mis on valideeritud, koos tõenditega.

# text
# c1: TELECOM-TIMING.md
seg-3a02f39bd90a = <a1><c1/></a1> — telekommunikatsiooni ajastuse liik ja selle maskid.

# text
# c1: GLOSSARY.md
seg-c5aa08e4ca55 = <a1><c1/></a1> — siin kasutatud terminite lihtsas keeles definitsioonid.

# text
# c1: web/README.md
seg-85aaaa34ea7c = <a1><c1/></a1> — brauseri mänguväljak.

# text
seg-54e2deeffc7d = <s1>Eelmine</s1>Arhitektuur

# text
seg-b2f93c49d5c6 = <s1>Järgmine</s1>Muudatuste logi
