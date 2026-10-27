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
seg-13fb20435df3 = <b>VALIDATED.</b> Lihtsalt öeldes: <em>kontrollitud kellegi teise vastuse vastu.</em> Võimekuse väljundit võrreldi sõltumatu välise sõltumatu etaloniga — tegelikud mõõdetud andmed, kellegi teise kirjutatud sõltumatu teek või avaldatud etalonväärtused — ja see nõustus kindlaksmääratud tolerantsi piires. Pideva integratsiooni kontroll lükkab tagasi VALIDATED rea, mis ei nimeta ühtegi välist sõltumatut etaloni.

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

# text
seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — koordineeritud maailmaaeg / rahvusvaheline aatomaeg / maaaeg / maailmaaeg { "1" } (Maa pöörlemisega seotud aeg) / barütsentriline dünaamiline aeg.

# text
seg-507b8c235614 = CZML

# text
seg-0b76641dee1a = Cesium Language

# text
seg-fd0a7af2ebeb = CesiumJS-i JSON-stseenivorming

# text
seg-1aefbc0b799d = dB / dBW / dB-Hz

# text
seg-8a0d954bd13b = detsibell / detsibell-watt / detsibell-herts

# text
seg-c485de5bcd85 = võimsussuhe, absoluutne võimsus ja C/N0 ühik

# text
seg-6c0cbce59df5 = DC

# text
seg-ddd7d412fce7 = alalisvool

# text
seg-0ea7fccee332 = nullsageduse piirjuht

# text
seg-521e2abbe12d = DCM

# text
seg-3db4487dc2a4 = suunakoosinuste maatriks

# text
seg-9d3d9ca79a9d = pöördemaatriks

# text
seg-364a2fcec10b = DCO

# text
seg-110b1eb4f532 = Developer Certificate of Origin (arendaja päritolusertifikaat)

# text
seg-1545bd59f5ef = DCT

# text
seg-8b6866288bea = disainijuhtimistabel

# text
seg-80d95f099e9a = sideliini energiabilansi tabel (JPL DESCANSO Galileo X-riba näide)

# text
seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

# text
seg-ed8d5c361e79 = JPL Development Ephemeris (versioonid { "421" }, { "430" }, { "440" }, { "441" })

# text
seg-748af19e3f0b = planeetide ja Kuu efemeriidid; „DE-grade“ tähendab selle klassi täpsust

# text
seg-6f880928ce0c = DEM

# text
seg-eed6ad669d4c = digitaalne kõrgusmudel

# text
seg-920f5ff86fa2 = DESCANSO

# text
seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence (süvakosmose side- ja navigatsioonisüsteemide tippkeskus)

# text
seg-2e11a1976171 = JPL-i monograafiasari

# text
seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Müncheni Tehnikaülikooli Saksa geodeesia uurimisinstituut)

# text
seg-e7cedd55549e = peab EUROLAS-i andmekeskust

# text
seg-4389ecd5c81a = DGNSS

# text
seg-fb8c5992354b = diferentsiaalne GNSS

# text
seg-3fed847ae9ec = DHS

# text
seg-2845322fad33 = Ameerika Ühendriikide sisejulgeolekuministeerium

# text
seg-6b487421c547 = US

# text
seg-9e06c8655623 = DoD

# text
seg-7a7ea4a3f0d5 = Ameerika Ühendriikide kaitseministeerium

# text
seg-1f6c4757bee5 = DOF / DoF

# text
seg-e1daefad0696 = vabadusaste

# text
seg-bf5bc69cb873 = vt 1-DOF ülalpool

# text
seg-3b5c7c9b324d = DOR / Δ-DOR

# text
seg-3e0b6392f4d9 = diferentsiaalne ühesuunaline kaugusmõõtmine / delta-diferentsiaalne ühesuunaline kaugusmõõtmine

# text
seg-6ba2d3b5b724 = süvakosmose nurkjälgimine

# text
seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

# text
seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

# text
seg-00ecc6de9912 = numbrilised integraatorid

# text
seg-16c4bf2faef3 = DRMS

# text
seg-8128cc0c1482 = kauguse ruutkeskmine

# text
seg-a8ed04890ded = vt 2DRMS

# text
seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

# text
seg-371644e70b75 = Microchipi andmelehtede dokumendinumbrid

# text
seg-f25e5c4de1e5 = DSAC

# text
seg-aa0d8d4b3a3b = Deep Space Atomic Clock (süvakosmose aatomkell)

# text
seg-e80350ed521f = NASA lõksu püütud elavhõbedaioonide kell

# text
seg-52e838301c0b = UT1 miinus UTC

# text
seg-fbce3b3b7b80 = Maa pöörlemise parandus

# text
seg-8aa996f34920 = bitienergia ja müratiheduse suhe

# text
seg-463b21c0b791 = inertsiaalsüsteem, mis on käigu alguses joondatud Maaga seotud süsteemiga

# text
seg-4dc987bd9dbf = kasutatakse leo-pass koostalitlusvõime eksportides

# text
seg-61f975df5e21 = ECMAScript / ES

# text
seg-c66e728cd2fa = JavaScripti aluseks olev standard / ES-moodul

# text
seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

# text
seg-2967e958f353 = GNSS-i päikesesurve mudel (CODE: Center for Orbit Determination in Europe, Euroopa orbiidi määramise keskus)

# text
seg-244af4062ccc = ECSS

# text
seg-b74029376aba = European Cooperation for Space Standardization (Euroopa kosmosestandardimise koostöö)

# text
seg-d452e23d503a = ECSS-E-ST-10-02 on selle kontrollistandard

# text
seg-becb6685ff13 = ED

# text
seg-b6448e14a567 = EUROCAE dokument

# text
seg-ee4ada9c4c6e = nagu dokumendis ED-259A

# text
seg-8a57ce8403b1 = EDL

# text
seg-0f065f2290f3 = atmosfääri sisenemine, laskumine ja maandumine

# text
seg-69f37001de44 = EEE

# text
seg-18a1b66286ee = elektri-, elektroon- ja elektromehaanilised (osad)

# text
seg-f814c1301059 = kosmosetoote kvaliteedi tagamine

# text
seg-08e455b17435 = EGM / EGM2008

# text
seg-1ed72a253035 = Earth Gravitational Model (Maa gravitatsioonimudel; väljalase { "2008" })

# text
seg-074e3ceb394e = NGA

# text
seg-69ba7307ea4c = EIGEN

# text
seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques (Maa täiustatud Euroopa gravitatsioonimudel uute meetoditega)

# text
seg-a49ce7809382 = ELECTRE

# text
seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminatsioon ja tegelikkust väljendav valik)

# text
seg-efb2f919955a = ülekaalumeetodil põhinev mitmekriteeriumiline meetod

# text
seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, MPP02 versioon (Chapront)

# text
seg-b1d699d70339 = analüütiline Kuu teooria

# text
seg-aee5eeb23064 = Maa keskmine ekvaator ja pööripunkt epohhil J2000

# text
seg-16d9b8eac95d = inertsiaalsüsteem

# text
seg-e676d5eec6e3 = EML

# text
seg-f4bba0abbda7 = koodidiskriminaator

# text
seg-0e4110d33849 = EMT

# text
seg-103c6de62575 = efektiivne seirelävi

# text
seg-4b2101113387 = ARAIM-i väljund

# text
seg-0e2817aec74a = ENU / NED

# text
seg-56d5cf1544d9 = ida–põhi–üles / põhi–ida–alla

# text
seg-aae7610833a7 = kohalikud horisontaalsüsteemid

# text
seg-c7d5c5d5c5b2 = EO

# text
seg-24907930c730 = Maa seire

# text
seg-38f9c209c4ac = EPM / EPM2021

# text
seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (planeetide ja Kuu efemeriidid; väljalase { "2021" })

# text
seg-bd2a27a17f6d = IAA RAS-i efemeriid

# text
seg-01a8e43fb6c7 = ERA

# text
seg-eb78ffaf7e1d = Maa pöördenurk

# text
seg-966ed500f705 = ESKF

# text
seg-e79112a3132a = veaseisundi Kalmani filter

# text
seg-25c6b6b19d75 = ESS

# text
seg-fe2b7be913f0 = efektiivne valimi maht

