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
seg-c3c260b7063e = Testid

# text
seg-33d506570c1b = srp_shadow::tests (rõngakujuline kinnine kuju, ühtlane seadus, mis taastoodab koonilise varju, täis päikese ja täisvarju piirid)

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } juhtumit x { "25" } tunnipõhist olekut { "24" } h jooksul, LEO, GEO ja HEO, kolmas keha ning kolmas keha + SRP: halvim |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; analüütilise jada kontroll jääb mööda { "9.96" } m; Päike { "6.39" } m ja Kuu { "0.244" } m Orekiti DE440 asukohtadest, registreeritud möödalaskmine); propagatori ühiktestid (pakkuja keeldumine, varulahenduse loendamine, mida jagatakse kloonide vahel)

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (S1 liige on ööpäevane, pöörab veerand päevaga { "90" } kraadi ja omab iga rea koormusteguri amplituudi; füüsikaline suurus LEO-l); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit { "8" } väljaspool telge punktis: maks |da| { "2.2e-17" } m/s^{ "2" } väärtusel N = { "70" }, käivitatakse alati; { "3.5e-17" }, { "3.9e-17" } ja { "7.3e-17" } m/s^{ "2" } väärtustel N = { "200" }, { "360" }, { "2190" }, andmetest sõltuv KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs ({ "24" } h 200x200 orbiit, andmetest sõltuv: halvim |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; 70. astme kontroll { "0.726" } m); gravity_sh ühiktestid (kokkulangevus klassikalise hindajaga { "1e-13" } täpsusega astmel { "70" }, lõplik vahe ja poolusepidevus 2190. astme väljal, alatäituv 2190. astme liige laiendatud eksponendiga arvutuse vastu)

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } stsenaariumi: ulatuskiirus, az/el ja segu, LEO ja MEO, mürata ja algväärtusega sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, { "5" } ja { "10" } kraadi maskid, Orekit { "12.2" } vastu: nähtavad komplektid identsed; mõõtmisväärtused { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad piires; STM { "1.2e-14" } suhtelise piires; müraga olekud { "1.74" } cm ja { "1.14e-5" } m/s piires; tüübipõhine järelsobituse RMS { "2.7e-4" } suhtelise piires; mürata kshana tõe vastu { "1.06e-8" } m; mürata kshana Orekiti vastu { "1.464" } ja { "1.740" } cm kahel stsenaariumil, registreeritud möödalaskmine { "1" } cm lävest); orbit_determination ja batch_ls ühiktestid

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = src/sp3.rs ühiktestid; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (kinnitatud { "8" } h ESOC testikomplekt, sigma { "0.032" } m päise eksponendist { "5" }: Tier-1 3D RMS { "0.132" } m muutmata, Tier-2 { "0.035" } m vastu { "0.070" } m sigmal { "1" } m, muutus tuleneb ümber tasakaalustatud empiirilisest a priori piirangust); tests/agency_swarm.rs (Swarmi toode ei kanna täpsuskoode ja langeb tagasi, fikseeritud)

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (CRC-24Q kontrollväärtus 0xCDE703; konvolutsiooniline impulssvastus; Viterbi parandab süstitud vigu; paigutuse laiused); tests/gnss_navmsg_roundtrip.rs (välja algusbitid võrduvad ICD bitinumbritega; kodeerimine -> FEC -> põimimine -> Viterbi -> dekodeerimine ringkäigud poole LSB piires); tests/gnss_navmsg_galileo_brdc_grid.rs (IGS BRDC 2018-133 Galileo kirjed LSB ruudustikul, halvim { "3.6e-3" } LSB; eelregistreeritud satelliitide arvu lävi jäi mööda, { "15" } { "20" }-st, FINDING)

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (müravaba läbilaskmine; valge müra dispersioon 1/(2N-1); taaskäivitused); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } epohhi, N = { "100" }: mediaan 3-D viga { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (IGS MGEX RINEX { "4.00" } faili MAO000USA_R_20231980000_01D_30S_MO esimesed { "4" } epohhi, { "58" } satelliiti, { "7" } süsteemi: päisekirjed ja esimese epohhi väärtused võrduvad avaldatud literaalidega); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (sünteetiline { "4.02" } päis spetsifikatsioonist)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (tegelikud C01-C04 kirjed: geostatsionaarne raadius, pikkuskraadid 140.02/80.04/110.55/159.99 kraadi avaldatud kohtades, |laiuskraad| { "2.13" } kraadi kaldega vs { "6.65" } ilma; eelregistreeritud edastatud efemeriidi ja täpse SP3 võrdlus on andmetest sõltuv (KSHANA_BDS_GEO_SP3) ja seda ei ole käivitatud); rinex::tests

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (8-kujuline sõit: püsiv 3-D RMS { "0.025" } m kandelainega vs { "0.470" } m koodiga identsetel mõõtmistel; { "12" } algväärtuse (seed) keskmine NIS/dof { "1.00" } ja püsiv NEES/dof { "0.92" }; 1-tsükline libisemine tuvastatakse oma epohhil ilma valehäireteta ja lahend jääb terviklikuks; edastatud parandite väljalülitamine tõstab koodivea { "0.51" } m-lt { "19.6" } m-ni (ionosfäär) ja { "8.0" } m-ni (troposfäär); müravaba käitus koondub { "0.3" } mm-ni)

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (iga pakett: liitmine annab katkestuse ajal parema tulemuse kui vaba INS mõlema anduri puhul; raudtee: tihe { "5.3" } m vs lõtv { "12.9" } m navigatsiooniklassi puhul ja { "15.6" } m vs { "18.8" } m taktikalise klassi puhul katkestuse ajal, kättesaadavus { "0.97" } vs { "0.95" }; tihe tabel valideeritud); tests/gnss_ins_legacy_trajectory_pin.rs (lõdvalt sidestatud vaikeväärtus bitthaaval identne)

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (3-D filter { "60" } algväärtuse (seed) kohta: teise poole keskmine NEES { "8.12" } { "8" } oleku kohta, viimase epohhi χ² summa oma { "95" } % vahemikus; { "0.1" } ns kellaparandus vähendab 3-D asendi sigmat { "5.58" } m-lt { "3.07" } m-ni; nihkefilter { "60" } algväärtuse (seed) kohta: χ²({ "5" }) summa vahemikus, nihe { "3" } sigma piires { "59" }-l { "60" }-st; fusion-pnt-coupled kallutatud kiirendusmõõtjatega: asendi p95 { "18.7" } m / { "90.0" } m ja terviklikkus { "1.00" } / { "0.97" } sidestatud vs { "430" } m / { "4060" } m ja { "0.006" } / { "0.000" } lahtisidestatud); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion ja hybrid ilma [coupled] bitthaaval identsed)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (koordineeritud pööre ei anna külgjõudu ja koormustegur on 1/cos φ; CSV import reprodutseerib lennatud profiili täpsusega { "1e-3" } m/s ja { "1" } m); tests/gnss_ins_trajectory_library.rs (iga profiil käivitub ja liitmine annab katkestuse ajal parema tulemuse kui vaba INS; iga profiil lendab oma nimetatud liikumise; suuna jälgitavus: asimuudi sigma { "240" } s järel { "1.27" } kraadi sirgel kruiisil vs { "0.039" } kraadi 8-kujulisel ja { "0.062" } kraadi peatumise ja liikumise vaheldumisel); tests/gnss_ins_legacy_trajectory_pin.rs (vana tulemus ja tõe räsid bitthaaval identsed)

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE märts { "2023" }, { "4" } periluuni ja { "5" } apoluuni: periood { "6.5004" } d vs { "6.5699" } d ({ "1.07" } %, lävi { "3" } %), apoluun { "71 182" } vs { "71 215" } km ({ "0.05" } %, lävi { "5" } %), periluun { "3 385" } vs { "3 245" } km ({ "4.1" } %, lävi { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: stsenaariumi scenarios/training/fjord-natural-degradation.toml sünteetilisel fjordi läbimisel arvatakse samad { "624" } epohhi maha nii öeldud [skyline]-ga kui ilma; sellega teatatakse sky-blocked { "680" } epohhil ({ "0" } ilma: asimuudilünga varuvariant ei näe kahepoolses fjordis midagi), open_fraction on { "0.758" } ja keskkonnaklassi epohhid vähenevad { "78" }-lt { "33" }-ni, ülejäänud on satelliitide kaod, mille öeldud horisondijoon jätab lahtiseks; väljaspool sündmust horisondijoon ühtegi skoori ei muuda); receiver_trust::geometry::tests (käsitsi tuletatud suhted lävendite juures, lävendi servad, tõus ja lagi, põhi, sildi servad, [geometry] ülekirjutused, DOP valideeritud tuumal, hoitud ja aegunud taevad, tundmatut ei oletata, signaali kadu, halva geomeetria tolerants, fiksi puudumise sentinellid); tests/geometry_trust.rs (õiglane maskeeritud taevas sildistatud ja skoorimata, halb maskeeritud taevas, madala kõrguse kadu, võimsuse langus, võltsitud HDOP, täielik signaalikadu, äratõmbamine halva geomeetria ajal, tundmatu geomeetria, sessiooni ülekirjutused, live skeem); tests/geometry_trust_no_change.rs (mõlemad näidissessioonid bait-baidilt identsed { "0.35.0" }-ga pärast lisatud võtmete eemaldamist); tests/geometry_corpus_identity.rs (iga sissekirjutatud laevade NMEA korpus, ka GPS-only lahtise taevana, ja meeskonnakoolituse stsenaariumid: bait-baidilt identsed { "0.35.0" }-ga, välja arvatud halvad epohhid, mis erinevad ainult geomeetria mahaarvamise poolest)

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (ühe kella tuum gnss_lib_py vastu)

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (vs mitmeastmeline Kalmani kovariatsioonirekursioon; valge-FM täpne; edasi-tagasi); coast-variance tuum väliselt valideeritud failis tests/gnss_denied_clock_holdover_reference.rs (vs scipy Van-Loan/brentq)

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-3016100a7015 = clock_state::tests (analüütiline van-Loani Q; NEES; PSD positiivsus); tests/clock_state_reference.rs (täielik ennustus+uuendus-trajektoor — olek x ja { "3" }×{ "3" } kovariatsioon P { "1925" } sammu / { "4" } parameetrikomplekti kohta vs filterpy { "1.4.5" }; halvim |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (kinnitab leiu); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ring { "3" })

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (reciprocal cancellation; two-form Sagnac identity); tests/time_transfer_error_budgeting_reference.rs (ekvatoriaalse ringmaailmareisi Sagnac = { "207.386" } ns vs avaldatud Ashby { "207.4" } ns täpsusega <{ "0.05" } ns; lisaks Sagnaci/geodist geomeetria ristkontrollitud RTKLIB { "2.4.3" } geodist() vastu, kompileeritud C lähtekoodist)

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (BPSK self-SSC = 2/3R_c; unit-area PSD; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS C/A Goldi risk-/autokorrelatsiooni täpne täisarvuline vaste sõltumatu IS-GPS-200 koodigeneraatori vastu; BPSK-R({ "1" })/sine-BOC({ "1,1" }) PSD vs sõltumatu scipy periodogramm); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, kinnitatud)

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016 põranda raam); tests/quantum_inertial_sensor_reference.rs (ülekandefunktsioon |H(ω)|, k_eff·T² ja jaotusmüra ASD vs avaldatud Cheinet { "2008" } / Peters / Freier arvvektorid); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, kinnitatud; gradiometer_qpn_line_matches_janvier_model)

# text
seg-81802510f112 = quantum_imu::tests (a_max asub ±π poolvöödi servas 1/T² ulatuse skaleerimisega; mähitud faasi taastamine on täpne vahemikus [−a_max,a_max] ja alias täpselt { "2" }·a_max võrra väljaspool seda; ühemõtteline dünaamiline ulatus a_max/σ_a=π/σ_Φ on identne kahe väga erineva lainepikkuse/T skaalateguri puhul; CaiAccelerometer meetodid vastavad vabadele funktsioonidele)

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (nihe vs AccelModel integraator; VRW vs analüütiline integraal); tests/quantum_inertial_dead_reckoning_reference.rs (VRW vs sõltumatu numpy Monte Carlo kahekordne integreerimine valge kiirenduse mürast, halvim hälve { "0.42" }% piires ±{ "3" }% { "6" } rannikuaja jooksul; nihe/skaalategur vs Grovesi { "2013" } suletud kujuga väärtus; holdover-i edasi-tagasi teisendused)

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form ja cw_q_equals_the_spectral_separation_closed_form: Q tabel, CW ja kitsaribaline { "1" }, lairibaline ja pühitud { "2" }, kinnitatud navsignal suletud kujude külge; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/efektiivne C-N₀ vs sõltumatu numpy uuestituletus Kaplani ja Hegarty §{ "9.4" } lingibilansist; tegelik JammerTest C/N₀ langeb monotoonselt läbi { "25" } dB-Hz läve); tests/jamming_jammertest_cn0_oracle.rs (eelregistreeritud, blokeeritud, käitamata)

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (TEXBAT parameetrite iseloomustus); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (kinnitab leiu); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (suletud kujuga etalonid + CUSUM); examples/tpl_jammertest.rs (JammerTest { "2024" } tegeliku spuufimise kalibreerimine); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (kinnitab leiu); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (kaardiga sobitamise CRLB; IGRF-14 väli); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (60-minutiline GPS-ita bench tegelikul EGM2008 astme 70 väljal, eelregistreeritud kaustas xval/icgem-egm2008/: sobitatud { "3106" } m, seega lävi < { "500" } m on NOT MET ja kinnitatud kui täitmata, ning kümnekordne vähendamine { "70.6" } km triivil on MET; pluss algväärtustatud (seed) kaardivea Monte Carlo); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel ja tests/emag2_real_grid.rs (andmetest sõltuv EMAG2v3 lugeja tegelikul väljalõikel; sellel ei väideta navigatsioonitulemust); tests/terrain_slam_rbpf.rs (ühine kaardihinnang, FastSLAM-laadne RBPF, vs teadaoleva kaardiga SITAN { "15" } m korreleeritud kaardivea korral { "20" } algväärtuse (seed) kohta, eelregistreeritud kaustas xval/terrain-slam-rbpf/: { "1.5" }% keskmine kasu ja parem { "10" }-l { "20" }-st, seega on { "10" }% ja 12/20 läved NOT MET ja kinnitatud kui täitmata; kahjuta täpse kaardi korral, MET)

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (genereeritud SBOM valideerub null veaga ametliku CycloneDX-i { "1.5" } JSON-skeemi vastu kogu 66-komponendilisel tarnitaval graafil: vaikimisi + python + wasm funktsioonid, arendussõltuvused välja arvatud)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfect=1/identical=0.5/tie={ "0.125" }, ROC monotoonne, fused>{ "0.8" }, klassipõhine kihtide eraldatus, lekke kaitse, reprodutseeritav korpus, jaotuse nihke lipud optimismi); dominance_demonstrators (kättesaadav + reprodutseeritav + MODELLED-not-VALIDATED + optimismilõhe enesekooskõlaline)

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (klassipõhine etaloni AUC≈{ "1" }, õpitud optimismilõhe>{ "0" }, ruudustiku kuju + bootstrap CI ümbritseb keskmist + positiivne skaleerimistrend, ID tunnused lõplikud, lõhe ennustaja ületab keskmise ennustamise MÕLEMA leave-one-detector-out ja leave-one-class-out CV korral + deterministlik); impairment_ml::tests (logreg eraldab + deterministlik + kadu↓, MLP lahendab XOR-i, mida lineaarne mudel ei suuda + algväärtustatud (seed)); eval_stats::tests (bootstrap/DeLong/Spearman/ridge vs suletud kujud)

# text
seg-e0f68f57399d = quantum_trade::tests (ADEV edasi-tagasi taastamine, NNLS mittenegatiivsus, põranda hoiatus olemas/puudub, kasu>{ "1" }, monotoonne mähis + alt-PNT piir); dominance_demonstrators (mõõdetud-ADEV on andmepõhine, mitte põrandaga eeldatud, eeldatud klass lipustab põranda + hoiatuse, väärvormitud kõver tagasi lükatud, MODELLED-not-VALIDATED)

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap täpne ruudustiku punktides + edasi-tagasi + monotoonne, ööpäeva Ap keskmine, eksosfääri T vs avaldatud päikesemiinimumi/keskmise/maksimumi + tormi juurdekasvu ankrud, tihedus ühik viitel, päikesetsükli kõikumine vaadeldud { "5" }–{ "10" }× vahemikus, stsenaarium reprodutseeritav + MODELLED-not-VALIDATED + vahemikust väljas tagasi lükatud); dominance_demonstrators (kättesaadav + reprodutseeritav + füüsikaline T + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (otse itta start jõuab i=laiuskraad, KSC→ISS = õpiku { "45" }°, polaarne = N/S, i<lat kättesaamatu, { "465" } m/s ekvatoriaalne boonus, tasandimuutus { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, päevaste võimaluste arvud, stsenaarium reprodutseeritav/MODELLED + dogleg-tee); dominance_demonstrators (kättesaadav + reprodutseeritav + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-c763ac7e3cda = reentry::tests (tipp-g sõltumatu ballistilisest koefitsiendist + füüsikaline g-vahemik, kasvab järsema γ / kiirema sisenemisega, tipp-g kiirus = V_e·e^(−1/2) ja tippkuumenemine = V_e·e^(−1/6) kiiremini, tipp-g kõrgus füüsikaline + sügavam suurema B korral, stsenaarium reprodutseeritav/MODELLED + degenereerunud geomeetria tagasi lükatud); dominance_demonstrators (kättesaadav + reprodutseeritav + V_e·e^(−1/2) osa + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (ainult ristkontroll); tests/reentry_point_mass_accelerometer_oracle.rs (blokeeritud, käitamata)

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (käsitsi tuletatud kulu katvuse kohta 48/96={ "0.5" }, ROI suhe { "2.667" }, raamide järjestuse + nullkatvuse kaitsed)

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (sama tuvastamata jäänud sündmus pöörab Available→MI→HMI konteksti karmistudes; konservatiivne-PL→Unavailable; teljepõhine HMI; sisendite kaitsed)

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (füüsikaline VRW jääb viidatud VRW raami sisse kõigil { "3" } tasemel; toores vöödi mitmetähenduslikkuse ulatus arvutatud k_eff·T²-st; konservatiivne eelarve triivib rohkem kui parim; iga raam on allikaga + kinnitusega lipustatud; raamide järjestuse kaitsed)

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (neli piirkonda + kaasavad piirid + |viga| + PL>AL kättesaamatus); tests/tib_scorer_reference.rs (klassifikatsiooni arvud vs sõltumatu numpy fikseeritud sünteetilisel hulgal)

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (puhas/alapiiratud/kõik-kättesaamatud/tühi); tests/tib_scorer_reference.rs (arvud + määrad + coverage_ok vs numpy täpsusega { "1e-12" })

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (nihkeprofiilid, monotoonne rannik, tuvastamatu hulga lipustamine, max_offset kooskõla, täpselt kaks tuvastamatut klassi)

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (etalon-PL neelab; rikutud PL neeldumata-kunagi-tuvastamata; tuvastatava katvuse otsus; aususe omadus, et tuvastamatu stsenaariumi jaoks ei ole ühtegi katvuse/tuvastamise otsust saavutatav)

# text
seg-6d963d838eed = hybrid_integrity::tests (lahendatud konfiguratsioon kajastatakse nii vaikeväärtuste kui ka ülekirjutuste puhul, ilma lainepikkust meetrite kaudu edasi-tagasi teisendamata; iga ühikute kirje kannab nii ühikut kui ka päritoluklassi; iga väli, mille ühikute plokk nimetab, tegelikult väljastatakse, seega ei saa see dokumenteerida kummitust)

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (kättesaadavus võrdub kahe indikaatori korrutisega, mis on arvutatud uuesti aruande enda varudest, ja need varud on ise uuesti kokku pandud aruande enda EIRP-st, vabaruumi kaost, koondatud kaost, kvaliteeditegurist, Boltzmanni liikmest, andmekiirusest ja nõudest täpsusega { "1e-9" } dB; väärtus on mõõdetult { "0" } või { "1" }, samas kui optiline kättesaadavus samal käitusel on mõõdetult rangelt nende vahel; iga teguri rida kannab päritoluklassi suletud field_schema sõnavarast; teatatud sulgumisulatus, mis on lingibilansi kaudu uuesti käitatud, annab varu { "0" } kuni { "1e-9" } dB ja on mõõdetult sõltumatu ulatusest, kus käitus asus, nelja dekaadi ulatuses, samas kui ulatuse kasutus muutub täpselt ulatuse suhte võrra; -40 dBW link teatab kättesaadavuseks { "0" }, LOST, ja kasutuseks üle { "1" }, mitte murdosa; aegunud märkus 'no RF-availability counterpart is computed by this engine' on kinnitatud kadunuks ja asendus on kinnitatud uut välja nimetama; väärvormitud RF sisend lükatakse tagasi, mitte ei piirata)

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (suhe võrdub kahe väljastatud haru jagatisega täpsusega { "1e-15" } suhteliselt ning selle pöördväärtus ja detsibellivorm on kooskõlas; iga haru ulatus ja aja sigma on seotud täpselt c-ga; väljastatud ühine konfiguratsioon on kinnitatud võrduvaks stsenaariumi enda ulatuse ja integreerimisajaga ning RF haru ulatus on kinnitatud võrduvaks optilise haru omaga; RF haru C/N0 on bitthaaval kättesaadavuse ploki oma, ühest lingibilansist, mitte uuestituletus; LIKE-FOR-LIKE omadus on MEASURED, mitte kinnitatud -- ühise akumulatsiooniaja neljakordistamine poolitab optilise haru täpsusega { "1e-12" } ja RF haru täpsusega { "1e-7" } ning jätab suhte paigale täpsusega { "3.19e-9" } suhteliselt, mida mõne muu suuruse üle salaja keskmistav haru ei suudaks; rf_dll_bandwidth_hz ülekirjutus, mis rikub ühise keskmistamisaja, teeb suhte nulliks põhjusega, mis nimetab mõlemat aega, samas kui mõlemad harud väljastatakse endiselt; ühesuunaline käitus teeb võrdlusharu bitthaaval väljalastud peamiseks tulemuseks karistusteguriga täpselt { "1" } ja kahesuunaline käitus reprodutseerib karistuse 0.5/sqrt(tagasitee geomeetriline kadu), arvutatud uuesti aruande enda geometric_loss_db-st täpsusega { "1e-12" })

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (kolme sagedusriba, nelja ulatusdekaadi ja mõlema sulgumisotsuse korral arvutatakse varu ja selle all olev vabaruumi kadu uuesti ainult aruandest täpsemalt kui { "1e-9" } dB; võrrandi liikmetest kokku pandud nõutav G/T on kooskõlas sama suurusega, mis saadakse kui G/T miinus varu, ja selle juures uuesti käitamine nullib varu; kolm bilanssi väga erineva EIRP, kao ja lävega, kuid võrdse lingikonstandiga annavad identse nõude, samas kui { "1" } dB konstandil nihutab seda täpselt { "1" } dB; võimenduse jaotus puudub, kui müratemperatuuri pole öeldud, ja mittepositiivne lükatakse tagasi; iga väli, mille ühikute plokk nimetab, tegelikult väljastatakse)

# text
seg-d9742b5a3a48 = lunar_time_budget::tests ja lunar_time_budget_scenario::tests (kõik neli klassi on olemas ühel käitusel ja küsitud alamhulga järjekorras; iga rida on kooskõlas oma suletud kujuga paremini kui { "1e-12" } suhteliselt; raamivea skaleerimine teguriga k skaleerib ristumist teguriga k flicker-FM kella puhul ja teguriga k^{ "2" } valge-FM kella puhul, kontrollitud juures k={ "2" } ja k={ "3" }, mis eristab kahte müraklassi; iga rida reprodutseerib ühe kella ristumise, mille eelarve juba teatas; iga rida taastab ühe jagatud raamiliikme; tundmatu kella nimi lükatakse tagasi)

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests ja attack_surface::tests (ruudustik on täielik ja iga püütud osakaal asub vahemikus [{ "0,1" }]; püütud osakaal on saatevõimsuse suhtes mittekahanev igas sõlmes; see EI OLE monotoonne kiirelaiuse ega kõrguse suhtes, mida kinnitab oma test, et pühkimist ei saaks hiljem silendada; baassõlm reprodutseerib olemasoleva püütud osakaalu bitthaaval; ainult servapõhine hindamine on bitthaaval identne täieliku pühkimise viimase punktiga; leitud ristumine asub lävel täpsusega { "1e-9" } dB ja jääb kahe punkti vahele)

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (kõik { "57" } keskmistamisaega x { "8" } liiget on olemas, ruudustiku indeks jookseb { "0" }..={ "56" } ja kannab { "8" } rida igaüks; <c1/> rida võrdub seitsme selle kõrval oleva liikme ruutude summa juurega igal tau juures; tabel järgib küsitud ruudustikku, mitte kõvakodeeritut; selle väljastamine jätab aruande JSON-i bait-baidilt identseks)

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: kui juhtimine on väljas, võrdub kellaliige eelarve kellaliikmega bitini kõigi nelja klassi puhul; bisection_matches_the_closed_form täpsusega { "1e-9" } suhteliselt mõlema müraklassi puhul; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: vaikedokument, tabel ja kokkuvõte on muutmata ning plokk lisab ainult oma objekti ja ühikud; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: optical < PHM < RAFS < miniRAFS vahemikus { "1" } s kuni { "7e5" } s, kusjuures PHM ja RAFS kõverate ristumine vahemikus { "7e5" } ja { "8e5" } s on kinnitatud avalikustatud omadusena üksiku müratüübiga kellamudelite puhul; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (kaugvälja piir vastab delta_dor-ile; lähivälja parandus; FD osatuletised); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } teegi testi: Maa serva poolnurk vs selle suletud kuju asin(R/r) täiendava kinnitusega, et IGA varjamata link asub väljaspool seda koonust, seega ei saa varjutuse test ja serva nurk olla vastuolus; varjutuse predikaat kontrollitud lähiküljel, kaugküljel ja juhul, kui keha asub saatja TAGAS; teekadu piiratud usutava Kuu ulatuse vahemikuga igal lingil; jälgitav hulk näidatud olevat geomeetriliselt nähtava hulga alamhulk ja varjatud hulgast lahutatud; monotoonsus mõlemas suunas - rohkem vastuvõtuvõimendust ei vähenda kunagi arvu, rangem lävi ei suurenda seda kunagi; ühelegi lingile ei omistata rohkem kui telgjoone võimendust; Maa sees olev vastuvõtja lükatakse tagasi; pühkimine kinnitatud epohhiga tegelikult MUUTUMA; ning signaali ja fiksi kättesaadavus kinnitatud erinevaks, õiges järjekorras ja kooskõlas epohhipõhiste ridadega); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (kinnitatud); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (kinnitatud leid)

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (lävi O1: kolme päeva ja ühe perioodi jooksul aheldatud olekuülekandemaatriks võrdub scipy DOP853-ga suhtelise täpsusega { "1e-6" }; lävi C1: keskmine q ja 95 %-sisese osakaal; lävi C2: valim formaalse jälje suhtes iga hindaja puhul; lävi C3, NOT MET ja kinnitatud: kui modelleerimata kiirendus on { "3e-10" } m/s2, on 95 %-sisese ületamine { "0.0525" }, mitte vähemalt { "0.5" } - pardahinnang on teada ainult sadade meetrite täpsusega, seega peitub umbes kümne meetri nihe selle kovariatsiooni sees); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (lävi Q1: Monte Carlo edu vähemalt bootstrap-piir miinus kolm standardviga; Q2: kaare pikkusega ei lange üle kolme standardvea; Q4: LAMBDA võrdub täieliku läbivaatuse loendiga { "200" } tõmbe korral kuni viie mõõtmega; Q3: ujuv kavand võrdub sõltumatu numpy lahendiga täpsusega { "1e-9" } mitmetähenduslikkuse ja asendi kovariatsioonide puhul ning bootstrap-määr on NOT MET täpsusega { "1e-9" }, kinnitatud: see erineb suhteliselt { "1.7e-6" } võrra, sest LAMBDA normaaljaotuse CDF on Abramowitzi ja Steguni lähendus)

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (lävi F1: CRLB jälg ei tõuse ja väikseim omaväärtus ei lange orbiiterite linkidega, näites ja { "20" } algväärtustatud (seed) juhuslikus hulgas; lävi F2: kaugusosatuletised võrduvad sõltumatu numpy longdouble lõplike vahedega Rodriguesi otsesest mudelist { "50" } geomeetrial; lävi F3: väikseim omaväärtus tõuseb vähemalt 2.0x, leitud umbes 111x)

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (lävi T1: nihkesigmad ei lange, kui lokaalne side lõdveneb; T2: kui tehnikasigmad on skaleeritud teguriga { "1e-6" }, on iga paari nihkesigma { "1" } % piires sqrt({ "2" }) korda lokaalse sideme sigmast, leitud { "3e-7" } piires; T3: informatsioonimaatriks võrdub sõltumatu numpy virnastatud koostega täpsusega { "1e-9" }). Esimene T2 käitus normaalvõrrandi ümberpööramisega jäi läbi ({ "1.3" } % { "0.1" } m sideme juures, väärtused põranda all { "1" } m juures); põhjus oli numbriline ja kovariatsioon viidi ruutjuure teele enne, kui lävi uuesti hinnati.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (lävi G1: analüütilised osatuletised võrduvad iga otsese mudeli kesk-lõpliku vahega täpsusega { "1e-8" }; G2: 5x5 informatsioon võrdub sõltumatu numpy koostega täpsusega { "1e-6" }; G4: kella loodete amplituud ning selle k2 ja h2 tundlikkused võrduvad sõltumatu hindamisega täpsusega { "1e-9" }; lävi G3 NOT MET oma jäljepoolel, kinnitatud: pere lisamine ei alanda kunagi väikseimat omaväärtust ({ "28" } { "28" }-st), kuid pseudoinversi jälg tõusis { "12" }-l { "28" }-st lisamisest, sest lisatud pere tõstis järku)

# text
seg-2e097e952eb5 = lunar_beacon::tests (horisondi nähtavus vs L01 suletud kuju; majakaga täiendatud DOP vs paljas; veaeelarve ruutude summa juur; DOP-i ja meetrite seos); tests/validate_p2_beacon_before_after_table.rs (kogu enne/pärast tabel kinnitatud sisse viidud golden-etaloni külge suhtelise täpsusega { "1e-9" }); tests/validate_p2_beacon_before_after_independent_dop.rs (sama geomeetria läbi SÕLTUMATU DOP-tee, seega ei kontrollita täiendust tuuma vastu, mis seda tootis); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal piirab pimeda ühisrežiimi klassi põhjustatud k-sigma horisontaalse asendivea, moodustades blind_position_covariance = S<em>Cov</em>S^T ja projitseerides selle ENU-sse; integrity_envelope teatab hpl_total = hpl_araim + cmpl. Eristus, mida see paar tegema on loodud: RAIM/ARAIM-i JÄÄGI test on tõestatavalt pime range(G) vigade suhtes, kuid ARAIM-i KAITSETASE ei ole -- selle veatu liige piirab neid juba kuni pakkuja URA pluss nominaalse nihkeni. CMPL on seega ainult pakkujatevaheline ÜLEMÄÄR, mida üksiku pakkuja pakkujapõhine URA/ISM ei kata, ja summa on konservatiivne kolmnurgavõrratuse piir, mitte RSS, mis kehtib ainult seal, kus see ülemäär pole juba URA sees.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (ilma Maa baasjoonteta järgupuudulik; kolm baasjoont taastavad täisjärgu — 3-jaamaline lävi tuleneb informatsiooni järgust, mitte lahendi veast; jaama CRLB saavutatakse hindaja poolt efektiivsusega { "0.98" }; CRLB tiheneb monotoonselt baasjoontega); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (IS-GPS-800J indices)

# text
seg-d111b6550515 = lunar_afs::codes::tests (maksimaalse pikkusega registrid, Legendre'i tasakaal, G2 viivituse edasi-tagasi teisendus, taseme kompositsioon); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (ilma LSIS vahemäluta: neli viidatud arvu kinnitavad leiu; sellega: { "2 937 232" } kiipi ja bitti vs LSIS lisa { "3" } failid, trükitud esimesed/viimased { "24" } kiipi, Legendre'i tabelid D-1 ja E-1 ning G2 initsialiseerimised annavad täpselt ühe erineva kirje, tabeli E-5 PRN { "147" } lahtri 'last { "24" } chips', mis dubleerib PRN { "151" } oma, samas kui lisa { "3" } fail on generaatoriga kooskõlas); range eelregistreeritud test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact on selle lõhega ignoreeritud

# text
seg-8cd700abad59 = lunar_afs::waveform (recording and truth labels), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (kolmas eelregistreerimine: { "2" } sõlme, { "4" } kanalit jälgitud, halvim Doppleri viga { "0.57" } Hz, halvim koodinihke viga { "0.008" } chip, kõik { "6" } kaadrit dekodeeritud õige TOI-ga üle { "99" } -> { "0" } ümberpakkimise ja sobiva alamkaadriga { "2" }; G0 ei ole täidetud nagu kirjutatud, vastuvõtja enda käitustevaheline varieerumine oma hankimiskirjetes); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (teine: { "5" } rikkumist); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (esimene: tühine); kolme faili ranged testid on oma lõhedega ignoreeritud

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (kinnitatud leid); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (range, lõhega ignoreeritud); gps_lnav::tests

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (kinnitatud leid); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (range, lõhega ignoreeritud)

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } { "5900" }-st plokist vs { "99" } % binoomvahemik [{ "40" }, { "80" }] P_fa { "0.01" } korral), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, suhe { "0.0131" } vs { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } vs { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (range, lõhega ignoreeritud); iq::campaign::detect testid; iq::monitor::stats testid (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (kinnitatud räsid on ilma tabelita muutmata)

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } öeldud sündmustel, mis ei sumbuta midagi); r1_the_cn0_drop_roc_separates_6_db_attenuations (range, lõhega ignoreeritud); iq::campaign::detect testid (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (kinnitatud leid); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (range, lõhega ignoreeritud)

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satelliiti IGS edastusfailist kuupäevaga { "2" } märts { "2025" }: { "960" } { "960" }-st sõnast läbib RTKLIB-i pariteedi, { "96" } { "96" }-st alamkaadrist dekodeerub, { "608" } { "608" }-st dekodeeritud edastatud täisarvust võrdub Kshana omadega, iga sisend poole kvandi piires, nädal ja ajad täpsed); gps_lnav::tests

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (kinnitatud leid, andmetest sõltuv); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (range, lõhega ignoreeritud); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (kinnitatud leid, andmetest sõltuv); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (range, lõhega ignoreeritud)

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (kinnitatud leid, andmetest sõltuv); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (range, lõhega ignoreeritud)

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (kinnitatud leid, andmetest sõltuv); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (range, lõhega ignoreeritud)

