# docs--verification-matrix: translations (et)

# text
seg-619f89bf160c = Kuu tugisüsteemi realisatsioon

# text
seg-2db69c58f694 = Kuu diferentsiaalne PNT

# text
seg-1ff1d8ebf1e7 = Compliance-kaardistus avalike raamistikega

# text
seg-aab745a65e76 = Moodul

# text
seg-d6476863f862 = Võimekus

# text
seg-ad856ad710eb = Staatus

# text
seg-60a43431ebe0 = Nõue

# text
seg-cbf0f9bcd2d8 = Oraakel (sõltumatu etalon)

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
seg-a6bd60ed728f = Euroopa GNSS-teenuskeskuse avaldatud ametlikud Galileo OSNMA testvektorid Receiver Guidelines lisana (Test_vectors.zip, sha256 ef9b9afc6ef9e1c57393415cf2a1dc80c4035e7c06123907ea0bb97dd3ccf370): { "18" } komplekti { "18" }-st, { "186,382" } silti autenditud, { "0" } ebaõnnestunud, käivitatud võrguühenduseta 2026-10-10 (tõendikirje kshana-pro docs/evidence all). Ulatus: vektorid kontrollivad krüptograafilist verifitseerimist (Merkle, KROOT/ECDSA, TESLA ahel, MACK sildid, ADKD 0/4/12) ja selle tulemusi avaldatud stsenaariumidel; nad kasutavad ainult HMAC-SHA-256, SHA-256 ahelat, 128-bitiseid võtmeid, 40-bitiseid silte ja otsingukirjeid { "33" } ning { "34" }, seega katavad CMAC-AES, SHA3-256 ahelaid ja muid parameetreid ainult avaldatud primitiivide teadaoleva vastuse testid ja sünteetilised testid. Usaldusväärse aja, andmesideme, aegumise ja päise kinnituse tugevdust testivad sünteetilised ründetestid, mitte välise oraakli (sõltumatu etalon) abil. Ei kontrollita: sertifikaaditühistusnimekirju, reaalajasignaale ega reaalajavastuvõtjat (UBX sõnaskeemi kontrollitakse ainult sünteetilistel kaadritel), SHA3-256 Merkle'i puid, värskust ilma sõltumatu ajata. Ei ole EL teenus

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
seg-a83c68500982 = Kolm sõltumatut tööriista, eelregistreeritud (0123cee1) enne mis tahes fikstuuri või oraakli (sõltumatu etalon) väljundi olemasolu, tolerantsid fikseeritud siis. ({ "1" }) ARAIM: Stanford MAAST for ARAIM { "2" } (commit ab70e2a3, BSD-3) mhss_raim_baseline_v5.m, käivitatud eraldi programmina GNU Octave { "8.4" } all draiveripoolse unique() ühilduvuskihiga (avalikustatud, algoritmi muutmata), ADD TOL_PL juures { "0.05" } m: Rust reprodutseerib ADD viiterealisatsiooni { "270" } päris juhtumil. Avalikustatud: Kshana ADD tee kirjutati pärast eelregistreerimist, järgides ADD-d nii, nagu MAAST seda realiseerib; ülevaataja sõltumatu suletud komplekt (holdout) ({ "270" } uut kasutajageomeetriat ja teine terviklikkuse tugisõnum, MAAST uuesti käivitatud külmutatud koodi vastu) läbis sama läve. ({ "2" }) Hetktõmmise RAIM: RTKLIB v2.4.2-p13 (BSD-2) estpos/valsol/raim_fde eraldi C-harnessis tuvastamise ja välistamise jaoks; kaldega PL RTKLIB matinv/xyz2enu pluss SciPy { "1.18.1" } chi2/ncx2, kus mõlemad pooled hindavad sama kinnist kuju (Brown; Parkinson ja Axelrad), seega PL kontroll katab realisatsiooni, mitte valemit. ({ "3" }) SBAS: Stanford MAAST (commit 7d32b049) usr_vhpl, muutmata, MAAST-i enda salvestatud WAAS-i edastustel: L1 tasemed { "1e-4" } m piires pärast K-skaleerimist ja võrdne kaitstud hulk. Samad võrdlused andsid võimekuses nimetatud leiud: ühtlase sigmaga ARAIM funktsioonid ei järgi ADD-d ning L5 hulga võrdsus ebaõnnestub { "308" } paaril, kus GEO nähtaval ei ole (tasemed { "3267" } paaril, mida mõlemad tööriistad kaitsevad, ühtivad täpsusega { "1e-13" } m). DO-229E/DO-316 K-tegurid on ümberkirjutatud konstandid ja päris geomeetria on sisend; kumbagi ei loeta sõltumatuks etaloniks. Redaktsioon { "0.30" }: snapshot_raim kaitsetasemed liikusid radiaalselt geodeetilisele kohalikule tasemele (kuni { "0.31" } m HPL ja { "0.14" } m VPL laiuskraadil { "16" } kraadi N)

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
seg-26c2db527cec = Orekit { "12.2" } (Apache-2.0) SolarRadiationPressure.getLightingRatio WGS-84 ja sfäärilise OneAxisEllipsoid varjutava kehaga, käivitatud eraldi programmina Päikesega fikseeritud samas inertsiaalses asukohas. Läved eelregistreeritud failis xval/srp-oblate-shadow-orekit/PREREGISTRATION.md (6d6d269c): { "1e-6" } mõlemal ja > { "1e-2" } lapiku-vs-sfääri hajuvus; kõik täidetud. Ellipsoidi telg on mõlemal poolel inertsiaalne z-telg (pretsessiooni-nutatsioonita)

# text
seg-01066d639b39 = Kast-tiiva ja ECOM2 päikesekiirguse rõhk osatuletistega (valikuline)

# text
seg-2a5fc9708bd0 = Mitte-kahurikuuli SRP: kast-tiiva lamepaneeli mudel (Vallado eq. 8-44; ühepoolsed keha paneelid, päikesele suunatud tiivad) koos GSC satelliidi metaandmete Galileo FOC, IOV ja IOV eluea lõpu tabelitega, nominaalse GNSS-i yaw-suunamisega, analüütiliste osatuletistega kiirgusteguri ja iga paneeli peegeldus- ja hajuskoefitsientide jaoks; ning ECOM2 empiiriline mudel (D2/B1) selle osatuletistega. Kast-tiib on valikuline Cowelli propageerijal (propagator::ForceModel::box_wing_srp, seades selle välja srp_boxwing) ja täppisorbiidi määramise mudelil (precise_od::PreciseForceModel::box_wing_srp), asendades kahurikuuli liikme cr-iga kui kiirgusteguriga; mõlemad on vaikimisi None, jättes iga olemasoleva tee baidi baidi haaval identseks. ECOM2 ei ole jõumudelisse ühendatud

# text
seg-8f1d7126375c = Orekit { "12.2" } (Apache-2.0) BoxAndSolarArraySpacecraft FixedPanel ja PointingPanel-iga, SolarRadiationPressure(dRef = { "1" } au, pRef = 1361/c), GenericGNSS nominaalne yaw ja ECOM2(nD = { "2" }, nB = { "1" }), käivitatud eraldi programmina Päikesega fikseeritud inertsiaalsetes asukohtades; kiirgusteguri tuletis Hipparchus Gradient-ist, paneeli kaupa tuletised Orekiti tsentraalsete vahedena (Orekitil neid ei ole). Läved eelregistreeritud failis xval/srp-boxwing-orekit/PREREGISTRATION.md (e59df6bf), enne mis tahes Orekiti väljundi olemasolu: { "1e-12" } suhteline ({ "1e-11" } otsast otsani, { "1e-9" } vahede jaoks); kõik täidetud (RESULTS.md). VALIDATED katab ainult mudeli hindamise: GSC tabelid on ümberkirjutatud sisendid ning kast-tiiva sobivus päris Galileo orbiitidele, termiline taasemissioon, modifitseeritud madala-beta yaw-seadus ja varjutuspöörded ei ole kaetud; Galileo SRP prognoos jääb MODELLED

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
seg-80963ee0de61 = pymsis { "0.13.0" } (MIT) version={ "0" }, mis käitab NRL Fortrani GTD7D ühekordse täpsusega, ja NRLMSISE-00 C port (väljaanne { "20190709" }, avalik domeen) kompileeritud eraldi programmina, pluss C distributsiooni { "17" } avaldatud testväljundit. Läved eelregistreeritud failis xval/nrlmsise00-pymsis/PREREGISTRATION.md (e90ae26a) enne pordi olemasolu; kõik täidetud (RESULTS.md). Kontrollib porti, mitte mudeli täpsust mõõdetud tiheduse vastu

# text
seg-12977f65b2ea = NRLMSISE-00 pidurdustiheduse tase (valikuline)

# text
seg-17aec847b675 = forces::DensityModel (Exponential vaikimisi, Nrlmsise00 { "{" } f107a, f107, ap { "}" }) ja propagator::ForceModel::drag_density: ruuttakistus kaaspöörleva atmosfääri suhtes NRLMSISE-00 tihedusega WGS-84 geodeetilises punktis (Maa pöörlemisnurk UT1 = TT-ga, kohalik päikeseaeg UT + lon/15), konstantne kosmoseilm mudeli kohta; vaikimisi väljas ja bitiidentne

# text
seg-3878bf3b62d7 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 DragForce-iga üle Orekiti enda NRLMSISE00 realisatsiooni, käivitatud eraldi programmina sama Maa pöörlemisnurga raami, WGS-84 kuju, kohaliku päikeseaja konventsiooni (keskmine Päike) ja TT kui UT-ga; konventsiooni seadistust kontrolliti oraakel (sõltumatu etalon) sõltumatu etaloni vastu (Orekit vs pymsis, { "5.2e-5" } tiheduses). Läved eelregistreeritud failis xval/drag-tier-orekit/PREREGISTRATION.md ({ "21647478" }): { "0.5" } m + { "1e-3" } pidurdusnihkest ja kaks > { "100" } m tundlikkuskontrolli; kõik täidetud. Ei ole kaetud: mudeli täpsus mõõdetud tiheduse vastu, ajas muutuv kosmoseilm, GMAT-i haru

# text
seg-1ac7430e88fc = Vaikimisi eksponentpidurdus sõltumatu realisatsiooni vastu (ekvatoriaalne)

# text
seg-a9c41b03f2ca = Cowelli propageerija vaikepidurdus: ruuttakistus kaaspöörleva atmosfääri suhtes funktsiooniga forces::atmospheric_density, Vallado tabeli 8-4 tükiti eksponentsiaalse tabeliga sfäärilisel kõrgusel (propagator::ForceModel::drag vaikimisi Exponential variandiga forces::DensityModel)

# text
seg-e2e177761b30 = GMAT R2022a (NASA GSFC, Apache-2.0) GmatConsole Exponential atmosfääriga (sama 28-ribaline tabel), punktmassiga Maa ja PrinceDormand78, käivitatud, mitte kunagi hoidlasse kopeeritud. Läved eelregistreeritud failis xval/drag-exponential-gmat/PREREGISTRATION.md (640c85c1) kummagi poole pidurdusnihkel (pidurdusega miinus pidurduseta käivitus), mis tühistab kaks Maa mu väärtust ja integraatorit; kõik täidetud (RESULTS.md). GMAT võtab geodeetilise kõrguse ja kshana sfäärilise kõrguse: need langevad kokku ainult ekvaatoril, seega VALIDATED katab ekvatoriaalseid orbiite; väljaspool ekvaatorit mudelid erinevad kavandi järgi ({ "10.4" } % { "24" } h nihkest { "51.6" } kraadi, { "400" } km juures). GMAT-i avalikul versioonil ei ole NRLMSISE-00 (plugin puudub), seega NRLMSISE-00 tasemel on ainult Orekit oraakel (sõltumatu etalon). Tabeli täpsust mõõdetud tiheduse vastu ei kaeta

# text
seg-9e15970435c3 = DE440 Päike ja Kuu Cowelli jõumudelis (valikuline)

# text
seg-de6831cf7785 = Valikuline efemeriiditase numbrilise Cowelli ForceModel kolmanda keha ja SRP liikmetele: geotsentriline Päike ja Kuu mis tahes EphemerisProvider-ist (DE440 SPK kernel läbi KernelEphemeris) hetkel TDB = TT + (TDB - TT), keeldudes pakkujast, kes ei suuda epohhi teenindada, ja loendades iga tagasilanguse analüütilisele reale; vaikimisi väljas

# text
seg-50027b9f4251 = Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 ThirdBodyAttraction ja SolarRadiationPressure-iga Orekiti enda DE440 lugejal (orekit-data lnxp1990.440), käivitatud eraldi programmina; kshana loeb bitthaaval, SPICE-ga kontrollitud lõiku NAIF de440s.bsp-st. Läved eelregistreeritud failis xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Orbiidi lävi ({ "0.5" } m) ja tundlikkuskontroll on täidetud, kuid Päikese/Kuu asukoha lävi ({ "3" } m / { "0.2" } m) jäi täitmata väärtustel { "6.39" } m / { "0.244" } m. SPICE, mis loeb sama kernelit selle täpsel TDB-l, jääb Orekitist mööda sama suuruse võrra ({ "6.25" } m / { "0.240" } m), seega lõhe asub NAIF de440s tee ja Orekiti DE440 lugeja või ajaskaala vahel; põhjust ei isoleeritud. Registreeritud ja kinnitatud, seega rida jääb MODELLED

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
seg-4745148b6c60 = Biancale ja Bode, GFZ Scientific Technical Report STR06/01 ({ "2006" }), tabel { "5" }, mudel A2: Ray ({ "2001" }) avaldatud täielikult normaliseeritud harmoonilistes siinus-eesmiste faasidega, sama mudeli sõltumatu esitus. Eelregistreeritud failis xval/s2-air-tide-fix/PREREGISTRATION.md (5e31c37a) koos parandusega, mida see kontrollib. Katab ainult koefitsientide teisenduse; õhuloodete geopotentsiaali mõjul puudub väline oraakel (sõltumatu etalon)

# text
seg-444f0a65b6fd = Tesseraalne geopotentsiaal Cowelli propageerijas

# text
seg-ad475816bc78 = Valikuline EGM2008 tesseraalväli (kuni astme/järguni { "70" }) numbrilise Cowelli ForceModel'i tsentraalse raskusjõuna, arvutatuna Maaga seotud süsteemis, mida pööratakse IAU { "2000" } Maa pöördenurga (või CIO GCRS-ITRS ahela) järgi; vaikimisi väljas, seega ükski olemasolev väljund ei muutu

# text
seg-e6db530c96c7 = Orekit { "12.2" } (CS GROUP, Apache-2.0) NumericalPropagator/DormandPrince853 koos HolmesFeatherstoneAttractionModel'iga samadel koefitsientidel (tools/egm2008_to70.gfc) kehasüsteemis, mida pööratakse sama Maa pöördenurga valemi järgi, käivitatuna eraldi programmina. Läved eelregistreeritud (f0e0e65, enne mis tahes võrdlust muudetud failis 2da899a): |dr| <= { "0.5" } m ja |dv| <= { "5e-4" } m/s ning mõlemad negatiivsed kontrollid möödas > { "100" } m võrra; kõik täidetud, seejärel karmistati läved väärtustele { "0.1" } m ja { "1e-4" } m/s. Valideerimata: Maa orientatsiooni täpsus (mõlemad pooled kasutavad Era-süsteemis UT1 = TT ilma prekessiooni-nutatsioonita), Cio-süsteemi valik (ainult sisekontroll), astmed üle { "70" }

# text
seg-e8f5ff8c9149 = Kõrge astmega sfääriliste harmooniliste raskusjõud (EGM2008 kuni { "2190" })

