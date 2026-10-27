# docs--kinds-jamming-spoofing-and-the-spectrum: translations (et)

# text
seg-b03d56f501c3 = Liik

# text
seg-98e740d32860 = Masinõppel põhineva RF-häirete tuvastamise hindamise katsestend ({ "13494" }): genereeri märgendatud, parameetritest lähtuv SÜNTEETILINE korpus (nominaalne/segamine/spuufimine-aeg/spuufimine-positsioon/mitmeteelevi), hinda detektorit (energy|agc|sqm|parity|fused) detektorist sõltumatu raamistikuga ning anna aru AUC/ROC/segadusmaatriks + klassikohane Pd sihtmärgi Pfa juures, pluss jaotusesisese ja jaotusevälise optimismilõhe. Ainult MODELLED tööomadused — mitte kunagi väli-/IQ-andmed, head/halba otsust ei ole.

# attr:alt
seg-7e7b07bc5545 = Diagramm, mille mootor kirjutab failile scenarios/impairment-eval.toml, liik impairment-eval

# text
seg-60bf3f0ff000 = Lingieelarvega segamine: J/S → efektiivne C/N₀ → haakumise kadu.

# attr:alt
seg-42d46b928d09 = Mootori joonistatud diagramm failile scenarios/jamming-demo.toml, liik jamming