# text
seg-b4e5e57515cc = lunar_dpnt::tests (kella ühisrežiim tühistub täpselt; jääk kasvab baasjoonega; taaskasutab SBAS PL-i; satelliitide arvu austatakse ehitaja piirini { "24" }, seega ei saa suurem satelliidikonstellatsioon vaikselt tagastada väiksemat); tests/lunar_differential_pnt_reference.rs (ühe vahe jääk + WLS asendilahend vs RTKLIB-i lsq(), kompileeritud C lähtekoodist)

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (OEM kannab Kuu REF_FRAME/TIME_SYSTEM; ajametaandmed teisenevad edasi-tagasi; KIF ümbrik); tests/lunar_interoperability_export_reference.rs (kshana väljastatud Kuu OEM uuesti parsitud sõltumatu <c1/> Pythoni teegiga: REF_FRAME/TIME_SYSTEM/CENTER märgid + epohhipõhine olek vormingu täpsuseni; rikutud eksport lükatakse tagasi); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotoonsus, komposiidi piirid, taseme lagi, modelleeritud päritolu); resilience::diversity::tests (pöördvõrdeline Simpson, ühisrežiim, SPOF)

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (Kendalli tau käsitsi näide, Dirichlet' simpleks, ümberpöördumise määr); resilience::study::tests (stabiilsuse kontroll, ebastabiilsuse tunnistaja, deklareeritud-vs-mõõdetud, mitmekesisuse kollaps)

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON fields)

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (kasu polaarsus suurem/väiksem-on-parem, ümbritseb tegelikku TradeResult-i täpselt, ebaausad tõendid lükatakse tagasi, valideeritud-FoM vajab välist ankrut, deterministlik JSON)

# text
seg-fe77856b9e9d = quantum_devices::tests (kellakaardid ausad+järjestatud; põimumise korduvtäpsus ~1/sqrt(tau); tuvastatud määr -10x/10dB; tumeloendused halvendavad; süstemaatilise põranda piirid; kaart modelleeritud+kehtiv)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (korduvtäpsus paraneb integreerimisega; kvant võib nii võita KUI KA kaotada; PL lõplik-positiivne; turvalisuse FoM vahemikus [{ "0,1" }] ja kasvab ründeviivitusega; anomaalia Pd monotoonne; kompromiss is_honest)

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (kvant ületab klassikalise pika katkestuse korral; eelis sõltub katkestusest; kompromiss is_honest); tests/gnss_free_quantum_navigation_reference.rs (liikumisarvestuse asendi kasv vs sõltumatu Octave'i kahekordne integreerimine + Freier-2016 avaldatud müra ankur)

# text
seg-8e49ee940482 = quantum_faults::tests (analüütilise AUC teadaolevad väärtused; empiiriline bootstrap AUC ümbritseb suletud kuju; kvant tuvastab väiksemaid vigu / kõrgem AUC; eelis kaob suurte vigade korral; 5-klassiline kataloog; kompromiss is_honest)

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (müravaba TDOA otse→pöördteisendus täpsusega { "1e-6" } m; J·CRLB=I sümmeetrilise PD kovariatsiooniga; CRLB asendivariatsiooni jälg ei kasva, kui vastuvõtja lisatakse; ühine TDOA+FDOA taastab liikuva emitteri asendi+kiiruse; <{ "4" } vastuvõtjat lükatakse tagasi); tests/geolocation_reference.rs (edasi-tagasi teisendused nelja geomeetria puhul 3-D-mitmekesise võrguga; Gauss–Newtoni hindaja saavutab oma Cramér–Rao piiri — empiiriline veakovariatsioon järgib analüütilist piiri { "4000" } Monte Carlo katse jooksul); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound ja finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, kinnitatud)

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registreerib Stardusti jaoks { "746" } W/cm2 ilma lävita)

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (kahesuunaline võrrand taastab nihke täpselt; Sagnaci liige võrdub BIPM ahela suletud kujuga; ionosfääriline liige järgib sageduse jaotust ja troposfäär tühistub; flicker-faasil on tasane TDEV; ööpäevane jääk tõstab TDEV-i poole päeva ümber; vastastikkuse nihe nihutab nihet, mitte TDEV-i; jada stabiilsus eemaldab määra); time_transfer_budget::tests

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (eelregistreeritud läved A1-A3 sõltumatu mpmath sõltumatu etaloni vastu: { "216" } Rytovi ruudustiku punkti halvim suhteline viga { "3.4e-7" } vs { "1e-6" } lävi, sähvimine halvim { "4.5e-16" }, apertuuri tegur halvim { "5.7e-16" }, { "96" } gamma-gamma hajumise tõenäosust halvim { "1.3e-12" } log10-s, pilve ja selge õhu optiline paksus halvim { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (lävi A5: koondatud kaoga lingibilanss ja olemasolevad asukoha kättesaadavuse väljundid on baas-commit'iga bitthaaval identsed { "1,000" } parameetrikomplekti puhul)

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (lävi A4: rho = { "0" } võrdub sõltumatu ühendiga ja rho = { "1" } parima üksiku asukohaga täpsusega { "1e-12" } ning null monotoonsuse rikkumist asukohtade arvu ja korrelatsiooni suhtes; selle läve esimene käitus jäi { "3e-9" } võrra täitmata, sest kasutusel olnud normaaljaotuse CDF oli { "1.5e-7" } Abramowitz-Steguni vorm, teostusviga, mis asendati mittetäieliku gamma CDF-iga muutmata lävega); optical_weather::tests ja optical_sitediv::tests (monotoonne varu, pilvelagi suletud kujuna, katkestuse kestuse samasused, varu otsingu ümberpööramine)

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (lävi A6: katkestusepõhine ajastusviga võrdub holdover::coast_phase_sigma-ga ja kaugusviga phase_to_range_m-ga bitthaaval { "9" } kella, { "3" } keskmise kestuse, { "3" } hajuvuse ja { "4" } kvantiili korral); optical_outage_holdover::tests

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (läved T1-T6 failist xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fikseeritud enne esimest käitust: sama algväärtus (seed) samad baidid ja teine algväärtus (seed) teised baidid; ilma tabelita võtit ei ole; { "8760" } h jooksul sammuga { "600" } s, algväärtused (seed) { "37" } ja { "38" }, iga kolme vaikeasukoha realiseeritud kättesaadavus { "6" } punkti piires öeldust (halvim { "3.3" }) ja realiseeritud pilveosa { "5" } punkti piires öeldud tõenäosusest (halvim { "2.1" }); varu võrdub eelarve miinus kaks hajumist ja töös võrdub varuga mittenegatiivne igal sammul; moodulis ei ole mitteportatiivset matemaatikakutset; liiga pikad käitused ja halvad sammud lükatakse tagasi)

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (tegelik MRO ODF, 2007-304/305, selle PDS sildi vastu: kirjete arv, rühmade asukohad, jaamad, algus- ja lõpuajad ning andmetüübid kehtivad; faili lõpu tabeli ridade arv eksib ühe võrra, sildi vastuolu, kinnitatud leiuna); odf::tests (käsitsi ehitatud kirje edasi-tagasi teisendus, { "1950" } epohh); tests/mro_odf_short_arc_od_oracle.rs (andmetest sõltuv, sisendid SHA-256 kinnitatud, igakuine CI tegelike andmetega nõutav: MRO navigatsiooni rekonstruktsioonist mro_psp5 prognoositud Doppler hinnatud DSS { "63" } ja DSS { "14" } pääsudel, { "12.5" } mHz RMS, lävi { "30" } mHz, täidetud; registreeritud orbiidi määramine ei andnud orbiiti, kinnitatud leiuna; käitus { "2" } summutatud hindajaga, eraldi registreeritud: orbiit { "0.36" } km RMS ja { "0.53" } km maksimum mro_psp5 suhtes, täidetud, sobitusjärgne Doppler { "48.6" } mHz vs { "30" } mHz, täitmata, kinnitatud leiuna; SPK tüüp { "1" } lugeja CSPICE vastu, { "5e-7" } m); mars_od::tests

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } algväärtust (seed), keskmine kuue vabadusastmega NEES teisel poolel vahemikus { "4.5" } kuni { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
seg-4da98593fe6a = aperture_duty::tests (aken, mis lõpeb täpselt siis, kui järgmine algab, ei konkureeri, ja selle liigutamine ühe sekundi võrra varasemaks maksab täpselt ühe sekundi — ühe võrra eksimise kaitse; kattuvad aknad üle apertuuride arvu panevad madalama järgu sessiooni katkestusse, kusjuures konkurentsiintervall on kinnitatud; vahekohtupoliitika otsustab, milline teenus apertuuri hoiab, kõigi kolme poliitika arvud kinnitatud ühel plaanil; first-come-first-served ei võta eelisjärjekorras apertuuri sessioonilt, mis seda juba hoiab; sessioon, mis kaotab vahekohtus oma alguses, hangib apertuuri, kui see vabaneb; kolm kohustust arvestavad iga saadaoleva apertuurisekundi { "3" } poliitika × { "4" } apertuuride arvu kohta; apertuuri lisamine ei suurenda kunagi ühegi sessiooni katkestust, mõõdetud { "200" } pseudojuhusliku plaani × { "3" } poliitika × iga apertuuride arvu korral; piisavalt apertuure iga sessiooni jaoks ei jäta üldse katkestust; aruandehorisont lõikab plaani ja seab kohustuse nimetaja; ennustatud läbimiste loend muutub kontaktiplaaniks ilma teise akna tüübita; kaasasoleva plaani kohustuse arvud on mootori väljundid ühe ja kahe apertuuri korral; aruanne ütleb poliitika, mis arvud tekitas; iga teatatud näitaja kannab ühikut ja päritoluklassi; stsenaarium on reprodutseeritav ja deklareerib end MODELLED; stsenaarium lükkab tagasi plaani, mida ta ei suuda planeerida); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } teegi testi: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } teegi testi: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-83724a2a8e06 = hybrid_integrity::tests (tuvastusvõimsuse kõver jookseb valehäire määrast nullvea juures kuni { "1" } − P_md minimaalse tuvastatava nihke juures; minimaalne tuvastatav nihe, mis söödetakse tagasi läbi noncentral_chi2_cdf monitori enda rakendatud lävendil, tagastab P_md täpsusega { "1e-9" } igal teljel ja avaliku abifunktsiooni kaudu; tegelikult RF hinnangusse süstitud nihe nihutab monitori enda statistikut täpselt käsitsi arvutatud b²/(σ_rf² + σ_opt²) võrra; müravaba nihe tabatakse üle √(T/λ*)×MDB ja jäetakse märkamata sellest allpool, kusjuures süstitud redel ümbritseb seda ristumist; tuvastusvõimsus on vea suuruse suhtes monotoonne ja identne kõigil neljal teljel MDB kordsete puhul; algväärtustatud (seed) 200,000-valimiline Monte Carlo monitori statistikust reprodutseerib analüütilise võimsuse 4σ piires kõvera neljas punktis; ajastuse MDB on kinnitatud ajastuse häirepiirist kõrgemale, mis on mõõdetud nõrkus, mitte omadus; Wilson-Hilferty kvantiil on mõõdetult monitori täpsest lävendist erinev ~{ "4" }% võrra, mis kirjutab üles, miks seda ei kasutatud; tõusu näitaja on täpselt MDB/määr ja skaleerub määraga pöördvõrdeliselt ning mittepositiivne määr teatab tühiväärtuse (null), mitte nulli); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-f9767a6109d5 = hybrid_integrity::tests (rannik algab täpselt kovariatsioonijäljest, mida üleandmise plokk teatab, mõlemas suunas, seega ei saa uuesti esitatud diagonaal teatatud üleandmisest eralduda; teatatud ristumisaeg arvutatakse uuesti aruande enda üleandmise sigmast, protsessimüra PSD-st ja katvustegurist ning piir on häirepiiri sees vahetult enne seda ja väljaspool vahetult pärast; rannikuaeg skaleerub täpselt pöördvõrdeliselt protsessimüra PSD-ga ja lüheneb, kui häirepiir karmistub; nullPSD-ga rannik teatab tühiväärtuse (null), mitte nullaega, sest mitte kunagi ei ole sama mis kohe; väljastatud profiil ristub täpselt üks kord ja ümbritseb teatatud ristumist; dispersiooni kahekordistumise aeg ja häirepiiri ristumise aeg on kinnitatud lahus, olles tiheda optilise astme järel kaheksa suurusjärgu võrra erinevad ja lõdva RF astme järel ühe suurusjärgu piires; optilisest modaalsusest loobumine ostab rohkem rannikuaega kui RF-ist loobumine täpselt kovariatsioonide erinevuse jagatud horisontaalse kasvumääraga; ning random_walk_time_to_limit eristab juba-väljaspool, ristub-ajal-t ja ei-ristu-kunagi)

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests ja lunar_service::tests (mustri poolitamisega leitud poolvõimsuse ristumine vastab avaldatud Airy x = { "1.61634" }-le ja annab täpse { "1.02899" }·λ/D laiuse, kirjutades üles, et tavapärane { "1.02" } koefitsient asub −{ "2.955" } dB juures, mitte −{ "3.010" } dB; muster on rangelt kahanev { "400" } punkti jooksul telgjoonest esimese nullini; kaudse efektiivsuse algebra teisendub edasi-tagasi täpsusega { "1e-12" } ja reprodutseerib { "0.641" } / { "0.920" }; telgjoonest kõrvalekalde nurk vastab tan θ = R·sin γ/(r − R·cos γ) { "20" } punktis ja mõlemad piirid täpsusega { "1e-12" }; ligikaudne koonus sisaldab tegelikku kiirt rida-realt; peamised arvud võrduvad lipudega rea kohta, mida need kokku võtavad, ja parandus võrdub nende vahega; iga rea otsus on uuesti arvutatav ainuüksi väljastatud aruandest; iga väljastatud arvuline ja tõeväärtusväli kannab ühikut ja päritoluklassi; võimatu apertuur ei väljasta plokki; kui antenni pole seadistatud, jätab eksport täpselt oma kuus olemasolevat võtit, { "0" } lehte muudetud ja { "0" } eemaldatud); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-9910640b7886 = tracking_loop (composing sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (avatud silmusega Costase diskriminaatori värin vs sdr::correlate, mis on sammuti edasi viidud algväärtustatud (seed) sünteetilisel IF-il, { "3" } koondatud müra realisatsiooni × { "900" } epohhi, kooskõlas { "0.63" }% juures 35-45 dB-Hz, ruutimiskao liikmelt nõutakse sobitumist vähemalt { "3" }× paremini kui ilma ruutimiskaota vormil kõikjal, kus see on lahutatav; ~{ "32" } dB-Hz atan-diskriminaatori küllastus kinnitatud, mitte ainult öeldud, seega on kehtivuspiir kinnitatud; suletud silmuse σ vs sammuti sdr Costase silmus { "4000" } epohhi jooksul { "3.7" }%; esimese astme DLL tõusu viivitus vs sammuti sdr DLL { "0.17" }%; bessel_i0 vs tabuleeritud I₀ { "7.4e-8" }; hüstereesi laius peab jääma vahemikku [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] { "4" } suhte × { "2" } integreerimisaja × { "3" } ribalaiuse korral); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } teegi testi: iga andmepunkti kirjapilt teisendub edasi-tagasi läbi parse/as_str ja tundmatu lükatakse tagasi; kõigi jaamade hoidmine ilma majakata lükatakse tagasi veaga, mis nimetab <c1/>; hoovarv on kinnitatud VÕRDNE ρ/B-ga ja majaka võrdne jaotus VÕRDNE jaama võrdse jaotuse korda selle, mõlemad täpsusega { "1e-15" }, täiendava kinnitusega, et hoovars ületab { "10" }, seega ei ole kaks eelarvet sellel geomeetrial segiaetavad; fikstuuri avaldatud baasjoon on kinnitatud { "10726.748" } km juurde ja selle 49-valimilisest ajakavast kinnitatud andma rangelt vähem kui { "49" } vastastikku nähtavat vaatlust; majaka spekter ühel baasjoonel on mõõdetult vähemalt viie dekaadi laiune ja saadud suhe kinnitatud üle { "1" } AM-HM kaudu ja üle { "100" } tegelikult; jaam-pluss-majakas paigutus on kinnitatud järgupuudulikuks, MÕLEMAD arvutatud väljad on null, samas kui modelleeritud võrdlusosa teatab endiselt. Pluss kaitse fikstuuri enda vastu: tabelite massiivi järele sisestatud ülemise taseme võti muutub selle asemel jaama andmeteks, seega on sisestuskoht kinnitatud ja parsitud stsenaariumi kontrollitud võtit kandma — tõrkerežiim on käitus, mis kasutab vaikselt teistsugust konfiguratsiooni kui test nimetab)

# text
seg-08708f044bb5 = lunar_dpnt::tests (puhtalt lisav kaitse, mille võtmekomplekti erinevus on täpselt { "{" }correction_link, units{ "}" } ja kõik olemasolevad väärtused on bitthaaval identsed enne muudatust kogutud literaalidega; mõõdistusviga EI dekorreleeru baasjoonega, samas kui orbiidi liige dekorreleerub, ja see püsib nullbaasjoonel, kus orbiidi liige on täpselt null — struktuurne kontroll, mis tabab liikme ühendamist valesse kohta; { "1" } m jaamaviga kandub üle { "1" }:{ "1" } ja on tõestatud, et seda DOP ei võimenda; nullviivitus reprodutseerib vananemata jäägi bitthaaval ja jääk on viivituse suhtes monotoonne, väljastatud kõver võrdub otsekäitustega; kvantiseerimisastme poolitub täpselt bitis ja σ² = astme²/12 ning täisskaala järgib süstitud suurusi; igaüks eraldi väljalülitatud liige taastab ülejäänud kaks ruutsummana; võrdne satelliidipõhine σ levib täpselt väärtuseks σ·PDOP ja see PDOP on kooskõlas orbit::dop-iga; iga väljastatud väli kannab ühikut ja päritoluklassi, kontrollitud mõlemas suunas)