# text
seg-d3b2f32dcecb = Ületäitumiskindel ja poolusekindel täielikult normaliseeritud välja arvutus kuni astmeni { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modifitseeritud edasisuunaline veerg, kus gradient on vaba 1/cos phi-st), voogedastuslik ICGEM .gfc laadija (from_gfc_file / from_gfc_reader; täielik EGM2008 tõmmatakse käitusajal, seda ei komplekteerita kaasa) ning Holmes-Featherstone'i arvutaja, mis on valitav valikulisel Cowelli Geopotential'il

# text
seg-8651532685f3 = Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel ja pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, käivitatud eraldi programmidena; läved eelregistreeritud failides xval/high-degree-gravity/PREREGISTRATION.md (276c869f) ja xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit nõustub kõikjal, kus see on määratletud, kuid pyshtools jääb oma eelregistreeritud lävest kahes polaarpunkti lähedases punktis mööda (kuni { "7.3e-10" } m/s^{ "2" }; 50-kohaline mpmath'i kontroll paigutab vea pyshtoolsi), polaarteljel endal puudub oraakli (sõltumatu etaloni) väärtus ning { "24" } h orbiidi eelregistreeritud astme 70 tundlikkuskontroll jäi mööda ({ "0.726" } m versus > { "1" } m). Iga möödalask on registreeritud, mitte ära häälestatud, seetõttu jääb rida MODELLED

# text
seg-e81b7418c382 = DOP853 integraator

# text
seg-e6e3638aa68e = Hairer DOP853 { "8" }({ "5,3" }) selgesõnaline Runge-Kutta ühendatud 5. ja 3. järku veahinnanguga, SciPy/Hairer sammukontrolleriga, automaatse algsammuga, tõrkel sulgeva sammukaitsega ja 7. järku tiheda väljundiga; valitav propagaatori Integrator-variandina Dop853 / propagator::propagate_dop853

# text
seg-6ea79a5b89e9 = SciPy { "1.18.1" } (BSD-3-Clause) solve_ivp(method=DOP853) ja selle üksiksammu, veanormi, tiheda väljundi ning algsammu rutiinid, sõltumatu teostus; täpsed kahe keha olekud mpmath'ist { "1.3.0" } { "40" } kohaga. Läved eelregistreeritud failis xval/dop853-scipy/PREREGISTRATION.md (ae1b25e) enne esimest võrdlust; kõik täidetud (xval/dop853-scipy/RESULTS.md). SciPy esimene samm antakse täisjooksudes mõlemale lahendajale; algsammu rutiini võrreldakse eraldi. Katmata: RKF7({ "8" }), jäikuse tuvastamine, sündmuse asukoha leidmine

# text
seg-9ad7c1f4da77 = Robustne Kepleri võrrandi lahendaja

# text
seg-4b9d812fd13e = Elliptiline Kepleri lahendaja kõigile { "0" } <= e < { "1" } ja kõigile keskanomaaliatele: Markley ({ "1995" }) kuupstarter ja viiendat järku parandus, tühistumisvaba jääk (1-e)E + e(E - sin E) - M ning kaitstud Newtoni lihvimine (kepler::solve_kepler_markley, propagator::solve_kepler_robust)

# text
seg-6fedaf34608d = mpmath { "1.3.0" } (BSD-3-Clause) 50-kohalised juured täpsetest kahendsisenditest. Läved eelregistreeritud failis xval/kepler-mpmath/PREREGISTRATION.md (df22174), väljendatud suhtes |E|-ga koos e -> { "1" }, M -> { "0" } konditsioneeritusargumendiga; kõik täidetud (xval/kepler-mpmath/RESULTS.md). Päranduslahendajad (solve_kepler_checked, orbit::solve_kepler, ephem::solve_kepler) on arvuliselt muutmata, sest salvestatud väljundid sõltuvad neist, ning neid see rida ei kata

# text
seg-1960804ef2f4 = Kauguskiiruse ja az/el partii orbiidi määramine jaama maskeerimisega

# text
seg-4c185244bc66 = Epohhi oleku taastamine segatud kauguse, kauguskiiruse ning asimuudi/tõusunurga jälgimisest üle tõusunurga maski Gauss-Newtoni meetodil H = (dh/dx(t)) Phi(t, t0): analüütilised mõõtmise osatuletised ja variatsiooniline olekuüleminekumaatriks analüütiliste kahe keha + J2 osatuletistega (RK4-integreeritud, mitte suletud kujuga olekuüleminekumaatriks)

# text
seg-6c6a42c25433 = Orekit { "12.2" } (Apache-2.0) BatchLSEstimator kohandatud hetkeliste geomeetriliste RangeRate ja AzEl mõõtmistega (ristkontrollitud Oreliti TopocentricFrame'iga), käivitatud eraldi programmina identsetel maskeeritud, algväärtustatud (seed) vaatlustel. Läved eelregistreeritud failis xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Kõik läved täidetud peale B4, müravaba oleku kokkulangevuse { "1" } cm, mis jäi mööda { "2" } stsenaariumil { "4" }-st ({ "1.46" }, { "1.74" } cm): Oreliti enda müravaba hinnang asub oma simuleeritud tegelikust väärtusest nii kaugel (põhjust Oreliti poolel ei eraldatud). Registreeritud ja kinnitatud, seetõttu jääb rida MODELLED. Modelleerimata: valguse levi aeg, aberratsioon, refraktsioon, Maa pöörlemine, nende mõõtmistüüpide jaoks järjestikune filter

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
seg-08590d67a7d3 = pyshtools { "4.14.1" } (BSD-3-Clause), mis loeb samu PDS-faile ja arvutab punktraskusjõudu, käivitatud eraldi programmina, ning avaldatud PDS-toodete päised ja sildid. Läved eelregistreeritud failis xval/planetary-gravity-pyshtools/PREREGISTRATION.md (32c5b50); kõik täidetud (RESULTS.md). Andmed: NASA PDS Geosciences Node, avalik omand; astme 20 väljalõiked on kaasas koos failiga NOTICE, täisfailid tõmmatakse testi ajal

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
seg-1575dc4cfb4a = CODE GIM-i trükitud väärtused (täpsed igas sõlmes; kaart tõmmatakse testi ajal, seda ei kaasata, kuna selle litsents on kinnitamata) ja sõltumatu Pythoni standardteegi uusteostus IONEX { "1.0" } interpolatsioonivalemitest, mis on fikstuuriga koos commit'itud (läved eelregistreeritud e4d8b1f, { "1e-9" } TECU). Kolmanda osapoole kontroll (B6, eelregistreeritud, esimene jooks): RTKLIB v2.4.2-p13 iontec (BSD-2-Clause, käivitatud eraldi tööriistana) { "6885" } päringupunktis nõustub IonexFile::vtec_at-iga täpsusega { "3.6e-13" } TECU mõlemas interpolatsioonirežiimis { "1e-5" } TECU läve vastu. Andmetega piiratud: CODE GIM tõmmatakse testi ajal, SHA-ga kinnitatud; RTKLIB loeb täisfaili, sest selle getindex lükkab laiuskraadi väljalõike tagasi. tests/fixtures/ionex_code_gim/fetch.sh tõmbab selle ja kontrollib SHA-256, test ebaõnnestub mis tahes muude baitide korral, ja run_rtklib.sh on dokumenteeritud reprodutseerimistee (vajab võrguühendust). Tõstetud tasemele VALIDATED omaniku otsusega andmetega piiratud tõendite põhjal (2026-10-13)

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
seg-687b3b159691 = Sama päeva IGS-i RINEX { "3" } ühendatud edastatud fail (avaldatud andmed, kirjutatud teise failigeneraatoriga samadest edastatud sõnumitest); läved eelregistreeritud failis tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md (7aa264b) enne esimest jooksu

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
seg-06d500099814 = Eelregistreeritud (7aa264b, 110fef9) IGS MGEX täppisorbiidi vastu koos GEO-dega; sellist toodet ei olnud seda koostanud seansist kättesaadav, seega võrdlus on ootel ja rida on MODELLED (kontrollitud ainult avaldatud nominaalsete GEO slottide vastu)

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
seg-e0cc33dfb10b = Mõõdetud JPL Horizonsi rekonstrueeritud CAPSTONE efemeriidi vastu (NAIF -1176, CAPSTONE_merged, Kuu keskne ICRF, 2023-03-01..31 sammuga { "10" } min), commit'itud bait baidi haaval (tests/fixtures/capstone_horizons/, NOTICE.md), eelregistreeritud { "4e868170" } enne tõmbamist, mõõtmisena lävedega keskmisele geomeetriale. Mitte valideerimine: CR3BP jätab välja Päikese, Kuu ekstsentrilisuse ja jaamas hoidmise, mida CAPSTONE tegi, seega läved kirjeldavad, kui esinduslik mudelorbiit on, mitte täpsust. Tulemused: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-c866a5bd4318 = CR3BP pöörlevad olekud kaardistatud Kuu keskseks ICRF-iks DE440 Maa–Kuu joonel

# text
seg-ab90c8689c0f = cr3bp::to_moon_centred_icrf kaardistab mõõtmeteta Maa–Kuu CR3BP pöörleva oleku Kuu keskseks ICRF asukohaks ja kiiruseks hetkelisel Maa–Kuu joonel (pikkusühik Maa–Kuu kaugus, ajaühik pöördvõrdeline orbitaalkiirus, süsteemi täielik nurkkiirus sealhulgas selle tasandiväline kiirus Kuu kiirendusest), pöördfunktsiooniga from_moon_centred_icrf, ja cr3bp::to_moon_centred_icrf_de440 loeb geotsentrilise Kuu oleku DE440 SPK-st. See kaardistab olekuid; see ei tee CR3BP orbiidist efemeriidimudeli orbiiti

# text
seg-d91ce10ea439 = NAIF SPICE Toolkit (CSPICE N0067 läbi spiceypy { "8.3.0" }) kahevektorise dünaamilise süsteemi sxform (primaarne +X piki Kuu asukohta Maa suhtes, sekundaarne +Y piki selle kiirust, de440s), rakendatud mõõtmetega pöörlevale olekule, mis on ehitatud SPICE'i enda Kuu olekust, eraldi programmiga, mis ei kutsu ühtegi Kshana koodi (tests/fixtures/cr3bp_to_mci_spice/, NOTICE.md). Eelregistreeritud 2313eb1b, enne mis tahes jooksu muudetud failis d5ef79b3, et lisada süsteemi tasandiväline nurkkiirus (ilma selleta oleks kiirus kuni { "8e-2" } m/s vigane). Ainult teisenduse teegikontroll. Tulemused: docs/design/evidence/rm34-cr3bp-to-mci/RESULTS.md

# text
seg-d543e3e84f36 = Päikesesüsteemi stsenaariumi liik JPL kernelil (planetary_kernel_path)

# text
# c1: solar-system
seg-e8a96f29afc7 = Stsenaariumi liik <c1/> koos planetary_kernel_path-iga: iga raporteeritud keha, mille enda NAIF koodi SPK sisaldab, võtab oma heliotsentrilise J2000 asukoha ja kiiruse kernelist mootori enda lugeja kaudu (silt KERNEL), link, mille mõlemad otsad on kernelis, arvutatakse sellel, barütsentreid ei asendata kunagi planeediga ja iga muu keha jääb analüütiliseks oma sildiga; aruanne saab kernel'i ploki (tee, SHA-256, sellest võetud kehad ja lingid) ainult siis, kui valik on seatud. De440s.bsp-ga on selleks Merkuur, Veenus, Maa ja Kuu

# text
seg-05cc6642285b = NAIF SPICE Toolkit (CSPICE N0067 läbi spiceypy { "8.3.0" }) spkezr heliotsentrilised olekud täielikul de440s.bsp-l, eraldi programm, mis ei kutsu ühtegi Kshana koodi (tests/fixtures/solar_system_kernel/, NOTICE.md); mootor loeb de440s lõikeid bitipõhiselt. Eelregistreeritud f8e946ea. Ühenduse teegikontroll: DE440 ennast ja analüütilisi kehasid siin ei valideerita. Tulemused: docs/design/evidence/cap31-solar-system-kernel/RESULTS.md

# text
seg-7f3d53b4e8d1 = Porkchop DE440 efemeriidil

# text
seg-bd813d7e0b58 = maneuver::porkchop_kernel: stardikuupäeva x saabumiskuupäeva pühkimine väljumise C3 (km²/s²) ja saabumise V-infinity (km/s) üle ühe tiiru päripäeva Lamberti lahendaja ja { "0.5" } kraadise kollineaarsuskaitsega, mis tahes kahe NAIF keha heliotsentrilistel J2000 olekutel, mis on loetud JPL DE440 SPK-st paketi enda lugejaga. Üks tiir, päripäeva, ilma kanderaketi või saabumispiiranguteta: pühkimine, mitte missiooni disain

# text
seg-bd19ca214f29 = NAIF SPICE Toolkit (CSPICE N0067 läbi spiceypy { "8.3.0" }) heliotsentrilised olekud de440s.bsp-l ja pykep { "3.0.1" } lambert_problem (ESA, C++ kep3 tuum, MPL-2.0), sõltumatu Lamberti lahendaja, käivitatud eraldi programmina, mis ei kutsu ühtegi Kshana koodi (tests/fixtures/porkchop_de440/, NOTICE.md); mootor loeb de440s lõiget bitipõhiselt. Eelregistreeritud 2d857fb1. Pühkimise teegikontroll. Tulemused: docs/design/evidence/cap20b-porkchop-de440/RESULTS.md

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
seg-77c43836cafe = pykep { "3.0.1" } lambert_problem (ESA, C++ kep3 tuum, MPL-2.0), sõltumatu teek, käivitatud eraldi programmina skriptiga scripts/gen_lambert_multirev_ref.py; commit'itud on ainult selle arvuline väljund. Eelregistreeritud a75de851 (juhtumite komplekt, läved, tulemuse reegel) enne mis tahes võrdlust; etalon genereeriti sõltumatult uuesti ja on baidi haaval identne. Tulemused: docs/design/evidence/lambert-multirev/RESULTS.md

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
seg-ec12724c3c04 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; SOFA algoritmid, nagu ERFA projekt need välja andis), sõltumatu teek: erfa.dtf2d("UTC"), erfa.utctai ja erfa.taiutc commit'itud hetkedel, vahe moodustatud osade kaupa kaheosalistel kuupäevadel, lävi { "1e-6" } s fikseeritud enne jooksu (eelregistreeritud e947e69d). Halvim vahe { "9.6e-12" } s (dtf2d) ja { "1.9e-11" } s (utctai, taiutc). Iga UTC päev, mida käsitletakse kui { "86 400" } s, või liigpäeva murdosa, mis jäetakse skaleerimata, muudab testi punaseks. UT1 TAI kaudu (iauUtcut1) kontrollitakse Maa orbiidi tee rea ERFA harus. Ulatus: UTC alates 1972-01-01; varasemat triiviva kiirusega UTC-d ei modelleerita

# text
seg-f1c7bc235a6b = Kaheosalised Juliuse kuupäevad Maa pöörlemiseni orbiiditeel

# text
seg-cee11d4bad08 = Maa pöörlemine kaheosalisest UT1 Juliuse kuupäevast orbiiditeel, et Maaga seotud asukoht säilitaks mikrosekundi, mille üksik f64 kuupäev kaotab (umbes { "3e-9" } rad ümber { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, TEME konventsioon, kahel osal), cio::gcrs_to_itrs_matrix_jd2 (CIO GCRS-ITRS maatriks Maa pöördenurgaga kahest osast) ja nendele toetuvad ning sisemiselt kontrollitud frames::teme_to_itrf_jd2 / itrf_to_teme_jd2, orbit::Propagator::position_in_frame_jd2 ja own_jd2_utc, efemeriidistsenaariumi valikuline two_part_jd (ECEF asukoht, maapealne jälg ja jaama vaade; vaikimisi väljas, muutmata) ning kadudeta From teisendused jd2::Jd2 ja timescales::TwoPartJd vahel. Prekessioon-nutatsioon ja Cowelli jõumudeli epohh jäävad üksikuks f64-ks, kus { "40" } us ümardus on alla { "1e-15" } rad või kaugelt alla analüütilise Päikese/Kuu efemeriidi vea

# text
seg-a658c7b16d6d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; SOFA algoritmid, nagu ERFA projekt need välja andis), sõltumatu teek: gmst82 ja c2t06a commit'itud kaheosalistel kuupäevadel, polaarliikumine { "0.1" } ja { "0.3" } kaaresekundit. Eelregistreeritud b10475ee (kuupäevad, läved) enne funktsioonide kirjutamist ja enne oraakli (sõltumatu etaloni) käivitamist. Sisemised testid (stsenaariumi valik, TEME/ITRF ringkäik, tüüpide teisendused) on toetav isekooskõla

# text
seg-096df3971f5f = Süsteemimaatriksid ERFA vektorite vastu: IAU { "2006" } nihke-prekessioon, TEME GCRS-iks ja CIO ahel taevapooluse nihetega

# text
seg-731a5ed967b3 = Kolm süsteemimaatriksit, mida võrreldakse ERFA-ga element-elemendi haaval või pöördenurga järgi suvalistel epohhidel: precession::precession_matrix (IAU { "2006" } nihke-prekessioon Fukushima-Williamsi nurkadega), nutation::teme_to_gcrs_matrix (TEME GCRS-iks pööre P^T N^T Rz(-EE) IAU { "2006" } prekessiooni, IAU 2000B nutatsiooni ja ekvinoktsiumide võrrandiga selle kahe peamise täiendava liikmega) ja cio::gcrs_to_cirs_matrix_with_offsets (GCRS CIRS-iks pööre IERS taevapooluse nihetega dX, dY, mis lisatakse mudeli CIP X, Y-le enne pööret, SOFA kokaraamatu konventsioon; uus). Mudelivalikuid endid (2000B nutatsioon TEME teel, kahe liikmega täiendav rida) ei valideerita, ainult nende teostust

# text
seg-411cd8622b4d = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; SOFA algoritmid, nagu ERFA projekt need välja andis), sõltumatu teek: pmat06; numat(obl06, nut00b) ekvinoktsiumide võrrandiga eect00-st (täielik täiendav rida), koostatud kujul P^T N^T Rz(-EE); xys06a, seejärel c2ixys(X + dX, Y + dY, s). Eelregistreeritud 979c1e39 (epohhid, nihked ja läved) enne oraakli (sõltumatu etaloni) käivitamist. { "1.1e-10" } rad TEME jääk on kahe täiendava liikme säilitamise ennustatud mõju (umbes { "3" } mm GNSS orbiidil)