# text
seg-57ce1c1b617b = osakestefiltri puhul

# text
seg-f529300f944b = ESSR

# text
seg-869be8388d26 = European Space Software Repository (Euroopa kosmosetarkvara hoidla)

# text
seg-536d66d208e4 = ESA

# text
seg-27be9c1d7090 = ET

# text
seg-7cc2ef5b0748 = efemeriidiaeg

# text
seg-e0c49639649e = SPICE-i nimetus TDB jaoks

# text
seg-80de6914a5ec = EUROCAE

# text
seg-76897dd8c3be = Euroopa tsiviillennundusseadmete organisatsioon

# text
seg-b4f12b7813dd = EUROLAS

# text
seg-857527c69d6e = Euroopa laservõrk

# text
seg-fa7025d88c88 = satelliitide ja Kuu laserkaugusmõõtmine

# text
seg-13fc009b947c = FAQ

# text
seg-f5581b33ae89 = korduma kippuvad küsimused

# text
seg-67d10fd4a4e0 = FCC

# text
seg-0a558c281968 = Ameerika Ühendriikide föderaalne sidekomisjon

# text
seg-f6ade8c24d27 = FCNN

# text
seg-6098513947b8 = täielikult ühendatud närvivõrk

# text
seg-1de7b4410369 = FD

# text
seg-4e73ff36d37f = lõplik vahe

# text
seg-e43312a5fbbe = FDE

# text
seg-d6c9fb239b59 = rikete tuvastamine ja välistamine

# text
seg-8f9d11564223 = FES / FES2004

# text
seg-1a1cf1501056 = Finite Element Solution (lõplike elementide lahendus; väljalase { "2004" })

# text
seg-878b4a645ae9 = ookeanilainete mudel

# text
seg-55c14f474a10 = FIM

# text
seg-b68c86e68570 = Fisheri infomaatriks

# text
seg-d39671724dfc = Fowler–Noll–Vo räsi, variant 1a

# text
seg-3354ad42f7dd = kasutatakse kuldväljundite fikseerimiseks

# text
seg-efca4decfec0 = FOC / IOV

# text
seg-793d96ab9856 = täielik tegutsemisvõime / orbiidil valideerimine

# text
seg-ce13cca7f222 = satelliidisugupõlved (Galileo, Xona Pulsar)

# text
seg-58df7305e218 = FOV / IFOV

# text
seg-cafe1f8733ec = vaateväli / hetkeline vaateväli

# text
seg-4f7168e895d2 = FPGA / MCU / RTOS

# text
seg-abde801ec70b = programmeeritav loogikamaatriks / mikrokontroller / reaalajaoperatsioonisüsteem

# text
seg-a082e4570309 = FSL / FSPL

# text
seg-3a8ee2932a46 = vabaruumi sumbuvus / vabaruumi levikaosumbuvus

# text
seg-4535dadf79df = ITU-R P.525

# text
seg-c0209066dc76 = GB / KB / MB

# text
seg-184bb3d8b345 = gigabait / kilobait / megabait

# text
seg-8094e61fdd76 = GCRF

# text
seg-6c6337c7a855 = geotsentriline taevane tugisüsteem

# text
seg-f050f2b8dee1 = GDAL

# text
seg-98b12fcceb01 = Geospatial Data Abstraction Library (geoandmete abstraktsiooniteek)

# text
seg-1cef8718c772 = GEO

# text
seg-6131e4ea7858 = geostatsionaarne orbiit

# text
seg-bf09433a7342 = GeoJSON

# text
seg-f8654e88af67 = Geographic JavaScript Object Notation (geograafiline JavaScripti objektikirjeldus)

# text
seg-70dc52cd5059 = IETF RFC { "7946" }

# text
seg-bb8fbd2ebc28 = GG

# text
seg-b93ed4ab2b79 = gravitatsioonigradient

# text
seg-d8ef4d361e86 = nagu gravitatsioonigradiendi pöördemomendis

# text
seg-12fd4eb15c4d = GHz / kHz

# text
seg-0769cc8be024 = gigaherts / kiloherts

# text
seg-3946b69535e4 = GIM

# text
seg-ef5fc608b0e5 = globaalne ionosfäärikaart

# text
seg-8cbbff1bc1d1 = GINS / KF-GINS

# text
seg-fbe37a571772 = GNSS/INS-i integreerimine / Wuhani ülikooli Kalmani filtri GNSS/INS-i andmekogum ja kood

# text
seg-deca3cbe41ac = GIS

# text
seg-36275ece527d = geoinfosüsteem

# text
seg-ebe8194d12b3 = GIVE

# text
seg-6a99c12984b5 = võrgu ionosfääri vertikaalviga

# text
seg-20a40777d78a = SBAS-i sõnumi termin

# text
seg-6fbfc5108833 = gLAB

# text
seg-1be22ebbedc3 = GNSS-Lab Tool (GNSS-i laboritööriist)

# text
seg-93b2c5b68af0 = ESA levitatav GNSS-i andmetöötluse tarkvarakomplekt

# text
seg-2aa0f3147ad5 = GLIBC

# text
seg-096e00cb9d9b = GNU C teek

# text
seg-2630ae5f0bc5 = Venemaa ülemaailmne satelliitnavigatsioonisüsteem (Globalnaya Navigatsionnaya Sputnikovaya Sistema)

# text
seg-361f1f18d454 = GLS

# text
seg-397d58b727ee = üldistatud vähimruutude meetod

# text
seg-9bb2492e5d5d = GM

# text
seg-6bd8e46e9131 = gravitatsiooniparameeter

# text
seg-e3a296392ac0 = gravitatsioonikonstandi ja keha massi korrutis

# text
seg-45a8f50bce06 = General Mission Analysis Tool (üldine missioonianalüüsi tööriist)

# text
seg-60d33e61b446 = NASA

# text
seg-1edd65c52f46 = Goddard Mars Model { "3" }

# text
seg-45abee95253b = Marsi gravitatsiooniväli

# text
seg-558ea1e07042 = GMST

# text
seg-d3c4914f0d13 = Greenwichi keskmine tähtaeg

# text
seg-d853b1084a52 = GNC

# text
seg-34a9ddce3d5f = juhtimine, navigatsioon ja reguleerimine

# text
seg-d33e343f6635 = GPOD

# text
seg-2ef6bb5a52fc = Grid Processing On Demand (nõudmisel võrgutöötlus)

# text
seg-14782f821cde = GR

# text
seg-762f364a05f3 = üldrelatiivsusteooria

# text
seg-3e3f45ad1178 = GRGM / GRGM660PRIM

# text
seg-948167f5f1c3 = NASA Goddardi GRAIL-i Kuu gravitatsioonimudelid (GRAIL: Gravity Recovery and Interior Laboratory)

# text
seg-220fae5cfc61 = Geodetic Reference System { "1980" }

# text
seg-bb3c2a337ae8 = GSD

# text
seg-691791646eb3 = maapinna diskreetimissamm

# text
seg-448d7036fefe = GSE

# text
seg-d05b88e7d5c5 = maapealne tugiseadmestik

# text
seg-95d29f8138f9 = GSFC

# text
seg-2e1460089fed = Goddardi kosmoselennukeskus

# text
seg-7680e0663a5b = HDEV / OHDEV

# text
seg-1fd1e3322c86 = Hadamardi hälve / kattuv Hadamardi hälve

# text
seg-bb846135ceb4 = triivi suhtes tundetu stabiilsusmõõt

# text
seg-0edc4eed2775 = HIL

# text
seg-956a26e1ff6d = riistvara silmuses

# text
seg-48523cdbbbf5 = HMI / MI

# text
seg-d77e079194df = ohtlikult eksitav info / eksitav info

# text
seg-1cbf9d6f135d = Stanfordi diagrammi alad

# text
seg-b320746fafa5 = HP

# text
seg-465a952272f3 = HTML

# text
seg-45a46390d3ba = HyperText Markup Language (hüperteksti märgistuskeel)

# text
seg-25206f1161f0 = IAA RAS

# text
seg-1a4f063e3583 = Venemaa Teaduste Akadeemia Rakendusastronoomia Instituut

# text
seg-9f434fdc21f2 = IAG