# text
seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: täpsusega { "1e-12" } m vastuvõtja müraga ja ilma; zero_baseline_floor_is_zero_in_every_trial: { "0" } täpsusega { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 enne käitust öeldud { "5" } % vahemikus; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (eelregistreeritud numpy uuestiarvutus, salvestatud koos oma möödalaskmisega); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs ning registri ja platvormideülesed golden-etalonid muutmata (lisavus); tests/field_units_global.rs (iga väljastatud väli kirjeldatud, erandita)

# text
seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: kiirkõnnak reprodutseerib -acos(R / (R + a)) täpsusega { "1e-3" } kraadi igal asimuudil; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: sama koonus, mis on valimistatud { "0.005" } kraadi laius-/pikkuskraadi plaadile, on kooskõlas analüütilise koonusega täpsusega { "0.25" } kraadi; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: lamedapõhjaline kraater sfääril, vaatleja keskpunktis ning { "4" } km ja { "7" } km sellest eemal, suletud kujuga serva kõrguse atan2((R + H) cos s - (R + a), (R + H) sin s) vastu, kus s pärineb sfäärilise serva ristumise võrrandist, täpsusega { "0.01" } kraadi igal asimuudil; rasterised_cone_matches_the_analytic_cone: { "200" } m polaarsele stereograafilisele ruudustikule rasterdatud koonus, mida loetakse ruudustiku valimistaja kaudu, on kooskõlas analüütilise koonusega täpsusega { "0.25" } kraadi; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, mõlema liigi puhul; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 säilitab oma lameda arvu ja epohhid, mille horisont maksab, on terrain_masked (kättesaadavus ise võib tõusta, sest horisont võib peita satelliidi, mida jaam ei näe), ja { "89" } kraadi horisont jaamas ei jäta midagi kättesaadavaks; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: Shackletoni ja Haworthi kraatrite põhjad madalad, Malaperti massiiv kõrge, peegelpilt mitte; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: sissekirjutatud väljalõikest uuestivalimistatud plaat annab jaamale väljalõike horisondi täpsusega { "0.22" } kraadi (piir { "0.5" } kraadi, fikseeritud enne käitust), koos plaadi kaja ja ühikutega, ning dem_path koos dem_tile_path-iga tagasi lükatud; the_export_site_is_masked_by_the_terrain: iga ekspordirida ületab maastiku täpselt siis, kui see on nähtav ja asukoha horisondist asimuudil kõrgemal või sellega võrdne, geomeetria ei liigu, CSV saab veeru ainult maastikuga; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs ning registri ja platvormideülesed golden-etalonid muutmata (lisavus)

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m at { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: valimi sigma sqrt({ "2" }) a piires { "6" } %; station_multipath_is_gauss_markov: lag-1 korrelatsioon exp(-dt / tau) piires { "0.01" }, ühikdispersioon piires { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs ja etalonväljundid (goldens) muutmata (additiivsus)

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: kasv sees miinus kasv väljas lingiviga on valimi sigmaga määr tau / sqrt({ "3" }) piires { "6" } % üle { "1600" } tõmbe; linear_growth_is_the_first_order_propagated_error: kiirusviga dv, mida levitatakse puusisese kahekeha integraatoriga stsenaariumi orbiidilt, nihutab asukohta dv tau võrra { "1" } % piires hetkedel { "60" } s ja { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignoreeritud, salvestatud lisa)

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: võrdub lunar_dpnt::position_error_vector_from_range_errors-iga täpsusega { "1e-8" } m, lõtv kõrgusrida ei muuda midagi, range kinnitab kõrgusevea; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: iga näitaja täpsusega { "1e-6" } suhteliselt; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignoreeritud, salvestatud lisa)

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (salvestatud näitajad registreeritud lävede vastu); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignoreeritud, umbes { "7" } s release-ehitusel: käitab uuesti kuus registreeritud juhtu ja kontrollib salvestatud näitajaid)

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, seiramata risk P_THRES piires, kolm või enam satelliiti eemaldav alamhulk seiratud, ja rohkem kui kümme seiratud eelnevat tõenäosust tuletatud sõltumatult uuesti kui P_no fault q^k täpsusega { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: viga vaba käitamisel häiret ei ole, ja { "30" } m nihe kahel satelliidil tuvastati paariga kui suurima normeeritud eraldatusega alamhulgaga); tests/araim_reference_vectors.rs ja tests/integrity_araim_stanford_oracle.rs muutmata (2. järku tee on MAAST-iga kontrollitud tee)

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: holdover-i näitajad muutmata, { "111" } keelatud epohhi pole saadaval ilma kaitsetasemeta, keeldutud käitamistega > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: iga proovitud epohhi HPL ja VPL võrduvad täpselt nulljäägiga snapshot_raim-iga samal eelseadistatud taevas ning vigadeta käitamine ei tekita häiret; a_stated_bias_is_detected_while_it_lasts: { "60" } m nihe annab häire täpselt neil { "10" } epohhil, mida see katab; every_integrity_field_has_a_unit); clock_integrity::tests; kella etalonväljundid (goldens) muutmata

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests ja observability_gramian::tests (vaikedokument kinnitatud bitthaaval selle JSON-i, kokkuvõtte ja SVG FNV-1a-ga, kusjuures selgesõnalised vaikeväärtused on kinnitatud mitteoperatsiooniks ja kaheksa laienduse võtit kinnitatud ABSENT, et jäädvustust ei saaks uuesti genereerida enesevõrdluseks; lisanduv <c1/> plokk jäetud külmutusest välja, eemaldades selle ja hashides uuesti enne selle olemasolu kinnitatud konstandi vastu, mis tõestab, mitte ei eelda, et midagi avaldatut ei liikunud; astme invariantsus homoskedastilise sigma all kinnitatud väärtustel σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos kinnitatud skaleeruma täpselt lineaarselt σ-ga täpsusega { "1e-6" } suhteliselt; DRO nullruum kinnitatud olema täpselt z ja ż koordinaattelg, kusjuures kaks põhjust on eraldatud — samatasandiliste kosmoseaparaatide vaheline kaugusrida omab û_z = { "0" } ja CR3BP tasandiväline plokk lahtub täpselt z = { "0" } korral; ruumilised Jacobi maatriksid keskmiste lõplike vahede vastu ning kasti sõltumatu 3-D kaugusmuutuse vaadeldava suuruse vastu; tasandivälised perekonnad tasapinnalises režiimis tagasi lükatud)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests ja tests/operational_eop_predictor_reference.rs (analüütilise signaali koefitsientide taastamine täpsusega { "1e-9" } 365-päevase akna korral; nihke-pluss-kiiruse sobitus võrdne kinnise kujuga tavalise vähimruutude tõusu ja lõikepunktiga täpsusega { "1e-12" } päris ridadel; KAKS ettevaatamisdetektorit, mis rikuvad iga väljaandmise epohhi järgse rea kiire UT1 ja poolusa veerud — jättes Bulletin B lõplikud terveks — ja nõuavad bitthaaval identset väljundit, mutatsiooniga kontrollitud muutma { "10" } testi punaseks, kui sobitusbarjääri lõdvendatakse täpselt ühe päeva võrra; sõltumatult uuesti ehitatud epohhiloend; sihtmärgi Bulletin B plokk tühjendatud ja epohh näidatud tabelist lahkuvat; liikme lubamine kontrollitud { "6" }-, { "15" }-, { "150" }- ja 365-päevase akna korral; monotoonsed reaarvud; ja külmutatud muutuseelne vaikearuande jäädvustus, mida kinnitatakse väljade kaupa ilma tolerantsita, mis lisaks kinnitab, et jäädvustus ei sisalda uusi võtmeid, nii et seda ei saa vaikselt uuesti genereerida enesevõrdluseks); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (valikuline EopSeries::with_ls_ar_prediction laiendus üle viimase rea: tabelisisesed vastused bitthaaval identsed, prognoosiread võrdsed ls_ar_predict-iga, raamistikuargumendid üle tabeli järgivad prognoosi, mitte ei kärbita; sisemine kooskõla)

# text
seg-c77bd56a0619 = lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests ja tests/cislunar_arc_recovery_reference.rs (mõlemad piirid ja nende suhted kinnitatud avaldatud ruudustikul; mõõdetud veakõver võrreldud formaalse kovariatsiooniga rea kaupa rea kohta teguri-kaks piiri ja geomeetrilise keskmise piiriga; NEGATIIVNE KONTROLL — tasapinnaline DRO kuueolek — kinnitades, et kriteerium SAAB ebaõnnestuda ja et regulariseerimata hindaja hajub üle { "1e6" } km, mitte ei tagasta usutavat väikest viga; parametriseerimise invariantsus kinnitatud iga eesliite korral täpsusega { "1e-3" } suhteliselt; lähtetekstivalve, mis eemaldab kommentaarid, stringiliteraalid ja testimooduli ning ebaõnnestub seejärel igasuguse Jacobi, STM-i, SVD-astme või SRIF-i masinavärgi mainimise korral, mutatsiooniga kontrollitud keelatud kutse süstimisega; ainult testis olev kontroll, et lõplikud vahed võrduvad analüütiliste ridadega, nii et lineariseerimine on teadaolevalt hea, samal ajal kui analüütiline tee jääb hindajast puuduma; determinism kinnitatud bait-baidi haaval; avaldatud cislunar-observability dokument kinnitatud võtmekomplekti, kanoonilise sõrmejälje ja kokkuvõtterea järgi)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (vormingu ja raamistiku sõelumine; Lagrange'i interpolatsioon täpne sõlmedes ja lineaarsel rajal sõlmedest väljas; ICRF-i elemendid läbivad IAU { "2015" } taandamise ja on baidivõrdsed selgesõnalise icrf_to_iau_moon rakendusega; tõeline↔keskmine anomaalia edasi-tagasi teisendus edasise Kepleri lahendi vastu; vigase vormiga failid tagasi lükatud nimetatud põhjusega). lunar_service::tests (kui <c1/> on määramata, on aruande võtmekomplekt ja SHA-256 kinnitatud; Kepleri rida võrdub eraldiseisva Kepleri käitamisega väli väljalt; samasus σ_required · HPL_max / σ_URE = AL, seejärel LÕPUST LÕPPU uuesti käitamine arvutatud nõudel, mis saavutab { "100" } % kaitsetaseme kättesaadavuse, ja uuesti käitamine { "1" } % selle kohal, mis seda ei saavuta; iga kahe uue ploki väljastatud arvväli läbi käidud toodetud JSON-ist ühiku ja päritoluklassi jaoks; kommitiud fikseeritud komplektid sobitatud oma allikatabelitega satelliit satelliidi haaval; tabeli lõpust kaugemale ulatuv horisont tagasi lükatud); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

# text
seg-34bff3218a01 = tests/field_units_global.rs (kõik { "61" } registreeritud liiki käitatud, üks dokumendikuju igaühe kohta: iga arvuline lehtsõlm peab vastama kandele selle dokumendi enda ühikute plokis; vigase vormiga kanne loetakse puuduvaks IGA liigi puhul, vabastatud või mitte, nii et kohatäide ei osta kattuvust; vabastuste loend ei tohi ületada oma kinnitatud lage, loendis olev liik, mis osutub täielikult kaetuks, EBAÕNNESTUB värava, et loendit ei saaks täita, ja käitaja tabelist puuduv registreeritud liik ebaõnnestub, et uus pakett ei saaks uurimata libiseda — mis ta ka tegi, tabades mõlemat liiki, mis lisati pärast selle töö algust; ühesuunaline ratas kirjeldatud-kuid-määratlemata mahajäämusele; ja kommitiud skeemidokumendi aegumiskontroll); field_schema::tests

# text
seg-926c069f8a2e = lunar_llr (over lunar_frame_campaign::beacon_information, schedule_for and solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: tühjad loendid ja lähtetaseme näide annavad vaikearuande ja kokkuvõtte bait-baidi haaval; an_added_site_never_increases_any_variance: H_after - H_before väikseim omaväärtus on mittenegatiivne täpsusega { "1e-9" } suurimast, iga after/before sigma suhe on kõige rohkem üks ja mõlemad lisatud asukohad on vaadeldud; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml ja scenarios/lunar-station-geodesy-with-station.toml (sama arhiveeritud ajakava ja sama VLBI kampaaniaplokk)

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } testi: mõlemad valved üle kogu lähtepuu, pluss mutatsioonifikstuurid, mis hindavad iga valvet mõlemas suunas — F22 muster teatatud mõlemal kokkupõrkuval teel, tarnitud aatomjärjestuse parandus vastu võetud, pooliku parandus teatatud täpselt teel, mis kaotas oma unikaalse komponendi, tempfile-käepide ja päritud unikaalne kataloog vastu võetud, seinakell tagasi lükatud; deklareerimata kinnitus teatatud, deklareeritud vastu võetud, välistuseta skoop tagasi lükatud, ümbritseva testi dokumendikommentaaris olev deklaratsioon vastu võetud ja näidatud mitte järgmisse testi lekkivat; ja iga kinnituse kirjapilt — hex, kümnendarv, räsistring, baidipikkus, nimetatud baitide arv, golden-fail — nähtud, samal ajal kui algoritmi konstante, RNG algväärtusi ja väikese võimsuse kontrolle ei nähta)

# text
seg-416def055790 = integrity::composed_pl::tests (monotoonsus, P0-põhi, K(IR/2), astendajad, alumine poolpidevus)

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (lahknemine, lävi, IR-i pingutamise dominantsus)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (andmetega väravdatud: jätab sõnumiga vahele, kui BIPM-i rida puudub); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 voor { "3" }, prospektiivne, ei ole veel käitatud: Circular T { "465" } ilmus 2026-10-12 ja eelregistreeritud 1000-väärtuse reegel vajab väljaandeid umbes numbrini { "468" })

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (LLR/VLBI/orbiter analytic partials vs finite difference); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - tühi valik annab nullmaatriksi, üksik valik on ühikmaatriks, paar võrdub sõltumatult kirjutatud elementide kaupa summaga ja tulemus on valikujärjestuse suhtes invariantne; adding_a_block_never_reduces_the_degeneracy_metric - monotoonsus lisatud informatsiooni all; radial_diversity_beats_transverse_for_breaking_the_degeneracy - tagakülje orbiteri plokk tõstab langemismõõdikut rohkem kui ristsuunaline VLBI plokk)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotoonsus eelarves; RSS-eelarve vähendamine pakkujapõhise CRLB all; läbitöötatud pöördetolerants Kuu õla pikkusel; piirav liige = pööre)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris nullib eelarve; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } tegelikel jaotustel; kokkuleppe järjestus)

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (nullist erinev, kuid astmepuudulik plokk ⇒ block_spark { "1" }, f_detect { "0" }; sõltumatud veerud ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (üks kaaslane, kellele kuuluvad kõik sõlme mõõtmised = kellanihke viga ∈ range(G), tuvastamatu, selge Grami spektrilõhega), byzantine_redundant_net_identifies_at_least_one (kuus sõltumatut ühe mõõtmisega kaaslast ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (P⊥ = I käsitsijuhud kinnitavad f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (enesele viitav võrk: ühiskiirus asub N(GᵀWG)-s, temporal_gauge_dim { "2" }; pärast ühte välist kiiruse sidumise rida: kiirus gabariidist välja tõrjutud, temporal_gauge_dim { "1" } ühise nihke säilimisega)

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (ühine nihe tuvastamatu, diferentsiaalne tuvastatav), slope_infinity_in_range_finite_detectable (g7: tõus ∞, kui b ∈ range(G), lõplik, kui b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, 8-mõõtmeline gabariit on kogu nullruum spektrilõhega >{ "1e6" })

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — avatud ja suletud otsad, τ = { "400" } s vahe G.8271.1 tabelis 7-3, pidevus igas tabelitest tulenevas murdepunktis; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (clock kind [clock_log])

# text
seg-df411365b9ab = clock_log::tests (käsitsi kirjutatud logid vormingu kohta: päised, eraldajad, ühikud, sageduse integreerimine, TICC kanalid ja režiimid, vahed ja poliitikad, keeldumised); tests/clock_log_allantools.rs (eelregistreeritud võrdlus: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) fikstuuridel kaustas tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — diskreetne vananemisramp (1/2)·D·t² { "0.1" } % piires päeva jooksul; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } GPS Block IIF satelliidikella, { "14" } päeva IGS-i lõplikke kellasid: { "8" } { "1.5" } läve piires, G25 ja G30 optimistlikud kuni umbes 2x, kinnitatud); tests/slot_timing_ocxo_holdout.rs (mõõdetud OCXO: kõrvalejäetud ennustus ei ole kunagi optimistlik, { "0.59" } kuni { "0.70" } mõõdetud rikkest; valimisiseselt { "0.98" } kuni { "1.17" } piires; ilma fix-sageduse liikmeta on valimisisene ennustus igal lävel optimistlik); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — iga klass holdover::holdover_seconds vastu täpsusega { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — täpselt tpl::timing_protection_level_ns, kui kellal ei ole flicker-, valge faasi- ega juhuslikku jooksuliiget; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S võrdne jamming::j_over_s_db-ga ja efektiivne C/N0 võrdne jamming::effective_cn0_dbhz-ga, Q = 1/(R_c kappa), täpsusega { "1e-9" } dB, ja jamming-liigi enda testi { "32.105" } dB ankur; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: kinnitatud { "2.04" } ja { "5.16" } korda nominaalne pikkusviga, alla kuue korra; pluto_from_the_1992_row_is_measured_not_validated: { "39" } kaaresekundi ja { "1.14e9" } m piires; standish_velocities_track_horizons_to_one_percent: halvim { "3.7e-3" } kiirusest); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: halvim planeedilt nähtav nurkviga vahemikus { "2000" } kuni { "2040" }, Phobos { "5.65" } kraadi, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymede { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } kraadi); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: iga fiksi vea ruutkeskmine oma formaalse sigma kohta lõigus [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — iga kaart ja loendur võrdub otsese kõrgusnurga testiga skaneerimisega; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satelliiti, trükib käitamisaja ja säilitatud paaritestid; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (ainult regressioonikontroll); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regressioon)

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — liikme tulemus baidiidentne eraldiseisva käitamisega ja iga joondatud väärtus võrdne eraldiseisva reaga; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — ühe liikmega koostis loeb eraldiseisva arvu ja tulemuse räsi)

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (iga komplekteeritud süsteemineutraalne stsenaarium käitub ilma töötoa andmeteta, ribakompromissi ionosfääri suhted võrduvad (f_ref/f)^{ "2" } ja selle vabaruumi vahed { "20" } log10(f/f_ref), värin etalon-C/N0 juures jääb oma Gabori piiri ja piiramata riba vormi vahele, töötoa parameetrite stsenaariumi E5 kujukontrollid on kooskõlas, kui see fail on olemas, ning ükski lähtefail ei kompileeri seda faili sisse)

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (mitmeribaline joonlaiusdiagramm käitub nelja paneeliga, UHF-, L5-riba, S- ja C-segajad keelavad igaüks ainult oma riba ning tavalise riba käitamine on laiendusest muutumatu); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: alla { "0.01" } Hz ja { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: { "0.5" } dB piires väärtustest -139.1 ja -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (iga ümberlülituse kauguse hüpe võrdub kauguse vea muutusega ja parandatud { "300" } s sobitus, mida uuendatakse iga { "150" } s järel, läbib { "5" } cm läve); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (kinnise kujuga vorm piirab koonuse tihedat valimit)

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (iga mudel { "2" } mm piires täpsest sõnumist pärast dekodeerimist, uuesti kodeerimine bitthaaval identne, ümberpööratud bitt lükatud CRC-ga tagasi); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (iga mudel { "0.1" } mm piires pärast tekstiplokki, CSV täpne)

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: täpsusega { "1" } mm ja triiv täpsusega { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: kaalutud jääkide RMS lõigus [{ "0.8" }, { "1.2" }] ja viga alla nelja formaalse sigma); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (eelregistreeritud asendaja avaldatud andmekogumi 3 protsentiilide vastu väljaandest „Unveiling Starlink for PNT“, doi:10.33012/navi.685: { "3" } satelliidiga ({ "47" } kraadi mask), ilma kõrgustoeta ja { "30" } Hz juures on p90 3-D viga { "92.2" } m { "20" } s juures ja { "870" } m { "8" } s juures avaldatud { "2" } m ja { "10" } m vastu, seega on mõlemad teguri-kaks läved NOT MET, kõrgemal poolel, ja kinnitatud möödalaskmisena; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) täpsusega { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } algväärtust, käitamiste keskmine NEES-i keskmine lõigus [{ "2.4" }, { "3.6" }] ja vähemalt { "75" } % epohhidest kahepoolse { "95" } % hii-ruut-riba sees; mõõdetud { "150" } algväärtusega, keskmine { "2.84" } ainult GNSS-iga ja { "2.87" } LEO-ga; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: src-, scenarios- ja tests-kataloogide lähtetekstiskannimised); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: tugevam EIRP, pikem sobitusintervall ja suurem orbiidi määramise liige liigutavad igaüks edasi antud väärtust ja liidetud fiksi; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: võrdub ülelennu kaldus TEC-iga tipus täpsusega { "1e-9" } ja selle sigma võrdub koodimüra RSS-iga üle { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monotoonne iga statistiku suhtes, monitori lisamine ei tõsta kunagi skoori, terved statistikud jäävad väärtusele { "100" })

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (täpsed LEEF-i stringid, paomärgid, tõsidus, RFC { "5424" } ümbrik, edastuse ajalõpud ja taasühendamine); tests/telemetry_cli.rs

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoreeritud, andmetega väravdatud KSHANA_JAMMERTEST_DIR kaudu: salvestatud valik, kõrvalejäetud arvud, läviotsused ja otsus); receiver_trust::calibration::tests (ajatemplid, akende sidumine ja ajavööndi nihe, sildid, kaitseribad, väljaarvamine, valik); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (andmetega väravdatud KSHANA_JAMMERTEST_PLAN_DIR kaudu: { "2025" } plaani pesade arvud testipiirkonna kohta, kataloogi id-d, TOML-i edasi-tagasi teisendus); tests/jammertest_score.rs (sünteetiline logi teadaoleva langusega: tuvastatud, möödalastud, hindamatu, valehäire käitus, allkirjastatud pakett, mis kannab tulemuskaarti); jammertest::plan::tests; tests/jammertest_score_2024.rs (andmetega väravdatud KSHANA_JAMMERTEST_DIR kaudu: salvestatud käitamine)

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); outside the crate: integrations/signalk (JavaScript), integrations/opencpn (JavaScript relay, C++ native plugin), deploy/reference-build (systemd units, container)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (värav ja selle TCP-kuulaja, Rusti pool); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js ja integrations/signalk/test/plugin.test.js ({ "24" } Node'i testi salvestatud sünteetilisel väljundil); integrations/opencpn/test/relay.test.mjs ({ "5" } Node'i testi); integrations/opencpn/test/e2e-live.mjs (päris binaar TCP-tarbijani, käitatud käsitsi ja CI-s); integrations/opencpn/plugin/test/pksht_test.cpp ja integrations/opencpn/plugin/test/trust_state_test.cpp (C++ kontrollid PKSHT-sõeluri ja paneeli oleku kohta); deploy/reference-build/check-units.sh ja deploy/reference-build/test-entrypoint.sh

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); iq::track::boc üksusetestid (b4_unit_grid_misses_are_the_recorded_ones: eelregistreeritud B4 üksustesti lävi säilitatud nagu kirjutatud, selle salvestatud möödalaskmised kinnitatud leiuna F1)

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, registreeritud otsus kinnitatud salvestatuna, leid F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, ainult teatatud; andmetega väravdatud, hangitud skriptiga scripts/fetch_scint_malindi.sh); realdata::scint50 üksusetestid (model_data_through_the_harness_shows_the_wrapped_phase_finding, leid F2)

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, registreeritud otsus kinnitatud salvestatuna, leid F1, kinnitatud testiga finding_noise_free_sidelobes_exceed_the_cfar_rate); iq::acq üksusetest ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, leid F1, kinnitatud testiga finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, leid F2, kinnitatud testiga finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, ainult teatatud)

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-662887e17adb = standards_pack; compliance (standards-pack facts in compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: iga testi staatus, sealhulgas möödalaskmised L4-T1 ja neli IMO täpsustesti); standards_pack::tests

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), failiga tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py tuletatud arvudel

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), faili xval/crpa-jamming/expected.json vastu failist xval/crpa-jamming/oracle.py

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), faili xval/jamming-terrain/expected.json vastu failist xval/jamming-terrain/oracle.py

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), failide xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json ja expected_quantiser.json vastu

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), failil tests/fixtures/fll_handover_floor/results.csv

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (lat/lon epohhid, nädal/TOW ja ECEF, dms tagasi lükatud, vaenulik sisend); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (kinnitatud CRC, ASCII ja binaarkirjed, vigane CRC vahele jäetud, vaenulik sisend); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (CRC-24Q kataloogi kontrollväärtus, MSM4/MSM7 C/N0 ja epohhide liitmine, GLONASS-i aja ja SBAS-i id vastendus, vigane CRC ja muud sõnumid)

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (teadaolevad valge müra koefitsiendid taastatud { "10" } % piires, keeldumised, TOML sõelutakse kui AccelCfg); tests/receiver_trust_machines.rs (suuna kokkulangevus ja lahknevus, sisendkandja, imu_fit)

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (paketibaidid, loopback-vahendaja, surnud vahendaja loendatud); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: formaat, mida gnss_lib_py sild kirjutab, käitatud läbi receiver-trust'i); sildade Pythoni testid on integrations/ros2/kshana_trust/test/test_bridge.py (sild mock-mootoriga), integrations/ros2/kshana_trust/test/test_engine_integration.py (päris wheel hindab püsiva fiksi nominaalseks ja { "1.1" } km hüppe usaldamatuks) ja integrations/gnss_lib_py/test_bridge.py (päris gnss_lib_py { "1.1.0" } ja wheel), käitatud pytestiga, mitte cargoga

# text
seg-be26fdfb4a7c = allan

# text
seg-a59477833676 = tests/allan_reference.rs (NBS14 vs Stable32 täpsusega { "1e-4" }); allan::tests

# text
seg-b8ed4780ccb7 = tests/cs5071a_reference.rs (tegelik 5071A Cs vs H-maser, { "556 990" } punkti, { "16" } keskmistamistegurit vs Stable32 täpsusega { "1e-3" }; käivitub ainult andmete olemasolul, skriptiga scripts/fetch_cs5071a.sh)

# text
seg-17f05fc54f98 = tests/phasedat_reference.rs (Stable32 PHASE.DAT, { "139" } keskmistamistegurit, OADEV/MDEV/TDEV täpsusega { "1e-3" }; käivitub ainult andmete olemasolul, skriptiga scripts/fetch_phasedat.sh)

# text
seg-8c6006055d29 = tests/theo1_totvar_reference.rs (Theo1 + TOTDEV NIST SP { "1065" } §{ "12.4" } 1000-punktilisel LCG andmekogul, { "6" } + { "6" } keskmistamistegurit vs allantools { "2024.06" } täpsusega <{ "1e-9" }); allan::tests (valge FM suletud kujul jälgimine; TOTVAR=ADEV samasus kohal m={ "1" }; Theo1/TOTVAR faasi- ja sagedusnihke invariantsus; -1/2 valge FM tõus)

# text
seg-ca3c7f74a002 = allan (mtie, mtie_curve)

# text
seg-deb9fe96d3bd = tests/mtie_reference.rs (MTIE hermeetilisel NIST SP { "1065" } §{ "12.4" } 1000-punktilisel LCG faasireal, { "9" } keskmistamistegurit m={ "1" }..256 vs allantools { "2024.06" } mtie täpsusega <{ "1e-9" }, täheldatud ≤{ "4e-15" }); allan::tests (käsitsi tuletatud tipust tipuni väärtus; τ suhtes monotoonselt mittekahanev; täpne a·m puhtal lineaarsel kasvul)

# text
seg-a8f98bb9ff1b = allan (modified_adev, time_deviation)

# text
seg-271a3d6ac7b1 = tests/mdev_tdev_reference.rs (MDEV + TDEV hermeetilisel NIST SP { "1065" } §{ "12.4" } 1000-punktilisel LCG faasireal, { "8" } keskmistamistegurit m={ "1" }..200 vs allantools { "2024.06" } mdev/tdev täpsusega <{ "1e-9" } suhteliselt, pluss τ/√{ "3" } samasus tegelikul real); allan::tests (valge FM −1/2 tõus; käsitsi tuletatud väike MDEV-juhtum)

# text
seg-ad8d37a343f0 = quantum_trade (qparams_from_adev_curve), powerlaw

# text
seg-1df335e6eff2 = tests/optical_clock_adev_reference.rs (Norcia et al. ⁸⁸Sr pintsetikella (tweezer-clock) σ_y(τ), { "8" } keskmistamisaega { "0.92" }–{ "117.76" } s, lisatud sõna-sõnalt CC-BY-4.0 litsentsi all: NNLS rekonstrueerib kõvera ~{ "10" }% RMS / ≤{ "21" }% halvim punkt; taastatud √q_wf = { "4.33e-16" } vastab avaldatud väärtusele 4.7e-16/√τ; q_rw > { "0" } mõõdetud punase müra põhi)

# text
seg-5efe6e680a2e = araim_reference (add_v42_protection_levels, add_v42_protection_levels_ecef); raim (snapshot_raim, snapshot_raim_fde, araim_raim, araim_dual_raim, solution_separation_raim); sbas (sbas_protection_level); lunar