# text
seg-4e2fe2e3dabb = Enne 1972. aastat UTC (triiviva kiiruse ajastu) kaheosalisel Juliuse kuupäeva ajateel

# text
seg-1d086e669f09 = UTC alates 1960-01-01 kuni 1971-12-31, kui UTC kulges TAI-st nihkekiirusega ja astus sekundi murdosade kaupa, kaheosalisel Juliuse kuupäeva teel: TAI - UTC iga perioodi triivitabelist (timescales::tai_minus_utc_on_date), UTC kalendrikuupäev kaheosaliseks UTC Juliuse kuupäevaks päeva pikkusega { "86 400" } s + dleap (Jd2::from_utc_calendar), UTC TAI-ks päeva murdosaga, mis on skaleeritud UTC-st SI sekunditesse (jd2::utc_to_tai), ja TAI tagasi UTC-ks (jd2::tai_to_utc), järgides SOFA dtf2d, utctai ja taiutc. Enne { "1960" } võetakse TAI - UTC väärtuseks { "0" } (SOFA väärtus; UTC määratlemata) ja see jääb väite ulatusest välja. Üksik f64 timescales::tai_minus_utc piirab endiselt väärtuseks { "10" } s enne { "1972" } ja seda ei kata

# text
seg-036d5b0b4f51 = pyerfa { "2.0.1.5" } (liberfa { "2.0.1" }, BSD-3-Clause; SOFA algoritmid, nagu ERFA projekt need välja andis), sõltumatu teek: erfa.dtf2d("UTC"), erfa.utctai ja erfa.taiutc commit'itud hetkedel, vahe moodustatud osade kaupa. Eelregistreeritud 23c40661 (hetked, tolerants ja { "1972" }+ kontrollsumma) enne mootori muutmist ja enne oraakli (sõltumatu etaloni) käivitamist. Triivitabel on ümber kirjutatud samast SOFA iauDat tabelist, mida oraakel kasutab, seega võrdlus katab teisenduse aritmeetika (päeva pikkus, UTC-st SI-sse skaleerimine, iteratsioon), mitte ajaloolist tabelit ennast

# text
seg-efacec095051 = GLONASS edastatud satelliidi kell ja edastatud orbiidi propageerimine

# text
seg-821b9c01b56e = GLONASS edastatud satelliidi kella nihe -tau_n + gamma_n (t - t_b) satelliidi kellalt loetud ajahetkel (glonass::GlonassEphemeris::sv_clock_bias_s, nihe parandatud kellanihke jaoks kahe fikseeritud punkti iteratsiooniga), ja edastatud olekuvektori PZ-90 Maaga seotud asukoht, mis on propageeritud RK4-ga läbi GLONASS ICD liikumisvõrrandite +/-15 min piires etalonepohhist (GlonassEphemeris::position_ecef), reaalsetest RINEX { "3" } GLONASS navigatsioonikirjetest. PZ-90.11 ITRF-iks teisendust ei rakendata (need nõustuvad sentimeetri tasemel alates { "2014" }; RTKLIB ei rakenda samuti ühtegi). Ei ole stsenaariumi väljundisse ühendatud: teegifunktsioon

# text
seg-4478a2518341 = RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa) geph2clk ja geph2pos, kompileeritud C lähtekoodist eraldi testkomplektis (xval/rtklib-glonass), mis loeb sama RINEX faili RTKLIB-i enda lugejaga, seega võrreldakse lisaks kellale ja orbiidile ka parsimist, märki -tau_n, ühikuid ja iteratsiooni. Eelregistreeritud e099c42a enne funktsiooni olemasolu ja enne testkomplekti ehitamist. Mõlemad pooled arvutavad sama kella suletud kuju, seega kellavõrdlus katab teostust, mitte valemit. Orbiidiintegraatorid erinevad (RTKLIB astub { "60" } s ja seejärel jääk, Kshana võrdsete sammudega kuni { "60" } s) ja nii ka konstandid (RTKLIB mu { "3.9860044e14" }, Kshana PZ-90.11 { "3.986004418e14" }); { "1.1" } mm halvim juhtum on see erinevus, nagu enne jooksu ennustati. Ulatus: edastatud efemeriid oma kehtivusvahemikus, mitte tegelik orbiit ega kell (täppistoodetega võrdlust pole)

# text
seg-d3b72a6fbb18 = Üks Maa orbiidi tee: SGP4 elemendikomplektid GCRS-iks ja ITRS-iks IAU 2006/2000A ahelal Maa orientatsiooni parameetritega

# text
seg-e4eca7205b5e = Propageerimise ja süsteemi tee, mida jagab iga suunatud Maa orbiidi stsenaariumi liik: SGP4 keskmine elemendikomplekt kaheosalise UTC epohhiga (sgp4::MeanElementSet, loetud konstellatsiooni disaini elementidest MeanElementSet::from_earth_fixed abil), propageeritud SGP4/SDP4-ga TEME-sse (sgp4::SgpOrbit), ning TEME -> ITRS ja GCRS -> ITRS pöörded IAU 2006/2000A ahelast koos UT1 - UTC ja polaarliikumisega (sgp4::teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop, nullparameetriga vormid teme_to_itrs_matrix ja gcrs_to_itrs_matrix). TEME on kuupäeva tõeline ekvaator keskmise ekvinoktsiumiga, saavutatud GCRS-ist IAU { "2006" } nihke-prekessiooni, IAU 2000B nutatsiooni ja ekvinoktsiumide võrrandi kaudu

# text
seg-44f28276f859 = Haru { "1" }: python-sgp4 { "2.24" } (MIT litsents; D. Vallado etalon-C++ SGP4, kood, mis tootis AIAA 2006-6753 kontrollvektorid), WGS-72, täiustatud režiim. Haru { "2" }: pyerfa { "2.0.1.5" } (ERFA, BSD-3-Clause, SOFA rutiinid): c2t06a TT-ga utctai/taitt-st ja UT1-ga utcut1-st ning TEME jaoks c2t06a . pnm06a^T . rz(-ee06a). Läved fikseeritud enne jooksu (eelregistreeritud 72ea9eb0). Avalikustatud: esimene jooks ebaõnnestus harus { "2" } hetkel 2016-12-31T23:{ "59" }:{ "59.5" } ühe pöördesekundi võrra (UT1 võeti UTC kvaasi Juliuse kuupäevast liigsekundi päeval); mootor parandati (jd2::utc_to_ut1) ja teine jooks nõustub muutmata lävedel. Polaarliikumise väljajätmine ({ "46" } ebaõnnestumist) või WGS-84 konstandid WGS-72 asemel ({ "4432" } ebaõnnestumist) muudavad testi punaseks. See kolmeharuline disain asendas otsast lõpuni Oreliti võrdluse, mis ebaõnnestus Oreliti SDP4-l kui e = { "0" } ja selle IERS { "1996" } TEME-l (leid jääb kinnitatuks failis tests/leo_polar_coverage_full_claim_orekit_oracle.rs)

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
seg-691a506ce13f = Avaldatud tabelise CUSUM ARL: Siegmundi ({ "1985" }) Browni liikumise lähend (Hawkins & Olwell { "1998" }, valem { "3.7" }) ristankurdatud Montgomery, Introduction to Statistical Quality Control (Wiley) ARL tabelitega, k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministlik viivitus langes täpselt kokku esmaläbimise oraakliga (sõltumatu etaloniga). Komponeeritud TPL piir jääb MODELLED

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
seg-578d7acd3288 = Orekit { "12.2" } (Apache-2.0): TopocentricFrame WGS-84 OneAxisEllipsoid'il vaatenurkade jaoks ja ElevationMask tabeli kohta, käivitatud failiga xval/orekit-skyline/OrekitSkyline.java commit'itud Maaga seotud olekutel (propageerimist ei võrrelda), koos gnss_lib_py { "1.0.4" } (wheel'i metaandmed MIT) get_dop-iga DOP jaoks ja nende hulkade ENU-ja-kella DOP maatriksiga, mille Orekit leiab nähtavad. Eelregistreeritud (xval/orekit-skyline/PREREGISTRATION.md, commit e4b9d912) enne kummagi sõltumatu etaloni käivitamist võrdlussisenditel; Oreliti lineaarset ümbermähkimisega interpolatsiooni kinnitati eelnevalt sünteetilise sondiga. Ulatus: tabelimaskid, geodeetilised vaatenurgad, maskeeritud nähtav hulk ning selle ühise kellaga DOP ja kofaktor. SIIN EI kontrollita: kanjoni, sektori ja maastiku taandamisi ning eelseadistusi (nende 360-punktilised tabelid on sisenditena; read „Tänavakanjoni, sektori ja maastiku taandamine tabeliks“ ja „Skyline'i eelseadistused“), süsteemikohaseid kella olekuid ja veaellipsit (rida „Horisontaalne veaellips ja süsteemikohane kofaktor geomeetria kovariatsioonist“), maajaama user_site GMST pööret orbit/integrity puhul ja iga propagaatori dateerimist ühele hetkele (Orekitile antakse Maaga seotud olekud) ega mis tahes tegelikku takistust (ainult otsenähtavus)

# text
seg-bbb1828b3db1 = Tänavakanjoni, sektori ja maastiku taandamine tabeliks

# text
seg-2864aec7be88 = skyline: tänavakanjon suletud kujul (lõige atan((h - a) / d), kus d = (w/2) / abs(sin(az - s)), lõppude lahtisus lõpliku pikkuse korral), teravaservalised sektorid päripäeva ümbermähkimisega ja maastikupunktid tabeliks taandatuna kumerusekaoga d^2/({ "2" } * 4/3 R); skyline on nende punktiviisiline maksimum mis tahes tabeliga

# text
seg-50f1df206b30 = Sisemine: suletud kujusid kontrollitakse käsitsi arvutatud väärtuste vastu (nimetatud tänava seinaharjade tõusunurgad, lahtise otsa tingimus, nimetatud punkti kumerusekadu). Väline oraakel (sõltumatu etalon) puudub: disainimärkus piiritleb need taandamised kui MODELLED ja Oreliti ElevationMask võtab tabeli, seega rea „Asimuudist sõltuv skyline'i mask: nähtav hulk, asimuut ja tõusunurk ning DOP maski all“ võrdlus loeb nende 360-punktilisi tabeleid sisenditena ega kontrolli neid

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
seg-1982bafa3466 = numpy { "2.5.4" } (BSD-3-Clause), xval/numpy-ellipse/ellipse.py: numpy.linalg.inv G^T G-st ja numpy.linalg.eigh selle horisontaalsest plokist commit'itud sisenditel, sõltumatu arvuteek, mis teeb pööramise ja omalahutuse oma algoritmidega (standard P2). Eelregistreeritud failis xval/numpy-ellipse/PREREGISTRATION.md (commit 0bbeeaee) enne jooksu; draiveri väljundivormingut parandati pärast eelregistreerimist üks kord (numpy skalaar kirjutatud kui np.float64(...)), protokolli ega tolerantse muutmata. Valideeritud väide on lineaaralgebra neil sisenditel; Gaussi veamudel ja UERE on nimetatud sisendid, mitte mõõdetud täpsus ega terviklikkuse piir

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
seg-af2d78e2986c = Mõõdetud kirjed, kinnihoitud: IGS lõplikud kombineeritud { "30" } s kellad { "11" } GPS Block IIF satelliidil ajavahemikus 2026-03-01 kuni { "14" } (aken, mida ükski test polnud avanud; IGS, avatud viitega) ja JammerTest { "2024" } u-blox ZED-F9P vastuvõtja oma mittehinnatavates statsionaarsetes seanssides (GPL-3.0-or-later). D9 väline võrdlus (eelregistreeritud 2ec76864, iga kaardi ennustatud / mõõdetud Alani hälve vahemikus [1/1.5, { "1.5" }] selle sobitatud keskmistamisaegadel), leid (jääb MODELLED): { "10" } { "11" }-st GPS IIF kaardist on lävendi sees; G27 on optimistlik kahetunnisel skaalal ({ "0.662" } juures { "7680" } s, halvim tegur { "1.510" }), perioodiline tunniskaala viga, mida astmeseaduse kaart ei kanna. Vastuvõtja TCXO kaart on blokeeritud: logitud edastuste väliselt jätavad andmestiku teised seansid { "167" } epohhi nõutud { "3600" } vastu. Raporteeritud, mitte pime (varasemate ridade avatud kirjed): 5071A tseesiumikaart on lävendi sees (halvim { "1.070" } kuni { "4096" } s), OCXO kaart on konservatiivne ja sellest väljas ({ "2.348" } juures { "128" } s; selle müratase muutub kirje jooksul) ning Norcia strontsiumikaart, mis on sobitatud kolmele lühimale avaldatud punktile, on selle sees kahes hinnatud punktis ({ "1.291" }, { "1.405" }). Galileo passiivsed vesiniku maserid (lõplikke Galileo kellasid pole sisselogimiseta allikast kättesaadav) ja Deep Space Atomic Clock (üks avatud kosmosesisene väärtus) on blokeeritud. D9 voor { "2" }, ZED-F9P vastuvõtja TCXO mudeliklassina { "12" } staatilise Wroclawi jaama { "14" } päeval (Zenodo { "6488497" }, CC BY { "4.0" }; eelregistreeritud fb475550), leid: registreeritud torustikuga { "11" } { "12" }-st jaamast ei olnud hinnatavad (RAIM lükkas enamiku ionosfäärivabadest epohhidest tagasi) ja BX14 ebaõnnestus; avalikustatud uuesti jooks parandatud torustikuga (eelregistreeritud c9cc0d49) läbib { "1" } { "11" }-st pimejaamast (BX12, { "1.412" }; BX07 { "1.532" } ja BX13 { "1.542" } napilt väljas), sest ühepunktilised vastuvõtjakellad katkendlikest { "30" } s failidest ei ole puhas ostsillaatori kirje

