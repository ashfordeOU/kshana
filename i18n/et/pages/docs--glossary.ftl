# docs--glossary: translations (et)

# attr:aria-label, text
seg-daf25c6479c1 = Standardid

# attr:title, text
seg-c851aa23ea42 = komadega eraldatud väärtused

# text
seg-366c59b03b4f = CSV

# text
seg-cb273d6705c6 = SVG

# text
seg-49a994d77d2f = temperatuurikompenseeritud kristallostsillaator

# text
seg-1bac97ee312a = rubiidiumi aatomsageduse etalon

# text
seg-b09ffb8a9095 = Monte Carlo

# text
seg-9939da5da283 = JSON

# text
seg-5907283b71da = Lühend

# text
seg-900c7c7e99cd = GMAT

# text
seg-c730f9c69d6e = ISB

# text
seg-ef9ba270513c = süsteemidevaheline nihe

# text
seg-7dabf60fd17e = QPN

# text
seg-dae80c23262e = kvantprojektsioonimüra

# text
seg-430b3c681347 = RTKLIB

# text
seg-051a168f774c = TCXO

# text
seg-ba5d469b1c66 = VLBI

# text
seg-e464509f3abb = kandelaine ja müratiheduse suhe

# text
seg-68ff97cfdc03 = DOI

# text
seg-fa299d3dcaad = digitaalne objektitunnus

# text
seg-d41af8f18aed = GLONASS

# text
seg-1df73b95ae4d = IAU

# text
seg-e78cf68c3f5e = ICRF

# text
seg-f094d5944111 = International Celestial Reference Frame (rahvusvaheline taevane tugisüsteem)

# text
seg-70fd83c6e862 = ISS

# text
seg-cc73228e1f0e = Rahvusvaheline Kosmosejaam

# text
seg-865e7d1794b6 = Secure Hash Algorithm, 256-bitine

# text
seg-8104773e1484 = STK

# text
seg-ad20a7bebf23 = STL

# text
seg-e2dbcb4bc5f5 = Satellite Time and Location

# text
seg-71aee5eb55c5 = UHF

# text
seg-65e797f8bb42 = ülikõrgsagedus

# text
# c1: docs/GLOSSARY.md
seg-6ce4c2164aee = Allikas: <c1/>

# text
seg-bee5d056ef03 = Kshanas kasutatud terminite lihtkeelsed määratlused. Iga kirje algab ühe reaga „lihtsalt öeldes“ ja lisab seejärel täpse tähenduse seal, kus see aitab. Lühendid, mida jaotises ei määratleta, on A-st Z-ni tabelis lõpu lähedal, <a1>Kõik muud lühendid, A-st Z-ni</a1>.

# text
seg-f8c5433d1026 = Navigatsioon ja ajastus

# text
seg-2a42d84608ea = <b>PNT — positsioneerimine, navigatsioon ja aeg (Positioning, Navigation, and Timing).</b> Teadmine, <em>kus</em> te olete, <em>mis suunas</em> liigute ja <em>mis kell on</em> — täpselt. Kaasaegne PNT tuleb enamasti satelliidisignaalidest (GNSS, ülemaailmsed satelliitnavigatsioonisüsteemid, mida määratletakse järgmisena); Kshana uurib, mis juhtub <em>ajaga</em> ja <em>asukohaga</em>, kui need signaalid kaovad.

# text
seg-6227db2c94e1 = <b>GNSS — ülemaailmne satelliitnavigatsioonisüsteem (Global Navigation Satellite System).</b> Satelliidikonstellatsioonid, mis annavad PNT-d: GPS (Global Positioning System, USA (Ameerika Ühendriigid)), Galileo (EL), GLONASS (Venemaa ülemaailmne satelliitnavigatsioonisüsteem), BeiDou (Hiina). Vastuvõtja, mis näeb ≥ { "4" } satelliiti, saab arvutada täieliku 3D asukoha ja aja fikseeringu.

# text
seg-f8eda357e640 = <b>GNSS-i katkestus / keelatud / halvenenud / segatud.</b> Kui satelliidisignaalid pole kättesaadavad (blokeeritud, segatud või vaatlusalast väljas). Katkestuse ajal peab süsteem „libisema“ oma pardaandurite abil. Kshana kogu eesmärk on mõõta, kui hästi see libiseb.

# text
seg-a3ade199f465 = <b>Holdover.</b> Lihtsalt öeldes: <em>kui kaua kell suudab pärast GNSS-i kaotamist ise õiget aega hoida.</em> Parem kell hoiab kauem, enne kui selle viga ületab lubatud piiri.

# text
seg-83b33c15312f = <b>Dead-reckoning.</b> Lihtsalt öeldes: <em>oma asukoha hindamine mõõdetud liikumise liitmise teel, ilma välise etalonita.</em> Vead kuhjuvad, seega triivib parem inertsiaalandur aeglasemalt.

# text
seg-da9bcc994b9c = <b>Spetsifikatsioon / lävi.</b> Maksimaalne viga, mis on lubatud, enne kui lahendus loetakse „spetsifikatsioonist väljas“ olevaks — nt „ajastus peab püsima { "20" } ns piires“ või „asukoht { "100" } m piires“.

# text
seg-6f37a60a30c7 = Andurid, mida Kshana võrdleb

# text
seg-308b59d89586 = <b>Kell (aatomkell).</b> Seade, mis hoiab aega, lugedes aatomi loomulikku võnkumist. Siin kaks näidet:

# text
seg-3389d08be6bc = <b>CSAC — kiibimõõtmetega aatomkell (Chip-Scale Atomic Clock).</b> Väike, kasutusel olev kommertskell („klassikaline“ etalon). Hea, kuid triivib pika katkestuse jooksul märgatavalt.

# text
seg-3e121d8e6400 = <b>Optiline võrekell (nt strontsium).</b> Palju stabiilsem „kvant“kell; laborite tipptase, mida pole veel kosmoses lennutatud.

# text
seg-4daa6cdf8ae2 = <b>Kiirendusmõõtur.</b> Mõõdab kiirendust (liikumise muutust). Kaks korda integreerituna annab see asukoha — seega kasvab iga viga kiiresti. <b>Külmaatomi kiirendusmõõtur</b> on kvantversioon palju parema pikaajalise stabiilsusega; <b>navigatsioonitaseme</b> on klassikaline.

# text
seg-91793676c57c = <b>Güroskoop.</b> Mõõdab pöörlemist. Väike pöörlemisviga kallutab platvormi, mis laseb gravitatsiooni horisontaalsuunda lekkida ja rikub asukohahinnangu.

# text
seg-2d36110effc3 = <b>IMU — inertsiaalmõõteseade (Inertial Measurement Unit).</b> Kiirendusmõõturi ja güroskoobi komplekt ise: kolm telge mõlemast, mis raporteerivad erijõudu ja nurkkiirust. See mõõdab liikumist; üksi ei tea see, kus see asub.

# text
seg-e3b6b40e0cd0 = <b>INS — inertsiaalnavigatsioonisüsteem (Inertial Navigation System).</b> IMU pluss „mehhaniseerimine“, mis integreerib selle väljundi asendiks, kiiruseks ja asukohaks. INS on see, mis GNSS-i katkestuse ajal dead-reckoning-ut teeb, ja selle täpsuse määravad allpool loetletud IMU veaprotsessid.

# text
seg-a618ff7ee429 = <b>Aja edastamine.</b> Täpse ajasignaali saatmine kahe koha vahel (nt satelliidilt satelliidile). <b>Optilised</b> lingid on palju täpsemad kui <b>RF</b> (raadiosageduslikud) lingid.

# text
seg-847fbbeecfae = Kuidas vigu modelleeritakse (kella müra)

# text
seg-5cf197bdbbad = Kella viga koosneb standardsetest „mürateadetest“, millest igaühel on teada signatuur:

# text
# c1: q_wf
seg-3806d1b1cb50 = <b>Valge FM (valge sagedusmodulatsioon).</b> Lihtsalt öeldes: <em>kiire, juhuslik värin kella kiiruses.</em> Selle keskmistamine paraneb ajaga. Parameeter <c1/>.

# text
# c1: q_rw
seg-0793fdd3abab = <b>Juhusliku käimise FM.</b> Lihtsalt öeldes: <em>kella kiirus uitab aeglaselt.</em> See domineerib pikki katkestusi. Parameeter <c1/>.