# text
seg-c7fea4d91077 = tests/integrity_araim_stanford_oracle.rs::araim_mhss_matches_stanford_maast_add_v4_2 ({ "270" } tegeliku geomeetriaga juhtu, Celestrak GPS+Galileo ja IGS SP3: halvim |dVPL| { "2.2e-3" } m, |dHPL| { "1.1e-3" } m, |dEMT| { "2.1e-10" } m vastu ADD-i TOL_PL väärtust { "0.05" } m); tests/integrity_araim_stanford_oracle.rs::uniform_sigma_matched_gap_finding (ühtlase sigma lüngad, kinnitatud); tests/integrity_snapshot_raim_rtklib_oracle.rs::snapshot_raim_decisions_and_slope_levels_match_rtklib (tegelik IGS ABMF 2018-05-13, { "288" } epohhi, { "2016" } juhtu süstitud { "10" } kuni { "100" } m nihetega: 2016/2016 tuvastus- ja 801/801 välistusotsust identsed, kalde HPL/VPL { "2.7e-12" } m piires vastu { "1e-6" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l1_protection_levels_match_stanford_maast_on_real_waas_messages ({ "2868" } kasutajaepohhi paari tegelikel WAAS-i edastustel, sama kaitstud hulk, halvim |dVPL| { "7.1e-6" } m ja |dHPL| { "1.6e-5" } m vastu { "1e-4" } m); tests/integrity_sbas_stanford_oracle.rs::sbas_l5_finding_geo_reception_gate (L5 leid, kinnitatud); tests/igs_real_data.rs ja tests/araim_dual_real_data.rs (usutavuskontroll tegelikel IGS SP3 ja Celestrak geomeetriatel, hoitud regressioonikontrollidena, mitte sõltumatute etalonidena (sõltumatute etalonidena))

# text
seg-a58b3968c6b7 = sgp4, propagator, orbit_determination, precise_od

# text
seg-9b9adc7d7cd4 = tests/sgp4_verification.rs ({ "666" } AIAA kontrollvektorit, halvim { "4.12" } mm); tests/sgp4_crate_comparison.rs (sõltumatu sgp4 crate)

# text
seg-1f6277967a05 = propagator, forces

# text
seg-f07882adc2a4 = tests/numerical_cowell_propagator_reference.rs ({ "275" } epohhi = { "11" } juhtu × { "25" } tunnipõhist olekut, LEO+GTO, vs Orekit { "12.2" } DormandPrince853; konservatiivsed tasemed T1–T5 halvim |Δr| { "0.08" } m { "24" } h jooksul; takistuse tase iseloomustatud väärtusel { "333" } m)

# text
seg-0010700556ee = srp_shadow, forces (srp_accel_with_lit_fraction), propagator

# text
seg-2e312ba33e1b = tests/srp_oblate_shadow_orekit_oracle.rs ({ "2400" } geomeetriat varjuserva ületades, { "884" } poolvarjus, LEO-st GEO-ni, Päikese deklinatsioon { "0" } ja +-23.44 deg, { "8" } asimuuti: halvim |dnu| { "7.41e-9" } WGS-84 puhul ja { "2.24e-9" } sfäärilise lähtetaseme puhul; Orekiti WGS-84 ja sfääriliste suhete erinevus ulatub väärtuseni { "0.98" }, seega eristab kogum lapikust); srp_shadow ja propagator ühikutestid

# text
seg-7c521cb02ac6 = srp_boxwing, propagator, precise_od

# text
seg-2d4f28a19e1d = tests/srp_boxwing_orekit_oracle.rs ({ "252" } Galileo orbiidi geomeetriat, { "7" } Päikese juhtu, sh periheeli ja afeeli kaugused, { "100" } juhuslikku asendit; lameplaatide summa halvim { "2.05e-15" } suhteliselt { "1056" } juhul; otsast lõpuni Orekiti enda asendi ja rõhuga halvim { "2.39e-15" } { "747" } täispäikese juhul, samal ajal kui Orekiti vaikimisi rõhukonstandid erinevad >= { "4.43e-3" } võrra, seega eristab võrdlus konstandi; nominaalse kursinurga (yaw) maatriks halvim { "1.89e-15" }; kiirgusteguri osatuletis halvim { "1.35e-15" }; paneelide osatuletised halvim { "4.12e-13" } suhteliselt Orekiti tsentraaldiferentside vastu { "10836" } paneelijuhul; ECOM2 kiirendus ja osatuletised halvim { "1.74e-15" }); srp_boxwing ühikutestid (suletud kujul piirjuhud, lõplike vahede osatuletised); propagator ja precise_od ühendustestid

# text
seg-d23a475337fb = tests/nrlmsise00_reference.rs ({ "720" } ruudupunkti, { "90" } kuni { "1000" } km, { "4" } laiuskraadi, { "2" } kohalikku aega, { "3" } päeva, madal/mõõdukas/kõrge aktiivsus: tihedus suhtelise veaga { "1.866e-6" } ja temperatuur { "1.97e-4" } K piires pymsis-ist; bitiliselt identne C-pordiga; { "17" } avaldatud C testjuhtu, { "187" } väärtust { "0.496" } ühiku piires 7. olulisest numbrist); nrlmsise00 ühikutestid

# text
seg-caf1ae1b5cc2 = forces (density_at, drag_accel_with_density), propagator

# text
seg-1ac527ac9ccd = tests/drag_tier_orekit_oracle.rs ({ "4" } juhtu x { "25" } tunnipõhist olekut { "24" } h jooksul, ringorbiit { "51.6" } deg, { "400" } km madala/mõõduka/kõrge aktiivsusega ja { "300" } km: halvim |dr| { "0.0303" } m ja |dv| { "3.36e-5" } m/s vastu { "3.3" } kuni { "141.8" } km takistusnihet, halvim viga/lävi { "0.003" }; eksponentsiaalse tiheduse kontroll eksib { "119.1" } m võrra); forces ja propagator ühikutestid (vaikeväärtus bitiliselt identne; tase hindab porti Maaga seotud geodeetilises punktis)

# text
seg-7f91101322d5 = forces (atmospheric_density, drag_accel), propagator

# text
seg-751bc9c9df58 = tests/drag_exponential_gmat_oracle.rs (ekvatoriaalsed juhud E400, E300 ja E250x600 hetkel J2000.0, { "25" } tunnipõhist olekut { "24" } h jooksul: takistusest tingitud nihe nõustub GMAT-i omaga kuni { "0.016" } osa ulatuses lävest { "0.5" } m + { "1e-3" }|D| vastu { "21.5" } kuni { "143.9" } km nihet; +{ "1" } % Cd*A/m muutus ulatub läve { "9.83" } kordseni; kaldorbiidi juhtu I400 esitatakse, { "10.4" } % erinevusega, mis on öeldud kõrgusemääratluse erinevus)

# text
seg-aa8686f7fb0a = tides (s2_air_waves, atmospheric_tide)

# text
seg-2143047934b5 = tests/s2_air_tide_gfz_table5.rs ({ "21" } / { "21" } lainet nõustub avaldatud mudeliga A2: halvim { "0.00050" } cm, { "0.050" } deg vastu läviväärtusi { "0.0006" } cm, { "0.1" } deg); tests/tides_iers.rs (S2 amplituudivahemik)

# text
seg-41e949982e14 = propagator (Geopotential, EarthFixedFrame), gravity_sh

# text
seg-0a12253e87b6 = tests/cowell_tesseral_orekit_oracle.rs ({ "6" } juhtu x { "25" } tunnipõhist olekut { "24" } h jooksul: EGM2008 8x8 ja 70x70 LEO-l { "45" } deg, polaarsel { "89.9" } deg, päikesesünkroonsel { "98.2" } deg, GTO-l, ning 70x70 Päikese/Kuu ja SRP-ga; halvim |dr| { "0.0355" } m, |dv| { "3.74e-5" } m/s; negatiivsed kontrollid eksivad { "6168" } m (külmutatud Maa) ja { "20871" } m (ainult tsonaalne) võrra); propagator ühikutestid (tsonaalpiirjuhu samasus täpsusega { "1e-12" }, CIO raam bitthaaval precise_od-ga, Jacobi integraal hoitud täpsusega { "1e-9" } { "6" } h jooksul)

# text
seg-f75dcdead7a4 = integrator, propagator

# text
seg-a921a1135cd7 = tests/dop853_scipy_oracle.rs ({ "8" } üksiksammu: olek { "5.55e-15" } suhtelise piires, FSAL-tuletis { "3.46e-15" }, tihe väljund { "1.99e-14" }, aktsepteerimise/tagasilükkamise otsused identsed; { "3" } täisjooksu rtol = atol = { "1e-12" } juures (LEO { "58000" } s, e = { "0.7" } { "5" } perioodi jooksul, Arenstorf ühe perioodi jooksul): algsamm identne, aktsepteeritud sammud 502/501, 390/390, 298/298 ja väärtustamised 6025/6013, 5497/5497, 4285/4285 SciPy vastu, lõppolekud { "2.95e-13" } suhtelise piires (kahe keha) ja { "1.58e-12" } (Arenstorf), tihe väljund { "9.5e-13" } piires; täpsus täpse mpmath Kepleri lahendi vastu võrdne SciPy omaga (LEO { "8.44e-5" } m, Arenstorfi perioodilisus { "1.475e-9" })); integrator ja propagator ühikutestid ({ "24" } h kahe keha lahend täpse Kepleri lahendi vastu alla { "0.1" } m)

# text
seg-c6da65825c67 = kepler, propagator

# text
seg-a8bfc307a73b = tests/kepler_mpmath_oracle.rs ({ "405" } ruudupunkti, e vahemikus { "0" } kuni { "0.999999" }, M vahemikus [-pi, pi] kuni { "1e-12" }: halvim |E - E_ref| { "0.898" } eps|E| vastu läve { "8" } eps|E|; { "9" } mähitud M-punkti halvimal juhul { "0.013" } oma lävest; Newtoni lihvimissammu pole vaja ühegi { "414" } punkti puhul; ümbris bitiliselt identne); kepler ühikutestid

# text
seg-9a2263ce0872 = gravity_pds, gravity_sh

# text
seg-43b33973adff = tests/planetary_gravity_pds.rs (20. astme väljalõiked töötavad alati: halvim |dg|/|g| { "9.7e-16" }, häiringu suhtes suhteline { "3.4e-11" }; GMM-3 d/o { "120" } üle kogu sfääri { "3.7e-15" } / { "6.3e-12" } ja GL0660B d/o { "660" } laiusel |lat| <= { "60" } deg { "5.0e-14" } / { "1.0e-10" }, käivitub ainult andmete olemasolul; päised ja valitud koefitsiendid võrdsed avaldatud PDS-i toodetega, kirjete arvud { "7380" } ja { "218790" }); gravity_pds ühikutestid

# text
seg-a7e3ecdbd2db = orbit_determination, precise_od (batch_ls::gauss_newton, fusion::ukf)

# text
seg-4adc303e81c8 = tests/batch_sequential_orbit_determination_reference.rs ({ "8" } stsenaariumi: { "6" } müravaba LEO/MEO/ekstsentriline/3–4-jaamaline + { "2" } σ={ "5" } m, vs Orekit { "12.2" }; halvim partii |Δr| { "1e-3" } m / |Δv| { "1e-6" } m/s, järjestikune |Δr| { "0.9" } m)

# text
seg-9edf08007870 = radiometric (light_time_solution)

# text
seg-c77ce1873266 = tests/deep_space_mars_radiometric_reference.rs ({ "24" } lõiku { "8" } epohhi jooksul { "2020" }–{ "2027" } vs ANISE DE440; halvim |Δτ| { "1.03e-9" } s, |Δrange| { "0.31" } m kuni { "2.5" } AU kaugusel)

# text
seg-8c4b011702b8 = rinex (parse_nav, RinexEphemeris::sv_position_ecef)

# text
seg-d202a16aba3f = tests/rinex_sp3_interop_reference.rs ({ "84" } SV-epohhi juhtu: GPS + Galileo + BeiDou-MEO, { "12" } SV × { "7" } nihet, vs RTKLIB eph2pos; halvim teljekohane |Δ| { "6.2e-8" } m)

# text
seg-8233e5fa4199 = sp3 (Sp3Interpolator::position_ecef)

# text
seg-4e11ff43fdf7 = tests/sp3_interp_reference.rs ({ "72" } sõlmedevahelist SV-epohhi juhtu / { "6" } satelliiti vs RTKLIB peph2pos; halvim teljekohane |Δ| { "1.5e-8" } m)

# text
seg-724b7f1d8d6e = ionex (parse_ionex, parse_ionex_file, IonexFile::vtec_at, IonexFile::slant_tec_at, interpolate_tec_in_time, TecGrid::vtec_at)

# text
seg-bec58d3dc51b = tests/ionex_code_gim_oracle.rs (sissekirjutatud sünteetiline IONEX-kaart vs valemietalon: { "20 075" } sõlme täpsed, interpolatsiooni maks |Δ| { "3.5e-13" } TECU; käivitub ainult andmete olemasolul muutujal KSHANA_IONEX_CODE_GIM_DIR, tegelik CODE-i lõplik GIM 2018-05-13 laiuskraadi lõige, mille tõi fetch.sh kinnitatud SHA-256-ga: sõlmed täpsed, interpolatsiooni maks |Δ| { "3.6e-13" } TECU { "15 795" } valimi peal, kaldsuuna TEC { "5.1e-13" } TECU; käivitub ainult andmete olemasolul: RTKLIB v2.4.2-p13 iontec { "6885" } päringupunktis, käivitatud 2026-10-13: maks |Δ| { "3.6e-13" } TECU mõlemas ajarežiimis, lävi { "1e-5" } eelregistreeritud); ionex::tests

# text
seg-b930d9f826c3 = rtk_real (run_rtk), lambda (resolve)

# text
seg-b182934a1bbc = tests/rtk_real_wettzell_oracle.rs (IGS-i jaamad WTZR baas / WTZZ rover, { "1.4" } m, 2025-02-24 00-03 h, { "30" } s: { "359" } epohhi, lahendused fikseeritud { "100" } % ulatuses alates { "00" }:{ "10" }, fikseeritud baasjoone vea mediaan { "4.5" } mm, p95 { "5.5" } mm; esimesed { "10" } min fikseeritud { "2.6" } mm vs ujuv { "13" } cm); rtk_real::tests

# text
seg-4ca93c8734ba = ppp_real (run_ppp, PppEpoch::clock_m)

# text
seg-3f5cbf55df2d = tests/ppp_time_igs_station_clock.rs (WTZR 2025-02-24, { "04" }:00-05:{ "55" }, { "24" } epohhi: Kshana miinus IGS std { "0.075" } ns, lävi { "0.20" }; keskmine -0.659 ns, lävi { "5.0" })

# text
seg-3f47749cb7a6 = ppp_real (run_ppp, parse_antex_receiver, solid_tide_ecef, phase_windup)

# text
seg-5e3b87bbbee5 = tests/ppp_real_wettzell_oracle.rs (IGS-i jaam WTZR, 2025-02-24 00-06 h, { "30" } s, arenduses kasutamata jäetud (held out): viimase epohhi horisontaalne { "1.5" } mm, üles −{ "2.9" } cm; 04-06 h 240/240 epohhi { "0.10" } m 3-D piires, p95 { "6.7" } cm; ainult koodiga p95 { "1.70" } m; andmetest sõltuv ZTD RMS { "1.7" } cm vs EUREF); ppp_real::tests; tests/ppp_parity_glab_rtklib.rs (RM-31: RTKLIB v2.4.2-p13 PPP samadel sisenditel nõustub { "0.05" } m piires 240/240 epohhil, { "9.7" } mm viimasel, kolmandal registreerimisel pärast kaht jooksu, mille RTKLIB konfiguratsioonis puudus tahke Maa loode ja mis määras antenni baasi kohale, mõlemad registreeritud leidudena; SPP pariteedilävi jäi täitmata, { "1.085" } m mediaan vs { "0.50" } m; gLAB { "6.0.0" } esimesel registreeritud jooksul, muudatuse { "4" } käsurida: PPP { "0.05" } m piires 240/240 epohhil ja { "5.0" } mm viimasel, SPP lävi täitmata, { "1.187" } m mediaan, leid: kahe etalonvahendi enda SPP lahendid erinevad { "0.852" } m mediaani võrra, nii et see lävi oli seatud rangemaks kui vahendite omavaheline nõustumine)

# text
seg-285c8c81e033 = rinex (parse_nav, parse_nav_with)

# text
seg-a0832efb1056 = tests/rinex4_nav_brd400_oracle.rs (IGS BRD400DLR_S RINEX { "4.02" } vs BRDM00DLR_S RINEX { "3.04" } kuupäevast 2026-07-19, lõik 00-02 h: G { "37" } / E { "478" } / C { "72" } kirjet sobitusid mõlemas suunas, iga väli identne, asukoht hetkel Toe { "0" } m; täispäev käivitub ainult andmete olemasolul: G { "416" } / E { "5668" } / C { "865" } / J { "118" }); rinex::tests

# text
seg-bc1599eb4b29 = sp3 (Sp3File::clock_s, clock_nodes), precise_products (ClockRinex::from_sp3)

# text
seg-0b017f6fc258 = tests/sp3_clock_igs_oracle.rs (IGS lõplik { "15" } min SP3 kuupäevast 2025-02-24 vs IGS lõplikud { "30" } s kellad, { "32" } GPS-satelliiti: sõlme mediaan |Δ| { "2.6e-13" } s; { "3038" } keskpunkti kirje RMS { "0.121" } ns, p95 { "0.265" } ns; sõlme hoidmisel selle asemel { "4.24" } ns RMS); sp3::tests::clock_interpolation_is_linear_between_valid_nodes_and_exact_at_them

# text
seg-5a2ded5bd597 = fusion::kfgins (run, loaders, score), fusion::closed_loop (propagate_increments, fuse_position_lever_arm), fusion::gnss_ins_ekf (update_position_lever_arm)

# text
seg-5c5f9bc7a90a = tests/fusion_kfgins_dataset_oracle.rs (sünteetilised laadijad ja pöörleva platvormi hoovarre testid alati; käivitub ainult andmete olemasolul muutujal KSHANA_KFGINS_DIR, käivitatud 2026-10-13 KF-GINS-i demoandmestikul: horisontaalne / vertikaalne RMS { "0.0109" } / { "0.0090" } m etalontrajektoori vastu vs KF-GINS C++ { "0.0111" } / { "0.0083" } m, kõik kuus eelregistreeritud läve täideti; hoovars välja lülitatud { "0.329" } m)

# text
seg-ffaf10c69f30 = interop::testbench (write_motion_csv, write_nmea, export)

# text
seg-25ce559f870b = tests/testbench_gpssdrsim_oracle.rs ({ "6" } testi: sõltumatu etalon ja stsenaariumid, eksporditud baidid kinnitatud, NMEA ja LLH lugejad, nelja veeruga ECEF lõige, 1. jooksu FINDING täislaiusega CSV-l, { "10" } Hz ridade ruudustik)

# text
seg-e93e26936fc3 = inertial::mechanization, inertial::attitude, inertial::imu_errors

# text
seg-add45d97ffaf = tests/classical_strapdown_ins_reference.rs (static/turn/coning profiilid, { "30" } epohhi igaüks, vs NaveGo: asend bitiliselt identne { "0" } rad; kiirus ja asukoht nimetatud analüütiliste piiride sees)

# text
seg-c7a20cc3b4ab = tests/icgem_gravity_reference.rs (GRS80 süntees reprodutseerib Somigliana täpsusega { "3.5e-12" }; tegelik ICGEM EGM2008 häiringukaart füüsikaline)

# text
seg-6e415a0f75f2 = cr3bp (to_moon_centred_icrf, from_moon_centred_icrf, to_moon_centred_icrf_de440)

# text
seg-28bd9e3f225a = tests/cr3bp_to_mci_spice_oracle.rs::cr3bp_to_mci_matches_a_spice_two_vector_frame ({ "72" } juhtu: { "12" } epohhi jaanuaris { "2025" } x punktid L1 ja L2, kaks L2 lõunapoolset halo ja üks DRO algolek JPL-i kolme keha perioodiliste orbiitide API-st ning üks üldine olek; halvim asukoht { "1.8e-7" } m vastu { "1" } mm, kiirus { "1.2e-9" } m/s vastu { "1e-6" } m/s; pöördteisendus { "2.7e-15" }); cr3bp::tests::moon_centred_map_round_trips_and_sends_the_moon_to_the_origin

# text
seg-49991cf99411 = solar_system (SolarSystemScenario::planetary_kernel_path, KernelOut); ephem_provider (KernelEphemeris)

# text
seg-dca7500cee83 = tests/solar_system_kernel_oracle.rs::kernel_backed_solar_system_matches_spice (Merkuur, Veenus, Maa ja Kuu kuupäevadel 2026-01-01, 2030-06-15 ja 2040-12-31: halvim { "3.3e-5" } m ja { "1.0e-11" } m/s vastu { "1" } mm ja { "1e-6" } m/s; kerneli plokk ja sildid täpsed); tests/solar_system_kernel_oracle.rs::without_a_kernel_the_report_has_no_kernel_block

# text
seg-7a164bdd2e29 = maneuver (porkchop_kernel, PorkchopGrid); ephem_provider (KernelEphemeris)

# text
seg-24424bbd7dd7 = tests/porkchop_de440_oracle.rs::de440_porkchop_matches_spice_and_pykep (Maa Marsi barütsentrini, { "16" } väljumist 2026-09-01..2027-01-29 x { "19" } saabumist 2027-06-01..2028-02-26: { "304" } lahtrit lõplikud mõlemal poolel, halvim C3 { "2.5e-14" } ja V-infinity { "2.6e-14" } suhteliselt vastu { "1e-8" }, sama minimaalse C3 lahter, { "9.1997" } km²/s²)

# text
seg-90681122a5e8 = maneuver (optimise_transfer_kernel, TransferObjective, TransferType, TransferOptimum); ephem_provider (KernelEphemeris)

# text
seg-945e4a7acbe5 = tests/transfer_optimiser_oracle.rs::transfer_optimiser_matches_spice_pykep_scipy (Maa Marsi barütsentrini, väljumised 2026-09-15..2027-01-15 x saabumised 2027-05-01..2028-03-01, Type I/II x min C3 / min V-infinity: halvim sihtfunktsioon { "8.7e-13" } suhteliselt, kuupäevad { "1e-5" } päeva piires, teine suurus { "2.5e-7" } suhtelise piires, eelregistreeritud lävede { "1e-7" }, { "0.01" } päeva ja { "1e-4" } vastu; docs/design/evidence/cap20cd-transfer-optimiser/); tests/transfer_optimiser_oracle.rs::transfer_optimiser_against_the_published_2026_handbook (teisene avaldatud etalon NASA/TM-2010-216764 tabel { "2" }: Type II min C3 { "9.182" } vs { "9.144" } ja Type II min V-infinity { "2.564" } vs { "2.565" } MET; Type I min C3 { "10.535" } vs { "11.11" }, -5.18 %, NOT MET ning testis kinnitatud täitmata jäämisena, raamatukogu sõltumatu etalon nõustub Kshanaga)

# text
seg-d79a333a38ef = maneuver (lambert_multirev, LambertSolution, LambertBranch)

# text
seg-57940d590f8e = tests/lambert_multirev_oracle.rs::multirev_lambert_matches_pykep_on_the_preregistered_cases ({ "382" } juhtu: { "300" } juhuslikku 3-D, { "18" } lähedal { "180" } deg, { "24" } lähedal minimaalsele ajale M = { "1" }..3, { "40" } heliotsentrilist; { "1058" } lahendit; arvud ja haru järjestus võrdsed; kiirused { "1e-8" } suhtelise piires, halvim { "1.6e-13" }; { "1" } % piires minimaalsest ajast { "1e-6" } piires, halvim { "7.5e-15" }; Kepleri maandumise sisemine kaitse maandab iga lahendi |r2| suhtes { "4.2e-12" } piires, välja arvatud üks kinnitatud leid e = { "0.994" } kaarel, kepler_universal piirang, mitte lahendaja piirang)

# text
seg-67d3c2e5a311 = maneuver (lambert)

# text
seg-5965501f44b7 = tests/lambert_reference.rs ({ "13" } ülekannet vs lamberthub izzo2015; halvim |Δv| { "7e-12" } m/s)

# text
seg-559cbdef5e7b = frames, precession, nutation, cio, timescales

# text
seg-3c23a80630da = tests/frame_reference_vectors.rs (Vallado otsast lõpuni; SOFA/ERFA vektorid)

# text
seg-05552ed067f9 = jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc, utc_to_ut1, tai_to_tt, earth_rotation_angle); sgp4 (Sgp4::new_at, Sgp4::propagate_at)

# text
seg-47eebaccfd86 = tests/jd2_sofa_time_oracle.rs ({ "224" } UTC hetke: kuus iga { "27" } liigsekundi ümber 1972-2016, kaks fikseeritud, { "60" } algväärtusega (seed) valitud vahemikus 1972-2026; dtf2d, utctai ja taiutc igaüks { "1e-6" } s piires, halvim { "1.9e-11" } s); jd2::tests (a_leap_second_day_is_86401_seconds_long_and_tai_steps_once; tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second; ut1_runs_through_tai_across_a_leap_second_day; the_two_part_earth_rotation_angle_matches_the_single_f64_one); sgp4::tests::propagate_at_measures_time_from_the_two_part_epoch

# text
seg-5a1b94ecd89e = jd2 (gmst82, From<TwoPartJd>, From<Jd2>); cio (gcrs_to_itrs_matrix_jd2); frames (teme_to_itrf_jd2, itrf_to_teme_jd2); orbit (Propagator::position_in_frame_jd2, own_jd2_utc); ephemeris (EphemerisScenario::two_part_jd)

# text
seg-53fd1421f96e = tests/jd2_earth_rotation_erfa_oracle.rs::two_part_earth_rotation_agrees_with_erfa ({ "40" } kaheosalist UT1/TT kuupäeva 1980-2050 sh +{ "1" }, +{ "10" }, +{ "50" } us sammud kahel kuupäeval: gmst82 { "1e-12" } rad piires, halvim { "0" }; GCRS-ist ITRS-i elemendid { "5e-12" } piires, halvim { "2.7e-14" }; pööre +1/+10/+{ "50" } us puhul { "1e-13" } rad piires ERFA-st, halvim { "1.1e-14" } rad, kus ühe f64 tee jätab +{ "1" } ja +{ "10" } us sammud täielikult märkamata); ephemeris::tests::two_part_jd_agrees_with_the_default_and_resolves_microsecond_steps; frames::tests::the_two_part_teme_to_itrf_round_trips_and_resolves_a_microsecond; jd2::tests::gmst82_matches_the_single_f64_gstime_away_from_the_floor; jd2::tests::two_part_types_convert_without_moving_the_instant

# text
seg-dc25004c0845 = precession (precession_matrix); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix_with_offsets)

# text
seg-c3deb78a651c = tests/frames_erfa_vector_oracle.rs::frame_matrices_agree_with_erfa_vectors ({ "40" } TT epohhi 1950-2100, dX ja dY kuni { "0.5" } mas: presessiooni elemendid { "1e-13" } piires, halvim { "0" }; TEME-st GCRS-i { "5e-10" } rad piires, halvim { "1.10e-10" } rad; CIO nihetega { "1e-13" } piires, halvim { "0" }; nullnihked bitiliselt identsed cio::gcrs_to_cirs_matrix-iga)

# text
seg-351739161c56 = timescales (tai_minus_utc_on_date); jd2 (Jd2::from_utc_calendar, utc_to_tai, tai_to_utc)

# text
seg-e9e659ebde98 = tests/jd2_pre1972_sofa_oracle.rs::pre_1972_utc_conversions_agree_with_erfa ({ "117" } UTC hetke: neli iga { "15" } TAI-UTC avaldise alguse ümber 1960-1972 ja { "60" } algväärtusega (seed) valitud vahemikus 1960-1971; dtf2d, utctai ja taiutc igaüks { "1e-6" } s piires, halvim { "2.9e-11" } s); tests/jd2_pre1972_sofa_oracle.rs::post_1972_results_are_bit_identical ({ "224" } hetke rea { "1972" }+ muutumatu bitthaaval)

# text
seg-65230d78e0c2 = glonass (GlonassEphemeris::sv_clock_bias_s, position_ecef, parse_glonass_nav)

# text
seg-6567510c9726 = tests/glonass_broadcast_rtklib_oracle.rs::glonass_broadcast_clock_and_orbit_match_rtklib ({ "292" } juhtu: tegeliku 2013-01-01 IGS MGEX edastusfaili { "4" } GLONASS-i kirjet x { "73" } nihet +/-900 s piires; kell { "1e-14" } s piires, halvim { "0" } s; asukoht { "0.01" } m piires, halvim { "1.12e-3" } m)

# text
seg-945e951061c2 = sgp4 (MeanElementSet, SgpOrbit, Eop, teme_to_itrs_matrix_eop, gcrs_to_itrs_matrix_eop); jd2 (utc_to_ut1, earth_rotation_angle); nutation (teme_to_gcrs_matrix); cio (gcrs_to_cirs_matrix); frames (polar_motion_matrix)

# text
seg-f11a8313d1ec = tests/earth_orbit_path_sgp4_erfa_oracle.rs (osa { "1" }: { "4432" } TEME asukohta { "232" } sissekirjutatud elemendikomplekti kohta python-sgp4 { "2.24" } vastu, halvim { "6.1e-8" } m, lävi { "1" } cm; osa { "2" }: { "108" } hetke, neist { "23" } Maa orientatsiooniparameetritega ja üks liigsekundipäeva viimasel sekundil, ERFA vastu: GCRS -> ITRS halvim { "2.9e-6" } mas, lävi { "0.1" } mas; TEME -> ITRS halvim { "0.41" } mas, lävi { "2" } mas); sgp4::tests (the_itrs_path_matches_the_orbit_module_iau_chain; an_earth_fixed_node_stays_at_its_longitude_at_the_epoch); tests/no_private_models.rs