# text
seg-08fb84d2e01a = Rahvusvaheline Geodeesia Assotsiatsioon

# text
seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

# text
seg-01880debd7e0 = Rahvusvaheline Geomagnetismi ja Aeronoomia Assotsiatsioon / selle töörühm V-MOD (geomagnetvälja modelleerimine)

# text
seg-28805f15bae8 = haldab IGRF-i

# text
seg-d4ce72152bf2 = IC

# text
seg-fa95c4e7fdc2 = algtingimus

# text
seg-e4c4373d0c76 = ICAO

# text
seg-2fccffbaf4dc = Rahvusvaheline Tsiviillennunduse Organisatsioon

# text
seg-c2d2d459177d = ICD

# text
seg-a018300615e2 = liidesejuhtimisdokument

# text
seg-433b45040abd = nagu Galileo OS SIS ICD-s

# text
seg-5e1e49c5000e = ICGEM

# text
seg-c17be0db9e83 = Rahvusvaheline Globaalsete Maa Mudelite Keskus

# text
seg-e9650a618b38 = ID

# text
seg-e40875ab1090 = identifikaator (või identifitseerimine, nagu mürataseme ID-s)

# text
seg-c643488ba1ea = IEEE

# text
seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers (elektri- ja elektroonikainseneride instituut)

# text
seg-91966e2931d4 = IETF / RFC

# text
seg-0804111ad44d = Internet Engineering Task Force / Request for Comments (interneti insenerivolinikud / kommentaaripäring)

# text
seg-ce9375732735 = IF

# text
seg-746eae5ce367 = vahesagedus

# text
seg-ed568f55aa8f = vastuvõtja diskreedid

# text
seg-cb4aaa2581bb = IGS-i teostus ITRF2014-st

# text
seg-bfa8e6d5d0d1 = IGRF / IGRF14

# text
seg-55fed0afea05 = Rahvusvaheline Geomagnetilise Tugivälja Mudel

# text
seg-669611e731d0 = IGRF-14 (fail IGRF14.shc) on 14. põlvkond

# text
seg-f7cf8ff44256 = IGSO

# text
seg-4833bd1e9c03 = kaldega geosünkroonne orbiit

# text
seg-2080ff6f98fd = IIF

# text
seg-cf7a31e569cd = GPS Block II Follow-on

# text
seg-8a19be8033a9 = GPS-satelliitide põlvkond

# text
seg-68cc1c937ce9 = ILRS

# text
seg-53cc8d1f6824 = Rahvusvaheline Laserkaugusmõõtmise Teenistus

# text
seg-fb5255ba4bc1 = ILS

# text
seg-b8af4d02e031 = täisarvuliste vähimruutude meetod

# text
seg-a214c483b8a8 = täisarvuliste mitmetähenduslikkuste lahendamine

# text
seg-4740fb9ef0b9 = IMCCE

# text
seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides (taevamehaanika ja efemeriidide arvutuse instituut)

# text
seg-22048a770612 = Pariisi observatoorium; avaldab INPOP-i

# text
seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, versioon 21a

# text
seg-577acd29f11b = planeetide efemeriid

# text
seg-cdb9ea77f5a6 = IOAG

# text
seg-87f308314cd4 = Interagency Operations Advisory Group (asutustevaheline operatiivnõuandev rühm)

# text
seg-690414990ad8 = ION / ITM

# text
seg-b2fbe0c3507a = Institute of Navigation / selle rahvusvaheline tehniline kohtumine

# text
seg-53abad80634c = IoT

# text
seg-9b766d557bd1 = asjade internet

# text
seg-1b41d114662e = IR

# text
seg-ff2d89b32d07 = terviklikkuse risk

# text
seg-2dc9fcadccd6 = ohtlikult eksitava info tõenäosus

# text
seg-02aeac5e2435 = IRE

# text
seg-9c9c0011de8c = Institute of Radio Engineers (raadioinseneride instituut)

# text
seg-3fbae7e11fca = IEEE eelkäija

# text
seg-9e3d84279d56 = kellanihe kahe GNSS-i vahel

# text
seg-2ffee4396fbd = ISL

# text
seg-505dee046f7a = satelliitidevaheline link

# text
seg-010ea5a76e2e = ISM

# text
seg-330b25f923db = terviklikkuse tugisõnum

# text
seg-1f5a14efd417 = ARAIM

# text
seg-0ee7fcdaf5a9 = ISO

# text
seg-8c1341375f17 = Rahvusvaheline Standardiorganisatsioon

# text
seg-8291ac1ccba6 = ISO { "8601" } on selle kuupäeva ja kellaaja vorming

# text
seg-5b4dee02dccc = ITRF93 / ITRF2020

# text
seg-93458bf3ba01 = International Terrestrial Reference Frame { "1993" } / { "2020" } (rahvusvaheline maapealne tugisüsteem)

# text
seg-14dc2a58e2c3 = Rahvusvahelise Telekommunikatsiooniliidu raadiosidesektor

# text
seg-0e8094e4d45c = selle P-seeria soovitused modelleerivad levi

# text
seg-3e325d97365e = IVS

# text
seg-6f8a6ec848a6 = Rahvusvaheline VLBI teenistus geodeesia ja astromeetria jaoks

# text
seg-2dd00d470e14 = JD / MJD

# text
seg-107e6683f70d = Juliuse päev / modifitseeritud Juliuse päev

# text
seg-996d4952554f = JMLR

# text
seg-a1ef35b98931 = Journal of Machine Learning Research (masinõppe uurimise ajakiri)

# text
seg-d370f89393c7 = JOSA

# text
seg-12c154fcd073 = Journal of the Optical Society of America (Ameerika Optikaühingu ajakiri)

# text
seg-58fb16c8a046 = JRC / JRC122785

# text
seg-82f85268028f = Euroopa Komisjoni Teadusuuringute Ühiskeskus / üks selle aruannete numbritest

# text
seg-23f5be8ff49e = JS

# text
seg-516ee91e60c5 = JavaScript

# text
seg-02d421e784cd = JavaScript Object Notation (JavaScripti objektikirjeldus)

# text
seg-4da0210abab0 = JSTSP

# text
seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing (signaalitöötluse valitud teemade ajakiri)

# text
seg-919a951f3d02 = KF

# text
seg-436a208697f1 = Kalmani filter

# text
seg-9c92e0bc42aa = KML

# text
seg-caf09d501881 = Keyhole Markup Language

# text
seg-ffe25881cef6 = Google Earthi loetav OGC standard

# text
seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

# text
seg-e1552da90a21 = Kshana enda LEO navigatsioonisõnumi tekstivormingu kirjetüüpide sildid

# text
seg-3269a4e6b3e3 = Kshana laiendus, mitte standard

# text
seg-b7f0168b6037 = KPI

# text
seg-a5ff89f0923d = võtmetulemusnäitaja

# text
seg-1c4a7ccef434 = KSC

# text
seg-73a4bf4da46f = Kennedy kosmosekeskus

# text
seg-e401e5d923f0 = KVN

# text
seg-09f93b4d4d0b = Keyword = Value Notation (võtmesõna = väärtus kirjaviis)

# text
seg-7379ade4ee0e = CCSDS-i sõnumite tekstivorm

# text
seg-a24cf86216d0 = LANS

# text
seg-2ee81a2bc69b = Lunar Augmented Navigation Service (Kuu täiendatud navigatsiooniteenus)

# text
seg-849e3161b64b = LAPACK

# text
seg-3b4f3c08a5ba = Linear Algebra PACKage (lineaaralgebra teek)

# text
seg-69cd99d2f937 = LCG

# text
seg-bcddea3df96d = lineaarne kongruentsgeneraator

# text
seg-8927ca404e64 = NIST SP { "1065" } testsarja generaator

# text
seg-0b9b908055cf = LCNS

# text
seg-f9200a1b7246 = Lunar Communications and Navigation Services (Kuu side- ja navigatsiooniteenused)

# text
seg-5253cae4b05b = ESA Moonlight teenus

# text
seg-2361aef1e2e3 = LCRNS

# text
seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems (Kuu sidereleed ja navigatsioonisüsteemid)

# text
seg-8fc87d3026e5 = LFSR

# text
seg-bfecf2f88f17 = lineaarse tagasisidega nihkeregister