# text
seg-5097a0e6460d = Mõõdetud GPS Block IIF kellakaardid tiirukohaste liikmetega (kinnihoitud ennustus)

# text
seg-3da8122f5608 = clock_library::card::DeviceCard::fit_phase_periodic: seadmekaart, mis kannab ühest neljani tiirukohast faasiliiget (periood T/k, T = { "43 082.05" } s), sobitatud ühiselt ruutliikmega vähimruutude meetodil ühele kolmandikule mõõdetud satelliidikella kirjest, iga liikme suletud kujuga Alani panusega { "4" } A^{ "2" } sin^{ "4" }(pi tau / P) / tau^{ "2" } ennustatud Alani hälbes

# text
seg-83981cd13a17 = Mõõdetud kirjed, kinnihoitud: IGS lõplikud kombineeritud { "30" } s kellad { "11" } GPS Block IIF satelliidil ajavahemikus 2026-04-01 kuni { "14" } (aken, mida ükski test polnud avanud; IGS, avatud viitega). D9 väline võrdlus (eelregistreeritud fb475550, ennustatud / mõõdetud Alani hälve vahemikus [1/1.5, { "1.5" }] igal sobitatud keskmistamisajal igal satelliidil), leid (jääb MODELLED): { "9" } { "11" }-st kaardist on lävendi sees; G03 ({ "1.947" }) ja G25 ({ "1.581" }) on optimistlikud vahemikus { "60" } s kuni { "2000" } s, sest nende kinnihoitud kirjed on mürarikkamad kui nende sobitusosad (G25 kinnihoitud osa kannab { "16" } lünka ja { "29" } faasi hälvet), kella muutus, mitte puuduv perioodiline liige. Perioodiliste liikmete väljajätmine ennustusest ebaõnnestub kõigil { "11" } kaardil ({ "1.77" } kuni { "4.96" }), seega liikmed kannavad ennustust

# text
seg-0d72fcc0fbea = Pardal oleva kella oleku hindamine

# text
seg-6db5391f8ebe = 3-olekuline (faas/sagedus/triiv) van-Loani Kalmani kell, Joseph-stabiliseeritud

# text
seg-f41b4c81df2a = filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F scipy.linalg.expm kaudu ja Q Van-Loani { "1978" } plokkmaatriksi kaudu — sõltumatu etalonteostus, mis reprodutseerib kshana filtri täielikku trajektoori. Teostustevaheline kooskõla: kella füüsikat / Alani kalibreerimist ei valideerita väliselt, seega jääb see MODELLED. { "0.30" } väline võrdlus, leid (jääb MODELLED): { "11" } GPS Block IIF satelliidi IGS lõplikel { "30" } s kelladel (2025-08-17 kuni { "30" }), kus Q on sobitatud esimese poole ADEV-ile ja filtrit hinnatakse kinnihoitud teisel poolel, on filter ühe sammu ees kooskõlas ({ "0.906" } kuni { "0.971" } epohhidest oma { "95" } % ribas, lävi { "90" } %), kuid ülekindel ühe tunni juures { "9" } kellal { "11" }-st ({ "0.486" } kuni { "0.829" }) ning selle innovatsioonisummad jäävad { "5" } kellal vahemikust [{ "2.4" }, { "3.6" }] välja. Sobitatud valge faasi müra on igal satelliidil null ning tunniskaala viga (perioodilised liikmed, flicker FM) ei ole 3-olekulises mudelis. { "0.30" } voor { "2" }, laiendatud filter (flicker FM ning ühe- ja kahekordse tiirukohase oleku) värskelt kinnihoitud IGS kelladel ajavahemikus 2025-09-01 kuni { "14" } (eelregistreeritud 4b1a841e), leid (jääb MODELLED): ühe sammu ja ühe tunni kooskõlakriteeriumid peavad kõigil { "11" } satelliidil ({ "0.948" } kuni { "0.988" } ja { "0.907" } kuni { "0.996" }), kuid innovatsioonisumma kriteerium ebaõnnestub G24 ({ "0.964" }) ja G30 ({ "1.929" }) puhul vahemiku [{ "2.4" }, { "3.6" }] vastu. D9 voor { "3" }, voor 2 laiendatud filter, häälestus ja kriteeriumid muutmata pärast külmutatud clock_library konditsioneerimisdetektorit, värsketel IGS kelladel ajavahemikus 2026-04-01 kuni { "14" } (eelregistreeritud fb475550), leid (jääb MODELLED): (a) üks samm { "0.941" } kuni { "0.968" } ja (c) kolmik-NIS keskmine { "2.641" } kuni { "3.549" } peavad kõigil { "11" } satelliidil; (b) üks tund ebaõnnestub G09 ({ "0.894" }) ja G26 ({ "0.876" }) puhul läve { "0.90" } vastu

# text
seg-3f0a9d7c2971 = Aja edastamise veaeelarve

# text
seg-216f46b43860 = Kahesuunaline/TWSTFT (Sagnac), GNSS ühisvaade, PPP; lingi värin→kaugus

# text
seg-e7b6aac2ec58 = Sagnaci suurust kontrollitakse autoriteetse AVALDATUD VÄÄRTUSE vastu — N. Ashby, „Relativity in the GPS“, Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), valem { "1.29" }: idasuunaline ekvatoriaalne ringreis kogub { "207.4" } ns (2ωA_E/c²); kshana reprodutseerib { "207.386" } ns. Sõltumatult kinnitatud RTKLIB { "2.4.3" } geodist()-iga (Takasu, BSD-2-Clause), mis kannab sama 2Aω/c² geomeetriat. Komposiitsel BIPM TWSTFT transponderi/ühisvaate/PPP eelarvel puudub väline oraakel (sõltumatu etalon), seega jääb võimekus modelleeritud tasemele

# text
seg-157fadeb5d67 = Nav-signaali modulatsiooni ja koodijälgimise analüüs

# text
seg-ab633d191396 = BPSK-R/BOC PSD, spektraalne eraldus κ, Gabori ribalaius, DLL värin, mitmeteelevi

# text
seg-94f0c4fc2930 = GPS C/A Goldi rist-/autokorrelatsioon langes TÄPSELT kokku (täisarvud ±65/−1/63) sõltumatu IS-GPS-200 koodigeneratsiooniga; BPSK-R({ "1" })/BOC({ "1,1" }) PSD kuju sõltumatu scipy perioodogrammi vastu. Modulatsiooni/SSC/DLL suletud kujud (Betz { "2001" } / Kaplan & Hegarty) jäävad analüütilisteks, seega jääb rida MODELLED — kuid koodikorrelatsiooni alamväide on väliselt sobitatud. { "0.30" } voor { "2" }, Betzi { "2001" } ja Hein et al. { "2006" } trükitud väärtuste vastu (eelregistreeritud 9f4f2ce8, pool trükitud ühikut), leid (jääb MODELLED): kõik { "45" } tabeli { "1" } spektrirakku, { "1" } GHz korrelatsiooniväärtused, MBOC häirenäitajad ja { "2" } { "3" }-st joonise { "17" } nihkest nõustuvad; { "24" } MHz esimesed külgsagarad, BOC({ "8,4" }) joonise { "17" } nihe ja iga jooniste 18-21 halvima juhu mitmeteelevi nihe ({ "11" } kuni { "15" } % madal) ei nõustu. Kshana ja sõltumatu NumPy hinnang eelregistreeritud lugemisest nõustuvad, seega asub lõhe selles lugemises või artikli nimetamata detailis; põhjus lahendamata

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
seg-57fd0a6e5d72 = Avaldatud CAI esmaartiklite arvulised vektorid (Cheineti { "2008" } ülekandefunktsioon; Peters/Freier tundlikkus): k_eff·T² langes täpselt kokku, haavlimüra ASD ühepoolne põrand ~{ "2" }× piires iga avaldatud instrumendi omast (reaalsed seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Haarang, mitte võrdsus. { "0.30" } voor { "2" } (eelregistreeritud fcb9ac64), leid (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. { "2009" } joonise { "14" } punktide vastu annab suhted { "0.695" } kuni { "0.788" } kolmes lubatud punktis ({ "0.751" } tööpunktis), jäädes eelregistreeritud { "30" } % lävest { "0.5" } punkti võrra mööda; QPN põrand asub { "21" } kuni { "31" } % mõõdetud müra all, nagu mudelilt ilma laseri- ja tuvastusmürata oodata. Gradiomeetri koostis vastab Janvier et al. { "2022" } QPN mudeli joonele (suhe { "1.013" } kuni { "1.017" }, etalon). Mõõdetud test ei suuda eristada sqrt({ "2" }) koostisviga; seda suudab ainult ebavõrdse kontrastiga Janvier joon

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
seg-daf317735edb = Segamisvastase C/N₀ linkide eelarve võrrand ristkontrollitud sõltumatu numpy tuletusega (jagab sama suletud kuju → InternalConsistency) pluss reaalne JammerTest-2024 C/N₀ halvenemise iseloomustus. { "0.30" } voor { "2" }, blokeeritud (jääb MODELLED): mõõdetud JammerTest { "2024" } C/N0 langust linkide eelarve ennustuse vastu (eelregistreeritud 6a66994b, { "3" } dB piires) ei käivitatud, sest F8.1 antenni asukoht ja suund Bleikis ning mitmeribalise { "1.6.4" } rambi võimsuse L1 osa ei ole dokumenteeritud testikataloogis ega ametlikus logis

# text
seg-ff90679d1de9 = Spuufimise tuvastamine

# text
seg-b843f63e77e6 = Kellaabiga χ², RAIM, AGC, SQM liidetud epohhikohane turvalisuse kvaliteedinäitaja

# text
seg-baeb1c3db11f = TEXBAT stsenaariumi parameetrid (Humphreys { "2012" }) — iseloomustus, mitte kinnitatud vektorid. { "0.30" } väline võrdlus, leid (jääb MODELLED): JammerTest { "2024" } andmetel (Bleik; GPL-3.0 andmed) ei tõstnud vaatlustaseme monitorid (kellaabiga hii-ruut, RAIM, lahendi ebaõnnestumine) häiret { "10" } s jooksul ühegi { "8" }-st hinnatavast avaldatud spuufimise algusest (kus algusele eelnev aken oli puhas, tuli esimene häire { "10.2" } kuni { "39" } s pärast avaldatud sloti algust) ja kolm algusele eelnevat akent kandsid kellamonitori valehäireid ({ "81" }, { "64" } ja { "173" } epohhi). Esimene vaadeldav mõju oli kahesagedusliku GPS jälgimise kadu, mitte RAIM-i vastuolu. Avaldatud algused on minutitäpsusega ajakava slotide algused; et need eelnevad RF salvestusele, on tõlgendus, mitte mõõtmine. { "0.30" } voor { "2" }, korraldajate ametliku JammerTest { "2024" } logi vastu (sekunditäpsus; eelregistreeritud 6a66994b Hadamardi järgi kalibreeritud kolmeolekulise kellamonitoriga ilma lukustamiseta), leid (jääb MODELLED): monitor tõstab häire { "10" } s jooksul { "4" } logitud algusest { "10" }-st; ülejäänud kuuel on see { "18" } kuni { "211" } s hiljaks jäänud või tõstab algusele eelnevaid kella valehäireid ({ "1" } juures { "2.1.4" }, { "85" } juures { "2.3.15" }). D9 voor { "3" } (vastuvõtjakaart JammerTesti seadme teistest seanssidest, eelregistreeritud 2ec76864) blokeeritud: { "167" } treeningepohhi { "3600" } vastu. D9 voorud { "4" } ja 4b (müratasemed u-blox ZED-F9P mudeliklassi kaardilt, Wroclaw { "2021" }, eelregistreeritud fb475550; 4b avalikustatud uuesti jooks parandatud ekstraheerimisega, c9cc0d49), leid (jääb MODELLED): null algusele eelnevat valehäiret kõigil { "10" } logitud alguses ja { "6" } { "10" }-st { "10" } s jooksul; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } ja { "2.6.1" } jäävad hiljaks (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), kella müratase seda ei muuda

# text
seg-b10d07921f5e = Ajastuse kaitsetase spuufimise korral

# text
seg-2a829711b997 = Suletud kujuga piir halvima juhu tuvastamata ajaveale = monitori põrand + ostsillaatori libisemise-σ üle CUSUM tuvastusviivituse, raporteeritud punase müra põranda ribana

# text
seg-682251b2e3c7 = Komponeerib valideeritud primitiive (allan/holdover van-Loan, turvalisuse põrand); kalibreeritud JammerTest { "2024" } stsenaariumil { "2.1.1" } (~{ "1.01" } ms reaalne serveeritud aja nihe versus ≤{ "51" } ns väidetud). Sild valideeritud osade kohal — ise ei ole väline valideerimine. { "0.30" } väline võrdlus, leid (jääb MODELLED): JammerTest { "2024" } spuufimise stsenaariumidel ületab mõõdetud tuvastamata serveeritud ajavea nominaalse TPL-i { "3" } { "8" }-st tuvastatud alguses: { "184.3" } versus { "34.6" } ns ({ "2.1.4" }), { "295.7" } versus { "159.3" } ns ({ "2.3.5" }) ja { "143.0" } versus { "69.0" } ns ({ "2.3.11" }); kolm viiest piiri sees olevast on triviaalsed (lukustatud algusele eelnev valehäire). Tõenäoline põhjus: { "60" } s kalibreerimisest nulltriivimüraga saadud libisemise liige ei kata vastuvõtja TCXO sageduse hälbimist { "15" } kuni { "39" } s jooksul. Mõõdetud viga on Kshana enda ühepunktilise kellahinnangu viga oma algusele eelnevatele hinnangutele sobitatud sirge suhtes, seega poleks isegi kokkulangevus olnud täiesti sõltumatu. { "0.30" } voor { "2" }, ametliku JammerTest { "2024" } logi algusaegade ja mõõdetud vastuvõtja ajavea vastu (eelregistreeritud 6a66994b), leid (jääb MODELLED): { "4" } logitud alguses { "10" }-st ületab tuvastamata viga triivioleku TPL-i ({ "634.7" } versus { "458.5" } ns juures { "2.1.1" }, { "232.6" } versus { "16.2" } ns juures { "2.3.5" }, { "41.3" } versus { "6.0" } ns juures { "2.3.10" }, { "218.6" } versus { "47.4" } ns juures { "2.6.3" })

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
seg-da869d48e505 = IGRF-14 koefitsiendid; esimestest printsiipidest sobitatud filtri CRLB. Reaalvälja gravitatsiooni benchmark'i välja kontrollitakse väliselt (rida „Gravitatsiooni anomaalia süntees sfäärilise harmoonilise mudeli põhjal“), kuid selle navigatsioonitulemusel puudub väline oraakel (sõltumatu etalon)

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
seg-72a3c97ef04b = Suletud kujuga AUC piirid (Mann–Whitney) + täiusliku oraakli (sõltumatu etaloni) detektor; korpus on SÜNTEETILINE (parameetritest lähtuv, mitte välja/IQ andmed)

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
seg-1cad4329e226 = Definitsiooniline Kp↔ap tabel + Jacchia-1971 eksosfääri temperatuuri suletud kuju (langes kokku täpsusega <{ "1" } K versus avaldatud ankrud, tests/space_weather_reference.rs); tihedust iseloomustatakse pymsis NRLMSISE-00 (sõltumatu NRL mudel) vastu: { "800" } km päikesetsükli kõikumine on 10.4x versus NRLMSISE-00 13.6x. { "0.30" } redaktsioon: kalibreeritud esimest järku aktiivsustegur asendati Jacchia { "1971" }-ga (vaikestsenaariumi tihedus { "400" } km juures { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k eemaldatud, mean_exospheric_temperature_k lisatud). { "0.30" } voor { "2" }, mõõdetud TOLEOS CHAMP/GRACE/GRACE-FO kiirendusmõõturi tihedused (ESA Swarm DISC; eelregistreeritud 20eed695), leid (jääb MODELLED): orbiidikeskmised { "400" } kuni { "500" } km juures on teguri { "2" } piires päikese maksimumil väljaspool tormi (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), kuid Jacchia { "1971" } on { "2008" } päikese miinimumil umbes 1.7x liiga tihe (GRACE-A 412/544 teguri { "2" } piires), seega tihedust ei valideerita

# text
seg-29bedb28c34f = CCSDS OEM koostalitlusvõime (GMAT/Orekit/STK efemeriidi import)

# text
# c1: oem-interop
seg-edb58ffbbb5b = CCSDS { "502.0" } OEM importija (parse_oem), talub COMMENT ridu / lisametaandmete võtmesõnu / kovariatsiooniplokke ja on kirjutaja täpne pöördfunktsioon; ringkäik + välise faili vastuvõtt kiirusekooskõla kontrolliga. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/oem-interop.toml)

# text
seg-c76b8c395ef0 = Stardiakna ja tõusu geomeetria (missiooni analüüs)

# text
# c1: launch-window
seg-6066c634faba = Kahe keha stardiasimuut(id) (sin Az = cos i / cos lat), minimaalne saavutatav inklinatsioon, ringkiirus, Maa pöörlemise idasuunaline boonus, dogleg tasandi muutuse Δv ja ööpäevased võimalused ning, kui on antud epohh ja IERS finals2000A read, jaama kiirus tõelise pooluse ümber (launch::site_rotation_speed_at). Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/launch-window.toml)