# text
# c1: flicker_floor
seg-42b74c8b88ff = <b>Flicker FM (1/f müra).</b> Lihtsalt öeldes: <em>jäärapäine müratase, millest kell kunagi allapoole keskmistada ei saa.</em> See on keskmistamisaegade üle tasane. Parameeter <c1/>.

# text
# c1: drift
seg-b3bd841a5a2d = <b>Vananemine / triiv.</b> Aeglane, <em>ennustatav</em> kiiruse muutus aja jooksul; kuna see on ennustatav, eemaldab Kshana hindaja selle. Parameeter <c1/>.

# text
# c1: q_va
seg-d929960492e4 = <b>VRW — kiiruse juhuslik käimine (Velocity Random Walk).</b> Kiirendusmõõturi vaste valgele mürale: juhuslikud tõuked kiirusele, mis kuhjuvad asukohaveaks. Parameeter <c1/>.

# text
# c1: q_arw
seg-4a97f8d14174 = <b>ARW — nurga juhuslik käimine (Angular Random Walk).</b> Güroskoobi vaste: juhuslikud tõuked orientatsioonile. Parameeter <c1/>.

# text
seg-dcd03b326110 = Kuidas stabiilsust mõõdetakse

# text
# c1: σ_y(τ)
# c2: τ
# c3: σ_y(1 s) = 3×10⁻¹⁰
seg-2181832c6253 = <b>Alani hälve (<c1/>).</b> Lihtsalt öeldes: <em>standardne viis öelda, kui stabiilne kell on antud keskmistamisaja <c2/> jooksul.</em> Kella andmeleht esitab nt <c3/>. Kshana valideerib oma kellamudelit, arvutades oma väljundi Alani hälbe ja kontrollides, et see ühtib avaldatud arvuga. (Viide: Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

# text
seg-11cbe561e633 = <b>PSD — võimsusspektri tihedus (Power Spectral Density).</b> Kuidas müra võimsus on sageduste vahel jaotunud; ametlik viis valge / juhusliku käimise / flicker-müra täpsustamiseks.

# text
seg-0737d620eb5f = Kvaliteedinäitajad (kuidas käivitust hinnatakse)

# text
seg-20b66e0d4809 = Kuus operatiivset PNT kvaliteedinäitajat, mida Kshana raporteerib (vt README tabelit „Output“):

# text
seg-b17d08246e49 = <b>FoM — kvaliteedinäitaja (Figure of Merit).</b> Üks arv, mis hindab käivituse ühte aspekti ja mida raporteeritakse koos ühiku ning sellega, kas see on valideeritud või modelleeritud. Allolevad kuus on Kshana operatiivsed FoM-id.

# text
seg-b229a69fb4ac = <b>Positsioneerimise / ajastuse toimivus</b> — vea suurus, RMS-ina (ruutkeskmine, ruutkeskmine väärtus) ja 95. protsentiilina.

# text
seg-ba3ed5a28518 = <b>Autonoomsus</b> — holdover-i kestus (kui kaua see püsib spetsifikatsioonis ilma GNSS-ita).

# text
seg-13ecdd037098 = <b>Vastupidavus</b> — kui kiiresti viga kasvab pärast GNSS-i kaotust.

# text
seg-be0168f24d6e = <b>Kättesaadavus</b> — käivituse osa, mille jooksul on spetsifikatsioonis lahendus.

# text
seg-44ef500b371d = <b>Terviklikkus</b> — <em>kas te saate usaldada süsteemi enda hinnangut oma veale?</em> Kshana raporteerib katkestuse valimite osa, mille tegelik viga jääb filtri kaitsepiiri sisse.

# text
seg-d1cc3819cde9 = <b>Turvalisus</b> — vastupidavus spuufimisele: kella stabiilsusel põhinev spuufimise tuvastatavuse skoor (alates { "v0.3.0" }), mõttekas ainult siis, kui spuufimisrünnaku stsenaarium on seadistatud. See <em>ei ole</em> lennunduse klassi terviklikkus: see ei arvuta horisontaalset ega vertikaalset kaitsetaset (HPL/VPL) ega käivita vastuvõtja autonoomset terviklikkuse seiret (RAIM), täiustatud ega muud. Need tulevad eraldi terviklikkuse ja ARAIM-i (täiustatud RAIM) stsenaariumi liikidest ning on määratletud allpool jaotises „Integrity & augmentation“. Ekspordikontrolliga.

# text
seg-5cae59204d9e = Kvaliteedinäitajatega koos kasutatavad terminid:

# text
seg-7adc0e49a981 = <b>Spuufimine.</b> Lihtsalt öeldes: <em>võlts satelliidisignaal, mis valetab asukoha või aja kohta.</em> Spuufija söödab vastuvõtjale usutava, kuid vale vastuse, mis on hullem kui segamine, sest vastuvõtja ei pruugi seda märgata.

# text
seg-2d2e6cbeade6 = <b>1-DOF — üks vabadusaste.</b> Üks telg. Kshana stsenaariumipaketi asukohaviga on ühe-teljeline; täielik 3-D vastus vajab kolmeteljelist mudelit.

# text
seg-14a32d281c4b = <b>Monte Carlo ansambel.</b> Sama stsenaariumi käivitamine mitu korda erinevate juhuslike algväärtustega (seed) ja tulemuste hajuvuse raporteerimine ühe käivituse asemel.

# text
seg-fcbea49a3592 = <b>CI — usaldusvahemik (confidence interval).</b> Vahemik, kuhu statistik eeldatavasti langeb kindlaksmääratud tõenäosusega (näiteks { "95" } %). README tabelites ja märkides tähendab „CI“ sagedamini <b>pidevat integratsiooni (continuous integration)</b> — automaatset ehitus- ja testikäivitust iga muudatuse korral; kontekst ütleb, kumb.

# text
seg-310abfd6a64c = <b>k-sigma piir.</b> Piir, mis on seatud <em>k</em> standardhälbele filtri enda ebakindlusest; terviklikkuse kvaliteedinäitaja loeb, kui sageli jääb tegelik viga selle sisse.

# text
# c1: src/fom.rs
seg-ad26afbaa7b4 = <b>CEP / 2DRMS — ringvea tõenäosusraadius / kahekordne ruutkeskmine kaugus (circular error probable / twice the distance root mean square).</b> Kaks standardset viisi 2-D horisontaalse täpsuse väljendamiseks: CEP on raadius, mis sisaldab { "50" } % fikseeringutest; 2DRMS on kahekordne horisontaalse vea ruutkeskmine. Teek suudab mõlemat arvutada asukoha kovariatsioonist (<c1/>), kuid ükski stsenaariumi liik neid veel ei raporteeri.

# text
seg-fd93c1effba8 = Tulemuse lugemine: väljundi terminid

# text
seg-3432498093cf = Need on nimed, millega kohtute tulemusefailis või mänguväljaku kokkuvõttes, esmalt lihtsalt öeldes.

# text
# c1: holdover_s
seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> Lihtsalt öeldes: <em>mitu sekundit püsis süsteem pärast GNSS-i kaotust oma veapiiri sees.</em> Kshana raporteerib lühima sellise libisemise kõigi käivituse katkestuste hulgas, mõõdetuna käivituse ajavõrgul, seega on see alumine piir ajasammu lahutusel. Holdover, mis võrdub katkestuse pikkusega, tähendab, et piiri ei ületatud kunagi.

# text
# c1: timing_p95_ns
# c2: 0.0
seg-e68708a219f1 = <b>p95 (<c1/>).</b> Lihtsalt öeldes: <em>{ "95" } % ajast oli ajastusviga selle suurune või väiksem.</em> See on vea 95. protsentiil katkestuse jooksul. Väga väike väärtus võib lühikokkuvõttes kuvada kujul <c2/>; tulemuse JSON (JavaScript Object Notation) fail sisaldab täistäpsusega arvu.

# text
# c1: integrity
# c2: INTEGRITY.md
seg-4dfaee63262d = <b>Terviklikkus (<c1/>).</b> Lihtsalt öeldes: <em>kui sageli oli süsteemi enda veahinnang aus.</em> See on katkestuse valimite osa, mille tegelik viga jäi filtri k-sigma piiri sisse (määratletud allpool). Väärtus lähedal arvule { "1" } tähendab, et hindaja ei alahinnanud oma viga. See ei ole lennunduse kaitsetase; vt allpool „Integrity & augmentation“ ja <a1><c2/></a1>.

# text
# c1: security
# c2: P_md
# c3: security n/a (no attack)
# c4: applicable: false
# c5: figure_tiers
seg-5af09f5129e0 = <b>Turvaskoor (<c1/>).</b> Lihtsalt öeldes: <em>kui tõenäoline on, et spuufimisrünnak tabatakse.</em> See on tõenäosus, et seadistatud rünnak tuvastatakse — üks miinus tuvastamata jäänud sündmuse tõenäosus <c2/> — tuletatud kella stabiilsusest. See tähendab midagi ainult siis, kui stsenaarium seadistab spuufimisrünnaku. Kui rünnakut pole seadistatud, prindib üherealine kokkuvõte <c3/> ja tulemus märgib näitaja plokis <c5/> väärtusega <c4/>; väärtus jääb dokumenti ja tähendab „ei kohaldu“, mitte „null turvalisus“.

# text
# c1: pdop_min
seg-70113d509997 = <b>PDOP — asukoha täpsuse halvenemise tegur (position dilution of precision; võtmed nagu <c1/>).</b> Lihtsalt öeldes: <em>kui palju satelliidigeomeetria võimendab kaugusmõõtmise viga asukohaveaks.</em> Asukohaviga on ligikaudu PDOP korrutatud kaugusmõõtmise veaga, seega väiksem on parem. Vt <b>DOP</b> jaotises „Estimation & geometry“.

# text
# c1: σ_y(τ)
# c2: τ
# c3: sigma_y(1 s) = 3e-10
seg-a445bf9a3c5f = <b>sigma_y (<c1/>, Alani hälve).</b> Lihtsalt öeldes: <em>kui palju kella kiirus kõigub, kui seda keskmistada aja <c2/> jooksul.</em> Andmelehe rida nagu <c3/> tähendab, et kiirus, keskmistatuna ühe sekundi jooksul, varieerub umbes { "3" } osa võrra 10¹⁰-st. Väiksem on stabiilsem kell. Vt ülal „Kuidas stabiilsust mõõdetakse“.

# text
# c1: σ_y²(τ) = q_wf / τ
# c2: q_wf = sigma_y(1 s)²
# c3: q_rw
# c4: drift
seg-03b4bb05148d = <b>q_wf — valge sagedusmüra intensiivsus.</b> Lihtsalt öeldes: <em>kiire, juhusliku värina tugevus kella kiiruses.</em> See on valge sagedusmüra koefitsient valemis <c1/>, seega seab stsenaarium väärtuse <c2/> andmelehe ühesekundilisest Alani hälbest. Selle kaaslased on <c3/> (juhusliku käimise sagedusmüra) ja <c4/> (vananemine); vt ülal „Kuidas vigu modelleeritakse“.

# text
seg-074a1337ed99 = Telekommunikatsiooni ajastuse terminid

# text
# c1: telecom-timing
# c2: TELECOM-TIMING.md
seg-9f61398628e4 = Telekommunikatsioonivõrgud jaotavad aega pakettvõrkude kaudu (Precision Time Protocol) GNSS-iga toidetud etalonkellast ning Rahvusvahelise Telekommunikatsiooniliidu telekommunikatsiooni standardimissektor (ITU-T) seab piirid ajaveale, mida iga kell võib lisada. Need terminid esinevad stsenaariumi liigis <c1/>; vt <a1><c2/></a1>.

# text
seg-f48712300b30 = <b>TE — ajaviga (time error).</b> Lihtsalt öeldes: <em>kui kaugel on kella aeg etalonajast ühel ajahetkel.</em> Positiivne või negatiivne, tavaliselt nanosekundites.

# text
seg-ceda70656c6a = <b>max|TE| — maksimaalne absoluutne ajaviga.</b> Lihtsalt öeldes: <em>halvim mõõtmise jooksul nähtud ajaviga, märki ignoreerides.</em> See on peamine piir, mille enamik maske seab.

# text
seg-38d2922cd91d = <b>cTE — konstantne ajaviga (constant time error).</b> Lihtsalt öeldes: <em>ajavea püsiv nihkeosa</em> — keskmine viga, mis mõõtmise jooksul ei muutu.

# text
seg-a4a61df332cd = <b>dTE — dünaamiline ajaviga (dynamic time error).</b> Lihtsalt öeldes: <em>ajavea kõikuv osa</em> — see, mis jääb alles pärast konstantse nihke eemaldamist. Seda hinnatakse MTIE ja TDEV abil.

# text
seg-31c0a85788b1 = <b>MTIE — maksimaalne ajaintervalli viga (maximum time interval error).</b> Lihtsalt öeldes: <em>suurim ajavea kõikumine, mida on nähtud mis tahes antud pikkusega aknas.</em> Iga akna pikkuse jaoks libistab see akent mööda kirjet ja võtab suurima tipust tipuni muutuse; mask annab iga akna pikkuse jaoks suurima lubatud väärtuse.

# text
seg-53fa12cab0c6 = <b>TDEV — ajahälve (time deviation).</b> Lihtsalt öeldes: <em>ajavea tüüpiline (ruutkeskmine) uitamine antud keskmistamisajal,</em> pärast lühiajalise värina keskmistamist. See on Alani hälbe ajadomeeni sugulane ja nagu MTIE, kontrollitakse seda maski vastu.

# text
seg-62b5eea14f6c = <b>PRTC — primaarne etalonaja kell (primary reference time clock).</b> Telekommunikatsiooni ajastusahela tipus olev kell, mida tavaliselt juhib GNSS. Selle toimivuspiirid on ITU-T soovituses G.8272.

# text
seg-8d6d4538981b = <b>ePRTC — täiustatud primaarne etalonaja kell (enhanced primary reference time clock).</b> PRTC rangema ajavea piiriga, mida toetab väga stabiilne kohalik aatomkell, nii et see suudab aega hoida läbi pika GNSS-i kaotuse. ITU-T soovitus G.8272.1.

# text
seg-93fa4ac7c6fa = <b>T-BC — telekommunikatsiooni piirikell (telecom boundary clock).</b> Võrgukell, mis võtab aja ülesvoolust vastu ja annab selle allavoolu edasi, lisades veidi oma ajaviga. ITU-T soovitus G.8273.2.

# text
seg-52d32a5db6b8 = <b>T-TSC — telekommunikatsiooni aja orjakell (telecom time slave clock).</b> Ahela lõpus olev kell, mis võtab aja vastu ja annab selle seadmetele, mis seda vajavad (näiteks raadiobaasjaam). Hõlmab samuti ITU-T soovitus G.8273.2.

# text
seg-04d8ed12ca88 = <b>OCXO — ahjuga juhitav kvartsostsillaator (oven-controlled crystal oscillator).</b> Kvartsostsillaator, mida hoitakse väikeses ahjus konstantsel temperatuuril, mis teeb selle palju stabiilsemaks kui tavaline kvartsostsillaator. Levinud holdover-kell võrguseadmetes; see vananeb (triivib) päevade jooksul märgatavalt.

# text
seg-6742f7ba35ac = <b>CSAC — kiibimõõtmetega aatomkell (chip-scale atomic clock).</b> Väga väike aatomkell (vt ülal „Andurid, mida Kshana võrdleb“). Stabiilsem pikkade holdover-ite korral kui OCXO, kõrgema hinna ja energiakuluga.

# text
seg-c0e0c18bd867 = Tõendustasemed: VALIDATED, MODELLED, PARTNER

# text
# c1: VERIFICATION-MATRIX.md
seg-61c0aa107fd9 = Iga masinkontrollitud kontrollimaatriksi (<a1><c1/></a1>) võimekus kannab ühte kolmest tasemest.

# text
seg-13fb20435df3 = <b>VALIDATED.</b> Lihtsalt öeldes: <em>kontrollitud kellegi teise vastuse vastu.</em> Võimekuse väljundit võrreldi sõltumatu välise oraakliga (sõltumatu etalon) — tegelikud mõõdetud andmed, kellegi teise kirjutatud sõltumatu teek või avaldatud etalonväärtused — ja see nõustus kindlaksmääratud tolerantsi piires. Pideva integratsiooni kontroll lükkab tagasi VALIDATED rea, mis ei nimeta ühtegi välist oraaklit.

# text
# c1: MODELLED-RATIONALE.md
seg-a5dfb48e4dcb = <b>MODELLED.</b> Lihtsalt öeldes: <em>ehitatud usaldusväärsest füüsikast ja kontrollitud sisemise kooskõla suhtes, kuid pole veel võrreldud välise vastusega.</em> Näitajad on mõttekad võrdluseks ja kavandamise kompromissideks; need ei ole tõend, et tegelik seade toimiks nii. <a1><c1/></a1> selgitab, miks iga selline rida on modelleeritud.

# text
seg-0512b2d2145a = <b>PARTNER.</b> Lihtsalt öeldes: <em>see osa kuulub riistvara- või tootekvaliteedi tagamise partnerile ja Kshana ei väida selle kohta midagi.</em> Rida on olemas, et lünk oleks nähtav, mitte vaikiv.

# text
seg-278dee6d3d4c = Spektri ja häire terminid

# text
# c1: spectrum
# c2: SPECTRUM.md
seg-285a240c9958 = Need terminid esinevad stsenaariumi liigis <c1/>; vt <a1><c2/></a1>.

# text
seg-db4fdef1c562 = <b>BPSK(n) — kahendfaasmanipulatsioon sagedusel n × { "1.023" } Mchip/s (binary phase-shift keying).</b> GPS L1 jämeda/leidmise (C/A) ja L2 tsiviilsignaali (L2C) (n = { "1" }) ning GPS L5 ja Galileo E5a (n = { "10" }) ristkülikukujuline kiipmodulatsioon. Selle spekter on sinc², nullidega iga n × { "1.023" } MHz järel.

# text
seg-cdd0f4194f42 = <b>BOC(m, n) — kahendnihkekandja (binary offset carrier).</b> Hajutuskood sagedusel n × { "1.023" } Mchip/s, korrutatud ristlaine alamkandjaga sagedusel m × { "1.023" } MHz, mis jagab spektri kaheks hõlmikuks kandja mõlemal küljel.

# text
seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multipleksitud kahendnihkekandja (multiplexed binary offset carrier).</b> Võimsusspektri tihedus 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), mille suhtes lepiti kokku Galileo E1 avatud teenuse ja GPS L1C jaoks; Galileo edastab selle liit-BOC-ina (CBOC).