# text
seg-5b09c8e3f127 = levikoodi genereerimine

# text
seg-944b45f65820 = LGPL

# text
seg-1e1bf7d7dc79 = GNU Lesser General Public License

# text
seg-0d4d5316b1d8 = LIL

# text
seg-6d040101c6fa = iteratiivse logaritmi seadus

# text
seg-e48d4b1feeaf = LLI / SSI

# text
seg-81ace10136b6 = lukustuskao indikaator / signaalitugevuse indikaator

# text
seg-7d95179a5a1f = RINEX-i vaatluslipud

# text
seg-2ac0ebb389e7 = LLR

# text
seg-29bcbb78931b = Kuu laserkaugusmõõtmine

# text
seg-20deda97c876 = LLVM

# text
seg-5a84a3219546 = LLVM-i kompilaatoritaristu (algselt Low Level Virtual Machine)

# text
seg-277ed5c4cbcc = LNAV

# text
seg-d2fa9c420999 = pärandnavigatsioonisõnum

# text
seg-7f5ad6ab8c23 = GPS

# text
seg-6379745571a9 = LNCSS

# text
seg-b8c48f2bfaf0 = Kuu navigatsiooni- ja sidesatelliitsüsteem

# text
seg-4ce3c0ea7a31 = konstellatsioonide juhtumiuuringud väljaandes NAVIGATION { "70" }({ "4" }), navi.613

# text
seg-b13c5776e35b = LNIS

# text
seg-7c67c5753d20 = LunaNet Interoperability Specification (LunaNeti koostalitlusvõime spetsifikatsioon)

# text
seg-881578d31056 = LNSS

# text
seg-25d4f3a4d3f6 = Lunar Navigation Satellite System (Kuu navigatsioonisatelliitsüsteem)

# text
seg-97ff1706b4bd = kavandatud Kuu konstellatsioon

# text
seg-ec733de1adc5 = LPV / LPV-200

# text
seg-40d72ae4bc9a = lokaliseerimisvõime vertikaalse juhtimisega / selle { "200" } jala otsustuskõrguse kategooria

# text
seg-090ba62634a8 = lennunduse lähenemine

# text
seg-b4921e83ddc9 = LRO

# text
seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter (Kuu luureorbiiter)

# text
seg-8f782bde5659 = LS

# text
seg-c5bc49526464 = liigsekundid

# text
seg-54ea05b82cb4 = nagu Δt_LS-is

# text
seg-15111a93c6d7 = LT

# text
seg-35231d8b9b39 = valguse levi aeg

# text
seg-4729314afd46 = LTE

# text
seg-1a7e158f020f = Long-Term Evolution (pikaajaline areng)

# text
seg-3c1b3acc46d9 = 4G mobiilside standard

# text
seg-3530cdaca137 = LU

# text
seg-58ad64b9d450 = alumine–ülemine (lahutus)

# text
seg-ef1a45eba6aa = LuGRE

# text
seg-72ec36312101 = Lunar GNSS Receiver Experiment (Kuu GNSS-vastuvõtja eksperiment)

# text
seg-84874825a5d1 = lendas Kuule aastal { "2025" }

# text
seg-e6719690faa2 = LuPNT

# text
seg-be19fb902b36 = Stanfordi Kuu PNT teek

# text
seg-893ba320da76 = nimi

# text
seg-fc68b2fb9529 = MAAST

# text
seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool (MATLABi algoritmide kättesaadavuse simulatsioonitööriist)

# text
seg-a24b3840d248 = Stanford

# text
seg-71063143c8be = MAIT

# text
seg-2d7aa60c26ba = tootmine, kokkupanek, integreerimine ja katsetamine

# text
seg-0397322eae11 = MAR099 / JUP365 / SAT441

# text
seg-bd57191f860b = JPL-i satelliidiefemeriidide lahendused Marsi, Jupiteri ja Saturni kuude jaoks

# text
seg-9b0688bfc31e = identifikaatorid

# text
seg-a8748c38de15 = MASPS

# text
seg-e25a3738b952 = lennunduse süsteemi minimaalsed toimivusstandardid

# text
seg-16a3c8f74c1c = MATLAB

# text
seg-bebc110fded7 = MATrix LABoratory (maatrikslabor)

# text
seg-e722ea781fdf = numbriarvutuse tarkvaratoode

# text
seg-7c03fb6e56f6 = MAUT

# text
seg-e409f72ac9ab = mitmeatribuudiline kasuteooria

# text
seg-4a29ddd9b24e = MC

# text
seg-19a7ad528cf3 = MCD

# text
seg-202b82bfefcf = Marsi kliimaandmebaas

# text
seg-371da1e857e8 = MCDA

# text
seg-17d89019fd4a = mitmekriteeriumiline otsuseanalüüs

# text
seg-b522fc3d6c82 = MCI / MCMF

# text
seg-f5544acf642a = Kuu-tsentriline inertsiaalne / Kuu-tsentriline, Kuuga seotud

# text
seg-f7b59f61da60 = MDB

# text
seg-0c674a59d087 = minimaalne tuvastatav nihe

# text
seg-c769430226c3 = MDEV

# text
seg-33a4628c6e67 = modifitseeritud Alani hälve

# text
seg-bde3f0e5dfa7 = MEMS

# text
seg-8b08f307de8a = mikroelektromehaanilised süsteemid

# text
seg-c960c0e048b7 = MeO / MLRO

# text
seg-48623f76be86 = MéO (Métrologie Optique), Grasse'i laserjaam / Matera Laser Ranging Observatory

# text
seg-a8fcbefbbf4c = Kuu laserkaugusmõõtmise jaamad

# text
seg-8b597c678c3f = ME / PA

# text
seg-cb56efe2fb70 = keskmine Maa / peateljed

# text
seg-f30f1a2778cf = kaks Kuuga seotud süsteemi (MOON_ME, MOON_PA)

# text
seg-308d4c93a8a3 = MGEX

# text
seg-b2b632cd52d2 = Multi-GNSS Experiment (mitme GNSS-i eksperiment)

# text
seg-86fd2d84ed21 = IGS

# text
seg-79f8412f30f2 = MIT

# text
seg-70012b81c998 = Massachusettsi Tehnoloogiainstituut

# text
seg-e9d7062835a9 = nagu MIT litsentsis

# text
seg-a0b70e8c4c38 = MLP

# text
seg-77abd5634603 = mitmekihiline pertseptron

# text
seg-6975432180f6 = väike närvivõrk

# text
seg-a4be7b1d83e3 = MOD / TOD

# text
seg-421b9611e897 = kuupäeva keskmine / kuupäeva tegelik

# text
seg-1af66f9b771d = ekvaatori ja pööripunkti süsteemid

# text
seg-b5db821f8008 = MOORA

# text
seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis (mitme eesmärgi optimeerimine suhtanalüüsi alusel)

# text
seg-d26a24b5d9f0 = MOPS

# text
seg-e8707522cf5f = minimaalsed operatiivsed toimivusstandardid

# text
seg-cd0720a78dbb = MPL

# text
seg-bcdaf8567381 = Mozilla Public License

# text
seg-0f45b55420be = MRO110 / MRO110B2

# text
seg-61415a003e40 = Mars Reconnaissance Orbiteri gravitatsioonimudelid { "110" } ja 110B2

# text
seg-8404f70361e7 = MSRV

# text
seg-26a6a79755f9 = minimaalne toetatud Rusti versioon

# text
seg-959fe8ad53df = MTF

# text
seg-70d61ab4eb42 = modulatsiooni ülekandefunktsioon

# text
seg-7f60d1ac40ad = optiline kujutamine

# text
seg-8598e499c145 = MVDR

# text
seg-c767dc9ae21a = minimaalse dispersiooniga moonutuseta vastus

# text
seg-83f57219e5b7 = adaptiivne kiirvormimine

# text
seg-e1ee50b3ea0a = MWL

# text
seg-12d9510328d2 = mikrolaineside

# text
seg-639266912f59 = ACES-i aja edastamise link

# text
seg-5ac07401e4f8 = NaN

# text
seg-722d679807ee = pole arv

# text
seg-0e4abc653325 = NavIC

# text
seg-355821380384 = Navigation with Indian Constellation (navigatsioon India konstellatsiooniga)