# text
seg-2515ab37f99b = Suletud kujuga sfäärilise trigonomeetria stardigeomeetria versus avaldatud läbitöötatud näidete ankrud (Vallado, Fundamentals of Astrodynamics 4. tr., algoritm { "37" } stardiasimuut + ptk 6 tasandi muutus; tests/launch_window_ascent_geometry_reference.rs). Need kasutavad uuesti sama suletud kuju, mida kshana teostab (avaldatud väärtuse võrdsuse / ümberkirjutuskontroll, InternalConsistency); MODELLED kahe keha, pöörleva Maa kiirusetriangli / tõusu / takistuskao mudelit pole. { "0.30" } väline võrdlus Orekit { "12.2" } (Apache-2.0) vastu, leid (jääb MODELLED): geomeetria nõustub ümardamiseni (inklinatsioon, loetud tagasi põlemise lõpu asimuudist { "158" } juhul, halvim { "2.6e-15" } rad; minimaalne inklinatsioon, ringkiirus ja dogleg delta-v täpsusega { "3e-16" }), kuid Maa pöörlemise jaamakiirus jääb eelregistreeritud { "1e-6" } suhtelisest lävest mööda laiuskraadil { "62.9" } kraadi ({ "1.12e-6" }). Lõhe kasvab kui tan(lat), mis on kooskõlas polaarliikumise pooluse nihkega umbes { "5.8e-7" } rad Oreliti Maa süsteemis, mida sfääriline ω·R·cos(lat) välja jätab. Väidet enne jooksu ei kitsendatud, seega ei saa rida selle võrdluse põhjal tõsta. { "0.30" } voor { "2" } (eelregistreeritud 71bebf63): epohhi ja IERS ridadega nõustub tõelise pooluse jaamakiirus (stsenaariumi väli site_rotation_speed_true_pole_m_s) Orekitiga täpsusega { "1e-6" } { "24" } jaamas nelja pikkuskraadi üle (halvim { "4.9e-8" }), kuid nominaalne epohhita kiirus, mida stsenaarium vaikimisi Maa pöörlemise boonusena väljastab, jääb endiselt { "1.12e-6" } võrra mööda, seega jääb rida MODELLED kuni otsuseni vaikeväljundi kohta

# text
seg-ff2cd766bb52 = Ballistilise taassisenemise koridor (Allen–Eggers)

# text
# c1: reentry
seg-c3f3422f96e4 = Tippkiirendus (ballistilisest koefitsiendist sõltumatu), kiirus + kõrgus tipp-g juures ja tippkuumenemise kiirus eksponentsiaalse atmosfääriga ballistilisel sisenemisel. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/reentry.toml)

# text
seg-121f02d79ae0 = Suletud kujuga Allen–Eggersi analüütiline sisenemine, lisaks ristkontrollitud scipy { "1.18" } solve_ivp (DOP853) numbrilise integreerimisega SAMA ainult takistuse sisenemise ODE-st (tests/ballistic_re_entry_corridor_reference.rs, { "36" } juhtu, halvim a_max suhteline { "2.9e-9" }) — numbrilise integraali versus enda analüütilise kuju kontroll, seega ikka InternalConsistency, MITTE väline valideerimine. MODELLED ballistiline (tõstejõuta), aerotermilist/TPS-i pole — kuumenemise väljund on kiirus, mitte soojusvoog. { "0.30" } väline võrdlus, leid (jääb MODELLED): Stardust SRC sisenemise rekonstruktsiooni (Desai ja Qualls, NASA NTRS { "20080008567" }) vastu on Allen–Eggersi tippkiirendus trükitud inertsiaalse sisenemisoleku ({ "12.9" } km/s, -8.2 kraadi, H { "7200" } m) jaoks { "61.8" } g parima hinnatud trajektoori { "32.89" } g vastu, +{ "88" } % { "15" } % tolerantsi vastu: konstantse lennutee nurga, gravitatsioonita lahend peaaegu kahekordistab madala, põgenemiskiirusest kiirema sisenemise tipu. Stardustil polnud kiirendusmõõturit, seega on rekonstruktsioon trajektoori hinnang. { "0.30" } voor { "2" }, blokeeritud (jääb MODELLED): integreeritud tasapinnaline punktmassi lahend (reentry::simulate_planar_entry, US76, pöördruutgravitatsioon, kõverus) nõustub Stardusti ja Genesise parimate hinnatud trajektooridega { "15" } % piires (+{ "11.3" } %, +{ "5.6" } %), kuid need maksimumid on agentuuri simulatsiooni väljundid, mitte mõõtmised, seega on see ainult ristkontroll. Kiirendusmõõturi võrdlus (eelregistreeritud a94a283d) on blokeeritud Hayabusa2 REMM analüüsi loetava koopia puudumise tõttu (doi 10.57350/jesa.16)

# text
seg-8c10b50407d3 = EO kasuliku koormuse jalajälje ja katvuse geomeetria

# text
# c1: eo-coverage
seg-45c1e799c87c = SMAD kosmosekolmnurga geomeetria: Maa nurkraadius, haardelaius, nadiiri GSD, maksimaalne nadiirist kõrvale pääs ja ringorbiidi periood, pluss esimest järku J2 sõlmeperiood (eo_payload::j2_nodal_period) ja ekvatoriaalne maapealse jälje vahe R_e (omega_E - dOmega/dt) T_nodal (eo_payload::ground_track_spacing_equator_j2) pideva katvuse lipuga, orbiidi kõrguse, inklinatsiooni ja sensori FOV/IFOV jaoks. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/eo-coverage.toml); selle vaikeinklinatsioon on päikesesünkroonne eo_payload::sun_synchronous_inclination-ist, mugavusvaikeväärtus, mis ei kuulu valideeritud väite alla

# text
seg-42411e7c37c9 = Orekit { "12.2" } (Apache-2.0) ja GeographicLib { "2.1" } (MIT), mõlemad käivitatud eraldi programmidena, eelregistreeritud (766823f3) enne mootori muutmist ja mis tahes oraakli (sõltumatu etaloni) jooksu: sfääri suurused { "1e-9" } suhtelise piires (halvim: nurkraadius { "5.4e-16" }, haardelaius { "7.0e-13" }, pääs { "1.9e-14" }), periood { "1e-12" } ({ "1.6e-16" }), nadiiri GSD { "1e-7" } ({ "2.9e-10" }), J2 sõlmeperiood ja sõlmevahe { "0.1" } % piires Oreliti numbrilisest J2 propageerimisest sõlmedetektoriga ({ "1.2e-5" } ja { "6.7e-5" }), pideva katvuse lipp täpne (168/168) ning WGS-84 ellipsoidi vastu limb { "0.3" } kraadi piires ({ "0.186" } kraadi) ja maksimaalne maapealne ulatus { "0.5" } % piires ({ "3.2e-3" }). Sõlmeregressiooni liikme eemaldamine ebaõnnestub { "35" } { "42" } sõlmepunktist. MODELLED ulatus: sfäärilise Maa jalajälg; radiomeetriat, MTF-i, atmosfääri, värinat ega peegeldust pole; päikesesünkroonset vaikeinklinatsiooni ei võrrelda. Varasem Skyfield/SGP4 ristkontroll säilitatakse regressioonina. { "0.30" } redaktsioon: vahe kannab nüüd J2 sõlmeregressiooni (vaikestsenaarium { "2756.37" } -> { "2752.17" } km)

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
seg-4123d600477a = Eelregistreeritud (003ef3eb) enne mis tahes võrdlust; neli sõltumatut teostust, ükski pole GPL, midagi ei kaasata: ccsdspy { "2.0.1" } (BSD-3-Clause) dekodeerib { "34" } Kshana kirjutatud paketti { "5" } voos (primaarpäis, P-väli, jäme ja täpne aeg, CDS väljad, lisaandmed, kasutajaandmed, PEC) ja mõlemad 1000-oktetised segmenteeritud üksused taastatakse selle kasutajaandmetest { "0" } mittesobivusega ning see märgib maha jäetud ja vahetatud paketi vood, mille Kshana tagasi lükkab; { "8" } sõnumi ja { "57" } PEC välja CRC võrdub CPython binascii.crc_hqx ja spacepackets-rs { "0.18.0" } omaga (kontrollväärtus 0x29B1); { "66" } CUC ja CDS ajakoodi juhtu võrduvad spacepackets-rs { "0.18.0" } kirjutamise ja lugemisega oktett oktetilt ({ "3" } CDS juhtu ka spacepackets-py { "0.32.0" }); { "4" } spacepackets-py { "0.32.0" } PusTm paketti on baidi haaval identsed Kshana omadega. Katmata: agentuuri epohhi ajakoodid ({ "7" } juhtu toetuvad ühikutestidele), TC ülekanderaamid ja mis tahes lingikiht paketi all

# text
seg-7c61da52b8f8 = SPICE SPK eksport (tüübid { "9" } ja { "13" })

# text
seg-582ce23522f6 = NAIF SPICE SPK kernelite tüüpide { "9" } (Lagrange, ebavõrdsed ajasammud) ja { "13" } (Hermite, ebavõrdsed ajasammud) kirjutaja ja lugeja koos DAF paigutuse, segmendideskriptorite ja epohhikataloogidega, ning CCSDS OEM-i eksport SPK kernelisse (UTC või TDB epohhid efemeriidiajaks)

# text
seg-194c37ac787f = CSPICE N0067 läbi spiceypy { "8.3.0" }, liigsekundite kernel naif0012.tls, eelregistreeritud (5059fd2a) enne kui SPICE luges ühtegi Kshana kernelit: SPICE'i inventuur Kshana neljast kernelist on täpne; spkpvn ja spkgeo { "5 516" } epohhil ja { "690" } ahelarvutuses võrduvad Kshana enda arvutusega bitipõhiselt ja jäävad lävendi sisse igas sõlmes (halvim { "0.022" } sellest); Kshana loeb SPICE'i kirjutatud kernelid bitipõhiselt identselt; samade sisendite korral on Kshana kernelid baidi haaval identsed SPICE'i omadega ({ "0" } erinevat baiti neljas failis); OEM-i epohhid teisendatakse efemeriidiajaks täpsusega { "6.0e-8" } s str2et suhtes (lävi { "1e-6" } s) ja SPICE arvutab OEM-i ekspordi lävendi sees (halvim { "0.060" }). Sünteetilised Kepleri kaared: füüsikalise täpsuse kohta see midagi ei väida. Teisi SPK tüüpe ei kirjutata

# text
seg-d699104fc2af = SPICE SPK tüübid { "3" } ja { "21" } (Tšebõšev, laiendatud vahereaed)

# text
seg-7d3e8b5b40af = NAIF SPICE SPK segmentide tüübi { "3" } (Tšebõševi polünoomid asukohale ja kiirusele fikseeritud intervallide üle, aste { "0" } kuni { "27" }) ja tüübi { "21" } (laiendatud modifitseeritud diferentsimassiivid, JPL integraatorite vahereaed, MAXDIM { "15" } kuni { "25" }) kirjutaja ja lugeja antud kirjetest, failides, mis sisaldavad ka tüübi { "9" } ja { "13" } segmente; kirje valik ja arvutus SPICE lugejate järjekorras. Kshana ei sobita Tšebõševi koefitsiente ega tekita vahereaid

# text
seg-40323a2adce1 = CSPICE N0067 läbi spiceypy { "8.3.0" } (spkw03, spkw13 ja samast teegist selle f2c sümboli kaudu spkw21; spkpvn, spkgeo), eelregistreeritud (e1cf80d8) enne koodi olemasolu, sünteetilised kirjed tõmmatud selle commit'i SHA-1-st: kolme faili korral (tüüp { "3" } astmed { "0" }, { "12" } ja { "27" } { "3" } kuni { "150" } kirjega; tüüp { "21" } MAXDIM { "15" }, { "20" } ja { "25" } { "1" } kuni { "250" } reaga, null kuni kaks kataloogikirjet ja keskahel; tüüp { "3" }, { "21" } ja { "13" } ühes failis kommentaaridega) on SPICE'i inventuur Kshana kernelitest täpne, Kshana kernelid on baidi haaval identsed nendega, mida SPICE samadest kirjetest kirjutab, ning spkpvn ja spkgeo võrduvad Kshana lugejaga bitipõhiselt nii Kshana kui SPICE'i failidel ({ "48 876" } komponenti kumbagi suunda, lävi { "1e-12" } suhteline). Sünteetilised kirjed: füüsikalise täpsuse kohta see midagi ei väida; reaalsed JPL-i toodetud tüübi { "21" } kernelid ei kuulu juhtumikomplekti

# text
seg-39517faae95c = CCSDS asendisõnumid (AEM, APM)

# text
seg-f88f6ea002c8 = CCSDS 504.0-B-2 asendisõnumite (Attitude Data Messages) kirjutaja ja lugeja KVN-is ja NDM/XML-is: AEM versioon { "2.0" } (ja { "1.0" } KVN-is, koos selle ATTITUDE_DIR, QUATERNION_TYPE ja arvuliste pöördejadadega) kvaternioon-, Euleri nurga ja spinn-asendi tüüpide ning nende tuletise, nurkkiiruse ja nutatsiooni variantidega, mitu segmenti; APM versioon { "2.0" } kvaternioon-, Euleri, nurkkiiruse, spinn-, inertsi- ja manöövriplokkidega; kirje A-st B-ni kvaternioon (504.0-B-2 lisa F)

