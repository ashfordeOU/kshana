# docs--capability-reference: translations (et)

# text
seg-f4f59f19e091 = Võimekuskaardid

# text
seg-501d3a72ea43 = Terviklikkus

# text
seg-20db2c79b998 = Kontrollitud

# text
seg-29e58493fdd4 = Modelleeritud

# text
seg-298cc35fe9d1 = Inertsiaal

# text
seg-b03984610dc0 = Kuu

# text
seg-f1f903f1b9ff = Vastupidavus

# text
seg-bd64cfb4dc52 = Orbiidi levitamine ja konstellatsiooni kujundus

# text
seg-a7cfe6f135f1 = Orbiit ja geomeetria

# text
seg-3060564c3e21 = 666/666 AIAA vektorit · { "4.12" } mm

# text
seg-5b265eaf8f29 = SGP4/SDP4 levitamine päris kaherealistest elementidest (sissekantud Celestraki GPS-i hetktõmmis) või sünteetilistest Walkeri konstellatsioonidest, mille keskmised elemendid realiseerivad valemi i:T/P/F täpsusega alla { "1" } km { "24" } h jooksul. Mitme konstellatsiooni nähtavus, DOP (täpsuse halvenemise tegur) ja GNSS-i kättesaadavus, konstellatsiooni kujunduse optimeerija, kattuvusribade (streets-of-coverage) mõõtmestamine ning Walkeri kujunduse skaneerimine, mis annab Pareto-optimaalsed kujundused tasapindade × satelliitide ruudustikul.

# text
seg-66e33b899daf = Cowelli levitaja ja kuue häiringuga jõumudel

# text
seg-a5a572db3bed = Numbriline levitaja

# text
seg-52a4410a54da = konservatiivsed tasemed < { "0.08" } m / { "24" } h vs Orekit { "12.2" }

# text
seg-463ed85c6e40 = Numbriline (Cowelli) levitaja, mis täiendab analüütilist SGP4/SDP4 rada, hierarhilise jõumudeliga: kahe keha + täielik J2–J6 tsonaalväli, valikuline EGM2008 tesseraalne geopotentsiaal astme/järguni { "70" }, epohhist sõltuv Päikese ja Kuu kolmanda keha gravitatsioon (sisseehitatud efemeriid, DE/SPK tuuma pole), päikesekiirguse rõhk koonilise umbra/penumbra varjuga, atmosfääritakistus, post-Newtoni Schwarzschildi relativistlik parandus ja Lense–Thirringi raamistiku kaasaslohistamise liige — mida juhib valik RK4 sammu kahekordistamise või Dormand–Prince RK5({ "4" }) adaptiivsete integraatorite vahel.

# text
seg-797370a2faef = Põletused, Lambert ja porkchop

# text
seg-57b120fb0aac = Manöövrid ja trajektoori kujundus

# text
seg-5081c84dfdd7 = Tsiolkovski < { "0.01" } % · Lamberti edasi-tagasi arvutused kahe keha tegeliku lahendini

# text
seg-da6b16ebd59b = Impulsiivsed ΔV sõlmed { "6" }×{ "6" } kovariatsi levitamisega, lõpliku põletuse integreerimine, mida kontrolliti Tsiolkovski raketivõrrandi vastu täpsusega alla { "0.01" } %, Izzo-2015 ühe tiirlusega Lamberti lahendaja ja täpne universaalmuutuja Kepleri levitaja ning porkchop-skaneerimine (start × saabumine) C3 / saabumise V∞ jaoks, väljastatud JSON-i kontuuriruudustikuna — jõudlussimulatsiooni kiht GMAT/Orekit kohal.

# text
seg-831552a45712 = Aegskaalad ja Maa orientatsiooni tugisüsteemid

# text
seg-76b323512350 = Aegsüsteemid

# text
seg-60208bd726eb = bitthaaval vs SOFA/ERFA · Vallado otsast lõpuni { "4" } mm

# text
seg-42373dd9ca64 = IERS-i liigsekundiga UTC / TAI / TT / UT1 skaalad, Juliuse kuupäeva API, IAU-2000 Maa pöörlemisnurk, GMST-põhised TEME ↔ ECEF ja WGS-84 geodeetilised tugisüsteemid, täielik IAU 2000A/2000B nutatsioon ja IAU { "2006" } pretsessioon ning pööripäevavaba CIO-põhine IAU 2006/2000A GCRS↔ITRS teisendus IERS-i poolusliikumisega — kontrollitud bitthaaval SOFA/ERFA vektorite vastu ja sõltumatult ristkontrollitud ANISE (puhas Rust SPICE) vastu: GCRS→ITRS vs ANISE ITRF93, sama IERS EOP, nõustuvad täpsusega ≤ { "0.86" } m maapinnal / ≤ { "3.6" } m GNSS-i orbiidil.

# text
seg-dd766880e73a = Reaalajas Maa orientatsiooni prognoos

# text
seg-54169bca19e9 = { "12" } ennetusaega arhiveeritud Bulletin A vastu: UT1 { "2.93" } ms, poolusliikumine { "1.76" } mas

# text
seg-81be07e41d1c = Operatiivse stiiliga Maa orientatsiooni ennustaja — vähimruutude meetod nihke, kiiruse ja peamiste perioodiliste liikmete üle järgneva akna ulatuses — mõõdetud tegelikult arhiveeritud Bulletin A ennustuste, mitte püsivuse (persistence) vastu. Võrguühenduseta vaikesisend on päris IERS finals2000A toode, mis sisaldab Bulletin A ennustusridu, nii et paljas käivitus väljastab täidetud horisondipõhise tabeli tühja asemel. UT1 ja poolusliikumine esitatakse ühise reakomplekti peal koos nende kombinatsiooniga, nii et ühine arv on üks statistik, mitte kahe erineva valimi ruutsumma.

# text
seg-0e18bc4add10 = Strapdown INS ja kaardiabiga navigatsioon

# text
seg-26561c9a96a7 = esimestest printsiipidest CAI kiirendusmõõtur · tuletatud VRW ristkontrollitud sõltumatu integraatoriga

# text
seg-d18714ee32fb = Kolmeteljeline strapdown INS — kvaternioonasend, WGS-84 NED mehhaniseerimine, coning/sculling kompensatsioon ja täielik deterministlik IMU veamudel — pluss esimestest printsiipidest külmade aatomite interferomeetri kiirendusmõõtur (Mach–Zehnderi faas, projektsioonimüra, kontrasti vaibumine, vibratsiooni sidestus) ja osakestefilter maastiku-/gravitatsioonipõhiseks GPS-i puudumisel navigeerimiseks.

# text
seg-0e44bdf12d16 = Inertsiaalne ja maastikusuhteline edasiliikumine katkestuse läbi

# text
seg-07cb40aa5cd1 = { "10" } m { "249" } s juures, { "50" } m { "595" } s juures, kiirendusmõõturi nihe domineerib mõlemal

# text
seg-d5df17e4425b = Asukohaviga edasiliikumise kestuse suhtes IMU veabilansist — nihe, juhuslik kõndimine ja skaalategur, igaühel oma kasvuseadus ja oma osa ületuses — nii et navigatsioonikatkestuse hind on arvutatud kõver, mitte läbi skaneeritud triivikiirus. Läveületused on mootori väljund, kus igaühe juures on nimetatud domineeriv panus, nelja IMU klassi lõikes, ning maastikufikseeringu intervall hinnatakse eraldi plokis, nii et põhiületused jäävad toeta.

# text
seg-6631a5d69c84 = Gravitatsiooni-, maastiku- ja magnetkaardi sobitamine

# text
seg-6af8e99df46d = Alt-PNT (GPS-i puudumisel)

# text
seg-72527f4459c7 = 60-min GPS-i puudumisel · ~{ "145" } m (< { "500" } m)

# text
seg-89bd5fb3e90b = Külmade aatomite gravimeetri mõõtemudel, mille valge müra põhitase on tuletatud CAI kiirendusmõõturi füüsikast, madala astmega täielikult normaliseeritud sfääriliste harmooniliste gravitatsioonianomaalia väli pluss sünteetilised masskontsentratsioonid (mascon) ning gravitatsioonikaardi sobitamise osakestefilter — laiendatud maastikupõhisele navigatsioonile SRTM kõrgusmudeli (DEM) vastu (TERCOM/SITAN), IGRF-14 geomagnetilise põhivälja astmeni/järguni { "13" } ning kombineeritud gravitatsiooni + magnetvälja + maastiku navigaatorile, mis sulandab kõik kolm skalaarkanalit. 60-minutiline GPS-i puudumisega benchmark — ~{ "700" } km / ühetunnine katkestus, kus inertsiaallahendus triivib ~{ "70" } km-ni — taastatakse ~{ "145" } m täpsuseni hierarhilise jämedast peenemani sobitajaga: ESA NAVISP Quantum Wayfarer eesmärk.

# text
seg-dbd63be796ff = GNSS / INS andurisulandus

# text
seg-f9582184adea = Sulandus

# text
seg-f2166e96405f = tihedalt seotud UKF · { "0.77" } m RMS

# text
seg-d6ad19d1d47b = 15-olekuline veaoleku EKF, mis liigub läbi GNSS-i katkestuste kalibreeritud inertsiaallahendusel; tihedalt seotud pseudovahemaa režiim, mis jätkab korrigeerimist alla nelja satelliidiga; seotud kell + asukoht filter; üldine unscented Kalmani filter (UKF) (sigma-punktide hindaja); tihedalt seotud GNSS/INS UKF navigaator, kontrollitud { "0.77" } m RMS-ini { "120" } s katkestuse ajal kõveral LEO ülelennul; ning täielik 17-olekuline tihedalt seotud GNSS/INS UKF, mille kvant-CAI arvestuslik navigeerimine liigub katkestuse läbi külmade aatomite kiirendusmõõturi tuletatud kiiruse juhusliku kõndimise abil.

# text
seg-4af862bd1307 = Partii- ja järjestikune OD

# text
seg-ca67c864635c = Orbiidi määramine

# text
seg-948441304a32 = partii + järjestikune OD vs Orekit { "12.2" } BatchLSEstimator/KalmanEstimator

# text
seg-22e738b2ab57 = Orbiidiseisundi taastamine maajaama vahemaajälgimisest, koostades kahe keha + J2 jõumudeli ja RK4 integraatori Gauss–Newtoni partii diferentsiaalkorrektoriga (alla meetri / mm·s⁻¹ müravabadest vahemaadest, ~{ "2" } m { "5" } m müra põhitasemel) ja järjestikuse unscented-filtri variandiga.

# text
seg-06406b3d0b88 = Fisheri informatsioon ja jälgitavus

# text
seg-4e28248ef77b = Jälgitavus ja hindamisteooria

# text
seg-a5b38d0a8d64 = omaväärtused vs numpy.linalg.eigh · CRLB vs σ²(XᵀX)⁻¹ numpy.linalg.inv kaudu · GNSS DOP informatsioonimaatriksist, kõik täpsusega { "1e-9" } · Kay ({ "1993" }) suletud kujud + Monte Carlo CRLB saavutamine

# text
seg-3ee5597d6f8a = Üldine taaskasutatav Fisheri informatsiooni / Cramér–Rao kiht (src/fim.rs): informatsioonimaatriks M = HᵀWH, Cramér–Rao alampiir, jälgitavuse aste ja datumi defekti nullruum (Moore–Penrose pseudo-pöördmaatriks) ning D/A/E/T-optimaalsed eksperimendikujunduse skalaarid sümmeetrilisest Jacobi omaväärtuslahendajast. See toetab DOP-mootorit, passiivse geolokatsiooni piiri ja Kuu absoluutse jaama jälgitavuse tulemust — sisemine vahemaamõõtmine jätab kuue vabadusastmega jäiga keha datumi defekti, mille Maa baasjoonega VLBI-side taastab hõreda konstellatsiooni jaoks ja teravdab rikka jaoks, absoluutne datum sulgub kolmel mittekollineaarsel Maa jaamal.

# text
seg-ed467622dbd0 = CR3BP levitamine ja LunaNet terviklikkus

# text
seg-e386dced1d16 = Kuu ja tsislunaarne

# text
seg-f444bc39efbe = Reprodutseerib avaldatud L2 { "9" }:{ "2" } NRHO (~{ "6.57" } d periood · ~{ "3,250" } km periluun); STM kontrollitud lõplike vahede vastu

# text
seg-272afbca5e48 = Maa–Kuu ringjoone piiratud kolme keha (CR3BP) levitaja pöörlevas tugisüsteemis — säilitatud Jacobi konstant ja kõik viis Lagrange'i punkti — { "6" }×{ "6" } olekuüleminekumaatriksiga ja ühe laskega diferentsiaalkorrektoriga, mis annab tõeliselt perioodilised halo / peaaegu sirgjoonelised halo orbiidid (NRHO): see reprodutseerib avaldatud L2 lõunapoolse { "9" }:{ "2" } NRHO (Gateway-orbiit) perioodiga ~{ "6.57" } päeva ja periluuniga ~{ "3,250" } km. Lisaks LunaNet / LNIS tsislunaarne PNT geomeetria (MCI↔MCMF teisendus, selenograafilised koordinaadid) koos Kuu lõunapooluse ARAIM-i ülelennuga, mis toob ausalt esile terviklikkuse lünga: ~{ "30" } m σ_URE viib kaitsetaseme kaugelt üle { "50" } m hoiatuspiiri.

# text
seg-619f89bf160c = Kuu tugisüsteemi realisatsioon

# text
seg-c6b12768a219 = vs numpy/scipy Umeyama–Horn SVD

# text
seg-29327b86ea27 = Realiseerib Kuuga kinnitatud tugisüsteemi vaatluskampaaniast: kaalutud Gauss–Newtoni sarnasussobitus jaama–reflektori geomeetria üle, esitades datumi, selle kovariatsiooni ja halvimini määratud telje. Seotud tugisüsteemi ja aegskaala gauge kantakse selgesõnaliselt, mitte ei summutata, nii et astmepuudus on aruandes nähtav, mitte pseudo-pöördmaatriksisse maetud.

# text
seg-b3ba1e7b197d = Kuu navigatsiooniteenuse ala ja ARAIM

# text
seg-353878596468 = ANISE { "0.10.2" } orbiidid · RTKLIB 2.4.2-p13

# text
seg-70b9c02c1f6a = Skaneerib näidis-Moonlight/LCNS-klassi konstellatsiooni selenograafilisel ruudustikul: nähtavus, DOP (täpsuse halvenemise tegur), katvus ja epohhipõhised ARAIM-i kaitsetasemed seadistatava hoiatuspiiri suhtes. Signaali kosmoses vahemaamõõtmise täpsus on parameeter, nii et skaneerimine vastab vahemaamõõtmise nõudele kogu mahu ulatuses, mitte läbi/kukkunud ühe fikseeritud väärtuse juures.

# text
seg-a94db5b03c9c = Teenusepakkujate vaheline Kuu koostalitluse bilanss

# text
seg-a2e8a8dfd666 = DE440 · INPOP21a · EPM2021 calceph kaudu

# text
seg-646a00230694 = Mõõdab, kui kaugele kolm sõltumatut autoriteetset Kuu efemeriidi tegelikult lahknevad, ning muudab selle projekteerimisseaduseks: tugisüsteemi ja efemeriidi veabilanss, mille segapakkujaga kasutaja pärib, ja kooskõla tolerants, mida pakkuja peab hoidma, et see bilanss jääks nimetatud piiri sisse.

# text
seg-0f359c118090 = Autonoomne vaba võrgu rikete jälgitavus

# text
seg-ae99396c03bd = vs sõltumatu numpy/scipy pariteedialgebra

# text
seg-51828c93731b = Lineaaralgebra, mida iseviitav Kuu konstellatsioon vajab oma rikete tuvastamiseks ilma tegeliku etaloni (ground truth) andmeteta: kaalutud pariteediprojektor astmepuudulikus pseudo-pöördmaatriksi kujul, mis jääb ellu datumi ja aegskaala gauge'i juures, sõlmepõhine tuvastatavus, Baarda minimaalne tuvastatav nihe ning Bütsantsi plokk-sädeme (block-spark) tuvastamise/identifitseerimise arvud päris DE440 sõlmedevahelise geomeetria üle.

# text
seg-65d239fc4894 = Kuu tugisüsteemi datum päris laserkaugusmõõtmisest

# text
seg-c92dd319fa36 = { "337" } ILRS normaalpunkti · mediaan { "5.13" } mm

# text
seg-2f7f950518be = Asendab simuleeritud kampaania päris andmetega: { "337" } arhiveeritud ILRS Kuu laserkaugusmõõtmise normaalpunkti viie retroreflektorite massiivi lõikes, iga vaatlus kaalutud faili enda salvestatud korduvtäpsusega. Reflektorite koordinaadid on peatelgedel põhinev DE440 kataloog, mida hoitakse oma failinime all, eraldi keskmise Maa DE430 tabelist — ühe söötmine teise pöörlemisele nihutab reflektorit sadade meetrite võrra ja midagi ei vaidle vastu, sest mõlemad on korrektselt vormistatud koordinaadid.

# text
seg-2db69c58f694 = Kuu diferentsiaalne PNT

# text
seg-32adcb9b1b02 = Täpne ühisrežiimi samasus · modelleeritud dekorrelatsioon

# text
seg-d4ac8cbac83e = Diferentsiaalparandused Kuu etalonjaama ja kasutaja vahel. Ühisrežiimi tühistamine on täpne samasus; ruumilise dekorrelatsiooni jääk on esimese astme geomeetriline mudel, mis kasvab baasjoonega, ning parandusi edastava lingi jäägibilanss esitatakse selle kõrval, nii et piirav liige jääb nähtavaks, mitte ei sulandu ühte arvu.

# text
seg-9b83e78dcd7b = Kuu aegskaalad ja geodeetiline VLBI

# text
seg-bcd769beab07 = Kellaklassipõhine ristumistabel

# text
seg-80107b7841bf = Kellaklassipõhised ristumisajad Kuu aegskaalale — millal iga ostsillaatoriklass lakkab täitmast nimetatud piiri ilma uuenduseta — koos Kuu geodeetilise VLBI vaadeldava suuruse ja Fisheri informatsiooniga, mida see datumile annab.

# text
seg-99084680c321 = Päris, hangitud Kuu konstellatsiooni geomeetria

# text
seg-a7be7d68e767 = { "5" } sissekantud testiandmefaili, igaüks taastatav oma registreeritud allikast

# text
seg-d3591b4b4633 = Teenuseala töötab avaldatud konstellatsioonikujundustel, mitte näidiskujundusel: viie satelliidiga LANS koostalituse demonstratsiooni etalonkomplekt, LNCSS juhtumiuuringud { "8" }, { "12" } ja { "16" } satelliidiga ning neli aparaati, mis olid 2023-01-01 tegelikult Kuu orbiidil, JPL Horizonsist. Iga fail nimetab oma tugisüsteemi ja oma päritoluklassi, tabuleeritud efemeriidi lõpust kaugemale ulatuv horisont lükatakse tagasi, mitte ei ekstrapoleerita, ja näidis-Kepleri tulemus väljastatakse hangitud tulemuse kõrval nendevahelise erinevusega, mitte kunagi selle asemel.

# text
seg-807b9fc7b517 = Kuu keelukontuur mõõdetud C/N₀ hajuvusest

# text
seg-a908030a9fcc = Eemaldus { "49.2" } km võimsussuhte järgi vs { "19.4" } km lukustuse kaotuse järgi

# text
seg-3ee440e8b619 = Segaja ja signaali suhe satelliidi kohta päris Kuu kaldvahemaadel, kusjuures soovitud signaali külge hoitakse jaotusena, mitte ei suruta kokku mediaaniks, nii et keelukontuur kannab määramatuse riba, mida releegeomeetria tegelikult tekitab. Kaht kriteeriumi esitatakse kõrvuti: võimsussuhte lävi ja jälgimissilmuse dünaamikast arvutatud lukustuse kaotus. Orbitaalse püüdmise jalajälge skaneeritakse saatja kõrguse ja kiirelaiuse üle ning seal, kus ruudustik ei jõua kunagi servapüüdmiseni, ütleb aruanne seda ja trükib puudujäägi.

# text
seg-229134190045 = VLBI graafikust jaama koordinaatide kovariatsioonini

# text
seg-547181855481 = Aste { "6" }, defekt { "0" }; vaba võrgu defekt { "1" } nimetatud ühise nihkena

# text
seg-6d147beefb43 = Kogub Kuu VLBI viivituse osatuletised Fisheri informatsioonimaatriksiks baasjoonte × epohhide graafiku üle ja tagastab jaama koordinaatide kovariatsiooni, nii et samm viivituse korduvtäpsusest koordinaadi sigmani on hinnatud, mitte eeldatud. Vaba võrk esitatakse datumiga fikseeritu kõrval, nimetades selle astmedefekti ja mittejälgitava suuna. Pinnapunkti kovariatsiooni hoitakse Maa jaama omast eraldi, sest lähivälja majaka osatuletis on kahe jaama ühikvektori vahe ega käitu nagu kauge välja juhtum.

# text
seg-028833cc45bc = Radiomeetriline navigatsioon ja relee-PNT

# text
seg-6c94ae122721 = Kaugkosmose ja Marsi PNT

# text
seg-ef21cd4b1962 = Simulatsiooniga kontrollitud (kovariatsiooni / suletud ahela kvaliteedinäitajad, mitte sertifitseeritud kaitsetasemed); Päikesekeskne Marsi dünaamika on ristkontrollitud JPL DE440 vastu täpsusega { "137" } m @ 1-päevasel kaarel; Mars-LMO OD ≈ { "0.2" } m.

# text
seg-469988966702 = Avatud kaugkosmose / Marsi radiomeetrilise navigatsiooni mootor: iteratiivne valguse levi aeg + Shapiro viivitus, kahe-/ühe-/kolmesuunaline Doppler ja vahemaa (Moyeri kahe haru), koherentne transponderi ümberlülitus, regeneratiivne/PN-vahemaamõõtmine ja Δ-DOR; CCSDS-TDM sisend/väljund; redutseeritud dünaamikaga ruutjuurinformatsioonifilter (empiirilised kiirendused + pardakell + Marsi takistus), mis teeb Mars-LMO orbiidi määramist sünteetilises suletud ahelas; ühesuunalise + kahesuunalise andmete sulandamine; ning MARCONI areostatsionaarne releekonstellatsioon otsast lõpuni GSE jõudlussimulaatoriga.

# text
seg-b4284bd2629e = Optiline ja RF üleandmine ristmodaalsuse terviklikkusega

# text
seg-ae131bc1ba67 = Optiline / RF PNT

# text
seg-1b25468c9780 = Minimaalne tuvastatav nihe { "8.20" } m horisontaalselt, { "12.30" } m vertikaalselt, { "24.6" } ns ajastuses

# text
seg-a5387333ab2d = Rikete sisestamine annab ristmodaalsuse monitorile tuvastusvõime, mitte rikkevaba läbimise: minimaalne tuvastatav nihe telje kohta nimetatud valehäire ja tuvastamata jäänud sündmuse bilansi juures. Pärast üleandmist propageeritakse kovariatsiooni uuesti kasvu hoiatuspiiride suhtes, nii et aruanne ütleb, kui kaua üksikmodaalsusega lahendus nende sees püsib, mitte ainult seda, et üleandmine oli pidev. Optilisi ja RF vahemaaharusid võrreldakse ainult sobitatud akumulatsiooniaja ja teega ning aruanne keeldub moodustamast suhet valitud, mitte mõõdetud väärtuse suhtes.

# text
seg-00cb9df27979 = Vastuvõtja autonoomne terviklikkus (ARAIM)

# text
seg-f86ecc2fda8e = MHSS päris GPS + Galileo hetktõmmisel · DO-316 kahe konstellatsiooniga

# text
seg-841a6f3f0277 = Hetktõmmise- ja lahenduste eraldamise RAIM horisontaalse ja vertikaalse kaitsetasemega (HPL/VPL), rikete tuvastamine ja välistamine ning Stanfordi terviklikkusdiagrammid — pluss selgesõnaline terviklikkuse riskibilansi (MHSS) kaitsetase kahe-/mitme konstellatsiooni kogu konstellatsiooni rikkerežiimiga (EU ARAIM / DO-316).

# text
seg-695aa5c57d83 = ARAIM avaldatud etalonvektorite vastu

# text
seg-08f9dd480ba7 = Halvim viga { "0.044" } m allikate enda { "0.05" } m tolerantsi vastu

# text
seg-68185dd65478 = Mootori MHSS kaitsetasemed on käivitatud EL-USA töörühma C etalon-õhusõidukialgoritmi enda avaldatud läbitöötatud näidete vastu, igaüks ümber kirjutatud koos selle hankimise URL-i, kuupäeva, lehekülje ja faili SHA-256-ga ning hoitud kahes kohas, mille kokkulangemist test kinnitab. Vastuvõtuvektor on sisemiselt kooskõlaline Reference Airborne Algorithm Description Document v3.1, lisa D. Milestone { "3" } aruanne sisaldab kahte sisemist defekti — märgitrükiviga geomeetrias ja valehäire kordaja, mis on hinnatud { "57" } rikkerežiimil, samal ajal kui tekst nimetab ühte — seega esitatakse selle kaitsetasemed mõõdetud lahknevustena, mitte hinnatud, ja defekte näidatakse dokumendi enda arvude käivitamisega.

# text
seg-17b28b3cf1fa = SBAS / WAAS kaitsetasemed ja kahesageduslik

# text
seg-99766b79a00a = Täiendus (SBAS)

# text
seg-4cfec990b19b = DO-229E K-tegurid · L1/L5 ionosfäärivaba

# text
seg-ef3a5513bbd8 = SBAS / WAAS kaitsetasemed DO-229E kaalutud vähimruutude kujul (täppislähenemise ja marsruudi K-tegurid) ja L1/L5 kahesageduslik ionosfäärivaba kombinatsioon (IS-GPS-705), mis toetab DO-316, kusjuures kaitsetaseme geomeetria on ristkontrollitud etalonlineaaralgebra teostuse vastu.

# text
seg-0a5bd5230c32 = Holdover, stabiilsus ning aja ja sageduse edastamine

# text
seg-69a0269c4732 = Kell ja ajastus

# text
seg-641ae762b453 = kalibreeritud kella andmelehtede järgi · holdover ristkontrollitud van-Loani kovariatsioonirekursiooni vastu

# text
seg-6f1c2e1f0bf4 = Kaheoleku Kalmani holdover, Alani perekonna stabiilsus (ADEV / MDEV / TDEV / HDEV) usaldusvahemikega ja täielik IEEE-1139 viie kordajaga astmeseaduse sobitus ning operatiivsed edastusmeetodid — TWSTFT BIPM-i Sagnaci suletud kujuga, GNSS-i ühisvaade (common-view), PPP ionosfäärivaba edastus, vaba ruumi optiline link turbulentsi sähvimisega ja pöördhajuvusega kellaansambli aegskaala. GNSS-i puudumisel kella holdover-i kalkulaator pöörab van-Loani edasiliikumisvea kasvu holdover-iks läveni — kui kaua kell töötab vabalt, enne kui selle ajaviga ületab bilansi — klassikaliste ja kvantkellade klasside lõikes; modelleeritud ning ausalt öeldud, et väga stabiilse kella puhul määrab holdover-i tiheda läveni eeldatud pika tau müra põhitase, mitte viidatud ADEV.

# text
seg-85b181275293 = Pseudovahemaa, ionosfäär ja troposfäär

# text
seg-835df2d05f2a = GNSS-i mõõtmisruum

# text
seg-ef01abb1cfe8 = Saastamoineni ZHD ≈ { "2.3" } m · Niell ühtsus seniidis · Klobuchar IS-GPS-200 järgi

# text
seg-43c0372fe6e7 = Otse pseudovahemaa / Doppleri süntees Klobucharil (edastatud) ja IONEX / TEC-ruudustikul (mõõdetud) põhineva ionosfääriga — sh IONEX-faili parser, ajainterpolatsioon ja õhukese kesta kaldkallutuse kaardistus — Saastamoinen + Niell troposfäär ja hetktõmmise RAIM.

# text
seg-3458cb02f156 = Üksikpunkti positsioneerimine (PVT)

# text
seg-640e4cd9f008 = GNSS-i positsioneerimine

# text
seg-4fa43feda96a = Kontrollitud päris IGS-i andmetel (jaam ABMF, 2018-05-13) täpsusega { "5.7" } m 3-D RMS / { "1.1" } m horisontaalselt mõõdistatud koordinaadi suhtes.

# text
seg-b107ba0607b0 = Päris vastuvõtja asukoht, lahendatud päris RINEX koodipseudovahemaadest + edastatud efemeriidist iteratiivse kaalutud vähimruutude meetodiga — Sagnaci/Maa pöörlemise parandus, edastatud kell TGD-ga, kahesageduslik L1/L2 ionosfäärivaba kombinatsioon (või ühesageduslik Klobuchar), Saastamoinen/Niell troposfäär, kõrgusnurga kaalumine, DOP ja hetktõmmise RAIM.

# text
seg-5819c351d123 = Segamise ja mitmekihilise spuufimise tuvastamine

# text
seg-9a03f3db9ef0 = χ²₁ NP detektor · suletud kuju ja Monte Carlo P_fa/P_md nõustuvad

# text
seg-788fdc9a22a1 = Lingibilansi segamismudel (J/S → efektiivne C/N₀ → lukustuse kaotus), stohhastiline aja spuufimise detektor (Neyman–Pearsoni / χ²₁ energiatest Monte Carlo P_fa/P_md-ga ja turvalisuse kvaliteedinäitaja { "1" } − P_md) ning mitmekihiline spuufimise detektor, mis sulandab RAIM-kooskõla pariteeditesti, RF AGC-võimsuse monitori ja signaalikvaliteedi (SQM) monitori. Lisaks kvantinertsiaalne arvestusliku navigeerimise veabilanss, mis koostab külmade aatomite interferomeetri valge müra triivi jääknihke (ristkontrollitud sõltumatu integraatoriga) ja skaalateguri veaga asukohatriivi holdover-i kohta arvuks — kella holdover-i inertsiaalne kaksik.

# text
seg-87bca15c6939 = Modulatsioon, segamisvastasus ja koodi jälgimine

# text
seg-c7d3ff7ea829 = Navigatsioonisignaali jõudlus

# text
seg-1aec700caefe = BPSK enda-SSC = 2/(3R_c) · alla meetri C/A DLL värin { "45" } dB-Hz juures · GPS C/A Goldi ristkorrelatsioon -23.9 dB

# text
seg-304803ee178d = Signaali jõudluse kiht lingibilansi ja mõõtmisruumi vahel: ühikpindalaga võimsusspektri tihedused BPSK-R(n) ja siinus-BOC(m,n) jaoks, spektraalse eraldumise koefitsient, mis tuletab segamismudeli otse tarbitava segamisvastase Q tegeliku signaali ja segaja spektritest, RMS (Gabori) ribalaius, mis määrab vahemaamõõtmise informatsiooni sisu (BOC > BPSK), koherentne varajane–hiline DLL koodijälgimise termilise müra värin ning koherentne varajane-miinus-hiline mitmeteelevi vea ümbris kitsa korrelaatori summutusega, ja vahemaakoodi kujunduse kompromiss (m-jada/Goldi autokorrelatsiooni külgsagar ja kolmeväärtuseline Goldi ristkorrelatsiooni piir, pluss koodipikkuse ja ühemõttelise vahemaa pöördülesanne). See on signaali jõudluse analüüs, mitte RF-kasuliku koorma ega antenni riistvara kujundus.

# text
seg-684494a7877c = Passiivne RF-geolokatsioon (TDOA/FDOA)

# text
seg-414872cdf952 = Passiivne RF-geolokatsioon

# text
seg-bed5944d15dd = mürata TDOA otse→pöörd täpsusega { "1e-6" } m · J·CRLB = I · GDOP monotoonne vastuvõtjate arvu suhtes · hindaja saavutab oma CRLB { "4000" } Monte Carlo katse jooksul

# text
seg-be8f2a419275 = Segaja või spuufija (või juhusliku allika pöör-PNT jaoks) asukoha leidmine saabumisaja erinevuse hüperboloididest üle vastuvõtjate võrgu, lahendatud Gauss–Newtoni vähimruutudega; saabumissageduse erinevuse lisamine liikuvate vastuvõtjatega taastab ühiselt kiirgaja asukoha ja kiiruse, koos Cramér–Rao piiriga asukoha kovariatsioonil võrgu geomeetriast. Punktallika otsenähtavuse mudel — ilma mitmeteelevi / NLOS-i, vastuvõtja kella nihke või murdumise liikmeteta.

# text
seg-48e98ff7065e = RINEX, SP3 ja CCSDS vormingud

# text
seg-7c6f4dc6bcba = Koostalitlus

# text
seg-ae8dc649ab26 = edastatud efemeriid + SP3 interpolatsioon vs RTKLIB; OEM vs sõltumatu CCSDS parser

# text
seg-75aae4d201fd = Mitme GNSS-i RINEX-3 edastatud efemeriidi sisendamine (GPS, Galileo, QZSS, BeiDou, GLONASS), RINEX-3 vaatluste parser (RINEX { "4.00" } vaatluste paigutuselt eeldatakse, et see parsitakse, kuid ühtegi { "4.00" } faili pole selle kaudu loetud; RINEX { "4" } navigatsioonifailid lükatakse nime järgi tagasi), SP3-c/d täppisefemeriidi lugeja/kirjutaja Lagrange'i interpolatsiooniga ning CCSDS OEM { "2.0" } + OMM (keskmiste elementide) eksport lennudünaamika tööriistadele (GMAT, Orekit, STK) ja CCSDS-TDM ({ "503" }) jälgimisandmete sõnumi parsimine + väljastamine kaugkosmose radiomeetrilise jälgimise jaoks.

# text
seg-1f379e235f5f = Masinkontrollitud kontrollimaatriks

# text
seg-a4d10bb41065 = Kontrollimine ja kindlustamine

# text
seg-72ec664ea7ae = kontrollitud read nõuavad välist sõltumatut etaloni; invariant jõustatakse CI-s

# text
seg-cab165105f32 = Nõue → moodul → test → sõltumatu etalon → olek ristviide, renderdatud mootorist endast (Markdown/CSV), ühiktestitud aususe invariantidega: rida võib olla märgitud kontrollituks ainult siis, kui sellel on väline sõltumatu etalon (NIST / AIAA / SOFA / IGS / avaldatud väärtus), nii et sisemine isekooskõla kontroll ei saa teeselda valideerimist — ning riistvara/PA võimekused, mida Kshana ei paku, on registreeritud partneri omanduses olevate lünkadena. ECSS-E-ST-10-02 kontrollimise ristviite täidetav selgroog.

# text
seg-190cdf3ca8dc = Ühik ja päritolu igal esitataval suurusel

# text
seg-3e7fb040a7c4 = Iga arvväli, mille stsenaarium väljastab, kannab ühikut ja päritoluklassi suletud sõnavarast, definitsiooniga seal, kus see on olemas, avaldatud masinloetava skeemina mootori kõrval. Ratšetiga värav käivitab iga sisseehitatud liigi ja kukub läbi väljal, mis ei kanna ühtegi; veel mittetäielikud liigid nimetatakse ükshaaval koos põhjusega, miks iga on endiselt lahtine, ja loend saab ainult kahaneda. Aruanded, mis esitavad oma konstandid — ühesuunaline lingibilanss, optiline ja RF bilanss — võimaldavad lugejal põhinäitaja ainuüksi aruandest uuesti arvutada.

# text
seg-0e1a01c9158a = Stardi-, taassisenemise-, katvuse- ja suunamisbilansid

# text
seg-f5cf9e86d3c9 = Missioonianalüüs

# text
seg-767b2cd5f4ba = kontrollitud suletud kujuga (stardiasimuut · Allen-Eggers · SMAD)

# text
seg-23bac81d700b = Esimese astme missioonikujunduse bilansid, igaüks käivitatav stsenaarium: kahe keha stardi- ja tõusugeomeetria (stardiasimuut, minimaalne kalle, Maa pöörlemise boonus, dogleg tasapinna muutuse Δv, päevased võimalused), Allen–Eggersi ballistilise taassisenemise koridor (maksimaalne aeglustus, maksimaalse g ja maksimaalse kuumutuse kiirused), Maa vaatluse katvuse geomeetria (haare / nadiiri GSD / nadiirist kõrvale juurdepääs / uuesti külastus SMAD kosmosetrianguli kaudu), 3-DOF asendi ja suunamisvea bilanss (gravitatsioonigradiendi moment + RSS suunamisbilanss), maajaama ülelennu prognoos (AOS/TCA/LOS, maksimaalne tõusunurk, juurdepääs) ja ühesuunaline lingibilanss CCSDS { "401" } / DSN 810-005 lingivõrrandi üle (FSPL, C/N₀, Eb/N₀, varu, sulgumine). Enne riistvara analüütiline kiht STK/GMAT/Basilisk all — modelleeritud esimese astme bilansid, mitte 6-DoF-i ega radiomeetrilise asendaja.

# text
seg-43f53b910042 = Navigatsiooni ja side apertuuri jagamine

# text
seg-989637b0c6fc = Seansipõhine katkestus ja konkurents, mitte üks töötsükli arv

# text
seg-5c63a4559aff = Sisse: kontaktiplaan ja apertuuride arv; välja: navigatsiooni töötsükkel, side töötsükkel, seansipõhine katkestus ja konkurents. Arbitreerimispoliitika on aruandes nimetatud, mitte vihjatud, ja seanss, mida ei saa täielikult teenindada, esitab kaotsi läinud osa, mitte ei kao keskmisse.

# text
seg-c8eb43aeb31a = Kosmoseilm ja termosfääri tihedus

# text
seg-37b8c9397544 = Kosmosekeskkond

# text
seg-25e24a6c0ba3 = Jacchia-71 kontrollitud avaldatud päikese miinimumi / keskmise / maksimumi vastu

# text
seg-1eff250f41c3 = Kosmoseilma keskkonnamudel: päikese (F10.7 / tsentreeritud 81-päevane F10.7a) ja geomagnetilise (Kp, definitsioonilise Kp↔ap tabeliga) aktiivsuse indeksid, nende juhitav Jacchia-1971 eksosfääri temperatuur ning aktiivsusega korrigeeritud versus staatiline termosfääri neutraaltihedus kõrgusel — päikesetsükli tiheduse sõltuvus, mille staatiline atmosfäär välja jätab. Kalibreeritud esimese astme skaalakõrguse sidestus, mitte andmetega kontrollitud NRLMSISE atmosfäär.

# text
seg-49bac998eb07 = RF-häirete tuvastamise hindamine ja PNT kompromiss

# text
seg-dca720256d85 = Masinõppe hindamine ja kompromiss

# text
seg-5f0a39efe160 = AUC-raamistik kontrollitud binormaalse suletud kuju Φ(d′/√{ "2" }) vastu (Gneiting & Vogel { "2018" }); hindamismõõdikud kontrollitud bitthaaval vs scikit-learn { "1.9.0" } — sünteetiline korpus, mitte toor-IQ/TEXBAT

# text
seg-0dc3a7135442 = RF-häirete tuvastamise hindamise katsestend: märgistatud, parameetritel põhinev sünteetiline korpus (nominaalne / segamine / aja spuufimine / asukoha spuufimine / mitmeteelevi), detektorist sõltumatu ROC/AUC raamistik, mis hindab mis tahes detektorit klassipõhise Pd-ga sihtväärtuse Pfa juures, ning jaotuses versus jaotuseväline optimismilünk. Sügavam optimismilünga uuring laiendab seda 13 detektori paneelile (energia / AGC / SQM / pariteet pluss algväärtusega (seed) logistilise regressiooni ja ühe peidetud kihiga MLP detektorid), jaotuses versus jaotusevälise skaleerimisseadusega permutatsiooni nullhüpoteesiga ning jaotusevälise halvenemise leave-one-out ennustajaga; tarkvaraliselt defineeritud vastuvõtja esiots (toor-IQ/IF korrelaatori varajaste/põhi-/hiliste harudeni SQM-ini) ja päris andmete sisendusadapterid (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) lasevad samadel detektoritel töötada kohapeal antud salvestistel. Lisaks kvant vs klassikaline PNT kompromiss, mis kvantifitseerib kandidaatkella ajastuse ja inertsiaalse holdover-i kasu mõõdetud ADEV kõverast klassikalise lähtetaseme suhtes, koos GNSS-i puudumisel vastupidavus vs aeg ümbrisega. Modelleeritud tööomadused — mitte kunagi väli-/IQ-andmed, ei mingit hea/halb otsust.

# text
seg-8766e058334d = Kvant vs klassikaline vastupidavuse ristumiskaart

# text
seg-8f851e9cf8c2 = genereerib uuesti inertsiaal- ja kella ristumisuuringud Tulemuste jooniste taga; kompromissituumad kontrollitud vs scipy { "1.17.1" }

# text
seg-a057ad4c89ce = Reprodutseeritav kaart sellest, kus kvantandur möödub oma klassikalisest vastest parameetrite määramatuse korral: külmade aatomite vs navigatsiooniklassi arvestuslik navigeerimine ja optiline vs kiibimõõtmetes kella holdover, katkestuse kestuse ja platvormi vibratsiooni üle, iga kõver kannab tehnoloogilise valmiduse märgist. Reprodutseeritav käsuga cargo run --bin crossover_study. Modelleeritud jõudlusbilansid — sisendid on avaldatud või piiritletud koefitsiendid, mitte lennuandmed.

# text
seg-6347618838dd = Tingimuslik ajastuse kaitsetase

# text
seg-a846e806e577 = Ajastuse terviklikkus

# text
seg-762bc9f28716 = koostis ristkontrollitud mitmeastmelise clock_state kovariatsioonirekursiooni vastu; kalibreeritud JammerTest { "2024" } peal (Zenodo { "15911589" })

# text
seg-3622798325cd = Holdover-iga piiratud piir tuvastamata ajaveale GNSS-i spuufimise korral: sõltumatu ristkontrolli korral on teenindatud aja viga piiratud k-sigma monitori põhitasemega, van-Loani edasiliikumise dispersiooniga tuvastusviivituse jooksul ja CUSUM-i häireaja ootusega. Kalibreeritud päris salvestatud spuufimisel (JammerTest { "2024" }) ja reprodutseeritav käsuga cargo run --example tpl_jammertest. Modelleeritud koostis, tingimuslik tuvastamisele — lõplikku tingimusteta piiri ei ole, sest piisavalt aeglane ramp pääseb ühest kellaga abistatud monitorist mööda.

# text
seg-734a93b6a809 = PNT vastupidavuse hindamine ja otsuse ebastabiilsus

# text
seg-c25b4e240fb5 = Vastupidavuse hindamine

# text
seg-f42ae8719e02 = { "35" } käsitsi tuletatud sõltumatu etaloni testi; bait-deterministlik uuringuartefakt (fikseeritud algväärtus (seed)); joondatud DHS RPCF v2.0-ga

# text
seg-8e69193ca540 = Raamistikuga joondatud hindamismootor (DHS RPCF kategooriad), mis kaardistab arhitektuuri simuleeritud käitumise dimensioonipõhisteks alamhinneteks ning küsib seejärel, kas mõni üksik koondhinne või küpsustase on otsuse jaoks stabiilne alus — Dirichlet' kaalumise simpleksi, Kendalli tau järjestuse ebastabiilsuse, top-1 võitja vahetumise määra ja ühisrežiimi mitmekesisuse kollapsi (Hill-N2) kaudu — terviklikkuse räsiga kindlustusaruandega. Reprodutseeritav käsuga cargo run --example resilience_report. Modelleeritud sünteetilised arhitektuurid, joondatud RPCF v2.0-ga; enesehinnang, mitte sertifitseerimine.

# text
seg-62ef40799af4 = Tuvastamata jäänud sündmus → terviklikkuse piirkonnad

# text
seg-52e55797d77c = Terviklikkuse mõju

# text
seg-99025f66f277 = Stanford-ESA terviklikkuse piirkonnad (Tossaint et al., NAVIGATION { "2007" })

# text
seg-13f23ffe5840 = Tuvastamata jäänud sündmuse ja terviklikkuse sild: tuvastamata jäänud spuufimise / segamise / RAIM-i tuvastuse jäetud tuvastamata nihe suurendab efektiivset asukohaviga, mis — võrreldes kontekstipõhiste hoiatuspiiridega — liigitatakse Stanford-ESA terviklikkuse piirkondadesse (kättesaadav / kättesaamatu / eksitav / ohtlik). Koostab väliselt ankurdatud RAIM-i Stanfordi klassifikatsiooni; ei lisa uut terviklikkuse matemaatikat.

# text
seg-3a7572774192 = Kulu katvuse kohta ROI

# text
seg-797d137dc022 = Otsustustugi

# text
seg-d77993b6ef59 = Kulu-katvuse-kohta ROI vaatenurk — kulu tarnitud katvuse ühiku kohta konstellatsiooni / arhitektuuri kompromissi jaoks. Katvuse komponent koostab kontrollitud katvuse geomeetria ja aritmeetika on ühiktestitud, kuid kulu on kasutaja sisend — seega on suhe planeerimisabi, mitte väliselt kontrollitud suurus (seetõttu ausalt öeldes ilma tõestusmärgita).

# text
seg-690b4cb0df55 = Kshana Interchange Format (KIF)

# text
seg-558523b5e0ac = Artefaktide vahetus

# text
seg-b882cccf5cee = versioonitud ümbrik · edasi-tagasi ja edasiühilduv lugemine kontrollitud

# text
seg-ff5a4ead87fe = Versioonitud, enesekirjeldav ümbrik, mis mähib stsenaariumi tulemuse selle liigi, skeemi versiooni ning modelleeritud/kontrollitud märgistega, nii et salvestatud artefakt jääb enesedokumenteerivaks ja vanemad ümbrikud jäävad edasiühilduvalt loetavaks.

# text
seg-5052e1720602 = Laeva vastuvõtja usaldusskoor

# text
seg-70144aeea2d1 = monitori aritmeetika kontrollitud pynmea2 ja GeographicLibi vastu

# text
seg-9d9329128f06 = Hindab, kas laeva navigatsioonifikseeringut saab usaldada NMEA { "0183" } põhjal, mida selle vastuvõtja ja instrumendid juba väljastavad: 0-100 skoor, kolm vahemikku ja nende põhjused, epohhi kaupa, partiina, otse või väravana. Monitorid võrdlevad fikseeringut laeva enda liikumise, kursianduri, kiirusmõõturi ja satelliidisignaali tasemetega. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade: operaator vastutab jätkuvalt. Monitoride aritmeetika on kontrollitud sõltumatute teekide vastu; skoori reegel ja läved on projekti enda ja jäävad modelleeritud.

# text
seg-a47934361f43 = Meeskonna koolituse NMEA voogud

# text
seg-c6492d4a7dae = { "225,227" } lauset parsitud ja dekodeeritud pynmea2 abil

# text
seg-9ca765cc09fc = Kirjutab sünteetilise sillal NMEA { "0183" } stsenaariumi järgi sõidule koos juhendaja stsenaariumiga segamise, asukoha nihutamise, aja spuufimise ja taasesituse sündmustega ning juhendaja logiga, et meeskond näeks, kuidas halvenenud fikseering nende enda instrumentidel välja näeb. Ainult tekst, mitte kunagi laeva reaalajas navigatsioonisüsteemide jaoks; midagi ei edastata ja raadiosignaali ei tehta. Laused ja nende dekodeeritud väärtused on kontrollitud; vastuvõtja, taeva ja sündmuste mudelid on modelleeritud.

# text
seg-39f61b88209e = koodide tähendused ja geomeetria kontrollitud pyModeS, pyais, shapely ja GeographicLibi vastu

# text
seg-4c1667d3d453 = Koostab päevapõhise GeoJSON-kaardi sellest, kus õhusõidukid (ADS-B) ja laevad (AIS) teatasid halvenenud navigatsiooniandmetest, avatud litsentsiga sisenditest, ning marsruudi osakaalu, mis läbib halvenenud ruute. Halvenenud ruut on väide teatatud täpsusväljade või ebatõenäoliste asukohtade kohta, mitte häirete järeldus, ja ruut, mida keegi ei vaadelnud, ei ole tõend vaba marsruudi kohta. Varasemad teated, mitte prognoos.

# text
seg-e0962980e96f = Usaldustelemeetria turvaoperatsioonide jaoks

# text
seg-9b538e790bd7 = Prometheus, OTLP ja CEF loetud tagasi sõltumatute parserite poolt

# text
seg-f33e062790d9 = Ekspordib usaldusvoo Prometheuse mõõdikutena, OpenTelemetry (OTLP/HTTP) ning CEF- või LEEF-syslog sündmustena üle stdout-i, HTTP, UDP või TCP, nii et turvaoperatsioonide keskus näeb navigatsioonirikke oma teiste häirete kõrval. Surnud koguja ei peata hindamist ega jää märkamata. Prometheus, OTLP ja CEF loetakse tagasi sõltumatute parserite poolt; LEEF-i kontrollitakse ainult selle enda spetsifikatsiooni vastu.

# text
seg-c74f3b9569b1 = Allkirjastatud tõendipaketid

# text
seg-28016686504c = RFC { "8032" } vektorid bait baidi haaval; puhta ruumi (clean-room) verifitseerija nõustub { "71" } paketil

# text
seg-123fa1de2e23 = Koondab usaldussündmuse ümber oleva akna räsiahelaga, Ed25519-allkirjastatud tõendipaketiks, mida igaüks saab võrguühenduseta kontrollida: muudetud, eemaldatud, vahetatud või lisatud fail, uuesti allkirjastatud pakett või vale kinnitatud võti nimetatakse. Valikuline RFC { "3161" } ajatempli token on sellega seotud. Tehniline kirje, mitte õiguslik arvamus, faktiline järeldus ega kinnitus.

# text
seg-ee2e250497f9 = Katsestendi eksport

# text
seg-ea618add831e = teisendused ja kodeeringud kontrollitud PROJ, GeographicLibi, pynmea2 ja SciPy vastu

# text
seg-be8af88f4f99 = Kirjutab stsenaariumi sõiduki liikumise ja sündmused CSV trajektoorina ja NMEA { "0183" } laboratoorse GNSS-simulaatori jaoks: Maaga kinnitatud, geodeetilised ja kohaliku kiiruse veerud, asend ja UTC. Ainult liikumine ja sündmused: signaali ei kirjutata ega väideta simulaatori ega vastuvõtja jõudlust.

# text
seg-1ff1d8ebf1e7 = Compliance-kaardistus avalike raamistikega

# text
seg-83af3fa21509 = Kaardistab Kshana väljundid avalike raamistike klauslitele (IMO juhend laevadele, EL NIS2 artikkel { "21" }, EN { "16803" }, USA DHS vastupidava PNT raamistik ja EASA lennunduse juhend) ainult klausli numbri järgi, täidetuna antud käikudest, ja ütleb, milliste ridade kohta käikude komplekt toetab tõendeid (supports evidence for), iga rea lüngaga. See ei ole järeldus, et mõni raamistik on täidetud, ega kellegi hinnang ega heakskiit.

# text
seg-1b784a8701ac = GNSS-i autentimine

# text
seg-2b5a6095013a = kõik { "18" } ametlikku testvektorite komplekti: { "186,382" } silti autenditud, { "0" } ebaõnnestunud

# text
seg-0419e9af208d = Avatud, puhas Rust vastuvõtjapoolne kontrollija Galileo avatud teenuse navigatsioonisõnumi autentimiseks: see kontrollib, millise satelliidi navigatsiooniandmeid vastuvõtja saab I/NAV lehtedest või u-blox UBX voost autentida, läbi avaliku võtme, võtmeahela ja sildi kontrollide signaali kosmoses spetsifikatsioonis, ning esitab autentimise satelliidi ja aja kaupa. See autendib andmeid; see ei väida mingit spuufimisvastast jõudlust.

# text
seg-d8bb6226f2e3 = Horisondijoonega maskeeritud nähtavus, DOP ja veaellips

# text
seg-6c6e7248496f = Taeva geomeetria

# text
seg-94ff262653a6 = { "1173" } vaatenurka ja { "142" } nähtavat komplekti ühtivad Orekit { "12.2" } ja gnss_lib_py { "1.0.4" } omadega täpsusega { "1e-12" }; ellips ühtib numpy-ga { "270" } juhul

# text
seg-309521d4c9e1 = Milliseid satelliite koht näeb, kui hooned, kaid, kraanad või maastik blokeerivad osa taevast, ja mida see teeb DOP-ile (täpsuse halvenemise tegur) ja horisontaalsele veaellipsile. Asimuudist sõltuv horisondijoon asendab ühe kõrgusnurga piiri; nähtav komplekt, selle DOP ja ellips tulevad epohhi ja konstellatsiooni kaupa. Horisondijoon eemaldab otsenähtavuses satelliidid ega midagi enamat: see ei modelleeri peegeldusi, difraktsiooni ega signaali tugevust.

# text
seg-448e81d36ca4 = Horisondijoone eelseadistused ja taevageomeetria funktsioonid

# text
seg-6483f9d89f15 = käsitsi arvutatud väärtused ja geomeetria, mida pilv valimina võtab; puudub väline sõltumatu etalon

# text
seg-ebc2904904d3 = Tänavakanjoni, sektori ja maastiku taandamised horisondijoone tabeliks, neli esinduslikku eelseadistust (linnatänav, sadamasse lähenemine, fjord, konteinerterminal) ja funktsioonid, mis koostavad neist taevakaardi ja Monte Carlo pilve, CLI-st, MCP-st, Pythonist ja brauserist. Eelseadistused on esindusliku geomeetriaga valitud, nimetatud mõõtmetega, mitte mõõdistused, ja taandamisi kontrollitakse ainult käsitsi arvutatud väärtuste vastu.

# text
seg-c2a5a6a7bcb0 = Geomeetriateadlik usalduse klassifitseerimine

# text
seg-2f51e4da63b4 = klassifitseerimise reegel ja läved on projekti enda omad, kontrollitud iseenda vastu

# text
seg-b664ce284745 = Asetab satelliidigeomeetria vastuvõtja usaldusskoori kõrvale ja nimetab klassi iga mahaarvamise kohta: signaali kadu, halb geomeetria või vastuvõtja teatatud DOP-i ja nähtavate satelliitide põhjal tuletatu vastuolu. Geomeetriat hinnatakse ainult siis, kui see on teada, ja märgis on põhitulemus: punkte maksab ainult halb geomeetria. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade.

# text
seg-5026aab26cb8 = Kuu etalonjaama uuring

# text
seg-d6935d32272b = koostab testitud Kuu diferentsiaal-, kella- ja tugisüsteemi funktsioonid; kontrollitud iseenda ja numpy etaloni vastu, väliseid lennuandmeid pole

# text
seg-4f9696706384 = Üks reprodutseeritav uuring sellest, mida Kuu lõunapooluse etalonjaam võiks teha avalike eelduste korral: katvuse ja täpsuse kaart polaarpiirkonna kohal (protsentiilidena parandatud ja parandamata asukohaviga, kättesaadavus põhjusega iga kättesaamatu epohhi kohta, kaitsetasemed ja paranduslingi bilanss), ajalabor, mis hoiab Kuu aja etaloni aatomkellal, ning lisatud laser-retroreflektori ja VLBI majaka geodeesia viie massiivi datumi suhtes. Iga sisend on märgitud oma avaliku allikaga või kui näidis. See ei ole väide ühegi päris süsteemi jõudluse kohta ning Kshana ei ole seotud ühegi agentuuriga.

# text
seg-cad8be3b66a3 = Optilised ajastuslingid läbi pilvede ja turbulentsi

# text
seg-e86745da72f0 = { "7" } eelregistreeritud numbrilist lävi { "7" }-st täidetud sõltumatu mpmath programmi vastu; mõõdetud kättesaadavuse kirjet pole võrreldud

# text
seg-dd98aa94f8c8 = Kui sageli optiline aja edastamise link töötab, kui atmosfäär on teel. Iga maajaama jaoks annab mootor selge õhu kao, Hufnagel-Valley turbulentsi oleku gamma-gamma sähvimise sumbumise ja apertuuri keskmistamisega, kättesaadavuse lingivaru suhtes nimetatud pilveklimaatikast, lae, mida ükski varu ei suuda tõsta, katkestuse kestuse jaotuse ja ajavea, mis katkestus holdover-kellale maksab. Seejärel näitab see, mida annavad lisajaamad, suurem apertuur, teine lainepikkus või adaptiivoptika. Kaasasolevad pilveklimaadid on näidis-, mitte mõõdetud; väljund on nõuandev.

# text
seg-861d57389dd7 = GNSS konstellatsioonist kaugemal: kosmoseteenuse ala ja sellest väljaspool

# text
seg-8705c276af61 = ICG SSV brošüüri tabelid, eelregistreeritud; enamik lävesid NOT MET (xval/gnss-ssv/RESULTS.md)

# text
seg-2dc82174942a = Kosmoseaparaadi jaoks sfääril (ICG kosmoseteenuse ala brošüüri globaalne kest) või Kepleri trajektooril LEO-st Kuu üleminekuni loendab konstellatsiooni kaupa (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kõigi kokku C/N0 läve ületavaid signaale: ühe ja nelja signaali kättesaadavus, pikim katkestus, vastuvõetud C/N0, DOP (täpsuse halvenemise tegur) ning peasagara vs külgsagara lingid. Saatemustrid on brošüüri omad, parameetriline asendaja või antud muster; serva-kiire ionosfääri-, plasmasfääri- ja atmosfäärimudel ning nõrga signaali vastuvõtja kujundus on valikulised; kaasas on pardal GNSS-filter kõrgetele ja Kuu üleminekuorbiitidele ning formatsiooni suhteline navigatsioon. MODELLED: brošüüri tabelitega võrreldes enne käivitust fikseeritud eelregistreerimise alusel ühtivad minimaalse kiiratud võimsuse konstandid ja Kuu lävi, ülejäänud läved on NOT MET eelregistreeritud tõlgenduse korral (peaaegu kõik brošüüri ebajärjekindla GLONASS-i kiirenurga tõttu) ja parameetriline külgsagara asendaja ei reprodutseeri mõõdetud GPS-i paneelimustreid.

# text
seg-61817375c8ea = Kuu orbiit ja pind navigatsiooni- ja geodeetilise infrastruktuurina

# text
seg-d2439abaeabb = numerite numpy/scipy sõltumatu etalon; kolm eelregistreeritud lävi NOT MET (xval/lunar-infra/RESULTS.md)

# text
seg-db45ac2940af = Viis uuringut piiratud kolme keha mudelis: pardal Maa GNSS-i orbiidi määramine peaaegu sirgjoonelisel halo orbiidil sõltumatu maapealse vahemaa ja vahemaakiiruse määramise vastu; ühine pinnajaama ja orbiitri kandelaine faasi täisarvuliste mitmetähenduslikkuste fikseerimine (LAMBDA); seitsmeparameetrilise Kuu datumi Fisheri informatsioon orbiitri-pinna vahemaadega ja ilma; GNSS-i, VLBI ja laserkaugusmõõtmise nihked kohaliku sideme vastu; ning tundlikkus Kuu loodete ja libratsiooni parameetrite suhtes. MODELLED näidissisenditega: numbreid kontrollitakse sõltumatute numpy ja scipy programmide vastu, mitte füüsikat. Eelregistreeritud lävede korral on kolm NOT MET: sisestatud jõuviga ei tuvastata nimetatud määraga (C3), bootstrapitud edukuse määr erineb numpy sõltumatust etalonist arvu { "1.7e-6" } võrra läve { "1e-9" } vastu (Q3) ning vahemaamõõtmise pere lisamine ei vähenda alati pseudo-pöördmaatriksi jälge (G3, jälje pool).

# text
seg-aab745a65e76 = Moodul

# text
seg-d6476863f862 = Võimekus

# text
seg-ad856ad710eb = Staatus

# text
seg-6962adaa6a1f = Genereeritud ehitusajal hoidla stsenaariumifailidest ja kontrollimaatriksist.

# text
seg-30200bb5be58 = Käivita orbit-sgp4-gps.toml rakenduses Kshana Studio

# text
seg-ecacc78711a1 = Käivita realtime-frame-eop.toml rakenduses Kshana Studio

# text
seg-fe9baedab7f0 = Käivita imu-deadreckoning.toml rakenduses Kshana Studio

# text
seg-58a3232bc4cf = Käivita ins-trn-coast.toml rakenduses Kshana Studio

# text
seg-27ffc4dfa394 = Käivita gps-denied-gravity-nav.toml rakenduses Kshana Studio

# text
seg-eb0c08082d24 = Käivita gnss-ins.toml rakenduses Kshana Studio

# text
seg-8d0f45d119a9 = Käivita lunanet-araim.toml rakenduses Kshana Studio

# text
seg-09641b89ad3a = Käivita lunar-frame-realisation.toml rakenduses Kshana Studio

# text
seg-4eea1b7d77cd = Käivita moonlight-service-volume.toml rakenduses Kshana Studio

# text
seg-3cd4cd7d7c16 = Käivita lunar-interop-export.toml rakenduses Kshana Studio

# text
seg-d767de2fa87a = Käivita lunar-llr-datum.toml rakenduses Kshana Studio

# text
seg-29266e8878ac = Käivita lunar-differential-pnt.toml rakenduses Kshana Studio

# text
seg-0955d6ded82d = Käivita lunar-time-budget.toml rakenduses Kshana Studio

# text
seg-ab41004755ea = Käivita lunar-jamming.toml rakenduses Kshana Studio

# text
seg-edbe5cf449a0 = Käivita lunar-vlbi-fim.toml rakenduses Kshana Studio

# text
seg-d706c2d59dd1 = Käivita mars-pnt-lmo.toml rakenduses Kshana Studio

# text
seg-71586c459df8 = Käivita hybrid-optical-rf.toml rakenduses Kshana Studio

# text
seg-87634a6d41b5 = Käivita integrity-raim.toml rakenduses Kshana Studio

# text
seg-a281aa02ddc7 = Käivita araim-reference-check.toml rakenduses Kshana Studio

# text
seg-9184b54b1173 = Käivita clock-holdover.toml rakenduses Kshana Studio

# text
seg-2f270136b41d = Käivita gnss-sim-raim.toml rakenduses Kshana Studio

# text
seg-f2f3ede70967 = Käivita pvt-abmf.toml rakenduses Kshana Studio

# text
seg-eac325fbeed1 = Käivita spoof-attack.toml rakenduses Kshana Studio

# text
seg-07d55d3e7bdc = Käivita oem-interop.toml rakenduses Kshana Studio

# text
seg-5b70a59accce = Käivita aperture-duty-cycle.toml rakenduses Kshana Studio

# text
seg-d3df277fd118 = Käivita space-weather.toml rakenduses Kshana Studio

# text
seg-7dc863bf8f7b = Käivita impairment-eval.toml rakenduses Kshana Studio

# text
seg-1c3083a77264 = Käivita conflict-resilience.toml rakenduses Kshana Studio

# text
seg-b3f2b2d88d8c = Käivita gnss-ssv-shell.toml rakenduses Kshana Studio

# text
seg-e42b759ccbaf = Käivita lunar-infrastructure-od-consistency.toml rakenduses Kshana Studio

# text
seg-60a43431ebe0 = Nõue

# text
seg-cbf0f9bcd2d8 = Sõltumatu etalon

# text
seg-1603e76bcf66 = Astmeseaduse mürategurite tuvastamine lag-1 autokorrelatsiooni abil

# text
seg-d95fe5878ee3 = allan::lag1_noise_id: Riley ja Greenhalli ({ "2004" }) lag-1 autokorrelatsiooni müratuvastaja (detsimeeritud faas oma ruutliikmest puhastatult või rühmakeskmistatud sagedus oma sirgest puhastatult; korduvad esimesed vahed, kuni delta = r1/({ "1" }+r1) < { "0.25" } või d = dmax), mis tagastab täisarvulise ja ümardamata astmeseaduse astendaja alfa (+{ "2" } valge PM kuni -2 juhusliku käimise FM) mis tahes keskmistamisteguri juures; see seab müratüübi vabadusastmed mõõdetud kellateegi seadmekaartidele

# text
seg-6e0cb6acc073 = VALIDATED

# text
seg-4d820e75cd4f = allantools { "2024.6" } autocorr_noise_id (A. Wallin ja kaastöötajad, LGPL-3.0-or-later, käivitatud eraldi programmina fikstuurigeneraatori poolt): avaldatud Riley-Greenhalli algoritmi sõltumatu realisatsioon, esitatud konventsioonide all ühemõtteliselt määratud suurus. Kontrollib tuvastajat, mitte ühegi päris kella müra sisu

# text
seg-aedf395f3597 = Galileo OSNMA vastuvõtjapoolne navigatsiooniandmete autentimine

# text
# c1: kshana osnma verify
seg-1e6e62438dad = osnma + <c1/>: avatud, puhas Rusti vastuvõtjapoolne verifitseerija Galileo OSNMA jaoks (SIS ICD Issue { "1.1" }, Receiver Guidelines Issue { "1.3" }) I/NAV lehtedelt või u-blox UBX-RXM-SFRBX voost: Merkle'i puu avalikud võtmed (DSM-PKR), DSM-KROOT ECDSA P-256/P-521 allkiri, TESLA võtmeahela kontroll (SHA-256 või SHA3-256), MACSEQ ja sildi kontroll (HMAC-SHA-256 või CMAC-AES) ADKD { "0" }, { "4" } ja { "12" } jaoks ristautentimisega, ahela lõpp/tühistamine/uuendamine, avaliku võtme uuendamine ja tühistamine ning häiresõnum; satelliidi kaupa olek Authenticated/Failed/Unavailable koos põhjusega iga tõrke või viivituse kohta. Nõuandev: mitte tüübikinnitust omav navigatsiooniseade ja mitte navigatsiooni terviklikkuse teenus; spuufimisvastast toimivust ei väideta

# text
seg-a6bd60ed728f = Euroopa GNSS-teenuskeskuse avaldatud ametlikud Galileo OSNMA testvektorid Receiver Guidelines lisana (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } komplekti { "18" }-st, { "186,382" } silti autenditud, { "0" } ebaõnnestunud, käivitatud võrguühenduseta 2026-10-10 (tõendikirje kshana-pro docs/evidence all). Ulatus: vektorid kontrollivad krüptograafilist verifitseerimist (Merkle, KROOT/ECDSA, TESLA ahel, MACK sildid, ADKD 0/4/12) ja selle tulemusi avaldatud stsenaariumidel; nad kasutavad ainult HMAC-SHA-256, SHA-256 ahelat, 128-bitiseid võtmeid, 40-bitiseid silte ja otsingukirjeid { "33" } ning { "34" }, seega katavad CMAC-AES, SHA3-256 ahelaid ja muid parameetreid ainult avaldatud primitiivide teadaoleva vastuse testid ja sünteetilised testid. Usaldusväärse aja, andmesideme, aegumise ja päise kinnituse tugevdust testivad sünteetilised ründetestid, mitte välise sõltumatu etaloni abil. Ei kontrollita: sertifikaaditühistusnimekirju, reaalajasignaale ega reaalajavastuvõtjat (UBX sõnaskeemi kontrollitakse ainult sünteetilistel kaadritel), SHA3-256 Merkle'i puid, värskust ilma sõltumatu ajata. Ei ole EL teenus

# text
seg-27a61718eb95 = Sageduse stabiilsuse iseloomustamine

# text
seg-56174d771190 = Alani/modifitseeritud/Hadamardi hälve + astmeseaduse müratuvastus χ² usaldusvahemikega

# text
seg-ed01b2ab3481 = NIST SP { "1065" } (Riley) / Stable32 viitehälbed NBS14 peal

# text
seg-25b78672c194 = Sageduse stabiilsus päris mõõdetud kellal

# text
seg-fd378f5fe04a = Kattuv Alani + kattuv Hadamardi hälve päris tseesiumietalonil

# text
seg-64fd49d58394 = Stable32 kattuv ADEV/HDEV mõõdetud 5071A tseesiumi faasireal (allantools)

# text
seg-f305dbc83f2b = Alani hindaja võrdlus kanoonilisel Stable32 viiteseerial

# text
seg-5bfca5dcfb7c = Kattuv Alani + modifitseeritud Alani + ajahälve kogu AF redelil

# text
seg-327ab6dcf16a = Stable32 viitehälbed faili PHASE.DAT jaoks (Riley; standardne regressiooniseeria)

# text
seg-96c4275f5a89 = Laiendatud ulatusega sageduse stabiilsus (Theo1 / TOTDEV)

# text
seg-7f59c3631ca4 = Theo1 ja kogu hälve (TOTVAR) — laiendatud ulatusega pika-tau stabiilsuse hindajad, mis ulatuvad ~{ "75" }%-ni kirjest, kus Alani hälve annab alla ~{ "50" }% juures; nendele ehitatud nihkest puhastatud ThêoH hübriid (allan::theoh_curve) jääb MODELLED

# text
seg-a38edc2526f5 = allantools { "2024.06" } — sõltumatu kolmanda osapoole sageduse stabiilsuse teek — theo1 (NIST SP { "1065" } eq { "30" }) ja totdev (NIST SP { "1065" } eq { "25" }) hermeetilisel NIST SP { "1065" } §{ "12.4" } LCG andmekogumil; taasgenereeritav võrguühenduseta failiga tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py

# text
seg-cc40472fbcbf = Maksimaalne ajaintervalli viga (MTIE) — telekommunikatsiooni wander-mõõdik

# text
seg-5c54ba2748f7 = MTIE(τ): maksimaalne tipust tippu ajavea kõikumine mis tahes libiseval aknal τ = m·tau0, ITU-T G.810/G.823/G.8261 wander-statistik, mille vastu on kirjutatud sünkroonimisvõrgu piirid (MTIE maskid) — ekstremaalne (max/min) arv, mis erineb RMS Alani perest

# text
seg-300fd3f945a0 = allantools { "2024.06" } — sõltumatu kolmanda osapoole sageduse stabiilsuse teek — mtie() hermeetilisel NIST SP { "1065" } §{ "12.4" } LCG faasiseerial; MTIE on puhas max/min statistik, seega on hindaja väljund bitttäpne allantools-i vastu identselt ehitatud faasimassiivil (sissekantud 15 olulise numbriga viitekonstandid asuvad { "1" } ULP piires). Taasgenereeritav võrguühenduseta failiga tests/fixtures/mtie/generate_mtie_reference.py

# text
seg-67d73f3ca14d = Modifitseeritud Alani / ajahälve (MDEV / TDEV)

# text
seg-9ac9d2b0bdf8 = MDEV(τ): kattuv modifitseeritud Alani hälve (teise vahe libiseva akna hindaja, mis eristab valget faasimüra flicker-faasimürast) ja TDEV(τ) = τ/√{ "3" }·MDEV(τ), ITU-T G.811/G.812/G.823 ajadomeeni wander-statistik, mille vastu on kirjutatud sünkroonimismaskid

# text
seg-24a441f32375 = allantools { "2024.06" } — sõltumatu kolmanda osapoole sageduse stabiilsuse teek — mdev() ja tdev() hermeetilisel NIST SP { "1065" } §{ "12.4" } LCG faasiseerial (sama seeria mis Theo1/TOTDEV/MTIE ridadel), arvutades samu üheselt määratud hindajaid; ühtivad <{ "1e-9" } suhtelise täpsusega. Taasgenereeritav võrguühenduseta failiga tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py. (Andmetega lülitatud phasedat_reference.rs kontrollib neid ka Stable32 vastu täpsusega { "1e-3" }; see on tihe, alati sisselülitatud hermeetiline ristkontroll)

# text
seg-e4b6d707cbf5 = Optilise kella sageduse stabiilsus päris mõõdetud kõveral

# text
seg-e9077554a08f = Astmeseaduse (valge-FM + punase müra põrand) NNLS taastamine avaldatud mõõdetud ⁸⁸Sr optilise kella üleminekuga Alani hälbest — reprodutseerides σ_y(τ) ja peamist 4.7e-16/√τ lühikese-τ skaleerumist päris mõõdetud pika-τ põrandaga, mitte sünteesitud optilise klassi põrandaga, mida holdover.rs muidu eeldab

# text
seg-4eaf0c102678 = Norcia, Young, Eckner, Oelker, Ye, Kaufman, Science { "366" }:{ "93" } ({ "2019" }), Fig. { "4" } mõõdetud ADEV; kõver kopeeritud sõna-sõnalt Zenodo 10.5281/zenodo.3382347 (CC-BY-4.0). Piiratud avaldatud mõõdetud stabiilsuskõvera reprodutseerimisega — kellaklassi holdover-i-lävendini seadmenäitajad jäävad MODELLED

# text
seg-cc95c8615d39 = Terviklikkus (RAIM/ARAIM/SBAS)

# text
seg-d4ad9cfa4f9b = ARAIM mitme hüpoteesi lahenduse eraldamine ARAIM Airborne Design Document (ADD) v4.2 järgi (araim_reference::add_v42_protection_levels ja add_v42_protection_levels_ecef: alamhulga määramine P_THRES ja FC_THRES reeglitega, VPL, HPL, efektiivne monitori lävi EMT ja sigma_acc); hii-ruut hetktõmmise RAIM rikete tuvastamine ühe satelliidi välistamisega (raim::snapshot_raim, raim::snapshot_raim_fde) ja kaldepõhine HPL/VPL geodeetilisel kohalikul tasemel; ning SBAS DO-229E kaitsetaseme kombinatsioon (sbas::sbas_protection_level) L1 teenusel. MITTE kaetud, öeldud otse: ühtlase sigmaga mugavusfunktsioonid raim::araim_raim ja raim::araim_dual_raim MITTE ei järgi ADD-d (sobitatud sisendite korral jäävad nad Stanford MAAST-ist mööda { "0.75" } m VPL / { "4.04" } m HPL ja { "0.39" } m VPL / { "1.93" } m HPL, leid); kahesageduslik mitme konstellatsiooni (DFMC) L5 SBAS võrdlus on leid ({ "308" } kasutajaepohhi paari, kus GEO nähtaval ei ole, kaitseb Kshana, kuid mitte MAAST, mille GEO-vastuvõtu väravat Kshana ei modelleeri); raim::solution_separation_raim jaoks välist võrdlust ei ole

# text
seg-1c37702cc5f2 = Orbiidi propageerimine ja määramine

# text
seg-4d8ef6c0aa45 = SGP4/SDP4, Cowell 6-DOF + häiringud, partii/järjestikune OD

# text
seg-c84585f43297 = AIAA 2006-6753 SGP4 kontrollvektorid

# text
seg-50c545872e4f = Numbriline Cowelli propageerija ja jõumudel

# text
seg-74f8c585bcfd = Cowelli numbriline propageerija hierarhilise jõumudeliga (kahe keha, J2–J6 tsonaalne, Päike/Kuu kolmanda keha, kahurikuuli SRP, eksponentpidurdus); RK4 sammu kahekordistamine / DP5({ "4" }) / DOP853

# text
seg-c9b486609293 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 — sõltumatu teek, erinev integraator ja sfäärilise harmoonilise rekursioon. Konservatiivsed tasemed (kahe keha → J2–J6 tsonaalne → Päike/Kuu kolmas keha → kahurikuuli SRP) langevad kokku alla meetri { "24" } h kaarel, kontrollides integraatorit + jõualgebrat; pidurdustase ning absoluutne Päikese/Kuu efemeriidi / tiheduse sisendi täpsus jäävad MODELLED (ainult iseloomustus)

# text
seg-d38c4be472ac = Lapiku Maa SRP vari (valikuline)

# text
seg-ab8247c6b4d2 = SRP valgustatud osa WGS-84 ellipsoidiga varjutava kehana (näiv Maa raadius ellipsoidi servast Päikese suunas, kahe ketta läätse valem; srp_shadow::oblate_conical_shadow), valikuline Cowelli jõumudelil kaudu propagator::ForceModel::srp_shadow (vaikimisi: sfääriline koonuse vari, muutmata)

# text
seg-01066d639b39 = Kast-tiiva ja ECOM2 päikesekiirguse rõhk osatuletistega (valikuline)

# text
seg-2a5fc9708bd0 = Mitte-kahurikuuli SRP: kast-tiiva lamepaneeli mudel (Vallado eq. 8-44; ühepoolsed keha paneelid, päikesele suunatud tiivad) koos GSC satelliidi metaandmete Galileo FOC, IOV ja IOV eluea lõpu tabelitega, nominaalse GNSS-i yaw-suunamisega, analüütiliste osatuletistega kiirgusteguri ja iga paneeli peegeldus- ja hajuskoefitsientide jaoks; ning ECOM2 empiiriline mudel (D2/B1) selle osatuletistega. Kast-tiib on valikuline Cowelli propageerijal (propagator::ForceModel::box_wing_srp, seades selle välja srp_boxwing) ja täppisorbiidi määramise mudelil (precise_od::PreciseForceModel::box_wing_srp), asendades kahurikuuli liikme cr-iga kui kiirgusteguriga; mõlemad on vaikimisi None, jättes iga olemasoleva tee baidi baidi haaval identseks. ECOM2 ei ole jõumudelisse ühendatud

# text
seg-bde1b3a94a47 = Päikese servapimenemisega SRP vari (valikuline)

# text
seg-eaaec545dd68 = SRP valgustatud osa kui servapimenemisega päikesevoo varjutamata osa (Eddingtoni lähenduse seadus I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre'i kvadratuur) sfäärilise või WGS-84 Maa kohal (srp_shadow::limb_darkened_shadow, ShadowModel variant OblateEarthLimbDarkened)

# text
seg-76cb4b668ad5 = Välist ei ole: Orekit { "12.2" } ei sisalda servapimenemisega valgustussuhet. Kontrollitud ainult sama seaduse kinniste kujude vastu

# text
seg-673b17e9dcf7 = NRLMSISE-00 termosfääri tihedus

# text
seg-09e997231de8 = NRLMSISE-00 empiirilise termosfääri (gtd7 ja gtd7d: liikide tihedused, kogumassitihedus anomaalse hapnikuga, temperatuurid; { "24" } lülitit; päevase Ap ja 3-tunnise ap-massiivi režiimid) port NRL Fortrani avaliku domeeni C versioonist

# text
seg-12977f65b2ea = NRLMSISE-00 pidurdustiheduse tase (valikuline)

# text
seg-17aec847b675 = forces::DensityModel (Exponential vaikimisi, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) ja propagator::ForceModel::drag_density: ruuttakistus kaaspöörleva atmosfääri suhtes NRLMSISE-00 tihedusega WGS-84 geodeetilises punktis (Maa pöörlemisnurk UT1 = TT-ga, kohalik päikeseaeg UT + lon/15), konstantne kosmoseilm mudeli kohta; vaikimisi väljas ja bitiidentne

# text
seg-1ac7430e88fc = Vaikimisi eksponentpidurdus sõltumatu realisatsiooni vastu (ekvatoriaalne)

# text
seg-a9c41b03f2ca = Cowelli propageerija vaikepidurdus: ruuttakistus kaaspöörleva atmosfääri suhtes funktsiooniga forces::atmospheric_density, Vallado tabeli 8-4 tükiti eksponentsiaalse tabeliga sfäärilisel kõrgusel (propagator::ForceModel::drag vaikimisi Exponential variandiga forces::DensityModel)

# text
seg-9e15970435c3 = DE440 Päike ja Kuu Cowelli jõumudelis (valikuline)

# text
seg-de6831cf7785 = Valikuline efemeriiditase numbrilise Cowelli ForceModel kolmanda keha ja SRP liikmetele: geotsentriline Päike ja Kuu mis tahes EphemerisProvider-ist (DE440 SPK kernel läbi KernelEphemeris) hetkel TDB = TT + (TDB - TT), keeldudes pakkujast, kes ei suuda epohhi teenindada, ja loendades iga tagasilanguse analüütilisele reale; vaikimisi väljas

# text
seg-057c21daf4f2 = S1 atmosfääri loode (valikuline)

# text
seg-f600a39f297e = Ööpäevane S1 õhurõhu loode geopotentsiaali häiringuna: Biancale ja Bode ({ "2006" }) mudel N1, astmed { "2" } kuni { "6" }, läbi IERS { "2010" } Eq. { "6.21" } koormusvalemi (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valikuline Cowelli ja täppisjõumudelitel (air_tide_s1, vaikimisi väljas)

# text
seg-7dd9fccac779 = Geopotentsiaali mõju jaoks välist ei ole. { "24" } koefitsienti on ümber kirjutatud GFZ STR06/01 tabeli { "1" } mudelist N1 ja kontrolliti rida realt aruande vastu (SHA-256 890865ae); astmeid { "0" }, { "1" }, { "7" } ja { "8" } ei kasutata. Ray ja Ponte ({ "2003" }) ei trüki sfäärilise harmoonilise tabelit, seega teist allikat ei võrreldud

# text
seg-b150b1bdb599 = S2 atmosfääri loodete koefitsiendid IERS konventsioonis

# text
seg-87e9238b8c53 = Ray ({ "2001" }) S2 õhurõhu harmoonilised (n <= { "4" }, päripäeva ja vastupäeva) teisendatud täielikult normaliseeritud, siinus-eesmise kujule IERS { "2010" } Eqs. 6.20-6.21 (amplituud jagatud N_nm-ga, epsilon = { "90" } kraadi - psi) ja rakendatud kui S2 liige funktsioonis tides::atmospheric_tide

# text
seg-444f0a65b6fd = Tesseraalne geopotentsiaal Cowelli propageerijas

# text
seg-ad475816bc78 = Valikuline EGM2008 tesseraalväli (kuni astme/järguni { "70" }) numbrilise Cowelli ForceModel'i tsentraalse raskusjõuna, arvutatuna Maaga seotud süsteemis, mida pööratakse IAU { "2000" } Maa pöördenurga (või CIO GCRS-ITRS ahela) järgi; vaikimisi väljas, seega ükski olemasolev väljund ei muutu

# text
seg-e8f5ff8c9149 = Kõrge astmega sfääriliste harmooniliste raskusjõud (EGM2008 kuni { "2190" })

# text
seg-d3b2f32dcecb = Ületäitumiskindel ja poolusekindel täielikult normaliseeritud välja arvutus kuni astmeni { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modifitseeritud edasisuunaline veerg, kus gradient on vaba 1/cos phi-st), voogedastuslik ICGEM .gfc laadija (from_gfc_file / from_gfc_reader; täielik EGM2008 tõmmatakse käitusajal, seda ei komplekteerita kaasa) ning Holmes-Featherstone'i arvutaja, mis on valitav valikulisel Cowelli Geopotential'il

# text
seg-e81b7418c382 = DOP853 integraator

# text
seg-e6e3638aa68e = Hairer DOP853 { "8" }({ "5,3" }) selgesõnaline Runge-Kutta ühendatud 5. ja 3. järku veahinnanguga, SciPy/Hairer sammukontrolleriga, automaatse algsammuga, tõrkel sulgeva sammukaitsega ja 7. järku tiheda väljundiga; valitav propagaatori Integrator-variandina Dop853 / propagator::propagate_dop853

# text
seg-9ad7c1f4da77 = Robustne Kepleri võrrandi lahendaja

# text
seg-4b9d812fd13e = Elliptiline Kepleri lahendaja kõigile { "0" } <= e < { "1" } ja kõigile keskanomaaliatele: Markley ({ "1995" }) kuupstarter ja viiendat järku parandus, tühistumisvaba jääk (1-e)E + e(E - sin E) - M ning kaitstud Newtoni lihvimine (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-1960804ef2f4 = Kauguskiiruse ja az/el partii orbiidi määramine jaama maskeerimisega

# text
seg-4c185244bc66 = Epohhi oleku taastamine segatud kauguse, kauguskiiruse ning asimuudi/tõusunurga jälgimisest üle tõusunurga maski Gauss-Newtoni meetodil H = (dh/dx(t)) Phi(t, t0): analüütilised mõõtmise osatuletised ja variatsiooniline olekuüleminekumaatriks analüütiliste kahe keha + J2 osatuletistega (RK4-integreeritud, mitte suletud kujuga olekuüleminekumaatriks)

# text
seg-bc3d1ee7c639 = SP3 täpsuskoodi vaatluskaalud

# text
seg-63b1fab84f85 = SP3 täpsuskoodide (päis ++ astendajad kujul { "2" }^n mm, %f alus, kirjekohased alus^n mm standardhälbed) kaardistamine vaatluskohasteks asukoha sigmadeks täppis-orbiidi määramise mootori jaoks (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ebecb8906506 = Välist pole: kaalud on modelleerimisvalik (SP3 vorming määratleb koodi ainult tootja täpsusnäitajana; siin loetakse seda telje kohta ühe sigmana). Olemasolevad salvestatud agentuuride jooksud on muutmata

# text
seg-e35df6881c80 = Planeetide gravitatsiooniväljad PDS SHADR tabelitest

# text
seg-f78b73ae8742 = PDS SHADR sfääriliste harmooniliste tabelite lugemine (from_shadr, SphericalHarmonicField'il failis src/gravity_pds.rs: ühikute teisendus, C00 = { "1" } antud, täielikkuse ja normaliseerimise kontrollid) ning Marsi GMM-3 (d/o { "120" }) ja GRAIL Kuu välja GL0660B (d/o { "660" }) kehaga seotud raskusjõu arvutamine

# text
seg-ae3e8833a5ef = Avaldatud gravitatsioonivälja sidumine kehaga

# text
seg-ffb2b20e5f32 = with_gravity_field (Body'l, failis src/gravity_pds.rs): mis tahes laaditud sfäärilise harmoonilise välja (näiteks GMM-3 või GL0660B) sidumine Body'ga, et propagaator arvutaks seda kehaga seotult; valikuline, vaikekehad muutmata

# text
seg-bcb731f7a9b5 = Ainult sisemine kooskõla. Iga avaldatud väli on määratletud selle tootja kehaga seotud süsteemis (GMM-3 Konopliv et al. { "2006" } Marsi süsteemis, GL0660B DE421 Kuu peatelgede süsteemis), samas kui välja arvutatakse IAU süsteemis; nihet ei modelleerita

# text
seg-659bfeba459c = Partii- ja järjestikune orbiidi määramine

# text
seg-dbc98f498941 = Epohhi oleku [r,v] taastamine maajaamade kaugustest Gauss–Newtoni partii diferentsiaalparandaja ja järjestikuse filtri abil kahe keha+J2 jõumudelil

# text
seg-ecfce82a4e3d = Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — sõltumatu kolmanda osapoole hindamisteek sobitatud jõumudelil; taastatud epohhi olek + järelsobituse jääkide RMS nõustuvad müravabalt täpsusega <{ "1e-3" } m ja <{ "3" } m juures { "5" } m müra põhitasemel

# text
seg-acdac055acb9 = Kaugkosmose raadiomeetriline valguse levi aja lahendaja

# text
seg-62a478e40850 = Viivitatud (allavoolu) ühesuunalise valguse levi aja lahend τ = |r_rx − r_target(t−τ)|/c kaugkosmose raadiomeetrilise navigatsiooni jaoks (Maa→Marss/Päike/Kuu)

# text
seg-a38690bb69fa = ANISE { "0.10" } (Nyx Space, MPL-2.0) koonduva Newtoni aberratsiooniga valguse levi aeg (Aberration::CN; SPICE spkapo-ekvivalent) JPL DE440 kohal — sõltumatu Rusti SPICE teostus; kshana fikseeritud punkti viivitatud lahendaja langes kokku nanosekundi murdosa täpsusega. Laiemad Doppleri / Shapiro / vähendatud dünaamikaga OD näitajad jäävad MODELLED

# text
seg-c69ef9342160 = Edastatud efemeriididega satelliidi asukoht (mitme GNSS-i RINEX)

# text
seg-62702fc6f242 = IS-GPS-200 / Galileo-OS / BeiDou-OS edastatud efemeriidide Kepleri → ECEF satelliidi asukoht parsitud RINEX-3 navigatsioonikirjest

# text
seg-cb66d33b7ba7 = RTKLIB v2.4.2-p13 eph2pos(), kompileeritud C lähtekoodist (T. Takasu, BSD-2-Clause) — sõltumatu IS-GPS-200/SIS-ICD teostus, mida toideti identsete RINEX-3 nav-kirjetega; satelliidi ECEF asukoht langes kokku ~{ "62" } nm täpsusega. (SP3 täppisefemeriidide interpolatsiooni valideeritakse eraldi — vt „SP3 täppisefemeriidide interpolatsioon“)

# text
seg-c807a782b20e = SP3 täppisefemeriidide interpolatsioon

# text
seg-238de70daab9 = IGS-standardi Lagrange'i interpolatsioon SP3 täppisefemeriidide satelliidiasukohtadele sõlmekohase Maa pöörlemise parandusega (pöörata iga sõlme ω⊕·(t_node−t) võrra päringuhetke Maaga seotud süsteemi enne polünoomi sobitamist)

# text
seg-e9249ae44a11 = RTKLIB peph2pos(), kompileeritud C lähtekoodist (preceph.c; T. Takasu, BSD-2-Clause) — de facto IGS-i etalon, sõltumatu teostus; kshana interpolaator (nüüd sama Maa pöörlemise sõlmeparandusega) langes kokku ~{ "15" } nm täpsusega reaalsel SP3 tootel, võrreldes varasema ~{ "5.5" } cm-ga enne parandust

# text
seg-9762cf428435 = Navigatsioonisõnumite kodeerijad peale GPS LNAV (GPS CNAV, Galileo I/NAV ja F/NAV)

# text
seg-9b703b9607d8 = GPS CNAV sõnumitüübid 10/11/30, Galileo I/NAV sõnatüübid 1-5 nominaalsetel paaris/paaritu lehekülgedel ja Galileo F/NAV lehekülgede tüübid 1-4: ICD väljade pakkimine ja kvantimine, CRC-24Q, kiirusega 1/2 K={ "7" } konvolutsioonkodeerimine (Galileol G2 inverteeritud), plokkpõimimine ja sünkromustrid, koos sobivate testdekoodritega

# text
seg-7939b210e83c = Ainult sisemine ringkäik ja ICD teadaolevad vastused; kolmanda osapoole dekoodrit pole käivitatud (RTKLIB/GNSS-SDR testkomplekt, mis loeb KSHANA_NAVMSG_ORACLE_JSON-i, on andmetega piiratud). MODELLED

# text
seg-5ce7cd3d6011 = IONEX globaalse ionosfäärikaardi lugeja ja interpolatsioon reaalsel CODE GIM-il

# text
seg-502656556ddf = IONEX { "1.0" } lugeja (päis, fikseeritud veeruga I5 väärtused, TEC ja RMS kaardid, absoluutsed epohhid, puuduvad väärtused) bilineaarse ruumilise interpolatsiooniga, vormingu lähima / järjestikuse / pööratud kaardi ajainterpolatsiooniga (valemid 1-3) ja õhukese kihi kaldTEC-iga

# text
seg-974d8c1f7876 = Koodi Hatchi kandelaine silumine reaalsetel RINEX vaatlustel

# text
seg-f26b5da0f52e = Lahknemisvaba Hatchi filter (ionosfäärivaba kood, mida kannab ionosfäärivaba kandelaine, aken N epohhi, taaskäivitus sünkroonsuse kadumisel, geomeetriavaba hüppe või lünga korral) täppis-üksikpunkti positsioneerimise koostes

# text
seg-fac84cb9b256 = LEID avaldatud ITRF2020 WTZR koordinaadi vastu: eelregistreeritud läved (silutud mediaan ja p95 kuni { "0.6" } x toorest; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) jäid mööda, suhted { "0.718" } ja { "0.923" }; allesjäänud meetritasemel viga on nihkelaadne (C1C koodinihe, antenn, loodetee, pika perioodiga mitmeteelevi), mitte valge müra, mida silumine eemaldab. MODELLED: filtri statistikat kontrollitakse sisemiselt

# text
seg-2eec513ae8c8 = RTK topeltvahed LAMBDA täisarvulise fikseerimisega reaalsetel RINEX vaatlustel

# text
seg-6571676bf918 = Lühibaasi suhteline positsioneerimine reaalsest kahesageduslikust GPS koodist ja kandelaine faasist: topeltvahed kõrgeima satelliidi suhtes koos täieliku kovariatsiooniga, ujuv Kalmani filter baasi ja üksikvahede mitmetähenduslikkuste üle koos libisemisel taasalgatamisega, LAMBDA täisarvuline vähimruutude meetod suhtetestiga ning fikseeritud täisarvudega tingitud baas

# text
seg-e50c5d4b65c7 = WTZR ja WTZZ avaldatud ITRF2020 koordinaadid (IGN ITRF2020_GNSS.SSC, lahend { "3" }, koos RINEX antennikõrgustega), mis annavad etalonbaasi; läved eelregistreeritud failis tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md enne koodi kirjutamist. Ainult lühike baas: ionosfääri- ega troposfääri topeltvahesid ei modelleerita

# text
seg-f9aa0c529393 = PPP vastuvõtja kella ajalahend IGS lõpliku jaamakella vastu

# text
seg-83ad9e893db9 = Vastuvõtja kell, mida hindab staatiline ujuv PPP filter reaalsel kahesageduslikul GPS koodil ja faasil IGS lõplike orbiitide ja kelladega: aja edastamine vastuvõtjalt IGS ajale, PPP ionosfäärivaba ajalahend.

# text
seg-91a882dd71e8 = IGS lõplik kombineeritud kell jaamale WTZR (IGS0OPSFIN_20250550000_01D_05M_CLK AR-kirjed, SHA-256 d19f3d45...993d, mitme analüüsikeskuse võrgulahendite kombinatsioon; IGS tooted, vaba kasutus viitega); läved eelregistreeritud failis xval/ppp-time/PREREGISTRATION.md enne mis tahes võrdlust; kõik peeti esimesel jooksul. MIS EI OLE: üks jaam ja üks kahetunnine koondunud aken; IGS aeg, mitte UTC(k); konstantne nihe sisaldab vastuvõtja koodinihkeid ning on piiritletud, mitte kalibreeritud; Circular T jälgitavus puudub.

# text
seg-a9b2a93401a3 = Ujuv täppis-üksikpunkti positsioneerimine reaalsetel RINEX vaatlustel

# text
seg-cc991ccec112 = Staatiline ujuv PPP laiendatud Kalmani filter reaalsel kahesageduslikul GPS koodil ja kandelaine faasil IGS lõplike orbiitide ja kelladega: ionosfäärivaba kombinatsioon, satelliidi ja vastuvõtja antenninihked (vastuvõtja variatsioonid), tahke Maa loode, faasi mähkumine, Shapiro viivitus, hinnatud märg zeniidiviivitus, kaarepõhised ujuvad mitmetähenduslikkused geomeetriavaba / Melbourne-Wübbena libisemise tuvastamisega

# text
seg-36e7c9286af7 = WTZR avaldatud ITRF2020 koordinaat (IGN ITRF2020_GNSS.SSC, lahend { "3" }, propageeritud selle kiirusega) — läved eelregistreeritud failis tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md enne filtri kirjutamist; arendus ainult kaasasuvas jaamas WTZZ. Modelleerimata: ookeanikoormus, satelliidi PCV, täisarvuliste mitmetähenduslikkuste lahendamine

# text
seg-c8d87abed330 = RINEX { "4" } navigatsioonifaili lugemine

# text
# c1: > EPH
seg-28913a01af00 = RINEX 4.00-4.02 navigatsioonifailid: GPS LNAV, Galileo I/NAV ja F/NAV, BeiDou D1/D2 ning QZSS LNAV <c1/> kirjed dekodeeritud edastatud efemeriidi tüüpi; CNAV, CNV1-3, FDMA, SBAS, STO, EOP ja ION kirjed jäetakse vahele järgmise kirjepäiseni; kirje, mille päis nimetab teist satelliiti, või kärbitud kirje lükatakse tagasi

# text
seg-278ca396127a = RINEX { "4" } vaatlusfaili lugemine

# text
seg-e0883aa933eb = RINEX 4.0x vaatluspäised (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; sildid sobitatud veergudes 61-80 versioonile { "4" } ja hilisematele) ja epohhikirjed

# text
seg-971fb1203a6d = Vormingu standardi järgimine reaalsel avaldatud RINEX { "4.00" } failil (tagasi loetud väärtused võrduvad faili trükitud literaalidega) ja spetsifikatsioonist tuletatud päisel; sõltumatut lugejat pole käivitatud, seega MODELLED

# text
seg-33e5c74720ff = BeiDou GEO edastatud satelliidi asukoht

# text
seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } geostatsionaarse satelliidi asukoht edastatud efemeriidist (inertsiaalsarnane süsteem, seejärel Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valikuline NavParseOptions välja include_beidou_geo kaudu, seega vaikelugeja jätab GEO-d endiselt vahele

# text
seg-559814996a4c = SP3 täppiskella interpolatsioon

# text
seg-8e7a0dbd1755 = Satelliidi kella nihe tabuleeritud SP3 kellasõlmede vahel lineaarse interpolatsiooniga kahe ümbritseva kehtiva sõlme üle (RTKLIB pephclk skeem; halva kella sentinell jäetakse vahele), ja samad sõlmed söödetud täppistoodete ahelasse RINEX-kella ekvivalentsete kirjetena

# text
seg-1f4f0f841802 = IGS lõplik { "30" } s satelliidikella kombinatsioon (IGS0OPSFIN 30S CLK, 2025-02-24): avaldatud kellahinnangud päringuhetkedel, mitte SP3-st interpoleeritud; läved eelregistreeritud failis tests/fixtures/sp3_clock_igs_oracle/PREREGISTRATION.md enne esimest jooksu (RMS { "0.15" } ns, p95 { "0.30" } ns, sõlmede mediaan { "1e-12" } s, eristamine 2x)

# text
seg-71f48628ebb2 = Kandelaine faasiga tihedalt seotud GNSS/INS ujuvate mitmetähenduslikkustega

# text
seg-5a156aa81275 = Veaoleku EKF { "15" } INS oleku, kaheoleku vastuvõtjakella ja ühe ujuva kandelaine mitmetähenduslikkusega jälgitud satelliidi kohta; pseudovahemaa, kandelaine faas ja valikuline kauguskiirus SGP4 Walkeri konstellatsioonist (valguse levi aeg ja Sagnac), Klobucharide ja Saastamoinen/Niell parandused rakendatud tsüklis filtri enda asukohas; ajaliselt diferentseeritud kandelaine libisemise tuvastamine satelliidikohase lävega, mida kiiruse määramatus laiendab; mitmetähenduslikkuse taasalgatamine libisemisel ja taasomandamisel

# text
seg-00576e8c1032 = Sisemine kooskõla: mõõtmised sünteesitakse mudelitest, mida filter kasutab (χ² NEES/NIS algväärtuste (seed) üle, müravaba koonduvus, libisemise süstimine). MODELLED; reaalse vastuvõtja andmeid ega kolmanda osapoole filtrit ei võrrelda

# text
seg-7d644516b1ec = GNSS/INS mere-, raudtee- ja lennunduspaketid tiheda sidumise valikuga

# text
seg-cbb03a8baf73 = Kolm gnss-ins stsenaariumi trajektooriteegis (laev, mis siksakitab kiirusega { "8" } m/s ja viieminutilise katkestusega; rong läbi kahe satelliidiga lõike ja tunneli; õhusõiduk, mille katkestus katab 25-kraadise kallutatud pöörde) ja paketi valikuline [tight] tabel: pseudovahemaad SGP4 Walkeri konstellatsioonist, mille ühendab suletud ahelaga navigaator, kõik maski kohal olevad satelliidid nominaalsel ja kõrgeimad mõned halvenenud juhul

# text
seg-273c14256d4c = Sisemine: iga paketi kvaliteedinäitajad oma tegeliku väärtuse vastu ja lõtv/tihe võrdlus identsetel sisenditel. MODELLED; auditi NaveGo võrdlust pole käivitatud

# text
seg-f4dab73c4eda = Seotud pseudovahemaa PNT filter nihkeolekuga ja 3-D laiendus liitmispaketis

# text
seg-742b60089361 = Üks virnastatud Kalmani filter asukoha, kiiruse, kellafaasi ja sageduse üle, mida toidetakse asukohta ja kella siduvate pseudovahemaadega (Joseph-kujulised uuendused, mis kannavad ristkovariatsiooni); 1-DOF variant, mida täiendab konstantse kiirendusmõõturi nihke olek ja mida liitmispakett käitab sektsiooni [coupled] all; ning 3-D 8-olekuline versioon vaatejoone ridadega

# text
seg-9558d7aad3af = Sisemine kooskõla: tegelik väärtus simuleeritud filtrite enda mudelitest (χ² NEES Monte Carlo algväärtuste (seed) üle, lahtisidumisega pakett identsetel sensoritel). MODELLED

# text
seg-4a64aa1fe3ca = Lõtvalt seotud GNSS/INS EKF kangikäega KF-GINS andmestikul

# text
seg-30f503856ac5 = Suletud ahelaga 15-olekuline veaoleku EKF, mida juhivad IMU juurdekasvud ja millesse sulatatakse GNSS antennide asukohad kangikäe mudeli H = [I { "0" } −[(C_b^n l_b)×] { "0" } { "0" }] kaudu, seadistatud KF-GINS YAML failist (algolek ja sigmad, ARW/VRW, Gauss-Markovi nihked)

# text
seg-b01d28a09abe = Andmestiku avaldatud etalontrajektoor ja KF-GINS C++ programm (GPL-3.0, commit 8291a93e, käivitatud eraldi tööriistana); läved eelregistreeritud failis xval/kfgins/PREREGISTRATION.md ning KF-GINS-i ei käivitatud nendel andmetel enne seda registreerimist (kontrollitud selle tulemustes). Kõik kuus lävendit peeti esimesel jooksul. DATA-GATED: KF-GINS demoandmestik (reaalne Leador-A15 IMU ja RTK GNSS etalontrajektooriga) ei kanna litsentsi, seetõttu seda ei kaasata; xval/kfgins/fetch.sh tõmbab selle testi ajal kõigi failide SHA-256 kinnitatult ja test ebaõnnestub mittesobivuse korral; reprodutseerimistee, mis vajab võrguühendust, on failis xval/kfgins/PREREGISTRATION.md. Tõstetud tasemele VALIDATED omaniku otsusega andmetega piiratud tõendite põhjal (2026-10-13)

# text
seg-e6b6c605564c = Simulaatori liikumisfailide lugejate poolt loetud test-bench eksport (gps-sdr-sim)

# text
seg-a07429aa1998 = Avatud lähtekoodiga GNSS simulaatori enda lugejatele antud bench-ekspordi liikumisfailid tulevad tagasi eksporditud trajektoorina: NMEA GGA fail (-g), liikumis-CSV aja/laiuskraadi/pikkuskraadi/kõrguse lõige (-x) ja selle aja/x/y/z lõige (-u), { "6" } gnss-ins stsenaariumil (sh mere-, raudtee- ja lennunduspaketid, loetud simulaatori 3000 valimi piirini) ja { "2" } statsionaarsel. Ainult liikumine; ühtegi signaali ei kirjutata ega genereerita.

# text
seg-07b5f46a900f = MIDA KONTROLLITAKSE VÄLISELT, kitsalt sõnastatuna: gps-sdr-sim (MIT, commit 28ca29a6) readNmeaGGA, readUserMotion ja readUserMotionLLH oma WGS { "84" } llh2xyz-iga, kutsutud faili xval/testbench-gpssdrsim/driver.c kaudu (ühtegi signaalifunktsiooni ei kutsuta), liikumis-CSV Maaga seotud veergude vastu rida realt, läved eelregistreeritud failis xval/testbench-gpssdrsim/PREREGISTRATION.md enne mis tahes jooksu: iga valim loetud kõigil { "8" } stsenaariumil; NMEA halvim { "1.21" } mm (lävi { "1" } cm); LLH lõike halvim { "0.145" } mm (lävi { "1" } mm); neljaveeruline Maaga seotud lõige täpne (lävi { "1" } um, muudatus { "1" }); gnss-ins read simulaatori { "10" } Hz võrgul täpsusega { "2.3e-13" } s. LEID (jooks { "1" }, kinnitatud): päiseta täislaiune CSV ei ole -u-ga loetav, sest lugeja 100-märgine reapuhver lõhub iga 161-märgise rea kaheks valimiks; docs/TEST-BENCH.md annab neljaveerulise lõike. MIS EI OLE: stsenaariumi tegeliku trajektoori füüsika; gps-sdr-sim signaaliväljund; mis tahes muu simulaatori lugeja; mis tahes vastuvõtja.

# text
seg-2db2b9dc3b45 = GNSS/INS trajektooriteek ja CSV tegeliku trajektoori import

# text
seg-e1fe83c75a6c = Valitavad liikumisprofiilid gnss-ins paketile (sirge, figure-8 (kaheksakujuline), linna stop-and-go, õhusõiduki tõus ja koordineeritud pööre, mõõdistusdroon), määratletud Euleri kiiruste ja piki trajektoori kiirenduse käskudega, mis on tegeliku oleku peal suletud kinemaatilise IMU-ga (tsentripetaal-, raskusjõu- ja Coriolisi liikmed), ning imporditud CSV tegelik trajektoor muudetud IMU-ks, mis seda reprodutseerib; ajalooline sõit on muutmata, kui profiili pole antud

# text
seg-30ea002a06a0 = Sisemine: jäiga keha kinemaatika samasused, CSV ringkäik ja filtri enda kovariatsioon. MODELLED (reaalset sõidulogi ei võrrelda)

# text
seg-8685fd899e3c = Strapdown INS mehhaniseerimine

# text
seg-ba942e322f8a = Kvaternioonasendiga WGS-84 NED strapdown inertsiaalne mehhaniseerimine (coning/sculling-kompenseeritud), mis propageerib navigatsiooni olekut (Δθ, Δv) juurdekasvudest

# text
seg-5cfcb186d59e = NaveGo v1.4 (R. Gonzalez et al., LGPL-3) Octave'is — sõltumatu avaldatud INS tööriistakast, mida juhib identne (Δθ,Δv) juurdekasvude voog. Asend langeb kokku bitipõhiselt (samad NED / skalaar-ees-kvaternioon / Maa pöörlemiskiiruse / transpordikiiruse konventsioonid); kiirus/asukoht nõustuvad kahe dokumenteeritud erinevuseni — vertikaali kõrvalekalde põhja-raskusjõu liige, mille NaveGo sisaldab ja kshana jätab kavatsuslikult välja (loodjoone raskusjõud; langeb kokku Grovesi suletud kujuga igal numbril, koos mõistlikkuse põranda assert'iga) — ja O(dt²) integraatori erinevused — mitte mehhaniseerimisvead

# text
seg-d1a5c8e7ca74 = Gravitatsioonivälja funktsionaalide süntees (gravitatsiooniga abistatud / GNSS-vaba navigatsioonikaart)

# text
seg-8336eb12eb7b = Sfääriliste harmooniliste raskusjõu suurus + häiring (mGal) mis tahes ICGEM .gfc mudelist; GRS80 normaalraskusjõud

# text
seg-b5a7fc986751 = GRS80 (Moritz { "1980" }, IAG) Somigliana normaalraskusjõud + avaldatud γ_e/γ_p; reaalne ICGEM EGM2008 väli

# text
seg-86f9186bb884 = Maa–Kuu CR3BP { "9" }:{ "2" } NRHO versus orbiit, mida CAPSTONE lendas

# text
seg-d4127cf241f3 = Ringjooneline piiratud { "9" }:{ "2" } L2 lõunapoolne peaaegu sirge halo-orbiit, mida cr3bp::differential_correct_halo parandab (Gatewayl ja CAPSTONE'il kasutatav orbiidiperekond), võrreldud oma keskmise geomeetria (periood, periluuna raadius, apoluuna raadius) alusel orbiidiga, mida CAPSTONE tegelikult lendas. Mõõtmine, kui hästi CR3BP liige kirjeldab tegelikku orbiiti; CR3BP orbiit ei ole efemeriidimudeli orbiit ning seda ei võrrelda epohhi kaupa

# text
seg-c866a5bd4318 = CR3BP pöörlevad olekud kaardistatud Kuu keskseks ICRF-iks DE440 Maa–Kuu joonel

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf kaardistab mõõtmeteta Maa–Kuu CR3BP pöörleva oleku Kuu keskseks ICRF asukohaks ja kiiruseks hetkelisel Maa–Kuu joonel (pikkusühik Maa–Kuu kaugus, ajaühik pöördvõrdeline orbitaalkiirus, süsteemi täielik nurkkiirus sealhulgas selle tasandiväline kiirus Kuu kiirendusest), pöördfunktsiooniga from_moon_centred_icrf, ja cr3bp::to_moon_centred_icrf_de440 loeb geotsentrilise Kuu oleku DE440 SPK-st. See kaardistab olekuid; see ei tee CR3BP orbiidist efemeriidimudeli orbiiti

# text
seg-d543e3e84f36 = Päikesesüsteemi stsenaariumi liik JPL kernelil (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = Stsenaariumi liik <c1/> koos planetary_kernel_path-iga: iga raporteeritud keha, mille enda NAIF koodi SPK sisaldab, võtab oma heliotsentrilise J2000 asukoha ja kiiruse kernelist mootori enda lugeja kaudu (silt KERNEL), link, mille mõlemad otsad on kernelis, arvutatakse sellel, barütsentreid ei asendata kunagi planeediga ja iga muu keha jääb analüütiliseks oma sildiga; aruanne saab kernel'i ploki (tee, SHA-256, sellest võetud kehad ja lingid) ainult siis, kui valik on seatud. De440s.bsp-ga on selleks Merkuur, Veenus, Maa ja Kuu

# text
seg-7f3d53b4e8d1 = Porkchop DE440 efemeriidil

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: stardikuupäeva x saabumiskuupäeva pühkimine väljumise C3 (km²/s²) ja saabumise V-infinity (km/s) üle ühe tiiru päripäeva Lamberti lahendaja ja { "0.5" } kraadise kollineaarsuskaitsega, mis tahes kahe NAIF keha heliotsentrilistel J2000 olekutel, mis on loetud JPL DE440 SPK-st paketi enda lugejaga. Üks tiir, päripäeva, ilma kanderaketi või saabumispiiranguteta: pühkimine, mitte missiooni disain

# text
seg-b1401bed5da8 = Impulssülekande optimeerija DE440 efemeriidil

# text
seg-eb98d6b8805e = maneuver::optimise_transfer_kernel: ühe tiiru ballistilise kahe impulsiga ülekande väljumis- ja saabumiskuupäevad, mis minimeerivad väljumise C3 või saabumise V-infinity tüübi I või tüübi II piires, pideva optimumina (2-päevane võrk üle mõlema akna, seejärel 2-D Nelder-Mead), DE440 SPK heliotsentrilistel olekutel. Kuupäevaoptimeerija ühele lõigule, mitte missiooni disain: ei kanderaketi, parkimisorbiidi, kaugkosmose manöövri ega mitmetiirulisi valikuid

# text
seg-6c695aef043b = Sõltumatu optimeerija: NAIF SPICE Toolkit (CSPICE N0067 läbi spiceypy { "8.3.0" }) heliotsentrilised olekud samal de440s lõikel, pykep { "3.0.1" } lambert_problem (ESA, MPL-2.0) ja SciPy { "1.18.1" } Nelder-Mead, mis ei kutsu ühtegi Kshana koodi. NASA Maa–Marsi käsiraamat (MIDAS, efemeriid nimetamata, 2-päevane kuupäevavõrk) on teisene avaldatud etalon ega määra staatust

# text
seg-93f3cdbb7297 = Mitmetiiruline Lamberti ülekande lahendaja

# text
seg-995a6a995b78 = Lamberti ülesande iga lahend kuni kolme täistiiruga (maneuver::lambert_multirev: ühetiiruline lahend, seejärel iga tiirude arvu vasak ja parem haru, Izzo { "2015" }), koos rajakiirustega v1 ja v2, päripäeva ja vastupäeva ülekannetele, kanoonilistes ja heliotsentrilistes SI ühikutes, sealhulgas ülekannetele, mis jäävad tiirude arvu minimaalsest lennuajast { "1" } % piiresse, ja peaaegu 180 kraadi geomeetriatele. Ainult kahe keha lahendaja (häiringuteta)

# text
seg-ff9c6140fe1c = Lamberti kahe keha ülekande lahendaja

# text
seg-d8c39ced64b2 = Izzo-2015 ühetiiruline Lamberti lahendaja (r1, r2, lennuaeg → rajakiirused) LEO→GEO→heliotsentriliste ülekannete üle, päripäeva ja vastupäeva

# text
seg-d0470acf4f29 = lamberthub { "1.0.0" } izzo2015 (J. Martínez Garrido, MIT) — sõltumatu kolmanda osapoole Lamberti lahendaja. Ühetiirulisel (M={ "0" }) Lamberti ülesandel on ainus lahend, seega teegi-teegi vastu kokkulangevus on tõeline väline kontroll; langes kokku täpsusega <{ "1e-4" } m/s (täheldatud ~{ "1e-11" }), sama liiki valideerimine, mille DOP saab gnss_lib_py vastu

# text
seg-347cece5df63 = Tugisüsteemid ja ajaskaalad

# text
seg-5a4bc2c15eaa = IAU 2006/2000A prekessioon-nutatsioon, CIO GCRS↔ITRS, liigsekundiga ajaskaalad

# text
seg-51d28ab9d256 = IAU SOFA / ERFA etalonvektorid; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

# text
seg-c3d4b9bef817 = Kaheosalised Juliuse kuupäevad ja liigsekundid Maa orbiidi ajateel

# text
seg-5e859e3aa613 = UTC kalendrikuupäev ja kellaaeg kaheosaliseks UTC Juliuse kuupäevaks SOFA dtf2d konventsiooniga päevadele, mis lõpevad liigsekundiga ({ "86 401" } s pikad, { "23" }:{ "59" }:{ "60" }.x kehtiv), UTC TAI-ks ja tagasi ning UT1 UTC-st TAI kaudu, kaheosalistel kuupäevadel alates 1972-01-01: ajatee, mida SGP4 (Sgp4::propagate_at, mõõdetud kaheosalisest epohhist) ja IAU 2006/2000A Maaga seotud pööre (sgp4::teme_to_itrs_matrix_eop kaheosalise Maa pöördenurgaga) kasutavad

# text
seg-f1c7bc235a6b = Kaheosalised Juliuse kuupäevad Maa pöörlemiseni orbiiditeel

# text
seg-cee11d4bad08 = Maa pöörlemine kaheosalisest UT1 Juliuse kuupäevast orbiiditeel, et Maaga seotud asukoht säilitaks mikrosekundi, mille üksik f64 kuupäev kaotab (umbes { "3e-9" } rad ümber { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME konventsioon, kahel osal), cio::gcrs_to_itrs_matrix_jd2 (CIO GCRS-ITRS maatriks Maa pöördenurgaga kahest osast) ja nendele toetuvad ning sisemiselt kontrollitud frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 ja own_jd2_utc, efemeriidistsenaariumi valikuline two_part_jd (ECEF asukoht, maapealne jälg ja jaama vaade; vaikimisi väljas, muutmata) ning kadudeta From teisendused jd2::Jd2 ja timescales::TwoPartJd vahel. Prekessioon-nutatsioon ja Cowelli jõumudeli epohh jäävad üksikuks f64-ks, kus { "40" } us ümardus on alla { "1e-15" } rad või kaugelt alla analüütilise Päikese/Kuu efemeriidi vea

# text
seg-096df3971f5f = Süsteemimaatriksid ERFA vektorite vastu: IAU { "2006" } nihke-prekessioon, TEME GCRS-iks ja CIO ahel taevapooluse nihetega

# text
seg-731a5ed967b3 = Kolm süsteemimaatriksit, mida võrreldakse ERFA-ga element-elemendi haaval või pöördenurga järgi suvalistel epohhidel: precession::precession_matrix (IAU { "2006" } nihke-prekessioon Fukushima-Williamsi nurkadega), nutation::teme_to_gcrs_matrix (TEME GCRS-iks pööre P^T N^T Rz(-EE) IAU { "2006" } prekessiooni, IAU 2000B nutatsiooni ja ekvinoktsiumide võrrandiga selle kahe peamise täiendava liikmega) ja cio::gcrs_to_cirs_matrix_with_offsets (GCRS CIRS-iks pööre IERS taevapooluse nihetega dX, dY, mis lisatakse mudeli CIP X, Y-le enne pööret, SOFA kokaraamatu konventsioon; uus). Mudelivalikuid endid (2000B nutatsioon TEME teel, kahe liikmega täiendav rida) ei valideerita, ainult nende teostust

# text
seg-4e2fe2e3dabb = Enne 1972. aastat UTC (triiviva kiiruse ajastu) kaheosalisel Juliuse kuupäeva ajateel

# text
seg-1d086e669f09 = UTC alates 1960-01-01 kuni 1971-12-31, kui UTC kulges TAI-st nihkekiirusega ja astus sekundi murdosade kaupa, kaheosalisel Juliuse kuupäeva teel: TAI - UTC iga perioodi triivitabelist (timescales::tai_minus_utc_on_date), UTC kalendrikuupäev kaheosaliseks UTC Juliuse kuupäevaks päeva pikkusega { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC TAI-ks päeva murdosaga, mis on skaleeritud UTC-st SI sekunditesse (jd2::utc_to_tai), ja TAI tagasi UTC-ks (jd2::tai_to_utc), järgides SOFA dtf2d, utctai ja taiutc. Enne { "1960" } võetakse TAI - UTC väärtuseks { "0" } (SOFA väärtus; UTC määratlemata) ja see jääb väite ulatusest välja. Üksik f64 timescales::tai_minus_utc piirab endiselt väärtuseks { "10" } s enne { "1972" } ja seda ei kata

# text
seg-efacec095051 = GLONASS edastatud satelliidi kell ja edastatud orbiidi propageerimine

# text
seg-821b9c01b56e = GLONASS edastatud satelliidi kella nihe -tau_n + gamma_n (t - t_b) satelliidi kellalt loetud ajahetkel (glonass::GlonassEphemeris::sv_clock_bias_s, nihe parandatud kellanihke jaoks kahe fikseeritud punkti iteratsiooniga), ja edastatud olekuvektori PZ-90 Maaga seotud asukoht, mis on propageeritud RK4-ga läbi GLONASS ICD liikumisvõrrandite +/-15 min piires etalonepohhist (GlonassEphemeris::position_ecef), reaalsetest RINEX { "3" } GLONASS navigatsioonikirjetest. PZ-90.11 ITRF-iks teisendust ei rakendata (need nõustuvad sentimeetri tasemel alates { "2014" }; RTKLIB ei rakenda samuti ühtegi). Ei ole stsenaariumi väljundisse ühendatud: teegifunktsioon

# text
seg-d3b72a6fbb18 = Üks Maa orbiidi tee: SGP4 elemendikomplektid GCRS-iks ja ITRS-iks IAU 2006/2000A ahelal Maa orientatsiooni parameetritega

# text
seg-e4eca7205b5e = Propageerimise ja süsteemi tee, mida jagab iga suunatud Maa orbiidi stsenaariumi liik: SGP4 keskmine elemendikomplekt kaheosalise UTC epohhiga (sgp4::MeanElementSet, loetud konstellatsiooni disaini elementidest MeanElementSet::from_earth_fixed abil), propageeritud SGP4/SDP4-ga TEME-sse (sgp4::SgpOrbit), ning TEME -> ITRS ja GCRS -> ITRS pöörded IAU 2006/2000A ahelast koos UT1 - UTC ja polaarliikumisega (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, nullparameetriga vormid teme_to_itrs_matrix ja gcrs_to_itrs_matrix). TEME on kuupäeva tõeline ekvaator keskmise ekvinoktsiumiga, saavutatud GCRS-ist IAU { "2006" } nihke-prekessiooni, IAU 2000B nutatsiooni ja ekvinoktsiumide võrrandi kaudu

# text
seg-f650a11458b8 = Kaugusmõõtmiskoodi disainikompromiss

# text
seg-071e552a7179 = m-jada/Goldi külgsagarate ja ristkorrelatsiooni piirid, pikkus↔mitmetähenduslikkus

# text
seg-65b7902a2d8f = Avaldatud GPS C/A Goldi ristkorrelatsioon (−{ "23.9" } dB); Gold { "1967" } piir

# text
seg-5ec4c0730280 = GNSS-i geomeetria / DOP (täpsuse halvenemise tegur)

# text
seg-edcd694d2b3c = GDOP/PDOP/HDOP/VDOP/TDOP vaatejoone geomeetriast kujul Q=(HᵀH)⁻¹ kohaliku ENU jaotusega

# text
seg-cecd882ec4e4 = gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — sõltumatu teek, langes kokku täpsusega { "1e-6" } suhteliselt

# text
seg-1a5623c81b48 = Asukohaviga geomeetriast: RMS viga = sigma_UERE x DOP mootori vähimruutude fiksi jaoks

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry ja check: algväärtustatud (seed) Monte Carlo (N = { "20,000" } epohhi geomeetria kohta, sigma = { "1.5" } m, ChaCha8 algväärtus { "36" } + i) mootori enda iteratiivsest vähimruutude fiksist (pvt::solve_spp, ühikkaalud, lahendatud tegelikust asukohast) tests/fixtures/dop/dop_reference.csv { "8" } geomeetrial, võrreldes ida, põhja, üles ja kella vea dispersioone, H/V/P RMS-i, ida-põhja korrelatsiooni, keskmisi vigu ja { "95" } % horisontaalse ellipsi sisse jäävat osa ellipsiga sigma^{ "2" } Q, kus Q on orbit::dop tuuma kovariatsioonitegur (orbit::dop_cofactor, sama aritmeetika) samal geomeetrial

# text
seg-90f18c774d57 = Sisemine kooskõla suletud kujuga: lineaarse Gaussi mudeli korral on vähimruutude kovariatsioon sigma^{ "2" } (H^T H)^-1 (Kaplan ja Hegarty (toim.), Understanding GPS: Principles and Applications, 2. tr., Artech House, { "2006" }, ptk { "7" }). Meetod ja tolerantsid { "0.36" } geomeetria disainimärkuse jaotisest { "5.2" }, fikseeritud eelregistreerimise commit'is enne esimest jooksu: iga dispersioon { "5" } % piires ({ "5" } valimidispersiooni standardviga N = { "20,000" } juures), iga RMS { "2.5" } % piires, ida-põhja korrelatsioon { "0.035" } piires (5/sqrt(N)), iga keskmine { "5" } standardvea piires, { "95" } % ellipsi osa { "0.95" } +/- { "0.0077" } piires ({ "5" } binoomstandardviga); negatiivsed kontrollid (kahekordistatud PDOP; vead, mis kasvavad kui 1/sin(tõusunurk) kaalumata Q vastu) peavad ebaõnnestuma. KUIDAS SEE KOOSTUB: Q on orbit::dop tuuma kovariatsioonitegur, VALIDATED gnss_lib_py { "1.0.4" } vastu samadel { "8" } geomeetrial failis tests/dop_reference.rs (rida „GNSS-i geomeetria / DOP (täpsuse halvenemise tegur)“); see rida lisab sammu nendelt teguritelt meetriteni mootori lahendaja kaudu ega laena selle rea staatust. MIKS MODELLED: välist andmestikku ei kasutata; kokkulangevus näitab, et hindaja ja müra realiseerivad sigma x DOP õpikumudelis, mitte et mis tahes vastuvõtja viga võrduks UERE x DOP-iga, ja sigma_UERE on sisend

# text
seg-9acfde1b57f7 = Geomeetriateadlik usaldusklassifikatsioon: satelliidigeomeetria vastuvõtja usaldusskoori kõrval ja klass igal mahaarvamisel

# text
seg-6138c41e13ff = receiver_trust::geometry: epohhikohane satelliidigeomeetria (hea, halvenenud põhjustega few-satellites/high-pdop/high-hdop/sky-blocked, või teadmata, kui logi ei anna GSV, NAV-SAT ega GSA), tuletatud raporteeritud tõusunurkadest ja asimuutidest orbit::dop kaudu või võetud GSA-st, alati raporteeritud ja mitte kunagi punktidega hinnatud sildiga (good, fair, poor, unknown) ning HDOP, PDOP, VDOP, satelliitide arvu ja signaalikaoga sõnades; laeva skoori geomeetriamonitor, mis ei arva midagi maha, kui geomeetria ei ole halb (suhe max(hdop/4, pdop/6, 5/n_used) üle { "1" }), seejärel tõuseb ülempiirini { "15" } punkti väärtusel { "1.5" }, mida geomeetria üksi ei saa viia halvenenud vahemikust allapoole (ülempiir, tõusu lõpp ja põrand jaotises [geometry]; häiret pole); klass igal mahaarvamisel (geometry, environment, inconsistency), kusjuures sünkroonsuse kadu satelliitidele alla { "15" } kraadi klassifitseeritakse kui geometry, vaates olevad, kuid jälgimata satelliidid kui environment ning halva geomeetria mahaarvamine, mille esitatud HDOP on kaugemal kui max({ "1.0" }, { "25" } % tuletatud HDOP-ist) esitatud taevast, kui inconsistency

# text
seg-6987737c5fe4 = Sisemine kooskõla: klassifikatsiooni kontrollitakse selle esitatud reeglite vastu ja käsitsi tuletatud suhete vastu commit'itud demologi sünteetilistel redaktsioonidel ning muutusteta kinnitused hoiavad { "0.35.0" } väljundeid: ükski skoor ei muutu, kui geomeetria ei ole halb; silt raporteeritakse alati. MIKS MODELLED: läved on valitud, mitte sobitatud (päritolu iga jooksu geometry_model-is; IEC 61108-1 ja GPS SPS arvud nagu viidatud, mida tuleb kontrollida standardite tekstiga), ja puudub väline märgendatud andmestik loomuliku geomeetria halvenemise kohta rünnakute vastu, mille vastu klassifikatsiooni valideerida. Tuletatud DOP kasutab uuesti orbit::dop tuuma, VALIDATED gnss_lib_py vastu, mille staatust see rida ei laena. Geomeetria klass on väide taeva kohta, mitte järeldus, et rünnakut ei toimunud

# text
seg-540420863a5a = Edastatud ionosfäärimudel (Klobuchar, IS-GPS-200)

# text
seg-fd157c537502 = Klobuchari ühesageduslik L1 kaldionosfääri grupiviivitus kaheksast edastatud α/β koefitsiendist

# text
seg-0b0b02e8b0b8 = RTKLIB ionmodel (tomojitakasu/RTKLIB, src/rtkcmn.c) — sõltumatu lähtekoodist kompileeritud etalonteostus; langes kokku täpsusega < { "1e-4" } m

# text
seg-0af6b1a073ce = RAIM/ARAIM terviklikkuse statistiline tuum (χ² / mittetsentraalne χ² / normaaljaotused)

# text
seg-224a6c4200cd = Jaotuslik tuum, millel iga kaitsetase toetub: hetktõmmise tõrketuvastuse lävi χ²₁₋ₚfₐ(dof), tuvastamata jäänud sündmuse mittetsentraalsus pbias=√λ ning K_fa/K_md/K_V lahendite eraldamise kordajad

# text
seg-49f7d0c26e0a = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — sõltumatu teek (Cephes/Boost), Kshana mittetäieliku gamma rea suhtes erinev algoritm; langes kokku täpsusega ≤{ "1e-6" } suhteliselt. Ainult tuum. ARAIM MHSS P_HMI eelarve *jaotusel* ei puudu enam avaldatud arvuline sõltumatu etalon — WG-C ARAIM tehnilise allrühma enda läbitöötatud näide toetab nüüd eraldi rida „ARAIM MHSS kaitsetasemed avaldatud etalonvektorite vastu“, mis langes kokku etaloni enda TOL_PL = { "5e-2" } m juures — seega selle rea ulatus on statistiline tuum ja see teine rida kannab jaotust (vt docs/ARAIM_REFERENCE.md)

# text
seg-03578217425f = SBAS kaitsetase (DO-229E kaalutud vähimruutude HPL/VPL)

# text
seg-df640d6c7a5d = DO-229E lisa J kaalutud vähimruutude kaitsetasemed: D=(GᵀWG)⁻¹ satelliidikohasest tõusunurgast/asimuudist ja veaeelarvest, horisontaalse veaellipsi peatelg ja vertikaalne σ, skaleeritud avaldatud K-teguritega

# text
seg-39aed7b4bffd = RTKLIB SBAS-PL fork — zsiki/rtklib_ws waasprotlevels() (Siki & Takács { "2017" }, „DO-229D Appendix J“), käivitatud rnx2rtkp -ws-iga reaalsetel EGNOS GEO-PRN120 sõnumitel + reaalsel BUTE/Budapest RINEX-il; sõltumatu kolmanda osapoole teostus, HPL langes kokku täpsusega < { "2e-3" } m. gLAB { "v6.0.0" } (core/filter.c) kinnitas identset konventsiooni. Mõlemad sõltumatud etalonid ümardavad K_V→{ "5.33" } Kshana täpse Φ⁻¹({ "1" }−{ "5e-8" })={ "5.3267" } vastu (~{ "0.06" }%), seega vertikaali kontrollitakse K-tegurita d_U-na

# text
seg-8f32eb9c8167 = ML detektori hindamismõõdikud (ROC/AUC/confusion/Pfa-Pmd)

# text
seg-b0d8e1b45bf9 = AUC (Mann-Whitney, viigid ½), confusion matrix lävendil, P_d/P_md/P_fa/precision/accuracy/F1

# text
seg-d87c8bae7c5e = scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — sõltumatu teek, täpne kokkulangevus

# text
seg-e7af87ce5e72 = Anomaaliate tuvastamise hindamine reaalsel kosmoseaparaadi telemeetrial

# text
seg-9659b33fca5b = ROC AUC + alglaadimisega usaldusvahemik, mis eraldab reaalseid märgendatud anomaaliaid; läbipaistev detektor (reprodutseerib märgendid)

# text
seg-b4ed67ce7e7e = scikit-learn roc_auc_score OPSSAT-AD testijaotusel (Ruszczak et al. { "2025" }, CC BY { "4.0" }) — reaalne OPS-SAT telemeetria

# text
seg-5c3f1057c6cc = Kvantkompromissi arvutuslikud tuumad (NNLS / χ² ribad / van-Loani Q)

# text
seg-f82113ccb30b = Mõõdetud ADEV NNLS sobitus, NEES/NIS χ² kooskõlaribad ja kella van-Loani diskreetse protsessimüra (holdover-i libisemise) kovariatsioon — kompromissimootori arvutuslik selgroog

# text
seg-823da1deb3af = scipy { "1.17.1" } — optimize.nnls / stats.chi2.ppf / linalg.expm; NNLS+Q täpne, χ² <{ "5e-4" } töö-dof juures. Ainult tuumad — seadmete jõudlusnumbrid jäävad modelleeritud tasemele (järgmine rida)

# text
seg-6f3099e7562c = Geomagnetiline etalonväli (IGRF-14 süntees)

# text
seg-e9534723cb34 = IGRF-14 põhivälja sfääriliste harmooniliste süntees — X/Y/Z/F komponendid, deklinatsioon ja inklinatsioon — mis toidab magnetanomaalia alt-PNT kihti

# text
seg-b1431734301a = ppigrf { "2.1.0" } (K. M. Laundal, MIT) — IAGA-VMOD puhas-Pythoni IGRF-i etalonteostus, mis tarnib ametlikud IGRF14.shc koefitsiendid (IAGA 14. põlvkond, Zenodo 10.5281/zenodo.14012302); sõltumatu kolmanda osapoole koodibaas, mis arvutab ühemõtteliselt määratletud IGRF-14 välja, langes kokku üle globaalse võrgu

# text
seg-cb3fea409de7 = Tuvastamisstatistika — Gaussi AUC ja minimaalne tuvastatav tõrge

# text
seg-ca677becb465 = Analüütiline binormaalne ROC AUC = Φ(μ/(σ√{ "2" })) ja minimaalne tuvastatav tõrge σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), mis toetavad kvanttõrke- ja anomaaliadetektoreid

# text
seg-7d296e4199af = scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa et al., JMLR { "2011" }), mõlemad BSD-3-Clause — sõltumatud teegid, mis arvutavad samu ühemõtteliselt määratletud Gaussi saba / AUC suurusi, langesid kokku A&S-erf põrandani (~{ "7e-8" }). Selle peale ehitatud kvant-versus-klassikaline eelis jääb MODELLED

# text
seg-1ed12110fb74 = Järjestusstatistika tuum (Kendall-τ / Dirichlet / protsentiil)

# text
seg-0fb003404a5b = Astmekorrelatsiooni ja uuestivalimi tuumad vastupidavuse otsuse ebastabiilsuse uuringu all: Kendalli τ-b, Dirichlet' keskmine, võistlusjärjestus ja protsentiili usaldusvahemikud

# text
seg-396602ddeef4 = scipy { "1.18" } (stats.kendalltau variant='b', rankdata) + numpy.percentile (BSD-3-Clause) — sõltumatud teostused (merge-sort τ) ühemõtteliselt määratletud järjestusstatistikatest, langesid kokku täpsusega { "1e-12" }. Nendele tuumadele ehitatud otsuse ebastabiilsuse uuring jääb MODELLED

# text
seg-fdd2ba203d5b = MCDA prioriteetide tuletamise tuum (AHP omavektor / kooskõla suhe)

# text
seg-d01c155fbddf = Analytic Hierarchy Process prioriteetide kaalud = pöördpaarisvõrdlusmaatriksi normaliseeritud peamine (Perroni) omavektor astmeiteratsiooniga, koos Saaty kooskõla indeksi / kooskõla suhtega ja CR<{ "0.10" } aktsepteerimisvärav

# text
seg-d1947f2f2b3b = Saaty ({ "1980" }) kanooniline juhuindeksi tabel (RI({ "5" })={ "1.12" }) reprodutseeritud täpselt + SciPy/LAPACK scipy.linalg.eig (BSD-3-Clause) sõltumatu omalahendajana, mis arvutab sama ühemõtteliselt määratletud Perroni omavektori/omaväärtuse, langes kokku täpsusega <{ "1e-9" }. Sellele tuumale ehitatud Pareto / tundlikkuse / MAUT otsuskiht jääb MODELLED (WSM/WPM/TOPSIS/VIKOR/PROMETHEE/ELECTRE agregaatorid on eraldi väliselt valideeritud — vt allolevaid ridu)

# text
seg-73e933220afb = MCDA kaalutud agregeerimise tuumad (WSM / WPM)

# text
seg-c436cdc991a2 = Weighted Sum Model (min–max-normaliseeritud additiivne agregaat + järjestamine) ja Weighted Product Model (summaga normaliseeritud, kulu puhul pöördväärtusega multiplikatiivne agregaat) — kaks väärtuse agregeerimise kompromissiuuringu skoorijat

# text
seg-1b5b9abcca69 = pymcdm (methods.WSM + normalizations.minmax_normalization; methods.WPM + normalizations.sum_normalization) — sõltumatu, laialdaselt kasutatav kolmanda osapoole Pythoni MCDA teek, mis arvutab samu ühemõtteliselt määratletud kaalutud agregaate; langes kokku täpsusega <{ "1e-9" }. Taasgenereeritav võrguühenduseta failide tests/fixtures/mcda_wsm/ ja tests/fixtures/mcda_wpm/ kaudu. Garbage-in-garbage-out sisendite osas; tundlikkuse/robustsuse kiht jääb MODELLED

# text
seg-f00bdb66a052 = MCDA ideaalini kauguse järjestamine (TOPSIS)

# text
seg-631578cb1259 = Technique for Order of Preference by Similarity to Ideal Solution — min–max normaliseerimine, kaalutud positiivne/negatiivne ideaallahend, suhteline lähedus Cᵢ = d⁻/(d⁺+d⁻) ja järjestamine

# text
seg-68265fb0034c = pymcdm methods.TOPSIS + normalizations.minmax_normalization — sõltumatu kolmanda osapoole MCDA teek, mis arvutab samu ühemõtteliselt määratletud lähedustegureid; langes kokku täpsusega <{ "1e-9" }. Taasgenereeritav võrguühenduseta failiga tests/fixtures/mcda_topsis/generate_topsis_reference.py

# text
seg-ef33d848c985 = MCDA kompromissjärjestus (VIKOR)

# text
seg-cf879fb770f2 = VlseKriterijumska Optimizacija — grupikasulikkus Sᵢ, individuaalne kahetsus Rᵢ ja kompromissiindeks Qᵢ strateegiakaalul v={ "0.5" }, väiksem-on-parem järjestusega

# text
seg-c1bc14b93848 = pymcdm methods.VIKOR(v={ "0.5" }) — sõltumatu kolmanda osapoole MCDA teek, mis arvutab sama ühemõtteliselt määratletud vahemikunormaliseeritud S/R/Q agregeerimise; langes kokku täpsusega <{ "1e-9" }. Taasgenereeritav võrguühenduseta failiga tests/fixtures/mcda_vikor/generate_vikor_reference.py

# text
seg-790176ba8196 = MCDA ülekaaluahela netovoo järjestus (PROMETHEE II)

# text
seg-b25cedf6da6e = Preference Ranking Organization METHod — paarikaupa eelistusindeks kuue standardse üldistatud kriteeriumikujuga, positiivsete/negatiivsete ülekaalu voogudega ja täieliku netovoo järjestusega (tavaline kriteerium valideeritud)

# text
seg-fce0a2733809 = pymcdm methods.PROMETHEE_II('usual') — sõltumatu kolmanda osapoole MCDA teek, mis arvutab sama ühemõtteliselt määratletud netoülekaalu voo; langes kokku täpsusega <{ "1e-9" }. Taasgenereeritav võrguühenduseta failiga tests/fixtures/mcda_promethee/generate_promethee_reference.py. Lävedega (q/p/σ) eelistuskujud taanduvad samale üldistatud kriteeriumi algebrale ja jäävad omadustekontrolli tasemele

# text
seg-72248291c388 = MCDA ülekaalu valiku tuum (ELECTRE I)

# text
seg-a40e985d369d = ELimination Et Choix Traduisant la REalité — kooskõla / lahkarvamuse maatriksid, kooskõla-ja-veto-puudumise domineerimissuhe ning ülekaalu valiku tuum (kõik-kasu, summaga normaliseeritud kaalud, ühe globaalse skaala konventsioon)

# text
seg-bd625ceb90cc = pyDecision algorithm.electre_i (Valdecy Pereira) — sõltumatu kolmanda osapoole mitmekriteeriumilise otsuse teek, mis arvutab sama ühemõtteliselt määratletud kooskõla/lahkarvamuse/domineerimise/tuuma; langes kokku element-elemendi haaval täpsusega <{ "1e-9" }. Taasgenereeritav võrguühenduseta failiga tests/fixtures/mcda_electre/generate_electre_reference.py. ĉ/d̂ läviväärtuste valikud on analüütiku sisendid (tundlikkus jääb MODELLED)

# text
seg-95942c6a2689 = MCDA agregeerimise tuumad (WASPAS / MOORA)

# text
seg-97ac71b01656 = Weighted Aggregated Sum Product ASSessment (lineaarselt normaliseeritud kumer segu λ·WSM+({ "1" }−λ)·WPM väärtusel λ={ "0.5" }) ja MOORA suhtesüsteem (vektornormaliseeritud kaalutud kasu kogusumma miinus kaalutud kulu kogusumma) — stabiilsuse poolest karastatud väärtuse segu ja märgiga suhtesüsteemi skoorija

# text
seg-7727f311faa3 = pymcdm (methods.WASPAS + normalizations.linear_normalization, l={ "0.5" }; methods.MOORA suhtesüsteem, vektornormaliseerimine) — sõltumatu, laialdaselt kasutatav kolmanda osapoole Pythoni MCDA teek, mis arvutab samu ühemõtteliselt määratletud agregaate; langes kokku täpsusega <{ "1e-9" }. Taasgenereeritav võrguühenduseta failide tests/fixtures/mcda_waspas/ ja tests/fixtures/mcda_moora/ kaudu. Garbage-in-garbage-out sisendite osas; tundlikkuse/robustsuse kiht jääb MODELLED

# text
seg-7de67fedc1da = MCDA proportsionaalne järjestus (COPRAS)

# text
seg-e8f5cc5c8bb2 = COmplex PRoportional ASsessment — veerusummaga normaliseeritud kasu olulisus S⁺ pluss pöördkulu olulisuse liige, suhteline olulisus Q ja kasulikkuse aste U = Q/max Q (parim alternatiiv = { "1" })

# text
seg-49aeef0b79e4 = pyDecision algorithm.copras_method (Valdecy Pereira) — sõltumatu kolmanda osapoole MCDA teek, mis arvutab sama ühemõtteliselt määratletud COPRAS suhtelise olulisuse/kasulikkuse. pyDecisionit kasutatakse tahtlikult: pymcdm { "1.4.0" } COPRAS variseb algebraliselt kokku triviaalseks S⁺+S⁻ ega ole ustav etalon, samas kui pyDecision teostab kanoonilise Q = S⁺+(min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻)). Langes kokku täpsusega <{ "1e-9" }; taasgenereeritav võrguühenduseta failiga tests/fixtures/mcda_copras/generate_copras_reference.py

# text
seg-bdb2917a2520 = CUSUM muutuse tuvastamise viivitus ja ARL

# text
seg-302f5db625df = Tabelise CUSUM detektori halvima juhu tuvastusviivitus (⌊h/(z−k)⌋+{ "1" }) ja kontrolli alt väljas keskmine jooksupikkus, mida kasutavad ajastuse kaitsetaseme ja spuufimise monitorid

# text
seg-691a506ce13f = Avaldatud tabelise CUSUM ARL: Siegmundi ({ "1985" }) Browni liikumise lähend (Hawkins & Olwell { "1998" }, valem { "3.7" }) ristankurdatud Montgomery, Introduction to Statistical Quality Control (Wiley) ARL tabelitega, k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministlik viivitus langes täpselt kokku esmaläbimise sõltumatu etaloniga. Komponeeritud TPL piir jääb MODELLED

# text
seg-d923a77bd31a = Kella holdover-i libisemise dispersioon ja läve inversioon

# text
seg-4fafaf5f919d = Libisemise faasivea dispersiooni kasv q_wf·t + q_rw·t³/3 + q_drift·t⁵/20 ja selle monotoonne inversioon ajastusvea holdover-i läveks

# text
seg-8993c7d8b080 = scipy { "1.18" } (BSD-3-Clause): linalg.expm, mis arvutab Van-Loani { "1978" } diskreetse protsessimüra Q₀₀ = ∫₀ᵗ ΦQcΦᵀds Padé skaleerimise-ja-ruutu-tõstmise meetodil { "6" }×{ "6" } laiendatud maatriksil — sõltumatu tee, mis ei näe kunagi kshana polünoomkoefitsiente; pluss optimize.brentq, mis pöörab sama monotoonset kõverat kshana poolitusmeetodi vastu. Klassikohased punase müra põranda näitajad (ClockClass) jäävad MODELLED

# text
seg-eb3cd9e92d8d = Pöörd-Simpsoni mitmekesisuse tuum

# text
seg-244d57819f2b = Efektiivne arhitektuurne mitmekesisus = pöörd-Simpson / Hilli astme 2 arv 1/Σpᵢ² sõltumatusgruppide allikakvaliteetide üle (mitmekesisuse liige vastupidavuse skooris)

# text
seg-17d84876c2f5 = scikit-bio { "0.7.3" } skbio.diversity.alpha.inv_simpson (McDonald et al., BSD-3-Clause) — sõltumatu kolmanda osapoole teek, mis arvutab ühemõtteliselt määratletud pöörd-Simpsoni indeksi; reprodutseeritud bait baidi haaval. Selle peale ehitatud DHS-RPCF skoorimisraamistik (kaalud/tasemed) jääb MODELLED

# text
seg-c14b8fe46517 = Asimuudist sõltuv skyline'i mask: nähtav hulk, asimuut ja tõusunurk ning DOP maski all

# text
seg-56fbe6858a4e = skyline + frames::look_angles + geometry::sky_geometry: satelliidi geodeetiline (WGS-84) asimuut ja tõusunurk maajaamast, asimuudis lineaarselt interpoleeritud asimuut/tõusunurga maski tabel { "360" } kraadil ümbermähkimisega, nähtav hulk el >= max(mask_deg, mask(az)) ning selle hulga ühise kellaga DOP ja ENU-ja-kella kofaktormaatriks (orbit::dop taga olev tuum). Selle kaudu otsustab jaotis [skyline] nähtavuse stsenaariumi liikides gnss-sim, jamming, leo-pvt, leo-pass ja nmea-scenario ning maajaama user_site-ga ka liikides orbit ja integrity

# text
seg-bbb1828b3db1 = Tänavakanjoni, sektori ja maastiku taandamine tabeliks

# text
seg-2864aec7be88 = skyline: tänavakanjon suletud kujul (lõige atan((h - a) / d), kus d = (w/2) / abs(sin(az - s)), lõppude lahtisus lõpliku pikkuse korral), teravaservalised sektorid päripäeva ümbermähkimisega ja maastikupunktid tabeliks taandatuna kumerusekaoga d^2/({ "2" } * 4/3 R); skyline on nende punktiviisiline maksimum mis tahes tabeliga

# text
seg-50f1df206b30 = Sisemine: suletud kujusid kontrollitakse käsitsi arvutatud väärtuste vastu (nimetatud tänava seinaharjade tõusunurgad, lahtise otsa tingimus, nimetatud punkti kumerusekadu). Väline sõltumatu etalon puudub: disainimärkus piiritleb need taandamised kui MODELLED ja Oreliti ElevationMask võtab tabeli, seega rea „Asimuudist sõltuv skyline'i mask: nähtav hulk, asimuut ja tõusunurk ning DOP maski all“ võrdlus loeb nende 360-punktilisi tabeleid sisenditena ega kontrolli neid

# text
seg-3f3d657854ce = Skyline'i eelseadistused (linnatänav, sadamasissesõit, fjord, konteinerterminal)

# text
seg-b915c06fa3f1 = skyline::PRESETS: neli REPRESENTATIVE geomeetriat disainimärkuse nimetatud mõõtmetega ja igaühel päritoluline; city-street (kanjon, tänav { "0" } kraadi, { "20" } m { "30" } m seinte vahel, antenn { "1.5" } m), harbour-approach (sektorid: avatud merepoolsele küljele { "180" } kraadi ulatuses, kaihoonetega { "8" } kraadi { "90" } kraadi ulatuses, lainemurdja { "3" } kraadi), fjord (maastik: seinad { "600" } m antenni kohal { "1.5" } km kaugusel mõlemal pool põhja-lõuna suunalist kanalit, kumerusekadu rakendatud), container-terminal (sektorid: virnad { "12" } kraadi maapoolsel poolel, kraanade poomid { "35" } kraadi ja { "25" } kraadi kahes kitsas sektoris); iga väli üle kirjutatav

# text
seg-44ae9b6289d9 = Puudub: valitud ja nimetatud mõõtmed, mitte ühegi tänava, sadama, fjordi ega terminali mõõdistus (tänava kuvasuhe jääb Oke ({ "1988" }) vahemikku 0.5-2; fjord on Lääne-Norra fjordide suurusjärgus; virnad kasutavad ISO { "668" } high-cube kõrgust). Test kontrollib eelseadistusi nende endi nimetatud mõõtmete vastu, ümberkirjutuskontroll, mida valideerimisreegel ei arvesta

# text
seg-2c53381d48ae = Horisontaalne veaellips ja süsteemikohane kofaktor geomeetria kovariatsioonist

# text
seg-15fea5c05cbd = geometry::sky_geometry: ENU-ja-kella kofaktor (H^T H)^-1 ühe ühise vastuvõtjakella või ühe süsteemi kohta (orbit::cofactor_from_los tuum) ning horisontaalne veaellips selle ida-põhja plokist (pooltelg k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), peatelje asimuut põhjast)

# text
seg-6012113b4836 = Taevageomeetria funktsioonid: nähtavus, DOP, kovariatsioon, veaellips, Monte Carlo pilv

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> ja <c2/>, Pythoni ja WASM funktsioonid samade nimedega, MCP <c3/>): asukohast, ajast ja konstellatsiooni eelseadistustest (või satelliitidest asimuudi/tõusunurga või ECEF kujul) nähtavad ja skyline'i all maskeeritud satelliidid, GDOP/PDOP/HDOP/VDOP/TDOP, ühikdispersiooniga kofaktor (H^T H)^-1 ja kovariatsioon ida-põhja-üles süsteemis ühe vastuvõtjakellaga süsteemi kohta või ühe ühisega, horisontaalne veaellips (pooltelg k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), suund { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) põhjast) ning n algväärtustatud (seed) vähimruutude viga sõltumatute Gaussi kaugusvigade korral nende empiirilise kovariatsiooni, RMS-i ja { "95" } % sisalduvusega. Kofaktor on orbit::cofactor_from_los, üks tuum orbit::dop ja orbit::dop_cov taga (dop on dop_cov taandus): teist DOP teostust pole

# text
seg-aa0da1028636 = Ühekellalise DOP tegurid toetuvad tuumale, mis on valideeritud gnss_lib_py { "1.0.4" } vastu (rida „GNSS-i geomeetria / DOP (täpsuse halvenemise tegur)“); selle rea enda kontrollid on sisemised: sky_geometry reprodutseerib orbit::dop ja dop_cov samal geomeetrial, ellips reprodutseerib analüütilist 2x2 omalahutust, ECEF ja asimuudi/tõusunurga sisendid nõustuvad ning algväärtustatud pilve RMS ja { "95" } % sisalduvus nõustuvad geomeetriaga. ENU kovariatsioon ühe kellaga süsteemi kohta ja ellips on VALIDATED reas „Horisontaalne veaellips ja süsteemikohane kofaktor geomeetria kovariatsioonist“ (numpy, P2); siin jääb MODELLED koostis: eelseadistuste propageerimine esindusliku taevani, Monte Carlo pilv (kontrollitud geomeetria vastu, mida see valimina võtab, isekooskõla kontroll) ja pinnad. Konstellatsiooni eelseadistused annavad esindusliku taeva, mitte dateeritud; Gaussi veamudel ja UERE on nimetatud sisendid, mitte mõõdetud täpsus ega terviklikkuse piir

# text
seg-7f66be0f15c8 = GNSS-i puudumisel kella holdover

# text
seg-4d8f87668a0f = Suletud kujuga libisemisvea kasv + holdover läveni; kvantkella klassid

# text
seg-2d260626e3d2 = Mitmesammuline clock_state kovariatsiooni rekursioon (sama koodibaasi ristkontroll); aluseks olev libisemise dispersiooni ja holdover-i inversiooni tuum on väliselt valideeritud scipy vastu (vt „Kella holdover-i libisemise dispersioon ja läve inversioon“). Klassikohased punase müra põranda holdover-i näitajad jäävad MODELLED

# text
seg-29b482d88916 = Mõõdetud kella seadmekaardid (kinnihoitud ennustus)

# text
seg-8c68c5b25004 = clock_library: seadmekaart (valge faas, valge, flicker ja juhuslik kõndimine FM pluss lineaarne sageduse triiv) sobitatud ühele kolmandikule nimetatud mõõdetud kellakirjest pärast logitud konditsioneerimispassi (lüngad, faasi hälbed, faasi hüpped, purskeid eemaldatud; sageduse hüpped logitud), kaalutud lag-1-identifitseeritud müratüübi vabadusastmetega, ning selle ennustatud Alani hälvet hinnatakse kinnihoitud kahel kolmandikul; lugejad RINEX ja IGS kellafailidele, BIPM laborikohastele failidele ja Circular T jaotisele { "1" }; kaardi teisendus slotiajastuse müramudeliks, laiendatud Kalmani kellamudeliks ja spuufimise monitori müratasemeteks

# text
seg-5097a0e6460d = Mõõdetud GPS Block IIF kellakaardid tiirukohaste liikmetega (kinnihoitud ennustus)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: seadmekaart, mis kannab ühest neljani tiirukohast faasiliiget (periood T/k, T = { "43 082.05" } s), sobitatud ühiselt ruutliikmega vähimruutude meetodil ühele kolmandikule mõõdetud satelliidikella kirjest, iga liikme suletud kujuga Alani panusega { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ennustatud Alani hälbes

# text
seg-0d72fcc0fbea = Pardal oleva kella oleku hindamine

# text
seg-6db5391f8ebe = 3-olekuline (faas/sagedus/triiv) van-Loani Kalmani kell, Joseph-stabiliseeritud

# text
seg-3f0a9d7c2971 = Aja edastamise veaeelarve

# text
seg-216f46b43860 = Kahesuunaline/TWSTFT (Sagnac), GNSS ühisvaade, PPP; lingi värin→kaugus

# text
seg-e7b6aac2ec58 = Sagnaci suurust kontrollitakse autoriteetse AVALDATUD VÄÄRTUSE vastu — N. Ashby, „Relativity in the GPS“, Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), valem { "1.29" }: idasuunaline ekvatoriaalne ringreis kogub { "207.4" } ns (2ωA_E/c²); kshana reprodutseerib { "207.386" } ns. Sõltumatult kinnitatud RTKLIB { "2.4.3" } geodist()-iga (Takasu, BSD-2-Clause), mis kannab sama 2Aω/c² geomeetriat. Komposiitsel BIPM TWSTFT transponderi/ühisvaate/PPP eelarvel puudub väline sõltumatu etalon, seega jääb võimekus modelleeritud tasemele

# text
seg-157fadeb5d67 = Nav-signaali modulatsiooni ja koodijälgimise analüüs

# text
seg-ab633d191396 = BPSK-R/BOC PSD, spektraalne eraldus κ, Gabori ribalaius, DLL värin, mitmeteelevi

# text
seg-589e0053e3e8 = GPS L1 C/A hajutuskoodi genereerimine

# text
seg-782d4da75b59 = G1/G2 LFSR C/A-koodi generaator, mis reprodutseerib IS-GPS-200 avaldatud esimese 10 kiibi kaheksandsüsteemis kontrollvektorid PRN { "1" }–{ "9" } jaoks (pluss 1023-kiibi pikkus, 512 ühe tasakaal, kolmeväärtuseline perioodiline autokorrelatsioon)

# text
seg-473f24d4e06a = IS-GPS-200 tabel 3-Ia „Code Phase Assignments“ — autoriteetsed USA valitsuse avaliku omandi avaldatud esimese 10 kiibi KAHEKSANDSÜSTEEMIS kontrollvektorid (GPS Directorate, navcen.uscg.gov); kshana enda G1/G2 LFSR regenereerib iga PRN { "1" }–{ "9" } vektori täpselt. Järgnevad modulatsiooni/SSC/DLL suletud kujud jäävad modelleeritud tasemele (eraldi rida)

# text
seg-e6c08e1e6ae3 = Kvantinertsiaalsensori jõudlus

# text
seg-d28e1f6a430f = Külmaatomi interferomeetri kiirendusmõõtur esimestest printsiipidest (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Kvantinertsiaalsensori interferentsiriba mitmetähenduslikkus / dünaamiline ulatus

# text
seg-deb2850546d5 = Mach–Zehnderi interferentsiriba mitmetähenduslikkuse dünaamiline ulatus: 2π-perioodiline ribaloend määrab maksimaalse üheselt mõistetava erijõu a_max=π/(k_eff·T²) ja üheselt mõistetav ulatus lahutusrakkudes a_max/σ_a=π/σ_Φ ei sõltu optilisest skaalategurist — T² tundlikkuse võit maksab üheselt mõistetava ulatuse täpses samas tempos (küsitlusaeg vahetab lahutuse ulatuse vastu, jättes rakkude arvu ribafaasi müra määrata)

# text
seg-7603ff7a7693 = Interferomeetri ribamudeli isekooskõla: pooliriba serv, 2π-perioodiline aliasingu struktuur ja skaalateguri taandumine ulatuse/lahutuse suhtes on suletud kujuga algebralised samasused, mida kontrollitakse mootori enda Mach–Zehnderi faasi- ja tundlikkusfunktsioonide vastu — sisemise kooskõla kontrollid, MITTE väline andmestik, seega jääb rida InternalConsistency. MODELLED ideaalne kolmeimpulsiline interferentsiriba mitmetähenduslikkus; üheselt mõistetava ulatuse jaoks puuduvad lainefrondi aberratsiooni või kontrastikao piirid

# text
seg-d04bf321d4a1 = Kvantinertsiaalse dead reckoning'u vastupidavus

# text
seg-c4989abb5d40 = Komponeeritud nihke + skaalateguri + VRW + stabiilsuse hääbumise asukohaeelarve holdover-i jooksul

# text
seg-bfe4085115c1 = Sõltumatu numpy Monte Carlo SDE integreerimine topeltintegreeritud valge kiirenduse müra jaoks (valideerib analüütilist VRW dispersiooni tõeliselt sõltumatu algoritmiga) + Grovesi { "2013" } avaldatud väärtuse ankur nihke/skaalateguri liikmetele; CAI seadmenumbrid kvantifitseerivad partneri riistvara ja jäävad MODELLED

# text
seg-bc6e733c39b3 = GNSS/INS sensorite liitmine

# text
seg-16514286bb51 = 15-olekuline veaoleku EKF, lõtvalt seotud (valideeritud reaalsel IMU/GNSS sõidul NaveGo vastu); tihedalt seotud pseudovahemaa/Doppleri UKF ja seotud kell+asukoht filter (ainult kooskõla, valideeritud väitest väljas)

# text
seg-4a9bf6adeb45 = NaveGo v1.4 (R. Gonzalez, LGPL-3.0, käivitatud tööriistana GNU Octave'is, mitte kunagi linkitud): selle lõtvalt seotud ins_gnss oma reaalsel Ekinox IMU/GNSS maismaasõiduki sõidul, mõlemat lahendit hinnatakse Ekinoxi etalontrajektoori vastu. Mõlemad filtrid loevad sama { "20" } Hz float32 sisendit ning Kshana seadistus on kaardistatud mehaaniliselt andmestiku avaldatud parameetritest. Kshana horisontaalne ja vertikaalne asukoha RMS ning asukoha innovatsiooni RMS on NaveGo omade 1.2x piires (mõõdetud { "0.912" }, { "0.940" } ja { "0.861" }) ning selle keskmine normaliseeritud innovatsioon on kuni { "1.5" } (mõõdetud { "0.395" }: umbes 2.5x alakindel, arvestades andmestiku nimetatud GNSS sigmasid); tolerantsid fikseeritud enne võrdlust. Ulatus: GNSS on olemas { "5" } Hz juures kogu sõidu ajal, seega ei testita katkestust ega libisemist ning kontroll tabab jämedaid filtridefekte, mitte peenhäälestust (kangikäega parandatud toorfiksid maanduksid vertikaallävendi lähedale); kangikäe teisendus arvutatakse testkomplektis. Tihedalt seotud UKF ja seotud kell+asukoht filter säilitavad oma filterpy { "1.4.5" } kooskõlakontrollid (lineaarsed posterioorid täpsusega { "2.4e-12" }) ja jäävad valideeritud väitest välja

# text
seg-5692c7b936b6 = GNSS-i puudumisel segamiskindlus

# text
seg-f4ff77caa47b = Geomeetriline J/S linkide eelarve, segamisvastane C/N₀, satelliidikohane sünkroonsuse kadu

# text
seg-ff90679d1de9 = Spuufimise tuvastamine

# text
seg-b843f63e77e6 = Kellaabiga χ², RAIM, AGC, SQM liidetud epohhikohane turvalisuse kvaliteedinäitaja

# text
seg-b10d07921f5e = Ajastuse kaitsetase spuufimise korral

# text
seg-2a829711b997 = Suletud kujuga piir halvima juhu tuvastamata ajaveale = monitori põrand + ostsillaatori libisemise-σ üle CUSUM tuvastusviivituse, raporteeritud punase müra põranda ribana

# text
seg-0ec37553bbc4 = Tsislunaarse (Maa–Kuu ruum) missiooni analüüs

# text
seg-a47465f682ba = CR3BP STM + üksiklaske diferentsiaalparandaja; L2 lõunapoolne NRHO

# text
seg-9acd64de4abc = NASA/JPL Three-Body Periodic Orbit Database (SSD, periodic_orbits.api; Maa–Kuu L2 lõunapoolne halo perekond, Howelli/Davise metoodika) — väliselt avaldatud periood T, Jacobi C ja risti ristumise algtingimused; kshana üksiklaske STM parandaja, mis on algväärtustatud (seed) kataloogi IC-ga ja häiritud, koondub tagasi kataloogi liikmetele

# text
seg-f1d49eac89f8 = Alternatiivne / täiendav PNT

# text
seg-023dda973f66 = Gravitatsioonikaardi sobitamine, maastikuga seotud (TERCOM/SITAN), magnetanomaalia

# text
seg-da869d48e505 = IGRF-14 koefitsiendid; esimestest printsiipidest sobitatud filtri CRLB. Reaalvälja gravitatsiooni benchmark'i välja kontrollitakse väliselt (rida „Gravitatsiooni anomaalia süntees sfäärilise harmoonilise mudeli põhjal“), kuid selle navigatsioonitulemusel puudub väline sõltumatu etalon

# text
seg-db7767ab661d = Gravitatsiooni anomaalia süntees sfäärilise harmoonilise mudeli põhjal

# text
seg-2db367c4a473 = Gravitatsiooni anomaalia sfäärilises lähenduses (Barthelmes STR09/02 valem { "126" }, ICGEM gravity_anomaly_sa) täielikult normaliseeritud koefitsientidest suletud kujuga tasapinnalise ellipsoidi (WGS84/GRS80) vastu, koos nulli astme liikmega, ruudustikuna gravitatsioonikaardi sobitajale

# text
seg-abcb0965dd2b = ICGEM Calculation Service (GFZ Potsdam), sõltumatu teostus: EGM2008 kärbitud astmel { "70" }, gravity_anomaly_sa, WGS84, loodevaba, nulli astme liige, h = { "0" }. Teenuse väljund ei kanna selget litsentsi, seega tõmmatakse ruudustikud testi ajal kinnitatud SHA-256-ga (tools/fetch_icgem_grid.sh) ja viitega tsiteeritakse ainult kümmet väärtust

# text
seg-31f51d4998cb = SRTM digitaalse kõrgusmudeli lugeja reaalsel maastikul

# text
seg-08ea4ae0b671 = Käsitsi kirjutatud SRTM .hgt parser (16-bitine big-endian, põhjarida esimesena, tühimikke arvestav) + bilineaarne valimivõtja, mis loeb reaalset avaliku omandi DEM-i kihti ja lahendab dokumenteeritud mõõdistuse etaloni

# text
seg-aae487789add = NASA/USGS SRTM v3 (1 kaaresekund) N36W117 kiht — USA valitsuse PUBLIC-DOMAIN kõrgusandmed AWS elevation-tiles-prod avatud peegelselt, hõrendatud 6 kaaresekundile ja commit'itud kataloogi tests/fixtures/terrain/ (vt NOTICE.md), pluss N36W117 ja N36W119 täislahutusega väljalõiked, mis on sõlm-sõlmelt ristkontrollitud GDAL-i sõltumatu SRTMHGT lugejaga ning Mount Whitney ({ "4421" } m) ja Badwateri (−{ "86" } m) mõõdistuse etalonidega. Dokumenteeritud Badwater Basini etalon (−{ "86" } m, Põhja-Ameerika madalaim) ankurdab georeferentseeritud lugemise. Maastiku sobitamise/TERCOM nav-fiks, mis seda DEM-i tarbib, jääb modelleeritud tasemele (eraldi rida Alternatiivne/täiendav PNT)

# text
seg-791e7285c291 = Reprodutseeritavus ja tarkvara kvaliteedi tagamine

# text
seg-7177355a482c = Deterministlik, stsenaariumi räsiga, SBOM + platvormideülesed kuldväravad

# text
seg-6cf9d570cc51 = SBOM-i standardi järgimine ametliku CycloneDX { "1.5" } JSON Schema suhtes (+ kehtivad SPDX identifikaatorid) — väline avaldatud standard, null valideerimisviga kogu sõltuvusgraafil; FoM-i determinismi / baidi haaval reprodutseeritavuse osa jääb kinnitatud isekooskõla kontrolliks, seega jääb rida MODELLED

# text
seg-89b2114542bb = AI/ML RF-häirete tuvastamise hindamine ({ "13494" })

# text
# c1: impairment-eval
seg-241f2eeaef12 = Märgendatud sünteetiline häirete korpus + detektorist sõltumatu ROC/AUC/confusion/Pfa-Pmd testkomplekt; lekkekaitse, kihiline jaotus, jaotuse nihke (režiimisisene vs režiimivälise) optimismi aruanne. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/impairment-eval.toml)

# text
seg-72a3c97ef04b = Suletud kujuga AUC piirid (Mann–Whitney) + täiusliku sõltumatu etaloni detektor; korpus on SÜNTEETILINE (parameetritest lähtuv, mitte välja/IQ andmed)

# text
seg-c38ebee794b3 = AI/ML RF-häirete optimismilõhe uuring ja ainult ID lõhe ennustaja

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Kontrollitud sünteetiline uuring jaotusesisene→jaotuseväline AUC optimismilõhe kohta avaldatud meetodite ja õpitud (logistiline regressioon / ühe peidetud kihiga MLP) detektorite üle: klassikohased skaleerimisseaduse trendid (Spearmani ρ + tõus suuruse { "1" }−tõsidus korral) ja ainult ID ridge-ennustaja, mis hindab lõhet ainult jaotusesisestest diagnostikatest, hinnatud ühe detektori välja jätmise ja ühe klassi välja jätmise meetodil. Reprodutseeritav käsuga <c1/>

# text
seg-c46973920f5b = Käsitsi tuletatud statistikad versus suletud kujud (binormaalne AUC Φ(d'/√{ "2" }), DeLongi dispersioon, viigiastmetega Spearman, täpne OLS taastamine) + ühe välja jätmise CV versus ennusta-keskmine lähtetase. Korpus on SÜNTEETILINE (parameetritest lähtuv, mitte kunagi välja/IQ andmed) ja optimismilõhe on sünteetiline→sünteetiline tõsiduse nihe, MITTE simulatsioon-väli tulemus

# text
seg-fd6424213d1f = Kvant-versus-klassikaline PNT kompromiss ja GNSS-i puudumisel vastupidavus ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Mõõdetud ADEV vastuvõtt (NNLS), kompromissitabel (ajastuse/inertsiaalne holdover + kasu), vastupidavus-versus-aeg ümbris; põranda hoiatus kantakse artefaktil. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/quantum-trade.toml)

# text
seg-37d11937c966 = Mõõdetud ADEV→PSD sobituse (NNLS) tuum on sobitatud scipy.optimize.nnls-iga (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — sõltumatu väline tuum; kuid kompromissi NUMBRID kvantifitseerivad (mitte kunagi ei valideeri) partneri kella/CAI-d, seega jääb kompromiss ise MODELLED, ilma valideerimise sära

# text
seg-1fa865bfddd1 = Kosmoseilma keskkond ja aktiivsusest juhitud termosfääri tihedus

# text
# c1: space-weather
seg-47308f611c7e = Päikese/geomagnetilised indeksid (definitsiooniline Kp↔ap tabel), Jacchia-1971 eksosfääri temperatuur ja Jacchia { "1971" } termosfääri tihedus (SAO Special Report { "332" }: staatilised difusiooniprofiilid, mis reprodutseerivad selle tabelit { "7" }, koos päevaste, geomagnetiliste, poolaastaste, hooajaliste laiuskraadide ja heeliumi variatsioonidega) staatilise USSA76 atmosfääri vastu. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/space-weather.toml)

# text
seg-29bedb28c34f = CCSDS OEM koostalitlusvõime (GMAT/Orekit/STK efemeriidi import)

# text
# c1: oem-interop
seg-edb58ffbbb5b = CCSDS { "502.0" } OEM importija (parse_oem), talub COMMENT ridu / lisametaandmete võtmesõnu / kovariatsiooniplokke ja on kirjutaja täpne pöördfunktsioon; ringkäik + välise faili vastuvõtt kiirusekooskõla kontrolliga. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/oem-interop.toml)

# text
# c1: oem
seg-bc507f96c4df = Sõltumatu kolmanda osapoole CCSDS-502 parser <c1/> { "0.4.5" } (MIT, https://pypi.org/project/oem/) — eraldi koodibaas, mis dekodeerib kshana väljastatud EME2000/UTC OEM-i baidi haaval identselt ({ "24" } olekut { "2" } fikstuuri üle, asukoht/kiirus Δ = { "0" }) ja mille range lugeja kinnitab metaandmete märgid; kshana parser nõustub sellega samuti vendori kaasatud välisel OEM-il. Kaks ausat koostalitluse leidu (oem teek lükkab tagasi kshana satelliidikohase mitmesegmendilise konventsiooni ja selle mitmekirjelisi kovariatsioonirida) on testis dokumenteeritud — seega see valideerib ühe objekti standardit järgiva vahetuse, mitte iga kshana variandi CCSDS-502 standardi täielikku järgimist

# text
seg-c76b8c395ef0 = Stardiakna ja tõusu geomeetria (missiooni analüüs)

# text
# c1: launch-window
seg-6066c634faba = Kahe keha stardiasimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav inklinatsioon, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg tasandi muutuse Δv ja ööpäevased võimalused ning, kui on antud epohh ja IERS finals2000A read, jaama kiirus tõelise pooluse ümber (launch::site_rotation_speed_at). Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/launch-window.toml)

# text
seg-ff2cd766bb52 = Ballistilise taassisenemise koridor (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Tippkiirendus (ballistilisest koefitsiendist sõltumatu), kiirus + kõrgus tipp-g juures ja tippkuumenemise kiirus eksponentsiaalse atmosfääriga ballistilisel sisenemisel. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/reentry.toml)

# text
seg-8c10b50407d3 = EO kasuliku koormuse jalajälje ja katvuse geomeetria

# text
# c1: eo-coverage
seg-45c1e799c87c = SMAD kosmosekolmnurga geomeetria: Maa nurkraadius, haardelaius, nadiiri GSD, maksimaalne nadiirist kõrvale pääs ja ringorbiidi periood, pluss esimest järku J2 sõlmeperiood (eo_payload::j2_nodal_period) ja ekvatoriaalne maapealse jälje vahe R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) pideva katvuse lipuga, orbiidi kõrguse, inklinatsiooni ja sensori FOV/IFOV jaoks. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/eo-coverage.toml); selle vaikeinklinatsioon on päikesesünkroonne eo_payload::sun_synchronous_inclination-ist, mugavusvaikeväärtus, mis ei kuulu valideeritud väite alla

# text
seg-940692c550f3 = CCSDS Space Packet ({ "133.0" }) TM/TC raamistus

# text
# c1: space-packet
seg-bf06c7ffa875 = CCSDS 133.0-B Space Packet primaarpäise kodeerimine/dekodeerimine (versioon/tüüp/sek-päis/APID/jada-lipud/loendur/andmepikkus) + raamistuse stsenaarium. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/space-packet.toml)

# text
seg-6bec79623cc8 = spacepackets { "0.32.0" } (us-irs/spacepackets-py, R. Mueller, Apache-2.0) — CCSDS 133.0-B-2 sõltumatu kolmanda osapoole teostus; kshana encode_packet/decode_packet langes baidi haaval täpselt kokku (6-oktetine primaarpäis { "33" } juhul + täielik kodeeritud pakett { "12" } juhul)

# text
seg-5510c82f671a = CCSDS Space Packet sekundaarpäis, paketi veakontroll ja segmenteerimine

# text
seg-7503bf761df9 = CCSDS 133.0-B-2 Space Packet laiendused primaarpäise kõrval: sekundaarpäis, mis kannab CCSDS 301.0-B ajakoodi (CUC või CDS, selge või kaudne P-väli) ja lisaandmeid, CRC-16 paketi veakontrolli väli, suure kasutajaandmete üksuse segmenteerimine ja selle taaskoostamine, vooludekodeerimine jada lünga ja järjekorra kontrollidega ning PUS-TM paketid. Primaarpäise väljund on baidi haaval identne varasemaga

# text
seg-af843a3a830a = <s1>space_packet (TimeCode, SecondaryHeader, paketi veakontroll, segmenteerimine ja taaskoostamine, vooludekodeerimine)</s1>

# text
seg-7c61da52b8f8 = SPICE SPK eksport (tüübid { "9" } ja { "13" })

# text
seg-582ce23522f6 = NAIF SPICE SPK kernelite tüüpide { "9" } (Lagrange, ebavõrdsed ajasammud) ja { "13" } (Hermite, ebavõrdsed ajasammud) kirjutaja ja lugeja koos DAF paigutuse, segmendideskriptorite ja epohhikataloogidega, ning CCSDS OEM-i eksport SPK kernelisse (UTC või TDB epohhid efemeriidiajaks)

# text
seg-d699104fc2af = SPICE SPK tüübid { "3" } ja { "21" } (Tšebõšev, laiendatud vahereaed)

# text
seg-7d3e8b5b40af = NAIF SPICE SPK segmentide tüübi { "3" } (Tšebõševi polünoomid asukohale ja kiirusele fikseeritud intervallide üle, aste { "0" } kuni { "27" }) ja tüübi { "21" } (laiendatud modifitseeritud diferentsimassiivid, JPL integraatorite vahereaed, MAXDIM { "15" } kuni { "25" }) kirjutaja ja lugeja antud kirjetest, failides, mis sisaldavad ka tüübi { "9" } ja { "13" } segmente; kirje valik ja arvutus SPICE lugejate järjekorras. Kshana ei sobita Tšebõševi koefitsiente ega tekita vahereaid

# text
seg-39517faae95c = CCSDS asendisõnumid (AEM, APM)

# text
seg-f88f6ea002c8 = CCSDS 504.0-B-2 asendisõnumite (Attitude Data Messages) kirjutaja ja lugeja KVN-is ja NDM/XML-is: AEM versioon { "2.0" } (ja { "1.0" } KVN-is, koos selle ATTITUDE_DIR, QUATERNION_TYPE ja arvuliste pöördejadadega) kvaternioon-, Euleri nurga ja spinn-asendi tüüpide ning nende tuletise, nurkkiiruse ja nutatsiooni variantidega, mitu segmenti; APM versioon { "2.0" } kvaternioon-, Euleri, nurkkiiruse, spinn-, inertsi- ja manöövriplokkidega; kirje A-st B-ni kvaternioon (504.0-B-2 lisa F)

# text
seg-5f26f879037e = CCSDS orbiidiandmesõnumid (OPM, OMM, OCM)

# text
seg-eaddfd311fea = CCSDS 502.0-B-3 orbiidiandmesõnumite (Orbit Data Messages) kirjutaja ja lugeja KVN-is ja NDM/XML-is: OPM { "3.0" } ja { "2.0" } (olekuvektor, oskuleerivad Kepleri elemendid, kosmoseaparaadi parameetrid, kovariatsioon, manöövrid, kasutaja määratud parameetrid), OMM { "3.0" } ja { "2.0" } (keskmised elemendid keskmise liikumise või poolpeatelje järgi, TLE-ga seotud parameetrid BSTAR või BTERM ja AGOM-iga, kovariatsioon) ning OCM { "3.0" } trajektoori (CARTP, CARTPV, CARTPVA; absoluutsed või suhtelised epohhid), füüsikaliste omaduste, kovariatsiooni (CARTP, CARTPV LTM järjekorras), manöövri ja kasutaja määratud plokkidega; täistäpsusega OMM SGP4 elemendikomplektist muutmata OmmFile::to_omm_kvn kõrval

# text
seg-1e5ea1d9918d = 3-DOF asendi ja sihtimisvea eelarve (AOCS)

# text
# c1: attitude-budget
seg-21f2f8efcf19 = Gravitatsioonigradiendi halvima juhu häiringumoment ((3/2)(μ/R³)ΔI) tipuna asendi üle (valideeritud väide), pluss RSS sihtimisvea eelarve nimetatud 1σ panustajate üle koos domineeriva liikmega (kutsuja antud arvude ruutsumma, valideeritud väitest väljas). Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/attitude-budget.toml)

# text
seg-296ed0074521 = Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), täistensori gravitatsioonigradiendi momendi sõltumatu C++ teostus: Kshana tipp (3/2)(μ/R³)ΔI võrdub Basiliski momendiga { "45" } kraadi asendi juures täpsusega { "1e-12" } suhteliselt (halvim { "2.1e-15" }) { "5" } kõrgusel ja { "8" } inertstensoril ning piirab Basiliski momenti { "2000" } juhusliku asendi korral juhtumi kohta; tolerants fikseeritud enne võrdlust. Valideeritud väide: gravitatsioonigradiendi momendi tipp. RSS sihtimiseelarve on kutsuja antud arvude ruutsumma ilma välise tegeliku väärtuseta ja jääb sellest väljapoole; käsitsi kodeeritud Hipparchuse täistensori maksimeerimine jääb toetavaks isekooskõlaks. Juhtsilmuse/6-DoF/painduvate modaalide simulatsiooni pole

# text
seg-1461aa14a7ff = Maajaama läbimise ennustus (maasegment)

# text
# c1: passes
seg-e1cf1ec4f005 = Ajadomeeni nähtavusläbimised (AOS/TCA/LOS, maksimaalne tõusunurk, kestus) mootori propagaatorile jaama kohal üle tõusunurga maski, interpoleeritud tõusu/loojangu ületustega ja kogupääsuga: passes::predict_passes, geomeetriline planeerija (refraktsiooni ega valguse levi aega pole). Stsenaariumi liik <c1/> käitab rea „Näiv maajaama läbimise ennustus refraktsiooni ja valguse levi ajaga“ näiva ennustaja

# text
seg-b351cd4245dd = Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — sõltumatu lennudünaamika teek: ElevationDetector (Brenti juurteleidja) + EventsLogger ITRF efemeriidi üle, jaam WGS-84 TopocentricFrame'ina. AOS/LOS/maksimaalne tõusunurk/läbimiste arv/kogupääs langesid kokku identsel orbiidil+jaamal+maskil+aknal (commit'itud fikstuur; draiver xval/orekit-passes)

# text
seg-1dd8b2655b18 = Näiv maajaama läbimise ennustus refraktsiooni ja valguse levi ajaga

# text
# c1: passes
seg-46f93d3c24d2 = SGP4 elemendikomplekti nähtavusläbimised (AOS, TCA, LOS, maksimaalne näiv tõusunurk, kestus) WGS-84 jaama kohal valideeritud Maa orbiidi teel (IAU 2006/2000A, valikulised Maa orientatsiooni parameetrid), ITU-R P.834-9 troposfääri refraktsiooniga (valemid { "9" } kuni { "14" }, soovituse trükitud koefitsiendid) ja allalingi valguse levi ajaga, kumbki lülitatav; ületused lahendatud poolitamisega täpsuseni { "1e-7" } s ja kulminatsioon kuldlõike otsinguga. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/passes.toml), mõlemad parandused vaikimisi sees

# text
seg-7b4a8e25c3c9 = DVB-S2 adaptiivne kodeerimine ja modulatsioon LEO allalingi läbimisel

# text
# c1: acm-link
seg-3912fb8ccb15 = Allalingi Es/N0 ühe satelliidi iga läbimise ajal ühe jaama kohal (EIRP, vaba ruumi kadu, kosekansiseaduse atmosfäärikadu, muud kaod, G/T, Boltzmanni konstant, sümbolkiirus), kõige tõhusam DVB-S2 MODCOD, mis ületab oma ETSI EN { "302" } 307-1 V1.4.1 tabeli { "13" } kvaasi-veavaba läve pluss teostusvaru igal sammul, läbimise ACM andmemaht ning konstantse kodeerimise lähtetase, mis sulgub maskil ja pikimal kaugusel. Käivitatav stsenaariumi liigina <c1/>. Illustratiivsed sisendid; MODELLED.

# text
seg-a7f26e3a6030 = Sisemine kooskõla: tabeli 5a K_bch ja kaadripikkustest suletud kujul arvutatud spektraalne efektiivsus nõustub tõhususega, mida tabel { "13" } trükib (läviväärtuste tabeli ümberkirjutuskontroll); linkide eelarve osad nõustuvad oma suletud kujudega; valik on Es/N0 suhtes monotoonne ja austab varu; ACM liigutab vähemalt konstantse kodeerimise mahu. Läbimise geomeetria tuleb eraldi VALIDATED näiva läbimise ennustajalt. MIS EI OLE: ühtegi välist tööriista ega mõõdetud linki pole võrreldud; läved on standardi ideaalsed AWGN väärtused, mitte modemi omad; vihmavaimenemist, sihtimiskadu läbimise ajal ja pilootsignaale ei modelleerita.

# text
seg-19603a7e0fe8 = Mitme satelliidi ja mitme jaama maakontakti planeerimine konfliktide lahendamisega

# text
# c1: contact-schedule
seg-40edeae6e48b = Kandidaatkontaktid igast satelliidi-jaama läbimisest selle ACM andmemahuga; konfliktid, kus üks antenn teeniks kahte satelliiti oma ümberlülitusaja sees või üks satelliit saadaks allalingi korraga kahele jaamale; prioriteetidega kaalutud kohaletoimetamise sihtfunktsioon, mis on piiratud iga satelliidi tagavaraga; laisk marginaalväärtuse ahne plaan, esimesena-tulnu lähtetase ja täpne hargnemis- ja piirimeetod kuni { "26" } kandidaadil, koos raporteeritud ahne plaani optimaalsuse lõhega. Käivitatav stsenaariumi liigina <c1/>. Illustratiivsed sisendid; MODELLED.

# text
seg-bc520db98f9a = Sisemine kooskõla: täpne hargnemis- ja piirimeetod nõustub täieliku läbivaatusega väikestel juhuslikel hulkadel, iga plaani kontrollitakse konfliktireeglite suhtes teostatavaks ja ahne plaan ei löö kunagi täpset optimumi. MIS EI OLE: ühtegi välist planeerijat ega operatiivplaani pole võrreldud; kontaktid võetakse tervikuna (jagamist pole), tagavara on fikseeritud akna alguses, fikseeritud ümberlülitusaja ületavat pöörde aega ja pardasalvestust ei modelleerita.

# text
seg-ddf2bc2f13a9 = Ühesuunaline linkide eelarve (side / lingi disain)

# text
# c1: link-budget
seg-83331f513dba = Vaba ruumi leviku kadu, C/N₀, Eb/N₀, varu ja sulgumine CCSDS { "401" } / DSN 810-005 lingivõrrandi üle EIRP/G·T/kauguse/kiiruse/ribaga nõutava Eb/N₀ vastu. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/link-budget.toml)

# text
seg-195bf7e31f24 = Avaldatud kaugkosmose telekommunikatsiooni disainikontrolli tabel kinnitatud arvuliste vektoritena: DESCANSO / J. H. Yuen (toim.), Deep Space Telecommunications Systems Engineering, JPL Pub 82-76, tabel 1-1 (Galileo X-riba) — kshana koostab tabeli reaelemendid uuesti ja reprodutseerib selle avaldatud otsast lõpuni L_fs { "290.54" } dB ja Pr/N0 { "54.6" } dB-Hz; vaba ruumi kadu kontrollitakse ka ITU-R P.525 vastu

# text
seg-3742d2aea62a = Säästlik kulu katvuse kohta / ROI raamistik

# text
seg-4228311689f8 = Kulu protsendi katvuse kohta + katvus euro kohta ROI konstellatsiooni mõõtmestamise mootori üle; satelliidikohane kulu on kutsuja hankitud madal/nominaalne/kõrge vahemik (väljamõeldud hindu pole)

# text
seg-d542ac64c31c = Suletud kujuga kuluaritmeetika versus käsitsi tuletatud väärtused; modelleeritud katvusarvu majanduslik RAAMISTAMINE, mitte pakkumine ega valideeritud kulumudel

# text
seg-8ba6ee9acc8a = Tuvastamata jäänud sündmuse terviklikkuse mõju (kontekstiteadlik HPL/VPL versus häirelävi)

# text
seg-f5985399d0d5 = Kaardistab tuvastamata spuufimise/segamise nihke efektiivseks veaks → Stanfordi piirkond (kättesaadav/kättesaamatu/MI/HMI) kontekstispetsiifilise HAL/VAL vastu (avatud taevas vs linn)

# text
seg-124d0ffe959e = Komponeerib väliselt valideeritud RAIM Stanfordi klassifikatsiooni (raim::classify_stanford); tuvastamata jäänud sündmus→AL kaardistus ise on modelleeritud, mitte sertifitseeritud terviklikkuse jaotus

# text
seg-37d43b5b918a = CAI viidatud veamudeli parameetrileht ({ "13503" })

# text
seg-0b6a901f5ad2 = Vahemikuga (parim/nominaalne/konservatiivne) külmaatomi-interferomeetri jõudlus — nihke ebastabiilsus, kiiruse/nurga juhuslik kõndimine, skaalateguri stabiilsus, küsitlusajaga piiratud valimisagedus, interferentsiriba mitmetähenduslikkuse dünaamiline ulatus — igaüks viidetega jälgitav; toidab QuantumNavBudget'i ilma riistvara modelleerimata

# text
seg-4b66096727b8 = Sisemine kooskõla: viidatud VRW vahemik ristkontrollitud CaiAccelerometer::accel_asd füüsika vastu + toordünaamiline ulatus arvutatud interferentsiriba mitmetähenduslikkuse piirist; numbrid on MODELLED kirjandusülevaate vahemikud (needs_source_confirmation), ühtegi seadet pole valideeritud, valideerimise sära puudub

# text
seg-c93f2d3a3167 = Ajastuse terviklikkuse standardi järgimise benchmark — Stanfordi terviklikkusdiagrammi epohhi klassifitseerija

# text
seg-712d5c35a6a6 = TIB Stanfordi terviklikkusdiagrammi epohhide klassifikatsioon (nominaalne / kättesaamatu / MI / HMI)

# text
seg-93b913e60063 = Nelja piirkonna reegli sõltumatu numpy uusteostus (scripts/gen_tib_scorer_reference.py) identsel valimihulgal; meetod viidatud Stanfordi–ESA terviklikkusdiagrammist (Tossaint et al., ION GNSS { "2007" }) ja RTCA DO-229 WAAS MOPS-ist. MITTE ExternalDataset täpsuse sõltumatu etalon — benchmark on ausameelsusele immuunne.

# text
seg-573aa0193cb3 = Ajastuse terviklikkuse standardi järgimise benchmark — terviklikkuse katvuse skoorija

# text
seg-4d86f3c2d8f5 = TIB terviklikkuse katvuse skoorimine (HMI/MI/kättesaadavuse määrad + ülepiiramise katvuse otsus)

# text
seg-645eb084ae8e = Sõltumatu numpy piirkondade ümberloendus failis tests/fixtures/tib/reference.json; ainult skoorija masinavärgi ristkontroll, täpsusväidet pole.

# text
seg-372dd0fdb025 = Ajastuse terviklikkuse standardi järgimise benchmark — tõrgete kataloog (parameetrilised generaatorid)

# text
seg-2604e7cf27d2 = TIB tõrkemenüü (domeenide lahknemine, kella löömine, holdover-i libisemine, staatiline/juurdekasvuline/sümmeetriline/asümmeetriline viivitus, kordus värskuse piires, teevalikuline, k-N-st kvoorum)

# text
seg-b907aecaccd0 = Esinduslikud parameetrilised tõrkegeneraatorid (modelleeritud); tuvastamatu hulk (sümmeetriline viivitus, kordus värskuse piires) on viidatud Mizrahi RFC { "7384" } ja Narula & Humphreys (IEEE JSTSP { "2018" }) põhjal. Välist sõltumatut etaloni pole — tõrgete kataloog ei esita mõõdetud väidet.

# text
seg-90c0eb1e7c14 = Ajastuse terviklikkuse standardi järgimise benchmark — tuvastamatu neeldumise otsus

# text
seg-f713acf042ff = TIB tuvastamatu neeldumise otsus (sümmeetriline/kordus peab olema PL-i poolt neelatud, mitte kunagi tuvastatuks raporteeritud)

# text
seg-6840c2467c63 = Omaduskontroll, et Verdict enum ei saa struktuuriliselt tuvastamatut tõrget tuvastatuks raporteerida (Mizrahi RFC { "7384" }); neelatud ⟺ PL ≥ nihe. Täpsuse sõltumatu etalon puudub.

# text
seg-3652a591eefc = Kosmoseaparaadi platvormi inseneeria (AOCS/termiline/konstruktsioonid/tõukejõud/toide)

# text
seg-50a9c1c7dff0 = Ei paku — Kshana on navigatsioonijõudluse simulaator, mitte platvormi ehitaja

# text
seg-a349aa76b0ed = PARTNER

# text
seg-b28dd62dca1c = Navigatsiooni RF kasuliku koormuse ja antenniriistvara disain

# text
seg-76c983a23e7b = Ei paku — Kshana modelleerib signaali jõudlust, mitte kasuliku koormuse/antenni riistvara

# text
seg-7bba3b35214c = Kvantkasuliku koormuse riistvara disain ja küpsemine

# text
seg-15fcc200b859 = Ei paku — ainult jõudlusmudelid; külmaatomi/kella riistvara on partneri oma

# text
seg-d69dd4c5167b = Lennuriistvara tootekvaliteedi tagamine (kiirgus/EEE/MAIT)

# text
seg-b1540f78ffd4 = Ei paku — Kshana räägib ainult tarkvara PA-st; lennu-PA on partneri oma

# text
seg-1f200f8efc71 = Kuu koordinaataeg

# text
seg-2e6961dbffe9 = Relativistlik Maa–Kuu kellakiirus (LTC/TCL) + TT/TAI/UTC ahelamine + ansambel

# text
seg-3f52d6e04361 = Ashby & Patla { "2024" }, „A Relativistic Framework to Estimate Clock Rates on the Moon“, Astronomical Journal { "167" }:{ "149" } (NIST; IAU/IAG LunaNet LTC alus): Kuu pinna omapotentsiaal L_m = { "3.13881e-11" } ja sekulaarne kogu { "56.02" } µs/päevas langesid kokku avaldatud arvväärtustena; geotsentriline Kuu kiirus ristkontrollitud JPL DE440 (de440s.bsp SPICE'i kaudu) vastu

# text
seg-8adbbd2cdb74 = Hübriidse optilise/RF aruande enesekirjeldus

# text
seg-2a5e48b558e1 = Hybrid-optical-rf aruanne esitab lingi konfiguratsiooni, millega see tegelikult töötas (kandelaine pikkus, saate- ja vastuvõtuava, kaugus, impulsi laius, integreerimisaeg, kasutegurid ja kaod, vaikeväärtused lahendatud) ning kannab ühikuplokki, mis annab iga suuruse ühiku ja päritoluklassi, mida artikkel tõenäoliselt tsiteerib, sealhulgas üleandmise kovariatsioonijäljed ruutmeetrites

# text
# c1: variance
seg-23f0c10237f4 = Välist sõltumatut etaloni pole ja see ei ole võimalik: see on enesekirjeldus, mitte mõõtmine. See on registreeritud, sest selle puudumine oli defekt -- P5 pidi kandelaine pikkust ja saateava lähteväärtustest tsiteerima ning tuletama sisemisest kooskõlakontrollist, et paljas <c1/> oli ruutmeetrites. Tuletus oli õige, mis on täpselt see, miks see loeb: miski poleks tabanud, kui see oleks olnud vale

# text
seg-0691f3dee8cb = Hübriidse optilise/RF lingi kättesaadavus RF poolel

# text
seg-72ccb655caf0 = Hybrid-optical-rf aruanne esitab RF lingi kättesaadavuse, mis on koostatud suurustest, mida mootor juba arvutab, mitte imporditud klimatoloogiast, ning esitab koostise nimetatud reeglina: A_rf = I_closure * I_track, kus I_closure on ühesuunalise CCSDS-401 / DSN-810-005 linkide eelarve (linkbudget::link_budget, Eb/N0 varu >= { "0" }) sulgumisotsus stsenaariumi enda kaugusel ja I_track on jälgimissilmuse otsus (jamming::lock_status) C/N0 kohta, mille SAMA eelarve tagastas. Iga tegur kannab oma sisendi päritoluklassi väljundini ning tegurid, mis tahtlikult EI ole korrutises -- geomeetriline nähtavus, häirega keelamine ja RF katkestuse klimatoloogia -- on põhjendusega nimetatud, mitte vaikselt väärtusele { "1" } seatud. Lahendatud RF haru kajastatakse omaenda rf_link_configuration plokina ning indikaatori kõrval olevad pidevad näitajad (lingi varu, C/N0 varu, suletud kujuga sulgumise ja jälgimise kaugused ning kauguse kasutus) on sama eelarve kauguse inversioonid. Aruanne esitab täielikult, plokil ja ühikute kirjel, millele lugeja satub, et see arv on VARU/GEOMEETRIAPIIRATUD ja DETERMINISTLIK, samas kui optiline kättesaadavus on ILMASTIKU/KLIMATOLOOGIAGA PIIRATUD ja tõenäosuslik, seega ei saa neid kunagi tsiteerida võrreldava protsendipaarina

# text
seg-319705ea0166 = Välist sõltumatut etaloni pole ja ExternalDataset on tagasi lükatud. Kaks sisendit on Eb/N0 varu ja C/N0 läve ületus, mõlemad MODELLED EIRP, kvaliteedinäitaja ja koondatud kadude jaotuse funktsioonid; Maa–Kuu optilise/RF hübriidteenuse jaoks pole mõõdetud kättesaadavuse kirjet, mille vastu koostatud arvu kontrollida. Olemasolevad kontrollid on sisemised ja neid nimetatakse nii: koostis arvutatakse uuesti aruande enda avaldatud varudest, mitte emitteri sisemustest, ning sulgumiskaugus kontrollitakse lingivõrrandi uuesti käivitamisega SELLEL ja nõudega, et varu kaoks -- inversiooni ringkäik, mitte sõltumatu teostus. Arvu aus piir on registreeritud aruandel endal: see on deterministlik 0/1 indikaator, mitte tõenäosus, sest miski selles mootoris ei mõõda RF lingi katkestuse jaotust sellel ribal ja geomeetrial. See puuduv sisend on nimetatud väljas rf_availability.factors_not_included, mitte välja mõeldud, ning selle andmine on see, mida tõenäosuslik RF kättesaadavus vajaks

# text
seg-22c5df9b6c7c = Võrdväärne optilise-versus-RF kaugusmõõtmise võrdlus

# text
seg-70eb396f40af = Hybrid-optical-rf aruanne väljastab optilise-versus-RF kaugusmõõtmise suhte koos ÜHE konfiguratsiooniga, mille juures mõlemad harud hinnati, kantuna samas objektis: sama ühesuunaline tee, sama kaugus ja sama akumuleerimisaeg. Optiline haru on mootori footonipiiratud ToA CRLB ühesuunalisel footonite arvul; RF haru on mootori DLL varajase-hilise termilise koodijälgimise värin C/N0 juures, mille mootori enda linkide eelarve sama ühesuunalise kauguse jaoks tagastab. Silmuse müraribalaius on tuletatud, mitte valitud: B_L = 1/({ "2" }*integration_s) paneb RF haru täpselt optilise akumuleerimisaja peale ja kui kutsuja selle üle kirjutab nii, et kaks keskmistamisaega lahknevad, on suhe REFUSED -- null, koos nimetatud mittesobivuse ja mõlema ajaga -- mitte ei tsiteerita kahes töökohas. Suhet ei moodustata stsenaariumi VALITUD parameetrilise rf_position_sigma_m vastu ja keeldumine ütleb, miks: see sisend ei kanna üldse konfiguratsiooni. Avaldatud kahesuunaline optiline pealkirjanäitaja ja täpne tegur, mis seob selle ühesuunalise võrdlusharuga, väljastatakse suhte kõrval, seega ei saa aruannet lugeda nii, nagu see kannaks kaht lahknevat optilist sigmat

# text
seg-acbb3ac98ee3 = SUHTEL puudub väline sõltumatu etalon ja ExternalDataset on tahtlikult tagasi lükatud. Aluseks oleval RF ahelal on see olemas -- tests/validate_p5_rf_ranging_precision.rs kontrollib linkbudget::link_budget ja navsignal::dll_code_jitter_chips sõltumatu Python/NumPy fikstuuri ja kõvakodeeritud Kaplani ja Hegarty läbitöötatud väärtuse ({ "2.814e-3" } kiipi / { "0.825" } m juures { "45" } dB-Hz) vastu -- ja optilisel CRLB-l on oma suletud kujuga rida. Kummagi ankru väitmine sellele reale oleks laenatud valideerimine, mida maatriksi invariandid takistavad: siinne suurus on SUHE konfiguratsioonil MODELLED EIRP, kvaliteedinäitaja, saatevõimsuse ja avaga ning mõõdetud optilise-versus-RF kaugusmõõtmise võrdlust ühisel töökohal, mille vastu seda kontrollida, ei ole. Sisemiselt kontrollitakse seda, mida suhe saab tegelikult valesti teha: et kaks haru asuvad ühes töökohas. Seda mõõdetakse ühise akumuleerimisaja skaleerimisega ja nõudega, et mõlemad harud liiguksid sama ruutjuure seaduse järgi ning suhe jääks paigale, ning seda jõustatakse suhte täieliku tagasilükkamisega, kui keskmistamisajad lahknevad. Mõlemad harud on termilise/haavlimüra piirid ja mõlemad jätavad välja keskkonna viivituse, kellavea ja mitmetähenduslikkuse, seega on väljajätt mõlemal poolel identne; aruanne ütleb seda, mitte ei jäta seda tuletada

# text
seg-3f26f598e013 = Linkide eelarve aruande enesekirjeldus

# text
seg-b88bf41d6d4c = Linkide eelarve aruanne esitab iga absoluutse konstandi, millest selle enda varu arvutati -- kandesagedus, mida vaba ruumi kadu kasutas, EIRP, kvaliteedinäitaja, koondatud kadu ja Boltzmanni liige -- pluss nõutava G/T, mille juures varu on null, lingikonstandi (EIRP - kaod - nõutav Eb/N0), mis on ainus kombinatsioon, mille avaldatud kiiruse/võimenduse tabel kunagi fikseerida saab, ja, kui kutsuja esitab süsteemi müratemperatuuri, vastuvõtuantenni võimenduse, mida see kvaliteedinäitaja eeldab

# text
seg-52f98f50522f = Välist sõltumatut etaloni pole: see on enesekirjeldus võrrandi üle, mis on juba valideeritud avaldatud disainikontrolli tabeli vastu (vt ühesuunalise linkide eelarve rida). See on registreeritud, sest selle puudumine oli mõõdetud defekt -- väljastatud d1_rate_gain_beamwidth.csv reprodutseerimine nõudis ühe efektiivse konstandi tagasilahendamist täpsusega { "0.0034" } dB kõigist kolmekümnest reast ja mootor nii nimetab selle kombinatsiooni kui ka tõestab testiga, et ükski väljastatud tabel poleks kunagi saanud selle kolme komponenti eraldada

# text
seg-a7b192e27cb5 = Kellaklassi kohane Kuu aja ristumiskoha tabel

# text
seg-cab605dc6ea2 = Üks Kuu aja eelarve jooks väljastab kellaklassi kohta kella-versus-süsteemi ristumiskoha rea ühe jagatud süsteemiliikme vastu, nii et kell on ainus muutuja võrdluses; iga rida kannab kahel viisil saavutatud ristumiskohta -- poolitatud üldisest astmeseaduse ajavea kõverast ja algebraliselt pööratud rea domineerivast müratüübist -- koos nende suhtelise erinevusega

# text
seg-ccec15f0b125 = Kaks erinevat koodibaasisisest sama suuruse arvutust, mitte üks ümber väljendatud: poolitamine IEEE-1139 astmeseaduse kõveral ei tea midagi müratüübist, samas kui suletud kuju pöörab domineeriva tüübi algebraliselt, seega ekslikult klassifitseeritud müratüüp või halb raamistik ilmneb mitte-triviaalselt väikese suhtelise erinevusena. Neli väärtust reprodutseerivad ka artikli avaldatud tabeli poole selle viimase trükitud numbri täpsusega -- kuid see tabel ise rekonstrueeriti samast suletud kujust, seega on see reprodutseeritavuse kontroll ja mitte väline sõltumatu etalon, ning süsteemiliige, mille vastu seda mõõdetakse, on modelleeritud jaotus

# text
seg-ff32b78acb8c = Ühine UT1 ja polaarliikumise viga ühisel reahulgal

# text
seg-561e588153af = Üks tabel esitab UT1 ennustusvea, polaarliikumise pooluse vea ja nende ruutkombinatsiooni Kuul IDENTSEL epohhihulgal horisondi kohta, väljastades epohhid, millel iga komponenti mõõdeti. Eraldi nimetab stsenaarium, milline EOP sisend kehtib, ja lahutab selle reaaruloenduse ning väljastab alati ennustatud-versus-lõpliku horisondi tabeli koos selge väitega, miks see on tühi, kui see on

# text
seg-3692f1fc89e6 = Võrguühenduseta vaike-Maa orientatsiooni sisend on reaalne IERS toode

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = Käitusaja vaikeväärtus <c1/> on teegi enda manustatud koopia sõnasõnalisest IERS finals2000A väljavõttest (tools/finals2000A_20260930.txt: { "174" } järjestikust päevarida, MJD 61224-61397, lõigatud 2026-09-30 finals2000A.all-ist), mis kannab kõiki kolme rea vintage'i, mille vorming määratleb, klassifitseeritud IERS I/P lippudega (eop::row_vintage): { "30" } Bulletin B lõplikku, { "54" } kiiret mõõdetud rida (lipp I ilma Bulletin B plokita) ja { "90" } Bulletin A ennustust (lipp P). Paljas jooks ilma faili argumendi ja võrguta väljastab täidetud horisondikohase tabeli, reaaruloenduse rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) ja predicted_rows.n = { "90" } üle MJD 61308-61397; ennustatud-versus-lõplike võrdluste väljaandmise piir on viimane mõõdetud rida. Varasem 32-realine väljavõte (tools/finals2000A_2026.txt, iga rea lipp I) ja viierealine ainult lõplik väljalõige jäävad tarnitavaks ja kasutatuks: neil on predicted_rows.n väärtus { "0" }, sisendfaili omadus, mitte parseri tulemus

# text
seg-18c72a7565d6 = Haardejalajälg kõrguse ja kiirtekimbu laiuse suhtes

# text
seg-9c30a0ab5233 = Kaheteljeline pühkimine mustriga kaalutud, kõrgusega piiratud pinna haardejalajäljest saatja kõrguse ja antennitaldriku läbimõõdu üle, väljastatud üks rida töökoha kohta koos poolvõimsuse kiirtekimbu laiusega, mille iga läbimõõt eeldab, ning limbi haare raporteeritud LÄVENDINA -- rea kohta limbi J/S, selle varu ja saatevõimsus, mis selle sulgeks; ruudustiku kohta leitud ületused või selge väide, et limbini ei jõuta kusagil ruudustikul, koos puudujäägiga

# text
seg-4d866b62d4f7 = Hulga kaasamine: segaja-signaali suhe siseneb ühtlase detsibellinihkena, seega kõrgema saatevõimsuse haaratud hulk sisaldab madalama oma hulka ja murdosa saab ainult tõusta -- omadus, mida Airy muster EI anna kiirtekimbu laiuses ega kõrguses, kus haaratud piirkond laguneb rõngasteks ja murdosa on tõeliselt mittemonotoonne. Ükski avaldatud tabel ei anna Kuu orbitaalsaatja haaratud ketta murdosa kõrguse ja kiirtekimbu laiuse vastu, seega pole midagi välist, mille vastu neid lahtreid kontrollida; aluseks olev muster on eraldi valideeritud avaldatud Besseli väärtuste vastu ja sellel on oma rida

# text
seg-fc0a64b9a280 = Kuu ajavea eelarve reprodutseeritavus

# text
seg-5d5970506b9c = Lunar-time-budget stsenaarium avaldab oma massiivväärtustega väljundid pika vormi (ruudustiku indeks, keskmistamisaeg, liige) tabelina aruande kõrval, nii et seitse liikmekohast x(tau) kõverat ja ruutsumma kogusumma on mootori väljund, mitte midagi, mida lugeja meetodijaotisest uuesti ehitab

# text
seg-62df6258bc62 = Ainult isekooskõla: avaldatud kogusummat kontrollitakse samas failis olevate liikmete ruutsumma vastu ja väljastatud kõver reprodutseerib avaldatud p3_time_budget_curve.csv kõigis { "57" } punktis. Mõlemad kontrollid jagavad selle mootori enda liikmedefinitsioone, seega ei ole kumbki sõltumatu. Kellaliige toetub avaldatud kella spetsifikatsioonidele, kuid lingi, süsteemi, relativistliku ja efemeriidi põranda SUURUSED on dokumenteeritud eelarvejaotused ilma välise sõltumatu etalonita

# text
seg-675887733454 = Kuu jaama aja laboratoorium: miniRAFS holdover versus LTC

# text
seg-7dfedc40da6a = Lunar-time-budget stsenaariumi valikuline [time_lab] plokk modelleerib Kuu etalonjaama kella (vaikimisi miniRAFS klass või mis tahes nimetatud klass või nimetatud stabiilsuspunktidele sobitatud seadmekaart), mis on juhitud Kuu koordinaatajale ja seejärel vabalt töötav või iga N sekundi järel uuesti juhitud: ajavea kõver x(t) kui kella astmeseaduse liikme, konstantse juhtimisjäägi (ILLUSTRATIVE), konstantse LTC realiseerimisjäägi ja valikulise jaama kõrguse kiiruse liikme ruutsumma; aeg pärast juhtimist väärtuseni { "1" }, { "10" } ja { "100" } ns (või nimetatud läviväärtusteni) poolitamisega domineeriva müratüübi suletud kujuga pöörde kõrval ja domineeriv liige igal nimetatud horisondil, kõik ühikutega

# text
seg-3801e9b32309 = Ainult sisemine kooskõla: poolitatud aega läveni kontrollitakse kella domineeriva müratüübi suletud kujuga pöörde vastu ja vabalt töötava kella liiget eelarve enda kellaliikme vastu. Kellaklassid toetuvad avaldatud ühepäevastele spetsifikatsioonidele (nende endi read); LTC kiirust siin uuesti ei tuletata ja sellel on oma VALIDATED rida („Kuu koordinaataeg“); juhtimisjääk on ILLUSTRATIVE, realiseerimisjääk on eelarvejaotus ja termilist mudelit ei ole kaasatud. Nanosekundi taseme siht, mida kirjeldab ICG WG-B Lunar PNT materjal juunist { "2024" }, on esitatud allikaväitena, mitte omaks võetud väitena; midagi siin ei ole väide ühegi tegeliku jaamakella kohta

# text
seg-af3ff120b707 = Kuu geodeetiline VLBI

# text
seg-cfd7d0126028 = Lähivälja VLBI viivitus Maa baasjoonele, mis vaatleb Kuu majakat + osatuletised

# text
seg-d1943f9932af = Tasalaine delta_dor (sama koodibaas) kaugvälja piiril; lõplike vahede osatuletised. { "0.30" } väline võrdlus, leid (jääb MODELLED): ANISE { "0.10" } koonduvate valguse levi aegade vastu läbi DE440 ({ "75" } viivitust 2024-01-01 kolmel DSN baasjoonel, genereeritud failiga xval/anise-lunar-od ilma Kshana koodita) ei jää ükski viivitus { "1" } ps tolerantsi sisse. Suurim lõhe on { "24" } µs, mis tuleneb analüütilisest Kuu keskpunktist (umbes { "200" } km DE440-st), ühest hetkelisest geomeetriast ilma valguse levi aja iteratsioonita ({ "3.6" } µs) ja välja jäetud polaarliikumisest; majaka osatuletised erinevad kuni { "2.9e-3" } suhtelise võrra { "1e-6" } vastu. Mooduli dokumentatsiooni väide, et süsteemi lähendused on alla mudeli täpsuse, ei kehti sellel tasemel. { "0.30" } voor { "2" }: kernelitee (lunar_vlbi::KernelGeometry) on valideeritud NAIF SPICE valguse levi aegade vastu oma reas „Kuu geodeetiline VLBI, kernelitee“; selle tee ANISE võrdlus (75/75 { "1" } ps piires, halvim { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) on ainult kerneli arvutuse ristkontroll, sest valguse levi aja lahendus selles testkomplektis on selle projekti enda oma. See rida (analüütiline vaiketee) jääb MODELLED ülaltoodud leiuga

# text
seg-d12d4565b01d = Kuu geodeetiline VLBI, kernelitee

# text
# c1: lunar-vlbi
seg-11e1c942e41c = Lähivälja VLBI viivitus Maa baasjoonele, mis vaatleb Kuu majakat, majaka ja jaama osatuletistega, kernelitee peal (lunar_vlbi::KernelGeometry): DE440 Maa ja Kuu, DE440 Kuu peateljed, ITRF93 Maa orientatsioon UT1 ja polaarliikumisega, iga valguse levi aeg koondatud barütsentrilises süsteemis, osatuletised valguse levi aja teguriga 1/(c - u.V). Käivitatav stsenaariumina <c1/> seatud planetary_kernel_path, earth_orientation_kernel_path ja moon_orientation_kernel_path-iga; valideeritud väljundid on kernelitee geometric_delay_s jada ja epoch_partials. Kernelitee peal lisab delay_s analüütilise diferentseeritud Shapiro liikme, mida ei võrrelda, ning delay_rate ja near_field_correction_us ei ole võrreldud

# text
seg-1f10810131be = NAIF kerneli lugeja: DAF konteiner, SPK tüüp { "2" } ja binaarne PCK tüüp { "2" }

# text
seg-7da4847e7a28 = Mootori enda puhas Rusti NAIF binaarkernelite lugeja (naif_kernel): DAF konteiner (mõlemad baidijärjekorrad, lingitud kokkuvõttekirjed), SPK tüübi 2 Tšebõševi asukohasegmendid, mis on aheldatud läbi nende keskuste madalaima ühise esivanemani, ja binaarse PCK tüübi 2 Euleri nurga segmendid, mis on pööratud J2000-kehasüsteemi pöördeks, epohhidega kaheosalise ET-na, nii et alla mikrosekundi nihe säilitab oma täpsuse. Sellest loevad DE440 läbi KernelEphemeris (ephem_provider) ja lunar_vlbi, lunar_llr ning lunar_vlbi_fim kernelitee. Väide on, et see loeb JPL kerneleid õigesti; see ei ole väide, et DE440 või mootori analüütilised Päikese ja Kuu read on täpsed

# text
seg-e08e98908f3a = Maa-GNSS Kuu kaugusel

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Maa-GNSS vastuvõtt Kuu kaugusel: nõrga signaali kiht, mida P7 tabel { "1" } nimetab ja mille jaoks mootoril mudelit ei olnud. Satelliidi ja epohhi kohta arvutab see kõrvalekaldenurga saatja nadiiri suhtes, kas Maa varjab otsetee, kaldkauguse ja selle vaba ruumi kao, saatevõimenduse sellel nurgal, vastuvõetud võimsuse ja kandja-müra tiheduse; seejärel agregeerib see ainult jälgimislävendi ületavad lingid ja pühib läbi täieliku konstellatsiooni tiiru, nii et vastus on JAOTUS, mitte üks hetktõmmis. Tulemuse määravad kolm fakti ja aruanne esitab igaühe: Maa katab konstellatsiooni raadiusest { "13.90" } kraadi, seega on kiirtekimbu TIPP geomeetriliselt kättesaamatu igale Kuule suunduvale kiirele; allesjääv on peasagara serv ja külgsagarad, režiim, milles LuGRE Kuul { "2025" } töötas; ning L1 teekadu on umbes { "208" } dB, umbes { "25" } dB rohkem, kui maapealne kasutaja maksab. MEASURED kaasasoleval 24-satelliidilisel GPS-klassi geomeetrial { "64" } epohhi jooksul ühe orbitaalperioodi vältel: SIGNAALI kättesaadavus { "0.375" } parima lingiga { "30.93" } dB-Hz ja FIKSI kättesaadavus { "0.000" } - kuni kaks samaaegset jälgitavat linki, mitte kunagi neli, mida asukoht vajab. Nende kahe kättesaadavuse eraldamine on mõte ja aruanne keeldub laskmast neid segi ajada: Maa-GNSS Kuu kaugusel on AJASTUSE-klassi kiht, mitte asukoha-klassi, ja kihilise vastupidavuse prioor peab võtma fiksi kättesaadavuse. Konditsioneeritus väljastatakse samal põhjusel - iga nähtav satelliit asub Kuult vaadatuna paari kraadi laiuse koonuse sees, seega on vaatejooned konstruktsiooni poolest peaaegu paralleelsed. Käivitatav liigina <c1/> Sõnastatud ümber D7 järgi: väide Kuu kaugusel on satelliitide SUHTELINE kandja-müra tihedus ühel epohhil mõõdetud kahemõõtmeliste saatemustrite (NAVCEN Block IIR/IIR-M) põhjal pluss geomeetriline nähtavus; absoluutset C/N0 ei väideta (Parker et al. raporteerivad ühist { "7" } kuni { "12" } dB kadu).

# text
seg-29df5b40a3f9 = Kuu orbiidi määramine: Maa-GNSS versus maapealne raadiomeetriline

# text
seg-647902ebcee3 = Orbiidi määramine peaaegu sirges halo-orbiidis (või elliptilises külmutatud orbiidis) kahest sõltumatust andmetüübist: pardal vastuvõetud Maa-GNSS pseudovahemaad (rea Maa-GNSS Kuu kaugusel lingireegel pluss Kuu varjamine) ning maapealne kahesuunaline kaugus ja kauguskiirus kolmelt Deep Space Network jaamalt. Kumbki on ühe sammuga partii vähimruudud etalonorbiidi ümber oma formaalse kovariatsiooniga; algväärtustatud (seed) Monte Carlo nende kahe hinnangu vahest testib, kas kaks kovariatsiooni seletavad seda (q = d' (P_G + P_R)^-1 d, hii-ruut kuue vabadusastmega, kui mudelid sobivad) ja mida modelleerimata kiirendus statistikaga teeb.

# text
seg-226dedaba243 = Sõltumatu scipy/numpy programm integreerib samad variatsioonivõrrandid (lävi O1). Midagi ei võrrelda Kuu orbiidi mõõtmisega. Sõltumatu etalon kontrollib nimetatud valemite numbrilist poolt, mitte füüsikat, seega jääb rida MODELLED. Piiratud kolme keha mudel: Päikest ei ole, Kuu harmoonilisi ei ole, Maa pöörlemistelg piki orbiidi normaali, ILLUSTRATIVE vastuvõtja ja jaama sisendid.

# text
seg-652bdc29deea = Kuu kandelaine faasi täisarvuliste mitmetähenduslikkuste lahendamine: pind ja orbiter

# text
seg-02496f9e9af2 = Vastuvõtjate vaheline üksikvahega Maa-GNSS kandelaine faas ja kood Kuu pinnajaamas ja orbiteril, epohhikohase kellavahe profileerimisega välja, üks mitmetähenduslikkus pideva läbimise kohta ja pikim läbimine mõõdusüsteemina. Ujuv mitmetähenduslikkuse kovariatsioon on Schuri komplement; LAMBDA lahendab täisarvud, bootstrap-määr raporteeritakse algväärtustatud (seed) Monte Carlo täisarvuliste vähimruutude edumäära ning ujuva ja fikseeritud asukoha sigmade kõrval. Raporteeritud leituna: registreeritud { "12" } dBi juures topeltvahe ülesannet ei saa moodustada (muudatus { "1" } viis vaikeväärtuse { "25" } dBi-le pärast seda, kui nähti ainult kättesaadavuse arvusid), ja { "25" } dBi juures täisarvuline fikseerimine EI saavutata - ulatusest väljas (paar protsenti kõige rohkem), kuigi ujuv lahend paraneb kaarega.

# text
seg-8d8296752eb8 = Sõltumatu numpy lahendus samadele normaalvõrranditele eksporditud ridadest (Q3) ja jõumeetodil täisarvude loendus (Q4). Ühtegi GNSS-i ega Kuu kandelaine faasi mõõtmist ei võrrelda. MODELLED.

# text
seg-11dd1bb8e4e1 = Kuu süsteemi ühishinnang: pinnajaamad ja orbiterid

# text
seg-a38c8d95e6c9 = Seitsmeparameetrilise Kuu süsteemi datumi Fisheri informatsioon Maa jaamade laserkaugusmõõtmisest viiele reflektorile ainult ja orbiteri-pinnajaama kaugustega lisatult: informatsioonimaatriks, auaste, Cramer-Rao sigmad, Kuu identifitseeritavuse mooduli degeneratsioonimõõdik ja algväärtustatud (seed) juhuslikud jaamade hulgad. Orbiit loetakse teadaolevaks Kuu telgedes (selle viga kannab orbiteri kauguse sigma).

# text
seg-47d2afc53b3d = Sõltumatu numpy lõplike vahede otsemudel (F2). Midagi ei võrrelda reaalsete Kuu süsteemi lahenditega. Tegur on tingimuslik eeldatud teadaoleval orbiidil ja { "1" } m kauguse sigmal. MODELLED.

# text
seg-862977c4bb01 = Kosmoseside süsteemiside täpsus: ühes kohas paiknevad GNSS, VLBI ja laserkaugusmõõtmine

# text
seg-a9ae8e99f00d = Tehnikatevaheliste nihke, skaala ja pöörde erinevuste Cramer-Rao täpsus GNSS, VLBI ja laserkaugusmõõtmise süsteemide vahel, kui üks kosmoseaparaat kannab kõiki kolme, kosmoseaparaadi asukoht elimineeritud igal epohhil ja üheksa kohaliku sideme häireparameetrit kandmas prioorit, pühitud üle kohaliku sideme täpsuse. Kovariatsioonid ruutjuure teel (normaalvõrrandid kaotavad numbrid, kui tehnikad on peaaegu täiuslikud).

# text
seg-b37ac7294112 = Sõltumatu numpy virnastatud süsteem asukoha tundmatutega, mis on elimineeritud selgesõnaliste Schuri komplementidega (T3). Ühtegi GRASP, Genesise ega muu missiooni andmeid ei võrrelda. MODELLED.

# text
seg-ae627996875e = Kuu Love'i arvu ja libratsiooni tundlikkus

# text
seg-28780d07c4a7 = h2, k2, l2 ja füüsikaliste libratsiooniamplituudide Fisheri informatsioon laserkaugusmõõtmisest (radiaalne ja horisontaalne loodeline nihe, reflektori pööre), orbiteri jälgimisest (astme 2 k2 kiirendus integreeritud piki vaatejoont, trend eemaldatud), pinna gravimeetrist (gravimeetriline tegur { "1" } + h2 - { "1.5" } k2) ja pinnakellast (osakiirus ({ "1" } + k2 - h2) W2/c2, seotud Kuu aja konstantidega). h2 ja l2 nominaalväärtused on lineariseerimispunktid; uuring ütleb, mis on mille suhtes tundlik, mitte seda, mis on arvud.

# text
seg-180d74388339 = Sõltumatu numpy lõplike vahede koostamine (G2) ja suletud kujuga arvutus (G4). Orbiteri pere k2 tundlikkus on ülemise otsa näitaja (orbiidi olek neelab siin ainult konstandi ja trendi). Ühtegi Kuu loodete ega libratsiooni mõõtmist ei võrrelda; k2 on tsiteeritud Lemoine et al. { "2014" } nominaalväärtusena. MODELLED.

# text
seg-da712b740519 = Kuu pinnamajakate DOP täiendus

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Majakatega täiendatud täpsuse halvenemise tegur Kuu pinnakasutajale: nähtavate satelliitide vaatejoone read ja nähtavate pinnamajakate kaugusmõõtmise read ühendatakse üheks disainimaatriksiks ja hinnatakse jagatud DOP tuumaga ning saadud DOP kaardistatakse realiseeritud 1-sigma täpsuseks METRITES majakakohase kasutaja-ekvivalentse kaugusvea kaudu, mis on koostatud kella sünkroniseerimise, mitmeteelevi ja mõõdistuse liikmete ruutsummana. Majaka nähtavus on õhuta Kuu kahe kõrgusega geomeetriline silmapiir, millel ei ole refraktsioonilist laiendust ja mis on seetõttu täpne, mitte ligikaudne. Käivitatav stsenaariumi liigina <c1/>, mis raporteerib ainult satelliidid, satelliidid pluss majakad ja suurema konstellatsiooni kui konkureeriva tee sama geomeetriani. MEASURED kaasasoleval kuldgeomeetrial (kasutaja kohal -80 kraadi, kolm mõõdistatud majakat, kuuesatelliidiline illustratiivne LCNS hetkel t={ "0" }, { "5" } kraadi mask): { "5" } nähtavat satelliiti annavad PDOP { "9.6941" } ja 3-D 1-sigma { "11.222" } m; majakate lisamine, mis tegelikult silmapiiri ületavad, annab PDOP { "4.1160" } ja { "4.765" } m, tegur { "2.355" }; 24-satelliidiline teenus annab selle asemel PDOP { "2.4226" } ja { "2.804" } m, tegur { "4.002" }. Aruanne trükib NÄHTAVA majakate arvu, mitte seadistatud arvu, ja sellel geomeetrial ületab silmapiiri ainult ÜKS kolmest majakast: kaks külgmist asukohta asuvad kasutajast umbes { "333" } km kaugusel { "86" } km silmapiiri vastu { "2" } m antenni jaoks, seega ei pea lugeja kunagi eeldama, et kõik kolm panustasid

# text
seg-b0b618abf402 = Ühisrežiimi terviklikkuse pimedus

# text
seg-e732ac99a9ae = Mõõtmisvea täpne pariteediruumi jaotus osaks, mida RAIM ei näe, ja osaks, mida see näeb. Lineariseeritud hetktõmmise mudelis y = G·x + e laguneb iga viga dy üheselt PIMEDAKS komponendiks range(G)-s — neelatud olekuveana S·dy ja hävitatud jääkprojektoriga Pperp = I − G·S, seega nähtamatu MIS TAHES jääktestile, mitte ainult konkreetsele lävele — ja TUVASTATAVAKS komponendiks pariteediruumis. Moodul tagastab projektori, jaotuse ja pimeda murdosa, nii et kutsuja saab kvantifitseerida, kui palju konkreetsest veast hetktõmmise monitor struktuurselt raporteerida ei suuda. Rakendatud reaalsele efemeriididevahelisele põrandale: meetritasemel DE440-versus-INPOP21a ja DE440-versus-EPM2021 lahknevus geotsentrilises Kuu asukohas neelatakse peaaegu täielikult kasutaja asukohaveana (pimeda murdosa mediaan { "1.000000" }; pimeda asukohavea mediaan { "2.3955" } m ja { "2.0050" } m) pariteedijäägi vastu { "1e-15" } m tasemel

# text
seg-845e9f5eec81 = Ühisrežiimi kaitsetase ja kogu terviklikkuse ümbris

# text
seg-2246ffa73869 = cmpl_horizontal piirab k-sigma horisontaalset asukohaviga, mida annab pime ühisrežiimi klass, moodustades blind_position_covariance = S*Cov*S^T ja projitseerides selle ENU-sse; integrity_envelope raporteerib hpl_total = hpl_araim + cmpl. Eristus, mida paar eksisteerib tegema: RAIM/ARAIM JÄÄGI test on tõestatult pime range(G) vigade suhtes, kuid ARAIM KAITSETASE ei ole -- selle tõrkevaba liige piirab neid juba kuni pakkuja URA pluss nominaalse nihkeni. CMPL on seega ainult pakkujatevaheline ÜLEJÄÄK, mida ühe pakkuja pakkujakohane URA/ISM ei ülepiira, ja summa on konservatiivne kolmnurgavõrratuse piir, mitte RSS, kehtiv ainult seal, kus see ülejääk ei ole juba URA sees.

# text
seg-ffc59a7ed497 = Analüütiline projektori algebra, mida kontrollitakse iseenda vastu: range(G)-ga piiratud kovariatsioon peab andma positiivse CMPL-i, pariteediruumiga piiratud kovariatsioon peab andma ligikaudu nulli ja ümbris peab summeerima kaks mõõteruumi suhtes ortogonaalset panust. Ühisrežiimi kovariatsioon, konstellatsiooni geomeetria ja k on esinduslikud modelleeritud sisendid, MITTE sertifitseeritud eelarve, ja ei väideta, et kolmnurgapiir oleks tihe. MÄRKUS PÄRITOLU KOHTA: cmpl_horizontal, blind_position_covariance ja integrity_envelope on avalikud ja tarnitud ning nende ühikutestidele viitas juba ühisrežiimi pimeduse rida, kuid ÜMBRISE VÄITEL ise rida ei olnud -- seega ühtegi hoiatust, mis seda ausana hoiab, nimelt et summa on kolmnurgapiir ja mitte RSS, ei olnud registris kusagil öeldud. Rida registreerib väite ja hoiatuse koos.

# text
seg-5ed34a5b402e = Kuu ühine mitmetehnikaline OD + kell

# text
seg-5ace1caff5a9 = VLBI + Kuu-kohaliku kauguse + satelliitidevahelise kauguse partii liitmine jaamade+konstellatsiooni asukohtade ja kellade taastamiseks

# text
seg-69fbe488dec5 = Fisheri informatsioon ja Cramér–Rao jälgitavus

# text
seg-043d4c7a2d6a = Fisheri informatsioon M=HᵀWH, Cramér–Rao alampiir, jälgitavuse aste / datumidefekti nullruum (Moore–Penrose'i pseudöördmaatriks) ning D/A/E/T-optimaalsed katseplaneerimise skalaarid, mis saadakse sümmeetrilisest Jacobi omaväärtuste lahendajast

# text
seg-4035d9a23e64 = NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, LAPACK-põhine) — sõltumatu kolmanda osapoole autoriteet, mis arvutab samad üheselt määratud omaväärtused, σ²(XᵀX)⁻¹ Cramér–Rao kovariatsiooni ja GNSS-i täpsuse halvenemise tegurid teistsuguse algoritmiga (LAPACK-i jaga-ja-valitse ning LU) kui Kshana tsükliline Jacobi pühkimine ja spektraalne pseudöördmaatriks; kooskõla tasemel { "1e-9" }. Sama välise teegi klass valideerib juba DOP-mootori (võrreldes gnss_lib_py-ga) ning χ²/erf-tuumad (võrreldes SciPy-ga). Lisaks on kontrollitud Kay ({ "1993" }) suletud kujul CRLB-de ja Monte Carlo CRLB saavutamise vastu (sisemine)

# text
seg-e4ec41d0f5e1 = Kuu absoluutse jaama jälgitavus (datumidefekt)

# text
seg-b3e4160042d2 = Ühise Kuu lahendi Fisheri informatsiooni jälgitavus: ilma Maa baasjoonteta asub absoluutse tugisüsteemi datum HᵀWH nullruumis (jaama asukoht ei ole jälgitav); ≥{ "3" } baasjoont taastavad täisastme ja piiravad jaama Cramér–Rao viga, mille hinnang saavutab

# text
seg-ae4b71d54dfa = 7-parameetriline Helmerti datumisobitus + ICRF-i orientatsiooniside punktide võrgust

# text
seg-9e434924b34c = Sõltumatu suletud kujul kaalutud Umeyama (Horn) sarnasusteisenduse lahendaja (numpy/scipy, SVD-põhine; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — kshana iteratiivsest Gauss–Newtoni sobitusest erinev algoritm, mis jõuab baidi-identsetel punktivõrkudel sama üheselt määratud kaalutud vähimruutude optimumini

# text
seg-4bcec6e2dd9f = Kuu navigatsiooniteenuse ruumala

# text
seg-dba98ad5df1c = Moonlight-klassi Kuu DOP / kate / kättesaadavus + üldistatud Kuu ARAIM-i kaitsetasemed teenuseruumala ulatuses

# text
seg-7e981d90a806 = Sõltumatu kolmanda osapoole autoriteet ANISE { "0.10.2" } astro::Orbit Kepleri propageerija (Nyx Space, MPL-2.0) — ekvinoktsiaalne kahe keha koodirada, mis erineb kshana Newton-Raphsoni Kepleri lahendajast; satelliidi MCI asukoht langeb kokku täpsusega <{ "1e-3" } m ja tuletatud nähtavate satelliitide arv/hulk ühtib täpselt igas ruudustiku punktis. DOP-tuum on gnss_lib_py-ga valideeritud; terviklikkus kasutab avaldatud LunaNet/LCNS-i parameetreid

# text
seg-2ed7181c97dd = LunaNet AFS hajutuskoodide genereerimine (LSIS V1.0)

# text
seg-13ff6c381275 = LSIS V1.0 Augmented Forward Signal koodid ({ "29" }. jaanuar { "2025" }): AFS-Q 10230-kiibine põhikood, mis on genereeritud IS-GPS-800 L1C piloodi konstruktsiooni ja IS-GPS-800J indeksitega (samad { "210" } määrangut, mille LSIS lisa D esitab), AFS-I 2046-kiibilised Goldi koodid, mis on genereeritud valemitest g1 = x^{ "11" } + x^{ "2" } + { "1" } ja g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, iga PRN-i G2 viide on taastatud standardi lisa { "3" } failist, neli sekundaarkoodi, 1500-kiibilised tertsiaarkoodid, ajutine tabeli { "11" } sõlmemäärang ja tasemeline piloodikood. LSIS-i sisu loetakse käitusajal SHA-256-ga kontrollitud kohalikust vahemälust, mis täidetakse NASA hostitud PDF-ist, ning seda ei levitata edasi

# text
seg-dc1dd144b107 = Etalon: väärtused, mida LSIS V1.0 valideerimiseks esitab (tabelid C-1 kuni C-5, D-1 kuni D-6, E-1 kuni E-6), ja selle lisa { "3" } elektroonilised koodifailid, nullide mittevastavuse kriteeriumi alusel, mis on fikseeritud enne võrdlust. Kriteerium jääb täitmata ühe trükitud lahtri tõttu, mis on vastuolus standardi enda lisa { "3" } failiga, seega jääb rida MODELLED; veamärkuse mustand on koostatud. Samad kiibid on võrdsed ka LANS-AFS-SIM-i omadega (rida „LunaNet AFS baasriba renderdamine sõltumatu generaatori vastu, arvestades selle kanali olekut“)

# text
seg-ea20909686ea = LunaNet AFS baasriba renderdamine sõltumatu generaatori vastu, arvestades selle kanali olekut (LSIS V1.0)

# text
seg-c0f021c38842 = AFS baasriba renderdamistuum (LSIS-130: kompleksne mähis I + jQ, I = AFS-I Goldi kood korrutatud { "500" } sümboli/s kaadriga sagedusel { "1.023" } Mchip/s, Q = tasemeline AFS-Q piloot sagedusel { "5.115" } Mchip/s, kandja pööre, kiibi ja sümboli joondus) reprodutseerib sõltumatu generaatori proove, kui seda juhitakse selle generaatori enda salvestatud kanali olekuga (koodifaasid ja -kiirused, kandja faas ja sagedus, kanalipõhine amplituud). Katmata: sõlmemudel, mis tuletab selle oleku Doppleri, viite ja kandja-müra tiheduse põhjal, kandja-müra tiheduse põhjal arvutatud 50/50 võimsusjaotus (amplituudid võetakse simulaatorist) ning SigMF-i metaandmete ja 8-bitiste proovide kirjutamine

# text
seg-dd1142957a05 = Teek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-riba ehitus, käivitatud eraldi programmina); Kshana proove juhib ainult simulaatori salvestatud kanali olek ning ainult trükkiv jälgimisehitus on kontrollitud baidi-identseks muutmata ehitusega. Enne käivitust fikseeritud läved: null kiibi- ja sümbolivigu, |rho| >= { "0.999" } kogu käigu ulatuses ja >= { "0.99" } { "2" } ms ploki kohta, faas { "0.05" } rad piires. Võrdsed I ja Q amplituudid on võrdluse sisend, seega võimsusjaotust sellega ei testita. LANS-AFS-SIM loeb oma tertsiaarkoodid LSIS lisa { "3" } failist, seega see osa ei ole koodireast sõltumatu. LANS-AFS-SIM ja PocketSDR-AFS jagavad autorit ning loetakse üheks sõltumatuks teostuseks. Andmetest sõltuv: LANS-AFS-SIM-i võrdlus vajab kohalikku LSIS V1.0 vahemälu (xval/lunar-afs/fetch_lsis.sh, SHA-256-ga kontrollitud) ja jäetakse selle puudumisel teatega vahele

# text
seg-5d79da539912 = LunaNet AFS kaadri kanalikodeerimine, FID { "0" } (LSIS V1.0)

# text
seg-6ed2b4c792e6 = LSIS V1.0 { "12" } s, 6000-sümbolilise FID { "0" } kaader: 68-sümbolilise sünkroniseerimismustriga, BCH ({ "51" }, { "8" }) alamkaader { "1" } (kaheksandsüsteemi 763 generaator), CRC-24 (({ "1" } + X)·P(X)) alamkaadritel 2-4, kiirusega 1/2 LDPC-kodeerimine trükitud maatriksitega A, B^-1, C, D (LSIS lisa { "1" }, loetud käitusajal SHA-256-ga kontrollitud kohalikust vahemälust) ja standardi punkteerimine, { "60" } x { "98" } ploki põimur; ammendav alamkaadri 1 dekooder, mis märgib TOI väljaspool { "0" }..99, ning normaliseeritud min-sum LDPC-dekooder, mis on kirjutatud ainult H = [[A, B, { "0" }], [C, D, I]] põhjal

# text
seg-46879e2e8ab5 = Teek: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), mille enda BCH, CRC, LDPC ja põimur annavad sama sisu korral Kshana omadega sümbol-sümbolilt identsed kaadrid (null mittevastavust, lävi fikseeritud enne käivitust). Kinnitavad etalonväärtused: LSIS V1.0 joonise { "8" } BCH läbitöötatud näide ja CRC-24/LTE-A kontrollväärtus (Greg Cooki parametriseeritud CRC-algoritmide kataloog), mõlemad bitt-täpsed; ning PocketSDR-AFS, mis dekodeeris kolmes käigus kõik sünkroniseeritud kaadrite alamkaadrid läbiva CRC-ga ja kokkulangevate alamkaadri 2 bittidega. Pariteedikontrolli test on sisemisele samasusele lähedane (see kinnitab, et trükitud B^-1 pöörab trükitud B) ning seda ei loeta sõltumatuks etaloniks (sõltumatuks etaloniks). Andmetest sõltuv: LANS-AFS-SIM-i võrdlus vajab kohalikku LSIS V1.0 vahemälu (xval/lunar-afs/fetch_lsis.sh, SHA-256-ga kontrollitud) ja jäetakse selle puudumisel teatega vahele

# text
seg-56c7aeac59c1 = LunaNet AFS suletud ahelaga dekodeeritavus sõltumatu vastuvõtja poolt (LSIS V1.0)

# text
seg-da2d29d437b0 = Kshana AFS-salvestis, mille sõltumatu tarkvaravastuvõtja püüdis kinni, jälgis ja dekodeeris ning mida võrreldi salvestise enda tõeväärtuste siltidega. See tõendab ainult standardi järgimist ja siltide kooskõla; see ei ole väide kanali füüsika, leviku, vastuvõetava võimsuse ega lingibilansi kohta, mille väärtused salvestises on valitud sisendid

# text
seg-8211583afc64 = Teek: PocketSDR-AFS (T. Ebinuma T. Takasu PocketSDR { "0.13" } järgi, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-riba ehitus, ainult trükkiva logitasemega koopia), enne iga käivitust fikseeritud kriteeriumide alusel. Kolmas eelregistreeritud võrdlus täidab oma dekodeerimise ja jälgimise läved C1 ja C2 täielikult, kuid mitte oma valvet G0 nii nagu see on kirjutatud (muutmata vastuvõtja kaks käiku erinevad samades neljas püüdmiskirjes), ja teine jäi { "5" } rikkumisega alla, seega jääb rida MODELLED. LANS-AFS-SIM ja PocketSDR-AFS jagavad autorit ning loetakse üheks sõltumatuks teostuseks; kaadrikodeerimise rea trükitud vektorite kontrollid kaitsevad ühise valesti lugemise eest

# text
seg-780369fb9a54 = GPS L1 C/A generaatoritevaheline standardi järgimine

# text
seg-ee47b60515f1 = GPS L1 C/A hajutuskoodid (sdr::CaCode) ja LNAV alamkaadrid 1-3 (gps_lnav: IS-GPS-200 väljade kvantimine standardi pii väärtusega, kahe täiendkoodiga pakkimine, TLM- ja HOW-sõnad, tabeli 20-XIV pariteet D29*/D30* inversiooniga, sõnade { "2" } ja { "10" } pariteeti lahendavad bitid) võrreldud bitt-bitilt gps-sdr-simiga selle kaasasoleval failil brdc0010.22n ({ "32" } satelliiti)

# text
seg-325900ed59ea = GNSS IQ stseeni signaali geomeetria sõltumatu baasriba generaatori vastu

# text
seg-ee5625b30ff2 = IQ stseenigeneraatori satelliidipõhine tõeväärtus GPS L1 C/A edastatud efemeriidi stseeni jaoks (iq::scene: edastatud efemeriidi SatGeometry, genereeritud TruthRecord tõeväärtuskirjeteks): millised satelliidid on horisondi kohal, pseudovahemaa, koodifaas esimesel proovil, kandja Doppler ja nähtavusnurgad paigalseisva vastuvõtja jaoks, võrreldes kanali olekuga, millest gps-sdr-sim ehitab oma I/Q-väljundi esimese ploki sama efemeriidi, vastuvõtja ja algusaja korral (ionosfäär mõlemal poolel välja lülitatud)

# text
seg-bf429c8f00fb = GNSS IQ püüdmine sõltumatult genereeritud I/Q proovidel

# text
seg-9a0c52bfb06e = iq::acq::acquire (FFT-paralleelne koodifaasi otsing ruutseadusliku Marcum-Q lävega) GpsL1Ca koopiaga, gps-sdr-simi enda 8-bitise I/Q väljundi { "20" } ms-l, dekodeeritud iq::io proovidekooderiga (ci8, { "2.6" } MHz, { "11" } satelliiti, müra puudub): iga PRN { "1" } kuni { "32" } otsitud kahes { "10" } ms aknas, tulemust võrreldud koodifaasi ja Dopplerga, mida gps-sdr-sim modulleeris

# text
seg-f40dc3dac990 = Laborikordusmängu kampaaniates hinnatud IQ monitorid: tuvastamine, mööda jäämised, valehäired ja suletud kujul valehäirete näitajad

# text
seg-93fb3109728c = iq::campaign::detect ja kampaaniajooksutaja: valikuline [monitors] tabel käivitab IQ monitorid igas lahtris jooksutaja ühel läbimisel. Võimsuse ja spektri monitorid näevad proove pärast iga esiotsa ahelat; C/N0, SQM ja lukustuse monitorid näevad iga jälgitava kanali ahela uuendusi. Iga alarmi hinnatakse nimetatud sündmuste suhtes: tuvastatud või tuvastamata (sündmus, alarmi liik, kanal) kohta, tuvastamise aeg ja valehäired väljaspool sündmusi nende kokkupuute kohta. Iga testi suletud kujul valehäirenäitaja on esitatud: võimsus ploki kohta (täpne Gamma saba), spektri ülejääk ploki kohta (lähend), kurtoos (ühepoolne Gaussi), impulsid (binoom-ülempiir), SQM keskmistatud uuenduse kohta (2Q(k) = Q(1/2, k^2/2), uus) ja C/N0 CUSUM-i ARL0 (Siegmund). Ilma tabelita jäävad lahtrid, võtmed ja räsid muutmata. Ühtegi häirelainekuju ei sünteesita

# text
seg-5b7eb7ddb474 = IQ monitoride tuvastus-ROC hinnatud laborikordusmängu kampaaniast

# text
seg-57fe85965c9c = iq::campaign::detect (windows, roc) ja iq::campaign::report::rocs: monitoritega kampaania iga lahter hoiab alarmi liigi ja kanali kohta monitori enda testistatistiku maksimumi iga nimetatud sündmuseakna kohta (positiivne) ja väljaspool sündmusi paigutatud roc_window_s akende kohta (negatiivne). Statistikud on ploki võimsuse kõrvalekalle, PSD ülejääk, kurtoosi z, keskmistatud mõõdiku SQM |z| ja C/N0 CUSUM. Aruanne koondab need liigi kaupa empiiriliseks aknatasemel ROC-iks koos selle AUC-ga ja töökohaga seadistatud lävel, kirjutatuna kujul roc.json (kshana.campaign-roc/1) ja report.html jaotisena Detection ROC. Monitorideta kampaania ei kirjuta kumbagi

# text
seg-3a3cfa322f01 = Avatud vastuvõtja C/N0 ja lukustuse mudelite kalibreerimine IQ kampaania tulemustele koos esitatud ennustusveaga

# text
# c1: [input] campaign
# c2: kshana iq labfit
# c3: kshana.iq_labfit
# c4: kshana iq campaign
seg-9affed6218d6 = iq::labfit (campaign, cn0, iqfit, iqreport) ja <c1/> käsul <c2/>, Python <c3/> ning MCP labfit tööriist (kampaaniakaustad ainult selle töökataloogi sees): loeb <c4/> väljundkausta selle DIGEST järgi ja rühmitab hinnatud lahtrid sobitusüksusteks (signaal x ahela kavand x esiotsa ahel x segaja tüüp, mitte kunagi koondatud). Üksuse kohta sobitab see mõõdetud C/N0 esitatud J/S vastu spektraalse eralduse kujuga. Q_eff ei ole C/N0 andmetest tuvastatav ilma segaja ja signaali võimsuste sõltumatu mõõtmiseta, seega Q on esitatud, mitte kunagi sobitatud (tüübitabel, sündmuse q või tundmatu tüübi korral kõige kahjulikum esitatud väärtus, cw Q = { "1" }). Sobitatud parameeter on tuvastatav nihe delta_eff = delta - { "10" } log10 Q, kusjuures korrelatsioonivalve teatab lagunemisest. C/N0 klassid, mis on lukustatud alla { "90" } %, tsenseeritakse ja loetletakse. Lävi J/S antakse otse ja suletud kujul; jälgimisahela ja empiiriline lukustusmudel on seotud C/N0 mudeli kaudu, koos languse ja uuesti lukustumise viibimisaegadega. Algväärtusega (seed) klastri alglaadimine salvestiste üle ({ "1000" } kordust) annab protsentiilintervallid; { "90" } % ennustusintervallid tulevad jääkide tõmmetest; ühe salvestise välja jätvad hold-outid jagatakse interpolatsiooniks ja ekstrapolatsiooniks; eelregistreeritud [validation] tabel räsitakse ja iga lävi hinnatakse PASS/FAIL. Aruanne kshana.labfit-iq/1 JSON-i, CSV ja genereeritud Markdowni kujul, koos units-ploki. Ainult sünteetiline (kolmanda osapoole salvestist ega segaja lainekuju pole). Vastuvõtja logi labfit-rada on muutmata

# text
seg-9537d301c95e = GPS LNAV kodeering dekodeeritud sõltumatu vastuvõtja teegiga

# text
seg-909415621881 = Kshana LNAV alamkaadrid 1-3 (gps_lnav::encode_subframes) { "32" } brdc0010.22n efemeriidi jaoks, söödetud RTKLIB-i decode_word ja decode_frame'ile: iga sõna pariteet, alamkaadri dekodeerimine kooskõlalise andmeväljaande (issue of data) korral ning iga dekodeeritud parameeter Kshana täisarvu ja sisendväärtuse suhtes

# text
seg-f66855e35c53 = GPS LNAV navigatsioonisõnumi kodeerimine

# text
seg-8caf8366e2f8 = IS-GPS-200 LNAV alamkaadrid 1-3 (gps_lnav::encode_subframes: iga kella- ja orbiidiparameetri lähima suunas ümardav kvantimine standardi skaalategurite ja pii väärtusega, kahe täiendkoodiga pakkimine, TLM- ja HOW-sõnad, tabeli 20-XIV pariteet D29*/D30* inversiooniga, sõnade { "2" } ja { "10" } pariteeti lahendavad bitid), sõnum, mida GPS L1 C/A signaaligeneraator edastab

# text
seg-c5c944357643 = Püüdmine ja C/N0 hindamine päris Kuu IQ-l

# text
seg-f5dcb5e06bf4 = Paralleelne koodifaasi otsing (acquisition::pcps_acquire: teisaldatav FFT, koherentne voltimine, mittekoherentne akumuleerimine, hii-ruut lävi otsinguülese valehäire tõenäosuse jaoks), täpsustamine, avatud ahelaga kiire korrelatsioon koodi Dopplerga ja M2M4 C/N0 hindaja, käivitatud LuGRE L1 4-bitistel IQ partiidel, mida loetakse läbi realdata::ion_sdr

# text
seg-709626569a5c = Püüdmine päris Kuu IQ-l orbiidi järgi ennustatud Doppleri vastu (proovivõimsuse otsus)

# text
seg-784ebd80c425 = acquisition::pcps_acquire oma proovivõimsuse otsusega üheksal mittepinnalisel LuGRE L1 partiil keskkõrgete tasemetega (mid-rise); püütud satelliitide Doppleri erinevusi võrreldud erinevustega, mis on ennustatud ESA lõplikest orbiitidest ja Fireflyga rekonstrueeritud Blue Ghosti trajektoorist

# text
seg-89875d67b253 = Püüdmine päris Kuu IQ-l, hinnatud orbiidi järgi ennustatud Doppleriga

# text
seg-956bcfeaf319 = acquisition::pcps_acquire lahtrite keskmistamise otsusega (tipp üle ruudustiku keskmise lahtri, ribapiiratud mürale vastupidav) üheksal mittepinnalisel LuGRE L1 partiil keskkõrgete tasemetega (mid-rise); püütud satelliitide Doppleri erinevusi võrreldud erinevustega, mis on ennustatud ESA lõplikest orbiitidest ja Fireflyga rekonstrueeritud Blue Ghosti trajektoorist

# text
seg-8fa779dd1788 = Püüdmine väljajäetud päris Kuu IQ-l orbiidi järgi ennustatud Doppleri vastu

# text
seg-484868771231 = acquisition::pcps_acquire (lahtrite keskmistamise otsus, valehäire tõenäosus { "1e-7" }) koos refine_doppler_coherent'iga Kuu pinnal salvestatud LuGRE L1 partiidel (I kõrges nibble'is, keskkõrged tasemed); püütud satelliitide Doppleri erinevused vastu erinevusi, mis on ennustatud ESA lõplikest orbiitidest ja Fireflyga maandumiskoha kernelist

# text
seg-758af035b3ce = Kuu ühine side- ja navigatsioonigeomeetria

# text
seg-11f861bdc6bf = Satelliidipõhised topotsentrilised nähtavusnurgad (asimuut kellaosuti suunas põhjast, kõrgus) ja kaldkaugus nimetatud selenograafilises asukohas, arvestades satelliiti selle asukoha Kuu kehaga seotud tugisüsteemis (valideeritud väide). Signaali ruumis levimise kaugusmõõtmise täpsus on avatud stsenaariumi parameetrina, nii et teenuseruumala pühkimine annab kaugusmõõtmise NÕUDE, mitte läbimise/mitteläbimise ühe fikseeritud sigma juures; see parameeter on kavandi sisend väljaspool valideeritud väidet

# text
seg-eb721568afc7 = ANISE { "0.10.2" } (Nyx Space, MPL-2.0, käivitatud tööriistana kaustast xval/anise-service-geometry, binaarfail lunar-look-angles-xval, mis ei kutsu Kshana koodi): ANISE-i enda asimuudi, kõrguse ja kauguse rutiin (azimuth_elevation_range_sez) asukohtadest, mis on ehitatud selle laiuskraadi-pikkuskraadi-kõrguse konstruktoriga pck00011 Kuul (kera { "1737.4" } km), satelliidid pööratud MOON_PA_DE440 süsteemi failiga moon_pa_de440_200625.bpc. { "768" } proovi { "8" } asukohas ({ "4" } nimetatud asukohta ja { "4" } muud, horisondi kohal ja all), { "12" } epohhi ja { "8" } satelliiti ühtivad asimuudis ja kõrguses täpsusega { "1e-6" } kraadi ning kaugus ja asukoha asend { "1" } mm piires (fikseeritud enne võrdlust); mõõdetud { "2.2e-12" } kraadi, { "2.1e-13" } kraadi ja { "5.6e-9" } m. Väide: asukoha paigutus ja nähtavusnurgad, arvestades satelliiti asukoha kehaga seotud tugisüsteemis. Kshana enda keskmise pöörde Kuuga seotud tugisüsteemi realisatsioon ja kaugusmõõtmise täpsuse parameeter jäävad sellest välja; suletud kujul geomeetria üksuskatsed jäävad toetavate kontrollidena

# text
seg-10af60b488b9 = NovaMoon-klassi diferentsiaalne etalonjaam: ühisrežiimi tühistamine + baasjoonega kasvav jääk + DGNSS-i kaitsetasemed

# text
seg-96b2627b388a = Diferentsiaalse veatühistuse samasus + DO-229E SBAS-i kaitsetaseme masinavärgi taaskasutus; üksikdiferents + WLS-lahend on lisaks ristkontrollitud RTKLIB-i lsq()/matinv() vastu (Takasu, BSD-2-Clause, kompileeritud C) — sõltumatu lahendaja kood, kuid sama esimest järku LOS-diferentsi algebra, seega ikkagi InternalConsistency

# text
seg-c04a3591074c = Kuu koostalitlusvõime eksport

# text
seg-91f4a066b3c0 = LunaNet/IOAG-ga ühtlustatud Kuu tugisüsteemi, aja ja efemeriidi eksport (CCSDS OEM + KIF) edasi-tagasi teisendusega standardi järgimise kontrolliks

# text
# c1: oem
seg-f5f8ed69bea7 = kshana Kuu OEM eksport, mis on uuesti parsitud sõltumatu kolmanda osapoole <c1/> teegiga (R. J. Anderson): tugisüsteemi/aja märgid ja epohhipõhine olek ühtivad kirjutustäpsuseni ({ "1" } mm / { "1e-9" } km/s) ja eksport ilma TIME_SYSTEM-ita lükatakse tagasi — struktuurne vahetuse edasi-tagasi teisendus; Kuu tugisüsteemi/aja füüsikalist semantikat valideerivad nende endi read, seega jääb see MODELLED. { "0.30" } väline võrdlus, leid (jääb MODELLED): teine sõltumatu lugeja, Orekit { "12.2" } CCSDS OEM parser (Apache-2.0, ranged vaikeseaded), keeldub mõlemast Kuu failist, sest see ei realiseeri ajasüsteeme LTC ja TCL (see dekodeerib kasti EME2000/UTC OEM-i ning dekodeerib Kuu failid, kui TIME_SYSTEM asendatakse väärtusega TDB); oem { "0.4.5" } dekodeerib need kirjutustäpsuse piires ainult toetamata ajasüsteemist tagasilangemisega. Nende Kuu failide vahetust peavoolu CCSDS lugejatega ei ole tõestatud

# text
seg-8ab65cbefb75 = PNT vastupidavuse raamistikuga ühtlustatud punktiarvestus

# text
seg-c48198f31d63 = Mõõtmepõhised alamhinded Kshana enda seitsme vastupidavuskategooria (mitte DHS-i terminite), RethinkPNT RDRR funktsioonide ja Yangi kriteeriumide üle, igaüks märgistatud sõnaga modelleeritud koos selle ajajaga; esialgne RPCF-i tase piiratud languse väravaga. Simulatsioonist tuletatud enesehinnang, mitte kunagi sertifitseerimine.

# text
seg-f905aeb203bb = Käsitsi tuletatud mõõdikupõhised valemid: pöörd-Simpsoni mitmekesisus, kaalutud keskmine komposiit, piiratud/piiramata ajajoone kestused, nõrgima lüli taseme redel

# text
seg-d7bdb6fe186e = Vastupidavuspunktisumma otsuse ebastabiilsuse uuring

# text
seg-5fcf18a68bb1 = Kvantifitseerib, kuidas üksik komposiitpunktisumma / RPCF-i tase järjestab arhitektuure ümber kaitstava kaalusimpleksi ja ohuansambli all (top-1 pöördemäär, Kendalli tau hajuvus, tasemepöörde määr, järgusuhtade vahemikud); deklareeritud-vs-mõõdetud ja mitmekesisuse kokkuvarisemise analüüsid.

# text
seg-b6bf76a752a0 = Suletud kujul järgustatistikute samasused (tau vahemikus [-1,{ "1" }] käsitsi arvutatud väärtustega; deterministlik algväärtusega (seed) Dirichlet) ja konstrueeritud stabiilsed/ebastabiilsed tunnistajad

# text
seg-1bf03544a010 = Demonstratsiooni representatiivsus ja lennuni jäänud lüngad

# text
seg-db24d16d38c9 = Tulemuspõhine ausa esituse register, mis kvalifitseerib demonstratsiooni väljundi: selle välised ankrud, modelleeritud eeldused, lennuni jäänud lüngad ja representatiivne TRL-i vahemik, kehtestatud invariantidega (valideeritud nõuab välist ankrut; modelleeritud nõuab lünka ega saa väita TRL-i { "4" } kõrgemat taset).

# text
seg-81d3adb239c5 = Suletud kujul invariandid, mis vastavad distsipliinile „representatiivsus põhjendatud + lennuni jäänud lüngad tuvastatud“ (compliance); seotud kontrollistaatuse ja sõltumatu etaloni liigi piiriga

# text
seg-52ab936eb5f5 = Kvant- ja klassikalise lahenduse kompromissi tõendid (ühine kuju)

# text
seg-a6679ed5bed7 = Üks reprodutseeritav TradeEvidence objekt (fikseeritud raam: stsenaarium+algväärtus (seed)+mootor; ühised FoM-põhised kvant- ja klassikalise väärtused polaarsuse suhtes õige kasuga, valikuline { "95" }% CI, valideeritud/modelleeritud silt), mis kannab representatiivsuse kirjet, nii et iga kvant-PNT vertikaal esitab kompromissi samal ausal viisil.

# text
seg-70da3e15ea8b = Suletud kujul kasu/võitja samasused + olemasoleva quantum_trade::TradeResult'i truu ümbris; aususe seos representatiivsuse registri ja kontrollisiltidega

# text
seg-20fee61b3107 = Kvantseadmete veamudelite teek

# text
seg-e42eabe9bc2a = Seadmekaardid (optiline/lõksustatud ioon/elavhõbeioon + klassikalised kellad, mis on taaskasutatud failidest holdover/clock_state; külmaatom-interferomeeter; klassikalised + põimumisel/üksikfotonil põhinevad aja edastamise lingid), igaüks kannab representatiivsuse kirjet; põimumislink lisab laskude poolt piiratud ajastuse korduvtäpsuse mudeli (~jitter/sqrt(R*tau), tumeloenduse karistus, süstemaatiline põhi).

# text
seg-632600203e1f = Taaskasutatud kella/CAI koefitsiendid (holdover/clock_state, avaldatud väärtused) + suletud kujul lasumüra/kao samasused põimumislingi jaoks

# text
seg-86d71fd89f26 = Usaldatav kvantajastus (aja edastamine + turvaline levitamine + anomaaliad)

# text
seg-d2a3d37825ef = Otsast lõpuni kvant- ja klassikalise aja edastamise ahel (kella rannasõit + lingi korduvtäpsus ruutsummeeritult), taaskasutatud ajastuse kaitsetase, viite/kordusründe turvalisuse FoM (1-P_md) ning kella anomaalia tuvastamise tõenäosus + CUSUM-i latentsus, väljastatud ausa TradeEvidence'ina koos representatiivsuse kirjega.

# text
seg-ac95d112a17a = Suletud kujul ruutsumma eelarve taaskasutatud valideeritud tuumade üle (ADEV vs Stable32/NIST; TPL-i piir; tuvastamine analytic_pd/pmd); aususe seos representatiivsuse registriga

# text
seg-eaf341ff4522 = GNSS-ita kvantnavigatsioon

# text
seg-908a44a9f7c7 = Kvant- (külmaatom-interferomeeter) vs klassikaline navigatsioonitaseme INS-i järjestikarvutus GNSS-i katkestuse ajal: asukohavea kasv, holdover asukoha lävendini ja kvant- vs klassikaline kompromiss ausa TradeEvidence'ina; aus jälgitavuse märkus (nihe ei ole ilma fikseeringuta jälgitav, seega viga kasvab).

# text
seg-508f2c8884e2 = Taaskasutatud inertsiaaleelarved, mida on ristkontrollitud sõltumatu Octave'i topeltintegreerimisega sama järjestikarvutuse ODE-st (erinev käitusaeg, ühine mudel → ReferenceImpl) pluss Freier-2016 avaldatud lühiajaline müra ühepoolse ankruna; kvant- vs klassikaline komposiit jääb MODELLED

# text
seg-914132833f5a = Kvant-PNT süsteemide rikete/anomaaliate tuvastamine

# text
seg-f20392820b9d = Märgistatud kvantrikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; sensori nihkeaste/väljalange), tuvastusstatistiku ROC AUC alglaadimise CI-ga ja minimaalne tuvastatav rike fikseeritud valehäire määra juures; kvantkellaga abistatud monitor tuvastab väiksemaid rikkeid kui klassikaline, väljastatud ausa TradeEvidence'ina.

# text
seg-a689ab2ebb84 = Suletud kujul Gaussi AUC = Phi(mu/(sigma*sqrt2)) ristkontrollitud väliselt valideeritud eval_stats::bootstrap_auc_ci vastu (vs scikit-learn) + tuvastuse analüütilised lävendid

# text
seg-0633e05d393f = Momendivaba jäiga keha asendidünaamika

# text
seg-23f43007bcbf = Euleri pöörlemisliikumise võrrandid (I ω̇ = τ − ω × Iω, peateljed ja üldine inertsitensor) seotud kvaternioonasendi kinemaatikaga (q̇ = ½ q ⊗ ω) ning propageeritud fikseeritud sammuga RK4 integraatoriga, mis renormaliseerib kvaternioni igal sammul

# text
seg-2d21a01ea132 = Basilisk { "2.9.1" } kosmoseaparaadi keskosa jäiga keha propageerimine (AVSLab, ISC; MRP-asend selle enda seotud keskosa võrrandite kaudu, svIntegratorRKF78 suhtelise tolerantsiga { "1e-12" }), sõltumatu realisatsioon momendivaba jäiga keha võrranditest: Kshana RK4 kvaternion (dt { "0.01" } s) ja keha nurkkiirused ühtivad täpsusega { "1e-9" } { "1e4" } s jooksul kahel üldisel mittediagonaalsel inertsil (halvim { "3.3e-11" } ja { "3.4e-12" } rad/s); tolerants fikseeritud enne võrdlust. Valideeritud väide: momendivaba liikumine; välismomendi liiget ei võrrelda. Jäävusseaduste ja sümmeetrilise vurri kontrollid jäävad toetava enesekooskõlana. Paindkeha / juhtimisahela / välismomendi keskkonda ei ole

# text
seg-93b8ba1ba0e5 = Clohessy–Wiltshire / Hilli suhtelise liikumise dünaamika

# text
seg-17f27a95d009 = Jälitaja suhteline liikumine sihtmärgi ümber ringikujulisel etalonorbiidil LVLH tugisüsteemis: lineariseeritud Clohessy–Wiltshire võrrandid (ẍ−2nẏ−3n²x={ "0" }, ÿ+2nẋ={ "0" }, z̈+n²z={ "0" }), lahendatud suletud kujul { "6" }×{ "6" } olekuülemineku maatriksiga Φ(n,t) (Clohessy–Wiltshire { "1960" }; Vallado Alg. { "48" }) piiratud suhtelise orbiidi tingimusega ẏ₀=−2n·x₀ ning suletud kujul teist järku parandusega (cw_dynamics::second_order_correction, CW vastus täpse ringikujulise juhtsatelliidi võrrandite ruutliikmetele; Karlgaard ja Lutze { "2003" }, Newman, Lovell ja Pratt { "2015" }), mis on komponeeritud kujul cw_dynamics::propagate_second_order. Valideeritud väljund on propagate_second_order; ainult lineaarne Φ on iseloomustatud mittelineaarse tõe vastu, mitte valideeritud

# text
seg-d31be81dfd8f = TDOA/FDOA passiivne kiirgaja geolokatsioon

# text
seg-aa870cee16f6 = Kiirgaja (segaja/spuufija või oportunistlik allikas pöörd-PNT jaoks) asukoha määramine vastuvõtjavõrgu saabumisaegade erinevusest — τᵢ=(Rᵢ−R₀)/c hüperboloidide lõige, lahendatud Gauss–Newtoni vähimruutudega — ning sagedusdiferentsi (kaugusmuutuse erinevused) lisamisel liikuvate vastuvõtjatega asukoha ja kiiruse ühine taastamine; koos Cramér–Rao alampiiriga asukoha kovariatsioonile mõõtmisgeomeetriast

# text
seg-36b74b49f82f = 3-DoF ballistilise sisenemise tippvaeglustus avaldatud Stardusti nominaali vastu

# text
# c1: entry-heating
seg-a05ca2fde6fc = 3-DoF punktmassi sisenemine pöörleval sfäärilisel Maal läbi USA standardatmosfääri { "1976" }, integreeritud RK4-ga inertsiaalsest sisenemisolekust, esitades tippvaeglustuse ja selle kõrguse; planeedi suhtes sisenemisolek inertsiaalsest. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-5ab7065c0803 = Desai, Mitcheltree ja Cheatwoodi ({ "1999" }, NASA NTRS { "20050042027" }) Stardusti nominaal: maksimaalne vaeglustus { "33.4" } g kiirusest { "12.6" } km/s planeedi suhtes stardimassiga { "45.8" } kg, 6-DoF POST trajektoor täieliku aerodünaamikaandmebaasiga; sisenemisliides Desai, Lyonsi, Tooley ja Kangase (NTRS { "20090004445" }) järgi: raadius { "6503.14" } km, inertsiaalne { "12.9" } km/s nurga -8.2 kraadi all. Läved eelregistreeritud failis xval/entry-stardust/PREREGISTRATION.md enne mis tahes käivitust nendel sisenditel; mõlemad kehtisid esimesel käigul. MIS EI OLE: üks avaldatud juhtum ja üks suurus (tippvaeglustus, mis ballistilises lähenduses ei sõltu ballistilisest koefitsiendist); sisenemise laius- ja suunanurk on eeldatud; kuumenemist, soojuskoormust ega maandumispunkti sellega ei kontrollita; punktmass konstantse C_D-ga, mitte 6-DoF.

# text
seg-5bd3882531b6 = Peatumispunkti konvektiivne sisenemiskuumenemine (Sutton-Graves) 3-DoF sisenemisel

# text
seg-4f97036ed72f = Peatumispunkti konvektiivne soojusvoog q = k sqrt(rho/R_n) V^{ "3" } Sutton-Gravesi konstantidega Maa õhu ja Marsi atmosfääri jaoks (NASA TR R-376, { "1971" }), selle tipp ja integreeritud soojuskoormus piki 3-DoF sisenemist, ballistilist või tõstejõuga konstantse kreeninurgaga, Maal või Marsil.

# text
seg-5a203ecfeaee = Sisemine kooskõla: seos ja konstandid nii, nagu need on NASA TR R-376-s trükitud, poolsammu koonduvuskontroll ning kuumenemise ja vaeglustuse tippude oodatav järjestus. MIS EI OLE: ühtegi avaldatud kuumenemisväärtust ei ole võrreldud (Stardusti artiklid annavad projekteerimispiiri ja konvektiivse-pluss-kiirguskuumenemise hinnangu umbes { "1200" } W/cm2, millele ainult konvektiivne seos ei saa vastata); kiirguskuumenemise, seina temperatuuri ega katalüütilisuse parandust ega termokaitse reaktsiooni ei ole.

# text
seg-1b96577665fc = Elektrooptilise kujutaja radiomeetria, MTF, suhteline servavastus ja GIQE { "4" } NIIRS

# text
# c1: eo-radiometry
seg-38902593e841 = Nadiirkujutaja signaali ja müra suhte eelarve (Lamberti stseeni radiants, kaameravõrrand, lasu-, tume-, lugemis- ja kvantimismüra), süsteemi MTF Nyquisti sagedusel varjestamata ava difraktsiooni, detektori ava, lineaarse hajumise ja Gaussi värina korrutisena, sellest MTF-ist integreeritud servavastus ja suhteline servavastus, Q = lambda F / p, ning GIQE versiooni { "4" } NIIRS ilma MTF-kompensatsioonita. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-bb3a01edc95d = Suletud kujud: difraktsiooni MTF poolel katkestussagedusel, puhta detektori ava ühe piksli tõususerv (RER { "1" }), Gaussi hägustuse normaaljaotuse CDF serv (RER = erf(0.5/(sigma sqrt { "2" }))), lasumüra skaleerumine ja GIQE { "4" } koefitsiendid nii, nagu need on avaldatud (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). MIS EI OLE: ühtegi välist kujutajat, mõõdetud MTF-i ega hinnatud pilti ei ole võrreldud; GIQE on empiiriline regressioon oma veaga; hajavalgust, atmosfääri MTF-i, MTF-kompensatsiooni ega aliasingut ei ole.

# text
seg-07ca77a67207 = Kanderaketi tõusu gravitatsiooni-, takistus-, juhtimis- ja vastusurvekaod

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Mitmeastmelise kanderaketi tasapinnaline gravitatsioonipöörde tõus mittepöörleval sfäärilisel Maal läbi USA standardatmosfääri { "1976" } (tihedus ja rõhk), tõusunurga lööki, düüsi vastusurvega vähendatud tõukejõudu, astmete väljalülitusi täpsetel sammupiiridel ning gravitatsiooni-, takistus-, juhtimis- ja vastusurvekadusid, mis on integreeritud oleku kõrval. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-174ed29adbbe = Sisemine kooskõla: täpne samasus väljalülituskiirus = summa Isp g0 ln(m0/mf) miinus neli integreeritud kadu (jääk alla { "1e-6" } m/s), Tsiolkovski võrrand vertikaalsel vaakumpõlemisel, kus gravitatsioon on ainus kadu, ning US76 merepinna ja tropopausi rõhud. MIS EI OLE: ühegi avaldatud kanderaketi kadusid ei ole võrreldud; Maa pöörlemist, rannasõitu, drosseldamist ega juhtimist peale löögi ei ole; konstantne C_D; mitte trajektoori optimeerija.

# text
seg-55e8345def8b = TWSTFT kahesuunaline võrrand, määramatuse eelarve ja lingi stabiilsus flikkeri ja ööpäevase mittevastastikkusega

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = TWSTFT kahesuunaline võrrand, lahendatud suuruse T_A - T_B jaoks jaama saatmis- ja vastuvõtuviidetega, Ku-riba ionosfääri üles-/allalingi asümmeetria, transponderi viite erinevuse ja Sagnaci liikmetega, selle täpse otsemudeli vastu; ruutsumma määramatuse eelarve lingi TDEV-iga A-tüüpi liikmena; kahesuunaline rida valge ja flikker-faasimüraga (Kasdin-Walter), ööpäevase mittevastastikkuse ja konstantse vastastikkuse jäägiga; ning etteantud Circular T, MJD-CSV või IGS RINEX jaamakella ridade kiirus, jääk-RMS, TDEV ja ADEV. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-244f7396ac25 = Sisemine kooskõla: otsemudel ja lahendatud võrrand ühtivad täpsusega { "1e-15" } s, Sagnaci liige võrdub mooduli sõltumatu BIPM 2A omega/c^{ "2" } silmuskujuga, ionosfääri liige on { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c ning müraprotsessid näitavad oodatud TDEV kujusid. MIS EI OLE: ühtegi päris TWSTFT mõõtmist ega kalibreerimisaruannet ei ole võrreldud; esitatud viited ja määramatused on sisendid, mitte mõõdetud; etteantud ridade stabiilsused on esitatud, mitte valideeritud.

# text
seg-2f9be02c92bc = Optilise kaldtee atmosfääri numbrid: Rytovi dispersioon, skintillatsioon, gamma-gamma summutustõenäosus, ava keskmistamine, pilve ja selge õhu optiline paksus

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integreeritud piki kaldteed tasa- ja sfäärilaine Rytovi dispersiooni (üles- ja allalink), Andrews-Phillipsi skintillatsiooniindeksi ja gamma-gamma parameetrite, gamma-gamma summutustõenäosuse ja summutusvaru, nõrga turbulentsi ava keskmistamise teguri, vedela vee samba pilve optilise paksuse ning Kimi nähtavuse pluss Rayleigh' selge õhu optilise paksuse jaoks, asendades optilise lingi eelarve koondatud atmosfäärikao, kui atmosfäär on antud. Käivitatav stsenaariumi liigi <c1/> sees.

# text
seg-7ca512adff99 = Numbreid võrreldakse sõltumatu programmiga (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } { "30" } numbri täpsusel, tanh-sinh kvadratuur algsel kõrgusmuutujal ja Bessel-K gamma-gamma tihedused), mis ei jaga Kshanaga mingit koodi, enne mis tahes realisatsiooni fikseeritud lävede alusel (xval/optical-atmosphere/PREREGISTRATION.md). MIKS MODELLED: see sõltumatu etalon hindab samu avaldatud valemeid, seega kontrollib see nimetatud valemite realisatsiooni, mitte atmosfääri; ITU-R valideerimisnäidet ega mõõdetud skintillatsiooni- või kaldtee-ekstinktsioonikirjet ei kasutata (ITU väärtused on avatud litsentsiotsus ja hoitakse hoidlast väljas). Cn2 profiili tase, nähtavus, aerosooli ja molekulaarne skaalakõrgus, ava keskmistamise teepikkus ning momentide sobitamine, mida kasutatakse ava keskmistamise rakendamiseks gamma-gamma parameetritele, on esitatud sisendid või kokkulepped. Mooduli allikarida märgib, et üks laialt kopeeritud ülevaade trükib teise skintillatsioonieksponendi kujul 7/6, kus Andrews ja Phillips annavad 5/6; realiseeritud on 5/6 kuju

# text
seg-a2faab92e760 = Ilmast sõltuv optilise maajaama kättesaadavus ja kaugusest sõltuv jaamade mitmekesisus

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Optilise lingi kättesaadavus esitatud lingivaru suhtes log-normaalsest pilve vedela vee kliimast (ITU-R P.840 hulk, geomeetrilise optika ekstinktsioon) ja sõltumatust gamma-gamma turbulentsi summutusest, sihtkättesaadavuste jaoks vajalik lingivaru ja lagi, mida ükski varu ei tõsta, log-normaalsed katkestuste kestused, parendustehnikate mis-oleks-kui, ning ühefaktoriline Gaussi kopula võrgu kättesaadavus, mille paarikorrelatsioon on exp(-kaugus/dekorrelatsioonipikkus). Käivitatav stsenaariumi liigina <c1/>.

# text
seg-20eab6e9b925 = Sisemine kooskõla: diversiteedimudeli suletud kujul piirid ja monotoonsus, pilvelaega suletud kuju ning log-normaalsed katkestuste samasused. ÜHTEGI välist sõltumatut etaloni ei väideta ja ühtegi ei ole võrreldud: ühtegi mõõdetud optilise maajaama kättesaadavuse ega pilvevaba vaatejoone kirjet ei kasutata. MIKS MODELLED: pilvekliima (pilve tõenäosus, vedela vee samba mediaan ja hajuvus, katkestuste kestused), pilve ja turbulentsi sõltumatus, Gaussi kopula kuju, dekorrelatsioonipikkus ja iga tehnika võit on eeldused; kaasasolevad stsenaariumid esitavad ILLUSTRATIVE kliimasid, mitte andmekogumit. Selle rea täiendamiseks on vaja tsiteeritud mõõdetud kättesaadavuse kirjet ja enne võrdlust registreeritud lävi

# text
seg-043ece801e72 = Ajastuse ja kaugusmõõtmise pidevus optiliste katkestuste kaudu

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = Optilise jaama katkestuste kestuse jaotus, mis on seotud kella holdover-mudeli suletud kujul rannasõidu dispersiooniga: ajastuse ja kaugusmõõtmise viga nimetatud katkestuste kvantiilidel, holdover ajastuse lävendini, selle sisse jäävate katkestuste ja katkestusaja osa ning ajastuse kättesaadavus A + U E[min(D, T_h)]/E[D] klassikalise ja kvantkella klasside jaoks. Käivitatav stsenaariumi liigi <c1/> sees.

# text
seg-ab2a33c1b1a4 = Sisemine kooskõla holdover-mooduliga, bitt-bitilt; ÜHTEGI välist sõltumatut etaloni ei väideta. Klasside PSD-d on sünteesitud pika tau põhjad, mida holdover-moodul juba kannab, seega päranduvad numbrid selle esitatud hoiatuse: holdover range lävendini on määratud eeldatud punase müra põhja, mitte viidatud Alani hälbe poolt. Katkestuste kestused on esitatud parameetritega log-normaalne mudel, mitte mõõdetud pilvehoiu kirje

# text
seg-b119df65d2a7 = Optilise lingi varu ajas: ühe jaama ilma üks algväärtusega (seed) realisatsioon

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Valikuline <c1/> tabel (kestus, samm, algväärtus (seed)) paneb liigi <c2/> kirjutama ka jaama kohta ühe algväärtusega (seed) realisatsiooni esitatud jaamamudelist ajas: pilveepisoodid (selged perioodid eksponentsiaalsed, pilvekatkestused log-normaalsed esitatud keskmise ja hajuvusega, pilves veedetud ajaosa seatud esitatud pilve tõenäosusele), üks log-normaalne vedela vee sammas pilveepisoodi kohta, üks gamma-gamma skintillatsiooniproov sammu kohta ning neist lingivaru, pilve- ja skintillatsioonisummutused ning lingi töötab lipp, koos realiseerunud kättesaadavuse, pilveosa, katkestuste arvu ja pikima katkestusega. Ilma tabelita on tulemus dokument { "0.37" }. Tõmbed käivad läbi teisaldatavate jaotuse- ja matemaatikateede, nii et native ja wasm32 annavad samad baidid.

# text
seg-d25e5d2449bd = Ainult sisemine kooskõla; ÜHTEGI välist sõltumatut etaloni ei väideta ega ole ühtki ilma realisatsiooni jaoks. Kontrollid võrdlevad ühte tõmmet sama mudeli statistilise väljundiga, seega läbimine ütleb, et generaator võtab valimi esitatud jaotustest (tõmbe kättesaadavus ja pilveosa jäävad esitatud näitajate eelregistreeritud tolerantside sisse), mitte et ükski päris jaam nii käitub. Rida on üks realisatsioon, mitte kliima: selle kättesaadavus erineb esitatust tõmbe valimivea võrra ning skintillatsiooniproovid eri sammudel on sõltumatud, mis on esitatud lihtsustus protsessist, mis dekorreleerub millisekundites. Ilmasisendid jäävad stsenaariumi eeldusteks.

# text
seg-58cbf576c959 = TRK-2-18 orbiidiandmete faili lugeja ja Marsi rampitud 2-suunalise Doppleri mudel

# text
seg-d1055650a77f = DSN-i orbiidiandmete failide (TRK-2-18) lugeja: 36-baidised kirjegrupid (faili silt, identifikaator, orbiidiandmed, jaamapõhised rambid, kellanihked, kokkuvõte, faili lõpp) ja igas orbiidiandmete kirjes ajamärge alates aastast { "1950" }, allalingi ja ülallingi viited, vaadeldav suurus, jaamad, andmetüüp, ribad, kehtivus, kanal, kosmoseaparaat, 46-bitine etalonsagedus ja tihendusaeg; rambi algus- ja lõppajad, kiirused ja algsagedused. Selle peal rampitud 2-suunaline X-riba Doppleri mudel (integreeritud ülallingi rambid, edasi-tagasi valgusaeg Shapiro ja troposfääriga, DSN-i jaamad IAU 2006/2000A CIO ahela ja IERS EOP kaudu, jaama aeg) ning Marsi orbiidiseadme partii orbiidi määramine (GMM-3 väli, kolmandad kehad, SRP, takistus).

# text
seg-6d533149f6f0 = PDS3 silt, mille DSN-i navigatsiooniandmete konditsioneerimise protsess faili juurde tootis (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), kontrollitud lävede vastu, mis on eelregistreeritud failis xval/mro-odf/PREREGISTRATION.md enne lugeja olemasolu. MODELLED, sest üks registreeritud lävi (faili lõpu tabeli read, { "121" } failis vs { "120" } sildis) jäi täitmata; silt on seal sisemiselt vastuoluline. Etapp { "2" } (xval/mro-od/PREREGISTRATION.md, muudatused A1 ja A2 enne hinnatud tulemust): MRO navigatsioonimeeskonna rekonstruktsioonist (mro_psp5, NAIF) ennustatud Doppler ühtib vaadeldud rampitud 2-suunalise Dopplerga täpsusega { "12.5" } mHz arenduses kasutamata läbimistel, lävi täidetud; registreeritud orbiidi määramine ebaõnnestus hinnatud kaarel (normaalmaatriks ei ole positiivselt määratud) ja ei andnud orbiiti, seega orbiidiläved jäid täitmata. Käik { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, summutatud hindaja, sama kaar ja läved, punktiarvestuse muudatus R2-A1 avalikustatud kaustas docs/revisions) koondus: hinnatud orbiit on rekonstruktsioonist { "0.36" } km RMS ({ "0.53" } km maksimum) piires, läved täidetud, kuid järeltasanduse Doppleri RMS on { "48.6" } mHz vastu { "30" } mHz lävendit, täitmata, seega jääb rida MODELLED. MIS EI OLE: ükski hinnatud orbiit ei ole täitnud kõiki registreeritud lävesid; ionosfääri, päikeseplasmat ja enamikku antenni nihkest (arenduslikul läbimisel on sobitatud { "1.5" } m radiaalne nihe) ei modelleerita.

# text
seg-c7d292f14693 = Suletud ahelaga MRP-tagasisidega asendijuhtimine reaktsiooniratastega

# text
# c1: aocs
seg-f33781b74cc2 = Jäiga keskosa inertsiaalne suunamisjuhtimine kolme või enama tasakaalustatud reaktsiooniratta abil: MRP-tagasisideseadus L_r = -K sigma_BR - P omega_BR (Schaub ja Junkins), minimaalse normiga ratta mootori momendid G_s u = -L_r, piiratud iga ratta piirmääraga, seotud keskosa ja ratta dünaamika, kus keskosa inerts kannab rataste pöörlemisinertsi, kvaternioonkinemaatika, RK4 nullijärgu hoidmisega. Käivitatav stsenaariumi liigina <c1/> (tõese oleku ahel).

# text
seg-9563d5843891 = Basilisk { "2.9.1" } (AVSLab, ISC; bsk-ratta käik eraldi tööriistana, mida ei lingita ega kopeerita): kosmoseaparaadi keskosa, reactionWheelStateEffector (BalancedWheels, momendipiir sees), simpleNav, inertial3D, attTrackingError, mrpFeedback (ilma integraalliikmeta) ja rwMotorTorque sammuga dt = { "0.1" } s oma RK4-ga, Kshana enda realisatsiooni vastu kolmel juhtumil (kolm ortogonaalset ratast; nelja ratta püramiid; küllastuv nelja ratta juhtum), läved eelregistreeritud failis xval/aocs-basilisk/PREREGISTRATION.md enne koodi ja käivitust. Kõik läved kehtisid esimesel käigul. MIS EI OLE: sensorimüra ahelas, integraaltagasiside, jälgimissuunamine, ratta hõõrdumine, värin, kiiruspiirangud ja toide, ühegi päris kosmoseaparaadi võimendused; võrdlus kontrollib seaduse ja dünaamika realisatsiooni sõltumatu vastu, mitte lennujuhtimisseadet.

# text
seg-455dc946c965 = Multiplikatiivne EKF asendi hindamine güroskoobist ja tähejälgijast

# text
# c1: aocs
seg-553d043438b4 = Lefferts-Markley-Shusteri multiplikatiivne EKF: keha tugisüsteemi asendiviga ja güroskoobi nihke olekud, propageerimine güroskoobi kiirusega miinus nihkehinnang ja Farrenkopfi diskreetne protsessimüra (nurga ja kiiruse juhuslik kõnd), tähejälgija uuendused jäägiga { "2" } vec(q^-1 q_st) Josephi kujul ning multiplikatiivne lähtestus; Farrenkopfi diskreetne güroskoobi ja tähejälgija simulaator. Liik <c1/> saab ahela sulgeda oma hinnangu peal.

# text
seg-846cb1eeb35c = Sisemine kooskõla: filtri normaliseeritud hindamisvea ruut tõe suhtes, mis on simuleeritud samadest sensorimudelitest Monte Carlo algväärtuste (seed) üle, ning asendi- ja nihkehinnangute koonduvus. MIS EI OLE: ühtegi välist hindajat ega lennuandmeid ei ole võrreldud (Basilisk { "2.9.1" } ei sisalda MEKF-moodulit); sensorimudelid on õpikulised, ilma nihkenurga, skaalateguri või tähejälgija vaatevälja mõjudeta.

# text
seg-059732bda693 = Wahba/TRIAD/QUEST asendi määramine

# text
seg-3ee6e56d790f = Optimaalne kolmeteljeline asend kaalutud vektorvaatlustest (tähe/päikese/magnetomeetri suunad): deterministlik kahevektoriline TRIAD, Davenporti q-meetod (täpne Wahba kaofunktsiooni minimeerija — optimaalne kvaternioon on { "4" }×{ "4" } Davenporti maatriksi K suurima omaväärtuse omavektor, lahendatud sümmeetrilise Jacobi omaväärtuste lahendajaga) ja QUEST (K karakteristliku võrrandi Newtoni/sekandi juur, algväärtusega Σ kaalud, seejärel Gibbsi vektori kvaternioonitaastus)

# text
seg-9c47484cc9d7 = scipy.spatial.transform.Rotation.align_vectors (SciPy { "1.13" }; Virtanen et al., Nature Methods { "2020" }) — Wahba ülesande Kabsch/Markley SVD-lahend, tõeliselt sõltumatu algoritm (asendiprofiili maatriksi SVD) ja koodibaas kshana Davenporti-K omaväärtuslahendajast / QUEST karakteristliku juure meetodist, mis arvutab SAMA üheselt määratud Wahba-optimaalse asendi. Müravabadel kaalutud vektorvaatluste komplektidel reprodutseerivad TRIAD, q-meetod ja QUEST scipy optimaalse pöörde täpsusega <{ "1e-9" } rad (võrreldud märgiinvariantse asendinurga vea kaudu). Mürarikka Monte Carlo statistiline väide „optimaalne ületab TRIAD-i“ jääb MODELLED (puudub sõltumatu etalon); ainult punktsuuna ühikvektorvaatlused — ei ole sensori vaatevälja/nihke/ajalise korrelatsiooni modelleerimist ja QUEST on singulaarne nurga { "180" }° juures (q-meetod katab selle juhtumi)

# text
seg-cd342cc48afc = GNSS ruutseadusliku püüdmise tuvastusstatistikud

# text
seg-6d97452de33e = Ruutseaduslik (mittekoherentne) püüdmisdetektor koodifaasi × Doppleri otsingu üle: valehäire tõenäosus (tsentraalne χ² 2M vabadusastmega), sihtmärgi P_fa saavutav lävi (χ² CDF pööratud poolitamisega) ja tuvastustõenäosus (mittetsentraalne χ² mittetsentraalsusega 2M·ρ lahtri korrelatsioonijärgse SNR-i ρ korral), üldistatud Marcum Q-funktsiooniga Q_M(a,b)={ "1" }−F_{ "{" }χ'²(2M,a²){ "}" }(b²)

# text
seg-f801a2bdca78 = scipy.stats.ncx2 / scipy.stats.chi2 (SciPy { "1.13" }; Cephes/Boost) — sõltumatu algoritm (jätkuv murd mittetsentraalne/tsentraalne χ²) kshana mittetäielikust gammarea realisatsioonist (raim::chi2_cdf / noncentral_chi2_cdf), mis arvutab sama üheselt määratud tuvastusstatistikute TUUMA: üldistatud Marcum Q_M(a,b)=ncx2.sf(b²,2M,a²), tuvastustõenäosus P_d, valehäire tõenäosus P_fa ja P_fa→lävi pööramine, kooskõla tasemel ~{ "1e-6" } — sama sõltumatuse alus nagu valideeritud reas „RAIM/ARAIM terviklikkuse statistiline tuum“. AINULT TUUM: lahtripõhine CFAR lahtrite keskmistamine ja koodi/Doppleri klassi ületamise kadu jäävad MODELLED

# text
seg-77f425a38aa2 = GNSS kandelaine faasi täisarvuliste mitmetähenduslikkuste lahendamine (LAMBDA)

# text
seg-410ce8b6cebf = Täisarvuline vähimruutude mitmetähenduslikkuse fikseerimine LAMBDA viisil: mahtu säilitav täisarvuline (Z) dekorreleeriv teisendus (L D Lᵀ teguri täisarvuline Gaussi suuruse vähendamine) + täpne Schnorr–Euchneri sügavuti hargne-ja-tõkesta täisarvuliste vähimruutude otsing koos kahe parima kandidaadi suhtetestiga (valideeritud väide); pluss suletud kujul alglaaditud edukuse määr P_s=∏(2Φ(1/(2σ_{ "{" }i|I{ "}" }))−{ "1" }), mida kontrollitakse ainult sisemiselt ja mis jääb väljapoole valideeritud väidet

# text
seg-5aeb95f59f07 = RTKLIB v2.4.2-p13 lambda() (selle lambda.c lähtefail, T. Takasu, BSD-2-Clause), sõltumatu LAMBDA redutseerimine ja MLAMBDA otsing, kompileeritud C-st ja käivitatud tööriistana, { "300" } juhuslikul kovariatsioonil (n { "2" } kuni { "10" }): täisarvulistel vähimruutudel on ühene minimeerija, seega peavad fikseeritud täisarvud olema identsed ({ "0" } mittevastavust) ja kaks parimat ruutnormi, mis söödavad suhtetesti, ühtivad suhtelise täpsusega { "1e-9" } (mõõdetud { "5.6e-13" }); tolerants fikseeritud enne võrdlust. Valideeritud väide: ILS-lahend ja selle kaks parimat normi. RTKLIB ei arvuta alglaaditud edukuse määra, mis jääb sisemiselt kontrollituks ümardamisprotsessi Monte Carlo vastu; Z-teisenduse invariandid ja täielik läbivaatus jäävad toetavate kontrollidena. Ainult täisarvuline Gaussi dekorrelatsioon (täieliku LAMBDA redutseerimise ümberjärjestuse permutatsioonid kiirendavad otsingut, kuid ei muuda ei täpset ILS-vastust ega alglaaditud määra)

# text
seg-4ad1ec05610f = B-tasandi sihtimine ja kokkuliidetud koonuste gravitatsiooniabi

# text
seg-d249aea7c3ea = Hüperboolse möödalennu geomeetria (a=−μ/v∞², e={ "1" }+r_p·v∞²/μ, pöördenurk δ={ "2" }·asin(1/e), sihtparameeter |B|=|a|·√(e²−{ "1" })), B-tasandi Ŝ/T̂/R̂ sihtpunkti tugisüsteem ja B·T̂/B·R̂ lahutus ning kokkuliidetud koonuste gravitatsiooniabi (v∞-suurus säilib, suund kaldub nurga δ võrra, heliotsentriline Δv={ "2" }·v∞·sin(δ/2) ilma tõukeaine kuluta) Tisserandi parameetriga T_P=a_P/a+{ "2" }√((a/a_P)({ "1" }−e²))cos i

# text
seg-8e82da17a463 = CRPA häirevastase antennimassiivi kiirevormimine

# text
seg-1744f527b4d1 = Kontrollitud vastuvõtumustriga antenni nullimine: kompleksed massiivi suunamisvektorid a(û)=exp(j·k·pₙ·û), deterministlik nullide suunamine (ühikvõimendus SV suunas, täpsed nullid kuni N−{ "1" } segaja suunas minimaalse normiga w=Aᴴ(AAᴴ)⁻¹b kaudu) ja MVDR adaptiivsed kaalud w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv), mis suunavad sügavad nullid ise tugevatele häirijatele (nullist kirjutatud kompleksse lineaaralgebra tuumaga)

# text
seg-8016dae66350 = numpy.linalg / scipy.linalg (LAPACK zgesv kompleksne lahendus) — kshana nullist kirjutatud kompleksest tuumast sõltumatu lineaaralgebra koodibaas, mis arvutab SAMAD üheselt määratud kaalud: MVDR w=R⁻¹a_sv/(a_svᴴR⁻¹a_sv) ja minimaalse normiga nullide suunamine w=Aᴴ(AAᴴ)⁻¹b, pluss saadud massiivi vastuse võimendused, kooskõla tasemel ~{ "1e-9" } — sama klassi sõltumatu etalon nagu valideeritud DOP (gnss_lib_py) ja Fisheri informatsiooni (numpy) read. MODELLED kitsaribaline kaugvälja identsete isotroopsete elementidega massiiv — ei ole vastastikust sidestust, elemendipõhist mittevastavust, lõplikku ribalaiust (STAP) ega suunamisvektori hindamisviga

# text
seg-f2c973f14d52 = IEEE-1139 astmeseadusega kellamüra + flikker-FM põhi

# text
seg-4a0159558671 = Viiekoefitsiendiline IEEE-1139 PSD↔Alani dispersiooni teisendus S_y(f)=Σh_α f^α → σ_y²(τ) (valge/flikker PM, valge/flikker/juhuslik kõnd FM), flikker-FM põhi σ_y=√({ "2" } ln2·h_{ "{" }-1{ "}" }) esmaklassilise sobitatava liikmena ning mittenegatiivne FM-perekonna sobitus baasis { "{" }(2π²/3)τ, { "2" } ln2, 1/(2τ){ "}" }, mis taastab põhja, mida triivibaas { "{" }1/τ,τ,τ³{ "}" } esitada ei suuda

# text
seg-24f6f26046b6 = allantools { "2024.06" } (A. Wallin; Kasdin & Walter { "1992" } / Vernotte { "2015" } koefitsiendid) — sõltumatu kolmanda osapoole koodibaas ja viitejada, mis arvutab SAMA üheselt määratud IEEE-1139 PSD→Alani teisenduse σ_y(τ) kõigi viie astmeseadusliku müra tüübi jaoks. kshana powerlaw::allan_deviation ühtib allantools suletud kujudega (valge/flikker-FM, RW-FM ja valge-PM suhtelise täpsusega <{ "5e-9" }; flikker-PM tasemel ~{ "1e-5" } — tegelik sõltumatuse signaal, kus kshana kasutab NIST-SP-1065 tabelkonstanti { "1.038" } vs allantools täielik 3γ−ln2), ja flikker-FM põhi √({ "2" } ln2·h_{ "{" }-1{ "}" }) ühtib allantools-iga kogu redelil — sama lävi, mille valideeritud MDEV/TDEV/Theo1/MTIE read ületavad. MODELLED statsionaarne astmeseaduslik mudel — deterministliku triivi (τ²) liiget ei ole; seadmepõhised koefitsiendid / mõõdetud põhjad jäävad modelleeritud

# text
seg-cc1ac065e684 = CCSDS OEM kovariatsiooniploki vahetus

# text
seg-ec4d44e7cf78 = CCSDS { "502.0" } OEM COVARIANCE_START…COVARIANCE_STOP ploki serialiseerimine ja parsimine — { "6" }×{ "6" } asukoha/kiiruse kovariatsioon, kirjutatud oma 21-elemendilise alumise kolmnurgana (kanooniline CX_X … CZ_DOT_Z_DOT järjekord) valikulise COV_REF_FRAME-iga, täiendades olemasolevat OEM olekuvektori kirjutajat/parserit, nii et orbiidi määramise ja filtri kovariatsioonid teevad standardses vormingus edasi-tagasi teisenduse

# text
seg-891b86506bf6 = oem { "0.4.5" } (MIT, https://pypi.org/project/oem/) — SAMA sõltumatu CCSDS-502 parser, mida usaldab valideeritud rida „CCSDS OEM koostalitlusvõime“, täiesti eraldi koodibaas (oma KVN tokeniseerija, kovariatsiooniosa olekuautomaat ja numpy maatriksi kokkupanek). kshana väljastab täieliku OEM-segmendi, mis kannab selle märgistamata paljaste arvudega alumise kolmnurga COVARIANCE-ploki; oem parsib selle ja rekonstrueerib sümmeetrilise { "6" }×{ "6" }, mis ühtib kshana sisendkovariatsiooniga element-elemendilt f64 ümardusveani — tõeline teek-vs-teek vahetuse edasi-tagasi teisendus (võrreldud oem rekonstruktsiooniga, mitte kshana uuesti parsimisega), mis sulgeb rea varasema lünga „kolmanda osapoole testkomplekt puudub“

# text
seg-ae061c7f082c = INS/TRN rannasõidu vea kasv ja lävendite ületused

# text
# c1: ins-trn-coast
seg-7bacdc8aa0d8 = Asukohavea ja rannasõidu kestuse eelarve, mis on ehitatud IMU koefitsientidest, iga veaallikas (kiirendusmõõturi nihe, güroskoobi nihe, kiiruse juhuslik kõnd, nurga juhuslik kõnd, skaalategur sõidu ajal ja püsiva erijõu all) propageeritud üheksaolekulise kohaliku tasandi INS-i veamudeli kaudu Schuleri tagasisidega (inertial::coast::ErrorDynamics Grovesi 2. väljaande ptk { "14" } järgi: asendi-, kiiruse- ja asukohavead, vertikaalkanal oma gravitatsioonigradiendiga, WGS-84 raadiused ja normaalgravitatsioon, põhja suunas seatud kiirusega liikuv tasapinnaline platvorm, latitude_deg ja height_m; süstemaatilised liikmed laiendatud maatriksi eksponendiga, juhuslikud kõnnid Van Loani meetodil), tasapinnalise Maa monoomid säilitatud ainult kujul leading_order_m; osad kombineeritud esitatud reegli järgi (rss / linear-sum / deterministic-sum-with-stochastic-rss); rannasõidu kestused, mis jõuavad kutsuja antud asukohalävenditeni ({ "10" } m ja { "50" } m vaikimisi), leitud edasiskaneerimisega esimese ületuse jaoks (first_crossing_s, sest Schuleriga piiratud kõverad ei ole monotoonsed), koos domineeriva allikaga igal ületusel; ning TRN-iga piiratud režiim, mis annab suurima maastikufikseeringu intervalli, mis iga lävendit hoiab. Käivitatav stsenaariumi liigina <c1/>

# text
seg-a971ff07592a = Ava navigatsiooni-vs-side töötsükkel

# text
# c1: passes::predict_passes
# c2: aperture_duty::windows_from_passes
# c3: navigation-priority
# c4: communications-priority
# c5: first-come-first-served
# c6: aperture-duty-cycle
seg-5b0ba97379bf = Üks käik võtab kontaktiplaani (aos_s/los_s akende loend, millest igaüks küsib avalt navigatsiooni või sidet — sama akende sõnavara, mida väljastab <c1/>, teisendatud funktsiooniga <c2/>), avade arvu ja selgesõnalise vahekohtu poliitika ning tagastab navigatsiooni töötsükli, side töötsükli, jõudeoleku töötsükli ja seansipõhise katkestuse. Poliitika on sisend dokumenteeritud vaikeväärtusega (<c3/>; samuti <c4/> ja mitteväljatõrjuv <c5/>), ja aruanne kannab lahendatud poliitikat, selle täielikku määratlust ning töötsükli ja katkestuse määratlusi, sest ilma oma vahekohtureegliita esitatud töötsükli number ei ole reprodutseeritav. Ajakava on täpne intervallipühkimine akende piiride üle, nii et aken, mis lõpeb täpselt seal, kus järgmine algab, ei konkureeri kunagi, ning navigatsiooni, side ja jõudeoleku ava-sekundid akumuleeritakse selles ühes pühkimises sõltumatult. Käivitatav stsenaariumi liigina <c6/>

# text
# c1: passes::predict_passes
seg-656fd7d44a9e = Sisemine kooskõla kolmest suurusest, mis on arvutatud samas pühkimises erinevate avaldistega ja millelt seejärel nõutakse sulgumist. Navigatsiooni ava-sekundid, side ava-sekundid ja jõudeoleku ava-sekundid akumuleeritakse eraldi — jõudeolek (avad − |teenindatud|) järgi elementaarse intervalli kohta, mitte kunagi jäägina — ja nende summa kinnitatakse suurusega avad × horisont_s, mille valesti klambritesse pandud piir, topeltloetud intervall või maha jäetud intervall kohe katkestab; seansipõhised teenindatud ajad peavad eraldi liituma tagasi kaheks teenuse kogusummaks. Ajakava struktuursed omadused on mõõdetud, mitte eeldatud: teenindatud aeg on kinnitatud mittekahanevaks avade arvu suhtes { "200" } pseudojuhusliku plaani üle kõigi kolme poliitika korral (mitteväljatõrjuva poliitika puhul mitte ilmne, kus lisaava muudab, kes mida hoiab igal hilisemal piiril), ja piiriaritmeetika on kinnitatud puutuva/ühesekundilise kattuvuse paaril, kus ühe võrra eksimine muidu varjuks. Läbimiste ennustaja sild on kontrollitud <c1/> väljundi vastu: ühe ava ja konkureeriva teenuseta võrduvad navigatsiooni ava-sekundid ennustaja enda summeeritud läbimiskestustega. Välist sõltumatut etaloni ei väideta ja ühtegi ei ole: võime asendab käsitsi arvutuse, mitte ei ole selle vastu kontrollitud, kaasasolev kontaktiplaan on illustratiivne, mitte lennanud, ja ükski operatiivne ajastaja ei avalda plaani-pluss-vastuse paari koos oma vahekohtureegli esitusega — esitamata poliitika all arvutatud töötsüklit ei saa võrrelda esitatud poliitika all arvutatuga ning poliitikast sõltuvus on mõõdetud (navigatsiooni töötsüklid 100/150 vs 50/150 identsel plaanil). Pöördeaeg ja ümberlülitusaeg, andmemaht, puhvri olek, energia ja lingi sulgumine on aruande sildis välja jäetud, mitte vaikides modelleeritud

# text
seg-43cd7aa7ab53 = Kuu pinnanavigatsiooni RF-segamine (satelliidipõhine J/S)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Kuu-põhine segaja-signaali suhe, efektiivne C/N₀ ja lukustuse kadu selenograafilise pinnakasutaja jaoks Kuu pinnal asuva (või kõrgendatud) segaja all, illustratiivse avaliku allika Moonlight/LCNS-klassi konstellatsiooni üle. Koostab avatud segamisahela (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) avatud Kuu taevageomeetriaga (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geomeetriat ega radiomeetriat ei tuletata uuesti. Erinevalt Maa liigist <c1/> ei ole signaaliharu fikseeritud vastuvõetud võimsus: iga satelliidi isotroopne vastuvõetud võimsus on selle enda lingieelarve EIRP − FSPL(kaldkaugus), nii et J/S varieerub satelliiditi Kuu kauguse ja kõrgusega. Väljastab ÜHE RIDA IGA NÄHTAVA (epohh, satelliit) LINGI KOHTA JSON-ina ja *.table.csv artefaktina, koos mõlema vastuvõetud võimsusega, mille vahe J/S on, trükituna selle kõrvale; koondnäitajad on selle tabeli kõrval, mitte selle asemel. Käivitatav stsenaariumi liigina <c2/>

# text
seg-2a4393ae7c52 = Koosseisu ristkontroll sõltumatu hoidlasisese koodiraja vastu: iga lingipõhine J/S tuletatakse uuesti kahe lingieelarve vahena, mis on arvutatud funktsiooniga linkbudget::received_signal_power_dbw, mille vabaruumi kadu on üksik avaldis { "20" }·log10(4πRf/c) kolmeliikmelise summa asemel, mida kasutab jamming::free_space_path_loss_db — need ühtivad täpsusega < { "1e-9" } dB igal real (mõõdetud halvim juhtum { "7.11e-14" } dB, st ujukomaümardus). Aluseks olev häireahel, mida see koostab, on eraldi väliselt ankurdatud failis tests/gnss_denied_jamming_resilience_reference.rs (sõltumatu numpy/scipy J/S ja efektiivse C/N₀ uuestituletus, seotud Kaplan & Hegarty §{ "9.4" }-ga, pluss JammerTest { "2024" } mõõdetud C/N₀, Zenodo 10.5281/zenodo.15910563); Kuu geomeetria, mida see koostab, on lunar_service/lunar geomeetria oma sõltumatute etalonidega (sõltumatute etalonidega). Siin kontrollitud suletud kujul samasused: poole väiksem segaja vahemaa lisab igale reale täpselt { "20" }·log10({ "2" }) dB; J/S on kasutaja antenni peasuuna võimenduse suhtes täpselt invariantne, samas kui C/N₀ liigub täpselt selle võimenduse võrra; kõrgusmask ei muuda ühtegi ellujäävat rida bitt-bitilt. Rida ise jääb ReferenceImpl/modelleeritud: puudub mõõdetud Kuu segamiskampaania, mille vastu valideerida, ja konstellatsioon on illustratiivne avaliku allika Moonlight/LCNS-klassi geomeetria, mitte lennanud efemeriid

# text
seg-4c116e25c5c5 = Kuu keelamiskontuur ebakindluse vööndiga mõõdetud C/N₀ hajuvusest

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Aruanne <c1/> ei toetu enam oma keelamiskontuuris ühele skalaarile. See väljastab täieliku mõõdetud soovitud signaali C/N₀ jaotuse satelliidipõhise tabeli üle — n, min, p05, p25, mediaan, p75, p95, max, keskmine, valimi standardhälve ja valimi enda asümmeetria (p95 − mediaan) − (mediaan − p05) — lingipõhiste ridade kõrval, mis on muutmata. Kontuur esitatakse seejärel igal nendest järgustatistikutest MÕLEMA keelamiskriteeriumi all, mida mootor tunneb, mitte kunagi ühe asemel teist: olemasolev võimsussuhte kriteerium (J/S = { "30" } dB, sama lävi, mida kasutavad attack_surface ja tracking_loop, ning kriteerium välja antud Kuu lingisegamise tabeli veeru <c2/> taga) ja lukustuse kao kriteerium (efektiivne C/N₀ langeb tasemele tracking_threshold_dbhz), millega selle aruande enda links[].status veergu hinnatakse. Iga kontuuripunkt antakse keelamistasandi mõlemal teljel — segaja EIRP, mida nõutakse stsenaariumi vahemaal, ja keelamisvahemaa stsenaariumi EIRP juures — nii et vöönd on intervall samadel telgedel, millel kontuuri joonis on joonistatud. Vööndi servad ON contour(p05) ja contour(p95): sama suletud kujul kujutis, mis on rakendatud valimi enda kvantiilidele, mitte valimile sobitatud sigma ega mediaan ± k·stdev, ja aruanne ütleb seda numbrite kõrval stringis band_definition. stdev väljastatakse järjepidevuse huvides ja seda ei kasuta miski. Kvantiil, mille C/N₀ on juba jälgimislävendil või selle all, ei oma lõplikku keelavat J/S; need veerud väljastatakse väärtusega null koos loetud põhjusega, mitte lõpmatuse või kärbitud raadiusena

# text
seg-f7457156f960 = Sisemine kooskõla mootori enda otsefunktsioonidega, mis on kõik, mida see võime ausalt väita saab. Iga kontuuripunkt on suletud kujul pööramine ning iga pööramist kontrollitakse, surudes selle vastuse tagasi läbi OTSEFUNKTSIOONI, millega aruande enda ridu hinnati: J/S veerg läbi jamming::effective_cn0_dbhz (mis peab tagastama tracking_threshold_dbhz täpsusega < { "1e-9" } dB-Hz), vahemaa veerg läbi jamming::free_space_path_loss_db ja jamming::j_over_s_db (sama J/S täpsusega < { "1e-9" } dB), EIRP veerg läbi jamming::j_over_s_db stsenaariumi enda vahemaal. Kontuuri kontrollitakse lisaks olevat keelamishulga PIIR, mitte selle sees olev punkt — lock_status kaotab lukustuse range võrratuse peal, seega mõõdetakse otsus muutuvat tasemelt DEGRADED tasemele LOST üle { "1e-4" } dB J/S-i kontuuri mõlemal pool, mida epsiloni võrra eksinud kontuur ei läbiks. Tugevaim kontroll on lingipõhine, mitte kvantiilipõhine: sama kujutise rakendamine iga rea enda C/N₀-le reprodutseerib aruande olekuveeru täpselt — { "0" } lahknevust { "38" } realt { "38" }-st dokumenteeritud töökohal (kind = lunar-jamming, iga sisend vaikeväärtusega peale jammer.range_m = { "25 000" } m), kus { "26" } rida on LOST ja { "12" } ei ole. Monotoonsus on mõõdetud, mitte eeldatud: { "20 001" } proovi vahemikus [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } rikkumist rangelt kahanevale vahemaale ja rangelt kasvavale nõutavale võimsusele, seega on vööndi kvantiilide järjestus näidatud, mitte väidetud. ExternalDataset on tagasi lükatud ja koos sellega valideeritud: puudub mõõdetud Kuu segamiskampaania, mille vastu keelamisraadiust võrrelda, konstellatsioon on illustratiivne avaliku allika Moonlight/LCNS-klassi geomeetria, mitte lennanud efemeriid, ja kontuuri sisendid (EIRP, segaja võimsus, antenni võimendused, müratemperatuur) on representatiivsed suurusjärgud. ReferenceImpl on samuti kaalutud ja tagasi lükatud — pöördväärtus ja otseavaldis on SAMA algebra, mida loetakse kahes suunas, seega püüab edasi-tagasi teisendus kinni ümberkirjutus- ja märgivead, kuid ei ole sõltumatu realisatsioon; selle nimetamine ristkontrolliks oleks laenatud sõltumatuse samm, mida maatriksi invariandid ennetama on loodud. Mida vöönd annab, on mõõdetud ja tsiteeritud, mitte väidetud: sellel töökohal on üksiku skalaari kontuur { "27.402916" } km ja paneb { "25" } km keelatud poolele kõigi { "38" } rea jaoks, samal ajal kui vöönd { "21.256108" } .. { "29.921360" } km sisaldab töökohta ja annab seetõttu aru lõhest, mida tabel tegelikult näitab. Kahe kriteeriumi lahknemine on samuti mõõdetud — võimsussuhte vöönd ({ "38.186527" } .. { "53.691675" } km) ei sisalda { "25" } km üldse — mistõttu trükitakse mõlemad

# text
seg-2d3944107ba0 = Ristmodaalsuse terviklikkuse monitori tuvastusvõimsus

# text
seg-38bc7c0bfe57 = Aruanne hybrid-optical-rf ütleb, mida ristmodaalsuse hii-ruut monitor tegelikult TUVASTADA suudab, mitte ainult et see läbib veatu juhtumi: minimaalne tuvastatav nihe jälgitava telje kohta (ida, põhi, üles, kell) stsenaariumi esitatud valehäire ja tuvastamata jäänud sündmuse tõenäosustel, selle mõlemal pool olev tuvastusvõimsuse kõver, müravaba nihke kordaja, mille juures realiseerunud statistik esimest korda lävendi ületab, ja nihke tõusu tuvastamise aeg esitatud kiirusel. Vead süstitakse ka läbi päris monitori ning selle tagastatud statistikut raporteeritakse analüütilise ennustuse kõrval

# text
seg-38cabd4921c1 = Üleandmisjärgse kovariatsiooni uuesti kasv häiretaseme piiri suhtes

# text
seg-9287268bbada = Aruanne hybrid-optical-rf avab filtri protsessimüra mudeli ja esitab, kui kaua üleandmisjärgne lahend jääb häiretaseme piiri sisse: mõlema üleandmissuuna jaoks kannab see telgede kaupa kovariatsiooni, mille üleandmine maha jättis, propageerib seda edasi esitatud juhusliku kõnni protsessimüra all ning raporteerib aja, mil katvusega skaleeritud 1σ jõuab horisontaalsete, vertikaalsete ja ajastuse häiretaseme piirideni, milline piir seondub esimesena, dispersiooni kahekordistumise ajakonstandi ning valimina võetud rannasõiduprofiili, mis ületuse sisse võtab. Protsessimüra PSD-d, katvustegur ja häiretaseme piirid on kõik sisendid dokumenteeritud vaikeväärtustega

# text
seg-c85b822227f3 = Välist sõltumatut etaloni ei ole. Ületus on juhusliku kõnni dispersiooni kasvu suletud kujul lahend ning testid arvutavad selle uuesti sõltumatult väärtustest, mille aruanne ise avaldab, mitte emitteri sisemistest andmetest. Algkovariatsioon on bitt-bitilt seotud jäljega, mille olemasolev üleandmisplokk juba raporteeris, nii et rannasõit ei saa propageerida kovariatsiooni, mida keegi teine ei näinud. Protsessimüra PSD-d on MODELLED representatiivsed sisendid ja ületusajad skaleeruvad nendega otse, mida skaleerimistest esitab mõõdetud omadusena, mitte väitena. ExternalDataset on tahtlikult tagasi lükatud: rannasõidu aeg on otsene funktsioon kahest modelleeritud PSD-st ja häiretaseme piiridest, mis on ise representatiivsed, ning mõõdetud Kuu optilise/RF üleandmise rannasõitu, millega võrrelda, ei ole. Sõltumatu etalon nõuaks siin avaldatud üleandmisjärgset kovariatsiooni kasvu või holdover-täpsuse kõverat võrreldava vastuvõtja jaoks koos esitatud protsessimüra mudeliga, kontrollituna tolerantsini

# text
seg-a3b8272862aa = Telje-väline antennimuster Kuu geomeetria ekspordis

# text
seg-27d246503a48 = Satelliidipõhine geomeetriaeksport kannab (epohh, satelliit) kohta telje-välise nurga SATELLIIDIL ja saatmisvõimenduse asukoha suunas päris ühtlaselt valgustatud ringava (Airy) mustrist ning raporteerib kiire sees olevate satelliitide arvu selle mustri all SELLE KÕRVAL kiire sees olevate arvuga sümmeetrilise võimenduse-ribalaiuse lähenduse (θ_3dB[deg] = √(31000/G_lin)) all, mille vahe väljastatakse selgesõnalise paranduse kujul linkides, satelliitides epohhi kohta ja halvima üksikepohhina. Lähenduse mõlemad kaudsed ava efektiivsused väljastatakse ({ "0.641" } vastu reeglit { "70" }·λ/D kraadi, millega seda tsiteeritakse, { "0.920" } vastu ühtlast ringava), nii et efektiivsus, mida see vaikides eeldab, on esitatud, mitte järeldatud. Vaikimisi väljas: plokk ilmub ainult siis, kui on antud nii ekspordi asukoht kui ka ava

# text
seg-6fbfa234ef3e = Jälgimisahela lukustuse kadu ja spuufimise sissetõmme häire all

# text
# c1: tracking-loop
seg-f78c1f28a3f7 = Lukustuse kadu, mis on arvutatud ahela dünaamikast võimsussuhte asemel: kandja (Costas) ja koodi (mittekoherentne vara/hilja) 1σ soojusvärin C/N₀ vastu ruutimiskaoga, esitatud reeglite 3σ_PLL + θ_e ≤ { "45" }° ja 3σ_DLL + tõusu viide ≤ d/2 kiipi vastu; languse ja uuesti lukustumise C/N₀ lävendid koos seostuva ahela nimetusega ja hüstereesiga, mis on DERIVED laiemast sissetõmbe ribalaiusest, mitte väidetud; deklareeritud lukustuse kadumise aeg kahe lävendiga lukustusdetektorist kinnitusviibimistega, raporteeritud eraldi füüsilisest faasipõgenemise ajast (Viterbi keskmine aeg tsüklinihete vahel, kujul log₁₀ s, sest see hõlmab sadu dekaade); suurim koodi kallutus ja kandja Doppleri kiirus, mida ohvri ahelad suudavad jälgida; ning KEELAMISRAADIUS, mida ahela dünaamika eeldab, raporteeritud olemasoleva võimsussuhte raadiuse kõrval, nende märgiga vahega oma nimelise väljana. Käivitatav stsenaariumi liigina <c1/>

# text
seg-69155fb79ebd = Kuu-VLBI jaama koordinaatide kovariatsioon jälgimisgraafikust

# text
# c1: lunar-vlbi-fim
seg-141285301f58 = Viite osatuletised, mis on akumuleeritud baasjoonte × epohhide graafiku üle Fisheri informatsiooni maatriksiks, pööratud jaama koordinaatide kovariatsiooniks ja koordinaadipõhiseks jaama sigmaks, asendades eeldatud isotroopse võrdse jaotuse lingi skalaarse viite korduvtäpsusest. Olek kannab Maaga seotud (ITRS) jaama koordinaate, seega on Jacobi maatriks inertsiaalne osatuletis, mis on pööratud iga epohhi GCRS→ITRS maatriksiga, ja Maa pöörlemine teeb need koordinaadid jälgitavaks — aruanne MÕÕDAB Maaga seotud vaatejoone pühkimist ja majaka deklinatsiooni, mitte ei eelda neid. Aste, datumidefekt, tinglikkuse arv, informatsioonispekter ja vaba võrgu nullruum väljastatakse igal käigul ning astmepuuduse korral avaldatakse peamine sigma väärtusena NULL koos olekuga, mitte ei loeta peaaegu singulaarsest pöördmaatriksist. Võrdse jaotuse väärtus c·σ_τ·√(g/N) SAMA graafiku jaoks trükitakse arvutatu kõrvale nende suhtega, koos isotroopse jälje piiriga √(p/trace(M)), mille AM-HM teeb kõvaks põhjaks. Käivitatav stsenaariumi liigina <c1/>

# text
seg-0f4d023fe2d4 = Kuu pinnapunkti koordinaatide kovariatsioon VLBI viite graafikust, hoitud eraldi Maa jaama omast

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Kolmas datumivalik <c1/>, mis hoiab kõiki Maa jaamu ja hindab ainult MAJAKA Kuu kehaga seotud koordinaate — seadistus, mille jaoks Kuu pinnapunkti ebakindlust tegelikult esitatakse, sest Maa jaamade koordinaadid on viitemudeli sisend, mitte selle tundmatu. See on olemas, sest jaamatasandi kovariatsioon ja pinnapunkti kovariatsioon on ERINEVAD SUURUSED, mida eraldab õlg ρ/B, ja miski ei takistanud varem ühe esitamist teise vastu. Väljastatav plokk <c2/> kannab ρ-d, pikimat baasjoont, õlga, võrdse jaotuse lingi pinnapunkti kuju c·σ_τ·(ρ/B)·√(g/N), arvutatud koordinaadipõhise majaka sigma ja nende suhte — suhe on null, mitte eksitav, kui majakat ei hinnata või maatriks on astmepuudulik. B võetakse PIKIMA olemasoleva baasjoonena, kõige soodsama omana, nii et suhe saab ainult alahinnata. Käivitatav kujul <c3/> koos <c4/>, mis lükatakse tagasi puuduvat sisendit nimetava teatega, kui majakat ei hinnata

# text
seg-18096ae23d96 = Suletud kujul samasused, kusjuures välist sõltumatut etaloni ei väideta ega ole. Õlga kontrollitakse ρ/B vastu ja kahte võrdse jaotuse kuju omavahel täpsusega { "1e-15" } — algebralised samasused, seega püüavad need kinni juhtmestusvea ja mitte midagi muud, ning on nii märgistatud. Sisuline tulemus on MEASURED, mitte väidetud: fikseeritud baasjoone viide piirab majaka SUUNDA, nii et vaatejoone komponent jõuab informatsioonimaatriksi sisse ainult lähivälja kaugusliikme kaudu, ja test loeb saadud anisotroopia väljastatud spektrist, mitte ei tuleta seda. AM-HM teeb √(p/trace(M)) kõvaks põhjaks, nii et isotroopse võrdse jaotuse link saab alati ainult ALAHINNATA ning arvutatud-võrdse jaotuse suhe on täpselt anisotroopia, mille see kõrvale heitis. MEASURED Goldstone'i-laadse/Canberra-laadse paari kohta, mille kõõl on { "10726.748" } km: { "112" } valimina võetud päeva jooksul { "36" } ei luba üldse ühtki vastastikku nähtavat epohhi { "10" }° maskil, kõige rohkem vastastikku nähtavaid on { "17" } 49-valimilisest graafikust, ja { "73" } elujõulisel päeval jookseb kolmekomponendiline suhe väärtuselt { "113.9" }× nelja suurusjärgu võrra suuremani, mediaan { "1513" }×, samas kui piirdumine kahe põiksuunaga, mida vaatejoon ei jäta informatsioonita, annab { "3.94" }× kuni { "25.8" }×, mediaan { "7.8" }×. MIDA SEE RIDA EI VÄIDA: ühtegi neist numbritest päris kampaania omadusena. See tõendab, et pinnapunkti suurus on nüüd ARVUTATUD, mitte eeldatud, ja et seda ei saa vaikides jaamatasandi omaga vahetada. Jääb ReferenceImpl/MODELLED: avaldatud Kuu-VLBI pinnapunkti kovariatsiooni, mille vastu valideerida, ei ole, jaamad ja majaka asukoht on illustratiivsed, mitte mõõdistatud, ning efemeriid, kellad, troposfäär ja Maa orientatsiooniparameetrid hoitakse FIKSEERITUNA, seega on see Cramér-Rao piir vähendatud parameetrikomplekti jaoks ja iseenesest optimistlik. Sama suurus tuumateel (majakas DE440 Kuul) on valideeritud oma real „…, tuumatee“; sellel analüütilisel teel on väikseim majaka sigma { "3.9" } % selle rea SPICE-i sõltumatust etalonist madalam, mistõttu see rida jääb MODELLED

# text
seg-8958521eedf7 = Kuu pinnapunkti koordinaatide kovariatsioon VLBI viite graafikust, tuumatee

# text
# c1: lunar-vlbi-fim
seg-8ac12ca0f272 = Stsenaariumi lunar-vlbi-fim kõigi jaamade fikseeritud majaka kovariatsioon (iga Maa jaam hoitud, majaka Kuu kehaga seotud koordinaate hinnatakse üksi), majakas paigutatud JPL DE440 Kuule, mida loeb mootori enda tuumalugeja (planetary_kernel_path; lunar_vlbi_fim::epoch_geometry_with, ephem_provider::KernelEphemeris). Ainult Kuu keskpunkt erineb analüütilisest teest; IAU { "2015" } keha pöörlemine, jaamad, Maa pöörlemine ja lineaaralgebra on samad. Valideeritud väljundid on vaatlushulk, { "3" } x { "3" } informatsioonispekter, aste ja tinglikkuse arv, kolm kehaga seotud majaka sigmat ja nende RMS, õlg ning arvutatud-võrdse jaotuse suhe vaikimisi graafikul. Käivitatav stsenaariumina <c1/> koos datum = "all-stations-fixed", estimate_beacon = true ja seatud planetary_kernel_path

# text
seg-0315968c8214 = Kuu diferentsiaalne PNT — korrektsioonilingi jääkeelarve

# text
seg-c6785166a44c = Kolm liiget, mille diferentsiaalkorrektsioon omandab epohhi, mil see arvutatakse, ja epohhi, mil seda kasutatakse, vahel, igaüks varem jäetud modelleerimata varuks: etalonjaama mõõdistusviga (korreleeritud satelliitide üle, baasjoonest sõltumatu, ~{ "1" }:{ "1" } asukoha ülekanne ja tõestatavalt DOP-i poolt võimendamata), korrektsiooni vananemine (külmutatud orbiidivea vektor, mis on uuesti projitseeritud vaatejoonele, kuhu mootori enda propageerija satelliidi ühe latentsuse võrra hiljem paneb, pluss c·σ_y(τ)·τ kella triiv kalibreeritud astmeseadusest) ja ühtlane lingi kvantimine täpsel ±(orbit_err + clock_err) täisskaalal dispersiooniga step²/12. Raporteeritud nii kauguse kui ka asukoha valdkonnas, olemasoleva jäägi ja kaitsetaseme kõrval — mitte kunagi nende asemel —, latentsuskõveraga üksiku numbri kõrval

# text
seg-29b8e6c12471 = Suletud kujul samasused ja enesekooskõla: ühtlase kvantiseerija dispersioon step²/12, täpne (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ kovariatsiooni propageerimine, mis kukub võrdsete σ korral kokku väärtuseks σ·PDOP, mõõdistusliikme { "1" }:{ "1" } ülekanne järelduses û_user ≈ û_ref ning väljalülitamise ruutsulgumine. PDOP-i ristkontroll orbit::dop vastu jagab normaalmaatriksit [−û, { "1" }], seega on see kooskõlakontroll ja on nii märgistatud, mitte sõltumatu etalon. ExternalDataset ei ole saadaval ega väidetud: ühelgi Kuu pinnajaamal ei ole avaldatud mõõdistustäpsust, ühel Kuu diferentsiaalkorrektsiooni lingil ei ole avaldatud latentsust ega sõnumivormingut ja kvantimistulemus on suletud kuju, mitte mõõtmine. RTKLIB — juba välise koodi etalon üksikdiferentsi ja kaalutud vähimruutude tuuma jaoks — võiks käivitada tahtlikult valesti mõõdistatud baasiga, et kinnitada { "1" }:{ "1" } mõõdistusülekannet, kuid see on sõltumatu kood sama esimest järku vaatejoone algebra üle. SUURUSED ON MODELLED: mõõdistuse vaikeväärtus on selle crate'i enda Kuu tugisüsteemi realisatsiooni eraldis, mitte mõõdetud jaam, latentsus ja bittide arv on ILLUSTRATIVE sisendid ning edastatava efemeriidi vea VEKTORI enda kasvu ei modelleerita üldse — see on esitatud väljastatavas vananemisseaduse stringis, sest see on liige, mis päris lingil kõige tõenäolisemalt domineerib

# text
seg-c42646ae4707 = Kuu etalonjaama katvuse ja täpsuse kaart

# text
# c1: lunar-station-coverage
seg-1f9834b32629 = Kuu diferentsiaalse PNT mudeli Monte Carlo pühkimine lõunapooluse kasutajaruudustiku ja ühe päeva epohhide üle (liik <c1/>): diferentsiaalse etalonjaama jaoks teadaolevas lõunapooluse asukohas punkti kaupa ja piirkonna üle protsentiil korrigeeritud ja korrigeerimata asukohaviga (3-D, horisontaalne, vertikaalne), kättesaadavus koos põhjusega iga kättesaamatu epohhi kohta (user_lt4, station_missing_sat), katvus enne käivitust esitatud lävendi vastu, DO-229E kaitsetasemed, katvusraadius asimuudisektori kaupa ning korrektsioonilingi eelarve jaamas ja halvimas punktis. Ei ole väide ühegi päris süsteemi toimivuse kohta; ei ole seotud ühegi asutusega ega heaks kiidetud ühegi asutuse poolt

# text
seg-7ecf4b0038b0 = Kuu maastiku horisondimaskid esitatud profiilist või polaarsest DEM-ist

# text
seg-7102948907bc = Asukohapõhised asimuudist sõltuvad horisondimaskid liigi lunar-station-coverage jaoks (etalonjaam ja iga kasutajapunkt) ning moonlight-service-volume ruudustiku ja selle satelliidipõhise ekspordiasukoha jaoks (iga eksporditud rida saab välja clears_terrain), vormingus { "0.36" } skyline-tabel (skyline::Skyline, lineaarne asimuudis ümbermähkimisega nurgal { "360" } kraadi; esitatud profiil ja DEM-horisont ühes asukohas kombineeritakse nende punktiviisilise maksimumina): esitatud [terrain] station_horizon või user_horizon märgistatud oma allikaga ja/või horisont, mis on kiirelt läbi käidud lõunapooluse stereograafilisel DEM-il (LRO LOLA ruudustikuga polaarpaigutus, loetud kirjeldajast, mis fikseerib selle suuruse ja SHA-256, või laiuskraadi/pikkuskraadi realdata::lola_dem tahvel koos [terrain] dem_tile_path, kajastatud oma SHA-256-ga) mööda Kuu sfääri suurringe täpse kõverusega, esitatud mastikõrguselt, esitatud asimuudisammu ja ulatusega. Satelliit loetakse asukohas arvesse, kui see ületab lameda maski mask_deg ja horisondi oma asimuudil (lunar_service::topocentric); epohh, mille horisont jätab punktis alla nelja satelliidi, kus lame mask annab neli, loetakse kättesaamatuks põhjusega terrain_masked. Kaasasolev DEM on avaliku domeeni LOLA LDEM_75S_240M toote lõige, { "5" } x { "5" } plokikeskmisena ümberproovitud kauguseni { "1200" } m (data/lunar-dem/NOTICE.md). Puudumisel hoiab iga asukoht lamedat maski ja iga dokument on baidi-identne

# text
seg-d37bb01e270b = Kuu etalonjaama mitmeteelevi ja vastuvõtjariistvara liikmed

# text
seg-1103199f019b = Valikuline [receiver] jaotis liigil lunar-station-coverage (LRS-02): kõrgusest sõltuv mitmeteelevi sigma(el) = a + b exp(-el / el0) kasutajal ja jaamas (RTCA DO-229 õhusõiduki funktsionaalne kuju, selle a = { "0.13" } m, b = { "0.53" } m, el0 = { "10" } kraadi vaikeväärtustena; Kuul on iga väärtus ILLUSTRATIVE), valge kasutajal ja esimest järku Gauss-Markov epohhide üle jaamas (rho = exp(-dt / tau)); vara-miinus-hilja DLL soojuslik koodimüra sigma = L_c sqrt(B_L d / ({ "2" } C/N0) ({ "1" } + { "2" } / (({ "2" } - d) T C/N0))); kanalipõhised kanalitevahelised nihked, mis on katse jooksul konstantsed, kasutajal ja jaamas. Jaama liikmed sisenevad selle korrektsioonidesse, kasutaja liikmed toores ja korrigeeritud mõõtmistesse, igaüks oma algväärtusega (seed) vool. Puudumisel on iga dokument muutmata

# text
seg-4fbc7d86b491 = Mudeli enda tõmmete suletud kujud ja statistikud (InternalConsistency): DLL valem käsitsi arvutuse vastu, DO-229 kuju, kahe vastuvõtja nullbaasjoone vahe, Gauss-Markovi viivitus-1 korrelatsioon. Kuu mitmeteelevi ega vastuvõtja mõõtmist, millega võrrelda, ei ole; väärtused on ILLUSTRATIVE ja mitte miski siin ei ole väide ühegi päris vastuvõtja kohta

# text
seg-03796cb741b6 = Kuu etalonjaama efemeriidivea kasv korrektsiooni latentsuse jooksul

# text
seg-13b0ae9a874a = Valikuline orbit_err_growth_m_per_s sisend liigil lunar-station-coverage (LRS-03): korrektsioon, mis on rakendatud latency_s pärast selle arvutamist, jätab märkamata edastatava orbiidivea kasvu g latency_s, g isotroopne 3-D RMS kiirusega, tõmmatud satelliidi ja katse kohta oma algväärtusega (seed) voolul (vahemiku 1-sigma kiirus tau / sqrt({ "3" })), külmutatud vea vaatejoone uuesti projitseerimise peale. Puudumisel on iga dokument muutmata. Avaldatud väidete võrdluse K5 lisa, eelregistreeritud üksi, käivitab K5 kiirustel { "0.001" }, { "0.01" } ja { "0.1" } m/s (ILLUSTRATIVE)

# text
seg-90307f07e0ef = Kuu etalonjaama lahendusrežiimid: kõrguspiirang, kolm satelliiti, staatilise kasutaja aken

# text
seg-366c7ad03fb2 = Liigi lunar-station-coverage valikuline [solution] jaotis (LRS-06): kõrguse pseudomõõtmise rida up . dx = e_h esitatud 1-sigmaga, kaalutud kauguseridade suhtes, kolme satelliidi miinimum lubatud ainult sellega ning kaalutud vähimruutude lahend viimase window_epochs epohhi üle jagatud staatilise asukoha ja ühe kellaga epohhi kohta (filtri vastus staatilisele asukohale ilma protsessimürata samade andmete üle; epohhide vead käsitatakse sõltumatutena). Puudumisel on hetktõmmise lahend ja iga dokument muutmata. Avaldatud väidete võrdluse lisa allikate lahendusstiiliga, eelregistreeritud üksi

# text
seg-611ba369ed00 = Kuu etalonjaama täpsus ja katvus avaldatud väidete vastu

# text
seg-4fe4f1cffa2b = Liik lunar-station-coverage käivitatuna Kuu diferentsiaalse etalonjaama avaldatud materjali avalike eelduste all (neli navigatsioonisatelliiti { "24" } h külmutatud elliptilistel orbiitidel, { "10" } m { "95" } % SISE, { "0.30" } m koodimüra, { "1" } s ja { "600" } s korrektsiooni latentsus, detsimeetri-alune jaama mõõdistus, avaldatud näidisjaama asukoht, { "300" } km ja { "600" } km lõunapooluse ringid) ning hinnatud allikate arvuliste väidete vastu kuue ühepoolse lävendi all, mis on eelregistreeritud enne käivitust: kogu lõunapooluse katvus meetri-aluse p95-ga (K1, K2), meetri-aluse ja detsimeetritaseme korrigeeritud p95 (K3, K4), meetri-alune hoitud latentsusel { "600" } s (K5) ja täpsus hoitud baasjoonel { "10" } km kuni { "500" } km (K6)

# text
seg-478225d0a8e1 = Kuu ARAIM-i kaitsetaseme tuum

# text
seg-863690a44f21 = Kuu kaitsetaseme geomeetria-kovariatsiooni samm — (GᵀG)⁻¹ kogu nähtava ja iga üksikvea alamgeomeetria üle, projitseeritud kohalikule vertikaalile ja horisontaalploki jäljele — ning selle statistiline tuum: Bonferroni detektori kordaja, iga veahüpoteesi Gaussi ülemine saba ja juurelahendus, mis kujutab terviklikkuse riski eelarve kaitsetasemele, 7-punktilise Kuu teenuseruumala üle

# text
seg-8191906fc700 = Kaks väljakujunenud kolmanda osapoole realisatsiooni koostatud, mõlemad käivitatud võrguühenduseta, testkomplekt regenereeritud otsast lõpuni ja kontrollitud baidi-identseks. RTKLIB 2.4.2-p13 (T. Takasu, BSD-2-Clause), commit 71db0ff, src/rtkcmn.c kompileeritud C lähtekoodist valikuga -ULAPACK: lsq() → matinv() → ludcmp()/lubksb() pöörab normaalmaatriksi Crouti LU-ga osalise pivoteerimisega, algoritm, mis ei ole seotud kshana käsitsi kirjutatud Gauss-Jordani invert4()-ga; numpy.linalg.inv (LAPACK getrf/getri) pöörab iga ühe uuesti kolmanda sõltumatu pöördmaatriksina, ühtides RTKLIB-iga suhtelise täpsusega { "1.112e-12" }. SciPy { "1.17.0" } / NumPy { "2.4.1" } (BSD-3-Clause) annavad norm.isf, norm.sf (Cephes ndtri/ndtr) ja optimize.brentq kshana Numerical-Recipes mittetäieliku gammarea, poolitusega pööratud ja 200-sammulise poolituse vastu — ja SciPy otsene sf on teistsugune numbriline tee sügavasse sappa kui kshana { "1" } − Φ, nii et sügava saba tühistamine on mõõdetud, mitte peegeldatud. Vertikaalne telg on radiaalne ühikvektor (kohaliku vertikaali definitsioon sfäärilisel Kuul) ja horisontaalne dispersioon on horisontaalploki jälg, nii et ida/põhja asimuudikokkulepet ei jagata. SELLE RIDA POOLT EI OLE SELGESÕNALISELT VALIDATED: σ_URE, satelliidipõhine veaeelne tõenäosus ja illustratiivne Moonlight/LCNS-klassi konstellatsioon on MODELLED sisendid, mis on antud sõltumatule etalonile (sõltumatule etalonile) sellisena nagu need on; ning ühe vea MHSS terviklikkuse võrrandi KUJU on ümber kirjutatud samast avaldatud piirist, mida kshana realiseerib — ühine suletud kuju on ühine eeldus, seega katab see rida selle võrrandi vale hindamist, mitte selle vale valikut. Ühtegi kolmanda osapoole MHSS ARAIM realisatsiooni ei ole kättesaadav (RTKLIB ei paku kaitsetaseme sisenemispunkti, sellist PyPI distributsiooni ei ole, Stanfordi MAAST on MATLAB), mis on ootel täiendus

# text
seg-0ec1699f5754 = ARAIM MHSS kaitsetasemed avaldatud etalonvektorite vastu

# text
# c1: araim-reference-check
seg-fbaaf3ad7648 = Mitme hüpoteesi lahendiseparatsiooni kaitsetaseme võrrand ise: kogu nähtava ja veamoodi kaupa kaalutud vähimruudud ida/põhja/üles geomeetrial ühe kellaolekuga konstellatsiooni kohta, alamlahendite sigmad, lahendiseparatsiooni sigmad ja ühepoolsed nominaalsed nihkeprojektsioonid, Bonferroni K_fa lävendid, jälgimata vea riski jaotus ning VPL/HPL, mis lahendavad terviklikkuse riski võrrandi. Käivitatav stsenaariumi liigina <c1/>

# text
seg-483b91a7aace = EL-USA töörühma C ARAIM tehniline alamrühm, Reference Airborne Algorithm Description Document v3.1 ({ "20" }. juuni { "2019" }), lisa D läbitöötatud arvnäide — avaldatud SISENDID (10-satelliidi 2-konstellatsiooni geomeetriamaatriks, C_int/C_acc diagonaalid, b_nom, P_sat, P_const, LPV-200 konstandid) ja avaldatud VÄLJUNDID (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } ja kuus konstellatsiooni vea vahetulemust), hangitud 2026-09-20, allika SHA-256 7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7. Ühtib etaloni ENDA esitatud tolerantsil TOL_PL = { "5e-2" } m: VPL { "0.0074" } m, HPL { "0.0437" } m; EMT ja σ_v_acc nende trükitud täpsuseni. Sama alamrühma Milestone { "3" } Report ({ "2016" }) lisa A §A.IX esitab sama näite, kuid on sisemiselt vastuoluline — märgitrükiviga G rea { "3" } juures (+{ "0.7477" }, kus { "2019" } dokument trükib −{ "0.7477" }; plussiga tuleb dokumendi enda σ_v_acc { "0.8690" } m vs selle avaldatud { "1.47" } m) ja K_fa_3 hinnatud { "57" } veamoodi jaoks, kuigi dokument esitab N_fault_max = { "1" }, st { "12" }, nii et selle EMT järgib 57-moodi lävendit ja selle VPL/HPL mitte. Ükski standardit järgiv realisatsioon ei suuda reprodutseerida kõiki selle väljundeid korraga. Selle geomeetria vahetulemused reprodutseeruvad täpselt ja selle kaitsetasemed on kirja pandud mõõdetud lahknevustena (VPL { "0.0171" } m, HPL { "0.0842" } m, EMT { "0.4806" } m), välja jäetud vastuvõtunäitajast; tolerantsi ei laiendatud nende neelamiseks. ULATUS: ainult N_fault_max = { "1" } — mitme sündmuse veaalamhulgad lükatakse tagasi, mitte ei kärbita, ning välistamine, hii-ruut kooskõlakontroll ja topeltlugemise ümberjaotuse samm jäävad MODELLED

# text
seg-7bfcb5c6a985 = ARAIM samaaegsete mitme satelliidi veahüpoteesidega

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2 alamhulga määramise reegel (P_THRES, FC_THRES, jälgitavad alamhulgad vähim eemaldatud esimesena) üldistatud paaridelt samaaegsetele kombinatsioonidele kuni max_order satelliidi ja konstellatsiooni sündmusest, täpse eelnevaga P_no fault prod q_e; add_v42_protection_levels_to_order käivitab sellel ADD v4.2 kaitsetaseme tee (järk { "2" } on olemasolev tee täpselt). raim::araim_subset_raim (nõusolekul): arenenud RAIM selle hüpoteesihulga üle, iga jälgitav alamhulk üks (p_fault, T, b, sigma) moodus terviklikkuse riski summas, jälgimatud alamhulgad viidud jälgimata riski alla, eelarve skaleeritud ADD jälgimata riski jaotusega ning suurima normaliseeritud separatsiooniga alamhulk raporteeritud, kui viga tuvastatakse. Eelnevad, mis vajavad sügavamaid alamhulki kui max_order, lükatakse tagasi, mitte ei kärbita

# text
seg-6c6076ea1eee = Sisemine kooskõla (InternalConsistency): järgu 2 taandamine MAAST-iga kontrollitud ADD v4.2 teele, eelnevate sõltumatu uuestituletus ja konstrueeritud kahe satelliidi viga. MAAST-i ega RTKLIB-i käiku üle paaride ei ole tehtud, seega sügavamaid hüpoteesihulki ja alamhulga RAIM-i kaitsetasemeid ei ole väliselt kontrollitud. araim_subset_raim jagab araim_dual_raim lihtsustusi (üks sigma terviklikkuse ja täpsuse jaoks, üks kell, lihtne normaalsaba): see ei järgi ADD-d

# text
seg-48ca01332f8f = RAIM kella holdover-kvaliteedinäitajate kõrval

# text
seg-890f1006a75d = Kella liigi valikuline [integrity] jaotis (clock_integrity::run): esitatud asukohast ja konstellatsiooni eelseadistustest (geometry::sky_geometry), igal terviklikkuse epohhil, kui GNSS-i ajajoon ei ole keelatud, hetktõmmise RAIM (raim::snapshot_raim: pariteedi hii-ruut test, tõusu kaitsetasemed) maski kohal olevatel satelliitidel algväärtusega (seed) Gaussi jääkidega esitatud sigmaga ja valikulise esitatud nihkega; eraldi plokk integrity_fom epohhipõhiste otsuste, kaitsetasemete ja kättesaadavusega. Keelatud epohhid raporteeritakse kättesaamatutena, mitte kunagi ekstrapoleerituna; holdover-kvaliteedinäitajad on muutmata ja ilma jaotiseta on väljund baidi-identne

# text
seg-c2860bf4b562 = Sisemine kooskõla (InternalConsistency): kaitsetasemed on snapshot_raim omad, mis on valideeritud RTKLIB-i vastu oma real, arvutatud uuesti samal geomeetrial; veatu ja süstitud vea käitumine. Taevas on representatiivne eelseadistatud geomeetria (mitte dateeritud almanahh), jäägid on sünteetilised ning sigma, häiretaseme piirid ja tõenäosused on esitatud sisendid; mitte miski siin ei ole väide päris vastuvõtja kättesaadavuse kohta

# text
seg-9cbb4ee7588a = Ruumiline, mürarikas, mitme perekonna tsislunaarne kaarepikkuse jälgitavus

# text
seg-5ebd771deef8 = Tsislunaarne kaarepikkuse jälgitavuse lävi RUUMILISES kuue olekuga CR3BP-s tasapinnalise nelja olekuga asemel, DRO, L2 halo ja L2 peaaegu sirge halo perekondade üle, mõõtemüraga Gramiani sees ja KAHE kriteeriumi raporteerimisega, sest ühtegi ausat ühte ei ole: avaldatud astmekriteerium, mis on tõestatavalt invariantne homoskedastilise mõõtmissigma suhtes (valgendamine korrutab jälgitavuse maatriksi skalaariga, jättes suhtelise singulaarväärtuste spektri ja seega astme, defekti ja tinglikkuse muutmata), ja hinnatavuse kriteerium — esimene kaar, mille juures peasatelliidi algoleku formaalne 1σ asukohaebakindlus langeb alla esitatud piiri — mis on see, mis müraga liigub. Iga lävi kannab epohhiruudustiku vahemikku, milles see asub; saavutamata kriteerium on null koos põhjusega. Tasapinnaline režiim jääb vaikimisi ja tasapinnaväliseid perekondi seal tagasi lükatakse, mitte ei lameda olekuks, mis neid esitada ei suuda

# text
seg-046231819882 = Sõltumatu rea-ešelonivormi aste Gaussi elimineerimisega osalise pivoteerimisega kinnitab iga kuue oleku astme otsuse — erinev algoritm, mis ei jaga koodi testitava omaväärtus/SVD teega. { "6" }×{ "6" } CR3BP olekuülemineku maatriks, mida see koostab, kannab oma ReferenceImpl sõltumatut etaloni SciPy variatsioonilise integreerimise vastu ning halo/NRHO algtingimused tulevad korrektorist, mis reprodutseerib avaldatud L2 lõunapoolse { "9" }:{ "2" } Gateway orbiidi. Olemasolevat ruutjuur-informatsioonifiltri haru EI loeta selgesõnaliselt kinnituseks: see tarbib samu Jacobi maatrikseid ja taandub samale normaalmaatriksile, seega on see kooskõlakontroll kahe numbrilise masina vahel ning väljastatud laiendussilt ütleb seda. EI OLE väliselt ankurdatud ja ExternalDataset on seetõttu tagasi lükatud, mitte laenatud STM-i realt: lävekaarte pikkused ise sõltuvad MODELLED konstellatsiooni kavandist, epohhiruudustikust ja — mõõdetavalt kuni { "40" }× — singulaarväärtuse tolerantsist. Avaldatud tasapinnaline { "2.09" } h reprodutseeritakse täpselt tasemel rel_tol = { "1e-6" } ja on ise tolerantsist sõltuv ({ "10.25" } h tasemel { "1e-4" }, { "0.42" } h tasemel { "1e-8" }), mis on kriteeriumi, mitte orbiidi omadus. Ükski avalik andmekogum ei avalda kaarepikkuse jälgitavuse lävendit valitud tsislunaarse konstellatsiooni jaoks. MEASURED RESULT: ruumiline kuue olekuga lävi on { "22.17" } h L2 NRHO jaoks ja { "40.42" } h L2 halo jaoks ning EI OLE OLEMAS tasapinnalise DRO perekonna jaoks, mille põhjal avaldatud väide tuletati — aste { "4" } { "6" }-st datumidefektiga { "2" } ja kahe täpselt nullilise omaväärtusega, struktuurne defekt, mida ükski kaarepikkus ei taasta

# text
seg-e250321394bc = Operatiivse stiiliga Maa orientatsiooni ennustusviga, mõõdetud ennustatud-vs-lõplik

# text
seg-0e443d241460 = Vähimruutude nihke-pluss-kiiruse sobitus järgneva akna üle pluss peamised perioodilised liikmed — aastane, poolaastane ja kaks peamist tsonaalset loodet UT1 jaoks; Chandler, aastane ja poolaastane pooluse jaoks — ekstrapoleeritud viimase aknasisese jäägi edasikandmisega: klass, mida IERS Bulletin A kasutab, avaldatud horisondi aluseks olnud püsivusennustaja asemel. Hinnatud ainsal ausal viisil: ennustus T+h jaoks, mis on ehitatud kiiretest Bulletin A ridadest hetkel T või enne seda, mõõdetud HILJEM AVALDATUD Bulletin B lõpliku väärtuse vastu hetkel T+h, koos püsivusega, mida hinnatakse identsel epohhihulgal identsete lõplike väärtuste vastu kõrvuti. Sihtepohh ilma avaldatud lõpliku väärtuseta jäetakse välja, mitte ei hinnata uuesti kiire veeru vastu; periodiline liige, mida aken ei suuda piirata, raporteeritakse tagasilükatuna koos tsüklitega, mida see tegelikult katab; mittetäielik aken lükatakse tagasi, mitte ei lühendata vaikides

# text
seg-f4efd94dd746 = Kuu tugisüsteemi datum vaatluskampaaniast

# text
# c1: lunar-frame-campaign
seg-a6972eb89d7d = Seitsmeparameetriline Helmerti datum, mis on propageeritud SIMULEERITUD VAATLUSKAMPAANIAST, mitte ei ole taastatud süstitud teisendusest. Maa jaamad vaatlevad allikaga kataloogi Kuu pinna majakatest selgesõnalise graafiku järgi; Kuu-VLBI viite osatuletised akumuleeritakse majaka koordinaatide Fisheri informatsiooni maatriksiks ja surutakse läbi Helmerti disaini A = [I₃ | [p]ₓ | p] maatriksiks H = AᵀM_bA, nii et raporteeritud datumi täpsus on vaatlusprogrammi funktsioon — täpselt lineaarne viite sigma suhtes ja monotoonne kaares läbi libratsiooni, mida aruanne MÕÕDAB. Datumidefekt on teema, mitte joonealune märkus: aste, defekt, tinglikkuse arv, spekter, jälgimatud suunad seitsmeparameetrilises baasis, nõrgim suund isegi täisastme korral ja iga parameetri osa sellest väljastatakse igal käigul ning iga parameeter, mida kampaania ei piira, avaldatakse väärtusena NULL koos olekuga. Majaka vea korrelatsioon on MEASURED, mitte eeldatud — täpselt null fikseeritud jaamadega ja trükitud oma hinnaga, kui neid hinnatakse. Käivitatav stsenaariumi liigina <c1/>

# text
seg-ca481f2d8f9e = Tsislunaarse kaarepikkuse lävendi sõltumatu hindaja kinnitus

# text
# c1: cislunar-arc-recovery
seg-3d5fbf896209 = Partii vähimruutude hindaja, mis TAASTAB peasatelliidi algoleku simuleeritud satelliitidevahelistest mõõtmistest kasvavate eesliidete üle sama epohhiruudustiku, mida kasutab aste-vs-kaar tabel, mõõtmise osatuletistega, mis on võetud koostatud otsemudeli keskmiste lõplike vahedena. See ei tarbi midagi masinavärgist, millega lävi mõõdeti — ei analüütilist Jacobi rida, ei variatsioonilist olekuülemineku maatriksit, ei singulaarväärtuse ega omaväärtuste lahutust, ei astme tolerantsi, ei ruutjuur-informatsioonifiltrit — ja jagab ainult dünaamikat, algtingimusi, skalaarset vaadeldavat suurust ja epohhiruudustikku, igaüks nimetatud väljastatavas dokumendis. Kaks kriteeriumi, mõlemad pühitud: müravaba taastus (astme analoog) ja Monte Carlo hinnatavus (hinnatavuse analoog, mõõdetud teadaoleva tõe vastu, mitte ennustatud kovariatsioonist). Käivitatav stsenaariumi liigina <c1/>

# text
seg-60e30948cee7 = Eraldi hindaja selles koodibaasis teistsuguse algoritmi ja lahutatud koodirajaga: mittelineaarne kaalutud Gauss-Newton lõplike vahede osatuletistega, selle otsus loetud mõõdetud oleku taastamise veana km-des ja mm/s. Sellel ei ole ühtki avaldist ühist Gramiani astme-ja-kovariatsiooni teega ning eraldatus on KINDLUSTATUD lähteteksti valvega, mitte väidetud. MEASURED avaldatud tasapinnalisel DRO ruudustikul: HINNATAVUSE kriteerium on CORROBORATED — mõõdetud Monte Carlo piir on { "5.739130" } h vs formaalne { "5.739130" } h (suhe { "1.0000" }) ja mõõdetud RMS reprodutseerib formaalse 1σ { "21" } kaarepikkuse üle geomeetrilise keskmise suhtega { "0.9804" }. ASTME kriteerium EI OLE kinnitatud taastatavuse piirina: hindaja taastab alates { "0.782609" } h vs Gramiani { "2.086957" } h, suhe { "0.375" }, ja kohal { "1.826087" } h — viimane eesliide, mille astmelugemine hindab { "3" } { "4" }-st — taastab täpsusega { "1.96e-5" } a priori nihkest. Taastamispiir on kolme dekaadi jooksul oma piiri kohta liikumatu, samal ajal kui astmelävi ulatub „mitte kunagi“ kuni { "0.782609" } h nelja dekaadi jooksul rel_tol kohta ja need kaks langevad täpselt kokku tasemel rel_tol = { "1e-8" }. See ulatus kirjati esmalt kui jõudev tasemele { "0.260870" } h; see number oli ARTEFAKT, mille tekitas astmelugemine, mis luges { "4" } suunda { "2" } mõõtmisrealt f64 mürapõhja all, ja see on siin parandatud, mitte jäetud seisma. Astmelugemine on nüüd piiratud Sylvesteri võrratusega koos väljastatud põhjusega ja parandatud ulatus küllastub täpselt kaarel, kus sõltumatu hindaja taastab, mis tugevdab selle rea ristvalideerimist, mitte ei nõrgenda seda: avaldatud { "1e-6" } on konservatiivne singulaarväärtuse KOKKULEPE, mitte väide taastatavuse kohta. Sama muster ruumiliselt: NRHO { "9.290323" } h vs { "21.677419" } h, halo { "22.978723" } h vs { "39.829787" } h, hinnatavus ühtib täpselt mõlemas. Tasapinnalise DRO kuue olekuga taastus ei toimu ühelgi kaarel, reprodutseerides sõltumatult selle perekonna struktuurse datumidefekti hindajast, kellele sellest midagi ei räägitud. EI OLE väliselt ankurdatud — dünaamika ja algtingimused on jagatud testitava analüüsiga ja ükski avalik andmekogum ei avalda sellist lävendit — seega on ExternalDataset tagasi lükatud

# text
seg-f839285852d9 = Kuu teenuseruumala päris, hangitud konstellatsiooni geomeetriast

# text
# c1: ephemeris_path
seg-c3059fcced49 = Võtab vastu tabelarvulise Kuu keskpunktiga olekuefemeriidi (SPK/BSP tuuma hinnang) või avaldatud konstellatsiooni definitsiooni valiku <c1/> taga, käivitab selle vastu identse katvuse / DOP / kaitsetaseme pühkimise ning väljastab sellest tuleneva σ_URE kaugusmõõtmise nõude muutmata illustratiivse Kepleri ja häiritud tulemuse KÕRVAL, erinevusega oma nimelise suurusena. Iga number kannab päritoluklassi, mis eristab tuumast tuletatud, avaldatud elementidest tuletatud ja modelleeritud, nii et neid ei saa allavoolu tsiteerimisel kunagi segi ajada

# text
seg-36a6cfaf5afa = Ühik ja päritolu deklareeritud iga raporteeritud suuruse jaoks

# text
# c1: inherits-scenario-label
# c2: depends-on-input
seg-12460501e82b = Masinloetav skeem, mis annab ühiku, päritoluklassi ja definitsiooni iga stsenaariumiaruande iga arvulise välja jaoks, pluss üks globaalne värav, mis käivitab iga registreeritud stsenaariumi liigi ja ebaõnnestub, kui väljastatud arvulisel väljal puudub kumbki. Päritolusõnavara on suletud ja iga klass kannab tõendustaset, kusjuures kaks klassi on tahtlikult seotud väärtustega <c1/> ja <c2/>, mitte ei ole neile antud taset, mida klass ei määra

# text
# c1: m
# c2: _m
# c3: sweep-nd
# c4: mixed - see note
# c5: key_units
# c6: metric_units
# c7: unit
# c8: cislunar-observability
# c9: units
seg-a8c4a6fd4989 = Väljastatud dokument ise: iga arvuline leht peab lahenduma kirjeks selle dokumendi enda units-plokis. Välist ühikute registrit, mille vastu DEKLAREERITUD ühikut kontrollida, ei ole, seega on deklareeritud ühik üle vaadatud väide, mitte kontrollitud — värav kontrollib TÄIELIKKUST ja KORREKTSET VORMI, mitte tõesust, ja valideeritud oleks vale, sest miski väline ei kinnita, et <c1/> on õige ühik väljale nimega <c2/>. Sõltumatu nimesufiksi ristkontroll tehti { "1,434" } väljal, mis olid kirjeldatud SELLEL HETKEL: { "691" }-st, mis kandsid ühikut kandvat sufiksit, lahknevad { "40" } deklareeritud ühikust ja kõik { "40" } on seletatud (sekundipõhised sufiksid, miinimumid, ava-sekundid, njuutonmeetrid nanomeetri moodi sufiksi vastu), seega ei ilmnenud ühtegi valet ühikut. Seda ristkontrolli ei ole sellest ajast uuesti tehtud ja katvus on selle ületanud — number on jäetud sellele, mis tegelikult mõõdeti, mitte ümber esitatud praegusele kogusummale. Selle muudatuse ajal ({ "0.27.0" }) liikus katvus { "7" } { "56" } liigist { "60" } { "61" }-ni ning { "389" } { "1354" } väljast { "1,742" } { "1,744" }-ni (docs/field-units-schema.json, mida vananemiskontroll hoiab ajakohasena). ÜKSKI liik ei jää katmata (lagi { "0" }, FUT-28, { "0.36" }): viimane oli <c3/>, mille kaks veergu on kutsuja-võtmega, seega on nende ühikud andmed; need on nüüd kirjeldatud kujul <c4/> ja iga asukoha ühik loetakse PÜHITUD paketi enda units-tabelist väljadesse <c5/> ja <c6/> (või võetakse telje deklareeritud <c7/>-st, mis peab nõustuma paketi omaga, kui mõlemad on olemas; null, kui kumbagi ei ole, öeldud, mitte arvatud). <c8/> oli selle eelne ja tuli nimekirjast maha, kui selle välja antud dokument sai units-ploki: liitvuse kinnitus, mis oli nimetanud <c9/> keelatud võtmeks, TÕESTAB nüüd, et lisandus on liitev — eemalda plokk tagasi ja dokument räsitakse ikka kahele konstandile, mis külmutati enne selle olemasolu, nii et lisandi all liikunud välja antud väärtus ebaõnnestub endiselt. Töö tõi esile ka kaksteist ühiku- või dokumentatsiooniviga olemasolevas koodis, raporteeritud, mitte parandatud R1 all

# text
seg-cf779c468eed = Kuu tugisüsteemi datum PÄRIS vaatluskampaaniast

# text
# c1: lunar-llr-datum
seg-96151f13a92b = Seitsmeparameetrilise Helmerti datumi kovariatsioon, mille kaks simuleeritud sisendit on asendatud mõõdetutega: graafik on { "337" } arhiveeritud ILRS Kuu laserkaugusmõõtmise normaalpunkti maapealsete saatmisepohhide hulk (2015-04-08 kuni 2015-06-27, Grasse MeO { "7845" } ja Matera MLRO { "7941" }, kõik viis retroreflektorimassiivi) ja iga vaatluse kaal on selle punkti enda arhiveeritud täpsus bin_rms/√n_raw — mediaan { "5.13" } mm ühesuunalist kaugust, loetud failist. Jaama koordinaadid IERS ITRF2020, reflektorite koordinaadid JPL DE430 tabel { "7" }. Käivitatav stsenaariumi liigina <c1/>. Valideeritud väide ({ "0.36" }) on kitsas: analüütilisel vaiketeel ühtib datumi kovariatsiooni arvutus sõltumatu SPICE valgusaja ja NumPy sõltumatu etaloniga värskete mõõdetud normaalpunktide põhjal; see ei ole LLR täpsus ega tõend, et analüütiline Kuu on täpne

# text
seg-c815cb90dcde = Kuu etalonjaama geodeesia: lisatud retroreflektor ja VLBI majakas viie massiivi datumi suhtes

# text
seg-103cf21173ac = Valikulised sisendid extra_reflectors ja extra_beacons stsenaariumil lunar-llr-datum lisavad ploki station_geodesy: viie massiivi Helmerti informatsioon arhiveeritud Kuu laserkaugusmõõtmise lõigust pluss informatsioon, mille lisatud retroreflektor (kaugusmõõdetud arhiveeritud normaalpunktide epohhidel, mil kaugusmõõtejaam on oma horisondi kohal, igaühel selle normaalpunkti arhiveeritud kaal) ja lisatud VLBI majakas (vaadeldud stsenaariumi lunar-frame-campaign võrgu ja graafikuga Maa jaamad fikseeritult, läbi lunar-vlbi-fim viite osatuletiste) esitatud asukohtades seitsmeparameetrilisele datumile lisavad, uuesti lahendatud, iga Helmerti parameetri 1-sigma enne ja pärast, nende suhe, normid enne ja pärast ning Fisheri vahe äärmuslikud omaväärtused. Puudumisel või tühjana on aruanne muutmata

# text
seg-479a7e6bbedb = Ainult sisemine kooskõla: iga lisatud asukoht on eraldi punkt ja laservahemaa või fikseeritud jaama VLBI viide puudutab ühte punkti, seega on selle informatsioon A_p^T M_p A_p positiivselt poolmäärav ja liitub; test kontrollib Fisheri vahet ja iga dispersiooni selle vastu. Viie massiivi tulemus on olemasolev päris andmete rida ja on muutmata. Lisatud reflektor taaskasutab viie olemasoleva massiivi jaoks planeeritud epohhe, ILLUSTRATIVE graafikut, ning lisatud majaka võrk, graafik ja viite sigma on ILLUSTRATIVE sisendid lunar-frame-campaign; asukoht on ILLUSTRATIVE lõunapooluse asend. Lõunapooluse asukoht näeb Maad oma horisondil madalal või üldse mitte, mida olemasolevad nähtavusnurga testid väljendavad; kumbagi asukohta ei kaugusmõõdeta pidevalt. Numbrid on Cramer-Rao piirid vähendatud parameetrikomplekti jaoks, mitte lahendatud datum ega väide ühegi päris jaama kohta

# text
seg-d9f033ebf109 = Kuu tugisüsteemi datum PÄRIS vaatluskampaaniast, Kuu keskpunkt tuumast

# text
# c1: lunar-llr-datum
seg-6f272a06c9f3 = Stsenaariumi lunar-llr-datum seitsmeparameetriline Helmerti datumi kovariatsioon arhiveeritud ILRS normaalpunktidest ja nende mõõdetud kaaludest tuumateel: geotsentriline Kuu keskpunkt loetakse JPL DE440-st mootori enda tuumalugejaga (planetary_kernel_path; lunar_llr::llr_geometry_with, ephem_provider::KernelEphemeris). Analüütilisest realt erineb ainult Kuu keskpunkt; IAU { "2015" } orientatsioon, puuduv pooluseliikumine ja UT1, kataloogid, valikureeglid, kaalud ja lineaaralgebra on samad. Valideeritud väide on ainult see, et selle tee datumi kovariatsioon ühtib sõltumatu SPICE ja NumPy sõltumatu etaloniga värsketel, nägemata normaalpunktidel. Võrdlus ei eralda Kuu mudeleid ega kontrolli Kuu keskpunkti: samal lõigul läbib iga lävendi ka analüütiline Kuu, eelregistreeritud mutatsiooni (tuuma Kuu loetud tund hiljem) ei tuvastatud ja umbes { "4,650" } km vale Kuu keskpunkt läbib samuti (vt etaloni teksti). See ei ole tõend, et tuuma Kuu parandab datumit. Käivitatav stsenaariumina <c1/> koos planetary_kernel_path (ja normal_points_dir teise lõigu jaoks)

# text
seg-bd3af378b613 = Sisseehitatud analüütiline Kuu efemeriid — selle ESITATUD TÄPSUSE PIIR kontrollitud päris andmete vastu

# text
seg-a51c4e234a4f = ephem::moon_position, madala täpsusega geotsentriline Kuu rida, millele crate langeb tagasi, kui DE/SPK tuuma ei ole, mõõdetud päris Kuu laserkaugusmõõtmise ja avaldatud planeetide efemeriidi vastu sama perioodi jooksul. See rida valideerib piiri, mida moodul enda kohta esitab, MITTE täpsust: rida on kinnitatud olevat mitte halvem, kui ta ütleb, mitte kinnitatud olevat hea

# text
seg-81dff68ddd9c = KAKS sõltumatut välist andmekogumit, mis ei jaga midagi. ({ "1" }) { "337" } arhiveeritud ILRS Kuu laserkaugusmõõtmise normaalpunkti (EUROLAS Data Center, DGFI-TUM, 2015-04-08 kuni 2015-06-27, viis retroreflektorimassiivi, commititud faili-SHA-256-ga ja uuesti allalaadimise-ja-kontrolli skriptiga): vaadeldud-miinus-arvutatud ühesuunaline kaugus { "156,494" } m RMS, jaama koordinaatidega IERS ITRF2020-st ja reflektorite koordinaatidega JPL DE430 tabelist { "7" }, seega domineerib jääki Kuu keskpunkti rida. ({ "2" }) JPL Horizons geomeetrilised geotsentrilised Kuu olekud sama perioodi jooksul: { "112,567" } m RMS radiaalne, { "195,655" } m RMS vektor, halvim epohh { "360,324" } m = { "0.0536" }°. Kauguse jääk reageerib efemeriidi vea RADIAALSELE osale, seega on ({ "1" }) ja ({ "2" }) sama suurus kahel viisil saavutatuna ning ühtivad täpsusega { "1.39" }× — mis annab stsenaariumile lunar-llr-datum õiguse omistada selle jääk efemeriidile. Mootori enda mooduli dokumentatsioon väidab ~{ "0.3" }° / ~mõni·10² km; mõlemad mõõtmised on selle sees, nurgaväide { "5.6" }× varuga. ULATUS, esitatud nii, et ükski lugeja ei saaks eksida: see valideerib esitatud PIIRI, mitte täpsusnumbrit. Rida jääb sobimatuks igaks rakenduseks, mis vajab paremat kui ~{ "1e5" } m, ja see piirang on rea sisu niisama palju kui kokkulangevus. Regenereeritav võrguühenduseta kinnitatud toomise-ja-kontrolli skriptidega

# text
seg-44f582b17fa9 = Värava terviklikkus — roheline, mis tähendab seda, mida ütleb

# text
# c1: cargo test --all
seg-43fbcfbe990c = Kolm struktuurset valvet kontrolliprotsessi enda üle, igaüks sulgeb defektiklassi, mis jõudis kanoonilisse väravasse katkendliku või võlts punasena. ({ "1" }) Iga Rust-lähtekoodis konstrueeritud ajutine tee peab kandma kutsepõhist unikaalset komponenti; protsessi id lükatakse tagasi, sest cargo käivitab teegi testid ÜHE protsessi paralleelsete lõimedena ja pid on neil kõigil ühine. ({ "2" }) Iga bait-baidile või räsi kinnitus peab oma kõrval või oma mooduli päises deklareerima, mida see katab ja mida see tahtlikult välistab — nii et läbiv muudatus näeb ühe pilguga, millised kinnitused on ulatuses ja millest on vaikides saanud hoidla-ülesed muutuste detektorid. ({ "3" }) Rohelist võib väita ainult TÄIELIKUST komplektist: scripts/gate.sh käivitab <c1/>, jäädvustab tõelise väljumiskoodi ilma toru teel olemata ja kirjutab kviitungi, mis nimetab commiti, integratsioonibinaaride arvu, testide arvu ja kestuse; enne-surumise kontroll lükkab tagasi surumise, mille commiti ei nimeta ükski kehtiv kviitung, puhtal puul. Korduvust proovitakse eraldi skriptiga scripts/check-repeatability.sh, mis käivitab teegi komplekti N korda ja ebaõnnestub, kui läbivate testide hulk erineb.

# text
seg-17a5f9da54a4 = Suletud kujul: iga valve käivitatakse kindla teadaoleva halva lõigu, mis peab tulistama, ja kindla teadaoleva hea lõigu, mis peab vaikima jääma, üle, mõlemad literaalkonstandid, mida detektor mõjutada ei saa. Kaks teadaolevat halba lõiku on F22 ja F25 defektid nende algsel kujul. See on SISEMINE sõltumatu etalon ja rida on vastavalt MODELLED: see tõendab, et valved eristavad defekti selle parandusest, mitte et nende kirjeldatud klassid on ammendavad. Nende esitatud pimealad — jagatud olek, mis ei ole tee, lühikeses nimelises konstandis hoitud kinnitus, haruldane võidujooks, mida kolm käivitust ei proovi, ja kviitung, mida iga faili kirjutada suutev inimene võib võltsida — on kirja pandud failis tests/source_guards.rs mooduli dokumentatsioonis ja iga skripti päises, mitte jäetud avastamiseks.

# text
seg-178192c9c87a = Koostatud ajastuse PL — skalaarne MHSS spetsialiseering (H=1_N)

# text
seg-431aaf94ec31 = Skalaarse aja lahendiseparatsiooni TPL heterogeensete allikate üle; PL, mida juhivad halvima väljajätmise alamhulga müra + UTC(k) nihe

# text
seg-9a5ea79248c8 = P2: numpy { "2.3.5" } linalg.lstsq ja scipy { "1.18.1" } (norm.isf, norm.sf, brentq) arvutavad oma algoritmidega uuesti alamhulkade kaalutud vähimruutude hindajad, üldise separatsiooni kovariatsiooni sqrt(Δ Σ Δᵀ), nihked ja neist kaitsetaseme { "300" } kinnitatud sisendil (tests/fixtures/tpl_scalar_numpy_oracle); PL ühtib suhtelise täpsusega { "1e-9" } (halvim { "1.2e-10" }) ja juhtiv väljajätmise alamhulk on identne, tolerants fikseeritud enne võrdlust. Kordajad, eelnevad ja nihke ülempiirid on sisendid ning PL-võrrandi struktuur (moodide loend, ir/2 jaotus, nihke projektsioon) on esitatud sisend, nagu Kuu ARAIM-i kaitsetaseme tuuma rea puhul; valideeritud väide on lineaaralgebra ja PL nendel sisenditel, mitte ajastusstsenaariumi füüsikalised suurused. ARAIM-i põlvnemine Blanch { "2015" } / Joerger { "2014" }

# text
seg-b7cd952ff133 = Koostatud ajastuse PL — P0-algväärtusega (seed) holdover-läbisõit

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); alt poolpidev PL({ "0" }+)≥PL({ "0" }−); K(IR/2) jooksev maksimum; τ/τ³/τ⁵ faasieksponendid

# text
seg-1438193381be = Omaduste testid (monotoonsus, üleandmisel languseta) + eksponendi lint holdover::coast_phase_variance vastu

# text
seg-3ab4509b62a2 = Koostatud ajastuse PL — holdover-ümbrise katvus, mitmeaastane režiim (tau>=90d)

# text
seg-d9520f6c1769 = Jooksev maksimumümbris ülempiirab (nulli läbistav) päris metroloogilist rida igal testitud viitel tau>=90d lahutatud segmendil; lühike tau (<=30d) on avalikustatud modelleeritud piir

# text
seg-086baedd33a9 = BIPM Circular-T [UTC-UTC(USNO)] 5-päevane rida MJD 56074-60429 ({ "872" } punkti, webtai API); lahutatud sobitus/test, mitmeaastane nulli läbistav katvus

# text
seg-096b6cdfe2dc = Koostatud ajastuse PL — LIL a.s. ümbris (võimatus + kooskõla)

# text
seg-1671add2210d = Lõplikku halvima juhu holdover-i ei ole (Browni sup hajub); IR-ga jaotatud HPL kooskõlas Hartman-Wintneri ümbrisega, kui IR→{ "0" }

# text
seg-c9ed8bbede70 = Suletud kujul a.s. ümbris √(2Dt·lnln t) samasus + HPL-i domineerimise kontroll; Baweja arXiv:{ "2606.24210" } võimatuse õmblus

# text
seg-5a27c9f0a67d = Heterogeenne UTC(k) jälgitavuse nihke terviklikkuse ülempiir

# text
seg-fd09ab2adbf6 = Allikapõhine nihke ülempiir b = (U/k_cov)·Phi^-1(1-tail/2) + vananemine, mis paisutab avaldatud B-tüüpi laiendatud määramatuse jaotatud terviklikkuse sabaks; sild tpl_scalar-iga kujul bias_s

# text
seg-d75b900ad25f = Korreleeritud jälgitavuse nihke ristkovariatsioon (ühisrežiimi suhtes ohtlik jaotus)

# text
seg-0641f6d38c23 = N×N nihke ristkovariatsioon rho·b_i·b_j mittediagonaalsetega allikatele, mis jagavad UTC(k) realiseerijat; TÕESTATUD correlated_fused_bias >= independent_fused_bias (naiivne sõltumatu jaotus alapiirab liidetud nihet -> optimistlik -> ohtlik)

# text
seg-72359f29aab1 = Sõltumatu numpy reproduktsioon ristkovariatsioonist ja korreleeritud-vs-sõltumatu liidetud nihke võrratusest (InternalConsistency). Representatiivne allikate komplekt; modelleeritud stsenaarium.

# text
seg-0359a9194c60 = GLS ühisrežiimi valgendamine (Aitken) + Mahalanobise samasus

# text
seg-67b11ff6d055 = Käsitsi kirjutatud Choleski Omega=LL^T ja edasiasenduse valgendamine z=L^-1 r (Cov(z)=I, kui Cov(r)=Omega); Mahalanobise ruut z^T z = r^T Omega^-1 r

# text
seg-24cb37529637 = P2: numpy { "2.3.5" } linalg.cholesky (LAPACK potrf), solve (gesv) ja inv { "201" } sisestatud SPD-sisendil (tests/fixtures/gls_whitening_numpy_oracle) kontrollivad käsitsi kirjutatud tegurit, valgendatud jääki ja valgendusoperaatorit; Mahalanobise ruutu kontrollitakse avaldise solve(Omega, r) vastu, mis Choleskyt ei kasuta, mistõttu samasus z^T z = r^T Omega^-1 r kinnitatakse eraldi teed pidi. Kõik jäävad suhtelise vea { "1e-12" } piiresse (halvim { "7.9e-16" }), tolerants kinnitati enne võrdlust. Suurim tinglikkuarv on { "19.3" }, seega halvasti tinglikud maatriksid ei ole kaetud. GLS-i/Aitkeni { "1935" } valgendamine on viidatud.

# text
seg-1a3bb032960f = Ühisrežiimi kooskõla statistik (eraldusi mittenäha jagatud etalonviga)

# text
seg-1b03f522b8fc = Skoori statistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 ühisrežiimi nihke jaoks, mida lahendite eraldamine (kontrastid, mis on { "1" }-ga risti) ei näe; ühisrežiimi nihe suurendab seda, samal ajal kui paaripõhised eraldused jäävad muutumatuks

# text
seg-91fc18cde833 = Omega-välise jäägi tuvastamatu ühisrežiimi piir

# text
seg-0cc2c0f033c8 = Tuvastamatu ühisrežiimi lagi: suurim vea suurus suunas d, mis pääseb nii eraldusest (alpha_ss = T_ss / d valgendatud kontrastinorm) kui ka ühisrežiimi statistikust (alpha_cm = sqrt(T_cm { "1" }^T Omega^-1 { "1" }) / |{ "1" }^T Omega^-1 d|), esitatud kujul min(alpha_ss, alpha_cm). Positiivselt määratud Omega korral on kaks pimedat suunda (d võrdeline suurusega { "1" } ja { "1" }^T Omega^-1 d = { "0" }) vastastikku välistavad, seega on lagi LÕPLIK iga nullist erineva d korral; see on lõpmatu ainult nullsuuna või mitte-positiivselt määratud Omega korral. Modelleeritud ühistelje välist suunda ei näe ainult ühisrežiimi statistik ning seda piirab eraldus

# text
seg-a7a33523bb1c = Kuu datumi identifitseeritavus – lahutuse lineaaralgebra

# text
seg-bd59cc76557a = 7-parameetrilise Helmerti datumi Fisheri maatriksi ploki { "{" }lunocenter-X, scale{ "}" } Schuri komplemendi marginaal: skalaarne degeneratsioonimeetrik lambda_min(S), lähtepunkti X CRLB ja lähtepunkti ja skaala korrelatsioon

# text
seg-0f7e4fb31c44 = Sõltumatu SciPy/NumPy etalon (scripts/gen_datum_identifiability_ref.py -> tests/fixtures/datum_identifiability/scipy_ref.csv): Schuri komplement, selle omaväärtused ja 2x2 pöördmaatriks, mis on arvutatud sõltumatu teegiga. Piiratud lahutuse LINEAARALGEBRAGA; Kuu korrelatsiooni- ja CRLB-i SUURUSED päris geomeetria korral jäävad MODELLED.

# text
seg-3359eee713a5 = Kuu datumi nullruumi klassifikatsioon (LLR-i astmeliitvus ja libratsioonidefekti tõstmine)

# text
seg-6d722c176052 = Sisemise kaugusmõõtmise datumiprobleemi klassifikatsioon: üksik kaugusmõõtmine annab astme { "1" } (6-mõõtmeline nullruum); lähtepunkti X ja skaala paar on peaaegu null ning füüsikaline DE440 libratsioon tõstab defekti nulli, samal ajal kui paar jääb peaaegu degenereerunuks

# text
seg-ae6dc4e6ea8b = Mootoriga reprodutseeritud geomeetriline struktuur pluss suletud kujul 2x2 Schuri samasus; STRUKTUURIS kooskõlas allikaga Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }), mille esitatud suurusi siin EI reprodutseerita. Klassifikatsioon on struktuurne; korrelatsiooni- ja CRLB-i suurused päris geomeetria korral on MODELLED (reflektorite koordinaadid ja orientatsioon hoitakse fikseerituna). { "0.30" } väline võrdlus, tulemus (jääb MODELLED): allikaga Sosnica et al. { "2025" } võrreldes jääb kauguse Fisheri maatriksi lähtepunkti ja skaala korrelatsioon (-0.993 / -0.988) avaldatud väärtusest -0.97 { "0.05" } piiresse, kuid artikli enda viie reflektori geomeetria korral on võrdsete kaaludega 7-parameetrilise Helmerti korrelatsioon -0.78 (avaldatud väärtus tugineb reflektoripõhistele vigadele, mida artikkel ei esita), ja lähtepunkti CRLB ({ "0.6" } kuni { "1.2" } mm { "3" } mm kaugusmüra korral) on { "96" } kuni { "98" } % allpool artikli { "3.07" } cm, mille tolerants on { "20" } %. Suurusi ei reprodutseerita

# text
seg-3fd19007ea67 = Mitme meetodi Kuu datumi teave (LLR + Kuu VLBI + orbiidi kaugusmõõtmine)

# text
seg-23d0dd7d0666 = Datumi Jacobi maatriksi read Maa–reflektori LLR-i kauguse, kahe jaama Kuu VLBI diferentsiaalviivituse ja orbiidi–majaka kauguse jaoks 7-parameetrilise datumi üle, ühendatud üheks järjepidevalt eeltingitud Fisheri maatriksiks; näitab, et radiaalsuunaväline (orbiter / sügavuselt mitmekesine) jälgimine murrab lähtepunkti X ja skaala degeneratsiooni, samal ajal kui ristisuunaline VLBI aitab ainult kaudselt

# text
seg-b2f5715c4577 = Iga meetodi osatuletiste analüütilised ja lõplike vahede ristkontrollid (sisemised); parenduse SUUND on geomeetriline fakt. Majakate asukohad, ajakavad ja müra on MODELLED/esindlik (vt tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-f9796a4c9a85 = DE440 Kuu peatelgede orientatsiooni pakkuja

# text
seg-ebe4519a40e4 = MOON_PA_DE440 -> J2000 pööre suvalistel epohhidel vahemikus 2014-01-01 kuni 2030-12-31 TDB, geodeetilise interpolatsiooniga R0·Exp(f·Log(R0ᵀR1)) sisestatud { "6" } 209-realise ööpäevase jada sõlmede vahel (try_-funktsioonid tagastavad väljaspool seda OrientationSpanError, tõrketa funktsioonid satuvad paanikasse; ta ei kärbi kunagi); manustatud kompileerimise ajal, seega puudub käitusaegne failisüsteemi I/O ja WASM-i järk sisaldab seda

# text
seg-3b710c49338c = NAIF SPICE Toolkit (CSPICE N0067 kuni spiceypy { "8.2.0" }, käivitatud tööriistana): pxform kujul MOON_PA_DE440 -> J2000, mis hindab JPL-i binaarset PCK-d moon_pa_de440_200625.bpc otse, NAIF-i enda kaadrikerneliga moon_de440_250416.tf, { "2 000" } juhuslikul sõlmedevälisel epohhil manustatud aknas. Kshana ja SPICE'i maatriksite vaheline pöördenurk jääb { "1.7e-5" } rad piiresse ({ "30" } m keskmise raadiuse { "1737.4" } km juures, kinnitatud enne võrdlust); mõõdetud halvim { "1.7e-6" } rad ({ "3" } m), RMS { "7.8e-7" } rad ja halvim { "1.75e-6" } rad veel { "6 000" } epohhil, mille valis kontrollija. Ööpäevased sõlmed ise eraldati samast kernelist (scripts/gen_de440_moon_pa.py, fikstuuri SHA-256 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7), seega kontrollib see võrdlus nende vahelist interpolatsiooni, mis ongi väide. Selle võrdluse abil leitud ja parandatud: varasem elemendipõhine lineaarne interpolatsioon koos Gram-Schmidtiga säilitas { "13.2" } kraadi/ööpäevas pöörde telje, kuid mitte nurka ja eksis veerandpunktide lähedal kuni { "2.0e-4" } rad ({ "340" } m) võrra; varasem ligikaudu { "14" } m suurune näitaja pärines kontrollist, mis valimit võtab ainult intervallide keskpunktides. Jada katab 2014-01-01 kuni 2030-12-31 ja väljaspool seda tekib viga (voor { "2" }); selle 2024.–2025. aasta sõlmed genereeritakse samast kernelist uuesti täpsusega { "4.3e-13" }. Ülaltoodud SPICE'i sõlmedevälise võrdlus katab ainult 2024.–2025. aastat, mis on valideeritud aken; laiendatud sõlmed pärinevad samast kernelist ja skriptist, kuid neid sõlmedevälisel epohhil ei võrrelda. Geomeetriline substraat identifitseeritavuse analüüsiks, mitte meetri-alune orientatsiooniprodukt

# text
seg-ab96cfc8d48c = Kuu LLR-i datumi geomeetria substraat (peatelgede reflektorid, maajaamad, analüütilised kauguse osatuletised)

# text
seg-40e91288f81a = Viis Kuu Maa-poolse külje retroreflektorivõret PA kehakaadris meetrites ja LLR-i maajaamad geodeetilistes koordinaatides; reflektori keha-inertsiaalkaadri paigutus DE440 PA orientatsiooni kaudu; Maa–reflektori kauguse analüütilised osatuletised 4-parameetrilise datumi suhtes; ning ainult LLR-i Fisheri maatriks, mis näitab Kuu keskpunkti X ja skaala degeneratsiooni, mis õigustab 7-parameetrilist analüüsi

# text
seg-89ce1f95d9f6 = Arvutust kontrollitakse sisemiselt: iga analüütilist osatuletist lõpliku vahe vastu ja nulldatumi juhtu nimikauguse vastu. KATALOOGI kontrollitakse välist teed ja sõltumatult – DE440 peatelgede koordinaate (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) ristkontrollitakse DE430 pinnakoordinaatide memorandumi tabeliga { "6" } (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, masinaga eraldatud SHA-256-ga kontrollitud PDF-ist skriptiga tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) ja need ühtivad täpsusega { "1.12" } m, samal ajal kui samade viie võre keskmise Maa realisatsioon erineb { "672" } kuni { "871" } m võrra. DEGENERATSIOONISTRUKTUURI kontrollitakse avaldatud tulemuse vastu: Sosnica et al. { "2025" }, 'Definition and Realization of the International Lunar Reference Frame', arXiv:{ "2510.15484" }, mis esitab Kuu peatelgede kaadri jaoks Kuu keskpunkti X ja skaala korrelatsioonikordaja r = -0.97 ning selle, et LLR ei jõua selle korrelatsiooni tõttu Kuu tegeliku massikeskmeni täpsusega, mis oleks parem kui { "12" } cm. See moodul taastab sama struktuuri (|corr(t_x, scale)| vahemikus { "0.9" } kuni { "0.9999" }, datumi defekt <= { "1" }) ainult LLR-i Fisheri kavandist. Kinnitus on efemeriidideülene, mitte ringtee: artikkel ühendab INPOP21a, DE430 ja EPM2021, siinne moodul aga on juhitud DE440 libratsioonist. Mida EI reprodutseerita, on suurus – korrelatsioon on siin ligikaudu -0.988 nende -0.97 vastu ja 4-parameetriline CRLB on millimeetri-alune nende saavutatud { "12" } cm põranda vastu, sest orientatsioon ja reflektorikoordinaadid on siin fikseeritud, seal aga lahendatud. Ainult geomeetria ja degeneratsioonistruktuur; täpsusväidet lahendatud datumi kohta ei ole. { "0.30" } väline võrdlus: selle mooduli mõõdetud kauguse osad (reflectors(), stations_itrf(), DE440 PA paigutus ja barütsentriline valguse käiguaeg llr_bcrs_one_way_m) on valideeritud nende endi real, LLR-i mõõdetud kauguse mudel, { "192" } ILRS-i normaalpunkti vastu (RMS { "2.81" } m { "10" } m vastu). See rida jääb MODELLED, sest mõõdetud võrdlus ei proovi läbi ülejäänud väidet. Geodeetiline jaamakataloog stations() ümardab APOLLO täpsuseni { "0.001" } kraadi; geotsentrilise valguse käiguajaga annab see samadel punktidel { "22.7" } m (test reflector_ranges_against_ilrs_normal_points; { "96" } m varasema elemendipõhise orientatsiooni interpolatsiooniga). Analüütilised kauguse osatuletised ja ainult LLR-i Fisheri maatriks arvutatakse funktsioonide llr_range_m ja reflector_inertial kaudu analüütilise Kuu reaga (ephem::moon_position, ligikaudu { "0.3" } kraadi GCRS-ist) ja ilma valguse käiguajata

# text
seg-a78ba110b64c = LLR-i mõõdetud kauguse mudel (reflektorite kataloog, ITRF2020 jaamad, DE440 peatelgede paigutus, IERS { "2010" } barütsentriline valguse käiguaeg)

# text
seg-c9827c1a427b = Kuu laserkaugusmõõtmise normaalpunkti ühesuunaline Maa-jaama ja reflektori vaheline kaugus: viis Kuu Maa-poolse külje retroreflektorivõret DE440 peatelgede (PA) kehakaadris meetrites (lunar_llr_geometry::reflectors); funktsiooni stations_itrf() jaamad, nimelt Grasse { "7845" } ja Matera { "7941" } ITRF2020-st epohhil { "2015.0" } koos nende kiirustega, paigutatuna geotsentrilisse taevakaadrisse (GCRS) IERS-i { "2010" } teisendusega koos Bulletin A pooluse liikumisega (lunar_vlbi::station_inertial_position_itrs), ning APOLLO { "7045" } operaatori avaldatud ligikaudsel geotsentrilisel asukohal (kiiruseta); reflektori keha-inertsiaalkaadri paigutus DE440 PA orientatsiooni kaudu (lunar_orientation::try_de440_moon_pa_body_to_inertial, mis annab väljaspool 2014–2030 vea); ning IERS Conventions { "2010" } jao { "11.2" } barütsentriline valguse käiguaeg (lunar_llr_geometry::llr_bcrs_one_way_m: jaama ja reflektori valem { "11.19" } keha-BCRS-i teisendus ning Päikese, Maa ja Kuu valem { "11.17" } Shapiro viivitus). SISENDID, mitte väite osa: barütsentrilised Maa, Kuu ja Päikese olekud ja potentsiaalid (DE440 SPICE'i kaudu), IERS-i UT1-UTC ja pooluse liikumine ning mõõdetud edasi-tagasi tee, mis on teisendatud TT-st TDB-sse. TESTIVÄLJA POOLEL, mitte väite osa: Mendes-Pavlise zeniidiviivitus FCULa kaardistusega, testis, kõrgusega geodeetilise stations() kataloogi põhjal. Ei modelleerita: looded, jaamade ekstsentrilisus, reflektori termilised liikmed

# text
seg-9b1dfa736cb6 = Seotud Kuu kaadri ja ajaskaala kalibreering: ühine ruumilise datumi, kella nihke ja kella kiiruse nullruum

# text
seg-a000ef6ab2e0 = assemble_coupled_info ehitab 9-parameetrilise seotud Fisheri maatriksi üle [t_x, t_y, t_z, s, theta_x, theta_y, theta_z, d_tau, d_alpha]; classify_null_space tagastab selle nullruumi baasiinvariantse lahutuse ainult ruumilisteks, ainult ajalisteks ja tõeliselt seotud dimensioonideks pluss ruumilise-ajalise projektori sidenormi; coupled_marginal_eigs annab { "{" }scale, offset{ "}" } Schuri komplemendi marginaali. Sisestatud võrkudes teatab mootor hästi püstitatud juhu täisastmega datumist (defekt { "0" }) ja ühe kiirussuuna täpsest defektist üksikepohhi juhu korral (möödunud aeg null, seega on kiirus konstruktsiooni poolest mittejälgitav) ning arvutab { "{" }s, d_tau{ "}" } marginaali mõlemal.

# text
seg-35eebbc8a2e9 = MIDA KONTROLLITAKSE VÄLISELT, kitsalt sõnastatuna: kshana arvutab omaväärtuste lahutuse oma käsitsi kirjutatud Jacobi lahendajaga (fim::sym_eig) ja marginaali oma pseudopöördmaatriksiga; sõltumatu etalon arvutab mõlemad uuesti numpy/LAPACK-iga (np.linalg.eigvalsh/eigh/pinv) skripti scripts/gen_coupled_gauge_ref.py kaudu. Kokkulangevus täpsusega rel<{ "1e-3" } on seega sõltumatu teegiga tehtud kontroll SELLE KASTI ARITMEETIKA kohta standardse teostuse vastu, mis ongi valideeritud väide ja selle terviku. MIDA MITTE: koostamine ja nullruumi klassifikatsioon on selle mooduli enda reeglid ning sõltumatu etalon reprodutseerib need samast spetsifikatsioonist, mitte sõltumatust allikast – see kinnitab teostust, mitte reeglit. Majaka ja orbiteri geomeetria on modelleeritud ja esindlik. Vaatlusread kannavad tõesti päris DE440 Kuu PA orientatsiooni (lunar_datum::orbiter_range_row_datum7 -> lunar_orientation::de440_moon_pa_body_to_inertial), kuid see on SISEND, mille saavad mõlemad pooled, mitte tõend vastuse kohta, ja see on siia kirja pandud päritolu, mitte staatuse aluse tähenduses – sama vahe, mille main juba tõmbab ühisrežiimi terviklikkuse real. Iga rea ujukomaarv ümardatakse enne network.json kirjutamist { "6" } kümnendkohani, seega loevad mõlemad pooled identseid IEEE-754 topeltarve ja ainus järelejäänud erinevus on lahendaja.

# text
seg-63a8571f8eb0 = Kauguse ja kella nihke degeneratsioon ühesuunalises Kuu kaugusmõõtmises ning geomeetrilise mitmekesisuse kavandamisseadus

# text
seg-cdd70f56051a = Sõlmepõhine radiaalkauguse ja vastuvõtja kella nihke degeneratsioon on täpne vahekorras { "1" } m ja { "3.336" } ns (üks jagatud c-ga). { "{" }scale, offset{ "}" } Schuri komplemendi marginaal (coupled_marginal_fisher) näitab, et geomeetriliselt mitmekesises võrgus tõstab kahesuunaline kaugusmõõtmine marginaali ligikaudu sama teguri võrra kui sama arv täiendavaid ühesuunalisi andmeid, samal ajal kui idealiseeritud üksiksõlme režiimis on kahesuunaline tõus suurusjärkude võrra suurem. Sellest tulenev kavandamisseadus: geomeetriline mitmekesisus, mitte kahesuunaline kaugusmõõtmine kui selline, eraldab ühesuunalises kaugusmõõtmises Kuu kaadri skaala ajaskaala nihkest; kahesuunaline või väline ajasidumine on vajalik ainult vähese mitmekesisusega või üksikkasutaja režiimis.

# text
seg-25dd0e9134c8 = Seotud infomaatriksi Schuri komplemendi marginaalne Fisheri maatriks suletud kujul lineaaralgebras, kontrollitud kahe piirrežiimi vastu, mida see ennustab. Võrdsus { "1" } m ja { "3.336" } ns on meetri definitsioon c kaudu ega ole empiiriline tulemus. Vaatlusvõrgud on esindlik modelleeritud geomeetria, seega on kavandamisseadus väide talle esitatud geomeetria kohta ega sisalda väidet ühegi kasutusel oleva Kuu võrgu kohta.

# text
seg-16ec8283f9b4 = Relativistlik kella kiiruse ja kaadri seos Kuu ajaskaala jaoks

# text
seg-d9a426dc8620 = rate_frame_jacobian(_with) annab Kuu ajaskaala kiiruse tundlikkuse kaadri realisatsiooni suhtes, lähtudes ekvatoriaalsest efektiivsest potentsiaalist, mis on lõigatud astmel { "2" } (GM, ekvatoriaalraadius, J2, pöörlemine; LunarSurfacePotential): d_alpha/d_scale = L_m, ligikaudu +{ "3.1388e-11" }; d_alpha/d_velocity = -|v_moon|/c^{ "2" }, ligikaudu -1.11e-14 (ajast sõltuv); d_alpha/d_r_radial = g_eff/c^{ "2" }, ligikaudu +{ "1.806e-17" } meetri kohta. { "1" } m radiaalse datumi nihke korral on see kiiruse häiring ligikaudu { "1.8e-17" } (radiaalkirje aritmeetiline tagajärg), mis on palju väiksem kui Kuu ajaskaala ligikaudu { "1.7e-11" } kiirusenihe TT suhtes

# text
seg-a666792106d9 = Seotud kaadri ja ajaskaala nullruumi baasiinvariantne klassifikatsioon

# text
seg-5ee36574d1b4 = classify_null_space jagab datumi nullruumi ruumiliseks (dimensioon d miinus aste U_T), ajaliseks (d miinus aste U_S) ja tõeliselt seotud (aste U_S pluss aste U_T miinus d) osaks, pluss ruumilise-ajalise projektori sidenorm p_st_norm, mis on nullruumi projektori mitte-diagonaalploki Frobeniuse norm. Kõik need on PROJEKTORI, mitte valitud baasi funktsioonid, seega on need invariantsed nullvektorite mis tahes ortonormaalse valiku suhtes – just see teebki klassifikatsiooni üldse esitatavaks.

# text
seg-2c074d6260ba = Esindlik mitme meetodi mõõtmismenüü ja liitev Fisheri kombineerimisreegel

# text
seg-beefac5c1b13 = MeasurementBlock hoiab ühte kandidaatmõõtmiskampaaniat 7x7 Fisheri infopanusena pluss skalaarne suhteline kulu; block_from_rows ehitab ühe toorete datumi Jacobi ridade põhjal, nii et iga plokk on läbi lunar_identifiability::assemble_multi_info identselt eeltingitud; combine liidab valitud alamhulga info, mis on õige reegel, sest Fisheri info on sõltumatute mõõtmiste üle liitev; representative_lunar_menu pakub deterministliku nelja ploki menüü (LLR, ristsuunaline VLBI limbimajakas, Maa-poolse külje orbiter ja Maa-vastase külje orbiter). Eelarvepiiranguga kavandusoptimeerija, mis seda menüüd tarbib, ei kuulu sellesse kasti.

# text
seg-d83a9942ee72 = Fisheri info liitevus sõltumatute mõõtmiste üle on suletud kujul omadus, mida siin kontrollitakse sõltumatult kirjutatud elemendipõhise summa vastu ning sellest tulenevate järjestuse invariantsuse ja monotoonsuse vastu. MÄRKUS TÕENDUSE KOHTA: kombineerijal polnud varem üldse testi ja mooduli ainus test liitis kaks infomaatriksit otse, selle asemel et seda välja kutsuda, nii et katkine kombineerija oleks jätnud mooduli roheliseks; test läheb nüüd läbi combine'i ja kukub läbi, kui seda mutatsiooniga muuta. Kõik majakate asukohad, orbiteri geomeetria, meetodipõhised täpsused ja suhtelised kulud on esindlik valikud, mitte missiooni väärtused (vt tests/fixtures/llr_geometry/NOTICE.md), seega pärib iga selle menüü kaudu saadav degeneratsioonimeetrik ja CRLB-i näitaja lunar_identifiability::decompose'i modelleeritud staatuse.

# text
seg-341eedfc47da = Pakkujatevaheline Kuu kaadri/dünaamika kooskõla (päris efemeriididevaheline)

# text
seg-f8d94c0771cc = DE440/INPOP21a/EPM2021 geotsentrilise Kuu lahknevuse ainult pöörde (6-parameetriline nihe+pööre) lahutus taandatavaks ühiseks ICRF-i kaaditõmbeks ja taandamatuks Kuu orbiidi orientatsiooni liigseks osaks (täielik 7-parameetriline Helmerti sobitus on eraldi avalik funktsioon, mida see väline kontroll EI kata: selle tõend on sisemine analüütilise taastamise ühiktest pluss tests/lunar_helmert_fit_cross_check.rs, mis kooskõlastab selle valideeritud täpse Gauss-Newtoni sobitusega lunar_frame_realise'is ja fikseerib nende kahe vahel vastupidise pöörde märgikokkuleppe)

# text
seg-c69fd3fc645b = Kolm sõltumatut autoriteetset efemeriidi – DE440 (JPL), INPOP21a (IMCCE), EPM2021 (IAA RAS) – valimiga IMCCE calceph'i kaudu, ristkontrollitud sõltumatu numpy SVD vähimruutude sobitusega. MIKS SEE ON valideeritud, KUS lunar_common_mode EI OLE, samadel kolmel efemeriidil: siin on esitatav suurus avaldatud andmete omadus – nende vastastikune lahknevus –, seega on efemeriidid sõltumatu etalon, mitte sisend. Rakenduses lunar_common_mode toidab sama lahknevus MODELLED konstellatsioonigeomeetriat ja vastus on selle mudeli omadus, mistõttu on see rida õigesti modelleeritud/ReferenceImpl.

# text
seg-2d3347bcb15e = Pakkujatevaheline kooskõlatolerants segapakkujaga kasutajale

# text
seg-9decf2cb6b0c = consistency_tolerance: pöörab kasutaja asukohabudžeti ümber parameetripõhiseks pakkujatevaheliseks Helmerti kokkulangevuse nõudeks (lähtepunkt/skaala/pööre) etalonõlal, vajaduse korral paisutatud P1 üksikpakkuja realisatsiooni CRLB-ga

# text
seg-b8dc68eb4bda = Helmerti punkti-Jacobi toime halvima juhu kolmnurgapiir (suletud kujul)

# text
seg-5450d921dfc9 = Mitme pakkuja Kuu koostalitlusvõime veabudžett ja kaadri-vs-efemeriidi kavandamisseadus

# text
seg-e1e30f5c17a6 = interop_budget: taandatav (ühine kaaditõmme) vs taandamatu (dünaamika) lahutus kokkulepete PerProvider / CommonFrameTie / CommonEphemeris all, koos taandamatu osa kavandamisseaduse meetrikaga (~{ "0.69" } päris DE440/INPOP/EPM korral: ühine kaadrisilt üksi jätab domineeriva põranda alles)

# text
seg-46304ae1efa4 = Valideeritud paaripõhiste lahutuste RMS-agregeerimine iga kokkuleppe all (suletud kujul)

# text
seg-a01f394a36d3 = Autonoomne vaba võrgu vea jälgitavuse lineaaralgebra torujuhe (paarsusprojektor, tuvastatavus, MDB mittetsentraalsus, Bütsantsi ploki säde)

# text
seg-b3389bb90e8d = Päris DE440 sõlmepõhises Kuu võrgus (iga rida on diferentsiaalne sõlmedevaheline ühesuunaline kaugus, mis on ehitatud funktsiooniga pernode_range_row päris DE440 Kuu PA kaadri vaatekiirega) arvutab mootor kaalutud paarsusprojektori P⊥ = I − G(GᵀWG)⁺GᵀW (astmepuudulik pseudopöördmaatriksi kuju, mis pidurdab 8-mõõtmelise datumi⊕ajaskaala kalibreeringu), T1 tuvastatavuse jäägi ‖P⊥·b‖ (ulatusesisesed vead annihileeritakse, üldised vead on tuvastatavad), Baarda MDB mittetsentraalsuse ruutvormi cᵀWP⊥c (õige üksik-P⊥ kaalutud kuju, MITTE topelt-P⊥ kuju cᵀP⊥WP⊥c) koos MDB = √(λ₀/cᵀWP⊥c) ning Bütsantsi ploki sädeme tuvastamise/identifitseerimise arvud virnastatud efektiivsetele vastaspeegli signatuuridele P⊥·B_T (veeruastme põhjal, mitte pelgalt nullist erinevus)

# text
seg-8cb248423fd0 = Sõltumatu numpy/scipy lineaaralgebra reproduktsioon päris DE440 Kuu PA kaadri vaatekiire ridadel (P⊥ valgendatud kavandi W^{ "{" }1/2{ "}" }G SVD-st; MDB mittetsentraalsus klassikalisest Baarda ({ "1968" }) paarsusalamruumi ruutnormist; ploki aste numpy SVD singulaarväärtuste loendusest) – põhimõtteliselt teistsugune numbriline tee kui kasti tsükliline Jacobi omalahutus maatriksist GᵀWG. Skoop (vastavalt tests/fixtures/faultobs/NOTICE.md): see valideerib LINEAARALGEBRA TORUJUHET ainult nendel ridadel. Sõlmede geomeetria on modelleeritud. See EI OLE operatiivne terviklikkuse garantii, kaitsetaseme sertifitseerimine ega mingi RAIM-i/ARAIM-i kättesaadavuse väide ning EI OLE Bütsantsi veataluvuse missioonigarantii – selle võrgu talutavate vigade ARV on modelleeritud, samas kui tuvasta>f / identifitseeri>2f ploki sädeme PIIR on viidatud (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; Donoho–Elad { "2003" } ploki sädeme mõiste) ja koodis tõestatud instantseerimine

# text
seg-ebb827739614 = Bütsantsi ploki sädeme tuvastamise/identifitseerimise piir autonoomses sõlmepõhises Kuu võrgus (T3)

# text
seg-4fb935e6193d = byzantine_bound instantseerib turvalise olekuhinnangu kodeerimise / hõreda jälgitavuse piiri sõlmepõhise võrgu geomeetrial: Bütsantsi vastaspeegel süstib suvalise lineaarkombinatsiooni mõõtmistest, milles ta osaleb, ja võrk TUVASTAB iga koalitsiooni, milles on ≤ f = block_spark − { "1" } vastaspeeglit, ning identifitseerib TÄPSELT iga koalitsiooni, milles on ≤ ⌊(block_spark − { "1" })/2⌋, kus block_spark on väikseim vastaspeeglite koalitsioon, mille virnastatud efektiivsed signatuurid P⊥·B_T on veeruastme poolest puudulikud. Vastaspeegli tuvastatavus on P⊥·B_j TÄIS-VEERUASTE (nullist erinev, kuid astmepuudulik plokk on nullist erinev rünne, mis langeb ruumi range(G) ega jäta jääki), mitte pelgalt P⊥·B_j ≠ { "0" }

# text
seg-3b8b54db475d = Ploki sädeme / turvalise olekuhinnangu piiri geomeetriline instantseerimine (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; Donoho–Elad { "2003" } ploki sädeme mõiste; Candès–Tao { "2005" }) – MITTE Lamport–Shostak–Pease 3f+{ "1" } konsensuse lävi ('Bütsantsi' nimetab ainult suvalise/kokkumängiva vea MUDELIT). Konkreetne talutavate vigade arv on esindlik võrgugeomeetria modelleeritud omadus, mida kontrollitakse enesekooskõla suhtes käsitsi konstrueeritud analüütiliste juhtude ja arvuvalemitega

# text
seg-4f57f586cf82 = Autonoomse holdover'i ajalise kalibreeringu põrand isereferentsiaalse Kuu konstellatsiooni jaoks (T4)

# text
seg-eb690e8f5c9b = holdover_floor kinnitab, et ainult sõlmedevaheliste mõõtmistega seotud autonoomsete sõlmede ansamblis on ühine kella kiirus (δα_j += { "1" } ∀j) ansambliaja vaba parameeter, mis asub ruumis N(GᵀWG): ükski lisanduv sõlmedevaheline kaugusmõõtmine ei suuda seda jälgida (rate_in_gauge = true, temporal_gauge_dim = { "2" } koos ühise nihkega). See on tõeline holdover'i põrand – ruumilise jäiga kaadri asukohakalibreeringu ajaline analoog. Ühe välise absoluutkiiruse sideme lisamine (otselink võrguvälise etalonini) viskab ühise kiiruse nullruumist välja (rate_in_gauge = false, temporal_gauge_dim = { "1" }), tõestades, et põrand on tõeline kalibreering, mitte ostsillaatorimudeli artefakt

# text
seg-097f126797bb = Ansambliaja vaba parameetri argument (Percival { "1978" }; Lewandowski & Thomas { "1991" }) instantseeritud esindlik päris-DE440 sõlmepõhisel võrgul: analüütilise ühise kiiruse generaatori suhtelise jäägi nulltest maatriksi GᵀWG vastu, kus murtud sideme kontrast eristab tõelist kalibreeringut ostsillaatorimudeli artefaktist. Esindlik modelleeritud geomeetria, mitte sertifitseeritud ajastuse eelarve

# text
seg-25ffd6e1979c = Pakkuja ühise/diferentsiaalse lahutus, ühe astmepuuduse ühendamine ja kaitselünga tõus (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Kolm tahku ühest lahutusest ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), kus 8-mõõtmeline datumi⊕ajaskaala kalibreering on N(G) ja state_dim − { "8" } = { "32" } jälgitavat suunda on range(G): (T5) provider_mismatch_split klassifitseerib ühise mitme pakkuja nihke (∈ range(G)) TUVASTAMATUKS – vajab välist sidet – ja diferentsiaalse nihke (∉ range(G)) ise jälgitavaks / TUVASTATAVAKS; (§{ "0" }) ühendamine tähendab, et SAMA range(G) pime alamruum valitseb tuvastamatu vea klassi, seega on datumi kalibreering N(G) ja vea suhtes pime alamruum range(G) üks geomeetria, mitte kaks; (g7) slope tagastab Browni kaitselünga tõusu ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ vea b ∈ range(G) korral (hinnang rikutud nullparsusega) ja lõpliku tuvastatava vea korral

# text
seg-e0fd3860fce9 = Suletud kujul paarsusprojektori / pseudopöördmaatriksi algebra esindlik päris-DE440 sõlmepõhisel võrgul: ühise/diferentsiaalse lahutus, N(G) ⊕ range(G) ühendamine ja Browni ({ "1992" }) kaitselünga tõus tulenevad kõik ulatuse annihileerimisest P⊥·G = { "0" }. Esindlik modelleeritud geomeetria, mitte sertifitseeritud kaitsetase

# text
seg-101b0551d987 = Telekomi ajastuse MTIE ja TDEV holdover'i ajaveasarjal

# text
# c1: telecom-timing
seg-b4762fd3cb9d = Maksimaalne ajaintervalli viga ja ajahälve, mida stsenaariumi liik <c1/> esitab telekomi mastaabis holdover'i salvestisel: O(n) monotoonse järjekorraga libiseva akna MTIE (telecom_timing::mtie_sliding, vajalik, et päev ühesekundilisi valimeid püsiks kiire) ja mootori TDEV (allan::time_deviation), hinnatud ruudustikul, mida liik esitab, ning loetud tagasi täisjooksust, mis sarja sisse loeb

# text
seg-59cb2711355c = allantools { "2024.06" } – sõltumatu kolmanda osapoole sageduse stabiilsuse teek – mtie() ja tdev() failil tests/fixtures/telecom_timing/holdover_te_series.csv, sari parsitud samast 17 olulise numbriga tekstist mõlemal poolel; etalon salvestab sarja SHA-256 ja on võrguväliselt taasgenereeritav skriptiga tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Valideerib HINDAJAID sellel salvestisel, mitte seda sünteetilist holdover'it, mis selle tekitas

# text
seg-632add2dbd3c = ITU-T telekomi sünkroniseerimismaskid koos PASS/FAIL ja varuga

# text
# c1: telecom-timing
seg-47687529aee7 = Ümber kirjutatud piirid: ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC lukustatud ja ePRTC-A holdover (sealhulgas tabeli { "3" } ajavea mähis), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) T-BC/T-TSC klassid A-D ja G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) etalonpunkt C, iga avatud või suletud intervall nii, nagu tabel seda esitab, kusjuures iga „edasiseks uurimiseks“ kirje on välja jäetud; iga kontrolli kohta otsus ja varu siduvas punktis ning aeg iga eelarve ületamiseni. Käivitatav stsenaariumi liigina <c1/>

# text
seg-165ed2bc771a = ITU-T sageduse sünkroniseerimise triivi tekke maskid (G.811, G.812, G.8262, G.8262.1)

# text
# c1: telecom-timing
# c2: 8 τ^0.5
seg-953793d4446a = Seitse püsitemperatuuri MTIE ja TDEV triivi tekke maski liigi <c1/> jaoks: G.811 (09/1997) PRC (autonoomne), G.812 (06/2004) tüübid I, II ja III, G.8262 (10/2024) EEC valikud { "1" } ja { "2" } ning G.8262.1 (11/2025) eEEC (lukustatud režiim), sealhulgas tabelite kirjutatud astmeseaduse osad (<c2/> jms), iga intervall avatud või suletud nii, nagu trükitud, mõõdetud klauslite esitatud { "10" } Hz filtri kaudu (võetud nii, et rakendatud enne valimivõttu); etalonstsenaarium scenarios/telecom-synce-eec.toml seab vabalt töötava OCXO kolme EEC maski vastu. Teostamata: muutuva temperatuuri lubatud hälbed, holdover, siirded, värin ja G.811 sageduse täpsus

# text
seg-ca16d9c98dc5 = Nimetatud soovituste ümberkirjutus (alla laaditud aadressilt itu.int 2026-10-13), iga rida uuesti loetud teksti vastu, kusjuures trükitud koefitsientidest tulenev murdepunktide pidevus on testides piiratud (näiteks { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns G.812 tabeli { "4" } { "100" } ns platoo vastu). Standardi ümberkirjutus sisemiste kooskõlakontrollidega, mitte standardi järgimise test ega väline valideerimine. G.812 (06/2004) on loetletud kui asendatud eelavaldatud 08/2026 väljaandega ja G.811-l on Amd. { "1" } (04/2016); kumbagi ei õnnestunud lugeda, seega kumbagi ei kontrollita. Vabalt töötava OCXO stsenaarium ülehindab ostsillaatori panust vaatlusintervallidel, mis on silmuse ajakonstandi suhtes pikad; see ei ütle midagi ühegi seadme kella kohta

# text
seg-5fc2ad88faf0 = Kellalogi vormingud (RINEX clock, TimeLab ASCII, TAPR TICC) loetud normaliseeritud faasisarjaks

# text
# c1: [series.clock_log]
# c2: clock_log
# c3: [clock_log]
# c4: measured
seg-5b5bcbdea166 = clock_log::read_input: üks parseerimiskiht, mis muudab RINEX-i kellafaili (ühe nimetatud kella AS/AR kirjed, versioonid { "2" } ja { "3.00" } kuni { "3.04" }), TimeLabi-laadse ASCII faasi- või sagedusloo või TAPR TICC ajatempli- või intervallilogi ühtlaseks faasiruudustikuks, kusjuures tau0 on esitatud, päisest või mediaanvahe, iga lünk, ruudustikuväline lugem ja duplikaat on loetud ning kehtib keeldumise, pikima lõigu või lineaarse lüngapoliitika; ühendatud valikuliselt telekomi ajastuse sarjaga (<c1/>, lisab ploki <c2/>) ja kella liigiga (<c3/>, lisab ploki <c4/> koos ADEV-i, TDEV-i ja MTIE-ga, tabeli SHA-256 ja faasi SHA-256; runs = { "1" }). Ilma tabelita on mõlemad liigid baidi haaval identsed

# text
seg-acdb0337bce7 = Kellalogi vormingud linuxptp (ptp4l, phc2sys, ts2phc) ja chrony (tracking, statistics) loetud normaliseeritud faasisarjaks

# text
# c1: clock
seg-e87b3dba2072 = clock_log::read_input vormingutega ptp4l, phc2sys, ts2phc, chrony-tracking ja chrony-statistics: linuxptp servo rea logitud nihe (ns, rea enda nurksulgudes ajatempel, lugemid enne, kui servo esimest korda s2 teatab, on välja jäetud ja loetud) või chrony tracking- või statistics-logi nihe (s, veeru asukoha järgi, UTC kuupäev ja kellaaeg) muutub ühtlaseks faasiruudustikuks samade lüngapoliitikate kaudu nagu teised vormingud; allikavalija (<c1/>) nimetab ühe mitmest liidesest, kellast või aadressist; logid toidavad telekomi ajastuse sarja, kella liiki ja holdover-testi liiki

# text
seg-fb9393044576 = Kshana jaoks kirjutatud fikstuurid deemonite avalike rea paigutuste põhjal, väljamõeldud väärtustega (NOTICE.md fikstuurikaustas); ühtegi päris paigaldusest pärit logi ei loetud ja ükski sõltumatu etalon ei võrdle parsimist teise lugejaga, seega võib deemoniversioonide vahel erinev paigutus siiski tagasi lükkuda või valesti lugeda. Faasisarjaga toidetavad hindajad on needsamad, mis on ülalolevatel ridadel allantoolsi vastu valideeritud

# text
seg-97aebb84576e = Holdover-test hinnatud operaatori esitatud ajavea salvestisest

# text
# c1: holdover-test
seg-ab533cf99c56 = Liik <c1/>: ajavea salvestis (linuxptp, chrony, TICC, TimeLabi või RINEX-i kellalogi või time_s,time_error_ns paarid) jagatakse operaatori esitatud kahe GNSS-i eemaldamise ja taastamise ajahetkega lähtetaseme, holdover'i ja taastumise sammuks; lähtetaset mõõdetakse lukustatud kellale kirjutatud ITU-T maskide vastu ja holdover'it holdover'ile või autonoomsele kellale kirjutatud maskide, ePRTC-A holdover'i mähise ja ajavea eelarvete vastu; holdover esitab vähimruutude sagedusnihke, mida süsteem hoidis, ning taastumine esitab, kas ja millal |TE| jõudis esitatud ribasse ja püsis seal esitatud viibeaja jooksul, koos tipu ja suurima sammuga. Iga piir on see, mille telekomi ajastuse liik ümber kirjutab; need kaks ajahetke on operaatori väide ja neid ei kontrollita

# text
seg-a54380cf95ea = Käsitsi arvutus salvestistel, mis on ehitatud valemitest, mille tõus, samm, äärmus ja taastumisaeg on enne käivitust teada (testid esitavad need), ning ülaltoodud telekomi ajastuse ridade maskid, mähis ja eelarved. Päris holdover'i laborimõõtmist ei hinnatud ja ühtegi välist sõltumatut etaloni ei võrreldud, seega liik ei esita väidet ühegi kella või süsteemi kohta; enne kui ühtegi kellaklassi näitajat saaks edutada, on vaja ajastuslabori partnerit

# text
seg-94cbac97a1aa = GNSS-i signaali kättesaadavus kosmoseteenuse mahus ja sellest kaugemal, võrreldud ICG SSV brošüüriga

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Liigi <c1/> kättesaadavuse pühkimised: konstellatsiooni kaupa (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kombineeritult (user, epoch) paaride osakaal, kus on vähemalt üks ja vähemalt neli signaali, ning pikim katkestus, kasutajale sfääril (brošüüri 2,562-punktiline globaalne kest, { "14" } päeva { "1" } minuti sammuga) või trajektooril (GEO, HEO, Kuu ülekanne), brošüüri lisa C Kepleri orbiitidest, konstantsest minimaalsest kiirgusvõimsusest etalonist kõrvalekaldenurga sees, Maa varjestusest sfääri pluss { "50" } km ja C/N0 lävest; kasutaja antennid brošüüri tabelist B10

# text
seg-d71c9d361342 = ICG kosmoseteenuse mahu brošüür (UN OOSA ST/SPACE/75, { "2018" }), ise simulatsioon, võrreldud enne käivitust sisestatud eelregistreeringu alusel (xval/gnss-ssv/PREREGISTRATION.md; tulemused failis xval/gnss-ssv/RESULTS.md, kinnitatud testiga tests/ssv_booklet_results.rs, möödalaskmised kaasa arvatud). Käivitus { "1" } eelregistreeritud lugemisel: minimaalse kiirgusvõimsuse konstandid ja Kuu lävi langevad kokku (S0, S6 täidetud); ülemise ja alumise SSV, RF-lävede, GEO ja HEO läved on NOT MET, peaaegu kõik GLONASS-i kaudu, mille jaoks brošüür annab { "20" } ja { "28" } kraadi tabelites B2 ja B6 ning { "26" } ja { "34" } kraadi tabelis { "4.2" }. Diagnostiline variant tabeli { "4.2" } nurkadega langeb kokku igas ülemise SSV-i, alumise SSV-i ja kuue GEO missiooni lahtris (see ei asenda käivitust { "1" }; RF-i, HEO ja Kuu lahtrid jäävad endiselt mööda). Mõõdetud GPS-i L1 paneelimustreid parameetriline asendaja ei reprodutseeri (RMS { "6" } kuni { "9" } dB { "3" } dB läve vastu). Kokkulangevus näitab, et brošüüri esitatud meetod on reprodutseeritud, mitte et GNSS-i signaalid nii käituksid

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Servakiire ionosfääri, plasmasfääri ja atmosfääri mõjud riivavatele GNSS-i signaalidele ning nõrga signaali vastuvõtja kavand liigis <c1/>

# text
seg-1a1786ba90b6 = Chapmani ionosfäär, Gallagheri-tüüpi plasmasfäär ja neutraalne atmosfäär (murdumisnäitaja paine, hapniku neeldumine, defokuseerumine), integreeritud mööda saatja ja kasutaja vahelist sirget kiirt: kaldkülje summaarne elektronsisaldus, selle plasmasfääriline osa, liigviivitus, puutekõrgus ja kadu riivavatel linkidel; ning nõrga signaali vastuvõtja kavand (koherentne ja mittekoherentne integreerimine, andmebiti piir, abistamine, Doppleri otsing), mis seab C/N0 läve omandamise ja jälgimissilmuse mudelitest

# text
seg-4ca1217472ab = Suletud kujud ja avaldatud suurused testides (Chapmani kihi tipp ja pinnaservapaine, mõned TECU plasmasfääri GPS-ist GEO-ni kiirel); vastuvõtja kavand kasutab uuesti omandamise ja jälgimissilmuse mudeleid ning nende teste. Ühtegi mõõdetud servasondeerimise või nõrga signaali vastuvõtu andmestikku sellega ei võrrelda

# text
seg-6b8f9f3ca2a3 = Pardal olev GNSS-i navigatsioonifilter kõrgete orbiitide ja Kuu ülekande kosmoselaevadele

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Liigi <c1/> režiim <c2/>: üheksaoleku laiendatud Kalmani filter (asukoht, kiirus, vastuvõtja kella nihe ja triiv, päikesekiirgusrõhu skaala) pseudovahemaadel, mille kättesaadavus, müra ja C/N0 tulevad samast link-geomeetriast kui pühkimistel; tõde integreeritakse J2, Päikese ja Kuu kolmanda keha ning kiirgusrõhuga varjuga, filter modelleerib J2 ja kolmandaid kehasid ning hindab kiirgusrõhku; esitab asukoha ja kiiruse vead GNSS-i orbiitide sees ja kohal, pikima mõõtmislünga ja keskmise NEES-i

# text
seg-469602656ab4 = Simuleeritud tõde filtri enda hinnangu vastu (järjepideva filtri keskmine normaliseeritud hinnangu ruutviga on asukoha puhul ligikaudu { "3" }) ja determinism fikseeritud algväärtuse (seed) korral. Ühtegi lennu- ega salvestatud kõrgorbiidi GNSS-i andmestikku ei võrrelda; Päike ja Kuu on madala täpsusega ringorbiidiga asendajad

# text
seg-5fc242476828 = Mitme kosmoselaeva formatsiooni suhteline navigatsioon väga elliptilisel orbiidil GNSS-i põhjal

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Liigi <c1/> režiim <c2/>: ülem ja alluvad käitavad igaüks absoluutfiltrit; alluva asukohta ülema suhtes hinnatakse absoluutsete hinnangute lahutamisega ja suhtelise filtriga ühe-diferentsiga pseudovahemaadel signaalidest, mida mõlemad laevad jälgivad, kusjuures suhteline dünaamika on kahe mittelineaarse trajektoori vahe

# text
seg-69c078b57fc8 = Sama simuleeritud tõde mis absoluutfiltril: suhtelise filtri viga tõelise suhtelise oleku vastu ning kontroll, et see on vähemalt sama hea kui kahe sõltumatu absoluutfiksi lahutamine. Ühtegi lennuformatsiooni andmestikku ei võrrelda

# text
seg-7038f6902820 = Külmaatomiinterferomeetri veaterminid: Ramani laserfaasi müra, lainefrondi kõveruse nihe ja vöötmitmetähenduslikkuse lahendamine

# text
seg-4d9690207607 = inertial::cai_error_terms (teegifunktsioonid, stsenaariumi liigist veel kättesaamatud): ruutimpulss-kolmeimpulss-interferomeetri Ramani faasi kaalufunktsioon (Cheinet et al. { "2008" }, valem { "8" }) valge faasi suletud kujuga (pi/2)^{ "2" } S_phi0/tau_R ja numbriline tee mis tahes spektri jaoks; laseri sageduse müra, mida retroreflektsiooni viivitus ei tühista (Le Gouet et al. { "2007" }, valemid { "9" } kuni { "11" }); termilise pilve puhta defokuseerumise lainefrondi nihe sigma_v^2/R ja selle vähendamine tuvastusraadiusega; vale vööndiindeksi tõenäosus erfc(pi/(sqrt({ "2" }) s)) klassikalise kiirendusmõõturi abi ja kahe küsitlusaja korral ning selle pöördfunktsioon

# text
seg-a7b220763674 = Iga suletud kuju sõltumatu numbrilise tee vastu testides (täpse ülekandefunktsiooni ja viivitusfiltri sagedusala kvadratuur, aatomite Monte Carlo lainefrondi nihke jaoks, mõõtekordade Monte Carlo vööndiindeksi jaoks) ja selle piirjuhud. Üks avaldatud läbiarvutatud väärtus: Cheinet et al. { "2008" } (arXiv:physics/0510197, jaotis IV) väidavad, et tau_R = { "20" } us korral on { "1" } mrad mõõtekorra kohta vaja valget Ramani faasimüra alla -111 dB rad^2/Hz; ainult valge liige annab { "0.99" } mrad (artikkel tuletab taseme oma valemiga { "17" }, flicker pluss valge). Sisemine kooskõla ja üks läbiarvutatud väärtus, mitte väline valideerimine; kõrgemat järku aberratsioone ja ühegi konkreetse laseri müra ei modelleerita

# text
seg-c380ec16a4f8 = Greenhalli ja Riley täpsed ekvivalentsed vabadusastmed Alani, modifitseeritud Alani ja Hadamardi dispersioonidele

# text
seg-dee2a54c5019 = allan::edf_greenhall (koos ümbristega edf_greenhall_adev, _mdev ja _hdev): Greenhalli ja Riley täielik algoritm, Proc. 35th PTTI ({ "2003" }), jagu { "3" } (valemid { "7" } kuni { "13" } ja suure J koefitsiendid tabelitest { "1" } kuni { "3" }), diferentsiaaljärkudele { "1" } kuni { "3" }, müra astendajatele +{ "2" } kuni -4 kõikjal, kus alpha + 2d > { "1" }, kattuvatele ja mittekattuvatele, modifitseeritud ja modifitseerimata hindajatele; NaN seal, kus see ei kehti, sealhulgas modifitseerimata valge PM juhul, kus ceil(M/S) <= d, mille suletud kuju ei ole teostatud. assurance::uncertainty::edf kasutab nüüd sama koodi ja säilitab oma väljundid bitipõhiselt

# text
seg-363705e03bac = Ostsillaatori holdover'i eelseaded avalikest andmelehtedest

# text
seg-9750d9e0ec7a = Neli eelseadet – OCXO (Microchip OX-208), rubiidium (Microchip 8040C), tseesium (Microchip 5071A high-performance tube) ja CSAC (Microchip SA.45s) – igaüks kannab oma andmelehe Alani hälbe maksimume, vananemist ja temperatuuripiiri; mittenegatiivsete vähimruutude valge + flicker + juhuslik käik sagedusmüra sobitus, skaleeritud igat andmelehe punkti ümbritsema, flickeri põrand mitte kunagi pikima-τ näitajast madalam, lineaarne vananemine ja siinuseline temperatuuriliige, sünteesitud seemnestatud holdover'ina pärast GNSS-i kadu

# text
seg-69f93d5ec864 = Holdover'i ennustus mõõdetud kellasalvestisest, kontrollitud tagasihoitud andmetel

# text
# c1: slot-timing
seg-8bdc5a24c66d = Liigi <c1/> mõõdetud salvestise tee: faasisalvestise kattuv Alani hälve, sobitatud edf-kaalutud mittenegatiivsete vähimruutudega valge faasi ja IEEE Std { "1139" } sageduse modulatsiooni baasis (slot_timing::fit_weighted), seejärel pööratud ümber rannikuaja jaoks, mil ajaviga jõuab läveni (slot_timing::slot_budget). Punase müra põrand mõõdetakse salvestisest, mitte ei eeldata

# text
seg-c888226296fe = Tõeline vabalt töötav aatomkell: { "556 990" } ühesekundilist faasivalimit 5071A tseesiumistandardist, mõõdetuna vesiniku maseri vastu (A. Wallin, levitatud koos allantoolsiga; kinnitatud commit ja SHA-256 failis scripts/fetch_cs5071a.sh), sama salvestis, mida tests/cs5071a_reference.rs kasutab hindajate jaoks. Tagasihoitud kaks kolmandikku on väline mõõtmine, mida ennustus kunagi ei näinud. Andmetest sõltuv: realdata-clock töövoog toob salvestise ja käivitab testi KSHANA_REQUIRE_REALDATA={ "1" }. Valideerib sobita-seejärel-pööra tee valge-FM-domineeritud aatomstandardil kuni umbes { "50 000" } s rannikuaegadel; mitte andmelehe ega klassi allikaid, mitte deterministlikke liikmeid. MITTE kristallostsillaator: mõõdetud OCXO salvestisel (tests/slot_timing_ocxo_holdout.rs, allantools, { "5.5" } h vesiniku maseri vastu) on tagasihoitud ennustus konservatiivne, { "0.59" } kuni { "0.70" } mõõdetud rikkumisest, ja enamasti läveväline, sest selle ostsillaatori mürapõrand langes salvestise jooksul poole võrra; valimis on see { "0.98" } kuni { "1.17" } piires. Kristallijuhtum jääb MODELLED. MITTE ka orbiidil olevad aatomkellad: { "10" } GPS Block IIF satelliidikellal (tests/slot_timing_igs_holdout.rs, IGS-i lõplikud { "30" } s kellad, { "14" } päeva, protokoll kirjutatud enne allalaadimist) jääb { "8" } läve sisse ja { "2" } (G25, G30) on optimistlikud kuni umbes 2x, seega jääb orbitaaljuhtum protokolli all MODELLED

# text
seg-d7e03158b972 = Sekundid, kuni vabalt töötav kell lahkub ajaindekseeritud pesa kaitsevahemikust, ning fiksimistihedus, mis hoiab selle sees

# text
# c1: slot-timing
seg-0b4d8815f756 = Liik <c1/>: ennustatud viga E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² pööratud rikkumise, järelejäänud aja, fiksi latentsust arvestava uuestisünkroniseerimise intervalli ja päevas vajalike fiksimiste jaoks, iga liige eritletud ja domineeriv nimetatud; kellad kuue ClockClass vaikeväärtuse (TCXO, OCXO ja RAFS lisatud, igaüks tsiteerib ühte andmelehte), telekomi ajastuse eelseadete, reasisese andmelehe või mõõdetud salvestise põhjal; allika pikimast keskmistamisajast kaugemale jääv rikkumine märgitakse ekstrapoleeritud

# text
seg-cc0464060e58 = Suletud kujud iga liikme jaoks eraldi ja sõltumatu holdover::holdover_seconds juureotsing; andmelehe näitajad on nimetatud dokumendid (docs/SLOT-TIMING.md). Klassi vaikeväärtus tugineb eeldatud punase müra põrandale ja andmelehe allikas on maksimumide mähis, seega ei ole kumbki ühegi seadme mõõtmine

# text
seg-2797643153dc = Ajastuse kaitsetase orbiidil olevale vastuvõtjale GNSS-i spuufimise korral

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, kättesaadav liigi <c1/> spuufimise jaotisena: ringorbiidi kiirus ja periood, pikim aeg, mille jooksul maapealne spuufija suudab satelliiti ühe läbilennu kohta mõjutada, kellaabistatud monitori põrand ja CUSUM-i tuvastusviivitus, tingimuslik kaitsetase (põrand pluss rannikuaeg viivituse jooksul), kõrvalekalle, mille esitatud maksimaalse tõusukiirusega spuufija koguneb, enne kui satelliit lahkub oma jalajäljest või käivitub sõltumatu kontroll, ning see, kas iga maajaama või ristlingi kontroll on ühest maapealsest spuufijast sõltumatu

# text
seg-3d441db3a373 = Taandamine olemasolevale ajastuse kaitsetasemele ning ringorbiidi ja sfäärilise Maa nähtavuse suletud kujudele. Tingimuslik tuvastamisele, üks maapealne spuufija esitatud tõusukiirusel, otse pealelend mittepöörleval Maal; orbiidil olevat spuufitud vastuvõtjat ei ole valideeritud

# text
seg-158a99d40b0d = Suletud kujul L-riba signaali võimsusspektri tihedused ja spektraalse eraldatuse koefitsiendid

# text
seg-17060c71fa54 = GPS-i L1 C/A ja L2C (BPSK({ "1" })), GPS-i L5 ja Galileo E5a (BPSK({ "10" })), siinus-BOC({ "1,1" }) ja Galileo E1 MBOC(6,1,1/11) ühikalaga võimsusspektri tihedused (navsignal::Modulation::psd, lisatud MBOC variandiga), nende numbriliselt leitud nullid ja maksimumid (spectrum::psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz) ning signaali spektraalse eraldatuse koefitsient mis tahes spektri vastu mis tahes nihkel (navsignal::spectral_separation_coeff_offset) või tooni, lameda müra, chirpi või sobitatud müra vastu (spectrum::Jammer::ssc), koos segamisvastase koefitsiendiga Q = 1/(R_c kappa)

# text
seg-d8fadba57203 = Avaldatud õpikuväärtused: BPSK(n) peaviiluline laius 2n x { "1.023" } MHz nullist nullini ja segamisvastased koefitsiendid Q = { "1" } kitsaribalise (CW) segaja korral ning Q = { "1.5" } C/A-le sobitatud hajaspektrisegaja korral (Kaplan & Hegarty, Understanding GPS/GNSS, 3. tr., jagu { "9.4" }); BOC(m,n) peaviilud keskmega ± m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" }); spektraalse eraldatuse koefitsiendid -61.8, -64.8 ja -67.8 dB/Hz C/A-le C/A-ga, BOC({ "1,1" })-le BOC({ "1,1" })-ga ja C/A-le BOC({ "1,1" })-ga (Betz { "2001" }; Hein et al., MBOC: The New Optimized Spreading Modulation Recommended for Galileo L1 OS and GPS L1C, Inside GNSS, mai/juuni { "2006" }), siin reprodutseeritud nende Parsevali autokorrelatsiooni suletud kujudest. BOC({ "1,1" }) maksimum ei ole kohal { "1.023" } MHz: viil ulatub kandja nullist kuni { "2.046" } MHz ja haripunkt on { "0.759" } MHz juures, ning test kinnitab mõlemat. MBOC segu on ICD definitsioon, mida kontrollitakse ainult ühikala ja lineaarsuse suhtes

# text
seg-f134975d4ffa = L-riba spektri koskdiagramm ribapõhise J/S-i ja efektiivse C/N0-ga stsenaariumipõhise segaja ajajoone all

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Liik <c1/>: L-riba võimsusspektri tiheduse sagedus-aja ruudustik (termiline põrand k T_sys, kus T_sys = T_ant + { "290" } K (F - { "1" }), signaalid oma liidesespetsifikatsiooni minimaalsetel vastuvõetud võimsustel ning pidevlaine-, kitsariba-, chirp- ja sobitatud müra segajad sisse/välja lülitusaegadega), iga lahter keskmistatud oma ribal ja real (chirpid täpselt täis- ja osapühkimistel, segajad töötsükli järgi), ribapõhine efektiivne C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1 rea kohta, ribapõhine J/S, ribasisene J/S ja C/N0 tulpadega SVG koskdiagramm. Aruanne sisaldab ristkontrolli liigi <c2/> ahela vastu samadel link-sisenditel

# text
# c1: jamming
# c2: jamming
seg-deead3dc3c43 = Taandamine olemasoleva liigi <c1/> segamisvastasele võrrandile ja linkide eelarvele (sama kood, kutsutud samadel sisenditel) ning k T0 F müra põranda suletud kujule. Aluseks olevad signaalispektrid on ülaltoodud valideeritud rida; segajate võimsused, ajajoon ja sisendotsa ribalaiused on stsenaariumi sisendid, spektrid on pidevad (hajutuskoodi jooni pole) ning segajale ei mõju automaatne võimenduse reguleerimine, blankimine ega antennimuster. Hoidlas puudub mõõdetud segatud spekter, mille vastu komposiiti kontrollida. Liigi <c2/> Q-tabel (CW ja kitsariba { "1" }, laiariba ja pühitud { "2" } alates { "0.36" }: õpikuväärtused, kinnitatud navsignali suletud kujude külge) langeb kokku selle mudeli CW väärtusega ja erineb sellest, mille see tuletab C/A-le sobitatud müra ({ "1.5" }) ja ribasisese normaliseerimiseta lameda nullist-nullini müra ({ "2.2" }) jaoks; aruanne trükib mõlemad

# text
seg-1461dcaed6be = SigMF salvestise sisend ja väljund ning kompleksse IQ Welchi spektrihinnangud

# text
# c1: spectrum
seg-2195d95299b2 = sigmf: Signal Metadata Format salvestiste lugemine ja kirjutamine (JSON .sigmf-meta põhiväljadega global, captures ja annotations; toores .sigmf-data kujul cf32_le, ci16_le või ci8, täisarvudekooderid jagatud failiga realdata::iqif::load_iq), kõik stringidel ja baidipuhvritel. spectrum::welch_psd: Hanni aknaga, kattuvad, keskmistatud periodogrammid, tihedusskaleeritud, kasti-sisesel radix-2 teisendusel (spectrum::fft_in_place). Need kaks on valideeritud väide. spectrum::synthesise_iq joonistab mudeli IQ-na ning liigi <c1/> jaotis [iq] käivitab mudel -> IQ -> SigMF -> Welch ja võrdleb mudeliga; selle jaotis [recording] hindab päris salvestist (natiivsed järgud); süntees ja need mudelivõrdlused jäävad valideeritud väitest välja

# text
seg-4e51d1a77382 = scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) sama perioodilise Hanni akna, kattuvuse, tihedusskaleerimise, detrendita ja kahepoolse keskmise keskmistamisega: iga bin suhtelise täpsusega { "1e-12" } (täheldatud { "6.0e-14" }) { "27" } juhul, segmentide arvud võetud scipy enda spektrogrammist. sigmf-python { "1.13.0" } (LGPL-3.0, käivitatud tööriistana) kirjutab viis kolmanda osapoole salvestist (cf32_le, ci16_le, ci8, kaks annotatsioonidega salvestist, nullist erinev esimene sample_start), mida kast dekodeerib bitipõhiselt identselt identsete põhiväljadega, ning loeb kasti salvestised bitipõhiselt identselt tagasi; SigMF { "v1.2.6" } metaandmete skeem teatab kasti metaandmetel nulli viga. Tolerantsid kinnitati enne esimest võrdlust. Väitest väljas: spectrum::synthesise_iq ning [iq] ja [recording] võrdlused mudeliga (sünteesil pole ühte õiget vastust; perioodiline chirp näitab jooni, Fresneli lainetust ja servasabasid, mida sile mudel ei sisalda, koguvõimsus { "2" } % piires), täisarvu-ujukoma skaleerimise kokkulepe (kast jagab arvudega { "32767" } ja { "127" }, sigmf-pythoni autoscale arvudega { "2" }^{ "15" } ja { "2" }^{ "7" }, mille spetsifikatsioon jätab lahtiseks; võrdlus kasutab toorkoode), mitmekanalilised salvestised ja andmetüübid, mida lugeja tagasi lükkab

# text
seg-bf2d02d76762 = Planeetide asukohad üle Päikesesüsteemi JPL Standishi Kepleri elementidest

# text
# c1: solar-system
seg-c9d3549045eb = Merkuuri, Veenuse, Maa-Kuu barütsentri, Maa, Marsi, Jupiteri ja Saturni heliotsentrilised asukohad Standishi tabelist { "1" } ({ "1800" } pKr kuni { "2050" } pKr) ning kõigi kaheksa planeedi omad tabelitest 2a/2b ({ "3000" } eKr kuni { "3000" } pKr, koos b, c, s, f keskanomaalia liikmetega), järgides JPL-i lehe algoritmi samm sammult ja pööratud ICRF-i (rahvusvaheline taevane etalonkaader) lehe kaldenurgaga; Maa eraldatakse barütsentrist Montenbrucki & Gilli Kuu rea ja massisuhtega. Komponeeritud kujul ephem_provider::AnalyticSolarSystem, nii et mis tahes keha on kättesaadav mis tahes teise suhtes, ning käivitatav liigina <c1/>

# text
seg-4ea08a296b37 = Päikese, Kuu, Merkuuri ja Veenuse asukohad DE440 kernelist UTC epohhidel (KernelEphemeris)

# text
seg-8d47467c36e4 = Päikese, Merkuuri, Veenuse, Maa ja Kuu geomeetrilised asukohad üksteise suhtes (J2000/ICRF teljed, meetrites) JPL DE440 kernelist läbi ephem_provider::KernelEphemeris UTC epohhidel: kehanimed kaardistatud NAIF-i koodidele, UTC viidud läbi liigsekundite tabeli ning TT-st TDB-sse kahe liikmega TDB-TT reaga, kernel loetud mootori enda lugejaga. Keha, mida kernel hoiab ainult süsteemi barütsentrina (Marss kuni Neptuun, Pluuto failis de440s), lükatakse tagasi, mitte kunagi ei asendata. Kernelivaba Standishi rida jääb brauseri ja varuvõimaluse teeks

# text
seg-b59153f28d69 = Valguse käiguaeg Päikesesüsteemi kehade vahel

# text
# c1: solar-system
# c2: body-pnt
seg-48ebe0983725 = Newtoni ühesuunaline valguse käiguaeg mis tahes kehast mis tahes teiseni, vastu võetud epohhil, lahendatud radiomeetrilise kinnispunkti valguse käiguaja lahendajaga (radiometric::light_time_solution, saatja oma hilinenud asukohas) läbi solar_system::link_on mis tahes EphemerisProvideril; Päikesesüsteemi liik käivitab selle analüütilisel Päikesesüsteemil heliotsentrilises kaadris (solar_system::link). Kahesuunaline kaugus funktsioonist radiometric::two_way_range ja Päikese Shapiro viivitus funktsioonist radiometric::shapiro_delay esitatakse eraldi ning neid välist teed ei võrrelda. Väljastatud iga keha kohta vaatleja suhtes ja mis tahes lisalingi kohta liigi <c1/> poolt ning keha-Maa allalingi kohta liigi <c2/> poolt

# text
seg-6e0b9687e8ee = Uraan ja Neptuun Standishi tabelist { "1" }, Pluuto ja planeetide kiirused

# text
seg-df3bf502dfe9 = Uraani ja Neptuuni asukohad Standishi tabelist { "1" } (vaikimisi vahemikus { "1800" } pKr kuni { "2050" } pKr), Pluuto { "1992" } tabeli { "1" } realt, mida praegune JPL-i leht enam ei loetle, ning iga planeedi heliotsentriline kiirus: kahe keha tuletis elementidest tulenevat keskmist liikumist kasutades pluss ellipsi pöörlemine periheeli, kaldenurga ja sõlme kiiruste tõttu

# text
seg-f49245efe44f = Mõõdetud JPL Horizons DE441 vastu (samad sisestatud fikstuurid), kuid mitte valideeritud: Standishi tabeli { "1" } esitatud näitajaid Uraani ja Neptuuni kohta ületatakse kuni { "2.0" } ja { "5.2" } korda DE441 heliotsentriliste asukohtade vastu (Neptuun vastab neile barütsentriliste asukohtade vastu, mis viitab, et sobitus ei olnud heliotsentriline), leht ei esita Pluuto kohta viga ning kiiruste kohta puudub avaldatud piir. Tabelid 2a/2b vastavad oma näitajatele Uraani ja Neptuuni kohta ning on kaetud valideeritud real

# text
seg-a50be56f605a = Kuu ja seitsme suure kuu (Phobos, Deimos, Galilei kuud, Titan) asukohad

# text
seg-2cfbe5a1eece = Geotsentriline Kuu Montenbrucki & Gilli reast (mille -1.3972 kraadi sajandis liige viitab selle juba J2000 pööripäevale), ning Phobose, Deimose, Io, Europa, Ganymedese ja Callisto planetotsentrilised asukohad ja kiirused JPL Solar System Dynamicsi keskmistest elementidest iga kuu Laplace'i tasandis, kus keskmise pikkuse kiirus on võetud IAU sünkroonse pöörlemiskiiruse järgi (tabel trükib perioodi liiga vähese arvu numbritega, et faasi hoida), ning Titani IAU pöörlemismudelist (kuu miinus keha-kinnise x-telje peal keskmisel kaugusel), sest Titani trükitud Laplace'i tasandi rida ei reprodutseeri Horizonsit isegi oma epohhil

# text
seg-6c81bd570fe5 = Mõõdetud JPL Horizonsi satelliidiefemeriidide (DE441, MAR099, JUP365, SAT441) vastu, sisestatud failis tests/fixtures/solar_system/horizons_satellites_icrf.csv koos päringu ja toomise kuupäevaga; keskmiste elementide ega pöörlemismudeli paigutuse kohta avaldatud täpsust ei ole, seega kinnitatud läved püüavad regressioone ega valideeri. Keskmised elemendid jätavad välja resonantsed ja päikeselised häired ning Phobose sekulaarset kiirendust ei modelleerita

# text
seg-8b8c8e28ece9 = Iga Päikesesüsteemi keha füüsikalised konstandid ja kogu süsteemi aruanne

# text
# c1: solar-system
seg-d225a30de35c = Keha lisab Merkuuri, Veenuse, Jupiteri, Saturni, Uraani, Neptuuni, Pluuto, Phobose, Deimose, Io, Europa, Ganymedese, Callisto ja Titani (gravitatsiooniparameeter, etalonraadius, J2 seal, kus see on avaldatud, koos raadiusega, millele see viitab, IAU poolus ja nullmeridiaan), nimeotsingu ja BodyFacts kirje (NAIF-i kood, klass, vanem, ekvatoriaalne ja keskmine raadius); liik <c1/> esitab need kõigi kaheksateistkümne keha kohta koos asukohtade, käiguaegade ja ühe tiiru orbiidijäljega, iga keha märgistatud VALIDATED või MODELLED

# text
seg-6adc29de51fd = Avaldatud konstantide ümberkirjutus, igaüks viidatud seal, kus see on defineeritud: gravitatsiooniparameetrid JPL Horizonsi keha kirjetest ja JPL-i satelliitide füüsikaliste parameetrite tabelist, raadiused JPL-i füüsikaliste parameetrite tabelitest (IAU WGCCRE { "2015" }), poolused ja nullmeridiaanid IAU kartograafiliste koordinaatide ja pöörlemiselementide töörühmalt (keskmised väärtused, ilma T-kiiruse ja perioodiliste liikmeteta), J2 allikatest Smith et al. { "2012" }, Iess et al. { "2018" } ja { "2019" } ning Jacobson { "2009" } ja { "2014" }. Kontrollitud sisemise kooskõla suhtes (Jupiteri pöörlemisperiood System III kiiruse vastu, iga J2 oma etalonraadiuse vastu), mitte välise sõltumatu etaloni vastu. { "0.30" } voor { "2" }: GM-i väärtused võeti failist gm_de440 ning Phobose ja Deimose elemendid failist pck00011, seega { "0" } { "84" } konstandist neljateistkümne lisatud keha puhul erineb nüüd NAIF-ist (oli { "12" }), mis on ümberkirjutuse kontroll ja mida ei loeta. { "0.36" }: IAU kehakinnine orientatsioon ja neljateistkümne lisatud keha GM on eraldatud oma VALIDATED reale („IAU body orientation and gravitational parameter of the fourteen added solar-system bodies“); see rida hoiab alles ülejäänu. J2 ja keskmine raadius on viidatud, mitte valideeritud; aruande asukohad toetuvad oma ridadele; ning aruande prime_meridian_deg Maa, Kuu ja Marsi jaoks jääb tavapärastele konstantidele (kuni { "6.6e-3" }, { "2.8e-2" } ja { "9.6e-4" } rad suuruses IAU_<BODY>-st). { "0.30" } redaktsioonid: Phobose GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimose { "9.62e4" } -> { "9.615569648120313e4" }, Uraani { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptuuni { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluuto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Phobose ekvatoriaalraadius { "13.1" } -> { "13.0" } km; prime_meridian_deg sisaldab nüüd ruutliiget ja perioodilisi liikmeid

# text
seg-fa8a4b082cd5 = Neljateistkümne lisatud Päikesesüsteemi keha IAU kehaorientatsioon ja gravitatsiooniparameeter

# text
seg-fc8d277aa2fd = Body::iau_rotation_et, pööre J2000-st IAU kehakinnisesse kaadrisse Merkuuri, Veenuse, Jupiteri, Saturni, Uraani, Neptuuni, Pluuto, Phobose, Deimose, Io, Europa, Ganymedese, Callisto ja Titani jaoks koos iga sajandikiiruse, ruutliikme ja perioodilise liikmega, mida keha failis pck00011 kannab, ning sama neljateistkümne keha gravitatsiooniparameetri väli mu. Päike, Maa, Kuu ja Marss kannavad tavapäraseid konstante, mis kuuluvad teistele ridadele, ja neid ei kata

# text
seg-87ab655f8270 = Positsioneerimine mis tahes Päikesesüsteemi keha ümber kohaliku konstellatsiooni ja sügavkosmoselingiga Maalt

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Liik <c1/>: nime järgi valitud keha ümber olev orbiter või pinnalander navigeerib keha ümber oleva Walkeri navigatsioonikonstellatsiooni ühesuunaliste pseudovahemaadega (kahe keha orbiidid keha J2 sekulaarse triiviga, tundmatu kasutaja kell) ja valikulise kellavaba kahesuunalise kaugusega Maalt, Maa suund ja kaugus analüütilisest efemeriidist igal epohhil; keha sfääri blokeeritud vaatekiired ja pinna kõrgusmask; epohhi kohta ainult konstellatsiooni GDOP ja PDOP (orbit::dop), formaalne asukohaebakindlus Maa reaga ja ilma ning seemnestatud Gauss-Newtoni fiksid (batch_ls::gauss_newton) kumbagi moodi, koos keha-Maa valguse käiguaja ja edasi-tagasi teega

# text
seg-3538c49df107 = Suletud kujud ja enesekooskõla: Kepleri kolmas seadus releeperioodi jaoks, orbiidiraadius ja pinnaraadius, mis hoitakse kogu jooksu vältel, mõõtmise lisamine, mis formaalset ebakindlust kunagi ei suurenda, ning seemnestatud vead, mis langevad kokku kovariatsiooniga. Releeorbiidid ignoreerivad kolmandaid kehasid (Jupiteri tõmmet Europa ümber olevatele releedele ei modelleerita), müra on Gaussi esitatud tasemetel ja mõõtmismudel on hetkeline, seega ei ole see valideeritud ühegi missiooni navigatsiooniandmete vastu

# text
seg-281b680a9897 = Walkeri konstellatsiooni geomeetria ja GPS-i, Galileo ning GLONASS-i avaldatud nominaalsed pesad

# text
# c1: constellation-design
seg-cba54289b732 = Liigi <c1/> generaatorid: Walkeri delta- ja tähemustrid T/P/F kokkuleppes (sõlmede vahe 360/P või 180/P, tasandisisene vahe { "360" }·P/T, tasandite vaheline faasinihe { "360" }·F/T) ning GPS-i baasjoon ja laiendatav 24-pesaline, Galileo ja GLONASS-i eelseaded, mis on ehitatud nende avaldatud nominaalelementidest ja paigutatud Maaga kinnisesse kaadrisse nende dokumentide esitatud Greenwichi tunninurga järgi

# text
seg-bdf83007af50 = Avaldatud agentuuride dokumendid: Galileo Open Service Service Definition Document väljaanne { "1.1" } (European GNSS Service Centre) tabelid { "1" } ja { "23" }, etalonkonstellatsioon 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document väljaanne { "5.1" } ({ "2008" }) jagu { "5.2" }, pesavalem sõlme pikkuse ja laiuse argumendi jaoks; GPS Standard Positioning Service Performance Standard 5. väljaanne (aprill { "2020" }) tabelid 3.2-1, 3.2-2 ja 3.2-3, sealhulgas jälje ekvaatoriületuse veerg, mis on sõltumatu väide Maaga kinnise geomeetria kohta, mida eelseade peab reprodutseerima. Valideerib generaatoreid ja ümberkirjutust; BeiDou keskorbiidi faas ja kaldus geosünkroonsed sõlmed ei ole avaldatud ning neid ei kata

# text
seg-0f1d49ab5d51 = GPS-i baaskonstellatsiooni globaalne täpsuse halvenemise tegur

# text
# c1: constellation-design
seg-83775b77f5ca = Liigi <c1/> katvusmootor GPS-i baasjoone 24-pesalisel eelseadel GPS Standard Positioning Service Performance Standardi (SPS PS) lisa B tingimustel (üks tähepäev, { "287" } viieminutilist sammu, { "4" } x { "4" } kraadi globaalne ruudustik, kaalutud laiuskraadi koosinusega, kõik nähtavuses, { "5" } kraadi mask, üks vastuvõtja kell): globaalne HDOP-i jaotus, PDOP-i mediaan ja PDOP-i vähemalt-6 kättesaadavus, globaalselt ja halvimas kohas

# text
seg-6fb3c2028c4a = GPS SPS PS 5. väljaanne (aprill { "2020" }) lisa B jaotised B.3.2.2 ja B.3.2.3, täielikult hõivatud baaskonstellatsiooni 24 pesa avaldatud globaalse keskmise HDOP-i jaotus (mediaan { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, keskmine { "0.96" }), tabel 3.8-1 (PDOP-i kättesaadavus) ja tabel B.3-1 (degradeerunud konstellatsiooni ansambli PDOP, kasutatud ainult ülempiirina), pluss käsitsi tuletatud suletud kuju ühe epohhi jaoks. Täieliku konstellatsiooni VDOP-i ja PDOP-i jaotused on avaldatud ainult joonisena, seega on PDOP kinnitatud ühepoolselt; halvim aeg-ruumi punkt (HDOP { "2.40" } ja VDOP { "5.22" } siin, { "2.49" } ja { "5.43" } avaldatud) sõltub ruudustikust ja on esitatud, mitte kinnitatud

# text
seg-7d4d7200cbca = Katvuse ja täpsuse halvenemise tegurite kaardid suvaliste mitme konstellatsiooni kavandite jaoks suures mahus, mis tahes keskkeha ümber

# text
# c1: constellation-design
seg-b78b79e9fae4 = Liik <c1/> kahest kinnitatud juhust kaugemale: selged ja mitmekihilised kavandid, mitu konstellatsiooni jooksu kohta ühe vastuvõtja kellaga konstellatsiooni kohta, Maa, Kuu ja Marss keha konstantidest, BeiDou eelseade (keskorbiidi faas ja { "118" } kraadi E kaldus geosünkroonne ületus modelleeritud), lahtri kohta nähtavad satelliidid, GDOP, PDOP, HDOP, VDOP ja kättesaadavus, hõrendatud maajäljed ning satelliidialuse laiuskraadi nähtavuse eelfilter, mis käitab { "5" } 000 satelliidi kavandi { "10" } kraadi ruudustikul sekundi murdosaga

# text
seg-278c77438493 = Aheldatud missioon üle stsenaariumi liikide ühel jagatud ajajoonel

# text
# c1: campaign
seg-3dcfb26f6234 = Liigi <c1/> faasid: iga faas käivitab run_toml kaudu ühe või mitu olemasolevate liikide stsenaariumi, loeb nende väljundid nimega kanaleisse (kella ajaviga ja kaitsevahemik, keskmine efektiivne kandja ja müra tiheduse suhe ja jälgimispõrand, vertikaalne kaitsetase ja häirepiir, asukohaviga, jälgivad satelliidid, häirelipud) liigipõhiste eelseadete või selgete tulemuste teede kaudu, paigutab need faasi algusesse ja hoiab need ühisel ruudustikul, faasipiiride ja sündmustega; olek antakse edasi carry (kanal jätkub eelmise faasi lõppväärtusest), handoff (eelmise faasi number kirjutatud järgmisse stsenaariumi) ja end_at (faas lõpeb ajal, mille jooksutus arvutas, näiteks spuufimismonitori tuvastusajal) kaudu; kampaania räsi ja kokkuvõte üle iga liikme tulemuse

# text
seg-fd018ef7bc3b = Kompositsioonisamasused samade liikide eraldiseisvate jooksutuste vastu: ühefaasiline kampaania reprodutseerib eraldiseisva väljundi bitipõhiselt, kantud nihe võrdub eelmise jooksutuse enda viimase valimiga ja faas, mille lõpetab end_at, on täpselt jooksutuse tuvastusaja pikkune. Liitev kandmine üle faasipiiri ja nullijärku hoidmine on modelleerimisvalikud ning iga faas on nii hea kui liik, mis seda käitas; ühtegi aheldatud missiooni pole mõõdetud missiooniga kontrollitud

# text
seg-ad6105af464c = Parameetripühkimised ja seemnestatud Monte Carlo ansamblid üle mis tahes stsenaariumi liigi

# text
# c1: campaign
seg-95921611839e = Liigi <c1/> sweep (üks kuni kolm punktiga eraldatud võtit mis tahes liigist, üldise pühkimise telje väärtustel, valikuliselt ansambel igas sõlmes) ja monte_carlo jaotised: realisatsioon k käivitub väärtusel base_seed + k; iga mõõdik esitab keskmise, standardhälbe, lähima järgu 5./50./95. protsentiili ja fikseeritud algväärtusega protsentiili-bootstrapi { "95" }% usaldusvahemiku keskmisele (inertial::metric_stat); mõõdiku ühikud loetakse pühitud liigi enda units-plokist

# text
seg-03d15c27b3b9 = Faasi juhusliku käigu suletud kuju valge sagedusmüra korral, dispersioon q_wf tau (NIST Technical Note { "1337" }), statistikamasinavärgi jaoks ning baidipõhine võrdsus eraldiseisvate jooksutustega seemnestamise jaoks. See kontrollib ansambli aritmeetikat mootori enda kellamudelil, mitte välist andmestikku

# text
seg-24327a0ed82e = Mitu stsenaariumi jagatud tingimustes koos kombineeritud kokkuvõttega

# text
# c1: campaign
seg-5833fb3b06e3 = Liigi <c1/> compose jaotis: nimega jagatud väärtused (näiteks ühe segaja võimsus ja asukoht) kirjutatakse igasse liikmesse võtmetele, millega need on seotud, iga liige käivitatakse ning mõõdiku kohta esitatakse liikmete väikseim, suurim ja keskmine väärtus koos nimetatud liikmega; mõõdikuühikud peavad liikmete vahel kokku langema

# text
seg-67ffd6684b1c = Kompositsioonisamasus eraldiseisva jooksutuse vastu. Jagatud tingimuste aritmeetika on raamatupidamine; füüsika on liikmeliikide oma, igaühel oma rida

# text
seg-0bc866720bde = Piiratud optimeerimine ühe mõõdiku järgi kampaania parameetrite üle

# text
# c1: campaign
seg-f9bdb89c2b4f = Liigi <c1/> optimize jaotis (CAP-32): üks kuni kolm punktiga eraldatud stsenaariumivõtit piiratud vahemikuga [lo, hi] lin- või log-skaalal, üks mõõdik loetud tulemuse tee järgi, eesmärk minimize, maximize või target; meetod grid (pühkimise telje väärtused) või deterministlik Nelder-Meadi simpleks normaliseeritud koordinaatides kasti projektsiooni ja standardkoefitsientidega; puuduv või mittelõplik mõõdik saab halvima skoori ja jääb jälje sisse; kui runs > { "1" }, on mõõdik ühiste seemnete keskmine; iga hindamine on nimetatud liigi päris jooksutus, loetletud trace'is ja arvestatud reprodutseeritavuse kokkuvõttes

# text
seg-e3a2f80b04dc = Ainult sisemine: täpne -20 log10(range) suletud kuju link-võrrandist, sõltumatu toorjõu ruudustik samal liigil ja Rosenbrocki funktsioon. Vooru { "1" } 1-D lävi on NOT MET (eelregistreeritud kast jättis { "3" } dB lahenduse välja; optimeerija peatus piiril), registreeritud failis docs/design/evidence/cap32-optimize/RESULTS.md ja uuesti ei hinnatud. Optimum on kohalik kasti ja alguspunkti suhtes; globaalse optimumi väidet ei ole

# text
seg-b9b1637d326c = Ribapiiratud suletud kujud mis tahes kaugusmõõtmise signaalile: võimsus ribas ja varajane-hiline koodijälgimise värin avaldatud väärtuste vastu, kusjuures Gabori ribalaius ja nihkega spektraalne eraldatus on ristkontrollitud

# text
# c1: leo-signal
seg-6cfdc433b120 = navsignal: siinusintegraal (sine_integral), BPSK-R võimsuse osa kahepoolses ribas suletud kujul (bpsk_power_in_band_closed_form), ribapiiratud BPSK Gabori ribalaius suletud kujul (bpsk_gabor_bandwidth_closed_form_hz), ribapiiratud koherentne ja mittekoherentne varajane-hiline viivitussilmuse värin mis tahes ühikalaga spektri jaoks Betzi & Kolodziejski järgi { "2009" } (dll_jitter_bandlimited_s) ja selle kaduva vahega Gabori piir (dll_jitter_small_spacing_limit_s), nihkega BPSK spektraalse eraldatuse koefitsient suletud kujul (bpsk_offset_ssc_closed_form), Galileo E5 AltBOC({ "15,10" }) spekter (altboc_15_10_psd) ja moduleerimismärgise parser (parse_modulation); liik <c1/> kasutab seda iga signaalikavandi jaoks

# text
seg-15d8c44be46f = Väliselt kinnitatud: { "90.3" } protsenti peaviilu võimsust, koherentne varajane-hiline värin esitatud tööpunktis, siinusintegraali tabeliväärtused ja BPSK enda spektraalse eraldatuse koefitsient 2/({ "3" } R_c) nullnihkel. Ainult sisemised ristkontrollid, mitte väline valideerimine: ribapiiratud BPSK Gabori ribalaiuse suletud kuju ja selle asümptoot ning nihkega BPSK spektraalse eraldatuse koefitsient nullist erinevatel nihetel, mõlemad siin tuletatud ja kvadratuuri vastu kontrollitud. Avaldatud suletud kujud: BPSK-R sinc-ruut spekter ja selle { "90" } protsenti peaviilu võimsust (Kaplan & Hegarty, Understanding GPS/GNSS, 3. tr.); koherentne varajane-hiline koodijälgimise värin sigma^{ "2" } = B_L d / ({ "2" } C/N0) chips^{ "2" } (Kaplan & Hegarty, jagu { "8" }) ja ribapiiratud üldistus koos selle Gabori ribalaiuse piiriga (Betz & Kolodziejski, Generalized Theory of Code Tracking with an Early-Late Discriminator, Part I, IEEE Transactions on Aerospace and Electronic Systems { "45" }({ "4" }), { "2009" }); Abramowitzi & Stuegi siinusintegraali tabelid (tabel { "5.1" }); spektraalse eraldatuse koefitsient kui ruutautokorrelatsiooni Fourier' teisendus (Betz { "2001" }). AltBOC spektrit kontrollitakse ainult ühikala ja viilu asukoha suhtes (Galileo Open Service Signal-in-Space Interface Control Document avaldis integreerub arvuni { "8" } ja jagatakse sellega).

# text
seg-def449efa852 = Madala Maa-orbiidi navigatsioonisatelliidi maksimaalne Doppler, mis määrab omandamisotsingu suuruse

# text
# c1: leo-signal
seg-2ff7cc7a8846 = leo_signal::max_doppler_hz: suurim satelliidi Doppler otse pealelennul kõrgusmaskil ringorbiidi jaoks, v R_E cos(el) / (R_E + h) korda f / c, iga eelseade enda kandjast ja orbiidi kõrgusest; liik <c1/> lisab ostsillaatori ja kasutaja liikmed ning muudab selle Doppleri binideks

# text
seg-c26e0c7c6821 = Avaldatud näitajad: Xona Pulsar X1 maksimaalne Doppler { "32" } kuni { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, https://arxiv.org/abs/2509.19551); Iridiumi Doppler kuni ±36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Maa pöörlemine on välja jäetud, mis nihutab näitajat kuni umbes { "2.3" } kHz; mõlemad avaldatud näitajad on ilma selleta täidetud.

# text
seg-652e28dfa10f = Madala Maa-orbiidi positsioneerimise, navigatsiooni ja aja signaalikavandid: koodijälgimine, omandamine, GNSS-iga ühilduvus ja ribade kompromiss mis tahes süsteemi jaoks

# text
# c1: leo-signal
seg-c0ba5c7e708e = Liik <c1/>: parametriseeritud signaalikavandid (riba, edastuse ribalaius, ITU jaotus; omandamise, andmete ja piloodi komponendid BPSK(n), BOC(m,n), MBOC või lamedate spektritega, võimsusosad, FDMA alamkandjad, koodipikkused ja andmekiirused) kompileeritud avalikest eelseadefailidest (Xona Pulsar, Iridium STL, Starlink oportunistlik signaal, CentiSpace, üldine C-riba kavand ja üldised UHF/L/S/C/lai-C kavandid, igaühel oma allika URL ja avaldamata väärtused märgistatud REPRESENTATIVE) või kirjutatud reasiseselt; signaali kohta ribapiiratud võimsusspektri tihedus, ribasisesed võimsusosad, Gabori ribalaius, koodivärin C/N0 ja vahe suhtes ning kaugusmõõtmise täpsus, omandamise otsinguruum, ruutseaduse tuvastustõenäosus ning keskmine järjestikune ja koodiparalleelne omandamisaeg, spektraalse eraldatuse koefitsient GPS L1 C/A-sse, Galileo E1-sse, GPS L5-sse, Galileo E5a-sse, E5b-sse ja AltBOC-i ning neist välja koos C/N0 halvenemisega ning CW, laiariba ja sobitatud J/S tolerants spektriliigi SSC ahelast; ionosfääri viivituse, vabaruumikao, kaugusmõõtmise täpsuse võrdsel C/N0 ja võrdsel EIRP-l ning segajatolerantsi ribade kompromiss; ning kavandi kvalitatiivsed kujukontrollid kirjeldatud mõõtmise vastu

# text
seg-040b3f5cc70e = Kahe ülaltoodud rea valideeritud suletud kujud, ruutseaduse valehäire samasus P_d(snr = { "0" }) = P_fa ja Holmesi keskmine omandamisaeg ning taandamine spektriliigi enda SSC ahelale (sama Jammer::ssc kood). Kavandid ise on sisendid: eelseaded, mis on märgistatud REPRESENTATIVE või WORKSHOP, ei ole avaldatud spetsifikatsioonid, täiustatud Feheri QPSK, koodinihke modulatsiooni ja OFDM spektreid ligikaudsustatakse ning kujukontrollid võrdlevad kujusid, mitte kalibreeritud tasemeid.

# text
seg-c2b9c8e4a364 = Mitme riba spektri koskdiagramm (UHF, L, S, C) kavandatud signaalide ja ribapõhiste segajatega

# text
# c1: spectrum
seg-609df4e0a085 = L-ribast kaugemale laiendatud liik <c1/>: ribad antud eelseadekavandi signaalina (joonistatud iga komponendiga, ribapiiratud edastuse ribalaiusele, C/N0 ja J/S viidatud jälgitavale komponendile) või kohandatud kandja ja modulatsioonina; lisakoskpaneelid mis tahes sagedusvahemikus samal ajajoonel ja värviskaalal; lairiba (barrage) segaja CW, kitsariba, chirp ja sobitatud müra kõrval; ribapõhine J/S ja efektiivne C/N0 muutmata spektraalse eraldatuse koefitsiendi ahelast

# text
seg-a3b398f66ad3 = Taandamine olemasolevale spektriahelale ja segamisliigi segamisvastasele võrrandile (ühekomponendiline riba annab samu arve mis enne laiendust) ning valideeritud ridade signaalispektritele. Segajate võimsused, ajajoon, sisendotsa ribalaiused ja kavandatud signaalid on sisendid ning kavandatud signaal kärbitakse oma edastusribal (ribavälist kiirgust pole).

# text
seg-f92d6cbc58d4 = Vihma erivaigistuse koefitsiendid mis tahes ribale, mida LEO-PNT link kasutab

# text
# c1: leo-pass
seg-96b6a118d374 = ITU-R (Rahvusvaheline Telekommunikatsiooniliit, raadiosidesektor) P.838-3 võrrandid ({ "1" }) kuni ({ "5" }): k_H, alpha_H, k_V, alpha_V tabelite { "1" } kuni { "4" } kõverasobitustest, tee- ja polarisatsioonisõltuv (k, alpha) ning erivaigistus k R^alpha; kasutab liigi <c1/> vihmaliige

# text
seg-5c256ff404b6 = ITU-R P.838-3 (03/2005) tabel { "5" }, soovituse enda tabuleeritud k_H, alpha_H, k_V, alpha_V, sisestatud failis tests/fixtures/leo_link/p838_3_table5.csv koos PDF-i URL-i ja toomise kuupäevaga. Tabel on ümardatud oma trükitud numbriteni, seega on lävi see ümardus

# text
seg-f4a311f936de = Pikaajaline kaldtee vihmavaigistus Maa-kosmose lingil

# text
# c1: leo-pass
seg-2b2dba8bf5a7 = ITU-R P.618-14 jagu { "2.2.1.1" } sammud { "2" } kuni { "10" } (kalde- ja horisontaaltee allpool vihmakõrgust, horisontaalse vähenemise ja vertikaalse kohandamise tegurid, A0.01 ja selle skaleerimine { "0.001" } %-ni kuni { "5" } %-ni keskmisest aastast), kus vihmakõrgus (P.839) ja R0.01 (P.837) on sisendid, sest mootoril ei ole kumbagi digitaalset kaarti; liik <c1/> rakendab ribapõhiselt ja epohhi kaupa

# text
seg-325d1bb9c26d = ITU-R Study Group { "3" } valideerimisnäidete fail CG-3M3J-13-ValEx-Rev8.3.0 P.618-14 jaoks, nagu ITU-Rpy valideerimislehed seda tabuleerivad, koos iga asukoha P.839-4 vihmakõrgusega samadest näidetest; sisestatud failis tests/fixtures/leo_link/p618_14_rain_attenuation.csv koos URL-ide ja toomise kuupäevaga. Valideerib protseduuri antud h_R ja R0.01 korral, mitte kaarte

# text
seg-6b51ec84bdce = Troposfääriline amplituudisintillatsioon Maa-kosmose lingil

# text
# c1: leo-pass
seg-869894dec004 = ITU-R P.618-14 jagu { "2.4.1" } sammud { "3" } kuni { "9" } (etalon-sigma N_wet-ist, efektiivne teepikkus, antenni keskmistamistegur, vaigistussügavus { "0.01" } %-le kuni { "50" } %-le ajast), kus N_wet on sisend või arvutatud temperatuurist, niiskusest ja rõhust ITU-R P.453-14 avaldistega; alla { "4" } GHz märgib liik <c1/> väärtuse ekstrapolatsiooniks

# text
seg-7fc4a1e7960a = ITU-R Study Group { "3" } valideerimisnäited (CG-3M3J-13-ValEx-Rev8.3.0) P.618-14 sintillatsiooni jaoks koos iga asukoha P.453-14 N_wet-iga samadest näidetest; sisestatud failis tests/fixtures/leo_link/p618_14_scintillation.csv koos URL-ide ja toomise kuupäevaga. Märja refraktiivsuse avaldis temperatuurist ja niiskusest ei kuulu selle rea alla

# text
seg-e0d40cf4ea79 = Hoonesisenemise kadu siseruumis olevale LEO-PNT kasutajale

# text
# c1: leo-pass
seg-4f06274e38ec = ITU-R P.2109-2 lisa { "1" } võrrandid ({ "1" }) kuni ({ "10" }) koos tabeliga { "1" }: kadu, mida tõenäosusega P ei ületata, traditsiooniliste ja termiliselt tõhusate hoonete puhul tee kõrgusel fassaadil, { "80" } MHz kuni { "100" } GHz; liik <c1/> rakendab ribapõhiselt ja epohhi kaupa siseruumis olevale kasutajale (UHF siseruumi juhtum)

# text
seg-99c648f9c6eb = ITU-R Study Group { "3" } Clutter and BEL valideerimistöövihiku väärtused, nagu need on ümber kirjutatud etalon-MATLAB-i teostuse valideerimisskriptis (github.com/eeveetza/p2109), sisestatud failis tests/fixtures/leo_link/p2109_bel.csv koos URL-i ja toomise kuupäevaga. Töövihik trükib kolm kümnendkohta

# text
seg-8c5e291c8ff8 = Esimest järku ionosfääriline viivitus ribapõhiselt, ionosfäärivaba kombinatsioon ja vabaruumikadu

# text
seg-89df726127f9 = Rühmaviivitus { "40.3" } STEC/f^{ "2" } ribapõhiselt; ionosfäärivabad koefitsiendid f1^2/(f1^{ "2" } - f2^{ "2" }) ja -f2^2/(f1^{ "2" } - f2^{ "2" }) ning müra võimendus sqrt(a1^{ "2" } s1^{ "2" } + a2^{ "2" } s2^{ "2" }) mis tahes ribapaari jaoks; vabaruumikadu { "20" } log10({ "4" } pi R f/c) funktsioonist linkbudget::free_space_loss_db selle kilomeeter-megahertsi kujul

# text
seg-9bf00f744174 = IS-GPS-200 jagu { "20.3.3.3.3.2" }, mis esitab L1/L2 rühmaviivituse suhte gamma = (77/60)^{ "2" }, mis tuleneb esimest järku 1/f^{ "2" } skaleerimisest, ja Friisi edastusvalem (Proc. IRE, { "1946" }). Valideerib skaleerimisseadusi, mitte kaldteel olevat TEC-i

# text
seg-c584a867fcda = Maksimaalne Doppler, mida staatiline kasutaja LEO või MEO orbiidilt näeb

# text
# c1: leo-pass
seg-e6cdaf067a65 = leo_link::geometry::max_static_user_range_rate: otsing üle iga orbiidiasendi ja iga satelliidi horisondil oleva kasutaja ringorbiidi korral, Maa pöörlemisega, suurima kauguskiiruse leidmiseks, pluss orbitaal- ja suurim Maaga kinnine satelliidikiirus; liik <c1/> esitab ribapõhiselt Doppleri mähisena ning kasutab selle väikese energiakuluga mudeli külmstardi otsinguaknana

# text
seg-4abd3afebad2 = Leclere, Marathe ja Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabel { "1" } (staatiline vastuvõtja { "6371" } km sfääril, Maa pöörlemine ainus teine mõju): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz L1-l. Katab ringikujulisi kahe keha orbiite

# text
seg-d9eb3e7e69c2 = LEO-PNT läbilend ja selle ribapõhine linkide eelarve nähtavuses olevate MEO GNSS-satelliitide vastu

# text
# c1: leo-pass
seg-d986e44443dd = Liik <c1/>: satelliidid kavandatud läbilennust, elementidest, SGP4 kaudu TLE-st või Walkeri konstellatsioonist failist constellation-design; ribapõhiselt ja epohhi kaupa vaatenurgad, kaugus, suletud kujul kauguskiirus ja kaugusekiirendus (kontrollitud iga jooksutusega tsentraalsete vahede vastu ja esitatud), vabaruumikadu, EIRP isoflux-, Gaussi või lameda mustriga, plaaster-, poolkera- või isotroopne kasutaja antenn, ITU-R P.676-10 lisa { "2" } gaasiline vaigistus, P.618 vihm ja sintillatsioon, P.2109 hoonesisenemise kadu, polarisatsiooni mittesobivus, süsteemi müratemperatuur, C/N0, Doppler ja Doppleri kiirus ning esimest järku viivitus Klobucharist või vertikaalsest TEC-ist kaldtee TEC, skaleeritud satelliidi all olevaks Chapmani osaks; ionosfäärivabad paarid koodimüraga läbilennu tipul; Galileo või GPS kandjad nende liidesedokumentide vastuvõetud võimsustest sama vastuvõtja kaudu

# text
seg-c558a6519038 = Suletud kujud ja enesekooskõla: kauguskiiruse ja kaugusekiirenduse samasused numbriliste tuletiste vastu, isoflux-võimendus tühistab kauguse kasvu, õpiku polarisatsioonikao piirid, kvalitatiivne LEO-versus-GNSS vaatlus (minutite pikkune kellukakujuline läbilend, mille tipp on mitu dB lameda 44-51 dB-Hz GNSS-kandja kohal). EIRP-d ja mustrid on avaldatud vastuvõetud võimsused, mis on teisendatud EIRP-ks, või esindlik valikud, gaasiline liige on asendatud P.676-10 lihtsustatud meetod ja midagi ei võrrelda mõõdetud LEO C/N0-ga

# text
seg-95a077a980b6 = Nimega LEO-PNT süsteemide eelseaded esitatud allikatega ja süsteemist sõltumatu mootor

# text
seg-4b47033cda24 = leo_link::presets: üldine mitme riba (UHF, L, S, C), üldine C-riba, Xona Pulsar X1/X5, Iridium STL, Starlink ainult Doppleri oportunistliku signaalina, CentiSpace ja valikuline Celeste IOD eelseade, igaühe allikas märgistatud PUBLIC (URL-iga), REPRESENTATIVE või WORKSHOP, workshop'i oma valikulises Celeste IOD eelseadefailis, kompileeritud sisse ainult siis, kui see fail on olemas; iga riba ja orbiit on stsenaariumis üle kirjutatav ja stsenaarium ei pruugi nimetada üldse ühtegi eelseadet

# text
seg-399dc53ceafb = Viidatud avalike näitajate ümberkirjutus ja kooskõlakontroll: avaldatud minimaalsest vastuvõetud võimsusest seatud EIRP ennustab avaldatud maksimumi { "0.5" } dB piires lameda mustriga. See on kauguse leviku kontroll, mitte ühegi satelliidi antenni valideerimine; esindlik eelseaded ei esita väidet päris süsteemi kohta

# text
seg-a39f34973373 = Väikese energiakuluga positsioneerimine: aeg esimese fiksini ja energia fiksi kohta töötsükli suhtes

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy ja liigi <c1/> jaotis [iot]: Doppleri kiirusega piiratud koherentne integreerimine, ruutseaduse mittekoherentsed summad tuvastusläveni, Doppleri binide otsing orbiidi staatilise kasutaja mähise (külm) või abistatud akna (kuum) üle, paralleelne või järjestikune koodiotsing, navigatsioonisõnumi aeg külmstardil, energia fiksi kohta ja aku eluiga üle fiksiintervallide, iga LEO riba ja GNSS-signaali jaoks

# text
seg-a5fa1ef1be9b = Esitatud kavandimudeli sisemine kooskõla: iga võimsus, lävi ja otsinguvalik on sisend ning mudel ignoreerib bitiserva mitmetähenduslikkust, tuvastamata jäänud sündmust ja uuestiomandamist. Mõõdetud vastuvõtjaga ei võrrelda

# text
seg-7e94f8b38cff = Globaalne keskmine signaali kosmoses kaugusvea kaal mis tahes orbiidi kõrguse jaoks

# text
seg-85595d0d46ce = leo_navmsg::sisre::sisre_weights: radiaalkaal w_R ja ruut-ristkaal w_AC^{ "2" } kui vaatesuuna nadiirinurga cos^{ "2" } ja poole sin^{ "2" } keskmised üle kasutajate, kes on ühtlaselt jaotunud kõrgusmaskist kõrgemal nähtaval Maa kupliosal, mis tahes orbiidiraadiuse jaoks, Simpsoni integreerimisega; kasutab iga leo-navmsg SISRE näitaja (kõrgusel { "510" } km w_R { "0.46" } ja w_AC^{ "2" } 1/2.5)

# text
seg-b9b5fe9d3b25 = Montenbrucki, Steigenbergeri ja Hauschildi ({ "2018" }) avaldatud SISRE kaalutegurite tabel, Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } ja 1/49, GLONASS { "0.98" } ja 1/45, Galileo { "0.98" } ja 1/61, BeiDou MEO { "0.98" } ja 1/54, BeiDou IGSO/GEO { "0.99" } ja 1/126. Sama keskmine, hinnatud LEO raadiustel, annab LEO kaalud; avaldatud LEO tabelit ei ole kinnitatud, seega on LEO väärtused rakendatud valideeritud meetod, mitte eraldi valideeritud

# text
seg-3cbb8b6afe3c = Galileo ICD saadetud efemeriidi kasutaja algoritm LEO navigatsioonisõnumi alusena

# text
seg-88efbce1f836 = leo_navmsg::elements::kepler_point: Galileo OS SIS ICD Kepleri hindamine (Kepleri võrrand, teise harmoonilise parandused, Maaga kinnine sõlm), kirjutatud eraldi mootori RINEX-i hindajast, tagastades asukoha koos laiuse argumendi, kaldenurga ja sõlmega, millest ehitatakse piki-/risti-/radiaalsuunalise paranduse kaader, ning Liu et al. { "2025" } laiendusliikmed

# text
seg-6a90728fcea9 = RTKLIB 2.4.2-p13 eph2pos ECEF-asukohad (sama ICD algoritmi sõltumatu teostus) päris BKG/IGS saatekirjetele kuupäevast 2024-09-10, mõlemad sisestatud päritoluga kaustas tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). See valideerib Kepleri kasutaja algoritmi; selle peale lisatud piki-/risti-/radiaalsuunalised parandused on kaetud nende endi ridadega ja Liu liikmed Liu et al. { "2025" } 22-parameetrilise realiga

# text
seg-d65102fd4a1d = CRC-24Q kaadrikontroll LEO navigatsioonisõnumile

# text
seg-aed568016867 = leo_navmsg::codec::crc24q: generaatorpolünoom 0x1864CFB, algväärtus { "0" }, ilma peegeldamiseta, ilma lõpp-XOR-ita, kontroll, mida Kshana LEO kaader kannab üle iga eelneva baidi

# text
seg-18c79d18e4e4 = CRC kataloogi kontrollväärtus nendele parameetritele (reveng.sourceforge.io CRC kataloog, CRC-24/LTE-A: laius { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), mis on RTCM { "10403" } ja Galileo OS SIS ICD CRC-24Q parameetrid, ning sõnumitüübi { "1005" } näitekaader, mis on trükitud dokumendis RTCM { "10403" }

# text
seg-82b9b0f7b07c = LEO saadetud efemeriidi sobitaja ja signaali kosmoses kaugusviga versus sobitusintervall ja uuendusperiood

# text
# c1: leo-navmsg
seg-8c7065aa22bd = Liigi <c1/> sobitaja ja kompromiss: tõeline orbiit, integreeritud tsonaalse J2-J6 või EGM2008 gravitatsiooniga valitud astmeni ja takistusega, ning seemnestatud vaba või juhitud kell; Galileo Kepleri komplekti Levenbergi-Marquardti sobitus mittesingulaarsetel elementidel nõrkade eeljaotustega, seejärel piki-, risti- ja radiaalsuunalise parandusega polünoomid lineaarsete vähimruutudega; kella polünoom sobitatud kasutaja relativistliku liikme võrra korrigeerituna; SISRE (ainult orbiit ja koos kellaga) kasutusperioodidel, mis on tsentreeritud nende sobitusakendes, versus sobitusintervall ja uuendusperiood. Valideeritud osa: 16-parameetriline Kepleri sobitus ja selle ainult orbiidi SISRE versus sobitusintervall päris täppisorbiitidel ning integreeritud J2-J6/EGM2008({ "20" }, { "70" })/takistuse tõeline orbiit Orekit { "12.2" } vastu { "4.6" } mm piires { "6" } h jooksul (lävi { "2" } cm, sama tiheduse sisend); parandusepolünoomid, kella sobitus (seemnestatud vaba või juhitud kell) ja uuendusperioodi kompromiss jäävad modelleeritud

# text
seg-8121e7db3db3 = Läbilennu keskel tehtav LEO navigatsioonisõnumi uuendus koos pidevuse kontrolliga lülituskohal

# text
# c1: leo-navmsg
seg-34c310d85c42 = Liigi <c1/> midpass-update analüüs: kõrgeim läbilend kasutaja kohal otsinguvahemikus, sõnumid globaalse ajakava järgi kasutusperioodidega, mis on tsentreeritud nende sobitusakendes, ja igal lülitusel 3D asukohahüpe, kellahüpe, kasutaja pseudovahemaa hüpe, suurim hüpe üle mis tahes nähtava vaatekiire (suletud kujul üle nadiirikooni), kaugusviga enne ja pärast ning PASS/FAIL läve vastu

# text
seg-418f2cd21141 = Sisemine kooskõla (hüppe samasus ja koonuse piir toorjõu valimi vastu). Lävi on sisend; avaldatud LEO pidevusnõuet ei ole kinnitatud

# text
seg-7635a8339e78 = LEO navigatsioonisõnumi dokumenteeritud binaarkodeering koos kvantimisvea eelarvega

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshana enda kaader (preambul, versioon, mudel, pikkus, kasulik koormus, CRC-24Q) nelja efemeriidimudeli, kellapolünoomi, SVID-i, andmete väljaande (issue of data), riba, tervise, Klobuchari komplekti, NeQuick-G koefitsientide ja UTC parameetrite jaoks, iga väli esitatud laiuse ja sammuga (field_table), kvantimine vahemikust keeldumisega ning suurima asukoha ja kella muutuse eelarve, mille iga välja poolsammu muutus kehtivusakna jooksul teeb

# text
seg-4261a9fac5d9 = Edasi-tagasi samasused ja eelarve ise. Vorming on Kshana enda, modelleeritud avaldatud sõnumikomponentide ja Galileo ICD väljakomplekti järgi; see ei ole Celeste ega ühegi teise süsteemi bitipaigutus (ükski pole avalik), seega puudub väline paigutus, mille vastu valideerida

# text
seg-17ca41d7fd71 = LEO navigatsioonisõnumite RINEX-4-laadsed ja CSV eksportid

# text
seg-185e12ccef0d = leo_navmsg::text: RINEX-4-laadne plokk (> EPH kirje päis, satelliidi ja epohhi rida kolme kellaliikmega, D19.12 saatejooksu orbiidiread) süsteemitähega L ja kirjetüüpidega KP16, KRAC, LU22 ja APOL, igas päises märgistatud Kshana laiendusena, mis ei kuulu standardisse RINEX { "4.02" }, ja CSV tabel vaikeveeruskeemi ja eelseadeskeemidega, igaühel importija

# text
seg-5cc5b6382437 = Edasi-tagasi teed ja kalendriaritmeetika. RINEX { "4.02" } ei defineeri LEO navigatsioonikirjeid (IGS RINEX { "4.02" }), seega on paigutus dokumenteeritud laiendus, mille eelkäijana on viidatud arXiv { "2401.17767" }; selle välist lugejat, mille vastu kontrollida, ei ole

# text
seg-ff15935ba1b3 = Liu et al. { "2025" } 22-parameetriline LEO efemeriidimudel ja selle sobitus päris täppisorbiitidel

# text
seg-6af1b6f3bbd4 = leo_navmsg::elements::EphemerisModel Liu22 variant, hinnatud funktsiooniga kepler_point koos Liu22Extra-ga: 16-parameetriline komplekt pluss poolteljepikkuse kiirus a_dot, keskmise liikumise kiirus n_dot, mis siseneb kujul n = sqrt(mu/A0^{ "3" }) + dn + n_dot tk, ümber kirjutatud artikli valemist { "1" } (sobituse võrdlus ei sõltu sellest skaalakokkuleppest, seega edastatud nDot väärtuse tähendust siin ei valideerita), ning ühe- ja kolmekordsed tiirupõhised raadiuse harmoonilised Crs1, Crc1, Crs3, Crc3 parandamata laiuse argumendil. Selle sobitus funktsiooniga leo_navmsg::fit::fit_message võtab artikli jao { "2.3" } alguse ja hindaja (iga parandus algab nullist; lihtsad vähimruudud ilma eeljaotusteta; artikli 100-iteratsiooniline lagi), kuid peatub Kshana parameetrite koondumisreegli järgi (iga samm alla { "1e-3" } oma formaalsest sigmast), mitte artikli reegli järgi, mille kohaselt RMS-i muutus on alla { "0.1" } mm. Sobitatud tabuleeritud täppisorbiidi { "20" } ja { "30" } minuti kaartel

# text
seg-e79047fc95af = ATOMIC nullkellaga ECEF-polünoom ja sünteetiline viiekõrgune LEO mudelite võrdlus

# text
seg-e261843e35b1 = leo_navmsg::elements::EphemerisModel EcefPoly variant: teljepõhine ECEF-polünoom ilma kelliikmeteta, relativistlik liige avaldisest -2 r.v/c^{ "2" }, hinnatud juhitud kella vastu. Samuti mudelite võrdlusanalüüs (liu_comparison üle LIU2025_TABLE), mis sobitab 22-parameetrilise mudeli artikli viiel kõrgusel Kshana integreeritud orbiidi 20-minutilistel kaaredel ja trükib tulemuse avaldatud SISRE kõrvale

# text
seg-a3b92fdcc591 = ATOMIC mudeli faktid väljaandest InsideGNSS (6. astme polünoom, ligikaudu üks minut kehtivust, { "30" } s värskendus, kell juhitud, { "24" } cm kellaviga). Need on kirjeldavad faktid, millel puuduvad avaldatud numbrid, mille vastu võrrelda. Viiekõrgune tabel trükib Liu et al. { "2025" } SISRE ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } ja { "0.75" } cm kõrgustel { "320" }, { "475" }, { "786" }, { "966" } ja { "1336" } km 20-minutilisel kaarel) Kshana sobituse kõrvale selle enda integreeritud orbiidil ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } ja { "0.51" } cm; suhted { "0.46" } kuni { "0.77" }), kinnitamata, sest artikkel sobitas päris täppisorbiite ja tõed erinevad. 22-parameetriline mudel ja sobitus ise on päris orbiitide vastu valideeritud reas Liu et al. { "2025" } 22-parameetriline LEO efemeriidimudel ja selle sobitus päris täppisorbiitidel. { "0.30" } redaktsioon: tabeli näitajad nihkusid artikli kokkuleppe sobitusega (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-7a9fca5166d4 = LEO navigatsioonisõnumi ühesagedusliku ionosfääri ja UTC teenused

# text
seg-bc73bfeca68e = leo_navmsg::services: Klobuchari saatekadu mis tahes kandjal (mootori L1 mudel skaleeritud tegurilt (f_L1/f)^{ "2" }), NeQuick-G efektiivne ionisatsioonitase Az = ai0 + ai1 mu + ai2 mu^{ "2" } nullist-kõik ja [{ "0" }, { "400" }] sfu reeglitega, ning süsteemiaeg UTC-ks ICD kolme liigsekundi juhuga

# text
seg-0af8030f4d21 = Doppler, millega maapealne vastuvõtja peab LEO navigatsioonisatelliidilt hakkama saama

# text
# c1: leo-pvt
seg-9714103964d6 = Satelliidi täpne kauguskiirus, mille Maaga kinnine asukoht ja kiirus tulevad kahe keha orbiidist sekulaarse J2 triivi ja Maa pöörlemisega (leo_fusion::geom::EarthOrbit::state, kiirus on asukoha täpne ajatuletis), teisendatud Doppleriks kandjal; suurim absoluutne Doppler, Doppleri kiirus ja jerk kõrgusmaskist kõrgemal akna jooksul (leo_fusion::doppler::doppler_envelope), esitatud LEO süsteemi kaupa liigi <c1/> poolt režiimis doppler

# text
seg-ebf6cee8ec4c = Avaldatud näitajad, reprodutseeritud esitatud orbiidilt ja kandjalt: Iridiumi Doppler kuni ± { "36" } kHz (Resilient Navigation and Timing Foundation, Recent PNT improvements and test results based on LEO satellites) ja Xona Pulsar X1 maksimaalne Doppler { "32" } kuni { "34" } kHz (Leclère, Marathe ja Reid, ION GNSS+ { "2025" }, arXiv:{ "2509.19551" }). Iridiumi näitaja on ümardatud ülempiir, seega { "5" }% lävi. Doppleri kiirus ja jerk on esitatud, kuid valideerimata: Pulsar X1 modelleeritud otse pealelennu jerk on umbes { "1.0" } Hz/s^{ "2" } avaldatud { "1.26" } vastu

# text
seg-d2e18c8bdc14 = Positsioneerimine LEO Dopplerist, ühe ja mitme satelliidiga, kella triivi ja kiiruse olekutega

# text
# c1: leo-pvt
seg-de6cb3c06490 = Partii Gauss-Newtoni positsioneerimine kauguskiirusest analüütiliste osatuletistega (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), valikuna konstantne kasutaja kiirus, pinnakasutaja kõrguse pseudomõõtmine, summutatud sammud; formaalne kovariatsioon tões; piki-, risti- ja vertikaalprojektsioonid; ühe läbilennu täpsus kasutaja ristsuunalise nihke suhtes; lähima lähenemise aeg. Liigi <c1/> režiim doppler lisab vea akna pikkuse suhtes ja ainult Dopplerit kasutava oportunistlike signaalide režiimi (starlink-sop eelseade)

# text
seg-84e2eb636579 = Sisemine kooskõla: müravaba taastamine, kinemaatiline samasus rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho numbriliselt diferentseeritud, null-Doppler lähima lähenemise hetkel, ühe läbilennu peegellahendus ning seemnestatud vead formaalse kovariatsiooni vastu. Kozhaya, Saroufimi ja Kassase Starlinki näitaja (NAVIGATION { "72" }({ "1" }), { "2025" }: umbes { "2" } m { "20" } s jooksul kolme satelliidiga) on ainult võrdlus: modelleeritud vastuvõtja, täieliku efemeriidi ja iga veaga { "30" } Hz Doppleri sigmas, on samal aknal mitu korda vähem täpne ning artikli vastuvõtjat ja mõõtmissagedust ei reprodutseerita

# text
seg-7f462969d2d4 = Ühine GNSS-i ja LEO pseudovahemaa positsioneerimine süsteemidevaheliste nihete ja signaalipõhiste veamudelitega

# text
# c1: leo-pvt
seg-b9b5298e3408 = Kaalutud vähimruutude Gauss-Newtoni fiksid mis tahes süsteemide segul, üks vastuvõtja kell süsteemi kohta (süsteemidevaheline nihe hinnatud koos asukohaga) või teadaolev saatenihe etalonaja skaalal; mõõtmispõhised sigmad esitab kutsuja, vaikimisi mootori viivitussilmuse termiline müra (navsignal::dll_code_jitter_chips) kõrguse C/N0 juures, kombineerituna signaali kosmoses kaugusveaga; kaalumata DOP (GDOP, PDOP, HDOP, VDOP, TDOP) kohalikus geodeetilises kaadris, formaalsed ida-põhja-üles sigmad ja nihete sigmad; liigi <c1/> ühisrežiim võrdleb ainult GNSS-i, ainult LEO ja liidetud fikse ning pühib DOP-i lisatud LEO satelliitide arvu suhtes

# text
seg-ee9a4a0cb530 = Täppispunktpositsioneerimise (PPP) koondumine ainult GNSS-iga ja LEO täiendusega

# text
# c1: leo-ppp
seg-a54f36c27d90 = Ujuv PPP laiendatud Kalmani filter ionosfäärivabal koodil ja faasil: staatilised koordinaadid, valge vastuvõtja kell, üks süsteemidevaheline nihe lisasüsteemi kohta, juhusliku käiguga seniidi märg viivitus, mis on kaardistatud 1/sin(kõrgus)-ga, ujuv mitmetähenduslikkus satelliidikaare kohta, lisatud tõusul ja langetatud loojangul, ning satelliidi koodile ja faasile ühine täppisorbiidi ja kella viga, töödeldud ühe korreleeritud kahe rea uuendusena Joseph-stabiliseeritud kujul; mõõtmised simuleeritud samast mudelist; koondumisaeg (vead alla lävede kuni jooksu lõpuni), veakõverad ja jooksu keskmine asukoha NEES ainult GNSS-i ja iga LEO juhu jaoks, käivitatud liigina <c1/>

# text
seg-be4593802ccf = NEES-i hii-ruut test on sisemine kooskõlakontroll (tõde ja filter jagavad mudelit). Trendi võrreldakse allikaga Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: mitme GNSS-i { "9.6" } min lüheneb väärtusteks { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga. Kaasasolev stsenaarium annab { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min oma esindlike { "1000" } km, { "60" } kraadi kestade, müra ja jaamadega; artikli konstellatsioone, müra ja koondumise definitsiooni ei reprodutseerita, seega on see trendi MODELLED kooskõla (monotoonne lühenemine, suurim konstellatsioon alla kolmandiku ainult GNSS-i ajast), mitte valideerimine

# text
seg-8ef013b46d0f = 5G mitte-maapealse võrgu (NTN) positsioneerimistäpsus signaali ribalaiuse põhjal

# text
# c1: ntn-positioning
seg-12b1e4657370 = Cramér-Rao piir saabumisajale ruutkeskmisest (Gabori) ribalaiusest, c/({ "2" } pi beta sqrt({ "2" } (C/N0) T)), lameda OFDM spektri (beta = B/sqrt({ "12" })), ribapiiratud BPSK spektri (suletud kujul lugeja) või mis tahes spektri kvadratuuri korral, ning kompleksse tooni sagedusele, sqrt(3/({ "2" } pi^{ "2" } (C/N0) T^{ "3" })); allalingi saabumisaja fiksid tundmatu vastuvõtja kellaga ja ühe satelliidi Doppleri fiks läbilennu jooksul 3GPP n256 MSS S-ribas, käivitatud liigina <c1/>

# text
seg-9306f1c06081 = LEO-abistatud aja edastamine UTC-le C/N0 ja vastuvõtja ostsillaatori suhtes

# text
# c1: leo-pvt
seg-c618feb01476 = Kellamõõtmised igalt nähtavuses olevalt LEO satelliidilt teadaoleval asukohal, kombineeritud pöördvariatsiooniga pseudovahemaa mürammudelist, filtreeritud kahe oleku (faas, sagedus) Kalmani filtriga, mille protsessimüra on ostsillaatoriklassi valge ja juhusliku käigu sagedusmüra (slot_timing::ClockNoise, clock_state::ClockClass; holdover::coast_phase_variance rannikudispersioon), samadest tasemetest seemnestatud tõeline kell ning IS-GPS-200 jao { "20.3.3.5.2.4" } süsteemiaja-UTC-ks avaldis koos saatenihke ebakindlusega, mis on lisatud jooksukohase nihkena; liigi <c1/> režiim timing pühib ostsillaatoreid ja C/N0 nihkeid

# text
seg-4a878bd4a90f = Sisemine kooskõla: avaldatud nihkeavaldis käsitsi hinnatud, normaliseeritud viga { "40" } seemne üle ja nihke ebakindluse seatud põrand. NIST-i näitaja miniatuurse aatomkellaga Iridiumi ajastusvastuvõtjatele (alla { "40" } ns UTC(NIST)-ist { "40" } päeva jooksul) on ainult võrdlus; kaasasolev Iridiumi stsenaarium annab { "10" } kuni { "11" } ns RMS nimivõimsusel oma esindliku { "5" } m kaugusveaga. Flickersagedusmüra ja ionosfäärilist viivitust ei simuleerita

# text
seg-cef79d82f0d4 = LEO katvus ja täpsuse halvenemise tegur polaar- ja Arktika kasutajatele MEO GNSS-i vastu

# text
# c1: leo-pvt
seg-462a5e95d480 = Nähtavuses olevad satelliidid ja mediaan PDOP, HDOP ja VDOP koos kättesaadavusega laiuskraadi suhtes, üle valimisse võetud pikkuskraadide ja epohhide, ainult MEO GNSS-i süsteemidele, ainult LEO süsteemidele ja kõigile, igal süsteemil oma mask ja kellamudel, käivitatud kui <c1/> polaarrežiim; orbiidid on SGP4/SDP4 elemendikomplektid pühkimise epohhil (2026-01-01T00:{ "00" }:{ "00" } UTC polaarrežiimis), viidud Maaga kinnisesse kaadrisse valideeritud Maa orbiidi teel (IAU 2006/2000A, UT1 = UTC, pooluse liikumiseta)

# text
seg-d92777401093 = Nimega LEO PNT süsteemid valikuliste andmeeelseadetena, igaühel oma allikas

# text
seg-5130bfe2410c = Süsteemist sõltumatud sisendid: iga süsteem on Walkeri kestad, selged elemendid või GNSS-i eelseade, signaal (kandja, kiibikiirus, ribalaius, vastuvõetud võimsus või C/N0 vahemik), SISRE, Doppleri sigma ja kellamudel; eelseaded täidavad ainult selle, mille stsenaarium välja jätab, üks fail kummagi kohta, allikatega märgistatud PUBLIC (URL-iga), WORKSHOP või DERIVED ja avaldamata väärtused loetletud esindlikena: Xona Pulsar X1/X5, Iridium STL, Starlink oportunistlikud signaalid, CentiSpace, esindlik C-riba süsteem, ATOMIC nullkella efemeriidimudel ja üks workshop'ist tuletatud eelseade valikulises Celeste IOD eelseadefailis, mis jäetakse välja selle faili ja selle stsenaariumide kustutamisega

# text
seg-c6f71b3937cd = Viidatud avalike väärtuste ümberkirjutus, kontrollitud struktuuri suhtes (igal avalikul allikal on URL, Walkeri mustrid jaguvad võrdselt, C/N0 vastuvõetud võimsusest üle kT temperatuuril { "290" } K), mitte välise sõltumatu etaloni vastu. Esindlikud väärtused on nimetatud igas eelseades ja on illustratiivsed

# text
seg-dec52b5b9cd6 = Üks LEO-PNT süsteem otsast lõpuni: signaalikavand, läbilennu linkide eelarve, navigatsioonisõnum ja liidetud positsioneerimine, iga etapi väljund antakse edasi järgmisele

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Liik <c1/>: leo-signal kavand (avalik eelseade või reasisene) seab leo-pass riba keskme, ribalaiuse, kiibikiiruse ja EIRP jaotuse; läbilend annab jälgitava komponendi C/N0 ja ribapiiratud koodivärina epohhi kaupa; vähimruutude C/N0 sirge sin(kõrgus) suhtes, leo-navmsg sõnumi SISRE (sobitatud läbilennu satelliidi orbiidil, pluss esitatud orbiidi määramise liige ruutsumma juurena) ning kavandi kandja ja kiibikiirus lähevad iga leo-pvt ühisfiksi LEO süsteemile ja valikuliselt leo-ppp LEO juhtudele; iga üleandmine esitatakse oma väärtuse ja ühikuga

# text
seg-854d3c1428d0 = Üleandmiste enesekooskõla: iga edasi antud väärtus võrdub ülesvoolu etapi enda väljundiga ning ülesvoolu sisendi mutatsioon liigutab iga allavoolu näitaja, mis sellest sõltub. Etapid säilitavad oma märgised; ahel ei lisa füüsikat ega välist sõltumatut etaloni

# text
seg-55ca63edff02 = Spuufimise tuvastamine LEO Doppleri ja läbilennu geomeetria kooskõla põhjal

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = Liigi <c1/> jaotis <c2/>: spuufija võltsib enesekooskõlaliselt kauguses ja kauguskiiruses väidetud asukohas nähtavad signaalid, mis hüppab ja/või lükatakse tõelisest pärast alustamist (LEO riba kohta ja MEO GNSS-i signaali kohta); vastuvõtja ennustab iga kauguskiiruse saateorbiidist ja sõltumatust eelnevast asukohast ja kiirusest ning testib mõõdetud kauguskiirusi üldistatud vähimruutude hii-ruut statistikuga epohhide aknas (kella triiv häiriv parameeter või eeljaotusega), GNSS-i kanalitel, LEO kanalitel ja kõigil kanalitel, koos sagedussilmuse termilise müraga C/N0-st (Kaplan & Hegarty { "2006" }, jagu { "5.6.2" }); tuvastustõenäosus mittetsentraalsest hii-ruut seadusest esitatud valehäire tõenäosusel, tuvastus kuulutatakse esitatud tuvastamata jäämise tõenäosusel

# text
seg-787c07c08c7f = Suletud kujud ja samasused, mitte väline mõõtmine: kauguskiiruse gradient tsentraalse vahe vastu, infovormi statistik tiheda kovariatsioonivormi vastu, puhas kella triiv annab nulli, eelnevalt seletatud tõuge annab kuni |dx|^2/sigma_p^{ "2" }, statistik on hüppe suhtes ruutfunktsioon. Ühtegi tuvastusnäitajat ei võrrelda mõõdetud rünnakuga; spuufija on idealiseeritud (võimsuse, saabumisnurga ega korrelatsioonitipu signatuuri pole)

# text
seg-5f341f85ac07 = Spuufimise tuvastamine mitme riba LEO signaali ribadevahelise kooskõla põhjal

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Iga LEO satelliidi ja kaugusmõõtmise ribapaari jaoks moodustab jaotis <c1/> geomeetriavaba pseudovahemaa kombinatsiooni, eemaldab vastuvõtja ionosfäärimudeli ja testib selle epohhist epohhi sammu kahe riba koodimüra ja esitatud talutava modelleerimata ionosfäärikiiruse suhtes (kahepoolne Gaussi, täpne tuvastustõenäosus); spuufija, mis võltsib mõned ribad, kuid mitte teised, või iga riba ilma ionosfäärita, nähakse alguses; see, mis võltsib iga riba ja simuleerib ionosfääri, jääb märkamata, mida tulemus ütleb

# text
seg-87fd44fa1d94 = Samasused: ionosfäärivaba spuufija alustamissamm võrdub paari modelleeritud ionosfäärilise viivituse vahega, lävi on kahepoolne normaalkvantiil korda sammu standardhälve pluss kiiruspiir. Vastuvõtja ionosfäärimudel on mootori oma, seega on autentne jääk konstruktsiooni poolest keskmiselt null; väline sõltumatu etalon puudub

# text
seg-97dbcd5f2728 = Ionosfääri sondeerimine: kaldtee TEC LEO läbilennu kahe riba viivitusest

# text
# c1: leo-pass
seg-844de34fd2f3 = Iga liigi <c1/> satelliidi ribapaari kohta annab aruanne kaldtee summaarse elektronsisalduse, mille geomeetriavaba koodikombinatsioon läbilennu tipul taastab, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), ja selle 1-sigma kahe riba termilisest koodimürast, nii et mis tahes mitme riba LEO-PNT kavandit saab võrrelda ionosfäärisondina

# text
seg-0a63a69e181d = Kuu kaadri datumi kovariatsioon hinnatud jaamadega, 50-kohalise laiendatud täpsuse vastu

# text
seg-de2ee45f6527 = Stsenaariumi lunar-frame-campaign seitsmeparameetrilise Helmerti datumi kovariatsioon hinnatud Maa jaamadega (jaam { "1" } ankurdatud), nagu lunar_frame_campaign seda arvutab binary64-s: ühine jaama ja majaka Fisheri info, kogutud viivituse Jacobi maatriksist, jaamaplokk marginaliseeritud Schuri komplemendiga läbi Jacobi spektraalse pöördmaatriksi, H = AᵀSA moodustatud Helmerti kavandiga ja pööratud spektraalselt. Probleem on konstruktsiooni poolest halvasti tinglik (Helmerti tinglikkusarv { "2.1e8" } kuni { "2.3e8" }, ühise info tinglikkusarv { "1.6e12" } kuni { "3.0e13" }): { "1e-9" } suhteline muutus Schuri paranduses liigutab datumi sigmasid kuni { "28" } %. Esitatud: seitse datumi sigmat, Helmerti tinglikkusarv ja nõrgim suund. VÄIDE, KITSENDATUD: mootori datumi sigmad ja tinglikkusarv jäävad tagurpidi stabiilse kahekordse täpsusega torujuhtme eelnevalt halvima juhu veapiiri sisse sellel probleemil; see ei väida, et need on nii täpsed, kui kahekordne täpsus võimaldab (faktoriseerimistee on samadel sisenditel umbes tuhat korda täpsem ja valikuline ruutjuure lahendaja umbes kümme miljonit korda), ning nõrgimat suunda valideeritakse ainult seal, kus selle lävi on alla täisnurga (jaamad fikseeritud kontroll)

# text
seg-71b463388e80 = Ruutjuure infodatumi lahendaja 50-kohalise laiendatud täpsuse vastu

# text
seg-5ec3e3c2bf19 = Valikuline ruutjuure infolahendaja (lunar-frame-campaign solver = "srif"; vaikeväärtus muutmata), mis ei moodusta ega pööra datumi jaoks kunagi infomaatriksit: valgendatud viivituse Jacobi maatriksi Householderi QR (ortogonaal-kolmnurkne lahutus) ruutjuure infofiltri mõõtmisuuendusena, Maa jaamad marginaliseeritud lõpliku kolmnurkplokiga (mille Grami korrutis on Schuri komplement), teine QR maatriksist R_bb A seitsmeparameetrilise Helmerti datumi jaoks, sigmad kolmnurkse pöördmaatriksi reanormidena ning spekter (tinglikkusarv, nõrgim suund) ühepoolsest Jacobi singulaarväärtuslahutusest. Sisekorrutised kompenseeritakse Dekkeri-jaotusega veatu korrutisega, nii et iga tehe on korrektselt ümardatud IEEE-754 põhitehe või ruutjuur; identsed tulemused igal platvormil põhjendatakse sellest, mitte ei testita platvormideülese

# text
seg-433b52bf0ba2 = Merenduse usaldusmonitorid: aritmeetika, millel need põhinevad (NMEA dekodeerimine, geodeetilised nihked, kinemaatika- ja anduri-jäägi statistikud)

# text
# c1: receiver_trust
# c2: maritime::en_offset_m
seg-c61c575f9c38 = Laeva jaoks dekodeerib <c1/> NMEA { "0183" } laused, mida vastuvõtja ja selle instrumendid väljastavad (GGA, RMC, VTG, HDT, VHW, VBW, ZDA, GSV), moodustab fiksidevahelise ida-põhja nihke (<c2/>) ja nendest statistikud, mille põhjal selle monitorid otsustavad: implitsiitne kiirus, dead-reckoning'i jääk, implitsiitne kiirendus ja implitsiitne pöördekiirus { "30" } s akendes, kursi-vs-trajektoori, kiirusloodi-vs-maakiiruse ja antenni kõrguse jäägid ({ "10" } s mediaanid) ning satelliidisignaali ja müra suhte hajuvus ja tõus.

# text
seg-32fcf6956dac = MIDA KONTROLLITAKSE VÄLISELT, kitsalt sõnastatuna: ({ "1" }) iga välja dekodeerimine, mida monitorid loevad, pynmea2 { "1.19.0" } (MIT) vastu { "8" } sünteetilisel logil ({ "1,086" } epohhi), täpsusega { "1e-9" } välja ühikus (laius- ja pikkuskraad, kõrgus, geoidi eraldus, HDOP, kiirused, kurss, suund, signaali ja müra suhe; täisarvud ja kuupäevad täpselt; kellaaeg täpsusega { "1e-6" } s), suurimad erinevused topeltarvu viimase numbri tasemel; ({ "2" }) kahe fiksi vaheline ida-põhja nihe, kauguse ja suunana, geographiclib { "2.1" } (MIT) WGS84 geodeesia vastu { "223" } fiksipaaril baasjoontega kuni { "2" } km, laiuskraadidelt -45 kuni { "70" } kraadi ja üle antimeridiaani, täpsusega { "0.01" } m ja { "0.001" } kraadi (suund geodeesia keskmise asimuudi vastu, kõõlu suund); ({ "3" }) monitoride sisendstatistikud { "341" } hinnatud epohhil { "400" } s sünteetilisest reisist pöörde ja asukohasammuga, Pythoni ümberarvutuste vastu, mis kasutavad kauguse ja asimuudi jaoks geographiclibi, dekodeerimiseks pynmea2 ja mediaanide ning standardhälvete jaoks numpyt: implitsiitne kiirus täpsusega { "0.005" } m/s, dead-reckoning'i jääk täpsusega { "0.02" } m, kiirendus täpsusega { "5e-4" } m/s^{ "2" }, pöördekiirus täpsusega { "1e-3" } deg/s, jääkide mediaanid ning signaali ja müra suhte hajuvus ja tõus täpsusega { "1e-6" }. MIDA MITTE: monitoride akna pikkused, lubatud hälbed ja läved on selle projekti enda reeglid; Python reprodutseerib need samast dokumentatsioonist, seega kinnitab kokkulangevus aritmeetika teostust, mitte reegleid. THS-lausel pole pynmea2 klassi ja ROT-lauset ei loeta; kumbagi ei kata. Tabel NMEA edastajast ja satelliidi numbrist RINEX-laadse satelliidi id-ni on selle projekti enda (võrreldakse ainult numbrit, edastajat ja väärtust). Ajasammu, hostikella ja autentimisoleku sisenditel puudub sõltumatu etalon. Kõik andmed on sünteetiline tekst failist receiver_trust::synth; siin ei ole ühtegi mõõtmist ning ühtegi väidet selle kohta, kuidas ükski monitor päris häire korral toimib, ei tehta. Suund: võrreldud geodeesia keskmise asimuudiga. Eelregistreeritud võrdlus fiksi { "1" } edasiasimuudiga ebaõnnestus täpsusel { "0.001" } kraadi ({ "77" } { "223" } paarist, halvim { "8.3e-3" } kraadi) definitsioonilise mittesobivuse, mitte aritmeetika tõttu; muudatus tehti pärast esimest käivitust ja mõlemad tulemused on registreeritud (edasiasimuudi võrdlus jääb testi kirjeldava, mitte eelregistreeritud piirina { "0.01" } kraadi). Avalikustatud: esimesed käivitused leidsid sisendid, mis proovisid liiga vähe (kiirendus ja pöördekiirus kärbiti igal epohhil nulli ning antimeridiaani rada ei ületanud seda kunagi), vea sünteetilises generaatoris (pikkuskraadi mässimist ei olnud) ning suuna puhul selle, et registreeritud etalonsuurus (geodeesia edasiasimuut esimesel fiksil) erineb kõõlu suunast umbes poole meridiaanikonvergentsi võrra ({ "77" } { "223" } paarist väljaspool { "0.001" } kraadi, halvim { "8.3e-3" }); sisendid parandati ja suunda võrreldi keskmise asimuudiga samal tolerantsil (muudatused { "1" } kuni { "3" } eelregistreeringus, tehtud pärast tulemuste nägemist ja seega mitte pimedalt); kursi ja suuna võrdlused tehti tsirkulaarseks ({ "360" } ja { "0" } kraadi on üks kurss, muudatus { "5" }). Mutatsioon: ida nihke skaleerimine { "1e-4" } võrra ebaõnnestub geodeesia võrdluses.

# text
seg-1fdbb476c8ab = Merenduse usaldusskoor: monitoride tõendite liitmine 0-100 skooriks ja selle kolmeks ribaks

# text
seg-0d76b33144f1 = Iga monitor taandab oma tõendid statistiku ja läve suhteks; skoor on { "100" } miinus monitoride summa kaal korda suhte piiratud lineaarne tõus ({ "0" } kuni { "0.5" }, { "1" } väärtusel { "1.5" }), piiratud vahemikku { "0" } kuni { "100" } ja ümardatud täpsusele { "0.1" }, ribadega väärtustel { "90" } ja { "55" }; iga epohh loetleb monitorid, mis arvasid maha, ja nende punktid.

# text
seg-b2d3c6d6ac36 = Teostus spetsifikatsiooni vastu, MITTE väline sõltumatu etalon: puhasruumi Pythoni uuesti teostus (scripts/maritime_score_cleanroom.py), mille kirjutas lugeja, kellele anti ainult docs/RECEIVER-TRUST.md ja docs/MARITIME-TRUST.md, mitte Rusti lähtekood, langeb score_from_ratios-ga kokku { "600" } suhtevektoril (skoor, riba, punktid ja mahaarvamiste järjekord, erinevus { "0" }) pärast seda, kui dokumentatsiooni täiendati seal, kus esimene lugeja leidis selle vaikiva või vastuolulisena (võrdsuse järjekord, ümardamine, läbimise-või-läbikukkumise monitori suhe, kaks näidet, mille numbrid valemiga ei klappinud). See näitab, et dokumentatsioon on piisav ja kood teeb seda, mida ta ütleb. MIDA EI KONTROLLITA ja miks rida jääb MODELLED: reegel ise (kaalud, tõus, riba servad, tõendi hoidmine) on selle projekti enda, eelregistreeritud, kuid ilma välise allikata, ning siin ei näita miski, et skoor { "80" } või { "40" } tähendab seda, mida navigaator tahaks, et see päris häire korral tähendaks; sellist näitajat ei anta. Monitoride läved on samuti selle projekti enda (rida A kontrollib ainult nende aritmeetikat).

# text
seg-f52fceaf06ca = NMEA { "0183" } treeningvoo standardi järgimine ja dekodeeritud väärtused

# text
seg-684f86418933 = Sünteetilised sillal kasutatavad NMEA { "0183" } vood meeskonna treeninguks (kshana nmea-scenario): GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW ja PKSHT marker, genereeritud tõelisest trajektoorist modelleeritud vastuvõtja, taeva, segamise ja spuufimise mõjudega. Ainult tekstiväljund; midagi ei edastata.

# text
seg-4591ed75149c = MIDA KONTROLLITAKSE VÄLISELT, kitsalt sõnastatuna: kõik { "225,227" } lauset kaheksast sünteetilisest treeningvoost (neli teegistsenaariumi, algväärtused { "1" } ja { "7" }; GGA, RMC, VTG, ZDA, GNS, GSA, GSV, HDT, VBW ja PKSHT marker) parsitakse pynmea2 { "1.19.0" } abil, mis on sõltumatu NMEA parser, kehtiva kontrollsumma ning oodatud edastaja ja tüübiga. Asukoht, maakiirus, maakurss, suund, UTC kellaaeg ja kuupäev, fiksi olek ja GGA satelliitide arv, mida see dekodeerib, võrduvad generaatori tõelise trajektooriga enne esimest võrdlust kinnitatud tolerantsides ({ "1.5e-6" } kraadi, { "0.06" } sõlme, { "0.07" } km/h, { "0.11" } kraadi kurss, { "0.5" } kraadi suund, { "0.02" } s), käivitatud skriptiga scripts/gen_nmea_training_ref.py fikstuuriga kaustas tests/fixtures/nmea_training_ref/. GGA satelliitide arvu ootust parandati pärast esimest käivitust NMEA kokkuleppele ({ "00" } ilma fiksita); arvulised tolerantsid on eelregistreerimise commit'ist muutmata. MIDA MITTE: et mis tahes vastuvõtja, kaardiplotter või sillasüsteem voogusid aktsepteerib; vastuvõtja, taeva, segamise või spuufimise mudelite realism (nominaalne taevas, modelleeritud müra, drag- ja replay-profiilid, kõik MODELLED); HDOP, kõrgus ning DOP-i ja GSA/GSV sisu kaugemale süntaksist ja arvudest; juhendaja logi. Midagi ei edastata ning ühtegi segamisvastast ega spuufimisvastast toimivust ei väideta.

# text
seg-1be1cfcb95c8 = Häirekaart: täpsuskoodide tähendused, AIS-i mitte-saadaoleva väärtused, ruudustiku lahtrisse määramine, marsruudi pikkus lahtri oleku kaupa ja sisemaa maskeerimine

# text
seg-71cff2a675e8 = ADS-B navigatsioonitäpsuse ja terviklikkuse koodide lugemine, mida kaart kasutab (EPU piir, mida NACp kood tähistab, sisalduvusraadiuse piir, mida NIC kood tähistab, ning nendest meetodi tuletatud madalad ja head klassid); AIS-i asukoha ja kiiruse mitte-saadaoleva väärtused, mille AIS-i lugeja kõrvale heidab; fikseeritud laius-/pikkuskraadi ruudustiku lahter, kuhu asukoht langeb; marsruudi pikkus ja selle jaotus lahtri oleku kaupa (degradeerunud, mitte degradeerunud, hindamata, mitte jälgitud), mida route exposure esitab; ning see, kas asukoht asub maismaapolügoonist sisemaa pool rohkem kui puhver. Degradeerunuks või anomaalseks märgitud lahter on väide esitatud täpsusväljade või ebatõenäoliste asukohtade kohta, mitte häire tuvastamine, ja siin ei kontrolli seda miski.

# text
seg-beee15333c89 = MIDA KONTROLLITAKSE VÄLISELT, kitsalt sõnastatuna: viis sõltumatut teostust loevad samu sünteetilisi sisendeid. ({ "1" }) pyModeS { "2.21" } dekodeerib sünteetilised DF17 töösoleku- ja õhuasukohakaadrid; Kshana NACp EPU piirid langevad kokku täpsusega { "0.5" } m (suurim erinevus { "0.4" } m), selle NIC sisalduspiirid koodidele { "5" } kuni { "11" } täpsusega { "1" } m ning selle madalad ja head klassid asetavad kõik { "12" } NACp koodi ja iga NIC koodi, mida sõltumatu etalon toodab ({ "0" } kuni { "11" }), läve samale poolele, mida sõltumatu etaloni piirid eeldavad ({ "0" } lahknevust). ({ "2" }) pyais { "3.3.0" } dekodeerib AIVDM tüüpi { "1" } laused, mille kasuliku koormuse bitid skript pakib toorete ITU-R M.1371 väljaväärtuste põhjal; Kshana lükkab tagasi täpselt dekodeeritud mitte-saadaolevad asukohad (laius { "91" }, pikkus { "181" }) ja kiiruse ({ "102.3" } sõlme) ning säilitab { "0" } kuni { "102.2" } sõlme dekodeeritult ({ "0" } lahknevust { "94" } kaadri üle). ({ "3" }) shapely { "2.2.0" } covers() lahtri polügoonidel langeb kokku funktsiooniga grid::Grid::cell_of { "1770" } punktil lahtrisuurustel { "0.5" }, { "0.25" }, { "1" } ja { "0.07" } kraadi, sealhulgas servalähedased punktid, mõlemad poolused ja antimeridiaan ({ "0" } lahknevust). ({ "4" }) shapely { "2.2.0" } marsruudi/lahtri lõige GeographicLib { "2.1" } WGS84 geodeesia pikkustega langeb kokku route exposure-ga { "8" } sünteetilisel marsruudil, sealhulgas kahel, mis ületavad antimeridiaani: kogupikkus täpsusega { "0.6" }% (suurim erinevus { "0.49" }%, sfäär ellipsoidi vastu) ja iga lahtri oleku pikkus täpsusega { "0.6" }% pluss { "125" } m tüki kohta (suurim { "21" }% sellest tolerantsist). ({ "5" }) shapely { "2.2.0" } contains() pyproj asimuutse ekvidistantse kaugusega rannajooneni langeb kokku { "2000" } m sisemaa maskiga { "992" } ruudustiku keskpunktil nelja sünteetilise saare ümber, millest üks järvega ({ "0" } lahknevust; { "4" } punkti { "20" } m piires puhvrist jäeti välja ja loeti). Tolerantsid kinnitati failis tests/fixtures/interference_map_ref/PREREGISTRATION.md enne ühtegi võrdlust ja pärast neid ei muudetud; kaks sünteetiliste sisendite viga, mille esimene käivitus leidis, on seal registreeritud. MIDA MITTE: Kshana ei dekodeeri toorest Mode S kaadreid ega AIVDM lauseid, seega valideerib see tema juba dekodeeritud väärtuste lugemist, mitte dekooderit. Sõltumatu etaloni NIC sisalduse raadiused koodidele { "1" }, { "2" } ja { "4" } erinevad standardist DO-260B ({ "20" }, { "8" } ja { "2" } NM), seega võrreldakse numbriliselt ainult koode { "5" } kuni { "11" }. Asukohareegel ({ "0" }, { "0" }), kõrguse põrand, allikatüübi filter, identifikaatorite räsimine, meetodi läved ja statistikud ning lahtrisuuruse valik on Kshana enda ning neid ei kontrollita millegi vastu. Marsruudi võrdlus kasutab mõlemal poolel sama laius- ja pikkuskraadis sirge tee definitsiooni, seega kontrollib see pikkusi ja lahtrisse määramist, mitte seda, et see tee on laeva või õhusõiduki jaoks õige. Siin ei näita miski, et märgitud lahter on häire. Sisendid on sünteetilised; sõltumatu etaloni fikstuurid kirjutab skript scripts/gen_interference_map_ref.py (pyModeS on GPL-3.0 ja seda kasutatakse ainult selles võrguvälises skriptis; CI ei vaja Pythonit).

# text
seg-57ace69bdf1a = Usaldustelemeetria andmevormingud: Prometheus tekstieksponeering ja OpenTelemetry OTLP/HTTP JSON

# text
seg-654126a9d073 = GNSS-i usaldus (skoor, riba, põhjused, värav ja soovi korral asukoht) Prometheus tekstieksponeeringuna, mida serveeritakse aadressil /metrics, ja OTLP/HTTP JSON mõõdikutena, põhjuse sildi kardinaalsuse piiranguga.

# text
seg-b037c999443b = Usaldustelemeetria SIEM-sündmused: Common Event Format (CEF) üle syslogi

# text
seg-ffd8d7062055 = Ribamuutuse (või epohhipõhised) sündmused Common Event Format kasulike koormustena RFC { "5424" } ümbrises UDP või TCP kaudu, dokumenteeritud väljakaardistuse ja CEF-i paosümbolitega.

# text
seg-51640405c9b7 = Usaldustelemeetria SIEM-sündmused: Log Event Extended Format (LEEF) üle syslogi

# text
seg-1b3245506847 = Ribamuutuse (või epohhipõhised) sündmused Log Event Extended Format { "2.0" } kasulike koormustena RFC { "5424" } ümbrises UDP või TCP kaudu, dokumenteeritud väljakaardistusega.

# text
seg-563ccb0adbe5 = MIDA KONTROLLITAKSE: selle kasti enda täpsed stringitestid dokumenteeritud LEEF-i väljakaardistuse ja RFC { "5424" } ümbrisväljade kohta; hooldatavat avatud lähtekoodiga LEEF-i parserit ei ole (Pythoni paketiindeksi otsing ei leidnud ühtegi), seega kontrollitakse vormingut tema enda spetsifikatsiooni vastu, mida luges sama autor, mitte välise sõltumatu etaloni vastu. MIDA MITTE: kas LEEF-i kasulikke koormusi aktsepteerib ükski tarnija parser või SIEM; paosümbolite reeglid kaugemale dokumenteeritutest; päris syslogi kollektori käitumine.

# text
seg-96a95b89faa5 = Tõendipaketi terviklikkus: allkiri, räsiahel ja kontrolliprotseduur

# text
seg-943a853d8a4a = Allkirjastatud, räsiahelaga GNSS-i usaldussündmuse tõendipakett: SHA-256 üle iga faili ja ahel üle manifesti, Ed25519 allkiri üle täpsete manifesti baitide ning kontrollija, mis nimetab iga rikke (muudetud, eemaldatud, ümber nimetatud, vahetatud või lisatud fail, ümber järjestatud või redigeeritud manifest, võtmeta uuesti räsitud manifest, uuesti allkirjastatud pakett, vale kinnitatud võti ning ajatempli token, mis on eemaldatud, asendatud, rämps või teise dokumendi kohta).

# text
seg-c15736afcbc9 = RFC { "3161" } ajatempli tokeni allkirja ja ahela kontroll

# text
# c1: kshana evidence verify --tsa-ca <anchors.pem>
# c2: openssl ts -verify
seg-cd64bbf39459 = evidence::tsa::verify_token ja valikuline <c1/> paketi timestamp.tsr jaoks: RFC { "3161" } TimeStampResp või paljas TimeStampToken (CMS SignedData üle TSTInfo) kontrollitud võrguväliselt usaldatud ankrute vastu nii, nagu <c2/> seda kontrollib: allkirjastatud atribuutide sisutüüp ja sõnumi räsi üle TSTInfo; allkiri üle allkirjastatud atribuutide (RSA PKCS#1 v1.5, RSASSA-PSS, ECDSA P-256 ja P-384; RSA avalikud tehted crypto-bigintil); ESS signing-certificate v1 (SHA-1) või v2 räsi, mis nimetab allkirjastaja sertifikaadi, leitud tokeni ja kutsuja mitteusaldatud sertifikaatide hulgast; allkirjastaja kriitiline, ainus timeStamping laiendatud võtmekasutus; ahel usaldatud isetehtud ankruni koos iga sertifikaadi allkirja, CA staatuse ja võtmekasutusega ning iga sertifikaat kehtiv tokeni genTime hetkel; ja sõnumijäljend andmete vastu. Ei kontrollita: tühistamist (CRL, OCSP), nime- ja poliitikapiiranguid, nonce'i

# text
seg-c04042b0270a = JammerTest { "2024" } andmestikul kalibreeritud vastuvõtja usalduse häirelävid

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: C/N0-languse, AGC ja segamisindikaatori monitoride eelregistreeritud kalibreerimine avalikul JammerTest { "2024" } andmestikul (Zenodo { "15911589" }, GPL-3.0-or-later, toodud käitusajal, kunagi kaasa panemata): kausta kohta { "1" } s ajajoon failidest mon_rf.csv ja rinex.csv, monitorid käivitatud ühe korra, iga kalibreerimisjärgne epohh märgistatud puhtaks või segamiseks kausta attack_log järgi (nihutatud CEST-ilt UTC-le, { "60" } s kaitse), iga lävi pühitud fikseeritud ruudustikul, valitud väikseim lävi koondatud puhta valehäire tõenäosusega kuni { "0.01" } ning kaust-välja-jäetud tagasihoitud arvud; UBX lugeja ristkontroll. Valik tarnitakse ainult valikulise profiilina [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); vaikereegel ja iga väljund ilma selleta on muutmata

# text
seg-65a8361b4a22 = Jammertest’i hindamine: vastuvõtja logi, mida hinnatakse iga ajastatud katse kohta (tuvastusviide, tuvastamata jäänud häired, valehäired, taastumisaeg) avaldatud katsekava suhtes

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA katsekataloog ja edastuskava (MIT, toodud kindlaksmääratud SHA-256-ga, kunagi ei lisata koodibaasi koopiana), mida loetakse ajastatud tõena, kataloogi id-d säilitatud; receiver-trust käitus, mida hinnatakse iga katse kohta (esimene alarm miinus kavandatud algus, tuvastatud/hiline/tuvastamata jäänud tolerantsi suhtes, aeg esimese alarmivaba lõiguni, alarmid väljaspool iga pesa ja selle kaitseintervalli), koos allkirjastatud tõendipaketiga, mis kannab tulemuskaarti. Ajakava on kavandatud pesad, mitte salvestatud eetriaegu

# text
seg-0d227bbcb5f1 = Katsepingi eksport (kshana bench-export): Maaga seotud, geodeetilised ja kohaliku kiiruse veerud, asendiveerud ja NMEA { "0183" } väljund

# text
seg-c6a6e08afadd = Liikumise CSV Maaga seotud asukoha, geodeetilise asukoha, Maaga seotud kiiruse, suuna/tõusunurga/küljekalde ja UTC veerud ning NMEA GGA/RMC laused, kirjutatud sünteetilistest stsenaariumidest (gnss-ins, sh automotive-urban-canyon, jamming, gnss-sim). Ainult liikumine ja sündmused; signaali ei kirjutata ning simulaatori ega vastuvõtja toimivust ei väideta.

# text
seg-f953ad11fe08 = MIDA KONTROLLITAKSE VÄLISELT, kitsalt sõnastatuna: pyproj { "3.8.0" } (PROJ { "9.8.1" }), geographiclib { "2.1" }, pynmea2 { "1.19.0" } ja scipy { "1.18.1" } suhtes, käitatud skriptiga scripts/gen_testbench_ref.py { "4" } sünteetilisel stsenaariumil, tolerantsidega, mis on fikseeritud enne esimest võrdlust (iga on kirjutaja ümardamise halvim juhtum): Maaga seotud veerud võrduvad geodeetiliste veergude WGS { "84" } teisendusega (halvim { "1.3e-4" } m, lävi { "3e-4" }) ja pöördteisendusega ({ "1.3e-9" } kraadi, lävi { "2e-9" }; kõrgus { "1.3e-4" } m, lävi { "3e-4" }) igal real; PROJ-i topotsentrilise tehtega põhja-ida-alla süsteemi pööratud Maaga seotud kiirus võrdub mootori tõelise NED-kiirusega ({ "7.5e-5" } m/s, lävi { "2e-4" }); suund, tõusunurk ja küljekalle võrduvad scipy yaw-pitch-roll väärtustega mootori tõelisest kvaternioonist ({ "5.0e-7" } kraadi, lävi { "1e-6" }); iga NMEA lause parsitakse pynmea2-s kehtiva kontrollsummaga ning selle dekodeeritud asukoht ({ "1.2e-3" } m, lävi { "5e-3" }), kõrgus, kiirus, kurss ({ "5.0e-4" } kraadi, lävi { "1e-3" }) ja aeg võrduvad liikumisväärtustega; UTC veerg võrdub sõltumatu kuupäeva-kellaaja arvutusega. Kontrollitud täpsete CSV ja NMEA baitide SHA-256 on kindlaks määratud. MIDA EI KONTROLLITA: stsenaariumi enda tõesuunalist trajektoori (sõiduprofiil ja selle integreerimine); konventsioone (suund on keha kõrvalnurk, mitte kurss, ning erineb sellest kuni umbes { "77" } kraadi võrra stsenaariumis automotive-urban-canyon; GGA kvaliteet, satelliitide arv ja HDOP on kohatäited); kas mõni laboratoorne simulaator loeb faile ettenähtud viisil; mis tahes simulaatori või vastuvõtja toimivust. Sõltumatud etalonid kontrollivad teisendusi ja kodeeringuid, mitte stsenaariumi füüsikat. Kohaliku koordinaatsüsteemi käsitlust kontrollitakse ainult kiiruse pöörde ning NMEA kiiruse ja kursi kaudu (CSV-l puudub kohaliku asukoha veerg).

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): Kshana väljundite vastendus avalike raamistike klauslitele ainult numbri järgi, täidetud antud käituste põhjal; tulemus loetakse võimekuse kasuks ainult siis, kui see kannab tõendit, mida vastendus nimetab, tühi hulk ei tõenda midagi ja sõnastus on „toetab tõendeid (supports evidence for)“; aruanne ei ole järeldus, et mõni raamistik on täidetud, ega kellegi antud hinnang või kinnitus.

# text
seg-8659260fd38e = Viited kontrollitud tsiteeritud avalike dokumentide skriptiga eraldatud pealkirjaindeksi suhtes, loetud 2026-10-10 (tests/compliance_references.rs). MIDA KONTROLLITAKSE: { "49" } viidatud klauslit, jaotist, lõiku või pealkirja viidet on viidatud dokumendis olemas ning { "7" } viidatud URL-i lahendus õnnestus registreeritud kuupäeval ({ "2" } teise marsruudi kaudu); negatiivsed kontrollid ebaõnnestuvad. MIDA EI KONTROLLITA: et mis tahes parafraas, vastendus või lünk on õige; EN { "16803" } klauslid (tasuline, ainult kataloogitekst); hilisemad redaktsioonid; indeks ei ole sõltumatu teostus.

# text
seg-98c360d82d56 = Merendusintegratsioonid: Signal K pistikprogramm, OpenCPN värava voog ja skoori paneel, etalonehitus

# text
seg-7af9ce566646 = Usaldusskoor, vöönd, põhjused, värava olek ja vastuvõtja teatatud asukoht, mis avaldatakse Signal K serveris asukohas navigation.gnss.kshana koos hoiatuse, alarmi ja tavalise teavitusega (integrations/signalk); värava NMEA voog, kus fiks on märgitud kehtetuks, kui usaldus on kokku varisenud, ja tsükli kohta üks PKSHT lause, mida pakub OpenCPN-ile TCP kaudu värav ise või väike relee, ning natiivne OpenCPN skoori paneel, mis loeb PKSHT lauset (integrations/opencpn); ning systemd üksused ja konteiner, mis käitavad väravat (deploy/reference-build). Kus need näitavad väljundit, kannavad need nõuandvat avaldust: Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
seg-00a0f52f7458 = MIDA KONTROLLITAKSE, kitsalt sõnastatuna: et need integratsioonid töötavad päris tarkvaraga, mille jaoks need on kirjutatud. TÕEND on lisatud failis integrations/signalk/evidence/README.md (koos selle JSON-failidega) ja integrations/opencpn/evidence/README.md (koos selle ekraanipiltide ja logidega), kummagi juures skript, mis seda reprodutseerib. ({ "1" }) Signal K: pistikprogramm laaditi kindlaksmääratud signalk-server { "2.33.0" } npm-paketti, privaatses ainult loopback-võrgu nimeruumis, sünteetiliste andmetega. Serveri enda REST- ja WebSocket-liidesed näitasid avaldatud teid, skoori metaandmeid ning teavitust, mis läks olekust puudub olekusse warn, alarm, normal (pärast hoidmist) ja uuesti warn, kui andmed lakkasid tulemast. Kui pistikprogramm käitas päris kshana-d serveri enda vastuvõetud NMEA põhjal, läks teavitus olekust warn olekusse alarm ja vastuvõtja teatatud asukoht avaldati; serveri enda navigation.position kirjutas selle NMEA pakkuja, mitte kunagi pistikprogramm. Uuesti käitatud elava JSON-skeemi { "1.2" } vastu. ({ "2" }) OpenCPN: pistikprogramm ehitati OpenCPN-i pistikprogrammi API päise ja wxWidgets { "3.2.4" } vastu, laaditi OpenCPN { "5.8.4" } Ubuntu { "24.04" } paketti virtuaalekraani all; OpenCPN laadis selle, käivitas selle initsialiseerimise ja andis sellele värava voo PKSHT laused ning paneel muutus punaseks ebausaldusväärsel vööndil. Ühes puhtas käituses lakkas OpenCPN-i enda laeva asukoht uuenemast ja selle fiksi indikaator langes, kui värav märkis fiksi kehtetuks. Teine käitus, mida toitis otse värava TCP-kuulaja, näitas kohaletoimetamist pistikprogrammile, kuid mitte puhast enne-ja-pärast võrdlust. ({ "3" }) Relee testid taasesitavad värava voo salvestatud väljavõtte päris TCP-pesa kaudu ja kontrollivad, mida tarbija saab (baidid muutmata, kehtivad kontrollsummad igal lausel, sh ümber kirjutatud lausetel, GGA ja RMC on kooskõlas, tsükli kohta üks PKSHT värava väljaga seal, kus fiks on kehtetu), ning otsast lõpuni skript kontrollib, et värava kuulaja tarbija saab täpselt samad baidid, mida sama värav kirjutab standardväljundisse. ({ "4" }) PKSHT parserid (JavaScript ja C++) käitatakse kshana väljundist salvestatud lausetel ning need lükkavad tagasi vale kontrollsumma, versiooni või skoori väljaspool vahemikku { "0" } kuni { "100" }. ({ "5" }) systemd üksusi kontrollitakse käsuga systemd-analyze verify (systemd { "255" }, binaarfailid asendatud) ning kaitsetega ExecStart-is oleva shelli, taaskäivituspoliitika ja liivakasti võtmete vastu; konteineri sisenemispunkti argumentide käsitlust kontrollitakse asendusbinaarfailiga. MIDA EI KONTROLLITA: ühegi väärtuse jaoks, mida need integratsioonid näitavad, puudub väline sõltumatu etalon. Usaldusväärtused ise on ülaltoodud read ja integratsiooni käitus näitab ainult seda, et torustik neid kannab; seetõttu on see rida MODELLED, mitte VALIDATED (docs/VALIDATION.md). Kasutati mitte ühtki päris laeva, vastuvõtjat, pikka käitust, kummagi hosti muud versiooni, muud operatsioonisüsteemi ega töölauda; kõik andmed on sünteetiline tekst ja siin pole ükski mõõtmine. Päris Signal K kliendi teavituse heli ja visuaalset käsitlust, OpenCPN-i tööriistariba nuppu, eelistusi ja aegunud olekut ning OpenCPN-i pistikprogrammihalduri jaoks pakendamist ei katsetatud. systemd liivakasti võtmeid kontrolliti ainult süntaksi osas, mitte käitatud elava systemd all, ning konteineri kujutise ehitamise ja selle tervisekontrolli kohta puudub siin lisatud tõend. Ühtki tuvastus- ega valehäirenäitajat ei väideta. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
seg-475397d05dd0 = <s1>receiver_trust (live: the gate, its TCP listener, PKSHT); outside the crate: integrations/signalk (JavaScript), integrations/opencpn (JavaScript relay, C++ native plugin), deploy/reference-build (systemd units, container)</s1>

# text
seg-89ab9ef155eb = BOC({ "1,1" }) jälgimine: DLL skaleerimine ja bump-jump mitmetähenduslikkuse lahendamine (valikuline)

# text
seg-ef24be9b5917 = iq::track::LoopConfig väli boc (valikuline, vaikimisi None): kolm DLL diskriminaatorit skaleeritakse nii, et need näitavad koodiviga kiipides ühikulise tõusuga siinus-BOC({ "1,1" }) peamaksimumil, ning bump-jump monitor väga varajastel ja väga hilistel korrelaatoritel ühe alamkandja poolperioodi ({ "0.5" } kiipi) kaugusel, mis hüpitab koodi NCO-d peamaksimumi suunas, kui üles/alla loendur jõuab väärtuseni N (vaikimisi { "8" }). Ilma valikuta on iga väljund muutumatu.

# text
seg-2c32955cbfb3 = IQ ionosfääri sintillatsioonikanal (Cornelli mudel) mõõdetud { "50" } Hz GPS L1 sintillatsiooni suhtes

# text
seg-2fdcb373ab25 = iq::channel::scint, Cornelli sintillatsioonimudel (Rice’i intensiivsus, teist järku Butterworthi spekter, faas arg z), mida juhitakse mõõdetud akna S4 ja intensiivsuse dekorrelatsiooniajaga, võrreldes sellega, mida see nende kahe sisendi kõrval genereerib; realdata::scint50 loeb mõõdetud logi, eemaldab trendi ja käitab võrdluse.

# text
seg-160507ac3702 = Lahtrikeskmistav CFAR-valik IQ hõivamises

# text
seg-7c0a1adc9ae6 = iq::acq::ca_cfar ja ca_cfar_cells (valikuline): hõivamisruudustiku lahtrit võrreldakse selle Doppleri rea tugilahtrite keskmisega (kaitse- ja sammulaagid, perioodi ümber mähitud), teguriga alfa, mis on seatud M mittekoherentse bloki suletud kujulise CA-CFAR valehäire tõenäosuse järgi (ca_cfar_pfa, ca_cfar_alpha). Valimivõimsuse detektor jääb vaikeväärtuseks ja iga olemasolev väljund on muutumatu.

# text
seg-5bd3bf0c22a7 = Spektrimudel: GLONASS-i, BeiDou ja Galileo E6 ribad (valikuline)

# text
seg-9c16189c63ac = spectrum::default_band lahendab ainult nime järgi (MORE_BAND_NAMES) GLONASS-i L1OF ja L2OF igal FDMA kanalil K = -7 kuni { "6" } (BPSK, { "0.511" } Mchip/s), BeiDou B1I (BPSK({ "2" })), B1C (MBOC(6,1,1/11)), B2a ja B3I (BPSK({ "10" })) ning Galileo E6 (BPSK({ "5" })), nende liidesekirjelduste kandesagedustega ja minimaalsete vastuvõetud võimsustega; vaikimisi ribakomplekt ja iga olemasolev väljund on muutumatud.

# text
seg-63b7da996265 = BeiDou B1I peamised kaugusmõõtmiskoodid sõltumatu generaatori suhtes

# text
seg-64bb9bbe6629 = iq::signals::beidou::b1i_bits ja b1i: BDS-SIS-ICD-B1I-3.0 Goldi koodid, kärbitud { "2046" } kiibini, PRN { "1" } kuni { "63" }, nagu IQ-kiht neid genereerib, hõivab ja jälgib.

# text
seg-b4787b04338e = GPS L1C kaugusmõõtmis- ja ülekattekoodid IS-GPS-800J trükitud kontrollveergude suhtes

# text
seg-708967246fd8 = iq::signals::gps::l1c_p_bits, l1c_d_bits ja l1c_o_bits: L1CP ja L1CD Weili kaugusmõõtmiskoodid (arvutatud Legendre’i jada, Weili indeks, enne kiipi p lisatud laiendusjada) ja L1CO S1 ülekattekoodid, PRN { "1" } kuni { "63" }.

# text
seg-5cba09089e09 = LunaNet AFS-I ja AFS-Q peamised koodid LSIS-AFS V1.0 trükitud kontrollveergude suhtes

# text
seg-c8ad32b783bd = iq::signals::lunanet::afs_i_bits ja afs_q_primary_bits (signaalide nimed lunanet-afs-i ja lunanet-afs-q käsus kshana iq): AFS-I Goldi kood ({ "2047" } lühendatud tsüklina { "2046" }-ni, G2 viivitatud PRN-i kohta) ja AFS-Q Weili peamine kood (arvutatud Legendre’i jada, Weili indeks, enne kiipi p lisatud laiendusjada), PRN { "1" } kuni { "210" }.

# text
seg-7b1ae0c7ca28 = LunaNet AFS kolmandad koodid ja sõnumikiht (SB1 BCH, CRC-24Q, põimur) LSIS-AFS V1.0 suhtes

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: sünkroniseerimismuster, SB1 BCH({ "51,8" }) kodeerija ja 256 hüpoteesiga dekooder, CRC-24Q, { "60" } x { "98" } plokkpõimur, sümbolivoo kontrollija (kshana lunanet-afs-check) ja testvoo generaator kohatäite alamkaadritega. Alamkaadrite { "2" } kuni { "4" } kiirusega 1/2 LDPC kodeerimist ei ole teostatud (selle maatriksid on eraldi lisas).

# text
seg-0d7b17524c04 = Standardipaketid: stsenaariumid, mida hinnatakse enne käitust fikseeritud lävede suhtes

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): DHS Resilient PNT raamistiku katseprofiilid tasemetele { "1" } kuni { "4" }, IMO MSC.1/Circ.1575 täpsustasemed ja terviklikkuse hindamine ning ICAO Doc { "9849" } lisa F jälgimise, hindamise ja leevendamise paketid: iga katse käitab kaasasolevat stsenaariumi liiki ja võrdleb tulemusvälju paketis fikseeritud lävedega ning katsed, mis vajavad vastuvõtja logi, on loetletud kui NEEDS INPUT ja neid ei hinnata.

# text
seg-d9ea966abdd6 = Stsenaariumi tulemuste kohta puudub väline sõltumatu etalon: iga paketi katse käitab MODELLED stsenaariumi liiki. Läved on paketi autori fikseeritud profiil (DHS raamistik ei määra väärtusi; IMO täpsuspiirid on MSC.1/Circ.1575 tabel C-1, loetud täielikult; ICAO pakett järgib ICAO enda RFI Mitigation Plan esitlust, sest Doc { "9849" } on tasuline väljaanne ja seda ei loetud), lisatud enne mis tahes hinnatud käitust xval-stiilis PREREGISTRATION.md failides kataloogis standards/. MET-lävi ütleb, et modelleeritud stsenaarium täitis fikseeritud läve, mitte midagi toote kohta

# text
seg-8a8f2c85e0c3 = Laboratoorne edasi-tagasi tõendipakett (stsenaarium, katsetingimused, vastuvõtja logi, skoor)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) ja kshana.test-conditions/1 vastuvõtja logi eksport käsust kshana bench-export: allkirjastatud pakett, mis salvestab stsenaariumi räsi, fikseeritud tingimuste räsi, logi räsi ja skoori fikseeritud sündmuste suhtes ning keeldub tingimustest, mis ei lähe kokku hindamissündmustega, või logist, mille räsi ei ole fikseeritud räsi. Signaali ei kirjutata, taasesitata ega ajastata.

# text
seg-76da58fe670a = Väline sõltumatu etalon puudub: pakett seob räsisid ja MODELLED vastuvõtja logi skoori, kontrollitud sünteetilistel andmetel (kaasasoleva stsenaariumi eksporditud NMEA, mida käsitletakse vastuvõtja logina). Laboratoorset käitust ei väideta

# text
seg-a9189e4fe413 = IQ jälgimismootor GNSS-SDR-i { "0.0.19" } suhtes sõltumatutel salvestustel

# text
seg-364de05e5b1b = Täielik IQ-kihi jälgimismootor (iq::track käsu kshana iq track kaudu: hõivamise üleandmine, korrelaatorid, NCO-d, teist järku { "15" } Hz Costase PLL, esimest järku { "2" } Hz kandjaga abistatud EML-ümbriku DLL, lukustusindikaator ja C/N0 hinnangud) GPS L1 C/A signaalil väärtustel { "30" } kuni { "45" } dB-Hz.

# text
seg-259d201c2ff8 = CRPA antennivõimendused jamming-liigis sõltumatu numpy ümberarvutuse suhtes

# text
seg-192144c57783 = Liigi jamming valikuline jaotis [crpa]: iga satelliidi suunas kanalipõhine kiir (nullijuhtimine, kus segaja on null, või MVDR kujul sigma^{ "2" } I + P_j a_j a_j^H), mis skaleerib iga lüli müra teguriga ||w||^{ "2" } ja segajat teguriga |w^H a_j|^{ "2" } enne olemasolevat häirekindla C/N0 võrrandit.

# text
seg-a2f34cff9338 = Segaja maastikuvarjestus jamming-liigis sõltumatu numpy ümberarvutuse suhtes päris SRTM-i lahtril

# text
seg-334c569d9cae = Liigi jamming valikuline jaotis [terrain]: segaja ja vastuvõtja vaheline suurringi maastikuprofiil SRTM .hgt lahtril k-teguriga Maa kumerusega, domineeriv noaserv (suurim Fresneli-Kirchhoffi nu) ning ITU-R P.526-15 jaotise { "4.1" } ühe noaserva sumbuvus, mis lahutatakse segaja vastuvõetud võimsusest.

# text
seg-825c121c7512 = Hõivamise hüsterees ja esiotsa kvantiseerija jamming-liigis sõltumatute ümberarvutuste suhtes

# text
seg-f7207263d881 = Liigi jamming valikuline jaotis [acquisition] (satelliit hõivatakse hõivamislävel või sellest kõrgemal pärast uuesti hõivamise viivitust ja hoitakse, kuni see on jälgimislävel või sellest kõrgemal) ja jaotis [front_end] (AGC näit { "10" } log10({ "1" } + J/N) ning ADC Gaussi sisendi kvantiseerija kadu, võetud maha igalt lülilt, märgitud kui mittekehtiv mitte-Gaussi segajate korral).

# text
seg-9c46f1c76486 = Piiratud FLL-i sisselukustumine allpool vaikeprojekti FLL-ist PLL-ile ülemineku alampiiri (valikuline)

# text
seg-efa1d1a9e904 = iq::track valikuline carrier.fll_pull_in_max_s (iq::track::LoopConfig väli fll_pull_in_max_s): kui fll_assist = pull-in, annab FLL pärast kindlaksmääratud sisselukustumisaega PLL-ile üle sõltumata PLI-st, vastava tagasipöördumise viibega, kuni PLI jõuab esimest korda väärtuseni fll_off_pli.

# text
seg-ac0f97e945a7 = RTKLIB .pos lahendifaili lugeja receiver-trust jaoks

# text
seg-0b8bc2c89de4 = Loeb RTKLIB lahendifaili (kalendri- või GPS-nädala/TOW-aeg, laius/pikkus või ECEF-asukoht, kasutatud satelliidid) receiver-trust ajajoonele (receiver_trust::machines::rtklib).

# text
seg-3de364392f92 = Väline sõltumatu etalon puudub: ühtki RTKLIB-i loodud faili ei loetud ja veergude paigutus pärineb RTKLIB-i käsiraamatust. Kontrollitud ainult ise kirjutatud failidega; ECEF-teisendus kasutab uuesti funktsiooni frames::ecef_to_geodetic, millel on oma read

# text
seg-849393517c04 = NovAtel OEM7 ASCII- ja binaarlogid (BESTPOS, RANGE, RXSTATUS) receiver-trust jaoks

# text
seg-7e0021922025 = Loeb BESTPOS-i (asukoht), RANGE’i (C/No signaali kohta) ja RXSTATUS-t (vastuvõtja segaja lipp epohhi enda aruandena) ASCII- ja binaarsetest OEM7 logidest, CRC-ga kontrollitud, ainult lugemiseks (receiver_trust::machines::novatel).

# text
seg-1f7c6d1009a8 = Väline sõltumatu etalon puudub läbimise lävena. Väljade paigutused ja CRC järgivad avalikku OEM7 dokumentatsiooni (docs.novatel.com); CRC rutiini kontrolliti üks kord CRC vastu, mille dokumentatsioon esitab oma BESTPOSA näite jaoks (viidatud, mitte tsiteeritud). Fikstuurid on ise kirjutatud; ühtki päris vastuvõtja logi ei loetud

# text
seg-a45c53a9deb3 = RTCM { "3" } MSM4 ja MSM7 kandja-müra suhte lugeja receiver-trust jaoks

# text
seg-0a0c9976236f = Loeb RTCM { "3" } MSM4 ja MSM7 sõnumite (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) iga signaalilahtri C/N0 kaadrivoost, CRC-24Q-ga kontrollitud (receiver_trust::machines::rtcm3). Paigutused BSD-litsentsiga pyrtcm tabelitest, mitte RTCM standardi tekstist.

# text
seg-2af6fc1abe98 = ReferenceImpl ühekordses kontrollis, mitte komplekti testis: pyrtcm { "1.2.0" } dekooder loeb samu ise kirjutatud kaadreid samale C/N0-le ja epohhi ajale. See jagab oma tabelite allikat selle lugejaga, seega kontrollib see bittide käsitlemist, mitte paigutust. Ühtki päris vastuvõtja ega baasjaama salvestust ei loetud

# text
seg-cd554a7c1649 = GNSS-SDR monitori adapter receiver-trust jaoks

# text
seg-22b587ac642d = Loeb GNSS-SDR Monitori (Gnss_Synchro) ja PVT-monitori sõnumeid, mis on edastatud JSON-ridadena proto väljanimedega, kanalipõhiseks C/N0-ks, fiksiks, kasutatud satelliitideks, HDOP-iks ja taevaks (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-d22aed9d9a16 = Väline sõltumatu etalon puudub: väljanimed pärinevad GNSS-SDR dokumentatsioonist; ei lugejat ega relay.py-d ei käitatud elava GNSS-SDR-i ega päris salvestuse vastu

# text
seg-217e5953c128 = IMU logi sissevõtt, güroskoobi suunasisend ja hübriidandurite parameetrite Alani sobitus

# text
seg-9dadc819daef = Loeb IMU CSV-d (dokumenteeritud veerud või EuRoC paigutus); integreerib pöörlemiskiiruse suunaks, mida suuna-kursi monitor loeb ([log.imu]); ning sobitab hübriid- ja liitstsenaariumide kiirendusmõõturi ja güroskoobi müraparameetrid paigalseisu logist kattuva Alani hälbe abil (imu-fit).

# text
seg-9099f3467e9e = Väline sõltumatu etalon puudub: sobitust kontrollitakse sünteetilistel teadaolevate koefitsientidega valge müra logidel, suunda konstantse pöörlemiskiirusega logidel. Ühtki päris IMU logi ei sobitatud ja q_aa-d ei sobitata

# text
seg-15a852a2dcb0 = Home Assistant MQTT avastus ja olekueksportija usaldustelemeetria jaoks

# text
seg-6d6b07b26966 = JSON olekudokument ja Home Assistant MQTT avastussõnumid usaldusvoo jaoks, trükitud tekstina igal pinnal ja avaldatud MQTT { "3.1.1" } QoS { "0" } kaudu CLI-ga (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-79a8f3864af3 = Väline sõltumatu etalon puudub: pakette luges testi jaoks kirjutatud loopback-kuulaja, mitte päris vahendaja, ja Home Assistant-i ei käitatud

# text
seg-68caf86157c2 = ROS { "2" } receiver-trust pakett ja gnss_lib_py sild

# text
seg-e7d7d99fe538 = ROS-ita sild, mis kirjutab fiksi- ja satelliidisõnumid NMEA-na ja hindab neid Pythoni sidumise kaudu (integrations/ros2/kshana_trust), ning gnss_lib_py NavData sild receiver-trust-i rtklib-pos vormingu kaudu (integrations/gnss_lib_py).

# text
seg-05ded40b17d2 = Väline sõltumatu etalon puudub: ROS-i sõlme ei käitatud elaval ROS { "2" } graafil ja ublox_ubx_msgs väljanimesid ei kontrollitud töötava draiveri suhtes. gnss_lib_py (MIT) käitati sillatesti jaoks

# text
seg-6eee4b0e40b9 = <s1>Eelmine</s1>Kontrollimaatriks

# text
seg-c3e7639ccf1a = <s1>Järgmine</s1>Miks read jäävad modelleerituks

seg-65185cb68d6b = Missioonifaaside ahela navigatsiooni- ja ajastusvea eelarve startimisest sisenemiseni (<c1/>)

seg-86a132e1a243 = Liik <c1/>: faaside dokument, millest iga on üks kaheksast registreeritud liigist, käivitatud järjekorras, 6x6 kovariatsiooni, kella ja tugisüsteemi edasiandmisega öeldud reegli järgi (<c2/>; <c3/>, valge kiirendusmüra öeldud vahemiku jooksul sirgjoonelisel mudelil; <c4/>, inertsiaalne edasiliikumine ja seejärel allika alampiir, mitte kunagi sellest allapoole, mitte kunagi lähtestamine); tugisüsteemi teisendused GCRF, MCI ja MCMF ning ajaskaala teisendused läbi TT, igaüks oma eelarveread, Kuu olek valikulisest DE440 kerneli lõigust ja analüütiline rida öeldud varuvariandina; varu öeldud nõude suhtes, nõrgim lüli, sündmused ja ajajoone joonis. Iga arv on öeldud sisend või selle mudel

seg-cf8a0dc4088e = Käsitsiarvutused testides (sirgjoonelise kovariatsiooni kasv, keskmine sideeriline pöörlemine, ilmalik Kuu kella käik) ja ainult Kuu oleku jaoks salvestatud DE440 kerneli lõigud kinnitatud JPL Horizonsi väärtuste vastu (halvim { "2.6" } m ja { "7e-6" } m/s). Missiooniandmeid ahelaga ei võrrelda; selle faasid on omaette read. Dokument on öeldud ahel ILLUSTRATIVE sisenditega, ainult avalike allikatega ja ilma ühegi agentuuri toetuseta

seg-87b2b2459b45 = Start ja tõus parkimisorbiidile GNSS-i hõivamise ja signaali kadumisega (<c1/>)

seg-725e7ce83533 = Faas <c1/>: konstantse kiirusega asendi ja kiiruse kovariatsioon valge kiirendusmüraga (inertsiaalse edasiliikumise klass), öeldud täpsusega GNSS-fikseering, mida rakendatakse pärast hõivamisaega ja väljaspool öeldud signaali kadumisi, samade fikseeringutega distsiplineeritud nihke-ja-triivi kell ning parkimisorbiidile sisenemise olek

seg-22e5c301626e = Riccati püsiseisund ja prognoosi käsitsiarvutus testides. Siin ei modelleerita kanderaketti ega vastuvõtjat; iga arv on öeldud sisend

seg-eb66a49b0306 = Suhteline navigatsioon dokkimisümbriseni madalal Maa orbiidil anduriosade kaupa (<c1/>)

seg-658a0448d80d = Faas <c1/>: suhteline olek sihtmärgi LVLH telgedes suletud kujul Clohessy-Wiltshire'i siirdega, 6x6 Kalmani kovariatsioon valge kiirendusmüraga ja asendiuuendused, mille dispersioon on anduri oma praegusel kaugusel, öeldud anduri osade kaupa (ILLUSTRATIVE optilise kaamera, lidari ja raadiokauguse mõõtmise vormid); dokkimisaken on aeg, millest alates suhteline sigma püsib püüdeümbrises, kuni faasi lõpuni. Jälitaja absoluutne kovariatsioon antakse edasi muutmata ja rida ütleb seda.

seg-97f4aa0575e6 = Ühe telje käsitsiarvutus ennustusele ja uuendusele testis; Clohessy-Wiltshire'i siire on see, mida cw_dynamics kontrollib sõltumatu numbrilise integreerimise vastu. Andurid on ILLUSTRATIVE ja ühtegi päris kohtumist ei võrrelda

seg-b45a8a357faf = Kuule suunav üleminek ja tsislunaarne lend: levitatud keskmine olek ja kovariatsioon jälgimisuuendustega (<c1/>)

seg-ab5c79789754 = Faas <c1/>: keskmine olek mootori Cowelli levitajaga (Maa punktmass ja J2, Päike ja Kuu kolmanda kehana, Kuu lõimest DE440 kernelist seal, kus see lõiku katab, ja Päike analüütilisest reast); kovariatsioon selle levitamise ettapärase diferentsiga olekusiirdemaatriksist (nominaalne käivitus ja kuus häiritud käivitust lõigu kohta) valge kiirendusmüraga; TLI põlemise suuruse ja suuna viga; <c2/> fikseeringud, mille kättesaadavus ja PDOP tulevad kosmoseteenuse ala pühkimisest piki kaart asendavat oskuleerivat orbiiti; kauguse ja kauguskiiruse jälgimine geotsentrilise suuna suunas, skaleeritud maajaamade võrgu töötsükliga, Joseph-vormi uuendusega

seg-86dae517e339 = Liouville'i teoreem (konservatiivse osa olekusiirdemaatriksi determinant on üks) ja peenem diferents testides; keskmist olekut võrreldakse avaliku trajektooriga allolevas reas, mida see ei täida. Põlemisviga, uuendusi ja kovariatsiooni ei võrrelda millegagi

seg-7a3eb4fae324 = Sisenemisliidese kovariatsioon, koridoritõenäosus, tipp-aeglustus ja maandumisjalajälg (<c1/>)

seg-93f07906d7bf = Faas <c1/>: faasi <c2/> tagasipöörduv liuglus ilma põlemiseta, lõpeb sisenemisliidesega; lennutrajektoori nurk ja selle sigma täielikust kovariatsioonist lõplike diferentside gradiendiga; tõenäosus, et nurk on öeldud koridoris; tipp-aeglustus nominaalse nurga juures ja mõlemal koridoriservas mootori tasapinnalisest ballistilisest punktmassi sisenemisest (väljapõrge tuvastatud) Allen-Eggersi suletud kuju kõrval; maandumisjalajälg öeldud allasuunalise tundlikkuse ja orbiiditasandit läbiva liidesekovariatsiooni põhjal. Tõstejõudu, juhtimist ega kuumenemist ei modelleerita

seg-8d5695aad35b = Käsitsiarvutused testides (nurga sigma on ristikiiruse sigma jagatud kiirusega; Gaussi mass koridoris). Tasapinnaline sisenemine on mootori enda ja Allen-Eggersi kuju on suletud kujuga võrdlus; lennanud sisenemist ei võrrelda

seg-3f0951532f6e = Maajaamade võrgu katvus ja jälgimise töötsükkel faasi jaoks (<c1/> liigis <c2/>)

seg-5204af351299 = Maajaamade võrgu pealis: jaamad minimaalse tõusunurgaga, sõiduki nähtavus öeldud geomeetrial (sisenemisolek lennatud kahe keha mudelis koos J2-ga, Kuu asend lennu jaoks või öeldud töötsükkel), jaamavahetused, mis kaotavad igaüks öeldud aja, ja saadud töötsükkel antakse edasi faasi maajälgimise uuendussagedusele; pikim ajavahemik, mil ühtki jaama pole näha, on eelarverida

seg-0d1d229a3ab7 = Zeniidi ja antipoodi geomeetriakontrollid ning kauge sihtmärgi eeldatav nähtavus testides. Päris võrku, antenni ega ajakava ei modelleerita

seg-4ba700726208 = Suhteline navigatsioon dokkimiseni Kuu orbiidil (<c1/>)

seg-2e30e78e49f7 = Liik ja faas <c1/>: ühine kahe sõiduki partii Gauss-Newtoni hinnang kaarel (kakskümmend üks parameetrit: mõlemad olekud ja püsivad signaali kosmoses asendinihked, ühised ja sõltumatud), kasvatatud veerandi, poole ja kogu kaare peale sammu poolitamisega, ühest absoluutsest fikseeringust sõiduki kohta (AFS pilootkoodi jälgimise tõke, ILLUSTRATIVE releekomplekt) ja ristlingi kaugusest, teegi Kuu jõumudeli all; keskmine normaliseeritud hindamisvea ruut, Clohessy-Wiltshire'i kontroll ringorbiidil ja edasi antud 6x6 kovariatsioon

seg-09fa0c35d004 = Isekooskõla eelregistreeringu all (xval/mission-thread-lunar/PREREGISTRATION.md, tulemused ja hindaja ajalugu failis RESULTS.md): suhtelise oleku keskmine NEES on { "5.85" } kuni { "5.93" } vahemiku { "5.2" } kuni { "6.8" } vastu neljas konfiguratsioonis, MET neljanda hindajakujunduse puhul pärast seda, kui kolm järjestikfiltri kujundust jäid lävest mööda; tõeandmed ja hindaja jagavad üht jõumudelit, seega see ei ütle midagi mudelivea kohta. Levitajat, mida see jagab, võrreldakse LRO ja CAPSTONE'iga allolevas reas

seg-c85d7e5e63a3 = Maandumishajuvuse eelarve Kuu polaaralal (<c1/>)

seg-bd88ab3ad105 = Liik ja faas <c1/>: viieolekuline telgede kaupa inertsiaalne veamudel (asend, kiirus, kiirendusmõõtja nihe, kalle, güroskoobi nihe) mootoriga laskumisel, mida toetavad AFS fikseeringud (eraldiseisvad või diferentsiaalsed, kella toetatud kolme releega juhtumiga), maastikusuhteline fikseering (mootori terrain-nav sobitaja sünteetilisel reljeefil või Cramer-Rao tõke LOLA DEM-il avaprobleemi reegliga) ja Kuu aeg, koos Monte Carlo puudutuselliipsiga

seg-a5ddb83a5cf1 = Suletud kujuga inertsiaalne triiv, taaskasutatud liikide enda tulemused ja 3-sigma ellipsi kalibreerimine (sisemine osa on kooskõlas oma ootusega) testides. Lennatud ega testitud maandumist ei võrrelda

seg-8dfc1600cf8c = Pinnapositsioneerimise ja -ajastuse kättesaadavus asukoha ja aastaaja järgi Kuu poolustel (<c1/>)

seg-f91c1da9ab55 = Liik ja faas <c1/>: releede kättesaadavus ja PDOP, Maa ja Päikese nähtavus ning distsiplineeritud pinnakell iga asukoha ja aastaaja kohta, koos liigi <c2/> maastikusiluetiga; ühe asukoha käivitus võrdub selle liigi kättesaadavuse ja PDOP-iga bitipealt

seg-e3a782dce8be = Täpne võrdsus olemasoleva liigiga ühe asukoha jaoks ja monotoonsuskontrollid testides. Releekomplekt on ILLUSTRATIVE ja ühtki pinnamõõtmist ei võrrelda

seg-0db91d70a079 = Mootoriga tõus Kuu polaaralalt sisenemisorbiidile (<c1/>)

seg-b5b1125d515c = Liik ja faas <c1/>: viieolekuline telgede kaupa inertsiaalne veamudel mootoriga tõusul, kus erijõud on piki rada, mida toetavad AFS fikseeringud ja Kuu aeg, esitades orbiidile kantud sisenemise asendi ja kiiruse kovariatsiooni ning mootori väljalülituse hajuvuse (esitatud, mitte edasi kantud)

seg-76e0d23b7483 = Suletud kujuga inertsiaalne triiv ja monotoonsuskontrollid testides. Lennatud tõusu ei võrrelda

seg-1983ce9cc6da = Kuu jõumudeli levitamine avalike rekonstrueeritud Kuu orbiitide ja tsislunaarsete trajektooride vastu

seg-57f53a7d1fa2 = Kuu liikide jagatud levitaja (GRAIL GL0660B järk ja aste { "150" }, Maa ja Päikese kolmandad kehad, relatiivsus, DE440 Kuu orientatsioon) võrreldud LRO ({ "24" } h, { "10" } minuti valimid) ja CAPSTONE'i (üks { "6.5" } päeva tiir, tunnivalimid) avalike JPL Horizonsi trajektooridega, lävede all, mis on enne käivitust kinnitatud salvestatud failis

seg-321d0721970d = JPL Horizonsi kosmoseaparaatide efemeriidid LRO ja CAPSTONE'i jaoks, eelregistreeritud lävede vastu failis xval/mission-thread-lunar/PREREGISTRATION.md (muudatused { "1" } kuni { "6" }). LRO: MET, { "33" } m suurim 3D-erinevus ja { "2.4" } m RMS radiaalne võrreldes { "500" } m ja { "60" } m. CAPSTONE: NOT MET, { "136.8" } km lõppasendi erinevus võrreldes { "25" } km ja { "28.4" } km periapsise erinevus võrreldes { "10" } km, põhjuseid ei eraldatud. Rida on modelleeritud, sest CAPSTONE'i lävi jäi täitmata ja võrdlus testib jagatud levitajat, mitte ühtki filtrit, signaali ega eelarvet

seg-c557d317389a = Tsislunaarse keskmise oleku levitamine avaliku Artemis I trajektoori vastu (<c1/>)

seg-539d4c3e9b56 = Faasi <c1/> keskmise oleku levitamine (Cowell, Maa punktmass ja J2, Päike ja Kuu kolmandate kehadena, Kuu DE440 lõigust) võrreldud Artemis I avaliku JPL Horizonsi trajektooriga { "72" } h liuglusel alates 2022-11-16 { "18" }:{ "00" } TDB, { "12" } tunni epohhidel, lävede all, mis on enne käivitust kinnitatud salvestatud failis

seg-362b1a7b9e5e = JPL Horizonsi sihtmärk -1023 (NASA navigatsiooni lennatud trajektoor pärast TLI-d), eelregistreeritud lävede vastu failis xval/mission-thread/PREREGISTRATION.md (muudatus { "1" } muudab ainult päringu vahemikku). NOT MET ja väidetud kui täitmata: { "45.3" } km suurim asendierinevus võrreldes { "5" } km ja { "0.249" } m/s kiiruse erinevus { "72" } h juures võrreldes { "0.05" } m/s. Pärast otsust kirjutatud diagnostika paigutab möödalaske etalonis viide impulsiivsesse kiirussammu suurusega { "0.09" } kuni { "0.22" } m/s (eelregistreeritud lugemine, et aken ei sisaldanud põlemist, oli vale); ülejäänud { "67" } tunni jooksul taastab mudel järgmise tunnioleku mediaanil { "0.38" } m. Testib ainult ühe liuglusaarkaare keskmist olekut: ei kovariatsiooni, filtrit, uuendust ega muud faasi

seg-150ae9c3d755 = Häirete allika piirkond: teostatav kiirgusallika piirkond õhusõidukite ja laevade positsiooniteadetest

seg-b5c49044a7a1 = Teostatav piirkond, kus võib asuda halvenenud navigatsiooniteadete allikas, ADS-B (NIC/NACp) või AIS positsiooniteadetest: raadionähtavus 4/3 Maa raadiusel teate kõrgusest ja kiirgusallika antenni kõrgusvahemikust, piiratud efektiivne ulatus tundmatu võimsuse jaoks, mõjutatud üksused tõmbavad posterioori oma ulatuse suunas ja mõjutamata nähtavusega üksused suruvad sellele vastu, rühmitatud sessioonideks ajas ja ruumis. Väljund on suurima tihedusega piirkonnad öeldud usaldusnivoodel, posterioori tsentroid momentellipsiga, sessiooni algus, lõpp, kestus, mõjutatud ala ja eristatavate õhusõidukite arv üle avaldamise miinimumi, ööpäevaprofiil ja tunnid päevas. Maastikuvaba; üks allikas sessiooni kohta; usaldusväärsus sõltub mudelist. Valikuline liitmine geolokatsiooni TDOA fikseeringuga.

seg-953a8b4f9f41 = Veel ühtki välist. Ainult sünteetilised ettepoole-tagasi ringid generaatorist, mis jagab hindaja mudelit, seega need kontrollivad koodi ja öeldud tasemete kalibreeringut selle mudeli all ega ütle midagi päris kiirgusallikate kohta. Välist kontrolli avaldatud Jammertest { "2025" } saatjakohtade vastu eelregistreeriti (docs/emitter-region/PREREGISTRATION.md, omaniku poolt enne ühtki hinnatud käivitust kinnitatud) ja käivitati üks kord (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } planeeritud sessiooni, vähem kui registreeritud miinimum { "4" }) ja AIS NOT ASSESSABLE (avaldatud sessiooni pole), seega ühtki lävi ei testitud ja rida jääb MODELLED

seg-d5a79853b72f = { "93" } liiki { "93" }-st, { "3334" } arvulist välja { "3334" }-st

seg-5576293ba3aa = { "61" } võimekuskaarti failist <c1/>, seejärel kõik { "405" } kontrollimaatriksi rida.