# text
seg-fc13b86a8365 = NAVISP

# text
seg-2eb6cc573946 = Navigation Innovation and Support Programme (navigatsiooniinnovatsiooni ja toetuse programm)

# text
seg-b518d44847fa = NAV / OBS

# text
seg-c6965d4d7202 = navigatsioon (sõnum) / vaatlus

# text
seg-1729ddf0eafa = kaks RINEX-i failitüüpi; Stanfordi NAV Lab on Navigation and Autonomous Vehicles Laboratory

# text
seg-f239334e4928 = NBS / NBS14

# text
seg-c8e5edff04d7 = endine Ameerika Ühendriikide riiklik standardibüroo / sagedusstabiilsuse etalonandmekogum NBS14

# text
seg-3d1ac5146fea = kasutatakse Alani hinnangute kontrollimiseks

# text
seg-37879f5ad9e0 = NEES / NIS

# text
seg-9610f0449fb2 = normaliseeritud hinnangu vea ruut / normaliseeritud innovatsiooni ruut

# text
seg-af167a77a1dc = filtri järjepidevuse testid

# text
seg-beb7a86721ec = National Geospatial-Intelligence Agency (Ameerika Ühendriikide riiklik geoluureamet)

# text
seg-7aa223cbfe13 = NGS / NOAA

# text
seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration (riiklik geodeesiateenistus / riiklik ookeani- ja atmosfääriamet)

# text
seg-4a1040c5f2fa = NIMA / TR8350

# text
seg-4cf62b739fc6 = National Imagery and Mapping Agency / selle tehniline aruanne TR8350.2 (WGS { "84" } määratlus)

# text
seg-ffa6025b5a70 = NIMA on NGA endine nimi

# text
seg-af4be907e56c = NLOS

# text
seg-22ab7d58324b = ainult peegeldunud signaal

# text
seg-9887902c13a1 = NNLS

# text
seg-b4cb6d6bfce4 = mittenegatiivsete vähimruutude meetod

# text
seg-af8ca8550600 = NORAD

# text
seg-07428e7224cf = Põhja-Ameerika Aerokosmose Kaitse Väejuhatus

# text
seg-4edb033e3432 = peab avalikku satelliidikataloogi

# text
seg-dd984e16dbcd = NP

# text
seg-f92816d7c936 = Neyman–Pearson

# text
seg-fc214695fa83 = tuvastamisteooria

# text
seg-3ef8006482bb = NPA

# text
seg-81a072ee0520 = mittetäppislähenemine

# text
seg-b9fd2cf6a2b9 = lennundus

# text
seg-e6cb557ee6d1 = NPB

# text
seg-18510a95b308 = nutatsioon–pretsessioon–nihe

# text
seg-b4562efbafdf = IAU 2006/2000A maatriks

# text
seg-c5d8932f6956 = NRL / NRLMSISE-00

# text
seg-9c9f5eac83b2 = Naval Research Laboratory / selle Mass Spectrometer and Incoherent Scatter Radar Extended atmosfäärimudel, { "2000" }

# text
seg-bf373b9cd0c6 = NTN

# text
seg-0ae939342934 = mittemaapealne võrk

# text
seg-1ae0305d8455 = 5G satelliitidelt

# text
seg-20b98c32226f = NTRS

# text
seg-1470d2af037a = NASA Technical Reports Server (NASA tehniliste aruannete server)

# text
seg-243d375db224 = OC-0 … OC-13

# text
seg-d36b43dd505c = ülepaisutatud väidete identifikaatorid

# text
seg-47ba87f3730b = faili CLAIMS-VS-REALITY.md read

# text
seg-e0689f1fc932 = OCI

# text
seg-1a3377171d89 = Open Container Initiative

# text
seg-b5bf07ed6c8c = konteineripildi vorming

# text
seg-7b56c21cca93 = ODE / SDE

# text
seg-722bdf2ca73a = harilik / stohhastiline diferentsiaalvõrrand

# text
seg-a4da10cb1150 = ODM

# text
seg-b1c25bfe0612 = orbiidiandmesõnumid

# text
seg-35fe6a2f3de3 = CCSDS-i pere, kuhu kuuluvad OEM ja OMM

# text
seg-c06d6aa8ba3a = OGC

# text
seg-eb1feb23de1c = Open Geospatial Consortium

# text
seg-9737495b035c = OLS / WLS

# text
seg-63bf35c31a6a = harilikud / kaalutud vähimruutude meetod

# text
seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

# text
seg-4be3f4155fc8 = ESA orbiidil asuv tarkvaralaboratooriumi satelliit / selle anomaaliate tuvastamise andmekogum

# text
seg-14b642ea59e1 = OSIP

# text
seg-4871060090a0 = Open Space Innovation Platform (avatud kosmoseinnovatsiooni platvorm)

# text
seg-251b3ff3eb9b = OSNMA / TESLA

# text
seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

# text
seg-95b6b14facf1 = Galileo signaali autentimine

# text
seg-501a89e8b32b = OS / OSes

# text
seg-5a526cda4166 = avatud teenus (Galileo, BeiDou) või operatsioonisüsteem(id)

# text
seg-6db10af375e3 = kumb, selgub kontekstist

# text
seg-584a7e7d4f5e = OU

# text
seg-937187abcdf6 = Ornstein–Uhlenbeck

# text
seg-9be9042ec983 = keskmisele tagasipöörduv müraprotsess

# text
seg-08c583f40405 = PA

# text
seg-9a24d9f45aa4 = toote kvaliteedi tagamine (ka täppislähendus, nagu K_H,PA-s)

# text
seg-65ad442b3faa = PCK

# text
seg-c788fe80678e = planeedikonstantide tuum

# text
seg-46a00fdc9d5b = SPICE

# text
seg-417a52c9c154 = PDF

# text
seg-c462c83b47df = Portable Document Format (kaasaskantav dokumendivorming)

# text
seg-98aa544ec4de = Pd / Pfa

# text
seg-0c89f304435e = tuvastamise tõenäosus / valehäire tõenäosus

# text
seg-5bde4fd55ead = PEF

# text
seg-eb11dcb816ff = TEME ja ITRF vaheline süsteem

# text
seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

# text
seg-47cc346307a6 = satelliidi identifikaatorid: SP3 GPS-satelliidi silt, SBAS-i pseudojuhusliku müra number, Galileo satelliidi nimi

# text
seg-6ad2383f8545 = PHARAO

# text
seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite (orbiidil aatomite jahutamisel põhineva aatomkella projekt)

# text
seg-302c8cb738ac = ACES-i tseesiumkell

# text
seg-2e823cd9d9a6 = PL

# text
seg-099bd07ef3cf = kaitsetase

# text
seg-7d7eaa5eb223 = PLL

# text
seg-9272ad22c094 = faasilukustusahel

# text
seg-80e051b734dd = PMC / PMC10301026

# text
seg-1f2a21c5e09f = PubMed Central / üks selle artiklite identifikaatoritest

# text
seg-3e4617444a63 = PM / FM

# text
seg-c79b1246fb61 = faasmodulatsioon / sagedusmodulatsioon

# text
seg-279251adb2eb = müra kella faasis või sageduses

# text
seg-685fc49957e2 = PN

# text
seg-209dacf76ff3 = nagu PN-kaugusmõõtmises

# text
seg-f9cfe4e70f9a = PNG

# text
seg-bde68df8ee7e = Portable Network Graphics (kaasaskantav võrgugraafika)

# text
seg-06998de7b6be = POD

# text
seg-178f55858efb = täpne orbiidi määramine

# text
seg-b7919977bf20 = PPN

# text
seg-ed81960f1282 = parametriseeritud post-Newtoni

# text
seg-9683f98bec2d = PPP / RTK / SPP

# text
seg-73d777100ecd = täpne punktpositsioneerimine / reaalajas kinemaatiline / ühepunktpositsioneerimine

# text
seg-edb97cd7ef8b = PPS

# text
seg-197b06571b4d = impulss sekundis

# text
seg-2619e854281a = PR

# text
seg-66c53cdfc3d9 = tõmbepäring (pull request)

# text
seg-e4dd8a3101cb = PRN

# text
seg-6fb1378e889a = pseudojuhuslik müra (koodinumber)