# text
seg-7423f94e3018 = <b>CW — pidevlaine (continuous wave).</b> Moduleerimata kandja: üks toon.

# text
seg-55d03dd4af03 = <b>J/S — segaja ja signaali suhe (jammer-to-signal ratio).</b> Vastuvõetud segaja võimsus vastuvõetud signaali võimsuse suhtes detsibellides.

# text
seg-b0f2974647d4 = <b>SSC — spektraalse eraldamise koefitsient (spectral separation coefficient).</b> κ = ∫ G_s(f) G_j(f) df üle vastuvõtja ribas: kui suur osa ühikvõimsusega häirija spektrist langeb sinna, kuhu signaali oma. Efektiivne kandja ja müra tiheduse suhe on [1/(C/N₀) + (J/S)·κ]⁻¹.

# text
seg-c5affeee5269 = <b>Müranäitaja.</b> Kui palju vastuvõtja soojusmürale lisab, suhtena F detsibellides; süsteemi müratemperatuur on T_ant + { "290" } K × (F − { "1" }).

# text
seg-5307c38d3036 = <b>Juga (waterfall).</b> Spektri aeg-sageduspilt: sagedus põikisuunas, aeg allapoole, värv võimsuse jaoks.

# text
seg-3b1ac094fdc5 = <b>Welchi hinnang.</b> Võimsusspektri tihedus, mida hinnatakse akendatud kattuvate periodogrammide keskmistamisega (Welch { "1967" }).