# text
seg-8853058de1f3 = Orekit { "13.1.8" } (Apache-2.0) parserid ja kirjutajad, käivitatud eraldi programmina (xval/adm-orekit), eelregistreeritud (7a6a05fe) enne mis tahes võrdlust: Orekit parsib kõik Kshana kirjutatud sõnumid ({ "14" } AEM KVN, { "11" } AEM XML, { "4" } APM KVN, { "4" } APM XML) ja iga väärtus on oma lävendi sees (kvaternioonid { "1e-14" }, nurgad { "1e-9" } kraadi; halvim { "0.054" } lävendist); Kshana parsib { "31" } sõnumit, mille Orekit samadest sisenditest kirjutab, igas lävendis; kõigi { "135" } kvaternioon-, Euleri ja spinn-kirje pööre võrdub AemSegment.getAngularCoordinates-iga täpsusega { "1e-12" } (halvim { "0.0071" } lävendist). Kõik { "15" } Kshana XML sõnumit valideeruvad NDM/XML { "4.0.0" } skeemi vastu (andmetega piiratud, tõmmatud kinnitatud SHA-256-ga). Leid: Orekit APM kirjutaja lükkab manöövri tagasi ilma MAN_DELTA_MASS-ita (standardis valikuline), seega on APM manöövrid kaetud ainult Kshana kirjutamise suunas. Juhtumikomplektist väljas: AEM { "1.0" } */RATE tüübid ja XML, korduvad APM plokid

# text
seg-5f26f879037e = CCSDS orbiidiandmesõnumid (OPM, OMM, OCM)

# text
seg-eaddfd311fea = CCSDS 502.0-B-3 orbiidiandmesõnumite (Orbit Data Messages) kirjutaja ja lugeja KVN-is ja NDM/XML-is: OPM { "3.0" } ja { "2.0" } (olekuvektor, oskuleerivad Kepleri elemendid, kosmoseaparaadi parameetrid, kovariatsioon, manöövrid, kasutaja määratud parameetrid), OMM { "3.0" } ja { "2.0" } (keskmised elemendid keskmise liikumise või poolpeatelje järgi, TLE-ga seotud parameetrid BSTAR või BTERM ja AGOM-iga, kovariatsioon) ning OCM { "3.0" } trajektoori (CARTP, CARTPV, CARTPVA; absoluutsed või suhtelised epohhid), füüsikaliste omaduste, kovariatsiooni (CARTP, CARTPV LTM järjekorras), manöövri ja kasutaja määratud plokkidega; täistäpsusega OMM SGP4 elemendikomplektist muutmata OmmFile::to_omm_kvn kõrval

# text
seg-d4c7896b5963 = Orekit { "13.1.8" } (Apache-2.0) OPM, OMM ja OCM parserid ja kirjutajad, käivitatud eraldi programmina (xval/odm-orekit), eelregistreeritud (cc6841da) enne mis tahes võrdlust: { "27" } { "30" }-st Kshana kirjutatud sõnumist ({ "6" } OPM, { "5" } OMM ja { "5" } OCM juhtu KVN-is ning XML versioonile { "3.0" }) parsitakse Orekitis iga väärtusega { "1e-14" } suhtelise piires ja iga epohhiga { "1e-9" } s piires ({ "904" } väärtust, halvim { "0.021" } lävendist) ning Kshana loeb kõik { "25" } sõnumit, mille Orekit tagasi kirjutab, samades lävendites ({ "858" } väärtust, halvim { "0.020" }); kõik { "14" } Kshana XML sõnumit valideeruvad NDM/XML { "4.0.0" } skeemi vastu (andmetega piiratud). Leiud, kinnitatud, kitsendavad väidet: Orekit nõuab ELEMENT_SET_NO-d (valikuline standardis 502.0-B-3), lükkab tagasi COMMENT-i XML kasutaja määratud parameetrites (skeem lubab seda), ei kirjuta BTERM-i ilma BSTAR-ita (seega on BTERM ja AGOM kaetud ainult Kshana kirjutamise suunas) ja lisab OCM suhtelised epohhid SI sekunditena, seega TDB all erinevad need TDB kalendrilugemisest umbes { "1.9e-10" } s/s (UTC, TAI ja TT nõustuvad). Vana OmmFile::to_omm_kvn väljund, mis mähib OMM metaandmed META_START/META_STOP-i, lükkab Orekit tagasi (registreeritud). Ulatusest väljas: OCM PERT ja OD plokid, mitte-Descartesi elemendikomplektid, muud kovariatsioonijärjestused

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
seg-19d166cb653f = Orekit { "13.1.8" } (CS GROUP, Apache-2.0) koos Hipparchusega { "4.0.3" }: TLEPropagator samadel elemendikomplektidel TEME-s, mille Orekit ehitab nimetatud definitsiooni järgi (selle IERS { "2010" } TOD pööratud GAST - GMST võrra), ElevationDetector ja ElevationExtremumDetector koos ITURP834AtmosphericRefraction'iga ja ilma, ning AngularAzEl koos AngularRadioRefractionModifier'iga valguse levi aja juhuks, ületused ja maksimum lahendatud Hipparchusega; { "60" } juhtu (neli orbiiti, viis merepinna jaama, maskid { "0" }, { "5" } ja { "10" } kraadi, { "24" } tundi). Läved fikseeritud enne jooksu (eelregistreeritud e947e69d, 72ea9eb0 haru { "3" }). Valguse levi aja ignoreerimine ({ "9777" } ebaõnnestumist) või P.834 konstandi { "1.728" } muutmine väärtuseks { "1.828" } ({ "7883" } ebaõnnestumist) muudab testi punaseks. Ulatus: jaamad merepinnal; Oreliti P.834 h*theta0^{ "2" } koefitsient on { "0.011380" }, kus soovitus trükib { "0.01380" } (kinnitatud), seega merepinnast kõrgemaid kõrgusi ei võrrelda. Voor { "1" }, Oreliti vaike-IERS { "1996" } TEME vastu, pidas iga läbimislävendi, kuid jäi suunalävendist mööda { "72" } mas TEME konventsioonilõhe võrra (kinnitatud)

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
seg-93b913e60063 = Nelja piirkonna reegli sõltumatu numpy uusteostus (scripts/gen_tib_scorer_reference.py) identsel valimihulgal; meetod viidatud Stanfordi–ESA terviklikkusdiagrammist (Tossaint et al., ION GNSS { "2007" }) ja RTCA DO-229 WAAS MOPS-ist. MITTE ExternalDataset täpsuse oraakel (sõltumatu etalon) — benchmark on ausameelsusele immuunne.

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
seg-b907aecaccd0 = Esinduslikud parameetrilised tõrkegeneraatorid (modelleeritud); tuvastamatu hulk (sümmeetriline viivitus, kordus värskuse piires) on viidatud Mizrahi RFC { "7384" } ja Narula & Humphreys (IEEE JSTSP { "2018" }) põhjal. Välist oraaklit (sõltumatut etaloni) pole — tõrgete kataloog ei esita mõõdetud väidet.

# text
seg-90c0eb1e7c14 = Ajastuse terviklikkuse standardi järgimise benchmark — tuvastamatu neeldumise otsus

# text
seg-f713acf042ff = TIB tuvastamatu neeldumise otsus (sümmeetriline/kordus peab olema PL-i poolt neelatud, mitte kunagi tuvastatuks raporteeritud)

# text
seg-6840c2467c63 = Omaduskontroll, et Verdict enum ei saa struktuuriliselt tuvastamatut tõrget tuvastatuks raporteerida (Mizrahi RFC { "7384" }); neelatud ⟺ PL ≥ nihe. Täpsuse oraakel (sõltumatu etalon) puudub.

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
seg-23f0c10237f4 = Välist oraaklit (sõltumatut etaloni) pole ja see ei ole võimalik: see on enesekirjeldus, mitte mõõtmine. See on registreeritud, sest selle puudumine oli defekt -- P5 pidi kandelaine pikkust ja saateava lähteväärtustest tsiteerima ning tuletama sisemisest kooskõlakontrollist, et paljas <c1/> oli ruutmeetrites. Tuletus oli õige, mis on täpselt see, miks see loeb: miski poleks tabanud, kui see oleks olnud vale

# text
seg-0691f3dee8cb = Hübriidse optilise/RF lingi kättesaadavus RF poolel

# text
seg-72ccb655caf0 = Hybrid-optical-rf aruanne esitab RF lingi kättesaadavuse, mis on koostatud suurustest, mida mootor juba arvutab, mitte imporditud klimatoloogiast, ning esitab koostise nimetatud reeglina: A_rf = I_closure * I_track, kus I_closure on ühesuunalise CCSDS-401 / DSN-810-005 linkide eelarve (linkbudget::link_budget, Eb/N0 varu >= { "0" }) sulgumisotsus stsenaariumi enda kaugusel ja I_track on jälgimissilmuse otsus (jamming::lock_status) C/N0 kohta, mille SAMA eelarve tagastas. Iga tegur kannab oma sisendi päritoluklassi väljundini ning tegurid, mis tahtlikult EI ole korrutises -- geomeetriline nähtavus, häirega keelamine ja RF katkestuse klimatoloogia -- on põhjendusega nimetatud, mitte vaikselt väärtusele { "1" } seatud. Lahendatud RF haru kajastatakse omaenda rf_link_configuration plokina ning indikaatori kõrval olevad pidevad näitajad (lingi varu, C/N0 varu, suletud kujuga sulgumise ja jälgimise kaugused ning kauguse kasutus) on sama eelarve kauguse inversioonid. Aruanne esitab täielikult, plokil ja ühikute kirjel, millele lugeja satub, et see arv on VARU/GEOMEETRIAPIIRATUD ja DETERMINISTLIK, samas kui optiline kättesaadavus on ILMASTIKU/KLIMATOLOOGIAGA PIIRATUD ja tõenäosuslik, seega ei saa neid kunagi tsiteerida võrreldava protsendipaarina

# text
seg-319705ea0166 = Välist oraaklit (sõltumatut etaloni) pole ja ExternalDataset on tagasi lükatud. Kaks sisendit on Eb/N0 varu ja C/N0 läve ületus, mõlemad MODELLED EIRP, kvaliteedinäitaja ja koondatud kadude jaotuse funktsioonid; Maa–Kuu optilise/RF hübriidteenuse jaoks pole mõõdetud kättesaadavuse kirjet, mille vastu koostatud arvu kontrollida. Olemasolevad kontrollid on sisemised ja neid nimetatakse nii: koostis arvutatakse uuesti aruande enda avaldatud varudest, mitte emitteri sisemustest, ning sulgumiskaugus kontrollitakse lingivõrrandi uuesti käivitamisega SELLEL ja nõudega, et varu kaoks -- inversiooni ringkäik, mitte sõltumatu teostus. Arvu aus piir on registreeritud aruandel endal: see on deterministlik 0/1 indikaator, mitte tõenäosus, sest miski selles mootoris ei mõõda RF lingi katkestuse jaotust sellel ribal ja geomeetrial. See puuduv sisend on nimetatud väljas rf_availability.factors_not_included, mitte välja mõeldud, ning selle andmine on see, mida tõenäosuslik RF kättesaadavus vajaks

# text
seg-22c5df9b6c7c = Võrdväärne optilise-versus-RF kaugusmõõtmise võrdlus

# text
seg-70eb396f40af = Hybrid-optical-rf aruanne väljastab optilise-versus-RF kaugusmõõtmise suhte koos ÜHE konfiguratsiooniga, mille juures mõlemad harud hinnati, kantuna samas objektis: sama ühesuunaline tee, sama kaugus ja sama akumuleerimisaeg. Optiline haru on mootori footonipiiratud ToA CRLB ühesuunalisel footonite arvul; RF haru on mootori DLL varajase-hilise termilise koodijälgimise värin C/N0 juures, mille mootori enda linkide eelarve sama ühesuunalise kauguse jaoks tagastab. Silmuse müraribalaius on tuletatud, mitte valitud: B_L = 1/({ "2" }*integration_s) paneb RF haru täpselt optilise akumuleerimisaja peale ja kui kutsuja selle üle kirjutab nii, et kaks keskmistamisaega lahknevad, on suhe REFUSED -- null, koos nimetatud mittesobivuse ja mõlema ajaga -- mitte ei tsiteerita kahes töökohas. Suhet ei moodustata stsenaariumi VALITUD parameetrilise rf_position_sigma_m vastu ja keeldumine ütleb, miks: see sisend ei kanna üldse konfiguratsiooni. Avaldatud kahesuunaline optiline pealkirjanäitaja ja täpne tegur, mis seob selle ühesuunalise võrdlusharuga, väljastatakse suhte kõrval, seega ei saa aruannet lugeda nii, nagu see kannaks kaht lahknevat optilist sigmat

# text
seg-acbb3ac98ee3 = SUHTEL puudub väline oraakel (sõltumatu etalon) ja ExternalDataset on tahtlikult tagasi lükatud. Aluseks oleval RF ahelal on see olemas -- tests/validate_p5_rf_ranging_precision.rs kontrollib linkbudget::link_budget ja navsignal::dll_code_jitter_chips sõltumatu Python/NumPy fikstuuri ja kõvakodeeritud Kaplani ja Hegarty läbitöötatud väärtuse ({ "2.814e-3" } kiipi / { "0.825" } m juures { "45" } dB-Hz) vastu -- ja optilisel CRLB-l on oma suletud kujuga rida. Kummagi ankru väitmine sellele reale oleks laenatud valideerimine, mida maatriksi invariandid takistavad: siinne suurus on SUHE konfiguratsioonil MODELLED EIRP, kvaliteedinäitaja, saatevõimsuse ja avaga ning mõõdetud optilise-versus-RF kaugusmõõtmise võrdlust ühisel töökohal, mille vastu seda kontrollida, ei ole. Sisemiselt kontrollitakse seda, mida suhe saab tegelikult valesti teha: et kaks haru asuvad ühes töökohas. Seda mõõdetakse ühise akumuleerimisaja skaleerimisega ja nõudega, et mõlemad harud liiguksid sama ruutjuure seaduse järgi ning suhe jääks paigale, ning seda jõustatakse suhte täieliku tagasilükkamisega, kui keskmistamisajad lahknevad. Mõlemad harud on termilise/haavlimüra piirid ja mõlemad jätavad välja keskkonna viivituse, kellavea ja mitmetähenduslikkuse, seega on väljajätt mõlemal poolel identne; aruanne ütleb seda, mitte ei jäta seda tuletada

# text
seg-3f26f598e013 = Linkide eelarve aruande enesekirjeldus

# text
seg-b88bf41d6d4c = Linkide eelarve aruanne esitab iga absoluutse konstandi, millest selle enda varu arvutati -- kandesagedus, mida vaba ruumi kadu kasutas, EIRP, kvaliteedinäitaja, koondatud kadu ja Boltzmanni liige -- pluss nõutava G/T, mille juures varu on null, lingikonstandi (EIRP - kaod - nõutav Eb/N0), mis on ainus kombinatsioon, mille avaldatud kiiruse/võimenduse tabel kunagi fikseerida saab, ja, kui kutsuja esitab süsteemi müratemperatuuri, vastuvõtuantenni võimenduse, mida see kvaliteedinäitaja eeldab

# text
seg-52f98f50522f = Välist oraaklit (sõltumatut etaloni) pole: see on enesekirjeldus võrrandi üle, mis on juba valideeritud avaldatud disainikontrolli tabeli vastu (vt ühesuunalise linkide eelarve rida). See on registreeritud, sest selle puudumine oli mõõdetud defekt -- väljastatud d1_rate_gain_beamwidth.csv reprodutseerimine nõudis ühe efektiivse konstandi tagasilahendamist täpsusega { "0.0034" } dB kõigist kolmekümnest reast ja mootor nii nimetab selle kombinatsiooni kui ka tõestab testiga, et ükski väljastatud tabel poleks kunagi saanud selle kolme komponenti eraldada

# text
seg-a7b192e27cb5 = Kellaklassi kohane Kuu aja ristumiskoha tabel