# text
seg-6f384580af80 = kuidas GNSS-i satelliite signaalides nimetatakse

# text
seg-e8ca48eb958b = PROMETHEE

# text
seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations (eelistuste järjestamise meetod hinnangute rikastamiseks)

# text
seg-d92234e26d53 = PRX

# text
seg-c5774fede0a9 = Physical Review X

# text
seg-8687e6badb6b = ajakiri

# text
seg-78a947083d45 = PSD

# text
seg-6eb799bd1582 = võimsusspektri tihedus

# text
seg-ab1af8b3d968 = vt ülalpool

# text
seg-f7c4f1cff2a4 = PS / SPS

# text
seg-e90e463df4b8 = toimivusstandard / standardne positsioneerimisteenus

# text
seg-2800b3a8cd2e = GPS SPS PS

# text
seg-c8aa5ca0a4ea = PTB

# text
seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt (Saksamaa füüsikalis-tehniline instituut)

# text
seg-611e7e4a34f4 = Saksamaa riiklik metroloogiainstituut

# text
seg-2d4bc9f59158 = PTP

# text
seg-6291d09d3a93 = täppisaja protokoll

# text
seg-44a14eeae3dd = IEEE { "1588" }

# text
seg-bc4ad791804e = PVT

# text
seg-1939c4e19702 = asukoht, kiirus ja aeg

# text
seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

# text
seg-95cead42b0d0 = Rusti ja Pythoni sidumisteek / Python Packaging Authority / Python Package Index

# text
seg-96b2c707a6b8 = Parametry Zemli { "1990" }

# text
seg-3d5012a62544 = GLONASS-i geodeetiline datum

# text
seg-9d14fb150c09 = QA

# text
seg-582cb8ea13ac = kvaliteedi tagamine

# text
seg-7025be647972 = QEMU

# text
seg-d2209c7eea42 = Quick Emulator (kiire emulaator)

# text
seg-d23b9bd48594 = QPSK

# text
seg-45db179e8e49 = kvadratuurne faasmanipulatsioon

# text
seg-b6d487bd53ed = QZSS

# text
seg-c0484340bc52 = Quasi-Zenith Satellite System (kvaasizeniitsatelliitsüsteem)

# text
seg-531943b17837 = Jaapan

# text
seg-697c55525b36 = RAAN

# text
seg-85cd6997e07e = tõusva sõlme rektastsensioon

# text
seg-79e641db1aae = RAFS

# text
seg-9fa6a6b0e193 = RDRR

# text
seg-19b00c5b9270 = Resist–Detect–Respond–Recover (vastu pidada, tuvastada, reageerida, taastuda)

# text
seg-76da7c5bf39a = RethinkPNT/Firesmithi vastupidavusmudel

# text
seg-7bb5ed20c788 = RF

# text
seg-35b036272c8e = raadiosagedus

# text
seg-404104795160 = RHEL

# text
seg-dd1bb2300eb5 = Red Hat Enterprise Linux

# text
seg-34b1e77b1ff0 = RHS

# text
seg-0b4bdbcd1476 = parem pool

# text
seg-f801cff658be = RMS / RSS

# text
seg-6b758beecbfc = ruutkeskmine / ruutude summa ruutjuur

# text
seg-8b2bd83256f1 = RNG

# text
seg-b90957003307 = juhuarvugeneraator

# text
seg-354b42e3a5d0 = RNTF

# text
seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation (vastupidava navigatsiooni ja ajastuse sihtasutus)

# text
seg-43d17f884c69 = ROI

# text
seg-597432415e53 = investeeringutasuvus

# text
seg-7abb945359d0 = RPCF

# text
seg-8c71df162ddd = Resilient PNT Conformance Framework

# text
seg-2f030c1d70c1 = US DHS

# text
seg-82b81c1e28d6 = RTCM

# text
seg-7b855a1075d4 = Radio Technical Commission for Maritime Services (mereside raadiotehniline komisjon)

# text
seg-4a7703f1b605 = selle sõnumistandard kasutab CRC-24Q-d

# text
seg-520c91fa0ef0 = avatud lähtekoodiga GNSS-positsioneerimisteek (reaalajas kinemaatiline teek)

# text
seg-a8b2e577e381 = RTN

# text
seg-6ddf35119d08 = radiaalne, ristsuunaline, normaalsuunaline

# text
seg-b1b635ff08e4 = orbiidiga seotud süsteem

# text
seg-04f4b26e9283 = RW

# text
seg-b8b1a31739aa = juhuslik kõnd

# text
seg-8b593d7d5dbd = nagu nihke juhuslikus kõnnis

# text
seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

# text
seg-928fe3abcd5b = juhusliku kõnni, valge ja flicker-sagedusmodulatsioon / valge ja flicker-faasmodulatsioon

# text
seg-7fced178bcc5 = astmeseaduslikud kellamüra tüübid

# text
seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

# text
seg-0c397d845610 = Microchipi tootenimed (kaks kiibimõõtmelist aatomkella, termostaadiga kvartsostsillaator)

# text
seg-8a1ae00c4a52 = nimed, mitte lühendid

# text
seg-a58426a850fd = SD

# text
seg-d46cb77d53f6 = standardhälve

# text
seg-e29dd726165f = SDD

# text
seg-0ebb68e4b6fd = teenuse määratluse dokument

# text
seg-9415da7a79ab = nagu Galileo OS SDD-s

# text
seg-1022626b788c = SDK

# text
seg-2076da4dd4dd = tarkvaraarenduskomplekt

# text
seg-9fb492bced01 = SDR

# text
seg-1a1082059103 = tarkvaraliselt defineeritud raadio

# text
seg-0a647acd4355 = SDS

# text
seg-d0f6ae60b687 = Space Defense Squadron (kosmosekaitse eskadrill)

# text
seg-c3f6fc1456ed = 18. SDS peab Ameerika Ühendriikide satelliidikataloogi

# text
seg-cf28e3e14401 = SEP

# text
seg-a67fb04e0911 = Päike–Maa–sond nurk (ka sfääriline tõenäoline viga)

# text
seg-0c7631f367e8 = SGD

# text
seg-d58ce1e25c08 = stohhastiline gradientlaskumine

# text
seg-2f25205204e4 = SHM

# text
seg-f2e2253a31b3 = lihtne harmooniline liikumine

# text
seg-b0973ab206ed = SI

# text
seg-35624e5e4630 = rahvusvaheline ühikute süsteem

# text
seg-02aa435dc884 = SIB

# text
seg-262a811c8b69 = ohutusteabe bülletään

# text
seg-b9ee445609f5 = EASA; EASA on Euroopa Liidu Lennundusohutusamet

# text
seg-8d6d4fe3d155 = SINEX

# text
seg-e5c071685532 = Solution INdependent EXchange format (lahendusest sõltumatu vahetusvorming)

# text
seg-3466519e4c62 = geodeetilised lahendused

# text
seg-b21a3d7fb59d = SIR

# text
seg-303809c700e2 = valimi olulisuse põhine ümbervalimine

# text
seg-7a2e0e9cac08 = osakestefilter

# text
seg-6da637028ef8 = SIS / SISA

# text
seg-9779a20e50d2 = ruumis olev signaal / ruumis oleva signaali täpsus

# text
seg-c0e9f44b333d = SITAN

# text
seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation (Sandia inertsiaalne maastikutoega navigatsioon)

# text
seg-ceee87dd4b5e = SLR

# text
seg-c8e722f1609c = satelliidi laserkaugusmõõtmine

# text
seg-76d80b0d2deb = SMAD

# text
seg-7fbda47e3858 = Space Mission Analysis and Design (kosmosemissioonide analüüs ja kavandamine)

# text
seg-dfc105c0178b = õpik

# text
seg-5278559437c5 = SNR

# text
seg-b97c29ce3b37 = signaali ja müra suhe

# text
seg-ff2faf259a15 = SOS / SSE

# text
seg-5a2e327af384 = ruutude summa / jääkide ruutude summa

# text
seg-453c4506fd59 = SOTA

# text
seg-7eaa0caa6916 = tehnika tipptase

# text
seg-127e73a3610b = NIST Special Publication { "1065" }