# text
seg-fef00c827c6a = L-riba spektrimudel ja juga-diagramm (waterfall): kogu GNSS-i L-riba ühe võimsusspektri tihedusena (PSD), sagedus risti, aeg allapoole, stsenaariumipõhise segaja ajajoone kohal. SIGNAALID: GPS L1 C/A ja L2C (BPSK({ "1" })), Galileo E1 avatud teenus (MBOC(6,1,1/11) või BOC({ "1,1" })), GPS L5 ja Galileo E5a (BPSK({ "10" })), kõik oma kandesagedusel liidese spetsifikatsiooni minimaalse vastuvõetud võimsusega (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), kui seda pole üle kirjutatud; GLONASS, BeiDou ja Galileo E6 ei ole modelleeritud. SEGAJAD: pidevlaine toon, lame kitsaribaline müra, lineaarne saehamba-chirp ja ribalai müra, mis on sobitatud riba enda modulatsiooniga, igaühel keskpunkt, ribalaius, vastuvõetud võimsus (otse või EIRP ja kaugus segamise liigi vabaruumi levikadu kaudu) ning sisse-/väljalülitusajad. Iga segajat hinnatakse iga riba suhtes selle spektraalse eraldumiskoefitsiendiga kappa üle vastuvõtja ribalaiuse ning (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; ühe segaja korral on see võrdne segamise liigi segamisvastase võrrandiga Q = 1/(R_c kappa) ning aruanne kannab seda ristkontrolli (ja segamise liigi esindusliku Q arvu selle kõrval). Müra põhjatase on k T_sys, kus T_sys = T_ant + { "290" } K (F - { "1" }). Waterfall keskmistab iga lahtri üle selle lahtri ja rea (chirpid täpselt, terved pühkimised pluss osaline; rea keskel lülituvad segajad oma töötsükli järgi), nii et C/N0 ajajoon ja pilt tulevad samadest arvudest; result.json kannab võimsuses ploki-keskmistatud ruudustikku, riba kohta C/N0 ja J/S rea kohta ning segaja kohta riba kohta SSC, Q, J/S, ribasisese J/S ja püsiva C/N0. Valikuline [iq]: mudel joonistatud kompleksse IQ-na ühel hetkel, kirjutatud SigMF-salvestisse (cf32_le või ci16_le) ja sealt tagasi loetud ning võrreldud Welchi hinnanguga. Valikuline [recording] (natiivsed ehitused): tegeliku SigMF-salvestise Welchi PSD mudeli kõrval. VALIDATED: signaalide PSD-d õpikulise peakasti laiuse vastu (BPSK(n) 2n x { "1.023" } MHz nullist nullini; BOC({ "1,1" }) kasti keskmed kohal +/-1.023 MHz) ja spektraalse eraldumise koefitsiendid nende Parsevali kinniste kujude ning Kaplani ja Hegarty Q = { "1" } (CW) ja { "1.5" } (sobitatud) vastu. MODELLED: segajate võimsused, ajajoon, vastuvõtja sisendotsa ribalaiused, pideva spektri (koodijooni ei ole) käsitlus ning AGC, blankimise ja antennidiagrammi puudumine.

# attr:alt
seg-ea1678eb9e84 = Diagramm, mille mootor kirjutab failile scenarios/l-band-waterfall-jamming.toml, liik spectrum

# text
seg-f43fe94d84e0 = Ühendatud RF/mõõtmise spuufimise detektor (mitme SV RAIM-i kooskõla + AGC + SQM, sulatatud) vs parameetritega rünnak (võimsuseelis, kandelaine faasi joondus, aja/asukoha tõukamine; TEXBAT-stiilis).

# attr:alt
seg-268ebf4cba99 = Diagramm, mille mootor kirjutab failile scenarios/spoof-detect.toml, liik spoof-detect

# text
seg-cbd77f6ffd63 = Stohhastiline ajaspuufimise detektor (Neyman–Pearson / χ²₁) Monte Carlo P_fa/P_md-ga.

# attr:alt
seg-6f6a8c975111 = Diagramm, mille mootor kirjutab failile scenarios/spoof-attack.toml, liik spoof

# text
seg-f6ff1c8c78db = Jälgimissilmuse lukustuse kadu: C/N0 -> lukustus/lukustuse vabastus HÜSTEREESIGA, lukustuse kaotamise aeg ning spuufimise sissetõmme koodi ja kandelaine nihke KIIRUSE funktsioonina. Mootori olemasolevad keelamise ja haaramise kriteeriumid on vastuvõetud võimsuse suhted (segaja keelab juures J/S = { "30" } dB, spuufer haarab juures { "3" } dB); tegelik lukustuse kadu ei ole võimsuse suhe, see on koht, kus silmuse värin pluss dünaamiline koormus väljub selle jälgimislävendi eelarvest. Annab aru ({ "1" }) kandelaine (Costas) ja koodi (mittekoherentne varajane/hiline) 1-sigma termilisest värinast versus C/N0, ruutimiskadu kaasa arvatud, nimetatud reeglite { "3" }<em>sigma_PLL + theta_e <= { "45" } deg (15-kraadine reegel kolme sigma kujul) ja { "3" }</em>sigma_DLL + kaldviivitus <= d/2 chipi vastu; ({ "2" }) väljalangemise ja taaslukustumise C/N0 läved koos piirava silmuse nimetamisega, taaslukustumise lävi TULETATUD laiemast ribalaiusest, millega vastuvõtja uuesti sisse tõmbub, mitte väidetud, nii et hüstereesi laius peab jääma vahemikku { "5" }<em>log10(suhe) kuni { "10" }</em>log10(suhe) dB; ({ "3" }) kuulutatud lukustuse kaotamise aeg kahe lävega lukustusdetektorist kinnitusviibimistega, käivitatuna üle C/N0 kallaku, esitatuna eraldi füüsilisest faasipõgenemise ajast (Viterbi keskmine aeg tsüklihüpete vahel, log10 s-ides, sest see ulatub üle sadade dekaadide); ({ "4" }) spuufimise sissetõmbe piirid — suurim koodi libisemine ja kandelaine Doppleri kiirus, mida ohvri silmused suudavad järgida, koos kaardiga mõlema telje kohta, sest spuufer, mis libiseb neist kiiremini, ei haara silmust, vaid jookseb sellest ette; ning ({ "5" }) silmuse dünaamikast tulenev KEELAMISRADIUS esitatud olemasoleva võimsussuhte raadiuse KÕRVAL, mitte kunagi selle asemel, nende märgiga vahe omaette nimetatud väljana (denial_radius_delta_km) ja definitsioon selle kõrval. Iga väljastatud arvuväli kannab ühikut ja päritoluklassi. VALIDATED kinnised kujud: kandelaine ja koodi värina avaldised, silmusefiltri taandus sqrt({ "2" }<em>B_n</em>T) ja esimese järgu kaldviivitus on ristkontrollitud mootori enda sdr korrelaatori vastu, mida sammutatakse edasi algväärtustatud sünteetilisel IF-il — erinev tee samade arvudeni — vastavalt täpsusega { "0.6" } %, { "3.7" } % ja { "0.17" } %, ning tsüklihüppe aja taga olev modifitseeritud Besseli I0 tavaliste tabelväärtuste vastu täpsusega { "1e-7" }. Alumine kehtivuspiir on kinnitatud, mitte ainult nimetatud: alla ~{ "32" } dB-Hz juures { "1" } ms küllastub tegelik atan-diskriminaator oma +-pi/2 vahemiku vastu ja mõõdab väiksemat värinat kui ükski lineaarne teooria. MODELLED: silmuse ribalaiused, integreerimisaeg, korrelaatori vahe, sissetõmbe ribalaiuse suhe, kinnitusviibimised, segaja võimsus ja antennivõimendused on esindusliku riba arvud, mitte andmeleht. EI modelleerita: ostsillaatori (Alani hälbe) ja vibratsiooni värinat, sisendotsa ribalaiuse piiramist, mitmeteeleviivet, AGC dünaamikat, andmebiti ülemineku kadu, välist toetamist ega Costase tsüklihüppe valemi mis tahes poolsüklilist korrektsiooni. Silmuse dünaamika korral ei ole spuufimise haaramisel üldse raadiust — piirav tingimus on nihke kiirus, mitte võimsus — seega on see väli null koos põhjendusega, mitte väljamõeldud arv. Mitte sertifitseeritud vastuvõtja toimivuse toode.

# attr:alt
seg-72182c1aecd9 = Diagramm, mille mootor kirjutab failile scenarios/tracking-loop.toml, liik tracking-loop

# text
seg-4e31c8daf798 = Register (ledger)

# text
seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

# text
seg-63c3a7483268 = { "6" } stsenaariumi liiki mootorist v{ $version }. Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus. Iga siinne silt on mootori või kontrollimaatriksi oma; liik on MODELLED, kui maatriks ei ütle teisiti (kuidas silt teenitakse: README jaotis Evidence).

# text
# c1: docs/kinds/jamming-spoofing-and-the-spectrum.md
seg-f6a18b7cb172 = Source: <c1/>

# text
seg-d4ae70a5d619 = Segamine, spuufimine ja spekter (stsenaariumi liikide perekond)

# text
# c1: kshana scenarios/jamming-demo.toml
seg-b4b8b72e060b = Teemalehed: <a1>SPECTRUM</a1>, <a2>DECEIVED-TIME</a2>, <a3>IQ-FOLLOW</a3>. Käivita üks: <c1/>. Kõik perekonnad: <a4>KINDS.md</a4>.

# attr:alt
seg-cc031b964086 = Kontaktlehe pilt diagrammidest, mille mootor kirjutab perekonna Segamine, spuufimine ja spekter liikide jaoks

# text
seg-bbbd87f888b9 = Jälgimissilmuse lukustuse kadu: C/N0 -> lukustus/lukustuse vabastus HÜSTEREESIGA, lukustuse kaotamise aeg ning spuufimise sissetõmme koodi ja kandelaine nihke KIIRUSE funktsioonina.

# text
seg-e37f1e071b2c = L-riba spektrimudel ja juga-diagramm (waterfall): kogu GNSS-i L-riba ühe võimsusspektri tihedusena (PSD), sagedus risti, aeg allapoole, stsenaariumipõhise segaja ajajoone kohal.

# text
seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

# text
seg-8887d666b4fc = Masinõppel põhinev RF-häirete tuvastuse hindamise katsestend ({ "13494" }): sildistatud, parameetritega põhjendatud SÜNTEETILISE korpuse genereerimine (nominaalne/segamine/aja-spuufimine/asukoha-spuufimine/mitmeteelevi), detektori (energy/agc/s

# text
# c1: seed
# c2: time
# c3: receiver
# c4: constellation
# c5: jammer
# c6: mask_deg
# c7: tracking_threshold_dbhz
# c8: degraded_margin_db
# c9: signal_power_dbw
# c10: temp_k
# c11: freq_hz
# c12: chip_rate_hz
# c13: skyline
seg-f6dcb5b36454 = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>. Valikulised: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

# text
seg-7bb2f42902f0 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>jamming</a1>.

# text
# c1: threshold_ns
# c2: time
# c3: attack
# c4: clock_quantum
# c5: clock_classical
seg-d5f06ff66e1b = Kohustuslikud väljad: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

# text
seg-1bd760afbaca = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>spoof</a1>.

# text
# c1: attack
# c2: satellites
# c3: detector
seg-fb15ecc29f7c = Kohustuslikud väljad: <c1/>. Valikulised: <c2/>, <c3/>.

# text
seg-15c08ee5ae76 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>spoof-detect</a1>.

# text
# c1: pll_bandwidth_hz
# c2: dll_bandwidth_hz
# c3: predetection_integration_s
# c4: correlator_spacing_chips
# c5: carrier_allowance_deg
# c6: code_allowance_chips
# c7: pullin_bandwidth_ratio
# c8: drop_confirm_epochs
# c9: relock_confirm_epochs
# c10: doppler_rate_hz_per_s
# c11: code_slew_chips_per_s
# c12: cn0_high_dbhz
# c13: cn0_low_dbhz
# c14: ramp_duration_s
# c15: jitter_table_cn0_dbhz
# c16: jammer_power_dbw
# c17: jammer_gain_dbi
# c18: rx_gain_toward_jammer_db
# c19: rx_gain_toward_sat_db
# c20: signal_power_dbw
# c21: temp_k
# c22: freq_hz
# c23: chip_rate_hz
# c24: jammer_type
# c25: q_override
# c26: denial_js_threshold_db
# c27: capture_js_threshold_db
# c28: spoof_code_slew_chips_per_s
# c29: spoof_doppler_rate_hz_per_s
seg-c65b9d45bdcc = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>.

# text
seg-bd1b04ccfe22 = <b>Register (ledger):</b> MODELLED. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>tracking-loop</a1>.

# text
# c1: seed
# c2: duration_s
# c3: step_s
# c4: receiver
# c5: grid
# c6: bands
# c7: jammers
# c8: iq
# c9: recording
seg-5024b537d000 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

# text
seg-a73f44c04565 = <b>Register (ledger):</b> MODELLED { "3" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>spectrum</a1>.

# text
# c1: seed
# c2: n_per_class
# c3: nominal_cn0_dbhz
# c4: meas_noise
# c5: detector
# c6: target_pfa
# c7: shift_severity_scale
# c8: optimism_tol
seg-cbcc6f5302b8 = Kohustuslikud väljad: puuduvad. Valikulised: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>.

# text
seg-d14fa8348a2a = <b>Register (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Täielik leht koos sisendite, tulemuste, tõendite ja piirangutega: <a1>impairment-eval</a1>.

# text
seg-5242026d2998 = <s1>Eelmine</s1>Inertsiaal-, liitmis- ja kvantandurid

# text
seg-6b9b04e59491 = <s1>Järgmine</s1>Madala Maa orbiidi navigatsioon