# text
seg-cab605dc6ea2 = Üks Kuu aja eelarve jooks väljastab kellaklassi kohta kella-versus-süsteemi ristumiskoha rea ühe jagatud süsteemiliikme vastu, nii et kell on ainus muutuja võrdluses; iga rida kannab kahel viisil saavutatud ristumiskohta -- poolitatud üldisest astmeseaduse ajavea kõverast ja algebraliselt pööratud rea domineerivast müratüübist -- koos nende suhtelise erinevusega

# text
seg-ccec15f0b125 = Kaks erinevat koodibaasisisest sama suuruse arvutust, mitte üks ümber väljendatud: poolitamine IEEE-1139 astmeseaduse kõveral ei tea midagi müratüübist, samas kui suletud kuju pöörab domineeriva tüübi algebraliselt, seega ekslikult klassifitseeritud müratüüp või halb raamistik ilmneb mitte-triviaalselt väikese suhtelise erinevusena. Neli väärtust reprodutseerivad ka artikli avaldatud tabeli poole selle viimase trükitud numbri täpsusega -- kuid see tabel ise rekonstrueeriti samast suletud kujust, seega on see reprodutseeritavuse kontroll ja mitte väline oraakel (sõltumatu etalon), ning süsteemiliige, mille vastu seda mõõdetakse, on modelleeritud jaotus

# text
seg-ff32b78acb8c = Ühine UT1 ja polaarliikumise viga ühisel reahulgal

# text
seg-561e588153af = Üks tabel esitab UT1 ennustusvea, polaarliikumise pooluse vea ja nende ruutkombinatsiooni Kuul IDENTSEL epohhihulgal horisondi kohta, väljastades epohhid, millel iga komponenti mõõdeti. Eraldi nimetab stsenaarium, milline EOP sisend kehtib, ja lahutab selle reaaruloenduse ning väljastab alati ennustatud-versus-lõpliku horisondi tabeli koos selge väitega, miks see on tühi, kui see on

# text
seg-093191c1ddce = astropy { "8.0.1" } utils.iers (BSD-3), mis loeb IERS finals2000A toodet oma Bulletin-B-muidu-A reegliga, ja pyerfa { "2.0.1.5" } (SOFA) täielikud taevaselt maapealseks pöörded (c2i06a, sp00, pom00, c2tcio; Maa pöördenurk IERS { "2010" } valemi { "5.15" } järgi täpses aritmeetikas), käivitatud eraldi programmidena külmutatud 2026-09-30 finals2000A.all sõnasõnalistel ridadel; eelregistreeritud (455b8fb5) muudatustega A1 ja A2, mis fikseerivad ainult sõltumatu etaloni arvutustäpsuse (mõlemad avalikustatud jooksudega, millele need järgnesid): iga tabeli { "3" } epohhiloend võrdne, UT1 ja pooluse statistikad täpsuse { "6e-16" } piires, kombinatsioon { "1.9e-7" } piires, 12/12 ennustatud-versus-lõplikku juhtu. Kombinatsioonikontroll ei suuda lahendada pooluseliikme vigu alla umbes { "1e-4" } suhtelise, sest UT1 domineerib seda; pooluse täpsus toetub { "1e-9" } pooluse statistika kontrollile. Epohhihulga ja varureeglid on generaator, mis peegeldab Kshana definitsioone, ning tühja tabeli olekud on disainikäitumine ilma välise tegeliku väärtuseta. Suurusjärgud: IERS Annual Report { "2019" } tabel 3a realiseeritud ennustusvead, Kshana/IERS { "1.001" } kuni { "1.100" } vahemikus { "1" } kuni { "90" } päeva (lävi [{ "0.8" }, { "1.25" }], mõõdetud). Reaaruloendus: astropy (võrguühenduseta sisendi rida). Voor { "1" } (säilitatud regressioonina): { "178" } Bulletin A väljaande trükitud täpsusvalemi vastu nõustub poolus 1.5x piires ja UT1 mitte, mis testib IERS valemit selle realiseeritud vea vastu

# text
seg-3692f1fc89e6 = Võrguühenduseta vaike-Maa orientatsiooni sisend on reaalne IERS toode

# text
# c1: realtime-frame-eop
seg-f9a9d385fd26 = Käitusaja vaikeväärtus <c1/> on teegi enda manustatud koopia sõnasõnalisest IERS finals2000A väljavõttest (tools/finals2000A_20260930.txt: { "174" } järjestikust päevarida, MJD 61224-61397, lõigatud 2026-09-30 finals2000A.all-ist), mis kannab kõiki kolme rea vintage'i, mille vorming määratleb, klassifitseeritud IERS I/P lippudega (eop::row_vintage): { "30" } Bulletin B lõplikku, { "54" } kiiret mõõdetud rida (lipp I ilma Bulletin B plokita) ja { "90" } Bulletin A ennustust (lipp P). Paljas jooks ilma faili argumendi ja võrguta väljastab täidetud horisondikohase tabeli, reaaruloenduse rows = final_rows + rapid_rows + prediction_rows ({ "174" } = { "30" } + { "54" } + { "90" }) ja predicted_rows.n = { "90" } üle MJD 61308-61397; ennustatud-versus-lõplike võrdluste väljaandmise piir on viimane mõõdetud rida. Varasem 32-realine väljavõte (tools/finals2000A_2026.txt, iga rea lipp I) ja viierealine ainult lõplik väljalõige jäävad tarnitavaks ja kasutatuks: neil on predicted_rows.n väärtus { "0" }, sisendfaili omadus, mitte parseri tulemus

# text
seg-1683dc91fd68 = astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), mis loeb samu baite oma lugejaga, ja IERS Bulletin A köide XXXIX nr { "039" } tabel, kopeeritud number numbri haaval; eelregistreeritud (6fdae01b) kuue täpse kriteeriumiga enne astropy käivitamist. Kõik kuus peavad: { "30" } lõplikku, { "54" } kiiret ja { "90" } ennustatud rida võrdsete MJD loenditega, iga ennustatud rea lipp P, vaikejooksu reaaruloendus võrdne ja ennustused võrdsed Bulletin A-ga viimase trükitud numbri täpsusega. Avalikustatud: lõige valiti lippude ja Bulletin B ploki lihtsa veerulõikega, mis näitas 30/54/90, enne commit'i; väljavõte on sõnasõnaline lõik, mille see hoidla lõikas IERS tootest (SHA-256 fikstuuri NOTICE-is). Valideeritud väide on tarnitud vaikesisendi vintage'i klassifikatsioon ja reaaruloendus ning selle ennustatud read; suvalised kasutaja sisendid klassifitseeritakse sama lipureegliga, kuid ei kuulu võrdlusesse. { "0.30" } voor { "1" } (asendatud): varasem vaikeväärtus nimetas { "12" } lipu I rida Bulletin A ennustusteks; mootor klassifitseerib nüüd lipu järgi. REDAKTSIOONID: vaikejooksu lahtrid, mis liikusid, on loetletud vanast uueni failis docs/revisions/M035-default-eop-recut-cell-changes.md (predicted_rows { "12" } -> { "90" }, pooluse põrand { "0.06776" } -> { "0.05550" } mas, Maa orientatsiooni liige { "14.01601" } -> { "14.01583" } m, kogusumma { "20.09759" } -> { "20.09746" } m ja { "67.03834" } -> { "67.03790" } ns, faili tests/golden/realtime-frame-eop.csv tabeli { "2" } read ja operatiivse ennustaja kokkulangevuse näitajad); varasemad failis docs/revisions/G12-default-eop-cell-changes.md

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
seg-62df6258bc62 = Ainult isekooskõla: avaldatud kogusummat kontrollitakse samas failis olevate liikmete ruutsumma vastu ja väljastatud kõver reprodutseerib avaldatud p3_time_budget_curve.csv kõigis { "57" } punktis. Mõlemad kontrollid jagavad selle mootori enda liikmedefinitsioone, seega ei ole kumbki sõltumatu. Kellaliige toetub avaldatud kella spetsifikatsioonidele, kuid lingi, süsteemi, relativistliku ja efemeriidi põranda SUURUSED on dokumenteeritud eelarvejaotused ilma välise oraaklita (sõltumatu etaloni)

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
seg-c7f6842b6019 = NAIF SPICE Toolkit N0067 (spiceypy { "8.2.0" }, MIT) koonduvad Newtoni valguse levi ajad (spkcpt/spkcpo, CN) majakast, mis on kinnitatud MOON_PA_DE440-s, DSN jaamadeni DSS-14, DSS-43 ja DSS-63 NAIF jaamakerneli earthstns_itrf93_260814.bsp järgi, koos de440s, moon_pa_de440_200625, moon_de440_250416.tf, earth_latest_high_prec ja naif0012; osatuletised on SPICE valguse levi aegade viiepunktilised tsentraalsed vahed, mitte Kshana 1/(c - u.V) valem. Eelregistreeritud (a689c797, { "2024" } epohhid) lävedega { "1" } ps igal viivitusel ja { "1e-6" } suhteline igal osatuletisel. See esimene jooks ebaõnnestus (17/75 viivitust { "1" } ps piires, halvim { "1.03e-11" } s): SPICE kannab ET-d ühe double'ina, mille samm { "2024" } juures ümardab emissiooni epohhi kuni { "6e-8" } s võrra, umbes { "6" } ps valguse levi aega, ja jääk vastab sellele ümardamisele korrelatsiooniga { "0.99999" } (kinnitatud; läbivaataja reprodutseeris selle sõltumatult). Muudatus 66e365d4, kirjutatud pärast seda tulemust ja enne selle fikstuuri olemasolu, viis sama sõltumatu etaloni ja lävendid { "25" } tunniepohhile J2000 lähedal, kus ET samm on kuni { "1.5e-11" } s: 75/75 viivitust { "1" } ps piires (halvim { "6.2e-14" } s), 75/75 majaka osatuletist (halvim { "7.4e-9" }), 150/150 jaama osatuletist (halvim { "3.8e-11" }). Väitest väljas: analüütiline vaiketee (rea Kuu, keskmine Kuu süsteem, { "24" } µs ANISE-st läbi DE440, rida „Kuu geodeetiline VLBI“), diferentseeritud Shapiro liige, mille stsenaarium analüütiliselt lisab, keskkond ning barütsentrilise-geotsentrilise skaala teisendus

# text
seg-1f10810131be = NAIF kerneli lugeja: DAF konteiner, SPK tüüp { "2" } ja binaarne PCK tüüp { "2" }

# text
seg-7da4847e7a28 = Mootori enda puhas Rusti NAIF binaarkernelite lugeja (naif_kernel): DAF konteiner (mõlemad baidijärjekorrad, lingitud kokkuvõttekirjed), SPK tüübi 2 Tšebõševi asukohasegmendid, mis on aheldatud läbi nende keskuste madalaima ühise esivanemani, ja binaarse PCK tüübi 2 Euleri nurga segmendid, mis on pööratud J2000-kehasüsteemi pöördeks, epohhidega kaheosalise ET-na, nii et alla mikrosekundi nihe säilitab oma täpsuse. Sellest loevad DE440 läbi KernelEphemeris (ephem_provider) ja lunar_vlbi, lunar_llr ning lunar_vlbi_fim kernelitee. Väide on, et see loeb JPL kerneleid õigesti; see ei ole väide, et DE440 või mootori analüütilised Päikese ja Kuu read on täpsed

# text
seg-09773b73d785 = Kaks sõltumatut kerneli lugejat samadel NAIF failidel: NAIF SPICE Toolkit N0067 (CSPICE läbi spiceypy { "8.2.0" }, MIT; spkezr ja pxform) ja ANISE { "0.10.6" } (Nyx Space, MPL-2.0; Almanac.translate ja Almanac.rotate), mõlemad käivitatud eraldi programmidena failidel de440s.bsp ja moon_pa_de440_200625.bpc. Eelregistreeritud (abcd9133) enne mis tahes fikstuuri või oraakli (sõltumatu etaloni) väärtuse olemasolu: ruudustiku algväärtus (seed) on selle commit'i räsi esimesed { "16" } kuueteistkümnendnumbrit, seega ei saanud ei { "200" } epohhi ega kehapaare valida tulemust silmas pidades; iga epohh kannab ka Kuud ja Päikest Maa suhtes. Läved fikseeritud ette kahekordse täpsusega Tšebõševi arvutusest (kuni { "15" } koefitsienti, n^{ "2" } u = { "2.5e-14" } arvutuse kohta, kaks arvutust ja kuni kaks hüpet poole kohta): asukoht { "1e-13" } R + { "1e-5" } m, kiirus { "1e-13" } V + { "1e-10" } m/s, R ja V on madalaima ühise esivanema suhtes suurem suurusjärk; pöörde element { "1e-13" } W + { "1e-15" }, W on katva kirje koefitsientide summa; ANISE lisab { "2" } ns suhtelist liikumist oma nanosekundiepohhide jaoks. Tulemus: kõik { "600" } olekut ja { "200" } pööret on oma lävendi sees mõlema sõltumatu etaloni vastu, nii lõikel kui täiskernelitel; halvim { "6.0e-3" } lävendist (asukoht), { "5.9e-3" } (kiirus), { "3.7e-3" } (pööre). Mutatsioon: iga kirje arvutamine väärtusel -s ebaõnnestub { "3597" } võrdluses. Avalikustatud: varasem 25-epohhiline kontroll SPICE vastu ({ "4.6e-5" } m, tests/naif_kernel_reader_check.rs) nähti enne seda rida ja see ei ole selle tõend; fikstuurigeneraatori esimene jooks katkes tühja ruudustikuvahemiku tõttu enne ühegi väärtuse tootmist ja see parandati. Mõlemad pooled loevad DE440, seega nõustumine valideerib lugeja, mitte efemeriidi

# text
seg-e08e98908f3a = Maa-GNSS Kuu kaugusel

# text
# c1: earth-gnss-lunar
seg-dd8ce373d1f6 = Maa-GNSS vastuvõtt Kuu kaugusel: nõrga signaali kiht, mida P7 tabel { "1" } nimetab ja mille jaoks mootoril mudelit ei olnud. Satelliidi ja epohhi kohta arvutab see kõrvalekaldenurga saatja nadiiri suhtes, kas Maa varjab otsetee, kaldkauguse ja selle vaba ruumi kao, saatevõimenduse sellel nurgal, vastuvõetud võimsuse ja kandja-müra tiheduse; seejärel agregeerib see ainult jälgimislävendi ületavad lingid ja pühib läbi täieliku konstellatsiooni tiiru, nii et vastus on JAOTUS, mitte üks hetktõmmis. Tulemuse määravad kolm fakti ja aruanne esitab igaühe: Maa katab konstellatsiooni raadiusest { "13.90" } kraadi, seega on kiirtekimbu TIPP geomeetriliselt kättesaamatu igale Kuule suunduvale kiirele; allesjääv on peasagara serv ja külgsagarad, režiim, milles LuGRE Kuul { "2025" } töötas; ning L1 teekadu on umbes { "208" } dB, umbes { "25" } dB rohkem, kui maapealne kasutaja maksab. MEASURED kaasasoleval 24-satelliidilisel GPS-klassi geomeetrial { "64" } epohhi jooksul ühe orbitaalperioodi vältel: SIGNAALI kättesaadavus { "0.375" } parima lingiga { "30.93" } dB-Hz ja FIKSI kättesaadavus { "0.000" } - kuni kaks samaaegset jälgitavat linki, mitte kunagi neli, mida asukoht vajab. Nende kahe kättesaadavuse eraldamine on mõte ja aruanne keeldub laskmast neid segi ajada: Maa-GNSS Kuu kaugusel on AJASTUSE-klassi kiht, mitte asukoha-klassi, ja kihilise vastupidavuse prioor peab võtma fiksi kättesaadavuse. Konditsioneeritus väljastatakse samal põhjusel - iga nähtav satelliit asub Kuult vaadatuna paari kraadi laiuse koonuse sees, seega on vaatejooned konstruktsiooni poolest peaaegu paralleelsed. Käivitatav liigina <c1/> Sõnastatud ümber D7 järgi: väide Kuu kaugusel on satelliitide SUHTELINE kandja-müra tihedus ühel epohhil mõõdetud kahemõõtmeliste saatemustrite (NAVCEN Block IIR/IIR-M) põhjal pluss geomeetriline nähtavus; absoluutset C/N0 ei väideta (Parker et al. raporteerivad ühist { "7" } kuni { "12" } dB kadu).