# text
seg-bedc9a3d8d9f = sama dokument mis NIST SP { "1065" }

# text
seg-cf2491c1a488 = SPD / PD

# text
seg-eade81634bf5 = sümmeetriline positiivselt määratud / positiivselt määratud

# text
seg-5fedf0f7b5c0 = SPDX

# text
seg-3aba3c5a5c19 = Software Package Data Exchange (tarkvarapakettide andmevahetus)

# text
seg-c10b1f20f37e = litsentsiidentifikaatorid failipäistes

# text
seg-b377a91a047f = SPK

# text
seg-5603642c612d = SPICE-i tuum kosmoselaevade ja planeetide efemeriidide jaoks

# text
seg-cf18ba9c86d8 = SPOF

# text
seg-cfab8d8a2cdf = üksik rikkekoht

# text
seg-c06f64211c40 = SQM

# text
seg-7e58d6a4a92c = signaali kvaliteedi seire

# text
seg-a4e75468e6f9 = korrelaatori kujul põhinevad spuufimiskontrollid

# text
seg-0bb7a4875914 = SRIF

# text
seg-82da1a1f1be4 = ruutjuurinfofilter

# text
seg-970edb8ec42f = SRP

# text
seg-ae097fbdabf9 = päikesekiirguse surve

# text
seg-edc814ba451b = SRTM / SRTMHGT

# text
seg-b756bc93d2ea = Shuttle Radar Topography Mission / selle kõrgusfaili vorming

# text
seg-4692354a98de = plaadid nimetatakse nende edelanurga järgi, näiteks N36W117

# text
seg-00f36f1678d6 = SSD

# text
seg-532285d8e6ce = Solar System Dynamics (Päikesesüsteemi dünaamika)

# text
seg-1d8167212f57 = JPL-i rühm

# text
seg-d21315ea8c52 = STEC

# text
seg-84689b829867 = kaldelektronsisaldus

# text
seg-eabee4bfb30e = Systems Tool Kit

# text
seg-a7ff60ab0bd9 = missioonianalüüsi tarkvaratoode

# text
seg-17d792c12885 = Iridiumi positsioneerimis- ja ajastusteenus

# text
seg-3efaadad9c96 = STM

# text
seg-da395fa674ec = olekuülemineku maatriks

# text
seg-d116578b987b = SV

# text
seg-caa37a1e7d12 = kosmoseaparaat (satelliit)

# text
seg-845e6f3a37ec = SVD

# text
seg-e775c436db4b = singulaarväärtuste lahutus

# text
seg-3e5561868a7f = Scalable Vector Graphics (skaleeritav vektorgraafika)

# text
seg-4c48f567e37c = TAES

# text
seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

# text
seg-39b93d9b401a = TC / TM

# text
seg-b0df03cff98a = telekäsk / telemeetria

# text
seg-fafb84a9796a = TDD

# text
seg-ec3b92ad43c3 = testipõhine arendus

# text
seg-40defa915d0d = TDOA / FDOA

# text
seg-e7db8768b023 = saabumisaja / saabumissageduse vahe

# text
seg-aecac9c9d2d0 = passiivse kiirgusallika asukoha määramine

# text
seg-01861b3d63bf = TERCOM

# text
seg-9ef3f9cbbe77 = maastikuprofiili sobitamine

# text
seg-5da9ae904ae0 = TEXBAT

# text
seg-e90183a6fc69 = Texas Spoofing Test Battery (Texase spuufimistestide kogum)

# text
seg-941eccec7400 = salvestatud GNSS-i spuufimisandmed (OAKBAT on samasuguse klassi andmekogum)

# text
seg-e71c15afe44e = TIE

# text
seg-19bfea0d5c88 = ajavahemiku viga

# text
seg-eb12660210bd = TIES

# text
seg-9335f08b6381 = Telecommunication Information Exchange Service (telekommunikatsiooniteabe vahetuse teenus)

# text
seg-12f4af2b48c1 = ITU liikmekontod

# text
seg-c05ba396ac1e = ToA

# text
seg-78a41e672189 = saabumisaeg

# text
seg-7d821e75fdf7 = TOL

# text
seg-4c7600f40479 = tolerants

# text
seg-1f8b3be77dcc = TOPSIS

# text
seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution (eelistusjärjestuse meetod sarnasuse alusel ideaallahendusega)

# text
seg-c9a6058c9715 = TOTDEV / TOTVAR

# text
seg-53a19d838c2d = koguhälve / kogudispersioon

# text
seg-7350da5c5c30 = laiendatud ulatusega stabiilsushinnangud

# text
seg-91d2f49dc7c0 = TPAMI

# text
seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

# text
seg-85692b01a12d = TPL

# text
seg-123ed92776a3 = ajastuse kaitsetase

# text
seg-10c9563602b7 = vt SLOT-TIMING.md

# text
seg-d1e3f93bc0aa = TPS

# text
seg-579b1467ca5f = termokaitsesüsteem

# text
seg-3b7fe44cc552 = TRN

# text
seg-5239a432b919 = maastikupõhine navigatsioon

# text
seg-1df3bcf7eb97 = TR / TN

# text
seg-ef0ff09dc412 = tehniline aruanne / tehniline märkus

# text
seg-643fa447bcee = TU Delft

# text
seg-5c5492ecd86f = Delfti Tehnikaülikool

# text
seg-f3f22590bc57 = TWSTFT / TWTFT

# text
seg-28c80c27a136 = kahesuunaline satelliidi aja ja sageduse edastamine / kahesuunaline aja ja sageduse edastamine

# text
seg-e1a149ff6c43 = UBX

# text
seg-fa0e9838530e = u-blox'i binaarne vastuvõtjaprotokoll

# text
seg-9555546fed38 = UDRE

# text
seg-5fd7aec5beda = kasutaja diferentsiaalse kauguse viga

# text
seg-a3f5dda611b0 = SBAS

# text
seg-b6f0baa6e478 = UERE

# text
seg-4d1cb1c3ade9 = kasutajaekvivalentne kauguse viga

# text
seg-7d87e82154ed = UFFC

# text
seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control (ultraheli, ferroelektrikud ja sageduse juhtimine)

# text
seg-f4da31f92a79 = IEEE Transactions'i väljaanne

# text
seg-573db7b5995b = { "300" } MHz kuni { "3" } GHz

# text
seg-3688c8d84cdc = UI / UX

# text
seg-42162760360f = kasutajaliides / kasutajakogemus

# text
seg-7a56f7e38c5a = ULA

# text
seg-4f4d9da7855c = ühtlane lineaarantennivõrk

# text
seg-db65f4a7586d = ULP

# text
seg-ae7458813685 = viimase koha ühik

# text
seg-d7f4df5a9d13 = ujukomaarvutuse korduvtäpsus

# text
seg-81dc0f4f1b2c = URA / URE

# text
seg-c92cbc3e3954 = kasutaja kauguse täpsus / kasutaja kauguse viga

# text
seg-17e8fb142c6c = URA on terviklikkuse piir, URE on täpsuse ruutkeskmine

# text
seg-1e02dfc0a52b = URL

# text
seg-f726bcd9d4ad = uniform resource locator (ressursi ühtne asukohaviit)

# text
seg-088e05d67af1 = USGS

# text
seg-ffed8eca324d = Ameerika Ühendriikide geoloogiateenistus

# text
seg-1ded2eb40061 = USNO

# text
seg-2b5f7bbe22e9 = Ameerika Ühendriikide mereväe observatoorium

# text
seg-39ed84639c60 = USO

# text
seg-f9f684640e53 = ülistabiilne ostsillaator

# text
seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

# text
seg-ba97a4005ee8 = VIKOR

# text
seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (mitmekriteeriumiline optimeerimine ja kompromisslahendus)

# text
seg-7fe170288e4e = väga pika baasjoonega interferomeetria

# text
seg-2e95d53160df = WAAS / EGNOS

# text
seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service (laialdase ulatusega täiendussüsteem / Euroopa geostatsionaarne navigatsiooni täiendusteenus)

# text
seg-1746693259e0 = SBAS; vt ülalpool

# text
seg-98f4f946a7ac = WASM

# text
seg-257c477dc510 = WebAssembly

# text
seg-eaf260aa0e21 = WASPAS