# text
# c1: .sigmf-meta
# c2: .sigmf-data
# c3: cf32_le
# c4: ci16_le
# c5: ci8
seg-9901d64fb895 = <b>SigMF — signaali metaandmete vorming (Signal Metadata Format).</b> Avatud salvestusvorming: JSON-fail <c1/>, mis kirjeldab valimite toorfaili <c2/> (siin kompleksne <c3/>, <c4/> või <c5/>).

# text
seg-83041671f422 = <b>IQ — samafaasne ja kvadratuurne (in-phase and quadrature).</b> Kompleksse baasribavalimi kaks komponenti.

# text
seg-39e6ea8506b3 = LEO-PNT signaali terminid

# text
# c1: leo-signal
# c2: spectrum
# c3: LEO-SIGNAL.md
seg-36452ee3f5cc = Need terminid esinevad stsenaariumi liigis <c1/> ja mitmeribalistes <c2/> stsenaariumides; vt <a1><c3/></a1>.

# text
seg-8363a15f3c5a = <b>LEO-PNT — madala Maa orbiidi positsioneerimine, navigatsioon ja aeg.</b> Navigatsioonisignaalid, mida edastatakse mõnesajast kuni umbes { "1200" } km kõrguselt satelliitidelt: tugevamad ja kiiremini liikuvad kui GNSS keskmiselt Maa orbiidilt.

# text
seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — raadionavigatsiooni satelliitteenus (Radio Navigation Satellite Service), raadiopositsioneerimise satelliitteenus (Radio Determination Satellite Service), mobiilne satelliitteenus (Mobile Satellite Service), Maa kaugseire satelliitteenus (Earth Exploration-Satellite Service).</b> ITU (Rahvusvaheline Telekommunikatsiooniliit) teenuste jaotused, kuhu sagedusriba võib kuuluda.

# text
seg-d1e494623341 = <b>Pilootkomponent, andmekomponent ja omandamiskomponent.</b> Ühe signaali osad: andmeteta pilootkomponent kaugusmõõtmiseks, andmekomponent, mis kannab navigatsioonisõnumit, ning lühike madala andmekiirusega omandamiskomponent, mida on lihtne leida.

# text
seg-cce232b7cd6a = <b>FDMA — sagedusjaotusega hulgipöördus (frequency-division multiple access).</b> Komponendid või satelliidid, mis on eraldatud kandesageduse, mitte koodi alusel.

# text
seg-9d9476ee62b1 = <b>Gabori (RMS) ribalaius.</b> β = √(∫ f² G df / ∫ G df) üle vastuvõtja riba: signaali võimsuse hajuvus sageduses, mis määrab, kui täpselt see kaugust mõõta saab.

# text
seg-6febe9c2e506 = <b>DLL — viivituse lukustussilmus (delay lock loop).</b> Koodi jälgimissilmus; selle varajase-hilise korrelaatori vahe ja müraribalaius määravad termilise müra kaugusmõõtmise värina.

# text
seg-5a55da97daf9 = <b>EFQPSK — täiustatud Feheri kvadratuurfaasmanipulatsioon (enhanced Feher quadrature phase-shift keying).</b> Konstantse mähisega modulatsioon (Xona Pulsar); siin lähendatud ristkülikukujulise kiibi spektriga.

# text
seg-6dcbf1de9904 = <b>OFDM — ortogonaalne sagedusjaotusega multipleksimine (orthogonal frequency-division multiplexing).</b> Mitmekandjaline lainekuju (Starlinki allalink); siin joonistatud tasase ribana.

# text
seg-548b285c7c8e = <b>TEC — elektronide koguhulk (total electron content).</b> Elektrone ruutmeetri kohta mööda teekonda; { "1" } TECU = 10¹⁶ el/m². Esimese järgu ionosfääriviivitus on { "40.3" }·TEC/f² meetrit.

# text
seg-dd7e0743f364 = <b>EIRP — ekvivalentne isotroopne kiirgusvõimsus (effective isotropic radiated power).</b> Saatevõimsus korrutatud antenni võimendusega vastuvõtja suunas.

# text
seg-aba3b3eaba85 = Integrity & augmentation

# text
seg-eab1b2c6728e = Terviklikkus on <em>usalduse</em> küsimus: mitte „kui suur on minu viga?“, vaid „kas ma saan seda piirata ja kas mulle öeldakse, kui piir on ületatud?“ Need on selle lennunduse terminid.

# text
# c1: src/raim.rs
seg-696a73449c49 = <b>RAIM — vastuvõtja autonoomne terviklikkuse seire (Receiver Autonomous Integrity Monitoring).</b> Lihtsalt öeldes: <em>vastuvõtja kontrollib satelliite üksteise vastu.</em> Kui satelliite on rohkem kui neli, mida fikseering vajab, peaksid ülejäägid (jäägid) olema väikesed; suur jääk tähendab, et üks satelliit valetab, ning vastuvõtja saab seda öelda ilma maapealse abita. Realiseeritud failis <a1><c1/></a1>.

