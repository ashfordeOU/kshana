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

# text
# c1: docs/MODELLED-RATIONALE.md
seg-b24486eee0fb = Allikas: <c1/>

# text
seg-34d1304c9555 = Modelleeritud võimekused — põhjendus

# text
# c1: ExternalDataset
seg-144f441bf52b = Need võimekused on realiseeritud avaldatud või esimeste printsiipide füüsikast koos testidega, kuid on <b>ausalt märgitud MODELLED</b> — neid ei ole kontrollitud sõltumatu välise sõltumatu etaloni vastu sätestatud tolerantsiga. Maatriksi invariantsustestid jõustavad, et ainult <c1/> toetatud read võivad olla VALIDATED, nii et siin ei saa midagi vaikselt ülendada. Iga rida ütleb, miks see jääb modelleerituks.

# text
seg-0630e39b4de3 = Etaloni liik

# text
seg-bb023086bbe3 = Miks see jääb modelleerituks

# text
seg-dd6ba97ce971 = InternalConsistency

# text
seg-bac242dada9c = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: Orekit { "12.2" } ei sisalda limbi-tumenemisega valgustussuhet. Kontrollitud ainult sama seaduse kinniste kujude vastu

# text
seg-33d506570c1b = srp_shadow::tests (rõngakujuline kinnine kuju, ühtlane seadus, mis taastoodab koonilise varju, täis päikese ja täisvarju piirid)

# text
seg-91fe516eabd4 = ExternalDataset

# text
seg-cb2cbb31b091 = alamväidet kontrollitakse väliselt, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Orekit { "12.2" } (Apache-2.0) NumericalPropagator/DormandPrince853 koos ThirdBodyAttraction ja SolarRadiationPressure Orekiti enda DE440 lugejal (orekit-data lnxp1990.440), käitatud eraldi programmina; kshana loeb bait-baidilt SPICE-iga kontrollitud lõiku NAIF-i failist de440s.bsp. Lävendid eelregistreeritud failis xval/propagator-de440-orekit/PREREGISTRATION.md (22a5a01d). Orbiidi lävi ({ "0.5" } m) ja tundlikkuse kontroll on täidetud, kuid Päikese/Kuu asukoha lävi ({ "3" } m / { "0.2" } m) jäi mööda väärtustel { "6.39" } m / { "0.244" } m. SPICE, mis loeb sama tuuma selle täpsel TDB-l, jääb Orekitist mööda sama suurusega ({ "6.25" } m / { "0.240" } m), seega asub lõhe NAIF-i de440s tee ning Orekiti DE440 lugeja või ajaskaala vahel; põhjust ei eraldatud. Registreeritud ja fikseeritud, seega jääb rida MODELLED

# text
seg-13f8f557c721 = propagator (ForceModel::with_ephemeris, ForceEphemeris), ephem_provider

# text
seg-20f163c0cb8f = tests/propagator_de440_orekit_oracle.rs ({ "5" } juhtumit x { "25" } tunnipõhist olekut { "24" } h jooksul, LEO, GEO ja HEO, kolmas keha ning kolmas keha + SRP: halvim |dr| { "0.0170" } m, |dv| { "1.84e-5" } m/s; analüütilise jada kontroll jääb mööda { "9.96" } m; Päike { "6.39" } m ja Kuu { "0.244" } m Orekiti DE440 asukohtadest, registreeritud möödalaskmine); propagatori ühiktestid (pakkuja keeldumine, varulahenduse loendamine, mida jagatakse kloonide vahel)

# text
seg-b55bcab6f986 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole geopotentsiaali mõju jaoks. { "24" } koefitsienti on ümber kirjutatud GFZ STR06/01 tabeli { "1" } mudelist N1 ja kontrolliti rida-realt aruande vastu (SHA-256 890865ae); astmeid { "0" }, { "1" }, { "7" } ja { "8" } ei kasutata. Ray ja Ponte ({ "2003" }) ei trüki sfäärilise harmooniliste tabelit, seega ei võrreldud teist allikat

# text
seg-448f4acf5c7b = tides, propagator, precise_od

# text
seg-4014447d4bcc = tides::tests (S1 liige on ööpäevane, pöörab veerand päevaga { "90" } kraadi ja omab iga rea koormusteguri amplituudi; füüsikaline suurus LEO-l); propagator::tests::the_s1_air_tide_flag_adds_exactly_the_s1_acceleration

# text
seg-a192b0f512cb = alamväidet kontrollitakse väliselt, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Orekit { "12.2" } (Apache-2.0) HolmesFeatherstoneAttractionModel ja pyshtools { "4.14.1" } (BSD-3-Clause) MakeGravGridPoint, käitatud eraldi programmidena; lävendid eelregistreeritud failides xval/high-degree-gravity/PREREGISTRATION.md (276c869f) ja xval/cowell-tesseral-200-orekit/PREREGISTRATION.md (0aa312a6). Orekit nõustub kõikjal, kus see on määratletud, kuid pyshtools jääb oma eelregistreeritud läviga mööda kahes poolusele lähedases punktis (kuni { "7.3e-10" } m/s^{ "2" }; 50-kohaline mpmath kontroll paneb vea pyshtoolsi), poolustelje täpselt peal puudub etaloniväärtus ja { "24" } h orbiidi eelregistreeritud 70. astme tundlikkuse kontroll jäi mööda ({ "0.726" } m vastu > { "1" } m). Iga möödalaskmine on registreeritud, mitte ära häälestatud, seega jääb rida MODELLED

# text
seg-8fda2ee90583 = gravity_sh, propagator (FieldEvaluator)

# text
seg-3f7d3003656e = tests/gravity_sh_high_degree.rs (Orekit { "8" } väljaspool telge punktis: maks |da| { "2.2e-17" } m/s^{ "2" } väärtusel N = { "70" }, käivitatakse alati; { "3.5e-17" }, { "3.9e-17" } ja { "7.3e-17" } m/s^{ "2" } väärtustel N = { "200" }, { "360" }, { "2190" }, andmetest sõltuv KSHANA_EGM2008_GFC); tests/cowell_tesseral_200_orekit_oracle.rs ({ "24" } h 200x200 orbiit, andmetest sõltuv: halvim |dr| { "0.1317" } m, |dv| { "1.45e-4" } m/s; 70. astme kontroll { "0.726" } m); gravity_sh ühiktestid (kokkulangevus klassikalise hindajaga { "1e-13" } täpsusega astmel { "70" }, lõplik vahe ja poolusepidevus 2190. astme väljal, alatäituv 2190. astme liige laiendatud eksponendiga arvutuse vastu)

# text
seg-84a9851b838c = alamväidet kontrollitakse väliselt, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Orekit { "12.2" } (Apache-2.0) BatchLSEstimator kohandatud hetkeliste geomeetriliste RangeRate ja AzEl mõõtmistega (ristkontrollitud Orekiti TopocentricFrame vastu), käitatud eraldi programmina identsetel maskeeritud, algväärtusega vaatlustel. Lävendid eelregistreeritud failis xval/od-measurements-orekit/PREREGISTRATION.md (0cf9076). Iga lävi on täidetud peale B4, mürata oleku kokkulangevus { "1" } cm, mis jäi mööda { "4" } stsenaariumist { "2" }-l ({ "1.46" }, { "1.74" } cm): Orekiti enda mürata hinnang asub nii kaugel selle simuleeritud tõest (põhjust Orekiti poolel ei eraldatud). Registreeritud ja fikseeritud, seega jääb rida MODELLED. Ei modelleerita: valgusaega, aberratsiooni, refraktsiooni, Maa pöörlemist, järjestikfiltrit nende mõõtmistüüpide jaoks

# text
seg-296a6fe8585b = orbit_determination (determine_orbit_batch_tracking, propagate_with_stm, is_visible), batch_ls (gauss_newton_analytic)

# text
seg-9493e02e3cd1 = tests/od_tracking_measurements_reference.rs ({ "8" } stsenaariumi: ulatuskiirus, az/el ja segu, LEO ja MEO, mürata ja algväärtusega sigma { "5" } m / { "5" } mm/s / { "1e-4" } rad, { "5" } ja { "10" } kraadi maskid, Orekit { "12.2" } vastu: nähtavad komplektid identsed; mõõtmisväärtused { "5.84e-8" } m, { "6.30e-10" } m/s, { "1.44e-13" } rad piires; STM { "1.2e-14" } suhtelise piires; müraga olekud { "1.74" } cm ja { "1.14e-5" } m/s piires; tüübipõhine järelsobituse RMS { "2.7e-4" } suhtelise piires; mürata kshana tõe vastu { "1.06e-8" } m; mürata kshana Orekiti vastu { "1.464" } ja { "1.740" } cm kahel stsenaariumil, registreeritud möödalaskmine { "1" } cm lävest); orbit_determination ja batch_ls ühiktestid

# text
seg-a5554f29b2d7 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: kaalud on modelleerimisvalik (SP3 vorming määratleb koodi ainult tootja täpsusnäitajana; seda loetakse siin telje kohta ühe sigmana). Olemasolevad registreeritud ametkondlikud jooksud on muutmata

# text
seg-f5a76ae1fcaa = sp3, precise_od

# text
seg-39a552abfcab = src/sp3.rs ühiktestid; tests/agency_galileo.rs::galileo_e11_sp3_accuracy_weighted_fit (kinnitatud { "8" } h ESOC testikomplekt, sigma { "0.032" } m päise eksponendist { "5" }: Tier-1 3D RMS { "0.132" } m muutmata, Tier-2 { "0.035" } m vastu { "0.070" } m sigmal { "1" } m, muutus tuleneb ümber tasakaalustatud empiirilisest a priori piirangust); tests/agency_swarm.rs (Swarmi toode ei kanna täpsuskoode ja langeb tagasi, fikseeritud)

# text
seg-a5ad470a4816 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ainult sisemine kooskõla. Iga avaldatud väli on määratletud selle tootja kehaga fikseeritud süsteemis (GMM-3 Konopliv et al. { "2006" } Marsi süsteemis, GL0660B DE421 Kuu peateljestikus), samal ajal kui välja hinnatakse IAU süsteemis; nihet ei modelleerita

# text
seg-409f709cceb3 = gravity_pds, body, propagator, mars_frame

# text
seg-0fe6532ca74d = tests/planetary_gravity_pds.rs::a_shadr_field_attached_to_a_body_drives_the_propagator; gravity_pds::tests::with_gravity_field_is_opt_in

# text
seg-eff90f999826 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine ringkäik ja ICD teadaolevad vastused; kolmanda osapoole dekoodrit ei ole käitatud (RTKLIB/GNSS-SDR testikomplekt, mis loeb KSHANA_NAVMSG_ORACLE_JSON, on andmetest sõltuv). MODELLED

# text
seg-e3d75762b979 = gnss_navmsg (gps_cnav, gal_inav, gal_fnav, fec)

# text
seg-dbe0dd5dcf47 = gnss_navmsg::tests (CRC-24Q kontrollväärtus 0xCDE703; konvolutsiooniline impulssvastus; Viterbi parandab süstitud vigu; paigutuse laiused); tests/gnss_navmsg_roundtrip.rs (välja algusbitid võrduvad ICD bitinumbritega; kodeerimine -> FEC -> põimimine -> Viterbi -> dekodeerimine ringkäigud poole LSB piires); tests/gnss_navmsg_galileo_brdc_grid.rs (IGS BRDC 2018-133 Galileo kirjed LSB ruudustikul, halvim { "3.6e-3" } LSB; eelregistreeritud satelliitide arvu lävi jäi mööda, { "15" } { "20" }-st, FINDING)

# text
seg-81b76a6d1bcd = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — FINDING avaldatud ITRF2020 WTZR koordinaadi vastu: eelregistreeritud lävendid (silutud mediaan ja p95 kuni { "0.6" } x toore; tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md) jäid mööda, suhted { "0.718" } ja { "0.923" }; allesjääv meetritasemel viga on nihkelaadne (C1C koodinihe, antenn, tõus-mõõn, pikaperioodiline mitmeteelevi), mitte valge müra, mida silumine eemaldab. MODELLED: filtri statistikat kontrollitakse sisemiselt

# text
seg-b81cd9204f64 = hatch (HatchFilter), pvt (assemble_epoch_precise_smoothed, CarrierSmoother)

# text
seg-e892fffaaf07 = hatch::tests (müravaba läbilaskmine; valge müra dispersioon 1/(2N-1); taaskäivitused); tests/hatch_wettzell_oracle.rs::hatch_finding_is_pinned (WTZR 2025-02-24 01-06 h, { "600" } epohhi, N = { "100" }: mediaan 3-D viga { "1.553" } -> { "1.116" } m, p95 { "3.473" } -> { "3.207" } m)

# text
seg-1bbd39c17347 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — püüab ümberkirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Vormingu standardi järgimine tegelikul avaldatud RINEX { "4.00" } failil (tagasi loetud väärtused võrduvad faili trükitud literaalidega) ja spetsifikatsioonist tuletatud päisel; sõltumatut lugejat ei käitatud, seega MODELLED

# text
seg-bdda05057c91 = rinex_obs (parse_obs)

# text
seg-44b76c5cb13e = tests/rinex4_obs_mao0.rs (IGS MGEX RINEX { "4.00" } faili MAO000USA_R_20231980000_01D_30S_MO esimesed { "4" } epohhi, { "58" } satelliiti, { "7" } süsteemi: päisekirjed ja esimese epohhi väärtused võrduvad avaldatud literaalidega); rinex_obs::tests::parses_a_rinex_4_header_with_its_new_records (sünteetiline { "4.02" } päis spetsifikatsioonist)

# text
seg-5afb3c4bf171 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Eelregistreeritud (7aa264b, 110fef9) IGS MGEX täppisorbiidi vastu koos GEO-satelliitidega; ükski selline toode ei olnud selle koostanud sessioonist kättesaadav, seega on võrdlus ootel ja rida on MODELLED (kontrollitud ainult avaldatud nominaalsete GEO-kohtade vastu)

# text
seg-439e23a5567e = rinex (RinexEphemeris::sv_position_ecef_bds_geo, NavParseOptions)

# text
seg-8c86b4b3a731 = tests/bds_geo_broadcast_oracle.rs (tegelikud C01-C04 kirjed: geostatsionaarne raadius, pikkuskraadid 140.02/80.04/110.55/159.99 kraadi avaldatud kohtades, |laiuskraad| { "2.13" } kraadi kaldega vs { "6.65" } ilma; eelregistreeritud edastatud efemeriidi ja täpse SP3 võrdlus on andmetest sõltuv (KSHANA_BDS_GEO_SP3) ja seda ei ole käivitatud); rinex::tests

# text
seg-70f61250d256 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: mõõtmised sünteesitakse filtri kasutatavatest mudelitest (χ² NEES/NIS algväärtuste (seed) lõikes, müravaba koondumine, libisemise süstimine). MODELLED; ei võrrelda ei tegelike vastuvõtja andmete ega kolmanda osapoole filtriga

# text
seg-75c2ea59f607 = fusion::carrier_tc (run_carrier_tc, CarrierTcCfg), fusion::trajectory (truth_epochs)

# text
seg-e27a18b3aae9 = tests/fusion_carrier_tc.rs (8-kujuline sõit: püsiv 3-D RMS { "0.025" } m kandelainega vs { "0.470" } m koodiga identsetel mõõtmistel; { "12" } algväärtuse (seed) keskmine NIS/dof { "1.00" } ja püsiv NEES/dof { "0.92" }; 1-tsükline libisemine tuvastatakse oma epohhil ilma valehäireteta ja lahend jääb terviklikuks; edastatud parandite väljalülitamine tõstab koodivea { "0.51" } m-lt { "19.6" } m-ni (ionosfäär) ja { "8.0" } m-ni (troposfäär); müravaba käitus koondub { "0.3" } mm-ni)

# text
seg-6f3f6483690e = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine: iga paketi kvaliteedinäitajad oma tõe vastu ning lõdva ja tiheda sidestuse võrdlus identsetel sisenditel. MODELLED; auditi NaveGo võrdlust ei ole käivitatud

# text
seg-2811d9348db2 = fusion::pack (TightCfg, [tight]), scenarios gnss-ins-maritime / gnss-ins-rail / gnss-ins-aviation

# text
seg-3f9bc3b0027f = tests/gnss_ins_packs.rs (iga pakett: liitmine annab katkestuse ajal parema tulemuse kui vaba INS mõlema anduri puhul; raudtee: tihe { "5.3" } m vs lõtv { "12.9" } m navigatsiooniklassi puhul ja { "15.6" } m vs { "18.8" } m taktikalise klassi puhul katkestuse ajal, kättesaadavus { "0.97" } vs { "0.95" }; tihe tabel valideeritud); tests/gnss_ins_legacy_trajectory_pin.rs (lõdvalt sidestatud vaikeväärtus bitthaaval identne)

# text
seg-2c7c37506aab = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: tõde simuleeritud filtrite enda mudelitest (χ² NEES Monte Carlo algväärtuste (seed) lõikes, lahtisidestatud pakett identsetel sensoritel). MODELLED

# text
seg-726b35d3e247 = fusion::coupled (CoupledPntFilter, CoupledPntBiasFilter, CoupledPnt3d), fusion (run_coupled_suite), hybrid (CoupledCfg)

# text
seg-260ef8ae3823 = tests/fusion_coupled_filters.rs (3-D filter { "60" } algväärtuse (seed) kohta: teise poole keskmine NEES { "8.12" } { "8" } oleku kohta, viimase epohhi χ² summa oma { "95" } % vahemikus; { "0.1" } ns kellaparandus vähendab 3-D asendi sigmat { "5.58" } m-lt { "3.07" } m-ni; nihkefilter { "60" } algväärtuse (seed) kohta: χ²({ "5" }) summa vahemikus, nihe { "3" } sigma piires { "59" }-l { "60" }-st; fusion-pnt-coupled kallutatud kiirendusmõõtjatega: asendi p95 { "18.7" } m / { "90.0" } m ja terviklikkus { "1.00" } / { "0.97" } sidestatud vs { "430" } m / { "4060" } m ja { "0.006" } / { "0.000" } lahtisidestatud); fusion::coupled::tests; tests/fusion_coupled_pack.rs (fusion ja hybrid ilma [coupled] bitthaaval identsed)

# text
seg-0866862d2264 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine: jäiga keha kinemaatika samasused, CSV edasi-tagasi teisendus ja filtri enda kovariatsioon. MODELLED (tegelikku sõidulogi ei võrrelda)

# text
seg-10d9b01f3ab2 = fusion::trajectory (TrajectoryCfg, Trajectory, kinematic_imu, parse_truth_csv), fusion::pack ([trajectory])

# text
seg-5a6b5289a473 = fusion::trajectory::tests (koordineeritud pööre ei anna külgjõudu ja koormustegur on 1/cos φ; CSV import reprodutseerib lennatud profiili täpsusega { "1e-3" } m/s ja { "1" } m); tests/gnss_ins_trajectory_library.rs (iga profiil käivitub ja liitmine annab katkestuse ajal parema tulemuse kui vaba INS; iga profiil lendab oma nimetatud liikumise; suuna jälgitavus: asimuudi sigma { "240" } s järel { "1.27" } kraadi sirgel kruiisil vs { "0.039" } kraadi 8-kujulisel ja { "0.062" } kraadi peatumise ja liikumise vaheldumisel); tests/gnss_ins_legacy_trajectory_pin.rs (vana tulemus ja tõe räsid bitthaaval identsed)

# text
seg-5cb3b7bba7be = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Mõõdetud JPL Horizonsi rekonstrueeritud CAPSTONE'i efemeriidi vastu (NAIF -1176, CAPSTONE_merged, Kuukeskne ICRF, 2023-03-01..31 sammuga { "10" } min), sisse viidud bait-baidi haaval (tests/fixtures/capstone_horizons/, NOTICE.md), eelregistreeritud { "4e868170" } enne selle toomist, mõõtmisena läviväärtustega keskmisele geomeetriale. Mitte valideerimine: CR3BP jätab välja Päikese, Kuu ekstsentrilisuse ja CAPSTONE'i tehtud orbiidi hoidmise, seega kirjeldavad läved seda, kui esinduslik mudelorbiit on, mitte täpsust. Tulemused: docs/design/evidence/cap29d-capstone-nrho/RESULTS.md

# text
seg-5807e4274501 = cr3bp (differential_correct_halo, PeriodicOrbit)

# text
seg-adec908f7883 = tests/capstone_nrho_horizons.rs::cr3bp_nrho_matches_capstone_mean_geometry (CAPSTONE märts { "2023" }, { "4" } periluuni ja { "5" } apoluuni: periood { "6.5004" } d vs { "6.5699" } d ({ "1.07" } %, lävi { "3" } %), apoluun { "71 182" } vs { "71 215" } km ({ "0.05" } %, lävi { "5" } %), periluun { "3 385" } vs { "3 245" } km ({ "4.1" } %, lävi { "20" } %)); cr3bp::tests::reproduces_l2_southern_nrho_92_regime

# text
seg-30e946bde474 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla suletud kujuga: lineaarse Gaussi mudeli korral on vähimruutude kovariatsioon sigma^{ "2" } (H^T H)^-1 (Kaplan ja Hegarty (toim.), Understanding GPS: Principles and Applications, 2. tr, Artech House, { "2006" }, ptk { "7" }). Meetod ja tolerantsid { "0.36" } geomeetria kavandimärkme jaotisest { "5.2" }, fikseeritud eelregistreerimise commit'is enne esimest käitust: iga dispersioon { "5" } % piires ({ "5" } valimidispersiooni standardviga, kui N = { "20,000" }), iga RMS { "2.5" } % piires, ida-põhja korrelatsioon { "0.035" } piires (5/sqrt(N)), iga keskmine { "5" } standardvea piires, { "95" } % ellipsi osakaal vahemikus { "0.95" } +/- { "0.0077" } ({ "5" } binoomstandardviga); negatiivsed kontrollid (kahekordistatud PDOP; vead, mis kasvavad kui 1/sin(kõrgus) kaaluta Q suhtes) peavad ebaõnnestuma. KUIDAS SEE KOOSNEB: Q on orbit::dop tuuma kovariatsioonitegur, VALIDATED gnss_lib_py { "1.0.4" } vastu samadel { "8" } geomeetriatel failis tests/dop_reference.rs (rida 'GNSS geometry / dilution of precision'); see rida lisab sammu nendelt teguritelt meetriteni mootori lahendaja kaudu ega laena selle rea staatust. MIKS MODELLED: ühtegi välist andmekogumit ei kasutata; kokkulangevus näitab, et hindaja ja müra realiseerivad sigma x DOP õpikumudeli järgi, mitte et ühegi vastuvõtja viga võrduks UERE x DOP-iga, ja sigma_UERE on sisend

# text
seg-d38407c0a9ab = dop_error_mc (run_geometry, check, TOLERANCES); dop_error_ci (run, GEOMETRIES); pvt (solve_spp); orbit (dop, dop_cofactor)

# text
seg-01d0a7046f8e = tests/uere_dop_monte_carlo.rs (position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries: kõik { "104" } kontrolli läbivad esimesel käitusel pärast eelregistreerimist e50c88d2, halvim dispersioon { "3.2" } %, RMS { "1.6" } %, korrelatsioon { "0.012" }, keskmine { "2.2" } standardviga, ellipsi osakaal { "0.0039" }; negative_control_a_doubled_pdop_fails_every_geometry; negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries: mõlemad kontrollid ebaõnnestuvad nagu nõutud; position_error_is_sigma_times_dop_on_masked_skies: kavandimärkme kaks maskeeritud horisondijoone geomeetriat, 10sat-mixed taevas linnatänava ({ "4" } satelliiti, PDOP { "16.6" }) ja konteinerterminali ({ "9" } satelliiti, PDOP { "2.5" }) eelseadistuste all, kõik { "26" } kontrolli läbivad esimesel käitusel pärast eelregistreerimist 03999c11, tests/fixtures/dop/PREREGISTRATION-MASKED.md); tests/position_error_dop_ci.rs (esimene, eraldi kontroll nelja käsitsi valitud taeva peal (lahtine, koondunud, kanjon, pool taevast; sigma { "1" } m, seed 0x0D0B5EED) hii-ruut usaldusvahemikega { "1e-6" } koguulatuses { "20" } kontrolli kohta: suhted { "0.987" } kuni { "1.009" }, lahendaja enda PDOP/GDOP võrdub tuuma omaga täpsusega { "2.5e-12" }, ja negatiivsed kontrollid { "10" } % DOP-veale ning 1/sin(kõrgus) vigadele; käitatud enne eelregistreerimist, seega on see esitatud, mitte eelregistreeritud); dop_error_mc::tests; dop_error_ci::tests

# text
seg-d40d54b79e58 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: klassifikatsiooni kontrollitakse enda öeldud reeglite ja käsitsi tuletatud suhete vastu sissekirjutatud demologi sünteetilistel redigeerimistel, ja muutusteta kinnitused hoiavad { "0.35.0" } väljundeid: ükski skoor ei muutu, kui geomeetria pole halb; silt esitatakse alati. MIKS MODELLED: lävendid on valitud, mitte sobitatud (päritolu iga käitus geometry_model'is; IEC 61108-1 ja GPS SPS arvud nagu viidatud, mida tuleb kontrollida standardite tekstiga), ja puudub väline sildistatud andmekogum looduslikust geomeetria halvenemisest rünnakute vastu, mille vastu klassifikatsiooni valideerida. Tuletatud DOP kasutab uuesti orbit::dop tuuma, VALIDATED gnss_lib_py vastu, mille staatust see rida ei laena. Geomeetria klass on väide taeva kohta, mitte leid, et rünnakut ei toimunud

# text
seg-557c0aa72056 = receiver_trust (geometry: GeometryTracker, geometry_ratio, sky_ratio, geometry_points, GeometryLabel; score: DeductionClass, score_with; monitors; live); telemetry (sample, prometheus, syslog, otlp)

# text
seg-fd57dab04d68 = tests/natural_degradation_trust.rs (a_stated_skyline_reads_the_fjord_as_geometry: stsenaariumi scenarios/training/fjord-natural-degradation.toml sünteetilisel fjordi läbimisel arvatakse samad { "624" } epohhi maha nii öeldud [skyline]-ga kui ilma; sellega teatatakse sky-blocked { "680" } epohhil ({ "0" } ilma: asimuudilünga varuvariant ei näe kahepoolses fjordis midagi), open_fraction on { "0.758" } ja keskkonnaklassi epohhid vähenevad { "78" }-lt { "33" }-ni, ülejäänud on satelliitide kaod, mille öeldud horisondijoon jätab lahtiseks; väljaspool sündmust horisondijoon ühtegi skoori ei muuda); receiver_trust::geometry::tests (käsitsi tuletatud suhted lävendite juures, lävendi servad, tõus ja lagi, põhi, sildi servad, [geometry] ülekirjutused, DOP valideeritud tuumal, hoitud ja aegunud taevad, tundmatut ei oletata, signaali kadu, halva geomeetria tolerants, fiksi puudumise sentinellid); tests/geometry_trust.rs (õiglane maskeeritud taevas sildistatud ja skoorimata, halb maskeeritud taevas, madala kõrguse kadu, võimsuse langus, võltsitud HDOP, täielik signaalikadu, äratõmbamine halva geomeetria ajal, tundmatu geomeetria, sessiooni ülekirjutused, live skeem); tests/geometry_trust_no_change.rs (mõlemad näidissessioonid bait-baidilt identsed { "0.35.0" }-ga pärast lisatud võtmete eemaldamist); tests/geometry_corpus_identity.rs (iga sissekirjutatud laevade NMEA korpus, ka GPS-only lahtise taevana, ja meeskonnakoolituse stsenaariumid: bait-baidilt identsed { "0.35.0" }-ga, välja arvatud halvad epohhid, mis erinevad ainult geomeetria mahaarvamise poolest)

# text
seg-7e9cae219d72 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine: suletud kujusid kontrollitakse käsitsi arvutatud väärtuste vastu (öeldud tänava seinaharjade kõrgused, avatud otsa tingimus, öeldud punkti kõveruslangus). Välist sõltumatut etaloni pole: kavandimärge määratleb need taandamised kui MODELLED ja Orekit'i ElevationMask võtab tabeli, seega rea 'Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask' võrdlus loeb nende 360-punktilisi tabeleid sisenditena ega kontrolli neid

# text
seg-911ccf2cb486 = skyline (Canyon::cut_deg, Sector::contains, TerrainPoint::elevation_deg, reduce_terrain, SkylineCfg::build)

# text
seg-849ae7d82147 = skyline::tests (canyon_matches_hand_computed_wall_elevations; terrain_takes_the_curvature_drop; sectors_have_sharp_edges_and_wrap; a_preset_is_overridden_or_added_to_field_by_field; malformed_sections_are_refused)

# text
seg-7ade0dffb2d8 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Puudub: valitud ja öeldud mõõtmed, mitte ühegi tänava, sadama, fjordi ega terminali mõõdistus (tänava külgsuhe jääb Oke ({ "1988" }) vahemikku 0.5-2; fjord on lääne-Norra fjordide suurusjärgus; virnad kasutavad ISO { "668" } high-cube kõrgust). Test kontrollib eelseadistusi nende enda öeldud mõõtmete vastu, mis on ülekirjutuskontroll, mida valideerimisreegel ei arvesta

# text
seg-d5ba7b502aec = skyline (PRESETS, preset, preset_list)

# text
seg-ef3717bfca79 = skyline::tests (presets_carry_the_note_dimensions_and_provenance)

# text
seg-00884df89ab2 = ReferenceImpl

# text
seg-2ddc2b97e673 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Ühe kella DOP-tegurid tuginevad tuumale, mis on valideeritud gnss_lib_py { "1.0.4" } vastu (rida 'GNSS geometry / dilution of precision (DOP)'); selle rea enda kontrollid on sisemised: sky_geometry reprodutseerib orbit::dop ja dop_cov samal geomeetrial, ellips reprodutseerib analüütilise 2x2 omalahutuse, ECEF ja asimuut/kõrgus sisendid on kooskõlas ning algväärtustatud (seed) pilve RMS ja { "95" } % sisaldumine on geomeetriaga kooskõlas. ENU kovariatsioon ühe kellaga süsteemi kohta ja ellips on VALIDATED reas 'Horizontal error ellipse and per-system cofactor from the geometry covariance' (numpy, P2); siin jääb MODELLED kompositsioon: eelseadistuse levitamine esinduslikuks taevaks, Monte Carlo pilv (kontrollitud geomeetria vastu, mida see valimisse võtab, ehk enesekooskõla kontroll) ja pinnad. Satelliidikonstellatsiooni eelseadistused annavad esindusliku, mitte dateeritud taeva; Gaussi veamudel ja UERE on öeldud sisendid, mitte mõõdetud täpsus ega terviklikkuse piir

# text
seg-4e6101547ab1 = geometry; orbit (cofactor_from_los, dop_cov, dop); surface (sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg)

# text
seg-8ee1ff6b9975 = geometry::tests (ellipse_of_an_analytic_two_by_two_case; sky_geometry_equals_orbit_dop_on_the_same_visible_set; ecef_input_matches_azimuth_elevation_input; one_clock_per_system_adds_a_state_and_costs_geometry; monte_carlo_is_seeded_and_agrees_with_the_geometry; presets_propagate_and_are_seen_from_a_site); tests/dop_reference.rs (ühe kella tuum gnss_lib_py vastu)

# text
seg-0b5caf359b15 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Mitmeastmeline clock_state kovariatsioonirekursioon (sama koodibaasi ristkontroll); aluseks olev coast-variance ja holdover-i pöördamise tuum on väliselt valideeritud scipy vastu (vt 'Clock-holdover coast-variance & threshold inversion'). Klassipõhised punase müra põranda holdover-i arvud jäävad MODELLED

# text
seg-085cbc64bab2 = holdover

# text
seg-b31ed8fc6801 = holdover::tests (vs mitmeastmeline Kalmani kovariatsioonirekursioon; valge-FM täpne; edasi-tagasi); coast-variance tuum väliselt valideeritud failis tests/gnss_denied_clock_holdover_reference.rs (vs scipy Van-Loan/brentq)

# text
seg-8b8c97b664c2 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Mõõdetud kirjed, eraldi hoitud: { "11" } GPS Block IIF satelliidi IGS lõplikud kombineeritud { "30" } s kellad perioodil 2026-03-01 kuni { "14" } (aken, mida ükski test polnud avanud; IGS, avatud viitega) ja JammerTest { "2024" } u-blox ZED-F9P vastuvõtja oma mitteskooritud statsionaarsetes sessioonides (GPL-3.0-or-later). D9 väline võrdlus (eelregistreeritud 2ec76864, iga kaardi prognoositud / mõõdetud Alani hälve vahemikus [1/1.5, { "1.5" }] selle sobitatud keskmistamisaegadel), leid (jääb MODELLED): { "10" } { "11" }-st GPS IIF kaardist on läve piires; G27 on kahetunnisel skaalal optimistlik ({ "0.662" } juures { "7680" } s, halvim tegur { "1.510" }), perioodiline tunniskaala viga, mida astmeseaduse kaart ei kanna. Vastuvõtja TCXO kaart on blokeeritud: väljaspool logitud edastusi jätavad andmekogumi muud sessioonid { "167" } epohhi nõutud { "3600" } vastu. Esitatud, mitte pimedalt (varasemate ridade avatud kirjed): 5071A tseesiumikaart on läve piires (halvim { "1.070" } kuni { "4096" } s), OCXO kaart on konservatiivne ja läve väljaspool ({ "2.348" } juures { "128" } s; selle müra põrand muutub kirje jooksul) ning Norcia strontsiumikaart, mis on sobitatud kolmele lühimale avaldatud punktile, on läve piires kahes skooritud punktis ({ "1.291" }, { "1.405" }). Galileo passiivsed vesiniku masserid (lõplike Galileo kellade sisselogimisvaba allikat ei ole kättesaadav) ja Deep Space Atomic Clock (üks avatud kosmosesisene väärtus) on blokeeritud. D9 ring { "2" }, ZED-F9P vastuvõtja TCXO mudeliklassina { "14" } päeva kohta { "12" } staatilisel Wroclawi jaamal (Zenodo { "6488497" }, CC BY { "4.0" }; eelregistreeritud fb475550), leid: registreeritud töövooga ei olnud { "11" } { "12" }-st jaamast hinnatavad (RAIM lükkas tagasi enamiku ionosfäärivabadest epohhidest) ja BX14 ebaõnnestus; avalikustatud kordusjooks parandatud töövooga (eelregistreeritud c9cc0d49) läbib { "1" } { "11" }-st pimejaamast (BX12, { "1.412" }; BX07 { "1.532" } ja BX13 { "1.542" } napilt väljaspool), sest ühe punkti vastuvõtja kellad katkendlikest { "30" } s failidest ei ole puhas ostsillaatori kirje

# text
seg-2a3a7ee9e8f3 = clock_library (card, condition, series), realdata::clk, allan (lag1_noise_id)

# text
seg-578497ef82a5 = tests/clock_library_device_cards_oracle.rs (gps_iif_cards_reproduce_the_recorded_finding; receiver_training_is_blocked_by_the_epoch_minimum; non_blind_cards_are_reported; eelregistreeritud 2ec76864); clock_library::card::tests; clock_library::condition::tests; clock_library::series::tests; realdata::clk::tests; tests/clock_library_f9p_cards_oracle.rs (f9p_first_pipeline_reproduces_the_recorded_finding; f9p_corrected_pipeline_reproduces_the_recorded_finding; andmetest sõltuv)

# text
seg-a2202f0e06b2 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Mõõdetud kirjed, eraldi hoitud: { "11" } GPS Block IIF satelliidi IGS lõplikud kombineeritud { "30" } s kellad perioodil 2026-04-01 kuni { "14" } (aken, mida ükski test polnud avanud; IGS, avatud viitega). D9 väline võrdlus (eelregistreeritud fb475550, prognoositud / mõõdetud Alani hälve vahemikus [1/1.5, { "1.5" }] igal sobitatud keskmistamisajal igal satelliidil), leid (jääb MODELLED): { "9" } { "11" }-st kaardist on läve piires; G03 ({ "1.947" }) ja G25 ({ "1.581" }) on optimistlikud vahemikus { "60" } s kuni { "2000" } s, sest nende eraldi hoitud kirjed on mürarikkamad kui nende sobituskolmandikud (G25 eraldi hoitud osa sisaldab { "16" } vahet ja { "29" } faasi hälvikut), mis on kella muutus, mitte puuduv perioodiline liige. Perioodiliste liikmete väljajätmine prognoosist ebaõnnestub kõigil { "11" } kaardil ({ "1.77" } kuni { "4.96" }), seega liikmed kannavad prognoosi

# text
seg-d302e2ef46ad = clock_library (card)

# text
seg-00637c1e69f0 = tests/clock_library_periodic_cards_oracle.rs (periodic_cards_reproduce_the_recorded_finding; eelregistreeritud fb475550); clock_library::card::tests (a_periodic_card_carries_the_sinusoid_a_power_law_card_cannot)

# text
seg-1c858b039ab0 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), F skaalal scipy.linalg.expm ja Q Van-Loani { "1978" } blokkmaatriksiga — sõltumatu etalonteostus, mis reprodutseerib kshana täieliku filtri trajektoori. Teostuste vaheline kooskõla: kella füüsikat / Alani kalibreerimist ei ole väliselt valideeritud, seega jääb see MODELLED. { "0.30" } väline võrdlus, leid (jääb MODELLED): IGS lõplikel { "30" } s kelladel { "11" } GPS Block IIF satelliidilt (2025-08-17 kuni { "30" }), kui Q on sobitatud esimese poole ADEV-ile ja filtrit hinnatakse eraldi hoitud teisel poolel, on filter ühe sammu ees kooskõlas ({ "0.906" } kuni { "0.971" } epohhidest oma { "95" } % vahemikus, lävi { "90" } %), kuid ühe tunni juures ülemäära kindel { "9" } kellal { "11" }-st ({ "0.486" } kuni { "0.829" }) ja selle innovatsioonisummad jäävad väljapoole [{ "2.4" }, { "3.6" }] { "5" } kellal. Sobitatud valge faasi müra on igal satelliidil null ja tunniskaala viga (perioodilised liikmed, flicker FM) ei kuulu 3-olekulisse mudelisse. { "0.30" } ring { "2" }, laiendatud filter (flicker FM ning üks ja kaks korda pöörde kohta olekud) värsketel eraldi hoitud IGS kelladel perioodil 2025-09-01 kuni { "14" } (eelregistreeritud 4b1a841e), leid (jääb MODELLED): ühe sammu ja ühe tunni kooskõlakriteeriumid kehtivad kõigil { "11" } satelliidil ({ "0.948" } kuni { "0.988" } ja { "0.907" } kuni { "0.996" }), kuid innovatsioonisumma kriteerium ebaõnnestub G24 ({ "0.964" }) ja G30 ({ "1.929" }) puhul vahemiku [{ "2.4" }, { "3.6" }] suhtes. D9 ring { "3" }, ringi 2 laiendatud filter, häälestus ja kriteeriumid muutmata pärast külmutatud clock_library konditsioneerimise detektorit, värsketel IGS kelladel perioodil 2026-04-01 kuni { "14" } (eelregistreeritud fb475550), leid (jääb MODELLED): (a) ühe sammu { "0.941" } kuni { "0.968" } ja (c) kolmik-NIS keskmine { "2.641" } kuni { "3.549" } kehtivad kõigil { "11" } satelliidil; (b) üks tund ebaõnnestub G09 ({ "0.894" }) ja G26 ({ "0.876" }) puhul läve { "0.90" } suhtes

# text
seg-3016100a7015 = clock_state::tests (analüütiline van-Loani Q; NEES; PSD positiivsus); tests/clock_state_reference.rs (täielik ennustus+uuendus-trajektoor — olek x ja { "3" }×{ "3" } kovariatsioon P { "1925" } sammu / { "4" } parameetrikomplekti kohta vs filterpy { "1.4.5" }; halvim |relΔ| { "2.8e-14" }); tests/clock_state_igs_holdout_oracle.rs::three_state_filter_on_held_out_igs_clocks_finding (kinnitab leiu); tests/clock_state_ext_igs_fresh_oracle.rs::extended_filter_on_fresh_igs_clocks_finding; tests/clock_state_ext_igs_conditioned_oracle.rs::conditioned_extended_filter_finding (D9 ring { "3" })

# text
seg-27554b73549b = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Sagnaci suurus kontrollitud autoriteetse AVALDATUD VÄÄRTUSE vastu — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), Eq. { "1.29" }: idasuunaline ekvatoriaalne ringmaailmareis kogub { "207.4" } ns (2ωA_E/c²); kshana reprodutseerib { "207.386" } ns. Sõltumatult kinnitatud RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause) poolt, mis kannab sama 2Aω/c² geomeetriat. Liit-BIPM TWSTFT transponderi/common-view/PPP eelarvel puudub väline sõltumatu etalon, seega jääb võimekus modelleerituks

# text
seg-509026100595 = timetransfer, timetransfer_adv

# text
seg-a1ad8fb8537d = timetransfer::tests (reciprocal cancellation; two-form Sagnac identity); tests/time_transfer_error_budgeting_reference.rs (ekvatoriaalse ringmaailmareisi Sagnac = { "207.386" } ns vs avaldatud Ashby { "207.4" } ns täpsusega <{ "0.05" } ns; lisaks Sagnaci/geodist geomeetria ristkontrollitud RTKLIB { "2.4.3" } geodist() vastu, kompileeritud C lähtekoodist)

# text
seg-a5714c98b299 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — GPS C/A Goldi risk-/autokorrelatsioon sobitus TÄPSELT (täisarv ±65/−1/63) sõltumatu IS-GPS-200 koodigeneraatoriga; BPSK-R({ "1" })/BOC({ "1,1" }) PSD kuju vs sõltumatu scipy periodogramm. Modulatsiooni/SSC/DLL suletud kujud (Betz { "2001" } / Kaplan & Hegarty) jäävad analüütilisteks, seega jääb rida MODELLED — kuid koodikorrelatsiooni alamväide on väliselt sobitatud. { "0.30" } ring { "2" }, Betzi { "2001" } ja Hein et al. { "2006" } trükitud väärtuste vastu (eelregistreeritud 9f4f2ce8, pool trükitud ühikut), leid (jääb MODELLED): kõik { "45" } tabeli { "1" } spektraalrakku, { "1" } GHz korrelatsiooniväärtused, MBOC-häire arvud ja { "2" } { "3" }-st joonise { "17" } nihkest on kooskõlas; { "24" } MHz esimesed külgsagarad, BOC({ "8,4" }) joonise { "17" } nihe ja iga jooniste 18-21 halvima juhu mitmeteelevi nihe ({ "11" } kuni { "15" } % madal) ei ole. Kshana ja sõltumatu NumPy hinnang eelregistreeritud lugemisele on kooskõlas, seega peitub lahknevus selles lugemises või artikli väljaütlemata detailis; põhjus lahendamata

# text
seg-10e0cb39ac3b = navsignal

# text
seg-1035f877de94 = navsignal::tests (BPSK self-SSC = 2/3R_c; unit-area PSD; DLL); tests/nav_signal_modulation_code_tracking_reference.rs (GPS C/A Goldi risk-/autokorrelatsiooni täpne täisarvuline vaste sõltumatu IS-GPS-200 koodigeneraatori vastu; BPSK-R({ "1" })/sine-BOC({ "1,1" }) PSD vs sõltumatu scipy periodogramm); tests/nav_signal_betz_hein_published_oracle.rs (betz_text_correlation_values_over_1_ghz; hein_mboc_interference_improvements; finding_betz_side_lobes_and_multipath, kinnitatud)

# text
seg-9fe0ec8c4531 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Avaldatud CAI esmaartikli arvvektorid (Cheinet { "2008" } ülekandefunktsioon; Peters/Freier tundlikkus): k_eff·T² sobitus täpselt, jaotusmüra ASD ühepoolne põrand umbes { "2" }× piires iga avaldatud instrumendi omast (tegelikud seadmed kannavad kvantpõrandast kõrgemat tehnilist müra). Raam, mitte võrdsus. { "0.30" } ring { "2" } (eelregistreeritud fcb9ac64), leid (jääb MODELLED): ainult QPN pöörlemismüra mõõdetud Gauguet et al. { "2009" } joonise { "14" } punktide vastu annab suhted { "0.695" } kuni { "0.788" } kolmes lubatud punktis ({ "0.751" } tööpunktis), jäädes eelregistreeritud { "30" } % läve täitmata { "0.5" } punkti võrra; QPN põrand jääb { "21" } kuni { "31" } % mõõdetud mürast allapoole, nagu võib oodata laseri- ja detekteerimismürata mudelilt. Gradiomeetri kompositsioon vastab Janvier et al. { "2022" } QPN mudeli joonele (suhe { "1.013" } kuni { "1.017" }, Reference). Mõõdetud test ei suuda eristada sqrt({ "2" }) kompositsiooniviga; seda suudab vaid ebavõrdse kontrastiga Janvier' joon

# text
seg-4e1ac3f1b4a1 = quantum_imu::tests (k_eff; Mach-Zehnder T²; Freier-2016 põranda raam); tests/quantum_inertial_sensor_reference.rs (ülekandefunktsioon |H(ω)|, k_eff·T² ja jaotusmüra ASD vs avaldatud Cheinet { "2008" } / Peters / Freier arvvektorid); tests/quantum_inertial_measured_qpn.rs (gauguet_finding_qpn_floor_sits_below_the_measured_noise, kinnitatud; gradiometer_qpn_line_matches_janvier_model)

# text
seg-0b9af8a14a54 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Interferomeetri vöötmudeli enesekooskõla: poolvöödi serv, 2π-perioodiline aliasingu struktuur ja skaalategurite taandumine ulatuse/lahutuse suhtes on suletud kujuga algebralised samasused, mida kontrollitakse mootori enda Mach–Zehnderi faasi- ja tundlikkusfunktsioonide vastu — sisemise kooskõla kontrollid, MITTE väline andmekogum, seega jääb rida InternalConsistency. MODELLED ideaalne kolmeimpulsiline vööndi mitmetähenduslikkus; ühemõttelise ulatuse kohta puuduvad lainefrondi aberratsiooni ja kontrastikao piirid

# text
seg-81802510f112 = quantum_imu::tests (a_max asub ±π poolvöödi servas 1/T² ulatuse skaleerimisega; mähitud faasi taastamine on täpne vahemikus [−a_max,a_max] ja alias täpselt { "2" }·a_max võrra väljaspool seda; ühemõtteline dünaamiline ulatus a_max/σ_a=π/σ_Φ on identne kahe väga erineva lainepikkuse/T skaalateguri puhul; CaiAccelerometer meetodid vastavad vabadele funktsioonidele)

# text
seg-91728172ea50 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Sõltumatu numpy Monte Carlo SDE integreerimine kahekordselt integreeritud valge kiirenduse müra jaoks (valideerib analüütilise VRW dispersiooni tõeliselt sõltumatu algoritmiga) + Grovesi { "2013" } avaldatud väärtuse ankur nihke/skaalateguri liikmetele; CAI seadme arvud kvantifitseerivad partneri riistvara ja jäävad MODELLED

# text
seg-ccc56dac1725 = inertial::quantum_imu (QuantumNavBudget)

# text
seg-60fb2adb58ce = budget_tests (nihe vs AccelModel integraator; VRW vs analüütiline integraal); tests/quantum_inertial_dead_reckoning_reference.rs (VRW vs sõltumatu numpy Monte Carlo kahekordne integreerimine valge kiirenduse mürast, halvim hälve { "0.42" }% piires ±{ "3" }% { "6" } rannikuaja jooksul; nihe/skaalategur vs Grovesi { "2013" } suletud kujuga väärtus; holdover-i edasi-tagasi teisendused)

# text
seg-8bc5bc7d553c = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Segamisvastane C/N₀ lingibilansi võrrand, ristkontrollitud sõltumatu numpy uuestituletusega (jagab sama suletud kuju → InternalConsistency) pluss tegeliku JammerTest-2024 C/N₀ halvenemise iseloomustus. { "0.30" } ring { "2" }, blokeeritud (jääb MODELLED): mõõdetud JammerTest { "2024" } C/N0 languse võrdlust lingibilansi prognoosiga (eelregistreeritud 6a66994b, { "3" } dB piires) ei käitatud, sest F8.1 antenni asukoht ja suund Bleikis ning mitmeribalise { "1.6.4" } tõusu võimsuse L1 osa ei ole dokumenteeritud testikataloogis ega ametlikus logis

# text
seg-8f6825f614c7 = jamming::tests (broadband_q_equals_the_spectral_separation_closed_form ja cw_q_equals_the_spectral_separation_closed_form: Q tabel, CW ja kitsaribaline { "1" }, lairibaline ja pühitud { "2" }, kinnitatud navsignal suletud kujude külge; a_cw_jammer_is_more_damaging_than_broadband_noise_at_equal_js); tests/gnss_denied_jamming_resilience_reference.rs (FSPL/J-S/efektiivne C-N₀ vs sõltumatu numpy uuestituletus Kaplani ja Hegarty §{ "9.4" } lingibilansist; tegelik JammerTest C/N₀ langeb monotoonselt läbi { "25" } dB-Hz läve); tests/jamming_jammertest_cn0_oracle.rs (eelregistreeritud, blokeeritud, käitamata)

# text
seg-26b6c4436ca0 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — TEXBAT stsenaariumi parameetrid (Humphreys { "2012" }) — iseloomustus, mitte kinnitatud vektorid. { "0.30" } väline võrdlus, leid (jääb MODELLED): JammerTest { "2024" } (Bleik; GPL-3.0 andmed) puhul ei tõstnud vaatlustaseme monitorid (kellaga abistatud hii-ruut, RAIM, lahendi ebaõnnestumine) häiret { "10" } s jooksul ühegi { "8" } hinnatava avaldatud spuufimise alguse suhtes (kus alguseelne aken oli puhas, tuli esimene häire { "10.2" } kuni { "39" } s pärast avaldatud ajaakna algust), ja kolm alguseelset akent kandsid kellamonitori valehäireid ({ "81" }, { "64" } ja { "173" } epohhi). Esimene vaadeldav mõju oli kahesageduslik GPS jälgimise kadu, mitte RAIM-i vastuolu. Avaldatud algused on minutilahutusega ajakava ajaakna algused; et need eelnevad RF salvestusele, on tõlgendus, mitte mõõtmine. { "0.30" } ring { "2" }, korraldajate ametliku JammerTest { "2024" } logi vastu (sekundilahutus; eelregistreeritud 6a66994b Hadamardi järgi kalibreeritud kolmeolekulise kellamonitoriga ilma lukustuseta), leid (jääb MODELLED): monitor annab häire { "10" } s jooksul { "4" }-l { "10" }-st logitud algusest; ülejäänud kuuel on see { "18" } kuni { "211" } s hiljaks jäänud või tõstab alguseelseid kella valehäireid ({ "1" } juures { "2.1.4" }, { "85" } juures { "2.3.15" }). D9 ring { "3" } (vastuvõtja kaart JammerTest-seadme teistest sessioonidest, eelregistreeritud 2ec76864) blokeeritud: { "167" } treeningepohhi { "3600" } vastu. D9 ringid { "4" } ja 4b (müratasemed u-blox ZED-F9P mudeliklassi kaardilt, Wroclaw { "2021" }, eelregistreeritud fb475550; 4b avalikustatud kordusjooks parandatud väljavõttega, c9cc0d49), leid (jääb MODELLED): null alguseelset valehäiret kõigil { "10" } logitud algusel ja { "6" } { "10" }-st { "10" } s jooksul; { "2.1.1" }, { "2.3.5" }, { "2.3.10" } ja { "2.6.1" } jäävad hiljaks (+{ "211" }, +{ "23" }, +{ "18" }, +{ "51" } s), kella müratase seda ei muuda

# text
seg-e3ed02029c26 = spoof, spoof_detect, spoof_monitors

# text
seg-d6db95d3aa40 = tests/spoof_texbat_validation.rs (TEXBAT parameetrite iseloomustus); tests/spoof_detection_jammertest_oracle.rs::monitors_against_the_published_onsets_reproduce_the_recorded_disagreement (kinnitab leiu); tests/spoof_detection_jammertest_log_oracle.rs::engine_monitors_against_the_logged_onsets_reproduce_the_recorded_disagreement; tests/clock_library_tcxo_card_jammertest_oracle.rs (round_3_is_blocked_by_the_training_minimum; round_4_reproduces_the_recorded_finding; round_4b_reproduces_the_recorded_finding; D9)

# text
seg-964d859381f5 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Koosneb valideeritud primitiividest (allan/holdover van-Loan, turvapõrand); kalibreeritud JammerTest { "2024" } stsenaariumil { "2.1.1" } (~{ "1.01" } ms tegelik serveeritud aja nihutamine vs ≤{ "51" } ns väidetud). Sild valideeritud osade kohal — ise mitte väline valideerimine. { "0.30" } väline võrdlus, leid (jääb MODELLED): JammerTest { "2024" } spuufimise stsenaariumidel ületab mõõdetud tuvastamata serveeritud aja viga nominaalset TPL-i { "3" }-l { "8" }-st tuvastatud algusest: { "184.3" } vs { "34.6" } ns ({ "2.1.4" }), { "295.7" } vs { "159.3" } ns ({ "2.3.5" }) ja { "143.0" } vs { "69.0" } ns ({ "2.3.11" }); kolm viiest piirides olevast on triviaalsed (lukustatud alguseelne valehäire). Tõenäoline põhjus: { "60" } s kalibreerimisest ilma triivimürata tulenev rannikuliige ei kata vastuvõtja TCXO sageduse hulkumist { "15" } kuni { "39" } s jooksul. Mõõdetud viga on Kshana enda ühepunktilise kellahinnangu erinevus oma alguseelsetele hinnangutele sobitatud sirgest, seega ei oleks isegi kooskõla olnud täiesti sõltumatu. { "0.30" } ring { "2" }, ametliku JammerTest { "2024" } logi algusi ja mõõdetud vastuvõtja ajaviga vastu (eelregistreeritud 6a66994b), leid (jääb MODELLED): { "4" }-l { "10" }-st logitud algusest ületab tuvastamata viga triivioleku TPL-i ({ "634.7" } vastu { "458.5" } ns juures { "2.1.1" }, { "232.6" } vastu { "16.2" } ns juures { "2.3.5" }, { "41.3" } vastu { "6.0" } ns juures { "2.3.10" }, { "218.6" } vastu { "47.4" } ns juures { "2.6.3" })

# text
seg-9cb72e60e080 = tpl

# text
seg-b96e16aba41a = tpl::tests (suletud kujuga etalonid + CUSUM); examples/tpl_jammertest.rs (JammerTest { "2024" } tegeliku spuufimise kalibreerimine); tests/tpl_jammertest_coverage_oracle.rs::tpl_against_measured_time_error_reproduces_the_recorded_disagreement (kinnitab leiu); tests/tpl_jammertest_log_oracle.rs::drift_state_tpl_against_the_logged_onsets_reproduces_the_recorded_disagreement

# text
seg-f2efb9b15383 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — IGRF-14 koefitsiendid; esimestest printsiipidest sobitatud filtri CRLB. Tegeliku välja gravitatsiooni bench-i väli on väliselt kontrollitud (rida 'Gravity-anomaly synthesis from a spherical-harmonic model'), kuid selle navigatsioonitulemusel puudub sõltumatu etalon

# text
seg-6094ed4985fc = altpnt, mapmatch, gravimeter, igrf

# text
seg-f841812dc204 = tests/alternative_complementary_pnt_reference.rs (kaardiga sobitamise CRLB; IGRF-14 väli); mapmatch::tests; gravimeter::tests; igrf::tests; tests/gravity_map_real_field.rs (60-minutiline GPS-ita bench tegelikul EGM2008 astme 70 väljal, eelregistreeritud kaustas xval/icgem-egm2008/: sobitatud { "3106" } m, seega lävi < { "500" } m on NOT MET ja kinnitatud kui täitmata, ning kümnekordne vähendamine { "70.6" } km triivil on MET; pluss algväärtustatud (seed) kaardivea Monte Carlo); altpnt::terrain::tests::emag2_format_grid_reproduces_the_synthetic_magnetic_channel ja tests/emag2_real_grid.rs (andmetest sõltuv EMAG2v3 lugeja tegelikul väljalõikel; sellel ei väideta navigatsioonitulemust); tests/terrain_slam_rbpf.rs (ühine kaardihinnang, FastSLAM-laadne RBPF, vs teadaoleva kaardiga SITAN { "15" } m korreleeritud kaardivea korral { "20" } algväärtuse (seed) kohta, eelregistreeritud kaustas xval/terrain-slam-rbpf/: { "1.5" }% keskmine kasu ja parem { "10" }-l { "20" }-st, seega on { "10" }% ja 12/20 läved NOT MET ja kinnitatud kui täitmata; kahjuta täpse kaardi korral, MET)

# text
seg-d7fd40dc37c6 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — SBOM-i standardi järgimine ametliku CycloneDX-i { "1.5" } JSON-skeemi suhtes (+ kehtivad SPDX-i identifikaatorid) — väline avaldatud standard, null valideerimisviga kogu sõltuvusgraafil; FoM-i determinismi / baitide tasemel reprodutseeritavuse osa jääb fikseeritud sisemise kooskõla kontrolliks, mistõttu rida jääb MODELLED

# text
seg-4bcb7eeb020a = report, scenario; CI (golden/determinism/SBOM)

# text
seg-3667ebf0582a = tests/golden.rs, tests/determinism.rs, tests/cross_platform_golden.rs; tests/reproducibility_software_assurance_reference.rs (genereeritud SBOM valideerub null veaga ametliku CycloneDX-i { "1.5" } JSON-skeemi vastu kogu 66-komponendilisel tarnitaval graafil: vaikimisi + python + wasm funktsioonid, arendussõltuvused välja arvatud)

# text
seg-a014f82f28b0 = Masinõppel põhineva RF-häirete tuvastamise hindamine ({ "13494" })

# text
seg-400e45e7e700 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga AUC piirid (Mann–Whitney) + täiusliku sõltumatu etaloni detektor; korpus on SÜNTEETILINE (parameetritel põhinev, mitte välja-/IQ-andmed)

# text
seg-e4edd8fd654c = impairment_eval::tests (AUC perfect=1/identical=0.5/tie={ "0.125" }, ROC monotoonne, fused>{ "0.8" }, klassipõhine kihtide eraldatus, lekke kaitse, reprodutseeritav korpus, jaotuse nihke lipud optimismi); dominance_demonstrators (kättesaadav + reprodutseeritav + MODELLED-not-VALIDATED + optimismilõhe enesekooskõlaline)

# text
seg-7566da9904ba = Masinõppel põhineva RF-häirete optimismilõhe uuring ja ainult ID-põhine lõhe ennustaja

# text
seg-0d7f46d20a0d = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Käsitsi tuletatud statistikud vs suletud kujud (binormaalne AUC Φ(d'/√{ "2" }), DeLongi dispersioon, seotud astmetega Spearman, täpne OLS-i taastamine) + leave-one-out CV vs keskmise ennustamise lähtetase. Korpus on SÜNTEETILINE (parameetritel põhinev, mitte kunagi välja-/IQ-andmed) ja optimismilõhe on sünteetiline→sünteetiline raskusastme nihe, MITTE sim-to-field tulemus

# text
seg-28583cba1c55 = impairment_study, impairment_ml, eval_stats

# text
seg-b30ce36e7afb = impairment_study::tests (klassipõhine etaloni AUC≈{ "1" }, õpitud optimismilõhe>{ "0" }, ruudustiku kuju + bootstrap CI ümbritseb keskmist + positiivne skaleerimistrend, ID tunnused lõplikud, lõhe ennustaja ületab keskmise ennustamise MÕLEMA leave-one-detector-out ja leave-one-class-out CV korral + deterministlik); impairment_ml::tests (logreg eraldab + deterministlik + kadu↓, MLP lahendab XOR-i, mida lineaarne mudel ei suuda + algväärtustatud (seed)); eval_stats::tests (bootstrap/DeLong/Spearman/ridge vs suletud kujud)

# text
seg-590ec8589ce6 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Mõõdetud-ADEV→PSD sobituse (NNLS) tuum on sobitatud scipy.optimize.nnls-iga (tests/scipy_reference.rs / tests/quantum_vs_classical_pnt_trade_reference.rs) — sõltumatu väline tuum; kuid kompromissi ARVUD kvantifitseerivad (mitte kunagi ei valideeri) partneri kella/CAI-d, seega jääb kompromiss ise MODELLED, ilma valideerimise sära

# text
seg-e0f68f57399d = quantum_trade::tests (ADEV edasi-tagasi taastamine, NNLS mittenegatiivsus, põranda hoiatus olemas/puudub, kasu>{ "1" }, monotoonne mähis + alt-PNT piir); dominance_demonstrators (mõõdetud-ADEV on andmepõhine, mitte põrandaga eeldatud, eeldatud klass lipustab põranda + hoiatuse, väärvormitud kõver tagasi lükatud, MODELLED-not-VALIDATED)

# text
seg-7d1d24d8f8f5 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Definitsiooniline Kp↔ap tabel + Jacchia-1971 eksosfääri temperatuuri suletud kuju (sobitatud < { "1" } K täpsusega avaldatud ankrutega, tests/space_weather_reference.rs); tihedust iseloomustatakse pymsis NRLMSISE-00 (sõltumatu NRL-i mudel) vastu: { "800" } km päikesetsükli kõikumine on 10.4x vs NRLMSISE-00 13.6x. { "0.30" } redaktsioon: kalibreeritud esimese astme aktiivsusfaktor asendati Jacchia { "1971" }-ga (vaikestsenaariumi tihedus { "400" } km juures { "4.176e-12" } -> { "6.929e-12" } kg/m3; reference_exospheric_temperature_k eemaldati, mean_exospheric_temperature_k lisati). { "0.30" } ring { "2" }, mõõdetud TOLEOS CHAMP/GRACE/GRACE-FO kiirendusmõõtja tihedused (ESA Swarm DISC; eelregistreeritud 20eed695), leid (jääb MODELLED): orbiidi keskmised { "400" } kuni { "500" } km juures on päikesemaksimumil väljaspool tormi teguri { "2" } piires (CHAMP { "2001" } 521/521, GRACE-A { "2002" } 120/120, GRACE-FO { "2024" } 526/547), kuid Jacchia { "1971" } on { "2008" } päikesemiinimumil umbes 1.7x liiga tihe (GRACE-A 412/544 teguri { "2" } piires), seega tihedus ei ole valideeritud

# text
seg-550bd3cee63e = space_weather::tests (Kp↔ap täpne ruudustiku punktides + edasi-tagasi + monotoonne, ööpäeva Ap keskmine, eksosfääri T vs avaldatud päikesemiinimumi/keskmise/maksimumi + tormi juurdekasvu ankrud, tihedus ühik viitel, päikesetsükli kõikumine vaadeldud { "5" }–{ "10" }× vahemikus, stsenaarium reprodutseeritav + MODELLED-not-VALIDATED + vahemikust väljas tagasi lükatud); dominance_demonstrators (kättesaadav + reprodutseeritav + füüsikaline T + MODELLED-not-VALIDATED); tests/space_weather_density_accelerometer_oracle.rs::jacchia71_finding_is_pinned

# text
seg-83c77a559939 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga sfääritrigonomeetriline stardigeomeetria vs avaldatud läbitöötatud näidete ankrud (Vallado, Fundamentals of Astrodynamics 4. tr, Algoritm { "37" } stardiasimuut + ptk 6 tasandimuutus; tests/launch_window_ascent_geometry_reference.rs). Need kasutavad uuesti sama suletud kuju, mida kshana realiseerib (avaldatud väärtuse võrdsuse / ülekirjutuse kontroll, InternalConsistency); MODELLED kahe keha mudel, ilma pöörleva Maa kiirustriangli / tõusu / takistuskao mudelita. { "0.30" } väline võrdlus Orekit { "12.2" } (Apache-2.0) vastu, leid (jääb MODELLED): geomeetria on kooskõlas ümardamise täpsusega (kalle, mis loetakse tagasi põlemise lõpu asimuudist { "158" } juhul, halvim { "2.6e-15" } rad; minimaalne kalle, ringkiirus ja dogleg delta-v täpsusega { "3e-16" }), kuid Maa pöörlemise jaama kiirus ei täida eelregistreeritud { "1e-6" } suhtelist läve { "62.9" } kraadi laiuskraadil ({ "1.12e-6" }). Lõhe kasvab kui tan(lat), mis on kooskõlas ligikaudu { "5.8e-7" } rad poolusliikumise pooluse nihkega Orekiti Maa tugisüsteemis, mida sfääriline ω·R·cos(lat) ei arvesta. Väidet ei kitsendatud enne käitust, seega ei saa rida selle võrdluse põhjal tõusta. { "0.30" } ring { "2" } (eelregistreeritud 71bebf63): epohhi ja IERS-i ridadega on tõelise pooluse jaama kiirus (stsenaariumi väli site_rotation_speed_true_pole_m_s) kooskõlas Orekitiga täpsusega { "1e-6" } { "24" } jaamas nelja pikkuskraadi peal (halvim { "4.9e-8" }), kuid nominaalne epohhita kiirus, mida stsenaarium vaikimisi Maa pöörlemise boonusena väljastab, eksib endiselt { "1.12e-6" } võrra, seega jääb rida MODELLED kuni vaikeväljundi osas otsuse tegemiseni

# text
seg-80847ffc93bf = launch

# text
seg-2095b880eb39 = launch::tests (otse itta start jõuab i=laiuskraad, KSC→ISS = õpiku { "45" }°, polaarne = N/S, i<lat kättesaamatu, { "465" } m/s ekvatoriaalne boonus, tasandimuutus { "10" }° ≈ { "1.34" } km/s + { "180" }° = 2v, päevaste võimaluste arvud, stsenaarium reprodutseeritav/MODELLED + dogleg-tee); dominance_demonstrators (kättesaadav + reprodutseeritav + KSC→ISS { "45" }° + MODELLED-not-VALIDATED); tests/launch_geometry_orekit_oracle.rs::burnout_azimuth_reproduces_the_target_inclination_in_orekit; tests/launch_geometry_orekit_oracle.rs::earth_rotation_speed_gap_is_recorded_as_a_finding; tests/launch_geometry_orekit_oracle.rs::true_pole_site_speed_matches_orekit_at_a_fresh_epoch_and_longitudes

# text
seg-2a0f9d168a02 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga Allen–Eggersi analüütiline sisenemine, lisaks ristkontrollitud scipy { "1.18" } solve_ivp (DOP853) numbrilise integreerimisega SAMA ainult takistusega sisenemise diferentsiaalvõrrandi (tests/ballistic_re_entry_corridor_reference.rs, { "36" } juhtu, halvim a_max rel { "2.9e-9" }) — arvintegraali ja enda analüütilise kuju kontroll, seega ikka InternalConsistency, MITTE väline valideerimine. MODELLED ballistiline (ilma tõstejõuta), aerotermilise/TPS-ita — kuumenemise väljund on kiirus, mitte soojusvoog. { "0.30" } väline võrdlus, leid (jääb MODELLED): Stardust SRC sisenemise rekonstruktsiooni (Desai ja Qualls, NASA NTRS { "20080008567" }) vastu on Allen–Eggersi tippviivitus trükitud inertsiaalse sisenemisoleku ({ "12.9" } km/s, -8.2 kraadi, H { "7200" } m) korral { "61.8" } g vs parima hinnangulise trajektoori { "32.89" } g, +{ "88" } % { "15" } % tolerantsi vastu: konstantse lennutrajektoori nurga ja gravitatsioonita lahend peaaegu kahekordistab madala, põgenemiskiirusest kiirema sisenemise tipu. Stardustil ei olnud kiirendusmõõtjat, seega on rekonstruktsioon trajektoori hinnang. { "0.30" } ring { "2" }, blokeeritud (jääb MODELLED): integreeritud tasapinnaline punktmassi lahend (reentry::simulate_planar_entry, US76, ruutpöördvõrdeline gravitatsioon, kõverus) on kooskõlas Stardusti ja Genesise parimate hinnanguliste trajektooridega { "15" } % piires (+{ "11.3" } %, +{ "5.6" } %), kuid need maksimumid on agentuuri simulatsioonide väljundid, mitte mõõtmised, seega on see ainult ristkontroll. Kiirendusmõõtja võrdlus (eelregistreeritud a94a283d) on blokeeritud Hayabusa2 REMM-i analüüsi loetava koopia puudumise tõttu (doi 10.57350/jesa.16)

# text
seg-c763ac7e3cda = reentry::tests (tipp-g sõltumatu ballistilisest koefitsiendist + füüsikaline g-vahemik, kasvab järsema γ / kiirema sisenemisega, tipp-g kiirus = V_e·e^(−1/2) ja tippkuumenemine = V_e·e^(−1/6) kiiremini, tipp-g kõrgus füüsikaline + sügavam suurema B korral, stsenaarium reprodutseeritav/MODELLED + degenereerunud geomeetria tagasi lükatud); dominance_demonstrators (kättesaadav + reprodutseeritav + V_e·e^(−1/2) osa + MODELLED-not-VALIDATED); tests/reentry_reconstruction_oracle.rs::reentry_overprediction_is_recorded_as_a_finding; tests/reentry_point_mass_reconstruction_oracle.rs::point_mass_peak_deceleration_matches_reconstructed_entries (ainult ristkontroll); tests/reentry_point_mass_accelerometer_oracle.rs (blokeeritud, käitamata)

# text
seg-f40cd1b25160 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: tabelist 5a K_bch ja kaadripikkustest suletud kujul arvutatud spektraalefektiivsus on kooskõlas efektiivsustega, mida tabel { "13" } trükib (lävitabeli ülekirjutuskontroll); lingibilansi osad on kooskõlas oma suletud kujudega; valik on Es/N0 suhtes monotoonne ja austab varu; ACM liigutab vähemalt konstantse kodeerimise mahu. Pääsu geomeetria tuleb eraldi VALIDATED näiva pääsu ennustajast. MIS EI OLE: ühtegi välist tööriista ega mõõdetud linki ei ole võrreldud; läved on standardi ideaalsed AWGN-väärtused, mitte modemi omad; vihmavaiknemist, pääsu jooksul suunamiskadu ja piloote ei modelleerita.

# text
seg-885946a29a26 = contact_schedule (es_n0_db, select_modcod, fspl_db, atmospheric_loss_db, ccm_modcod, pass_capacity, AcmLinkScenario); passes::predict_passes_apparent

# text
seg-00889ed96256 = contact_schedule::tests::modcod_efficiency_closed_form_matches_the_printed_table; contact_schedule::tests::modcod_selection_is_monotone_and_honours_the_margin; contact_schedule::tests::link_budget_pieces_have_closed_forms; contact_schedule::tests::acm_link_defaults_run_and_acm_beats_ccm

# text
seg-a90d5ba33c0b = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: täpne hargnemis- ja tõkestusmeetod on kooskõlas täieliku läbivaatusega väikestel juhuslikel hulkadel, iga plaani teostatavust kontrollitakse konfliktireeglite vastu ja ahne meetod ei ületa kunagi täpset optimumi. MIS EI OLE: ühtegi välist planeerijat ega operatiivplaani ei ole võrreldud; kontaktid võetakse tervikuna (ilma poolitamiseta), mahajäämus on akna alguses fikseeritud, fikseeritud pöördeajast kaugemale ulatuvat pööramisaega ja pardasalvestust ei modelleerita.

# text
seg-dece72e58683 = contact_schedule (conflicts, objective, delivered, schedule_chronological, schedule_greedy, schedule_optimal, ContactScheduleScenario)

# text
seg-d21204ff6b58 = contact_schedule::tests::conflicts_cover_turnaround_and_one_station_per_satellite; contact_schedule::tests::greedy_is_feasible_and_the_exact_solver_beats_or_ties_it; contact_schedule::tests::exact_solver_matches_brute_force_and_plans_are_feasible; contact_schedule::tests::exact_solver_declines_above_the_limit; contact_schedule::tests::contact_schedule_defaults_run_reproducibly; contact_schedule::tests::scenarios_reject_bad_inputs

# text
seg-7ead676849f9 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga kuluaritmeetika vs käsitsi tuletatud väärtused; modelleeritud katvusnäitaja majanduslik RAAMISTUS, mitte hinnapakkumine ega valideeritud kulumudel

# text
seg-c6fab6332435 = frugal (over walker)

# text
seg-257dfa053c24 = frugal::tests (käsitsi tuletatud kulu katvuse kohta 48/96={ "0.5" }, ROI suhe { "2.667" }, raamide järjestuse + nullkatvuse kaitsed)

# text
seg-8204455973cc = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Koosneb väliselt valideeritud RAIM-i Stanfordi klassifikatsioonist (raim::classify_stanford); tuvastamata jäänud sündmuse→AL vastendus ise on modelleeritud, mitte sertifitseeritud terviklikkuse jaotus

# text
seg-412105b0f541 = integrity_impact (over raim)

# text
seg-35bc1db56d2a = integrity_impact::tests (sama tuvastamata jäänud sündmus pöörab Available→MI→HMI konteksti karmistudes; konservatiivne-PL→Unavailable; teljepõhine HMI; sisendite kaitsed)

# text
seg-7bb58c89a1fb = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: viidatud VRW raam ristkontrollitud CaiAccelerometer::accel_asd füüsika vastu + toores dünaamiline ulatus arvutatud vöödi mitmetähenduslikkuse piirist; arvud on MODELLED kirjandusülevaate raamid (needs_source_confirmation), ühtegi seadet ei ole valideeritud, valideerimise sära puudub

# text
seg-fd95a229bdb3 = inertial::cai_params (over inertial::quantum_imu)

# text
seg-061a65493a4a = inertial::cai_params::tests (füüsikaline VRW jääb viidatud VRW raami sisse kõigil { "3" } tasemel; toores vöödi mitmetähenduslikkuse ulatus arvutatud k_eff·T²-st; konservatiivne eelarve triivib rohkem kui parim; iga raam on allikaga + kinnitusega lipustatud; raamide järjestuse kaitsed)

# text
seg-3f5094fa7a30 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Nelja piirkonna reegli sõltumatu numpy uuesti teostus (scripts/gen_tib_scorer_reference.py) identsel valimikomplektil; meetod viidatud Stanfordi–ESA terviklikkusdiagrammist (Tossaint et al., ION GNSS { "2007" }) ja RTCA DO-229 WAAS MOPS-ist. MITTE ExternalDataset täpsuse etalon — bench on aususe suhtes immuunne.

# text
seg-07ef7fe3d770 = src/benchmark/stanford.rs::tests (neli piirkonda + kaasavad piirid + |viga| + PL>AL kättesaamatus); tests/tib_scorer_reference.rs (klassifikatsiooni arvud vs sõltumatu numpy fikseeritud sünteetilisel hulgal)

# text
seg-10befbc6faae = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sõltumatu numpy piirkondade ülelugemine failis tests/fixtures/tib/reference.json; ainult hindaja mehhanismi ristkontroll, täpsusväidet ei esitata.

# text
seg-60f627e001ad = src/benchmark/coverage.rs::tests (puhas/alapiiratud/kõik-kättesaamatud/tühi); tests/tib_scorer_reference.rs (arvud + määrad + coverage_ok vs numpy täpsusega { "1e-12" })

# text
seg-cee919e2058e = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Esinduslikud parameetrilised vigade generaatorid (modelleeritud); tuvastamatu hulk (sümmeetriline viivitus, kordus värskuse piires) on viidatud Mizrahi RFC { "7384" } ja Narula & Humphreysi (IEEE JSTSP { "2018" }) põhjal. Välist sõltumatut etaloni pole — veakataloog ei esita mõõdetud väidet.

# text
seg-6b48be996d76 = src/benchmark/faults.rs::tests (nihkeprofiilid, monotoonne rannik, tuvastamatu hulga lipustamine, max_offset kooskõla, täpselt kaks tuvastamatut klassi)

# text
seg-0cc84aedee42 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Omaduskontroll, et Verdict enum ei saa struktuurselt tuvastamatut viga tuvastatuks teatada (Mizrahi RFC { "7384" }); absorbed ⟺ PL ≥ offset. Täpsuse etalon puudub.

# text
seg-b19cbd364dea = src/benchmark/scorecard.rs::tests (etalon-PL neelab; rikutud PL neeldumata-kunagi-tuvastamata; tuvastatava katvuse otsus; aususe omadus, et tuvastamatu stsenaariumi jaoks ei ole ühtegi katvuse/tuvastamise otsust saavutatav)

# text
# c1: variance
seg-350aaf43f349 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sõltumatut etaloni pole ega saagi olla: see on enesekirjeldus, mitte mõõtmine. See on kirja pandud, sest selle puudumine oli viga -- P5 pidi tsiteerima kandelaine pikkust ja saateava lähtevaikeväärtustest ning järeldama sisemise kooskõla kontrollist, et paljas <c1/> on ruutmeetrites. Järeldus oli õige, mis just tegigi selle oluliseks: miski poleks tabanud, kui see oleks olnud vale

# text
seg-6d963d838eed = hybrid_integrity::tests (lahendatud konfiguratsioon kajastatakse nii vaikeväärtuste kui ka ülekirjutuste puhul, ilma lainepikkust meetrite kaudu edasi-tagasi teisendamata; iga ühikute kirje kannab nii ühikut kui ka päritoluklassi; iga väli, mille ühikute plokk nimetab, tegelikult väljastatakse, seega ei saa see dokumenteerida kummitust)

# text
seg-cbd0ee1c1e97 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sõltumatut etaloni pole ja ExternalDataset on tagasi lükatud. Kaks sisendit on Eb/N0 varu ja C/N0 läve ületamine, mõlemad MODELLED EIRP, kvaliteeditegurit ja koondatud kadude jaotuse funktsioonid; Maa–Kuu optilise/RF hübriidteenuse jaoks puudub mõõdetud kättesaadavuse kirje, mille vastu koostatud näitajat kontrollida. Olemasolevad kontrollid on sisemised ja neid nimetatakse nii: kompositsioon arvutatakse uuesti aruande enda avaldatud varudest, mitte emitteri sisemustest, ning sulgumisulatus kontrollitakse lingivõrrandi uuesti käitamisega SELLEL ja nõudega, et varu kaoks -- pöördamise edasi-tagasi teisendus, mitte sõltumatu teostus. Näitaja ausad piirid on kirjas aruandel endal: see on deterministlik 0/1 indikaator, mitte tõenäosus, sest miski selles mootoris ei mõõda RF-lingi katkestuste jaotust sellel sagedusribal ja geomeetrial. See puuduv sisend on nimetatud väljal rf_availability.factors_not_included, mitte välja mõeldud, ja selle lisamine oleks see, mida tõenäosuslik RF-kättesaadavus vajaks

# text
seg-55f2385bbe8a = hybrid_integrity, linkbudget, jamming

# text
seg-188ab5b1b2e9 = hybrid_integrity::tests (kättesaadavus võrdub kahe indikaatori korrutisega, mis on arvutatud uuesti aruande enda varudest, ja need varud on ise uuesti kokku pandud aruande enda EIRP-st, vabaruumi kaost, koondatud kaost, kvaliteeditegurist, Boltzmanni liikmest, andmekiirusest ja nõudest täpsusega { "1e-9" } dB; väärtus on mõõdetult { "0" } või { "1" }, samas kui optiline kättesaadavus samal käitusel on mõõdetult rangelt nende vahel; iga teguri rida kannab päritoluklassi suletud field_schema sõnavarast; teatatud sulgumisulatus, mis on lingibilansi kaudu uuesti käitatud, annab varu { "0" } kuni { "1e-9" } dB ja on mõõdetult sõltumatu ulatusest, kus käitus asus, nelja dekaadi ulatuses, samas kui ulatuse kasutus muutub täpselt ulatuse suhte võrra; -40 dBW link teatab kättesaadavuseks { "0" }, LOST, ja kasutuseks üle { "1" }, mitte murdosa; aegunud märkus 'no RF-availability counterpart is computed by this engine' on kinnitatud kadunuks ja asendus on kinnitatud uut välja nimetama; väärvormitud RF sisend lükatakse tagasi, mitte ei piirata)

# text
seg-6471f38fc505 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — SUHTE jaoks sõltumatut etaloni pole ja ExternalDataset on tahtlikult tagasi lükatud. Aluseks olev RF-ahelal on see olemas -- tests/validate_p5_rf_ranging_precision.rs kontrollib linkbudget::link_budget ja navsignal::dll_code_jitter_chips sõltumatu Python/NumPy fikstuuri vastu ja kõvakodeeritud Kaplani ja Hegarty läbitöötatud väärtuse vastu ({ "2.814e-3" } chip / { "0.825" } m juures { "45" } dB-Hz) -- ja optilisel CRLB-l on oma suletud kujuga rida. Kummagi ankru väitmine selle rea jaoks oleks laenatud valideerimine, mida maatriksi invariandid on mõeldud takistama: siinne suurus on SUHE konfiguratsioonil, kus EIRP, kvaliteetegur, saatevõimsus ja apertuur on MODELLED, ning ühises tööpunktis puudub mõõdetud optilise ja RF kaugusmõõtmise võrdlus, mille vastu seda kontrollida. Sisemiselt kontrollitakse seda, mida suhe saab tegelikult valesti teha: et mõlemad harud asuvad ühes tööpunktis. Seda mõõdetakse ühise akumulatsiooniaja skaleerimisega ning nõudega, et mõlemad harud liiguksid sama ruutjuure seaduse järgi ja suhe jääks paigale, ning seda jõustatakse suhte täieliku tagasilükkamisega, kui keskmistamisajad ei kattu. Mõlemad harud on termilise/jaotusmüra piirid ja mõlemad jätavad välja keskkonnaviivituse, kellavea ja mitmetähenduslikkuse, seega on väljajätmine mõlemal poolel identne; aruanne ütleb seda välja, mitte ei jäta järeldada

# text
seg-616d297a3190 = hybrid_integrity, optical_linkbudget, linkbudget, navsignal

# text
seg-d3a72a60b237 = hybrid_integrity::tests (suhe võrdub kahe väljastatud haru jagatisega täpsusega { "1e-15" } suhteliselt ning selle pöördväärtus ja detsibellivorm on kooskõlas; iga haru ulatus ja aja sigma on seotud täpselt c-ga; väljastatud ühine konfiguratsioon on kinnitatud võrduvaks stsenaariumi enda ulatuse ja integreerimisajaga ning RF haru ulatus on kinnitatud võrduvaks optilise haru omaga; RF haru C/N0 on bitthaaval kättesaadavuse ploki oma, ühest lingibilansist, mitte uuestituletus; LIKE-FOR-LIKE omadus on MEASURED, mitte kinnitatud -- ühise akumulatsiooniaja neljakordistamine poolitab optilise haru täpsusega { "1e-12" } ja RF haru täpsusega { "1e-7" } ning jätab suhte paigale täpsusega { "3.19e-9" } suhteliselt, mida mõne muu suuruse üle salaja keskmistav haru ei suudaks; rf_dll_bandwidth_hz ülekirjutus, mis rikub ühise keskmistamisaja, teeb suhte nulliks põhjusega, mis nimetab mõlemat aega, samas kui mõlemad harud väljastatakse endiselt; ühesuunaline käitus teeb võrdlusharu bitthaaval väljalastud peamiseks tulemuseks karistusteguriga täpselt { "1" } ja kahesuunaline käitus reprodutseerib karistuse 0.5/sqrt(tagasitee geomeetriline kadu), arvutatud uuesti aruande enda geometric_loss_db-st täpsusega { "1e-12" })

# text
seg-7c14f0734623 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sõltumatut etaloni pole: see on enesekirjeldus võrrandi kohal, mis on juba valideeritud avaldatud projekteerimiskontrolli tabeli vastu (vt ühesuunalise lingibilansi rida). See on kirja pandud, sest selle puudumine oli mõõdetud viga -- väljalastud d1_rate_gain_beamwidth.csv reprodutseerimine nõudis ühe efektiivse konstandi tagantlahendamist täpsusega { "0.0034" } dB kõigist kolmekümnest reast ning mootor nii nimetab nüüd selle kombinatsiooni kui ka tõestab testiga, et ükski väljalastud tabel ei oleks kunagi suutnud selle kolme komponenti eristada

# text
seg-7f3efc1e9fa0 = linkbudget

# text
seg-da19fa334661 = linkbudget::tests (kolme sagedusriba, nelja ulatusdekaadi ja mõlema sulgumisotsuse korral arvutatakse varu ja selle all olev vabaruumi kadu uuesti ainult aruandest täpsemalt kui { "1e-9" } dB; võrrandi liikmetest kokku pandud nõutav G/T on kooskõlas sama suurusega, mis saadakse kui G/T miinus varu, ja selle juures uuesti käitamine nullib varu; kolm bilanssi väga erineva EIRP, kao ja lävega, kuid võrdse lingikonstandiga annavad identse nõude, samas kui { "1" } dB konstandil nihutab seda täpselt { "1" } dB; võimenduse jaotus puudub, kui müratemperatuuri pole öeldud, ja mittepositiivne lükatakse tagasi; iga väli, mille ühikute plokk nimetab, tegelikult väljastatakse)

# text
seg-5a05659a1cbb = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kaks erinevat koodibaasisisest arvutust sama suuruse jaoks, mitte ühe ümberütlemine: IEEE-1139 astmeseaduse kõvera poolitamine ei tea müratüübist midagi, samas kui suletud kuju pöörab domineeriva tüübi algebraliselt ümber, nii et valesti klassifitseeritud müratüüp või halb raam ilmneb mittetühise suhtelise erinevusena. Neli väärtust reprodutseerivad ka artikli avaldatud tabeli selle viimase trükitud numbri poole täpsusega -- kuid see tabel ise rekonstrueeriti samast suletud kujust, seega on see reprodutseeritavuse kontroll, mitte väline sõltumatu etalon, ja raamiliige, mille vastu seda mõõdetakse, on modelleeritud jaotus

# text
seg-d9742b5a3a48 = lunar_time_budget::tests ja lunar_time_budget_scenario::tests (kõik neli klassi on olemas ühel käitusel ja küsitud alamhulga järjekorras; iga rida on kooskõlas oma suletud kujuga paremini kui { "1e-12" } suhteliselt; raamivea skaleerimine teguriga k skaleerib ristumist teguriga k flicker-FM kella puhul ja teguriga k^{ "2" } valge-FM kella puhul, kontrollitud juures k={ "2" } ja k={ "3" }, mis eristab kahte müraklassi; iga rida reprodutseerib ühe kella ristumise, mille eelarve juba teatas; iga rida taastab ühe jagatud raamiliikme; tundmatu kella nimi lükatakse tagasi)

# text
seg-75715af43b8b = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Hulga sisaldumine: segaja ja signaali suhe siseneb ühtse detsibellinihkena, seega sisaldab suurema saatevõimsuse püütud hulk väiksema oma ja osakaal saab ainult tõusta -- omadus, mida Airy mustri puhul MITTE ei saa kiirelaiuse ega kõrguse järgi, kus püütud piirkond lõheneb ringideks ja osakaal on tõepoolest mittemonotoonne. Ükski avaldatud tabel ei anna Kuu orbitaalse saatja püütud ketta osakaalu kõrguse ja kiirelaiuse funktsioonina, seega pole midagi välist, mille vastu neid lahtreid kontrollida; all olev muster on eraldi valideeritud avaldatud Besseli väärtuste vastu ja sellel on oma rida

# text
seg-024dfb3684f1 = antenna

# text
seg-7e64cec1882e = antenna::tests ja attack_surface::tests (ruudustik on täielik ja iga püütud osakaal asub vahemikus [{ "0,1" }]; püütud osakaal on saatevõimsuse suhtes mittekahanev igas sõlmes; see EI OLE monotoonne kiirelaiuse ega kõrguse suhtes, mida kinnitab oma test, et pühkimist ei saaks hiljem silendada; baassõlm reprodutseerib olemasoleva püütud osakaalu bitthaaval; ainult servapõhine hindamine on bitthaaval identne täieliku pühkimise viimase punktiga; leitud ristumine asub lävel täpsusega { "1e-9" } dB ja jääb kahe punkti vahele)

# text
seg-eebb00692020 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ainult enesekooskõla: avaldatud kogusummat kontrollitakse samas failis olevate liikmete ruutude summa juure vastu ja väljastatud kõver reprodutseerib väljalastud p3_time_budget_curve.csv kõigis { "57" } punktis. Mõlemad kontrollid jagavad selle mootori enda liikmemääratlusi, seega kumbki ei ole sõltumatu. Kellaliige tugineb avaldatud kellaspetsifikatsioonidele, kuid lingi, raami, relativistliku ja efemeriidi põranda SUURUSED on dokumenteeritud eelarvejaotused, mille jaoks puudub sõltumatu etalon

# text
# c1: total
seg-d804d9874191 = lunar_time_budget_scenario::tests (kõik { "57" } keskmistamisaega x { "8" } liiget on olemas, ruudustiku indeks jookseb { "0" }..={ "56" } ja kannab { "8" } rida igaüks; <c1/> rida võrdub seitsme selle kõrval oleva liikme ruutude summa juurega igal tau juures; tabel järgib küsitud ruudustikku, mitte kõvakodeeritut; selle väljastamine jätab aruande JSON-i bait-baidilt identseks)

# text
seg-af88df24ce81 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ainult sisemine kooskõla: poolitatud aeg lävendini kontrollitakse kella domineeriva müratüübi suletud kujuga pöördväärtuse vastu ja vabalt jooksva kella liiget eelarve enda kellaliikme vastu. Kellaklassid tuginevad avaldatud ühepäevastele spetsifikatsioonidele (nende endi read); LTC määra ei tuletata siin uuesti ja sellel on oma VALIDATED rida (Kuu koordinaataeg); juhtimisjääk on ILLUSTRATIVE, realisatsioonijääk on eelarvejaotus ja soojusmudelit ei ole kaasatud. ICG WG-B Lunar PNT materjalis juunist { "2024" } kirjeldatud nanosekunditasemel eesmärk on toodud allika väitena, mitte omaks võetud väitena; midagi siin ei ole väide ühegi tegeliku jaamakella kohta

# text
seg-61e51873ef4b = lunar_time_lab (over clock_specs, lunar_time_budget, lunar_time)

# text
seg-73a747390b44 = lunar_time_lab::tests (free_run_clock_term_is_the_budget_clock_term: kui juhtimine on väljas, võrdub kellaliige eelarve kellaliikmega bitini kõigi nelja klassi puhul; bisection_matches_the_closed_form täpsusega { "1e-9" } suhteliselt mõlema müraklassi puhul; threshold_below_the_floor_is_flagged; steering_holds_and_resets; height_term_is_opt_in_and_linear; device_card_reproduces_a_named_class; bad_inputs_are_refused); tests/lunar_station_time_lab.rs (the_block_is_additive: vaikedokument, tabel ja kokkuvõte on muutmata ning plokk lisab ainult oma objekti ja ühikud; time_to_threshold_matches_the_closed_form_through_the_scenario; clocks_are_ordered_over_the_span_where_the_model_orders_them: optical < PHM < RAFS < miniRAFS vahemikus { "1" } s kuni { "7e5" } s, kusjuures PHM ja RAFS kõverate ristumine vahemikus { "7e5" } ja { "8e5" } s on kinnitatud avalikustatud omadusena üksiku müratüübiga kellamudelite puhul; every_time_lab_field_has_a_unit; unknown_time_lab_fields_and_clocks_are_refused)

# text
seg-5b1e2e05b9c8 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Tasalaine delta_dor (sama koodibaas) kaugvälja piirjuhul; lõplike vahedega osatuletised. { "0.30" } väline võrdlus, leid (jääb MODELLED): ANISE { "0.10" } koondunud valguse levimisaegade vastu DE440 kaudu ({ "75" } viivitust 2024-01-01 kolmel DSN baasjoonel, genereeritud kaustas xval/anise-lunar-od ilma Kshana koodita) ei ole ükski viivitus { "1" } ps tolerantsi piires. Suurim lõhe on { "24" } µs, mis tuleneb analüütilisest Kuu keskmest (umbes { "200" } km DE440-st), ühest hetkelisest geomeetriast ilma valguse levimisaja iteratsioonita ({ "3.6" } µs) ja välja jäetud poolusliikumisest; majakate osatuletised erinevad kuni { "2.9e-3" } suhteliselt vs { "1e-6" }. Mooduli dokumentatsiooni väide, et raamilähendused on mudeli täpsusest allpool, sellel tasemel ei kehti. { "0.30" } ring { "2" }: tuumatee (lunar_vlbi::KernelGeometry) on valideeritud NAIF SPICE valguse levimisaegade vastu oma reas, Lunar geodetic VLBI, kernel path; selle tee ANISE võrdlus (75/75 { "1" } ps piires, halvim { "0.12" } ps, tests/lunar_vlbi_anise_oracle.rs::kernel_delay_matches_the_anise_light_time_difference) on ainult tuuma hindamise ristkontroll, sest valguse levimisaja lahendus selles testistendis on selle projekti enda. See rida (analüütiline vaiketee) jääb MODELLED ülaltoodud leiuga

# text
seg-71c4fb3e4d08 = lunar_vlbi::tests (kaugvälja piir vastab delta_dor-ile; lähivälja parandus; FD osatuletised); tests/lunar_vlbi_anise_oracle.rs::near_field_delay_disagrees_with_the_anise_light_time_difference

# text
seg-ed40da9bdfae = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga samasused ja sisemine kooskõla; sõltumatut etaloni EI väideta. Serva poolnurka kontrollitakse asin(R_earth/r_orbit) vastu ja geomeetriat selle vastu; vabaruumi kadu, DOP tuum ja SGP4 levitamine, mida see koostab, on igaüks väliselt valideeritud oma ridades ja see rida ei laena nende staatust. MIKS MODELLED, ja see on saatemuster: võimendus nurga all on ühtlaselt valgustatud ringapertuur, Airy muster, samas kui tegelik GPS L1 antenn on kaheteistkümne elemendiga spiraalantennivõre kujundatud peasagaraga, mille tipp on telgjoonest kõrvale nihutatud, et Maa kettal võimsust ühtlustada, ja külgsagaratega, mis ei ole Airy. Avaldatud mõõdetud mustrid on olemas ja neid ei ole siia kaasatud, seega kehtivad järjestused ja suurusjärgud, kuid ühegi üksiku satelliidi dB mitte. ESIMENE TEOSTUS SELLEST REAST OLI VALE VIISIL, MIS VÄÄRIB KIRJAPANEKUT: Airy avaldis kehtib ainult ettepoolses poolsfääris, selle argument on sin(theta) ja nurga theta ligidal { "180" } kraadi pakitakse see ümber ning annab apertuuri taga TÄIELIKU TELGJOONE VÕIMENDUSE - nii olid esimese aruande kaks tugevamat linki satelliidid, mille antennid olid Kuust eemale suunatud, ja nad olid ainsad kaks, mis lävendi ületasid. Apertuuri taga rakendab mudel nüüd lamedat tagasagara põrandat, mis on öeldud piirina, mitte väljamõeldud mustrikujuna. Tahtlikult puuduvad, igaüks muudab eelarve OPTIMISTLIKUKS: ionosfääri- ega troposfäärikadu serva riivavatel kiirtel, polarisatsiooni-, suunamis- ega teostuskadu ning sfääriline Maa ilma refraktsioonilise laienduseta. Kuu asukoht on SISEND, mitte efemeriidi otsing, sest testitav suurus on link ja kiire geomeetria. Selle rea tõstmiseks valideeritud tasemele on vaja mõõdetud saatemustrit ja LuGRE normaalpunkte, mille vastu kontrollida; kumbagi ei ole hoidlas ja kumbagi ei ole siin välja mõeldud. { "0.30" } ring { "2" }, leid (jääb MODELLED): mõõdetud sisendiga lingitee (tegelikud SP3 asukohad, plokipõhine saatevõimsus, tabuleeritud saate- ja vastuvõtumustrid, hankimise ja jälgimise hüsterees) kontrolliti Montenbruck et al. { "2023" } tabeli { "3" } vastu GENESIS-e jaoks { "6000" } km juures (eelregistreeritud 5b414f0a): seniidiantenni keskmised on kooskõlas { "5" }-l { "6" }-st ühe dB piires artikli tundlikkusest; nadiirantenni keskmised on { "1.0" } kuni { "2.4" } satelliiti kõrgemad kui trükitud, tõenäoliselt seetõttu, et artikkel kasutas asimuudist sõltuvaid GPS külgsagarate mustreid, mis ei ole avaldatud. Selle rea Kuu kauguse arvud kasutavad endiselt Airy asendajat. { "0.30" }+ D7, leid (jääb MODELLED): ümbersõnastatud suurus, Block IIR/IIR-M satelliitide C/N0 ERINEVUS, mida jälgitakse ühel epohhil, ennustatuna NAVCEN satelliidipõhiste mõõdetud L1 mustritega (kahemõõtmelised, yaw-juhtimise raamis) LuGRE lennu C/N0 vastu (eelregistreeritud 768cb62b: { "99" } % nähtav, paari RMS <= { "3.0" } dB, mediaan <= { "2.0" } dB, vähemalt { "50" } kirjet ja { "30" } paari), jääb andmetest puudulikuks: { "26" } kvalifitseeruvat ülekande- ja Kuu orbiidi epohhi sisaldavad { "15" } jälgitud IIR/IIR-M kirjet (enamasti jälgitakse IIF ja III) ja ühe paari. Kõik { "15" } ennustatakse nähtavaks ja ainsa paari jääk on -0.06 dB; midagi ei väideta

# text
seg-1755ed282a7d = earth_gnss_lunar::tests ({ "11" } teegi testi: Maa serva poolnurk vs selle suletud kuju asin(R/r) täiendava kinnitusega, et IGA varjamata link asub väljaspool seda koonust, seega ei saa varjutuse test ja serva nurk olla vastuolus; varjutuse predikaat kontrollitud lähiküljel, kaugküljel ja juhul, kui keha asub saatja TAGAS; teekadu piiratud usutava Kuu ulatuse vahemikuga igal lingil; jälgitav hulk näidatud olevat geomeetriliselt nähtava hulga alamhulk ja varjatud hulgast lahutatud; monotoonsus mõlemas suunas - rohkem vastuvõtuvõimendust ei vähenda kunagi arvu, rangem lävi ei suurenda seda kunagi; ühelegi lingile ei omistata rohkem kui telgjoone võimendust; Maa sees olev vastuvõtja lükatakse tagasi; pühkimine kinnitatud epohhiga tegelikult MUUTUMA; ning signaali ja fiksi kättesaadavus kinnitatud erinevaks, õiges järjekorras ja kooskõlas epohhipõhiste ridadega); tests/earth_gnss_measured_montenbruck_oracle.rs::finding_genesis_nadir_counts_exceed_the_paper (kinnitatud); tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (kinnitatud leid)

# text
seg-5242a1ecb1f9 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Sõltumatu scipy/numpy programm integreerib samu variatsioonivõrrandeid (lävi O1). Midagi ei võrrelda Kuu orbiidi mõõtmisega. Sõltumatu etalon kontrollib öeldud valemite numbrilist külge, mitte füüsikat, seega jääb rida MODELLED. Piiratud kolme keha mudel: ei Päikest, ei Kuu harmoonikuid, Maa pöörlemistelg piki orbiidi normaali, ILLUSTRATIVE vastuvõtja ja jaama sisendid.

# text
seg-e9a23134de45 = lunar_infra::{ "{" }orbit, gnss, od{ "}" }

# text
seg-13dceb4f0d7b = tests/lunar_infra_od_consistency.rs (lävi O1: kolme päeva ja ühe perioodi jooksul aheldatud olekuülekandemaatriks võrdub scipy DOP853-ga suhtelise täpsusega { "1e-6" }; lävi C1: keskmine q ja 95 %-sisese osakaal; lävi C2: valim formaalse jälje suhtes iga hindaja puhul; lävi C3, NOT MET ja kinnitatud: kui modelleerimata kiirendus on { "3e-10" } m/s2, on 95 %-sisese ületamine { "0.0525" }, mitte vähemalt { "0.5" } - pardahinnang on teada ainult sadade meetrite täpsusega, seega peitub umbes kümne meetri nihe selle kovariatsiooni sees); lunar_infra::orbit::tests, lunar_infra::gnss::tests, lunar_infra::od::tests, lunar_infra::la::tests

# text
seg-a5f9d7981f42 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Sõltumatu numpy lahend samadest normaalvõrranditest eksporditud ridadest (Q3) ja täieliku läbivaatuse täisarvuline loend (Q4). GNSS-i ega Kuu kandelaine faasi mõõtmisega ei võrrelda. MODELLED.

# text
seg-2d4d23841d56 = lunar_infra::phase; lambda

# text
seg-0b34672f668b = tests/lunar_infra_carrier_phase.rs (lävi Q1: Monte Carlo edu vähemalt bootstrap-piir miinus kolm standardviga; Q2: kaare pikkusega ei lange üle kolme standardvea; Q4: LAMBDA võrdub täieliku läbivaatuse loendiga { "200" } tõmbe korral kuni viie mõõtmega; Q3: ujuv kavand võrdub sõltumatu numpy lahendiga täpsusega { "1e-9" } mitmetähenduslikkuse ja asendi kovariatsioonide puhul ning bootstrap-määr on NOT MET täpsusega { "1e-9" }, kinnitatud: see erineb suhteliselt { "1.7e-6" } võrra, sest LAMBDA normaaljaotuse CDF on Abramowitzi ja Steguni lähendus)

# text
seg-ee535014d898 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Otsese mudeli sõltumatu numpy lõplike vahede arvutus (F2). Midagi ei võrrelda tegelike Kuu raamilahenditega. Tegur on tingimuslik eeldatava teadaoleva orbiidi ja { "1" } m kaugusmõõtmise sigma suhtes. MODELLED.

# text
seg-0abe3b27addf = lunar_infra::frame; lunar_datum; lunar_identifiability; lunar_llr_geometry

# text
seg-30c57d85abc1 = tests/lunar_infra_studies_3_5.rs (lävi F1: CRLB jälg ei tõuse ja väikseim omaväärtus ei lange orbiiterite linkidega, näites ja { "20" } algväärtustatud (seed) juhuslikus hulgas; lävi F2: kaugusosatuletised võrduvad sõltumatu numpy longdouble lõplike vahedega Rodriguesi otsesest mudelist { "50" } geomeetrial; lävi F3: väikseim omaväärtus tõuseb vähemalt 2.0x, leitud umbes 111x)

# text
seg-8d70ea5318fa = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Sõltumatu numpy virnastatud süsteem, kus asendi tundmatud on elimineeritud selgete Schuri komplementidega (T3). GRASP-i, Genesise ega muude missiooniandmetega ei võrrelda. MODELLED.

# text
seg-0e7813b34509 = lunar_infra::tie; fim::crlb_srif

# text
seg-58f77b27cde3 = tests/lunar_infra_studies_3_5.rs (lävi T1: nihkesigmad ei lange, kui lokaalne side lõdveneb; T2: kui tehnikasigmad on skaleeritud teguriga { "1e-6" }, on iga paari nihkesigma { "1" } % piires sqrt({ "2" }) korda lokaalse sideme sigmast, leitud { "3e-7" } piires; T3: informatsioonimaatriks võrdub sõltumatu numpy virnastatud koostega täpsusega { "1e-9" }). Esimene T2 käitus normaalvõrrandi ümberpööramisega jäi läbi ({ "1.3" } % { "0.1" } m sideme juures, väärtused põranda all { "1" } m juures); põhjus oli numbriline ja kovariatsioon viidi ruutjuure teele enne, kui lävi uuesti hinnati.

# text
seg-6c1a6dc96a6a = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Sõltumatu numpy lõplike vahedega koost (G2) ja suletud kujuga hindamine (G4). Orbiiteri pere k2 tundlikkus on ülemise otsa näitaja (orbiidi olek neelab siin ainult konstandi ja trendi). Kuu loodete ega libratsiooni mõõtmisega ei võrrelda; k2 on toodud Lemoine et al. { "2014" } nominaalväärtusena. MODELLED.

# text
seg-8e55bf5a6a8f = lunar_infra::geodesy; lunar_od::degree2_tide_accel; lunar_time

# text
seg-4b42d4f76a35 = tests/lunar_infra_studies_3_5.rs (lävi G1: analüütilised osatuletised võrduvad iga otsese mudeli kesk-lõpliku vahega täpsusega { "1e-8" }; G2: 5x5 informatsioon võrdub sõltumatu numpy koostega täpsusega { "1e-6" }; G4: kella loodete amplituud ning selle k2 ja h2 tundlikkused võrduvad sõltumatu hindamisega täpsusega { "1e-9" }; lävi G3 NOT MET oma jäljepoolel, kinnitatud: pere lisamine ei alanda kunagi väikseimat omaväärtust ({ "28" } { "28" }-st), kuid pseudoinversi jälg tõusis { "12" }-l { "28" }-st lisamisest, sest lisatud pere tõstis järku)

# text
seg-3ead905e6a5c = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — DOP aritmeetika on crate::orbit::dop tuum, mis on eraldi väliselt valideeritud gnss_lib_py vastu failis tests/dop_reference.rs; see rida ei laena selle rea staatust uuesti. Majaka nähtavuse horisont on L01 suletud kuju ja sigma = DOP x sigma_URE on standardne GNSS-i seos (Kaplan ja Hegarty, Understanding GPS/GNSS, jaotis { "7" }). Selle rea sees kontrollitakse täiendust ennast sõltumatu hoidlasisese DOP-tee vastu ja see on kinnitatud sisse viidud golden-etaloni külge. MIKS MODELLED: satelliidikonstellatsiooni kavand, majakate paigutus, antennide kõrgused ja kõik kolm veaeelarve suurust on illustratiivsed sisendid, mitte kasutusel olev mõõdistus ega mõõdetud link, seega on teatatud meetrid valitud stsenaariumi omadus, mitte ühegi kasutusele võetud teenuse omadus. MÄRKUS PÄRITOLU KOHTA: see võimekus oli README-s reklaamitud ja kasutusel kahes valideerimistestis, kuid sellel EI OLNUD maatriksirida ega stsenaariumi liiki, seega ei saanud sellele ühestki käitusest ligi. See oli proosas väidetud, registris puudu ja mootoris kättesaamatu korraga. Rida ja liik lisati koos. { "0.30" } ring { "2" } (eelregistreeritud db0eb9ec), blokeeritud (jääb MODELLED): ANISE { "0.10.6" } nähtavus ja numpy DOP rea geomeetrial on kooskõlas (nähtavad hulgad täpsed, sealhulgas { "72" } horisondilähedast ja { "48" } maskilähedast juhtu; DOP { "7.2e-13" } piires), kuid teatatud meetrid on DOP korda illustratiivne { "1.158" } m ruutude summa juurega kaugusmõõtmise viga ilma sõltumatu etaloniga; neid välistav ulatuse piiritlemine ootab omaniku otsust

# text
seg-2e097e952eb5 = lunar_beacon::tests (horisondi nähtavus vs L01 suletud kuju; majakaga täiendatud DOP vs paljas; veaeelarve ruutude summa juur; DOP-i ja meetrite seos); tests/validate_p2_beacon_before_after_table.rs (kogu enne/pärast tabel kinnitatud sisse viidud golden-etaloni külge suhtelise täpsusega { "1e-9" }); tests/validate_p2_beacon_before_after_independent_dop.rs (sama geomeetria läbi SÕLTUMATU DOP-tee, seega ei kontrollita täiendust tuuma vastu, mis seda tootis); tests/validate_lunar_beacon_anise_visibility_dop.rs::beacon_visibility_and_augmented_dop_match_anise_and_numpy

# text
seg-f8ac8be96a63 = cmpl_horizontal piirab pimeda ühisrežiimi klassi põhjustatud k-sigma horisontaalse asendivea, moodustades blind_position_covariance = S<em>Cov</em>S^T ja projitseerides selle ENU-sse; integrity_envelope teatab hpl_total = hpl_araim + cmpl. Eristus, mida see paar tegema on loodud: RAIM/ARAIM-i JÄÄGI test on tõestatavalt pime range(G) vigade suhtes, kuid ARAIM-i KAITSETASE ei ole -- selle veatu liige piirab neid juba kuni pakkuja URA pluss nominaalse nihkeni. CMPL on seega ainult pakkujatevaheline ÜLEMÄÄR, mida üksiku pakkuja pakkujapõhine URA/ISM ei kata, ja summa on konservatiivne kolmnurgavõrratuse piir, mitte RSS, mis kehtib ainult seal, kus see ülemäär pole juba URA sees.

# text
seg-753412b4c8f3 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Analüütiline projektorialgebra, mida kontrollitakse iseenda vastu: range(G)-ga piiratud kovariatsioon peab andma positiivse CMPL-i, pariteediruumiga piiratud kovariatsioon peab andma ligikaudu nulli ja ümbrik peab liitma kaks mõõteruumis ortogonaalset panust. Ühisrežiimi kovariatsioon, satelliidikonstellatsiooni geomeetria ja k on esinduslikud modelleeritud sisendid, MITTE sertifitseeritud eelarve, ja ei väideta, et kolmnurgapiir oleks tihe. MÄRKUS PÄRITOLU KOHTA: cmpl_horizontal, blind_position_covariance ja integrity_envelope on avalikud ja tarnitud ning nende ühikutestidele viitas juba ühisrežiimi pimeduse rida, kuid ÜMBRIKU VÄIDE ise ei kandnud rida - seega ei olnud ühtki hoiatust, mis seda ausana hoiab, et summa on kolmnurgapiir, mitte RSS, registris nimetatud kusagil. Rida registreerib väite ja hoiatuse koos.

# text
seg-9e4affc02b0b = lunar_common_mode::tests (common_mode_covariance_gives_positive_cmpl, parity_only_covariance_gives_near_zero_cmpl, envelope_sums_the_two_classes, state_map_matches_split)

# text
seg-a4d8fdc530e4 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Analüütiline andmepunkti defekti struktuur — jälgimatu absoluutraami mood asub Fisheri informatsiooni nullruumis (suletud kuju), järgu lävi vastab avaldatud 3-jaamalisele kavandi põhjendusele ja hindaja saavutab saadud CRLB-i Monte Carlos. Kuu geomeetria ise on esindusliku võrgu geomeetria (mitte lennatud efemeriid), seega jääb rida MODELLED; aluseks olevat FIM/CRLB mootorit kontrollitakse eraldi Kay ({ "1993" }) suletud kujude vastu. { "0.30" } ring { "2" } (eelregistreeritud fab02df9), blokeeritud (jääb MODELLED): NumPy/SciPy arvutavad järgu ja defekti uuesti öeldud { "1e-9" } lävendil, jaamateljestiku osa nullruumis ({ "8.4e-10" } piires) ja jaama CRLB ({ "1.2e-10" } piires) { "17" } sissekirjutatud Kshana genereeritud konfiguratsioonil (P2). Ei ole tõstetud: väide, et hindaja saavutab piiri (Monte Carlo efektiivsus umbes { "0.98" }), jääb sõltumatu etaloni ilma, ja piiritlemine, mis jätaks selle MODELLED, ootab omaniku otsust

# text
seg-4f3b4fe41736 = lunar_combination (lunar_observability) + fim

# text
seg-e927515cc210 = lunar_combination::tests (ilma Maa baasjoonteta järgupuudulik; kolm baasjoont taastavad täisjärgu — 3-jaamaline lävi tuleneb informatsiooni järgust, mitte lahendi veast; jaama CRLB saavutatakse hindaja poolt efektiivsusega { "0.98" }; CRLB tiheneb monotoonselt baasjoontega); tests/lunar_observability_numpy_oracle.rs::lunar_observability_matches_numpy_on_the_committed_jacobians

# text
seg-5fda3995c3fb = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Etalon: väärtused, mida LSIS V1.0 trükib valideerimiseks (tabelid C-1 kuni C-5, D-1 kuni D-6, E-1 kuni E-6), ja selle lisa { "3" } elektroonilised koodifailid, nullikokkulangematuse kriteeriumi all, mis fikseeriti enne võrdlust. Kriteerium jääb täitmata ühe trükitud lahtri tõttu, mis on sisemiselt vastuolus standardi enda lisa { "3" } failiga, seega jääb rida MODELLED; veaparanduse märkus on koostatud. Samad kiibid võrduvad ka LANS-AFS-SIM-i omadega (rida 'LunaNet AFS baseband rendering against an independent generator, given its channel state')

# text
seg-84ece56ff3e9 = lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (IS-GPS-800J indices)

# text
seg-d111b6550515 = lunar_afs::codes::tests (maksimaalse pikkusega registrid, Legendre'i tasakaal, G2 viivituse edasi-tagasi teisendus, taseme kompositsioon); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (ilma LSIS vahemäluta: neli viidatud arvu kinnitavad leiu; sellega: { "2 937 232" } kiipi ja bitti vs LSIS lisa { "3" } failid, trükitud esimesed/viimased { "24" } kiipi, Legendre'i tabelid D-1 ja E-1 ning G2 initsialiseerimised annavad täpselt ühe erineva kirje, tabeli E-5 PRN { "147" } lahtri 'last { "24" } chips', mis dubleerib PRN { "151" } oma, samas kui lisa { "3" } fail on generaatoriga kooskõlas); range eelregistreeritud test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact on selle lõhega ignoreeritud

# text
seg-f30130dca525 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Teek: PocketSDR-AFS (T. Ebinuma T. Takasu PocketSDR { "0.13" } järgi, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-riba ehitus, ainult-printimise logitaseme koopia), enne iga käitust fikseeritud kriteeriumide all. Kolmas eelregistreeritud võrdlus täidab oma dekodeerimise ja jälgimise läved C1 ja C2 täielikult, kuid mitte oma valvet G0 nagu kirjutatud (kaks muutmata vastuvõtja käitust erinevad samas neljas hankimiskirjes), ja teine jäi { "5" } rikkumisega täitmata, seega jääb rida MODELLED. LANS-AFS-SIM ja PocketSDR-AFS jagavad autorit ja loetakse üheks sõltumatuks teostuseks; kaadrikodeerimise rea trükitud vektorite kontrollid kaitsevad ühise valestilugemise vastu

# text
seg-8cd700abad59 = lunar_afs::waveform (recording and truth labels), xval/lunar-afs/run_pocketsdr.sh

# text
seg-22dbd05adf9c = tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (kolmas eelregistreerimine: { "2" } sõlme, { "4" } kanalit jälgitud, halvim Doppleri viga { "0.57" } Hz, halvim koodinihke viga { "0.008" } chip, kõik { "6" } kaadrit dekodeeritud õige TOI-ga üle { "99" } -> { "0" } ümberpakkimise ja sobiva alamkaadriga { "2" }; G0 ei ole täidetud nagu kirjutatud, vastuvõtja enda käitustevaheline varieerumine oma hankimiskirjetes); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (teine: { "5" } rikkumist); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (esimene: tühine); kolme faili ranged testid on oma lõhedega ignoreeritud

# text
seg-2f05d26e8be6 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — gps-sdr-sim (MIT, commit 28ca29a6, käitatud eraldi programmina sissekirjutatud testistendi kaudu), eelregistreeritud f88f2969 bitt-bitilt täpse lävega (A) C/A kiipidel, (B) igal arvutatud LNAV väljal, (C) igal pariteedibitil. LEID: (A) { "0" } { "32 736" }-st kiibist erineb, (C) { "0" } { "1 920" }-st sõna pariteedist erineb, (B) { "230" } { "1 152" }-st arvutatud väljast erineb ühe ühiku võrra: gps-sdr-sim-i eph2sbf kärbib nulli suunas C-i teisendustega seal, kus edastatud täisarv vajab ümardamist (iga erinev väärtus asub { "0.01" } ühiku piires Kshana ümardatud täisarvust). Jääb MODELLED: registreeritud lävi oli konjunktsioon

# text
seg-9b511cb035c0 = gps_lnav, sdr

# text
seg-83c50906fe74 = tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (kinnitatud leid); tests/gps_l1ca_gpssdrsim_cross_generator.rs::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (range, lõhega ignoreeritud); gps_lnav::tests

# text
seg-d61a6fd7896c = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — gps-sdr-sim (MIT, commit 28ca29a6) I/Q valimid ja selle enda kanali olek, eelregistreeritud 7777da53: (B1) iga simuleeritud PRN hangitud, (B2) ühtegi teist PRN-i ei hangitud, (B3) koodifaas { "0.5" } chipi piires, (B4) Doppler { "125" } Hz piires. LEID: B1, B3 ja B4 kehtivad mõlemas aknas (halvim { "0.195" } chip, { "72" } Hz), kuid B2 ebaõnnestub: kõik { "21" } PRN-i, mida gps-sdr-sim ei simuleerinud, ületavad samuti lävendi (statistik { "151" } kuni { "206" } vs { "79.5" }; simuleeritud PRN-id { "1 300" } ja üles). Lävend on seatud mõõdetud valimivõimsuse Gaussi müra jaoks; gps-sdr-sim ei lisa müra, seega sisaldavad puuduva PRN-i lahtrid teiste satelliitide ristkorrelatsiooni. Jääb MODELLED: registreeritud lävi oli konjunktsioon

# text
seg-7b32ce65d953 = iq::acq (acquire, AcqConfig); iq::io (decode_samples); iq::scene (GpsL1Ca)

# text
seg-538f0f38481a = tests/iq_gpssdrsim_cross_generator.rs::acquisition_threshold_is_crossed_on_gps_sdr_sim_noise_free_samples (kinnitatud leid); tests/iq_gpssdrsim_cross_generator.rs::acquisition_finds_gps_sdr_sim_satellites_in_its_samples (range, lõhega ignoreeritud)

# text
seg-9f9b58158cde = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Monitoride enda suletud kujud Kshana enda GPS L1 C/A stseenidel (müra ja legitiimsed signaalid; satelliitide enda signaalide sumbumissündmused), lävede vastu, mis on eelregistreeritud failis docs/design/MONITORS-IN-CAMPAIGN.md (382ab2f4). LEID: M1, M2 ja M4 täidetud. M3 täidetud tuvastamise osas ({ "18" } { "18" }-st sumbumisest, P_md { "0" }) ja NOT MET oma ajastuse klauslis: mediaanaeg tuvastamiseni on { "1.001" } s vs { "2" } x ARL1 valimit = { "0.433" } s. CUSUM näeb ühte hinnangut { "1" } s akna kohta, seega on valimite arvu piir alla ühe valimi. Ainult sisemine kooskõla: ühtegi tegelikku vastuvõtjat ega salvestatud häiret ei kontrollita

# text
seg-ee030053dc63 = iq::campaign (detect, runner, spec); iq::monitor (stats::gaussian_two_sided_pfa, sqm)

# text
seg-1663be50baf6 = tests/iq_campaign_monitors.rs: m1_power_test_false_alarm_rate_matches_the_closed_form ({ "73" } { "5900" }-st plokist vs { "99" } % binoomvahemik [{ "40" }, { "80" }] P_fa { "0.01" } korral), m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k (delta { "0.0160" }, suhe { "0.0131" } vs { "0.01" }), m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0 ({ "0" } vs { "0" }), the_monitors_table_parses_and_validates; m3_every_attenuation_is_detected_within_twice_the_arl1 (range, lõhega ignoreeritud); iq::campaign::detect testid; iq::monitor::stats testid (gaussian_two_sided_tail_matches_known_values); tests/iq_campaign.rs (kinnitatud räsid on ilma tabelita muutmata)

# text
seg-491de717dd05 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sünteetilised kampaaniad Kshana enda GPS L1 C/A stseenidest (satelliitide enda signaalide sumbumised), lävede vastu, mis on eelregistreeritud failis docs/design/DETECTION-ROC.md (b47e358d). LEID: R2 täidetud (juhuslik tase, kui pole midagi tuvastada). R1 NOT MET: cn0_drop AUC { "0.7855" } vs { "0.95" }, sest iga sündmusejärgne negatiivne aken pärib CUSUM-i lagunemise tuvastusest (kõik { "18" } sündmusejärgset negatiivset jõuavad väärtuseni { "81" } või rohkem; kõik { "18" } sündmuseeelset jäävad väärtusele { "0" }). Ainult sisemine kooskõla: ühtegi tegelikku vastuvõtjat ega salvestatud häiret ei kontrollita

# text
seg-e214fbcbf22e = iq::campaign (detect, report, runner); iq::monitor::spectral (kurtosis_reference)

# text
seg-c7d9da2a1afd = tests/iq_campaign_roc.rs: r2_with_nothing_to_detect_the_roc_sits_at_chance (AUC cn0_drop { "0.500" }, sqm_delta { "0.566" }, power_drop { "0.639" } öeldud sündmustel, mis ei sumbuta midagi); r1_the_cn0_drop_roc_separates_6_db_attenuations (range, lõhega ignoreeritud); iq::campaign::detect testid (the_roc_of_separated_and_of_identical_samples, windows_tile_the_time_outside_the_events)

# text
seg-e40884e4fef7 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sünteetiline parameetrite taastamine Kshana enda GPS L1 C/A stseenidel, kus on peale surutud teadaolev C/N0 profiil jaotise { "3.1" } valemist, jälgitud ja hinnatud käsuga kshana iq campaign, lävede vastu, mis on eelregistreeritud failis docs/design/LABFIT-FROM-IQ.md (jaotis { "5.1" }, muudetud 2026-10-12 commit'is b7117bf, jaotis { "13" }). Kampaaniate C/N0 hindaja (M2M4) fikseeriti commit'is 5b13e3c2, avaldati enne esimest läve hindamist (sissekirjutatud koos sobituskoodiga, mitte üksi), pärast ühte avalikustatud diagnostilist jälgimiskäitust. LEID 18 sündmusega läve-kampaania puhul: (c) PASS; (a') NOT MET, delta_eff viga -1.097 dB vs { "0.5" } dB (endiselt -0.89 dB siinidel { "38" } dB-Hz ja kõrgemal); (b') NOT MET, { "0" } { "50" }-st kampaaniast katab tõe (viga -1.189 +/- { "0.093" } dB, vahemik umbes { "0.3" } dB); (d) NOT MET, suletud kuju { "2.20" } dB allpool otsest J/S kaotuse juures, umbes sobitatud languse viibeajad korda tõusukiirus ({ "2.09" } dB); (a) ja (b) algsed Q klauslid on NOT MET, sest Q ei ole tuvastatav. JÄRELKONTROLL (läved eelregistreeritud commit'is 1e532f84, docs/design/evidence/labfit-followup/RESULTS.md): astmelise J/S kampaania puhul taastatakse delta_eff +{ "0.185" } dB piires (S1 MET: tõusuviga on hindaja viivitus); (d) nagu kirjutatud selle peal on täidetud jälgimissilmuse mudeliga ({ "0.45" } dB), kuid mitte empiirilisega ({ "6.42" } dB), seega S2 on NOT MET; värskel tõusukampaanial on (d) sobitatud languse viibeaegadega, millele on lisatud iga sündmuse tõusukiirus, { "1" } dB piires mõlema mudeli puhul (R1 MET), ning (a') ja (d) nagu kirjutatud jäävad jälle täitmata (-1.25 dB; { "2.32" } ja { "9.47" } dB). Kontrollitakse meetodit, mitte ühtki vastuvõtjat: seda ei saa sünteetiliste andmete põhjal VALIDATED staatusesse tõsta

# text
seg-f1371f2a4da4 = iq::labfit (campaign, cn0, iqfit, iqreport, schema, mod); iq::cli::labfit

# text
seg-27c989c6bdde = tests/iq_labfit_campaign.rs: bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent (PI90 kate { "0.891" } { "558" } siinil, { "0.900" } { "10" } kadumiseni jõudmise sündmusel iga lukustusmudeli korral), the_report_carries_its_inputs_censoring_validation_and_labels (sisendid, tsenseerimine, [validation] räsi ja otsused, ühikute ploki audit), the_cluster_bootstrap_reproduces_from_the_campaign_and_seed, a_validation_mode_fit_refuses_to_start_without_its_table; bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted, bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db ja bar_b_prime_ci_subset (range, lõhega ignoreeritud); bar_b_prime_full_set_of_50_campaigns (ignoreeritud, käitatud enne väljalaset); iq::labfit::cn0 testid (täpne Q-delta degeneratsioon, delta taastamine öeldud Q juures, suletud kuju läveni pöördväärtus); iq::labfit::iqfit testid (lukustusmudeli tingimused reprodutseerivad C/N0 mudelit täpselt); tests/iq_labfit_followup.rs (järelkontroll, mis registreeriti commit'is 1e532f84: s1_delta_eff_on_the_stepped_campaign MET, s2_d_as_written_on_the_stepped_campaign, mis kinnitab salvestatud NOT MET, r1_dwell_corrected_d_on_the_fresh_ramp_campaign MET, release-ehituses)

# text
seg-52d2a721c38a = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame eraldi programmina, eelregistreeritud ca5f0142: R1 pariteet ja dekodeerimine, R2 dekodeeritud väärtus võrdub Kshana täisarvuga korda IS-GPS-200 skaala { "2" }^-52 suhtelise täpsusega, R3 poole kvandi piires sisendist. LEID: R1 { "960" } { "960" }-st sõnast ja { "96" } { "96" }-st alamkaadrist; R3 iga parameeter, nädal ja viiteajad täpsed; R2 ebaõnnestub { "41" } väärtusel (af1, delta-n, IDOT) { "1" } kuni { "4" } ühiku võrra viimases kohas, sest RTKLIB-i P2_43 on kümnendarv { "1.136868377216160E-13" }, { "2.6e-16" } suhteliselt väärtusest { "2" }^-43; RTKLIB-i konstandiga jagamine annab igal juhul Kshana täisarvu tagasi. Jääb MODELLED: registreeritud R2 lävi oli sõltumatu etaloni enda konstandi jaoks liiga range

# text
seg-50acb4bcdd8a = tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (kinnitatud leid); tests/gps_lnav_rtklib_decode_oracle.rs::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (range, lõhega ignoreeritud)

# text
seg-d0d7bf57aa68 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) readrnx parsib IGS ööpäevast edastusfaili BRDC00IGS_R_20250610000_01D_MN.rnx ja decode_word/decode_frame dekodeerib Kshana sõnu, käitatud eraldi programmina; eelregistreeritud d4d9eb9d enne faili toomist, täisarvuline täpne lävi. Mutatsioon: ümardamise asemel kärpimine annab { "235" } ebaõnnestumist. Sama kodeerija varasemad võrdlused on kirja pandud leidudena: gps-sdr-sim-i vastu, mis kärbib ({ "230" } välja), ja RTKLIB-i skaleeritud väärtuste vastu, mille kümnendkonstant { "2" }^-43 jättis täitmata ühe ulp läve ({ "41" } väärtust). Integraatori järelkontroll (jääb MODELLED): võrdlus on kooskõlas ja pariteedikomplekti mutatsioon muudab selle samuti punaseks, kuid eelregistreerimine d4d9eb9d jõudis avalikule harule kell { "20" }:{ "02" }:{ "29" } UTC, kaks sekundit pärast tulemuse commit'i 1783f904 ({ "20" }:{ "02" }:{ "27" } UTC), mis juba hoiab RTKLIB-i väljundit selle faili jaoks, seega ei saa näidata järjekorda 'registered before the file was fetched'; värske registreering, mis avaldatakse enne nägemata edastusfaili toomist, lahendaks selle

# text
seg-90748b60b720 = tests/gps_lnav_rtklib_integer_oracle.rs::kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file ({ "32" } satelliiti IGS edastusfailist kuupäevaga { "2" } märts { "2025" }: { "960" } { "960" }-st sõnast läbib RTKLIB-i pariteedi, { "96" } { "96" }-st alamkaadrist dekodeerub, { "608" } { "608" }-st dekodeeritud edastatud täisarvust võrdub Kshana omadega, iga sisend poole kvandi piires, nädal ja ajad täpsed); gps_lnav::tests

# text
seg-407f33fff57c = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — GNSS-SDR { "0.0.19" } (GPL-3.0, eraldi programm, kinnitatud konfiguratsioon) üheksal mittepinnalisel L1 partiil ja lennuvastuvõtja RAW C/N0-l (LuGRE Mission Data, Zenodo { "16411687" }, CC BY { "4.0" }), eelregistreeritud 768cb62b. LEID: Kshana lugeja dekodeerib kõik { "288" } võrreldud lõiku identselt sõltumatu konverteriga; GNSS-SDR kuulutab { "266" } { "288" }-st otsingust positiivseks ja Kshana on kooskõlas kõigil { "266" } otsusel, kuid ainult { "250" } asuvad GNSS-SDR-i lahtris (A2 ebaõnnestub); C/N0 haru on tühine, kuna ükski lennu RAW epohh ei asu { "30" } s piires ühestki partiist (lähim { "141" } s). Enamik positiivseid on artefaktid: paljad kahe komplementi tasemed kannavad I-l ja Q-l keskmist -0.5, nullsageduse joont { "32" } dB üle müra { "1" } kHz siinis, mille mõlemad vastuvõtjad hangivad. Kaks partiid (OP5, OP12) jäeti ekslikult välja: nende metaandmete numbriteta lugemist peeti vastuoluks nende päistega; tegelik põhjus oli, et lugeja ei suutnud lugeda sõnast laiemat valimit (hiljem parandatud). Jääb MODELLED

# text
seg-c20f6fc678c5 = acquisition, portable_math, realdata::ion_sdr, realdata::lugre

# text
seg-6bf9cba81288 = tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (kinnitatud leid, andmetest sõltuv); tests/lugre_acquisition_gnss_sdr_oracle.rs::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (range, lõhega ignoreeritud); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests

# text
seg-90535435d10d = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Prognoositud Doppler ESA/ESOC lõplikest orbiitidest ja NAIF CLPS rekonstrueeritud trajektoorist (xval/lugre-predicted-doppler/predict.py, Kshanast sõltumatu), eelregistreeritud 0d1839d2. LEID: kõik { "288" } otsingut ületavad lävendi müral (valimivõimsuse statistikud umbes { "430" } kuni { "520" } vs { "346.3" }), seega P1 kehtib triviaalselt ja P3 kehtib ({ "274" } { "288" }-st prognoositud nähtavaks), samal ajal kui P2 ebaõnnestub { "4033" } { "4036" }-st paarist. Ribapiiratud esiots tõstab iga lahtri müra umbes { "1.46" } korda (kinnitatud: müra põrand { "292" } vs valge müra { "200" } OP2 PRN { "1" } juures), mida valimivõimsuse statistik ei näe. Jääb MODELLED

# text
seg-709106f38b9d = acquisition, realdata::ion_sdr

# text
seg-cfefde0dbf55 = tests/lugre_acquisition_predicted_doppler_oracle.rs::noise_alone_crosses_the_sample_power_threshold_on_lugre_iq (kinnitatud leid, andmetest sõltuv); tests/lugre_acquisition_predicted_doppler_oracle.rs::acquired_doppler_differences_on_lugre_iq_match_the_orbit_prediction (range, lõhega ignoreeritud)

# text
seg-46dbb16e2ba8 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Prognoositud Doppler ESA/ESOC lõplikest orbiitidest ja NAIF CLPS rekonstrueeritud trajektoorist (xval/lugre-predicted-doppler/predict.py, Kshanast sõltumatu), eelregistreeritud a81a9a4e. LEID: P1 ja P3 kehtivad ({ "4" } partiid, { "12" } { "12" }-st hankimisest prognoositud nähtavaks), kuid P2 ebaõnnestub { "8" } { "8" }-st paarist. Kaks tugevaimat paari vastavad prognoosile suuruselt, kuid märk on vastupidine (OP2 PRN 18/24: +{ "7670.0" } Hz mõõdetud, -7693.9 prognoositud; OP17 PRN 11/30: +{ "11155.0" }, -11114.4), seega on registreeritud järjekord „I madalas nibble'is“ partiide kaaskompleksne; kuus tuvastust napilt lävendi kohal ei vasta kummalegi märgile. Täpsustuse Doppleri hajumist ({ "30" } kuni { "50" } Hz kahe käituse vahel) alahindas registreering samuti. Jääb MODELLED

# text
seg-b93425830963 = tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (kinnitatud leid, andmetest sõltuv); tests/lugre_acquisition_cell_average_doppler_oracle.rs::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (range, lõhega ignoreeritud)

# text
seg-e10ffc7f4280 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Prognoositud Doppler ESA/ESOC lõplikest orbiitidest ja NAIF CLPS Fireflyi maandumiskoha tuumast (xval/lugre-predicted-doppler/predict_surface.py, Kshanast sõltumatu), eelregistreeritud 2108e6ff partiidel, mida pole kunagi varem avatud. LEID: mittetühisus ebaõnnestub; ükski partii ei sisalda kahte hankimist. OP40 välja jäetud (metaandmed nimetavad puuduvat faili); OP38, OP73, OP77_0, OP77_1 ei hangi midagi ja ei näita valehäiret tasemel { "1e-7" } (tippstatistikud { "325" } kuni { "356" } vs { "385.9" }); OP74 ja OP76 hangivad PRN { "31" } ning OP78_0 ja OP78_1 PRN { "12" }, igaüks üksi, kõik prognoositud nähtavaks. Jääb MODELLED. Avalikustatud kõrvalekalded: registreeritud { "10" } Hz Doppleri lävi tugineb koherentse täpsustuse sünteetilisele Monte Carlole, mitte juba nähtud partiide hajumisele, mida integraator küsis; OP40 jäeti välja enne käitust, sest selle metaandmed nimetavad valimifaili, mida andmekogum ei tarni

# text
seg-a6cce9d1c2fc = acquisition, realdata::ion_sdr, realdata::lugre

# text
seg-e953a0bb294b = tests/lugre_surface_acquisition_doppler_oracle.rs::each_surface_acquisition_is_a_single_predicted_visible_satellite (kinnitatud leid, andmetest sõltuv); tests/lugre_surface_acquisition_doppler_oracle.rs::surface_acquisitions_match_the_orbit_predicted_doppler (range, lõhega ignoreeritud)

# text
seg-9b89d7ff555a = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Diferentsiaalse veatühistuse samasus + DO-229E SBAS PL mehhanismi taaskasutus; ühe vahega + WLS lahend on lisaks ristkontrollitud RTKLIB-i lsq()/matinv() vastu (Takasu, BSD-2-Clause, kompileeritud C) — sõltumatu lahendaja kood, kuid sama esimese astme LOS-vahe algebra, seega ikka InternalConsistency

# text
seg-b4e5e57515cc = lunar_dpnt::tests (kella ühisrežiim tühistub täpselt; jääk kasvab baasjoonega; taaskasutab SBAS PL-i; satelliitide arvu austatakse ehitaja piirini { "24" }, seega ei saa suurem satelliidikonstellatsioon vaikselt tagastada väiksemat); tests/lunar_differential_pnt_reference.rs (ühe vahe jääk + WLS asendilahend vs RTKLIB-i lsq(), kompileeritud C lähtekoodist)

# text
# c1: oem
seg-4d32db579be8 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — kshana Kuu OEM eksport, mis on uuesti parsitud sõltumatu kolmanda osapoole <c1/> teegiga (R. J. Anderson): raami/aja märgid ja epohhipõhine olek on kooskõlas kirjutustäpsusega ({ "1" } mm / { "1e-9" } km/s) ja väljajäetud TIME_SYSTEM-iga eksport lükatakse tagasi — struktuurne vahetuse edasi-tagasi teisendus; Kuu raami/aja füüsikalist semantikat valideeritakse nende endi ridades, seega jääb see MODELLED. { "0.30" } väline võrdlus, leid (jääb MODELLED): teine sõltumatu lugeja, Orekit { "12.2" } CCSDS OEM parser (Apache-2.0, ranged vaikeseaded), keeldub mõlemast Kuu failist, sest see ei realiseeri LTC ja TCL ajasüsteeme (see dekodeerib teegi EME2000/UTC OEM-i ja dekodeerib Kuu failid, kui TIME_SYSTEM on asendatud TDB-ga); oem { "0.4.5" } dekodeerib need kirjutustäpsuse piires ainult toetamata ajasüsteemist tagasi langedes. Nende Kuu failide vahetus peavoolu CCSDS lugejatega ei ole kindlaks tehtud

# text
# c1: oem
seg-6a567344f386 = lunar_interop::tests (OEM kannab Kuu REF_FRAME/TIME_SYSTEM; ajametaandmed teisenevad edasi-tagasi; KIF ümbrik); tests/lunar_interoperability_export_reference.rs (kshana väljastatud Kuu OEM uuesti parsitud sõltumatu <c1/> Pythoni teegiga: REF_FRAME/TIME_SYSTEM/CENTER märgid + epohhipõhine olek vormingu täpsuseni; rikutud eksport lükatakse tagasi); tests/lunar_interop_oem_oracle.rs::recorded_two_reader_outcome_is_for_todays_export

# text
seg-2ceda14c0a73 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Käsitsi tuletatud mõõdikupõhised valemid: pöördvõrdeline Simpsoni mitmekesisus, kaalutud keskmine komposiit, piiratud/piiramata ajajoone kestused, nõrgima lüli tasemeredel

# text
seg-952626fc6feb = resilience::arch, resilience::score, resilience::diversity, resilience::timeline

# text
seg-921e4d47fd96 = resilience::score::tests (monotoonsus, komposiidi piirid, taseme lagi, modelleeritud päritolu); resilience::diversity::tests (pöördvõrdeline Simpson, ühisrežiim, SPOF)

# text
seg-173a6b137751 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga astakstatistika samasused (tau vahemikus [-1,{ "1" }] käsitsi arvutatud väärtustega; deterministlik algväärtustatud (seed) Dirichlet) ja konstrueeritud stabiilsed/ebastabiilsed tunnistajad

# text
seg-718240555c3c = resilience::stats, resilience::study, resilience::panel

# text
seg-0e1bd42aca5a = resilience::stats::tests (Kendalli tau käsitsi näide, Dirichlet' simpleks, ümberpöördumise määr); resilience::study::tests (stabiilsuse kontroll, ebastabiilsuse tunnistaja, deklareeritud-vs-mõõdetud, mitmekesisuse kollaps)

# text
seg-6ee8465d60c7 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga invariandid, mis vastavad 'representativeness justified + gaps-to-flight identified' compliance-distsipliinile; seotud kontrollistaatuse/etaloniliigi piiriga

# text
seg-246c5acb36ac = representativeness

# text
seg-300e70ee2f22 = representativeness::tests (validated-needs-external-anchor, modelled-needs-gap, modelled-TRL-ceiling, malformed-band, JSON fields)

# text
seg-177c7c6f506a = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga kasu/võitja samasused + olemasoleva quantum_trade::TradeResult täpne ümbris; ausus seotud esinduslikkuse registri (ledger) ja kontrollisiltidega

# text
seg-03c943a8f1fc = qtrade

# text
seg-2d5a97db03cb = qtrade::tests (kasu polaarsus suurem/väiksem-on-parem, ümbritseb tegelikku TradeResult-i täpselt, ebaausad tõendid lükatakse tagasi, valideeritud-FoM vajab välist ankrut, deterministlik JSON)

# text
seg-05e779241ded = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Taaskasutatud kella/CAI koefitsiendid (holdover/clock_state, avaldatud väärtused) + suletud kujuga jaotusmüra/kao samasused põimumislingi jaoks

# text
seg-fe77856b9e9d = quantum_devices::tests (kellakaardid ausad+järjestatud; põimumise korduvtäpsus ~1/sqrt(tau); tuvastatud määr -10x/10dB; tumeloendused halvendavad; süstemaatilise põranda piirid; kaart modelleeritud+kehtiv)

# text
seg-06a01a48fcad = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga ruutsummaeelarve taaskasutatud valideeritud tuumade kohal (ADEV vs Stable32/NIST; TPL piir; tuvastamine analytic_pd/pmd); ausus seotud esinduslikkuse registriga (ledger)

# text
seg-65f4bc801f94 = timetransfer_chain::tests (korduvtäpsus paraneb integreerimisega; kvant võib nii võita KUI KA kaotada; PL lõplik-positiivne; turvalisuse FoM vahemikus [{ "0,1" }] ja kasvab ründeviivitusega; anomaalia Pd monotoonne; kompromiss is_honest)

# text
seg-6ccf2bd93426 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Taaskasutatud inertsiaalsed eelarved ristkontrollitud sama liikumisarvestuse diferentsiaalvõrrandi sõltumatu Octave'i kahekordse integreerimisega (erinev käitusaeg, jagatud mudel → ReferenceImpl) pluss Freier-2016 avaldatud lühiajaline müra ühepoolse ankruna; kvant-vs-klassikaline komposiit jääb MODELLED

# text
seg-52d8ccc852f8 = quantum_nav_od::tests (kvant ületab klassikalise pika katkestuse korral; eelis sõltub katkestusest; kompromiss is_honest); tests/gnss_free_quantum_navigation_reference.rs (liikumisarvestuse asendi kasv vs sõltumatu Octave'i kahekordne integreerimine + Freier-2016 avaldatud müra ankur)

# text
seg-a06ba11bd079 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga Gaussi AUC = Phi(mu/(sigma*sqrt2)), ristkontrollitud väliselt valideeritud eval_stats::bootstrap_auc_ci vastu (vs scikit-learn) + tuvastamise analüütilised lävendid

# text
seg-8e49ee940482 = quantum_faults::tests (analüütilise AUC teadaolevad väärtused; empiiriline bootstrap AUC ümbritseb suletud kuju; kvant tuvastab väiksemaid vigu / kõrgem AUC; eelis kaob suurte vigade korral; 5-klassiline kataloog; kompromiss is_honest)

# text
seg-c38a05cc3fdb = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Hindaja ja geomeetria enesekooskõla: otse→pöördteisendused edasi-tagasi, Fisheri/CRLB samasus J·CRLB=I, GDOP monotoonsus ja hindaja, mis saavutab oma Cramér–Rao piiri Monte Carlo müra korral — sisemise kooskõla kontrollid, MITTE väline andmekogum, seega jääb rida InternalConsistency. MODELLED passiivne geolokatsioon — punktallika vaateliini mudel; ei mitmeteelevi / NLOS, vastuvõtja kella nihke ega atmosfääri murdumise liikmeid. { "0.30" } ring { "2" }, Ho ja Chani { "1993" } ning Ho ja Xu { "2004" } vastu (eelregistreeritud f89018b8, { "1" } % iga trükitud väärtusest), leid (jääb MODELLED): pinnaga piiratud TDOA piir reprodutseerib { "40" } N geomeetrilised tegurid (-0.11 %, -0.02 %) ja maksimaalse TDOA; ühine TDOA+FDOA piir reprodutseerib joonise { "6" } (+{ "0.06" } %, -0.17 %) ja allikal, mida autorite enda kood nimetab jooniseks { "7" } (muudatus kirjutatud pärast selle tulemuse nägemist, avalikustatud), joonise { "7" } (+{ "0.11" } %, -0.02 %); see võrdub autorite avaldatud piirikoodiga (BSD-laadne, käitatud GNU Octave'is) täpsusega { "3e-12" }; kovariatsiooniga kaalutud suurima tõepära lahendaja saavutab trükitud piiri (+{ "0.3" } kuni +{ "0.4" } %). Ottawa tegurid, mille artikkel trükib Monte Carlost ({ "251" }, { "7.1" }), erinevad +{ "1.3" } % ja +{ "4.4" } % võrra, väljaspool { "1" } % lävi

# text
seg-d0119a3cb762 = geolocation

# text
seg-f85f780a9859 = geolocation::tests (müravaba TDOA otse→pöördteisendus täpsusega { "1e-6" } m; J·CRLB=I sümmeetrilise PD kovariatsiooniga; CRLB asendivariatsiooni jälg ei kasva, kui vastuvõtja lisatakse; ühine TDOA+FDOA taastab liikuva emitteri asendi+kiiruse; <{ "4" } vastuvõtjat lükatakse tagasi); tests/geolocation_reference.rs (edasi-tagasi teisendused nelja geomeetria puhul 3-D-mitmekesise võrguga; Gauss–Newtoni hindaja saavutab oma Cramér–Rao piiri — empiiriline veakovariatsioon järgib analüütilist piiri { "4000" } Monte Carlo katse jooksul); tests/geolocation_crlb_published_oracle.rs (ho_chan_1993_maximum_tdoa; ho_xu_2004_fig7_with_the_authors_corrected_source; ho_xu_2004_bound_matches_the_authors_code; finding_ho_chan_ottawa_printed_values_are_not_the_bound ja finding_ho_xu_fig7_printed_source_is_not_the_plotted_one, kinnitatud)

# text
seg-8ac63d14e24b = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: seos ja konstandid nii nagu need on trükitud NASA TR R-376-s, poolsammu koondumise kontroll ning kuumenemise ja aeglustuse tippude oodatud järjekord. MIS EI OLE: ühtegi avaldatud kuumenemise väärtust ei ole võrreldud (Stardusti artiklid annavad projekteerimispiiri ja konvektiivse-pluss-kiirgusliku hinnangu umbes { "1200" } W/cm2, mida ainult konvektiivne seos ei suuda sobitada); kiirgusliku kuumenemise, seinatemperatuuri ega katalüütilisuse parandust ega soojuskaitse reaktsiooni ei ole.

# text
seg-47854be05818 = entry_eo_ascent::entry_heating (stagnation_heat_flux, simulate_entry)

# text
seg-067596c7a683 = entry_eo_ascent::entry_heating::tests::heat_flux_relation_has_the_published_form_and_constants; entry_eo_ascent::entry_heating::tests::lift_lowers_peak_deceleration_and_heat_flux_of_a_shallow_entry; entry_eo_ascent::entry_heating::tests::mars_entry_runs_with_the_mars_constants; tests/entry_stardust_published.rs (registreerib Stardusti jaoks { "746" } W/cm2 ilma lävita)

# text
seg-1f6aec0085c2 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujud: difraktsiooni MTF poolel piirsagedusel, puhta detektoriapertuuri ühepikslilise tõusuga serv (RER { "1" }), Gaussi hägustuse normaaljaotuse CDF serv (RER = erf(0.5/(sigma sqrt { "2" }))), jaotusmüra skaleerumine ja GIQE { "4" } koefitsiendid nii nagu avaldatud (Leachtenauer et al., Applied Optics { "36" }({ "32" }), { "1997" }). MIS EI OLE: ühtegi välist kujutajat, mõõdetud MTF-i ega hinnatud kujutist ei ole võrreldud; GIQE on empiiriline regressioon oma veaga; hajavalgust, atmosfääri MTF-i, MTF kompenseerimist ega aliasingut ei ole.

# text
seg-b15628833cf8 = entry_eo_ascent::eo_radiometry (Imager, snr_budget, giqe4_niirs, EoRadiometryScenario)

# text
seg-86769d0258ad = entry_eo_ascent::eo_radiometry::tests::diffraction_mtf_has_its_closed_form_values; entry_eo_ascent::eo_radiometry::tests::a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one; entry_eo_ascent::eo_radiometry::tests::a_gaussian_blur_has_the_normal_cdf_edge; entry_eo_ascent::eo_radiometry::tests::snr_budget_scales_as_shot_noise_when_signal_dominates; entry_eo_ascent::eo_radiometry::tests::giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd

# text
seg-3f515354b4d2 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: täpne samasus põlemise lõpu kiirus = summa Isp g0 ln(m0/mf) miinus neli integreeritud kadu (jääk alla { "1e-6" } m/s), Tsiolkovski võrrand vertikaalsel vaakumpõlemisel, kus gravitatsioon on ainus kadu, ning US76 merepinna ja tropopausi rõhud. MIS EI OLE: ühegi avaldatud kanderaketi kadusid ei ole võrreldud; ei Maa pöörlemist, rannikufaasi, drosselit ega juhtimist peale tõuke; konstantne C_D; mitte trajektoori optimeerija.

# text
seg-4e91b2b5c9e1 = entry_eo_ascent::ascent (simulate_ascent, AscentScenario); reentry::us76_pressure

# text
seg-a5f4b59e7ca1 = entry_eo_ascent::ascent::tests::the_loss_identity_holds_to_integration_error; entry_eo_ascent::ascent::tests::vertical_vacuum_burn_has_only_gravity_loss_and_stays_vertical; entry_eo_ascent::ascent::tests::us76_pressure_has_the_standard_values; entry_eo_ascent::ascent::tests::a_larger_kick_lowers_burnout_flight_path_angle

# text
seg-55a57682f26d = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: otsene mudel ja lahendatud võrrand on kooskõlas täpsusega { "1e-15" } s, Sagnaci liige võrdub mooduli sõltumatu BIPM 2A omega/c^{ "2" } ahelavormiga, ionosfääriline liige on { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c ja müraprotsessid näitavad oodatud TDEV kujusid. MIS EI OLE: ühtegi tegelikku TWSTFT mõõtmist ega kalibreerimisaruannet ei ole võrreldud; öeldud viivitused ja määramatused on sisendid, mitte mõõdetud; etteantud jadade stabiilsusi esitatakse, mitte ei valideerita.

# text
seg-70ffbdec1a87 = twstft_budget (counter_readings, solve_offset, combined_uncertainty, flicker_phase, two_way_series, series_stability); time_transfer_budget (TimeTransferBudgetScenario, read_series)

# text
seg-998c0585be86 = twstft_budget::tests (kahesuunaline võrrand taastab nihke täpselt; Sagnaci liige võrdub BIPM ahela suletud kujuga; ionosfääriline liige järgib sageduse jaotust ja troposfäär tühistub; flicker-faasil on tasane TDEV; ööpäevane jääk tõstab TDEV-i poole päeva ümber; vastastikkuse nihe nihutab nihet, mitte TDEV-i; jada stabiilsus eemaldab määra); time_transfer_budget::tests

# text
seg-4ca4b46b128c = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — Numbreid võrreldakse sõltumatu programmiga (xval/optical-atmosphere/oracle.py, mpmath { "1.4.1" } { "30" } numbril, tanh-sinh kvadratuur algsel kõrgusmuutujal ja Bessel-K gamma-gamma tihedused), mis ei jaga Kshanaga koodi, lävede all, mis fikseeriti enne mis tahes teostuse olemasolu (xval/optical-atmosphere/PREREGISTRATION.md). MIKS MODELLED: see sõltumatu etalon hindab samu avaldatud valemeid, seega kontrollib see öeldud valemite teostust, mitte atmosfääri; ühtegi ITU-R valideerimisnäidet ega mõõdetud sähvimise või kaldtee sumbumise kirjet ei kasutata (ITU väärtused on avatud litsentsiotsus ja hoitakse hoidlast väljas). Cn2 profiili tase, nähtavus, aerosooli ja molekulaarsed skaalakõrgused, apertuuri keskmistamise tee pikkus ja momentide sobitamine, mida kasutatakse apertuuri keskmistamise rakendamiseks gamma-gamma parameetritele, on öeldud sisendid või konventsioonid. Allikarida moodulis märgib, et üks laialt kopeeritud ülevaade trükib teise sähvimise astendaja kui 7/6, kus Andrews ja Phillips annavad 5/6; teostatud on 5/6 vorm

# text
seg-d36d667bfa06 = optical_atmosphere (rytov_variance, scintillation, gamma_gamma_cdf, fade_margin_db, aperture_averaging_factor, cloud_optical_depth, clear_air_optical_depth); optical_linkbudget (optical_link_budget_atmosphere)

# text
seg-eb08517c6ca2 = tests/optical_atmosphere_reference.rs (eelregistreeritud läved A1-A3 sõltumatu mpmath sõltumatu etaloni vastu: { "216" } Rytovi ruudustiku punkti halvim suhteline viga { "3.4e-7" } vs { "1e-6" } lävi, sähvimine halvim { "4.5e-16" }, apertuuri tegur halvim { "5.7e-16" }, { "96" } gamma-gamma hajumise tõenäosust halvim { "1.3e-12" } log10-s, pilve ja selge õhu optiline paksus halvim { "6.6e-16" }); tests/optical_atmosphere_no_moved_output.rs (lävi A5: koondatud kaoga lingibilanss ja olemasolevad asukoha kättesaadavuse väljundid on baas-commit'iga bitthaaval identsed { "1,000" } parameetrikomplekti puhul)

# text
seg-6cf381ac2e3d = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: mitmekesisuse mudeli suletud kujuga piirid ja monotoonsus, pilvelae suletud kuju ja log-normaaljaotuse katkestuste samasused. Välist sõltumatut etaloni EI väideta ega ole võrreldud: mõõdetud optilise maajaama kättesaadavuse ega pilvevaba vaateliini kirjet ei kasutata. MIKS MODELLED: pilveklimaat (pilve tõenäosus, vedela vee samba mediaan ja hajuvus, katkestuste kestused), pilve ja turbulentsi sõltumatus, Gaussi kopula vorm, dekorrelatsioonipikkus ja iga tehnika võimendus on eeldused; kaasasolevad stsenaariumid esitavad ILLUSTRATIVE klimaatilisi tingimusi, mitte andmekogumit. Selle rea tõstmiseks on vaja viidatud mõõdetud kättesaadavuse kirjet ja enne võrdlust registreeritud lävi

# text
seg-70e033b9dcab = optical_weather; optical_sitediv; optical_techniques; optical_atmosphere_scenario

# text
seg-66ac747dbe38 = tests/optical_atmosphere_identities.rs (lävi A4: rho = { "0" } võrdub sõltumatu ühendiga ja rho = { "1" } parima üksiku asukohaga täpsusega { "1e-12" } ning null monotoonsuse rikkumist asukohtade arvu ja korrelatsiooni suhtes; selle läve esimene käitus jäi { "3e-9" } võrra täitmata, sest kasutusel olnud normaaljaotuse CDF oli { "1.5e-7" } Abramowitz-Steguni vorm, teostusviga, mis asendati mittetäieliku gamma CDF-iga muutmata lävega); optical_weather::tests ja optical_sitediv::tests (monotoonne varu, pilvelagi suletud kujuna, katkestuse kestuse samasused, varu otsingu ümberpööramine)

# text
seg-1d817d8409d3 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla holdover-i mooduliga, bitthaaval; välist sõltumatut etaloni EI väideta. Klasside PSD-d on sünteesitud pika-tau põrandad, mida holdover-i moodul juba kannab, seega päritakse arvudele selle öeldud hoiatus, et holdover tiheda lävendini sõltub eeldatavast punase müra põrandast, mitte viidatud Alani hälbest. Katkestuste kestused on log-normaalmudel öeldud parameetritega, mitte mõõdetud pilve viibimise kirje

# text
seg-95a61b2025cb = optical_outage_holdover (couple, clock_psds); holdover (coast_phase_sigma, holdover_seconds, phase_to_range_m)

# text
seg-b47fe3bc618f = tests/optical_atmosphere_identities.rs (lävi A6: katkestusepõhine ajastusviga võrdub holdover::coast_phase_sigma-ga ja kaugusviga phase_to_range_m-ga bitthaaval { "9" } kella, { "3" } keskmise kestuse, { "3" } hajuvuse ja { "4" } kvantiili korral); optical_outage_holdover::tests

# text
seg-55ce1b6d2dfd = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ainult sisemine kooskõla; välist sõltumatut etaloni EI väideta ja ilmarealisatsiooni jaoks sellist ei ole. Kontrollid võrdlevad ühte tõmmet sama mudeli statistilise väljundiga, seega ütleb läbimine, et generaator valimistab öeldud jaotusi (tõmbe kättesaadavus ja pilveosa jäävad öeldud arvude eelregistreeritud tolerantside sisse), mitte et ükski tegelik asukoht käituks nii. Jada on üks realisatsioon, mitte klimaat: selle kättesaadavus erineb öeldust tõmbe valimiveaga ja sähvimise valimid erinevatel sammudel on sõltumatud, mis on öeldud lihtsustus protsessist, mis dekorreleerub millisekundites. Ilmasisendid jäävad stsenaariumi eelduseks.

# text
seg-86ae3e4b0c16 = optical_timeseries (site_series, SiteModel, SeriesSpec, Series); optical_atmosphere_scenario (TimeseriesSpec)

# text
seg-a19b90ab43ec = tests/optical_atmosphere_timeseries.rs (läved T1-T6 failist xval/optical-atmosphere/PREREGISTRATION-timeseries.md, fikseeritud enne esimest käitust: sama algväärtus (seed) samad baidid ja teine algväärtus (seed) teised baidid; ilma tabelita võtit ei ole; { "8760" } h jooksul sammuga { "600" } s, algväärtused (seed) { "37" } ja { "38" }, iga kolme vaikeasukoha realiseeritud kättesaadavus { "6" } punkti piires öeldust (halvim { "3.3" }) ja realiseeritud pilveosa { "5" } punkti piires öeldud tõenäosusest (halvim { "2.1" }); varu võrdub eelarve miinus kaks hajumist ja töös võrdub varuga mittenegatiivne igal sammul; moodulis ei ole mitteportatiivset matemaatikakutset; liiga pikad käitused ja halvad sammud lükatakse tagasi)

# text
seg-4dfa142a94c4 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — PDS3 silt, mille DSN-i navigatsiooniandmete konditsioneerimise protsess tootis failiga (NASA PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0), kontrollitud lävede vastu, mis on eelregistreeritud failis xval/mro-odf/PREREGISTRATION.md enne lugeja olemasolu. MODELLED, sest üks registreeritud lävi (faili lõpu tabeli read, { "121" } failis vs { "120" } sildis) jäi täitmata; silt on seal sisemiselt vastuoluline. Etapp { "2" } (xval/mro-od/PREREGISTRATION.md, muudatused A1 ja A2 enne hinnatud tulemust): MRO navigatsioonimeeskonna rekonstruktsioonist (mro_psp5, NAIF) prognoositud Doppler vastab vaadeldud rampitud 2-suunalisele Dopplerile { "12.5" } mHz täpsusega arenduses mitte kasutatud pääsudel, lävi täidetud; registreeritud orbiidi määramine ebaõnnestus hinnatud kaarel (normaalmaatriks ei ole positiivselt määratud) ja ei andnud orbiiti, seega orbiidi läved jäid täitmata. Käitus { "2" } (xval/mro-od/PREREGISTRATION-RUN2.md, summutatud hindaja, sama kaar ja läved, hindamismuudatus R2-A1 avalikustatud failis docs/revisions) koondus: hinnatud orbiit on rekonstruktsioonist { "0.36" } km RMS ({ "0.53" } km maksimum) piires, läved täidetud, kuid sobitusjärgne Doppleri RMS on { "48.6" } mHz vs { "30" } mHz lävi, täitmata, seega jääb rida MODELLED. MIS EI OLE: ükski hinnatud orbiit ei ole täitnud kõiki registreeritud lävesid; ionosfääri, päikeseplasmat ja enamikku antenni nihkest (arenduspääsul sobitatakse { "1.5" } m radiaalne nihe) ei modelleerita.

# text
seg-3c8d970a385d = odf (parse_odf, Odf, OdfObservation, OdfRamp, seconds_1950); mars_od (DopplerModel, RampTable, compress_two_way, MarsDynamics, fit, fit_damped); naif_kernel (SPK type { "1" }); gravity_pds (SphericalHarmonicField::from_shadr)

# text
seg-09bfff22ee94 = tests/mro_odf_reader_label_oracle.rs (tegelik MRO ODF, 2007-304/305, selle PDS sildi vastu: kirjete arv, rühmade asukohad, jaamad, algus- ja lõpuajad ning andmetüübid kehtivad; faili lõpu tabeli ridade arv eksib ühe võrra, sildi vastuolu, kinnitatud leiuna); odf::tests (käsitsi ehitatud kirje edasi-tagasi teisendus, { "1950" } epohh); tests/mro_odf_short_arc_od_oracle.rs (andmetest sõltuv, sisendid SHA-256 kinnitatud, igakuine CI tegelike andmetega nõutav: MRO navigatsiooni rekonstruktsioonist mro_psp5 prognoositud Doppler hinnatud DSS { "63" } ja DSS { "14" } pääsudel, { "12.5" } mHz RMS, lävi { "30" } mHz, täidetud; registreeritud orbiidi määramine ei andnud orbiiti, kinnitatud leiuna; käitus { "2" } summutatud hindajaga, eraldi registreeritud: orbiit { "0.36" } km RMS ja { "0.53" } km maksimum mro_psp5 suhtes, täidetud, sobitusjärgne Doppler { "48.6" } mHz vs { "30" } mHz, täitmata, kinnitatud leiuna; SPK tüüp { "1" } lugeja CSPICE vastu, { "5e-7" } m); mars_od::tests

# text
seg-8566593647ee = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: filtri normaliseeritud hindamisvea ruut tõe vastu, mis on simuleeritud samadest sensorimudelitest Monte Carlo algväärtuste (seed) lõikes, ning asendi- ja nihkehinnangute koondumine. MIS EI OLE: ühtegi välist hindajat ega lennuandmeid ei ole võrreldud (Basilisk { "2.9.1" }-l puudub MEKF moodul); sensorimudelid on õpikumudelid, ilma nihkejoondumatuse, skaalateguri või tähejälgija vaatevälja mõjudeta.

# text
seg-526efea83384 = aocs_mekf (Mekf, GyroSim, attitude_error, spd_solve6); aocs_kind (estimator)

# text
seg-1650d00d45ad = aocs_mekf::tests::mekf_is_consistent_over_monte_carlo_seeds ({ "40" } algväärtust (seed), keskmine kuue vabadusastmega NEES teisel poolel vahemikus { "4.5" } kuni { "7.5" }); aocs_mekf::tests::star_tracker_updates_bound_the_attitude_error; aocs_mekf::tests::attitude_error_is_the_body_frame_small_angle; aocs_kind::tests::estimator_loop_runs_and_reports_consistency

# text
# c1: passes::predict_passes
seg-3085ca73a5f1 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla kolmest suurusest, mis on arvutatud erinevate avaldistega samas pühkimises ja mida seejärel nõutakse sulguma. Navigatsiooni apertuurisekundid, side apertuurisekundid ja jõudeoleku apertuurisekundid kogutakse eraldi — jõudeolek (apertuurid − |teenindatud|) kaudu elementaarintervalli kohta, mitte kunagi jäägina — ja nende summa kinnitatakse apertuurid × horizon_s vastu, mille valesti piiritletud piir, topeltloetud intervall või väljajäetud intervall kohe rikub; sessioonipõhised teenindatud ajad peavad eraldi liituma tagasi kaheks teenuse kogusummaks. Planeerija struktuursed omadused on mõõdetud, mitte eeldatud: teenindatud aeg on kinnitatud apertuuride arvu suhtes mittekahanevaks { "200" } pseudojuhusliku plaani korral kõigi kolme poliitika puhul (mitte ilmne mitteeelisjärjekorras poliitika puhul, kus lisaapertuur muudab igal hilisemal piiril seda, kes mida hoiab), ja piiriaritmeetika on kinnitatud puutuva/ühesekundilise kattuvuse paari juures, kus ühe võrra eksimine muidu peituks. Läbimise ennustaja sild kontrollitakse <c1/> väljundi vastu: ühe apertuuri ja konkureeriva teenuseta võrduvad navigatsiooni apertuurisekundid ennustaja enda summeeritud läbimiskestustega. Sõltumatut etaloni ei väideta ega ole olemas: võimekus asendab käsitsi aritmeetika, mitte ei ole selle vastu kontrollitud, kaasasolev kontaktiplaan on illustratiivne, mitte lennatud, ja ükski operatiivne planeerija ei avalda plaani-pluss-vastuse paari oma vahekohtureegli öeldud kujul — määratlemata poliitika alusel arvutatud kohustus ei ole võrreldav määratletud poliitika alusel arvutatuga ning poliitika sõltuvus on mõõdetud (navigatsiooni kohustused 100/150 vs 50/150 identsel plaanil). Pööramis- ja ümberlülitusaeg, andmemaht, puhvri olek, energia ja lingi sulgumine on aruande sildis välja jäetud, mitte vaikselt modelleeritud

# text
seg-4da98593fe6a = aperture_duty::tests (aken, mis lõpeb täpselt siis, kui järgmine algab, ei konkureeri, ja selle liigutamine ühe sekundi võrra varasemaks maksab täpselt ühe sekundi — ühe võrra eksimise kaitse; kattuvad aknad üle apertuuride arvu panevad madalama järgu sessiooni katkestusse, kusjuures konkurentsiintervall on kinnitatud; vahekohtupoliitika otsustab, milline teenus apertuuri hoiab, kõigi kolme poliitika arvud kinnitatud ühel plaanil; first-come-first-served ei võta eelisjärjekorras apertuuri sessioonilt, mis seda juba hoiab; sessioon, mis kaotab vahekohtus oma alguses, hangib apertuuri, kui see vabaneb; kolm kohustust arvestavad iga saadaoleva apertuurisekundi { "3" } poliitika × { "4" } apertuuride arvu kohta; apertuuri lisamine ei suurenda kunagi ühegi sessiooni katkestust, mõõdetud { "200" } pseudojuhusliku plaani × { "3" } poliitika × iga apertuuride arvu korral; piisavalt apertuure iga sessiooni jaoks ei jäta üldse katkestust; aruandehorisont lõikab plaani ja seab kohustuse nimetaja; ennustatud läbimiste loend muutub kontaktiplaaniks ilma teise akna tüübita; kaasasoleva plaani kohustuse arvud on mootori väljundid ühe ja kahe apertuuri korral; aruanne ütleb poliitika, mis arvud tekitas; iga teatatud näitaja kannab ühikut ja päritoluklassi; stsenaarium on reprodutseeritav ja deklareerib end MODELLED; stsenaarium lükkab tagasi plaani, mida ta ei suuda planeerida); api::tests::aperture_duty_cycle_kind_round_trips_through_the_dispatch

# text
seg-cd818ac01de7 = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Kompositsiooni ristkontroll sõltumatu hoidlasisese koodiraja vastu: iga lingipõhine J/S tuletatakse uuesti kahe lingibilansi vahena, mis on arvutatud linkbudget::received_signal_power_dbw-ga, mille vabaruumi kadu on üksik avaldis { "20" }·log10(4πRf/c) kolmeliikmelise summa asemel, mida kasutab jamming::free_space_path_loss_db — kaks on kooskõlas < { "1e-9" } dB piires igal real (mõõdetud halvim juht { "7.11e-14" } dB, st ujukomaümardus). Aluseks olev häireahel, mida see koostab, on eraldi väliselt ankurdatud failis tests/gnss_denied_jamming_resilience_reference.rs (sõltumatu numpy/scipy J/S ja efektiivse C/N₀ uuestituletus, kinnitatud Kaplani ja Hegarty §{ "9.4" } külge, pluss JammerTest { "2024" } mõõdetud C/N₀, Zenodo 10.5281/zenodo.15910563); Kuu geomeetria, mida see koostab, on lunar_service/lunar geomeetria oma etalonidega. Siin kontrollitud suletud kujuga samasused: poolitatud segaja distants lisab igale reale täpselt { "20" }·log10({ "2" }) dB; J/S on kasutaja antenni telgjoone võimenduse suhtes täpselt invariantne, samas kui C/N₀ muutub täpselt selle võimenduse võrra; kõrgusmask ei muuda ühtegi ellujäävat rida bitthaaval. Rida ise jääb ReferenceImpl / modelleeritud: Kuu segamiskampaaniat, mille vastu valideerida, ei ole mõõdetud, ja satelliidikonstellatsioon on illustratiivne avaliku allika Moonlight/LCNS-klassi geomeetria, mitte lennatud efemeriid

# text
seg-875ebc4e1cc4 = lunar_jamming (composing jamming, lunar_service, lunar)

# text
seg-d206adbe8e04 = lunar_jamming::tests ({ "17" } teegi testi: j_over_s_equals_the_difference_of_two_independent_link_budget_runs; the_report_prints_both_link_budget_legs_so_the_difference_is_checkable_from_it; the_scenario_reports_one_j_over_s_row_per_visible_satellite_and_never_a_median; a_single_median_j_over_s_would_misreport_the_outcome_that_the_table_reports; a_closer_jammer_raises_j_over_s_by_exactly_the_free_space_loss_difference; a_more_distant_satellite_is_the_weaker_signal_so_it_carries_the_higher_j_over_s; j_over_s_is_invariant_to_the_user_antenna_boresight_gain; a_narrowband_jammer_leaves_no_higher_effective_cn0_than_broadband_at_equal_js; a_selenographic_jammer_gets_its_range_from_the_shared_lunar_geometry; a_strong_enough_jammer_takes_every_lunar_link_below_the_tracking_threshold; no_jammer_is_a_clean_sky_lunar_baseline_with_an_undefined_j_over_s; raising_the_elevation_mask_can_only_remove_rows_never_change_the_ones_that_remain; every_emitted_numeric_field_has_a_unit_and_a_provenance_class; the_csv_table_carries_every_row_of_the_json_table; the_run_is_deterministic_and_the_dispatch_surface_is_populated; bad_inputs_are_rejected_rather_than_producing_a_number); api::tests::lunar_jamming_kind_round_trips_through_the_dispatch_with_a_per_satellite_table

# text
seg-4dd2b99376b2 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla mootori enda otsefunktsioonide suhtes, mida see võimekus ausalt väita saab. Iga kontuuripunkt on suletud kujuga ümberpööramine ja iga ümberpööramist kontrollitakse, lükates selle vastuse tagasi läbi OTSEFUNKTSIOONI, millega aruande enda read hinnati: J/S veerg läbi jamming::effective_cn0_dbhz (mis peab tagastama tracking_threshold_dbhz täpsusega < { "1e-9" } dB-Hz), distantsi veerg läbi jamming::free_space_path_loss_db ja jamming::j_over_s_db (sama J/S täpsusega < { "1e-9" } dB), EIRP veerg läbi jamming::j_over_s_db stsenaariumi enda distantsil. Kontuuri kontrollitakse lisaks, et see on keeldumishulga PIIR, mitte punkt selle sees — lock_status kaotab lukustuse range võrratuse korral, seega mõõdetakse otsus pöörduvat tasemelt DEGRADED tasemele LOST üle { "1e-4" } dB J/S kummalgi pool kontuuri, mida epsiloni võrra eksiv kontuur ei läbiks. Kõige tugevam kontroll on lingipõhine, mitte kvantiilipõhine: sama vastenduse rakendamine iga rea enda C/N₀-le reprodutseerib aruande olekuveeru täpselt — { "0" } lahknevust { "38" }-l { "38" }-st reast dokumenteeritud tööpunktis (kind = lunar-jamming, iga sisend vaikimisi välja arvatud jammer.range_m = { "25 000" } m), kus { "26" } rida on LOST ja { "12" } ei ole. Monotoonsus on mõõdetud, mitte eeldatud: { "20 001" } valimit vahemikus [tracking_threshold + { "1e-3" }, { "80" }] dB-Hz, { "0" } rikkumist rangelt kahanevale distantsile ja rangelt kasvavale nõutavale võimsusele, seega on riba kvantiilide järjestus demonstreeritud, mitte kinnitatud. ExternalDataset on tagasi lükatud ja valideeritud sellega koos: Kuu segamiskampaaniat, mille vastu keeldumisraadiust võrrelda, ei ole mõõdetud, satelliidikonstellatsioon on illustratiivne avaliku allika Moonlight/LCNS-klassi geomeetria, mitte lennatud efemeriid, ja kontuuri sisendid (EIRP, segaja võimsus, antenni võimendused, müratemperatuur) on esinduslikud suurusjärgud. ReferenceImpl-i kaaluti ja lükati samuti tagasi — pöördväärtus ja otsene avaldis on SAMA algebra, mida loetakse kahes suunas, seega tabab edasi-tagasi teisendus ülekirjutus- ja märgivigu, kuid ei ole sõltumatu teostus; selle nimetamine ristkontrolliks oleks laenatud sõltumatuse käik, mida maatriksi invariandid on mõeldud takistama. Mida riba annab, on mõõdetud ja toodud, mitte kinnitatud: sellel tööpunktil on ühe skalaariga kontuur { "27.402916" } km ja paneb { "25" } km keeldutud poolele kõigi { "38" } rea jaoks, samas kui riba { "21.256108" } .. { "29.921360" } km sisaldab tööpunkti ja teatab seega jaotuse, mida tabel tegelikult näitab. Kaks kriteeriumi on samuti mõõdetult vastuolus — võimsussuhte riba ({ "38.186527" } .. { "53.691675" } km) ei sisalda { "25" } km üldse — mistõttu trükitakse mõlemad

# text
seg-ec5736cbb3b4 = lunar_jamming (denial_js_db, range_for_free_space_path_loss_m, Cn0Distribution, DenialContourPoint, ContourBand, DenialContour; inverting jamming::effective_cn0_dbhz, jamming::j_over_s_db and jamming::free_space_path_loss_db)

# text
seg-cdcfbbc52ae5 = lunar_jamming::tests ({ "10" } teegi testi: the_contour_is_the_exact_inverse_of_the_functions_the_rows_were_scored_with; the_band_is_the_measured_quantiles_pushed_through_the_contour_not_a_sigma; the_asymmetry_the_band_carries_is_the_samples_own_shape_bent_by_the_criterion; the_contour_is_monotone_in_cn0_measured_over_a_dense_sweep_not_assumed; the_band_recovers_the_split_verdict_the_single_scalar_contour_lost; the_distribution_is_the_tables_own_order_statistics_and_keeps_the_rows; a_link_already_below_the_threshold_gets_a_null_contour_point_not_a_number; a_clean_sky_run_has_no_contour_at_all_rather_than_an_empty_one; the_denial_threshold_is_the_same_thirty_decibels_the_rest_of_the_engine_uses; the_units_block_describes_the_contour_and_names_nothing_the_report_omits)

# text
seg-88d196f13afa = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kaks sisemist etaloni, ühtegi välist andmekogumit. ({ "1" }) Suletud kujuga edasi-tagasi teisendus: minimaalne tuvastatav nihe saadakse mittetsentraalse hii-ruut sabajaotuse ümberpööramisega mittetsentraalsuse suhtes (raim::pbias) ja see kontrollitakse, söötes saadud mittetsentraalsuse tagasi läbi raim::noncentral_chi2_cdf monitori enda lävendil, mis peab tagastama P_md. ({ "2" }) Süstimine vs analüüs: nihe kirjutatakse ühe telje RF hinnangusse ja cross_raim::run_cross_raim käitatakse uuesti, seega on analüütilise mittetsentraalsusega võrreldav statistik see, mille monitor arvutas, mitte uuestituletus. Statistiku enda algväärtustatud (seed) Monte Carlo on testides kolmanda kontrollina, kuid see EI OLE tahtlikult aruandes, sest valimistatud hinnang oleks aeglasem ja mitte bitthaaval reprodutseeritav. ExternalDataset on tagasi lükatud: suurus on SELLE monitori tuvastusvõimsus SELLE stsenaariumi sigma jaotuse korral ja sigma suurusjärgud, millega MDB-d skaleeritakse, on modelleeritud esinduslikud sisendid, mitte mõõtmised. ReferenceImpl-i kaaluti samuti ja lükati tagasi — Monte Carlo valimistab sama statistikut, mida analüüs kirjeldab, seega tabab see ülekirjutus- ja koefitsiendivigu, kuid ei ole monitori sõltumatu teostus. { "0.30" } ring { "2" } (eelregistreeritud 0135a9e4), blokeeritud (jääb MODELLED): SciPy { "1.18.1" } chi2/ncx2/brentq reprodutseerivad aruande lävendi ({ "5.4e-12" } piires), teljepõhise MDB, võimsuskõvera, ristumiskordaja ja tõusu tuvastamise aja ({ "5.3e-10" } piires) viiel konfiguratsioonil; süstitud vigade statistikutel puudub sõltumatu etalon ja sigma suurusjärgud on modelleeritud sisendid, seega ootab piiritlemine omaniku otsust

# text
seg-83724a2a8e06 = hybrid_integrity::tests (tuvastusvõimsuse kõver jookseb valehäire määrast nullvea juures kuni { "1" } − P_md minimaalse tuvastatava nihke juures; minimaalne tuvastatav nihe, mis söödetakse tagasi läbi noncentral_chi2_cdf monitori enda rakendatud lävendil, tagastab P_md täpsusega { "1e-9" } igal teljel ja avaliku abifunktsiooni kaudu; tegelikult RF hinnangusse süstitud nihe nihutab monitori enda statistikut täpselt käsitsi arvutatud b²/(σ_rf² + σ_opt²) võrra; müravaba nihe tabatakse üle √(T/λ*)×MDB ja jäetakse märkamata sellest allpool, kusjuures süstitud redel ümbritseb seda ristumist; tuvastusvõimsus on vea suuruse suhtes monotoonne ja identne kõigil neljal teljel MDB kordsete puhul; algväärtustatud (seed) 200,000-valimiline Monte Carlo monitori statistikust reprodutseerib analüütilise võimsuse 4σ piires kõvera neljas punktis; ajastuse MDB on kinnitatud ajastuse häirepiirist kõrgemale, mis on mõõdetud nõrkus, mitte omadus; Wilson-Hilferty kvantiil on mõõdetult monitori täpsest lävendist erinev ~{ "4" }% võrra, mis kirjutab üles, miks seda ei kasutatud; tõusu näitaja on täpselt MDB/määr ja skaleerub määraga pöördvõrdeliselt ning mittepositiivne määr teatab tühiväärtuse (null), mitte nulli); tests/hybrid_fault_power_scipy_oracle.rs (report_detection_power_matches_scipy_chi2_and_ncx2; report_detection_power_matches_scipy_with_comparable_sigmas)

# text
seg-df134052a2d9 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sõltumatut etaloni pole. Ristumine on juhusliku kõnnaku dispersiooni kasvu suletud kujuga lahend ja testid arvutavad selle uuesti sõltumatult väärtustest, mida aruanne ise avaldab, mitte emitteri sisemustest. Algkovariatsioon on bitthaaval kinnitatud jäljele, mille olemasolev üleandmise plokk juba teatas, seega ei saa rannik levitada kovariatsiooni, mida keegi teine ei näinud. Protsessimüra PSD-d on MODELLED esinduslikud sisendid ja ristumisajad skaleeruvad nendega otse, mida skaleerimistest esitab mõõdetud omadusena, mitte väitena. ExternalDataset on tahtlikult tagasi lükatud: rannikuaeg on kahe modelleeritud PSD ja häirepiiride otsene funktsioon, mis on ise esinduslikud, ning Kuu optilise/RF üleandmise rannikut, mille vastu võrrelda, ei ole mõõdetud. Sõltumatu etalon vajaks siin avaldatud üleandmisjärgset kovariatsioonikasvu või holdover-täpsuse kõverat võrreldava vastuvõtja jaoks, mille protsessimüra mudel on öeldud, kontrollitud tolerantsini

# text
seg-f9767a6109d5 = hybrid_integrity::tests (rannik algab täpselt kovariatsioonijäljest, mida üleandmise plokk teatab, mõlemas suunas, seega ei saa uuesti esitatud diagonaal teatatud üleandmisest eralduda; teatatud ristumisaeg arvutatakse uuesti aruande enda üleandmise sigmast, protsessimüra PSD-st ja katvustegurist ning piir on häirepiiri sees vahetult enne seda ja väljaspool vahetult pärast; rannikuaeg skaleerub täpselt pöördvõrdeliselt protsessimüra PSD-ga ja lüheneb, kui häirepiir karmistub; nullPSD-ga rannik teatab tühiväärtuse (null), mitte nullaega, sest mitte kunagi ei ole sama mis kohe; väljastatud profiil ristub täpselt üks kord ja ümbritseb teatatud ristumist; dispersiooni kahekordistumise aeg ja häirepiiri ristumise aeg on kinnitatud lahus, olles tiheda optilise astme järel kaheksa suurusjärgu võrra erinevad ja lõdva RF astme järel ühe suurusjärgu piires; optilisest modaalsusest loobumine ostab rohkem rannikuaega kui RF-ist loobumine täpselt kovariatsioonide erinevuse jagatud horisontaalse kasvumääraga; ning random_walk_time_to_limit eristab juba-väljaspool, ristub-ajal-t ja ei-ristu-kunagi)

# text
seg-903acaa666a9 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Segatud ja eraldatud, mitte kokku liidetud. All olev MUSTER on väliselt valideeritud ja sellel on oma rida (scipy.special.j1 fikstuur < { "0.05" } dB piires failis tests/validate_p1_orbital_footprint.rs, pluss siin avaldatud Airy poolvõimsuse abstsiss x = { "1.61634" }, mis on leitud poolitamisega, mitte eeldatud). GEOMEETRIAT kontrollitakse suletud kujuga kolmnurga trigonomeetria vastu, mis on kirjutatud teise avaldisena kui testitav skalaarkorrutis. Päris kiire PIIRAMINE ligikaudse koonusega on tuletatud algebra (28.019/√η vs { "29.479" } kraadi λ/D kohta), seega võib parandus olla ainult mittepositiivne, kui η ≤ { "0.9035" }. Kuid kiirenasisesed ARVUD ise ei oma sõltumatut etaloni: ükski avaldatud tabel ei anna, mitu Moonlight/LCNS-klassi kihi satelliiti hoiab lõunapolaarset asukohta antud taldriku poolvõimsuse kiire sees, ja satelliidikonstellatsioon on illustratiivne avaliku allika lähendus, mitte lennatud efemeriid. Mõõdetud lahknevus dokumenteeritud tööpunktis — { "0" } linki kiire sees tegeliku mustri korral vs { "28" } lähenduse korral, −{ "2.33" } satelliiti epohhi kohta, halvim epohh { "3" }, { "76" } hinnatud lingil — on seega MODELLED leid lähenduse kohta, kinnitatud regressiooniliteraalina (lähim rida asub { "0.069" }° kummastki kiire servast, neli suurusjärku üle mis tahes viimase numbri lahknevuse), mitte väliselt valideeritud katvuse arv. Rea sildistamine ExternalDataset-iks mustri enda välise ankru alusel oleks laenatud valideerimine, mida maatriksi invariandid on mõeldud takistama. { "0.30" } ring { "2" } (eelregistreeritud d9755d28), blokeeritud (jääb MODELLED): SPICE geomeetria ja SciPy Besseli funktsioonid reprodutseerivad telgjoonest kõrvalekalde nurga (halvim { "3.0e-5" } kraadi), Airy võimenduse ja kiirenasisesed lipud { "6 336" } real lennatud orbiiterite olekutest ja dokumenteeritud tööpunktist; kuid lennatud geomeetrial jagunevad lipud satelliidi identiteedi järgi (lähim link on { "1.66" } kraadi kiire servast), { "5" } kraadi nähtavust kontrollitakse lipuna, mitte arvulise kõrgusena, sümmeetrilise lähenduse lipp rakendab 31000/G rusikareeglit valideeritud nurgale reeglit valideerimata, ja kaudsetel efektiivsustel puudub sõltumatu etalon; piiritlemine ootab omaniku otsust

# text
seg-6d2b55212f40 = lunar_service, antenna

# text
seg-730b359e2c3f = antenna::tests ja lunar_service::tests (mustri poolitamisega leitud poolvõimsuse ristumine vastab avaldatud Airy x = { "1.61634" }-le ja annab täpse { "1.02899" }·λ/D laiuse, kirjutades üles, et tavapärane { "1.02" } koefitsient asub −{ "2.955" } dB juures, mitte −{ "3.010" } dB; muster on rangelt kahanev { "400" } punkti jooksul telgjoonest esimese nullini; kaudse efektiivsuse algebra teisendub edasi-tagasi täpsusega { "1e-12" } ja reprodutseerib { "0.641" } / { "0.920" }; telgjoonest kõrvalekalde nurk vastab tan θ = R·sin γ/(r − R·cos γ) { "20" } punktis ja mõlemad piirid täpsusega { "1e-12" }; ligikaudne koonus sisaldab tegelikku kiirt rida-realt; peamised arvud võrduvad lipudega rea kohta, mida need kokku võtavad, ja parandus võrdub nende vahega; iga rea otsus on uuesti arvutatav ainuüksi väljastatud aruandest; iga väljastatud arvuline ja tõeväärtusväli kannab ühikut ja päritoluklassi; võimatu apertuur ei väljasta plokki; kui antenni pole seadistatud, jätab eksport täpselt oma kuus olemasolevat võtit, { "0" } lehte muudetud ja { "0" } eemaldatud); tests/validate_lunar_export_offboresight_spice.rs (flown_orbiter_export_matches_spice_geometry_and_scipy_pattern; documented_working_point_matches_anise_propagation_and_scipy_pattern)

# text
seg-7319e667db2e = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Mootori enda sdr korrelaator (sdr::correlate / synth_if / CaCode), mis on sammuti edasi viidud algväärtustatud (seed) sünteetilisel IF-il kalibreeritud C/N₀ juures — eraldi koodirada, mis jõuab samade arvudeni valimistatud IQ numbrilise korrelatsiooni kaudu, mitte algebralise värina avaldise kaudu, seega on see erinev tee ja mitte ümberütlemine — pluss standardsed tabuleeritud modifitseeritud Besseli I₀ väärtused tsükli libisemise liikme jaoks. Silmuseteooria Kaplani ja Hegarty ptk { "8" } ning Viterbi/Gardneri järgi libisemisaja jaoks. Rida jääb ReferenceImpl/MODELLED: ristkontroll asub samas koodibaasis ja bessel_i0 kontroll valideerib ühe erifunktsiooni, mitte jälgimismudelit, seega oleks rea tõstmine selle põhjal enesekasulik sildistamine. ExternalDataset vajaks salvestatud toor-IF andmekogumit tõese C/N₀ ja märgitud lukustuse kaotuse hetkega (TEXBAT/OAKBAT klass); ükski selline ei tarni selles puus ja isegi IQ-ga ei avalda need andmekogumid epohhipõhist silmuse oleku tõde, seega saaks deklareeritud lukustuse kaotuse aega valideerida ainult mõne teise vastuvõtja lukustuse detektori vastu, mis on modelleeritud valik, mitte sõltumatu etalon. Silmuse ribalaiused, integreerimisaeg, korrelaatori vahe, haaramissuhe, viibeajad, segaja võimsus ja antenni võimendused on esinduslikud riba arvud, mitte andmeleht. { "0.30" } ring { "2" }, GNSS-SDR { "0.0.19" } (GPL-3.0, käitatud programmina) sõltumatult genereeritud IF-il (eelregistreeritud 6ef7698c, mõõtemeetodi muudatused avalikustatud), leid (jääb MODELLED): suletud silmusega PLL ja DLL värin on kooskõlas { "8" } % piires vahemikus { "35" } kuni { "45" } dB-Hz, { "10" } Hz/s dünaamiline pinge { "1" } % piires ja esimese astme koodi tõusu viivitus { "2" } % piires; { "30" } dB-Hz juures on PLL värin { "21" } % kõrgem ja DLL värin { "32" } % madalam, mõõdetud 15-kraadi reegli lävendid asuvad mootorist { "1.5" } dB kõrgemal ja teise astme silmus libiseb { "0.5" } kuni { "2" } dekaadi võrra sagedamini kui esimese astme libisemisaja piir. { "0.30" } redaktsioon: Costase libisemisaeg kasutab nüüd silmuse SNR-i rho/4 (poolsüklilised libisemised); vaikimisi jitter_table log10_mean_time_to_cycle_slip_s langeb väärtuselt { "11.58" } väärtusele { "2.10" } lävendil { "25.47" } dB-Hz

# text
seg-9910640b7886 = tracking_loop (composing sdr, jamming)

# text
seg-a3538a1ff1f4 = tracking_loop::tests (avatud silmusega Costase diskriminaatori värin vs sdr::correlate, mis on sammuti edasi viidud algväärtustatud (seed) sünteetilisel IF-il, { "3" } koondatud müra realisatsiooni × { "900" } epohhi, kooskõlas { "0.63" }% juures 35-45 dB-Hz, ruutimiskao liikmelt nõutakse sobitumist vähemalt { "3" }× paremini kui ilma ruutimiskaota vormil kõikjal, kus see on lahutatav; ~{ "32" } dB-Hz atan-diskriminaatori küllastus kinnitatud, mitte ainult öeldud, seega on kehtivuspiir kinnitatud; suletud silmuse σ vs sammuti sdr Costase silmus { "4000" } epohhi jooksul { "3.7" }%; esimese astme DLL tõusu viivitus vs sammuti sdr DLL { "0.17" }%; bessel_i0 vs tabuleeritud I₀ { "7.4e-8" }; hüstereesi laius peab jääma vahemikku [{ "5" }·log₁₀ r, { "10" }·log₁₀ r] { "4" } suhte × { "2" } integreerimisaja × { "3" } ribalaiuse korral); api::tests::tracking_loop_kind_round_trips_through_the_dispatch; tests/tracking_loop_gnss_sdr_oracle.rs::finding_is_pinned

# text
seg-63ab7261e10e = kontrollitud samas koodibaasis oleva eraldi teostuse vastu — testitavast üksusest sõltumatu, kuid väliselt mitteautoriteetne — Suletud kujuga samasused, ilma väidetava või saadaoleva välise etaloniga. Hoovavart kontrollitakse ρ/B vastu ja kahte võrdse jaotuse vormi teineteise vastu täpsusega { "1e-15" } — algebralised samasused, seega tabavad need juhtmestamise viga ja mitte muud, ning on nii ka sildistatud. Sisuline tulemus on MEASURED, mitte kinnitatud: viivitus fikseeritud baasjoonest piirab majaka SUUNDA, seega jõuab vaateliini komponent informatsioonimaatriksisse ainult lähivälja kaugusliikme kaudu ja test loeb tekkiva anisotroopia väljastatud spektrist, mitte ei tuleta seda. AM-HM teeb √(p/trace(M)) kõvaks põrandaks, seega saab isotroopse võrdse jaotuse link ainult ALLA HINNATA ja arvutatud-võrdse-jaotuse suhe on täpselt anisotroopia, mille see kõrvale jättis. MEASURED Goldstone'i-laadse/Canberra-laadse paari kohta, mille kõõl on { "10726.748" } km: { "112" } valimipäeva jooksul { "36" } ei lase { "10" }° maski juures ühtegi vastastikku nähtavat epohhi, kõige rohkem vastastikku nähtavat on { "17" } 49-valimilisest ajakavast ja { "73" } elujõulisel päeval jookseb kolmekomponendiline suhe väärtusest { "113.9" }× kuni nelja suurusjärgu võrra suuremani, mediaan { "1513" }×, samas kui piirdumine kahe põikisuunaga, mida vaateliin ei näri, annab { "3.94" }× kuni { "25.8" }×, mediaan { "7.8" }×. MIDA SEE RIDA EI VÄIDA: ühtegi neist arvudest kui tegeliku kampaania omadust. See kehtestab, et pinnapunkti suurus on nüüd ARVUTATUD, mitte eeldatud, ja et seda ei saa vaikselt vahetada jaama tasandi suurusega. Jääb ReferenceImpl/MODELLED: avaldatud Kuu-VLBI pinnapunkti kovariatsiooni, mille vastu valideerida, ei ole, jaamad ja majaka asukoht on illustratiivsed, mitte mõõdistatud, ning efemeriid, kellad, troposfäär ja Maa orientatsiooni parameetrid on FIKSEERITUD, seega on see Cramér–Raoi piir vähendatud parameetrikomplekti jaoks ja iseenesest optimistlik. Sama suurus tuumateel (majakas DE440 Kuul) on valideeritud oma real, "…, kernel path"; sellel analüütilisel teel on väikseim majaka sigma { "3.9" } % allpool selle rea SPICE sõltumatut etaloni, mistõttu jääb see rida MODELLED

# text
seg-e6236f142dae = lunar_vlbi_fim (composing lunar_vlbi, fim, cio, lunar_frame, frames)

# text
# c1: estimate_beacon
seg-5744a8471387 = lunar_vlbi_fim::tests ({ "7" } teegi testi: iga andmepunkti kirjapilt teisendub edasi-tagasi läbi parse/as_str ja tundmatu lükatakse tagasi; kõigi jaamade hoidmine ilma majakata lükatakse tagasi veaga, mis nimetab <c1/>; hoovarv on kinnitatud VÕRDNE ρ/B-ga ja majaka võrdne jaotus VÕRDNE jaama võrdse jaotuse korda selle, mõlemad täpsusega { "1e-15" }, täiendava kinnitusega, et hoovars ületab { "10" }, seega ei ole kaks eelarvet sellel geomeetrial segiaetavad; fikstuuri avaldatud baasjoon on kinnitatud { "10726.748" } km juurde ja selle 49-valimilisest ajakavast kinnitatud andma rangelt vähem kui { "49" } vastastikku nähtavat vaatlust; majaka spekter ühel baasjoonel on mõõdetult vähemalt viie dekaadi laiune ja saadud suhe kinnitatud üle { "1" } AM-HM kaudu ja üle { "100" } tegelikult; jaam-pluss-majakas paigutus on kinnitatud järgupuudulikuks, MÕLEMAD arvutatud väljad on null, samas kui modelleeritud võrdlusosa teatab endiselt. Pluss kaitse fikstuuri enda vastu: tabelite massiivi järele sisestatud ülemise taseme võti muutub selle asemel jaama andmeteks, seega on sisestuskoht kinnitatud ja parsitud stsenaariumi kontrollitud võtit kandma — tõrkerežiim on käitus, mis kasutab vaikselt teistsugust konfiguratsiooni kui test nimetab)

# text
seg-27b8c06d7d01 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga samasused ja enesekooskõla: ühtlase kvantiseerija astme²/12 dispersioon, täpne (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ kovariatsiooni levik, mis kollapseerub võrdse σ korral väärtuseks σ·PDOP, mõõdistuse liikme { "1" }:{ "1" } ülekanne tagajärjena û_user ≈ û_ref, ja väljalülitamise ruutsummasulgemine. PDOP ristkontroll orbit::dop vastu jagab [−û, { "1" }] normaalmaatriksit, seega on see kooskõlakontroll ja on nii sildistatud, mitte sõltumatu etalon. ExternalDataset ei ole saadaval ega väidetud: ühelgi Kuu pinnajaamal ei ole avaldatud mõõdistatud täpsust, ühelgi Kuu diferentsiaalparanduse lingil ei ole avaldatud viivitust ega sõnumivormingut ja kvantiseerimistulemus on suletud kuju, mitte mõõtmine. RTKLIB — mis on juba ühe vahe ja kaalutud vähimruutude tuuma välise koodi etalon — võiks käivitada tahtlikult valesti mõõdistatud baasiga, et kinnitada { "1" }:{ "1" } mõõdistuse ülekannet, kuid see on sõltumatu kood sama esimese astme vaateliini algebra kohal. SUURUSED ON MODELLED: mõõdistuse vaikeväärtus on selle teegi enda Kuu raami realisatsiooni jaotus, mitte mõõdetud jaam, viivitus ja bittide arv on ILLUSTRATIVE sisendid ning edastatud efemeriidi veaVEKTORI enda kasvu ei modelleerita üldse — öeldud väljastatud vananemisseaduse stringis, sest see on liige, mis tõenäoliselt domineerib tegeliku lingi puhul

# text
seg-08708f044bb5 = lunar_dpnt::tests (puhtalt lisav kaitse, mille võtmekomplekti erinevus on täpselt { "{" }correction_link, units{ "}" } ja kõik olemasolevad väärtused on bitthaaval identsed enne muudatust kogutud literaalidega; mõõdistusviga EI dekorreleeru baasjoonega, samas kui orbiidi liige dekorreleerub, ja see püsib nullbaasjoonel, kus orbiidi liige on täpselt null — struktuurne kontroll, mis tabab liikme ühendamist valesse kohta; { "1" } m jaamaviga kandub üle { "1" }:{ "1" } ja on tõestatud, et seda DOP ei võimenda; nullviivitus reprodutseerib vananemata jäägi bitthaaval ja jääk on viivituse suhtes monotoonne, väljastatud kõver võrdub otsekäitustega; kvantiseerimisastme poolitub täpselt bitis ja σ² = astme²/12 ning täisskaala järgib süstitud suurusi; igaüks eraldi väljalülitatud liige taastab ülejäänud kaks ruutsummana; võrdne satelliidipõhine σ levib täpselt väärtuseks σ·PDOP ja see PDOP on kooskõlas orbit::dop-iga; iga väljastatud väli kannab ühikut ja päritoluklassi, kontrollitud mõlemas suunas)

# text
seg-37f07885bbf0 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Aritmeetika, mille arvutas uuesti sõltumatu numpy skript eksporditud juhtudel (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; eelregistreeritud failis tests/fixtures/lunar_station/PREREGISTRATION.md, sissekirjutatud üksi commit'is 9caedf97 enne esimest käitust): { "20" } juhul, kus iga veaterm on sees, on nähtavad hulgad ja olek identsed, toored kaugusvead on kooskõlas { "1.4e-14" } m piires, asendivigade vektorid ja suurused { "1.4e-9" } m piires { "1e-6" } m läve vastu ja iga punkti p95 võrdub numpy.percentile bitthaaval; jaamaparandused JÄID oma { "1e-9" } m lävest TÄITMATA (halvim { "3.73e-9" } m, { "15" } { "20" }-st juhust), ja nendega parandatud kaugusvead: kontrollituna 60-kohalise aritmeetikaga on mõlemad pooled täpse väärtuse kahekordse täpsuse ümardamise piires, kusjuures mõõdistuse liige on kahe { "1e7" } m kauguse vahe, mille viimase koha ühik on { "1.86e-9" } m; kirja pandud, mitte häälestatud. Liik taandub täpselt lunar-differential-pnt liigiks ühe punkti, ühe epohhi ja ühe katse korral. Veamudel, dekorrelatsioonimudel ja iga lävend on selle projekti enda või ILLUSTRATIVE; midagi siin ei ole väide ühegi tegeliku süsteemi kohta

# text
seg-810a6946b5cd = lunar_station (over lunar_dpnt, lunar_service)

# text
seg-ef86901b5985 = tests/lunar_station_coverage_reference.rs (one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt: täpsusega { "1e-12" } m vastuvõtja müraga ja ilma; zero_baseline_floor_is_zero_in_every_trial: { "0" } täpsusega { "1e-9" } m; survey_floor_matches_the_survey_transfer_prediction: p95 enne käitust öeldud { "5" } % vahemikus; coverage_is_non_decreasing_in_the_threshold; corrected_error_grows_with_distance_along_an_azimuth; three_satellites_are_unavailable_with_a_reason_and_no_error; a_satellite_the_station_does_not_see_is_reported; deterministic_for_a_seed_and_moved_by_another; the_work_guard_refuses_an_oversized_grid; the_bundled_scenario_states_a_source_for_every_input; the_result_is_labelled_modelled_with_the_honesty_statement); tests/lunar_station_numpy_oracle.rs (eelregistreeritud numpy uuestiarvutus, salvestatud koos oma möödalaskmisega); lunar_service::tests::south_polar_ring_grid_is_the_published_comparison_grid; tests/lunar_differential_pnt_reference.rs ning registri ja platvormideülesed golden-etalonid muutmata (lisavus); tests/field_units_global.rs (iga väljastatud väli kirjeldatud, erandita)

# text
seg-bfee8a9a8b64 = kontrollitud oma suletud kujul / analüütilise samasuse vastu — tabab ülekirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga pinnad (InternalConsistency): paljas sfääri horisondi langus, kraater platool sfääril vaatlejaga selle keskpunktis ja väljaspool seda ning analüütiline koonus oma rasterdamise vastu. Tegelikul väljalõikel on sõltumatu numpy kiirejälitus (scripts/gen_lunar_terrain_ref.py, numpy { "2.5.3" }; eelregistreeritud failis tests/fixtures/lunar_terrain/PREREGISTRATION.md, sissekirjutatud üksi commit'is edbb9b02 enne skripti olemasolu) kooskõlas viies asukohas: asukoha kõrgused täpsusega { "1.0e-11" } m ja kõik { "1800" } horisondi kõrgust täpsusega { "5.5e-10" } kraadi { "1e-6" } lävede vastu, kärbitud kiirte arvud täpsed; see kontrollib aritmeetikat, mitte maastikku. Ühtegi avaldatud polaarhorisondi ega valgustuse arvu ei ole reprodutseeritud: sissekirjutatud { "1200" } m väljalõige silub alla kilomeetri reljeefi, mida avaldatud valgustusuuringud lahendavad, seega on DEM horisondid MODELLED vaateliin üle uuestivalimistatud tegeliku DEM-i, mitte valideeritud horisont. Jaama asukoht ja satelliidikonstellatsioon jäävad ILLUSTRATIVE; midagi siin ei ole väide ühegi tegeliku süsteemi kohta

# text
seg-641b41572fd9 = lunar_terrain (over skyline, lunar_service::topocentric_basis); lunar_station; lunar_service (coverage_masked, masked_visible)

# text
seg-44e74fb6a0a1 = lunar_terrain::tests (bare_sphere_horizon_is_the_dip: kiirkõnnak reprodutseerib -acos(R / (R + a)) täpsusega { "1e-3" } kraadi igal asimuudil; a_cone_on_a_lat_lon_tile_matches_the_analytic_cone: sama koonus, mis on valimistatud { "0.005" } kraadi laius-/pikkuskraadi plaadile, on kooskõlas analüütilise koonusega täpsusega { "0.25" } kraadi; a_lat_lon_tile_is_none_outside_and_wraps_longitude; crater_in_plateau_matches_the_closed_form: lamedapõhjaline kraater sfääril, vaatleja keskpunktis ning { "4" } km ja { "7" } km sellest eemal, suletud kujuga serva kõrguse atan2((R + H) cos s - (R + a), (R + H) sin s) vastu, kus s pärineb sfäärilise serva ristumise võrrandist, täpsusega { "0.01" } kraadi igal asimuudil; rasterised_cone_matches_the_analytic_cone: { "200" } m polaarsele stereograafilisele ruudustikule rasterdatud koonus, mida loetakse ruudustiku valimistaja kaudu, on kooskõlas analüütilise koonusega täpsusega { "0.25" } kraadi; projection_round_trips_through_the_rasteriser_layout; bilinear_reproduces_a_plane_exactly; stated_horizon_goes_through_the_skyline_rules; an_empty_skyline_is_exactly_the_flat_test); tests/lunar_station_terrain.rs (without_terrain_the_document_has_no_terrain_keys; a_zero_horizon_under_a_positive_mask_is_the_flat_run, mõlema liigi puhul; a_horizon_only_removes_satellites_and_a_wall_removes_everything: user_lt4 säilitab oma lameda arvu ja epohhid, mille horisont maksab, on terrain_masked (kättesaadavus ise võib tõusta, sest horisont võib peita satelliidi, mida jaam ei näe), ja { "89" } kraadi horisont jaamas ei jäta midagi kättesaadavaks; bad_terrain_sections_are_refused; the_vendored_crop_loads_and_is_oriented_as_the_source: Shackletoni ja Haworthi kraatrite põhjad madalad, Malaperti massiiv kõrge, peegelpilt mitte; the_station_site_horizon_from_the_crop; service_volume_dem_points_outside_the_crop_keep_the_flat_mask; a_lat_lon_dem_tile_gives_the_station_the_crop_horizon: sissekirjutatud väljalõikest uuestivalimistatud plaat annab jaamale väljalõike horisondi täpsusega { "0.22" } kraadi (piir { "0.5" } kraadi, fikseeritud enne käitust), koos plaadi kaja ja ühikutega, ning dem_path koos dem_tile_path-iga tagasi lükatud; the_export_site_is_masked_by_the_terrain: iga ekspordirida ületab maastiku täpselt siis, kui see on nähtav ja asukoha horisondist asimuudil kõrgemal või sellega võrdne, geomeetria ei liigu, CSV saab veeru ainult maastikuga; the_horizon_matches_the_preregistered_numpy_ray_cast); tests/prediction_frozen.rs ning registri ja platvormideülesed golden-etalonid muutmata (lisavus)

# text
seg-f7719057f56b = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Mudeli enda tõmmete kinnised kujud ja statistikud (InternalConsistency): DLL-i valem käsitsiarvutuse vastu, DO-229 kuju, kahe vastuvõtja nullpikkusega baasjoone vahe, Gauss-Markovi lag-1 korrelatsioon. Kuu mitmeteelevi ega vastuvõtja mõõtmist, millega võrrelda, ei ole olemas; väärtused on ILLUSTRATIVE ja siin ei ole midagi väidet ühegi tegeliku vastuvõtja kohta

# text
seg-27acdf36c5da = lunar_receiver; lunar_station

# text
seg-8fa2f3da879e = lunar_receiver::tests (multipath_is_the_do229_form; dll_noise_matches_a_hand_computation: { "0.825279" } m at { "45" } dB-Hz, { "0.5" } Hz, d = { "1" }, { "20" } ms; bad_sections_are_refused); tests/lunar_station_ext.rs (receiver_absent_or_silent_is_the_plain_run; zero_baseline_multipath_is_the_difference_of_two_receivers: valimi sigma sqrt({ "2" }) a piires { "6" } %; station_multipath_is_gauss_markov: lag-1 korrelatsioon exp(-dt / tau) piires { "0.01" }, ühikdispersioon piires { "2" } %; inter_channel_biases_are_constant_over_a_trial); tests/prediction_frozen.rs ja etalonväljundid (goldens) muutmata (additiivsus)

# text
seg-3c6a533c15dc = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kasvuliikme kinnise kujuga sigma ja esimest järku levimise kontroll (InternalConsistency). K5 lisa (tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md, eelregistreeritud eraldi kommitis 59d88248): K5 ebaõnnestub igal kasvumääral, parandatud p95 3-D { "369.8" } m, { "2315" } m ja { "22797" } m võrreldes { "1.5" } m läviga ({ "292.96" } m salvestatud ilma kasvuta), nagu enne käitamist öeldud. Ükski avalik allikas ei anna Kuu kasvumäära: ILLUSTRATIVE

# text
seg-304fd4238326 = lunar_station (orbit_growth_range_sigma_m)

# text
seg-c3a151ee3d10 = tests/lunar_station_ext.rs (growth_absent_or_zero_is_the_frozen_error_run; the_growth_term_has_the_closed_form_sigma: kasv sees miinus kasv väljas lingiviga on valimi sigmaga määr tau / sqrt({ "3" }) piires { "6" } % üle { "1600" } tõmbe; linear_growth_is_the_first_order_propagated_error: kiirusviga dv, mida levitatakse puusisese kahekeha integraatoriga stsenaariumi orbiidilt, nihutab asukohta dv tau võrra { "1" } % piires hetkedel { "60" } s ja { "600" } s); tests/lunar_station_published_oracle.rs::k5_growth_addendum_run (ignoreeritud, salvestatud lisa)

# text
seg-f55331e7b5af = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Hetktõmmise taandamine ja lahendaja kinnise kujuga juhud (InternalConsistency). Lisa (tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md, eelregistreeritud eraldi kommitis 001ca100) { "1" } m kõrgusepiirangu, kolme satelliidi ja 6-epohhilise aknaga (ILLUSTRATIVE sätted; allikad nimetavad filtrit, kõrgusepiirangut ja kolme satelliiti, kuid mitte nende sätteid): K1 kuni K5 ebaõnnestuvad ja K6 läbib, { "1" } { "6" }-st nagu salvestatud käitamisel; R300 parandatud p95 3-D viga langeb { "280.6" } m-lt { "2.11" } m-ni (horisontaalne { "0.90" } m, ei hinnata) ja kattuvus jääb { "0" }. Akna sõltumatuse eeldus soosib seda. Mitte väide ühegi tegeliku süsteemi kohta

# text
seg-a866350f7eb2 = lunar_solution; lunar_station (solution_figures)

# text
seg-41f22cf8dd08 = lunar_solution::tests (one_epoch_without_height_is_the_snapshot_solve: võrdub lunar_dpnt::position_error_vector_from_range_errors-iga täpsusega { "1e-8" } m, lõtv kõrgusrida ei muuda midagi, range kinnitab kõrgusevea; three_satellites_need_the_height_row; a_window_shares_the_position; bad_sections_are_refused); tests/lunar_station_ext.rs (the_default_solution_mode_is_the_snapshot_solve: iga näitaja täpsusega { "1e-6" } suhteliselt; height_aiding_and_a_window_do_what_they_say); tests/lunar_station_published_oracle.rs::solution_style_addendum_run (ignoreeritud, salvestatud lisa)

# text
seg-6613341c6bc0 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Etalon: viie avaliku allika arvulised väited, mis on registreeritud URL-i, hankimiskuupäeva, SHA-256 ja litsentsiga failis tests/fixtures/lunar_station/SOURCES.md (arXiv:2602.08432v3; IOAG Cislunar PNT Workshop { "2025" } ja { "2026" } slaidid; UNOOSA ICG WG-B Lunar PNT, juuni { "2024" }), ärakirjutatud lehekülgviidetega failis tests/fixtures/lunar_station_published/CLAIMS.md. Läved, juhud ja sisendid eelregistreeriti failis tests/fixtures/lunar_station_published/PREREGISTRATION.md (redaktsioon { "2" }, 05bf9a19, kommitiud eraldi enne käitamist). { "0.36" } esimene käitamine, leid (jääb MODELLED): { "1" } { "6" }-st läved läbitakse. Kattuvus on { "0.00" } mõlemal ringil võrreldes >= { "0.95" }, ja parandatud p95 3-D viga on { "280.6" } m ({ "300" } km) ning { "293.0" } m viivitusel { "600" } s, võrreldes <= { "1.5" } m. Detsimeetrilävi (K4) ei saanud läbida allikate { "0.30" } m koodimüra korral, mis peegeldab allikatevahelist vastuolu, mitte mudeli tulemust. K6 läbib (suhe { "1.39" } võrreldes <= { "1.5" }), kuid kahe geomeetriadominantse näitaja suhtena ei ole see tõend dekorrelatsiooni kohta kummaski suunas. Põhjus: satelliitide elemendid ei ole avalikud ning ILLUSTRATIVE puusiseste elementidega jagavad kasutaja ja jaam nelja satelliiti üle { "5" } kraadi kõrgusel vaid { "8.2" } % ({ "300" } km) ja { "6.3" } % ({ "600" } km) epohhidest, peaaegu singulaarse geomeetria korral (parandamata p95 { "3.8" } km võrreldes allikate < { "10" } m). Allikate simulatsioonid kasutasid filtrit, kõrgusepiirangut ja kolme satelliiti ühises nähtavuses, mida hetktõmmise liik ei modelleeri. Võrdlus seetõttu ei kinnita ega ümber lükka avaldatud väidet „alammeetrine kogu lõunapooluse ulatuses“. See näitab, et selle mudeli tulemus sõltub orbiitidest, mis ei ole avaldatud. Mitte väide ühegi tegeliku süsteemi kohta; ei ole seotud ühegi ametiasutusega ega selle heaks kiidetud

# text
seg-7217c3bf841e = tests/lunar_station_published_oracle.rs::recorded_finding_one_of_six_bars_passes (salvestatud näitajad registreeritud lävede vastu); tests/lunar_station_published_oracle.rs::published_claims_comparison_run (ignoreeritud, umbes { "7" } s release-ehitusel: käitab uuesti kuus registreeritud juhtu ja kontrollib salvestatud näitajaid)

# text
seg-f4648485be52 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla (InternalConsistency): 2. järku taandamine MAAST-iga kontrollitud ADD v4.2 teele, eelnevate tõenäosuste sõltumatu uuesti tuletamine ja konstrueeritud kahe satelliidi viga. Paaridest kaugemale ei ole MAAST- ega RTKLIB-käitamist tehtud, seega sügavamaid hüpoteesikomplekte ja alamhulga RAIM-i kaitsetasemeid ei ole väliselt kontrollitud. araim_subset_raim jagab araim_dual_raim-i lihtsustusi (üks sigma terviklikkuse ja täpsuse jaoks, üks kell, lihtne normaaljaotuse saba): see ei ole ADD-standardit järgiv

# text
seg-9b655d02dc39 = araim_reference (add_v42_subset_plan, add_v42_protection_levels_to_order); raim (araim_subset_raim, SubsetRule)

# text
seg-feaea6cb2b12 = tests/raim_multi_sv_subsets.rs (deeper_orders_change_nothing_when_pairs_suffice; triples_are_refused_at_order_two_and_planned_deeper: N_fault,max >= { "3" }, seiramata risk P_THRES piires, kolm või enam satelliiti eemaldav alamhulk seiratud, ja rohkem kui kümme seiratud eelnevat tõenäosust tuletatud sõltumatult uuesti kui P_no fault q^k täpsusega { "1e-12" }; a_two_satellite_fault_is_found_as_a_pair: viga vaba käitamisel häiret ei ole, ja { "30" } m nihe kahel satelliidil tuvastati paariga kui suurima normeeritud eraldatusega alamhulgaga); tests/araim_reference_vectors.rs ja tests/integrity_araim_stanford_oracle.rs muutmata (2. järku tee on MAAST-iga kontrollitud tee)

# text
seg-a2b978f8bb5a = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla (InternalConsistency): kaitsetasemed on snapshot_raim-i omad, mis on RTKLIB-i vastu valideeritud oma real, arvutatud uuesti samal geomeetrial; vigadeta ja süstitud vea käitumine. Taevas on esindusliku eelseadistuse geomeetria (mitte kuupäevastatud almanahh), jäägid on sünteetilised ning sigma, häirepiirid ja tõenäosused on öeldud sisendid; siin ei ole midagi väidet tegeliku vastuvõtja kättesaadavuse kohta

# text
seg-7fa54ce845e3 = clock_integrity (run, sky_at, IntegrityCfg); scenario (Scenario::integrity); report (RunResult::integrity_fom); api (clock dispatch)

# text
seg-b9a184f14d5a = tests/clock_integrity.rs (the_block_is_separate_and_absent_by_default: holdover-i näitajad muutmata, { "111" } keelatud epohhi pole saadaval ilma kaitsetasemeta, keeldutud käitamistega > { "1" }; protection_levels_are_the_snapshot_raims_on_the_same_sky: iga proovitud epohhi HPL ja VPL võrduvad täpselt nulljäägiga snapshot_raim-iga samal eelseadistatud taevas ning vigadeta käitamine ei tekita häiret; a_stated_bias_is_detected_while_it_lasts: { "60" } m nihe annab häire täpselt neil { "10" } epohhil, mida see katab; every_integrity_field_has_a_unit); clock_integrity::tests; kella etalonväljundid (goldens) muutmata

# text
seg-6a7d171f880f = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sõltumatu ridaastmelise kuju aste Gaussi elimineerimisega osalise peeleemendi valikuga kinnitab iga kuueoleku astme otsuse — teine algoritm, mis ei jaga koodi testitava omaväärtuse/SVD teega. { "6" }×{ "6" } CR3BP olekuüleminekumaatriks, mida see koondab, kannab oma ReferenceImpl sõltumatut etaloni SciPy variatsioonilise integreerimise vastu ning halo/NRHO algtingimused pärinevad korrektorist, mis reprodutseerib avaldatud L2 lõunapoolset { "9" }:{ "2" } Gateway orbiiti. Olemasolev ruutjuur-infofiltri haru EI loeta sõnaselgelt kinnituseks: see tarbib samu Jacobi maatrikseid ja taandub samale normaalmaatriksile, seega on see kooskõlakontroll kahe arvutusmasina vahel ning väljastatud laiendussilt ütleb seda. EI ole väliselt ankurdatud ning ExternalDataset on seetõttu tagasi lükatud, mitte laenatud STM-i realt: läveorbiidi pikkused ise sõltuvad MODELLED konstellatsiooni kavandist, epohhiruudustikust ja — mõõdetavalt kuni { "40" }× — singulaarväärtuse tolerantsist. Avaldatud tasapinnaline { "2.09" } h reprodutseeritakse täpselt rel_tol = { "1e-6" } korral ja on ise tolerantsist sõltuv ({ "10.25" } h tolerantsi { "1e-4" } korral, { "0.42" } h tolerantsi { "1e-8" } korral), mis on kriteeriumi, mitte orbiidi omadus. Ükski avalik andmestik ei avalda valitud tsislunaarse konstellatsiooni orbiidipikkuse jälgitavuslävi. MEASURED TULEMUS: ruumilise kuueoleku lävi on { "22.17" } h L2 NRHO jaoks ja { "40.42" } h L2 halo jaoks ning EI OLE OLEMAS tasapinnalise DRO perekonna jaoks, mille põhjal avaldatud väide tuletati — aste { "4" } { "6" }-st, andmepinna defekt { "2" } ja kaks täpselt nullist omaväärtust, struktuurne defekt, mida ükski orbiidipikkus ei taasta

# text
seg-3ba62864dd31 = cislunar_observability, observability_gramian, intersat_range, cislunar_srif

# text
# c1: units
seg-02de44e48cf6 = cislunar_observability::tests ja observability_gramian::tests (vaikedokument kinnitatud bitthaaval selle JSON-i, kokkuvõtte ja SVG FNV-1a-ga, kusjuures selgesõnalised vaikeväärtused on kinnitatud mitteoperatsiooniks ja kaheksa laienduse võtit kinnitatud ABSENT, et jäädvustust ei saaks uuesti genereerida enesevõrdluseks; lisanduv <c1/> plokk jäetud külmutusest välja, eemaldades selle ja hashides uuesti enne selle olemasolu kinnitatud konstandi vastu, mis tõestab, mitte ei eelda, et midagi avaldatut ei liikunud; astme invariantsus homoskedastilise sigma all kinnitatud väärtustel σ = { "0" }, { "0.1" }, { "1" }, { "10" }, { "100" } m; σ_pos kinnitatud skaleeruma täpselt lineaarselt σ-ga täpsusega { "1e-6" } suhteliselt; DRO nullruum kinnitatud olema täpselt z ja ż koordinaattelg, kusjuures kaks põhjust on eraldatud — samatasandiliste kosmoseaparaatide vaheline kaugusrida omab û_z = { "0" } ja CR3BP tasandiväline plokk lahtub täpselt z = { "0" } korral; ruumilised Jacobi maatriksid keskmiste lõplike vahede vastu ning kasti sõltumatu 3-D kaugusmuutuse vaadeldava suuruse vastu; tasandivälised perekonnad tasapinnalises režiimis tagasi lükatud)

# text
seg-d1770a478184 = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Kolm sõltumatut teed, millest ükski ei ole avaldatud ennustustäpsuse näitaja. ({ "1" }) Analüütiline signaal teadaolevate koefitsientidega — ainus viis perioodilise masinavärgi läbi proovimiseks, kuna ükski kommitiud rida ei ole piisavalt pikk aastaliikme lubamiseks. ({ "2" }) Õpikuline kinnise kujuga vähimruutude lahend, teistsugune algebra kui testitav maatrikslahend, päris ridadel. ({ "3" }) Tegelikult arhiveeritud Bulletin A ennustusread, mida päris { "2026" } toode avaldab, võrreldud iga ennetusaja kohta KOKKULEPPE statistikuna ja sõnaselgelt mitte veana: { "0.256" } ms { "1" } päeva korral, { "0.695" } ms { "2" } päeva korral, { "1.252" } ms { "3" } päeva korral, triivides { "3.885" } ms-ni { "9" } päeva korral. Seega on see Bulletin A KLASS, lähedane lühikese ennetusaja korral, mitte Bulletin A. Ennustatud-versus-lõplikud jäägid on tõelised mõõdetud suurused üle tõeliste IERS-i ridade, kuid nende suurust kontrollitakse ainult võrdluse SUUNA vastu, mitte kunagi IERS-i avaldatud täpsusarvu vastu — päris toote lugemine on päritolu, mitte sõltumatu etalon. MEASURED: päeval { "1" } annab operatiivne ennustaja { "3.78" } m Kuu-raamistiku viga persistentsuse { "11.39" } m vastu ({ "3.01" }×), päeval { "2" } { "10.23" } m vastu { "21.72" } m ({ "2.12" }×), päeval { "3" } { "20.33" } m vastu { "30.57" } m ({ "1.50" }×) — ja see on HALVEM kui kolm päeva ({ "0.87" }× { "5" } päeva korral, { "0.43" }× { "10" } korral), mida aruanne väljastab, mitte ei näita ainult neid horisonte, mis seda soosivad. EI reprodutseeritud: autoregressiivne jääkfilter ja tabuleeritud tsonaalse loodete taandamine, 365-päevane operatiivne aken on kommitiud andmetega kättesaamatu ja selles hoidlas EI OLE ühtegi arhiveeritud varasemat rea versiooni — seega teatab arhiveeritud versioonide tabel ridu mitte ühtegi, mitte ei hinda sünteesitud rida. { "0.30" } väline võrdlus, leid (jääb MODELLED): hinnatud samade lõplike vastu { "178" } arhiveeritud Bulletin A väljaande üle crate'i vaikimisi 15-päevase aknaga on ennustaja UT1 MAE 2.4x kuni 12.6x Bulletin A omast { "1" } kuni { "10" } päeva korral (lävi 1.5x) ja { "5.32" } ms { "10" } päeva korral, väljaspool 2. EOP PCC { "0.36" } kuni { "3.13" } ms vahemikku; poolus on 1.5x kuni 1.85x Bulletin A omast (1.5x sees ainult { "6" } ja { "7" } päeva korral); { "19" } { "21" }-st eelregistreeritud tingimusest ebaõnnestub. Parandus teele ({ "3" }): { "2026" } toote read, millega seda võrreldi, kannavad IERS-i I (mõõdetud) lippu, mitte P, seega on need kokkuleppenäitajad mõõdetud kiirväärtuste, mitte Bulletin A ennustuste vastu. { "0.30" } voor { "2" }, vähimruutude pluss autoregressiivne ennustaja analüütiliselt eemaldatud tsonaalsete loodetega, { "178" } arhiveeritud Bulletin A väljaande vastu 1. vooru lävel (eelregistreeritud c93605b4), leid (jääb MODELLED): { "12" } { "21" }-st tingimusest peab paika; UT1 MAE on { "1.73" } kuni 2.11x Bulletin A omast { "2" } kuni { "10" } päeva korral (lävi 1.5x), samal ajal kui poolus on 1.27x piires igal ennetusajal. { "0.30" } redaktsioon: kui võrguväline sisend on nüüd klassifitseeritud IERS-i lipu järgi, on tee ({ "3" }) kokkuleppenäitajad päris Bulletin A ennustuste vastu (0.256/0.695/1.252/3.885 ms 1/2/3/9 päeva korral kiirridade vastu -> 0.133/0.421/0.839/2.786 ms)

# text
seg-455bea44de27 = frame_eop, realtime_frame_eop

# text
seg-faacca83ed58 = frame_eop::tests, realtime_frame_eop::tests ja tests/operational_eop_predictor_reference.rs (analüütilise signaali koefitsientide taastamine täpsusega { "1e-9" } 365-päevase akna korral; nihke-pluss-kiiruse sobitus võrdne kinnise kujuga tavalise vähimruutude tõusu ja lõikepunktiga täpsusega { "1e-12" } päris ridadel; KAKS ettevaatamisdetektorit, mis rikuvad iga väljaandmise epohhi järgse rea kiire UT1 ja poolusa veerud — jättes Bulletin B lõplikud terveks — ja nõuavad bitthaaval identset väljundit, mutatsiooniga kontrollitud muutma { "10" } testi punaseks, kui sobitusbarjääri lõdvendatakse täpselt ühe päeva võrra; sõltumatult uuesti ehitatud epohhiloend; sihtmärgi Bulletin B plokk tühjendatud ja epohh näidatud tabelist lahkuvat; liikme lubamine kontrollitud { "6" }-, { "15" }-, { "150" }- ja 365-päevase akna korral; monotoonsed reaarvud; ja külmutatud muutuseelne vaikearuande jäädvustus, mida kinnitatakse väljade kaupa ilma tolerantsita, mis lisaks kinnitab, et jäädvustus ei sisalda uusi võtmeid, nii et seda ei saa vaikselt uuesti genereerida enesevõrdluseks); tests/operational_eop_predictor_bulletin_a_oracle.rs::predictor_mae_against_bulletin_a_and_the_pcc_range_finding; tests/operational_eop_ls_ar_bulletin_a_oracle.rs::ls_ar_predictor_against_bulletin_a_finding; tests/eop_prediction_beyond_table.rs (valikuline EopSeries::with_ls_ar_prediction laiendus üle viimase rea: tabelisisesed vastused bitthaaval identsed, prognoosiread võrdsed ls_ar_predict-iga, raamistikuargumendid üle tabeli järgivad prognoosi, mitte ei kärbita; sisemine kooskõla)

# text
seg-546d8034c488 = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Kinnise kujuga samasused ja sõltumatu hoidlasisene tee, ilma välist sõltumatut etaloni väitmata. Helmerti kavand — ainus uus tuletis moodulis — tuletatakse uuesti lunar_frame_realise::apply_helmert-i keskmise lõpliku vahe abil, tee, mis ei jaga ühtki avaldist analüütilise kujuga. Kogunemine, mida see koondab, on lunar-vlbi-fim-i oma, mille Jacobi maatriksit seal lõplike vahedega kontrollitakse lunar_vlbi::vlbi_delay_s vastu ja mille lineaaralgebra tuum on eraldi väliselt ankurdatud numpy vastu failis tests/fim_observability_reference.rs — see rida ei laena kumbagi staatust. Füüsikaline sõltumatu etalon on struktuurne, mitte arvuline: majakaviivituse osatuletis on kahe peaaegu paralleelse ühikvektori lähivälja ERINEVUS, seega halvimini määratud nihkesuund PEAB olema kehakinnisuunaline suund Maa poole ja test kinnitab arvutatud vastust eraldi mõõdetud suuna vastu. MEASURED: kampaaniast tuletatud nihke sigma { "6.3975" } m süstitud teisenduse stsenaariumi { "0.3125" } m taastamisvea vastu ({ "20.5" }× täpsem), samal ajal kui pööre ja mõõtkava kulgevad TEISE SUUNAS, vastavalt { "2.32" }× ja { "13.5" }× lõdvemalt — süstitud tee eeldab üht isotroopset sigmat ja jaotab seega oma vea ühtlaselt seitsme parameetri vahel, mida viivituse vaadeldav suurus ei tee. Aste 7/7, kuid tinglikkus { "3.8e5" }, kusjuures üks suund on { "99.57" } % puhas nihe-Maa-suunas ja nelikümmend korda halvem kui ükski teine. MIDA SEE RIDA EI VÄIDA: et kampaaniaarv on absoluutselt õige. See tõestab, et arv TULENEB nüüd ajakavast, geomeetriast ja veamudelist, mitte istutatud vastusest. Jääb ReferenceImpl/MODELLED: ühtki avaldatud Kuu-VLBI kampaania-pluss-andmepinna kovariatsiooni paari ei ole, jaamavõrk ja viivituse sigma on ILLUSTRATIVE sisendid (majakakataloog on allikatega, kampaania mitte), vaatlusi käsitletakse sõltumatutena, kuigi päris seansi troposfäär ja kell on lähedaste skaneeringute vahel korreleeritud, ning efemeriid, kellad, troposfäär ja Maa orientatsiooniparameetrid hoitakse FIKSEERITUD. { "0.30" } väline võrdlus, leid (jääb MODELLED): kui iga majaka Jacobi rida on uuesti ehitatud NAIF SPICE-i valguse levi aegadest (DE440, ITRF93, MOON_ME; eelregistreeritud { "50863551" }), langevad ajakava, Helmerti aste, andmepinna sigmad (piires { "4.7e-3" }), tinglikkus, nõrgim suund ({ "0.07" } kraadi), libratsiooni pühkimine ja kaarte järjestus kokku kuue stsenaariumi puhul eelregistreeritud { "1" } % / { "0.2" } / { "0.05" } kraadi piires. NumPy kommitiud mootori Jacobi maatriksil langeb kokku täpsusega { "3e-14" }, kus jaamad on fikseeritud. Kui jaamu hinnatakse, erineb see { "6.8e-6" } võrra eelregistreeritud { "1e-9" } vastu, mille tinglikkuse eeldus oli vale (Helmerti tinglikkus { "2.1e8" }; sõltumatud NumPy teed lähevad lahku { "3e-6" } võrra; panust mootori { "1e-9" } pseudopöördmaatriksi tagavaralt ei ole välistatud), seega rida selle eelregistreeringu põhjal ei edutata. { "0.36" } uuesti registreerimine tinglikkusega skaleeritud lävel (eelregistreeritud b887eb05; t = max({ "1e-12" }, { "10" } kappa { "2" }^-53) ühisinfo ja selle Helmerti taandamise tinglikkusest), leid (jääb MODELLED, NOT MET): samm { "0" } välistab pseudopöördmaatriksi tagavara { "6.8e-6" } lõhe põhjusena (ükski Helmerti maatriksi ülesvoolu maatriks ei lange kuuel algsel stsenaariumil tagavarale, kitsaim varu tegur { "2.6" }), SPICE-i haru peab endiselt paika kõigil kuuel ja NumPy langeb läve piires kokku kaheksast stsenaariumist kuuel (vaikimisi, kaks kaart, 3x viivituse sigma, kollineaarne defekt ja värske jaamad-fikseeritud käitamine 2026-12-01; halvim { "0.13" } selle lävest). See ebaõnnestub stsenaariumil stations_estimated (andmepinna sigmad kuni { "6.8e-6" }, tinglikkus { "9.1e-6" }, sõltumatus-kõrvale-jäetud norm { "3.5e-6" }, võrreldes t = { "5.9e-7" }) ja värskel kuupäeval ei ole lõunapooluse majakal vaatlust, seega on majakainfo astmepuudulik (pseudopöördmaatriksi tagavara Helmerti maatriksi ülesvoolu mõlemal värskel stsenaariumil) ning muutmata NumPy sõltumatu etalon ei saa stsenaariumi stations_estimated_fresh hinnata (singulaarne maatriks). Tulemused: docs/design/evidence/mr05-lunar-datum-cond/RESULTS.md

# text
seg-c77bd56a0619 = lunar_frame_campaign (composing lunar_vlbi, lunar_vlbi_fim, fim, lunar, lunar_frame_realise, frames, cio, lunar_frame)

# text
seg-98fa9786f0c9 = lunar_frame_campaign::tests ({ "21" } teegitesti: Helmerti kavand lunar_frame_realise::apply_helmert-i keskmise lõpliku vahe vastu — moodul, mille JAOKS andmepind on, mis ei arvuta tuletist ja kinnitab seega [p]ₓ märgikokkuleppe — kõik { "84" } kavandisissekannet langevad kokku täpsusega < { "1e-6" }; puhas võrgu nihe loetud tagasi puhta nihkena < { "1e-6" } lekkega teistesse kuude parameetrisse; andmepinna sigma täpselt lineaarne viivituse sigmas täpsusega { "1e-8" } üle { "3" }× muutuse kõigil seitsmel parameetril; { "16" } h kaar mõõdetud halvem ja { "48" } h kaar mõõdetud parem kui { "24" } h, väljastatud libratsiooni pühkimine samas järjestuses; halvim nihketelg kinnitatud OLEMA eraldi mõõdetud kehakinnisuuna Maa poole domineeriv telg ja teistest halvem > { "5" }×, füüsikaline sõltumatu etalon, millest lahendajale midagi ei öeldud; kolm kollineaarset majakat tekitamas defekti, kus iga andmepinna sigma on NULL ja nullsuunad väljastatud seitsmeparameetrilises baasis; offblock_fraction ja majakatevaheline korrelatsioon täpselt { "0.0" } fikseeritud jaamadega ja mõlemad > { "0" } hinnatud jaamadega; võrdlusploki süstitud teisenduse näitajad näidatud võrdsena selle stsenaariumi sõltumatu käitamisega täpsusega { "1e-14" } suhteliselt, mitte ärakirjutatuna; valve, et ühtki süstitud/taastatud andmepinda ei ilmu dokumendis kuskil; Kuu raamistiku realiseerimise väljund kinnitatud bitthaaval FNV-1a-64-ga üle json‖summary‖svg kolme sisendikuju jaoks, sõrmejäljega enne töö algust); tests/lunar_vlbi_campaign_spice_oracle.rs::lunar_frame_campaign_finding_stations_estimated_p2_precision (väravdatud; range lunar_frame_campaign_matches_spice_geometry_and_numpy jääb ignoreerituks); tests/lunar_frame_campaign_mpmath_oracle.rs::lunar_frame_campaign_datum_matches_mpmath_extended_precision (leid; asutaja otsus 2026-10-02, valik A: see rida jääb MODELLED ja ei laena eraldi rea staatust; 50-numbrilise mpmath sõltumatu etaloni vastu, eelregistreeritud 804662d5, mootori jaamad-hinnatud andmepinna sigmad on oma a priori tagasivea piires, { "9.7e-6" } kõrvalekalle 2024-01-01 korral, ja { "1e-9" } lävi oli madalam kui ükski kaksiktäpsusega tee saavutab, parim, NumPy QR-projektsioon, oli { "5.5e-9" } kõrvalekaldega; tõend toetab eraldi rida „Kuu raamistiku andmepinna kovariatsioon hinnatud jaamadega, 50-numbrilise laiendatud täpsuse vastu“); tests/lunar_frame_campaign_pinv_fallback.rs::finding_step0_fresh_beacon_information_falls_back (kinnitatud); tests/lunar_frame_campaign_cond_bar_oracle.rs::finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios (kinnitatud)

# text
seg-114007ecc9fe = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Eraldi hindaja selles koodibaasis teisel algoritmil ja lahkneval kooditeel: mittelineaarne kaalutud Gauss-Newton lõplike vahede osatuletistega, selle otsus loetud mõõdetud olekutaastamisvea kujul km ja mm/s. Sellel ei ole Gramiani astme-ja-kovariatsiooni teega ühtki ühist avaldist ning eraldatust KINDLUSTAB lähtetekstivalve, mitte ei väideta. MEASURED avaldatud tasapinnalisel DRO ruudustikul: HINNATAVUSE kriteerium on CORROBORATED — mõõdetud Monte Carlo piir on { "5.739130" } h võrreldes formaalse { "5.739130" } h-ga (suhe { "1.0000" }) ja mõõdetud RMS reprodutseerib formaalse 1σ üle { "21" } kaare pikkuse geomeetrilise keskmise suhtega { "0.9804" }. ASTME kriteerium EI OLE korrobireeritud taastatavuse piirina: hindaja taastab alates { "0.782609" } h võrreldes Gramiani { "2.086957" } h-ga, suhe { "0.375" }, ja punktis { "1.826087" } h — viimane eesliide, mille astmelugemine hindab { "3" } { "4" }-st — taastab { "1.96e-5" } a priori nihkest. Taastamispiir on liikumatu kolme dekaadi jooksul oma piiri kohta, samal ajal kui astmelävi ulatub „mitte kunagi“ kuni { "0.782609" } h neljal dekaadil rel_tol, ja need kaks langevad täpselt kokku rel_tol = { "1e-8" } korral. See ulatus registreeriti esmalt kui ulatuv { "0.260870" } h-ni; see arv oli ARTEFAKT, mille tekitas astmelugemine, mis luges { "4" } suunda { "2" } mõõterealt f64 mürataseme all, ja see on siin parandatud, mitte jäetud püsima. Astmelugemine on nüüd piiratud Sylvesteri võrratusega koos väljastatud põhjusega ja parandatud ulatus küllastub täpselt kaarel, kus sõltumatu hindaja taastab, mis tugevdab selle rea ristvalideerimist, mitte ei nõrgenda seda: avaldatud { "1e-6" } on konservatiivne singulaarväärtuse KOKKULEPE, mitte väide taastatavuse kohta. Sama muster ruumiliselt: NRHO { "9.290323" } h võrreldes { "21.677419" } h-ga, halo { "22.978723" } h võrreldes { "39.829787" } h-ga, kusjuures hinnatavus langeb mõlemas täpselt kokku. Tasapinnalise DRO kuueoleku taastub mitte ühelgi kaarel, reprodutseerides sõltumatult selle perekonna struktuurse andmepinna defekti hindajalt, kellele selle kohta midagi ei öeldud. EI ole väliselt ankurdatud — dünaamika ja algtingimused jagatakse testitava analüüsiga ja ükski avalik andmestik ei avalda sellist lävendit — seega on ExternalDataset tagasi lükatud

# text
seg-f3fcc6b9e10a = cislunar_arc_recovery, batch_ls

# text
seg-457a19842691 = cislunar_arc_recovery::tests ja tests/cislunar_arc_recovery_reference.rs (mõlemad piirid ja nende suhted kinnitatud avaldatud ruudustikul; mõõdetud veakõver võrreldud formaalse kovariatsiooniga rea kaupa rea kohta teguri-kaks piiri ja geomeetrilise keskmise piiriga; NEGATIIVNE KONTROLL — tasapinnaline DRO kuueolek — kinnitades, et kriteerium SAAB ebaõnnestuda ja et regulariseerimata hindaja hajub üle { "1e6" } km, mitte ei tagasta usutavat väikest viga; parametriseerimise invariantsus kinnitatud iga eesliite korral täpsusega { "1e-3" } suhteliselt; lähtetekstivalve, mis eemaldab kommentaarid, stringiliteraalid ja testimooduli ning ebaõnnestub seejärel igasuguse Jacobi, STM-i, SVD-astme või SRIF-i masinavärgi mainimise korral, mutatsiooniga kontrollitud keelatud kutse süstimisega; ainult testis olev kontroll, et lõplikud vahed võrduvad analüütiliste ridadega, nii et lineariseerimine on teadaolevalt hea, samal ajal kui analüütiline tee jääb hindajast puuduma; determinism kinnitatud bait-baidi haaval; avaldatud cislunar-observability dokument kinnitatud võtmekomplekti, kanoonilise sõrmejälje ja kokkuvõtterea järgi)

# text
seg-03751f09c5c9 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — GEOMEETRIA on väline ja hashitud: kolm fikseeritud komplekti, mille arvud pärinevad ainult dokumentidest, mis on hangitud URL-i, hankimiskuupäeva ja SHA-256-ga, taasgenereeritavad kommitiud generaatoritega, mis kontrollivad ülesvoolu hashi ja KATKESTAVAD, mitte ei väljasta arvu — LANS-i koostalitluse demonstratsiooni etalonkonstellatsioon (NASA NTRS { "20250009447" }, SHA-256 d1b916be…), LNCSS-i juhtumiuuringud (NAVIGATION { "70" }({ "4" }) navi.613, CC BY, SHA-256 { "4e294687" }…) ja tõeline lennanud kosmoseaparaatide efemeriid LRO, Danuri, Chandrayaan-2 ja CAPSTONE jaoks, hinnatud JPL-i enda rekonstrueeritud kernelitest Horizonsi kaudu. Ühtki Kuu navigatsioonikonstellatsiooni kernelit EI OLE avalikult olemas — Moonlight/LCNS, LCRNS ja LNSS ei lenda ja NAIF ei avalda nende kohta midagi — ega ühtki ole välja mõeldud. Tuletatud σ_URE nõudel EI OLE välist sõltumatut etaloni (keegi ei avalda kaugusmõõtmistäpsust, mida { "50" } m Kuu HPL selles teenindusmahus nõuab), seega kontrollitakse seda oma algebralise samasuse vastu ja sõltumatult, käitades kogu pühkimise uuesti arvutatud nõudel ning kinnitades, et kättesaadavus pöördub seal ümber. MEASURED: avaldatud 8-satelliidiline kavand vajab σ_URE { "2.9044" } m { "100" } % kattuvuse korral võrreldes illustratiivse konstellatsiooni { "0.3591" } m-ga { "37.85" } % korral — avaldatud arvu { "8.09" }× redaktsioon programmireegli R4 alusel. Kvalitatiivne järeldus püsib (LNIS-klassi { "30" } m ei sulge endiselt { "50" } m lõunapooluse HPL-i), kuid puudujääk oli kaheksakordselt ülehinnatud. 5-satelliidiline LANS-i demo annab NULL kaitsetaseme valimit — viis satelliiti ei saa anda kuut nähtaval, mida ühe vea hüpoteesikomplekt vajab — ja nõudeväli on PUUDU, mitte väljamõeldud; samamoodi nelja tegeliku kosmoseaparaadi puhul { "0" } % kattuvusega. InternalConsistency on aus liik: SISENDANDMED on välised ja hashitud, kuid suurus, mille kohta see rida on, on valideeritud ainult iseenda vastu. { "0.30" } väline võrdlus, leid (jääb MODELLED): LNCSS-i juhtumiuuringu navi.613 statistikate vastu { "346" } ruudustikupunktil jäävad { "4" } { "12" }-st kättesaadavusstatistikast väljapoole eelregistreeritud { "2" } protsendipunkti (juhtum A: -4.0, +{ "22.5" } ja -3.6 pp; juhtum B: -12.1 pp). Tõenäolised põhjused: elemendid loetud vales raamistikus, kahekeha Kepler üle { "15" } päeva võrreldes artikli täpsustamata jõumudeliga ning tekstist mitte reprodutseeritav ruudustik. PDOP-i pool ei olnud hinnatav (LANS ei trüki arvulist statistikat); võrdlustest on kommitiud ignoreeritult. { "0.30" } voor { "2" }, leid (jääb MODELLED): Orekit { "12.2" } / Hipparchus { "3.1" } sõltumatu etaloni vastu, mis arvutab kogu aruande (Orekiti levitamine, DOPComputer nähtavus ja DOP, Hipparchusest koostatud MHSS-i kaitsetasemed, nõue lahendatud valimi kaupa; eelregistreeritud d3ce97b2), langevad kõigil viiel hangitud geomeetrial ja kahel ruudustikul { "155" } { "160" }-st väärtusest kokku eelregistreeritud lävede piires ({ "2" } pp, { "5" } %, { "1" } %), sealhulgas sigma_URE nõue LNCSS-i A ja C jaoks ({ "3.879072208" } m mõlemal poolel juhtumi A korral) ning puuduv nõue LANS-i ja orbiitide korral. LNCSS B tihedal ruudustikul ebaõnnestub halvima valimi statistikatel (sigma_required { "0.000923" } võrreldes { "0.001511" } m-ga, hpl_max { "1.63e6" } võrreldes { "0.99e6" } m-ga), kus peaaegu singulaarsed geomeetriad (PDOP umbes { "1e6" }) võimendavad meetritasemel asukohakokkulangevust; selle p95 nõue langeb kokku ({ "1.6343" } võrreldes { "1.6357" } m-ga). Halvima valimi nõue on degenereerunud geomeetrial ebakorrektselt püstitatud. navi.613 vastu: { "4" } { "12" }-st on endiselt väljaspool { "2" } pp (kinnitatud)

# text
seg-b6b73589032f = lunar_ephemeris, lunar_service

# text
# c1: ephemeris_path
seg-4cab37e82f00 = lunar_ephemeris::tests (vormingu ja raamistiku sõelumine; Lagrange'i interpolatsioon täpne sõlmedes ja lineaarsel rajal sõlmedest väljas; ICRF-i elemendid läbivad IAU { "2015" } taandamise ja on baidivõrdsed selgesõnalise icrf_to_iau_moon rakendusega; tõeline↔keskmine anomaalia edasi-tagasi teisendus edasise Kepleri lahendi vastu; vigase vormiga failid tagasi lükatud nimetatud põhjusega). lunar_service::tests (kui <c1/> on määramata, on aruande võtmekomplekt ja SHA-256 kinnitatud; Kepleri rida võrdub eraldiseisva Kepleri käitamisega väli väljalt; samasus σ_required · HPL_max / σ_URE = AL, seejärel LÕPUST LÕPPU uuesti käitamine arvutatud nõudel, mis saavutab { "100" } % kaitsetaseme kättesaadavuse, ja uuesti käitamine { "1" } % selle kohal, mis seda ei saavuta; iga kahe uue ploki väljastatud arvväli läbi käidud toodetud JSON-ist ühiku ja päritoluklassi jaoks; kommitiud fikseeritud komplektid sobitatud oma allikatabelitega satelliit satelliidi haaval; tabeli lõpust kaugemale ulatuv horisont tagasi lükatud); tests/lunar_service_requirement_orekit_oracle.rs::lncss_b_dense_finding_is_unchanged; tests/lunar_service_volume_orekit_oracle.rs::service_volume_matches_orekit_on_identical_ephemeris_and_grid

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
seg-1e414b2a33b2 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Väljastatud dokument ise: iga arvuline lehtsõlm peab vastama kandele selle dokumendi enda ühikute plokis. Välist ühikute registrit, mille vastu DEKLAREERITUD ühikut kontrollida, ei ole, seega on deklareeritud ühik üle vaadatud väide, mitte kontrollitud väide — värav kontrollib TÄIELIKKUST ja KORREKTSET VORMI, mitte tõde, ja valideeritud oleks vale, sest miski väline ei kinnita, et <c1/> on õige ühik väljale nimega <c2/>. Sõltumatu nimesufiksi ristkontroll tehti { "1,434" } välja üle, mida kirjeldati SELLEL AJAL: { "691" }-st, mis kandsid ühikut tähistavat sufiksit, lähevad { "40" } deklareeritud ühikuga lahku ja kõik { "40" } on seletatud (sekundipõhised sufiksid, miinimumid, apertuurisekundid, njuutonmeetrid nanomeetrit meenutava sufiksi vastu), seega ei ilmnenud ühtki valet ühikut. Seda ristkontrolli ei ole sestsaadik uuesti käitatud ja kattuvus on sellest kaugemale kasvanud — arv on jäetud sellele, mida tegelikult mõõdeti, mitte ei ole uuesti öeldud praeguse koguarvuna. Selle muudatuse ajal ({ "0.27.0" }) liikus kattuvus { "7" } { "56" }-st liigist { "60" }-ni { "61" }-st ning { "389" } { "1354" }-st väljast { "1,742" }-ni { "1,744" }-st (docs/field-units-schema.json, mida aegumiskontroll ajakohasena hoiab). Ükski liik EI JÄÄ katmata (lagi { "0" }, FUT-28, { "0.36" }): viimane oli <c3/>, mille kahe veeru väärtused on kutsuja võtmega, seega on nende ühikud andmed; need on nüüd kirjeldatud kui <c4/> ning iga asukoha ühik loetakse PÜHITUD paketi enda ühikutabelist välja <c5/> ja <c6/> (või võetakse telje deklareeritud <c7/>-st, mis peab kokku langema paketi omaga, kui mõlemad on olemas; null, kui ei ole kumbagi, öeldud, mitte ära arvatud). <c8/> oli selle eelmine ja kadus loendist, kui selle väljastatud dokument sai ühikute ploki: lisatavuse kinnitus, mis oli nimetanud <c9/> keelatud võtmeks, TÕESTAB nüüd, et lisamine on lisatav — eemalda plokk tagasi ja dokument hashib endiselt kahe enne selle olemasolu külmutatud konstandini, nii et lisamise all liikunud väljastatud väärtus ebaõnnestub endiselt. Töö tõi esile ka kaksteist ühiku- või dokumentatsioonidefekti olemasolevas koodis, mis on teatatud, mitte parandatud reegli R1 all

# text
seg-34bff3218a01 = tests/field_units_global.rs (kõik { "61" } registreeritud liiki käitatud, üks dokumendikuju igaühe kohta: iga arvuline lehtsõlm peab vastama kandele selle dokumendi enda ühikute plokis; vigase vormiga kanne loetakse puuduvaks IGA liigi puhul, vabastatud või mitte, nii et kohatäide ei osta kattuvust; vabastuste loend ei tohi ületada oma kinnitatud lage, loendis olev liik, mis osutub täielikult kaetuks, EBAÕNNESTUB värava, et loendit ei saaks täita, ja käitaja tabelist puuduv registreeritud liik ebaõnnestub, et uus pakett ei saaks uurimata libiseda — mis ta ka tegi, tabades mõlemat liiki, mis lisati pärast selle töö algust; ühesuunaline ratas kirjeldatud-kuid-määratlemata mahajäämusele; ja kommitiud skeemidokumendi aegumiskontroll); field_schema::tests

# text
seg-8efc76b4ee1d = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ainult sisemine kooskõla: iga lisatud asukoht on eraldi punkt ning laserkaugus või fikseeritud jaama VLBI viivitus puudutab ühte punkti, seega selle info A_p^T M_p A_p on positiivselt poolmääratud ja liitub; test kontrollib Fisheri vahet ja iga dispersiooni selle vastu. Viie massiivi tulemus on olemasolev reaalandmete rida ja on muutmata. Lisatud reflektor taaskasutab viie olemasoleva massiivi jaoks ajastatud epohhe, mis on ILLUSTRATIVE ajakava, ja lisatud majaka võrk, ajakava ja viivituse sigma on ILLUSTRATIVE lunar-frame-campaign sisendid; asukoht on ILLUSTRATIVE lõunapooluse asukoht. Lõunapooluse asukoht näeb Maad madalal horisondil või üldse mitte, mida olemasolevad vaatenurga testid väljendavad; kumbagi asukohta ei kaugusmõõdeta pidevalt. Näitajad on Cramer-Rao piirid vähendatud parameetrikomplekti jaoks, mitte lahendatud andmepind ega väide ühegi tegeliku jaama kohta

# text
seg-926c069f8a2e = lunar_llr (over lunar_frame_campaign::beacon_information, schedule_for and solve_datum_information, lunar_vlbi_fim)

# text
seg-9c29f0e9a061 = tests/lunar_station_geodesy.rs (empty_or_absent_extra_lists_are_bit_identical: tühjad loendid ja lähtetaseme näide annavad vaikearuande ja kokkuvõtte bait-baidi haaval; an_added_site_never_increases_any_variance: H_after - H_before väikseim omaväärtus on mittenegatiivne täpsusega { "1e-9" } suurimast, iga after/before sigma suhe on kõige rohkem üks ja mõlemad lisatud asukohad on vaadeldud; the_rest_of_the_report_is_the_five_array_result; every_station_geodesy_field_has_a_unit; a_beacon_list_inside_the_campaign_block_is_refused); scenarios/lunar-station-geodesy-baseline.toml ja scenarios/lunar-station-geodesy-with-station.toml (sama arhiveeritud ajakava ja sama VLBI kampaaniaplokk)

# text
seg-cc6113ce33c0 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga: iga valve käitatakse üle fikseeritud teadaolevalt halva katke, mis peab käivituma, ja fikseeritud teadaolevalt hea katke, mis peab vaikima jääma, mõlemad literaalkonstandid, mida detektor mõjutada ei saa. Kaks teadaolevalt halba katket on F22 ja F25 defektid nende algses kujus. See on SISEMINE sõltumatu etalon ja rida on vastavalt MODELLED: see tõestab, et valved eristavad defekti selle parandusest, mitte seda, et nende kirjeldatud klassid on ammendavad. Nende öeldud pimealad — jagatud olek, mis ei ole tee, lühikeses nimelises konstandis hoitud kinnitus, haruldane võidujooks, mida kolm käitamist ei proovi, ning kviitung, mida igaüks, kes saab faili kirjutada, saab võltsida — on kirjutatud välja failis tests/source_guards.rs olevas moodulidokumentatsioonis ja iga skripti päises, mitte ei ole jäetud avastamiseks

# text
seg-c56512172ce5 = scripts/gate.sh, scripts/check-gate-receipt.sh, scripts/check-repeatability.sh, scripts/install-gate-hook.sh

# text
seg-94641c011229 = tests/source_guards.rs ({ "9" } testi: mõlemad valved üle kogu lähtepuu, pluss mutatsioonifikstuurid, mis hindavad iga valvet mõlemas suunas — F22 muster teatatud mõlemal kokkupõrkuval teel, tarnitud aatomjärjestuse parandus vastu võetud, pooliku parandus teatatud täpselt teel, mis kaotas oma unikaalse komponendi, tempfile-käepide ja päritud unikaalne kataloog vastu võetud, seinakell tagasi lükatud; deklareerimata kinnitus teatatud, deklareeritud vastu võetud, välistuseta skoop tagasi lükatud, ümbritseva testi dokumendikommentaaris olev deklaratsioon vastu võetud ja näidatud mitte järgmisse testi lekkivat; ja iga kinnituse kirjapilt — hex, kümnendarv, räsistring, baidipikkus, nimetatud baitide arv, golden-fail — nähtud, samal ajal kui algoritmi konstante, RNG algväärtusi ja väikese võimsuse kontrolle ei nähta)

# text
seg-b99e60173863 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Omaduste testid (monotoonsus, ülekandel mittelangemine) + astendajate lint holdover::coast_phase_variance vastu

# text
seg-416def055790 = integrity::composed_pl::tests (monotoonsus, P0-põhi, K(IR/2), astendajad, alumine poolpidevus)

# text
seg-5b20d21462cb = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga peaaegu kindla ümbriku √(2Dt·lnln t) samasus + HPL-i dominantsuse kontroll; Baweja arXiv:{ "2606.24210" } võimatuse õmblus

# text
seg-3d4a4ed81148 = integrity::lil_envelope::tests (lahknemine, lävi, IR-i pingutamise dominantsus)

# text
seg-b286777831de = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ülempiiri kinnise kuju sõltumatu numpy + stdlib-statistics reprodutseerimine (InternalConsistency). BIPM-i Circular-T [UTC-UTC(USNO)] rida on ainult TSITEERITUD sisend — see on SAMA rida, mis on R4 holdover-i kattuvuse rea jaoks juba valideeritud, ja seda EI valideerita siin uuesti; selle väärtuste reprodutseerimine ei tõesta R2 kohta midagi. Sügav terviklikkuse saba on modelleeritud. { "0.30" } väline võrdlus, leid (jääb MODELLED): BIPM-i laboripõhistel UTC-UTC(k) failidel ({ "102" } laboratooriumi, { "105 024" } rida avaldatud määramatustega) ületatakse ülempiiri b = { "2.576" } u sabas { "1e-2" } { "50.8" } % ridadest (Clopper-Pearson { "95" } %: { "50.4" } kuni { "51.1" } %) ja rohkem kui { "1" } % { "101" }-s { "102" } laboratooriumist. Avaldatud u on BIPM-i UTC-UTC(k) määramise määramatus, mitte nihke piir, mis ulatub tavaliselt paljude u-de kordadeni; ülempiir, nagu see on määratud, ei piira tegelikku UTC(k) jälgitavuse nihet. { "0.30" } voor { "2" }, realiseeritud UTC-UTC(k) nihete ülempiir, treenitud 2015-2022 ja testitud 2023-2026 BIPM-i Circular T andmetel (eelregistreeritud ca0921a4, koondatud ületamine kõige rohkem { "1e-2" }), leid (jääb MODELLED): koondatud ületamine on { "0.0333" } ({ "694" } { "20 826" }-st reast { "82" } laboratooriumi üle; { "0.0127" } ilma { "430" } reata, millel reegli järgi piiri ei ole). D9 voor { "3" }, koondatud hierarhiline vananemispiir (utck_bound), eelregistreeritud fb475550 ja hinnatud prospektiivselt Circular T väljaannetel alates { "465" }: ei ole veel käitatud (väljaanne { "465" } avaldati 2026-10-12 umbes { "285" } testväärtusega; eelregistreeritud 1000-väärtuse reegel vajab väljaandeid umbes numbrini { "468" } ja käitamine vajab arhiveeritud 2026-09-30 laboripõhiseid faile, kuna BIPM on need vahepeal { "113" }-st { "87" } osas ümber kirjutanud)

# text
seg-0a2804cefee1 = integrity::hetero_budget::tests + tests/hetero_budget_reference.rs; tests/hetero_budget_utc_k_oracle.rs::overbound_exceedance_on_real_utc_k_finding (andmetega väravdatud: jätab sõnumiga vahele, kui BIPM-i rida puudub); tests/hetero_budget_utc_k_realised_overbound_oracle.rs::realised_offset_overbound_finding; tests/utck_bound_prospective_oracle.rs (D9 voor { "3" }, prospektiivne, ei ole veel käitatud: Circular T { "465" } ilmus 2026-10-12 ja eelregistreeritud 1000-väärtuse reegel vajab väljaandeid umbes numbrini { "468" })

# text
seg-98b92da9ce83 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ristkovariatsiooni ja korreleeritud-versus-sõltumatu liidetud nihke võrratuse sõltumatu numpy reprodutseerimine (InternalConsistency). Esindusliku allikakomplekt; modelleeritud stsenaarium.

# text
seg-477c4bbb36ab = integrity::hetero_budget::tests (correlated_fused_bias_dominates_independent_when_correlated, rho_one_single_realizer_recovers_linear_sum) + tests/hetero_budget_reference.rs

# text
seg-b14204d97c55 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Statistiku sõltumatu numpy reprodutseerimine + omaduste test, et ühisrežiimi süst suurendab seda (InternalConsistency). Modelleeritud stsenaarium. { "0.30" } voor { "2" } (eelregistreeritud f9aa360d), blokeeritud (jääb MODELLED): numpy { "2.3.5" } LAPACK gesv reprodutseerib statistiku väärtuse { "261" } kommitiud juhul (piires { "3.5e-15" } hästi tingitud juhtudel, { "1.2e-9" } tinglikkuse korral kuni { "6.1e7" }); hii-ruut({ "1" }) nullseadus on tsiteeritud teoreem ja tasased paarisdistantsid samasus, millel puudub mootori väljund võrdlemiseks, seega ootab skoopimine omaniku otsust

# text
seg-75e4936b4c2d = integrity::gls_commonmode::tests (common_mode_shift_inflates_statistic_but_not_contrasts, post_fit_common_mode_statistic_is_zero) + tests/gls_reference.rs; tests/gls_common_mode_statistic_numpy_oracle.rs::common_mode_statistic_matches_numpy_lapack

# text
seg-4d3104f6bc80 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Mootoriga reprodutseeritud geomeetriline struktuur pluss kinnise kujuga 2x2 Schuri samasus; STRUKTUURIS kooskõlas Sosnica et al. { "2025" } (arXiv:{ "2510.15484" }) tulemusega, mille teatatud suurusi siin EI reprodutseerita. Klassifikatsioon on struktuurne; korrelatsiooni/CRLB suurused tegeliku geomeetria korral on MODELLED (reflektorite koordinaadid ja orientatsioon hoitud fikseerituna). { "0.30" } väline võrdlus, leid (jääb MODELLED): Sosnica et al. { "2025" } vastu on kauguse-Fisheri alguspunkti-mõõtkava korrelatsioon (-0.993 / -0.988) { "0.05" } piires avaldatud -0.97-st, kuid artikli enda viie reflektori geomeetrial on võrdsete kaaludega 7-parameetriline Helmerti korrelatsioon -0.78 (avaldatud väärtus tugineb reflektoripõhistele vigadele, mida artikkel ei trüki) ja alguspunkti CRLB ({ "0.6" } kuni { "1.2" } mm { "3" } mm kaugusmüra korral) on { "96" } kuni { "98" } % artikli { "3.07" } cm-st madalam { "20" } % tolerantsi vastu. Suurusi ei reprodutseeritud

# text
seg-7bbbfeb6e7b9 = lunar_identifiability, lunar_datum

# text
seg-6ac21ece8e3d = tests/lunar_datum_identifiability_reference.rs (single_internal_range_row_has_six_dim_datum_null_space; extending_the_librating_arc_lifts_the_origin_scale_degeneracy); tests/lunar_datum_sosnica_oracle.rs::origin_scale_correlation_and_crlb_disagree_with_the_published_geometry

# text
seg-21d912943641 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Iga tehnika osatuletiste analüütilised-versus-lõplike-vahede ristkontrollid (sisemised); paranemise SUUND on geomeetriline fakt. Majakate asukohad, ajakavad ja müra on MODELLED/esinduslikud (vt tests/fixtures/llr_geometry/NOTICE.md).

# text
seg-36da2dd8d3db = lunar_datum, lunar_identifiability

# text
seg-12c2f3ad1982 = lunar_datum::tests (LLR/VLBI/orbiter analytic partials vs finite difference); lunar_identifiability::tests (adding_an_offradial_technique_collapses_the_origin_scale_degeneracy; transverse-vs-radial via crlb_diag)

# text
seg-b5169f1f17d9 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Arvutust kontrollitakse sisemiselt: iga analüütiline osatuletis lõpliku vahe vastu ja nulli-andmepinna juhtu nominaalse kauguse vastu. KATALOOGI kontrollitakse väliselt ja sõltumatult - DE440 peateljekoordinaadid (Park et al. { "2021" }, tests/fixtures/llr_geometry/de440_retroreflectors_pa.csv) on ristkontrollitud DE430 pinnakoordinaatide memorandumi tabeliga { "6" } (tests/fixtures/lunar_llr/de430_retroreflectors_pa.csv, masinaga ekstraheeritud SHA-256-ga kontrollitud PDF-ist skriptiga tests/fixtures/lunar_llr/generate_de430_retroreflectors_pa.py) ja langevad kokku täpsusega { "1.12" } m, samal ajal kui samade viie massiivi keskmise-Maa realisatsioon erineb { "672" } kuni { "871" } m võrra. LANGEMISE STRUKTUURI kontrollitakse avaldatud tulemuse vastu: Sosnica et al. { "2025" }, „Definition and Realization of the International Lunar Reference Frame“, arXiv:{ "2510.15484" }, mis teatab Kuu peateljeraamistiku jaoks lunotsentri X ja mõõtkava korrelatsioonikordaja r = -0.97 ning et LLR ei ulata Kuu tegeliku massikeskmeni täpsusega, mis on parem kui { "12" } cm, selle korrelatsiooni tõttu. See moodul taastab sama struktuuri (|corr(t_x, scale)| vahemikus { "0.9" } kuni { "0.9999" }, andmepinna defekt <= { "1" }) ainult LLR-ist koosnevast Fisheri kavandist. Kinnitus on üle efemeriidide, mitte ringsõit: artikkel kombineerib INPOP21a, DE430 ja EPM2021, samal ajal kui seda moodulit juhib DE440 libratsioon. Mida EI reprodutseerita, on suurus - korrelatsioon siin on umbes -0.988 nende -0.97 vastu ja 4-parameetriline CRLB on alammillimeetriline nende saavutatud { "12" } cm põranda vastu, kuna orientatsioon ja reflektorite koordinaadid on siin fikseeritud ja seal lahendatud. Ainult geomeetria ja langemise struktuur; ühtki täpsusväidet lahendatud andmepinna kohta ei tehta. { "0.30" } väline võrdlus: selle mooduli mõõdetud kauguse osad (reflectors(), stations_itrf(), DE440 PA paigutus ja barütsentriline valguse levi aeg llr_bcrs_one_way_m) on valideeritud oma real, LLR-i mõõdetud kauguse mudel, { "192" } ILRS-i normaalpunkti vastu (RMS { "2.81" } m võrreldes { "10" } m-ga). See rida jääb MODELLED, kuna mõõdetud võrdlus ei proovi läbi ülejäänud väidet. Geodeetiline jaamakataloog stations() ümardab APOLLO täpsusele { "0.001" } kraadi; geotsentrilise valguse levi ajaga annab see { "22.7" } m samadel punktidel (test reflector_ranges_against_ilrs_normal_points; { "96" } m varasema elementide kaupa orientatsiooni interpolatsiooniga). Analüütilised kauguse osatuletised ja ainult-LLR Fisher arvutatakse läbi llr_range_m ja reflector_inertial analüütilise Kuu reaga (ephem::moon_position, umbes { "0.3" } kraadi GCRS-ist) ja ilma valguse levi ajata

# text
seg-13c488ae75a6 = lunar_llr_geometry::tests (reflector_and_station_catalogs_are_well_formed, analytic_partials_match_finite_difference, llr_one_way_range_is_earth_moon_scale, zero_datum_reproduces_nominal_range, llr_only_fisher_shows_strong_com_x_scale_degeneracy); tests/lunar_pa_frame_realisation_guard.rs; tests/llr_datum_degeneracy_reference.rs; tests/lunar_llr_geometry_range_oracle.rs::reflector_ranges_against_ilrs_normal_points

# text
seg-9cfe6fa8ac17 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Seotud infomaatriksi Schuri komplemendist marginaalne Fisher, kinnise kujuga lineaaralgebras, kontrollitud kahe piirrežiimi vastu, mida see ennustab. Samaväärsus { "1" } m ja { "3.336" } ns vahel on meetri definitsioon c kaudu ja ei ole empiiriline tulemus. Vaatlusvõrgud on esindusliku modelleeritud geomeetriaga, seega on kavandi seadus väide sellele esitatud geomeetria kohta ega kanna väidet ühegi kasutusel oleva Kuu võrgu kohta.

# text
seg-f741d9570b10 = lunar_gauge::tests (coupled_marginal_well_posed_network_is_psd, coupled_marginal_twoway_equals_more_oneway_in_diverse_network, coupled_marginal_twoway_lift_three_orders, oneway_range_row_has_correct_temporal_entries, twoway_range_row_has_zero_at_offset_and_rate, time_tie_row_equals_pure_offset_vector, rate_tie_row_has_correct_structure)

# text
seg-687f7edfb345 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Fisheri informatsiooni additiivsus sõltumatute mõõtmiste üle on kinnise kujuga omadus, mida siin kontrollitakse sõltumatult kirjutatud elementide kaupa summa vastu ning sellest tulenevate järjestusinvariantsuse ja monotoonsuse vastu. MÄRKUS TÕENDUSE KOHTA: kombineerijal ei olnud varem üldse testi ja ainus mooduli test summeeris kaks infomaatriksit otse, selle asemel et seda kutsuda, seega oleks katkine kombineerija jätnud mooduli roheliseks; test läheb nüüd läbi combine'i ja ebaõnnestub, kui seda mutatsiooniga muuta. Kõik majakate asukohad, orbiteri geomeetria, tehnikapõhised täpsused ja suhtelised kulud on esindulikud valikud, mitte missiooniväärtused (vt tests/fixtures/llr_geometry/NOTICE.md), seega pärib iga selle menüü kaudu saavutatud langemismõõdik ja CRLB näitaja lunar_identifiability::decompose modelleeritud staatuse.

# text
seg-c4c5426a700b = lunar_techniques::tests (combine_is_additive_order_independent_and_empty_is_zero - tühi valik annab nullmaatriksi, üksik valik on ühikmaatriks, paar võrdub sõltumatult kirjutatud elementide kaupa summaga ja tulemus on valikujärjestuse suhtes invariantne; adding_a_block_never_reduces_the_degeneracy_metric - monotoonsus lisatud informatsiooni all; radial_diversity_beats_transverse_for_breaking_the_degeneracy - tagakülje orbiteri plokk tõstab langemismõõdikut rohkem kui ristsuunaline VLBI plokk)

# text
seg-66020d555be6 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Halvima juhu kolmnurgapiir Helmerti punkt-Jacobi toimele (kinnise kujuga)

# text
seg-c5ebc071ce3e = lunar_interop_budget::tests (monotoonsus eelarves; RSS-eelarve vähendamine pakkujapõhise CRLB all; läbitöötatud pöördetolerants Kuu õla pikkusel; piirav liige = pööre)

# text
seg-da0791f2edc4 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Valideeritud paaripõhiste jaotuste RMS-liitmine iga kokkuleppe all (kinnise kujuga)

# text
seg-f4fbaefa3a11 = lunar_interop_budget::tests (CommonEphemeris nullib eelarve; CommonFrameTie < PerProvider; irreducible_fraction > { "0.5" } tegelikel jaotustel; kokkuleppe järjestus)

# text
seg-303947e00325 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Plokkide kaupa spark-/turvalise olekuhinnangu piiri geomeetriline realiseerimine (Fawzi–Tabuada–Diggavi { "2014" }; Shoukry–Tabuada { "2016" }; Donoho–Eladi plokkide kaupa spark { "2003" }; Candès–Tao { "2005" }) — MITTE Lamport–Shostak–Pease'i 3f+{ "1" } konsensuse lävi („Byzantine“ nimetab ainult suvalise/kokkumängiva vea MUDELIT). Konkreetne talutav vigade arv on esindusliku võrgu geomeetria modelleeritud omadus, mida kontrollitakse enesekooskõla suhtes käsitsi konstrueeritud analüütiliste juhtude ja arvuvalemitega

# text
seg-0b39643e9152 = lunar_faultobs::tests — byzantine_c3_rank_deficient_but_nonzero_is_undetectable (nullist erinev, kuid astmepuudulik plokk ⇒ block_spark { "1" }, f_detect { "0" }; sõltumatud veerud ⇒ block_spark { "2" }, f_detect { "1" }), byzantine_real_network_uniform_bias_is_clock_offset (üks kaaslane, kellele kuuluvad kõik sõlme mõõtmised = kellanihke viga ∈ range(G), tuvastamatu, selge Grami spektrilõhega), byzantine_redundant_net_identifies_at_least_one (kuus sõltumatut ühe mõõtmisega kaaslast ⇒ block_spark { "7" }, f_identify { "3" }), byzantine_analytic_spark_identity_projector + byzantine_detect_identify_relations (P⊥ = I käsitsijuhud kinnitavad f_detect = block_spark − { "1" }, f_identify = ⌊(block_spark − { "1" })/2⌋)

# text
seg-c4b1731814f5 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ansambliaja vabaparameetri argument (Percival { "1978" }; Lewandowski & Thomas { "1991" }) realiseeritud esindusliku päris-DE440 sõlmepõhise võrgu peal: analüütilise ühiskiiruse generaatori suhtelise jäägi nulltest GᵀWG vastu, kus kinnimurtud kontrast eristab tõelise gabariidi ostsillaatorimudeli artefaktist. Esindusliku modelleeritud geomeetria, mitte sertifitseeritud ajastuseelarve

# text
seg-70a340255eb6 = lunar_faultobs::tests — holdover_floor_self_ref_and_anchored (enesele viitav võrk: ühiskiirus asub N(GᵀWG)-s, temporal_gauge_dim { "2" }; pärast ühte välist kiiruse sidumise rida: kiirus gabariidist välja tõrjutud, temporal_gauge_dim { "1" } ühise nihke säilimisega)

# text
seg-1b1f761bd9a9 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga pariteediprojektori / pseudopöördmaatriksi algebra esindusliku päris-DE440 sõlmepõhise võrgu peal: ühise/diferentsiaalse jaotus, N(G) ⊕ range(G) ühendamine ja Browni ({ "1992" }) kaitsevahe tõus tulenevad kõik ulatuse nullimisest P⊥·G = { "0" }. Esindusliku modelleeritud geomeetria, mitte sertifitseeritud kaitsetase

# text
seg-11fe79ac46b3 = lunar_faultobs::tests — provider_mismatch_split_common_undetectable_differential_detectable (ühine nihe tuvastamatu, diferentsiaalne tuvastatav), slope_infinity_in_range_finite_detectable (g7: tõus ∞, kui b ∈ range(G), lõplik, kui b ∉ range(G)), pernode_rank_is_state_dim_minus_eight (§{ "0" }: rank(GᵀWG) = state_dim − { "8" }, 8-mõõtmeline gabariit on kogu nullruum spektrilõhega >{ "1e6" })

# text
seg-1ac1dc1c053d = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Nimetatud soovituste ärakiri (vabalt allalaetav aadressilt itu.int), iga piir kannab oma tabelit või klauslit, loetletud koos iga kinnitamata või realiseerimata kirjega failis docs/TELECOM-TIMING.md; tabelitest tulenevad murdepunktide pidevuse samasused kontrollitakse testides. Standardite ärakiri sisemiste kooskõlakontrollidega, mitte standardi järgimise test ega väline valideerimine. { "0.30" } voor { "2" } (eelregistreeritud 970003ee), blokeeritud (jääb MODELLED): kümme maskiväärtust ja kolmteist ePRTC-A holdover-väärtust, mida soovitused trükivad läbitöötatud arvudena (G.8272 joon. 1-2, G.8272.1 Amd.1 cl. { "8.2.1" } ja joon. V.1-V.3, G.8271.1 Amd.3 joon. 7-2 kuni 7-4), reprodutseeritakse poole trükitud ühiku piires, enamik neist tabelikonstandid või murdepunktid; G.8271.1 joon. 7-2 märgib { "200" } ns punktis { "1.3" } s oma tabeli 7-1 vastu ({ "197.5" } ns). G.8273.2 klasside A-D piiridel ei ole trükitud läbitöötatud väärtust ja G.8272.1 ePRTC lukustatud murdepunktide märgised (pidevatel konstruktsioonijoontel) jäeti eelregistreeritud valikureegliga välja, seega need jäävad ärakirjadeks

# text
seg-95c049581604 = telecom_timing (MASKS, eprtc_a_holdover_limit_ns, check_curve, check_mask)

# text
seg-35e253f27caa = telecom_timing::tests (mask_boundaries_follow_the_tables_exactly — avatud ja suletud otsad, τ = { "400" } s vahe G.8271.1 tabelis 7-3, pidevus igas tabelitest tulenevas murdepunktis; a_curve_exactly_on_the_limit_passes_and_just_above_fails; eprtc_a_holdover_envelope_follows_table_3; a_coarse_record_is_not_evaluated_against_a_filtered_mask); tests/telecom_timing_reference.rs (telecom_timing_kind_round_trips_through_the_dispatch); tests/telecom_masks_itu_printed_values.rs (mask_values_match_the_numbers_the_recommendations_print; figure_7_2_label_at_1_3_s_is_not_its_own_table_value)

# text
seg-7af5107287ea = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Nimetatud soovituste ärakiri (alla laetud aadressilt itu.int 2026-10-13), iga rida uuesti loetud teksti vastu, kusjuures trükitud koefitsientidest tulenev murdepunktide pidevus on testides piiratud (näiteks { "40" } · { "10" }^{ "0.4" } = { "100.48" } ns võrreldes G.812 tabeli { "4" } { "100" } ns platooga). Standardite ärakiri sisemiste kooskõlakontrollidega, mitte standardi järgimise test ega väline valideerimine. G.812 (06/2004) on loetletud kui asendatud eelavaldatud 08/2026 väljaandega ja G.811-l on Amd. { "1" } (04/2016); kumbagi ei saanud lugeda, seega kumbagi ei kontrollita. Vabalt töötava OCXO stsenaarium ülehindab ostsillaatori panust vaatlusintervallidel, mis on pikad silmuse ajakonstandi suhtes; see ei ütle midagi ühegi seadme kella kohta

# text
seg-f8b7bc046be6 = telecom_timing (MASKS, Segment::tau_exponent, MeasurementFilter::LowPass10HzAtSource, MaskCondition::Autonomous)

# text
seg-3ae5550f6aaa = telecom_timing::tests (g811_prc_masks_follow_clause_6_1; g812_masks_follow_tables_3_4_6_and_7; g8262_masks_follow_tables_1_3_4_and_5; g8262_1_eeec_masks_follow_tables_1_and_3; a_linear_piece_is_evaluated_without_powf; wander_masks_pass_a_quiet_white_fm_flicker_series; wander_masks_fail_the_same_series_scaled_up)

# text
seg-53210f1b0709 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Eelregistreeritud failis tests/fixtures/clock_log/PREREGISTRATION.md (kommitiud eraldi, 159334f2, enne fikstuuri olemasolu); salvestatud failis RESULTS.md. Kolm algväärtustatud sünteetilist logi, üks iga vormingu kohta (TICC-i kolme epohhi vahe, RINEX-i teine kell, mida ignoreerida), tagasi loetud sõltumatu lugejaga, mille sama autor kirjutas failist docs/CLOCK-LOG-FORMATS.md: ruudustiku, vahe ja täite arvud võrdsed ning suurim faasivahe { "0" } s (lävi { "1e-13" } s). allantools { "2024.6" } oadev, tdev ja mtie sellel faasil langevad kokku suhtelise { "2.5e-14" } piires (lävi { "1e-10" }) igal keskmistamisteguril, mida see hindab; see ei hinda MTIE-d kogu salvestise üle, mida mootor teatab, seega on sellel ühel punktil logi kohta sõltumatu etaloni väärtus puudu ja sõnastatud lävi ei ole seal täidetud. MODELLED: sünteetilised logid ja lugejast etalon jagab autorit; instrumentide päris TimeLabi, TICC ja RINEX kellafaile ei võrreldud

# text
seg-82af02048968 = clock_log (read_input, MeasuredPhaseReport, MEASURED_UNITS, TELECOM_LOG_UNITS); telecom_timing (SeriesInput::clock_log); api (clock kind [clock_log])

# text
seg-df411365b9ab = clock_log::tests (käsitsi kirjutatud logid vormingu kohta: päised, eraldajad, ühikud, sageduse integreerimine, TICC kanalid ja režiimid, vahed ja poliitikad, keeldumised); tests/clock_log_allantools.rs (eelregistreeritud võrdlus: b1_each_log_reads_to_the_reference_phase; b2_adev_tdev_and_mtie_agree_with_allantools; b3_a_telecom_series_read_from_a_log_equals_the_same_samples; b3_the_clock_kind_measured_block_is_opt_in)

# text
seg-1517b58a40f3 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kshana jaoks kirjutatud fikstuurid deemonite avalike reaformaatide põhjal, väljamõeldud väärtustega (NOTICE.md fikstuurikaustas); ühtegi päris paigaldise logi ei loetud ja ükski sõltumatu etalon ei võrdle sõelumist teise lugejaga, seega võib deemoniversioonide vahel erinev formaat siiski tagasi lükatud või valesti loetud saada. Faasireast toidetud hindajad on need, mis on eespool olevatel ridadel allantools-i vastu valideeritud

# text
seg-0a789b9f3db1 = clock_log (parse_linuxptp, parse_chrony, grid_timed_offsets)

# text
seg-b1a8738d620b = clock_log::tests (ptp4l_reads_the_locked_offsets_in_ns; linuxptp_reads_only_the_named_program; ts2phc_gap_is_refused_or_filled; linuxptp_reads_syslog_prefixed_lines_and_picks_an_interface; linuxptp_refuses_a_servo_that_never_locks_and_backwards_stamps; chrony_tracking_reads_the_local_offset_in_seconds; chrony_statistics_needs_a_source_when_there_are_two; chrony_columns_of_the_other_log_are_not_read; clock_selector_is_refused_for_timelab_and_ticc_only) fikstuuridel kaustas tests/fixtures/clock_log/linuxptp_chrony/

# text
seg-d0e0353e588f = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Käsitsiarvutus kirjetel, mis on ehitatud valemitest, mille tõus, aste, ekstreemum ja taastumisaeg on enne käitamist teada (testid esitavad need), ning ülaltoodud telekomi ajastusridade maskid, ümbrikud ja eelarved. Päris holdover-i laboratoorset mõõtmist ei hinnatud ja ühtki välist sõltumatut etaloni ei võrreldud, seega ei esita liik väidet ühegi kella ega süsteemi kohta; enne mistahes kellaklassipõhise näitaja edutamist on vaja ajastuslabori partnerit

# text
seg-5fb2f4812479 = holdover_test (HoldoverTestScenario, recovery, linear_fit); telecom_timing (check_mask, check_envelope, budget_results)

# text
seg-d028f2b41fe8 = holdover_test::tests (the_record_is_split_at_the_stated_times; holdover_figures_match_a_hand_computation; recovery_is_timed_from_the_restoration; masks_are_measured_on_the_step_their_condition_names; a_record_with_no_baseline_says_so; bad_inputs_are_refused_with_the_reason; the_report_carries_the_label_the_units_and_no_conformance_word; a_ptp4l_log_is_scored_end_to_end)

# text
seg-ab6aea7075d0 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — ICG kosmoseteenuse mahu brošüür (UN OOSA ST/SPACE/75, { "2018" }), mis ise on simulatsioon, võrreldud enne käitamist kommitiud eelregistreeringu alusel (xval/gnss-ssv/PREREGISTRATION.md; tulemused failis xval/gnss-ssv/RESULTS.md, kinnitatud failiga tests/ssv_booklet_results.rs, möödalaskmised kaasa arvatud). Käitamine { "1" } eelregistreeritud lugemisel: minimaalse kiirgusvõimsuse konstandid ja Kuu lävi langevad kokku (S0, S6 täidetud); ülemise ja alumise SSV, RF-lävendi, GEO ja HEO läved on NOT MET, peaaegu kõik GLONASS-i kaudu, mille jaoks brošüür annab { "20" } ja { "28" } kraadi tabelites B2 ja B6 ning { "26" } ja { "34" } kraadi tabelis { "4.2" }. Diagnostiline variant tabeli { "4.2" } nurkadega langeb kokku ülemise SSV, alumise SSV ja kuue GEO missiooni igas lahtris (see ei asenda käitamist { "1" }; RF-i, HEO ja Kuu lahtrid jäävad siiski möödavalatuks). Mõõdetud GPS L1 paneeli mustreid parameetriline asendaja ei reprodutseeri (RMS { "6" } kuni { "9" } dB { "3" } dB läve vastu). Kokkulangevus näitab, et brošüüri öeldud meetod on reprodutseeritud, mitte seda, et GNSS-i signaalid käituvad nii

# text
seg-ea770cfea799 = ssv (constellations, geom, sweep, pattern, check)

# text
seg-9a49009f27cd = ssv::geom::tests (the_grid_has_the_booklets_2562_points_on_the_unit_sphere; the_interval_form_equals_the_general_predicate; a_user_behind_the_earth_is_blocked_and_one_beside_the_limb_is_not); ssv::sweep::tests (a_small_shell_run_is_internally_consistent; pdop_of_a_regular_tetrahedron_like_set_is_finite_and_a_flat_set_is_not); ssv::pattern::tests (table_b10_antenna_reads_as_gain_against_angle_from_the_boresight)

# text
seg-1ba52ce8daa7 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga vormid ja avaldatud suurusjärgud testides (Chapmani kihi tipp ja pinna limbi paindumine, paar TECU-t plasmasfääri GPS-ist GEO-ni kiirel); vastuvõtja kavand taaskasutab hõivamis- ja jälgimissilmuse mudeleid ning nende teste. Sellega ei võrrelda mõõdetud limbi sondeerimise ega nõrga signaali vastuvõtu andmeid

# text
seg-05a12f571867 = ssv (limb, weak)

# text
seg-4b5cbdee9714 = ssv::limb::tests (the_chapman_layer_peaks_at_its_height_with_its_density; the_surface_limb_bends_about_one_and_a_third_degrees; plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray); ssv::weak::tests (longer_integration_lowers_the_acquisition_threshold; aiding_narrows_the_search_and_the_loop; a_conventional_receiver_is_far_above_the_ssv_signal_levels); ssv::scenario::tests (the_limb_medium_adds_statistics_and_can_cost_signals; a_weak_signal_receiver_replaces_the_fixed_threshold)

# text
seg-3fc3d17949eb = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Simuleeritud tõde filtri enda hinnangu vastu (kooskõlalise filtri keskmine normeeritud hindamisvea ruut on asukoha puhul umbes { "3" }) ja determinism fikseeritud algväärtuse korral. Lennu- ega salvestatud kõrgorbiidi GNSS-andmeid ei võrrelda; Päike ja Kuu on madala täpsusega ringikujulised asendajad

# text
seg-89cac0893981 = ssv::nav (run_nav, Ekf)

# text
seg-18bbbb4578fc = ssv::nav::tests (the_filter_converges_where_signals_are_plentiful_and_is_deterministic; the_covariance_is_consistent_with_the_error; without_signals_the_filter_coasts_and_the_gap_is_reported); ssv::scenario::tests (navigation_and_formation_run_and_report)

# text
seg-49de2f2c1b32 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sama simuleeritud tõde mis absoluutfiltril: suhtelise filtri viga tegeliku suhtelise oleku vastu ja kontroll, et see on vähemalt sama hea kui kahe sõltumatu absoluutse fiksi lahutamine. Lennu formatsiooniandmeid ei võrrelda

# text
seg-59bd0b502622 = ssv::formation (run_formation, RelEkf)

# text
seg-70f8b2a10f03 = ssv::formation::tests (differencing_beats_subtracting_absolute_estimates_and_is_deterministic); ssv::scenario::tests (navigation_and_formation_run_and_report; formation_needs_navigation_and_one_mode_only)

# text
seg-8abc8cdf5f0c = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Iga kinnise kujuga vorm sõltumatu arvulise tee vastu testides (täpse ülekandefunktsiooni ja viivitusfiltri sagedusala kvadratuur, Monte Carlo üle aatomite lainefrondi nihke jaoks, Monte Carlo üle laskude interferentsimustri indeksi jaoks) ja selle piirjuhud. Üks avaldatud läbitöötatud väärtus: Cheinet et al. { "2008" } (arXiv:physics/0510197, jaotis IV) väidavad, et tau_R = { "20" } us korral on vaja Ramani valge faasimüra alla -111 dB rad^2/Hz, et saada { "1" } mrad ühe lasu kohta; üksnes valge liige annab { "0.99" } mrad (artikkel tuletab taseme oma valemiga { "17" }, flicker pluss valge). Sisemine kooskõla ja üks läbitöötatud väärtus, mitte väline valideerimine; kõrgemat järku aberratsioone ega ühegi konkreetse laseri müra ei modelleerita

# text
seg-9f89545da2ca = inertial::cai_error_terms::tests (raman_transfer_short_pulse_limit_matches_the_acceleration_transfer_function; white_raman_phase_closed_form_matches_quadrature; short_pulse_band_limited_closed_form_matches_quadrature; cheinet_2008_white_phase_noise_requirement_is_reproduced; delay_term_closed_form_matches_exact_filter_quadrature; defocus_phase_is_position_independent_and_tilt_cancels; curvature_bias_monte_carlo_matches_closed_form; curvature_bias_limiting_cases; classical_aided_resolution_monte_carlo_matches_closed_form; multi_t_resolution_monte_carlo_matches_closed_form; ambiguity_limits_and_inverse)

# text
seg-81b9d7ec3df6 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Neli nimetatud Microchipi andmelehte (dokumendinumbrid ja URL-id igas eelseadistuses ja failis docs/TELECOM-TIMING.md) sisendnäitajate jaoks; kinnise kujuga vananemisrambi ja sobituse ümbriku omadus sisemiste kontrollidena. See, kuidas näitajatest saab müramudel — sobitus, põhjareegel, 30-päevane kuu, lineaarne temperatuurilugemine — on modelleerimisvalik; ükski eelseadistus ei ole ühe seadme mõõtmine. { "0.30" } voor { "2" }, ühepoolsed läved mõõdetud seadmete vastu (eelregistreeritud a01c491c), leid (jääb MODELLED): IGS-i jaama THU2 Symmetricom 8040C ESA MGEX lõplikes kellaandmetes on Alani hälve { "0.35" } kuni { "0.87" } rubiidiumi eelseadistusest, kuid holdover-i viga { "1.07" } kuni { "1.60" } sellest; 5071A kirje jääb tseesiumi eelseadistusest väljapoole kuni { "1000" } s (mõõtmise valge faasimüra, 30x { "1" } s juures) ja holdover-is ({ "1.15" } kuni { "8.74" }); halvim { "2011" } toodang SA.45s on 1.26x CSAC eelseadistus { "1" } s juures; OX-208-l ei ole mõõdetud kirjet (blokeeritud)

# text
seg-869454221ef4 = telecom_timing (PRESETS, fit_noise, with_flicker_floor, synthesize_holdover); models (ClockModel)

# text
seg-2fb7b4c2396c = telecom_timing::tests (every_preset_carries_a_named_datasheet_and_figures; the_noise_fit_envelopes_every_datasheet_point; pure_aging_matches_its_closed_form — diskreetne vananemisramp (1/2)·D·t² { "0.1" } % piires päeva jooksul; same_seed_same_series_and_hash_different_seed_different_series); tests/oscillator_presets_measured.rs (caesium_finding_pinned; rubidium_finding_pinned; csac_finding_pinned; ocxo_preset_has_no_measured_record)

# text
seg-30e6d79a47c2 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga vormid iga liikme jaoks eraldi ja sõltumatu holdover::holdover_seconds juureleidmine; andmelehe näitajad on nimetatud dokumendid (docs/SLOT-TIMING.md). Klassi vaikeväärtus tugineb eeldatud punase müra põhjale ja andmelehe allikas on maksimumide ümbrik, seega ei ole kumbki ühegi seadme mõõtmine

# text
seg-d31b872adcb6 = slot_timing (predicted_error_s, breach_after_sync_s, terms_at, slot_budget, ClockNoise::from_datasheet, SlotTimingScenario); clock_state (ClockClass::Tcxo, Ocxo, Rafs, source)

# text
seg-8eba4f60f78e = tests/slot_timing_igs_holdout.rs ({ "10" } GPS Block IIF satelliidikella, { "14" } päeva IGS-i lõplikke kellasid: { "8" } { "1.5" } läve piires, G25 ja G30 optimistlikud kuni umbes 2x, kinnitatud); tests/slot_timing_ocxo_holdout.rs (mõõdetud OCXO: kõrvalejäetud ennustus ei ole kunagi optimistlik, { "0.59" } kuni { "0.70" } mõõdetud rikkest; valimisiseselt { "0.98" } kuni { "1.17" } piires; ilma fix-sageduse liikmeta on valimisisene ennustus igal lävel optimistlik); slot_timing::tests (fix_frequency_uncertainty_alone_is_linear_in_time; reduces_to_the_holdover_inversion — iga klass holdover::holdover_seconds vastu täpsusega { "1e-9" }; white_fm_with_fix_error_has_its_closed_form; flicker_floor_alone_is_linear_in_time; ageing_alone_is_quadratic_in_time; frequency_offsets_add_in_magnitude; the_error_at_the_breach_is_the_guard; datasheet_fit_envelopes_every_point; datasheet_classes_match_their_presets_at_one_second; a_breach_beyond_the_datasheet_is_flagged_as_extrapolated; the_report_carries_the_result_and_a_unit_for_each_field)

# text
seg-4dedb9508666 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Taandamine olemasolevale ajastuse kaitsetasemele ning ringorbiidi ja kerakujulise Maa nähtavuse kinnise kujuga vormidele. Tingimuslik tuvastamisest, üks maapealne spuuferi öeldud rambikiirusel, ülelend pöörlemata Maal; ei ole valideeritud orbiidil spuufitud vastuvõtjal

# text
seg-a1318b5603cd = orbital_timing (orbital_timing, visibility_half_angle_rad, max_pass_s, crosslink_neighbour_is_outside_footprint)

# text
seg-4c4e4d92c416 = orbital_timing::tests (reduces_to_the_terrestrial_tpl — täpselt tpl::timing_protection_level_ns, kui kellal ei ole flicker-, valge faasi- ega juhuslikku jooksuliiget; leo_geometry_matches_its_closed_forms; crosslink_independence_follows_the_footprint; an_independent_check_caps_the_ramp_before_the_pass_ends; a_crosslink_inside_the_footprint_does_not_count; a_ramp_below_the_reference_is_never_detected)

# text
# c1: jamming
# c2: jamming
seg-d097f485ef9e = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Taandamine olemasoleva <c1/> liigi häirekindluse võrrandile ja lingi eelarvele (sama kood, kutsutud samadel sisenditel) ning k T0 F müratasemeni kinnise kujuga vormile. Aluseks olevad signaalispektrid on ülalolev valideeritud rida; segajate võimsused, ajajoon ja sisendastme ribalaiused on stsenaariumi sisendid, spektrid on pidevad (ilma levikoodi joonteta) ning segajale ei mõju automaatne võimenduse juhtimine, blankimine ega antennimuster. Hoidlas ei ole mõõdetud segatud spektrit, mille vastu liitmudelit kontrollida. <c2/> liigi Q tabel (CW ja kitsaribaline { "1" }, laiaribaline ja pühitud { "2" } alates { "0.36" }: õpikuväärtused, kinnitatud navsignal kinnise kujuga vormidele) langeb kokku selle mudeli CW väärtusega ja erineb sellest, mille see tuletab C/A-le sobitatud müra ({ "1.5" }) ja ribasisese normaliseerimiseta lameda nullist-nullini müra ({ "2.2" }) jaoks; aruanne trükib mõlemad

# text
seg-06c475d7eb73 = spectrum (SpectrumScenario, SpectrumModel::bin_psd_w_per_hz, SpectrumModel::band_state, effective_cn0_multi_dbhz, system_temp_k, Jammer::power_fraction_in, Jammer::duty)

# text
seg-266d9c05d9be = spectrum::tests (agrees_with_the_jamming_kind_chain — J/S võrdne jamming::j_over_s_db-ga ja efektiivne C/N0 võrdne jamming::effective_cn0_dbhz-ga, Q = 1/(R_c kappa), täpsusega { "1e-9" } dB, ja jamming-liigi enda testi { "32.105" } dB ankur; noise_floor_is_kt0f; chirp_window_splits_whole_and_partial_sweeps; duty_weights_partial_rows; demo_scenario_runs_and_denies_l1_while_l5_survives; defaults_run_with_no_jammer; bad_inputs_are_refused)

# text
seg-821d327efdbf = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Mõõdetud JPL Horizons DE441 vastu (samad kommitiud fikstuurid), kuid mitte valideeritud: tabeli { "1" } öeldud näitajad Uraani ja Neptuuni jaoks ületatakse kuni { "2.0" } ja { "5.2" } korda DE441 heliotsentriliste asukohtade vastu (Neptuun täidab need barütsentriliste asukohtade vastu, mis viitab, et sobitus ei olnud heliotsentriline), leht ei esita Pluuto viga ja kiirustele ei ole avaldatud piiri. Tabelid 2a/2b täidavad oma näitajaid Uraani ja Neptuuni jaoks ning on kaetud valideeritud real

# text
seg-1d43f89b7a30 = ephem (standish_state, StandishElements::state_at_mean_anomaly, Planet::Pluto); solar_system (position_label)

# text
seg-1af48aec2408 = tests/solar_system_horizons_reference.rs (standish_table1_uranus_and_neptune_exceed_the_nominal_error: kinnitatud { "2.04" } ja { "5.16" } korda nominaalne pikkusviga, alla kuue korra; pluto_from_the_1992_row_is_measured_not_validated: { "39" } kaaresekundi ja { "1.14e9" } m piires; standish_velocities_track_horizons_to_one_percent: halvim { "3.7e-3" } kiirusest); ephem::tests (standish_velocity_is_the_derivative_of_the_position; pluto_has_no_table2_row_and_no_stated_error)

# text
seg-f17a412271b6 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Mõõdetud JPL Horizonsi satelliidiefemeriidide (DE441, MAR099, JUP365, SAT441) vastu, mis on kommitiud failis tests/fixtures/solar_system/horizons_satellites_icrf.csv koos päringu ja hankimiskuupäevaga; keskmistele elementidele ega pöördemudeli paigutusele ei ole avaldatud täpsust, seega kinnitatud läved tabavad regressioone ega valideeri. Keskmised elemendid jätavad välja resonantsed ja päikesehäired ning Phobose sekulaarset kiirendust ei modelleerita

# text
seg-de8a26ea4d61 = ephem (satellite_state, Satellite, SatelliteMethod, moon_icrf, moon_icrf_velocity); ephem_provider (AnalyticSolarSystem)

# text
seg-06601f6fb837 = tests/solar_system_horizons_reference.rs (moons_track_horizons_to_the_measured_angles: halvim planeedilt nähtav nurkviga vahemikus { "2000" } kuni { "2040" }, Phobos { "5.65" } kraadi, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganymede { "0.22" }, Callisto { "0.27" }, Titan { "3.31" }; geocentric_moon_tracks_horizons: { "0.046" } kraadi); ephem::tests (moons_sit_at_their_mean_distance_and_move_at_their_mean_speed); ephem_provider::tests (earth_and_moon_balance_about_their_barycentre)

# text
seg-d0dd931332c8 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Avaldatud konstantide ärakiri, igaüks tsiteeritud seal, kus see on defineeritud: gravitatsiooniparameetrid JPL Horizonsi kehakirjetest ja JPL satelliitide füüsikaliste parameetrite tabelist, raadiused JPL füüsikaliste parameetrite tabelitest (IAU WGCCRE { "2015" }), poolused ja nullmeridiaanid IAU kartograafiliste koordinaatide ja pöörlemiselementide töörühmalt (keskmised väärtused, ilma T-kiiruse ja perioodiliste liikmeteta), J2 allikatest Smith et al. { "2012" }, Iess et al. { "2018" } ja { "2019" } ning Jacobson { "2009" } ja { "2014" }. Kontrollitud sisemise kooskõla suhtes (Jupiteri pöörlemisperiood System III kiiruse vastu, iga J2 oma etalonraadiuse vastu), mitte välise sõltumatu etaloni vastu. { "0.30" } voor { "2" }: GM väärtused võeti üle failist gm_de440 ning Phobose ja Deimose elemendid failist pck00011, seega erinevad { "84" }-st lisatud neljateistkümne keha konstandist { "0" } nüüd NAIF-ist (varem { "12" }), mis on ärakirja kontroll ja mida ei loeta. { "0.36" }: IAU kehakinnine orientatsioon ja neljateistkümne lisatud keha GM on eraldatud oma VALIDATED reale („IAU body orientation and gravitational parameter of the fourteen added solar-system bodies“); see rida hoiab alles ülejäänu. J2 ja keskmine raadius on tsiteeritud, mitte valideeritud; aruandes olevad asukohad tuginevad oma ridadele; ja aruande prime_meridian_deg Maa, Kuu ja Marsi jaoks jääb tavapäraste konstantide peale (kuni { "6.6e-3" }, { "2.8e-2" } ja { "9.6e-4" } rad IAU_<BODY>-st). { "0.30" } redaktsioonid: Phobose GM { "7.087e5" } -> { "7.087546066894452e5" }, Deimose { "9.62e4" } -> { "9.615569648120313e4" }, Uraani { "5.7939506103e15" } -> { "5.793951256527211e15" }, Neptuuni { "6.83509997e15" } -> { "6.835103145462294e15" }, Pluuto { "8.69326e11" } -> { "8.696138177608748e11" } m³/s²; Phobose ekvatoriaalraadius { "13.1" } -> { "13.0" } km; prime_meridian_deg sisaldab nüüd ruut- ja perioodilisi liikmeid

# text
seg-24749f350eb2 = body (Body::by_name, Body::facts, Body::prime_meridian, SOLAR_SYSTEM, BodyFacts); solar_system (SolarSystemScenario, position_label)

# text
seg-a2ffe20b07aa = body::tests (every_catalogue_body_resolves_by_name_and_carries_its_record; a_zonal_field_is_referenced_to_its_sources_radius; retrograde_rotators_have_negative_rates_and_periods_match_the_iau_rate); solar_system::tests (defaults_report_all_eighteen_bodies_with_tracks; earth_heliocentric_distance_is_one_au_and_period_one_year; a_planet_track_closes_on_its_orbit_and_starts_at_the_epoch_position; moons_orbit_their_planets_at_their_mean_distance; pluto_outside_its_table_is_an_error_not_a_guess; every_emitted_number_has_a_unit); tests/body_constants_naif_oracle.rs::only_the_conventional_constants_of_other_rows_differ

# text
seg-d3a6bc01842e = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga vormid ja enesekooskõla: Kepleri kolmas seadus releeperioodi jaoks, orbiidi raadius ja pinnaraadius hoitud kogu käitamise vältel, mõõtmise lisamine ei suurenda kunagi formaalset määramatust ning algväärtustatud vead langevad kokku kovariatsiooniga. Releeorbiidid ignoreerivad kolmandaid kehasid (Jupiteri tõmmet Europa ümber olevatele releedele ei modelleerita), müra on Gaussi öeldud tasemetel ja mõõtmismudel on hetkeline, seega ei ole see valideeritud ühegi missiooni navigatsiooniandmete vastu

# text
seg-0de56af96b3e = body_pnt (BodyPntScenario, formal_sigma, fix_error); orbit (dop); batch_ls (gauss_newton); mars_pnt (chord_clears_sphere); mars_frame (bodyfixed_to_inertial)

# text
seg-92943f4850b5 = body_pnt::tests (relay_period_is_keplers_third_law_for_the_body; an_orbiter_keeps_its_radius_and_a_lander_sits_on_the_surface; the_earth_range_never_worsens_the_formal_uncertainty; seeded_fix_errors_are_consistent_with_the_formal_sigma: iga fiksi vea ruutkeskmine oma formaalse sigma kohta lõigus [{ "0.6" }, { "1.5" }]; earth_light_time_is_minutes_at_mars_and_the_run_is_deterministic; defaults_run_around_mars_and_every_number_has_a_unit)

# text
seg-d57372871f5e = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: toorjõu-kõrgusnurga skannimine, käsitsi arvutatud ja orbit::dop taandamised ning kinnise kujuga Walkeri ja geosünkroonse geomeetria. Kahekeha orbiidid valikulise sekulaarse J2-ga, kerakujuline keha kohaliku vertikaaliga piki raadiust, ainult geomeetriline nähtavus (ilma signaali võimsuse, satelliidi tervise, maastiku ega kolmanda keha häireta) ning süsteemide vaheline suhteline faas võetud eri etalonepohhidelt, seega ei ole see ühegi kuupäeva hetktõmmis. { "0.30" } ülevaade, leid (jääb MODELLED): eelseadistused täidavad avaldatud ühepoolsed DOP-i kättesaadavuse põhjad (BeiDou OS Performance Standard { "3.0" }, Galileo OS SDD) { "100" } % juures, kuid kui mootori PDOP kahekordistada kriipsukoopias, täidavad nad neid siiski (halvim punkt { "99.36" } %), seega ei suuda põhjad tuvastada isegi { "100" } % viga selles suuruses, mida see rida arvutab; nende pingutamine pärast käitamist oleks tagantjärele tolerants. Edutamine vajab DOP-väärtuste kahepoolset võrdlust identsel geomeetrial eelnevalt määratud tolerantsiga. { "0.30" } voor { "2" } (tests/coverage_dop_full_oracle.rs, eelregistreeritud add671d6), leid (jääb MODELLED): Orekit { "12.2" } asukohad, kõrgusnurk, asimuut ja maajäljed koos gnss_lib_py { "1.0.4" } GDOP/PDOP/HDOP/VDOP (ühine kell) ja numpy pöördmaatriksiga (üks kell konstellatsiooni kohta) langevad kokku igal lävel Galileo, GPS, BeiDou, Galileo+GPS (üks kell kummalgi) ja 1584-satelliidilisel Maa kavandil (DOP { "2e-14" } suhtelise piires, identne fiks, kättesaadavuse ja nähtavuse arvud). Kuu ja Marsi kavanditel langevad elemendid, asukohad, nähtavus ja rajad kokku, kuid DOP ületab eelnevalt määratud { "1e-9" } suhtelise läve lahtrites, mille suurim PDOP on { "1434" } või rohkem (kuni { "8e-6" }), ning { "4" } lahtrit erineb ühe fiksi epohhi võrra arvuliselt singulaarsel geomeetrial (mootori pivot { "1e-10" } numpy astme vastu), seega rida ei ole valideeritud. { "0.30" } redaktsioonid: TDOP/GDOP etalonkell on nüüd nähtaval oleva väikseima numbriga konstellatsioon (constellation-multi-gnss-coverage globaalne GDOP max { "2.2236" } -> { "2.1205" }, keskmine { "1.122" } -> { "1.131" }) ja konstellatsioonipõhised nähtavate arvud summeeritakse täisarvudena

# text
seg-17bf1df86b49 = constellation (coverage, ConstellationDesignScenario, beidou_slots, body_by_name)

# text
seg-4d15849bdf7c = constellation::tests (prefilter_matches_brute_force_exactly — iga kaart ja loendur võrdub otsese kõrgusnurga testiga skaneerimisega; five_thousand_satellites_on_a_coarse_grid — { "5 000" } satelliiti, trükib käitamisaja ja säilitatud paaritestid; a_clock_per_constellation_needs_one_more_satellite; beidou_geo_and_igso_geometry; lunar_shell_runs_around_the_moon; presets_are_earth_only_and_errors_are_clear; preset_counts); tests/constellation_availability_published_spec_oracle.rs::presets_meet_the_published_dop_availability (ainult regressioonikontroll); tests/coverage_dop_full_oracle.rs::finding_is_pinned; tests/coverage_dop_gnss_lib_py_oracle.rs (regressioon)

# text
seg-41b300bb888a = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Koostamise samasused samade liikide eraldiseisvate käitamiste vastu: ühefaasiline kampaania reprodutseerib eraldiseisva väljundi bitthaaval, kantud nihe võrdub eelmise käitamise enda viimase valimiga ja faas, mille lõpetas end_at, on pikkuselt täpselt käitamise tuvastamisaeg. Lisanduv kandmine üle faasipiiri ja nullijärku hoidmine on modelleerimisvalikud ning iga faas on nii hea kui liik, mis seda käitas; ühtki aheldatud missiooni ei ole mõõdetud omaga kontrollitud

# text
seg-fde8247097c3 = campaign (run_campaign_detailed, run_chain, presets, extract, to_svg)

# text
seg-d8d3a3893423 = tests/campaign_composition_reference.rs (a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit, a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit — liikme tulemus baidiidentne eraldiseisva käitamisega ja iga joondatud väärtus võrdne eraldiseisva reaga; the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection; a_handoff_writes_the_previous_phase_number_into_the_next_scenario; malformed_campaigns_fail_loudly)

# text
seg-fca7ec328ea6 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Faasi juhusliku kõnni kinnise kujuga vorm valge sagedusmüra korral, dispersioon q_wf tau (NIST Technical Note { "1337" }), statistikamasinavärgi jaoks ning baitide võrdsus eraldiseisvate käitamistega algväärtustamise jaoks. See kontrollib ansambli aritmeetikat mootori enda kellamudelil, mitte välisel andmestikul

# text
seg-59eda109a298 = campaign (run_sweep, run_monte_carlo, ensemble); sweep (GenericAxis, coords_of, set_dotted_value); inertial (metric_stat)

# text
seg-3b9aa486bb66 = tests/campaign_composition_reference.rs (a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run; the_ensemble_mean_and_spread_match_the_white_fm_closed_form — { "200" } algväärtust valge sagedusmüraga kella, mis hoiab tau = { "3010" } s: tõeline keskmine { "0" } teatatud intervalli sees, intervalli poollaius { "25" } % piires väärtusest { "1.96" } sigma/sqrt(n) ja valimidispersioon sigma = sqrt(q_wf tau) = { "16.459" } ns kahepoolse { "99" } % hii-ruut-intervalli sees; kalibreerimisansambel (CAP-10, eelregistreeritud ea451cb5, docs/CALIBRATION-ENSEMBLES.md, tests/calibration_ensembles.rs): { "200" } sõltumatu ansambli üle katab intervall tõelise keskmise { "192" }-l (Binomial({ "200" }, { "0.95" }) { "99" } % piirkonna [{ "181" }, { "197" }] sees) ja hii-ruut-kontroll läbib { "196" }-l, samal ajal kui ühe algväärtuse protsentiili tolerants (p05 ja p95 { "0.3" } sigma piires) läbib ainult { "183" }-l { "200" }-st, NOT MET eelregistreeritud { "190" } vastu, algväärtuse suhtes habras kontroll, mis on salvestatud, mitte lõdvendatud; a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number)

# text
seg-3dcca86d0869 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Koostamise samasus eraldiseisva käitamise vastu. Ühiste tingimuste aritmeetika on raamatupidamine; füüsika on liikmeliikide oma, igaühel oma rida

# text
seg-c0c2439ee1f6 = campaign (run_compose)

# text
seg-b238a6b2bbdd = tests/campaign_composition_reference.rs (a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number — ühe liikmega koostis loeb eraldiseisva arvu ja tulemuse räsi)

# text
seg-ef402841914e = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ainult sisemine: lingivõrrandi täpne -20 log10(range) kinnise kujuga vorm, sõltumatu toorjõuruudustik sama liigi üle ja Rosenbrocki funktsioon. Vooru { "1" } 1-D lävi on NOT MET (eelregistreeritud kast jättis { "3" } dB lahendi välja; optimeerija peatus piiril), salvestatud failis docs/design/evidence/cap32-optimize/RESULTS.md ja uuesti hindamata. Optimum on kasti ja alguspunkti suhtes lokaalne; globaalse optimumi väidet ei ole

# text
seg-a032de3144fe = campaign::optimize (run_optimize, nelder_mead)

# text
seg-94a984382eee = tests/campaign_optimize_reference.rs (eelregistreeritud fbe6c8b3 ja pärast vooru 1 protokollimööda 441f31bc: p2_prime_interior_target_range_matches_the_closed_form — 1-D sihtlahend { "6.1e-15" } piires väärtusest r* = r0 { "10" }^((m(r0) - { "3" })/20) { "96" } hindamisega; p3_prime_contour_target_grid_and_nelder_mead ja p3_grid_matches_brute_force_and_nelder_mead_does_at_least_as_well — ruudustikumeetodi parim bitthaaval võrdne sõltumatu { "41" } x { "41" } toorjõusilmusega üle run_toml, Nelder-Mead vähemalt sama hea { "177" } ja { "161" } hindamisega; p4_nelder_mead_reaches_the_corner_maximum; p5_the_document_is_byte_stable_and_counts_agree; p2_round1_not_met_the_box_excludes_the_closed_form, mis kinnitab salvestatud vooru 1 möödalaskmise); campaign::optimize::tests (nelder_mead_meets_the_preregistered_rosenbrock_bar: f* = { "1.7e-20" } { "234" } hindamisega; a_non_finite_score_is_never_the_best; the_grid_mapping_is_the_sweeps)

# text
seg-c235cf7a1f0d = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kahe ülaltoodud rea valideeritud kinnise kujuga vormid, ruutseaduse valehäire samasus P_d(snr = { "0" }) = P_fa ja Holmesi keskmine hõivamisaeg ning taandamine spektri liigi enda SSC ahelale (sama Jammer::ssc kood). Kavandid ise on sisendid: REPRESENTATIVE või WORKSHOP märgitud eelseadistused ei ole avaldatud spetsifikatsioonid, täiustatud Feheri QPSK, koodi nihkega võtmestus ja OFDM spektrid on ligikaudsed ning kujukontrollid võrdlevad kujusid, mitte kalibreeritud tasemeid.

# text
seg-a0c6fa7dbb46 = leo_signal (LeoSignalScenario, SignalDesign, Component, Shape, code_jitter_m, gabor_bandwidth_hz, detection_probability, threshold_for_pfa, mean_acquisition_time_s, ssc_leo_into_gnss, ssc_gnss_into_leo, jammer_tolerance, gnss_victim, preset, public_signal)

# text
seg-6d9eb1dc2a11 = leo_signal::tests (every_public_preset_parses_and_cites_a_url; detector_reduces_to_pfa_and_grows_with_snr; detection_probability_with_several_looks_matches_the_noncentral_chi_square; mean_time_of_a_perfect_detector_is_half_the_cells; compatibility_ssc_magnitudes_match_independent_quadrature; to_spectrum_band_is_consistent_with_the_design; jammer_tolerance_orders_cw_matched_wideband; e5_centred_signal_hits_e5a_and_e5b_equally; defaults_run_on_the_generic_band_preset; inline_signal_and_bad_inputs); tests/leo_signal_reference.rs (iga komplekteeritud süsteemineutraalne stsenaarium käitub ilma töötoa andmeteta, ribakompromissi ionosfääri suhted võrduvad (f_ref/f)^{ "2" } ja selle vabaruumi vahed { "20" } log10(f/f_ref), värin etalon-C/N0 juures jääb oma Gabori piiri ja piiramata riba vormi vahele, töötoa parameetrite stsenaariumi E5 kujukontrollid on kooskõlas, kui see fail on olemas, ning ükski lähtefail ei kompileeri seda faili sisse)

# text
seg-c83f81eb8726 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Taandamine olemasolevale spektriahelale ja jamming-liigi häirekindluse võrrandile (üheosaline riba annab samad arvud kui enne laiendust) ning valideeritud ridade signaalispektritele. Segajate võimsused, ajajoon, sisendastme ribalaiused ja kavandatud signaalid on sisendid ning kavandatud signaal kärbitakse oma edastusribal (ribavälist kiirgust ei ole).

# text
seg-e31094573516 = spectrum (Band::unit_psd, Band::tracked_power_dbw, BandDesign, BandCfg, PanelCfg, SpectrumScenario, Waveform, multi_band_svg); leo_signal (SignalDesign::to_spectrum_band)

# text
seg-17f462b8768d = tests/leo_signal_reference.rs (mitmeribaline joonlaiusdiagramm käitub nelja paneeliga, UHF-, L5-riba, S- ja C-segajad keelavad igaüks ainult oma riba ning tavalise riba käitamine on laiendusest muutumatu); leo_signal::tests::to_spectrum_band_is_consistent_with_the_design; spectrum::tests (agrees_with_the_jamming_kind_chain)

# text
seg-cee2cbdad6d6 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga vormid ja enesekooskõla: kauguse muutumise kiiruse ja kiirenduse samasused arvuliste tuletiste vastu, isovoo võimendus tühistab kauguse kasvu, õpikulised polarisatsioonikao piirjuhud, kvalitatiivne LEO-versus-GNSS vaatlus (kellukakujuline minutite pikkune ülelend, mis tõuseb mitu dB üle lameda 44-51 dB-Hz GNSS-kandjate). EIRP-d ja mustrid on avaldatud vastuvõetud võimsused, mis on pööratud EIRP-ks, või esinduslikud valikud, gaasiline liige on aegunud P.676-10 lihtsustatud meetod ja midagi ei võrrelda mõõdetud LEO C/N0-ga

# text
seg-8749534ecbbb = leo_pass (LeoPassScenario); leo_link::geometry (design_pass, link_geometry, numerical_check, SatMotion, UserMotion); leo_link::antenna; leo_link::itu (p676_gaseous_attenuation_db); leo_link (system_noise_temperature_k, cn0_dbhz)

# text
seg-eec596b8749d = leo_pass::tests (the_leo_pass_is_a_bell_above_flat_gnss; closed_form_doppler_agrees_with_the_numerical_derivative: alla { "0.01" } Hz ja { "0.01" } Hz/s; indoor_uhf_suffers_less_building_loss_than_c_band; rain_attenuates_c_band_more_than_s_band; iono_delay_scales_as_one_over_f_squared_across_bands; a_fully_custom_band_needs_no_preset; a_walker_constellation_and_a_tle_satellite_both_run; defaults_run_with_no_preset_named_and_every_number_has_a_unit); leo_link::geometry::tests (kepler_velocity_is_the_derivative_of_the_position; a_designed_pass_reaches_the_requested_elevation; closed_form_range_rate_and_accel_match_central_differences_for_two_body_motion); leo_link::antenna::tests

# text
seg-d9e965c108ea = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Tsiteeritud avalike näitajate ärakiri ja kooskõlakontroll: avaldatud minimaalsest vastuvõetud võimsusest seatud EIRP ennustab avaldatud maksimumi { "0.5" } dB piires lameda mustriga. See on kauguse hajuvuse kontroll, mitte ühegi satelliidi antenni valideerimine; esinduslikud eelseadistused ei esita väidet tegeliku süsteemi kohta

# text
seg-a6cfe1d09891 = leo_link::presets (SystemPreset, BandPreset, all, by_id, gnss_meo); leo_pass (resolve_bands)

# text
seg-09ebe92cc5c1 = leo_link::presets::tests (every_preset_is_sourced_and_self_consistent; only_the_celeste_preset_is_sourced_from_the_workshop); leo_link::presets::xona_pulsar::tests (the_eirps_reproduce_the_published_minimum_power_at_ten_degrees; a_flat_pattern_lands_the_zenith_power_near_the_published_maximum: { "0.5" } dB piires väärtustest -139.1 ja -136.2 dBW); leo_link::presets::iridium::tests; leo_pass::tests (a_fully_custom_band_needs_no_preset)

# text
seg-cfa2e7e53eed = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Öeldud kavandimudeli sisemine kooskõla: iga võimsus, lävi ja otsinguvalik on sisend ning mudel ignoreerib bitiääre mitmetähenduslikkust, tuvastamata jäänud sündmust ja uuesti hõivamist. Ei ole võrreldud mõõdetud vastuvõtjaga

# text
seg-8c33a02f0aa9 = leo_link::energy (fix_budget, duty_curve, IotReceiver, IotSignal); leo_pass (iot_section)

# text
seg-981819c1af62 = leo_link::energy::tests (stronger_signals_and_smaller_doppler_windows_fix_faster; the_doppler_rate_caps_the_coherent_time; battery_life_grows_with_the_fix_interval_toward_the_sleep_floor); leo_pass::tests (the_run_is_deterministic_and_bad_inputs_are_rejected)

# text
seg-d8b2e149d5cf = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla (hüppe samasus ja koonuse piir toorjõuvalimi vastu). Lävi on sisend; avaldatud LEO pidevusnõuet ei ole kinnitatud

# text
seg-a8d152bb385d = leo_navmsg (LeoNavmsgScenario::midpass, worst_case_jump, elevation, geodetic_to_ecef)

# text
seg-af0e339c4fae = leo_navmsg::tests::a_mid_pass_update_is_continuous (iga ümberlülituse kauguse hüpe võrdub kauguse vea muutusega ja parandatud { "300" } s sobitus, mida uuendatakse iga { "150" } s järel, läbib { "5" } cm läve); leo_navmsg::tests::a_keplerian_only_update_over_a_long_interval_is_flagged; leo_navmsg::tests::worst_case_jump_bounds_every_line_of_sight (kinnise kujuga vorm piirab koonuse tihedat valimit)

# text
seg-bae9c4665c45 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Edasi-tagasi samasused ja eelarve ise. Formaat on Kshana enda, modelleeritud avaldatud sõnumikomponentide ja Galileo ICD väljakomplekti põhjal; see ei ole Celeste'i ega ühegi teise süsteemi bitipaigutus (ükski ei ole avalik), seega ei ole välist paigutust, mille vastu valideerida

# text
seg-d8d04f2ffd50 = leo_navmsg::codec (encode, decode, write_payload, read_payload, field_table, quantisation_budget)

# text
seg-4040a549f1c1 = leo_navmsg::codec::tests (signed_fields_round_trip_through_the_bit_packer; week8_resolves_near_the_reference); leo_navmsg::tests::every_model_round_trips_through_the_binary_frame (iga mudel { "2" } mm piires täpsest sõnumist pärast dekodeerimist, uuesti kodeerimine bitthaaval identne, ümberpööratud bitt lükatud CRC-ga tagasi); leo_navmsg::tests::every_field_of_the_budget_stays_under_a_millimetre

# text
seg-2fe510f389d1 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Edasi-tagasi teisendused ja kalendriaritmeetika. RINEX { "4.02" } ei määratle LEO navigatsioonikirjeid (IGS RINEX { "4.02" }), seega on paigutus dokumenteeritud laiendus, mille eelkäijana on viidatud arXiv { "2401.17767" }; selle välist lugejat, mille vastu kontrollida, ei ole

# text
seg-a6f36f62a02d = leo_navmsg::text (rinex_export, rinex_import, csv_export, csv_import, calendar, from_calendar)

# text
seg-14ee5fa96ce7 = leo_navmsg::text::tests (calendar_round_trips_and_knows_the_gps_origin; d19_is_rinex_shaped); leo_navmsg::tests::rinex_and_csv_round_trips (iga mudel { "0.1" } mm piires pärast tekstiplokki, CSV täpne)

# text
seg-9c1e46397382 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — ATOMIC mudeli faktid InsideGNSS-ist (6. järku polünoom, umbes üks minut kehtivust, { "30" } s värskendus, kell juhitud, { "24" } cm kellaviga). Need on kirjeldavad faktid, millel ei ole avaldatud numbreid, millega võrrelda. Viie kõrguse tabel trükib Liu et al. { "2025" } SISRE ({ "8.88" }, { "6.21" }, { "2.87" }, { "2.11" } ja { "0.75" } cm kõrgustel { "320" }, { "475" }, { "786" }, { "966" } ja { "1336" } km 20-minutilisel kaarel) kõrvuti Kshana sobitusega selle enda integreeritud orbiidil ({ "4.25" }, { "2.87" }, { "2.20" }, { "1.25" } ja { "0.51" } cm; suhted { "0.46" } kuni { "0.77" }), kinnitamata, sest artikkel sobitas päris täppisorbiite ja tõed erinevad. 22-parameetriline mudel ja sobitus ise on päris orbiitide vastu valideeritud real Liu et al. { "2025" } 22-parameetriline LEO efemeriidimudel ja selle sobitus päris täppisorbiitidel. { "0.30" } redaktsioon: tabeli näitajad liikusid artikli kokkuleppe sobitusega (GRACE-A { "5.40" } -> { "4.25" } cm, GRACE-C { "4.12" } -> { "2.87" }, Sentinel-2A { "2.95" } -> { "2.20" }, HY-2A { "2.38" } -> { "1.25" }, Sentinel-6A { "0.70" } -> { "0.51" })

# text
seg-3f5b07cc8c81 = leo_navmsg::elements (EcefPoly, ephemeris_at); leo_navmsg (liu_comparison, LIU2025_TABLE)

# text
seg-1ffa5a792c36 = leo_navmsg::tests::liu22_beats_the_16_parameter_set_over_a_20_minute_arc; leo_navmsg::tests::the_ecef_polynomial_fits_a_minute_to_millimetres; leo_navmsg::tests::every_preset_resolves_and_the_atomic_preset_selects_the_zero_clock_polynomial

# text
seg-3adf09cf2ed5 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: müravaba taastamine, kinemaatiline samasus rho_ddot = (|v|^{ "2" } - rho_dot^{ "2" } + d.a)/rho arvuliselt diferentseeritud, Doppleri nullpunkt lähimal lähenemisel, ühe ülelennu peegellahend ja algväärtustatud vead formaalse kovariatsiooni vastu. Kozhaya, Saroufimi ja Kassase Starlinki näitaja (NAVIGATION { "72" }({ "1" }), { "2025" }: umbes { "2" } m { "20" } s jooksul kolme satelliidiga) on ainult võrdlus: modelleeritud vastuvõtja täiusliku efemeriidi ja iga veaga { "30" } Hz Doppleri sigmas on samal aknal mitu korda vähem täpne ning artikli vastuvõtjat ja mõõtmiskiirust ei reprodutseerita

# text
seg-fc9c5d5b1511 = leo_fusion::doppler (solve, formal_covariance, single_pass_geometry, offset_site, closest_approach); leo_fusion::pvt_kind (run_doppler)

# text
seg-6cb8d56c57d6 = leo_fusion::doppler::tests (range_acceleration_obeys_the_kinematic_identity_and_vanishes_doppler_at_closest_approach; noise_free_multi_satellite_doppler_recovers_the_user: täpsusega { "1" } mm ja triiv täpsusega { "1e-6" } m/s; a_single_pass_has_a_mirror_solution_across_the_ground_track; the_cross_track_error_grows_as_the_pass_goes_overhead; velocity_states_are_recovered_for_a_moving_user); leo_fusion::pvt_kind::tests (doppler_positioning_improves_with_the_window_and_is_deterministic: kaalutud jääkide RMS lõigus [{ "0.8" }, { "1.2" }] ja viga alla nelja formaalse sigma); tests/leo_fusion_scenarios.rs (leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead; starlink_doppler_only_mode_runs_without_ranging); tests/starlink_doppler_published_proxy.rs (eelregistreeritud asendaja avaldatud andmekogumi 3 protsentiilide vastu väljaandest „Unveiling Starlink for PNT“, doi:10.33012/navi.685: { "3" } satelliidiga ({ "47" } kraadi mask), ilma kõrgustoeta ja { "30" } Hz juures on p90 3-D viga { "92.2" } m { "20" } s juures ja { "870" } m { "8" } s juures avaldatud { "2" } m ja { "10" } m vastu, seega on mõlemad teguri-kaks läved NOT MET, kõrgemal poolel, ja kinnitatud möödalaskmisena; docs/design/evidence/cap11-starlink-doppler-proxy/)

# text
seg-54aea757feb2 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Käsitsi tuletatud nelja satelliidi DOP (üks satelliit seniidis ja kolm horisondil { "120" } kraadi vahega, mille normaalmaatriks pöördub käsitsi), struktuurne samasus, et oma kellaga süsteem ja üks satelliit ei lisa geomeetriat, müravaba asukoha, kella ja nihke taastamine ning algväärtustatud vead kovariatsiooni vastu. Ainult sisemised kontrollid; ei ole võrreldud vastuvõtja väljundiga. { "0.30" } väline võrdlus, leid (jääb MODELLED): mitme GNSS-iga IGS-i päeval (ABMF 2018-05-13, GPS ja Galileo C1C, edastatud efemeriid, Klobuchar) langeb süsteemidevaheline nihe kokku RTKLIB v2.4.2-p13 rnx2rtkp-ga (mediaanvahe -0.11 ns pärast { "0.30" } edastatud rühmaviivituse parandust, -0.35 ns enne; lävi { "1" } ns), kuid ainult { "93.6" } % { "280" } epohhist ({ "93.2" } % enne parandust) on ITRF2020 koordinaadist { "3" } m piires eelregistreeritud { "95" } % vastu. RTKLIB ise saavutab samadel andmetel { "88.2" } %, seega on lävi sellest jaamast ja päevast ühesageduslikule edastatud positsioneerimisele kättesaamatu, mitte lahendaja lahknevus; võrdlustest on kommitiud ignoreeritult. { "0.30" } voor { "2" }, rangemad sisendid muutmata { "3" } m / { "95" } % / { "1" } ns lävel, leid (jääb MODELLED): Galileo E1/E5a ionosfäärivaba paariga (eelregistreeritud { "6927e039" }) on { "79.9" } % epohhidest { "3" } m piires (RTKLIB { "67.9" } %); täppis-CODE MGEX orbiitide, kellade, satelliidiantenni nihete ja koodinihetega (eelregistreeritud 7d8c3597) { "94.2" } % (RTKLIB { "94.1" } %) ning süsteemidevaheline nihe erineb RTKLIB-ist -1.03 ns, sest RTKLIB-i üksikrežiim ignoreerib satelliidiantenni nihkeid (+{ "0.04" } ns, kui mõlemad need välja jätavad)

# text
seg-95f8dcd6247e = leo_fusion::joint_pvt (solve, dop, code_sigma_dll_m, SystemClock); leo_fusion::system (SystemCfg, System); leo_fusion::pvt_kind (run_joint)

# text
seg-7a8b0b7b8a37 = leo_fusion::joint_pvt::tests (dop_matches_the_hand_derived_zenith_plus_three_horizon_case: HDOP = VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3), GDOP = sqrt({ "3" }) täpsusega { "1e-9" }; a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does; a_noise_free_fix_recovers_position_clock_and_inter_system_bias; seeded_fixes_agree_with_their_formal_covariance; dll_noise_is_the_textbook_figure_for_gps_l1_ca); leo_fusion::pvt_kind::tests (fusing_leo_never_worsens_the_median_pdop_and_the_isb_is_recovered); tests/leo_fusion_scenarios.rs (meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias); tests/joint_pvt_dual_freq_itrf_rtklib_oracle.rs::dual_frequency_finding_is_pinned; tests/joint_pvt_precise_itrf_rtklib_oracle.rs::precise_product_finding_is_pinned

# text
seg-e86eb864ba1a = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — NEES-i hii-ruut-test on sisemine kooskõlakontroll (tõde ja filter jagavad mudelit). Trendi võrreldakse artikliga Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: mitme GNSS-i { "9.6" } min lüheneb väärtusteni { "7.0" }, { "3.2" }, { "2.1" } ja { "1.3" } min { "60" }, { "96" }, { "192" } ja { "288" } LEO satelliidiga. Komplekteeritud stsenaarium annab { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } ja { "2.3" } min oma esinduslike { "1000" } km, { "60" } kraadi kihtide, müra ja jaamadega; artikli konstellatsioone, müra ja koondumise definitsiooni ei reprodutseerita, seega on see trendi MODELLED kooskõla (monotoonne lühenemine, suurim konstellatsioon alla kolmandiku ainult GNSS-i ajast), mitte valideerimine

# text
seg-d98c7b399230 = leo_fusion::ppp (run, PppScenario, LI_2019)

# text
seg-51a43af7f6b5 = leo_fusion::ppp::tests (the_filter_is_consistent_over_monte_carlo_seeds: { "24" } algväärtust, käitamiste keskmine NEES-i keskmine lõigus [{ "2.4" }, { "3.6" }] ja vähemalt { "75" } % epohhidest kahepoolse { "95" } % hii-ruut-riba sees; mõõdetud { "150" } algväärtusega, keskmine { "2.84" } ainult GNSS-iga ja { "2.87" } LEO-ga; leo_augmentation_shortens_convergence; same_seed_same_answer_and_every_number_has_a_unit); tests/leo_fusion_scenarios.rs (ppp_convergence_of_the_bundled_scenario_shortens_monotonically)

# text
seg-91df984eb133 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla: avaldatud nihkeavaldis käsitsi hinnatud, normeeritud viga { "40" } algväärtuse üle ja nihke määramatusest tulenev põhi. NIST-i näitaja Iridiumi ajastusvastuvõtjatele miniatuurse aatomkellaga (alla { "40" } ns UTC(NIST)-st { "40" } päeva jooksul) on ainult võrdlus; komplekteeritud Iridiumi stsenaarium annab nimivõimsusel { "10" } kuni { "11" } ns RMS-i oma esindusliku { "5" } m kaugusveaga. Flicker-sagedusmüra ja ionosfääriviivitust ei simuleerita

# text
seg-c42e3bd4a4c1 = leo_fusion::timing (simulate, utc_offset_s, system_to_utc_s); leo_fusion::pvt_kind (run_timing)

# text
seg-061a0510c35c = leo_fusion::timing::tests (the_utc_offset_follows_the_is_gps_200_expression; continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time; the_filter_is_consistent_over_seeds; the_utc_offset_uncertainty_sets_a_floor); tests/leo_fusion_scenarios.rs (leo_timing_error_grows_as_the_c_n0_falls)

# text
seg-7472a819bf01 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Tsiteeritud avalike väärtuste ärakiri, kontrollitud struktuuri suhtes (igal avalikul allikal on URL, Walkeri mustrid jaguvad ühtlaselt, C/N0 vastuvõetud võimsusest üle kT temperatuuril { "290" } K), mitte välise sõltumatu etaloni vastu. Esindusväärtused on nimetatud igas eelseadistuses ja on illustratiivsed

# text
seg-16fa5fabfb50 = leo_fusion::presets (all, by_id, cn0_range_dbhz, noise_density_dbw_hz); leo_fusion::system (SystemCfg::build)

# text
seg-df22b3cb00fa = leo_fusion::presets::tests (every_preset_has_a_source_and_every_public_source_a_url; only_one_preset_uses_workshop_material; noise_density_at_290_k_is_minus_204_dbw_per_hz); tests/workshop_preset_isolation.rs (only_the_listed_files_name_the_workshop_preset; workshop_numbers_live_only_in_the_preset_file_and_its_scenarios: src-, scenarios- ja tests-kataloogide lähtetekstiskannimised); leo_fusion::system::tests (a_preset_fills_what_the_scenario_leaves_out; a_system_needs_no_preset; pseudorange_sigma_falls_with_elevation_and_never_below_the_sisre)

# text
seg-2e45cedea59a = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Üleandmiste enesekooskõla: iga edasi antud väärtus võrdub ülesvoolu etapi enda väljundiga ning ülesvoolu sisendi muutmine liigutab iga sellest sõltuvat allavoolu näitajat. Etapid säilitavad oma sildid; ahel ei lisa füüsikat ega välist sõltumatut etaloni

# text
seg-6478ad7d09eb = leo_pnt_chain (LeoPntChainScenario); leo_pass (BandCfg::signal, design_tracking); leo_navmsg (LeoNavmsgScenario::broadcast_sisre); leo_fusion::pvt_kind; leo_fusion::ppp

# text
seg-02ef52ba69f0 = leo_pnt_chain::tests (a_sine_line_fit_recovers_its_line); tests/leo_pnt_chain.rs (every_upstream_change_moves_the_downstream_figures: tugevam EIRP, pikem sobitusintervall ja suurem orbiidi määramise liige liigutavad igaüks edasi antud väärtust ja liidetud fiksi; the_handed_on_values_are_the_stage_outputs; a_band_design_splits_the_eirp_and_reports_the_design_jitter; the_pass_export_reproduces_the_engine_range)

# text
seg-7d9265f54059 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga vormid ja samasused, mitte väline mõõtmine: kauguse muutumise kiiruse gradient keskmise vahe vastu, infovormi statistik tiheda kovariatsioonivormi vastu, puhas kellatriiv annab nulli, eelnevalt seletatud tõuge annab kõige rohkem |dx|^2/sigma_p^{ "2" }, statistik on hüppe suhtes ruutfunktsioon. Ühtki tuvastusnäitajat ei võrrelda mõõdetud rünnakuga; spuuferi on idealiseeritud (ilma võimsuse, saabumisnurga ega korrelatsioonitipu signatuurita)

# text
seg-4070df5af5e4 = leo_link::spoof (range_rate_position_gradient, line_of_sight, fll_frequency_jitter_hz, doppler_consistency_window, doppler_consistency); leo_pass (SpooferCfg, spoof_section)

# text
seg-0a123a80693f = leo_link::spoof::tests (the_gradient_is_the_derivative_of_the_range_rate; fll_jitter_matches_the_formula_by_hand; a_common_mode_residual_is_a_clock_drift_and_is_not_detected; with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean; a_push_the_prior_explains_is_not_detected; a_velocity_push_is_hidden_by_a_loose_velocity_prior_only; the_information_form_equals_the_covariance_form); tests/leo_resilience_verticals.rs (the_monitors_are_silent_before_the_onset; the_doppler_statistic_is_quadratic_in_the_jump; leo_range_rates_see_a_jump_that_gnss_range_rates_do_not)

# text
seg-38269e21c514 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Samasused: ionosfäärivaba spuuferi alguse aste võrdub paari modelleeritud ionosfääriviivituse vahega, lävi on kahepoolne normaaljaotuse kvantiil korrutatud astme standardhälbega pluss kiiruse piir. Vastuvõtja ionosfäärimudel on mootori oma, seega on autentne jääk konstruktsiooni järgi keskmiselt null; välist sõltumatut etaloni ei ole

# text
seg-8fbcf1ccbe16 = leo_link::spoof (cross_band_step); leo_pass (spoof_section: pairs, cross_band)

# text
seg-aa91bdc483b1 = leo_link::spoof::tests (the_cross_band_threshold_and_power); tests/leo_resilience_verticals.rs (a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not; a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset; the_monitors_are_silent_before_the_onset)

# text
seg-3deb19ed1dc7 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Esimest järku dispersioonisamasus, konstruktsiooni järgi täpne mootori enda esimest järku viivituse vastu (mille 1/f^{ "2" } skaleerimine on VALIDATED IS-GPS-200 vastu oma real); korduvtäpsus on ainult termiline koodimüra, ilma mitmeteelevi ega sagedustevaheliste nihketeta. { "0.30" } voor { "2" }, mõõdetud (eelregistreeritud 5e795f93), leid (jääb MODELLED): CODE globaalne ionosfäärikaart CODG1330.18I ABMF C1C/C2W koodi vastu CODE nihetega annab { "33" } { "36" }-st kaarekeskmisest { "3" } TECU piires (halvim +{ "6.84" } TECU õhtusel kaarel; epohhipõhine RMS { "3.95" } TECU), võrreldes läviga iga kaare kohta; ei ole valideeritud

# text
seg-b91ca5a2bd9c = leo_pass (IonoFreePair::geometry_free_stec_tecu, geometry_free_stec_sigma_tecu); leo_link::iono::geometry_free_stec_tecu

# text
seg-5d00a19cfac2 = tests/leo_resilience_verticals.rs (the_geometry_free_tec_is_the_pass_slant_tec: võrdub ülelennu kaldus TEC-iga tipus täpsusega { "1e-9" } ja selle sigma võrdub koodimüra RSS-iga üle { "40.3" } (1/f1^{ "2" } - 1/f2^{ "2" })); tests/geometry_free_tec_gim_oracle.rs::geometry_free_finding_is_pinned

# text
seg-6c6a0c044754 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Teostus spetsifikatsiooni vastu, MITTE väline sõltumatu etalon: puhta ruumi (clean-room) Pythoni uusteostus (scripts/maritime_score_cleanroom.py), mille kirjutas lugeja, kellele anti ainult docs/RECEIVER-TRUST.md ja docs/MARITIME-TRUST.md, mitte Rusti lähtekood, langeb score_from_ratios-iga kokku { "600" } suhtevektoril (skoor, riba, punktid ja mahaarvamiste järjestus, vahe { "0" }), pärast seda kui dokumentatsioon täiendati seal, kus esimene lugeja leidis selle vaikiva või vastuolulisena (võrdsuse järjestus, ümardamine, läbimise-või-ebaõnnestumise monitori suhe, kaks näidet, mille arvud ei sobinud valemiga). See näitab, et dokumentatsioon on piisav ja kood teeb seda, mida ta ütleb. MIDA EI KONTROLLITA ja miks rida jääb MODELLED: reegel ise (kaalud, rambi, riba servad, tõendi hoidmine) on selle projekti enda, eelregistreeritud, kuid ilma välise allikata, ning siin ei näita miski, et skoor { "80" } või { "40" } tähendab seda, mida navigaator tahaks sellelt päris häire korral tähendavat; sellist näitajat ei anta. Monitoride läved on samamoodi selle projekti enda (rida A kontrollib ainult nende aritmeetikat).

# text
seg-aa2667aa0296 = receiver_trust (score, monitors, live)

# text
seg-58fcb2ec63c5 = tests/maritime_trust_reference.rs::t5_score_matches_the_clean_room_reading_of_the_documented_rule; receiver_trust::score::tests (monotoonne iga statistiku suhtes, monitori lisamine ei tõsta kunagi skoori, terved statistikud jäävad väärtusele { "100" })

# text
seg-26753cc49103 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — MIDA KONTROLLITAKSE: selle crate'i enda täpse stringi testid dokumenteeritud LEEF-i väljakaardistuse ja RFC { "5424" } ümbriku väljade kohta; hooldatavat avatud lähtekoodiga LEEF-i sõelujat ei ole (Pythoni paketiindeksi otsing ei leidnud ühtegi), seega kontrollitakse formaati oma spetsifikatsiooni vastu, mida luges sama autor, mitte välise sõltumatu etaloni vastu. MIDA EI: kas mõne tarnija sõelur või SIEM aktsepteerib LEEF-i andmekoormusi; dokumenteeritutest kaugemad paomärkide reeglid; päris syslog-kogujate käitumine.

# text
seg-7adaa23ce920 = telemetry (syslog: leef, rfc5424, SyslogSink; time)

# text
seg-fe08580cd8d3 = telemetry::syslog::tests (täpsed LEEF-i stringid, paomärgid, tõsidus, RFC { "5424" } ümbrik, edastuse ajalõpud ja taasühendamine); tests/telemetry_cli.rs

# text
seg-3b7d744f5fd2 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Andmestiku avaldatud sündmuslogid (attack_log aknad) sündmuse tõena eelregistreeringu xval/jammertest-trust/PREREGISTRATION.md all (kommitiud eraldi, 0fa012b, enne kui testkoormus käis). Esimene ja ainus käitamine (xval/jammertest-trust/RESULTS.md): { "14" } { "24" }-st kaustast hinnatavad ({ "7" } segamisega), { "3,502" } puhast ja { "9,560" } segamisepohhi. Kõrvalejäetud puhas valehäire tõenäosus: cn0_drop_db { "0.0231" } (81/3502) võrreldes { "0.02" } läviga, FAIL; agc_k_sigma { "0.0003" }, läbib; jam_ind_threshold { "0.0094" }, läbib; kolme liit: valehäired { "0.0328" }, tuvastamine { "0.807" } võrreldes väärtustega { "0.05" } ja { "0.50" }, läbib. Registreeritud reegli järgi on rida MODELLED (üks lävi ebaõnnestus). Kitsas: üks vastuvõtjatüüp (u-blox ZED-F9P), üks sündmus, ajastatud üheminutilised pesad tõena (tuvastamine on alampiir; puhas tähendab logitud akendest väljas); kalibreeritud CSV-logidel ja UBX-lugeja annab kahes kaustas rohkem valehäireid. Merenduse usaldusskoori ribasid ei ole kalibreeritud

# text
seg-3b0543727850 = receiver_trust::calibration (run_dataset); receiver_trust::monitors (MonitorConfig::profile, JAMMERTEST_2024_CALIBRATED); realdata::jammertest; examples/jammertest_trust_calibration.rs

# text
seg-1a452a47b9d0 = tests/receiver_trust_jammertest_calibration.rs::the_recorded_calibration_reproduces (ignoreeritud, andmetega väravdatud KSHANA_JAMMERTEST_DIR kaudu: salvestatud valik, kõrvalejäetud arvud, läviotsused ja otsus); receiver_trust::calibration::tests (ajatemplid, akende sidumine ja ajavööndi nihe, sildid, kaitseribad, väljaarvamine, valik); receiver_trust::monitors::tests::threshold_profile_is_opt_in

# text
seg-b0810b04ec30 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Plaani pesade arvud testipiirkonna kohta ({ "76" }, { "77" } ja { "45" } pesa, millest { "61" }, { "63" } ja { "32" } edastavad) loendati sõltumatult skriptiga üle sama JSON-i; { "2024" } andmestiku attack_log aknad sündmuse tõena eelregistreeringu xval/jammertest-score/PREREGISTRATION.md all (kommitiud eraldi, c2e6d3b, enne kui hindaja käis). Esimene ja ainus käitamine (xval/jammertest-score/RESULTS.md): registreeritud minimaalse andmehulga reegel EBAÕNNESTUS ({ "4" } hinnatavat segamisakent { "4" } { "12" }-st UBX-kaustast võrreldes miinimumiga { "10" } akent { "2" } kaustast: { "5" } kausta jäeti lähtetaseme reegli järgi välja, { "3" } UBX-logi kannavad ainult GPS-i nädala aega), seega lävesid B1 kuni B4 ei saa hinnata; midagi ei lõdvendatud ega käitatud uuesti. v2 (xval/jammertest-score/PREREGISTRATION-v2.md, kommitiud eraldi, ainult andmetöötlus: ainult GPS-aja logid paigutatud kuupäeva järgi, { "12" } ainult CSV-kausta, liikuva platvormi seanss liikuvate roverite jaoks; samad läved ja minimaalse andmehulga reegel): { "14" } { "24" }-st kaustast säilitati, kuid { "7" } hinnatavat segamisakent, minimaalse andmehulga reegel ebaõnnestus jälle, ühtki lävendit ei saa hinnata (RESULTS-v2.md). Ajastatud tõde: planeeritud pesa ei ole eetrikirje, möödalask võib olla test, mida ei käitatud kunagi, latentsus on planeeritud algusest ja puhas tähendab planeeritud pesadest väljas. Mõõtmisvaldkonna monitoride tuvastamine ei ütle midagi väikese võimsusega spuuferi kohta. Üks vastuvõtjatüüp (u-blox ZED-F9P). { "2025" } SimulaMet NMEA andmestikku ei kasutata (öeldud litsentsi pole, tellimusega piiratud)

# text
seg-bf0fa5e2343c = jammertest::plan (parse_catalog, parse_plan, import, import_attack_log, events_toml); jammertest::score (score_run); jammertest::dataset (run_dataset); jammertest (score_log, score_pack); examples/jammertest_score_2024.rs

# text
seg-cf2f1a572c34 = tests/jammertest_plan_roundtrip.rs (andmetega väravdatud KSHANA_JAMMERTEST_PLAN_DIR kaudu: { "2025" } plaani pesade arvud testipiirkonna kohta, kataloogi id-d, TOML-i edasi-tagasi teisendus); tests/jammertest_score.rs (sünteetiline logi teadaoleva langusega: tuvastatud, möödalastud, hindamatu, valehäire käitus, allkirjastatud pakett, mis kannab tulemuskaarti); jammertest::plan::tests; tests/jammertest_score_2024.rs (andmetega väravdatud KSHANA_JAMMERTEST_DIR kaudu: salvestatud käitamine)

# text
seg-c70f3f97d479 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Viited kontrollitud skriptiga ekstraheeritud pealkirjaindeksi vastu tsiteeritud avalikest dokumentidest, mis loeti 2026-10-10 (tests/compliance_references.rs). MIDA KONTROLLITAKSE: { "49" } tsiteeritud klausli-, jaotise-, lõigu- või pealkirjaviidet on tsiteeritud dokumendis olemas ja { "7" } tsiteeritud URL-i lahenesid salvestatud kuupäeval ({ "2" } teise marsruudi kaudu); negatiivsed kontrollid ebaõnnestuvad. MIDA EI: et mõni parafraas, vastendus või lünk on õige; EN { "16803" } klauslid (tasuline, ainult kataloogitekst); hilisemad redaktsioonid; indeks ei ole sõltumatu teostus.

# text
seg-bf1156de0226 = compliance

# text
seg-af47f52e5c9e = tests/compliance_report.rs::mapping_is_well_formed; tests/compliance_report.rs::wording_rule_holds_in_mapping_report_and_docs; tests/compliance_report.rs::empty_set_evidences_nothing; tests/compliance_report.rs::statuses_follow_the_runs_present; tests/compliance_references.rs

# text
seg-ce743c3eca62 = IntegrationRun

# text
seg-1729005fdd5c = kasutatud päris hostrakenduse vastu; integratsioonikäitamine ei ole sõltumatu etalon — MIDA KONTROLLITAKSE, kitsalt öeldes: et need integratsioonid töötavad päris tarkvaraga, mille jaoks need on kirjutatud. TÕEND on kommitiud failides integrations/signalk/evidence/README.md (koos selle JSON-failidega) ja integrations/opencpn/evidence/README.md (koos selle ekraanipiltide ja logidega), igaühel koos skriptiga, mis seda reprodutseerib. ({ "1" }) Signal K: plugin laaditi kinnitatud signalk-server { "2.33.0" } npm-paketti, privaatses ainult loopback-võrgu nimeruumis, söötes sünteetilisi andmeid. Serveri enda REST- ja WebSocket-liidesed näitasid avaldatud teid, skoori metaandmeid ja teavitust, mis läks absent, warn, alarm, normal (pärast hoidmist) ja jälle warn, kui andmed lõppesid. Päris kshana käitamisel pluginaga NMEA-l, mille server ise sai, läks teavitus warn ja siis alarm ning teatatud asukoht avaldati; serveri enda navigation.position kirjutas selle NMEA pakkuja, mitte kunagi plugin. Uuesti käitatud elava JSON-skeemi { "1.2" } vastu. ({ "2" }) OpenCPN: plugin ehitatud OpenCPN plugina API päise ja wxWidgets { "3.2.4" } vastu, laaditud OpenCPN { "5.8.4" } Ubuntu { "24.04" } paketti virtuaalekraani all; OpenCPN laadis selle, käivitas selle initsialiseerimise ja andis sellele värava voo PKSHT-laused ning paneel muutus punaseks usaldamatu riba peal. Ühel puhtal käitamisel lõpetas OpenCPN-i enda laeva asukoht uuenemise ja selle fiksi indikaator langes, kui värav märkis fiksi kehtetuks. Teine käitamine, mida toitis otse värava TCP-kuulaja, näitas kohaletoimetamist pluginale, kuid mitte puhast enne-ja-pärast võrdlust. ({ "3" }) Relee testid taasesitavad värava voo salvestatud katkendi päris TCP-sokli kaudu ja kontrollivad, mida tarbija saab (baidid muutmata, kehtivad kontrollsummad igal lausel kaasa arvatud ümberkirjutatud, GGA ja RMC langevad kokku, üks PKSHT tsükli kohta värava väljaga seal, kus fiks on kehtetu), ja otsast lõpuni skript kontrollib, et värava kuulaja tarbija saab täpselt need baidid, mida sama värav kirjutab standardväljundisse. ({ "4" }) PKSHT-sõelurid (JavaScript ja C++) käitatakse kshana väljundist salvestatud lausetel ja nad lükkavad tagasi vale kontrollsumma, versiooni või skoori väljaspool vahemikku { "0" } kuni { "100" }. ({ "5" }) Systemd ühikuid kontrollitakse käsuga systemd-analyze verify (systemd { "255" }, binaarid asendatud) ja valvetega ExecStarti kesta, taaskäivituspoliitika ja liivakasti võtmete suhtes; konteineri sisenemispunkti argumentide käsitlust kontrollitakse asendusbinaariga. MIDA EI: ühelegi nende integratsioonide näidatavale väärtusele ei ole välist sõltumatut etaloni. Usalduse väärtused ise on ülaltoodud read ja integratsioonikäitamine näitab ainult, et torustik neid kannab; seetõttu on see rida MODELLED ja mitte VALIDATED (docs/VALIDATION.md). Ei kasutatud päris laeva, vastuvõtjat, pikka käitamist, kummagi hosti teist versiooni, teist operatsioonisüsteemi ega töölauda; kõik andmed on sünteetiline tekst ja siin ei ole midagi mõõtmine. Päris Signal K kliendi teavituse heli- ja visuaalset käsitlust, OpenCPN-i tööriistariba nuppu, eelistusi ja aegunud olekut ning OpenCPN-i pluginahalduri pakendamist ei proovitud. Systemd liivakasti võtmeid kontrolliti ainult süntaksi osas, mitte ei käitatud elava systemd all, ning konteineri kujutise ehitusel ja selle tervisekontrollil ei ole siin kommitiud tõendeid. Ühtki tuvastus- ega valehäirenäitajat ei väideta. Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC { "61108" }, IEC { "61162" }): laeva navigeerimise eest vastutab jätkuvalt operaator.

# text
seg-5614947f4e8e = receiver_trust (live: the gate, its TCP listener, PKSHT); outside the crate: integrations/signalk (JavaScript), integrations/opencpn (JavaScript relay, C++ native plugin), deploy/reference-build (systemd units, container)

# text
seg-e917651d5c45 = tests/receiver_trust_live_cli.rs (värav ja selle TCP-kuulaja, Rusti pool); integrations/signalk/test/adapter.test.js, integrations/signalk/test/model.test.js ja integrations/signalk/test/plugin.test.js ({ "24" } Node'i testi salvestatud sünteetilisel väljundil); integrations/opencpn/test/relay.test.mjs ({ "5" } Node'i testi); integrations/opencpn/test/e2e-live.mjs (päris binaar TCP-tarbijani, käitatud käsitsi ja CI-s); integrations/opencpn/plugin/test/pksht_test.cpp ja integrations/opencpn/plugin/test/trust_state_test.cpp (C++ kontrollid PKSHT-sõeluri ja paneeli oleku kohta); deploy/reference-build/check-units.sh ja deploy/reference-build/test-entrypoint.sh

# text
seg-efccd283c368 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla süstitud tõe ja kinnise kujuga vormide vastu, lävedega, mis on eelregistreeritud kommitis 6b68f6cc (docs/design/evidence/boc-bump-jump/). BeiDou B1C andmesignaal (PRN { "19" }, { "5" } MS/s), mille genereeris iq::scene: kui valik on väljas, jääb külgtipust alustamine valelukustatuks ennustatud ±({ "0.5" } + d/4) kiibil (mõõdetud ±{ "0.549" }); kui sees, siis üks hüpe peatipu suunas hetkel { "0.08" } s ja hilise akna RMS { "0.0008" } kiipi tasemel { "45" } dB-Hz ning { "0.0048" } kiipi tasemel { "35" } dB-Hz; ühtki hüpet peatipust tasemetel { "35" }, { "40" } ja { "45" } dB-Hz { "4" } s jooksul; skaleeritud EMLP tõus { "0.94" } kuni { "0.99" } valimiga signaalil (skaleerimata { "3.6" } kuni { "3.8" }). Pelk bump-jump-detektor korrelaatori kolmikutel täpse BOC({ "1,1" }) müra kovariatsiooniga ei teinud ühtki valehüpet { "100 000" } uuenduses tasemetel { "25" } kuni { "45" } dB-Hz ja tuvastas { "1000" } { "1000" }-st külgtipust alustamist tasemel { "35" } dB-Hz. NOT MET (leid F1): skaleerimise eelregistreeritud üksustesti ruudustik sisaldab nihkeid väljaspool diskriminaatorite lineaarset ulatust, kus skaleeritud näidud eksivad nihkest kuni { "48" } %. MIDA EI KONTROLLITA: välja-IQ, ribapiiratud sisendastmeid, liit-MBOC/QMBOC koopiaid ega ühtki välist vastuvõtjat.

# text
seg-729d14cb230a = iq::track::boc (BocKind, BocTracking, BumpJump, boc11_dll_scale); iq::track::channel (the bump-jump taps and Channel::bump_jumps)

# text
seg-ac14fcbe3119 = tests/iq_boc_bump_jump.rs (b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain, b4_scaling_on_the_sampled_signal, b5_false_jump_rate_and_detection_at_correlator_level); iq::track::boc üksusetestid (b4_unit_grid_misses_are_the_recorded_ones: eelregistreeritud B4 üksustesti lävi säilitatud nagu kirjutatud, selle salvestatud möödalaskmised kinnitatud leiuna F1)

# text
seg-d2d08312c05d = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — Mõõdetud andmed lävede all, mis on eelregistreeritud kommitis b6ccb499 (xval/scint-malindi/): Zenodo kirje { "16941224" } (INGV, Malindi, { "18" } märts { "2023" }, GPS PRN { "26" }, { "50" } Hz intensiivsus ja kandefaas, CC BY { "4.0" }, SHA-256 kontrollitud). { "22" } kvalifitseeruvat { "60" } s akent (N1 täidetud). MET: intensiivsuse jaotus (Kolmogorov-Smirnov D { "0.0415" }, lävi { "0.05" }) ja S4-ga seotud faasi sähvimine (mediaan mõõdetud/mudel sigma-phi { "0.779" }, lävi 2/3 kuni 3/2). NOT MET (leid F1): mudeli sügava tuhmumise osakaal on { "2.38" } korda mõõdetud (lävi { "0.5" } kuni { "2" }) ja selle keskmine tuhmumine { "3.51" } korda pikem (lävi 2/3 kuni 3/2). Leid F2: registreeritud töötlus loeb mudeli mähitud faasi, mille paljastas enesekontroll; B3 korrati tagantjärele lahtimähitud faasiga ja annab { "0.804" }. MIDA EI KONTROLLITA: teisi öid, jaamu, laiuskraade ega signaale; vastuvõtja müra mudelis. Rida jääb MODELLED.

# text
seg-371e708b8b8f = iq::channel::scint (Scintillation, ScintParams); realdata::scint50 (parse_log, segments, measured_windows, model_windows, compare)

# text
seg-0e1032d7c879 = tests/iq_scint_malindi_measured.rs (cornell_model_verdict_is_the_recorded_one, registreeritud otsus kinnitatud salvestatuna, leid F1; finding_model_fades_are_deeper_and_longer_than_measured; posthoc_b3_with_the_model_phase_unwrapped, ainult teatatud; andmetega väravdatud, hangitud skriptiga scripts/fetch_scint_malindi.sh); realdata::scint50 üksusetestid (model_data_through_the_harness_shows_the_wrapped_phase_finding, leid F2)

# text
seg-16578e7dd2fe = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Kinnise kujuga vorm, lävedega, mis on eelregistreeritud kommitis 3724aefa (docs/design/evidence/acq-cfar/). CA-CFAR valehäire tõenäosus Gamma(M) lahtritele täpse mudeli Monte Carlo vastu: { "18" } { "18" }-st juhust { "3" } binoomsigma piires. Iga iq::acq otsingute lahtri peal (GPS L1 C/A, { "2.5" } MS/s, { "210 000" } lahtrit igaühes) kavandatud { "1" } % juures: { "0.977" } % ja { "0.969" } % Gaussi müral ning { "1.006" } % ja { "0.999" } % 2-bitiselt kvantiseeritud müral (M = { "1" } ja { "4" }; lävi pluss-miinus { "20" } %); otsused muutumatud, kui sisendit skaleeritakse. NOT MET (leid F1): müravabal 2-bitisel signaalil on tuvastus ja selle lahter õiged, kuid { "1.28" } % tipu rea tipuvälistest lahtritest (lävi { "1" } %) ületab läve koodi deterministlike korrelatsiooni külgsagaratel. MIDA EI KONTROLLITA: teisi CFAR-i variante, kahemõõtmelisi aknaid, ribapiiratud sisendastmeid, välja-andmeid.

# text
seg-98c86c10352b = iq::acq (CfarConfig, ca_cfar, ca_cfar_cells, ca_cfar_pfa, ca_cfar_alpha)

# text
seg-7b8247a4ca76 = tests/iq_acq_cfar.rs (c1_closed_form_matches_monte_carlo_of_the_exact_model, c2_false_alarm_rate_on_gaussian_noise, c3_false_alarm_rate_on_two_bit_noise, c5_decisions_do_not_depend_on_the_input_scale; c4_noise_free_two_bit_signal_verdict_is_the_recorded_one, registreeritud otsus kinnitatud salvestatuna, leid F1, kinnitatud testiga finding_noise_free_sidelobes_exceed_the_cfar_rate); iq::acq üksusetest ca_cfar_closed_form_reduces_to_the_textbook_case_and_inverts

# text
seg-7bd7522eabed = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Avaldatud liidesekontrolldokumendid ja kinnise kujuga vormid, lävedega, mis on eelregistreeritud kommitis 5806f28b (docs/design/evidence/spectrum-bands/): GLONASS ICD väljaanne { "5.1" }, BDS-SIS-ICD B1I { "3.0" }, B1C { "1.0" }, B2a { "1.0" } ja B3I { "1.0" }, Galileo OS SIS ICD väljaanne { "2.1" }. MET: iga kandja, kiibikiirus ja vastuvõetud võimsus nii nagu ärakirjutatud ({ "28" } GLONASS-i kanalit), BPSK esimesed nullid kiibikiirusel, B1C liitsignaal võrdne MBOC(6,1,1/11)-ga, nagu selle ICD võimsustabel annab, C/N0 tee samasus ja baidiidentsed spektristsenaariumid. NOT MET: ühikpindala lävi, mis oli nii kirjutatuna saavutamatu (leid F1; pindalad võrduvad kinnise kujuga ribasisese osakaaluga), ja IQ kihi B1I ja B1C lainekujude ribakaupa kokkulangevus mudeli ümbrikuga ({ "1.26" } ja { "1.56" } dB võrreldes { "0.5" } dB-ga, leid F2; GLONASS { "0.07" } dB), sest Goldi ja Weili koodidel on ebaühtlased joonspektrid; ribakeskmistatuna langevad peasagarad kokku { "0.25" } dB piires. MIDA EI KONTROLLITA: salvestatud IQ-d, teisi signaale, süsteemisisest häiret.

# text
seg-3e8c364433b7 = spectrum (default_band, MORE_BAND_NAMES, GLONASS_CHANNELS)

# text
seg-e24276b8b422 = tests/spectrum_more_bands.rs (s1_new_bands_carry_their_icd_values, s2_nulls_and_b1c_parts, s4_cn0_paths_agree_on_the_new_bands; s2_closed_form_densities_verdict_is_the_recorded_one, leid F1, kinnitatud testiga finding_s2_areas_are_the_closed_form_in_band_fraction; s3_iq_layer_verdict_is_the_recorded_one, leid F2, kinnitatud testiga finding_s3_per_bin_errors_follow_the_code_line_spectrum; posthoc_s3_band_averaged_shape, ainult teatatud)

# text
seg-07554505b56b = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — LSIS-AFS V1.0 (nagu ülal): pikkusega 1499 Legendre'i jada (tabel E-1, identne) ja tertsiaarsed esimesed ja viimased { "24" } kiipi (tabelid E-2 kuni E-6: { "419" } { "420" }-st veerust identset; dokument trükib sama viimased { "24" } kiipi, A14850, PRN-ile { "147" } ja PRN-ile { "151" } ning generaator reprodutseerib PRN-i { "151" } omad, seega on PRN-i { "147" } kirje tõenäoliselt trükiviga; lävi { "420" } { "420" }-st on NOT MET ja möödalask on kinnitatud); SB1 koodi joonise { "8" } läbitöötatud näide (üks näide: 0x045 kodeerib väärtuseks 0x229F61DBB84A0); CRC-24Q kataloogi kontrollväärtuse 0xCDE703 vastu ASCII { "123456789" } jaoks; dokumendi enda kaadriaritmeetika. Läved eelregistreeritud kommitis b3ba5d5. Üks möödalask kirjes ja üks läbitöötatud näide sõnumikihi jaoks, seega rida jääb MODELLED. MIDA EI KONTROLLITA: LDPC-d ja CRC-sõnu alamkaadrites { "2" } kuni { "4" }, sõnumi sisu ega ühtki salvestatud voogu

# text
seg-010ad441a092 = iq::lunanet_afs; iq::signals::lunanet (afs_q_tertiary_bits, afs_q_overlay_bits, afs_q_tiered); surface (lunanet_afs_check_spec, lunanet_afs_check_symbols, lunanet_afs_generate)

# text
seg-2d72ec7c3695 = tests/lunanet_afs_codes.rs (b4_legendre_1499_matches_and_tertiary_codes_match_except_one_printed_column, the_spec_check_reports_every_bar_and_pins_the_b4_miss); iq::lunanet_afs::tests (sb1_round_trips_every_field_and_corrects_flipped_symbols, generated_streams_pass_and_damage_is_found); tests/lunanet_afs_cli.rs

# text
seg-3a9a9d15186c = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Stsenaariumi tulemustele ei ole välist: iga paketi test käitab MODELLED stsenaariumi liiki. Läved on paketi autori öeldud profiil (DHS-i raamistik ei ütle väärtusi; IMO täpsuspiirid on MSC.1/Circ.1575 tabel C-1, loetud täielikult; ICAO pakett järgib ICAO enda RFI leevendusplaani esitlust, sest Doc { "9849" } on tasuline väljaanne ja seda ei loetud), kommitiud enne ühtki hinnatud käitamist xval-stiilis PREREGISTRATION.md failidesse kataloogi standards/ all. MET lävi ütleb, et modelleeritud stsenaarium täitis öeldud läve, mitte midagi toote kohta

# text
seg-662887e17adb = standards_pack; compliance (standards-pack facts in compliance-report)

# text
seg-e2d8a0f6daa5 = tests/standards_packs.rs (pinned_outcomes: iga testi staatus, sealhulgas möödalaskmised L4-T1 ja neli IMO täpsustesti); standards_pack::tests

# text
seg-37b0efd0a7e5 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: pakett seob räsid ja MODELLED vastuvõtjalogi skoori, kontrollituna sünteetilistel andmetel (komplekteeritud stsenaariumi eksporditud NMEA, mida käsitletakse vastuvõtja logina). Laboratoorset käitamist ei väideta

# text
seg-012acc12567b = evidence::roundtrip, evidence::assemble, interop::testbench (write_conditions_json), iq::campaign::conditions

# text
seg-b92c6dde9c2b = tests/round_trip_pack.rs (pack_links_scenario_conditions_log_and_score_and_verifies, conditions_that_disagree_with_the_scoring_events_are_refused, a_stated_log_hash_that_does_not_match_is_refused, published_schema_names_every_field_the_engine_writes)

# text
seg-e9bde2e0a342 = alamväidet kontrollitakse välisel teel, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleeritud tasemele — GNSS-SDR { "0.0.19" } (GPL-3.0-or-later, Ubuntu { "24.04" } pakett, käitatud eraldi programmina; kommitiud ainult tuletatud arvud) jälgimas samu numpy salvestisi (mootorist sõltumatu), mõlemat mõõdetuna analüütilise tõe vastu. Läved eelregistreeritud kommitis 48edd4a5, muudetud enne ühtki testsalvestist kommitis 1e4288c4 ({ "10" } Hz FLL ainult sissetõmbe ajal mõlemas vastuvõtjas, pärast seda kui registreeritud kalibreerimine ebaõnnestus vale GNSS-SDR-i üleandmise tõttu, leid F3). MET tasemetel { "30" }, { "35" }, { "40" } ja { "45" } dB-Hz: kandja värin { "4.3" } % piires, koodi värin { "4.6" } % piires ning Doppleri keskmine ja hajuvus GNSS-SDR-i omadest. NOT MET: mootori NWPR C/N0 loeb { "2.3" } kuni { "7.1" } dB GNSS-SDR-i SNV-st madalamat (leid F4, teadaolev NWPR-i piir; selle M2M4 on tõest { "0.06" } dB piires); faasilukustuse indikaatorid erinevad definitsiooni poolest (F5); tasemel { "30" } dB-Hz libises GNSS-SDR kaks korda ja mootor mitte (F6). GNSS-SDR-i enda üleandmine lukustus valele sagedusele { "3" } { "30" }-st kalibreerimiskäitamisest. MIDA EI KONTROLLITA: teisi signaale, andmebittide mahavõtmist, uuesti hõivamist, välisalvestisi. Rida jääb MODELLED.

# text
seg-d9eab5e90d10 = iq::track (Channel, LoopCore, design); iq::cli::track

# text
seg-a99bb0c28b00 = tests/iq_track_gnss_sdr_oracle.rs (calibration_passes_for_both_receivers, registered_bars_give_the_recorded_verdict, recorded_numbers_are_pinned), failiga tests/fixtures/iq_track_gnss_sdr_oracle/make_fixture.py tuletatud arvudel

# text
seg-5d76e6627df0 = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Sõltumatu numpy ümberarvutus (xval/crpa-jamming/oracle.py, ühist koodi pole: numpy suunavektorid, numpy.linalg.solve ja inv) igast jamming-demo geomeetria lülist 4-elemendilise ruutmassiiviga, mõlema kaalutluse all. Läved eelregistreeritud kommitis 08d83b4d. MET: A1 (kõik { "150" } stsenaariumi tulemust baitidentsed ilma jaotiseta, pärast parandust: esimene ehitus lisas crpa ühikud iga segamiskäitamise ühikutabelisse), A2 (üks element võrdub massiivita täpsusega { "1e-12" } dB), A3 massiivi mürakasvu ja efektiivse C/N0 puhul ({ "912" } lingi kaalutlust { "1e-9" } dB piires, halvim { "2.1e-14" } dB) ja nullsuunava segaja nulli puhul (alla -200 dB mõlemal pool), A4 (MVDR { "0.1" } dB piires nullsuunavast JNR-i { "80" } dB korral). NOT MET: A3 MVDR-i segaja võimenduse puhul, { "194" } { "456" }-st lingist üle { "1e-9" } dB { "0.36" } teisaldatava matemaatikaga ({ "202" } hostimatemaatikaga; docs/revisions/STUDIO15-batch4-rebaseline.md) (halvim { "1.7e-6" } dB) jääkidel -100 kuni -188 dB, kus float64 kaotus piirab mõlemat teostust (numpy inv ja solve lähevad omavahel lahku { "169" } lingil, halvim { "7.9e-7" } dB); efektiivne C/N0, mida need toidavad, on mõjutamata. MIDA EI KONTROLLITA: vastastikune sidestus, elementide mittesobivus, lairibatöötlus, mitu segajat, ühtki antenniriistvara. Samade võrrandite ümberarvutus, mitte väline sõltumatu etalon; rida jääb MODELLED.

# text
seg-6c01cedc4ca7 = jamming (CrpaCfg, crpa_weights, run_jamming); crpa (null_steering_weights, mvdr_weights, covariance)

# text
seg-efdc3da9e0ad = tests/jamming_crpa.rs (a1_crpa_units_only_with_the_section, a2_one_element_is_no_array, a3_verdict_is_the_recorded_one, a4_mvdr_tends_to_the_null_at_high_jnr), faili xval/crpa-jamming/expected.json vastu failist xval/crpa-jamming/oracle.py

# text
seg-400cb0737968 = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Sõltumatu numpy ümberarvutus (xval/jamming-terrain/oracle.py, ühist koodi pole: oma .hgt lugemine, bilineaarne interpolatsioon, WGS { "84" } edasi-tagasi teisendus, profiil, kumerus, nu ja J(nu)) kümnest segaja paigutusest vastuvõtja ümber Badwater Basinis kommitiud päris SRTM-i plaadil tests/fixtures/terrain/N36W117_sub6.hgt. Läved ja paigutused eelregistreeritud kommitis 92cd2bfd. Kõik MET: additiivsus (kõik { "150" } stsenaariumi tulemust baitidentsed ilma jaotiseta); iga paigutuse profiilipunktid ja takistus võrdsed ning nu ja kadu { "1.6e-10" } piires (lävi { "1e-9" }); kadu ei tõuse kunagi, kui segaja tõuseb { "2" }-st { "4902" } m-ni; kadu alandab iga J/S täpselt iseenda võrra ja mitte millegi muu; J(nu) { "1e-12" } dB piires etaloni omast. Leiud: paigutused üle Black ja Funeral Mountainsi kaotavad { "44" } kuni { "48" } dB; kaks oru põhja paigutust kaotavad { "8" } ja { "15" } dB ainult Maa kumeruse tõttu antennikõrgustel { "2" } m, ühe noateraga mudeli puutujajuhtum. MIDA EI KONTROLLITA: mistahes mõõdetud levi, mitme serva difraktsioon, maapinnalt peegeldus, risu (clutter), DEM-i enda viga. Sama mudeli ümberarvutus, mitte väline sõltumatu etalon; rida jääb MODELLED.

# text
seg-05b174fab8a1 = jamming_terrain (TerrainCfg, jammer_terrain, knife_edge_loss_db); jamming (run_jamming_sky)

# text
seg-5adec86a588b = tests/jamming_terrain.rs (b1_terrain_units_only_with_the_section, b2_every_placement_matches_the_independent_numpy_recomputation, b3_the_loss_never_rises_as_the_jammer_rises, b4_the_loss_reaches_every_js_and_nothing_else, b5_the_knife_edge_function_matches_the_reference_expression), faili xval/jamming-terrain/expected.json vastu failist xval/jamming-terrain/oracle.py

# text
seg-db6e518a15d1 = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Sõltumatu Pythoni ümberarvutus igast hõivamislipust (xval/jamming-acq-agc/hysteresis.py) mootori epohhipõhisest efektiivsest C/N0-st, sõltumatu numpy Monte Carlo kvantiseerija kaost (xval/jamming-acq-agc/quantiser_mc.py, oma optimaalse sammu otsing, { "2" }^{ "22" } valimit) ja IQ kihi AGC silmus. Läved eelregistreeritud kommitis 70c72fcc, täiendava käitamiskomplektiga algväärtusel { "37793290" }. MET: additiivsus (kõik { "150" } stsenaariumi tulemust baitidentsed ilma jaotisteta); iga lipp võrdne täiendavatel käitamistel ({ "1824" } linki, neist { "732" } näitavad hüstereesi); monotoonne lävendi suhtes; kvantiseerija kadu { "0.0007" } dB piires Monte Carlost { "1" } kuni { "4" } bitil (lävi { "0.02" } dB); AGC lugem { "0.012" } dB piires AGC silmusest (lävi { "0.05" } dB). NOT MET: registreeritud hüstereesikäitamised (jamming-demo { "10" } kuni { "30" } dBW juures) olid mitteinformatiivsed, iga link kadunud, ja nende H2 ja H4 on täidetud ainult triviaalselt. Leid: CW-segajaga kaotab 1-bitine ADC umbes { "5" } dB rohkem kui Gaussi näitaja, mida mootor rakendab, ja märgib kehtetuks. MIDA EI KONTROLLITA: hõivamisotsingut ennast, AGC dünaamikat ajas, ühtki vastuvõtja riistvara. Sama mudeli ümberarvutused, mitte väline sõltumatu etalon; rida jääb MODELLED.

# text
seg-0417fac0e7e2 = jamming_rx (AcquisitionCfg, AcqState, FrontEndCfg, front_end); jamming (run_jamming_sky); iq::frontend::quant (optimum_step_sigma)

# text
seg-ca7aa6592c0d = tests/jamming_acq_agc.rs (h1_g1_units_only_with_their_section, h2_no_hysteresis_is_no_hysteresis, h2s_no_hysteresis_is_no_hysteresis_on_the_supplementary_runs, h3_flags_match_the_independent_recomputation, h3s_flags_match_the_independent_recomputation_on_the_supplementary_runs, h4_monotone_in_the_acquisition_threshold, h4s_monotone_in_the_acquisition_threshold_on_the_supplementary_runs, g2_quantiser_loss_matches_the_independent_monte_carlo, g3_agc_reading_matches_the_iq_layer_agc_loop), failide xval/jamming-acq-agc/expected_hysteresis.json, expected_hysteresis_s1.json ja expected_quantiser.json vastu

# text
seg-19788df00e45 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Sisemine kooskõla süstitud tõe vastu: sünteetiline andmeta GPS L1 C/A allikas (PRN { "13" }, { "1500" } Hz, { "4.1" } MHz, { "8" } s, kümme müra algväärtust), mille kandefaas on teada, lävedega, mis on eelregistreeritud kommitis 58789af0 (docs/design/evidence/fll-handover-floor/). MET: kontroll (piiramata vaikeväärtus ei anna üle { "9" } { "10" }-st algväärtusest tasemel { "33" } dB-Hz); additiivsus (vaikeväärtuse räsi ja olemasolevad jälgimistestid muutmata); { "100" } Hz kõrvalekaldega üleandmise sissetõmme tasemel { "45" } dB-Hz. NOT MET: { "1.0" } s piiriga üleandmine ja hoidmine igal käitamisel ({ "16" } { "20" }-st tasemel { "33" } dB-Hz, { "8" } { "20" }-st tasemel { "31" } dB-Hz; ülejäänud tsüklevad sunnitud üleandmiste ja FLL-i naasmise vahel) ja faasivärin { "25" } % piires ainult PLL-ist ({ "10.8" } võrreldes { "6.1" } kraadiga tasemel { "33" } dB-Hz). MIDA EI KONTROLLITA: andmebitte, teisi signaale ja diskreetimissagedusi, välisalvestisi. Vaikeväärtus on muutmata; rida jääb MODELLED.

# text
seg-80753cdc89bc = iq::track (LoopConfig, FllGate, design); iq::track::channel (the FLL gate)

# text
seg-96b2276484ed = tests/iq_fll_handover_floor.rs (registered_bars_give_the_recorded_verdict, d1_the_key_is_part_of_the_hash_only_when_set, d4_the_capped_design_pulls_in_a_100_hz_handoff_error), failil tests/fixtures/fll_handover_floor/results.csv

# text
seg-0718b0c21f9b = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: ühtki RTKLIB-i toodetud faili ei loetud ja veeruplaan on RTKLIB-i käsiraamatust. Kontrollitud ainult ise kirjutatud failidel; ECEF-teisendus taaskasutab frames::ecef_to_geodetic, millel on oma read

# text
seg-e322b10ec19c = receiver_trust::machines::rtklib (read_rtklib_pos); receiver_trust::LogFormat::RtklibPos

# text
seg-b5f5f47b5608 = receiver_trust::machines::rtklib::tests (lat/lon epohhid, nädal/TOW ja ECEF, dms tagasi lükatud, vaenulik sisend); tests/receiver_trust_machines.rs::rtklib_pos_runs_as_a_receiver_log; integrations/gnss_lib_py/test_bridge.py

# text
seg-32c8918c596c = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole läbimislävena. Väljaplaanid ja CRC järgivad avalikku OEM7 dokumentatsiooni (docs.novatel.com); CRC-rutiini kontrolliti üks kord CRC vastu, mille dokumentatsioon oma BESTPOSA näite jaoks ütleb (tsiteeritud, mitte sõna-sõnalt). Fikstuurid on ise kirjutatud; ühtki päris vastuvõtja logi ei loetud

# text
seg-97eac8ec4604 = receiver_trust::machines::novatel (read_novatel, novatel_crc32); receiver_trust::LogFormat::Novatel

# text
seg-d935af6c8c6a = receiver_trust::machines::novatel::tests (kinnitatud CRC, ASCII ja binaarkirjed, vigane CRC vahele jäetud, vaenulik sisend); tests/receiver_trust_machines.rs::novatel_jammer_flag_reaches_the_receiver_self_report

# text
seg-9fd8d7111160 = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — ReferenceImpl ühekordses kontrollis, mitte komplekti testina: pyrtcm { "1.2.0" } dekooder loeb samu ise kirjutatud kaadreid samale C/N0-le ja epohhiajale. See jagab oma tabelite allikat selle lugejaga, seega kontrollib see bitikäsitlust, mitte paigutust. Päris vastuvõtja ega baasjaama salvestist ei loetud

# text
seg-d151880c7268 = receiver_trust::machines::rtcm3 (read_rtcm3, crc24q); receiver_trust::LogFormat::Rtcm3

# text
seg-68a47a4f7e3f = receiver_trust::machines::rtcm3::tests (CRC-24Q kataloogi kontrollväärtus, MSM4/MSM7 C/N0 ja epohhide liitmine, GLONASS-i aja ja SBAS-i id vastendus, vigane CRC ja muud sõnumid)

# text
seg-15841bb986fe = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: väljanimed pärinevad GNSS-SDR-i dokumentatsioonist; ei lugejat ega relay.py-d ei käitatud elava GNSS-SDR-i ega päris salvestise vastu

# text
seg-a2c51966ce9e = receiver_trust::machines::gnss_sdr (read_gnss_sdr_monitor); receiver_trust::LogFormat::GnssSdr

# text
seg-696b76cdaf9a = receiver_trust::machines::gnss_sdr::tests; integrations/gnss-sdr/example.jsonl

# text
seg-b101c8376109 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: sobitust kontrollitakse sünteetilistel teadaolevate koefitsientidega valge müra logidel, suunda püsiva pöördekiirusega logidel. Päris IMU logi ei sobitatud ja q_aa-d ei sobitata

# text
seg-2977aaca1688 = receiver_trust::machines::imu, imu_fit; surface::imu_fit; scenario [log.imu]

# text
seg-10715c98eaae = receiver_trust::machines::imu::tests; receiver_trust::machines::imu_fit::tests (teadaolevad valge müra koefitsiendid taastatud { "10" } % piires, keeldumised, TOML sõelutakse kui AccelCfg); tests/receiver_trust_machines.rs (suuna kokkulangevus ja lahknevus, sisendkandja, imu_fit)

# text
seg-93283b08d1f9 = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: pakette luges testi jaoks kirjutatud loopback-kuulaja, mitte päris vahendaja (broker), ja Home Assistanti ei käitatud

# text
seg-6ad9867cec5c = telemetry::mqtt (discovery, state_json, connect_packet, publish_packet, MqttSink); surface::TelemetryFormat::Mqtt

# text
seg-21059291ea8b = telemetry::mqtt::tests (paketibaidid, loopback-vahendaja, surnud vahendaja loendatud); tests/receiver_trust_machines.rs::trust_telemetry_mqtt_text_has_discovery_then_state

# text
seg-4f354fdb164b = kontrollitud oma kinnise kuju / analüütilise samasuse vastu — tabab ärakirjutus- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Välist ei ole: ROS-i sõlme ei käitatud elaval ROS { "2" } graafil ja ublox_ubx_msgs väljanimesid ei kontrollitud töötava draiveri vastu. gnss_lib_py (MIT) käitati sillatesti jaoks

# text
seg-f94e58f3479b = integrations/ros2/kshana_trust (bridge.py, trust_node.py); integrations/gnss_lib_py/kshana_gnss_lib_py.py

# text
seg-8c92f36d0227 = tests/receiver_trust_machines.rs (rtklib_pos_runs_as_a_receiver_log: formaat, mida gnss_lib_py sild kirjutab, käitatud läbi receiver-trust'i); sildade Pythoni testid on integrations/ros2/kshana_trust/test/test_bridge.py (sild mock-mootoriga), integrations/ros2/kshana_trust/test/test_engine_integration.py (päris wheel hindab püsiva fiksi nominaalseks ja { "1.1" } km hüppe usaldamatuks) ja integrations/gnss_lib_py/test_bridge.py (päris gnss_lib_py { "1.1.0" } ja wheel), käitatud pytestiga, mitte cargoga

# text
seg-7a0503f925c1 = <s1>Eelmine</s1>Võimekuste viide

# text
seg-b5832e94f926 = <s1>Järgmine</s1>Väited tegelikkuse vastu

seg-65185cb68d6b = Missioonifaaside ahela navigatsiooni- ja ajastusvea eelarve startimisest sisenemiseni (<c1/>)

seg-86a132e1a243 = Liik <c1/>: faaside dokument, millest iga on üks kaheksast registreeritud liigist, käivitatud järjekorras, 6x6 kovariatsiooni, kella ja tugisüsteemi edasiandmisega öeldud reegli järgi (<c2/>; <c3/>, valge kiirendusmüra öeldud vahemiku jooksul sirgjoonelisel mudelil; <c4/>, inertsiaalne edasiliikumine ja seejärel allika alampiir, mitte kunagi sellest allapoole, mitte kunagi lähtestamine); tugisüsteemi teisendused GCRF, MCI ja MCMF ning ajaskaala teisendused läbi TT, igaüks oma eelarveread, Kuu olek valikulisest DE440 kerneli lõigust ja analüütiline rida öeldud varuvariandina; varu öeldud nõude suhtes, nõrgim lüli, sündmused ja ajajoone joonis. Iga arv on öeldud sisend või selle mudel

seg-87b2b2459b45 = Start ja tõus parkimisorbiidile GNSS-i hõivamise ja signaali kadumisega (<c1/>)

seg-725e7ce83533 = Faas <c1/>: konstantse kiirusega asendi ja kiiruse kovariatsioon valge kiirendusmüraga (inertsiaalse edasiliikumise klass), öeldud täpsusega GNSS-fikseering, mida rakendatakse pärast hõivamisaega ja väljaspool öeldud signaali kadumisi, samade fikseeringutega distsiplineeritud nihke-ja-triivi kell ning parkimisorbiidile sisenemise olek

seg-eb66a49b0306 = Suhteline navigatsioon dokkimisümbriseni madalal Maa orbiidil anduriosade kaupa (<c1/>)

seg-658a0448d80d = Faas <c1/>: suhteline olek sihtmärgi LVLH telgedes suletud kujul Clohessy-Wiltshire'i siirdega, 6x6 Kalmani kovariatsioon valge kiirendusmüraga ja asendiuuendused, mille dispersioon on anduri oma praegusel kaugusel, öeldud anduri osade kaupa (ILLUSTRATIVE optilise kaamera, lidari ja raadiokauguse mõõtmise vormid); dokkimisaken on aeg, millest alates suhteline sigma püsib püüdeümbrises, kuni faasi lõpuni. Jälitaja absoluutne kovariatsioon antakse edasi muutmata ja rida ütleb seda.

seg-b45a8a357faf = Kuule suunav üleminek ja tsislunaarne lend: levitatud keskmine olek ja kovariatsioon jälgimisuuendustega (<c1/>)

seg-ab5c79789754 = Faas <c1/>: keskmine olek mootori Cowelli levitajaga (Maa punktmass ja J2, Päike ja Kuu kolmanda kehana, Kuu lõimest DE440 kernelist seal, kus see lõiku katab, ja Päike analüütilisest reast); kovariatsioon selle levitamise ettapärase diferentsiga olekusiirdemaatriksist (nominaalne käivitus ja kuus häiritud käivitust lõigu kohta) valge kiirendusmüraga; TLI põlemise suuruse ja suuna viga; <c2/> fikseeringud, mille kättesaadavus ja PDOP tulevad kosmoseteenuse ala pühkimisest piki kaart asendavat oskuleerivat orbiiti; kauguse ja kauguskiiruse jälgimine geotsentrilise suuna suunas, skaleeritud maajaamade võrgu töötsükliga, Joseph-vormi uuendusega

seg-7a3eb4fae324 = Sisenemisliidese kovariatsioon, koridoritõenäosus, tipp-aeglustus ja maandumisjalajälg (<c1/>)

seg-93f07906d7bf = Faas <c1/>: faasi <c2/> tagasipöörduv liuglus ilma põlemiseta, lõpeb sisenemisliidesega; lennutrajektoori nurk ja selle sigma täielikust kovariatsioonist lõplike diferentside gradiendiga; tõenäosus, et nurk on öeldud koridoris; tipp-aeglustus nominaalse nurga juures ja mõlemal koridoriservas mootori tasapinnalisest ballistilisest punktmassi sisenemisest (väljapõrge tuvastatud) Allen-Eggersi suletud kuju kõrval; maandumisjalajälg öeldud allasuunalise tundlikkuse ja orbiiditasandit läbiva liidesekovariatsiooni põhjal. Tõstejõudu, juhtimist ega kuumenemist ei modelleerita

seg-3f0951532f6e = Maajaamade võrgu katvus ja jälgimise töötsükkel faasi jaoks (<c1/> liigis <c2/>)

seg-5204af351299 = Maajaamade võrgu pealis: jaamad minimaalse tõusunurgaga, sõiduki nähtavus öeldud geomeetrial (sisenemisolek lennatud kahe keha mudelis koos J2-ga, Kuu asend lennu jaoks või öeldud töötsükkel), jaamavahetused, mis kaotavad igaüks öeldud aja, ja saadud töötsükkel antakse edasi faasi maajälgimise uuendussagedusele; pikim ajavahemik, mil ühtki jaama pole näha, on eelarverida

seg-4ba700726208 = Suhteline navigatsioon dokkimiseni Kuu orbiidil (<c1/>)

seg-2e30e78e49f7 = Liik ja faas <c1/>: ühine kahe sõiduki partii Gauss-Newtoni hinnang kaarel (kakskümmend üks parameetrit: mõlemad olekud ja püsivad signaali kosmoses asendinihked, ühised ja sõltumatud), kasvatatud veerandi, poole ja kogu kaare peale sammu poolitamisega, ühest absoluutsest fikseeringust sõiduki kohta (AFS pilootkoodi jälgimise tõke, ILLUSTRATIVE releekomplekt) ja ristlingi kaugusest, teegi Kuu jõumudeli all; keskmine normaliseeritud hindamisvea ruut, Clohessy-Wiltshire'i kontroll ringorbiidil ja edasi antud 6x6 kovariatsioon

seg-c85d7e5e63a3 = Maandumishajuvuse eelarve Kuu polaaralal (<c1/>)

seg-bd88ab3ad105 = Liik ja faas <c1/>: viieolekuline telgede kaupa inertsiaalne veamudel (asend, kiirus, kiirendusmõõtja nihe, kalle, güroskoobi nihe) mootoriga laskumisel, mida toetavad AFS fikseeringud (eraldiseisvad või diferentsiaalsed, kella toetatud kolme releega juhtumiga), maastikusuhteline fikseering (mootori terrain-nav sobitaja sünteetilisel reljeefil või Cramer-Rao tõke LOLA DEM-il avaprobleemi reegliga) ja Kuu aeg, koos Monte Carlo puudutuselliipsiga

seg-8dfc1600cf8c = Pinnapositsioneerimise ja -ajastuse kättesaadavus asukoha ja aastaaja järgi Kuu poolustel (<c1/>)

seg-f91c1da9ab55 = Liik ja faas <c1/>: releede kättesaadavus ja PDOP, Maa ja Päikese nähtavus ning distsiplineeritud pinnakell iga asukoha ja aastaaja kohta, koos liigi <c2/> maastikusiluetiga; ühe asukoha käivitus võrdub selle liigi kättesaadavuse ja PDOP-iga bitipealt

seg-0db91d70a079 = Mootoriga tõus Kuu polaaralalt sisenemisorbiidile (<c1/>)

seg-b5b1125d515c = Liik ja faas <c1/>: viieolekuline telgede kaupa inertsiaalne veamudel mootoriga tõusul, kus erijõud on piki rada, mida toetavad AFS fikseeringud ja Kuu aeg, esitades orbiidile kantud sisenemise asendi ja kiiruse kovariatsiooni ning mootori väljalülituse hajuvuse (esitatud, mitte edasi kantud)

seg-1983ce9cc6da = Kuu jõumudeli levitamine avalike rekonstrueeritud Kuu orbiitide ja tsislunaarsete trajektooride vastu

seg-57f53a7d1fa2 = Kuu liikide jagatud levitaja (GRAIL GL0660B järk ja aste { "150" }, Maa ja Päikese kolmandad kehad, relatiivsus, DE440 Kuu orientatsioon) võrreldud LRO ({ "24" } h, { "10" } minuti valimid) ja CAPSTONE'i (üks { "6.5" } päeva tiir, tunnivalimid) avalike JPL Horizonsi trajektooridega, lävede all, mis on enne käivitust kinnitatud salvestatud failis

seg-c557d317389a = Tsislunaarse keskmise oleku levitamine avaliku Artemis I trajektoori vastu (<c1/>)

seg-539d4c3e9b56 = Faasi <c1/> keskmise oleku levitamine (Cowell, Maa punktmass ja J2, Päike ja Kuu kolmandate kehadena, Kuu DE440 lõigust) võrreldud Artemis I avaliku JPL Horizonsi trajektooriga { "72" } h liuglusel alates 2022-11-16 { "18" }:{ "00" } TDB, { "12" } tunni epohhidel, lävede all, mis on enne käivitust kinnitatud salvestatud failis

seg-150ae9c3d755 = Häirete allika piirkond: teostatav kiirgusallika piirkond õhusõidukite ja laevade positsiooniteadetest

seg-b5c49044a7a1 = Teostatav piirkond, kus võib asuda halvenenud navigatsiooniteadete allikas, ADS-B (NIC/NACp) või AIS positsiooniteadetest: raadionähtavus 4/3 Maa raadiusel teate kõrgusest ja kiirgusallika antenni kõrgusvahemikust, piiratud efektiivne ulatus tundmatu võimsuse jaoks, mõjutatud üksused tõmbavad posterioori oma ulatuse suunas ja mõjutamata nähtavusega üksused suruvad sellele vastu, rühmitatud sessioonideks ajas ja ruumis. Väljund on suurima tihedusega piirkonnad öeldud usaldusnivoodel, posterioori tsentroid momentellipsiga, sessiooni algus, lõpp, kestus, mõjutatud ala ja eristatavate õhusõidukite arv üle avaldamise miinimumi, ööpäevaprofiil ja tunnid päevas. Maastikuvaba; üks allikas sessiooni kohta; usaldusväärsus sõltub mudelist. Valikuline liitmine geolokatsiooni TDOA fikseeringuga.

seg-26d9a520eb6a = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Käsitsiarvutused testides (sirgjoonelise kovariatsiooni kasv, keskmine sideeriline pööre, ilmalik Kuu kellakiirus) ja ainult Kuu oleku puhul kinnitatud DE440 kerneli väljalõiked kinnistatud JPL Horizonsi väärtuste vastu (halvim { "2.6" } m ja { "7e-6" } m/s). Ahelaga ei võrrelda ühtegi missiooniandmestikku; selle faasid on eraldi read. Dokument on nimetatud ahel ILLUSTRATIVE sisenditega, ainult avalikud allikad ja ühtegi agentuuri heakskiitu

seg-308cb3c31a16 = mission_thread (scenario, handover, conversions, budget, phase)

seg-65bd744f29c6 = mission_thread::scenario::tests::a_thread_runs_hands_over_converts_and_names_the_weakest_link; mission_thread::scenario::tests::bad_documents_fail_with_the_reason; mission_thread::handover::tests::inflate_never_shrinks_a_sigma_and_matches_the_hand_calculation; mission_thread::handover::tests::reacquire_sets_an_axis_to_the_floor_only_where_the_floor_is_smaller; mission_thread::conversions::tests::mci_mcmf_round_trip_returns_the_state_and_the_covariance; mission_thread::conversions::tests::tt_to_ltc_shifts_bias_and_drift_by_the_secular_rate_and_back; mission_thread::conversions::tests::the_committed_kernel_cuts_agree_with_pinned_horizons_values; tests/field_units_global.rs (the report's units block)

seg-d77218b48910 = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Riccati püsiolek ja ennustuse käsitsiarvutus testides. Siin ei modelleerita kanderaketti ega vastuvõtjat; iga arv on nimetatud sisend

seg-9e5314dc6b0a = mission_thread::earth::launch (LaunchAscent)

seg-083f9245ff63 = mission_thread::earth::launch::tests::with_gnss_the_sigma_settles_near_the_fix_and_an_outage_lets_it_grow; mission_thread::earth::launch::tests::before_acquisition_the_sigma_only_grows_and_a_longer_acquisition_is_worse; mission_thread::earth::launch::tests::a_phase_that_does_not_list_gnss_never_uses_it; mission_thread::earth::launch::tests::bad_models_and_entries_are_refused; mission_thread::earth::filter::tests::repeated_updates_reach_the_riccati_steady_state

seg-24aae90bcf56 = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Ühe telje käsitsiarvutus ennustuse ja uuenduse kohta testis; Clohessy-Wiltshire'i siire on see, mida cw_dynamics kontrollib sõltumatu numbrilise integreerimise vastu. Andurid on ILLUSTRATIVE ja ühtegi päris kohtumist ei võrrelda

seg-da26dd6773fb = mission_thread::earth::rendezvous (LeoRendezvous); cw_dynamics; mission_thread::sensors

seg-940d19eaea64 = mission_thread::earth::rendezvous::tests::the_relative_sigma_falls_through_the_legs_and_opens_a_docking_window; mission_thread::earth::rendezvous::tests::without_relative_sensing_the_sigma_only_grows_and_no_window_opens; mission_thread::earth::rendezvous::tests::the_covariance_recursion_matches_a_one_axis_hand_calculation; mission_thread::earth::rendezvous::tests::bad_models_and_a_duration_mismatch_are_refused; mission_thread::sensors::tests::the_cross_range_error_grows_with_range_and_the_floor_dominates_up_close

seg-4bbee1892183 = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Liouville'i teoreem (konservatiivse osa olekusiirdemaatriksi determinant on üks) ja peenem vahe testides; keskmist olekut võrreldakse avaliku trajektooriga allolevas reas, mille see möödub. Impulsi viga, uuendusi ja kovariatsiooni ei võrrelda millegagi

seg-88b5123a7c1f = mission_thread::earth::tli_cruise (TliCruise); propagator; ssv::sweep

seg-be98276d9788 = mission_thread::earth::tli_cruise::tests::the_stm_is_symplectic_for_the_conservative_part_and_matches_a_finer_difference; mission_thread::earth::tli_cruise::tests::with_no_tracking_the_covariance_is_the_stm_propagation_of_the_entry_and_the_burn; mission_thread::earth::tli_cruise::tests::range_tracking_shrinks_the_line_of_sight_and_leaves_the_plane_of_the_sky; mission_thread::earth::tli_cruise::tests::the_thread_kernel_serves_the_moon_inside_its_window_and_the_series_outside; mission_thread::earth::tli_cruise::tests::gnss_ssv_fixes_are_applied_where_the_sweep_finds_four_signals; mission_thread::earth::tli_cruise::tests::a_phase_that_lists_a_source_the_model_lacks_is_refused_and_unknown_keys_too

seg-2dc8a48d5ffe = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Käsitsiarvutused testides (nurga sigma on ristkiiruse sigma jagatud kiirusega; Gaussi mass koridoris). Tasapinnaline sisenemine on mootori enda ja Allen-Eggersi kuju on suletud kujuga võrdlus; ühtegi lennatud sisenemist ei võrrelda

seg-6057015a7a7c = mission_thread::earth::entry (Entry); reentry

seg-dcb831f6f492 = mission_thread::earth::entry::tests::the_flight_path_angle_and_its_sigma_follow_the_velocity_error_over_the_speed; mission_thread::earth::entry::tests::the_corridor_probability_is_the_gaussian_mass_inside; mission_thread::earth::entry::tests::the_phase_reports_the_interface_the_corridor_the_peaks_and_the_footprint; mission_thread::earth::entry::tests::the_steep_edge_peaks_higher_and_a_limit_below_it_is_flagged; mission_thread::earth::entry::tests::bad_corridors_unknown_keys_and_burn_keys_are_refused

seg-2a78aa543666 = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Seniidi ja antipoodi geomeetria kontrollid ning kauge sihtmärgi oodatud nähtavus testides. Ühtegi päris võrku, antenni ega ajakava ei modelleerita

seg-f937752c7a50 = mission_thread::earth::ground_network::tests::a_vehicle_over_a_station_is_seen_and_one_on_the_other_side_of_the_earth_is_not; mission_thread::earth::ground_network::tests::the_moon_is_in_view_of_three_well_spread_stations_most_of_the_time; mission_thread::earth::ground_network::tests::handover_losses_reduce_the_duty_and_never_below_zero; mission_thread::earth::ground_network::tests::a_stated_duty_is_passed_through_and_bad_documents_are_refused; mission_thread::scenario::tests::the_overlay_sets_the_tracking_duty_of_a_phase_that_lists_ground_tracking

seg-addac2398a5e = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Omavaheline kooskõla eelregistreerimise all (xval/mission-thread-lunar/PREREGISTRATION.md, tulemused ja hindaja ajalugu failis RESULTS.md): suhtelise oleku keskmine NEES on { "5.85" } kuni { "5.93" } võrreldes ribaga { "5.2" } kuni { "6.8" } neljas konfiguratsioonis, MET neljanda hindajakujunduse korral pärast seda, kui kolm järjestikuse filtri kujundust jäid tulemata; tõeolek ja hindaja jagavad üht jõumudelit, seega ei ütle see mudeli vea kohta midagi. Levitaja, mida nad jagavad, on allolevas reas võrreldud LRO ja CAPSTONE'iga

seg-75f11c7aa6bc = lunar_rendezvous (LunarRendezvousScenario); lunar_phase; mission_thread::lunar

seg-995afbdc6a9f = lunar_rendezvous::tests::b1_mean_nees_is_inside_the_registered_band_in_all_four_configurations; lunar_rendezvous::tests::circular_cw_check_is_within_the_pre_registered_bar; lunar_rendezvous::tests::same_seed_gives_identical_documents; lunar_rendezvous::tests::b6_handover_without_a_measurement_only_propagates; mission_thread::lunar::tests::every_phase_runs_and_returns_a_modelled_outcome; tests/mission_thread_lunar_oracles.rs

seg-3270c832c0fe = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga inertsiaalne triiv, taaskasutatud liikide enda tulemused ja 3-sigma ellipsi kalibreerimine (ellipsi sees olev osa ühtib oodatuga) testides. Ühtegi lennatud või katsetatud maandumist ei võrrelda

seg-2c293a58fb25 = lunar_landing (LunarLandingScenario); lunar_phase; terrain_nav

seg-7ac44470d95d = lunar_landing::tests::b4_with_no_aid_the_landing_error_is_the_closed_form_inertial_drift; lunar_landing::tests::b4_each_aid_reports_exactly_what_the_reused_kind_gives; lunar_landing::tests::b3_ellipse_calibration; lunar_landing::tests::a_plane_gives_no_fix_the_aperture_problem; lunar_landing::tests::a_bowl_matches_the_closed_form_bound; lunar_landing::tests::three_relays_make_the_fix_depend_on_the_clock

seg-a8b9da63334b = kontrollitud eraldi teostuse vastu samas koodibaasis — sõltumatu testitavast üksusest, kuid mitte väliselt autoriteetne — Täpne võrdus olemasoleva liigiga ühe koha puhul ning monotoonsuse kontrollid testides. Releekomplekt on ILLUSTRATIVE ja ühtegi pinnamõõtmist ei võrrelda

seg-dd3ab355cb4f = lunar_surface_map (LunarSurfaceMapScenario); lunar_phase

seg-6b6210646fdd = lunar_surface_map::tests::b5_equals_the_service_volume_for_a_single_site; lunar_surface_map::tests::b5_equals_the_service_volume_with_the_real_terrain; lunar_surface_map::tests::terrain_never_adds_availability; lunar_surface_map::tests::timing_is_at_least_either_source_and_the_season_moves_the_earth_and_sun; lunar_surface_map::tests::same_inputs_give_identical_documents

seg-aa4a409d28b4 = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Suletud kujuga inertsiaalne triiv ja monotoonsuse kontrollid testides. Ühtegi lennatud tõusu ei võrrelda

seg-b95197d3e058 = lunar_ascent (LunarAscentScenario); lunar_phase

seg-977149f40c72 = lunar_ascent::tests::with_no_aid_the_insertion_error_is_the_closed_form_inertial_drift; lunar_ascent::tests::the_aid_never_hurts_and_the_velocity_is_carried_with_its_correlation; lunar_ascent::tests::a_stale_tt_clock_costs_a_three_relay_fix; lunar_ascent::tests::the_same_inputs_give_identical_documents

seg-581586ff816c = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — JPL Horizonsi kosmoseaparaatide efemeriidid LRO ja CAPSTONE'i jaoks, lävendite vastu, mis on eelregistreeritud failis xval/mission-thread-lunar/PREREGISTRATION.md (muudatused { "1" } kuni { "6" }). LRO: MET, suurim 3-D erinevus { "33" } m ja radiaalne RMS { "2.4" } m võrreldes läviga { "500" } m ja { "60" } m. CAPSTONE: NOT MET, lõppasukoha erinevus { "136.8" } km võrreldes läviga { "25" } km ja periapsise erinevus { "28.4" } km võrreldes läviga { "10" } km, põhjuseid ei eraldatud. Rida on modelleeritud, sest CAPSTONE'i lävi jäi täitmata ja võrdlus testib jagatud levitajat, mitte ühtegi filtrit, signaali ega eelarvet

seg-48ac8187364f = lunar_od (LunarForceModel); precise_od; mission_thread_lunar_oracles (example)

seg-7372185d4dd9 = tests/mission_thread_lunar_oracles.rs::the_stored_numbers_meet_or_miss_the_registered_bars_as_recorded; tests/mission_thread_lunar_oracles.rs::the_fixtures_match_their_recorded_hashes

seg-7ce4f3fbb3c4 = alamväide on väliselt kontrollitud, kuid kogu võimekus koosneb modelleeritud osadest, seega jääb võimekus modelleerituks — JPL Horizons sihtmärk -1023 (NASA navigatsiooni lennuaegne post-TLI trajektoor), lävendite vastu, mis on eelregistreeritud failis xval/mission-thread/PREREGISTRATION.md (muudatus { "1" } muudab ainult päringu ajavahemikku). NOT MET ja testis fikseeritud möödalaskmisena: suurim asukohaerinevus { "45.3" } km võrreldes läviga { "5" } km ning kiiruse erinevus { "0.249" } m/s ajahetkel { "72" } h võrreldes läviga { "0.05" } m/s. Pärast otsust kirjutatud diagnostika paigutab möödalaskmise referentsis viide impulsiivsesse kiirusesammu suurusega { "0.09" } kuni { "0.22" } m/s (eelregistreeritud lugemine, et aken ei sisaldanud ühtegi põletust, oli vale); ülejäänud { "67" } tunni jooksul reprodutseerib mudel järgmise tunnioleku mediaanvea { "0.38" } m täpsusega. Testib ainult ühe tagasiranna kaare keskmist olekut: mitte kovariatsiooni, filtrit, uuendust ega ühtegi muud faasi

seg-7089ca12dbe0 = mission_thread::earth::tli_cruise; propagator; mission_thread_oracle (example)

seg-f4b44b14d819 = tests/mission_thread_oracle.rs::the_stored_numbers_miss_the_registered_bars_as_recorded; tests/mission_thread_oracle.rs::the_diagnostic_places_the_miss_in_five_impulsive_events_not_in_the_force_model; tests/mission_thread_oracle.rs::the_kernel_cut_and_the_recorded_inputs_match_their_hashes

seg-2630978c5675 = kontrollitud omaenda suletud kujul / analüütilise samasuse vastu — tabab ülekande- ja koefitsiendivigu, kuid ei ole väline sõltumatu etalon — Väliseid veel ei ole. Ainult sünteetilised otse-pöördringid generaatorist, mis jagab hindaja mudelit, seega kontrollivad need koodi ja nimetatud tasemete kalibreerimist selle mudeli all ning mitte midagi päris kiirgajate kohta. Välist kontrolli avaldatud Jammertest { "2025" } saatjakohtade vastu eelregistreeriti (docs/emitter-region/PREREGISTRATION.md, omaniku poolt enne ühtegi hinnatud käivitust heaks kiidetud) ja käivitati ühe korra (docs/emitter-region/RESULTS.md): ADS-B NOT ASSESSABLE ({ "2" } ajastatud seanssi, vähem kui registreeritud miinimum { "4" }) ja AIS NOT ASSESSABLE (avaldatud seanssi ei ole), seega ühtegi lävendit ei testitud ja rida jääb MODELLED

seg-67fdcdfdb635 = interference_map::emitter (estimate, sessions, build_units, profile, GaussianFix::from_tdoa), interference_map::emitter_out (locate), <c1/>

seg-920b26e226ab = interference_map::emitter üksusetestid (projektsiooni edasi-tagasi ring, horisondi näitaja, sünteetilised otse- ja pöördringid: teadaolev kiirgaja jääb nimetatud piirkonda ligikaudu nimetatud sagedusega, äärejuhud, seansside rühmitamine, profiil, privaatsus ja sõnastus); tests/interference_map_cli.rs locate juhud

seg-a2bf08b8e82d = { "221" } võimekust sildiga MODELLED.