# text
seg-5235d736ac3e = navsignal (CodeFamily)

# text
seg-532eb9a2900f = navsignal::code_tests (GPS C/A Gold ≈ −{ "23.9" } dB; φ({ "1023" })/10 = { "60" })

# text
seg-6f9de921ca86 = orbit (dop)

# text
seg-b215ace86be9 = tests/dop_reference.rs ({ "8" } geomeetriat, hästi tingimuslikust → peaaegu singulaarseni)

# text
seg-686687c1fa8d = gnss_sim (klobuchar_delay_m)

# text
seg-aee414a8d8ec = tests/klobuchar_reference.rs ({ "10" } juhtu üle kõrgusnurga/asimuudi/kohaliku aja, kaks koefitsiendikomplekti)

# text
seg-1c1d27c45546 = raim (chi2_cdf, chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile, pbias)

# text
seg-b3663ac963e1 = tests/raim_reference.rs ({ "171" } juhtu: χ² CDF/kvantiil, normaaljaotuse CDF/kvantiil, mittetsentraalne χ² CDF, pbias üle P_fa/P_md/liiasuse vahemike)

# text
seg-afe92c4623d2 = SciPy { "1.17.0" } (scipy.stats.chi2/.norm/.ncx2 + optimize.brentq) — sõltumatu teek (Cephes/Boost), Kshana mittetäieliku gammafunktsiooni reast erinev algoritm; sobitatud täpsusega ≤{ "1e-6" } suht. Ainult tuum. ARAIM MHSS P_HMI eelarve <em>jaotusel</em> ei puudu enam avaldatud arvuline sõltumatu etalon — WG-C ARAIM tehnilise allrühma enda läbitöötatud näide toetab nüüd eraldi rida „ARAIM MHSS kaitsetasemed avaldatud etalonvektorite vastu“, sobitatud etaloni enda TOL_PL = { "5e-2" } m juures — seega selle rea ulatus on statistiline tuum ja see teine rida kannab jaotust (vt docs/ARAIM_REFERENCE.md)

# text
seg-116377f12c14 = sbas (sbas_protection_level)

# text
seg-f4fa833999f3 = tests/sbas_reference.rs ({ "6" } tegelikku EGNOS-i epohhi: HPL sobitatud otse, vertikaalne d_U kontrollitud K-teguri vabalt)

# text
seg-2053116957cc = impairment_eval (auc, confusion_at, roc_curve)

# text
seg-f0853f1adeaa = tests/eval_metrics_reference.rs ({ "5" } andmekogumit, { "24" } läviväärtust; täpsed arvud + <{ "1e-9" })

# text
seg-ee20bf2a4315 = impairment_eval, eval_stats

# text
seg-f546b062df87 = tests/opssat_ad_reference.rs (tegelik ESA OPS-SAT, AUC reprodutseerib scikit-learni täpsusega { "1e-9" }); tests/ai_ml_rf_impairment_detection_evaluation_reference.rs ({ "122" } juhtu tegelikul OPSSAT-AD testijaotusel: täielik töötamispunkti segadusmaatriks + Pd/Pfa/precision/F1 vs scikit-learn, täisarvuliselt täpne)

# text
seg-c085cbd2a029 = quantum_trade (qparams_from_adev_curve), detection (chi2_inv_cdf), clock_state (ClockState3)

# text
seg-42b83604390f = tests/scipy_reference.rs (NNLS; χ² töövabadusastmetel ≥ { "48" }; van-Loani Q)

# text
seg-f571816b43fc = igrf, igrf_data

# text
seg-7bd357bd734a = tests/alternative_complementary_pnt_reference.rs ({ "2520" } globaalset punkti × kõrgused vs ppigrf @ epohh { "2025.0" }; halvim |ΔXYZF| { "3.9e-4" } nT, |ΔD| { "2.8e-6" }°, |ΔI| { "3.6e-7" }°)

# text
seg-88c8996b8e2e = quantum_faults, eval_stats, detection

# text
seg-1f37560eef48 = tests/quantum_faults_reference.rs ({ "109" } juhtu vs scipy { "1.17" } norm.cdf/ppf + scikit-learn roc_auc_score; halvim |Δ| AUC { "6.9e-8" }, vähim tuvastatav rike { "1.3e-8" }, empiiriline AUC { "1.1e-16" })

# text
seg-7353cfaa51c0 = tests/resilience_score_decision_instability_reference.rs ({ "124" } juhtu vs scipy { "1.18" } / numpy { "2.4" }: { "61" } Kendalli τ-b täpsusega { "2e-16" }, järjestus täpne, Dirichlet' keskmine + protsentiilide usaldusvahemik täpsusega { "1e-12" })

# text
seg-1c3ad165ae7d = tests/mcda_ahp_reference.rs (Saaty { "1980" } juhuindeksi tabel n={ "1" }..10 TÄPNE; prioriteedivektor + λ_max + CR vs SciPy/LAPACK eig järjepideval { "3" }×{ "3" } ja ebajärjepidevatel { "3" }×{ "3" } / { "4" }×{ "4" } maatriksitel, sobitatud täpsusega <{ "1e-9" })

# text
seg-ffb971fd45e1 = mcda::wsm, mcda::wpm

# text
seg-f10f7b107cb9 = tests/mcda_wsm_reference.rs (WSM skoorid + järjestus) ja tests/mcda_wpm_reference.rs (WPM skoorid + järjestus), kumbki vs pymcdm täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } kasu/kulu otsustusmaatriksil

# text
seg-3b78f01d1992 = tests/mcda_topsis_reference.rs (lähedustegurid + järjestus vs pymcdm täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } kasu/kulu maatriksil)

# text
seg-863ebd5e97c5 = tests/mcda_vikor_reference.rs (Q-indeks + järjestus vs pymcdm täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } kasu/kulu maatriksil)

# text
seg-faaffee99e67 = tests/mcda_promethee_reference.rs (netoületavuse voog + järjestus, tavakriteerium, vs pymcdm täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } kasu/kulu maatriksil)

# text
seg-c3c1ab11c426 = tests/mcda_electre_reference.rs (kooskõla-, lahkarvamus- ja domineerimismaatriksid element elemendi haaval + tuum/domineeritud hulk vs pyDecision täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } ainult kasu andmestikul)

# text
seg-08e153bbaef7 = mcda::waspas, mcda::moora

# text
seg-eafdba85247a = tests/mcda_waspas_reference.rs (WASPAS eelistused + järjestus) ja tests/mcda_moora_reference.rs (MOORA skoorid + järjestus), kumbki vs pymcdm täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } kasu/kulu otsustusmaatriksil

# text
seg-3d6cd006d21f = tests/mcda_copras_reference.rs (kasulikkuse astmed + järjestus vs pyDecision täpsusega <{ "1e-9" } fikseeritud { "4" }×{ "3" } kasu/kulu maatriksil)

# text
seg-7fb7df3cd534 = tpl (Cusum), security

# text
seg-7600ece37358 = tests/timing_protection_level_under_spoofing_reference.rs ({ "16" } deterministliku latentsusega juhtu TÄPSED vs esmakordse läbimise sõltumatu etalon; { "8" } ARL₁ juhtu, Monte Carlo @60k katset vs Siegmundi lähend + avaldatud Montgomery tabelid)

# text
seg-034d00c5844a = holdover (coast_phase_variance, holdover_seconds)

# text
seg-f41c77ef0855 = tests/gnss_denied_clock_holdover_reference.rs ({ "27" } juhtu vs scipy { "1.18" }: { "12" } coast-dispersiooni juhtu vs linalg.expm Van-Loani Q₀₀ halvim suht { "1.1e-15" }; { "7" } holdover-i pöördarvutust vs optimize.brentq halvim suht { "1.5e-16" })

# text
seg-817055dfe79a = resilience::diversity (effective_diversity)

# text
seg-9cad75e722bc = tests/resilience_diversity_reference.rs ({ "17" } juhtu: { "14" } vs scikit-bio inv_simpson + { "3" } kinnitatud nullpiirjuhtu; halvim |Δ| { "0.0" })

# text
seg-140080386c90 = skyline (Skyline::cut_deg, Skyline::visible); frames (look_angles, is_visible_skyline); orbit (UserPath, sky_view, cofactor_from_los); geometry (sky_geometry)

# text
seg-cec96e27c310 = geometry (sky_geometry, ellipse); orbit (cofactor_from_los)

# text
seg-db663720ff55 = sdr

# text
seg-02c8f0d7ea55 = sdr::code_tests (ca_first_ten_chips_match_is_gps_200_octal — PRN { "1" }–{ "9" } esimesed 10 kiipi reprodutseerivad täpselt IS-GPS-200 tabeli 3-Ia oktaalarvud 1440/1620/1710/1744/1133/1455/1131/1454/1626; ca_code_has_1023_chips_and_is_balanced; ca_periodic_autocorrelation_is_three_valued)

# text
seg-e8e5abbe7b58 = fusion (gnss_ins_ekf, tightly_coupled, ukf, coupled)

# text
seg-e941099918ef = fusion::tests (UKF==lineaarne KF samasus; väljalangemise coast; NEES); tests/gnss_ins_sensor_fusion_reference.rs ({ "50" } juhtu vs filterpy { "1.4.5" }: lineaarne EKF nõrk/tihe + seotud PNT-i aposterioorsed jaotused täpsusega ≤{ "2.4e-12" }; UKF 40-epohhi jooks halvim |Δx| { "1.9e-7" } / |ΔP| { "9.5e-6" }); tests/gnss_ins_navego_dataset_oracle.rs::loosely_coupled_rms_within_1p2x_of_navego (NaveGo v1.4 nõrgalt seotud lahendus NaveGo tegelikul Ekinox IMU/GNSS sõidul: horisontaalne RMS 0.912x, vertikaalne 0.940x, asukoha innovatsiooni RMS 0.861x NaveGo omast, keskmine normeeritud innovatsioon { "0.395" }; lävi 1.2x, 1.2x, 1.2x ja { "1.5" } fikseeritud enne jooksu)

# text
seg-e53182bd8d30 = cr3bp::tests (STM vs lõplikud diferentsid); tests/cislunar_mission_analysis_reference.rs ({ "5" } JPL L2-S NRHO liiget: { "9" }:{ "2" } + { "4" } naabrit; halvim |ΔC| { "1.5e-5" }, |ΔT|/T { "9.6e-5" }, perilune { "0.7" } km JPL-i pikkusühikutes)

# text
seg-4cac09f2382e = gravity_sh, altpnt::maps, gravimeter

# text
seg-d0ee49fda1e0 = tests/icgem_gravity_anomaly_oracle.rs (egm2008_n70_matches_cited_icgem_values CI-s kümnel viidatud ICGEM sõlmel; egm2008_n70_gravity_anomaly_sa_matches_icgem kogu toodud 0.25-kraadistel ruudustikel Tšaad 9-15N 19-25E ja Surmaorg 35-38N 242-245E, { "794" } sõlme: RMS { "1.3e-8" } ja { "2.6e-8" } mGal, maks { "2.9e-8" } mGal vastu eelregistreeritud lävesid { "0.005" } / { "0.02" } mGal, xval/icgem-egm2008/); gravity_sh::tests