# text
# c1: ARAIM_REFERENCE.md
seg-89237433f01a = <b>ARAIM — täiustatud vastuvõtja autonoomne terviklikkuse seire (Advanced Receiver Autonomous Integrity Monitoring).</b> RAIM-i kaasaegne kahesageduslik mitme konstellatsiooni vorm. Sellele antakse terviklikkuse tugisõnum, mis ütleb iga satelliidi eeldatava vea ja rikketõenäosuse, ning see tagastab kaitsetasemed, mitte läbimise/mittelabimise lipu. Täielik käsitlus, koos kõigi eeldustega, failis <a1><c1/></a1>.

# text
# c1: leo-navmsg
seg-4cc13de05193 = <b>SISRE — signaali ruumis kaugusviga (Signal-in-Space Range Error).</b> Lihtsalt öeldes: <em>kui palju satelliidi edastatav orbiit ja kell muudavad tüüpilise kasutaja mõõdetud kaugust.</em> Orbiidiviga jagatakse radiaal-, piki- ja ristsuunalisteks osadeks ning kaalutakse selle järgi, kui palju iga neist keskmisel vaatejoonel esile tuleb, seejärel kombineeritakse kellaveaga (Montenbruck et al. { "2018" }). Madala Maa orbiidi satelliidi puhul kaaluvad piki- ja ristsuunalised osad palju rohkem kui GPS-i puhul, sest kasutajad näevad seda nadiirist kaugelt. Kasutab liik <c1/>.

# text
# c1: leo-navmsg
# c2: kepler-rac
seg-847e40a033e1 = <b>RAC — radiaal-, piki- ja ristsuund (Radial, Along-track, Cross-track).</b> Kolm suunda, millesse orbiidiviga lahutatakse: Maa keskpunktist väljapoole, lennusuunas ja orbiiditasandiga risti. Stsenaariumi liigi <c1/> mudel <c2/> lisab igaühele parandusepolünoomi.

# text
seg-b725d23c839e = <b>SVID — kosmoseaparaadi identifikaator (Space-Vehicle Identifier).</b> Number, millega navigatsioonisõnum nimetab satelliiti, mis selle saatis.

# text
seg-b0f850eb04b1 = <b>IOD — andmeväljaanne (Issue of Data).</b> Loendur, mis muutub alati, kui satelliidi navigatsioonisõnumi sisu muutub, nii et vastuvõtja suudab uut sõnumit kordusest eristada. (Mitte segi ajada orbiidil demonstreerimisega, mida samuti lühendatakse IOD, nagu ESA Celeste IOD-is.)

# text
seg-985a5e9c9ce9 = <b>TOW — nädala aeg (Time of Week).</b> Sekundid praeguse GNSS-i nädala algusest (pühapäev { "00" }:{ "00" }).

# text
# c1: 0x1864CFB
seg-1fc62dca46d6 = <b>CRC-24Q — 24-bitine tsükliline koondkontroll (Qualcommi polünoom).</b> Veatuvastuskontroll, mida kannavad RTCM { "10403" } ja Galileo sõnumid: sõnumibittide 24-bitine jääk, jagatuna polünoomiga <c1/>. Vastuvõtja arvutab selle uuesti ja loobub sõnumist, mis ei ühti.

# text
# c1: sigma_ure_m
# c2: src/raim.rs
seg-abb4679dab23 = <b>URE — kasutaja kaugusviga (User Range Error).</b> Lihtsalt öeldes: <em>kui palju satelliidi enda edastatav orbiit ja kell muudavad iga kauguse selleni valeks.</em> Seda nimetatakse ka signaali ruumis veaks (SISE); see on satelliidi kohta käiv veaeelarve, mida ARAIM ja RAIM saavad (<c1/> failis <a1><c2/></a1>).

# text
seg-158c210fd3fe = <b>MHSS — mitme hüpoteesi lahenduse eraldamine (Multiple Hypothesis Solution Separation).</b> Meetod, mida ARAIM kasutab. Iga viisi kohta, kuidas konstellatsioon võib rikkis olla, moodustab see lahenduse, mis välistab kahtlusalused satelliidid, ning piirab, kui kaugel see alamlahendus võib olla kõigi nähtavate satelliitide lahendusest.

# text
seg-671711003a6f = <b>HPL / VPL — horisontaalne / vertikaalne kaitsetase (Horizontal / Vertical Protection Level).</b> Lihtsalt öeldes: <em>raadius, mille sees süsteem lubab tegeliku vea olevat kindlaksmääratud terviklikkusriskil.</em> See on piir, mille algoritm arvutab, mitte mõõdetud viga. Käivitus on kättesaadav, kui kaitsetase jääb alla häirepiiri, mida operatsioon lubab (VAL, vertikaalne häirepiir; HAL, horisontaalne).