# text
seg-bed2679f88e5 = Suletud kujuga samasused ja sisemine kooskõla; välist oraaklit (sõltumatut etaloni) EI väideta. Limbi poolnurka kontrollitakse asin(R_earth/r_orbit) vastu ja geomeetriat selle vastu; vaba ruumi kadu, DOP tuum ja SGP4 propageerimine, mida see koostab, on igaüks väliselt valideeritud oma ridades ja see rida ei laena nende staatust. MIKS MODELLED, ja see on saatemuster: võimendus nurga all on ühtlaselt valgustatud ringava Airy muster, samas kui tegelik GPS L1 antenn on kaheteistkümne elemendiga heeliksmassiiv kujundatud peasagaraga, mille tipp on teljest kõrvale, et ühtlustada võimsust üle Maa ketta, ja külgsagaratega, mis ei ole Airy. Avaldatud mõõdetud mustrid on olemas ja neid siin ei kaasata, seega järjestused ja suurusjärgud kehtivad, üksiku satelliidi dB aga mitte. SEL REAL OLI ESIMENE TEOSTUS VALE VIISIL, MIDA ON VÄÄRT REGISTREERIDA: Airy avaldis kehtib ainult ettepoolses poolsfääris, selle argument läheb kui sin(theta) ja theta lähedal { "180" } kraadile mähkub see ümber ning tagastab TÄIELIKU TELJEVÕIMENDUSE ava taga - seega olid esimese aruande kaks tugevaimat linki satelliidid, mis suunasid oma antennid Kuust eemale, ja need olid ainsad kaks, mis ületasid läve. Ava taga rakendab mudel nüüd lamedat tagasagara põrandat, mis on esitatud piirina, mitte väljamõeldud mustrikujuna. Tahtlikult puuduvad, igaüks muudab eelarve OPTIMISTLIKUKS: ionosfääri- ega troposfäärikadu limbit riivavatel kiirtel, polarisatsiooni-, sihtimis- ega teostuskadu ning sfääriline Maa ilma refraktsioonilise laienduseta. Kuu asukoht on SISEND, mitte efemeriidi otsing, sest testitav suurus on link ja kiirtekimbu geomeetria. Selle rea viimine valideeritud tasemele vajab mõõdetud saatemustrit ja LuGRE normaalpunkte, mille vastu kontrollida; kumbagi pole hoidlas ja kumbagi siin välja ei mõelda. { "0.30" } voor { "2" }, leid (jääb MODELLED): mõõdetud sisendiga lingitee (reaalsed SP3 asukohad, bloki saatevõimsus, tabelina antud saate- ja vastuvõtumustrid, hõive- ja jälgimishüstereesi) kontrolliti Montenbruck et al. { "2023" } tabeli { "3" } vastu GENESIS-ele kõrgusel { "6000" } km (eelregistreeritud 5b414f0a): zeniidiantenni keskmised nõustuvad { "5" } { "6" }-st ühe dB piires artikli tundlikkusega; nadiiriantenni keskmised on { "1.0" } kuni { "2.4" } satelliiti kõrgemad kui trükitud, tõenäoliselt sellepärast, et artikkel kasutas asimuudist sõltuvaid GPS külgsagara mustreid, mida ei avaldata. Selle rea Kuu kauguse näitajad kasutavad endiselt Airy asendajat. { "0.30" }+ D7, leid (jääb MODELLED): ümber sõnastatud suurus, ühel epohhil jälgitud Block IIR/IIR-M satelliitide C/N0 ERINEVUS, ennustatud NAVCEN satelliidikohaste mõõdetud L1 mustritega (kahemõõtmelised, kaldenurga juhtimise süsteem) LuGRE lennu C/N0 vastu (eelregistreeritud 768cb62b: { "99" } % nähtav, paari RMS <= { "3.0" } dB, mediaan <= { "2.0" } dB, vähemalt { "50" } kirjet ja { "30" } paari) on liiga vähe andmeid: { "26" } kvalifitseeruvat transiidi- ja Kuu orbiidi epohhi sisaldavad { "15" } jälgitud IIR/IIR-M kirjet (enamasti jälgitakse IIF ja III) ja ühe paari. Kõik { "15" } on ennustatud nähtavad ja ainsa paari jääk on -0.06 dB; midagi ei väideta

# text
seg-29df5b40a3f9 = Kuu orbiidi määramine: Maa-GNSS versus maapealne raadiomeetriline

# text
seg-647902ebcee3 = Orbiidi määramine peaaegu sirges halo-orbiidis (või elliptilises külmutatud orbiidis) kahest sõltumatust andmetüübist: pardal vastuvõetud Maa-GNSS pseudovahemaad (rea Maa-GNSS Kuu kaugusel lingireegel pluss Kuu varjamine) ning maapealne kahesuunaline kaugus ja kauguskiirus kolmelt Deep Space Network jaamalt. Kumbki on ühe sammuga partii vähimruudud etalonorbiidi ümber oma formaalse kovariatsiooniga; algväärtustatud (seed) Monte Carlo nende kahe hinnangu vahest testib, kas kaks kovariatsiooni seletavad seda (q = d' (P_G + P_R)^-1 d, hii-ruut kuue vabadusastmega, kui mudelid sobivad) ja mida modelleerimata kiirendus statistikaga teeb.

# text
seg-226dedaba243 = Sõltumatu scipy/numpy programm integreerib samad variatsioonivõrrandid (lävi O1). Midagi ei võrrelda Kuu orbiidi mõõtmisega. Oraakel (sõltumatu etalon) kontrollib nimetatud valemite numbrilist poolt, mitte füüsikat, seega jääb rida MODELLED. Piiratud kolme keha mudel: Päikest ei ole, Kuu harmoonilisi ei ole, Maa pöörlemistelg piki orbiidi normaali, ILLUSTRATIVE vastuvõtja ja jaama sisendid.

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
seg-179fb996fc72 = DOP aritmeetika on crate::orbit::dop tuum, eraldi väliselt valideeritud gnss_lib_py vastu failis tests/dop_reference.rs; see rida ei laena selle rea staatust uuesti. Majaka nähtavuse silmapiir on L01 suletud kuju ja sigma = DOP x sigma_URE on standardne GNSS seos (Kaplan ja Hegarty, Understanding GPS/GNSS, jaotis { "7" }). Selle rea sees kontrollitakse täiendust ennast sõltumatu hoidlasisese DOP tee vastu ja see on kinnitatud commit'itud kuldfailile. MIKS MODELLED: konstellatsiooni disain, majakate paigutus, antennikõrgused ja kõik kolm veaeelarve suurust on illustratiivsed sisendid, mitte välja ehitatud mõõdistus ega mõõdetud link, seega on raporteeritud meetrid valitud stsenaariumi omadus, mitte ühegi kasutusele võetud teenuse oma. MÄRKUS PÄRITOLU KOHTA: seda võimekust reklaamiti README-s ja see oli katsetatud kahe valideerimistestiga, kuid sellel EI olnud maatriksirida ega stsenaariumi liiki, seega ei saanud seda jooksust üldse kätte. See oli väidetud proosas, puudus registrist ja oli mootoris kättesaamatu korraga. Rida ja liik lisati koos. { "0.30" } voor { "2" } (eelregistreeritud db0eb9ec), blokeeritud (jääb MODELLED): ANISE { "0.10.6" } nähtavus ja numpy DOP rea geomeetrial nõustuvad (nähtavad hulgad täpsed, sealhulgas { "72" } silmapiiri lähedast ja { "48" } maski lähedast juhtu; DOP { "7.2e-13" } piires), kuid raporteeritud meetrid on DOP korda illustratiivne { "1.158" } m ruutsumma kaugusviga ilma oraaklita (sõltumatu etaloni); ulatuse piiramine, mis need välistaks, ootab omaniku otsust

# text
seg-b0b618abf402 = Ühisrežiimi terviklikkuse pimedus

# text
seg-e732ac99a9ae = Mõõtmisvea täpne pariteediruumi jaotus osaks, mida RAIM ei näe, ja osaks, mida see näeb. Lineariseeritud hetktõmmise mudelis y = G·x + e laguneb iga viga dy üheselt PIMEDAKS komponendiks range(G)-s — neelatud olekuveana S·dy ja hävitatud jääkprojektoriga Pperp = I − G·S, seega nähtamatu MIS TAHES jääktestile, mitte ainult konkreetsele lävele — ja TUVASTATAVAKS komponendiks pariteediruumis. Moodul tagastab projektori, jaotuse ja pimeda murdosa, nii et kutsuja saab kvantifitseerida, kui palju konkreetsest veast hetktõmmise monitor struktuurselt raporteerida ei suuda. Rakendatud reaalsele efemeriididevahelisele põrandale: meetritasemel DE440-versus-INPOP21a ja DE440-versus-EPM2021 lahknevus geotsentrilises Kuu asukohas neelatakse peaaegu täielikult kasutaja asukohaveana (pimeda murdosa mediaan { "1.000000" }; pimeda asukohavea mediaan { "2.3955" } m ja { "2.0050" } m) pariteedijäägi vastu { "1e-15" } m tasemel

# text
seg-077303e9dd72 = P2: numpy linalg.lstsq (LAPACK gelsd SVD, BSD-3) arvutab vähimruutude jaotuse uuesti commit'itud sisenditel KOOS reaalse pariteediosaga (dy = E·Δs + w, w ~ N({ "0" }, { "1" } m), algväärtus { "20261001" }) 8-satelliidilisel geomeetrial ja 6-satelliidilisel alamhulgal, { "1464" } juhtu üle mõlema reaalse efemeriididevahelise paari, eelregistreeritud (f672a314): blind_dx, residual, blind_norm ja detectable_norm { "1e-12" } suhteliselt |dy|-le ja blind_fraction { "1e-12" } absoluutselt piires (halvim blind_dx { "1.06e-14" }, residual { "4.4e-15" }, blind_fraction { "3.1e-15" }). numpy ehitab G ise commit'itud asukohtadest, samas kui mootor kasutab normaalvõrrandeid Gauss-Jordaniga; kaldus vasakpoolne pöördmaatriks muudab testi punaseks juures { "5.5e-2" } |dy|. Muudatus { "1" } (86c53301, pärast esimest jooksu, avalikustatud) leevendas ainult sisendi eeltingimust pariteedimurdosal (iga juhtum vähemalt { "1e-3" } ja { "95" } % igast geomeetriast vähemalt { "0.05" }), mitte kokkulangevuse lävendit. Valideeritud väide, nagu P2 lubab: jaotuse lineaaralgebra neil sisenditel; efemeriididevahelise põranda suurused ja illustratiivne Kuu geomeetria ({ "8" } LCNS-laadset sõlme { "5000" } km juures) on sisendid, mitte valideeritud, ja pimedus on kõigi hetktõmmise RAIM-ide teadaolev omadus. Voor-1 numpy võrdlus (tests/lunar_common_mode_integrity_reference.rs) kontrollis ainult samasust S·G = I, sest selle sisendid asusid range(G)-s; see on säilitatud regressioonina. Efemeriidi päritolu: tests/fixtures/inter_ephemeris/NOTICE.md (JPL, IMCCE, IAA RAS)

# text
seg-845e9f5eec81 = Ühisrežiimi kaitsetase ja kogu terviklikkuse ümbris

# text
seg-ffc59a7ed497 = Analüütiline projektori algebra, mida kontrollitakse iseenda vastu: range(G)-ga piiratud kovariatsioon peab andma positiivse CMPL-i, pariteediruumiga piiratud kovariatsioon peab andma ligikaudu nulli ja ümbris peab summeerima kaks mõõteruumi suhtes ortogonaalset panust. Ühisrežiimi kovariatsioon, konstellatsiooni geomeetria ja k on esinduslikud modelleeritud sisendid, MITTE sertifitseeritud eelarve, ja ei väideta, et kolmnurgapiir oleks tihe. MÄRKUS PÄRITOLU KOHTA: cmpl_horizontal, blind_position_covariance ja integrity_envelope on avalikud ja tarnitud ning nende ühikutestidele viitas juba ühisrežiimi pimeduse rida, kuid ÜMBRISE VÄITEL ise rida ei olnud -- seega ühtegi hoiatust, mis seda ausana hoiab, nimelt et summa on kolmnurgapiir ja mitte RSS, ei olnud registris kusagil öeldud. Rida registreerib väite ja hoiatuse koos.

# text
seg-5ed34a5b402e = Kuu ühine mitmetehnikaline OD + kell

# text
seg-5ace1caff5a9 = VLBI + Kuu-kohaliku kauguse + satelliitidevahelise kauguse partii liitmine jaamade+konstellatsiooni asukohtade ja kellade taastamiseks

# text
seg-82824963aef7 = P2: numpy { "2.4.6" } (numpy.linalg.lstsq LAPACK gelsd-ga, numpy.linalg.inv; BSD-3) arvutab uuesti iga Gauss-Newtoni sammu, koondunud kaalutud vähimruutude lahendi, formaalsed sigmad ja jaama vea kuue simuleeritud võrgu commit'itud Jacobi maatriksitel ja vaatlustel, eelregistreeritud (5094bc31) täpsusega max({ "1e-8" }, { "100" } kappa eps) suhteliselt. Esimene jooks ebaõnnestus ilma VLBI-ta võrgul ({ "6.1e-7" } versus { "1e-8" }, normaalvõrrandi pöördmaatriks tingimusarvul { "1.4e5" }); pärast seda tulemust kirjutatud mootori parandus (batch_ls::gauss_newton_qr, Householderi QR samm, mida kasutavad estimate ja formal_covariance) käivitati uuesti muutmata lävega: sammud { "1.1e-14" } kuni { "2.4e-11" }, sigmad kuni { "1.3e-11" }. Valideeritud väide on liitmislahendi lineaaralgebra neil sisenditel, mitte simuleeritud võrgu ega selle vaatlusmudelite füüsikalised suurused: Kuu geodeetilise VLBI viivituse rida jääb MODELLED (selle analüütiline tee erineb ANISE-st kuni { "24" } µs), ja süsteemidel on oma read. Süstitud simuleeritud tegeliku väärtuse taastamine ja NEES kooskõla jäävad sisemisteks kontrollideks; varasem Orekit { "12.2" } / Hipparchus Levenberg-Marquardti ristkontroll (tests/lunar_joint_multi_technique_od_reference.rs) kasutab batch_ls::gauss_newton-i, mida estimate enam ei kutsu, ja on säilitatud selle primitiivi kontrollina. { "0.30" } redaktsioon: vaike lunar-joint-od-clock jaamavead { "3.541344" } -> { "3.541350" } m VLBI-ga ja { "2183.119" } -> { "2183.558" } m ilma (QR lahendus). { "0.36" } redaktsioon (STUDIO-15, portatiivne matemaatika; docs/revisions/STUDIO15-portable-math-rebaseline.md): { "3.541350" } -> { "3.536885" } m VLBI-ga ja { "2183.558" } -> { "2184.021" } m ilma, ja ilma VLBI-ta lahend peatub pärast { "5" } iteratsiooni, mitte { "2" } (ümardusega piiratud peatus halvasti konditsioneeritud võrgul); eelregistreeritud võrdlus käivitati uuesti uuesti eksporditud sisenditel muutmata lävega (numpy { "2.4.6" }, kõik kuus võrku läbivad)
