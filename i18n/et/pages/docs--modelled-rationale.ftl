# docs--modelled-rationale: translations (et)

# text
seg-2db69c58f694 = Kuu diferentsiaalne PNT

# text
seg-1ff1d8ebf1e7 = Compliance-kaardistus avalike raamistikega

# text
seg-aab745a65e76 = Moodul

# text
seg-d6476863f862 = Võimekus

# text
seg-60a43431ebe0 = Nõue

# text
seg-bde1b3a94a47 = Päikese servapimenemisega SRP vari (valikuline)

# text
seg-eaaec545dd68 = SRP valgustatud osa kui servapimenemisega päikesevoo varjutamata osa (Eddingtoni lähenduse seadus I(mu)/I({ "1" }) = 2/5 + 3/5 mu, Gauss-Legendre'i kvadratuur) sfäärilise või WGS-84 Maa kohal (srp_shadow::limb_darkened_shadow, ShadowModel variant OblateEarthLimbDarkened)

# text
seg-9e15970435c3 = DE440 Päike ja Kuu Cowelli jõumudelis (valikuline)

# text
seg-de6831cf7785 = Valikuline efemeriiditase numbrilise Cowelli ForceModel kolmanda keha ja SRP liikmetele: geotsentriline Päike ja Kuu mis tahes EphemerisProvider-ist (DE440 SPK kernel läbi KernelEphemeris) hetkel TDB = TT + (TDB - TT), keeldudes pakkujast, kes ei suuda epohhi teenindada, ja loendades iga tagasilanguse analüütilisele reale; vaikimisi väljas

# text
seg-057c21daf4f2 = S1 atmosfääri loode (valikuline)

# text
seg-f600a39f297e = Ööpäevane S1 õhurõhu loode geopotentsiaali häiringuna: Biancale ja Bode ({ "2006" }) mudel N1, astmed { "2" } kuni { "6" }, läbi IERS { "2010" } Eq. { "6.21" } koormusvalemi (tides::atmospheric_tide_s1, s1_air_tide_acceleration), valikuline Cowelli ja täppisjõumudelitel (air_tide_s1, vaikimisi väljas)

# text
seg-e8f5ff8c9149 = Kõrge astmega sfääriliste harmooniliste raskusjõud (EGM2008 kuni { "2190" })

# text
seg-d3b2f32dcecb = Ületäitumiskindel ja poolusekindel täielikult normaliseeritud välja arvutus kuni astmeni { "2190" } (SphericalHarmonicField::acceleration_hf / potential_hf, Holmes-Featherstone { "2002" } modifitseeritud edasisuunaline veerg, kus gradient on vaba 1/cos phi-st), voogedastuslik ICGEM .gfc laadija (from_gfc_file / from_gfc_reader; täielik EGM2008 tõmmatakse käitusajal, seda ei komplekteerita kaasa) ning Holmes-Featherstone'i arvutaja, mis on valitav valikulisel Cowelli Geopotential'il

# text
seg-1960804ef2f4 = Kauguskiiruse ja az/el partii orbiidi määramine jaama maskeerimisega

# text
seg-4c185244bc66 = Epohhi oleku taastamine segatud kauguse, kauguskiiruse ning asimuudi/tõusunurga jälgimisest üle tõusunurga maski Gauss-Newtoni meetodil H = (dh/dx(t)) Phi(t, t0): analüütilised mõõtmise osatuletised ja variatsiooniline olekuüleminekumaatriks analüütiliste kahe keha + J2 osatuletistega (RK4-integreeritud, mitte suletud kujuga olekuüleminekumaatriks)

# text
seg-bc3d1ee7c639 = SP3 täpsuskoodi vaatluskaalud

# text
seg-63b1fab84f85 = SP3 täpsuskoodide (päis ++ astendajad kujul { "2" }^n mm, %f alus, kirjekohased alus^n mm standardhälbed) kaardistamine vaatluskohasteks asukoha sigmadeks täppis-orbiidi määramise mootori jaoks (sp3::parse_sp3_accuracy, Sp3Accuracy::position_sigma_m)

# text
seg-ae3e8833a5ef = Avaldatud gravitatsioonivälja sidumine kehaga

# text
seg-ffb2b20e5f32 = with_gravity_field (Body'l, failis src/gravity_pds.rs): mis tahes laaditud sfäärilise harmoonilise välja (näiteks GMM-3 või GL0660B) sidumine Body'ga, et propagaator arvutaks seda kehaga seotult; valikuline, vaikekehad muutmata

# text
seg-9762cf428435 = Navigatsioonisõnumite kodeerijad peale GPS LNAV (GPS CNAV, Galileo I/NAV ja F/NAV)

# text
seg-9b703b9607d8 = GPS CNAV sõnumitüübid 10/11/30, Galileo I/NAV sõnatüübid 1-5 nominaalsetel paaris/paaritu lehekülgedel ja Galileo F/NAV lehekülgede tüübid 1-4: ICD väljade pakkimine ja kvantimine, CRC-24Q, kiirusega 1/2 K={ "7" } konvolutsioonkodeerimine (Galileol G2 inverteeritud), plokkpõimimine ja sünkromustrid, koos sobivate testdekoodritega

# text
seg-974d8c1f7876 = Koodi Hatchi kandelaine silumine reaalsetel RINEX vaatlustel

# text
seg-f26b5da0f52e = Lahknemisvaba Hatchi filter (ionosfäärivaba kood, mida kannab ionosfäärivaba kandelaine, aken N epohhi, taaskäivitus sünkroonsuse kadumisel, geomeetriavaba hüppe või lünga korral) täppis-üksikpunkti positsioneerimise koostes

# text
seg-278ca396127a = RINEX { "4" } vaatlusfaili lugemine

# text
seg-e0883aa933eb = RINEX 4.0x vaatluspäised (DOI, LICENSE OF USE, STATION INFORMATION, MERGED FILE; sildid sobitatud veergudes 61-80 versioonile { "4" } ja hilisematele) ja epohhikirjed

# text
seg-33e5c74720ff = BeiDou GEO edastatud satelliidi asukoht

# text
seg-44b61449b65a = BDS-SIS-ICD-B1I v3.0 §{ "5.2.4.12" } geostatsionaarse satelliidi asukoht edastatud efemeriidist (inertsiaalsarnane süsteem, seejärel Rz(Ω̇e·tk)·Rx(−{ "5" }°)), valikuline NavParseOptions välja include_beidou_geo kaudu, seega vaikelugeja jätab GEO-d endiselt vahele

# text
seg-71f48628ebb2 = Kandelaine faasiga tihedalt seotud GNSS/INS ujuvate mitmetähenduslikkustega

# text
seg-5a156aa81275 = Veaoleku EKF { "15" } INS oleku, kaheoleku vastuvõtjakella ja ühe ujuva kandelaine mitmetähenduslikkusega jälgitud satelliidi kohta; pseudovahemaa, kandelaine faas ja valikuline kauguskiirus SGP4 Walkeri konstellatsioonist (valguse levi aeg ja Sagnac), Klobucharide ja Saastamoinen/Niell parandused rakendatud tsüklis filtri enda asukohas; ajaliselt diferentseeritud kandelaine libisemise tuvastamine satelliidikohase lävega, mida kiiruse määramatus laiendab; mitmetähenduslikkuse taasalgatamine libisemisel ja taasomandamisel

# text
seg-7d644516b1ec = GNSS/INS mere-, raudtee- ja lennunduspaketid tiheda sidumise valikuga

# text
seg-cbb03a8baf73 = Kolm gnss-ins stsenaariumi trajektooriteegis (laev, mis siksakitab kiirusega { "8" } m/s ja viieminutilise katkestusega; rong läbi kahe satelliidiga lõike ja tunneli; õhusõiduk, mille katkestus katab 25-kraadise kallutatud pöörde) ja paketi valikuline [tight] tabel: pseudovahemaad SGP4 Walkeri konstellatsioonist, mille ühendab suletud ahelaga navigaator, kõik maski kohal olevad satelliidid nominaalsel ja kõrgeimad mõned halvenenud juhul

# text
seg-f4dab73c4eda = Seotud pseudovahemaa PNT filter nihkeolekuga ja 3-D laiendus liitmispaketis

# text
seg-742b60089361 = Üks virnastatud Kalmani filter asukoha, kiiruse, kellafaasi ja sageduse üle, mida toidetakse asukohta ja kella siduvate pseudovahemaadega (Joseph-kujulised uuendused, mis kannavad ristkovariatsiooni); 1-DOF variant, mida täiendab konstantse kiirendusmõõturi nihke olek ja mida liitmispakett käitab sektsiooni [coupled] all; ning 3-D 8-olekuline versioon vaatejoone ridadega

# text
seg-2db2b9dc3b45 = GNSS/INS trajektooriteek ja CSV tegeliku trajektoori import

# text
seg-e1fe83c75a6c = Valitavad liikumisprofiilid gnss-ins paketile (sirge, figure-8 (kaheksakujuline), linna stop-and-go, õhusõiduki tõus ja koordineeritud pööre, mõõdistusdroon), määratletud Euleri kiiruste ja piki trajektoori kiirenduse käskudega, mis on tegeliku oleku peal suletud kinemaatilise IMU-ga (tsentripetaal-, raskusjõu- ja Coriolisi liikmed), ning imporditud CSV tegelik trajektoor muudetud IMU-ks, mis seda reprodutseerib; ajalooline sõit on muutmata, kui profiili pole antud

# text
seg-86f9186bb884 = Maa–Kuu CR3BP { "9" }:{ "2" } NRHO versus orbiit, mida CAPSTONE lendas

# text
seg-d4127cf241f3 = Ringjooneline piiratud { "9" }:{ "2" } L2 lõunapoolne peaaegu sirge halo-orbiit, mida cr3bp::differential_correct_halo parandab (Gatewayl ja CAPSTONE'il kasutatav orbiidiperekond), võrreldud oma keskmise geomeetria (periood, periluuna raadius, apoluuna raadius) alusel orbiidiga, mida CAPSTONE tegelikult lendas. Mõõtmine, kui hästi CR3BP liige kirjeldab tegelikku orbiiti; CR3BP orbiit ei ole efemeriidimudeli orbiit ning seda ei võrrelda epohhi kaupa

# text
seg-1a5623c81b48 = Asukohaviga geomeetriast: RMS viga = sigma_UERE x DOP mootori vähimruutude fiksi jaoks

# text
seg-7a94b44a8738 = dop_error_mc::run_geometry ja check: algväärtustatud (seed) Monte Carlo (N = { "20,000" } epohhi geomeetria kohta, sigma = { "1.5" } m, ChaCha8 algväärtus { "36" } + i) mootori enda iteratiivsest vähimruutude fiksist (pvt::solve_spp, ühikkaalud, lahendatud tegelikust asukohast) tests/fixtures/dop/dop_reference.csv { "8" } geomeetrial, võrreldes ida, põhja, üles ja kella vea dispersioone, H/V/P RMS-i, ida-põhja korrelatsiooni, keskmisi vigu ja { "95" } % horisontaalse ellipsi sisse jäävat osa ellipsiga sigma^{ "2" } Q, kus Q on orbit::dop tuuma kovariatsioonitegur (orbit::dop_cofactor, sama aritmeetika) samal geomeetrial

# text
seg-9acfde1b57f7 = Geomeetriateadlik usaldusklassifikatsioon: satelliidigeomeetria vastuvõtja usaldusskoori kõrval ja klass igal mahaarvamisel

# text
seg-6138c41e13ff = receiver_trust::geometry: epohhikohane satelliidigeomeetria (hea, halvenenud põhjustega few-satellites/high-pdop/high-hdop/sky-blocked, või teadmata, kui logi ei anna GSV, NAV-SAT ega GSA), tuletatud raporteeritud tõusunurkadest ja asimuutidest orbit::dop kaudu või võetud GSA-st, alati raporteeritud ja mitte kunagi punktidega hinnatud sildiga (good, fair, poor, unknown) ning HDOP, PDOP, VDOP, satelliitide arvu ja signaalikaoga sõnades; laeva skoori geomeetriamonitor, mis ei arva midagi maha, kui geomeetria ei ole halb (suhe max(hdop/4, pdop/6, 5/n_used) üle { "1" }), seejärel tõuseb ülempiirini { "15" } punkti väärtusel { "1.5" }, mida geomeetria üksi ei saa viia halvenenud vahemikust allapoole (ülempiir, tõusu lõpp ja põrand jaotises [geometry]; häiret pole); klass igal mahaarvamisel (geometry, environment, inconsistency), kusjuures sünkroonsuse kadu satelliitidele alla { "15" } kraadi klassifitseeritakse kui geometry, vaates olevad, kuid jälgimata satelliidid kui environment ning halva geomeetria mahaarvamine, mille esitatud HDOP on kaugemal kui max({ "1.0" }, { "25" } % tuletatud HDOP-ist) esitatud taevast, kui inconsistency

# text
seg-bbb1828b3db1 = Tänavakanjoni, sektori ja maastiku taandamine tabeliks

# text
seg-2864aec7be88 = skyline: tänavakanjon suletud kujul (lõige atan((h - a) / d), kus d = (w/2) / abs(sin(az - s)), lõppude lahtisus lõpliku pikkuse korral), teravaservalised sektorid päripäeva ümbermähkimisega ja maastikupunktid tabeliks taandatuna kumerusekaoga d^2/({ "2" } * 4/3 R); skyline on nende punktiviisiline maksimum mis tahes tabeliga

# text
seg-3f3d657854ce = Skyline'i eelseadistused (linnatänav, sadamasissesõit, fjord, konteinerterminal)

# text
seg-b915c06fa3f1 = skyline::PRESETS: neli REPRESENTATIVE geomeetriat disainimärkuse nimetatud mõõtmetega ja igaühel päritoluline; city-street (kanjon, tänav { "0" } kraadi, { "20" } m { "30" } m seinte vahel, antenn { "1.5" } m), harbour-approach (sektorid: avatud merepoolsele küljele { "180" } kraadi ulatuses, kaihoonetega { "8" } kraadi { "90" } kraadi ulatuses, lainemurdja { "3" } kraadi), fjord (maastik: seinad { "600" } m antenni kohal { "1.5" } km kaugusel mõlemal pool põhja-lõuna suunalist kanalit, kumerusekadu rakendatud), container-terminal (sektorid: virnad { "12" } kraadi maapoolsel poolel, kraanade poomid { "35" } kraadi ja { "25" } kraadi kahes kitsas sektoris); iga väli üle kirjutatav

# text
seg-6012113b4836 = Taevageomeetria funktsioonid: nähtavus, DOP, kovariatsioon, veaellips, Monte Carlo pilv

# text
# c1: kshana sky
# c2: kshana skyline
# c3: sky_geometry
seg-17352a3aa356 = geometry (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg; CLI <c1/> ja <c2/>, Pythoni ja WASM funktsioonid samade nimedega, MCP <c3/>): asukohast, ajast ja konstellatsiooni eelseadistustest (või satelliitidest asimuudi/tõusunurga või ECEF kujul) nähtavad ja skyline'i all maskeeritud satelliidid, GDOP/PDOP/HDOP/VDOP/TDOP, ühikdispersiooniga kofaktor (H^T H)^-1 ja kovariatsioon ida-põhja-üles süsteemis ühe vastuvõtjakellaga süsteemi kohta või ühe ühisega, horisontaalne veaellips (pooltelg k sigma sqrt(lambda), k = sqrt(-2 ln({ "1" } - p)), suund { "0.5" } atan2({ "2" } Q_EN, Q_NN - Q_EE) põhjast) ning n algväärtustatud (seed) vähimruutude viga sõltumatute Gaussi kaugusvigade korral nende empiirilise kovariatsiooni, RMS-i ja { "95" } % sisalduvusega. Kofaktor on orbit::cofactor_from_los, üks tuum orbit::dop ja orbit::dop_cov taga (dop on dop_cov taandus): teist DOP teostust pole

# text
seg-7f66be0f15c8 = GNSS-i puudumisel kella holdover

# text
seg-4d8f87668a0f = Suletud kujuga libisemisvea kasv + holdover läveni; kvantkella klassid

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
seg-157fadeb5d67 = Nav-signaali modulatsiooni ja koodijälgimise analüüs

# text
seg-ab633d191396 = BPSK-R/BOC PSD, spektraalne eraldus κ, Gabori ribalaius, DLL värin, mitmeteelevi

# text
seg-e6c08e1e6ae3 = Kvantinertsiaalsensori jõudlus

# text
seg-d28e1f6a430f = Külmaatomi interferomeetri kiirendusmõõtur esimestest printsiipidest (k_eff·T², QPN)

# text
seg-4b79d03cecf5 = Kvantinertsiaalsensori interferentsiriba mitmetähenduslikkus / dünaamiline ulatus

# text
seg-deb2850546d5 = Mach–Zehnderi interferentsiriba mitmetähenduslikkuse dünaamiline ulatus: 2π-perioodiline ribaloend määrab maksimaalse üheselt mõistetava erijõu a_max=π/(k_eff·T²) ja üheselt mõistetav ulatus lahutusrakkudes a_max/σ_a=π/σ_Φ ei sõltu optilisest skaalategurist — T² tundlikkuse võit maksab üheselt mõistetava ulatuse täpses samas tempos (küsitlusaeg vahetab lahutuse ulatuse vastu, jättes rakkude arvu ribafaasi müra määrata)

# text
seg-d04bf321d4a1 = Kvantinertsiaalse dead reckoning'u vastupidavus

# text
seg-c4989abb5d40 = Komponeeritud nihke + skaalateguri + VRW + stabiilsuse hääbumise asukohaeelarve holdover-i jooksul

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
seg-f1d49eac89f8 = Alternatiivne / täiendav PNT

# text
seg-023dda973f66 = Gravitatsioonikaardi sobitamine, maastikuga seotud (TERCOM/SITAN), magnetanomaalia

# text
seg-791e7285c291 = Reprodutseeritavus ja tarkvara kvaliteedi tagamine

# text
seg-7177355a482c = Deterministlik, stsenaariumi räsiga, SBOM + platvormideülesed kuldväravad

# text
# c1: impairment-eval
seg-241f2eeaef12 = Märgendatud sünteetiline häirete korpus + detektorist sõltumatu ROC/AUC/confusion/Pfa-Pmd testkomplekt; lekkekaitse, kihiline jaotus, jaotuse nihke (režiimisisene vs režiimivälise) optimismi aruanne. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/impairment-eval.toml)

# text
# c1: cargo run --release --example optimism_study
seg-642087659fda = Kontrollitud sünteetiline uuring jaotusesisene→jaotuseväline AUC optimismilõhe kohta avaldatud meetodite ja õpitud (logistiline regressioon / ühe peidetud kihiga MLP) detektorite üle: klassikohased skaleerimisseaduse trendid (Spearmani ρ + tõus suuruse { "1" }−tõsidus korral) ja ainult ID ridge-ennustaja, mis hindab lõhet ainult jaotusesisestest diagnostikatest, hinnatud ühe detektori välja jätmise ja ühe klassi välja jätmise meetodil. Reprodutseeritav käsuga <c1/>

# text
seg-fd6424213d1f = Kvant-versus-klassikaline PNT kompromiss ja GNSS-i puudumisel vastupidavus ({ "13503" })

# text
# c1: quantum-trade
seg-21b2b54200a8 = Mõõdetud ADEV vastuvõtt (NNLS), kompromissitabel (ajastuse/inertsiaalne holdover + kasu), vastupidavus-versus-aeg ümbris; põranda hoiatus kantakse artefaktil. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/quantum-trade.toml)

# text
seg-1fa865bfddd1 = Kosmoseilma keskkond ja aktiivsusest juhitud termosfääri tihedus

# text
# c1: space-weather
seg-47308f611c7e = Päikese/geomagnetilised indeksid (definitsiooniline Kp↔ap tabel), Jacchia-1971 eksosfääri temperatuur ja Jacchia { "1971" } termosfääri tihedus (SAO Special Report { "332" }: staatilised difusiooniprofiilid, mis reprodutseerivad selle tabelit { "7" }, koos päevaste, geomagnetiliste, poolaastaste, hooajaliste laiuskraadide ja heeliumi variatsioonidega) staatilise USSA76 atmosfääri vastu. Käivitatav CLI-st/sidemetest stsenaariumi liigina <c1/> (scenarios/space-weather.toml)

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
seg-7b4a8e25c3c9 = DVB-S2 adaptiivne kodeerimine ja modulatsioon LEO allalingi läbimisel

# text
# c1: acm-link
seg-3912fb8ccb15 = Allalingi Es/N0 ühe satelliidi iga läbimise ajal ühe jaama kohal (EIRP, vaba ruumi kadu, kosekansiseaduse atmosfäärikadu, muud kaod, G/T, Boltzmanni konstant, sümbolkiirus), kõige tõhusam DVB-S2 MODCOD, mis ületab oma ETSI EN { "302" } 307-1 V1.4.1 tabeli { "13" } kvaasi-veavaba läve pluss teostusvaru igal sammul, läbimise ACM andmemaht ning konstantse kodeerimise lähtetase, mis sulgub maskil ja pikimal kaugusel. Käivitatav stsenaariumi liigina <c1/>. Illustratiivsed sisendid; MODELLED.

# text
seg-19603a7e0fe8 = Mitme satelliidi ja mitme jaama maakontakti planeerimine konfliktide lahendamisega

# text
# c1: contact-schedule
seg-40edeae6e48b = Kandidaatkontaktid igast satelliidi-jaama läbimisest selle ACM andmemahuga; konfliktid, kus üks antenn teeniks kahte satelliiti oma ümberlülitusaja sees või üks satelliit saadaks allalingi korraga kahele jaamale; prioriteetidega kaalutud kohaletoimetamise sihtfunktsioon, mis on piiratud iga satelliidi tagavaraga; laisk marginaalväärtuse ahne plaan, esimesena-tulnu lähtetase ja täpne hargnemis- ja piirimeetod kuni { "26" } kandidaadil, koos raporteeritud ahne plaani optimaalsuse lõhega. Käivitatav stsenaariumi liigina <c1/>. Illustratiivsed sisendid; MODELLED.

# text
seg-3742d2aea62a = Säästlik kulu katvuse kohta / ROI raamistik

# text
seg-4228311689f8 = Kulu protsendi katvuse kohta + katvus euro kohta ROI konstellatsiooni mõõtmestamise mootori üle; satelliidikohane kulu on kutsuja hankitud madal/nominaalne/kõrge vahemik (väljamõeldud hindu pole)

# text
seg-8ba6ee9acc8a = Tuvastamata jäänud sündmuse terviklikkuse mõju (kontekstiteadlik HPL/VPL versus häirelävi)

# text
seg-f5985399d0d5 = Kaardistab tuvastamata spuufimise/segamise nihke efektiivseks veaks → Stanfordi piirkond (kättesaadav/kättesaamatu/MI/HMI) kontekstispetsiifilise HAL/VAL vastu (avatud taevas vs linn)

# text
seg-37d43b5b918a = CAI viidatud veamudeli parameetrileht ({ "13503" })

# text
seg-0b6a901f5ad2 = Vahemikuga (parim/nominaalne/konservatiivne) külmaatomi-interferomeetri jõudlus — nihke ebastabiilsus, kiiruse/nurga juhuslik kõndimine, skaalateguri stabiilsus, küsitlusajaga piiratud valimisagedus, interferentsiriba mitmetähenduslikkuse dünaamiline ulatus — igaüks viidetega jälgitav; toidab QuantumNavBudget'i ilma riistvara modelleerimata

# text
seg-c93f2d3a3167 = Ajastuse terviklikkuse standardi järgimise benchmark — Stanfordi terviklikkusdiagrammi epohhi klassifitseerija

# text
seg-712d5c35a6a6 = TIB Stanfordi terviklikkusdiagrammi epohhide klassifikatsioon (nominaalne / kättesaamatu / MI / HMI)

# text
seg-573aa0193cb3 = Ajastuse terviklikkuse standardi järgimise benchmark — terviklikkuse katvuse skoorija

# text
seg-4d86f3c2d8f5 = TIB terviklikkuse katvuse skoorimine (HMI/MI/kättesaadavuse määrad + ülepiiramise katvuse otsus)

# text
seg-372dd0fdb025 = Ajastuse terviklikkuse standardi järgimise benchmark — tõrgete kataloog (parameetrilised generaatorid)

# text
seg-2604e7cf27d2 = TIB tõrkemenüü (domeenide lahknemine, kella löömine, holdover-i libisemine, staatiline/juurdekasvuline/sümmeetriline/asümmeetriline viivitus, kordus värskuse piires, teevalikuline, k-N-st kvoorum)

# text
seg-90c0eb1e7c14 = Ajastuse terviklikkuse standardi järgimise benchmark — tuvastamatu neeldumise otsus

# text
seg-f713acf042ff = TIB tuvastamatu neeldumise otsus (sümmeetriline/kordus peab olema PL-i poolt neelatud, mitte kunagi tuvastatuks raporteeritud)

# text
seg-8adbbd2cdb74 = Hübriidse optilise/RF aruande enesekirjeldus

# text
seg-2a5e48b558e1 = Hybrid-optical-rf aruanne esitab lingi konfiguratsiooni, millega see tegelikult töötas (kandelaine pikkus, saate- ja vastuvõtuava, kaugus, impulsi laius, integreerimisaeg, kasutegurid ja kaod, vaikeväärtused lahendatud) ning kannab ühikuplokki, mis annab iga suuruse ühiku ja päritoluklassi, mida artikkel tõenäoliselt tsiteerib, sealhulgas üleandmise kovariatsioonijäljed ruutmeetrites

# text
seg-0691f3dee8cb = Hübriidse optilise/RF lingi kättesaadavus RF poolel

# text
seg-72ccb655caf0 = Hybrid-optical-rf aruanne esitab RF lingi kättesaadavuse, mis on koostatud suurustest, mida mootor juba arvutab, mitte imporditud klimatoloogiast, ning esitab koostise nimetatud reeglina: A_rf = I_closure * I_track, kus I_closure on ühesuunalise CCSDS-401 / DSN-810-005 linkide eelarve (linkbudget::link_budget, Eb/N0 varu >= { "0" }) sulgumisotsus stsenaariumi enda kaugusel ja I_track on jälgimissilmuse otsus (jamming::lock_status) C/N0 kohta, mille SAMA eelarve tagastas. Iga tegur kannab oma sisendi päritoluklassi väljundini ning tegurid, mis tahtlikult EI ole korrutises -- geomeetriline nähtavus, häirega keelamine ja RF katkestuse klimatoloogia -- on põhjendusega nimetatud, mitte vaikselt väärtusele { "1" } seatud. Lahendatud RF haru kajastatakse omaenda rf_link_configuration plokina ning indikaatori kõrval olevad pidevad näitajad (lingi varu, C/N0 varu, suletud kujuga sulgumise ja jälgimise kaugused ning kauguse kasutus) on sama eelarve kauguse inversioonid. Aruanne esitab täielikult, plokil ja ühikute kirjel, millele lugeja satub, et see arv on VARU/GEOMEETRIAPIIRATUD ja DETERMINISTLIK, samas kui optiline kättesaadavus on ILMASTIKU/KLIMATOLOOGIAGA PIIRATUD ja tõenäosuslik, seega ei saa neid kunagi tsiteerida võrreldava protsendipaarina

# text
seg-22c5df9b6c7c = Võrdväärne optilise-versus-RF kaugusmõõtmise võrdlus

# text
seg-70eb396f40af = Hybrid-optical-rf aruanne väljastab optilise-versus-RF kaugusmõõtmise suhte koos ÜHE konfiguratsiooniga, mille juures mõlemad harud hinnati, kantuna samas objektis: sama ühesuunaline tee, sama kaugus ja sama akumuleerimisaeg. Optiline haru on mootori footonipiiratud ToA CRLB ühesuunalisel footonite arvul; RF haru on mootori DLL varajase-hilise termilise koodijälgimise värin C/N0 juures, mille mootori enda linkide eelarve sama ühesuunalise kauguse jaoks tagastab. Silmuse müraribalaius on tuletatud, mitte valitud: B_L = 1/({ "2" }*integration_s) paneb RF haru täpselt optilise akumuleerimisaja peale ja kui kutsuja selle üle kirjutab nii, et kaks keskmistamisaega lahknevad, on suhe REFUSED -- null, koos nimetatud mittesobivuse ja mõlema ajaga -- mitte ei tsiteerita kahes töökohas. Suhet ei moodustata stsenaariumi VALITUD parameetrilise rf_position_sigma_m vastu ja keeldumine ütleb, miks: see sisend ei kanna üldse konfiguratsiooni. Avaldatud kahesuunaline optiline pealkirjanäitaja ja täpne tegur, mis seob selle ühesuunalise võrdlusharuga, väljastatakse suhte kõrval, seega ei saa aruannet lugeda nii, nagu see kannaks kaht lahknevat optilist sigmat

# text
seg-3f26f598e013 = Linkide eelarve aruande enesekirjeldus

# text
seg-b88bf41d6d4c = Linkide eelarve aruanne esitab iga absoluutse konstandi, millest selle enda varu arvutati -- kandesagedus, mida vaba ruumi kadu kasutas, EIRP, kvaliteedinäitaja, koondatud kadu ja Boltzmanni liige -- pluss nõutava G/T, mille juures varu on null, lingikonstandi (EIRP - kaod - nõutav Eb/N0), mis on ainus kombinatsioon, mille avaldatud kiiruse/võimenduse tabel kunagi fikseerida saab, ja, kui kutsuja esitab süsteemi müratemperatuuri, vastuvõtuantenni võimenduse, mida see kvaliteedinäitaja eeldab

# text
seg-a7b192e27cb5 = Kellaklassi kohane Kuu aja ristumiskoha tabel

# text
seg-cab605dc6ea2 = Üks Kuu aja eelarve jooks väljastab kellaklassi kohta kella-versus-süsteemi ristumiskoha rea ühe jagatud süsteemiliikme vastu, nii et kell on ainus muutuja võrdluses; iga rida kannab kahel viisil saavutatud ristumiskohta -- poolitatud üldisest astmeseaduse ajavea kõverast ja algebraliselt pööratud rea domineerivast müratüübist -- koos nende suhtelise erinevusega

# text
seg-18c72a7565d6 = Haardejalajälg kõrguse ja kiirtekimbu laiuse suhtes

# text
seg-9c30a0ab5233 = Kaheteljeline pühkimine mustriga kaalutud, kõrgusega piiratud pinna haardejalajäljest saatja kõrguse ja antennitaldriku läbimõõdu üle, väljastatud üks rida töökoha kohta koos poolvõimsuse kiirtekimbu laiusega, mille iga läbimõõt eeldab, ning limbi haare raporteeritud LÄVENDINA -- rea kohta limbi J/S, selle varu ja saatevõimsus, mis selle sulgeks; ruudustiku kohta leitud ületused või selge väide, et limbini ei jõuta kusagil ruudustikul, koos puudujäägiga

# text
seg-fc0a64b9a280 = Kuu ajavea eelarve reprodutseeritavus

# text
seg-5d5970506b9c = Lunar-time-budget stsenaarium avaldab oma massiivväärtustega väljundid pika vormi (ruudustiku indeks, keskmistamisaeg, liige) tabelina aruande kõrval, nii et seitse liikmekohast x(tau) kõverat ja ruutsumma kogusumma on mootori väljund, mitte midagi, mida lugeja meetodijaotisest uuesti ehitab

# text
seg-675887733454 = Kuu jaama aja laboratoorium: miniRAFS holdover versus LTC

# text
seg-7dfedc40da6a = Lunar-time-budget stsenaariumi valikuline [time_lab] plokk modelleerib Kuu etalonjaama kella (vaikimisi miniRAFS klass või mis tahes nimetatud klass või nimetatud stabiilsuspunktidele sobitatud seadmekaart), mis on juhitud Kuu koordinaatajale ja seejärel vabalt töötav või iga N sekundi järel uuesti juhitud: ajavea kõver x(t) kui kella astmeseaduse liikme, konstantse juhtimisjäägi (ILLUSTRATIVE), konstantse LTC realiseerimisjäägi ja valikulise jaama kõrguse kiiruse liikme ruutsumma; aeg pärast juhtimist väärtuseni { "1" }, { "10" } ja { "100" } ns (või nimetatud läviväärtusteni) poolitamisega domineeriva müratüübi suletud kujuga pöörde kõrval ja domineeriv liige igal nimetatud horisondil, kõik ühikutega

# text
seg-af3ff120b707 = Kuu geodeetiline VLBI

# text
seg-cfd7d0126028 = Lähivälja VLBI viivitus Maa baasjoonele, mis vaatleb Kuu majakat + osatuletised

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
seg-652bdc29deea = Kuu kandelaine faasi täisarvuliste mitmetähenduslikkuste lahendamine: pind ja orbiter

# text
seg-02496f9e9af2 = Vastuvõtjate vaheline üksikvahega Maa-GNSS kandelaine faas ja kood Kuu pinnajaamas ja orbiteril, epohhikohase kellavahe profileerimisega välja, üks mitmetähenduslikkus pideva läbimise kohta ja pikim läbimine mõõdusüsteemina. Ujuv mitmetähenduslikkuse kovariatsioon on Schuri komplement; LAMBDA lahendab täisarvud, bootstrap-määr raporteeritakse algväärtustatud (seed) Monte Carlo täisarvuliste vähimruutude edumäära ning ujuva ja fikseeritud asukoha sigmade kõrval. Raporteeritud leituna: registreeritud { "12" } dBi juures topeltvahe ülesannet ei saa moodustada (muudatus { "1" } viis vaikeväärtuse { "25" } dBi-le pärast seda, kui nähti ainult kättesaadavuse arvusid), ja { "25" } dBi juures täisarvuline fikseerimine EI saavutata - ulatusest väljas (paar protsenti kõige rohkem), kuigi ujuv lahend paraneb kaarega.

# text
seg-11dd1bb8e4e1 = Kuu süsteemi ühishinnang: pinnajaamad ja orbiterid

# text
seg-a38c8d95e6c9 = Seitsmeparameetrilise Kuu süsteemi datumi Fisheri informatsioon Maa jaamade laserkaugusmõõtmisest viiele reflektorile ainult ja orbiteri-pinnajaama kaugustega lisatult: informatsioonimaatriks, auaste, Cramer-Rao sigmad, Kuu identifitseeritavuse mooduli degeneratsioonimõõdik ja algväärtustatud (seed) juhuslikud jaamade hulgad. Orbiit loetakse teadaolevaks Kuu telgedes (selle viga kannab orbiteri kauguse sigma).

# text
seg-862977c4bb01 = Kosmoseside süsteemiside täpsus: ühes kohas paiknevad GNSS, VLBI ja laserkaugusmõõtmine

# text
seg-a9ae8e99f00d = Tehnikatevaheliste nihke, skaala ja pöörde erinevuste Cramer-Rao täpsus GNSS, VLBI ja laserkaugusmõõtmise süsteemide vahel, kui üks kosmoseaparaat kannab kõiki kolme, kosmoseaparaadi asukoht elimineeritud igal epohhil ja üheksa kohaliku sideme häireparameetrit kandmas prioorit, pühitud üle kohaliku sideme täpsuse. Kovariatsioonid ruutjuure teel (normaalvõrrandid kaotavad numbrid, kui tehnikad on peaaegu täiuslikud).

# text
seg-ae627996875e = Kuu Love'i arvu ja libratsiooni tundlikkus

# text
seg-28780d07c4a7 = h2, k2, l2 ja füüsikaliste libratsiooniamplituudide Fisheri informatsioon laserkaugusmõõtmisest (radiaalne ja horisontaalne loodeline nihe, reflektori pööre), orbiteri jälgimisest (astme 2 k2 kiirendus integreeritud piki vaatejoont, trend eemaldatud), pinna gravimeetrist (gravimeetriline tegur { "1" } + h2 - { "1.5" } k2) ja pinnakellast (osakiirus ({ "1" } + k2 - h2) W2/c2, seotud Kuu aja konstantidega). h2 ja l2 nominaalväärtused on lineariseerimispunktid; uuring ütleb, mis on mille suhtes tundlik, mitte seda, mis on arvud.

# text
seg-da712b740519 = Kuu pinnamajakate DOP täiendus

# text
# c1: lunar-beacon
seg-83e6341e01b1 = Majakatega täiendatud täpsuse halvenemise tegur Kuu pinnakasutajale: nähtavate satelliitide vaatejoone read ja nähtavate pinnamajakate kaugusmõõtmise read ühendatakse üheks disainimaatriksiks ja hinnatakse jagatud DOP tuumaga ning saadud DOP kaardistatakse realiseeritud 1-sigma täpsuseks METRITES majakakohase kasutaja-ekvivalentse kaugusvea kaudu, mis on koostatud kella sünkroniseerimise, mitmeteelevi ja mõõdistuse liikmete ruutsummana. Majaka nähtavus on õhuta Kuu kahe kõrgusega geomeetriline silmapiir, millel ei ole refraktsioonilist laiendust ja mis on seetõttu täpne, mitte ligikaudne. Käivitatav stsenaariumi liigina <c1/>, mis raporteerib ainult satelliidid, satelliidid pluss majakad ja suurema konstellatsiooni kui konkureeriva tee sama geomeetriani. MEASURED kaasasoleval kuldgeomeetrial (kasutaja kohal -80 kraadi, kolm mõõdistatud majakat, kuuesatelliidiline illustratiivne LCNS hetkel t={ "0" }, { "5" } kraadi mask): { "5" } nähtavat satelliiti annavad PDOP { "9.6941" } ja 3-D 1-sigma { "11.222" } m; majakate lisamine, mis tegelikult silmapiiri ületavad, annab PDOP { "4.1160" } ja { "4.765" } m, tegur { "2.355" }; 24-satelliidiline teenus annab selle asemel PDOP { "2.4226" } ja { "2.804" } m, tegur { "4.002" }. Aruanne trükib NÄHTAVA majakate arvu, mitte seadistatud arvu, ja sellel geomeetrial ületab silmapiiri ainult ÜKS kolmest majakast: kaks külgmist asukohta asuvad kasutajast umbes { "333" } km kaugusel { "86" } km silmapiiri vastu { "2" } m antenni jaoks, seega ei pea lugeja kunagi eeldama, et kõik kolm panustasid

# text
seg-845e9f5eec81 = Ühisrežiimi kaitsetase ja kogu terviklikkuse ümbris

# text
seg-e4ec41d0f5e1 = Kuu absoluutse jaama jälgitavus (datumidefekt)

# text
seg-b3e4160042d2 = Ühise Kuu lahendi Fisheri informatsiooni jälgitavus: ilma Maa baasjoonteta asub absoluutse tugisüsteemi datum HᵀWH nullruumis (jaama asukoht ei ole jälgitav); ≥{ "3" } baasjoont taastavad täisastme ja piiravad jaama Cramér–Rao viga, mille hinnang saavutab

# text
seg-2ed7181c97dd = LunaNet AFS hajutuskoodide genereerimine (LSIS V1.0)

# text
seg-13ff6c381275 = LSIS V1.0 Augmented Forward Signal koodid ({ "29" }. jaanuar { "2025" }): AFS-Q 10230-kiibine põhikood, mis on genereeritud IS-GPS-800 L1C piloodi konstruktsiooni ja IS-GPS-800J indeksitega (samad { "210" } määrangut, mille LSIS lisa D esitab), AFS-I 2046-kiibilised Goldi koodid, mis on genereeritud valemitest g1 = x^{ "11" } + x^{ "2" } + { "1" } ja g2 = x^{ "11" } + x^{ "8" } + x^{ "5" } + x^{ "2" } + { "1" }, iga PRN-i G2 viide on taastatud standardi lisa { "3" } failist, neli sekundaarkoodi, 1500-kiibilised tertsiaarkoodid, ajutine tabeli { "11" } sõlmemäärang ja tasemeline piloodikood. LSIS-i sisu loetakse käitusajal SHA-256-ga kontrollitud kohalikust vahemälust, mis täidetakse NASA hostitud PDF-ist, ning seda ei levitata edasi

# text
seg-56c7aeac59c1 = LunaNet AFS suletud ahelaga dekodeeritavus sõltumatu vastuvõtja poolt (LSIS V1.0)

# text
seg-da2d29d437b0 = Kshana AFS-salvestis, mille sõltumatu tarkvaravastuvõtja püüdis kinni, jälgis ja dekodeeris ning mida võrreldi salvestise enda tõeväärtuste siltidega. See tõendab ainult standardi järgimist ja siltide kooskõla; see ei ole väide kanali füüsika, leviku, vastuvõetava võimsuse ega lingibilansi kohta, mille väärtused salvestises on valitud sisendid

# text
seg-780369fb9a54 = GPS L1 C/A generaatoritevaheline standardi järgimine

# text
seg-ee47b60515f1 = GPS L1 C/A hajutuskoodid (sdr::CaCode) ja LNAV alamkaadrid 1-3 (gps_lnav: IS-GPS-200 väljade kvantimine standardi pii väärtusega, kahe täiendkoodiga pakkimine, TLM- ja HOW-sõnad, tabeli 20-XIV pariteet D29*/D30* inversiooniga, sõnade { "2" } ja { "10" } pariteeti lahendavad bitid) võrreldud bitt-bitilt gps-sdr-simiga selle kaasasoleval failil brdc0010.22n ({ "32" } satelliiti)

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
seg-10af60b488b9 = NovaMoon-klassi diferentsiaalne etalonjaam: ühisrežiimi tühistamine + baasjoonega kasvav jääk + DGNSS-i kaitsetasemed

# text
seg-c04a3591074c = Kuu koostalitlusvõime eksport

# text
seg-91f4a066b3c0 = LunaNet/IOAG-ga ühtlustatud Kuu tugisüsteemi, aja ja efemeriidi eksport (CCSDS OEM + KIF) edasi-tagasi teisendusega standardi järgimise kontrolliks

# text
seg-8ab65cbefb75 = PNT vastupidavuse raamistikuga ühtlustatud punktiarvestus

# text
seg-c48198f31d63 = Mõõtmepõhised alamhinded Kshana enda seitsme vastupidavuskategooria (mitte DHS-i terminite), RethinkPNT RDRR funktsioonide ja Yangi kriteeriumide üle, igaüks märgistatud sõnaga modelleeritud koos selle ajajaga; esialgne RPCF-i tase piiratud languse väravaga. Simulatsioonist tuletatud enesehinnang, mitte kunagi sertifitseerimine.

# text
seg-d7bdb6fe186e = Vastupidavuspunktisumma otsuse ebastabiilsuse uuring

# text
seg-5fcf18a68bb1 = Kvantifitseerib, kuidas üksik komposiitpunktisumma / RPCF-i tase järjestab arhitektuure ümber kaitstava kaalusimpleksi ja ohuansambli all (top-1 pöördemäär, Kendalli tau hajuvus, tasemepöörde määr, järgusuhtade vahemikud); deklareeritud-vs-mõõdetud ja mitmekesisuse kokkuvarisemise analüüsid.

# text
seg-1bf03544a010 = Demonstratsiooni representatiivsus ja lennuni jäänud lüngad

# text
seg-db24d16d38c9 = Tulemuspõhine ausa esituse register, mis kvalifitseerib demonstratsiooni väljundi: selle välised ankrud, modelleeritud eeldused, lennuni jäänud lüngad ja representatiivne TRL-i vahemik, kehtestatud invariantidega (valideeritud nõuab välist ankrut; modelleeritud nõuab lünka ega saa väita TRL-i { "4" } kõrgemat taset).

# text
seg-52ab936eb5f5 = Kvant- ja klassikalise lahenduse kompromissi tõendid (ühine kuju)

# text
seg-a6679ed5bed7 = Üks reprodutseeritav TradeEvidence objekt (fikseeritud raam: stsenaarium+algväärtus (seed)+mootor; ühised FoM-põhised kvant- ja klassikalise väärtused polaarsuse suhtes õige kasuga, valikuline { "95" }% CI, valideeritud/modelleeritud silt), mis kannab representatiivsuse kirjet, nii et iga kvant-PNT vertikaal esitab kompromissi samal ausal viisil.

# text
seg-20fee61b3107 = Kvantseadmete veamudelite teek

# text
seg-e42eabe9bc2a = Seadmekaardid (optiline/lõksustatud ioon/elavhõbeioon + klassikalised kellad, mis on taaskasutatud failidest holdover/clock_state; külmaatom-interferomeeter; klassikalised + põimumisel/üksikfotonil põhinevad aja edastamise lingid), igaüks kannab representatiivsuse kirjet; põimumislink lisab laskude poolt piiratud ajastuse korduvtäpsuse mudeli (~jitter/sqrt(R*tau), tumeloenduse karistus, süstemaatiline põhi).

# text
seg-86d71fd89f26 = Usaldatav kvantajastus (aja edastamine + turvaline levitamine + anomaaliad)

# text
seg-d2a3d37825ef = Otsast lõpuni kvant- ja klassikalise aja edastamise ahel (kella rannasõit + lingi korduvtäpsus ruutsummeeritult), taaskasutatud ajastuse kaitsetase, viite/kordusründe turvalisuse FoM (1-P_md) ning kella anomaalia tuvastamise tõenäosus + CUSUM-i latentsus, väljastatud ausa TradeEvidence'ina koos representatiivsuse kirjega.

# text
seg-eaf341ff4522 = GNSS-ita kvantnavigatsioon

# text
seg-908a44a9f7c7 = Kvant- (külmaatom-interferomeeter) vs klassikaline navigatsioonitaseme INS-i järjestikarvutus GNSS-i katkestuse ajal: asukohavea kasv, holdover asukoha lävendini ja kvant- vs klassikaline kompromiss ausa TradeEvidence'ina; aus jälgitavuse märkus (nihe ei ole ilma fikseeringuta jälgitav, seega viga kasvab).

# text
seg-914132833f5a = Kvant-PNT süsteemide rikete/anomaaliate tuvastamine

# text
seg-f20392820b9d = Märgistatud kvantrikete kataloog (kella sageduse hüpe/triiv/lukustuse kadu; sensori nihkeaste/väljalange), tuvastusstatistiku ROC AUC alglaadimise CI-ga ja minimaalne tuvastatav rike fikseeritud valehäire määra juures; kvantkellaga abistatud monitor tuvastab väiksemaid rikkeid kui klassikaline, väljastatud ausa TradeEvidence'ina.

# text
seg-d31be81dfd8f = TDOA/FDOA passiivne kiirgaja geolokatsioon

# text
seg-aa870cee16f6 = Kiirgaja (segaja/spuufija või oportunistlik allikas pöörd-PNT jaoks) asukoha määramine vastuvõtjavõrgu saabumisaegade erinevusest — τᵢ=(Rᵢ−R₀)/c hüperboloidide lõige, lahendatud Gauss–Newtoni vähimruutudega — ning sagedusdiferentsi (kaugusmuutuse erinevused) lisamisel liikuvate vastuvõtjatega asukoha ja kiiruse ühine taastamine; koos Cramér–Rao alampiiriga asukoha kovariatsioonile mõõtmisgeomeetriast

# text
seg-5bd3882531b6 = Peatumispunkti konvektiivne sisenemiskuumenemine (Sutton-Graves) 3-DoF sisenemisel

# text
seg-4f97036ed72f = Peatumispunkti konvektiivne soojusvoog q = k sqrt(rho/R_n) V^{ "3" } Sutton-Gravesi konstantidega Maa õhu ja Marsi atmosfääri jaoks (NASA TR R-376, { "1971" }), selle tipp ja integreeritud soojuskoormus piki 3-DoF sisenemist, ballistilist või tõstejõuga konstantse kreeninurgaga, Maal või Marsil.

# text
seg-1b96577665fc = Elektrooptilise kujutaja radiomeetria, MTF, suhteline servavastus ja GIQE { "4" } NIIRS

# text
# c1: eo-radiometry
seg-38902593e841 = Nadiirkujutaja signaali ja müra suhte eelarve (Lamberti stseeni radiants, kaameravõrrand, lasu-, tume-, lugemis- ja kvantimismüra), süsteemi MTF Nyquisti sagedusel varjestamata ava difraktsiooni, detektori ava, lineaarse hajumise ja Gaussi värina korrutisena, sellest MTF-ist integreeritud servavastus ja suhteline servavastus, Q = lambda F / p, ning GIQE versiooni { "4" } NIIRS ilma MTF-kompensatsioonita. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-07ca77a67207 = Kanderaketi tõusu gravitatsiooni-, takistus-, juhtimis- ja vastusurvekaod

# text
# c1: ascent-losses
seg-7a1802cf2c80 = Mitmeastmelise kanderaketi tasapinnaline gravitatsioonipöörde tõus mittepöörleval sfäärilisel Maal läbi USA standardatmosfääri { "1976" } (tihedus ja rõhk), tõusunurga lööki, düüsi vastusurvega vähendatud tõukejõudu, astmete väljalülitusi täpsetel sammupiiridel ning gravitatsiooni-, takistus-, juhtimis- ja vastusurvekadusid, mis on integreeritud oleku kõrval. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-55e8345def8b = TWSTFT kahesuunaline võrrand, määramatuse eelarve ja lingi stabiilsus flikkeri ja ööpäevase mittevastastikkusega

# text
# c1: time-transfer-budget
seg-5ca5226c24ec = TWSTFT kahesuunaline võrrand, lahendatud suuruse T_A - T_B jaoks jaama saatmis- ja vastuvõtuviidetega, Ku-riba ionosfääri üles-/allalingi asümmeetria, transponderi viite erinevuse ja Sagnaci liikmetega, selle täpse otsemudeli vastu; ruutsumma määramatuse eelarve lingi TDEV-iga A-tüüpi liikmena; kahesuunaline rida valge ja flikker-faasimüraga (Kasdin-Walter), ööpäevase mittevastastikkuse ja konstantse vastastikkuse jäägiga; ning etteantud Circular T, MJD-CSV või IGS RINEX jaamakella ridade kiirus, jääk-RMS, TDEV ja ADEV. Käivitatav stsenaariumi liigina <c1/>.

# text
seg-2f9be02c92bc = Optilise kaldtee atmosfääri numbrid: Rytovi dispersioon, skintillatsioon, gamma-gamma summutustõenäosus, ava keskmistamine, pilve ja selge õhu optiline paksus

# text
# c1: optical-atmosphere
seg-032cf76c2ec0 = Hufnagel-Valley Cn2 integreeritud piki kaldteed tasa- ja sfäärilaine Rytovi dispersiooni (üles- ja allalink), Andrews-Phillipsi skintillatsiooniindeksi ja gamma-gamma parameetrite, gamma-gamma summutustõenäosuse ja summutusvaru, nõrga turbulentsi ava keskmistamise teguri, vedela vee samba pilve optilise paksuse ning Kimi nähtavuse pluss Rayleigh' selge õhu optilise paksuse jaoks, asendades optilise lingi eelarve koondatud atmosfäärikao, kui atmosfäär on antud. Käivitatav stsenaariumi liigi <c1/> sees.

# text
seg-a2faab92e760 = Ilmast sõltuv optilise maajaama kättesaadavus ja kaugusest sõltuv jaamade mitmekesisus

# text
# c1: optical-atmosphere
seg-7f4e4e763d62 = Optilise lingi kättesaadavus esitatud lingivaru suhtes log-normaalsest pilve vedela vee kliimast (ITU-R P.840 hulk, geomeetrilise optika ekstinktsioon) ja sõltumatust gamma-gamma turbulentsi summutusest, sihtkättesaadavuste jaoks vajalik lingivaru ja lagi, mida ükski varu ei tõsta, log-normaalsed katkestuste kestused, parendustehnikate mis-oleks-kui, ning ühefaktoriline Gaussi kopula võrgu kättesaadavus, mille paarikorrelatsioon on exp(-kaugus/dekorrelatsioonipikkus). Käivitatav stsenaariumi liigina <c1/>.

# text
seg-043ece801e72 = Ajastuse ja kaugusmõõtmise pidevus optiliste katkestuste kaudu

# text
# c1: optical-atmosphere
seg-bb9cb3fe4180 = Optilise jaama katkestuste kestuse jaotus, mis on seotud kella holdover-mudeli suletud kujul rannasõidu dispersiooniga: ajastuse ja kaugusmõõtmise viga nimetatud katkestuste kvantiilidel, holdover ajastuse lävendini, selle sisse jäävate katkestuste ja katkestusaja osa ning ajastuse kättesaadavus A + U E[min(D, T_h)]/E[D] klassikalise ja kvantkella klasside jaoks. Käivitatav stsenaariumi liigi <c1/> sees.

# text
seg-b119df65d2a7 = Optilise lingi varu ajas: ühe jaama ilma üks algväärtusega (seed) realisatsioon

# text
# c1: [timeseries]
# c2: optical-atmosphere
seg-06125f3cae90 = Valikuline <c1/> tabel (kestus, samm, algväärtus (seed)) paneb liigi <c2/> kirjutama ka jaama kohta ühe algväärtusega (seed) realisatsiooni esitatud jaamamudelist ajas: pilveepisoodid (selged perioodid eksponentsiaalsed, pilvekatkestused log-normaalsed esitatud keskmise ja hajuvusega, pilves veedetud ajaosa seatud esitatud pilve tõenäosusele), üks log-normaalne vedela vee sammas pilveepisoodi kohta, üks gamma-gamma skintillatsiooniproov sammu kohta ning neist lingivaru, pilve- ja skintillatsioonisummutused ning lingi töötab lipp, koos realiseerunud kättesaadavuse, pilveosa, katkestuste arvu ja pikima katkestusega. Ilma tabelita on tulemus dokument { "0.37" }. Tõmbed käivad läbi teisaldatavate jaotuse- ja matemaatikateede, nii et native ja wasm32 annavad samad baidid.

# text
seg-58cbf576c959 = TRK-2-18 orbiidiandmete faili lugeja ja Marsi rampitud 2-suunalise Doppleri mudel

# text
seg-d1055650a77f = DSN-i orbiidiandmete failide (TRK-2-18) lugeja: 36-baidised kirjegrupid (faili silt, identifikaator, orbiidiandmed, jaamapõhised rambid, kellanihked, kokkuvõte, faili lõpp) ja igas orbiidiandmete kirjes ajamärge alates aastast { "1950" }, allalingi ja ülallingi viited, vaadeldav suurus, jaamad, andmetüüp, ribad, kehtivus, kanal, kosmoseaparaat, 46-bitine etalonsagedus ja tihendusaeg; rambi algus- ja lõppajad, kiirused ja algsagedused. Selle peal rampitud 2-suunaline X-riba Doppleri mudel (integreeritud ülallingi rambid, edasi-tagasi valgusaeg Shapiro ja troposfääriga, DSN-i jaamad IAU 2006/2000A CIO ahela ja IERS EOP kaudu, jaama aeg) ning Marsi orbiidiseadme partii orbiidi määramine (GMM-3 väli, kolmandad kehad, SRP, takistus).

# text
seg-455dc946c965 = Multiplikatiivne EKF asendi hindamine güroskoobist ja tähejälgijast

# text
# c1: aocs
seg-553d043438b4 = Lefferts-Markley-Shusteri multiplikatiivne EKF: keha tugisüsteemi asendiviga ja güroskoobi nihke olekud, propageerimine güroskoobi kiirusega miinus nihkehinnang ja Farrenkopfi diskreetne protsessimüra (nurga ja kiiruse juhuslik kõnd), tähejälgija uuendused jäägiga { "2" } vec(q^-1 q_st) Josephi kujul ning multiplikatiivne lähtestus; Farrenkopfi diskreetne güroskoobi ja tähejälgija simulaator. Liik <c1/> saab ahela sulgeda oma hinnangu peal.

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
seg-43cd7aa7ab53 = Kuu pinnanavigatsiooni RF-segamine (satelliidipõhine J/S)

# text
# c1: jamming
# c2: lunar-jamming
seg-e0566f37ad8f = Kuu-põhine segaja-signaali suhe, efektiivne C/N₀ ja lukustuse kadu selenograafilise pinnakasutaja jaoks Kuu pinnal asuva (või kõrgendatud) segaja all, illustratiivse avaliku allika Moonlight/LCNS-klassi konstellatsiooni üle. Koostab avatud segamisahela (j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor, nominal_cn0_dbhz, free_space_path_loss_db) avatud Kuu taevageomeetriaga (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); geomeetriat ega radiomeetriat ei tuletata uuesti. Erinevalt Maa liigist <c1/> ei ole signaaliharu fikseeritud vastuvõetud võimsus: iga satelliidi isotroopne vastuvõetud võimsus on selle enda lingieelarve EIRP − FSPL(kaldkaugus), nii et J/S varieerub satelliiditi Kuu kauguse ja kõrgusega. Väljastab ÜHE RIDA IGA NÄHTAVA (epohh, satelliit) LINGI KOHTA JSON-ina ja *.table.csv artefaktina, koos mõlema vastuvõetud võimsusega, mille vahe J/S on, trükituna selle kõrvale; koondnäitajad on selle tabeli kõrval, mitte selle asemel. Käivitatav stsenaariumi liigina <c2/>

# text
seg-4c116e25c5c5 = Kuu keelamiskontuur ebakindluse vööndiga mõõdetud C/N₀ hajuvusest

# text
# c1: lunar-jamming
# c2: denial
seg-77828c25f3ab = Aruanne <c1/> ei toetu enam oma keelamiskontuuris ühele skalaarile. See väljastab täieliku mõõdetud soovitud signaali C/N₀ jaotuse satelliidipõhise tabeli üle — n, min, p05, p25, mediaan, p75, p95, max, keskmine, valimi standardhälve ja valimi enda asümmeetria (p95 − mediaan) − (mediaan − p05) — lingipõhiste ridade kõrval, mis on muutmata. Kontuur esitatakse seejärel igal nendest järgustatistikutest MÕLEMA keelamiskriteeriumi all, mida mootor tunneb, mitte kunagi ühe asemel teist: olemasolev võimsussuhte kriteerium (J/S = { "30" } dB, sama lävi, mida kasutavad attack_surface ja tracking_loop, ning kriteerium välja antud Kuu lingisegamise tabeli veeru <c2/> taga) ja lukustuse kao kriteerium (efektiivne C/N₀ langeb tasemele tracking_threshold_dbhz), millega selle aruande enda links[].status veergu hinnatakse. Iga kontuuripunkt antakse keelamistasandi mõlemal teljel — segaja EIRP, mida nõutakse stsenaariumi vahemaal, ja keelamisvahemaa stsenaariumi EIRP juures — nii et vöönd on intervall samadel telgedel, millel kontuuri joonis on joonistatud. Vööndi servad ON contour(p05) ja contour(p95): sama suletud kujul kujutis, mis on rakendatud valimi enda kvantiilidele, mitte valimile sobitatud sigma ega mediaan ± k·stdev, ja aruanne ütleb seda numbrite kõrval stringis band_definition. stdev väljastatakse järjepidevuse huvides ja seda ei kasuta miski. Kvantiil, mille C/N₀ on juba jälgimislävendil või selle all, ei oma lõplikku keelavat J/S; need veerud väljastatakse väärtusega null koos loetud põhjusega, mitte lõpmatuse või kärbitud raadiusena

# text
seg-2d3944107ba0 = Ristmodaalsuse terviklikkuse monitori tuvastusvõimsus

# text
seg-38bc7c0bfe57 = Aruanne hybrid-optical-rf ütleb, mida ristmodaalsuse hii-ruut monitor tegelikult TUVASTADA suudab, mitte ainult et see läbib veatu juhtumi: minimaalne tuvastatav nihe jälgitava telje kohta (ida, põhi, üles, kell) stsenaariumi esitatud valehäire ja tuvastamata jäänud sündmuse tõenäosustel, selle mõlemal pool olev tuvastusvõimsuse kõver, müravaba nihke kordaja, mille juures realiseerunud statistik esimest korda lävendi ületab, ja nihke tõusu tuvastamise aeg esitatud kiirusel. Vead süstitakse ka läbi päris monitori ning selle tagastatud statistikut raporteeritakse analüütilise ennustuse kõrval

# text
seg-38cabd4921c1 = Üleandmisjärgse kovariatsiooni uuesti kasv häiretaseme piiri suhtes

# text
seg-9287268bbada = Aruanne hybrid-optical-rf avab filtri protsessimüra mudeli ja esitab, kui kaua üleandmisjärgne lahend jääb häiretaseme piiri sisse: mõlema üleandmissuuna jaoks kannab see telgede kaupa kovariatsiooni, mille üleandmine maha jättis, propageerib seda edasi esitatud juhusliku kõnni protsessimüra all ning raporteerib aja, mil katvusega skaleeritud 1σ jõuab horisontaalsete, vertikaalsete ja ajastuse häiretaseme piirideni, milline piir seondub esimesena, dispersiooni kahekordistumise ajakonstandi ning valimina võetud rannasõiduprofiili, mis ületuse sisse võtab. Protsessimüra PSD-d, katvustegur ja häiretaseme piirid on kõik sisendid dokumenteeritud vaikeväärtustega

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
seg-0f4d023fe2d4 = Kuu pinnapunkti koordinaatide kovariatsioon VLBI viite graafikust, hoitud eraldi Maa jaama omast

# text
# c1: all-stations-fixed
# c2: beacon_link
# c3: datum = "all-stations-fixed"
# c4: estimate_beacon = true
seg-47352405133b = Kolmas datumivalik <c1/>, mis hoiab kõiki Maa jaamu ja hindab ainult MAJAKA Kuu kehaga seotud koordinaate — seadistus, mille jaoks Kuu pinnapunkti ebakindlust tegelikult esitatakse, sest Maa jaamade koordinaadid on viitemudeli sisend, mitte selle tundmatu. See on olemas, sest jaamatasandi kovariatsioon ja pinnapunkti kovariatsioon on ERINEVAD SUURUSED, mida eraldab õlg ρ/B, ja miski ei takistanud varem ühe esitamist teise vastu. Väljastatav plokk <c2/> kannab ρ-d, pikimat baasjoont, õlga, võrdse jaotuse lingi pinnapunkti kuju c·σ_τ·(ρ/B)·√(g/N), arvutatud koordinaadipõhise majaka sigma ja nende suhte — suhe on null, mitte eksitav, kui majakat ei hinnata või maatriks on astmepuudulik. B võetakse PIKIMA olemasoleva baasjoonena, kõige soodsama omana, nii et suhe saab ainult alahinnata. Käivitatav kujul <c3/> koos <c4/>, mis lükatakse tagasi puuduvat sisendit nimetava teatega, kui majakat ei hinnata

# text
seg-0315968c8214 = Kuu diferentsiaalne PNT — korrektsioonilingi jääkeelarve

# text
seg-c6785166a44c = Kolm liiget, mille diferentsiaalkorrektsioon omandab epohhi, mil see arvutatakse, ja epohhi, mil seda kasutatakse, vahel, igaüks varem jäetud modelleerimata varuks: etalonjaama mõõdistusviga (korreleeritud satelliitide üle, baasjoonest sõltumatu, ~{ "1" }:{ "1" } asukoha ülekanne ja tõestatavalt DOP-i poolt võimendamata), korrektsiooni vananemine (külmutatud orbiidivea vektor, mis on uuesti projitseeritud vaatejoonele, kuhu mootori enda propageerija satelliidi ühe latentsuse võrra hiljem paneb, pluss c·σ_y(τ)·τ kella triiv kalibreeritud astmeseadusest) ja ühtlane lingi kvantimine täpsel ±(orbit_err + clock_err) täisskaalal dispersiooniga step²/12. Raporteeritud nii kauguse kui ka asukoha valdkonnas, olemasoleva jäägi ja kaitsetaseme kõrval — mitte kunagi nende asemel —, latentsuskõveraga üksiku numbri kõrval

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
seg-7bfcb5c6a985 = ARAIM samaaegsete mitme satelliidi veahüpoteesidega

# text
seg-15043111e437 = araim_reference::add_v42_subset_plan: ADD v4.2 alamhulga määramise reegel (P_THRES, FC_THRES, jälgitavad alamhulgad vähim eemaldatud esimesena) üldistatud paaridelt samaaegsetele kombinatsioonidele kuni max_order satelliidi ja konstellatsiooni sündmusest, täpse eelnevaga P_no fault prod q_e; add_v42_protection_levels_to_order käivitab sellel ADD v4.2 kaitsetaseme tee (järk { "2" } on olemasolev tee täpselt). raim::araim_subset_raim (nõusolekul): arenenud RAIM selle hüpoteesihulga üle, iga jälgitav alamhulk üks (p_fault, T, b, sigma) moodus terviklikkuse riski summas, jälgimatud alamhulgad viidud jälgimata riski alla, eelarve skaleeritud ADD jälgimata riski jaotusega ning suurima normaliseeritud separatsiooniga alamhulk raporteeritud, kui viga tuvastatakse. Eelnevad, mis vajavad sügavamaid alamhulki kui max_order, lükatakse tagasi, mitte ei kärbita

# text
seg-48ca01332f8f = RAIM kella holdover-kvaliteedinäitajate kõrval

# text
seg-890f1006a75d = Kella liigi valikuline [integrity] jaotis (clock_integrity::run): esitatud asukohast ja konstellatsiooni eelseadistustest (geometry::sky_geometry), igal terviklikkuse epohhil, kui GNSS-i ajajoon ei ole keelatud, hetktõmmise RAIM (raim::snapshot_raim: pariteedi hii-ruut test, tõusu kaitsetasemed) maski kohal olevatel satelliitidel algväärtusega (seed) Gaussi jääkidega esitatud sigmaga ja valikulise esitatud nihkega; eraldi plokk integrity_fom epohhipõhiste otsuste, kaitsetasemete ja kättesaadavusega. Keelatud epohhid raporteeritakse kättesaamatutena, mitte kunagi ekstrapoleerituna; holdover-kvaliteedinäitajad on muutmata ja ilma jaotiseta on väljund baidi-identne

# text
seg-9cbb4ee7588a = Ruumiline, mürarikas, mitme perekonna tsislunaarne kaarepikkuse jälgitavus

# text
seg-5ebd771deef8 = Tsislunaarne kaarepikkuse jälgitavuse lävi RUUMILISES kuue olekuga CR3BP-s tasapinnalise nelja olekuga asemel, DRO, L2 halo ja L2 peaaegu sirge halo perekondade üle, mõõtemüraga Gramiani sees ja KAHE kriteeriumi raporteerimisega, sest ühtegi ausat ühte ei ole: avaldatud astmekriteerium, mis on tõestatavalt invariantne homoskedastilise mõõtmissigma suhtes (valgendamine korrutab jälgitavuse maatriksi skalaariga, jättes suhtelise singulaarväärtuste spektri ja seega astme, defekti ja tinglikkuse muutmata), ja hinnatavuse kriteerium — esimene kaar, mille juures peasatelliidi algoleku formaalne 1σ asukohaebakindlus langeb alla esitatud piiri — mis on see, mis müraga liigub. Iga lävi kannab epohhiruudustiku vahemikku, milles see asub; saavutamata kriteerium on null koos põhjusega. Tasapinnaline režiim jääb vaikimisi ja tasapinnaväliseid perekondi seal tagasi lükatakse, mitte ei lameda olekuks, mis neid esitada ei suuda

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
seg-c815cb90dcde = Kuu etalonjaama geodeesia: lisatud retroreflektor ja VLBI majakas viie massiivi datumi suhtes

# text
seg-103cf21173ac = Valikulised sisendid extra_reflectors ja extra_beacons stsenaariumil lunar-llr-datum lisavad ploki station_geodesy: viie massiivi Helmerti informatsioon arhiveeritud Kuu laserkaugusmõõtmise lõigust pluss informatsioon, mille lisatud retroreflektor (kaugusmõõdetud arhiveeritud normaalpunktide epohhidel, mil kaugusmõõtejaam on oma horisondi kohal, igaühel selle normaalpunkti arhiveeritud kaal) ja lisatud VLBI majakas (vaadeldud stsenaariumi lunar-frame-campaign võrgu ja graafikuga Maa jaamad fikseeritult, läbi lunar-vlbi-fim viite osatuletiste) esitatud asukohtades seitsmeparameetrilisele datumile lisavad, uuesti lahendatud, iga Helmerti parameetri 1-sigma enne ja pärast, nende suhe, normid enne ja pärast ning Fisheri vahe äärmuslikud omaväärtused. Puudumisel või tühjana on aruanne muutmata

# text
seg-44f582b17fa9 = Värava terviklikkus — roheline, mis tähendab seda, mida ütleb

# text
# c1: cargo test --all
seg-43fbcfbe990c = Kolm struktuurset valvet kontrolliprotsessi enda üle, igaüks sulgeb defektiklassi, mis jõudis kanoonilisse väravasse katkendliku või võlts punasena. ({ "1" }) Iga Rust-lähtekoodis konstrueeritud ajutine tee peab kandma kutsepõhist unikaalset komponenti; protsessi id lükatakse tagasi, sest cargo käivitab teegi testid ÜHE protsessi paralleelsete lõimedena ja pid on neil kõigil ühine. ({ "2" }) Iga bait-baidile või räsi kinnitus peab oma kõrval või oma mooduli päises deklareerima, mida see katab ja mida see tahtlikult välistab — nii et läbiv muudatus näeb ühe pilguga, millised kinnitused on ulatuses ja millest on vaikides saanud hoidla-ülesed muutuste detektorid. ({ "3" }) Rohelist võib väita ainult TÄIELIKUST komplektist: scripts/gate.sh käivitab <c1/>, jäädvustab tõelise väljumiskoodi ilma toru teel olemata ja kirjutab kviitungi, mis nimetab commiti, integratsioonibinaaride arvu, testide arvu ja kestuse; enne-surumise kontroll lükkab tagasi surumise, mille commiti ei nimeta ükski kehtiv kviitung, puhtal puul. Korduvust proovitakse eraldi skriptiga scripts/check-repeatability.sh, mis käivitab teegi komplekti N korda ja ebaõnnestub, kui läbivate testide hulk erineb.

# text
seg-b7cd952ff133 = Koostatud ajastuse PL — P0-algväärtusega (seed) holdover-läbisõit

# text
seg-135df1e0e68a = PL(τ)=max(TPL_handover,HPL(τ)); alt poolpidev PL({ "0" }+)≥PL({ "0" }−); K(IR/2) jooksev maksimum; τ/τ³/τ⁵ faasieksponendid

# text
seg-096b6cdfe2dc = Koostatud ajastuse PL — LIL a.s. ümbris (võimatus + kooskõla)

# text
seg-1671add2210d = Lõplikku halvima juhu holdover-i ei ole (Browni sup hajub); IR-ga jaotatud HPL kooskõlas Hartman-Wintneri ümbrisega, kui IR→{ "0" }

# text
seg-5a27c9f0a67d = Heterogeenne UTC(k) jälgitavuse nihke terviklikkuse ülempiir

# text
seg-fd09ab2adbf6 = Allikapõhine nihke ülempiir b = (U/k_cov)·Phi^-1(1-tail/2) + vananemine, mis paisutab avaldatud B-tüüpi laiendatud määramatuse jaotatud terviklikkuse sabaks; sild tpl_scalar-iga kujul bias_s

# text
seg-d75b900ad25f = Korreleeritud jälgitavuse nihke ristkovariatsioon (ühisrežiimi suhtes ohtlik jaotus)

# text
seg-0641f6d38c23 = N×N nihke ristkovariatsioon rho·b_i·b_j mittediagonaalsetega allikatele, mis jagavad UTC(k) realiseerijat; TÕESTATUD correlated_fused_bias >= independent_fused_bias (naiivne sõltumatu jaotus alapiirab liidetud nihet -> optimistlik -> ohtlik)

# text
seg-1a3bb032960f = Ühisrežiimi kooskõla statistik (eraldusi mittenäha jagatud etalonviga)

# text
seg-1b03f522b8fc = Skoori statistik ({ "1" }^T Omega^-1 r)^2/({ "1" }^T Omega^-1 { "1" }) ~ chi^2_1 ühisrežiimi nihke jaoks, mida lahendite eraldamine (kontrastid, mis on { "1" }-ga risti) ei näe; ühisrežiimi nihe suurendab seda, samal ajal kui paaripõhised eraldused jäävad muutumatuks

# text
seg-3359eee713a5 = Kuu datumi nullruumi klassifikatsioon (LLR-i astmeliitvus ja libratsioonidefekti tõstmine)

# text
seg-6d722c176052 = Sisemise kaugusmõõtmise datumiprobleemi klassifikatsioon: üksik kaugusmõõtmine annab astme { "1" } (6-mõõtmeline nullruum); lähtepunkti X ja skaala paar on peaaegu null ning füüsikaline DE440 libratsioon tõstab defekti nulli, samal ajal kui paar jääb peaaegu degenereerunuks

# text
seg-3fd19007ea67 = Mitme meetodi Kuu datumi teave (LLR + Kuu VLBI + orbiidi kaugusmõõtmine)

# text
seg-23d0dd7d0666 = Datumi Jacobi maatriksi read Maa–reflektori LLR-i kauguse, kahe jaama Kuu VLBI diferentsiaalviivituse ja orbiidi–majaka kauguse jaoks 7-parameetrilise datumi üle, ühendatud üheks järjepidevalt eeltingitud Fisheri maatriksiks; näitab, et radiaalsuunaväline (orbiter / sügavuselt mitmekesine) jälgimine murrab lähtepunkti X ja skaala degeneratsiooni, samal ajal kui ristisuunaline VLBI aitab ainult kaudselt

# text
seg-ab96cfc8d48c = Kuu LLR-i datumi geomeetria substraat (peatelgede reflektorid, maajaamad, analüütilised kauguse osatuletised)

# text
seg-40e91288f81a = Viis Kuu Maa-poolse külje retroreflektorivõret PA kehakaadris meetrites ja LLR-i maajaamad geodeetilistes koordinaatides; reflektori keha-inertsiaalkaadri paigutus DE440 PA orientatsiooni kaudu; Maa–reflektori kauguse analüütilised osatuletised 4-parameetrilise datumi suhtes; ning ainult LLR-i Fisheri maatriks, mis näitab Kuu keskpunkti X ja skaala degeneratsiooni, mis õigustab 7-parameetrilist analüüsi

# text
seg-63a8571f8eb0 = Kauguse ja kella nihke degeneratsioon ühesuunalises Kuu kaugusmõõtmises ning geomeetrilise mitmekesisuse kavandamisseadus

# text
seg-cdd70f56051a = Sõlmepõhine radiaalkauguse ja vastuvõtja kella nihke degeneratsioon on täpne vahekorras { "1" } m ja { "3.336" } ns (üks jagatud c-ga). { "{" }scale, offset{ "}" } Schuri komplemendi marginaal (coupled_marginal_fisher) näitab, et geomeetriliselt mitmekesises võrgus tõstab kahesuunaline kaugusmõõtmine marginaali ligikaudu sama teguri võrra kui sama arv täiendavaid ühesuunalisi andmeid, samal ajal kui idealiseeritud üksiksõlme režiimis on kahesuunaline tõus suurusjärkude võrra suurem. Sellest tulenev kavandamisseadus: geomeetriline mitmekesisus, mitte kahesuunaline kaugusmõõtmine kui selline, eraldab ühesuunalises kaugusmõõtmises Kuu kaadri skaala ajaskaala nihkest; kahesuunaline või väline ajasidumine on vajalik ainult vähese mitmekesisusega või üksikkasutaja režiimis.

# text
seg-2c074d6260ba = Esindlik mitme meetodi mõõtmismenüü ja liitev Fisheri kombineerimisreegel

# text
seg-beefac5c1b13 = MeasurementBlock hoiab ühte kandidaatmõõtmiskampaaniat 7x7 Fisheri infopanusena pluss skalaarne suhteline kulu; block_from_rows ehitab ühe toorete datumi Jacobi ridade põhjal, nii et iga plokk on läbi lunar_identifiability::assemble_multi_info identselt eeltingitud; combine liidab valitud alamhulga info, mis on õige reegel, sest Fisheri info on sõltumatute mõõtmiste üle liitev; representative_lunar_menu pakub deterministliku nelja ploki menüü (LLR, ristsuunaline VLBI limbimajakas, Maa-poolse külje orbiter ja Maa-vastase külje orbiter). Eelarvepiiranguga kavandusoptimeerija, mis seda menüüd tarbib, ei kuulu sellesse kasti.

# text
seg-2d3347bcb15e = Pakkujatevaheline kooskõlatolerants segapakkujaga kasutajale

# text
seg-9decf2cb6b0c = consistency_tolerance: pöörab kasutaja asukohabudžeti ümber parameetripõhiseks pakkujatevaheliseks Helmerti kokkulangevuse nõudeks (lähtepunkt/skaala/pööre) etalonõlal, vajaduse korral paisutatud P1 üksikpakkuja realisatsiooni CRLB-ga

# text
seg-5450d921dfc9 = Mitme pakkuja Kuu koostalitlusvõime veabudžett ja kaadri-vs-efemeriidi kavandamisseadus

# text
seg-e1e30f5c17a6 = interop_budget: taandatav (ühine kaaditõmme) vs taandamatu (dünaamika) lahutus kokkulepete PerProvider / CommonFrameTie / CommonEphemeris all, koos taandamatu osa kavandamisseaduse meetrikaga (~{ "0.69" } päris DE440/INPOP/EPM korral: ühine kaadrisilt üksi jätab domineeriva põranda alles)

# text
seg-ebb827739614 = Bütsantsi ploki sädeme tuvastamise/identifitseerimise piir autonoomses sõlmepõhises Kuu võrgus (T3)

# text
seg-4fb935e6193d = byzantine_bound instantseerib turvalise olekuhinnangu kodeerimise / hõreda jälgitavuse piiri sõlmepõhise võrgu geomeetrial: Bütsantsi vastaspeegel süstib suvalise lineaarkombinatsiooni mõõtmistest, milles ta osaleb, ja võrk TUVASTAB iga koalitsiooni, milles on ≤ f = block_spark − { "1" } vastaspeeglit, ning identifitseerib TÄPSELT iga koalitsiooni, milles on ≤ ⌊(block_spark − { "1" })/2⌋, kus block_spark on väikseim vastaspeeglite koalitsioon, mille virnastatud efektiivsed signatuurid P⊥·B_T on veeruastme poolest puudulikud. Vastaspeegli tuvastatavus on P⊥·B_j TÄIS-VEERUASTE (nullist erinev, kuid astmepuudulik plokk on nullist erinev rünne, mis langeb ruumi range(G) ega jäta jääki), mitte pelgalt P⊥·B_j ≠ { "0" }

# text
seg-4f57f586cf82 = Autonoomse holdover'i ajalise kalibreeringu põrand isereferentsiaalse Kuu konstellatsiooni jaoks (T4)

# text
seg-eb690e8f5c9b = holdover_floor kinnitab, et ainult sõlmedevaheliste mõõtmistega seotud autonoomsete sõlmede ansamblis on ühine kella kiirus (δα_j += { "1" } ∀j) ansambliaja vaba parameeter, mis asub ruumis N(GᵀWG): ükski lisanduv sõlmedevaheline kaugusmõõtmine ei suuda seda jälgida (rate_in_gauge = true, temporal_gauge_dim = { "2" } koos ühise nihkega). See on tõeline holdover'i põrand – ruumilise jäiga kaadri asukohakalibreeringu ajaline analoog. Ühe välise absoluutkiiruse sideme lisamine (otselink võrguvälise etalonini) viskab ühise kiiruse nullruumist välja (rate_in_gauge = false, temporal_gauge_dim = { "1" }), tõestades, et põrand on tõeline kalibreering, mitte ostsillaatorimudeli artefakt

# text
seg-25ffd6e1979c = Pakkuja ühise/diferentsiaalse lahutus, ühe astmepuuduse ühendamine ja kaitselünga tõus (T5 / §{ "0" } / g7)

# text
seg-72c7ec3724bf = Kolm tahku ühest lahutusest ℝ^{ "{" }state_dim{ "}" } = N(GᵀWG) ⊕ range(GᵀWG), kus 8-mõõtmeline datumi⊕ajaskaala kalibreering on N(G) ja state_dim − { "8" } = { "32" } jälgitavat suunda on range(G): (T5) provider_mismatch_split klassifitseerib ühise mitme pakkuja nihke (∈ range(G)) TUVASTAMATUKS – vajab välist sidet – ja diferentsiaalse nihke (∉ range(G)) ise jälgitavaks / TUVASTATAVAKS; (§{ "0" }) ühendamine tähendab, et SAMA range(G) pime alamruum valitseb tuvastamatu vea klassi, seega on datumi kalibreering N(G) ja vea suhtes pime alamruum range(G) üks geomeetria, mitte kaks; (g7) slope tagastab Browni kaitselünga tõusu ‖Π_obs Δx̂‖ / ‖P⊥b‖_W → ∞ vea b ∈ range(G) korral (hinnang rikutud nullparsusega) ja lõpliku tuvastatava vea korral

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
seg-97aebb84576e = Holdover-test hinnatud operaatori esitatud ajavea salvestisest

# text
# c1: holdover-test
seg-ab533cf99c56 = Liik <c1/>: ajavea salvestis (linuxptp, chrony, TICC, TimeLabi või RINEX-i kellalogi või time_s,time_error_ns paarid) jagatakse operaatori esitatud kahe GNSS-i eemaldamise ja taastamise ajahetkega lähtetaseme, holdover'i ja taastumise sammuks; lähtetaset mõõdetakse lukustatud kellale kirjutatud ITU-T maskide vastu ja holdover'it holdover'ile või autonoomsele kellale kirjutatud maskide, ePRTC-A holdover'i mähise ja ajavea eelarvete vastu; holdover esitab vähimruutude sagedusnihke, mida süsteem hoidis, ning taastumine esitab, kas ja millal |TE| jõudis esitatud ribasse ja püsis seal esitatud viibeaja jooksul, koos tipu ja suurima sammuga. Iga piir on see, mille telekomi ajastuse liik ümber kirjutab; need kaks ajahetke on operaatori väide ja neid ei kontrollita

# text
seg-94cbac97a1aa = GNSS-i signaali kättesaadavus kosmoseteenuse mahus ja sellest kaugemal, võrreldud ICG SSV brošüüriga

# text
# c1: gnss-ssv
seg-c59e349fdc9e = Liigi <c1/> kättesaadavuse pühkimised: konstellatsiooni kaupa (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) ja kombineeritult (user, epoch) paaride osakaal, kus on vähemalt üks ja vähemalt neli signaali, ning pikim katkestus, kasutajale sfääril (brošüüri 2,562-punktiline globaalne kest, { "14" } päeva { "1" } minuti sammuga) või trajektooril (GEO, HEO, Kuu ülekanne), brošüüri lisa C Kepleri orbiitidest, konstantsest minimaalsest kiirgusvõimsusest etalonist kõrvalekaldenurga sees, Maa varjestusest sfääri pluss { "50" } km ja C/N0 lävest; kasutaja antennid brošüüri tabelist B10

# text
# c1: gnss-ssv
seg-d2f04991c8a4 = Servakiire ionosfääri, plasmasfääri ja atmosfääri mõjud riivavatele GNSS-i signaalidele ning nõrga signaali vastuvõtja kavand liigis <c1/>

# text
seg-1a1786ba90b6 = Chapmani ionosfäär, Gallagheri-tüüpi plasmasfäär ja neutraalne atmosfäär (murdumisnäitaja paine, hapniku neeldumine, defokuseerumine), integreeritud mööda saatja ja kasutaja vahelist sirget kiirt: kaldkülje summaarne elektronsisaldus, selle plasmasfääriline osa, liigviivitus, puutekõrgus ja kadu riivavatel linkidel; ning nõrga signaali vastuvõtja kavand (koherentne ja mittekoherentne integreerimine, andmebiti piir, abistamine, Doppleri otsing), mis seab C/N0 läve omandamise ja jälgimissilmuse mudelitest

# text
seg-6b8f9f3ca2a3 = Pardal olev GNSS-i navigatsioonifilter kõrgete orbiitide ja Kuu ülekande kosmoselaevadele

# text
# c1: gnss-ssv
# c2: [navigation]
seg-39ddc494f103 = Liigi <c1/> režiim <c2/>: üheksaoleku laiendatud Kalmani filter (asukoht, kiirus, vastuvõtja kella nihe ja triiv, päikesekiirgusrõhu skaala) pseudovahemaadel, mille kättesaadavus, müra ja C/N0 tulevad samast link-geomeetriast kui pühkimistel; tõde integreeritakse J2, Päikese ja Kuu kolmanda keha ning kiirgusrõhuga varjuga, filter modelleerib J2 ja kolmandaid kehasid ning hindab kiirgusrõhku; esitab asukoha ja kiiruse vead GNSS-i orbiitide sees ja kohal, pikima mõõtmislünga ja keskmise NEES-i

# text
seg-5fc242476828 = Mitme kosmoselaeva formatsiooni suhteline navigatsioon väga elliptilisel orbiidil GNSS-i põhjal

# text
# c1: gnss-ssv
# c2: [formation]
seg-f67eb29d4483 = Liigi <c1/> režiim <c2/>: ülem ja alluvad käitavad igaüks absoluutfiltrit; alluva asukohta ülema suhtes hinnatakse absoluutsete hinnangute lahutamisega ja suhtelise filtriga ühe-diferentsiga pseudovahemaadel signaalidest, mida mõlemad laevad jälgivad, kusjuures suhteline dünaamika on kahe mittelineaarse trajektoori vahe

# text
seg-7038f6902820 = Külmaatomiinterferomeetri veaterminid: Ramani laserfaasi müra, lainefrondi kõveruse nihe ja vöötmitmetähenduslikkuse lahendamine

# text
seg-4d9690207607 = inertial::cai_error_terms (teegifunktsioonid, stsenaariumi liigist veel kättesaamatud): ruutimpulss-kolmeimpulss-interferomeetri Ramani faasi kaalufunktsioon (Cheinet et al. { "2008" }, valem { "8" }) valge faasi suletud kujuga (pi/2)^{ "2" } S_phi0/tau_R ja numbriline tee mis tahes spektri jaoks; laseri sageduse müra, mida retroreflektsiooni viivitus ei tühista (Le Gouet et al. { "2007" }, valemid { "9" } kuni { "11" }); termilise pilve puhta defokuseerumise lainefrondi nihe sigma_v^2/R ja selle vähendamine tuvastusraadiusega; vale vööndiindeksi tõenäosus erfc(pi/(sqrt({ "2" }) s)) klassikalise kiirendusmõõturi abi ja kahe küsitlusaja korral ning selle pöördfunktsioon

# text
seg-363705e03bac = Ostsillaatori holdover'i eelseaded avalikest andmelehtedest

# text
seg-9750d9e0ec7a = Neli eelseadet – OCXO (Microchip OX-208), rubiidium (Microchip 8040C), tseesium (Microchip 5071A high-performance tube) ja CSAC (Microchip SA.45s) – igaüks kannab oma andmelehe Alani hälbe maksimume, vananemist ja temperatuuripiiri; mittenegatiivsete vähimruutude valge + flicker + juhuslik käik sagedusmüra sobitus, skaleeritud igat andmelehe punkti ümbritsema, flickeri põrand mitte kunagi pikima-τ näitajast madalam, lineaarne vananemine ja siinuseline temperatuuriliige, sünteesitud seemnestatud holdover'ina pärast GNSS-i kadu

# text
seg-d7e03158b972 = Sekundid, kuni vabalt töötav kell lahkub ajaindekseeritud pesa kaitsevahemikust, ning fiksimistihedus, mis hoiab selle sees

# text
# c1: slot-timing
seg-0b4d8815f756 = Liik <c1/>: ennustatud viga E(t) = k·√(σ₀² + σ_x²(t)) + (|y₀| + |c_T·ΔT|)·t + ½|D|t² pööratud rikkumise, järelejäänud aja, fiksi latentsust arvestava uuestisünkroniseerimise intervalli ja päevas vajalike fiksimiste jaoks, iga liige eritletud ja domineeriv nimetatud; kellad kuue ClockClass vaikeväärtuse (TCXO, OCXO ja RAFS lisatud, igaüks tsiteerib ühte andmelehte), telekomi ajastuse eelseadete, reasisese andmelehe või mõõdetud salvestise põhjal; allika pikimast keskmistamisajast kaugemale jääv rikkumine märgitakse ekstrapoleeritud

# text
seg-2797643153dc = Ajastuse kaitsetase orbiidil olevale vastuvõtjale GNSS-i spuufimise korral

# text
# c1: slot-timing
seg-cb412a2ffadf = orbital_timing::orbital_timing, kättesaadav liigi <c1/> spuufimise jaotisena: ringorbiidi kiirus ja periood, pikim aeg, mille jooksul maapealne spuufija suudab satelliiti ühe läbilennu kohta mõjutada, kellaabistatud monitori põrand ja CUSUM-i tuvastusviivitus, tingimuslik kaitsetase (põrand pluss rannikuaeg viivituse jooksul), kõrvalekalle, mille esitatud maksimaalse tõusukiirusega spuufija koguneb, enne kui satelliit lahkub oma jalajäljest või käivitub sõltumatu kontroll, ning see, kas iga maajaama või ristlingi kontroll on ühest maapealsest spuufijast sõltumatu

# text
seg-f134975d4ffa = L-riba spektri koskdiagramm ribapõhise J/S-i ja efektiivse C/N0-ga stsenaariumipõhise segaja ajajoone all

# text
# c1: spectrum
# c2: jamming
seg-86ad8f89a822 = Liik <c1/>: L-riba võimsusspektri tiheduse sagedus-aja ruudustik (termiline põrand k T_sys, kus T_sys = T_ant + { "290" } K (F - { "1" }), signaalid oma liidesespetsifikatsiooni minimaalsetel vastuvõetud võimsustel ning pidevlaine-, kitsariba-, chirp- ja sobitatud müra segajad sisse/välja lülitusaegadega), iga lahter keskmistatud oma ribal ja real (chirpid täpselt täis- ja osapühkimistel, segajad töötsükli järgi), ribapõhine efektiivne C/N0 = [1/(C/N0) + sum (J/S) kappa]^-1 rea kohta, ribapõhine J/S, ribasisene J/S ja C/N0 tulpadega SVG koskdiagramm. Aruanne sisaldab ristkontrolli liigi <c2/> ahela vastu samadel link-sisenditel

# text
seg-6e0b9687e8ee = Uraan ja Neptuun Standishi tabelist { "1" }, Pluuto ja planeetide kiirused

# text
seg-df3bf502dfe9 = Uraani ja Neptuuni asukohad Standishi tabelist { "1" } (vaikimisi vahemikus { "1800" } pKr kuni { "2050" } pKr), Pluuto { "1992" } tabeli { "1" } realt, mida praegune JPL-i leht enam ei loetle, ning iga planeedi heliotsentriline kiirus: kahe keha tuletis elementidest tulenevat keskmist liikumist kasutades pluss ellipsi pöörlemine periheeli, kaldenurga ja sõlme kiiruste tõttu

# text
seg-a50be56f605a = Kuu ja seitsme suure kuu (Phobos, Deimos, Galilei kuud, Titan) asukohad

# text
seg-2cfbe5a1eece = Geotsentriline Kuu Montenbrucki & Gilli reast (mille -1.3972 kraadi sajandis liige viitab selle juba J2000 pööripäevale), ning Phobose, Deimose, Io, Europa, Ganymedese ja Callisto planetotsentrilised asukohad ja kiirused JPL Solar System Dynamicsi keskmistest elementidest iga kuu Laplace'i tasandis, kus keskmise pikkuse kiirus on võetud IAU sünkroonse pöörlemiskiiruse järgi (tabel trükib perioodi liiga vähese arvu numbritega, et faasi hoida), ning Titani IAU pöörlemismudelist (kuu miinus keha-kinnise x-telje peal keskmisel kaugusel), sest Titani trükitud Laplace'i tasandi rida ei reprodutseeri Horizonsit isegi oma epohhil

# text
seg-8b8c8e28ece9 = Iga Päikesesüsteemi keha füüsikalised konstandid ja kogu süsteemi aruanne

# text
# c1: solar-system
seg-d225a30de35c = Keha lisab Merkuuri, Veenuse, Jupiteri, Saturni, Uraani, Neptuuni, Pluuto, Phobose, Deimose, Io, Europa, Ganymedese, Callisto ja Titani (gravitatsiooniparameeter, etalonraadius, J2 seal, kus see on avaldatud, koos raadiusega, millele see viitab, IAU poolus ja nullmeridiaan), nimeotsingu ja BodyFacts kirje (NAIF-i kood, klass, vanem, ekvatoriaalne ja keskmine raadius); liik <c1/> esitab need kõigi kaheksateistkümne keha kohta koos asukohtade, käiguaegade ja ühe tiiru orbiidijäljega, iga keha märgistatud VALIDATED või MODELLED

# text
seg-87ab655f8270 = Positsioneerimine mis tahes Päikesesüsteemi keha ümber kohaliku konstellatsiooni ja sügavkosmoselingiga Maalt

# text
# c1: body-pnt
seg-d9b1b0ac97d3 = Liik <c1/>: nime järgi valitud keha ümber olev orbiter või pinnalander navigeerib keha ümber oleva Walkeri navigatsioonikonstellatsiooni ühesuunaliste pseudovahemaadega (kahe keha orbiidid keha J2 sekulaarse triiviga, tundmatu kasutaja kell) ja valikulise kellavaba kahesuunalise kaugusega Maalt, Maa suund ja kaugus analüütilisest efemeriidist igal epohhil; keha sfääri blokeeritud vaatekiired ja pinna kõrgusmask; epohhi kohta ainult konstellatsiooni GDOP ja PDOP (orbit::dop), formaalne asukohaebakindlus Maa reaga ja ilma ning seemnestatud Gauss-Newtoni fiksid (batch_ls::gauss_newton) kumbagi moodi, koos keha-Maa valguse käiguaja ja edasi-tagasi teega

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
seg-ad6105af464c = Parameetripühkimised ja seemnestatud Monte Carlo ansamblid üle mis tahes stsenaariumi liigi

# text
# c1: campaign
seg-95921611839e = Liigi <c1/> sweep (üks kuni kolm punktiga eraldatud võtit mis tahes liigist, üldise pühkimise telje väärtustel, valikuliselt ansambel igas sõlmes) ja monte_carlo jaotised: realisatsioon k käivitub väärtusel base_seed + k; iga mõõdik esitab keskmise, standardhälbe, lähima järgu 5./50./95. protsentiili ja fikseeritud algväärtusega protsentiili-bootstrapi { "95" }% usaldusvahemiku keskmisele (inertial::metric_stat); mõõdiku ühikud loetakse pühitud liigi enda units-plokist

# text
seg-24327a0ed82e = Mitu stsenaariumi jagatud tingimustes koos kombineeritud kokkuvõttega

# text
# c1: campaign
seg-5833fb3b06e3 = Liigi <c1/> compose jaotis: nimega jagatud väärtused (näiteks ühe segaja võimsus ja asukoht) kirjutatakse igasse liikmesse võtmetele, millega need on seotud, iga liige käivitatakse ning mõõdiku kohta esitatakse liikmete väikseim, suurim ja keskmine väärtus koos nimetatud liikmega; mõõdikuühikud peavad liikmete vahel kokku langema

# text
seg-0bc866720bde = Piiratud optimeerimine ühe mõõdiku järgi kampaania parameetrite üle

# text
# c1: campaign
seg-f9bdb89c2b4f = Liigi <c1/> optimize jaotis (CAP-32): üks kuni kolm punktiga eraldatud stsenaariumivõtit piiratud vahemikuga [lo, hi] lin- või log-skaalal, üks mõõdik loetud tulemuse tee järgi, eesmärk minimize, maximize või target; meetod grid (pühkimise telje väärtused) või deterministlik Nelder-Meadi simpleks normaliseeritud koordinaatides kasti projektsiooni ja standardkoefitsientidega; puuduv või mittelõplik mõõdik saab halvima skoori ja jääb jälje sisse; kui runs > { "1" }, on mõõdik ühiste seemnete keskmine; iga hindamine on nimetatud liigi päris jooksutus, loetletud trace'is ja arvestatud reprodutseeritavuse kokkuvõttes

# text
seg-652e28dfa10f = Madala Maa-orbiidi positsioneerimise, navigatsiooni ja aja signaalikavandid: koodijälgimine, omandamine, GNSS-iga ühilduvus ja ribade kompromiss mis tahes süsteemi jaoks

# text
# c1: leo-signal
seg-c0ba5c7e708e = Liik <c1/>: parametriseeritud signaalikavandid (riba, edastuse ribalaius, ITU jaotus; omandamise, andmete ja piloodi komponendid BPSK(n), BOC(m,n), MBOC või lamedate spektritega, võimsusosad, FDMA alamkandjad, koodipikkused ja andmekiirused) kompileeritud avalikest eelseadefailidest (Xona Pulsar, Iridium STL, Starlink oportunistlik signaal, CentiSpace, üldine C-riba kavand ja üldised UHF/L/S/C/lai-C kavandid, igaühel oma allika URL ja avaldamata väärtused märgistatud REPRESENTATIVE) või kirjutatud reasiseselt; signaali kohta ribapiiratud võimsusspektri tihedus, ribasisesed võimsusosad, Gabori ribalaius, koodivärin C/N0 ja vahe suhtes ning kaugusmõõtmise täpsus, omandamise otsinguruum, ruutseaduse tuvastustõenäosus ning keskmine järjestikune ja koodiparalleelne omandamisaeg, spektraalse eraldatuse koefitsient GPS L1 C/A-sse, Galileo E1-sse, GPS L5-sse, Galileo E5a-sse, E5b-sse ja AltBOC-i ning neist välja koos C/N0 halvenemisega ning CW, laiariba ja sobitatud J/S tolerants spektriliigi SSC ahelast; ionosfääri viivituse, vabaruumikao, kaugusmõõtmise täpsuse võrdsel C/N0 ja võrdsel EIRP-l ning segajatolerantsi ribade kompromiss; ning kavandi kvalitatiivsed kujukontrollid kirjeldatud mõõtmise vastu

# text
seg-c2b9c8e4a364 = Mitme riba spektri koskdiagramm (UHF, L, S, C) kavandatud signaalide ja ribapõhiste segajatega

# text
# c1: spectrum
seg-609df4e0a085 = L-ribast kaugemale laiendatud liik <c1/>: ribad antud eelseadekavandi signaalina (joonistatud iga komponendiga, ribapiiratud edastuse ribalaiusele, C/N0 ja J/S viidatud jälgitavale komponendile) või kohandatud kandja ja modulatsioonina; lisakoskpaneelid mis tahes sagedusvahemikus samal ajajoonel ja värviskaalal; lairiba (barrage) segaja CW, kitsariba, chirp ja sobitatud müra kõrval; ribapõhine J/S ja efektiivne C/N0 muutmata spektraalse eraldatuse koefitsiendi ahelast

# text
seg-d9eb3e7e69c2 = LEO-PNT läbilend ja selle ribapõhine linkide eelarve nähtavuses olevate MEO GNSS-satelliitide vastu

# text
# c1: leo-pass
seg-d986e44443dd = Liik <c1/>: satelliidid kavandatud läbilennust, elementidest, SGP4 kaudu TLE-st või Walkeri konstellatsioonist failist constellation-design; ribapõhiselt ja epohhi kaupa vaatenurgad, kaugus, suletud kujul kauguskiirus ja kaugusekiirendus (kontrollitud iga jooksutusega tsentraalsete vahede vastu ja esitatud), vabaruumikadu, EIRP isoflux-, Gaussi või lameda mustriga, plaaster-, poolkera- või isotroopne kasutaja antenn, ITU-R P.676-10 lisa { "2" } gaasiline vaigistus, P.618 vihm ja sintillatsioon, P.2109 hoonesisenemise kadu, polarisatsiooni mittesobivus, süsteemi müratemperatuur, C/N0, Doppler ja Doppleri kiirus ning esimest järku viivitus Klobucharist või vertikaalsest TEC-ist kaldtee TEC, skaleeritud satelliidi all olevaks Chapmani osaks; ionosfäärivabad paarid koodimüraga läbilennu tipul; Galileo või GPS kandjad nende liidesedokumentide vastuvõetud võimsustest sama vastuvõtja kaudu

# text
seg-95a077a980b6 = Nimega LEO-PNT süsteemide eelseaded esitatud allikatega ja süsteemist sõltumatu mootor

# text
seg-4b47033cda24 = leo_link::presets: üldine mitme riba (UHF, L, S, C), üldine C-riba, Xona Pulsar X1/X5, Iridium STL, Starlink ainult Doppleri oportunistliku signaalina, CentiSpace ja valikuline Celeste IOD eelseade, igaühe allikas märgistatud PUBLIC (URL-iga), REPRESENTATIVE või WORKSHOP, workshop'i oma valikulises Celeste IOD eelseadefailis, kompileeritud sisse ainult siis, kui see fail on olemas; iga riba ja orbiit on stsenaariumis üle kirjutatav ja stsenaarium ei pruugi nimetada üldse ühtegi eelseadet

# text
seg-a39f34973373 = Väikese energiakuluga positsioneerimine: aeg esimese fiksini ja energia fiksi kohta töötsükli suhtes

# text
# c1: leo-pass
seg-f3b9b669a76f = leo_link::energy ja liigi <c1/> jaotis [iot]: Doppleri kiirusega piiratud koherentne integreerimine, ruutseaduse mittekoherentsed summad tuvastusläveni, Doppleri binide otsing orbiidi staatilise kasutaja mähise (külm) või abistatud akna (kuum) üle, paralleelne või järjestikune koodiotsing, navigatsioonisõnumi aeg külmstardil, energia fiksi kohta ja aku eluiga üle fiksiintervallide, iga LEO riba ja GNSS-signaali jaoks

# text
seg-8121e7db3db3 = Läbilennu keskel tehtav LEO navigatsioonisõnumi uuendus koos pidevuse kontrolliga lülituskohal

# text
# c1: leo-navmsg
seg-34c310d85c42 = Liigi <c1/> midpass-update analüüs: kõrgeim läbilend kasutaja kohal otsinguvahemikus, sõnumid globaalse ajakava järgi kasutusperioodidega, mis on tsentreeritud nende sobitusakendes, ja igal lülitusel 3D asukohahüpe, kellahüpe, kasutaja pseudovahemaa hüpe, suurim hüpe üle mis tahes nähtava vaatekiire (suletud kujul üle nadiirikooni), kaugusviga enne ja pärast ning PASS/FAIL läve vastu

# text
seg-7635a8339e78 = LEO navigatsioonisõnumi dokumenteeritud binaarkodeering koos kvantimisvea eelarvega

# text
seg-e4d9b16a2dc4 = leo_navmsg::codec: Kshana enda kaader (preambul, versioon, mudel, pikkus, kasulik koormus, CRC-24Q) nelja efemeriidimudeli, kellapolünoomi, SVID-i, andmete väljaande (issue of data), riba, tervise, Klobuchari komplekti, NeQuick-G koefitsientide ja UTC parameetrite jaoks, iga väli esitatud laiuse ja sammuga (field_table), kvantimine vahemikust keeldumisega ning suurima asukoha ja kella muutuse eelarve, mille iga välja poolsammu muutus kehtivusakna jooksul teeb

# text
seg-17ca41d7fd71 = LEO navigatsioonisõnumite RINEX-4-laadsed ja CSV eksportid

# text
seg-185e12ccef0d = leo_navmsg::text: RINEX-4-laadne plokk (> EPH kirje päis, satelliidi ja epohhi rida kolme kellaliikmega, D19.12 saatejooksu orbiidiread) süsteemitähega L ja kirjetüüpidega KP16, KRAC, LU22 ja APOL, igas päises märgistatud Kshana laiendusena, mis ei kuulu standardisse RINEX { "4.02" }, ja CSV tabel vaikeveeruskeemi ja eelseadeskeemidega, igaühel importija

# text
seg-e79047fc95af = ATOMIC nullkellaga ECEF-polünoom ja sünteetiline viiekõrgune LEO mudelite võrdlus

# text
seg-e261843e35b1 = leo_navmsg::elements::EphemerisModel EcefPoly variant: teljepõhine ECEF-polünoom ilma kelliikmeteta, relativistlik liige avaldisest -2 r.v/c^{ "2" }, hinnatud juhitud kella vastu. Samuti mudelite võrdlusanalüüs (liu_comparison üle LIU2025_TABLE), mis sobitab 22-parameetrilise mudeli artikli viiel kõrgusel Kshana integreeritud orbiidi 20-minutilistel kaaredel ja trükib tulemuse avaldatud SISRE kõrvale

# text
seg-d2e18c8bdc14 = Positsioneerimine LEO Dopplerist, ühe ja mitme satelliidiga, kella triivi ja kiiruse olekutega

# text
# c1: leo-pvt
seg-de6cb3c06490 = Partii Gauss-Newtoni positsioneerimine kauguskiirusest analüütiliste osatuletistega (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), valikuna konstantne kasutaja kiirus, pinnakasutaja kõrguse pseudomõõtmine, summutatud sammud; formaalne kovariatsioon tões; piki-, risti- ja vertikaalprojektsioonid; ühe läbilennu täpsus kasutaja ristsuunalise nihke suhtes; lähima lähenemise aeg. Liigi <c1/> režiim doppler lisab vea akna pikkuse suhtes ja ainult Dopplerit kasutava oportunistlike signaalide režiimi (starlink-sop eelseade)

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
seg-9306f1c06081 = LEO-abistatud aja edastamine UTC-le C/N0 ja vastuvõtja ostsillaatori suhtes

# text
# c1: leo-pvt
seg-c618feb01476 = Kellamõõtmised igalt nähtavuses olevalt LEO satelliidilt teadaoleval asukohal, kombineeritud pöördvariatsiooniga pseudovahemaa mürammudelist, filtreeritud kahe oleku (faas, sagedus) Kalmani filtriga, mille protsessimüra on ostsillaatoriklassi valge ja juhusliku käigu sagedusmüra (slot_timing::ClockNoise, clock_state::ClockClass; holdover::coast_phase_variance rannikudispersioon), samadest tasemetest seemnestatud tõeline kell ning IS-GPS-200 jao { "20.3.3.5.2.4" } süsteemiaja-UTC-ks avaldis koos saatenihke ebakindlusega, mis on lisatud jooksukohase nihkena; liigi <c1/> režiim timing pühib ostsillaatoreid ja C/N0 nihkeid

# text
seg-d92777401093 = Nimega LEO PNT süsteemid valikuliste andmeeelseadetena, igaühel oma allikas

# text
seg-5130bfe2410c = Süsteemist sõltumatud sisendid: iga süsteem on Walkeri kestad, selged elemendid või GNSS-i eelseade, signaal (kandja, kiibikiirus, ribalaius, vastuvõetud võimsus või C/N0 vahemik), SISRE, Doppleri sigma ja kellamudel; eelseaded täidavad ainult selle, mille stsenaarium välja jätab, üks fail kummagi kohta, allikatega märgistatud PUBLIC (URL-iga), WORKSHOP või DERIVED ja avaldamata väärtused loetletud esindlikena: Xona Pulsar X1/X5, Iridium STL, Starlink oportunistlikud signaalid, CentiSpace, esindlik C-riba süsteem, ATOMIC nullkella efemeriidimudel ja üks workshop'ist tuletatud eelseade valikulises Celeste IOD eelseadefailis, mis jäetakse välja selle faili ja selle stsenaariumide kustutamisega

# text
seg-dec52b5b9cd6 = Üks LEO-PNT süsteem otsast lõpuni: signaalikavand, läbilennu linkide eelarve, navigatsioonisõnum ja liidetud positsioneerimine, iga etapi väljund antakse edasi järgmisele

# text
# c1: leo-pnt-chain
seg-39443b31d418 = Liik <c1/>: leo-signal kavand (avalik eelseade või reasisene) seab leo-pass riba keskme, ribalaiuse, kiibikiiruse ja EIRP jaotuse; läbilend annab jälgitava komponendi C/N0 ja ribapiiratud koodivärina epohhi kaupa; vähimruutude C/N0 sirge sin(kõrgus) suhtes, leo-navmsg sõnumi SISRE (sobitatud läbilennu satelliidi orbiidil, pluss esitatud orbiidi määramise liige ruutsumma juurena) ning kavandi kandja ja kiibikiirus lähevad iga leo-pvt ühisfiksi LEO süsteemile ja valikuliselt leo-ppp LEO juhtudele; iga üleandmine esitatakse oma väärtuse ja ühikuga

# text
seg-55ca63edff02 = Spuufimise tuvastamine LEO Doppleri ja läbilennu geomeetria kooskõla põhjal

# text
# c1: leo-pass
# c2: [spoofer]
seg-b12fc1728220 = Liigi <c1/> jaotis <c2/>: spuufija võltsib enesekooskõlaliselt kauguses ja kauguskiiruses väidetud asukohas nähtavad signaalid, mis hüppab ja/või lükatakse tõelisest pärast alustamist (LEO riba kohta ja MEO GNSS-i signaali kohta); vastuvõtja ennustab iga kauguskiiruse saateorbiidist ja sõltumatust eelnevast asukohast ja kiirusest ning testib mõõdetud kauguskiirusi üldistatud vähimruutude hii-ruut statistikuga epohhide aknas (kella triiv häiriv parameeter või eeljaotusega), GNSS-i kanalitel, LEO kanalitel ja kõigil kanalitel, koos sagedussilmuse termilise müraga C/N0-st (Kaplan & Hegarty { "2006" }, jagu { "5.6.2" }); tuvastustõenäosus mittetsentraalsest hii-ruut seadusest esitatud valehäire tõenäosusel, tuvastus kuulutatakse esitatud tuvastamata jäämise tõenäosusel

# text
seg-5f341f85ac07 = Spuufimise tuvastamine mitme riba LEO signaali ribadevahelise kooskõla põhjal

# text
# c1: [spoofer]
seg-2f9c4d351b0f = Iga LEO satelliidi ja kaugusmõõtmise ribapaari jaoks moodustab jaotis <c1/> geomeetriavaba pseudovahemaa kombinatsiooni, eemaldab vastuvõtja ionosfäärimudeli ja testib selle epohhist epohhi sammu kahe riba koodimüra ja esitatud talutava modelleerimata ionosfäärikiiruse suhtes (kahepoolne Gaussi, täpne tuvastustõenäosus); spuufija, mis võltsib mõned ribad, kuid mitte teised, või iga riba ilma ionosfäärita, nähakse alguses; see, mis võltsib iga riba ja simuleerib ionosfääri, jääb märkamata, mida tulemus ütleb

# text
seg-97dbcd5f2728 = Ionosfääri sondeerimine: kaldtee TEC LEO läbilennu kahe riba viivitusest

# text
# c1: leo-pass
seg-844de34fd2f3 = Iga liigi <c1/> satelliidi ribapaari kohta annab aruanne kaldtee summaarse elektronsisalduse, mille geomeetriavaba koodikombinatsioon läbilennu tipul taastab, (P2 - P1) f1^{ "2" } f2^{ "2" } / ({ "40.3" } (f1^{ "2" } - f2^{ "2" })), ja selle 1-sigma kahe riba termilisest koodimürast, nii et mis tahes mitme riba LEO-PNT kavandit saab võrrelda ionosfäärisondina

# text
seg-1fdbb476c8ab = Merenduse usaldusskoor: monitoride tõendite liitmine 0-100 skooriks ja selle kolmeks ribaks

# text
seg-0d76b33144f1 = Iga monitor taandab oma tõendid statistiku ja läve suhteks; skoor on { "100" } miinus monitoride summa kaal korda suhte piiratud lineaarne tõus ({ "0" } kuni { "0.5" }, { "1" } väärtusel { "1.5" }), piiratud vahemikku { "0" } kuni { "100" } ja ümardatud täpsusele { "0.1" }, ribadega väärtustel { "90" } ja { "55" }; iga epohh loetleb monitorid, mis arvasid maha, ja nende punktid.

# text
seg-51640405c9b7 = Usaldustelemeetria SIEM-sündmused: Log Event Extended Format (LEEF) üle syslogi

# text
seg-1b3245506847 = Ribamuutuse (või epohhipõhised) sündmused Log Event Extended Format { "2.0" } kasulike koormustena RFC { "5424" } ümbrises UDP või TCP kaudu, dokumenteeritud väljakaardistusega.

# text
seg-c04042b0270a = JammerTest { "2024" } andmestikul kalibreeritud vastuvõtja usalduse häirelävid

# text
seg-32ad0b0da818 = receiver_trust::calibration::run_dataset: C/N0-languse, AGC ja segamisindikaatori monitoride eelregistreeritud kalibreerimine avalikul JammerTest { "2024" } andmestikul (Zenodo { "15911589" }, GPL-3.0-or-later, toodud käitusajal, kunagi kaasa panemata): kausta kohta { "1" } s ajajoon failidest mon_rf.csv ja rinex.csv, monitorid käivitatud ühe korra, iga kalibreerimisjärgne epohh märgistatud puhtaks või segamiseks kausta attack_log järgi (nihutatud CEST-ilt UTC-le, { "60" } s kaitse), iga lävi pühitud fikseeritud ruudustikul, valitud väikseim lävi koondatud puhta valehäire tõenäosusega kuni { "0.01" } ning kaust-välja-jäetud tagasihoitud arvud; UBX lugeja ristkontroll. Valik tarnitakse ainult valikulise profiilina [monitors] profile = "jammertest-2024-calibrated" (cn0_drop_db { "1.5" }, agc_k_sigma { "3.5" }, jam_ind_threshold { "29" }); vaikereegel ja iga väljund ilma selleta on muutmata

# text
seg-65a8361b4a22 = Jammertest’i hindamine: vastuvõtja logi, mida hinnatakse iga ajastatud katse kohta (tuvastusviide, tuvastamata jäänud häired, valehäired, taastumisaeg) avaldatud katsekava suhtes

# text
seg-98d8c39f47ae = jammertest::{ "{" }plan, score, dataset{ "}" } (kshana jammertest import|score): NPRA katsekataloog ja edastuskava (MIT, toodud kindlaksmääratud SHA-256-ga, kunagi ei lisata koodibaasi koopiana), mida loetakse ajastatud tõena, kataloogi id-d säilitatud; receiver-trust käitus, mida hinnatakse iga katse kohta (esimene alarm miinus kavandatud algus, tuvastatud/hiline/tuvastamata jäänud tolerantsi suhtes, aeg esimese alarmivaba lõiguni, alarmid väljaspool iga pesa ja selle kaitseintervalli), koos allkirjastatud tõendipaketiga, mis kannab tulemuskaarti. Ajakava on kavandatud pesad, mitte salvestatud eetriaegu

# text
seg-ee99388f7b15 = compliance (kshana compliance-report): Kshana väljundite vastendus avalike raamistike klauslitele ainult numbri järgi, täidetud antud käituste põhjal; tulemus loetakse võimekuse kasuks ainult siis, kui see kannab tõendit, mida vastendus nimetab, tühi hulk ei tõenda midagi ja sõnastus on „toetab tõendeid (supports evidence for)“; aruanne ei ole järeldus, et mõni raamistik on täidetud, ega kellegi antud hinnang või kinnitus.

# text
seg-98c360d82d56 = Merendusintegratsioonid: Signal K pistikprogramm, OpenCPN värava voog ja skoori paneel, etalonehitus

# text
seg-7af9ce566646 = Usaldusskoor, vöönd, põhjused, värava olek ja vastuvõtja teatatud asukoht, mis avaldatakse Signal K serveris asukohas navigation.gnss.kshana koos hoiatuse, alarmi ja tavalise teavitusega (integrations/signalk); värava NMEA voog, kus fiks on märgitud kehtetuks, kui usaldus on kokku varisenud, ja tsükli kohta üks PKSHT lause, mida pakub OpenCPN-ile TCP kaudu värav ise või väike relee, ning natiivne OpenCPN skoori paneel, mis loeb PKSHT lauset (integrations/opencpn); ning systemd üksused ja konteiner, mis käitavad väravat (deploy/reference-build). Kus need näitavad väljundit, kannavad need nõuandvat avaldust: Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

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
seg-7b1ae0c7ca28 = LunaNet AFS kolmandad koodid ja sõnumikiht (SB1 BCH, CRC-24Q, põimur) LSIS-AFS V1.0 suhtes

# text
seg-45215637ad2d = iq::signals::lunanet::afs_q_tertiary_bits, afs_q_tiered; iq::lunanet_afs: sünkroniseerimismuster, SB1 BCH({ "51,8" }) kodeerija ja 256 hüpoteesiga dekooder, CRC-24Q, { "60" } x { "98" } plokkpõimur, sümbolivoo kontrollija (kshana lunanet-afs-check) ja testvoo generaator kohatäite alamkaadritega. Alamkaadrite { "2" } kuni { "4" } kiirusega 1/2 LDPC kodeerimist ei ole teostatud (selle maatriksid on eraldi lisas).

# text
seg-0d7b17524c04 = Standardipaketid: stsenaariumid, mida hinnatakse enne käitust fikseeritud lävede suhtes

# text
seg-6e5c04fd4531 = standards_pack (kshana standards-pack): DHS Resilient PNT raamistiku katseprofiilid tasemetele { "1" } kuni { "4" }, IMO MSC.1/Circ.1575 täpsustasemed ja terviklikkuse hindamine ning ICAO Doc { "9849" } lisa F jälgimise, hindamise ja leevendamise paketid: iga katse käitab kaasasolevat stsenaariumi liiki ja võrdleb tulemusvälju paketis fikseeritud lävedega ning katsed, mis vajavad vastuvõtja logi, on loetletud kui NEEDS INPUT ja neid ei hinnata.

# text
seg-8a8f2c85e0c3 = Laboratoorne edasi-tagasi tõendipakett (stsenaarium, katsetingimused, vastuvõtja logi, skoor)

# text
seg-a090b06a920d = evidence::roundtrip (kshana evidence round-trip) ja kshana.test-conditions/1 vastuvõtja logi eksport käsust kshana bench-export: allkirjastatud pakett, mis salvestab stsenaariumi räsi, fikseeritud tingimuste räsi, logi räsi ja skoori fikseeritud sündmuste suhtes ning keeldub tingimustest, mis ei lähe kokku hindamissündmustega, või logist, mille räsi ei ole fikseeritud räsi. Signaali ei kirjutata, taasesitata ega ajastata.

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
seg-849393517c04 = NovAtel OEM7 ASCII- ja binaarlogid (BESTPOS, RANGE, RXSTATUS) receiver-trust jaoks

# text
seg-7e0021922025 = Loeb BESTPOS-i (asukoht), RANGE’i (C/No signaali kohta) ja RXSTATUS-t (vastuvõtja segaja lipp epohhi enda aruandena) ASCII- ja binaarsetest OEM7 logidest, CRC-ga kontrollitud, ainult lugemiseks (receiver_trust::machines::novatel).

# text
seg-a45c53a9deb3 = RTCM { "3" } MSM4 ja MSM7 kandja-müra suhte lugeja receiver-trust jaoks

# text
seg-0a0c9976236f = Loeb RTCM { "3" } MSM4 ja MSM7 sõnumite (GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou, NavIC) iga signaalilahtri C/N0 kaadrivoost, CRC-24Q-ga kontrollitud (receiver_trust::machines::rtcm3). Paigutused BSD-litsentsiga pyrtcm tabelitest, mitte RTCM standardi tekstist.

# text
seg-cd554a7c1649 = GNSS-SDR monitori adapter receiver-trust jaoks

# text
seg-22b587ac642d = Loeb GNSS-SDR Monitori (Gnss_Synchro) ja PVT-monitori sõnumeid, mis on edastatud JSON-ridadena proto väljanimedega, kanalipõhiseks C/N0-ks, fiksiks, kasutatud satelliitideks, HDOP-iks ja taevaks (receiver_trust::machines::gnss_sdr; integrations/gnss-sdr/relay.py).

# text
seg-217e5953c128 = IMU logi sissevõtt, güroskoobi suunasisend ja hübriidandurite parameetrite Alani sobitus

# text
seg-9dadc819daef = Loeb IMU CSV-d (dokumenteeritud veerud või EuRoC paigutus); integreerib pöörlemiskiiruse suunaks, mida suuna-kursi monitor loeb ([log.imu]); ning sobitab hübriid- ja liitstsenaariumide kiirendusmõõturi ja güroskoobi müraparameetrid paigalseisu logist kattuva Alani hälbe abil (imu-fit).

# text
seg-15a852a2dcb0 = Home Assistant MQTT avastus ja olekueksportija usaldustelemeetria jaoks

# text
seg-6d6b07b26966 = JSON olekudokument ja Home Assistant MQTT avastussõnumid usaldusvoo jaoks, trükitud tekstina igal pinnal ja avaldatud MQTT { "3.1.1" } QoS { "0" } kaudu CLI-ga (telemetry::mqtt; trust-telemetry --mqtt-tcp, --print-mqtt, format mqtt).

# text
seg-68caf86157c2 = ROS { "2" } receiver-trust pakett ja gnss_lib_py sild

# text
seg-e7d7d99fe538 = ROS-ita sild, mis kirjutab fiksi- ja satelliidisõnumid NMEA-na ja hindab neid Pythoni sidumise kaudu (integrations/ros2/kshana_trust), ning gnss_lib_py NavData sild receiver-trust-i rtklib-pos vormingu kaudu (integrations/gnss_lib_py).

# text
seg-c3c260b7063e = Testid