# text
# c1: src/sbas.rs
seg-5bbd2d664862 = <b>SBAS — satelliidipõhine täiendussüsteem (Satellite-Based Augmentation System).</b> Maapealne võrk, mis jälgib GNSS-i, arvutab paranduste ja terviklikkuse piirid ning edastab need geostatsionaarsetelt satelliitidelt. <b>WAAS — Wide Area Augmentation System</b> on USA oma; EGNOS (European Geostationary Navigation Overlay Service) on Euroopa vaste. Kshana arvutab kaitsetasemed DO-229E kaalutud vähimruutude kujul (DO-229E on RTCA minimaalne tööstandard SBAS-i vastuvõtjatele; RTCA oli varem Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

# text
seg-ba8b448582af = Estimation & geometry

# text
seg-2eb6e72496b8 = <b>Hindaja.</b> Algoritm, mis ennustab katkestuse ajal tegelikku asukohta/aega anduri mudeli põhjal. Kshanal on analüütiline holdover-i ennustaja ja <b>Kalmani filter</b>.

# text
seg-9b4aa612c5a9 = <b>Kalmani filter.</b> Lihtsalt öeldes: <em>algoritm, mis jälgib suurust ja jälgib ka seda, kui ebakindel see on.</em> Kshana kasutab selle ebakindluse piiri terviklikkuse arvutamiseks.

# text
seg-8fda81dfccc9 = <b>EKF — laiendatud Kalmani filter (Extended Kalman Filter).</b> Kalmani filter mittelineaarse ülesande jaoks: see lineariseerib mudeli iga sammu juures praeguse hinnangu ümber. Standardvalik GNSS-i sidumiseks INS-iga.

# text
seg-9bc2c6f74b29 = <b>unscented Kalmani filter (UKF).</b> Sama töö ilma lineariseerimata: see suunab väikese hulga deterministlikult valitud valimipunkte läbi tegeliku mittelineaarse mudeli ja ehitab keskmise ning kovariatsiooni uuesti sellest, kuhu need jõuavad. Käitub paremini, kui mittelineaarsus on tugev, mistõttu orbiidi määramine seda kasutab.

# text
seg-a1e52820e3a0 = <b>DOP — täpsuse halvenemise tegur (Dilution Of Precision).</b> Lihtsalt öeldes: <em>kui palju satelliitide geomeetria võimendab kaugusmõõtmise viga asukoha- või ajaveaks.</em> Asukohaviga ≈ PDOP × kaugusmõõtmise viga, seega madal arv on hea geomeetria. Pere: <b>GDOP</b> (geomeetriline — asukoht ja aeg koos), <b>PDOP</b> (asukoht), <b>HDOP</b> (horisontaalne), <b>VDOP</b> (vertikaalne), <b>TDOP</b> (aeg).

# text
seg-e769a91a3e4b = <b>Walkeri konstellatsioon.</b> Standardne viis kirjeldada satelliidikonstellatsiooni orbiiditasandite arvu ja satelliitide arvu kaudu tasandil (GPS on umbes 24/6 Walkeri kest).

# text
seg-b557933a4e4d = <b>Kõrgusnurga mask.</b> Minimaalne nurk kohaliku horisondi kohal, mille puhul satelliiti peetakse kasutatavaks; liiga madalad signaalid välistatakse.

# text
seg-3ac8e11c3e33 = <b>Varjutus (occultation).</b> Kui Maa blokeerib füüsiliselt vaatejoone satelliidini.

# text
# c1: max(elevation mask, skyline)
# c2: SKYLINE.md
seg-249bf472cb00 = <b>Silmapiirijoon (skyline mask).</b> Lihtsalt öeldes: <em>hoonete, kraanade või künkate piirjoon taeva taustal, kõrgusnurgana iga asimuudi kohta.</em> Satelliiti loetakse nähtavaks ainult üle <c1/> selle asimuudil ning satelliiti, mis on maski kohal, kuid silmapiirijoone taga, nimetatakse „silmapiirijoone poolt varjatuks“. Kshana ehitab selle tabelist, tänavakanjonist, sektoritest ja maastikust (nende punktiviisiline maksimum) või REPRESENTATIVE eelseadistusest; ainult vaatejoon, ilma peegelduse või difraktsioonita (<a1><c2/></a1>).

# text
# c1: SKYLINE.md
seg-620a88820a2d = <b>Taevageomeetria.</b> Millised satelliidid koht silmapiirijoone all näeb ja mida see lahendusele teeb: DOP-tegurid, vähimruutude fikseeringu ida-põhja-üles kovariatsioon ja selle <b>veaellips</b>, horisontaalne piirkond, mis sisaldab fikseeringute kindlaksmääratud osa (vaikimisi { "95" } %) sõltumatute, võrdsete Gaussi kaugusvigade korral. MODELLED geomeetria kindlaksmääratud veamudeli all, mitte vastuvõtja tegelik viga (<a1><c1/></a1>).

# text
# c1: src/integrity/mod.rs
seg-f0e610122425 = <b>CTI — komponeeritud ajastuse terminviklikkus (Composed Timing Integrity).</b> Kaitsetasemed <em>ajale</em>, mitte asukohale, arvutatud üleminekul erinevate ajaallikate vahel — näiteks satelliidiga kontrollitud (RAIM-kättesaadavalt) kellalt vabalt töötavale kellale holdover-is —, nii et piir jääb üleminekul kehtima (<a1><c1/></a1>).

# text
# c1: src/benchmark/mod.rs
seg-56642f614c3f = <b>TIB — ajastuse terviklikkuse etalonkatse (Timing Integrity Benchmark).</b> Mõõdupuu <em>teiste inimeste</em> ajastusmonitoridele: see süstib valiku rikkeid ja kontrollib, kas monitori väidetav kaitsetase tegelikult piiras selle viga. See ei esita oma täpsusväidet ja seetõttu ei saa seda üle hinnata (<a1><c1/></a1>).

# text
seg-8b89f8b913b9 = Orbiidid ja tsislunaarne ruum

# text
# c1: src/cr3bp.rs
seg-ba6b669eb8ba = <b>CR3BP — ringjooneline piiratud kolme keha probleem (Circular Restricted Three-Body Problem).</b> Maa–Kuu süsteem, mida käsitletakse kahe kehana ringorbiitidel ühise massikeskme ümber, pluss kosmoseaparaat, mis on liiga kerge, et tagasi tõmmata. Kuu lähedal on kahe keha Kepleri ellips lihtsalt vale kujuga; CR3BP on odavaim dünaamika, mis on õige (<a1><c1/></a1>).

# text
seg-2726a22bf14c = <b>NRHO — peaaegu sirgjooneline halo-orbiit (Near-Rectilinear Halo Orbit).</b> Perioodiline CR3BP orbiit, mis kaldub lähedalt üle ühe Kuu poolusest ja kaugele üle teise, nii et otsa pealt on see peaaegu sirgjoon — seetõttu „peaaegu sirgjooneline“. See on Kuu Gateway jaoks valitud orbiit ja see hoiab peaaegu pideva vaatejoone Maale.

# text
seg-2b2e6d04376c = <b>DRO — kauge retrograadne orbiit (Distant Retrograde Orbit).</b> Teine CR3BP perekond: suur, stabiilne orbiit, mis tiirleb ümber Kuu tagurpidi, nagu seda pöörlevas tugisüsteemis nähakse.

# text
# c1: finals2000A
# c2: --eop
seg-6bb9229aee5c = <b>EOP — Maa orientatsiooniparameetrid (Earth Orientation Parameters).</b> Maa mõõdetud, veidi ebaregulaarne kõikumine ja pöörlemine (poolusenihe, UT1 (Universal Time { "1" }, Maa pöörlemisaeg)−UTC — Maa pöörlemisaeg miinus koordineeritud maailmaaeg — ja päeva pikkus), mida on vaja Maaga seotud asukoha muutmiseks inertsiaalseks täpsusega, mis on parem kui meetrid. Neid avaldab IERS (International Earth Rotation and Reference Systems Service); Kshana loeb selle faili <c1/> lipu <c2/> kaudu.

# text
seg-7f1e7e523e5b = Standardid, vormingud ja organisatsioonid

# text
seg-5d8d6144c13a = Lühendid, mida README ja paketilehed kasutavad standardite, failivormingute, ajaskaalade, tugisüsteemide ja nende taga olevate organite jaoks. Igaüks on ka nendel lehtedel esimesel kasutamisel lahti kirjutatud.

# text
seg-800d42de0777 = Orbiidid, tugisüsteemid ja aeg

# text
seg-320a1594dcf1 = <b>SGP4 / SDP4 — Simplified General Perturbations { "4" } / Simplified Deep-space Perturbations { "4" }.</b> Standardsed analüütilised propagaatorid avaldatud satelliidiorbiitide jaoks.

# text
seg-87a098568846 = <b>TLE — kaherealine elemendikomplekt (two-line element set).</b> Avalik orbiidivorming, mida SGP4 loeb.

# text
seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — madal Maa orbiit / keskmine Maa orbiit / geostatsionaarne siirdeorbiit / kaldega geosünkroonne orbiit.</b> Orbiidirežiimid; enamik GNSS-satelliite lendab MEO-l.

# text
seg-1ec323dbd7a6 = LMO — madal Marsi orbiit.

# text
seg-d0be640282af = <b>ECI / ECEF — Maa keskne inertsiaalne / Maa keskne, Maaga seotud (Earth-centred inertial / Earth-centred, Earth-fixed).</b> Tugisüsteem, mis Maaga ei pöörle, ja üks, mis pöörleb.

# text
seg-09a937adc1db = <b>TEME — tõeline ekvaator, keskmine pööripäev (true equator, mean equinox).</b> Tugisüsteem, milles SGP4 väljundi annab.

# text
seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — geotsentriline taevane tugisüsteem (Geocentric Celestial Reference System) / rahvusvaheline maapealne tugisüsteem (International Terrestrial Reference System) / selle realisatsioon, rahvusvaheline maapealne tugiraam (International Terrestrial Reference Frame).</b> Kaasaegsed inertsiaalne ja Maaga seotud tugisüsteem.

# text
seg-56b24c3734be = <b>CIO — taevane vaheorigo (Celestial Intermediate Origin).</b> Kaasaegse, pööripäevavaba Maa pöörlemisahela etalonpunkt.

# text
seg-a23b05c85a63 = <b>LVLH — kohalik vertikaal, kohalik horisontaal (local vertical, local horizontal).</b> Tugisüsteem, mis liigub kosmoseaparaadiga kaasa.

# text
seg-ac37217cda0d = <b>WGS-84 — World Geodetic System { "1984" }.</b> Maa ellipsoid, mida GPS kasutab.

# text
seg-ea7eb1f34cae = <b>LTC / TCL — Kuu koordinaatide aeg (Temps-Coordonnée Lunaire).</b> Kavandatud ajaskaala Kuule.

# text
seg-c6e5976d9dff = <b>OD — orbiidi määramine (orbit determination).</b> Orbiidi taastamine jälgimismõõtmistest.

# text
seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> ja <b>DRO</b> on määratletud ülal jaotises „Orbiidid ja tsislunaarne ruum“.

# text
seg-2e6ba9069396 = Failivormingud ja sõnumid

# text
seg-ed5ea0a21e3f = <b>SP3 — Standard Product { "3" }.</b> Rahvusvahelise GNSS-teenistuse (IGS) täpse orbiidi failivorming, versioonides c ja d.

# text
seg-1bfa0d083935 = <b>RINEX — vastuvõtjast sõltumatu vahetusvorming (Receiver Independent Exchange Format).</b> Standardne failivorming GNSS-i vaatluste ja edastatud efemeriidide jaoks.

# text
seg-39ce08a9ae66 = IONEX — ionosfääri kaardi vahetusvorming (IONosphere map EXchange format).

# text
seg-c23ea3515008 = <b>OEM / OMM / TDM — orbiidi efemeriidisõnum (Orbit Ephemeris Message) / orbiidi keskmiste elementide sõnum (Orbit Mean-elements Message) / jälgimisandmete sõnum (Tracking Data Message).</b> Standardsed sõnumid orbiitide ja jälgimisandmete jaoks Consultative Committee for Space Data Systems (CCSDS) poolt.

# text
seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Kshana stsenaariumide lihttekstivorming.

# text
seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Kshana versioonitud, ise end kirjeldav tulemuste ümbris.

# text
seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> RTCA minimaalsed tööstandardid SBAS-i vastuvõtjatele ja lennukipõhise täiendusega GPS-i pardaseadmetele.

# text
seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> GPS-i liidese spetsifikatsioonid (teine katab L5 signaali).

# text
seg-2230000aa30b = <b>NIST SP { "1065" }.</b> National Institute of Standards and Technology <em>Handbook of Frequency Stability Analysis</em>.

# text
seg-8b89719c1859 = <b>TRL — tehnoloogilise küpsuse tase (technology readiness level).</b> Riistvara küpsuse skaala 1-st 9-ni.

# text
seg-16c972f4ea0a = Organisatsioonid

# text
seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — Euroopa Kosmoseagentuur, selle Euroopa Kosmoseoperatsioonide Keskus ja selle Euroopa kosmosejälgimisvõrk.

# text
seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — USA riiklik aeronautika- ja kosmoseamet, selle Jet Propulsion Laboratory, selle Navigation and Ancillary Information Facility (mis avaldab tööriistakomplekti SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) ning selle Deep Space Network.

# text
seg-eaa5a2a51169 = <b>IGS</b> — rahvusvaheline GNSS-teenistus (International GNSS Service). <b>IERS</b> — International Earth Rotation and Reference Systems Service. <b>IAU</b> — Rahvusvaheline Astronoomia Liit (mille SOFA teek, Standards of Fundamental Astronomy, ja selle avatud port ERFA, Essential Routines for Fundamental Astronomy, on Kshana tugisüsteemide etalonid).

# text
seg-81af4c0f4c48 = <b>CCSDS</b> — Consultative Committee for Space Data Systems. <b>AIAA</b> — American Institute of Aeronautics and Astronautics. <b>RTCA</b> — varem Radio Technical Commission for Aeronautics.

# text
seg-aa0b395df17f = Tarkvara ja tarneahel

# text
seg-b42188d3a6f4 = CLI — käsurea liides (command-line interface).

# text
seg-198c591514ab = <b>MCP — Model Context Protocol</b>, protokoll, mida Kshana agendiserver kõneleb. <b>IDE — integreeritud arenduskeskkond (integrated development environment).</b>

# text
seg-287bf61a1a16 = SBOM — tarkvara komponentide loend (software bill of materials).

# text
seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, ehitusprovenantsi raamistik, mille all Kshana väljalasked on tõendatud.

# text
seg-7487c6f9ed18 = Kõik muud lühendid, A-st Z-ni

# text
# c1: docs/
seg-56f6039bb38a = Iga hoidla dokumentatsioonis kasutatud lühend (<c1/> ja neli README-d), mida ükski ülaltoodud jaotis ei määratle, pluss mõned, mida üks määratleb, korratud otsimiseks. Iga leht kirjutab oma lühendid ka esimesel kasutamisel lahti; see tabel on üks koht, kust neid kõiki üles otsida. Mõned kirjed on identifikaatorid või nimed, mitte lühendid, ja ütlevad seda.

# text
seg-c0dfa446e523 = Tähendab

# text
seg-f272d28225ae = Kus see ette tuleb

# text
seg-ffb0596f134b = Third Generation Partnership Project

# text
seg-77c1b4478387 = organ, mis kirjutab 5G standardeid, sealhulgas mittemaapealseid võrke

# text
seg-eaf19768b977 = viienda põlvkonna mobiilivõrk

# text
seg-692ddc163c55 = sealhulgas selle mittemaapealse võrgu (NTN) positsioneerimine

# text
seg-9524be916f07 = ABI

# text
seg-0e8332db764b = rakenduse binaarliides (application binary interface)

# text
seg-762ea76708dc = Pythoni wheel-sildid

# text
seg-d419d06ed622 = ABMF

# text
seg-b294c714487d = IGS-i jaam Le Moule'is, Guadeloupe'il

# text
seg-586a8ea87638 = neljatäheline jaama identifikaator

# text
seg-4cc9a09495e6 = AC

# text
seg-620e2dc5e4ca = vahelduvvool (alternating current)

# text
seg-9cfb5dc4b4bc = nagu AC-Starki (valguse nihke) efektis

# text
seg-90308009c536 = ADD

# text
seg-49d97c65662d = Algorithm Description Document

# text
seg-493b5ceaa0fb = WG-C ARAIM-i etalon-pardaalgoritm

# text
seg-3fe5d7f41dcd = ADEV / OADEV

# text
seg-089ac7d5ac94 = Alani hälve / kattuv Alani hälve

# text
seg-23c38ecbc543 = vt ülal Alani hälve

# text
seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

# text
seg-4b642742f2d4 = inertsiaalandurite tootenumbrid (Analog Devices; Safran Sensonor; MicroStrain)

# text
seg-c4c0a93477a8 = identifikaatorid, mitte lühendid

# text
seg-36743c7fe98e = AEM

# text
seg-142ca108a070 = Attitude Ephemeris Message

# text
seg-c34185a83d8e = CCSDS sõnum

# text
seg-dd89e1deb663 = AESS

# text
seg-898b29aaef84 = Aerospace and Electronic Systems Society

# text
seg-78692bf5addf = IEEE oma

# text
seg-f429be16014e = AF

# text
seg-afa04bc28b42 = keskmistamistegur (averaging factor)

# text
seg-b3db60632b92 = valimiintervalli täisarvuline kordne Alani-tüüpi hindajas

# text
seg-6097c4709542 = AFS

# text
seg-7043ab3fe32b = Augmented Forward Signal

# text
seg-20380d29d286 = LunaNeti Kuu navigatsioonisignaal

# text
seg-b33d60fa5832 = AGC

# text
seg-98c9c2809bd6 = automaatne võimenduse juhtimine (automatic gain control)

# text
seg-750b8717220b = segamisnäitaja vastuvõtja sisendastmes

# text
seg-31b864b910d5 = AHP

# text
seg-f956cbe86552 = Analytic Hierarchy Process

# text
seg-c2b63847e2dc = mitmekriteeriumiline kaalumismeetod (Saaty)

# text
seg-0e00edd7e222 = AI / ML

# text
seg-6d804a116a08 = tehisintellekt / masinõpe (artificial intelligence / machine learning)

# text
seg-079020f86d22 = AL / HAL / VAL

# text
seg-1981b764715b = häirepiir / horisontaalne häirepiir / vertikaalne häirepiir (alert limit / horizontal alert limit / vertical alert limit)

# text
seg-1e52f04eb047 = viga, mida terviklikkuse monitor peab piirama

# text
seg-c7ce4d3299b8 = AltBOC

# text
seg-f630bcd1d523 = alternative binary offset carrier

# text
seg-e3acb231cf4d = Galileo E5 modulatsioon

# text
seg-79b130764f97 = aritmeetiline keskmine–harmooniline keskmine (võrratus)

# text
seg-190b782b70ce = AOCS

# text
seg-6459d9bce282 = asendi- ja orbiidijuhtimissüsteem (attitude and orbit control system)

# text
seg-14ec3e19c990 = AOS / TCA / LOS

# text
seg-7cdb4a7e6df4 = signaali omandamine / lähima möödumise aeg / signaali kadumine (acquisition of signal / time of closest approach / loss of signal)

# text
seg-8b73e2c51498 = maajaama ülelennu sündmused (LOS tähendab ka vaatejoont; kontekst ütleb, kumb)

# text
seg-27ceb7163571 = API

# text
seg-7903f5ff4027 = rakendusliides (application programming interface)

# text
seg-d6bea5dea0dc = APID

# text
seg-d468b4555dbf = rakendusprotsessi identifikaator (application process identifier)

# text
seg-55730824c8cf = CCSDS Space Packeti päise väli

# text
seg-611cd7a0d378 = APS

# text
seg-55842a648c47 = American Physical Society

# text
seg-07dcfba8a3c9 = APV

# text
seg-1a7fbb0deef2 = vertikaalse juhtimisega lähenemine (approach with vertical guidance)

# text
seg-69a6cc8a532a = APV-I: { "40" } m horisontaalne, { "50" } m vertikaalne häirepiir

# text
seg-f357a0a03c60 = ARL

# text
seg-b4ce3803afa6 = keskmine käivituspikkus (average run length)

# text
seg-08a5d53f813c = keskmine aeg, mille jooksul muutuse detektor häire annab

# text
seg-519e65f68c85 = ARM / ARM64

# text
seg-1db3bdee5f76 = Armi protsessoriarhitektuur / selle 64-bitine vorm

# text
seg-33f6dff869b2 = ASD

# text
seg-dd98c69872e0 = amplituudspektri tihedus (amplitude spectral density)

# text
seg-9fb629e35a25 = võimsusspektri tiheduse ruutjuur

# text
seg-a020de5e94e5 = AU

# text
seg-2342680bc7a6 = astronoomiline ühik (astronomical unit)

# text
seg-894bf4353ce3 = { "149 597 870.7" } km

# text
seg-611aec9d1dce = AUC / ROC

# text
seg-a11aa1d8f433 = kõvera alune pindala / vastuvõtja tööomadus (area under the curve / receiver operating characteristic)

# text
seg-4d65dbf47a5c = detektori hindamine

# text
seg-25dc893d746a = AWS

# text
seg-20979dc817ba = Amazon Web Services

# text
seg-569160c6e52d = majutab SRTM-i kõrgusplaatide avatud peeglit

# text
seg-298c6a00085d = BEL

# text
seg-c7ce8fa2c544 = hoonesse sisenemise kadu (building entry loss)

# text
seg-b714453f9b2c = ITU-R P.2109

# text
seg-b9aec1857aa9 = BI

# text
seg-40ea7b7e321e = nihke ebastabiilsus (bias instability)

# text
seg-ff2ba8692cbc = inertsiaalanduri Alani hälbe tasane miinimum

# text
seg-e7c1cfecd45e = BIPM

# text
seg-dc138478d882 = Bureau International des Poids et Mesures (Rahvusvaheline Mõõtude ja Kaalude Büroo)

# text
seg-6ec98084ac58 = avaldab Circular T

# text
seg-4ff08facda60 = BKG

# text
seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (Saksamaa föderaalne kartograafia- ja geodeesiaamet)

# text
seg-ac4765a77015 = haldab IGS-i andmepeeglit

# text
seg-a85954d9176e = BSD

# text
seg-eb42c5807e5a = Berkeley Software Distribution

# text
seg-a332a259125a = nagu BSD litsentsides

# text
seg-97764c651815 = BSP

# text
seg-8f85848ee08a = binaarne SPK (binary SPK)

# text
seg-6e01dca47581 = binaarne SPICE efemeriidi tuumafail

# text
seg-0157bbd7a064 = BSTAR

# text
seg-23772d56a24c = kaherealise elemendikomplekti takistusliige

# text
seg-628e6c686508 = CAI

# text
seg-a2418a88886c = külmaatomi interferomeeter (cold-atom interferometer)

# text
seg-273a3b8d5385 = vt QUANTUM.md

# text
seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

# text
seg-fa257dda6d45 = CC / CC BY

# text
seg-97b3d1136762 = Creative Commons / Creative Commons Attribution

# text
seg-a1f55ee72524 = andme- või tekstilitsents

# text
seg-1b8df20680a0 = CDDIS

# text
seg-0a158229f571 = Crustal Dynamics Data Information System

# text
seg-5b3f50bed1f6 = NASA kosmosegeodeesia arhiiv

# text
seg-ee2ac06a3023 = CDF

# text
seg-0a54599e470d = jaotusfunktsioon (cumulative distribution function)

# text
seg-6100157bdc02 = CFAR

# text
seg-43ef1f6cd71d = konstantne valehäirete määr (constant false-alarm rate)

# text
seg-b38b56b63da6 = omandamisdetektori läveeeskiri

# text
seg-46835ce9641a = China Geodetic Coordinate System { "2000" }

# text
seg-4dab086e5c3d = BeiDou andmesüsteem (datum)

# text
seg-8f7751d39781 = CIP

# text
seg-e34a194da574 = Celestial Intermediate Pole

# text
seg-c9b37d94f70b = CIRS

# text
seg-29e69d7f32aa = Celestial Intermediate Reference System

# text
seg-a543c4d02ace = CISA

# text
seg-c34a7f26944d = Cybersecurity and Infrastructure Security Agency

# text
seg-59c481cb5741 = USA DHS-i oma

# text
seg-4f7ba1fd1f4c = CM / CL

# text
seg-4fb8507eb747 = civil moderate / civil long

# text
seg-cc0c8f1524f8 = kaks ajamultipleksitud GPS L2C koodi

# text
seg-2ea49f6a1ae9 = CMPL

# text
seg-68b147628ea1 = ühisrežiimi kaitsetase (common-mode protection level)

# text
seg-d469cd44d9d4 = piir vigadele, mida jääktest ei näe

# text
seg-4e25d07b13c9 = CN

# text
seg-e775ec496f2b = converged Newtonian

# text
seg-5d679a981a34 = SPICE valguse levimisaja aberratsiooni parandus

# text
seg-3da9a2841b6c = C/N0 (C/N₀)

# text
seg-cf60da0631b4 = ühikus dB-Hz

# text
seg-f4488db8194d = COPRAS

# text
seg-6379891c1750 = COmplex PRoportional ASsessment

# text
seg-b99fe66bd09c = mitmekriteeriumiline järjestamismeetod

# text
seg-a562dbafa35f = COSPAR

# text
seg-c09ea7bc49b0 = Committee on Space Research

# text
seg-235850ad0d1f = annab välja rahvusvahelisi satelliiditähiseid

# text
seg-dbc3e7c90fe0 = CPR

# text
seg-1fd5b461cc3d = tsükkel pöörde kohta (cycle per revolution)

# text
seg-a1d4080ce019 = empiiriline orbiidikiirendus orbiidisagedusel

# text
seg-96cd47b07b44 = CPU / GPU / NPU

# text
seg-10ad2f10bec0 = keskprotsessor / graafikaprotsessor / närviprotsessor (central / graphics / neural processing unit)

# text
seg-93621c1a1e37 = CRB / CRLB

# text
seg-70b6a0b19705 = Cramér–Rao piir / Cramér–Rao alumine piir

# text
seg-6eb684e34f56 = väikseim dispersioon, milleni nihketa hindaja võib jõuda

# text
seg-93c4fe0f2990 = CRD

# text
seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

# text
seg-eb95135f849c = ILRS normaalpunktide failid

# text
seg-f23ff835b9b0 = CRPA

# text
seg-b5c26297e11b = kontrollitud vastuvõtumustriga antenn (controlled-reception-pattern antenna)

# text
seg-7111b9c4d382 = segamisvastane antennimassiiv

# text
seg-404133a74afc = CR / RI

# text
seg-d35896b2bb24 = järjepidevuse suhe / juhuindeks (consistency ratio / random index)

# text
seg-cfa91dc02138 = AHP järjepidevuse kontroll (aktsepteeri CR < { "0.10" })

# text
seg-8572a3faf46a = CS GROUP

# text
seg-5e00428ed929 = Prantsuse ettevõte, mis haldab Orekitit

# text
seg-58d5f143ff3b = ettevõtte nimi, mitte lahtikirjutatav lühend

# text
seg-be388831a3e1 = CSK

# text
seg-9cf6cad11f64 = koodinihkemanipulatsioon (code shift keying)

# text
seg-a3bd162146d6 = CSS

# text
seg-75ddcc97f9e2 = Cascading Style Sheets

# text
seg-0d5c127b2ee5 = CUSUM

# text
seg-d40da5f47035 = kumulatiivne summa (cumulative sum)

# text
seg-66f752e15abc = järjestikune muutuse detektor

# text
seg-92ac0357d01e = CV

# text
seg-28f75c073917 = (ühine vaade aja edastamisel; kontekst ütleb, kumb)