# text
seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment (kaalutud summa ja korrutise koondhinnang)

# text
seg-c9710476b8b5 = Euroopa Liidu ja Ameerika Ühendriikide satelliitnavigatsioonikoostöö töörühm C

# text
seg-79f0e87410bf = avaldab ARAIM-i viitedokumendid

# text
seg-199e55106e0f = WGCCRE

# text
seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements (kartograafiliste koordinaatide ja pöörlemiselementide töörühm)

# text
seg-d1939d914701 = WGN

# text
seg-6bbc3adc6a53 = valge Gaussi müra

# text
seg-1e422c9001d4 = WGS72 / WGS84

# text
seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" } (ülemaailmne geodeetiline süsteem)

# text
seg-5964aa61f847 = SGP4 kasutab WGS72 konstante

# text
seg-f4ea25131d04 = WHU

# text
seg-7d30c759d92f = Wuhani ülikool

# text
seg-5d028f5e2120 = WSM / WPM

# text
seg-ce407535733f = kaalutud summa mudel / kaalutud korrutise mudel

# text
seg-cc68c85bb2b9 = mitmekriteeriumiline koondamine (WPM tähendab ka valget faasmodulatsiooni; kumb, selgub kontekstist)

# text
seg-9041c866d202 = XML

# text
seg-0e55c3adc568 = Extensible Markup Language (laiendatav märgistuskeel)

# text
seg-93e0e8702167 = XOR

# text
seg-cfa3197f8c1d = välistav või

# text
seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

# text
seg-195082605699 = geomagnetvälja komponendid: põhi, ida, alla, kogu intensiivsus; deklinatsioon, inklinatsioon

# text
seg-94835748fcbb = YAGNI

# text
seg-76430d755d74 = you aren't gonna need it (sul seda ei lähe vaja)

# text
seg-e4e177088376 = disainiprintsiip

# text
seg-565c1908393c = ZHD

# text
seg-77a0948bc15d = zeniidi hüdrostaatiline viivitus

# text
seg-749be52554c5 = Reprodutseeritavus ja litsentsimine

# text
# c1: scenario + seed + version → identical result
seg-d78d9bbb905c = <b>Reprodutseeritav (deterministlik).</b> Sama sisend annab alati bitthaaval identse väljundi — <c1/>. Mingit varjatud juhuslikkust ei ole.

# text
seg-1412347e2298 = <b>Algväärtus (seed).</b> Arv, millega algväärtustatakse (deterministlik) juhuarvugeneraator, et käigud oleksid korratavad.

# text
seg-3a35740e04a8 = <b>Avatud tuum.</b> Ärimudel: mootor on vaba ja avatud lähtekoodiga (AGPL-3.0, allpool määratletud GNU Affero General Public License; kahe litsentsiga, ka kommertslitsents); jätkusuutlik äri on tugi, integreerimine, kommertslitsentsid ja suletud lisandmoodulid — mitte kasutajakohatasud avatud mootori eest.

# text
seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3 — OSI (Open Source Initiative) poolt heaks kiidetud tugeva copyleft-põhimõttega avatud lähtekoodiga litsents. Nagu GPL (GNU General Public License), kuid lisaklausliga (§{ "13" }), mis hõlmab tarkvara, mida pakutakse kasutajatele <b>üle võrgu</b>: üle võrgu kättesaadav muudetud versioon peab pakkuma neile kasutajatele oma vastavat lähtekoodi. Kshana avatud litsents.

# text
# c1: LICENSING.md
seg-f87860d8197d = <b>Kahe litsentsiga levitamine.</b> Sama koodi pakutakse kahe litsentsi alusel, et kasutajad saaksid valida: siin AGPL-3.0 (avatud, copyleft) <b>või</b> Ashforde OÜ (Eesti osaühing) kommertslitsents suletud kasutuseks, mida AGPL ei sobita. Vt <c1/>.

# text
seg-dd5f4a1bbbf5 = Kasutusel ka saidil kshana.dev

# text
seg-9d0c42560a90 = Veebisaidil kasutatavad lühendid, mida ülaltoodud hoidla sõnastikus ei ole.

# text
seg-67a54ce8c89e = Global Positioning System (ülemaailmne positsioneerimissüsteem)

# text
seg-814b0d29bbb2 = kandja ja müratiheduse suhe, dB-Hz

# text
seg-f22a269bc575 = { "1" } kuni { "2" } GHz raadioriba, mida GNSS kasutab

# text
seg-1f4360a0405c = GPS L1 jämedus- ja hankekood

# text
seg-6f7910207534 = täiendatud edastatav signaal (Kuu)

# text
seg-74f02864ce32 = mikroelektromehaanilised süsteemid

# text
seg-0f931242ecc0 = UAS

# text
seg-dddfd223a3b1 = mehitamata õhusõidukisüsteem

# text
seg-7091aabf8b6d = PL · AL

# text
seg-12d88ab45197 = kaitsetase · häirepiir

# text
seg-78134bcc48da = lähenemine vertikaaljuhtimisega, tase I

# text
seg-27328b36b476 = LEO · GEO

# text
seg-b1ae7014a663 = madal Maa orbiit · geostatsionaarne orbiit

# text
seg-c1d933dd3965 = OEM · OMM · TDM

# text
seg-5d0ebe2bc51c = CCSDS-i orbiidi efemeriidi, orbiidi keskmiste elementide ja jälgimisandmete sõnumid

# text
seg-fa9240660ec4 = IGRF

# text
seg-c19fd59fdca0 = DSN

# text
seg-7979317c75d2 = Deep Space Network (süvakosmose võrk)

# text
seg-c194401c2039 = TCXO · OCXO

# text
seg-5c9d0b4c561d = temperatuurikompenseeritud · termostaadiga kvartsostsillaator

# text
seg-f3a7cc221b63 = PHM

# text
seg-08d5cfc5b460 = passiivne vesinikmaser

# text
seg-5ed928b1c6d0 = USO · DSAC

# text
seg-b77f2ea4a521 = ülistabiilne ostsillaator · süvakosmose aatomkell

# text
seg-553814463110 = MTIE · TDEV

# text
seg-2d9b8af50414 = maksimaalne ajavahemiku viga · ajahälve

# text
seg-5b155b60152f = PRTC · ePRTC

# text
seg-93d590e6408d = esmane etalonajakell · täiustatud PRTC

# text
seg-8541a73eef89 = ADEV · σy(τ)

# text
seg-a2ae4a40f486 = Alani hälve keskmistamisajal τ

# text
seg-96fae3b4fb8e = Rahvusvaheline Telekommunikatsiooniliit, telekommunikatsiooni standardimise sektor

# text
seg-24cab92c0fd3 = NIS · NEES

# text
seg-7e82e2927d59 = normaliseeritud innovatsiooni ruut · normaliseeritud hinnangu vea ruut

# text
seg-7175ab55e707 = JSON · CSV · SVG

# text
seg-a9a2906d15de = JavaScript Object Notation · komadega eraldatud väärtused · skaleeritav vektorgraafika

# text
seg-d3a9009a35c0 = CLI · API · IDE

# text
seg-c6418e1f785d = käsurealiides · rakendusliides · integreeritud arenduskeskkond

# text
seg-8df86177107a = SBOM · SLSA

# text
seg-e54326c78ab0 = tarkvara koostisosade loend · Supply-chain Levels for Software Artifacts

# text
seg-347b23148b8f = NDA

# text
seg-969d2489de28 = konfidentsiaalsuslepe

# text
seg-564cfa0d3084 = Digital Object Identifier (digitaalse objekti identifikaator)

# text
seg-5cbd99859d90 = C/N₀ juga

# text
seg-ed4a9e041a83 = diagramm kandja ja müratiheduse suhtest satelliidi kohta aja jooksul

# text
seg-1cb49c7e6c7f = HPL · VPL

# text
seg-ccdc7d672c8f = horisontaalne · vertikaalne kaitsetase

# text
seg-c7a40ebac7e1 = LROC

# text
seg-529f02f85a76 = Lunar Reconnaissance Orbiteri kaamera

# text
seg-c5da9d350518 = <s1>Eelmine</s1>Mõistete lühikursus

# text
seg-670504be0531 = <s1>Järgmine</s1>Stuudio juhend