# text
seg-d5b8ca2a48cc = tests/terrain_nav_validation.rs (real_srtm_committed_badwater_tile_reads_real_relief — avaliku omandina oleva SRTM v3 N36W117 ruudu sissekirjutatud 6-kaaresekundiline hõrendus asetab Badwateri nõo, Põhja-Ameerika madalaima punkti, kohale −{ "78" } m mõõdistusvahemikus [−{ "95" },−{ "70" }] m ja loeb ruudu tõelist ~{ "2.2" } km idapoolset reljeefi; lisaks kahel sissekirjutatud sõna-sõnalt 1-kaaresekundilisel 361x361 lõikel N36W119 ja N36W117 real_srtm_tile_whitney_in_survey_band ({ "4412.1" } m vahemikus [{ "4380,4430" }] m mõõdistuse { "4421" } m ümber), real_srtm_tile_badwater_in_survey_band (−{ "78.0" } m vahemikus [−{ "95" },−{ "70" }] m) ja gdal_cross_check (lähim sõlm võrdub GDAL { "3.8.4" } gdallocationinfo-ga täisruutudel täpselt kõigis { "8" } eelregistreeritud punktis, xval/srtm-ungate/; lisaks käsitsi ehitatud bilineaarse keskpunkti ja sünteetilise fikstuuri parseri sõltumatud etalonid)

# text
seg-d86971b6e158 = oem

# text
# c1: oem
seg-f00dd400fa2d = tests/ccsds_oem_interop_reference.rs ({ "24" } olekut / { "2" } fikstuuri dekodeeritud baidi kaupa identselt sõltumatu <c1/> parseriga, pos/vel Δ = { "0" }); oem::tests (välisvahendi OEM-i parsimine lisavõtmesõnade/kommentaaride/kovariatsiooniga, kirjutamine→lugemine täisoleku edasi-tagasi, pos+vel+kiirendus lubatud, ainult asukoht + puuduv kohustuslik metaandmestik tagasi lükatud, stsenaariumi edasi-tagasi kõrge täpsusega + väline sissevõtt); dominance_demonstrators (kättesaadav + reprodutseeritav + edasi-tagasi täpne + MODELLED-mitte-VALIDATED)

# text
# c1: oem
seg-ab37fdc7a543 = Sõltumatu kolmanda osapoole CCSDS-502 parser <c1/> { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — eraldi koodibaas, mis dekodeerib kshana väljastatud EME2000/UTC OEM-i baidi kaupa identselt ({ "24" } olekut { "2" } fikstuuri peale, pos/vel Δ = { "0" }) ja mille range lugeja kinnitab metaandmete märgid; kshana parser nõustub sellega samuti sisseehitatud välisel OEM-il. Kaks ausat koostalitlusleidu (oem teek lükkab tagasi kshana satelliidipõhise mitmesegmendilise konventsiooni ja mitmekirjelised kovariatsiooniread) on dokumenteeritud testis — seega kontrollib see standardit järgivat ühe objekti vahetust, mitte kõigi kshana variantide täielikku CCSDS-502 standardi järgimist

# text
seg-3814a35508eb = eo_payload (j2_node_rate, j2_nodal_period, ground_track_spacing_equator_j2, sun_synchronous_inclination)

# text
seg-e26317a36469 = eo_payload::tests (nurkraadius { "64" }° kõrgusel { "700" } km + väheneb kõrgusega, nadiir→seniit/nullkaugus, horisont→ε=0/maks tsentraalnurk, horisondi taha viivad vead, ribalaius kasvab FOV-iga / GSD kõrgusega, ~{ "2750" } km sõlmevahe, reprodutseeritav stsenaarium/MODELLED + vigase sisendi tagasilükkamine); dominance_demonstrators (kättesaadav + reprodutseeritav + { "64" }° nurkraadius + MODELLED-mitte-VALIDATED); tests/eo_payload_coverage_orekit_oracle.rs::eo_coverage_matches_orekit_and_geographiclib (kõrgused 400-1500 km, kaldenurgad 1-98 deg, pool-FOV 7.5-50 deg, IFOV 10-50 microrad, kallutus { "30" } ja { "89" } deg: iga suurus oma eelregistreeritud läve sees, pidev lipp 168/168); tests/eo_payload_coverage_orekit_oracle.rs::exempt_flag_points_are_the_engines; regressioon tests/eo_payload_coverage_reference.rs

# text
seg-ee8ce4b84732 = space_packet::tests (päisebitid vastavad CCSDS-133 paigutusele, kodeerimine→dekodeerimine edasi-tagasi kõigil väljadel, vahemikust väljas/kärbitud tagasi lükatud); tests/ccsds_space_packet_reference.rs ({ "33" } juhtu vs spacepackets { "0.32.0" }, sh { "12" } täispaketi võrdlust; null mittevastavat oktetti)

# text
seg-6566a3bdb3b4 = space_packet (TimeCode, SecondaryHeader, packet error control, segmentation and reassembly, stream decoding)

# text
seg-f9c3b678f754 = tests/space_packet_ext_oracle.rs (viis eelregistreeritud läve: CRC, ajakoodid, vood, lüngad ja järjestus, PUS TM; null mittevastavust); space_packet::tests

# text
seg-49684da520e1 = spk_writer (SpkSegment, to_bytes, from_bytes, eval, et_from_label, oem_to_spk_segments)

# text
seg-d0468ecef524 = tests/spk_writer_spice_oracle.rs (inventar, hindamine, bitt- ja baidi samasus, OEM-i epohhi teisendus; neli kavandatud mutatsioonikontrolli muudavad selle punaseks)

# text
seg-7b7d5c79bcde = spk_writer (SpkType::Chebyshev3, SpkType::DiffLines21, SpkSegment, InterpolatedSpk)

# text
seg-fa6c68bfeb74 = tests/spk_3_21_spice_oracle.rs (inventar, hindamine mõlemat pidi, baidi samasus); spk_writer::tests

# text
seg-2b73bbf7fd60 = adm (AemMessage, ApmMessage, quaternion_a_to_b), ndm_xml

# text
seg-6d6d69a7117e = tests/adm_orekit_oracle.rs (L1 Orekit loeb { "33" } Kshana faili, L2 Kshana loeb { "31" } Orekiti faili, L3 { "135" } kirje pööret; leiud kinnitatud); adm::tests; ndm_xml::tests

# text
seg-4fc5845019f2 = odm (OpmMessage, OmmMessage, OcmMessage, Section, OcmBlock), ndm_xml

# text
seg-4dd013dd6b9e = tests/odm_orekit_oracle.rs (L1 Orekit loeb { "30" } Kshana faili, L2 Kshana loeb { "25" } Orekiti faili; leiud kinnitatud ja nende kordumine tagatud); odm::tests

# text
seg-2e7fd9b81080 = attitude_budget::tests (GG-moment kaob sümmeetrilisel kehal, kasvab madalamal, lineaarne ΔI suhtes, RSS ruutsumma, dispersiooniosade summa on 1); tests/attitude_gg_torque_reference.rs ({ "20" } juhtu vs sõltumatu täistensoriga GG-moment T=(3μ/R³)(n̂×(I·n̂)) arvuliselt maksimeeritud asendi üle Hipparchus { "3.1" } linalg-iga; halvim suht { "6e-15" }, + Wertzi/Sidi avaldatud O({ "1e-6" }) s⁻² vahemik); tests/attitude_gg_torque_basilisk_oracle.rs::gravity_gradient_torque_matches_basilisk ({ "40" } juhtu vs Basilisk { "2.9.1" } GravityGradientEffector: tipp { "45" } deg asendi juures { "1e-12" } suhtelise piires, halvim { "2.1e-15" }; tipust kõrgemat momenti pole { "2000" } juhusliku asendi peal juhtumi kohta, { "3" } diagonaalset ja { "5" } üldist inertstensorit, { "5" } kõrgust)

# text
seg-49b30066ff1b = passes::tests (interp-cross lineaarne + degenereerumiskindel, polaarsest→keskmisele laiuskraadile läbilennud, kõrgem mask ⇒ vähem-või-võrdne); tests/ground_station_pass_prediction_reference.rs ({ "22" } stsenaariumi / { "129" } läbilendu vs Orekit { "12.2" } ElevationDetector; halvim |Δ| AOS/LOS { "0.0000" } s, maksimaalne kõrgus { "0.0014" }°, kogu juurdepääs { "0.0001" } s, identne läbilendude arv)

# text
seg-302a5a17401b = passes (predict_passes_apparent, apparent_look_angles, ApparentOptions, p834_tau_s_deg, p834_tau_deg, p834_theta_m_deg, p834_apparent_elevation_deg, PassesScenario)

# text
seg-be96bc40b05d = tests/pass_predictor_on_path_orekit_oracle.rs ({ "60" } juhtu, { "1210" } läbilendu: AOS/LOS { "3.4e-6" } s piires, lävi { "5" } ms; maksimaalne kõrgus { "5.5e-7" } deg piires, lävi { "1e-3" } deg; { "8979" } näivat suunda { "8.8e-7" } deg piires, lävi { "1e-4" } deg); tests/earth_orbit_path_sgp4_erfa_oracle.rs (tee); passes::tests (p834_equations_9_and_14_are_consistent_and_vanish_toward_the_zenith; refraction_lengthens_passes_and_light_time_delays_them); tests/pass_predictor_apparent_orekit_oracle.rs (1. vooru leid, kinnitatud; orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level)

# text
seg-b985f72dcdf4 = linkbudget::tests (vabaruumi sumbuvuse kuju, sidelingi võrrandi sulgumine); tests/one_way_link_budget_reference.rs (DESCANSO/JPL Galileo X-riba DCT reprodutseeritud otsast lõpuni + { "6" } ITU-R P.525 FSL juhtu üle DSN S/X/Ka riba keskpunktide; halvim |ΔFSL| { "4.6e-3" } dB, |Δkandja| { "2.5e-2" } dB)

# text
seg-ca02c7483ba8 = lunar_time::tests (suletud kujul kiirus; edasi-tagasi); tests/lunar_coordinate_time_reference.rs (LTC omapotentsiaali ja sekulaarse kiiruse liikmed vs avaldatud Ashby ja Patla { "2024" } väärtused + geotsentriline Kuu kiirus vs JPL DE440)

# text
seg-7ef514b90798 = frame_eop::tests ja realtime_frame_eop::tests (kõik kolm komponenti kannavad võrdseid, elementhaaval identseid, rangelt kasvavaid epohhikomplekte üle mõlema tegeliku IERS-i väljavõtte; ühishulk taandub ühisosaks, kui kaks Bulletin B plokki tegelikult lahknevad, ja horisont, millel puuduvad ühised read, jäetakse välja, mitte ei täideta nullidega; ennustatud-versus-lõpliku tabeli tühjus on dokumendis öeldud, mitte puuduva välja varal vihjatud; tegelik teine versioon täidab selle, kontrollitud rida realt; puuduv hilisem versioon on viga, mitte vaikiv tühi tabel); tests/joint_eop_table_astropy_erfa_oracle.rs::joint_table_and_predicted_vs_final_tables_match_astropy_and_erfa (stsenaariumi tabelid { "3" }, { "4" } ja { "6" } otsast lõpuni: epohhikomplektid täpsed, UT1 ja poolus statistika { "1e-9" } piires, kombinatsioon Kuul { "1e-5" } piires täisERFA pöördest, iga ennustatud-versus-lõpliku juhu öeldud olek); tests/joint_eop_error_iers_ar2019_oracle.rs::bulletin_a_2019_prediction_error_matches_the_iers_realised_statistics (Kshana/IERS { "1.001" } kuni { "1.100" } vahemikus { "1" } kuni { "90" } päeva); ridade loendus: tests/embedded_eop_vintage_astropy_preregistered.rs (ilma võrguta sisendi rida); 1. vooru regressioon: tests/joint_eop_error_bulletin_a_oracle.rs::measured_error_against_the_iers_accuracy_formula_pole_agrees_ut1_does_not

# text
seg-8d703fef00d5 = realtime_frame_eop, eop

# text
seg-41f91517a4bb = tests/embedded_eop_vintage_astropy_preregistered.rs::vintage_of_every_row_matches_astropy_and_predictions_match_bulletin_a (kuus täpset kriteeriumi: väljavõtte baidid; { "174" } rida; versioonipõhised arvud ja täielikud MJD-loendid 30/54/90; lipp P nii polaarliikumisel kui UT1-l igal ennustatud real; paljas vaikejooksu loendus; iga ennustatud rida võrdne IERS Bulletin A Vol. XXXIX No. { "039" } omaga selle viimase trükitud numbri piires, halvim { "5.0e-5" } kaaresekundit ja { "4.9e-6" } s); tests/embedded_eop_census_astropy_oracle.rs::vintage_census_matches_astropy (vana 32-realise väljavõtte regressioonikinnitus lipuklassifikaatori all: { "20" } lõplikku, { "12" } kiiret, { "0" } ennustatud); tests/embedded_eop_census_astropy_oracle.rs::rows_called_prediction_only_are_flagged_measured_by_astropy (1. vooru leid, säilitatud); realtime_frame_eop::tests; tests/operational_eop_predictor_reference.rs

# text
seg-d25312c585d1 = lunar_vlbi (KernelGeometry, delay_partials_beacon_body, delay_partials_stations, LunarVlbiScenario); naif_kernel

# text
seg-1caf84a930c6 = tests/lunar_vlbi_spice_oracle.rs::kernel_delay_and_partials_match_spice_light_times_near_j2000 ({ "75" } viivitust { "25" } epohhil J2000 lähedal üle DSS-14, DSS-43 ja DSS-63: viivitused { "1" } ps piires, halvim { "0.06" } ps; keharaamis majaka osatuletised { "1e-6" } piires, halvim { "7.4e-9" }; ITRF93 jaama osatuletised { "1e-6" } piires, halvim { "3.8e-11" }); tests/lunar_vlbi_spice_oracle.rs::spice_2024_epochs_finding_is_unchanged; tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference (kerneli hindamise ristkontroll); tests/naif_kernel_reader_check.rs; lunar_vlbi::tests

# text
seg-5140b9231f4b = naif_kernel (DafFile, SpkKernel, PckKernel); ephem_provider (KernelEphemeris)

# text
seg-3747d76d3c5c = tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_post_registration_grid ({ "600" } de440s.bsp olekut ja { "200" } MOON_PA_DE440 pööret { "200" } epohhil 1849-2150 ja juhuslikel kehapaaridel, mis on tõmmatud eelregistreerimise commiti enda räsist, vastu SPICE ja ANISE lõigatud kernelitel, mis on NAIF-i omadega bitiliselt identsed: halvim erinevus { "0.6" } % oma lävest, { "1.95e-3" } m absoluutselt); tests/naif_reader_spice_oracle.rs::reader_matches_spice_and_anise_on_the_full_naif_kernels_when_present (sama täis NAIF-i failidel, SHA-256 kontrollitud; käivitub ainult andmete olemasolul); tests/naif_kernel_reader_check.rs (inseneriline kaitse, mitte tõend); naif_kernel::tests; ephem_provider::tests

# text
seg-92c70de528b4 = lunar_common_mode::tests ({ "8" } teegi testi: jaotus on liitev ja rekonstrueerib dy; ühisrežiimi kovariatsioon annab positiivse ühisrežiimi kaitsetaseme, samas kui ainult pariteedi kovariatsioon annab peaaegu nullilise; projektor annihileerib range(G)); tests/lunar_common_mode_integrity_reference.rs (mootori jaotus vs sõltumatu numpy arvutus baidi kaupa identsetel sisenditel üle sissekirjutatud 366-epohhilise valimi, nii suhteline KUI absoluutne viga < { "1e-3" }); tests/lunar_common_mode_parity_numpy_oracle.rs::common_mode_split_matches_numpy_lstsq_on_parity_bearing_inputs ({ "1464" } pariteeti kandvat juhtu 8-satelliidilisel geomeetrial ja 6-satelliidilisel alamhulgal üle mõlema tegeliku efemeriididevahelise paari: blind_dx, jääk ja normid { "1e-12" } piires |dy|-st, halvim { "1.06e-14" })

# text
seg-5cd36a6d71b9 = lunar_combination (problem, model, estimate, formal_covariance); batch_ls (gauss_newton_qr)

# text
seg-63056b57baab = lunar_combination::tests (taastab simuleeritud tõe; VLBI taastab jaama 3-D jälgitavuse; deterministlik); tests/lunar_joint_multi_technique_od_reference.rs ({ "6" } geomeetriat × { "16" } parameetrit, { "31" } vaatlust igaüks, vs Orekit { "12.2" } / Hipparchus Levenberg-Marquardt identsetel vaatlustel; taastatud olek halvim |Δ| { "1.4e-8" } m); tests/lunar_joint_od_numpy_oracle.rs::joint_solve_linear_algebra_matches_numpy (kuus võrku, sh üks ilma VLBI-ta: Gauss-Newtoni sammud { "4.3e-11" } piires, formaalsed sigmad { "1.9e-11" } piires, jaamavead võrdsed; { "0.36" } kaasaskantava matemaatika sisenditel { "2.4e-11" } ja { "1.3e-11" } { "0.30" } sisenditel)

# text
seg-ef4de80a0e79 = fim

# text
seg-6a5729ed13c5 = tests/fim_observability_reference.rs (omaväärtused vs numpy.linalg.eigh; CRLB kovariatsioon vs σ²(XᵀX)⁻¹ numpy.linalg.inv kaudu; GNSS GDOP/PDOP/HDOP/VDOP/TDOP infomaatriksist vs numpy — kõik sobitatud täpsusega { "1e-9" }); fim::tests (Jacobi omaväärtuslahendaja vs suletud kujul spektrid; CRLB vs Kay { "1993" } suletud kujud — DC-in-WGN σ²/N ja sirgsobitus σ²(XᵀX)⁻¹; Monte Carlo CRLB saavutamine; Moore–Penrose'i samasus MM⁺M=M; datumidefekti nullruum)

# text
seg-454f4440a5c8 = lunar_frame_realise::tests (taastab süstitud Helmerti teisenduse); tests/lunar_reference_frame_realisation_reference.rs ({ "14" } juhtu vs sõltumatu suletud kujul Umeyama-SVD lahendaja; halvim |Δ| nihe { "2.0e-5" } m, pööre { "5.3e-12" } rad, mastaap { "9.3e-2" } ppb, järelsobituse RMS { "6.1e-9" } m)

# text
seg-86ded53b2aac = lunar_service::tests (DOP kasutab kinnitatud tuuma taas; PL taandub lõunapooluse juhule); tests/lunar_navigation_service_volume_reference.rs (satelliidipõhine MCI asukoht täpsusega <{ "1e-3" } m + TÄPNE nähtavate satelliitide hulk üle kogu ruudustik×epohh pühkimise vs ANISE { "0.10.2" })

# text
seg-01d0c0630ded = lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame

# text
seg-38c8b9bffaf9 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim ({ "210" } AFS-Q esmast koodi alati; muutuja KSHANA_LANS_RUN ja LSIS-i vahemäluga kõik { "630" } koodi, null kiibi mittevastavust); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (LSIS-i vahemäluga: { "3" } kaadrit, null sümboli mittevastavust; { "24" } sissekirjutatud { "2" } ms akent, |rho| = { "0.999990" }); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (käivitub ainult andmete olemasolul: kogu { "23.9" } s jooks, |rho| = { "0.999990" }, halvim { "2" } ms plokk { "0.999948" }, faas { "8e-9" } rad)

# text
seg-67eae9b2de36 = lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis

# text
seg-e73c88408052 = tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (LSIS-i vahemäluga: { "3" } kaadrit, mida LANS-AFS-SIM edastab, ehitatud samast FID-ist, TOI-st ja andmebittidest: null { "18 000" } sümbolist erineb); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (LSIS joonis { "8" }: 0x045 -> 0x229f61dbb84a0; CRC-24/LTE-A kontrollväärtus 0xCDE703; töötab alati); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices ({ "100" } koodisõna, null rahuldamata kontrolli trükitud H-st); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (dekooder ainult H-st, müravaba ja { "3" } dB Es/N0 juures, ning { "10" } täiskaadrit); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests

# text
seg-7c4e5dff6562 = iq::scene (Scene, SatGeometry, TruthRecord)

# text
seg-ba9337fe40c0 = tests/iq_gpssdrsim_cross_generator.rs::scene_geometry_matches_gps_sdr_sim_channels ({ "11" } kanalit: halvim pseudovahemaa { "1.6e-3" } m vastu { "0.05" } m, koodifaas { "5.5e-6" } kiipi vastu { "2e-4" }, Doppler { "7.4e-5" } Hz vastu { "0.02" } Hz, vaatenurgad { "4e-9" } kraadi vastu { "1e-4" }, nähtav hulk identne); tests/iq_gpssdrsim_cross_generator.rs::harness_reproduces_the_gps_sdr_sim_program_channel_listing (sõltumatu etaloni testriist reprodutseerib programmi enda trükitud kanaliloendi täpselt)

# text
seg-80e62d2d7748 = lunar_service::tests (topotsentriline vs käsitsi arvutatud geomeetria: pea kohal, täpselt põhja/ida/lääne, antipodaalne ja degenereerunud polaarne idasuund; eksporditud nähtavuslipp nõustub sõltumatu nähtavusfiltriga kogu { "6" } h pühkimisel; eksport on vaikimisi väljas ja ei muuda tõendatavalt midagi muud; kaitsetasemed on täpselt lineaarsed esitatud sigma suhtes, samas kui aluseks olev geomeetria on puutumata); tests/lunar_service_geometry_oracle.rs::look_angles_match_anise_at_selenographic_sites ({ "768" } valimit { "8" } kohal, { "12" } epohhil ja { "8" } satelliidil vs ANISE { "0.10.2" }: asimuut ja kõrgus { "1e-6" } deg piires, kaugus ja koha asukoht { "1" } mm piires; halvim { "2.2e-12" } deg, { "2.1e-13" } deg, { "5.6e-9" } m)

# text
seg-5613845e8514 = attitude_dynamics::tests (apply/solve pöördteisendus, sfääriline vurr null moment, peateljestiku fikspunkt, lühijooksu energia+impulsi jäävus, q̇=½q⊗ω, sümmeetrilise vurri kiiruse märk + kehakoonuse pretsessioon); tests/attitude_dynamics_reference.rs ({ "200" } 000-sammulist momendivaba jooksu: |q|={ "1" } täpsusega { "1e-10" }, kineetiline energia T=½ωᵀIω jääv täpsusega { "1e-9" } suht, |Iω| ja inertsiaalne impulsivektor jäävad täpsusega 1e-9/1e-8 suht, nii kolmeteljelisel kui üldisel mittediagonaalsel inertsil; sümmeetrilise vurri lapik + piklik kehakoonuse pretsessioon reprodutseeritud täpsusega { "1e-6" } vs analüütiline λ=ω₃(I_a−I_t)/I_t); tests/attitude_dynamics_basilisk_oracle.rs::torque_free_motion_matches_basilisk (kaks üldist mittediagonaalset inertsi, { "1e4" } s momendivaba vs Basilisk { "2.9.1" } kosmoseaparaadi hub RKF78-ga: kvaternion { "1e-9" } piires, halvim { "3.3e-11" }; keha kiirused { "1e-9" } rad/s piires, halvim { "3.4e-12" })

# text
seg-c7acd78b6a27 = cw_dynamics (propagate, second_order_correction, propagate_second_order)

# text
seg-8edf60f6eb8c = cw_dynamics::tests (Φ({ "0" })=I, ristsuunaline lahtisidestatud SHM); tests/cw_dynamics_reference.rs (suletud kujul Φ vs sõltumatu fikseeritud sammuga RK4 integreerimine samadest Hilli ODE-dest täpsusega <{ "1e-6" } kolmandiku orbiidi jooksul; Φ(t)Φ(−t)=I täpsusega { "1e-9" }; piiratud tingimus ẏ₀=−2n·x₀ sulgeb täisoleku ühe perioodi järel täpsusega { "1e-9" } ilma sekulaarse piki-raja triivita { "10" } orbiidi jooksul; puhas radiaalnihe triivib analüütilise −12π·x₀ orbiidi kohta); tests/cw_dynamics_orekit_oracle.rs::cw_second_order_matches_nonlinear_orekit_within_1mm (neli juhtu { "100" } m juures kolmandiku { "500" } km orbiidi jooksul: halvim { "1.15e-7" } m vastu { "1e-3" } m); tests/cw_dynamics_orekit_oracle.rs::cw_disagreement_with_orekit_is_recorded_as_a_finding (ainult lineaarne Φ: { "1.2" } kuni { "6.3" } mm, kinnitatud)

# text
seg-9d7e00484999 = entry_eo_ascent::entry_heating (simulate_entry, inertial_to_relative, EntryHeatingScenario)

# text
seg-e9749b2960a2 = tests/entry_stardust_published.rs (tipp { "35.44" } g vastu avaldatud { "33.4" } g, +{ "6.1" } %, lävi { "10" } %; planeedi suhtes sisenemiskiirus { "12.551" } km/s vastu { "12.6" }, lävi { "0.1" } km/s); entry_eo_ascent::entry_heating::tests (pöörlevas raamis energia langeb täpselt takistustöö võrra; vaakumrannik säilitab Jacobi energia; mittepöörlev ballistiline juht vastab reentry mooduli tasapinnalisele punktmassile; Allen-Eggersi suletud kuju oma režiimis)

# text
seg-c23c0440cc75 = aocs (AocsConfig, required_torque, motor_torques, rates, rk4_step, simulate, mrp_from_quaternion); aocs_kind (AocsScenario)

# text
seg-4f446e123d4e = tests/aocs_basilisk_oracle.rs ({ "3" } juhtu, { "601" } valimit igaüks: MRP halvim { "2.4e-14" }, lävi { "1e-9" }; keha kiirus { "1.6e-15" } rad/s, lävi { "1e-9" }; hooratta kiirus { "2.9e-11" } rad/s, lävi { "1e-6" }; rakendatud mootorimoment { "1.2e-13" } N m, lävi { "1e-9" }; t = { "0" } momendid { "1e-12" } N m piires; küllastus saavutatud mõlemas vahendis); aocs::tests (nurkimpulss jääv, minimaalse normiga vastendus, MRP haru, koondumine küllastuse korral); aocs_kind::tests

# text
seg-ec141da2fe8e = wahba

# text
seg-7ece946b2cb0 = wahba::tests (A(ühikkvaternion)=I; Jacobi omaväärtuslahendaja rahuldab Kv=λv ja säilitab jälje teadaoleval sümmeetrilisel maatriksil; K on sümmeetriline); tests/wahba_reference.rs (TRIAD, Davenporti q-meetod ja QUEST reprodutseerivad scipy.spatial.transform.Rotation.align_vectors' optimaalse DCM-i müravabadel kaalutud vektorikomplektidel täpsusega <{ "1e-9" } rad raamist sõltumatu asendiveanurga kaudu; lisaks q-meetod taastab teadaoleva pöörde, kui λ_max=Σ kaalud ja Wahba kadu on null, q-meetodi lahend minimeerib Wahba kadu häirituse all, QUEST nõustub optimaalse q-meetodiga täpsusega <{ "1e-7" } rad ning optimaalne hindaja ületab kahe vektoriga TRIAD-i RMS asendiveas { "2000" } mürarikkal Monte Carlo katsel)

# text
seg-e35ff28ef879 = acquisition

# text
seg-e6a7ff99874a = acquisition::tests (Marcum-Q tsentraalne juht Q_1({ "0" },b)=exp(−b²/2); samasus P_d=Q_M(√(2Mρ),√γ); P_fa↔lävi edasi-tagasi üle M ja P_fa; ROC monotoonsus — P_d kasvab SNR-iga, väheneb läviga, P_d→P_fa kui SNR→{ "0" }; mittekoherentse integreerimise võit tõstab P_d fikseeritud P_fa juures; Marcum-Q monotoonne muutujates a ja b ning tõkestatud vahemikus [{ "0,1" }]); tests/acquisition_reference.rs (üldistatud Marcum Q_M(a,b), P_d, P_fa ja P_fa→lävi pöördarvutus sobitatud vs scipy.stats.ncx2/chi2 üle (M,a,b)/(M,P_fa)/(M,SNR) ruudustiku täpsusega ~{ "1e-6" })

# text
seg-4f480ce145f7 = lambda

# text
seg-7c55c072cfb7 = lambda::tests (L D Lᵀ rekonstrueerib Q); tests/lambda_reference.rs (Z-teisendus on unimodulaarne |det Z|={ "1" } ja Q_z=ZᵀQZ SPD, determinanti säilitav ja madalama kogu diagonaaliväliste korrelatsiooniga; Schnorr–Euchneri ILS vastab täielikule läbivaatusele { "300" } juhusliku kovariatsiooni puhul; täielik dekorreleerimine→otsing→tagasiteisendus on võrdne otsese ILS-iga ja Z⁻ᵀZᵀ edasi-tagasi säilitab täisarvud; suletud kujul alglaaditud edumäär vastab 200k-katselisele Monte Carlo-le järjestikusest tinglikust ümardamisest täpsusega <{ "0.01" }); tests/lambda_rtklib_oracle.rs::ils_solution_matches_rtklib_lambda_on_300_covariances (fikseeritud täisarvud on võrdsed RTKLIB v2.4.2-p13 lambda()-ga { "300" } juhusliku kovariatsiooni puhul, n { "2" } kuni { "10" }, { "226" } neist ei ole ümardamisega lahendatavad; kaks parimat ruutnormi nõustuvad täpsusega { "1e-9" } suhteliselt, mõõdetud { "5.6e-13" })

# text
seg-18befb9e9596 = bplane

# text
seg-5eb675d6585e = bplane::tests (möödalennu skalaarid rahuldavad suletud kujusid kahe nõustuva |B| samasusega ja |B|>r_p; pöördenurk väheneb periapsise raadiusega ja jõuab piirideni δ→{ "0" } / δ→π; kõrvalekalle säilitab v∞ kiiruse ja pöörab täpselt δ võrra; abistava Δv suurus võrdub { "2" }·v∞·sin(δ/2) ja on tõkestatud { "2" }·v∞-ga; B-tasandi teljed on ortonormaalsed ja ⊥ Ŝ kui |B|²=(B·T̂)²+(B·R̂)²; Tisserandi parameeter on invariantne v∞ säilitava kõrvalekalde korral, mis muudab a,e,i, ja võrdub { "3" }−(v∞/v_circ)²); tests/bplane_gmat_oracle.rs::bplane_matches_gmat_over_a_hyperbolic_grid; tests/bplane_heliocentric_oracle.rs::assist_delta_v_matches_gmat_asymptotes_and_c3; tests/bplane_heliocentric_oracle.rs::heliocentric_elements_and_tisserand_match_gmat_and_sbpy; tests/bplane_heliocentric_oracle.rs::tisserand_matches_kasuga_jewitt_2019_table_8_1

# text
seg-3111857b93df = crpa

# text
seg-d333f700ca8a = crpa::tests (kompleksarvude aritmeetika samasused sh z/z={ "1" }, |exp(jθ)|={ "1" }, zᴴz=|z|²; deterministlik nullide suunamine annab täpse ühikulise SV võimenduse ja <{ "1e-9" } segaja nullid 4-elemendilisel ULA-l { "3" } segajaga; N-elemendiline antennirühm tõrjub >N−{ "1" } segajat ja min-normiga nullib vähemaid; MVDR jääb SV suunas moonutuseta, samas kui segaja null süveneb monotoonselt segaja võimsusega kuni <{ "1e-3" } väärtuseni { "60" } dB juures); tests/crpa_reference.rs (MVDR ja minimaalse normiga nullide suunamise kaaluvektorid ning tulemuseks olevad antennirühma vastuse võimendused sobitatud vs sõltumatu numpy/scipy LAPACK arvutus täpsusega ~{ "1e-9" })

# text
seg-97d39969aa50 = powerlaw

# text
seg-213c2856bc78 = powerlaw::tests (iga puhas mürategund näitab oma ADEV log-log tõusu tunnust — valge FM −½, flicker FM { "0" }, juhukõnni FM +½, valge PM −{ "1" }; flicker-FM liige on lame põhi, mis on võrdne √({ "2" } ln2·h_{ "{" }-1{ "}" }) viie τ dekaadi ulatuses; FM-perekonna sobitus taastab teadaolevad h_{ "{" }-2{ "}" },h_{ "{" }-1{ "}" },h_0 sünteetilisest kõverast edasi-tagasi täpsusega <{ "1e-6" }; ja flicker-domineeritud kõvera põhi taastatakse siin, samas kui triivibaasi sobitus (quantum_trade::qparams_from_adev_curve) eksib pikal τ-l >{ "10" }% — dokumenteeritud lünga sulgemine); tests/powerlaw_oadev_reference.rs (σ_y(τ) sobitatud vs allantools { "2024.06" } Noise.adev suletud kujud üle τ-redeli kõigi viie mürategundi puhul, pluss allantools Kasdini generaator→oadev-hindaja kinnitus h_a tasemele)

# text
seg-0a7be53acff4 = oem (covariance_block_kvn, parse_covariance_block)

# text
seg-c3f4fe461c45 = oem::tests (sümmeetriline PD kovariatsioon käib KVN→parse edasi-tagasi f64 ümardusveani täpsusega ja jääb sümmeetriliseks; plokk väljastab täpselt { "21" } alumise kolmnurga elementi — i+{ "1" } maatriksi rea kohta — koos/ilma COV_REF_FRAME-ita; vale väärtuste arvuga plokk ja puuduv plokk lükatakse mõlemad tagasi); tests/ccsds_oem_covariance_reference.rs (sõltumatu oem { "0.4.5" } teek parsib kshana väljastatud OEM-i segmendi ja rekonstrueerib sümmeetrilise { "6" }×{ "6" }, sobitudes kshana sisendkovariatsiooniga f64 ümardusveani täpsusega; häiritud negatiivse kontrolliga ja kontrolliga, et oem lükkab tagasi sildistatud CX_X variandi)

# text
seg-5dd227be45fe = oem { "0.4.5" } (MIT, <a1>https://pypi.org/project/oem/</a1>) — SAMA sõltumatu CCSDS-502 parser, millele toetub kontrollitud rida „CCSDS OEM interoperability“, täiesti eraldi koodibaas (oma KVN-tokeniseerija, kovariatsioonisektsiooni olekumasin ja numpy maatriksi kokkupanek). kshana väljastab täieliku OEM-i segmendi, mis kannab selle sildistamata paljaste arvudega alumise kolmnurga COVARIANCE-plokki; oem parsib selle ja rekonstrueerib sümmeetrilise { "6" }×{ "6" }, sobitudes kshana sisendkovariatsiooniga element elemendi haaval f64 ümardusveani täpsusega — tõeline teegi-vs-teegi vahetuse edasi-tagasi (võrreldud oem-i rekonstruktsiooniga, mitte kshana uuesti parsimisega), mis sulgeb rea varasema lünga „kolmanda osapoole fikstuur puudub“

# text
# c1: ins-trn-coast
seg-8fd49e7a4cc3 = inertial::coast (ErrorDynamics, ErrorSource, source_error_m, CoastModel, Contribution, Combination, TrnFixMode, first_crossing_s, InsTrnCoastScenario); stsenaariumi <c1/>-id

# text
seg-ece63653ae22 = tests/ins_coast_schuler_navego_oracle.rs::coast_error_model_matches_the_corrected_navego_runs ({ "48" } punkti, kuus veaterminit väärtustel { "30" } s kuni { "3600" } s, Tactical klass, { "45" } deg N, tasapinnaline ja põhja suunatud: iga punkt { "5" } % piires, halvim +{ "3.70" } % kiiruse juhukõnd väärtusel { "1200" } s); inertial::coast::tests (the_error_model_follows_the_leading_order_law_on_a_short_coast; a_bias_error_is_schuler_bounded; doubling_the_coast_scales_each_contribution_by_two_to_its_own_power; every_contributions_closed_form_crossing_agrees_with_the_engines_bisection; the_located_crossing_puts_the_model_on_the_threshold_it_searched_for; the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward; the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner; the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model; a_full_reset_fix_makes_every_inter_fix_excursion_identical; the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold; an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero; every_published_field_carries_a_unit_and_a_provenance_class; the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible); tests/ins_coast_navego_montecarlo_oracle.rs::finding_laws_hold_to_600_s_and_overstate_beyond (1. vooru leid lameda Maa juhtseadusliku esimese järgu seaduste kohta, säilitatud regressioonina)

# text
seg-14054e77e0d4 = lunar_vlbi_fim::tests ({ "24" } teegi testi: analüütiline Jacobi maatriks vs lunar_vlbi::vlbi_delay_s tsentraalne lõplik diferents, võetud marsruudi kaudu, mis pöörab oleku enda koordinaate ettepoole ega puuduta kunagi osatuletist, nõustudes täpsusega < { "1e-6" } 1/c-st veeru kohta, kusjuures kaks infomaatriksit nõustuvad täpsusega < { "1e-6" } suurimast diagonaalist ja kovariatsioonid täpsusega < { "1e-5" } suhteliselt; ortogonaalne ühikgeomeetria, mille kovariatsioon on telje kohta suletud kujul c·σ_τ täpsusega { "1e-12" }, mis on ka ainus juht, kus ekvipartitsiooni seos on täpne; kovariatsiooni spekter ja iga jaama 3-D sigma invariantsed kogu võrgu jäiga pöörde korral täpsusega { "1e-9" }, kusjuures C_rot = R·C·Rᵀ on blokkide kaupa kinnitatud JA selgesõnaline väide, et telgede sigmad liikusid, nii et test ei saa tühjalt läbida; kovariatsiooni skaleerumine täpselt σ² ja 1/N järgi; AM-HM jälje tõket ei ületata kunagi; viivituse sulgumine τ_ik = τ_ij + τ_jk kinnitatud ühe ULP täpsusega viivitustel ja Jacobi ridadel, kusjuures liigne baasjoon lisab infot, kuid mitte järku; üks epohh teatatud astmepuudulikuna nullpealkirjaga; pikem kaar mõõdetud paremini tingimuslikuks sobitatud vaatluste arvu juures; majaka plokk näidatud selles ajakavas jälgimatuna; tähelepanuta jäetud diferentseeritud Shapiro osatuletis mõõdetud lõpliku diferentsiga käitusajal ja väljastatud, mitte kõrvale heidetud); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_vlbi_fim_matches_spice_geometry_and_numpy (vaikimisi ankurdatud võrk ja vaba võrk: SPICE-iga ehitatud Jacobi maatriks, 16-vaatluseline ajakava identne, jaamade sigmad { "2.2e-3" } piires, omaväärtused { "2.3e-3" }, konditsioon { "2.4e-3" }, pealkiri { "1.0e-3" }, vaatejoon { "0.018" } deg, deklinatsioon { "0.007" } deg, vastu lävesid { "1" } % ja { "0.1" } deg; vaba võrgu aste 8/9 nullpealkirjaga, nullruum { "0.006" } deg kaugusel; NumPy sissekirjutatud Jacobi maatriksil täpsusega { "2e-13" })

# text
seg-484388449426 = lunar_vlbi_fim (epoch_geometry_with, schedule, schedule_jacobian); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-d44b405dbeba = tests/lunar_vlbi_surface_point_spice_oracle.rs::surface_point_covariance_kernel_path_matches_spice_geometry_and_numpy ({ "16" } vaatlust identset; aste 3/3; omaväärtused { "5.9e-5" } piires; konditsioon { "5.9e-5" }; majaka sigmad { "1.7e-3" } piires vastu { "1e-2" }; RMS { "2.9e-5" }; hoovars { "1.4e-8" }; P2 sigmad { "3.9e-14" } vastu { "1e-9" }); lunar_vlbi_fim::tests

# text
seg-30cc52d98bbd = lunar_service (lunar_protection_level, lunar_protection_level_with_sigma), lunar (lunar_araim_with_sigma), raim (araim_raim)

# text
seg-9d5628188bd8 = tests/lunar_protection_level_reference.rs ({ "7" } teenindusmahu juhtu — lõunapolaarne, keskmine laiuskraad, ekvatoriaalne, tõstetud mägismaa — { "6" } kuni { "19" } satelliiti, σ_URE 10/30/60 m, P_HMI { "1e-3" } kuni { "1e-7" }, kaitsetasemed ulatuses { "1.7e2" } kuni { "6.9e3" } m: HPL/VPL vastu koostatud RTKLIB + SciPy sõltumatu etalon, halvim |Δ| { "1.061e-8" } m ja { "1.044e-8" } m vastu tolerantsi { "1e-6" } m; DOP vastu RTKLIB-i enda (GᵀG)⁻¹ täpsusega { "1.790e-14" } suhteliselt; K_fa vastu scipy.stats.norm.isf täpsusega { "2.716e-11" } suhteliselt; kolm negatiivset kontrolli — { "5" } km satelliidinihe, { "1e-6" } suhteline σ_URE muutus ja { "0.1" } % rangem P_HMI — kumbki mõõdetud nihutama kaitsetaset vähemalt { "171" }× tolerantsi võrra; ja aegunud fikstuuri kaitse, mis kinnitab sissekirjutatud geomeetria bitthaaval selliseks, nagu mootori enda konstellatsiooni- ja nähtavuskood toodab, nii et roheline tulemus ei saa püsida, kui konstellatsioon selle all muutub)

# text
seg-842722fa9e91 = araim_reference (araim_reference_protection_levels, published_vectors), raim (araim_protection_level, araim_integrity_risk, normal_quantile)

# text
seg-68b534869ac3 = tests/araim_reference_vectors.rs ({ "2" } avaldatud vektorit + { "6" } negatiivset kontrolli, fikstuur tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt: nominaalse nihke mahajätmine möödub avaldatud VPL-ist { "2.6457" } m, { "10" } % ISM-viga { "0.2798" } m, K_fa { "57" } režiimil { "12" } asemel { "0.4015" } m, +{ "2" } %/+{ "5" } % terviklikkuse dispersioonivea 0.0750/0.1971 m võrra — ja +{ "1" } % viga liigutab seda ainult { "0.0339" } m, mis on esitatud kontrolli eraldusvõime piirina, mitte peidetud; kahe dokumendi vastused eksivad kumbki teise omast rohkem kui tolerants, seega vektorid ei ole omavahel asendatavad; sissekirjutatud fikstuur ja kompileeritud konstandid on kaks sõltumatut ülekirjutust, mille kokkulangevus on nõutud, nii et avaldatud arvu ei saa ühelt poolt muuta, et kontroll läbiks; ja C_int − C_acc = σ²_URA − σ²_URE = { "0.3125" } m² kehtib kõigi { "40" } ülekirjutatud dispersiooni kohta, aritmeetiline samasus, mille ülekirjutusviga rikuks)

# text
seg-7e8963a7c86f = lunar_llr, realdata::llr_crd (composing fim, cio, frames, ephem, lunar_frame, lunar_frame_campaign)

# text
seg-617e168e2460 = tests/lunar_llr_real_data.rs ({ "11" } testi: kõik { "15" } sissekirjutatud CRD faili baidi kaupa identsed oma salvestatud räsidega; kõik { "349" } kirjet arvestatud, { "337" } kasutatud ja { "12" } vahele jäetud nimetatud põhjusel; iga arhiveeritud kaugus tegeliku perigee/apogee ümbriku sees; kaalud näidatud ON bin_rms/√n_raw; vaatejoone koordinaat kõige paremini määratud iga antennirühma jaoks libratsioonipühkimisega, mis selle ostab, mõõdetud eraldi; jääk ja selle sõltumatu kinnitus JPL Horizonsi vastu; 0.1-kraadise geomeetria kallutuse tundlikkus; simuleeritud kampaania võrdlus näidatud võrdsena selle stsenaariumi sõltumatu jooksuga; R1 bitthaaval kinnitus kolmele olemasolevale Kuu raamipaketile); lunar_llr::tests ({ "12" }: kauguse osatuletis vs modelleeritud lennuaja tsentraalne lõplik diferents täpsusega < { "1e-6" } suhteliselt; valguse aeg koondunud Kuu edasi-tagasi tee; datumi sigma täpselt lineaarne kaalu skaalas täpsusega { "1e-9" }; blokkdiagonaalsus täpne; puuduv andmekataloog keeldutud, mitte asendatud; muudetud kataloogirida tabati selle enda raadiuse veeru järgi); realdata::llr_crd::tests ({ "7" }: välja semantika, kesköö üleminek, mitte-UTC ajaskaala ja toetamata formaadiversiooni keelamine ning tühja klassi jaoks asendatud sigma puudumine); tests/validate_llr_datum_spice_oracle.rs (llr_datum_finding_tz_sigma_one_percent_gap, kinnitatud; reported_residual_is_the_engine_to_spice_light_time_gap); tests/validate_llr_datum_analytic_fresh_2025.rs::llr_datum_analytic_moon_matches_spice_and_numpy_on_fresh_2025_normal_points ({ "151" } nägemata 2025-Q2 normaalpunkti; sigmad ja normid halvim { "1.11e-3" } väärtusest { "1e-2" }, konditsioon { "8.95e-4" } väärtusest { "2e-2" }, suhted { "1.79e-3" } väärtusest { "2e-2" }, raamatupidamine, astmed ja sidestus täpsed)

# text
seg-9e17b852f721 = lunar_llr (llr_geometry_with, LunarLlrDatumScenario); ephem_provider (KernelEphemeris); naif_kernel

# text
seg-ed8e396d7fb6 = tests/validate_llr_datum_kernel_moon_fresh.rs::llr_datum_kernel_moon_matches_spice_and_numpy_on_fresh_normal_points ({ "447" } nägemata 2019-Q2 normaalpunkti; sigmad ja normid { "4.0e-5" } piires väärtusest { "1e-2" }, konditsioon { "1.6e-5" } väärtusest { "2e-2" }, suhted { "7.6e-5" } väärtusest { "2e-2" }, raamatupidamine ja astmed täpsed); tests/validate_llr_datum_kernel_moon.rs ({ "2015" } nähtud andmete diagnostika, { "0.049" } % tz-l; mitte tõend selle rea jaoks); lunar_llr::tests

# text
seg-0bd1d423f40a = ephem (moon_position), lunar_llr, realdata::llr_crd

# text
seg-e73eed7ff8b5 = tests/lunar_llr_real_data.rs::the_analytic_moon_series_disagrees_with_jpl_by_the_same_amount ({ "12" } iganädalast geotsentrilist olekut, halvima epohhi nurk nõutud < { "0.3" }° ja RMS < { "5e5" } m vastu mooduli enda dokumenteeritud väidet, pluss LLR jääk nõutud nõustuma radiaalse lahknevusega täpsusega < { "5" }×); ::the_measured_residual_is_the_ephemeris_error ({ "337" } tegelikku normaalpunkti)

# text
seg-e6eeb246d545 = integrity::tpl_scalar::tests (aste 1, liitmine/välistamine, nihkedominants, IR-i ristkontroll); tests/tpl_scalar_numpy_oracle.rs::scalar_mhss_pl_matches_numpy ({ "300" } sissekirjutatud juhtu: numpy lstsq alamhulga hindajad, üldine eralduskovariatsioon, scipy brentq PL; PL { "1e-9" } suhtelise piires, halvim { "1.2e-10" }; juhtiv alamhulk täpne)

# text
seg-2737758e6542 = integrity::gls_commonmode::tests + tests/gls_reference.rs + tests/gls_whitening_numpy_oracle.rs::whitening_and_mahalanobis_match_numpy_lapack ({ "201" } sissekirjutatud SPD juhtu: tegur, valgendatud jääk, valgendusoperaator ja Mahalanobise ruut vs numpy LAPACK { "1e-12" } suhtelise piires, halvim { "7.9e-16" })

# text
seg-d36e19a6e2a9 = integrity::gls_commonmode::tests (separation_alone_is_blind_to_common_mode, degenerate_direction_or_non_pd_gives_no_finite_ceiling, every_nonzero_direction_under_pd_omega_has_a_finite_ceiling); tests/gls_outside_omega_bound_numpy_oracle.rs::undetectable_common_mode_ceiling_matches_numpy_lapack ({ "256" } sissekirjutatud juhtu: alpha_ss, alpha_cm ja miinimum { "1e-12" } suhtelise piires { "210" } hästi tingimusliku ja piirjuhu puhul, halvim { "3.3e-15" }; { "40" } halvasti tingimuslikku kuni konditsioonini { "1.3e8" } öeldud konditsiooniga skaleeritud piiri sees, halvim { "1.1e-9" }; kuus täpset lõpmatust)

# text
seg-fa85ee9b1daa = tests/lunar_datum_identifiability_reference.rs::decompose_matches_scipy_reference ({ "16" } sünteetilist 7x7 SPD maatriksit, mis ulatuvad hästi tingimuslikust kuni { "{" }{ "0,3" }{ "}" }-lähedaselt degenereerunuteni; Schuri lambda_min / lähtepunkti CRLB / |korr| vs SciPy/NumPy täpsusega <{ "1e-9" } suht)

# text
seg-4fcff50bca2e = lunar_orientation::tests (de440_moon_pa_reproduces_fixture_rows, de440_moon_pa_shows_real_libration); tests/lunar_pa_frame_realisation_guard.rs::the_orientation_series_interpolation_error_is_tens_of_metres_not_sub_metre; tests/lunar_pa_orientation_spice_oracle.rs::interpolated_rotation_matches_direct_kernel_evaluation_off_node ({ "2 000" } juhuslikku sõlmedevahelist epohhi vs SPICE pxform binaarsel PCK-l: pöördenurk { "1.7e-5" } rad piires, halvim { "1.7e-6" } rad, { "3" } m keskmisel raadiusel)

# text
seg-3e86011ef650 = lunar_llr_geometry (reflectors, stations_itrf, ItrfStation, StationCoordinates, llr_bcrs_one_way_m, body_to_bcrs_tdb, shapiro_leg_m, BcrsEvent); lunar_orientation (try_de440_moon_pa_body_to_inertial); lunar_vlbi (station_inertial_position_itrs)

# text
seg-ef1e57e7bf3d = tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_bcrs_iers2010_relativistic ({ "192" } ILRS-i normaalpunkti: RMS { "2.81" } m; ainult kaks ITRF2020 jaama { "2.96" } m; mõlemad kuni { "10" } m); tests/lunar_llr_geometry_range_oracle.rs::round2_finding_is_a_common_offset_of_about_eleven_metres (asendatud geotsentriline valguseaja mudel, { "10.94" } m, kinnitatud)

# text
seg-32da421d27ef = tests/lunar_coupled_gauge_reference.rs::coupled_gauge_matches_numpy_on_real_de440_rows ({ "9" } omaväärtust, defect/dim_spatial/dim_temporal/coupled_dim/p_st_norm ja { "{" }scale,offset{ "}" } Schuri marginaal võrkudel well_posed 120-realine ja single_epoch 30-realine, täpsusega rel<{ "1e-3" } ja abs<{ "1e-3" }); lunar_gauge::tests (coupled_marginal_fisher_is_symmetric_and_psd, oneway_spatial_equals_orbiter_range_row_datum7, twoway_spatial_equals_oneway_spatial_at_same_geometry)

# text
seg-9f0fd0918105 = lunar_gauge, lunar_time

# text
seg-abab0c3bfa30 = tests/lunar_rate_frame_coupling_preregistered.rs (entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields: L_m { "2.8e-6" } piires Ashby ja Patla { "2024" } väärtusest J2-ga AIUB-GRL350A/B-st; entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields: radiaalne kirje { "8.3e-5" } piires pyshtools astme-350 ekvatoriaalsest gravitatsioonist; entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed: kiiruse kirje { "2.5e-3" } piires DE441 Kuu kiirusest { "2000" } epohhil); lunar_gauge::tests; regressioon tests/lunar_rate_frame_coupling_oracle.rs

# text
seg-57b6f02016e4 = lunar_gauge::tests (classify_is_invariant_under_null_basis_rotation - teljega joondatud nullbaas ja selle { "0.6" } rad pööre annavad identsed defect, dim_spatial, dim_temporal, coupled_dim ja p_st_norm; classify_direct_sum_null ja classify_coupled_null - konstrueeritud otsesumma ja tõeliselt seotud juhud kinnitavad mõõtmete lahutust; classify_basis_invariant; index_consts_are_correct); tests/lunar_gauge_classification_scipy_oracle.rs::classify_null_space_matches_scipy_subspace_intersection ({ "72" } konstrueeritud 9x9 Fisheri maatriksit üle { "18" } nullalamruumi, igaüks neljas juhuslikus ortonormaalses uuesti baseerimises: defect, dim_spatial, dim_temporal ja coupled_dim täpsed; p_st_norm { "6.0e-15" } piires, lävi { "1e-9" })

# text
seg-e9319e19b9f3 = tests/lunar_interop_budget_reference.rs (raw / rotation-residual / theta_moon / theta_frametie / theta_excess / reducible / irreducible { "3" } pakkujapaari kohta vs sõltumatu SciPy SVD lstsq sobitus failis tests/fixtures/inter_ephemeris/reference.json, rel<{ "1e-3" } abs<{ "1e-3" } m; fikstuurid + sõltumatu etalon baidi kaupa kooskõlas skriptiga scripts/gen_interop_ref.py avalikel DE440/INPOP21a/EPM2021 kerneleil IMCCE calcephi kaudu)

# text
seg-89624a7374e9 = tests/lunar_faultobs_reference.rs (faultobs_matches_numpy_scipy_on_real_de440_rows: { "84" }×{ "84" } P⊥ elementhaaval, trace(P⊥) = parity_dim = { "52" } ja rank(G) = { "32" }, tuvastatavuse normid + lipud, MDB ruutvorm cᵀWP⊥c + MDB väärtus ning plokk-sädeme tuvastus-/identifitseerimisarvud iga partneriliidu kohta, reprodutseeritud sõltumatu numpy/scipy sõltumatu etaloni vastu täpsusega rel<{ "1e-3" } abs<{ "1e-3" } täisarvuliste arvudega täpsed; sisendid baidi kaupa kooskõlas failidega examples/gen_faultobs_rows.rs + scripts/gen_faultobs_ref.py)

# text
seg-cbdf069c7baa = telecom_timing (mtie_sliding, mtie_curve_ns, tdev_curve_ns); allan (mtie, time_deviation)

# text
seg-d4dfc8374544 = tests/telecom_timing_reference.rs ({ "17" } MTIE ja { "12" } TDEV keskmistamistegurit sissekirjutatud { "2" } 048-valimilisel kiibimõõtmelise aatomkella holdover-i reas vananemise, flicker-müra ja temperatuuriga, vs allantools { "2024.06" } täpsusega <{ "1e-12" } / <{ "1e-9" } suhteliselt, täheldatud täpne / { "1.1e-15" }; samad kõverad loetud täielikust telekommunikatsiooni ajastuse jooksust, mis sisse loeb CSV); telecom_timing::tests (libisev MTIE võrdne allan::mtie-ga igal aknal; käsitsi tuletatud MTIE ja TDEV; monotoonne MTIE)

# text
seg-776723e1171a = allan (edf_greenhall, greenhall_edf_core); assurance::uncertainty (edf)

# text
seg-d98eb984ce90 = tests/greenhall_edf_allantools.rs (bars_1_to_3_against_allantools; bar_4_wrappers_equal_the_core); tests/greenhall_edf_no_moved_output.rs (uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline); tests/uncertainty_edf_reference.rs

# text
seg-51a5b33f0b62 = slot_timing (ClockNoise::from_phase_record, fit_weighted, slot_budget, breach_after_sync_s)

# text
seg-02d2f67a9284 = tests/slot_timing_cs5071a_holdout.rs (holdover_inversion_predicts_the_held_out_caesium_record: sobitus rea esimesele kolmandikule, ennusta ühe sigma ületamine väärtustel { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } ja { "2.5" } ns, mõõda seda ülejäänud kahel kolmandikul sünkroonimispunktist iga { "997" } s järel; lävi, fikseeritud enne esimest jooksu, tegur { "1.5" } mõlemas suunas; täheldatud suhted { "0.84" } kuni { "1.03" }; kontroll, ühesekundiline Alani hälve loetuna valge FM-ina, eksib umbes teguriga { "1 000" } ja peab läve ebaõnnestuma; mutatsioon, mis poolitab valge FM taseme, ebaõnnestub testis); slot_timing::tests (a_measured_white_fm_record_recovers_its_level; reduces_to_the_holdover_inversion; ieee1139_conversion_matches_the_powerlaw_module)

# text
seg-83c8f23a4b53 = navsignal (Modulation::psd, spectral_separation_coeff_offset, q_from_ssc); spectrum (psd_nulls_hz, psd_peak_hz, main_lobe_null_to_null_hz, Jammer::ssc)

# text
seg-436f7a545a7b = spectrum::tests (bpsk_main_lobe_null_to_null_is_two_n_times_1_023_mhz — BPSK({ "1" }) { "2.046" } MHz ja BPSK({ "10" }) { "20.46" } MHz leitud arvuliselt suletud kujult; boc11_lobes_are_centred_at_plus_minus_1_023_mhz — kandja null, esimene null { "2.046" } MHz juures, hõlmiku keskpunkt { "1.023" } MHz ja täpne maksimum { "0.7590" } MHz juures vastu sõltumatu Newtoni lahendi tan y = 2y; ssc_matches_parseval_closed_forms — C/A x C/A 2/(3R_c) = -61.86 dB/Hz, BOC({ "1,1" }) x BOC({ "1,1" }) 1/(3R_c) = -64.87 dB/Hz, C/A x BOC({ "1,1" }) 1/(6R_c) = -67.88 dB/Hz, igaüks { "0.02" } dB piires; q_values_match_kaplan_hegarty — CW kandjal Q = { "1" }, sobitatud spektriga müra Q = { "1.5" }, lame nullist nullini müra Q = { "2.215" }; mboc_is_a_unit_area_one_eleventh_mix)

# text
seg-500eea1d6b4a = sigmf (read, write, encode, decode, parse_meta, meta_to_json); spectrum (welch_psd, fft_in_place, synthesise_iq)

# text
seg-19aa57a32add = sigmf::tests (cf32_round_trip_is_exact_to_single_precision; ci16_round_trip_is_within_half_a_code; ci16_is_little_endian_i_then_q; integer_encoding_counts_saturation; metadata_uses_the_core_namespace; unsupported_types_and_channels_are_refused; sample_start_offsets_into_the_data); spectrum::tests (fft_matches_a_direct_dft; welch_reads_white_noise_as_variance_over_fs_and_keeps_a_tone_s_power — põhi { "2" } % piires dispersioonist üle diskreetimissageduse, Parsevali kogu { "2" } % piires, Hanni ekvivalentne müraribalaius { "1.5" } klassi; noise_like_synthesis_is_unbiased_through_welch — mediaan Welch miinus mudel { "0.1" } dB piires ci16_le edasi-tagasi kaudu; synthesised_iq_through_sigmf_reproduces_the_model_spectrum); tests/sigmf_welch_oracle.rs::welch_and_sigmf_io_match_scipy_and_sigmf_python (Welchi PSD vs scipy { "1.18.1" } signal.welch klassi kaupa täpsusega { "1e-12" } suhteliselt { "27" } juhul, täheldatud { "6.0e-14" }; viis sigmf-python { "1.13.0" } salvestust dekodeeritud bitthaaval identselt identsete metaandmetega; crate'i kirjutatud salvestised loetud tagasi bitthaaval identselt sigmf-pythoni poolt ja skeemikehtivad SigMF { "v1.2.6" } vastu)

# text
seg-390697edfd7d = ephem (standish_state, standish_elements, standish_nominal_error, ecliptic_to_icrf); ephem_provider (AnalyticSolarSystem); solar_system (SolarSystemScenario)

# text
seg-0e2a03d21df4 = tests/solar_system_standish_preregistered.rs::standish_rms_errors_are_within_explanatory_supplement_table_8_10_1 (barütsentrid 1800-2050 tabelist { "1" } ja { "3000" } BC-3000 AD tabelist { "2" }, { "8908" } ja { "21857" } epohhi, halvim RMS { "0.778" } tabeli { "8.10.1" } väärtusest); tests/solar_system_standish_earth_icrf_preregistered.rs (earth_from_the_split_barycentre_is_within_the_emb_table_8_10_1_rms: Maa AnalyticSolarSystem ja icrf_to_ecliptic kaudu, RMS { "0.483" } EMB väärtusest; icrf_positions_are_within_the_table_8_10_1_rms: tabeli { "1" } kehade ja Maa ICRF asukohad, halvim { "0.778" }; earth_minus_barycentre_offset_matches_de441_1950_to_2050: Kuu rea lahutus, halvim { "0.088" } deg ja { "6.1" } km); ephem::tests (standish_periods_obey_keplers_third_law; a_planet_track_is_one_closed_ellipse). Mittepiirav regressioon: tests/solar_system_horizons_reference.rs

# text
seg-af9dc8bcbd0a = ephem_provider (KernelEphemeris::relative_position_utc, utc_to_tdb_jd2); naif_kernel; timescales

# text
seg-02aaea0ff091 = tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_at_utc_epochs ({ "600" } asukohta { "200" } UTC epohhil 1973-2026, tõmmatud eelregistreerimise räsist; halvim { "0.66" } lävest, { "2.96" } m); tests/kernel_ephemeris_skyfield_oracle.rs::kernel_ephemeris_matches_skyfield_on_the_full_kernel_when_present (käivitub ainult andmete olemasolul); tests/kernel_ephemeris_skyfield_oracle.rs::barycentre_only_bodies_are_refused_not_substituted; ephem_provider::tests

# text
seg-19387ac03ee7 = radiometric (light_time_solution, two_way_range, shapiro_delay); solar_system (link, link_on); ephem_provider (AnalyticSolarSystem)

# text
seg-12ea8306ca6a = tests/solar_system_light_time_solver_preregistered.rs::light_time_solver_on_de441_positions_matches_horizons_lt_within_1e_6_s (Merkuuri, Veenuse, Marsi, Jupiteri ja Saturni barütsentrid, Päike ja Kuu Maa keskpunkti suhtes, { "1576" } epohhi igaühe kohta interpoleeritud DE441 asukohtadel, halvim { "6.7e-9" } s vastu { "1e-6" } s); mittepiirav täpsusväide analüütilise tee kohta: tests/solar_system_light_time_preregistered.rs (RMS c dLT { "0.17" } kuni { "0.30" } tabeli { "8.10.1" } asukohalävest); solar_system::tests

# text
seg-2e83f70b6649 = body (Body::iau_rotation_et, Body::iau_angles_et, Body)

# text
seg-803d90c9eacb = tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_for_the_fourteen_added_bodies ({ "41" } epohhi { "1955" } kuni { "2044" }, { "574" } maatriksit { "1e-9" } rad piires, halvim Phobos { "1.43e-10" } rad); tests/body_orientation_spice_oracle.rs::orientation_matches_spice_pxform_at_fresh_epochs ({ "41" } epohhi { "1961" } kuni { "2038" }, mida pole kunagi varem võrreldud, { "574" } maatriksit { "1e-9" } rad piires, halvim Phobos { "1.38e-10" } rad); tests/body_constants_naif_oracle.rs::constants_match_naif_pck00011_and_gm_de440 ({ "0" } { "84" }-st neljateistkümne keha konstandist erineb NAIF-ist)

# text
seg-cf5cfbb6b468 = constellation (WalkerSpec::elements, gps_slots, galileo_walker, glonass_slots, GPS_BASELINE_SLOTS, GPS_EXPANDABLE_SLOTS)

# text
seg-92ee79866544 = constellation::tests::walker_24_3_1_reproduces_galileo_os_sdd_table_23 (kõik { "24" } RAAN-i ja keskanomaalia rida täpsusega { "1e-9" } deg); constellation::tests::glonass_icd_slot_formula_is_a_walker_24_3_1 (ICD pesa valem ja Walker 24/3/1 on samad { "24" } sõlme ja laiusargumendi paari); constellation::tests::gps_presets_reproduce_the_published_equatorial_crossings (kõigi { "36" } GPS-i asukoha maajälje ekvaatori ületus RAAN-ist, laiusargumendist ja { "100.765" } deg tundenurgast: { "35" } { "0.0108" } deg piires vastu { "0.015" } deg ümardamislävi ja E3F { "0.06" } deg piires, sest tabeli enda E3F rida ei ühti selle RAAN-i ja laiusargumendiga umbes { "0.06" } deg võrra; sekulaarne sõlme regressioon { "5" } % piires tabeli -0.0402 deg/päevas); constellation::tests::walker_geometry_identities_are_exact (kolm vahekauguse samasust delta- ja täht-mustritele kuni { "1 584" } satelliidini, täpsusega { "1e-9" } deg)

# text
seg-0aaf33611680 = constellation (coverage, dop_at, NormalAccum)

# text
seg-7bc2428f22d9 = constellation::tests::gps_baseline_global_dop_matches_the_sps_performance_standard (HDOP mediaan { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" }, keskmine { "0.965" } vastu { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } ja { "0.96" }, lävi { "0.03" } igaühe kohta fikseeritud enne esimest jooksu; PDOP mediaan { "1.795" } tabeli B.3-1 väärtusel { "1.815" } või sellest allpool halvenenud 20-24 satelliidi segu puhul; kättesaadavus { "100" } % globaalselt ja halvimas kohas vastu tabeli 3.8-1 väärtusi { "98" } % ja { "88" } %); constellation::tests::single_epoch_dop_matches_the_hand_computation (seniit pluss kolm satelliiti { "30" } deg kõrgusel: HDOP 4/3, VDOP { "2.3094" }, PDOP 8/3, TDOP { "1.5275" }, GDOP { "3.0732" } täpsusega { "1e-9" } ja võrdne orbit::dop-iga ühise kellaga)

# text
seg-54bf21cf90d7 = navsignal (sine_integral, bpsk_power_in_band_closed_form, bpsk_gabor_bandwidth_closed_form_hz, dll_jitter_bandlimited_s, dll_jitter_small_spacing_limit_s, bpsk_offset_ssc_closed_form, altboc_15_10_psd, parse_modulation)

# text
seg-d2b3b13002dd = navsignal::band_limited_tests (sine_integral_matches_tables_and_its_limit — Si({ "1" }), Si(pi), Si({ "2" } pi) täpsusega { "1e-12" }; bpsk_power_in_band_closed_form_matches_textbook_and_numeric — { "0.9028" } võimsusest peasagaras BPSK(1/3), BPSK({ "1" }), BPSK({ "5" }), BPSK({ "10" }) puhul ja suletud kuju võrdne kvadratuuriga täpsusega { "1e-7" } vahemikes { "10" }, { "15" }, { "20" } ja { "51.15" } MHz; bpsk_gabor_closed_form_matches_numeric_and_asymptote — täpsusega { "1e-4" } ja sqrt(B R_c / ({ "2" } pi^{ "2" })) asümptoot; bandlimited_dll_reduces_to_the_textbook_forms — koherentne varajane-hiline BPSK({ "1" }) { "45" } dB-Hz juures, B_L { "1" } Hz, d { "1" } kiipi, T { "20" } ms: { "0.0039564" } kiipi ({ "1.159" } m) { "1" } % piires, mittekoherentne vorm võrdne navsignal::dll_code_jitter_chips-iga { "1" } % piires, kaduva vahekauguse piir võrdne oma suletud kujuga täpsusega { "1e-5" }; offset_bpsk_ssc_matches_parseval_closed_form — nihked { "0" } kuni { "3.2" } R_c { "0.01" } dB piires ja -71.86 dB/Hz nullnihkel BPSK({ "10" }) puhul; altboc_psd_is_unit_area_with_lobes_at_e5a_and_e5b; modulation_labels_round_trip)

# text
seg-56f381a3f611 = leo_signal (max_doppler_hz)

# text
seg-da02936f6d75 = leo_signal::tests::max_doppler_matches_published_xona_and_iridium_figures — Xona Pulsar X1 ({ "1593.3225" } MHz, { "1080" } km) { "33.2" } kHz avaldatud { "32" } kuni { "34" } kHz sees; Iridium ({ "1621" } MHz, { "780" } km) { "0.5" } kHz piires avaldatud { "36" } kHz-st

# text
seg-f1cdf8728c6b = Avaldatud arvud: Xona Pulsar X1 maksimaalne Doppler { "32" } kuni { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Iridiumi Doppler kuni +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Maa pöörlemine on välja jäetud, mis nihutab arvu kuni umbes { "2.3" } kHz võrra; mõlemad avaldatud arvud on selleta täidetud.

# text
seg-70fb5eb759aa = leo_link::itu (p838_coefficients, p838_k_alpha, rain_specific_attenuation_db_km)

# text
seg-6ef512cefe4d = tests/leo_link_reference.rs (p838_coefficients_reproduce_table5_to_its_printed_digits: tabeli { "5" } kõik { "115" } rida, { "1" } GHz kuni { "1000" } GHz, iga koefitsient { "0.6" } piires oma viimasest trükitud numbrist; halvim täheldatud { "0.51" })

# text
seg-53d288ecc889 = leo_link::itu (p618_rain_attenuation_db, RainPath)

# text
seg-e1ab19315242 = tests/leo_link_reference.rs (p618_rain_attenuation_matches_the_itu_validation_examples: { "56" } juhtu viies kohas, { "14.25" } ja { "29" } GHz, { "0.001" } % kuni { "1" } %, { "1e-4" } dB piires; täheldatud { "5e-6" } dB)

# text
seg-cfe59399d0a3 = leo_link::itu (p618_scintillation_db, wet_refractivity, ScintillationPath)

# text
seg-8a35d6b6f974 = tests/leo_link_reference.rs (p618_scintillation_matches_the_itu_validation_examples: { "42" } juhtu seitsmes kohas, { "14.25" } ja { "20" } GHz, { "1e-5" } dB piires; täheldatud { "5e-7" } dB)

# text
seg-f7d2ab81d7d2 = leo_link::itu (p2109_building_entry_loss_db, BuildingClass); detection (normal_inv_cdf)

# text
seg-05bb3df0fcc5 = tests/leo_link_reference.rs (p2109_building_entry_loss_matches_the_itu_workbook: { "568" } väärtust, { "28" } GHz kaldel { "0" } deg ja { "2" } GHz kaldel { "45" } deg, mõlemad klassid, P vahemikus { "1e-7" } kuni { "0.998" }, { "0.001" } dB piires)

# text
seg-5b682a1911e5 = leo_link::iono (group_delay_m, iono_free_coefficients, iono_free_noise_amplification); leo_link (fspl_db); linkbudget (free_space_loss_db)

# text
seg-09369862fb72 = tests/leo_link_reference.rs (first_order_iono_reproduces_the_is_gps_200_group_delay_ratio: gamma = (77/60)^{ "2" } täpsusega { "1e-12" }, L1/L2 ja L1/L5 võimendus { "2.978" } ja { "2.588" }; free_space_loss_is_the_friis_kilometre_megahertz_form: { "32.4478" } + { "20" } log d + { "20" } log f täpsusega { "1e-4" } dB); leo_link::iono::tests (delay_scales_as_one_over_f_squared; iono_free_combination_removes_the_first_order_delay)

# text
seg-ba1455ed0740 = leo_link::geometry (max_static_user_range_rate, DopplerEnvelope, doppler_hz)

# text
seg-88f10ca1e3bc = tests/leo_link_reference.rs (doppler_envelope_reproduces_the_pulsar_paper_table_1: Pulsar IOV { "520" } km { "97" } deg, Pulsar FOC polaarne { "1080" } km { "97" } deg, Pulsar FOC kaldus { "1080" } km { "53" } deg ja GPS { "20180" } km { "55" } deg; orbitaalkiirus, maksimaalne ECEF-kiirus, maksimaalne suhteline kiirus ning maksimaalne L1- ja L5-riba kandja Doppler, { "20" } väärtust, igaüks { "0.05" } % piires)

# text
seg-45309f1545cc = leo_navmsg::sisre (sisre_weights, StatsAcc)

# text
seg-64d379a46dbc = leo_navmsg::sisre::tests (weights_reproduce_the_published_meo_and_geo_table — GPS { "0.979" } ja 1/48.9, GLONASS 1/45.0, Galileo { "0.984" } ja 1/61.1, BeiDou MEO 1/54.2, geostatsionaarne { "0.992" } ja 1/126.2 { "0" } deg maskil, igaüks { "0.005" } piires w_R-st ja { "0.5" } piires 1/w_AC^{ "2" }-st; leo_weights_shift_toward_the_transverse_axes — horisondi nadiirinurk { "67.8" } deg kõrgusel { "510" } km)

# text
seg-d579e3a4f58f = leo_navmsg::elements (kepler_point, kepler_frame, ephemeris_at, sat_state)

# text
seg-7bb3e4112c28 = tests/leo_navmsg_reference.rs (the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre — neli tegelikku Galileo edastatud efemeriidi E10, E19, E24, E25 hetkedel tk = { "0" }, +/-600, +/-1800, +/-3600 s, iga telg { "1" } mm piires RTKLIB-ist; real_galileo_records_survive_the_binary_frame_and_the_text_block — { "5" } mm piires pärast Kshana binaarkaadrit ja { "1" } mm pärast RINEX-stiilis plokki)

# text
seg-405df44dd887 = leo_navmsg::codec (crc24q, encode, decode)

# text
seg-577acdb9b84b = leo_navmsg::codec::tests (crc24q_matches_the_catalogue_check_value — 0xCDE703 ASCII-sõne { "123456789" } jaoks; crc24q_matches_the_rtcm_1005_example_frame — kolm kontrollbaiti 0x360B98 RTCM-i { "10403" } sõnumitüübi { "1005" } näidiskaadris ja null kogu kaadri üle)

# text
seg-4213f6b60bf1 = leo_navmsg::fit (fit_message, lstsq, polyfit); leo_navmsg::truth (TruthOrbit, TruthClock); leo_navmsg (sequence_stats, LeoNavmsgScenario)

# text
seg-7f4e08aeede7 = leo_navmsg::tests::a_two_body_truth_is_recovered_by_the_keplerian_fit_to_a_millimetre; leo_navmsg::tests::the_user_algorithm_reproduces_the_fitted_truth_to_a_millimetre_with_corrections; leo_navmsg::tests::the_clock_fit_returns_the_truth_clock_through_the_user_relativistic_term; leo_navmsg::tests::keplerian_sisre_grows_with_the_fit_interval_and_the_corrections_fix_it (monotoonne kasv { "1" }-st { "15" } minutini ja vähemalt kolmekordne paranemine { "15" } minuti juures); leo_navmsg::tests::defaults_run_encode_decode_without_any_preset_and_are_deterministic; tests/leo_navmsg_fit_real_orbit_oracle.rs::fitted_sisre_matches_liu_2025_on_real_orbits (TU Graz ITSG redutseeritud dünaamikaga orbiidid GRACE-A, GRACE-C, Sentinel-2A ja Sentinel-6A sobitatud { "20" } ja { "30" } min kaartel: piki-, ristsuunaline ja radiaalne RMS { "0.804" } kuni { "1.087" } ning SISRE { "0.716" } kuni { "0.809" } Liu et al. { "2025" } väärtustest, 1.5x sees; SISRE kaalud { "0.0007" } piires selle tabelist { "2" }); tests/leo_navmsg_full_claim_oracle.rs::integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h (Orekit { "12.2" } + Hipparchus { "3.1" }, sama algolek ja tiheduse sisend: halvim { "3.95" } mm kahe keha, { "3.92" } mm J2-J6 ja EGM2008 kuni astmeni { "20" } ja { "70" }, { "4.55" } mm EGM2008 aste { "20" } takistusega kõrgusel { "400" } km, lävi { "0.02" } m { "6" } h jooksul); sisemine ristkontroll, mitte sõltumatu etalon: tests/leo_navmsg_full_claim_oracle.rs::corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo

# text
seg-4a631f12459a = leo_navmsg::elements (kepler_point, Liu22Extra); leo_navmsg::fit (fit_message, fit_kepler, initial_params, formal_sigma); leo_navmsg::truth (TruthOrbit)

# text
seg-c79d4b5fdd17 = tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_model_matches_the_published_sisre (neli artikli päeva: piki-, ristsuunaline, radiaalne ja SISRE suhted { "0.755" } kuni { "1.138" } Liu et al. { "2025" } väärtustest, 1.5x sees); tests/leo_navmsg_fit_real_orbit_oracle.rs::liu22_holds_on_held_out_days (kaheksa kasutamata päeva, kaks kaart igaühel: { "0.683" } kuni { "1.186" })

# text
seg-765c69669bfa = leo_navmsg::services (klobuchar_delay_m, effective_ionisation_level, system_to_utc)

# text
seg-4693b7ddd7b2 = leo_navmsg::services::tests (klobuchar_scales_with_inverse_frequency_squared — L1 väärtus on RTKLIB-i { "6.1278" } m; nequick_az_rules; utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day; utc_drift_terms_follow_the_icd_formula; an_inserted_leap_second_reads_86400_at_the_end_of_the_day); tests/leo_navmsg_services_gnsstk_oracle.rs::services_match_gnsstk_and_erfa (Klobuchar L1, L2 ja L5 juures { "4 320" } juhul, halvim { "7.0e-13" } m; Az { "222" } koefitsiendikomplekti peal, sh nullist koosnev ja { "400" } sfu reeglid, halvim { "5.7e-14" } sfu; UTC triiv { "50" } juhul, halvim { "3.6e-15" } s; kolm liigsekundijuhtu { "21 602" } hetkel üle tegelike { "2015" } ja { "2016" } liigsekundite, { "0" } s)

# text
seg-0111fd0b84a5 = leo_fusion::geom (EarthOrbit); leo_fusion::doppler (range_rate, doppler_envelope)

# text
seg-a8dd3751a688 = tests/leo_doppler_reference.rs (iridium_doppler_reaches_the_published_36_khz: üks satelliit { "780" } km ja { "86.4" } deg kõrgusel lennutatud ühe päeva { "1621" } MHz juures üle nelja laiuskraadi, maksimum { "5" }% piires { "36" } kHz-st; xona_pulsar_x1_doppler_lies_in_the_published_32_to_34_khz: üks satelliit iga avaldatud kihi kohta, { "1080" } km { "53" } ja { "97" } deg juures, { "1593.3225" } MHz, konstellatsiooni maksimum { "32" } kuni { "34" } kHz sees ilma laienemiseta ({ "33.6" } kHz, määratud { "97" } deg kihi poolt; ainult { "53" } deg kiht tipneb { "31.8" } kHz juures)); leo_fusion::geom::tests (velocity_is_the_time_derivative_of_the_position)

# text
seg-8ac77c9b9588 = leo_fusion::ntn (gabor_bandwidth_flat_hz, gabor_bandwidth_bpsk_hz, gabor_bandwidth_numeric_hz, rms_duration_numeric_s, toa_crb_sigma_m, doppler_crb_sigma_hz, frequency_crb_sigma_hz, NtnScenario::geometry, NtnScenario); leo_fusion::joint_pvt (formal_sigma_enu)

# text
seg-50b92f3ed7eb = leo_fusion::ntn::tests (the_numerical_rms_bandwidth_matches_the_closed_forms; the_range_bound_scales_as_one_over_bandwidth_and_root_cn0: { "0.4157" } m käsitsi { "5" } MHz, { "45" } dB-Hz, { "0.1" } s juures; the_frequency_bound_is_the_complex_tone_crlb; defaults_run_wider_is_better_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ntn_wide_channel_bounds_far_tighter_than_the_narrow_one); tests/ntn_crlb_published_value_oracle.rs (ssb_bounds_reproduce_the_published_values; ntn_fix_covariances_match_numpy; bpsk_rms_bandwidth_reproduces_betz_table_1)

# text
seg-cc3d01973493 = leo_fusion::polar (latitude_sweep, latitude_sweep_at, element_sets, satellite_states_at); leo_fusion::joint_pvt (dop); sgp4 (MeanElementSet::from_earth_fixed, SgpOrbit, teme_to_itrs_matrix)

# text
seg-e1d9acf84101 = tests/leo_polar_coverage_on_path_orekit_oracle.rs (konfiguratsioonid A ja B, { "4040" } valimit: Maaga seotud asukohad { "6.8e-5" } m piires, lävi { "0.2" } m; nähtavate arvud identsed 4040/4040; mediaan DOP { "2.3e-11" } suhtelise piires, lävi { "1e-3" }; kättesaadavus ja keskmine nähtavate arv identsed); tests/earth_orbit_path_sgp4_erfa_oracle.rs (tee); leo_fusion::polar::tests (gps_vertical_geometry_weakens_at_the_pole_and_a_polar_leo_shell_restores_it); tests/leo_fusion_scenarios.rs (a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens); tests/leo_polar_coverage_orekit_oracle.rs (voor { "2" }, geomeetria antud olekutel); tests/leo_polar_coverage_full_claim_orekit_oracle.rs (1. vooru täisväite leid, kinnitatud)

# text
seg-bd265d530763 = lunar_frame_campaign, fim

# text
seg-7c8144a7376a = tests/lunar_frame_campaign_mpmath_oracle.rs (lunar_frame_campaign_datum_matches_mpmath_extended_precision: kolm stsenaariumi — jaamad hinnatud uuel kampaaniakuupäeval 2026-03-18 (siduv), jaamad fikseeritud sellel kuupäeval (kontroll), jaamad hinnatud 2024-01-01 (varasema kahekordse täpsuse möödalaske stsenaarium); iga datumi sigma, konditsiooniarv ja nõrgim suund vastu konditsiooniga skaleeritud läve, mis on testis uuesti arvutatud sõltumatu etaloni täpsetest tundlikkustest; engine_inputs_match_the_committed_fixture: sissekirjutatud Jacobi maatriks, kaalud ja Helmerti kavand on need, mida mootor praegu ehitab; record_engine_accuracy_against_a_factorisation_route: mootori veapiir ja NumPy Choleski diagnostika kinnitatud)

# text
seg-691a05f06e4d = linalg_sr, lunar_frame_campaign

# text
seg-f26d99df9184 = tests/lunar_frame_campaign_srif_mpmath_oracle.rs (srif_datum_matches_mpmath_extended_precision: neli stsenaariumi — jaamad hinnatud uuel kampaaniakuupäeval 2026-06-09 (siduv), jaamad fikseeritud sellel kuupäeval (kontroll) ning 2026-03-18 ja 2024-01-01 jaamad hinnatud sisendid; iga datumi sigma, konditsiooniarv ja nõrgim suund vastu ruutjuurvormi läve, mis on testis uuesti arvutatud sõltumatu etaloni täpsetest koostisosadest; engine_inputs_match_the_committed_fixture); linalg_sr::tests ({ "9" } teegi testi: Dekkeri korrutis võrdne liitmise-korrutamise jäägiga { "20 000" } paari peal, kompenseeritud summeerimine kustuva summa korral, R^T R võrdne A^T A-ga, järjestikused filtri uuendused võrdsed ühe partii uuendusega, lõpuplokk võrdne Schuri komplemendi ruutjuurega, kolmnurkne pöördmaatriks, Jacobi SVD, kokkulangemine spektraaldatumiga hästi tingimuslikul juhul, bitiliselt identsed kordusjooksud); lunar_frame_campaign::tests::the_default_solver_is_unchanged_and_an_unknown_solver_is_rejected ja the_srif_solver_agrees_with_the_spectral_one_where_both_are_accurate_and_says_so

# text
seg-02fed5e55709 = receiver_trust (ingest, maritime)

# text
seg-3c5f4229618e = tests/maritime_trust_reference.rs (t1_nmea_decoding_matches_pynmea2, t2_east_north_offsets_match_the_wgs84_geodesic, t3_t4_monitor_input_statistics_match_the_oracle) vastu tests/fixtures/maritime_trust/reference.json, genereeritud uuesti skriptiga scripts/gen_maritime_trust_ref.py failiga examples/gen_maritime_trust_ref_inputs.rs kirjutatud sünteetilisest NMEA-st; tolerantsid eelregistreeritud failis tests/fixtures/maritime_trust/PREREGISTRATION.md

# text
seg-684b87e7f358 = nmea_synth (track, sentences, scenarios); cli nmea-scenario

# text
seg-5699d8162c69 = tests/nmea_training_reference.rs (pynmea2 sõltumatu etaloni võrdlus); tests/nmea_training_scenarios.rs::every_sentence_is_checksum_valid_and_the_reader_accepts_it, ::every_sentence_type_is_present_each_epoch, ::deterministic_per_seed_and_sensitive_to_it

# text
seg-87e0596369cb = interference_map (adsb::nacp_epu_bound_m, adsb::nic_rc_bound_range_m, adsb::AdsbParams::classify, ais::ais_position_is_valid, ais::ais_speed_kn, grid::Grid::cell_of, route::exposure, land::LandMask::is_inland)

# text
seg-48689d047304 = tests/interference_map_reference.rs::adsb_accuracy_and_integrity_codes_agree_with_pymodes ({ "12" } NACp koodi, { "59" } NIC rida); tests/interference_map_reference.rs::ais_field_rules_agree_with_pyais_decoding ({ "94" } kaadrit); tests/interference_map_reference.rs::grid_cell_assignment_agrees_with_shapely ({ "1770" } punkti, neli lahtrisuurust); tests/interference_map_reference.rs::route_exposure_geometry_agrees_with_shapely_and_geographiclib ({ "8" } marsruuti, { "420" } lõiku, { "11634" } km); tests/interference_map_reference.rs::land_masking_agrees_with_shapely_and_pyproj ({ "996" } punkti); interference_map ühikutestid

# text
seg-a14a79333731 = telemetry (prometheus: Registry, render; otlp: build_payload, Exporter (feature otlp); sample)

# text
seg-bce7247612db = tests/telemetry_formats_reference.rs (prometheus_client_reads_our_exposition_as_the_registry_implies, the_official_otlp_proto_reads_our_json_as_the_registry_implies, awkward_reason_text_survives_the_parser, the_committed_outputs_are_what_this_crate_produces; skeem { "1.3" }: prometheus_client_reads_the_schema_13_exposition_as_the_registry_implies, the_official_otlp_proto_reads_the_schema_13_json_as_the_registry_implies, promtool_accepts_the_schema_13_exposition, the_collector_receives_and_exports_the_schema_13_payload_unchanged); tests/telemetry_cli.rs; telemetry::prometheus::tests (kuldne väljund)

# text
seg-40e8b0a596fb = telemetry (syslog: cef, rfc5424, SyslogSink; time)

# text
seg-baadfddd02b2 = tests/cef_reference.rs (pycef_reads_every_tier_1_event_as_the_sample_implies, the_logstash_cef_codec_reads_every_event_including_escaped_headers_as_the_sample_implies, the_committed_corpus_is_what_this_crate_produces_and_covers_what_was_registered); telemetry::syslog::tests (täpsed CEF-sõned, paomärgid, tõsidus, RFC { "5424" } ümbris); tests/telemetry_cli.rs

# text
seg-66f38fc734a7 = evidence (bundle: create_bundle, sign_detached, chain_link, sha256_hex; verify: verify_bundle, verify_detached; tsr; assemble; cli)

# text
seg-d50f70b4c20a = tests/evidence_crypto_reference.rs (RFC { "8032" } jaotise { "7.1" } vektorid { "1" }, { "2" }, { "3" } ja { "1024" }; FIPS 180-4 SHA-256 näited; täpne); tests/evidence_pack_reference.rs::kshana_and_the_clean_room_verifier_agree_on_every_case ({ "71" } juhtu); tests/evidence_pack.rs (manipuleerimise testid)

# text
seg-703f4b4ac682 = evidence::tsa (verify_token, pem_certificates); evidence::verify (VerifyOptions::tsa_anchors, Failure::TimestampAuthorityInvalid); evidence::cli (--tsa-ca)

# text
seg-39bc6b70440b = tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl (eelregistreeritud võrdlus); evidence::tsa::tests (kalendrikuupäevad ja kellaajad, base64, RSA avalik operatsioon); evidence::verify::tests::anchors_make_the_authority_checked (allkirjastamata token ebaõnnestub ankrutega; ilma nendeta aruanne ei muutu)

# text
seg-837193c4e1dc = interop::testbench (write_motion_csv, write_nmea, trajectory_of, export); fusion::pack::truth_trajectory

# text
seg-0094102cc5b8 = tests/testbench_reference.rs ({ "7" } testi: sõltumatu etaloni kinnitused, ekspordi baidid, halvim juht üle iga rea, asukohaveerud, kohalik kiirus vs tõeline NED-kiirus, Euleri nurgad vs scipy, NMEA vs pynmea2); tests/interop_testbench.rs (kirjutaja enda edasi-tagasi)

# text
seg-3266b898bfd2 = iq::signals::beidou (b1i_bits, b1i)

# text
seg-ba514f7e73ce = iq::signals::gps (l1c_weil, l1c_ranging_bits, l1c_p_bits, l1c_d_bits, l1co_s1_run, l1c_o_bits); iq::signals::tables

# text
seg-9e651a7f8dc9 = tests/iq_signals_gps_l1c.rs (c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2, c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3, c3_legendre_sequence_matches_is_gps_800j_table_6_2_1, the_column_check_rejects_relabelled_inverted_and_shifted_codes)

# text
seg-b289551b0bb5 = iq::signals::lunanet (afs_i_bits, afs_q_primary_bits, legendre_bits); iq::signals::lunanet_tables; iq::lunanet_afs::check_spec

# text
seg-176e3b9ea0e7 = tests/lunanet_afs_codes.rs (b1_afs_i_gold_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b2_the_legendre_sequence_of_length_10223_is_the_printed_table_d1, b3_afs_q_primary_codes_match_the_printed_first_and_last_24_chips_for_all_210_prns, b1b_not_met_the_printed_g2_state_is_not_the_state_after_the_printed_delay, b1c_post_hoc_the_printed_g2_state_is_the_state_after_2047_minus_the_delay); tests/iq_signal_matrix.rs (lunanet_afs_i, lunanet_afs_q)

# text
seg-6bb40f180cf0 = <s1>Eelmine</s1>Kontrolli olek

# text
seg-defb46c5bc80 = <s1>Järgmine</s1>Võimekuste kataloog

# text
# c1: docs/VERIFICATION-MATRIX.md
seg-e8e0e0618afa = Allikas: <c1/>

# text
seg-6e5e0a1e1c99 = allan (lag1_noise_id, lag1_acf)

# text
seg-9c4769edcf2b = osnma (page, subframe, dsm, merkle, signature, tesla, mac, maclt, navdata, verifier, ubx, cli)

# text
seg-af088012df3f = tests/osnma_official_vectors.rs (vabatahtlik, KSHANA_OSNMA_VECTORS: kõik { "18" } vektorikomplekti, { "186,382" } silti autenditud, { "0" } ebaõnnestunud, komplekti kaupa põrandad, ahelad välja kuulutatud, ADKD 0/4/12, häire kontrollitud, autentimise jätkumine pärast ahela lõppu, ahela ja võtme tühistamine ning uus avalik võti; võrguühenduseta, vektoreid ei levitata edasi); tests/osnma_synthetic.rs (ründekomplekt: võltsitud kauge tuleviku alamkaadrid, aegumine ja andmesidumine, häire ja „ära kasuta“, päise kinnitus, näiv silt, MACSEQ, võtmekonflikt, aegunud ja uuesti esitatud KROOT, CMAC-AES/SHA3-256/P-521 verifitseerija kaudu); osnma ühikutestid (RFC { "4231" }, RFC { "4493" }, FIPS { "197" }, FIPS { "202" }, RFC { "6979" } ja CRC-24Q teadaolevad vastused)

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

seg-e9650a618b38 = ID

seg-308cb3c31a16 = mission_thread (scenario, handover, conversions, budget, phase)

seg-65bd744f29c6 = mission_thread::scenario::tests::a_thread_runs_hands_over_converts_and_names_the_weakest_link; mission_thread::scenario::tests::bad_documents_fail_with_the_reason; mission_thread::handover::tests::inflate_never_shrinks_a_sigma_and_matches_the_hand_calculation; mission_thread::handover::tests::reacquire_sets_an_axis_to_the_floor_only_where_the_floor_is_smaller; mission_thread::conversions::tests::mci_mcmf_round_trip_returns_the_state_and_the_covariance; mission_thread::conversions::tests::tt_to_ltc_shifts_bias_and_drift_by_the_secular_rate_and_back; mission_thread::conversions::tests::the_committed_kernel_cuts_agree_with_pinned_horizons_values; tests/field_units_global.rs (the report's units block)

seg-9e5314dc6b0a = mission_thread::earth::launch (LaunchAscent)

seg-083f9245ff63 = mission_thread::earth::launch::tests::with_gnss_the_sigma_settles_near_the_fix_and_an_outage_lets_it_grow; mission_thread::earth::launch::tests::before_acquisition_the_sigma_only_grows_and_a_longer_acquisition_is_worse; mission_thread::earth::launch::tests::a_phase_that_does_not_list_gnss_never_uses_it; mission_thread::earth::launch::tests::bad_models_and_entries_are_refused; mission_thread::earth::filter::tests::repeated_updates_reach_the_riccati_steady_state

seg-da26dd6773fb = mission_thread::earth::rendezvous (LeoRendezvous); cw_dynamics; mission_thread::sensors

seg-940d19eaea64 = mission_thread::earth::rendezvous::tests::the_relative_sigma_falls_through_the_legs_and_opens_a_docking_window; mission_thread::earth::rendezvous::tests::without_relative_sensing_the_sigma_only_grows_and_no_window_opens; mission_thread::earth::rendezvous::tests::the_covariance_recursion_matches_a_one_axis_hand_calculation; mission_thread::earth::rendezvous::tests::bad_models_and_a_duration_mismatch_are_refused; mission_thread::sensors::tests::the_cross_range_error_grows_with_range_and_the_floor_dominates_up_close

seg-88b5123a7c1f = mission_thread::earth::tli_cruise (TliCruise); propagator; ssv::sweep

seg-be98276d9788 = mission_thread::earth::tli_cruise::tests::the_stm_is_symplectic_for_the_conservative_part_and_matches_a_finer_difference; mission_thread::earth::tli_cruise::tests::with_no_tracking_the_covariance_is_the_stm_propagation_of_the_entry_and_the_burn; mission_thread::earth::tli_cruise::tests::range_tracking_shrinks_the_line_of_sight_and_leaves_the_plane_of_the_sky; mission_thread::earth::tli_cruise::tests::the_thread_kernel_serves_the_moon_inside_its_window_and_the_series_outside; mission_thread::earth::tli_cruise::tests::gnss_ssv_fixes_are_applied_where_the_sweep_finds_four_signals; mission_thread::earth::tli_cruise::tests::a_phase_that_lists_a_source_the_model_lacks_is_refused_and_unknown_keys_too

seg-6057015a7a7c = mission_thread::earth::entry (Entry); reentry

seg-dcb831f6f492 = mission_thread::earth::entry::tests::the_flight_path_angle_and_its_sigma_follow_the_velocity_error_over_the_speed; mission_thread::earth::entry::tests::the_corridor_probability_is_the_gaussian_mass_inside; mission_thread::earth::entry::tests::the_phase_reports_the_interface_the_corridor_the_peaks_and_the_footprint; mission_thread::earth::entry::tests::the_steep_edge_peaks_higher_and_a_limit_below_it_is_flagged; mission_thread::earth::entry::tests::bad_corridors_unknown_keys_and_burn_keys_are_refused

seg-f937752c7a50 = mission_thread::earth::ground_network::tests::a_vehicle_over_a_station_is_seen_and_one_on_the_other_side_of_the_earth_is_not; mission_thread::earth::ground_network::tests::the_moon_is_in_view_of_three_well_spread_stations_most_of_the_time; mission_thread::earth::ground_network::tests::handover_losses_reduce_the_duty_and_never_below_zero; mission_thread::earth::ground_network::tests::a_stated_duty_is_passed_through_and_bad_documents_are_refused; mission_thread::scenario::tests::the_overlay_sets_the_tracking_duty_of_a_phase_that_lists_ground_tracking

seg-75f11c7aa6bc = lunar_rendezvous (LunarRendezvousScenario); lunar_phase; mission_thread::lunar

seg-995afbdc6a9f = lunar_rendezvous::tests::b1_mean_nees_is_inside_the_registered_band_in_all_four_configurations; lunar_rendezvous::tests::circular_cw_check_is_within_the_pre_registered_bar; lunar_rendezvous::tests::same_seed_gives_identical_documents; lunar_rendezvous::tests::b6_handover_without_a_measurement_only_propagates; mission_thread::lunar::tests::every_phase_runs_and_returns_a_modelled_outcome; tests/mission_thread_lunar_oracles.rs

seg-2c293a58fb25 = lunar_landing (LunarLandingScenario); lunar_phase; terrain_nav

seg-7ac44470d95d = lunar_landing::tests::b4_with_no_aid_the_landing_error_is_the_closed_form_inertial_drift; lunar_landing::tests::b4_each_aid_reports_exactly_what_the_reused_kind_gives; lunar_landing::tests::b3_ellipse_calibration; lunar_landing::tests::a_plane_gives_no_fix_the_aperture_problem; lunar_landing::tests::a_bowl_matches_the_closed_form_bound; lunar_landing::tests::three_relays_make_the_fix_depend_on_the_clock

seg-dd3ab355cb4f = lunar_surface_map (LunarSurfaceMapScenario); lunar_phase

seg-6b6210646fdd = lunar_surface_map::tests::b5_equals_the_service_volume_for_a_single_site; lunar_surface_map::tests::b5_equals_the_service_volume_with_the_real_terrain; lunar_surface_map::tests::terrain_never_adds_availability; lunar_surface_map::tests::timing_is_at_least_either_source_and_the_season_moves_the_earth_and_sun; lunar_surface_map::tests::same_inputs_give_identical_documents

seg-b95197d3e058 = lunar_ascent (LunarAscentScenario); lunar_phase

seg-977149f40c72 = lunar_ascent::tests::with_no_aid_the_insertion_error_is_the_closed_form_inertial_drift; lunar_ascent::tests::the_aid_never_hurts_and_the_velocity_is_carried_with_its_correlation; lunar_ascent::tests::a_stale_tt_clock_costs_a_three_relay_fix; lunar_ascent::tests::the_same_inputs_give_identical_documents

seg-48ac8187364f = lunar_od (LunarForceModel); precise_od; mission_thread_lunar_oracles (example)

seg-7372185d4dd9 = tests/mission_thread_lunar_oracles.rs::the_stored_numbers_meet_or_miss_the_registered_bars_as_recorded; tests/mission_thread_lunar_oracles.rs::the_fixtures_match_their_recorded_hashes

seg-7089ca12dbe0 = mission_thread::earth::tli_cruise; propagator; mission_thread_oracle (example)

seg-f4b44b14d819 = tests/mission_thread_oracle.rs::the_stored_numbers_miss_the_registered_bars_as_recorded; tests/mission_thread_oracle.rs::the_diagnostic_places_the_miss_in_five_impulsive_events_not_in_the_force_model; tests/mission_thread_oracle.rs::the_kernel_cut_and_the_recorded_inputs_match_their_hashes

seg-67fdcdfdb635 = interference_map::emitter (estimate, sessions, build_units, profile, GaussianFix::from_tdoa), interference_map::emitter_out (locate), <c1/>

seg-920b26e226ab = interference_map::emitter üksusetestid (projektsiooni edasi-tagasi ring, horisondi näitaja, sünteetilised otse- ja pöördringid: teadaolev kiirgaja jääb nimetatud piirkonda ligikaudu nimetatud sagedusega, äärejuhud, seansside rühmitamine, profiil, privaatsus ja sõnastus); tests/interference_map_cli.rs locate juhud

seg-9d7b242850ee = Täielik, masinkontrollitud tõenduste register: <b>{ "405" } rida — { "176" } VALIDATED, { "225" } MODELLED, { "4" } PARTNER</b>. Rida võib olla VALIDATED ainult sõltumatu välise etaloniga (maatriksi invariantide testid jõustavad seda). Samad andmed koos klõpsatavate ridapõhiste linkidega igale testile, moodulile ja sisse viidud testandmestikule on <em>Valideerimisregister</em> aadressil <a1>https://kshana.dev</a1>. Vt <a2>MODELLED-RATIONALE.md</a2>, miks iga modelleeritud rida pole väliselt valideeritud.

seg-3ca919e147c4 = { "405" } rida: { "176" } väliselt valideeritud, { "225" } modelleeritud, { "4" } partneri omanduses.
